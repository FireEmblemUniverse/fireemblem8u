# Fire Emblem: The Sacred Stones

[![buddy pipeline](https://app.buddy.works/destinybreaknowel/fireemblem8u/pipelines/pipeline/352815/badge.svg?token=61eea1d37289fa9621fff3ce067c98559da0750abf5597ae53c4d4b3085d20f9 "buddy pipeline")](https://app.buddy.works/destinybreaknowel/fireemblem8u/pipelines/pipeline/352815) [![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=flat-square)](http://makeapullrequest.com)

This is a disassembly of Fire Emblem: The Sacred Stones (U)[!]

It builds the following ROM:
* fireemblem8.gba `sha1: c25b145e37456171ada4b0d440bf88a19f4d509f`

### Setting up the repository

* You must have a copy of the Fire Emblem: The Sacred Stones ROM named `baserom.gba` in the repository directory.

* Install [**devkitARM**](https://devkitpro.org/wiki/Getting_Started).

* You can then build fireemblem8 using `make` in the MSYS environment provided with devkitARM.

```
sort of how-to for setting up fireemblem8u
1] setup cygwin or whatever (Windows user)
2] clone https://github.com/luckytyphlosion/agbcc/tree/new_layout_with_libs somewhere (lets say C:/agbsdk) (be careful to checkout the new_layout_with_libs branch and NOT master!)
3] cd agbsdk
4] ./build.sh
5] cd ..
6] clone https://github.com/FireEmblemUniverse/fireemblem8u somewhere (lets say C:/fireemblem8u)
7] cd agbsdk
8] ./install.sh C:/fireemblem8u
9] put clean FE8 US ROM into C:/fireemblem8u and name it baserom.gba
10] ./build_tools.sh (or ./build_tools_mac.sh for Mac user) in FE repo you cloned
11] fix Makefile to point to tools/binutils/bin/
12] make


Q1: Help, it said Makefile:1: /base_tools: No such file or directory when I was compiling agbcc!
A1: You didn't check out the new_layout_with_libs branch. This is a dependency on Devkitpro, which this branch abandons. 

Q2: fatal error: png.h: No such file or directory
A2: Install libpng dev library to build tools/gbagfx. Especially MSYS2 used in devkitARM does not include libpng-dev so it must be built from source.

Q3: make: *** No rule to make target `baserom.gba', needed by `data/const_data_1609BC.o'.  Stop.
A3: You must place a copy of the Fire Emblem: The Sacred Stones ROM named baserom.gba in the repository directory.
```

Check [INSTALL.md](https://github.com/pret/pokeruby/blob/master/INSTALL.md) and [INSTALL.md](https://github.com/pret/pokeemerald/blob/master/INSTALL.md) if you have trouble in setting up.

Check [remove_tools](https://github.com/laqieer/fireemblem8u/tree/remove_tools) branch if you don't want to build agbcc and other tools by yourself. It uses docker to make setting up easier. Follow its [README.md](https://github.com/laqieer/fireemblem8u/blob/remove_tools/README.md) instead.
