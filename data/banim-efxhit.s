	.section .data

	.global gUnknown_085D8CE4
gUnknown_085D8CE4:  @ 0x085D8CE4
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_806C14C
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806C154
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806C1B8
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806C2D4
        @ PROC_CALL
        .short 0x2, 0x0
        .word EnablePaletteSync
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D8D14
gUnknown_085D8D14:  @ 0x085D8D14
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_806C14C
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806C478
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806C1B8
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806C2D4
        @ PROC_CALL
        .short 0x2, 0x0
        .word EnablePaletteSync
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global ProcScr_efxDamageMojiEffect
ProcScr_efxDamageMojiEffect:  @ 0x085D8D44
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80df11c
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word efxDamageMojiEffectMain
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global ProcScr_efxDamageMojiEffectOBJ
ProcScr_efxDamageMojiEffectOBJ:  @ 0x085D8D5C
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80df130
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word efxDamageMojiEffectOBJMain
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global ProcScr_efxCriricalEffect
ProcScr_efxCriricalEffect:  @ 0x085D8D74
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80df148
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word efxCriricalEffectMain
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global ProcScr_efxCriricalEffectBG
ProcScr_efxCriricalEffectBG:  @ 0x085D8D8C
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80df15c
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word efxCriricalEffectBGMain
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global ProcScr_efxCriricalEffectBGCOL
ProcScr_efxCriricalEffectBGCOL:  @ 0x085D8DA4
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80df170
        @ PROC_MARK
        .short 0xf, 0xa
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word efxCriricalEffectBGCOLMain
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global ProcScr_efxNormalEffect
ProcScr_efxNormalEffect:  @ 0x085D8DC4
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80df1cc
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word efxNormalEffectMain
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global ProcScr_efxNormalEffectBG
ProcScr_efxNormalEffectBG:  @ 0x085D8DDC
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80df1dc
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word efxNormalEffectBGMain
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D8DF4
gUnknown_085D8DF4:  @ 0x085D8DF4
    .4byte gUnknown_085E9150 + 0x20
    .4byte gUnknown_085E9150 + 0xec
    .4byte gUnknown_085E9150 + 0x1ec
    .4byte gUnknown_085E9150 + 0x2fc
    .4byte gUnknown_085E9150 + 0x408
    .4byte gUnknown_085E9150 + 0x50c
    .4byte gUnknown_085E9150 + 0x5f8
    .4byte gUnknown_085E9150 + 0x6cc
    .4byte gUnknown_085E9150 + 0x788
    .4byte gUnknown_085E9150 + 0x830

	.global ProcScr_efxPierceCriticalEffect
ProcScr_efxPierceCriticalEffect:  @ 0x085D8E1C
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80df218
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word efxPierceCriticalEffectMain
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global ProcScr_efxPierceCriticalEffectBG
ProcScr_efxPierceCriticalEffectBG:  @ 0x085D8E34
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80df230
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word efxPierceCriticalEffectBGMain
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global ProcScr_efxPierceCriticalEffectBGCOL
ProcScr_efxPierceCriticalEffectBGCOL:  @ 0x085D8E4C
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80df24c
        @ PROC_MARK
        .short 0xf, 0xa
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word efxPierceCriticalEffectBGCOLMain
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global ProcScr_efxPierceNormalEffect
ProcScr_efxPierceNormalEffect:  @ 0x085D8E6C
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80df2ac
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word efxPierceNormalEffectMain
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global ProcScr_efxPierceNormalEffectBG
ProcScr_efxPierceNormalEffectBG:  @ 0x085D8E84
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80df2c4
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word efxPierceNormalEffectBGMain
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D8E9C
gUnknown_085D8E9C:  @ 0x085D8E9C
    .4byte gUnknown_085D1470 + 0x20
    .4byte gUnknown_085D1470 + 0xec
    .4byte gUnknown_085D1470 + 0x1f8
    .4byte gUnknown_085D1470 + 0x320
    .4byte gUnknown_085D1470 + 0x444
    .4byte gUnknown_085D1470 + 0x56c
    .4byte gUnknown_085D1470 + 0x68c
    .4byte gUnknown_085D1470 + 0x78c
    .4byte gUnknown_085D1470 + 0x86c
    .4byte gUnknown_085D1470 + 0x930

	.global ProcScr_efxYushaSpinShield
ProcScr_efxYushaSpinShield:  @ 0x085D8EC4
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80df308
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word EfxYushaSpinShieldMain
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global ProcScr_efxYushaSpinShieldOBJ
ProcScr_efxYushaSpinShieldOBJ:  @ 0x085D8EDC
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80df31c
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word efxYushaSpinShieldOBJ_806CD14
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word efxYushaSpinShieldOBJ_806CD7C
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word efxYushaSpinShieldOBJ_806CDA4
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word efxYushaSpinShieldOBJ_806CE08
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global ProcScr_efxHurtmutEff00
ProcScr_efxHurtmutEff00:  @ 0x085D8F0C
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80df334
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word EfxHurtmutEff00Main
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global ProcScr_efxHurtmutEff00OBJ
ProcScr_efxHurtmutEff00OBJ:  @ 0x085D8F24
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80df344
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word efxHurtmutEff00OBJ_806CEC4
        @ PROC_SLEEP
        .short 0xe, 0x1a
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word efxHurtmutEff00OBJ_806CF10
        @ PROC_SLEEP
        .short 0xe, 0x8
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word efxHurtmutEff00OBJ_806CF5C
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global ProcScr_efxHurtmutEff01OBJ
ProcScr_efxHurtmutEff01OBJ:  @ 0x085D8F5C
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80df358
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word efxHurtmutEff01OBJ_806CFC4
        @ PROC_SLEEP
        .short 0xe, 0x3a
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word efxHurtmutEff01OBJ_806D010
        @ PROC_SLEEP
        .short 0xe, 0x15
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word efxHurtmutEff01OBJ_806D05C
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global ProcScr_efxMagfcast
ProcScr_efxMagfcast:  @ 0x085D8F94
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80df36c
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word EfxMagfcastMain
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global ProcScr_efxMagfcastBG
ProcScr_efxMagfcastBG:  @ 0x085D8FAC
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80df378
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word EfxMagfcastBGMain
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D8FC4
gUnknown_085D8FC4:  @ 0x085D8FC4
    .4byte gUnknown_085EF24C + 0x20
    .4byte gUnknown_085EF24C + 0xbc
    .4byte gUnknown_085EF24C + 0x158
    .4byte gUnknown_085EF24C + 0x1f8
    .4byte gUnknown_085EF24C + 0x29c
    .4byte gUnknown_085EF24C + 0x350

	.global gUnknown_085D8FDC
gUnknown_085D8FDC:  @ 0x085D8FDC
    .4byte gUnknown_085EF24C + 0x3f8
    .4byte gUnknown_085EF24C + 0x4a8
    .4byte gUnknown_085EF24C + 0x558
    .4byte gUnknown_085EF24C + 0x610
    .4byte gUnknown_085EF24C + 0x6c8
    .4byte gUnknown_085EF24C + 0x77c
    .4byte gUnknown_085EF24C + 0x81c
    .4byte gUnknown_085EF24C + 0x8d0
    .4byte gUnknown_085EF24C + 0x984
    .4byte gUnknown_085EF24C + 0xa38
    .4byte gUnknown_085EF24C + 0xad8
    .4byte gUnknown_085EF24C + 0xb94
    .4byte gUnknown_085EF24C + 0xc44
    .4byte gUnknown_085EF24C + 0xd14
    .4byte gUnknown_085EF24C + 0xdcc
    .4byte gUnknown_085EF24C + 0xe9c

	.global ProcScr_efxSunakemuri
ProcScr_efxSunakemuri:  @ 0x085D901C
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80df3e8
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806D350
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0

	.global ProcScr_efxSunakemuriOBJ
ProcScr_efxSunakemuriOBJ:  @ 0x085D9034
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80df3f8
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806D540
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global ProcScr_efxLokmsuna
ProcScr_efxLokmsuna:  @ 0x085D904C
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80df40c
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806D59C
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global ProcScr_efxLokmsunaOBJ
ProcScr_efxLokmsunaOBJ:  @ 0x085D9064
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80df418
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806D62C
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global ProcScr_efxKingPika
ProcScr_efxKingPika:  @ 0x085D907C
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80df428
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806D678
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global ProcScr_efxFlashFX
ProcScr_efxFlashFX:  @ 0x085D9094
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80df434
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806D704
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global ProcScr_efxSongOBJ2
ProcScr_efxSongOBJ2:  @ 0x085D90AC
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80df440
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806D7D8
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global ProcScr_efxDanceOBJ
ProcScr_efxDanceOBJ:  @ 0x085D90C4
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80df44c
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806D89C
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0
