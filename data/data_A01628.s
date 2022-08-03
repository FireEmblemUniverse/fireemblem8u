    .section .data

	.global gUnknown_08A01628
gUnknown_08A01628:  @ 0x08A01628
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8089E58
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0

	.global gUnknown_08A01638
gUnknown_08A01638:  @ 0x08A01638
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8089EEC
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0

	.global gUnknown_08A01650
gUnknown_08A01650:  @ 0x08A01650
        @ PROC_SLEEP
        .short 0xe, 0x6
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8089F58
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8089FCC
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_808A00C
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08A01678
gUnknown_08A01678:  @ 0x08A01678
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_808A160
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_808A188
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_808A1B8
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08A01698
gUnknown_08A01698:  @ 0x08A01698
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_808A2FC
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_808A320
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_808A2D0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08A016C8
gUnknown_08A016C8:  @ 0x08A016C8
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_808A4A4
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08A016D8
gUnknown_08A016D8:  @ 0x08A016D8
	.incbin "baserom.gba", 0xA016D8, 0x8

	.global gUnknown_08A016E0
gUnknown_08A016E0:  @ 0x08A016E0
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_808A848
        @ PROC_LABEL
        .short 0xb, 0x0
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_808A87C
        @ PROC_LABEL
        .short 0xb, 0x1
        .word 0x0
        @ PROC_BLOCK
        .short 0x10, 0x0
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x3
        .word 0x0
        @ PROC_SLEEP
        .short 0xe, 0x6
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x2
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_808A8AC
        @ PROC_SLEEP
        .short 0xe, 0xa
        .word 0x0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08A01740
gUnknown_08A01740:  @ 0x08A01740
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_808A974
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_808A99C
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_808A9C0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08A01760
gUnknown_08A01760:  @ 0x08A01760
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_808B09C
        @ PROC_LABEL
        .short 0xb, 0x0
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_808B178
        @ PROC_GOTO
        .short 0xc, 0x2
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x1
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_808B788
        @ PROC_LABEL
        .short 0xb, 0x4
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_808B7B8
        @ PROC_GOTO
        .short 0xc, 0x0
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x5
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_808B7B8
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_808B804
        @ PROC_GOTO
        .short 0xc, 0x0
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x6
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_808B870
        @ PROC_GOTO
        .short 0xc, 0x0
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x2
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_808B844
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08A01800
gUnknown_08A01800:  @ 0x08A01800
        @ PROC_SLEEP
        .short 0xe, 0x6
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_808B928
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08A01818
gUnknown_08A01818:  @ 0x08A01818
	.incbin "baserom.gba", 0xA01818, 0x10

	.global gUnknown_08A01828
gUnknown_08A01828:  @ 0x08A01828
	.incbin "baserom.gba", 0xA01828, 0x20

	.global gUnknown_08A01848
gUnknown_08A01848:  @ 0x08A01848
	.incbin "baserom.gba", 0xA01848, 0x6

	.global gUnknown_08A0184E
gUnknown_08A0184E:  @ 0x08A0184E
	.incbin "baserom.gba", 0xA0184E, 0x12

	.global gUnknown_08A01860
gUnknown_08A01860:  @ 0x08A01860
	.incbin "baserom.gba", 0xA01860, 0x6

	.global gUnknown_08A01866
gUnknown_08A01866:  @ 0x08A01866
	.incbin "baserom.gba", 0xA01866, 0x6

	.global gUnknown_08A0186C
gUnknown_08A0186C:  @ 0x08A0186C
	.incbin "baserom.gba", 0xA0186C, 0x18

	.global gUnknown_08A01884
gUnknown_08A01884:  @ 0x08A01884
	.incbin "baserom.gba", 0xA01884, 0x18

	.global gUnknown_08A0189C
gUnknown_08A0189C:  @ 0x08A0189C
	.incbin "baserom.gba", 0xA0189C, 0x4

	.global gUnknown_08A018A0
gUnknown_08A018A0:  @ 0x08A018A0
	.incbin "baserom.gba", 0xA018A0, 0x3

	.global gUnknown_08A018A3
gUnknown_08A018A3:  @ 0x08A018A3
	.incbin "baserom.gba", 0xA018A3, 0x3

	.global gUnknown_08A018A6
gUnknown_08A018A6:  @ 0x08A018A6
	.incbin "baserom.gba", 0xA018A6, 0x6

	.global gUnknown_08A018AC
gUnknown_08A018AC:  @ 0x08A018AC
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x8205b64
        @ PROC_15
        .short 0x15, 0x0
        .word 0x0
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_808CB34
        @ PROC_LABEL
        .short 0xb, 0x0
        .word 0x0
        @ PROC_WHILE_EXISTS
        .short 0x8, 0x0
        .word gUnknown_0859A548
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_808CB5C
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_808BFD4
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_808CC00
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_808C100
        @ PROC_GOTO
        .short 0xc, 0x0
        .word 0x0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08A0190C
gUnknown_08A0190C:  @ 0x08A0190C
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x8205b68
        @ PROC_15
        .short 0x15, 0x0
        .word 0x0
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_808CCA0
        @ PROC_LABEL
        .short 0xb, 0x0
        .word 0x0
        @ PROC_WHILE_EXISTS
        .short 0x8, 0x0
        .word gUnknown_0859A548
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word Loop6CUI1_Hidden
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word Loop6CUI1_DisplayTransition
        @ PROC_LABEL
        .short 0xb, 0x2
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word Loop6CUI1_Displayed
        @ PROC_LABEL
        .short 0xb, 0x3
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word Loop6CUI1_HideTransition
        @ PROC_GOTO
        .short 0xc, 0x0
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_808CE50
        @ PROC_GOTO
        .short 0xc, 0x2
        .word 0x0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08A01994
gUnknown_08A01994:  @ 0x08A01994
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x8205b6c
        @ PROC_15
        .short 0x15, 0x0
        .word 0x0
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word Init6CUI2
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word Loop6CUI2
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08A019C4
gUnknown_08A019C4:  @ 0x08A019C4
        @ PROC_WHILE
        .short 0x14, 0x0
        .word DoesBMXFADEExist
        @ PROC_CALL
        .short 0x2, 0x0
        .word InitPlayerPhaseInterfaceMaybe
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08A019DC
gUnknown_08A019DC:  @ 0x08A019DC
	.incbin "baserom.gba", 0xA019DC, 0x5

	.global gUnknown_08A019E1
gUnknown_08A019E1:  @ 0x08A019E1
	.incbin "baserom.gba", 0xA019E1, 0x3

	.global gUnknown_08A019E4
gUnknown_08A019E4:  @ 0x08A019E4
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x8205b70
        @ PROC_15
        .short 0x15, 0x0
        .word 0x0
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word Init6CPI
        @ PROC_LABEL
        .short 0xb, 0x0
        .word 0x0
        @ PROC_WHILE_EXISTS
        .short 0x8, 0x0
        .word gUnknown_0859A548
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word Loop16CPI
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word Loop26CPI
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word Loop36CPI
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word Loop46CPI
        @ PROC_GOTO
        .short 0xc, 0x0
        .word 0x0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08A01A44
gUnknown_08A01A44:  @ 0x08A01A44
        @ PROC_15
        .short 0x15, 0x0
        .word 0x0
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_808D870
        @ PROC_LABEL
        .short 0xb, 0x0
        .word 0x0
        @ PROC_WHILE_EXISTS
        .short 0x8, 0x0
        .word gUnknown_0859A548
        @ PROC_WHILE
        .short 0x14, 0x0
        .word sub_808D814
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_808D97C
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_808D9B8
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_808D9FC
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_808DAA0
        @ PROC_GOTO
        .short 0xc, 0x0
        .word 0x0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08A01AA4
gUnknown_08A01AA4:  @ 0x08A01AA4
	.incbin "baserom.gba", 0xA01AA4, 0x8

	.global gUnknown_08A01AAC
gUnknown_08A01AAC:  @ 0x08A01AAC
	.incbin "baserom.gba", 0xA01AAC, 0xE

	.global gUnknown_08A01ABA
gUnknown_08A01ABA:  @ 0x08A01ABA
	.incbin "baserom.gba", 0xA01ABA, 0xE

	.global gUnknown_08A01AC8
gUnknown_08A01AC8:  @ 0x08A01AC8
	.incbin "baserom.gba", 0xA01AC8, 0xE

	.global gUnknown_08A01AD6
gUnknown_08A01AD6:  @ 0x08A01AD6
	.incbin "baserom.gba", 0xA01AD6, 0x8

	.global gUnknown_08A01ADE
gUnknown_08A01ADE:  @ 0x08A01ADE
	.incbin "baserom.gba", 0xA01ADE, 0x8

	.global gUnknown_08A01AE6
gUnknown_08A01AE6:  @ 0x08A01AE6
	.incbin "baserom.gba", 0xA01AE6, 0x32

	.global gUnknown_08A01B18
gUnknown_08A01B18:  @ 0x08A01B18
	.incbin "baserom.gba", 0xA01B18, 0x14

	.global gUnknown_08A01B2C
gUnknown_08A01B2C:  @ 0x08A01B2C
	.incbin "baserom.gba", 0xA01B2C, 0x10

	.global gUnknown_08A01B3C
gUnknown_08A01B3C:  @ 0x08A01B3C
	.incbin "baserom.gba", 0xA01B3C, 0x18

	.global gUnknown_08A01B54
gUnknown_08A01B54:  @ 0x08A01B54
        @ PROC_CALL
        .short 0x2, 0x0
        .word AddSkipThread2
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8013D80
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word ContinueUntilSomeTransistion6CExists
        @ PROC_CALL
        .short 0x2, 0x0
        .word BMapDispSuspend
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_808DF24
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_808E4AC
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_808E3D4
        @ PROC_LABEL
        .short 0xb, 0x0
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_808E608
        @ PROC_LABEL
        .short 0xb, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8013F58
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word EndBG3Slider
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_808E71C
        @ PROC_CALL
        .short 0x2, 0x0
        .word BMapDispResume
        @ PROC_CALL
        .short 0x2, 0x0
        .word RefreshBMapGraphics
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8013DA4
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word ContinueUntilSomeTransistion6CExists
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_808E748
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word SubSkipThread2
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08A01C04
gUnknown_08A01C04:  @ 0x08A01C04
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_808DF24
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_808E4AC
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_808E3D4
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8013FD8
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_LABEL
        .short 0xb, 0x0
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_808E608
        @ PROC_LABEL
        .short 0xb, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8013F58
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word EndBG3Slider
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_808E71C
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08A01C7C
gUnknown_08A01C7C:  @ 0x08A01C7C
	.incbin "baserom.gba", 0xA01C7C, 0x28

	.global gUnknown_08A01CA4
gUnknown_08A01CA4:  @ 0x08A01CA4
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_808E7B4
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_808E818
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0
	.incbin "baserom.gba", 0xA01CC4, 0x54

	.global gUnknown_08A01D18
gUnknown_08A01D18:  @ 0x08A01D18
	.incbin "baserom.gba", 0xA01D18, 0x70

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
