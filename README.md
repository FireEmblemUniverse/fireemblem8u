# Fire Emblem: The Sacred Stones

[![buddy pipeline](https://app.buddy.works/destinybreaknowel/fireemblem8u/pipelines/pipeline/352815/badge.svg?token=61eea1d37289fa9621fff3ce067c98559da0750abf5597ae53c4d4b3085d20f9 "buddy pipeline")](https://app.buddy.works/destinybreaknowel/fireemblem8u/pipelines/pipeline/352815) [![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=flat-square)](http://makeapullrequest.com)

This is a disassembly of Fire Emblem: The Sacred Stones (U)[!]

It builds the following ROM:
* fireemblem8.gba `sha1: c25b145e37456171ada4b0d440bf88a19f4d509f`

### Setting up the repository

1. You must have a copy of the Fire Emblem: The Sacred Stones ROM named `baserom.gba` in the repository directory.
1. Install [**devkitPro**](https://devkitpro.org/wiki/Getting_Started).
1. Install [agbcc](https://github.com/pret/agbcc) to this project.
1. Build tools using `build_tools.sh` or `build_tools_mac.sh` (for Mac users).
1. You can then build fireemblem8 using `make` in the MSYS2 environment provided with devkitPro.
1. You will see `fireemblem8.gba: OK` for success.

Notice that devkitPro is not a must. [GNU Arm Embedded Toolchain](https://developer.arm.com/tools-and-software/open-source-software/developer-tools/gnu-toolchain/gnu-rm) also works. For example, `apt install binutils-arm-none-eabi` (for Ubuntu/WSL users).

Q: `fatal error: png.h: No such file or directory`

A: Install [libpng](http://www.libpng.org/pub/png/libpng.html) to build `tools/gbagfx`.

Q: `make: *** No rule to make target 'baserom.gba', needed by 'xxx'.  Stop.`

A: You must place a copy of the Fire Emblem: The Sacred Stones ROM named `baserom.gba` in the repository directory.

Q: `LF line endings aren't supported.`

A: `git config --global core.autocrlf true`. Read [this](https://docs.github.com/en/get-started/getting-started-with-git/configuring-git-to-handle-line-endings) for more info.

Q: `unrecognized option '--add-symbol'`

A: Update your devkitPro or embedded toolchain. Your `objcopy` version is too old. That option was added in 2015. Read [this](https://github.com/bminor/binutils-gdb/blob/3451a2d7a3501e9c3fc344cbc4950c495f30c16d/binutils/ChangeLog-2015#L120) for more info.

Check [INSTALL.md](https://github.com/pret/pokeruby/blob/master/INSTALL.md) and [INSTALL.md](https://github.com/pret/pokeemerald/blob/master/INSTALL.md) if you have trouble in setting up.

Check [remove_tools](https://github.com/laqieer/fireemblem8u/tree/remove_tools) branch if you don't want to build agbcc and other tools by yourself. It uses docker to make setting up easier. Follow its [README.md](https://github.com/laqieer/fireemblem8u/blob/remove_tools/README.md) instead.
