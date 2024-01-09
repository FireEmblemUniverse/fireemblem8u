    .section .data

	.global gUnknown_08591AB4
gUnknown_08591AB4:  @ 0x08591AB4
	.incbin "baserom.gba", 0x591AB4, 0xC

	.global gProc_StdEventEngine
gProc_StdEventEngine:  @ 0x08591AC0
        @ PROC_MARK
        .short 0xf, 0x6
        .word 0x0
        @ PROC_SET_END_CB
        .short 0x4, 0x0
        .word EventEngine_OnEnd
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word _MarkSomethingInMenu
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word EventEngine_OnUpdate
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gProc_BattleEventEngine
gProc_BattleEventEngine:  @ 0x08591AF8
        @ PROC_MARK
        .short 0xf, 0x6
        .word 0x0
        @ PROC_SET_END_CB
        .short 0x4, 0x0
        .word EventEngine_OnEnd
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word EventEngine_OnUpdate
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gEventLoCmdTable
gEventLoCmdTable:  @ 0x08591B28
    .4byte Event00_NULL, Event01_End, Event02_EvBitAndIdMod, Event03_CheckEvBitOrId
    .4byte Event04_CheckRandom, Event05_SetSlot, Event06_SlotOperation, Event07_SlotQueueOperations
    .4byte Event08_Label, Event09_Goto, Event0A_Call, Event0B_EnqueueCall
    .4byte Event0C_Branch, Event0D_AsmCall, Event0E_STAL, Event0F_
    .4byte Event10_ModifyEvBit, Event11_SetIgnoredKeys, Event12_StartBGM, Event13_BgmFadeIn
    .4byte Event14_BgmOverideRestore, Event15_BgmVolume, Event16_, Event17_Fade
    .4byte Event18_, Event19_Checks, Event1A_TEXTSTART, Event1B_TEXTSHOW
    .4byte Event1C_TEXTCONT, Event1D_TEXTEND, Event1E_, Event1F_
    .4byte Event20_, Event21_TextBg, Event22_ClearScreen, Event23_DisaleMapDisp
    .4byte Event24_EnableMapDisp, Event25_ChangeMap, Event26_CameraControl, Event27_MapChange
    .4byte Event28_ChangeWeather, Event29_SetFogVision, Event2A_MoveToChapter, Event2B_ConfigLoadUnit
    .4byte Event2C_LoadUnits, Event2D_ChangeSpritePal, Event2E_CheckAt, Event2F_MoveUnit
    .4byte Event30_ENUN, Event31_DisplayEffectRange, Event32_SpawnSingleUnit, Event33_CheckUnitVarious
    .4byte Event34_MessWithUnitState, Event35_UnitClassChanging, Event36_CheckInArea, Event37_GiveItem
    .4byte Event38_ChangeActiveUnit, Event39_ChangeAiScript, Event3A_DisplayPopup, Event3B_DisplayCursor
    .4byte Event3C_MoveCursor, Event3D_MenuOverride, Event3E_PrepScreenCall, Event3F_ScriptBattle
    .4byte Event40_, Event41_Warp, Event42_, Event43_
    .4byte Event44_BreakingSacredStone, Event45_

	.global gUnknown_08591C40
gUnknown_08591C40:  @ 0x08591C40
        @ PROC_MARK
        .short 0xf, 0x8
        .word 0x0
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_800CCE8
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word nullsub_32
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0

	.global gUnknown_08591C68
gUnknown_08591C68:  @ 0x08591C68
        @ PROC_MARK
        .short 0xf, 0x8
        .word 0x0
        @ PROC_SET_END_CB
        .short 0x4, 0x0
        .word sub_800CD40
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_800CD38
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word nullsub_34
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0

	.global gEventHiCmdTable
gEventHiCmdTable:  @ 0x08591C98
    .4byte Event80_WmSkip_Unsure, Event81_WmFadeOut, Event82_WmEnd, Event83_WmSetCamera
    .4byte Event84_WmSetCameraOntoNode, Event85_WmSetCameraOntoUnit, Event86_WmScrollCamera, Event87_WmScrollCameraOntoNode
    .4byte Event88_WmScrollCameraOntoUnit, Event89_WmScrollWait, Event8A_WmShowCursor_Unsure, Event8B_WmHideCursor_Unsure
    .4byte Event8C_WmSetCursor_Unsure, Event8D_WmNop, Event8E_WmNop, Event8F_WmNop
    .4byte Event90_WmAddPathDisplayed, Event91_WmAddPath, Event92_WmRemovePath, Event93_WmEnableNode
    .4byte Event94_WmDisableNode, Event95_WmEnableNodeDisplayed, Event96_WmEnablePathTargetDisplayed, Event97_WmInitNextStoryNode
    .4byte Event98_WmSetNextStoryNodePath, Event99_GmNodeDisplayWait, Event9A_WmSetStoryNodeSilent, Event9B_WmSetNextStoryNodeSilentNoFlag
    .4byte Event9C_, Event9D_, Event9E_WmSetClassUnit, Event9F_WmSetCharUnit
    .4byte EventA0_WmRemoveUnit, EventA1_WmShowUnit, EventA2_WmHideUnit, EventA3_WmShowUnitFaded
    .4byte EventA4_WmHideUnitFaded, EventA5_WmUnitFadeWait, EventA6_WmUnitSetOnNode, EventA7_WmUnitSetPosition
    .4byte EventA8_WmUnitMoveFree, EventA9_WmUnitMovePaths, EventAA_WmUnitPauseMove, EventAB_WmUnitResumeMove
    .4byte EventAC_WmUnitMoveWait, EventAD_WmFadeToDarker, EventAE_WmFadeToDarkerWait, EventAF_WmShowTextBox
    .4byte EventB0_WmHideTextBox_Bugged, EventB1_WmTextBoxWait, EventB2_WmFancyFade, EventB3_WmFancyFadeWait
    .4byte EventB4_WmDisplayBigMap, EventB5_WmHideBigMap, EventB6_WmMoveBigMap, EventB7_WmBigMapWait
    .4byte EventB8_WmShowBigMapHighlight, EventB9_, EventBA_, EventBB_
    .4byte EventBC_, EventBD_, EventBE_, EventBF_
    .4byte EventC0_, EventC1_SKIPWM, EventC2_, EventC3_
    .4byte EventC4_, EventC5_, EventC6_, EventC7_
    .4byte EventC8_, EventC9_, EventCA_, EventCB_
    .4byte EventCC_, EventCD_, EventCE_, EventCF_

	.global gUnknown_08591DD8
gUnknown_08591DD8:  @ 0x08591DD8
        @ PROC_WHILE
        .short 0x14, 0x0
        .word EventEngineExists
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0
