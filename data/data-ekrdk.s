        .section .data

	.global ProcScr_ekrDragonBodyUnk4
ProcScr_ekrDragonBodyUnk4:  @ 0x087F44E0
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word EkrDragonBodyUnk4Main
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global ProcScr_ekrDragonBodvBlack
ProcScr_ekrDragonBodvBlack:  @ 0x087F44F8
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80e83a8
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8077310
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8077394
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_087F4518
gUnknown_087F4518:  @ 0x087F4518
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80773BC
        @ PROC_START_CHILD
        .short 0x5, 0x0
        .word gUnknown_08801810
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80773E4
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8077460
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global ProcScr_ekrDragonTunkFace
ProcScr_ekrDragonTunkFace:  @ 0x087F4548
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80e83bc
        @ PROC_SET_END_CB
        .short 0x4, 0x0
        .word sub_8077678
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_807759C
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80775E8
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_807766C
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global ProcScr_ekrDragonTunk
ProcScr_ekrDragonTunk:  @ 0x087F4578
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80e83d0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80777E0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_807789C
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8077AA8
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global ProcScr_ekrWhiteOUT
ProcScr_ekrWhiteOUT:  @ 0x087F45A0
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80e83e0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8077AEC
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8077B5C
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8077BB4
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8077C24
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_087F45D0
gUnknown_087F45D0:  @ 0x087F45D0
	.incbin "baserom.gba", 0x7F45D0, 0x1C8

	.global Img_DemonKingBG
Img_DemonKingBG:  @ 0x087F4798
	.incbin "baserom.gba", 0x7F4798, 0x31F4

	.global Tsa_DemonKingBG1
Tsa_DemonKingBG1:  @ 0x087F798C
	.incbin "baserom.gba", 0x7F798C, 0x43C

	.global Tsa_DemonKingBG2
Tsa_DemonKingBG2:  @ 0x087F7DC8
	.incbin "baserom.gba", 0x7F7DC8, 0x408

	.global Tsa_DemonKingBG3
Tsa_DemonKingBG3:  @ 0x087F7DC8
	.incbin "baserom.gba", 0x7F81D0, 0x40C

	.global Pal_DemonKingBG
Pal_DemonKingBG:  @ 0x087F85DC
	.incbin "baserom.gba", 0x7F85DC, 0x6EAC

	.global gUnknown_087FF488
gUnknown_087FF488:  @ 0x087FF488
	.incbin "baserom.gba", 0x7FF488, 0x11C4

	.global gUnknown_0880064C
gUnknown_0880064C:  @ 0x0880064C
	.incbin "baserom.gba", 0x80064C, 0x1194

	.global gUnknown_088017E0
gUnknown_088017E0:  @ 0x088017E0
	.incbin "baserom.gba", 0x8017E0, 0x20

	.global gUnknown_08801800
gUnknown_08801800:  @ 0x08801800
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8077D30
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8077D38

	.global gUnknown_08801810
gUnknown_08801810:  @ 0x08801810
        @ PROC_SET_END_CB
        .short 0x4, 0x0
        .word sub_8077E9C
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8077DC8
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8077E64
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8077E6C
        @ PROC_WHILE_EXISTS
        .short 0x8, 0x0
        .word gUnknown_08801840
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0

	.global gUnknown_08801840
gUnknown_08801840:  @ 0x08801840
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8077F04
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8077F10
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08801858
gUnknown_08801858:  @ 0x08801858
	.incbin "baserom.gba", 0x801858, 0x8

	.global gUnknown_08801860
gUnknown_08801860:  @ 0x08801860
	.incbin "baserom.gba", 0x801860, 0x8

	.global ProcScr_ekrSelfThunder
ProcScr_ekrSelfThunder:  @ 0x08801868
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80e83f0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8078078
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global ProcScr_ekrSelfThunderBG
ProcScr_ekrSelfThunderBG:  @ 0x08801880
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80e8400
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8078174
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_807819C
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_088018A0
gUnknown_088018A0:  @ 0x088018A0
@ Replacing .incbin "baserom.gba", 0x8018A0, 0x20C
    .4byte 0x00000004
    .4byte Pal_DemonKingBG + 0x20
    .4byte Pal_DemonKingBG + 0x4364
    .4byte Pal_DemonKingBG + 0x5938
    .4byte Pal_DemonKingBG + 0x6e6c
    .4byte 0x00000004
    .4byte Pal_DemonKingBG + 0x2c4
    .4byte Pal_DemonKingBG + 0x4490
    .4byte Pal_DemonKingBG + 0x5a60
    .4byte Pal_DemonKingBG + 0x6e6c
    .4byte 0x00000004
    .4byte Pal_DemonKingBG + 0x6ac
    .4byte Pal_DemonKingBG + 0x45dc
    .4byte Pal_DemonKingBG + 0x5ba0
    .4byte Pal_DemonKingBG + 0x6e6c
    .4byte 0x00000004
    .4byte Pal_DemonKingBG + 0xb70
    .4byte Pal_DemonKingBG + 0x4758
    .4byte Pal_DemonKingBG + 0x5cf8
    .4byte Pal_DemonKingBG + 0x6e6c
    .4byte 0x00000004
    .4byte Pal_DemonKingBG + 0x1120
    .4byte Pal_DemonKingBG + 0x48dc
    .4byte Pal_DemonKingBG + 0x5e58
    .4byte Pal_DemonKingBG + 0x6e6c
    .4byte 0x00000004
    .4byte Pal_DemonKingBG + 0x1714
    .4byte Pal_DemonKingBG + 0x4a74
    .4byte Pal_DemonKingBG + 0x5fd0
    .4byte Pal_DemonKingBG + 0x6e6c
    .4byte 0x00000004
    .4byte Pal_DemonKingBG + 0x1c90
    .4byte Pal_DemonKingBG + 0x4bf8
    .4byte Pal_DemonKingBG + 0x6140
    .4byte Pal_DemonKingBG + 0x6e6c
    .4byte 0x00000004
    .4byte Pal_DemonKingBG + 0x21f4
    .4byte Pal_DemonKingBG + 0x4d7c
    .4byte Pal_DemonKingBG + 0x62bc
    .4byte Pal_DemonKingBG + 0x6e6c
    .4byte 0x00000004
    .4byte Pal_DemonKingBG + 0x26cc
    .4byte Pal_DemonKingBG + 0x4ef0
    .4byte Pal_DemonKingBG + 0x642c
    .4byte Pal_DemonKingBG + 0x6e6c
    .4byte 0x00000004
    .4byte Pal_DemonKingBG + 0x2b0c
    .4byte Pal_DemonKingBG + 0x5048
    .4byte Pal_DemonKingBG + 0x6584
    .4byte Pal_DemonKingBG + 0x6e6c
    .4byte 0x00000004
    .4byte Pal_DemonKingBG + 0x2eb4
    .4byte Pal_DemonKingBG + 0x518c
    .4byte Pal_DemonKingBG + 0x66c4
    .4byte Pal_DemonKingBG + 0x6e6c
    .4byte 0x00000004
    .4byte Pal_DemonKingBG + 0x3254
    .4byte Pal_DemonKingBG + 0x52d4
    .4byte Pal_DemonKingBG + 0x680c
    .4byte Pal_DemonKingBG + 0x6e6c
    .4byte 0x00000004
    .4byte Pal_DemonKingBG + 0x35b0
    .4byte Pal_DemonKingBG + 0x5410
    .4byte Pal_DemonKingBG + 0x6944
    .4byte Pal_DemonKingBG + 0x6e6c
    .4byte 0x00000004
    .4byte Pal_DemonKingBG + 0x3908
    .4byte Pal_DemonKingBG + 0x5548
    .4byte Pal_DemonKingBG + 0x6a7c
    .4byte Pal_DemonKingBG + 0x6e6c
    .4byte 0x00000004
    .4byte Pal_DemonKingBG + 0x3cac
    .4byte Pal_DemonKingBG + 0x569c
    .4byte Pal_DemonKingBG + 0x6bd0
    .4byte Pal_DemonKingBG + 0x6e8c
    .4byte 0x00000004
    .4byte Pal_DemonKingBG + 0x4014
    .4byte Pal_DemonKingBG + 0x57ec
    .4byte Pal_DemonKingBG + 0x6d1c
    .4byte Pal_DemonKingBG + 0x6e8c
    .4byte 0xffffffff
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000000
    .4byte 0x00000028
    .4byte 0x00000002
    .4byte 0x00000002
    .4byte 0x0000fffe
    .4byte 0x0000fffe
    .4byte 0x00000002
    .4byte 0x00000002
    .4byte 0x0000fffe
    .4byte 0x0000fffe
    .4byte 0x00000002
    .4byte 0x00000002
    .4byte 0x0000fffe
    .4byte 0x0000fffe
    .4byte 0x00000002
    .4byte 0x00000002
    .4byte 0x0000fffe
    .4byte 0x0000fffe
    .4byte 0x00000002
    .4byte 0x00000002
    .4byte 0x0000fffe
    .4byte 0x0000fffe
    .4byte 0x00000002
    .4byte 0x00000002
    .4byte 0x0000fffe
    .4byte 0x0000fffe
    .4byte 0x00000001
    .4byte 0x00000001
    .4byte 0x0000ffff
    .4byte 0x0000ffff
    .4byte 0x00000001
    .4byte 0x00000001
    .4byte 0x0000ffff
    .4byte 0x0000ffff
    .4byte 0x00000001
    .4byte 0x00000001
    .4byte 0x0000ffff
    .4byte 0x0000ffff
    .4byte 0x00000001
    .4byte 0x00000001
    .4byte 0x0000ffff
    .4byte 0x0005ffff
    .4byte 0x00020002
    .4byte 0xfffefffe
    .4byte 0x00010001
    .4byte 0xffffffff
    .4byte 0x00000000

	.global gUnknown_08801AAC
gUnknown_08801AAC:  @ 0x08801AAC
    .4byte gUnknown_088018A0 + 0x1f6
    .4byte gUnknown_088018A0 + 0x154

	.global gUnknown_08801AB4
gUnknown_08801AB4:  @ 0x08801AB4
@ Replacing .incbin "baserom.gba", 0x801AB4, 0x160
    .4byte gUnknown_08801AB4 + 0x60
    .4byte gUnknown_08801AB4 + 0x20
    .4byte gUnknown_08801AB4 + 0x20
    .4byte gUnknown_08801AB4 + 0x20
    .4byte gUnknown_08801AB4 + 0xa0
    .4byte gUnknown_08801AB4 + 0x60
    .4byte gUnknown_08801AB4 + 0x20
    .4byte gUnknown_08801AB4 + 0x20
    .4byte 0x35393237
    .4byte 0x343d363b
    .4byte 0x293e2d3f
    .4byte 0x2e312b33
    .4byte 0x24382c20
    .4byte 0x2228263c
    .4byte 0x272f1a2a
    .4byte 0x181b231f
    .4byte 0x121d3a11
    .4byte 0x30161019
    .4byte 0x1e1c0821
    .4byte 0x090a150e
    .4byte 0x1303070b
    .4byte 0x14060f02
    .4byte 0x05250d04
    .4byte 0x0017010c
    .4byte 0x0f161f36
    .4byte 0x3e372e26
    .4byte 0x1d173d15
    .4byte 0x2f353f25
    .4byte 0x0e343c07
    .4byte 0x2c061c27
    .4byte 0x2b051e13
    .4byte 0x0d333b04
    .4byte 0x0c233a22
    .4byte 0x0a242d12
    .4byte 0x39110b14
    .4byte 0x09021903
    .4byte 0x38321831
    .4byte 0x1b202a21
    .4byte 0x1a102900
    .4byte 0x28010830
    .4byte 0x1a102900
    .4byte 0x28010830
    .4byte 0x38321831
    .4byte 0x1b202a21
    .4byte 0x39110b14
    .4byte 0x09021903
    .4byte 0x0c233a22
    .4byte 0x0a242d12
    .4byte 0x2b051e13
    .4byte 0x0d333b04
    .4byte 0x0e343c07
    .4byte 0x2c061c27
    .4byte 0x1d173d15
    .4byte 0x2f353f25
    .4byte 0x0f161f36
    .4byte 0x3e372e26
    .4byte 0x02212b14
    .4byte 0x072e2511
    .4byte 0x1c193b33
    .4byte 0x0f270d2f
    .4byte 0x0a32051a
    .4byte 0x3d3f161b
    .4byte 0x10312a29
    .4byte 0x3e1f1e34
    .4byte 0x08000b3a
    .4byte 0x370e2d03
    .4byte 0x01301509
    .4byte 0x242c383c
    .4byte 0x22180c1d
    .4byte 0x17123626
    .4byte 0x39200423
    .4byte 0x06351328
    .4byte 0x03020100
    .4byte 0x07060504
    .4byte 0x0b0a0908
    .4byte 0x0f0e0d0c
    .4byte 0x13121110
    .4byte 0x17161514
    .4byte 0x1b1a1918
    .4byte 0x1f1e1d1c
    .4byte 0x23222120
    .4byte 0x27262524
    .4byte 0x2b2a2928
    .4byte 0x2f2e2d2c
    .4byte 0x33323130
    .4byte 0x37363534
    .4byte 0x3b3a3938
    .4byte 0x3f3e3d3c

	.global gUnknown_08801C14
gUnknown_08801C14:  @ 0x08801C14
	.incbin "baserom.gba", 0x801C14, 0x368

	.global Img_EfxLeftNameBox
Img_EfxLeftNameBox:  @ 0x08801F7C
	.incbin "baserom.gba", 0x801F7C, 0x78

	.global Img_EfxLeftItemBox
Img_EfxLeftItemBox:  @ 0x08801FF4
	.incbin "baserom.gba", 0x801FF4, 0x50

	.global Img_EfxRightNameBox
Img_EfxRightNameBox:  @ 0x08802044
	.incbin "baserom.gba", 0x802044, 0x78

	.global Img_EfxRightItemBox
Img_EfxRightItemBox:  @ 0x088020BC
	.incbin "baserom.gba", 0x8020BC, 0x50

	.global gUnknown_0880210C
gUnknown_0880210C:  @ 0x0880210C
	.incbin "baserom.gba", 0x80210C, 0xB4

	.global gUnknown_088021C0
gUnknown_088021C0:  @ 0x088021C0
	.incbin "baserom.gba", 0x8021C0, 0xB4

	.global gUnknown_08802274
gUnknown_08802274:  @ 0x08802274
	.incbin "baserom.gba", 0x802274, 0xD4

	.global gUnknown_08802348
gUnknown_08802348:  @ 0x08802348
	.incbin "baserom.gba", 0x802348, 0xE0

	.global gUnknown_08802428
gUnknown_08802428:  @ 0x08802428
	.incbin "baserom.gba", 0x802428, 0xE0

	.global gUnknown_08802508
gUnknown_08802508:  @ 0x08802508
	.incbin "baserom.gba", 0x802508, 0x50

	.global gUnknown_08802558
gUnknown_08802558:  @ 0x08802558
	.incbin "baserom.gba", 0x802558, 0x80

	.global Img_EfxSideHitDmgCrit
Img_EfxSideHitDmgCrit:  @ 0x088025D8
	.incbin "baserom.gba", 0x8025D8, 0x9C

	.global Img_EfxWTAArrow1
Img_EfxWTAArrow1:  @ 0x08802674
	.incbin "baserom.gba", 0x802674, 0x24

	.global Img_EfxWTAArrow2
Img_EfxWTAArrow2:  @ 0x08802698
	.incbin "baserom.gba", 0x802698, 0x4C

	.global gUnknown_088026E4
gUnknown_088026E4:  @ 0x088026E4
	.incbin "baserom.gba", 0x8026E4, 0x1A0

	.global gUnknown_08802884
gUnknown_08802884:  @ 0x08802884
	.incbin "baserom.gba", 0x802884, 0x80

	.global gUnknown_08802904
gUnknown_08802904:  @ 0x08802904
	.incbin "baserom.gba", 0x802904, 0x200

	.global gUnknown_08802B04
gUnknown_08802B04:  @ 0x08802B04
	.incbin "baserom.gba", 0x802B04, 0x80

	.global gUnknown_08802B84
gUnknown_08802B84:  @ 0x08802B84
	.incbin "baserom.gba", 0x802B84, 0x40

	.global gUnknown_08802BC4
gUnknown_08802BC4:  @ 0x08802BC4
	.incbin "baserom.gba", 0x802BC4, 0xC0

	.global gUnknown_08802C84
gUnknown_08802C84:  @ 0x08802C84
	.incbin "baserom.gba", 0x802C84, 0xA0

	.global gUnknown_08802D24
gUnknown_08802D24:  @ 0x08802D24
	.incbin "baserom.gba", 0x802D24, 0x20

	.global gUnknown_08802D44
gUnknown_08802D44:  @ 0x08802D44
	.incbin "baserom.gba", 0x802D44, 0x380

	.global gUnknown_088030C4
gUnknown_088030C4:  @ 0x088030C4
	.incbin "baserom.gba", 0x8030C4, 0x300

	.global gUnknown_088033C4
gUnknown_088033C4:  @ 0x088033C4
	.incbin "baserom.gba", 0x8033C4, 0x160

	.global gUnknown_08803524
gUnknown_08803524:  @ 0x08803524
	.incbin "baserom.gba", 0x803524, 0x6C

	.global gUnknown_08803590
gUnknown_08803590:  @ 0x08803590
	.incbin "baserom.gba", 0x803590, 0x20

	.global Img_LevelUpBoxFrame
Img_LevelUpBoxFrame:  @ 0x088035B0
	.incbin "baserom.gba", 0x8035B0, 0x438

	.global Tsa_LevelUpBoxFrame
Tsa_LevelUpBoxFrame:  @ 0x088039E8
	.incbin "baserom.gba", 0x8039E8, 0x128

	.global gUnknown_08803B10
gUnknown_08803B10:  @ 0x08803B10
	.incbin "baserom.gba", 0x803B10, 0x20

	.global gUnknown_08803B30
gUnknown_08803B30:  @ 0x08803B30
	.incbin "baserom.gba", 0x803B30, 0xA0

	.global gUnknown_08803BD0
gUnknown_08803BD0:  @ 0x08803BD0
	.incbin "baserom.gba", 0x803BD0, 0xE0

	.global gUnknown_08803CB0
gUnknown_08803CB0:  @ 0x08803CB0
	.incbin "baserom.gba", 0x803CB0, 0x20

	.global gUnknown_08803CD0
gUnknown_08803CD0:  @ 0x08803CD0
	.incbin "baserom.gba", 0x803CD0, 0x94
