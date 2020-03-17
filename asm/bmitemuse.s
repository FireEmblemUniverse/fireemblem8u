	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	@ Item (gameplay) effects and stuff

	THUMB_FUNC_START sub_8029AE0
sub_8029AE0: @ 0x08029AE0
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r4, r1, #0
	adds r0, r4, #0
	adds r0, #0x3d
	ldrb r0, [r0]
	cmp r0, #2
	bne _08029B68
	movs r6, #0
	ldr r0, _08029B20  @ gActionData
	ldrb r0, [r0, #0xd]
	bl GetUnit
	adds r1, r4, #0
	adds r1, #0x3c
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	lsls r1, r1, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r5, [r0]
	adds r0, r5, #0
	bl GetItemAttributes
	movs r1, #0xc1
	lsls r1, r1, #3
	ands r1, r0
	cmp r1, #0
	beq _08029B28
	ldr r6, _08029B24  @ 0x00000863
	b _08029B58
	.align 2, 0
_08029B20: .4byte gActionData
_08029B24: .4byte 0x00000863
_08029B28:
	adds r0, r5, #0
	bl GetItemAttributes
	movs r1, #5
	ands r1, r0
	cmp r1, #0
	bne _08029B40
	ldr r6, _08029B3C  @ 0x00000857
	b _08029B58
	.align 2, 0
_08029B3C: .4byte 0x00000857
_08029B40:
	adds r0, r5, #0
	bl GetItemUses
	adds r4, r0, #0
	adds r0, r5, #0
	bl GetItemMaxUses
	cmp r4, r0
	bne _08029B54
	ldr r6, _08029B64  @ 0x00000856
_08029B54:
	cmp r6, #0
	beq _08029B60
_08029B58:
	adds r0, r7, #0
	adds r1, r6, #0
	bl MenuFrozenHelpBox
_08029B60:
	movs r0, #8
	b _08029B7C
	.align 2, 0
_08029B64: .4byte 0x00000856
_08029B68:
	ldr r1, _08029B84  @ gActionData
	adds r0, r4, #0
	adds r0, #0x3c
	ldrb r0, [r0]
	strb r0, [r1, #0x15]
	ldr r0, _08029B88  @ gActiveUnit
	ldr r0, [r0]
	bl EndItemEffectSelectionThing
	movs r0, #0x37
_08029B7C:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08029B84: .4byte gActionData
_08029B88: .4byte gActiveUnit

	THUMB_FUNC_END sub_8029AE0

	THUMB_FUNC_START PrepareTargetSelectionForHeal
PrepareTargetSelectionForHeal: @ 0x08029B8C
	push {r4, lr}
	bl _call_via_r1
	ldr r0, _08029BBC  @ gBmMapMovement
	ldr r0, [r0]
	movs r1, #1
	negs r1, r1
	bl BmMapFill
	ldr r0, _08029BC0  @ gUnknown_0859D298
	bl NewTargetSelection
	adds r4, r0, #0
	ldr r0, _08029BC4  @ 0x00000874
	bl GetStringFromIndex
	adds r1, r0, #0
	adds r0, r4, #0
	bl NewBottomHelpText
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08029BBC: .4byte gBmMapMovement
_08029BC0: .4byte gUnknown_0859D298
_08029BC4: .4byte 0x00000874

	THUMB_FUNC_END PrepareTargetSelectionForHeal

	THUMB_FUNC_START PrepareTargetSelectionForRestoreStaff
PrepareTargetSelectionForRestoreStaff: @ 0x08029BC8
	push {r4, lr}
	bl _call_via_r1
	ldr r0, _08029BF8  @ gBmMapMovement
	ldr r0, [r0]
	movs r1, #1
	negs r1, r1
	bl BmMapFill
	ldr r0, _08029BFC  @ gUnknown_0859D278
	bl NewTargetSelection
	adds r4, r0, #0
	ldr r0, _08029C00  @ 0x00000877
	bl GetStringFromIndex
	adds r1, r0, #0
	adds r0, r4, #0
	bl NewBottomHelpText
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08029BF8: .4byte gBmMapMovement
_08029BFC: .4byte gUnknown_0859D278
_08029C00: .4byte 0x00000877

	THUMB_FUNC_END PrepareTargetSelectionForRestoreStaff

	THUMB_FUNC_START sub_8029C04
sub_8029C04: @ 0x08029C04
	push {lr}
	bl sub_8034FFC
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8029C04

	THUMB_FUNC_START sub_8029C10
sub_8029C10: @ 0x08029C10
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
	bl sub_803501C
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8029C10

	THUMB_FUNC_START sub_8029C34
sub_8029C34: @ 0x08029C34
	push {r4, lr}
	bl MakeTargetListForBarrier
	ldr r0, _08029C64  @ gBmMapMovement
	ldr r0, [r0]
	movs r1, #1
	negs r1, r1
	bl BmMapFill
	ldr r0, _08029C68  @ gUnknown_0859D258
	bl NewTargetSelection
	adds r4, r0, #0
	ldr r0, _08029C6C  @ 0x00000879
	bl GetStringFromIndex
	adds r1, r0, #0
	adds r0, r4, #0
	bl NewBottomHelpText
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08029C64: .4byte gBmMapMovement
_08029C68: .4byte gUnknown_0859D258
_08029C6C: .4byte 0x00000879

	THUMB_FUNC_END sub_8029C34

	THUMB_FUNC_START sub_8029C70
sub_8029C70: @ 0x08029C70
	push {lr}
	bl sub_8035090
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8029C70

	THUMB_FUNC_START sub_8029C7C
sub_8029C7C: @ 0x08029C7C
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
	bl sub_80350A4
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8029C7C

	THUMB_FUNC_START PrepareTargetSelectionForOffensiveStaff
PrepareTargetSelectionForOffensiveStaff: @ 0x08029CA0
	push {r4, lr}
	bl _call_via_r1
	ldr r0, _08029CD0  @ gBmMapMovement
	ldr r0, [r0]
	movs r1, #1
	negs r1, r1
	bl BmMapFill
	ldr r0, _08029CD4  @ gUnknown_0859D238
	bl NewTargetSelection
	adds r4, r0, #0
	ldr r0, _08029CD8  @ 0x0000087B
	bl GetStringFromIndex
	adds r1, r0, #0
	adds r0, r4, #0
	bl NewBottomHelpText
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08029CD0: .4byte gBmMapMovement
_08029CD4: .4byte gUnknown_0859D238
_08029CD8: .4byte 0x0000087B

	THUMB_FUNC_END PrepareTargetSelectionForOffensiveStaff

	THUMB_FUNC_START sub_8029CDC
sub_8029CDC: @ 0x08029CDC
	push {lr}
	bl sub_80350FC
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8029CDC

	THUMB_FUNC_START sub_8029CE8
sub_8029CE8: @ 0x08029CE8
	push {r4, r5, r6, lr}
	adds r4, r1, #0
	movs r0, #0
	ldrsb r0, [r4, r0]
	movs r1, #1
	ldrsb r1, [r4, r1]
	bl ChangeActiveUnitFacing
	movs r0, #2
	ldrsb r0, [r4, r0]
	bl GetUnit
	adds r6, r0, #0
	ldr r0, _08029D24  @ gActiveUnit
	ldr r5, [r0]
	movs r0, #2
	ldrsb r0, [r4, r0]
	bl GetUnit
	adds r1, r0, #0
	adds r0, r5, #0
	bl GetOffensiveStaffAccuracy
	adds r1, r0, #0
	adds r0, r6, #0
	bl sub_803511C
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08029D24: .4byte gActiveUnit

	THUMB_FUNC_END sub_8029CE8

	THUMB_FUNC_START GenericSelection_DeleteBBAndBG
GenericSelection_DeleteBBAndBG: @ 0x08029D28
	push {lr}
	bl DeleteEach6CBB
	bl ClearBg0Bg1
	pop {r0}
	bx r0

	THUMB_FUNC_END GenericSelection_DeleteBBAndBG

	THUMB_FUNC_START sub_8029D38
sub_8029D38: @ 0x08029D38
	push {lr}
	adds r2, r0, #0
	ldr r0, [r2]
	ldr r1, [r2, #4]
	ldr r0, [r0, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	movs r1, #0x80
	lsls r1, r1, #0x12
	ands r0, r1
	cmp r0, #0
	beq _08029D64
	movs r0, #0x10
	ldrsb r0, [r2, r0]
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	bl GetTrapAt
	cmp r0, #0
	bne _08029D64
	movs r0, #1
	b _08029D66
_08029D64:
	movs r0, #0
_08029D66:
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8029D38

	THUMB_FUNC_START sub_8029D6C
sub_8029D6C: @ 0x08029D6C
	push {r4, lr}
	ldr r0, _08029D8C  @ gUnknown_0859D2F8
	ldr r1, _08029D90  @ GenericStaffSelection_OnSelect
	bl NewTargetSelection_Specialized
	adds r4, r0, #0
	ldr r0, _08029D94  @ 0x00000876
	bl GetStringFromIndex
	adds r1, r0, #0
	adds r0, r4, #0
	bl NewBottomHelpText
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08029D8C: .4byte gUnknown_0859D2F8
_08029D90: .4byte GenericStaffSelection_OnSelect
_08029D94: .4byte 0x00000876

	THUMB_FUNC_END sub_8029D6C

	THUMB_FUNC_START TorchTargetPosSelect_Init
TorchTargetPosSelect_Init: @ 0x08029D98
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r2, _08029DE4  @ gUnknown_0202BCB0
	ldrb r1, [r2, #4]
	movs r0, #1
	orrs r0, r1
	strb r0, [r2, #4]
	ldr r0, _08029DE8  @ 0x0000087C
	bl GetStringFromIndex
	adds r1, r0, #0
	adds r0, r5, #0
	bl NewBottomHelpText
	ldr r4, _08029DEC  @ gActiveUnit
	ldr r1, [r4]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	ldrb r1, [r1, #0x11]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl ShouldMoveCameraPosSomething
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08029DDC
	ldr r0, [r4]
	movs r1, #0x10
	ldrsb r1, [r0, r1]
	movs r2, #0x11
	ldrsb r2, [r0, r2]
	adds r0, r5, #0
	bl EnsureCameraOntoPosition
_08029DDC:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08029DE4: .4byte gUnknown_0202BCB0
_08029DE8: .4byte 0x0000087C
_08029DEC: .4byte gActiveUnit

	THUMB_FUNC_END TorchTargetPosSelect_Init

	THUMB_FUNC_START TorchTargetSelection_Loop
TorchTargetSelection_Loop: @ 0x08029DF0
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r5, _08029E50  @ gUnknown_0202BCB0
	movs r0, #0x14
	ldrsh r2, [r5, r0]
	movs r1, #0x16
	ldrsh r0, [r5, r1]
	ldr r1, _08029E54  @ gBmMapRange
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, r0, r2
	ldrb r4, [r0]
	bl HandlePlayerCursorMovement
	ldr r0, _08029E58  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08029E7A
	cmp r4, #0
	beq _08029E68
	ldr r0, _08029E5C  @ gUnknown_0202BCF0
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08029E34
	movs r0, #0x6a
	bl m4aSongNumStart
_08029E34:
	adds r0, r6, #0
	bl Proc_Break
	ldr r1, _08029E60  @ gActionData
	ldrh r0, [r5, #0x14]
	strb r0, [r1, #0x13]
	ldrh r0, [r5, #0x16]
	strb r0, [r1, #0x14]
	ldr r0, _08029E64  @ gActiveUnit
	ldr r0, [r0]
	bl EndItemEffectSelectionThing
	b _08029EC0
	.align 2, 0
_08029E50: .4byte gUnknown_0202BCB0
_08029E54: .4byte gBmMapRange
_08029E58: .4byte gKeyStatusPtr
_08029E5C: .4byte gUnknown_0202BCF0
_08029E60: .4byte gActionData
_08029E64: .4byte gActiveUnit
_08029E68:
	ldr r0, _08029EC8  @ gUnknown_0202BCF0
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08029E7A
	movs r0, #0x6c
	bl m4aSongNumStart
_08029E7A:
	ldr r0, _08029ECC  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08029EB0
	ldr r0, _08029ED0  @ gBG2TilemapBuffer
	movs r1, #0
	bl BG_Fill
	movs r0, #4
	bl BG_EnableSyncByMask
	adds r0, r6, #0
	movs r1, #0x63
	bl Proc_Goto
	ldr r0, _08029EC8  @ gUnknown_0202BCF0
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08029EB0
	movs r0, #0x6b
	bl m4aSongNumStart
_08029EB0:
	ldr r1, _08029ED4  @ gUnknown_0202BCB0
	movs r2, #0x20
	ldrsh r0, [r1, r2]
	movs r2, #0x22
	ldrsh r1, [r1, r2]
	movs r2, #1
	bl DisplayCursor
_08029EC0:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08029EC8: .4byte gUnknown_0202BCF0
_08029ECC: .4byte gKeyStatusPtr
_08029ED0: .4byte gBG2TilemapBuffer
_08029ED4: .4byte gUnknown_0202BCB0

	THUMB_FUNC_END TorchTargetSelection_Loop

	THUMB_FUNC_START NewTorchStaffSelection
NewTorchStaffSelection: @ 0x08029ED8
	push {lr}
	ldr r0, _08029EF8  @ gUnknown_0859BA38
	movs r1, #3
	bl Proc_Start
	ldr r0, _08029EFC  @ gUnknown_0202BCF0
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08029EF4
	movs r0, #0x6a
	bl m4aSongNumStart
_08029EF4:
	pop {r0}
	bx r0
	.align 2, 0
_08029EF8: .4byte gUnknown_0859BA38
_08029EFC: .4byte gUnknown_0202BCF0

	THUMB_FUNC_END NewTorchStaffSelection

	THUMB_FUNC_START CanUnitUseItemPrepScreen
CanUnitUseItemPrepScreen: @ 0x08029F00
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	adds r0, r4, #0
	bl GetItemAttributes
	movs r1, #4
	ands r1, r0
	cmp r1, #0
	beq _08029F16
	b _0802A100
_08029F16:
	adds r0, r4, #0
	bl GetItemIndex
	subs r0, #0x5b
	cmp r0, #0x66
	bls _08029F24
	b _0802A100
_08029F24:
	lsls r0, r0, #2
	ldr r1, _08029F30  @ _08029F34
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08029F30: .4byte _08029F34
_08029F34: @ jump table
	.4byte _0802A0D0 @ case 0
	.4byte _0802A0D0 @ case 1
	.4byte _0802A0D0 @ case 2
	.4byte _0802A0D0 @ case 3
	.4byte _0802A0D0 @ case 4
	.4byte _0802A0D0 @ case 5
	.4byte _0802A0D0 @ case 6
	.4byte _0802A0D0 @ case 7
	.4byte _0802A0D0 @ case 8
	.4byte _0802A0DA @ case 9
	.4byte _0802A0DA @ case 10
	.4byte _0802A0DA @ case 11
	.4byte _0802A0DA @ case 12
	.4byte _0802A0DA @ case 13
	.4byte _0802A100 @ case 14
	.4byte _0802A100 @ case 15
	.4byte _0802A100 @ case 16
	.4byte _0802A100 @ case 17
	.4byte _0802A100 @ case 18
	.4byte _0802A100 @ case 19
	.4byte _0802A100 @ case 20
	.4byte _0802A100 @ case 21
	.4byte _0802A100 @ case 22
	.4byte _0802A100 @ case 23
	.4byte _0802A100 @ case 24
	.4byte _0802A100 @ case 25
	.4byte _0802A100 @ case 26
	.4byte _0802A100 @ case 27
	.4byte _0802A100 @ case 28
	.4byte _0802A100 @ case 29
	.4byte _0802A100 @ case 30
	.4byte _0802A100 @ case 31
	.4byte _0802A100 @ case 32
	.4byte _0802A100 @ case 33
	.4byte _0802A100 @ case 34
	.4byte _0802A100 @ case 35
	.4byte _0802A100 @ case 36
	.4byte _0802A100 @ case 37
	.4byte _0802A100 @ case 38
	.4byte _0802A100 @ case 39
	.4byte _0802A100 @ case 40
	.4byte _0802A100 @ case 41
	.4byte _0802A100 @ case 42
	.4byte _0802A100 @ case 43
	.4byte _0802A100 @ case 44
	.4byte _0802A0DA @ case 45
	.4byte _0802A0E4 @ case 46
	.4byte _0802A0DA @ case 47
	.4byte _0802A100 @ case 48
	.4byte _0802A100 @ case 49
	.4byte _0802A100 @ case 50
	.4byte _0802A100 @ case 51
	.4byte _0802A100 @ case 52
	.4byte _0802A100 @ case 53
	.4byte _0802A100 @ case 54
	.4byte _0802A100 @ case 55
	.4byte _0802A100 @ case 56
	.4byte _0802A100 @ case 57
	.4byte _0802A100 @ case 58
	.4byte _0802A100 @ case 59
	.4byte _0802A0DA @ case 60
	.4byte _0802A0DA @ case 61
	.4byte _0802A0DA @ case 62
	.4byte _0802A100 @ case 63
	.4byte _0802A100 @ case 64
	.4byte _0802A100 @ case 65
	.4byte _0802A100 @ case 66
	.4byte _0802A100 @ case 67
	.4byte _0802A100 @ case 68
	.4byte _0802A100 @ case 69
	.4byte _0802A100 @ case 70
	.4byte _0802A100 @ case 71
	.4byte _0802A100 @ case 72
	.4byte _0802A100 @ case 73
	.4byte _0802A100 @ case 74
	.4byte _0802A100 @ case 75
	.4byte _0802A100 @ case 76
	.4byte _0802A100 @ case 77
	.4byte _0802A100 @ case 78
	.4byte _0802A100 @ case 79
	.4byte _0802A100 @ case 80
	.4byte _0802A100 @ case 81
	.4byte _0802A100 @ case 82
	.4byte _0802A100 @ case 83
	.4byte _0802A100 @ case 84
	.4byte _0802A100 @ case 85
	.4byte _0802A100 @ case 86
	.4byte _0802A100 @ case 87
	.4byte _0802A100 @ case 88
	.4byte _0802A100 @ case 89
	.4byte _0802A100 @ case 90
	.4byte _0802A100 @ case 91
	.4byte _0802A0F4 @ case 92
	.4byte _0802A100 @ case 93
	.4byte _0802A100 @ case 94
	.4byte _0802A100 @ case 95
	.4byte _0802A100 @ case 96
	.4byte _0802A100 @ case 97
	.4byte _0802A100 @ case 98
	.4byte _0802A100 @ case 99
	.4byte _0802A100 @ case 100
	.4byte _0802A100 @ case 101
	.4byte _0802A0DA @ case 102
_0802A0D0:
	adds r0, r5, #0
	adds r1, r4, #0
	bl CanUseStatBooster
	b _0802A0FA
_0802A0DA:
	adds r0, r5, #0
	adds r1, r4, #0
	bl CanUsePromotionItem
	b _0802A0FA
_0802A0E4:
	ldr r0, [r5, #0xc]
	movs r1, #0x80
	lsls r1, r1, #6
	ands r0, r1
	cmp r0, #0
	bne _0802A100
	movs r0, #1
	b _0802A102
_0802A0F4:
	adds r0, r5, #0
	bl CanUseJunaFruit
_0802A0FA:
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	b _0802A102
_0802A100:
	movs r0, #0
_0802A102:
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END CanUnitUseItemPrepScreen

	THUMB_FUNC_START sub_802A108
sub_802A108: @ 0x0802A108
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	bl GetUnitItemCount
	adds r5, r0, #0
	movs r4, #0
	cmp r4, r5
	bge _0802A134
_0802A118:
	lsls r1, r4, #1
	adds r0, r6, #0
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r0, [r0]
	bl GetItemIndex
	cmp r0, #0xcc
	bne _0802A12E
	movs r0, #1
	b _0802A136
_0802A12E:
	adds r4, #1
	cmp r4, r5
	blt _0802A118
_0802A134:
	movs r0, #0
_0802A136:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_802A108

.align 2, 0
