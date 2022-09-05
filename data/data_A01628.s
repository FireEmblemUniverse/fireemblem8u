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
