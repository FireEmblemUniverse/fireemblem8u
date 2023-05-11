    .section .rodata

    .global gUnknown_080D792C
gUnknown_080D792C:  @ 0x080D792C
@ replacing .incbin "baserom.gba", 0x000d792c, 0x10
.4byte gBG0TilemapBuffer
.4byte gBG1TilemapBuffer
.4byte gBG2TilemapBuffer
.4byte gBG3TilemapBuffer

    .global gUnknown_080D793C
gUnknown_080D793C:  @ 0x080D793C
    .incbin "baserom.gba", 0xD793C, 0x3

    .global gUnknown_080D793F
gUnknown_080D793F:  @ 0x080D793F
    .incbin "baserom.gba", 0xD793F, 0xF

    .global gUnknown_080D794E
gUnknown_080D794E:  @ 0x080D794E
    .incbin "baserom.gba", 0xD794E, 0x6
