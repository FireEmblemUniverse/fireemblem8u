	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	THUMB_FUNC_START sub_80AC6AC
sub_80AC6AC: @ 0x080AC6AC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x20
	str r0, [sp]
	str r1, [sp, #4]
	mov r9, r2
	mov sl, r3
	ldr r3, [sp, #0x40]
	ldr r0, _080AC780  @ 0xFFFFFC00
	adds r0, r0, r3
	mov r8, r0
	mov r1, r8
	muls r1, r0, r1
	lsls r5, r3, #1
	movs r6, #0x80
	lsls r6, r6, #3
	adds r0, r5, r6
	muls r0, r1, r0
	asrs r1, r0, #0x1f
	adds r4, r3, #0
	muls r4, r3, r4
	movs r2, #0xc0
	lsls r2, r2, #4
	subs r2, r2, r5
	muls r4, r2, r4
	asrs r5, r4, #0x1f
	subs r6, r6, r3
	adds r2, r6, #0
	muls r2, r6, r2
	muls r2, r3, r2
	str r2, [sp, #0x18]
	asrs r2, r2, #0x1f
	str r2, [sp, #0x1c]
	mov r2, r8
	muls r2, r3, r2
	muls r2, r3, r2
	str r2, [sp, #8]
	asrs r2, r2, #0x1f
	str r2, [sp, #0xc]
	ldr r2, [sp, #4]
	asrs r3, r2, #0x1f
	bl __muldi3
	str r0, [sp, #0x10]
	str r1, [sp, #0x14]
	mov r2, r9
	asrs r3, r2, #0x1f
	adds r1, r5, #0
	adds r0, r4, #0
	bl __muldi3
	ldr r2, [sp, #0x10]
	ldr r3, [sp, #0x14]
	adds r2, r2, r0
	adcs r3, r1
	str r2, [sp, #0x10]
	str r3, [sp, #0x14]
	mov r3, r9
	ldr r6, [sp]
	subs r3, r3, r6
	mov r9, r3
	asrs r0, r3, #1
	adds r2, r0, #0
	mov r0, r9
	asrs r3, r0, #0x1f
	ldr r0, [sp, #0x18]
	ldr r1, [sp, #0x1c]
	bl __muldi3
	ldr r2, [sp, #0x10]
	ldr r3, [sp, #0x14]
	adds r2, r2, r0
	adcs r3, r1
	str r2, [sp, #0x10]
	str r3, [sp, #0x14]
	mov r3, sl
	ldr r6, [sp, #4]
	subs r3, r3, r6
	mov sl, r3
	asrs r0, r3, #1
	adds r2, r0, #0
	mov r0, sl
	asrs r3, r0, #0x1f
	ldr r0, [sp, #8]
	ldr r1, [sp, #0xc]
	bl __muldi3
	ldr r2, [sp, #0x10]
	ldr r3, [sp, #0x14]
	adds r0, r0, r2
	adcs r1, r3
	lsls r3, r1, #2
	lsrs r2, r0, #0x1e
	adds r0, r3, #0
	orrs r0, r2
	add sp, #0x20
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080AC780: .4byte 0xFFFFFC00

	THUMB_FUNC_END sub_80AC6AC

	THUMB_FUNC_START sub_80AC784
sub_80AC784: @ 0x080AC784
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x18
	mov sl, r0
	mov r9, r1
	adds r6, r2, #0
	mov r8, r3
	ldr r2, [sp, #0x38]
	lsls r3, r2, #1
	adds r3, r3, r2
	lsls r0, r3, #1
	adds r4, r2, #0
	muls r4, r0, r4
	lsls r5, r3, #0xb
	subs r0, r4, r5
	asrs r1, r0, #0x1f
	subs r4, r5, r4
	str r4, [sp]
	asrs r4, r4, #0x1f
	str r4, [sp, #4]
	muls r3, r2, r3
	lsls r4, r2, #0xc
	subs r4, r3, r4
	movs r5, #0x80
	lsls r5, r5, #0xd
	adds r4, r4, r5
	asrs r5, r4, #0x1f
	lsls r2, r2, #0xb
	subs r2, r3, r2
	str r2, [sp, #8]
	asrs r2, r2, #0x1f
	str r2, [sp, #0xc]
	mov r2, r9
	asrs r3, r2, #0x1f
	bl __muldi3
	str r0, [sp, #0x10]
	str r1, [sp, #0x14]
	adds r2, r6, #0
	asrs r3, r6, #0x1f
	ldr r0, [sp]
	ldr r1, [sp, #4]
	bl __muldi3
	ldr r2, [sp, #0x10]
	ldr r3, [sp, #0x14]
	adds r2, r2, r0
	adcs r3, r1
	str r2, [sp, #0x10]
	str r3, [sp, #0x14]
	mov r3, sl
	subs r6, r6, r3
	asrs r0, r6, #1
	adds r2, r0, #0
	asrs r3, r6, #0x1f
	adds r1, r5, #0
	adds r0, r4, #0
	bl __muldi3
	ldr r2, [sp, #0x10]
	ldr r3, [sp, #0x14]
	adds r2, r2, r0
	adcs r3, r1
	str r2, [sp, #0x10]
	str r3, [sp, #0x14]
	mov r3, r8
	mov r5, r9
	subs r3, r3, r5
	mov r8, r3
	asrs r0, r3, #1
	adds r2, r0, #0
	mov r7, r8
	asrs r3, r7, #0x1f
	ldr r0, [sp, #8]
	ldr r1, [sp, #0xc]
	bl __muldi3
	ldr r2, [sp, #0x10]
	ldr r3, [sp, #0x14]
	adds r0, r0, r2
	adcs r1, r3
	lsls r3, r1, #0xc
	lsrs r2, r0, #0x14
	adds r0, r3, #0
	orrs r0, r2
	add sp, #0x18
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80AC784

    .align 2, 0
