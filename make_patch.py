import json, sys
NB = 40
def mk():
    P = {"boxes": [], "lines": []}
    def box(id, cls, x, y, w, h, text=None, ni=1, no=0, ot=None, **kw):
        b = {"id": id, "maxclass": cls, "patching_rect": [x, y, w, h], "numinlets": ni, "numoutlets": no}
        if ot is not None: b["outlettype"] = ot
        if text is not None: b["text"] = text
        b.update(kw); P["boxes"].append({"box": b})
    def obj(id, text, x, y, ni, no, ot, w=None, **kw): box(id, "newobj", x, y, w or max(40, 7 * len(text) + 14), 22, text, ni, no, ot, **kw)
    def com(id, text, x, y, w=300, h=22, **kw): box(id, "comment", x, y, w, h, text, 1, 0, None, **kw)
    def msg(id, text, x, y, w=None): box(id, "message", x, y, w or max(40, 7 * len(text) + 14), 22, text, 2, 1, [""])
    def num(id, x, y): box(id, "flonum", x, y, 60, 22, None, 1, 2, ["", "bang"], parameter_enable=0)
    def wire(a, ao, b, bi): P["lines"].append({"patchline": {"source": [a, ao], "destination": [b, bi]}})
    return P, box, obj, com, msg, num, wire

# ---- analysis subpatcher: 40-band filterbank ----
A, abox, aobj, acom, amsg, anum, awire = mk()
abox("in_sig", "inlet", 20, 10, 30, 30, None, 0, 1, ["signal"], comment="audio in")
abox("in_coef", "inlet", 300, 10, 30, 30, None, 0, 1, [""], comment="filter coefficients")
abox("in_bang", "inlet", 600, 10, 30, 30, None, 0, 1, ["bang"], comment="bang = report band levels")
abox("out", "outlet", 20, 360, 30, 30, None, 1, 0, None, comment="bands <rms x 40>")
aobj("route", "route " + " ".join(map(str, range(NB))), 300, 50, 1, NB + 1, [""] * (NB + 1), w=900)
awire("in_coef", 0, "route", 0)
# one bang -> band 0 snapshot fires last (hot inlet of pack), so one list per tick
aobj("tbb", "t b b", 600, 50, 1, 2, ["bang", "bang"], w=50)
aobj("pack", "pack " + " ".join(["0."] * NB), 20, 280, NB, 1, [""], w=NB * 110)
aobj("pbands", "prepend bands", 20, 320, 1, 1, [""], w=100)
awire("in_bang", 0, "tbb", 0)
for k in range(NB):
    x = 20 + k * 110
    aobj(f"bq{k}", "biquad~", x, 120, 6, 1, ["signal"], w=60)
    aobj(f"av{k}", "average~ 2205 rms", x, 160, 2, 1, ["signal"], w=105)
    aobj(f"sn{k}", "snapshot~", x, 200, 2, 1, ["float"], w=70)
    awire("in_sig", 0, f"bq{k}", 0); awire("route", k, f"bq{k}", 0)
    awire(f"bq{k}", 0, f"av{k}", 0); awire(f"av{k}", 0, f"sn{k}", 0)
    awire("tbb", 0 if k == 0 else 1, f"sn{k}", 0); awire(f"sn{k}", 0, "pack", k)
awire("pack", 0, "pbands", 0); awire("pbands", 0, "out", 0)

# ---- main patch ----
P, box, obj, com, msg, num, wire = mk()
com("title", "GRAIN MATCHER — mic in -> nearest 50 ms Moon Landing grain out (pitch + loudness + timbre + formants)", 20, 10, 760, 24, fontsize=14, fontface=1)
com("c1", "1. turn audio on", 20, 40, 120)
box("ezdac", "ezdac~", 20, 62, 45, 45, None, 2, 0, [])
obj("adc", "adc~ 1", 160, 70, 1, 1, ["signal"])
obj("fz", "fzero~", 160, 120, 1, 3, ["float", "float", "bang"])
obj("sl", "speedlim 25", 160, 150, 2, 1, [""], w=80)
obj("pk", "peakamp~", 300, 120, 2, 1, ["float"])
obj("atodb", "atodb", 300, 150, 1, 1, [""])
num("freqnum", 160, 180); com("c2", "input Hz", 222, 180, 70)
num("ampnum", 300, 180); com("c3", "input dB", 362, 180, 70)
obj("pfreq", "prepend freq", 160, 220, 1, 1, [""])
obj("pamp", "prepend amp", 300, 220, 1, 1, [""])
obj("lb", "loadbang", 20, 130, 1, 1, ["bang"])
obj("metro", "metro 50", 20, 160, 2, 1, ["bang"])
obj("tbb", "t b b", 20, 190, 1, 2, ["bang", "bang"])
msg("tick", "tick", 20, 260)
box("ana", "newobj", 420, 230, 160, 22, "p analysis", 3, 1, [""],
    patcher={"fileversion": 1, "appversion": {"major": 9, "minor": 0, "revision": 0, "architecture": "x64", "modernui": 1},
             "classnamespace": "box", "rect": [50, 50, 1400, 420], "boxes": A["boxes"], "lines": A["lines"]})
com("c10", "<- 40-band filterbank (double-click)", 585, 230, 230)
obj("dsp", "dspstate~", 600, 270, 1, 4, ["int", "float", "int", "int"])
obj("psr", "prepend sr", 600, 300, 1, 1, [""])

com("c4", "settings (optional)", 460, 40, 160)
sets = [("gate", "setgate", "silence gate dB (default -32)"), ("fw", "fweight", "pitch weight (default 1)"),
        ("aw", "aweight", "loudness weight (default 0.5)"), ("tw", "tweight", "timbre weight (default 1)"),
        ("mw", "mweight", "formant weight (default 1)"), ("off", "dboffset", "input level trim dB (default 0)")]
for i, (id, m, label) in enumerate(sets):
    y = 62 + i * 26
    num(id, 460, y); obj("p" + id, "prepend " + m, 530, y, 1, 1, [""], w=120); com("c" + id, label, 655, y, 220)
box("cmntog", "toggle", 460, 62 + 6 * 26, 22, 22, None, 1, 1, ["int"], parameter_enable=0)
obj("pcmn", "prepend cmn", 530, 62 + 6 * 26, 1, 1, [""], w=120)
com("ccmn", "mic-colour compensation (default on)", 655, 62 + 6 * 26, 230)

obj("js", "v8 grain_match.js", 160, 330, 1, 6, [""] * 6, w=520)
obj("buf", "buffer~ grains grains.wav", 720, 330, 1, 2, ["float", "bang"])
# two alternating voices, plain linear line~ envelopes
for v, x in (("A", 160), ("B", 300)):
    obj("play" + v, "play~ grains 1", x, 380, 2, 2, ["signal", "signal"])
    obj("line" + v, "line~", x + 70, 410, 2, 2, ["signal", "bang"])
    obj("vca" + v, "*~", x, 450, 2, 1, ["signal"])
obj("dac", "dac~ 1 2", 160, 500, 2, 0, [])
num("att", 460, 62 + 7 * 26); obj("patt", "prepend attack", 530, 62 + 7 * 26, 1, 1, [""], w=120); com("catt", "attack ms (default 10)", 655, 62 + 7 * 26, 220)
num("rel", 460, 62 + 8 * 26); obj("prel", "prepend release", 530, 62 + 8 * 26, 1, 1, [""], w=120); com("crel", "release ms, max 50 (default 10)", 655, 62 + 8 * 26, 220)
obj("pset", "prepend set", 460, 380, 1, 1, [""])
msg("info", "", 460, 410, 420)
com("c9", "matched: grain#  grain-Hz  grain-dB  grain-F1  grain-F2 | input-Hz  input-dB  input-F1  input-F2", 460, 435, 560)

wire("adc", 0, "fz", 0); wire("adc", 0, "pk", 0); wire("adc", 0, "ana", 0)
wire("fz", 0, "sl", 0); wire("sl", 0, "freqnum", 0); wire("freqnum", 0, "pfreq", 0); wire("pfreq", 0, "js", 0)
wire("pk", 0, "atodb", 0); wire("atodb", 0, "ampnum", 0); wire("ampnum", 0, "pamp", 0); wire("pamp", 0, "js", 0)
wire("lb", 0, "metro", 0); wire("metro", 0, "tbb", 0)
wire("tbb", 1, "pk", 0); wire("tbb", 1, "ana", 2); wire("tbb", 0, "tick", 0); wire("tick", 0, "js", 0)
wire("ana", 0, "js", 0); wire("js", 3, "ana", 1)
wire("dsp", 1, "psr", 0); wire("psr", 0, "js", 0)
for id, m, _ in sets: wire(id, 0, "p" + id, 0); wire("p" + id, 0, "js", 0)
msg("one", "1", 420, 62 + 6 * 26 - 26)
wire("lb", 0, "one", 0); wire("one", 0, "cmntog", 0)
wire("cmntog", 0, "pcmn", 0); wire("pcmn", 0, "js", 0)
for v, po, eo in (("A", 0, 1), ("B", 4, 5)):
    wire("js", po, "play" + v, 0); wire("js", eo, "line" + v, 0)
    wire("play" + v, 0, "vca" + v, 0); wire("line" + v, 0, "vca" + v, 1)
    wire("vca" + v, 0, "dac", 0); wire("vca" + v, 0, "dac", 1)
wire("js", 2, "pset", 0); wire("pset", 0, "info", 0)
wire("att", 0, "patt", 0); wire("patt", 0, "js", 0)
wire("rel", 0, "prel", 0); wire("prel", 0, "js", 0)

json.dump({"patcher": {"fileversion": 1, "appversion": {"major": 9, "minor": 0, "revision": 0, "architecture": "x64", "modernui": 1},
    "classnamespace": "box", "rect": [100, 100, 960, 600], "default_fontsize": 12.0,
    "boxes": P["boxes"], "lines": P["lines"]}}, open(sys.argv[1], "w"), indent=1)
