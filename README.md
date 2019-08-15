# Fire Emblem: The Sacred Stones

This is a disassembly of Fire Emblem: The Sacred Stones (U)[!]

It builds the following ROM:
* fireemblem8.gba `sha1: c25b145e37456171ada4b0d440bf88a19f4d509f`

### Setting up the repository

* You must have a copy of the Fire Emblem: The Sacred Stones ROM named `baserom.gba` in the repository directory.

* Install [**devkitARM**](http://devkitpro.org/wiki/Getting_Started/devkitARM).

* Then get the build tools from https://github.com/pret/pokeruby-tools. Copy the `tools/` folder into the repository directory. If you want to build the tools yourself, grab the libpng-devel package and run build_tools.sh instead.

* You can then build fireemblem8 using `make` in the MSYS environment provided with devkitARM.
