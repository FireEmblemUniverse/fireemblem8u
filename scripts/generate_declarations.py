#!/bin/python3

PREFIX = DemonLightBg4_Close
LENGTH = 8

for i in range(1, 1 + LENGTH):
    print(f"extern u16 CONST_DATA Pal_{PREFIX}_{i}[];")

for i in range(1, 1 + LENGTH):
    print(f"    Pal_{PREFIX}_{i},")

for i in range(1, 1 + LENGTH):
    print(f"    .global Pal_{PREFIX}_{i}")
    print(f"Pal_{PREFIX}_{i}:")
    print(f"    .incbin \"graphics/efxdragon/{PREFIX}_{i}.gbapal\"")
    print("")

for i in range(1, 1 + LENGTH):
    print(f"extern u16 CONST_DATA Tsa_{PREFIX}_{i}[];")

for i in range(1, 1 + LENGTH):
    print(f"    Tsa_{PREFIX}_{i},")

for i in range(1, 1 + LENGTH):
    print(f"    .global Tsa_{PREFIX}_{i}")
    print(f"Tsa_{PREFIX}_{i}:")
    print(f"    .incbin \"graphics/efxdragon/{PREFIX}_{i}.fetsa1.bin.lz\"")
    print("")

for i in range(1, 1 + LENGTH):
    print(f"extern u16 CONST_DATA Img_{PREFIX}_{i}[];")

for i in range(1, 1 + LENGTH):
    print(f"    Img_{PREFIX}_{i},")

for i in range(1, 1 + LENGTH):
    print(f"    .global Img_{PREFIX}_{i}")
    print(f"Img_{PREFIX}_{i}:")
    print(f"    .incbin \"graphics/efxdragon/{PREFIX}_{i}.feimg1.bin.lz\"")
    print("")
