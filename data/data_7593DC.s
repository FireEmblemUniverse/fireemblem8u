	.section .data

	.global gUnknown_087593DC
gUnknown_087593DC:  @ 0x087593DC
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80e15e8
        @ PROC_SET_END_CB
        .short 0x4, 0x0
        .word nullsub_62
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8074610
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_087593FC
gUnknown_087593FC:  @ 0x087593FC
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80e15fc
        @ PROC_SET_END_CB
        .short 0x4, 0x0
        .word sub_8074634
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8074638
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_0875941C
gUnknown_0875941C:  @ 0x0875941C
	.incbin "baserom.gba", 0x75941C, 0x40

	.global gUnknown_0875945C
gUnknown_0875945C:  @ 0x0875945C
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80e1610
        @ PROC_SET_END_CB
        .short 0x4, 0x0
        .word sub_807478C
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8074798
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80747A4
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08759484
gUnknown_08759484:  @ 0x08759484
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80e1620
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_807490C
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_0875949C
gUnknown_0875949C:  @ 0x0875949C
    .4byte gUnknown_085C48AC + 0x20
    .4byte gUnknown_085C48AC + 0x180
    .4byte gUnknown_085C48AC + 0x2f4
    .4byte gUnknown_085C48AC + 0x488
    .4byte gUnknown_085C48AC + 0x63c
    .4byte gUnknown_085C48AC + 0x814
    .4byte gUnknown_085C48AC + 0xa0c
    .4byte gUnknown_085C48AC + 0xc28
    .4byte gUnknown_085C48AC + 0xe3c
    .4byte gUnknown_085C48AC + 0xf6c
    .4byte gUnknown_085C48AC + 0x1034

	.global gUnknown_087594C8
gUnknown_087594C8:  @ 0x087594C8
    .4byte gUnknown_085BEF94 + 0x774
    .4byte gUnknown_085BEF94 + 0x774
    .4byte gUnknown_085BEF94 + 0x134c
    .4byte gUnknown_085BEF94 + 0x134c
    .4byte gUnknown_085BEF94 + 0x217c
    .4byte gUnknown_085BEF94 + 0x2d40
    .4byte gUnknown_085BEF94 + 0x3980
    .4byte gUnknown_085BEF94 + 0x4704
    .4byte gUnknown_085BEF94 + 0x5408
    .4byte gUnknown_085BEF94 + 0x5408
    .4byte gUnknown_085BEF94 + 0x5408

	.global gUnknown_087594F4
gUnknown_087594F4:  @ 0x087594F4
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80e1658
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80749B0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_0875950C
gUnknown_0875950C:  @ 0x0875950C
    .4byte gUnknown_085C60D4 + 0x20
    .4byte gUnknown_085C60D4 + 0x104
    .4byte gUnknown_085C60D4 + 0x1e8
    .4byte gUnknown_085C60D4 + 0x308
    .4byte gUnknown_085C60D4 + 0x428
    .4byte gUnknown_085C60D4 + 0x544

	.global gUnknown_08759524
gUnknown_08759524:  @ 0x08759524
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80e1680
        @ PROC_SET_END_CB
        .short 0x4, 0x0
        .word sub_8074A54
        @ PROC_SLEEP
        .short 0xe, 0x18
        .word 0x0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08759544
gUnknown_08759544:  @ 0x08759544
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80e168c
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8074A94
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8074AFC
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08759564
gUnknown_08759564:  @ 0x08759564
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8074B38
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8074B40
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_0875957C
gUnknown_0875957C:  @ 0x0875957C
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80e16f0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8074E6C
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8074EDC
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8074F14
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_087595A4
gUnknown_087595A4:  @ 0x087595A4
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80e16fc
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8074F80
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_087595BC
gUnknown_087595BC:  @ 0x087595BC
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80e1708
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80751BC
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_087595D4
gUnknown_087595D4:  @ 0x087595D4
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80e171c
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8075308
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_087595EC
gUnknown_087595EC:  @ 0x087595EC
    .4byte gUnknown_080E2B54 + 0xa00
    .4byte gUnknown_080E2B54 + 0xb14
    .4byte gUnknown_080E2B54 + 0xc38
    .4byte gUnknown_080E2B54 + 0xd10
    .4byte gUnknown_080E2B54 + 0xe2c
    .4byte gUnknown_080E2B54 + 0xf50

	.global gUnknown_08759604
gUnknown_08759604:  @ 0x08759604
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80e1750
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80753FC
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_0875961C
gUnknown_0875961C:  @ 0x0875961C
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80e1768
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_807545C
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08759634
gUnknown_08759634:  @ 0x08759634
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80e177c
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80756BC
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_0875964C
gUnknown_0875964C:  @ 0x0875964C
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80e1794
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8075828
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8075874
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_0875966C
gUnknown_0875966C:  @ 0x0875966C
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80e17ac
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80758D4
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0
	.incbin "baserom.gba", 0x75966C + 0x18, 0x4C8 - 0x18

	.global gUnknown_08759B34
gUnknown_08759B34:  @ 0x08759B34
    .4byte gUnknown_0875966C + 0x19
    .4byte gUnknown_0875966C + 0xf2
    .4byte gUnknown_0875966C + 0x1b1
    .4byte gUnknown_0875966C + 0x271
    .4byte gUnknown_0875966C + 0x333
    .4byte 0x20000000 + gUnknown_0875966C + 0x3f2
    .4byte 0x80000000

	.global gUnknown_08759B50
gUnknown_08759B50:  @ 0x08759B50
	.incbin "baserom.gba", 0x759B50, 0x318

	.global gUnknown_08759E68
gUnknown_08759E68:  @ 0x08759E68
    .4byte gUnknown_08759B34 + 0x1e
    .4byte gUnknown_08759B34 + 0xdd
    .4byte gUnknown_08759B34 + 0x19e
    .4byte 0x30000000 + gUnknown_08759B34 + 0x25c
    .4byte 0x80000000

	.global gUnknown_08759E7C
gUnknown_08759E7C:  @ 0x08759E7C
	.incbin "baserom.gba", 0x759E7C, 0x84

	.global gUnknown_08759F00
gUnknown_08759F00:  @ 0x08759F00
	.incbin "baserom.gba", 0x759F00, 0x90

	.global gUnknown_08759F90
gUnknown_08759F90:  @ 0x08759F90
	.incbin "baserom.gba", 0x759F90, 0x90

	.global gUnknown_0875A020
gUnknown_0875A020:  @ 0x0875A020
	.incbin "baserom.gba", 0x75A020, 0x8C

	.global gUnknown_0875A0AC
gUnknown_0875A0AC:  @ 0x0875A0AC
	.incbin "baserom.gba", 0x75A0AC, 0xF0

	.global gUnknown_0875A19C
gUnknown_0875A19C:  @ 0x0875A19C
@ Replacing .incbin "baserom.gba", 0x75A19C, 0x178
    .4byte gUnknown_0875A0AC + 0xd
    .4byte gUnknown_0875A0AC + 0xd9
    .4byte gUnknown_0875A0AC + 0xd
    .4byte gUnknown_0875A0AC + 0xd9
    .4byte gUnknown_0875A0AC + 0xd
    .4byte gUnknown_0875A0AC + 0xd9
    .4byte gUnknown_0875A0AC + 0xd
    .4byte gUnknown_0875A0AC + 0xd9
    .4byte gUnknown_0875A0AC + 0xd
    .4byte gUnknown_0875A0AC + 0xd9
    .4byte gUnknown_0875A0AC + 0xd
    .4byte gUnknown_0875A0AC + 0xd9
    .4byte gUnknown_0875A0AC + 0x6d
    .4byte gUnknown_0875A0AC + 0xd9
    .4byte gUnknown_0875A0AC + 0x6d
    .4byte gUnknown_0875A0AC + 0xd9
    .4byte gUnknown_0875A0AC + 0x6d
    .4byte gUnknown_0875A0AC + 0xd9
    .4byte gUnknown_0875A0AC + 0x6d
    .4byte gUnknown_0875A0AC + 0xd9
    .4byte gUnknown_0875A0AC + 0x6d
    .4byte gUnknown_0875A0AC + 0xd9
    .4byte gUnknown_0875A0AC + 0x6d
    .4byte gUnknown_0875A0AC + 0xd9
    .4byte 0x80000000
    .4byte 0x80004000
    .4byte 0xffe00000
    .4byte 0x0000fff0
    .4byte 0x40000000
    .4byte 0x00000004
    .4byte 0x0000fff0
    .4byte 0x80004000
    .4byte 0xffea0006
    .4byte 0x00000000
    .4byte 0x00008000
    .4byte 0x000a000a
    .4byte 0x00000000
    .4byte 0x40000000
    .4byte 0xfffd000b
    .4byte 0x0000ffe0
    .4byte 0x00004000
    .4byte 0xffed000d
    .4byte 0x0000ffe8
    .4byte 0x00000000
    .4byte 0xfff5000f
    .4byte 0x0000ffe0
    .4byte 0x00004000
    .4byte 0x0010002d
    .4byte 0x0000fff0
    .4byte 0x00000000
    .4byte 0x0020002f
    .4byte 0x0000fff0
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x80004000
    .4byte 0xffd90040
    .4byte 0x00000000
    .4byte 0x00008000
    .4byte 0xfff90044
    .4byte 0x00000000
    .4byte 0x80004000
    .4byte 0xffd90045
    .4byte 0x0000fff0
    .4byte 0x40000000
    .4byte 0xfff90049
    .4byte 0x0000fff0
    .4byte 0x80004000
    .4byte 0xffe0004b
    .4byte 0x0000ffe0
    .4byte 0x00000000
    .4byte 0x0000006f
    .4byte 0x0000ffe8
    .4byte 0x40000000
    .4byte 0xffb10050
    .4byte 0x0000fff0
    .4byte 0x00000000
    .4byte 0xffa9004f
    .4byte 0x0000fff0
    .4byte 0x00004000
    .4byte 0xffc10052
    .4byte 0x0000fff3
    .4byte 0x00000000
    .4byte 0xffd10054
    .4byte 0x0000fff3
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x0000001f
    .4byte 0x0000fff8
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000

	.global gUnknown_0875A314
gUnknown_0875A314:  @ 0x0875A314
@ Replacing .incbin "baserom.gba", 0x75A314, 0x154
    .4byte gUnknown_0875A19C + 0x65
    .4byte gUnknown_0875A19C + 0x161
    .4byte gUnknown_0875A19C + 0x65
    .4byte gUnknown_0875A19C + 0x161
    .4byte gUnknown_0875A19C + 0x65
    .4byte gUnknown_0875A19C + 0x161
    .4byte gUnknown_0875A19C + 0x65
    .4byte gUnknown_0875A19C + 0x161
    .4byte gUnknown_0875A19C + 0x65
    .4byte gUnknown_0875A19C + 0x161
    .4byte gUnknown_0875A19C + 0x65
    .4byte gUnknown_0875A19C + 0x161
    .4byte gUnknown_0875A19C + 0xdd
    .4byte gUnknown_0875A19C + 0x161
    .4byte gUnknown_0875A19C + 0xdd
    .4byte gUnknown_0875A19C + 0x161
    .4byte gUnknown_0875A19C + 0xdd
    .4byte gUnknown_0875A19C + 0x161
    .4byte gUnknown_0875A19C + 0xdd
    .4byte gUnknown_0875A19C + 0x161
    .4byte gUnknown_0875A19C + 0xdd
    .4byte gUnknown_0875A19C + 0x161
    .4byte gUnknown_0875A19C + 0xdd
    .4byte gUnknown_0875A19C + 0x161
    .4byte 0x80000000
    .4byte 0x80004000
    .4byte 0xffe60000
    .4byte 0x0000ffe0
    .4byte 0x00008000
    .4byte 0x00060004
    .4byte 0x0000ffe0
    .4byte 0x80004000
    .4byte 0xffe80005
    .4byte 0x0000fff0
    .4byte 0x00008000
    .4byte 0x00080009
    .4byte 0x0000fff0
    .4byte 0x80004000
    .4byte 0xffea000a
    .4byte 0x00000000
    .4byte 0x00008000
    .4byte 0x000a000e
    .4byte 0x00000000
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x80004000
    .4byte 0xffbc0040
    .4byte 0x0000ffe8
    .4byte 0x80004000
    .4byte 0xffdc0044
    .4byte 0x0000ffe0
    .4byte 0x00008000
    .4byte 0xfffc0048
    .4byte 0x0000ffe0
    .4byte 0x80004000
    .4byte 0xffdc0049
    .4byte 0x0000fff0
    .4byte 0x00008000
    .4byte 0xfffc004d
    .4byte 0x0000fff0
    .4byte 0x80004000
    .4byte 0xffda004e
    .4byte 0x00000000
    .4byte 0x00008000
    .4byte 0xfffa0052
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00040056
    .4byte 0x0000fff0
    .4byte 0x00004000
    .4byte 0xffc40053
    .4byte 0x0000fff8
    .4byte 0x00000000
    .4byte 0xffd40055
    .4byte 0x0000fff8
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x0000001f
    .4byte 0x0000fff8
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000

	.global gUnknown_0875A468
gUnknown_0875A468:  @ 0x0875A468
@ Replacing .incbin "baserom.gba", 0x75A468, 0x2C8
    .4byte gUnknown_0875A314 + 0x65
    .4byte gUnknown_0875A314 + 0x13d
    .4byte gUnknown_0875A314 + 0x65
    .4byte gUnknown_0875A314 + 0x13d
    .4byte gUnknown_0875A314 + 0x65
    .4byte gUnknown_0875A314 + 0x13d
    .4byte gUnknown_0875A314 + 0x65
    .4byte gUnknown_0875A314 + 0x13d
    .4byte gUnknown_0875A314 + 0x65
    .4byte gUnknown_0875A314 + 0x13d
    .4byte gUnknown_0875A314 + 0x65
    .4byte gUnknown_0875A314 + 0x13d
    .4byte gUnknown_0875A314 + 0xb9
    .4byte gUnknown_0875A314 + 0x13d
    .4byte gUnknown_0875A314 + 0xb9
    .4byte gUnknown_0875A314 + 0x13d
    .4byte gUnknown_0875A314 + 0xb9
    .4byte gUnknown_0875A314 + 0x13d
    .4byte gUnknown_0875A314 + 0xb9
    .4byte gUnknown_0875A314 + 0x13d
    .4byte gUnknown_0875A314 + 0xb9
    .4byte gUnknown_0875A314 + 0x13d
    .4byte gUnknown_0875A314 + 0xb9
    .4byte gUnknown_0875A314 + 0x13d
    .4byte 0x80000000
    .4byte 0x80004000
    .4byte 0xffef0000
    .4byte 0x0000ffe0
    .4byte 0x80004000
    .4byte 0xffef0004
    .4byte 0x0000fff0
    .4byte 0x80004000
    .4byte 0xffef0008
    .4byte 0x00000000
    .4byte 0x00008000
    .4byte 0x000f000c
    .4byte 0x0000fffe
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x80004000
    .4byte 0xffe00040
    .4byte 0x0000ffe1
    .4byte 0x80004000
    .4byte 0xffe00044
    .4byte 0x0000fff1
    .4byte 0x80004000
    .4byte 0xffe00048
    .4byte 0x00000001
    .4byte 0x00008000
    .4byte 0xffd8004c
    .4byte 0x0000ffe9
    .4byte 0x00008000
    .4byte 0xffd8004d
    .4byte 0x0000fff9
    .4byte 0x00000000
    .4byte 0xffd80054
    .4byte 0x00000009
    .4byte 0x00008000
    .4byte 0x0000004e
    .4byte 0x0000ffe9
    .4byte 0x00000000
    .4byte 0x00000055
    .4byte 0x0000fff9
    .4byte 0x40000000
    .4byte 0xffb8004f
    .4byte 0x0000ffed
    .4byte 0x00008000
    .4byte 0xffb00051
    .4byte 0x0000ffeb
    .4byte 0x00004000
    .4byte 0xffb80052
    .4byte 0x0000ffe5
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x0000005f
    .4byte 0x0000fff8
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x80004000
    .4byte 0xffe00040
    .4byte 0x0000ffe1
    .4byte 0x80004000
    .4byte 0xffe00044
    .4byte 0x0000fff1
    .4byte 0x80004000
    .4byte 0xffe00048
    .4byte 0x00000001
    .4byte 0x00008000
    .4byte 0xffd8004c
    .4byte 0x0000ffe9
    .4byte 0x00008000
    .4byte 0xffd8004d
    .4byte 0x0000fff9
    .4byte 0x00000000
    .4byte 0xffd80054
    .4byte 0x00000009
    .4byte 0x00008000
    .4byte 0x0000004e
    .4byte 0x0000ffe9
    .4byte 0x00000000
    .4byte 0x00000055
    .4byte 0x0000fff9
    .4byte 0x40000000
    .4byte 0xff98004f
    .4byte 0x0000ffed
    .4byte 0x00008000
    .4byte 0xff900051
    .4byte 0x0000ffeb
    .4byte 0x00004000
    .4byte 0xff980052
    .4byte 0x0000ffe5
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x80004000
    .4byte 0xffe00040
    .4byte 0x0000ffe1
    .4byte 0x80004000
    .4byte 0xffe00044
    .4byte 0x0000fff1
    .4byte 0x80004000
    .4byte 0xffe00048
    .4byte 0x00000001
    .4byte 0x00008000
    .4byte 0xffd8004c
    .4byte 0x0000ffe9
    .4byte 0x00008000
    .4byte 0xffd8004d
    .4byte 0x0000fff9
    .4byte 0x00000000
    .4byte 0xffd80054
    .4byte 0x00000009
    .4byte 0x00008000
    .4byte 0x0000004e
    .4byte 0x0000ffe9
    .4byte 0x00000000
    .4byte 0x00000055
    .4byte 0x0000fff9
    .4byte 0x40000000
    .4byte 0xff80004f
    .4byte 0x0000ffed
    .4byte 0x00004000
    .4byte 0xff800052
    .4byte 0x0000ffe5
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x80004000
    .4byte 0xffe00040
    .4byte 0x0000ffe1
    .4byte 0x80004000
    .4byte 0xffe00044
    .4byte 0x0000fff1
    .4byte 0x80004000
    .4byte 0xffe00048
    .4byte 0x00000001
    .4byte 0x00008000
    .4byte 0xffd8004c
    .4byte 0x0000ffe9
    .4byte 0x00008000
    .4byte 0xffd8004d
    .4byte 0x0000fff9
    .4byte 0x00000000
    .4byte 0xffd80054
    .4byte 0x00000009
    .4byte 0x00008000
    .4byte 0x0000004e
    .4byte 0x0000ffe9
    .4byte 0x00000000
    .4byte 0x00000055
    .4byte 0x0000fff9
    .4byte 0x00000001
    .4byte 0x00000000
    .4byte 0x00000000

	.global gUnknown_0875A730
gUnknown_0875A730:  @ 0x0875A730
@ Replacing .incbin "baserom.gba", 0x75A730, 0x64
    .4byte gUnknown_0875A468 + 0x65
    .4byte gUnknown_0875A468 + 0x131
    .4byte gUnknown_0875A468 + 0x65
    .4byte gUnknown_0875A468 + 0x131
    .4byte gUnknown_0875A468 + 0x65
    .4byte gUnknown_0875A468 + 0x131
    .4byte gUnknown_0875A468 + 0x65
    .4byte gUnknown_0875A468 + 0x131
    .4byte gUnknown_0875A468 + 0x65
    .4byte gUnknown_0875A468 + 0x131
    .4byte gUnknown_0875A468 + 0x65
    .4byte gUnknown_0875A468 + 0x131
    .4byte gUnknown_0875A468 + 0xa1
    .4byte gUnknown_0875A468 + 0x131
    .4byte gUnknown_0875A468 + 0x149
    .4byte gUnknown_0875A468 + 0x131
    .4byte gUnknown_0875A468 + 0x1d9
    .4byte gUnknown_0875A468 + 0x131
    .4byte gUnknown_0875A468 + 0x25d
    .4byte gUnknown_0875A468 + 0x131
    .4byte gUnknown_0875A468 + 0x25d
    .4byte gUnknown_0875A468 + 0x131
    .4byte gUnknown_0875A468 + 0x25d
    .4byte gUnknown_0875A468 + 0x131
    .4byte 0x80000000
