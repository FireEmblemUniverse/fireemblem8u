	.section .data

	.global ProcScr_efxSkillType01BG
ProcScr_efxSkillType01BG:  @ 0x085D9318
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80df5c4
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word EfxSkillType01BGMain
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global TsaLut_EfxSkillType01BG
TsaLut_EfxSkillType01BG:  @ 0x085D9330
    .4byte gUnknown_085C9328 + 0x5b44
    .4byte gUnknown_085C9328 + 0x5bdc
    .4byte gUnknown_085C9328 + 0x5c7c
    .4byte gUnknown_085C9328 + 0x5d1c
    .4byte gUnknown_085C9328 + 0x5dc0
    .4byte gUnknown_085C9328 + 0x5e78
    .4byte gUnknown_085C9328 + 0x5f3c
    .4byte gUnknown_085C9328 + 0x6014
    .4byte gUnknown_085C9328 + 0x6118
    .4byte gUnknown_085C9328 + 0x621c
    .4byte gUnknown_085C9328 + 0x6320
    .4byte gUnknown_085C9328 + 0x6428
    .4byte gUnknown_085C9328 + 0x6514
    .4byte gUnknown_085C9328 + 0x65f4
    .4byte gUnknown_085C9328 + 0x66cc
    .4byte gUnknown_085C9328 + 0x6798

	.global ImgLut_EfxSkillType01BG
ImgLut_EfxSkillType01BG:  @ 0x085D9370
    .4byte gUnknown_085C9328 + 0x34
    .4byte gUnknown_085C9328 + 0x418
    .4byte gUnknown_085C9328 + 0x810
    .4byte gUnknown_085C9328 + 0xc20
    .4byte gUnknown_085C9328 + 0x1058
    .4byte gUnknown_085C9328 + 0x14d4
    .4byte gUnknown_085C9328 + 0x19cc
    .4byte gUnknown_085C9328 + 0x1fa4
    .4byte gUnknown_085C9328 + 0x2684
    .4byte gUnknown_085C9328 + 0x2dc0
    .4byte gUnknown_085C9328 + 0x34f8
    .4byte gUnknown_085C9328 + 0x3bec
    .4byte gUnknown_085C9328 + 0x4278
    .4byte gUnknown_085C9328 + 0x48d8
    .4byte gUnknown_085C9328 + 0x4ed8
    .4byte gUnknown_085C9328 + 0x549c

	.global PalLut_EfxSkillType01BG
PalLut_EfxSkillType01BG:  @ 0x085D93B0
    .4byte gUnknown_085C9328 + 0x5944
    .4byte gUnknown_085C9328 + 0x5964
    .4byte gUnknown_085C9328 + 0x5984
    .4byte gUnknown_085C9328 + 0x59a4
    .4byte gUnknown_085C9328 + 0x59c4
    .4byte gUnknown_085C9328 + 0x59e4
    .4byte gUnknown_085C9328 + 0x5a04
    .4byte gUnknown_085C9328 + 0x5a24
    .4byte gUnknown_085C9328 + 0x5a44
    .4byte gUnknown_085C9328 + 0x5a64
    .4byte gUnknown_085C9328 + 0x5a84
    .4byte gUnknown_085C9328 + 0x5aa4
    .4byte gUnknown_085C9328 + 0x5ac4
    .4byte gUnknown_085C9328 + 0x5ae4
    .4byte gUnknown_085C9328 + 0x5b04
    .4byte gUnknown_085C9328 + 0x5b24

	.global ProcScr_efxSkillCommonBG
ProcScr_efxSkillCommonBG:  @ 0x085D93F0
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80df618
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806E6E0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806E868
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806E610
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806E638
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806E8A4
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806E79C
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0
