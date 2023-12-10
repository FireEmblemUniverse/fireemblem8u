	.section .data

	.global gUnknown_085D6B20
gUnknown_085D6B20:  @ 0x085D6B20
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80ddccc
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806241C
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D6B38
gUnknown_085D6B38:  @ 0x085D6B38
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80ddcd8
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80625B0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D6B50
gUnknown_085D6B50:  @ 0x085D6B50
    .4byte gUnknown_0867EEB4 + 0xac8
    .4byte gUnknown_0867EEB4 + 0xbc4
    .4byte gUnknown_0867EEB4 + 0xcac
    .4byte gUnknown_0867EEB4 + 0xd94
    .4byte gUnknown_0867EEB4 + 0xe7c
    .4byte gUnknown_0867EEB4 + 0xf78
    .4byte gUnknown_0867EEB4 + 0x1060
    .4byte gUnknown_0867EEB4 + 0x10f8
    .4byte gUnknown_0867EEB4 + 0x11e0
    .4byte gUnknown_0867EEB4 + 0x1278
    .4byte gUnknown_0867EEB4 + 0x1360
    .4byte gUnknown_0867EEB4 + 0x145c
    .4byte gUnknown_0867EEB4 + 0x14f4
    .4byte gUnknown_0867EEB4 + 0x15dc
    .4byte gUnknown_0867EEB4 + 0x1674
    .4byte gUnknown_0867EEB4 + 0x1770
    .4byte gUnknown_0867EEB4 + 0x1808
    .4byte gUnknown_0867EEB4 + 0x1918

	.global gUnknown_085D6B98
gUnknown_085D6B98:  @ 0x085D6B98
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80ddd30
        @ PROC_SET_END_CB
        .short 0x4, 0x0
        .word sub_8062660
        @ PROC_SLEEP
        .short 0xe, 0x28
        .word 0x0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D6BB8
gUnknown_085D6BB8:  @ 0x085D6BB8
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80ddd40
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80626B4
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D6BD0
gUnknown_085D6BD0:  @ 0x085D6BD0
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80ddd4c
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8062840
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D6BE8
gUnknown_085D6BE8:  @ 0x085D6BE8
    .4byte gUnknown_086861A4 + 0x20
    .4byte gUnknown_086861A4 + 0xfc
    .4byte gUnknown_086861A4 + 0x1d8
    .4byte gUnknown_086861A4 + 0x2b4
    .4byte gUnknown_086861A4 + 0x390
    .4byte gUnknown_086861A4 + 0x46c
    .4byte gUnknown_086861A4 + 0x548
    .4byte gUnknown_086861A4 + 0x624
    .4byte gUnknown_086861A4 + 0x700
    .4byte gUnknown_086861A4 + 0x7dc
    .4byte gUnknown_086861A4 + 0x8b8
    .4byte gUnknown_086861A4 + 0x994
    .4byte gUnknown_086861A4 + 0xa70
    .4byte gUnknown_086861A4 + 0xb4c
    .4byte gUnknown_086861A4 + 0xc28
    .4byte gUnknown_086861A4 + 0xd04

	.global gUnknown_085D6C28
gUnknown_085D6C28:  @ 0x085D6C28
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dde5c
        @ PROC_SET_END_CB
        .short 0x4, 0x0
        .word sub_8062934
        @ PROC_SLEEP
        .short 0xe, 0x50
        .word 0x0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global ProcScr_efxSleepOBJ2
ProcScr_efxSleepOBJ2:  @ 0x085D6C48
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dde68
        @ PROC_SET_END_CB
        .short 0x4, 0x0
        .word sub_8062934
        @ PROC_SLEEP
        .short 0xe, 0xc8
        .word 0x0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global ProcScr_efxSleepSE
ProcScr_efxSleepSE:  @ 0x085D6C68
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dde78
        @ PROC_SET_END_CB
        .short 0x4, 0x0
        .word sub_8062988
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8062968
        @ PROC_SLEEP
        .short 0xe, 0x36
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8062968
        @ PROC_SLEEP
        .short 0xe, 0x41
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8062968
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global ProcScr_efxHammarne
ProcScr_efxHammarne:  @ 0x085D6CB0
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dde84
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80629D4
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global ProcScr_efxHammarneBG
ProcScr_efxHammarneBG:  @ 0x085D6CC8
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dde90
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8062B48
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D6CE0
gUnknown_085D6CE0:  @ 0x085D6CE0
    .4byte gUnknown_086810B8 + 0x20
    .4byte gUnknown_086810B8 + 0xcc
    .4byte gUnknown_086810B8 + 0x17c
    .4byte gUnknown_086810B8 + 0x23c
    .4byte gUnknown_086810B8 + 0x304
    .4byte gUnknown_086810B8 + 0x3dc
    .4byte gUnknown_086810B8 + 0x4b8
    .4byte gUnknown_086810B8 + 0x5a0
    .4byte gUnknown_086810B8 + 0x690
    .4byte gUnknown_086810B8 + 0x790
    .4byte gUnknown_086810B8 + 0x89c
    .4byte gUnknown_086810B8 + 0x9bc
    .4byte gUnknown_086810B8 + 0xaec

	.global gUnknown_085D6D14
gUnknown_085D6D14:  @ 0x085D6D14
    .4byte gUnknown_08678B20 + 0xfe4
    .4byte gUnknown_08678B20 + 0xfe4
    .4byte gUnknown_08678B20 + 0xfe4
    .4byte gUnknown_08678B20 + 0xfe4
    .4byte gUnknown_08678B20 + 0xfe4
    .4byte gUnknown_08678B20 + 0xfe4
    .4byte gUnknown_08678B20 + 0x1610
    .4byte gUnknown_08678B20 + 0x1610
    .4byte gUnknown_08678B20 + 0x1610
    .4byte gUnknown_08678B20 + 0x1d08
    .4byte gUnknown_08678B20 + 0x1d08
    .4byte gUnknown_08678B20 + 0x2328
    .4byte gUnknown_08678B20 + 0x2328

	.global ProcScr_efxHammarneOBJ
ProcScr_efxHammarneOBJ:  @ 0x085D6D48
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dded4
        @ PROC_SET_END_CB
        .short 0x4, 0x0
        .word sub_8062C04
        @ PROC_SLEEP
        .short 0xe, 0x50
        .word 0x0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global ProcScr_efxBerserk
ProcScr_efxBerserk:  @ 0x085D6D68
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80ddee4
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8062C50
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global ProcScr_efxBerserkBG
ProcScr_efxBerserkBG:  @ 0x085D6D80
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80ddef0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8062E44
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global ProcScr_efxBerserkCLONE
ProcScr_efxBerserkCLONE:  @ 0x085D6D98
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80ddf00
        @ PROC_SET_END_CB
        .short 0x4, 0x0
        .word sub_8062F3C
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8062ED8
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global ProcScr_efxBerserkOBJ
ProcScr_efxBerserkOBJ:  @ 0x085D6DB8
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80ddf10
        @ PROC_SET_END_CB
        .short 0x4, 0x0
        .word sub_8062FA4
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8062FBC
        @ PROC_SLEEP
        .short 0xe, 0x7
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80630E8
        @ PROC_SLEEP
        .short 0xe, 0x3
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8062FF8
        @ PROC_SLEEP
        .short 0xe, 0x7
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8063124
        @ PROC_SLEEP
        .short 0xe, 0x3
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8063034
        @ PROC_SLEEP
        .short 0xe, 0x7
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8063160
        @ PROC_SLEEP
        .short 0xe, 0x3
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8063070
        @ PROC_SLEEP
        .short 0xe, 0x7
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806319C
        @ PROC_SLEEP
        .short 0xe, 0x3
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80630AC
        @ PROC_SLEEP
        .short 0xe, 0x7
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80631D8
        @ PROC_SLEEP
        .short 0xe, 0x11
        .word 0x0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global ProcScr_efxMshield
ProcScr_efxMshield:  @ 0x085D6E70
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80ddf20
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8063250
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global ProcScr_efxMshieldBG
ProcScr_efxMshieldBG:  @ 0x085D6E88
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80ddf2c
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8063378
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D6EA0
gUnknown_085D6EA0:  @ 0x085D6EA0
    .4byte gUnknown_0868DF5C + 0x40
    .4byte gUnknown_0868DF5C + 0xf8
    .4byte gUnknown_0868DF5C + 0x1bc
    .4byte gUnknown_0868DF5C + 0x2ac
    .4byte gUnknown_0868DF5C + 0x3dc

	.global ProcScr_efxMshieldBGOBJ
ProcScr_efxMshieldBGOBJ:  @ 0x085D6EB4
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80de004
        @ PROC_SET_END_CB
        .short 0x4, 0x0
        .word sub_8063468
        @ PROC_SLEEP
        .short 0xe, 0xdc
        .word 0x0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global ProcScr_efxMshieldBGOBJ2
ProcScr_efxMshieldBGOBJ2:  @ 0x085D6ED4
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80de014
        @ PROC_SET_END_CB
        .short 0x4, 0x0
        .word sub_8063468
        @ PROC_SLEEP
        .short 0xe, 0x6e
        .word 0x0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0

	.global ProcScr_efxShine
ProcScr_efxShine:  @ 0x085D6EF4
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80de024
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80634BC
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global ProcScr_efxShineBG
ProcScr_efxShineBG:  @ 0x085D6F0C
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80de030
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80635E8
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D6F24
gUnknown_085D6F24:  @ 0x085D6F24
    .4byte gUnknown_087270B4

	.global gUnknown_085D6F28
gUnknown_085D6F28:  @ 0x085D6F28
    .4byte gUnknown_08727510

	.global gUnknown_085D6F2C
gUnknown_085D6F2C:  @ 0x085D6F2C
    .4byte gUnknown_08725DCC

	.global ProcScr_efxShineBG2
ProcScr_efxShineBG2:  @ 0x085D6F30
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80de044
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80636D8
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D6F48
gUnknown_085D6F48:  @ 0x085D6F48
    .4byte gUnknown_08727C48 + 0x20
    .4byte gUnknown_08727C48 + 0xd0
    .4byte gUnknown_08727C48 + 0x1d8
    .4byte gUnknown_08727C48 + 0x314
    .4byte gUnknown_08727C48 + 0x488
    .4byte gUnknown_08727C48 + 0x620
    .4byte gUnknown_08727C48 + 0x794
    .4byte gUnknown_08727C48 + 0x8a0
    .4byte gUnknown_08727C48 + 0x974

	.global ProcScr_efxShineBGCOL
ProcScr_efxShineBGCOL:  @ 0x085D6F6C
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80de078
        @ PROC_MARK
        .short 0xf, 0xa
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80637B0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global ProcScr_efxShineOBJRND
ProcScr_efxShineOBJRND:  @ 0x085D6F8C
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80de0a0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8063840
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D6FA4
gUnknown_085D6FA4:  @ 0x085D6FA4
	.incbin "baserom.gba", 0x5D6FA4, 0x10

	.global ProcScr_efxShineOBJ
ProcScr_efxShineOBJ:  @ 0x085D6FB4
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80de0b0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8063948
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global ProcScr_efxLuna
ProcScr_efxLuna:  @ 0x085D6FCC
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80de0bc
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80639B0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D6FE4
gUnknown_085D6FE4:  @ 0x085D6FE4
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80de0c4
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8063BC8
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D6FFC
gUnknown_085D6FFC:  @ 0x085D6FFC
    .4byte gUnknown_0872972C + 0x20

	.global gUnknown_085D7000
gUnknown_085D7000:  @ 0x085D7000
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80de0d4
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8063C40
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D7018
gUnknown_085D7018:  @ 0x085D7018
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80de0e0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8063D1C
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D7030
gUnknown_085D7030:  @ 0x085D7030
	.incbin "baserom.gba", 0x5D7030, 0xC0

	.global gUnknown_085D70F0
gUnknown_085D70F0:  @ 0x085D70F0
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80de0ec
        @ PROC_SET_END_CB
        .short 0x4, 0x0
        .word sub_8063E58
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8063E74
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D7110
gUnknown_085D7110:  @ 0x085D7110
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80de0f8
        @ PROC_MARK
        .short 0xf, 0xa
        .word 0x0
        @ PROC_SET_END_CB
        .short 0x4, 0x0
        .word sub_8063EE8
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8063EF8
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D7138
gUnknown_085D7138:  @ 0x085D7138
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80de144
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8063FC0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D7150
gUnknown_085D7150:  @ 0x085D7150
    .4byte gUnknown_0872CE60 + 0x20
    .4byte gUnknown_0872CE60 + 0xd4
    .4byte gUnknown_0872CE60 + 0x190
    .4byte gUnknown_0872CE60 + 0x26c
    .4byte gUnknown_0872CE60 + 0x354
    .4byte gUnknown_0872CE60 + 0x478
    .4byte gUnknown_0872CE60 + 0x598
    .4byte gUnknown_0872CE60 + 0x6a4
    .4byte gUnknown_0872CE60 + 0x7b0
    .4byte gUnknown_0872CE60 + 0x8ac
    .4byte gUnknown_0872CE60 + 0x9ac
    .4byte gUnknown_0872CE60 + 0xaa8

	.global gUnknown_085D7180
gUnknown_085D7180:  @ 0x085D7180
    .4byte gUnknown_0872A1BC + 0x1a4
    .4byte gUnknown_0872A1BC + 0x1a4
    .4byte gUnknown_0872A1BC + 0x1a4
    .4byte gUnknown_0872A1BC + 0x1a4
    .4byte gUnknown_0872A1BC + 0x1a4
    .4byte gUnknown_0872A1BC + 0x1a4
    .4byte gUnknown_0872A1BC + 0x1400
    .4byte gUnknown_0872A1BC + 0x1400
    .4byte gUnknown_0872A1BC + 0x1400
    .4byte gUnknown_0872A1BC + 0x20d4
    .4byte gUnknown_0872A1BC + 0x20d4
    .4byte gUnknown_0872A1BC + 0x20d4

	.global ProcScr_efxLunaOBJ
ProcScr_efxLunaOBJ:  @ 0x085D71B0
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80de184
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8064060
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80640D0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806416C
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80641F0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D71E0
gUnknown_085D71E0:  @ 0x085D71E0
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80de190
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80642BC
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D71F8
gUnknown_085D71F8:  @ 0x085D71F8
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80de19c
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8064344
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D7210
gUnknown_085D7210:  @ 0x085D7210
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80de1ac
        @ PROC_SET_END_CB
        .short 0x4, 0x0
        .word sub_806454C
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8064568
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80645FC
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806464C
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D7240
gUnknown_085D7240:  @ 0x085D7240
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80de1bc
        @ PROC_MARK
        .short 0xf, 0xa
        .word 0x0
        @ PROC_SET_END_CB
        .short 0x4, 0x0
        .word sub_80646B0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80646C0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D7268
gUnknown_085D7268:  @ 0x085D7268
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80de204
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8064720
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D7280
gUnknown_085D7280:  @ 0x085D7280
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80de214
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80647F0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D7298
gUnknown_085D7298:  @ 0x085D7298
	.incbin "baserom.gba", 0x5D7298, 0x100

	.global gUnknown_085D7398
gUnknown_085D7398:  @ 0x085D7398
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80de228
        @ PROC_SET_END_CB
        .short 0x4, 0x0
        .word sub_806491C
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8064938
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global ProcScr_efxExcaliburBGCOL2
ProcScr_efxExcaliburBGCOL2:  @ 0x085D73B8
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80de238
        @ PROC_MARK
        .short 0xf, 0xa
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806499C
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D73D8
gUnknown_085D73D8:  @ 0x085D73D8
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80de260
        @ PROC_SET_END_CB
        .short 0x4, 0x0
        .word sub_8064AC8
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8064AE4
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D73F8
gUnknown_085D73F8:  @ 0x085D73F8
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80de270
        @ PROC_MARK
        .short 0xf, 0xa
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8064B48
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D7418
gUnknown_085D7418:  @ 0x085D7418
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80de298
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8064BFC
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D7430
gUnknown_085D7430:  @ 0x085D7430
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80de2a8
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8064C80
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D7448
gUnknown_085D7448:  @ 0x085D7448
    .4byte gUnknown_08723208 + 0x6c

	.global gUnknown_085D744C
gUnknown_085D744C:  @ 0x085D744C
    .4byte gUnknown_08724424 + 0x20

	.global gUnknown_085D7450
gUnknown_085D7450:  @ 0x085D7450
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80de2c0
        @ PROC_SET_END_CB
        .short 0x4, 0x0
        .word sub_8064DA8
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8064DC4
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global ProcScr_efxGespenstBGCOL2
ProcScr_efxGespenstBGCOL2:  @ 0x085D7470
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80de2d0
        @ PROC_MARK
        .short 0xf, 0xa
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8064E2C
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D7490
gUnknown_085D7490:  @ 0x085D7490
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80de334
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8064EB0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D74A8
gUnknown_085D74A8:  @ 0x085D74A8
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80de33c
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80651C4
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D74C0
gUnknown_085D74C0:  @ 0x085D74C0
    .4byte gUnknown_0873313C + 0x20
    .4byte gUnknown_0873313C + 0xc0
    .4byte gUnknown_0873313C + 0x168
    .4byte gUnknown_0873313C + 0x210
    .4byte gUnknown_0873313C + 0x2bc
    .4byte gUnknown_0873313C + 0x374
    .4byte gUnknown_0873313C + 0x42c
    .4byte gUnknown_0873313C + 0x4dc
    .4byte gUnknown_0873313C + 0x588
    .4byte gUnknown_0873313C + 0x630
    .4byte gUnknown_0873313C + 0x6d0
    .4byte gUnknown_0873313C + 0x76c
    .4byte gUnknown_0873313C + 0x804
    .4byte gUnknown_0873313C + 0x91c
    .4byte gUnknown_0873313C + 0xa58
    .4byte gUnknown_0873313C + 0xba8
    .4byte gUnknown_0873313C + 0xce4
    .4byte gUnknown_0873313C + 0xde8
    .4byte gUnknown_0873313C + 0xe8c
    .4byte gUnknown_0873313C + 0xf28
    .4byte gUnknown_0873313C + 0xfc4
    .4byte gUnknown_0873313C + 0x1060
    .4byte gUnknown_0873313C + 0x10fc
    .4byte gUnknown_0873313C + 0x1198
    .4byte gUnknown_0873313C + 0x1254
    .4byte gUnknown_0873313C + 0x1344
    .4byte gUnknown_0873313C + 0x1448
    .4byte gUnknown_0873313C + 0x154c

	.global gUnknown_085D7530
gUnknown_085D7530:  @ 0x085D7530
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80de3c0
        @ PROC_SET_END_CB
        .short 0x4, 0x0
        .word sub_8065300
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806531C
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D7550
gUnknown_085D7550:  @ 0x085D7550
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80de3cc
        @ PROC_MARK
        .short 0xf, 0xa
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8065384
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D7570
gUnknown_085D7570:  @ 0x085D7570
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80de3ec
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806542C
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D7588
gUnknown_085D7588:  @ 0x085D7588
    .4byte gUnknown_0874394C + 0x20
    .4byte gUnknown_0874394C + 0x298
    .4byte gUnknown_0874394C + 0x510
    .4byte gUnknown_0874394C + 0x788
    .4byte gUnknown_0874394C + 0xa00
    .4byte gUnknown_0874394C + 0xc70
    .4byte gUnknown_0874394C + 0xecc
    .4byte gUnknown_0874394C + 0x1144
    .4byte gUnknown_0874394C + 0x13bc
    .4byte gUnknown_0874394C + 0x1634
    .4byte gUnknown_0874394C + 0x18ac
    .4byte gUnknown_0874394C + 0x1b24

	.global gUnknown_085D75B8
gUnknown_085D75B8:  @ 0x085D75B8
    .4byte gUnknown_0873313C + 0x1650
    .4byte gUnknown_0873313C + 0x2a64
    .4byte gUnknown_0873313C + 0x3f90
    .4byte gUnknown_0873313C + 0x550c
    .4byte gUnknown_0873313C + 0x6a94
    .4byte gUnknown_0873313C + 0x7e84
    .4byte gUnknown_0873313C + 0x9190
    .4byte gUnknown_0873313C + 0xa504
    .4byte gUnknown_0873313C + 0xb9f0
    .4byte gUnknown_0873313C + 0xcd9c
    .4byte gUnknown_0873313C + 0xe14c
    .4byte gUnknown_0873313C + 0xf468

	.global gUnknown_085D75E8
gUnknown_085D75E8:  @ 0x085D75E8
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80de46c
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80654F8
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D7600
gUnknown_085D7600:  @ 0x085D7600
    .4byte gUnknown_0874670C + 0x54
    .4byte gUnknown_0874670C + 0x864
    .4byte gUnknown_0874670C + 0x1570
    .4byte gUnknown_0874670C + 0x2790
    .4byte gUnknown_0874670C + 0x369c
    .4byte gUnknown_0874670C + 0x4784
    .4byte gUnknown_0874670C + 0x589c
    .4byte gUnknown_0874670C + 0x678c
    .4byte gUnknown_0874670C + 0x7a04
    .4byte gUnknown_0874670C + 0x8d68

	.global gUnknown_085D7628
gUnknown_085D7628:  @ 0x085D7628
    .4byte gUnknown_08750268 + 0x20
    .4byte gUnknown_08750268 + 0x17c
    .4byte gUnknown_08750268 + 0x35c
    .4byte gUnknown_08750268 + 0x5a8
    .4byte gUnknown_08750268 + 0x7d0
    .4byte gUnknown_08750268 + 0xa20
    .4byte gUnknown_08750268 + 0xc94
    .4byte gUnknown_08750268 + 0xec0
    .4byte gUnknown_08750268 + 0x1104
    .4byte gUnknown_08750268 + 0x135c

	.global gUnknown_085D7650
gUnknown_085D7650:  @ 0x085D7650
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80de4a8
        @ PROC_SET_END_CB
        .short 0x4, 0x0
        .word sub_8065624
        @ PROC_SLEEP
        .short 0xe, 0xd
        .word 0x0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global ProcScr_efxDancepara
ProcScr_efxDancepara:  @ 0x085D7670
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80de4bc
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8065724
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0
