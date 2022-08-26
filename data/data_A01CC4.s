    .section .data

@ Replacing .incbin "baserom.gba", 0xA01CC4, 0x54
    .4byte gUnknown_08A01D18
    .4byte gProcScr_08A01CA4 + 0x3c
    .4byte 0x00000000
    .4byte gUnknown_08A01D18 + 0x38
    .4byte 0x06f14424
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte gProcScr_08A01CA4 + 0x20
    .4byte gProcScr_08A01CA4 + 0x58
    .4byte 0x00000000
    .4byte gUnknown_08A01D18 + 0x54
    .4byte 0x06f27410
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte gProcScr_08A01CA4 + 0x3c
    .4byte gUnknown_08A01D18
    .4byte 0x00000000
    .4byte gUnknown_08A01D18 + 0x54
    .4byte 0x06f38410
    .4byte 0x00000000
    .4byte 0x00000000

	.global gUnknown_08A01D18
gUnknown_08A01D18:  @ 0x08A01D18
@ Replacing .incbin "baserom.gba", 0xA01D18, 0x70
    .4byte gProcScr_08A01CA4 + 0x58
    .4byte gProcScr_08A01CA4 + 0x20
    .4byte 0x00000000
    .4byte gUnknown_08A01D18 + 0x1c
    .4byte 0x06ed2b14
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte gProcScr_08A01CA4 + 0x58
    .4byte gProcScr_08A01CA4 + 0x20
    .4byte gUnknown_08A01D18
    .4byte gUnknown_08A01D18 + 0x38
    .4byte 0x06ee2b4c
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte gUnknown_08A01D18 + 0x54
    .4byte gUnknown_08A01D18 + 0x54
    .4byte gProcScr_08A01CA4 + 0x20
    .4byte 0x00000000
    .4byte 0x06ef3e88
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte gUnknown_08A01D18 + 0x38
    .4byte gUnknown_08A01D18 + 0x38
    .4byte gProcScr_08A01CA4 + 0x58
    .4byte 0x00000000
    .4byte 0x06f07f98
    .4byte 0x00000000
    .4byte 0x00000000

	.global gUnknown_08A01D88
gUnknown_08A01D88:  @ 0x08A01D88
	.incbin "baserom.gba", 0xA01D88, 0x26

	.global gUnknown_08A01DAE
gUnknown_08A01DAE:  @ 0x08A01DAE
	.incbin "baserom.gba", 0xA01DAE, 0xE

	.global gUnknown_08A01DBC
gUnknown_08A01DBC:  @ 0x08A01DBC
        @ PROC_SET_END_CB
        .short 0x4, 0x0
        .word sub_808F0C4
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_808EBD4
        @ PROC_LABEL
        .short 0xb, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_808EF64
        @ PROC_LABEL
        .short 0xb, 0x2
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_808EF6C
        @ PROC_LABEL
        .short 0xb, 0x3
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_808F0EC
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_808F04C
        @ PROC_LABEL
        .short 0xb, 0x4
        .word 0x0
        @ PROC_BLOCK
        .short 0x10, 0x0
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_808EFA8
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_808F008
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_808F084
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x5
        .word 0x0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08A01E54
gUnknown_08A01E54:  @ 0x08A01E54
	.incbin "baserom.gba", 0xA01E54, 0x8

	.global gUnknown_08A01E5C
gUnknown_08A01E5C:  @ 0x08A01E5C
	.incbin "baserom.gba", 0xA01E5C, 0x8

	.global gUnknown_08A01E64
gUnknown_08A01E64:  @ 0x08A01E64
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x0
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_808F8B4
        @ PROC_LABEL
        .short 0xb, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_808FF10
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_808FF18
        @ PROC_GOTO
        .short 0xc, 0x0
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x2
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_808FF9C
        @ PROC_GOTO
        .short 0xc, 0x0
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x63
        .word 0x0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08A01EC4
gUnknown_08A01EC4:  @ 0x08A01EC4
        @ PROC_SLEEP
        .short 0xe, 0x8
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8090014
        @ PROC_SLEEP
        .short 0xe, 0x5
        .word 0x0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08A01EE4
gUnknown_08A01EE4:  @ 0x08A01EE4
	.incbin "baserom.gba", 0xA01EE4, 0x20

	.global gUnknown_08A01F04
gUnknown_08A01F04:  @ 0x08A01F04
	.incbin "baserom.gba", 0xA01F04, 0x20

	.global gUnknown_08A01F24
gUnknown_08A01F24:  @ 0x08A01F24
	.incbin "baserom.gba", 0xA01F24, 0x1CC

	.global gUnknown_08A020F0
gUnknown_08A020F0:  @ 0x08A020F0
	.incbin "baserom.gba", 0xA020F0, 0xF4

	.global gUnknown_08A021E4
gUnknown_08A021E4:  @ 0x08A021E4
	.incbin "baserom.gba", 0xA021E4, 0x20

	.global gUnknown_08A02204
gUnknown_08A02204:  @ 0x08A02204
	.incbin "baserom.gba", 0xA02204, 0x4C

	.global gUnknown_08A02250
gUnknown_08A02250:  @ 0x08A02250
	.incbin "baserom.gba", 0xA02250, 0x24

	.global gUnknown_08A02274
gUnknown_08A02274:  @ 0x08A02274
	.incbin "baserom.gba", 0xA02274, 0x588

	.global gUnknown_08A027FC
gUnknown_08A027FC:  @ 0x08A027FC
	.incbin "baserom.gba", 0xA027FC, 0x60

	.global gUnknown_08A0285C
gUnknown_08A0285C:  @ 0x08A0285C
	.incbin "baserom.gba", 0xA0285C, 0x28

	.global gUnknown_08A02884
gUnknown_08A02884:  @ 0x08A02884
	.incbin "baserom.gba", 0xA02884, 0x28

	.global gUnknown_08A028AC
gUnknown_08A028AC:  @ 0x08A028AC
	.incbin "baserom.gba", 0xA028AC, 0x68

	.global gUnknown_08A02914
gUnknown_08A02914:  @ 0x08A02914
	.incbin "baserom.gba", 0xA02914, 0x6C

	.global gUnknown_08A02980
gUnknown_08A02980:  @ 0x08A02980
	.incbin "baserom.gba", 0xA02980, 0x28

	.global gUnknown_08A029A8
gUnknown_08A029A8:  @ 0x08A029A8
	.incbin "baserom.gba", 0xA029A8, 0x74

	.global gUnknown_08A02A1C
gUnknown_08A02A1C:  @ 0x08A02A1C
	.incbin "baserom.gba", 0xA02A1C, 0x78

	.global gUnknown_08A02A94
gUnknown_08A02A94:  @ 0x08A02A94
	.incbin "baserom.gba", 0xA02A94, 0xA8

	.global gUnknown_08A02B3C
gUnknown_08A02B3C:  @ 0x08A02B3C
	.incbin "baserom.gba", 0xA02B3C, 0x70

	.global gUnknown_08A02BAC
gUnknown_08A02BAC:  @ 0x08A02BAC
	.incbin "baserom.gba", 0xA02BAC, 0x88

	.global gUnknown_08A02C34
gUnknown_08A02C34:  @ 0x08A02C34
	.incbin "baserom.gba", 0xA02C34, 0x280

	.global gUnknown_08A02EB4
gUnknown_08A02EB4:  @ 0x08A02EB4
    .incbin "baserom.gba", 0xA02EB4, 0x80

	.global gUnknown_08A02F34
gUnknown_08A02F34:  @ 0x08A02F34
	.incbin "baserom.gba", 0xA02F34, 0x60

	.global gUnknown_08A02F94
gUnknown_08A02F94:  @ 0x08A02F94
	.incbin "baserom.gba", 0xA02F94, 0x60

	.global gUnknown_08A02FF4
gUnknown_08A02FF4:  @ 0x08A02FF4
	.incbin "baserom.gba", 0xA02FF4, 0x60

	.global gUnknown_08A03054
gUnknown_08A03054:  @ 0x08A03054
	.incbin "baserom.gba", 0xA03054, 0x238

	.global gUnknown_08A0328C
gUnknown_08A0328C:  @ 0x08A0328C
	.incbin "baserom.gba", 0xA0328C, 0x20

	.global gUnknown_08A032AC
gUnknown_08A032AC:  @ 0x08A032AC
	.incbin "baserom.gba", 0xA032AC, 0x88

	.global gUnknown_08A03334
gUnknown_08A03334:  @ 0x08A03334
	.incbin "baserom.gba", 0xA03334, 0x20

	.global gUnknown_08A03354
gUnknown_08A03354:  @ 0x08A03354
	.incbin "baserom.gba", 0xA03354, 0x14

	.global gUnknown_08A03368
gUnknown_08A03368:  @ 0x08A03368
	.incbin "baserom.gba", 0xA03368, 0x2BA8

	.global gUnknown_08A05F10
gUnknown_08A05F10:  @ 0x08A05F10
	.incbin "baserom.gba", 0xA05F10, 0x550

	.global gUnknown_08A06460
gUnknown_08A06460:  @ 0x08A06460
	.incbin "baserom.gba", 0xA06460, 0x80

	.global gUnknown_08A064E0
gUnknown_08A064E0:  @ 0x08A064E0
	.incbin "baserom.gba", 0xA064E0, 0xD1C

	.global gUnknown_08A071FC
gUnknown_08A071FC:  @ 0x08A071FC
	.incbin "baserom.gba", 0xA071FC, 0x120

	.global gUnknown_08A0731C
gUnknown_08A0731C:  @ 0x08A0731C
    .incbin "baserom.gba", 0xA0731C, 0x20

	.global gUnknown_08A0733C
gUnknown_08A0733C:  @ 0x08A0733C
	.incbin "baserom.gba", 0xA0733C, 0x210

	.global gUnknown_08A0754C
gUnknown_08A0754C:  @ 0x08A0754C
	.incbin "baserom.gba", 0xA0754C, 0x468

	.global gUnknown_08A079B4
gUnknown_08A079B4:  @ 0x08A079B4
	.incbin "baserom.gba", 0xA079B4, 0xE4

	.global gUnknown_08A07A98
gUnknown_08A07A98:  @ 0x08A07A98
	.incbin "baserom.gba", 0xA07A98, 0x40

	.global gUnknown_08A07AD8
gUnknown_08A07AD8:  @ 0x08A07AD8
	.incbin "baserom.gba", 0xA07AD8, 0x12

	.global gUnknown_08A07AEA
gUnknown_08A07AEA:  @ 0x08A07AEA
	.incbin "baserom.gba", 0xA07AEA, 0x20

	.global gUnknown_08A07B0A
gUnknown_08A07B0A:  @ 0x08A07B0A
	.incbin "baserom.gba", 0xA07B0A, 0xE0

	.global gUnknown_08A07BEA
gUnknown_08A07BEA:  @ 0x08A07BEA
	.incbin "baserom.gba", 0xA07BEA, 0x20

	.global gUnknown_08A07C0A
gUnknown_08A07C0A:  @ 0x08A07C0A
	.incbin "baserom.gba", 0xA07C0A, 0x4E

	.global gUnknown_08A07C58
gUnknown_08A07C58:  @ 0x08A07C58
	.incbin "baserom.gba", 0xA07C58, 0x180

	.global gUnknown_08A07DD8
gUnknown_08A07DD8:  @ 0x08A07DD8
	.incbin "baserom.gba", 0xA07DD8, 0x1C84

	.global gUnknown_08A09A5C
gUnknown_08A09A5C:  @ 0x08A09A5C
	.incbin "baserom.gba", 0xA09A5C, 0x3F0

	.global gUnknown_08A09E4C
gUnknown_08A09E4C:  @ 0x08A09E4C
	.incbin "baserom.gba", 0xA09E4C, 0x69C

	.global gUnknown_08A0A4E8
gUnknown_08A0A4E8:  @ 0x08A0A4E8
    .incbin "baserom.gba", 0xA0A4E8, 0x510

	.global gUnknown_08A0A9F8
gUnknown_08A0A9F8:  @ 0x08A0A9F8
	.incbin "baserom.gba", 0xA0A9F8, 0x114

	.global gUnknown_08A0AB0C
gUnknown_08A0AB0C:  @ 0x08A0AB0C
	.incbin "baserom.gba", 0xA0AB0C, 0x338

	.global gUnknown_08A0AE44
gUnknown_08A0AE44:  @ 0x08A0AE44
    .incbin "baserom.gba", 0xA0AE44, 0x20

	.global gUnknown_08A0AE64
gUnknown_08A0AE64:  @ 0x08A0AE64
	.incbin "baserom.gba", 0xA0AE64, 0x20

	.global gUnknown_08A0AE84
gUnknown_08A0AE84:  @ 0x08A0AE84
	.incbin "baserom.gba", 0xA0AE84, 0x44
