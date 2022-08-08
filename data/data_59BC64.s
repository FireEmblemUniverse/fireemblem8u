    .section .data

	.global gUnknown_0859BC64
gUnknown_0859BC64:  @ 0x0859BC64
@ Replacing .incbin "baserom.gba", 0x59BC64, 0x44
    .4byte 0x31020
    .4byte 0x70228
    .4byte 0x1120
    .4byte 0xd40
    .4byte FreezeMenu
    .4byte 0x80e20
    .4byte 0x1a25
    .4byte 0xb0540
    .4byte 0xffffffff
    .4byte 0x9491b20
    .4byte 0x1d20
    .4byte 0xd40
    .4byte ResumeMenu
    .4byte 0x1ca1120
    .4byte 0xd40
    .4byte sub_802E0A0
    .4byte 0x120

	.global gUnknown_0859BCA8
gUnknown_0859BCA8:  @ 0x0859BCA8
@ Replacing .incbin "baserom.gba", 0x59BCA8, 0x4C
    .4byte 0x31020
    .4byte 0x70228
    .4byte 0xd40
    .4byte sub_802DEDC
    .4byte 0x1120
    .4byte 0xd40
    .4byte FreezeMenu
    .4byte 0x80e20
    .4byte 0x1a25
    .4byte 0xb0540
    .4byte 0xffffffff
    .4byte 0x94a1b20
    .4byte 0x1d20
    .4byte 0xd40
    .4byte ResumeMenu
    .4byte 0x81120
    .4byte 0xd40
    .4byte sub_802E0B0
    .4byte 0x120

	.global gUnknown_0859BCF4
gUnknown_0859BCF4:  @ 0x0859BCF4
@ Replacing .incbin "baserom.gba", 0x59BCF4, 0x4C
    .4byte 0x31020
    .4byte 0x70228
    .4byte 0xd40
    .4byte sub_802DEDC
    .4byte 0x1120
    .4byte 0xd40
    .4byte FreezeMenu
    .4byte 0x80e20
    .4byte 0x1a25
    .4byte 0xb0540
    .4byte 0xffffffff
    .4byte 0x94b1b20
    .4byte 0x1d20
    .4byte 0xd40
    .4byte ResumeMenu
    .4byte 0x81120
    .4byte 0xd40
    .4byte sub_802E0D0
    .4byte 0x120

	.global gUnknown_0859BD40
gUnknown_0859BD40:  @ 0x0859BD40
@ Replacing .incbin "baserom.gba", 0x59BD40, 0x60
    .4byte 0x31020
    .4byte 0x70228
    .4byte 0xd40
    .4byte sub_802E0F0
    .4byte 0xd40
    .4byte StartTradeMenuTutorialHandCursor
    .4byte 0xd40
    .4byte sub_802DEDC
    .4byte 0x1120
    .4byte 0xd40
    .4byte FreezeMenu
    .4byte 0x80e20
    .4byte 0x1a25
    .4byte 0xb0540
    .4byte 0xffffffff
    .4byte 0x94c1b20
    .4byte 0x1d20
    .4byte 0xd40
    .4byte ResumeMenu
    .4byte 0x91120
    .4byte 0xff7f3d20
    .4byte 0xd40
    .4byte sub_802E100
    .4byte 0x120

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
        .word gUnknown_0859E490
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


