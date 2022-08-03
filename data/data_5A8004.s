    .section .data

	.global gUnknown_085A8004
gUnknown_085A8004:  @ 0x085A8004
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_WHILE_EXISTS
        .short 0x8, 0x0
        .word gUnknown_0859A548
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8039E88
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gProcScr_CpPerform
gProcScr_CpPerform:  @ 0x085A8024
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80d80dc
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8039EF4
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8039F0C
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8039FAC
        @ PROC_WHILE
        .short 0x14, 0x0
        .word MU_IsAnyActive
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_803A3C8
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word PrepareAIAction
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_803A5F8
        @ PROC_CALL_2
        .short 0x16, 0x0
        .word HandlePostActionTraps
        @ PROC_CALL_2
        .short 0x16, 0x0
        .word RunPotentialWaitEvents
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_803A63C
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_803A6D0
        @ PROC_LABEL
        .short 0xb, 0x1
        .word 0x0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085A80A4
gUnknown_085A80A4:  @ 0x085A80A4
	.incbin "baserom.gba", 0x5A80A4, 0x18

	.global gUnknown_085A80BC
gUnknown_085A80BC:  @ 0x085A80BC
	.incbin "baserom.gba", 0x5A80BC, 0x64

	.global gUnknown_085A8120
gUnknown_085A8120:  @ 0x085A8120
	.incbin "baserom.gba", 0x5A8120, 0x4

	.global gUnknown_085A8124
gUnknown_085A8124:  @ 0x085A8124
	.incbin "baserom.gba", 0x5A8124, 0x8

	.global gUnknown_085A812C
gUnknown_085A812C:  @ 0x085A812C
	.incbin "baserom.gba", 0x5A812C, 0x10

	.global gUnknown_085A813C
gUnknown_085A813C:  @ 0x085A813C
	.incbin "baserom.gba", 0x5A813C, 0x10

	.global gUnknown_085A814C
gUnknown_085A814C:  @ 0x085A814C
	.incbin "baserom.gba", 0x5A814C, 0x4

	.global gUnknown_085A8150
gUnknown_085A8150:  @ 0x085A8150
	.incbin "baserom.gba", 0x5A8150, 0x38

	.global gUnknown_085A8188
gUnknown_085A8188:  @ 0x085A8188
	.incbin "baserom.gba", 0x5A8188, 0x104

	.global gUnknown_085A828C
gUnknown_085A828C:  @ 0x085A828C
	.incbin "baserom.gba", 0x5A828C, 0x104

	.global gUnknown_085A8390
gUnknown_085A8390:  @ 0x085A8390
	.incbin "baserom.gba", 0x5A8390, 0x14

	.global gUnknown_085A83A4
gUnknown_085A83A4:  @ 0x085A83A4
	.incbin "baserom.gba", 0x5A83A4, 0x5C

	.global gUnknown_085A8400
gUnknown_085A8400:  @ 0x085A8400
	.incbin "baserom.gba", 0x5A8400, 0xDD8

	.global gUnknown_085A91D8
gUnknown_085A91D8:  @ 0x085A91D8
	.incbin "baserom.gba", 0x5A91D8, 0xC

	.global gUnknown_085A91E4
gUnknown_085A91E4:  @ 0x085A91E4
	.incbin "baserom.gba", 0x5A91E4, 0xC

	.global gUnknown_085A91F0
gUnknown_085A91F0:  @ 0x085A91F0
	.incbin "baserom.gba", 0x5A91F0, 0x64

	.global gUnknown_085A9254
gUnknown_085A9254:  @ 0x085A9254
	.incbin "baserom.gba", 0x5A9254, 0x64

	.global gUnknown_085A92B8
gUnknown_085A92B8:  @ 0x085A92B8
	.incbin "baserom.gba", 0x5A92B8, 0x4

	.global gUnknown_085A92BC
gUnknown_085A92BC:  @ 0x085A92BC
	.incbin "baserom.gba", 0x5A92BC, 0x20
