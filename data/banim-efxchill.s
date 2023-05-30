	.section .data

	.global ProcScr_efxChillEffect
ProcScr_efxChillEffect:  @ 0x085D92A4
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80df524
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word EfxChillEffectMain
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global ProcScr_efxChillEffectBG
ProcScr_efxChillEffectBG:  @ 0x085D92BC
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80df534
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word EfxChillEffectBGMain
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D92D4
gUnknown_085D92D4:  @ 0x085D92D4
    .4byte gUnknown_087456E8 + 0xc0
    .4byte gUnknown_087456E8 + 0x48c
    .4byte gUnknown_087456E8 + 0x8e8

	.global ProcScr_efxChillEffectBGCOL
ProcScr_efxChillEffectBGCOL:  @ 0x085D92E0
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80df554
        @ PROC_MARK
        .short 0xf, 0xa
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806E158
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global ProcScr_efxChillAnime
ProcScr_efxChillAnime:  @ 0x085D9300
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80df5b4
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806E290
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0
