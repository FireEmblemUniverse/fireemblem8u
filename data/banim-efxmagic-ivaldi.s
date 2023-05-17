	.section .data

	.global ProcScr_efxIvaldi
ProcScr_efxIvaldi:  @ 0x085D7688
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80de4cc
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word Loop6C_efxIvaldi
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D76A0
gUnknown_085D76A0:  @ 0x085D76A0
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80de4d8
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word Loop6C_efxIvaldiBG1
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D76B8
gUnknown_085D76B8:  @ 0x085D76B8
    .4byte gUnknown_086945C4 + 0x20
    .4byte gUnknown_086945C4 + 0xdc
    .4byte gUnknown_086945C4 + 0x200
    .4byte gUnknown_086945C4 + 0x398
    .4byte gUnknown_086945C4 + 0x594
    .4byte gUnknown_086945C4 + 0x80c
    .4byte gUnknown_086945C4 + 0xa84
    .4byte gUnknown_086945C4 + 0xcfc
    .4byte gUnknown_086945C4 + 0xf6c
    .4byte gUnknown_086945C4 + 0x1180
    .4byte gUnknown_086945C4 + 0x132c
    .4byte gUnknown_086945C4 + 0x1470

	.global gUnknown_085D76E8
gUnknown_085D76E8:  @ 0x085D76E8
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80de518
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word Loop6C_efxIvaldiBG2
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D7700
gUnknown_085D7700:  @ 0x085D7700
    .4byte gUnknown_08696840 + 0x20
    .4byte gUnknown_08696840 + 0xb8
    .4byte gUnknown_08696840 + 0x24c
    .4byte gUnknown_08696840 + 0x3e8
    .4byte gUnknown_08696840 + 0x584

	.global ProcScr_efxDanceparaBG3
ProcScr_efxDanceparaBG3:  @ 0x085D7714
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80de544
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word Loop6C_efxIvaldiBG3
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D772C
gUnknown_085D772C:  @ 0x085D772C
    .4byte gUnknown_08696840 + 0x8130
    .4byte gUnknown_08696840 + 0x8374
    .4byte gUnknown_08696840 + 0x85ec
    .4byte gUnknown_08696840 + 0x8850
    .4byte gUnknown_08696840 + 0x8ac4
    .4byte gUnknown_08696840 + 0x8d80
    .4byte gUnknown_08696840 + 0x9048
    .4byte gUnknown_08696840 + 0x930c
    .4byte gUnknown_08696840 + 0x95bc
    .4byte gUnknown_08696840 + 0x9870
    .4byte gUnknown_08696840 + 0x9b48

	.global gUnknown_085D7758
gUnknown_085D7758:  @ 0x085D7758
    .4byte gUnknown_08696840 + 0x724
    .4byte gUnknown_08696840 + 0xdd0
    .4byte gUnknown_08696840 + 0x14d8
    .4byte gUnknown_08696840 + 0x1d44
    .4byte gUnknown_08696840 + 0x2738
    .4byte gUnknown_08696840 + 0x32ac
    .4byte gUnknown_08696840 + 0x3ecc
    .4byte gUnknown_08696840 + 0x4c30
    .4byte gUnknown_08696840 + 0x58f0
    .4byte gUnknown_08696840 + 0x65dc
    .4byte gUnknown_08696840 + 0x7350

	.global gUnknown_085D7784
gUnknown_085D7784:  @ 0x085D7784
    .4byte gUnknown_08696840 + 0x7fd0
    .4byte gUnknown_08696840 + 0x7ff0
    .4byte gUnknown_08696840 + 0x8010
    .4byte gUnknown_08696840 + 0x8030
    .4byte gUnknown_08696840 + 0x8050
    .4byte gUnknown_08696840 + 0x8070
    .4byte gUnknown_08696840 + 0x8090
    .4byte gUnknown_08696840 + 0x80b0
    .4byte gUnknown_08696840 + 0x80d0
    .4byte gUnknown_08696840 + 0x80f0
    .4byte gUnknown_08696840 + 0x8110

	.global ProcScr_efxDanceparaBG4
ProcScr_efxDanceparaBG4:  @ 0x085D77B0
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80de580
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8065CA0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D77C8
gUnknown_085D77C8:  @ 0x085D77C8
    .4byte gUnknown_086A1CE0 + 0x20

	.global ProcScr_efxDanceparaOBJFall
ProcScr_efxDanceparaOBJFall:  @ 0x085D77CC
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80de594
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8065DF8
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global efxIvaldiOBJSideWash
efxIvaldiOBJSideWash:  @ 0x085D77E4
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80de5a8
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word Loop6C_efxIvaldiOBJSideWash
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global ProcScr_efxDanceparaOBJUprise
ProcScr_efxDanceparaOBJUprise:  @ 0x085D77FC
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80de5c0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80660B4
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global ProcScr_efxDanceparaOBJ1
ProcScr_efxDanceparaOBJ1:  @ 0x085D7814
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80de5d4
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806635C
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global ProcScr_efxDanceparaOBJ2
ProcScr_efxDanceparaOBJ2:  @ 0x085D782C
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80de614
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8066434
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global ProcScr_efxDanceparaWOUT
ProcScr_efxDanceparaWOUT:  @ 0x085D7844
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80de62c
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80664A8
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0
