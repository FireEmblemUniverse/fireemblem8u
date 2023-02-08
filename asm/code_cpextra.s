	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	@ Core stuff to the AI system

	THUMB_FUNC_START sub_803F9D8
sub_803F9D8: @ 0x0803F9D8
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	movs r5, #0
	ldr r0, _0803F9F4  @ gActiveUnit
	ldr r0, [r0]
	adds r1, r4, #0
	bl CanUnitUseStaff
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0803F9FC
	b _0803FA30
	.align 2, 0
_0803F9F4: .4byte gActiveUnit
_0803F9F8:
	adds r0, r5, #0
	b _0803FA34
_0803F9FC:
	adds r0, r4, #0
	bl GetItemIndex
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	ldr r4, _0803FA3C  @ gUnknown_080D868C
	ldrh r0, [r4]
	cmp r0, #0
	beq _0803FA30
	movs r3, #0
	adds r2, r4, #4
	adds r1, r4, #0
_0803FA14:
	ldrh r0, [r1]
	cmp r6, r0
	bne _0803FA20
	ldr r0, [r2]
	cmp r0, #0
	bne _0803F9F8
_0803FA20:
	adds r3, #8
	adds r2, #8
	adds r1, #8
	adds r5, #1
	adds r0, r3, r4
	ldrh r0, [r0]
	cmp r0, #0
	bne _0803FA14
_0803FA30:
	movs r0, #1
	negs r0, r0
_0803FA34:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0803FA3C: .4byte gUnknown_080D868C

	THUMB_FUNC_END sub_803F9D8

	THUMB_FUNC_START sub_803FA40
sub_803FA40: @ 0x0803FA40
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r7, r0, #0
	movs r6, #0
	ldr r0, _0803FADC  @ gActiveUnit
	ldr r2, [r0]
	adds r0, r2, #0
	adds r0, #0x30
	ldrb r1, [r0]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #3
	beq _0803FACA
	movs r5, #0
	ldrh r4, [r2, #0x1e]
	cmp r4, #0
	beq _0803FACA
	ldr r0, _0803FAE0  @ gUnknown_080D8690
	mov r8, r0
_0803FA68:
	adds r0, r4, #0
	bl GetItemAttributes
	movs r1, #4
	ands r1, r0
	cmp r1, #0
	beq _0803FAB4
	adds r0, r4, #0
	bl GetItemRequiredExp
	cmp r0, r6
	blt _0803FAB4
	adds r0, r4, #0
	bl sub_803F9D8
	adds r1, r0, #0
	movs r0, #1
	negs r0, r0
	cmp r1, r0
	beq _0803FAB4
	lsls r0, r1, #3
	add r0, r8
	ldr r2, [r0]
	adds r0, r5, #0
	adds r1, r7, #0
	bl _call_via_r2
	ldr r0, _0803FAE4  @ gAiDecision
	ldrb r0, [r0, #0xa]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0803FAB4
	adds r0, r4, #0
	bl GetItemRequiredExp
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
_0803FAB4:
	adds r5, #1
	cmp r5, #4
	bgt _0803FACA
	ldr r0, _0803FADC  @ gActiveUnit
	ldr r0, [r0]
	lsls r1, r5, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r4, [r0]
	cmp r4, #0
	bne _0803FA68
_0803FACA:
	ldr r0, _0803FAE4  @ gAiDecision
	ldrb r0, [r0, #0xa]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0803FADC: .4byte gActiveUnit
_0803FAE0: .4byte gUnknown_080D8690
_0803FAE4: .4byte gAiDecision

	THUMB_FUNC_END sub_803FA40

	THUMB_FUNC_START sub_803FAE8
sub_803FAE8: @ 0x0803FAE8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	str r0, [sp]
	str r1, [sp, #4]
	mov r8, r2
	movs r0, #0
	mov sl, r0
	ldr r2, _0803FB8C  @ gUnknown_085A92BC
	movs r1, #3
	mov r9, r1
_0803FB04:
	ldr r0, [r2]
	ldr r1, [sp]
	adds r5, r1, r0
	ldr r0, [r2, #4]
	ldr r1, [sp, #4]
	adds r7, r1, r0
	ldr r0, _0803FB90  @ gBmMapMovement
	ldr r0, [r0]
	lsls r6, r7, #2
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r0, [r0]
	cmp r0, #0x77
	bhi _0803FB72
	ldr r0, _0803FB94  @ gBmMapUnit
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r1, [r0]
	cmp r1, #0
	beq _0803FB3A
	ldr r0, _0803FB98  @ gActiveUnitId
	ldrb r0, [r0]
	cmp r1, r0
	bne _0803FB72
_0803FB3A:
	adds r0, r5, #0
	adds r1, r7, #0
	str r2, [sp, #8]
	bl AiGetTerrainCombatPositionScoreComponent
	adds r4, r0, #0
	adds r0, r5, #0
	adds r1, r7, #0
	bl AiGetFriendZoneCombatPositionScoreComponent
	adds r4, r4, r0
	ldr r0, _0803FB9C  @ gBmMapOther
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r0, [r0]
	lsrs r0, r0, #3
	subs r4, r4, r0
	ldr r0, _0803FBA0  @ 0x7FFFFFFF
	adds r4, r4, r0
	ldr r2, [sp, #8]
	cmp sl, r4
	bcs _0803FB72
	mov r1, r8
	strh r5, [r1]
	strh r7, [r1, #2]
	mov sl, r4
_0803FB72:
	adds r2, #8
	movs r0, #1
	negs r0, r0
	add r9, r0
	mov r1, r9
	cmp r1, #0
	bge _0803FB04
	mov r0, sl
	cmp r0, #0
	bne _0803FBA4
	movs r0, #0
	b _0803FBA6
	.align 2, 0
_0803FB8C: .4byte gUnknown_085A92BC
_0803FB90: .4byte gBmMapMovement
_0803FB94: .4byte gBmMapUnit
_0803FB98: .4byte gActiveUnitId
_0803FB9C: .4byte gBmMapOther
_0803FBA0: .4byte 0x7FFFFFFF
_0803FBA4:
	movs r0, #1
_0803FBA6:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_803FAE8

	THUMB_FUNC_START sub_803FBB8
sub_803FBB8: @ 0x0803FBB8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x24
	str r0, [sp, #0x10]
	mov r9, r1
	movs r0, #0x64
	mov sl, r0
	movs r1, #1
	negs r1, r1
	str r1, [sp, #0x18]
	str r1, [sp, #0x14]
	movs r2, #0
	str r2, [sp, #0x1c]
	ldr r0, _0803FD10  @ gActiveUnit
	ldr r0, [r0]
	bl sub_803C490
	ldr r0, [sp, #0x18]
	bl GenerateMagicSealMap
	bl MarkMovementMapEdges
	ldr r0, _0803FD14  @ gAiState
	adds r1, r0, #0
	adds r1, #0x7c
	ldrb r0, [r1]
	cmp r0, #0
	beq _0803FBFA
	adds r1, r0, #0
	mov sl, r1
_0803FBFA:
	ldr r0, _0803FD18  @ gBmMapSize
	movs r4, #2
	ldrsh r0, [r0, r4]
	subs r7, r0, #1
	cmp r7, #0
	blt _0803FCDA
_0803FC06:
	ldr r0, _0803FD18  @ gBmMapSize
	movs r1, #0
	ldrsh r0, [r0, r1]
	subs r6, r0, #1
	subs r2, r7, #1
	str r2, [sp, #0x20]
	cmp r6, #0
	blt _0803FCD4
	lsls r4, r7, #2
	mov r8, r4
_0803FC1A:
	ldr r0, _0803FD1C  @ gBmMapMovement
	ldr r0, [r0]
	add r0, r8
	ldr r0, [r0]
	adds r0, r0, r6
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _0803FCCE
	ldr r0, _0803FD20  @ gBmMapUnit
	ldr r0, [r0]
	add r0, r8
	ldr r0, [r0]
	adds r2, r0, r6
	ldrb r1, [r2]
	cmp r1, #0
	beq _0803FCCE
	ldr r0, _0803FD24  @ gActiveUnitId
	ldrb r0, [r0]
	cmp r1, r0
	beq _0803FCCE
	adds r0, r1, #0
	bl GetUnit
	adds r5, r0, #0
	ldr r0, _0803FD28  @ gUnknown_0203AA7F
	ldrb r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	bne _0803FC6A
	mov r1, r9
	cmp r1, #0
	beq _0803FC6A
	adds r0, r5, #0
	bl _call_via_r9
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq _0803FCCE
_0803FC6A:
	ldr r2, _0803FD2C  @ gUnknown_0203AA80
	ldrb r0, [r2]
	cmp r0, #0
	bne _0803FC7C
	ldrb r1, [r5, #0xa]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0803FCCE
_0803FC7C:
	adds r0, r5, #0
	bl GetUnitCurrentHp
	movs r1, #0x64
	adds r4, r0, #0
	muls r4, r1, r4
	adds r0, r5, #0
	bl GetUnitMaxHp
	adds r1, r0, #0
	adds r0, r4, #0
	bl Div
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, sl
	bhi _0803FCCE
	add r5, sp, #0xc
	adds r0, r6, #0
	adds r1, r7, #0
	adds r2, r5, #0
	bl sub_803FAE8
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803FCCE
	mov sl, r4
	add r0, sp, #0xc
	movs r1, #0
	ldrsh r4, [r0, r1]
	str r4, [sp, #0x14]
	movs r4, #2
	ldrsh r2, [r5, r4]
	str r2, [sp, #0x18]
	ldr r0, _0803FD20  @ gBmMapUnit
	ldr r0, [r0]
	add r0, r8
	ldr r0, [r0]
	adds r0, r0, r6
	ldrb r0, [r0]
	str r0, [sp, #0x1c]
_0803FCCE:
	subs r6, #1
	cmp r6, #0
	bge _0803FC1A
_0803FCD4:
	ldr r7, [sp, #0x20]
	cmp r7, #0
	bge _0803FC06
_0803FCDA:
	movs r0, #1
	negs r0, r0
	ldr r1, [sp, #0x14]
	cmp r1, r0
	beq _0803FCFE
	adds r0, r1, #0
	ldr r1, [sp, #0x18]
	ldr r3, [sp, #0x1c]
	ldr r4, [sp, #0x10]
	lsls r2, r4, #0x18
	lsrs r2, r2, #0x18
	str r2, [sp]
	movs r2, #0
	str r2, [sp, #4]
	str r2, [sp, #8]
	movs r2, #5
	bl AiSetDecision
_0803FCFE:
	add sp, #0x24
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803FD10: .4byte gActiveUnit
_0803FD14: .4byte gAiState
_0803FD18: .4byte gBmMapSize
_0803FD1C: .4byte gBmMapMovement
_0803FD20: .4byte gBmMapUnit
_0803FD24: .4byte gActiveUnitId
_0803FD28: .4byte gUnknown_0203AA7F
_0803FD2C: .4byte gUnknown_0203AA80

	THUMB_FUNC_END sub_803FBB8

	THUMB_FUNC_START sub_803FD30
sub_803FD30: @ 0x0803FD30
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x20
	str r0, [sp, #0x10]
	mov r9, r1
	movs r0, #0x64
	mov sl, r0
	movs r1, #1
	negs r1, r1
	str r1, [sp, #0x18]
	str r1, [sp, #0x14]
	movs r2, #0
	str r2, [sp, #0x1c]
	ldr r4, _0803FEE0  @ gAiState
	adds r5, r4, #0
	adds r5, #0x7b
	ldrb r1, [r5]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _0803FD62
	b _0803FED0
_0803FD62:
	ldr r0, _0803FEE4  @ gActiveUnit
	ldr r0, [r0]
	bl sub_803C490
	ldr r0, [sp, #0x18]
	bl GenerateMagicSealMap
	adds r1, r4, #0
	adds r1, #0x7c
	ldrb r0, [r1]
	cmp r0, #0
	beq _0803FD7E
	adds r3, r0, #0
	mov sl, r3
_0803FD7E:
	movs r4, #1
	mov r8, r4
_0803FD82:
	mov r0, r8
	bl GetUnit
	adds r6, r0, #0
	cmp r6, #0
	bne _0803FD90
	b _0803FEA0
_0803FD90:
	ldr r0, [r6]
	cmp r0, #0
	bne _0803FD98
	b _0803FEA0
_0803FD98:
	movs r1, #0x11
	ldrsb r1, [r6, r1]
	ldr r0, _0803FEE8  @ gBmMapUnit
	ldr r0, [r0]
	lsls r1, r1, #2
	adds r1, r1, r0
	movs r2, #0x10
	ldrsb r2, [r6, r2]
	ldr r0, [r1]
	adds r0, r0, r2
	ldr r1, _0803FEEC  @ gActiveUnitId
	ldrb r0, [r0]
	ldrb r1, [r1]
	cmp r0, r1
	beq _0803FEA0
	ldr r0, [r6, #0xc]
	ldr r1, _0803FEF0  @ 0x00010005
	ands r0, r1
	cmp r0, #0
	bne _0803FEA0
	ldr r0, _0803FEF4  @ gUnknown_0203AA7F
	ldrb r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	bne _0803FDE0
	mov r1, r9
	cmp r1, #0
	beq _0803FDE0
	adds r0, r6, #0
	bl _call_via_r9
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq _0803FEA0
_0803FDE0:
	ldr r2, _0803FEF8  @ gUnknown_0203AA80
	ldrb r0, [r2]
	cmp r0, #0
	bne _0803FDF2
	ldrb r1, [r6, #0xa]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0803FEA0
_0803FDF2:
	ldr r7, _0803FEE4  @ gActiveUnit
	ldr r0, [r7]
	bl GetUnitMagBy2Range
	ldr r2, [r7]
	ldr r1, [r2, #4]
	ldrb r1, [r1, #0x12]
	ldrb r3, [r2, #0x1d]
	adds r1, r1, r3
	adds r0, r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r4, #0x10
	ldrsb r4, [r2, r4]
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	ldrb r2, [r6, #0x10]
	ldrb r3, [r6, #0x11]
	str r0, [sp]
	adds r0, r4, #0
	bl AiIsWithinRectDistance
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803FEA0
	ldr r0, _0803FEFC  @ gBmMapRange
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFill
	movs r4, #0x10
	ldrsb r4, [r6, r4]
	movs r5, #0x11
	ldrsb r5, [r6, r5]
	ldr r0, [r7]
	bl GetUnitMagBy2Range
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	movs r3, #1
	bl MapAddInRange
	add r5, sp, #0xc
	adds r0, r5, #0
	bl sub_803C284
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803FEA0
	adds r0, r6, #0
	bl GetUnitCurrentHp
	movs r1, #0x64
	adds r4, r0, #0
	muls r4, r1, r4
	adds r0, r6, #0
	bl GetUnitMaxHp
	adds r1, r0, #0
	adds r0, r4, #0
	bl Div
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, sl
	bhi _0803FEA0
	mov sl, r0
	add r0, sp, #0xc
	movs r1, #0
	ldrsh r4, [r0, r1]
	str r4, [sp, #0x14]
	movs r3, #2
	ldrsh r2, [r5, r3]
	str r2, [sp, #0x18]
	movs r1, #0x11
	ldrsb r1, [r6, r1]
	ldr r0, _0803FEE8  @ gBmMapUnit
	ldr r0, [r0]
	lsls r1, r1, #2
	adds r1, r1, r0
	movs r2, #0x10
	ldrsb r2, [r6, r2]
	ldr r0, [r1]
	adds r0, r0, r2
	ldrb r0, [r0]
	str r0, [sp, #0x1c]
_0803FEA0:
	movs r4, #1
	add r8, r4
	mov r0, r8
	cmp r0, #0xbf
	bgt _0803FEAC
	b _0803FD82
_0803FEAC:
	movs r0, #1
	negs r0, r0
	ldr r1, [sp, #0x14]
	cmp r1, r0
	beq _0803FED0
	adds r0, r1, #0
	ldr r1, [sp, #0x18]
	ldr r3, [sp, #0x1c]
	ldr r4, [sp, #0x10]
	lsls r2, r4, #0x18
	lsrs r2, r2, #0x18
	str r2, [sp]
	movs r2, #0
	str r2, [sp, #4]
	str r2, [sp, #8]
	movs r2, #5
	bl AiSetDecision
_0803FED0:
	add sp, #0x20
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803FEE0: .4byte gAiState
_0803FEE4: .4byte gActiveUnit
_0803FEE8: .4byte gBmMapUnit
_0803FEEC: .4byte gActiveUnitId
_0803FEF0: .4byte 0x00010005
_0803FEF4: .4byte gUnknown_0203AA7F
_0803FEF8: .4byte gUnknown_0203AA80
_0803FEFC: .4byte gBmMapRange

	THUMB_FUNC_END sub_803FD30

	THUMB_FUNC_START sub_803FF00
sub_803FF00: @ 0x0803FF00
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	str r0, [sp, #0xc]
	movs r0, #0
	mov r8, r0
	mov r9, r0
	mov sl, r0
	ldr r0, _0803FFF0  @ gAiState
	adds r0, #0x7b
	ldrb r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	bne _0803FFE0
	bl sub_803C364
	cmp r0, #2
	ble _0803FFE0
	ldr r0, _0803FFF4  @ gActiveUnit
	ldr r0, [r0]
	bl sub_803C490
	movs r0, #1
	negs r0, r0
	bl GenerateMagicSealMap
	ldr r0, _0803FFF8  @ gBmMapSize
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r5, r0, #1
	cmp r5, #0
	blt _0803FFB8
_0803FF48:
	ldr r0, _0803FFF8  @ gBmMapSize
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r4, r0, #1
	subs r7, r5, #1
	cmp r4, #0
	blt _0803FFB2
	lsls r6, r5, #2
_0803FF58:
	ldr r0, _0803FFFC  @ gBmMapMovement
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _0803FFAC
	ldr r0, _08040000  @ gBmMapUnit
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r1, [r0]
	cmp r1, #0
	beq _0803FF80
	ldr r0, _08040004  @ gActiveUnitId
	ldrb r0, [r0]
	cmp r1, r0
	bne _0803FFAC
_0803FF80:
	ldr r0, _08040008  @ gBmMapRange
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFill
	ldr r0, _0803FFF4  @ gActiveUnit
	ldr r0, [r0]
	bl GetUnitMagBy2Range
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	movs r3, #1
	bl MapAddInRange
	bl sub_803C3B0
	cmp r0, r8
	ble _0803FFAC
	mov r8, r0
	mov r9, r4
	mov sl, r5
_0803FFAC:
	subs r4, #1
	cmp r4, #0
	bge _0803FF58
_0803FFB2:
	adds r5, r7, #0
	cmp r5, #0
	bge _0803FF48
_0803FFB8:
	mov r3, r8
	cmp r3, #1
	ble _0803FFE0
	mov r1, r9
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	mov r2, sl
	lsls r1, r2, #0x10
	asrs r1, r1, #0x10
	ldr r3, [sp, #0xc]
	lsls r2, r3, #0x18
	lsrs r2, r2, #0x18
	str r2, [sp]
	movs r2, #0
	str r2, [sp, #4]
	str r2, [sp, #8]
	movs r2, #5
	movs r3, #0
	bl AiSetDecision
_0803FFE0:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803FFF0: .4byte gAiState
_0803FFF4: .4byte gActiveUnit
_0803FFF8: .4byte gBmMapSize
_0803FFFC: .4byte gBmMapMovement
_08040000: .4byte gBmMapUnit
_08040004: .4byte gActiveUnitId
_08040008: .4byte gBmMapRange

	THUMB_FUNC_END sub_803FF00

	THUMB_FUNC_START sub_804000C
sub_804000C: @ 0x0804000C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x24
	str r0, [sp, #0x10]
	mov r9, r1
	movs r0, #0
	mov sl, r0
	movs r1, #0
	str r1, [sp, #0x14]
	movs r2, #0
	str r2, [sp, #0x18]
	movs r5, #0
	str r5, [sp, #0x1c]
	ldr r0, _08040150  @ gAiState
	adds r0, #0x7b
	ldrb r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _0804003C
	b _0804013E
_0804003C:
	ldr r0, _08040154  @ gActiveUnit
	ldr r0, [r0]
	bl sub_803C490
	movs r0, #1
	negs r0, r0
	bl GenerateMagicSealMap
	bl MarkMovementMapEdges
	ldr r0, _08040158  @ gBmMapSize
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r7, r0, #1
	cmp r7, #0
	blt _08040108
_0804005C:
	ldr r0, _08040158  @ gBmMapSize
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r4, r0, #1
	subs r5, r7, #1
	str r5, [sp, #0x20]
	cmp r4, #0
	blt _08040102
	lsls r0, r7, #2
	mov r8, r0
_08040070:
	ldr r0, _0804015C  @ gBmMapMovement
	ldr r0, [r0]
	add r0, r8
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _080400FC
	ldr r0, _08040160  @ gBmMapUnit
	ldr r0, [r0]
	add r0, r8
	ldr r0, [r0]
	adds r1, r0, r4
	ldrb r0, [r1]
	cmp r0, #0
	beq _080400FC
	bl GetUnit
	adds r5, r0, #0
	ldr r0, _08040150  @ gAiState
	adds r0, #0x7b
	ldrb r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	bne _080400B8
	mov r1, r9
	cmp r1, #0
	beq _080400B8
	adds r0, r5, #0
	bl _call_via_r9
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq _080400FC
_080400B8:
	ldrb r1, [r5, #0xa]
	movs r0, #9
	ands r0, r1
	cmp r0, #0
	bne _080400FC
	movs r0, #8
	ldrsb r0, [r5, r0]
	cmp r0, sl
	blt _080400FC
	add r6, sp, #0xc
	adds r0, r4, #0
	adds r1, r7, #0
	adds r2, r6, #0
	bl sub_803FAE8
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080400FC
	ldrb r5, [r5, #8]
	mov sl, r5
	add r0, sp, #0xc
	movs r5, #0
	ldrsh r2, [r0, r5]
	str r2, [sp, #0x14]
	movs r1, #2
	ldrsh r0, [r6, r1]
	str r0, [sp, #0x18]
	ldr r0, _08040160  @ gBmMapUnit
	ldr r0, [r0]
	add r0, r8
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	str r0, [sp, #0x1c]
_080400FC:
	subs r4, #1
	cmp r4, #0
	bge _08040070
_08040102:
	ldr r7, [sp, #0x20]
	cmp r7, #0
	bge _0804005C
_08040108:
	mov r2, sl
	cmp r2, #0
	beq _0804013E
	add r4, sp, #0xc
	adds r0, r4, #0
	bl sub_8040668
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0804013E
	ldr r0, [sp, #0x14]
	ldr r1, [sp, #0x18]
	ldr r3, [sp, #0x1c]
	ldr r5, [sp, #0x10]
	lsls r2, r5, #0x18
	lsrs r2, r2, #0x18
	str r2, [sp]
	add r2, sp, #0xc
	ldrb r2, [r2]
	str r2, [sp, #4]
	ldrh r2, [r4, #2]
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	str r2, [sp, #8]
	movs r2, #5
	bl AiSetDecision
_0804013E:
	add sp, #0x24
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08040150: .4byte gAiState
_08040154: .4byte gActiveUnit
_08040158: .4byte gBmMapSize
_0804015C: .4byte gBmMapMovement
_08040160: .4byte gBmMapUnit

	THUMB_FUNC_END sub_804000C

	THUMB_FUNC_START sub_8040164
sub_8040164: @ 0x08040164
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x24
	str r0, [sp, #0x10]
	mov r9, r1
	movs r0, #0
	mov sl, r0
	movs r1, #0
	str r1, [sp, #0x14]
	movs r2, #0
	str r2, [sp, #0x18]
	movs r4, #0
	str r4, [sp, #0x1c]
	ldr r0, _08040294  @ gAiState
	adds r0, #0x7b
	ldrb r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	bne _08040282
	ldr r0, _08040298  @ gActiveUnit
	ldr r0, [r0]
	bl sub_803C490
	movs r0, #1
	negs r0, r0
	bl GenerateMagicSealMap
	bl MarkMovementMapEdges
	ldr r0, _0804029C  @ gBmMapSize
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r7, r0, #1
	cmp r7, #0
	blt _08040262
_080401B2:
	ldr r0, _0804029C  @ gBmMapSize
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r4, r0, #1
	subs r0, r7, #1
	str r0, [sp, #0x20]
	cmp r4, #0
	blt _0804025C
	lsls r1, r7, #2
	mov r8, r1
_080401C6:
	ldr r0, _080402A0  @ gBmMapMovement
	ldr r0, [r0]
	add r0, r8
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _08040256
	ldr r0, _080402A4  @ gBmMapUnit
	ldr r0, [r0]
	add r0, r8
	ldr r0, [r0]
	adds r1, r0, r4
	ldrb r0, [r1]
	cmp r0, #0
	beq _08040256
	bl GetUnit
	adds r5, r0, #0
	ldr r0, _08040294  @ gAiState
	adds r0, #0x7b
	ldrb r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	bne _0804020E
	mov r2, r9
	cmp r2, #0
	beq _0804020E
	adds r0, r5, #0
	bl _call_via_r9
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq _08040256
_0804020E:
	adds r0, r5, #0
	adds r0, #0x30
	ldrb r1, [r0]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #0
	beq _08040256
	movs r0, #8
	ldrsb r0, [r5, r0]
	cmp r0, sl
	blt _08040256
	add r6, sp, #0xc
	adds r0, r4, #0
	adds r1, r7, #0
	adds r2, r6, #0
	bl sub_803FAE8
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08040256
	ldrb r5, [r5, #8]
	mov sl, r5
	add r0, sp, #0xc
	movs r2, #0
	ldrsh r1, [r0, r2]
	str r1, [sp, #0x14]
	movs r1, #2
	ldrsh r0, [r6, r1]
	str r0, [sp, #0x18]
	ldr r0, _080402A4  @ gBmMapUnit
	ldr r0, [r0]
	add r0, r8
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	str r0, [sp, #0x1c]
_08040256:
	subs r4, #1
	cmp r4, #0
	bge _080401C6
_0804025C:
	ldr r7, [sp, #0x20]
	cmp r7, #0
	bge _080401B2
_08040262:
	mov r2, sl
	cmp r2, #0
	beq _08040282
	ldr r0, [sp, #0x14]
	ldr r1, [sp, #0x18]
	ldr r3, [sp, #0x1c]
	ldr r4, [sp, #0x10]
	lsls r2, r4, #0x18
	lsrs r2, r2, #0x18
	str r2, [sp]
	movs r2, #0
	str r2, [sp, #4]
	str r2, [sp, #8]
	movs r2, #5
	bl AiSetDecision
_08040282:
	add sp, #0x24
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08040294: .4byte gAiState
_08040298: .4byte gActiveUnit
_0804029C: .4byte gBmMapSize
_080402A0: .4byte gBmMapMovement
_080402A4: .4byte gBmMapUnit

	THUMB_FUNC_END sub_8040164

	THUMB_FUNC_START sub_80402A8
sub_80402A8: @ 0x080402A8
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	movs r6, #0
_080402AE:
	lsls r0, r6, #1
	adds r1, r5, #0
	adds r1, #0x1e
	adds r1, r1, r0
	ldrh r0, [r1]
	adds r4, r0, #0
	cmp r4, #0
	beq _080402F6
	adds r0, r4, #0
	bl GetItemAttributes
	ldr r1, _080402EC  @ 0x00000405
	ands r1, r0
	cmp r1, #0
	beq _080402F0
	adds r0, r5, #0
	adds r1, r4, #0
	bl CanUnitUseWeapon
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080402E8
	adds r0, r5, #0
	adds r1, r4, #0
	bl CanUnitUseStaff
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080402F0
_080402E8:
	movs r0, #1
	b _080402F8
	.align 2, 0
_080402EC: .4byte 0x00000405
_080402F0:
	adds r6, #1
	cmp r6, #4
	ble _080402AE
_080402F6:
	movs r0, #0
_080402F8:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80402A8

	THUMB_FUNC_START sub_8040300
sub_8040300: @ 0x08040300
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _0804031C  @ gActiveUnit
	ldr r0, [r0]
	adds r1, r5, #0
	bl GetOffensiveStaffAccuracy
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #4
	bhi _08040320
	movs r0, #0
	b _0804034C
	.align 2, 0
_0804031C: .4byte gActiveUnit
_08040320:
	adds r0, r5, #0
	bl GetUnitPower
	adds r0, r4, r0
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r0, r5, #0
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0
	beq _0804034A
	bl GetItemAttributes
	movs r1, #2
	ands r1, r0
	cmp r1, #0
	beq _0804034A
	lsls r0, r4, #0x19
	lsrs r4, r0, #0x18
_0804034A:
	adds r0, r4, #0
_0804034C:
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8040300

	THUMB_FUNC_START sub_8040354
sub_8040354: @ 0x08040354
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x24
	str r0, [sp, #0x10]
	mov sl, r1
	movs r0, #0
	str r0, [sp, #0x14]
	movs r1, #0
	str r1, [sp, #0x18]
	movs r2, #0
	str r2, [sp, #0x1c]
	movs r3, #0
	str r3, [sp, #0x20]
	ldr r0, _080404D0  @ gAiState
	adds r0, #0x7b
	ldrb r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _08040384
	b _080404C0
_08040384:
	ldr r0, _080404D4  @ gActiveUnit
	ldr r0, [r0]
	bl sub_803C490
	movs r0, #1
	negs r0, r0
	bl GenerateMagicSealMap
	movs r4, #1
	mov r9, r4
_08040398:
	mov r0, r9
	bl GetUnit
	adds r6, r0, #0
	cmp r6, #0
	beq _08040490
	ldr r0, [r6]
	cmp r0, #0
	beq _08040490
	ldr r0, [r6, #0xc]
	ldr r1, _080404D8  @ 0x00010005
	ands r0, r1
	cmp r0, #0
	bne _08040490
	ldr r0, _080404D0  @ gAiState
	adds r0, #0x7b
	ldrb r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	bne _080403D4
	mov r0, sl
	cmp r0, #0
	beq _080403D4
	adds r0, r6, #0
	bl _call_via_sl
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08040490
_080403D4:
	adds r0, r6, #0
	adds r0, #0x30
	ldrb r1, [r0]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #3
	beq _08040490
	adds r0, r6, #0
	bl sub_803C44C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08040490
	ldr r1, _080404D4  @ gActiveUnit
	mov r8, r1
	ldr r0, [r1]
	bl GetUnitMagBy2Range
	mov r3, r8
	ldr r2, [r3]
	ldr r1, [r2, #4]
	ldrb r1, [r1, #0x12]
	ldrb r4, [r2, #0x1d]
	adds r1, r1, r4
	adds r0, r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r4, #0x10
	ldrsb r4, [r2, r4]
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	ldrb r2, [r6, #0x10]
	ldrb r3, [r6, #0x11]
	str r0, [sp]
	adds r0, r4, #0
	bl AiIsWithinRectDistance
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08040490
	adds r0, r6, #0
	bl sub_80402A8
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08040490
	adds r0, r6, #0
	bl sub_8040300
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	cmp r7, #0
	beq _08040490
	ldr r0, [sp, #0x14]
	cmp r7, r0
	bcc _08040490
	ldr r0, _080404DC  @ gBmMapRange
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFill
	movs r4, #0x10
	ldrsb r4, [r6, r4]
	movs r5, #0x11
	ldrsb r5, [r6, r5]
	mov r1, r8
	ldr r0, [r1]
	bl GetUnitMagBy2Range
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	movs r3, #1
	bl MapAddInRange
	add r4, sp, #0xc
	adds r0, r4, #0
	bl sub_803C284
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08040490
	str r7, [sp, #0x14]
	add r0, sp, #0xc
	movs r3, #0
	ldrsh r2, [r0, r3]
	str r2, [sp, #0x18]
	movs r1, #2
	ldrsh r0, [r4, r1]
	str r0, [sp, #0x1c]
	ldrb r6, [r6, #0xb]
	lsls r6, r6, #0x18
	asrs r6, r6, #0x18
	str r6, [sp, #0x20]
_08040490:
	movs r2, #1
	add r9, r2
	mov r3, r9
	cmp r3, #0xbf
	bgt _0804049C
	b _08040398
_0804049C:
	ldr r4, [sp, #0x14]
	cmp r4, #0
	beq _080404C0
	ldr r0, [sp, #0x18]
	ldr r1, [sp, #0x1c]
	ldr r2, [sp, #0x20]
	lsls r3, r2, #0x18
	lsrs r3, r3, #0x18
	ldr r4, [sp, #0x10]
	lsls r2, r4, #0x18
	lsrs r2, r2, #0x18
	str r2, [sp]
	movs r2, #0
	str r2, [sp, #4]
	str r2, [sp, #8]
	movs r2, #5
	bl AiSetDecision
_080404C0:
	add sp, #0x24
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080404D0: .4byte gAiState
_080404D4: .4byte gActiveUnit
_080404D8: .4byte 0x00010005
_080404DC: .4byte gBmMapRange

	THUMB_FUNC_END sub_8040354

	THUMB_FUNC_START sub_80404E0
sub_80404E0: @ 0x080404E0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x20
	str r0, [sp, #0x10]
	mov r9, r1
	movs r0, #0
	mov sl, r0
	movs r1, #0
	str r1, [sp, #0x14]
	movs r2, #0
	str r2, [sp, #0x18]
	movs r3, #0
	str r3, [sp, #0x1c]
	ldr r0, _08040654  @ gAiState
	adds r0, #0x7b
	ldrb r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _08040510
	b _08040642
_08040510:
	ldr r0, _08040658  @ gActiveUnit
	ldr r0, [r0]
	bl sub_803C490
	movs r0, #1
	negs r0, r0
	bl GenerateMagicSealMap
	movs r4, #1
	mov r8, r4
_08040524:
	mov r0, r8
	bl GetUnit
	adds r6, r0, #0
	cmp r6, #0
	beq _08040612
	ldr r0, [r6]
	cmp r0, #0
	beq _08040612
	ldr r0, [r6, #0xc]
	ldr r1, _0804065C  @ 0x00010005
	ands r0, r1
	cmp r0, #0
	bne _08040612
	ldr r0, _08040654  @ gAiState
	adds r0, #0x7b
	ldrb r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	bne _08040560
	mov r0, r9
	cmp r0, #0
	beq _08040560
	adds r0, r6, #0
	bl _call_via_r9
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08040612
_08040560:
	adds r0, r6, #0
	adds r0, #0x30
	ldrb r1, [r0]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #0
	bne _08040612
	ldr r7, _08040658  @ gActiveUnit
	ldr r0, [r7]
	bl GetUnitMagBy2Range
	ldr r2, [r7]
	ldr r1, [r2, #4]
	ldrb r1, [r1, #0x12]
	ldrb r3, [r2, #0x1d]
	adds r1, r1, r3
	adds r0, r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r4, #0x10
	ldrsb r4, [r2, r4]
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	ldrb r2, [r6, #0x10]
	ldrb r3, [r6, #0x11]
	str r0, [sp]
	adds r0, r4, #0
	bl AiIsWithinRectDistance
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08040612
	adds r0, r6, #0
	bl sub_80402A8
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08040612
	ldr r0, [r7]
	adds r1, r6, #0
	bl GetOffensiveStaffAccuracy
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #4
	bls _08040612
	movs r0, #8
	ldrsb r0, [r6, r0]
	adds r0, r1, r0
	cmp r0, sl
	blt _08040612
	ldr r0, _08040660  @ gBmMapRange
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFill
	movs r4, #0x10
	ldrsb r4, [r6, r4]
	movs r5, #0x11
	ldrsb r5, [r6, r5]
	ldr r0, [r7]
	bl GetUnitMagBy2Range
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	movs r3, #1
	bl MapAddInRange
	add r4, sp, #0xc
	adds r0, r4, #0
	bl sub_803C284
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08040612
	ldrb r0, [r6, #8]
	mov sl, r0
	add r0, sp, #0xc
	movs r2, #0
	ldrsh r1, [r0, r2]
	str r1, [sp, #0x14]
	movs r0, #2
	ldrsh r3, [r4, r0]
	str r3, [sp, #0x18]
	ldrb r6, [r6, #0xb]
	lsls r6, r6, #0x18
	asrs r6, r6, #0x18
	str r6, [sp, #0x1c]
_08040612:
	movs r1, #1
	add r8, r1
	mov r2, r8
	cmp r2, #0xbf
	bgt _0804061E
	b _08040524
_0804061E:
	mov r3, sl
	cmp r3, #0
	beq _08040642
	ldr r0, [sp, #0x14]
	ldr r1, [sp, #0x18]
	ldr r4, [sp, #0x1c]
	lsls r3, r4, #0x18
	lsrs r3, r3, #0x18
	ldr r4, [sp, #0x10]
	lsls r2, r4, #0x18
	lsrs r2, r2, #0x18
	str r2, [sp]
	movs r2, #0
	str r2, [sp, #4]
	str r2, [sp, #8]
	movs r2, #5
	bl AiSetDecision
_08040642:
	add sp, #0x20
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08040654: .4byte gAiState
_08040658: .4byte gActiveUnit
_0804065C: .4byte 0x00010005
_08040660: .4byte gBmMapRange

	THUMB_FUNC_END sub_80404E0

	THUMB_FUNC_START nullsub_29
nullsub_29: @ 0x08040664
	bx lr

	THUMB_FUNC_END nullsub_29

	THUMB_FUNC_START sub_8040668
sub_8040668: @ 0x08040668
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x24
	str r0, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	mov r8, r0
	mov sl, r0
	movs r1, #0
	str r1, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	ldr r0, _0804073C  @ gActiveUnit
	ldr r0, [r0]
	bl GetUnitMovementCost
	str r0, [sp, #0x10]
	bl GetCurrentPhase
	str r0, [sp, #0x14]
	adds r4, r0, #0
	adds r4, #1
	adds r0, #0x80
	cmp r4, r0
	blt _080406A2
	b _080407CA
_080406A2:
	adds r0, r4, #0
	bl GetUnit
	adds r7, r0, #0
	ldr r1, [sp, #0x14]
	adds r1, #0x80
	str r1, [sp, #0x1c]
	adds r4, #1
	str r4, [sp, #0x18]
	cmp r7, #0
	bne _080406BA
	b _080407C0
_080406BA:
	ldr r0, [r7]
	cmp r0, #0
	bne _080406C2
	b _080407C0
_080406C2:
	ldr r0, [r7, #0xc]
	ldr r1, _08040740  @ 0x00010025
	ands r0, r1
	cmp r0, #0
	bne _080407C0
	adds r0, r7, #0
	bl sub_8041054
	ldr r0, _08040744  @ gBmMapSize
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r6, r0, #1
	cmp r6, #0
	blt _0804079A
_080406DE:
	ldr r0, _08040744  @ gBmMapSize
	movs r1, #0
	ldrsh r0, [r0, r1]
	subs r4, r0, #1
	subs r0, r6, #1
	mov r9, r0
	cmp r4, #0
	blt _08040794
	ldr r3, _08040748  @ gBmMapRange
	lsls r5, r6, #2
_080406F2:
	ldr r0, [r3]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r2, r0, r4
	ldrb r0, [r2]
	cmp r0, #0x78
	bhi _0804078E
	ldr r0, _0804074C  @ gBmMapUnit
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r1, r0, r4
	ldrb r0, [r1]
	cmp r0, #0
	beq _08040750
	movs r0, #0xb
	ldrsb r0, [r7, r0]
	ldrb r1, [r1]
	str r3, [sp, #0x20]
	bl AreUnitsAllied
	lsls r0, r0, #0x18
	ldr r3, [sp, #0x20]
	cmp r0, #0
	bne _0804078E
	ldr r0, [r3]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r1, r0, r4
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r8, r0
	ble _0804078E
	ldrb r1, [r1]
	mov r8, r1
	b _0804078E
	.align 2, 0
_0804073C: .4byte gActiveUnit
_08040740: .4byte 0x00010025
_08040744: .4byte gBmMapSize
_08040748: .4byte gBmMapRange
_0804074C: .4byte gBmMapUnit
_08040750:
	ldr r0, _080407D4  @ gBmMapTerrain
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	ldr r1, [sp, #0x10]
	adds r0, r1, r0
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	ble _0804078E
	ldr r0, _080407D8  @ gBmMapMovement
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x78
	ble _0804078E
	movs r0, #0
	ldrsb r0, [r2, r0]
	cmp sl, r0
	ble _0804078E
	str r4, [sp, #8]
	str r6, [sp, #0xc]
	ldrb r2, [r2]
	mov sl, r2
_0804078E:
	subs r4, #1
	cmp r4, #0
	bge _080406F2
_08040794:
	mov r6, r9
	cmp r6, #0
	bge _080406DE
_0804079A:
	mov r0, r8
	cmp r0, #0xff
	beq _080407C0
	ldr r1, [sp, #4]
	cmp r1, r8
	bcc _080407C0
	mov r0, sl
	cmp r0, #0xff
	beq _080407C0
	mov r1, sp
	ldrh r0, [r1, #8]
	ldr r1, [sp]
	strh r0, [r1]
	mov r1, sp
	ldrh r0, [r1, #0xc]
	ldr r1, [sp]
	strh r0, [r1, #2]
	mov r1, r8
	str r1, [sp, #4]
_080407C0:
	ldr r4, [sp, #0x18]
	ldr r0, [sp, #0x1c]
	cmp r4, r0
	bge _080407CA
	b _080406A2
_080407CA:
	ldr r1, [sp, #4]
	cmp r1, #0xff
	bne _080407DC
	movs r0, #0
	b _080407DE
	.align 2, 0
_080407D4: .4byte gBmMapTerrain
_080407D8: .4byte gBmMapMovement
_080407DC:
	movs r0, #1
_080407DE:
	add sp, #0x24
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8040668

.align 2, 0
