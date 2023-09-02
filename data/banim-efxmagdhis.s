	.section .data

	.global ProcScr_efxMagdhisEffect
ProcScr_efxMagdhisEffect:  @ 0x085D9244
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80df4cc
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word EfxMagdhisEffectMain
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global ProcScr_efxMagdhisEffectBG
ProcScr_efxMagdhisEffectBG:  @ 0x085D925C
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80df4e0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word EfxMagdhisEffectBGMain
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D9274
gUnknown_085D9274:  @ 0x085D9274
    .4byte gUnknown_085F0E04 + 0x20
    .4byte gUnknown_085F0E04 + 0x120
    .4byte gUnknown_085F0E04 + 0x214
    .4byte gUnknown_085F0E04 + 0x2e8
