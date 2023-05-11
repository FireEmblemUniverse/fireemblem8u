    .include "macro.inc"

    .section .data

    .global ProcScr_FadeCore
ProcScr_FadeCore:  @ 0x0859A0A4
    .2byte 15
    .2byte 10
    .4byte NULL

    .2byte 2
    .2byte 0
    .4byte sub_80140F4

    .2byte 14
    .2byte 0
    .4byte NULL

    .2byte 2
    .2byte 0
    .4byte sub_8014124

    .2byte 3
    .2byte 0
    .4byte sub_8014100

    .2byte 0
    .2byte 0
    .4byte NULL

    .global gUnknown_0859A0D4
gUnknown_0859A0D4:  @ 0x0859A0D4
    .2byte 14
    .2byte 0
    .4byte NULL

    .2byte 3
    .2byte 0
    .4byte Timer6C_Countdown

    .2byte 0
    .2byte 0
    .4byte NULL

    .global gUnknown_0859A0EC
gUnknown_0859A0EC:  @ 0x0859A0EC
    .incbin "baserom.gba", 0x59A0EC, 0x4

    .global gUnknown_0859A0F0
gUnknown_0859A0F0:  @ 0x0859A0F0
    .incbin "baserom.gba", 0x59A0F0, 0x3

    .global gUnknown_0859A0F3
gUnknown_0859A0F3:  @ 0x0859A0F3
    .incbin "baserom.gba", 0x59A0F3, 0x1

    .global gUnknown_0859A0F4
gUnknown_0859A0F4:  @ 0x0859A0F4
    .incbin "baserom.gba", 0x59A0F4, 0x4

    .global gUnknown_0859A0F8
gUnknown_0859A0F8:  @ 0x0859A0F8
    .2byte 3
    .2byte 0
    .4byte sub_80144FC

    .global gUnknown_0859A100
gUnknown_0859A100:  @ 0x0859A100
    .2byte 3
    .2byte 0
    .4byte FutureCall2_Loop

    .2byte 0
    .2byte 0
    .4byte NULL

    .global gUnknown_0859A110
gUnknown_0859A110:  @ 0x0859A110
    .2byte 3
    .2byte 0
    .4byte FutureCall_Loop

    .2byte 0
    .2byte 0
    .4byte NULL

    .global Pal_AllBlack
Pal_AllBlack:  @ 0x0859A120
    .incbin "baserom.gba", 0x59A120, 0x20

    .global Pal_AllWhite
Pal_AllWhite:  @ 0x0859A140
    .incbin "baserom.gba", 0x59A140, 0x20

    .global gUnknown_0859A160
gUnknown_0859A160:  @ 0x0859A160
    .incbin "baserom.gba", 0x59A160, 0x20

    .global gUnknown_0859A180
gUnknown_0859A180:  @ 0x0859A180
    .incbin "baserom.gba", 0x59A180, 0x20

    .global gUnknown_0859A1A0
gUnknown_0859A1A0:  @ 0x0859A1A0
    .incbin "baserom.gba", 0x59A1A0, 0x20

    .global gUnknown_0859A1C0
gUnknown_0859A1C0:  @ 0x0859A1C0
    .incbin "baserom.gba", 0x59A1C0, 0x20

    .global gUnknown_0859A1E0
gUnknown_0859A1E0:  @ 0x0859A1E0
    .2byte 3
    .2byte 0
    .4byte sub_8014968

    .2byte 0
    .2byte 0
    .4byte NULL
