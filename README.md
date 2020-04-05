# Fire Emblem: The Sacred Stones

[![buddy pipeline](https://app.buddy.works/laqieer/fireemblem8u/pipelines/pipeline/242146/badge.svg?token=17a080ae6f8b131ee525769bd14c9c265def2701a1a6e03ec223ca9213c46a9f "buddy pipeline")](https://app.buddy.works/laqieer/fireemblem8u/pipelines/pipeline/242146) [![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=flat-square)](http://makeapullrequest.com)

This is a disassembly of Fire Emblem: The Sacred Stones (U)[!]

It builds the following ROM:
* fireemblem8.gba `sha1: c25b145e37456171ada4b0d440bf88a19f4d509f`

### Setting up the repository

* You must have a copy of the Fire Emblem: The Sacred Stones ROM named `baserom.gba` in the repository directory.

* Install [**devkitARM**](http://devkitpro.org/wiki/Getting_Started/devkitARM).

* Then get the build tools from https://github.com/pret/pokeruby-tools. Copy the `tools/` folder into the repository directory. If you want to build the tools yourself, grab the libpng-devel package and run build_tools.sh instead.

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
10] ./build_tools.sh in FE repo you cloned
11] fix Makefile to point to tools/binutils/bin/
12] make


Q1: Help, it said Makefile:1: /base_tools: No such file or directory when I was compiling agbcc!
A1: You didn't check out the new_layout_with_libs branch. This is a dependency on Devkitpro, which this branch abandons. 
```

Check branch `remove_tools` if you find it too hard to set up the local build environment.
