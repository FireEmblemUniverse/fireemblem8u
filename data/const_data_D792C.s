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

    .global gUnknown_080D7954
gUnknown_080D7954:  @ 0x080D7954
    .incbin "baserom.gba", 0xD7954, 0x10

    .global gUnknown_080D7964
gUnknown_080D7964:  @ 0x080D7964
@ replacing .incbin "baserom.gba", 0x000d7964, 0x60
    .4byte Proc_Start
    .4byte sub_80018E4
    .4byte 0x00000001
    .4byte Proc_Start
    .4byte sub_8001860
    .4byte 0xffffffff
    .4byte Proc_StartBlocking
    .4byte sub_80018E4
    .4byte 0x00000001
    .4byte Proc_StartBlocking
    .4byte sub_8001860
    .4byte 0xffffffff
    .4byte Proc_Start
    .4byte sub_80019E8
    .4byte 0xffffffff
    .4byte Proc_Start
    .4byte sub_8001964
    .4byte 0x00000001
    .4byte Proc_StartBlocking
    .4byte sub_80019E8
    .4byte 0xffffffff
    .4byte Proc_StartBlocking
    .4byte sub_8001964
    .4byte 0x00000001

    .global gUnknown_080D79C4
gUnknown_080D79C4:  @ 0x080D79C4
    .incbin "baserom.gba", 0xD79C4, 0xC

    .global gUnknown_080D79D0
gUnknown_080D79D0:  @ 0x080D79D0
    .incbin "baserom.gba", 0xD79D0, 0x8


