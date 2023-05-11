    .section .rodata

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
