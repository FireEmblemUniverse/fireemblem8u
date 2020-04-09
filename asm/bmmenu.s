	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	@ Map Menu, Unit Menu and all related various target selections and what not is here
	@ Huge

	THUMB_FUNC_START sub_80225AC
sub_80225AC: @ 0x080225AC
	movs r0, #0x17
	bx lr

	THUMB_FUNC_END sub_80225AC

	THUMB_FUNC_START MapMenu_IsSuspendCommandAvailable
MapMenu_IsSuspendCommandAvailable: @ 0x080225B0
	push {lr}
	ldr r0, _080225C4  @ gRAMChapterData
	ldrb r1, [r0, #0x14]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	bne _080225C8
	movs r0, #1
	b _080225CA
	.align 2, 0
_080225C4: .4byte gRAMChapterData
_080225C8:
	movs r0, #2
_080225CA:
	pop {r1}
	bx r1

	THUMB_FUNC_END MapMenu_IsSuspendCommandAvailable

	THUMB_FUNC_START MapMenu_SuspendCommand
MapMenu_SuspendCommand: @ 0x080225D0
	push {lr}
	adds r2, r0, #0
	adds r1, #0x3d
	ldrb r0, [r1]
	cmp r0, #2
	beq _080225E4
	bl sub_80B5D3C
	movs r0, #0x17
	b _080225EE
_080225E4:
	ldr r1, _080225F4  @ 0x00000864
	adds r0, r2, #0
	bl MenuFrozenHelpBox
	movs r0, #8
_080225EE:
	pop {r1}
	bx r1
	.align 2, 0
_080225F4: .4byte 0x00000864

	THUMB_FUNC_END MapMenu_SuspendCommand

	THUMB_FUNC_START CommandEffectEndPlayerPhase
CommandEffectEndPlayerPhase: @ 0x080225F8
	push {lr}
	ldr r0, _08022608  @ gUnknown_0859AAD8
	bl Proc_EndEach
	movs r0, #0x17
	pop {r1}
	bx r1
	.align 2, 0
_08022608: .4byte gUnknown_0859AAD8

	THUMB_FUNC_END CommandEffectEndPlayerPhase

	THUMB_FUNC_START MapMenu_UnitCommand
MapMenu_UnitCommand: @ 0x0802260C
	push {lr}
	ldr r0, _08022624  @ gUnknown_0859AAD8
	bl Proc_Find
	movs r1, #0xa
	bl Proc_Goto
	bl sub_80920C4
	movs r0, #0x17
	pop {r1}
	bx r1
	.align 2, 0
_08022624: .4byte gUnknown_0859AAD8

	THUMB_FUNC_END MapMenu_UnitCommand

	THUMB_FUNC_START MapMenu_OptionsCommand
MapMenu_OptionsCommand: @ 0x08022628
	push {lr}
	ldr r0, _08022638  @ gUnknown_08A2ECE0
	movs r1, #3
	bl Proc_Start
	movs r0, #0x17
	pop {r1}
	bx r1
	.align 2, 0
_08022638: .4byte gUnknown_08A2ECE0

	THUMB_FUNC_END MapMenu_OptionsCommand

	THUMB_FUNC_START sub_802263C
sub_802263C: @ 0x0802263C
	push {lr}
	bl GetChapterThing
	cmp r0, #1
	beq _0802264A
	movs r0, #1
	b _0802264C
_0802264A:
	movs r0, #3
_0802264C:
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_802263C

	THUMB_FUNC_START MapMenu_StatusCommand
MapMenu_StatusCommand: @ 0x08022650
	push {lr}
	movs r0, #0
	bl NewChapterStatusScreen
	movs r0, #0x17
	pop {r1}
	bx r1

	THUMB_FUNC_END MapMenu_StatusCommand

	THUMB_FUNC_START MapMenu_IsGuideCommandAvailable
MapMenu_IsGuideCommandAvailable: @ 0x08022660
	push {lr}
	bl sub_80CDF4C
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08022670
	movs r0, #1
	b _08022672
_08022670:
	movs r0, #3
_08022672:
	pop {r1}
	bx r1

	THUMB_FUNC_END MapMenu_IsGuideCommandAvailable

	THUMB_FUNC_START MapMenu_GuideCommandDraw
MapMenu_GuideCommandDraw: @ 0x08022678
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r4, r1, #0
	bl sub_80CF480
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08022692
	adds r0, r4, #0
	adds r0, #0x34
	movs r1, #4
	bl Text_SetColorId
_08022692:
	adds r0, r4, #0
	adds r0, #0x3d
	ldrb r0, [r0]
	adds r5, r4, #0
	adds r5, #0x34
	cmp r0, #2
	bne _080226A8
	adds r0, r5, #0
	movs r1, #1
	bl Text_SetColorId
_080226A8:
	ldr r0, [r4, #0x30]
	ldrh r0, [r0, #4]
	bl GetStringFromIndex
	adds r1, r0, #0
	adds r0, r5, #0
	bl Text_AppendString
	adds r0, r6, #0
	adds r0, #0x64
	ldrb r0, [r0]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1e
	bl BG_GetMapBuffer
	adds r1, r0, #0
	movs r2, #0x2c
	ldrsh r0, [r4, r2]
	lsls r0, r0, #5
	movs r3, #0x2a
	ldrsh r2, [r4, r3]
	adds r0, r0, r2
	lsls r0, r0, #1
	adds r1, r1, r0
	adds r0, r5, #0
	bl Text_Draw
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	THUMB_FUNC_END MapMenu_GuideCommandDraw

	THUMB_FUNC_START Make6CE_Guide
Make6CE_Guide: @ 0x080226E4
	push {lr}
	ldr r0, _080226F4  @ gUnknown_08B12C64
	movs r1, #3
	bl Proc_Start
	movs r0, #0x17
	pop {r1}
	bx r1
	.align 2, 0
_080226F4: .4byte gUnknown_08B12C64

	THUMB_FUNC_END Make6CE_Guide

	THUMB_FUNC_START sub_80226F8
sub_80226F8: @ 0x080226F8
	push {lr}
	ldr r0, _08022718  @ gActiveUnit
	movs r1, #0
	str r1, [r0]
	ldr r0, _0802271C  @ gUnknown_0202BCB0
	adds r0, #0x3e
	strb r1, [r0]
	ldr r0, _08022720  @ gUnknown_0859AAD8
	bl Proc_Find
	movs r1, #0xc
	bl Proc_Goto
	movs r0, #0x17
	pop {r1}
	bx r1
	.align 2, 0
_08022718: .4byte gActiveUnit
_0802271C: .4byte gUnknown_0202BCB0
_08022720: .4byte gUnknown_0859AAD8

	THUMB_FUNC_END sub_80226F8

	THUMB_FUNC_START sub_8022724
sub_8022724: @ 0x08022724
	push {lr}
	movs r0, #3
	bl Make6C_savemenu2
	movs r0, #0x17
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8022724

	THUMB_FUNC_START sub_8022734
sub_8022734: @ 0x08022734
	movs r0, #0x17
	bx lr

	THUMB_FUNC_END sub_8022734

	THUMB_FUNC_START EffectWait
EffectWait: @ 0x08022738
	ldr r1, _08022744  @ gActionData
	movs r0, #1
	strb r0, [r1, #0x11]
	movs r0, #0x17
	bx lr
	.align 2, 0
_08022744: .4byte gActionData

	THUMB_FUNC_END EffectWait

	THUMB_FUNC_START GenericSelection_BackToUM
GenericSelection_BackToUM: @ 0x08022748
	push {lr}
	bl EndTargetSelection
	ldr r0, _08022794  @ gBG2TilemapBuffer
	movs r1, #0
	bl BG_Fill
	movs r0, #4
	bl BG_EnableSyncByMask
	bl sub_8003D20
	bl HideMoveRangeGraphics
	ldr r0, _08022798  @ gUnitActionMenuDef
	ldr r2, _0802279C  @ gUnknown_0202BCB0
	movs r3, #0x1c
	ldrsh r1, [r2, r3]
	movs r3, #0xc
	ldrsh r2, [r2, r3]
	subs r1, r1, r2
	movs r2, #1
	movs r3, #0x16
	bl StartSemiCenteredOrphanMenu
	ldr r1, _080227A0  @ gActiveUnit
	ldr r2, [r1]
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	ldrb r2, [r2, #0x11]
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	bl EnsureCameraOntoPosition
	movs r0, #0x19
	pop {r1}
	bx r1
	.align 2, 0
_08022794: .4byte gBG2TilemapBuffer
_08022798: .4byte gUnitActionMenuDef
_0802279C: .4byte gUnknown_0202BCB0
_080227A0: .4byte gActiveUnit

	THUMB_FUNC_END GenericSelection_BackToUM

	THUMB_FUNC_START sub_80227A4
sub_80227A4: @ 0x080227A4
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r5, _080227FC  @ gActiveUnit
	ldr r1, [r5]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	ldrb r1, [r1, #0x11]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl ShouldMoveCameraPosSomething
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080227F6
	ldr r0, [r5]
	movs r4, #0x11
	ldrsb r4, [r0, r4]
	ldr r0, _08022800  @ gUnknown_0859A548
	bl Proc_EndEach
	lsls r0, r4, #4
	bl GetSomeAdjustedCameraY
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r2, _08022804  @ gUnknown_0202BCB0
	movs r3, #0x2a
	ldrsh r1, [r2, r3]
	cmp r0, r1
	ble _080227E8
	ldrh r0, [r2, #0x2a]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x14
	adds r4, r0, #2
_080227E8:
	ldr r0, [r5]
	movs r1, #0x10
	ldrsb r1, [r0, r1]
	adds r0, r6, #0
	adds r2, r4, #0
	bl EnsureCameraOntoPosition
_080227F6:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080227FC: .4byte gActiveUnit
_08022800: .4byte gUnknown_0859A548
_08022804: .4byte gUnknown_0202BCB0

	THUMB_FUNC_END sub_80227A4

	THUMB_FUNC_START sub_8022808
sub_8022808: @ 0x08022808
	push {lr}
	ldr r0, _08022824  @ gUnitActionMenuDef
	ldr r2, _08022828  @ gUnknown_0202BCB0
	movs r3, #0x1c
	ldrsh r1, [r2, r3]
	movs r3, #0xc
	ldrsh r2, [r2, r3]
	subs r1, r1, r2
	movs r2, #1
	movs r3, #0x16
	bl StartSemiCenteredOrphanMenu
	pop {r0}
	bx r0
	.align 2, 0
_08022824: .4byte gUnitActionMenuDef
_08022828: .4byte gUnknown_0202BCB0

	THUMB_FUNC_END sub_8022808

	THUMB_FUNC_START GenericSelection_BackToUM_CamWait
GenericSelection_BackToUM_CamWait: @ 0x0802282C
	push {lr}
	bl EndTargetSelection
	ldr r0, _08022858  @ gBG2TilemapBuffer
	movs r1, #0
	bl BG_Fill
	movs r0, #4
	bl BG_EnableSyncByMask
	bl HideMoveRangeGraphics
	bl sub_8003D20
	ldr r0, _0802285C  @ gProcScr_0859B600
	movs r1, #3
	bl Proc_Start
	movs r0, #0x19
	pop {r1}
	bx r1
	.align 2, 0
_08022858: .4byte gBG2TilemapBuffer
_0802285C: .4byte gProcScr_0859B600

	THUMB_FUNC_END GenericSelection_BackToUM_CamWait

	THUMB_FUNC_START ItemMenu_ButtonBPressed
ItemMenu_ButtonBPressed: @ 0x08022860
	push {lr}
	ldr r0, _08022894  @ gBG2TilemapBuffer
	movs r1, #0
	bl BG_Fill
	movs r0, #4
	bl BG_EnableSyncByMask
	bl sub_8003D20
	ldr r0, _08022898  @ gUnitActionMenuDef
	ldr r2, _0802289C  @ gUnknown_0202BCB0
	movs r3, #0x1c
	ldrsh r1, [r2, r3]
	movs r3, #0xc
	ldrsh r2, [r2, r3]
	subs r1, r1, r2
	movs r2, #1
	movs r3, #0x16
	bl StartSemiCenteredOrphanMenu
	bl HideMoveRangeGraphics
	movs r0, #0x3b
	pop {r1}
	bx r1
	.align 2, 0
_08022894: .4byte gBG2TilemapBuffer
_08022898: .4byte gUnitActionMenuDef
_0802289C: .4byte gUnknown_0202BCB0

	THUMB_FUNC_END ItemMenu_ButtonBPressed

	THUMB_FUNC_START sub_80228A0
sub_80228A0: @ 0x080228A0
	movs r0, #0
	bx lr

	THUMB_FUNC_END sub_80228A0

	THUMB_FUNC_START RescueUsability
RescueUsability: @ 0x080228A4
	push {lr}
	ldr r0, _080228D0  @ gActiveUnit
	ldr r2, [r0]
	ldr r1, [r2, #0xc]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	bne _080228D4
	movs r0, #0x81
	lsls r0, r0, #4
	ands r1, r0
	cmp r1, #0
	bne _080228D4
	adds r0, r2, #0
	bl MakeRescueTargetList
	bl sub_804FD28
	cmp r0, #0
	beq _080228D4
	movs r0, #1
	b _080228D6
	.align 2, 0
_080228D0: .4byte gActiveUnit
_080228D4:
	movs r0, #3
_080228D6:
	pop {r1}
	bx r1

	THUMB_FUNC_END RescueUsability

	THUMB_FUNC_START RescueEffect
RescueEffect: @ 0x080228DC
	push {lr}
	ldr r0, _080228F4  @ gActiveUnit
	ldr r0, [r0]
	bl MakeRescueTargetList
	ldr r0, _080228F8  @ gUnknown_0859D478
	bl NewTargetSelection
	movs r0, #7
	pop {r1}
	bx r1
	.align 2, 0
_080228F4: .4byte gActiveUnit
_080228F8: .4byte gUnknown_0859D478

	THUMB_FUNC_END RescueEffect

	THUMB_FUNC_START RescueSelection_OnSelect
RescueSelection_OnSelect: @ 0x080228FC
	ldr r2, _0802290C  @ gActionData
	ldrb r0, [r1, #2]
	strb r0, [r2, #0xd]
	movs r0, #9
	strb r0, [r2, #0x11]
	movs r0, #0x17
	bx lr
	.align 2, 0
_0802290C: .4byte gActionData

	THUMB_FUNC_END RescueSelection_OnSelect

	THUMB_FUNC_START DropUsability
DropUsability: @ 0x08022910
	push {lr}
	ldr r0, _0802293C  @ gActiveUnit
	ldr r2, [r0]
	ldr r1, [r2, #0xc]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	bne _08022940
	movs r0, #0x10
	ands r1, r0
	cmp r1, #0
	beq _08022940
	adds r0, r2, #0
	bl MakeDropTargetList
	bl sub_804FD28
	cmp r0, #0
	beq _08022940
	movs r0, #1
	b _08022942
	.align 2, 0
_0802293C: .4byte gActiveUnit
_08022940:
	movs r0, #3
_08022942:
	pop {r1}
	bx r1

	THUMB_FUNC_END DropUsability

	THUMB_FUNC_START DropEffect
DropEffect: @ 0x08022948
	push {lr}
	ldr r0, _08022960  @ gActiveUnit
	ldr r0, [r0]
	bl MakeDropTargetList
	ldr r0, _08022964  @ gUnknown_0859D458
	bl NewTargetSelection
	movs r0, #0x17
	pop {r1}
	bx r1
	.align 2, 0
_08022960: .4byte gActiveUnit
_08022964: .4byte gUnknown_0859D458

	THUMB_FUNC_END DropEffect

	THUMB_FUNC_START DropSelection_OnSelect
DropSelection_OnSelect: @ 0x08022968
	ldr r2, _08022984  @ gActionData
	movs r0, #0xa
	strb r0, [r2, #0x11]
	ldr r0, _08022988  @ gActiveUnit
	ldr r0, [r0]
	ldrb r0, [r0, #0x1b]
	strb r0, [r2, #0xd]
	ldrb r0, [r1]
	strb r0, [r2, #0x13]
	ldrb r0, [r1, #1]
	strb r0, [r2, #0x14]
	movs r0, #0x17
	bx lr
	.align 2, 0
_08022984: .4byte gActionData
_08022988: .4byte gActiveUnit

	THUMB_FUNC_END DropSelection_OnSelect

	THUMB_FUNC_START TakeUsability
TakeUsability: @ 0x0802298C
	push {lr}
	ldr r0, _080229C4  @ gActiveUnit
	ldr r3, [r0]
	ldr r2, [r3, #0xc]
	movs r0, #0x40
	ands r0, r2
	cmp r0, #0
	bne _080229CC
	ldr r0, _080229C8  @ gUnknown_0202BCB0
	adds r0, #0x3d
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _080229CC
	movs r0, #0x10
	ands r2, r0
	cmp r2, #0
	bne _080229CC
	adds r0, r3, #0
	bl MakeTakeTargetList
	bl sub_804FD28
	cmp r0, #0
	beq _080229CC
	movs r0, #1
	b _080229CE
	.align 2, 0
_080229C4: .4byte gActiveUnit
_080229C8: .4byte gUnknown_0202BCB0
_080229CC:
	movs r0, #3
_080229CE:
	pop {r1}
	bx r1

	THUMB_FUNC_END TakeUsability

	THUMB_FUNC_START TakeEffect
TakeEffect: @ 0x080229D4
	push {lr}
	ldr r0, _080229EC  @ gActiveUnit
	ldr r0, [r0]
	bl MakeTakeTargetList
	ldr r0, _080229F0  @ gUnknown_0859D438
	bl NewTargetSelection
	movs r0, #7
	pop {r1}
	bx r1
	.align 2, 0
_080229EC: .4byte gActiveUnit
_080229F0: .4byte gUnknown_0859D438

	THUMB_FUNC_END TakeEffect

	THUMB_FUNC_START GiveUsability
GiveUsability: @ 0x080229F4
	push {lr}
	ldr r0, _08022A2C  @ gActiveUnit
	ldr r3, [r0]
	ldr r2, [r3, #0xc]
	movs r0, #0x40
	ands r0, r2
	cmp r0, #0
	bne _08022A34
	ldr r0, _08022A30  @ gUnknown_0202BCB0
	adds r0, #0x3d
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _08022A34
	movs r0, #0x10
	ands r2, r0
	cmp r2, #0
	beq _08022A34
	adds r0, r3, #0
	bl sub_8025594
	bl sub_804FD28
	cmp r0, #0
	beq _08022A34
	movs r0, #1
	b _08022A36
	.align 2, 0
_08022A2C: .4byte gActiveUnit
_08022A30: .4byte gUnknown_0202BCB0
_08022A34:
	movs r0, #3
_08022A36:
	pop {r1}
	bx r1

	THUMB_FUNC_END GiveUsability

	THUMB_FUNC_START GiveEffect
GiveEffect: @ 0x08022A3C
	push {lr}
	ldr r0, _08022A54  @ gActiveUnit
	ldr r0, [r0]
	bl sub_8025594
	ldr r0, _08022A58  @ gUnknown_0859D418
	bl NewTargetSelection
	movs r0, #7
	pop {r1}
	bx r1
	.align 2, 0
_08022A54: .4byte gActiveUnit
_08022A58: .4byte gUnknown_0859D418

	THUMB_FUNC_END GiveEffect

	THUMB_FUNC_START MakeUnitRescueTransferGraphics
MakeUnitRescueTransferGraphics: @ 0x08022A5C
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldrb r0, [r4, #0x1b]
	bl GetUnit
	adds r6, r0, #0
	bl DeleteEach6CBB
	movs r0, #0x10
	ldrsb r0, [r5, r0]
	movs r1, #0x11
	ldrsb r1, [r5, r1]
	movs r2, #0x10
	ldrsb r2, [r4, r2]
	movs r3, #0x11
	ldrsb r3, [r4, r3]
	bl GetSomeFacingDirection
	adds r1, r0, #0
	adds r0, r6, #0
	bl Make6CKOIDOAMM
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END MakeUnitRescueTransferGraphics

	THUMB_FUNC_START TakeSelection_OnSelect
TakeSelection_OnSelect: @ 0x08022A90
	push {r4, r5, lr}
	ldr r4, _08022ADC  @ gActionData
	movs r0, #0xb
	strb r0, [r4, #0x11]
	ldrb r0, [r1, #2]
	strb r0, [r4, #0xd]
	ldrb r0, [r4, #0xd]
	bl GetUnit
	bl UnitFinalizeMovement
	ldrb r0, [r4, #0xd]
	bl GetUnit
	adds r5, r0, #0
	ldrb r0, [r4, #0xc]
	bl GetUnit
	adds r1, r0, #0
	adds r0, r5, #0
	bl MakeUnitRescueTransferGraphics
	ldrb r0, [r4, #0xd]
	bl GetUnit
	adds r5, r0, #0
	ldrb r0, [r4, #0xc]
	bl GetUnit
	adds r1, r0, #0
	adds r0, r5, #0
	bl UnitGive
	movs r0, #0x17
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08022ADC: .4byte gActionData

	THUMB_FUNC_END TakeSelection_OnSelect

	THUMB_FUNC_START GiveSelection_OnSelect
GiveSelection_OnSelect: @ 0x08022AE0
	push {r4, r5, lr}
	ldr r4, _08022B2C  @ gActionData
	movs r0, #0xc
	strb r0, [r4, #0x11]
	ldrb r0, [r1, #2]
	strb r0, [r4, #0xd]
	ldrb r0, [r4, #0xc]
	bl GetUnit
	bl UnitFinalizeMovement
	ldrb r0, [r4, #0xc]
	bl GetUnit
	adds r5, r0, #0
	ldrb r0, [r4, #0xd]
	bl GetUnit
	adds r1, r0, #0
	adds r0, r5, #0
	bl MakeUnitRescueTransferGraphics
	ldrb r0, [r4, #0xc]
	bl GetUnit
	adds r5, r0, #0
	ldrb r0, [r4, #0xd]
	bl GetUnit
	adds r1, r0, #0
	adds r0, r5, #0
	bl UnitGive
	movs r0, #0x17
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08022B2C: .4byte gActionData

	THUMB_FUNC_END GiveSelection_OnSelect

	THUMB_FUNC_START UnitActionMenu_Attack
UnitActionMenu_Attack: @ 0x08022B30
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	adds r0, r4, #0
	adds r0, #0x3d
	ldrb r0, [r0]
	cmp r0, #2
	bne _08022B50
	ldr r1, _08022B4C  @ 0x00000858
	adds r0, r5, #0
	bl MenuFrozenHelpBox
	movs r0, #8
	b _08022B84
	.align 2, 0
_08022B4C: .4byte 0x00000858
_08022B50:
	bl ResetIconGraphics
	movs r0, #4
	bl LoadIconPalettes
	ldr r0, _08022B74  @ gActiveUnit
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	movs r1, #0x80
	lsls r1, r1, #4
	ands r0, r1
	cmp r0, #0
	bne _08022B78
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_8022BD8
	b _08022B80
	.align 2, 0
_08022B74: .4byte gActiveUnit
_08022B78:
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_8022B8C
_08022B80:
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
_08022B84:
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END UnitActionMenu_Attack

	THUMB_FUNC_START sub_8022B8C
sub_8022B8C: @ 0x08022B8C
	push {r4, r5, lr}
	sub sp, #4
	ldr r0, _08022BD0  @ gBallistaRangeMenuDef
	bl StartOrphanMenu
	adds r5, r0, #0
	ldr r4, _08022BD4  @ gActiveUnit
	ldr r0, [r4]
	bl GetUnitPortraitId
	adds r1, r0, #0
	movs r0, #2
	str r0, [sp]
	movs r0, #0
	movs r2, #0xb0
	movs r3, #0xc
	bl NewFace
	movs r0, #0
	movs r1, #5
	bl sub_8006458
	ldr r1, [r4]
	adds r0, r5, #0
	movs r2, #0xf
	movs r3, #0xb
	bl sub_801E684
	movs r0, #0x17
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08022BD0: .4byte gBallistaRangeMenuDef
_08022BD4: .4byte gActiveUnit

	THUMB_FUNC_END sub_8022B8C

	THUMB_FUNC_START sub_8022BD8
sub_8022BD8: @ 0x08022BD8
	push {r4, r5, lr}
	sub sp, #4
	ldr r0, _08022C28  @ gUnknownMenuDef
	bl StartOrphanMenu
	adds r4, r0, #0
	ldr r5, _08022C2C  @ gActiveUnit
	ldr r1, [r5]
	ldr r0, [r1, #4]
	ldrb r0, [r0, #4]
	cmp r0, #0x51
	beq _08022C0E
	adds r0, r1, #0
	bl GetUnitPortraitId
	adds r1, r0, #0
	movs r0, #2
	str r0, [sp]
	movs r0, #0
	movs r2, #0xb0
	movs r3, #0xc
	bl NewFace
	movs r0, #0
	movs r1, #5
	bl sub_8006458
_08022C0E:
	ldr r1, [r5]
	adds r0, r4, #0
	movs r2, #0xf
	movs r3, #0xb
	bl sub_801E684
	bl sub_80832C4
	movs r0, #0x17
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08022C28: .4byte gUnknownMenuDef
_08022C2C: .4byte gActiveUnit

	THUMB_FUNC_END sub_8022BD8

	THUMB_FUNC_START DisplayUnitStandingAttackRange
DisplayUnitStandingAttackRange: @ 0x08022C30
	push {r4, r5, lr}
	ldr r0, _08022C6C  @ gBmMapMovement
	ldr r0, [r0]
	movs r5, #1
	negs r5, r5
	adds r1, r5, #0
	bl BmMapFill
	ldr r0, _08022C70  @ gBmMapRange
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFill
	ldr r4, _08022C74  @ gActiveUnit
	ldr r2, [r4]
	ldr r0, [r2, #0xc]
	movs r1, #0x80
	lsls r1, r1, #4
	ands r0, r1
	cmp r0, #0
	beq _08022C78
	movs r0, #0x10
	ldrsb r0, [r2, r0]
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	movs r2, #1
	movs r3, #0xa
	bl MapAddInBoundedRange
	b _08022C88
	.align 2, 0
_08022C6C: .4byte gBmMapMovement
_08022C70: .4byte gBmMapRange
_08022C74: .4byte gActiveUnit
_08022C78:
	adds r0, r2, #0
	adds r1, r5, #0
	bl GetUnitWeaponReachBits
	adds r1, r0, #0
	ldr r0, [r4]
	bl GenerateUnitStandingReachRange
_08022C88:
	movs r0, #3
	bl DisplayMoveRangeGraphics
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END DisplayUnitStandingAttackRange

	THUMB_FUNC_START HideMoveRangeGraphicsWrapper
HideMoveRangeGraphicsWrapper: @ 0x08022C98
	push {lr}
	bl HideMoveRangeGraphics
	movs r0, #0
	pop {r1}
	bx r1

	THUMB_FUNC_END HideMoveRangeGraphicsWrapper

	THUMB_FUNC_START UnknownMenu_IsAvailable
UnknownMenu_IsAvailable: @ 0x08022CA4
	push {r4, r5, lr}
	ldr r5, _08022CE4  @ gActiveUnit
	ldr r0, [r5]
	lsls r1, r1, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r4, [r0]
	adds r0, r4, #0
	bl GetItemAttributes
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	beq _08022CE8
	ldr r0, [r5]
	adds r1, r4, #0
	bl CanUnitUseWeapon
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08022CE8
	ldr r0, [r5]
	adds r1, r4, #0
	bl MakeTargetListForWeapon
	bl sub_804FD28
	cmp r0, #0
	beq _08022CE8
	movs r0, #1
	b _08022CEA
	.align 2, 0
_08022CE4: .4byte gActiveUnit
_08022CE8:
	movs r0, #3
_08022CEA:
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END UnknownMenu_IsAvailable

	THUMB_FUNC_START UnknownMenu_Selected
UnknownMenu_Selected: @ 0x08022CF0
	push {r4, lr}
	ldr r4, _08022D28  @ gActiveUnit
	ldr r0, [r4]
	adds r1, #0x3c
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl EquipUnitItemSlot
	ldr r1, _08022D2C  @ gActionData
	movs r0, #0
	strb r0, [r1, #0x12]
	bl ClearBg0Bg1
	ldr r0, [r4]
	ldrh r1, [r0, #0x1e]
	bl MakeTargetListForWeapon
	ldr r0, _08022D30  @ gUnknown_0859D3F8
	bl NewTargetSelection
	bl sub_80832C8
	movs r0, #0x27
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08022D28: .4byte gActiveUnit
_08022D2C: .4byte gActionData
_08022D30: .4byte gUnknown_0859D3F8

	THUMB_FUNC_END UnknownMenu_Selected

	THUMB_FUNC_START UnknownMenu_Draw
UnknownMenu_Draw: @ 0x08022D34
	push {r4, r5, r6, lr}
	adds r5, r1, #0
	ldr r0, _08022D7C  @ gActiveUnit
	ldr r0, [r0]
	adds r1, #0x3c
	movs r2, #0
	ldrsb r2, [r1, r2]
	lsls r2, r2, #1
	adds r1, r0, #0
	adds r1, #0x1e
	adds r1, r1, r2
	ldrh r4, [r1]
	adds r1, r4, #0
	bl CanUnitUseWeapon
	adds r2, r0, #0
	adds r0, r5, #0
	adds r0, #0x34
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	movs r1, #0x2c
	ldrsh r3, [r5, r1]
	lsls r3, r3, #5
	movs r6, #0x2a
	ldrsh r1, [r5, r6]
	adds r3, r3, r1
	lsls r3, r3, #1
	ldr r1, _08022D80  @ gBG0TilemapBuffer
	adds r3, r3, r1
	adds r1, r4, #0
	bl DrawItemMenuLine
	movs r0, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08022D7C: .4byte gActiveUnit
_08022D80: .4byte gBG0TilemapBuffer

	THUMB_FUNC_END UnknownMenu_Draw

	THUMB_FUNC_START UnknownMenu_SwitchIn
UnknownMenu_SwitchIn: @ 0x08022D84
	push {r4, r5, lr}
	adds r5, r1, #0
	adds r5, #0x3c
	movs r0, #0
	ldrsb r0, [r5, r0]
	bl sub_801E748
	ldr r0, _08022DCC  @ gBmMapMovement
	ldr r0, [r0]
	movs r1, #1
	negs r1, r1
	bl BmMapFill
	ldr r0, _08022DD0  @ gBmMapRange
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFill
	ldr r4, _08022DD4  @ gActiveUnit
	ldr r0, [r4]
	movs r1, #0
	ldrsb r1, [r5, r1]
	bl GetUnitWeaponReachBits
	adds r1, r0, #0
	ldr r0, [r4]
	bl GenerateUnitStandingReachRange
	movs r0, #2
	bl DisplayMoveRangeGraphics
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08022DCC: .4byte gBmMapMovement
_08022DD0: .4byte gBmMapRange
_08022DD4: .4byte gActiveUnit

	THUMB_FUNC_END UnknownMenu_SwitchIn

	THUMB_FUNC_START BallistaRangeMenu_SwitchOut
BallistaRangeMenu_SwitchOut: @ 0x08022DD8
	push {lr}
	adds r0, #0x63
	ldrb r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	bne _08022DEA
	bl HideMoveRangeGraphics
_08022DEA:
	movs r0, #0
	pop {r1}
	bx r1

	THUMB_FUNC_END BallistaRangeMenu_SwitchOut

	THUMB_FUNC_START sub_8022DF0
sub_8022DF0: @ 0x08022DF0
	push {r4, lr}
	adds r4, r1, #0
	bl EventEngineExists
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _08022E04
	movs r0, #0
	b _08022E2A
_08022E04:
	ldr r1, _08022E30  @ gActionData
	movs r0, #2
	strb r0, [r1, #0x11]
	ldrb r0, [r4, #2]
	strb r0, [r1, #0xd]
	movs r0, #2
	ldrsb r0, [r4, r0]
	cmp r0, #0
	bne _08022E22
	ldrb r0, [r4]
	strb r0, [r1, #0x13]
	ldrb r0, [r4, #1]
	strb r0, [r1, #0x14]
	ldrb r0, [r4, #3]
	strb r0, [r1, #0x15]
_08022E22:
	ldr r0, _08022E34  @ gUnknown_0859E520
	bl Proc_EndEach
	movs r0, #0x17
_08022E2A:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08022E30: .4byte gActionData
_08022E34: .4byte gUnknown_0859E520

	THUMB_FUNC_END sub_8022DF0

	THUMB_FUNC_START sub_8022E38
sub_8022E38: @ 0x08022E38
	push {lr}
	ldr r0, _08022E50  @ gActiveUnit
	ldr r0, [r0]
	movs r1, #0x10
	ldrsb r1, [r0, r1]
	movs r2, #0x11
	ldrsb r2, [r0, r2]
	movs r0, #0
	bl EnsureCameraOntoPosition
	pop {r0}
	bx r0
	.align 2, 0
_08022E50: .4byte gActiveUnit

	THUMB_FUNC_END sub_8022E38

	THUMB_FUNC_START sub_8022E54
sub_8022E54: @ 0x08022E54
	push {lr}
	movs r0, #0
	movs r1, #0
	bl UnitActionMenu_Attack
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8022E54

	THUMB_FUNC_START sub_8022E64
sub_8022E64: @ 0x08022E64
	push {lr}
	bl EventEngineExists
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq _08022E84
	ldr r0, _08022E80  @ gUnknown_0859B630
	movs r1, #3
	bl Proc_Start
	movs r0, #0xb
	b _08022E86
	.align 2, 0
_08022E80: .4byte gUnknown_0859B630
_08022E84:
	movs r0, #0
_08022E86:
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8022E64

	THUMB_FUNC_START sub_8022E8C
sub_8022E8C: @ 0x08022E8C
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r1, #0
	movs r0, #2
	ldrsb r0, [r4, r0]
	bl GetUnit
	adds r5, r0, #0
	movs r0, #0
	ldrsb r0, [r4, r0]
	movs r1, #1
	ldrsb r1, [r4, r1]
	bl ChangeActiveUnitFacing
	movs r0, #2
	ldrsb r0, [r4, r0]
	cmp r0, #0
	bne _08022EC2
	ldr r1, _08022EE0  @ gActionData
	ldrb r0, [r4]
	strb r0, [r1, #0x13]
	ldrb r0, [r4, #1]
	strb r0, [r1, #0x14]
	ldrb r0, [r4, #3]
	strb r0, [r1, #0x15]
	bl InitObstacleBattleUnit
_08022EC2:
	ldr r1, _08022EE0  @ gActionData
	ldrb r0, [r1, #0x12]
	cmp r0, #8
	bne _08022EE8
	ldr r0, _08022EE4  @ gActiveUnit
	ldr r0, [r0]
	movs r2, #0x10
	ldrsb r2, [r0, r2]
	movs r3, #0x11
	ldrsb r3, [r0, r3]
	adds r1, r5, #0
	bl BattleGenerateBallistaSimulation
	b _08022EFC
	.align 2, 0
_08022EE0: .4byte gActionData
_08022EE4: .4byte gActiveUnit
_08022EE8:
	ldr r0, _08022F0C  @ gActiveUnit
	ldr r0, [r0]
	movs r3, #1
	negs r3, r3
	ldrb r1, [r1, #0x12]
	str r1, [sp]
	adds r1, r5, #0
	adds r2, r3, #0
	bl BattleGenerateSimulation
_08022EFC:
	bl sub_803738C
	movs r0, #0
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08022F0C: .4byte gActiveUnit

	THUMB_FUNC_END sub_8022E8C

	THUMB_FUNC_START sub_8022F10
sub_8022F10: @ 0x08022F10
	push {lr}
	ldr r0, _08022F30  @ gBG2TilemapBuffer
	movs r1, #0
	bl BG_Fill
	movs r0, #4
	bl BG_EnableSyncByMask
	bl HideMoveRangeGraphics
	bl sub_80373B4
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0
_08022F30: .4byte gBG2TilemapBuffer

	THUMB_FUNC_END sub_8022F10

	THUMB_FUNC_START ItemSubMenu_IsTradeAvailable
ItemSubMenu_IsTradeAvailable: @ 0x08022F34
	push {lr}
	ldr r0, _08022F78  @ gActiveUnit
	ldr r2, [r0]
	ldr r0, [r2, #0xc]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	bne _08022F80
	ldr r0, _08022F7C  @ gUnknown_0202BCB0
	adds r0, #0x3d
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _08022F80
	ldr r0, [r2]
	ldr r1, [r2, #4]
	ldr r0, [r0, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	movs r1, #0x80
	lsls r1, r1, #2
	ands r0, r1
	cmp r0, #0
	bne _08022F80
	adds r0, r2, #0
	bl MakeTradeTargetList
	bl sub_804FD28
	cmp r0, #0
	beq _08022F80
	movs r0, #1
	b _08022F82
	.align 2, 0
_08022F78: .4byte gActiveUnit
_08022F7C: .4byte gUnknown_0202BCB0
_08022F80:
	movs r0, #3
_08022F82:
	pop {r1}
	bx r1

	THUMB_FUNC_END ItemSubMenu_IsTradeAvailable

	THUMB_FUNC_START TradeCommandEffect
TradeCommandEffect: @ 0x08022F88
	push {lr}
	bl ClearBg0Bg1
	ldr r0, _08022FA4  @ gActiveUnit
	ldr r0, [r0]
	bl MakeTradeTargetList
	ldr r0, _08022FA8  @ gUnknown_0859D3D8
	bl NewTargetSelection
	movs r0, #7
	pop {r1}
	bx r1
	.align 2, 0
_08022FA4: .4byte gActiveUnit
_08022FA8: .4byte gUnknown_0859D3D8

	THUMB_FUNC_END TradeCommandEffect

	THUMB_FUNC_START sub_8022FAC
sub_8022FAC: @ 0x08022FAC
	push {r4, lr}
	ldr r2, _08022FD4  @ gActionData
	movs r0, #0x1d
	strb r0, [r2, #0x11]
	ldr r0, _08022FD8  @ gActiveUnit
	ldr r4, [r0]
	movs r0, #2
	ldrsb r0, [r1, r0]
	bl GetUnit
	adds r1, r0, #0
	adds r0, r4, #0
	movs r2, #0
	bl StartTradeMenu
	movs r0, #0x17
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08022FD4: .4byte gActionData
_08022FD8: .4byte gActiveUnit

	THUMB_FUNC_END sub_8022FAC

	THUMB_FUNC_START UnitActionMenu_CanSeize
UnitActionMenu_CanSeize: @ 0x08022FDC
	push {r4, lr}
	ldr r4, _08022FFC  @ gActiveUnit
	ldr r2, [r4]
	ldr r0, [r2, #0xc]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	bne _08022FF8
	adds r0, r2, #0
	bl CanUnitSeize
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08023000
_08022FF8:
	movs r0, #3
	b _0802301A
	.align 2, 0
_08022FFC: .4byte gActiveUnit
_08023000:
	ldr r1, [r4]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	ldrb r1, [r1, #0x11]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl GetAvailableLocaCommandAt
	movs r1, #3
	cmp r0, #0x11
	bne _08023018
	movs r1, #1
_08023018:
	adds r0, r1, #0
_0802301A:
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END UnitActionMenu_CanSeize

	THUMB_FUNC_START UnitActionMenu_Seize
UnitActionMenu_Seize: @ 0x08023020
	ldr r1, _08023038  @ gActionData
	movs r0, #0x11
	strb r0, [r1, #0x11]
	ldr r0, _0802303C  @ gActiveUnit
	ldr r2, [r0]
	ldr r0, [r2, #0xc]
	movs r1, #0x40
	orrs r0, r1
	str r0, [r2, #0xc]
	movs r0, #0x17
	bx lr
	.align 2, 0
_08023038: .4byte gActionData
_0802303C: .4byte gActiveUnit

	THUMB_FUNC_END UnitActionMenu_Seize

	THUMB_FUNC_START VisitCommandUsability
VisitCommandUsability: @ 0x08023040
	push {r4, lr}
	ldr r0, _08023080  @ gActiveUnit
	ldr r2, [r0]
	ldr r1, [r2, #4]
	ldrb r1, [r1, #4]
	adds r4, r0, #0
	cmp r1, #0x51
	beq _080230B8
	ldr r0, [r2, #0xc]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	bne _080230B8
	movs r0, #0x11
	ldrsb r0, [r2, r0]
	ldr r1, _08023084  @ gBmMapTerrain
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #5
	beq _08023090
	cmp r0, #5
	bgt _08023088
	cmp r0, #3
	beq _08023090
	b _080230B8
	.align 2, 0
_08023080: .4byte gActiveUnit
_08023084: .4byte gBmMapTerrain
_08023088:
	cmp r0, #0x38
	bgt _080230B8
	cmp r0, #0x37
	blt _080230B8
_08023090:
	ldr r1, [r4]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	ldrb r1, [r1, #0x11]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl GetAvailableLocaCommandAt
	cmp r0, #0x10
	bne _080230B8
	ldr r0, [r4]
	bl IsUnitMagicSealed
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080230B4
	movs r0, #2
	b _080230BA
_080230B4:
	movs r0, #1
	b _080230BA
_080230B8:
	movs r0, #3
_080230BA:
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END VisitCommandUsability

	THUMB_FUNC_START VisitCommandEffect
VisitCommandEffect: @ 0x080230C0
	push {lr}
	adds r2, r0, #0
	adds r1, #0x3d
	ldrb r0, [r1]
	cmp r0, #2
	beq _080230DC
	ldr r1, _080230D8  @ gActionData
	movs r0, #0x10
	strb r0, [r1, #0x11]
	movs r0, #0x17
	b _080230E6
	.align 2, 0
_080230D8: .4byte gActionData
_080230DC:
	ldr r1, _080230EC  @ 0x0000084C
	adds r0, r2, #0
	bl MenuFrozenHelpBox
	movs r0, #8
_080230E6:
	pop {r1}
	bx r1
	.align 2, 0
_080230EC: .4byte 0x0000084C

	THUMB_FUNC_END VisitCommandEffect

	THUMB_FUNC_START sub_80230F0
sub_80230F0: @ 0x080230F0
	push {r4, r5, r6, lr}
	ldr r6, _08023114  @ gActiveUnit
	ldr r2, [r6]
	ldr r0, [r2, #0xc]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	bne _0802314E
	adds r0, r2, #0
	bl sub_8025B6C
	bl sub_804FD28
	cmp r0, #0
	beq _08023118
_0802310E:
	movs r0, #1
	b _08023150
	.align 2, 0
_08023114: .4byte gActiveUnit
_08023118:
	movs r5, #0
	ldr r0, [r6]
	ldrh r4, [r0, #0x1e]
	cmp r4, #0
	beq _0802314E
_08023122:
	adds r0, r4, #0
	bl GetItemType
	cmp r0, #0xc
	bne _0802313A
	ldr r0, [r6]
	adds r1, r4, #0
	bl CanUnitUseItem
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0802310E
_0802313A:
	adds r5, #1
	cmp r5, #4
	bgt _0802314E
	ldr r0, [r6]
	lsls r1, r5, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r4, [r0]
	cmp r4, #0
	bne _08023122
_0802314E:
	movs r0, #3
_08023150:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80230F0

	THUMB_FUNC_START PlayCommandUsability
PlayCommandUsability: @ 0x08023158
	push {lr}
	adds r3, r0, #0
	ldr r0, _08023184  @ gActiveUnit
	ldr r0, [r0]
	ldr r1, [r0]
	ldr r2, [r0, #4]
	ldr r0, [r1, #0x28]
	ldr r1, [r2, #0x28]
	orrs r0, r1
	movs r1, #0x20
	ands r0, r1
	cmp r0, #0
	beq _0802318C
	ldr r1, _08023188  @ gUnknown_0202BCB0
	movs r0, #0xcd
	strh r0, [r1, #0x2c]
	adds r0, r3, #0
	bl sub_80230F0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	b _0802318E
	.align 2, 0
_08023184: .4byte gActiveUnit
_08023188: .4byte gUnknown_0202BCB0
_0802318C:
	movs r0, #3
_0802318E:
	pop {r1}
	bx r1

	THUMB_FUNC_END PlayCommandUsability

	THUMB_FUNC_START DanceCommandUsability
DanceCommandUsability: @ 0x08023194
	push {lr}
	adds r3, r0, #0
	ldr r0, _080231C0  @ gActiveUnit
	ldr r0, [r0]
	ldr r1, [r0]
	ldr r2, [r0, #4]
	ldr r0, [r1, #0x28]
	ldr r1, [r2, #0x28]
	orrs r0, r1
	movs r1, #0x10
	ands r0, r1
	cmp r0, #0
	beq _080231C8
	ldr r1, _080231C4  @ gUnknown_0202BCB0
	movs r0, #0xa5
	strh r0, [r1, #0x2c]
	adds r0, r3, #0
	bl sub_80230F0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	b _080231CA
	.align 2, 0
_080231C0: .4byte gActiveUnit
_080231C4: .4byte gUnknown_0202BCB0
_080231C8:
	movs r0, #3
_080231CA:
	pop {r1}
	bx r1

	THUMB_FUNC_END DanceCommandUsability

	THUMB_FUNC_START PlayCommandEffect
PlayCommandEffect: @ 0x080231D0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov r9, r0
	mov sl, r1
	movs r7, #0
	ldr r6, _08023248  @ gActiveUnit
	ldr r0, [r6]
	bl sub_8025B6C
	bl sub_804FD28
	negs r1, r0
	orrs r1, r0
	lsrs r1, r1, #0x1f
	mov r8, r1
	movs r5, #0
	ldr r0, [r6]
	ldrh r4, [r0, #0x1e]
	cmp r4, #0
	beq _0802322E
_08023200:
	adds r0, r4, #0
	bl GetItemType
	cmp r0, #0xc
	bne _0802321A
	ldr r0, [r6]
	adds r1, r4, #0
	bl CanUnitUseItem
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0802321A
	movs r7, #1
_0802321A:
	adds r5, #1
	cmp r5, #4
	bgt _0802322E
	ldr r0, [r6]
	lsls r1, r5, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r4, [r0]
	cmp r4, #0
	bne _08023200
_0802322E:
	mov r0, r8
	cmp r0, #0
	beq _0802324C
	cmp r7, #0
	bne _0802324C
	mov r0, r9
	mov r1, sl
	bl ItemMenu_Select1stCommand
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	b _0802328C
	.align 2, 0
_08023248: .4byte gActiveUnit
_0802324C:
	ldr r0, _0802329C  @ gItemMenuDef
	bl StartOrphanMenu
	adds r5, r0, #0
	ldr r4, _080232A0  @ gActiveUnit
	ldr r0, [r4]
	bl GetUnitPortraitId
	adds r1, r0, #0
	movs r0, #2
	str r0, [sp]
	movs r0, #0
	movs r2, #0xb0
	movs r3, #0xc
	bl NewFace
	movs r0, #0
	movs r1, #5
	bl sub_8006458
	ldr r1, [r4]
	adds r0, r5, #0
	movs r2, #0xf
	movs r3, #0xb
	bl sub_801E684
	bl ResetIconGraphics
	movs r0, #4
	bl LoadIconPalettes
	movs r0, #0x17
_0802328C:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0802329C: .4byte gItemMenuDef
_080232A0: .4byte gActiveUnit

	THUMB_FUNC_END PlayCommandEffect

	THUMB_FUNC_START sub_80232A4
sub_80232A4: @ 0x080232A4
	ldr r2, _080232B4  @ gActionData
	movs r0, #4
	strb r0, [r2, #0x11]
	ldrb r0, [r1, #2]
	strb r0, [r2, #0xd]
	movs r0, #0x17
	bx lr
	.align 2, 0
_080232B4: .4byte gActionData

	THUMB_FUNC_END sub_80232A4

	THUMB_FUNC_START ItemCommandUsability
ItemCommandUsability: @ 0x080232B8
	push {lr}
	ldr r0, _080232DC  @ gActiveUnit
	ldr r2, [r0]
	ldr r0, [r2, #0xc]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	bne _080232E0
	ldr r0, [r2, #4]
	ldrb r0, [r0, #4]
	cmp r0, #0x51
	beq _080232E0
	ldrh r0, [r2, #0x1e]
	cmp r0, #0
	beq _080232E0
	movs r0, #1
	b _080232E2
	.align 2, 0
_080232DC: .4byte gActiveUnit
_080232E0:
	movs r0, #3
_080232E2:
	pop {r1}
	bx r1

	THUMB_FUNC_END ItemCommandUsability

	THUMB_FUNC_START ItemCommandEffect
ItemCommandEffect: @ 0x080232E8
	push {r4, r5, lr}
	sub sp, #4
	adds r1, #0x3d
	ldrb r0, [r1]
	cmp r0, #1
	bne _08023344
	bl ResetIconGraphics
	movs r0, #4
	bl LoadIconPalettes
	bl sub_8003D20
	ldr r0, _0802333C  @ gItemSelectMenuDef
	bl StartOrphanMenu
	adds r5, r0, #0
	ldr r4, _08023340  @ gActiveUnit
	ldr r0, [r4]
	bl GetUnitPortraitId
	adds r1, r0, #0
	movs r0, #2
	str r0, [sp]
	movs r0, #0
	movs r2, #0xb0
	movs r3, #0xc
	bl NewFace
	movs r0, #0
	movs r1, #5
	bl sub_8006458
	ldr r1, [r4]
	adds r0, r5, #0
	movs r2, #0xf
	movs r3, #0xb
	bl sub_801E684
	movs r0, #0x17
	b _08023346
	.align 2, 0
_0802333C: .4byte gItemSelectMenuDef
_08023340: .4byte gActiveUnit
_08023344:
	movs r0, #0
_08023346:
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END ItemCommandEffect

	THUMB_FUNC_START ItemSelectMenu_TextDraw
ItemSelectMenu_TextDraw: @ 0x08023350
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r4, r1, #0
	ldr r7, _08023388  @ gActiveUnit
	ldr r1, [r7]
	adds r0, r4, #0
	adds r0, #0x3c
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #1
	adds r1, #0x1e
	adds r1, r1, r0
	ldrh r5, [r1]
	adds r0, r5, #0
	bl GetItemAttributes
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	beq _0802338C
	adds r0, r6, #0
	adds r1, r4, #0
	bl UnknownMenu_Draw
	movs r0, #0
	b _080233CC
	.align 2, 0
_08023388: .4byte gActiveUnit
_0802338C:
	adds r0, r5, #0
	bl GetItemType
	cmp r0, #0xc
	bne _0802339A
	movs r2, #0
	b _080233A6
_0802339A:
	ldr r0, [r7]
	adds r1, r5, #0
	bl CanUnitUseItem
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
_080233A6:
	adds r0, r4, #0
	adds r0, #0x34
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	movs r1, #0x2c
	ldrsh r3, [r4, r1]
	lsls r3, r3, #5
	movs r6, #0x2a
	ldrsh r1, [r4, r6]
	adds r3, r3, r1
	lsls r3, r3, #1
	ldr r1, _080233D4  @ gBG0TilemapBuffer
	adds r3, r3, r1
	adds r1, r5, #0
	bl DrawItemMenuLine
	movs r0, #1
	bl BG_EnableSyncByMask
_080233CC:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080233D4: .4byte gBG0TilemapBuffer

	THUMB_FUNC_END ItemSelectMenu_TextDraw

	THUMB_FUNC_START ItemSelectMenu_Usability
ItemSelectMenu_Usability: @ 0x080233D8
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r5, r1, #0
	ldr r7, _080233F4  @ gActiveUnit
	ldr r0, [r7]
	lsls r1, r5, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r4, [r0]
	cmp r4, #0
	bne _080233F8
	movs r0, #3
	b _08023422
	.align 2, 0
_080233F4: .4byte gActiveUnit
_080233F8:
	adds r0, r4, #0
	bl GetItemAttributes
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	beq _0802340E
	adds r0, r6, #0
	adds r1, r5, #0
	bl UnknownMenu_IsAvailable
_0802340E:
	ldr r0, [r7]
	adds r1, r4, #0
	bl CanUnitUseItem
	lsls r0, r0, #0x18
	movs r1, #2
	cmp r0, #0
	beq _08023420
	movs r1, #1
_08023420:
	adds r0, r1, #0
_08023422:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END ItemSelectMenu_Usability

	THUMB_FUNC_START ItemSelectMenu_Effect
ItemSelectMenu_Effect: @ 0x08023428
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r2, _08023480  @ gActionData
	adds r0, r1, #0
	adds r0, #0x3c
	ldrb r0, [r0]
	strb r0, [r2, #0x12]
	ldrh r0, [r1, #0x2a]
	adds r0, #9
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _08023484  @ 0xFFFFFF00
	ands r5, r2
	orrs r5, r0
	ldrh r0, [r1, #0x2c]
	subs r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x10
	ldr r1, _08023488  @ 0xFFFF00FF
	ands r5, r1
	orrs r5, r0
	ldr r0, _0802348C  @ 0xFF00FFFF
	ands r5, r0
	movs r0, #0xe0
	lsls r0, r0, #0xb
	orrs r5, r0
	ldr r0, _08023490  @ 0x00FFFFFF
	ands r5, r0
	lsls r0, r5, #0x18
	asrs r0, r0, #0x18
	lsls r1, r5, #0x10
	asrs r1, r1, #0x18
	bl sub_80234AC
	ldr r0, _08023494  @ gItemSubMenuDef
	adds r1, r5, #0
	adds r2, r4, #0
	bl StartMenuAt
	movs r0, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08023480: .4byte gActionData
_08023484: .4byte 0xFFFFFF00
_08023488: .4byte 0xFFFF00FF
_0802348C: .4byte 0xFF00FFFF
_08023490: .4byte 0x00FFFFFF
_08023494: .4byte gItemSubMenuDef

	THUMB_FUNC_END ItemSelectMenu_Effect

	THUMB_FUNC_START Menu_SwitchIn
Menu_SwitchIn: @ 0x08023498
	push {lr}
	adds r1, #0x3c
	movs r0, #0
	ldrsb r0, [r1, r0]
	bl sub_801E748
	pop {r1}
	bx r1

	THUMB_FUNC_END Menu_SwitchIn

	THUMB_FUNC_START Menu_SwitchOut_DoNothing
Menu_SwitchOut_DoNothing: @ 0x080234A8
	bx lr

	THUMB_FUNC_END Menu_SwitchOut_DoNothing

	THUMB_FUNC_START sub_80234AC
sub_80234AC: @ 0x080234AC
	push {lr}
	ldr r0, _080234D8  @ gUnknown_02002774
	ldr r1, _080234DC  @ 0x06004000
	movs r2, #0x80
	lsls r2, r2, #2
	movs r3, #0
	bl Font_InitForUI
	ldr r0, _080234E0  @ gUnknown_02022CFE
	ldr r1, _080234E4  @ gBmFrameTmap0
	movs r2, #9
	movs r3, #0x13
	bl TileMap_CopyRect
	ldr r0, _080234E8  @ gUnknown_020234FE
	ldr r1, _080234EC  @ gUnknown_0200422C
	movs r2, #9
	movs r3, #0x13
	bl TileMap_CopyRect
	pop {r0}
	bx r0
	.align 2, 0
_080234D8: .4byte gUnknown_02002774
_080234DC: .4byte 0x06004000
_080234E0: .4byte gUnknown_02022CFE
_080234E4: .4byte gBmFrameTmap0
_080234E8: .4byte gUnknown_020234FE
_080234EC: .4byte gUnknown_0200422C

	THUMB_FUNC_END sub_80234AC

	THUMB_FUNC_START ItemSubMenuEnd
ItemSubMenuEnd: @ 0x080234F0
	push {lr}
	movs r0, #0
	bl SetFont
	pop {r0}
	bx r0

	THUMB_FUNC_END ItemSubMenuEnd

	THUMB_FUNC_START MenuCommand_SelectNo
MenuCommand_SelectNo: @ 0x080234FC
	push {lr}
	movs r0, #0
	bl SetFont
	ldr r0, _08023528  @ gBmFrameTmap0
	ldr r1, _0802352C  @ gUnknown_02022CFE
	movs r2, #9
	movs r3, #0x13
	bl TileMap_CopyRect
	ldr r0, _08023530  @ gUnknown_0200422C
	ldr r1, _08023534  @ gUnknown_020234FE
	movs r2, #9
	movs r3, #0x13
	bl TileMap_CopyRect
	movs r0, #3
	bl BG_EnableSyncByMask
	movs r0, #0xb
	pop {r1}
	bx r1
	.align 2, 0
_08023528: .4byte gBmFrameTmap0
_0802352C: .4byte gUnknown_02022CFE
_08023530: .4byte gUnknown_0200422C
_08023534: .4byte gUnknown_020234FE

	THUMB_FUNC_END MenuCommand_SelectNo

	THUMB_FUNC_START sub_8023538
sub_8023538: @ 0x08023538
	push {lr}
	movs r0, #0
	bl SetFont
	bl sub_8003D20
	bl EndAllMenus
	movs r0, #0x31
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8023538

	THUMB_FUNC_START sub_8023550
sub_8023550: @ 0x08023550
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	bl sub_8023538
	adds r0, r4, #0
	bl MenuCommand_SelectNo
	ldr r0, _080235A0  @ gItemSelectMenuDef
	bl StartOrphanMenu
	adds r5, r0, #0
	ldr r4, _080235A4  @ gActiveUnit
	ldr r0, [r4]
	bl GetUnitPortraitId
	adds r1, r0, #0
	movs r0, #2
	str r0, [sp]
	movs r0, #0
	movs r2, #0xb0
	movs r3, #0xc
	bl NewFace
	movs r0, #0
	movs r1, #5
	bl sub_8006458
	ldr r1, [r4]
	adds r0, r5, #0
	movs r2, #0xf
	movs r3, #0xb
	bl sub_801E684
	movs r0, #1
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080235A0: .4byte gItemSelectMenuDef
_080235A4: .4byte gActiveUnit

	THUMB_FUNC_END sub_8023550

	THUMB_FUNC_START sub_80235A8
sub_80235A8: @ 0x080235A8
	push {r4, r5, r6, lr}
	sub sp, #4
	bl sub_8023538
	ldr r6, _08023630  @ gActiveUnit
	ldr r0, [r6]
	bl GetUnitItemCount
	cmp r0, #0
	beq _08023648
	ldr r0, _08023634  @ gBmFrameTmap0
	ldr r5, _08023638  @ gUnknown_02022CFE
	adds r1, r5, #0
	movs r2, #9
	movs r3, #0x13
	bl TileMap_CopyRect
	ldr r0, _0802363C  @ gUnknown_0200422C
	ldr r4, _08023640  @ gUnknown_020234FE
	adds r1, r4, #0
	movs r2, #9
	movs r3, #0x13
	bl TileMap_CopyRect
	subs r5, #0x14
	adds r0, r5, #0
	movs r1, #0xe
	movs r2, #0xc
	movs r3, #0
	bl TileMap_FillRect
	subs r4, #0x14
	adds r0, r4, #0
	movs r1, #0xd
	movs r2, #0xc
	movs r3, #0
	bl TileMap_FillRect
	movs r0, #3
	bl BG_EnableSyncByMask
	ldr r0, _08023644  @ gItemSelectMenuDef
	bl StartOrphanMenu
	adds r4, r0, #0
	ldr r0, [r6]
	bl GetUnitPortraitId
	adds r1, r0, #0
	movs r0, #2
	str r0, [sp]
	movs r0, #0
	movs r2, #0xb0
	movs r3, #0xc
	bl NewFace
	movs r0, #0
	movs r1, #5
	bl sub_8006458
	ldr r1, [r6]
	adds r0, r4, #0
	movs r2, #0xf
	movs r3, #0xb
	bl sub_801E684
	movs r0, #1
	b _0802366A
	.align 2, 0
_08023630: .4byte gActiveUnit
_08023634: .4byte gBmFrameTmap0
_08023638: .4byte gUnknown_02022CFE
_0802363C: .4byte gUnknown_0200422C
_08023640: .4byte gUnknown_020234FE
_08023644: .4byte gItemSelectMenuDef
_08023648:
	bl ClearBg0Bg1
	movs r0, #0
	bl DeleteFaceByIndex
	ldr r0, _08023674  @ gUnitActionMenuDef
	ldr r2, _08023678  @ gUnknown_0202BCB0
	movs r3, #0x1c
	ldrsh r1, [r2, r3]
	movs r3, #0xc
	ldrsh r2, [r2, r3]
	subs r1, r1, r2
	movs r2, #1
	movs r3, #0x16
	bl StartSemiCenteredOrphanMenu
	movs r0, #0x1b
_0802366A:
	add sp, #4
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08023674: .4byte gUnitActionMenuDef
_08023678: .4byte gUnknown_0202BCB0

	THUMB_FUNC_END sub_80235A8

	THUMB_FUNC_START ItemSubMenu_IsUseAvailable
ItemSubMenu_IsUseAvailable: @ 0x0802367C
	push {r4, r5, lr}
	ldr r5, _080236CC  @ gActiveUnit
	ldr r1, [r5]
	ldr r0, _080236D0  @ gActionData
	ldrb r0, [r0, #0x12]
	lsls r0, r0, #1
	adds r1, #0x1e
	adds r1, r1, r0
	ldrh r4, [r1]
	adds r0, r4, #0
	bl GetItemUseEffect
	cmp r0, #0
	beq _080236C8
	adds r0, r4, #0
	bl GetItemType
	cmp r0, #4
	beq _080236C8
	adds r0, r4, #0
	bl GetItemType
	cmp r0, #0xc
	beq _080236C8
	adds r0, r4, #0
	bl GetItemAttributes
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	beq _080236D4
	ldr r0, [r5]
	adds r1, r4, #0
	bl CanUnitUseWeapon
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080236D4
_080236C8:
	movs r0, #3
	b _080236EA
	.align 2, 0
_080236CC: .4byte gActiveUnit
_080236D0: .4byte gActionData
_080236D4:
	ldr r0, _080236F0  @ gActiveUnit
	ldr r0, [r0]
	adds r1, r4, #0
	bl CanUnitUseItem
	lsls r0, r0, #0x18
	movs r1, #2
	cmp r0, #0
	beq _080236E8
	movs r1, #1
_080236E8:
	adds r0, r1, #0
_080236EA:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080236F0: .4byte gActiveUnit

	THUMB_FUNC_END ItemSubMenu_IsUseAvailable

	THUMB_FUNC_START ItemSubMenu_IsEquipAvailable
ItemSubMenu_IsEquipAvailable: @ 0x080236F4
	push {r4, r5, lr}
	ldr r5, _08023718  @ gActiveUnit
	ldr r1, [r5]
	ldr r0, _0802371C  @ gActionData
	ldrb r0, [r0, #0x12]
	lsls r0, r0, #1
	adds r1, #0x1e
	adds r1, r1, r0
	ldrh r4, [r1]
	adds r0, r4, #0
	bl GetItemAttributes
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	bne _08023720
	movs r0, #3
	b _08023734
	.align 2, 0
_08023718: .4byte gActiveUnit
_0802371C: .4byte gActionData
_08023720:
	ldr r0, [r5]
	adds r1, r4, #0
	bl CanUnitUseWeapon
	lsls r0, r0, #0x18
	movs r1, #2
	cmp r0, #0
	beq _08023732
	movs r1, #1
_08023732:
	adds r0, r1, #0
_08023734:
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END ItemSubMenu_IsEquipAvailable

	THUMB_FUNC_START ItemSubMenu_IsDiscardAvailable
ItemSubMenu_IsDiscardAvailable: @ 0x0802373C
	push {lr}
	ldr r0, _08023760  @ gActiveUnit
	ldr r1, [r0]
	ldr r0, _08023764  @ gActionData
	ldrb r0, [r0, #0x12]
	lsls r0, r0, #1
	adds r1, #0x1e
	adds r1, r1, r0
	ldrh r0, [r1]
	bl GetItemAttributes
	movs r1, #0x10
	ands r1, r0
	cmp r1, #0
	bne _08023768
	movs r0, #1
	b _0802376A
	.align 2, 0
_08023760: .4byte gActiveUnit
_08023764: .4byte gActionData
_08023768:
	movs r0, #2
_0802376A:
	pop {r1}
	bx r1

	THUMB_FUNC_END ItemSubMenu_IsDiscardAvailable

	THUMB_FUNC_START ItemSubMenu_UseItem
ItemSubMenu_UseItem: @ 0x08023770
	push {r4, lr}
	adds r4, r0, #0
	adds r1, #0x3d
	ldrb r0, [r1]
	cmp r0, #2
	bne _080237A8
	ldr r0, _080237A0  @ gActiveUnit
	ldr r0, [r0]
	ldr r1, _080237A4  @ gActionData
	ldrb r2, [r1, #0x12]
	lsls r2, r2, #1
	adds r1, r0, #0
	adds r1, #0x1e
	adds r1, r1, r2
	ldrh r1, [r1]
	bl GetItemCantUseMsgid
	adds r1, r0, #0
	adds r0, r4, #0
	bl MenuFrozenHelpBox
	movs r0, #8
	b _080237E4
	.align 2, 0
_080237A0: .4byte gActiveUnit
_080237A4: .4byte gActionData
_080237A8:
	bl ClearBg0Bg1
	ldr r0, _080237EC  @ gActiveUnit
	ldr r0, [r0]
	ldr r1, _080237F0  @ gActionData
	ldrb r2, [r1, #0x12]
	lsls r2, r2, #1
	adds r1, r0, #0
	adds r1, #0x1e
	adds r1, r1, r2
	ldrh r1, [r1]
	bl DoItemUse
	ldr r0, _080237F4  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080237D4
	movs r0, #0x6a
	bl m4aSongNumStart
_080237D4:
	movs r0, #0
	bl SetFont
	bl sub_8003D20
	bl EndAllMenus
	movs r0, #0x21
_080237E4:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080237EC: .4byte gActiveUnit
_080237F0: .4byte gActionData
_080237F4: .4byte gRAMChapterData

	THUMB_FUNC_END ItemSubMenu_UseItem

	THUMB_FUNC_START ItemSubMenu_EquipItem
ItemSubMenu_EquipItem: @ 0x080237F8
	push {r4, lr}
	adds r4, r0, #0
	adds r1, #0x3d
	ldrb r0, [r1]
	cmp r0, #2
	beq _08023824
	ldr r0, _0802381C  @ gActiveUnit
	ldr r0, [r0]
	ldr r1, _08023820  @ gActionData
	ldrb r1, [r1, #0x12]
	bl EquipUnitItemSlot
	adds r0, r4, #0
	bl sub_8023550
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	b _0802382E
	.align 2, 0
_0802381C: .4byte gActiveUnit
_08023820: .4byte gActionData
_08023824:
	ldr r1, _08023834  @ 0x0000084D
	adds r0, r4, #0
	bl MenuFrozenHelpBox
	movs r0, #8
_0802382E:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08023834: .4byte 0x0000084D

	THUMB_FUNC_END ItemSubMenu_EquipItem

	THUMB_FUNC_START ItemSubMenu_TradeItem
ItemSubMenu_TradeItem: @ 0x08023838
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _08023864  @ gUnknown_0202BCB0
	ldr r1, _08023868  @ gActionData
	ldrb r1, [r1, #0x12]
	adds r0, #0x3f
	strb r1, [r0]
	adds r0, r4, #0
	bl sub_8023538
	movs r0, #0
	bl DeleteFaceByIndex
	adds r0, r4, #0
	adds r1, r5, #0
	bl TradeCommandEffect
	movs r0, #1
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08023864: .4byte gUnknown_0202BCB0
_08023868: .4byte gActionData

	THUMB_FUNC_END ItemSubMenu_TradeItem

	THUMB_FUNC_START ItemSubMenu_DiscardItem
ItemSubMenu_DiscardItem: @ 0x0802386C
	push {r4, lr}
	adds r4, r0, #0
	adds r2, r1, #0
	adds r0, r2, #0
	adds r0, #0x3d
	ldrb r0, [r0]
	cmp r0, #2
	beq _080238CC
	ldrh r0, [r2, #0x2a]
	adds r0, #3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _080238B8  @ 0xFFFFFF00
	ands r3, r1
	orrs r3, r0
	ldrh r0, [r2, #0x2c]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x10
	ldr r1, _080238BC  @ 0xFFFF00FF
	ands r3, r1
	orrs r3, r0
	ldr r0, _080238C0  @ 0xFF00FFFF
	ands r3, r0
	movs r0, #0xa0
	lsls r0, r0, #0xb
	orrs r3, r0
	ldr r0, _080238C4  @ 0x00FFFFFF
	ands r3, r0
	ldr r0, _080238C8  @ gYesNoSelectionMenuDef
	adds r1, r3, #0
	adds r2, r4, #0
	bl StartMenuAt
	adds r0, #0x61
	movs r1, #1
	strb r1, [r0]
	movs r0, #0x84
	b _080238D6
	.align 2, 0
_080238B8: .4byte 0xFFFFFF00
_080238BC: .4byte 0xFFFF00FF
_080238C0: .4byte 0xFF00FFFF
_080238C4: .4byte 0x00FFFFFF
_080238C8: .4byte gYesNoSelectionMenuDef
_080238CC:
	ldr r1, _080238DC  @ 0x0000084F
	adds r0, r4, #0
	bl MenuFrozenHelpBox
	movs r0, #8
_080238D6:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080238DC: .4byte 0x0000084F

	THUMB_FUNC_END ItemSubMenu_DiscardItem

	THUMB_FUNC_START MenuCommand_SelectYes
MenuCommand_SelectYes: @ 0x080238E0
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _0802390C  @ gActiveUnit
	ldr r0, [r0]
	ldr r4, _08023910  @ gActionData
	ldrb r1, [r4, #0x12]
	bl UnitRemoveItem
	ldrb r0, [r4, #0x12]
	cmp r0, #0
	beq _080238FE
	ldr r0, _08023914  @ gBG0TilemapBuffer
	movs r1, #0
	bl BG_Fill
_080238FE:
	adds r0, r5, #0
	bl sub_80235A8
	movs r0, #1
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0802390C: .4byte gActiveUnit
_08023910: .4byte gActionData
_08023914: .4byte gBG0TilemapBuffer

	THUMB_FUNC_END MenuCommand_SelectYes

	THUMB_FUNC_START BallistaRangeMenu_BallistaUsability
BallistaRangeMenu_BallistaUsability: @ 0x08023918
	push {lr}
	ldr r0, _0802392C  @ gActiveUnit
	ldr r2, [r0]
	ldr r0, [r2, #0xc]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08023930
	movs r0, #3
	b _0802394C
	.align 2, 0
_0802392C: .4byte gActiveUnit
_08023930:
	movs r0, #0x10
	ldrsb r0, [r2, r0]
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	bl GetBallistaItemAt
	movs r1, #0xff
	lsls r1, r1, #8
	ands r1, r0
	cmp r1, #0
	bne _0802394A
	movs r0, #2
	b _0802394C
_0802394A:
	movs r0, #1
_0802394C:
	pop {r1}
	bx r1

	THUMB_FUNC_END BallistaRangeMenu_BallistaUsability

	THUMB_FUNC_START BallistaRangeMenu_Draw
BallistaRangeMenu_Draw: @ 0x08023950
	push {r4, r5, lr}
	adds r4, r1, #0
	movs r5, #0
	adds r0, r4, #0
	adds r0, #0x3d
	ldrb r0, [r0]
	cmp r0, #1
	bne _08023962
	movs r5, #1
_08023962:
	ldr r0, _08023998  @ gActiveUnit
	ldr r1, [r0]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	ldrb r1, [r1, #0x11]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl GetBallistaItemAt
	adds r1, r0, #0
	adds r0, r4, #0
	adds r0, #0x34
	adds r2, r5, #0
	movs r5, #0x2c
	ldrsh r3, [r4, r5]
	lsls r3, r3, #5
	movs r5, #0x2a
	ldrsh r4, [r4, r5]
	adds r3, r3, r4
	lsls r3, r3, #1
	ldr r4, _0802399C  @ gBG0TilemapBuffer
	adds r3, r3, r4
	bl DrawItemMenuLine
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08023998: .4byte gActiveUnit
_0802399C: .4byte gBG0TilemapBuffer

	THUMB_FUNC_END BallistaRangeMenu_Draw

	THUMB_FUNC_START BallistaRangeMenu_Select
BallistaRangeMenu_Select: @ 0x080239A0
	push {lr}
	bl ClearBg0Bg1
	ldr r1, _080239C0  @ gActionData
	movs r0, #8
	strb r0, [r1, #0x12]
	ldr r0, _080239C4  @ gActiveUnit
	ldr r0, [r0]
	bl FillBallistaRangeMaybe
	ldr r0, _080239C8  @ gUnknown_0859D3F8
	bl NewTargetSelection
	movs r0, #0x26
	pop {r1}
	bx r1
	.align 2, 0
_080239C0: .4byte gActionData
_080239C4: .4byte gActiveUnit
_080239C8: .4byte gUnknown_0859D3F8

	THUMB_FUNC_END BallistaRangeMenu_Select

	THUMB_FUNC_START FillBallistaRange
FillBallistaRange: @ 0x080239CC
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	ldr r0, _08023A48  @ gBmMapMovement
	ldr r0, [r0]
	movs r1, #1
	negs r1, r1
	bl BmMapFill
	ldr r4, _08023A4C  @ gBmMapRange
	ldr r0, [r4]
	movs r1, #0
	bl BmMapFill
	ldr r0, [r4]
	bl SetWorkingBmMap
	ldr r4, _08023A50  @ gActiveUnit
	ldr r1, [r4]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	ldrb r1, [r1, #0x11]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl GetBallistaItemAt
	adds r5, r0, #0
	bl sub_801E748
	ldr r0, [r4]
	movs r6, #0x10
	ldrsb r6, [r0, r6]
	ldrb r0, [r0, #0x11]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	mov r8, r0
	adds r0, r5, #0
	bl GetItemMinRange
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	adds r0, r5, #0
	bl GetItemMaxRange
	adds r3, r0, #0
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	adds r0, r6, #0
	mov r1, r8
	adds r2, r4, #0
	bl MapAddInBoundedRange
	movs r0, #2
	bl DisplayMoveRangeGraphics
	movs r0, #0
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08023A48: .4byte gBmMapMovement
_08023A4C: .4byte gBmMapRange
_08023A50: .4byte gActiveUnit

	THUMB_FUNC_END FillBallistaRange

	THUMB_FUNC_START StaffCommandUsability
StaffCommandUsability: @ 0x08023A54
	push {r4, r5, r6, lr}
	ldr r0, _08023A68  @ gActiveUnit
	ldr r2, [r0]
	ldr r0, [r2, #0xc]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08023A70
	b _08023ABE
	.align 2, 0
_08023A68: .4byte gActiveUnit
_08023A6C:
	movs r0, #2
	b _08023AC0
_08023A70:
	movs r6, #0
	ldrh r4, [r2, #0x1e]
	cmp r4, #0
	beq _08023ABE
_08023A78:
	adds r0, r4, #0
	bl GetItemType
	cmp r0, #4
	bne _08023AA8
	ldr r5, _08023AA4  @ gActiveUnit
	ldr r0, [r5]
	adds r1, r4, #0
	bl CanUnitUseItem
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08023AA8
	ldr r0, [r5]
	bl IsUnitMagicSealed
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08023A6C
	movs r0, #1
	b _08023AC0
	.align 2, 0
_08023AA4: .4byte gActiveUnit
_08023AA8:
	adds r6, #1
	cmp r6, #4
	bgt _08023ABE
	ldr r0, _08023AC8  @ gActiveUnit
	ldr r0, [r0]
	lsls r1, r6, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r4, [r0]
	cmp r4, #0
	bne _08023A78
_08023ABE:
	movs r0, #3
_08023AC0:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08023AC8: .4byte gActiveUnit

	THUMB_FUNC_END StaffCommandUsability

	THUMB_FUNC_START StaffCommandEffect
StaffCommandEffect: @ 0x08023ACC
	push {r4, r5, lr}
	sub sp, #4
	adds r2, r0, #0
	adds r1, #0x3d
	ldrb r0, [r1]
	cmp r0, #2
	beq _08023B24
	bl ResetIconGraphics
	movs r0, #4
	bl LoadIconPalettes
	ldr r0, _08023B1C  @ gStaffItemSelectMenuDef
	bl StartOrphanMenu
	adds r5, r0, #0
	ldr r4, _08023B20  @ gActiveUnit
	ldr r0, [r4]
	bl GetUnitPortraitId
	adds r1, r0, #0
	movs r0, #2
	str r0, [sp]
	movs r0, #0
	movs r2, #0xb0
	movs r3, #0xc
	bl NewFace
	movs r0, #0
	movs r1, #5
	bl sub_8006458
	ldr r1, [r4]
	adds r0, r5, #0
	movs r2, #0xf
	movs r3, #0xb
	bl sub_801E684
	movs r0, #0x17
	b _08023B2E
	.align 2, 0
_08023B1C: .4byte gStaffItemSelectMenuDef
_08023B20: .4byte gActiveUnit
_08023B24:
	ldr r1, _08023B38  @ 0x00000851
	adds r0, r2, #0
	bl MenuFrozenHelpBox
	movs r0, #8
_08023B2E:
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08023B38: .4byte 0x00000851

	THUMB_FUNC_END StaffCommandEffect

	THUMB_FUNC_START StaffCommandRange
StaffCommandRange: @ 0x08023B3C
	push {r4, r5, r6, lr}
	ldr r5, _08023B78  @ gActiveUnit
	ldr r0, [r5]
	movs r4, #1
	negs r4, r4
	adds r1, r4, #0
	bl GetUnitItemUseReachBits
	adds r6, r0, #0
	ldr r0, _08023B7C  @ gBmMapMovement
	ldr r0, [r0]
	adds r1, r4, #0
	bl BmMapFill
	ldr r0, _08023B80  @ gBmMapRange
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFill
	ldr r0, [r5]
	adds r1, r6, #0
	bl GenerateUnitStandingReachRange
	movs r0, #5
	bl DisplayMoveRangeGraphics
	movs r0, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08023B78: .4byte gActiveUnit
_08023B7C: .4byte gBmMapMovement
_08023B80: .4byte gBmMapRange

	THUMB_FUNC_END StaffCommandRange

	THUMB_FUNC_START HideMoveRangeGraphicsWrapper2
HideMoveRangeGraphicsWrapper2: @ 0x0HideMoveRangeGraphicsWrapper2
	push {lr}
	bl HideMoveRangeGraphics
	movs r0, #0
	pop {r1}
	bx r1

	THUMB_FUNC_END HideMoveRangeGraphicsWrapper2

	THUMB_FUNC_START StaffItemSelect_Usability
StaffItemSelect_Usability: @ 0x08023B90
	push {r4, r5, lr}
	ldr r5, _08023BBC  @ gActiveUnit
	ldr r0, [r5]
	lsls r1, r1, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r4, [r0]
	adds r0, r4, #0
	bl GetItemType
	cmp r0, #4
	bne _08023BC0
	ldr r0, [r5]
	adds r1, r4, #0
	bl CanUnitUseItem
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08023BC0
	movs r0, #1
	b _08023BC2
	.align 2, 0
_08023BBC: .4byte gActiveUnit
_08023BC0:
	movs r0, #3
_08023BC2:
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END StaffItemSelect_Usability

	THUMB_FUNC_START StaffItemSelect_Effect
StaffItemSelect_Effect: @ 0x08023BC8
	push {r4, r5, lr}
	ldr r5, _08023C00  @ gActiveUnit
	ldr r0, [r5]
	adds r1, #0x3c
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl EquipUnitItemSlot
	ldr r4, _08023C04  @ gActionData
	movs r0, #0
	strb r0, [r4, #0x12]
	bl ClearBg0Bg1
	ldr r0, [r5]
	ldrb r2, [r4, #0x12]
	lsls r2, r2, #1
	adds r1, r0, #0
	adds r1, #0x1e
	adds r1, r1, r2
	ldrh r1, [r1]
	bl DoItemUse
	movs r0, #7
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08023C00: .4byte gActiveUnit
_08023C04: .4byte gActionData

	THUMB_FUNC_END StaffItemSelect_Effect

	THUMB_FUNC_START StaffItemSelect_TextDraw
StaffItemSelect_TextDraw: @ 0x08023C08
	push {lr}
	bl ItemSelectMenu_TextDraw
	pop {r1}
	bx r1

	THUMB_FUNC_END StaffItemSelect_TextDraw

	THUMB_FUNC_START StaffItemSelect_OnHover
StaffItemSelect_OnHover: @ 0x08023C14
	push {r4, r5, r6, lr}
	adds r4, r1, #0
	ldr r5, _08023C5C  @ gActiveUnit
	ldr r0, [r5]
	adds r4, #0x3c
	movs r1, #0
	ldrsb r1, [r4, r1]
	bl GetUnitItemUseReachBits
	adds r6, r0, #0
	movs r0, #0
	ldrsb r0, [r4, r0]
	bl sub_801E748
	ldr r0, _08023C60  @ gBmMapMovement
	ldr r0, [r0]
	movs r1, #1
	negs r1, r1
	bl BmMapFill
	ldr r0, _08023C64  @ gBmMapRange
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFill
	ldr r0, [r5]
	adds r1, r6, #0
	bl GenerateUnitStandingReachRange
	movs r0, #4
	bl DisplayMoveRangeGraphics
	movs r0, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08023C5C: .4byte gActiveUnit
_08023C60: .4byte gBmMapMovement
_08023C64: .4byte gBmMapRange

	THUMB_FUNC_END StaffItemSelect_OnHover

	THUMB_FUNC_START StaffItemSelect_SwitchOut
StaffItemSelect_SwitchOut: @ 0x08023C68
	push {lr}
	adds r0, #0x63
	ldrb r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	bne _08023C7A
	bl HideMoveRangeGraphics
_08023C7A:
	movs r0, #0
	pop {r1}
	bx r1

	THUMB_FUNC_END StaffItemSelect_SwitchOut

	THUMB_FUNC_START TalkCommandUsability
TalkCommandUsability: @ 0x08023C80
	push {r4, lr}
	ldr r4, _08023CA4  @ gActiveUnit
	ldr r2, [r4]
	ldr r0, [r2, #0xc]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	bne _08023C9E
	adds r0, r2, #0
	bl sub_8025610
	bl sub_804FD28
	cmp r0, #0
	bne _08023CA8
_08023C9E:
	movs r0, #3
	b _08023CBC
	.align 2, 0
_08023CA4: .4byte gActiveUnit
_08023CA8:
	ldr r0, [r4]
	adds r0, #0x30
	ldrb r1, [r0]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #3
	beq _08023CBA
	movs r0, #1
	b _08023CBC
_08023CBA:
	movs r0, #2
_08023CBC:
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END TalkCommandUsability

	THUMB_FUNC_START TalkCommandEffect
TalkCommandEffect: @ 0x08023CC4
	push {lr}
	adds r2, r0, #0
	adds r1, #0x3d
	ldrb r0, [r1]
	cmp r0, #2
	beq _08023CEC
	ldr r0, _08023CE4  @ gActiveUnit
	ldr r0, [r0]
	bl sub_8025610
	ldr r0, _08023CE8  @ gUnknown_0859D398
	bl NewTargetSelection
	movs r0, #7
	b _08023CF6
	.align 2, 0
_08023CE4: .4byte gActiveUnit
_08023CE8: .4byte gUnknown_0859D398
_08023CEC:
	ldr r1, _08023CFC  @ 0x00000852
	adds r0, r2, #0
	bl MenuFrozenHelpBox
	movs r0, #8
_08023CF6:
	pop {r1}
	bx r1
	.align 2, 0
_08023CFC: .4byte 0x00000852

	THUMB_FUNC_END TalkCommandEffect

	THUMB_FUNC_START sub_8023D00
sub_8023D00: @ 0x08023D00
	ldr r2, _08023D10  @ gActionData
	movs r0, #0xe
	strb r0, [r2, #0x11]
	ldrb r0, [r1, #2]
	strb r0, [r2, #0xd]
	movs r0, #0x17
	bx lr
	.align 2, 0
_08023D10: .4byte gActionData

	THUMB_FUNC_END sub_8023D00

	THUMB_FUNC_START SupportCommandUsability
SupportCommandUsability: @ 0x08023D14
	push {r4, lr}
	ldr r4, _08023D44  @ gActiveUnit
	ldr r2, [r4]
	ldr r0, [r2, #0xc]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	bne _08023D40
	adds r0, r2, #0
	bl MakeTargetListForSupport
	bl sub_804FD28
	cmp r0, #0
	beq _08023D40
	ldr r0, [r4]
	bl sub_8025610
	bl sub_804FD28
	cmp r0, #0
	beq _08023D48
_08023D40:
	movs r0, #3
	b _08023D5C
	.align 2, 0
_08023D44: .4byte gActiveUnit
_08023D48:
	ldr r0, [r4]
	adds r0, #0x30
	ldrb r1, [r0]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #3
	beq _08023D5A
	movs r0, #1
	b _08023D5C
_08023D5A:
	movs r0, #2
_08023D5C:
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END SupportCommandUsability

	THUMB_FUNC_START SupportCommandEffect
SupportCommandEffect: @ 0x08023D64
	push {lr}
	adds r2, r0, #0
	adds r1, #0x3d
	ldrb r0, [r1]
	cmp r0, #2
	beq _08023D8C
	ldr r0, _08023D84  @ gActiveUnit
	ldr r0, [r0]
	bl MakeTargetListForSupport
	ldr r0, _08023D88  @ gUnknown_0859D378
	bl NewTargetSelection
	movs r0, #7
	b _08023D96
	.align 2, 0
_08023D84: .4byte gActiveUnit
_08023D88: .4byte gUnknown_0859D378
_08023D8C:
	ldr r1, _08023D9C  @ 0x00000852
	adds r0, r2, #0
	bl MenuFrozenHelpBox
	movs r0, #8
_08023D96:
	pop {r1}
	bx r1
	.align 2, 0
_08023D9C: .4byte 0x00000852

	THUMB_FUNC_END SupportCommandEffect

	THUMB_FUNC_START sub_8023DA0
sub_8023DA0: @ 0x08023DA0
	ldr r2, _08023DB0  @ gActionData
	movs r0, #0xf
	strb r0, [r2, #0x11]
	ldrb r0, [r1, #2]
	strb r0, [r2, #0xd]
	movs r0, #0x17
	bx lr
	.align 2, 0
_08023DB0: .4byte gActionData

	THUMB_FUNC_END sub_8023DA0

	THUMB_FUNC_START DoorCommandUsability
DoorCommandUsability: @ 0x08023DB4
	push {r4, lr}
	ldr r4, _08023DD4  @ gActiveUnit
	ldr r2, [r4]
	ldr r0, [r2, #0xc]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	bne _08023DD0
	adds r0, r2, #0
	movs r1, #0x1e
	bl GetUnitKeyItemSlotForTerrain
	cmp r0, #0
	bge _08023DD8
_08023DD0:
	movs r0, #3
	b _08023DEE
	.align 2, 0
_08023DD4: .4byte gActiveUnit
_08023DD8:
	ldr r0, [r4]
	movs r1, #0x1e
	bl MakeTargetListForDoorAndBridges
	bl sub_804FD28
	movs r1, #3
	cmp r0, #0
	beq _08023DEC
	movs r1, #1
_08023DEC:
	adds r0, r1, #0
_08023DEE:
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END DoorCommandUsability

	THUMB_FUNC_START DoorCommandEffect
DoorCommandEffect: @ 0x08023DF4
	push {r4, lr}
	ldr r4, _08023E14  @ gActionData
	movs r0, #0x12
	strb r0, [r4, #0x11]
	ldr r0, _08023E18  @ gActiveUnit
	ldr r0, [r0]
	ldrb r1, [r0, #0xb]
	strb r1, [r4, #0xc]
	movs r1, #0x1e
	bl GetUnitKeyItemSlotForTerrain
	strb r0, [r4, #0x12]
	movs r0, #0x17
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08023E14: .4byte gActionData
_08023E18: .4byte gActiveUnit

	THUMB_FUNC_END DoorCommandEffect

	THUMB_FUNC_START ChestCommandUsability
ChestCommandUsability: @ 0x08023E1C
	push {r4, lr}
	ldr r4, _08023E3C  @ gActiveUnit
	ldr r2, [r4]
	ldr r0, [r2, #0xc]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	bne _08023E38
	adds r0, r2, #0
	movs r1, #0x21
	bl GetUnitKeyItemSlotForTerrain
	cmp r0, #0
	bge _08023E40
_08023E38:
	movs r0, #3
	b _08023E52
	.align 2, 0
_08023E3C: .4byte gActiveUnit
_08023E40:
	ldr r0, [r4]
	bl CanUnitUseChestKeyItem
	lsls r0, r0, #0x18
	movs r1, #3
	cmp r0, #0
	beq _08023E50
	movs r1, #1
_08023E50:
	adds r0, r1, #0
_08023E52:
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END ChestCommandUsability

	THUMB_FUNC_START ChestCommandEffect
ChestCommandEffect: @ 0x08023E58
	push {r4, lr}
	ldr r4, _08023E74  @ gActionData
	movs r0, #0x14
	strb r0, [r4, #0x11]
	ldr r0, _08023E78  @ gActiveUnit
	ldr r0, [r0]
	movs r1, #0x21
	bl GetUnitKeyItemSlotForTerrain
	strb r0, [r4, #0x12]
	movs r0, #0x17
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08023E74: .4byte gActionData
_08023E78: .4byte gActiveUnit

	THUMB_FUNC_END ChestCommandEffect

	THUMB_FUNC_START PickCommandUsability
PickCommandUsability: @ 0x08023E7C
	push {lr}
	ldr r0, _08023E98  @ gActiveUnit
	ldr r2, [r0]
	ldr r0, [r2, #0xc]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	bne _08023E94
	ldr r0, [r2, #4]
	ldrb r0, [r0, #4]
	cmp r0, #0x33
	beq _08023E9C
_08023E94:
	movs r0, #3
	b _08023EB0
	.align 2, 0
_08023E98: .4byte gActiveUnit
_08023E9C:
	adds r0, r2, #0
	bl sub_80258A4
	bl sub_804FD28
	movs r1, #3
	cmp r0, #0
	beq _08023EAE
	movs r1, #1
_08023EAE:
	adds r0, r1, #0
_08023EB0:
	pop {r1}
	bx r1

	THUMB_FUNC_END PickCommandUsability

	THUMB_FUNC_START PickCommandEffect
PickCommandEffect: @ 0x08023EB4
	push {lr}
	ldr r0, _08023ED0  @ gActionData
	ldrb r0, [r0, #0xc]
	bl GetUnit
	bl sub_80258A4
	ldr r0, _08023ED4  @ gUnknown_0859D358
	bl NewTargetSelection
	movs r0, #0x17
	pop {r1}
	bx r1
	.align 2, 0
_08023ED0: .4byte gActionData
_08023ED4: .4byte gUnknown_0859D358

	THUMB_FUNC_END PickCommandEffect

	THUMB_FUNC_START sub_8023ED8
sub_8023ED8: @ 0x08023ED8
	ldr r2, _08023EEC  @ gActionData
	ldrb r0, [r1]
	strb r0, [r2, #0x13]
	ldrb r0, [r1, #1]
	strb r0, [r2, #0x14]
	movs r0, #0x15
	strb r0, [r2, #0x11]
	movs r0, #0x17
	bx lr
	.align 2, 0
_08023EEC: .4byte gActionData

	THUMB_FUNC_END sub_8023ED8

	THUMB_FUNC_START sub_8023EF0
sub_8023EF0: @ 0x08023EF0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	ldr r0, _08023F44  @ gActiveUnit
	ldr r0, [r0]
	movs r7, #0x10
	ldrsb r7, [r0, r7]
	movs r6, #0x11
	ldrsb r6, [r0, r6]
	movs r5, #0
	ldr r4, _08023F48  @ gUnknown_080D7C04
_08023F0C:
	movs r2, #0
	ldrsb r2, [r4, r2]
	adds r2, r7, r2
	movs r0, #1
	ldrsb r0, [r4, r0]
	adds r0, r6, r0
	ldr r1, _08023F4C  @ gBmMapUnit
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, r0, r2
	ldrb r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _08023F50
	adds r0, r1, #0
	bl GetUnit
	cmp r0, #0
	beq _08023F50
	ldr r0, [r0]
	ldrb r0, [r0, #4]
	cmp r0, r8
	bne _08023F50
	movs r0, #1
	b _08023F5A
	.align 2, 0
_08023F44: .4byte gActiveUnit
_08023F48: .4byte gUnknown_080D7C04
_08023F4C: .4byte gBmMapUnit
_08023F50:
	adds r4, #2
	adds r5, #1
	cmp r5, #3
	ble _08023F0C
	movs r0, #0
_08023F5A:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8023EF0

	THUMB_FUNC_START SupplyUsability
SupplyUsability: @ 0x08023F64
	push {lr}
	bl HasConvoyAccess
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08023FAC
	ldr r1, _08023F8C  @ gActiveUnit
	ldr r0, [r1]
	ldr r0, [r0, #4]
	ldrb r0, [r0, #4]
	cmp r0, #0x51
	beq _08023FAC
	ldr r0, _08023F90  @ gRAMChapterData
	ldrb r0, [r0, #0x1b]
	cmp r0, #2
	beq _08023F88
	cmp r0, #3
	beq _08023F94
_08023F88:
	movs r2, #1
	b _08023F96
	.align 2, 0
_08023F8C: .4byte gActiveUnit
_08023F90: .4byte gRAMChapterData
_08023F94:
	movs r2, #0xf
_08023F96:
	ldr r0, [r1]
	ldr r0, [r0]
	ldrb r0, [r0, #4]
	cmp r0, r2
	beq _08023FB0
	adds r0, r2, #0
	bl sub_8023EF0
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08023FB0
_08023FAC:
	movs r0, #3
	b _08023FB2
_08023FB0:
	movs r0, #1
_08023FB2:
	pop {r1}
	bx r1

	THUMB_FUNC_END SupplyUsability

	THUMB_FUNC_START SupplyCommandEffect
SupplyCommandEffect: @ 0x08023FB8
	push {lr}
	ldr r1, _08023FD0  @ gActionData
	movs r0, #0x1d
	strb r0, [r1, #0x11]
	ldr r0, _08023FD4  @ gActiveUnit
	ldr r0, [r0]
	movs r1, #0
	bl sub_809EB38
	movs r0, #0x17
	pop {r1}
	bx r1
	.align 2, 0
_08023FD0: .4byte gActionData
_08023FD4: .4byte gActiveUnit

	THUMB_FUNC_END SupplyCommandEffect

	THUMB_FUNC_START ArmoryCommandUsability
ArmoryCommandUsability: @ 0x08023FD8
	push {lr}
	ldr r0, _08023FF4  @ gActiveUnit
	ldr r2, [r0]
	ldr r0, [r2, #4]
	ldrb r0, [r0, #4]
	cmp r0, #0x51
	beq _08023FF0
	ldr r0, [r2, #0xc]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08023FF8
_08023FF0:
	movs r0, #3
	b _0802400E
	.align 2, 0
_08023FF4: .4byte gActiveUnit
_08023FF8:
	movs r0, #0x10
	ldrsb r0, [r2, r0]
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	bl GetAvailableLocaCommandAt
	movs r1, #3
	cmp r0, #0x16
	bne _0802400C
	movs r1, #1
_0802400C:
	adds r0, r1, #0
_0802400E:
	pop {r1}
	bx r1

	THUMB_FUNC_END ArmoryCommandUsability

	THUMB_FUNC_START ArmoryCommandEffect
ArmoryCommandEffect: @ 0x08024014
	push {lr}
	ldr r0, _08024030  @ gActiveUnit
	ldr r1, [r0]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	ldrb r1, [r1, #0x11]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl sub_80840C4
	movs r0, #0x17
	pop {r1}
	bx r1
	.align 2, 0
_08024030: .4byte gActiveUnit

	THUMB_FUNC_END ArmoryCommandEffect

	THUMB_FUNC_START VendorCommandUsability
VendorCommandUsability: @ 0x08024034
	push {lr}
	ldr r0, _08024050  @ gActiveUnit
	ldr r2, [r0]
	ldr r0, [r2, #4]
	ldrb r0, [r0, #4]
	cmp r0, #0x51
	beq _0802404C
	ldr r0, [r2, #0xc]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08024054
_0802404C:
	movs r0, #3
	b _0802406A
	.align 2, 0
_08024050: .4byte gActiveUnit
_08024054:
	movs r0, #0x10
	ldrsb r0, [r2, r0]
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	bl GetAvailableLocaCommandAt
	movs r1, #3
	cmp r0, #0x17
	bne _08024068
	movs r1, #1
_08024068:
	adds r0, r1, #0
_0802406A:
	pop {r1}
	bx r1

	THUMB_FUNC_END VendorCommandUsability

	THUMB_FUNC_START VendorCommandEffect
VendorCommandEffect: @ 0x08024070
	push {lr}
	ldr r0, _0802408C  @ gActiveUnit
	ldr r1, [r0]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	ldrb r1, [r1, #0x11]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl sub_80840C4
	movs r0, #0x17
	pop {r1}
	bx r1
	.align 2, 0
_0802408C: .4byte gActiveUnit

	THUMB_FUNC_END VendorCommandEffect

	THUMB_FUNC_START SecretShopCommandUsability
SecretShopCommandUsability: @ 0x08024090
	push {lr}
	ldr r0, _080240AC  @ gActiveUnit
	ldr r2, [r0]
	ldr r0, [r2, #4]
	ldrb r0, [r0, #4]
	cmp r0, #0x51
	beq _080240A8
	ldr r0, [r2, #0xc]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	beq _080240B0
_080240A8:
	movs r0, #3
	b _080240C6
	.align 2, 0
_080240AC: .4byte gActiveUnit
_080240B0:
	movs r0, #0x10
	ldrsb r0, [r2, r0]
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	bl GetAvailableLocaCommandAt
	movs r1, #3
	cmp r0, #0x18
	bne _080240C4
	movs r1, #1
_080240C4:
	adds r0, r1, #0
_080240C6:
	pop {r1}
	bx r1

	THUMB_FUNC_END SecretShopCommandUsability

	THUMB_FUNC_START SecretShopCommandEffect
SecretShopCommandEffect: @ 0x080240CC
	push {lr}
	ldr r0, _080240E8  @ gActiveUnit
	ldr r1, [r0]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	ldrb r1, [r1, #0x11]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl sub_80840C4
	movs r0, #0x17
	pop {r1}
	bx r1
	.align 2, 0
_080240E8: .4byte gActiveUnit

	THUMB_FUNC_END SecretShopCommandEffect

	THUMB_FUNC_START ArenaCommandUsability
ArenaCommandUsability: @ 0x080240EC
	push {lr}
	ldr r0, _08024124  @ gActiveUnit
	ldr r2, [r0]
	ldr r0, [r2, #4]
	ldrb r0, [r0, #4]
	cmp r0, #0x51
	beq _0802411E
	ldr r0, [r2, #0xc]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	bne _0802411E
	movs r0, #0x11
	ldrsb r0, [r2, r0]
	ldr r1, _08024128  @ gBmMapTerrain
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #8
	beq _0802412C
_0802411E:
	movs r0, #3
	b _0802413E
	.align 2, 0
_08024124: .4byte gActiveUnit
_08024128: .4byte gBmMapTerrain
_0802412C:
	adds r0, r2, #0
	bl sub_8031F50
	lsls r0, r0, #0x18
	movs r1, #2
	cmp r0, #0
	beq _0802413C
	movs r1, #1
_0802413C:
	adds r0, r1, #0
_0802413E:
	pop {r1}
	bx r1

	THUMB_FUNC_END ArenaCommandUsability

	THUMB_FUNC_START ArenaCommandEffect
ArenaCommandEffect: @ 0x08024144
	push {r4, lr}
	adds r4, r0, #0
	adds r1, #0x3d
	ldrb r0, [r1]
	cmp r0, #2
	bne _08024180
	ldr r0, _08024168  @ gActiveUnit
	ldr r0, [r0]
	bl IsUnitMagicSealed
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08024170
	ldr r1, _0802416C  @ 0x00000853
	adds r0, r4, #0
	bl MenuFrozenHelpBox
	b _08024178
	.align 2, 0
_08024168: .4byte gActiveUnit
_0802416C: .4byte 0x00000853
_08024170:
	ldr r1, _0802417C  @ 0x00000854
	adds r0, r4, #0
	bl MenuFrozenHelpBox
_08024178:
	movs r0, #8
	b _08024186
	.align 2, 0
_0802417C: .4byte 0x00000854
_08024180:
	bl sub_80B576C
	movs r0, #0x17
_08024186:
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END ArenaCommandEffect

	THUMB_FUNC_START StealCommandUsability
StealCommandUsability: @ 0x0802418C
	push {r4, lr}
	ldr r4, _080241C0  @ gActiveUnit
	ldr r2, [r4]
	ldr r0, [r2]
	ldr r1, [r2, #4]
	ldr r0, [r0, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	beq _080241BC
	ldr r0, [r2, #0xc]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	bne _080241BC
	adds r0, r2, #0
	bl MakeTargetListForSteal
	bl sub_804FD28
	cmp r0, #0
	bne _080241C4
_080241BC:
	movs r0, #3
	b _080241D4
	.align 2, 0
_080241C0: .4byte gActiveUnit
_080241C4:
	ldr r0, [r4]
	bl GetUnitItemCount
	cmp r0, #5
	beq _080241D2
	movs r0, #1
	b _080241D4
_080241D2:
	movs r0, #2
_080241D4:
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END StealCommandUsability

	THUMB_FUNC_START StealCommandEffect
StealCommandEffect: @ 0x080241DC
	push {lr}
	adds r2, r0, #0
	adds r1, #0x3d
	ldrb r0, [r1]
	cmp r0, #2
	beq _08024208
	bl ClearBg0Bg1
	ldr r0, _08024200  @ gActiveUnit
	ldr r0, [r0]
	bl MakeTargetListForSteal
	ldr r0, _08024204  @ gUnknown_0859D318
	bl NewTargetSelection
	movs r0, #7
	b _08024212
	.align 2, 0
_08024200: .4byte gActiveUnit
_08024204: .4byte gUnknown_0859D318
_08024208:
	ldr r1, _08024218  @ 0x00000862
	adds r0, r2, #0
	bl MenuFrozenHelpBox
	movs r0, #8
_08024212:
	pop {r1}
	bx r1
	.align 2, 0
_08024218: .4byte 0x00000862

	THUMB_FUNC_END StealCommandEffect

	THUMB_FUNC_START StealTargetSelection_OnInit
StealTargetSelection_OnInit: @ 0x0802421C
	push {r4, lr}
	adds r4, r0, #0
	bl NewUnitInfoWindow_WithAllLines
	ldr r0, _08024238  @ 0x0000086D
	bl GetStringFromIndex
	adds r1, r0, #0
	adds r0, r4, #0
	bl NewBottomHelpText
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08024238: .4byte 0x0000086D

	THUMB_FUNC_END StealTargetSelection_OnInit

	THUMB_FUNC_START sub_802423C
sub_802423C: @ 0x0802423C
	push {r4, lr}
	adds r4, r1, #0
	movs r0, #0
	ldrsb r0, [r4, r0]
	movs r1, #1
	ldrsb r1, [r4, r1]
	bl ChangeActiveUnitFacing
	movs r0, #2
	ldrsb r0, [r4, r0]
	bl GetUnit
	bl sub_8034D48
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_802423C

	THUMB_FUNC_START sub_8024260
sub_8024260: @ 0x08024260
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r4, r0, #0
	ldr r6, _080242F0  @ gActionData
	ldrb r0, [r1, #2]
	strb r0, [r6, #0xd]
	bl ResetIconGraphics
	movs r0, #4
	bl LoadIconPalettes
	ldr r0, _080242F4  @ gStealItemMenuDef
	bl StartOrphanMenu
	adds r0, r4, #0
	bl EndTargetSelection
	ldr r0, _080242F8  @ gUnknown_0202352C
	ldr r1, _080242FC  @ gUnknown_085A0D4C
	movs r2, #0x80
	lsls r2, r2, #5
	bl CallARM_FillTileRect
	ldrb r0, [r6, #0xd]
	bl GetUnit
	ldr r0, [r0]
	ldrh r0, [r0]
	bl GetStringFromIndex
	bl GetStringTextWidth
	movs r4, #0x38
	subs r4, r4, r0
	lsrs r0, r4, #0x1f
	adds r4, r4, r0
	asrs r4, r4, #1
	ldrb r0, [r6, #0xd]
	bl GetUnit
	ldr r0, [r0]
	ldrh r0, [r0]
	bl GetStringFromIndex
	ldr r5, _08024300  @ gUnknown_02022D6E
	movs r1, #7
	str r1, [sp]
	str r0, [sp, #4]
	movs r0, #0
	adds r1, r5, #0
	movs r2, #0
	adds r3, r4, #0
	bl DrawTextInline
	adds r5, #0x80
	ldrb r0, [r6, #0xd]
	bl GetUnit
	bl GetUnitPortraitId
	adds r1, r0, #0
	movs r2, #0x80
	lsls r2, r2, #2
	adds r0, r5, #0
	movs r3, #5
	bl sub_8005CA4
	movs r0, #0
	add sp, #8
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_080242F0: .4byte gActionData
_080242F4: .4byte gStealItemMenuDef
_080242F8: .4byte gUnknown_0202352C
_080242FC: .4byte gUnknown_085A0D4C
_08024300: .4byte gUnknown_02022D6E

	THUMB_FUNC_END sub_8024260

	THUMB_FUNC_START StealItemMenuCommand_Usability
StealItemMenuCommand_Usability: @ 0x08024304
	push {r4, r5, lr}
	adds r4, r1, #0
	ldr r5, _08024320  @ gActionData
	ldrb r0, [r5, #0xd]
	bl GetUnit
	lsls r4, r4, #1
	adds r0, #0x1e
	adds r0, r0, r4
	ldrh r0, [r0]
	cmp r0, #0
	bne _08024324
	movs r0, #3
	b _08024340
	.align 2, 0
_08024320: .4byte gActionData
_08024324:
	ldrb r0, [r5, #0xd]
	bl GetUnit
	adds r0, #0x1e
	adds r0, r0, r4
	ldrh r0, [r0]
	bl IsItemStealable
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0802433E
	movs r0, #1
	b _08024340
_0802433E:
	movs r0, #2
_08024340:
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END StealItemMenuCommand_Usability

	THUMB_FUNC_START StealItemMenuCommand_Draw
StealItemMenuCommand_Draw: @ 0x08024348
	push {r4, r5, r6, lr}
	adds r5, r1, #0
	ldr r0, _08024394  @ gActionData
	ldrb r0, [r0, #0xd]
	bl GetUnit
	adds r1, r5, #0
	adds r1, #0x3c
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	lsls r1, r1, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r4, [r0]
	adds r0, r4, #0
	bl IsItemStealable
	adds r2, r0, #0
	adds r0, r5, #0
	adds r0, #0x34
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	movs r1, #0x2c
	ldrsh r3, [r5, r1]
	lsls r3, r3, #5
	movs r6, #0x2a
	ldrsh r1, [r5, r6]
	adds r3, r3, r1
	lsls r3, r3, #1
	ldr r1, _08024398  @ gBG0TilemapBuffer
	adds r3, r3, r1
	adds r1, r4, #0
	bl DrawItemMenuLine
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08024394: .4byte gActionData
_08024398: .4byte gBG0TilemapBuffer

	THUMB_FUNC_END StealItemMenuCommand_Draw

	THUMB_FUNC_START StealItemMenuCommand_Effect
StealItemMenuCommand_Effect: @ 0x0802439C
	push {lr}
	adds r3, r0, #0
	adds r2, r1, #0
	adds r0, r2, #0
	adds r0, #0x3d
	ldrb r0, [r0]
	cmp r0, #2
	beq _080243C4
	ldr r1, _080243C0  @ gActionData
	adds r0, r2, #0
	adds r0, #0x3c
	ldrb r0, [r0]
	strb r0, [r1, #0x12]
	movs r0, #6
	strb r0, [r1, #0x11]
	movs r0, #0x17
	b _080243CE
	.align 2, 0
_080243C0: .4byte gActionData
_080243C4:
	ldr r1, _080243D4  @ 0x00000855
	adds r0, r3, #0
	bl MenuFrozenHelpBox
	movs r0, #8
_080243CE:
	pop {r1}
	bx r1
	.align 2, 0
_080243D4: .4byte 0x00000855

	THUMB_FUNC_END StealItemMenuCommand_Effect

	THUMB_FUNC_START SummonCommandUsability
SummonCommandUsability: @ 0x080243D8
	push {r4, r5, lr}
	ldr r5, _08024424  @ gActiveUnit
	ldr r2, [r5]
	ldr r0, [r2]
	ldr r1, [r2, #4]
	ldr r0, [r0, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	movs r1, #0x80
	lsls r1, r1, #0x14
	ands r0, r1
	cmp r0, #0
	beq _0802445A
	ldr r0, [r2, #0xc]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	bne _0802445A
	adds r0, r2, #0
	bl sub_8025CA4
	bl sub_804FD28
	cmp r0, #0
	beq _0802445A
	ldr r4, _08024428  @ 0x0000FFFF
	movs r2, #0
	ldr r0, [r5]
	ldr r0, [r0]
	ldr r1, _0802442C  @ gUnknown_0895F5A4
	ldrb r0, [r0, #4]
	adds r3, r1, #0
	ldrb r1, [r3]
	cmp r0, r1
	bne _08024430
	movs r4, #0
	b _0802444E
	.align 2, 0
_08024424: .4byte gActiveUnit
_08024428: .4byte 0x0000FFFF
_0802442C: .4byte gUnknown_0895F5A4
_08024430:
	adds r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #2
	bhi _0802444E
	ldr r0, _08024460  @ gActiveUnit
	ldr r0, [r0]
	ldr r1, [r0]
	lsls r0, r2, #1
	adds r0, r0, r3
	ldrb r1, [r1, #4]
	ldrb r0, [r0]
	cmp r1, r0
	bne _08024430
	adds r4, r2, #0
_0802444E:
	lsls r0, r4, #0x10
	asrs r1, r0, #0x10
	movs r0, #1
	negs r0, r0
	cmp r1, r0
	bne _08024470
_0802445A:
	movs r0, #3
	b _080244B0
	.align 2, 0
_08024460: .4byte gActiveUnit
_08024464:
	ldr r0, _0802446C  @ 0xFFFEFFF3
	ands r1, r0
	str r1, [r2, #0xc]
	b _080244AE
	.align 2, 0
_0802446C: .4byte 0xFFFEFFF3
_08024470:
	movs r4, #1
	lsls r1, r1, #1
	ldr r0, _080244A0  @ gUnknown_0895F5A5
	adds r5, r1, r0
_08024478:
	adds r0, r4, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq _080244A8
	ldr r0, [r2]
	cmp r0, #0
	beq _080244A8
	ldrb r0, [r0, #4]
	ldrb r1, [r5]
	cmp r0, r1
	bne _080244A8
	ldr r1, [r2, #0xc]
	ldr r0, _080244A4  @ 0x0001000C
	ands r0, r1
	cmp r0, #0
	bne _08024464
	b _0802445A
	.align 2, 0
_080244A0: .4byte gUnknown_0895F5A5
_080244A4: .4byte 0x0001000C
_080244A8:
	adds r4, #1
	cmp r4, #0x3f
	ble _08024478
_080244AE:
	movs r0, #1
_080244B0:
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END SummonCommandUsability

	THUMB_FUNC_START SummonCommandEffect
SummonCommandEffect: @ 0x080244B8
	push {lr}
	ldr r0, _080244D0  @ gActiveUnit
	ldr r0, [r0]
	bl sub_8025CA4
	ldr r0, _080244D4  @ gUnknown_0859D338
	bl NewTargetSelection
	movs r0, #7
	pop {r1}
	bx r1
	.align 2, 0
_080244D0: .4byte gActiveUnit
_080244D4: .4byte gUnknown_0859D338

	THUMB_FUNC_END SummonCommandEffect

	THUMB_FUNC_START sub_80244D8
sub_80244D8: @ 0x080244D8
	push {r4, r5, lr}
	adds r5, r1, #0
	ldr r4, _080244F8  @ gActionData
	ldrb r0, [r4, #0xc]
	bl GetUnit
	movs r0, #7
	strb r0, [r4, #0x11]
	ldrb r0, [r5]
	strb r0, [r4, #0x13]
	ldrb r0, [r5, #1]
	strb r0, [r4, #0x14]
	movs r0, #0x17
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080244F8: .4byte gActionData

	THUMB_FUNC_END sub_80244D8

	THUMB_FUNC_START YobimaCommandUsability
YobimaCommandUsability: @ 0x080244FC
	push {r4, r5, lr}
	ldr r0, _08024518  @ gActiveUnit
	ldr r1, [r0]
	ldr r0, [r1, #4]
	ldrb r0, [r0, #4]
	cmp r0, #0x66
	bne _08024514
	ldr r0, [r1, #0xc]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0802451C
_08024514:
	movs r0, #3
	b _08024542
	.align 2, 0
_08024518: .4byte gActiveUnit
_0802451C:
	movs r5, #0
	movs r4, #0x81
_08024520:
	adds r0, r4, #0
	bl GetUnit
	cmp r0, #0
	beq _0802453A
	ldr r0, [r0]
	cmp r0, #0
	beq _0802453A
	cmp r5, #0x27
	bhi _08024514
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
_0802453A:
	adds r4, #1
	cmp r4, #0xbf
	ble _08024520
	movs r0, #1
_08024542:
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END YobimaCommandUsability

	THUMB_FUNC_START YobimaCommandEffect
YobimaCommandEffect: @ 0x08024548
	push {r4, lr}
	ldr r4, _08024560  @ gActionData
	ldrb r0, [r4, #0xc]
	bl GetUnit
	movs r0, #8
	strb r0, [r4, #0x11]
	movs r0, #0x17
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08024560: .4byte gActionData

	THUMB_FUNC_END YobimaCommandEffect

	THUMB_FUNC_START sub_8024564
sub_8024564: @ 0x08024564
	push {r4, r5, lr}
	adds r5, r1, #0
	ldr r4, _08024584  @ gActionData
	ldrb r0, [r4, #0xc]
	bl GetUnit
	movs r0, #8
	strb r0, [r4, #0x11]
	ldrb r0, [r5]
	strb r0, [r4, #0x13]
	ldrb r0, [r5, #1]
	strb r0, [r4, #0x14]
	movs r0, #0x17
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08024584: .4byte gActionData

	THUMB_FUNC_END sub_8024564

	THUMB_FUNC_START ConvoyMenu_HelpBox
ConvoyMenu_HelpBox: @ 0x08024588
	push {r4, lr}
	adds r4, r1, #0
	adds r4, #0x3c
	movs r0, #0
	ldrsb r0, [r4, r0]
	cmp r0, #4
	ble _080245B4
	movs r2, #0x2a
	ldrsh r0, [r1, r2]
	lsls r0, r0, #3
	movs r2, #0x2c
	ldrsh r1, [r1, r2]
	lsls r1, r1, #3
	ldr r2, _080245B0  @ gUnknown_0202BCB0
	ldrh r2, [r2, #0x2c]
	bl StartItemHelpBox
	movs r0, #0
	b _080245D4
	.align 2, 0
_080245B0: .4byte gUnknown_0202BCB0
_080245B4:
	movs r2, #0x2a
	ldrsh r0, [r1, r2]
	lsls r0, r0, #3
	movs r2, #0x2c
	ldrsh r1, [r1, r2]
	lsls r1, r1, #3
	ldr r2, _080245DC  @ gActiveUnit
	ldr r3, [r2]
	movs r2, #0
	ldrsb r2, [r4, r2]
	lsls r2, r2, #1
	adds r3, #0x1e
	adds r3, r3, r2
	ldrh r2, [r3]
	bl StartItemHelpBox
_080245D4:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080245DC: .4byte gActiveUnit

	THUMB_FUNC_END ConvoyMenu_HelpBox

	THUMB_FUNC_START ItemMenu_HelpBox
ItemMenu_HelpBox: @ 0x080245E0
	push {r4, lr}
	adds r4, r1, #0
	ldr r0, _08024614  @ gActionData
	ldrb r0, [r0, #0xd]
	bl GetUnit
	movs r1, #0x2a
	ldrsh r3, [r4, r1]
	lsls r3, r3, #3
	movs r2, #0x2c
	ldrsh r1, [r4, r2]
	lsls r1, r1, #3
	adds r4, #0x3c
	movs r2, #0
	ldrsb r2, [r4, r2]
	lsls r2, r2, #1
	adds r0, #0x1e
	adds r0, r0, r2
	ldrh r2, [r0]
	adds r0, r3, #0
	bl StartItemHelpBox
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08024614: .4byte gActionData

	THUMB_FUNC_END ItemMenu_HelpBox

	THUMB_FUNC_START BallistaRangeMenuHelpBox
BallistaRangeMenuHelpBox: @ 0x08024618
	push {r4, r5, lr}
	movs r0, #0x2a
	ldrsh r5, [r1, r0]
	lsls r5, r5, #3
	movs r0, #0x2c
	ldrsh r4, [r1, r0]
	lsls r4, r4, #3
	ldr r0, _08024648  @ gActiveUnit
	ldr r1, [r0]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	ldrb r1, [r1, #0x11]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl GetBallistaItemAt
	adds r2, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	bl StartItemHelpBox
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08024648: .4byte gActiveUnit

	THUMB_FUNC_END BallistaRangeMenuHelpBox

	THUMB_FUNC_START sub_802464C
sub_802464C: @ 0x0802464C
	push {lr}
	bl sub_8034F9C
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_802464C

	THUMB_FUNC_START sub_8024658
sub_8024658: @ 0x08024658
	push {r4, lr}
	adds r4, r1, #0
	movs r0, #0
	ldrsb r0, [r4, r0]
	movs r1, #1
	ldrsb r1, [r4, r1]
	bl ChangeActiveUnitFacing
	movs r0, #2
	ldrsb r0, [r4, r0]
	bl GetUnit
	bl sub_8034FB0
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8024658

	THUMB_FUNC_START RescueSelection_OnConstruction
RescueSelection_OnConstruction: @ 0x0802467C
	push {r4, lr}
	adds r4, r0, #0
	bl sub_80351CC
	ldr r0, _08024698  @ 0x00000868
	bl GetStringFromIndex
	adds r1, r0, #0
	adds r0, r4, #0
	bl NewBottomHelpText
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08024698: .4byte 0x00000868

	THUMB_FUNC_END RescueSelection_OnConstruction

	THUMB_FUNC_START RescueSelection_OnChange
RescueSelection_OnChange: @ 0x0802469C
	push {r4, lr}
	adds r4, r1, #0
	movs r0, #0
	ldrsb r0, [r4, r0]
	movs r1, #1
	ldrsb r1, [r4, r1]
	bl ChangeActiveUnitFacing
	movs r0, #2
	ldrsb r0, [r4, r0]
	bl GetUnit
	bl SetupUnitRescueWindow
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END RescueSelection_OnChange

	THUMB_FUNC_START DropSelection_OnConstruction
DropSelection_OnConstruction: @ 0x080246C0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080246D8  @ 0x00000869
	bl GetStringFromIndex
	adds r1, r0, #0
	adds r0, r4, #0
	bl NewBottomHelpText
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080246D8: .4byte 0x00000869

	THUMB_FUNC_END DropSelection_OnConstruction

	THUMB_FUNC_START sub_80246DC
sub_80246DC: @ 0x080246DC
	bx lr

	THUMB_FUNC_END sub_80246DC

	THUMB_FUNC_START sub_80246E0
sub_80246E0: @ 0x080246E0
	push {r4, lr}
	adds r4, r0, #0
	bl sub_8035380
	ldr r0, _080246FC  @ 0x0000086B
	bl GetStringFromIndex
	adds r1, r0, #0
	adds r0, r4, #0
	bl NewBottomHelpText
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080246FC: .4byte 0x0000086B

	THUMB_FUNC_END sub_80246E0

	THUMB_FUNC_START sub_8024700
sub_8024700: @ 0x08024700
	push {r4, lr}
	adds r4, r1, #0
	movs r0, #0
	ldrsb r0, [r4, r0]
	movs r1, #1
	ldrsb r1, [r4, r1]
	bl ChangeActiveUnitFacing
	movs r0, #2
	ldrsb r0, [r4, r0]
	bl GetUnit
	bl sub_80353B8
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8024700

	THUMB_FUNC_START sub_8024724
sub_8024724: @ 0x08024724
	push {r4, lr}
	adds r4, r0, #0
	bl sub_80351CC
	ldr r0, _08024740  @ 0x0000086A
	bl GetStringFromIndex
	adds r1, r0, #0
	adds r0, r4, #0
	bl NewBottomHelpText
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08024740: .4byte 0x0000086A

	THUMB_FUNC_END sub_8024724

	THUMB_FUNC_START sub_8024744
sub_8024744: @ 0x08024744
	push {r4, lr}
	adds r4, r1, #0
	movs r0, #0
	ldrsb r0, [r4, r0]
	movs r1, #1
	ldrsb r1, [r4, r1]
	bl ChangeActiveUnitFacing
	movs r0, #2
	ldrsb r0, [r4, r0]
	bl GetUnit
	bl sub_80352BC
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8024744

	THUMB_FUNC_START TradeTargetSelection_OnInit
TradeTargetSelection_OnInit: @ 0x08024768
	push {r4, lr}
	adds r4, r0, #0
	bl NewUnitInfoWindow_WithAllLines
	ldr r0, _08024784  @ 0x0000086C
	bl GetStringFromIndex
	adds r1, r0, #0
	adds r0, r4, #0
	bl NewBottomHelpText
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08024784: .4byte 0x0000086C

	THUMB_FUNC_END TradeTargetSelection_OnInit

	THUMB_FUNC_START sub_8024788
sub_8024788: @ 0x08024788
	push {r4, lr}
	adds r4, r1, #0
	movs r0, #0
	ldrsb r0, [r4, r0]
	movs r1, #1
	ldrsb r1, [r4, r1]
	bl ChangeActiveUnitFacing
	bl ResetIconGraphics
	movs r0, #2
	ldrsb r0, [r4, r0]
	bl GetUnit
	bl sub_8034C3C
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8024788

	THUMB_FUNC_START sub_80247B0
sub_80247B0: @ 0x080247B0
	push {r4, lr}
	adds r4, r0, #0
	bl sub_8034F9C
	ldr r0, _080247CC  @ 0x0000086F
	bl GetStringFromIndex
	adds r1, r0, #0
	adds r0, r4, #0
	bl NewBottomHelpText
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080247CC: .4byte 0x0000086F

	THUMB_FUNC_END sub_80247B0

	THUMB_FUNC_START sub_80247D0
sub_80247D0: @ 0x080247D0
	push {r4, lr}
	adds r4, r1, #0
	movs r0, #0
	ldrsb r0, [r4, r0]
	movs r1, #1
	ldrsb r1, [r4, r1]
	bl ChangeActiveUnitFacing
	movs r0, #2
	ldrsb r0, [r4, r0]
	bl GetUnit
	bl sub_8034FB0
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80247D0

	THUMB_FUNC_START sub_80247F4
sub_80247F4: @ 0x080247F4
	push {r4, lr}
	adds r4, r0, #0
	bl sub_8034F9C
	movs r0, #0x87
	lsls r0, r0, #4
	bl GetStringFromIndex
	adds r1, r0, #0
	adds r0, r4, #0
	bl NewBottomHelpText
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80247F4

	THUMB_FUNC_START sub_8024814
sub_8024814: @ 0x08024814
	push {r4, lr}
	adds r4, r1, #0
	movs r0, #0
	ldrsb r0, [r4, r0]
	movs r1, #1
	ldrsb r1, [r4, r1]
	bl ChangeActiveUnitFacing
	movs r0, #2
	ldrsb r0, [r4, r0]
	bl GetUnit
	bl sub_8034FB0
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8024814

	THUMB_FUNC_START sub_8024838
sub_8024838: @ 0x08024838
	push {lr}
	bl sub_8034F9C
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8024838

	THUMB_FUNC_START sub_8024844
sub_8024844: @ 0x08024844
	push {r4, lr}
	adds r4, r1, #0
	movs r0, #0
	ldrsb r0, [r4, r0]
	movs r1, #1
	ldrsb r1, [r4, r1]
	bl ChangeActiveUnitFacing
	movs r0, #2
	ldrsb r0, [r4, r0]
	bl GetUnit
	bl sub_8034FB0
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8024844

	THUMB_FUNC_START sub_8024868
sub_8024868: @ 0x08024868
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x88
	lsls r0, r0, #4
	bl GetStringFromIndex
	adds r1, r0, #0
	adds r0, r4, #0
	bl NewBottomHelpText
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8024868

	THUMB_FUNC_START nullsub_27
nullsub_27: @ 0x08024884
	bx lr

	THUMB_FUNC_END nullsub_27

	THUMB_FUNC_START sub_8024888
sub_8024888: @ 0x08024888
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x88
	lsls r0, r0, #4
	bl GetStringFromIndex
	adds r1, r0, #0
	adds r0, r4, #0
	bl NewBottomHelpText
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8024888

	THUMB_FUNC_START sub_80248A4
sub_80248A4: @ 0x080248A4
	bx lr

	THUMB_FUNC_END sub_80248A4

	THUMB_FUNC_START sub_80248A8
sub_80248A8: @ 0x080248A8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080248C0  @ 0x00000881
	bl GetStringFromIndex
	adds r1, r0, #0
	adds r0, r4, #0
	bl NewBottomHelpText
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080248C0: .4byte 0x00000881

	THUMB_FUNC_END sub_80248A8

	THUMB_FUNC_START RideCommandUsability
RideCommandUsability: @ 0x080248C4
	push {lr}
	ldr r0, _08024910  @ gActiveUnit
	ldr r2, [r0]
	ldr r0, [r2]
	ldr r1, [r2, #4]
	ldr r0, [r0, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08024918
	ldr r0, [r2, #0xc]
	movs r1, #0x83
	lsls r1, r1, #4
	ands r0, r1
	cmp r0, #0
	bne _08024918
	ldr r0, _08024914  @ gUnknown_0202BCB0
	adds r0, #0x3d
	ldrb r1, [r0]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	bne _08024918
	movs r0, #0x10
	ldrsb r0, [r2, r0]
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	bl GetTrapAt
	cmp r0, #0
	beq _08024918
	ldrb r0, [r0, #2]
	cmp r0, #1
	bne _08024918
	movs r0, #1
	b _0802491A
	.align 2, 0
_08024910: .4byte gActiveUnit
_08024914: .4byte gUnknown_0202BCB0
_08024918:
	movs r0, #3
_0802491A:
	pop {r1}
	bx r1

	THUMB_FUNC_END RideCommandUsability

	THUMB_FUNC_START RideCommandEffect
RideCommandEffect: @ 0x08024920
	push {r4, lr}
	ldr r1, _08024944  @ gActionData
	movs r0, #0x21
	strb r0, [r1, #0x11]
	ldr r4, _08024948  @ gActiveUnit
	ldr r0, [r4]
	bl RideBallista
	bl MU_EndAll
	ldr r0, [r4]
	bl MU_Create
	movs r0, #0x17
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08024944: .4byte gActionData
_08024948: .4byte gActiveUnit

	THUMB_FUNC_END RideCommandEffect

	THUMB_FUNC_START ExitCommandUsability
ExitCommandUsability: @ 0x0802494C
	push {lr}
	ldr r0, _08024970  @ gActiveUnit
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	movs r1, #0x80
	lsls r1, r1, #4
	ands r0, r1
	cmp r0, #0
	beq _08024978
	ldr r0, _08024974  @ gUnknown_0202BCB0
	adds r0, #0x3d
	ldrb r1, [r0]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	bne _08024978
	movs r0, #1
	b _0802497A
	.align 2, 0
_08024970: .4byte gActiveUnit
_08024974: .4byte gUnknown_0202BCB0
_08024978:
	movs r0, #3
_0802497A:
	pop {r1}
	bx r1

	THUMB_FUNC_END ExitCommandUsability

	THUMB_FUNC_START ExitCommandEffect
ExitCommandEffect: @ 0x08024980
	push {r4, lr}
	ldr r1, _080249A4  @ gActionData
	movs r0, #0x22
	strb r0, [r1, #0x11]
	ldr r4, _080249A8  @ gActiveUnit
	ldr r0, [r4]
	bl TryRemoveUnitFromBallista
	bl MU_EndAll
	ldr r0, [r4]
	bl MU_Create
	movs r0, #0x17
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080249A4: .4byte gActionData
_080249A8: .4byte gActiveUnit

	THUMB_FUNC_END ExitCommandEffect

	THUMB_FUNC_START AttackCommandUsability
AttackCommandUsability: @ 0x080249AC
	push {r4, r5, r6, lr}
	ldr r0, _080249C8  @ gActiveUnit
	ldr r1, [r0]
	ldr r2, [r1, #0xc]
	movs r0, #0x40
	ands r0, r2
	cmp r0, #0
	bne _08024A1C
	movs r0, #0x80
	lsls r0, r0, #4
	ands r2, r0
	cmp r2, #0
	beq _080249D0
	b _08024A1C
	.align 2, 0
_080249C8: .4byte gActiveUnit
_080249CC:
	movs r0, #1
	b _08024A1E
_080249D0:
	movs r6, #0
	ldrh r4, [r1, #0x1e]
	cmp r4, #0
	beq _08024A1C
_080249D8:
	adds r0, r4, #0
	bl GetItemAttributes
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	beq _08024A06
	ldr r5, _08024A24  @ gActiveUnit
	ldr r0, [r5]
	adds r1, r4, #0
	bl CanUnitUseWeaponNow
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08024A06
	ldr r0, [r5]
	adds r1, r4, #0
	bl MakeTargetListForWeapon
	bl sub_804FD28
	cmp r0, #0
	bne _080249CC
_08024A06:
	adds r6, #1
	cmp r6, #4
	bgt _08024A1C
	ldr r0, _08024A24  @ gActiveUnit
	ldr r0, [r0]
	lsls r1, r6, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r4, [r0]
	cmp r4, #0
	bne _080249D8
_08024A1C:
	movs r0, #3
_08024A1E:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08024A24: .4byte gActiveUnit

	THUMB_FUNC_END AttackCommandUsability

	THUMB_FUNC_START AttackBallistaCommandUsability
AttackBallistaCommandUsability: @ 0x08024A28
	push {r4, r5, lr}
	ldr r5, _08024A6C  @ gActiveUnit
	ldr r2, [r5]
	ldr r0, [r2, #0xc]
	movs r1, #0x80
	lsls r1, r1, #4
	ands r0, r1
	cmp r0, #0
	beq _08024A66
	movs r0, #0x10
	ldrsb r0, [r2, r0]
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	bl GetTrapAt
	adds r4, r0, #0
	bl IsBallista
	cmp r0, #0
	beq _08024A66
	ldr r0, [r5]
	ldrb r1, [r4, #3]
	movs r2, #0x80
	lsls r2, r2, #1
	adds r1, r1, r2
	bl MakeTargetListForWeapon
	bl sub_804FD28
	cmp r0, #0
	bne _08024A70
_08024A66:
	movs r0, #3
	b _08024A80
	.align 2, 0
_08024A6C: .4byte gActiveUnit
_08024A70:
	adds r0, r4, #0
	bl GetBallistaItemUses
	cmp r0, #0
	beq _08024A7E
	movs r0, #1
	b _08024A80
_08024A7E:
	movs r0, #2
_08024A80:
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END AttackBallistaCommandUsability

	THUMB_FUNC_START ItemMenu_Is1stCommandAvailable
ItemMenu_Is1stCommandAvailable: @ 0x08024A88
	push {lr}
	ldr r0, _08024AA0  @ gActiveUnit
	ldr r0, [r0]
	bl sub_8025B6C
	bl sub_804FD28
	cmp r0, #0
	beq _08024AA4
	movs r0, #1
	b _08024AA6
	.align 2, 0
_08024AA0: .4byte gActiveUnit
_08024AA4:
	movs r0, #3
_08024AA6:
	pop {r1}
	bx r1

	THUMB_FUNC_END ItemMenu_Is1stCommandAvailable

	THUMB_FUNC_START ItemMenu_Draw1stCommand
ItemMenu_Draw1stCommand: @ 0x08024AAC
	push {r4, r5, lr}
	adds r4, r1, #0
	adds r5, r4, #0
	adds r5, #0x34
	ldr r0, _08024AE8  @ gUnknown_0202BCB0
	ldrh r0, [r0, #0x2c]
	bl GetItemName
	adds r3, r0, #0
	adds r0, r5, #0
	movs r1, #0x10
	movs r2, #0
	bl Text_InsertString
	movs r0, #0x2c
	ldrsh r1, [r4, r0]
	lsls r1, r1, #5
	movs r2, #0x2a
	ldrsh r0, [r4, r2]
	adds r1, r1, r0
	lsls r1, r1, #1
	ldr r0, _08024AEC  @ gBG0TilemapBuffer
	adds r1, r1, r0
	adds r0, r5, #0
	bl Text_Draw
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08024AE8: .4byte gUnknown_0202BCB0
_08024AEC: .4byte gBG0TilemapBuffer

	THUMB_FUNC_END ItemMenu_Draw1stCommand

	THUMB_FUNC_START ItemMenu_Select1stCommand
ItemMenu_Select1stCommand: @ 0x08024AF0
	push {lr}
	adds r1, #0x3d
	ldrb r0, [r1]
	cmp r0, #2
	beq _08024B14
	ldr r0, _08024B0C  @ gActiveUnit
	ldr r0, [r0]
	bl sub_8025B6C
	ldr r0, _08024B10  @ gSelectInfo_Dance
	bl NewTargetSelection
	movs r0, #0x27
	b _08024B16
	.align 2, 0
_08024B0C: .4byte gActiveUnit
_08024B10: .4byte gSelectInfo_Dance
_08024B14:
	movs r0, #8
_08024B16:
	pop {r1}
	bx r1

	THUMB_FUNC_END ItemMenu_Select1stCommand

	THUMB_FUNC_START ItemMenu_AreOtherCommandsAvailable
ItemMenu_AreOtherCommandsAvailable: @ 0x08024B1C
	push {r4, r5, lr}
	ldr r5, _08024B48  @ gActiveUnit
	ldr r0, [r5]
	subs r1, #1
	lsls r1, r1, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r4, [r0]
	adds r0, r4, #0
	bl GetItemType
	cmp r0, #0xc
	bne _08024B4C
	ldr r0, [r5]
	adds r1, r4, #0
	bl CanUnitUseItem
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08024B4C
	movs r0, #1
	b _08024B4E
	.align 2, 0
_08024B48: .4byte gActiveUnit
_08024B4C:
	movs r0, #3
_08024B4E:
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END ItemMenu_AreOtherCommandsAvailable

	THUMB_FUNC_START ItemMenu_DrawOtherCommands
ItemMenu_DrawOtherCommands: @ 0x08024B54
	push {r4, lr}
	adds r2, r1, #0
	ldr r0, _08024B94  @ gActiveUnit
	ldr r1, [r0]
	adds r0, r2, #0
	adds r0, #0x3c
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, #1
	lsls r0, r0, #1
	adds r1, #0x1e
	adds r1, r1, r0
	ldrh r1, [r1]
	adds r0, r2, #0
	adds r0, #0x34
	movs r4, #0x2c
	ldrsh r3, [r2, r4]
	lsls r3, r3, #5
	movs r4, #0x2a
	ldrsh r2, [r2, r4]
	adds r3, r3, r2
	lsls r3, r3, #1
	ldr r2, _08024B98  @ gBG0TilemapBuffer
	adds r3, r3, r2
	movs r2, #1
	bl DrawItemMenuLine
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08024B94: .4byte gActiveUnit
_08024B98: .4byte gBG0TilemapBuffer

	THUMB_FUNC_END ItemMenu_DrawOtherCommands

	THUMB_FUNC_START ItemMenu_SelectOtherCommands
ItemMenu_SelectOtherCommands: @ 0x08024B9C
	push {r4, lr}
	ldr r4, _08024BC8  @ gActionData
	adds r1, #0x3c
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r4, #0x12]
	bl ClearBg0Bg1
	ldr r0, _08024BCC  @ gActiveUnit
	ldr r0, [r0]
	ldrb r2, [r4, #0x12]
	lsls r2, r2, #1
	adds r1, r0, #0
	adds r1, #0x1e
	adds r1, r1, r2
	ldrh r1, [r1]
	bl DoItemUse
	movs r0, #7
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08024BC8: .4byte gActionData
_08024BCC: .4byte gActiveUnit

	THUMB_FUNC_END ItemMenu_SelectOtherCommands

	THUMB_FUNC_START ItemMenu_SwitchIn
ItemMenu_SwitchIn: @ 0x08024BD0
	push {lr}
	adds r1, #0x3c
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bne _08024BE4
	movs r0, #5
	bl sub_801E748
	b _08024BEE
_08024BE4:
	movs r0, #0
	ldrsb r0, [r1, r0]
	subs r0, #1
	bl sub_801E748
_08024BEE:
	pop {r1}
	bx r1

	THUMB_FUNC_END ItemMenu_SwitchIn

	THUMB_FUNC_START ItemMenu_SwitchOut_DoNothing
ItemMenu_SwitchOut_DoNothing: @ 0x08024BF4
	bx lr

	THUMB_FUNC_END ItemMenu_SwitchOut_DoNothing

	THUMB_FUNC_START ItemMenuHelpBox
ItemMenuHelpBox: @ 0x08024BF8
	push {r4, lr}
	adds r3, r1, #0
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0
	ldrsb r0, [r2, r0]
	cmp r0, #0
	bne _08024C14
	ldr r0, _08024C10  @ gUnknown_0202BCB0
	ldrh r2, [r0, #0x2c]
	b _08024C26
	.align 2, 0
_08024C10: .4byte gUnknown_0202BCB0
_08024C14:
	ldr r0, _08024C3C  @ gActiveUnit
	ldr r1, [r0]
	movs r0, #0
	ldrsb r0, [r2, r0]
	subs r0, #1
	lsls r0, r0, #1
	adds r1, #0x1e
	adds r1, r1, r0
	ldrh r2, [r1]
_08024C26:
	movs r1, #0x2a
	ldrsh r0, [r3, r1]
	lsls r0, r0, #3
	movs r4, #0x2c
	ldrsh r1, [r3, r4]
	lsls r1, r1, #3
	bl StartItemHelpBox
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08024C3C: .4byte gActiveUnit

	THUMB_FUNC_END ItemMenuHelpBox

	THUMB_FUNC_START MapMenu_IsRecordsCommandAvailable
MapMenu_IsRecordsCommandAvailable: @ 0x08024C40
	push {lr}
	bl GetChapterThing
	cmp r0, #1
	bne _08024CAC
	ldr r0, _08024CB0  @ gRAMChapterData
	ldrb r0, [r0, #0xe]
	subs r0, #0x24
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #9
	bhi _08024CB4
	movs r0, #0x71
	bl CheckEventId
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08024CAC
	movs r0, #0x72
	bl CheckEventId
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08024CAC
	movs r0, #0x73
	bl CheckEventId
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08024CAC
	movs r0, #0x74
	bl CheckEventId
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08024CAC
	movs r0, #0x75
	bl CheckEventId
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08024CAC
	movs r0, #0x76
	bl CheckEventId
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08024CAC
	movs r0, #0x77
	bl CheckEventId
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08024CB4
_08024CAC:
	movs r0, #3
	b _08024CB6
	.align 2, 0
_08024CB0: .4byte gRAMChapterData
_08024CB4:
	movs r0, #1
_08024CB6:
	pop {r1}
	bx r1

	THUMB_FUNC_END MapMenu_IsRecordsCommandAvailable

	THUMB_FUNC_START MapMenu_RecordsCommand
MapMenu_RecordsCommand: @ 0x08024CBC
	push {lr}
	movs r0, #3
	bl sub_80381E0
	movs r0, #0x17
	pop {r1}
	bx r1

	THUMB_FUNC_END MapMenu_RecordsCommand

	THUMB_FUNC_START MapMenu_IsRetreatCommandAvailable
MapMenu_IsRetreatCommandAvailable: @ 0x08024CCC
	push {lr}
	bl GetChapterThing
	cmp r0, #0
	beq _08024CDA
	movs r0, #1
	b _08024CDC
_08024CDA:
	movs r0, #3
_08024CDC:
	pop {r1}
	bx r1

	THUMB_FUNC_END MapMenu_IsRetreatCommandAvailable

	THUMB_FUNC_START MapMenu_RetreatCommand
MapMenu_RetreatCommand: @ 0x08024CE0
	push {lr}
	bl CallRetreatPromptEvent
	movs r0, #0x17
	pop {r1}
	bx r1

	THUMB_FUNC_END MapMenu_RetreatCommand

.align 2, 0
