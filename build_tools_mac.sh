#!/bin/sh
make -C tools/gbagfx CXX=clang++
make -C tools/scaninc CXX=clang++
make -C tools/bin2c CXX=clang++
