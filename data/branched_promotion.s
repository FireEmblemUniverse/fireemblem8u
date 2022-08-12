    .section .data

@ Replacing .incbin "baserom.gba", 0xB1280C + 0xB8, 0x124 - 0xB8
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0
    .4byte 0x0


	.global gUnknown_08B12930
gUnknown_08B12930:  @ 0x08B12930
@ Replacing .incbin "baserom.gba", 0xB12930, 0xB4
    .4byte 0x60409
    .4byte 0x1
    .4byte gUnknown_08B1280C + 0xb8
    .4byte sub_80CDA84
    .4byte sub_80CDA90
    .4byte 0x0
    .4byte sub_80CDB18
    .4byte 0x0
    .4byte MenuStdHelpBox
    .4byte gUnknown_082070AC + 0x38
    .4byte 0x6dc0000
    .4byte 0x0
    .4byte MenuAlwaysEnabled
    .4byte PromotionCommand_OnTextDraw
    .4byte PromotionCommand_OnSelect
    .4byte 0x0
    .4byte PromotionCommand_OnChange
    .4byte 0x0
    .4byte gUnknown_082070AC + 0x2c
    .4byte 0x6dc0000
    .4byte 0x100
    .4byte MenuAlwaysEnabled
    .4byte PromotionCommand_OnTextDraw
    .4byte PromotionCommand_OnSelect
    .4byte 0x0
    .4byte PromotionCommand_OnChange
    .4byte 0x0
    .4byte gUnknown_082070AC + 0x20
    .4byte 0x6dc0000
    .4byte 0x200
    .4byte Usability_ThirdPromotionOption
    .4byte PromotionCommand_OnTextDraw
    .4byte PromotionCommand_OnSelect
    .4byte 0x0
    .4byte PromotionCommand_OnChange
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

	.global gUnknown_08B129E4
gUnknown_08B129E4:  @ 0x08B129E4
@ Replacing .incbin "baserom.gba", 0xB129E4, 0x24
    .4byte 0x80210
    .4byte 0x0
    .4byte gUnknown_08B12930 + 0x24
    .4byte sub_80CDB1C
    .4byte sub_80CDB28
    .4byte 0x0
    .4byte sub_80CDC14
    .4byte 0x0
    .4byte 0x0

	.global gUnknown_08B12A08
gUnknown_08B12A08:  @ 0x08B12A08
        @ PROC_SLEEP
        .short 0xe, 0x6
        .word 0x0
        @ PROC_NAME("CCRamifyMenuSelect")
        .short 0x1, 0x0
        .word 0x82070f0
        @ PROC_CALL
        .short 0x2, 0x0
        .word BuildPromotionMenu
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80CDDD4
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x0
        .word 0x0
        @ PROC_GOTO
        .short 0xc, 0x2
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word nullsub_61
        @ PROC_LABEL
        .short 0xb, 0x2
        .word 0x0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0

    .section .rodata

	.global gUnknown_08207044
gUnknown_08207044:  @ 0x08207044
	.incbin "baserom.gba", 0x207044, 0xC

	.incbin "baserom.gba", 0x207050, 0x2C

	.global gUnknown_0820707C
gUnknown_0820707C:  @ 0x0820707C
	.incbin "baserom.gba", 0x20707C, 0xC

	.global gUnknown_08207088
gUnknown_08207088:  @ 0x08207088
	.incbin "baserom.gba", 0x207088, 0xC

	.global gUnknown_08207094
gUnknown_08207094:  @ 0x08207094
	.incbin "baserom.gba", 0x207094, 0xC

	.global gUnknown_082070A0
gUnknown_082070A0:  @ 0x082070A0
	.incbin "baserom.gba", 0x2070A0, 0xC

	.global gUnknown_082070AC
gUnknown_082070AC:  @ 0x082070AC
	.incbin "baserom.gba", 0x2070AC, 0xC

	.global gUnknown_082070B8
gUnknown_082070B8:  @ 0x082070B8
	.incbin "baserom.gba", 0x2070B8, 0xD8
