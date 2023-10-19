	.section .data

	.global gUnknown_08758A60
gUnknown_08758A60:  @ 0x08758A60
	.incbin "baserom.gba", 0x758A60, 0x2C0

	.global gBanimSongTable1
gBanimSongTable1:  @ 0x08758D20
    .4byte gUnknown_08758A60 + 0x100
    .4byte gUnknown_08758A60 + 0x110
    .4byte gUnknown_08758A60 + 0x120
    .4byte gUnknown_08758A60 + 0x130
    .4byte gUnknown_08758A60 + 0x140
    .4byte gUnknown_08758A60 + 0x150
    .4byte gUnknown_08758A60 + 0x160

	.global gBanimSongTable2
gBanimSongTable2:  @ 0x08758D3C
    .4byte gUnknown_08758A60 + 0x170
    .4byte gUnknown_08758A60 + 0x180
    .4byte gUnknown_08758A60 + 0x190
    .4byte gUnknown_08758A60 + 0x1a0
    .4byte gUnknown_08758A60 + 0x1b0
    .4byte gUnknown_08758A60 + 0x1c0
    .4byte gUnknown_08758A60 + 0x1d0

	.global gBanimSongTable3
gBanimSongTable3:  @ 0x08758D58
    .4byte gUnknown_08758A60 + 0x1e0
    .4byte gUnknown_08758A60 + 0x1f0
    .4byte gUnknown_08758A60 + 0x200
    .4byte gUnknown_08758A60 + 0x210
    .4byte gUnknown_08758A60 + 0x220
    .4byte gUnknown_08758A60 + 0x230
    .4byte gUnknown_08758A60 + 0x240

	.global gBanimSongTable4
gBanimSongTable4:  @ 0x08758D74
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

	.global gBanimSongTable5
gBanimSongTable5:  @ 0x08758E00
@ Replacing .incbin "baserom.gba", 0x758E00, 0x8C
    .4byte gBanimSongTable4 + 0x1c
    .4byte gBanimSongTable4 + 0x2c
    .4byte gBanimSongTable4 + 0x3c
    .4byte gBanimSongTable4 + 0x4c
    .4byte gBanimSongTable4 + 0x5c
    .4byte gBanimSongTable4 + 0x6c
    .4byte gBanimSongTable4 + 0x7c
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

	.global gBanimSongTable6
gBanimSongTable6:  @ 0x08758E8C
@ Replacing .incbin "baserom.gba", 0x758E8C, 0x8C
    .4byte gBanimSongTable5 + 0x1c
    .4byte gBanimSongTable5 + 0x2c
    .4byte gBanimSongTable5 + 0x3c
    .4byte gBanimSongTable5 + 0x4c
    .4byte gBanimSongTable5 + 0x5c
    .4byte gBanimSongTable5 + 0x6c
    .4byte gBanimSongTable5 + 0x7c
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

	.global gBanimSongTable7
gBanimSongTable7:  @ 0x08758F18
@ Replacing .incbin "baserom.gba", 0x758F18, 0x8C
    .4byte gBanimSongTable6 + 0x1c
    .4byte gBanimSongTable6 + 0x2c
    .4byte gBanimSongTable6 + 0x3c
    .4byte gBanimSongTable6 + 0x4c
    .4byte gBanimSongTable6 + 0x5c
    .4byte gBanimSongTable6 + 0x6c
    .4byte gBanimSongTable6 + 0x7c
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

	.global gBanimSongTable8
gBanimSongTable8:  @ 0x08758FA4
    .4byte gBanimSongTable7 + 0x1c
    .4byte gBanimSongTable7 + 0x2c
    .4byte gBanimSongTable7 + 0x3c
    .4byte gBanimSongTable7 + 0x4c
    .4byte gBanimSongTable7 + 0x5c
    .4byte gBanimSongTable7 + 0x6c
    .4byte gBanimSongTable7 + 0x7c
