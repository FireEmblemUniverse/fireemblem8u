	.section .data

	.global ProcScr_efxFire
ProcScr_efxFire:  @ 0x085D54A0
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dcd14
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word Loop6C_efxFire
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global ProcScr_efxFireBG
ProcScr_efxFireBG:  @ 0x085D54B8
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dcd1c
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word Loop6C_efxFireBG
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D54D0
gUnknown_085D54D0:  @ 0x085D54D0
    .4byte Pal_FireSpellBg + 0x20
    .4byte Pal_FireSpellBg + 0xc8
    .4byte Pal_FireSpellBg + 0x170
    .4byte Pal_FireSpellBg + 0x228
    .4byte Pal_FireSpellBg + 0x2f0
    .4byte Pal_FireSpellBg + 0x3c0
    .4byte Pal_FireSpellBg + 0x4c0
    .4byte Pal_FireSpellBg + 0x5c8
    .4byte Pal_FireSpellBg + 0x6dc
    .4byte Pal_FireSpellBg + 0x814
    .4byte Pal_FireSpellBg + 0x918
    .4byte Pal_FireSpellBg + 0x9ec

	.global gUnknown_085D5500
gUnknown_085D5500:  @ 0x085D5500
    .4byte Pal_FireSpellBg + 0xaac
    .4byte Pal_FireSpellBg + 0xb54
    .4byte Pal_FireSpellBg + 0xbfc
    .4byte Pal_FireSpellBg + 0xcb4
    .4byte Pal_FireSpellBg + 0xd7c
    .4byte Pal_FireSpellBg + 0xe4c
    .4byte Pal_FireSpellBg + 0xf4c
    .4byte Pal_FireSpellBg + 0x1054
    .4byte Pal_FireSpellBg + 0x1168
    .4byte Pal_FireSpellBg + 0x12a0
    .4byte Pal_FireSpellBg + 0x13a4
    .4byte Pal_FireSpellBg + 0x1478

	.global ProcScr_efxFireOBJ
ProcScr_efxFireOBJ:  @ 0x085D5530
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dcd58
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_805DDA8
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global ProcScr_efxFireHITBG
ProcScr_efxFireHITBG:  @ 0x085D5548
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dcd64
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_805DE74
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D5560
gUnknown_085D5560:  @ 0x085D5560
    .4byte gUnknown_085F8468 + 0x2c
    .4byte gUnknown_085F8468 + 0x2c
    .4byte gUnknown_085F8468 + 0x2c
    .4byte gUnknown_085F8468 + 0x2c
    .4byte gUnknown_085F8468 + 0x2c
    .4byte gUnknown_085F8468 + 0x2c
    .4byte gUnknown_085F8468 + 0xd68
    .4byte gUnknown_085F8468 + 0xd68
    .4byte gUnknown_085F8468 + 0xd68
    .4byte gUnknown_085F8468 + 0x1a44
    .4byte gUnknown_085F8468 + 0x1a44
    .4byte gUnknown_085F8468 + 0x286c
    .4byte gUnknown_085F8468 + 0x286c
    .4byte gUnknown_085F8468 + 0x3860
    .4byte gUnknown_085F8468 + 0x3860
    .4byte gUnknown_085F8468 + 0x4afc
    .4byte gUnknown_085F8468 + 0x56c8
    .4byte gUnknown_085F8468 + 0x62c0
    .4byte gUnknown_085F8468 + 0x6e18
    .4byte gUnknown_085F8468 + 0x7914
    .4byte gUnknown_085F8468 + 0x831c

	.global gUnknown_085D55B4
gUnknown_085D55B4:  @ 0x085D55B4
    .4byte gUnknown_0860108C + 0x20
    .4byte gUnknown_0860108C + 0xcc
    .4byte gUnknown_0860108C + 0x184
    .4byte gUnknown_0860108C + 0x250
    .4byte gUnknown_0860108C + 0x330
    .4byte gUnknown_0860108C + 0x424
    .4byte gUnknown_0860108C + 0x53c
    .4byte gUnknown_0860108C + 0x668
    .4byte gUnknown_0860108C + 0x7a0
    .4byte gUnknown_0860108C + 0x8e4
    .4byte gUnknown_0860108C + 0xa38
    .4byte gUnknown_0860108C + 0xb90
    .4byte gUnknown_0860108C + 0xcf8
    .4byte gUnknown_0860108C + 0xe64
    .4byte gUnknown_0860108C + 0xfe0
    .4byte gUnknown_0860108C + 0x1174
    .4byte gUnknown_0860108C + 0x1314
    .4byte gUnknown_0860108C + 0x14b4
    .4byte gUnknown_0860108C + 0x1654
    .4byte gUnknown_0860108C + 0x17f4
    .4byte gUnknown_0860108C + 0x1984

	.global ProcScr_efxElfireBG
ProcScr_efxElfireBG:  @ 0x085D5608
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dcdc8
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_805DF70
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global ProcScr_efxElfireBGCOL
ProcScr_efxElfireBGCOL:  @ 0x085D5620
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dcdd4
        @ PROC_MARK
        .short 0xf, 0xa
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_805DFE8
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global ProcScr_efxElfireOBJ
ProcScr_efxElfireOBJ:  @ 0x085D5640
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80dce3c
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_805E0B4
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0
