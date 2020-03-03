    .include "proc.inc"
    .include "macro.inc"

    .section .data

    .global gUnknown_08590FEC
gUnknown_08590FEC:  @ 0x08590FEC
    .incbin "baserom.gba", 0x590FEC, 0x20

    .global gUnknown_0859100C
gUnknown_0859100C:  @ 0x0859100C
    .incbin "baserom.gba", 0x59100C, 0x1A

    .global gUnknown_08591026
gUnknown_08591026:  @ 0x08591026
    .incbin "baserom.gba", 0x591026, 0x1A

    .global gUnknown_08591040
gUnknown_08591040:  @ 0x08591040
    .incbin "baserom.gba", 0x591040, 0x26

    .global gUnknown_08591066
gUnknown_08591066:  @ 0x08591066
    .incbin "baserom.gba", 0x591066, 0x26

    .global gUnknown_0859108C
gUnknown_0859108C:  @ 0x0859108C
    .incbin "baserom.gba", 0x59108C, 0x32

    .global gUnknown_085910BE
gUnknown_085910BE:  @ 0x085910BE
    .incbin "baserom.gba", 0x5910BE, 0x32

    .global gUnknown_085910F0
gUnknown_085910F0:  @ 0x085910F0
    .incbin "baserom.gba", 0x5910F0, 0x32

    .global gUnknown_08591122
gUnknown_08591122:  @ 0x08591122
    .incbin "baserom.gba", 0x591122, 0x32

    .global gUnknown_08591154
gUnknown_08591154:  @ 0x08591154
    .2byte 1
    .2byte 0
    .word gUnknown_080D77B4
    .2byte 8
    .2byte 0
    .word gUnknown_0859A548
    .2byte 14
    .2byte 0
    .word NULL
    .2byte 2
    .2byte 0
    .word Load6CFACEGraphics
    .2byte 2
    .2byte 0
    .word sub_80055BC
    .2byte 3
    .2byte 0
    .word sub_80055BC
    .2byte 0
    .2byte 0
    .word NULL

    .global gUnknown_0859118C
gUnknown_0859118C:  @ 0x0859118C
    .2byte 1
    .2byte 0
    .word gUnknown_080D77B4
    .2byte 8
    .2byte 0
    .word gUnknown_0859A548
    .2byte 14
    .2byte 1
    .word NULL
    .2byte 2
    .2byte 0
    .word Load6CFACEGraphics
    .2byte 2
    .2byte 0
    .word sub_80055BC
    .2byte 3
    .2byte 0
    .word sub_80055BC
    .2byte 0
    .2byte 0
    .word NULL

    .global gUnknown_085911C4
gUnknown_085911C4:  @ 0x085911C4
    .incbin "baserom.gba", 0x5911C4, 0x14

    .global gUnknown_085911D8
gUnknown_085911D8:  @ 0x085911D8
    .incbin "baserom.gba", 0x5911D8, 0x10

    .global gUnknown_085911E8
gUnknown_085911E8:  @ 0x085911E8
    .incbin "baserom.gba", 0x5911E8, 0xE

    .global gUnknown_085911F6
gUnknown_085911F6:  @ 0x085911F6
    .incbin "baserom.gba", 0x5911F6, 0xE

    .global gUnknown_08591204
gUnknown_08591204:  @ 0x08591204
    .incbin "baserom.gba", 0x591204, 0x30

    .global gUnknown_08591234
gUnknown_08591234:  @ 0x08591234
    .incbin "baserom.gba", 0x591234, 0x18

    .global gUnknown_0859124C
gUnknown_0859124C:  @ 0x0859124C
    .incbin "baserom.gba", 0x59124C, 0x18

    .global gUnknown_08591264
gUnknown_08591264:  @ 0x08591264
    .incbin "baserom.gba", 0x591264, 0xA0

    .global gUnknown_08591304
gUnknown_08591304:  @ 0x08591304
    .incbin "baserom.gba", 0x591304, 0x38

    .global gUnknown_0859133C
gUnknown_0859133C:  @ 0x0859133C
    .incbin "baserom.gba", 0x59133C, 0x4

    .global gUnknown_08591340
gUnknown_08591340:  @ 0x08591340
    .incbin "baserom.gba", 0x591340, 0x18

    .global gUnknown_08591358
gUnknown_08591358:  @ 0x08591358
    .incbin "baserom.gba", 0x591358, 0x30

    .global gUnknown_08591388
gUnknown_08591388:  @ 0x08591388
    .incbin "baserom.gba", 0x591388, 0x8

    .global gUnknown_08591390
gUnknown_08591390:  @ 0x08591390
    .incbin "baserom.gba", 0x591390, 0x20

    .global gUnknown_085913B0
gUnknown_085913B0:  @ 0x085913B0
    .incbin "baserom.gba", 0x5913B0, 0x20

    .global gUnknown_085913D0
gUnknown_085913D0:  @ 0x085913D0
    .incbin "baserom.gba", 0x5913D0, 0x20

    .global gUnknown_085913F0
gUnknown_085913F0:  @ 0x085913F0
    .incbin "baserom.gba", 0x5913F0, 0x40

    .global gUnknown_08591430
gUnknown_08591430:  @ 0x08591430
    .incbin "baserom.gba", 0x591430, 0x40

    .global gUnknown_08591470
gUnknown_08591470:  @ 0x08591470
    .incbin "baserom.gba", 0x591470, 0x20

    .global gUnknown_08591490
gUnknown_08591490:  @ 0x08591490
    .incbin "baserom.gba", 0x591490, 0x10

    .global gUnknown_085914A0
gUnknown_085914A0:  @ 0x085914A0
    .incbin "baserom.gba", 0x5914A0, 0x10

    .global gUnknown_085914B0
gUnknown_085914B0:  @ 0x085914B0
    .incbin "baserom.gba", 0x5914B0, 0x18

    .global gUnknown_085914C8
gUnknown_085914C8:  @ 0x085914C8
    .incbin "baserom.gba", 0x5914C8, 0x28

    .global gUnknown_085914F0
gUnknown_085914F0:  @ 0x085914F0
    .incbin "baserom.gba", 0x5914F0, 0x30

    .global gUnknown_08591520
gUnknown_08591520:  @ 0x08591520
    .incbin "baserom.gba", 0x591520, 0x10

    .global gUnknown_08591530
gUnknown_08591530:  @ 0x08591530
    .incbin "baserom.gba", 0x591530, 0x10

    .global gUnknown_08591540
gUnknown_08591540:  @ 0x08591540
    .incbin "baserom.gba", 0x591540, 0x30

    .global gUnknown_08591570
gUnknown_08591570:  @ 0x08591570
    .incbin "baserom.gba", 0x591570, 0x20

    .global gUnknown_08591590
gUnknown_08591590:  @ 0x08591590
    .incbin "baserom.gba", 0x591590, 0x1A

    .global gUnknown_085915AA
gUnknown_085915AA:  @ 0x085915AA
    .incbin "baserom.gba", 0x5915AA, 0x62

    .global gUnknown_0859160C
gUnknown_0859160C:  @ 0x0859160C
    .incbin "baserom.gba", 0x59160C, 0x18

    .global gUnknown_08591624
gUnknown_08591624:  @ 0x08591624
    .incbin "baserom.gba", 0x591624, 0x18

    .global gUnknown_0859163C
gUnknown_0859163C:  @ 0x0859163C
    .incbin "baserom.gba", 0x59163C, 0x50

    .global gUnknown_0859168C
gUnknown_0859168C:  @ 0x0859168C
    .incbin "baserom.gba", 0x59168C, 0x18

    .global gOAMTileSizeLookup
gOAMTileSizeLookup:  @ 0x085916A4
    .incbin "baserom.gba", 0x5916A4, 0x30

    .global gUnknown_085916D4
gUnknown_085916D4:  @ 0x085916D4
    .incbin "baserom.gba", 0x5916D4, 0x3D0




