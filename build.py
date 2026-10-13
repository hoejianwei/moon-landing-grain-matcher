"""Build the grain corpus for grain_matcher.maxpat from any audio file.

    python build.py <audio file> [--grain-ms 50] [--export-grains <dir>]

Writes, next to this script:
  grains.wav       the audio at 44.1 kHz mono (grain N = [(N-1)*grain_ms, N*grain_ms) ms)
  grain_match.js   per-grain pitch, peak level and 40-band spectrum for the matcher
With --export-grains, also writes every grain as its own WAV, named
<index>_<dominant Hz>_<peak dBFS>dB.wav, plus samples.csv with the measurements.
"""
import argparse, csv, json, os
import numpy as np, librosa, soundfile as sf
from scipy.signal import lfilter

SR = 44100
# 40 log-spaced RBJ band-pass biquads, 80 Hz - 8 kHz; must match grain_match_template.js
NB, FLO, FHI, Q = 40, 80.0, 8000.0, 6.0
CENTERS = FLO * (FHI / FLO) ** (np.arange(NB) / (NB - 1))
HERE = os.path.dirname(os.path.abspath(__file__))


def bandpass(fc, sr):
    w = 2 * np.pi * fc / sr; al = np.sin(w) / (2 * Q); a0 = 1 + al
    return np.array([al, 0, -al]) / a0, np.array([1, -2 * np.cos(w) / a0, (1 - al) / a0])


def dominant_hz(x, nfft=1 << 16):
    """Strongest FFT peak, parabolic-interpolated; None for digital silence."""
    if not np.any(x):
        return None
    X = np.abs(np.fft.rfft((x - x.mean()) * np.hanning(len(x)), nfft)); X[0] = 0
    k = int(np.argmax(X))
    if 0 < k < len(X) - 1:
        a, b, c = np.log(X[k - 1:k + 2] + 1e-20)
        k = k + 0.5 * (a - c) / (a - 2 * b + c)
    return k * SR / nfft


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("audio")
    ap.add_argument("--grain-ms", type=float, default=50)
    ap.add_argument("--export-grains")
    args = ap.parse_args()

    y, _ = librosa.load(args.audio, sr=SR, mono=True)
    n = int(SR * args.grain_ms / 1000)
    starts = list(range(0, len(y), n))
    sf.write(os.path.join(HERE, "grains.wav"), y, SR, subtype="PCM_24")

    # fundamental per grain (pYIN), comparable with fzero~ in Max
    hop = 128
    f0, voiced, _ = librosa.pyin(y, fmin=50, fmax=1000, sr=SR, frame_length=2048, hop_length=hop)
    t = librosa.frames_to_samples(np.arange(len(f0)), hop_length=hop)
    # band levels per grain, filtering the whole signal continuously like the live filterbank
    filtered = [lfilter(*bandpass(fc, SR), y) for fc in CENTERS]

    data, rows = [], []
    for i, s in enumerate(starts, 1):
        e = min(s + n, len(y)); x = y[s:e]
        peak = float(np.max(np.abs(x)))
        pk = 20 * np.log10(peak) if peak > 0 else -120.0
        m = (t >= s) & (t < e) & voiced & ~np.isnan(f0)
        fund = round(float(np.median(f0[m])), 2) if m.any() else 0
        bands = [round(10 * np.log10(np.mean(z[s:e] ** 2) + 1e-12), 1) for z in filtered]
        data.append([i, fund, round(pk, 2), round(s / SR * 1000, 3), round(e / SR * 1000, 3)] + bands)
        if args.export_grains:
            hz = dominant_hz(x)
            name = f"{i:04d}_{f'{hz:.2f}Hz' if hz else 'silence'}_{'-inf' if peak == 0 else f'{pk:.1f}'}dB.wav"
            os.makedirs(args.export_grains, exist_ok=True)
            sf.write(os.path.join(args.export_grains, name), x, SR, subtype="PCM_24")
            rms = float(np.sqrt(np.mean(x ** 2)))
            rows.append(dict(index=i, file=name, start_s=round(s / SR, 5), end_s=round(e / SR, 5),
                             duration_ms=round(len(x) / SR * 1000, 2), frequency_hz=round(hz, 2) if hz else "",
                             peak_dbfs=round(pk, 2) if peak > 0 else "-inf",
                             rms_dbfs=round(20 * np.log10(rms), 2) if rms > 0 else "-inf", peak_linear=round(peak, 6)))

    tpl = open(os.path.join(HERE, "grain_match_template.js")).read()
    for k, v in (("NB", NB), ("FLO", FLO), ("FHI", FHI), ("Q", Q)):
        tpl = tpl.replace(f"/*{k}*/", str(v))
    open(os.path.join(HERE, "grain_match.js"), "w").write(tpl.replace("/*DATA*/", json.dumps(data, separators=(",", ":"))))
    if rows:
        with open(os.path.join(args.export_grains, "samples.csv"), "w", newline="") as fh:
            w = csv.DictWriter(fh, fieldnames=rows[0].keys()); w.writeheader(); w.writerows(rows)
    print(f"{len(data)} grains of {args.grain_ms:g} ms, {sum(1 for d in data if d[1] > 0)} pitched")


if __name__ == "__main__":
    main()
