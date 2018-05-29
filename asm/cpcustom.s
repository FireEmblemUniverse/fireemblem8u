	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	@ Uhhh "custom" Ai stuff?

	THUMB_FUNC_START sub_803EFE0
sub_803EFE0: @ 0x0803EFE0
	push {lr}
	ldr r2, _0803F008  @ gUnknown_0202E4D8
	ldr r2, [r2]
	lsls r1, r1, #2
	adds r1, r1, r2
	ldr r1, [r1]
	adds r1, r1, r0
	ldrb r1, [r1]
	cmp r1, #0
	beq _0803F002
	ldr r0, _0803F00C  @ gUnknown_0202BE44
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
_0803F008: .4byte gUnknown_0202E4D8
_0803F00C: .4byte gUnknown_0202BE44
_0803F010:
	movs r0, #1
_0803F012:
	pop {r1}
	bx r1

	THUMB_FUNC_START sub_803F018
sub_803F018: @ 0x0803F018
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	movs r7, #0
	ldr r4, _0803F0B0  @ gUnknown_03004E50
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
	ldr r0, _0803F0B4  @ gUnknown_0202E4D4
	movs r2, #2
	ldrsh r0, [r0, r2]
	subs r5, r0, #1
	cmp r5, #0
	blt _0803F132
_0803F066:
	ldr r0, _0803F0B4  @ gUnknown_0202E4D4
	movs r3, #0
	ldrsh r0, [r0, r3]
	subs r4, r0, #1
	subs r6, r5, #1
	cmp r4, #0
	blt _0803F0A6
_0803F074:
	ldr r0, _0803F0B8  @ gUnknown_0202E4E4
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
_0803F0B0: .4byte gUnknown_03004E50
_0803F0B4: .4byte gUnknown_0202E4D4
_0803F0B8: .4byte gUnknown_0202E4E4
_0803F0BC:
	ldr r4, _0803F14C  @ gUnknown_03004E50
	ldr r0, [r4]
	bl GetMovCostTablePtr
	bl StoreMovCostTable
	ldr r0, _0803F150  @ gUnknown_0202E4E4
	ldr r0, [r0]
	bl SetSubjectMap
	ldr r1, [r4]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	ldrb r1, [r1, #0x11]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r2, r5, #0
	movs r3, #0
	bl FillMovementMap
	ldr r0, _0803F154  @ gUnknown_0202E4D4
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r5, r0, #1
	cmp r5, #0
	blt _0803F132
_0803F0F0:
	ldr r0, _0803F154  @ gUnknown_0202E4D4
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r4, r0, #1
	subs r6, r5, #1
	cmp r4, #0
	blt _0803F12C
_0803F0FE:
	ldr r0, _0803F150  @ gUnknown_0202E4E4
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
	ldr r0, _0803F158  @ gUnknown_0203AA04
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
_0803F14C: .4byte gUnknown_03004E50
_0803F150: .4byte gUnknown_0202E4E4
_0803F154: .4byte gUnknown_0202E4D4
_0803F158: .4byte gUnknown_0203AA04

	THUMB_FUNC_START sub_803F15C
sub_803F15C: @ 0x0803F15C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r4, r0, #0
	ldr r5, _0803F1F8  @ gUnknown_03004E50
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
	ldr r0, _0803F1FC  @ gUnknown_0202E4E4
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
_0803F1F8: .4byte gUnknown_03004E50
_0803F1FC: .4byte gUnknown_0202E4E4
_0803F200:
	ldr r5, _0803F2B0  @ gUnknown_03004E50
	ldr r0, [r5]
	bl GetMovCostTablePtr
	bl StoreMovCostTable
	ldr r4, _0803F2B4  @ gUnknown_0202E4E4
	ldr r0, [r4]
	bl SetSubjectMap
	ldr r1, [r5]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	ldrb r1, [r1, #0x11]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	ldr r2, [sp, #4]
	movs r3, #0
	bl FillMovementMap
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
	ldr r4, _0803F2B0  @ gUnknown_03004E50
	ldr r0, [r4]
	strb r6, [r0, #0x10]
	ldr r0, [r4]
	strb r7, [r0, #0x11]
	ldr r0, [r4]
	bl FillMovementMapForUnit
	ldr r0, [r4]
	bl UnitHasMagicRank
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803F25E
	movs r0, #1
	negs r0, r0
	bl sub_801B950
_0803F25E:
	ldr r1, _0803F2B8  @ gUnknown_0202E4D4
	movs r2, #2
	ldrsh r0, [r1, r2]
	subs r5, r0, #1
	cmp r5, #0
	blt _0803F2F2
_0803F26A:
	ldr r1, _0803F2B8  @ gUnknown_0202E4D4
	movs r2, #0
	ldrsh r0, [r1, r2]
	subs r3, r0, #1
	subs r0, r5, #1
	mov ip, r0
	cmp r3, #0
	blt _0803F2EC
	ldr r7, _0803F2BC  @ gUnknown_0202E4E0
	ldr r6, _0803F2B4  @ gUnknown_0202E4E4
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
_0803F2B0: .4byte gUnknown_03004E50
_0803F2B4: .4byte gUnknown_0202E4E4
_0803F2B8: .4byte gUnknown_0202E4D4
_0803F2BC: .4byte gUnknown_0202E4E0
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
	ldr r0, _0803F32C  @ gUnknown_0203AA94
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
	bl sub_803BA08
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
_0803F32C: .4byte gUnknown_0203AA94

	THUMB_FUNC_START sub_803F330
sub_803F330: @ 0x0803F330
	ldr r1, _0803F344  @ gUnknown_0203AA04
	ldr r0, _0803F348  @ gUnknown_03004E50
	ldr r0, [r0]
	adds r0, #0x46
	ldrb r0, [r0]
	adds r1, #0x86
	strb r0, [r1]
	movs r0, #0
	bx lr
	.align 2, 0
_0803F344: .4byte gUnknown_0203AA04
_0803F348: .4byte gUnknown_03004E50

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
	bl GetUnitStruct
	adds r4, #1
	cmp r4, r5
	blt _0803F35C
_0803F368:
	ldr r0, _0803F378  @ gUnknown_0203AA04
	adds r0, #0x79
	movs r1, #0
	strb r1, [r0]
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0803F378: .4byte gUnknown_0203AA04

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
	bl GetUnitStruct
	adds r4, #1
	cmp r4, r5
	blt _0803F38C
_0803F398:
	ldr r0, _0803F3A8  @ gUnknown_0203AA04
	adds r0, #0x79
	movs r1, #0
	strb r1, [r0]
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0803F3A8: .4byte gUnknown_0203AA04

	THUMB_FUNC_START sub_803F3AC
sub_803F3AC: @ 0x0803F3AC
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	ldr r7, _0803F3E0  @ gUnknown_03004E50
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
_0803F3E0: .4byte gUnknown_03004E50
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
	ldr r1, _0803F430  @ gUnknown_0202E4E0
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
_0803F430: .4byte gUnknown_0202E4E0

	THUMB_FUNC_START sub_803F434
sub_803F434: @ 0x0803F434
	push {r4, lr}
	sub sp, #8
	ldr r4, _0803F464  @ gUnknown_03004E50
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
	ldr r0, _0803F468  @ gUnknown_0203AA04
	adds r0, #0x86
	strb r1, [r0]
	movs r0, #0
	b _0803F49C
	.align 2, 0
_0803F464: .4byte gUnknown_03004E50
_0803F468: .4byte gUnknown_0203AA04
_0803F46C:
	ldr r0, [r4]
	bl FillMovementMapForUnit
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
	bl sub_803BA08
	movs r0, #1
_0803F49C:
	add sp, #8
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_START sub_803F4A4
sub_803F4A4: @ 0x0803F4A4
	push {lr}
	adds r1, r0, #0
	ldr r0, _0803F4D0  @ gUnknown_03004E50
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
	ldr r0, _0803F4D4  @ gUnknown_0203AA04
	adds r0, #0x86
	movs r1, #1
	b _0803F4DE
	.align 2, 0
_0803F4D0: .4byte gUnknown_03004E50
_0803F4D4: .4byte gUnknown_0203AA04
_0803F4D8:
	ldr r0, _0803F4E8  @ gUnknown_0203AA04
	adds r0, #0x86
	movs r1, #0
_0803F4DE:
	strb r1, [r0]
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0
_0803F4E8: .4byte gUnknown_0203AA04

	THUMB_FUNC_START sub_803F4EC
sub_803F4EC: @ 0x0803F4EC
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	ldrb r0, [r4]
	bl GetUnitByCharId
	ldrb r5, [r0, #0xb]
	ldrb r0, [r4, #1]
	bl GetUnitByCharId
	ldrb r3, [r0, #0xb]
	movs r0, #0xff
	str r0, [sp]
	movs r0, #8
	movs r1, #0
	adds r2, r5, #0
	bl sub_8039C64
	movs r0, #1
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_START sub_803F51C
sub_803F51C: @ 0x0803F51C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	movs r5, #0
	ldr r7, _0803F554  @ gUnknown_0202BE44
	ldrb r0, [r7]
	mov r8, r0
	ldr r4, _0803F558  @ gUnknown_03004E50
	ldr r6, [r4]
	adds r0, r6, #0
	bl GetUnitLeader
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0
	beq _0803F5C6
	bl GetUnitByCharId
	adds r1, r0, #0
	str r1, [r4]
	cmp r1, #0
	bne _0803F560
	str r6, [r4]
	ldr r0, _0803F55C  @ gUnknown_0203AA04
	adds r0, #0x87
	movs r1, #1
	strb r1, [r0]
	b _0803F5C6
	.align 2, 0
_0803F554: .4byte gUnknown_0202BE44
_0803F558: .4byte gUnknown_03004E50
_0803F55C: .4byte gUnknown_0203AA04
_0803F560:
	ldrb r0, [r1, #0xb]
	strb r0, [r7]
	adds r0, r1, #0
	adds r0, #0x42
	ldrb r4, [r0]
	adds r0, #1
	ldrb r7, [r0]
_0803F56E:
	bl sub_803C4BC
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq _0803F584
	adds r5, #1
	cmp r5, #0xff
	ble _0803F56E
	bl sub_803C510
_0803F584:
	ldr r1, _0803F59C  @ gUnknown_0203AA94
	movs r0, #0xa
	ldrsb r0, [r1, r0]
	cmp r0, #1
	bne _0803F5A4
	ldrb r0, [r1]
	cmp r0, #1
	bne _0803F5A4
	ldr r0, _0803F5A0  @ gUnknown_0203AA04
	ldrb r1, [r1, #6]
	adds r0, #0x86
	b _0803F5AA
	.align 2, 0
_0803F59C: .4byte gUnknown_0203AA94
_0803F5A0: .4byte gUnknown_0203AA04
_0803F5A4:
	ldr r0, _0803F5D4  @ gUnknown_0203AA04
	adds r0, #0x86
	movs r1, #0
_0803F5AA:
	strb r1, [r0]
	bl ClearSomeAIRelatedStruct
	ldr r1, _0803F5D8  @ gUnknown_03004E50
	ldr r0, [r1]
	adds r0, #0x42
	strb r4, [r0]
	ldr r0, [r1]
	adds r0, #0x43
	strb r7, [r0]
	ldr r0, _0803F5DC  @ gUnknown_0202BE44
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
_0803F5D4: .4byte gUnknown_0203AA04
_0803F5D8: .4byte gUnknown_03004E50
_0803F5DC: .4byte gUnknown_0202BE44

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
	ldr r0, _0803F610  @ gUnknown_03004E50
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
_0803F610: .4byte gUnknown_03004E50
_0803F614:
	movs r0, #0
_0803F616:
	pop {r1}
	bx r1

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
	ldr r0, _0803F640  @ gUnknown_0203AA04
	adds r0, #0x87
	movs r1, #1
	strb r1, [r0]
	b _0803F66C
	.align 2, 0
_0803F63C: .4byte gUnknown_0203AAA0
_0803F640: .4byte gUnknown_0203AA04
_0803F644:
	ldr r0, _0803F674  @ sub_803F5E0
	bl sub_803D450
	ldr r0, _0803F678  @ gUnknown_0203AA04
	adds r2, r0, #0
	adds r2, #0x86
	movs r0, #0
	strb r0, [r2]
	ldr r1, _0803F67C  @ gUnknown_0203AA94
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
	bl ClearSomeAIRelatedStruct
_0803F66C:
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0
_0803F674: .4byte sub_803F5E0
_0803F678: .4byte gUnknown_0203AA04
_0803F67C: .4byte gUnknown_0203AA94

	THUMB_FUNC_START sub_803F680
sub_803F680: @ 0x0803F680
	push {lr}
	movs r1, #0xb
	ldrsb r1, [r0, r1]
	ldr r0, _0803F6A8  @ gUnknown_0203AA04
	adds r0, #0x86
	ldrb r0, [r0]
	cmp r1, r0
	bne _0803F6B0
	ldr r0, _0803F6AC  @ gUnknown_03004E50
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
_0803F6A8: .4byte gUnknown_0203AA04
_0803F6AC: .4byte gUnknown_03004E50
_0803F6B0:
	movs r0, #0
_0803F6B2:
	pop {r1}
	bx r1

	THUMB_FUNC_START sub_803F6B8
sub_803F6B8: @ 0x0803F6B8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	ldr r0, _0803F718  @ gUnknown_0203AA04
	adds r0, #0x86
	ldrb r0, [r0]
	bl GetUnitStruct
	movs r2, #0x10
	ldrsb r2, [r0, r2]
	ldr r1, _0803F71C  @ gUnknown_03004E50
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
_0803F718: .4byte gUnknown_0203AA04
_0803F71C: .4byte gUnknown_03004E50
_0803F720:
	movs r0, #0
_0803F722:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_START sub_803F72C
sub_803F72C: @ 0x0803F72C
	push {r4, r5, lr}
	sub sp, #4
	ldr r0, _0803F780  @ gUnknown_0203AA04
	adds r1, r0, #0
	adds r1, #0x86
	ldrb r0, [r1]
	cmp r0, #0
	beq _0803F776
	ldrb r0, [r1]
	bl GetUnitStruct
	adds r4, r0, #0
	ldr r0, _0803F784  @ sub_803F680
	bl sub_803D450
	ldr r5, _0803F788  @ gUnknown_0203AA94
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
	bl sub_803BA08
_0803F776:
	movs r0, #1
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0803F780: .4byte gUnknown_0203AA04
_0803F784: .4byte sub_803F680
_0803F788: .4byte gUnknown_0203AA94
_0803F78C: .4byte sub_803F6B8

	THUMB_FUNC_START sub_803F790
sub_803F790: @ 0x0803F790
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x64
	bl NextRN_N
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r3, _0803F7C4  @ gUnknown_0203AA04
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
_0803F7C4: .4byte gUnknown_0203AA04
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
	bl sub_8040844
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
	ldr r0, _0803F828  @ gUnknown_0203AA04
	adds r0, #0x79
	movs r1, #4
	strb r1, [r0]
_0803F820:
	movs r0, #1
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0803F828: .4byte gUnknown_0203AA04

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
	ldr r4, _0803F88C  @ gUnknown_03004E50
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
	bl sub_803795C
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
	bl sub_8039C20
	b _0803F990
	.align 2, 0
_0803F888: .4byte 0x0000FFFF
_0803F88C: .4byte gUnknown_03004E50
_0803F890:
	adds r0, r2, #0
	bl sub_8040E68
	ldr r0, _0803F964  @ gUnknown_0202E4D4
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r5, r0, #1
	cmp r5, #0
	blt _0803F918
_0803F8A2:
	ldr r0, _0803F964  @ gUnknown_0202E4D4
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r4, r0, #1
	subs r0, r5, #1
	mov r9, r0
	cmp r4, #0
	blt _0803F912
	ldr r7, _0803F968  @ gUnknown_0202E4E0
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
	bl sub_803795C
	cmp r0, #0
	beq _0803F90C
	mov r1, r8
	lsls r0, r1, #0x10
	movs r2, #0x80
	lsls r2, r2, #9
	adds r0, r0, r2
	lsrs r0, r0, #0x10
	mov r8, r0
	ldr r0, _0803F96C  @ gUnknown_0202E4D8
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
	bl sub_803BA08
_0803F936:
	ldr r1, _0803F970  @ gUnknown_0203AA94
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
	bl sub_8039C64
	b _0803F990
	.align 2, 0
_0803F964: .4byte gUnknown_0202E4D4
_0803F968: .4byte gUnknown_0202E4E0
_0803F96C: .4byte gUnknown_0202E4D8
_0803F970: .4byte gUnknown_0203AA94
_0803F974:
	mov r0, r8
	cmp r0, #0
	beq _0803F988
	ldr r0, _0803F984  @ gUnknown_0203AA04
	adds r0, #0x86
	movs r1, #7
	b _0803F98E
	.align 2, 0
_0803F984: .4byte gUnknown_0203AA04
_0803F988:
	ldr r0, _0803F9A4  @ gUnknown_0203AA04
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
_0803F9A4: .4byte gUnknown_0203AA04

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
	bl sub_803BA08
	movs r0, #1
	add sp, #4
	pop {r1}
	bx r1

	THUMB_FUNC_START sub_803F9C8
sub_803F9C8: @ 0x0803F9C8
	ldr r0, _0803F9D4  @ gUnknown_0203AA04
	adds r0, #0x79
	movs r1, #4
	strb r1, [r0]
	movs r0, #1
	bx lr
	.align 2, 0
_0803F9D4: .4byte gUnknown_0203AA04

	THUMB_FUNC_START sub_803F9D8
sub_803F9D8: @ 0x0803F9D8
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	movs r5, #0
	ldr r0, _0803F9F4  @ gUnknown_03004E50
	ldr r0, [r0]
	adds r1, r4, #0
	bl CanUnitUseAsStaff
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0803F9FC
	b _0803FA30
	.align 2, 0
_0803F9F4: .4byte gUnknown_03004E50
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

	THUMB_FUNC_START sub_803FA40
sub_803FA40: @ 0x0803FA40
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r7, r0, #0
	movs r6, #0
	ldr r0, _0803FADC  @ gUnknown_03004E50
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
	bl GetItemWRank
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
	ldr r0, _0803FAE4  @ gUnknown_0203AA94
	ldrb r0, [r0, #0xa]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0803FAB4
	adds r0, r4, #0
	bl GetItemWRank
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
_0803FAB4:
	adds r5, #1
	cmp r5, #4
	bgt _0803FACA
	ldr r0, _0803FADC  @ gUnknown_03004E50
	ldr r0, [r0]
	lsls r1, r5, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r4, [r0]
	cmp r4, #0
	bne _0803FA68
_0803FACA:
	ldr r0, _0803FAE4  @ gUnknown_0203AA94
	ldrb r0, [r0, #0xa]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0803FADC: .4byte gUnknown_03004E50
_0803FAE0: .4byte gUnknown_080D8690
_0803FAE4: .4byte gUnknown_0203AA94

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
	ldr r0, _0803FB90  @ gUnknown_0202E4E0
	ldr r0, [r0]
	lsls r6, r7, #2
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r0, [r0]
	cmp r0, #0x77
	bhi _0803FB72
	ldr r0, _0803FB94  @ gUnknown_0202E4D8
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r1, [r0]
	cmp r1, #0
	beq _0803FB3A
	ldr r0, _0803FB98  @ gUnknown_0202BE44
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
	ldr r0, _0803FB9C  @ gUnknown_0202E4F0
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
_0803FB90: .4byte gUnknown_0202E4E0
_0803FB94: .4byte gUnknown_0202E4D8
_0803FB98: .4byte gUnknown_0202BE44
_0803FB9C: .4byte gUnknown_0202E4F0
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
	ldr r0, _0803FD10  @ gUnknown_03004E50
	ldr r0, [r0]
	bl sub_803C490
	ldr r0, [sp, #0x18]
	bl sub_801B950
	bl sub_801A8E4
	ldr r0, _0803FD14  @ gUnknown_0203AA04
	adds r1, r0, #0
	adds r1, #0x7c
	ldrb r0, [r1]
	cmp r0, #0
	beq _0803FBFA
	adds r1, r0, #0
	mov sl, r1
_0803FBFA:
	ldr r0, _0803FD18  @ gUnknown_0202E4D4
	movs r4, #2
	ldrsh r0, [r0, r4]
	subs r7, r0, #1
	cmp r7, #0
	blt _0803FCDA
_0803FC06:
	ldr r0, _0803FD18  @ gUnknown_0202E4D4
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
	ldr r0, _0803FD1C  @ gUnknown_0202E4E0
	ldr r0, [r0]
	add r0, r8
	ldr r0, [r0]
	adds r0, r0, r6
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _0803FCCE
	ldr r0, _0803FD20  @ gUnknown_0202E4D8
	ldr r0, [r0]
	add r0, r8
	ldr r0, [r0]
	adds r2, r0, r6
	ldrb r1, [r2]
	cmp r1, #0
	beq _0803FCCE
	ldr r0, _0803FD24  @ gUnknown_0202BE44
	ldrb r0, [r0]
	cmp r1, r0
	beq _0803FCCE
	adds r0, r1, #0
	bl GetUnitStruct
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
	bl GetUnitCurrentHP
	movs r1, #0x64
	adds r4, r0, #0
	muls r4, r1, r4
	adds r0, r5, #0
	bl GetUnitMaxHP
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
	ldr r0, _0803FD20  @ gUnknown_0202E4D8
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
	bl sub_8039C20
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
_0803FD10: .4byte gUnknown_03004E50
_0803FD14: .4byte gUnknown_0203AA04
_0803FD18: .4byte gUnknown_0202E4D4
_0803FD1C: .4byte gUnknown_0202E4E0
_0803FD20: .4byte gUnknown_0202E4D8
_0803FD24: .4byte gUnknown_0202BE44
_0803FD28: .4byte gUnknown_0203AA7F
_0803FD2C: .4byte gUnknown_0203AA80

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
	ldr r4, _0803FEE0  @ gUnknown_0203AA04
	adds r5, r4, #0
	adds r5, #0x7b
	ldrb r1, [r5]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _0803FD62
	b _0803FED0
_0803FD62:
	ldr r0, _0803FEE4  @ gUnknown_03004E50
	ldr r0, [r0]
	bl sub_803C490
	ldr r0, [sp, #0x18]
	bl sub_801B950
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
	bl GetUnitStruct
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
	ldr r0, _0803FEE8  @ gUnknown_0202E4D8
	ldr r0, [r0]
	lsls r1, r1, #2
	adds r1, r1, r0
	movs r2, #0x10
	ldrsb r2, [r6, r2]
	ldr r0, [r1]
	adds r0, r0, r2
	ldr r1, _0803FEEC  @ gUnknown_0202BE44
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
	ldr r7, _0803FEE4  @ gUnknown_03004E50
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
	ldr r0, _0803FEFC  @ gUnknown_0202E4E4
	ldr r0, [r0]
	movs r1, #0
	bl ClearMapWith
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
	bl GetUnitCurrentHP
	movs r1, #0x64
	adds r4, r0, #0
	muls r4, r1, r4
	adds r0, r6, #0
	bl GetUnitMaxHP
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
	ldr r0, _0803FEE8  @ gUnknown_0202E4D8
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
	bl sub_8039C20
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
_0803FEE0: .4byte gUnknown_0203AA04
_0803FEE4: .4byte gUnknown_03004E50
_0803FEE8: .4byte gUnknown_0202E4D8
_0803FEEC: .4byte gUnknown_0202BE44
_0803FEF0: .4byte 0x00010005
_0803FEF4: .4byte gUnknown_0203AA7F
_0803FEF8: .4byte gUnknown_0203AA80
_0803FEFC: .4byte gUnknown_0202E4E4

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
	ldr r0, _0803FFF0  @ gUnknown_0203AA04
	adds r0, #0x7b
	ldrb r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	bne _0803FFE0
	bl sub_803C364
	cmp r0, #2
	ble _0803FFE0
	ldr r0, _0803FFF4  @ gUnknown_03004E50
	ldr r0, [r0]
	bl sub_803C490
	movs r0, #1
	negs r0, r0
	bl sub_801B950
	ldr r0, _0803FFF8  @ gUnknown_0202E4D4
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r5, r0, #1
	cmp r5, #0
	blt _0803FFB8
_0803FF48:
	ldr r0, _0803FFF8  @ gUnknown_0202E4D4
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r4, r0, #1
	subs r7, r5, #1
	cmp r4, #0
	blt _0803FFB2
	lsls r6, r5, #2
_0803FF58:
	ldr r0, _0803FFFC  @ gUnknown_0202E4E0
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _0803FFAC
	ldr r0, _08040000  @ gUnknown_0202E4D8
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r1, [r0]
	cmp r1, #0
	beq _0803FF80
	ldr r0, _08040004  @ gUnknown_0202BE44
	ldrb r0, [r0]
	cmp r1, r0
	bne _0803FFAC
_0803FF80:
	ldr r0, _08040008  @ gUnknown_0202E4E4
	ldr r0, [r0]
	movs r1, #0
	bl ClearMapWith
	ldr r0, _0803FFF4  @ gUnknown_03004E50
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
	bl sub_8039C20
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
_0803FFF0: .4byte gUnknown_0203AA04
_0803FFF4: .4byte gUnknown_03004E50
_0803FFF8: .4byte gUnknown_0202E4D4
_0803FFFC: .4byte gUnknown_0202E4E0
_08040000: .4byte gUnknown_0202E4D8
_08040004: .4byte gUnknown_0202BE44
_08040008: .4byte gUnknown_0202E4E4

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
	ldr r0, _08040150  @ gUnknown_0203AA04
	adds r0, #0x7b
	ldrb r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _0804003C
	b _0804013E
_0804003C:
	ldr r0, _08040154  @ gUnknown_03004E50
	ldr r0, [r0]
	bl sub_803C490
	movs r0, #1
	negs r0, r0
	bl sub_801B950
	bl sub_801A8E4
	ldr r0, _08040158  @ gUnknown_0202E4D4
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r7, r0, #1
	cmp r7, #0
	blt _08040108
_0804005C:
	ldr r0, _08040158  @ gUnknown_0202E4D4
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
	ldr r0, _0804015C  @ gUnknown_0202E4E0
	ldr r0, [r0]
	add r0, r8
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _080400FC
	ldr r0, _08040160  @ gUnknown_0202E4D8
	ldr r0, [r0]
	add r0, r8
	ldr r0, [r0]
	adds r1, r0, r4
	ldrb r0, [r1]
	cmp r0, #0
	beq _080400FC
	bl GetUnitStruct
	adds r5, r0, #0
	ldr r0, _08040150  @ gUnknown_0203AA04
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
	ldr r0, _08040160  @ gUnknown_0202E4D8
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
	bl sub_8039C20
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
_08040150: .4byte gUnknown_0203AA04
_08040154: .4byte gUnknown_03004E50
_08040158: .4byte gUnknown_0202E4D4
_0804015C: .4byte gUnknown_0202E4E0
_08040160: .4byte gUnknown_0202E4D8

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
	ldr r0, _08040294  @ gUnknown_0203AA04
	adds r0, #0x7b
	ldrb r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	bne _08040282
	ldr r0, _08040298  @ gUnknown_03004E50
	ldr r0, [r0]
	bl sub_803C490
	movs r0, #1
	negs r0, r0
	bl sub_801B950
	bl sub_801A8E4
	ldr r0, _0804029C  @ gUnknown_0202E4D4
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r7, r0, #1
	cmp r7, #0
	blt _08040262
_080401B2:
	ldr r0, _0804029C  @ gUnknown_0202E4D4
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
	ldr r0, _080402A0  @ gUnknown_0202E4E0
	ldr r0, [r0]
	add r0, r8
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _08040256
	ldr r0, _080402A4  @ gUnknown_0202E4D8
	ldr r0, [r0]
	add r0, r8
	ldr r0, [r0]
	adds r1, r0, r4
	ldrb r0, [r1]
	cmp r0, #0
	beq _08040256
	bl GetUnitStruct
	adds r5, r0, #0
	ldr r0, _08040294  @ gUnknown_0203AA04
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
	ldr r0, _080402A4  @ gUnknown_0202E4D8
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
	bl sub_8039C20
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
_08040294: .4byte gUnknown_0203AA04
_08040298: .4byte gUnknown_03004E50
_0804029C: .4byte gUnknown_0202E4D4
_080402A0: .4byte gUnknown_0202E4E0
_080402A4: .4byte gUnknown_0202E4D8

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
	bl CanUnitUseAsWeapon
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080402E8
	adds r0, r5, #0
	adds r1, r4, #0
	bl CanUnitUseAsStaff
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

	THUMB_FUNC_START sub_8040300
sub_8040300: @ 0x08040300
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _0804031C  @ gUnknown_03004E50
	ldr r0, [r0]
	adds r1, r5, #0
	bl GetStaffAccuracy
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #4
	bhi _08040320
	movs r0, #0
	b _0804034C
	.align 2, 0
_0804031C: .4byte gUnknown_03004E50
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
	ldr r0, _080404D0  @ gUnknown_0203AA04
	adds r0, #0x7b
	ldrb r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _08040384
	b _080404C0
_08040384:
	ldr r0, _080404D4  @ gUnknown_03004E50
	ldr r0, [r0]
	bl sub_803C490
	movs r0, #1
	negs r0, r0
	bl sub_801B950
	movs r4, #1
	mov r9, r4
_08040398:
	mov r0, r9
	bl GetUnitStruct
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
	ldr r0, _080404D0  @ gUnknown_0203AA04
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
	ldr r1, _080404D4  @ gUnknown_03004E50
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
	ldr r0, _080404DC  @ gUnknown_0202E4E4
	ldr r0, [r0]
	movs r1, #0
	bl ClearMapWith
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
	bl sub_8039C20
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
_080404D0: .4byte gUnknown_0203AA04
_080404D4: .4byte gUnknown_03004E50
_080404D8: .4byte 0x00010005
_080404DC: .4byte gUnknown_0202E4E4

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
	ldr r0, _08040654  @ gUnknown_0203AA04
	adds r0, #0x7b
	ldrb r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _08040510
	b _08040642
_08040510:
	ldr r0, _08040658  @ gUnknown_03004E50
	ldr r0, [r0]
	bl sub_803C490
	movs r0, #1
	negs r0, r0
	bl sub_801B950
	movs r4, #1
	mov r8, r4
_08040524:
	mov r0, r8
	bl GetUnitStruct
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
	ldr r0, _08040654  @ gUnknown_0203AA04
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
	ldr r7, _08040658  @ gUnknown_03004E50
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
	bl GetStaffAccuracy
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #4
	bls _08040612
	movs r0, #8
	ldrsb r0, [r6, r0]
	adds r0, r1, r0
	cmp r0, sl
	blt _08040612
	ldr r0, _08040660  @ gUnknown_0202E4E4
	ldr r0, [r0]
	movs r1, #0
	bl ClearMapWith
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
	bl sub_8039C20
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
_08040654: .4byte gUnknown_0203AA04
_08040658: .4byte gUnknown_03004E50
_0804065C: .4byte 0x00010005
_08040660: .4byte gUnknown_0202E4E4

	THUMB_FUNC_START nullsub_29
nullsub_29: @ 0x08040664
	bx lr

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
	ldr r0, _0804073C  @ gUnknown_03004E50
	ldr r0, [r0]
	bl GetMovCostTablePtr
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
	bl GetUnitStruct
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
	ldr r0, _08040744  @ gUnknown_0202E4D4
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r6, r0, #1
	cmp r6, #0
	blt _0804079A
_080406DE:
	ldr r0, _08040744  @ gUnknown_0202E4D4
	movs r1, #0
	ldrsh r0, [r0, r1]
	subs r4, r0, #1
	subs r0, r6, #1
	mov r9, r0
	cmp r4, #0
	blt _08040794
	ldr r3, _08040748  @ gUnknown_0202E4E4
	lsls r5, r6, #2
_080406F2:
	ldr r0, [r3]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r2, r0, r4
	ldrb r0, [r2]
	cmp r0, #0x78
	bhi _0804078E
	ldr r0, _0804074C  @ gUnknown_0202E4D8
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
_0804073C: .4byte gUnknown_03004E50
_08040740: .4byte 0x00010025
_08040744: .4byte gUnknown_0202E4D4
_08040748: .4byte gUnknown_0202E4E4
_0804074C: .4byte gUnknown_0202E4D8
_08040750:
	ldr r0, _080407D4  @ gUnknown_0202E4DC
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
	ldr r0, _080407D8  @ gUnknown_0202E4E0
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
_080407D4: .4byte gUnknown_0202E4DC
_080407D8: .4byte gUnknown_0202E4E0
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

	THUMB_FUNC_START sub_8040844
sub_8040844: @ 0x08040844
	push {r4, r5, r6, lr}
	ldr r0, _08040858  @ gUnknown_0203AA04
	adds r0, #0x7b
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0804085C
	movs r0, #0
	b _080408D6
	.align 2, 0
_08040858: .4byte gUnknown_0203AA04
_0804085C:
	bl sub_8040C5C
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080408D4
	movs r5, #0
	ldr r0, _080408C4  @ gUnknown_03004E50
	ldr r0, [r0]
	ldrh r4, [r0, #0x1e]
	cmp r4, #0
	beq _080408B0
	ldr r6, _080408C8  @ gUnknown_080D86F8
_08040874:
	adds r0, r4, #0
	bl GetItemWType
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
	ldr r0, _080408C4  @ gUnknown_03004E50
	ldr r0, [r0]
	lsls r1, r5, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r4, [r0]
	cmp r4, #0
	bne _08040874
_080408B0:
	ldr r0, _080408CC  @ gUnknown_0203AA04
	adds r0, #0x79
	ldrb r0, [r0]
	cmp r0, #0
	beq _080408D4
	ldr r0, _080408D0  @ gUnknown_0203AA94
	ldrb r0, [r0, #0xa]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	b _080408D6
	.align 2, 0
_080408C4: .4byte gUnknown_03004E50
_080408C8: .4byte gUnknown_080D86F8
_080408CC: .4byte gUnknown_0203AA04
_080408D0: .4byte gUnknown_0203AA94
_080408D4:
	movs r0, #1
_080408D6:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	THUMB_FUNC_START sub_80408DC
sub_80408DC: @ 0x080408DC
	push {r4, r5, r6, lr}
	sub sp, #0x10
	adds r6, r0, #0
	ldr r4, _08040964  @ gUnknown_0203AA04
	adds r0, r4, #0
	adds r0, #0x80
	ldr r0, [r0]
	ldr r1, _08040968  @ 0x80000001
	ands r0, r1
	cmp r0, #0
	beq _0804095C
	ldr r0, _0804096C  @ gUnknown_03004E50
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
	bl sub_803BA08
	ldr r4, _08040970  @ gUnknown_0203AA94
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
	bl sub_8039C20
_0804095C:
	add sp, #0x10
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08040964: .4byte gUnknown_0203AA04
_08040968: .4byte 0x80000001
_0804096C: .4byte gUnknown_03004E50
_08040970: .4byte gUnknown_0203AA94

	THUMB_FUNC_START sub_8040974
sub_8040974: @ 0x08040974
	push {r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r7, r0, #0
	movs r5, #0
	ldr r6, _080409B4  @ gUnknown_0203AA04
	adds r0, r6, #0
	adds r0, #0x80
	ldr r0, [r0]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	beq _08040A64
	ldr r4, _080409B8  @ gUnknown_03004E50
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
_080409B4: .4byte gUnknown_0203AA04
_080409B8: .4byte gUnknown_03004E50
_080409BC:
	ldr r6, _08040A6C  @ gUnknown_03004E50
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
	ldr r0, _08040A6C  @ gUnknown_03004E50
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
	ldr r2, _08040A70  @ gUnknown_0203AA04
	adds r2, #0x7e
	ldrb r3, [r2]
	movs r5, #0
	str r5, [sp]
	movs r2, #0
	bl sub_803BA08
	ldr r4, _08040A74  @ gUnknown_0203AA94
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
	bl sub_8039C20
_08040A64:
	add sp, #0x10
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08040A6C: .4byte gUnknown_03004E50
_08040A70: .4byte gUnknown_0203AA04
_08040A74: .4byte gUnknown_0203AA94

	THUMB_FUNC_START sub_8040A78
sub_8040A78: @ 0x08040A78
	push {r4, r5, lr}
	sub sp, #0x10
	adds r5, r0, #0
	ldr r0, _08040AD8  @ gUnknown_0203AA04
	adds r0, #0x80
	ldr r0, [r0]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	beq _08040ACE
	ldr r0, _08040ADC  @ gUnknown_03004E50
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
	bl sub_8039C20
_08040ACE:
	add sp, #0x10
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08040AD8: .4byte gUnknown_0203AA04
_08040ADC: .4byte gUnknown_03004E50

	THUMB_FUNC_START sub_8040AE0
sub_8040AE0: @ 0x08040AE0
	push {r4, lr}
	adds r3, r0, #0
	adds r4, r1, #0
	ldr r1, _08040B18  @ gUnknown_0202E4E4
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
	ldr r0, _08040B1C  @ gUnknown_0202E4D8
	ldr r0, [r0]
	adds r0, r2, r0
	ldr r0, [r0]
	adds r0, r0, r3
	ldrb r2, [r0]
	cmp r2, #0
	beq _08040B24
	ldr r0, _08040B20  @ gUnknown_0202BE44
	ldrb r0, [r0]
	cmp r2, r0
	beq _08040B24
_08040B14:
	movs r0, #0xff
	b _08040B30
	.align 2, 0
_08040B18: .4byte gUnknown_0202E4E4
_08040B1C: .4byte gUnknown_0202E4D8
_08040B20: .4byte gUnknown_0202BE44
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
	ldr r1, _08040B80  @ gUnknown_0202E4E4
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
_08040B80: .4byte gUnknown_0202E4E4
_08040B84:
	movs r0, #0
_08040B86:
	pop {r4, r5}
	pop {r1}
	bx r1

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
	ldr r1, _08040C00  @ gUnknown_0202E4E0
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
_08040C00: .4byte gUnknown_0202E4E0
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
	ldr r0, _08040C54  @ gUnknown_0202E4E0
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
	ldr r0, _08040C58  @ gUnknown_0202E4D8
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
_08040C54: .4byte gUnknown_0202E4E0
_08040C58: .4byte gUnknown_0202E4D8

	THUMB_FUNC_START sub_8040C5C
sub_8040C5C: @ 0x08040C5C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	movs r6, #0
	ldr r4, _08040C74  @ gUnknown_03004E50
	ldr r1, [r4]
	ldr r0, [r1, #4]
	ldrb r0, [r0, #4]
	cmp r0, #0x33
	beq _08040C78
	movs r0, #0
	b _08040DC2
	.align 2, 0
_08040C74: .4byte gUnknown_03004E50
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
	ldr r1, _08040CA0  @ gUnknown_0203AA04
	adds r1, #0x79
	strb r6, [r1]
	b _08040DC2
	.align 2, 0
_08040CA0: .4byte gUnknown_0203AA04
_08040CA4:
	ldr r0, _08040D2C  @ gUnknown_0202BCF0
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0xe
	bne _08040D3C
	ldr r4, _08040D30  @ gUnknown_03004E50
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
	ldr r2, _08040D34  @ gUnknown_0203AA04
	adds r2, #0x7e
	ldrb r3, [r2]
	movs r6, #0
	str r6, [sp]
	movs r2, #0
	bl sub_803BA08
	ldr r4, _08040D38  @ gUnknown_0203AA94
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
_08040D2C: .4byte gUnknown_0202BCF0
_08040D30: .4byte gUnknown_03004E50
_08040D34: .4byte gUnknown_0203AA04
_08040D38: .4byte gUnknown_0203AA94
_08040D3C:
	ldr r4, _08040DB4  @ gUnknown_03004E50
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
	ldr r2, _08040DB8  @ gUnknown_0203AA04
	adds r2, #0x7e
	ldrb r3, [r2]
	movs r5, #0
	str r5, [sp]
	movs r2, #0
	bl sub_803BA08
	ldr r4, _08040DBC  @ gUnknown_0203AA94
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
	bl sub_8039C20
	movs r0, #1
	b _08040DC2
	.align 2, 0
_08040DB4: .4byte gUnknown_03004E50
_08040DB8: .4byte gUnknown_0203AA04
_08040DBC: .4byte gUnknown_0203AA94
_08040DC0:
	movs r0, #0
_08040DC2:
	add sp, #0x14
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_START sub_8040DCC
sub_8040DCC: @ 0x08040DCC
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r2, #1
	ldr r3, _08040DEC  @ gUnknown_03004BB0
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
_08040DEC: .4byte gUnknown_03004BB0
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

	THUMB_FUNC_START sub_8040E04
sub_8040E04: @ 0x08040E04
	push {r4, r5, r6, lr}
	adds r3, r0, #0
	adds r5, r1, #0
	movs r2, #1
	ldr r6, _08040E30  @ gUnknown_03004BB0
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
_08040E30: .4byte gUnknown_03004BB0

	THUMB_FUNC_START sub_8040E34
sub_8040E34: @ 0x08040E34
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r6, r1, #0
	adds r7, r2, #0
	movs r3, #1
	ldr r2, _08040E64  @ gUnknown_03004BB0
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
_08040E64: .4byte gUnknown_03004BB0

	THUMB_FUNC_START sub_8040E68
sub_8040E68: @ 0x08040E68
	push {r4, lr}
	adds r4, r0, #0
	bl GetMovCostTablePtr
	bl StoreMovCostTable
	ldr r0, _08040E94  @ gUnknown_0202E4E0
	ldr r0, [r0]
	bl SetSubjectMap
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	movs r3, #0xb
	ldrsb r3, [r4, r3]
	movs r2, #0x7c
	bl FillMovementMap
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08040E94: .4byte gUnknown_0202E4E0

	THUMB_FUNC_START sub_8040E98
sub_8040E98: @ 0x08040E98
	push {r4, lr}
	adds r4, r0, #0
	bl GetMovCostTablePtr
	bl StoreMovCostTable
	ldr r0, _08040EC4  @ gUnknown_0202E4E4
	ldr r0, [r0]
	bl SetSubjectMap
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	movs r3, #0xb
	ldrsb r3, [r4, r3]
	movs r2, #0x7c
	bl FillMovementMap
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08040EC4: .4byte gUnknown_0202E4E4

	THUMB_FUNC_START sub_8040EC8
sub_8040EC8: @ 0x08040EC8
	push {r4, lr}
	adds r4, r0, #0
	bl GetMovCostTablePtr
	bl sub_8040DCC
	ldr r0, _08040EF4  @ gUnknown_0202E4E0
	ldr r0, [r0]
	bl SetSubjectMap
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	movs r3, #0xb
	ldrsb r3, [r4, r3]
	movs r2, #0x7c
	bl FillMovementMap
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08040EF4: .4byte gUnknown_0202E4E0

	THUMB_FUNC_START sub_8040EF8
sub_8040EF8: @ 0x08040EF8
	push {r4, lr}
	adds r4, r0, #0
	bl GetMovCostTablePtr
	bl sub_8040DCC
	ldr r0, _08040F24  @ gUnknown_0202E4E0
	ldr r0, [r0]
	bl SetSubjectMap
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	movs r2, #0x7c
	movs r3, #0
	bl FillMovementMap
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08040F24: .4byte gUnknown_0202E4E0

	THUMB_FUNC_START sub_8040F28
sub_8040F28: @ 0x08040F28
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r0, r2, #0
	bl sub_8040DCC
	ldr r0, _08040F50  @ gUnknown_0202E4E4
	ldr r0, [r0]
	bl SetSubjectMap
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0x7c
	movs r3, #0
	bl FillMovementMap
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08040F50: .4byte gUnknown_0202E4E4

	THUMB_FUNC_START sub_8040F54
sub_8040F54: @ 0x08040F54
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	adds r4, r2, #0
	adds r0, r4, #0
	bl GetMovCostTablePtr
	bl sub_8040DCC
	ldr r0, _08040F84  @ gUnknown_0202E4E4
	ldr r0, [r0]
	bl SetSubjectMap
	movs r3, #0xb
	ldrsb r3, [r4, r3]
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #0x7c
	bl FillMovementMap
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08040F84: .4byte gUnknown_0202E4E4

	THUMB_FUNC_START sub_8040F88
sub_8040F88: @ 0x08040F88
	push {r4, lr}
	adds r4, r0, #0
	bl GetMovCostTablePtr
	movs r1, #0x1e
	bl sub_8040E04
	ldr r0, _08040FB8  @ gUnknown_0202E4E4
	ldr r0, [r0]
	bl SetSubjectMap
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	movs r3, #0xb
	ldrsb r3, [r4, r3]
	movs r2, #0x7c
	bl FillMovementMap
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08040FB8: .4byte gUnknown_0202E4E4

	THUMB_FUNC_START sub_8040FBC
sub_8040FBC: @ 0x08040FBC
	push {r4, lr}
	adds r4, r0, #0
	bl GetMovCostTablePtr
	movs r1, #0x1e
	bl sub_8040E04
	ldr r0, _08040FE8  @ gUnknown_0202E4E4
	ldr r0, [r0]
	bl SetSubjectMap
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	movs r2, #0x7c
	movs r3, #0
	bl FillMovementMap
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08040FE8: .4byte gUnknown_0202E4E4

	THUMB_FUNC_START sub_8040FEC
sub_8040FEC: @ 0x08040FEC
	push {r4, lr}
	adds r4, r0, #0
	bl GetMovCostTablePtr
	movs r1, #0x1b
	movs r2, #0x33
	bl sub_8040E34
	ldr r0, _0804101C  @ gUnknown_0202E4E4
	ldr r0, [r0]
	bl SetSubjectMap
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	movs r3, #0xb
	ldrsb r3, [r4, r3]
	movs r2, #0x7c
	bl FillMovementMap
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804101C: .4byte gUnknown_0202E4E4

	THUMB_FUNC_START sub_8041020
sub_8041020: @ 0x08041020
	push {r4, lr}
	adds r4, r0, #0
	bl GetMovCostTablePtr
	movs r1, #0x1b
	movs r2, #0x33
	bl sub_8040E34
	ldr r0, _08041050  @ gUnknown_0202E4E4
	ldr r0, [r0]
	bl SetSubjectMap
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	movs r2, #0x7c
	movs r3, #0
	bl FillMovementMap
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08041050: .4byte gUnknown_0202E4E4

	THUMB_FUNC_START sub_8041054
sub_8041054: @ 0x08041054
	push {r4, lr}
	adds r4, r0, #0
	bl GetMovCostTablePtr
	bl StoreMovCostTable
	ldr r0, _0804108C  @ gUnknown_0202E4E4
	ldr r0, [r0]
	bl SetSubjectMap
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
	bl FillMovementMap
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804108C: .4byte gUnknown_0202E4E4

	THUMB_FUNC_START sub_8041090
sub_8041090: @ 0x08041090
	push {lr}
	adds r0, #0x40
	ldrh r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #6
	ands r0, r1
	cmp r0, #0
	beq _080410B0
	ldr r0, _080410AC  @ gUnknown_0203AA04
	adds r0, #0x7b
	ldrb r2, [r0]
	movs r1, #2
	orrs r1, r2
	b _080410BA
	.align 2, 0
_080410AC: .4byte gUnknown_0203AA04
_080410B0:
	ldr r0, _080410C0  @ gUnknown_0203AA04
	adds r0, #0x7b
	ldrb r2, [r0]
	movs r1, #0xfd
	ands r1, r2
_080410BA:
	strb r1, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_080410C0: .4byte gUnknown_0203AA04

	THUMB_FUNC_START sub_80410C4
sub_80410C4: @ 0x080410C4
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	adds r4, r2, #0
	adds r0, r4, #0
	bl GetMovCostTablePtr
	bl StoreMovCostTable
	ldr r0, _080410F4  @ gUnknown_0202E4E4
	ldr r0, [r0]
	bl SetSubjectMap
	movs r3, #0xb
	ldrsb r3, [r4, r3]
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #0x7c
	bl FillMovementMap
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080410F4: .4byte gUnknown_0202E4E4

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
	ldr r0, _080411E4  @ gUnknown_0202E4D4
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r1, r0, #1
	cmp r1, #0
	blt _080411D2
_08041128:
	ldr r0, _080411E4  @ gUnknown_0202E4D4
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r5, r0, #1
	subs r0, r1, #1
	mov sl, r0
	cmp r5, #0
	blt _080411CC
	lsls r6, r1, #2
_0804113A:
	ldr r0, _080411E8  @ gUnknown_0202E4E4
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _080411C6
	ldr r4, _080411EC  @ gUnknown_0202E4D8
	ldr r0, [r4]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r1, r0, r5
	ldrb r0, [r1]
	cmp r0, #0
	beq _080411C6
	ldr r0, _080411F0  @ gUnknown_0202BE44
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
	bl GetUnitStruct
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
	ldr r0, _080411F4  @ gUnknown_03004E50
	ldr r0, [r0]
	adds r1, r4, #0
	bl GetStaffAccuracy
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
_080411E4: .4byte gUnknown_0202E4D4
_080411E8: .4byte gUnknown_0202E4E4
_080411EC: .4byte gUnknown_0202E4D8
_080411F0: .4byte gUnknown_0202BE44
_080411F4: .4byte gUnknown_03004E50

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
	ldr r1, _08041234  @ gUnknown_0202BCF0
	ldrh r1, [r1, #0x10]
	cmp r1, #1
	bhi _0804123C
	ldr r0, _08041238  @ gUnknown_0203AA04
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
_08041234: .4byte gUnknown_0202BCF0
_08041238: .4byte gUnknown_0203AA04
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
	ldr r1, _08041388  @ gUnknown_03004E50
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
	ldr r0, _08041388  @ gUnknown_03004E50
	ldr r0, [r0]
	bl sub_803C490
	movs r0, #1
	negs r0, r0
	bl sub_801B950
	ldr r0, _0804138C  @ gUnknown_0202E4D4
	movs r4, #2
	ldrsh r0, [r0, r4]
	subs r7, r0, #1
	cmp r7, #0
	blt _08041348
_0804128E:
	ldr r0, _0804138C  @ gUnknown_0202E4D4
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
	ldr r0, _08041390  @ gUnknown_0202E4E0
	ldr r0, [r0]
	add r0, r8
	ldr r0, [r0]
	adds r0, r0, r6
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _0804133C
	ldr r0, _08041394  @ gUnknown_0202E4D8
	ldr r0, [r0]
	add r0, r8
	ldr r0, [r0]
	adds r0, r0, r6
	ldrb r1, [r0]
	cmp r1, #0
	beq _080412CE
	ldr r0, _08041398  @ gUnknown_0202BE44
	ldrb r0, [r0]
	cmp r1, r0
	bne _0804133C
_080412CE:
	ldr r0, _0804139C  @ gUnknown_0202E4E4
	ldr r0, [r0]
	movs r1, #0
	bl ClearMapWith
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
	bl FillRangeMap
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
	ldr r1, _080413A0  @ gUnknown_0203AA04
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
_08041388: .4byte gUnknown_03004E50
_0804138C: .4byte gUnknown_0202E4D4
_08041390: .4byte gUnknown_0202E4E0
_08041394: .4byte gUnknown_0202E4D8
_08041398: .4byte gUnknown_0202BE44
_0804139C: .4byte gUnknown_0202E4E4
_080413A0: .4byte gUnknown_0203AA04
_080413A4:
	ldr r0, _080413C8  @ gUnknown_0203AA04
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
_080413C8: .4byte gUnknown_0203AA04

	THUMB_FUNC_START sub_80413CC
sub_80413CC: @ 0x080413CC
	push {lr}
	sub sp, #0xc
	ldr r2, _08041400  @ gUnknown_0203AA04
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
	bl sub_8039C20
	movs r0, #1
	add sp, #0xc
	pop {r1}
	bx r1
	.align 2, 0
_08041400: .4byte gUnknown_0203AA04

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
	ldr r0, _08041438  @ gUnknown_0202BCF0
	ldrh r0, [r0, #0x10]
	cmp r0, #1
	bne _08041444
	ldr r2, _0804143C  @ gUnknown_0203AA04
	adds r1, r2, #0
	adds r1, #0x86
	strb r0, [r1]
	ldr r0, _08041440  @ gUnknown_03004E50
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
_08041438: .4byte gUnknown_0202BCF0
_0804143C: .4byte gUnknown_0203AA04
_08041440: .4byte gUnknown_03004E50
_08041444:
	ldr r0, _0804154C  @ gUnknown_0202E4E4
	ldr r0, [r0]
	movs r1, #0
	bl ClearMapWith
	ldr r0, _08041550  @ gUnknown_03004E50
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
	bl FillRangeMap
	add r1, sp, #4
	mov r0, sp
	movs r2, #0
	bl sub_80410F8
	ldr r0, [sp]
	mov r1, sl
	ldrb r1, [r1]
	cmp r0, r1
	blt _08041564
	ldr r0, _08041554  @ gUnknown_0202E4D4
	movs r2, #2
	ldrsh r0, [r0, r2]
	subs r6, r0, #1
	cmp r6, #0
	blt _08041524
_0804149C:
	ldr r0, _08041554  @ gUnknown_0202E4D4
	movs r1, #0
	ldrsh r0, [r0, r1]
	subs r2, r0, #1
	subs r0, r6, #1
	mov r9, r0
	cmp r2, #0
	blt _0804151E
_080414AC:
	ldr r0, _08041558  @ gUnknown_0202E4D8
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
	ldr r0, _0804155C  @ gUnknown_0202BE44
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
	bl GetUnitStruct
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
	ldr r2, _08041560  @ gUnknown_0203AA04
	adds r1, r2, #0
	adds r1, #0x86
	movs r0, #1
	strb r0, [r1]
	ldr r0, _08041550  @ gUnknown_03004E50
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
_0804154C: .4byte gUnknown_0202E4E4
_08041550: .4byte gUnknown_03004E50
_08041554: .4byte gUnknown_0202E4D4
_08041558: .4byte gUnknown_0202E4D8
_0804155C: .4byte gUnknown_0202BE44
_08041560: .4byte gUnknown_0203AA04
_08041564:
	ldr r0, _08041580  @ gUnknown_0203AA04
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
_08041580: .4byte gUnknown_0203AA04

	THUMB_FUNC_START sub_8041584
sub_8041584: @ 0x08041584
	push {lr}
	sub sp, #0xc
	ldr r1, _080415AC  @ gUnknown_0203AA04
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
	bl sub_8039C20
	movs r0, #1
	add sp, #0xc
	pop {r1}
	bx r1
	.align 2, 0
_080415AC: .4byte gUnknown_0203AA04

.align 2, 0
