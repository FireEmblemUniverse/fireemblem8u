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
    .4byte Event38_ChangeActiveUnit, Event39_, Event3A_, Event3B_
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

	.global gUnknown_08591F08
gUnknown_08591F08:  @ 0x08591F08
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8010748
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08591F18
gUnknown_08591F18:  @ 0x08591F18
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8010A28
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08591F28
gUnknown_08591F28:  @ 0x08591F28
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8010B48
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0
	.incbin "baserom.gba", 0x591F38, 0x50

	.global gEvent_DisplayBattleQuote
gEvent_DisplayBattleQuote:  @ 0x08591F88
	.incbin "baserom.gba", 0x591F88, 0x14

	.global gEvent_TriggerQueuedTileChanges
gEvent_TriggerQueuedTileChanges:  @ 0x08591F9C
	.incbin "baserom.gba", 0x591F9C, 0xC

	.global gEvent_OpenChest
gEvent_OpenChest:  @ 0x08591FA8
    .incbin "baserom.gba", 0x591FA8, 0x48

	.global gEvent_MapSupportConversation
gEvent_MapSupportConversation:  @ 0x08591FF0
	.incbin "baserom.gba", 0x591FF0, 0x40

	.global gEvent_SupportViewerConversation
gEvent_SupportViewerConversation:  @ 0x08592030
	.incbin "baserom.gba", 0x592030, 0x28

	.global gEvent_SkirmishRetreat
gEvent_SkirmishRetreat:  @ 0x08592058
@ Replacing .incbin "baserom.gba", 0x592058, 0x60
    .4byte 0x41020
    .4byte 0x1a23
    .4byte 0xb0540
    .4byte -0x1
    .4byte 0x8fc1b20
    .4byte 0x1d20
    .4byte 0x70540
    .4byte 0x1
    .4byte 0xc41
    .4byte 0x7000c
    .4byte 0x7fff1324
    .4byte 0x41721
    .4byte -0xd5df
    .4byte 0x1926
    .4byte 0x10540
    .4byte 0x1
    .4byte 0xc41
    .4byte 0x1000c
    .4byte 0xd40
    .4byte sub_8037D58
    .4byte 0x820
    .4byte 0x1b22
    .4byte 0x70228
    .4byte 0x120

	.global gEvent_SuspendPrompt
gEvent_SuspendPrompt:  @ 0x085920B8
@ Replacing .incbin "baserom.gba", 0x5920B8, 0x4C
    .4byte 0x41020
    .4byte 0x1a20
    .4byte 0x8fe1b20
    .4byte 0x1d20
    .4byte 0x70540
    .4byte 0x1
    .4byte 0xc41
    .4byte 0x7000c
    .4byte 0xd40
    .4byte sub_80B5D5C
    .4byte 0x8ff1b21
    .4byte 0x1d20
    .4byte 0x7fff1324
    .4byte 0x41721
    .4byte 0x2a20
    .4byte 0x820
    .4byte 0x1b22
    .4byte 0x70228
    .4byte 0x120

	.global gEvent_GameOver
gEvent_GameOver:  @ 0x08592104
@ Replacing .incbin "baserom.gba", 0x592104, 0x10
    .4byte 0x41020
    .4byte 0xd40
    .4byte sub_8085374
    .4byte 0x120

	.global gUnknown_08592114
gUnknown_08592114:  @ 0x08592114
@ Replacing .incbin "baserom.gba", 0x592114, 0x98
    .4byte 0x000a0320
    .4byte 0x00000c41
    .4byte 0x0000000c
    .4byte 0x00000a40
    .4byte gUnknown_08592114 + 0x2c
    .4byte 0x00010920
    .4byte 0x00000820
    .4byte 0x00000a40
    .4byte gUnknown_08592114 + 0x5c
    .4byte 0x00010820
    .4byte 0x00000120
    .4byte 0x00080320
    .4byte 0x00000c41
    .4byte 0x0000000c
    .4byte 0x00070320
    .4byte 0x00630c41
    .4byte 0x0000000c
    .4byte 0x00101721
    .4byte 0x00000820
    .4byte 0x00002220
    .4byte 0x00101720
    .4byte 0x00630820
    .4byte 0x00000120
    .4byte 0x00080320
    .4byte 0x00000c41
    .4byte 0x0000000c
    .4byte 0x00101721
    .4byte 0x00000820
    .4byte 0x000b0320
    .4byte 0x00010c40
    .4byte 0x0000000c
    .4byte 0x00001921
    .4byte 0x00c20620
    .4byte 0x000b0540
    .4byte 0x00000000
    .4byte 0xffff2520
    .4byte 0x00010820
    .4byte 0x00000120

	.global gUnknown_085921AC
gUnknown_085921AC:  @ 0x085921AC
	.incbin "baserom.gba", 0x5921AC, 0x1C

	.global gUnknown_085921C8
gUnknown_085921C8:  @ 0x085921C8
        @ PROC_SET_END_CB
        .short 0x4, 0x0
        .word LongPopup_Clear
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_801116C
        @ PROC_SLEEP
        .short 0xe, 0xa
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word LongPopup_PrepareGfx
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_80111F4
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word LongPopup_PlaySound
        @ PROC_CALL
        .short 0x2, 0x0
        .word LongPopup_Draw
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word LongPopup_WaitForPress
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8011238
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08592228
gUnknown_08592228:  @ 0x08592228
@ Replacing .incbin "baserom.gba", 0x592228, 0x8
    .4byte 0x3
    .4byte IconOAMUpdater_Loop

	.global gUnknown_08592230
gUnknown_08592230:  @ 0x08592230
	.incbin "baserom.gba", 0x592230, 0x58

	.global gUnknown_08592288
gUnknown_08592288:  @ 0x08592288
	.incbin "baserom.gba", 0x592288, 0x48

	.global gUnknown_085922D0
gUnknown_085922D0:  @ 0x085922D0
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word ItemGot_DisplayLePopup
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word ItemGot_GotLeItem
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08592300
gUnknown_08592300:  @ 0x08592300
	.incbin "baserom.gba", 0x592300, 0x48

	.global gUnknown_08592348
gUnknown_08592348:  @ 0x08592348
	.incbin "baserom.gba", 0x592348, 0x38

	.global gUnknown_08592380
gUnknown_08592380:  @ 0x08592380
	.incbin "baserom.gba", 0x592380, 0x58

	.global gUnknown_085923D8
gUnknown_085923D8:  @ 0x085923D8
	.incbin "baserom.gba", 0x5923D8, 0x48

	.global gUnknown_08592420
gUnknown_08592420:  @ 0x08592420
	.incbin "baserom.gba", 0x592420, 0x48

	.global gUnknown_08592468
gUnknown_08592468:  @ 0x08592468
	.incbin "baserom.gba", 0x592468, 0x28

	.global gUnknown_08592490
gUnknown_08592490:  @ 0x08592490
	.incbin "baserom.gba", 0x592490, 0x48

	.global gUnknown_085924D8
gUnknown_085924D8:  @ 0x085924D8
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_SET_END_CB
        .short 0x4, 0x0
        .word nullsub_44
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8011784
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0

	.global gUnknown_085924f8
gUnknown_085924F8:  @ 0x085924F8
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8011A48
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8011AA0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0

	.global gUnknown_08592510
gUnknown_08592510:  @ 0x08592510
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8011AF4
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8011B4C
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8011B90
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0

	.global gUnknown_08592530
gUnknown_08592530:  @ 0x08592530
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8011A48
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8011AA0
        @ PROC_SLEEP
        .short 0xe, 0x64
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8011AF4
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8011B4C
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8011B90
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08592568
gUnknown_08592568:  @ 0x08592568
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_80126BC
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08592580
gUnknown_08592580:  @ 0x08592580
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_8012A2C
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8012A64
        @ PROC_SLEEP
        .short 0xe, 0x50
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8012AC0
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_807E79C
        @ PROC_SLEEP
        .short 0xe, 0x4
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_807E7C4
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085925D0
gUnknown_085925D0:  @ 0x085925D0
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_807CE18
        @ PROC_WHILE
        .short 0x14, 0x0
        .word APProc_Exists
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_085925F0
gUnknown_085925F0:  @ 0x085925F0
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_8012B9C
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_08592608
gUnknown_08592608:  @ 0x08592608
        @ PROC_YIELD
        .short 0xe, 0x0
        .word 0x0
        @ PROC_SET_END_CB
        .short 0x4, 0x0
        .word sub_8012CE4
        @ PROC_WHILE
        .short 0x14, 0x0
        .word sub_80AE750
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0

	.global gUnknown_08592628
gUnknown_08592628:  @ 0x08592628
@ Replacing .incbin "baserom.gba", 0x592628, 0xCC
    .4byte 0x3
    .4byte gUnknown_081C0AFC
    .4byte 0x1
    .4byte 0x1
    .4byte gUnknown_081C0AFC + 0x20
    .4byte 0x11000
    .4byte 0x2
    .4byte gUnknown_081C0AFC + 0xe04
    .4byte 0x10000
    .4byte 0x2
    .4byte gUnknown_081C0AFC + 0xe50
    .4byte 0x10000
    .4byte 0x2
    .4byte gUnknown_081C0AFC + 0xe9c
    .4byte 0x10000
    .4byte 0x2
    .4byte gUnknown_081C0AFC + 0xee8
    .4byte 0x20000
    .4byte 0x2
    .4byte gUnknown_081C0AFC + 0xf34
    .4byte 0x30000
    .4byte 0x2
    .4byte gUnknown_081C0AFC + 0xf80
    .4byte 0x30000
    .4byte 0x2
    .4byte gUnknown_081C0AFC + 0xfcc
    .4byte 0x40000
    .4byte 0x2
    .4byte gUnknown_081C0AFC + 0x1018
    .4byte 0x40000
    .4byte 0x2
    .4byte gUnknown_081C0AFC + 0x1064
    .4byte 0x40000
    .4byte 0x2
    .4byte gUnknown_081C0AFC + 0x10b0
    .4byte 0x40000
    .4byte 0x2
    .4byte gUnknown_081C0AFC + 0x10fc
    .4byte 0x40000
    .4byte 0x2
    .4byte gUnknown_081C0AFC + 0x1148
    .4byte 0x40000
    .4byte 0x2
    .4byte gUnknown_081C0AFC + 0x1194
    .4byte 0x20000
    .4byte 0x2
    .4byte gUnknown_081C0AFC + 0x11e0
    .4byte 0x20000
    .4byte 0xa
    .4byte 0x0
    .4byte 0x0
