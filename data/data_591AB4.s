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
    .4byte Event08_Label, Event09_Goto, Event0A_Call, Event0B_
    .4byte Event0C_Branch, Event0D_AsmCall, Event0E_STAL, Event0F_
    .4byte Event10_ModifyEvBit, Event11_SetIgnoredKeys, Event12_, Event13_
    .4byte Event14_, Event15_, Event16_, Event17_
    .4byte Event18_, Event19_, Event1A_TEXTSTART, Event1B_TEXTSHOW
    .4byte Event1C_TEXTCONT, Event1D_TEXTEND, Event1E_, Event1F_
    .4byte Event20_, Event21_, Event22_, Event23_
    .4byte Event24_, Event25_, Event26_CameraControlMaybe, Event27_MapChange
    .4byte Event28_ChangeWeather, Event29_SetFogVision, Event2A_MoveToChapter, Event2B_
    .4byte Event2C_LoadUnits, Event2D_, Event2E_CheckAt, Event2F_MoveUnit
    .4byte Event30_ENUN, Event31_DisplayEffectRange, Event32_SpawnSingleUnit, Event33_CheckUnitVarious
    .4byte Event34_MessWithUnitState, Event35_UnitClassChanging, Event36_CheckInArea, Event37_GiveItem
    .4byte Event38_ChangeActiveUnit, Event39_ChangeAiScript, Event3A_DisplayPopup, Event3B_DisplayCursor
    .4byte Event3C_, Event3D_, Event3E_PrepScreenCall, Event3F_
    .4byte Event40_, Event41_, Event42_, Event43_
    .4byte Event44_, Event45_

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
    .4byte Event80_, Event81_, Event82_EndWM, Event83_WM_SETCAM
    .4byte Event84_WM_SETCAMONLOC, Event85_WM_SETCAMONSPRITE, Event86_WM_MOVECAM, Event87_
    .4byte Event88_, Event89_, Event8A_, Event8B_
    .4byte Event8C_, Event8D_, Event8E_, Event8F_
    .4byte Event90_WM_DRAWPATH, Event91_WM_DRAWPATH_Silent, Event92_REMOVEPATH, Event93_
    .4byte Event94_, Event95_, Event96_, Event97_
    .4byte Event98_, Event99_, Event9A_, Event9B_
    .4byte Event9C_, Event9D_, Event9E_PUTSPRITE, Event9F_
    .4byte EventA0_REMSPRITE, EventA1_, EventA2_, EventA3_
    .4byte EventA4_, EventA5_, EventA6_, EventA7_
    .4byte EventA8_, EventA9_, EventAA_, EventAB_
    .4byte EventAC_, EventAD_, EventAE_, EventAF_
    .4byte EventB0_, EventB1_, EventB2_, EventB3_
    .4byte EventB4_, EventB5_, EventB6_, EventB7_
    .4byte EventB8_, EventB9_, EventBA_, EventBB_
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


	.global gUnknown_08591DE8
gUnknown_08591DE8:  @ 0x08591DE8
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word _WhileFace6CExists
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08591E00
gUnknown_08591E00:  @ 0x08591E00
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_800EA84
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_800EBB0
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_800ED50
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_800EEE8
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_800EF48
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0
	.incbin "baserom.gba", 0x591E50, 0x8

	.global gUnknown_08591E58
gUnknown_08591E58:  @ 0x08591E58
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_800EA84
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_800EC50
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_800EEE8
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_800EC00
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_800EF48
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08591EB0
gUnknown_08591EB0:  @ 0x08591EB0
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_800EA84
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_800EBB0
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_800EE54
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_800EEE8
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_800EF48
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0

	.incbin "baserom.gba", 0x591F00, 0x8
