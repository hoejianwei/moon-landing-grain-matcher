# Moon Landing Grain Matcher

A Max 9 patch that listens to your mic, detects pitch, loudness, timbre and formants, and plays back the nearest-matching 50 ms grain of the 1969 Moon landing audio.

1. Download or clone this repo and keep the files together.
2. Open `grain_matcher.maxpat` in Max 9.
3. Turn audio on (speaker button, top left) and make sounds into your mic.

`samples/` holds all 2,994 grains as individual WAVs, labelled with dominant frequency and peak level, and `samples/samples.csv` has the measurements.

Source audio: Apollo 11 Moon landing (1969), taken from NTD's YouTube upload https://www.youtube.com/watch?v=cwZb2mqId0A
