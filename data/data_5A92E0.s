    .section .data

	.global gUnknown_085A92E0
gUnknown_085A92E0:  @ 0x085A92E0
    .4byte gUnknown_0203AAA0 + 0x4

	.global gUnknown_085A92E4
gUnknown_085A92E4:  @ 0x085A92E4
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8042B08
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8042B68
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085A9304
gUnknown_085A9304:  @ 0x085A9304
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8042BD8
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8042C00
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8042C44
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085A932C
gUnknown_085A932C:  @ 0x085A932C
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


	.global gUnknown_085A9354
gUnknown_085A9354:  @ 0x085A9354
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


	.global gUnknown_085A937C
gUnknown_085A937C:  @ 0x085A937C
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
    .4byte gUnknown_02020188

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


	.global gUnknown_085A93B8
gUnknown_085A93B8:  @ 0x085A93B8
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
        .word sub_8013FC4
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_804B92C
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
        .word sub_804B920
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
        .word sub_8013FC4
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_804B92C
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
        .word sub_804B920
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
        .word EndBG3Slider
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_804B920
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8013F40
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085A9614
gUnknown_085A9614:  @ 0x085A9614
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8044768
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8013FC4
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_804B92C
        @ PROC_LABEL
        .short 0xb, 0x0
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8044ED8
        @ PROC_GOTO
        .short 0xc, 0x2
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8044FE4
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8044FFC
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_804503C
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8045068
        @ PROC_GOTO
        .short 0xc, 0x0
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x3
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word NameSelect_DrawName
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8045108
        @ PROC_GOTO
        .short 0xc, 0x0
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x2
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_804B920
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8013F40
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80451F0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085A96D4
gUnknown_085A96D4:  @ 0x085A96D4
    .4byte gUnknown_080D9D61 + 0xd, gUnknown_080D9D61 + 0x15, gUnknown_080D9D61 + 0x1d, gUnknown_080D9D61 + 0x25

	.global gUnknown_085A96E4
gUnknown_085A96E4:  @ 0x085A96E4
    .4byte gUnknown_080D9D61 + 0x2d, gUnknown_080D9D61 + 0x41, gUnknown_080D9D61 + 0x61, gUnknown_080D9D61 + 0x75

	.global gUnknown_085A96F4
gUnknown_085A96F4:  @ 0x085A96F4
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8045208
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8045234
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_804538C
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0

	.global gUnknown_085A971C
gUnknown_085A971C:  @ 0x085A971C
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8045640
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8013FC4
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_804B92C
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80457F8
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_804589C
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_804B920
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8013F40
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word BMapVSync_Start
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0

	.global gUnknown_085A9774
gUnknown_085A9774:  @ 0x085A9774
        @ PROC_SLEEP
        .short 0xe, 0x10
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80458E8
        @ PROC_SLEEP
        .short 0xe, 0xd2
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8045920
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0

	.global gUnknown_085A979C
gUnknown_085A979C:  @ 0x085A979C
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80d9e48
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8043308
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8046DB4
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8045AF4
        @ PROC_CALL
        .short 0x2, 0x0
        .word nullsub_13
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_804C4F8
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_804C590
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word New6C_SIOMAIN2
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8045C28
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_804B920
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8013F40
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_START_CHILD_BLOCKING
        .short 0x6, 0x1
        .word gUnknown_085A971C
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8043244
        @ PROC_LABEL
        .short 0xb, 0x4
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_804B920
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8013F40
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0

	.global gUnknown_085A9864
gUnknown_085A9864:  @ 0x085A9864
	.incbin "baserom.gba", 0x5A9864, 0x20

	.global gUnknown_085A9884
gUnknown_085A9884:  @ 0x085A9884
@ replacing .incbin "baserom.gba", 0x005a9884, 0x4
.4byte gUnknown_02020188

	.global gUnknown_085A9888
gUnknown_085A9888:  @ 0x085A9888
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80d9e8c
        @ PROC_LABEL
        .short 0xb, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8043308
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8046DB4
        @ PROC_CALL
        .short 0x2, 0x0
        .word nullsub_13
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_804C4F8
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_804C590
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8045DC0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8013FC4
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_804B92C
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8045F00
        @ PROC_LABEL
        .short 0xb, 0x3
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8045F48
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80469AC
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_804619C
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8042F84
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8042F98
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8046234
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80462D4
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8042F84
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8042F98
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80463A8
        @ PROC_SLEEP
        .short 0xe, 0xa
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_804645C
        @ PROC_SLEEP
        .short 0xe, 0x50
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_804B920
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8013F40
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_804D6B4
        @ PROC_CALL
        .short 0x2, 0x0
        .word EndBG3Slider
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8046838
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8013FC4
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_804B92C
        @ PROC_SLEEP
        .short 0xe, 0xb4
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8042F84
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8042F98
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_804B920
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8013F40
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_END_EACH
        .short 0x9, 0x0
        .word gUnknown_085AAB00
        @ PROC_CALL
        .short 0x2, 0x0
        .word nullsub_13
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_804C4F8
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_804C590
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80467AC
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8013FC4
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_804B92C
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80464B0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8046580
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8046704
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8042F84
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8042F98
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_804B920
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8013F40
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_804D6B4
        @ PROC_CALL
        .short 0x2, 0x0
        .word EndBG3Slider
        @ PROC_CALL
        .short 0x2, 0x0
        .word nullsub_13
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word New6C_SIOMAIN2
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8045C28
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_804B920
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8013F40
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80469B8
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8045CBC
        @ PROC_START_CHILD_BLOCKING
        .short 0x6, 0x1
        .word gUnknown_085A971C
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8045CE0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8045A64
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8043244
        @ PROC_CALL
        .short 0x2, 0x0
        .word nullsub_13
        @ PROC_GOTO
        .short 0xc, 0x1
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x2
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_804B920
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8013F40
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word ResetFaces
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_804D6B4
        @ PROC_CALL
        .short 0x2, 0x0
        .word EndBG3Slider
        @ PROC_GOTO
        .short 0xc, 0x0
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x4
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8042F84
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8042F98
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_804B920
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8013F40
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80469B8
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8045CBC
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8045CE0
        @ PROC_LABEL
        .short 0xb, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8041898
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0

	.global gUnknown_085A9BA0
gUnknown_085A9BA0:  @ 0x085A9BA0
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80d9e94
        @ PROC_LABEL
        .short 0xb, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8043308
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8046DB4
        @ PROC_LABEL
        .short 0xb, 0x3
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80469C4
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8013FC4
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_804B92C
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8046CF0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_804B920
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8013F40
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_804309C
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8046D6C
        @ PROC_CALL
        .short 0x2, 0x0
        .word nullsub_13
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_804C4F8
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_804C590
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_804C31C
        @ PROC_CALL
        .short 0x2, 0x0
        .word EndBG3Slider
        @ PROC_CALL
        .short 0x2, 0x0
        .word BMapVSync_End
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8096468
        @ PROC_LABEL
        .short 0xb, 0x5
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8046DEC
        @ PROC_CALL
        .short 0x2, 0x0
        .word BMapVSync_Start
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8046DD0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_804B920
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8013F40
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8048260
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8046E0C
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_GOTO
        .short 0xc, 0x0
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x2
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_804B920
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8013F40
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_GOTO
        .short 0xc, 0x3
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x4
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_804B920
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8013F40
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8046E4C
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_804C31C
        @ PROC_CALL
        .short 0x2, 0x0
        .word EndBG3Slider
        @ PROC_GOTO
        .short 0xc, 0x0
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x1
        .word 0x0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0

	.global gUnknown_085A9D38
gUnknown_085A9D38:  @ 0x085A9D38
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80d9eb4
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8047008
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8013FC4
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_804B92C
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_804720C
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_804B920
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8013F40
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word EndBG3Slider
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0

	.global gUnknown_085A9D98
gUnknown_085A9D98:  @ 0x085A9D98
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8047324
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8013FC4
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_804B92C
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8047570
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_804762C
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_804B920
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8013F40
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word EndBG3Slider
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0

	.global gUnknown_085A9DF8
gUnknown_085A9DF8:  @ 0x085A9DF8
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8047780
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8013FC4
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_804B92C
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8047928
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_804B920
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8013F40
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word EndBG3Slider
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0

	.global gUnknown_085A9E48
gUnknown_085A9E48:  @ 0x085A9E48
	.incbin "baserom.gba", 0x5A9E48, 0x20

	.global gUnknown_085A9E68
gUnknown_085A9E68:  @ 0x085A9E68
	.incbin "baserom.gba", 0x5A9E68, 0x20

	.global gUnknown_085A9E88
gUnknown_085A9E88:  @ 0x085A9E88
@ Replacing .incbin "baserom.gba", 0x5A9E88, 0xC0
    .4byte 0x1
    .4byte 0x80d9f10
    .4byte 0xb
    .4byte 0x0
    .4byte 0x2
    .4byte sub_8047AF4
    .4byte 0x2
    .4byte sub_8047B34
    .4byte 0x2
    .4byte sub_8013FC4
    .4byte 0xe
    .4byte 0x0
    .4byte 0x2
    .4byte sub_804B92C
    .4byte 0x3
    .4byte sub_8047C60
    .4byte 0x2000c
    .4byte 0x0
    .4byte 0x1000b
    .4byte 0x0
    .4byte 0x2
    .4byte sub_8047D88
    .4byte 0x2
    .4byte sub_8013FC4
    .4byte 0xe
    .4byte 0x0
    .4byte 0x2
    .4byte sub_804B92C
    .4byte 0x2000b
    .4byte 0x0
    .4byte 0x3
    .4byte sub_8047CF0
    .4byte 0x3
    .4byte sub_8047FF8
    .4byte 0x3
    .4byte sub_80480B4
    .4byte 0x2
    .4byte sub_804B920
    .4byte 0x2
    .4byte sub_8013F40
    .4byte 0xe
    .4byte 0x0
    .4byte 0x2
    .4byte sub_8048168
    .4byte 0x1000e
    .4byte 0x0
    .4byte 0x1000c
    .4byte 0x0

	.global gUnknown_085A9F48
gUnknown_085A9F48:  @ 0x085A9F48
@ Replacing .incbin "baserom.gba", 0x5A9F48, 0x50
    .4byte 0x41020
    .4byte 0x8401b20
    .4byte 0x1d20
    .4byte 0x70540
    .4byte 0x1
    .4byte 0xc41
    .4byte 0x7000c
    .4byte 0x8411b21
    .4byte 0x1d20
    .4byte 0x70540
    .4byte 0x1
    .4byte 0xc41
    .4byte 0x7000c
    .4byte 0xd40
    .4byte sub_8048838
    .4byte 0x8421b21
    .4byte 0x1d20
    .4byte 0x820
    .4byte 0x1b22
    .4byte 0x120

	.global gUnknown_085A9F98
gUnknown_085A9F98:  @ 0x085A9F98
	.incbin "baserom.gba", 0x5A9F98, 0x8

	.global gUnknown_085A9FA0
gUnknown_085A9FA0:  @ 0x085A9FA0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8048864
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0

	.global gUnknown_085A9FB0
gUnknown_085A9FB0:  @ 0x085A9FB0
	.incbin "baserom.gba", 0x5A9FB0, 0xBC

	.global gUnknown_085AA06C
gUnknown_085AA06C:  @ 0x085AA06C
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8048988
        @ PROC_CALL
        .short 0x2, 0x0
        .word nullsub_43
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085AA084
gUnknown_085AA084:  @ 0x085AA084
	.incbin "baserom.gba", 0x5AA084, 0x20

	.global gUnknown_085AA0A4
gUnknown_085AA0A4:  @ 0x085AA0A4
	.incbin "baserom.gba", 0x5AA0A4, 0x26

	.global gUnknown_085AA0CA
gUnknown_085AA0CA:  @ 0x085AA0CA
	.incbin "baserom.gba", 0x5AA0CA, 0x26

	.global gUnknown_085AA0F0
gUnknown_085AA0F0:  @ 0x085AA0F0
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8048AA8
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8048B78
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8048CB8
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8048D64
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8048DD0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8048E6C
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085AA130
gUnknown_085AA130:  @ 0x085AA130
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8048E84
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8048EB8
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8048FD4
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085AA158
gUnknown_085AA158:  @ 0x085AA158
	.incbin "baserom.gba", 0x5AA158, 0x4

	.global gUnknown_085AA15C
gUnknown_085AA15C:  @ 0x085AA15C
    .incbin "baserom.gba", 0x5AA15C, 0x50

	.global gUnknown_085AA1AC
gUnknown_085AA1AC:  @ 0x085AA1AC
        @ PROC_LABEL
        .short 0xb, 0x0
        .word 0x0
        @ PROC_WHILE_EXISTS
        .short 0x8, 0x0
        .word gProcScr_BKSEL
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_804A108
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_804A158
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_804A1D0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_804A298
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_804A3A8
        @ PROC_LABEL
        .short 0xb, 0x1
        .word 0x0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085AA1FC
gUnknown_085AA1FC:  @ 0x085AA1FC
	.incbin "baserom.gba", 0x5AA1FC, 0x20

	.global gUnknown_085AA21C
gUnknown_085AA21C:  @ 0x085AA21C
	.incbin "baserom.gba", 0x5AA21C, 0x10

	.global gUnknown_085AA22C
gUnknown_085AA22C:  @ 0x085AA22C
	.incbin "baserom.gba", 0x5AA22C, 0x20

	.global gUnknown_085AA24C
gUnknown_085AA24C:  @ 0x085AA24C
        @ PROC_15
        .short 0x15, 0x0
        .word 0x0
        @ PROC_MARK
        .short 0xf, 0x1
        .word 0x0
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_804B278
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_804B604
        @ PROC_LABEL
        .short 0xb, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_804B624
        @ PROC_SLEEP
        .short 0xe, 0x20
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_804B6AC
        @ PROC_GOTO
        .short 0xc, 0x0
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_804B6B8
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085AA2B4
gUnknown_085AA2B4:  @ 0x085AA2B4
@ Replacing .incbin "baserom.gba", 0x5AA2B4, 0x24
    .4byte 0x10e20
    .4byte 0x70228
    .4byte 0x41020
    .4byte gUnknown_088B3AD8 + 0xe048
    .4byte 0x1d20
    .4byte 0x1b22
    .4byte 0xd40
    .4byte sub_804B6CC
    .4byte 0x120

	.global gUnknown_085AA2D8
gUnknown_085AA2D8:  @ 0x085AA2D8
@ Replacing .incbin "baserom.gba", 0x5AA2D8, 0x24
    .4byte 0x10e20
    .4byte 0x70228
    .4byte 0x41020
    .4byte gUnknown_088B3AD8 + 0x1e048
    .4byte 0x1d20
    .4byte 0x1b22
    .4byte 0xd40
    .4byte sub_804B6CC
    .4byte 0x120

	.global gUnknown_085AA2FC
gUnknown_085AA2FC:  @ 0x085AA2FC
        @ PROC_LABEL
        .short 0xb, 0x0
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8049CD4
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8049F38
        @ PROC_LABEL
        .short 0xb, 0x1
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8049D0C
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8049D24
        @ PROC_LABEL
        .short 0xb, 0x4
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8048A94
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_804B3B0
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80497A0
        @ PROC_CALL
        .short 0x2, 0x0
        .word RefreshBMapGraphics
        @ PROC_GOTO
        .short 0xc, 0x0
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x2
        .word 0x0
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_804B6F4
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_804B3D0
        @ PROC_START_CHILD_BLOCKING
        .short 0x6, 0x1
        .word gUnknown_085AA24C + 0x20
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_804B480
        @ PROC_LABEL
        .short 0xb, 0x3
        .word 0x0
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_804B708
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_804B408
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_804B518
        @ PROC_LABEL
        .short 0xb, 0x5
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8049D0C
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8049F44
        @ PROC_LABEL
        .short 0xb, 0x6
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8048A94
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_804B3B0
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80497A0
        @ PROC_CALL
        .short 0x2, 0x0
        .word RefreshBMapGraphics
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8049F38
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80498F4
        @ PROC_GOTO
        .short 0xc, 0x5
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x7
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_804A430
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8048A94
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_804A44C
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_804A51C
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_804A5A4
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_804A614
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_804A6A4
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8049238
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8048A94
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_804A7C0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_804A9A4
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_804AA88
        @ PROC_LABEL
        .short 0xb, 0x8
        .word 0x0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085AA4CC
gUnknown_085AA4CC:  @ 0x085AA4CC
        @ PROC_LABEL
        .short 0xb, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8049F38
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_804AAFC
        @ PROC_LABEL
        .short 0xb, 0x1
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_804ABCC
        @ PROC_GOTO
        .short 0xc, 0x2
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x3
        .word 0x0
        @ PROC_START_CHILD_BLOCKING
        .short 0x6, 0x1
        .word gUnknown_085AA24C + 0x20
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_WHILE_EXISTS
        .short 0x8, 0x0
        .word gUnknown_085921C8
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_804B554
        @ PROC_LABEL
        .short 0xb, 0x4
        .word 0x0
        @ PROC_WHILE_EXISTS
        .short 0x8, 0x0
        .word gUnknown_085921C8
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_804B5E0
        @ PROC_LABEL
        .short 0xb, 0x2
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_804ACC4
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8048A94
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_804A51C
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_804A5A4
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_804A614
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_804A6A4
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8049238
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8048A94
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_804A7C0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_804A9A4
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_804AA88
        @ PROC_LABEL
        .short 0xb, 0x5
        .word 0x0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085AA5BC
gUnknown_085AA5BC:  @ 0x085AA5BC
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8049F38
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x0
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_804AEC4
        @ PROC_LABEL
        .short 0xb, 0x1
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_804AF5C
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_804B190
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_804B1C0
        @ PROC_LABEL
        .short 0xb, 0x2
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_804B250
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8048A94
        @ PROC_GOTO
        .short 0xc, 0x4
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x3
        .word 0x0
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_804B6F4
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_804B43C
        @ PROC_LABEL
        .short 0xb, 0x4
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_804A51C
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_804A5A4
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_804A614
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_804A6A4
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8049238
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8048A94
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_804A7C0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_804A9A4
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_804AA88
        @ PROC_LABEL
        .short 0xb, 0x5
        .word 0x0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085AA6BC
gUnknown_085AA6BC:  @ 0x085AA6BC
        @ PROC_15
        .short 0x15, 0x0
        .word 0x0
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80d9fbc
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8049828
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8013FC4
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_804B92C
        @ PROC_LABEL
        .short 0xb, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80499D0
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_START_CHILD_BLOCKING
        .short 0x6, 0x1
        .word gUnknown_085AAB68
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8049964
        @ PROC_GOTO
        .short 0xc, 0x0
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x2
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_804B71C
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_804B76C
        @ PROC_LABEL
        .short 0xb, 0x3
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8049B04
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085AA75C
gUnknown_085AA75C:  @ 0x085AA75C
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_804B800
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word BattleApplyGameStateUpdates
        @ PROC_WHILE
        .short 0x14, 0x0
        .word DoesBMXFADEExist
        @ PROC_CALL
        .short 0x2, 0x0
        .word BATTLE_GOTO1_IfNobodyIsDead
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_804B850
        @ PROC_SLEEP
        .short 0xe, 0x20
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word BATTLE_DeleteLinkedMOVEUNIT
        @ PROC_LABEL
        .short 0xb, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_804B8D0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085AA7B4
gUnknown_085AA7B4:  @ 0x085AA7B4
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_804BB54
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_804BBA0
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_804BC3C
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085AA7EC
gUnknown_085AA7EC:  @ 0x085AA7EC
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_804BB54
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_804BD3C
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_804BDD8
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085AA824
gUnknown_085AA824:  @ 0x085AA824
@ replacing .incbin "baserom.gba", 0x005aa824, 0x18
.4byte gUnknown_0859A140
.4byte gUnknown_0859A120
.4byte gUnknown_0859A160
.4byte gUnknown_0859A180
.4byte gUnknown_0859A1A0
.4byte gUnknown_0859A1C0

	.global gUnknown_085AA83C
gUnknown_085AA83C:  @ 0x085AA83C
        @ PROC_SLEEP
        .short 0xe, 0x11
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_804BF30
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085AA854
gUnknown_085AA854:  @ 0x085AA854
    .incbin "baserom.gba", 0x5AA854, 0x18

	.global gUnknown_085AA86C
gUnknown_085AA86C:  @ 0x085AA86C
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80d9fc4
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_804C02C
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_804C078
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_804C12C
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085AA89C
gUnknown_085AA89C:  @ 0x085AA89C
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80d9fcc
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_804C148
        @ PROC_SLEEP
        .short 0xe, 0x5
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_804C178
        @ PROC_SLEEP
        .short 0xe, 0xf
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_804C188
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_804C194
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_804C148
        @ PROC_SLEEP
        .short 0xe, 0x5
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_804C1B8
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_804C1D8
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_804C1E4
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085AA914
gUnknown_085AA914:  @ 0x085AA914
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_804C188
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_804C194
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_804C148
        @ PROC_SLEEP
        .short 0xe, 0x5
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_804C1B8
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085AA954
gUnknown_085AA954:  @ 0x085AA954
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_804C2DC
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085AA96C
gUnknown_085AA96C:  @ 0x085AA96C
	.incbin "baserom.gba", 0x5AA96C, 0x14

	.global gUnknown_085AA980
gUnknown_085AA980:  @ 0x085AA980
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_804C3EC
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_804C47C
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085AA9A0
gUnknown_085AA9A0:  @ 0x085AA9A0
@ replacing .incbin "baserom.gba", 0x005aa9a0, 0x14
.4byte gUnknown_080D9FE4 + 0x18
.4byte gUnknown_080D9FE4 + 0x38
.4byte gUnknown_080D9FE4 + 0x58
.4byte gUnknown_080D9FE4 + 0x78
.4byte gUnknown_080D9FE4 + 0x98

	.global gUnknown_085AA9B4
gUnknown_085AA9B4:  @ 0x085AA9B4
@ replacing .incbin "baserom.gba", 0x005aa9b4, 0xc
.4byte gUnknown_080DA09C + 0x8
.4byte gUnknown_080DA09C + 0x16
.4byte gUnknown_080DA09C + 0x2a

	.global gUnknown_085AA9C0
gUnknown_085AA9C0:  @ 0x085AA9C0
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_804C5F8
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085AA9D8
gUnknown_085AA9D8:  @ 0x085AA9D8
	.incbin "baserom.gba", 0x5AA9D8, 0x36

	.global gUnknown_085AAA0E
gUnknown_085AAA0E:  @ 0x085AAA0E
	.incbin "baserom.gba", 0x5AAA0E, 0x3A

	.global gUnknown_085AAA48
gUnknown_085AAA48:  @ 0x085AAA48
@ replacing .incbin "baserom.gba", 0x005aaa48, 0x8
.4byte gUnknown_085AA9D8 + 0xe
.4byte gUnknown_085AA9D8 + 0x22

	.global gUnknown_085AAA50
gUnknown_085AAA50:  @ 0x085AAA50
	.incbin "baserom.gba", 0x5AAA50, 0xE

	.global gUnknown_085AAA5E
gUnknown_085AAA5E:  @ 0x085AAA5E
	.incbin "baserom.gba", 0x5AAA5E, 0x1A

	.global gUnknown_085AAA78
gUnknown_085AAA78:  @ 0x085AAA78
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_804C894
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085AAA90
gUnknown_085AAA90:  @ 0x085AAA90
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_804CB94
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085AAAA8
gUnknown_085AAAA8:  @ 0x085AAAA8
@ replacing .incbin "baserom.gba", 0x005aaaa8, 0x8
.4byte gUnknown_080DA102 + 0x20
.4byte gUnknown_080DA102 + 0x28

	.global gUnknown_085AAAB0
gUnknown_085AAAB0:  @ 0x085AAAB0
@ replacing .incbin "baserom.gba", 0x005aaab0, 0x14
.4byte gUnknown_080DA132 + 0x20
.4byte gUnknown_080DA132 + 0x18
.4byte gUnknown_080DA132 + 0x28
.4byte gUnknown_080DA132 + 0x10
.4byte gUnknown_080DA132 + 0x8

	.global gUnknown_085AAAC4
gUnknown_085AAAC4:  @ 0x085AAAC4
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_804CCCC
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085AAADC
gUnknown_085AAADC:  @ 0x085AAADC
@ replacing .incbin "baserom.gba", 0x005aaadc, 0xc
.4byte gUnknown_080DA132 + 0x30
.4byte gUnknown_080DA132 + 0x38
.4byte gUnknown_080DA132 + 0x40

	.global gUnknown_085AAAE8
gUnknown_085AAAE8:  @ 0x085AAAE8
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_804CDE8
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085AAB00
gUnknown_085AAB00:  @ 0x085AAB00
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_804CE5C
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085AAB18
gUnknown_085AAB18:  @ 0x085AAB18
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_804CF04
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085AAB30
gUnknown_085AAB30:  @ 0x085AAB30
	.incbin "baserom.gba", 0x5AAB30, 0x8

	.global gUnknown_085AAB38
gUnknown_085AAB38:  @ 0x085AAB38
	.incbin "baserom.gba", 0x5AAB38, 0x8

	.global gUnknown_085AAB40
gUnknown_085AAB40:  @ 0x085AAB40
	.incbin "baserom.gba", 0x5AAB40, 0x8

	.global gUnknown_085AAB48
gUnknown_085AAB48:  @ 0x085AAB48
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_804CFE0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_804D01C
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0

	.global gUnknown_085AAB68
gUnknown_085AAB68:  @ 0x085AAB68
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_804D2A4
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_START_CHILD
        .short 0x5, 0x0
        .word gUnknown_0859AEF8
        @ PROC_START_CHILD
        .short 0x5, 0x0
        .word gUnknown_0859AF40
        @ PROC_START_CHILD
        .short 0x5, 0x0
        .word gUnknown_0859AF60
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_801F3A8
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_801F490
        @ PROC_CALL
        .short 0x2, 0x0
        .word StopBGM2
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_804D37C
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0

	.global gUnknown_085AABB8
gUnknown_085AABB8:  @ 0x085AABB8
@ replacing .incbin "baserom.gba", 0x005aabb8, 0x10
.4byte gUnknown_080DA22C + 0x10
.4byte gUnknown_080DA22C + 0x18
.4byte gUnknown_080DA22C + 0x20
.4byte gUnknown_080DA22C + 0x28

	.global gUnknown_085AABC8
gUnknown_085AABC8:  @ 0x085AABC8
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_804D47C
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085AABD8
gUnknown_085AABD8:  @ 0x085AABD8
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_804D7B0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0
@ Replacing .incbin "baserom.gba", 0x5AABD8 + 0x18, 0x1C8 - 0x18
    .4byte 0x80da2e4
    .4byte 0x0
    .4byte 0x100
    .4byte MenuAlwaysEnabled
    .4byte 0x0
    .4byte sub_804D8C8
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0x80da2d8
    .4byte 0x0
    .4byte 0x200
    .4byte MenuAlwaysEnabled
    .4byte 0x0
    .4byte sub_804D8C8
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0x80da2f0
    .4byte 0x0
    .4byte 0x300
    .4byte sub_804D858
    .4byte sub_804D8DC
    .4byte sub_804D8A4
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0x80da2f0
    .4byte 0x0
    .4byte 0x400
    .4byte sub_804D858
    .4byte sub_804D8DC
    .4byte sub_804D8A4
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0x80da2f0
    .4byte 0x0
    .4byte 0x500
    .4byte sub_804D858
    .4byte sub_804D8DC
    .4byte sub_804D8A4
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0x80da2f0
    .4byte 0x0
    .4byte 0x600
    .4byte sub_804D858
    .4byte sub_804D8DC
    .4byte sub_804D8A4
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0x80da2f0
    .4byte 0x0
    .4byte 0x700
    .4byte sub_804D858
    .4byte sub_804D8DC
    .4byte sub_804D8A4
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0x80210
    .4byte 0x0
    .4byte 0x85aabf0
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte sub_804D940
    .4byte 0x0
    .4byte 0x0

	.global gUnknown_085AADA0
gUnknown_085AADA0:  @ 0x085AADA0
@ Replacing .incbin "baserom.gba", 0x5AADA0, 0x6C
    .4byte 0xe0101
    .4byte 0x0
    .4byte 0x85aac5c
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte sub_804D940
    .4byte 0x0
    .4byte 0x0
    .4byte 0xc0201
    .4byte 0x0
    .4byte 0x85aad34
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte MenuCancelSelect
    .4byte 0x0
    .4byte 0x0
    .4byte 0x160201
    .4byte 0x0
    .4byte 0x85aad58
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte MenuCancelSelect
    .4byte 0x0
    .4byte 0x0

	.global gUnknown_085AAE0C
gUnknown_085AAE0C:  @ 0x085AAE0C
    .incbin "baserom.gba", 0x5AAE0C, 0x54C

	.global gUnknown_085AB358
gUnknown_085AB358:  @ 0x085AB358
    .incbin "baserom.gba", 0x5AB358, 0xA10

	.global gUnknown_085ABD68
gUnknown_085ABD68:  @ 0x085ABD68
    .incbin "baserom.gba", 0x5ABD68, 0x89C

	.global gUnknown_085AC604
gUnknown_085AC604:  @ 0x085AC604
	.incbin "baserom.gba", 0x5AC604, 0x3D8

	.global gUnknown_085AC9DC
gUnknown_085AC9DC:  @ 0x085AC9DC
	.incbin "baserom.gba", 0x5AC9DC, 0x344

	.global gUnknown_085ACD20
gUnknown_085ACD20:  @ 0x085ACD20
	.incbin "baserom.gba", 0x5ACD20, 0x1DC

	.global gUnknown_085ACEFC
gUnknown_085ACEFC:  @ 0x085ACEFC
	.incbin "baserom.gba", 0x5ACEFC, 0x1D0

	.global gUnknown_085AD0CC
gUnknown_085AD0CC:  @ 0x085AD0CC
    .incbin "baserom.gba", 0x5AD0CC, 0x740

	.global gUnknown_085AD80C
gUnknown_085AD80C:  @ 0x085AD80C
	.incbin "baserom.gba", 0x5AD80C, 0x1C0

	.global gUnknown_085AD9CC
gUnknown_085AD9CC:  @ 0x085AD9CC
	.incbin "baserom.gba", 0x5AD9CC, 0x6C

	.global gUnknown_085ADA38
gUnknown_085ADA38:  @ 0x085ADA38
	.incbin "baserom.gba", 0x5ADA38, 0x1B0

	.global gUnknown_085ADBE8
gUnknown_085ADBE8:  @ 0x085ADBE8
	.incbin "baserom.gba", 0x5ADBE8, 0x60

	.global gUnknown_085ADC48
gUnknown_085ADC48:  @ 0x085ADC48
	.incbin "baserom.gba", 0x5ADC48, 0x80

	.global gUnknown_085ADCC8
gUnknown_085ADCC8:  @ 0x085ADCC8
	.incbin "baserom.gba", 0x5ADCC8, 0xE0

	.global gUnknown_085ADDA8
gUnknown_085ADDA8:  @ 0x085ADDA8
	.incbin "baserom.gba", 0x5ADDA8, 0x20

	.global gUnknown_085ADDC8
gUnknown_085ADDC8:  @ 0x085ADDC8
	.incbin "baserom.gba", 0x5ADDC8, 0x20

	.global gUnknown_085ADDE8
gUnknown_085ADDE8:  @ 0x085ADDE8
	.incbin "baserom.gba", 0x5ADDE8, 0x20

	.global gUnknown_085ADE08
gUnknown_085ADE08:  @ 0x085ADE08
	.incbin "baserom.gba", 0x5ADE08, 0x20

	.global gUnknown_085ADE28
gUnknown_085ADE28:  @ 0x085ADE28
	.incbin "baserom.gba", 0x5ADE28, 0x20

	.global gUnknown_085ADE48
gUnknown_085ADE48:  @ 0x085ADE48
	.incbin "baserom.gba", 0x5ADE48, 0x20

	.global gUnknown_085ADE68
gUnknown_085ADE68:  @ 0x085ADE68
	.incbin "baserom.gba", 0x5ADE68, 0x20

	.global gUnknown_085ADE88
gUnknown_085ADE88:  @ 0x085ADE88
	.incbin "baserom.gba", 0x5ADE88, 0xB8

	.global gUnknown_085ADF40
gUnknown_085ADF40:  @ 0x085ADF40
	.incbin "baserom.gba", 0x5ADF40, 0x250

	.global gUnknown_085AE190
gUnknown_085AE190:  @ 0x085AE190
	.incbin "baserom.gba", 0x5AE190, 0x2D4

	.global gUnknown_085AE464
gUnknown_085AE464:  @ 0x085AE464
	.incbin "baserom.gba", 0x5AE464, 0x314

	.global gUnknown_085AE778
gUnknown_085AE778:  @ 0x085AE778
	.incbin "baserom.gba", 0x5AE778, 0x74

	.global gUnknown_085AE7EC
gUnknown_085AE7EC:  @ 0x085AE7EC
    .incbin "baserom.gba", 0x5AE7EC, 0x984

	.global gUnknown_085AF170
gUnknown_085AF170:  @ 0x085AF170
    .incbin "baserom.gba", 0x5AF170, 0x16AC

	.global gUnknown_085B081C
gUnknown_085B081C:  @ 0x085B081C
	.incbin "baserom.gba", 0x5B081C, 0x80

	.global gUnknown_085B089C
gUnknown_085B089C:  @ 0x085B089C
	.incbin "baserom.gba", 0x5B089C, 0x54C

	.global gUnknown_085B0DE8
gUnknown_085B0DE8:  @ 0x085B0DE8
	.incbin "baserom.gba", 0x5B0DE8, 0x144

	.global gUnknown_085B0F2C
gUnknown_085B0F2C:  @ 0x085B0F2C
    .incbin "baserom.gba", 0x5B0F2C, 0x5504
