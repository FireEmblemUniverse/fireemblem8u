	.section .data

	.global gUnknown_0875879C
gUnknown_0875879C:  @ 0x0875879C
	.incbin "baserom.gba", 0x75879C, 0x280

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
        .word EkrsubAnimeEmulatorMain
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
