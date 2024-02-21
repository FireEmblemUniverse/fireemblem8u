	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	THUMB_FUNC_START sub_8014CA4
sub_8014CA4: @ 0x08014CA4
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r0, r1, #0
	adds r5, r2, #0
	adds r6, r3, #0
	lsls r4, r4, #0xc
	adds r1, r4, #0
	bl DivArm
	adds r1, r5, #0
	adds r2, r6, #0
	bl sub_800A42C
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8014CA4

	THUMB_FUNC_START sub_8014CC4
sub_8014CC4: @ 0x08014CC4
	push {r4, r5, r6, lr}
	ldr r0, _08014D24  @ 0x04000006
	ldrh r0, [r0]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0xe4
	bne _08014CD6
	movs r4, #0
_08014CD6:
	cmp r4, #0x9f
	bhi _08014D38
	ldr r5, _08014D28  @ gUnknown_03004990
	ldr r2, [r5]
	ldr r1, _08014D2C  @ 0x0000079D
	adds r0, r2, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _08014D9E
	ldr r3, _08014D30  @ 0x0000079C
	adds r0, r2, r3
	ldrb r1, [r0]
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #6
	adds r0, r2, r0
	movs r3, #0
	adds r6, r5, #0
	ldr r5, _08014D34  @ 0x0000078C
	lsls r1, r4, #1
	adds r2, r0, r1
	movs r4, #0xa0
	lsls r4, r4, #1
_08014D08:
	ldr r0, [r6]
	lsls r1, r3, #2
	adds r0, r0, r5
	adds r0, r0, r1
	ldr r1, [r0]
	cmp r1, #0
	beq _08014D1A
	ldrh r0, [r2]
	strh r0, [r1]
_08014D1A:
	adds r2, r2, r4
	adds r3, #1
	cmp r3, #2
	ble _08014D08
	b _08014D9E
	.align 2, 0
_08014D24: .4byte 0x04000006
_08014D28: .4byte gUnknown_03004990
_08014D2C: .4byte 0x0000079D
_08014D30: .4byte 0x0000079C
_08014D34: .4byte 0x0000078C
_08014D38:
	cmp r4, #0xa0
	bne _08014D9E
	ldr r4, _08014D84  @ gUnknown_03004990
	ldr r1, [r4]
	ldr r2, _08014D88  @ 0x0000079E
	adds r0, r1, r2
	movs r2, #0
	ldrsb r2, [r0, r2]
	cmp r2, #0
	beq _08014D98
	ldr r3, _08014D8C  @ 0x0000079D
	adds r1, r1, r3
	movs r0, #1
	strb r0, [r1]
	ldr r0, [r4]
	ldr r2, _08014D90  @ 0x0000079B
	adds r1, r0, r2
	ldrb r1, [r1]
	subs r3, #1
	adds r0, r0, r3
	strb r1, [r0]
	movs r3, #0
	adds r6, r4, #0
	ldr r5, _08014D94  @ 0x0000078C
	movs r4, #0xf0
	lsls r4, r4, #3
_08014D6C:
	ldr r0, [r6]
	lsls r2, r3, #2
	adds r1, r0, r5
	adds r1, r1, r2
	adds r0, r0, r4
	adds r0, r0, r2
	ldr r0, [r0]
	str r0, [r1]
	adds r3, #1
	cmp r3, #2
	ble _08014D6C
	b _08014D9E
	.align 2, 0
_08014D84: .4byte gUnknown_03004990
_08014D88: .4byte 0x0000079E
_08014D8C: .4byte 0x0000079D
_08014D90: .4byte 0x0000079B
_08014D94: .4byte 0x0000078C
_08014D98:
	ldr r3, _08014DA4  @ 0x0000079D
	adds r0, r1, r3
	strb r2, [r0]
_08014D9E:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08014DA4: .4byte 0x0000079D

	THUMB_FUNC_END sub_8014CC4

	THUMB_FUNC_START sub_8014DA8
sub_8014DA8: @ 0x08014DA8
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	ldr r1, _08014E24  @ gUnknown_03004990
	str r0, [r1]
	movs r3, #0
	adds r6, r1, #0
	adds r5, r6, #0
	movs r0, #0xf3
	lsls r0, r0, #3
	mov r8, r0
	movs r4, #0
	ldr r1, _08014E28  @ 0x0000078C
	mov ip, r1
	movs r2, #0xf0
	lsls r2, r2, #3
	mov r9, r2
_08014DCC:
	ldr r0, [r5]
	add r0, r8
	adds r0, r0, r3
	strb r4, [r0]
	ldr r0, [r5]
	lsls r2, r3, #2
	mov r7, ip
	adds r1, r0, r7
	adds r1, r1, r2
	add r0, r9
	adds r0, r0, r2
	str r4, [r0]
	str r4, [r1]
	adds r3, #1
	cmp r3, #2
	ble _08014DCC
	ldr r0, [r6]
	ldr r1, _08014E2C  @ 0x0000079B
	adds r2, r0, r1
	movs r1, #0
	strb r1, [r2]
	ldr r2, _08014E30  @ 0x0000079C
	adds r0, r0, r2
	strb r1, [r0]
	ldr r0, [r6]
	ldr r7, _08014E34  @ 0x0000079D
	adds r0, r0, r7
	strb r1, [r0]
	ldr r0, [r6]
	adds r2, #2
	adds r0, r0, r2
	strb r1, [r0]
	movs r0, #0
	bl SetPrimaryHBlankHandler
	ldr r0, _08014E38  @ sub_8014CC4
	bl SetPrimaryHBlankHandler
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08014E24: .4byte gUnknown_03004990
_08014E28: .4byte 0x0000078C
_08014E2C: .4byte 0x0000079B
_08014E30: .4byte 0x0000079C
_08014E34: .4byte 0x0000079D
_08014E38: .4byte sub_8014CC4

	THUMB_FUNC_END sub_8014DA8

	THUMB_FUNC_START sub_8014E3C
sub_8014E3C: @ 0x08014E3C
	push {r4, r5, lr}
	sub sp, #4
	movs r0, #0
	bl SetPrimaryHBlankHandler
	mov r0, sp
	movs r5, #0
	strh r5, [r0]
	ldr r4, _08014E68  @ gUnknown_03004990
	ldr r1, [r4]
	ldr r2, _08014E6C  @ 0x010003C0
	bl CpuSet
	ldr r0, [r4]
	ldr r1, _08014E70  @ 0x0000079E
	adds r0, r0, r1
	strb r5, [r0]
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08014E68: .4byte gUnknown_03004990
_08014E6C: .4byte 0x010003C0
_08014E70: .4byte 0x0000079E

	THUMB_FUNC_END sub_8014E3C

	THUMB_FUNC_START sub_8014E74
sub_8014E74: @ 0x08014E74
	push {r4, lr}
	adds r3, r0, #0
	ldr r0, _08014EA0  @ gUnknown_03004990
	ldr r0, [r0]
	ldr r4, _08014EA4  @ 0x0000079B
	adds r2, r0, r4
	ldrb r2, [r2]
	adds r2, r2, r1
	movs r1, #1
	ands r2, r1
	lsls r1, r2, #4
	subs r1, r1, r2
	lsls r1, r1, #6
	adds r0, r0, r1
	lsls r1, r3, #2
	adds r1, r1, r3
	lsls r1, r1, #6
	adds r0, r0, r1
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08014EA0: .4byte gUnknown_03004990
_08014EA4: .4byte 0x0000079B

	THUMB_FUNC_END sub_8014E74

	THUMB_FUNC_START sub_8014EA8
sub_8014EA8: @ 0x08014EA8
	ldr r0, _08014EBC  @ gUnknown_03004990
	ldr r1, [r0]
	ldr r0, _08014EC0  @ 0x0000079B
	adds r1, r1, r0
	ldrb r0, [r1]
	movs r2, #1
	eors r0, r2
	strb r0, [r1]
	bx lr
	.align 2, 0
_08014EBC: .4byte gUnknown_03004990
_08014EC0: .4byte 0x0000079B

	THUMB_FUNC_END sub_8014EA8

	THUMB_FUNC_START sub_8014EC4
sub_8014EC4: @ 0x08014EC4
	ldr r2, _08014ED8  @ gUnknown_03004990
	ldr r2, [r2]
	lsls r0, r0, #2
	movs r3, #0xf0
	lsls r3, r3, #3
	adds r2, r2, r3
	adds r2, r2, r0
	str r1, [r2]
	bx lr
	.align 2, 0
_08014ED8: .4byte gUnknown_03004990

	THUMB_FUNC_END sub_8014EC4

	THUMB_FUNC_START sub_8014EDC
sub_8014EDC: @ 0x08014EDC
	ldr r1, _08014EF0  @ gUnknown_03004990
	ldr r1, [r1]
	lsls r0, r0, #2
	movs r2, #0xf0
	lsls r2, r2, #3
	adds r1, r1, r2
	adds r1, r1, r0
	movs r0, #0
	str r0, [r1]
	bx lr
	.align 2, 0
_08014EF0: .4byte gUnknown_03004990

	THUMB_FUNC_END sub_8014EDC

	THUMB_FUNC_START sub_8014EF4
sub_8014EF4: @ 0x08014EF4
	ldr r1, _08014F0C  @ gUnknown_03004990
	ldr r1, [r1]
	movs r2, #0xf3
	lsls r2, r2, #3
	adds r1, r1, r2
	adds r1, r1, r0
	ldrb r2, [r1]
	movs r0, #3
	ands r0, r2
	strb r0, [r1]
	bx lr
	.align 2, 0
_08014F0C: .4byte gUnknown_03004990

	THUMB_FUNC_END sub_8014EF4

	THUMB_FUNC_START sub_8014F10
sub_8014F10: @ 0x08014F10
	ldr r1, _08014F2C  @ gUnknown_03004990
	ldr r2, [r1]
	movs r1, #0xf3
	lsls r1, r1, #3
	adds r2, r2, r1
	adds r2, r2, r0
	ldrb r1, [r2]
	movs r0, #3
	ands r0, r1
	movs r1, #1
	orrs r0, r1
	strb r0, [r2]
	bx lr
	.align 2, 0
_08014F2C: .4byte gUnknown_03004990

	THUMB_FUNC_END sub_8014F10

	THUMB_FUNC_START sub_8014F30
sub_8014F30: @ 0x08014F30
	ldr r1, _08014F4C  @ gUnknown_03004990
	ldr r2, [r1]
	movs r1, #0xf3
	lsls r1, r1, #3
	adds r2, r2, r1
	adds r2, r2, r0
	ldrb r1, [r2]
	movs r0, #3
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	strb r0, [r2]
	bx lr
	.align 2, 0
_08014F4C: .4byte gUnknown_03004990

	THUMB_FUNC_END sub_8014F30
