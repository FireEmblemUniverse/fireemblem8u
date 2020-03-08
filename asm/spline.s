	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	THUMB_FUNC_START sub_800A42C
sub_800A42C: @ 0x0800A42C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r7, r0, #0
	adds r5, r1, #0
	adds r4, r2, #0
	adds r6, r5, r4
	cmp r6, #0
	beq _0800A4DE
	movs r0, #0x80
	lsls r0, r0, #5
	mov r8, r0
	cmp r6, r8
	ble _0800A45C
	lsls r1, r5, #0xc
	adds r0, r6, #0
	bl DivArm
	adds r5, r0, #0
	lsls r1, r4, #0xc
	adds r0, r6, #0
	bl DivArm
	adds r4, r0, #0
_0800A45C:
	movs r0, #0x80
	lsls r0, r0, #6
	subs r0, r0, r4
	subs r0, r0, r5
	movs r1, #0x80
	lsls r1, r1, #0x11
	bl DivArm
	adds r6, r0, #0
	cmp r7, r5
	bge _0800A496
	cmp r5, #0
	bne _0800A478
	movs r5, #1
_0800A478:
	lsls r1, r6, #0xc
	adds r0, r5, #0
	bl DivArm
	adds r1, r0, #0
	muls r1, r7, r1
	mov r0, r8
	bl DivArm
	adds r1, r0, #0
	muls r1, r7, r1
	mov r0, r8
	bl DivArm
	b _0800A4DE
_0800A496:
	mov r1, r8
	subs r0, r1, r4
	cmp r7, r0
	bge _0800A4B4
	lsls r1, r7, #0xd
	mov r0, r8
	bl DivArm
	subs r0, r0, r5
	adds r1, r6, #0
	muls r1, r0, r1
	mov r0, r8
	bl DivArm
	b _0800A4DE
_0800A4B4:
	mov r0, r8
	subs r7, r0, r7
	cmp r4, #0
	bne _0800A4BE
	movs r4, #1
_0800A4BE:
	lsls r1, r6, #0xc
	adds r0, r4, #0
	bl DivArm
	adds r1, r0, #0
	muls r1, r7, r1
	mov r0, r8
	bl DivArm
	adds r1, r0, #0
	muls r1, r7, r1
	mov r0, r8
	bl DivArm
	mov r1, r8
	subs r0, r1, r0
_0800A4DE:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_800A42C

	THUMB_FUNC_START sub_800A4E8
sub_800A4E8: @ 0x0800A4E8
	ldrh r2, [r0]
	strh r2, [r1]
	ldrh r2, [r0, #2]
	strh r2, [r1, #4]
	ldr r2, [r0, #4]
	str r2, [r1, #0xc]
	ldr r2, [r0, #8]
	str r2, [r1, #0x18]
	adds r0, #0xc
	ldrh r2, [r0, #2]
	strh r2, [r1, #2]
	ldr r2, [r0, #4]
	str r2, [r1, #8]
	ldr r2, [r0, #8]
	str r2, [r1, #0x14]
	adds r0, #0xc
	ldrh r2, [r0, #2]
	strh r2, [r1, #6]
	ldr r2, [r0, #4]
	str r2, [r1, #0x10]
	ldr r0, [r0, #8]
	str r0, [r1, #0x1c]
	bx lr

	THUMB_FUNC_END sub_800A4E8

	THUMB_FUNC_START sub_800A518
sub_800A518: @ 0x0800A518
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x20
	str r1, [sp]
	str r2, [sp, #4]
	movs r2, #0
	ldrsh r1, [r0, r2]
	str r1, [sp, #0x14]
	ldr r1, [r0, #0x14]
	movs r4, #2
	ldrsh r5, [r0, r4]
	movs r7, #4
	ldrsh r3, [r0, r7]
	movs r4, #6
	ldrsh r2, [r0, r4]
	ldr r7, [r0, #8]
	str r7, [sp, #0x18]
	ldr r4, [r0, #0xc]
	str r4, [sp, #0x1c]
	ldr r0, [r0, #0x10]
	mov r9, r0
	movs r7, #0
	ldrsh r0, [r1, r7]
	movs r6, #0x80
	lsls r6, r6, #5
	subs r4, r6, r0
	movs r7, #2
	ldrsh r0, [r1, r7]
	mov r8, r0
	movs r0, #4
	ldrsh r7, [r1, r0]
	cmp r2, r5
	beq _0800A564
	cmp r2, r3
	bne _0800A56A
_0800A564:
	movs r1, #0
	str r1, [sp, #0x10]
	b _0800A580
_0800A56A:
	subs r0, r2, r3
	subs r1, r5, r3
	lsls r1, r1, #0xc
	bl DivArm
	adds r1, r0, #0
	lsls r1, r1, #0xd
	adds r0, r6, #0
	bl DivArm
	str r0, [sp, #0x10]
_0800A580:
	adds r5, r7, #0
	cmp r7, #0
	bge _0800A588
	negs r5, r7
_0800A588:
	movs r6, #0x80
	lsls r6, r6, #5
	ldr r2, [sp, #0x10]
	adds r1, r5, #0
	muls r1, r2, r1
	adds r0, r6, #0
	bl DivArm
	ldr r2, [sp, #0x10]
	adds r1, r2, r5
	subs r1, r1, r0
	str r1, [sp, #0x10]
	subs r0, r6, r7
	adds r1, r4, #0
	muls r1, r0, r1
	adds r0, r6, #0
	bl DivArm
	mov r2, r8
	adds r1, r2, r6
	muls r1, r0, r1
	adds r0, r6, #0
	bl DivArm
	adds r1, r0, #0
	lsls r1, r1, #0xb
	adds r0, r6, #0
	bl DivArm
	str r0, [sp, #8]
	adds r0, r7, r6
	adds r1, r4, #0
	muls r1, r0, r1
	adds r0, r6, #0
	bl DivArm
	mov r4, r8
	subs r1, r6, r4
	muls r1, r0, r1
	adds r0, r6, #0
	bl DivArm
	adds r1, r0, #0
	lsls r1, r1, #0xb
	adds r0, r6, #0
	bl DivArm
	str r0, [sp, #0xc]
	ldr r7, [sp, #0x14]
	cmp r7, #0
	ble _0800A66E
	mov sl, r9
	ldr r0, [sp, #0x1c]
	mov r9, r0
	ldr r7, [sp, #0x18]
	ldr r1, [sp, #0x14]
	mov r8, r1
_0800A5FA:
	ldr r1, [r7]
	mov r2, r9
	ldr r0, [r2]
	subs r6, r1, r0
	mov r0, sl
	ldr r4, [r0]
	subs r4, r4, r1
	ldr r2, [sp, #8]
	adds r1, r2, #0
	muls r1, r6, r1
	movs r0, #0x80
	lsls r0, r0, #5
	bl DivArm
	adds r5, r0, #0
	ldr r0, [sp, #0xc]
	adds r1, r0, #0
	muls r1, r4, r1
	movs r0, #0x80
	lsls r0, r0, #5
	bl DivArm
	adds r5, r5, r0
	ldr r2, [sp, #0x10]
	adds r1, r2, #0
	muls r1, r5, r1
	movs r0, #0x80
	lsls r0, r0, #5
	bl DivArm
	ldr r4, [sp]
	str r0, [r4]
	ldr r0, [sp, #4]
	cmp r0, #2
	bne _0800A654
	ldr r1, [sp, #8]
	ldr r2, [sp, #0xc]
	adds r0, r1, r2
	adds r1, r0, #0
	muls r1, r6, r1
	movs r0, #0x80
	lsls r0, r0, #5
	bl DivArm
	str r0, [r4]
_0800A654:
	ldr r4, [sp]
	adds r4, #4
	str r4, [sp]
	movs r0, #4
	add sl, r0
	add r9, r0
	adds r7, #4
	movs r1, #1
	negs r1, r1
	add r8, r1
	mov r2, r8
	cmp r2, #0
	bne _0800A5FA
_0800A66E:
	add sp, #0x20
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_800A518

	THUMB_FUNC_START sub_800A680
sub_800A680: @ 0x0800A680
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x1c
	mov sl, r1
	str r2, [sp]
	movs r2, #0
	ldrsh r1, [r0, r2]
	str r1, [sp, #0x10]
	ldr r1, [r0, #0x14]
	movs r3, #2
	ldrsh r4, [r0, r3]
	movs r5, #4
	ldrsh r3, [r0, r5]
	movs r6, #6
	ldrsh r2, [r0, r6]
	ldr r5, [r0, #8]
	str r5, [sp, #0x14]
	ldr r6, [r0, #0xc]
	str r6, [sp, #0x18]
	ldr r0, [r0, #0x10]
	mov r9, r0
	movs r5, #0
	ldrsh r0, [r1, r5]
	movs r5, #0x80
	lsls r5, r5, #5
	subs r7, r5, r0
	movs r0, #2
	ldrsh r6, [r1, r0]
	mov r8, r6
	movs r0, #4
	ldrsh r6, [r1, r0]
	cmp r2, r4
	beq _0800A6CC
	cmp r2, r3
	bne _0800A6D2
_0800A6CC:
	movs r1, #0
	str r1, [sp, #0xc]
	b _0800A6E8
_0800A6D2:
	subs r0, r2, r3
	subs r1, r2, r4
	lsls r1, r1, #0xc
	bl DivArm
	adds r1, r0, #0
	lsls r1, r1, #0xd
	adds r0, r5, #0
	bl DivArm
	str r0, [sp, #0xc]
_0800A6E8:
	adds r4, r6, #0
	cmp r6, #0
	bge _0800A6F0
	negs r4, r6
_0800A6F0:
	movs r5, #0x80
	lsls r5, r5, #5
	ldr r2, [sp, #0xc]
	adds r1, r4, #0
	muls r1, r2, r1
	adds r0, r5, #0
	bl DivArm
	ldr r3, [sp, #0xc]
	adds r1, r3, r4
	subs r1, r1, r0
	str r1, [sp, #0xc]
	adds r0, r6, r5
	adds r1, r7, #0
	muls r1, r0, r1
	adds r0, r5, #0
	bl DivArm
	mov r2, r8
	adds r1, r2, r5
	muls r1, r0, r1
	adds r0, r5, #0
	bl DivArm
	adds r1, r0, #0
	lsls r1, r1, #0xb
	adds r0, r5, #0
	bl DivArm
	str r0, [sp, #4]
	subs r0, r5, r6
	adds r1, r7, #0
	muls r1, r0, r1
	adds r0, r5, #0
	bl DivArm
	mov r3, r8
	subs r1, r5, r3
	muls r1, r0, r1
	adds r0, r5, #0
	bl DivArm
	adds r1, r0, #0
	lsls r1, r1, #0xb
	adds r0, r5, #0
	bl DivArm
	str r0, [sp, #8]
	ldr r6, [sp, #0x10]
	cmp r6, #0
	ble _0800A7C8
	ldr r0, [sp, #0x18]
	mov r8, r0
	ldr r6, [sp, #0x14]
	ldr r7, [sp, #0x10]
_0800A75E:
	ldr r2, [r6]
	mov r3, r8
	ldr r1, [r3]
	subs r1, r2, r1
	mov r5, r9
	ldr r0, [r5]
	subs r5, r0, r2
	ldr r0, [sp, #4]
	muls r1, r0, r1
	movs r0, #0x80
	lsls r0, r0, #5
	bl DivArm
	adds r4, r0, #0
	ldr r2, [sp, #8]
	adds r1, r2, #0
	muls r1, r5, r1
	movs r0, #0x80
	lsls r0, r0, #5
	bl DivArm
	adds r4, r4, r0
	ldr r3, [sp, #0xc]
	adds r1, r3, #0
	muls r1, r4, r1
	movs r0, #0x80
	lsls r0, r0, #5
	bl DivArm
	mov r1, sl
	str r0, [r1]
	ldr r2, [sp]
	cmp r2, #1
	bne _0800A7B8
	ldr r3, [sp, #4]
	ldr r1, [sp, #8]
	adds r0, r3, r1
	adds r1, r0, #0
	muls r1, r5, r1
	movs r0, #0x80
	lsls r0, r0, #5
	bl DivArm
	mov r2, sl
	str r0, [r2]
_0800A7B8:
	movs r3, #4
	add sl, r3
	add r9, r3
	add r8, r3
	adds r6, #4
	subs r7, #1
	cmp r7, #0
	bne _0800A75E
_0800A7C8:
	add sp, #0x1c
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_800A680

	THUMB_FUNC_START sub_800A7D8
sub_800A7D8: @ 0x0800A7D8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x50
	adds r4, r0, #0
	adds r7, r1, #0
	adds r6, r2, #0
	movs r1, #0
	ldrsh r0, [r4, r1]
	str r0, [sp, #0x44]
	ldr r0, [r4, #0x10]
	mov r8, r0
	ldr r1, [r4, #0x1c]
	mov r9, r1
	adds r0, r4, #0
	mov r1, sp
	bl sub_800A4E8
	add r5, sp, #0x34
	mov r0, sp
	adds r1, r5, #0
	adds r2, r6, #0
	bl sub_800A680
	adds r4, #0xc
	adds r0, r4, #0
	mov r1, sp
	bl sub_800A4E8
	add r4, sp, #0x24
	mov r0, sp
	adds r1, r4, #0
	adds r2, r6, #0
	bl sub_800A518
	mov sl, r8
	str r5, [sp, #0x48]
	str r4, [sp, #0x4c]
	ldr r0, [sp, #0x44]
	cmp r0, #0
	ble _0800A8C6
	movs r6, #0x80
	lsls r6, r6, #5
	mov r8, r0
_0800A834:
	mov r0, sl
	ldr r1, [r0]
	lsls r1, r1, #0xd
	adds r0, r6, #0
	bl DivArm
	adds r4, r0, #0
	mov r0, r9
	ldr r1, [r0]
	lsls r1, r1, #0xd
	adds r0, r6, #0
	bl DivArm
	subs r4, r4, r0
	ldr r1, [sp, #0x48]
	ldr r0, [r1]
	adds r4, r4, r0
	ldr r1, [sp, #0x4c]
	ldr r0, [r1]
	adds r4, r4, r0
	str r4, [r7]
	mov r1, sl
	ldr r0, [r1]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #0xc
	negs r1, r1
	adds r0, r6, #0
	bl DivArm
	adds r4, r0, #0
	mov r1, r9
	adds r1, #4
	mov r9, r1
	subs r1, #4
	ldm r1!, {r0}
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #0xc
	adds r0, r6, #0
	bl DivArm
	adds r5, r0, #0
	ldr r0, [sp, #0x48]
	ldr r1, [r0]
	lsls r1, r1, #0xd
	adds r0, r6, #0
	bl DivArm
	adds r4, r4, r5
	subs r4, r4, r0
	ldr r1, [sp, #0x4c]
	ldm r1!, {r0}
	str r1, [sp, #0x4c]
	subs r4, r4, r0
	str r4, [r7, #4]
	ldr r1, [sp, #0x48]
	ldm r1!, {r0}
	str r1, [sp, #0x48]
	str r0, [r7, #8]
	mov r1, sl
	adds r1, #4
	mov sl, r1
	subs r1, #4
	ldm r1!, {r0}
	str r0, [r7, #0xc]
	adds r7, #0x10
	movs r0, #1
	negs r0, r0
	add r8, r0
	mov r1, r8
	cmp r1, #0
	bne _0800A834
_0800A8C6:
	add sp, #0x50
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_800A7D8

	THUMB_FUNC_START sub_800A8D8
sub_800A8D8: @ 0x0800A8D8
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r6, r2, #0
	adds r7, r3, #0
	lsls r1, r1, #0x10
	lsrs r2, r1, #0x10
	movs r1, #0
	ldrsh r0, [r5, r1]
	lsls r4, r0, #0xc
	ldr r1, [r6]
	cmp r1, r4
	bge _0800A8FC
	movs r0, #0
	str r0, [r7]
	str r4, [r6]
	movs r0, #2
	negs r0, r0
	b _0800A948
_0800A8FC:
	lsls r0, r2, #0x10
	asrs r3, r0, #0x10
	lsls r0, r3, #1
	adds r0, r0, r5
	subs r0, #2
	movs r2, #0
	ldrsh r0, [r0, r2]
	lsls r2, r0, #0xc
	cmp r1, r2
	ble _0800A91C
	subs r0, r3, #1
	str r0, [r7]
	str r2, [r6]
	movs r0, #2
	negs r0, r0
	b _0800A948
_0800A91C:
	movs r3, #0
	cmp r4, r1
	bgt _0800A928
	movs r4, #2
	ldrsh r0, [r5, r4]
	b _0800A93E
_0800A928:
	adds r3, #1
	lsls r0, r3, #1
	adds r2, r0, r5
	movs r1, #0
	ldrsh r0, [r2, r1]
	lsls r0, r0, #0xc
	ldr r1, [r6]
	cmp r0, r1
	bgt _0800A928
	movs r4, #2
	ldrsh r0, [r2, r4]
_0800A93E:
	lsls r0, r0, #0xc
	cmp r0, r1
	blt _0800A928
	str r3, [r7]
	movs r0, #0
_0800A948:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_800A8D8

	THUMB_FUNC_START sub_800A950
sub_800A950: @ 0x0800A950
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xb4
	str r0, [sp, #0xac]
	str r2, [sp, #0x88]
	movs r2, #0
	ldrsh r0, [r0, r2]
	str r0, [sp, #0x8c]
	ldr r3, [sp, #0xac]
	ldr r3, [r3, #4]
	mov r9, r3
	ldr r7, [sp, #0xac]
	ldr r7, [r7, #8]
	str r7, [sp, #0x90]
	ldr r0, [sp, #0xac]
	ldr r0, [r0, #0xc]
	mov r8, r0
	add r0, sp, #0x80
	str r1, [r0]
	cmp r1, #0
	bne _0800A986
	movs r1, #0
	str r1, [sp, #0x94]
	b _0800A990
_0800A986:
	ldr r2, [sp, #0xac]
	movs r3, #2
	ldrsh r0, [r2, r3]
	subs r0, #1
	str r0, [sp, #0x94]
_0800A990:
	mov r7, sp
	adds r7, #0x10
	str r7, [sp, #0xa8]
	ldr r1, [sp, #0xac]
	ldrh r0, [r1, #2]
	add r2, sp, #0x34
	add r1, sp, #0xc
_0800A99E:
	str r2, [r1]
	subs r2, #0xc
	subs r1, #4
	cmp r1, sp
	bge _0800A99E
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _0800A9B4
	movs r0, #1
	negs r0, r0
	b _0800AB48
_0800A9B4:
	ldr r2, [sp, #0xac]
	movs r3, #2
	ldrsh r1, [r2, r3]
	add r4, sp, #0x84
	mov r0, r9
	add r2, sp, #0x80
	adds r3, r4, #0
	bl sub_800A8D8
	ldr r1, [r4]
	cmp r1, #0
	bne _0800A9D2
	movs r7, #1
	str r7, [sp, #0x98]
	b _0800A9E6
_0800A9D2:
	ldr r2, [sp, #0xac]
	movs r3, #2
	ldrsh r0, [r2, r3]
	subs r0, #1
	movs r7, #0
	str r7, [sp, #0x98]
	cmp r1, r0
	bne _0800A9E6
	movs r0, #2
	str r0, [sp, #0x98]
_0800A9E6:
	ldr r1, [sp, #0xac]
	ldr r0, [r1, #0x10]
	ldr r4, _0800AA44  @ gUnknown_08591AB4
	cmp r0, #0
	beq _0800A9F2
	adds r4, r0, #0
_0800A9F2:
	movs r6, #0
	ldr r2, [sp, #0xac]
	ldrh r2, [r2]
	add r3, sp, #0xa4
	strh r2, [r3]
	mov r7, sp
	adds r7, #0x40
	str r7, [sp, #0xa0]
	add r0, sp, #0x84
	mov sl, r0
	add r3, sp, #0x18
	add r2, sp, #0x14
	ldr r5, [sp, #0xa8]
	adds r5, #2
	ldr r1, [sp, #0xa8]
	mov ip, r1
	ldr r0, [sp, #0x94]
	ldr r1, [sp, #0x8c]
	adds r7, r0, #0
	muls r7, r1, r7
	lsls r0, r7, #2
	ldr r7, [sp, #0x90]
	adds r0, r7, r0
	str r0, [sp, #0x9c]
_0800AA22:
	add r0, sp, #0xa4
	ldrh r1, [r0]
	mov r0, ip
	strh r1, [r0]
	mov r1, sl
	ldr r0, [r1]
	adds r0, r0, r6
	subs r1, r0, #1
	cmp r1, #0
	bgt _0800AA48
	mov r7, r9
	ldrh r0, [r7]
	strh r0, [r5]
	ldr r0, [sp, #0x90]
	str r0, [r2]
	b _0800AAA0
	.align 2, 0
_0800AA44: .4byte gUnknown_08591AB4
_0800AA48:
	ldr r7, [sp, #0x94]
	cmp r1, r7
	blt _0800AA66
	lsls r1, r7, #1
	mov r0, r9
	adds r0, r1, r0
	ldrh r0, [r0]
	strh r0, [r5]
	ldr r7, [sp, #0x9c]
	str r7, [r2]
	mov r0, r8
	cmp r0, #0
	beq _0800AAA0
	add r1, r8
	b _0800AA90
_0800AA66:
	lsls r0, r0, #1
	add r0, r9
	subs r0, #2
	ldrh r0, [r0]
	strh r0, [r5]
	mov r1, sl
	ldr r0, [r1]
	adds r1, r0, r6
	subs r0, r1, #1
	ldr r7, [sp, #0x8c]
	muls r0, r7, r0
	lsls r0, r0, #2
	ldr r7, [sp, #0x90]
	adds r0, r7, r0
	str r0, [r2]
	mov r0, r8
	cmp r0, #0
	beq _0800AAA0
	lsls r0, r1, #1
	add r0, r8
	subs r1, r0, #2
_0800AA90:
	movs r7, #0
	ldrsh r1, [r1, r7]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r4, r0
	str r0, [r3]
	b _0800AAA2
_0800AAA0:
	str r4, [r3]
_0800AAA2:
	adds r3, #0xc
	adds r2, #0xc
	adds r5, #0xc
	movs r0, #0xc
	add ip, r0
	adds r6, #1
	cmp r6, #3
	ble _0800AA22
	ldr r0, [sp]
	ldr r1, [sp, #0xa0]
	ldr r2, [sp, #0x98]
	bl sub_800A7D8
	ldr r2, [sp, #0xac]
	movs r3, #2
	ldrsh r1, [r2, r3]
	ldr r2, [sp, #0x84]
	adds r0, r2, #1
	cmp r1, r0
	ble _0800AAE6
	lsls r1, r2, #1
	add r1, r9
	movs r7, #2
	ldrsh r0, [r1, r7]
	movs r3, #0
	ldrsh r2, [r1, r3]
	subs r0, r0, r2
	lsls r2, r2, #0xc
	ldr r1, [sp, #0x80]
	subs r1, r1, r2
	bl DivArm
	adds r5, r0, #0
	b _0800AAF4
_0800AAE6:
	lsls r0, r2, #1
	add r0, r9
	movs r7, #0
	ldrsh r0, [r0, r7]
	lsls r0, r0, #0xc
	ldr r1, [sp, #0x80]
	subs r5, r1, r0
_0800AAF4:
	ldr r4, [sp, #0xa0]
	movs r6, #0
	ldr r0, [sp, #0x8c]
	cmp r6, r0
	bcs _0800AB46
	movs r7, #0x80
	lsls r7, r7, #5
	ldr r1, [sp, #0x88]
	mov r8, r1
_0800AB06:
	ldr r0, [r4]
	adds r1, r5, #0
	muls r1, r0, r1
	adds r0, r7, #0
	bl DivArm
	ldr r1, [r4, #4]
	adds r0, r0, r1
	adds r1, r5, #0
	muls r1, r0, r1
	adds r0, r7, #0
	bl DivArm
	ldr r1, [r4, #8]
	adds r0, r0, r1
	adds r1, r5, #0
	muls r1, r0, r1
	adds r0, r7, #0
	bl DivArm
	ldr r1, [r4, #0xc]
	adds r0, r0, r1
	mov r2, r8
	adds r2, #4
	mov r8, r2
	subs r2, #4
	stm r2!, {r0}
	adds r4, #0x10
	adds r6, #1
	ldr r3, [sp, #0x8c]
	cmp r6, r3
	bcc _0800AB06
_0800AB46:
	ldr r0, [sp, #0x84]
_0800AB48:
	add sp, #0xb4
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_800A950

	THUMB_FUNC_START sub_800AB58
sub_800AB58: @ 0x0800AB58
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x1c
	adds r6, r1, #0
	ldr r1, [r0]
	str r1, [sp]
	ldr r2, [r0, #4]
	str r2, [sp, #4]
	ldr r3, [r0, #8]
	str r3, [sp, #8]
	ldr r0, [r0, #0xc]
	mov r9, r0
	adds r0, r1, #0
	adds r1, r0, #0
	muls r1, r0, r1
	movs r0, #0x80
	lsls r0, r0, #5
	bl DivArm
	adds r4, r0, #0
	ldr r2, [sp, #4]
	adds r1, r2, #0
	muls r1, r2, r1
	movs r0, #0x80
	lsls r0, r0, #5
	bl DivArm
	mov sl, r0
	ldr r3, [sp, #8]
	adds r1, r3, #0
	muls r1, r3, r1
	movs r0, #0x80
	lsls r0, r0, #5
	bl DivArm
	mov r8, r0
	mov r0, r9
	mov r1, r9
	muls r1, r0, r1
	movs r0, #0x80
	lsls r0, r0, #5
	bl DivArm
	add r4, sl
	add r4, r8
	adds r4, r4, r0
	movs r1, #0x80
	lsls r1, r1, #0x12
	adds r0, r4, #0
	bl DivArm
	adds r4, r0, #0
	ldr r2, [sp]
	adds r1, r2, #0
	muls r1, r4, r1
	movs r0, #0x80
	lsls r0, r0, #5
	bl DivArm
	mov r8, r0
	ldr r3, [sp, #4]
	adds r1, r3, #0
	muls r1, r4, r1
	movs r0, #0x80
	lsls r0, r0, #5
	bl DivArm
	adds r5, r0, #0
	ldr r0, [sp, #8]
	adds r1, r0, #0
	muls r1, r4, r1
	movs r0, #0x80
	lsls r0, r0, #5
	bl DivArm
	adds r7, r0, #0
	mov r2, r8
	mov r1, r9
	muls r1, r2, r1
	movs r0, #0x80
	lsls r0, r0, #5
	bl DivArm
	str r0, [sp, #0xc]
	mov r1, r9
	muls r1, r5, r1
	movs r0, #0x80
	lsls r0, r0, #5
	bl DivArm
	str r0, [sp, #0x10]
	mov r1, r9
	muls r1, r7, r1
	movs r0, #0x80
	lsls r0, r0, #5
	bl DivArm
	str r0, [sp, #0x14]
	ldr r3, [sp]
	mov r1, r8
	muls r1, r3, r1
	movs r0, #0x80
	lsls r0, r0, #5
	bl DivArm
	mov sl, r0
	ldr r0, [sp]
	adds r1, r0, #0
	muls r1, r5, r1
	movs r0, #0x80
	lsls r0, r0, #5
	bl DivArm
	mov r8, r0
	ldr r2, [sp]
	adds r1, r2, #0
	muls r1, r7, r1
	movs r0, #0x80
	lsls r0, r0, #5
	bl DivArm
	mov r9, r0
	ldr r3, [sp, #4]
	adds r1, r3, #0
	muls r1, r5, r1
	movs r0, #0x80
	lsls r0, r0, #5
	bl DivArm
	str r0, [sp, #0x18]
	ldr r0, [sp, #4]
	adds r1, r0, #0
	muls r1, r7, r1
	movs r0, #0x80
	lsls r0, r0, #5
	bl DivArm
	adds r4, r0, #0
	ldr r2, [sp, #8]
	adds r1, r2, #0
	muls r1, r7, r1
	movs r0, #0x80
	lsls r0, r0, #5
	bl DivArm
	ldr r3, [sp, #0x18]
	adds r1, r3, r0
	movs r2, #0x80
	lsls r2, r2, #5
	subs r1, r2, r1
	str r1, [r6]
	ldr r1, [sp, #0x14]
	add r1, r8
	str r1, [r6, #4]
	mov r3, r9
	ldr r2, [sp, #0x10]
	subs r1, r3, r2
	str r1, [r6, #8]
	mov r3, r8
	ldr r1, [sp, #0x14]
	subs r3, r3, r1
	str r3, [r6, #0x10]
	add r0, sl
	movs r2, #0x80
	lsls r2, r2, #5
	subs r0, r2, r0
	str r0, [r6, #0x14]
	ldr r3, [sp, #0xc]
	adds r0, r4, r3
	str r0, [r6, #0x18]
	ldr r0, [sp, #0x10]
	add r9, r0
	mov r1, r9
	str r1, [r6, #0x20]
	subs r4, r4, r3
	str r4, [r6, #0x24]
	ldr r2, [sp, #0x18]
	add sl, r2
	mov r0, sl
	movs r3, #0x80
	lsls r3, r3, #5
	subs r0, r3, r0
	str r0, [r6, #0x28]
	movs r0, #0
	str r0, [r6, #0x38]
	str r0, [r6, #0x34]
	str r0, [r6, #0x30]
	str r0, [r6, #0x2c]
	str r0, [r6, #0x1c]
	str r0, [r6, #0xc]
	str r3, [r6, #0x3c]
	add sp, #0x1c
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_800AB58

	THUMB_FUNC_START sub_800ACEC
sub_800ACEC: @ 0x0800ACEC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x1c
	mov r8, r1
	ldr r1, [r0]
	str r1, [sp]
	ldr r2, [r0, #4]
	str r2, [sp, #4]
	ldr r3, [r0, #8]
	str r3, [sp, #8]
	ldr r0, [r0, #0xc]
	mov r9, r0
	adds r0, r1, #0
	adds r1, r0, #0
	muls r1, r0, r1
	movs r0, #0x80
	lsls r0, r0, #5
	bl DivArm
	adds r4, r0, #0
	ldr r2, [sp, #4]
	adds r1, r2, #0
	muls r1, r2, r1
	movs r0, #0x80
	lsls r0, r0, #5
	bl DivArm
	mov sl, r0
	ldr r3, [sp, #8]
	adds r1, r3, #0
	muls r1, r3, r1
	movs r0, #0x80
	lsls r0, r0, #5
	bl DivArm
	adds r6, r0, #0
	mov r0, r9
	mov r1, r9
	muls r1, r0, r1
	movs r0, #0x80
	lsls r0, r0, #5
	bl DivArm
	add r4, sl
	adds r4, r4, r6
	adds r4, r4, r0
	movs r1, #0x80
	lsls r1, r1, #0x12
	adds r0, r4, #0
	bl DivArm
	adds r4, r0, #0
	ldr r2, [sp]
	adds r1, r2, #0
	muls r1, r4, r1
	movs r0, #0x80
	lsls r0, r0, #5
	bl DivArm
	adds r6, r0, #0
	ldr r3, [sp, #4]
	adds r1, r3, #0
	muls r1, r4, r1
	movs r0, #0x80
	lsls r0, r0, #5
	bl DivArm
	adds r5, r0, #0
	ldr r0, [sp, #8]
	adds r1, r0, #0
	muls r1, r4, r1
	movs r0, #0x80
	lsls r0, r0, #5
	bl DivArm
	adds r7, r0, #0
	mov r1, r9
	muls r1, r6, r1
	movs r0, #0x80
	lsls r0, r0, #5
	bl DivArm
	str r0, [sp, #0xc]
	mov r1, r9
	muls r1, r5, r1
	movs r0, #0x80
	lsls r0, r0, #5
	bl DivArm
	str r0, [sp, #0x10]
	mov r1, r9
	muls r1, r7, r1
	movs r0, #0x80
	lsls r0, r0, #5
	bl DivArm
	str r0, [sp, #0x14]
	ldr r2, [sp]
	adds r1, r2, #0
	muls r1, r6, r1
	movs r0, #0x80
	lsls r0, r0, #5
	bl DivArm
	mov sl, r0
	ldr r3, [sp]
	adds r1, r3, #0
	muls r1, r5, r1
	movs r0, #0x80
	lsls r0, r0, #5
	bl DivArm
	adds r6, r0, #0
	ldr r0, [sp]
	adds r1, r0, #0
	muls r1, r7, r1
	movs r0, #0x80
	lsls r0, r0, #5
	bl DivArm
	mov r9, r0
	ldr r2, [sp, #4]
	adds r1, r2, #0
	muls r1, r5, r1
	movs r0, #0x80
	lsls r0, r0, #5
	bl DivArm
	str r0, [sp, #0x18]
	ldr r3, [sp, #4]
	adds r1, r3, #0
	muls r1, r7, r1
	movs r0, #0x80
	lsls r0, r0, #5
	bl DivArm
	adds r4, r0, #0
	ldr r0, [sp, #8]
	adds r1, r0, #0
	muls r1, r7, r1
	movs r0, #0x80
	lsls r0, r0, #5
	bl DivArm
	ldr r2, [sp, #0x18]
	adds r1, r2, r0
	movs r3, #0x80
	lsls r3, r3, #5
	subs r1, r3, r1
	mov r2, r8
	str r1, [r2]
	ldr r3, [sp, #0x14]
	adds r1, r6, r3
	str r1, [r2, #4]
	mov r2, r9
	ldr r3, [sp, #0x10]
	subs r1, r2, r3
	mov r2, r8
	str r1, [r2, #8]
	ldr r3, [sp, #0x14]
	subs r6, r6, r3
	str r6, [r2, #0xc]
	add r0, sl
	movs r1, #0x80
	lsls r1, r1, #5
	subs r0, r1, r0
	str r0, [r2, #0x10]
	ldr r2, [sp, #0xc]
	adds r0, r4, r2
	mov r3, r8
	str r0, [r3, #0x14]
	ldr r0, [sp, #0x10]
	add r9, r0
	mov r1, r9
	str r1, [r3, #0x18]
	subs r4, r4, r2
	str r4, [r3, #0x1c]
	ldr r2, [sp, #0x18]
	add sl, r2
	mov r0, sl
	movs r3, #0x80
	lsls r3, r3, #5
	subs r0, r3, r0
	mov r1, r8
	str r0, [r1, #0x20]
	str r3, [r1, #0x2c]
	str r3, [r1, #0x28]
	str r3, [r1, #0x24]
	add sp, #0x1c
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_800ACEC

	THUMB_FUNC_START sub_800AE7C
sub_800AE7C: @ 0x0800AE7C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	adds r4, r0, #0
	mov sl, r1
	adds r6, r2, #0
	adds r7, r3, #0
	ldr r0, [r4]
	mov r8, r0
	movs r0, #4
	mov r1, r8
	ands r0, r1
	cmp r0, #0
	beq _0800AED4
	mov r1, sp
	ldrh r0, [r4, #8]
	movs r2, #0
	mov r9, r2
	strh r0, [r1, #2]
	movs r0, #3
	strh r0, [r1]
	ldr r0, [r4, #0xc]
	str r0, [sp, #4]
	ldr r0, [r4, #0x10]
	str r0, [sp, #8]
	ldr r0, [r4, #0x14]
	str r0, [sp, #0xc]
	ldr r0, [r4, #0x18]
	str r0, [sp, #0x10]
	mov r0, sp
	mov r1, sl
	adds r2, r6, #0
	bl sub_800A950
	adds r5, r0, #0
	cmp r5, #0
	bge _0800AED4
	mov r0, r9
	str r0, [r6, #8]
	str r0, [r6, #4]
	str r0, [r6]
_0800AED4:
	movs r0, #8
	mov r1, r8
	ands r0, r1
	cmp r0, #0
	beq _0800AF14
	mov r1, sp
	ldrh r0, [r4, #0x1c]
	movs r6, #0
	strh r0, [r1, #2]
	movs r0, #4
	strh r0, [r1]
	ldr r0, [r4, #0x20]
	str r0, [sp, #4]
	ldr r0, [r4, #0x24]
	str r0, [sp, #8]
	ldr r0, [r4, #0x28]
	str r0, [sp, #0xc]
	ldr r0, [r4, #0x2c]
	str r0, [sp, #0x10]
	mov r0, sp
	mov r1, sl
	adds r2, r7, #0
	bl sub_800A950
	adds r5, r0, #0
	cmp r5, #0
	bge _0800AF14
	str r6, [r7, #8]
	str r6, [r7, #4]
	str r6, [r7]
	movs r0, #1
	str r0, [r7, #0xc]
_0800AF14:
	movs r0, #0x10
	mov r2, r8
	ands r2, r0
	cmp r2, #0
	beq _0800AF52
	mov r1, sp
	ldrh r0, [r4, #0x30]
	movs r6, #0
	strh r0, [r1, #2]
	movs r0, #3
	strh r0, [r1]
	ldr r0, [r4, #0x34]
	str r0, [sp, #4]
	ldr r0, [r4, #0x38]
	str r0, [sp, #8]
	ldr r0, [r4, #0x3c]
	str r0, [sp, #0xc]
	ldr r0, [r4, #0x40]
	str r0, [sp, #0x10]
	mov r0, sp
	mov r1, sl
	ldr r2, [sp, #0x34]
	bl sub_800A950
	adds r5, r0, #0
	cmp r5, #0
	bge _0800AF52
	ldr r0, [sp, #0x34]
	str r6, [r0, #8]
	str r6, [r0, #4]
	str r6, [r0]
_0800AF52:
	adds r0, r5, #0
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_800AE7C

	THUMB_FUNC_START sub_800AF64
sub_800AF64: @ 0x0800AF64
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xb0
	adds r7, r0, #0
	str r2, [sp, #0x88]
	movs r2, #0
	ldrsh r0, [r7, r2]
	str r0, [sp, #0x8c]
	ldr r3, [r7, #4]
	mov r9, r3
	ldr r4, [r7, #8]
	str r4, [sp, #0x90]
	ldr r0, [r7, #0xc]
	mov r8, r0
	ldr r2, [r7, #0x10]
	mov sl, r2
	add r0, sp, #0x80
	str r1, [r0]
	cmp r1, #0
	bne _0800AF98
	movs r3, #0
	str r3, [sp, #0x94]
	b _0800AFA0
_0800AF98:
	movs r4, #2
	ldrsh r0, [r7, r4]
	subs r0, #1
	str r0, [sp, #0x94]
_0800AFA0:
	mov r0, sp
	adds r0, #0x10
	str r0, [sp, #0xa4]
	ldrh r0, [r7, #2]
	add r2, sp, #0x34
	add r1, sp, #0xc
_0800AFAC:
	str r2, [r1]
	subs r2, #0xc
	subs r1, #4
	cmp r1, sp
	bge _0800AFAC
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _0800AFC2
	movs r0, #1
	negs r0, r0
	b _0800B15A
_0800AFC2:
	movs r2, #2
	ldrsh r1, [r7, r2]
	add r4, sp, #0x84
	mov r0, r9
	add r2, sp, #0x80
	adds r3, r4, #0
	bl sub_800A8D8
	ldr r1, [r4]
	cmp r1, #0
	bne _0800AFDC
	movs r3, #1
	b _0800AFEC
_0800AFDC:
	movs r4, #2
	ldrsh r0, [r7, r4]
	subs r0, #1
	movs r2, #0
	str r2, [sp, #0x98]
	cmp r1, r0
	bne _0800AFEE
	movs r3, #2
_0800AFEC:
	str r3, [sp, #0x98]
_0800AFEE:
	movs r6, #0
	ldrh r4, [r7]
	add r0, sp, #0xa8
	strh r4, [r0]
	mov r1, sp
	adds r1, #0x40
	str r1, [sp, #0xa0]
	add r2, sp, #0x18
	mov ip, r6
	add r5, sp, #0x14
	mov r3, sp
	adds r3, #0x84
	str r3, [sp, #0xac]
	ldr r4, [sp, #0x94]
	lsls r0, r4, #2
	ldr r1, [sp, #0x90]
	adds r0, r0, r1
	str r0, [sp, #0x9c]
_0800B012:
	ldr r3, [sp, #0xa4]
	add r3, ip
	add r4, sp, #0xa8
	ldrh r4, [r4]
	strh r4, [r3]
	ldr r1, [sp, #0xac]
	ldr r0, [r1]
	adds r0, r0, r6
	subs r1, r0, #1
	cmp r1, #0
	bgt _0800B048
	mov r4, r9
	ldrh r0, [r4]
	strh r0, [r3, #2]
	ldr r1, [sp, #0x90]
	ldr r0, [r1]
	str r0, [r5]
	mov r3, sl
	ldr r0, [r3]
	cmp r0, #0
	bne _0800B0AC
	ldr r4, _0800B044  @ gUnknown_08591AB4
	str r4, [r2]
	b _0800B0B4
	.align 2, 0
_0800B044: .4byte gUnknown_08591AB4
_0800B048:
	ldr r4, [sp, #0x94]
	cmp r1, r4
	blt _0800B076
	lsls r1, r4, #1
	mov r4, r9
	adds r0, r1, r4
	ldrh r0, [r0]
	strh r0, [r3, #2]
	ldr r3, [sp, #0x9c]
	ldr r0, [r3]
	str r0, [r5]
	mov r4, r8
	cmp r4, #0
	beq _0800B0B0
	adds r0, r1, r4
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r0, r0, #2
	add r0, sl
	ldr r0, [r0]
	cmp r0, #0
	bne _0800B0AC
	b _0800B0B0
_0800B076:
	lsls r0, r0, #1
	add r0, r9
	subs r0, #2
	ldrh r0, [r0]
	strh r0, [r3, #2]
	ldr r4, [sp, #0xac]
	ldr r0, [r4]
	adds r1, r0, r6
	lsls r0, r1, #2
	ldr r3, [sp, #0x90]
	adds r0, r0, r3
	subs r0, #4
	ldr r0, [r0]
	str r0, [r5]
	mov r4, r8
	cmp r4, #0
	beq _0800B0B0
	lsls r0, r1, #1
	add r0, r8
	subs r0, #2
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r0, r0, #2
	add r0, sl
	ldr r0, [r0]
	cmp r0, #0
	beq _0800B0B0
_0800B0AC:
	str r0, [r2]
	b _0800B0B4
_0800B0B0:
	ldr r3, _0800B0F4  @ gUnknown_08591AB4
	str r3, [r2]
_0800B0B4:
	adds r2, #0xc
	movs r4, #0xc
	add ip, r4
	adds r5, #0xc
	adds r6, #1
	cmp r6, #3
	ble _0800B012
	ldr r0, [sp]
	ldr r1, [sp, #0xa0]
	ldr r2, [sp, #0x98]
	bl sub_800A7D8
	movs r0, #2
	ldrsh r1, [r7, r0]
	ldr r2, [sp, #0x84]
	adds r0, r2, #1
	cmp r1, r0
	ble _0800B0F8
	lsls r1, r2, #1
	add r1, r9
	movs r2, #2
	ldrsh r0, [r1, r2]
	movs r3, #0
	ldrsh r2, [r1, r3]
	subs r0, r0, r2
	lsls r2, r2, #0xc
	ldr r1, [sp, #0x80]
	subs r1, r1, r2
	bl DivArm
	adds r5, r0, #0
	b _0800B106
	.align 2, 0
_0800B0F4: .4byte gUnknown_08591AB4
_0800B0F8:
	lsls r0, r2, #1
	add r0, r9
	movs r4, #0
	ldrsh r0, [r0, r4]
	lsls r0, r0, #0xc
	ldr r1, [sp, #0x80]
	subs r5, r1, r0
_0800B106:
	ldr r4, [sp, #0xa0]
	movs r6, #0
	ldr r0, [sp, #0x8c]
	cmp r6, r0
	bcs _0800B158
	movs r7, #0x80
	lsls r7, r7, #5
	ldr r1, [sp, #0x88]
	mov r8, r1
_0800B118:
	ldr r0, [r4]
	adds r1, r5, #0
	muls r1, r0, r1
	adds r0, r7, #0
	bl DivArm
	ldr r1, [r4, #4]
	adds r0, r0, r1
	adds r1, r5, #0
	muls r1, r0, r1
	adds r0, r7, #0
	bl DivArm
	ldr r1, [r4, #8]
	adds r0, r0, r1
	adds r1, r5, #0
	muls r1, r0, r1
	adds r0, r7, #0
	bl DivArm
	ldr r1, [r4, #0xc]
	adds r0, r0, r1
	mov r2, r8
	adds r2, #4
	mov r8, r2
	subs r2, #4
	stm r2!, {r0}
	adds r4, #0x10
	adds r6, #1
	ldr r3, [sp, #0x8c]
	cmp r6, r3
	bcc _0800B118
_0800B158:
	ldr r0, [sp, #0x84]
_0800B15A:
	add sp, #0xb0
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_800AF64

	THUMB_FUNC_START sub_800B16C
sub_800B16C: @ 0x0800B16C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #4]
	cmp r0, #0
	beq _0800B180
	ldr r1, [r4]
	ldr r2, [r4, #0x10]
	bl sub_800AF64
	adds r1, r0, #0
_0800B180:
	ldr r0, [r4, #8]
	cmp r0, #0
	beq _0800B190
	ldr r1, [r4]
	ldr r2, [r4, #0x14]
	bl sub_800AF64
	adds r1, r0, #0
_0800B190:
	adds r0, r1, #0
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_800B16C

	THUMB_FUNC_START sub_800B198
sub_800B198: @ 0x0800B198
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x1c
	adds r6, r0, #0
	adds r7, r1, #0
	adds r5, r2, #0
	str r3, [sp, #0x14]
	ldr r0, [sp, #0x3c]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sl, r0
	ldr r0, [r6, #4]
	mov r8, r0
	movs r2, #0
	ldrsh r1, [r6, r2]
	mov r9, r1
	add r2, sp, #0x14
	add r3, sp, #0x18
	bl sub_800A8D8
	ldr r0, [r7, #4]
	mov r1, sl
	strh r1, [r0, #2]
	mov r0, r9
	subs r0, #1
	ldr r4, [sp, #0x18]
	cmp r4, r0
	bge _0800B2AC
	lsls r4, r4, #1
	add r4, r8
	movs r2, #0x80
	lsls r2, r2, #5
	mov r8, r2
	ldr r1, [sp, #0x14]
	mov r0, r8
	bl DivArm
	movs r2, #2
	ldrsh r1, [r4, r2]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r1, r0
	bne _0800B2AC
	ldr r4, [r7, #8]
	ldr r3, [sp, #0x18]
	lsls r2, r3, #1
	adds r1, r2, r3
	lsls r1, r1, #2
	ldr r0, [r6, #8]
	adds r0, r0, r1
	adds r0, #0xc
	str r0, [r4, #4]
	ldr r4, [r7, #0x10]
	ldr r0, [r6, #0xc]
	adds r2, r2, r0
	movs r5, #2
	ldrsh r0, [r2, r5]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, [r6, #0x10]
	adds r0, r0, r1
	str r0, [r4, #4]
	mov r0, r9
	subs r0, #2
	cmp r3, r0
	bge _0800B262
	ldr r1, [sp, #0x14]
	mov r0, r8
	bl DivArm
	ldr r1, [r7, #4]
	mov r8, r1
	ldr r3, [sp, #0x18]
	ldr r2, [r6, #4]
	lsls r4, r3, #1
	adds r2, r4, r2
	mov r5, sl
	lsls r1, r5, #0x10
	asrs r1, r1, #0x10
	ldrh r2, [r2, #4]
	adds r1, r1, r2
	subs r1, r1, r0
	mov r0, r8
	strh r1, [r0, #4]
	ldr r1, [r7, #8]
	adds r3, r4, r3
	lsls r3, r3, #2
	ldr r0, [r6, #8]
	adds r0, r0, r3
	adds r0, #0x18
	str r0, [r1, #8]
	ldr r2, [r7, #0x10]
	ldr r0, [r6, #0xc]
	adds r4, r4, r0
	movs r1, #4
	ldrsh r0, [r4, r1]
	b _0800B29E
_0800B262:
	ldr r1, [sp, #0x14]
	mov r0, r8
	bl DivArm
	ldr r2, [r7, #4]
	mov r8, r2
	ldr r3, [sp, #0x18]
	ldr r2, [r6, #4]
	lsls r4, r3, #1
	adds r2, r4, r2
	mov r5, sl
	lsls r1, r5, #0x10
	asrs r1, r1, #0x10
	ldrh r2, [r2, #2]
	adds r1, r1, r2
	subs r1, r1, r0
	mov r0, r8
	strh r1, [r0, #4]
	ldr r1, [r7, #8]
	adds r3, r4, r3
	lsls r3, r3, #2
	ldr r0, [r6, #8]
	adds r0, r0, r3
	adds r0, #0xc
	str r0, [r1, #8]
	ldr r2, [r7, #0x10]
	ldr r0, [r6, #0xc]
	adds r4, r4, r0
	movs r1, #2
	ldrsh r0, [r4, r1]
_0800B29E:
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, [r6, #0x10]
	adds r0, r0, r1
	str r0, [r2, #8]
	b _0800B376
_0800B2AC:
	mov r1, sp
	ldrh r0, [r6]
	movs r4, #0
	strh r0, [r1, #2]
	movs r0, #3
	strh r0, [r1]
	ldr r0, [r6, #4]
	str r0, [sp, #4]
	ldr r0, [r6, #8]
	str r0, [sp, #8]
	ldr r0, [r6, #0xc]
	str r0, [sp, #0xc]
	ldr r0, [r6, #0x10]
	str r0, [sp, #0x10]
	ldr r1, [sp, #0x14]
	mov r0, sp
	adds r2, r5, #0
	bl sub_800A950
	cmp r0, #0
	bge _0800B2DC
	str r4, [r5, #8]
	str r4, [r5, #4]
	str r4, [r5]
_0800B2DC:
	ldr r4, [r7, #8]
	str r5, [r4, #4]
	ldr r2, [r7, #0x10]
	mov r8, r2
	ldr r2, [sp, #0x18]
	ldr r1, [r6, #0xc]
	lsls r0, r2, #1
	adds r3, r0, r1
	movs r1, #0
	ldrsh r0, [r3, r1]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, [r6, #0x10]
	adds r0, r0, r1
	mov r1, r8
	str r0, [r1, #4]
	mov r0, r9
	subs r0, #1
	cmp r2, r0
	blt _0800B328
	ldr r1, [r7, #4]
	mov r2, sl
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	adds r0, #1
	strh r0, [r1, #4]
	str r5, [r4, #8]
	movs r5, #0
	ldrsh r0, [r3, r5]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, [r6, #0x10]
	adds r0, r0, r1
	mov r1, r8
	str r0, [r1, #8]
	b _0800B372
_0800B328:
	movs r0, #0x80
	lsls r0, r0, #5
	ldr r1, [sp, #0x14]
	bl DivArm
	ldr r2, [r7, #4]
	mov r8, r2
	ldr r3, [sp, #0x18]
	ldr r2, [r6, #4]
	lsls r4, r3, #1
	adds r2, r4, r2
	mov r5, sl
	lsls r1, r5, #0x10
	asrs r1, r1, #0x10
	ldrh r2, [r2, #2]
	adds r1, r1, r2
	subs r1, r1, r0
	mov r0, r8
	strh r1, [r0, #4]
	ldr r1, [r7, #8]
	adds r3, r4, r3
	lsls r3, r3, #2
	ldr r0, [r6, #8]
	adds r0, r0, r3
	adds r0, #0xc
	str r0, [r1, #8]
	ldr r2, [r7, #0x10]
	ldr r0, [r6, #0xc]
	adds r4, r4, r0
	movs r1, #2
	ldrsh r0, [r4, r1]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, [r6, #0x10]
	adds r0, r0, r1
	str r0, [r2, #8]
_0800B372:
	movs r0, #1
	b _0800B378
_0800B376:
	movs r0, #0
_0800B378:
	add sp, #0x1c
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_800B198

	THUMB_FUNC_START sub_800B388
sub_800B388: @ 0x0800B388
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x1c
	adds r6, r0, #0
	adds r7, r1, #0
	adds r5, r2, #0
	str r3, [sp, #0x14]
	ldr r0, [sp, #0x3c]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sl, r0
	ldr r0, [r6, #4]
	mov r8, r0
	movs r2, #0
	ldrsh r1, [r6, r2]
	mov r9, r1
	add r2, sp, #0x14
	add r3, sp, #0x18
	bl sub_800A8D8
	ldr r0, [r7, #4]
	mov r1, sl
	strh r1, [r0, #2]
	mov r0, r9
	subs r0, #1
	ldr r4, [sp, #0x18]
	cmp r4, r0
	bge _0800B496
	lsls r4, r4, #1
	add r4, r8
	movs r2, #0x80
	lsls r2, r2, #5
	mov r8, r2
	ldr r1, [sp, #0x14]
	mov r0, r8
	bl DivArm
	movs r2, #2
	ldrsh r1, [r4, r2]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r1, r0
	bne _0800B496
	ldr r3, [r7, #8]
	ldr r2, [sp, #0x18]
	lsls r1, r2, #4
	ldr r0, [r6, #8]
	adds r0, r0, r1
	adds r0, #0x10
	str r0, [r3, #4]
	ldr r3, [r7, #0x10]
	ldr r1, [r6, #0xc]
	lsls r0, r2, #1
	adds r0, r0, r1
	movs r5, #2
	ldrsh r0, [r0, r5]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, [r6, #0x10]
	adds r0, r0, r1
	str r0, [r3, #4]
	mov r0, r9
	subs r0, #2
	cmp r2, r0
	bge _0800B44E
	ldr r1, [sp, #0x14]
	mov r0, r8
	bl DivArm
	ldr r1, [r7, #4]
	mov r8, r1
	ldr r3, [sp, #0x18]
	ldr r2, [r6, #4]
	lsls r4, r3, #1
	adds r2, r4, r2
	mov r5, sl
	lsls r1, r5, #0x10
	asrs r1, r1, #0x10
	ldrh r2, [r2, #4]
	adds r1, r1, r2
	subs r1, r1, r0
	mov r0, r8
	strh r1, [r0, #4]
	ldr r1, [r7, #8]
	lsls r3, r3, #4
	ldr r0, [r6, #8]
	adds r0, r0, r3
	adds r0, #0x20
	str r0, [r1, #8]
	ldr r2, [r7, #0x10]
	ldr r0, [r6, #0xc]
	adds r4, r4, r0
	movs r1, #4
	ldrsh r0, [r4, r1]
	b _0800B488
_0800B44E:
	ldr r1, [sp, #0x14]
	mov r0, r8
	bl DivArm
	ldr r2, [r7, #4]
	mov r8, r2
	ldr r3, [sp, #0x18]
	ldr r2, [r6, #4]
	lsls r4, r3, #1
	adds r2, r4, r2
	mov r5, sl
	lsls r1, r5, #0x10
	asrs r1, r1, #0x10
	ldrh r2, [r2, #2]
	adds r1, r1, r2
	subs r1, r1, r0
	mov r0, r8
	strh r1, [r0, #4]
	ldr r1, [r7, #8]
	lsls r3, r3, #4
	ldr r0, [r6, #8]
	adds r0, r0, r3
	adds r0, #0x10
	str r0, [r1, #8]
	ldr r2, [r7, #0x10]
	ldr r0, [r6, #0xc]
	adds r4, r4, r0
	movs r1, #2
	ldrsh r0, [r4, r1]
_0800B488:
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, [r6, #0x10]
	adds r0, r0, r1
	str r0, [r2, #8]
	b _0800B562
_0800B496:
	mov r1, sp
	ldrh r0, [r6]
	movs r4, #0
	strh r0, [r1, #2]
	movs r0, #4
	strh r0, [r1]
	ldr r0, [r6, #4]
	str r0, [sp, #4]
	ldr r0, [r6, #8]
	str r0, [sp, #8]
	ldr r0, [r6, #0xc]
	str r0, [sp, #0xc]
	ldr r0, [r6, #0x10]
	str r0, [sp, #0x10]
	ldr r1, [sp, #0x14]
	mov r0, sp
	adds r2, r5, #0
	bl sub_800A950
	cmp r0, #0
	bge _0800B4CA
	str r4, [r5, #8]
	str r4, [r5, #4]
	str r4, [r5]
	movs r0, #1
	str r0, [r5, #0xc]
_0800B4CA:
	ldr r4, [r7, #8]
	str r5, [r4, #4]
	ldr r2, [r7, #0x10]
	mov r8, r2
	ldr r2, [sp, #0x18]
	ldr r1, [r6, #0xc]
	lsls r0, r2, #1
	adds r3, r0, r1
	movs r1, #0
	ldrsh r0, [r3, r1]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, [r6, #0x10]
	adds r0, r0, r1
	mov r1, r8
	str r0, [r1, #4]
	mov r0, r9
	subs r0, #1
	cmp r2, r0
	blt _0800B516
	ldr r1, [r7, #4]
	mov r2, sl
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	adds r0, #1
	strh r0, [r1, #4]
	str r5, [r4, #8]
	movs r5, #0
	ldrsh r0, [r3, r5]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, [r6, #0x10]
	adds r0, r0, r1
	mov r1, r8
	str r0, [r1, #8]
	b _0800B55E
_0800B516:
	movs r0, #0x80
	lsls r0, r0, #5
	ldr r1, [sp, #0x14]
	bl DivArm
	ldr r2, [r7, #4]
	mov r8, r2
	ldr r3, [sp, #0x18]
	ldr r2, [r6, #4]
	lsls r4, r3, #1
	adds r2, r4, r2
	mov r5, sl
	lsls r1, r5, #0x10
	asrs r1, r1, #0x10
	ldrh r2, [r2, #2]
	adds r1, r1, r2
	subs r1, r1, r0
	mov r0, r8
	strh r1, [r0, #4]
	ldr r1, [r7, #8]
	lsls r3, r3, #4
	ldr r0, [r6, #8]
	adds r0, r0, r3
	adds r0, #0x10
	str r0, [r1, #8]
	ldr r2, [r7, #0x10]
	ldr r0, [r6, #0xc]
	adds r4, r4, r0
	movs r1, #2
	ldrsh r0, [r4, r1]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, [r6, #0x10]
	adds r0, r0, r1
	str r0, [r2, #8]
_0800B55E:
	movs r0, #1
	b _0800B564
_0800B562:
	movs r0, #0
_0800B564:
	add sp, #0x1c
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_800B388

	THUMB_FUNC_START sub_800B574
sub_800B574: @ 0x0800B574
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x1c
	adds r6, r0, #0
	adds r7, r1, #0
	adds r5, r2, #0
	str r3, [sp, #0x14]
	ldr r0, [sp, #0x3c]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sl, r0
	ldr r0, [r6, #4]
	mov r8, r0
	movs r2, #0
	ldrsh r1, [r6, r2]
	mov r9, r1
	add r2, sp, #0x14
	add r3, sp, #0x18
	bl sub_800A8D8
	ldr r0, [r7, #4]
	mov r1, sl
	strh r1, [r0, #2]
	mov r0, r9
	subs r0, #1
	ldr r4, [sp, #0x18]
	cmp r4, r0
	bge _0800B688
	lsls r4, r4, #1
	add r4, r8
	movs r2, #0x80
	lsls r2, r2, #5
	mov r8, r2
	ldr r1, [sp, #0x14]
	mov r0, r8
	bl DivArm
	movs r2, #2
	ldrsh r1, [r4, r2]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r1, r0
	bne _0800B688
	ldr r4, [r7, #8]
	ldr r3, [sp, #0x18]
	lsls r2, r3, #1
	adds r1, r2, r3
	lsls r1, r1, #2
	ldr r0, [r6, #8]
	adds r0, r0, r1
	adds r0, #0xc
	str r0, [r4, #4]
	ldr r4, [r7, #0x10]
	ldr r0, [r6, #0xc]
	adds r2, r2, r0
	movs r5, #2
	ldrsh r0, [r2, r5]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, [r6, #0x10]
	adds r0, r0, r1
	str r0, [r4, #4]
	mov r0, r9
	subs r0, #2
	cmp r3, r0
	bge _0800B63E
	ldr r1, [sp, #0x14]
	mov r0, r8
	bl DivArm
	ldr r1, [r7, #4]
	mov r8, r1
	ldr r3, [sp, #0x18]
	ldr r2, [r6, #4]
	lsls r4, r3, #1
	adds r2, r4, r2
	mov r5, sl
	lsls r1, r5, #0x10
	asrs r1, r1, #0x10
	ldrh r2, [r2, #4]
	adds r1, r1, r2
	subs r1, r1, r0
	mov r0, r8
	strh r1, [r0, #4]
	ldr r1, [r7, #8]
	adds r3, r4, r3
	lsls r3, r3, #2
	ldr r0, [r6, #8]
	adds r0, r0, r3
	adds r0, #0x18
	str r0, [r1, #8]
	ldr r2, [r7, #0x10]
	ldr r0, [r6, #0xc]
	adds r4, r4, r0
	movs r1, #4
	ldrsh r0, [r4, r1]
	b _0800B67A
_0800B63E:
	ldr r1, [sp, #0x14]
	mov r0, r8
	bl DivArm
	ldr r2, [r7, #4]
	mov r8, r2
	ldr r3, [sp, #0x18]
	ldr r2, [r6, #4]
	lsls r4, r3, #1
	adds r2, r4, r2
	mov r5, sl
	lsls r1, r5, #0x10
	asrs r1, r1, #0x10
	ldrh r2, [r2, #2]
	adds r1, r1, r2
	subs r1, r1, r0
	mov r0, r8
	strh r1, [r0, #4]
	ldr r1, [r7, #8]
	adds r3, r4, r3
	lsls r3, r3, #2
	ldr r0, [r6, #8]
	adds r0, r0, r3
	adds r0, #0xc
	str r0, [r1, #8]
	ldr r2, [r7, #0x10]
	ldr r0, [r6, #0xc]
	adds r4, r4, r0
	movs r1, #2
	ldrsh r0, [r4, r1]
_0800B67A:
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, [r6, #0x10]
	adds r0, r0, r1
	str r0, [r2, #8]
	b _0800B752
_0800B688:
	mov r1, sp
	ldrh r0, [r6]
	movs r4, #0
	strh r0, [r1, #2]
	movs r0, #3
	strh r0, [r1]
	ldr r0, [r6, #4]
	str r0, [sp, #4]
	ldr r0, [r6, #8]
	str r0, [sp, #8]
	ldr r0, [r6, #0xc]
	str r0, [sp, #0xc]
	ldr r0, [r6, #0x10]
	str r0, [sp, #0x10]
	ldr r1, [sp, #0x14]
	mov r0, sp
	adds r2, r5, #0
	bl sub_800A950
	cmp r0, #0
	bge _0800B6B8
	str r4, [r5, #8]
	str r4, [r5, #4]
	str r4, [r5]
_0800B6B8:
	ldr r4, [r7, #8]
	str r5, [r4, #4]
	ldr r2, [r7, #0x10]
	mov r8, r2
	ldr r2, [sp, #0x18]
	ldr r1, [r6, #0xc]
	lsls r0, r2, #1
	adds r3, r0, r1
	movs r1, #0
	ldrsh r0, [r3, r1]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, [r6, #0x10]
	adds r0, r0, r1
	mov r1, r8
	str r0, [r1, #4]
	mov r0, r9
	subs r0, #1
	cmp r2, r0
	blt _0800B704
	ldr r1, [r7, #4]
	mov r2, sl
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	adds r0, #1
	strh r0, [r1, #4]
	str r5, [r4, #8]
	movs r5, #0
	ldrsh r0, [r3, r5]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, [r6, #0x10]
	adds r0, r0, r1
	mov r1, r8
	str r0, [r1, #8]
	b _0800B74E
_0800B704:
	movs r0, #0x80
	lsls r0, r0, #5
	ldr r1, [sp, #0x14]
	bl DivArm
	ldr r2, [r7, #4]
	mov r8, r2
	ldr r3, [sp, #0x18]
	ldr r2, [r6, #4]
	lsls r4, r3, #1
	adds r2, r4, r2
	mov r5, sl
	lsls r1, r5, #0x10
	asrs r1, r1, #0x10
	ldrh r2, [r2, #2]
	adds r1, r1, r2
	subs r1, r1, r0
	mov r0, r8
	strh r1, [r0, #4]
	ldr r1, [r7, #8]
	adds r3, r4, r3
	lsls r3, r3, #2
	ldr r0, [r6, #8]
	adds r0, r0, r3
	adds r0, #0xc
	str r0, [r1, #8]
	ldr r2, [r7, #0x10]
	ldr r0, [r6, #0xc]
	adds r4, r4, r0
	movs r1, #2
	ldrsh r0, [r4, r1]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, [r6, #0x10]
	adds r0, r0, r1
	str r0, [r2, #8]
_0800B74E:
	movs r0, #1
	b _0800B754
_0800B752:
	movs r0, #0
_0800B754:
	add sp, #0x1c
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_800B574

	THUMB_FUNC_START sub_800B764
sub_800B764: @ 0x0800B764
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r6, r0, #0
	adds r5, r1, #0
	lsls r2, r2, #0x10
	lsrs r7, r2, #0x10
	mov r9, r7
	ldr r4, [r6]
	ldr r0, [r5, #4]
	mov ip, r0
	ldr r0, [r5, #8]
	mov r8, r0
	movs r0, #4
	ands r0, r4
	cmp r0, #0
	beq _0800B7A8
	mov r0, ip
	ldr r1, [r0, #4]
	movs r0, #0
	strh r0, [r1]
	adds r0, r6, #0
	adds r0, #8
	ldr r2, [r5, #0x10]
	ldr r3, [r5]
	lsls r1, r7, #0x10
	asrs r1, r1, #0x10
	str r1, [sp]
	mov r1, ip
	bl sub_800B198
	adds r3, r0, #0
_0800B7A8:
	movs r0, #8
	ands r4, r0
	cmp r4, #0
	beq _0800B7D0
	mov r4, r8
	ldr r1, [r4, #4]
	movs r0, #0
	strh r0, [r1]
	adds r0, r6, #0
	adds r0, #0x1c
	ldr r2, [r5, #0x14]
	ldr r3, [r5]
	mov r4, r9
	lsls r1, r4, #0x10
	asrs r1, r1, #0x10
	str r1, [sp]
	mov r1, r8
	bl sub_800B388
	adds r3, r0, #0
_0800B7D0:
	adds r0, r3, #0
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_800B764

	THUMB_FUNC_START sub_800B7E0
sub_800B7E0: @ 0x0800B7E0
	push {r4, r5, r6, r7, lr}
	adds r5, r1, #0
	adds r6, r2, #0
	cmp r6, #0
	bne _0800B7F4
	lsls r1, r0, #0xc
	adds r0, r5, #0
	bl DivArm
	b _0800B846
_0800B7F4:
	lsls r4, r0, #0xc
	adds r0, r5, #0
	adds r1, r4, #0
	bl DivArm
	movs r7, #0x80
	lsls r7, r7, #5
	subs r0, r7, r0
	cmp r0, #0
	bge _0800B81C
	adds r0, r5, #0
	adds r1, r4, #0
	bl DivArm
	ldr r2, _0800B818  @ 0xFFFFF000
	adds r1, r0, r2
	b _0800B826
	.align 2, 0
_0800B818: .4byte 0xFFFFF000
_0800B81C:
	adds r0, r5, #0
	adds r1, r4, #0
	bl DivArm
	subs r1, r7, r0
_0800B826:
	adds r5, r1, #0
	cmp r6, #0
	ble _0800B840
	adds r4, r6, #0
_0800B82E:
	muls r1, r5, r1
	movs r0, #0x80
	lsls r0, r0, #5
	bl DivArm
	adds r1, r0, #0
	subs r4, #1
	cmp r4, #0
	bne _0800B82E
_0800B840:
	movs r0, #0x80
	lsls r0, r0, #5
	subs r0, r0, r1
_0800B846:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_800B7E0

	THUMB_FUNC_START sub_800B84C
sub_800B84C: @ 0x0800B84C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r7, r0, #0
	adds r3, r1, #0
	mov r8, r2
	cmp r2, #0
	bne _0800B866
	lsls r1, r7, #0xc
	adds r0, r3, #0
	bl DivArm
	b _0800B906
_0800B866:
	lsrs r0, r3, #0x1f
	adds r0, r3, r0
	asrs r6, r0, #1
	cmp r7, r6
	bge _0800B896
	lsls r4, r7, #0xc
	adds r0, r6, #0
	adds r1, r4, #0
	bl DivArm
	cmp r0, #0
	bge _0800B88A
	adds r0, r6, #0
	adds r1, r4, #0
	bl DivArm
	negs r1, r0
	b _0800B8CA
_0800B88A:
	adds r0, r6, #0
	adds r1, r4, #0
	bl DivArm
	adds r1, r0, #0
	b _0800B8CA
_0800B896:
	subs r0, r7, r6
	lsls r4, r0, #0xc
	adds r0, r6, #0
	adds r1, r4, #0
	bl DivArm
	movs r5, #0x80
	lsls r5, r5, #5
	subs r0, r5, r0
	cmp r0, #0
	bge _0800B8C0
	adds r0, r6, #0
	adds r1, r4, #0
	bl DivArm
	ldr r2, _0800B8BC  @ 0xFFFFF000
	adds r1, r0, r2
	b _0800B8CA
	.align 2, 0
_0800B8BC: .4byte 0xFFFFF000
_0800B8C0:
	adds r0, r6, #0
	adds r1, r4, #0
	bl DivArm
	subs r1, r5, r0
_0800B8CA:
	adds r5, r1, #0
	mov r0, r8
	cmp r0, #0
	ble _0800B8E6
	mov r4, r8
_0800B8D4:
	muls r1, r5, r1
	movs r0, #0x80
	lsls r0, r0, #5
	bl DivArm
	adds r1, r0, #0
	subs r4, #1
	cmp r4, #0
	bne _0800B8D4
_0800B8E6:
	cmp r7, r6
	bge _0800B8F2
	lsrs r0, r1, #0x1f
	adds r0, r1, r0
	asrs r1, r0, #1
	b _0800B904
_0800B8F2:
	movs r0, #0x80
	lsls r0, r0, #5
	subs r0, r0, r1
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	movs r2, #0x80
	lsls r2, r2, #4
	adds r1, r0, r2
_0800B904:
	adds r0, r1, #0
_0800B906:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	THUMB_FUNC_END sub_800B84C
