	.section .data

	.global ProcScr_efxSpecalEffect
ProcScr_efxSpecalEffect:  @ 0x085D90DC
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80df458
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_806D980
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global ProcScr_efxSRankWeaponEffect
ProcScr_efxSRankWeaponEffect:  @ 0x085D90F4
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80df468
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word EfxSRankWeaponEffectMain
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global ProcScr_efxSRankWeaponEffectBG
ProcScr_efxSRankWeaponEffectBG:  @ 0x085D910C
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80df480
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word EfxSRankWeaponEffectBGMain
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global efxSRankWeaponEffectSCR
efxSRankWeaponEffectSCR:  @ 0x085D9124
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80df498
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word EfxSRankWeaponEffectSCRMain
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global efxSRankWeaponEffectSCR2
efxSRankWeaponEffectSCR2:  @ 0x085D913C
        @ PROC_NAME
        .short 0x1, 0x0
        .word 0x80df4b0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word EfxSRankWeaponEffectSCR2Main
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085D9154
gUnknown_085D9154:  @ 0x085D9154
	.incbin "baserom.gba", 0x5D9154, 0xF0
