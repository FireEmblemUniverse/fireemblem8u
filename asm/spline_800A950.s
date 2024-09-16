	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

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

	.align 2, 0
