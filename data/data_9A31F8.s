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
.4byte gUnknown_089B80C4 + 0x2fc

	.global gUnknown_089A40B0
gUnknown_089A40B0:  @ 0x089A40B0
@ replacing .incbin "baserom.gba", 0x009a40b0, 0xec
.4byte gUnknown_089B80C4 + 0x1a314
.4byte gUnknown_089B80C4 + 0x1aa14
.4byte gUnknown_089B80C4 + 0x900
.4byte gUnknown_089B80C4 + 0x1a334
.4byte gUnknown_089B80C4 + 0x1ab6c
.4byte gUnknown_089B80C4 + 0x1014
.4byte gUnknown_089B80C4 + 0x1a354
.4byte gUnknown_089B80C4 + 0x1acfc
.4byte gUnknown_089B80C4 + 0x1818
.4byte gUnknown_089B80C4 + 0x1a374
.4byte gUnknown_089B80C4 + 0x1aeb4
.4byte gUnknown_089B80C4 + 0x20cc
.4byte gUnknown_089B80C4 + 0x1a394
.4byte gUnknown_089B80C4 + 0x1b06c
.4byte gUnknown_089B80C4 + 0x2914
.4byte gUnknown_089B80C4 + 0x1a3b4
.4byte gUnknown_089B80C4 + 0x1b214
.4byte gUnknown_089B80C4 + 0x3204
.4byte gUnknown_089B80C4 + 0x1a3d4
.4byte gUnknown_089B80C4 + 0x1b3dc
.4byte gUnknown_089B80C4 + 0x3ca4
.4byte gUnknown_089B80C4 + 0x1a3f4
.4byte gUnknown_089B80C4 + 0x1b5ec
.4byte gUnknown_089B80C4 + 0x47c0
.4byte gUnknown_089B80C4 + 0x1a414
.4byte gUnknown_089B80C4 + 0x1b808
.4byte gUnknown_089B80C4 + 0x52f0
.4byte gUnknown_089B80C4 + 0x1a434
.4byte gUnknown_089B80C4 + 0x1ba10
.4byte gUnknown_089B80C4 + 0x5e24
.4byte gUnknown_089B80C4 + 0x1a454
.4byte gUnknown_089B80C4 + 0x1bc34
.4byte gUnknown_089B80C4 + 0x69cc
.4byte gUnknown_089B80C4 + 0x1a474
.4byte gUnknown_089B80C4 + 0x1be5c
.4byte gUnknown_089B80C4 + 0x7538
.4byte gUnknown_089B80C4 + 0x1a494
.4byte gUnknown_089B80C4 + 0x1c08c
.4byte gUnknown_089B80C4 + 0x7ea0
.4byte gUnknown_089B80C4 + 0x1a4b4
.4byte gUnknown_089B80C4 + 0x1c268
.4byte gUnknown_089B80C4 + 0x87fc
.4byte gUnknown_089B80C4 + 0x1a4d4
.4byte gUnknown_089B80C4 + 0x1c43c
.4byte gUnknown_089B80C4 + 0x90cc
.4byte gUnknown_089B80C4 + 0x1a4f4
.4byte gUnknown_089B80C4 + 0x1c600
.4byte gUnknown_089B80C4 + 0x9ae4
.4byte gUnknown_089B80C4 + 0x1a514
.4byte gUnknown_089B80C4 + 0x1c7e8
.4byte gUnknown_089B80C4 + 0xa3b8
.4byte gUnknown_089B80C4 + 0x1a534
.4byte gUnknown_089B80C4 + 0x1c99c
.4byte gUnknown_089B80C4 + 0xab2c
.4byte gUnknown_089B80C4 + 0x1a554
.4byte gUnknown_089B80C4 + 0x1cb38
.4byte gUnknown_089B80C4 + 0xb1e0
.4byte gUnknown_089B80C4 + 0x1a574
.4byte gUnknown_089B80C4 + 0x1ccb0

	.global gUnknown_089A419C
gUnknown_089A419C:  @ 0x089A419C
@ replacing .incbin "baserom.gba", 0x009a419c, 0x120
.4byte gUnknown_089B80C4 + 0xb8e4
.4byte gUnknown_089B80C4 + 0x1a594
.4byte gUnknown_089B80C4 + 0x1ce08
.4byte gUnknown_089B80C4 + 0xbe24
.4byte gUnknown_089B80C4 + 0x1a5b4
.4byte gUnknown_089B80C4 + 0x1cf18
.4byte gUnknown_089B80C4 + 0xc3b8
.4byte gUnknown_089B80C4 + 0x1a5d4
.4byte gUnknown_089B80C4 + 0x1d03c
.4byte gUnknown_089B80C4 + 0xc770
.4byte gUnknown_089B80C4 + 0x1a5f4
.4byte gUnknown_089B80C4 + 0x1d150
.4byte gUnknown_089B80C4 + 0xc81c
.4byte gUnknown_089B80C4 + 0x1a614
.4byte gUnknown_089B80C4 + 0x1d20c
.4byte gUnknown_089B80C4 + 0xc898
.4byte gUnknown_089B80C4 + 0x1a634
.4byte gUnknown_089B80C4 + 0x1d2c8
.4byte gUnknown_089B80C4 + 0xc908
.4byte gUnknown_089B80C4 + 0x1a654
.4byte gUnknown_089B80C4 + 0x1d37c
.4byte gUnknown_089B80C4 + 0xcd74
.4byte gUnknown_089B80C4 + 0x1a674
.4byte gUnknown_089B80C4 + 0x1d47c
.4byte gUnknown_089B80C4 + 0xd264
.4byte gUnknown_089B80C4 + 0x1a694
.4byte gUnknown_089B80C4 + 0x1d594
.4byte gUnknown_089B80C4 + 0xd5b0
.4byte gUnknown_089B80C4 + 0x1a6b4
.4byte gUnknown_089B80C4 + 0x1d6a0
.4byte gUnknown_089B80C4 + 0xd670
.4byte gUnknown_089B80C4 + 0x1a6d4
.4byte gUnknown_089B80C4 + 0x1d75c
.4byte gUnknown_089B80C4 + 0xd714
.4byte gUnknown_089B80C4 + 0x1a6f4
.4byte gUnknown_089B80C4 + 0x1d81c
.4byte gUnknown_089B80C4 + 0xdeac
.4byte gUnknown_089B80C4 + 0x1a714
.4byte gUnknown_089B80C4 + 0x1d95c
.4byte gUnknown_089B80C4 + 0xe528
.4byte gUnknown_089B80C4 + 0x1a734
.4byte gUnknown_089B80C4 + 0x1da94
.4byte gUnknown_089B80C4 + 0xe994
.4byte gUnknown_089B80C4 + 0x1a754
.4byte gUnknown_089B80C4 + 0x1dbcc
.4byte gUnknown_089B80C4 + 0xea5c
.4byte gUnknown_089B80C4 + 0x1a774
.4byte gUnknown_089B80C4 + 0x1dc88
.4byte gUnknown_089B80C4 + 0xf1b8
.4byte gUnknown_089B80C4 + 0x1a794
.4byte gUnknown_089B80C4 + 0x1ddd8
.4byte gUnknown_089B80C4 + 0xf968
.4byte gUnknown_089B80C4 + 0x1a7b4
.4byte gUnknown_089B80C4 + 0x1df2c
.4byte gUnknown_089B80C4 + 0x1037c
.4byte gUnknown_089B80C4 + 0x1a7d4
.4byte gUnknown_089B80C4 + 0x1e0ac
.4byte gUnknown_089B80C4 + 0x10d00
.4byte gUnknown_089B80C4 + 0x1a7f4
.4byte gUnknown_089B80C4 + 0x1e234
.4byte gUnknown_089B80C4 + 0x11980
.4byte gUnknown_089B80C4 + 0x1a814
.4byte gUnknown_089B80C4 + 0x1e428
.4byte gUnknown_089B80C4 + 0x12380
.4byte gUnknown_089B80C4 + 0x1a834
.4byte gUnknown_089B80C4 + 0x1e60c
.4byte gUnknown_089B80C4 + 0x1294c
.4byte gUnknown_089B80C4 + 0x1a854
.4byte gUnknown_089B80C4 + 0x1e730
.4byte gUnknown_089B80C4 + 0x136ec
.4byte gUnknown_089B80C4 + 0x1a874
.4byte gUnknown_089B80C4 + 0x1e9e0

	.global gUnknown_089A42BC
gUnknown_089A42BC:  @ 0x089A42BC
@ replacing .incbin "baserom.gba", 0x009a42bc, 0x90
.4byte gUnknown_089B80C4 + 0x14964
.4byte gUnknown_089B80C4 + 0x1a894
.4byte gUnknown_089B80C4 + 0x1ed58
.4byte gUnknown_089B80C4 + 0x14dc8
.4byte gUnknown_089B80C4 + 0x1a8b4
.4byte gUnknown_089B80C4 + 0x1ee48
.4byte gUnknown_089B80C4 + 0x1558c
.4byte gUnknown_089B80C4 + 0x1a8d4
.4byte gUnknown_089B80C4 + 0x1ef88
.4byte gUnknown_089B80C4 + 0x15f74
.4byte gUnknown_089B80C4 + 0x1a8f4
.4byte gUnknown_089B80C4 + 0x1f118
.4byte gUnknown_089B80C4 + 0x16ad0
.4byte gUnknown_089B80C4 + 0x1a914
.4byte gUnknown_089B80C4 + 0x1f2f0
.4byte gUnknown_089B80C4 + 0x176fc
.4byte gUnknown_089B80C4 + 0x1a934
.4byte gUnknown_089B80C4 + 0x1f4f8
.4byte gUnknown_089B80C4 + 0x182c8
.4byte gUnknown_089B80C4 + 0x1a954
.4byte gUnknown_089B80C4 + 0x1f708
.4byte gUnknown_089B80C4 + 0x18d44
.4byte gUnknown_089B80C4 + 0x1a974
.4byte gUnknown_089B80C4 + 0x1f8f0
.4byte gUnknown_089B80C4 + 0x19584
.4byte gUnknown_089B80C4 + 0x1a994
.4byte gUnknown_089B80C4 + 0x1fab4
.4byte gUnknown_089B80C4 + 0x19be0
.4byte gUnknown_089B80C4 + 0x1a9b4
.4byte gUnknown_089B80C4 + 0x1fc40
.4byte gUnknown_089B80C4 + 0x1a01c
.4byte gUnknown_089B80C4 + 0x1a9d4
.4byte gUnknown_089B80C4 + 0x1fd84
.4byte gUnknown_089B80C4 + 0x1a248
.4byte gUnknown_089B80C4 + 0x1a9f4
.4byte gUnknown_089B80C4 + 0x1fe84

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
.4byte gUnknown_089B80C4 + 0x1ff4c

	.global gUnknown_089A43D8
gUnknown_089A43D8:  @ 0x089A43D8
@ replacing .incbin "baserom.gba", 0x009a43d8, 0x5c
.4byte gUnknown_089B80C4 + 0x24c84
.4byte gUnknown_089B80C4 + 0x24d84
.4byte gUnknown_089B80C4 + 0x200d4
.4byte gUnknown_089B80C4 + 0x24ca4
.4byte gUnknown_089B80C4 + 0x24e4c
.4byte gUnknown_089B80C4 + 0x203e4
.4byte gUnknown_089B80C4 + 0x24cc4
.4byte gUnknown_089B80C4 + 0x24f38
.4byte gUnknown_089B80C4 + 0x2084c
.4byte gUnknown_089B80C4 + 0x24ce4
.4byte gUnknown_089B80C4 + 0x25050
.4byte gUnknown_089B80C4 + 0x21198
.4byte gUnknown_089B80C4 + 0x24d04
.4byte gUnknown_089B80C4 + 0x251c0
.4byte gUnknown_089B80C4 + 0x22348
.4byte gUnknown_089B80C4 + 0x24d24
.4byte gUnknown_089B80C4 + 0x25424
.4byte gUnknown_089B80C4 + 0x230dc
.4byte gUnknown_089B80C4 + 0x24d44
.4byte gUnknown_089B80C4 + 0x256cc
.4byte gUnknown_089B80C4 + 0x23f1c
.4byte gUnknown_089B80C4 + 0x24d64
.4byte gUnknown_089B80C4 + 0x259a4

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
.4byte gUnknown_089B80C4 + 0x25dc8
.4byte gUnknown_089B80C4 + 0x2cbb8
.4byte gUnknown_089B80C4 + 0x2cef8
.4byte gUnknown_089B80C4 + 0x25e4c
.4byte gUnknown_089B80C4 + 0x2cbd8
.4byte gUnknown_089B80C4 + 0x2cfb0
.4byte gUnknown_089B80C4 + 0x25ed8
.4byte gUnknown_089B80C4 + 0x2cbf8
.4byte gUnknown_089B80C4 + 0x2d06c
.4byte gUnknown_089B80C4 + 0x25f6c
.4byte gUnknown_089B80C4 + 0x2cc18
.4byte gUnknown_089B80C4 + 0x2d128
.4byte gUnknown_089B80C4 + 0x25ff8
.4byte gUnknown_089B80C4 + 0x2cc38
.4byte gUnknown_089B80C4 + 0x2d1e8
.4byte gUnknown_089B80C4 + 0x26088
.4byte gUnknown_089B80C4 + 0x2cc58
.4byte gUnknown_089B80C4 + 0x2d2a0
.4byte gUnknown_089B80C4 + 0x26108
.4byte gUnknown_089B80C4 + 0x2cc78
.4byte gUnknown_089B80C4 + 0x2d358
.4byte gUnknown_089B80C4 + 0x2696c
.4byte gUnknown_089B80C4 + 0x2cc98
.4byte gUnknown_089B80C4 + 0x2d53c
.4byte gUnknown_089B80C4 + 0x273ac
.4byte gUnknown_089B80C4 + 0x2ccb8
.4byte gUnknown_089B80C4 + 0x2d750
.4byte gUnknown_089B80C4 + 0x27ecc
.4byte gUnknown_089B80C4 + 0x2ccd8
.4byte gUnknown_089B80C4 + 0x2d994
.4byte gUnknown_089B80C4 + 0x289f4
.4byte gUnknown_089B80C4 + 0x2ccf8
.4byte gUnknown_089B80C4 + 0x2dc44
.4byte gUnknown_089B80C4 + 0x293bc
.4byte gUnknown_089B80C4 + 0x2cd18
.4byte gUnknown_089B80C4 + 0x2df28
.4byte gUnknown_089B80C4 + 0x2a090
.4byte gUnknown_089B80C4 + 0x2cd38
.4byte gUnknown_089B80C4 + 0x2e1cc
.4byte gUnknown_089B80C4 + 0x2ab58
.4byte gUnknown_089B80C4 + 0x2cd58
.4byte gUnknown_089B80C4 + 0x2e40c
.4byte gUnknown_089B80C4 + 0x2b3e4
.4byte gUnknown_089B80C4 + 0x2cd78
.4byte gUnknown_089B80C4 + 0x2e5dc
.4byte gUnknown_089B80C4 + 0x2bac4
.4byte gUnknown_089B80C4 + 0x2cd98
.4byte gUnknown_089B80C4 + 0x2e744
.4byte gUnknown_089B80C4 + 0x2bf60
.4byte gUnknown_089B80C4 + 0x2cdb8
.4byte gUnknown_089B80C4 + 0x2e860
.4byte gUnknown_089B80C4 + 0x2c280
.4byte gUnknown_089B80C4 + 0x2cdd8
.4byte gUnknown_089B80C4 + 0x2e950
.4byte gUnknown_089B80C4 + 0x2c3f4
.4byte gUnknown_089B80C4 + 0x2cdf8
.4byte gUnknown_089B80C4 + 0x2ea20
.4byte gUnknown_089B80C4 + 0x2c50c
.4byte gUnknown_089B80C4 + 0x2ce18
.4byte gUnknown_089B80C4 + 0x2eaec
.4byte gUnknown_089B80C4 + 0x2c624
.4byte gUnknown_089B80C4 + 0x2ce38
.4byte gUnknown_089B80C4 + 0x2ebbc
.4byte gUnknown_089B80C4 + 0x2c708
.4byte gUnknown_089B80C4 + 0x2ce58
.4byte gUnknown_089B80C4 + 0x2ec8c
.4byte gUnknown_089B80C4 + 0x2c7fc
.4byte gUnknown_089B80C4 + 0x2ce78
.4byte gUnknown_089B80C4 + 0x2ed58
.4byte gUnknown_089B80C4 + 0x2c914
.4byte gUnknown_089B80C4 + 0x2ce98
.4byte gUnknown_089B80C4 + 0x2ee24
.4byte gUnknown_089B80C4 + 0x2ca28
.4byte gUnknown_089B80C4 + 0x2ceb8
.4byte gUnknown_089B80C4 + 0x2eef0
.4byte gUnknown_089B80C4 + 0x2cb04
.4byte gUnknown_089B80C4 + 0x2ced8
.4byte gUnknown_089B80C4 + 0x2efbc

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


	.global ProcScr_MapAnimDefaultItemEffect
ProcScr_MapAnimDefaultItemEffect:  @ 0x089A4764
        @ PROC_CALL
        .short 0x2, 0x0
        .word MapAnim_BeginSubjectFastAnim
        @ PROC_CALL
        .short 0x2, 0x0
        .word MapAnim_MoveSubjectsTowardsTarget
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word MapAnim_MoveSubjectsTowardsTarget
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word MapAnim_MoveSubjectsTowardsTarget
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word MapAnim_MoveSubjectsTowardsTarget
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word MapAnim_MoveCameraOnTarget
        @ PROC_SLEEP
        .short 0xe, 0x2
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word MapAnim_BeginRoundSpecificAnims
        @ PROC_SLEEP
        .short 0xe, 0x8
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word MapAnim_WaitForHPToEndChangingMaybe
        @ PROC_CALL
        .short 0x2, 0x0
        .word MapAnim_MoveSubjectsAwayFromTarget
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word MapAnim_MoveSubjectsAwayFromTarget
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word MapAnim_MoveSubjectsAwayFromTarget
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word MapAnim_MoveSubjectsAwayFromTarget
        @ PROC_SLEEP
        .short 0xe, 0x14
        .word 0x0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0

	.global ProcScr_SpellAssocNightMare
ProcScr_SpellAssocNightMare:  @ 0x089A481C
        @ PROC_CALL
        .short 0x2, 0x0
        .word DisableMapPaletteAnimations
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8081E48
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word MapAnim_AnimateSubjectIdle
        @ PROC_SLEEP
        .short 0xe, 0x1e
        .word 0x0
        @ PROC_SLEEP
        .short 0xe, 0x1a
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8081A08
        @ PROC_SLEEP
        .short 0xe, 0x2
        .word 0x0
        @ PROC_SLEEP
        .short 0xe, 0xdc
        .word 0x0
        @ PROC_SLEEP
        .short 0xe, 0xa
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word MapAnim_SubjectResetAnim
        @ PROC_SLEEP
        .short 0xe, 0x1e
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8081E54
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word ResetMapPaletteAnimations
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0

	.global ProcScr_SpellAssocLatona
ProcScr_SpellAssocLatona:  @ 0x089A489C
        @ PROC_CALL
        .short 0x2, 0x0
        .word DisableMapPaletteAnimations
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8081E48
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word MapAnim_AnimateSubjectIdle
        @ PROC_SLEEP
        .short 0xe, 0x1e
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80819E8
        @ PROC_SLEEP
        .short 0xe, 0x2
        .word 0x0
        @ PROC_SLEEP
        .short 0xe, 0xc8
        .word 0x0
        @ PROC_SLEEP
        .short 0xe, 0xa
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word MapAnim_SubjectResetAnim
        @ PROC_SLEEP
        .short 0xe, 0x1e
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8081E54
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word ResetMapPaletteAnimations
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0

	.global ProcScr_SpellAssocAntitoxin
ProcScr_SpellAssocAntitoxin:  @ 0x089A4914
        @ PROC_CALL
        .short 0x2, 0x0
        .word MapAnim_AnimateSubjectIdle
        @ PROC_SLEEP
        .short 0xe, 0x1e
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8081A28
        @ PROC_SLEEP
        .short 0xe, 0x2
        .word 0x0
        @ PROC_SLEEP
        .short 0xe, 0x46
        .word 0x0
        @ PROC_SLEEP
        .short 0xe, 0xa
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word MapAnim_SubjectResetAnim
        @ PROC_SLEEP
        .short 0xe, 0x1e
        .word 0x0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0

	.global ProcScr_SpellAssocPureWater
ProcScr_SpellAssocPureWater:  @ 0x089A495C
        @ PROC_CALL
        .short 0x2, 0x0
        .word MapAnim_AnimateSubjectIdle
        @ PROC_SLEEP
        .short 0xe, 0x1e
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8081A54
        @ PROC_SLEEP
        .short 0xe, 0x2
        .word 0x0
        @ PROC_SLEEP
        .short 0xe, 0x46
        .word 0x0
        @ PROC_SLEEP
        .short 0xe, 0xa
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word MapAnim_SubjectResetAnim
        @ PROC_SLEEP
        .short 0xe, 0x1e
        .word 0x0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0

	.global ProcScr_SpellAssocElixir
ProcScr_SpellAssocElixir:  @ 0x089A49A4
        @ PROC_CALL
        .short 0x2, 0x0
        .word MapAnim_AnimateSubjectIdle
        @ PROC_SLEEP
        .short 0xe, 0x1e
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8081A80
        @ PROC_SLEEP
        .short 0xe, 0x1e
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word MapAnim_BeginRoundSpecificAnims
        @ PROC_SLEEP
        .short 0xe, 0x1e
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word MapAnim_WaitForHPToEndChangingMaybe
        @ PROC_SLEEP
        .short 0xe, 0xa
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word MapAnim_SubjectResetAnim
        @ PROC_SLEEP
        .short 0xe, 0x1e
        .word 0x0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0

	.global ProcScr_SpellAssocVulenrary
ProcScr_SpellAssocVulenrary:  @ 0x089A49FC
        @ PROC_CALL
        .short 0x2, 0x0
        .word MapAnim_AnimateSubjectIdle
        @ PROC_SLEEP
        .short 0xe, 0x1e
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8081B40
        @ PROC_SLEEP
        .short 0xe, 0x1e
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word MapAnim_BeginRoundSpecificAnims
        @ PROC_SLEEP
        .short 0xe, 0x1e
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word MapAnim_WaitForHPToEndChangingMaybe
        @ PROC_SLEEP
        .short 0xe, 0xa
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word MapAnim_SubjectResetAnim
        @ PROC_SLEEP
        .short 0xe, 0x1e
        .word 0x0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0

	.global ProcScr_SpellAssocHeal
ProcScr_SpellAssocHeal:  @ 0x089A4A54
        @ PROC_CALL
        .short 0x2, 0x0
        .word MapAnim_MoveCameraOnTarget
        @ PROC_SLEEP
        .short 0xe, 0x2
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word MapAnim_AnimateSubjectIdle
        @ PROC_SLEEP
        .short 0xe, 0x1e
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8081AB0
        @ PROC_SLEEP
        .short 0xe, 0x1e
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word MapAnim_BeginRoundSpecificAnims
        @ PROC_SLEEP
        .short 0xe, 0x1e
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word MapAnim_WaitForHPToEndChangingMaybe
        @ PROC_SLEEP
        .short 0xe, 0xa
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word MapAnim_SubjectResetAnim
        @ PROC_SLEEP
        .short 0xe, 0x1e
        .word 0x0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0

	.global ProcScr_SpellAssocMend
ProcScr_SpellAssocMend:  @ 0x089A4ABC
        @ PROC_CALL
        .short 0x2, 0x0
        .word MapAnim_MoveCameraOnTarget
        @ PROC_SLEEP
        .short 0xe, 0x2
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word MapAnim_AnimateSubjectIdle
        @ PROC_SLEEP
        .short 0xe, 0x1e
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8081AE0
        @ PROC_SLEEP
        .short 0xe, 0x1e
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word MapAnim_BeginRoundSpecificAnims
        @ PROC_SLEEP
        .short 0xe, 0x1e
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word MapAnim_WaitForHPToEndChangingMaybe
        @ PROC_SLEEP
        .short 0xe, 0xa
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word MapAnim_SubjectResetAnim
        @ PROC_SLEEP
        .short 0xe, 0x1e
        .word 0x0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0

	.global ProcScr_SpellAssocRecover
ProcScr_SpellAssocRecover:  @ 0x089A4B24
        @ PROC_CALL
        .short 0x2, 0x0
        .word MapAnim_MoveCameraOnTarget
        @ PROC_SLEEP
        .short 0xe, 0x2
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word MapAnim_AnimateSubjectIdle
        @ PROC_SLEEP
        .short 0xe, 0x1e
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8081B10
        @ PROC_SLEEP
        .short 0xe, 0x1e
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word MapAnim_BeginRoundSpecificAnims
        @ PROC_SLEEP
        .short 0xe, 0x1e
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word MapAnim_WaitForHPToEndChangingMaybe
        @ PROC_SLEEP
        .short 0xe, 0xa
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word MapAnim_SubjectResetAnim
        @ PROC_SLEEP
        .short 0xe, 0x1e
        .word 0x0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0

	.global ProcScr_SpellAssocPhysic
ProcScr_SpellAssocPhysic:  @ 0x089A4B8C
        @ PROC_CALL
        .short 0x2, 0x0
        .word MapAnim_MoveCameraOnTarget
        @ PROC_SLEEP
        .short 0xe, 0x2
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word MapAnim_AnimateSubjectIdle
        @ PROC_SLEEP
        .short 0xe, 0x1e
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8081AB0
        @ PROC_SLEEP
        .short 0xe, 0x1e
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word MapAnim_BeginRoundSpecificAnims
        @ PROC_SLEEP
        .short 0xe, 0x1e
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word MapAnim_WaitForHPToEndChangingMaybe
        @ PROC_SLEEP
        .short 0xe, 0xa
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word MapAnim_SubjectResetAnim
        @ PROC_SLEEP
        .short 0xe, 0x1e
        .word 0x0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0

	.global ProcScr_SpellAssocTorch
ProcScr_SpellAssocTorch:  @ 0x089A4BF4
        @ PROC_CALL
        .short 0x2, 0x0
        .word MapAnim_AnimateSubjectIdle
        @ PROC_SLEEP
        .short 0xe, 0x1e
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8081BF8
        @ PROC_SLEEP
        .short 0xe, 0x2
        .word 0x0
        @ PROC_SLEEP
        .short 0xe, 0x64
        .word 0x0
        @ PROC_SLEEP
        .short 0xe, 0xa
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word MapAnim_SubjectResetAnim
        @ PROC_SLEEP
        .short 0xe, 0x1e
        .word 0x0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0

	.global ProcScr_SpellAssocUnlock
ProcScr_SpellAssocUnlock:  @ 0x089A4C3C
        @ PROC_CALL
        .short 0x2, 0x0
        .word DisableMapPaletteAnimations
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8081E48
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80815EC
        @ PROC_SLEEP
        .short 0xe, 0x2
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word MapAnim_AnimateSubjectIdle
        @ PROC_SLEEP
        .short 0xe, 0x1e
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8081C18
        @ PROC_SLEEP
        .short 0xe, 0x2
        .word 0x0
        @ PROC_SLEEP
        .short 0xe, 0x8c
        .word 0x0
        @ PROC_SLEEP
        .short 0xe, 0xa
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word MapAnim_SubjectResetAnim
        @ PROC_SLEEP
        .short 0xe, 0x1e
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8081E54
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word ResetMapPaletteAnimations
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0

	.global ProcScr_SpellAssocBerserk
ProcScr_SpellAssocBerserk:  @ 0x089A4CC4
        @ PROC_CALL
        .short 0x2, 0x0
        .word DisableMapPaletteAnimations
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8081E48
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word MapAnim_MoveCameraOnTarget
        @ PROC_SLEEP
        .short 0xe, 0x2
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word MapAnim_AnimateSubjectIdle
        @ PROC_SLEEP
        .short 0xe, 0x1e
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8081C34
        @ PROC_SLEEP
        .short 0xe, 0x2
        .word 0x0
        @ PROC_SLEEP
        .short 0xe, 0x32
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word MapAnim_BeginRoundSpecificAnims
        @ PROC_SLEEP
        .short 0xe, 0x1e
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word MapAnim_WaitForHPToEndChangingMaybe
        @ PROC_SLEEP
        .short 0xe, 0xa
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word MapAnim_SubjectResetAnim
        @ PROC_SLEEP
        .short 0xe, 0x1e
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8081E54
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word ResetMapPaletteAnimations
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0

	.global ProcScr_SpellAssocSleep
ProcScr_SpellAssocSleep:  @ 0x089A4D64
        @ PROC_CALL
        .short 0x2, 0x0
        .word DisableMapPaletteAnimations
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8081E48
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word MapAnim_MoveCameraOnTarget
        @ PROC_SLEEP
        .short 0xe, 0x2
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word MapAnim_AnimateSubjectIdle
        @ PROC_SLEEP
        .short 0xe, 0x1e
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8081C74
        @ PROC_SLEEP
        .short 0xe, 0x2
        .word 0x0
        @ PROC_SLEEP
        .short 0xe, 0x8c
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word MapAnim_BeginRoundSpecificAnims
        @ PROC_SLEEP
        .short 0xe, 0x1e
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word MapAnim_WaitForHPToEndChangingMaybe
        @ PROC_SLEEP
        .short 0xe, 0xa
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word MapAnim_SubjectResetAnim
        @ PROC_SLEEP
        .short 0xe, 0x1e
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8081E54
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word ResetMapPaletteAnimations
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0

	.global ProcScr_SpellAssocMonsterStone
ProcScr_SpellAssocMonsterStone:  @ 0x089A4E04
        @ PROC_CALL
        .short 0x2, 0x0
        .word DisableMapPaletteAnimations
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8081E48
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word MapAnim_MoveCameraOnTarget
        @ PROC_SLEEP
        .short 0xe, 0x2
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word MapAnim_AnimateSubjectIdle
        @ PROC_SLEEP
        .short 0xe, 0x1e
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8081C94
        @ PROC_SLEEP
        .short 0xe, 0x2
        .word 0x0
        @ PROC_SLEEP
        .short 0xe, 0x3c
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word MapAnim_BeginRoundSpecificAnims
        @ PROC_SLEEP
        .short 0xe, 0x1e
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word MapAnim_WaitForHPToEndChangingMaybe
        @ PROC_SLEEP
        .short 0xe, 0xa
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word MapAnim_SubjectResetAnim
        @ PROC_SLEEP
        .short 0xe, 0x1e
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8081E54
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word ResetMapPaletteAnimations
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0

	.global ProcScr_SpellAssocSilence
ProcScr_SpellAssocSilence:  @ 0x089A4EA4
        @ PROC_CALL
        .short 0x2, 0x0
        .word DisableMapPaletteAnimations
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8081E48
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word MapAnim_MoveCameraOnTarget
        @ PROC_SLEEP
        .short 0xe, 0x2
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word MapAnim_AnimateSubjectIdle
        @ PROC_SLEEP
        .short 0xe, 0x1e
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80819A8
        @ PROC_SLEEP
        .short 0xe, 0x2
        .word 0x0
        @ PROC_SLEEP
        .short 0xe, 0x40
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word MapAnim_BeginRoundSpecificAnims
        @ PROC_SLEEP
        .short 0xe, 0x1e
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word MapAnim_WaitForHPToEndChangingMaybe
        @ PROC_SLEEP
        .short 0xe, 0xa
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word MapAnim_SubjectResetAnim
        @ PROC_SLEEP
        .short 0xe, 0x1e
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8081E54
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word ResetMapPaletteAnimations
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0

	.global ProcScr_SpellAssocRestore
ProcScr_SpellAssocRestore:  @ 0x089A4F44
        @ PROC_CALL
        .short 0x2, 0x0
        .word DisableMapPaletteAnimations
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8081E48
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word MapAnim_MoveCameraOnTarget
        @ PROC_SLEEP
        .short 0xe, 0x2
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word MapAnim_AnimateSubjectIdle
        @ PROC_SLEEP
        .short 0xe, 0x1e
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8081C54
        @ PROC_SLEEP
        .short 0xe, 0x2
        .word 0x0
        @ PROC_SLEEP
        .short 0xe, 0x50
        .word 0x0
        @ PROC_SLEEP
        .short 0xe, 0xa
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word MapAnim_SubjectResetAnim
        @ PROC_SLEEP
        .short 0xe, 0x1e
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8081E54
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word ResetMapPaletteAnimations
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0

	.global ProcScr_SpellAssocRepair
ProcScr_SpellAssocRepair:  @ 0x089A4FCC
        @ PROC_CALL
        .short 0x2, 0x0
        .word DisableMapPaletteAnimations
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8081E48
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word MapAnim_MoveCameraOnTarget
        @ PROC_SLEEP
        .short 0xe, 0x2
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word MapAnim_AnimateSubjectIdle
        @ PROC_SLEEP
        .short 0xe, 0x1e
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8081CB4
        @ PROC_SLEEP
        .short 0xe, 0x2
        .word 0x0
        @ PROC_SLEEP
        .short 0xe, 0x50
        .word 0x0
        @ PROC_SLEEP
        .short 0xe, 0xa
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word MapAnim_SubjectResetAnim
        @ PROC_SLEEP
        .short 0xe, 0x1e
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8081E54
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word ResetMapPaletteAnimations
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0

	.global gUnknown_089A5054
gUnknown_089A5054:  @ 0x089A5054
        @ PROC_CALL
        .short 0x2, 0x0
        .word MapAnim_MoveCameraOnTarget
        @ PROC_SLEEP
        .short 0xe, 0x2
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word MapAnim_PoisonEffectOnTarget
        @ PROC_SLEEP
        .short 0xe, 0x2
        .word 0x0
        @ PROC_SLEEP
        .short 0xe, 0x5e
        .word 0x0
        @ PROC_SLEEP
        .short 0xe, 0xa
        .word 0x0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0

	.global ProcScr_PoisonDmgMapEffect
ProcScr_PoisonDmgMapEffect:  @ 0x089A508C
        @ PROC_CALL
        .short 0x2, 0x0
        .word MapAnim_MoveCameraOnTarget
        @ PROC_SLEEP
        .short 0xe, 0x2
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word MapAnim_PoisonEffectOnTarget
        @ PROC_SLEEP
        .short 0xe, 0x2
        .word 0x0
        @ PROC_SLEEP
        .short 0xe, 0x32
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word MapAnim_BeginRoundSpecificAnims
        @ PROC_SLEEP
        .short 0xe, 0x1e
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word MapAnim_WaitForHPToEndChangingMaybe
        @ PROC_SLEEP
        .short 0xe, 0x2c
        .word 0x0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0

	.global ProcScr_EggDmgMapEffect1
ProcScr_EggDmgMapEffect1:  @ 0x089A50DC
        @ PROC_CALL
        .short 0x2, 0x0
        .word MapAnim_MoveCameraOnTarget
        @ PROC_SLEEP
        .short 0xe, 0x2
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8081CD4
        @ PROC_CALL
        .short 0x2, 0x0
        .word MapAnim_BeginRoundSpecificAnims
        @ PROC_SLEEP
        .short 0xe, 0x5
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word MapAnim_WaitForHPToEndChangingMaybe
        @ PROC_SLEEP
        .short 0xe, 0x5
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8081E60
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0

	.global ProcScr_EggDmgMapEffect2
ProcScr_EggDmgMapEffect2:  @ 0x089A5124
        @ PROC_CALL
        .short 0x2, 0x0
        .word MapAnim_MoveCameraOnTarget
        @ PROC_SLEEP
        .short 0xe, 0x2
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8081970
        @ PROC_SLEEP
        .short 0xe, 0x2
        .word 0x0
        @ PROC_SLEEP
        .short 0xe, 0x32
        .word 0x0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0

	.global ProcScr_CritAtkMapEffect
ProcScr_CritAtkMapEffect:  @ 0x089A5154
        @ PROC_CALL
        .short 0x2, 0x0
        .word MapAnim_MoveCameraOnTarget
        @ PROC_SLEEP
        .short 0xe, 0x2
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word MapAnim_BeginRoundSpecificAnims
        @ PROC_SLEEP
        .short 0xe, 0x1e
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word MapAnim_WaitForHPToEndChangingMaybe
        @ PROC_SLEEP
        .short 0xe, 0x14
        .word 0x0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0

	.global ProcScr_SpellAssocBarrier
ProcScr_SpellAssocBarrier:  @ 0x089A518C
        @ PROC_CALL
        .short 0x2, 0x0
        .word DisableMapPaletteAnimations
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8081E48
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word MapAnim_MoveCameraOnTarget
        @ PROC_SLEEP
        .short 0xe, 0x2
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word MapAnim_AnimateSubjectIdle
        @ PROC_SLEEP
        .short 0xe, 0x1e
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80819C8
        @ PROC_SLEEP
        .short 0xe, 0x2
        .word 0x0
        @ PROC_SLEEP
        .short 0xe, 0x3c
        .word 0x0
        @ PROC_SLEEP
        .short 0xe, 0xa
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word MapAnim_SubjectResetAnim
        @ PROC_SLEEP
        .short 0xe, 0x1e
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8081E54
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word ResetMapPaletteAnimations
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0

	.global ProcScr_SpellAssocWarp
ProcScr_SpellAssocWarp:  @ 0x089A5214
        @ PROC_CALL
        .short 0x2, 0x0
        .word MapAnim_MoveCameraOnTarget
        @ PROC_SLEEP
        .short 0xe, 0x2
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word MapAnim_AnimateSubjectIdle
        @ PROC_SLEEP
        .short 0xe, 0x1e
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8081B70
        @ PROC_SLEEP
        .short 0xe, 0xa
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8081CD4
        @ PROC_SLEEP
        .short 0xe, 0x14
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8081D40
        @ PROC_SLEEP
        .short 0xe, 0x2
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8081D1C
        @ PROC_SLEEP
        .short 0xe, 0x8
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8081E04
        @ PROC_SLEEP
        .short 0xe, 0x1e
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80815EC
        @ PROC_SLEEP
        .short 0xe, 0x2
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8081D84
        @ PROC_SLEEP
        .short 0xe, 0x28
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8081BCC
        @ PROC_SLEEP
        .short 0xe, 0xa
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8081DE0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8081CF8
        @ PROC_SLEEP
        .short 0xe, 0x10
        .word 0x0
        @ PROC_SLEEP
        .short 0xe, 0xa
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word MapAnim_MoveCameraOnSubject
        @ PROC_SLEEP
        .short 0xe, 0x2
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word MapAnim_SubjectResetAnim
        @ PROC_SLEEP
        .short 0xe, 0x1e
        .word 0x0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0

	.global gUnknown_089A52FC
gUnknown_089A52FC:  @ 0x089A52FC
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80825B0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80825B8
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global SpriteAnim_ManimStatGain
SpriteAnim_ManimStatGain:  @ 0x089A5314
	.incbin "baserom.gba", 0x9A5314, 0x758

	.global gUnknown_089A5A6C
gUnknown_089A5A6C:  @ 0x089A5A6C
	.incbin "baserom.gba", 0x9A5A6C, 0x78C

	.global gUnknown_089A61F8
gUnknown_089A61F8:  @ 0x089A61F8
	.incbin "baserom.gba", 0x9A61F8, 0x5C

	.global gUnknown_089A6254
gUnknown_089A6254:  @ 0x089A6254
	.incbin "baserom.gba", 0x9A6254, 0xCEC

	.global Obj_PoisonAnim
Obj_PoisonAnim:  @ 0x089A6F40
	.incbin "baserom.gba", 0x9A6F40, 0x98

	.global Obj_WallBreakAnim
Obj_WallBreakAnim:  @ 0x089A6FD8
	.incbin "baserom.gba", 0x9A6FD8, 0x1F20

	.global gUnknown_089A8EF8
gUnknown_089A8EF8:  @ 0x089A8EF8
	.incbin "baserom.gba", 0x9A8EF8, 0x7C

	.global gUnknown_089A8F74
gUnknown_089A8F74:  @ 0x089A8F74
	.incbin "baserom.gba", 0x9A8F74, 0x20

	.global gGfx_ArenaBuildingFront
gGfx_ArenaBuildingFront:  @ 0x089A8F94
	.incbin "baserom.gba", 0x9A8F94, 0x2BDC

	.global gTsa_ArenaBuildingFront
gTsa_ArenaBuildingFront:  @ 0x089ABB70
	.incbin "baserom.gba", 0x9ABB70, 0x4B4

	.global gPal_ArenaBuildingFront
gPal_ArenaBuildingFront:  @ 0x089AC024
	.incbin "baserom.gba", 0x9AC024, 0x80

	.global Img_MapAnimMISS
Img_MapAnimMISS:  @ 0x089AC0A4
	.incbin "baserom.gba", 0x9AC0A4, 0xF0

	.global Obj_MapAnimMISS
Obj_MapAnimMISS:  @ 0x089AC194
	.incbin "baserom.gba", 0x9AC194, 0x168

	.global Img_MapAnimNODAMAGE
Img_MapAnimNODAMAGE:  @ 0x089AC2FC
	.incbin "baserom.gba", 0x9AC2FC, 0x144

	.global obj_MapAnimNODAMAGE
obj_MapAnimNODAMAGE:  @ 0x089AC440
	.incbin "baserom.gba", 0x9AC440, 0x18C

	.global Pal_ManimLevelUpStatGainCycling
Pal_ManimLevelUpStatGainCycling:  @ 0x089AC5CC
    .incbin "baserom.gba", 0x9AC5CC, 0x1C8

	.global Img_ManimLevelUpText
Img_ManimLevelUpText:  @ 0x089AC794
    .incbin "baserom.gba", 0x9AC794, 0x214

	.global Pal_ManimLevelUp
Pal_ManimLevelUp:  @ 0x089AC9A8
	.incbin "baserom.gba", 0x9AC9A8, 0x60

	.global Img_ManimLevelUpStatGain
Img_ManimLevelUpStatGain:  @ 0x089ACA08
	.incbin "baserom.gba", 0x9ACA08, 0x290

	.global Img_ManimLevelUpStatGainDigits
Img_ManimLevelUpStatGainDigits:  @ 0x089ACC98
    .incbin "baserom.gba", 0x9ACC98, 0x800

	.global gUnknown_089AD498
gUnknown_089AD498:  @ 0x089AD498
	.incbin "baserom.gba", 0x9AD498, 0x68

	.global Img_MapBattleInfoBox
Img_MapBattleInfoBox:  @ 0x089AD500
	.incbin "baserom.gba", 0x9AD500, 0x148

	.global Pal_MapBattleInfoBlue
Pal_MapBattleInfoBlue:  @ 0x089AD648
	.incbin "baserom.gba", 0x9AD648, 0x20

	.global Pal_MapBattleInfoRed
Pal_MapBattleInfoRed:  @ 0x089AD668
    .incbin "baserom.gba", 0x9AD668, 0x20

	.global Pal_MapBattleInfoGreen
Pal_MapBattleInfoGreen:  @ 0x089AD688
	.incbin "baserom.gba", 0x9AD688, 0x20

	.global Pal_MapBattleInfoPurple
Pal_MapBattleInfoPurple:  @ 0x089AD6A8
    .incbin "baserom.gba", 0x9AD6A8, 0x20

    .global Tsa_MapBattleBoxGfx1
Tsa_MapBattleBoxGfx1:   @ 0x089AD6C8
    .incbin "baserom.gba", 0x9AD6C8, 0x4C

    .global Tsa_MapBattleBoxGfx2
Tsa_MapBattleBoxGfx2:   @ 0x089AD714
    .incbin "baserom.gba", 0x9AD714, 0x38

    .global Tsa_MapBattleBoxGfx3
Tsa_MapBattleBoxGfx3:   @ 0x089AD74C
    .incbin "baserom.gba", 0x9AD74C, 0x40

	.global Img_MapBattleInfoHpBar
Img_MapBattleInfoHpBar:  @ 0x089AD78C
	.incbin "baserom.gba", 0x9AD78C, 0xDC

	.global Img_MapBattleInfoNum
Img_MapBattleInfoNum:  @ 0x089AD868
	.incbin "baserom.gba", 0x9AD868, 0xCC

	.global gUnknown_089AD934
gUnknown_089AD934:  @ 0x089AD934
	.incbin "baserom.gba", 0x9AD934, 0xC4

	.global gUnknown_089AD9F8
gUnknown_089AD9F8:  @ 0x089AD9F8
	.incbin "baserom.gba", 0x9AD9F8, 0x88

	.global Img_WallBreakAnim
Img_WallBreakAnim:  @ 0x089ADA80
    .incbin "baserom.gba", 0x9ADA80, 0x28C

	.global Pal_WallBreakAnim
Pal_WallBreakAnim:  @ 0x089ADD0C
	.incbin "baserom.gba", 0x9ADD0C, 0x40

	.global gUnknown_089ADD4C
gUnknown_089ADD4C:  @ 0x089ADD4C
	.incbin "baserom.gba", 0x9ADD4C, 0x164

	.global Img_PoisonAnim
Img_PoisonAnim:  @ 0x089ADEB0
	.incbin "baserom.gba", 0x9ADEB0, 0x354

	.global Pal_PoisonAnim
Pal_PoisonAnim:  @ 0x089AE204
	.incbin "baserom.gba", 0x9AE204, 0x20

	.global gUnknown_089AE224
gUnknown_089AE224:  @ 0x089AE224
	.incbin "baserom.gba", 0x9AE224, 0x260

	.global gUnknown_089AE484
gUnknown_089AE484:  @ 0x089AE484
	.incbin "baserom.gba", 0x9AE484, 0x20

	.global gUnknown_089AE4A4
gUnknown_089AE4A4:  @ 0x089AE4A4
	.incbin "baserom.gba", 0x9AE4A4, 0x300

	.global gUnknown_089AE7A4
gUnknown_089AE7A4:  @ 0x089AE7A4
	.incbin "baserom.gba", 0x9AE7A4, 0x20

	.global gUnknown_089AE7C4
gUnknown_089AE7C4:  @ 0x089AE7C4
	.incbin "baserom.gba", 0x9AE7C4, 0x40

	.global gUnknown_089AE804
gUnknown_089AE804:  @ 0x089AE804
	.incbin "baserom.gba", 0x9AE804, 0xB0C

	.global gUnknown_089AF310
gUnknown_089AF310:  @ 0x089AF310
	.incbin "baserom.gba", 0x9AF310, 0x600

	.global gUnknown_089AF910
gUnknown_089AF910:  @ 0x089AF910
	.incbin "baserom.gba", 0x9AF910, 0x20

	.global gUnknown_089AF930
gUnknown_089AF930:  @ 0x089AF930
	.incbin "baserom.gba", 0x9AF930, 0x20

	.global gUnknown_089AF950
gUnknown_089AF950:  @ 0x089AF950
	.incbin "baserom.gba", 0x9AF950, 0x174

	.global gUnknown_089AFAC4
gUnknown_089AFAC4:  @ 0x089AFAC4
	.incbin "baserom.gba", 0x9AFAC4, 0x1F8

	.global gUnknown_089AFCBC
gUnknown_089AFCBC:  @ 0x089AFCBC
	.incbin "baserom.gba", 0x9AFCBC, 0x2BC

	.global gUnknown_089AFF78
gUnknown_089AFF78:  @ 0x089AFF78
	.incbin "baserom.gba", 0x9AFF78, 0x40

	.global gUnknown_089AFFB8
gUnknown_089AFFB8:  @ 0x089AFFB8
	.incbin "baserom.gba", 0x9AFFB8, 0x40

	.global gUnknown_089AFFF8
gUnknown_089AFFF8:  @ 0x089AFFF8
    .incbin "baserom.gba", 0x9AFFF8, 0x3DC

	.global gUnknown_089B03D4
gUnknown_089B03D4:  @ 0x089B03D4
	.incbin "baserom.gba", 0x9B03D4, 0x2B8

	.global gUnknown_089B068C
gUnknown_089B068C:  @ 0x089B068C
	.incbin "baserom.gba", 0x9B068C, 0x20

	.global gUnknown_089B06AC
gUnknown_089B06AC:  @ 0x089B06AC
	.incbin "baserom.gba", 0x9B06AC, 0x54

	.global gUnknown_089B0700
gUnknown_089B0700:  @ 0x089B0700
	.incbin "baserom.gba", 0x9B0700, 0x20

	.global gUnknown_089B0720
gUnknown_089B0720:  @ 0x089B0720
	.incbin "baserom.gba", 0x9B0720, 0x100

	.global gUnknown_089B0820
gUnknown_089B0820:  @ 0x089B0820
	.incbin "baserom.gba", 0x9B0820, 0x20

	.global gUnknown_089B0840
gUnknown_089B0840:  @ 0x089B0840
    .incbin "baserom.gba", 0x9B0840, 0x24

	.global gUnknown_089B0864
gUnknown_089B0864:  @ 0x089B0864
	.incbin "baserom.gba", 0x9B0864, 0x26C

	.global gUnknown_089B0AD0
gUnknown_089B0AD0:  @ 0x089B0AD0
	.incbin "baserom.gba", 0x9B0AD0, 0xCD4

	.global gUnknown_089B17A4
gUnknown_089B17A4:  @ 0x089B17A4
	.incbin "baserom.gba", 0x9B17A4, 0x26C

	.global gUnknown_089B1A10
gUnknown_089B1A10:  @ 0x089B1A10
	.incbin "baserom.gba", 0x9B1A10, 0x400

	.global gUnknown_089B1E10
gUnknown_089B1E10:  @ 0x089B1E10
	.incbin "baserom.gba", 0x9B1E10, 0x2D8

	.global gUnknown_089B20E8
gUnknown_089B20E8:  @ 0x089B20E8
	.incbin "baserom.gba", 0x9B20E8, 0x20

	.global gUnknown_089B2108
gUnknown_089B2108:  @ 0x089B2108
	.incbin "baserom.gba", 0x9B2108, 0xD0

	.global gUnknown_089B21D8
gUnknown_089B21D8:  @ 0x089B21D8
	.incbin "baserom.gba", 0x9B21D8, 0x440

	.global gUnknown_089B2618
gUnknown_089B2618:  @ 0x089B2618
    .incbin "baserom.gba", 0x9B2618, 0x110

	.global gUnknown_089B2728
gUnknown_089B2728:  @ 0x089B2728
	.incbin "baserom.gba", 0x9B2728, 0x20

	.global gUnknown_089B2748
gUnknown_089B2748:  @ 0x089B2748
	.incbin "baserom.gba", 0x9B2748, 0x138

	.global gUnknown_089B2880
gUnknown_089B2880:  @ 0x089B2880
	.incbin "baserom.gba", 0x9B2880, 0xBBC

	.global gUnknown_089B343C
gUnknown_089B343C:  @ 0x089B343C
	.incbin "baserom.gba", 0x9B343C, 0x194

	.global gUnknown_089B35D0
gUnknown_089B35D0:  @ 0x089B35D0
	.incbin "baserom.gba", 0x9B35D0, 0x162C

	.global gUnknown_089B4BFC
gUnknown_089B4BFC:  @ 0x089B4BFC
    .incbin "baserom.gba", 0x9B4BFC, 0x1EA4

	.global gUnknown_089B6AA0
gUnknown_089B6AA0:  @ 0x089B6AA0
	.incbin "baserom.gba", 0x9B6AA0, 0x934

	.global gUnknown_089B73D4
gUnknown_089B73D4:  @ 0x089B73D4
	.incbin "baserom.gba", 0x9B73D4, 0x23C

	.global gUnknown_089B7610
gUnknown_089B7610:  @ 0x089B7610
	.incbin "baserom.gba", 0x9B7610, 0xAB4

	.global gUnknown_089B80C4
gUnknown_089B80C4:  @ 0x089B80C4
	.incbin "baserom.gba", 0x9B80C4, 0x2F088

	.global gUnknown_089E714C
gUnknown_089E714C:  @ 0x089E714C
	.incbin "baserom.gba", 0x9E714C, 0xCA0

	.global gUnknown_089E7DEC
gUnknown_089E7DEC:  @ 0x089E7DEC
	.incbin "baserom.gba", 0x9E7DEC, 0x44C

	.global gUnknown_089E8238
gUnknown_089E8238:  @ 0x089E8238
    .incbin "baserom.gba", 0x9E8238, 0xA8

	.global gUnknown_089E82E0
gUnknown_089E82E0:  @ 0x089E82E0
	.incbin "baserom.gba", 0x9E82E0, 0xA4

	.global gUnknown_089E8384
gUnknown_089E8384:  @ 0x089E8384
	.incbin "baserom.gba", 0x9E8384, 0x5C

	.global gUnknown_089E83E0
gUnknown_089E83E0:  @ 0x089E83E0
	.incbin "baserom.gba", 0x9E83E0, 0x54

	.global gUnknown_089E8434
gUnknown_089E8434:  @ 0x089E8434
	.incbin "baserom.gba", 0x9E8434, 0x50

	.global gUnknown_089E8484
gUnknown_089E8484:  @ 0x089E8484
	.incbin "baserom.gba", 0x9E8484, 0x50

	.global gUnknown_089E84D4
gUnknown_089E84D4:  @ 0x089E84D4
	.incbin "baserom.gba", 0x9E84D4, 0x20
