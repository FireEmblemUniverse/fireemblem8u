	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	@ Item info panel in item selection menus

	THUMB_FUNC_START sub_801E4F4
sub_801E4F4: @ 0x0801E4F4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	adds r0, #0x64
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801E506
	b _0801E672
_0801E506:
	adds r0, r4, #0
	adds r0, #0x33
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bge _0801E516
	b _0801E672
_0801E516:
	ldr r6, _0801E67C  @ gBattleActor
	movs r0, #0x5a
	adds r0, r0, r6
	mov r8, r0
	ldr r5, _0801E680  @ gBattleTarget
	adds r7, r5, #0
	adds r7, #0x5a
	movs r2, #0
	ldrsh r1, [r0, r2]
	movs r3, #0
	ldrsh r0, [r7, r3]
	cmp r1, r0
	ble _0801E54A
	adds r0, r4, #0
	adds r0, #0x30
	ldrb r0, [r0]
	lsls r0, r0, #3
	adds r0, #0x33
	adds r1, r4, #0
	adds r1, #0x31
	ldrb r1, [r1]
	adds r1, #3
	lsls r1, r1, #3
	movs r2, #0
	bl sub_8015BD4
_0801E54A:
	mov r0, r8
	movs r2, #0
	ldrsh r1, [r0, r2]
	movs r3, #0
	ldrsh r0, [r7, r3]
	cmp r1, r0
	bge _0801E572
	adds r0, r4, #0
	adds r0, #0x30
	ldrb r0, [r0]
	lsls r0, r0, #3
	adds r0, #0x33
	adds r1, r4, #0
	adds r1, #0x31
	ldrb r1, [r1]
	adds r1, #3
	lsls r1, r1, #3
	movs r2, #1
	bl sub_8015BD4
_0801E572:
	adds r7, r6, #0
	adds r7, #0x60
	movs r0, #0x60
	adds r0, r0, r5
	mov r8, r0
	movs r2, #0
	ldrsh r1, [r7, r2]
	movs r3, #0
	ldrsh r0, [r0, r3]
	cmp r1, r0
	ble _0801E5A2
	adds r0, r4, #0
	adds r0, #0x30
	ldrb r0, [r0]
	lsls r0, r0, #3
	adds r0, #0x33
	adds r1, r4, #0
	adds r1, #0x31
	ldrb r1, [r1]
	adds r1, #5
	lsls r1, r1, #3
	movs r2, #0
	bl sub_8015BD4
_0801E5A2:
	movs r0, #0
	ldrsh r1, [r7, r0]
	mov r2, r8
	movs r3, #0
	ldrsh r0, [r2, r3]
	cmp r1, r0
	bge _0801E5CA
	adds r0, r4, #0
	adds r0, #0x30
	ldrb r0, [r0]
	lsls r0, r0, #3
	adds r0, #0x33
	adds r1, r4, #0
	adds r1, #0x31
	ldrb r1, [r1]
	adds r1, #5
	lsls r1, r1, #3
	movs r2, #1
	bl sub_8015BD4
_0801E5CA:
	adds r7, r6, #0
	adds r7, #0x66
	movs r0, #0x66
	adds r0, r0, r5
	mov r8, r0
	movs r2, #0
	ldrsh r1, [r7, r2]
	movs r3, #0
	ldrsh r0, [r0, r3]
	cmp r1, r0
	ble _0801E5FA
	adds r0, r4, #0
	adds r0, #0x30
	ldrb r0, [r0]
	lsls r0, r0, #3
	adds r0, #0x63
	adds r1, r4, #0
	adds r1, #0x31
	ldrb r1, [r1]
	adds r1, #3
	lsls r1, r1, #3
	movs r2, #0
	bl sub_8015BD4
_0801E5FA:
	movs r0, #0
	ldrsh r1, [r7, r0]
	mov r2, r8
	movs r3, #0
	ldrsh r0, [r2, r3]
	cmp r1, r0
	bge _0801E622
	adds r0, r4, #0
	adds r0, #0x30
	ldrb r0, [r0]
	lsls r0, r0, #3
	adds r0, #0x63
	adds r1, r4, #0
	adds r1, #0x31
	ldrb r1, [r1]
	adds r1, #3
	lsls r1, r1, #3
	movs r2, #1
	bl sub_8015BD4
_0801E622:
	adds r6, #0x62
	adds r5, #0x62
	movs r0, #0
	ldrsh r1, [r6, r0]
	movs r2, #0
	ldrsh r0, [r5, r2]
	cmp r1, r0
	ble _0801E64C
	adds r0, r4, #0
	adds r0, #0x30
	ldrb r0, [r0]
	lsls r0, r0, #3
	adds r0, #0x63
	adds r1, r4, #0
	adds r1, #0x31
	ldrb r1, [r1]
	adds r1, #5
	lsls r1, r1, #3
	movs r2, #0
	bl sub_8015BD4
_0801E64C:
	movs r3, #0
	ldrsh r1, [r6, r3]
	movs r2, #0
	ldrsh r0, [r5, r2]
	cmp r1, r0
	bge _0801E672
	adds r0, r4, #0
	adds r0, #0x30
	ldrb r0, [r0]
	lsls r0, r0, #3
	adds r0, #0x63
	adds r1, r4, #0
	adds r1, #0x31
	ldrb r1, [r1]
	adds r1, #5
	lsls r1, r1, #3
	movs r2, #1
	bl sub_8015BD4
_0801E672:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801E67C: .4byte gBattleActor
_0801E680: .4byte gBattleTarget

	THUMB_FUNC_END sub_801E4F4

	THUMB_FUNC_START sub_801E684
sub_801E684: @ 0x0801E684
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	adds r6, r1, #0
	adds r7, r2, #0
	mov r8, r3
	ldr r4, _0801E73C  @ gUnknown_0859AE88
	adds r0, r4, #0
	bl Proc_Find
	cmp r0, #0
	bne _0801E732
	adds r0, r4, #0
	adds r1, r5, #0
	bl Proc_Start
	adds r4, r0, #0
	str r6, [r4, #0x2c]
	adds r0, #0x30
	strb r7, [r0]
	adds r0, #1
	mov r1, r8
	strb r1, [r0]
	adds r5, r4, #0
	adds r5, #0x32
	movs r0, #3
	strb r0, [r5]
	adds r0, r6, #0
	bl GetUnitEquippedWeaponSlot
	adds r1, r4, #0
	adds r1, #0x33
	strb r0, [r1]
	adds r1, #0x31
	movs r0, #1
	strb r0, [r1]
	adds r0, r4, #0
	adds r0, #0x34
	movs r1, #0xc
	bl Text_Allocate
	adds r0, r4, #0
	adds r0, #0x3c
	movs r1, #0xc
	bl Text_Allocate
	adds r0, r4, #0
	adds r0, #0x44
	movs r1, #0xc
	bl Text_Allocate
	ldrb r1, [r5]
	movs r0, #1
	bl LoadIconPalette
	ldr r0, [r4, #0x2c]
	movs r1, #1
	negs r1, r1
	bl BattleGenerateUiStats
	ldr r3, _0801E740  @ gBattleTarget
	ldr r2, _0801E744  @ gBattleActor
	adds r0, r2, #0
	adds r0, #0x5a
	ldrh r0, [r0]
	adds r1, r3, #0
	adds r1, #0x5a
	strh r0, [r1]
	adds r0, r2, #0
	adds r0, #0x60
	ldrh r1, [r0]
	adds r0, r3, #0
	adds r0, #0x60
	strh r1, [r0]
	adds r0, r2, #0
	adds r0, #0x66
	ldrh r0, [r0]
	adds r1, r3, #0
	adds r1, #0x66
	strh r0, [r1]
	adds r0, r2, #0
	adds r0, #0x62
	ldrh r1, [r0]
	adds r0, r3, #0
	adds r0, #0x62
	strh r1, [r0]
_0801E732:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801E73C: .4byte gUnknown_0859AE88
_0801E740: .4byte gBattleTarget
_0801E744: .4byte gBattleActor

	THUMB_FUNC_END sub_801E684

	THUMB_FUNC_START sub_801E748
sub_801E748: @ 0x0801E748
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	adds r5, r0, #0
	ldr r0, _0801E7C4  @ gUnknown_0859AE88
	bl Proc_Find
	adds r7, r0, #0
	movs r0, #0
	bl BG_GetMapBuffer
	adds r4, r7, #0
	adds r4, #0x30
	ldrb r1, [r4]
	lsls r1, r1, #1
	adds r0, r0, r1
	movs r1, #0x31
	adds r1, r1, r7
	mov r8, r1
	ldrb r1, [r1]
	lsls r1, r1, #6
	adds r0, r0, r1
	str r0, [sp, #4]
	adds r6, r7, #0
	adds r6, #0x34
	ldr r2, [r7, #0x2c]
	mov r9, r2
	adds r0, r7, #0
	adds r0, #0x32
	ldrb r0, [r0]
	str r0, [sp, #8]
	adds r0, r6, #0
	bl Text_Clear
	adds r0, r7, #0
	adds r0, #0x3c
	bl Text_Clear
	adds r0, r7, #0
	adds r0, #0x44
	bl Text_Clear
	ldrb r0, [r4]
	mov r2, r8
	ldrb r1, [r2]
	movs r2, #0
	str r2, [sp]
	movs r2, #0xe
	movs r3, #8
	bl DrawUiFrame2
	cmp r5, #0
	blt _0801E7E0
	cmp r5, #4
	ble _0801E7C8
	cmp r5, #5
	beq _0801E7D4
	b _0801E7E0
	.align 2, 0
_0801E7C4: .4byte gUnknown_0859AE88
_0801E7C8:
	lsls r1, r5, #1
	mov r0, r9
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r4, [r0]
	b _0801E7E4
_0801E7D4:
	ldr r0, _0801E7DC  @ gUnknown_0202BCB0
	ldrh r4, [r0, #0x2c]
	b _0801E7E4
	.align 2, 0
_0801E7DC: .4byte gUnknown_0202BCB0
_0801E7E0:
	adds r4, r5, #0
	movs r5, #8
_0801E7E4:
	adds r0, r4, #0
	bl GetItemType
	cmp r0, #9
	beq _0801E800
	cmp r0, #9
	bgt _0801E7F8
	cmp r0, #4
	beq _0801E800
	b _0801E8A4
_0801E7F8:
	cmp r0, #0xc
	bgt _0801E8A4
	cmp r0, #0xb
	blt _0801E8A4
_0801E800:
	adds r0, r4, #0
	bl GetItemUseDescId
	bl GetStringFromIndex
	adds r4, r0, #0
	movs r5, #0
	ldr r7, [sp, #4]
	adds r7, #0x42
	movs r0, #8
	adds r0, r0, r6
	mov r8, r0
	ldr r1, [sp, #4]
	adds r1, #0xc2
	mov r9, r1
	movs r2, #0x10
	adds r2, r2, r6
	mov sl, r2
	b _0801E82A
_0801E826:
	adds r4, #1
	adds r5, #1
_0801E82A:
	lsls r0, r5, #3
	adds r0, r6, r0
	movs r1, #0
	movs r2, #0
	adds r3, r4, #0
	bl Text_InsertString
	adds r0, r4, #0
	bl String_GetEnd
	adds r4, r0, #0
	ldrb r0, [r4]
	cmp r0, #0
	bne _0801E826
	ldr r3, _0801E89C  @ gBattleActor
	ldr r2, _0801E8A0  @ gBattleTarget
	adds r0, r2, #0
	adds r0, #0x5a
	ldrh r0, [r0]
	adds r1, r3, #0
	adds r1, #0x5a
	strh r0, [r1]
	adds r0, r2, #0
	adds r0, #0x60
	ldrh r1, [r0]
	adds r0, r3, #0
	adds r0, #0x60
	strh r1, [r0]
	adds r0, r2, #0
	adds r0, #0x66
	ldrh r0, [r0]
	adds r1, r3, #0
	adds r1, #0x66
	strh r0, [r1]
	adds r0, r2, #0
	adds r0, #0x62
	ldrh r1, [r0]
	adds r0, r3, #0
	adds r0, #0x62
	strh r1, [r0]
	adds r0, r6, #0
	adds r1, r7, #0
	bl Text_Draw
	mov r0, r8
	mov r1, r9
	bl Text_Draw
	ldr r0, [sp, #4]
	movs r2, #0xa1
	lsls r2, r2, #1
	adds r1, r0, r2
	mov r0, sl
	bl Text_Draw
	b _0801EA1C
	.align 2, 0
_0801E89C: .4byte gBattleActor
_0801E8A0: .4byte gBattleTarget
_0801E8A4:
	lsls r1, r5, #0x18
	asrs r1, r1, #0x18
	mov r0, r9
	bl BattleGenerateUiStats
	cmp r5, #8
	bne _0801E8E6
	ldr r3, _0801EA34  @ gBattleTarget
	ldr r2, _0801EA38  @ gBattleActor
	adds r0, r2, #0
	adds r0, #0x5a
	ldrh r0, [r0]
	adds r1, r3, #0
	adds r1, #0x5a
	strh r0, [r1]
	adds r0, r2, #0
	adds r0, #0x60
	ldrh r1, [r0]
	adds r0, r3, #0
	adds r0, #0x60
	strh r1, [r0]
	adds r0, r2, #0
	adds r0, #0x66
	ldrh r0, [r0]
	adds r1, r3, #0
	adds r1, #0x66
	strh r0, [r1]
	adds r0, r2, #0
	adds r0, #0x62
	ldrh r1, [r0]
	adds r0, r3, #0
	adds r0, #0x62
	strh r1, [r0]
_0801E8E6:
	ldr r0, _0801EA38  @ gBattleActor
	mov r8, r0
	movs r1, #0x48
	add r1, r8
	mov sl, r1
	ldrh r1, [r1]
	mov r0, r9
	bl CanUnitUseWeapon
	lsls r0, r0, #0x18
	movs r2, #1
	mov r9, r2
	cmp r0, #0
	beq _0801E906
	movs r0, #2
	mov r9, r0
_0801E906:
	ldr r0, _0801EA3C  @ 0x000004F1
	bl GetStringFromIndex
	adds r3, r0, #0
	adds r0, r6, #0
	movs r1, #0x1c
	movs r2, #0
	bl Text_InsertString
	adds r5, r6, #0
	adds r5, #8
	ldr r0, _0801EA40  @ 0x000004F3
	bl GetStringFromIndex
	adds r3, r0, #0
	adds r0, r5, #0
	movs r1, #2
	movs r2, #0
	bl Text_InsertString
	adds r4, r6, #0
	adds r4, #0x10
	ldr r0, _0801EA44  @ 0x000004F4
	bl GetStringFromIndex
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #2
	movs r2, #0
	bl Text_InsertString
	ldr r0, _0801EA48  @ 0x00000501
	bl GetStringFromIndex
	adds r3, r0, #0
	adds r0, r5, #0
	movs r1, #0x32
	movs r2, #0
	bl Text_InsertString
	ldr r0, _0801EA4C  @ 0x000004F5
	bl GetStringFromIndex
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x32
	movs r2, #0
	bl Text_InsertString
	mov r0, r8
	adds r0, #0x5a
	movs r1, #0
	ldrsh r3, [r0, r1]
	adds r0, r5, #0
	movs r1, #0x24
	mov r2, r9
	bl Text_InsertNumberOr2Dashes
	mov r0, r8
	adds r0, #0x60
	movs r2, #0
	ldrsh r3, [r0, r2]
	adds r0, r4, #0
	movs r1, #0x24
	mov r2, r9
	bl Text_InsertNumberOr2Dashes
	mov r0, r8
	adds r0, #0x66
	movs r1, #0
	ldrsh r3, [r0, r1]
	adds r0, r5, #0
	movs r1, #0x54
	mov r2, r9
	bl Text_InsertNumberOr2Dashes
	mov r0, r8
	adds r0, #0x62
	movs r2, #0
	ldrsh r3, [r0, r2]
	adds r0, r4, #0
	movs r1, #0x54
	mov r2, r9
	bl Text_InsertNumberOr2Dashes
	adds r0, r7, #0
	adds r0, #0x34
	adds r6, r7, #0
	adds r6, #0x31
	ldrb r1, [r6]
	adds r1, #1
	lsls r1, r1, #5
	adds r1, #1
	adds r5, r7, #0
	adds r5, #0x30
	ldrb r2, [r5]
	adds r1, r1, r2
	lsls r1, r1, #1
	ldr r4, _0801EA50  @ gBG0TilemapBuffer
	adds r1, r1, r4
	bl Text_Draw
	adds r0, r7, #0
	adds r0, #0x3c
	ldrb r1, [r6]
	adds r1, #3
	lsls r1, r1, #5
	adds r1, #1
	ldrb r2, [r5]
	adds r1, r1, r2
	lsls r1, r1, #1
	adds r1, r1, r4
	bl Text_Draw
	adds r0, r7, #0
	adds r0, #0x44
	ldrb r1, [r6]
	adds r1, #5
	lsls r1, r1, #5
	adds r1, #1
	ldrb r2, [r5]
	adds r1, r1, r2
	lsls r1, r1, #1
	adds r1, r1, r4
	bl Text_Draw
	ldr r4, [sp, #4]
	adds r4, #0x50
	mov r1, sl
	ldrh r0, [r1]
	bl GetItemType
	adds r1, r0, #0
	adds r1, #0x70
	ldr r0, [sp, #8]
	lsls r2, r0, #0xc
	adds r0, r4, #0
	bl DrawIcon
_0801EA1C:
	movs r0, #1
	bl BG_EnableSyncByMask
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801EA34: .4byte gBattleTarget
_0801EA38: .4byte gBattleActor
_0801EA3C: .4byte 0x000004F1
_0801EA40: .4byte 0x000004F3
_0801EA44: .4byte 0x000004F4
_0801EA48: .4byte 0x00000501
_0801EA4C: .4byte 0x000004F5
_0801EA50: .4byte gBG0TilemapBuffer

	THUMB_FUNC_END sub_801E748

	THUMB_FUNC_START sub_801EA54
sub_801EA54: @ 0x0801EA54
	push {lr}
	ldr r0, _0801EA60  @ gUnknown_0859AE88
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
_0801EA60: .4byte gUnknown_0859AE88

	THUMB_FUNC_END sub_801EA54

.align 2, 0 @ align with 0
