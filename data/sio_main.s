    .section .rodata
    .incbin "baserom.gba", 0xD8724, 0x1C

    .section .data

	.global ProcScr_SIOCON
ProcScr_SIOCON:  @ 0x085A932C
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80d8724
        @ PROC_15
        .short 0x15, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8042E0C
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8042E2C
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global ProcScr_SIOVSYNC
ProcScr_SIOVSYNC:  @ 0x085A9354
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80d872c
        @ PROC_15
        .short 0x15, 0x0
        .word 0x0
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8041C1C
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global ProcScr_SIOMAIN
ProcScr_SIOMAIN:  @ 0x085A937C
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80d8738
        @ PROC_15
        .short 0x15, 0x0
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8041DC4
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0
    .4byte gGenericBuffer

	.global gUnknown_085A93A0
gUnknown_085A93A0:  @ 0x085A93A0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8042EB4
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8042EF0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global ProcScr_HOLD
ProcScr_HOLD:  @ 0x085A93B8
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80d9d48
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8042FE0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0
	.incbin "baserom.gba", 0x5A93D0, 0x10

	.global gUnknown_085A93E0
gUnknown_085A93E0:  @ 0x085A93E0
	.incbin "baserom.gba", 0x5A93E0, 0x10

	.global gUnknown_085A93F0
gUnknown_085A93F0:  @ 0x085A93F0
@ Replacing .incbin "baserom.gba", 0x5A93F0, 0xB0
    .4byte 0x200020
    .4byte 0x100010
    .4byte 0x2000200
    .4byte 0xffff0008
    .4byte 0x73c0001
    .4byte 0x1
    .4byte 0x766
    .4byte sub_804335C
    .4byte 0x73d0003
    .4byte 0x100
    .4byte 0x767
    .4byte sub_8043394
    .4byte 0x73e0004
    .4byte 0x0
    .4byte 0x768
    .4byte 0x0
    .4byte 0x73f0006
    .4byte 0x100
    .4byte 0x769
    .4byte sub_8043394
    .4byte 0x7400007
    .4byte 0x0
    .4byte 0x76a
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0x7410002
    .4byte 0x100
    .4byte 0x76c
    .4byte 0x0
    .4byte 0x73d0003
    .4byte 0x100
    .4byte 0x767
    .4byte 0x0
    .4byte 0x7400007
    .4byte 0x100
    .4byte 0x76a
    .4byte 0x0
    .4byte 0x0
    .4byte 0x100
    .4byte 0x0
    .4byte 0x0

	.global gUnknown_085A94A0
gUnknown_085A94A0:  @ 0x085A94A0
    .4byte gUnknown_085A93F0 + 0x10, gUnknown_085A93F0 + 0x70, gUnknown_085A93F0 + 0x70

	.global gUnknown_085A94AC
gUnknown_085A94AC:  @ 0x085A94AC
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_804331C
        @ PROC_LABEL
        .short 0xb, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8043904
        @ PROC_CALL
        .short 0x2, 0x0
        .word FadeInBlackSpeed20
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word Clear_0203DDDC
        @ PROC_LABEL
        .short 0xb, 0x2
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8043B6C
        @ PROC_LABEL
        .short 0xb, 0x3
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8043D8C
        @ PROC_GOTO
        .short 0xc, 0x9
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x4
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word Set_0203DDDC
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8013F40
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8043CF4
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8043D3C
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8043904
        @ PROC_CALL
        .short 0x2, 0x0
        .word FadeInBlackSpeed20
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word Clear_0203DDDC
        @ PROC_GOTO
        .short 0xc, 0x2
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x5
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_804429C
        @ PROC_LABEL
        .short 0xb, 0x6
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8044324
        @ PROC_LABEL
        .short 0xb, 0x7
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80443B0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8044430
        @ PROC_GOTO
        .short 0xc, 0x3
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x8
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word Set_0203DDDC
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8013F40
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8044530
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_GOTO
        .short 0xc, 0x1
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x9
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word EndMuralBackground
        @ PROC_CALL
        .short 0x2, 0x0
        .word Set_0203DDDC
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8013F40
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0
