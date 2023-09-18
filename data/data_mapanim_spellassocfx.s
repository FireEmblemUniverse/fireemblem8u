    .section .data

	.global gUnknown_089A4034
gUnknown_089A4034:  @ 0x089A4034
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_807F58C
        @ PROC_SLEEP
        .short 0xe, 0xf
        .word 0x0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_089A404C
gUnknown_089A404C:  @ 0x089A404C
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_807F5EC
        @ PROC_SLEEP
        .short 0xe, 0x10
        .word 0x0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_089A4064
gUnknown_089A4064:  @ 0x089A4064
        @ PROC_CALL
        .short 0x2, 0x0
        .word BG0Shaker_Init
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word BG0Shaker_Loop
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_089A407C
gUnknown_089A407C:  @ 0x089A407C
        @ PROC_CALL
        .short 0x2, 0x0
        .word LockGame
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_807F758
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_807F788
        @ PROC_CALL
        .short 0x2, 0x0
        .word UnlockGame
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_089A40AC
gUnknown_089A40AC:  @ 0x089A40AC
@ replacing .incbin "baserom.gba", 0x009a40ac, 0x4
.4byte Pal_089B80C4 + 0x2fc

	.global gUnknown_089A40B0
gUnknown_089A40B0:  @ 0x089A40B0
@ replacing .incbin "baserom.gba", 0x009a40b0, 0xec
.4byte Pal_089B80C4 + 0x1a314
.4byte Pal_089B80C4 + 0x1aa14
.4byte Pal_089B80C4 + 0x900
.4byte Pal_089B80C4 + 0x1a334
.4byte Pal_089B80C4 + 0x1ab6c
.4byte Pal_089B80C4 + 0x1014
.4byte Pal_089B80C4 + 0x1a354
.4byte Pal_089B80C4 + 0x1acfc
.4byte Pal_089B80C4 + 0x1818
.4byte Pal_089B80C4 + 0x1a374
.4byte Pal_089B80C4 + 0x1aeb4
.4byte Pal_089B80C4 + 0x20cc
.4byte Pal_089B80C4 + 0x1a394
.4byte Pal_089B80C4 + 0x1b06c
.4byte Pal_089B80C4 + 0x2914
.4byte Pal_089B80C4 + 0x1a3b4
.4byte Pal_089B80C4 + 0x1b214
.4byte Pal_089B80C4 + 0x3204
.4byte Pal_089B80C4 + 0x1a3d4
.4byte Pal_089B80C4 + 0x1b3dc
.4byte Pal_089B80C4 + 0x3ca4
.4byte Pal_089B80C4 + 0x1a3f4
.4byte Pal_089B80C4 + 0x1b5ec
.4byte Pal_089B80C4 + 0x47c0
.4byte Pal_089B80C4 + 0x1a414
.4byte Pal_089B80C4 + 0x1b808
.4byte Pal_089B80C4 + 0x52f0
.4byte Pal_089B80C4 + 0x1a434
.4byte Pal_089B80C4 + 0x1ba10
.4byte Pal_089B80C4 + 0x5e24
.4byte Pal_089B80C4 + 0x1a454
.4byte Pal_089B80C4 + 0x1bc34
.4byte Pal_089B80C4 + 0x69cc
.4byte Pal_089B80C4 + 0x1a474
.4byte Pal_089B80C4 + 0x1be5c
.4byte Pal_089B80C4 + 0x7538
.4byte Pal_089B80C4 + 0x1a494
.4byte Pal_089B80C4 + 0x1c08c
.4byte Pal_089B80C4 + 0x7ea0
.4byte Pal_089B80C4 + 0x1a4b4
.4byte Pal_089B80C4 + 0x1c268
.4byte Pal_089B80C4 + 0x87fc
.4byte Pal_089B80C4 + 0x1a4d4
.4byte Pal_089B80C4 + 0x1c43c
.4byte Pal_089B80C4 + 0x90cc
.4byte Pal_089B80C4 + 0x1a4f4
.4byte Pal_089B80C4 + 0x1c600
.4byte Pal_089B80C4 + 0x9ae4
.4byte Pal_089B80C4 + 0x1a514
.4byte Pal_089B80C4 + 0x1c7e8
.4byte Pal_089B80C4 + 0xa3b8
.4byte Pal_089B80C4 + 0x1a534
.4byte Pal_089B80C4 + 0x1c99c
.4byte Pal_089B80C4 + 0xab2c
.4byte Pal_089B80C4 + 0x1a554
.4byte Pal_089B80C4 + 0x1cb38
.4byte Pal_089B80C4 + 0xb1e0
.4byte Pal_089B80C4 + 0x1a574
.4byte Pal_089B80C4 + 0x1ccb0

	.global gUnknown_089A419C
gUnknown_089A419C:  @ 0x089A419C
@ replacing .incbin "baserom.gba", 0x009a419c, 0x120
.4byte Pal_089B80C4 + 0xb8e4
.4byte Pal_089B80C4 + 0x1a594
.4byte Pal_089B80C4 + 0x1ce08
.4byte Pal_089B80C4 + 0xbe24
.4byte Pal_089B80C4 + 0x1a5b4
.4byte Pal_089B80C4 + 0x1cf18
.4byte Pal_089B80C4 + 0xc3b8
.4byte Pal_089B80C4 + 0x1a5d4
.4byte Pal_089B80C4 + 0x1d03c
.4byte Pal_089B80C4 + 0xc770
.4byte Pal_089B80C4 + 0x1a5f4
.4byte Pal_089B80C4 + 0x1d150
.4byte Pal_089B80C4 + 0xc81c
.4byte Pal_089B80C4 + 0x1a614
.4byte Pal_089B80C4 + 0x1d20c
.4byte Pal_089B80C4 + 0xc898
.4byte Pal_089B80C4 + 0x1a634
.4byte Pal_089B80C4 + 0x1d2c8
.4byte Pal_089B80C4 + 0xc908
.4byte Pal_089B80C4 + 0x1a654
.4byte Pal_089B80C4 + 0x1d37c
.4byte Pal_089B80C4 + 0xcd74
.4byte Pal_089B80C4 + 0x1a674
.4byte Pal_089B80C4 + 0x1d47c
.4byte Pal_089B80C4 + 0xd264
.4byte Pal_089B80C4 + 0x1a694
.4byte Pal_089B80C4 + 0x1d594
.4byte Pal_089B80C4 + 0xd5b0
.4byte Pal_089B80C4 + 0x1a6b4
.4byte Pal_089B80C4 + 0x1d6a0
.4byte Pal_089B80C4 + 0xd670
.4byte Pal_089B80C4 + 0x1a6d4
.4byte Pal_089B80C4 + 0x1d75c
.4byte Pal_089B80C4 + 0xd714
.4byte Pal_089B80C4 + 0x1a6f4
.4byte Pal_089B80C4 + 0x1d81c
.4byte Pal_089B80C4 + 0xdeac
.4byte Pal_089B80C4 + 0x1a714
.4byte Pal_089B80C4 + 0x1d95c
.4byte Pal_089B80C4 + 0xe528
.4byte Pal_089B80C4 + 0x1a734
.4byte Pal_089B80C4 + 0x1da94
.4byte Pal_089B80C4 + 0xe994
.4byte Pal_089B80C4 + 0x1a754
.4byte Pal_089B80C4 + 0x1dbcc
.4byte Pal_089B80C4 + 0xea5c
.4byte Pal_089B80C4 + 0x1a774
.4byte Pal_089B80C4 + 0x1dc88
.4byte Pal_089B80C4 + 0xf1b8
.4byte Pal_089B80C4 + 0x1a794
.4byte Pal_089B80C4 + 0x1ddd8
.4byte Pal_089B80C4 + 0xf968
.4byte Pal_089B80C4 + 0x1a7b4
.4byte Pal_089B80C4 + 0x1df2c
.4byte Pal_089B80C4 + 0x1037c
.4byte Pal_089B80C4 + 0x1a7d4
.4byte Pal_089B80C4 + 0x1e0ac
.4byte Pal_089B80C4 + 0x10d00
.4byte Pal_089B80C4 + 0x1a7f4
.4byte Pal_089B80C4 + 0x1e234
.4byte Pal_089B80C4 + 0x11980
.4byte Pal_089B80C4 + 0x1a814
.4byte Pal_089B80C4 + 0x1e428
.4byte Pal_089B80C4 + 0x12380
.4byte Pal_089B80C4 + 0x1a834
.4byte Pal_089B80C4 + 0x1e60c
.4byte Pal_089B80C4 + 0x1294c
.4byte Pal_089B80C4 + 0x1a854
.4byte Pal_089B80C4 + 0x1e730
.4byte Pal_089B80C4 + 0x136ec
.4byte Pal_089B80C4 + 0x1a874
.4byte Pal_089B80C4 + 0x1e9e0

	.global gUnknown_089A42BC
gUnknown_089A42BC:  @ 0x089A42BC
@ replacing .incbin "baserom.gba", 0x009a42bc, 0x90
.4byte Pal_089B80C4 + 0x14964
.4byte Pal_089B80C4 + 0x1a894
.4byte Pal_089B80C4 + 0x1ed58
.4byte Pal_089B80C4 + 0x14dc8
.4byte Pal_089B80C4 + 0x1a8b4
.4byte Pal_089B80C4 + 0x1ee48
.4byte Pal_089B80C4 + 0x1558c
.4byte Pal_089B80C4 + 0x1a8d4
.4byte Pal_089B80C4 + 0x1ef88
.4byte Pal_089B80C4 + 0x15f74
.4byte Pal_089B80C4 + 0x1a8f4
.4byte Pal_089B80C4 + 0x1f118
.4byte Pal_089B80C4 + 0x16ad0
.4byte Pal_089B80C4 + 0x1a914
.4byte Pal_089B80C4 + 0x1f2f0
.4byte Pal_089B80C4 + 0x176fc
.4byte Pal_089B80C4 + 0x1a934
.4byte Pal_089B80C4 + 0x1f4f8
.4byte Pal_089B80C4 + 0x182c8
.4byte Pal_089B80C4 + 0x1a954
.4byte Pal_089B80C4 + 0x1f708
.4byte Pal_089B80C4 + 0x18d44
.4byte Pal_089B80C4 + 0x1a974
.4byte Pal_089B80C4 + 0x1f8f0
.4byte Pal_089B80C4 + 0x19584
.4byte Pal_089B80C4 + 0x1a994
.4byte Pal_089B80C4 + 0x1fab4
.4byte Pal_089B80C4 + 0x19be0
.4byte Pal_089B80C4 + 0x1a9b4
.4byte Pal_089B80C4 + 0x1fc40
.4byte Pal_089B80C4 + 0x1a01c
.4byte Pal_089B80C4 + 0x1a9d4
.4byte Pal_089B80C4 + 0x1fd84
.4byte Pal_089B80C4 + 0x1a248
.4byte Pal_089B80C4 + 0x1a9f4
.4byte Pal_089B80C4 + 0x1fe84

	.global gUnknown_089A434C
gUnknown_089A434C:  @ 0x089A434C
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_807F89C
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_807F964
        @ PROC_SLEEP
        .short 0xe, 0x1e
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_807FAA0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_807FBCC
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_807FC58
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_807FCA8
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_089A4394
gUnknown_089A4394:  @ 0x089A4394
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_807FCE4
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_807FDC8
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_807FE0C
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_807FFF0
        @ PROC_SLEEP
        .short 0xe, 0x3c
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_807DA2C
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_089A43D4
gUnknown_089A43D4:  @ 0x089A43D4
@ replacing .incbin "baserom.gba", 0x009a43d4, 0x4
.4byte Pal_089B80C4 + 0x1ff4c

	.global gUnknown_089A43D8
gUnknown_089A43D8:  @ 0x089A43D8
@ replacing .incbin "baserom.gba", 0x009a43d8, 0x5c
.4byte Pal_089B80C4 + 0x24c84
.4byte Pal_089B80C4 + 0x24d84
.4byte Pal_089B80C4 + 0x200d4
.4byte Pal_089B80C4 + 0x24ca4
.4byte Pal_089B80C4 + 0x24e4c
.4byte Pal_089B80C4 + 0x203e4
.4byte Pal_089B80C4 + 0x24cc4
.4byte Pal_089B80C4 + 0x24f38
.4byte Pal_089B80C4 + 0x2084c
.4byte Pal_089B80C4 + 0x24ce4
.4byte Pal_089B80C4 + 0x25050
.4byte Pal_089B80C4 + 0x21198
.4byte Pal_089B80C4 + 0x24d04
.4byte Pal_089B80C4 + 0x251c0
.4byte Pal_089B80C4 + 0x22348
.4byte Pal_089B80C4 + 0x24d24
.4byte Pal_089B80C4 + 0x25424
.4byte Pal_089B80C4 + 0x230dc
.4byte Pal_089B80C4 + 0x24d44
.4byte Pal_089B80C4 + 0x256cc
.4byte Pal_089B80C4 + 0x23f1c
.4byte Pal_089B80C4 + 0x24d64
.4byte Pal_089B80C4 + 0x259a4

	.global gUnknown_089A4434
gUnknown_089A4434:  @ 0x089A4434
        @ PROC_SET_END_CB
        .short 0x4, 0x0
        .word sub_8080038
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8080050
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8080138
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8080288
        @ PROC_SLEEP
        .short 0xe, 0x1e
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_808038C
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80803D8
        @ PROC_SLEEP
        .short 0xe, 0x3c
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_807DA2C
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_089A448C
gUnknown_089A448C:  @ 0x089A448C
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_808044C
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_089A44A4
gUnknown_089A44A4:  @ 0x089A44A4
@ replacing .incbin "baserom.gba", 0x009a44a4, 0x138
.4byte Pal_089B80C4 + 0x25dc8
.4byte Pal_089B80C4 + 0x2cbb8
.4byte Pal_089B80C4 + 0x2cef8
.4byte Pal_089B80C4 + 0x25e4c
.4byte Pal_089B80C4 + 0x2cbd8
.4byte Pal_089B80C4 + 0x2cfb0
.4byte Pal_089B80C4 + 0x25ed8
.4byte Pal_089B80C4 + 0x2cbf8
.4byte Pal_089B80C4 + 0x2d06c
.4byte Pal_089B80C4 + 0x25f6c
.4byte Pal_089B80C4 + 0x2cc18
.4byte Pal_089B80C4 + 0x2d128
.4byte Pal_089B80C4 + 0x25ff8
.4byte Pal_089B80C4 + 0x2cc38
.4byte Pal_089B80C4 + 0x2d1e8
.4byte Pal_089B80C4 + 0x26088
.4byte Pal_089B80C4 + 0x2cc58
.4byte Pal_089B80C4 + 0x2d2a0
.4byte Pal_089B80C4 + 0x26108
.4byte Pal_089B80C4 + 0x2cc78
.4byte Pal_089B80C4 + 0x2d358
.4byte Pal_089B80C4 + 0x2696c
.4byte Pal_089B80C4 + 0x2cc98
.4byte Pal_089B80C4 + 0x2d53c
.4byte Pal_089B80C4 + 0x273ac
.4byte Pal_089B80C4 + 0x2ccb8
.4byte Pal_089B80C4 + 0x2d750
.4byte Pal_089B80C4 + 0x27ecc
.4byte Pal_089B80C4 + 0x2ccd8
.4byte Pal_089B80C4 + 0x2d994
.4byte Pal_089B80C4 + 0x289f4
.4byte Pal_089B80C4 + 0x2ccf8
.4byte Pal_089B80C4 + 0x2dc44
.4byte Pal_089B80C4 + 0x293bc
.4byte Pal_089B80C4 + 0x2cd18
.4byte Pal_089B80C4 + 0x2df28
.4byte Pal_089B80C4 + 0x2a090
.4byte Pal_089B80C4 + 0x2cd38
.4byte Pal_089B80C4 + 0x2e1cc
.4byte Pal_089B80C4 + 0x2ab58
.4byte Pal_089B80C4 + 0x2cd58
.4byte Pal_089B80C4 + 0x2e40c
.4byte Pal_089B80C4 + 0x2b3e4
.4byte Pal_089B80C4 + 0x2cd78
.4byte Pal_089B80C4 + 0x2e5dc
.4byte Pal_089B80C4 + 0x2bac4
.4byte Pal_089B80C4 + 0x2cd98
.4byte Pal_089B80C4 + 0x2e744
.4byte Pal_089B80C4 + 0x2bf60
.4byte Pal_089B80C4 + 0x2cdb8
.4byte Pal_089B80C4 + 0x2e860
.4byte Pal_089B80C4 + 0x2c280
.4byte Pal_089B80C4 + 0x2cdd8
.4byte Pal_089B80C4 + 0x2e950
.4byte Pal_089B80C4 + 0x2c3f4
.4byte Pal_089B80C4 + 0x2cdf8
.4byte Pal_089B80C4 + 0x2ea20
.4byte Pal_089B80C4 + 0x2c50c
.4byte Pal_089B80C4 + 0x2ce18
.4byte Pal_089B80C4 + 0x2eaec
.4byte Pal_089B80C4 + 0x2c624
.4byte Pal_089B80C4 + 0x2ce38
.4byte Pal_089B80C4 + 0x2ebbc
.4byte Pal_089B80C4 + 0x2c708
.4byte Pal_089B80C4 + 0x2ce58
.4byte Pal_089B80C4 + 0x2ec8c
.4byte Pal_089B80C4 + 0x2c7fc
.4byte Pal_089B80C4 + 0x2ce78
.4byte Pal_089B80C4 + 0x2ed58
.4byte Pal_089B80C4 + 0x2c914
.4byte Pal_089B80C4 + 0x2ce98
.4byte Pal_089B80C4 + 0x2ee24
.4byte Pal_089B80C4 + 0x2ca28
.4byte Pal_089B80C4 + 0x2ceb8
.4byte Pal_089B80C4 + 0x2eef0
.4byte Pal_089B80C4 + 0x2cb04
.4byte Pal_089B80C4 + 0x2ced8
.4byte Pal_089B80C4 + 0x2efbc

	.global gUnknown_089A45DC
gUnknown_089A45DC:  @ 0x089A45DC
        @ PROC_SET_END_CB
        .short 0x4, 0x0
        .word sub_8080654
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8080660
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8080730
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80807C8
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8080890
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8080900
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80809D8
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8080B18
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8080B84
        @ PROC_SLEEP
        .short 0xe, 0x3c
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_807DA2C
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_089A4644
gUnknown_089A4644:  @ 0x089A4644
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8080BA8
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8080BD8
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_089A4664
gUnknown_089A4664:  @ 0x089A4664
@ replacing .incbin "baserom.gba", 0x009a4664, 0x48
.4byte gUnknown_089E7DEC + 0x20
.4byte gUnknown_089E7DEC + 0x40
.4byte gUnknown_089E7DEC + 0x64
.4byte gUnknown_089E7DEC + 0x8c
.4byte gUnknown_089E7DEC + 0xb4
.4byte gUnknown_089E7DEC + 0xe0
.4byte gUnknown_089E7DEC + 0x110
.4byte gUnknown_089E7DEC + 0x140
.4byte gUnknown_089E7DEC + 0x170
.4byte gUnknown_089E7DEC + 0x1a0
.4byte gUnknown_089E7DEC + 0x1d0
.4byte gUnknown_089E7DEC + 0x210
.4byte gUnknown_089E7DEC + 0x254
.4byte gUnknown_089E7DEC + 0x2a4
.4byte gUnknown_089E7DEC + 0x300
.4byte gUnknown_089E7DEC + 0x35c
.4byte gUnknown_089E7DEC + 0x3b8
.4byte gUnknown_089E7DEC + 0x414

	.global gUnknown_089A46AC
gUnknown_089A46AC:  @ 0x089A46AC
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8080D6C
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8080DCC
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8080E84
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_807DA2C
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_089A46DC
gUnknown_089A46DC:  @ 0x089A46DC
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8080EE4
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8080F44
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8081008
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_807DA2C
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_089A470C
gUnknown_089A470C:  @ 0x089A470C
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_SET_END_CB
        .short 0x4, 0x0
        .word sub_80811AC
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8081078
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8081100
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_089A4734
gUnknown_089A4734:  @ 0x089A4734
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80811EC
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8081208
        @ PROC_CALL
        .short 0x2, 0x0
        .word nullsub_58
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_807DA2C
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0
