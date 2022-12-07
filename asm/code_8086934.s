	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	@ I don't know, so graphical effect stuff probably

	THUMB_FUNC_START sub_8086690
sub_8086690: @ 0x08086690
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	ldr r5, [sp, #0x20]
	ldr r6, [sp, #0x24]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r4, _08086788  @ gUnknown_03001CC8
	lsls r7, r0, #3
	mov sl, r7
	add sl, r4
	lsls r5, r5, #0x18
	asrs r5, r5, #0x18
	movs r4, #0x3f
	ands r5, r4
	mov r7, sl
	ldrb r7, [r7]
	mov r8, r7
	subs r4, #0x7f
	mov r9, r4
	mov r7, r8
	ands r4, r7
	orrs r4, r5
	mov r5, sl
	strb r4, [r5]
	lsls r6, r6, #0x18
	asrs r6, r6, #0x18
	movs r4, #0x3f
	ands r6, r4
	lsls r6, r6, #6
	ldrh r5, [r5]
	ldr r7, _0808678C  @ 0xFFFFF03F
	mov r8, r7
	mov r4, r8
	ands r4, r5
	orrs r4, r6
	mov r5, sl
	strh r4, [r5]
	ldr r4, [r5]
	ldr r5, _08086790  @ 0xFFFC0FFF
	ands r4, r5
	mov r7, sl
	str r4, [r7]
	movs r4, #0
	strb r4, [r7, #3]
	ldr r4, _08086794  @ 0x0000FFFF
	strh r4, [r7, #4]
	movs r6, #0
	movs r4, #0x1e
	strh r4, [r7, #6]
	ldr r4, _08086798  @ gUnknown_03001CE8
	mov ip, r4
	lsls r5, r0, #2
	adds r5, r5, r0
	lsls r5, r5, #2
	adds r4, r5, r4
	movs r7, #1
	strb r7, [r4]
	strb r1, [r4, #1]
	strb r6, [r4, #2]
	ldrb r1, [r4, #3]
	movs r0, #2
	negs r0, r0
	ands r0, r1
	movs r1, #7
	negs r1, r1
	ands r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #7
	ands r0, r1
	movs r1, #8
	orrs r0, r1
	strb r0, [r4, #3]
	movs r0, #0x3f
	ands r2, r0
	ldrb r0, [r4, #4]
	mov r1, r9
	ands r1, r0
	orrs r1, r2
	strb r1, [r4, #4]
	lsls r3, r3, #0x18
	asrs r3, r3, #0x18
	movs r0, #0x3f
	ands r3, r0
	lsls r3, r3, #6
	ldrh r0, [r4, #4]
	mov r1, r8
	ands r1, r0
	orrs r1, r3
	strh r1, [r4, #4]
	ldrb r1, [r4, #5]
	movs r0, #0x11
	negs r0, r0
	ands r0, r1
	movs r1, #0x20
	orrs r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r4, #5]
	strb r6, [r4, #6]
	strb r7, [r4, #7]
	movs r7, #8
	add ip, r7
	add r5, ip
	mov r0, sl
	str r0, [r5]
	strb r6, [r4, #0xc]
	strb r6, [r4, #0xd]
	strb r6, [r4, #0xe]
	strb r6, [r4, #0xf]
	strb r6, [r4, #0x10]
	strb r6, [r4, #0x11]
	strb r6, [r4, #0x12]
	strb r6, [r4, #0x13]
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08086788: .4byte gUnknown_03001CC8
_0808678C: .4byte 0xFFFFF03F
_08086790: .4byte 0xFFFC0FFF
_08086794: .4byte 0x0000FFFF
_08086798: .4byte gUnknown_03001CE8

	THUMB_FUNC_END sub_8086690

	THUMB_FUNC_START sub_808679C
sub_808679C: @ 0x0808679C
	push {r4, r5, r6, lr}
	sub sp, #8
	ldr r5, _08086830  @ gUnknown_089FF480
	ldr r6, _08086834  @ gUnknown_03001CC0
	ldrb r0, [r6]
	lsls r0, r0, #2
	adds r0, r0, r5
	ldrb r1, [r0]
	movs r4, #0xe
	str r4, [sp]
	movs r0, #2
	str r0, [sp, #4]
	movs r0, #0
	movs r2, #0
	movs r3, #2
	bl sub_8086690
	ldrb r0, [r6]
	lsls r0, r0, #2
	adds r1, r5, #1
	adds r0, r0, r1
	ldrb r1, [r0]
	str r4, [sp]
	movs r0, #3
	str r0, [sp, #4]
	movs r0, #1
	movs r2, #0
	movs r3, #3
	bl sub_8086690
	ldrb r0, [r6]
	lsls r0, r0, #2
	adds r1, r5, #2
	adds r0, r0, r1
	ldrb r1, [r0]
	str r4, [sp]
	movs r0, #4
	str r0, [sp, #4]
	movs r0, #2
	movs r2, #0
	movs r3, #4
	bl sub_8086690
	ldrb r0, [r6]
	lsls r0, r0, #2
	adds r1, r5, #3
	adds r0, r0, r1
	ldrb r1, [r0]
	str r4, [sp]
	movs r0, #5
	str r0, [sp, #4]
	movs r0, #3
	movs r2, #0
	movs r3, #5
	bl sub_8086690
	ldr r0, _08086838  @ gUnknown_03001CE8
	adds r0, #0x50
	movs r1, #0
	strb r1, [r0]
	ldrb r0, [r6]
	adds r0, #1
	strb r0, [r6]
	ldrb r0, [r6]
	lsls r0, r0, #2
	adds r0, r0, r5
	ldrb r0, [r0]
	cmp r0, #0
	bne _08086828
	strb r0, [r6]
_08086828:
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08086830: .4byte gUnknown_089FF480
_08086834: .4byte gUnknown_03001CC0
_08086838: .4byte gUnknown_03001CE8

	THUMB_FUNC_END sub_808679C

	THUMB_FUNC_START sub_808683C
sub_808683C: @ 0x0808683C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	ldr r7, _08086914  @ gUnknown_02022968
	movs r0, #0
	mov r9, r0
	movs r1, #0x1f
	mov sl, r1
	movs r0, #0x80
	lsls r0, r0, #0xd
	mov r8, r0
_08086856:
	ldrh r3, [r7]
	movs r0, #0x1f
	lsrs r1, r3, #5
	lsrs r2, r3, #0xa
	ands r0, r3
	lsls r4, r0, #3
	adds r4, r4, r0
	lsls r0, r4, #4
	adds r4, r4, r0
	lsls r4, r4, #1
	mov r0, sl
	ands r1, r0
	ldr r0, _08086918  @ 0x00000259
	muls r0, r1, r0
	adds r4, r4, r0
	mov r1, sl
	ands r2, r1
	movs r0, #0x75
	muls r0, r2, r0
	adds r4, r4, r0
	lsls r4, r4, #0xa
	ldr r1, _0808691C  @ 0x0029BDDC
	adds r0, r4, r1
	mov r1, r8
	bl Div
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	ldr r1, _08086920  @ 0xFFFBEDED
	adds r0, r4, r1
	mov r1, r8
	bl Div
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	ldr r0, _08086924  @ 0xFFC71C6D
	adds r4, r4, r0
	adds r0, r4, #0
	mov r1, r8
	bl Div
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	lsls r0, r5, #0x10
	cmp r0, #0
	bge _080868B4
	movs r5, #0
_080868B4:
	lsls r0, r6, #0x10
	cmp r0, #0
	bge _080868BC
	movs r6, #0
_080868BC:
	lsls r0, r2, #0x10
	cmp r0, #0
	bge _080868C4
	movs r2, #0
_080868C4:
	lsls r0, r5, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x1f
	ble _080868CE
	movs r5, #0x1f
_080868CE:
	lsls r0, r6, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x1f
	ble _080868D8
	movs r6, #0x1f
_080868D8:
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x1f
	ble _080868E2
	movs r2, #0x1f
_080868E2:
	lsls r0, r6, #0x10
	asrs r0, r0, #0xb
	orrs r5, r0
	lsls r1, r5, #0x10
	lsls r0, r2, #0x1a
	orrs r0, r1
	lsrs r3, r0, #0x10
	strh r3, [r7]
	adds r7, #2
	mov r0, r9
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r9, r0
	cmp r0, #0x9f
	bls _08086856
	bl EnablePaletteSync
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08086914: .4byte gUnknown_02022968
_08086918: .4byte 0x00000259
_0808691C: .4byte 0x0029BDDC
_08086920: .4byte 0xFFFBEDED
_08086924: .4byte 0xFFC71C6D

	THUMB_FUNC_END sub_808683C

	THUMB_FUNC_START sub_8086928
sub_8086928: @ 0x08086928
	push {lr}
	bl Make6C_savemenu2
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8086928

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
	ldr r7, _08086B24  @ gGenericBuffer
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
_08086B24: .4byte gGenericBuffer
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
