{
 "patcher": {
  "fileversion": 1,
  "appversion": {
   "major": 9,
   "minor": 0,
   "revision": 0,
   "architecture": "x64",
   "modernui": 1
  },
  "classnamespace": "box",
  "rect": [
   100,
   100,
   960,
   600
  ],
  "default_fontsize": 12.0,
  "boxes": [
   {
    "box": {
     "id": "title",
     "maxclass": "comment",
     "patching_rect": [
      20,
      10,
      760,
      24
     ],
     "numinlets": 1,
     "numoutlets": 0,
     "text": "GRAIN MATCHER \u2014 mic in -> nearest 50 ms Moon Landing grain out (pitch + loudness + timbre + formants)",
     "fontsize": 14,
     "fontface": 1
    }
   },
   {
    "box": {
     "id": "c1",
     "maxclass": "comment",
     "patching_rect": [
      20,
      40,
      120,
      22
     ],
     "numinlets": 1,
     "numoutlets": 0,
     "text": "1. turn audio on"
    }
   },
   {
    "box": {
     "id": "ezdac",
     "maxclass": "ezdac~",
     "patching_rect": [
      20,
      62,
      45,
      45
     ],
     "numinlets": 2,
     "numoutlets": 0,
     "outlettype": []
    }
   },
   {
    "box": {
     "id": "adc",
     "maxclass": "newobj",
     "patching_rect": [
      160,
      70,
      56,
      22
     ],
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      "signal"
     ],
     "text": "adc~ 1"
    }
   },
   {
    "box": {
     "id": "fz",
     "maxclass": "newobj",
     "patching_rect": [
      160,
      120,
      56,
      22
     ],
     "numinlets": 1,
     "numoutlets": 3,
     "outlettype": [
      "float",
      "float",
      "bang"
     ],
     "text": "fzero~"
    }
   },
   {
    "box": {
     "id": "sl",
     "maxclass": "newobj",
     "patching_rect": [
      160,
      150,
      80,
      22
     ],
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "text": "speedlim 25"
    }
   },
   {
    "box": {
     "id": "pk",
     "maxclass": "newobj",
     "patching_rect": [
      300,
      120,
      70,
      22
     ],
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      "float"
     ],
     "text": "peakamp~"
    }
   },
   {
    "box": {
     "id": "atodb",
     "maxclass": "newobj",
     "patching_rect": [
      300,
      150,
      49,
      22
     ],
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "text": "atodb"
    }
   },
   {
    "box": {
     "id": "freqnum",
     "maxclass": "flonum",
     "patching_rect": [
      160,
      180,
      60,
      22
     ],
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "bang"
     ],
     "parameter_enable": 0
    }
   },
   {
    "box": {
     "id": "c2",
     "maxclass": "comment",
     "patching_rect": [
      222,
      180,
      70,
      22
     ],
     "numinlets": 1,
     "numoutlets": 0,
     "text": "input Hz"
    }
   },
   {
    "box": {
     "id": "ampnum",
     "maxclass": "flonum",
     "patching_rect": [
      300,
      180,
      60,
      22
     ],
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "bang"
     ],
     "parameter_enable": 0
    }
   },
   {
    "box": {
     "id": "c3",
     "maxclass": "comment",
     "patching_rect": [
      362,
      180,
      70,
      22
     ],
     "numinlets": 1,
     "numoutlets": 0,
     "text": "input dB"
    }
   },
   {
    "box": {
     "id": "pfreq",
     "maxclass": "newobj",
     "patching_rect": [
      160,
      220,
      98,
      22
     ],
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "text": "prepend freq"
    }
   },
   {
    "box": {
     "id": "pamp",
     "maxclass": "newobj",
     "patching_rect": [
      300,
      220,
      91,
      22
     ],
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "text": "prepend amp"
    }
   },
   {
    "box": {
     "id": "lb",
     "maxclass": "newobj",
     "patching_rect": [
      20,
      130,
      70,
      22
     ],
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      "bang"
     ],
     "text": "loadbang"
    }
   },
   {
    "box": {
     "id": "metro",
     "maxclass": "newobj",
     "patching_rect": [
      20,
      160,
      70,
      22
     ],
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      "bang"
     ],
     "text": "metro 50"
    }
   },
   {
    "box": {
     "id": "tbb",
     "maxclass": "newobj",
     "patching_rect": [
      20,
      190,
      49,
      22
     ],
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "bang",
      "bang"
     ],
     "text": "t b b"
    }
   },
   {
    "box": {
     "id": "tick",
     "maxclass": "message",
     "patching_rect": [
      20,
      260,
      42,
      22
     ],
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "text": "tick"
    }
   },
   {
    "box": {
     "id": "ana",
     "maxclass": "newobj",
     "patching_rect": [
      420,
      230,
      160,
      22
     ],
     "numinlets": 3,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "text": "p analysis",
     "patcher": {
      "fileversion": 1,
      "appversion": {
       "major": 9,
       "minor": 0,
       "revision": 0,
       "architecture": "x64",
       "modernui": 1
      },
      "classnamespace": "box",
      "rect": [
       50,
       50,
       1400,
       420
      ],
      "boxes": [
       {
        "box": {
         "id": "in_sig",
         "maxclass": "inlet",
         "patching_rect": [
          20,
          10,
          30,
          30
         ],
         "numinlets": 0,
         "numoutlets": 1,
         "outlettype": [
          "signal"
         ],
         "comment": "audio in"
        }
       },
       {
        "box": {
         "id": "in_coef",
         "maxclass": "inlet",
         "patching_rect": [
          300,
          10,
          30,
          30
         ],
         "numinlets": 0,
         "numoutlets": 1,
         "outlettype": [
          ""
         ],
         "comment": "filter coefficients"
        }
       },
       {
        "box": {
         "id": "in_bang",
         "maxclass": "inlet",
         "patching_rect": [
          600,
          10,
          30,
          30
         ],
         "numinlets": 0,
         "numoutlets": 1,
         "outlettype": [
          "bang"
         ],
         "comment": "bang = report band levels"
        }
       },
       {
        "box": {
         "id": "out",
         "maxclass": "outlet",
         "patching_rect": [
          20,
          360,
          30,
          30
         ],
         "numinlets": 1,
         "numoutlets": 0,
         "comment": "bands <rms x 40>"
        }
       },
       {
        "box": {
         "id": "route",
         "maxclass": "newobj",
         "patching_rect": [
          300,
          50,
          900,
          22
         ],
         "numinlets": 1,
         "numoutlets": 41,
         "outlettype": [
          "",
          "",
          "",
          "",
          "",
          "",
          "",
          "",
          "",
          "",
          "",
          "",
          "",
          "",
          "",
          "",
          "",
          "",
          "",
          "",
          "",
          "",
          "",
          "",
          "",
          "",
          "",
          "",
          "",
          "",
          "",
          "",
          "",
          "",
          "",
          "",
          "",
          "",
          "",
          "",
          ""
         ],
         "text": "route 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39"
        }
       },
       {
        "box": {
         "id": "tbb",
         "maxclass": "newobj",
         "patching_rect": [
          600,
          50,
          50,
          22
         ],
         "numinlets": 1,
         "numoutlets": 2,
         "outlettype": [
          "bang",
          "bang"
         ],
         "text": "t b b"
        }
       },
       {
        "box": {
         "id": "pack",
         "maxclass": "newobj",
         "patching_rect": [
          20,
          280,
          4400,
          22
         ],
         "numinlets": 40,
         "numoutlets": 1,
         "outlettype": [
          ""
         ],
         "text": "pack 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0."
        }
       },
       {
        "box": {
         "id": "pbands",
         "maxclass": "newobj",
         "patching_rect": [
          20,
          320,
          100,
          22
         ],
         "numinlets": 1,
         "numoutlets": 1,
         "outlettype": [
          ""
         ],
         "text": "prepend bands"
        }
       },
       {
        "box": {
         "id": "bq0",
         "maxclass": "newobj",
         "patching_rect": [
          20,
          120,
          60,
          22
         ],
         "numinlets": 6,
         "numoutlets": 1,
         "outlettype": [
          "signal"
         ],
         "text": "biquad~"
        }
       },
       {
        "box": {
         "id": "av0",
         "maxclass": "newobj",
         "patching_rect": [
          20,
          160,
          105,
          22
         ],
         "numinlets": 2,
         "numoutlets": 1,
         "outlettype": [
          "signal"
         ],
         "text": "average~ 2205 rms"
        }
       },
       {
        "box": {
         "id": "sn0",
         "maxclass": "newobj",
         "patching_rect": [
          20,
          200,
          70,
          22
         ],
         "numinlets": 2,
         "numoutlets": 1,
         "outlettype": [
          "float"
         ],
         "text": "snapshot~"
        }
       },
       {
        "box": {
         "id": "bq1",
         "maxclass": "newobj",
         "patching_rect": [
          130,
          120,
          60,
          22
         ],
         "numinlets": 6,
         "numoutlets": 1,
         "outlettype": [
          "signal"
         ],
         "text": "biquad~"
        }
       },
       {
        "box": {
         "id": "av1",
         "maxclass": "newobj",
         "patching_rect": [
          130,
          160,
          105,
          22
         ],
         "numinlets": 2,
         "numoutlets": 1,
         "outlettype": [
          "signal"
         ],
         "text": "average~ 2205 rms"
        }
       },
       {
        "box": {
         "id": "sn1",
         "maxclass": "newobj",
         "patching_rect": [
          130,
          200,
          70,
          22
         ],
         "numinlets": 2,
         "numoutlets": 1,
         "outlettype": [
          "float"
         ],
         "text": "snapshot~"
        }
       },
       {
        "box": {
         "id": "bq2",
         "maxclass": "newobj",
         "patching_rect": [
          240,
          120,
          60,
          22
         ],
         "numinlets": 6,
         "numoutlets": 1,
         "outlettype": [
          "signal"
         ],
         "text": "biquad~"
        }
       },
       {
        "box": {
         "id": "av2",
         "maxclass": "newobj",
         "patching_rect": [
          240,
          160,
          105,
          22
         ],
         "numinlets": 2,
         "numoutlets": 1,
         "outlettype": [
          "signal"
         ],
         "text": "average~ 2205 rms"
        }
       },
       {
        "box": {
         "id": "sn2",
         "maxclass": "newobj",
         "patching_rect": [
          240,
          200,
          70,
          22
         ],
         "numinlets": 2,
         "numoutlets": 1,
         "outlettype": [
          "float"
         ],
         "text": "snapshot~"
        }
       },
       {
        "box": {
         "id": "bq3",
         "maxclass": "newobj",
         "patching_rect": [
          350,
          120,
          60,
          22
         ],
         "numinlets": 6,
         "numoutlets": 1,
         "outlettype": [
          "signal"
         ],
         "text": "biquad~"
        }
       },
       {
        "box": {
         "id": "av3",
         "maxclass": "newobj",
         "patching_rect": [
          350,
          160,
          105,
          22
         ],
         "numinlets": 2,
         "numoutlets": 1,
         "outlettype": [
          "signal"
         ],
         "text": "average~ 2205 rms"
        }
       },
       {
        "box": {
         "id": "sn3",
         "maxclass": "newobj",
         "patching_rect": [
          350,
          200,
          70,
          22
         ],
         "numinlets": 2,
         "numoutlets": 1,
         "outlettype": [
          "float"
         ],
         "text": "snapshot~"
        }
       },
       {
        "box": {
         "id": "bq4",
         "maxclass": "newobj",
         "patching_rect": [
          460,
          120,
          60,
          22
         ],
         "numinlets": 6,
         "numoutlets": 1,
         "outlettype": [
          "signal"
         ],
         "text": "biquad~"
        }
       },
       {
        "box": {
         "id": "av4",
         "maxclass": "newobj",
         "patching_rect": [
          460,
          160,
          105,
          22
         ],
         "numinlets": 2,
         "numoutlets": 1,
         "outlettype": [
          "signal"
         ],
         "text": "average~ 2205 rms"
        }
       },
       {
        "box": {
         "id": "sn4",
         "maxclass": "newobj",
         "patching_rect": [
          460,
          200,
          70,
          22
         ],
         "numinlets": 2,
         "numoutlets": 1,
         "outlettype": [
          "float"
         ],
         "text": "snapshot~"
        }
       },
       {
        "box": {
         "id": "bq5",
         "maxclass": "newobj",
         "patching_rect": [
          570,
          120,
          60,
          22
         ],
         "numinlets": 6,
         "numoutlets": 1,
         "outlettype": [
          "signal"
         ],
         "text": "biquad~"
        }
       },
       {
        "box": {
         "id": "av5",
         "maxclass": "newobj",
         "patching_rect": [
          570,
          160,
          105,
          22
         ],
         "numinlets": 2,
         "numoutlets": 1,
         "outlettype": [
          "signal"
         ],
         "text": "average~ 2205 rms"
        }
       },
       {
        "box": {
         "id": "sn5",
         "maxclass": "newobj",
         "patching_rect": [
          570,
          200,
          70,
          22
         ],
         "numinlets": 2,
         "numoutlets": 1,
         "outlettype": [
          "float"
         ],
         "text": "snapshot~"
        }
       },
       {
        "box": {
         "id": "bq6",
         "maxclass": "newobj",
         "patching_rect": [
          680,
          120,
          60,
          22
         ],
         "numinlets": 6,
         "numoutlets": 1,
         "outlettype": [
          "signal"
         ],
         "text": "biquad~"
        }
       },
       {
        "box": {
         "id": "av6",
         "maxclass": "newobj",
         "patching_rect": [
          680,
          160,
          105,
          22
         ],
         "numinlets": 2,
         "numoutlets": 1,
         "outlettype": [
          "signal"
         ],
         "text": "average~ 2205 rms"
        }
       },
       {
        "box": {
         "id": "sn6",
         "maxclass": "newobj",
         "patching_rect": [
          680,
          200,
          70,
          22
         ],
         "numinlets": 2,
         "numoutlets": 1,
         "outlettype": [
          "float"
         ],
         "text": "snapshot~"
        }
       },
       {
        "box": {
         "id": "bq7",
         "maxclass": "newobj",
         "patching_rect": [
          790,
          120,
          60,
          22
         ],
         "numinlets": 6,
         "numoutlets": 1,
         "outlettype": [
          "signal"
         ],
         "text": "biquad~"
        }
       },
       {
        "box": {
         "id": "av7",
         "maxclass": "newobj",
         "patching_rect": [
          790,
          160,
          105,
          22
         ],
         "numinlets": 2,
         "numoutlets": 1,
         "outlettype": [
          "signal"
         ],
         "text": "average~ 2205 rms"
        }
       },
       {
        "box": {
         "id": "sn7",
         "maxclass": "newobj",
         "patching_rect": [
          790,
          200,
          70,
          22
         ],
         "numinlets": 2,
         "numoutlets": 1,
         "outlettype": [
          "float"
         ],
         "text": "snapshot~"
        }
       },
       {
        "box": {
         "id": "bq8",
         "maxclass": "newobj",
         "patching_rect": [
          900,
          120,
          60,
          22
         ],
         "numinlets": 6,
         "numoutlets": 1,
         "outlettype": [
          "signal"
         ],
         "text": "biquad~"
        }
       },
       {
        "box": {
         "id": "av8",
         "maxclass": "newobj",
         "patching_rect": [
          900,
          160,
          105,
          22
         ],
         "numinlets": 2,
         "numoutlets": 1,
         "outlettype": [
          "signal"
         ],
         "text": "average~ 2205 rms"
        }
       },
       {
        "box": {
         "id": "sn8",
         "maxclass": "newobj",
         "patching_rect": [
          900,
          200,
          70,
          22
         ],
         "numinlets": 2,
         "numoutlets": 1,
         "outlettype": [
          "float"
         ],
         "text": "snapshot~"
        }
       },
       {
        "box": {
         "id": "bq9",
         "maxclass": "newobj",
         "patching_rect": [
          1010,
          120,
          60,
          22
         ],
         "numinlets": 6,
         "numoutlets": 1,
         "outlettype": [
          "signal"
         ],
         "text": "biquad~"
        }
       },
       {
        "box": {
         "id": "av9",
         "maxclass": "newobj",
         "patching_rect": [
          1010,
          160,
          105,
          22
         ],
         "numinlets": 2,
         "numoutlets": 1,
         "outlettype": [
          "signal"
         ],
         "text": "average~ 2205 rms"
        }
       },
       {
        "box": {
         "id": "sn9",
         "maxclass": "newobj",
         "patching_rect": [
          1010,
          200,
          70,
          22
         ],
         "numinlets": 2,
         "numoutlets": 1,
         "outlettype": [
          "float"
         ],
         "text": "snapshot~"
        }
       },
       {
        "box": {
         "id": "bq10",
         "maxclass": "newobj",
         "patching_rect": [
          1120,
          120,
          60,
          22
         ],
         "numinlets": 6,
         "numoutlets": 1,
         "outlettype": [
          "signal"
         ],
         "text": "biquad~"
        }
       },
       {
        "box": {
         "id": "av10",
         "maxclass": "newobj",
         "patching_rect": [
          1120,
          160,
          105,
          22
         ],
         "numinlets": 2,
         "numoutlets": 1,
         "outlettype": [
          "signal"
         ],
         "text": "average~ 2205 rms"
        }
       },
       {
        "box": {
         "id": "sn10",
         "maxclass": "newobj",
         "patching_rect": [
          1120,
          200,
          70,
          22
         ],
         "numinlets": 2,
         "numoutlets": 1,
         "outlettype": [
          "float"
         ],
         "text": "snapshot~"
        }
       },
       {
        "box": {
         "id": "bq11",
         "maxclass": "newobj",
         "patching_rect": [
          1230,
          120,
          60,
          22
         ],
         "numinlets": 6,
         "numoutlets": 1,
         "outlettype": [
          "signal"
         ],
         "text": "biquad~"
        }
       },
       {
        "box": {
         "id": "av11",
         "maxclass": "newobj",
         "patching_rect": [
          1230,
          160,
          105,
          22
         ],
         "numinlets": 2,
         "numoutlets": 1,
         "outlettype": [
          "signal"
         ],
         "text": "average~ 2205 rms"
        }
       },
       {
        "box": {
         "id": "sn11",
         "maxclass": "newobj",
         "patching_rect": [
          1230,
          200,
          70,
          22
         ],
         "numinlets": 2,
         "numoutlets": 1,
         "outlettype": [
          "float"
         ],
         "text": "snapshot~"
        }
       },
       {
        "box": {
         "id": "bq12",
         "maxclass": "newobj",
         "patching_rect": [
          1340,
          120,
          60,
          22
         ],
         "numinlets": 6,
         "numoutlets": 1,
         "outlettype": [
          "signal"
         ],
         "text": "biquad~"
        }
       },
       {
        "box": {
         "id": "av12",
         "maxclass": "newobj",
         "patching_rect": [
          1340,
          160,
          105,
          22
         ],
         "numinlets": 2,
         "numoutlets": 1,
         "outlettype": [
          "signal"
         ],
         "text": "average~ 2205 rms"
        }
       },
       {
        "box": {
         "id": "sn12",
         "maxclass": "newobj",
         "patching_rect": [
          1340,
          200,
          70,
          22
         ],
         "numinlets": 2,
         "numoutlets": 1,
         "outlettype": [
          "float"
         ],
         "text": "snapshot~"
        }
       },
       {
        "box": {
         "id": "bq13",
         "maxclass": "newobj",
         "patching_rect": [
          1450,
          120,
          60,
          22
         ],
         "numinlets": 6,
         "numoutlets": 1,
         "outlettype": [
          "signal"
         ],
         "text": "biquad~"
        }
       },
       {
        "box": {
         "id": "av13",
         "maxclass": "newobj",
         "patching_rect": [
          1450,
          160,
          105,
          22
         ],
         "numinlets": 2,
         "numoutlets": 1,
         "outlettype": [
          "signal"
         ],
         "text": "average~ 2205 rms"
        }
       },
       {
        "box": {
         "id": "sn13",
         "maxclass": "newobj",
         "patching_rect": [
          1450,
          200,
          70,
          22
         ],
         "numinlets": 2,
         "numoutlets": 1,
         "outlettype": [
          "float"
         ],
         "text": "snapshot~"
        }
       },
       {
        "box": {
         "id": "bq14",
         "maxclass": "newobj",
         "patching_rect": [
          1560,
          120,
          60,
          22
         ],
         "numinlets": 6,
         "numoutlets": 1,
         "outlettype": [
          "signal"
         ],
         "text": "biquad~"
        }
       },
       {
        "box": {
         "id": "av14",
         "maxclass": "newobj",
         "patching_rect": [
          1560,
          160,
          105,
          22
         ],
         "numinlets": 2,
         "numoutlets": 1,
         "outlettype": [
          "signal"
         ],
         "text": "average~ 2205 rms"
        }
       },
       {
        "box": {
         "id": "sn14",
         "maxclass": "newobj",
         "patching_rect": [
          1560,
          200,
          70,
          22
         ],
         "numinlets": 2,
         "numoutlets": 1,
         "outlettype": [
          "float"
         ],
         "text": "snapshot~"
        }
       },
       {
        "box": {
         "id": "bq15",
         "maxclass": "newobj",
         "patching_rect": [
          1670,
          120,
          60,
          22
         ],
         "numinlets": 6,
         "numoutlets": 1,
         "outlettype": [
          "signal"
         ],
         "text": "biquad~"
        }
       },
       {
        "box": {
         "id": "av15",
         "maxclass": "newobj",
         "patching_rect": [
          1670,
          160,
          105,
          22
         ],
         "numinlets": 2,
         "numoutlets": 1,
         "outlettype": [
          "signal"
         ],
         "text": "average~ 2205 rms"
        }
       },
       {
        "box": {
         "id": "sn15",
         "maxclass": "newobj",
         "patching_rect": [
          1670,
          200,
          70,
          22
         ],
         "numinlets": 2,
         "numoutlets": 1,
         "outlettype": [
          "float"
         ],
         "text": "snapshot~"
        }
       },
       {
        "box": {
         "id": "bq16",
         "maxclass": "newobj",
         "patching_rect": [
          1780,
          120,
          60,
          22
         ],
         "numinlets": 6,
         "numoutlets": 1,
         "outlettype": [
          "signal"
         ],
         "text": "biquad~"
        }
       },
       {
        "box": {
         "id": "av16",
         "maxclass": "newobj",
         "patching_rect": [
          1780,
          160,
          105,
          22
         ],
         "numinlets": 2,
         "numoutlets": 1,
         "outlettype": [
          "signal"
         ],
         "text": "average~ 2205 rms"
        }
       },
       {
        "box": {
         "id": "sn16",
         "maxclass": "newobj",
         "patching_rect": [
          1780,
          200,
          70,
          22
         ],
         "numinlets": 2,
         "numoutlets": 1,
         "outlettype": [
          "float"
         ],
         "text": "snapshot~"
        }
       },
       {
        "box": {
         "id": "bq17",
         "maxclass": "newobj",
         "patching_rect": [
          1890,
          120,
          60,
          22
         ],
         "numinlets": 6,
         "numoutlets": 1,
         "outlettype": [
          "signal"
         ],
         "text": "biquad~"
        }
       },
       {
        "box": {
         "id": "av17",
         "maxclass": "newobj",
         "patching_rect": [
          1890,
          160,
          105,
          22
         ],
         "numinlets": 2,
         "numoutlets": 1,
         "outlettype": [
          "signal"
         ],
         "text": "average~ 2205 rms"
        }
       },
       {
        "box": {
         "id": "sn17",
         "maxclass": "newobj",
         "patching_rect": [
          1890,
          200,
          70,
          22
         ],
         "numinlets": 2,
         "numoutlets": 1,
         "outlettype": [
          "float"
         ],
         "text": "snapshot~"
        }
       },
       {
        "box": {
         "id": "bq18",
         "maxclass": "newobj",
         "patching_rect": [
          2000,
          120,
          60,
          22
         ],
         "numinlets": 6,
         "numoutlets": 1,
         "outlettype": [
          "signal"
         ],
         "text": "biquad~"
        }
       },
       {
        "box": {
         "id": "av18",
         "maxclass": "newobj",
         "patching_rect": [
          2000,
          160,
          105,
          22
         ],
         "numinlets": 2,
         "numoutlets": 1,
         "outlettype": [
          "signal"
         ],
         "text": "average~ 2205 rms"
        }
       },
       {
        "box": {
         "id": "sn18",
         "maxclass": "newobj",
         "patching_rect": [
          2000,
          200,
          70,
          22
         ],
         "numinlets": 2,
         "numoutlets": 1,
         "outlettype": [
          "float"
         ],
         "text": "snapshot~"
        }
       },
       {
        "box": {
         "id": "bq19",
         "maxclass": "newobj",
         "patching_rect": [
          2110,
          120,
          60,
          22
         ],
         "numinlets": 6,
         "numoutlets": 1,
         "outlettype": [
          "signal"
         ],
         "text": "biquad~"
        }
       },
       {
        "box": {
         "id": "av19",
         "maxclass": "newobj",
         "patching_rect": [
          2110,
          160,
          105,
          22
         ],
         "numinlets": 2,
         "numoutlets": 1,
         "outlettype": [
          "signal"
         ],
         "text": "average~ 2205 rms"
        }
       },
       {
        "box": {
         "id": "sn19",
         "maxclass": "newobj",
         "patching_rect": [
          2110,
          200,
          70,
          22
         ],
         "numinlets": 2,
         "numoutlets": 1,
         "outlettype": [
          "float"
         ],
         "text": "snapshot~"
        }
       },
       {
        "box": {
         "id": "bq20",
         "maxclass": "newobj",
         "patching_rect": [
          2220,
          120,
          60,
          22
         ],
         "numinlets": 6,
         "numoutlets": 1,
         "outlettype": [
          "signal"
         ],
         "text": "biquad~"
        }
       },
       {
        "box": {
         "id": "av20",
         "maxclass": "newobj",
         "patching_rect": [
          2220,
          160,
          105,
          22
         ],
         "numinlets": 2,
         "numoutlets": 1,
         "outlettype": [
          "signal"
         ],
         "text": "average~ 2205 rms"
        }
       },
       {
        "box": {
         "id": "sn20",
         "maxclass": "newobj",
         "patching_rect": [
          2220,
          200,
          70,
          22
         ],
         "numinlets": 2,
         "numoutlets": 1,
         "outlettype": [
          "float"
         ],
         "text": "snapshot~"
        }
       },
       {
        "box": {
         "id": "bq21",
         "maxclass": "newobj",
         "patching_rect": [
          2330,
          120,
          60,
          22
         ],
         "numinlets": 6,
         "numoutlets": 1,
         "outlettype": [
          "signal"
         ],
         "text": "biquad~"
        }
       },
       {
        "box": {
         "id": "av21",
         "maxclass": "newobj",
         "patching_rect": [
          2330,
          160,
          105,
          22
         ],
         "numinlets": 2,
         "numoutlets": 1,
         "outlettype": [
          "signal"
         ],
         "text": "average~ 2205 rms"
        }
       },
       {
        "box": {
         "id": "sn21",
         "maxclass": "newobj",
         "patching_rect": [
          2330,
          200,
          70,
          22
         ],
         "numinlets": 2,
         "numoutlets": 1,
         "outlettype": [
          "float"
         ],
         "text": "snapshot~"
        }
       },
       {
        "box": {
         "id": "bq22",
         "maxclass": "newobj",
         "patching_rect": [
          2440,
          120,
          60,
          22
         ],
         "numinlets": 6,
         "numoutlets": 1,
         "outlettype": [
          "signal"
         ],
         "text": "biquad~"
        }
       },
       {
        "box": {
         "id": "av22",
         "maxclass": "newobj",
         "patching_rect": [
          2440,
          160,
          105,
          22
         ],
         "numinlets": 2,
         "numoutlets": 1,
         "outlettype": [
          "signal"
         ],
         "text": "average~ 2205 rms"
        }
       },
       {
        "box": {
         "id": "sn22",
         "maxclass": "newobj",
         "patching_rect": [
          2440,
          200,
          70,
          22
         ],
         "numinlets": 2,
         "numoutlets": 1,
         "outlettype": [
          "float"
         ],
         "text": "snapshot~"
        }
       },
       {
        "box": {
         "id": "bq23",
         "maxclass": "newobj",
         "patching_rect": [
          2550,
          120,
          60,
          22
         ],
         "numinlets": 6,
         "numoutlets": 1,
         "outlettype": [
          "signal"
         ],
         "text": "biquad~"
        }
       },
       {
        "box": {
         "id": "av23",
         "maxclass": "newobj",
         "patching_rect": [
          2550,
          160,
          105,
          22
         ],
         "numinlets": 2,
         "numoutlets": 1,
         "outlettype": [
          "signal"
         ],
         "text": "average~ 2205 rms"
        }
       },
       {
        "box": {
         "id": "sn23",
         "maxclass": "newobj",
         "patching_rect": [
          2550,
          200,
          70,
          22
         ],
         "numinlets": 2,
         "numoutlets": 1,
         "outlettype": [
          "float"
         ],
         "text": "snapshot~"
        }
       },
       {
        "box": {
         "id": "bq24",
         "maxclass": "newobj",
         "patching_rect": [
          2660,
          120,
          60,
          22
         ],
         "numinlets": 6,
         "numoutlets": 1,
         "outlettype": [
          "signal"
         ],
         "text": "biquad~"
        }
       },
       {
        "box": {
         "id": "av24",
         "maxclass": "newobj",
         "patching_rect": [
          2660,
          160,
          105,
          22
         ],
         "numinlets": 2,
         "numoutlets": 1,
         "outlettype": [
          "signal"
         ],
         "text": "average~ 2205 rms"
        }
       },
       {
        "box": {
         "id": "sn24",
         "maxclass": "newobj",
         "patching_rect": [
          2660,
          200,
          70,
          22
         ],
         "numinlets": 2,
         "numoutlets": 1,
         "outlettype": [
          "float"
         ],
         "text": "snapshot~"
        }
       },
       {
        "box": {
         "id": "bq25",
         "maxclass": "newobj",
         "patching_rect": [
          2770,
          120,
          60,
          22
         ],
         "numinlets": 6,
         "numoutlets": 1,
         "outlettype": [
          "signal"
         ],
         "text": "biquad~"
        }
       },
       {
        "box": {
         "id": "av25",
         "maxclass": "newobj",
         "patching_rect": [
          2770,
          160,
          105,
          22
         ],
         "numinlets": 2,
         "numoutlets": 1,
         "outlettype": [
          "signal"
         ],
         "text": "average~ 2205 rms"
        }
       },
       {
        "box": {
         "id": "sn25",
         "maxclass": "newobj",
         "patching_rect": [
          2770,
          200,
          70,
          22
         ],
         "numinlets": 2,
         "numoutlets": 1,
         "outlettype": [
          "float"
         ],
         "text": "snapshot~"
        }
       },
       {
        "box": {
         "id": "bq26",
         "maxclass": "newobj",
         "patching_rect": [
          2880,
          120,
          60,
          22
         ],
         "numinlets": 6,
         "numoutlets": 1,
         "outlettype": [
          "signal"
         ],
         "text": "biquad~"
        }
       },
       {
        "box": {
         "id": "av26",
         "maxclass": "newobj",
         "patching_rect": [
          2880,
          160,
          105,
          22
         ],
         "numinlets": 2,
         "numoutlets": 1,
         "outlettype": [
          "signal"
         ],
         "text": "average~ 2205 rms"
        }
       },
       {
        "box": {
         "id": "sn26",
         "maxclass": "newobj",
         "patching_rect": [
          2880,
          200,
          70,
          22
         ],
         "numinlets": 2,
         "numoutlets": 1,
         "outlettype": [
          "float"
         ],
         "text": "snapshot~"
        }
       },
       {
        "box": {
         "id": "bq27",
         "maxclass": "newobj",
         "patching_rect": [
          2990,
          120,
          60,
          22
         ],
         "numinlets": 6,
         "numoutlets": 1,
         "outlettype": [
          "signal"
         ],
         "text": "biquad~"
        }
       },
       {
        "box": {
         "id": "av27",
         "maxclass": "newobj",
         "patching_rect": [
          2990,
          160,
          105,
          22
         ],
         "numinlets": 2,
         "numoutlets": 1,
         "outlettype": [
          "signal"
         ],
         "text": "average~ 2205 rms"
        }
       },
       {
        "box": {
         "id": "sn27",
         "maxclass": "newobj",
         "patching_rect": [
          2990,
          200,
          70,
          22
         ],
         "numinlets": 2,
         "numoutlets": 1,
         "outlettype": [
          "float"
         ],
         "text": "snapshot~"
        }
       },
       {
        "box": {
         "id": "bq28",
         "maxclass": "newobj",
         "patching_rect": [
          3100,
          120,
          60,
          22
         ],
         "numinlets": 6,
         "numoutlets": 1,
         "outlettype": [
          "signal"
         ],
         "text": "biquad~"
        }
       },
       {
        "box": {
         "id": "av28",
         "maxclass": "newobj",
         "patching_rect": [
          3100,
          160,
          105,
          22
         ],
         "numinlets": 2,
         "numoutlets": 1,
         "outlettype": [
          "signal"
         ],
         "text": "average~ 2205 rms"
        }
       },
       {
        "box": {
         "id": "sn28",
         "maxclass": "newobj",
         "patching_rect": [
          3100,
          200,
          70,
          22
         ],
         "numinlets": 2,
         "numoutlets": 1,
         "outlettype": [
          "float"
         ],
         "text": "snapshot~"
        }
       },
       {
        "box": {
         "id": "bq29",
         "maxclass": "newobj",
         "patching_rect": [
          3210,
          120,
          60,
          22
         ],
         "numinlets": 6,
         "numoutlets": 1,
         "outlettype": [
          "signal"
         ],
         "text": "biquad~"
        }
       },
       {
        "box": {
         "id": "av29",
         "maxclass": "newobj",
         "patching_rect": [
          3210,
          160,
          105,
          22
         ],
         "numinlets": 2,
         "numoutlets": 1,
         "outlettype": [
          "signal"
         ],
         "text": "average~ 2205 rms"
        }
       },
       {
        "box": {
         "id": "sn29",
         "maxclass": "newobj",
         "patching_rect": [
          3210,
          200,
          70,
          22
         ],
         "numinlets": 2,
         "numoutlets": 1,
         "outlettype": [
          "float"
         ],
         "text": "snapshot~"
        }
       },
       {
        "box": {
         "id": "bq30",
         "maxclass": "newobj",
         "patching_rect": [
          3320,
          120,
          60,
          22
         ],
         "numinlets": 6,
         "numoutlets": 1,
         "outlettype": [
          "signal"
         ],
         "text": "biquad~"
        }
       },
       {
        "box": {
         "id": "av30",
         "maxclass": "newobj",
         "patching_rect": [
          3320,
          160,
          105,
          22
         ],
         "numinlets": 2,
         "numoutlets": 1,
         "outlettype": [
          "signal"
         ],
         "text": "average~ 2205 rms"
        }
       },
       {
        "box": {
         "id": "sn30",
         "maxclass": "newobj",
         "patching_rect": [
          3320,
          200,
          70,
          22
         ],
         "numinlets": 2,
         "numoutlets": 1,
         "outlettype": [
          "float"
         ],
         "text": "snapshot~"
        }
       },
       {
        "box": {
         "id": "bq31",
         "maxclass": "newobj",
         "patching_rect": [
          3430,
          120,
          60,
          22
         ],
         "numinlets": 6,
         "numoutlets": 1,
         "outlettype": [
          "signal"
         ],
         "text": "biquad~"
        }
       },
       {
        "box": {
         "id": "av31",
         "maxclass": "newobj",
         "patching_rect": [
          3430,
          160,
          105,
          22
         ],
         "numinlets": 2,
         "numoutlets": 1,
         "outlettype": [
          "signal"
         ],
         "text": "average~ 2205 rms"
        }
       },
       {
        "box": {
         "id": "sn31",
         "maxclass": "newobj",
         "patching_rect": [
          3430,
          200,
          70,
          22
         ],
         "numinlets": 2,
         "numoutlets": 1,
         "outlettype": [
          "float"
         ],
         "text": "snapshot~"
        }
       },
       {
        "box": {
         "id": "bq32",
         "maxclass": "newobj",
         "patching_rect": [
          3540,
          120,
          60,
          22
         ],
         "numinlets": 6,
         "numoutlets": 1,
         "outlettype": [
          "signal"
         ],
         "text": "biquad~"
        }
       },
       {
        "box": {
         "id": "av32",
         "maxclass": "newobj",
         "patching_rect": [
          3540,
          160,
          105,
          22
         ],
         "numinlets": 2,
         "numoutlets": 1,
         "outlettype": [
          "signal"
         ],
         "text": "average~ 2205 rms"
        }
       },
       {
        "box": {
         "id": "sn32",
         "maxclass": "newobj",
         "patching_rect": [
          3540,
          200,
          70,
          22
         ],
         "numinlets": 2,
         "numoutlets": 1,
         "outlettype": [
          "float"
         ],
         "text": "snapshot~"
        }
       },
       {
        "box": {
         "id": "bq33",
         "maxclass": "newobj",
         "patching_rect": [
          3650,
          120,
          60,
          22
         ],
         "numinlets": 6,
         "numoutlets": 1,
         "outlettype": [
          "signal"
         ],
         "text": "biquad~"
        }
       },
       {
        "box": {
         "id": "av33",
         "maxclass": "newobj",
         "patching_rect": [
          3650,
          160,
          105,
          22
         ],
         "numinlets": 2,
         "numoutlets": 1,
         "outlettype": [
          "signal"
         ],
         "text": "average~ 2205 rms"
        }
       },
       {
        "box": {
         "id": "sn33",
         "maxclass": "newobj",
         "patching_rect": [
          3650,
          200,
          70,
          22
         ],
         "numinlets": 2,
         "numoutlets": 1,
         "outlettype": [
          "float"
         ],
         "text": "snapshot~"
        }
       },
       {
        "box": {
         "id": "bq34",
         "maxclass": "newobj",
         "patching_rect": [
          3760,
          120,
          60,
          22
         ],
         "numinlets": 6,
         "numoutlets": 1,
         "outlettype": [
          "signal"
         ],
         "text": "biquad~"
        }
       },
       {
        "box": {
         "id": "av34",
         "maxclass": "newobj",
         "patching_rect": [
          3760,
          160,
          105,
          22
         ],
         "numinlets": 2,
         "numoutlets": 1,
         "outlettype": [
          "signal"
         ],
         "text": "average~ 2205 rms"
        }
       },
       {
        "box": {
         "id": "sn34",
         "maxclass": "newobj",
         "patching_rect": [
          3760,
          200,
          70,
          22
         ],
         "numinlets": 2,
         "numoutlets": 1,
         "outlettype": [
          "float"
         ],
         "text": "snapshot~"
        }
       },
       {
        "box": {
         "id": "bq35",
         "maxclass": "newobj",
         "patching_rect": [
          3870,
          120,
          60,
          22
         ],
         "numinlets": 6,
         "numoutlets": 1,
         "outlettype": [
          "signal"
         ],
         "text": "biquad~"
        }
       },
       {
        "box": {
         "id": "av35",
         "maxclass": "newobj",
         "patching_rect": [
          3870,
          160,
          105,
          22
         ],
         "numinlets": 2,
         "numoutlets": 1,
         "outlettype": [
          "signal"
         ],
         "text": "average~ 2205 rms"
        }
       },
       {
        "box": {
         "id": "sn35",
         "maxclass": "newobj",
         "patching_rect": [
          3870,
          200,
          70,
          22
         ],
         "numinlets": 2,
         "numoutlets": 1,
         "outlettype": [
          "float"
         ],
         "text": "snapshot~"
        }
       },
       {
        "box": {
         "id": "bq36",
         "maxclass": "newobj",
         "patching_rect": [
          3980,
          120,
          60,
          22
         ],
         "numinlets": 6,
         "numoutlets": 1,
         "outlettype": [
          "signal"
         ],
         "text": "biquad~"
        }
       },
       {
        "box": {
         "id": "av36",
         "maxclass": "newobj",
         "patching_rect": [
          3980,
          160,
          105,
          22
         ],
         "numinlets": 2,
         "numoutlets": 1,
         "outlettype": [
          "signal"
         ],
         "text": "average~ 2205 rms"
        }
       },
       {
        "box": {
         "id": "sn36",
         "maxclass": "newobj",
         "patching_rect": [
          3980,
          200,
          70,
          22
         ],
         "numinlets": 2,
         "numoutlets": 1,
         "outlettype": [
          "float"
         ],
         "text": "snapshot~"
        }
       },
       {
        "box": {
         "id": "bq37",
         "maxclass": "newobj",
         "patching_rect": [
          4090,
          120,
          60,
          22
         ],
         "numinlets": 6,
         "numoutlets": 1,
         "outlettype": [
          "signal"
         ],
         "text": "biquad~"
        }
       },
       {
        "box": {
         "id": "av37",
         "maxclass": "newobj",
         "patching_rect": [
          4090,
          160,
          105,
          22
         ],
         "numinlets": 2,
         "numoutlets": 1,
         "outlettype": [
          "signal"
         ],
         "text": "average~ 2205 rms"
        }
       },
       {
        "box": {
         "id": "sn37",
         "maxclass": "newobj",
         "patching_rect": [
          4090,
          200,
          70,
          22
         ],
         "numinlets": 2,
         "numoutlets": 1,
         "outlettype": [
          "float"
         ],
         "text": "snapshot~"
        }
       },
       {
        "box": {
         "id": "bq38",
         "maxclass": "newobj",
         "patching_rect": [
          4200,
          120,
          60,
          22
         ],
         "numinlets": 6,
         "numoutlets": 1,
         "outlettype": [
          "signal"
         ],
         "text": "biquad~"
        }
       },
       {
        "box": {
         "id": "av38",
         "maxclass": "newobj",
         "patching_rect": [
          4200,
          160,
          105,
          22
         ],
         "numinlets": 2,
         "numoutlets": 1,
         "outlettype": [
          "signal"
         ],
         "text": "average~ 2205 rms"
        }
       },
       {
        "box": {
         "id": "sn38",
         "maxclass": "newobj",
         "patching_rect": [
          4200,
          200,
          70,
          22
         ],
         "numinlets": 2,
         "numoutlets": 1,
         "outlettype": [
          "float"
         ],
         "text": "snapshot~"
        }
       },
       {
        "box": {
         "id": "bq39",
         "maxclass": "newobj",
         "patching_rect": [
          4310,
          120,
          60,
          22
         ],
         "numinlets": 6,
         "numoutlets": 1,
         "outlettype": [
          "signal"
         ],
         "text": "biquad~"
        }
       },
       {
        "box": {
         "id": "av39",
         "maxclass": "newobj",
         "patching_rect": [
          4310,
          160,
          105,
          22
         ],
         "numinlets": 2,
         "numoutlets": 1,
         "outlettype": [
          "signal"
         ],
         "text": "average~ 2205 rms"
        }
       },
       {
        "box": {
         "id": "sn39",
         "maxclass": "newobj",
         "patching_rect": [
          4310,
          200,
          70,
          22
         ],
         "numinlets": 2,
         "numoutlets": 1,
         "outlettype": [
          "float"
         ],
         "text": "snapshot~"
        }
       }
      ],
      "lines": [
       {
        "patchline": {
         "source": [
          "in_coef",
          0
         ],
         "destination": [
          "route",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "in_bang",
          0
         ],
         "destination": [
          "tbb",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "in_sig",
          0
         ],
         "destination": [
          "bq0",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "route",
          0
         ],
         "destination": [
          "bq0",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "bq0",
          0
         ],
         "destination": [
          "av0",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "av0",
          0
         ],
         "destination": [
          "sn0",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "tbb",
          0
         ],
         "destination": [
          "sn0",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "sn0",
          0
         ],
         "destination": [
          "pack",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "in_sig",
          0
         ],
         "destination": [
          "bq1",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "route",
          1
         ],
         "destination": [
          "bq1",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "bq1",
          0
         ],
         "destination": [
          "av1",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "av1",
          0
         ],
         "destination": [
          "sn1",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "tbb",
          1
         ],
         "destination": [
          "sn1",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "sn1",
          0
         ],
         "destination": [
          "pack",
          1
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "in_sig",
          0
         ],
         "destination": [
          "bq2",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "route",
          2
         ],
         "destination": [
          "bq2",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "bq2",
          0
         ],
         "destination": [
          "av2",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "av2",
          0
         ],
         "destination": [
          "sn2",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "tbb",
          1
         ],
         "destination": [
          "sn2",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "sn2",
          0
         ],
         "destination": [
          "pack",
          2
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "in_sig",
          0
         ],
         "destination": [
          "bq3",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "route",
          3
         ],
         "destination": [
          "bq3",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "bq3",
          0
         ],
         "destination": [
          "av3",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "av3",
          0
         ],
         "destination": [
          "sn3",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "tbb",
          1
         ],
         "destination": [
          "sn3",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "sn3",
          0
         ],
         "destination": [
          "pack",
          3
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "in_sig",
          0
         ],
         "destination": [
          "bq4",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "route",
          4
         ],
         "destination": [
          "bq4",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "bq4",
          0
         ],
         "destination": [
          "av4",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "av4",
          0
         ],
         "destination": [
          "sn4",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "tbb",
          1
         ],
         "destination": [
          "sn4",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "sn4",
          0
         ],
         "destination": [
          "pack",
          4
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "in_sig",
          0
         ],
         "destination": [
          "bq5",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "route",
          5
         ],
         "destination": [
          "bq5",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "bq5",
          0
         ],
         "destination": [
          "av5",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "av5",
          0
         ],
         "destination": [
          "sn5",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "tbb",
          1
         ],
         "destination": [
          "sn5",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "sn5",
          0
         ],
         "destination": [
          "pack",
          5
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "in_sig",
          0
         ],
         "destination": [
          "bq6",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "route",
          6
         ],
         "destination": [
          "bq6",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "bq6",
          0
         ],
         "destination": [
          "av6",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "av6",
          0
         ],
         "destination": [
          "sn6",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "tbb",
          1
         ],
         "destination": [
          "sn6",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "sn6",
          0
         ],
         "destination": [
          "pack",
          6
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "in_sig",
          0
         ],
         "destination": [
          "bq7",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "route",
          7
         ],
         "destination": [
          "bq7",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "bq7",
          0
         ],
         "destination": [
          "av7",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "av7",
          0
         ],
         "destination": [
          "sn7",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "tbb",
          1
         ],
         "destination": [
          "sn7",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "sn7",
          0
         ],
         "destination": [
          "pack",
          7
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "in_sig",
          0
         ],
         "destination": [
          "bq8",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "route",
          8
         ],
         "destination": [
          "bq8",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "bq8",
          0
         ],
         "destination": [
          "av8",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "av8",
          0
         ],
         "destination": [
          "sn8",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "tbb",
          1
         ],
         "destination": [
          "sn8",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "sn8",
          0
         ],
         "destination": [
          "pack",
          8
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "in_sig",
          0
         ],
         "destination": [
          "bq9",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "route",
          9
         ],
         "destination": [
          "bq9",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "bq9",
          0
         ],
         "destination": [
          "av9",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "av9",
          0
         ],
         "destination": [
          "sn9",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "tbb",
          1
         ],
         "destination": [
          "sn9",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "sn9",
          0
         ],
         "destination": [
          "pack",
          9
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "in_sig",
          0
         ],
         "destination": [
          "bq10",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "route",
          10
         ],
         "destination": [
          "bq10",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "bq10",
          0
         ],
         "destination": [
          "av10",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "av10",
          0
         ],
         "destination": [
          "sn10",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "tbb",
          1
         ],
         "destination": [
          "sn10",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "sn10",
          0
         ],
         "destination": [
          "pack",
          10
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "in_sig",
          0
         ],
         "destination": [
          "bq11",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "route",
          11
         ],
         "destination": [
          "bq11",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "bq11",
          0
         ],
         "destination": [
          "av11",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "av11",
          0
         ],
         "destination": [
          "sn11",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "tbb",
          1
         ],
         "destination": [
          "sn11",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "sn11",
          0
         ],
         "destination": [
          "pack",
          11
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "in_sig",
          0
         ],
         "destination": [
          "bq12",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "route",
          12
         ],
         "destination": [
          "bq12",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "bq12",
          0
         ],
         "destination": [
          "av12",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "av12",
          0
         ],
         "destination": [
          "sn12",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "tbb",
          1
         ],
         "destination": [
          "sn12",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "sn12",
          0
         ],
         "destination": [
          "pack",
          12
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "in_sig",
          0
         ],
         "destination": [
          "bq13",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "route",
          13
         ],
         "destination": [
          "bq13",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "bq13",
          0
         ],
         "destination": [
          "av13",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "av13",
          0
         ],
         "destination": [
          "sn13",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "tbb",
          1
         ],
         "destination": [
          "sn13",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "sn13",
          0
         ],
         "destination": [
          "pack",
          13
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "in_sig",
          0
         ],
         "destination": [
          "bq14",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "route",
          14
         ],
         "destination": [
          "bq14",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "bq14",
          0
         ],
         "destination": [
          "av14",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "av14",
          0
         ],
         "destination": [
          "sn14",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "tbb",
          1
         ],
         "destination": [
          "sn14",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "sn14",
          0
         ],
         "destination": [
          "pack",
          14
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "in_sig",
          0
         ],
         "destination": [
          "bq15",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "route",
          15
         ],
         "destination": [
          "bq15",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "bq15",
          0
         ],
         "destination": [
          "av15",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "av15",
          0
         ],
         "destination": [
          "sn15",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "tbb",
          1
         ],
         "destination": [
          "sn15",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "sn15",
          0
         ],
         "destination": [
          "pack",
          15
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "in_sig",
          0
         ],
         "destination": [
          "bq16",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "route",
          16
         ],
         "destination": [
          "bq16",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "bq16",
          0
         ],
         "destination": [
          "av16",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "av16",
          0
         ],
         "destination": [
          "sn16",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "tbb",
          1
         ],
         "destination": [
          "sn16",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "sn16",
          0
         ],
         "destination": [
          "pack",
          16
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "in_sig",
          0
         ],
         "destination": [
          "bq17",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "route",
          17
         ],
         "destination": [
          "bq17",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "bq17",
          0
         ],
         "destination": [
          "av17",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "av17",
          0
         ],
         "destination": [
          "sn17",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "tbb",
          1
         ],
         "destination": [
          "sn17",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "sn17",
          0
         ],
         "destination": [
          "pack",
          17
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "in_sig",
          0
         ],
         "destination": [
          "bq18",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "route",
          18
         ],
         "destination": [
          "bq18",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "bq18",
          0
         ],
         "destination": [
          "av18",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "av18",
          0
         ],
         "destination": [
          "sn18",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "tbb",
          1
         ],
         "destination": [
          "sn18",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "sn18",
          0
         ],
         "destination": [
          "pack",
          18
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "in_sig",
          0
         ],
         "destination": [
          "bq19",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "route",
          19
         ],
         "destination": [
          "bq19",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "bq19",
          0
         ],
         "destination": [
          "av19",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "av19",
          0
         ],
         "destination": [
          "sn19",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "tbb",
          1
         ],
         "destination": [
          "sn19",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "sn19",
          0
         ],
         "destination": [
          "pack",
          19
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "in_sig",
          0
         ],
         "destination": [
          "bq20",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "route",
          20
         ],
         "destination": [
          "bq20",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "bq20",
          0
         ],
         "destination": [
          "av20",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "av20",
          0
         ],
         "destination": [
          "sn20",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "tbb",
          1
         ],
         "destination": [
          "sn20",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "sn20",
          0
         ],
         "destination": [
          "pack",
          20
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "in_sig",
          0
         ],
         "destination": [
          "bq21",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "route",
          21
         ],
         "destination": [
          "bq21",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "bq21",
          0
         ],
         "destination": [
          "av21",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "av21",
          0
         ],
         "destination": [
          "sn21",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "tbb",
          1
         ],
         "destination": [
          "sn21",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "sn21",
          0
         ],
         "destination": [
          "pack",
          21
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "in_sig",
          0
         ],
         "destination": [
          "bq22",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "route",
          22
         ],
         "destination": [
          "bq22",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "bq22",
          0
         ],
         "destination": [
          "av22",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "av22",
          0
         ],
         "destination": [
          "sn22",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "tbb",
          1
         ],
         "destination": [
          "sn22",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "sn22",
          0
         ],
         "destination": [
          "pack",
          22
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "in_sig",
          0
         ],
         "destination": [
          "bq23",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "route",
          23
         ],
         "destination": [
          "bq23",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "bq23",
          0
         ],
         "destination": [
          "av23",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "av23",
          0
         ],
         "destination": [
          "sn23",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "tbb",
          1
         ],
         "destination": [
          "sn23",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "sn23",
          0
         ],
         "destination": [
          "pack",
          23
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "in_sig",
          0
         ],
         "destination": [
          "bq24",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "route",
          24
         ],
         "destination": [
          "bq24",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "bq24",
          0
         ],
         "destination": [
          "av24",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "av24",
          0
         ],
         "destination": [
          "sn24",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "tbb",
          1
         ],
         "destination": [
          "sn24",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "sn24",
          0
         ],
         "destination": [
          "pack",
          24
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "in_sig",
          0
         ],
         "destination": [
          "bq25",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "route",
          25
         ],
         "destination": [
          "bq25",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "bq25",
          0
         ],
         "destination": [
          "av25",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "av25",
          0
         ],
         "destination": [
          "sn25",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "tbb",
          1
         ],
         "destination": [
          "sn25",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "sn25",
          0
         ],
         "destination": [
          "pack",
          25
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "in_sig",
          0
         ],
         "destination": [
          "bq26",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "route",
          26
         ],
         "destination": [
          "bq26",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "bq26",
          0
         ],
         "destination": [
          "av26",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "av26",
          0
         ],
         "destination": [
          "sn26",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "tbb",
          1
         ],
         "destination": [
          "sn26",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "sn26",
          0
         ],
         "destination": [
          "pack",
          26
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "in_sig",
          0
         ],
         "destination": [
          "bq27",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "route",
          27
         ],
         "destination": [
          "bq27",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "bq27",
          0
         ],
         "destination": [
          "av27",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "av27",
          0
         ],
         "destination": [
          "sn27",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "tbb",
          1
         ],
         "destination": [
          "sn27",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "sn27",
          0
         ],
         "destination": [
          "pack",
          27
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "in_sig",
          0
         ],
         "destination": [
          "bq28",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "route",
          28
         ],
         "destination": [
          "bq28",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "bq28",
          0
         ],
         "destination": [
          "av28",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "av28",
          0
         ],
         "destination": [
          "sn28",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "tbb",
          1
         ],
         "destination": [
          "sn28",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "sn28",
          0
         ],
         "destination": [
          "pack",
          28
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "in_sig",
          0
         ],
         "destination": [
          "bq29",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "route",
          29
         ],
         "destination": [
          "bq29",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "bq29",
          0
         ],
         "destination": [
          "av29",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "av29",
          0
         ],
         "destination": [
          "sn29",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "tbb",
          1
         ],
         "destination": [
          "sn29",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "sn29",
          0
         ],
         "destination": [
          "pack",
          29
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "in_sig",
          0
         ],
         "destination": [
          "bq30",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "route",
          30
         ],
         "destination": [
          "bq30",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "bq30",
          0
         ],
         "destination": [
          "av30",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "av30",
          0
         ],
         "destination": [
          "sn30",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "tbb",
          1
         ],
         "destination": [
          "sn30",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "sn30",
          0
         ],
         "destination": [
          "pack",
          30
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "in_sig",
          0
         ],
         "destination": [
          "bq31",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "route",
          31
         ],
         "destination": [
          "bq31",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "bq31",
          0
         ],
         "destination": [
          "av31",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "av31",
          0
         ],
         "destination": [
          "sn31",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "tbb",
          1
         ],
         "destination": [
          "sn31",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "sn31",
          0
         ],
         "destination": [
          "pack",
          31
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "in_sig",
          0
         ],
         "destination": [
          "bq32",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "route",
          32
         ],
         "destination": [
          "bq32",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "bq32",
          0
         ],
         "destination": [
          "av32",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "av32",
          0
         ],
         "destination": [
          "sn32",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "tbb",
          1
         ],
         "destination": [
          "sn32",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "sn32",
          0
         ],
         "destination": [
          "pack",
          32
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "in_sig",
          0
         ],
         "destination": [
          "bq33",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "route",
          33
         ],
         "destination": [
          "bq33",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "bq33",
          0
         ],
         "destination": [
          "av33",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "av33",
          0
         ],
         "destination": [
          "sn33",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "tbb",
          1
         ],
         "destination": [
          "sn33",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "sn33",
          0
         ],
         "destination": [
          "pack",
          33
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "in_sig",
          0
         ],
         "destination": [
          "bq34",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "route",
          34
         ],
         "destination": [
          "bq34",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "bq34",
          0
         ],
         "destination": [
          "av34",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "av34",
          0
         ],
         "destination": [
          "sn34",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "tbb",
          1
         ],
         "destination": [
          "sn34",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "sn34",
          0
         ],
         "destination": [
          "pack",
          34
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "in_sig",
          0
         ],
         "destination": [
          "bq35",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "route",
          35
         ],
         "destination": [
          "bq35",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "bq35",
          0
         ],
         "destination": [
          "av35",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "av35",
          0
         ],
         "destination": [
          "sn35",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "tbb",
          1
         ],
         "destination": [
          "sn35",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "sn35",
          0
         ],
         "destination": [
          "pack",
          35
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "in_sig",
          0
         ],
         "destination": [
          "bq36",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "route",
          36
         ],
         "destination": [
          "bq36",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "bq36",
          0
         ],
         "destination": [
          "av36",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "av36",
          0
         ],
         "destination": [
          "sn36",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "tbb",
          1
         ],
         "destination": [
          "sn36",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "sn36",
          0
         ],
         "destination": [
          "pack",
          36
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "in_sig",
          0
         ],
         "destination": [
          "bq37",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "route",
          37
         ],
         "destination": [
          "bq37",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "bq37",
          0
         ],
         "destination": [
          "av37",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "av37",
          0
         ],
         "destination": [
          "sn37",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "tbb",
          1
         ],
         "destination": [
          "sn37",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "sn37",
          0
         ],
         "destination": [
          "pack",
          37
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "in_sig",
          0
         ],
         "destination": [
          "bq38",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "route",
          38
         ],
         "destination": [
          "bq38",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "bq38",
          0
         ],
         "destination": [
          "av38",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "av38",
          0
         ],
         "destination": [
          "sn38",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "tbb",
          1
         ],
         "destination": [
          "sn38",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "sn38",
          0
         ],
         "destination": [
          "pack",
          38
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "in_sig",
          0
         ],
         "destination": [
          "bq39",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "route",
          39
         ],
         "destination": [
          "bq39",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "bq39",
          0
         ],
         "destination": [
          "av39",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "av39",
          0
         ],
         "destination": [
          "sn39",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "tbb",
          1
         ],
         "destination": [
          "sn39",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "sn39",
          0
         ],
         "destination": [
          "pack",
          39
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "pack",
          0
         ],
         "destination": [
          "pbands",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "pbands",
          0
         ],
         "destination": [
          "out",
          0
         ]
        }
       }
      ]
     }
    }
   },
   {
    "box": {
     "id": "c10",
     "maxclass": "comment",
     "patching_rect": [
      585,
      230,
      230,
      22
     ],
     "numinlets": 1,
     "numoutlets": 0,
     "text": "<- 40-band filterbank (double-click)"
    }
   },
   {
    "box": {
     "id": "dsp",
     "maxclass": "newobj",
     "patching_rect": [
      600,
      270,
      77,
      22
     ],
     "numinlets": 1,
     "numoutlets": 4,
     "outlettype": [
      "int",
      "float",
      "int",
      "int"
     ],
     "text": "dspstate~"
    }
   },
   {
    "box": {
     "id": "psr",
     "maxclass": "newobj",
     "patching_rect": [
      600,
      300,
      84,
      22
     ],
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "text": "prepend sr"
    }
   },
   {
    "box": {
     "id": "c4",
     "maxclass": "comment",
     "patching_rect": [
      460,
      40,
      160,
      22
     ],
     "numinlets": 1,
     "numoutlets": 0,
     "text": "settings (optional)"
    }
   },
   {
    "box": {
     "id": "gate",
     "maxclass": "flonum",
     "patching_rect": [
      460,
      62,
      60,
      22
     ],
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "bang"
     ],
     "parameter_enable": 0
    }
   },
   {
    "box": {
     "id": "pgate",
     "maxclass": "newobj",
     "patching_rect": [
      530,
      62,
      120,
      22
     ],
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "text": "prepend setgate"
    }
   },
   {
    "box": {
     "id": "cgate",
     "maxclass": "comment",
     "patching_rect": [
      655,
      62,
      220,
      22
     ],
     "numinlets": 1,
     "numoutlets": 0,
     "text": "silence gate dB (default -32)"
    }
   },
   {
    "box": {
     "id": "fw",
     "maxclass": "flonum",
     "patching_rect": [
      460,
      88,
      60,
      22
     ],
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "bang"
     ],
     "parameter_enable": 0
    }
   },
   {
    "box": {
     "id": "pfw",
     "maxclass": "newobj",
     "patching_rect": [
      530,
      88,
      120,
      22
     ],
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "text": "prepend fweight"
    }
   },
   {
    "box": {
     "id": "cfw",
     "maxclass": "comment",
     "patching_rect": [
      655,
      88,
      220,
      22
     ],
     "numinlets": 1,
     "numoutlets": 0,
     "text": "pitch weight (default 1)"
    }
   },
   {
    "box": {
     "id": "aw",
     "maxclass": "flonum",
     "patching_rect": [
      460,
      114,
      60,
      22
     ],
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "bang"
     ],
     "parameter_enable": 0
    }
   },
   {
    "box": {
     "id": "paw",
     "maxclass": "newobj",
     "patching_rect": [
      530,
      114,
      120,
      22
     ],
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "text": "prepend aweight"
    }
   },
   {
    "box": {
     "id": "caw",
     "maxclass": "comment",
     "patching_rect": [
      655,
      114,
      220,
      22
     ],
     "numinlets": 1,
     "numoutlets": 0,
     "text": "loudness weight (default 0.5)"
    }
   },
   {
    "box": {
     "id": "tw",
     "maxclass": "flonum",
     "patching_rect": [
      460,
      140,
      60,
      22
     ],
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "bang"
     ],
     "parameter_enable": 0
    }
   },
   {
    "box": {
     "id": "ptw",
     "maxclass": "newobj",
     "patching_rect": [
      530,
      140,
      120,
      22
     ],
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "text": "prepend tweight"
    }
   },
   {
    "box": {
     "id": "ctw",
     "maxclass": "comment",
     "patching_rect": [
      655,
      140,
      220,
      22
     ],
     "numinlets": 1,
     "numoutlets": 0,
     "text": "timbre weight (default 1)"
    }
   },
   {
    "box": {
     "id": "mw",
     "maxclass": "flonum",
     "patching_rect": [
      460,
      166,
      60,
      22
     ],
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "bang"
     ],
     "parameter_enable": 0
    }
   },
   {
    "box": {
     "id": "pmw",
     "maxclass": "newobj",
     "patching_rect": [
      530,
      166,
      120,
      22
     ],
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "text": "prepend mweight"
    }
   },
   {
    "box": {
     "id": "cmw",
     "maxclass": "comment",
     "patching_rect": [
      655,
      166,
      220,
      22
     ],
     "numinlets": 1,
     "numoutlets": 0,
     "text": "formant weight (default 1)"
    }
   },
   {
    "box": {
     "id": "off",
     "maxclass": "flonum",
     "patching_rect": [
      460,
      192,
      60,
      22
     ],
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "bang"
     ],
     "parameter_enable": 0
    }
   },
   {
    "box": {
     "id": "poff",
     "maxclass": "newobj",
     "patching_rect": [
      530,
      192,
      120,
      22
     ],
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "text": "prepend dboffset"
    }
   },
   {
    "box": {
     "id": "coff",
     "maxclass": "comment",
     "patching_rect": [
      655,
      192,
      220,
      22
     ],
     "numinlets": 1,
     "numoutlets": 0,
     "text": "input level trim dB (default 0)"
    }
   },
   {
    "box": {
     "id": "cmntog",
     "maxclass": "toggle",
     "patching_rect": [
      460,
      218,
      22,
      22
     ],
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      "int"
     ],
     "parameter_enable": 0
    }
   },
   {
    "box": {
     "id": "pcmn",
     "maxclass": "newobj",
     "patching_rect": [
      530,
      218,
      120,
      22
     ],
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "text": "prepend cmn"
    }
   },
   {
    "box": {
     "id": "ccmn",
     "maxclass": "comment",
     "patching_rect": [
      655,
      218,
      230,
      22
     ],
     "numinlets": 1,
     "numoutlets": 0,
     "text": "mic-colour compensation (default on)"
    }
   },
   {
    "box": {
     "id": "js",
     "maxclass": "newobj",
     "patching_rect": [
      160,
      330,
      520,
      22
     ],
     "numinlets": 1,
     "numoutlets": 6,
     "outlettype": [
      "",
      "",
      "",
      "",
      "",
      ""
     ],
     "text": "v8 grain_match.js"
    }
   },
   {
    "box": {
     "id": "buf",
     "maxclass": "newobj",
     "patching_rect": [
      720,
      330,
      189,
      22
     ],
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "float",
      "bang"
     ],
     "text": "buffer~ grains grains.wav"
    }
   },
   {
    "box": {
     "id": "playA",
     "maxclass": "newobj",
     "patching_rect": [
      160,
      380,
      112,
      22
     ],
     "numinlets": 2,
     "numoutlets": 2,
     "outlettype": [
      "signal",
      "signal"
     ],
     "text": "play~ grains 1"
    }
   },
   {
    "box": {
     "id": "lineA",
     "maxclass": "newobj",
     "patching_rect": [
      230,
      410,
      49,
      22
     ],
     "numinlets": 2,
     "numoutlets": 2,
     "outlettype": [
      "signal",
      "bang"
     ],
     "text": "line~"
    }
   },
   {
    "box": {
     "id": "vcaA",
     "maxclass": "newobj",
     "patching_rect": [
      160,
      450,
      40,
      22
     ],
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      "signal"
     ],
     "text": "*~"
    }
   },
   {
    "box": {
     "id": "playB",
     "maxclass": "newobj",
     "patching_rect": [
      300,
      380,
      112,
      22
     ],
     "numinlets": 2,
     "numoutlets": 2,
     "outlettype": [
      "signal",
      "signal"
     ],
     "text": "play~ grains 1"
    }
   },
   {
    "box": {
     "id": "lineB",
     "maxclass": "newobj",
     "patching_rect": [
      370,
      410,
      49,
      22
     ],
     "numinlets": 2,
     "numoutlets": 2,
     "outlettype": [
      "signal",
      "bang"
     ],
     "text": "line~"
    }
   },
   {
    "box": {
     "id": "vcaB",
     "maxclass": "newobj",
     "patching_rect": [
      300,
      450,
      40,
      22
     ],
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      "signal"
     ],
     "text": "*~"
    }
   },
   {
    "box": {
     "id": "dac",
     "maxclass": "newobj",
     "patching_rect": [
      160,
      500,
      70,
      22
     ],
     "numinlets": 2,
     "numoutlets": 0,
     "outlettype": [],
     "text": "dac~ 1 2"
    }
   },
   {
    "box": {
     "id": "att",
     "maxclass": "flonum",
     "patching_rect": [
      460,
      244,
      60,
      22
     ],
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "bang"
     ],
     "parameter_enable": 0
    }
   },
   {
    "box": {
     "id": "patt",
     "maxclass": "newobj",
     "patching_rect": [
      530,
      244,
      120,
      22
     ],
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "text": "prepend attack"
    }
   },
   {
    "box": {
     "id": "catt",
     "maxclass": "comment",
     "patching_rect": [
      655,
      244,
      220,
      22
     ],
     "numinlets": 1,
     "numoutlets": 0,
     "text": "attack ms (default 10)"
    }
   },
   {
    "box": {
     "id": "rel",
     "maxclass": "flonum",
     "patching_rect": [
      460,
      270,
      60,
      22
     ],
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "bang"
     ],
     "parameter_enable": 0
    }
   },
   {
    "box": {
     "id": "prel",
     "maxclass": "newobj",
     "patching_rect": [
      530,
      270,
      120,
      22
     ],
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "text": "prepend release"
    }
   },
   {
    "box": {
     "id": "crel",
     "maxclass": "comment",
     "patching_rect": [
      655,
      270,
      220,
      22
     ],
     "numinlets": 1,
     "numoutlets": 0,
     "text": "release ms, max 50 (default 10)"
    }
   },
   {
    "box": {
     "id": "pset",
     "maxclass": "newobj",
     "patching_rect": [
      460,
      380,
      91,
      22
     ],
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "text": "prepend set"
    }
   },
   {
    "box": {
     "id": "info",
     "maxclass": "message",
     "patching_rect": [
      460,
      410,
      420,
      22
     ],
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "text": ""
    }
   },
   {
    "box": {
     "id": "c9",
     "maxclass": "comment",
     "patching_rect": [
      460,
      435,
      560,
      22
     ],
     "numinlets": 1,
     "numoutlets": 0,
     "text": "matched: grain#  grain-Hz  grain-dB  grain-F1  grain-F2 | input-Hz  input-dB  input-F1  input-F2"
    }
   },
   {
    "box": {
     "id": "one",
     "maxclass": "message",
     "patching_rect": [
      420,
      192,
      40,
      22
     ],
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "text": "1"
    }
   }
  ],
  "lines": [
   {
    "patchline": {
     "source": [
      "adc",
      0
     ],
     "destination": [
      "fz",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "adc",
      0
     ],
     "destination": [
      "pk",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "adc",
      0
     ],
     "destination": [
      "ana",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "fz",
      0
     ],
     "destination": [
      "sl",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "sl",
      0
     ],
     "destination": [
      "freqnum",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "freqnum",
      0
     ],
     "destination": [
      "pfreq",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "pfreq",
      0
     ],
     "destination": [
      "js",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "pk",
      0
     ],
     "destination": [
      "atodb",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "atodb",
      0
     ],
     "destination": [
      "ampnum",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "ampnum",
      0
     ],
     "destination": [
      "pamp",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "pamp",
      0
     ],
     "destination": [
      "js",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "lb",
      0
     ],
     "destination": [
      "metro",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "metro",
      0
     ],
     "destination": [
      "tbb",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "tbb",
      1
     ],
     "destination": [
      "pk",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "tbb",
      1
     ],
     "destination": [
      "ana",
      2
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "tbb",
      0
     ],
     "destination": [
      "tick",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "tick",
      0
     ],
     "destination": [
      "js",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "ana",
      0
     ],
     "destination": [
      "js",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "js",
      3
     ],
     "destination": [
      "ana",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "dsp",
      1
     ],
     "destination": [
      "psr",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "psr",
      0
     ],
     "destination": [
      "js",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "gate",
      0
     ],
     "destination": [
      "pgate",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "pgate",
      0
     ],
     "destination": [
      "js",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "fw",
      0
     ],
     "destination": [
      "pfw",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "pfw",
      0
     ],
     "destination": [
      "js",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "aw",
      0
     ],
     "destination": [
      "paw",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "paw",
      0
     ],
     "destination": [
      "js",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "tw",
      0
     ],
     "destination": [
      "ptw",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "ptw",
      0
     ],
     "destination": [
      "js",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "mw",
      0
     ],
     "destination": [
      "pmw",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "pmw",
      0
     ],
     "destination": [
      "js",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "off",
      0
     ],
     "destination": [
      "poff",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "poff",
      0
     ],
     "destination": [
      "js",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "lb",
      0
     ],
     "destination": [
      "one",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "one",
      0
     ],
     "destination": [
      "cmntog",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "cmntog",
      0
     ],
     "destination": [
      "pcmn",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "pcmn",
      0
     ],
     "destination": [
      "js",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "js",
      0
     ],
     "destination": [
      "playA",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "js",
      1
     ],
     "destination": [
      "lineA",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "playA",
      0
     ],
     "destination": [
      "vcaA",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "lineA",
      0
     ],
     "destination": [
      "vcaA",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "vcaA",
      0
     ],
     "destination": [
      "dac",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "vcaA",
      0
     ],
     "destination": [
      "dac",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "js",
      4
     ],
     "destination": [
      "playB",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "js",
      5
     ],
     "destination": [
      "lineB",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "playB",
      0
     ],
     "destination": [
      "vcaB",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "lineB",
      0
     ],
     "destination": [
      "vcaB",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "vcaB",
      0
     ],
     "destination": [
      "dac",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "vcaB",
      0
     ],
     "destination": [
      "dac",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "js",
      2
     ],
     "destination": [
      "pset",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "pset",
      0
     ],
     "destination": [
      "info",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "att",
      0
     ],
     "destination": [
      "patt",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "patt",
      0
     ],
     "destination": [
      "js",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "rel",
      0
     ],
     "destination": [
      "prel",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "prel",
      0
     ],
     "destination": [
      "js",
      0
     ]
    }
   }
  ]
 }
}