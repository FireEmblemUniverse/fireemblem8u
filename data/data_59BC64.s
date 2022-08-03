    .section .data

	.global gUnknown_0859BC64
gUnknown_0859BC64:  @ 0x0859BC64
	.incbin "baserom.gba", 0x59BC64, 0x44

	.global gUnknown_0859BCA8
gUnknown_0859BCA8:  @ 0x0859BCA8
	.incbin "baserom.gba", 0x59BCA8, 0x4C

	.global gUnknown_0859BCF4
gUnknown_0859BCF4:  @ 0x0859BCF4
	.incbin "baserom.gba", 0x59BCF4, 0x4C

	.global gUnknown_0859BD40
gUnknown_0859BD40:  @ 0x0859BD40
	.incbin "baserom.gba", 0x59BD40, 0x60

	.global gUnknown_0859BDA0
gUnknown_0859BDA0:  @ 0x0859BDA0
        @ PROC_CALL
        .short 0x2, 0x0
        .word CountDownTraps
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_802EA00
        @ PROC_CALL
        .short 0x2, 0x0
        .word GenerateTrapDamageTargets
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_802EA1C
        @ PROC_CALL
        .short 0x2, 0x0
        .word GenerateDisplayedTrapDamageTargets
        @ PROC_START_CHILD_BLOCKING
        .short 0x6, 0x1
        .word 0x859e490
        @ PROC_CALL
        .short 0x2, 0x0
        .word ResetCountedDownTraps
        @ PROC_CALL
        .short 0x2, 0x0
        .word RefreshEntityBmMaps
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_802EA28
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


