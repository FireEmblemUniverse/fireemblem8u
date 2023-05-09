	.section .data

	.global PrepScr_PrepItemUseScreen
PrepScr_PrepItemUseScreen:  @ 0x08A19064
	@ PROC_YIELD
	.short 0xe, 0x0
	.word 0x0
	@ PROC_LABEL
	.short 0xb, 0x0
	.word 0x0
	@ PROC_CALL
	.short 0x2, 0x0
	.word PrepItemUse_OnInit
	@ PROC_CALL
	.short 0x2, 0x0
	.word PrepItemUse_InitDisplay
	@ PROC_CALL_ARG
	.short 0x18, 0x10
	.word NewFadeIn
	@ PROC_WHILE
	.short 0x14, 0x0
	.word FadeInExists
	@ PROC_LABEL
	.short 0xb, 0x1
	.word 0x0
	@ PROC_REPEAT
	.short 0x3, 0x0
	.word PrepItemUse_CtrlLoop
	@ PROC_LABEL
	.short 0xb, 0x2
	.word 0x0
	@ PROC_CALL
	.short 0x2, 0x0
	.word PrepItemUse_AreUSureBoxInit
	@ PROC_REPEAT
	.short 0x3, 0x0
	.word PrepItemUse_AreUSureBoxLoop
	@ PROC_GOTO
	.short 0xc, 0x1
	.word 0x0
	@ PROC_LABEL
	.short 0xb, 0x3
	.word 0x0
	@ PROC_CALL
	.short 0x2, 0x0
	.word PrepItemUse_HandleItemEffect
	@ PROC_START_CHILD_BLOCKING
	.short 0x6, 0x1
	.word ProcScr_PrepItemStatBoosterEffect
	@ PROC_GOTO
	.short 0xc, 0x1
	.word 0x0
	@ PROC_LABEL
	.short 0xb, 0x4
	.word 0x0
	@ PROC_START_CHILD_BLOCKING
	.short 0x6, 0x1
	.word ProcScr_PrepItemJunaFruitEffect
	@ PROC_GOTO
	.short 0xc, 0x1
	.word 0x0
	@ PROC_LABEL
	.short 0xb, 0x5
	.word 0x0
	@ PROC_CALL_ARG
	.short 0x18, 0x10
	.word NewFadeOut
	@ PROC_WHILE
	.short 0x14, 0x0
	.word FadeOutExists
	@ PROC_CALL
	.short 0x2, 0x0
	.word StartFadeInBlackMedium
	@ PROC_REPEAT
	.short 0x3, 0x0
	.word WaitForFade
	@ PROC_CALL
	.short 0x2, 0x0
	.word StartPrepScreenPromotion
	@ PROC_SLEEP
	.short 0xe, 0x8
	.word 0x0
	@ PROC_CALL
	.short 0x2, 0x0
	.word sub_809CC9C
	@ PROC_SLEEP
	.short 0xe, 0x1e
	.word 0x0
	@ PROC_CALL
	.short 0x2, 0x0
	.word sub_809CC60
	@ PROC_CALL
	.short 0x2, 0x0
	.word PrepItemUse_InitDisplay
	@ PROC_CALL_ARG
	.short 0x18, 0x10
	.word NewFadeIn
	@ PROC_WHILE
	.short 0x14, 0x0
	.word FadeInExists
	@ PROC_WHILE
	.short 0x14, 0x0
	.word MusicProc4Exists
	@ PROC_GOTO
	.short 0xc, 0x1
	.word 0x0
	@ PROC_LABEL
	.short 0xb, 0x6
	.word 0x0
	@ PROC_CALL_ARG
	.short 0x18, 0x10
	.word NewFadeOut
	@ PROC_WHILE
	.short 0x14, 0x0
	.word FadeOutExists
	@ PROC_LABEL
	.short 0xb, 0x7
	.word 0x0
	@ PROC_CALL
	.short 0x2, 0x0
	.word ProcPrepItemUse_OnEnd
	@ PROC_END
	.short 0x0, 0x0
	.word 0x0

	.global ProcScr_PrepItemStatBoosterEffect
ProcScr_PrepItemStatBoosterEffect:  @ 0x08A191A4
	@ PROC_SET_END_CB
	.short 0x4, 0x0
	.word PrepItemBooster_OnEnd
	@ PROC_CALL
	.short 0x2, 0x0
	.word PrepItemBooster_OnInit
	@ PROC_REPEAT
	.short 0x3, 0x0
	.word PrepItemBooster_Idle
	@ PROC_END
	.short 0x0, 0x0
	.word 0x0

	.global ProcScr_PrepItemJunaFruitEffect
ProcScr_PrepItemJunaFruitEffect:  @ 0x08A191C4
	@ PROC_SET_END_CB
	.short 0x4, 0x0
	.word PrepJunaEffect_OnEnd
	@ PROC_CALL
	.short 0x2, 0x0
	.word PrepJunaEffect_OnInit
	@ PROC_REPEAT
	.short 0x3, 0x0
	.word sub_809D17C
	@ PROC_CALL
	.short 0x2, 0x0
	.word EndManimLevelUpStatGainLabels
	@ PROC_SLEEP
	.short 0xe, 0x1
	.word 0x0
	@ PROC_END
	.short 0x0, 0x0
	.word 0x0
