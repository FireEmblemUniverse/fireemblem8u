	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	@ Core stuff to the AI system

	THUMB_FUNC_START sub_803D450
sub_803D450: @ 0x0803D450
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x2c
	str r0, [sp, #0x24]
	add r0, sp, #0x18
	movs r5, #0
	strb r5, [r0, #2]
	str r5, [r0, #8]
	ldr r6, _0803D4BC  @ gActiveUnit
	ldr r3, [r6]
	ldr r1, [r3, #0xc]
	movs r2, #0x80
	lsls r2, r2, #4
	ands r1, r2
	mov sl, r0
	cmp r1, #0
	beq _0803D4C4
	ldr r4, _0803D4C0  @ gBmMapMovement
	ldr r0, [r4]
	movs r1, #1
	negs r1, r1
	bl BmMapFill
	ldr r2, [r6]
	movs r0, #0x11
	ldrsb r0, [r2, r0]
	ldr r1, [r4]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	ldr r0, [r0]
	adds r0, r0, r1
	strb r5, [r0]
	ldr r1, [r6]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	ldrb r1, [r1, #0x11]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl GetRiddenBallistaAt
	adds r1, r0, #0
	cmp r1, #0
	beq _0803D4B2
	b _0803D628
_0803D4B2:
	ldr r0, [r6]
	bl TryRemoveUnitFromBallista
	b _0803D55A
	.align 2, 0
_0803D4BC: .4byte gActiveUnit
_0803D4C0: .4byte gBmMapMovement
_0803D4C4:
	ldr r0, [r3]
	ldr r1, [r3, #4]
	ldr r0, [r0, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	beq _0803D4FA
	adds r0, r3, #0
	bl GetUnitItemCount
	cmp r0, #4
	bgt _0803D4FA
	ldr r0, [r6]
	bl GenerateUnitMovementMap
	bl MarkMovementMapEdges
	bl sub_803DB60
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _0803D4FA
	movs r0, #0
	b _0803D69C
_0803D4FA:
	ldr r0, _0803D530  @ gAiState
	adds r0, #0x7b
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0803D53C
	ldr r4, _0803D534  @ gBmMapMovement
	ldr r0, [r4]
	movs r1, #1
	negs r1, r1
	bl BmMapFill
	ldr r0, _0803D538  @ gActiveUnit
	ldr r2, [r0]
	movs r0, #0x11
	ldrsb r0, [r2, r0]
	ldr r1, [r4]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	ldr r0, [r0]
	adds r0, r0, r1
	movs r1, #0
	strb r1, [r0]
	b _0803D544
	.align 2, 0
_0803D530: .4byte gAiState
_0803D534: .4byte gBmMapMovement
_0803D538: .4byte gActiveUnit
_0803D53C:
	ldr r0, _0803D6AC  @ gActiveUnit
	ldr r0, [r0]
	bl GenerateUnitMovementMap
_0803D544:
	ldr r0, _0803D6AC  @ gActiveUnit
	ldr r0, [r0]
	bl UnitHasMagicRank
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803D55A
	movs r0, #1
	negs r0, r0
	bl GenerateMagicSealMap
_0803D55A:
	ldr r0, _0803D6B0  @ gBmMapRange
	ldr r0, [r0]
	bl SetWorkingBmMap
	movs r1, #0
	mov r8, r1
	ldr r2, _0803D6AC  @ gActiveUnit
	ldr r1, [r2]
	ldrh r5, [r1, #0x1e]
	cmp r5, #0
	beq _0803D628
	mov r9, r2
_0803D572:
	mov r2, r8
	adds r2, #1
	str r2, [sp, #0x28]
	cmp r5, #0xa6
	beq _0803D60E
	mov r3, r9
	ldr r0, [r3]
	adds r1, r5, #0
	bl CanUnitUseWeapon
	adds r1, r0, #0
	lsls r1, r1, #0x18
	cmp r1, #0
	beq _0803D60E
	add r0, sp, #0xc
	mov r4, r8
	strh r4, [r0, #4]
	movs r6, #1
_0803D596:
	adds r0, r6, #0
	bl GetUnit
	adds r4, r0, #0
	cmp r4, #0
	beq _0803D608
	ldr r1, [r4]
	cmp r1, #0
	beq _0803D608
	ldr r1, [r4, #0xc]
	ldr r2, _0803D6B4  @ 0x00010025
	ands r1, r2
	cmp r1, #0
	bne _0803D608
	ldr r7, [sp, #0x24]
	bl _call_via_r7
	adds r1, r0, #0
	lsls r1, r1, #0x18
	cmp r1, #0
	beq _0803D608
	mov r1, r9
	ldr r0, [r1]
	adds r1, r4, #0
	adds r2, r5, #0
	bl AiReachesByBirdsEyeDistance
	adds r1, r0, #0
	lsls r1, r1, #0x18
	cmp r1, #0
	beq _0803D608
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_803D880
	add r1, sp, #0xc
	ldrb r0, [r4, #0xb]
	strb r0, [r1, #2]
	adds r0, r1, #0
	bl sub_803DCC4
	adds r1, r0, #0
	lsls r1, r1, #0x18
	cmp r1, #0
	beq _0803D608
	ldr r2, [sp, #0x14]
	mov r3, sl
	ldr r1, [r3, #8]
	cmp r2, r1
	bcc _0803D608
	mov r2, sl
	add r1, sp, #0xc
	ldm r1!, {r3, r4, r7}
	stm r2!, {r3, r4, r7}
	mov r7, r8
	mov r4, sl
	strh r7, [r4, #4]
_0803D608:
	adds r6, #1
	cmp r6, #0xbf
	ble _0803D596
_0803D60E:
	ldr r1, [sp, #0x28]
	mov r8, r1
	cmp r1, #4
	bgt _0803D628
	mov r2, r9
	ldr r1, [r2]
	ldr r3, [sp, #0x28]
	lsls r2, r3, #1
	adds r1, #0x1e
	adds r1, r1, r2
	ldrh r5, [r1]
	cmp r5, #0
	bne _0803D572
_0803D628:
	ldr r1, _0803D6AC  @ gActiveUnit
	ldr r1, [r1]
	ldr r2, [r1]
	ldr r3, [r1, #4]
	ldr r1, [r2, #0x28]
	ldr r2, [r3, #0x28]
	orrs r1, r2
	movs r2, #0x80
	ands r1, r2
	cmp r1, #0
	beq _0803D662
	ldr r0, [sp, #0x24]
	add r1, sp, #0xc
	bl sub_803D998
	adds r1, r0, #0
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	cmp r1, #1
	bne _0803D662
	ldr r2, [sp, #0x14]
	mov r4, sl
	ldr r1, [r4, #8]
	cmp r2, r1
	bcc _0803D662
	mov r2, sl
	add r1, sp, #0xc
	ldm r1!, {r3, r5, r7}
	stm r2!, {r3, r5, r7}
_0803D662:
	mov r2, sl
	ldr r1, [r2, #8]
	cmp r1, #0
	bne _0803D670
	ldrb r1, [r2, #2]
	cmp r1, #0
	beq _0803D69C
_0803D670:
	mov r4, sl
	ldrb r0, [r4]
	ldrb r1, [r4, #1]
	ldrb r3, [r4, #2]
	ldrb r2, [r4, #4]
	str r2, [sp]
	movs r2, #0
	str r2, [sp, #4]
	str r2, [sp, #8]
	movs r2, #1
	bl AiSetDecision
	movs r2, #4
	ldrsb r2, [r4, r2]
	movs r1, #1
	negs r1, r1
	cmp r2, r1
	beq _0803D69C
	ldr r0, _0803D6AC  @ gActiveUnit
	ldr r0, [r0]
	bl TryRemoveUnitFromBallista
_0803D69C:
	add sp, #0x2c
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0803D6AC: .4byte gActiveUnit
_0803D6B0: .4byte gBmMapRange
_0803D6B4: .4byte 0x00010025

	THUMB_FUNC_END sub_803D450

	THUMB_FUNC_START sub_803D6B8
sub_803D6B8: @ 0x0803D6B8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x2c
	str r0, [sp, #0x24]
	add r2, sp, #0x18
	movs r5, #0
	strb r5, [r2, #2]
	str r5, [r2, #8]
	ldr r6, _0803D870  @ gActiveUnit
	ldr r0, [r6]
	ldr r0, [r0, #0xc]
	movs r1, #0x80
	lsls r1, r1, #4
	ands r0, r1
	mov r8, r2
	cmp r0, #0
	beq _0803D71E
	ldr r4, _0803D874  @ gBmMapMovement
	ldr r0, [r4]
	movs r1, #1
	negs r1, r1
	bl BmMapFill
	ldr r2, [r6]
	movs r0, #0x11
	ldrsb r0, [r2, r0]
	ldr r1, [r4]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	ldr r0, [r0]
	adds r0, r0, r1
	strb r5, [r0]
	ldr r1, [r6]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	ldrb r1, [r1, #0x11]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl GetRiddenBallistaAt
	adds r1, r0, #0
	cmp r1, #0
	bne _0803D7EA
	ldr r0, [r6]
	bl TryRemoveUnitFromBallista
_0803D71E:
	ldr r0, _0803D878  @ gBmMapRange
	ldr r0, [r0]
	bl SetWorkingBmMap
	movs r1, #0
	mov r9, r1
	ldr r1, [r6]
	ldrh r5, [r1, #0x1e]
	cmp r5, #0
	beq _0803D7EA
	mov sl, r6
_0803D734:
	mov r2, r9
	adds r2, #1
	str r2, [sp, #0x28]
	cmp r5, #0xa6
	beq _0803D7D0
	mov r3, sl
	ldr r0, [r3]
	adds r1, r5, #0
	bl CanUnitUseWeapon
	adds r1, r0, #0
	lsls r1, r1, #0x18
	cmp r1, #0
	beq _0803D7D0
	add r0, sp, #0xc
	mov r4, r9
	strh r4, [r0, #4]
	movs r6, #1
_0803D758:
	adds r0, r6, #0
	bl GetUnit
	adds r4, r0, #0
	cmp r4, #0
	beq _0803D7CA
	ldr r1, [r4]
	cmp r1, #0
	beq _0803D7CA
	ldr r1, [r4, #0xc]
	ldr r2, _0803D87C  @ 0x00010025
	ands r1, r2
	cmp r1, #0
	bne _0803D7CA
	ldr r7, [sp, #0x24]
	bl _call_via_r7
	adds r1, r0, #0
	lsls r1, r1, #0x18
	cmp r1, #0
	beq _0803D7CA
	mov r1, sl
	ldr r0, [r1]
	adds r1, r4, #0
	adds r2, r5, #0
	bl AiReachesByBirdsEyeDistance
	adds r1, r0, #0
	lsls r1, r1, #0x18
	cmp r1, #0
	beq _0803D7CA
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_803D880
	add r1, sp, #0xc
	ldrb r0, [r4, #0xb]
	strb r0, [r1, #2]
	adds r0, r1, #0
	bl sub_803DCC4
	adds r1, r0, #0
	lsls r1, r1, #0x18
	cmp r1, #0
	beq _0803D7CA
	ldr r2, [sp, #0x14]
	mov r3, r8
	ldr r1, [r3, #8]
	cmp r2, r1
	bcc _0803D7CA
	mov r2, r8
	add r1, sp, #0xc
	ldm r1!, {r3, r4, r7}
	stm r2!, {r3, r4, r7}
	mov r7, r9
	mov r4, r8
	strh r7, [r4, #4]
_0803D7CA:
	adds r6, #1
	cmp r6, #0xbf
	ble _0803D758
_0803D7D0:
	ldr r1, [sp, #0x28]
	mov r9, r1
	cmp r1, #4
	bgt _0803D7EA
	mov r2, sl
	ldr r1, [r2]
	ldr r3, [sp, #0x28]
	lsls r2, r3, #1
	adds r1, #0x1e
	adds r1, r1, r2
	ldrh r5, [r1]
	cmp r5, #0
	bne _0803D734
_0803D7EA:
	ldr r1, _0803D870  @ gActiveUnit
	ldr r1, [r1]
	ldr r2, [r1]
	ldr r3, [r1, #4]
	ldr r1, [r2, #0x28]
	ldr r2, [r3, #0x28]
	orrs r1, r2
	movs r2, #0x80
	ands r1, r2
	cmp r1, #0
	beq _0803D824
	ldr r0, [sp, #0x24]
	add r1, sp, #0xc
	bl sub_803D998
	adds r1, r0, #0
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	cmp r1, #1
	bne _0803D824
	ldr r2, [sp, #0x14]
	mov r4, r8
	ldr r1, [r4, #8]
	cmp r2, r1
	bcc _0803D824
	mov r2, r8
	add r1, sp, #0xc
	ldm r1!, {r3, r5, r7}
	stm r2!, {r3, r5, r7}
_0803D824:
	mov r2, r8
	ldr r1, [r2, #8]
	cmp r1, #0
	bne _0803D832
	ldrb r1, [r2, #2]
	cmp r1, #0
	beq _0803D85E
_0803D832:
	mov r4, r8
	ldrb r0, [r4]
	ldrb r1, [r4, #1]
	ldrb r3, [r4, #2]
	ldrb r2, [r4, #4]
	str r2, [sp]
	movs r2, #0
	str r2, [sp, #4]
	str r2, [sp, #8]
	movs r2, #1
	bl AiSetDecision
	movs r2, #4
	ldrsb r2, [r4, r2]
	movs r1, #1
	negs r1, r1
	cmp r2, r1
	beq _0803D85E
	ldr r0, _0803D870  @ gActiveUnit
	ldr r0, [r0]
	bl TryRemoveUnitFromBallista
_0803D85E:
	add sp, #0x2c
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0803D870: .4byte gActiveUnit
_0803D874: .4byte gBmMapMovement
_0803D878: .4byte gBmMapRange
_0803D87C: .4byte 0x00010025

	THUMB_FUNC_END sub_803D6B8

	THUMB_FUNC_START sub_803D880
sub_803D880: @ 0x0803D880
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r4, r0, #0
	lsls r5, r1, #0x10
	lsrs r5, r5, #0x10
	ldr r0, _0803D8D0  @ gBmMapRange
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFill
	movs r6, #0x10
	ldrsb r6, [r4, r6]
	ldrb r4, [r4, #0x11]
	lsls r4, r4, #0x18
	asrs r4, r4, #0x18
	mov r8, r4
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
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0803D8D0: .4byte gBmMapRange

	THUMB_FUNC_END sub_803D880

	THUMB_FUNC_START sub_803D8D4
sub_803D8D4: @ 0x0803D8D4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	adds r5, r0, #0
	adds r4, r1, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	mov sl, r2
	bl GetUnitMovementCost
	bl SetWorkingMoveCosts
	ldr r0, _0803D98C  @ gBmMapMovement
	ldr r0, [r0]
	bl SetWorkingBmMap
	movs r0, #0x10
	ldrsb r0, [r5, r0]
	movs r1, #0x11
	ldrsb r1, [r5, r1]
	movs r3, #0xb
	ldrsb r3, [r5, r3]
	adds r2, r4, #0
	bl GenerateMovementMap
	ldr r0, _0803D990  @ gBmMapRange
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFill
	ldr r0, _0803D994  @ gBmMapSize
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r7, r0, #1
	cmp r7, #0
	blt _0803D97E
_0803D924:
	ldr r0, _0803D994  @ gBmMapSize
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r6, r0, #1
	subs r0, r7, #1
	mov r9, r0
	cmp r6, #0
	blt _0803D978
	lsls r1, r7, #0x10
	mov r8, r1
_0803D938:
	ldr r0, _0803D98C  @ gBmMapMovement
	ldr r1, [r0]
	lsls r0, r7, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, r0, r6
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _0803D972
	lsls r5, r6, #0x10
	asrs r5, r5, #0x10
	mov r0, sl
	bl GetItemMinRange
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	mov r0, sl
	bl GetItemMaxRange
	adds r3, r0, #0
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	adds r0, r5, #0
	mov r2, r8
	asrs r1, r2, #0x10
	adds r2, r4, #0
	bl MapAddInBoundedRange
_0803D972:
	subs r6, #1
	cmp r6, #0
	bge _0803D938
_0803D978:
	mov r7, r9
	cmp r7, #0
	bge _0803D924
_0803D97E:
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803D98C: .4byte gBmMapMovement
_0803D990: .4byte gBmMapRange
_0803D994: .4byte gBmMapSize

	THUMB_FUNC_END sub_803D8D4

	THUMB_FUNC_START sub_803D998
sub_803D998: @ 0x0803D998
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x18
	str r0, [sp, #0x10]
	mov r8, r1
	movs r0, #0
	mov sl, r0
	add r4, sp, #0xc
	ldr r1, _0803DA0C  @ gUnknown_080D867C
	adds r0, r4, #0
	movs r2, #3
	bl memcpy
	ldr r0, _0803DA10  @ gBmMapSize
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r7, r0, #1
	cmp r7, #0
	blt _0803DA34
_0803D9C4:
	ldr r0, _0803DA10  @ gBmMapSize
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r4, r0, #1
	subs r3, r7, #1
	mov r9, r3
	cmp r4, #0
	blt _0803DA2E
	ldr r2, _0803DA14  @ gBmMapMovement
	lsls r6, r7, #2
_0803D9D8:
	ldr r0, [r2]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _0803DA28
	adds r0, r4, #0
	adds r1, r7, #0
	str r2, [sp, #0x14]
	bl GetBallistaItemAt
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	ldr r2, [sp, #0x14]
	cmp r5, #0
	beq _0803DA18
	movs r0, #1
	add sl, r0
	ldr r0, [r2]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r4
	strb r5, [r0]
	b _0803DA28
	.align 2, 0
_0803DA0C: .4byte gUnknown_080D867C
_0803DA10: .4byte gBmMapSize
_0803DA14: .4byte gBmMapMovement
_0803DA18:
	ldr r0, [r2]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r4
	movs r3, #1
	negs r3, r3
	adds r1, r3, #0
	strb r1, [r0]
_0803DA28:
	subs r4, #1
	cmp r4, #0
	bge _0803D9D8
_0803DA2E:
	mov r7, r9
	cmp r7, #0
	bge _0803D9C4
_0803DA34:
	mov r0, sl
	cmp r0, #0
	beq _0803DAF4
	movs r0, #0
	mov r1, r8
	strb r0, [r1, #2]
	str r0, [r1, #8]
	movs r1, #0
	mov r6, sp
_0803DA46:
	mov r0, sp
	adds r0, r0, r1
	adds r0, #0xc
	ldrb r5, [r0]
	ldr r0, _0803DAE8  @ 0x0000FFFF
	mov r2, r8
	strh r0, [r2, #4]
	movs r7, #1
	adds r1, #1
	mov r9, r1
_0803DA5A:
	adds r0, r7, #0
	bl GetUnit
	adds r4, r0, #0
	cmp r4, #0
	beq _0803DAC8
	ldr r0, [r4]
	cmp r0, #0
	beq _0803DAC8
	ldr r0, [r4, #0xc]
	ldr r1, _0803DAEC  @ 0x00010025
	ands r0, r1
	cmp r0, #0
	bne _0803DAC8
	adds r0, r4, #0
	ldr r3, [sp, #0x10]
	bl _call_via_r3
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803DAC8
	ldr r0, _0803DAF0  @ gActiveUnit
	ldr r0, [r0]
	adds r1, r4, #0
	adds r2, r5, #0
	bl AiReachesByBirdsEyeDistance
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803DAC8
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_803D880
	ldrb r0, [r4, #0xb]
	strb r0, [r6, #2]
	mov r0, sp
	adds r1, r5, #0
	bl sub_803DD84
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803DAC8
	ldr r1, [sp, #8]
	mov r2, r8
	ldr r0, [r2, #8]
	cmp r1, r0
	bcc _0803DAC8
	ldrb r0, [r6]
	strb r0, [r2]
	ldrb r0, [r6, #1]
	strb r0, [r2, #1]
	ldrb r0, [r6, #2]
	strb r0, [r2, #2]
	str r1, [r2, #8]
_0803DAC8:
	adds r7, #1
	cmp r7, #0xbf
	ble _0803DA5A
	mov r1, r9
	cmp r1, #2
	ble _0803DA46
	mov r3, r8
	ldr r0, [r3, #8]
	cmp r0, #0
	bne _0803DAE2
	ldrb r0, [r3, #2]
	cmp r0, #0
	beq _0803DAF4
_0803DAE2:
	movs r0, #1
	b _0803DAF6
	.align 2, 0
_0803DAE8: .4byte 0x0000FFFF
_0803DAEC: .4byte 0x00010025
_0803DAF0: .4byte gActiveUnit
_0803DAF4:
	movs r0, #0
_0803DAF6:
	add sp, #0x18
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_803D998

	THUMB_FUNC_START sub_803DB08
sub_803DB08: @ 0x0803DB08
	push {r4, lr}
	adds r3, r0, #0
	adds r4, r1, #0
	ldr r1, _0803DB40  @ gBmMapMovement
	ldr r0, [r1]
	lsls r2, r4, #2
	adds r0, r2, r0
	ldr r0, [r0]
	adds r0, r0, r3
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x77
	bgt _0803DB3C
	ldr r0, _0803DB44  @ gBmMapUnit
	ldr r0, [r0]
	adds r0, r2, r0
	ldr r0, [r0]
	adds r0, r0, r3
	ldrb r2, [r0]
	cmp r2, #0
	beq _0803DB4C
	ldr r0, _0803DB48  @ gActiveUnitId
	ldrb r0, [r0]
	cmp r2, r0
	beq _0803DB4C
_0803DB3C:
	movs r0, #0xff
	b _0803DB58
	.align 2, 0
_0803DB40: .4byte gBmMapMovement
_0803DB44: .4byte gBmMapUnit
_0803DB48: .4byte gActiveUnitId
_0803DB4C:
	ldr r1, [r1]
	lsls r0, r4, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, r0, r3
	ldrb r0, [r0]
_0803DB58:
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_803DB08

	THUMB_FUNC_START sub_803DB60
sub_803DB60: @ 0x0803DB60
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x24
	movs r0, #0
	str r0, [sp, #0x10]
	movs r1, #0xff
	str r1, [sp, #0x14]
	movs r2, #0
	str r2, [sp, #0x18]
	ldr r0, _0803DC70  @ gBmMapSize
	movs r3, #2
	ldrsh r0, [r0, r3]
	subs r0, #1
	mov r8, r0
	cmp r0, #0
	blt _0803DC64
_0803DB86:
	ldr r0, _0803DC70  @ gBmMapSize
	movs r1, #0
	ldrsh r0, [r0, r1]
	subs r5, r0, #1
	mov r2, r8
	subs r2, #1
	str r2, [sp, #0x20]
	cmp r5, #0
	blt _0803DC5C
	mov r3, r8
	lsls r7, r3, #2
_0803DB9C:
	ldr r0, _0803DC74  @ gBmMapMovement
	ldr r0, [r0]
	adds r0, r7, r0
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _0803DC56
	ldr r0, _0803DC78  @ gBmMapUnit
	mov sl, r0
	ldr r0, [r0]
	adds r0, r7, r0
	ldr r0, [r0]
	adds r1, r0, r5
	ldrb r0, [r1]
	cmp r0, #0
	beq _0803DC56
	ldr r0, _0803DC7C  @ gActiveUnitId
	ldrb r0, [r0]
	ldrb r1, [r1]
	bl AreUnitsAllied
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq _0803DC56
	mov r1, sp
	adds r1, #0xc
	str r1, [sp, #0x1c]
	adds r0, r5, #0
	mov r1, r8
	ldr r2, _0803DC80  @ sub_803DB08
	add r3, sp, #0xc
	bl AiFindBestAdjacentPositionByFunc
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803DC56
	mov r2, sl
	ldr r0, [r2]
	adds r0, r7, r0
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r0, [r0]
	bl GetUnit
	adds r4, r0, #0
	ldr r0, _0803DC84  @ gActiveUnit
	ldr r0, [r0]
	movs r1, #0x16
	ldrsb r1, [r0, r1]
	movs r0, #0x16
	ldrsb r0, [r4, r0]
	cmp r1, r0
	blt _0803DC56
	adds r0, r4, #0
	bl AiGetUnitStealItemSlot
	lsls r6, r0, #0x18
	asrs r1, r6, #0x18
	cmp r1, #0
	blt _0803DC56
	lsls r1, r1, #1
	adds r0, r4, #0
	adds r0, #0x1e
	adds r0, r0, r1
	ldrb r0, [r0]
	bl AiGetItemStealRank
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r3, [sp, #0x14]
	cmp r3, r0
	bcc _0803DC56
	str r0, [sp, #0x14]
	add r1, sp, #0xc
	ldr r2, [sp, #0x1c]
	ldrh r0, [r2, #2]
	lsls r0, r0, #0x10
	ldrh r1, [r1]
	mov r9, r1
	mov r3, r9
	orrs r3, r0
	mov r9, r3
	mov r1, sl
	ldr r0, [r1]
	adds r0, r7, r0
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r0, [r0]
	str r0, [sp, #0x18]
	lsrs r6, r6, #0x18
	str r6, [sp, #0x10]
_0803DC56:
	subs r5, #1
	cmp r5, #0
	bge _0803DB9C
_0803DC5C:
	ldr r2, [sp, #0x20]
	mov r8, r2
	cmp r2, #0
	bge _0803DB86
_0803DC64:
	ldr r3, [sp, #0x14]
	cmp r3, #0xff
	bne _0803DC88
	movs r0, #0
	b _0803DCB0
	.align 2, 0
_0803DC70: .4byte gBmMapSize
_0803DC74: .4byte gBmMapMovement
_0803DC78: .4byte gBmMapUnit
_0803DC7C: .4byte gActiveUnitId
_0803DC80: .4byte sub_803DB08
_0803DC84: .4byte gActiveUnit
_0803DC88:
	ldr r0, _0803DCC0  @ gActiveUnit
	ldr r1, [r0]
	adds r1, #0x46
	ldrb r0, [r1]
	adds r0, #1
	movs r2, #0
	strb r0, [r1]
	mov r1, r9
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	asrs r1, r1, #0x10
	ldr r3, [sp, #0x10]
	str r3, [sp]
	str r2, [sp, #4]
	str r2, [sp, #8]
	movs r2, #3
	ldr r3, [sp, #0x18]
	bl AiSetDecision
	movs r0, #1
_0803DCB0:
	add sp, #0x24
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0803DCC0: .4byte gActiveUnit

	THUMB_FUNC_END sub_803DB60

	THUMB_FUNC_START sub_803DCC4
sub_803DCC4: @ 0x0803DCC4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r7, r0, #0
	movs r3, #0
	ldr r0, _0803DD60  @ gBmMapSize
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r5, r0, #1
	cmp r5, #0
	blt _0803DD4E
_0803DCDC:
	ldr r0, _0803DD60  @ gBmMapSize
	movs r1, #0
	ldrsh r0, [r0, r1]
	subs r4, r0, #1
	subs r0, r5, #1
	mov r8, r0
	cmp r4, #0
	blt _0803DD48
	lsls r6, r5, #2
_0803DCEE:
	ldr r0, _0803DD64  @ gBmMapMovement
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _0803DD42
	ldr r0, _0803DD68  @ gBmMapRange
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0803DD42
	ldr r0, _0803DD6C  @ gBmMapUnit
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r1, [r0]
	cmp r1, #0
	beq _0803DD2A
	ldr r0, _0803DD70  @ gActiveUnitId
	ldrb r0, [r0]
	cmp r1, r0
	bne _0803DD42
_0803DD2A:
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r7, #0
	str r3, [sp]
	bl sub_803DE5C
	ldr r3, [sp]
	cmp r0, r3
	bls _0803DD42
	strb r4, [r7]
	strb r5, [r7, #1]
	adds r3, r0, #0
_0803DD42:
	subs r4, #1
	cmp r4, #0
	bge _0803DCEE
_0803DD48:
	mov r5, r8
	cmp r5, #0
	bge _0803DCDC
_0803DD4E:
	cmp r3, #0
	beq _0803DD74
	adds r0, r7, #0
	bl sub_803DEC8
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	b _0803DD76
	.align 2, 0
_0803DD60: .4byte gBmMapSize
_0803DD64: .4byte gBmMapMovement
_0803DD68: .4byte gBmMapRange
_0803DD6C: .4byte gBmMapUnit
_0803DD70: .4byte gActiveUnitId
_0803DD74:
	movs r0, #0
_0803DD76:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_803DCC4

	THUMB_FUNC_START sub_803DD84
sub_803DD84: @ 0x0803DD84
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r7, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov r9, r1
	movs r3, #0
	ldr r0, _0803DE38  @ gBmMapSize
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r5, r0, #1
	cmp r5, #0
	blt _0803DE26
_0803DDA4:
	ldr r0, _0803DE38  @ gBmMapSize
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r4, r0, #1
	subs r0, r5, #1
	mov r8, r0
	cmp r4, #0
	blt _0803DE20
	lsls r6, r5, #2
_0803DDB6:
	ldr r0, _0803DE3C  @ gBmMapMovement
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r1, r0, r4
	ldrb r0, [r1]
	cmp r0, #0x78
	bhi _0803DE1A
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	mov r2, r9
	lsls r0, r2, #0x18
	lsrs r0, r0, #0x18
	cmp r1, r0
	bne _0803DE1A
	ldr r0, _0803DE40  @ gBmMapRange
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0803DE1A
	ldr r0, _0803DE44  @ gBmMapUnit
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r1, [r0]
	cmp r1, #0
	beq _0803DE02
	ldr r0, _0803DE48  @ gActiveUnitId
	ldrb r0, [r0]
	cmp r1, r0
	bne _0803DE1A
_0803DE02:
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r7, #0
	str r3, [sp]
	bl sub_803DE5C
	ldr r3, [sp]
	cmp r0, r3
	bls _0803DE1A
	strb r4, [r7]
	strb r5, [r7, #1]
	adds r3, r0, #0
_0803DE1A:
	subs r4, #1
	cmp r4, #0
	bge _0803DDB6
_0803DE20:
	mov r5, r8
	cmp r5, #0
	bge _0803DDA4
_0803DE26:
	cmp r3, #0
	beq _0803DE4C
	adds r0, r7, #0
	bl sub_803DEC8
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	b _0803DE4E
	.align 2, 0
_0803DE38: .4byte gBmMapSize
_0803DE3C: .4byte gBmMapMovement
_0803DE40: .4byte gBmMapRange
_0803DE44: .4byte gBmMapUnit
_0803DE48: .4byte gActiveUnitId
_0803DE4C:
	movs r0, #0
_0803DE4E:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_803DD84

	THUMB_FUNC_START sub_803DE5C
sub_803DE5C: @ 0x0803DE5C
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r5, r1, #0
	ldrb r0, [r2, #2]
	bl GetUnit
	adds r2, r0, #0
	adds r0, r6, #0
	adds r1, r5, #0
	bl sub_803E1EC
	adds r4, r0, #0
	adds r0, r6, #0
	adds r1, r5, #0
	bl sub_803E23C
	adds r4, r4, r0
	adds r0, r6, #0
	adds r1, r5, #0
	bl sub_803E27C
	adds r4, r4, r0
	ldr r0, _0803DEB8  @ gBmMapMovement
	ldr r0, [r0]
	lsls r5, r5, #2
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r6
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r4, r4, r0
	ldr r0, _0803DEBC  @ gBmMapOther
	ldr r0, [r0]
	adds r5, r5, r0
	ldr r0, [r5]
	adds r0, r0, r6
	ldrb r0, [r0]
	lsrs r0, r0, #3
	subs r4, r4, r0
	ldr r0, _0803DEC0  @ 0x7FFFFFFF
	adds r4, r4, r0
	adds r0, r4, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0803DEB8: .4byte gBmMapMovement
_0803DEBC: .4byte gBmMapOther
_0803DEC0: .4byte 0x7FFFFFFF

	THUMB_FUNC_END sub_803DE5C

	THUMB_FUNC_START sub_803DEC4
sub_803DEC4: @ 0x0803DEC4
	movs r0, #0
	bx lr

	THUMB_FUNC_END sub_803DEC4

	THUMB_FUNC_START sub_803DEC8
sub_803DEC8: @ 0x0803DEC8
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldrh r1, [r5, #4]
	ldr r0, _0803DEF0  @ 0x0000FFFF
	cmp r1, r0
	beq _0803DEF8
	ldrb r0, [r5, #2]
	bl GetUnit
	adds r1, r0, #0
	ldr r0, _0803DEF4  @ gActiveUnit
	ldr r0, [r0]
	ldrb r2, [r5]
	ldrb r3, [r5, #1]
	ldrh r4, [r5, #4]
	str r4, [sp]
	bl BattleGenerateSimulation
	b _0803DF0E
	.align 2, 0
_0803DEF0: .4byte 0x0000FFFF
_0803DEF4: .4byte gActiveUnit
_0803DEF8:
	ldr r0, _0803DF20  @ gActiveUnit
	ldr r4, [r0]
	ldrb r0, [r5, #2]
	bl GetUnit
	adds r1, r0, #0
	ldrb r2, [r5]
	ldrb r3, [r5, #1]
	adds r0, r4, #0
	bl BattleGenerateBallistaSimulation
_0803DF0E:
	adds r0, r5, #0
	bl sub_803DEC4
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803DF24
	movs r0, #0
	b _0803DF2C
	.align 2, 0
_0803DF20: .4byte gActiveUnit
_0803DF24:
	adds r0, r5, #0
	bl sub_803E178
	movs r0, #1
_0803DF2C:
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_803DEC8

	THUMB_FUNC_START sub_803DF34
sub_803DF34: @ 0x0803DF34
	push {r4, lr}
	ldr r3, _0803DF44  @ gBattleTarget
	movs r0, #0x13
	ldrsb r0, [r3, r0]
	cmp r0, #0
	bne _0803DF48
	movs r0, #0x32
	b _0803DF86
	.align 2, 0
_0803DF44: .4byte gBattleTarget
_0803DF48:
	ldr r1, _0803DF8C  @ gBattleActor
	adds r0, r1, #0
	adds r0, #0x5a
	movs r4, #0
	ldrsh r2, [r0, r4]
	adds r0, r3, #0
	adds r0, #0x5c
	movs r3, #0
	ldrsh r0, [r0, r3]
	subs r2, r2, r0
	adds r1, #0x64
	movs r4, #0
	ldrsh r0, [r1, r4]
	adds r1, r2, #0
	muls r1, r0, r1
	cmp r1, #0
	bge _0803DF6C
	movs r1, #0
_0803DF6C:
	adds r0, r1, #0
	movs r1, #0x64
	bl Div
	adds r1, r0, #0
	ldr r0, _0803DF90  @ gUnknown_030017D8
	ldr r0, [r0]
	ldrb r0, [r0]
	muls r1, r0, r1
	cmp r1, #0x28
	ble _0803DF84
	movs r1, #0x28
_0803DF84:
	adds r0, r1, #0
_0803DF86:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0803DF8C: .4byte gBattleActor
_0803DF90: .4byte gUnknown_030017D8

	THUMB_FUNC_END sub_803DF34

	THUMB_FUNC_START sub_803DF94
sub_803DF94: @ 0x0803DF94
	push {lr}
	ldr r0, _0803DFB4  @ gBattleTarget
	movs r1, #0x13
	ldrsb r1, [r0, r1]
	movs r0, #0x14
	subs r1, r0, r1
	ldr r0, _0803DFB8  @ gUnknown_030017D8
	ldr r0, [r0]
	ldrb r0, [r0, #1]
	muls r1, r0, r1
	cmp r1, #0
	bge _0803DFAE
	movs r1, #0
_0803DFAE:
	adds r0, r1, #0
	pop {r1}
	bx r1
	.align 2, 0
_0803DFB4: .4byte gBattleTarget
_0803DFB8: .4byte gUnknown_030017D8

	THUMB_FUNC_END sub_803DF94

	THUMB_FUNC_START sub_803DFBC
sub_803DFBC: @ 0x0803DFBC
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	movs r5, #0
	ldr r4, _0803E054  @ gUnknown_085A91F0
	ldrb r2, [r4]
	movs r0, #0
	ldrsb r0, [r4, r0]
	cmp r0, #0x7f
	beq _0803E038
	ldr r0, _0803E058  @ gBattleActor
	mov r9, r0
	ldr r1, _0803E05C  @ gBmMapSize
	mov r8, r1
_0803DFDA:
	mov r3, r9
	ldrb r3, [r3, #0x10]
	adds r2, r2, r3
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	ldrb r0, [r4, #1]
	mov r6, r9
	ldrb r6, [r6, #0x11]
	adds r0, r0, r6
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	ldr r0, _0803E060  @ gBmMapUnit
	ldr r1, [r0]
	lsls r0, r3, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, r0, r2
	ldrb r1, [r0]
	mov r7, r8
	movs r6, #0
	ldrsh r0, [r7, r6]
	cmp r2, r0
	bge _0803E02C
	movs r2, #2
	ldrsh r0, [r7, r2]
	cmp r3, r0
	bge _0803E02C
	cmp r1, #0
	beq _0803E02C
	mov r3, r9
	movs r0, #0xb
	ldrsb r0, [r3, r0]
	bl AreUnitsAllied
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _0803E02C
	movs r0, #2
	ldrsb r0, [r4, r0]
	adds r5, r5, r0
_0803E02C:
	adds r4, #4
	ldrb r2, [r4]
	movs r0, #0
	ldrsb r0, [r4, r0]
	cmp r0, #0x7f
	bne _0803DFDA
_0803E038:
	ldr r0, _0803E064  @ gUnknown_030017D8
	ldr r0, [r0]
	ldrb r0, [r0, #2]
	muls r5, r0, r5
	cmp r5, #0xa
	ble _0803E046
	movs r5, #0xa
_0803E046:
	adds r0, r5, #0
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0803E054: .4byte gUnknown_085A91F0
_0803E058: .4byte gBattleActor
_0803E05C: .4byte gBmMapSize
_0803E060: .4byte gBmMapUnit
_0803E064: .4byte gUnknown_030017D8

	THUMB_FUNC_END sub_803DFBC

	THUMB_FUNC_START sub_803E068
sub_803E068: @ 0x0803E068
	push {lr}
	ldr r0, _0803E094  @ gBattleTarget
	ldr r0, [r0, #4]
	ldrb r0, [r0, #4]
	bl AiGetClassRank
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _0803E098  @ gUnknown_030017D8
	ldr r2, [r1]
	adds r1, r2, #0
	adds r1, #8
	adds r1, r1, r0
	ldrb r1, [r1]
	ldrb r0, [r2, #3]
	muls r1, r0, r1
	cmp r1, #0x14
	ble _0803E08E
	movs r1, #0x14
_0803E08E:
	adds r0, r1, #0
	pop {r1}
	bx r1
	.align 2, 0
_0803E094: .4byte gBattleTarget
_0803E098: .4byte gUnknown_030017D8

	THUMB_FUNC_END sub_803E068

	THUMB_FUNC_START sub_803E09C
sub_803E09C: @ 0x0803E09C
	ldr r0, _0803E0AC  @ gRAMChapterData
	ldrh r0, [r0, #0x10]
	ldr r1, _0803E0B0  @ gUnknown_030017D8
	ldr r1, [r1]
	ldrb r1, [r1, #4]
	muls r0, r1, r0
	bx lr
	.align 2, 0
_0803E0AC: .4byte gRAMChapterData
_0803E0B0: .4byte gUnknown_030017D8

	THUMB_FUNC_END sub_803E09C

	THUMB_FUNC_START sub_803E0B4
sub_803E0B4: @ 0x0803E0B4
	push {lr}
	ldr r2, _0803E0C8  @ gBattleTarget
	adds r0, r2, #0
	adds r0, #0x48
	ldrh r0, [r0]
	cmp r0, #0
	bne _0803E0CC
	movs r0, #0xa
	negs r0, r0
	b _0803E108
	.align 2, 0
_0803E0C8: .4byte gBattleTarget
_0803E0CC:
	adds r0, r2, #0
	adds r0, #0x5a
	movs r3, #0
	ldrsh r1, [r0, r3]
	ldr r0, _0803E10C  @ gBattleActor
	adds r0, #0x5c
	movs r3, #0
	ldrsh r0, [r0, r3]
	subs r1, r1, r0
	adds r0, r2, #0
	adds r0, #0x64
	movs r2, #0
	ldrsh r0, [r0, r2]
	muls r1, r0, r1
	cmp r1, #0
	bge _0803E0EE
	movs r1, #0
_0803E0EE:
	adds r0, r1, #0
	movs r1, #0x64
	bl Div
	adds r1, r0, #0
	ldr r0, _0803E110  @ gUnknown_030017D8
	ldr r0, [r0]
	ldrb r0, [r0, #5]
	muls r1, r0, r1
	cmp r1, #0x28
	ble _0803E106
	movs r1, #0x28
_0803E106:
	adds r0, r1, #0
_0803E108:
	pop {r1}
	bx r1
	.align 2, 0
_0803E10C: .4byte gBattleActor
_0803E110: .4byte gUnknown_030017D8

	THUMB_FUNC_END sub_803E0B4

	THUMB_FUNC_START sub_803E114
sub_803E114: @ 0x0803E114
	push {lr}
	ldr r2, _0803E144  @ gBattleActor
	movs r0, #0x11
	ldrsb r0, [r2, r0]
	ldr r1, _0803E148  @ gBmMapOther
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	lsrs r1, r0, #3
	ldr r0, _0803E14C  @ gUnknown_030017D8
	ldr r0, [r0]
	ldrb r0, [r0, #6]
	muls r1, r0, r1
	cmp r1, #0x14
	ble _0803E13E
	movs r1, #0x14
_0803E13E:
	adds r0, r1, #0
	pop {r1}
	bx r1
	.align 2, 0
_0803E144: .4byte gBattleActor
_0803E148: .4byte gBmMapOther
_0803E14C: .4byte gUnknown_030017D8

	THUMB_FUNC_END sub_803E114

	THUMB_FUNC_START sub_803E150
sub_803E150: @ 0x0803E150
	push {lr}
	ldr r0, _0803E170  @ gBattleActor
	movs r1, #0x13
	ldrsb r1, [r0, r1]
	movs r0, #0x14
	subs r1, r0, r1
	ldr r0, _0803E174  @ gUnknown_030017D8
	ldr r0, [r0]
	ldrb r0, [r0, #7]
	muls r1, r0, r1
	cmp r1, #0
	bge _0803E16A
	movs r1, #0
_0803E16A:
	adds r0, r1, #0
	pop {r1}
	bx r1
	.align 2, 0
_0803E170: .4byte gBattleActor
_0803E174: .4byte gUnknown_030017D8

	THUMB_FUNC_END sub_803E150

	THUMB_FUNC_START sub_803E178
sub_803E178: @ 0x0803E178
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r2, _0803E1D4  @ gUnknown_030017D8
	ldr r0, _0803E1D8  @ gAiState
	adds r0, #0x7d
	ldrb r1, [r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _0803E1DC  @ gAiCombatScoreCoefficientTable
	adds r0, r0, r1
	str r0, [r2]
	bl sub_803DF34
	adds r4, r0, #0
	adds r5, r4, #0
	bl sub_803DF94
	adds r4, r4, r0
	bl sub_803DFBC
	adds r4, r4, r0
	bl sub_803E068
	adds r4, r4, r0
	bl sub_803E09C
	adds r4, r4, r0
	bl sub_803E0B4
	subs r4, r4, r0
	bl sub_803E114
	subs r4, r4, r0
	bl sub_803E150
	subs r4, r4, r0
	cmp r4, #0
	bge _0803E1C8
	movs r4, #0
_0803E1C8:
	cmp r4, #0
	beq _0803E1E0
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r4, r0, #3
	b _0803E1E2
	.align 2, 0
_0803E1D4: .4byte gUnknown_030017D8
_0803E1D8: .4byte gAiState
_0803E1DC: .4byte gAiCombatScoreCoefficientTable
_0803E1E0:
	adds r4, r5, #0
_0803E1E2:
	str r4, [r6, #8]
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_803E178

	THUMB_FUNC_START sub_803E1EC
sub_803E1EC: @ 0x0803E1EC
	push {r4, r5, lr}
	movs r4, #0x10
	ldrsb r4, [r2, r4]
	subs r3, r4, r0
	cmp r3, #0
	bge _0803E1FA
	subs r3, r0, r4
_0803E1FA:
	movs r0, #0x11
	ldrsb r0, [r2, r0]
	subs r4, r0, r1
	cmp r4, #0
	blt _0803E208
	adds r5, r3, r4
	b _0803E20C
_0803E208:
	subs r0, r1, r0
	adds r5, r3, r0
_0803E20C:
	adds r0, r2, #0
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0
	beq _0803E232
	adds r0, r4, #0
	bl GetItemMaxRange
	cmp r5, r0
	bgt _0803E22E
	adds r0, r4, #0
	bl GetItemMinRange
	cmp r5, r0
	bge _0803E232
_0803E22E:
	movs r0, #0x32
	b _0803E234
_0803E232:
	movs r0, #0
_0803E234:
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_803E1EC

	THUMB_FUNC_START sub_803E23C
sub_803E23C: @ 0x0803E23C
	ldr r2, _0803E274  @ gBmMapTerrain
	ldr r2, [r2]
	lsls r1, r1, #2
	adds r1, r1, r2
	ldr r1, [r1]
	adds r1, r1, r0
	ldrb r3, [r1]
	ldr r0, _0803E278  @ gActiveUnit
	ldr r0, [r0]
	ldr r2, [r0, #4]
	ldr r0, [r2, #0x44]
	adds r0, r0, r3
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldr r1, [r2, #0x48]
	adds r1, r1, r3
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, r0, r1
	ldr r1, [r2, #0x4c]
	adds r1, r1, r3
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, r0, r1
	bx lr
	.align 2, 0
_0803E274: .4byte gBmMapTerrain
_0803E278: .4byte gActiveUnit

	THUMB_FUNC_END sub_803E23C

	THUMB_FUNC_START sub_803E27C
sub_803E27C: @ 0x0803E27C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r7, r0, #0
	adds r6, r1, #0
	movs r5, #0
	ldr r4, _0803E2CC  @ gUnknown_085A9254
	movs r1, #0
	ldrsh r0, [r4, r1]
	ldr r1, _0803E2D0  @ 0x0000270F
	cmp r0, r1
	beq _0803E2E8
	mov r8, r1
_0803E296:
	movs r2, #2
	ldrsh r0, [r4, r2]
	adds r0, r6, r0
	ldr r1, _0803E2D4  @ gBmMapUnit
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r2, #0
	ldrsh r1, [r4, r2]
	ldr r0, [r0]
	adds r1, r7, r1
	adds r1, r0, r1
	ldrb r0, [r1]
	cmp r0, #0
	beq _0803E2DE
	ldr r0, _0803E2D8  @ gActiveUnitId
	ldrb r0, [r0]
	ldrb r1, [r1]
	bl AreUnitsAllied
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _0803E2DC
	adds r5, #5
	b _0803E2DE
	.align 2, 0
_0803E2CC: .4byte gUnknown_085A9254
_0803E2D0: .4byte 0x0000270F
_0803E2D4: .4byte gBmMapUnit
_0803E2D8: .4byte gActiveUnitId
_0803E2DC:
	subs r5, #5
_0803E2DE:
	adds r4, #4
	movs r1, #0
	ldrsh r0, [r4, r1]
	cmp r0, r8
	bne _0803E296
_0803E2E8:
	adds r0, r5, #0
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_803E27C

	THUMB_FUNC_START AiInitDangerMap
AiInitDangerMap: @ 0x0803E2F4
	push {lr}
	ldr r0, _0803E318  @ gAiState
	adds r1, r0, #0
	adds r1, #0x7a
	ldrb r0, [r1]
	cmp r0, #0
	bne _0803E314
	movs r0, #1
	strb r0, [r1]
	ldr r0, _0803E31C  @ gBmMapOther
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFill
	bl sub_803E320
_0803E314:
	pop {r0}
	bx r0
	.align 2, 0
_0803E318: .4byte gAiState
_0803E31C: .4byte gBmMapOther

	THUMB_FUNC_END AiInitDangerMap

	THUMB_FUNC_START sub_803E320
sub_803E320: @ 0x0803E320
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	movs r0, #0
	mov r8, r0
	mov r9, r0
	movs r4, #1
_0803E332:
	adds r0, r4, #0
	bl GetUnit
	adds r6, r0, #0
	adds r4, #1
	mov sl, r4
	cmp r6, #0
	beq _0803E41C
	ldr r0, [r6]
	cmp r0, #0
	beq _0803E41C
	ldr r0, [r6, #0xc]
	ldr r1, _0803E430  @ 0x0001000D
	ands r0, r1
	cmp r0, #0
	bne _0803E41C
	ldr r0, _0803E434  @ gActiveUnitId
	ldrb r0, [r0]
	movs r1, #0xb
	ldrsb r1, [r6, r1]
	bl AreUnitsAllied
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0803E41C
	movs r5, #0
	ldrh r4, [r6, #0x1e]
	cmp r4, #0
	beq _0803E3A6
_0803E36C:
	adds r0, r6, #0
	adds r1, r4, #0
	bl CanUnitUseWeapon
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803E392
	adds r0, r4, #0
	bl GetItemMight
	cmp r0, r9
	ble _0803E392
	mov r8, r4
	mov r0, r8
	bl GetItemMight
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r9, r0
_0803E392:
	adds r5, #1
	cmp r5, #4
	bgt _0803E3A6
	lsls r1, r5, #1
	adds r0, r6, #0
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r4, [r0]
	cmp r4, #0
	bne _0803E36C
_0803E3A6:
	mov r1, r8
	cmp r1, #0
	beq _0803E41C
	ldr r0, _0803E438  @ gActiveUnit
	ldr r0, [r0]
	adds r1, r6, #0
	mov r2, r8
	bl AiCouldReachByBirdsEyeDistance
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803E41C
	adds r0, r6, #0
	mov r1, r8
	bl FillMovementAndRangeMapForItem
	ldr r0, _0803E43C  @ gBmMapSize
	movs r2, #2
	ldrsh r0, [r0, r2]
	subs r1, r0, #1
	cmp r1, #0
	blt _0803E41C
_0803E3D2:
	ldr r0, _0803E43C  @ gBmMapSize
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r4, r0, #1
	subs r7, r1, #1
	cmp r4, #0
	blt _0803E416
	lsls r5, r1, #2
_0803E3E2:
	ldr r0, _0803E440  @ gBmMapRange
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0803E410
	adds r0, r6, #0
	bl GetUnitPower
	ldr r1, _0803E444  @ gBmMapOther
	ldr r1, [r1]
	adds r1, r5, r1
	ldr r1, [r1]
	adds r1, r1, r4
	add r0, r9
	asrs r0, r0, #1
	ldrb r2, [r1]
	adds r0, r0, r2
	strb r0, [r1]
_0803E410:
	subs r4, #1
	cmp r4, #0
	bge _0803E3E2
_0803E416:
	adds r1, r7, #0
	cmp r1, #0
	bge _0803E3D2
_0803E41C:
	mov r4, sl
	cmp r4, #0xbf
	ble _0803E332
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803E430: .4byte 0x0001000D
_0803E434: .4byte gActiveUnitId
_0803E438: .4byte gActiveUnit
_0803E43C: .4byte gBmMapSize
_0803E440: .4byte gBmMapRange
_0803E444: .4byte gBmMapOther

	THUMB_FUNC_END sub_803E320

	THUMB_FUNC_START sub_803E448
sub_803E448: @ 0x0803E448
	push {lr}
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	ldr r3, _0803E464  @ gBmMapOther
	ldr r3, [r3]
	lsls r1, r1, #2
	adds r1, r1, r3
	ldr r1, [r1]
	adds r1, r1, r0
	ldrb r0, [r1]
	cmp r0, r2
	bhi _0803E468
	movs r0, #1
	b _0803E46A
	.align 2, 0
_0803E464: .4byte gBmMapOther
_0803E468:
	movs r0, #0
_0803E46A:
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_803E448

	THUMB_FUNC_START AiTryGetNearestHealPoint
AiTryGetNearestHealPoint: @ 0x0803E470
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov r8, r0
	ldr r0, _0803E534  @ 0x00002710
	str r0, [sp]
	movs r1, #0xff
	mov r9, r1
	ldr r0, _0803E538  @ gActiveUnit
	ldr r2, [r0]
	adds r0, r2, #0
	adds r0, #0x40
	ldrh r1, [r0]
	movs r3, #0x80
	lsls r3, r3, #6
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	beq _0803E49E
	b _0803E62C
_0803E49E:
	ldr r0, [r2]
	ldr r1, [r2, #4]
	ldr r0, [r0, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	ands r0, r3
	cmp r0, #0
	beq _0803E4B0
	b _0803E62C
_0803E4B0:
	adds r0, r2, #0
	movs r1, #0x7c
	bl GenerateUnitMovementMapExt
	ldr r0, _0803E53C  @ gBmMapSize
	movs r2, #2
	ldrsh r0, [r0, r2]
	subs r7, r0, #1
	cmp r7, #0
	bge _0803E4C6
	b _0803E5E0
_0803E4C6:
	ldr r0, _0803E53C  @ gBmMapSize
	movs r3, #0
	ldrsh r0, [r0, r3]
	subs r4, r0, #1
	subs r0, r7, #1
	mov sl, r0
	cmp r4, #0
	bge _0803E4D8
	b _0803E5D8
_0803E4D8:
	lsls r5, r7, #2
_0803E4DA:
	ldr r0, _0803E540  @ gBmMapMovement
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _0803E5D0
	ldr r0, _0803E544  @ gBmMapTerrain
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r1, [r0]
	ldr r0, _0803E548  @ gUnknown_085A92B8
	bl AiIsInByteList
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0803E554
	ldr r6, _0803E54C  @ gBmMapUnit
	ldr r0, [r6]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r1, r0, r4
	ldrb r0, [r1]
	cmp r0, #0
	beq _0803E5D0
	ldr r0, _0803E550  @ gActiveUnitId
	ldrb r0, [r0]
	ldrb r1, [r1]
	bl AreUnitsAllied
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803E5D0
	ldr r0, [r6]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	bl GetUnit
	adds r2, r0, #0
	b _0803E594
	.align 2, 0
_0803E534: .4byte 0x00002710
_0803E538: .4byte gActiveUnit
_0803E53C: .4byte gBmMapSize
_0803E540: .4byte gBmMapMovement
_0803E544: .4byte gBmMapTerrain
_0803E548: .4byte gUnknown_085A92B8
_0803E54C: .4byte gBmMapUnit
_0803E550: .4byte gActiveUnitId
_0803E554:
	ldr r6, _0803E620  @ gBmMapUnit
	ldr r0, [r6]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r1, r0, r4
	ldrb r0, [r1]
	cmp r0, #0
	beq _0803E59E
	ldr r0, _0803E624  @ gActiveUnitId
	ldrb r0, [r0]
	ldrb r1, [r1]
	bl AreUnitsAllied
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803E5D0
	ldr r0, [r6]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	bl GetUnit
	adds r2, r0, #0
	adds r0, #0x40
	ldrh r0, [r0]
	movs r3, #0x80
	lsls r3, r3, #6
	adds r1, r3, #0
	ands r0, r1
	cmp r0, #0
	beq _0803E59E
_0803E594:
	ldrb r1, [r2, #0xa]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _0803E5D0
_0803E59E:
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	lsls r1, r7, #0x10
	asrs r1, r1, #0x10
	bl AiCountNearbyEnemyUnits
	adds r2, r0, #0
	ldr r0, [sp]
	cmp r2, r0
	bgt _0803E5D0
	ldr r0, _0803E628  @ gBmMapMovement
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r1, r0, r4
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, r9
	bgt _0803E5D0
	str r2, [sp]
	ldrb r1, [r1]
	mov r9, r1
	mov r1, r8
	strh r4, [r1]
	strh r7, [r1, #2]
_0803E5D0:
	subs r4, #1
	cmp r4, #0
	blt _0803E5D8
	b _0803E4DA
_0803E5D8:
	mov r7, sl
	cmp r7, #0
	blt _0803E5E0
	b _0803E4C6
_0803E5E0:
	mov r2, r9
	cmp r2, #0xff
	beq _0803E62C
	mov r3, r8
	movs r1, #2
	ldrsh r0, [r3, r1]
	ldr r1, _0803E620  @ gBmMapUnit
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r2, #0
	ldrsh r1, [r3, r2]
	ldr r0, [r0]
	adds r2, r0, r1
	ldrb r1, [r2]
	cmp r1, #0
	beq _0803E61A
	ldr r0, _0803E624  @ gActiveUnitId
	ldrb r0, [r0]
	cmp r1, r0
	beq _0803E61A
	adds r0, r1, #0
	bl GetUnit
	adds r2, r0, #0
	ldrb r1, [r2, #0xa]
	movs r0, #2
	orrs r0, r1
	strb r0, [r2, #0xa]
_0803E61A:
	movs r0, #1
	b _0803E62E
	.align 2, 0
_0803E620: .4byte gBmMapUnit
_0803E624: .4byte gActiveUnitId
_0803E628: .4byte gBmMapMovement
_0803E62C:
	movs r0, #0
_0803E62E:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END AiTryGetNearestHealPoint

	THUMB_FUNC_START UpdateAllPhaseHealingAIStatus
UpdateAllPhaseHealingAIStatus: @ 0x0803E640
	push {r4, r5, r6, lr}
	sub sp, #0xc
	ldr r0, _0803E690  @ gRAMChapterData
	ldrb r2, [r0, #0xf]
	mov r1, sp
	ldr r0, _0803E694  @ gUnknown_080D8680
	ldm r0!, {r3, r4, r5}
	stm r1!, {r3, r4, r5}
	movs r5, #0
	lsrs r0, r2, #6
	lsls r0, r0, #2
	mov r3, sp
	adds r1, r3, r0
	ldr r0, [r1]
	cmp r5, r0
	bge _0803E686
	adds r6, r1, #0
	adds r4, r2, #1
_0803E664:
	adds r0, r4, #0
	bl GetUnit
	adds r1, r0, #0
	cmp r1, #0
	beq _0803E67C
	ldr r0, [r1]
	cmp r0, #0
	beq _0803E67C
	adds r0, r1, #0
	bl AiUpdateGetUnitIsHealing
_0803E67C:
	adds r4, #1
	adds r5, #1
	ldr r0, [r6]
	cmp r5, r0
	blt _0803E664
_0803E686:
	add sp, #0xc
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0803E690: .4byte gRAMChapterData
_0803E694: .4byte gUnknown_080D8680

	THUMB_FUNC_END UpdateAllPhaseHealingAIStatus

	THUMB_FUNC_START AiUpdateGetUnitIsHealing
AiUpdateGetUnitIsHealing: @ 0x0803E698
	push {r4, r5, lr}
	adds r5, r0, #0
	bl GetUnitCurrentHp
	movs r1, #0x64
	adds r4, r0, #0
	muls r4, r1, r4
	adds r0, r5, #0
	bl GetUnitMaxHp
	adds r1, r0, #0
	adds r0, r4, #0
	bl Div
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	ldrb r3, [r5, #0xa]
	movs r0, #1
	ands r0, r3
	cmp r0, #0
	beq _0803E6E8
	ldr r2, _0803E6E4  @ gAI3HealingThresholdTable
	adds r0, r5, #0
	adds r0, #0x40
	ldrh r1, [r0]
	movs r0, #7
	ands r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r0, [r0]
	cmp r0, r4
	bhi _0803E70E
	movs r0, #0xfe
	ands r0, r3
	strb r0, [r5, #0xa]
	movs r0, #0
	b _0803E710
	.align 2, 0
_0803E6E4: .4byte gAI3HealingThresholdTable
_0803E6E8:
	ldr r2, _0803E704  @ gAI3HealingThresholdTable
	adds r0, r5, #0
	adds r0, #0x40
	ldrh r1, [r0]
	movs r0, #7
	ands r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r0, [r0, #1]
	cmp r0, r4
	bhi _0803E708
	movs r0, #0
	b _0803E710
	.align 2, 0
_0803E704: .4byte gAI3HealingThresholdTable
_0803E708:
	movs r0, #1
	orrs r0, r3
	strb r0, [r5, #0xa]
_0803E70E:
	movs r0, #1
_0803E710:
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END AiUpdateGetUnitIsHealing

	THUMB_FUNC_START AiTryHealSelf
AiTryHealSelf: @ 0x0803E718
	push {r4, r5, r6, r7, lr}
	sub sp, #0x10
	movs r6, #0
	ldr r7, _0803E794  @ gActiveUnit
_0803E720:
	ldr r0, [r7]
	lsls r1, r6, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r0, [r0]
	adds r4, r0, #0
	cmp r4, #0
	beq _0803E7C6
	adds r0, r4, #0
	bl GetItemIndex
	cmp r0, #0x6c
	beq _0803E744
	adds r0, r4, #0
	bl GetItemIndex
	cmp r0, #0x6d
	bne _0803E7C0
_0803E744:
	ldr r0, _0803E798  @ gAiState
	adds r0, #0x7b
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _0803E79C
	ldr r2, [r7]
	adds r0, r2, #0
	adds r0, #0x40
	ldrh r0, [r0]
	movs r3, #0x80
	lsls r3, r3, #6
	adds r1, r3, #0
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0
	bne _0803E79C
	add r5, sp, #0xc
	adds r0, r2, #0
	adds r1, r5, #0
	bl AiFindSafestReachableLocation
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _0803E7C0
	add r0, sp, #0xc
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r2, #2
	ldrsh r1, [r5, r2]
	lsls r2, r6, #0x18
	lsrs r2, r2, #0x18
	str r2, [sp]
	str r4, [sp, #4]
	str r4, [sp, #8]
	b _0803E7B4
	.align 2, 0
_0803E794: .4byte gActiveUnit
_0803E798: .4byte gAiState
_0803E79C:
	ldr r1, [r7]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	ldrb r1, [r1, #0x11]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	lsls r2, r6, #0x18
	lsrs r2, r2, #0x18
	str r2, [sp]
	movs r2, #0
	str r2, [sp, #4]
	str r2, [sp, #8]
_0803E7B4:
	movs r2, #6
	movs r3, #0
	bl AiSetDecision
	movs r0, #1
	b _0803E7C8
_0803E7C0:
	adds r6, #1
	cmp r6, #4
	ble _0803E720
_0803E7C6:
	movs r0, #0
_0803E7C8:
	add sp, #0x10
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END AiTryHealSelf

	THUMB_FUNC_START AiTryMoveTowardsEscape
AiTryMoveTowardsEscape: @ 0x0803E7D0
	push {r4, r5, r6, lr}
	sub sp, #0xc
	ldr r6, _0803E840  @ gActiveUnit
	ldr r0, [r6]
	movs r1, #0x7c
	bl GenerateUnitMovementMapExt
	bl GetEscapePointStructThingMaybe
	adds r4, r0, #0
	cmp r4, #0
	beq _0803E86C
	ldrb r5, [r4, #1]
	ldr r0, _0803E844  @ gBmMapMovement
	ldr r1, [r0]
	lsls r0, r5, #2
	adds r0, r0, r1
	ldrb r3, [r4]
	ldr r0, [r0]
	adds r0, r0, r3
	movs r2, #0
	ldrsb r2, [r0, r2]
	ldr r1, [r6]
	movs r0, #0x1d
	ldrsb r0, [r1, r0]
	ldr r1, [r1, #4]
	ldrb r1, [r1, #0x12]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, r0, r1
	cmp r2, r0
	bgt _0803E84C
	movs r0, #1
	str r0, [sp]
	adds r0, r3, #0
	adds r1, r5, #0
	movs r2, #0
	movs r3, #0xff
	bl AiTryMoveTowards
	ldr r1, _0803E848  @ gAiDecision
	ldrb r0, [r1, #2]
	ldrb r1, [r1, #3]
	ldrb r3, [r4]
	ldrb r2, [r4, #1]
	str r2, [sp]
	ldrb r2, [r4, #2]
	str r2, [sp, #4]
	movs r2, #0
	str r2, [sp, #8]
	movs r2, #2
	bl AiSetDecision
	movs r0, #1
	b _0803E86E
	.align 2, 0
_0803E840: .4byte gActiveUnit
_0803E844: .4byte gBmMapMovement
_0803E848: .4byte gAiDecision
_0803E84C:
	movs r0, #0
	str r0, [sp]
	adds r0, r3, #0
	adds r1, r5, #0
	movs r2, #0
	movs r3, #0xff
	bl AiTryMoveTowards
	ldr r0, _0803E868  @ gAiDecision
	ldrb r0, [r0, #0xa]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	b _0803E86E
	.align 2, 0
_0803E868: .4byte gAiDecision
_0803E86C:
	movs r0, #0
_0803E86E:
	add sp, #0xc
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	THUMB_FUNC_END AiTryMoveTowardsEscape

	THUMB_FUNC_START GetEscapePointStructThingMaybe
GetEscapePointStructThingMaybe: @ 0x0803E878
	push {r4, r5, lr}
	movs r1, #0
	movs r5, #0
	ldr r0, _0803E898  @ gRAMChapterData
	movs r2, #0xe
	ldrsb r2, [r0, r2]
	movs r4, #0xff
	ldrb r0, [r0, #0xf]
	cmp r0, #0x40
	beq _0803E8B0
	cmp r0, #0x40
	bgt _0803E89C
	cmp r0, #0
	beq _0803E8A2
	b _0803E8B8
	.align 2, 0
_0803E898: .4byte gRAMChapterData
_0803E89C:
	cmp r0, #0x80
	beq _0803E8A6
	b _0803E8B8
_0803E8A2:
	movs r0, #0
	b _0803E8F2
_0803E8A6:
	ldr r1, _0803E8AC  @ gRedAiEscapePoints
	b _0803E8B2
	.align 2, 0
_0803E8AC: .4byte gRedAiEscapePoints
_0803E8B0:
	ldr r1, _0803E8F8  @ gGreenAiEscapePoints
_0803E8B2:
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r1, [r0]
_0803E8B8:
	movs r0, #0
	lsls r0, r0, #2
	adds r1, r0, r1
	ldrb r0, [r1]
	cmp r0, #0xff
	beq _0803E8F0
	ldr r0, _0803E8FC  @ gBmMapMovement
	ldr r3, [r0]
	adds r2, r1, #0
_0803E8CA:
	ldrb r0, [r2, #1]
	lsls r0, r0, #2
	adds r0, r0, r3
	ldrb r1, [r2]
	ldr r0, [r0]
	adds r1, r0, r1
	ldrb r0, [r1]
	cmp r0, #0x78
	bhi _0803E8E8
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r4, r0
	ble _0803E8E8
	ldrb r4, [r1]
	adds r5, r2, #0
_0803E8E8:
	adds r2, #4
	ldrb r0, [r2]
	cmp r0, #0xff
	bne _0803E8CA
_0803E8F0:
	adds r0, r5, #0
_0803E8F2:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0803E8F8: .4byte gGreenAiEscapePoints
_0803E8FC: .4byte gBmMapMovement

	THUMB_FUNC_END GetEscapePointStructThingMaybe

	THUMB_FUNC_START sub_803E900
sub_803E900: @ 0x0803E900
	push {lr}
	ldr r0, _0803E92C  @ gActiveUnit
	ldr r2, [r0]
	ldr r0, [r2, #0xc]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	bne _0803E934
	ldr r0, _0803E930  @ gAiDecision
	ldrb r0, [r0]
	cmp r0, #1
	beq _0803E934
	adds r0, r2, #0
	adds r0, #0x30
	ldrb r1, [r0]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #4
	beq _0803E934
	movs r0, #1
	b _0803E936
	.align 2, 0
_0803E92C: .4byte gActiveUnit
_0803E930: .4byte gAiDecision
_0803E934:
	movs r0, #0
_0803E936:
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_803E900

	THUMB_FUNC_START sub_803E93C
sub_803E93C: @ 0x0803E93C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	ldr r5, _0803E958  @ gActiveUnit
	ldr r0, [r5]
	bl GetUnitItemCount
	adds r1, r0, #0
	cmp r1, #0
	bne _0803E95C
	movs r0, #0
	b _0803EA48
	.align 2, 0
_0803E958: .4byte gActiveUnit
_0803E95C:
	movs r7, #0
	strh r7, [r4]
	ldr r1, [r5]
	ldrh r5, [r1, #0x1e]
	cmp r5, #0
	beq _0803EA48
	adds r6, r4, #0
	movs r0, #0
	mov r8, r0
_0803E96E:
	adds r0, r5, #0
	bl GetItemAttributes
	adds r1, r0, #0
	movs r2, #5
	ands r1, r2
	cmp r1, #0
	beq _0803EA2A
	adds r0, r5, #0
	bl GetItemAttributes
	adds r1, r0, #0
	movs r2, #0x80
	lsls r2, r2, #3
	ands r1, r2
	cmp r1, #0
	bne _0803EA2A
	ldr r4, _0803EA08  @ gActiveUnit
	ldr r0, [r4]
	adds r1, r5, #0
	bl CanUnitUseWeapon
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0803E9B0
	ldr r0, [r4]
	adds r1, r5, #0
	bl CanUnitUseStaff
	adds r1, r0, #0
	lsls r1, r1, #0x18
	cmp r1, #0
	beq _0803EA2A
_0803E9B0:
	adds r0, r5, #0
	bl GetItemAttributes
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	beq _0803EA0C
	adds r0, r5, #0
	bl GetItemMinRange
	cmp r0, #1
	ble _0803E9D0
	ldrh r0, [r6]
	movs r1, #2
	orrs r0, r1
	strh r0, [r6]
_0803E9D0:
	adds r0, r5, #0
	bl GetItemMaxRange
	cmp r0, #1
	bne _0803E9E2
	ldrh r0, [r6]
	movs r1, #1
	orrs r0, r1
	strh r0, [r6]
_0803E9E2:
	adds r0, r5, #0
	bl GetItemUses
	movs r1, #0x64
	adds r4, r0, #0
	muls r4, r1, r4
	adds r0, r5, #0
	bl GetItemMaxUses
	adds r1, r0, #0
	adds r0, r4, #0
	bl Div
	adds r4, r0, #0
	cmp r4, #0xa
	bhi _0803EA1A
	ldrh r0, [r6]
	movs r1, #4
	b _0803EA16
	.align 2, 0
_0803EA08: .4byte gActiveUnit
_0803EA0C:
	adds r0, r5, #0
	bl sub_803EC18
	ldrh r0, [r6]
	movs r1, #8
_0803EA16:
	orrs r0, r1
	strh r0, [r6]
_0803EA1A:
	adds r0, r5, #0
	bl GetItemMight
	adds r1, r0, #0
	lsls r1, r1, #8
	ldrh r2, [r6]
	orrs r1, r2
	strh r1, [r6]
_0803EA2A:
	adds r6, #2
	movs r1, #2
	add r8, r1
	adds r7, #1
	cmp r7, #4
	bgt _0803EA48
	movs r1, #0
	strh r1, [r6]
	ldr r1, _0803EA54  @ gActiveUnit
	ldr r1, [r1]
	adds r1, #0x1e
	add r1, r8
	ldrh r5, [r1]
	cmp r5, #0
	bne _0803E96E
_0803EA48:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0803EA54: .4byte gActiveUnit

	THUMB_FUNC_END sub_803E93C

	THUMB_FUNC_START sub_803EA58
sub_803EA58: @ 0x0803EA58
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x18
	str r0, [sp, #4]
	str r1, [sp, #8]
	str r2, [sp, #0xc]
	str r3, [sp, #0x10]
	movs r0, #0
	ldr r1, [sp, #0x38]
	strh r0, [r1]
	ldr r2, [sp, #0x10]
	strh r0, [r2]
	ldr r3, [sp, #0xc]
	strh r0, [r3]
	ldr r0, _0803EB94  @ gBmMapOther
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFill
	movs r4, #1
_0803EA86:
	adds r0, r4, #0
	bl GetUnit
	adds r5, r0, #0
	adds r4, #1
	str r4, [sp, #0x14]
	cmp r5, #0
	beq _0803EB70
	ldr r0, [r5]
	cmp r0, #0
	beq _0803EB70
	ldr r0, [r5, #0xc]
	movs r1, #0x21
	ands r0, r1
	cmp r0, #0
	bne _0803EB70
	ldr r0, _0803EB98  @ gActiveUnitId
	ldrb r0, [r0]
	movs r1, #0xb
	ldrsb r1, [r5, r1]
	bl AreUnitsAllied
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0803EB70
	adds r0, r5, #0
	ldr r1, [sp, #4]
	ldr r2, [sp, #8]
	bl sub_803EC54
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803EB70
	adds r0, r5, #0
	bl GenerateUnitMovementMap
	ldr r4, _0803EB9C  @ gBmMapMovement
	ldr r1, [r4]
	ldr r2, [sp, #8]
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r3, [sp, #4]
	adds r0, r0, r3
	ldrb r0, [r0]
	cmp r0, #0xff
	beq _0803EB70
	adds r0, r5, #0
	mov r1, sp
	bl StoreItemAndGetUnitAttack
	adds r6, r0, #0
	mov r0, sp
	ldrh r0, [r0]
	bl GetItemMinRange
	cmp r0, #1
	ble _0803EB02
	ldr r1, [sp, #0xc]
	ldrh r0, [r1]
	adds r0, r0, r6
	strh r0, [r1]
_0803EB02:
	mov r0, sp
	ldrh r0, [r0]
	bl GetItemMaxRange
	cmp r0, #1
	bne _0803EB16
	ldr r2, [sp, #0x10]
	ldrh r0, [r2]
	adds r0, r0, r6
	strh r0, [r2]
_0803EB16:
	ldr r1, _0803EBA0  @ gBmMapSize
	movs r3, #2
	ldrsh r0, [r1, r3]
	subs r2, r0, #1
	mov sl, r1
	cmp r2, #0
	blt _0803EB70
	mov r9, r4
	ldr r0, _0803EB94  @ gBmMapOther
	mov r8, r0
_0803EB2A:
	mov r1, sl
	movs r3, #0
	ldrsh r0, [r1, r3]
	subs r3, r0, #1
	subs r7, r2, #1
	cmp r3, #0
	blt _0803EB6A
	lsls r4, r2, #2
	mov r1, r9
	mov r5, r8
	movs r0, #0xff
	mov ip, r0
_0803EB42:
	ldr r0, [r1]
	adds r0, r4, r0
	ldr r0, [r0]
	adds r0, r0, r3
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _0803EB64
	ldr r0, [r5]
	adds r0, r4, r0
	ldr r0, [r0]
	adds r2, r0, r3
	ldrb r0, [r2]
	adds r0, r0, r6
	cmp r0, #0xff
	ble _0803EB62
	mov r0, ip
_0803EB62:
	strb r0, [r2]
_0803EB64:
	subs r3, #1
	cmp r3, #0
	bge _0803EB42
_0803EB6A:
	adds r2, r7, #0
	cmp r2, #0
	bge _0803EB2A
_0803EB70:
	ldr r4, [sp, #0x14]
	cmp r4, #0xbf
	ble _0803EA86
	ldr r1, [sp, #0x10]
	ldrh r0, [r1]
	ldr r2, [sp, #0xc]
	ldrh r2, [r2]
	adds r0, r0, r2
	ldr r3, [sp, #0x38]
	strh r0, [r3]
	add sp, #0x18
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803EB94: .4byte gBmMapOther
_0803EB98: .4byte gActiveUnitId
_0803EB9C: .4byte gBmMapMovement
_0803EBA0: .4byte gBmMapSize

	THUMB_FUNC_END sub_803EA58

	THUMB_FUNC_START sub_803EBA4
sub_803EBA4: @ 0x0803EBA4
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	movs r5, #1
	negs r5, r5
	movs r4, #0
	movs r3, #0
	movs r7, #0xff
	lsls r7, r7, #8
_0803EBB4:
	ldrh r0, [r1]
	cmp r0, #0
	beq _0803EBCE
	adds r2, r0, #0
	ands r0, r6
	cmp r0, #0
	beq _0803EBCE
	adds r0, r7, #0
	ands r0, r2
	cmp r0, r4
	bls _0803EBCE
	adds r4, r0, #0
	adds r5, r3, #0
_0803EBCE:
	adds r1, #2
	adds r3, #1
	cmp r3, #4
	ble _0803EBB4
	cmp r5, #0
	ble _0803EBE4
	ldr r0, _0803EBEC  @ gActiveUnit
	ldr r0, [r0]
	adds r1, r5, #0
	bl EquipUnitItemSlot
_0803EBE4:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803EBEC: .4byte gActiveUnit

	THUMB_FUNC_END sub_803EBA4

	THUMB_FUNC_START sub_803EBF0
sub_803EBF0: @ 0x0803EBF0
	push {lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	cmn r1, r0
	beq _0803EC14
	cmp r1, r0
	bcc _0803EC0C
	movs r0, #1
	adds r1, r3, #0
	bl sub_803EBA4
	b _0803EC14
_0803EC0C:
	movs r0, #2
	adds r1, r3, #0
	bl sub_803EBA4
_0803EC14:
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_803EBF0

	THUMB_FUNC_START sub_803EC18
sub_803EC18: @ 0x0803EC18
	push {lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl GetItemIndex
	cmp r0, #0x4b
	blt _0803EC4C
	cmp r0, #0x4f
	ble _0803EC30
	cmp r0, #0x57
	beq _0803EC40
	b _0803EC4C
_0803EC30:
	ldr r0, _0803EC3C  @ gActiveUnit
	ldr r2, [r0]
	ldrb r1, [r2, #0xa]
	movs r0, #4
	b _0803EC48
	.align 2, 0
_0803EC3C: .4byte gActiveUnit
_0803EC40:
	ldr r0, _0803EC50  @ gActiveUnit
	ldr r2, [r0]
	ldrb r1, [r2, #0xa]
	movs r0, #0x10
_0803EC48:
	orrs r0, r1
	strb r0, [r2, #0xa]
_0803EC4C:
	pop {r0}
	bx r0
	.align 2, 0
_0803EC50: .4byte gActiveUnit

	THUMB_FUNC_END sub_803EC18

	THUMB_FUNC_START sub_803EC54
sub_803EC54: @ 0x0803EC54
	push {r4, r5, lr}
	adds r3, r0, #0
	adds r4, r1, #0
	movs r0, #0x1d
	ldrsb r0, [r3, r0]
	ldr r1, [r3, #4]
	ldrb r1, [r1, #0x12]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r5, r0, r1
	movs r0, #0x10
	ldrsb r0, [r3, r0]
	subs r1, r4, r0
	cmp r1, #0
	bge _0803EC74
	subs r1, r0, r4
_0803EC74:
	movs r0, #0x11
	ldrsb r0, [r3, r0]
	subs r3, r2, r0
	cmp r3, #0
	blt _0803EC82
	adds r0, r1, r3
	b _0803EC86
_0803EC82:
	subs r0, r0, r2
	adds r0, r1, r0
_0803EC86:
	cmp r5, r0
	bge _0803EC8E
	movs r0, #0
	b _0803EC90
_0803EC8E:
	movs r0, #1
_0803EC90:
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_803EC54

	THUMB_FUNC_START StoreItemAndGetUnitAttack
StoreItemAndGetUnitAttack: @ 0x0803EC98
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	bl GetUnitEquippedWeapon
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	strh r4, [r6]
	adds r0, r5, #0
	bl GetUnitPower
	adds r5, r0, #0
	adds r0, r4, #0
	bl GetItemMight
	adds r5, r5, r0
	adds r0, r5, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	THUMB_FUNC_END StoreItemAndGetUnitAttack

	THUMB_FUNC_START AiTryDanceOrStealAfterMove
AiTryDanceOrStealAfterMove: @ 0x0803ECC4
	push {r4, lr}
	ldr r4, _0803ECEC  @ gAiDecision
	ldrb r0, [r4]
	cmp r0, #2
	beq _0803ECE6
	ldrb r0, [r4, #2]
	ldrb r1, [r4, #3]
	bl sub_803ED28
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq _0803ECE6
	ldrb r0, [r4, #2]
	ldrb r1, [r4, #3]
	bl sub_803EE4C
_0803ECE6:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0803ECEC: .4byte gAiDecision

	THUMB_FUNC_END AiTryDanceOrStealAfterMove

	THUMB_FUNC_START AiTryActionAfterMove
AiTryActionAfterMove: @ 0x0803ECF0
	push {r4, lr}
	ldr r4, _0803ED24  @ gAiDecision
	ldrb r0, [r4, #2]
	ldrb r1, [r4, #3]
	bl sub_803ED28
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq _0803ED1C
	ldrb r0, [r4, #2]
	ldrb r1, [r4, #3]
	bl sub_803EE4C
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq _0803ED1C
	ldrb r0, [r4, #2]
	ldrb r1, [r4, #3]
	bl sub_803EEB0
_0803ED1C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0803ED24: .4byte gAiDecision

	THUMB_FUNC_END AiTryActionAfterMove

	THUMB_FUNC_START sub_803ED28
sub_803ED28: @ 0x0803ED28
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	mov sl, r0
	str r1, [sp, #0xc]
	movs r0, #0
	mov r8, r0
	mov r9, r0
	ldr r0, _0803EE08  @ gActiveUnit
	ldr r0, [r0]
	ldr r1, [r0]
	ldr r2, [r0, #4]
	ldr r0, [r1, #0x28]
	ldr r1, [r2, #0x28]
	orrs r0, r1
	movs r1, #0x30
	ands r0, r1
	cmp r0, #0
	beq _0803EE04
	ldr r0, _0803EE0C  @ gBmMapMovement
	ldr r0, [r0]
	movs r1, #1
	negs r1, r1
	bl BmMapFill
	mov r0, sl
	ldr r1, [sp, #0xc]
	movs r2, #1
	movs r3, #1
	bl MapAddInRange
	ldr r0, _0803EE10  @ gBmMapSize
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r1, r0, #1
	cmp r1, #0
	blt _0803EDFE
_0803ED78:
	ldr r0, _0803EE10  @ gBmMapSize
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r4, r0, #1
	subs r7, r1, #1
	cmp r4, #0
	blt _0803EDF8
	lsls r5, r1, #2
_0803ED88:
	ldr r0, _0803EE0C  @ gBmMapMovement
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _0803EDF2
	ldr r6, _0803EE14  @ gBmMapUnit
	ldr r0, [r6]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r1, r0, r4
	ldrb r0, [r1]
	cmp r0, #0
	beq _0803EDF2
	ldr r0, _0803EE18  @ gActiveUnitId
	ldrb r0, [r0]
	ldrb r1, [r1]
	bl AreUnitsAllied
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803EDF2
	ldr r0, [r6]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	bl GetUnit
	adds r2, r0, #0
	ldr r0, [r2]
	ldr r1, [r2, #4]
	ldr r0, [r0, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	movs r1, #0x30
	ands r0, r1
	cmp r0, #0
	bne _0803EDF2
	movs r0, #8
	ldrsb r0, [r2, r0]
	cmp r8, r0
	bge _0803EDF2
	ldrb r2, [r2, #8]
	mov r8, r2
	ldr r0, [r6]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	mov r9, r0
_0803EDF2:
	subs r4, #1
	cmp r4, #0
	bge _0803ED88
_0803EDF8:
	adds r1, r7, #0
	cmp r1, #0
	bge _0803ED78
_0803EDFE:
	mov r0, r8
	cmp r0, #0
	bne _0803EE1C
_0803EE04:
	movs r0, #0
	b _0803EE3A
	.align 2, 0
_0803EE08: .4byte gActiveUnit
_0803EE0C: .4byte gBmMapMovement
_0803EE10: .4byte gBmMapSize
_0803EE14: .4byte gBmMapUnit
_0803EE18: .4byte gActiveUnitId
_0803EE1C:
	mov r1, sl
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	ldr r2, [sp, #0xc]
	lsls r1, r2, #0x10
	asrs r1, r1, #0x10
	movs r2, #0
	str r2, [sp]
	str r2, [sp, #4]
	str r2, [sp, #8]
	movs r2, #7
	mov r3, r9
	bl AiSetDecision
	movs r0, #1
_0803EE3A:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_803ED28

	THUMB_FUNC_START sub_803EE4C
sub_803EE4C: @ 0x0803EE4C
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r7, r1, #0
	ldr r0, _0803EEA0  @ gActiveUnit
	ldr r0, [r0]
	ldr r1, [r0]
	ldr r2, [r0, #4]
	ldr r0, [r1, #0x28]
	ldr r1, [r2, #0x28]
	orrs r0, r1
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	beq _0803EE9C
	ldr r4, _0803EEA4  @ gBmMapMovement
	ldr r0, [r4]
	movs r5, #1
	negs r5, r5
	adds r1, r5, #0
	bl BmMapFill
	ldr r1, [r4]
	lsls r0, r7, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, r0, r6
	movs r1, #0
	strb r1, [r0]
	adds r0, r6, #0
	adds r1, r7, #0
	movs r2, #1
	movs r3, #0x78
	bl MapAddInRange
	bl sub_803DB60
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, r5
	bne _0803EEA8
_0803EE9C:
	movs r0, #0
	b _0803EEAA
	.align 2, 0
_0803EEA0: .4byte gActiveUnit
_0803EEA4: .4byte gBmMapMovement
_0803EEA8:
	movs r0, #1
_0803EEAA:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_803EE4C

	THUMB_FUNC_START sub_803EEB0
sub_803EEB0: @ 0x0803EEB0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	str r0, [sp, #0xc]
	mov sl, r1
	ldr r0, _0803EED4  @ gActiveUnit
	ldr r0, [r0]
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	cmp r7, #0
	bne _0803EF08
	b _0803EFBE
	.align 2, 0
_0803EED4: .4byte gActiveUnit
_0803EED8:
	ldr r0, _0803EF04  @ gActiveUnit
	ldr r0, [r0]
	bl GetUnitEquippedWeaponSlot
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r1, r9
	asrs r2, r1, #0x10
	mov r3, r8
	asrs r1, r3, #0x10
	ldrb r3, [r5, #0xb]
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	str r0, [sp, #8]
	adds r0, r2, #0
	movs r2, #1
	bl AiSetDecision
	movs r0, #1
	b _0803EFC0
	.align 2, 0
_0803EF04: .4byte gActiveUnit
_0803EF08:
	ldr r0, _0803EFD0  @ gBmMapMovement
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFill
	ldr r0, [sp, #0xc]
	lsls r0, r0, #0x10
	mov r9, r0
	asrs r6, r0, #0x10
	mov r1, sl
	lsls r1, r1, #0x10
	mov r8, r1
	asrs r5, r1, #0x10
	adds r0, r7, #0
	bl GetItemMinRange
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	adds r0, r7, #0
	bl GetItemMaxRange
	adds r3, r0, #0
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	adds r0, r6, #0
	adds r1, r5, #0
	adds r2, r4, #0
	bl MapAddInBoundedRange
	ldr r0, _0803EFD4  @ gBmMapSize
	movs r3, #2
	ldrsh r0, [r0, r3]
	subs r7, r0, #1
	cmp r7, #0
	blt _0803EFBE
_0803EF50:
	ldr r0, _0803EFD4  @ gBmMapSize
	movs r1, #0
	ldrsh r0, [r0, r1]
	subs r4, r0, #1
	cmp r4, #0
	blt _0803EFB8
	lsls r6, r7, #2
_0803EF5E:
	ldr r0, _0803EFD0  @ gBmMapMovement
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0803EFB2
	ldr r5, _0803EFD8  @ gBmMapUnit
	ldr r0, [r5]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r1, r0, r4
	ldrb r0, [r1]
	cmp r0, #0
	beq _0803EFB2
	ldr r0, _0803EFDC  @ gActiveUnitId
	ldrb r0, [r0]
	ldrb r1, [r1]
	bl AreUnitsAllied
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq _0803EFB2
	ldr r0, [r5]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	bl GetUnit
	adds r5, r0, #0
	ldr r0, [sp, #0xc]
	mov r1, sl
	adds r2, r5, #0
	bl sub_803E1EC
	cmp r0, #0
	bne _0803EED8
_0803EFB2:
	subs r4, #1
	cmp r4, #0
	bge _0803EF5E
_0803EFB8:
	subs r7, #1
	cmp r7, #0
	bge _0803EF50
_0803EFBE:
	movs r0, #0
_0803EFC0:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0803EFD0: .4byte gBmMapMovement
_0803EFD4: .4byte gBmMapSize
_0803EFD8: .4byte gBmMapUnit
_0803EFDC: .4byte gActiveUnitId

	THUMB_FUNC_END sub_803EEB0

	THUMB_FUNC_START sub_803EFE0
sub_803EFE0: @ 0x0803EFE0
	push {lr}
	ldr r2, _0803F008  @ gBmMapUnit
	ldr r2, [r2]
	lsls r1, r1, #2
	adds r1, r1, r2
	ldr r1, [r1]
	adds r1, r1, r0
	ldrb r1, [r1]
	cmp r1, #0
	beq _0803F002
	ldr r0, _0803F00C  @ gActiveUnitId
	ldrb r0, [r0]
	eors r0, r1
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0803F010
_0803F002:
	movs r0, #0
	b _0803F012
	.align 2, 0
_0803F008: .4byte gBmMapUnit
_0803F00C: .4byte gActiveUnitId
_0803F010:
	movs r0, #1
_0803F012:
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_803EFE0

	THUMB_FUNC_START sub_803F018
sub_803F018: @ 0x0803F018
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	movs r7, #0
	ldr r4, _0803F0B0  @ gActiveUnit
	ldr r0, [r4]
	movs r2, #0x1d
	ldrsb r2, [r0, r2]
	ldr r1, [r0, #4]
	ldrb r1, [r1, #0x12]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r2, r2, r1
	mov r3, r8
	ldrb r1, [r3]
	muls r1, r2, r1
	lsls r1, r1, #0x10
	lsrs r5, r1, #0x14
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	mov r1, r8
	ldrb r0, [r1, #1]
	cmp r0, #0
	beq _0803F0BC
	cmp r2, #0
	beq _0803F0BC
	ldr r0, [r4]
	adds r1, r5, #0
	bl sub_803D8D4
	ldr r0, _0803F0B4  @ gBmMapSize
	movs r2, #2
	ldrsh r0, [r0, r2]
	subs r5, r0, #1
	cmp r5, #0
	blt _0803F132
_0803F066:
	ldr r0, _0803F0B4  @ gBmMapSize
	movs r3, #0
	ldrsh r0, [r0, r3]
	subs r4, r0, #1
	subs r6, r5, #1
	cmp r4, #0
	blt _0803F0A6
_0803F074:
	ldr r0, _0803F0B8  @ gBmMapRange
	ldr r1, [r0]
	lsls r0, r5, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0803F0A0
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_803EFE0
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _0803F0A0
	adds r0, r7, #1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
_0803F0A0:
	subs r4, #1
	cmp r4, #0
	bge _0803F074
_0803F0A6:
	adds r5, r6, #0
	cmp r5, #0
	bge _0803F066
	b _0803F132
	.align 2, 0
_0803F0B0: .4byte gActiveUnit
_0803F0B4: .4byte gBmMapSize
_0803F0B8: .4byte gBmMapRange
_0803F0BC:
	ldr r4, _0803F14C  @ gActiveUnit
	ldr r0, [r4]
	bl GetUnitMovementCost
	bl SetWorkingMoveCosts
	ldr r0, _0803F150  @ gBmMapRange
	ldr r0, [r0]
	bl SetWorkingBmMap
	ldr r1, [r4]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	ldrb r1, [r1, #0x11]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r2, r5, #0
	movs r3, #0
	bl GenerateMovementMap
	ldr r0, _0803F154  @ gBmMapSize
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r5, r0, #1
	cmp r5, #0
	blt _0803F132
_0803F0F0:
	ldr r0, _0803F154  @ gBmMapSize
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r4, r0, #1
	subs r6, r5, #1
	cmp r4, #0
	blt _0803F12C
_0803F0FE:
	ldr r0, _0803F150  @ gBmMapRange
	ldr r1, [r0]
	lsls r0, r5, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _0803F126
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_803EFE0
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _0803F126
	adds r0, r7, #1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
_0803F126:
	subs r4, #1
	cmp r4, #0
	bge _0803F0FE
_0803F12C:
	adds r5, r6, #0
	cmp r5, #0
	bge _0803F0F0
_0803F132:
	ldr r0, _0803F158  @ gAiState
	adds r0, #0x86
	mov r3, r8
	ldrb r3, [r3, #2]
	adds r0, r0, r3
	strb r7, [r0]
	movs r0, #0
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0803F14C: .4byte gActiveUnit
_0803F150: .4byte gBmMapRange
_0803F154: .4byte gBmMapSize
_0803F158: .4byte gAiState

	THUMB_FUNC_END sub_803F018

	THUMB_FUNC_START sub_803F15C
sub_803F15C: @ 0x0803F15C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r4, r0, #0
	ldr r5, _0803F1F8  @ gActiveUnit
	ldr r0, [r5]
	movs r2, #0x1d
	ldrsb r2, [r0, r2]
	ldr r1, [r0, #4]
	ldrb r1, [r1, #0x12]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r2, r2, r1
	ldrb r1, [r4, #4]
	muls r1, r2, r1
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x14
	str r1, [sp, #4]
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sl, r0
	ldr r2, [r5]
	adds r0, r2, #0
	adds r0, #0x40
	ldrh r1, [r0]
	movs r0, #0xfe
	lsls r0, r0, #5
	ands r0, r1
	lsrs r0, r0, #8
	ldr r1, [r4]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrb r1, [r0]
	mov r8, r1
	ldrb r0, [r0, #1]
	mov r9, r0
	movs r6, #0x10
	ldrsb r6, [r2, r6]
	movs r7, #0x11
	ldrsb r7, [r2, r7]
	strb r1, [r2, #0x10]
	ldr r0, [r5]
	mov r2, r9
	strb r2, [r0, #0x11]
	ldrb r0, [r4, #5]
	cmp r0, #0
	beq _0803F200
	mov r0, sl
	cmp r0, #0
	beq _0803F200
	ldr r0, [r5]
	ldr r1, [sp, #4]
	mov r2, sl
	bl sub_803D8D4
	ldr r0, _0803F1FC  @ gBmMapRange
	ldr r1, [r0]
	mov r2, r9
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r0, [r0]
	add r0, r8
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _0803F23A
_0803F1EC:
	ldr r0, [r5]
	strb r6, [r0, #0x10]
	ldr r0, [r5]
	strb r7, [r0, #0x11]
	b _0803F304
	.align 2, 0
_0803F1F8: .4byte gActiveUnit
_0803F1FC: .4byte gBmMapRange
_0803F200:
	ldr r5, _0803F2B0  @ gActiveUnit
	ldr r0, [r5]
	bl GetUnitMovementCost
	bl SetWorkingMoveCosts
	ldr r4, _0803F2B4  @ gBmMapRange
	ldr r0, [r4]
	bl SetWorkingBmMap
	ldr r1, [r5]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	ldrb r1, [r1, #0x11]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	ldr r2, [sp, #4]
	movs r3, #0
	bl GenerateMovementMap
	ldr r1, [r4]
	mov r2, r9
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r0, [r0]
	add r0, r8
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _0803F1EC
_0803F23A:
	ldr r4, _0803F2B0  @ gActiveUnit
	ldr r0, [r4]
	strb r6, [r0, #0x10]
	ldr r0, [r4]
	strb r7, [r0, #0x11]
	ldr r0, [r4]
	bl GenerateUnitMovementMap
	ldr r0, [r4]
	bl UnitHasMagicRank
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803F25E
	movs r0, #1
	negs r0, r0
	bl GenerateMagicSealMap
_0803F25E:
	ldr r1, _0803F2B8  @ gBmMapSize
	movs r2, #2
	ldrsh r0, [r1, r2]
	subs r5, r0, #1
	cmp r5, #0
	blt _0803F2F2
_0803F26A:
	ldr r1, _0803F2B8  @ gBmMapSize
	movs r2, #0
	ldrsh r0, [r1, r2]
	subs r3, r0, #1
	subs r0, r5, #1
	mov ip, r0
	cmp r3, #0
	blt _0803F2EC
	ldr r7, _0803F2BC  @ gBmMapMovement
	ldr r6, _0803F2B4  @ gBmMapRange
	movs r2, #1
	negs r2, r2
	adds r1, r2, #0
_0803F284:
	mov r0, sl
	cmp r0, #0
	beq _0803F2C0
	ldr r0, [r7]
	lsls r2, r5, #2
	adds r0, r2, r0
	ldr r0, [r0]
	adds r4, r0, r3
	movs r0, #0
	ldrsb r0, [r4, r0]
	cmp r0, #0x77
	bgt _0803F2E4
	ldr r0, [r6]
	adds r0, r2, r0
	ldr r0, [r0]
	adds r0, r0, r3
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _0803F2E6
	b _0803F2E4
	.align 2, 0
_0803F2B0: .4byte gActiveUnit
_0803F2B4: .4byte gBmMapRange
_0803F2B8: .4byte gBmMapSize
_0803F2BC: .4byte gBmMapMovement
_0803F2C0:
	ldr r0, [r7]
	lsls r2, r5, #2
	adds r0, r2, r0
	ldr r0, [r0]
	adds r4, r0, r3
	movs r0, #0
	ldrsb r0, [r4, r0]
	cmp r0, #0x77
	bgt _0803F2E4
	ldr r0, [r6]
	adds r0, r2, r0
	ldr r0, [r0]
	adds r0, r0, r3
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x77
	ble _0803F2E6
_0803F2E4:
	strb r1, [r4]
_0803F2E6:
	subs r3, #1
	cmp r3, #0
	bge _0803F284
_0803F2EC:
	mov r5, ip
	cmp r5, #0
	bge _0803F26A
_0803F2F2:
	ldr r0, _0803F328  @ AiIsUnitEnemy
	bl sub_803D6B8
	ldr r0, _0803F32C  @ gAiDecision
	ldrb r0, [r0, #0xa]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq _0803F314
_0803F304:
	mov r0, r8
	mov r1, r9
	movs r2, #1
	str r2, [sp]
	movs r2, #0
	movs r3, #0xff
	bl AiTryMoveTowards
_0803F314:
	movs r0, #1
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0803F328: .4byte AiIsUnitEnemy
_0803F32C: .4byte gAiDecision

	THUMB_FUNC_END sub_803F15C

	THUMB_FUNC_START sub_803F330
sub_803F330: @ 0x0803F330
	ldr r1, _0803F344  @ gAiState
	ldr r0, _0803F348  @ gActiveUnit
	ldr r0, [r0]
	adds r0, #0x46
	ldrb r0, [r0]
	adds r1, #0x86
	strb r0, [r1]
	movs r0, #0
	bx lr
	.align 2, 0
_0803F344: .4byte gAiState
_0803F348: .4byte gActiveUnit

	THUMB_FUNC_END sub_803F330

	THUMB_FUNC_START sub_803F34C
sub_803F34C: @ 0x0803F34C
	push {r4, r5, lr}
	bl GetCurrentPhase
	adds r4, r0, #1
	adds r0, #0x80
	cmp r4, r0
	bge _0803F368
	adds r5, r0, #0
_0803F35C:
	adds r0, r4, #0
	bl GetUnit
	adds r4, #1
	cmp r4, r5
	blt _0803F35C
_0803F368:
	ldr r0, _0803F378  @ gAiState
	adds r0, #0x79
	movs r1, #0
	strb r1, [r0]
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0803F378: .4byte gAiState

	THUMB_FUNC_END sub_803F34C

	THUMB_FUNC_START sub_803F37C
sub_803F37C: @ 0x0803F37C
	push {r4, r5, lr}
	bl GetCurrentPhase
	adds r4, r0, #1
	adds r0, #0x80
	cmp r4, r0
	bge _0803F398
	adds r5, r0, #0
_0803F38C:
	adds r0, r4, #0
	bl GetUnit
	adds r4, #1
	cmp r4, r5
	blt _0803F38C
_0803F398:
	ldr r0, _0803F3A8  @ gAiState
	adds r0, #0x79
	movs r1, #0
	strb r1, [r0]
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0803F3A8: .4byte gAiState

	THUMB_FUNC_END sub_803F37C

	THUMB_FUNC_START sub_803F3AC
sub_803F3AC: @ 0x0803F3AC
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	ldr r7, _0803F3E0  @ gActiveUnit
	ldr r2, [r7]
	adds r0, r2, #0
	adds r0, #0x40
	ldrh r1, [r0]
	movs r0, #0xfe
	lsls r0, r0, #5
	ands r0, r1
	lsrs r3, r0, #8
	adds r5, r2, #0
	adds r5, #0x46
	ldrb r4, [r5]
	ldr r0, _0803F3E4  @ gUnknown_085A8400
	ldr r1, [r0]
	cmp r1, #0
	beq _0803F3DA
	lsls r0, r3, #2
	adds r0, r0, r1
	ldr r2, [r0]
	cmp r2, #0
	bne _0803F3E8
_0803F3DA:
	movs r0, #0
	b _0803F42A
	.align 2, 0
_0803F3E0: .4byte gActiveUnit
_0803F3E4: .4byte gUnknown_085A8400
_0803F3E8:
	lsls r0, r4, #2
	adds r3, r2, r0
	movs r0, #0
	ldrsh r1, [r3, r0]
	movs r0, #1
	negs r0, r0
	cmp r1, r0
	bne _0803F3FE
	movs r4, #0
	strb r4, [r5]
	adds r3, r2, #0
_0803F3FE:
	ldrh r0, [r3]
	strh r0, [r6]
	ldrh r0, [r3, #2]
	strh r0, [r6, #2]
	movs r1, #2
	ldrsh r0, [r3, r1]
	ldr r1, _0803F430  @ gBmMapMovement
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r2, #0
	ldrsh r1, [r3, r2]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0xff
	beq _0803F428
	adds r4, #1
	ldr r0, [r7]
	adds r0, #0x46
	strb r4, [r0]
_0803F428:
	movs r0, #1
_0803F42A:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0803F430: .4byte gBmMapMovement

	THUMB_FUNC_END sub_803F3AC

	THUMB_FUNC_START sub_803F434
sub_803F434: @ 0x0803F434
	push {r4, lr}
	sub sp, #8
	ldr r4, _0803F464  @ gActiveUnit
	ldr r0, [r4]
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #0
	beq _0803F46C
	ldr r0, [r4]
	bl FillMovementAndRangeMapForItem
	bl AiCountEnemyUnitsInRange
	adds r1, r0, #0
	cmp r1, #0
	beq _0803F472
	ldr r0, _0803F468  @ gAiState
	adds r0, #0x86
	strb r1, [r0]
	movs r0, #0
	b _0803F49C
	.align 2, 0
_0803F464: .4byte gActiveUnit
_0803F468: .4byte gAiState
_0803F46C:
	ldr r0, [r4]
	bl GenerateUnitMovementMap
_0803F472:
	add r4, sp, #4
	adds r0, r4, #0
	bl sub_803F3AC
	lsls r0, r0, #0x18
	asrs r2, r0, #0x18
	cmp r2, #1
	beq _0803F486
	movs r0, #0
	b _0803F49C
_0803F486:
	add r0, sp, #4
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r3, #2
	ldrsh r1, [r4, r3]
	str r2, [sp]
	movs r2, #0
	movs r3, #0xff
	bl AiTryMoveTowards
	movs r0, #1
_0803F49C:
	add sp, #8
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_803F434

	THUMB_FUNC_START sub_803F4A4
sub_803F4A4: @ 0x0803F4A4
	push {lr}
	adds r1, r0, #0
	ldr r0, _0803F4D0  @ gActiveUnit
	ldr r0, [r0]
	ldrb r2, [r0, #0x10]
	ldrb r3, [r0, #0x11]
	ldrb r0, [r1]
	cmp r0, r2
	bhi _0803F4D8
	ldrb r0, [r1, #2]
	cmp r0, r2
	bcc _0803F4D8
	ldrb r0, [r1, #1]
	cmp r0, r3
	bhi _0803F4D8
	ldrb r0, [r1, #3]
	cmp r0, r3
	bcc _0803F4D8
	ldr r0, _0803F4D4  @ gAiState
	adds r0, #0x86
	movs r1, #1
	b _0803F4DE
	.align 2, 0
_0803F4D0: .4byte gActiveUnit
_0803F4D4: .4byte gAiState
_0803F4D8:
	ldr r0, _0803F4E8  @ gAiState
	adds r0, #0x86
	movs r1, #0
_0803F4DE:
	strb r1, [r0]
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0
_0803F4E8: .4byte gAiState

	THUMB_FUNC_END sub_803F4A4

	THUMB_FUNC_START sub_803F4EC
sub_803F4EC: @ 0x0803F4EC
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	ldrb r0, [r4]
	bl GetUnitFromCharId
	ldrb r5, [r0, #0xb]
	ldrb r0, [r4, #1]
	bl GetUnitFromCharId
	ldrb r3, [r0, #0xb]
	movs r0, #0xff
	str r0, [sp]
	movs r0, #8
	movs r1, #0
	adds r2, r5, #0
	bl AiUpdateDecision
	movs r0, #1
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_803F4EC

	THUMB_FUNC_START sub_803F51C
sub_803F51C: @ 0x0803F51C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	movs r5, #0
	ldr r7, _0803F554  @ gActiveUnitId
	ldrb r0, [r7]
	mov r8, r0
	ldr r4, _0803F558  @ gActiveUnit
	ldr r6, [r4]
	adds r0, r6, #0
	bl GetUnitLeaderCharId
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0
	beq _0803F5C6
	bl GetUnitFromCharId
	adds r1, r0, #0
	str r1, [r4]
	cmp r1, #0
	bne _0803F560
	str r6, [r4]
	ldr r0, _0803F55C  @ gAiState
	adds r0, #0x87
	movs r1, #1
	strb r1, [r0]
	b _0803F5C6
	.align 2, 0
_0803F554: .4byte gActiveUnitId
_0803F558: .4byte gActiveUnit
_0803F55C: .4byte gAiState
_0803F560:
	ldrb r0, [r1, #0xb]
	strb r0, [r7]
	adds r0, r1, #0
	adds r0, #0x42
	ldrb r4, [r0]
	adds r0, #1
	ldrb r7, [r0]
_0803F56E:
	bl AiTryExecScriptA
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq _0803F584
	adds r5, #1
	cmp r5, #0xff
	ble _0803F56E
	bl AiExecFallbackScriptA
_0803F584:
	ldr r1, _0803F59C  @ gAiDecision
	movs r0, #0xa
	ldrsb r0, [r1, r0]
	cmp r0, #1
	bne _0803F5A4
	ldrb r0, [r1]
	cmp r0, #1
	bne _0803F5A4
	ldr r0, _0803F5A0  @ gAiState
	ldrb r1, [r1, #6]
	adds r0, #0x86
	b _0803F5AA
	.align 2, 0
_0803F59C: .4byte gAiDecision
_0803F5A0: .4byte gAiState
_0803F5A4:
	ldr r0, _0803F5D4  @ gAiState
	adds r0, #0x86
	movs r1, #0
_0803F5AA:
	strb r1, [r0]
	bl AiClearDecision
	ldr r1, _0803F5D8  @ gActiveUnit
	ldr r0, [r1]
	adds r0, #0x42
	strb r4, [r0]
	ldr r0, [r1]
	adds r0, #0x43
	strb r7, [r0]
	ldr r0, _0803F5DC  @ gActiveUnitId
	mov r2, r8
	strb r2, [r0]
	str r6, [r1]
_0803F5C6:
	movs r0, #0
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0803F5D4: .4byte gAiState
_0803F5D8: .4byte gActiveUnit
_0803F5DC: .4byte gActiveUnitId

	THUMB_FUNC_END sub_803F51C

	THUMB_FUNC_START sub_803F5E0
sub_803F5E0: @ 0x0803F5E0
	push {lr}
	adds r2, r0, #0
	ldr r0, [r2]
	ldr r1, _0803F60C  @ gUnknown_0203AAA0
	ldrb r0, [r0, #4]
	ldrb r1, [r1]
	cmp r0, r1
	bne _0803F614
	ldr r0, _0803F610  @ gActiveUnit
	ldr r0, [r0]
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #0xb
	ldrsb r1, [r2, r1]
	bl AreUnitsAllied
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0803F614
	movs r0, #1
	b _0803F616
	.align 2, 0
_0803F60C: .4byte gUnknown_0203AAA0
_0803F610: .4byte gActiveUnit
_0803F614:
	movs r0, #0
_0803F616:
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_803F5E0

	THUMB_FUNC_START sub_803F61C
sub_803F61C: @ 0x0803F61C
	push {lr}
	ldr r2, _0803F63C  @ gUnknown_0203AAA0
	ldrb r1, [r0]
	strb r1, [r2]
	ldrb r0, [r0]
	bl AiUnitWithCharIdExists
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq _0803F644
	ldr r0, _0803F640  @ gAiState
	adds r0, #0x87
	movs r1, #1
	strb r1, [r0]
	b _0803F66C
	.align 2, 0
_0803F63C: .4byte gUnknown_0203AAA0
_0803F640: .4byte gAiState
_0803F644:
	ldr r0, _0803F674  @ sub_803F5E0
	bl sub_803D450
	ldr r0, _0803F678  @ gAiState
	adds r2, r0, #0
	adds r2, #0x86
	movs r0, #0
	strb r0, [r2]
	ldr r1, _0803F67C  @ gAiDecision
	movs r0, #0xa
	ldrsb r0, [r1, r0]
	cmp r0, #1
	bne _0803F668
	ldrb r0, [r1]
	cmp r0, #1
	bne _0803F668
	ldrb r0, [r1, #6]
	strb r0, [r2]
_0803F668:
	bl AiClearDecision
_0803F66C:
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0
_0803F674: .4byte sub_803F5E0
_0803F678: .4byte gAiState
_0803F67C: .4byte gAiDecision

	THUMB_FUNC_END sub_803F61C

	THUMB_FUNC_START sub_803F680
sub_803F680: @ 0x0803F680
	push {lr}
	movs r1, #0xb
	ldrsb r1, [r0, r1]
	ldr r0, _0803F6A8  @ gAiState
	adds r0, #0x86
	ldrb r0, [r0]
	cmp r1, r0
	bne _0803F6B0
	ldr r0, _0803F6AC  @ gActiveUnit
	ldr r0, [r0]
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl AreUnitsAllied
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0803F6B0
	movs r0, #1
	b _0803F6B2
	.align 2, 0
_0803F6A8: .4byte gAiState
_0803F6AC: .4byte gActiveUnit
_0803F6B0:
	movs r0, #0
_0803F6B2:
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_803F680

	THUMB_FUNC_START sub_803F6B8
sub_803F6B8: @ 0x0803F6B8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	ldr r0, _0803F718  @ gAiState
	adds r0, #0x86
	ldrb r0, [r0]
	bl GetUnit
	movs r2, #0x10
	ldrsb r2, [r0, r2]
	ldr r1, _0803F71C  @ gActiveUnit
	ldr r1, [r1]
	movs r3, #0x10
	ldrsb r3, [r1, r3]
	subs r7, r2, r3
	ldrb r0, [r0, #0x11]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r2, #0x11
	ldrsb r2, [r1, r2]
	subs r0, r0, r2
	mov r8, r0
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	subs r5, r0, r3
	movs r0, #0x11
	ldrsb r0, [r4, r0]
	subs r6, r0, r2
	movs r0, #0xb
	ldrsb r0, [r1, r0]
	movs r1, #0xb
	ldrsb r1, [r4, r1]
	bl AreUnitsAllied
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0803F720
	adds r0, r7, #0
	muls r0, r5, r0
	cmp r0, #0
	blt _0803F720
	mov r0, r8
	muls r0, r6, r0
	cmp r0, #0
	blt _0803F720
	movs r0, #1
	b _0803F722
	.align 2, 0
_0803F718: .4byte gAiState
_0803F71C: .4byte gActiveUnit
_0803F720:
	movs r0, #0
_0803F722:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_803F6B8

	THUMB_FUNC_START sub_803F72C
sub_803F72C: @ 0x0803F72C
	push {r4, r5, lr}
	sub sp, #4
	ldr r0, _0803F780  @ gAiState
	adds r1, r0, #0
	adds r1, #0x86
	ldrb r0, [r1]
	cmp r0, #0
	beq _0803F776
	ldrb r0, [r1]
	bl GetUnit
	adds r4, r0, #0
	ldr r0, _0803F784  @ sub_803F680
	bl sub_803D450
	ldr r5, _0803F788  @ gAiDecision
	movs r0, #0xa
	ldrsb r0, [r5, r0]
	cmp r0, #1
	beq _0803F776
	ldr r0, _0803F78C  @ sub_803F6B8
	bl sub_803D450
	movs r0, #0xa
	ldrsb r0, [r5, r0]
	cmp r0, #1
	beq _0803F776
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	movs r2, #1
	str r2, [sp]
	movs r2, #0
	movs r3, #0xff
	bl AiTryMoveTowards
_0803F776:
	movs r0, #1
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0803F780: .4byte gAiState
_0803F784: .4byte sub_803F680
_0803F788: .4byte gAiDecision
_0803F78C: .4byte sub_803F6B8

	THUMB_FUNC_END sub_803F72C

	THUMB_FUNC_START sub_803F790
sub_803F790: @ 0x0803F790
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x64
	bl NextRN_N
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r3, _0803F7C4  @ gAiState
	ldrb r2, [r4, #1]
	adds r1, r3, #0
	adds r1, #0x7c
	strb r2, [r1]
	ldrb r4, [r4]
	cmp r0, r4
	bhi _0803F7CC
	ldr r4, _0803F7C8  @ AiIsUnitEnemy
	adds r0, r4, #0
	bl sub_803FA40
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0803F7D4
	adds r0, r4, #0
	bl sub_803D450
	b _0803F7D4
	.align 2, 0
_0803F7C4: .4byte gAiState
_0803F7C8: .4byte AiIsUnitEnemy
_0803F7CC:
	adds r1, r3, #0
	adds r1, #0x79
	movs r0, #4
	strb r0, [r1]
_0803F7D4:
	movs r0, #1
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_803F790

	THUMB_FUNC_START sub_803F7DC
sub_803F7DC: @ 0x0803F7DC
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x64
	bl NextRN_N
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrb r1, [r4]
	cmp r0, r1
	bhi _0803F818
	bl AiTryDoSpecialItems
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0803F820
	movs r0, #0x64
	bl NextRN_N
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrb r4, [r4, #1]
	cmp r0, r4
	bhi _0803F820
	ldr r0, _0803F814  @ AiIsUnitEnemy
	bl sub_803D450
	b _0803F820
	.align 2, 0
_0803F814: .4byte AiIsUnitEnemy
_0803F818:
	ldr r0, _0803F828  @ gAiState
	adds r0, #0x79
	movs r1, #4
	strb r1, [r0]
_0803F820:
	movs r0, #1
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0803F828: .4byte gAiState

	THUMB_FUNC_END sub_803F7DC

	THUMB_FUNC_START sub_803F82C
sub_803F82C: @ 0x0803F82C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	ldr r0, _0803F888  @ 0x0000FFFF
	str r0, [sp, #0x10]
	str r0, [sp, #0xc]
	movs r1, #0
	mov r8, r1
	movs r2, #0xff
	mov sl, r2
	ldr r4, _0803F88C  @ gActiveUnit
	ldr r2, [r4]
	ldr r0, [r2, #0xc]
	movs r1, #0x80
	lsls r1, r1, #4
	ands r0, r1
	cmp r0, #0
	beq _0803F890
	movs r0, #0x10
	ldrsb r0, [r2, r0]
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	bl GetRiddenBallistaAt
	cmp r0, #0
	beq _0803F868
	b _0803F990
_0803F868:
	ldr r1, [r4]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	ldrb r1, [r1, #0x11]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	mov r2, r8
	str r2, [sp]
	str r2, [sp, #4]
	str r2, [sp, #8]
	movs r2, #0xa
	movs r3, #0
	bl AiSetDecision
	b _0803F990
	.align 2, 0
_0803F888: .4byte 0x0000FFFF
_0803F88C: .4byte gActiveUnit
_0803F890:
	adds r0, r2, #0
	bl InitAiMoveMapForUnit
	ldr r0, _0803F964  @ gBmMapSize
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r5, r0, #1
	cmp r5, #0
	blt _0803F918
_0803F8A2:
	ldr r0, _0803F964  @ gBmMapSize
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r4, r0, #1
	subs r0, r5, #1
	mov r9, r0
	cmp r4, #0
	blt _0803F912
	ldr r7, _0803F968  @ gBmMapMovement
	lsls r6, r5, #2
_0803F8B6:
	ldr r0, [r7]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _0803F90C
	adds r0, r4, #0
	adds r1, r5, #0
	bl GetRiddenBallistaAt
	cmp r0, #0
	beq _0803F90C
	mov r1, r8
	lsls r0, r1, #0x10
	movs r2, #0x80
	lsls r2, r2, #9
	adds r0, r0, r2
	lsrs r0, r0, #0x10
	mov r8, r0
	ldr r0, _0803F96C  @ gBmMapUnit
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0
	bne _0803F90C
	ldr r0, [r7]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r1, r0, r4
	ldrb r0, [r1]
	cmp r0, sl
	bhi _0803F90C
	adds r1, r0, #0
	mov sl, r1
	lsls r0, r4, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0xc]
	lsls r0, r5, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x10]
_0803F90C:
	subs r4, #1
	cmp r4, #0
	bge _0803F8B6
_0803F912:
	mov r5, r9
	cmp r5, #0
	bge _0803F8A2
_0803F918:
	ldr r1, [sp, #0xc]
	lsls r0, r1, #0x10
	asrs r4, r0, #0x10
	cmp r4, #0
	blt _0803F936
	ldr r2, [sp, #0x10]
	lsls r1, r2, #0x10
	asrs r1, r1, #0x10
	movs r0, #1
	str r0, [sp]
	adds r0, r4, #0
	movs r2, #0
	movs r3, #0xff
	bl AiTryMoveTowards
_0803F936:
	ldr r1, _0803F970  @ gAiDecision
	movs r0, #0xa
	ldrsb r0, [r1, r0]
	cmp r0, #1
	bne _0803F974
	ldrb r0, [r1, #2]
	cmp r0, r4
	bne _0803F990
	ldrb r1, [r1, #3]
	ldr r2, [sp, #0x10]
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	cmp r1, r0
	bne _0803F990
	movs r0, #0
	str r0, [sp]
	movs r0, #9
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl AiUpdateDecision
	b _0803F990
	.align 2, 0
_0803F964: .4byte gBmMapSize
_0803F968: .4byte gBmMapMovement
_0803F96C: .4byte gBmMapUnit
_0803F970: .4byte gAiDecision
_0803F974:
	mov r0, r8
	cmp r0, #0
	beq _0803F988
	ldr r0, _0803F984  @ gAiState
	adds r0, #0x86
	movs r1, #7
	b _0803F98E
	.align 2, 0
_0803F984: .4byte gAiState
_0803F988:
	ldr r0, _0803F9A4  @ gAiState
	adds r0, #0x86
	movs r1, #6
_0803F98E:
	strb r1, [r0]
_0803F990:
	movs r0, #1
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0803F9A4: .4byte gAiState

	THUMB_FUNC_END sub_803F82C

	THUMB_FUNC_START sub_803F9A8
sub_803F9A8: @ 0x0803F9A8
	push {lr}
	sub sp, #4
	ldrb r2, [r0]
	ldrb r1, [r0, #1]
	movs r0, #1
	str r0, [sp]
	adds r0, r2, #0
	movs r2, #0
	movs r3, #0xff
	bl AiTryMoveTowards
	movs r0, #1
	add sp, #4
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_803F9A8

	THUMB_FUNC_START sub_803F9C8
sub_803F9C8: @ 0x0803F9C8
	ldr r0, _0803F9D4  @ gAiState
	adds r0, #0x79
	movs r1, #4
	strb r1, [r0]
	movs r0, #1
	bx lr
	.align 2, 0
_0803F9D4: .4byte gAiState

	THUMB_FUNC_END sub_803F9C8

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
	bl sub_803E23C
	adds r4, r0, #0
	adds r0, r5, #0
	adds r1, r7, #0
	bl sub_803E27C
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
