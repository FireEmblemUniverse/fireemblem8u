# Fire Emblem: The Sacred Stones

[![buddy pipeline](https://app.buddy.works/destinybreaknowel/fireemblem8u/pipelines/pipeline/352815/badge.svg?token=61eea1d37289fa9621fff3ce067c98559da0750abf5597ae53c4d4b3085d20f9 "buddy pipeline")](https://app.buddy.works/destinybreaknowel/fireemblem8u/pipelines/pipeline/352815) [![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=flat-square)](http://makeapullrequest.com)

This is a disassembly of Fire Emblem: The Sacred Stones (U)[!]

It builds the following ROM:
* fireemblem8.gba `sha1: c25b145e37456171ada4b0d440bf88a19f4d509f`

### Setting up the repository

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
# for Mac users
./build_tools_mac.sh
# for other users
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

A: You must place a copy of the Fire Emblem: The Sacred Stones ROM named `baserom.gba` in the repository directory.

Q: `unrecognized option '--add-symbol'`

A: Update your devkitPro or embedded toolchain. Read [this](https://github.com/bminor/binutils-gdb/blob/3451a2d7a3501e9c3fc344cbc4950c495f30c16d/binutils/ChangeLog-2015#L120) for more info.

Check [INSTALL.md](https://github.com/pret/pokeruby/blob/master/INSTALL.md) and [INSTALL.md](https://github.com/pret/pokeemerald/blob/master/INSTALL.md) if you have trouble in setting up.

Check [remove_tools](https://github.com/laqieer/fireemblem8u/tree/remove_tools) branch if you don't want to build agbcc and other tools by yourself. It uses docker to make setting up easier. Follow its [README.md](https://github.com/laqieer/fireemblem8u/blob/remove_tools/README.md) instead.
