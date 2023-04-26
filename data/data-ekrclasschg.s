	.section .data

	.global gUnknown_08758A1C
gUnknown_08758A1C:  @ 0x08758A1C
	.incbin "baserom.gba", 0x758A1C, 0x14

	.global ProcScr_ekrsubAnimeEmulator
ProcScr_ekrsubAnimeEmulator:  @ 0x08758A30
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80e13c0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8071714
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global ProcScr_efxSoundSE
ProcScr_efxSoundSE:  @ 0x08758A48
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80e1414
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word Loop6C_efxSoundSE
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08758A60
gUnknown_08758A60:  @ 0x08758A60
	.incbin "baserom.gba", 0x758A60, 0x2C0

	.global gUnknown_08758D20
gUnknown_08758D20:  @ 0x08758D20
    .4byte gUnknown_08758A60 + 0x100
    .4byte gUnknown_08758A60 + 0x110
    .4byte gUnknown_08758A60 + 0x120
    .4byte gUnknown_08758A60 + 0x130
    .4byte gUnknown_08758A60 + 0x140
    .4byte gUnknown_08758A60 + 0x150
    .4byte gUnknown_08758A60 + 0x160

	.global gUnknown_08758D3C
gUnknown_08758D3C:  @ 0x08758D3C
    .4byte gUnknown_08758A60 + 0x170
    .4byte gUnknown_08758A60 + 0x180
    .4byte gUnknown_08758A60 + 0x190
    .4byte gUnknown_08758A60 + 0x1a0
    .4byte gUnknown_08758A60 + 0x1b0
    .4byte gUnknown_08758A60 + 0x1c0
    .4byte gUnknown_08758A60 + 0x1d0

	.global gUnknown_08758D58
gUnknown_08758D58:  @ 0x08758D58
    .4byte gUnknown_08758A60 + 0x1e0
    .4byte gUnknown_08758A60 + 0x1f0
    .4byte gUnknown_08758A60 + 0x200
    .4byte gUnknown_08758A60 + 0x210
    .4byte gUnknown_08758A60 + 0x220
    .4byte gUnknown_08758A60 + 0x230
    .4byte gUnknown_08758A60 + 0x240

	.global gUnknown_08758D74
gUnknown_08758D74:  @ 0x08758D74
@ Replacing .incbin "baserom.gba", 0x758D74, 0x8C
    .4byte gUnknown_08758A60 + 0x250
    .4byte gUnknown_08758A60 + 0x260
    .4byte gUnknown_08758A60 + 0x270
    .4byte gUnknown_08758A60 + 0x280
    .4byte gUnknown_08758A60 + 0x290
    .4byte gUnknown_08758A60 + 0x2a0
    .4byte gUnknown_08758A60 + 0x2b0
    .4byte 0x03390338
    .4byte 0x03390338
    .4byte 0x03390338
    .4byte 0x03390338
    .4byte 0x03430342
    .4byte 0x03430342
    .4byte 0x03430342
    .4byte 0x03430342
    .4byte 0x034d034c
    .4byte 0x034d034c
    .4byte 0x034d034c
    .4byte 0x034d034c
    .4byte 0x03570356
    .4byte 0x03570356
    .4byte 0x03570356
    .4byte 0x03570356
    .4byte 0x03610360
    .4byte 0x03610360
    .4byte 0x03610360
    .4byte 0x03610360
    .4byte 0x036b036a
    .4byte 0x036b036a
    .4byte 0x036b036a
    .4byte 0x036b036a
    .4byte 0x03750374
    .4byte 0x03750374
    .4byte 0x03750374
    .4byte 0x03750374

	.global gUnknown_08758E00
gUnknown_08758E00:  @ 0x08758E00
@ Replacing .incbin "baserom.gba", 0x758E00, 0x8C
    .4byte gUnknown_08758D74 + 0x1c
    .4byte gUnknown_08758D74 + 0x2c
    .4byte gUnknown_08758D74 + 0x3c
    .4byte gUnknown_08758D74 + 0x4c
    .4byte gUnknown_08758D74 + 0x5c
    .4byte gUnknown_08758D74 + 0x6c
    .4byte gUnknown_08758D74 + 0x7c
    .4byte 0x033b033a
    .4byte 0x033b033a
    .4byte 0x033b033a
    .4byte 0x033b033a
    .4byte 0x03450344
    .4byte 0x03450344
    .4byte 0x03450344
    .4byte 0x03450344
    .4byte 0x034f034e
    .4byte 0x034f034e
    .4byte 0x034f034e
    .4byte 0x034f034e
    .4byte 0x03590358
    .4byte 0x03590358
    .4byte 0x03590358
    .4byte 0x03590358
    .4byte 0x03630362
    .4byte 0x03630362
    .4byte 0x03630362
    .4byte 0x03630362
    .4byte 0x036d036c
    .4byte 0x036d036c
    .4byte 0x036d036c
    .4byte 0x036d036c
    .4byte 0x03770376
    .4byte 0x03770376
    .4byte 0x03770376
    .4byte 0x03770376

	.global gUnknown_08758E8C
gUnknown_08758E8C:  @ 0x08758E8C
@ Replacing .incbin "baserom.gba", 0x758E8C, 0x8C
    .4byte gUnknown_08758E00 + 0x1c
    .4byte gUnknown_08758E00 + 0x2c
    .4byte gUnknown_08758E00 + 0x3c
    .4byte gUnknown_08758E00 + 0x4c
    .4byte gUnknown_08758E00 + 0x5c
    .4byte gUnknown_08758E00 + 0x6c
    .4byte gUnknown_08758E00 + 0x7c
    .4byte 0x03350334
    .4byte 0x03350334
    .4byte 0x03350334
    .4byte 0x03350334
    .4byte 0x033f033e
    .4byte 0x033f033e
    .4byte 0x033f033e
    .4byte 0x033f033e
    .4byte 0x03490348
    .4byte 0x03490348
    .4byte 0x03490348
    .4byte 0x03490348
    .4byte 0x03530352
    .4byte 0x03530352
    .4byte 0x03530352
    .4byte 0x03530352
    .4byte 0x035d035c
    .4byte 0x035d035c
    .4byte 0x035d035c
    .4byte 0x035d035c
    .4byte 0x03670366
    .4byte 0x03670366
    .4byte 0x03670366
    .4byte 0x03670366
    .4byte 0x03710370
    .4byte 0x03710370
    .4byte 0x03710370
    .4byte 0x03710370

	.global gUnknown_08758F18
gUnknown_08758F18:  @ 0x08758F18
@ Replacing .incbin "baserom.gba", 0x758F18, 0x8C
    .4byte gUnknown_08758E8C + 0x1c
    .4byte gUnknown_08758E8C + 0x2c
    .4byte gUnknown_08758E8C + 0x3c
    .4byte gUnknown_08758E8C + 0x4c
    .4byte gUnknown_08758E8C + 0x5c
    .4byte gUnknown_08758E8C + 0x6c
    .4byte gUnknown_08758E8C + 0x7c
    .4byte 0x03370336
    .4byte 0x03370336
    .4byte 0x03370336
    .4byte 0x03370336
    .4byte 0x03410340
    .4byte 0x03410340
    .4byte 0x03410340
    .4byte 0x03410340
    .4byte 0x034b034a
    .4byte 0x034b034a
    .4byte 0x034b034a
    .4byte 0x034b034a
    .4byte 0x03550354
    .4byte 0x03550354
    .4byte 0x03550354
    .4byte 0x03550354
    .4byte 0x035f035e
    .4byte 0x035f035e
    .4byte 0x035f035e
    .4byte 0x035f035e
    .4byte 0x03690368
    .4byte 0x03690368
    .4byte 0x03690368
    .4byte 0x03690368
    .4byte 0x03730372
    .4byte 0x03730372
    .4byte 0x03730372
    .4byte 0x03730372

	.global gUnknown_08758FA4
gUnknown_08758FA4:  @ 0x08758FA4
    .4byte gUnknown_08758F18 + 0x1c
    .4byte gUnknown_08758F18 + 0x2c
    .4byte gUnknown_08758F18 + 0x3c
    .4byte gUnknown_08758F18 + 0x4c
    .4byte gUnknown_08758F18 + 0x5c
    .4byte gUnknown_08758F18 + 0x6c
    .4byte gUnknown_08758F18 + 0x7c

	.global ProcScr_efxClasschg
ProcScr_efxClasschg:  @ 0x08758FC0
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80e1420
        @ PROC_SET_END_CB
        .short 0x4, 0x0
        .word EndEfxStatusUnit
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8072A44
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8072DC0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global ProcScr_efxClasschgBG
ProcScr_efxClasschgBG:  @ 0x08758FE8
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80e142c
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8072E60
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08759000
gUnknown_08759000:  @ 0x08759000
    .4byte gUnknown_08792988 + 0x964
    .4byte gUnknown_08792988 + 0x9fc
    .4byte gUnknown_08792988 + 0xb0c
    .4byte gUnknown_08792988 + 0xc28
    .4byte gUnknown_08792988 + 0xd38
    .4byte gUnknown_08792988 + 0xe48
    .4byte gUnknown_08792988 + 0xf64
    .4byte gUnknown_08792988 + 0x6e90
    .4byte gUnknown_08792988 + 0x7134
    .4byte gUnknown_08792988 + 0x73dc
    .4byte gUnknown_08792988 + 0x7680
    .4byte gUnknown_08792988 + 0x7920
    .4byte gUnknown_08792988 + 0x7abc
    .4byte gUnknown_08792988 + 0x7d18
    .4byte gUnknown_08792988 + 0x7ef4
    .4byte gUnknown_08792988 + 0x8060
    .4byte gUnknown_08792988 + 0x8188
    .4byte gUnknown_08792988 + 0xef68
    .4byte gUnknown_08792988 + 0xf064
    .4byte gUnknown_08792988 + 0xf1e0
    .4byte gUnknown_08792988 + 0xf3ec
    .4byte gUnknown_08792988 + 0xf614
    .4byte gUnknown_08792988 + 0xf7ac
    .4byte gUnknown_08792988 + 0xf9fc
    .4byte gUnknown_08792988 + 0xfbfc
    .4byte gUnknown_08792988 + 0xfdc0
    .4byte gUnknown_08792988 + 0xff20
    .4byte gUnknown_08792988 + 0x10054
    .4byte gUnknown_08792988 + 0x10160
    .4byte gUnknown_08792988 + 0x1025c
    .4byte gUnknown_08792988 + 0x10344
    .4byte gUnknown_08792988 + 0x10430
    .4byte gUnknown_08792988 + 0x12100
    .4byte gUnknown_08792988 + 0x121e0
    .4byte gUnknown_08792988 + 0x122bc
    .4byte gUnknown_08792988 + 0x123a4
    .4byte gUnknown_08792988 + 0x12484

	.global gUnknown_08759094
gUnknown_08759094:  @ 0x08759094
    .4byte gUnknown_08792988 + 0x30
    .4byte gUnknown_08792988 + 0x30
    .4byte gUnknown_08792988 + 0x30
    .4byte gUnknown_08792988 + 0x30
    .4byte gUnknown_08792988 + 0x30
    .4byte gUnknown_08792988 + 0x30
    .4byte gUnknown_08792988 + 0x30
    .4byte gUnknown_08792988 + 0x1074
    .4byte gUnknown_08792988 + 0x1ca0
    .4byte gUnknown_08792988 + 0x2850
    .4byte gUnknown_08792988 + 0x346c
    .4byte gUnknown_08792988 + 0x406c
    .4byte gUnknown_08792988 + 0x4754
    .4byte gUnknown_08792988 + 0x513c
    .4byte gUnknown_08792988 + 0x5a0c
    .4byte gUnknown_08792988 + 0x61e4
    .4byte gUnknown_08792988 + 0x68a0
    .4byte gUnknown_08792988 + 0x8280
    .4byte gUnknown_08792988 + 0x87e0
    .4byte gUnknown_08792988 + 0x8f6c
    .4byte gUnknown_08792988 + 0x985c
    .4byte gUnknown_08792988 + 0xa12c
    .4byte gUnknown_08792988 + 0xa870
    .4byte gUnknown_08792988 + 0xb288
    .4byte gUnknown_08792988 + 0xbc54
    .4byte gUnknown_08792988 + 0xc548
    .4byte gUnknown_08792988 + 0xcd10
    .4byte gUnknown_08792988 + 0xd3b4
    .4byte gUnknown_08792988 + 0xd9b0
    .4byte gUnknown_08792988 + 0xdf84
    .4byte gUnknown_08792988 + 0xe4f0
    .4byte gUnknown_08792988 + 0xea38
    .4byte gUnknown_08792988 + 0x10518
    .4byte gUnknown_08792988 + 0x10a78
    .4byte gUnknown_08792988 + 0x11018
    .4byte gUnknown_08792988 + 0x115b0
    .4byte gUnknown_08792988 + 0x11b50

	.global gUnknown_08759128
gUnknown_08759128:  @ 0x08759128
    .4byte gUnknown_08792988 + 0x944
    .4byte gUnknown_08792988 + 0x944
    .4byte gUnknown_08792988 + 0x944
    .4byte gUnknown_08792988 + 0x944
    .4byte gUnknown_08792988 + 0x944
    .4byte gUnknown_08792988 + 0x944
    .4byte gUnknown_08792988 + 0x944
    .4byte gUnknown_08792988 + 0x6e70
    .4byte gUnknown_08792988 + 0x6e70
    .4byte gUnknown_08792988 + 0x6e70
    .4byte gUnknown_08792988 + 0x6e70
    .4byte gUnknown_08792988 + 0x6e70
    .4byte gUnknown_08792988 + 0x6e70
    .4byte gUnknown_08792988 + 0x6e70
    .4byte gUnknown_08792988 + 0x6e70
    .4byte gUnknown_08792988 + 0x6e70
    .4byte gUnknown_08792988 + 0x6e70
    .4byte gUnknown_08792988 + 0xef48
    .4byte gUnknown_08792988 + 0xef48
    .4byte gUnknown_08792988 + 0xef48
    .4byte gUnknown_08792988 + 0xef48
    .4byte gUnknown_08792988 + 0xef48
    .4byte gUnknown_08792988 + 0xef48
    .4byte gUnknown_08792988 + 0xef48
    .4byte gUnknown_08792988 + 0xef48
    .4byte gUnknown_08792988 + 0xef48
    .4byte gUnknown_08792988 + 0xef48
    .4byte gUnknown_08792988 + 0xef48
    .4byte gUnknown_08792988 + 0xef48
    .4byte gUnknown_08792988 + 0xef48
    .4byte gUnknown_08792988 + 0xef48
    .4byte gUnknown_08792988 + 0xef48
    .4byte gUnknown_08792988 + 0x120e0
    .4byte gUnknown_08792988 + 0x120e0
    .4byte gUnknown_08792988 + 0x120e0
    .4byte gUnknown_08792988 + 0x120e0
    .4byte gUnknown_08792988 + 0x120e0

	.global ProcScr_efxClasschgBGSE00
ProcScr_efxClasschgBGSE00:  @ 0x087591BC
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80e1508
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8072EF4
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global ProcScr_efxClasschgBGSE01
ProcScr_efxClasschgBGSE01:  @ 0x087591D4
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80e151c
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8072F74
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global ProcScr_efxClasschgOBJGain
ProcScr_efxClasschgOBJGain:  @ 0x087591EC
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80e1530
        @ PROC_SLEEP
        .short 0xe, 0x64
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8072FD0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global ProcScr_efxClasschgOBJDrop
ProcScr_efxClasschgOBJDrop:  @ 0x0875920C
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80e1544
        @ PROC_SLEEP
        .short 0xe, 0x64
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8073034
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global ProcScr_efxClasschgOBJDiffusion
ProcScr_efxClasschgOBJDiffusion:  @ 0x0875922C
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80e1558
        @ PROC_SLEEP
        .short 0xe, 0x64
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80730AC
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global ProcScr_efxClasschgFIN
ProcScr_efxClasschgFIN:  @ 0x0875924C
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80e1570
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80731C8
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global ProcScr_efxClasschgCLONE
ProcScr_efxClasschgCLONE:  @ 0x08759264
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80e1580
        @ PROC_SET_END_CB
        .short 0x4, 0x0
        .word sub_80732A4
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8073240
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global ProcScr_efxBlackInOutUnit
ProcScr_efxBlackInOutUnit:  @ 0x08759284
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80e1594
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80732E0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global ProcScr_efxWhiteInOutUnit
ProcScr_efxWhiteInOutUnit:  @ 0x0875929C
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80e15a8
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80733C0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global ProcScr_efxClasschgRST
ProcScr_efxClasschgRST:  @ 0x087592B4
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80e15bc
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80734AC
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0
