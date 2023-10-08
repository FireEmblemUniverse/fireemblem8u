	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	THUMB_FUNC_START sub_80C689C
sub_80C689C: @ 0x080C689C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	ldr r4, [sp, #0x28]
	mov r9, r4
	ldr r4, [sp, #0x2c]
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r5, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	mov r8, r2
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	str r3, [sp]
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	mov sl, r4
	adds r0, r3, #0
	bl BG_GetMapBuffer
	adds r7, r0, #0
	lsls r0, r5, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0
	bne _080C68DE
	subs r0, #8
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
_080C68DE:
	lsls r0, r6, #0x10
	asrs r0, r0, #0x10
	mov r2, r8
	lsls r1, r2, #0x10
	asrs r1, r1, #0x10
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	lsls r0, r5, #0x10
	asrs r0, r0, #0x10
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	mov r4, r9
	cmp r4, #0
	beq _080C6906
	movs r1, #0x80
	lsls r1, r1, #2
	adds r0, r1, #0
	b _080C690C
_080C6906:
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r2, #0
_080C690C:
	lsls r1, r6, #0x10
	asrs r1, r1, #0x10
	subs r1, r0, r1
	lsls r1, r1, #0x10
	lsrs r6, r1, #0x10
	lsls r1, r5, #0x10
	asrs r1, r1, #0x10
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	lsls r0, r5, #0x10
	asrs r0, r0, #0x13
	subs r4, r0, #1
	lsls r1, r6, #0x10
	asrs r0, r1, #0x13
	subs r0, #1
	adds r5, r1, #0
	cmp r4, r0
	ble _080C6994
	movs r6, #0x1f
	mov r1, sl
	lsls r0, r1, #0x18
	asrs r0, r0, #0x18
	mov r8, r0
_080C693C:
	cmp r4, #0x3f
	bhi _080C694A
	cmp r4, #0x1f
	ble _080C6958
	mov r2, r9
	cmp r2, #0
	bne _080C6958
_080C694A:
	adds r0, r4, #0
	ands r0, r6
	lsls r0, r0, #1
	adds r0, r7, r0
	bl ClearFirstPalDirectly
	b _080C698A
_080C6958:
	mov r0, r9
	cmp r4, #0x1f
	bgt _080C6960
	ldr r0, [sp, #0x24]
_080C6960:
	cmp r0, #0
	beq _080C6994
	mov r1, r8
	cmp r1, #0
	bne _080C697A
	adds r1, r4, #0
	ands r1, r6
	lsls r1, r1, #1
	adds r0, r0, r1
	adds r1, r7, r1
	bl CopyFirstPalDirectly
	b _080C698A
_080C697A:
	adds r1, r4, #0
	ands r1, r6
	lsls r1, r1, #1
	adds r0, r0, r1
	adds r1, r7, r1
	movs r2, #0xf
	bl SetFirstPalDirectly
_080C698A:
	subs r4, #1
	asrs r0, r5, #0x13
	subs r0, #1
	cmp r4, r0
	bgt _080C693C
_080C6994:
	lsrs r1, r5, #0x10
	ldr r0, [sp]
	movs r2, #0
	bl BG_SetPosition
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80C689C

	THUMB_FUNC_START sub_80C69B0
sub_80C69B0: @ 0x080C69B0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r4, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov r8, r1
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	str r2, [sp]
	movs r0, #0x1f
	mov ip, r0
	movs r5, #0x1f
	movs r0, #0x10
	subs r6, r0, r2
	movs r1, #0xf
	mov r9, r1
	mov r0, r8
	ands r0, r5
	adds r7, r0, #0
	muls r7, r2, r7
	mov sl, r7
_080C69E2:
	ldrh r1, [r4]
	adds r0, r5, #0
	ands r0, r1
	adds r3, r0, #0
	muls r3, r6, r3
	add r3, sl
	asrs r3, r3, #4
	lsls r1, r1, #0x10
	lsrs r0, r1, #0x15
	mov r2, ip
	ands r0, r2
	adds r2, r0, #0
	muls r2, r6, r2
	mov r7, r8
	lsrs r0, r7, #5
	mov r7, ip
	ands r0, r7
	ldr r7, [sp]
	muls r0, r7, r0
	adds r2, r2, r0
	asrs r2, r2, #4
	lsrs r1, r1, #0x1a
	mov r0, ip
	ands r1, r0
	muls r1, r6, r1
	mov r7, r8
	lsrs r0, r7, #0xa
	mov r7, ip
	ands r0, r7
	ldr r7, [sp]
	muls r0, r7, r0
	adds r1, r1, r0
	asrs r1, r1, #4
	ands r1, r5
	lsls r1, r1, #0xa
	ands r2, r5
	lsls r2, r2, #5
	orrs r1, r2
	ands r3, r5
	orrs r3, r1
	strh r3, [r4]
	adds r4, #2
	movs r0, #1
	negs r0, r0
	add r9, r0
	mov r1, r9
	cmp r1, #0
	bge _080C69E2
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80C69B0

.align 2, 0
