	.section .data

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
