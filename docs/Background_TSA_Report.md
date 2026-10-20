# Background TSA Maps from PNGs: Eight Backgrounds

## Objective
Remove the raw binary tile maps (`.bin`) for eight backgrounds from the repository and make a picture the source of each map. These are the backgrounds that were still built with `.4bpp.lz` tiles and a raw `.bin` map (see `data/data_bg.s`), instead of the generated `.feimg2.bin` / `.fetsa2.bin` pair that most other backgrounds use: Cell, Grass_Plains_2, Interior_Black, Castle_Back, Garden, Manse_Back, Serafew_Village, and Volcano.

## Format
A background map is a TSA: one byte of width-1, one byte of height-1, then width × height little-endian 16-bit entries, row by row from the top-left. Each entry is:

- bits 0–9: tile index into the tile sheet
- bit 10: horizontal flip
- bit 11: vertical flip
- bits 12–15: palette bank

All eight maps are 30 × 20 (the 240 × 160 screen), so each file is 2 + 600 × 2 = 1202 bytes.

## Why `tsa_generator.py` is not used
`tsa_generator.py` builds the tile sheet and the map from one image, and it assigns its own tile numbers. These backgrounds already have a tile sheet (`bg_<Name>.png`, an 8-pixel-wide strip), and the original maps use that sheet's own numbering. Rebuilding Cell, Grass_Plains_2, and Interior_Black through the generator reproduced the pixels and palette banks, but none matched the original map byte-for-byte. The generator itself notes the limitation: "Allow arbitrary index sequence order. For example bg_Volcano…".

## What changed
- `scripts/tsa_png.py` builds a map from a screen PNG, using the existing tile sheet as the reference for tile numbers. It can also render a map into a screen PNG.
- `graphics/bg/bg_<Name>.screen.png` is the 240 × 160 indexed picture of each background. A pixel's palette index is `bank × 16 + colour`, so the picture carries the palette bank. The PNG's palette is a copy of `bg_<Name>.pal`; the build still takes the game palette from the `.pal` file.
- `graphics/bg/bg_Manse_Back.overrides` lists 17 cells whose map entry the picture cannot determine (see below).
- The Makefile has a rule that builds `%.bin` from `%.screen.png`, `%.png` (the tile sheet), and `%.overrides` if it exists. `data/data_bg.s` is unchanged and still `.incbin`s the `.bin` path.
- The eight `.bin` files are removed from git and listed in `.gitignore` as generated files.

To change a background, edit its `.screen.png` and rebuild. To use it for a new background, render the existing map once:

    python3 scripts/tsa_png.py render map.bin tiles.png palette.pal screen.png

## How the tile sheet is read
The tile sheets are 4-bit grayscale PNGs. `gbagfx` reads a PNG without a palette inverted, so a pixel's colour is `15 - gray level` (Pillow shows the gray levels as 0, 17, …, 255). `scripts/tsa_png.py` follows the same rule, so a screen PNG painted with the game palette lines up with the sheet.

## How the map is built from the picture
For each 8 × 8 cell, the script looks up the cell's pixels in the tile sheet, with and without flips, and takes the palette bank from the pixel indices. If a cell uses pixels that are not in the tile sheet, or more than one palette bank, the script stops with a message that names the cell.

A flipped symmetric tile looks the same as an unflipped one, so the picture cannot say which one the original map used. By default the script picks the lowest tile number with the fewest flips. The 17 cells in Manse_Back that differ from that choice are symmetric tiles the original marks as flipped, and `bg_Manse_Back.overrides` gives their entries. An override has to produce the same picture as the cell it replaces, or the script stops.

The overrides file was produced with the `--expect` option, which compares the built map with a known-good one and prints the lines to add.

| Background | Palette banks used | Horizontal flips | Vertical flips | Overrides |
|---|---|---|---|---|
| Cell | 0–1 | 120 | 1 | 0 |
| Grass_Plains_2 | 0–4 | 4 | 1 | 0 |
| Interior_Black | 0 | 0 | 0 | 0 |
| Castle_Back | 0–7 | 8 | 5 | 0 |
| Garden | 0–6 | 0 | 0 | 0 |
| Manse_Back | 0–6 | 597 | 1 | 17 |
| Serafew_Village | 0–5 | 0 | 0 | 0 |
| Volcano | 0–5 | 4 | 3 | 0 |

## Verification
- All eight maps built from their PNGs are byte-identical to the original `.bin` files on `master`.
- The Makefile rule was run with GNU Make for all eight targets after deleting the generated `.bin` files. Every output was byte-identical to the original, and the overrides option was passed to Manse_Back automatically.
- The script stops with a clear message on: a cell that matches no tile in the sheet, a cell with more than one palette bank, an override that contradicts the picture, and a non-indexed image.
- Editing a cell in a PNG and rebuilding changes exactly that map entry.
- The full ROM build was not run locally.

## Limitations
- A picture can only use tiles that exist in the tile sheet. Adding new tiles would mean extending the sheet, which this script does not do.
- The PNG's palette is informational. Changing colours means changing `bg_<Name>.pal`.

## Not in this change
- `bg_Stone_Chamber.bin` and `bg_Throne_Normal.bin` are no longer referenced by `data/data_bg.s`, which uses the generated files instead. They look like leftovers and could be deleted separately.
