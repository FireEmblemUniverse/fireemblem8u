# TSA previews (preview-only, NOT part of the ROM build)

`preview/tsa/**/*.png` are rendered previews of the game's TSA / tilemap data
(`graphics/**/*.tsa.bin` headered and `*.map.bin` headerless), so the arrangements
can be inspected visually. Each preview is the tilemap rendered with its tileset
(4bpp) and palette using `scripts/gfxtools/tsa_preview.py`.

These PNGs are **previews only**: nothing INCBINs them and no rule builds them, so
`gbagfx`/`make` never touch them (they live outside `graphics/` and are not `.4bpp`
artifacts, so `make clean` leaves them in place). They are committed for review.

- `preview/tsa/MANIFEST.tsv` — each preview's tileset/palette pairing + a coherence
  confidence score. Rows with confidence < 1.2 are auto-paired but unverified — the
  tileset/palette pairing may be wrong; review before trusting.
- `preview/tsa/UNPAIRED.txt` — in-scope TSAs whose tileset/palette could not be
  auto-resolved yet.

Re-render one: `python3 scripts/gfxtools/tsa_preview.py <tsa> <tiles.4bpp[.lz]> <pal.gbapal> out.png [--width W] [--offset O]`

## Audit (mis-classified / hidden assets)
All `*.tsa.bin`/`*.map.bin` were audited. No data is mis-classified and no TSA hides
a trailing foreign asset. Apparent size anomalies are all explained and benign:
multi-frame `&HEADERTSA` "anime pattern" TSAs (e.g. `gUnknown_085B0F2C`,
`gUnknown_08A0A9F8` — confirmed via FEBuilderGBA, used by `CallARM_FillTileRect`),
a 1-tile alignment pad on 58 headered `.tsa.bin`, and 5 intentionally-empty effect
layers (one literally named `..._Clear`).
