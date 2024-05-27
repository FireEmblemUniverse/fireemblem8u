    .section .data

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
        .word FadeInBlackSpeed20
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word Clear_0203DDDC
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80457F8
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_804589C
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

	.global ProcScr_SIOPRA
ProcScr_SIOPRA:  @ 0x085A979C
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
        .word Set_0203DDDC
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

	.global gUnknown_085A9864
gUnknown_085A9864:  @ 0x085A9864
	.incbin "baserom.gba", 0x5A9864, 0x20

	.global gUnknown_085A9884
gUnknown_085A9884:  @ 0x085A9884
@ replacing .incbin "baserom.gba", 0x005a9884, 0x4
.4byte gGenericBuffer

	.global ProcScr_SIOBAT
ProcScr_SIOBAT:  @ 0x085A9888
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
        .word FadeInBlackSpeed20
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word Clear_0203DDDC
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
        .word Set_0203DDDC
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
        .word EndMuralBackground
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8046838
        @ PROC_CALL
        .short 0x2, 0x0
        .word FadeInBlackSpeed20
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word Clear_0203DDDC
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
        .word Set_0203DDDC
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
        .word FadeInBlackSpeed20
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word Clear_0203DDDC
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
        .word Set_0203DDDC
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
        .word EndMuralBackground
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
        .word Set_0203DDDC
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
        .word Set_0203DDDC
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
        .word EndMuralBackground
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
        .word Set_0203DDDC
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

	.global ProcScr_SIOTERM
ProcScr_SIOTERM:  @ 0x085A9BA0
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
        .word FadeInBlackSpeed20
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word Clear_0203DDDC
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8046CF0
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
        .word EndMuralBackground
        @ PROC_CALL
        .short 0x2, 0x0
        .word BMapVSync_End
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word StartPrepAtMenuWithConfig
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
        .word Set_0203DDDC
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
        .word Set_0203DDDC
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
        .word Set_0203DDDC
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
        .word EndMuralBackground
        @ PROC_GOTO
        .short 0xc, 0x0
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x1
        .word 0x0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0
