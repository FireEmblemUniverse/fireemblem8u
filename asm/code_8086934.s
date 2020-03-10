	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	@ I don't know, so graphical effect stuff probably

	THUMB_FUNC_START sub_8086934
sub_8086934: @ 0x08086934
	push {r4, r5, lr}
	adds r3, r0, r2
	movs r5, #4
	strb r5, [r3]
	adds r3, r1, r2
	adds r3, r0, r3
	strb r5, [r3]
	lsls r4, r1, #1
	adds r3, r4, r2
	adds r3, r0, r3
	strb r5, [r3]
	adds r4, r4, r1
	adds r4, r4, r2
	adds r4, r0, r4
	strb r5, [r4]
	lsls r1, r1, #2
	adds r1, r1, r2
	adds r0, r0, r1
	strb r5, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8086934

	THUMB_FUNC_START sub_8086960
sub_8086960: @ 0x08086960
	push {r4, r5, lr}
	adds r3, r0, r2
	movs r5, #4
	strb r5, [r3]
	adds r3, r1, r2
	adds r3, r0, r3
	strb r5, [r3]
	lsls r4, r1, #1
	adds r3, r4, r2
	adds r3, r0, r3
	strb r5, [r3]
	adds r4, r4, r1
	adds r4, r4, r2
	adds r0, r0, r4
	strb r5, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8086960

	THUMB_FUNC_START sub_8086984
sub_8086984: @ 0x08086984
	push {r4, r5, lr}
	adds r3, r1, r2
	adds r3, r0, r3
	movs r5, #4
	strb r5, [r3]
	lsls r4, r1, #1
	adds r3, r4, r2
	adds r3, r0, r3
	strb r5, [r3]
	adds r4, r4, r1
	adds r4, r4, r2
	adds r4, r0, r4
	strb r5, [r4]
	lsls r1, r1, #2
	adds r1, r1, r2
	adds r0, r0, r1
	strb r5, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8086984

	THUMB_FUNC_START sub_80869AC
sub_80869AC: @ 0x080869AC
	push {r4, r5, lr}
	adds r3, r0, r2
	movs r5, #4
	strb r5, [r3]
	adds r3, r1, r2
	adds r3, r0, r3
	strb r5, [r3]
	lsls r4, r1, #1
	adds r3, r4, r2
	adds r3, r0, r3
	strb r5, [r3]
	adds r4, r4, r1
	adds r4, r4, r2
	adds r4, r0, r4
	strb r5, [r4]
	lsls r1, r1, #2
	adds r1, r1, r2
	adds r0, r0, r1
	strb r5, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80869AC

	THUMB_FUNC_START sub_80869D8
sub_80869D8: @ 0x080869D8
	push {r4, r5, r6, lr}
	adds r3, r0, r2
	movs r6, #4
	strb r6, [r3]
	adds r3, r1, r2
	adds r3, r0, r3
	movs r4, #0xe
	strb r4, [r3]
	lsls r3, r1, #1
	adds r4, r3, r2
	adds r4, r0, r4
	movs r5, #3
	strb r5, [r4]
	adds r3, r3, r1
	adds r3, r3, r2
	adds r3, r0, r3
	strb r6, [r3]
	lsls r1, r1, #2
	adds r1, r1, r2
	adds r0, r0, r1
	strb r6, [r0]
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80869D8

	THUMB_FUNC_START sub_8086A08
sub_8086A08: @ 0x08086A08
	push {r4, lr}
	adds r3, r1, r2
	adds r3, r0, r3
	movs r4, #1
	strb r4, [r3]
	lsls r1, r1, #1
	adds r1, r1, r2
	adds r0, r0, r1
	movs r1, #5
	strb r1, [r0]
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8086A08

	THUMB_FUNC_START sub_8086A24
sub_8086A24: @ 0x08086A24
	push {r4, lr}
	adds r3, r1, r2
	adds r3, r0, r3
	movs r4, #0xd
	strb r4, [r3]
	lsls r1, r1, #1
	adds r1, r1, r2
	adds r0, r0, r1
	movs r1, #0xc
	strb r1, [r0]
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8086A24

	THUMB_FUNC_START sub_8086A40
sub_8086A40: @ 0x08086A40
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	str r0, [sp, #4]
	mov r8, r1
	mov r9, r2
	mov sl, r3
	ldr r7, _08086B24  @ gUnknown_02020188
	movs r0, #0
	str r0, [sp]
	lsls r2, r2, #4
	ldr r0, _08086B28  @ 0x001FFFFF
	ands r2, r0
	movs r0, #0x80
	lsls r0, r0, #0x11
	orrs r2, r0
	mov r0, sp
	adds r1, r7, #0
	bl CpuFastSet
	movs r4, #1
	mov r0, sl
	adds r0, #1
	cmp r4, r0
	bge _08086A90
	mov r6, r8
	adds r6, #1
	adds r5, r0, #0
_08086A7E:
	adds r2, r4, r6
	adds r0, r7, #0
	mov r3, r9
	lsls r1, r3, #3
	bl sub_80869D8
	adds r4, #1
	cmp r4, r5
	blt _08086A7E
_08086A90:
	mov r0, r9
	lsls r5, r0, #3
	mov r2, r8
	adds r2, #1
	adds r0, r7, #0
	adds r1, r5, #0
	bl sub_8086960
	mov r4, r8
	add r4, sl
	adds r2, r4, #2
	adds r0, r7, #0
	adds r1, r5, #0
	bl sub_80869AC
	adds r4, #3
	adds r0, r7, #0
	adds r1, r5, #0
	adds r2, r4, #0
	bl sub_8086984
	movs r4, #0
	adds r6, r5, #0
	ldr r1, [sp, #4]
	lsls r1, r1, #5
	mov sl, r1
	ldr r3, [sp, #0x28]
	cmp r4, r3
	bge _08086AE0
	mov r5, r8
	adds r5, #2
_08086ACE:
	adds r2, r4, r5
	adds r0, r7, #0
	adds r1, r6, #0
	bl sub_8086A08
	adds r4, #1
	ldr r0, [sp, #0x28]
	cmp r4, r0
	blt _08086ACE
_08086AE0:
	ldr r1, [sp, #0x2c]
	cmp r1, #0
	ble _08086B02
	mov r0, r8
	adds r0, #2
	ldr r3, [sp, #0x28]
	adds r5, r3, r0
	adds r4, r1, #0
_08086AF0:
	adds r0, r7, #0
	adds r1, r6, #0
	adds r2, r5, #0
	bl sub_8086A24
	adds r5, #1
	subs r4, #1
	cmp r4, #0
	bne _08086AF0
_08086B02:
	movs r1, #0xc0
	lsls r1, r1, #0x13
	add r1, sl
	adds r0, r7, #0
	mov r2, r9
	movs r3, #1
	bl sub_8013058
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08086B24: .4byte gUnknown_02020188
_08086B28: .4byte 0x001FFFFF

	THUMB_FUNC_END sub_8086A40

	THUMB_FUNC_START sub_8086B2C
sub_8086B2C: @ 0x08086B2C
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #8
	adds r5, r0, #0
	adds r6, r1, #0
	mov r8, r2
	adds r4, r3, #0
	ldr r3, [sp, #0x1c]
	ldr r0, [sp, #0x20]
	ldr r1, [sp, #0x24]
	str r0, [sp]
	str r1, [sp, #4]
	adds r0, r5, #0
	movs r1, #2
	adds r2, r6, #0
	bl sub_8086A40
	ldr r0, _08086B70  @ 0x000003FF
	ands r0, r5
	adds r4, r4, r0
	mov r0, r8
	adds r1, r4, #0
	adds r2, r6, #0
	movs r3, #1
	bl sub_8013104
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08086B70: .4byte 0x000003FF

	THUMB_FUNC_END sub_8086B2C

.align 2, 0
