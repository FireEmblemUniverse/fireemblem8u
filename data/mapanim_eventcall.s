    .section .data


	.global gUnknown_089A43D4
gUnknown_089A43D4:  @ 0x089A43D4
@ replacing .incbin "baserom.gba", 0x009a43d4, 0x60
.4byte Pal_GorgonHatchCloud + 0x1ff4c
.4byte Pal_GorgonHatchCloud + 0x24c84
.4byte Pal_GorgonHatchCloud + 0x24d84
.4byte Pal_GorgonHatchCloud + 0x200d4
.4byte Pal_GorgonHatchCloud + 0x24ca4
.4byte Pal_GorgonHatchCloud + 0x24e4c
.4byte Pal_GorgonHatchCloud + 0x203e4
.4byte Pal_GorgonHatchCloud + 0x24cc4
.4byte Pal_GorgonHatchCloud + 0x24f38
.4byte Pal_GorgonHatchCloud + 0x2084c
.4byte Pal_GorgonHatchCloud + 0x24ce4
.4byte Pal_GorgonHatchCloud + 0x25050
.4byte Pal_GorgonHatchCloud + 0x21198
.4byte Pal_GorgonHatchCloud + 0x24d04
.4byte Pal_GorgonHatchCloud + 0x251c0
.4byte Pal_GorgonHatchCloud + 0x22348
.4byte Pal_GorgonHatchCloud + 0x24d24
.4byte Pal_GorgonHatchCloud + 0x25424
.4byte Pal_GorgonHatchCloud + 0x230dc
.4byte Pal_GorgonHatchCloud + 0x24d44
.4byte Pal_GorgonHatchCloud + 0x256cc
.4byte Pal_GorgonHatchCloud + 0x23f1c
.4byte Pal_GorgonHatchCloud + 0x24d64
.4byte Pal_GorgonHatchCloud + 0x259a4

	.global ProcScr_089A4434
ProcScr_089A4434:  @ 0x089A4434
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
        .word MapSpellAnim_CommonEnd
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global ProcScr_089A448C
ProcScr_089A448C:  @ 0x089A448C
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
.4byte Pal_GorgonHatchCloud + 0x25dc8
.4byte Pal_GorgonHatchCloud + 0x2cbb8
.4byte Pal_GorgonHatchCloud + 0x2cef8
.4byte Pal_GorgonHatchCloud + 0x25e4c
.4byte Pal_GorgonHatchCloud + 0x2cbd8
.4byte Pal_GorgonHatchCloud + 0x2cfb0
.4byte Pal_GorgonHatchCloud + 0x25ed8
.4byte Pal_GorgonHatchCloud + 0x2cbf8
.4byte Pal_GorgonHatchCloud + 0x2d06c
.4byte Pal_GorgonHatchCloud + 0x25f6c
.4byte Pal_GorgonHatchCloud + 0x2cc18
.4byte Pal_GorgonHatchCloud + 0x2d128
.4byte Pal_GorgonHatchCloud + 0x25ff8
.4byte Pal_GorgonHatchCloud + 0x2cc38
.4byte Pal_GorgonHatchCloud + 0x2d1e8
.4byte Pal_GorgonHatchCloud + 0x26088
.4byte Pal_GorgonHatchCloud + 0x2cc58
.4byte Pal_GorgonHatchCloud + 0x2d2a0
.4byte Pal_GorgonHatchCloud + 0x26108
.4byte Pal_GorgonHatchCloud + 0x2cc78
.4byte Pal_GorgonHatchCloud + 0x2d358
.4byte Pal_GorgonHatchCloud + 0x2696c
.4byte Pal_GorgonHatchCloud + 0x2cc98
.4byte Pal_GorgonHatchCloud + 0x2d53c
.4byte Pal_GorgonHatchCloud + 0x273ac
.4byte Pal_GorgonHatchCloud + 0x2ccb8
.4byte Pal_GorgonHatchCloud + 0x2d750
.4byte Pal_GorgonHatchCloud + 0x27ecc
.4byte Pal_GorgonHatchCloud + 0x2ccd8
.4byte Pal_GorgonHatchCloud + 0x2d994
.4byte Pal_GorgonHatchCloud + 0x289f4
.4byte Pal_GorgonHatchCloud + 0x2ccf8
.4byte Pal_GorgonHatchCloud + 0x2dc44
.4byte Pal_GorgonHatchCloud + 0x293bc
.4byte Pal_GorgonHatchCloud + 0x2cd18
.4byte Pal_GorgonHatchCloud + 0x2df28
.4byte Pal_GorgonHatchCloud + 0x2a090
.4byte Pal_GorgonHatchCloud + 0x2cd38
.4byte Pal_GorgonHatchCloud + 0x2e1cc
.4byte Pal_GorgonHatchCloud + 0x2ab58
.4byte Pal_GorgonHatchCloud + 0x2cd58
.4byte Pal_GorgonHatchCloud + 0x2e40c
.4byte Pal_GorgonHatchCloud + 0x2b3e4
.4byte Pal_GorgonHatchCloud + 0x2cd78
.4byte Pal_GorgonHatchCloud + 0x2e5dc
.4byte Pal_GorgonHatchCloud + 0x2bac4
.4byte Pal_GorgonHatchCloud + 0x2cd98
.4byte Pal_GorgonHatchCloud + 0x2e744
.4byte Pal_GorgonHatchCloud + 0x2bf60
.4byte Pal_GorgonHatchCloud + 0x2cdb8
.4byte Pal_GorgonHatchCloud + 0x2e860
.4byte Pal_GorgonHatchCloud + 0x2c280
.4byte Pal_GorgonHatchCloud + 0x2cdd8
.4byte Pal_GorgonHatchCloud + 0x2e950
.4byte Pal_GorgonHatchCloud + 0x2c3f4
.4byte Pal_GorgonHatchCloud + 0x2cdf8
.4byte Pal_GorgonHatchCloud + 0x2ea20
.4byte Pal_GorgonHatchCloud + 0x2c50c
.4byte Pal_GorgonHatchCloud + 0x2ce18
.4byte Pal_GorgonHatchCloud + 0x2eaec
.4byte Pal_GorgonHatchCloud + 0x2c624
.4byte Pal_GorgonHatchCloud + 0x2ce38
.4byte Pal_GorgonHatchCloud + 0x2ebbc
.4byte Pal_GorgonHatchCloud + 0x2c708
.4byte Pal_GorgonHatchCloud + 0x2ce58
.4byte Pal_GorgonHatchCloud + 0x2ec8c
.4byte Pal_GorgonHatchCloud + 0x2c7fc
.4byte Pal_GorgonHatchCloud + 0x2ce78
.4byte Pal_GorgonHatchCloud + 0x2ed58
.4byte Pal_GorgonHatchCloud + 0x2c914
.4byte Pal_GorgonHatchCloud + 0x2ce98
.4byte Pal_GorgonHatchCloud + 0x2ee24
.4byte Pal_GorgonHatchCloud + 0x2ca28
.4byte Pal_GorgonHatchCloud + 0x2ceb8
.4byte Pal_GorgonHatchCloud + 0x2eef0
.4byte Pal_GorgonHatchCloud + 0x2cb04
.4byte Pal_GorgonHatchCloud + 0x2ced8
.4byte Pal_GorgonHatchCloud + 0x2efbc

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
        .word MapSpellAnim_CommonEnd
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
        .word MapSpellAnim_CommonEnd
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
        .word MapSpellAnim_CommonEnd
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global ProcScr_GlowingCross
ProcScr_GlowingCross:  @ 0x089A470C
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


	.global ProcScr_GlowCrossExit
ProcScr_GlowCrossExit:  @ 0x089A4734
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
        .word MapSpellAnim_CommonEnd
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0
