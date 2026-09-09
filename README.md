# Fire Emblem: The Sacred Stones

[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=flat-square)](http://makeapullrequest.com)

[FE Decomp Portal](https://laqieer.github.io/fe-decomp-portal/)

This is a disassembly of Fire Emblem: The Sacred Stones (U)[!]

It builds the following ROM:
* fireemblem8.gba `sha1: c25b145e37456171ada4b0d440bf88a19f4d509f`

### Quick Start

If you just want to get the repo building quickly (Ubuntu/WSL, Arch Linux, or macOS/Homebrew), drop your legally obtained ROM at the repo root as `baserom.gba` and run:

```
./scripts/quickstart.sh [--rom /path/to/baserom.gba] [--refresh-agbcc]
```

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

1. You must have a copy of the Fire Emblem: The Sacred Stones ROM named `baserom.gba` in the repository directory.
2. Install [devkitPro](https://devkitpro.org/wiki/Getting_Started) or [GNU Arm Embedded Toolchain](https://developer.arm.com/tools-and-software/open-source-software/developer-tools/gnu-toolchain/gnu-rm).
```
# for Ubuntu/WSL users
apt install binutils-arm-none-eabi
```
3. Install [agbcc](https://github.com/pret/agbcc) to this project.
```
cd /path/to/agbcc
./build.sh
./install.sh /path/to/fireemblem8u
```
4. Build tools.
```
cd /path/to/fireemblem8u
./build_tools.sh
```
5. Build the project.
```
git submodule update --init mgfembp
make
```
The embedded FE6 save-report program is built from the pinned `mgfembp`
submodule. On its first build, its installer downloads and builds the separate
agbcc variant required by that program. Later builds use the installed compiler.
The main ROM comparison also verifies the compressed payload.
6. You will see this for success.
```
fireemblem8.gba: OK
```

Q: `fatal error: png.h: No such file or directory`

A: Install [libpng](http://www.libpng.org/pub/png/libpng.html) to build `tools/gbagfx`.

Q: `make: *** No rule to make target 'baserom.gba', needed by 'xxx'.  Stop.`

A: You must place a copy of the Fire Emblem: The Sacred Stones ROM named `baserom.gba` in the repository directory.

Q: `unrecognized option '--add-symbol'`

A: Update your devkitPro or embedded toolchain. Read [this](https://github.com/bminor/binutils-gdb/blob/3451a2d7a3501e9c3fc344cbc4950c495f30c16d/binutils/ChangeLog-2015#L120) for more info.

Q: `.dep/src/xxx.d:2: *** missing separator.  Stop.`

A: `rm -rf .dep` or disable [VSCode Extension: Makefile Tools](https://marketplace.visualstudio.com/items?itemName=ms-vscode.makefile-tools) if installed.

Check [INSTALL.md](https://github.com/pret/pokeruby/blob/master/INSTALL.md) and [INSTALL.md](https://github.com/pret/pokeemerald/blob/master/INSTALL.md) if you have trouble in setting up.

Check [remove_tools](https://github.com/laqieer/fireemblem8u/tree/remove_tools) branch if you don't want to build agbcc and other tools by yourself. It uses docker to make setting up easier. Follow its [README.md](https://github.com/laqieer/fireemblem8u/blob/remove_tools/README.md) instead.
