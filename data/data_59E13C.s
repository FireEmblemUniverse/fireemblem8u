    .section .data

	.global gUnknown_0859E13C
gUnknown_0859E13C:  @ 0x0859E13C
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_803471C
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_0859E14C
gUnknown_0859E14C:  @ 0x0859E14C
	.incbin "baserom.gba", 0x59E14C, 0x1A

	.global gUnknown_0859E166
gUnknown_0859E166:  @ 0x0859E166
	.incbin "baserom.gba", 0x59E166, 0x22

	.global gUnknown_0859E188
gUnknown_0859E188:  @ 0x0859E188
        @ PROC_END_DUPLICATES
        .short 0x17, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8035614
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8035630
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_803564C
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_0859E1B0
gUnknown_0859E1B0:  @ 0x0859E1B0
	.incbin "baserom.gba", 0x59E1B0, 0x8

	.global gUnknown_0859E1B8
gUnknown_0859E1B8:  @ 0x0859E1B8
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80d7fac
        @ PROC_15
        .short 0x15, 0x0
        .word 0x0
        @ PROC_SET_END_CB
        .short 0x4, 0x0
        .word sub_8035698
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8035678
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80356BC
        @ PROC_BLOCK
        .short 0x10, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80359B4
        @ PROC_LABEL
        .short 0xb, 0x0
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8035A0C
        @ PROC_SLEEP
        .short 0xe, 0x20
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word MU_EndAll
        @ PROC_GOTO
        .short 0xc, 0x0
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x63
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word RefreshEntityBmMaps
        @ PROC_CALL
        .short 0x2, 0x0
        .word RenderBmMap
        @ PROC_CALL
        .short 0x2, 0x0
        .word SMS_UpdateFromGameData
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0

