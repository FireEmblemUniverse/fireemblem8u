#!/bin/sh
make -C tools/gbagfx CXX=clang++
make -C tools/scaninc CXX=clang++
make -C tools/bin2c CXX=clang++
make -C tools/aif2pcm CXX=clang++
make -C tools/mid2agb CXX=clang++
make -C tools/textencode CXX=clang++
