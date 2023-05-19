	.section .data

	.global ProcScr_efxALPHA
ProcScr_efxALPHA:  @ 0x085D5028
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dc8a0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word EfxALPHAMain
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global ProcScr_efxCircleWIN
ProcScr_efxCircleWIN:  @ 0x085D5040
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dc8ac
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word EfxCircleWINMain
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global ProcScr_efxMagicQUAKE
ProcScr_efxMagicQUAKE:  @ 0x085D5058
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dc8bc
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word Loop6C_efxMagicQUAKE
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global ProcScr_efxDummymagic
ProcScr_efxDummymagic:  @ 0x085D5070
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dc8cc
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word Loop6C_efxDummymagic
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global ProcScr_efxTeono
ProcScr_efxTeono:  @ 0x085D5088
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dc8dc
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_805BF40
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global ProcScr_efxTeonoOBJ
ProcScr_efxTeonoOBJ:  @ 0x085D50A0
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dc8e8
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_805C080
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_805C0DC
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global ProcScr_efxTeonoOBJ2
ProcScr_efxTeonoOBJ2:  @ 0x085D50C0
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dc8f4
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_805C188
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global ProcScr_efxTeonoSE
ProcScr_efxTeonoSE:  @ 0x085D50D8
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dc904
        @ PROC_SET_END_CB
        .short 0x4, 0x0
        .word sub_805C20C
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_805C21C
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global ProcScr_efxArrow
ProcScr_efxArrow:  @ 0x085D50F8
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dc910
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_805C29C
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global ProcScr_efxArrowOBJ
ProcScr_efxArrowOBJ:  @ 0x085D5110
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dc91c
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_805C3C0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global ProcScr_efxTeyari
ProcScr_efxTeyari:  @ 0x085D5128
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dc928
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_805C7E4
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global ProcScr_efxTeyariOBJ
ProcScr_efxTeyariOBJ:  @ 0x085D5140
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dc934
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_805C904
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global ProcScr_efxSong
ProcScr_efxSong:  @ 0x085D5158
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dc944
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_805C96C
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global ProcScr_efxSongBG
ProcScr_efxSongBG:  @ 0x085D5170
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dc94c
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_805CAC4
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D5188
gUnknown_085D5188:  @ 0x085D5188
    .4byte gUnknown_08754870 + 0xa0
    .4byte gUnknown_08754870 + 0x148
    .4byte gUnknown_08754870 + 0x1f4
    .4byte gUnknown_08754870 + 0x2a4
    .4byte gUnknown_08754870 + 0x368
    .4byte gUnknown_08754870 + 0x434
    .4byte gUnknown_08754870 + 0x50c
    .4byte gUnknown_08754870 + 0x5ec
    .4byte gUnknown_08754870 + 0x6cc
    .4byte gUnknown_08754870 + 0x7b8
    .4byte gUnknown_08754870 + 0x8ac
    .4byte gUnknown_08754870 + 0x9a8
    .4byte gUnknown_08754870 + 0xaa0
    .4byte gUnknown_08754870 + 0xba0
    .4byte gUnknown_08754870 + 0xca0
    .4byte gUnknown_08754870 + 0xda0
    .4byte gUnknown_08754870 + 0xea4
    .4byte gUnknown_08754870 + 0xf94
    .4byte gUnknown_08754870 + 0x107c
    .4byte gUnknown_08754870 + 0x1160
    .4byte gUnknown_08754870 + 0x1248
    .4byte gUnknown_08754870 + 0x1324
    .4byte gUnknown_08754870 + 0x13f4
    .4byte gUnknown_08754870 + 0x14b0
    .4byte gUnknown_08754870 + 0x1570
    .4byte gUnknown_08754870 + 0x1624
    .4byte gUnknown_08754870 + 0x16cc

	.global gUnknown_085D51F4
gUnknown_085D51F4:  @ 0x085D51F4
    .4byte gUnknown_08752020 + 0x24
    .4byte gUnknown_08752020 + 0x24
    .4byte gUnknown_08752020 + 0x24
    .4byte gUnknown_08752020 + 0x24
    .4byte gUnknown_08752020 + 0x24
    .4byte gUnknown_08752020 + 0x24
    .4byte gUnknown_08752020 + 0x24
    .4byte gUnknown_08752020 + 0x24
    .4byte gUnknown_08752020 + 0x24
    .4byte gUnknown_08752020 + 0x24
    .4byte gUnknown_08752020 + 0xbf0
    .4byte gUnknown_08752020 + 0xbf0
    .4byte gUnknown_08752020 + 0xbf0
    .4byte gUnknown_08752020 + 0xbf0
    .4byte gUnknown_08752020 + 0xbf0
    .4byte gUnknown_08752020 + 0x182c
    .4byte gUnknown_08752020 + 0x182c
    .4byte gUnknown_08752020 + 0x182c
    .4byte gUnknown_08752020 + 0x182c
    .4byte gUnknown_08752020 + 0x182c
    .4byte gUnknown_08752020 + 0x182c
    .4byte gUnknown_08752020 + 0x182c
    .4byte gUnknown_08752020 + 0x22fc
    .4byte gUnknown_08752020 + 0x22fc
    .4byte gUnknown_08752020 + 0x22fc
    .4byte gUnknown_08752020 + 0x22fc
    .4byte gUnknown_08752020 + 0x22fc

	.global ProcScr_efxSongOBJ
ProcScr_efxSongOBJ:  @ 0x085D5260
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dc9c4
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_805CBA8
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global ProcScr_efxDance
ProcScr_efxDance:  @ 0x085D5278
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dc9d0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_805CC14
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global ProcScr_efxShooter
ProcScr_efxShooter:  @ 0x085D5290
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dc9dc
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_805CD5C
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global ProcScr_efxShooterOBJ
ProcScr_efxShooterOBJ:  @ 0x085D52A8
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dc9e8
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_805CE94
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global ProcScr_efxHurtmut
ProcScr_efxHurtmut:  @ 0x085D52C0
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dc9f8
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_805CF04
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global ProcScr_efxHurtmutOBJ
ProcScr_efxHurtmutOBJ:  @ 0x085D52D8
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dca04
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_805D030
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0

	.global ProcScr_efxFirebreath
ProcScr_efxFirebreath:  @ 0x085D52F0
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dca14
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_805D09C
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global ProcScr_efxFirebreathOBJ
ProcScr_efxFirebreathOBJ:  @ 0x085D5308
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dca24
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_805D1FC
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global ProcScr_efxFirebreathBG
ProcScr_efxFirebreathBG:  @ 0x085D5320
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dca38
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_805D2B4
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global ProcScr_efxFirebreathBGCOL
ProcScr_efxFirebreathBGCOL:  @ 0x085D5338
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dca48
        @ PROC_MARK
        .short 0xf, 0xa
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_805D328
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D5358
gUnknown_085D5358:  @ 0x085D5358
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dcb38
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_805D3C4
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D5370
gUnknown_085D5370:  @ 0x085D5370
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dcb48
        @ PROC_SET_END_CB
        .short 0x4, 0x0
        .word sub_805D4B8
        @ PROC_SLEEP
        .short 0xe, 0x34
        .word 0x0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D5390
gUnknown_085D5390:  @ 0x085D5390
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dcb58
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word Loop6C_efxDarkbreath
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D53A8
gUnknown_085D53A8:  @ 0x085D53A8
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dcb68
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_805D5EC
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D53C0
gUnknown_085D53C0:  @ 0x085D53C0
    .4byte gUnknown_085E5AE4 + 0x9f4
    .4byte gUnknown_085E5AE4 + 0xadc
    .4byte gUnknown_085E5AE4 + 0xb98
    .4byte gUnknown_085E5AE4 + 0xc94
    .4byte gUnknown_085E5AE4 + 0xd7c
    .4byte gUnknown_085E5AE4 + 0xe64
    .4byte gUnknown_085E5AE4 + 0xf60
    .4byte gUnknown_085E5AE4 + 0x108c
    .4byte gUnknown_085E5AE4 + 0x11c0
    .4byte gUnknown_085E5AE4 + 0x1284
    .4byte gUnknown_085E5AE4 + 0x13b0
    .4byte gUnknown_085E5AE4 + 0x14ac

	.global gUnknown_085D53F0
gUnknown_085D53F0:  @ 0x085D53F0
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dcbc0
        @ PROC_MARK
        .short 0xf, 0xa
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_805D680
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global ProcScr_efxDarkbreathOBJ
ProcScr_efxDarkbreathOBJ:  @ 0x085D5410
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dcc78
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_805D774
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0
