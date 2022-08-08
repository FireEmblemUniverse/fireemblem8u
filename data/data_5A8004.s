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
@ Replacing .incbin "baserom.gba", 0x5A8150, 0x38
    .4byte gUnknown_080D80FC + 0x70
    .4byte gUnknown_080D80FC + 0x71
    .4byte gUnknown_080D80FC + 0x72
    .4byte gUnknown_080D80FC + 0x73
    .4byte gUnknown_080D80FC + 0x74
    .4byte gUnknown_080D80FC + 0x75
    .4byte gUnknown_080D80FC + 0x76
    .4byte gUnknown_080D80FC + 0x77
    .4byte gUnknown_080D80FC + 0x78
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0x1f0b0006
    .4byte 0x0

	.global gUnknown_085A8188
gUnknown_085A8188:  @ 0x085A8188
@ replacing .incbin "baserom.gba", 0x005a8188, 0x104
.4byte gUnknown_080D8178 + 0x368
.4byte gUnknown_080D8178 + 0x368
.4byte gUnknown_080D8178 + 0x368
.4byte gUnknown_080D8178 + 0x368
.4byte gUnknown_080D8178 + 0x368
.4byte gUnknown_080D8178 + 0x368
.4byte gUnknown_080D8178 + 0x368
.4byte gUnknown_080D8178 + 0x368
.4byte gUnknown_080D8178 + 0x368
.4byte gUnknown_080D8178 + 0x36c
.4byte gUnknown_080D8178 + 0x368
.4byte gUnknown_080D8178 + 0x368
.4byte gUnknown_080D8178 + 0x368
.4byte gUnknown_080D8178 + 0x368
.4byte gUnknown_080D8178 + 0x37c
.4byte gUnknown_080D8178 + 0x368
.4byte gUnknown_080D8178 + 0x384
.4byte gUnknown_080D8178 + 0x368
.4byte gUnknown_080D8178 + 0x368
.4byte gUnknown_080D8178 + 0x394
.4byte gUnknown_080D8178 + 0x368
.4byte gUnknown_080D8178 + 0x368
.4byte gUnknown_080D8178 + 0x368
.4byte gUnknown_080D8178 + 0x368
.4byte gUnknown_080D8178 + 0x368
.4byte gUnknown_080D8178 + 0x368
.4byte gUnknown_080D8178 + 0x368
.4byte gUnknown_080D8178 + 0x39c
.4byte gUnknown_080D8178 + 0x368
.4byte gUnknown_080D8178 + 0x38c
.4byte gUnknown_080D8178 + 0x368
.4byte gUnknown_080D8178 + 0x368
.4byte gUnknown_080D8178 + 0x3a4
.4byte gUnknown_080D8178 + 0x368
.4byte gUnknown_080D8178 + 0x368
.4byte gUnknown_080D8178 + 0x368
.4byte gUnknown_080D8178 + 0x368
.4byte gUnknown_080D8178 + 0x368
.4byte gUnknown_080D8178 + 0x368
.4byte gUnknown_080D8178 + 0x368
.4byte gUnknown_080D8178 + 0x368
.4byte gUnknown_080D8178 + 0x368
.4byte gUnknown_080D8178 + 0x368
.4byte gUnknown_080D8178 + 0x368
.4byte gUnknown_080D8178 + 0x368
.4byte gUnknown_080D8178 + 0x368
.4byte gUnknown_080D8178 + 0x368
.4byte gUnknown_080D8178 + 0x368
.4byte gUnknown_080D8178 + 0x368
.4byte gUnknown_080D8178 + 0x3ac
.4byte gUnknown_080D8178 + 0x3b8
.4byte gUnknown_080D8178 + 0x368
.4byte gUnknown_080D8178 + 0x368
.4byte gUnknown_080D8178 + 0x368
.4byte gUnknown_080D8178 + 0x368
.4byte gUnknown_080D8178 + 0x368
.4byte gUnknown_080D8178 + 0x368
.4byte gUnknown_080D8178 + 0x368
.4byte gUnknown_080D8178 + 0x368
.4byte gUnknown_080D8178 + 0x368
.4byte gUnknown_080D8178 + 0x368
.4byte gUnknown_080D8178 + 0x374
.4byte gUnknown_080D8178 + 0x368
.4byte gUnknown_080D8178 + 0x368
.4byte gUnknown_080D8178 + 0x368

	.global gUnknown_085A828C
gUnknown_085A828C:  @ 0x085A828C
@ replacing .incbin "baserom.gba", 0x005a828c, 0x104
.4byte gUnknown_080D8178 + 0x368
.4byte gUnknown_080D8178 + 0x368
.4byte gUnknown_080D8178 + 0x368
.4byte gUnknown_080D8178 + 0x368
.4byte gUnknown_080D8178 + 0x368
.4byte gUnknown_080D8178 + 0x368
.4byte gUnknown_080D8178 + 0x368
.4byte gUnknown_080D8178 + 0x368
.4byte gUnknown_080D8178 + 0x368
.4byte gUnknown_080D8178 + 0x368
.4byte gUnknown_080D8178 + 0x368
.4byte gUnknown_080D8178 + 0x368
.4byte gUnknown_080D8178 + 0x368
.4byte gUnknown_080D8178 + 0x368
.4byte gUnknown_080D8178 + 0x368
.4byte gUnknown_080D8178 + 0x368
.4byte gUnknown_080D8178 + 0x368
.4byte gUnknown_080D8178 + 0x368
.4byte gUnknown_080D8178 + 0x368
.4byte gUnknown_080D8178 + 0x368
.4byte gUnknown_080D8178 + 0x368
.4byte gUnknown_080D8178 + 0x368
.4byte gUnknown_080D8178 + 0x368
.4byte gUnknown_080D8178 + 0x368
.4byte gUnknown_080D8178 + 0x368
.4byte gUnknown_080D8178 + 0x368
.4byte gUnknown_080D8178 + 0x368
.4byte gUnknown_080D8178 + 0x368
.4byte gUnknown_080D8178 + 0x368
.4byte gUnknown_080D8178 + 0x368
.4byte gUnknown_080D8178 + 0x368
.4byte gUnknown_080D8178 + 0x368
.4byte gUnknown_080D8178 + 0x368
.4byte gUnknown_080D8178 + 0x368
.4byte gUnknown_080D8178 + 0x368
.4byte gUnknown_080D8178 + 0x368
.4byte gUnknown_080D8178 + 0x368
.4byte gUnknown_080D8178 + 0x368
.4byte gUnknown_080D8178 + 0x368
.4byte gUnknown_080D8178 + 0x368
.4byte gUnknown_080D8178 + 0x368
.4byte gUnknown_080D8178 + 0x368
.4byte gUnknown_080D8178 + 0x368
.4byte gUnknown_080D8178 + 0x368
.4byte gUnknown_080D8178 + 0x368
.4byte gUnknown_080D8178 + 0x368
.4byte gUnknown_080D8178 + 0x368
.4byte gUnknown_080D8178 + 0x368
.4byte gUnknown_080D8178 + 0x368
.4byte gUnknown_080D8178 + 0x368
.4byte gUnknown_080D8178 + 0x368
.4byte gUnknown_080D8178 + 0x368
.4byte gUnknown_080D8178 + 0x368
.4byte gUnknown_080D8178 + 0x368
.4byte gUnknown_080D8178 + 0x368
.4byte gUnknown_080D8178 + 0x368
.4byte gUnknown_080D8178 + 0x368
.4byte gUnknown_080D8178 + 0x368
.4byte gUnknown_080D8178 + 0x368
.4byte gUnknown_080D8178 + 0x368
.4byte gUnknown_080D8178 + 0x368
.4byte gUnknown_080D8178 + 0x368
.4byte gUnknown_080D8178 + 0x368
.4byte gUnknown_080D8178 + 0x368
.4byte gUnknown_080D8178 + 0x368

	.global gUnknown_085A8390
gUnknown_085A8390:  @ 0x085A8390
	.incbin "baserom.gba", 0x5A8390, 0x14

	.global gUnknown_085A83A4
gUnknown_085A83A4:  @ 0x085A83A4
@ Replacing .incbin "baserom.gba", 0x5A83A4, 0x5C
    .4byte 0x730072
    .4byte 0x71007c
    .4byte 0x89006b
    .4byte 0x640088
    .4byte 0x660065
    .4byte 0x680067
    .4byte 0xc1008a
    .4byte 0x7d0074
    .4byte 0x7f007e
    .4byte 0x5d0080
    .4byte 0x5b005f
    .4byte 0x5c0060
    .4byte 0x61005e
    .4byte 0x630062
    .4byte 0x7500b7
    .4byte 0x6d0076
    .4byte 0x6a0069
    .4byte 0x70006e
    .4byte 0x6f006c
    .4byte 0x7b007a
    .4byte 0xffff
    .4byte gUnknown_080D8538 + 0x104
    .4byte gUnknown_080D8538 + 0x118

	.global gUnknown_085A8400
gUnknown_085A8400:  @ 0x085A8400
@ Replacing .incbin "baserom.gba", 0x5A8400, 0xDD8
    .4byte gUnknown_085A83A4 + 0x54
    .4byte 0x4c4c4143
    .4byte 0x53455420
    .4byte 0xa54
    .4byte 0xff0012
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0xff0003
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0xff0013
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0xff0003
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0xff000e
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0xff02
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0xff0003
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0xff000e
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0x4ff02
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0xff0003
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0xff0012
    .4byte 0x0
    .4byte gUnknown_085A8150 + 0x2a
    .4byte 0x0
    .4byte 0xff0003
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0xff0012
    .4byte 0x0
    .4byte gUnknown_085A8150 + 0x2c
    .4byte 0x0
    .4byte 0xff0003
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0xff000e
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0xff0003
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0xff0010
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0x2
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0xff0003
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0xff0010
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0xc0602
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0xff0003
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0xff0017
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0xff0003
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0x11ff150c
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0x1ff001c
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0xff0006
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0x1ff0003
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0xff0001
    .4byte 0x0
    .4byte sub_803F434
    .4byte 0x0
    .4byte 0x1ff0000
    .4byte 0x0
    .4byte 0x203aa8a
    .4byte 0x0
    .4byte 0xff0003
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0x1ff001c
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0xff0001
    .4byte 0x0
    .4byte sub_803F34C
    .4byte gUnknown_080D8538 + 0x128
    .4byte 0xff0001
    .4byte 0x0
    .4byte sub_803F018
    .4byte gUnknown_080D8538 + 0x12c
    .4byte 0x1ff0000
    .4byte 0x0
    .4byte 0x203aa8a
    .4byte 0x0
    .4byte 0xff000e
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0xff0003
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0x1ff001c
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0xff02
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0x1ff0003
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0xff0001
    .4byte 0x0
    .4byte sub_803F018
    .4byte gUnknown_080D8538 + 0x12c
    .4byte 0x1ff0000
    .4byte 0x0
    .4byte 0x203aa8a
    .4byte 0x0
    .4byte 0xff000e
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0xff0003
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0x1ff001c
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0x1ff02
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0x1ff0003
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0xff0001
    .4byte 0x0
    .4byte sub_803F018
    .4byte gUnknown_080D8538 + 0x12c
    .4byte 0x1ff0000
    .4byte 0x0
    .4byte 0x203aa8a
    .4byte 0x0
    .4byte 0xff000e
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0xff0003
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0x1ff001c
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0xff02
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0x1ff0003
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0xff0012
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0xff0003
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0xff0016
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0xff0003
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0xff001a
    .4byte 0x0
    .4byte gUnknown_085A8150 + 0x30
    .4byte 0x0
    .4byte 0x1ff0200
    .4byte 0x4
    .4byte 0x203aa8a
    .4byte 0x0
    .4byte 0xff0003
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0x10b
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0xff0012
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0xff0003
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0xff001a
    .4byte 0x0
    .4byte gUnknown_085A8150 + 0x32
    .4byte 0x0
    .4byte 0x1ff0200
    .4byte 0x4
    .4byte 0x203aa8a
    .4byte 0x0
    .4byte 0xff0003
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0x10b
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0xff0012
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0xff0003
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0xff6405
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0xff0003
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0xff5005
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0xff0003
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0xff3205
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0xff0003
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0xff6407
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0xff0003
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0xff5007
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0xff0003
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0xff3207
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0xff0003
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0xff0006
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0xff0003
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0xff6405
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0xff0001
    .4byte 0x0
    .4byte sub_803F330
    .4byte 0x0
    .4byte 0x1ff0000
    .4byte 0x0
    .4byte 0x203aa8a
    .4byte 0x0
    .4byte 0xff0003
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0x1ff001c
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0xff6407
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0x1ff0003
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0xff6405
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0xff0003
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0xff6405
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0xff0003
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0xd
    .4byte 0xff6405
    .4byte 0x0
    .4byte gUnknown_085A8400 + 0x600
    .4byte 0x0
    .4byte 0xff0003
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0x1000100
    .4byte 0x0
    .4byte 0xff6405
    .4byte 0x0
    .4byte gUnknown_085A8400 + 0x624
    .4byte 0x0
    .4byte 0xff0003
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0x100
    .4byte 0xff6405
    .4byte 0x0
    .4byte gUnknown_085A8400 + 0x64c
    .4byte 0x0
    .4byte 0xff0003
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0x500405
    .4byte 0x305
    .4byte gUnknown_088D1F54
    .4byte 0xff0001
    .4byte 0x0
    .4byte AiTryUseNightmareStaff
    .4byte gUnknown_085A8400 + 0x670
    .4byte 0x1ff0200
    .4byte 0x0
    .4byte 0x203aa8a
    .4byte 0x0
    .4byte 0xff0001
    .4byte 0x0
    .4byte AiDecideNightmareStaff
    .4byte 0x0
    .4byte 0xff0003
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0x1ff001c
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0xff0001
    .4byte 0x0
    .4byte AiTryDKSummon
    .4byte gUnknown_085A8400 + 0x674
    .4byte 0x2ff0200
    .4byte 0x0
    .4byte 0x203aa8a
    .4byte 0x0
    .4byte 0xff0001
    .4byte 0x0
    .4byte AiDecideDKSummon
    .4byte 0x0
    .4byte 0xff0003
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0x2ff001c
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0xff6405
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0xff0003
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0xfc
    .4byte 0xff6405
    .4byte 0x0
    .4byte gUnknown_085A8400 + 0x73c
    .4byte 0x0
    .4byte 0xff0003
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0xff6405
    .4byte 0x0
    .4byte gUnknown_085A8150 + 0x2c
    .4byte 0x0
    .4byte 0xff0003
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0xff6405
    .4byte 0x0
    .4byte gUnknown_085A8150 + 0x2e
    .4byte 0x0
    .4byte 0xff0003
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0xff6404
    .4byte 0x100
    .4byte 0x0
    .4byte 0x0
    .4byte 0xff0500
    .4byte 0x3
    .4byte 0x203aa8a
    .4byte 0x0
    .4byte 0xff6405
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0xff0003
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0xff6405
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0xff0003
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0xff0001
    .4byte 0x0
    .4byte sub_803F018
    .4byte gUnknown_080D8538 + 0x130
    .4byte 0x1ff0000
    .4byte 0x0
    .4byte 0x203aa8a
    .4byte 0x0
    .4byte 0xff6407
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0xff0003
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0x1ff001c
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0xff6405
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0xff0003
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0xff0001
    .4byte 0x0
    .4byte sub_803F51C
    .4byte 0x0
    .4byte 0x1ff0200
    .4byte 0x1
    .4byte 0x203aa8b
    .4byte 0x0
    .4byte 0xff0001
    .4byte 0x0
    .4byte sub_803F72C
    .4byte 0x0
    .4byte 0xff0003
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0x1ff001c
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0x2
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0xff0003
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0x2
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0xff0003
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0xff0001
    .4byte 0x0
    .4byte sub_803F018
    .4byte gUnknown_080D8538 + 0x134
    .4byte 0x1ff0000
    .4byte 0x0
    .4byte 0x203aa8a
    .4byte 0x0
    .4byte 0x7ff050c
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0xff6407
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0xff0003
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0x1ff001c
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0xff0012
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0xff0003
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0xff0001
    .4byte 0x0
    .4byte sub_803F018
    .4byte gUnknown_080D8538 + 0x134
    .4byte 0x1ff0000
    .4byte 0x0
    .4byte 0x203aa8a
    .4byte 0x0
    .4byte 0x6ff110c
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0xff6407
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0xff0003
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0x1ff001c
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0xff0012
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0xff0003
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0xff000d
    .4byte 0x1
    .4byte 0x0
    .4byte 0x0
    .4byte 0x1ff0200
    .4byte 0x4
    .4byte 0x203aa8a
    .4byte 0x0
    .4byte 0x2ff0200
    .4byte 0x1
    .4byte 0x203aa8a
    .4byte 0x0
    .4byte 0x1ff0200
    .4byte 0x2
    .4byte 0x203aa8a
    .4byte 0x0
    .4byte 0xff0003
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0x1ff001c
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0xff0012
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0xff0003
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0x2ff001c
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0xff0012
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0x2ff0003
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0xff000d
    .4byte 0xf
    .4byte 0x0
    .4byte 0x0
    .4byte 0x1ff0200
    .4byte 0x4
    .4byte 0x203aa8a
    .4byte 0x0
    .4byte 0x2ff0200
    .4byte 0x1
    .4byte 0x203aa8a
    .4byte 0x0
    .4byte 0x1ff0200
    .4byte 0x2
    .4byte 0x203aa8a
    .4byte 0x0
    .4byte 0xff0003
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0x1ff001c
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0xff0012
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0xff0003
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0x2ff001c
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0xff0012
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0x2ff0003
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0xff0001
    .4byte 0x0
    .4byte sub_803F51C
    .4byte 0x0
    .4byte 0xff0001
    .4byte 0x0
    .4byte sub_803F72C
    .4byte 0x0
    .4byte 0xff0003
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0xff0001
    .4byte 0x0
    .4byte sub_803F790
    .4byte gUnknown_080D8538 + 0x138
    .4byte 0xff0003
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0xff0001
    .4byte 0x0
    .4byte sub_803F790
    .4byte gUnknown_080D8538 + 0x138
    .4byte 0xff6407
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0xff0003
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0xff0001
    .4byte 0x0
    .4byte sub_803F7DC
    .4byte gUnknown_080D8538 + 0x13c
    .4byte 0x1ff0200
    .4byte 0x5
    .4byte 0x203aa8a
    .4byte 0x0
    .4byte 0xff0003
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0x1ff001c
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0xc0602
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0xff0003
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0xff0001
    .4byte 0x0
    .4byte sub_803F7DC
    .4byte gUnknown_080D8538 + 0x140
    .4byte 0xff0003
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0xff0018
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0x1ff0200
    .4byte 0x4
    .4byte 0x203aa8a
    .4byte 0x0
    .4byte 0xff0003
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0x1ff001c
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0x2
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0xff0003
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0x110f
    .4byte 0x13120f0d
    .4byte 0xff0001
    .4byte 0x0
    .4byte sub_803F4A4
    .4byte gUnknown_085A8400 + 0xcc4
    .4byte 0x1ff0200
    .4byte 0x1
    .4byte 0x203aa8a
    .4byte 0x0
    .4byte 0xff0001
    .4byte 0x0
    .4byte sub_803F9A8
    .4byte gUnknown_085A8400 + 0xcc0
    .4byte 0xff0003
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0x1ff001c
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0x2
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0xff0003
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte gUnknown_085A8400 + 0x10
    .4byte gUnknown_085A8400 + 0xb0
    .4byte gUnknown_085A8400 + 0xd0
    .4byte gUnknown_085A8400 + 0xf0
    .4byte gUnknown_085A8400 + 0x110
    .4byte gUnknown_085A8400 + 0x140
    .4byte gUnknown_085A8400 + 0x220
    .4byte gUnknown_085A8400 + 0x290
    .4byte gUnknown_085A8400 + 0x1d0
    .4byte gUnknown_085A8400 + 0x390
    .4byte gUnknown_085A8400 + 0xa00
    .4byte gUnknown_085A8400 + 0xab0
    .4byte gUnknown_085A8400 + 0x170
    .4byte gUnknown_085A8400 + 0x410
    .4byte gUnknown_085A8400 + 0xc60
    .4byte gUnknown_085A8400 + 0x30
    .4byte gUnknown_085A8400 + 0xcc8
    .4byte gUnknown_085A8400 + 0x80
    .4byte gUnknown_085A8400 + 0x50
    .4byte gUnknown_085A8400 + 0x470
    .4byte gUnknown_085A8400 + 0x490
    .4byte gUnknown_085A8400 + 0x4b0
    .4byte gUnknown_085A8400 + 0x4d0
    .4byte gUnknown_085A8400 + 0x4f0
    .4byte gUnknown_085A8400 + 0x510
    .4byte gUnknown_085A8400 + 0x530
    .4byte gUnknown_085A8400 + 0x604
    .4byte gUnknown_085A8400 + 0x740
    .4byte gUnknown_085A8400 + 0x780
    .4byte gUnknown_085A8400 + 0x7a0
    .4byte gUnknown_085A8400 + 0x7e0
    .4byte gUnknown_085A8400 + 0x800
    .4byte gUnknown_085A8400 + 0x870
    .4byte gUnknown_085A8400 + 0xb90
    .4byte gUnknown_085A8400 + 0xbb0
    .4byte gUnknown_085A8400 + 0xbe0
    .4byte gUnknown_085A8400 + 0xc40
    .4byte gUnknown_085A8400 + 0x62c
    .4byte gUnknown_085A8400 + 0x650
    .4byte gUnknown_085A8400 + 0x67c

	.global gUnknown_085A91D8
gUnknown_085A91D8:  @ 0x085A91D8
@ replacing .incbin "baserom.gba", 0x005a91d8, 0xc
.4byte gUnknown_085A8400 + 0xd38
.4byte gUnknown_085A8400 + 0xd38
.4byte gUnknown_085A8400 + 0xd38

	.global gUnknown_085A91E4
gUnknown_085A91E4:  @ 0x085A91E4
@ replacing .incbin "baserom.gba", 0x005a91e4, 0xc
.4byte gUnknown_085A8400 + 0xd84
.4byte gUnknown_085A8400 + 0xd84
.4byte gUnknown_085A8400 + 0xd84

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

