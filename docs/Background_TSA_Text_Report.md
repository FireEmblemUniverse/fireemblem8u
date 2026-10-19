# Background TSA Maps as Text: Cell, Grass_Plains_2, Interior_Black

## Objective
Remove the raw binary tile maps (`.bin`) for three backgrounds from the repository. These are the backgrounds still built with `.4bpp.lz` tiles and a raw `.bin` map (see `data/data_bg.s`), instead of the generated `.feimg2.bin` / `.fetsa2.bin` pair that most other backgrounds use.

## Format
A background map is a TSA: one byte of width-1, one byte of height-1, then width × height little-endian 16-bit entries, row by row from the top-left. Each entry is:

- bits 0–9: tile index into the tile sheet
- bit 10: horizontal flip
- bit 11: vertical flip
- bits 12–15: palette bank

All three maps are 30 × 20 (the 240 × 160 screen), so each file is 2 + 600 × 2 = 1202 bytes.

## Why the generator does not reproduce these maps
The usual path is `scripts/gfxtools/tsa_generator.py` on a 240 × 160 indexed PNG. Because these backgrounds have their tile sheets as 8-pixel-wide strips rather than full images, the composite image had to be rebuilt from the strip, the map, and the palette.

Rebuilding Cell, Grass_Plains_2, and Interior_Black this way gave the same pixels and palette banks, but none matched the original map byte-for-byte. The generator assigns its own tile numbers, which differ from the original maps. The original maps use the tile sheet's order directly. For example, Interior_Black's original entries are `0x017c 0x017d 0x017e …`, but the generator emits `0x010f 0x0110 0x0111 …`.

Matching the original tile order would need a tile-order option in the generator, which is still an open TODO in `tsa_generator.py` ("Allow arbitrary index sequence order"). Until that exists, the text grid is the safe way to keep these maps exact.

## What changed
- `scripts/tsa_text.py` converts a TSA to a text grid and back. It uses only the Python standard library.
- `graphics/bg/bg_Cell.tsa.txt`, `bg_Grass_Plains_2.tsa.txt`, and `bg_Interior_Black.tsa.txt` hold the three maps as text.
- The Makefile has a rule that builds `%.bin` from `%.tsa.txt`, so `data/data_bg.s` is unchanged and still `.incbin`s the `.bin` path.
- The three `.bin` files are removed from git and listed in `.gitignore` as generated files.

## Verification
- Each text file converts back to a byte-identical `.bin`, checked against the committed file for all three maps.
- The rule runs the same command as the check above. `make` isn't installed on the machine used for this change, so the rule itself hasn't been run locally. CI builds the ROM on push and will exercise it.
- The palette bank and flip bits were checked on the map entries (Cell uses banks 0–1, Grass_Plains_2 banks 0–4, Interior_Black bank 0 only).

## Not in this change
- `bg_Stone_Chamber.bin` and `bg_Throne_Normal.bin` are no longer referenced by `data/data_bg.s`, which uses the generated files instead. They look like leftovers and could be deleted separately.
- The remaining raw backgrounds are Castle_Back, Garden, Manse_Back, Serafew_Village, and Volcano. Each would need the same check.

## Five More Maps: Castle_Back, Garden, Manse_Back, Serafew_Village, Volcano

### Objective
Convert the next five raw background maps (`.bin`, 1202 bytes each) to text sources, the same way as the three maps above. All five are 30 Ã— 20, so each file is 2 + 600 Ã— 2 = 1202 bytes.

### Palette banks and flips
Counts are from the original binary maps (600 entries each).

| Map | Palette banks used | Horizontal flips | Vertical flips | Both flips |
|-----|--------------------|------------------|----------------|------------|
| Castle_Back | 0â€“7 | 8 | 5 | 0 |
| Garden | 0â€“6 | 0 | 0 | 0 |
| Manse_Back | 0â€“6 | 597 | 1 | 0 |
| Serafew_Village | 0â€“5 | 0 | 0 | 0 |
| Volcano | 0â€“5 | 4 | 3 | 3 |

Flips are stored in the entries themselves (bits 10 and 11), so they are kept exactly by the text grid. No flip handling is needed in the converter.

### What changed
- `graphics/bg/bg_Castle_Back.tsa.txt`, `bg_Garden.tsa.txt`, `bg_Manse_Back.tsa.txt`, `bg_Serafew_Village.tsa.txt`, and `bg_Volcano.tsa.txt` hold the five maps as text.
- The five `.bin` files are removed from git and listed in `.gitignore` under the same block as the three earlier maps.
- `data/data_bg.s` is unchanged. The `%.bin: %.tsa.txt` Makefile rule regenerates each `.bin` at build time.

### Verification
- Round trip: each `.tsa.txt` was converted back to a `.bin` with `scripts/tsa_text.py` and compared with the committed original using `cmp`. All five are byte-identical.
- Make: for each map, the committed `.bin` was removed from git, then `make PYTHON=python graphics/bg/bg_<Name>.bin` was run. Each run exited 0, and `make` printed a "Python was not found" message from the Windows Store stub during the run. The regenerated file was compared with `git show HEAD:graphics/bg/bg_<Name>.bin` using `cmp`, and all five are byte-identical.
- Ignore: `git check-ignore` reports each regenerated `.bin` as ignored by the new `.gitignore` entries, so none show as untracked.
- The full ROM build was not run in this change. CI builds the ROM on push.
