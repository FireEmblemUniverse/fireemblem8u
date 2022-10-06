    .section .data

	.global gUnknown_0859B4F8
gUnknown_0859B4F8:  @ 0x0859B4F8
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8021E10
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8021ECC
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_0859B510
gUnknown_0859B510:  @ 0x0859B510
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8021FB8
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8021FEC
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_0859B528
gUnknown_0859B528:  @ 0x0859B528
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80220A8
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8022200
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_0859B540
gUnknown_0859B540:  @ 0x0859B540
	.incbin "baserom.gba", 0x59B540, 0x20

	.global gUnknown_0859B560
gUnknown_0859B560:  @ 0x0859B560
        @ PROC_SLEEP
        .short 0xe, 0x18
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80222E0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_0859B578
gUnknown_0859B578:  @ 0x0859B578
        @ PROC_CALL
        .short 0x2, 0x0
        .word BMapDispSuspend
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_802237C
        @ PROC_START_CHILD
        .short 0x5, 0x0
        .word sProcScr_ChapterIntro_KeyListen
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8013D8C
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word ContinueUntilSomeTransistion6CExists
        @ PROC_CALL_ARG
        .short 0x18, 0x63
        .word ChapterIntro_SetSkipTarget
        @ PROC_SLEEP
        .short 0xe, 0xb4
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x63
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8013D68
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word ContinueUntilSomeTransistion6CExists
        @ PROC_LABEL
        .short 0xb, 0x3e7
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80224EC
        @ PROC_CALL
        .short 0x2, 0x0
        .word ChapterIntro_8020B20
        @ PROC_CALL
        .short 0x2, 0x0
        .word BMapDispResume
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8022528
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0
