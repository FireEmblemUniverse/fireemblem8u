    .include "proc.inc"
    .include "macro.inc"

    .section .data

    .global gUnknown_0859168C
gUnknown_0859168C:  @ 0x0859168C
    .incbin "baserom.gba", 0x59168C, 0x18

    .global gOAMTileSizeLookup
gOAMTileSizeLookup:  @ 0x085916A4
    .incbin "baserom.gba", 0x5916A4, 0x30

    .global gUnknown_085916D4
gUnknown_085916D4:  @ 0x085916D4
    .incbin "baserom.gba", 0x5916D4, 0x3D0
