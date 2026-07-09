# Fire Emblem: The Sacred Stones

[![Build CI](https://github.com/laqieer/fireemblem8u/actions/workflows/build.yml/badge.svg)](https://github.com/laqieer/fireemblem8u/actions/workflows/build.yml)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=flat-square)](http://makeapullrequest.com)
[![Code](https://decomp.dev/laqieer/fireemblem8u/us.svg?mode=shield&measure=matched_code_percent&label=Code)](https://decomp.dev/laqieer/fireemblem8u/us)
[![Data](https://decomp.dev/laqieer/fireemblem8u/us.svg?mode=shield&measure=matched_data_percent&label=Data)](https://decomp.dev/laqieer/fireemblem8u/us)
[![Functions](https://decomp.dev/laqieer/fireemblem8u/us.svg?mode=shield&measure=matched_functions_percent&label=Functions)](https://decomp.dev/laqieer/fireemblem8u/us)

[Wiki](https://github.com/laqieer/fireemblem8u/wiki) · [FE Decomp Portal](https://laqieer.github.io/fe-decomp-portal/) · [decomp.dev](https://decomp.dev/laqieer/fireemblem8u/us)

This is a disassembly **and decompilation** of Fire Emblem: The Sacred Stones (U)[!] — the
ROM has been reverse-engineered into C (~99.8% of the code is decompiled; 100% of the data is
extracted and all symbols are documented), and it builds **byte-identical** to the original.

It builds the following ROM:
* fireemblem8.gba `sha1: c25b145e37456171ada4b0d440bf88a19f4d509f`

## Used by

Projects powered by this decomp:

* [**fe-maps**](https://github.com/laqieer/fe-maps) ([site](https://laqieer.github.io/fe-maps/)) — browsable ROM/RAM data maps extracted from this decomp's ELF with `readelf`/`nm -l`.
* [**FE_GBA_Function_Library**](https://github.com/laqieer/FE_GBA_Function_Library) ([site](https://laqieer.github.io/FE_GBA_Function_Library/)) — cross-game function documentation using `nm -l` for signatures and `source:line` links.
* [**FE-Clib-Decomp**](https://github.com/laqieer/FE-Clib-Decomp) — ROM-hacking linker scripts, `lyn` reference assembly, and Event Assembler defines generated from this decomp's ELF.

### Quick Start

If you just want to get the repo building quickly (Ubuntu/WSL, Arch Linux, or macOS/Homebrew), run:

```
./scripts/quickstart.sh [--rom /path/to/baserom.gba] [--refresh-agbcc]
```

The build does **not** require the original ROM — the result is byte-verified against `checksum.sha1`. A `baserom.gba` is only needed if you want to use `asmdiff.sh` for disassembly comparison; pass it with `--rom` (or `FIREEMBLEM8U_ROM=...`) if you have one.

See [`docs/quickstart.md`](docs/quickstart.md) for full details, flags, and troubleshooting tips.

### Building

To build the ROM:
```bash
make fireemblem8.gba -j$(nproc)
```
To clean all build artifacts:
```bash
make clean
```
To clean all build artifacts **except** the extremely slow battle animation compression outputs:
```bash
make clean_fast
```

### Setting up the repository manually

1. Install [devkitPro](https://devkitpro.org/wiki/Getting_Started) or [GNU Arm Embedded Toolchain](https://developer.arm.com/tools-and-software/open-source-software/developer-tools/gnu-toolchain/gnu-rm).
```
# for Ubuntu/WSL users
apt install binutils-arm-none-eabi
```
2. Install [agbcc](https://github.com/pret/agbcc) to this project.
```
cd /path/to/agbcc
./build.sh
./install.sh /path/to/fireemblem8u
```
3. Fetch submodules. The FE6 SIO link payload is built from source via the
   [mgfembp](https://github.com/StanHash/mgfembp) submodule (not a committed blob);
   the first `make` also fetches/builds its own agbcc variant for it.
```
cd /path/to/fireemblem8u
git submodule update --init --recursive
```
4. Build tools.
```
./build_tools.sh
```
5. Build the project.
```
make
```
6. You will see this for success.
```
fireemblem8.gba: OK
```

Q: `fatal error: png.h: No such file or directory`

A: Install [libpng](http://www.libpng.org/pub/png/libpng.html) to build `tools/gbagfx`.

Q: `make: *** No rule to make target 'baserom.gba', needed by 'xxx'.  Stop.`

A: The current tree builds without the original ROM (it is verified against `checksum.sha1`), so this should not happen on an up-to-date checkout. If you hit it on an older revision, either update or place a copy of the Fire Emblem: The Sacred Stones ROM named `baserom.gba` in the repository directory.

Q: `unrecognized option '--add-symbol'`

A: Update your devkitPro or embedded toolchain. Read [this](https://github.com/bminor/binutils-gdb/blob/3451a2d7a3501e9c3fc344cbc4950c495f30c16d/binutils/ChangeLog-2015#L120) for more info.

Q: `.dep/src/xxx.d:2: *** missing separator.  Stop.`

A: `rm -rf .dep` or disable [VSCode Extension: Makefile Tools](https://marketplace.visualstudio.com/items?itemName=ms-vscode.makefile-tools) if installed.

Check [INSTALL.md](https://github.com/pret/pokeruby/blob/master/INSTALL.md) and [INSTALL.md](https://github.com/pret/pokeemerald/blob/master/INSTALL.md) if you have trouble in setting up.

Check [remove_tools](https://github.com/laqieer/fireemblem8u/tree/remove_tools) branch if you don't want to build agbcc and other tools by yourself. It uses docker to make setting up easier. Follow its [README.md](https://github.com/laqieer/fireemblem8u/blob/remove_tools/README.md) instead.
