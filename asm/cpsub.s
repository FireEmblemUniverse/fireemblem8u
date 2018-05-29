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

	THUMB_FUNC_START sub_803A788
sub_803A788: @ 0x0803A788
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r7, r0, #0
	adds r6, r1, #0
	ldr r0, _0803A824  @ gUnknown_03004E50
	ldr r0, [r0]
	movs r4, #0x10
	ldrsb r4, [r0, r4]
	movs r5, #0x11
	ldrsb r5, [r0, r5]
	bl GetMovCostTablePtr
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	bl FillMovementRangeMapSomehow
	bl sub_801A9D0
	ldr r0, _0803A828  @ 0x0000FFFF
	strh r0, [r6]
	movs r5, #1
	ldr r0, _0803A82C  @ gUnknown_0203AA8A
	mov r8, r0
_0803A7BA:
	adds r0, r5, #0
	bl GetUnitStruct
	adds r3, r0, #0
	cmp r3, #0
	beq _0803A810
	ldr r4, [r3]
	cmp r4, #0
	beq _0803A810
	movs r1, #0x11
	ldrsb r1, [r3, r1]
	ldr r0, _0803A830  @ gUnknown_0202E4E4
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
_0803A824: .4byte gUnknown_03004E50
_0803A828: .4byte 0x0000FFFF
_0803A82C: .4byte gUnknown_0203AA8A
_0803A830: .4byte gUnknown_0202E4E4
_0803A834:
	adds r0, r7, #0
	bl GetUnitByCharId
	ldr r0, [r0, #0xc]
	ldr r1, _0803A84C  @ 0x0001000C
	ands r0, r1
	cmp r0, #0
	beq _0803A860
	ldr r0, _0803A850  @ gUnknown_0203AA04
	adds r0, #0x86
	movs r1, #1
	b _0803A866
	.align 2, 0
_0803A84C: .4byte 0x0001000C
_0803A850: .4byte gUnknown_0203AA04
_0803A854:
	ldr r0, _0803A85C  @ gUnknown_0203AA04
	adds r0, #0x86
	movs r1, #1
	b _0803A866
	.align 2, 0
_0803A85C: .4byte gUnknown_0203AA04
_0803A860:
	ldr r0, _0803A874  @ gUnknown_0203AA04
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
_0803A874: .4byte gUnknown_0203AA04

	THUMB_FUNC_START sub_803A878
sub_803A878: @ 0x0803A878
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	adds r6, r1, #0
	movs r7, #0xff
	ldr r0, _0803A908  @ gUnknown_03004E50
	ldr r0, [r0]
	movs r4, #0x10
	ldrsb r4, [r0, r4]
	movs r5, #0x11
	ldrsb r5, [r0, r5]
	bl GetMovCostTablePtr
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	bl FillMovementRangeMapSomehow
	ldr r0, _0803A90C  @ 0x0000FFFF
	strh r0, [r6]
	movs r4, #1
_0803A8A4:
	adds r0, r4, #0
	bl GetUnitStruct
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
	ldr r0, _0803A914  @ gUnknown_0202E4E4
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
_0803A908: .4byte gUnknown_03004E50
_0803A90C: .4byte 0x0000FFFF
_0803A910: .4byte 0x00010025
_0803A914: .4byte gUnknown_0202E4E4
_0803A918:
	movs r0, #1
_0803A91A:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

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
	ldr r0, _0803A964  @ gUnknown_03004E50
	ldr r0, [r0]
	movs r4, #0x10
	ldrsb r4, [r0, r4]
	movs r5, #0x11
	ldrsb r5, [r0, r5]
	bl GetMovCostTablePtr
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	bl FillMovementRangeMapSomehow
	ldr r2, _0803A968  @ 0x0000FFFF
	str r2, [sp, #0xc]
	ldr r0, _0803A96C  @ gUnknown_0202E4D4
	ldrh r0, [r0, #2]
	subs r0, #1
	lsls r0, r0, #0x10
	b _0803A9FA
	.align 2, 0
_0803A964: .4byte gUnknown_03004E50
_0803A968: .4byte 0x0000FFFF
_0803A96C: .4byte gUnknown_0202E4D4
_0803A970:
	ldr r0, _0803AA0C  @ gUnknown_0202E4D4
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
	ldr r0, _0803AA10  @ gUnknown_0202E4E4
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
	ldr r0, _0803AA14  @ gUnknown_0202E4D8
	ldr r0, [r0]
	adds r0, r7, r0
	ldr r0, [r0]
	adds r2, r0, r5
	ldrb r1, [r2]
	cmp r1, #0
	beq _0803A9E8
	ldr r0, _0803AA18  @ gUnknown_0202BE44
	ldrb r0, [r0]
	cmp r1, r0
	beq _0803A9E8
	adds r0, r1, #0
	bl GetUnitStruct
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
_0803AA0C: .4byte gUnknown_0202E4D4
_0803AA10: .4byte gUnknown_0202E4E4
_0803AA14: .4byte gUnknown_0202E4D8
_0803AA18: .4byte gUnknown_0202BE44
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
	ldr r0, _0803AA80  @ gUnknown_03004E50
	ldr r0, [r0]
	movs r4, #0x10
	ldrsb r4, [r0, r4]
	movs r5, #0x11
	ldrsb r5, [r0, r5]
	bl GetMovCostTablePtr
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_8040F28
	ldr r2, _0803AA84  @ 0x0000FFFF
	str r2, [sp, #0xc]
	ldr r0, _0803AA88  @ gUnknown_0202E4D4
	ldrh r0, [r0, #2]
	subs r0, #1
	lsls r0, r0, #0x10
	b _0803AB16
	.align 2, 0
_0803AA80: .4byte gUnknown_03004E50
_0803AA84: .4byte 0x0000FFFF
_0803AA88: .4byte gUnknown_0202E4D4
_0803AA8C:
	ldr r0, _0803AB28  @ gUnknown_0202E4D4
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
	ldr r0, _0803AB2C  @ gUnknown_0202E4E4
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
	ldr r0, _0803AB30  @ gUnknown_0202E4D8
	ldr r0, [r0]
	adds r0, r7, r0
	ldr r0, [r0]
	adds r2, r0, r5
	ldrb r1, [r2]
	cmp r1, #0
	beq _0803AB04
	ldr r0, _0803AB34  @ gUnknown_0202BE44
	ldrb r0, [r0]
	cmp r1, r0
	beq _0803AB04
	adds r0, r1, #0
	bl GetUnitStruct
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
_0803AB28: .4byte gUnknown_0202E4D4
_0803AB2C: .4byte gUnknown_0202E4E4
_0803AB30: .4byte gUnknown_0202E4D8
_0803AB34: .4byte gUnknown_0202BE44
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
	ldr r0, _0803AB80  @ gUnknown_03004E50
	ldr r0, [r0]
	bl FillMovementMapForUnit
	ldr r3, _0803AB84  @ 0x0000FFFF
	ldr r0, _0803AB88  @ gUnknown_0202E4D4
	ldrh r0, [r0, #2]
	subs r0, #1
	lsls r0, r0, #0x10
	b _0803ABF6
	.align 2, 0
_0803AB80: .4byte gUnknown_03004E50
_0803AB84: .4byte 0x0000FFFF
_0803AB88: .4byte gUnknown_0202E4D4
_0803AB8C:
	ldr r0, _0803AC2C  @ gUnknown_0202E4D4
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
	ldr r0, _0803AC30  @ gUnknown_0202E4E0
	ldr r0, [r0]
	adds r0, r6, r0
	asrs r1, r4, #0x10
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _0803ABE4
	ldr r0, _0803AC34  @ gUnknown_0202E4D8
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
	bl sub_8039C20
_0803AC1C:
	add sp, #0x14
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803AC2C: .4byte gUnknown_0202E4D4
_0803AC30: .4byte gUnknown_0202E4E0
_0803AC34: .4byte gUnknown_0202E4D8
_0803AC38: .4byte 0xFFFF0000

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
	ldr r0, _0803AE14  @ gUnknown_0202E4D4
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r5, r0, #1
	cmp r5, #0
	blt _0803AE0A
_0803AD5A:
	ldr r0, _0803AE14  @ gUnknown_0202E4D4
	movs r1, #0
	ldrsh r0, [r0, r1]
	subs r4, r0, #1
	subs r0, r5, #1
	mov sl, r0
	cmp r4, #0
	blt _0803AE04
	lsls r6, r5, #2
_0803AD6C:
	ldr r0, _0803AE18  @ gUnknown_0202E4E4
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _0803ADFE
	ldr r0, _0803AE1C  @ gUnknown_0202E4DC
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
	ldr r0, _0803AE20  @ gUnknown_0202E4D8
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r1, r0, r4
	ldrb r0, [r1]
	cmp r0, #0
	beq _0803ADC4
	ldr r0, _0803AE24  @ gUnknown_03004E50
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
	ldr r0, _0803AE18  @ gUnknown_0202E4E4
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
_0803AE14: .4byte gUnknown_0202E4D4
_0803AE18: .4byte gUnknown_0202E4E4
_0803AE1C: .4byte gUnknown_0202E4DC
_0803AE20: .4byte gUnknown_0202E4D8
_0803AE24: .4byte gUnknown_03004E50
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

	THUMB_FUNC_START sub_803AE3C
sub_803AE3C: @ 0x0803AE3C
	push {r4, lr}
	adds r3, r0, #0
	adds r4, r1, #0
	ldr r1, _0803AE74  @ gUnknown_0202E4E4
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
	ldr r0, _0803AE78  @ gUnknown_0202E4D8
	ldr r0, [r0]
	adds r0, r2, r0
	ldr r0, [r0]
	adds r0, r0, r3
	ldrb r2, [r0]
	cmp r2, #0
	beq _0803AE80
	ldr r0, _0803AE7C  @ gUnknown_0202BE44
	ldrb r0, [r0]
	cmp r2, r0
	beq _0803AE80
_0803AE70:
	movs r0, #0xff
	b _0803AE8C
	.align 2, 0
_0803AE74: .4byte gUnknown_0202E4E4
_0803AE78: .4byte gUnknown_0202E4D8
_0803AE7C: .4byte gUnknown_0202BE44
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
	ldr r0, _0803AFB0  @ gUnknown_0202E4D4
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r6, r0, #1
	cmp r6, #0
	blt _0803AFA4
	mov r8, sp
_0803AEB8:
	ldr r0, _0803AFB0  @ gUnknown_0202E4D4
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
	ldr r0, _0803AFB4  @ gUnknown_0202E4E4
	ldr r0, [r0]
	ldr r1, [sp, #0x10]
	adds r0, r1, r0
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _0803AF98
	ldr r0, _0803AFB8  @ gUnknown_0202E4DC
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
	ldr r0, _0803AFBC  @ gUnknown_0202E4D8
	ldr r0, [r0]
	ldr r3, [sp, #0x10]
	adds r0, r3, r0
	ldr r0, [r0]
	adds r1, r0, r5
	ldrb r0, [r1]
	cmp r0, #0
	beq _0803AF28
	ldr r0, _0803AFC0  @ gUnknown_03004E50
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
	ldr r1, _0803AFB4  @ gUnknown_0202E4E4
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
_0803AFB0: .4byte gUnknown_0202E4D4
_0803AFB4: .4byte gUnknown_0202E4E4
_0803AFB8: .4byte gUnknown_0202E4DC
_0803AFBC: .4byte gUnknown_0202E4D8
_0803AFC0: .4byte gUnknown_03004E50
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
	ldr r0, _0803B050  @ gUnknown_0202E4D4
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
	ldr r0, _0803B050  @ gUnknown_0202E4D4
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
	ldr r0, _0803B054  @ gUnknown_0202E4E4
	ldr r0, [r0]
	add r0, sl
	ldr r0, [r0]
	adds r0, r0, r6
	ldrb r0, [r0]
	cmp r0, #0x78
	bls _0803B03A
	b _0803B1CA
_0803B03A:
	ldr r0, _0803B058  @ gUnknown_0202E4DC
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
_0803B050: .4byte gUnknown_0202E4D4
_0803B054: .4byte gUnknown_0202E4E4
_0803B058: .4byte gUnknown_0202E4DC
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
	ldr r0, _0803B128  @ gUnknown_0202E4E0
	ldr r0, [r0]
	add r0, sl
	ldr r0, [r0]
	adds r0, r0, r6
	ldrb r2, [r0]
	ldr r0, _0803B12C  @ gUnknown_03004E50
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
	ldr r1, _0803B130  @ gUnknown_0202E4D8
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
_0803B128: .4byte gUnknown_0202E4E0
_0803B12C: .4byte gUnknown_03004E50
_0803B130: .4byte gUnknown_0202E4D8
_0803B134:
	ldr r1, [sp, #0x10]
	cmp r1, #0
	beq _0803B16A
	movs r2, #2
	ldrsh r0, [r5, r2]
	ldr r1, _0803B200  @ gUnknown_0202E4D8
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
	ldr r0, _0803B204  @ gUnknown_03004E50
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
	ldr r1, _0803B208  @ gUnknown_0202E4E4
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
	ldr r0, _0803B20C  @ gUnknown_0203AA04
	adds r0, #0x87
	movs r1, #1
	strb r1, [r0]
_0803B1E8:
	ldr r0, [sp, #0xc]
	cmp r0, #0
	bne _0803B1F6
	ldr r0, _0803B20C  @ gUnknown_0203AA04
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
_0803B200: .4byte gUnknown_0202E4D8
_0803B204: .4byte gUnknown_03004E50
_0803B208: .4byte gUnknown_0202E4E4
_0803B20C: .4byte gUnknown_0203AA04
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

	THUMB_FUNC_START sub_803B224
sub_803B224: @ 0x0803B224
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	movs r4, #0
	ldr r1, _0803B28C  @ gUnknown_0202E4D4
	movs r2, #2
	ldrsh r0, [r1, r2]
	subs r2, r0, #1
	cmp r2, #0
	blt _0803B280
	movs r3, #0
	ldrsh r7, [r1, r3]
	ldr r0, _0803B290  @ gUnknown_0202E4E4
	mov r8, r0
	ldr r3, _0803B294  @ gUnknown_0202E4D8
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
_0803B28C: .4byte gUnknown_0202E4D4
_0803B290: .4byte gUnknown_0202E4E4
_0803B294: .4byte gUnknown_0202E4D8

	THUMB_FUNC_START sub_803B298
sub_803B298: @ 0x0803B298
	push {r4, r5, r6, r7, lr}
	movs r6, #0
	ldr r0, _0803B304  @ gUnknown_0202E4D4
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r1, r0, #1
	cmp r1, #0
	blt _0803B2FA
_0803B2A8:
	ldr r0, _0803B304  @ gUnknown_0202E4D4
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r4, r0, #1
	subs r7, r1, #1
	cmp r4, #0
	blt _0803B2F4
	lsls r5, r1, #2
_0803B2B8:
	ldr r0, _0803B308  @ gUnknown_0202E4E4
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0803B2EE
	ldr r0, _0803B30C  @ gUnknown_0202E4D8
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r1, r0, r4
	ldrb r0, [r1]
	cmp r0, #0
	beq _0803B2EE
	ldr r0, _0803B310  @ gUnknown_0202BE44
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
_0803B304: .4byte gUnknown_0202E4D4
_0803B308: .4byte gUnknown_0202E4E4
_0803B30C: .4byte gUnknown_0202E4D8
_0803B310: .4byte gUnknown_0202BE44

	THUMB_FUNC_START sub_803B314
sub_803B314: @ 0x0803B314
	push {r4, r5, r6, r7, lr}
	movs r6, #0
	ldr r0, _0803B380  @ gUnknown_0202E4D4
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r1, r0, #1
	cmp r1, #0
	blt _0803B378
_0803B324:
	ldr r0, _0803B380  @ gUnknown_0202E4D4
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r4, r0, #1
	subs r7, r1, #1
	cmp r4, #0
	blt _0803B372
	lsls r5, r1, #2
_0803B334:
	ldr r0, _0803B384  @ gUnknown_0202E4E4
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0803B36C
	ldr r0, _0803B388  @ gUnknown_0202E4D8
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r1, r0, r4
	ldrb r0, [r1]
	cmp r0, #0
	beq _0803B36C
	ldr r0, _0803B38C  @ gUnknown_0202BE44
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
_0803B380: .4byte gUnknown_0202E4D4
_0803B384: .4byte gUnknown_0202E4E4
_0803B388: .4byte gUnknown_0202E4D8
_0803B38C: .4byte gUnknown_0202BE44

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
	ldr r5, _0803B414  @ gUnknown_0202E4D4
	lsls r0, r1, #0x10
	asrs r7, r0, #0x10
	mov r9, r2
	ldr r0, _0803B418  @ gUnknown_0202E4D8
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
_0803B414: .4byte gUnknown_0202E4D4
_0803B418: .4byte gUnknown_0202E4D8

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
	ldr r5, _0803B4AC  @ gUnknown_0202E4D4
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
	ldr r0, _0803B4B0  @ gUnknown_0202E4D8
	ldr r1, [r0]
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r1, r0, r3
	ldrb r0, [r1]
	cmp r0, #0
	beq _0803B48E
	ldr r0, _0803B4B4  @ gUnknown_0202BE44
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
_0803B4AC: .4byte gUnknown_0202E4D4
_0803B4B0: .4byte gUnknown_0202E4D8
_0803B4B4: .4byte gUnknown_0202BE44

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
	ldr r5, _0803B54C  @ gUnknown_0202E4D4
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
	ldr r0, _0803B550  @ gUnknown_0202E4D8
	ldr r1, [r0]
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r1, r0, r3
	ldrb r0, [r1]
	cmp r0, #0
	beq _0803B52C
	ldr r0, _0803B554  @ gUnknown_0202BE44
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
_0803B54C: .4byte gUnknown_0202E4D4
_0803B550: .4byte gUnknown_0202E4D8
_0803B554: .4byte gUnknown_0202BE44

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
	bl FillMovementMapForUnit
	ldr r0, _0803B5EC  @ gUnknown_0202E4E4
	ldr r0, [r0]
	movs r1, #0
	bl ClearMapWith
	ldr r0, _0803B5F0  @ gUnknown_0202E4D4
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r7, r0, #1
	cmp r7, #0
	blt _0803B5DC
_0803B582:
	ldr r0, _0803B5F0  @ gUnknown_0202E4D4
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
	ldr r0, _0803B5F4  @ gUnknown_0202E4E0
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
	bl FillRangeMap
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
_0803B5EC: .4byte gUnknown_0202E4E4
_0803B5F0: .4byte gUnknown_0202E4D4
_0803B5F4: .4byte gUnknown_0202E4E0

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
	bl FillMovementMapForUnit
	ldr r0, _0803B66C  @ gUnknown_0202E4E4
	ldr r0, [r0]
	movs r1, #0
	bl ClearMapWith
	ldr r0, _0803B670  @ gUnknown_0202E4D4
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r5, r0, #1
	cmp r5, #0
	blt _0803B664
_0803B62C:
	ldr r0, _0803B670  @ gUnknown_0202E4D4
	movs r1, #0
	ldrsh r0, [r0, r1]
	subs r4, r0, #1
	subs r6, r5, #1
	cmp r4, #0
	blt _0803B65E
_0803B63A:
	ldr r0, _0803B674  @ gUnknown_0202E4E0
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
_0803B66C: .4byte gUnknown_0202E4E4
_0803B670: .4byte gUnknown_0202E4D4
_0803B674: .4byte gUnknown_0202E4E0

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
	bl FillMovementMapForUnit
	ldr r0, _0803B70C  @ gUnknown_0202E4E4
	ldr r0, [r0]
	movs r1, #0
	bl ClearMapWith
	ldr r0, _0803B710  @ gUnknown_0202E4D4
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r7, r0, #1
	cmp r7, #0
	blt _0803B6FC
_0803B6A2:
	ldr r0, _0803B710  @ gUnknown_0202E4D4
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
	ldr r0, _0803B714  @ gUnknown_0202E4E0
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
	bl FillRangeMap
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
_0803B70C: .4byte gUnknown_0202E4E4
_0803B710: .4byte gUnknown_0202E4D4
_0803B714: .4byte gUnknown_0202E4E0

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
	ldr r0, _0803B84C  @ gUnknown_0203AA04
	adds r0, #0x7b
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0803B854
	ldr r4, _0803B850  @ gUnknown_0202E4E0
	ldr r0, [r4]
	movs r1, #1
	negs r1, r1
	bl ClearMapWith
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
_0803B84C: .4byte gUnknown_0203AA04
_0803B850: .4byte gUnknown_0202E4E0
_0803B854:
	adds r0, r5, #0
	bl FillMovementMapForUnit
_0803B85A:
	ldr r1, _0803B8D8  @ gUnknown_0202E4D4
	movs r2, #2
	ldrsh r0, [r1, r2]
	subs r5, r0, #1
	cmp r5, #0
	blt _0803B8CE
_0803B866:
	ldr r1, _0803B8D8  @ gUnknown_0202E4D4
	movs r2, #0
	ldrsh r0, [r1, r2]
	subs r3, r0, #1
	subs r0, r5, #1
	mov r8, r0
	cmp r3, #0
	blt _0803B8C8
	lsls r4, r5, #2
	ldr r1, _0803B8DC  @ gUnknown_0202E4E0
	mov ip, r1
	ldr r7, _0803B8E0  @ gUnknown_0202E4D8
	ldr r6, _0803B8E4  @ gUnknown_0202BE44
	ldr r1, _0803B8E8  @ gUnknown_0202E4F0
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
_0803B8D8: .4byte gUnknown_0202E4D4
_0803B8DC: .4byte gUnknown_0202E4E0
_0803B8E0: .4byte gUnknown_0202E4D8
_0803B8E4: .4byte gUnknown_0202BE44
_0803B8E8: .4byte gUnknown_0202E4F0
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

	THUMB_FUNC_START sub_803B8FC
sub_803B8FC: @ 0x0803B8FC
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r4, r1, #0
	ldr r5, _0803B97C  @ gUnknown_03004E50
	ldr r0, [r5]
	bl GetMovCostTablePtr
	bl StoreMovCostTable
	ldr r0, _0803B980  @ gUnknown_0202E4E4
	ldr r0, [r0]
	bl SetSubjectMap
	ldr r2, [r5]
	movs r0, #0x10
	ldrsb r0, [r2, r0]
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	movs r3, #0xb
	ldrsb r3, [r2, r3]
	movs r2, #0x7c
	bl FillMovementMap
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
	bl GetMovCostTablePtr
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	bl FillMovementRangeMapSomehow
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
_0803B97C: .4byte gUnknown_03004E50
_0803B980: .4byte gUnknown_0202E4E4
_0803B984: .4byte gUnknown_085A8120
_0803B988: .4byte gUnknown_085A8124
_0803B98C:
	movs r0, #1
_0803B98E:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_START sub_803B994
sub_803B994: @ 0x0803B994
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	movs r5, #0
	strb r5, [r6]
	ldr r4, _0803B9B4  @ gUnknown_03004E50
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
_0803B9B4: .4byte gUnknown_03004E50
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

	THUMB_FUNC_START sub_803BA08
sub_803BA08: @ 0x0803BA08
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
	ldr r1, _0803BA64  @ gUnknown_03004E50
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
	bl sub_8039C20
	b _0803BBC0
	.align 2, 0
_0803BA64: .4byte gUnknown_03004E50
_0803BA68:
	cmp r4, #0
	beq _0803BA8C
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	lsls r4, r6, #0x10
	asrs r4, r4, #0x10
	ldr r0, _0803BA88  @ gUnknown_03004E50
	ldr r0, [r0]
	bl GetMovCostTablePtr
	adds r2, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	bl FillMovementRangeMapSomehow
	b _0803BA9C
	.align 2, 0
_0803BA88: .4byte gUnknown_03004E50
_0803BA8C:
	lsls r0, r5, #0x10
	asrs r0, r0, #0x10
	lsls r1, r6, #0x10
	asrs r1, r1, #0x10
	ldr r2, _0803BACC  @ gUnknown_03004E50
	ldr r2, [r2]
	bl sub_80410C4
_0803BA9C:
	ldr r4, _0803BACC  @ gUnknown_03004E50
	ldr r0, [r4]
	bl FillMovementMapForUnit
	ldr r2, [r4]
	movs r0, #0x11
	ldrsb r0, [r2, r0]
	ldr r1, _0803BAD0  @ gUnknown_0202E4E4
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
	ldr r0, _0803BAD8  @ gUnknown_0202E4D4
	ldrh r0, [r0, #2]
	subs r0, #1
	lsls r0, r0, #0x10
	b _0803BB98
	.align 2, 0
_0803BACC: .4byte gUnknown_03004E50
_0803BAD0: .4byte gUnknown_0202E4E4
_0803BAD4: .4byte 0x0000FFFF
_0803BAD8: .4byte gUnknown_0202E4D4
_0803BADC:
	ldr r0, _0803BBD0  @ gUnknown_0202E4D4
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
	ldr r0, _0803BBD4  @ gUnknown_0202E4E0
	ldr r0, [r0]
	add r0, r8
	asrs r3, r1, #0x10
	ldr r0, [r0]
	adds r0, r0, r3
	ldrb r0, [r0]
	lsls r2, r4, #0x10
	cmp r0, #0x78
	bhi _0803BB88
	ldr r0, _0803BBD8  @ gUnknown_0202E4D8
	ldr r0, [r0]
	add r0, r8
	ldr r0, [r0]
	adds r0, r0, r3
	ldrb r1, [r0]
	cmp r1, #0
	beq _0803BB1E
	ldr r0, _0803BBDC  @ gUnknown_0202BE44
	ldrb r0, [r0]
	cmp r1, r0
	bne _0803BB88
_0803BB1E:
	mov r1, sl
	cmp r1, #0
	bne _0803BB52
	ldr r0, _0803BBE0  @ gUnknown_03004E50
	ldr r0, [r0]
	movs r1, #0x1d
	ldrsb r1, [r0, r1]
	ldr r0, [r0, #4]
	ldrb r0, [r0, #0x12]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r1, r1, r0
	ldr r0, _0803BBE4  @ gUnknown_0203AA04
	adds r0, #0x85
	ldrb r0, [r0]
	cmp r1, r0
	bge _0803BB52
	ldr r0, _0803BBE8  @ gUnknown_0202E4F0
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
	ldr r0, _0803BBEC  @ gUnknown_0202E4E4
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
	bl sub_8039C20
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
_0803BBD0: .4byte gUnknown_0202E4D4
_0803BBD4: .4byte gUnknown_0202E4E0
_0803BBD8: .4byte gUnknown_0202E4D8
_0803BBDC: .4byte gUnknown_0202BE44
_0803BBE0: .4byte gUnknown_03004E50
_0803BBE4: .4byte gUnknown_0203AA04
_0803BBE8: .4byte gUnknown_0202E4F0
_0803BBEC: .4byte gUnknown_0202E4E4
_0803BBF0: .4byte 0xFFFF0000

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
	ldr r1, _0803BC50  @ gUnknown_03004E50
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
	bl sub_8039C20
	b _0803BDAC
	.align 2, 0
_0803BC50: .4byte gUnknown_03004E50
_0803BC54:
	cmp r4, #0
	beq _0803BC78
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	lsls r4, r6, #0x10
	asrs r4, r4, #0x10
	ldr r0, _0803BC74  @ gUnknown_03004E50
	ldr r0, [r0]
	bl GetMovCostTablePtr
	adds r2, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_8040F28
	b _0803BC88
	.align 2, 0
_0803BC74: .4byte gUnknown_03004E50
_0803BC78:
	lsls r0, r5, #0x10
	asrs r0, r0, #0x10
	lsls r1, r6, #0x10
	asrs r1, r1, #0x10
	ldr r2, _0803BCB8  @ gUnknown_03004E50
	ldr r2, [r2]
	bl sub_8040F54
_0803BC88:
	ldr r4, _0803BCB8  @ gUnknown_03004E50
	ldr r0, [r4]
	bl FillMovementMapForUnit
	ldr r2, [r4]
	movs r0, #0x11
	ldrsb r0, [r2, r0]
	ldr r1, _0803BCBC  @ gUnknown_0202E4E4
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
	ldr r0, _0803BCC4  @ gUnknown_0202E4D4
	ldrh r0, [r0, #2]
	subs r0, #1
	lsls r0, r0, #0x10
	b _0803BD84
	.align 2, 0
_0803BCB8: .4byte gUnknown_03004E50
_0803BCBC: .4byte gUnknown_0202E4E4
_0803BCC0: .4byte 0x0000FFFF
_0803BCC4: .4byte gUnknown_0202E4D4
_0803BCC8:
	ldr r0, _0803BDBC  @ gUnknown_0202E4D4
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
	ldr r0, _0803BDC0  @ gUnknown_0202E4E0
	ldr r0, [r0]
	add r0, r8
	asrs r3, r1, #0x10
	ldr r0, [r0]
	adds r0, r0, r3
	ldrb r0, [r0]
	lsls r2, r4, #0x10
	cmp r0, #0x78
	bhi _0803BD74
	ldr r0, _0803BDC4  @ gUnknown_0202E4D8
	ldr r0, [r0]
	add r0, r8
	ldr r0, [r0]
	adds r0, r0, r3
	ldrb r1, [r0]
	cmp r1, #0
	beq _0803BD0A
	ldr r0, _0803BDC8  @ gUnknown_0202BE44
	ldrb r0, [r0]
	cmp r1, r0
	bne _0803BD74
_0803BD0A:
	mov r1, sl
	cmp r1, #0
	bne _0803BD3E
	ldr r0, _0803BDCC  @ gUnknown_03004E50
	ldr r0, [r0]
	movs r1, #0x1d
	ldrsb r1, [r0, r1]
	ldr r0, [r0, #4]
	ldrb r0, [r0, #0x12]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r1, r1, r0
	ldr r0, _0803BDD0  @ gUnknown_0203AA04
	adds r0, #0x85
	ldrb r0, [r0]
	cmp r1, r0
	bge _0803BD3E
	ldr r0, _0803BDD4  @ gUnknown_0202E4F0
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
	ldr r0, _0803BDD8  @ gUnknown_0202E4E4
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
	bl sub_8039C20
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
_0803BDBC: .4byte gUnknown_0202E4D4
_0803BDC0: .4byte gUnknown_0202E4E0
_0803BDC4: .4byte gUnknown_0202E4D8
_0803BDC8: .4byte gUnknown_0202BE44
_0803BDCC: .4byte gUnknown_03004E50
_0803BDD0: .4byte gUnknown_0203AA04
_0803BDD4: .4byte gUnknown_0202E4F0
_0803BDD8: .4byte gUnknown_0202E4E4
_0803BDDC: .4byte 0xFFFF0000

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
	ldr r2, _0803BE34  @ gUnknown_0202E4D8
	ldr r0, [r2]
	lsls r2, r5, #2
	adds r0, r2, r0
	lsrs r4, r1, #0x10
	mov r8, r4
	asrs r4, r1, #0x10
	ldr r1, [r0]
	adds r1, r1, r4
	ldr r7, _0803BE38  @ gUnknown_0202E4F0
	ldr r0, [r7]
	adds r0, r2, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r1, [r1]
	ldrb r0, [r0]
	orrs r1, r0
	ldr r0, _0803BE3C  @ gUnknown_0202E4EC
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
_0803BE34: .4byte gUnknown_0202E4D8
_0803BE38: .4byte gUnknown_0202E4F0
_0803BE3C: .4byte gUnknown_0202E4EC
_0803BE40:
	ldr r0, [sp, #8]
	bl GetMovCostTablePtr
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	bl FillMovementRangeMapSomehow
	ldr r0, [sp, #8]
	bl FillMovementMapForUnitPosition
	movs r2, #0x7c
	str r2, [sp]
	ldr r0, _0803BE68  @ 0x0000FFFF
	strh r0, [r6]
	ldr r1, _0803BE6C  @ gUnknown_0202E4D4
	ldrh r0, [r1, #2]
	subs r0, #1
	lsls r0, r0, #0x10
	b _0803BF06
	.align 2, 0
_0803BE68: .4byte 0x0000FFFF
_0803BE6C: .4byte gUnknown_0202E4D4
_0803BE70:
	ldr r4, _0803BF1C  @ gUnknown_0202E4D4
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
	ldr r0, _0803BF20  @ gUnknown_0202E4E0
	str r0, [sp, #4]
	ldr r2, _0803BF24  @ gUnknown_0202E4D8
	mov sl, r2
	ldr r7, _0803BF28  @ gUnknown_0202E4F0
	mov r9, r7
	ldr r0, _0803BF2C  @ gUnknown_0202E4EC
	mov r8, r0
	ldr r2, _0803BF30  @ gUnknown_0202E4E4
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
_0803BF1C: .4byte gUnknown_0202E4D4
_0803BF20: .4byte gUnknown_0202E4E0
_0803BF24: .4byte gUnknown_0202E4D8
_0803BF28: .4byte gUnknown_0202E4F0
_0803BF2C: .4byte gUnknown_0202E4EC
_0803BF30: .4byte gUnknown_0202E4E4
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

	THUMB_FUNC_START sub_803BF84
sub_803BF84: @ 0x0803BF84
	push {r4, r5, lr}
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	movs r4, #1
_0803BF8C:
	adds r0, r4, #0
	bl GetUnitStruct
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

	THUMB_FUNC_START sub_803C014
sub_803C014: @ 0x0803C014
	push {lr}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x18
	ldr r2, _0803C03C  @ gUnknown_0202E4DC
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
_0803C03C: .4byte gUnknown_0202E4DC
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

	THUMB_FUNC_START SetupUnitInventoryAIFlags
SetupUnitInventoryAIFlags: @ 0x0803C064
	push {r4, r5, r6, r7, lr}
	ldr r0, _0803C118  @ gUnknown_0203AA04
	adds r0, #0x85
	movs r1, #0
	strb r1, [r0]
	movs r4, #1
_0803C070:
	adds r0, r4, #0
	bl GetUnitStruct
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
	ldr r0, _0803C118  @ gUnknown_0203AA04
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
	bl CanUnitUseAsWeapon
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0803C0CA
	adds r0, r5, #0
	adds r1, r4, #0
	bl CanUnitUseAsStaff
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
_0803C118: .4byte gUnknown_0203AA04
_0803C11C: .4byte 0x00010005

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

	THUMB_FUNC_START SaveNumberOfAlliedUnitsIn0To8Range
SaveNumberOfAlliedUnitsIn0To8Range: @ 0x0803C1B4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	movs r0, #0
	mov r8, r0
	ldr r0, _0803C24C  @ gUnknown_0202E4E0
	ldr r0, [r0]
	movs r1, #0
	bl ClearMapWith
	movs r0, #0x10
	ldrsb r0, [r6, r0]
	movs r1, #0x11
	ldrsb r1, [r6, r1]
	movs r2, #1
	movs r3, #8
	bl FillRangeMap
	ldr r0, _0803C250  @ gUnknown_0202E4D4
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r1, r0, #1
	cmp r1, #0
	blt _0803C23A
_0803C1E6:
	ldr r0, _0803C250  @ gUnknown_0202E4D4
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r4, r0, #1
	subs r7, r1, #1
	cmp r4, #0
	blt _0803C234
	lsls r5, r1, #2
_0803C1F6:
	ldr r0, _0803C24C  @ gUnknown_0202E4E0
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0803C22E
	ldr r0, _0803C254  @ gUnknown_0202E4D8
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
_0803C24C: .4byte gUnknown_0202E4E0
_0803C250: .4byte gUnknown_0202E4D4
_0803C254: .4byte gUnknown_0202E4D8

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
	ldr r0, _0803C338  @ gUnknown_0202E4D4
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r6, r0, #1
	cmp r6, #0
	blt _0803C32E
_0803C2A0:
	ldr r0, _0803C338  @ gUnknown_0202E4D4
	movs r1, #0
	ldrsh r0, [r0, r1]
	subs r5, r0, #1
	subs r0, r6, #1
	mov sl, r0
	cmp r5, #0
	blt _0803C328
	lsls r7, r6, #2
_0803C2B2:
	ldr r0, _0803C33C  @ gUnknown_0202E4E0
	ldr r0, [r0]
	adds r0, r7, r0
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _0803C322
	ldr r0, _0803C340  @ gUnknown_0202E4E4
	ldr r0, [r0]
	adds r0, r7, r0
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0803C322
	ldr r0, _0803C344  @ gUnknown_0202E4D8
	ldr r0, [r0]
	adds r0, r7, r0
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r1, [r0]
	cmp r1, #0
	beq _0803C2EE
	ldr r0, _0803C348  @ gUnknown_0202BE44
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
	ldr r0, _0803C34C  @ gUnknown_0202E4F0
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
_0803C338: .4byte gUnknown_0202E4D4
_0803C33C: .4byte gUnknown_0202E4E0
_0803C340: .4byte gUnknown_0202E4E4
_0803C344: .4byte gUnknown_0202E4D8
_0803C348: .4byte gUnknown_0202BE44
_0803C34C: .4byte gUnknown_0202E4F0
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
	bl GetUnitStruct
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

	THUMB_FUNC_START sub_803C3B0
sub_803C3B0: @ 0x0803C3B0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	movs r7, #0
	ldr r0, _0803C43C  @ gUnknown_0202E4D4
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r1, r0, #1
	cmp r1, #0
	blt _0803C430
_0803C3C4:
	ldr r0, _0803C43C  @ gUnknown_0202E4D4
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r4, r0, #1
	subs r0, r1, #1
	mov r8, r0
	cmp r4, #0
	blt _0803C42A
	lsls r5, r1, #2
_0803C3D6:
	ldr r0, _0803C440  @ gUnknown_0202E4E4
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0803C424
	ldr r6, _0803C444  @ gUnknown_0202E4D8
	ldr r0, [r6]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r1, r0, r4
	ldrb r0, [r1]
	cmp r0, #0
	beq _0803C424
	ldr r0, _0803C448  @ gUnknown_0202BE44
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
	bl GetUnitStruct
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
_0803C43C: .4byte gUnknown_0202E4D4
_0803C440: .4byte gUnknown_0202E4E4
_0803C444: .4byte gUnknown_0202E4D8
_0803C448: .4byte gUnknown_0202BE44

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
	bl CanUnitUseAsStaff
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

	THUMB_FUNC_START sub_803C490
sub_803C490: @ 0x0803C490
	push {lr}
	adds r2, r0, #0
	ldr r0, _0803C4AC  @ gUnknown_0203AA04
	adds r0, #0x7b
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0803C4B0
	adds r0, r2, #0
	movs r1, #0
	bl FillMovementMapForUnitAndMovement
	b _0803C4B6
	.align 2, 0
_0803C4AC: .4byte gUnknown_0203AA04
_0803C4B0:
	adds r0, r2, #0
	bl FillMovementMapForUnit
_0803C4B6:
	pop {r0}
	bx r0

.align 2, 0
