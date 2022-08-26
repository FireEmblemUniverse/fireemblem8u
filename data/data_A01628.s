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
@ replacing .incbin "baserom.gba", 0x00a0186c, 0x18
.4byte gUnknown_08A17484 + 0x130
.4byte gUnknown_08A17484 + 0x130
.4byte gUnknown_08A17484 + 0x130
.4byte gUnknown_08A17484 + 0x144
.4byte gUnknown_08A17484 + 0x158
.4byte gUnknown_08A17484 + 0x16c

	.global gUnknown_08A01884
gUnknown_08A01884:  @ 0x08A01884
@ replacing .incbin "baserom.gba", 0x00a01884, 0x18
.4byte gUnknown_08A17604 + 0x38
.4byte gUnknown_08A17604 + 0x4c
.4byte gUnknown_08A17604 + 0x60
.4byte gUnknown_08A17604 + 0x74
.4byte gUnknown_08A17604 + 0x74
.4byte gUnknown_08A17604 + 0x74

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
