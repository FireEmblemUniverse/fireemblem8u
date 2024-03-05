	.section .data

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
        .word EfxSunakemuriMain
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
        .word EfxSunakemuriOBJMain
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
        .word EfxLokmsunaMain
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
        .word EfxLokmsunaIOBJMain
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
        .word EfxKingPikaMain
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
        .word EfxFlashFXMain
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
        .word EfxSongOBJ2Main
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
        .word EfxDanceOBJMain
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0
