	.section .data

	.global ProcScr_efxDarkLongMons
ProcScr_efxDarkLongMons:  @ 0x085D89A0
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80def68
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806AF30
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D89B8
gUnknown_085D89B8:  @ 0x085D89B8
    .4byte gUnknown_086DA920 + 0xbbc0
    .4byte gUnknown_086DA920 + 0xbccc
    .4byte gUnknown_086DA920 + 0xbdfc
    .4byte gUnknown_086DA920 + 0xbf40
    .4byte gUnknown_086DA920 + 0xc0a8
    .4byte gUnknown_086DA920 + 0xc218
    .4byte gUnknown_086DA920 + 0xc3a4
    .4byte gUnknown_086DA920 + 0xc540
    .4byte gUnknown_086DA920 + 0xc6ec
    .4byte gUnknown_086DA920 + 0xc89c
    .4byte gUnknown_086DA920 + 0xca60
    .4byte gUnknown_086DA920 + 0xcc30
    .4byte gUnknown_086DA920 + 0xce10
    .4byte gUnknown_086DA920 + 0xcff4
    .4byte gUnknown_086DA920 + 0xd1dc
    .4byte gUnknown_086DA920 + 0xd3b8

	.global gUnknown_085D89F8
gUnknown_085D89F8:  @ 0x085D89F8
    .4byte gUnknown_086DA920 + 0x614
    .4byte gUnknown_086DA920 + 0xe40
    .4byte gUnknown_086DA920 + 0x1744
    .4byte gUnknown_086DA920 + 0x2144
    .4byte gUnknown_086DA920 + 0x2c78
    .4byte gUnknown_086DA920 + 0x3848
    .4byte gUnknown_086DA920 + 0x4470
    .4byte gUnknown_086DA920 + 0x50d8
    .4byte gUnknown_086DA920 + 0x5cd0
    .4byte gUnknown_086DA920 + 0x6974
    .4byte gUnknown_086DA920 + 0x7634
    .4byte gUnknown_086DA920 + 0x82c8
    .4byte gUnknown_086DA920 + 0x8f08
    .4byte gUnknown_086DA920 + 0x9b00
    .4byte gUnknown_086DA920 + 0xa670
    .4byte gUnknown_086DA920 + 0xb110

	.global gUnknown_085D8A38
gUnknown_085D8A38:  @ 0x085D8A38
    .4byte gUnknown_086DA920 + 0xbb20
    .4byte gUnknown_086DA920 + 0xbb20
    .4byte gUnknown_086DA920 + 0xbb20
    .4byte gUnknown_086DA920 + 0xbb20
    .4byte gUnknown_086DA920 + 0xbb20
    .4byte gUnknown_086DA920 + 0xbb20
    .4byte gUnknown_086DA920 + 0xbb20
    .4byte gUnknown_086DA920 + 0xbb20
    .4byte gUnknown_086DA920 + 0xbb20
    .4byte gUnknown_086DA920 + 0xbb20
    .4byte gUnknown_086DA920 + 0xbb20
    .4byte gUnknown_086DA920 + 0xbb40
    .4byte gUnknown_086DA920 + 0xbb40
    .4byte gUnknown_086DA920 + 0xbb60
    .4byte gUnknown_086DA920 + 0xbb80
    .4byte gUnknown_086DA920 + 0xbba0

	.global ProcScr_efxDarkLongMonsBG01
ProcScr_efxDarkLongMonsBG01:  @ 0x085D8A78
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80defbc
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806B0AC
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806B11C
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D8A98
gUnknown_085D8A98:  @ 0x085D8A98
    .4byte gUnknown_086E91B8 + 0x20
    .4byte gUnknown_086E91B8 + 0xc4
    .4byte gUnknown_086E91B8 + 0x1a0
    .4byte gUnknown_086E91B8 + 0x2bc
    .4byte gUnknown_086E91B8 + 0x41c
    .4byte gUnknown_086E91B8 + 0x5a0
    .4byte gUnknown_086E91B8 + 0x72c
    .4byte gUnknown_086E91B8 + 0x8ac
    .4byte gUnknown_086E91B8 + 0xa1c

	.global ProcScr_efxDarkLongMonsBG02
ProcScr_efxDarkLongMonsBG02:  @ 0x085D8ABC
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80df010
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806B194
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global ProcScr_efxDarkLongMonsOBJ
ProcScr_efxDarkLongMonsOBJ:  @ 0x085D8AD4
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80df024
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806B24C
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D8AEC
gUnknown_085D8AEC:  @ 0x085D8AEC
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_806B33C
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806B344
        @ PROC_CALL
        .short 0x2, 0x0
        .word EnablePaletteSync
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global ProcScr_efxGorgon
ProcScr_efxGorgon:  @ 0x085D8B0C
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80df038
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806B534
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D8B24
gUnknown_085D8B24:  @ 0x085D8B24
        @ PROC_SET_END_CB
        .short 0x4, 0x0
        .word sub_806B64C
        @ PROC_SLEEP
        .short 0xe, 0x19
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806B664
        @ PROC_SLEEP
        .short 0xe, 0x36
        .word 0x0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D8B4C
gUnknown_085D8B4C:  @ 0x085D8B4C
    .4byte gUnknown_086EAE24 + 0x5520
    .4byte gUnknown_086EAE24 + 0x55c8
    .4byte gUnknown_086EAE24 + 0x5694
    .4byte gUnknown_086EAE24 + 0x577c
    .4byte gUnknown_086EAE24 + 0x5878
    .4byte gUnknown_086EAE24 + 0x5978
    .4byte gUnknown_086EAE24 + 0x5a94
    .4byte gUnknown_086EAE24 + 0x5bbc
    .4byte gUnknown_086EAE24 + 0x5d08
    .4byte gUnknown_086EAE24 + 0x5e64
    .4byte gUnknown_086EAE24 + 0x5fd4

	.global gUnknown_085D8B78
gUnknown_085D8B78:  @ 0x085D8B78
    .4byte gUnknown_086EAE24 + 0xa90
    .4byte gUnknown_086EAE24 + 0xf20
    .4byte gUnknown_086EAE24 + 0x1440
    .4byte gUnknown_086EAE24 + 0x19b0
    .4byte gUnknown_086EAE24 + 0x1fb4
    .4byte gUnknown_086EAE24 + 0x2600
    .4byte gUnknown_086EAE24 + 0x2cd4
    .4byte gUnknown_086EAE24 + 0x3438
    .4byte gUnknown_086EAE24 + 0x3bd4
    .4byte gUnknown_086EAE24 + 0x43b8
    .4byte gUnknown_086EAE24 + 0x4ba4

	.global gUnknown_085D8BA4
gUnknown_085D8BA4:  @ 0x085D8BA4
    .4byte gUnknown_086EAE24 + 0x53c0
    .4byte gUnknown_086EAE24 + 0x53e0
    .4byte gUnknown_086EAE24 + 0x5400
    .4byte gUnknown_086EAE24 + 0x5420
    .4byte gUnknown_086EAE24 + 0x5440
    .4byte gUnknown_086EAE24 + 0x5460
    .4byte gUnknown_086EAE24 + 0x5480
    .4byte gUnknown_086EAE24 + 0x54a0
    .4byte gUnknown_086EAE24 + 0x54c0
    .4byte gUnknown_086EAE24 + 0x54e0
    .4byte gUnknown_086EAE24 + 0x5500

	.global ProcScr_efxGorgonBGDirt
ProcScr_efxGorgonBGDirt:  @ 0x085D8BD0
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80df070
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806B73C
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D8BE8
gUnknown_085D8BE8:  @ 0x085D8BE8
    .4byte gUnknown_086EAE24 + 0x9c74
    .4byte gUnknown_086EAE24 + 0x9ea8
    .4byte gUnknown_086EAE24 + 0xa0b4

	.global gUnknown_085D8BF4
gUnknown_085D8BF4:  @ 0x085D8BF4
    .4byte gUnknown_086EAE24 + 0x6148
    .4byte gUnknown_086EAE24 + 0x76a4
    .4byte gUnknown_086EAE24 + 0x8a0c

	.global gUnknown_085D8C00
gUnknown_085D8C00:  @ 0x085D8C00
    .4byte gUnknown_086EAE24 + 0x9c14
    .4byte gUnknown_086EAE24 + 0x9c34
    .4byte gUnknown_086EAE24 + 0x9c54

	.global ProcScr_efxGorgonBGTwister
ProcScr_efxGorgonBGTwister:  @ 0x085D8C0C
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80df09c
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806B830
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D8C24
gUnknown_085D8C24:  @ 0x085D8C24
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_806B938
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806B940
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806BACC
        @ PROC_CALL
        .short 0x2, 0x0
        .word EnablePaletteSync
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global ProcScr_efxGorgonOBJTwisterPiece
ProcScr_efxGorgonOBJTwisterPiece:  @ 0x085D8C4C
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80df0b0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806BBF0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global ProcScr_efxGorgonOBJTwister
ProcScr_efxGorgonOBJTwister:  @ 0x085D8C64
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80df0cc
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806BD94
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D8C7C
gUnknown_085D8C7C:  @ 0x085D8C7C
    .4byte gUnknown_086FDA44 + 0x20
    .4byte gUnknown_086FDA44 + 0xc4
    .4byte gUnknown_086FDA44 + 0x29c
    .4byte gUnknown_086FDA44 + 0x480
    .4byte gUnknown_086FDA44 + 0x690
    .4byte gUnknown_086FDA44 + 0x8dc
    .4byte gUnknown_086FDA44 + 0xa9c
    .4byte gUnknown_086FDA44 + 0xc3c
    .4byte gUnknown_086FDA44 + 0xdd8

	.global gUnknown_085D8CA0
gUnknown_085D8CA0:  @ 0x085D8CA0
    .4byte gUnknown_086EAE24 + 0xa2b0
    .4byte gUnknown_086EAE24 + 0xb440
    .4byte gUnknown_086EAE24 + 0xc32c
    .4byte gUnknown_086EAE24 + 0xd294
    .4byte gUnknown_086EAE24 + 0xe338
    .4byte gUnknown_086EAE24 + 0xf52c
    .4byte gUnknown_086EAE24 + 0x10258
    .4byte gUnknown_086EAE24 + 0x10ec4
    .4byte gUnknown_086EAE24 + 0x11f34

	.global ProcScr_efxGorgonBGFinish
ProcScr_efxGorgonBGFinish:  @ 0x085D8CC4
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80df108
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806C050
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806B11C
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0

	.global gUnknown_085D8CE4
gUnknown_085D8CE4:  @ 0x085D8CE4
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_806C14C
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806C154
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806C1B8
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806C2D4
        @ PROC_CALL
        .short 0x2, 0x0
        .word EnablePaletteSync
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D8D14
gUnknown_085D8D14:  @ 0x085D8D14
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_806C14C
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806C478
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806C1B8
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806C2D4
        @ PROC_CALL
        .short 0x2, 0x0
        .word EnablePaletteSync
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0
