// grain_match.js — nearest-grain lookup for grain_matcher.maxpat (runs in [v8])
// Matches live input against every grain on pitch, loudness, timbre (MFCC-style
// coefficients, spectral centroid, flatness) and formants (F1, F2).
// Grain entry: [index, f0_hz (0 = unpitched), peak_dbfs, start_ms, end_ms, band_db x NB]
inlets = 1;
outlets = 6; // 0/4: "start a b" -> play~ voice A/B, 1/5: envelope -> line~ voice A/B, 2: match info, 3: "i a0 a1 a2 b1 b2" filter coeffs

var NB = /*NB*/, FLO = /*FLO*/, FHI = /*FHI*/, Q = /*Q*/, NC = 12;
var GRAINS = /*DATA*/;
var N = GRAINS.length;

var CENTERS = new Float64Array(NB), LOGC = new Float64Array(NB), COS = new Float64Array(NC * NB);
for (var k = 0; k < NB; k++) { CENTERS[k] = FLO * Math.pow(FHI / FLO, k / (NB - 1)); LOGC[k] = Math.log(CENTERS[k]) / Math.LN2; }
for (var n = 0; n < NC; n++) for (var k = 0; k < NB; k++) COS[n * NB + k] = Math.cos(Math.PI * (n + 1) * (k + 0.5) / NB);

var gate = -32, offset = 0, useCmn = 1;
var GRAIN_MS = 50, att = 10, rel = 10, voice = 0;
var BUF_MS = GRAINS[N - 1][4];
var W = { f: 1, a: 0.5, t: 1, m: 1 };
var inFreq = 0, lastFreqTime = 0, inAmp = -120;

// reusable scratch buffers (no allocation per tick)
var bandsIn = new Float64Array(NB), Lbuf = new Float64Array(NB), SM = new Float64Array(NB);
var F = { mfcc: new Float64Array(NC), centroid: 0, flatness: 0, f1: 0, f2: 0 };

// ---------- feature extraction (identical for grains and live input) ----------
function features(L, f) { // L = band levels in dB; writes into f
    var n, k, s;
    for (n = 0; n < NC; n++) { s = 0; for (k = 0; k < NB; k++) s += L[k] * COS[n * NB + k]; f.mfcc[n] = s / NB; }
    var num = 0, den = 0, logSum = 0;
    for (k = 0; k < NB; k++) {
        var p = Math.pow(10, L[k] / 10);
        num += p * LOGC[k]; den += p; logSum += Math.log(p + 1e-20);
    }
    f.centroid = num / (den + 1e-20);                         // octaves
    f.flatness = Math.exp(logSum / NB) / (den / NB + 1e-20); // 0..1
    for (k = 0; k < NB; k++) SM[k] = (L[Math.max(k - 1, 0)] + 2 * L[k] + L[Math.min(k + 1, NB - 1)]) / 4;
    f.f1 = peakIn(SM, 250, 1000, 0);
    f.f2 = peakIn(SM, 900, 3000, f.f1 * 1.15);
}

function peakIn(sm, lo, hi, minHz) { // strongest smoothed band in range, interpolated, returns Hz
    var best = -1;
    for (var k = 1; k < NB - 1; k++)
        if (CENTERS[k] >= lo && CENTERS[k] <= hi && CENTERS[k] > minHz && (best < 0 || sm[k] > sm[best])) best = k;
    if (best < 0) return lo;
    var a = sm[best - 1], b = sm[best], c = sm[best + 1], den = a - 2 * b + c;
    var off = den !== 0 ? 0.5 * (a - c) / den : 0;
    off = Math.max(-0.5, Math.min(0.5, off));
    return CENTERS[best] * Math.pow(FHI / FLO, off / (NB - 1));
}

// ---------- corpus: features computed once, stored normalised in flat arrays ----------
var NT = NC + 2;                         // timbre vector: 12 mfcc + centroid + flatness
var GT = new Float64Array(N * NT);       // normalised timbre per grain
var GF1 = new Float64Array(N), GF2 = new Float64Array(N); // normalised log2 formants
var GF0 = new Float64Array(N), GDB = new Float64Array(N), GPITCHED = new Uint8Array(N);
var GF1HZ = new Float64Array(N), GF2HZ = new Float64Array(N);
var mean = new Float64Array(NT + 2), sd = new Float64Array(NT + 2); // [timbre..., f1, f2]
(function () {
    var raw = new Float64Array(N * (NT + 2)), i, j, D = NT + 2;
    for (i = 0; i < N; i++) {
        var g = GRAINS[i];
        for (var k = 0; k < NB; k++) Lbuf[k] = g[5 + k];
        features(Lbuf, F);
        for (j = 0; j < NC; j++) raw[i * D + j] = F.mfcc[j];
        raw[i * D + NC] = F.centroid; raw[i * D + NC + 1] = F.flatness;
        raw[i * D + NT] = Math.log(F.f1) / Math.LN2; raw[i * D + NT + 1] = Math.log(F.f2) / Math.LN2;
        GF1HZ[i] = F.f1; GF2HZ[i] = F.f2;
        GF0[i] = g[1] > 0 ? Math.log(g[1]) / Math.LN2 : 0; GDB[i] = g[2]; GPITCHED[i] = g[1] > 0 ? 1 : 0;
    }
    for (j = 0; j < D; j++) {
        var s = 0, q = 0;
        for (i = 0; i < N; i++) { var v = raw[i * D + j]; s += v; q += v * v; }
        mean[j] = s / N; sd[j] = Math.sqrt(Math.max(q / N - mean[j] * mean[j], 1e-9));
    }
    for (i = 0; i < N; i++) {
        for (j = 0; j < NT; j++) GT[i * NT + j] = (raw[i * D + j] - mean[j]) / sd[j];
        GF1[i] = (raw[i * D + NT] - mean[NT]) / sd[NT];
        GF2[i] = (raw[i * D + NT + 1] - mean[NT + 1]) / sd[NT + 1];
    }
    GRAINS = GRAINS.map(function (g) { return [g[0], g[1], g[2], g[3], g[4]]; }); // drop band data
})();
var TW = new Float64Array(NT); // per-dimension weights: centroid counts double
for (var j = 0; j < NT; j++) TW[j] = (j === NC ? 2 : 1) / (NC + 3);
var liveMean = new Float64Array(NC); for (var j = 0; j < NC; j++) liveMean[j] = mean[j];
var LV = new Float64Array(NT);

// ---------- filter coefficients for the live filterbank ----------
function sr(rate) {
    for (var k = 0; k < NB; k++) {
        var w = 2 * Math.PI * CENTERS[k] / rate, al = Math.sin(w) / (2 * Q), a0 = 1 + al;
        outlet(3, [k, al / a0, 0, -al / a0, -2 * Math.cos(w) / a0, (1 - al) / a0]);
    }
}
function loadbang() { sr(44100); }

// ---------- messages ----------
function freq(f) { if (f > 0) { inFreq = f; lastFreqTime = Date.now(); } }
function amp(db) { inAmp = db; }
function bands() { for (var k = 0; k < NB && k < arguments.length; k++) bandsIn[k] = arguments[k]; }
function band(k, rms) { if (k >= 0 && k < NB) bandsIn[k] = rms; }
function setgate(v) { gate = v; }
function dboffset(v) { offset = v; }
function cmn(v) { useCmn = v ? 1 : 0; }
function fweight(v) { W.f = v; }
function aweight(v) { W.a = v; }
function tweight(v) { W.t = v; }
function mweight(v) { W.m = v; }
function attack(v) { att = Math.max(0.5, Math.min(GRAIN_MS, v)); }
function release(v) { rel = Math.max(0.5, Math.min(GRAIN_MS, v)); } // <= grain length so a voice is free again in time

function tick() {
    var a = inAmp + offset;
    if (a < gate) return; // input below the gate: ignore
    var pitched = (Date.now() - lastFreqTime) < 100 ? 1 : 0;
    var k, j, i;
    for (k = 0; k < NB; k++) Lbuf[k] = 10 * Math.log(bandsIn[k] * bandsIn[k] + 1e-12) / Math.LN10 + offset;
    features(Lbuf, F);
    for (j = 0; j < NC; j++) {
        liveMean[j] += 0.01 * (F.mfcc[j] - liveMean[j]); // ~5 s memory
        LV[j] = (F.mfcc[j] - (useCmn ? liveMean[j] : mean[j])) / sd[j];
    }
    LV[NC] = (F.centroid - mean[NC]) / sd[NC];
    LV[NC + 1] = (F.flatness - mean[NC + 1]) / sd[NC + 1];
    var lf1 = (Math.log(F.f1) / Math.LN2 - mean[NT]) / sd[NT];
    var lf2 = (Math.log(F.f2) / Math.LN2 - mean[NT + 1]) / sd[NT + 1];
    var lf0 = pitched ? Math.log(inFreq) / Math.LN2 : 0;
    var wa = W.a / 144, wt = W.t, wf = W.f, wm = W.m / 2;

    var best = -1, bestD = 1e30;
    for (i = 0; i < N; i++) {
        if (GPITCHED[i] !== pitched) continue; // pitched input -> pitched grains, noise -> noise
        var da = a - GDB[i], d = wa * da * da, dt = 0, base = i * NT;
        for (j = 0; j < NT; j++) { var x = LV[j] - GT[base + j]; dt += TW[j] * x * x; }
        d += wt * dt;
        if (pitched) {
            var dp = lf0 - GF0[i], d1 = lf1 - GF1[i], d2 = lf2 - GF2[i];
            d += wf * dp * dp + wm * (d1 * d1 + d2 * d2);
        }
        if (d < bestD) { bestD = d; best = i; }
    }
    if (best < 0) return;
    var b = GRAINS[best];
    outlet(2, [b[0], b[1], b[2], Math.round(GF1HZ[best]), Math.round(GF2HZ[best]),
               pitched ? Math.round(inFreq * 100) / 100 : 0, Math.round(a * 10) / 10, Math.round(F.f1), Math.round(F.f2)]);
    // alternate voices: this grain fades in while the previous one fades out.
    // It keeps playing past its end (into the following source audio) for the release.
    var hold = Math.max(0, GRAIN_MS - att);
    var end = Math.min(b[3] + att + hold + rel, BUF_MS);
    var envOut = voice ? 5 : 1, playOut = voice ? 4 : 0;
    outlet(envOut, [1, att, 1, hold, 0, rel]);
    outlet(playOut, ["start", b[3], end]);
    voice = 1 - voice;
}
