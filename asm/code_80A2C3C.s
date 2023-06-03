	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	THUMB_FUNC_START sub_80A720C
sub_80A720C: @ 0x080A720C
	push {r4, lr}
	adds r4, r1, #0
	ldr r2, _080A722C  @ 0x04000019
	bl CpuSet
	ldr r1, _080A7230  @ gUnknown_08205D7C
	adds r0, r4, #0
	bl CopyString
	ldr r0, _080A7234  @ 0x00040624
	str r0, [r4, #8]
	ldr r0, _080A7238  @ 0x0000200A
	strh r0, [r4, #0xc]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A722C: .4byte 0x04000019
_080A7230: .4byte gUnknown_08205D7C
_080A7234: .4byte 0x00040624
_080A7238: .4byte 0x0000200A

	THUMB_FUNC_END sub_80A720C

	THUMB_FUNC_START sub_80A723C
sub_80A723C: @ 0x080A723C
	push {r4, r5, lr}
	adds r2, r1, #0
	ldm r0!, {r3, r4, r5}
	stm r2!, {r3, r4, r5}
	ldr r0, [r0]
	str r0, [r2]
	ldr r0, _080A7254  @ 0x00040624
	str r0, [r1]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A7254: .4byte 0x00040624

	THUMB_FUNC_END sub_80A723C

	THUMB_FUNC_START sub_80A7258
sub_80A7258: @ 0x080A7258
	push {r4, lr}
	adds r2, r0, #0
	adds r4, r1, #0
	adds r0, r4, #0
	adds r1, r2, #0
	movs r2, #0x4c
	bl memcpy
	ldrb r1, [r4, #0xe]
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	cmp r0, #4
	ble _080A7276
	adds r0, r1, #1
	strb r0, [r4, #0xe]
_080A7276:
	ldrb r1, [r4, #0xe]
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	cmp r0, #0x15
	ble _080A7284
	adds r0, r1, #1
	strb r0, [r4, #0xe]
_080A7284:
	ldrb r1, [r4, #0xe]
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	cmp r0, #0x22
	ble _080A7292
	adds r0, r1, #1
	strb r0, [r4, #0xe]
_080A7292:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80A7258

	THUMB_FUNC_START sub_80A7298
sub_80A7298: @ 0x080A7298
	push {r4, lr}
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldr r2, [r0]
	str r2, [r1]
	ldrb r0, [r0, #4]
	strb r0, [r1, #4]
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80A7298

	THUMB_FUNC_START sub_80A72B0
sub_80A72B0: @ 0x080A72B0
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r0, r5, #0
	adds r0, #0x4c
	adds r1, r4, #0
	adds r1, #0x58
	ldr r2, _080A72E4  @ 0x00001EC4
	bl memcpy
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_80A7258
	ldr r0, _080A72E8  @ 0x00001F1C
	adds r4, r4, r0
	adds r0, #0x28
	adds r5, r5, r0
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_80A7298
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A72E4: .4byte 0x00001EC4
_080A72E8: .4byte 0x00001F1C

	THUMB_FUNC_END sub_80A72B0

	THUMB_FUNC_START sub_80A72EC
sub_80A72EC: @ 0x080A72EC
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r0, r5, #0
	adds r0, #0x4c
	adds r1, r4, #0
	adds r1, #0x58
	ldr r2, _080A7320  @ 0x00000D1C
	bl memcpy
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_80A7258
	ldr r0, _080A7324  @ 0x00000D74
	adds r4, r4, r0
	adds r0, #0x18
	adds r5, r5, r0
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_80A7298
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A7320: .4byte 0x00000D1C
_080A7324: .4byte 0x00000D74

	THUMB_FUNC_END sub_80A72EC

	THUMB_FUNC_START sub_80A7328
sub_80A7328: @ 0x080A7328
	push {lr}
	adds r3, r0, #0
	adds r0, r1, #0
	movs r2, #0xa2
	lsls r2, r2, #1
	adds r1, r3, #0
	bl memcpy
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80A7328

	THUMB_FUNC_START sub_80A733C
sub_80A733C: @ 0x080A733C
	push {r4, lr}
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldm r0!, {r2, r3}
	stm r1!, {r2, r3}
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80A733C

	THUMB_FUNC_START sub_80A734C
sub_80A734C: @ 0x080A734C
	push {r4, lr}
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80A734C

	THUMB_FUNC_START sub_80A7360
sub_80A7360: @ 0x080A7360
	push {lr}
	adds r2, r0, #0
	adds r0, r1, #0
	adds r1, r2, #0
	movs r2, #0x94
	bl memcpy
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80A7360

	THUMB_FUNC_START sub_80A7374
sub_80A7374: @ 0x080A7374
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x34
	ldr r4, _080A751C  @ gAnims
	movs r0, #0xe0
	lsls r0, r0, #0x14
	mov r9, r0
	ldr r5, _080A7520  @ ReadSramFast
	ldr r3, [r5]
	adds r1, r4, #0
	movs r2, #0x64
	bl _call_via_r3
	ldr r1, [r4, #8]
	ldr r0, _080A7524  @ 0x00040624
	cmp r1, r0
	bne _080A739E
	b _080A750C
_080A739E:
	mov r8, r4
	movs r2, #0x80
	lsls r2, r2, #8
	ldr r3, [r5]
	mov r0, r9
	mov r1, r8
	bl _call_via_r3
	mov r0, r8
	ldr r1, [r0, #8]
	ldr r0, _080A7528  @ 0x00040603
	cmp r1, r0
	beq _080A73BA
	b _080A750C
_080A73BA:
	movs r0, #0
	str r0, [sp]
	movs r4, #0x80
	lsls r4, r4, #8
	add r4, r8
	ldr r2, _080A752C  @ 0x01000019
	mov r0, sp
	adds r1, r4, #0
	bl CpuFastSet
	mov r0, r8
	adds r1, r4, #0
	bl sub_80A720C
	adds r0, r4, #0
	bl WriteGlobalSaveInfo
	movs r5, #0
	add r7, sp, #4
	add r1, sp, #8
	mov sl, r1
	mov r0, sp
	adds r0, #0xc
	str r0, [sp, #0x20]
	mov r1, sp
	adds r1, #0x10
	str r1, [sp, #0x24]
	adds r0, #8
	str r0, [sp, #0x28]
	adds r1, #8
	str r1, [sp, #0x2c]
	adds r0, #8
	str r0, [sp, #0x30]
	mov r6, r9
	adds r6, #0xd4
_080A7400:
	movs r0, #0
	str r0, [sp, #4]
	adds r0, r7, #0
	adds r1, r4, #0
	ldr r2, _080A7530  @ 0x010007DE
	bl CpuFastSet
	ldr r0, _080A7534  @ 0x00001F58
	muls r0, r5, r0
	adds r0, #0xd4
	add r0, r8
	adds r1, r4, #0
	bl sub_80A72B0
	adds r0, r4, #0
	adds r1, r6, #0
	ldr r2, _080A7538  @ 0x00001F78
	bl WriteAndVerifySramFast
	ldr r1, _080A7538  @ 0x00001F78
	adds r6, r6, r1
	adds r5, #1
	cmp r5, #1
	ble _080A7400
	movs r5, #0
	ldr r6, _080A753C  @ gUnknown_02008000
	ldr r0, _080A7540  @ 0x00003FC4
	mov r1, r9
	adds r4, r1, r0
_080A743A:
	movs r7, #0
	str r7, [sp, #8]
	mov r0, sl
	adds r1, r6, #0
	ldr r2, _080A7544  @ 0x01000372
	bl CpuFastSet
	ldr r0, _080A7548  @ 0x00000DA4
	muls r0, r5, r0
	ldr r1, _080A754C  @ 0x00003F84
	adds r0, r0, r1
	add r0, r8
	adds r1, r6, #0
	bl sub_80A72EC
	adds r0, r6, #0
	adds r1, r4, #0
	ldr r2, _080A7550  @ 0x00000DC8
	bl WriteAndVerifySramFast
	ldr r0, _080A7550  @ 0x00000DC8
	adds r4, r4, r0
	adds r5, #1
	cmp r5, #2
	ble _080A743A
	str r7, [sp, #0xc]
	ldr r4, _080A753C  @ gUnknown_02008000
	ldr r2, _080A7554  @ 0x01000025
	ldr r0, [sp, #0x20]
	adds r1, r4, #0
	bl CpuFastSet
	ldr r0, _080A7558  @ 0x000070E4
	add r0, r8
	adds r1, r4, #0
	bl sub_80A7360
	adds r0, r4, #0
	bl SaveRankings
	str r7, [sp, #0x10]
	ldr r2, _080A755C  @ 0x01000009
	ldr r0, [sp, #0x24]
	adds r1, r4, #0
	bl CpuFastSet
	ldr r0, _080A7560  @ 0x00007178
	add r0, r8
	adds r1, r4, #0
	bl sub_80A734C
	adds r0, r4, #0
	bl sub_80A3EA4
	str r7, [sp, #0x14]
	ldr r2, _080A7564  @ 0x01000005
	ldr r0, [sp, #0x28]
	adds r1, r4, #0
	bl CpuFastSet
	ldr r0, _080A7568  @ 0x0000719C
	add r0, r8
	adds r1, r4, #0
	bl sub_80A733C
	adds r0, r4, #0
	bl sub_80A4000
	str r7, [sp, #0x18]
	ldr r2, _080A756C  @ 0x01000051
	ldr r0, [sp, #0x2c]
	adds r1, r4, #0
	bl CpuFastSet
	ldr r0, _080A7570  @ 0x000071B0
	add r0, r8
	adds r1, r4, #0
	bl sub_80A7328
	adds r0, r4, #0
	bl SaveBonusContentData
	movs r5, #0
	adds r6, r4, #0
	mov r4, r8
	adds r4, #0x64
_080A74E6:
	movs r0, #0
	str r0, [sp, #0x1c]
	ldr r0, [sp, #0x30]
	adds r1, r6, #0
	ldr r2, _080A7574  @ 0x01000004
	bl CpuFastSet
	adds r0, r4, #0
	adds r1, r6, #0
	bl sub_80A723C
	adds r0, r6, #0
	adds r1, r5, #0
	bl WriteSaveBlockInfo
	adds r4, #0x10
	adds r5, #1
	cmp r5, #6
	ble _080A74E6
_080A750C:
	add sp, #0x34
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A751C: .4byte gAnims
_080A7520: .4byte ReadSramFast
_080A7524: .4byte 0x00040624
_080A7528: .4byte 0x00040603
_080A752C: .4byte 0x01000019
_080A7530: .4byte 0x010007DE
_080A7534: .4byte 0x00001F58
_080A7538: .4byte 0x00001F78
_080A753C: .4byte gUnknown_02008000
_080A7540: .4byte 0x00003FC4
_080A7544: .4byte 0x01000372
_080A7548: .4byte 0x00000DA4
_080A754C: .4byte 0x00003F84
_080A7550: .4byte 0x00000DC8
_080A7554: .4byte 0x01000025
_080A7558: .4byte 0x000070E4
_080A755C: .4byte 0x01000009
_080A7560: .4byte 0x00007178
_080A7564: .4byte 0x01000005
_080A7568: .4byte 0x0000719C
_080A756C: .4byte 0x01000051
_080A7570: .4byte 0x000071B0
_080A7574: .4byte 0x01000004

	THUMB_FUNC_END sub_80A7374
.align 2, 0
