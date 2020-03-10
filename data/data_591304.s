    .include "proc.inc"
    .include "macro.inc"

    .section .data

    .incbin "baserom.gba", 0x5916BC, 0x18

    .global gUnknown_085916D4
gUnknown_085916D4:  @ 0x085916D4
    .incbin "baserom.gba", 0x5916D4, 0x3D0
