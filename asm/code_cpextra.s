	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	@ Core stuff to the AI system

	THUMB_FUNC_START sub_803A71C
sub_803A71C: @ 0x0803A71C
	push {lr}
	adds r3, r0, #0
	lsls r1, r1, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #5
	bhi _0803A780
	lsls r0, r0, #2
	ldr r1, _0803A734  @ _0803A738
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0803A734: .4byte _0803A738
_0803A738: @ jump table
	.4byte _0803A750 @ case 0
	.4byte _0803A75A @ case 1
	.4byte _0803A762 @ case 2
	.4byte _0803A76A @ case 3
	.4byte _0803A772 @ case 4
	.4byte _0803A77A @ case 5
_0803A750:
	ldrb r0, [r3]
	cmp r0, r2
	bls _0803A780
_0803A756:
	movs r0, #1
	b _0803A782
_0803A75A:
	ldrb r0, [r3]
	cmp r0, r2
	bcc _0803A780
	b _0803A756
_0803A762:
	ldrb r0, [r3]
	cmp r0, r2
	bne _0803A780
	b _0803A756
_0803A76A:
	ldrb r0, [r3]
	cmp r0, r2
	bhi _0803A780
	b _0803A756
_0803A772:
	ldrb r0, [r3]
	cmp r0, r2
	bcs _0803A780
	b _0803A756
_0803A77A:
	ldrb r0, [r3]
	cmp r0, r2
	bne _0803A756
_0803A780:
	movs r0, #0
_0803A782:
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_803A71C

	THUMB_FUNC_START sub_803A788
sub_803A788: @ 0x0803A788
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r7, r0, #0
	adds r6, r1, #0
	ldr r0, _0803A824  @ gActiveUnit
	ldr r0, [r0]
	movs r4, #0x10
	ldrsb r4, [r0, r4]
	movs r5, #0x11
	ldrsb r5, [r0, r5]
	bl GetUnitMovementCost
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	bl GenerateExtendedMovementMapOnRange
	bl MarkWorkingMapEdges
	ldr r0, _0803A828  @ 0x0000FFFF
	strh r0, [r6]
	movs r5, #1
	ldr r0, _0803A82C  @ gUnknown_0203AA8A
	mov r8, r0
_0803A7BA:
	adds r0, r5, #0
	bl GetUnit
	adds r3, r0, #0
	cmp r3, #0
	beq _0803A810
	ldr r4, [r3]
	cmp r4, #0
	beq _0803A810
	movs r1, #0x11
	ldrsb r1, [r3, r1]
	ldr r0, _0803A830  @ gBmMapRange
	ldr r0, [r0]
	lsls r1, r1, #2
	adds r1, r1, r0
	movs r2, #0x10
	ldrsb r2, [r3, r2]
	ldr r0, [r1]
	adds r0, r0, r2
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _0803A810
	ldrb r0, [r4, #4]
	cmp r0, r7
	bne _0803A810
	ldr r1, [r3, #0xc]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	bne _0803A854
	movs r0, #0x20
	ands r1, r0
	cmp r1, #0
	beq _0803A804
	movs r0, #3
	mov r1, r8
	strb r0, [r1]
_0803A804:
	movs r0, #0x10
	ldrsb r0, [r3, r0]
	strh r0, [r6]
	movs r0, #0x11
	ldrsb r0, [r3, r0]
	strh r0, [r6, #2]
_0803A810:
	adds r5, #1
	cmp r5, #0xbf
	ble _0803A7BA
	movs r1, #0
	ldrsh r0, [r6, r1]
	cmp r0, #0
	blt _0803A834
	movs r0, #1
	b _0803A86A
	.align 2, 0
_0803A824: .4byte gActiveUnit
_0803A828: .4byte 0x0000FFFF
_0803A82C: .4byte gUnknown_0203AA8A
_0803A830: .4byte gBmMapRange
_0803A834:
	adds r0, r7, #0
	bl GetUnitFromCharId
	ldr r0, [r0, #0xc]
	ldr r1, _0803A84C  @ 0x0001000C
	ands r0, r1
	cmp r0, #0
	beq _0803A860
	ldr r0, _0803A850  @ gAiState
	adds r0, #0x86
	movs r1, #1
	b _0803A866
	.align 2, 0
_0803A84C: .4byte 0x0001000C
_0803A850: .4byte gAiState
_0803A854:
	ldr r0, _0803A85C  @ gAiState
	adds r0, #0x86
	movs r1, #1
	b _0803A866
	.align 2, 0
_0803A85C: .4byte gAiState
_0803A860:
	ldr r0, _0803A874  @ gAiState
	adds r0, #0x86
	movs r1, #4
_0803A866:
	strb r1, [r0]
	movs r0, #0
_0803A86A:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0803A874: .4byte gAiState

	THUMB_FUNC_END sub_803A788

	THUMB_FUNC_START sub_803A878
sub_803A878: @ 0x0803A878
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	adds r6, r1, #0
	movs r7, #0xff
	ldr r0, _0803A908  @ gActiveUnit
	ldr r0, [r0]
	movs r4, #0x10
	ldrsb r4, [r0, r4]
	movs r5, #0x11
	ldrsb r5, [r0, r5]
	bl GetUnitMovementCost
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	bl GenerateExtendedMovementMapOnRange
	ldr r0, _0803A90C  @ 0x0000FFFF
	strh r0, [r6]
	movs r4, #1
_0803A8A4:
	adds r0, r4, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq _0803A8F4
	ldr r0, [r2]
	cmp r0, #0
	beq _0803A8F4
	ldr r0, [r2, #0xc]
	ldr r1, _0803A910  @ 0x00010025
	ands r0, r1
	cmp r0, #0
	bne _0803A8F4
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	ldr r0, _0803A914  @ gBmMapRange
	ldr r0, [r0]
	lsls r1, r1, #2
	adds r1, r1, r0
	movs r3, #0x10
	ldrsb r3, [r2, r3]
	ldr r0, [r1]
	adds r1, r0, r3
	ldrb r0, [r1]
	cmp r0, #0x78
	bhi _0803A8F4
	ldr r0, [r2, #4]
	ldrb r0, [r0, #4]
	cmp r0, r8
	bne _0803A8F4
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r7, r0
	blt _0803A8F4
	ldrb r7, [r1]
	strh r3, [r6]
	movs r0, #0x11
	ldrsb r0, [r2, r0]
	strh r0, [r6, #2]
_0803A8F4:
	adds r4, #1
	cmp r4, #0xbf
	ble _0803A8A4
	movs r1, #0
	ldrsh r0, [r6, r1]
	cmp r0, #0
	bge _0803A918
	movs r0, #0
	b _0803A91A
	.align 2, 0
_0803A908: .4byte gActiveUnit
_0803A90C: .4byte 0x0000FFFF
_0803A910: .4byte 0x00010025
_0803A914: .4byte gBmMapRange
_0803A918:
	movs r0, #1
_0803A91A:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_803A878

	THUMB_FUNC_START sub_803A924
sub_803A924: @ 0x0803A924
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	str r0, [sp]
	str r1, [sp, #4]
	movs r0, #0xff
	str r0, [sp, #8]
	movs r1, #0
	str r1, [sp, #0x10]
	ldr r0, _0803A964  @ gActiveUnit
	ldr r0, [r0]
	movs r4, #0x10
	ldrsb r4, [r0, r4]
	movs r5, #0x11
	ldrsb r5, [r0, r5]
	bl GetUnitMovementCost
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	bl GenerateExtendedMovementMapOnRange
	ldr r2, _0803A968  @ 0x0000FFFF
	str r2, [sp, #0xc]
	ldr r0, _0803A96C  @ gBmMapSize
	ldrh r0, [r0, #2]
	subs r0, #1
	lsls r0, r0, #0x10
	b _0803A9FA
	.align 2, 0
_0803A964: .4byte gActiveUnit
_0803A968: .4byte 0x0000FFFF
_0803A96C: .4byte gBmMapSize
_0803A970:
	ldr r0, _0803AA0C  @ gBmMapSize
	ldrh r0, [r0]
	subs r0, #1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	lsls r4, r6, #0x10
	lsls r1, r1, #0x10
	mov r8, r1
	cmp r4, #0
	blt _0803A9F6
	mov sl, r8
	ldr r0, _0803AA10  @ gBmMapRange
	mov r9, r0
	asrs r7, r1, #0xe
_0803A98C:
	mov r1, r9
	ldr r0, [r1]
	adds r0, r7, r0
	asrs r5, r4, #0x10
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _0803A9E8
	ldr r0, _0803AA14  @ gBmMapUnit
	ldr r0, [r0]
	adds r0, r7, r0
	ldr r0, [r0]
	adds r2, r0, r5
	ldrb r1, [r2]
	cmp r1, #0
	beq _0803A9E8
	ldr r0, _0803AA18  @ gActiveUnitId
	ldrb r0, [r0]
	cmp r1, r0
	beq _0803A9E8
	adds r0, r1, #0
	bl GetUnit
	ldr r2, [sp]
	bl _call_via_r2
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803A9E8
	mov r1, r9
	ldr r0, [r1]
	adds r0, r7, r0
	ldr r0, [r0]
	adds r1, r0, r5
	ldrb r0, [r1]
	ldr r2, [sp, #8]
	cmp r0, r2
	bhi _0803A9E8
	adds r1, r0, #0
	str r1, [sp, #8]
	lsrs r4, r4, #0x10
	str r4, [sp, #0xc]
	mov r0, sl
	lsrs r0, r0, #0x10
	str r0, [sp, #0x10]
_0803A9E8:
	lsls r0, r6, #0x10
	ldr r1, _0803AA1C  @ 0xFFFF0000
	adds r0, r0, r1
	lsrs r6, r0, #0x10
	lsls r4, r6, #0x10
	cmp r4, #0
	bge _0803A98C
_0803A9F6:
	ldr r0, _0803AA1C  @ 0xFFFF0000
	add r0, r8
_0803A9FA:
	lsrs r1, r0, #0x10
	cmp r0, #0
	bge _0803A970
	ldr r2, [sp, #0xc]
	lsls r0, r2, #0x10
	cmp r0, #0
	bge _0803AA20
	movs r0, #0
	b _0803AA30
	.align 2, 0
_0803AA0C: .4byte gBmMapSize
_0803AA10: .4byte gBmMapRange
_0803AA14: .4byte gBmMapUnit
_0803AA18: .4byte gActiveUnitId
_0803AA1C: .4byte 0xFFFF0000
_0803AA20:
	mov r0, sp
	ldrh r1, [r0, #0xc]
	ldr r0, [sp, #4]
	strh r1, [r0]
	mov r2, sp
	ldrh r2, [r2, #0x10]
	strh r2, [r0, #2]
	movs r0, #1
_0803AA30:
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_803A924

	THUMB_FUNC_START sub_803AA40
sub_803AA40: @ 0x0803AA40
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	str r0, [sp]
	str r1, [sp, #4]
	movs r0, #0xff
	str r0, [sp, #8]
	movs r1, #0
	str r1, [sp, #0x10]
	ldr r0, _0803AA80  @ gActiveUnit
	ldr r0, [r0]
	movs r4, #0x10
	ldrsb r4, [r0, r4]
	movs r5, #0x11
	ldrsb r5, [r0, r5]
	bl GetUnitMovementCost
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_8040F28
	ldr r2, _0803AA84  @ 0x0000FFFF
	str r2, [sp, #0xc]
	ldr r0, _0803AA88  @ gBmMapSize
	ldrh r0, [r0, #2]
	subs r0, #1
	lsls r0, r0, #0x10
	b _0803AB16
	.align 2, 0
_0803AA80: .4byte gActiveUnit
_0803AA84: .4byte 0x0000FFFF
_0803AA88: .4byte gBmMapSize
_0803AA8C:
	ldr r0, _0803AB28  @ gBmMapSize
	ldrh r0, [r0]
	subs r0, #1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	lsls r4, r6, #0x10
	lsls r1, r1, #0x10
	mov r8, r1
	cmp r4, #0
	blt _0803AB12
	mov sl, r8
	ldr r0, _0803AB2C  @ gBmMapRange
	mov r9, r0
	asrs r7, r1, #0xe
_0803AAA8:
	mov r1, r9
	ldr r0, [r1]
	adds r0, r7, r0
	asrs r5, r4, #0x10
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _0803AB04
	ldr r0, _0803AB30  @ gBmMapUnit
	ldr r0, [r0]
	adds r0, r7, r0
	ldr r0, [r0]
	adds r2, r0, r5
	ldrb r1, [r2]
	cmp r1, #0
	beq _0803AB04
	ldr r0, _0803AB34  @ gActiveUnitId
	ldrb r0, [r0]
	cmp r1, r0
	beq _0803AB04
	adds r0, r1, #0
	bl GetUnit
	ldr r2, [sp]
	bl _call_via_r2
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803AB04
	mov r1, r9
	ldr r0, [r1]
	adds r0, r7, r0
	ldr r0, [r0]
	adds r1, r0, r5
	ldrb r0, [r1]
	ldr r2, [sp, #8]
	cmp r0, r2
	bhi _0803AB04
	adds r1, r0, #0
	str r1, [sp, #8]
	lsrs r4, r4, #0x10
	str r4, [sp, #0xc]
	mov r0, sl
	lsrs r0, r0, #0x10
	str r0, [sp, #0x10]
_0803AB04:
	lsls r0, r6, #0x10
	ldr r1, _0803AB38  @ 0xFFFF0000
	adds r0, r0, r1
	lsrs r6, r0, #0x10
	lsls r4, r6, #0x10
	cmp r4, #0
	bge _0803AAA8
_0803AB12:
	ldr r0, _0803AB38  @ 0xFFFF0000
	add r0, r8
_0803AB16:
	lsrs r1, r0, #0x10
	cmp r0, #0
	bge _0803AA8C
	ldr r2, [sp, #0xc]
	lsls r0, r2, #0x10
	cmp r0, #0
	bge _0803AB3C
	movs r0, #0
	b _0803AB4C
	.align 2, 0
_0803AB28: .4byte gBmMapSize
_0803AB2C: .4byte gBmMapRange
_0803AB30: .4byte gBmMapUnit
_0803AB34: .4byte gActiveUnitId
_0803AB38: .4byte 0xFFFF0000
_0803AB3C:
	mov r0, sp
	ldrh r1, [r0, #0xc]
	ldr r0, [sp, #4]
	strh r1, [r0]
	mov r2, sp
	ldrh r2, [r2, #0x10]
	strh r2, [r0, #2]
	movs r0, #1
_0803AB4C:
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_803AA40

	THUMB_FUNC_START sub_803AB5C
sub_803AB5C: @ 0x0803AB5C
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	sub sp, #0x14
	movs r0, #0
	mov r8, r0
	mov r9, r0
	ldr r0, _0803AB80  @ gActiveUnit
	ldr r0, [r0]
	bl GenerateUnitMovementMap
	ldr r3, _0803AB84  @ 0x0000FFFF
	ldr r0, _0803AB88  @ gBmMapSize
	ldrh r0, [r0, #2]
	subs r0, #1
	lsls r0, r0, #0x10
	b _0803ABF6
	.align 2, 0
_0803AB80: .4byte gActiveUnit
_0803AB84: .4byte 0x0000FFFF
_0803AB88: .4byte gBmMapSize
_0803AB8C:
	ldr r0, _0803AC2C  @ gBmMapSize
	ldrh r0, [r0]
	subs r0, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	lsls r4, r5, #0x10
	lsls r7, r1, #0x10
	cmp r4, #0
	blt _0803ABF2
	adds r2, r7, #0
	asrs r6, r7, #0xe
_0803ABA2:
	ldr r0, _0803AC30  @ gBmMapMovement
	ldr r0, [r0]
	adds r0, r6, r0
	asrs r1, r4, #0x10
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _0803ABE4
	ldr r0, _0803AC34  @ gBmMapUnit
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0
	bne _0803ABE4
	movs r0, #0x80
	lsls r0, r0, #1
	str r2, [sp, #0xc]
	str r3, [sp, #0x10]
	bl NextRN_N
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, [sp, #0xc]
	ldr r3, [sp, #0x10]
	cmp r0, r8
	bcc _0803ABE4
	mov r8, r0
	lsrs r3, r4, #0x10
	lsrs r1, r2, #0x10
	mov r9, r1
_0803ABE4:
	lsls r0, r5, #0x10
	ldr r1, _0803AC38  @ 0xFFFF0000
	adds r0, r0, r1
	lsrs r5, r0, #0x10
	lsls r4, r5, #0x10
	cmp r4, #0
	bge _0803ABA2
_0803ABF2:
	ldr r1, _0803AC38  @ 0xFFFF0000
	adds r0, r7, r1
_0803ABF6:
	lsrs r1, r0, #0x10
	cmp r0, #0
	bge _0803AB8C
	lsls r0, r3, #0x10
	asrs r2, r0, #0x10
	cmp r2, #0
	blt _0803AC1C
	mov r0, r9
	lsls r1, r0, #0x10
	asrs r1, r1, #0x10
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	adds r0, r2, #0
	movs r2, #0
	movs r3, #0
	bl AiSetDecision
_0803AC1C:
	add sp, #0x14
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803AC2C: .4byte gBmMapSize
_0803AC30: .4byte gBmMapMovement
_0803AC34: .4byte gBmMapUnit
_0803AC38: .4byte 0xFFFF0000

	THUMB_FUNC_END sub_803AB5C

	THUMB_FUNC_START sub_803AC3C
sub_803AC3C: @ 0x0803AC3C
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	lsls r2, r2, #0x10
	lsrs r6, r2, #0x10
	movs r1, #0x10
	ldrsb r1, [r4, r1]
	movs r0, #0x10
	ldrsb r0, [r5, r0]
	subs r3, r1, r0
	cmp r3, #0
	bge _0803AC56
	subs r3, r0, r1
_0803AC56:
	movs r2, #0x11
	ldrsb r2, [r4, r2]
	movs r1, #0x11
	ldrsb r1, [r5, r1]
	subs r0, r2, r1
	cmp r0, #0
	bge _0803AC66
	subs r0, r1, r2
_0803AC66:
	adds r5, r3, r0
	adds r0, r6, #0
	bl GetItemMaxRange
	movs r1, #0x1d
	ldrsb r1, [r4, r1]
	ldr r2, [r4, #4]
	ldrb r2, [r2, #0x12]
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	adds r1, r1, r2
	adds r1, r1, r0
	cmp r5, r1
	ble _0803AC86
	movs r0, #0
	b _0803AC88
_0803AC86:
	movs r0, #1
_0803AC88:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_803AC3C

	THUMB_FUNC_START sub_803AC90
sub_803AC90: @ 0x0803AC90
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	lsls r2, r2, #0x10
	lsrs r7, r2, #0x10
	movs r3, #0x10
	ldrsb r3, [r4, r3]
	movs r0, #0x10
	ldrsb r0, [r5, r0]
	subs r1, r3, r0
	cmp r1, #0
	bge _0803ACAA
	subs r1, r0, r3
_0803ACAA:
	movs r2, #0x11
	ldrsb r2, [r4, r2]
	movs r0, #0x11
	ldrsb r0, [r5, r0]
	subs r3, r2, r0
	cmp r3, #0
	blt _0803ACBC
	adds r6, r1, r3
	b _0803ACC0
_0803ACBC:
	subs r0, r0, r2
	adds r6, r1, r0
_0803ACC0:
	adds r0, r7, #0
	bl GetItemMaxRange
	movs r1, #0x1d
	ldrsb r1, [r4, r1]
	ldr r2, [r4, #4]
	ldrb r2, [r2, #0x12]
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	adds r1, r1, r2
	movs r2, #0x1d
	ldrsb r2, [r5, r2]
	ldr r3, [r5, #4]
	ldrb r3, [r3, #0x12]
	lsls r3, r3, #0x18
	asrs r3, r3, #0x18
	adds r2, r2, r3
	adds r1, r1, r2
	adds r1, r1, r0
	cmp r6, r1
	ble _0803ACEE
	movs r0, #0
	b _0803ACF0
_0803ACEE:
	movs r0, #1
_0803ACF0:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_803AC90

	THUMB_FUNC_START sub_803ACF8
sub_803ACF8: @ 0x0803ACF8
	push {lr}
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	b _0803AD0A
_0803AD00:
	cmp r2, r1
	bne _0803AD08
	movs r0, #1
	b _0803AD12
_0803AD08:
	adds r0, #2
_0803AD0A:
	ldrh r2, [r0]
	cmp r2, #0
	bne _0803AD00
	movs r0, #0
_0803AD12:
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_803ACF8

	THUMB_FUNC_START sub_803AD18
sub_803AD18: @ 0x0803AD18
	push {lr}
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	b _0803AD2A
_0803AD20:
	cmp r2, r1
	bne _0803AD28
	movs r0, #1
	b _0803AD32
_0803AD28:
	adds r0, #1
_0803AD2A:
	ldrb r2, [r0]
	cmp r2, #0
	bne _0803AD20
	movs r0, #0
_0803AD32:
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_803AD18

	THUMB_FUNC_START sub_803AD38
sub_803AD38: @ 0x0803AD38
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	str r0, [sp]
	mov r8, r1
	adds r7, r2, #0
	movs r0, #0xff
	mov r9, r0
	ldr r0, _0803AE14  @ gBmMapSize
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r5, r0, #1
	cmp r5, #0
	blt _0803AE0A
_0803AD5A:
	ldr r0, _0803AE14  @ gBmMapSize
	movs r1, #0
	ldrsh r0, [r0, r1]
	subs r4, r0, #1
	subs r0, r5, #1
	mov sl, r0
	cmp r4, #0
	blt _0803AE04
	lsls r6, r5, #2
_0803AD6C:
	ldr r0, _0803AE18  @ gBmMapRange
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _0803ADFE
	ldr r0, _0803AE1C  @ gBmMapTerrain
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r1, [r0]
	ldr r0, [sp]
	bl sub_803AD18
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803ADFE
	movs r0, #1
	mov r1, r8
	ands r0, r1
	cmp r0, #0
	beq _0803ADC4
	ldr r0, _0803AE20  @ gBmMapUnit
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r1, r0, r4
	ldrb r0, [r1]
	cmp r0, #0
	beq _0803ADC4
	ldr r0, _0803AE24  @ gActiveUnit
	ldr r0, [r0]
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldrb r1, [r1]
	bl AreUnitsAllied
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803ADFE
_0803ADC4:
	movs r0, #2
	mov r1, r8
	ands r0, r1
	cmp r0, #0
	beq _0803ADDE
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	lsls r1, r5, #0x10
	asrs r1, r1, #0x10
	bl sub_803B41C
	cmp r0, #0
	bne _0803ADFE
_0803ADDE:
	ldr r0, _0803AE18  @ gBmMapRange
	ldr r0, [r0]
	adds r1, r6, r0
	ldr r0, [r1]
	adds r0, r0, r4
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r9, r0
	ble _0803ADFE
	strh r4, [r7]
	strh r5, [r7, #2]
	ldr r0, [r1]
	adds r0, r0, r4
	ldrb r0, [r0]
	mov r9, r0
_0803ADFE:
	subs r4, #1
	cmp r4, #0
	bge _0803AD6C
_0803AE04:
	mov r5, sl
	cmp r5, #0
	bge _0803AD5A
_0803AE0A:
	mov r0, r9
	cmp r0, #0xff
	bne _0803AE28
	movs r0, #0
	b _0803AE2A
	.align 2, 0
_0803AE14: .4byte gBmMapSize
_0803AE18: .4byte gBmMapRange
_0803AE1C: .4byte gBmMapTerrain
_0803AE20: .4byte gBmMapUnit
_0803AE24: .4byte gActiveUnit
_0803AE28:
	movs r0, #1
_0803AE2A:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_803AD38

	THUMB_FUNC_START sub_803AE3C
sub_803AE3C: @ 0x0803AE3C
	push {r4, lr}
	adds r3, r0, #0
	adds r4, r1, #0
	ldr r1, _0803AE74  @ gBmMapRange
	ldr r0, [r1]
	lsls r2, r4, #2
	adds r0, r2, r0
	ldr r0, [r0]
	adds r0, r0, r3
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x77
	bgt _0803AE70
	ldr r0, _0803AE78  @ gBmMapUnit
	ldr r0, [r0]
	adds r0, r2, r0
	ldr r0, [r0]
	adds r0, r0, r3
	ldrb r2, [r0]
	cmp r2, #0
	beq _0803AE80
	ldr r0, _0803AE7C  @ gActiveUnitId
	ldrb r0, [r0]
	cmp r2, r0
	beq _0803AE80
_0803AE70:
	movs r0, #0xff
	b _0803AE8C
	.align 2, 0
_0803AE74: .4byte gBmMapRange
_0803AE78: .4byte gBmMapUnit
_0803AE7C: .4byte gActiveUnitId
_0803AE80:
	ldr r1, [r1]
	lsls r0, r4, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, r0, r3
	ldrb r0, [r0]
_0803AE8C:
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_803AE3C

	THUMB_FUNC_START sub_803AE94
sub_803AE94: @ 0x0803AE94
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	str r0, [sp, #4]
	mov sl, r1
	mov r9, r2
	movs r0, #0xff
	str r0, [sp, #8]
	ldr r0, _0803AFB0  @ gBmMapSize
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r6, r0, #1
	cmp r6, #0
	blt _0803AFA4
	mov r8, sp
_0803AEB8:
	ldr r0, _0803AFB0  @ gBmMapSize
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r5, r0, #1
	subs r3, r6, #1
	str r3, [sp, #0xc]
	cmp r5, #0
	blt _0803AF9E
	lsls r7, r6, #2
	str r7, [sp, #0x10]
_0803AECC:
	ldr r0, _0803AFB4  @ gBmMapRange
	ldr r0, [r0]
	ldr r1, [sp, #0x10]
	adds r0, r1, r0
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _0803AF98
	ldr r0, _0803AFB8  @ gBmMapTerrain
	ldr r0, [r0]
	adds r0, r1, r0
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r1, [r0]
	ldr r0, [sp, #4]
	bl sub_803AD18
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803AF98
	movs r0, #1
	mov r2, sl
	ands r0, r2
	cmp r0, #0
	beq _0803AF28
	ldr r0, _0803AFBC  @ gBmMapUnit
	ldr r0, [r0]
	ldr r3, [sp, #0x10]
	adds r0, r3, r0
	ldr r0, [r0]
	adds r1, r0, r5
	ldrb r0, [r1]
	cmp r0, #0
	beq _0803AF28
	ldr r0, _0803AFC0  @ gActiveUnit
	ldr r0, [r0]
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldrb r1, [r1]
	bl AreUnitsAllied
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803AF98
_0803AF28:
	movs r0, #2
	mov r7, sl
	ands r0, r7
	cmp r0, #0
	beq _0803AF42
	lsls r0, r5, #0x10
	asrs r0, r0, #0x10
	lsls r1, r6, #0x10
	asrs r1, r1, #0x10
	bl sub_803B41C
	cmp r0, #0
	bne _0803AF98
_0803AF42:
	mov r4, sp
	adds r0, r5, #0
	adds r1, r6, #0
	ldr r2, _0803AFC4  @ sub_803AE3C
	mov r3, sp
	bl sub_803B718
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803AF98
	movs r1, #2
	ldrsh r0, [r4, r1]
	ldr r1, _0803AFB4  @ gBmMapRange
	ldr r2, [r1]
	lsls r0, r0, #2
	adds r0, r0, r2
	mov r3, r8
	movs r7, #0
	ldrsh r1, [r3, r7]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldr r1, [sp, #8]
	cmp r1, r0
	ble _0803AF98
	ldrh r0, [r3]
	mov r3, r9
	strh r0, [r3]
	ldrh r0, [r4, #2]
	strh r0, [r3, #2]
	movs r7, #2
	ldrsh r0, [r4, r7]
	lsls r0, r0, #2
	adds r0, r0, r2
	mov r2, r8
	movs r3, #0
	ldrsh r1, [r2, r3]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	str r0, [sp, #8]
_0803AF98:
	subs r5, #1
	cmp r5, #0
	bge _0803AECC
_0803AF9E:
	ldr r6, [sp, #0xc]
	cmp r6, #0
	bge _0803AEB8
_0803AFA4:
	ldr r7, [sp, #8]
	cmp r7, #0xff
	bne _0803AFC8
	movs r0, #0
	b _0803AFCA
	.align 2, 0
_0803AFB0: .4byte gBmMapSize
_0803AFB4: .4byte gBmMapRange
_0803AFB8: .4byte gBmMapTerrain
_0803AFBC: .4byte gBmMapUnit
_0803AFC0: .4byte gActiveUnit
_0803AFC4: .4byte sub_803AE3C
_0803AFC8:
	movs r0, #1
_0803AFCA:
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_803AE94

	THUMB_FUNC_START sub_803AFDC
sub_803AFDC: @ 0x0803AFDC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x18
	str r0, [sp, #4]
	mov r9, r1
	mov r8, r2
	movs r0, #0xff
	str r0, [sp, #8]
	movs r1, #0
	str r1, [sp, #0xc]
	ldr r0, _0803B050  @ gBmMapSize
	movs r2, #2
	ldrsh r0, [r0, r2]
	subs r7, r0, #1
	cmp r7, #0
	bge _0803B004
	b _0803B1DA
_0803B004:
	movs r4, #1
	ldr r0, [sp, #4]
	ands r0, r4
	str r0, [sp, #0x10]
_0803B00C:
	ldr r0, _0803B050  @ gBmMapSize
	movs r1, #0
	ldrsh r0, [r0, r1]
	subs r6, r0, #1
	cmp r6, #0
	bge _0803B01A
	b _0803B1D2
_0803B01A:
	lsls r2, r7, #2
	mov sl, r2
	mov r5, sp
	movs r4, #2
	ldr r0, [sp, #4]
	ands r0, r4
	str r0, [sp, #0x14]
_0803B028:
	ldr r0, _0803B054  @ gBmMapRange
	ldr r0, [r0]
	add r0, sl
	ldr r0, [r0]
	adds r0, r0, r6
	ldrb r0, [r0]
	cmp r0, #0x78
	bls _0803B03A
	b _0803B1CA
_0803B03A:
	ldr r0, _0803B058  @ gBmMapTerrain
	ldr r0, [r0]
	add r0, sl
	ldr r0, [r0]
	adds r0, r0, r6
	ldrb r0, [r0]
	cmp r0, #0x1e
	beq _0803B05C
	cmp r0, #0x21
	beq _0803B08C
	b _0803B1CA
	.align 2, 0
_0803B050: .4byte gBmMapSize
_0803B054: .4byte gBmMapRange
_0803B058: .4byte gBmMapTerrain
_0803B05C:
	ldr r0, [sp, #0xc]
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0xc]
	movs r0, #8
	ldr r1, [sp, #4]
	ands r0, r1
	cmp r0, #0
	beq _0803B072
	b _0803B1CA
_0803B072:
	adds r0, r6, #0
	adds r1, r7, #0
	ldr r2, _0803B088  @ sub_803AE3C
	mov r3, sp
	bl sub_803B718
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0803B086
	b _0803B1CA
_0803B086:
	b _0803B134
	.align 2, 0
_0803B088: .4byte sub_803AE3C
_0803B08C:
	ldr r0, [sp, #0xc]
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0xc]
	movs r0, #4
	ldr r2, [sp, #4]
	ands r0, r2
	cmp r0, #0
	beq _0803B0A2
	b _0803B1CA
_0803B0A2:
	strh r6, [r5]
	mov r4, sp
	strh r7, [r4, #2]
	ldr r0, _0803B128  @ gBmMapMovement
	ldr r0, [r0]
	add r0, sl
	ldr r0, [r0]
	adds r0, r0, r6
	ldrb r2, [r0]
	ldr r0, _0803B12C  @ gActiveUnit
	ldr r3, [r0]
	movs r1, #0x1d
	ldrsb r1, [r3, r1]
	ldr r0, [r3, #4]
	ldrb r0, [r0, #0x12]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r1, r1, r0
	cmp r2, r1
	bgt _0803B134
	ldr r0, [sp, #0x10]
	cmp r0, #0
	beq _0803B0FA
	movs r1, #2
	ldrsh r0, [r4, r1]
	ldr r1, _0803B130  @ gBmMapUnit
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r2, #0
	ldrsh r1, [r5, r2]
	ldr r0, [r0]
	adds r1, r0, r1
	ldrb r0, [r1]
	cmp r0, #0
	beq _0803B0FA
	movs r0, #0xb
	ldrsb r0, [r3, r0]
	ldrb r1, [r1]
	bl AreUnitsAllied
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803B1CA
_0803B0FA:
	ldr r4, [sp, #0x14]
	cmp r4, #0
	beq _0803B110
	movs r1, #0
	ldrsh r0, [r5, r1]
	movs r2, #2
	ldrsh r1, [r5, r2]
	bl sub_803B41C
	cmp r0, #0
	bne _0803B1CA
_0803B110:
	ldrh r0, [r5]
	mov r4, r9
	strh r0, [r4]
	ldrh r0, [r5, #2]
	strh r0, [r4, #2]
	mov r0, r8
	cmp r0, #0
	beq _0803B210
	strh r6, [r0]
	strh r7, [r0, #2]
	b _0803B210
	.align 2, 0
_0803B128: .4byte gBmMapMovement
_0803B12C: .4byte gActiveUnit
_0803B130: .4byte gBmMapUnit
_0803B134:
	ldr r1, [sp, #0x10]
	cmp r1, #0
	beq _0803B16A
	movs r2, #2
	ldrsh r0, [r5, r2]
	ldr r1, _0803B200  @ gBmMapUnit
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r4, #0
	ldrsh r1, [r5, r4]
	ldr r0, [r0]
	adds r1, r0, r1
	ldrb r0, [r1]
	cmp r0, #0
	beq _0803B16A
	ldr r0, _0803B204  @ gActiveUnit
	ldr r0, [r0]
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldrb r1, [r1]
	bl AreUnitsAllied
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803B1CA
_0803B16A:
	ldr r0, [sp, #0x14]
	cmp r0, #0
	beq _0803B180
	movs r1, #0
	ldrsh r0, [r5, r1]
	movs r2, #2
	ldrsh r1, [r5, r2]
	bl sub_803B41C
	cmp r0, #0
	bne _0803B1CA
_0803B180:
	mov r2, sp
	movs r4, #2
	ldrsh r0, [r2, r4]
	ldr r1, _0803B208  @ gBmMapRange
	ldr r3, [r1]
	lsls r0, r0, #2
	adds r0, r0, r3
	movs r4, #0
	ldrsh r1, [r5, r4]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldr r1, [sp, #8]
	cmp r1, r0
	ble _0803B1CA
	ldrh r0, [r5]
	mov r4, r9
	strh r0, [r4]
	ldrh r0, [r2, #2]
	strh r0, [r4, #2]
	movs r1, #2
	ldrsh r0, [r2, r1]
	lsls r0, r0, #2
	adds r0, r0, r3
	movs r2, #0
	ldrsh r1, [r5, r2]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	str r0, [sp, #8]
	mov r4, r8
	cmp r4, #0
	beq _0803B1CA
	strh r6, [r4]
	strh r7, [r4, #2]
_0803B1CA:
	subs r6, #1
	cmp r6, #0
	blt _0803B1D2
	b _0803B028
_0803B1D2:
	subs r7, #1
	cmp r7, #0
	blt _0803B1DA
	b _0803B00C
_0803B1DA:
	movs r0, #0
	cmp r0, #0
	bne _0803B1E8
	ldr r0, _0803B20C  @ gAiState
	adds r0, #0x87
	movs r1, #1
	strb r1, [r0]
_0803B1E8:
	ldr r0, [sp, #0xc]
	cmp r0, #0
	bne _0803B1F6
	ldr r0, _0803B20C  @ gAiState
	adds r0, #0x86
	movs r1, #5
	strb r1, [r0]
_0803B1F6:
	ldr r1, [sp, #8]
	cmp r1, #0xff
	bne _0803B210
	movs r0, #0
	b _0803B212
	.align 2, 0
_0803B200: .4byte gBmMapUnit
_0803B204: .4byte gActiveUnit
_0803B208: .4byte gBmMapRange
_0803B20C: .4byte gAiState
_0803B210:
	movs r0, #1
_0803B212:
	add sp, #0x18
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_803AFDC

	THUMB_FUNC_START sub_803B224
sub_803B224: @ 0x0803B224
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	movs r4, #0
	ldr r1, _0803B28C  @ gBmMapSize
	movs r2, #2
	ldrsh r0, [r1, r2]
	subs r2, r0, #1
	cmp r2, #0
	blt _0803B280
	movs r3, #0
	ldrsh r7, [r1, r3]
	ldr r0, _0803B290  @ gBmMapRange
	mov r8, r0
	ldr r3, _0803B294  @ gBmMapUnit
	mov ip, r3
_0803B244:
	subs r1, r7, #1
	subs r5, r2, #1
	cmp r1, #0
	blt _0803B27A
	mov r3, r8
	ldr r0, [r3]
	lsls r2, r2, #2
	adds r0, r2, r0
	ldr r3, [r0]
	mov r6, ip
_0803B258:
	adds r0, r3, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0803B274
	ldr r0, [r6]
	adds r0, r2, r0
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _0803B274
	adds r4, #1
_0803B274:
	subs r1, #1
	cmp r1, #0
	bge _0803B258
_0803B27A:
	adds r2, r5, #0
	cmp r2, #0
	bge _0803B244
_0803B280:
	adds r0, r4, #0
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0803B28C: .4byte gBmMapSize
_0803B290: .4byte gBmMapRange
_0803B294: .4byte gBmMapUnit

	THUMB_FUNC_END sub_803B224

	THUMB_FUNC_START sub_803B298
sub_803B298: @ 0x0803B298
	push {r4, r5, r6, r7, lr}
	movs r6, #0
	ldr r0, _0803B304  @ gBmMapSize
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r1, r0, #1
	cmp r1, #0
	blt _0803B2FA
_0803B2A8:
	ldr r0, _0803B304  @ gBmMapSize
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r4, r0, #1
	subs r7, r1, #1
	cmp r4, #0
	blt _0803B2F4
	lsls r5, r1, #2
_0803B2B8:
	ldr r0, _0803B308  @ gBmMapRange
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0803B2EE
	ldr r0, _0803B30C  @ gBmMapUnit
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r1, r0, r4
	ldrb r0, [r1]
	cmp r0, #0
	beq _0803B2EE
	ldr r0, _0803B310  @ gActiveUnitId
	ldrb r0, [r0]
	ldrb r1, [r1]
	bl AreUnitsAllied
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0803B2EE
	adds r6, #1
_0803B2EE:
	subs r4, #1
	cmp r4, #0
	bge _0803B2B8
_0803B2F4:
	adds r1, r7, #0
	cmp r1, #0
	bge _0803B2A8
_0803B2FA:
	adds r0, r6, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0803B304: .4byte gBmMapSize
_0803B308: .4byte gBmMapRange
_0803B30C: .4byte gBmMapUnit
_0803B310: .4byte gActiveUnitId

	THUMB_FUNC_END sub_803B298

	THUMB_FUNC_START sub_803B314
sub_803B314: @ 0x0803B314
	push {r4, r5, r6, r7, lr}
	movs r6, #0
	ldr r0, _0803B380  @ gBmMapSize
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r1, r0, #1
	cmp r1, #0
	blt _0803B378
_0803B324:
	ldr r0, _0803B380  @ gBmMapSize
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r4, r0, #1
	subs r7, r1, #1
	cmp r4, #0
	blt _0803B372
	lsls r5, r1, #2
_0803B334:
	ldr r0, _0803B384  @ gBmMapRange
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0803B36C
	ldr r0, _0803B388  @ gBmMapUnit
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r1, r0, r4
	ldrb r0, [r1]
	cmp r0, #0
	beq _0803B36C
	ldr r0, _0803B38C  @ gActiveUnitId
	ldrb r0, [r0]
	ldrb r1, [r1]
	bl AreUnitsAllied
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _0803B36C
	adds r6, #1
_0803B36C:
	subs r4, #1
	cmp r4, #0
	bge _0803B334
_0803B372:
	adds r1, r7, #0
	cmp r1, #0
	bge _0803B324
_0803B378:
	adds r0, r6, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0803B380: .4byte gBmMapSize
_0803B384: .4byte gBmMapRange
_0803B388: .4byte gBmMapUnit
_0803B38C: .4byte gActiveUnitId

	THUMB_FUNC_END sub_803B314

	THUMB_FUNC_START sub_803B390
sub_803B390: @ 0x0803B390
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r6, #0
	ldr r4, _0803B40C  @ gUnknown_085A80BC
	subs r4, #4
	movs r2, #0
	ldrsh r0, [r4, r2]
	ldr r2, _0803B410  @ 0x0000270F
	cmp r0, r2
	beq _0803B3FE
	lsls r0, r3, #0x10
	asrs r0, r0, #0x10
	mov ip, r0
	ldr r5, _0803B414  @ gBmMapSize
	lsls r0, r1, #0x10
	asrs r7, r0, #0x10
	mov r9, r2
	ldr r0, _0803B418  @ gBmMapUnit
	mov r8, r0
_0803B3C2:
	adds r4, #4
	movs r1, #0
	ldrsh r0, [r4, r1]
	mov r2, ip
	adds r3, r2, r0
	movs r1, #0
	ldrsh r0, [r5, r1]
	cmp r3, r0
	bge _0803B3F6
	movs r2, #2
	ldrsh r0, [r4, r2]
	adds r2, r7, r0
	movs r1, #2
	ldrsh r0, [r5, r1]
	cmp r2, r0
	bge _0803B3F6
	mov r0, r8
	ldr r1, [r0]
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, r0, r3
	ldrb r0, [r0]
	cmp r0, #0
	beq _0803B3F6
	adds r6, #1
_0803B3F6:
	movs r1, #0
	ldrsh r0, [r4, r1]
	cmp r0, r9
	bne _0803B3C2
_0803B3FE:
	adds r0, r6, #0
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0803B40C: .4byte gUnknown_085A80BC
_0803B410: .4byte 0x0000270F
_0803B414: .4byte gBmMapSize
_0803B418: .4byte gBmMapUnit

	THUMB_FUNC_END sub_803B390

	THUMB_FUNC_START sub_803B41C
sub_803B41C: @ 0x0803B41C
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r6, #0
	ldr r4, _0803B4A4  @ gUnknown_085A80BC
	subs r4, #4
	movs r2, #0
	ldrsh r0, [r4, r2]
	ldr r2, _0803B4A8  @ 0x0000270F
	cmp r0, r2
	beq _0803B496
	lsls r0, r3, #0x10
	asrs r0, r0, #0x10
	mov r8, r0
	ldr r5, _0803B4AC  @ gBmMapSize
	lsls r0, r1, #0x10
	asrs r7, r0, #0x10
	mov r9, r2
_0803B44A:
	adds r4, #4
	movs r1, #0
	ldrsh r0, [r4, r1]
	mov r2, r8
	adds r3, r2, r0
	movs r1, #0
	ldrsh r0, [r5, r1]
	cmp r3, r0
	bge _0803B48E
	movs r2, #2
	ldrsh r0, [r4, r2]
	adds r2, r7, r0
	movs r1, #2
	ldrsh r0, [r5, r1]
	cmp r2, r0
	bge _0803B48E
	ldr r0, _0803B4B0  @ gBmMapUnit
	ldr r1, [r0]
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r1, r0, r3
	ldrb r0, [r1]
	cmp r0, #0
	beq _0803B48E
	ldr r0, _0803B4B4  @ gActiveUnitId
	ldrb r0, [r0]
	ldrb r1, [r1]
	bl AreUnitsAllied
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0803B48E
	adds r6, #1
_0803B48E:
	movs r2, #0
	ldrsh r0, [r4, r2]
	cmp r0, r9
	bne _0803B44A
_0803B496:
	adds r0, r6, #0
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0803B4A4: .4byte gUnknown_085A80BC
_0803B4A8: .4byte 0x0000270F
_0803B4AC: .4byte gBmMapSize
_0803B4B0: .4byte gBmMapUnit
_0803B4B4: .4byte gActiveUnitId

	THUMB_FUNC_END sub_803B41C

	THUMB_FUNC_START sub_803B4B8
sub_803B4B8: @ 0x0803B4B8
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r6, #0
	ldr r4, _0803B544  @ gUnknown_085A80BC
	subs r4, #4
	movs r2, #0
	ldrsh r0, [r4, r2]
	ldr r2, _0803B548  @ 0x0000270F
	cmp r0, r2
	beq _0803B534
	lsls r0, r3, #0x10
	asrs r0, r0, #0x10
	mov r8, r0
	ldr r5, _0803B54C  @ gBmMapSize
	lsls r0, r1, #0x10
	asrs r7, r0, #0x10
	mov r9, r2
_0803B4E6:
	adds r4, #4
	movs r1, #0
	ldrsh r0, [r4, r1]
	mov r2, r8
	adds r3, r2, r0
	movs r1, #0
	ldrsh r0, [r5, r1]
	cmp r3, r0
	bge _0803B52C
	movs r2, #2
	ldrsh r0, [r4, r2]
	adds r2, r7, r0
	movs r1, #2
	ldrsh r0, [r5, r1]
	cmp r2, r0
	bge _0803B52C
	ldr r0, _0803B550  @ gBmMapUnit
	ldr r1, [r0]
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r1, r0, r3
	ldrb r0, [r1]
	cmp r0, #0
	beq _0803B52C
	ldr r0, _0803B554  @ gActiveUnitId
	ldrb r0, [r0]
	ldrb r1, [r1]
	bl AreUnitsAllied
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _0803B52C
	adds r6, #1
_0803B52C:
	movs r2, #0
	ldrsh r0, [r4, r2]
	cmp r0, r9
	bne _0803B4E6
_0803B534:
	adds r0, r6, #0
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0803B544: .4byte gUnknown_085A80BC
_0803B548: .4byte 0x0000270F
_0803B54C: .4byte gBmMapSize
_0803B550: .4byte gBmMapUnit
_0803B554: .4byte gActiveUnitId

	THUMB_FUNC_END sub_803B4B8

	THUMB_FUNC_START FillMovementAndRangeMapForItem
FillMovementAndRangeMapForItem: @ 0x0803B558
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov r9, r1
	bl GenerateUnitMovementMap
	ldr r0, _0803B5EC  @ gBmMapRange
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFill
	ldr r0, _0803B5F0  @ gBmMapSize
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r7, r0, #1
	cmp r7, #0
	blt _0803B5DC
_0803B582:
	ldr r0, _0803B5F0  @ gBmMapSize
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r6, r0, #1
	subs r0, r7, #1
	mov sl, r0
	cmp r6, #0
	blt _0803B5D6
	lsls r1, r7, #0x10
	mov r8, r1
_0803B596:
	ldr r0, _0803B5F4  @ gBmMapMovement
	ldr r1, [r0]
	lsls r0, r7, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, r0, r6
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _0803B5D0
	lsls r5, r6, #0x10
	asrs r5, r5, #0x10
	mov r0, r9
	bl GetItemMinRange
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	mov r0, r9
	bl GetItemMaxRange
	adds r3, r0, #0
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	adds r0, r5, #0
	mov r2, r8
	asrs r1, r2, #0x10
	adds r2, r4, #0
	bl MapAddInBoundedRange
_0803B5D0:
	subs r6, #1
	cmp r6, #0
	bge _0803B596
_0803B5D6:
	mov r7, sl
	cmp r7, #0
	bge _0803B582
_0803B5DC:
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803B5EC: .4byte gBmMapRange
_0803B5F0: .4byte gBmMapSize
_0803B5F4: .4byte gBmMapMovement

	THUMB_FUNC_END FillMovementAndRangeMapForItem

	THUMB_FUNC_START sub_803B5F8
sub_803B5F8: @ 0x0803B5F8
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	bl GetUnitPower
	cmp r0, #0x14
	bgt _0803B60E
	adds r0, r4, #0
	bl GetUnitPower
	adds r7, r0, #0
	b _0803B610
_0803B60E:
	movs r7, #0x14
_0803B610:
	adds r0, r4, #0
	bl GenerateUnitMovementMap
	ldr r0, _0803B66C  @ gBmMapRange
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFill
	ldr r0, _0803B670  @ gBmMapSize
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r5, r0, #1
	cmp r5, #0
	blt _0803B664
_0803B62C:
	ldr r0, _0803B670  @ gBmMapSize
	movs r1, #0
	ldrsh r0, [r0, r1]
	subs r4, r0, #1
	subs r6, r5, #1
	cmp r4, #0
	blt _0803B65E
_0803B63A:
	ldr r0, _0803B674  @ gBmMapMovement
	ldr r1, [r0]
	lsls r0, r5, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _0803B658
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r7, #0
	movs r3, #1
	bl MapAddInRange
_0803B658:
	subs r4, #1
	cmp r4, #0
	bge _0803B63A
_0803B65E:
	adds r5, r6, #0
	cmp r5, #0
	bge _0803B62C
_0803B664:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803B66C: .4byte gBmMapRange
_0803B670: .4byte gBmMapSize
_0803B674: .4byte gBmMapMovement

	THUMB_FUNC_END sub_803B5F8

	THUMB_FUNC_START sub_803B678
sub_803B678: @ 0x0803B678
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov r9, r1
	bl GenerateUnitMovementMap
	ldr r0, _0803B70C  @ gBmMapRange
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFill
	ldr r0, _0803B710  @ gBmMapSize
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r7, r0, #1
	cmp r7, #0
	blt _0803B6FC
_0803B6A2:
	ldr r0, _0803B710  @ gBmMapSize
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r6, r0, #1
	subs r0, r7, #1
	mov sl, r0
	cmp r6, #0
	blt _0803B6F6
	lsls r1, r7, #0x10
	mov r8, r1
_0803B6B6:
	ldr r0, _0803B714  @ gBmMapMovement
	ldr r1, [r0]
	lsls r0, r7, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, r0, r6
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _0803B6F0
	lsls r5, r6, #0x10
	asrs r5, r5, #0x10
	mov r0, r9
	bl GetItemMinRange
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	mov r0, r9
	bl GetItemMaxRange
	adds r3, r0, #0
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	adds r0, r5, #0
	mov r2, r8
	asrs r1, r2, #0x10
	adds r2, r4, #0
	bl MapAddInBoundedRange
_0803B6F0:
	subs r6, #1
	cmp r6, #0
	bge _0803B6B6
_0803B6F6:
	mov r7, sl
	cmp r7, #0
	bge _0803B6A2
_0803B6FC:
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803B70C: .4byte gBmMapRange
_0803B710: .4byte gBmMapSize
_0803B714: .4byte gBmMapMovement

	THUMB_FUNC_END sub_803B678

	THUMB_FUNC_START sub_803B718
sub_803B718: @ 0x0803B718
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	sub sp, #0xc
	adds r7, r0, #0
	adds r6, r1, #0
	adds r5, r3, #0
	mov r9, r2
	movs r0, #0xff
	mov r8, r0
	ldr r1, _0803B780  @ gUnknown_080D80F4
	mov r0, sp
	movs r2, #8
	bl memcpy
	mov r4, sp
	movs r2, #3
_0803B73C:
	movs r0, #0
	ldrsb r0, [r4, r0]
	adds r0, r7, r0
	movs r1, #1
	ldrsb r1, [r4, r1]
	adds r1, r6, r1
	str r2, [sp, #8]
	bl _call_via_r9
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, [sp, #8]
	cmp r0, #0xff
	beq _0803B76E
	cmp r8, r0
	bls _0803B76E
	mov r8, r0
	movs r0, #0
	ldrsb r0, [r4, r0]
	adds r0, r0, r7
	strh r0, [r5]
	movs r0, #1
	ldrsb r0, [r4, r0]
	adds r0, r0, r6
	strh r0, [r5, #2]
_0803B76E:
	adds r4, #2
	subs r2, #1
	cmp r2, #0
	bge _0803B73C
	mov r0, r8
	cmp r0, #0xff
	bne _0803B784
	movs r0, #0
	b _0803B786
	.align 2, 0
_0803B780: .4byte gUnknown_080D80F4
_0803B784:
	movs r0, #1
_0803B786:
	add sp, #0xc
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_803B718

	THUMB_FUNC_START sub_803B794
sub_803B794: @ 0x0803B794
	push {r4, lr}
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	movs r0, #0
	ldr r2, _0803B7C0  @ gUnknown_085A83A4
	ldrh r1, [r2]
	ldr r3, _0803B7C4  @ 0x0000FFFF
	cmp r1, r3
	beq _0803B7B4
_0803B7A6:
	cmp r1, r4
	beq _0803B7B8
	adds r2, #2
	adds r0, #1
	ldrh r1, [r2]
	cmp r1, r3
	bne _0803B7A6
_0803B7B4:
	movs r0, #1
	negs r0, r0
_0803B7B8:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0803B7C0: .4byte gUnknown_085A83A4
_0803B7C4: .4byte 0x0000FFFF

	THUMB_FUNC_END sub_803B794

	THUMB_FUNC_START sub_803B7C8
sub_803B7C8: @ 0x0803B7C8
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	movs r6, #0xff
	movs r5, #0xff
	movs r4, #0
_0803B7D2:
	lsls r1, r4, #1
	adds r0, r7, #0
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r1, [r0]
	cmp r1, #0
	beq _0803B7FE
	movs r0, #0xff
	ands r1, r0
	adds r0, r1, #0
	bl sub_803B794
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r6, r0
	bcc _0803B7F8
	adds r6, r0, #0
	lsls r0, r4, #0x18
	lsrs r5, r0, #0x18
_0803B7F8:
	adds r4, #1
	cmp r4, #4
	ble _0803B7D2
_0803B7FE:
	lsls r0, r5, #0x18
	asrs r0, r0, #0x18
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_803B7C8

	THUMB_FUNC_START sub_803B808
sub_803B808: @ 0x0803B808
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	adds r5, r0, #0
	mov r9, r1
	movs r0, #0xff
	mov sl, r0
	ldr r0, _0803B84C  @ gAiState
	adds r0, #0x7b
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0803B854
	ldr r4, _0803B850  @ gBmMapMovement
	ldr r0, [r4]
	movs r1, #1
	negs r1, r1
	bl BmMapFill
	movs r0, #0x11
	ldrsb r0, [r5, r0]
	ldr r1, [r4]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r1, #0x10
	ldrsb r1, [r5, r1]
	ldr r0, [r0]
	adds r0, r0, r1
	movs r1, #0
	strb r1, [r0]
	b _0803B85A
	.align 2, 0
_0803B84C: .4byte gAiState
_0803B850: .4byte gBmMapMovement
_0803B854:
	adds r0, r5, #0
	bl GenerateUnitMovementMap
_0803B85A:
	ldr r1, _0803B8D8  @ gBmMapSize
	movs r2, #2
	ldrsh r0, [r1, r2]
	subs r5, r0, #1
	cmp r5, #0
	blt _0803B8CE
_0803B866:
	ldr r1, _0803B8D8  @ gBmMapSize
	movs r2, #0
	ldrsh r0, [r1, r2]
	subs r3, r0, #1
	subs r0, r5, #1
	mov r8, r0
	cmp r3, #0
	blt _0803B8C8
	lsls r4, r5, #2
	ldr r1, _0803B8DC  @ gBmMapMovement
	mov ip, r1
	ldr r7, _0803B8E0  @ gBmMapUnit
	ldr r6, _0803B8E4  @ gActiveUnitId
	ldr r1, _0803B8E8  @ gBmMapUnk
_0803B882:
	mov r2, ip
	ldr r0, [r2]
	adds r0, r4, r0
	ldr r0, [r0]
	adds r0, r0, r3
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _0803B8C2
	ldr r0, [r7]
	adds r0, r4, r0
	ldr r0, [r0]
	adds r0, r0, r3
	ldrb r0, [r0]
	cmp r0, #0
	beq _0803B8A6
	ldrb r2, [r6]
	cmp r0, r2
	bne _0803B8C2
_0803B8A6:
	ldr r0, [r1]
	adds r2, r4, r0
	ldr r0, [r2]
	adds r0, r0, r3
	ldrb r0, [r0]
	cmp sl, r0
	bcc _0803B8C2
	mov r0, r9
	strh r3, [r0]
	strh r5, [r0, #2]
	ldr r0, [r2]
	adds r0, r0, r3
	ldrb r0, [r0]
	mov sl, r0
_0803B8C2:
	subs r3, #1
	cmp r3, #0
	bge _0803B882
_0803B8C8:
	mov r5, r8
	cmp r5, #0
	bge _0803B866
_0803B8CE:
	mov r1, sl
	cmp r1, #0xff
	bne _0803B8EC
	movs r0, #0
	b _0803B8EE
	.align 2, 0
_0803B8D8: .4byte gBmMapSize
_0803B8DC: .4byte gBmMapMovement
_0803B8E0: .4byte gBmMapUnit
_0803B8E4: .4byte gActiveUnitId
_0803B8E8: .4byte gBmMapUnk
_0803B8EC:
	movs r0, #1
_0803B8EE:
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_803B808

	THUMB_FUNC_START sub_803B8FC
sub_803B8FC: @ 0x0803B8FC
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r4, r1, #0
	ldr r5, _0803B97C  @ gActiveUnit
	ldr r0, [r5]
	bl GetUnitMovementCost
	bl SetWorkingMoveCosts
	ldr r0, _0803B980  @ gBmMapRange
	ldr r0, [r0]
	bl SetWorkingBmMap
	ldr r2, [r5]
	movs r0, #0x10
	ldrsb r0, [r2, r0]
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	movs r3, #0xb
	ldrsb r3, [r2, r3]
	movs r2, #0x7c
	bl GenerateMovementMap
	adds r0, r4, #0
	bl sub_803B994
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldr r6, _0803B984  @ gUnknown_085A8120
	cmp r0, #1
	bne _0803B93C
	ldr r6, _0803B988  @ gUnknown_085A8124
_0803B93C:
	adds r0, r6, #0
	movs r1, #1
	adds r2, r7, #0
	bl sub_803AD38
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq _0803B98C
	ldr r0, [r5]
	movs r4, #0x10
	ldrsb r4, [r0, r4]
	movs r5, #0x11
	ldrsb r5, [r0, r5]
	bl GetUnitMovementCost
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	bl GenerateExtendedMovementMapOnRange
	adds r0, r6, #0
	movs r1, #0
	adds r2, r7, #0
	bl sub_803AD38
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq _0803B98C
	movs r0, #0
	b _0803B98E
	.align 2, 0
_0803B97C: .4byte gActiveUnit
_0803B980: .4byte gBmMapRange
_0803B984: .4byte gUnknown_085A8120
_0803B988: .4byte gUnknown_085A8124
_0803B98C:
	movs r0, #1
_0803B98E:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_803B8FC

	THUMB_FUNC_START sub_803B994
sub_803B994: @ 0x0803B994
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	movs r5, #0
	strb r5, [r6]
	ldr r4, _0803B9B4  @ gActiveUnit
	ldr r0, [r4]
	bl GetUnitItemCount
	cmp r0, #5
	bne _0803B9BC
	ldr r0, [r4]
	ldrb r1, [r0, #0xa]
	movs r2, #8
	orrs r1, r2
	strb r1, [r0, #0xa]
	b _0803B9FE
	.align 2, 0
_0803B9B4: .4byte gActiveUnit
_0803B9B8:
	movs r0, #1
	b _0803BA00
_0803B9BC:
	movs r5, #0
	adds r7, r4, #0
_0803B9C0:
	ldr r0, [r7]
	lsls r1, r5, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r4, [r0]
	cmp r4, #0
	beq _0803B9FE
	strb r5, [r6]
	adds r0, r4, #0
	bl GetItemIndex
	cmp r0, #0x69
	beq _0803B9B8
	adds r0, r4, #0
	bl GetItemIndex
	cmp r0, #0x6b
	bne _0803B9F8
	ldr r0, [r7]
	ldr r1, [r0]
	ldr r0, [r0, #4]
	ldr r1, [r1, #0x28]
	ldr r0, [r0, #0x28]
	orrs r1, r0
	movs r0, #4
	ands r1, r0
	cmp r1, #0
	bne _0803B9B8
_0803B9F8:
	adds r5, #1
	cmp r5, #4
	ble _0803B9C0
_0803B9FE:
	movs r0, #0
_0803BA00:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_803B994

	THUMB_FUNC_START AiTryMoveTowards
AiTryMoveTowards: @ 0x0803BA08
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x18
	ldr r4, [sp, #0x38]
	lsls r0, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r6, r1, #0x10
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	str r2, [sp, #0xc]
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	mov sl, r3
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	movs r1, #0
	str r1, [sp, #0x14]
	ldr r1, _0803BA64  @ gActiveUnit
	ldr r1, [r1]
	movs r2, #0x10
	ldrsb r2, [r1, r2]
	lsrs r5, r0, #0x10
	asrs r0, r0, #0x10
	cmp r2, r0
	bne _0803BA68
	ldrb r1, [r1, #0x11]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	lsls r0, r6, #0x10
	asrs r0, r0, #0x10
	cmp r1, r0
	bne _0803BA68
	ldr r0, [sp, #0x14]
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	adds r0, r2, #0
	ldr r2, [sp, #0xc]
	movs r3, #0
	bl AiSetDecision
	b _0803BBC0
	.align 2, 0
_0803BA64: .4byte gActiveUnit
_0803BA68:
	cmp r4, #0
	beq _0803BA8C
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	lsls r4, r6, #0x10
	asrs r4, r4, #0x10
	ldr r0, _0803BA88  @ gActiveUnit
	ldr r0, [r0]
	bl GetUnitMovementCost
	adds r2, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	bl GenerateExtendedMovementMapOnRange
	b _0803BA9C
	.align 2, 0
_0803BA88: .4byte gActiveUnit
_0803BA8C:
	lsls r0, r5, #0x10
	asrs r0, r0, #0x10
	lsls r1, r6, #0x10
	asrs r1, r1, #0x10
	ldr r2, _0803BACC  @ gActiveUnit
	ldr r2, [r2]
	bl sub_80410C4
_0803BA9C:
	ldr r4, _0803BACC  @ gActiveUnit
	ldr r0, [r4]
	bl GenerateUnitMovementMap
	ldr r2, [r4]
	movs r0, #0x11
	ldrsb r0, [r2, r0]
	ldr r1, _0803BAD0  @ gBmMapRange
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	mov r9, r0
	ldr r1, _0803BAD4  @ 0x0000FFFF
	str r1, [sp, #0x10]
	ldr r0, _0803BAD8  @ gBmMapSize
	ldrh r0, [r0, #2]
	subs r0, #1
	lsls r0, r0, #0x10
	b _0803BB98
	.align 2, 0
_0803BACC: .4byte gActiveUnit
_0803BAD0: .4byte gBmMapRange
_0803BAD4: .4byte 0x0000FFFF
_0803BAD8: .4byte gBmMapSize
_0803BADC:
	ldr r0, _0803BBD0  @ gBmMapSize
	ldrh r0, [r0]
	subs r0, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	lsls r1, r4, #0x10
	lsls r7, r2, #0x10
	cmp r1, #0
	blt _0803BB94
	asrs r0, r7, #0xe
	mov r8, r0
_0803BAF2:
	ldr r0, _0803BBD4  @ gBmMapMovement
	ldr r0, [r0]
	add r0, r8
	asrs r3, r1, #0x10
	ldr r0, [r0]
	adds r0, r0, r3
	ldrb r0, [r0]
	lsls r2, r4, #0x10
	cmp r0, #0x78
	bhi _0803BB88
	ldr r0, _0803BBD8  @ gBmMapUnit
	ldr r0, [r0]
	add r0, r8
	ldr r0, [r0]
	adds r0, r0, r3
	ldrb r1, [r0]
	cmp r1, #0
	beq _0803BB1E
	ldr r0, _0803BBDC  @ gActiveUnitId
	ldrb r0, [r0]
	cmp r1, r0
	bne _0803BB88
_0803BB1E:
	mov r1, sl
	cmp r1, #0
	bne _0803BB52
	ldr r0, _0803BBE0  @ gActiveUnit
	ldr r0, [r0]
	movs r1, #0x1d
	ldrsb r1, [r0, r1]
	ldr r0, [r0, #4]
	ldrb r0, [r0, #0x12]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r1, r1, r0
	ldr r0, _0803BBE4  @ gAiState
	adds r0, #0x85
	ldrb r0, [r0]
	cmp r1, r0
	bge _0803BB52
	ldr r0, _0803BBE8  @ gBmMapUnk
	ldr r0, [r0]
	add r0, r8
	ldr r0, [r0]
	adds r0, r0, r3
	ldrb r0, [r0]
	lsls r2, r4, #0x10
	cmp r0, #0
	bne _0803BB88
_0803BB52:
	lsls r4, r4, #0x10
	asrs r6, r4, #0x10
	asrs r5, r7, #0x10
	adds r0, r6, #0
	adds r1, r5, #0
	mov r2, sl
	bl sub_803E448
	lsls r0, r0, #0x18
	adds r2, r4, #0
	cmp r0, #0
	beq _0803BB88
	ldr r0, _0803BBEC  @ gBmMapRange
	ldr r1, [r0]
	lsls r0, r5, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r1, r0, r6
	ldrb r0, [r1]
	cmp r0, r9
	bhi _0803BB88
	adds r1, r0, #0
	mov r9, r1
	lsrs r0, r2, #0x10
	str r0, [sp, #0x10]
	lsrs r1, r7, #0x10
	str r1, [sp, #0x14]
_0803BB88:
	ldr r1, _0803BBF0  @ 0xFFFF0000
	adds r0, r2, r1
	lsrs r4, r0, #0x10
	lsls r1, r4, #0x10
	cmp r1, #0
	bge _0803BAF2
_0803BB94:
	ldr r1, _0803BBF0  @ 0xFFFF0000
	adds r0, r7, r1
_0803BB98:
	lsrs r2, r0, #0x10
	cmp r0, #0
	bge _0803BADC
	ldr r1, [sp, #0x10]
	lsls r0, r1, #0x10
	asrs r2, r0, #0x10
	cmp r2, #0
	blt _0803BBC0
	ldr r0, [sp, #0x14]
	lsls r1, r0, #0x10
	asrs r1, r1, #0x10
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	adds r0, r2, #0
	ldr r2, [sp, #0xc]
	movs r3, #0
	bl AiSetDecision
_0803BBC0:
	add sp, #0x18
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803BBD0: .4byte gBmMapSize
_0803BBD4: .4byte gBmMapMovement
_0803BBD8: .4byte gBmMapUnit
_0803BBDC: .4byte gActiveUnitId
_0803BBE0: .4byte gActiveUnit
_0803BBE4: .4byte gAiState
_0803BBE8: .4byte gBmMapUnk
_0803BBEC: .4byte gBmMapRange
_0803BBF0: .4byte 0xFFFF0000

	THUMB_FUNC_END AiTryMoveTowards

	THUMB_FUNC_START sub_803BBF4
sub_803BBF4: @ 0x0803BBF4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x18
	ldr r4, [sp, #0x38]
	lsls r0, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r6, r1, #0x10
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	str r2, [sp, #0xc]
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	mov sl, r3
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	movs r1, #0
	str r1, [sp, #0x14]
	ldr r1, _0803BC50  @ gActiveUnit
	ldr r1, [r1]
	movs r2, #0x10
	ldrsb r2, [r1, r2]
	lsrs r5, r0, #0x10
	asrs r0, r0, #0x10
	cmp r2, r0
	bne _0803BC54
	ldrb r1, [r1, #0x11]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	lsls r0, r6, #0x10
	asrs r0, r0, #0x10
	cmp r1, r0
	bne _0803BC54
	ldr r0, [sp, #0x14]
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	adds r0, r2, #0
	ldr r2, [sp, #0xc]
	movs r3, #0
	bl AiSetDecision
	b _0803BDAC
	.align 2, 0
_0803BC50: .4byte gActiveUnit
_0803BC54:
	cmp r4, #0
	beq _0803BC78
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	lsls r4, r6, #0x10
	asrs r4, r4, #0x10
	ldr r0, _0803BC74  @ gActiveUnit
	ldr r0, [r0]
	bl GetUnitMovementCost
	adds r2, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_8040F28
	b _0803BC88
	.align 2, 0
_0803BC74: .4byte gActiveUnit
_0803BC78:
	lsls r0, r5, #0x10
	asrs r0, r0, #0x10
	lsls r1, r6, #0x10
	asrs r1, r1, #0x10
	ldr r2, _0803BCB8  @ gActiveUnit
	ldr r2, [r2]
	bl sub_8040F54
_0803BC88:
	ldr r4, _0803BCB8  @ gActiveUnit
	ldr r0, [r4]
	bl GenerateUnitMovementMap
	ldr r2, [r4]
	movs r0, #0x11
	ldrsb r0, [r2, r0]
	ldr r1, _0803BCBC  @ gBmMapRange
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	mov r9, r0
	ldr r1, _0803BCC0  @ 0x0000FFFF
	str r1, [sp, #0x10]
	ldr r0, _0803BCC4  @ gBmMapSize
	ldrh r0, [r0, #2]
	subs r0, #1
	lsls r0, r0, #0x10
	b _0803BD84
	.align 2, 0
_0803BCB8: .4byte gActiveUnit
_0803BCBC: .4byte gBmMapRange
_0803BCC0: .4byte 0x0000FFFF
_0803BCC4: .4byte gBmMapSize
_0803BCC8:
	ldr r0, _0803BDBC  @ gBmMapSize
	ldrh r0, [r0]
	subs r0, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	lsls r1, r4, #0x10
	lsls r7, r2, #0x10
	cmp r1, #0
	blt _0803BD80
	asrs r0, r7, #0xe
	mov r8, r0
_0803BCDE:
	ldr r0, _0803BDC0  @ gBmMapMovement
	ldr r0, [r0]
	add r0, r8
	asrs r3, r1, #0x10
	ldr r0, [r0]
	adds r0, r0, r3
	ldrb r0, [r0]
	lsls r2, r4, #0x10
	cmp r0, #0x78
	bhi _0803BD74
	ldr r0, _0803BDC4  @ gBmMapUnit
	ldr r0, [r0]
	add r0, r8
	ldr r0, [r0]
	adds r0, r0, r3
	ldrb r1, [r0]
	cmp r1, #0
	beq _0803BD0A
	ldr r0, _0803BDC8  @ gActiveUnitId
	ldrb r0, [r0]
	cmp r1, r0
	bne _0803BD74
_0803BD0A:
	mov r1, sl
	cmp r1, #0
	bne _0803BD3E
	ldr r0, _0803BDCC  @ gActiveUnit
	ldr r0, [r0]
	movs r1, #0x1d
	ldrsb r1, [r0, r1]
	ldr r0, [r0, #4]
	ldrb r0, [r0, #0x12]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r1, r1, r0
	ldr r0, _0803BDD0  @ gAiState
	adds r0, #0x85
	ldrb r0, [r0]
	cmp r1, r0
	bge _0803BD3E
	ldr r0, _0803BDD4  @ gBmMapUnk
	ldr r0, [r0]
	add r0, r8
	ldr r0, [r0]
	adds r0, r0, r3
	ldrb r0, [r0]
	lsls r2, r4, #0x10
	cmp r0, #0
	bne _0803BD74
_0803BD3E:
	lsls r4, r4, #0x10
	asrs r6, r4, #0x10
	asrs r5, r7, #0x10
	adds r0, r6, #0
	adds r1, r5, #0
	mov r2, sl
	bl sub_803E448
	lsls r0, r0, #0x18
	adds r2, r4, #0
	cmp r0, #0
	beq _0803BD74
	ldr r0, _0803BDD8  @ gBmMapRange
	ldr r1, [r0]
	lsls r0, r5, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r1, r0, r6
	ldrb r0, [r1]
	cmp r0, r9
	bhi _0803BD74
	adds r1, r0, #0
	mov r9, r1
	lsrs r0, r2, #0x10
	str r0, [sp, #0x10]
	lsrs r1, r7, #0x10
	str r1, [sp, #0x14]
_0803BD74:
	ldr r1, _0803BDDC  @ 0xFFFF0000
	adds r0, r2, r1
	lsrs r4, r0, #0x10
	lsls r1, r4, #0x10
	cmp r1, #0
	bge _0803BCDE
_0803BD80:
	ldr r1, _0803BDDC  @ 0xFFFF0000
	adds r0, r7, r1
_0803BD84:
	lsrs r2, r0, #0x10
	cmp r0, #0
	bge _0803BCC8
	ldr r1, [sp, #0x10]
	lsls r0, r1, #0x10
	asrs r2, r0, #0x10
	cmp r2, #0
	blt _0803BDAC
	ldr r0, [sp, #0x14]
	lsls r1, r0, #0x10
	asrs r1, r1, #0x10
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	adds r0, r2, #0
	ldr r2, [sp, #0xc]
	movs r3, #0
	bl AiSetDecision
_0803BDAC:
	add sp, #0x18
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803BDBC: .4byte gBmMapSize
_0803BDC0: .4byte gBmMapMovement
_0803BDC4: .4byte gBmMapUnit
_0803BDC8: .4byte gActiveUnitId
_0803BDCC: .4byte gActiveUnit
_0803BDD0: .4byte gAiState
_0803BDD4: .4byte gBmMapUnk
_0803BDD8: .4byte gBmMapRange
_0803BDDC: .4byte 0xFFFF0000

	THUMB_FUNC_END sub_803BBF4

	THUMB_FUNC_START sub_803BDE0
sub_803BDE0: @ 0x0803BDE0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	str r0, [sp, #8]
	adds r6, r3, #0
	lsls r1, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r3, r2, #0x10
	asrs r5, r2, #0x10
	ldr r2, _0803BE34  @ gBmMapUnit
	ldr r0, [r2]
	lsls r2, r5, #2
	adds r0, r2, r0
	lsrs r4, r1, #0x10
	mov r8, r4
	asrs r4, r1, #0x10
	ldr r1, [r0]
	adds r1, r1, r4
	ldr r7, _0803BE38  @ gBmMapUnk
	ldr r0, [r7]
	adds r0, r2, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r1, [r1]
	ldrb r0, [r0]
	orrs r1, r0
	ldr r0, _0803BE3C  @ gBmMapHidden
	ldr r0, [r0]
	adds r2, r2, r0
	ldr r0, [r2]
	adds r0, r0, r4
	ldrb r0, [r0]
	orrs r1, r0
	cmp r1, #0
	bne _0803BE40
	mov r1, r8
	strh r1, [r6]
	strh r3, [r6, #2]
	b _0803BF38
	.align 2, 0
_0803BE34: .4byte gBmMapUnit
_0803BE38: .4byte gBmMapUnk
_0803BE3C: .4byte gBmMapHidden
_0803BE40:
	ldr r0, [sp, #8]
	bl GetUnitMovementCost
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	bl GenerateExtendedMovementMapOnRange
	ldr r0, [sp, #8]
	bl GenerateUnitExtendedMovementMap
	movs r2, #0x7c
	str r2, [sp]
	ldr r0, _0803BE68  @ 0x0000FFFF
	strh r0, [r6]
	ldr r1, _0803BE6C  @ gBmMapSize
	ldrh r0, [r1, #2]
	subs r0, #1
	lsls r0, r0, #0x10
	b _0803BF06
	.align 2, 0
_0803BE68: .4byte 0x0000FFFF
_0803BE6C: .4byte gBmMapSize
_0803BE70:
	ldr r4, _0803BF1C  @ gBmMapSize
	ldrh r0, [r4]
	subs r0, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	lsls r1, r4, #0x10
	lsls r7, r5, #0x10
	str r7, [sp, #8]
	cmp r1, #0
	blt _0803BF00
	asrs r3, r7, #0xe
	ldr r0, _0803BF20  @ gBmMapMovement
	str r0, [sp, #4]
	ldr r2, _0803BF24  @ gBmMapUnit
	mov sl, r2
	ldr r7, _0803BF28  @ gBmMapUnk
	mov r9, r7
	ldr r0, _0803BF2C  @ gBmMapHidden
	mov r8, r0
	ldr r2, _0803BF30  @ gBmMapRange
	mov ip, r2
_0803BE9A:
	ldr r7, [sp, #4]
	ldr r0, [r7]
	adds r0, r3, r0
	asrs r2, r1, #0x10
	ldr r0, [r0]
	adds r0, r0, r2
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _0803BEF2
	mov r1, sl
	ldr r0, [r1]
	adds r0, r3, r0
	ldr r1, [r0]
	adds r1, r1, r2
	mov r7, r9
	ldr r0, [r7]
	adds r0, r3, r0
	ldr r0, [r0]
	adds r0, r0, r2
	ldrb r1, [r1]
	ldrb r0, [r0]
	orrs r1, r0
	mov r7, r8
	ldr r0, [r7]
	adds r0, r3, r0
	ldr r0, [r0]
	adds r0, r0, r2
	ldrb r0, [r0]
	orrs r1, r0
	cmp r1, #0
	bne _0803BEF2
	mov r1, ip
	ldr r0, [r1]
	adds r0, r3, r0
	ldr r0, [r0]
	adds r1, r0, r2
	ldrb r0, [r1]
	ldr r2, [sp]
	cmp r0, r2
	bhi _0803BEF2
	adds r1, r0, #0
	str r1, [sp]
	strh r4, [r6]
	strh r5, [r6, #2]
_0803BEF2:
	lsls r0, r4, #0x10
	ldr r4, _0803BF34  @ 0xFFFF0000
	adds r0, r0, r4
	lsrs r4, r0, #0x10
	lsls r1, r4, #0x10
	cmp r1, #0
	bge _0803BE9A
_0803BF00:
	ldr r7, [sp, #8]
	ldr r1, _0803BF34  @ 0xFFFF0000
	adds r0, r7, r1
_0803BF06:
	lsrs r5, r0, #0x10
	cmp r0, #0
	bge _0803BE70
	movs r2, #0
	ldrsh r1, [r6, r2]
	movs r0, #1
	negs r0, r0
	cmp r1, r0
	bne _0803BF38
	movs r0, #0
	b _0803BF3A
	.align 2, 0
_0803BF1C: .4byte gBmMapSize
_0803BF20: .4byte gBmMapMovement
_0803BF24: .4byte gBmMapUnit
_0803BF28: .4byte gBmMapUnk
_0803BF2C: .4byte gBmMapHidden
_0803BF30: .4byte gBmMapRange
_0803BF34: .4byte 0xFFFF0000
_0803BF38:
	movs r0, #1
_0803BF3A:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_803BDE0

	THUMB_FUNC_START sub_803BF4C
sub_803BF4C: @ 0x0803BF4C
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	movs r3, #0
	ldr r2, _0803BF58  @ gUnknown_085A8150
	b _0803BF74
	.align 2, 0
_0803BF58: .4byte gUnknown_085A8150
_0803BF5C:
	ldr r1, [r2]
	b _0803BF66
_0803BF60:
	cmp r0, r4
	beq _0803BF7A
	adds r1, #1
_0803BF66:
	ldrb r0, [r1]
	cmp r0, #0
	bne _0803BF60
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	adds r2, #4
_0803BF74:
	ldr r0, [r2]
	cmp r0, #0
	bne _0803BF5C
_0803BF7A:
	adds r0, r3, #0
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_803BF4C

	THUMB_FUNC_START sub_803BF84
sub_803BF84: @ 0x0803BF84
	push {r4, r5, lr}
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	movs r4, #1
_0803BF8C:
	adds r0, r4, #0
	bl GetUnit
	adds r1, r0, #0
	cmp r1, #0
	beq _0803BFC0
	ldr r0, [r1]
	cmp r0, #0
	beq _0803BFC0
	ldrb r0, [r0, #4]
	cmp r0, r5
	bne _0803BFC0
	ldr r1, [r1, #0xc]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _0803BFB2
_0803BFAE:
	movs r0, #1
	b _0803BFC8
_0803BFB2:
	ldr r0, _0803BFBC  @ 0x00010005
	ands r1, r0
	cmp r1, #0
	bne _0803BFC6
	b _0803BFAE
	.align 2, 0
_0803BFBC: .4byte 0x00010005
_0803BFC0:
	adds r4, #1
	cmp r4, #0xbf
	ble _0803BF8C
_0803BFC6:
	movs r0, #0
_0803BFC8:
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_803BF84

	THUMB_FUNC_START sub_803BFD0
sub_803BFD0: @ 0x0803BFD0
	push {r4, r5, r6, lr}
	ldr r4, [sp, #0x10]
	lsls r1, r1, #0x10
	lsrs r5, r1, #0x10
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	adds r6, r3, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	subs r1, r0, r2
	cmp r1, #0
	bge _0803BFF2
	subs r1, r2, r0
_0803BFF2:
	lsls r0, r5, #0x10
	asrs r2, r0, #0x10
	subs r0, r2, r3
	cmp r0, #0
	bge _0803BFFE
	subs r0, r6, r2
_0803BFFE:
	adds r0, r1, r0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, r4
	bls _0803C00C
	movs r0, #0
	b _0803C00E
_0803C00C:
	movs r0, #1
_0803C00E:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_803BFD0

	THUMB_FUNC_START sub_803C014
sub_803C014: @ 0x0803C014
	push {lr}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x18
	ldr r2, _0803C03C  @ gBmMapTerrain
	ldr r2, [r2]
	lsrs r1, r1, #0x16
	adds r1, r1, r2
	ldr r1, [r1]
	adds r1, r1, r0
	ldrb r0, [r1]
	cmp r0, #0x21
	beq _0803C04A
	cmp r0, #0x21
	bgt _0803C040
	cmp r0, #3
	beq _0803C058
	b _0803C05C
	.align 2, 0
_0803C03C: .4byte gBmMapTerrain
_0803C040:
	cmp r0, #0x24
	beq _0803C058
	cmp r0, #0x37
	bne _0803C05C
	b _0803C058
_0803C04A:
	mov r0, sp
	bl sub_803B994
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _0803C05C
_0803C058:
	movs r0, #1
	b _0803C05E
_0803C05C:
	movs r0, #0
_0803C05E:
	add sp, #4
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_803C014

	THUMB_FUNC_START SetupUnitInventoryAIFlags
SetupUnitInventoryAIFlags: @ 0x0803C064
	push {r4, r5, r6, r7, lr}
	ldr r0, _0803C118  @ gAiState
	adds r0, #0x85
	movs r1, #0
	strb r1, [r0]
	movs r4, #1
_0803C070:
	adds r0, r4, #0
	bl GetUnit
	adds r5, r0, #0
	adds r7, r4, #1
	cmp r5, #0
	beq _0803C10A
	ldr r0, [r5]
	cmp r0, #0
	beq _0803C10A
	ldr r0, [r5, #0xc]
	ldr r1, _0803C11C  @ 0x00010005
	ands r0, r1
	cmp r0, #0
	bne _0803C10A
	ldr r0, [r5, #4]
	ldrb r0, [r0, #0x12]
	ldrb r1, [r5, #0x1d]
	adds r0, r0, r1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	ldr r0, _0803C118  @ gAiState
	adds r0, #0x85
	ldrb r2, [r0]
	cmp r1, r2
	bls _0803C0A6
	strb r1, [r0]
_0803C0A6:
	movs r6, #0
	ldrh r4, [r5, #0x1e]
	cmp r4, #0
	beq _0803C104
_0803C0AE:
	adds r0, r5, #0
	adds r1, r4, #0
	bl CanUnitUseWeapon
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0803C0CA
	adds r0, r5, #0
	adds r1, r4, #0
	bl CanUnitUseStaff
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803C0F0
_0803C0CA:
	adds r0, r4, #0
	bl GetItemAttributes
	movs r1, #2
	ands r1, r0
	cmp r1, #0
	beq _0803C0E0
	ldrb r1, [r5, #0xa]
	movs r0, #1
	orrs r0, r1
	strb r0, [r5, #0xa]
_0803C0E0:
	adds r0, r5, #0
	adds r1, r4, #0
	bl SetupUnitStatusStaffAIFlags
	adds r0, r5, #0
	adds r1, r4, #0
	bl SetupUnitHealStaffAIFlags
_0803C0F0:
	adds r6, #1
	cmp r6, #4
	bgt _0803C104
	lsls r1, r6, #1
	adds r0, r5, #0
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r4, [r0]
	cmp r4, #0
	bne _0803C0AE
_0803C104:
	adds r0, r5, #0
	bl SaveNumberOfAlliedUnitsIn0To8Range
_0803C10A:
	adds r4, r7, #0
	cmp r4, #0x3f
	ble _0803C070
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803C118: .4byte gAiState
_0803C11C: .4byte 0x00010005

	THUMB_FUNC_END SetupUnitInventoryAIFlags

	THUMB_FUNC_START SetupUnitStatusStaffAIFlags
SetupUnitStatusStaffAIFlags: @ 0x0803C120
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	lsls r1, r1, #0x10
	lsrs r5, r1, #0x10
	adds r0, r5, #0
	bl GetItemAttributes
	movs r1, #4
	ands r1, r0
	cmp r1, #0
	beq _0803C162
	movs r4, #2
	adds r0, r5, #0
	bl GetItemIndex
	cmp r0, #0x52
	beq _0803C156
	cmp r0, #0x52
	bgt _0803C14C
	cmp r0, #0x51
	beq _0803C152
	b _0803C15C
_0803C14C:
	cmp r0, #0x53
	beq _0803C15A
	b _0803C15C
_0803C152:
	movs r4, #8
	b _0803C15C
_0803C156:
	movs r4, #0x10
	b _0803C15C
_0803C15A:
	movs r4, #0x20
_0803C15C:
	ldrb r0, [r6, #0xa]
	orrs r4, r0
	strb r4, [r6, #0xa]
_0803C162:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END SetupUnitStatusStaffAIFlags

	THUMB_FUNC_START SetupUnitHealStaffAIFlags
SetupUnitHealStaffAIFlags: @ 0x0803C168
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	lsls r1, r1, #0x10
	lsrs r4, r1, #0x10
	movs r5, #0
	adds r0, r4, #0
	bl GetItemAttributes
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	beq _0803C18C
	adds r0, r4, #0
	bl GetItemMaxRange
	cmp r0, #1
	ble _0803C18C
	movs r5, #0x40
_0803C18C:
	adds r0, r4, #0
	bl GetItemUseEffect
	cmp r0, #1
	blt _0803C1A6
	cmp r0, #5
	ble _0803C1A2
	cmp r0, #0x22
	bgt _0803C1A6
	cmp r0, #0x21
	blt _0803C1A6
_0803C1A2:
	movs r0, #4
	orrs r5, r0
_0803C1A6:
	ldrb r0, [r6, #0xa]
	orrs r5, r0
	strb r5, [r6, #0xa]
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END SetupUnitHealStaffAIFlags

	THUMB_FUNC_START SaveNumberOfAlliedUnitsIn0To8Range
SaveNumberOfAlliedUnitsIn0To8Range: @ 0x0803C1B4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	movs r0, #0
	mov r8, r0
	ldr r0, _0803C24C  @ gBmMapMovement
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFill
	movs r0, #0x10
	ldrsb r0, [r6, r0]
	movs r1, #0x11
	ldrsb r1, [r6, r1]
	movs r2, #1
	movs r3, #8
	bl MapAddInBoundedRange
	ldr r0, _0803C250  @ gBmMapSize
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r1, r0, #1
	cmp r1, #0
	blt _0803C23A
_0803C1E6:
	ldr r0, _0803C250  @ gBmMapSize
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r4, r0, #1
	subs r7, r1, #1
	cmp r4, #0
	blt _0803C234
	lsls r5, r1, #2
_0803C1F6:
	ldr r0, _0803C24C  @ gBmMapMovement
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0803C22E
	ldr r0, _0803C254  @ gBmMapUnit
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r1, r0, r4
	ldrb r0, [r1]
	cmp r0, #0
	beq _0803C22E
	movs r0, #0xb
	ldrsb r0, [r6, r0]
	ldrb r1, [r1]
	bl AreUnitsAllied
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803C22E
	movs r0, #1
	add r8, r0
_0803C22E:
	subs r4, #1
	cmp r4, #0
	bge _0803C1F6
_0803C234:
	adds r1, r7, #0
	cmp r1, #0
	bge _0803C1E6
_0803C23A:
	adds r0, r6, #0
	adds r0, #0x46
	mov r1, r8
	strb r1, [r0]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803C24C: .4byte gBmMapMovement
_0803C250: .4byte gBmMapSize
_0803C254: .4byte gBmMapUnit

	THUMB_FUNC_END SaveNumberOfAlliedUnitsIn0To8Range

	THUMB_FUNC_START CharStoreAI
CharStoreAI: @ 0x0803C258
	adds r3, r0, #0
	ldrb r0, [r1, #0x10]
	adds r2, r3, #0
	adds r2, #0x42
	strb r0, [r2]
	ldrb r2, [r1, #0x11]
	adds r0, r3, #0
	adds r0, #0x44
	strb r2, [r0]
	adds r3, #0x40
	ldrh r0, [r3]
	ldr r2, _0803C280  @ 0x0000FFF8
	ands r2, r0
	ldrb r0, [r1, #0x12]
	orrs r2, r0
	ldrb r0, [r1, #0x13]
	lsls r0, r0, #8
	orrs r2, r0
	strh r2, [r3]
	bx lr
	.align 2, 0
_0803C280: .4byte 0x0000FFF8

	THUMB_FUNC_END CharStoreAI

	THUMB_FUNC_START sub_803C284
sub_803C284: @ 0x0803C284
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	mov r8, r0
	movs r0, #0
	mov r9, r0
	ldr r0, _0803C338  @ gBmMapSize
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r6, r0, #1
	cmp r6, #0
	blt _0803C32E
_0803C2A0:
	ldr r0, _0803C338  @ gBmMapSize
	movs r1, #0
	ldrsh r0, [r0, r1]
	subs r5, r0, #1
	subs r0, r6, #1
	mov sl, r0
	cmp r5, #0
	blt _0803C328
	lsls r7, r6, #2
_0803C2B2:
	ldr r0, _0803C33C  @ gBmMapMovement
	ldr r0, [r0]
	adds r0, r7, r0
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _0803C322
	ldr r0, _0803C340  @ gBmMapRange
	ldr r0, [r0]
	adds r0, r7, r0
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0803C322
	ldr r0, _0803C344  @ gBmMapUnit
	ldr r0, [r0]
	adds r0, r7, r0
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r1, [r0]
	cmp r1, #0
	beq _0803C2EE
	ldr r0, _0803C348  @ gActiveUnitId
	ldrb r0, [r0]
	cmp r1, r0
	bne _0803C322
_0803C2EE:
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_803E23C
	adds r4, r0, #0
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_803E27C
	adds r4, r4, r0
	ldr r0, _0803C34C  @ gBmMapUnk
	ldr r0, [r0]
	adds r0, r7, r0
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r0, [r0]
	lsrs r0, r0, #3
	subs r4, r4, r0
	ldr r1, _0803C350  @ 0x7FFFFFFF
	adds r4, r4, r1
	cmp r9, r4
	bcs _0803C322
	mov r0, r8
	strh r5, [r0]
	strh r6, [r0, #2]
	mov r9, r4
_0803C322:
	subs r5, #1
	cmp r5, #0
	bge _0803C2B2
_0803C328:
	mov r6, sl
	cmp r6, #0
	bge _0803C2A0
_0803C32E:
	mov r1, r9
	cmp r1, #0
	bne _0803C354
	movs r0, #0
	b _0803C356
	.align 2, 0
_0803C338: .4byte gBmMapSize
_0803C33C: .4byte gBmMapMovement
_0803C340: .4byte gBmMapRange
_0803C344: .4byte gBmMapUnit
_0803C348: .4byte gActiveUnitId
_0803C34C: .4byte gBmMapUnk
_0803C350: .4byte 0x7FFFFFFF
_0803C354:
	movs r0, #1
_0803C356:
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_803C284

	THUMB_FUNC_START sub_803C364
sub_803C364: @ 0x0803C364
	push {r4, r5, r6, lr}
	movs r6, #0
	bl GetCurrentPhase
	adds r5, r0, #0
	adds r4, r5, #1
	b _0803C39E
_0803C372:
	adds r0, r4, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq _0803C39A
	ldr r0, [r2]
	cmp r0, #0
	beq _0803C39A
	ldr r0, [r2, #0xc]
	ldr r1, _0803C3AC  @ 0x00010005
	ands r0, r1
	cmp r0, #0
	bne _0803C39A
	ldrb r1, [r2, #0xa]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0803C39A
	adds r6, #1
_0803C39A:
	adds r4, #1
	adds r0, r5, #0
_0803C39E:
	adds r0, #0x80
	cmp r4, r0
	blt _0803C372
	adds r0, r6, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0803C3AC: .4byte 0x00010005

	THUMB_FUNC_END sub_803C364

	THUMB_FUNC_START sub_803C3B0
sub_803C3B0: @ 0x0803C3B0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	movs r7, #0
	ldr r0, _0803C43C  @ gBmMapSize
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r1, r0, #1
	cmp r1, #0
	blt _0803C430
_0803C3C4:
	ldr r0, _0803C43C  @ gBmMapSize
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r4, r0, #1
	subs r0, r1, #1
	mov r8, r0
	cmp r4, #0
	blt _0803C42A
	lsls r5, r1, #2
_0803C3D6:
	ldr r0, _0803C440  @ gBmMapRange
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0803C424
	ldr r6, _0803C444  @ gBmMapUnit
	ldr r0, [r6]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r1, r0, r4
	ldrb r0, [r1]
	cmp r0, #0
	beq _0803C424
	ldr r0, _0803C448  @ gActiveUnitId
	ldrb r0, [r0]
	ldrb r1, [r1]
	bl AreUnitsAllied
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803C424
	ldr r0, [r6]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	bl GetUnit
	ldrb r1, [r0, #0xa]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0803C424
	adds r7, #1
_0803C424:
	subs r4, #1
	cmp r4, #0
	bge _0803C3D6
_0803C42A:
	mov r1, r8
	cmp r1, #0
	bge _0803C3C4
_0803C430:
	adds r0, r7, #0
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0803C43C: .4byte gBmMapSize
_0803C440: .4byte gBmMapRange
_0803C444: .4byte gBmMapUnit
_0803C448: .4byte gActiveUnitId

	THUMB_FUNC_END sub_803C3B0

	THUMB_FUNC_START sub_803C44C
sub_803C44C: @ 0x0803C44C
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	movs r5, #0
_0803C452:
	lsls r0, r5, #1
	adds r1, r6, #0
	adds r1, #0x1e
	adds r1, r1, r0
	ldrh r0, [r1]
	adds r4, r0, #0
	cmp r4, #0
	beq _0803C488
	adds r0, r4, #0
	bl GetItemAttributes
	movs r1, #6
	ands r1, r0
	cmp r1, #0
	beq _0803C482
	adds r0, r6, #0
	adds r1, r4, #0
	bl CanUnitUseStaff
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803C482
	movs r0, #1
	b _0803C48A
_0803C482:
	adds r5, #1
	cmp r5, #4
	ble _0803C452
_0803C488:
	movs r0, #0
_0803C48A:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_803C44C

	THUMB_FUNC_START sub_803C490
sub_803C490: @ 0x0803C490
	push {lr}
	adds r2, r0, #0
	ldr r0, _0803C4AC  @ gAiState
	adds r0, #0x7b
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0803C4B0
	adds r0, r2, #0
	movs r1, #0
	bl GenerateUnitMovementMapExt
	b _0803C4B6
	.align 2, 0
_0803C4AC: .4byte gAiState
_0803C4B0:
	adds r0, r2, #0
	bl GenerateUnitMovementMap
_0803C4B6:
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_803C490

	THUMB_FUNC_START AiTryExecScriptA
AiTryExecScriptA: @ 0x0803C4BC
	push {r4, lr}
	ldr r3, _0803C4FC  @ gUnknown_030017D0
	ldr r2, _0803C500  @ gUnknown_085A91E4
	ldr r0, _0803C504  @ gActiveUnit
	ldr r0, [r0]
	adds r1, r0, #0
	adds r1, #0x42
	ldrb r1, [r1]
	ldr r2, [r2]
	lsls r1, r1, #2
	adds r1, r1, r2
	ldr r2, [r1]
	str r2, [r3]
	adds r0, #0x43
	ldrb r1, [r0]
	lsls r1, r1, #4
	adds r2, r2, r1
	str r2, [r3]
	ldr r4, _0803C508  @ gUnknown_030017C8
	movs r1, #1
	strb r1, [r4]
	ldr r2, _0803C50C  @ gUnknown_030017CC
	movs r1, #0
	str r1, [r2]
	bl sub_803C5DC
	movs r0, #0
	ldrsb r0, [r4, r0]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0803C4FC: .4byte gUnknown_030017D0
_0803C500: .4byte gUnknown_085A91E4
_0803C504: .4byte gActiveUnit
_0803C508: .4byte gUnknown_030017C8
_0803C50C: .4byte gUnknown_030017CC

	THUMB_FUNC_END AiTryExecScriptA

	THUMB_FUNC_START AiExecFallbackScriptA
AiExecFallbackScriptA: @ 0x0803C510
	push {r4, lr}
	ldr r1, _0803C538  @ gUnknown_030017D0
	ldr r0, _0803C53C  @ gUnknown_085A812C
	str r0, [r1]
	ldr r4, _0803C540  @ gUnknown_030017C8
	movs r0, #1
	strb r0, [r4]
	ldr r1, _0803C544  @ gUnknown_030017CC
	movs r0, #0
	str r0, [r1]
	ldr r0, _0803C548  @ gActiveUnit
	ldr r0, [r0]
	adds r0, #0x43
	bl sub_803C5DC
	movs r0, #0
	ldrsb r0, [r4, r0]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0803C538: .4byte gUnknown_030017D0
_0803C53C: .4byte gUnknown_085A812C
_0803C540: .4byte gUnknown_030017C8
_0803C544: .4byte gUnknown_030017CC
_0803C548: .4byte gActiveUnit

	THUMB_FUNC_END AiExecFallbackScriptA

	THUMB_FUNC_START AiTryExecScriptB
AiTryExecScriptB: @ 0x0803C54C
	push {r4, lr}
	ldr r3, _0803C58C  @ gUnknown_030017D0
	ldr r2, _0803C590  @ gUnknown_085A91D8
	ldr r0, _0803C594  @ gActiveUnit
	ldr r0, [r0]
	adds r1, r0, #0
	adds r1, #0x44
	ldrb r1, [r1]
	ldr r2, [r2]
	lsls r1, r1, #2
	adds r1, r1, r2
	ldr r2, [r1]
	str r2, [r3]
	adds r0, #0x45
	ldrb r1, [r0]
	lsls r1, r1, #4
	adds r2, r2, r1
	str r2, [r3]
	ldr r4, _0803C598  @ gUnknown_030017C8
	movs r1, #1
	strb r1, [r4]
	ldr r2, _0803C59C  @ gUnknown_030017CC
	movs r1, #1
	str r1, [r2]
	bl sub_803C5DC
	movs r0, #0
	ldrsb r0, [r4, r0]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0803C58C: .4byte gUnknown_030017D0
_0803C590: .4byte gUnknown_085A91D8
_0803C594: .4byte gActiveUnit
_0803C598: .4byte gUnknown_030017C8
_0803C59C: .4byte gUnknown_030017CC

	THUMB_FUNC_END AiTryExecScriptB

	THUMB_FUNC_START AiExecFallbackScriptB
AiExecFallbackScriptB: @ 0x0803C5A0
	push {r4, lr}
	ldr r1, _0803C5C8  @ gUnknown_030017D0
	ldr r0, _0803C5CC  @ gUnknown_085A813C
	str r0, [r1]
	ldr r4, _0803C5D0  @ gUnknown_030017C8
	movs r0, #1
	strb r0, [r4]
	ldr r1, _0803C5D4  @ gUnknown_030017CC
	movs r0, #1
	str r0, [r1]
	ldr r0, _0803C5D8  @ gActiveUnit
	ldr r0, [r0]
	adds r0, #0x45
	bl sub_803C5DC
	movs r0, #0
	ldrsb r0, [r4, r0]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0803C5C8: .4byte gUnknown_030017D0
_0803C5CC: .4byte gUnknown_085A813C
_0803C5D0: .4byte gUnknown_030017C8
_0803C5D4: .4byte gUnknown_030017CC
_0803C5D8: .4byte gActiveUnit

	THUMB_FUNC_END AiExecFallbackScriptB

	THUMB_FUNC_START sub_803C5DC
sub_803C5DC: @ 0x0803C5DC
	push {r4, lr}
	sub sp, #0x70
	adds r4, r0, #0
	ldr r1, _0803C604  @ gUnknown_080D80FC
	mov r0, sp
	movs r2, #0x70
	bl memcpy
	ldr r1, _0803C608  @ gUnknown_030017D0
	ldr r0, [r1]
	ldrb r0, [r0]
	cmp r0, #0x1c
	bls _0803C618
	ldr r0, _0803C60C  @ gUnknown_030017CC
	ldr r0, [r0]
	cmp r0, #0
	bne _0803C614
	ldr r0, _0803C610  @ gUnknown_085A812C
	b _0803C616
	.align 2, 0
_0803C604: .4byte gUnknown_080D80FC
_0803C608: .4byte gUnknown_030017D0
_0803C60C: .4byte gUnknown_030017CC
_0803C610: .4byte gUnknown_085A812C
_0803C614:
	ldr r0, _0803C63C  @ gUnknown_085A813C
_0803C616:
	str r0, [r1]
_0803C618:
	ldr r1, _0803C640  @ gAiState
	ldr r0, _0803C644  @ gUnknown_030017D0
	ldr r2, [r0]
	ldrb r0, [r2, #2]
	adds r1, #0x7e
	strb r0, [r1]
	ldrb r0, [r2]
	lsls r0, r0, #2
	add r0, sp
	ldr r1, [r0]
	adds r0, r4, #0
	bl _call_via_r1
	add sp, #0x70
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0803C63C: .4byte gUnknown_085A813C
_0803C640: .4byte gAiState
_0803C644: .4byte gUnknown_030017D0

	THUMB_FUNC_END sub_803C5DC

	THUMB_FUNC_START sub_803C648
sub_803C648: @ 0x0803C648
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r0, _0803C678  @ gUnknown_030017D0
	ldr r2, [r0]
	ldrb r5, [r2, #3]
	movs r4, #0
	ldr r0, [r2, #8]
	ldrb r1, [r2, #1]
	ldr r2, [r2, #4]
	bl sub_803A71C
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _0803C6D4
	ldr r0, _0803C67C  @ gUnknown_030017CC
	ldr r0, [r0]
	cmp r0, #0
	bne _0803C688
	ldr r1, _0803C680  @ gUnknown_085A91E4
	ldr r0, _0803C684  @ gActiveUnit
	ldr r0, [r0]
	adds r0, #0x42
	b _0803C690
	.align 2, 0
_0803C678: .4byte gUnknown_030017D0
_0803C67C: .4byte gUnknown_030017CC
_0803C680: .4byte gUnknown_085A91E4
_0803C684: .4byte gActiveUnit
_0803C688:
	ldr r1, _0803C6A8  @ gUnknown_085A91D8
	ldr r0, _0803C6AC  @ gActiveUnit
	ldr r0, [r0]
	adds r0, #0x44
_0803C690:
	ldrb r0, [r0]
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r2, [r0]
	cmp r5, #0
	beq _0803C6D0
	lsls r0, r4, #4
	adds r1, r0, r2
	ldrb r0, [r1]
	ldr r3, _0803C6B0  @ gUnknown_030017C8
	b _0803C6C0
	.align 2, 0
_0803C6A8: .4byte gUnknown_085A91D8
_0803C6AC: .4byte gActiveUnit
_0803C6B0: .4byte gUnknown_030017C8
_0803C6B4:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	lsls r0, r4, #4
	adds r1, r0, r2
	ldrb r0, [r1]
_0803C6C0:
	cmp r0, #0x1c
	bne _0803C6B4
	ldrb r0, [r1, #3]
	cmp r0, r5
	bne _0803C6B4
	adds r0, r4, #1
	strb r0, [r6]
	b _0803C6DC
_0803C6D0:
	strb r5, [r6]
	b _0803C6DA
_0803C6D4:
	ldrb r0, [r6]
	adds r0, #1
	strb r0, [r6]
_0803C6DA:
	ldr r3, _0803C6E8  @ gUnknown_030017C8
_0803C6DC:
	movs r0, #0
	strb r0, [r3]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0803C6E8: .4byte gUnknown_030017C8

	THUMB_FUNC_END sub_803C648

	THUMB_FUNC_START sub_803C6EC
sub_803C6EC: @ 0x0803C6EC
	push {r4, lr}
	adds r4, r0, #0
	ldr r2, _0803C710  @ gUnknown_030017D4
	ldr r0, _0803C714  @ gUnknown_030017D0
	ldr r0, [r0]
	ldr r1, [r0, #8]
	str r1, [r2]
	ldr r0, [r0, #0xc]
	bl _call_via_r1
	ldr r1, _0803C718  @ gUnknown_030017C8
	strb r0, [r1]
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0803C710: .4byte gUnknown_030017D4
_0803C714: .4byte gUnknown_030017D0
_0803C718: .4byte gUnknown_030017C8

	THUMB_FUNC_END sub_803C6EC

	THUMB_FUNC_START sub_803C71C
sub_803C71C: @ 0x0803C71C
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r0, _0803C77C  @ gUnknown_030017D0
	ldr r0, [r0]
	ldrb r3, [r0, #1]
	adds r6, r3, #0
	ldrb r4, [r0, #2]
	adds r7, r4, #0
	cmp r3, #0xff
	beq _0803C740
	ldr r1, _0803C780  @ gActiveUnit
	ldr r0, [r1]
	adds r0, #0x42
	movs r2, #0
	strb r3, [r0]
	ldr r0, [r1]
	adds r0, #0x43
	strb r2, [r0]
_0803C740:
	cmp r4, #0xff
	beq _0803C754
	ldr r1, _0803C780  @ gActiveUnit
	ldr r0, [r1]
	adds r0, #0x44
	movs r2, #0
	strb r4, [r0]
	ldr r0, [r1]
	adds r0, #0x45
	strb r2, [r0]
_0803C754:
	ldr r0, _0803C784  @ gUnknown_030017CC
	ldr r0, [r0]
	cmp r0, #0
	bne _0803C760
	cmp r6, #0xff
	beq _0803C768
_0803C760:
	cmp r0, #1
	bne _0803C76E
	cmp r7, #0xff
	bne _0803C76E
_0803C768:
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
_0803C76E:
	ldr r0, _0803C788  @ gAiState
	adds r0, #0x79
	movs r1, #0
	strb r1, [r0]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803C77C: .4byte gUnknown_030017D0
_0803C780: .4byte gActiveUnit
_0803C784: .4byte gUnknown_030017CC
_0803C788: .4byte gAiState

	THUMB_FUNC_END sub_803C71C

	THUMB_FUNC_START sub_803C78C
sub_803C78C: @ 0x0803C78C
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, _0803C7AC  @ gUnknown_030017D0
	ldr r0, [r0]
	ldrb r4, [r0, #3]
	movs r3, #0
	ldr r0, _0803C7B0  @ gUnknown_030017CC
	ldr r0, [r0]
	cmp r0, #0
	bne _0803C7BC
	ldr r1, _0803C7B4  @ gUnknown_085A91E4
	ldr r0, _0803C7B8  @ gActiveUnit
	ldr r0, [r0]
	adds r0, #0x42
	b _0803C7C4
	.align 2, 0
_0803C7AC: .4byte gUnknown_030017D0
_0803C7B0: .4byte gUnknown_030017CC
_0803C7B4: .4byte gUnknown_085A91E4
_0803C7B8: .4byte gActiveUnit
_0803C7BC:
	ldr r1, _0803C7DC  @ gUnknown_085A91D8
	ldr r0, _0803C7E0  @ gActiveUnit
	ldr r0, [r0]
	adds r0, #0x44
_0803C7C4:
	ldrb r0, [r0]
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r2, [r0]
	cmp r4, #0
	beq _0803C804
	lsls r0, r3, #4
	adds r1, r0, r2
	ldrb r0, [r1]
	ldr r6, _0803C7E4  @ gUnknown_030017C8
	b _0803C7F4
	.align 2, 0
_0803C7DC: .4byte gUnknown_085A91D8
_0803C7E0: .4byte gActiveUnit
_0803C7E4: .4byte gUnknown_030017C8
_0803C7E8:
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	lsls r0, r3, #4
	adds r1, r0, r2
	ldrb r0, [r1]
_0803C7F4:
	cmp r0, #0x1c
	bne _0803C7E8
	ldrb r0, [r1, #3]
	cmp r0, r4
	bne _0803C7E8
	adds r0, r3, #1
	strb r0, [r5]
	b _0803C808
_0803C804:
	strb r4, [r5]
	ldr r6, _0803C814  @ gUnknown_030017C8
_0803C808:
	movs r0, #0
	strb r0, [r6]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0803C814: .4byte gUnknown_030017C8

	THUMB_FUNC_END sub_803C78C

	THUMB_FUNC_START sub_803C818
sub_803C818: @ 0x0803C818
	push {lr}
	adds r1, r0, #0
	ldr r0, _0803C83C  @ gActiveUnit
	ldr r0, [r0]
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldrb r1, [r1, #0xb]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl AreUnitsAllied
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0803C840
	movs r0, #1
	b _0803C842
	.align 2, 0
_0803C83C: .4byte gActiveUnit
_0803C840:
	movs r0, #0
_0803C842:
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_803C818

	THUMB_FUNC_START sub_803C848
sub_803C848: @ 0x0803C848
	push {lr}
	ldr r1, _0803C858  @ gActiveUnit
	ldr r1, [r1]
	cmp r0, r1
	beq _0803C85C
	movs r0, #1
	b _0803C85E
	.align 2, 0
_0803C858: .4byte gActiveUnit
_0803C85C:
	movs r0, #0
_0803C85E:
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_803C848

	THUMB_FUNC_START sub_803C864
sub_803C864: @ 0x0803C864
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0803C89C  @ gUnknown_030017D0
	ldr r0, [r0]
	ldr r0, [r0, #8]
	ldr r1, [r4]
	ldrb r1, [r1, #4]
	bl sub_803ACF8
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq _0803C8A4
	ldr r0, _0803C8A0  @ gActiveUnit
	ldr r0, [r0]
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #0xb
	ldrsb r1, [r4, r1]
	bl AreUnitsAllied
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0803C8A4
	movs r0, #1
	b _0803C8A6
	.align 2, 0
_0803C89C: .4byte gUnknown_030017D0
_0803C8A0: .4byte gActiveUnit
_0803C8A4:
	movs r0, #0
_0803C8A6:
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_803C864

	THUMB_FUNC_START sub_803C8AC
sub_803C8AC: @ 0x0803C8AC
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0803C8E4  @ gUnknown_030017D0
	ldr r0, [r0]
	ldr r0, [r0, #8]
	ldr r1, [r4]
	ldrb r1, [r1, #4]
	bl sub_803ACF8
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq _0803C8DE
	ldr r0, _0803C8E8  @ gActiveUnit
	ldr r0, [r0]
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #0xb
	ldrsb r1, [r4, r1]
	bl AreUnitsAllied
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0803C8EC
_0803C8DE:
	movs r0, #1
	b _0803C8EE
	.align 2, 0
_0803C8E4: .4byte gUnknown_030017D0
_0803C8E8: .4byte gActiveUnit
_0803C8EC:
	movs r0, #0
_0803C8EE:
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_803C8AC

	THUMB_FUNC_START sub_803C8F4
sub_803C8F4: @ 0x0803C8F4
	push {lr}
	adds r2, r0, #0
	ldr r0, [r2]
	ldrb r1, [r0, #4]
	ldr r0, _0803C924  @ gUnknown_030017D0
	ldr r0, [r0]
	ldr r0, [r0, #4]
	cmp r1, r0
	bne _0803C92C
	ldr r0, _0803C928  @ gActiveUnit
	ldr r0, [r0]
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #0xb
	ldrsb r1, [r2, r1]
	bl AreUnitsAllied
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0803C92C
	movs r0, #1
	b _0803C92E
	.align 2, 0
_0803C924: .4byte gUnknown_030017D0
_0803C928: .4byte gActiveUnit
_0803C92C:
	movs r0, #0
_0803C92E:
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_803C8F4

	THUMB_FUNC_START sub_803C934
sub_803C934: @ 0x0803C934
	push {lr}
	adds r2, r0, #0
	ldr r0, [r2, #4]
	ldrb r1, [r0, #4]
	ldr r0, _0803C964  @ gUnknown_030017D0
	ldr r0, [r0]
	ldr r0, [r0, #4]
	cmp r1, r0
	bne _0803C96C
	ldr r0, _0803C968  @ gActiveUnit
	ldr r0, [r0]
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #0xb
	ldrsb r1, [r2, r1]
	bl AreUnitsAllied
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0803C96C
	movs r0, #1
	b _0803C96E
	.align 2, 0
_0803C964: .4byte gUnknown_030017D0
_0803C968: .4byte gActiveUnit
_0803C96C:
	movs r0, #0
_0803C96E:
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_803C934

	THUMB_FUNC_START sub_803C974
sub_803C974: @ 0x0803C974
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	movs r0, #0x64
	bl NextRN_N
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r5, _0803C9C4  @ gUnknown_030017D0
	ldr r1, [r5]
	ldrb r1, [r1, #1]
	cmp r0, r1
	bhi _0803C9F4
	ldr r0, _0803C9C8  @ sub_803C818
	bl sub_803FA40
	lsls r0, r0, #0x18
	asrs r4, r0, #0x18
	cmp r4, #0
	bne _0803C9FC
	ldr r0, [r5]
	ldrh r0, [r0, #4]
	bl sub_803BF84
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _0803C9DC
	ldr r0, [r5]
	ldr r0, [r0, #4]
	bl GetUnitFromCharId
	ldr r0, [r0, #0xc]
	movs r1, #0x20
	ands r0, r1
	cmp r0, #0
	beq _0803C9D0
	ldr r0, _0803C9CC  @ gAiState
	adds r0, #0x86
	movs r1, #3
	b _0803C9E2
	.align 2, 0
_0803C9C4: .4byte gUnknown_030017D0
_0803C9C8: .4byte sub_803C818
_0803C9CC: .4byte gAiState
_0803C9D0:
	ldr r0, _0803C9D8  @ sub_803C8F4
	bl sub_803D450
	b _0803C9FC
	.align 2, 0
_0803C9D8: .4byte sub_803C8F4
_0803C9DC:
	ldr r0, _0803C9EC  @ gAiState
	adds r0, #0x86
	movs r1, #1
_0803C9E2:
	strb r1, [r0]
	ldr r0, _0803C9F0  @ gUnknown_030017C8
	strb r4, [r0]
	b _0803C9FC
	.align 2, 0
_0803C9EC: .4byte gAiState
_0803C9F0: .4byte gUnknown_030017C8
_0803C9F4:
	ldr r0, _0803CA08  @ gAiState
	adds r0, #0x79
	movs r1, #4
	strb r1, [r0]
_0803C9FC:
	ldrb r0, [r6]
	adds r0, #1
	strb r0, [r6]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0803CA08: .4byte gAiState

	THUMB_FUNC_END sub_803C974

	THUMB_FUNC_START sub_803CA0C
sub_803CA0C: @ 0x0803CA0C
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r0, #0x64
	bl NextRN_N
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _0803CA40  @ gUnknown_030017D0
	ldr r1, [r1]
	ldrb r2, [r1, #1]
	cmp r0, r2
	bhi _0803CA64
	ldr r0, [r1, #8]
	cmp r0, #0
	bne _0803CA48
	ldr r4, _0803CA44  @ sub_803C818
	adds r0, r4, #0
	bl sub_803FA40
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0803CA6C
	adds r0, r4, #0
	bl sub_803D450
	b _0803CA6C
	.align 2, 0
_0803CA40: .4byte gUnknown_030017D0
_0803CA44: .4byte sub_803C818
_0803CA48:
	ldr r0, _0803CA5C  @ sub_803C8AC
	bl sub_803FA40
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0803CA6C
	ldr r0, _0803CA60  @ sub_803C864
	bl sub_803D450
	b _0803CA6C
	.align 2, 0
_0803CA5C: .4byte sub_803C8AC
_0803CA60: .4byte sub_803C864
_0803CA64:
	ldr r0, _0803CA78  @ gAiState
	adds r0, #0x79
	movs r1, #4
	strb r1, [r0]
_0803CA6C:
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0803CA78: .4byte gAiState

	THUMB_FUNC_END sub_803CA0C

	THUMB_FUNC_START sub_803CA7C
sub_803CA7C: @ 0x0803CA7C
	ldrb r1, [r0]
	adds r1, #1
	strb r1, [r0]
	bx lr

	THUMB_FUNC_END sub_803CA7C

	THUMB_FUNC_START sub_803CA84
sub_803CA84: @ 0x0803CA84
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r0, #0x64
	bl NextRN_N
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _0803CAC0  @ gUnknown_030017D0
	ldr r1, [r1]
	ldrb r1, [r1, #1]
	cmp r0, r1
	bhi _0803CACC
	ldr r1, _0803CAC4  @ gAiState
	adds r1, #0x7b
	ldrb r2, [r1]
	movs r0, #2
	orrs r0, r2
	strb r0, [r1]
	ldr r4, _0803CAC8  @ sub_803C818
	adds r0, r4, #0
	bl sub_803FA40
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0803CAD4
	adds r0, r4, #0
	bl sub_803D450
	b _0803CAD4
	.align 2, 0
_0803CAC0: .4byte gUnknown_030017D0
_0803CAC4: .4byte gAiState
_0803CAC8: .4byte sub_803C818
_0803CACC:
	ldr r0, _0803CAE0  @ gAiState
	adds r0, #0x79
	movs r1, #4
	strb r1, [r0]
_0803CAD4:
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0803CAE0: .4byte gAiState

	THUMB_FUNC_END sub_803CA84

	THUMB_FUNC_START sub_803CAE4
sub_803CAE4: @ 0x0803CAE4
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r0, #0x64
	bl NextRN_N
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _0803CB14  @ gUnknown_030017D0
	ldr r1, [r1]
	ldrb r1, [r1, #1]
	cmp r0, r1
	bhi _0803CB1C
	ldr r4, _0803CB18  @ sub_803C934
	adds r0, r4, #0
	bl sub_803FA40
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0803CB24
	adds r0, r4, #0
	bl sub_803D450
	b _0803CB24
	.align 2, 0
_0803CB14: .4byte gUnknown_030017D0
_0803CB18: .4byte sub_803C934
_0803CB1C:
	ldr r0, _0803CB30  @ gAiState
	adds r0, #0x79
	movs r1, #4
	strb r1, [r0]
_0803CB24:
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0803CB30: .4byte gAiState

	THUMB_FUNC_END sub_803CAE4

	THUMB_FUNC_START sub_803CB34
sub_803CB34: @ 0x0803CB34
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0803CB4C  @ sub_803C818
	bl sub_803FA40
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0803CB4C: .4byte sub_803C818

	THUMB_FUNC_END sub_803CB34

	THUMB_FUNC_START sub_803CB50
sub_803CB50: @ 0x0803CB50
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0803CB68  @ sub_803C818
	bl sub_803FA40
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0803CB68: .4byte sub_803C818

	THUMB_FUNC_END sub_803CB50

	THUMB_FUNC_START sub_803CB6C
sub_803CB6C: @ 0x0803CB6C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0803CB84  @ sub_803C818
	bl sub_803FA40
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0803CB84: .4byte sub_803C818

	THUMB_FUNC_END sub_803CB6C

	THUMB_FUNC_START sub_803CB88
sub_803CB88: @ 0x0803CB88
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r4, _0803CBCC  @ gUnknown_030017D0
	ldr r2, [r4]
	ldrb r0, [r2, #1]
	ldrb r1, [r2, #3]
	ldrb r3, [r2, #2]
	movs r2, #1
	str r2, [sp]
	movs r2, #0
	bl AiTryMoveTowards
	ldr r1, _0803CBD0  @ gAiDecision
	movs r0, #0xa
	ldrsb r0, [r1, r0]
	cmp r0, #1
	bne _0803CBC4
	ldr r2, [r4]
	ldrb r0, [r1, #2]
	ldrb r3, [r2, #1]
	cmp r0, r3
	bne _0803CBC4
	ldrb r0, [r1, #3]
	ldrb r2, [r2, #3]
	cmp r0, r2
	bne _0803CBC4
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
_0803CBC4:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0803CBCC: .4byte gUnknown_030017D0
_0803CBD0: .4byte gAiDecision

	THUMB_FUNC_END sub_803CB88

	THUMB_FUNC_START sub_803CBD4
sub_803CBD4: @ 0x0803CBD4
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r7, r0, #0
	ldr r6, _0803CC44  @ gUnknown_030017D0
	ldr r0, [r6]
	ldr r0, [r0, #4]
	add r5, sp, #4
	adds r1, r5, #0
	bl sub_803A788
	lsls r0, r0, #0x18
	asrs r4, r0, #0x18
	cmp r4, #1
	bne _0803CC78
	add r0, sp, #4
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r2, #2
	ldrsh r1, [r5, r2]
	ldr r2, [r6]
	ldrb r3, [r2, #2]
	str r4, [sp]
	movs r2, #0
	bl AiTryMoveTowards
	add r0, sp, #4
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r2, #2
	ldrsh r1, [r5, r2]
	ldr r5, _0803CC48  @ gAiDecision
	ldrb r2, [r5, #2]
	ldrb r3, [r5, #3]
	str r4, [sp]
	bl sub_803BFD0
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _0803CC7E
	ldr r0, [r6]
	ldr r0, [r0, #4]
	bl GetUnitFromCharId
	adds r1, r0, #0
	ldr r4, [r1, #0xc]
	movs r0, #0x20
	ands r4, r0
	cmp r4, #0
	beq _0803CC50
	ldr r0, _0803CC4C  @ gAiState
	adds r0, #0x86
	movs r1, #3
	strb r1, [r0]
	b _0803CC7E
	.align 2, 0
_0803CC44: .4byte gUnknown_030017D0
_0803CC48: .4byte gAiDecision
_0803CC4C: .4byte gAiState
_0803CC50:
	ldrb r0, [r1, #0xb]
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl AiUpdateDecision
	ldr r0, _0803CC70  @ gAiState
	adds r0, #0x86
	movs r1, #2
	strb r1, [r0]
	strb r4, [r5, #0xa]
	ldr r0, _0803CC74  @ gUnknown_030017C8
	strb r4, [r0]
	b _0803CC7E
	.align 2, 0
_0803CC70: .4byte gAiState
_0803CC74: .4byte gUnknown_030017C8
_0803CC78:
	ldr r1, _0803CC8C  @ gUnknown_030017C8
	movs r0, #0
	strb r0, [r1]
_0803CC7E:
	ldrb r0, [r7]
	adds r0, #1
	strb r0, [r7]
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803CC8C: .4byte gUnknown_030017C8

	THUMB_FUNC_END sub_803CBD4

	THUMB_FUNC_START sub_803CC90
sub_803CC90: @ 0x0803CC90
	ldrb r1, [r0]
	adds r1, #1
	strb r1, [r0]
	bx lr

	THUMB_FUNC_END sub_803CC90

	THUMB_FUNC_START sub_803CC98
sub_803CC98: @ 0x0803CC98
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r6, r0, #0
	ldr r7, _0803CCD8  @ gUnknown_030017D0
	ldr r0, [r7]
	ldr r0, [r0, #4]
	add r5, sp, #4
	adds r1, r5, #0
	bl sub_803A878
	lsls r0, r0, #0x18
	asrs r4, r0, #0x18
	cmp r4, #1
	bne _0803CCCA
	add r0, sp, #4
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r2, #2
	ldrsh r1, [r5, r2]
	ldr r2, [r7]
	ldrb r3, [r2, #2]
	str r4, [sp]
	movs r2, #0
	bl AiTryMoveTowards
_0803CCCA:
	ldrb r0, [r6]
	adds r0, #1
	strb r0, [r6]
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803CCD8: .4byte gUnknown_030017D0

	THUMB_FUNC_END sub_803CC98

	THUMB_FUNC_START sub_803CCDC
sub_803CCDC: @ 0x0803CCDC
	push {r4, r5, lr}
	sub sp, #0x14
	adds r5, r0, #0
	bl AiTryDoSpecialItems
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _0803CD2C
	ldr r3, _0803CD20  @ gUnknown_030017D0
	ldr r0, [r3]
	ldrb r0, [r0, #3]
	cmp r0, #0
	beq _0803CDC8
	ldr r2, _0803CD24  @ gActiveUnit
	ldr r1, [r2]
	adds r1, #0x46
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldr r0, [r2]
	adds r0, #0x46
	ldr r1, [r3]
	ldrb r0, [r0]
	ldrb r1, [r1, #3]
	cmp r0, r1
	bne _0803CDC8
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
	ldr r1, _0803CD28  @ gUnknown_030017C8
	movs r0, #0
	b _0803CDC6
	.align 2, 0
_0803CD20: .4byte gUnknown_030017D0
_0803CD24: .4byte gActiveUnit
_0803CD28: .4byte gUnknown_030017C8
_0803CD2C:
	add r4, sp, #0x10
	adds r0, r4, #0
	add r1, sp, #0xc
	bl sub_803B8FC
	lsls r0, r0, #0x18
	asrs r2, r0, #0x18
	cmp r2, #1
	bne _0803CDBC
	movs r1, #0
	ldrsh r0, [r4, r1]
	movs r3, #2
	ldrsh r1, [r4, r3]
	str r2, [sp]
	movs r2, #0
	movs r3, #0xff
	bl AiTryMoveTowards
	ldr r4, _0803CDAC  @ gAiDecision
	ldrb r0, [r4, #2]
	ldrb r1, [r4, #3]
	bl sub_803C014
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _0803CDC8
	ldrb r0, [r4, #2]
	ldrb r1, [r4, #3]
	add r2, sp, #0xc
	ldrb r2, [r2]
	str r2, [sp]
	movs r4, #0
	str r4, [sp, #4]
	str r4, [sp, #8]
	movs r2, #4
	movs r3, #0
	bl AiSetDecision
	ldr r3, _0803CDB0  @ gUnknown_030017D0
	ldr r0, [r3]
	ldrb r0, [r0, #3]
	cmp r0, #0
	beq _0803CDC8
	ldr r2, _0803CDB4  @ gActiveUnit
	ldr r1, [r2]
	adds r1, #0x46
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldr r0, [r2]
	adds r0, #0x46
	ldr r1, [r3]
	ldrb r0, [r0]
	ldrb r1, [r1, #3]
	cmp r0, r1
	bne _0803CDC8
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
	ldr r0, _0803CDB8  @ gUnknown_030017C8
	strb r4, [r0]
	b _0803CDC8
	.align 2, 0
_0803CDAC: .4byte gAiDecision
_0803CDB0: .4byte gUnknown_030017D0
_0803CDB4: .4byte gActiveUnit
_0803CDB8: .4byte gUnknown_030017C8
_0803CDBC:
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
	ldr r1, _0803CDD0  @ gUnknown_030017C8
	movs r0, #0
_0803CDC6:
	strb r0, [r1]
_0803CDC8:
	add sp, #0x14
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0803CDD0: .4byte gUnknown_030017C8

	THUMB_FUNC_END sub_803CCDC

	THUMB_FUNC_START sub_803CDD4
sub_803CDD4: @ 0x0803CDD4
	push {r4, r5, lr}
	sub sp, #0x10
	adds r5, r0, #0
	ldr r0, _0803CE14  @ gActiveUnit
	ldr r0, [r0]
	add r4, sp, #0xc
	adds r1, r4, #0
	bl sub_803B808
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _0803CE06
	add r0, sp, #0xc
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r2, #2
	ldrsh r1, [r4, r2]
	movs r2, #0
	str r2, [sp]
	str r2, [sp, #4]
	str r2, [sp, #8]
	movs r3, #0
	bl AiSetDecision
_0803CE06:
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
	add sp, #0x10
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0803CE14: .4byte gActiveUnit

	THUMB_FUNC_END sub_803CDD4

	THUMB_FUNC_START sub_803CE18
sub_803CE18: @ 0x0803CE18
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r7, r0, #0
	ldr r6, _0803CE54  @ gUnknown_030017D0
	ldr r0, [r6]
	ldr r0, [r0, #8]
	cmp r0, #0
	bne _0803CE5C
	ldr r0, _0803CE58  @ sub_803C818
	add r5, sp, #4
	adds r1, r5, #0
	bl sub_803A924
	lsls r0, r0, #0x18
	asrs r4, r0, #0x18
	cmp r4, #1
	bne _0803CE84
	add r0, sp, #4
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r2, #2
	ldrsh r1, [r5, r2]
	ldr r2, [r6]
	ldrb r3, [r2, #2]
	str r4, [sp]
	movs r2, #0
	bl AiTryMoveTowards
	b _0803CE84
	.align 2, 0
_0803CE54: .4byte gUnknown_030017D0
_0803CE58: .4byte sub_803C818
_0803CE5C:
	ldr r0, _0803CE94  @ sub_803C864
	add r5, sp, #4
	adds r1, r5, #0
	bl sub_803A924
	lsls r0, r0, #0x18
	asrs r4, r0, #0x18
	cmp r4, #1
	bne _0803CE84
	add r0, sp, #4
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r2, #2
	ldrsh r1, [r5, r2]
	ldr r2, [r6]
	ldrb r3, [r2, #2]
	str r4, [sp]
	movs r2, #0
	bl AiTryMoveTowards
_0803CE84:
	ldrb r0, [r7]
	adds r0, #1
	strb r0, [r7]
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803CE94: .4byte sub_803C864

	THUMB_FUNC_END sub_803CE18

	THUMB_FUNC_START sub_803CE98
sub_803CE98: @ 0x0803CE98
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r7, r0, #0
	ldr r6, _0803CED4  @ gUnknown_030017D0
	ldr r0, [r6]
	ldr r0, [r0, #8]
	cmp r0, #0
	bne _0803CEDC
	ldr r0, _0803CED8  @ sub_803C818
	add r5, sp, #4
	adds r1, r5, #0
	bl sub_803AA40
	lsls r0, r0, #0x18
	asrs r4, r0, #0x18
	cmp r4, #1
	bne _0803CF04
	add r0, sp, #4
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r2, #2
	ldrsh r1, [r5, r2]
	ldr r2, [r6]
	ldrb r3, [r2, #2]
	str r4, [sp]
	movs r2, #0
	bl sub_803BBF4
	b _0803CF04
	.align 2, 0
_0803CED4: .4byte gUnknown_030017D0
_0803CED8: .4byte sub_803C818
_0803CEDC:
	ldr r0, _0803CF14  @ sub_803C864
	add r5, sp, #4
	adds r1, r5, #0
	bl sub_803AA40
	lsls r0, r0, #0x18
	asrs r4, r0, #0x18
	cmp r4, #1
	bne _0803CF04
	add r0, sp, #4
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r2, #2
	ldrsh r1, [r5, r2]
	ldr r2, [r6]
	ldrb r3, [r2, #2]
	str r4, [sp]
	movs r2, #0
	bl sub_803BBF4
_0803CF04:
	ldrb r0, [r7]
	adds r0, #1
	strb r0, [r7]
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803CF14: .4byte sub_803C864

	THUMB_FUNC_END sub_803CE98

	THUMB_FUNC_START sub_803CF18
sub_803CF18: @ 0x0803CF18
	ldrb r1, [r0]
	adds r1, #1
	strb r1, [r0]
	bx lr

	THUMB_FUNC_END sub_803CF18

	THUMB_FUNC_START sub_803CF20
sub_803CF20: @ 0x0803CF20
	ldrb r1, [r0]
	adds r1, #1
	strb r1, [r0]
	bx lr

	THUMB_FUNC_END sub_803CF20

	THUMB_FUNC_START sub_803CF28
sub_803CF28: @ 0x0803CF28
	push {r4, lr}
	adds r4, r0, #0
	bl sub_803AB5C
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_803CF28

	THUMB_FUNC_START sub_803CF3C
sub_803CF3C: @ 0x0803CF3C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0803CF5C  @ gActiveUnit
	ldr r2, [r0]
	ldrb r1, [r2, #0xa]
	movs r0, #8
	orrs r0, r1
	strb r0, [r2, #0xa]
	bl AiTryMoveTowardsEscape
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0803CF5C: .4byte gActiveUnit

	THUMB_FUNC_END sub_803CF3C

	THUMB_FUNC_START sub_803CF60
sub_803CF60: @ 0x0803CF60
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r5, r1, #0
	bl sub_803E23C
	adds r4, r0, #0
	adds r0, r6, #0
	adds r1, r5, #0
	bl sub_803E27C
	adds r4, r4, r0
	ldr r0, _0803CFA8  @ gBmMapMovement
	ldr r0, [r0]
	lsls r5, r5, #2
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r6
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r4, r4, r0
	ldr r0, _0803CFAC  @ gBmMapUnk
	ldr r0, [r0]
	adds r5, r5, r0
	ldr r0, [r5]
	adds r0, r0, r6
	ldrb r0, [r0]
	lsrs r0, r0, #3
	subs r4, r4, r0
	ldr r0, _0803CFB0  @ 0x7FFFFFFF
	adds r4, r4, r0
	adds r0, r4, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0803CFA8: .4byte gBmMapMovement
_0803CFAC: .4byte gBmMapUnk
_0803CFB0: .4byte 0x7FFFFFFF

	THUMB_FUNC_END sub_803CF60

	THUMB_FUNC_START sub_803CFB4
sub_803CFB4: @ 0x0803CFB4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x20
	adds r5, r0, #0
	adds r6, r1, #0
	str r2, [sp]
	str r3, [sp, #4]
	movs r0, #1
	negs r0, r0
	str r0, [sp, #0x10]
	str r0, [sp, #0xc]
	movs r1, #0
	str r1, [sp, #0x14]
	ldr r4, _0803D0F8  @ gActiveUnit
	ldr r0, [r4]
	bl GenerateUnitMovementMap
	movs r2, #0
	str r2, [sp, #8]
	ldr r0, [r4]
	ldrh r0, [r0, #0x1e]
	mov r8, r0
	cmp r0, #0
	beq _0803D0DE
	lsls r5, r5, #0x10
	str r5, [sp, #0x18]
	lsls r6, r6, #0x10
	str r6, [sp, #0x1c]
_0803CFF2:
	ldr r0, _0803D0F8  @ gActiveUnit
	ldr r0, [r0]
	mov r1, r8
	bl CanUnitUseWeapon
	lsls r0, r0, #0x18
	ldr r1, [sp, #8]
	adds r1, #1
	mov r9, r1
	cmp r0, #0
	beq _0803D0C4
	ldr r0, _0803D0FC  @ gBmMapRange
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFill
	mov r0, r8
	bl GetItemMinRange
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	mov r0, r8
	bl GetItemMaxRange
	adds r3, r0, #0
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	ldr r2, [sp, #0x18]
	asrs r0, r2, #0x10
	ldr r2, [sp, #0x1c]
	asrs r1, r2, #0x10
	adds r2, r4, #0
	bl MapAddInBoundedRange
	ldr r0, _0803D100  @ gBmMapSize
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r6, r0, #1
	cmp r6, #0
	blt _0803D0C4
_0803D044:
	ldr r0, _0803D100  @ gBmMapSize
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r5, r0, #1
	subs r0, r6, #1
	mov sl, r0
	cmp r5, #0
	blt _0803D0BE
	lsls r7, r6, #2
_0803D056:
	ldr r0, _0803D104  @ gBmMapMovement
	ldr r0, [r0]
	adds r0, r7, r0
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _0803D0B8
	ldr r0, _0803D0FC  @ gBmMapRange
	ldr r0, [r0]
	adds r0, r7, r0
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0803D0B8
	ldr r0, _0803D108  @ gBmMapUnit
	ldr r0, [r0]
	adds r0, r7, r0
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r1, [r0]
	cmp r1, #0
	beq _0803D092
	ldr r0, _0803D10C  @ gActiveUnitId
	ldrb r0, [r0]
	cmp r1, r0
	bne _0803D0B8
_0803D092:
	mov r0, r8
	bl GetItemMight
	adds r4, r0, #0
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_803CF60
	adds r4, r4, r0
	ldr r1, [sp, #0x14]
	cmp r4, r1
	bls _0803D0B8
	str r5, [sp, #0xc]
	str r6, [sp, #0x10]
	str r4, [sp, #0x14]
	mov r2, sp
	ldrb r0, [r2, #8]
	ldr r2, [sp, #4]
	strb r0, [r2]
_0803D0B8:
	subs r5, #1
	cmp r5, #0
	bge _0803D056
_0803D0BE:
	mov r6, sl
	cmp r6, #0
	bge _0803D044
_0803D0C4:
	mov r1, r9
	str r1, [sp, #8]
	cmp r1, #4
	bgt _0803D0DE
	ldr r0, _0803D0F8  @ gActiveUnit
	ldr r0, [r0]
	lsls r1, r1, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r0, [r0]
	mov r8, r0
	cmp r0, #0
	bne _0803CFF2
_0803D0DE:
	ldr r2, [sp, #0x14]
	cmp r2, #0
	beq _0803D110
	mov r0, sp
	ldrh r1, [r0, #0xc]
	ldr r0, [sp]
	strh r1, [r0]
	mov r2, sp
	ldrh r2, [r2, #0x10]
	strh r2, [r0, #2]
	movs r0, #1
	b _0803D112
	.align 2, 0
_0803D0F8: .4byte gActiveUnit
_0803D0FC: .4byte gBmMapRange
_0803D100: .4byte gBmMapSize
_0803D104: .4byte gBmMapMovement
_0803D108: .4byte gBmMapUnit
_0803D10C: .4byte gActiveUnitId
_0803D110:
	movs r0, #0
_0803D112:
	add sp, #0x20
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_803CFB4

	THUMB_FUNC_START sub_803D124
sub_803D124: @ 0x0803D124
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	str r0, [sp]
	mov r8, r1
	adds r7, r2, #0
	movs r0, #0xff
	mov r9, r0
	ldr r0, _0803D200  @ gBmMapSize
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r5, r0, #1
	cmp r5, #0
	blt _0803D1F6
_0803D146:
	ldr r0, _0803D200  @ gBmMapSize
	movs r1, #0
	ldrsh r0, [r0, r1]
	subs r4, r0, #1
	subs r0, r5, #1
	mov sl, r0
	cmp r4, #0
	blt _0803D1F0
	lsls r6, r5, #2
_0803D158:
	ldr r0, _0803D204  @ gBmMapRange
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _0803D1EA
	ldr r0, _0803D208  @ gBmMapTerrain
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r1, [r0]
	ldr r0, [sp]
	bl sub_803AD18
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803D1EA
	movs r0, #1
	mov r1, r8
	ands r0, r1
	cmp r0, #0
	beq _0803D1B0
	ldr r0, _0803D20C  @ gBmMapUnit
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r1, r0, r4
	ldrb r0, [r1]
	cmp r0, #0
	beq _0803D1B0
	ldr r0, _0803D210  @ gActiveUnit
	ldr r0, [r0]
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldrb r1, [r1]
	bl AreUnitsAllied
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803D1EA
_0803D1B0:
	movs r0, #2
	mov r1, r8
	ands r0, r1
	cmp r0, #0
	beq _0803D1CA
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	lsls r1, r5, #0x10
	asrs r1, r1, #0x10
	bl sub_803B41C
	cmp r0, #0
	bne _0803D1EA
_0803D1CA:
	ldr r0, _0803D204  @ gBmMapRange
	ldr r0, [r0]
	adds r1, r6, r0
	ldr r0, [r1]
	adds r0, r0, r4
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r9, r0
	ble _0803D1EA
	strh r4, [r7]
	strh r5, [r7, #2]
	ldr r0, [r1]
	adds r0, r0, r4
	ldrb r0, [r0]
	mov r9, r0
_0803D1EA:
	subs r4, #1
	cmp r4, #0
	bge _0803D158
_0803D1F0:
	mov r5, sl
	cmp r5, #0
	bge _0803D146
_0803D1F6:
	mov r0, r9
	cmp r0, #0xff
	bne _0803D214
	movs r0, #0
	b _0803D216
	.align 2, 0
_0803D200: .4byte gBmMapSize
_0803D204: .4byte gBmMapRange
_0803D208: .4byte gBmMapTerrain
_0803D20C: .4byte gBmMapUnit
_0803D210: .4byte gActiveUnit
_0803D214:
	movs r0, #1
_0803D216:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_803D124

	THUMB_FUNC_START sub_803D228
sub_803D228: @ 0x0803D228
	push {r4, r5, r6, r7, lr}
	sub sp, #0x18
	adds r7, r0, #0
	ldr r0, _0803D298  @ gActiveUnit
	ldr r0, [r0]
	bl sub_8041020
	ldr r0, _0803D29C  @ gUnknown_085A814C
	add r4, sp, #0x10
	movs r1, #0
	adds r2, r4, #0
	bl sub_803D124
	lsls r0, r0, #0x18
	asrs r6, r0, #0x18
	cmp r6, #1
	bne _0803D2B4
	movs r1, #0
	ldrsh r0, [r4, r1]
	movs r2, #2
	ldrsh r1, [r4, r2]
	add r5, sp, #0x14
	adds r2, r5, #0
	add r3, sp, #0xc
	bl sub_803CFB4
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _0803D2A0
	movs r1, #0
	ldrsh r0, [r4, r1]
	movs r2, #2
	ldrsh r1, [r4, r2]
	bl GetTrapAt
	cmp r0, #0
	beq _0803D2C8
	movs r1, #0
	ldrsh r0, [r5, r1]
	movs r2, #2
	ldrsh r1, [r5, r2]
	add r2, sp, #0xc
	ldrb r2, [r2]
	str r2, [sp]
	ldrb r2, [r4]
	str r2, [sp, #4]
	ldrh r2, [r4, #2]
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	str r2, [sp, #8]
	movs r2, #1
	movs r3, #0
	bl AiSetDecision
	b _0803D2C2
	.align 2, 0
_0803D298: .4byte gActiveUnit
_0803D29C: .4byte gUnknown_085A814C
_0803D2A0:
	movs r1, #0
	ldrsh r0, [r4, r1]
	movs r2, #2
	ldrsh r1, [r4, r2]
	str r6, [sp]
	movs r2, #0
	movs r3, #0xff
	bl AiTryMoveTowards
	b _0803D2C2
_0803D2B4:
	ldr r0, _0803D2D0  @ gAiState
	adds r0, #0x86
	movs r2, #0
	movs r1, #4
	strb r1, [r0]
	ldr r0, _0803D2D4  @ gUnknown_030017C8
	strb r2, [r0]
_0803D2C2:
	ldrb r0, [r7]
	adds r0, #1
	strb r0, [r7]
_0803D2C8:
	add sp, #0x18
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803D2D0: .4byte gAiState
_0803D2D4: .4byte gUnknown_030017C8

	THUMB_FUNC_END sub_803D228

	THUMB_FUNC_START sub_803D2D8
sub_803D2D8: @ 0x0803D2D8
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r7, r0, #0
	ldr r0, _0803D328  @ gActiveUnit
	ldr r0, [r0]
	movs r4, #0x10
	ldrsb r4, [r0, r4]
	movs r5, #0x11
	ldrsb r5, [r0, r5]
	bl GetUnitMovementCost
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	bl GenerateExtendedMovementMapOnRange
	ldr r6, _0803D32C  @ gUnknown_030017D0
	ldr r0, [r6]
	adds r0, #3
	add r5, sp, #4
	movs r1, #0
	adds r2, r5, #0
	bl sub_803AD38
	lsls r0, r0, #0x18
	asrs r4, r0, #0x18
	cmp r4, #1
	bne _0803D330
	add r0, sp, #4
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r2, #2
	ldrsh r1, [r5, r2]
	ldr r2, [r6]
	ldrb r3, [r2, #2]
	str r4, [sp]
	movs r2, #0
	bl AiTryMoveTowards
	b _0803D33E
	.align 2, 0
_0803D328: .4byte gActiveUnit
_0803D32C: .4byte gUnknown_030017D0
_0803D330:
	ldr r0, _0803D34C  @ gAiState
	adds r0, #0x86
	movs r2, #0
	movs r1, #4
	strb r1, [r0]
	ldr r0, _0803D350  @ gUnknown_030017C8
	strb r2, [r0]
_0803D33E:
	ldrb r0, [r7]
	adds r0, #1
	strb r0, [r7]
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803D34C: .4byte gAiState
_0803D350: .4byte gUnknown_030017C8

	THUMB_FUNC_END sub_803D2D8

	THUMB_FUNC_START sub_803D354
sub_803D354: @ 0x0803D354
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r7, r0, #0
	ldr r0, _0803D3A4  @ gActiveUnit
	ldr r0, [r0]
	movs r4, #0x10
	ldrsb r4, [r0, r4]
	movs r5, #0x11
	ldrsb r5, [r0, r5]
	bl GetUnitMovementCost
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	bl GenerateExtendedMovementMapOnRange
	ldr r6, _0803D3A8  @ gUnknown_030017D0
	ldr r0, [r6]
	ldr r0, [r0, #8]
	add r5, sp, #4
	movs r1, #0
	adds r2, r5, #0
	bl sub_803AD38
	lsls r0, r0, #0x18
	asrs r4, r0, #0x18
	cmp r4, #1
	bne _0803D3AC
	add r0, sp, #4
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r2, #2
	ldrsh r1, [r5, r2]
	ldr r2, [r6]
	ldrb r3, [r2, #2]
	str r4, [sp]
	movs r2, #0
	bl AiTryMoveTowards
	b _0803D3BA
	.align 2, 0
_0803D3A4: .4byte gActiveUnit
_0803D3A8: .4byte gUnknown_030017D0
_0803D3AC:
	ldr r0, _0803D3C8  @ gAiState
	adds r0, #0x86
	movs r2, #0
	movs r1, #4
	strb r1, [r0]
	ldr r0, _0803D3CC  @ gUnknown_030017C8
	strb r2, [r0]
_0803D3BA:
	ldrb r0, [r7]
	adds r0, #1
	strb r0, [r7]
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803D3C8: .4byte gAiState
_0803D3CC: .4byte gUnknown_030017C8

	THUMB_FUNC_END sub_803D354

	THUMB_FUNC_START sub_803D3D0
sub_803D3D0: @ 0x0803D3D0
	ldrb r1, [r0]
	adds r1, #1
	strb r1, [r0]
	ldr r1, _0803D3E0  @ gUnknown_030017C8
	movs r0, #0
	strb r0, [r1]
	bx lr
	.align 2, 0
_0803D3E0: .4byte gUnknown_030017C8

	THUMB_FUNC_END sub_803D3D0

	THUMB_FUNC_START AiDoBerserkAction
AiDoBerserkAction: @ 0x0803D3E4
	push {lr}
	ldr r0, _0803D3FC  @ sub_803C818
	bl sub_803FA40
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0803D3F8
	ldr r0, _0803D400  @ sub_803C848
	bl sub_803D450
_0803D3F8:
	pop {r0}
	bx r0
	.align 2, 0
_0803D3FC: .4byte sub_803C818
_0803D400: .4byte sub_803C848

	THUMB_FUNC_END AiDoBerserkAction

	THUMB_FUNC_START AiDoBerserkMove
AiDoBerserkMove: @ 0x0803D404
	push {r4, lr}
	sub sp, #8
	ldr r0, _0803D438  @ sub_803C848
	add r4, sp, #4
	adds r1, r4, #0
	bl sub_803A924
	lsls r0, r0, #0x18
	asrs r2, r0, #0x18
	cmp r2, #1
	bne _0803D42E
	add r0, sp, #4
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r3, #2
	ldrsh r1, [r4, r3]
	str r2, [sp]
	movs r2, #0
	movs r3, #0xff
	bl AiTryMoveTowards
_0803D42E:
	add sp, #8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0803D438: .4byte sub_803C848

	THUMB_FUNC_END AiDoBerserkMove

	THUMB_FUNC_START sub_803D43C
sub_803D43C: @ 0x0803D43C
	movs r0, #1
	bx lr

	THUMB_FUNC_END sub_803D43C

	THUMB_FUNC_START sub_803D440
sub_803D440: @ 0x0803D440
	push {lr}
	ldrb r0, [r0]
	bl sub_803BF4C
	movs r0, #1
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_803D440

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
	bl sub_803AC3C
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
	bl sub_803AC3C
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
	bl sub_803AC3C
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
	bl sub_803B718
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
	bl sub_803B7C8
	lsls r6, r0, #0x18
	asrs r1, r6, #0x18
	cmp r1, #0
	blt _0803DC56
	lsls r1, r1, #1
	adds r0, r4, #0
	adds r0, #0x1e
	adds r0, r0, r1
	ldrb r0, [r0]
	bl sub_803B794
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
	ldr r0, _0803DEBC  @ gBmMapUnk
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
_0803DEBC: .4byte gBmMapUnk
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
	bl sub_803BF4C
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
	ldr r1, _0803E148  @ gBmMapUnk
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
_0803E148: .4byte gBmMapUnk
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
	ldr r1, _0803E1DC  @ gUnknown_080D8178
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
_0803E1DC: .4byte gUnknown_080D8178
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
	ldr r0, _0803E31C  @ gBmMapUnk
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFill
	bl sub_803E320
_0803E314:
	pop {r0}
	bx r0
	.align 2, 0
_0803E318: .4byte gAiState
_0803E31C: .4byte gBmMapUnk

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
	bl sub_803AC90
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
	ldr r1, _0803E444  @ gBmMapUnk
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
_0803E444: .4byte gBmMapUnk

	THUMB_FUNC_END sub_803E320

	THUMB_FUNC_START sub_803E448
sub_803E448: @ 0x0803E448
	push {lr}
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	ldr r3, _0803E464  @ gBmMapUnk
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
_0803E464: .4byte gBmMapUnk
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
	bl sub_803AD18
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
	bl sub_803B41C
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
	ldr r2, _0803E6E4  @ gUnknown_085A8390
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
_0803E6E4: .4byte gUnknown_085A8390
_0803E6E8:
	ldr r2, _0803E704  @ gUnknown_085A8390
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
_0803E704: .4byte gUnknown_085A8390
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
	bl sub_803B808
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
	ldr r1, _0803E8AC  @ gUnknown_085A8188
	b _0803E8B2
	.align 2, 0
_0803E8AC: .4byte gUnknown_085A8188
_0803E8B0:
	ldr r1, _0803E8F8  @ gUnknown_085A828C
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
_0803E8F8: .4byte gUnknown_085A828C
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
	ldr r0, _0803EB94  @ gBmMapUnk
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
	ldr r0, _0803EB94  @ gBmMapUnk
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
_0803EB94: .4byte gBmMapUnk
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
	ldr r0, _0803F328  @ sub_803C818
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
_0803F328: .4byte sub_803C818
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
	bl sub_803B298
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
	bl sub_803BF84
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
	ldr r4, _0803F7C8  @ sub_803C818
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
_0803F7C8: .4byte sub_803C818
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
	ldr r0, _0803F814  @ sub_803C818
	bl sub_803D450
	b _0803F820
	.align 2, 0
_0803F814: .4byte sub_803C818
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
	bl sub_8040E68
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
	ldr r0, _0803FB9C  @ gBmMapUnk
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
_0803FB9C: .4byte gBmMapUnk
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
	bl sub_803BFD0
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
	bl sub_803BFD0
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
	bl sub_803BFD0
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

	THUMB_FUNC_START sub_80407F0
sub_80407F0: @ 0x080407F0
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r4, #0
	bl GetItemIndex
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	ldr r3, _08040820  @ gUnknown_080D86F4
	ldrh r0, [r3]
	cmp r0, #0
	beq _08040834
	movs r1, #0
	adds r2, r3, #0
	adds r6, r2, #4
_0804080E:
	ldrh r0, [r2]
	cmp r5, r0
	bne _08040824
	adds r0, r1, r6
	ldr r0, [r0]
	cmp r0, #0
	beq _08040824
	adds r0, r4, #0
	b _08040838
	.align 2, 0
_08040820: .4byte gUnknown_080D86F4
_08040824:
	adds r1, #8
	adds r2, #8
	adds r4, #1
	ldr r3, _08040840  @ gUnknown_080D86F4
	adds r0, r1, r3
	ldrh r0, [r0]
	cmp r0, #0
	bne _0804080E
_08040834:
	movs r0, #1
	negs r0, r0
_08040838:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08040840: .4byte gUnknown_080D86F4

	THUMB_FUNC_END sub_80407F0

	THUMB_FUNC_START AiTryDoSpecialItems
AiTryDoSpecialItems: @ 0x08040844
	push {r4, r5, r6, lr}
	ldr r0, _08040858  @ gAiState
	adds r0, #0x7b
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0804085C
	movs r0, #0
	b _080408D6
	.align 2, 0
_08040858: .4byte gAiState
_0804085C:
	bl sub_8040C5C
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080408D4
	movs r5, #0
	ldr r0, _080408C4  @ gActiveUnit
	ldr r0, [r0]
	ldrh r4, [r0, #0x1e]
	cmp r4, #0
	beq _080408B0
	ldr r6, _080408C8  @ gUnknown_080D86F8
_08040874:
	adds r0, r4, #0
	bl GetItemType
	cmp r0, #0
	beq _0804089A
	adds r0, r4, #0
	bl sub_80407F0
	adds r1, r0, #0
	movs r0, #1
	negs r0, r0
	cmp r1, r0
	beq _0804089A
	lsls r0, r1, #3
	adds r0, r0, r6
	ldr r1, [r0]
	adds r0, r5, #0
	bl _call_via_r1
_0804089A:
	adds r5, #1
	cmp r5, #4
	bgt _080408B0
	ldr r0, _080408C4  @ gActiveUnit
	ldr r0, [r0]
	lsls r1, r5, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r4, [r0]
	cmp r4, #0
	bne _08040874
_080408B0:
	ldr r0, _080408CC  @ gAiState
	adds r0, #0x79
	ldrb r0, [r0]
	cmp r0, #0
	beq _080408D4
	ldr r0, _080408D0  @ gAiDecision
	ldrb r0, [r0, #0xa]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	b _080408D6
	.align 2, 0
_080408C4: .4byte gActiveUnit
_080408C8: .4byte gUnknown_080D86F8
_080408CC: .4byte gAiState
_080408D0: .4byte gAiDecision
_080408D4:
	movs r0, #1
_080408D6:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	THUMB_FUNC_END AiTryDoSpecialItems

	THUMB_FUNC_START sub_80408DC
sub_80408DC: @ 0x080408DC
	push {r4, r5, r6, lr}
	sub sp, #0x10
	adds r6, r0, #0
	ldr r4, _08040964  @ gAiState
	adds r0, r4, #0
	adds r0, #0x80
	ldr r0, [r0]
	ldr r1, _08040968  @ 0x80000001
	ands r0, r1
	cmp r0, #0
	beq _0804095C
	ldr r0, _0804096C  @ gActiveUnit
	ldr r0, [r0]
	add r5, sp, #0xc
	adds r1, r5, #0
	bl sub_8040B38
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0804095C
	add r0, sp, #0xc
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r2, #2
	ldrsh r1, [r5, r2]
	adds r2, r4, #0
	adds r2, #0x7e
	ldrb r3, [r2]
	movs r2, #1
	str r2, [sp]
	movs r2, #0
	bl AiTryMoveTowards
	ldr r4, _08040970  @ gAiDecision
	movs r0, #0xa
	ldrsb r0, [r4, r0]
	cmp r0, #1
	bne _0804095C
	add r0, sp, #0xc
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r2, #2
	ldrsh r1, [r5, r2]
	ldrb r2, [r4, #2]
	ldrb r3, [r4, #3]
	movs r5, #0
	str r5, [sp]
	bl sub_803BFD0
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _0804095C
	ldrb r0, [r4, #2]
	ldrb r1, [r4, #3]
	lsls r2, r6, #0x18
	lsrs r2, r2, #0x18
	str r2, [sp]
	str r5, [sp, #4]
	str r5, [sp, #8]
	movs r2, #6
	movs r3, #0
	bl AiSetDecision
_0804095C:
	add sp, #0x10
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08040964: .4byte gAiState
_08040968: .4byte 0x80000001
_0804096C: .4byte gActiveUnit
_08040970: .4byte gAiDecision

	THUMB_FUNC_END sub_80408DC

	THUMB_FUNC_START sub_8040974
sub_8040974: @ 0x08040974
	push {r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r7, r0, #0
	movs r5, #0
	ldr r6, _080409B4  @ gAiState
	adds r0, r6, #0
	adds r0, #0x80
	ldr r0, [r0]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	beq _08040A64
	ldr r4, _080409B8  @ gActiveUnit
	ldr r0, [r4]
	bl GetUnitItemCount
	cmp r0, #4
	ble _080409BC
	ldr r2, [r4]
	ldrb r1, [r2, #0xa]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	bne _080409BC
	movs r0, #8
	orrs r0, r1
	strb r0, [r2, #0xa]
	adds r0, r6, #0
	adds r0, #0x79
	strb r5, [r0]
	b _08040A64
	.align 2, 0
_080409B4: .4byte gAiState
_080409B8: .4byte gActiveUnit
_080409BC:
	ldr r6, _08040A6C  @ gActiveUnit
	ldr r2, [r6]
	ldr r0, [r2]
	ldr r1, [r2, #4]
	ldr r0, [r0, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	movs r4, #4
	ands r0, r4
	cmp r0, #0
	beq _08040A64
	adds r0, r2, #0
	bl GetUnitItemCount
	cmp r0, #4
	ble _080409DE
	orrs r5, r4
_080409DE:
	ldr r1, [r6]
	ldr r0, [r1]
	ldrb r0, [r0, #4]
	cmp r0, #0x1c
	bne _080409F6
	ldrb r1, [r1, #0xa]
	movs r2, #8
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	beq _080409F6
	orrs r5, r2
_080409F6:
	ldr r0, _08040A6C  @ gActiveUnit
	ldr r0, [r0]
	add r6, sp, #0xc
	adds r1, r5, #0
	adds r2, r6, #0
	movs r3, #0
	bl sub_8040BB4
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _08040A64
	add r0, sp, #0xc
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r2, #2
	ldrsh r1, [r6, r2]
	ldr r2, _08040A70  @ gAiState
	adds r2, #0x7e
	ldrb r3, [r2]
	movs r5, #0
	str r5, [sp]
	movs r2, #0
	bl AiTryMoveTowards
	ldr r4, _08040A74  @ gAiDecision
	movs r0, #0xa
	ldrsb r0, [r4, r0]
	cmp r0, #1
	bne _08040A64
	add r0, sp, #0xc
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r2, #2
	ldrsh r1, [r6, r2]
	ldrb r2, [r4, #2]
	ldrb r3, [r4, #3]
	str r5, [sp]
	bl sub_803BFD0
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _08040A64
	ldrb r0, [r4, #2]
	ldrb r1, [r4, #3]
	lsls r2, r7, #0x18
	lsrs r2, r2, #0x18
	str r2, [sp]
	str r5, [sp, #4]
	str r5, [sp, #8]
	movs r2, #6
	movs r3, #0
	bl AiSetDecision
_08040A64:
	add sp, #0x10
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08040A6C: .4byte gActiveUnit
_08040A70: .4byte gAiState
_08040A74: .4byte gAiDecision

	THUMB_FUNC_END sub_8040974

	THUMB_FUNC_START sub_8040A78
sub_8040A78: @ 0x08040A78
	push {r4, r5, lr}
	sub sp, #0x10
	adds r5, r0, #0
	ldr r0, _08040AD8  @ gAiState
	adds r0, #0x80
	ldr r0, [r0]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	beq _08040ACE
	ldr r0, _08040ADC  @ gActiveUnit
	ldr r2, [r0]
	adds r0, r2, #0
	adds r0, #0x30
	ldrb r1, [r0]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #1
	bne _08040ACE
	add r4, sp, #0xc
	adds r0, r2, #0
	adds r1, r4, #0
	bl sub_803B808
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _08040ACE
	add r0, sp, #0xc
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r2, #2
	ldrsh r1, [r4, r2]
	lsls r2, r5, #0x18
	lsrs r2, r2, #0x18
	str r2, [sp]
	movs r2, #0
	str r2, [sp, #4]
	str r2, [sp, #8]
	movs r2, #6
	movs r3, #0
	bl AiSetDecision
_08040ACE:
	add sp, #0x10
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08040AD8: .4byte gAiState
_08040ADC: .4byte gActiveUnit

	THUMB_FUNC_END sub_8040A78

	THUMB_FUNC_START sub_8040AE0
sub_8040AE0: @ 0x08040AE0
	push {r4, lr}
	adds r3, r0, #0
	adds r4, r1, #0
	ldr r1, _08040B18  @ gBmMapRange
	ldr r0, [r1]
	lsls r2, r4, #2
	adds r0, r2, r0
	ldr r0, [r0]
	adds r0, r0, r3
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x77
	bgt _08040B14
	ldr r0, _08040B1C  @ gBmMapUnit
	ldr r0, [r0]
	adds r0, r2, r0
	ldr r0, [r0]
	adds r0, r0, r3
	ldrb r2, [r0]
	cmp r2, #0
	beq _08040B24
	ldr r0, _08040B20  @ gActiveUnitId
	ldrb r0, [r0]
	cmp r2, r0
	beq _08040B24
_08040B14:
	movs r0, #0xff
	b _08040B30
	.align 2, 0
_08040B18: .4byte gBmMapRange
_08040B1C: .4byte gBmMapUnit
_08040B20: .4byte gActiveUnitId
_08040B24:
	ldr r1, [r1]
	lsls r0, r4, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, r0, r3
	ldrb r0, [r0]
_08040B30:
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8040AE0

	THUMB_FUNC_START sub_8040B38
sub_8040B38: @ 0x08040B38
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	bl sub_8040FBC
	ldr r0, _08040B7C  @ gUnknown_085A92DC
	movs r1, #0
	adds r2, r4, #0
	bl sub_803AE94
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08040B84
	adds r0, r5, #0
	bl sub_8040E98
	movs r1, #2
	ldrsh r0, [r4, r1]
	ldr r1, _08040B80  @ gBmMapRange
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r2, #0
	ldrsh r1, [r4, r2]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x77
	bgt _08040B84
	movs r0, #1
	b _08040B86
	.align 2, 0
_08040B7C: .4byte gUnknown_085A92DC
_08040B80: .4byte gBmMapRange
_08040B84:
	movs r0, #0
_08040B86:
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8040B38

	THUMB_FUNC_START sub_8040B8C
sub_8040B8C: @ 0x08040B8C
	push {r4, lr}
	adds r4, r1, #0
	bl sub_8040E98
	ldr r0, _08040BA8  @ gUnknown_085A92DE
	movs r1, #0
	adds r2, r4, #0
	bl sub_803AD38
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08040BAC
	movs r0, #1
	b _08040BAE
	.align 2, 0
_08040BA8: .4byte gUnknown_085A92DE
_08040BAC:
	movs r0, #0
_08040BAE:
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8040B8C

	THUMB_FUNC_START sub_8040BB4
sub_8040BB4: @ 0x08040BB4
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	adds r4, r2, #0
	adds r7, r3, #0
	bl sub_8040E68
	adds r0, r5, #0
	bl sub_8040F88
	movs r0, #1
	orrs r0, r6
	adds r1, r4, #0
	adds r2, r7, #0
	bl sub_803AFDC
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _08040C04
	movs r1, #2
	ldrsh r0, [r4, r1]
	ldr r1, _08040C00  @ gBmMapMovement
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r2, #0
	ldrsh r1, [r4, r2]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x77
	bgt _08040C04
_08040BFA:
	movs r0, #1
	b _08040C4C
	.align 2, 0
_08040C00: .4byte gBmMapMovement
_08040C04:
	adds r0, r5, #0
	bl sub_8040FBC
	adds r0, r6, #0
	adds r1, r4, #0
	adds r2, r7, #0
	bl sub_803AFDC
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _08040C4A
	movs r3, #2
	ldrsh r1, [r4, r3]
	ldr r0, _08040C54  @ gBmMapMovement
	ldr r0, [r0]
	lsls r1, r1, #2
	adds r0, r1, r0
	movs r3, #0
	ldrsh r2, [r4, r3]
	ldr r0, [r0]
	adds r0, r0, r2
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x77
	bgt _08040BFA
	ldr r0, _08040C58  @ gBmMapUnit
	ldr r0, [r0]
	adds r0, r1, r0
	ldr r0, [r0]
	adds r0, r0, r2
	ldrb r0, [r0]
	cmp r0, #0
	bne _08040BFA
_08040C4A:
	movs r0, #0
_08040C4C:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08040C54: .4byte gBmMapMovement
_08040C58: .4byte gBmMapUnit

	THUMB_FUNC_END sub_8040BB4

	THUMB_FUNC_START sub_8040C5C
sub_8040C5C: @ 0x08040C5C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	movs r6, #0
	ldr r4, _08040C74  @ gActiveUnit
	ldr r1, [r4]
	ldr r0, [r1, #4]
	ldrb r0, [r0, #4]
	cmp r0, #0x33
	beq _08040C78
	movs r0, #0
	b _08040DC2
	.align 2, 0
_08040C74: .4byte gActiveUnit
_08040C78:
	adds r0, r1, #0
	bl GetUnitItemCount
	adds r1, r0, #0
	cmp r1, #4
	ble _08040CA4
	ldr r3, [r4]
	ldrb r2, [r3, #0xa]
	movs r1, #8
	ands r1, r2
	cmp r1, #0
	bne _08040CA4
	movs r1, #8
	orrs r1, r2
	strb r1, [r3, #0xa]
	ldr r1, _08040CA0  @ gAiState
	adds r1, #0x79
	strb r6, [r1]
	b _08040DC2
	.align 2, 0
_08040CA0: .4byte gAiState
_08040CA4:
	ldr r0, _08040D2C  @ gRAMChapterData
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0xe
	bne _08040D3C
	ldr r4, _08040D30  @ gActiveUnit
	ldr r0, [r4]
	bl GetUnitItemCount
	cmp r0, #4
	ble _08040CC0
	movs r0, #0xc
	orrs r6, r0
_08040CC0:
	ldr r0, [r4]
	add r7, sp, #0xc
	add r5, sp, #0x10
	adds r1, r6, #0
	adds r2, r7, #0
	adds r3, r5, #0
	bl sub_8040BB4
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _08040DC0
	add r0, sp, #0xc
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r2, #2
	ldrsh r1, [r7, r2]
	ldr r2, _08040D34  @ gAiState
	adds r2, #0x7e
	ldrb r3, [r2]
	movs r6, #0
	str r6, [sp]
	movs r2, #0
	bl AiTryMoveTowards
	ldr r4, _08040D38  @ gAiDecision
	movs r0, #0xa
	ldrsb r0, [r4, r0]
	cmp r0, #1
	bne _08040DC0
	add r0, sp, #0xc
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r2, #2
	ldrsh r1, [r7, r2]
	ldrb r2, [r4, #2]
	ldrb r3, [r4, #3]
	str r6, [sp]
	bl sub_803BFD0
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _08040DC0
	ldrb r0, [r4, #2]
	ldrb r1, [r4, #3]
	str r6, [sp]
	ldrb r2, [r5]
	str r2, [sp, #4]
	ldrh r2, [r5, #2]
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	b _08040DA6
	.align 2, 0
_08040D2C: .4byte gRAMChapterData
_08040D30: .4byte gActiveUnit
_08040D34: .4byte gAiState
_08040D38: .4byte gAiDecision
_08040D3C:
	ldr r4, _08040DB4  @ gActiveUnit
	ldr r0, [r4]
	bl GetUnitItemCount
	cmp r0, #4
	bgt _08040DC0
	ldr r0, [r4]
	add r6, sp, #0xc
	adds r1, r6, #0
	bl sub_8040B8C
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _08040DC0
	add r0, sp, #0xc
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r2, #2
	ldrsh r1, [r6, r2]
	ldr r2, _08040DB8  @ gAiState
	adds r2, #0x7e
	ldrb r3, [r2]
	movs r5, #0
	str r5, [sp]
	movs r2, #0
	bl AiTryMoveTowards
	ldr r4, _08040DBC  @ gAiDecision
	movs r0, #0xa
	ldrsb r0, [r4, r0]
	cmp r0, #1
	bne _08040DC0
	add r0, sp, #0xc
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r2, #2
	ldrsh r1, [r6, r2]
	ldrb r2, [r4, #2]
	ldrb r3, [r4, #3]
	str r5, [sp]
	bl sub_803BFD0
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _08040DC0
	ldrb r0, [r4, #2]
	ldrb r1, [r4, #3]
	str r5, [sp]
	ldrb r2, [r4, #2]
	str r2, [sp, #4]
	ldrb r2, [r4, #3]
_08040DA6:
	str r2, [sp, #8]
	movs r2, #0xd
	movs r3, #0
	bl AiSetDecision
	movs r0, #1
	b _08040DC2
	.align 2, 0
_08040DB4: .4byte gActiveUnit
_08040DB8: .4byte gAiState
_08040DBC: .4byte gAiDecision
_08040DC0:
	movs r0, #0
_08040DC2:
	add sp, #0x14
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8040C5C

	THUMB_FUNC_START sub_8040DCC
sub_8040DCC: @ 0x08040DCC
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r2, #1
	ldr r3, _08040DEC  @ gWorkingTerrainMoveCosts
	movs r5, #1
_08040DD6:
	adds r0, r4, r2
	ldrb r1, [r0]
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	ble _08040DF0
	adds r0, r2, r3
	strb r1, [r0]
	b _08040DF4
	.align 2, 0
_08040DEC: .4byte gWorkingTerrainMoveCosts
_08040DF0:
	adds r0, r2, r3
	strb r5, [r0]
_08040DF4:
	adds r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0x40
	bls _08040DD6
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8040DCC

	THUMB_FUNC_START sub_8040E04
sub_8040E04: @ 0x08040E04
	push {r4, r5, r6, lr}
	adds r3, r0, #0
	adds r5, r1, #0
	movs r2, #1
	ldr r6, _08040E30  @ gWorkingTerrainMoveCosts
	adds r4, r6, #0
_08040E10:
	adds r1, r2, r4
	adds r0, r3, r2
	ldrb r0, [r0]
	strb r0, [r1]
	adds r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0x40
	bls _08040E10
	adds r1, r5, r6
	movs r0, #1
	strb r0, [r1]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08040E30: .4byte gWorkingTerrainMoveCosts

	THUMB_FUNC_END sub_8040E04

	THUMB_FUNC_START sub_8040E34
sub_8040E34: @ 0x08040E34
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r6, r1, #0
	adds r7, r2, #0
	movs r3, #1
	ldr r2, _08040E64  @ gWorkingTerrainMoveCosts
	adds r5, r2, #0
_08040E42:
	adds r1, r3, r5
	adds r0, r4, r3
	ldrb r0, [r0]
	strb r0, [r1]
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #0x40
	bls _08040E42
	adds r0, r6, r2
	movs r1, #1
	strb r1, [r0]
	adds r0, r7, r2
	strb r1, [r0]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08040E64: .4byte gWorkingTerrainMoveCosts

	THUMB_FUNC_END sub_8040E34

	THUMB_FUNC_START sub_8040E68
sub_8040E68: @ 0x08040E68
	push {r4, lr}
	adds r4, r0, #0
	bl GetUnitMovementCost
	bl SetWorkingMoveCosts
	ldr r0, _08040E94  @ gBmMapMovement
	ldr r0, [r0]
	bl SetWorkingBmMap
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	movs r3, #0xb
	ldrsb r3, [r4, r3]
	movs r2, #0x7c
	bl GenerateMovementMap
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08040E94: .4byte gBmMapMovement

	THUMB_FUNC_END sub_8040E68

	THUMB_FUNC_START sub_8040E98
sub_8040E98: @ 0x08040E98
	push {r4, lr}
	adds r4, r0, #0
	bl GetUnitMovementCost
	bl SetWorkingMoveCosts
	ldr r0, _08040EC4  @ gBmMapRange
	ldr r0, [r0]
	bl SetWorkingBmMap
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	movs r3, #0xb
	ldrsb r3, [r4, r3]
	movs r2, #0x7c
	bl GenerateMovementMap
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08040EC4: .4byte gBmMapRange

	THUMB_FUNC_END sub_8040E98

	THUMB_FUNC_START sub_8040EC8
sub_8040EC8: @ 0x08040EC8
	push {r4, lr}
	adds r4, r0, #0
	bl GetUnitMovementCost
	bl sub_8040DCC
	ldr r0, _08040EF4  @ gBmMapMovement
	ldr r0, [r0]
	bl SetWorkingBmMap
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	movs r3, #0xb
	ldrsb r3, [r4, r3]
	movs r2, #0x7c
	bl GenerateMovementMap
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08040EF4: .4byte gBmMapMovement

	THUMB_FUNC_END sub_8040EC8

	THUMB_FUNC_START sub_8040EF8
sub_8040EF8: @ 0x08040EF8
	push {r4, lr}
	adds r4, r0, #0
	bl GetUnitMovementCost
	bl sub_8040DCC
	ldr r0, _08040F24  @ gBmMapMovement
	ldr r0, [r0]
	bl SetWorkingBmMap
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	movs r2, #0x7c
	movs r3, #0
	bl GenerateMovementMap
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08040F24: .4byte gBmMapMovement

	THUMB_FUNC_END sub_8040EF8

	THUMB_FUNC_START sub_8040F28
sub_8040F28: @ 0x08040F28
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r0, r2, #0
	bl sub_8040DCC
	ldr r0, _08040F50  @ gBmMapRange
	ldr r0, [r0]
	bl SetWorkingBmMap
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0x7c
	movs r3, #0
	bl GenerateMovementMap
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08040F50: .4byte gBmMapRange

	THUMB_FUNC_END sub_8040F28

	THUMB_FUNC_START sub_8040F54
sub_8040F54: @ 0x08040F54
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	adds r4, r2, #0
	adds r0, r4, #0
	bl GetUnitMovementCost
	bl sub_8040DCC
	ldr r0, _08040F84  @ gBmMapRange
	ldr r0, [r0]
	bl SetWorkingBmMap
	movs r3, #0xb
	ldrsb r3, [r4, r3]
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #0x7c
	bl GenerateMovementMap
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08040F84: .4byte gBmMapRange

	THUMB_FUNC_END sub_8040F54

	THUMB_FUNC_START sub_8040F88
sub_8040F88: @ 0x08040F88
	push {r4, lr}
	adds r4, r0, #0
	bl GetUnitMovementCost
	movs r1, #0x1e
	bl sub_8040E04
	ldr r0, _08040FB8  @ gBmMapRange
	ldr r0, [r0]
	bl SetWorkingBmMap
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	movs r3, #0xb
	ldrsb r3, [r4, r3]
	movs r2, #0x7c
	bl GenerateMovementMap
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08040FB8: .4byte gBmMapRange

	THUMB_FUNC_END sub_8040F88

	THUMB_FUNC_START sub_8040FBC
sub_8040FBC: @ 0x08040FBC
	push {r4, lr}
	adds r4, r0, #0
	bl GetUnitMovementCost
	movs r1, #0x1e
	bl sub_8040E04
	ldr r0, _08040FE8  @ gBmMapRange
	ldr r0, [r0]
	bl SetWorkingBmMap
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	movs r2, #0x7c
	movs r3, #0
	bl GenerateMovementMap
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08040FE8: .4byte gBmMapRange

	THUMB_FUNC_END sub_8040FBC

	THUMB_FUNC_START sub_8040FEC
sub_8040FEC: @ 0x08040FEC
	push {r4, lr}
	adds r4, r0, #0
	bl GetUnitMovementCost
	movs r1, #0x1b
	movs r2, #0x33
	bl sub_8040E34
	ldr r0, _0804101C  @ gBmMapRange
	ldr r0, [r0]
	bl SetWorkingBmMap
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	movs r3, #0xb
	ldrsb r3, [r4, r3]
	movs r2, #0x7c
	bl GenerateMovementMap
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804101C: .4byte gBmMapRange

	THUMB_FUNC_END sub_8040FEC

	THUMB_FUNC_START sub_8041020
sub_8041020: @ 0x08041020
	push {r4, lr}
	adds r4, r0, #0
	bl GetUnitMovementCost
	movs r1, #0x1b
	movs r2, #0x33
	bl sub_8040E34
	ldr r0, _08041050  @ gBmMapRange
	ldr r0, [r0]
	bl SetWorkingBmMap
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	movs r2, #0x7c
	movs r3, #0
	bl GenerateMovementMap
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08041050: .4byte gBmMapRange

	THUMB_FUNC_END sub_8041020

	THUMB_FUNC_START sub_8041054
sub_8041054: @ 0x08041054
	push {r4, lr}
	adds r4, r0, #0
	bl GetUnitMovementCost
	bl SetWorkingMoveCosts
	ldr r0, _0804108C  @ gBmMapRange
	ldr r0, [r0]
	bl SetWorkingBmMap
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	movs r2, #0x1d
	ldrsb r2, [r4, r2]
	ldr r3, [r4, #4]
	ldrb r3, [r3, #0x12]
	lsls r3, r3, #0x18
	asrs r3, r3, #0x18
	adds r2, r2, r3
	movs r3, #0xb
	ldrsb r3, [r4, r3]
	bl GenerateMovementMap
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804108C: .4byte gBmMapRange

	THUMB_FUNC_END sub_8041054

	THUMB_FUNC_START AiUpdateNoMoveFlag
AiUpdateNoMoveFlag: @ 0x08041090
	push {lr}
	adds r0, #0x40
	ldrh r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #6
	ands r0, r1
	cmp r0, #0
	beq _080410B0
	ldr r0, _080410AC  @ gAiState
	adds r0, #0x7b
	ldrb r2, [r0]
	movs r1, #2
	orrs r1, r2
	b _080410BA
	.align 2, 0
_080410AC: .4byte gAiState
_080410B0:
	ldr r0, _080410C0  @ gAiState
	adds r0, #0x7b
	ldrb r2, [r0]
	movs r1, #0xfd
	ands r1, r2
_080410BA:
	strb r1, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_080410C0: .4byte gAiState

	THUMB_FUNC_END AiUpdateNoMoveFlag

	THUMB_FUNC_START sub_80410C4
sub_80410C4: @ 0x080410C4
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	adds r4, r2, #0
	adds r0, r4, #0
	bl GetUnitMovementCost
	bl SetWorkingMoveCosts
	ldr r0, _080410F4  @ gBmMapRange
	ldr r0, [r0]
	bl SetWorkingBmMap
	movs r3, #0xb
	ldrsb r3, [r4, r3]
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #0x7c
	bl GenerateMovementMap
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080410F4: .4byte gBmMapRange

	THUMB_FUNC_END sub_80410C4

	THUMB_FUNC_START sub_80410F8
sub_80410F8: @ 0x080410F8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov r8, r0
	adds r7, r1, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	str r2, [sp]
	movs r0, #0
	mov r1, r8
	str r0, [r1]
	str r0, [r7]
	movs r2, #1
	negs r2, r2
	mov r9, r2
	ldr r0, _080411E4  @ gBmMapSize
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r1, r0, #1
	cmp r1, #0
	blt _080411D2
_08041128:
	ldr r0, _080411E4  @ gBmMapSize
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r5, r0, #1
	subs r0, r1, #1
	mov sl, r0
	cmp r5, #0
	blt _080411CC
	lsls r6, r1, #2
_0804113A:
	ldr r0, _080411E8  @ gBmMapRange
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _080411C6
	ldr r4, _080411EC  @ gBmMapUnit
	ldr r0, [r4]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r1, r0, r5
	ldrb r0, [r1]
	cmp r0, #0
	beq _080411C6
	ldr r0, _080411F0  @ gActiveUnitId
	ldrb r0, [r0]
	ldrb r1, [r1]
	bl AreUnitsAllied
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080411C6
	ldr r0, [r4]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r0, [r0]
	bl GetUnit
	adds r4, r0, #0
	adds r0, #0x30
	ldrb r0, [r0]
	movs r1, #0xf
	ands r1, r0
	subs r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #3
	bls _080411C6
	adds r0, r1, #0
	cmp r0, #0xb
	beq _080411C6
	cmp r0, #0xd
	beq _080411C6
	mov r1, r8
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _080411F4  @ gActiveUnit
	ldr r0, [r0]
	adds r1, r4, #0
	bl GetOffensiveStaffAccuracy
	ldr r2, [sp]
	cmp r0, r2
	blt _080411C6
	mov r0, r9
	cmp r0, #0
	bge _080411C0
	ldrb r4, [r4, #0xb]
	lsls r4, r4, #0x18
	asrs r4, r4, #0x18
	mov r9, r4
_080411C0:
	ldr r0, [r7]
	adds r0, #1
	str r0, [r7]
_080411C6:
	subs r5, #1
	cmp r5, #0
	bge _0804113A
_080411CC:
	mov r1, sl
	cmp r1, #0
	bge _08041128
_080411D2:
	mov r0, r9
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080411E4: .4byte gBmMapSize
_080411E8: .4byte gBmMapRange
_080411EC: .4byte gBmMapUnit
_080411F0: .4byte gActiveUnitId
_080411F4: .4byte gActiveUnit

	THUMB_FUNC_END sub_80410F8

	THUMB_FUNC_START sub_80411F8
sub_80411F8: @ 0x080411F8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x28
	mov r9, r0
	movs r4, #0
	movs r1, #0
	str r1, [sp, #0xc]
	movs r2, #0
	str r2, [sp, #0x10]
	movs r3, #0
	str r3, [sp, #0x14]
	str r1, [sp, #0x1c]
	str r2, [sp, #0x20]
	ldr r1, _08041234  @ gRAMChapterData
	ldrh r1, [r1, #0x10]
	cmp r1, #1
	bhi _0804123C
	ldr r0, _08041238  @ gAiState
	adds r1, r0, #0
	adds r1, #0x86
	strb r3, [r1]
	adds r0, #0x87
	mov r4, sp
	ldrb r4, [r4, #0x14]
	strb r4, [r0]
	movs r0, #0
	b _080413B8
	.align 2, 0
_08041234: .4byte gRAMChapterData
_08041238: .4byte gAiState
_0804123C:
	movs r1, #0
	str r1, [sp, #8]
	b _08041248
_08041242:
	ldr r2, [sp, #8]
	adds r2, #1
	str r2, [sp, #8]
_08041248:
	ldr r3, [sp, #8]
	cmp r3, #4
	bgt _0804126C
	ldr r1, _08041388  @ gActiveUnit
	ldr r1, [r1]
	lsls r2, r3, #1
	adds r1, #0x1e
	adds r1, r1, r2
	ldrh r1, [r1]
	cmp r1, #0
	beq _0804126C
	adds r0, r1, #0
	bl GetItemIndex
	adds r1, r0, #0
	cmp r1, #0xa6
	bne _08041242
	movs r4, #1
_0804126C:
	cmp r4, #0
	bne _08041272
	b _080413B8
_08041272:
	ldr r0, _08041388  @ gActiveUnit
	ldr r0, [r0]
	bl sub_803C490
	movs r0, #1
	negs r0, r0
	bl GenerateMagicSealMap
	ldr r0, _0804138C  @ gBmMapSize
	movs r4, #2
	ldrsh r0, [r0, r4]
	subs r7, r0, #1
	cmp r7, #0
	blt _08041348
_0804128E:
	ldr r0, _0804138C  @ gBmMapSize
	movs r1, #0
	ldrsh r0, [r0, r1]
	subs r6, r0, #1
	subs r2, r7, #1
	str r2, [sp, #0x24]
	cmp r6, #0
	blt _08041342
	lsls r3, r7, #2
	mov r8, r3
	lsls r4, r7, #0x10
	mov sl, r4
_080412A6:
	ldr r0, _08041390  @ gBmMapMovement
	ldr r0, [r0]
	add r0, r8
	ldr r0, [r0]
	adds r0, r0, r6
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _0804133C
	ldr r0, _08041394  @ gBmMapUnit
	ldr r0, [r0]
	add r0, r8
	ldr r0, [r0]
	adds r0, r0, r6
	ldrb r1, [r0]
	cmp r1, #0
	beq _080412CE
	ldr r0, _08041398  @ gActiveUnitId
	ldrb r0, [r0]
	cmp r1, r0
	bne _0804133C
_080412CE:
	ldr r0, _0804139C  @ gBmMapRange
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFill
	lsls r5, r6, #0x10
	asrs r5, r5, #0x10
	movs r0, #0xa6
	bl GetItemMinRange
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	movs r0, #0xa6
	bl GetItemMaxRange
	adds r3, r0, #0
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	adds r0, r5, #0
	mov r2, sl
	asrs r1, r2, #0x10
	adds r2, r4, #0
	bl MapAddInBoundedRange
	mov r3, r9
	ldrb r2, [r3, #2]
	mov r0, sp
	add r1, sp, #4
	bl sub_80410F8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, [sp]
	ldr r4, [sp, #0x14]
	cmp r2, r4
	ble _0804131A
	str r2, [sp, #0x14]
_0804131A:
	mov r1, r9
	ldrb r1, [r1]
	cmp r2, r1
	blt _0804133C
	ldr r1, [sp, #4]
	mov r3, r9
	ldrb r3, [r3, #1]
	cmp r1, r3
	blt _0804133C
	ldr r4, [sp, #0x10]
	cmp r1, r4
	ble _0804133C
	str r2, [sp, #0xc]
	str r1, [sp, #0x10]
	str r6, [sp, #0x1c]
	str r7, [sp, #0x20]
	str r0, [sp, #0x18]
_0804133C:
	subs r6, #1
	cmp r6, #0
	bge _080412A6
_08041342:
	ldr r7, [sp, #0x24]
	cmp r7, #0
	bge _0804128E
_08041348:
	ldr r1, [sp, #0xc]
	mov r0, r9
	ldrb r0, [r0, #1]
	cmp r1, r0
	blt _080413A4
	ldr r1, _080413A0  @ gAiState
	adds r2, r1, #0
	adds r2, #0x86
	movs r0, #1
	strb r0, [r2]
	adds r0, r1, #0
	adds r0, #0x87
	mov r2, sp
	ldrb r2, [r2, #0x1c]
	strb r2, [r0]
	adds r0, #1
	add r3, sp, #0x20
	ldrb r3, [r3]
	strb r3, [r0]
	adds r0, #1
	mov r4, sp
	ldrb r4, [r4, #0x18]
	strb r4, [r0]
	adds r0, #1
	mov r2, sp
	ldrb r2, [r2, #8]
	strb r2, [r0]
	adds r0, #1
	mov r3, sp
	ldrb r3, [r3, #0x14]
	strb r3, [r0]
	b _080413B6
	.align 2, 0
_08041388: .4byte gActiveUnit
_0804138C: .4byte gBmMapSize
_08041390: .4byte gBmMapMovement
_08041394: .4byte gBmMapUnit
_08041398: .4byte gActiveUnitId
_0804139C: .4byte gBmMapRange
_080413A0: .4byte gAiState
_080413A4:
	ldr r0, _080413C8  @ gAiState
	adds r2, r0, #0
	adds r2, #0x86
	movs r1, #0
	strb r1, [r2]
	adds r0, #0x87
	mov r4, sp
	ldrb r4, [r4, #0x14]
	strb r4, [r0]
_080413B6:
	movs r0, #0
_080413B8:
	add sp, #0x28
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080413C8: .4byte gAiState

	THUMB_FUNC_END sub_80411F8

	THUMB_FUNC_START sub_80413CC
sub_80413CC: @ 0x080413CC
	push {lr}
	sub sp, #0xc
	ldr r2, _08041400  @ gAiState
	adds r0, r2, #0
	adds r0, #0x87
	ldrb r0, [r0]
	adds r1, r2, #0
	adds r1, #0x88
	ldrb r1, [r1]
	adds r3, r2, #0
	adds r3, #0x89
	ldrb r3, [r3]
	adds r2, #0x8a
	ldrb r2, [r2]
	str r2, [sp]
	movs r2, #0
	str r2, [sp, #4]
	str r2, [sp, #8]
	movs r2, #0xb
	bl AiSetDecision
	movs r0, #1
	add sp, #0xc
	pop {r1}
	bx r1
	.align 2, 0
_08041400: .4byte gAiState

	THUMB_FUNC_END sub_80413CC

	THUMB_FUNC_START sub_8041404
sub_8041404: @ 0x08041404
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	mov sl, r0
	movs r7, #0
	ldr r0, _08041438  @ gRAMChapterData
	ldrh r0, [r0, #0x10]
	cmp r0, #1
	bne _08041444
	ldr r2, _0804143C  @ gAiState
	adds r1, r2, #0
	adds r1, #0x86
	strb r0, [r1]
	ldr r0, _08041440  @ gActiveUnit
	ldr r1, [r0]
	ldrb r0, [r1, #0x10]
	adds r3, r2, #0
	adds r3, #0x87
	strb r0, [r3]
	ldrb r1, [r1, #0x11]
	adds r0, r2, #0
	adds r0, #0x88
	b _0804156A
	.align 2, 0
_08041438: .4byte gRAMChapterData
_0804143C: .4byte gAiState
_08041440: .4byte gActiveUnit
_08041444:
	ldr r0, _0804154C  @ gBmMapRange
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFill
	ldr r0, _08041550  @ gActiveUnit
	ldr r0, [r0]
	movs r5, #0x10
	ldrsb r5, [r0, r5]
	movs r6, #0x11
	ldrsb r6, [r0, r6]
	movs r0, #0xa6
	bl GetItemMinRange
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	movs r0, #0xa6
	bl GetItemMaxRange
	adds r3, r0, #0
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	adds r0, r5, #0
	adds r1, r6, #0
	adds r2, r4, #0
	bl MapAddInBoundedRange
	add r1, sp, #4
	mov r0, sp
	movs r2, #0
	bl sub_80410F8
	ldr r0, [sp]
	mov r1, sl
	ldrb r1, [r1]
	cmp r0, r1
	blt _08041564
	ldr r0, _08041554  @ gBmMapSize
	movs r2, #2
	ldrsh r0, [r0, r2]
	subs r6, r0, #1
	cmp r6, #0
	blt _08041524
_0804149C:
	ldr r0, _08041554  @ gBmMapSize
	movs r1, #0
	ldrsh r0, [r0, r1]
	subs r2, r0, #1
	subs r0, r6, #1
	mov r9, r0
	cmp r2, #0
	blt _0804151E
_080414AC:
	ldr r0, _08041558  @ gBmMapUnit
	ldr r1, [r0]
	lsls r0, r6, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, r0, r2
	ldrb r4, [r0]
	subs r2, #1
	mov r8, r2
	cmp r4, #0
	beq _08041518
	ldr r0, _0804155C  @ gActiveUnitId
	ldrb r1, [r0]
	cmp r4, r1
	beq _08041518
	ldrb r0, [r0]
	adds r1, r4, #0
	bl AreUnitsAllied
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08041518
	adds r0, r4, #0
	bl GetUnit
	adds r4, r0, #0
	mov r2, sl
	ldr r3, [r2, #4]
	ldrb r2, [r3]
	cmp r2, #0
	beq _08041518
	ldr r0, [r4]
	ldrb r1, [r0, #4]
	adds r5, r0, #0
	cmp r1, r2
	bne _080414FE
	ldr r0, [r4, #4]
	ldrb r0, [r0, #4]
	ldrb r1, [r3, #1]
	cmp r0, r1
	beq _08041516
_080414FE:
	adds r3, #0x14
	ldrb r1, [r3]
	cmp r1, #0
	beq _08041518
	ldrb r0, [r5, #4]
	cmp r0, r1
	bne _080414FE
	ldr r0, [r4, #4]
	ldrb r0, [r0, #4]
	ldrb r2, [r3, #1]
	cmp r0, r2
	bne _080414FE
_08041516:
	adds r7, #1
_08041518:
	mov r2, r8
	cmp r2, #0
	bge _080414AC
_0804151E:
	mov r6, r9
	cmp r6, #0
	bge _0804149C
_08041524:
	mov r0, sl
	ldrb r0, [r0, #1]
	cmp r7, r0
	bge _08041564
	ldr r2, _08041560  @ gAiState
	adds r1, r2, #0
	adds r1, #0x86
	movs r0, #1
	strb r0, [r1]
	ldr r0, _08041550  @ gActiveUnit
	ldr r1, [r0]
	ldrb r0, [r1, #0x10]
	adds r3, r2, #0
	adds r3, #0x87
	strb r0, [r3]
	ldrb r1, [r1, #0x11]
	adds r0, r2, #0
	adds r0, #0x88
	b _0804156A
	.align 2, 0
_0804154C: .4byte gBmMapRange
_08041550: .4byte gActiveUnit
_08041554: .4byte gBmMapSize
_08041558: .4byte gBmMapUnit
_0804155C: .4byte gActiveUnitId
_08041560: .4byte gAiState
_08041564:
	ldr r0, _08041580  @ gAiState
	adds r0, #0x86
	movs r1, #0
_0804156A:
	strb r1, [r0]
	movs r0, #0
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08041580: .4byte gAiState

	THUMB_FUNC_END sub_8041404

	THUMB_FUNC_START sub_8041584
sub_8041584: @ 0x08041584
	push {lr}
	sub sp, #0xc
	ldr r1, _080415AC  @ gAiState
	adds r0, r1, #0
	adds r0, #0x87
	ldrb r0, [r0]
	adds r1, #0x88
	ldrb r1, [r1]
	movs r2, #0
	str r2, [sp]
	str r2, [sp, #4]
	str r2, [sp, #8]
	movs r2, #0xc
	movs r3, #0
	bl AiSetDecision
	movs r0, #1
	add sp, #0xc
	pop {r1}
	bx r1
	.align 2, 0
_080415AC: .4byte gAiState

	THUMB_FUNC_END sub_8041584

.align 2, 0
