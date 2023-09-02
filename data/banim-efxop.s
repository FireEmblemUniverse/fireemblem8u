	.section .data

	.global gpEfxopFuncLut
gpEfxopFuncLut:  @ 0x085D9430
    .4byte nullsub_73
    .4byte NewEfxopFire
    .4byte NewEfxopThunder
    .4byte NewEfxopLive
    .4byte NewEfxopLightning
    .4byte NewEfxopMistyrain
    .4byte NewEfxopMyrrh
    .4byte sub_806F6B4
    .4byte sub_806F844

	.global ProcScr_efxopFire
ProcScr_efxopFire:  @ 0x085D9454
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80df62c
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806EB9C
        @ PROC_SLEEP
        .short 0xe, 0x32
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_806E904
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global ProcScr_efxopFireBG
ProcScr_efxopFireBG:  @ 0x085D947C
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80df638
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806EC1C
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D9494
gUnknown_085D9494:  @ 0x085D9494
    .4byte gUnknown_085F6230 + 0x20
    .4byte gUnknown_085F6230 + 0xc8
    .4byte gUnknown_085F6230 + 0x170
    .4byte gUnknown_085F6230 + 0x228
    .4byte gUnknown_085F6230 + 0x2f0
    .4byte gUnknown_085F6230 + 0x3c0
    .4byte gUnknown_085F6230 + 0x4c0
    .4byte gUnknown_085F6230 + 0x5c8
    .4byte gUnknown_085F6230 + 0x6dc
    .4byte gUnknown_085F6230 + 0x814
    .4byte gUnknown_085F6230 + 0x918
    .4byte gUnknown_085F6230 + 0x9ec

	.global ProcScr_efxopFireOBJ
ProcScr_efxopFireOBJ:  @ 0x085D94C4
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80df678
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806ECE8
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global ProcScr_efxopThunder
ProcScr_efxopThunder:  @ 0x085D94DC
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80df688
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806ED2C
        @ PROC_SLEEP
        .short 0xe, 0x32
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_806E904
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global ProcScr_efxopThunderBG
ProcScr_efxopThunderBG:  @ 0x085D9504
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80df698
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806EDB0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D951C
gUnknown_085D951C:  @ 0x085D951C
    .4byte gUnknown_085F367C + 0x200
    .4byte gUnknown_085F367C + 0x2cc

	.global ProcScr_efxopThunderBGCOL
ProcScr_efxopThunderBGCOL:  @ 0x085D9524
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80df6b4
        @ PROC_MARK
        .short 0xf, 0xa
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806EE68
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global ProcScr_efxopThunderOBJ
ProcScr_efxopThunderOBJ:  @ 0x085D9544
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80df708
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806EF24
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global ProcScr_efxopLive
ProcScr_efxopLive:  @ 0x085D955C
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80df718
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806EF64
        @ PROC_SLEEP
        .short 0xe, 0x46
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_806E904
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global ProcScr_efxopLiveBG
ProcScr_efxopLiveBG:  @ 0x085D9584
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80df724
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806F00C
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D959C
gUnknown_085D959C:  @ 0x085D959C
    .4byte gUnknown_0866F774

	.global ProcScr_efxopLiveBGCOL
ProcScr_efxopLiveBGCOL:  @ 0x085D95A0
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80df738
        @ PROC_MARK
        .short 0xf, 0xa
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806F08C
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global ProcScr_efxopLiveALPHA
ProcScr_efxopLiveALPHA:  @ 0x085D95C0
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80df78c
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806F0FC
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806F118
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global ProcScr_efxopLiveOBJ
ProcScr_efxopLiveOBJ:  @ 0x085D95E0
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80df79c
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806F1E8
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global ProcScr_efxopLightning
ProcScr_efxopLightning:  @ 0x085D95F8
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80df7ac
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806F230
        @ PROC_SLEEP
        .short 0xe, 0x32
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_806E904
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global ProcScr_efxopLightningBG
ProcScr_efxopLightningBG:  @ 0x085D9620
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80df7bc
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806F2A0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D9638
gUnknown_085D9638:  @ 0x085D9638
    .4byte gUnknown_0861AD8C + 0x8
    .4byte gUnknown_0861AD8C + 0x8
    .4byte gUnknown_0861AD8C + 0x8
    .4byte gUnknown_0861AD8C + 0x8d0
    .4byte gUnknown_0861AD8C + 0x8d0
    .4byte gUnknown_0861AD8C + 0x8d0
    .4byte gUnknown_0861AD8C + 0x1020
    .4byte gUnknown_0861AD8C + 0x1020
    .4byte gUnknown_0861AD8C + 0x1020
    .4byte gUnknown_0861AD8C + 0x1020
    .4byte gUnknown_0861AD8C + 0x19e4
    .4byte gUnknown_0861AD8C + 0x19e4
    .4byte gUnknown_0861AD8C + 0x19e4
    .4byte gUnknown_0861AD8C + 0x2538
    .4byte gUnknown_0861AD8C + 0x2538
    .4byte gUnknown_0861AD8C + 0x2538
    .4byte gUnknown_0861AD8C + 0x3040
    .4byte gUnknown_0861AD8C + 0x3040
    .4byte gUnknown_0861AD8C + 0x3040
    .4byte gUnknown_0861AD8C + 0x3040
    .4byte gUnknown_0861AD8C + 0x3040
    .4byte gUnknown_0861AD8C + 0x3040
    .4byte gUnknown_0861AD8C + 0x3040
    .4byte gUnknown_0861AD8C + 0x3040
    .4byte gUnknown_0861AD8C + 0x3040
    .4byte gUnknown_0861AD8C + 0x3358
    .4byte gUnknown_0861AD8C + 0x3358
    .4byte gUnknown_0861AD8C + 0x3358
    .4byte gUnknown_0861AD8C + 0x4008
    .4byte gUnknown_0861AD8C + 0x4008
    .4byte gUnknown_0861AD8C + 0x4008
    .4byte gUnknown_0861AD8C + 0x4008
    .4byte gUnknown_0861AD8C + 0x4008

	.global gUnknown_085D96BC
gUnknown_085D96BC:  @ 0x085D96BC
    .4byte gUnknown_0861AD8C + 0x4a28
    .4byte gUnknown_0861AD8C + 0x4a28
    .4byte gUnknown_0861AD8C + 0x4a28
    .4byte gUnknown_0861AD8C + 0x4a28
    .4byte gUnknown_0861AD8C + 0x4a28
    .4byte gUnknown_0861AD8C + 0x4a28
    .4byte gUnknown_0861AD8C + 0x4a28
    .4byte gUnknown_0861AD8C + 0x4a28
    .4byte gUnknown_0861AD8C + 0x4a28
    .4byte gUnknown_0861AD8C + 0x4a28
    .4byte gUnknown_0861AD8C + 0x4a28
    .4byte gUnknown_0861AD8C + 0x4a28
    .4byte gUnknown_0861AD8C + 0x4a28
    .4byte gUnknown_0861AD8C + 0x4a28
    .4byte gUnknown_0861AD8C + 0x4a28
    .4byte gUnknown_0861AD8C + 0x4a28
    .4byte gUnknown_0861AD8C + 0x4a28
    .4byte gUnknown_0861AD8C + 0x4a28
    .4byte gUnknown_0861AD8C + 0x4a28
    .4byte gUnknown_0861AD8C + 0x4a28
    .4byte gUnknown_0861AD8C + 0x4a28
    .4byte gUnknown_0861AD8C + 0x4a28
    .4byte gUnknown_0861AD8C + 0x4a28
    .4byte gUnknown_0861AD8C + 0x4a28
    .4byte gUnknown_0861AD8C + 0x4a28
    .4byte gUnknown_0861AD8C + 0x4a48
    .4byte gUnknown_0861AD8C + 0x4a48
    .4byte gUnknown_0861AD8C + 0x4a48
    .4byte gUnknown_0861AD8C + 0x4a48
    .4byte gUnknown_0861AD8C + 0x4a48
    .4byte gUnknown_0861AD8C + 0x4a48
    .4byte gUnknown_0861AD8C + 0x4a48
    .4byte gUnknown_0861AD8C + 0x4a48

	.global gUnknown_085D9740
gUnknown_085D9740:  @ 0x085D9740
    .4byte gUnknown_0861AD8C + 0x4a68
    .4byte gUnknown_0861AD8C + 0x4b8c
    .4byte gUnknown_0861AD8C + 0x4cac
    .4byte gUnknown_0861AD8C + 0x4db8
    .4byte gUnknown_0861AD8C + 0x4eb4
    .4byte gUnknown_0861AD8C + 0x4f9c
    .4byte gUnknown_0861AD8C + 0x5080
    .4byte gUnknown_0861AD8C + 0x5164
    .4byte gUnknown_0861AD8C + 0x5240
    .4byte gUnknown_0861AD8C + 0x5320
    .4byte gUnknown_0861AD8C + 0x5414
    .4byte gUnknown_0861AD8C + 0x5508
    .4byte gUnknown_0861AD8C + 0x560c
    .4byte gUnknown_0861AD8C + 0x5714
    .4byte gUnknown_0861AD8C + 0x582c
    .4byte gUnknown_0861AD8C + 0x5950
    .4byte gUnknown_0861AD8C + 0x5a64
    .4byte gUnknown_0861AD8C + 0x5b14
    .4byte gUnknown_0861AD8C + 0x5c1c
    .4byte gUnknown_0861AD8C + 0x5d58
    .4byte gUnknown_0861AD8C + 0x5ecc
    .4byte gUnknown_0861AD8C + 0x6064
    .4byte gUnknown_0861AD8C + 0x61d8
    .4byte gUnknown_0861AD8C + 0x62e4
    .4byte gUnknown_0861AD8C + 0x63b8
    .4byte gUnknown_0861AD8C + 0x6458
    .4byte gUnknown_0861AD8C + 0x6578
    .4byte gUnknown_0861AD8C + 0x6694
    .4byte gUnknown_0861AD8C + 0x67a8
    .4byte gUnknown_0861AD8C + 0x68a0
    .4byte gUnknown_0861AD8C + 0x6988
    .4byte gUnknown_0861AD8C + 0x6a58
    .4byte gUnknown_0861AD8C + 0x6b1c

	.global gUnknown_085D97C4
gUnknown_085D97C4:  @ 0x085D97C4
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80df854
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806F3F8
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D97DC
gUnknown_085D97DC:  @ 0x085D97DC
    .4byte gUnknown_0862A2F0 + 0x20
    .4byte gUnknown_0862A2F0 + 0x11c
    .4byte gUnknown_0862A2F0 + 0x21c
    .4byte gUnknown_0862A2F0 + 0x320
    .4byte gUnknown_0862A2F0 + 0x418
    .4byte gUnknown_0862A2F0 + 0x524
    .4byte gUnknown_0862A2F0 + 0x630
    .4byte gUnknown_0862A2F0 + 0x750
    .4byte gUnknown_0862A2F0 + 0x874
    .4byte gUnknown_0862A2F0 + 0x95c
    .4byte gUnknown_0862A2F0 + 0xa38
    .4byte gUnknown_0862A2F0 + 0xaf8
    .4byte gUnknown_0862A2F0 + 0xbb0
    .4byte gUnknown_0862A2F0 + 0xc58
    .4byte gUnknown_0862A2F0 + 0xd14
    .4byte gUnknown_0862A2F0 + 0xdec
    .4byte gUnknown_0862A2F0 + 0xecc
    .4byte gUnknown_0862A2F0 + 0xfbc
    .4byte gUnknown_0862A2F0 + 0x10b8
    .4byte gUnknown_0862A2F0 + 0x11ac
    .4byte gUnknown_0862A2F0 + 0x12a4
    .4byte gUnknown_0862A2F0 + 0x1390
    .4byte gUnknown_0862A2F0 + 0x1474
    .4byte gUnknown_0862A2F0 + 0x154c
    .4byte gUnknown_0862A2F0 + 0x161c
    .4byte gUnknown_0862A2F0 + 0x16e8
    .4byte gUnknown_0862A2F0 + 0x17b0
    .4byte gUnknown_0862A2F0 + 0x1864
    .4byte gUnknown_0862A2F0 + 0x1918
    .4byte gUnknown_0862A2F0 + 0x19b8
    .4byte gUnknown_0862A2F0 + 0x1a6c
    .4byte gUnknown_0862A2F0 + 0x1b28
    .4byte gUnknown_0862A2F0 + 0x1c04
    .4byte gUnknown_0862A2F0 + 0x1cec
    .4byte gUnknown_0862A2F0 + 0x1e10
    .4byte gUnknown_0862A2F0 + 0x1f30
    .4byte gUnknown_0862A2F0 + 0x203c
    .4byte gUnknown_0862A2F0 + 0x2148
    .4byte gUnknown_0862A2F0 + 0x2244
    .4byte gUnknown_0862A2F0 + 0x2344
    .4byte gUnknown_0862A2F0 + 0x2440

	.global gUnknown_085D9880
gUnknown_085D9880:  @ 0x085D9880
    .4byte gUnknown_0862688C + 0xb8
    .4byte gUnknown_0862688C + 0xb8
    .4byte gUnknown_0862688C + 0xb8
    .4byte gUnknown_0862688C + 0xc88
    .4byte gUnknown_0862688C + 0xc88
    .4byte gUnknown_0862688C + 0xc88
    .4byte gUnknown_0862688C + 0x1998
    .4byte gUnknown_0862688C + 0x1998
    .4byte gUnknown_0862688C + 0x1998
    .4byte gUnknown_0862688C + 0x1998
    .4byte gUnknown_0862688C + 0x1998
    .4byte gUnknown_0862688C + 0x1998
    .4byte gUnknown_0862688C + 0x2bf4
    .4byte gUnknown_0862688C + 0x2bf4
    .4byte gUnknown_0862688C + 0x2bf4
    .4byte gUnknown_0862688C + 0x2bf4
    .4byte gUnknown_0862688C + 0x2bf4
    .4byte gUnknown_0862688C + 0x2bf4
    .4byte gUnknown_0862688C + 0x3278
    .4byte gUnknown_0862688C + 0x3278
    .4byte gUnknown_0862688C + 0x3278
    .4byte gUnknown_0862688C + 0x3278
    .4byte gUnknown_0862688C + 0x37d4
    .4byte gUnknown_0862688C + 0x37d4
    .4byte gUnknown_0862688C + 0x37d4
    .4byte gUnknown_0862688C + 0x37d4
    .4byte gUnknown_0862688C + 0x37d4
    .4byte gUnknown_0862688C + 0x37d4
    .4byte gUnknown_0862688C + 0x37d4
    .4byte gUnknown_0862688C + 0x1998
    .4byte gUnknown_0862688C + 0x1998
    .4byte gUnknown_0862688C + 0x1998
    .4byte gUnknown_0862688C + 0x1998
    .4byte gUnknown_0862688C + 0x1998
    .4byte gUnknown_0862688C + 0x1998
    .4byte gUnknown_0862688C + 0xc88
    .4byte gUnknown_0862688C + 0xc88
    .4byte gUnknown_0862688C + 0xc88
    .4byte gUnknown_0862688C + 0xb8
    .4byte gUnknown_0862688C + 0xb8
    .4byte gUnknown_0862688C + 0xb8

	.global gUnknown_085D9924
gUnknown_085D9924:  @ 0x085D9924
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80df910
        @ PROC_SET_END_CB
        .short 0x4, 0x0
        .word sub_806F4B4
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806F4C0
        @ PROC_SLEEP
        .short 0xe, 0x20
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806F4F8
        @ PROC_SLEEP
        .short 0xe, 0xb
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806F530
        @ PROC_SLEEP
        .short 0xe, 0x16
        .word 0x0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D996C
gUnknown_085D996C:  @ 0x085D996C
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80df924
        @ PROC_SET_END_CB
        .short 0x4, 0x0
        .word sub_806F4B4
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806F568
        @ PROC_SLEEP
        .short 0xe, 0xe
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806F594
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global ProcScr_efxopMistyrain
ProcScr_efxopMistyrain:  @ 0x085D999C
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80df938
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806F5E0
        @ PROC_SLEEP
        .short 0xe, 0xaa
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_806E904
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global ProcScr_efxopMyrrh
ProcScr_efxopMyrrh:  @ 0x085D99C4
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80df948
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806F668
        @ PROC_SLEEP
        .short 0xe, 0x32
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_806E904
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D99EC
gUnknown_085D99EC:  @ 0x085D99EC
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806F6D4
        @ PROC_SLEEP
        .short 0xe, 0x18
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806F6EC
        @ PROC_SLEEP
        .short 0xe, 0x48
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_806E904
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D9A1C
gUnknown_085D9A1C:  @ 0x085D9A1C
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806F75C
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D9A2C
gUnknown_085D9A2C:  @ 0x085D9A2C
    .4byte gUnknown_086C978C + 0x28
    .4byte gUnknown_086C978C + 0x620
    .4byte gUnknown_086C978C + 0xc38
    .4byte gUnknown_086C978C + 0x1308
    .4byte gUnknown_086C978C + 0x1a38
    .4byte gUnknown_086C978C + 0x2164
    .4byte gUnknown_086C978C + 0x2958
    .4byte gUnknown_086C978C + 0x3114
    .4byte gUnknown_086C978C + 0x390c
    .4byte gUnknown_086C978C + 0x41fc
    .4byte gUnknown_086C978C + 0x49d0
    .4byte gUnknown_086C978C + 0x5270
    .4byte gUnknown_086C978C + 0x5ab8
    .4byte gUnknown_086C978C + 0x624c
    .4byte gUnknown_086C978C + 0x6adc
    .4byte gUnknown_086C978C + 0x7398
    .4byte gUnknown_086C978C + 0x7bc0
    .4byte gUnknown_086C978C + 0x83e0
    .4byte gUnknown_086C978C + 0x8c74
    .4byte gUnknown_086C978C + 0x9458
    .4byte gUnknown_086C978C + 0xb47c
    .4byte gUnknown_086C978C + 0xbc8c
    .4byte gUnknown_086C978C + 0xc6b8
    .4byte gUnknown_086C978C + 0xd120
    .4byte gUnknown_086C978C + 0xdc18
    .4byte gUnknown_086C978C + 0xe794

	.global gUnknown_085D9A94
gUnknown_085D9A94:  @ 0x085D9A94
    .4byte gUnknown_086C978C + 0x9f48
    .4byte gUnknown_086C978C + 0xa028
    .4byte gUnknown_086C978C + 0xa104
    .4byte gUnknown_086C978C + 0xa1ec
    .4byte gUnknown_086C978C + 0xa2f0
    .4byte gUnknown_086C978C + 0xa3ec
    .4byte gUnknown_086C978C + 0xa4f8
    .4byte gUnknown_086C978C + 0xa600
    .4byte gUnknown_086C978C + 0xa708
    .4byte gUnknown_086C978C + 0xa830
    .4byte gUnknown_086C978C + 0xa940
    .4byte gUnknown_086C978C + 0xaa68
    .4byte gUnknown_086C978C + 0xab8c
    .4byte gUnknown_086C978C + 0xac9c
    .4byte gUnknown_086C978C + 0xadc0
    .4byte gUnknown_086C978C + 0xaee0
    .4byte gUnknown_086C978C + 0xaffc
    .4byte gUnknown_086C978C + 0xb110
    .4byte gUnknown_086C978C + 0xb244
    .4byte gUnknown_086C978C + 0xb350
    .4byte gUnknown_086D8A94 + 0xc0
    .4byte gUnknown_086D8A94 + 0x1d0
    .4byte gUnknown_086D8A94 + 0x358
    .4byte gUnknown_086D8A94 + 0x510
    .4byte gUnknown_086D8A94 + 0x6dc
    .4byte gUnknown_086D8A94 + 0x8c0

	.global gUnknown_085D9AFC
gUnknown_085D9AFC:  @ 0x085D9AFC
    .4byte gUnknown_086C978C + 0x9cc8
    .4byte gUnknown_086C978C + 0x9ce8
    .4byte gUnknown_086C978C + 0x9d08
    .4byte gUnknown_086C978C + 0x9d28
    .4byte gUnknown_086C978C + 0x9d48
    .4byte gUnknown_086C978C + 0x9d68
    .4byte gUnknown_086C978C + 0x9d88
    .4byte gUnknown_086C978C + 0x9da8
    .4byte gUnknown_086C978C + 0x9dc8
    .4byte gUnknown_086C978C + 0x9de8
    .4byte gUnknown_086C978C + 0x9e08
    .4byte gUnknown_086C978C + 0x9e28
    .4byte gUnknown_086C978C + 0x9e48
    .4byte gUnknown_086C978C + 0x9e68
    .4byte gUnknown_086C978C + 0x9e88
    .4byte gUnknown_086C978C + 0x9ea8
    .4byte gUnknown_086C978C + 0x9ec8
    .4byte gUnknown_086C978C + 0x9ee8
    .4byte gUnknown_086C978C + 0x9f08
    .4byte gUnknown_086C978C + 0x9f28
    .4byte gUnknown_086D8A94
    .4byte gUnknown_086D8A94 + 0x20
    .4byte gUnknown_086D8A94 + 0x40
    .4byte gUnknown_086D8A94 + 0x60
    .4byte gUnknown_086D8A94 + 0x80
    .4byte gUnknown_086D8A94 + 0xa0

	.global gUnknown_085D9B64
gUnknown_085D9B64:  @ 0x085D9B64
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806F820
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D9B74
gUnknown_085D9B74:  @ 0x085D9B74
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806F864
        @ PROC_SLEEP
        .short 0xe, 0x3e
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806F87C
        @ PROC_SLEEP
        .short 0xe, 0x8a
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_806E904
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D9BA4
gUnknown_085D9BA4:  @ 0x085D9BA4
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806F8F0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D9BB4
gUnknown_085D9BB4:  @ 0x085D9BB4
    .4byte gUnknown_086BDA5C + 0x120
    .4byte gUnknown_086BDA5C + 0x670
    .4byte gUnknown_086BDA5C + 0xc0c
    .4byte gUnknown_086BDA5C + 0x1200
    .4byte gUnknown_086BDA5C + 0x1898
    .4byte gUnknown_086BDA5C + 0x1f54
    .4byte gUnknown_086BDA5C + 0x26b4
    .4byte gUnknown_086BDA5C + 0x2ec8
    .4byte gUnknown_086BDA5C + 0x3740
    .4byte gUnknown_086BDA5C + 0x4074
    .4byte gUnknown_086BDA5C + 0x49dc
    .4byte gUnknown_086BDA5C + 0x534c
    .4byte gUnknown_086BDA5C + 0x5d00
    .4byte gUnknown_086BDA5C + 0x6698
    .4byte gUnknown_086BDA5C + 0x7058
    .4byte gUnknown_086BDA5C + 0x7970
    .4byte gUnknown_086BDA5C + 0x82c4
    .4byte gUnknown_086BDA5C + 0x8c40
    .4byte gUnknown_086BDA5C + 0x95b4

	.global gUnknown_085D9C00
gUnknown_085D9C00:  @ 0x085D9C00
    .4byte gUnknown_086C794C + 0x20
    .4byte gUnknown_086C794C + 0xe0
    .4byte gUnknown_086C794C + 0x1ac
    .4byte gUnknown_086C794C + 0x284
    .4byte gUnknown_086C794C + 0x370
    .4byte gUnknown_086C794C + 0x474
    .4byte gUnknown_086C794C + 0x588
    .4byte gUnknown_086C794C + 0x6b0
    .4byte gUnknown_086C794C + 0x7ec
    .4byte gUnknown_086C794C + 0x940
    .4byte gUnknown_086C794C + 0xab8
    .4byte gUnknown_086C794C + 0xc24
    .4byte gUnknown_086C794C + 0xd98
    .4byte gUnknown_086C794C + 0xf14
    .4byte gUnknown_086C794C + 0x10a0
    .4byte gUnknown_086C794C + 0x11e4
    .4byte gUnknown_086C794C + 0x1338
    .4byte gUnknown_086C794C + 0x149c
    .4byte gUnknown_086C794C + 0x1600

	.global gUnknown_085D9C4C
gUnknown_085D9C4C:  @ 0x085D9C4C
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806F9D8
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0
