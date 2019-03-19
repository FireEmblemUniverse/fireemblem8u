	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	THUMB_FUNC_START FillMapStaffRangeForUnit
FillMapStaffRangeForUnit: @ 0x0801B618
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	adds r4, r0, #0
	bl GetUnitStaffReachBits
	adds r5, r0, #0
	adds r0, r4, #0
	bl GetUnitMagBy2Range
	adds r2, r0, #0
	cmp r5, #3
	beq _0801B6D8
	cmp r5, #3
	bgt _0801B640
	cmp r5, #1
	beq _0801B648
	b _0801B7F2
_0801B640:
	cmp r5, #0x20
	bne _0801B646
	b _0801B768
_0801B646:
	b _0801B7F2
_0801B648:
	ldr r0, _0801B6C8  @ gBmMapSize
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r1, r0, #1
	cmp r1, #0
	bge _0801B656
	b _0801B7F2
_0801B656:
	ldr r0, _0801B6C8  @ gBmMapSize
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r5, r0, #1
	subs r3, r1, #1
	mov r8, r3
	cmp r5, #0
	blt _0801B6C0
	lsls r6, r1, #2
	lsls r0, r1, #0x10
	asrs r7, r0, #0x10
_0801B66C:
	ldr r0, _0801B6CC  @ gBmMapMovement
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _0801B6BA
	ldr r0, _0801B6D0  @ gBmMapUnit
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801B6BA
	ldr r0, _0801B6D4  @ gBmMapUnk
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801B6BA
	lsls r4, r5, #0x10
	asrs r4, r4, #0x10
	adds r0, r4, #0
	adds r1, r7, #0
	movs r2, #1
	movs r3, #1
	bl MapAddInRange
	adds r0, r4, #0
	adds r1, r7, #0
	movs r2, #0
	movs r3, #1
	negs r3, r3
	bl MapAddInRange
_0801B6BA:
	subs r5, #1
	cmp r5, #0
	bge _0801B66C
_0801B6C0:
	mov r1, r8
	cmp r1, #0
	bge _0801B656
	b _0801B7F2
	.align 2, 0
_0801B6C8: .4byte gBmMapSize
_0801B6CC: .4byte gBmMapMovement
_0801B6D0: .4byte gBmMapUnit
_0801B6D4: .4byte gBmMapUnk
_0801B6D8:
	ldr r0, _0801B758  @ gBmMapSize
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r1, r0, #1
	cmp r1, #0
	bge _0801B6E6
	b _0801B7F2
_0801B6E6:
	ldr r0, _0801B758  @ gBmMapSize
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r5, r0, #1
	subs r3, r1, #1
	mov r8, r3
	cmp r5, #0
	blt _0801B750
	lsls r6, r1, #2
	lsls r0, r1, #0x10
	asrs r7, r0, #0x10
_0801B6FC:
	ldr r0, _0801B75C  @ gBmMapMovement
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _0801B74A
	ldr r0, _0801B760  @ gBmMapUnit
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801B74A
	ldr r0, _0801B764  @ gBmMapUnk
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801B74A
	lsls r4, r5, #0x10
	asrs r4, r4, #0x10
	adds r0, r4, #0
	adds r1, r7, #0
	movs r2, #2
	movs r3, #1
	bl MapAddInRange
	adds r0, r4, #0
	adds r1, r7, #0
	movs r2, #0
	movs r3, #1
	negs r3, r3
	bl MapAddInRange
_0801B74A:
	subs r5, #1
	cmp r5, #0
	bge _0801B6FC
_0801B750:
	mov r1, r8
	cmp r1, #0
	bge _0801B6E6
	b _0801B7F2
	.align 2, 0
_0801B758: .4byte gBmMapSize
_0801B75C: .4byte gBmMapMovement
_0801B760: .4byte gBmMapUnit
_0801B764: .4byte gBmMapUnk
_0801B768:
	ldr r0, _0801B800  @ gBmMapSize
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r1, r0, #1
	cmp r1, #0
	blt _0801B7F2
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	mov sl, r0
_0801B77A:
	ldr r0, _0801B800  @ gBmMapSize
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r5, r0, #1
	subs r3, r1, #1
	mov r8, r3
	cmp r5, #0
	blt _0801B7EC
	lsls r6, r1, #2
	lsls r0, r1, #0x10
	asrs r7, r0, #0x10
	mov r0, sl
	lsls r0, r0, #0x10
	mov r9, r0
_0801B796:
	ldr r0, _0801B804  @ gBmMapMovement
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _0801B7E6
	ldr r0, _0801B808  @ gBmMapUnit
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801B7E6
	ldr r0, _0801B80C  @ gBmMapUnk
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801B7E6
	lsls r4, r5, #0x10
	asrs r4, r4, #0x10
	adds r0, r4, #0
	adds r1, r7, #0
	mov r3, r9
	asrs r2, r3, #0x10
	movs r3, #1
	bl MapAddInRange
	adds r0, r4, #0
	adds r1, r7, #0
	movs r2, #0
	movs r3, #1
	negs r3, r3
	bl MapAddInRange
_0801B7E6:
	subs r5, #1
	cmp r5, #0
	bge _0801B796
_0801B7EC:
	mov r1, r8
	cmp r1, #0
	bge _0801B77A
_0801B7F2:
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801B800: .4byte gBmMapSize
_0801B804: .4byte gBmMapMovement
_0801B808: .4byte gBmMapUnit
_0801B80C: .4byte gBmMapUnk

	THUMB_FUNC_START ApplyStuffToRangeMaps
ApplyStuffToRangeMaps: @ 0x0801B810
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	movs r0, #1
	negs r0, r0
	mov sl, r0
	ldr r0, _0801B840  @ gBmMapRange
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFill
	bl IsNotEnemyPhaseMaybe
	mov r9, r0
	mov r6, r9
	adds r6, #1
	b _0801B934
	.align 2, 0
_0801B840: .4byte gBmMapRange
_0801B844:
	adds r0, r6, #0
	bl GetUnit
	adds r4, r0, #0
	cmp r4, #0
	beq _0801B930
	ldr r0, [r4]
	cmp r0, #0
	beq _0801B930
	ldr r1, [sp]
	lsls r0, r1, #0x18
	mov r8, r0
	cmp r0, #0
	beq _0801B86C
	adds r0, r4, #0
	bl UnitHasMagicRank
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0801B930
_0801B86C:
	ldr r0, _0801B8FC  @ gUnknown_0202BCF0
	ldrb r0, [r0, #0xd]
	cmp r0, #0
	beq _0801B88E
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	ldr r0, _0801B900  @ gBmMapFog
	ldr r0, [r0]
	lsls r1, r1, #2
	adds r1, r1, r0
	movs r2, #0x10
	ldrsb r2, [r4, r2]
	ldr r0, [r1]
	adds r0, r0, r2
	ldrb r0, [r0]
	cmp r0, #0
	beq _0801B930
_0801B88E:
	ldr r5, [r4, #0xc]
	movs r0, #0x80
	ands r5, r0
	cmp r5, #0
	bne _0801B930
	ldr r0, [r4, #4]
	ldrb r1, [r0, #0x12]
	ldrb r0, [r4, #0x1d]
	adds r1, r1, r0
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, r4, #0
	bl FillMovementMapForUnitAndMovement
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	ldr r0, _0801B904  @ gBmMapUnit
	ldr r0, [r0]
	lsls r1, r1, #2
	adds r1, r1, r0
	movs r2, #0x10
	ldrsb r2, [r4, r2]
	ldr r0, [r1]
	adds r0, r0, r2
	ldrb r7, [r0]
	strb r5, [r0]
	adds r0, r4, #0
	bl UnitHasMagicRank
	lsls r0, r0, #0x18
	asrs r5, r0, #0x18
	cmp sl, r5
	beq _0801B8E6
	ldr r0, _0801B908  @ gBmMapUnk
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFill
	cmp r5, #0
	beq _0801B8E4
	movs r0, #1
	bl sub_801B950
_0801B8E4:
	mov sl, r5
_0801B8E6:
	ldr r0, _0801B90C  @ gBmMapRange
	ldr r1, [r0]
	ldr r0, _0801B910  @ gUnknown_030049A0
	str r1, [r0]
	mov r1, r8
	cmp r1, #0
	beq _0801B914
	adds r0, r4, #0
	bl FillMapStaffRangeForUnit
	b _0801B91A
	.align 2, 0
_0801B8FC: .4byte gUnknown_0202BCF0
_0801B900: .4byte gBmMapFog
_0801B904: .4byte gBmMapUnit
_0801B908: .4byte gBmMapUnk
_0801B90C: .4byte gBmMapRange
_0801B910: .4byte gUnknown_030049A0
_0801B914:
	adds r0, r4, #0
	bl FillMapAttackRangeForUnit
_0801B91A:
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	ldr r0, _0801B94C  @ gBmMapUnit
	ldr r0, [r0]
	lsls r1, r1, #2
	adds r1, r1, r0
	movs r2, #0x10
	ldrsb r2, [r4, r2]
	ldr r0, [r1]
	adds r0, r0, r2
	strb r7, [r0]
_0801B930:
	adds r6, #1
	mov r0, r9
_0801B934:
	adds r0, #0x80
	cmp r6, r0
	bge _0801B93C
	b _0801B844
_0801B93C:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801B94C: .4byte gBmMapUnit

	THUMB_FUNC_START sub_801B950
sub_801B950: @ 0x0801B950
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r4, #0x81
_0801B956:
	adds r0, r4, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq _0801B98A
	ldr r1, [r2]
	cmp r1, #0
	beq _0801B98A
	ldr r0, [r2, #4]
	ldr r1, [r1, #0x28]
	ldr r0, [r0, #0x28]
	orrs r1, r0
	movs r0, #0x80
	lsls r0, r0, #0x13
	ands r1, r0
	cmp r1, #0
	beq _0801B98A
	movs r0, #0x10
	ldrsb r0, [r2, r0]
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	movs r2, #0xa
	adds r3, r5, #0
	bl StoreR3ToMapSomething
_0801B98A:
	adds r4, #1
	cmp r4, #0xbf
	ble _0801B956
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_START SetSubjectMap
SetSubjectMap: @ 0x0801B998
	ldr r1, _0801B9A0  @ gUnknown_030049A0
	str r0, [r1]
	bx lr
	.align 2, 0
_0801B9A0: .4byte gUnknown_030049A0

	THUMB_FUNC_START FillRangeMap
FillRangeMap: @ 0x0801B9A4
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	adds r4, r2, #0
	adds r2, r3, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	adds r0, r5, #0
	adds r1, r6, #0
	movs r3, #1
	bl MapAddInRange
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	subs r4, #1
	movs r3, #1
	negs r3, r3
	adds r0, r5, #0
	adds r1, r6, #0
	adds r2, r4, #0
	bl MapAddInRange
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_START GetCurrentMovCostTable
GetCurrentMovCostTable: @ 0x0801B9E4
	ldr r0, _0801B9E8  @ gUnknown_03004BB0
	bx lr
	.align 2, 0
_0801B9E8: .4byte gUnknown_03004BB0

	.align 2, 0 @ Don't pad with nop.
