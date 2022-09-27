	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	THUMB_FUNC_START SetSomeUnitStatThingUnlockMaybeIdk
SetSomeUnitStatThingUnlockMaybeIdk: @ 0x080A37A8
	push {r4, r5, lr}
	sub sp, #0x64
	adds r4, r0, #0
	adds r5, r1, #0
	movs r3, #0
	movs r0, #0x80
	lsls r0, r0, #1
	cmp r4, r0
	bgt _080A37E8
	cmp r5, #0
	bne _080A37C8
	mov r5, sp
	mov r0, sp
	bl LoadAndVerifySecureHeaderSW
	movs r3, #1
_080A37C8:
	asrs r0, r4, #3
	adds r2, r5, #0
	adds r2, #0x40
	adds r2, r2, r0
	movs r1, #7
	ands r1, r4
	movs r0, #1
	lsls r0, r1
	ldrb r1, [r2]
	orrs r0, r1
	strb r0, [r2]
	cmp r3, #0
	beq _080A37E8
	adds r0, r5, #0
	bl SaveSecureHeader
_080A37E8:
	add sp, #0x64
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END SetSomeUnitStatThingUnlockMaybeIdk

	THUMB_FUNC_START sub_80A37F0
sub_80A37F0: @ 0x080A37F0
	push {r4, r5, lr}
	sub sp, #0x64
	adds r5, r0, #0
	adds r4, r1, #0
	movs r0, #0x80
	lsls r0, r0, #1
	cmp r5, r0
	bgt _080A3824
	cmp r4, #0
	bne _080A380C
	mov r4, sp
	mov r0, sp
	bl LoadAndVerifySecureHeaderSW
_080A380C:
	asrs r1, r5, #3
	adds r0, r4, #0
	adds r0, #0x40
	adds r0, r0, r1
	ldrb r1, [r0]
	movs r0, #7
	ands r0, r5
	asrs r1, r0
	movs r0, #1
	ands r1, r0
	cmp r1, #0
	bne _080A3828
_080A3824:
	movs r0, #0
	b _080A382A
_080A3828:
	movs r0, #1
_080A382A:
	add sp, #0x64
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80A37F0

	THUMB_FUNC_START sub_80A3834
sub_80A3834: @ 0x080A3834
	push {r4, lr}
	sub sp, #0x64
	adds r4, r0, #0
	cmp r4, #0
	bne _080A3846
	mov r4, sp
	mov r0, sp
	bl LoadAndVerifySecureHeaderSW
_080A3846:
	movs r1, #0
	adds r2, r4, #0
	adds r2, #0x40
_080A384C:
	adds r0, r2, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _080A3858
	movs r0, #1
	b _080A3860
_080A3858:
	adds r1, #1
	cmp r1, #0x1f
	ble _080A384C
	movs r0, #0
_080A3860:
	add sp, #0x64
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80A3834

	THUMB_FUNC_START sub_80A3868
sub_80A3868: @ 0x080A3868
	bx lr

	THUMB_FUNC_END sub_80A3868

	THUMB_FUNC_START __malloc_unlock_3
__malloc_unlock_3: @ 0x080A386C
	bx lr

	THUMB_FUNC_END __malloc_unlock_3

	THUMB_FUNC_START sub_80A3870
sub_80A3870: @ 0x080A3870
	push {lr}
	sub sp, #0x64
	mov r0, sp
	bl LoadAndVerifySecureHeaderSW
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A3890
	mov r0, sp
	ldrb r1, [r0, #0xe]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080A3890
	movs r0, #1
	b _080A3892
_080A3890:
	movs r0, #0
_080A3892:
	add sp, #0x64
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80A3870

	THUMB_FUNC_START sub_80A3898
sub_80A3898: @ 0x080A3898
	push {r4, r5, lr}
	adds r5, r0, #0
	bl IsSramWorking
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A38EC
	cmp r5, #0
	bne _080A38AC
	ldr r5, _080A38DC  @ gUnknown_02020188
_080A38AC:
	ldr r1, _080A38E0  @ ReadSramFast
	ldr r0, _080A38E4  @ gpSaveDataStart
	ldr r0, [r0]
	ldr r2, _080A38E8  @ 0x00007190
	adds r0, r0, r2
	ldr r3, [r1]
	adds r1, r5, #0
	movs r2, #0x94
	bl _call_via_r3
	adds r4, r5, #0
	adds r4, #0x90
	adds r0, r5, #0
	movs r1, #0x90
	bl SecureHeaderCalc
	ldrh r1, [r4]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r1, r0
	bne _080A38EC
	movs r0, #1
	b _080A38EE
	.align 2, 0
_080A38DC: .4byte gUnknown_02020188
_080A38E0: .4byte ReadSramFast
_080A38E4: .4byte gpSaveDataStart
_080A38E8: .4byte 0x00007190
_080A38EC:
	movs r0, #0
_080A38EE:
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80A3898

	THUMB_FUNC_START sub_80A38F4
sub_80A38F4: @ 0x080A38F4
	push {r4, r5, lr}
	adds r5, r0, #0
	bl IsSramWorking
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A3948
	cmp r5, #0
	bne _080A3908
	ldr r5, _080A3938  @ gUnknown_02020188
_080A3908:
	ldr r1, _080A393C  @ ReadSramFast
	ldr r0, _080A3940  @ gpSaveDataStart
	ldr r0, [r0]
	ldr r2, _080A3944  @ 0x0000725C
	adds r0, r0, r2
	movs r2, #0xa2
	lsls r2, r2, #1
	ldr r3, [r1]
	adds r1, r5, #0
	bl _call_via_r3
	movs r1, #0xa0
	lsls r1, r1, #1
	adds r4, r5, r1
	adds r0, r5, #0
	bl SecureHeaderCalc
	ldrh r1, [r4]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r1, r0
	bne _080A3948
	movs r0, #1
	b _080A394A
	.align 2, 0
_080A3938: .4byte gUnknown_02020188
_080A393C: .4byte ReadSramFast
_080A3940: .4byte gpSaveDataStart
_080A3944: .4byte 0x0000725C
_080A3948:
	movs r0, #0
_080A394A:
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80A38F4

	THUMB_FUNC_START sub_80A3950
sub_80A3950: @ 0x080A3950
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r4, #0xa0
	lsls r4, r4, #1
	adds r1, r4, #0
	bl SecureHeaderCalc
	adds r4, r5, r4
	strh r0, [r4]
	ldr r0, _080A397C  @ gpSaveDataStart
	ldr r1, [r0]
	ldr r0, _080A3980  @ 0x0000725C
	adds r1, r1, r0
	movs r2, #0xa2
	lsls r2, r2, #1
	adds r0, r5, #0
	bl WriteAndVerifySramFast
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A397C: .4byte gpSaveDataStart
_080A3980: .4byte 0x0000725C

	THUMB_FUNC_END sub_80A3950

	THUMB_FUNC_START sub_80A3984
sub_80A3984: @ 0x080A3984
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0x90
	bl SecureHeaderCalc
	adds r1, r4, #0
	adds r1, #0x90
	strh r0, [r1]
	ldr r0, _080A39AC  @ gpSaveDataStart
	ldr r1, [r0]
	ldr r0, _080A39B0  @ 0x00007190
	adds r1, r1, r0
	adds r0, r4, #0
	movs r2, #0x94
	bl WriteAndVerifySramFast
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A39AC: .4byte gpSaveDataStart
_080A39B0: .4byte 0x00007190

	THUMB_FUNC_END sub_80A3984

	THUMB_FUNC_START sub_80A39B4
sub_80A39B4: @ 0x080A39B4
	push {lr}
	sub sp, #0x98
	add r0, sp, #0x94
	movs r1, #0
	strh r1, [r0]
	ldr r2, _080A39D4  @ 0x0100004A
	mov r1, sp
	bl CpuSet
	mov r0, sp
	bl sub_80A3984
	add sp, #0x98
	pop {r0}
	bx r0
	.align 2, 0
_080A39D4: .4byte 0x0100004A

	THUMB_FUNC_END sub_80A39B4

	THUMB_FUNC_START sub_80A39D8
sub_80A39D8: @ 0x080A39D8
	ldr r0, _080A39E0  @ gRAMChapterData
	ldrb r0, [r0, #0x1b]
	subs r0, #1
	bx lr
	.align 2, 0
_080A39E0: .4byte gRAMChapterData

	THUMB_FUNC_END sub_80A39D8

	THUMB_FUNC_START sub_80A39E4
sub_80A39E4: @ 0x080A39E4
	push {r4, r5, r6, r7, lr}
	sub sp, #0x98
	adds r6, r0, #0
	adds r7, r1, #0
	adds r5, r2, #0
	add r0, sp, #0x94
	movs r4, #0
	strh r4, [r0]
	ldr r2, _080A3A1C  @ 0x0100000C
	adds r1, r6, #0
	bl CpuSet
	mov r0, sp
	adds r0, #0x96
	strh r4, [r0]
	ldr r2, _080A3A20  @ 0x0100004A
	mov r1, sp
	bl CpuSet
	mov r0, sp
	bl sub_80A3898
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080A3A24
	movs r0, #0
	b _080A3A40
	.align 2, 0
_080A3A1C: .4byte 0x0100000C
_080A3A20: .4byte 0x0100004A
_080A3A24:
	lsls r0, r5, #1
	adds r0, r0, r5
	adds r0, r7, r0
	lsls r2, r0, #1
	adds r2, r2, r0
	lsls r2, r2, #3
	adds r1, r6, #0
	mov r3, sp
	adds r0, r3, r2
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	movs r0, #1
_080A3A40:
	add sp, #0x98
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80A39E4

	THUMB_FUNC_START sub_80A3A48
sub_80A3A48: @ 0x080A3A48
	push {r4, r5, r6, lr}
	sub sp, #0x94
	adds r6, r0, #0
	adds r5, r1, #0
	adds r4, r2, #0
	mov r0, sp
	bl sub_80A3898
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A3A7E
	lsls r1, r4, #1
	adds r1, r1, r4
	adds r1, r5, r1
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	mov r2, sp
	adds r1, r2, r0
	adds r0, r6, #0
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	mov r0, sp
	bl sub_80A3984
_080A3A7E:
	add sp, #0x94
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80A3A48

	THUMB_FUNC_START sub_80A3A88
sub_80A3A88: @ 0x080A3A88
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	ldrb r2, [r5]
	lsls r0, r2, #0x1f
	cmp r0, #0
	beq _080A3B36
	ldrb r0, [r4]
	lsls r0, r0, #0x1c
	lsrs r1, r0, #0x1d
	lsls r0, r2, #0x1c
	lsrs r0, r0, #0x1d
	cmp r1, r0
	bgt _080A3B36
	cmp r1, r0
	bne _080A3B40
	ldrb r0, [r4, #0x17]
	cmp r0, #0
	beq _080A3AB4
	ldrb r1, [r5, #0x17]
	cmp r0, r1
	bne _080A3B36
_080A3AB4:
	ldrh r1, [r4, #2]
	lsls r1, r1, #0x11
	lsrs r1, r1, #0x18
	ldrh r0, [r5, #2]
	lsls r0, r0, #0x11
	lsrs r0, r0, #0x18
	cmp r1, r0
	bgt _080A3B36
	ldrb r1, [r4, #7]
	lsrs r1, r1, #5
	ldr r0, [r4, #8]
	ldr r2, _080A3B3C  @ 0x001FFFFF
	ands r0, r2
	lsls r3, r0, #3
	orrs r3, r1
	ldrb r1, [r5, #7]
	lsrs r1, r1, #5
	ldr r0, [r5, #8]
	ands r0, r2
	lsls r0, r0, #3
	orrs r0, r1
	cmp r3, r0
	bgt _080A3B36
	cmp r3, r0
	bne _080A3B40
	ldr r0, [r4, #4]
	lsls r0, r0, #0xf
	lsrs r0, r0, #0x16
	lsls r3, r0, #3
	subs r3, r3, r0
	lsls r3, r3, #5
	adds r3, r3, r0
	lsls r3, r3, #4
	ldrb r1, [r4, #6]
	lsls r1, r1, #0x19
	lsrs r1, r1, #0x1a
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r3, r3, r0
	ldrh r0, [r4, #6]
	lsls r0, r0, #0x13
	lsrs r0, r0, #0x1a
	adds r3, r3, r0
	ldr r0, [r5, #4]
	lsls r0, r0, #0xf
	lsrs r0, r0, #0x16
	lsls r2, r0, #3
	subs r2, r2, r0
	lsls r2, r2, #5
	adds r2, r2, r0
	lsls r2, r2, #4
	ldrb r1, [r5, #6]
	lsls r1, r1, #0x19
	lsrs r1, r1, #0x1a
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r2, r2, r0
	ldrh r0, [r5, #6]
	lsls r0, r0, #0x13
	lsrs r0, r0, #0x1a
	adds r2, r2, r0
	cmp r3, r2
	bge _080A3B40
_080A3B36:
	movs r0, #1
	b _080A3B42
	.align 2, 0
_080A3B3C: .4byte 0x001FFFFF
_080A3B40:
	movs r0, #0
_080A3B42:
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80A3A88

	THUMB_FUNC_START sub_80A3B48
sub_80A3B48: @ 0x080A3B48
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	adds r7, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	movs r0, #0
	mov r9, r0
	add r0, sp, #4
	movs r1, #0
	mov r8, r1
	mov r3, r9
	strh r3, [r0]
	ldr r2, _080A3C54  @ 0x0100000C
	adds r1, r7, #0
	bl CpuSet
	ldrb r0, [r7]
	movs r6, #1
	orrs r0, r6
	strb r0, [r7]
	movs r0, #3
	ands r4, r0
	lsls r4, r4, #3
	ldrb r1, [r7, #2]
	movs r0, #0x19
	negs r0, r0
	ands r0, r1
	orrs r0, r4
	ands r5, r6
	lsls r5, r5, #5
	movs r1, #0x21
	negs r1, r1
	ands r0, r1
	orrs r0, r5
	strb r0, [r7, #2]
	bl GetPartyTotalGoldValue
	movs r2, #7
	ands r2, r0
	lsls r2, r2, #5
	ldrb r3, [r7, #7]
	movs r1, #0x1f
	ands r1, r3
	orrs r1, r2
	strb r1, [r7, #7]
	lsls r0, r0, #8
	lsrs r0, r0, #0xb
	ldr r1, [r7, #8]
	ldr r2, _080A3C58  @ 0xFFE00000
	ands r1, r2
	orrs r1, r0
	str r1, [r7, #8]
	ldr r3, _080A3C5C  @ gRAMChapterData
	adds r0, r3, #0
	adds r0, #0x2b
	ldrb r1, [r0]
	lsls r1, r1, #0x1f
	lsrs r1, r1, #0x1f
	ands r1, r6
	lsls r1, r1, #6
	ldrb r2, [r7, #2]
	movs r0, #0x41
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r7, #2]
	ldrh r1, [r3, #0x2c]
	lsls r1, r1, #0x13
	lsrs r1, r1, #0x17
	movs r0, #0xff
	ands r1, r0
	lsls r1, r1, #7
	ldrh r2, [r7, #2]
	ldr r0, _080A3C60  @ 0xFFFF807F
	ands r0, r2
	orrs r0, r1
	strh r0, [r7, #2]
	bl GetGameTotalTime
	mov r4, sp
	adds r4, #6
	add r5, sp, #8
	mov r6, sp
	adds r6, #0xa
	adds r1, r4, #0
	adds r2, r5, #0
	adds r3, r6, #0
	bl ComputeDisplayTime
	ldrh r2, [r4]
	ldr r0, _080A3C64  @ 0x000003FF
	ands r2, r0
	lsls r2, r2, #7
	ldr r0, [r7, #4]
	ldr r1, _080A3C68  @ 0xFFFE007F
	ands r0, r1
	orrs r0, r2
	str r0, [r7, #4]
	ldrh r1, [r5]
	movs r0, #0x3f
	ands r1, r0
	lsls r1, r1, #1
	ldrb r2, [r7, #6]
	movs r0, #0x7f
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r7, #6]
	ldrh r1, [r6]
	movs r0, #0x3f
	ands r1, r0
	lsls r1, r1, #7
	ldrh r2, [r7, #6]
	ldr r0, _080A3C6C  @ 0xFFFFE07F
	ands r0, r2
	orrs r0, r1
	strh r0, [r7, #6]
	ldrb r1, [r7, #3]
	movs r0, #0x7f
	ands r0, r1
	strb r0, [r7, #3]
	ldrb r1, [r7, #4]
	movs r0, #0x80
	negs r0, r0
	ands r0, r1
	strb r0, [r7, #4]
	mov r0, r8
	strb r0, [r7, #0x17]
	movs r4, #1
	b _080A3C78
	.align 2, 0
_080A3C54: .4byte 0x0100000C
_080A3C58: .4byte 0xFFE00000
_080A3C5C: .4byte gRAMChapterData
_080A3C60: .4byte 0xFFFF807F
_080A3C64: .4byte 0x000003FF
_080A3C68: .4byte 0xFFFE007F
_080A3C6C: .4byte 0xFFFFE07F
_080A3C70:
	ldrb r0, [r2, #4]
	strb r0, [r7, #0x17]
	b _080A3CA0
_080A3C76:
	adds r4, #1
_080A3C78:
	cmp r4, #0x3f
	bgt _080A3CA0
	adds r0, r4, #0
	bl GetUnit
	cmp r0, #0
	beq _080A3C76
	ldr r2, [r0]
	cmp r2, #0
	beq _080A3C76
	ldr r1, [r0, #0xc]
	movs r0, #0x80
	lsls r0, r0, #6
	ands r0, r1
	cmp r0, #0
	beq _080A3C76
	movs r0, #4
	ands r1, r0
	cmp r1, #0
	beq _080A3C70
_080A3CA0:
	movs r5, #1
	movs r1, #0xc
	adds r1, r1, r7
	mov sl, r1
	movs r3, #0x7f
	mov r8, r3
	movs r6, #0x7f
_080A3CAE:
	adds r0, r5, #0
	bl GetUnit
	adds r4, r0, #0
	cmp r4, #0
	beq _080A3D08
	ldr r2, [r4]
	cmp r2, #0
	beq _080A3D08
	ldr r0, [r4, #0xc]
	ldr r1, _080A3DCC  @ 0x00010004
	ands r0, r1
	cmp r0, #0
	bne _080A3D08
	ldrb r0, [r2, #4]
	bl sub_80A49FC
	cmp r0, r9
	ble _080A3D08
	ldr r0, [r4]
	ldrb r0, [r0, #4]
	bl sub_80A49FC
	mov r9, r0
	ldr r0, [r4]
	ldrb r2, [r0, #4]
	movs r1, #1
	ands r1, r2
	lsls r1, r1, #7
	ldrb r3, [r7, #3]
	adds r0, r6, #0
	ands r0, r3
	orrs r0, r1
	strb r0, [r7, #3]
	lsrs r2, r2, #1
	ands r2, r6
	mov r0, r8
	ands r2, r0
	ldrb r0, [r7, #4]
	movs r3, #0x80
	negs r3, r3
	adds r1, r3, #0
	ands r0, r1
	orrs r0, r2
	strb r0, [r7, #4]
_080A3D08:
	adds r5, #1
	cmp r5, #0x3f
	ble _080A3CAE
	bl sub_80B5D74
	movs r5, #7
	ands r0, r5
	lsls r0, r0, #4
	ldrb r2, [r7]
	movs r1, #0x71
	negs r1, r1
	ands r1, r2
	orrs r1, r0
	strb r1, [r7]
	bl sub_80B5FD0
	ands r0, r5
	lsls r0, r0, #2
	ldrb r2, [r7, #1]
	movs r1, #0x1d
	negs r1, r1
	ands r1, r2
	orrs r1, r0
	strb r1, [r7, #1]
	bl sub_80B5E6C
	movs r1, #7
	ands r0, r1
	lsls r0, r0, #7
	ldrh r2, [r7]
	ldr r1, _080A3DD0  @ 0xFFFFFC7F
	ands r1, r2
	orrs r1, r0
	strh r1, [r7]
	bl sub_80B5EA4
	lsls r0, r0, #5
	ldrb r2, [r7, #1]
	movs r1, #0x1f
	ands r1, r2
	orrs r1, r0
	strb r1, [r7, #1]
	bl sub_80B5F9C
	ands r0, r5
	ldrb r1, [r7, #2]
	movs r4, #8
	negs r4, r4
	ands r4, r1
	orrs r4, r0
	strb r4, [r7, #2]
	ldrb r0, [r7]
	lsls r0, r0, #0x19
	lsrs r0, r0, #0x1d
	ldrh r1, [r7]
	lsls r1, r1, #0x16
	lsrs r1, r1, #0x1d
	ldrb r3, [r7, #1]
	lsls r2, r3, #0x1b
	lsrs r2, r2, #0x1d
	lsrs r3, r3, #5
	lsls r4, r4, #0x1d
	lsrs r4, r4, #0x1d
	str r4, [sp]
	bl sub_80B6070
	ands r0, r5
	lsls r0, r0, #1
	ldrb r2, [r7]
	movs r1, #0xf
	negs r1, r1
	ands r1, r2
	orrs r1, r0
	strb r1, [r7]
	bl GetWonChapterCount
	movs r1, #0x3f
	ands r0, r1
	lsls r0, r0, #5
	ldrh r2, [r7, #0xa]
	ldr r1, _080A3DD4  @ 0xFFFFF81F
	ands r1, r2
	orrs r1, r0
	strh r1, [r7, #0xa]
	bl GetTacticianName
	adds r1, r0, #0
	mov r0, sl
	bl strcpy
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A3DCC: .4byte 0x00010004
_080A3DD0: .4byte 0xFFFFFC7F
_080A3DD4: .4byte 0xFFFFF81F

	THUMB_FUNC_END sub_80A3B48

	THUMB_FUNC_START SaveChapterRankings
SaveChapterRankings: @ 0x080A3DD8
	push {r4, r5, r6, lr}
	sub sp, #0x30
	bl sub_80A39D8
	adds r6, r0, #0
	ldr r0, _080A3E24  @ gRAMChapterData
	ldrb r0, [r0, #0x14]
	lsrs r4, r0, #6
	movs r0, #1
	ands r4, r0
	add r5, sp, #0x18
	adds r0, r5, #0
	adds r1, r6, #0
	adds r2, r4, #0
	bl sub_80A3B48
	mov r0, sp
	adds r1, r6, #0
	adds r2, r4, #0
	bl sub_80A39E4
	mov r0, sp
	adds r1, r5, #0
	bl sub_80A3A88
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A3E1A
	adds r0, r5, #0
	adds r1, r6, #0
	adds r2, r4, #0
	bl sub_80A3A48
_080A3E1A:
	add sp, #0x30
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A3E24: .4byte gRAMChapterData

	THUMB_FUNC_END SaveChapterRankings

	THUMB_FUNC_START sub_80A3E28
sub_80A3E28: @ 0x080A3E28
	push {lr}
	sub sp, #0x28
	add r0, sp, #0x24
	movs r1, #0
	strh r1, [r0]
	ldr r2, _080A3E48  @ 0x01000012
	mov r1, sp
	bl CpuSet
	mov r0, sp
	bl sub_80A3EA4
	add sp, #0x28
	pop {r0}
	bx r0
	.align 2, 0
_080A3E48: .4byte 0x01000012

	THUMB_FUNC_END sub_80A3E28

	THUMB_FUNC_START sub_80A3E4C
sub_80A3E4C: @ 0x080A3E4C
	push {r4, lr}
	sub sp, #0x24
	adds r4, r0, #0
	bl IsSramWorking
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A3E98
	cmp r4, #0
	bne _080A3E62
	mov r4, sp
_080A3E62:
	ldr r1, _080A3E8C  @ ReadSramFast
	ldr r0, _080A3E90  @ gpSaveDataStart
	ldr r0, [r0]
	ldr r2, _080A3E94  @ 0x00007224
	adds r0, r0, r2
	ldr r3, [r1]
	adds r1, r4, #0
	movs r2, #0x24
	bl _call_via_r3
	adds r0, r4, #0
	movs r1, #0x20
	bl SecureHeaderCalc
	ldrh r1, [r4, #0x20]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r1, r0
	bne _080A3E98
	movs r0, #1
	b _080A3E9A
	.align 2, 0
_080A3E8C: .4byte ReadSramFast
_080A3E90: .4byte gpSaveDataStart
_080A3E94: .4byte 0x00007224
_080A3E98:
	movs r0, #0
_080A3E9A:
	add sp, #0x24
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80A3E4C

	THUMB_FUNC_START sub_80A3EA4
sub_80A3EA4: @ 0x080A3EA4
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0x20
	bl SecureHeaderCalc
	strh r0, [r4, #0x20]
	ldr r0, _080A3EC8  @ gpSaveDataStart
	ldr r1, [r0]
	ldr r0, _080A3ECC  @ 0x00007224
	adds r1, r1, r0
	adds r0, r4, #0
	movs r2, #0x24
	bl WriteAndVerifySramFast
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A3EC8: .4byte gpSaveDataStart
_080A3ECC: .4byte 0x00007224

	THUMB_FUNC_END sub_80A3EA4

	THUMB_FUNC_START sub_80A3ED0
sub_80A3ED0: @ 0x080A3ED0
	push {r4, r5, lr}
	sub sp, #0x24
	adds r4, r0, #0
	adds r5, r1, #0
	cmp r4, #0
	bne _080A3EE4
	mov r4, sp
	mov r0, sp
	bl sub_80A3E4C
_080A3EE4:
	asrs r0, r5, #5
	lsls r0, r0, #2
	adds r0, r4, r0
	movs r1, #0x1f
	ands r1, r5
	ldr r0, [r0]
	lsrs r0, r1
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _080A3EFE
	movs r0, #0
	b _080A3F00
_080A3EFE:
	movs r0, #1
_080A3F00:
	add sp, #0x24
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80A3ED0

	THUMB_FUNC_START sub_80A3F08
sub_80A3F08: @ 0x080A3F08
	push {r4, r5, lr}
	sub sp, #0x24
	adds r4, r0, #0
	adds r5, r1, #0
	cmp r4, #0
	bne _080A3F22
	mov r4, sp
	mov r0, sp
	bl sub_80A3E4C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A3F7C
_080A3F22:
	asrs r0, r5, #5
	lsls r0, r0, #2
	adds r3, r4, r0
	movs r0, #0x1f
	ands r0, r5
	movs r2, #1
	lsls r2, r0
	ldr r1, [r3]
	adds r0, r1, #0
	ands r0, r2
	cmp r0, #0
	bne _080A3F7C
	orrs r1, r2
	str r1, [r3]
	cmp r5, #0x43
	bne _080A3F4C
	ldr r0, [r4]
	movs r1, #4
	orrs r0, r1
	str r0, [r4]
	b _080A3F58
_080A3F4C:
	cmp r5, #2
	bne _080A3F58
	ldr r0, [r4, #8]
	movs r1, #8
	orrs r0, r1
	str r0, [r4, #8]
_080A3F58:
	cmp r5, #0x54
	bne _080A3F68
	ldr r0, [r4, #4]
	movs r1, #0x80
	lsls r1, r1, #9
	orrs r0, r1
	str r0, [r4, #4]
	b _080A3F76
_080A3F68:
	cmp r5, #0x30
	bne _080A3F76
	ldr r0, [r4, #8]
	movs r1, #0x80
	lsls r1, r1, #0xd
	orrs r0, r1
	str r0, [r4, #8]
_080A3F76:
	adds r0, r4, #0
	bl sub_80A3EA4
_080A3F7C:
	add sp, #0x24
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80A3F08

	THUMB_FUNC_START sub_80A3F84
sub_80A3F84: @ 0x080A3F84
	push {lr}
	sub sp, #0x18
	add r0, sp, #0x14
	movs r1, #0
	strh r1, [r0]
	ldr r2, _080A3FA4  @ 0x0100000A
	mov r1, sp
	bl CpuSet
	mov r0, sp
	bl sub_80A4000
	add sp, #0x18
	pop {r0}
	bx r0
	.align 2, 0
_080A3FA4: .4byte 0x0100000A

	THUMB_FUNC_END sub_80A3F84

	THUMB_FUNC_START sub_80A3FA8
sub_80A3FA8: @ 0x080A3FA8
	push {r4, lr}
	sub sp, #0x14
	adds r4, r0, #0
	bl IsSramWorking
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A3FF4
	cmp r4, #0
	bne _080A3FBE
	mov r4, sp
_080A3FBE:
	ldr r1, _080A3FE8  @ ReadSramFast
	ldr r0, _080A3FEC  @ gpSaveDataStart
	ldr r0, [r0]
	ldr r2, _080A3FF0  @ 0x00007248
	adds r0, r0, r2
	ldr r3, [r1]
	adds r1, r4, #0
	movs r2, #0x14
	bl _call_via_r3
	adds r0, r4, #0
	movs r1, #0x10
	bl SecureHeaderCalc
	ldrh r1, [r4, #0x10]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r1, r0
	bne _080A3FF4
	movs r0, #1
	b _080A3FF6
	.align 2, 0
_080A3FE8: .4byte ReadSramFast
_080A3FEC: .4byte gpSaveDataStart
_080A3FF0: .4byte 0x00007248
_080A3FF4:
	movs r0, #0
_080A3FF6:
	add sp, #0x14
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80A3FA8

	THUMB_FUNC_START sub_80A4000
sub_80A4000: @ 0x080A4000
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0x10
	bl SecureHeaderCalc
	strh r0, [r4, #0x10]
	ldr r0, _080A4024  @ gpSaveDataStart
	ldr r1, [r0]
	ldr r0, _080A4028  @ 0x00007248
	adds r1, r1, r0
	adds r0, r4, #0
	movs r2, #0x14
	bl WriteAndVerifySramFast
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A4024: .4byte gpSaveDataStart
_080A4028: .4byte 0x00007248

	THUMB_FUNC_END sub_80A4000

	THUMB_FUNC_START sub_80A402C
sub_80A402C: @ 0x080A402C
	push {r4, r5, lr}
	sub sp, #0x14
	adds r4, r0, #0
	adds r5, r1, #0
	cmp r4, #0
	bne _080A4040
	mov r4, sp
	mov r0, sp
	bl sub_80A3FA8
_080A4040:
	asrs r0, r5, #5
	lsls r0, r0, #2
	adds r0, r4, r0
	movs r1, #0x1f
	ands r1, r5
	ldr r0, [r0]
	lsrs r0, r1
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _080A405A
	movs r0, #0
	b _080A405C
_080A405A:
	movs r0, #1
_080A405C:
	add sp, #0x14
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80A402C

	THUMB_FUNC_START sub_80A4064
sub_80A4064: @ 0x080A4064
	push {r4, r5, lr}
	sub sp, #0x14
	adds r4, r0, #0
	adds r5, r1, #0
	cmp r4, #0
	bne _080A407E
	mov r4, sp
	mov r0, sp
	bl sub_80A3FA8
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A40A0
_080A407E:
	asrs r0, r5, #5
	lsls r0, r0, #2
	adds r3, r4, r0
	movs r0, #0x1f
	ands r0, r5
	movs r2, #1
	lsls r2, r0
	ldr r1, [r3]
	adds r0, r1, #0
	ands r0, r2
	cmp r0, #0
	bne _080A40A0
	orrs r1, r2
	str r1, [r3]
	adds r0, r4, #0
	bl sub_80A4000
_080A40A0:
	add sp, #0x14
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80A4064

	THUMB_FUNC_START sub_80A40A8
sub_80A40A8: @ 0x080A40A8
	push {lr}
	movs r0, #0
	bl LoadAndVerifySecureHeaderSW
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080A40BA
	bl InitNopSecHeader
_080A40BA:
	movs r0, #0
	bl sub_80A38F4
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080A40CA
	bl sub_80A2EA8
_080A40CA:
	movs r0, #0
	bl sub_80A3898
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080A40DA
	bl sub_80A39B4
_080A40DA:
	movs r0, #0
	bl sub_80A3E4C
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080A40EA
	bl sub_80A3E28
_080A40EA:
	movs r0, #0
	bl sub_80A3FA8
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080A40FA
	bl sub_80A3F84
_080A40FA:
	bl sub_80A6AA0
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80A40A8

	THUMB_FUNC_START sub_80A4104
sub_80A4104: @ 0x080A4104
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	mov r8, r0
	mov r0, sp
	movs r4, #0
	strh r4, [r0]
	ldr r5, _080A4184  @ gUnknown_0203E894
	ldr r2, _080A4188  @ 0x01000230
	adds r1, r5, #0
	bl CpuSet
	mov r0, sp
	adds r0, #2
	strh r4, [r0]
	ldr r1, _080A418C  @ gUnknown_0203ECF4
	ldr r2, _080A4190  @ 0x01000060
	bl CpuSet
	adds r7, r5, #0
	ldr r6, _080A4194  @ 0x0000084C
	add r6, r8
	adds r4, r7, #0
	movs r5, #0x45
_080A4136:
	ldr r0, [r4]
	ldr r1, _080A4198  @ 0xFF0000FF
	ands r0, r1
	movs r1, #0x80
	lsls r1, r1, #0xe
	orrs r0, r1
	str r0, [r4]
	adds r0, r7, #0
	adds r1, r6, #0
	movs r2, #0x10
	bl WriteAndVerifySramFast
	adds r6, #0x10
	adds r4, #0x10
	subs r5, #1
	cmp r5, #0
	bge _080A4136
	ldr r4, _080A419C  @ 0x00000CAC
	add r4, r8
	movs r5, #0x2f
_080A415E:
	ldr r0, _080A418C  @ gUnknown_0203ECF4
	adds r1, r4, #0
	movs r2, #4
	bl WriteAndVerifySramFast
	adds r4, #4
	subs r5, #1
	cmp r5, #0
	bge _080A415E
	ldr r1, _080A41A0  @ gUnknown_0203E890
	ldr r0, _080A4194  @ 0x0000084C
	add r0, r8
	str r0, [r1]
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A4184: .4byte gUnknown_0203E894
_080A4188: .4byte 0x01000230
_080A418C: .4byte gUnknown_0203ECF4
_080A4190: .4byte 0x01000060
_080A4194: .4byte 0x0000084C
_080A4198: .4byte 0xFF0000FF
_080A419C: .4byte 0x00000CAC
_080A41A0: .4byte gUnknown_0203E890

	THUMB_FUNC_END sub_80A4104

	THUMB_FUNC_START sub_80A41A4
sub_80A41A4: @ 0x080A41A4
	push {lr}
	ldr r2, _080A41C0  @ gRAMChapterData
	ldrh r1, [r2, #0x2c]
	ldr r0, _080A41C4  @ 0xFFFFE00F
	ands r0, r1
	strh r0, [r2, #0x2c]
	movs r0, #0
	bl SetPartyGoldAmount
	bl sub_80A41C8
	pop {r0}
	bx r0
	.align 2, 0
_080A41C0: .4byte gRAMChapterData
_080A41C4: .4byte 0xFFFFE00F

	THUMB_FUNC_END sub_80A41A4

	THUMB_FUNC_START sub_80A41C8
sub_80A41C8: @ 0x080A41C8
	push {r4, r5, lr}
	sub sp, #4
	mov r0, sp
	movs r5, #0
	strh r5, [r0]
	ldr r1, _080A4208  @ gUnknown_0203E894
	ldr r2, _080A420C  @ 0x01000230
	bl CpuSet
	ldr r4, _080A4210  @ gRAMChapterData
	ldr r0, [r4, #0x38]
	ldr r1, _080A4214  @ 0xF00000FF
	ands r0, r1
	str r0, [r4, #0x38]
	ldrh r1, [r4, #0x36]
	movs r0, #0xf
	ands r0, r1
	strh r0, [r4, #0x36]
	adds r0, r4, #0
	adds r0, #0x38
	strb r5, [r0]
	ldr r0, [r4, #0x34]
	ldr r1, _080A4218  @ 0xFFF00000
	ands r0, r1
	str r0, [r4, #0x34]
	bl GetPartyTotalGoldValue
	str r0, [r4, #0x30]
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A4208: .4byte gUnknown_0203E894
_080A420C: .4byte 0x01000230
_080A4210: .4byte gRAMChapterData
_080A4214: .4byte 0xF00000FF
_080A4218: .4byte 0xFFF00000

	THUMB_FUNC_END sub_80A41C8

	THUMB_FUNC_START LoadBWLEntries
LoadBWLEntries: @ 0x080A421C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080A423C  @ ReadSramFast
	ldr r1, _080A4240  @ gUnknown_0203E894
	movs r2, #0x8c
	lsls r2, r2, #3
	ldr r3, [r0]
	adds r0, r4, #0
	bl _call_via_r3
	ldr r0, _080A4244  @ gUnknown_0203E890
	str r4, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A423C: .4byte ReadSramFast
_080A4240: .4byte gUnknown_0203E894
_080A4244: .4byte gUnknown_0203E890

	THUMB_FUNC_END LoadBWLEntries

	THUMB_FUNC_START LoadSomeTable
LoadSomeTable: @ 0x080A4248
	push {lr}
	ldr r2, _080A425C  @ ReadSramFast
	ldr r1, _080A4260  @ gUnknown_0203ECF4
	ldr r3, [r2]
	movs r2, #0xc0
	bl _call_via_r3
	pop {r0}
	bx r0
	.align 2, 0
_080A425C: .4byte ReadSramFast
_080A4260: .4byte gUnknown_0203ECF4

	THUMB_FUNC_END LoadSomeTable

	THUMB_FUNC_START SaveBWLEntries
SaveBWLEntries: @ 0x080A4264
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080A4280  @ gUnknown_0203E894
	movs r2, #0x8c
	lsls r2, r2, #3
	adds r1, r4, #0
	bl WriteAndVerifySramFast
	ldr r0, _080A4284  @ gUnknown_0203E890
	str r4, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A4280: .4byte gUnknown_0203E894
_080A4284: .4byte gUnknown_0203E890

	THUMB_FUNC_END SaveBWLEntries

	THUMB_FUNC_START SaveChapterWinData
SaveChapterWinData: @ 0x080A4288
	push {lr}
	adds r1, r0, #0
	ldr r0, _080A4298  @ gUnknown_0203ECF4
	movs r2, #0xc0
	bl WriteAndVerifySramFast
	pop {r0}
	bx r0
	.align 2, 0
_080A4298: .4byte gUnknown_0203ECF4

	THUMB_FUNC_END SaveChapterWinData

	THUMB_FUNC_START GetChapterWinDataEntry
GetChapterWinDataEntry: @ 0x080A429C
	lsls r0, r0, #2
	ldr r1, _080A42A4  @ gUnknown_0203ECF4
	adds r0, r0, r1
	bx lr
	.align 2, 0
_080A42A4: .4byte gUnknown_0203ECF4

	THUMB_FUNC_END GetChapterWinDataEntry

	THUMB_FUNC_START sub_80A42A8
sub_80A42A8: @ 0x080A42A8
	ldrh r0, [r0]
	ldr r1, _080A42B8  @ 0x0000FF80
	ands r1, r0
	negs r0, r1
	orrs r0, r1
	lsrs r0, r0, #0x1f
	bx lr
	.align 2, 0
_080A42B8: .4byte 0x0000FF80

	THUMB_FUNC_END sub_80A42A8

	THUMB_FUNC_START GetNextChapterWinDataEntryIndex
GetNextChapterWinDataEntryIndex: @ 0x080A42BC
	push {r4, lr}
	movs r0, #0
	bl GetChapterWinDataEntry
	adds r2, r0, #0
	movs r3, #0
	ldrh r1, [r2]
	ldr r4, _080A42D0  @ 0x0000FF80
	b _080A42DA
	.align 2, 0
_080A42D0: .4byte 0x0000FF80
_080A42D4:
	adds r3, #1
	adds r2, #4
	ldrh r1, [r2]
_080A42DA:
	adds r0, r4, #0
	ands r0, r1
	cmp r0, #0
	bne _080A42D4
	adds r0, r3, #0
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END GetNextChapterWinDataEntryIndex

	THUMB_FUNC_START GetWonChapterCount
GetWonChapterCount: @ 0x080A42EC
	push {r4, r5, r6, lr}
	movs r0, #0
	bl GetChapterWinDataEntry
	adds r4, r0, #0
	movs r5, #0
	ldrh r1, [r4]
	ldr r2, _080A432C  @ 0x0000FF80
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	beq _080A4322
	adds r6, r2, #0
_080A4306:
	ldr r0, [r4]
	lsls r0, r0, #0x19
	lsrs r0, r0, #0x19
	bl DoesThisChapterCount
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A4318
	adds r5, #1
_080A4318:
	adds r4, #4
	ldrh r0, [r4]
	ands r0, r6
	cmp r0, #0
	bne _080A4306
_080A4322:
	adds r0, r5, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_080A432C: .4byte 0x0000FF80

	THUMB_FUNC_END GetWonChapterCount

	THUMB_FUNC_START sub_80A4330
sub_80A4330: @ 0x080A4330
	push {lr}
	bl GetNextChapterWinDataEntryIndex
	cmp r0, #0
	beq _080A4348
	subs r0, #1
	bl GetChapterWinDataEntry
	ldr r0, [r0]
	lsls r0, r0, #0x19
	lsrs r0, r0, #0x19
	b _080A434C
_080A4348:
	movs r0, #1
	negs r0, r0
_080A434C:
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80A4330

	THUMB_FUNC_START RegisterChapterTimeAndTurnCount
RegisterChapterTimeAndTurnCount: @ 0x080A4350
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	bl GetNextChapterWinDataEntryIndex
	bl GetChapterWinDataEntry
	adds r5, r0, #0
	bl GetGameClock
	ldr r1, [r4, #4]
	subs r0, r0, r1
	movs r1, #0xb4
	bl __udivsi3
	adds r6, r0, #0
	ldr r0, _080A43A8  @ 0x0000EA60
	cmp r6, r0
	ble _080A4376
	adds r6, r0, #0
_080A4376:
	ldrh r3, [r4, #0x10]
	movs r0, #0xfa
	lsls r0, r0, #1
	cmp r3, r0
	ble _080A4382
	adds r3, r0, #0
_080A4382:
	movs r0, #0x7f
	ldrb r1, [r4, #0xe]
	ands r1, r0
	ldrb r2, [r5]
	movs r0, #0x80
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r5]
	lsls r2, r3, #7
	ldrh r1, [r5]
	movs r0, #0x7f
	ands r0, r1
	orrs r0, r2
	strh r0, [r5]
	strh r6, [r5, #2]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A43A8: .4byte 0x0000EA60

	THUMB_FUNC_END RegisterChapterTimeAndTurnCount

	THUMB_FUNC_START sub_80A43AC
sub_80A43AC: @ 0x080A43AC
	push {r4, r5, r6, r7, lr}
	movs r6, #0
	bl GetNextChapterWinDataEntryIndex
	adds r5, r0, #0
	movs r4, #0
	cmp r6, r5
	bge _080A43D0
	movs r7, #0xb4
_080A43BE:
	adds r0, r4, #0
	bl GetChapterWinDataEntry
	ldrh r0, [r0, #2]
	muls r0, r7, r0
	adds r6, r6, r0
	adds r4, #1
	cmp r4, r5
	blt _080A43BE
_080A43D0:
	adds r0, r6, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80A43AC

	THUMB_FUNC_START GetGameTotalTurnCount
GetGameTotalTurnCount: @ 0x080A43D8
	push {r4, r5, r6, lr}
	movs r6, #0
	bl GetNextChapterWinDataEntryIndex
	adds r5, r0, #0
	movs r4, #0
	cmp r6, r5
	bge _080A43FC
_080A43E8:
	adds r0, r4, #0
	bl GetChapterWinDataEntry
	ldr r0, [r0]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x17
	adds r6, r6, r0
	adds r4, #1
	cmp r4, r5
	blt _080A43E8
_080A43FC:
	adds r0, r6, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	THUMB_FUNC_END GetGameTotalTurnCount

	THUMB_FUNC_START DoesThisChapterCount
DoesThisChapterCount: @ 0x080A4404
	push {lr}
	adds r1, r0, #0
	ldr r0, _080A441C  @ gRAMChapterData
	ldrb r0, [r0, #0x1b]
	cmp r0, #2
	beq _080A442E
	cmp r0, #2
	bgt _080A4420
	cmp r0, #1
	beq _080A4426
	b _080A4440
	.align 2, 0
_080A441C: .4byte gRAMChapterData
_080A4420:
	cmp r0, #3
	beq _080A4434
	b _080A4440
_080A4426:
	cmp r1, #9
	bhi _080A4440
	movs r0, #1
	b _080A4442
_080A442E:
	adds r0, r1, #0
	subs r0, #0xa
	b _080A4438
_080A4434:
	adds r0, r1, #0
	subs r0, #0x17
_080A4438:
	cmp r0, #0xb
	bhi _080A4440
	movs r0, #1
	b _080A4442
_080A4440:
	movs r0, #0
_080A4442:
	pop {r1}
	bx r1

	THUMB_FUNC_END DoesThisChapterCount

	THUMB_FUNC_START GetGameTotalTime
GetGameTotalTime: @ 0x080A4448
	push {r4, r5, r6, r7, lr}
	movs r7, #0
	bl GetNextChapterWinDataEntryIndex
	adds r6, r0, #0
	movs r5, #0
	cmp r7, r6
	bge _080A447E
_080A4458:
	adds r0, r5, #0
	bl GetChapterWinDataEntry
	adds r4, r0, #0
	ldr r0, [r4]
	lsls r0, r0, #0x19
	lsrs r0, r0, #0x19
	bl DoesThisChapterCount
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A4478
	ldrh r0, [r4, #2]
	movs r1, #0xb4
	muls r0, r1, r0
	adds r7, r7, r0
_080A4478:
	adds r5, #1
	cmp r5, r6
	blt _080A4458
_080A447E:
	adds r0, r7, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END GetGameTotalTime

	THUMB_FUNC_START GetGameTotalTurnCount2
GetGameTotalTurnCount2: @ 0x080A4488
	push {r4, r5, r6, r7, lr}
	movs r7, #0
	bl GetNextChapterWinDataEntryIndex
	adds r6, r0, #0
	movs r5, #0
	cmp r7, r6
	bge _080A44BE
_080A4498:
	adds r0, r5, #0
	bl GetChapterWinDataEntry
	adds r4, r0, #0
	ldr r0, [r4]
	lsls r0, r0, #0x19
	lsrs r0, r0, #0x19
	bl DoesThisChapterCount
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A44B8
	ldr r0, [r4]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x17
	adds r7, r7, r0
_080A44B8:
	adds r5, #1
	cmp r5, r6
	blt _080A4498
_080A44BE:
	adds r0, r7, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END GetGameTotalTurnCount2

	THUMB_FUNC_START sub_80A44C8
sub_80A44C8: @ 0x080A44C8
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r0, #0xb
	ldrsb r0, [r4, r0]
	movs r1, #0xc0
	ands r0, r1
	cmp r0, #0
	bne _080A451E
	ldr r0, [r4]
	ldrb r0, [r0, #4]
	adds r5, r0, #0
	cmp r0, #0x45
	bhi _080A451E
	bl GetCharacterData
	ldrb r0, [r0, #9]
	cmp r0, #0
	beq _080A451E
	lsls r1, r5, #4
	ldr r0, _080A4524  @ gUnknown_0203E884
	adds r2, r1, r0
	cmp r2, #0
	beq _080A451E
	ldrh r3, [r2, #0xc]
	lsls r0, r3, #0x12
	lsrs r1, r0, #0x14
	ldr r0, _080A4528  @ 0x00000F9F
	cmp r1, r0
	bgt _080A4514
	adds r0, r1, #1
	ldr r5, _080A452C  @ 0x00000FFF
	adds r1, r5, #0
	ands r0, r1
	lsls r0, r0, #2
	ldr r1, _080A4530  @ 0xFFFFC003
	ands r1, r3
	orrs r1, r0
	strh r1, [r2, #0xc]
_080A4514:
	ldr r0, [r4]
	ldrb r0, [r0, #4]
	movs r1, #4
	bl BWL_AddFavoritismValue
_080A451E:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A4524: .4byte gUnknown_0203E884
_080A4528: .4byte 0x00000F9F
_080A452C: .4byte 0x00000FFF
_080A4530: .4byte 0xFFFFC003

	THUMB_FUNC_END sub_80A44C8

	THUMB_FUNC_START sub_80A4534
sub_80A4534: @ 0x080A4534
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r5, r4, #0
	cmp r4, #0x45
	bhi _080A4584
	adds r0, r4, #0
	bl GetCharacterData
	ldrb r0, [r0, #9]
	cmp r0, #0
	beq _080A4584
	lsls r1, r4, #4
	ldr r0, _080A458C  @ gUnknown_0203E884
	adds r3, r1, r0
	cmp r3, #0
	beq _080A4584
	ldrb r0, [r3, #0xb]
	ldrb r1, [r3, #0xc]
	movs r2, #3
	ands r1, r2
	lsls r1, r1, #8
	orrs r1, r0
	ldr r0, _080A4590  @ 0x000003E7
	cmp r1, r0
	bgt _080A457C
	adds r0, r1, #1
	strb r0, [r3, #0xb]
	lsrs r0, r0, #8
	ands r0, r2
	ldrb r2, [r3, #0xc]
	movs r1, #4
	negs r1, r1
	ands r1, r2
	orrs r1, r0
	strb r1, [r3, #0xc]
_080A457C:
	adds r0, r5, #0
	movs r1, #0x10
	bl BWL_AddFavoritismValue
_080A4584:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A458C: .4byte gUnknown_0203E884
_080A4590: .4byte 0x000003E7

	THUMB_FUNC_END sub_80A4534

	THUMB_FUNC_START sub_80A4594
sub_80A4594: @ 0x080A4594
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x10
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	mov r8, r4
	bl IsSramWorking
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A4662
	cmp r4, #0x45
	bhi _080A4662
	adds r0, r4, #0
	bl GetCharacterData
	ldrb r0, [r0, #9]
	cmp r0, #0
	beq _080A4662
	mov r0, r8
	lsls r6, r0, #4
	ldr r0, _080A4670  @ gUnknown_0203E884
	adds r5, r6, r0
	cmp r5, #0
	beq _080A4662
	ldr r1, _080A4674  @ gGameState
	adds r0, r1, #0
	adds r0, #0x3c
	ldrb r0, [r0]
	cmp r0, #1
	beq _080A4662
	ldr r7, _080A4678  @ gRAMChapterData
	ldrb r2, [r7, #0x14]
	movs r0, #8
	ands r0, r2
	cmp r0, #0
	bne _080A4662
	ldrb r1, [r1, #4]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	bne _080A4662
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	bne _080A4662
	movs r0, #0x80
	ands r0, r2
	cmp r0, #0
	bne _080A4662
	ldrb r0, [r5]
	cmp r0, #0xc7
	bhi _080A4662
	adds r0, #1
	strb r0, [r5]
	movs r1, #0x80
	negs r1, r1
	mov r0, r8
	bl BWL_AddFavoritismValue
	bl sub_80A63B0
	adds r4, r0, #0
	adds r4, #3
	adds r0, r4, #0
	bl GetSaveDataLocation
	adds r1, r0, #0
	ldr r2, _080A467C  @ 0x000019E4
	adds r0, r6, r2
	adds r1, r1, r0
	adds r0, r5, #0
	movs r2, #1
	bl WriteAndVerifySramFast
	mov r0, sp
	adds r1, r4, #0
	bl SaveMetadata_Check
	mov r0, sp
	adds r1, r4, #0
	bl SaveMetadata_Generate
	ldrb r0, [r7, #0xc]
	bl GetSaveDataLocation
	adds r1, r0, #0
	ldr r2, _080A4680  @ 0x0000083C
	adds r0, r6, r2
	adds r1, r1, r0
	adds r0, r5, #0
	movs r2, #3
	bl WriteAndVerifySramFast
	ldrb r1, [r7, #0xc]
	mov r0, sp
	bl SaveMetadata_Check
	ldrb r1, [r7, #0xc]
	mov r0, sp
	bl SaveMetadata_Generate
_080A4662:
	add sp, #0x10
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A4670: .4byte gUnknown_0203E884
_080A4674: .4byte gGameState
_080A4678: .4byte gRAMChapterData
_080A467C: .4byte 0x000019E4
_080A4680: .4byte 0x0000083C

	THUMB_FUNC_END sub_80A4594

	THUMB_FUNC_START BWL_AddWinOrLossIdk
BWL_AddWinOrLossIdk: @ 0x080A4684
	push {r4, r5, r6, lr}
	adds r5, r2, #0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r4, r0, #0
	lsls r1, r1, #0x18
	lsrs r6, r1, #0x18
	cmp r0, #0x45
	bhi _080A4734
	bl GetCharacterData
	ldrb r0, [r0, #9]
	cmp r0, #0
	beq _080A4734
	lsls r1, r4, #4
	ldr r0, _080A46DC  @ gUnknown_0203E884
	adds r4, r1, r0
	cmp r4, #0
	beq _080A4734
	bl GetChapterThing
	cmp r0, #0
	blt _080A46E8
	cmp r0, #1
	ble _080A46E8
	cmp r0, #2
	bne _080A46E8
	ldrb r0, [r4, #0xe]
	movs r1, #0x80
	orrs r0, r1
	strb r0, [r4, #0xe]
	ldr r0, _080A46E0  @ gUnknown_03005280
	ldrb r1, [r0, #0x11]
	movs r0, #0x3f
	ands r1, r0
	ldrb r2, [r4, #5]
	movs r0, #0x40
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r4, #5]
	ldr r3, _080A46E4  @ gRAMChapterData
	b _080A4706
	.align 2, 0
_080A46DC: .4byte gUnknown_0203E884
_080A46E0: .4byte gUnknown_03005280
_080A46E4: .4byte gRAMChapterData
_080A46E8:
	ldrb r1, [r4, #0xe]
	movs r0, #0x7f
	ands r0, r1
	strb r0, [r4, #0xe]
	ldr r3, _080A473C  @ gRAMChapterData
	movs r1, #0xe
	ldrsb r1, [r3, r1]
	movs r0, #0x3f
	ands r1, r0
	ldrb r2, [r4, #5]
	movs r0, #0x40
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r4, #5]
_080A4706:
	ldrh r2, [r3, #0x10]
	ldr r0, _080A4740  @ 0x000003FF
	ands r2, r0
	lsls r2, r2, #0xe
	ldr r0, [r4, #4]
	ldr r1, _080A4744  @ 0xFF003FFF
	ands r0, r1
	orrs r0, r2
	str r0, [r4, #4]
	lsls r2, r6, #0xe
	ldr r0, [r4, #0xc]
	ldr r1, _080A4748  @ 0xFF803FFF
	ands r0, r1
	orrs r0, r2
	str r0, [r4, #0xc]
	movs r0, #0xf
	ands r5, r0
	ldrb r1, [r4, #9]
	movs r0, #0x10
	negs r0, r0
	ands r0, r1
	orrs r0, r5
	strb r0, [r4, #9]
_080A4734:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A473C: .4byte gRAMChapterData
_080A4740: .4byte 0x000003FF
_080A4744: .4byte 0xFF003FFF
_080A4748: .4byte 0xFF803FFF

	THUMB_FUNC_END BWL_AddWinOrLossIdk

	THUMB_FUNC_START BWL_IncrementMoveValue
BWL_IncrementMoveValue: @ 0x080A474C
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r5, r4, #0
	cmp r4, #0x45
	bhi _080A4780
	adds r0, r4, #0
	bl GetCharacterData
	ldrb r0, [r0, #9]
	cmp r0, #0
	beq _080A4780
	lsls r1, r4, #4
	ldr r0, _080A4788  @ gUnknown_0203E884
	adds r1, r1, r0
	cmp r1, #0
	beq _080A4780
	ldrb r0, [r1, #3]
	cmp r0, #0xc7
	bhi _080A4778
	adds r0, #1
	strb r0, [r1, #3]
_080A4778:
	adds r0, r5, #0
	movs r1, #2
	bl BWL_AddFavoritismValue
_080A4780:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A4788: .4byte gUnknown_0203E884

	THUMB_FUNC_END BWL_IncrementMoveValue

	THUMB_FUNC_START BWL_IncrementStatScreenViews
BWL_IncrementStatScreenViews: @ 0x080A478C
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r5, r4, #0
	cmp r4, #0x45
	bhi _080A47C0
	adds r0, r4, #0
	bl GetCharacterData
	ldrb r0, [r0, #9]
	cmp r0, #0
	beq _080A47C0
	lsls r1, r4, #4
	ldr r0, _080A47C8  @ gUnknown_0203E884
	adds r1, r1, r0
	cmp r1, #0
	beq _080A47C0
	ldrb r0, [r1, #4]
	cmp r0, #0xc7
	bhi _080A47B8
	adds r0, #1
	strb r0, [r1, #4]
_080A47B8:
	adds r0, r5, #0
	movs r1, #2
	bl BWL_AddFavoritismValue
_080A47C0:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A47C8: .4byte gUnknown_0203E884

	THUMB_FUNC_END BWL_IncrementStatScreenViews

	THUMB_FUNC_START BWL_IncrementDeployCountMaybe
BWL_IncrementDeployCountMaybe: @ 0x080A47CC
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r5, r4, #0
	cmp r4, #0x45
	bhi _080A4810
	adds r0, r4, #0
	bl GetCharacterData
	ldrb r0, [r0, #9]
	cmp r0, #0
	beq _080A4810
	lsls r1, r4, #4
	ldr r0, _080A4818  @ gUnknown_0203E884
	adds r2, r1, r0
	cmp r2, #0
	beq _080A4810
	ldrb r3, [r2, #7]
	lsls r0, r3, #0x1a
	lsrs r0, r0, #0x1a
	cmp r0, #0x3b
	bgt _080A4808
	adds r1, r0, #1
	movs r0, #0x3f
	ands r1, r0
	movs r0, #0x40
	negs r0, r0
	ands r0, r3
	orrs r0, r1
	strb r0, [r2, #7]
_080A4808:
	adds r0, r5, #0
	movs r1, #0x40
	bl BWL_AddFavoritismValue
_080A4810:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A4818: .4byte gUnknown_0203E884

	THUMB_FUNC_END BWL_IncrementDeployCountMaybe

	THUMB_FUNC_START BWL_AddTilesMoved
BWL_AddTilesMoved: @ 0x080A481C
	push {r4, r5, r6, lr}
	adds r5, r1, #0
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r6, r4, #0
	cmp r4, #0x45
	bhi _080A4870
	adds r0, r4, #0
	bl GetCharacterData
	ldrb r0, [r0, #9]
	cmp r0, #0
	beq _080A4870
	lsls r1, r4, #4
	ldr r0, _080A4878  @ gUnknown_0203E884
	adds r3, r1, r0
	cmp r3, #0
	beq _080A4870
	ldrb r4, [r3, #7]
	lsrs r1, r4, #6
	ldrb r0, [r3, #8]
	lsls r0, r0, #2
	orrs r0, r1
	adds r2, r0, r5
	movs r0, #0xfa
	lsls r0, r0, #2
	cmp r2, r0
	ble _080A4856
	adds r2, r0, #0
_080A4856:
	movs r0, #3
	ands r0, r2
	lsls r0, r0, #6
	movs r1, #0x3f
	ands r1, r4
	orrs r1, r0
	strb r1, [r3, #7]
	lsrs r0, r2, #2
	strb r0, [r3, #8]
	adds r0, r6, #0
	movs r1, #2
	bl BWL_AddFavoritismValue
_080A4870:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A4878: .4byte gUnknown_0203E884

	THUMB_FUNC_END BWL_AddTilesMoved

	THUMB_FUNC_START BWL_AddExpGained
BWL_AddExpGained: @ 0x080A487C
	push {r4, r5, r6, lr}
	adds r5, r1, #0
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r6, r4, #0
	cmp r4, #0x45
	bhi _080A48C8
	adds r0, r4, #0
	bl GetCharacterData
	ldrb r0, [r0, #9]
	cmp r0, #0
	beq _080A48C8
	lsls r1, r4, #4
	ldr r0, _080A48D0  @ gUnknown_0203E884
	adds r2, r1, r0
	cmp r2, #0
	beq _080A48C8
	ldr r3, [r2, #8]
	lsls r0, r3, #8
	lsrs r0, r0, #0x14
	adds r0, r0, r5
	movs r1, #0xfa
	lsls r1, r1, #4
	cmp r0, r1
	ble _080A48B2
	adds r0, r1, #0
_080A48B2:
	ldr r1, _080A48D4  @ 0x00000FFF
	ands r1, r0
	lsls r1, r1, #0xc
	ldr r0, _080A48D8  @ 0xFF000FFF
	ands r0, r3
	orrs r0, r1
	str r0, [r2, #8]
	adds r0, r6, #0
	adds r1, r5, #0
	bl BWL_AddFavoritismValue
_080A48C8:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A48D0: .4byte gUnknown_0203E884
_080A48D4: .4byte 0x00000FFF
_080A48D8: .4byte 0xFF000FFF

	THUMB_FUNC_END BWL_AddExpGained

	THUMB_FUNC_START StoreSomeUnitSetFlags
StoreSomeUnitSetFlags: @ 0x080A48DC
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #8
	negs r1, r1
	bl BWL_AddFavoritismValue
	pop {r0}
	bx r0

	THUMB_FUNC_END StoreSomeUnitSetFlags

	THUMB_FUNC_START sub_80A48F0
sub_80A48F0: @ 0x080A48F0
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _080A4900  @ 0xFFFFFF00
	bl BWL_AddFavoritismValue
	pop {r0}
	bx r0
	.align 2, 0
_080A4900: .4byte 0xFFFFFF00

	THUMB_FUNC_END sub_80A48F0

	THUMB_FUNC_START sub_80A4904
sub_80A4904: @ 0x080A4904
	push {lr}
	movs r3, #0
	ldr r2, _080A4924  @ gUnknown_0203E894
	movs r1, #0x45
_080A490C:
	ldrh r0, [r2, #0xc]
	lsls r0, r0, #0x12
	lsrs r0, r0, #0x14
	adds r3, r3, r0
	adds r2, #0x10
	subs r1, #1
	cmp r1, #0
	bge _080A490C
	adds r0, r3, #0
	pop {r1}
	bx r1
	.align 2, 0
_080A4924: .4byte gUnknown_0203E894

	THUMB_FUNC_END sub_80A4904

	THUMB_FUNC_START sub_80A4928
sub_80A4928: @ 0x080A4928
	push {r4, r5, lr}
	movs r4, #0
	ldr r0, _080A4954  @ gUnknown_0203E894
	movs r5, #3
	adds r2, r0, #0
	adds r2, #0xb
	movs r3, #0x45
_080A4936:
	ldrb r1, [r2]
	ldrb r0, [r2, #1]
	ands r0, r5
	lsls r0, r0, #8
	orrs r0, r1
	adds r4, r4, r0
	adds r2, #0x10
	subs r3, #1
	cmp r3, #0
	bge _080A4936
	adds r0, r4, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080A4954: .4byte gUnknown_0203E894

	THUMB_FUNC_END sub_80A4928

	THUMB_FUNC_START sub_80A4958
sub_80A4958: @ 0x080A4958
	push {lr}
	movs r3, #0
	ldr r2, _080A4974  @ gUnknown_0203E894
	movs r1, #0x45
_080A4960:
	ldrb r0, [r2]
	adds r3, r3, r0
	adds r2, #0x10
	subs r1, #1
	cmp r1, #0
	bge _080A4960
	adds r0, r3, #0
	pop {r1}
	bx r1
	.align 2, 0
_080A4974: .4byte gUnknown_0203E894

	THUMB_FUNC_END sub_80A4958

	THUMB_FUNC_START sub_80A4978
sub_80A4978: @ 0x080A4978
	push {r4, r5, r6, lr}
	movs r6, #0
	ldr r5, _080A49A0  @ gUnknown_0203E894
	movs r4, #0x45
_080A4980:
	ldr r0, [r5, #8]
	lsls r0, r0, #8
	lsrs r0, r0, #0x14
	movs r1, #0x64
	bl __divsi3
	adds r6, r6, r0
	adds r5, #0x10
	subs r4, #1
	cmp r4, #0
	bge _080A4980
	adds r0, r6, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_080A49A0: .4byte gUnknown_0203E894

	THUMB_FUNC_END sub_80A4978

	THUMB_FUNC_START sub_80A49A4
sub_80A49A4: @ 0x080A49A4
	push {lr}
	movs r3, #0
	ldr r2, _080A49C4  @ gUnknown_0203E894
	movs r1, #0x45
_080A49AC:
	ldr r0, [r2, #8]
	lsls r0, r0, #8
	lsrs r0, r0, #0x14
	adds r3, r3, r0
	adds r2, #0x10
	subs r1, #1
	cmp r1, #0
	bge _080A49AC
	adds r0, r3, #0
	pop {r1}
	bx r1
	.align 2, 0
_080A49C4: .4byte gUnknown_0203E894

	THUMB_FUNC_END sub_80A49A4

	THUMB_FUNC_START sub_80A49C8
sub_80A49C8: @ 0x080A49C8
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r4, r0, #0
	cmp r0, #0x45
	bhi _080A49E8
	bl GetCharacterData
	ldrb r0, [r0, #9]
	cmp r0, #0
	beq _080A49E8
	lsls r1, r4, #4
	ldr r0, _080A49EC  @ gUnknown_0203E884
	adds r1, r1, r0
	cmp r1, #0
	bne _080A49F0
_080A49E8:
	movs r0, #0
	b _080A49F6
	.align 2, 0
_080A49EC: .4byte gUnknown_0203E884
_080A49F0:
	ldr r0, [r1, #8]
	lsls r0, r0, #8
	lsrs r0, r0, #0x14
_080A49F6:
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80A49C8

	THUMB_FUNC_START sub_80A49FC
sub_80A49FC: @ 0x080A49FC
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r4, r0, #0
	cmp r0, #0x45
	bhi _080A4A1C
	bl GetCharacterData
	ldrb r0, [r0, #9]
	cmp r0, #0
	beq _080A4A1C
	lsls r1, r4, #4
	ldr r0, _080A4A24  @ gUnknown_0203E884
	adds r0, r1, r0
	cmp r0, #0
	bne _080A4A28
_080A4A1C:
	movs r0, #0x80
	lsls r0, r0, #6
	b _080A4A2E
	.align 2, 0
_080A4A24: .4byte gUnknown_0203E884
_080A4A28:
	ldr r0, [r0]
	lsls r0, r0, #8
	lsrs r0, r0, #0x16
_080A4A2E:
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80A49FC

	THUMB_FUNC_START BWL_AddFavoritismValue
BWL_AddFavoritismValue: @ 0x080A4A34
	push {r4, r5, lr}
	adds r5, r1, #0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r4, r0, #0
	cmp r0, #0x45
	bhi _080A4A96
	bl GetCharacterData
	ldrb r0, [r0, #9]
	cmp r0, #0
	beq _080A4A96
	lsls r1, r4, #4
	ldr r0, _080A4A70  @ gUnknown_0203E884
	adds r3, r1, r0
	cmp r3, #0
	beq _080A4A96
	ldr r2, [r3]
	lsls r0, r2, #8
	lsrs r0, r0, #0x10
	adds r1, r0, r5
	movs r0, #0x80
	lsls r0, r0, #7
	cmp r1, r0
	ble _080A4A78
	ldr r0, _080A4A74  @ 0xFF0000FF
	ands r0, r2
	movs r1, #0x80
	lsls r1, r1, #0xf
	b _080A4A92
	.align 2, 0
_080A4A70: .4byte gUnknown_0203E884
_080A4A74: .4byte 0xFF0000FF
_080A4A78:
	cmp r1, #0
	bge _080A4A88
	ldr r0, _080A4A84  @ 0xFF0000FF
	ands r2, r0
	str r2, [r3]
	b _080A4A96
	.align 2, 0
_080A4A84: .4byte 0xFF0000FF
_080A4A88:
	ldr r0, _080A4A9C  @ 0x0000FFFF
	ands r1, r0
	lsls r1, r1, #8
	ldr r0, _080A4AA0  @ 0xFF0000FF
	ands r0, r2
_080A4A92:
	orrs r0, r1
	str r0, [r3]
_080A4A96:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A4A9C: .4byte 0x0000FFFF
_080A4AA0: .4byte 0xFF0000FF

	THUMB_FUNC_END BWL_AddFavoritismValue

	THUMB_FUNC_START sub_80A4AA4
sub_80A4AA4: @ 0x080A4AA4
	push {r4, r5, r6, r7, lr}
	movs r7, #0
	movs r5, #0
	ldr r4, _080A4B10  @ gBattleActor
	adds r0, r4, #0
	bl GetUnitCurrentHp
	cmp r0, #0
	bne _080A4ABA
	adds r7, r4, #0
	ldr r5, _080A4B14  @ gBattleTarget
_080A4ABA:
	ldr r6, _080A4B14  @ gBattleTarget
	adds r0, r6, #0
	bl GetUnitCurrentHp
	cmp r0, #0
	bne _080A4ACA
	adds r7, r6, #0
	adds r5, r4, #0
_080A4ACA:
	cmp r7, #0
	beq _080A4B08
	cmp r5, #0
	beq _080A4AF0
	movs r0, #0xb
	ldrsb r0, [r5, r0]
	movs r1, #0xc0
	ands r0, r1
	cmp r0, #0
	bne _080A4AF0
	ldr r0, [r5]
	ldrb r0, [r0, #4]
	bl sub_80A4534
	ldr r1, _080A4B18  @ gRAMChapterData
	adds r1, #0x48
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
_080A4AF0:
	cmp r7, #0
	beq _080A4B08
	movs r0, #0xb
	ldrsb r0, [r7, r0]
	movs r1, #0xc0
	ands r0, r1
	cmp r0, #0
	bne _080A4B08
	ldr r0, [r7]
	ldrb r0, [r0, #4]
	bl sub_80A4594
_080A4B08:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A4B10: .4byte gBattleActor
_080A4B14: .4byte gBattleTarget
_080A4B18: .4byte gRAMChapterData

	THUMB_FUNC_END sub_80A4AA4

	THUMB_FUNC_START sub_80A4B1C
sub_80A4B1C: @ 0x080A4B1C
	push {r4, r5, r6, lr}
	sub sp, #0xb0
	adds r6, r0, #0
	mov r0, sp
	bl LoadAndVerifySecureHeaderSW
	movs r4, #0
	add r1, sp, #0x14
_080A4B2C:
	adds r0, r1, r4
	ldrb r0, [r0]
	cmp r0, r6
	beq _080A4B58
	adds r4, #1
	cmp r4, #0xb
	ble _080A4B2C
	movs r4, #0
	add r5, sp, #0x64
_080A4B3E:
	adds r0, r4, #0
	bl sub_80A5218
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A4B5C
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_80A522C
	ldrb r0, [r5, #0x18]
	cmp r0, r6
	bne _080A4B5C
_080A4B58:
	movs r0, #0
	b _080A4B64
_080A4B5C:
	adds r4, #1
	cmp r4, #2
	ble _080A4B3E
	movs r0, #1
_080A4B64:
	add sp, #0xb0
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80A4B1C

	THUMB_FUNC_START sub_80A4B6C
sub_80A4B6C: @ 0x080A4B6C
	push {r4, lr}
	movs r4, #1
_080A4B70:
	adds r0, r4, #0
	bl sub_80A4B1C
	adds r1, r0, #0
	lsls r1, r1, #0x18
	cmp r1, #0
	beq _080A4B82
	adds r0, r4, #0
	b _080A4B88
_080A4B82:
	adds r4, #1
	cmp r4, #0xff
	ble _080A4B70
_080A4B88:
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80A4B6C

	THUMB_FUNC_START sub_80A4B90
sub_80A4B90: @ 0x080A4B90
	push {lr}
	movs r2, #0
	movs r1, #0
	adds r3, r0, #0
	adds r3, #0x14
_080A4B9A:
	adds r0, r3, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _080A4BA4
	adds r2, #1
_080A4BA4:
	adds r1, #1
	cmp r1, #0xb
	ble _080A4B9A
	adds r0, r2, #0
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80A4B90

	THUMB_FUNC_START sub_80A4BB0
sub_80A4BB0: @ 0x080A4BB0
	push {lr}
	sub sp, #0x64
	mov r0, sp
	bl LoadAndVerifySecureHeaderSW
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A4BC8
	mov r0, sp
	bl sub_80A4B90
	b _080A4BCA
_080A4BC8:
	movs r0, #0
_080A4BCA:
	add sp, #0x64
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80A4BB0

	THUMB_FUNC_START sub_80A4BD0
sub_80A4BD0: @ 0x080A4BD0
	push {r4, lr}
	movs r3, #0
	adds r4, r0, #0
	adds r4, #0x14
	adds r2, r4, #0
_080A4BDA:
	adds r0, r2, r3
	ldrb r0, [r0]
	cmp r0, r1
	beq _080A4BFE
	adds r3, #1
	cmp r3, #0xb
	ble _080A4BDA
	movs r3, #0
_080A4BEA:
	adds r2, r4, r3
	ldrb r0, [r2]
	cmp r0, #0
	bne _080A4BF8
	strb r1, [r2]
	movs r0, #1
	b _080A4C00
_080A4BF8:
	adds r3, #1
	cmp r3, #0xb
	ble _080A4BEA
_080A4BFE:
	movs r0, #0
_080A4C00:
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80A4BD0

	THUMB_FUNC_START sub_80A4C08
sub_80A4C08: @ 0x080A4C08
	ldr r0, _080A4C10  @ gRAMChapterData
	ldrb r0, [r0, #0x1b]
	bx lr
	.align 2, 0
_080A4C10: .4byte gRAMChapterData

	THUMB_FUNC_END sub_80A4C08

	THUMB_FUNC_START DeclareCompletedPlaythrough
DeclareCompletedPlaythrough: @ 0x080A4C14
	push {r4, r5, r6, r7, lr}
	sub sp, #0x64
	bl sub_80A4C08
	adds r5, r0, #0
	ldr r6, _080A4C6C  @ gRAMChapterData
	ldrb r0, [r6, #0x14]
	lsrs r4, r0, #6
	movs r0, #1
	ands r4, r0
	adds r0, r6, #0
	adds r0, #0x42
	ldrb r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r7, r0, #0x1f
	mov r0, sp
	bl LoadAndVerifySecureHeaderSW
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080A4C48
	bl InitNopSecHeader
	mov r0, sp
	bl LoadAndVerifySecureHeaderSW
_080A4C48:
	ldrb r1, [r6, #0x18]
	mov r0, sp
	bl sub_80A4BD0
	mov r2, sp
	ldrb r1, [r2, #0xe]
	movs r0, #1
	adds r3, r1, #0
	orrs r3, r0
	strb r3, [r2, #0xe]
	cmp r5, #2
	beq _080A4C70
	cmp r5, #2
	ble _080A4CA6
	cmp r5, #3
	beq _080A4C8A
	b _080A4CA6
	.align 2, 0
_080A4C6C: .4byte gRAMChapterData
_080A4C70:
	cmp r7, #0
	bne _080A4C7A
	mov r1, sp
	movs r0, #4
	b _080A4CA2
_080A4C7A:
	cmp r4, #0
	beq _080A4C84
	mov r1, sp
	movs r0, #0x10
	b _080A4CA2
_080A4C84:
	mov r1, sp
	movs r0, #8
	b _080A4CA2
_080A4C8A:
	cmp r7, #0
	bne _080A4C94
	mov r1, sp
	movs r0, #0x20
	b _080A4CA2
_080A4C94:
	cmp r4, #0
	beq _080A4C9E
	mov r1, sp
	movs r0, #0x80
	b _080A4CA2
_080A4C9E:
	mov r1, sp
	movs r0, #0x40
_080A4CA2:
	orrs r3, r0
	strb r3, [r1, #0xe]
_080A4CA6:
	mov r0, sp
	bl SaveSecureHeader
	add sp, #0x64
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END DeclareCompletedPlaythrough

	THUMB_FUNC_START sub_80A4CB4
sub_80A4CB4: @ 0x080A4CB4
	push {lr}
	sub sp, #0x64
	mov r0, sp
	bl LoadAndVerifySecureHeaderSW
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080A4CC8
	movs r0, #0
	b _080A4CD0
_080A4CC8:
	mov r0, sp
	ldrb r0, [r0, #0xf]
	lsls r0, r0, #0x1f
	lsrs r0, r0, #0x1f
_080A4CD0:
	add sp, #0x64
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80A4CB4

	THUMB_FUNC_START sub_80A4CD8
sub_80A4CD8: @ 0x080A4CD8
	push {lr}
	sub sp, #0x64
	mov r0, sp
	bl LoadAndVerifySecureHeaderSW
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A4CF6
	mov r0, sp
	ldrb r1, [r0, #0xf]
	movs r2, #1
	orrs r1, r2
	strb r1, [r0, #0xf]
	bl SaveSecureHeader
_080A4CF6:
	add sp, #0x64
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80A4CD8

	THUMB_FUNC_START BWL_GetEntry
BWL_GetEntry: @ 0x080A4CFC
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r4, r0, #0
	cmp r4, #0x45
	bhi _080A4D20
	adds r0, r4, #0
	bl GetCharacterData
	ldrb r0, [r0, #9]
	cmp r0, #0
	beq _080A4D20
	lsls r0, r4, #4
	ldr r1, _080A4D1C  @ gUnknown_0203E884
	adds r0, r0, r1
	b _080A4D22
	.align 2, 0
_080A4D1C: .4byte gUnknown_0203E884
_080A4D20:
	movs r0, #0
_080A4D22:
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END BWL_GetEntry

	THUMB_FUNC_START sub_80A4D28
sub_80A4D28: @ 0x080A4D28
	ldr r0, _080A4D30  @ gUnknown_0203EDB4
	ldr r0, [r0]
	bx lr
	.align 2, 0
_080A4D30: .4byte gUnknown_0203EDB4

	THUMB_FUNC_END sub_80A4D28

	THUMB_FUNC_START Set0203EDB4
Set0203EDB4: @ 0x080A4D34
	ldr r1, _080A4D3C  @ gUnknown_0203EDB4
	str r0, [r1]
	bx lr
	.align 2, 0
_080A4D3C: .4byte gUnknown_0203EDB4

	THUMB_FUNC_END Set0203EDB4

	THUMB_FUNC_START Save0203EDB4
Save0203EDB4: @ 0x080A4D40
	push {lr}
	adds r1, r0, #0
	ldr r0, _080A4D54  @ gUnknown_0203EDB4
	ldr r2, _080A4D58  @ 0x00000D88
	adds r1, r1, r2
	movs r2, #4
	bl WriteAndVerifySramFast
	pop {r0}
	bx r0
	.align 2, 0
_080A4D54: .4byte gUnknown_0203EDB4
_080A4D58: .4byte 0x00000D88

	THUMB_FUNC_END Save0203EDB4

	THUMB_FUNC_START Load0203EDB4
Load0203EDB4: @ 0x080A4D5C
	push {lr}
	ldr r2, _080A4D74  @ ReadSramFast
	ldr r1, _080A4D78  @ 0x00000D88
	adds r0, r0, r1
	ldr r1, _080A4D7C  @ gUnknown_0203EDB4
	ldr r3, [r2]
	movs r2, #4
	bl _call_via_r3
	pop {r0}
	bx r0
	.align 2, 0
_080A4D74: .4byte ReadSramFast
_080A4D78: .4byte 0x00000D88
_080A4D7C: .4byte gUnknown_0203EDB4

	THUMB_FUNC_END Load0203EDB4

	THUMB_FUNC_START sub_80A4D80
sub_80A4D80: @ 0x080A4D80
	push {r4, lr}
	sub sp, #0x64
	adds r4, r0, #0
	mov r0, sp
	bl LoadAndVerifySecureHeaderSW
	mov r0, sp
	adds r0, #0x62
	strb r4, [r0]
	mov r0, sp
	bl ForceSaveSecureHeader
	add sp, #0x64
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80A4D80

	THUMB_FUNC_START sub_80A4DA0
sub_80A4DA0: @ 0x080A4DA0
	push {lr}
	sub sp, #0x64
	mov r0, sp
	bl LoadAndVerifySecureHeaderSW
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A4DBE
	mov r0, sp
	adds r0, #0x62
	ldrb r0, [r0]
	cmp r0, #2
	bgt _080A4DBE
	cmp r0, #0
	bge _080A4DC0
_080A4DBE:
	movs r0, #0
_080A4DC0:
	add sp, #0x64
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80A4DA0

	THUMB_FUNC_START sub_80A4DC8
sub_80A4DC8: @ 0x080A4DC8
	push {r4, r5, lr}
	sub sp, #0x5c
	adds r5, r0, #0
	movs r0, #3
	bl sub_80A5DA8
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A4DF0
	add r4, sp, #0x10
	movs r0, #3
	adds r1, r4, #0
	bl sub_80A5DFC
	ldrb r0, [r4, #0xc]
	cmp r0, r5
	bne _080A4DF0
	movs r0, #3
	bl sub_80A5A20
_080A4DF0:
	mov r1, sp
	movs r0, #0xff
	strb r0, [r1, #6]
	mov r0, sp
	adds r1, r5, #0
	bl SaveMetadata_Generate
	add sp, #0x5c
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80A4DC8

	THUMB_FUNC_START sub_80A4E08
sub_80A4E08: @ 0x080A4E08
	push {r4, r5, r6, lr}
	mov r6, r9
	mov r5, r8
	push {r5, r6}
	sub sp, #0x10
	mov r9, r1
	bl CheckSaveAndGetPointer
	adds r6, r0, #0
	mov r0, r9
	bl GetSaveDataLocation
	mov r8, r0
	ldr r0, _080A4E60  @ ReadSramFast
	ldr r4, _080A4E64  @ gUnknown_02020188
	ldr r5, _080A4E68  @ 0x00000DC8
	ldr r3, [r0]
	adds r0, r6, #0
	adds r1, r4, #0
	adds r2, r5, #0
	bl _call_via_r3
	adds r0, r4, #0
	mov r1, r8
	adds r2, r5, #0
	bl WriteAndVerifySramFast
	ldr r0, _080A4E6C  @ 0x00040624
	str r0, [sp]
	mov r1, sp
	movs r0, #0
	strb r0, [r1, #6]
	mov r0, sp
	mov r1, r9
	bl SaveMetadata_Generate
	add sp, #0x10
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A4E60: .4byte ReadSramFast
_080A4E64: .4byte gUnknown_02020188
_080A4E68: .4byte 0x00000DC8
_080A4E6C: .4byte 0x00040624

	THUMB_FUNC_END sub_80A4E08

	THUMB_FUNC_START sub_80A4E70
sub_80A4E70: @ 0x080A4E70
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x54
	mov sl, r0
	adds r5, r1, #0
	mov r8, r2
	adds r4, r3, #0
	bl GetSaveDataLocation
	adds r7, r0, #0
	mov r0, r8
	cmp r0, #0
	bne _080A4E96
	ldr r0, _080A4FE4  @ gRAMChapterData
	ldrb r0, [r0, #0x1b]
	mov r8, r0
_080A4E96:
	cmp r4, #0
	bge _080A4EA4
	ldr r0, _080A4FE4  @ gRAMChapterData
	adds r0, #0x42
	ldrb r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r4, r0, #0x1f
_080A4EA4:
	movs r0, #0
	bl SetGameClock
	lsls r1, r4, #0x18
	asrs r1, r1, #0x18
	adds r0, r5, #0
	bl InitPlaythroughState
	bl ClearUnits
	bl ClearConvoyItems
	bl sub_8083D18
	movs r0, #3
	bl sub_80A5A20
	ldr r6, _080A4FE4  @ gRAMChapterData
	adds r2, r6, #0
	adds r2, #0x2c
	ldrb r1, [r2]
	movs r0, #2
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	ldrh r1, [r6, #0x2c]
	ldr r0, _080A4FE8  @ 0xFFFFE00F
	ands r0, r1
	strh r0, [r6, #0x2c]
	add r0, sp, #0x34
	movs r4, #0
	strh r4, [r0]
	adds r1, r6, #0
	adds r1, #0x30
	ldr r2, _080A4FEC  @ 0x01000008
	bl CpuSet
	ldr r0, [r6, #0x2c]
	ldr r1, _080A4FF0  @ 0xFF801FFF
	ands r0, r1
	str r0, [r6, #0x2c]
	movs r5, #0
	mov r1, r8
	strb r1, [r6, #0x1b]
	adds r2, r6, #0
	adds r2, #0x2b
	ldrb r0, [r2]
	movs r1, #1
	orrs r0, r1
	strb r0, [r2]
	adds r0, r6, #0
	adds r0, #0x20
	strb r4, [r0]
	strb r4, [r6, #0xe]
	bl sub_80A4B6C
	strb r0, [r6, #0x18]
	mov r0, sl
	strb r0, [r6, #0xc]
	bl sub_80A4BB0
	movs r1, #0x1f
	ands r0, r1
	lsls r0, r0, #7
	ldrh r2, [r6, #0x2e]
	ldr r1, _080A4FF4  @ 0xFFFFF07F
	ands r1, r2
	orrs r1, r0
	strh r1, [r6, #0x2e]
	adds r0, r6, #0
	adds r1, r7, #0
	movs r2, #0x4c
	bl WriteAndVerifySramFast
	movs r0, #0
	bl Set0203EDB4
	adds r0, r7, #0
	bl Save0203EDB4
	mov r0, sp
	adds r0, #0x36
	strh r5, [r0]
	add r4, sp, #0x10
	ldr r2, _080A4FF8  @ 0x01000012
	adds r1, r4, #0
	bl CpuSet
	add r1, sp, #0x50
	mov r8, r1
	add r0, sp, #0x38
	mov r9, r0
	adds r5, r7, #0
	adds r5, #0x4c
	movs r6, #0x32
_080A4F62:
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0x24
	bl WriteAndVerifySramFast
	adds r5, #0x24
	subs r6, #1
	cmp r6, #0
	bge _080A4F62
	movs r5, #0
	movs r0, #0xef
	lsls r0, r0, #3
	adds r1, r7, r0
	adds r0, r4, #0
	movs r2, #0x24
	bl WriteAndVerifySramFast
	ldr r1, _080A4FFC  @ 0x0000079C
	adds r0, r7, r1
	bl SaveConvoyItems
	adds r0, r7, #0
	bl sub_80A4104
	ldr r1, _080A5000  @ 0x00000D6C
	adds r0, r7, r1
	bl SaveGlobalEventIndexes
	ldr r1, _080A5004  @ 0x00000D8C
	adds r0, r7, r1
	bl sub_80A7074
	movs r4, #0
	mov r0, r8
	strh r5, [r0]
	ldr r2, _080A5008  @ 0x0100000C
	mov r1, r9
	bl CpuSet
	movs r0, #0xdb
	lsls r0, r0, #4
	adds r1, r7, r0
	mov r0, r9
	movs r2, #0x18
	bl WriteAndVerifySramFast
	ldr r0, _080A500C  @ 0x00040624
	str r0, [sp]
	mov r0, sp
	strb r4, [r0, #6]
	mov r1, sl
	bl SaveMetadata_Generate
	mov r0, sl
	bl sub_80A4D80
	add sp, #0x54
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A4FE4: .4byte gRAMChapterData
_080A4FE8: .4byte 0xFFFFE00F
_080A4FEC: .4byte 0x01000008
_080A4FF0: .4byte 0xFF801FFF
_080A4FF4: .4byte 0xFFFFF07F
_080A4FF8: .4byte 0x01000012
_080A4FFC: .4byte 0x0000079C
_080A5000: .4byte 0x00000D6C
_080A5004: .4byte 0x00000D8C
_080A5008: .4byte 0x0100000C
_080A500C: .4byte 0x00040624

	THUMB_FUNC_END sub_80A4E70

	THUMB_FUNC_START SaveGame
SaveGame: @ 0x080A5010
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x90
	mov sl, r0
	bl GetSaveDataLocation
	adds r7, r0, #0
	movs r0, #3
	bl sub_80A5A20
	ldr r4, _080A5104  @ gRAMChapterData
	mov r0, sl
	strb r0, [r4, #0xc]
	bl GetGameClock
	str r0, [r4]
	adds r0, r4, #0
	adds r1, r7, #0
	movs r2, #0x4c
	bl WriteAndVerifySramFast
	add r1, sp, #0x10
	mov r8, r1
	mov r0, sp
	adds r0, #0x74
	str r0, [sp, #0x8c]
	adds r4, r7, #0
	adds r4, #0x4c
	movs r6, #0
	ldr r1, _080A5108  @ gUnitArrayBlue
	mov r9, r1
	movs r5, #0x32
_080A5056:
	mov r1, r9
	adds r0, r6, r1
	adds r1, r4, #0
	bl SaveUnit
	adds r4, #0x24
	adds r6, #0x48
	subs r5, #1
	cmp r5, #0
	bge _080A5056
	mov r0, r8
	bl LoadAndVerifySecureHeaderSW
	movs r4, #0
	ldr r6, _080A5108  @ gUnitArrayBlue
	movs r5, #0x32
_080A5076:
	adds r0, r4, r6
	ldr r0, [r0]
	ldrb r0, [r0, #4]
	mov r1, r8
	bl SetSomeUnitStatThingUnlockMaybeIdk
	adds r4, #0x48
	subs r5, #1
	cmp r5, #0
	bge _080A5076
	movs r4, #0
	mov r0, r8
	bl SaveSecureHeader
	movs r1, #0xef
	lsls r1, r1, #3
	adds r0, r7, r1
	bl SaveRNGState_Maybe
	ldr r1, _080A510C  @ 0x0000079C
	adds r0, r7, r1
	bl SaveConvoyItems
	ldr r1, _080A5110  @ 0x0000084C
	adds r0, r7, r1
	bl SaveBWLEntries
	ldr r1, _080A5114  @ 0x00000CAC
	adds r0, r7, r1
	bl SaveChapterWinData
	adds r0, r7, #0
	bl Save0203EDB4
	ldr r1, _080A5118  @ 0x00000D6C
	adds r0, r7, r1
	bl SaveGlobalEventIndexes
	ldr r1, _080A511C  @ 0x00000D8C
	adds r0, r7, r1
	ldr r1, _080A5120  @ gUnknown_03005280
	bl sub_80A70B0
	ldr r0, [sp, #0x8c]
	bl sub_8037E4C
	movs r0, #0xdb
	lsls r0, r0, #4
	adds r1, r7, r0
	ldr r0, [sp, #0x8c]
	movs r2, #0x18
	bl WriteAndVerifySramFast
	ldr r0, _080A5124  @ 0x00040624
	str r0, [sp]
	mov r0, sp
	strb r4, [r0, #6]
	mov r1, sl
	bl SaveMetadata_Generate
	mov r0, sl
	bl sub_80A4D80
	add sp, #0x90
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A5104: .4byte gRAMChapterData
_080A5108: .4byte gUnitArrayBlue
_080A510C: .4byte 0x0000079C
_080A5110: .4byte 0x0000084C
_080A5114: .4byte 0x00000CAC
_080A5118: .4byte 0x00000D6C
_080A511C: .4byte 0x00000D8C
_080A5120: .4byte gUnknown_03005280
_080A5124: .4byte 0x00040624

	THUMB_FUNC_END SaveGame

	THUMB_FUNC_START LoadGame
LoadGame: @ 0x080A5128
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	sub sp, #0x18
	mov r9, r0
	bl CheckSaveAndGetPointer
	adds r7, r0, #0
	ldr r0, _080A51F0  @ gGameState
	ldrb r1, [r0, #4]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	bne _080A514C
	movs r0, #3
	bl sub_80A5A20
_080A514C:
	ldr r0, _080A51F4  @ ReadSramFast
	ldr r4, _080A51F8  @ gRAMChapterData
	ldr r3, [r0]
	adds r0, r7, #0
	adds r1, r4, #0
	movs r2, #0x4c
	bl _call_via_r3
	ldr r0, [r4]
	bl SetGameClock
	mov r0, r9
	strb r0, [r4, #0xc]
	bl ClearUnits
	movs r6, #0
	adds r4, r7, #0
	adds r4, #0x4c
	ldr r1, _080A51FC  @ gUnitArrayBlue
	mov r8, r1
	movs r5, #0x32
_080A5176:
	mov r2, r8
	adds r1, r6, r2
	adds r0, r4, #0
	bl LoadSavedUnit
	adds r6, #0x48
	adds r4, #0x24
	subs r5, #1
	cmp r5, #0
	bge _080A5176
	movs r1, #0xef
	lsls r1, r1, #3
	adds r0, r7, r1
	bl sub_80A5A00
	ldr r2, _080A5200  @ 0x0000079C
	adds r0, r7, r2
	bl LoadConvoyItems
	ldr r1, _080A5204  @ 0x00000D6C
	adds r0, r7, r1
	bl LoadGlobalEventIds
	ldr r2, _080A5208  @ 0x0000084C
	adds r0, r7, r2
	bl LoadBWLEntries
	ldr r1, _080A520C  @ 0x00000CAC
	adds r0, r7, r1
	bl LoadSomeTable
	adds r0, r7, #0
	bl Load0203EDB4
	ldr r2, _080A5210  @ 0x00000D8C
	adds r0, r7, r2
	ldr r1, _080A5214  @ gUnknown_03005280
	bl sub_80A7138
	ldr r1, _080A51F4  @ ReadSramFast
	movs r2, #0xdb
	lsls r2, r2, #4
	adds r0, r7, r2
	ldr r3, [r1]
	mov r1, sp
	movs r2, #0x18
	bl _call_via_r3
	mov r0, sp
	bl sub_8037E64
	mov r0, r9
	bl sub_80A4D80
	add sp, #0x18
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A51F0: .4byte gGameState
_080A51F4: .4byte ReadSramFast
_080A51F8: .4byte gRAMChapterData
_080A51FC: .4byte gUnitArrayBlue
_080A5200: .4byte 0x0000079C
_080A5204: .4byte 0x00000D6C
_080A5208: .4byte 0x0000084C
_080A520C: .4byte 0x00000CAC
_080A5210: .4byte 0x00000D8C
_080A5214: .4byte gUnknown_03005280

	THUMB_FUNC_END LoadGame

	THUMB_FUNC_START sub_80A5218
sub_80A5218: @ 0x080A5218
	push {lr}
	adds r1, r0, #0
	movs r0, #0
	bl SaveMetadata_Check
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80A5218

	THUMB_FUNC_START sub_80A522C
sub_80A522C: @ 0x080A522C
	push {r4, lr}
	adds r4, r1, #0
	bl CheckSaveAndGetPointer
	ldr r1, _080A5248  @ ReadSramFast
	ldr r3, [r1]
	adds r1, r4, #0
	movs r2, #0x4c
	bl _call_via_r3
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A5248: .4byte ReadSramFast

	THUMB_FUNC_END sub_80A522C

	THUMB_FUNC_START sub_80A524C
sub_80A524C: @ 0x080A524C
	push {lr}
	sub sp, #4
	bl CheckSaveAndGetPointer
	ldr r1, _080A526C  @ ReadSramFast
	ldr r2, _080A5270  @ 0x00000D88
	adds r0, r0, r2
	ldr r3, [r1]
	mov r1, sp
	movs r2, #4
	bl _call_via_r3
	ldr r0, [sp]
	add sp, #4
	pop {r1}
	bx r1
	.align 2, 0
_080A526C: .4byte ReadSramFast
_080A5270: .4byte 0x00000D88

	THUMB_FUNC_END sub_80A524C

	THUMB_FUNC_START sub_80A5274
sub_80A5274: @ 0x080A5274
	push {r4, lr}
	adds r4, r1, #0
	bl CheckSaveAndGetPointer
	ldr r1, _080A528C  @ 0x00000D8C
	adds r0, r0, r1
	adds r1, r4, #0
	bl sub_80A7138
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A528C: .4byte 0x00000D8C

	THUMB_FUNC_END sub_80A5274

	THUMB_FUNC_START sub_80A5290
sub_80A5290: @ 0x080A5290
	push {r4, lr}
	bl CheckSaveAndGetPointer
	ldr r1, _080A52B4  @ 0x00000D6C
	adds r0, r0, r1
	ldr r4, _080A52B8  @ gUnknown_02020188
	adds r1, r4, #0
	bl LoadGlobalEventIds_ret
	movs r0, #0x8a
	adds r1, r4, #0
	bl sub_8083D34
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080A52B4: .4byte 0x00000D6C
_080A52B8: .4byte gUnknown_02020188

	THUMB_FUNC_END sub_80A5290

	THUMB_FUNC_START sub_80A52BC
sub_80A52BC: @ 0x080A52BC
	push {lr}
	adds r2, r0, #0
	ldrb r1, [r2, #0x14]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	bne _080A52D6
	movs r0, #0xe
	ldrsb r0, [r2, r0]
	cmp r0, #0
	bne _080A52D6
	movs r0, #0
	b _080A52D8
_080A52D6:
	movs r0, #1
_080A52D8:
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80A52BC

	THUMB_FUNC_START sub_80A52DC
sub_80A52DC: @ 0x080A52DC
	push {r4, lr}
	sub sp, #0x4c
	adds r4, r0, #0
	bl sub_80A5218
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A5300
	adds r0, r4, #0
	mov r1, sp
	bl sub_80A522C
	mov r0, sp
	bl sub_80A52BC
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	b _080A5302
_080A5300:
	movs r0, #0
_080A5302:
	add sp, #0x4c
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80A52DC

	THUMB_FUNC_START sub_80A530C
sub_80A530C: @ 0x080A530C
	push {r4, lr}
	sub sp, #0x4c
	adds r4, r0, #0
	bl sub_80A5218
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A5332
	adds r0, r4, #0
	mov r1, sp
	bl sub_80A522C
	mov r0, sp
	ldrb r1, [r0, #0x14]
	movs r0, #0x20
	ands r0, r1
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	b _080A5334
_080A5332:
	movs r0, #0
_080A5334:
	add sp, #0x4c
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80A530C

	THUMB_FUNC_START SaveUnit
SaveUnit: @ 0x080A533C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x70
	adds r7, r0, #0
	str r1, [sp, #0x6c]
	mov r1, sp
	ldr r0, [r7]
	ldrb r0, [r0, #4]
	strb r0, [r1, #0x14]
	mov r3, sp
	ldr r0, [r7, #4]
	ldrb r1, [r0, #4]
	movs r0, #0x7f
	ands r1, r0
	ldrb r2, [r3]
	movs r5, #0x80
	negs r5, r5
	adds r0, r5, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	ldr r4, [r7]
	cmp r4, #0
	bne _080A5388
	add r7, sp, #0x24
	adds r0, r7, #0
	bl ClearUnit
	mov r0, sp
	strb r4, [r0, #0x14]
	mov r2, sp
	ldrb r1, [r2]
	adds r0, r5, #0
	ands r0, r1
	strb r0, [r2]
_080A5388:
	mov r4, sp
	movs r1, #8
	ldrsb r1, [r7, r1]
	movs r0, #0x1f
	mov r9, r0
	mov r0, r9
	ands r1, r0
	lsls r1, r1, #7
	ldrh r2, [r4]
	ldr r3, _080A5748  @ 0xFFFFF07F
	adds r0, r3, #0
	ands r0, r2
	orrs r0, r1
	strh r0, [r4]
	ldrb r2, [r7, #9]
	movs r1, #0x7f
	mov sl, r1
	ands r2, r1
	lsls r2, r2, #0xc
	ldr r0, [sp]
	ldr r1, _080A574C  @ 0xFFF80FFF
	ands r0, r1
	orrs r0, r2
	str r0, [sp]
	movs r1, #0x10
	ldrsb r1, [r7, r1]
	movs r0, #0x3f
	ands r1, r0
	lsls r1, r1, #3
	ldrh r2, [r4, #2]
	ldr r0, _080A5750  @ 0xFFFFFE07
	ands r0, r2
	orrs r0, r1
	strh r0, [r4, #2]
	movs r1, #0x11
	ldrsb r1, [r7, r1]
	movs r0, #0x3f
	ands r1, r0
	lsls r1, r1, #1
	ldrb r2, [r4, #3]
	movs r0, #0x7f
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r4, #3]
	movs r2, #0x12
	ldrsb r2, [r7, r2]
	movs r6, #0x3f
	ands r2, r6
	lsls r2, r2, #0xc
	ldr r0, [sp, #4]
	ldr r1, _080A5754  @ 0xFFFC0FFF
	ands r0, r1
	orrs r0, r2
	str r0, [sp, #4]
	movs r1, #0x14
	ldrsb r1, [r7, r1]
	movs r5, #0x1f
	ands r1, r5
	lsls r1, r1, #2
	ldrb r2, [r4, #6]
	movs r0, #0x7d
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r4, #6]
	mov r2, sp
	movs r0, #0x15
	ldrsb r0, [r7, r0]
	mov r4, r9
	ands r0, r4
	lsls r0, r0, #7
	ldrh r1, [r2, #6]
	ands r3, r1
	orrs r3, r0
	strh r3, [r2, #6]
	mov r4, sp
	movs r3, #0x16
	ldrsb r3, [r7, r3]
	movs r0, #0xf
	mov r8, r0
	adds r1, r3, #0
	ands r1, r0
	lsls r1, r1, #4
	ldrb r2, [r4, #7]
	ands r0, r2
	orrs r0, r1
	strb r0, [r4, #7]
	lsrs r3, r3, #4
	movs r1, #1
	mov ip, r1
	ands r3, r1
	ldrb r1, [r4, #8]
	movs r0, #2
	negs r0, r0
	ands r0, r1
	orrs r0, r3
	strb r0, [r4, #8]
	mov r3, sp
	movs r1, #0x17
	ldrsb r1, [r7, r1]
	ands r1, r5
	lsls r1, r1, #1
	movs r2, #0x3f
	negs r2, r2
	ands r0, r2
	orrs r0, r1
	strb r0, [r3, #8]
	movs r1, #0x18
	ldrsb r1, [r7, r1]
	mov r4, r9
	ands r1, r4
	lsls r1, r1, #6
	ldrh r2, [r3, #8]
	ldr r0, _080A5758  @ 0xFFFFF83F
	ands r0, r2
	orrs r0, r1
	strh r0, [r3, #8]
	movs r1, #0x19
	ldrsb r1, [r7, r1]
	lsls r1, r1, #3
	ldrb r2, [r3, #9]
	movs r0, #7
	ands r0, r2
	orrs r0, r1
	strb r0, [r3, #9]
	movs r1, #0x1a
	ldrsb r1, [r7, r1]
	ands r1, r5
	ldrb r2, [r3, #0xa]
	movs r0, #0x20
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3, #0xa]
	movs r1, #0x1d
	ldrsb r1, [r7, r1]
	ands r1, r4
	lsls r1, r1, #5
	ldrh r2, [r3, #0xa]
	ldr r0, _080A575C  @ 0xFFFFFC1F
	ands r0, r2
	orrs r0, r1
	strh r0, [r3, #0xa]
	ldrh r2, [r7, #0x1e]
	adds r1, r2, #0
	ands r1, r6
	lsls r1, r1, #2
	ldrb r4, [r3, #0xb]
	movs r5, #3
	adds r0, r5, #0
	ands r0, r4
	orrs r0, r1
	strb r0, [r3, #0xb]
	lsrs r2, r2, #6
	strb r2, [r3, #0xc]
	ldrh r2, [r7, #0x20]
	ldr r4, _080A5760  @ 0x00003FFF
	ands r2, r4
	lsls r2, r2, #8
	ldr r0, [sp, #0xc]
	ldr r1, _080A5764  @ 0xFFC000FF
	ands r0, r1
	orrs r0, r2
	str r0, [sp, #0xc]
	ldrh r1, [r7, #0x22]
	ldr r0, _080A5768  @ 0x000003FF
	ands r0, r1
	lsls r0, r0, #6
	ldrh r2, [r3, #0xe]
	ands r6, r2
	orrs r6, r0
	strh r6, [r3, #0xe]
	lsrs r1, r1, #0xa
	mov r0, r8
	ands r1, r0
	ldrb r2, [r3, #0x10]
	movs r0, #0x10
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3, #0x10]
	ldrh r1, [r7, #0x24]
	ands r1, r4
	lsls r1, r1, #4
	ldr r0, [sp, #0x10]
	ldr r2, _080A576C  @ 0xFFFC000F
	ands r0, r2
	orrs r0, r1
	str r0, [sp, #0x10]
	mov r2, sp
	ldrh r0, [r7, #0x26]
	lsls r0, r0, #2
	ldrh r1, [r2, #0x12]
	ands r5, r1
	orrs r5, r0
	strh r5, [r2, #0x12]
	mov r1, sp
	ldrb r0, [r1, #3]
	mov r5, sl
	ands r5, r0
	strb r5, [r1, #3]
	ldrh r2, [r1, #4]
	ldr r6, _080A5770  @ 0xFFFFF000
	adds r0, r6, #0
	ands r0, r2
	strh r0, [r1, #4]
	ldr r0, [r7, #0xc]
	movs r1, #4
	mov r8, r1
	ands r0, r1
	cmp r0, #0
	beq _080A5552
	mov r0, sp
	ldrh r2, [r0, #4]
	ldr r4, _080A5774  @ 0x00000FFF
	ands r2, r4
	mov r0, ip
	lsrs r1, r0, #1
	lsls r0, r0, #7
	orrs r0, r5
	strb r0, [r3, #3]
	orrs r1, r2
	ands r1, r4
	ldrh r2, [r3, #4]
	adds r0, r6, #0
	ands r0, r2
	orrs r0, r1
	strh r0, [r3, #4]
_080A5552:
	ldr r0, [r7, #0xc]
	movs r1, #8
	mov r9, r1
	ands r0, r1
	cmp r0, #0
	beq _080A5592
	mov r3, sp
	mov r0, sp
	ldrb r4, [r0, #3]
	lsrs r1, r4, #7
	ldrh r2, [r0, #4]
	ldr r5, _080A5774  @ 0x00000FFF
	ands r2, r5
	lsls r2, r2, #1
	orrs r2, r1
	movs r0, #2
	orrs r2, r0
	adds r1, r2, #0
	mov r0, ip
	ands r1, r0
	lsls r1, r1, #7
	mov r0, sl
	ands r0, r4
	orrs r0, r1
	strb r0, [r3, #3]
	lsrs r2, r2, #1
	ands r2, r5
	ldrh r1, [r3, #4]
	adds r0, r6, #0
	ands r0, r1
	orrs r0, r2
	strh r0, [r3, #4]
_080A5592:
	ldr r0, [r7, #0xc]
	movs r1, #0x80
	lsls r1, r1, #7
	ands r0, r1
	cmp r0, #0
	beq _080A55D2
	mov r3, sp
	mov r0, sp
	ldrb r4, [r0, #3]
	lsrs r2, r4, #7
	ldrh r1, [r0, #4]
	ldr r5, _080A5774  @ 0x00000FFF
	ands r1, r5
	lsls r1, r1, #1
	orrs r1, r2
	mov r0, r8
	orrs r1, r0
	adds r2, r1, #0
	mov r0, ip
	ands r2, r0
	lsls r2, r2, #7
	mov r0, sl
	ands r0, r4
	orrs r0, r2
	strb r0, [r3, #3]
	lsrs r1, r1, #1
	ands r1, r5
	ldrh r2, [r3, #4]
	adds r0, r6, #0
	ands r0, r2
	orrs r0, r1
	strh r0, [r3, #4]
_080A55D2:
	ldr r0, [r7, #0xc]
	movs r1, #0x80
	lsls r1, r1, #8
	ands r0, r1
	cmp r0, #0
	beq _080A5612
	mov r3, sp
	mov r0, sp
	ldrb r4, [r0, #3]
	lsrs r2, r4, #7
	ldrh r1, [r0, #4]
	ldr r5, _080A5774  @ 0x00000FFF
	ands r1, r5
	lsls r1, r1, #1
	orrs r1, r2
	mov r0, r9
	orrs r1, r0
	adds r2, r1, #0
	mov r0, ip
	ands r2, r0
	lsls r2, r2, #7
	mov r0, sl
	ands r0, r4
	orrs r0, r2
	strb r0, [r3, #3]
	lsrs r1, r1, #1
	ands r1, r5
	ldrh r2, [r3, #4]
	adds r0, r6, #0
	ands r0, r2
	orrs r0, r1
	strh r0, [r3, #4]
_080A5612:
	ldr r0, [r7, #0xc]
	movs r1, #0x80
	lsls r1, r1, #6
	ands r0, r1
	cmp r0, #0
	beq _080A5652
	mov r3, sp
	mov r0, sp
	ldrb r4, [r0, #3]
	lsrs r1, r4, #7
	ldrh r2, [r0, #4]
	ldr r5, _080A5774  @ 0x00000FFF
	ands r2, r5
	lsls r2, r2, #1
	orrs r2, r1
	movs r0, #0x10
	orrs r2, r0
	adds r1, r2, #0
	mov r0, ip
	ands r1, r0
	lsls r1, r1, #7
	mov r0, sl
	ands r0, r4
	orrs r0, r1
	strb r0, [r3, #3]
	lsrs r2, r2, #1
	ands r2, r5
	ldrh r1, [r3, #4]
	adds r0, r6, #0
	ands r0, r1
	orrs r0, r2
	strh r0, [r3, #4]
_080A5652:
	ldr r0, [r7, #0xc]
	movs r1, #0x80
	lsls r1, r1, #9
	ands r0, r1
	cmp r0, #0
	beq _080A5692
	mov r3, sp
	mov r0, sp
	ldrb r4, [r0, #3]
	lsrs r1, r4, #7
	ldrh r2, [r0, #4]
	ldr r5, _080A5774  @ 0x00000FFF
	ands r2, r5
	lsls r2, r2, #1
	orrs r2, r1
	movs r0, #0x20
	orrs r2, r0
	adds r1, r2, #0
	mov r0, ip
	ands r1, r0
	lsls r1, r1, #7
	mov r0, sl
	ands r0, r4
	orrs r0, r1
	strb r0, [r3, #3]
	lsrs r2, r2, #1
	ands r2, r5
	ldrh r1, [r3, #4]
	adds r0, r6, #0
	ands r0, r1
	orrs r0, r2
	strh r0, [r3, #4]
_080A5692:
	ldr r0, [r7, #0xc]
	movs r1, #0x80
	lsls r1, r1, #0x12
	ands r0, r1
	cmp r0, #0
	beq _080A56D2
	mov r3, sp
	mov r0, sp
	ldrb r4, [r0, #3]
	lsrs r1, r4, #7
	ldrh r2, [r0, #4]
	ldr r5, _080A5774  @ 0x00000FFF
	ands r2, r5
	lsls r2, r2, #1
	orrs r2, r1
	movs r0, #0x40
	orrs r2, r0
	adds r1, r2, #0
	mov r0, ip
	ands r1, r0
	lsls r1, r1, #7
	mov r0, sl
	ands r0, r4
	orrs r0, r1
	strb r0, [r3, #3]
	lsrs r2, r2, #1
	ands r2, r5
	ldrh r1, [r3, #4]
	adds r0, r6, #0
	ands r0, r1
	orrs r0, r2
	strh r0, [r3, #4]
_080A56D2:
	ldr r0, [r7, #0xc]
	movs r1, #0x80
	lsls r1, r1, #0xe
	ands r0, r1
	cmp r0, #0
	beq _080A5712
	mov r3, sp
	mov r0, sp
	ldrb r4, [r0, #3]
	lsrs r1, r4, #7
	ldrh r2, [r0, #4]
	ldr r5, _080A5774  @ 0x00000FFF
	ands r2, r5
	lsls r2, r2, #1
	orrs r2, r1
	movs r0, #0x80
	orrs r2, r0
	adds r1, r2, #0
	mov r0, ip
	ands r1, r0
	lsls r1, r1, #7
	mov r0, sl
	ands r0, r4
	orrs r0, r1
	strb r0, [r3, #3]
	lsrs r2, r2, #1
	ands r2, r5
	ldrh r1, [r3, #4]
	adds r0, r6, #0
	ands r0, r1
	orrs r0, r2
	strh r0, [r3, #4]
_080A5712:
	movs r2, #0
	mov r5, sp
	adds r5, #0x1d
	adds r6, r7, #0
	adds r6, #0x32
	mov r4, sp
	adds r4, #0x15
	adds r3, r7, #0
	adds r3, #0x28
_080A5724:
	adds r0, r4, r2
	adds r1, r3, r2
	ldrb r1, [r1]
	strb r1, [r0]
	adds r2, #1
	cmp r2, #7
	ble _080A5724
	movs r2, #0
	adds r4, r5, #0
	adds r3, r6, #0
_080A5738:
	adds r0, r4, r2
	adds r1, r3, r2
	ldrb r1, [r1]
	strb r1, [r0]
	adds r2, #1
	cmp r2, #6
	b _080A5778
	.align 2, 0
_080A5748: .4byte 0xFFFFF07F
_080A574C: .4byte 0xFFF80FFF
_080A5750: .4byte 0xFFFFFE07
_080A5754: .4byte 0xFFFC0FFF
_080A5758: .4byte 0xFFFFF83F
_080A575C: .4byte 0xFFFFFC1F
_080A5760: .4byte 0x00003FFF
_080A5764: .4byte 0xFFC000FF
_080A5768: .4byte 0x000003FF
_080A576C: .4byte 0xFFFC000F
_080A5770: .4byte 0xFFFFF000
_080A5774: .4byte 0x00000FFF
_080A5778:
	ble _080A5738
	mov r0, sp
	ldr r1, [sp, #0x6c]
	movs r2, #0x24
	bl WriteAndVerifySramFast
	add sp, #0x70
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END SaveUnit

	THUMB_FUNC_START LoadSavedUnit
LoadSavedUnit: @ 0x080A5794
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x24
	adds r4, r1, #0
	ldr r1, _080A59D8  @ ReadSramFast
	ldr r3, [r1]
	mov r1, sp
	movs r2, #0x24
	bl _call_via_r3
	mov r0, sp
	ldrb r0, [r0, #0x14]
	bl GetCharacterData
	str r0, [r4]
	mov r0, sp
	ldrb r0, [r0]
	lsls r0, r0, #0x19
	lsrs r0, r0, #0x19
	bl GetClassData
	str r0, [r4, #4]
	mov r0, sp
	ldrh r0, [r0]
	lsls r0, r0, #0x14
	lsrs r0, r0, #0x1b
	strb r0, [r4, #8]
	ldr r0, [sp]
	lsls r0, r0, #0xd
	lsrs r3, r0, #0x19
	strb r3, [r4, #9]
	mov r0, sp
	ldrh r0, [r0, #2]
	lsls r0, r0, #0x17
	lsrs r0, r0, #0x1a
	strb r0, [r4, #0x10]
	mov r0, sp
	ldrb r0, [r0, #3]
	lsls r0, r0, #0x19
	lsrs r0, r0, #0x1a
	strb r0, [r4, #0x11]
	ldr r0, [sp, #4]
	lsls r0, r0, #0xe
	lsrs r0, r0, #0x1a
	strb r0, [r4, #0x12]
	mov r0, sp
	ldrb r0, [r0, #6]
	lsls r0, r0, #0x19
	lsrs r0, r0, #0x1b
	strb r0, [r4, #0x14]
	mov r0, sp
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x14
	lsrs r0, r0, #0x1b
	strb r0, [r4, #0x15]
	mov r0, sp
	ldrb r1, [r0, #7]
	lsrs r1, r1, #4
	ldrb r0, [r0, #8]
	movs r5, #1
	ands r0, r5
	lsls r0, r0, #4
	orrs r0, r1
	strb r0, [r4, #0x16]
	mov r0, sp
	ldrb r0, [r0, #8]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1b
	strb r0, [r4, #0x17]
	mov r0, sp
	ldrh r0, [r0, #8]
	lsls r0, r0, #0x15
	lsrs r0, r0, #0x1b
	strb r0, [r4, #0x18]
	mov r0, sp
	ldrb r0, [r0, #9]
	lsrs r0, r0, #3
	strb r0, [r4, #0x19]
	mov r0, sp
	ldrb r0, [r0, #0xa]
	lsls r0, r0, #0x1b
	lsrs r0, r0, #0x1b
	strb r0, [r4, #0x1a]
	mov r0, sp
	ldrh r0, [r0, #0xa]
	lsls r0, r0, #0x16
	lsrs r0, r0, #0x1b
	strb r0, [r4, #0x1d]
	mov r0, sp
	ldrb r1, [r0, #0xb]
	lsrs r1, r1, #2
	ldrb r0, [r0, #0xc]
	lsls r0, r0, #6
	orrs r0, r1
	strh r0, [r4, #0x1e]
	ldr r0, [sp, #0xc]
	lsls r0, r0, #0xa
	lsrs r0, r0, #0x12
	strh r0, [r4, #0x20]
	mov r0, sp
	ldrh r2, [r0, #0xe]
	lsrs r2, r2, #6
	ldrb r0, [r0, #0x10]
	movs r1, #0xf
	ands r0, r1
	lsls r0, r0, #0xa
	orrs r0, r2
	strh r0, [r4, #0x22]
	ldr r0, [sp, #0x10]
	lsls r0, r0, #0xe
	lsrs r0, r0, #0x12
	strh r0, [r4, #0x24]
	mov r0, sp
	ldrh r0, [r0, #0x12]
	lsrs r0, r0, #2
	strh r0, [r4, #0x26]
	cmp r3, #0x63
	bls _080A5886
	movs r0, #0xff
	strb r0, [r4, #9]
_080A5886:
	movs r0, #0
	str r0, [r4, #0xc]
	mov r0, sp
	ldrb r1, [r0, #3]
	lsrs r1, r1, #7
	ldrh r0, [r0, #4]
	ldr r2, _080A59DC  @ 0x00000FFF
	ands r0, r2
	lsls r0, r0, #1
	orrs r0, r1
	ands r0, r5
	cmp r0, #0
	beq _080A58A4
	movs r0, #5
	str r0, [r4, #0xc]
_080A58A4:
	mov r0, sp
	ldrh r0, [r0, #4]
	ands r0, r2
	lsls r0, r0, #1
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	beq _080A58BC
	ldr r0, [r4, #0xc]
	movs r1, #9
	orrs r0, r1
	str r0, [r4, #0xc]
_080A58BC:
	mov r0, sp
	ldrh r0, [r0, #4]
	ands r0, r2
	lsls r0, r0, #1
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	beq _080A58D6
	ldr r0, [r4, #0xc]
	movs r1, #0x80
	lsls r1, r1, #7
	orrs r0, r1
	str r0, [r4, #0xc]
_080A58D6:
	mov r0, sp
	ldrh r0, [r0, #4]
	ands r0, r2
	lsls r0, r0, #1
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	beq _080A58F0
	ldr r0, [r4, #0xc]
	movs r1, #0x80
	lsls r1, r1, #8
	orrs r0, r1
	str r0, [r4, #0xc]
_080A58F0:
	mov r0, sp
	ldrh r0, [r0, #4]
	ands r0, r2
	lsls r0, r0, #1
	movs r1, #0x10
	ands r0, r1
	cmp r0, #0
	beq _080A590A
	ldr r0, [r4, #0xc]
	movs r1, #0x80
	lsls r1, r1, #6
	orrs r0, r1
	str r0, [r4, #0xc]
_080A590A:
	mov r0, sp
	ldrh r0, [r0, #4]
	ands r0, r2
	lsls r0, r0, #1
	movs r1, #0x20
	ands r0, r1
	cmp r0, #0
	beq _080A5924
	ldr r0, [r4, #0xc]
	movs r1, #0x80
	lsls r1, r1, #9
	orrs r0, r1
	str r0, [r4, #0xc]
_080A5924:
	mov r0, sp
	ldrh r0, [r0, #4]
	ands r0, r2
	lsls r0, r0, #1
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	beq _080A593E
	ldr r0, [r4, #0xc]
	movs r1, #0x80
	lsls r1, r1, #0x12
	orrs r0, r1
	str r0, [r4, #0xc]
_080A593E:
	mov r0, sp
	ldrh r0, [r0, #4]
	ands r0, r2
	lsls r0, r0, #1
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _080A5958
	ldr r0, [r4, #0xc]
	movs r1, #0x80
	lsls r1, r1, #0xe
	orrs r0, r1
	str r0, [r4, #0xc]
_080A5958:
	movs r2, #0
	adds r7, r4, #0
	adds r7, #0x32
	mov r6, sp
	adds r6, #0x1d
	movs r0, #0x39
	adds r0, r0, r4
	mov r8, r0
	adds r5, r4, #0
	adds r5, #0x28
	mov r3, sp
	adds r3, #0x15
_080A5970:
	adds r0, r5, r2
	adds r1, r3, r2
	ldrb r1, [r1]
	strb r1, [r0]
	adds r2, #1
	cmp r2, #7
	ble _080A5970
	movs r2, #0
	adds r5, r7, #0
	adds r3, r6, #0
_080A5984:
	adds r0, r5, r2
	adds r1, r3, r2
	ldrb r1, [r1]
	strb r1, [r0]
	adds r2, #1
	cmp r2, #6
	ble _080A5984
	adds r0, r4, #0
	bl GetUnitMaxHp
	adds r1, r0, #0
	adds r0, r4, #0
	bl SetUnitHp
	movs r0, #0
	mov r1, r8
	strb r0, [r1]
	ldrb r0, [r4, #9]
	cmp r0, #0x7f
	bne _080A59B0
	movs r0, #0xff
	strb r0, [r4, #9]
_080A59B0:
	ldrb r1, [r4, #0x10]
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	cmp r0, #0x3f
	bne _080A59BE
	movs r0, #0xff
	strb r0, [r4, #0x10]
_080A59BE:
	ldrb r1, [r4, #0x11]
	movs r0, #0x11
	ldrsb r0, [r4, r0]
	cmp r0, #0x3f
	bne _080A59CC
	movs r0, #0xff
	strb r0, [r4, #0x11]
_080A59CC:
	add sp, #0x24
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A59D8: .4byte ReadSramFast
_080A59DC: .4byte 0x00000FFF

	THUMB_FUNC_END LoadSavedUnit

	THUMB_FUNC_START SaveRNGState_Maybe
SaveRNGState_Maybe: @ 0x080A59E0
	push {r4, lr}
	sub sp, #8
	adds r4, r0, #0
	mov r0, sp
	bl sub_80A71E4
	mov r0, sp
	adds r1, r4, #0
	movs r2, #8
	bl WriteAndVerifySramFast
	add sp, #8
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END SaveRNGState_Maybe

	THUMB_FUNC_START sub_80A5A00
sub_80A5A00: @ 0x080A5A00
	push {lr}
	sub sp, #8
	ldr r1, _080A5A1C  @ ReadSramFast
	ldr r3, [r1]
	mov r1, sp
	movs r2, #8
	bl _call_via_r3
	mov r0, sp
	bl sub_80A71F8
	add sp, #8
	pop {r0}
	bx r0
	.align 2, 0
_080A5A1C: .4byte ReadSramFast

	THUMB_FUNC_END sub_80A5A00

	THUMB_FUNC_START sub_80A5A20
sub_80A5A20: @ 0x080A5A20
	push {r4, lr}
	sub sp, #0x10
	adds r4, r0, #0
	mov r1, sp
	movs r0, #0xff
	strb r0, [r1, #6]
	mov r0, sp
	adds r1, r4, #0
	bl SaveMetadata_Generate
	cmp r4, #3
	bne _080A5A40
	mov r0, sp
	movs r1, #4
	bl SaveMetadata_Generate
_080A5A40:
	add sp, #0x10
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80A5A20

	THUMB_FUNC_START SaveSuspendedGame
SaveSuspendedGame: @ 0x080A5A48
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x40
	mov r9, r0
	ldr r4, _080A5BC0  @ gRAMChapterData
	ldrb r1, [r4, #0x14]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _080A5A64
	b _080A5BB0
_080A5A64:
	bl IsSramWorking
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080A5A70
	b _080A5BB0
_080A5A70:
	bl sub_80A63D0
	add r9, r0
	mov r0, r9
	bl GetSaveDataLocation
	adds r7, r0, #0
	bl GetGameClock
	str r0, [r4]
	adds r0, r4, #0
	adds r1, r7, #0
	movs r2, #0x4c
	bl WriteAndVerifySramFast
	bl StoreRNStateToActionStruct
	ldr r0, _080A5BC4  @ gActionData
	adds r1, r7, #0
	adds r1, #0x4c
	movs r2, #0x38
	bl WriteAndVerifySramFast
	ldr r5, _080A5BC8  @ gUnknown_02020188
	add r0, sp, #0x10
	mov sl, r0
	add r1, sp, #0x20
	mov r8, r1
	mov r2, sp
	adds r2, #0x38
	str r2, [sp, #0x3c]
	ldr r6, _080A5BCC  @ gUnitArrayBlue
	movs r4, #0x32
_080A5AB2:
	adds r1, r5, #0
	adds r5, #0x34
	adds r0, r6, #0
	bl PackUnitStructForSuspend
	adds r6, #0x48
	subs r4, #1
	cmp r4, #0
	bge _080A5AB2
	ldr r4, _080A5BC8  @ gUnknown_02020188
	ldr r2, _080A5BD0  @ 0x00000A5C
	adds r1, r7, #0
	adds r1, #0x84
	adds r0, r4, #0
	bl WriteSramFast
	adds r5, r4, #0
	ldr r6, _080A5BD4  @ gUnitArrayRed
	movs r4, #0x31
_080A5AD8:
	adds r1, r5, #0
	adds r5, #0x34
	adds r0, r6, #0
	bl PackUnitStructForSuspend
	adds r6, #0x48
	subs r4, #1
	cmp r4, #0
	bge _080A5AD8
	ldr r6, _080A5BD8  @ gUnitArrayGreen
	movs r4, #9
_080A5AEE:
	adds r1, r5, #0
	adds r5, #0x34
	adds r0, r6, #0
	bl PackUnitStructForSuspend
	adds r6, #0x48
	subs r4, #1
	cmp r4, #0
	bge _080A5AEE
	movs r4, #0
	ldr r0, _080A5BC8  @ gUnknown_02020188
	ldr r2, _080A5BDC  @ 0x00000B14
	adds r1, r7, r2
	movs r2, #0xc3
	lsls r2, r2, #4
	bl WriteSramFast
	ldr r1, _080A5BE0  @ 0x00001F24
	adds r0, r7, r1
	bl SaveGlobalEventIndexes
	ldr r2, _080A5BE4  @ 0x00001F3D
	adds r0, r7, r2
	bl SaveLocalEventIndexes
	ldr r1, _080A5BE8  @ 0x00001944
	adds r0, r7, r1
	bl SaveConvoyItems
	ldr r2, _080A5BEC  @ 0x000019F4
	adds r0, r7, r2
	bl SaveBWLEntries
	ldr r1, _080A5BF0  @ 0x00001E54
	adds r0, r7, r1
	bl SaveChapterWinData
	ldr r2, _080A5BF4  @ 0x00001744
	adds r0, r7, r2
	bl SaveTrapStructs
	mov r0, sl
	bl GetForceDisabledMenuItems
	ldr r0, _080A5BF8  @ 0x00001F14
	adds r1, r7, r0
	mov r0, sl
	movs r2, #0x10
	bl WriteAndVerifySramFast
	ldr r1, _080A5BFC  @ 0x00001F44
	adds r0, r7, r1
	ldr r1, _080A5C00  @ gUnknown_03005280
	bl sub_80A70B0
	mov r0, r8
	bl sub_8037E4C
	movs r2, #0xae
	lsls r2, r2, #4
	adds r1, r7, r2
	mov r0, r8
	movs r2, #0x18
	bl WriteAndVerifySramFast
	mov r0, r8
	bl sub_8037E08
	ldr r0, _080A5C04  @ 0x00001F68
	adds r1, r7, r0
	mov r0, r8
	movs r2, #0xc
	bl WriteAndVerifySramFast
	bl GetEventSlotCounter
	str r0, [sp, #0x38]
	ldr r2, _080A5C08  @ 0x00001F74
	adds r1, r7, r2
	ldr r0, [sp, #0x3c]
	movs r2, #4
	bl WriteAndVerifySramFast
	ldr r0, _080A5C0C  @ 0x00040624
	str r0, [sp]
	mov r1, sp
	movs r0, #1
	strb r0, [r1, #6]
	mov r0, sp
	mov r1, r9
	bl SaveMetadata_Generate
	ldr r0, _080A5C10  @ gGameState
	adds r0, #0x3c
	strb r4, [r0]
	bl sub_80A63E0
_080A5BB0:
	add sp, #0x40
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A5BC0: .4byte gRAMChapterData
_080A5BC4: .4byte gActionData
_080A5BC8: .4byte gUnknown_02020188
_080A5BCC: .4byte gUnitArrayBlue
_080A5BD0: .4byte 0x00000A5C
_080A5BD4: .4byte gUnitArrayRed
_080A5BD8: .4byte gUnitArrayGreen
_080A5BDC: .4byte 0x00000B14
_080A5BE0: .4byte 0x00001F24
_080A5BE4: .4byte 0x00001F3D
_080A5BE8: .4byte 0x00001944
_080A5BEC: .4byte 0x000019F4
_080A5BF0: .4byte 0x00001E54
_080A5BF4: .4byte 0x00001744
_080A5BF8: .4byte 0x00001F14
_080A5BFC: .4byte 0x00001F44
_080A5C00: .4byte gUnknown_03005280
_080A5C04: .4byte 0x00001F68
_080A5C08: .4byte 0x00001F74
_080A5C0C: .4byte 0x00040624
_080A5C10: .4byte gGameState

	THUMB_FUNC_END SaveSuspendedGame

	THUMB_FUNC_START LoadSuspendedGame
LoadSuspendedGame: @ 0x080A5C14
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x2c
	ldr r1, _080A5D58  @ gUnknown_0203EDB8
	ldrb r1, [r1]
	adds r0, r0, r1
	bl CheckSaveAndGetPointer
	adds r6, r0, #0
	ldr r5, _080A5D5C  @ ReadSramFast
	ldr r4, _080A5D60  @ gRAMChapterData
	ldr r3, [r5]
	adds r1, r4, #0
	movs r2, #0x4c
	bl _call_via_r3
	ldr r0, [r4]
	bl SetGameClock
	adds r0, r6, #0
	adds r0, #0x4c
	ldr r1, _080A5D64  @ gActionData
	ldr r3, [r5]
	movs r2, #0x38
	bl _call_via_r3
	bl LoadRNStateFromActionStruct
	bl ClearUnits
	movs r4, #0
	add r7, sp, #0x10
	add r0, sp, #0x28
	mov r8, r0
	movs r5, #0
_080A5C5C:
	movs r0, #0x34
	muls r0, r4, r0
	adds r0, #0x84
	adds r0, r6, r0
	ldr r1, _080A5D68  @ gUnitArrayBlue
	adds r1, r5, r1
	bl UnpackUnitStructFromSuspend
	adds r5, #0x48
	adds r4, #1
	cmp r4, #0x32
	ble _080A5C5C
	movs r4, #0
	movs r5, #0
_080A5C78:
	movs r0, #0x34
	muls r0, r4, r0
	ldr r1, _080A5D6C  @ 0x00000B14
	adds r0, r0, r1
	adds r0, r6, r0
	ldr r1, _080A5D70  @ gUnitArrayRed
	adds r1, r5, r1
	bl UnpackUnitStructFromSuspend
	adds r5, #0x48
	adds r4, #1
	cmp r4, #0x31
	ble _080A5C78
	movs r4, #0
	movs r5, #0
_080A5C96:
	movs r0, #0x34
	muls r0, r4, r0
	ldr r1, _080A5D74  @ 0x0000153C
	adds r0, r0, r1
	adds r0, r6, r0
	ldr r1, _080A5D78  @ gUnitArrayGreen
	adds r1, r5, r1
	bl UnpackUnitStructFromSuspend
	adds r5, #0x48
	adds r4, #1
	cmp r4, #9
	ble _080A5C96
	ldr r1, _080A5D7C  @ 0x000019F4
	adds r0, r6, r1
	bl LoadBWLEntries
	ldr r1, _080A5D80  @ 0x00001E54
	adds r0, r6, r1
	bl LoadSomeTable
	ldr r1, _080A5D84  @ 0x00001944
	adds r0, r6, r1
	bl LoadConvoyItems
	ldr r1, _080A5D88  @ 0x00001F24
	adds r0, r6, r1
	bl LoadGlobalEventIds
	ldr r1, _080A5D8C  @ 0x00001F3D
	adds r0, r6, r1
	bl LoadLocalEventIds
	ldr r1, _080A5D90  @ 0x00001744
	adds r0, r6, r1
	bl sub_80A638C
	ldr r4, _080A5D5C  @ ReadSramFast
	ldr r1, _080A5D94  @ 0x00001F14
	adds r0, r6, r1
	ldr r3, [r4]
	mov r1, sp
	movs r2, #0x10
	bl _call_via_r3
	mov r0, sp
	bl SetForceDisabledMenuItems
	ldr r1, _080A5D98  @ 0x00001F44
	adds r0, r6, r1
	ldr r1, _080A5D9C  @ gUnknown_03005280
	bl sub_80A7138
	movs r1, #0xae
	lsls r1, r1, #4
	adds r0, r6, r1
	ldr r3, [r4]
	adds r1, r7, #0
	movs r2, #0x18
	bl _call_via_r3
	adds r0, r7, #0
	bl sub_8037E64
	ldr r1, _080A5DA0  @ 0x00001F68
	adds r0, r6, r1
	ldr r3, [r4]
	adds r1, r7, #0
	movs r2, #0xc
	bl _call_via_r3
	adds r0, r7, #0
	bl sub_8037E30
	ldr r1, _080A5DA4  @ 0x00001F74
	adds r0, r6, r1
	ldr r3, [r4]
	mov r1, r8
	movs r2, #4
	bl _call_via_r3
	ldr r0, [sp, #0x28]
	bl SetEventSlotCounter
	ldr r0, _080A5D60  @ gRAMChapterData
	ldrb r0, [r0, #0xc]
	bl sub_80A524C
	bl Set0203EDB4
	add sp, #0x2c
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A5D58: .4byte gUnknown_0203EDB8
_080A5D5C: .4byte ReadSramFast
_080A5D60: .4byte gRAMChapterData
_080A5D64: .4byte gActionData
_080A5D68: .4byte gUnitArrayBlue
_080A5D6C: .4byte 0x00000B14
_080A5D70: .4byte gUnitArrayRed
_080A5D74: .4byte 0x0000153C
_080A5D78: .4byte gUnitArrayGreen
_080A5D7C: .4byte 0x000019F4
_080A5D80: .4byte 0x00001E54
_080A5D84: .4byte 0x00001944
_080A5D88: .4byte 0x00001F24
_080A5D8C: .4byte 0x00001F3D
_080A5D90: .4byte 0x00001744
_080A5D94: .4byte 0x00001F14
_080A5D98: .4byte 0x00001F44
_080A5D9C: .4byte gUnknown_03005280
_080A5DA0: .4byte 0x00001F68
_080A5DA4: .4byte 0x00001F74

	THUMB_FUNC_END LoadSuspendedGame

	THUMB_FUNC_START sub_80A5DA8
sub_80A5DA8: @ 0x080A5DA8
	push {r4, lr}
	adds r4, r0, #0
	bl IsSramWorking
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A5DEC
	cmp r4, #3
	bne _080A5DEC
	ldr r4, _080A5DF0  @ gUnknown_0203EDB8
	bl sub_80A63B0
	strb r0, [r4]
	ldrb r1, [r4]
	adds r1, #3
	movs r0, #0
	bl SaveMetadata_Check
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080A5DF4
	bl sub_80A63D0
	strb r0, [r4]
	ldrb r1, [r4]
	adds r1, #3
	movs r0, #0
	bl SaveMetadata_Check
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080A5DF4
	movs r0, #0x7f
	strb r0, [r4]
_080A5DEC:
	movs r0, #0
	b _080A5DF6
	.align 2, 0
_080A5DF0: .4byte gUnknown_0203EDB8
_080A5DF4:
	movs r0, #1
_080A5DF6:
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80A5DA8

	THUMB_FUNC_START sub_80A5DFC
sub_80A5DFC: @ 0x080A5DFC
	push {lr}
	ldr r2, _080A5E0C  @ gUnknown_0203EDB8
	ldrb r2, [r2]
	adds r0, r0, r2
	bl sub_80A522C
	pop {r0}
	bx r0
	.align 2, 0
_080A5E0C: .4byte gUnknown_0203EDB8

	THUMB_FUNC_END sub_80A5DFC

	THUMB_FUNC_START PackUnitStructForSuspend
PackUnitStructForSuspend: @ 0x080A5E10
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x24
	adds r7, r0, #0
	mov ip, r1
	ldr r0, [r7]
	cmp r0, #0
	bne _080A5E2A
	strb r0, [r1]
	b _080A60E6
_080A5E2A:
	ldrb r0, [r0, #4]
	mov r1, ip
	strb r0, [r1]
	ldr r0, [r7, #4]
	ldrb r0, [r0, #4]
	strb r0, [r1, #1]
	movs r1, #8
	ldrsb r1, [r7, r1]
	mov r4, ip
	adds r4, #0x24
	movs r5, #0x1f
	ands r1, r5
	ldrb r2, [r4]
	movs r3, #0x20
	negs r3, r3
	adds r0, r3, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r4]
	ldrb r0, [r7, #9]
	mov r2, ip
	strb r0, [r2, #0x10]
	ldr r0, [r7, #0xc]
	str r0, [r2, #4]
	movs r1, #0x10
	ldrsb r1, [r7, r1]
	movs r0, #0x3f
	ands r1, r0
	lsls r1, r1, #5
	ldrh r2, [r2, #0x24]
	ldr r0, _080A60F8  @ 0xFFFFF81F
	ands r0, r2
	orrs r0, r1
	mov r1, ip
	strh r0, [r1, #0x24]
	movs r2, #0x11
	ldrsb r2, [r7, r2]
	movs r0, #0x3f
	ands r2, r0
	lsls r2, r2, #0xb
	ldr r0, [r1, #0x24]
	ldr r1, _080A60FC  @ 0xFFFE07FF
	ands r0, r1
	orrs r0, r2
	mov r2, ip
	str r0, [r2, #0x24]
	ldrb r0, [r7, #0x12]
	strb r0, [r2, #0xe]
	ldrb r0, [r7, #0x13]
	strb r0, [r2, #0xf]
	movs r1, #0x14
	ldrsb r1, [r7, r1]
	adds r4, #2
	ands r1, r5
	lsls r1, r1, #1
	ldrb r2, [r4]
	movs r0, #0x3f
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r4]
	movs r1, #0x15
	ldrsb r1, [r7, r1]
	movs r4, #0x1f
	ands r1, r4
	lsls r1, r1, #6
	mov r0, ip
	ldrh r2, [r0, #0x26]
	ldr r0, _080A6100  @ 0xFFFFF83F
	ands r0, r2
	orrs r0, r1
	mov r1, ip
	strh r0, [r1, #0x26]
	movs r1, #0x16
	ldrsb r1, [r7, r1]
	movs r2, #0x27
	add r2, ip
	mov r8, r2
	lsls r1, r1, #3
	ldrb r2, [r2]
	movs r6, #7
	movs r0, #7
	ands r0, r2
	orrs r0, r1
	mov r1, r8
	strb r0, [r1]
	movs r0, #0x17
	ldrsb r0, [r7, r0]
	mov r2, ip
	adds r2, #0x28
	ands r0, r5
	ldrb r1, [r2]
	ands r3, r1
	orrs r3, r0
	strb r3, [r2]
	movs r1, #0x18
	ldrsb r1, [r7, r1]
	ands r1, r4
	lsls r1, r1, #5
	mov r0, ip
	ldrh r2, [r0, #0x28]
	ldr r0, _080A6104  @ 0xFFFFFC1F
	ands r0, r2
	orrs r0, r1
	mov r1, ip
	strh r0, [r1, #0x28]
	movs r1, #0x19
	ldrsb r1, [r7, r1]
	mov r3, ip
	adds r3, #0x29
	ands r1, r5
	lsls r1, r1, #2
	ldrb r2, [r3]
	movs r0, #0x7d
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	movs r2, #0x1a
	ldrsb r2, [r7, r2]
	movs r4, #0x1f
	ands r2, r4
	lsls r2, r2, #0xf
	mov r1, ip
	ldr r0, [r1, #0x28]
	ldr r1, _080A6108  @ 0xFFF07FFF
	ands r0, r1
	orrs r0, r2
	mov r2, ip
	str r0, [r2, #0x28]
	adds r5, r7, #0
	adds r5, #0x30
	ldrb r2, [r5]
	lsls r1, r2, #0x1c
	lsrs r1, r1, #0x1c
	movs r0, #0x2a
	add r0, ip
	mov r8, r0
	ands r1, r6
	lsls r1, r1, #4
	ldrb r3, [r0]
	movs r0, #0x71
	negs r0, r0
	ands r0, r3
	orrs r0, r1
	mov r1, r8
	strb r0, [r1]
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x1c
	movs r0, #7
	ands r2, r0
	lsls r2, r2, #7
	mov r0, ip
	ldrh r1, [r0, #0x2a]
	ldr r0, _080A610C  @ 0xFFFFFC7F
	ands r0, r1
	orrs r0, r2
	mov r1, ip
	strh r0, [r1, #0x2a]
	adds r0, r7, #0
	adds r0, #0x31
	ldrb r2, [r0]
	lsls r1, r2, #0x1c
	lsrs r1, r1, #0x1c
	movs r0, #0x2b
	add r0, ip
	mov r8, r0
	ands r1, r6
	lsls r1, r1, #2
	ldrb r3, [r0]
	movs r0, #0x1d
	negs r0, r0
	ands r0, r3
	orrs r0, r1
	lsrs r2, r2, #4
	lsls r2, r2, #5
	ands r0, r4
	orrs r0, r2
	mov r1, r8
	strb r0, [r1]
	ldrb r0, [r7, #0x1b]
	mov r2, ip
	strb r0, [r2, #3]
	movs r1, #0x1d
	ldrsb r1, [r7, r1]
	mov r3, ip
	adds r3, #0x2c
	movs r0, #0xf
	ands r1, r0
	ldrb r2, [r3]
	movs r0, #0x10
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	ldrb r0, [r7, #0x1c]
	movs r1, #0x7f
	ands r1, r0
	adds r0, r7, #0
	adds r0, #0x39
	ldrb r3, [r0]
	movs r0, #1
	ands r0, r3
	lsls r0, r0, #7
	orrs r1, r0
	mov r0, ip
	adds r0, #0x30
	strb r1, [r0]
	ldrh r0, [r7, #0x1e]
	ldr r2, _080A6110  @ 0x00003FFF
	adds r1, r2, #0
	ands r1, r0
	movs r0, #6
	ands r0, r3
	lsls r0, r0, #0xd
	orrs r1, r0
	mov r0, ip
	strh r1, [r0, #8]
	ldrh r0, [r7, #0x20]
	adds r1, r2, #0
	ands r1, r0
	movs r0, #0x18
	ands r0, r3
	lsls r0, r0, #0xb
	orrs r1, r0
	mov r0, ip
	strh r1, [r0, #0xa]
	ldrh r0, [r7, #0x22]
	adds r1, r2, #0
	ands r1, r0
	movs r0, #0x60
	ands r0, r3
	lsls r0, r0, #9
	orrs r1, r0
	mov r0, ip
	strh r1, [r0, #0xc]
	ldrh r1, [r7, #0x24]
	ands r1, r2
	lsls r1, r1, #4
	ldr r0, [r0, #0x2c]
	ldr r2, _080A6114  @ 0xFFFC000F
	ands r0, r2
	orrs r0, r1
	mov r1, ip
	str r0, [r1, #0x2c]
	ldrh r1, [r7, #0x26]
	lsls r1, r1, #2
	mov r0, ip
	ldrh r2, [r0, #0x2e]
	movs r0, #3
	ands r0, r2
	orrs r0, r1
	mov r1, ip
	strh r0, [r1, #0x2e]
	movs r2, #0
	mov r9, r5
	mov r4, ip
	adds r4, #0x1a
	adds r6, r7, #0
	adds r6, #0x32
	movs r0, #0x42
	adds r0, r0, r7
	mov r8, r0
	adds r1, r7, #0
	adds r1, #0x43
	str r1, [sp, #0x10]
	movs r0, #0x21
	add r0, ip
	mov sl, r0
	adds r1, #1
	str r1, [sp, #0x14]
	mov r0, ip
	adds r0, #0x22
	str r0, [sp]
	adds r1, #1
	str r1, [sp, #0x18]
	adds r0, #1
	str r0, [sp, #4]
	subs r1, #5
	str r1, [sp, #0xc]
	adds r0, r7, #0
	adds r0, #0x46
	str r0, [sp, #0x1c]
	mov r1, ip
	adds r1, #0x31
	str r1, [sp, #8]
	ldrb r0, [r7, #0xa]
	add r1, sp, #0x20
	strb r0, [r1]
	mov r3, ip
	adds r3, #0x12
	subs r5, #8
_080A6072:
	adds r0, r3, r2
	adds r1, r5, r2
	ldrb r1, [r1]
	strb r1, [r0]
	adds r2, #1
	cmp r2, #7
	ble _080A6072
	movs r2, #0
	adds r3, r6, #0
_080A6084:
	adds r0, r4, r2
	adds r1, r3, r2
	ldrb r1, [r1]
	strb r1, [r0]
	adds r2, #1
	cmp r2, #6
	ble _080A6084
	mov r2, r8
	ldrb r0, [r2]
	mov r1, ip
	strb r0, [r1, #2]
	movs r2, #0x7f
	ands r2, r0
	mov r0, r9
	ldrb r1, [r0]
	lsls r1, r1, #0x1c
	lsrs r1, r1, #0x1c
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _080A60B2
	movs r0, #0x80
	orrs r2, r0
_080A60B2:
	mov r1, ip
	strb r2, [r1, #2]
	ldr r2, [sp, #0x10]
	ldrb r0, [r2]
	mov r1, sl
	strb r0, [r1]
	ldr r2, [sp, #0x14]
	ldrb r0, [r2]
	ldr r1, [sp]
	strb r0, [r1]
	ldr r2, [sp, #0x18]
	ldrb r0, [r2]
	ldr r1, [sp, #4]
	strb r0, [r1]
	ldr r2, [sp, #0xc]
	ldrh r0, [r2]
	mov r1, ip
	strh r0, [r1, #0x32]
	ldr r2, [sp, #0x1c]
	ldrb r0, [r2]
	ldr r1, [sp, #8]
	strb r0, [r1]
	add r2, sp, #0x20
	ldrb r0, [r2]
	mov r2, ip
	strb r0, [r2, #0x11]
_080A60E6:
	add sp, #0x24
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A60F8: .4byte 0xFFFFF81F
_080A60FC: .4byte 0xFFFE07FF
_080A6100: .4byte 0xFFFFF83F
_080A6104: .4byte 0xFFFFFC1F
_080A6108: .4byte 0xFFF07FFF
_080A610C: .4byte 0xFFFFFC7F
_080A6110: .4byte 0x00003FFF
_080A6114: .4byte 0xFFFC000F

	THUMB_FUNC_END PackUnitStructForSuspend

	THUMB_FUNC_START UnpackUnitStructFromSuspend
UnpackUnitStructFromSuspend: @ 0x080A6118
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x4c
	adds r6, r1, #0
	ldr r1, _080A6368  @ ReadSramFast
	ldr r3, [r1]
	mov r1, sp
	movs r2, #0x34
	bl _call_via_r3
	mov r0, sp
	ldrb r0, [r0]
	bl GetCharacterData
	str r0, [r6]
	mov r0, sp
	ldrb r0, [r0, #1]
	bl GetClassData
	str r0, [r6, #4]
	add r0, sp, #0x24
	ldrb r0, [r0]
	lsls r0, r0, #0x1b
	lsrs r0, r0, #0x1b
	strb r0, [r6, #8]
	mov r0, sp
	ldrb r0, [r0, #0x10]
	strb r0, [r6, #9]
	ldr r0, [sp, #4]
	str r0, [r6, #0xc]
	mov r0, sp
	ldrh r0, [r0, #0x24]
	lsls r0, r0, #0x15
	lsrs r0, r0, #0x1a
	strb r0, [r6, #0x10]
	ldr r0, [sp, #0x24]
	lsls r0, r0, #0xf
	lsrs r0, r0, #0x1a
	strb r0, [r6, #0x11]
	mov r0, sp
	ldrb r0, [r0, #0xe]
	strb r0, [r6, #0x12]
	mov r0, sp
	ldrb r0, [r0, #0xf]
	strb r0, [r6, #0x13]
	mov r0, sp
	adds r0, #0x26
	ldrb r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1b
	strb r0, [r6, #0x14]
	mov r0, sp
	ldrh r0, [r0, #0x26]
	lsls r0, r0, #0x15
	lsrs r0, r0, #0x1b
	strb r0, [r6, #0x15]
	mov r0, sp
	adds r0, #0x27
	ldrb r0, [r0]
	lsrs r0, r0, #3
	strb r0, [r6, #0x16]
	add r0, sp, #0x28
	ldrb r0, [r0]
	lsls r0, r0, #0x1b
	lsrs r0, r0, #0x1b
	strb r0, [r6, #0x17]
	mov r0, sp
	ldrh r0, [r0, #0x28]
	lsls r0, r0, #0x16
	lsrs r0, r0, #0x1b
	strb r0, [r6, #0x18]
	mov r0, sp
	adds r0, #0x29
	ldrb r0, [r0]
	lsls r0, r0, #0x19
	lsrs r0, r0, #0x1b
	strb r0, [r6, #0x19]
	ldr r0, [sp, #0x28]
	lsls r0, r0, #0xc
	lsrs r0, r0, #0x1b
	strb r0, [r6, #0x1a]
	mov r0, sp
	adds r0, #0x2a
	ldrb r0, [r0]
	lsls r0, r0, #0x19
	adds r4, r6, #0
	adds r4, #0x30
	movs r5, #0xf
	lsrs r0, r0, #0x1d
	ldrb r1, [r4]
	movs r7, #0x10
	negs r7, r7
	adds r3, r7, #0
	ands r3, r1
	orrs r3, r0
	strb r3, [r4]
	lsls r0, r3, #0x1c
	lsrs r2, r0, #0x1c
	mov r0, sp
	ldrb r1, [r0, #2]
	movs r0, #0x80
	mov r8, r0
	ands r0, r1
	cmp r0, #0
	beq _080A61F4
	movs r0, #8
	orrs r2, r0
_080A61F4:
	mov r0, sp
	ldrh r0, [r0, #0x2a]
	lsls r0, r0, #0x16
	lsrs r0, r0, #0x1d
	lsls r0, r0, #4
	ands r2, r5
	orrs r2, r0
	strb r2, [r4]
	mov r0, sp
	adds r0, #0x2b
	ldrb r1, [r0]
	lsls r0, r1, #0x1b
	lsrs r0, r0, #0x1d
	adds r2, r6, #0
	adds r2, #0x31
	lsrs r1, r1, #5
	lsls r1, r1, #4
	ands r0, r5
	orrs r0, r1
	strb r0, [r2]
	mov r0, sp
	ldrb r0, [r0, #3]
	strb r0, [r6, #0x1b]
	add r0, sp, #0x2c
	ldrb r0, [r0]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1c
	strb r0, [r6, #0x1d]
	add r0, sp, #0x30
	ldrb r2, [r0]
	movs r0, #0x7f
	ands r0, r2
	strb r0, [r6, #0x1c]
	mov r0, sp
	ldrh r5, [r0, #8]
	ldr r1, _080A636C  @ 0x00003FFF
	adds r0, r1, #0
	ands r0, r5
	strh r0, [r6, #0x1e]
	mov r0, sp
	ldrh r4, [r0, #0xa]
	adds r0, r1, #0
	ands r0, r4
	strh r0, [r6, #0x20]
	mov r0, sp
	ldrh r3, [r0, #0xc]
	ands r1, r3
	strh r1, [r6, #0x22]
	ldr r0, [sp, #0x2c]
	lsls r0, r0, #0xe
	lsrs r0, r0, #0x12
	strh r0, [r6, #0x24]
	mov r0, sp
	ldrh r0, [r0, #0x2e]
	lsrs r0, r0, #2
	strh r0, [r6, #0x26]
	mov r1, r8
	ands r1, r2
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x1f
	movs r2, #0xc0
	lsls r2, r2, #8
	adds r0, r2, #0
	ands r0, r5
	lsrs r0, r0, #0xd
	orrs r0, r1
	adds r1, r2, #0
	ands r1, r4
	lsrs r1, r1, #0xb
	orrs r1, r0
	ands r2, r3
	lsrs r2, r2, #9
	orrs r2, r1
	adds r0, r6, #0
	adds r0, #0x39
	strb r2, [r0]
	movs r2, #0
	adds r7, r6, #0
	adds r7, #0x32
	mov r5, sp
	adds r5, #0x1a
	movs r1, #0x42
	adds r1, r1, r6
	mov sl, r1
	movs r0, #0x21
	add r0, sp
	mov ip, r0
	adds r1, r6, #0
	adds r1, #0x43
	str r1, [sp, #0x3c]
	movs r0, #0x22
	add r0, sp
	mov r8, r0
	adds r1, #1
	str r1, [sp, #0x40]
	movs r0, #0x23
	add r0, sp
	mov r9, r0
	adds r1, #1
	str r1, [sp, #0x44]
	adds r0, r6, #0
	adds r0, #0x40
	str r0, [sp, #0x38]
	mov r1, sp
	adds r1, #0x31
	str r1, [sp, #0x34]
	adds r0, #6
	str r0, [sp, #0x48]
	adds r4, r6, #0
	adds r4, #0x28
	mov r3, sp
	adds r3, #0x12
_080A62D4:
	adds r0, r4, r2
	adds r1, r3, r2
	ldrb r1, [r1]
	strb r1, [r0]
	adds r2, #1
	cmp r2, #7
	ble _080A62D4
	movs r2, #0
	adds r4, r7, #0
	adds r3, r5, #0
_080A62E8:
	adds r0, r4, r2
	adds r1, r3, r2
	ldrb r1, [r1]
	strb r1, [r0]
	adds r2, #1
	cmp r2, #6
	ble _080A62E8
	mov r0, sp
	ldrb r1, [r0, #2]
	movs r0, #0x7f
	ands r0, r1
	mov r1, sl
	strb r0, [r1]
	mov r1, ip
	ldrb r0, [r1]
	ldr r1, [sp, #0x3c]
	strb r0, [r1]
	mov r1, r8
	ldrb r0, [r1]
	ldr r1, [sp, #0x40]
	strb r0, [r1]
	mov r1, r9
	ldrb r0, [r1]
	ldr r1, [sp, #0x44]
	strb r0, [r1]
	mov r0, sp
	ldrh r0, [r0, #0x32]
	ldr r1, [sp, #0x38]
	strh r0, [r1]
	ldr r1, [sp, #0x34]
	ldrb r0, [r1]
	ldr r1, [sp, #0x48]
	strb r0, [r1]
	mov r0, sp
	ldrb r0, [r0, #0x11]
	strb r0, [r6, #0xa]
	ldrb r0, [r6, #9]
	cmp r0, #0x7f
	bne _080A633A
	movs r0, #0xff
	strb r0, [r6, #9]
_080A633A:
	ldrb r1, [r6, #0x10]
	movs r0, #0x10
	ldrsb r0, [r6, r0]
	cmp r0, #0x3f
	bne _080A6348
	movs r0, #0xff
	strb r0, [r6, #0x10]
_080A6348:
	ldrb r1, [r6, #0x11]
	movs r0, #0x11
	ldrsb r0, [r6, r0]
	cmp r0, #0x3f
	bne _080A6356
	movs r0, #0xff
	strb r0, [r6, #0x11]
_080A6356:
	add sp, #0x4c
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A6368: .4byte ReadSramFast
_080A636C: .4byte 0x00003FFF

	THUMB_FUNC_END UnpackUnitStructFromSuspend

	THUMB_FUNC_START SaveTrapStructs
SaveTrapStructs: @ 0x080A6370
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0
	bl GetTrap
	movs r2, #0x80
	lsls r2, r2, #2
	adds r1, r4, #0
	bl WriteAndVerifySramFast
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END SaveTrapStructs

	THUMB_FUNC_START sub_80A638C
sub_80A638C: @ 0x080A638C
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _080A63AC  @ ReadSramFast
	movs r0, #0
	bl GetTrap
	adds r1, r0, #0
	movs r2, #0x80
	lsls r2, r2, #2
	ldr r3, [r4]
	adds r0, r5, #0
	bl _call_via_r3
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A63AC: .4byte ReadSramFast

	THUMB_FUNC_END sub_80A638C

	THUMB_FUNC_START sub_80A63B0
sub_80A63B0: @ 0x080A63B0
	push {lr}
	sub sp, #0x64
	mov r0, sp
	bl LoadAndVerifySecureHeaderSW
	mov r0, sp
	adds r0, #0x63
	ldrb r0, [r0]
	cmp r0, #1
	beq _080A63C8
	movs r0, #0
	b _080A63CA
_080A63C8:
	movs r0, #1
_080A63CA:
	add sp, #0x64
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80A63B0

	THUMB_FUNC_START sub_80A63D0
sub_80A63D0: @ 0x080A63D0
	push {lr}
	bl sub_80A63B0
	adds r1, r0, #0
	movs r0, #1
	subs r0, r0, r1
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80A63D0

	THUMB_FUNC_START sub_80A63E0
sub_80A63E0: @ 0x080A63E0
	push {lr}
	sub sp, #0x64
	mov r0, sp
	bl LoadAndVerifySecureHeaderSW
	movs r2, #0
	mov r1, sp
	adds r1, #0x63
	ldrb r0, [r1]
	cmp r0, #0
	bne _080A63F8
	movs r2, #1
_080A63F8:
	strb r2, [r1]
	mov r0, sp
	bl ForceSaveSecureHeader
	add sp, #0x64
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80A63E0

	THUMB_FUNC_START sub_80A6408
sub_80A6408: @ 0x080A6408
	push {r4, r5, lr}
	adds r5, r1, #0
	ldr r1, _080A6428  @ ReadSramFast
	ldr r4, _080A642C  @ gUnknown_02020188
	ldr r3, [r1]
	adds r1, r4, #0
	adds r2, r5, #0
	bl _call_via_r3
	adds r0, r4, #0
	adds r1, r5, #0
	bl CalcSomeChecksum
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080A6428: .4byte ReadSramFast
_080A642C: .4byte gUnknown_02020188

	THUMB_FUNC_END sub_80A6408

	THUMB_FUNC_START sub_80A6430
sub_80A6430: @ 0x080A6430
	push {r4, r5, lr}
	adds r4, r0, #0
	ldrh r5, [r4, #0xa]
	ldrh r0, [r4, #8]
	bl SramOffsetToPointer
	adds r1, r5, #0
	bl sub_80A6408
	ldr r1, [r4, #0xc]
	cmp r1, r0
	bne _080A644C
	movs r0, #1
	b _080A644E
_080A644C:
	movs r0, #0
_080A644E:
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80A6430

	THUMB_FUNC_START sub_80A6454
sub_80A6454: @ 0x080A6454
	push {r4, r5, lr}
	adds r4, r0, #0
	ldrh r5, [r4, #0xa]
	ldrh r0, [r4, #8]
	bl SramOffsetToPointer
	adds r1, r5, #0
	bl sub_80A6408
	str r0, [r4, #0xc]
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80A6454

	THUMB_FUNC_START sub_80A6470
sub_80A6470: @ 0x080A6470
	push {r4, r5, r6, lr}
	movs r6, #0
	ldr r4, _080A6538  @ gUnitArrayBlue
	movs r5, #0x32
_080A6478:
	ldr r0, [r4]
	cmp r0, #0
	beq _080A6490
	movs r0, #0
	str r0, [r4, #0x3c]
	adds r0, r4, #0
	movs r1, #0x24
	bl sub_80A6408
	adds r0, r6, r0
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
_080A6490:
	adds r4, #0x48
	subs r5, #1
	cmp r5, #0
	bge _080A6478
	ldr r4, _080A653C  @ gUnitArrayRed
	movs r5, #0x31
_080A649C:
	ldr r0, [r4]
	cmp r0, #0
	beq _080A64B4
	movs r0, #0
	str r0, [r4, #0x3c]
	adds r0, r4, #0
	movs r1, #0x24
	bl sub_80A6408
	adds r0, r6, r0
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
_080A64B4:
	adds r4, #0x48
	subs r5, #1
	cmp r5, #0
	bge _080A649C
	ldr r4, _080A6540  @ gUnitArrayGreen
	movs r5, #9
_080A64C0:
	ldr r0, [r4]
	cmp r0, #0
	beq _080A64D8
	movs r0, #0
	str r0, [r4, #0x3c]
	adds r0, r4, #0
	movs r1, #0x24
	bl sub_80A6408
	adds r0, r6, r0
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
_080A64D8:
	adds r4, #0x48
	subs r5, #1
	cmp r5, #0
	bge _080A64C0
	bl GetGlobalEventIdStorage
	adds r4, r0, #0
	bl GetGlobalEventIdStorageSize
	adds r1, r0, #0
	lsrs r0, r1, #0x1f
	adds r1, r1, r0
	asrs r1, r1, #1
	adds r0, r4, #0
	bl sub_80A6408
	adds r0, r6, r0
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	bl GetLocalEventIdStorage
	adds r4, r0, #0
	bl GetLocalEventIdStorageSize
	adds r1, r0, #0
	lsrs r0, r1, #0x1f
	adds r1, r1, r0
	asrs r1, r1, #1
	adds r0, r4, #0
	bl sub_80A6408
	adds r0, r6, r0
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	movs r0, #0
	bl GetTrap
	movs r1, #0x80
	lsls r1, r1, #1
	bl sub_80A6408
	adds r0, r6, r0
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	adds r0, r6, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_080A6538: .4byte gUnitArrayBlue
_080A653C: .4byte gUnitArrayRed
_080A6540: .4byte gUnitArrayGreen

	THUMB_FUNC_END sub_80A6470

	THUMB_FUNC_START sub_80A6544
sub_80A6544: @ 0x080A6544
	sub sp, #8
	add sp, #8
	bx lr

	THUMB_FUNC_END sub_80A6544

	THUMB_FUNC_START sub_80A654C
sub_80A654C: @ 0x080A654C
	push {lr}
	adds r1, r0, #0
	movs r0, #0
	bl SaveMetadata_Check
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80A654C

	THUMB_FUNC_START sub_80A6560
sub_80A6560: @ 0x080A6560
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x80
	movs r0, #5
	bl GetSaveDataLocation
	mov r9, r0
	add r0, sp, #0x6c
	movs r4, #0
	strh r4, [r0]
	add r5, sp, #0x24
	ldr r2, _080A66A8  @ 0x01000012
	adds r1, r5, #0
	bl CpuSet
	mov r0, sp
	adds r0, #0x6e
	strh r4, [r0]
	add r4, sp, #0x48
	ldr r2, _080A66AC  @ 0x01000007
	adds r1, r4, #0
	bl CpuSet
	movs r7, #0
	mov r8, r5
	add r0, sp, #0x70
	mov sl, r0
	mov r1, sp
	adds r1, #0x58
	str r1, [sp, #0x78]
	mov r3, sp
	adds r3, #0x5c
	str r3, [sp, #0x7c]
	mov r5, sp
	adds r5, #0x14
	str r5, [sp, #0x74]
	mov r6, r9
_080A65B0:
	movs r0, #0xc4
	muls r0, r7, r0
	adds r0, #0x10
	mov r1, r9
	adds r4, r1, r0
	movs r5, #4
_080A65BC:
	mov r0, r8
	adds r1, r4, #0
	movs r2, #0x24
	bl WriteAndVerifySramFast
	adds r4, #0x24
	subs r5, #1
	cmp r5, #0
	bge _080A65BC
	add r0, sp, #0x48
	adds r1, r6, #0
	movs r2, #0xf
	bl WriteAndVerifySramFast
	adds r6, #0xc4
	adds r7, #1
	cmp r7, #9
	ble _080A65B0
	movs r0, #7
	mov r3, sl
	strh r0, [r3]
	movs r1, #0xf5
	lsls r1, r1, #3
	add r1, r9
	mov r0, sl
	movs r2, #2
	bl WriteAndVerifySramFast
	movs r7, #0
	ldr r5, [sp, #0x78]
	mov r8, r5
	movs r0, #3
	mov sl, r0
	ldr r6, _080A66B0  @ 0x000007AC
	add r6, r9
	movs r1, #0
	mov r9, r1
_080A6606:
	ldr r4, _080A66B4  @ gUnknown_08205CB4
	lsls r3, r7, #2
	mov ip, r3
	add r4, r9
	ldrb r3, [r4]
	lsls r1, r3, #0x1e
	lsrs r1, r1, #0x1e
	mov r5, sl
	ands r1, r5
	mov r0, r8
	ldrb r2, [r0]
	movs r5, #4
	negs r5, r5
	adds r0, r5, #0
	ands r2, r0
	orrs r2, r1
	lsls r0, r3, #0x1c
	lsrs r0, r0, #0x1e
	mov r1, sl
	ands r0, r1
	lsls r0, r0, #2
	subs r5, #9
	adds r1, r5, #0
	ands r2, r1
	orrs r2, r0
	movs r1, #0x10
	ands r1, r3
	movs r3, #0x11
	negs r3, r3
	adds r0, r3, #0
	ands r2, r0
	orrs r2, r1
	mov r5, r8
	strb r2, [r5]
	ldr r2, [r4]
	lsrs r2, r2, #5
	lsls r2, r2, #5
	ldr r0, [sp, #0x58]
	movs r1, #0x1f
	ands r0, r1
	orrs r0, r2
	str r0, [sp, #0x58]
	ldr r0, _080A66B8  @ gUnknown_08A1FB08
	mov r1, ip
	adds r5, r1, r0
	ldr r0, [r5]
	mov r1, sp
	bl GetStringFromIndexInBuffer
	mov r0, sp
	ldr r1, [sp, #0x7c]
	bl sub_8042DC8
	mov r0, r8
	adds r1, r6, #0
	movs r2, #0x14
	bl WriteAndVerifySramFast
	adds r6, #0x14
	movs r3, #0x14
	add r9, r3
	adds r7, #1
	cmp r7, #9
	ble _080A6606
	ldr r0, _080A66BC  @ 0x00020112
	str r0, [sp, #0x14]
	movs r0, #2
	ldr r5, [sp, #0x74]
	strb r0, [r5, #6]
	ldr r0, [sp, #0x74]
	movs r1, #5
	bl SaveMetadata_Generate
	add sp, #0x80
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A66A8: .4byte 0x01000012
_080A66AC: .4byte 0x01000007
_080A66B0: .4byte 0x000007AC
_080A66B4: .4byte gUnknown_08205CB4
_080A66B8: .4byte gUnknown_08A1FB08
_080A66BC: .4byte 0x00020112

	THUMB_FUNC_END sub_80A6560

	THUMB_FUNC_START sub_80A66C0
sub_80A66C0: @ 0x080A66C0
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	movs r0, #5
	bl CheckSaveAndGetPointer
	ldr r2, _080A66E8  @ ReadSramFast
	movs r1, #0xc4
	muls r1, r4, r1
	adds r0, r0, r1
	ldr r3, [r2]
	adds r1, r5, #0
	movs r2, #0xc4
	bl _call_via_r3
	ldrb r0, [r5]
	cmp r0, #0
	beq _080A66EC
	movs r0, #1
	b _080A66EE
	.align 2, 0
_080A66E8: .4byte ReadSramFast
_080A66EC:
	movs r0, #0
_080A66EE:
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80A66C0

	THUMB_FUNC_START sub_80A66F4
sub_80A66F4: @ 0x080A66F4
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	movs r0, #5
	bl CheckSaveAndGetPointer
	ldr r2, _080A6728  @ ReadSramFast
	movs r1, #0xc4
	muls r1, r4, r1
	adds r0, r0, r1
	ldr r4, _080A672C  @ gUnknown_0203EDBC
	ldr r3, [r2]
	adds r1, r4, #0
	movs r2, #0xc4
	bl _call_via_r3
	ldrb r0, [r4]
	cmp r0, #0
	beq _080A6730
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_8042DC8
	movs r0, #1
	b _080A6732
	.align 2, 0
_080A6728: .4byte ReadSramFast
_080A672C: .4byte gUnknown_0203EDBC
_080A6730:
	movs r0, #0
_080A6732:
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80A66F4

	THUMB_FUNC_START sub_80A6738
sub_80A6738: @ 0x080A6738
	push {r4, r5, lr}
	sub sp, #0x10
	adds r4, r0, #0
	adds r5, r1, #0
	movs r0, #5
	bl GetSaveDataLocation
	adds r1, r0, #0
	movs r0, #0xc4
	muls r0, r4, r0
	adds r1, r1, r0
	adds r0, r5, #0
	movs r2, #0xf
	bl WriteAndVerifySramFast
	ldr r0, _080A6770  @ 0x00020112
	str r0, [sp]
	mov r1, sp
	movs r0, #2
	strb r0, [r1, #6]
	mov r0, sp
	movs r1, #5
	bl SaveMetadata_Generate
	add sp, #0x10
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A6770: .4byte 0x00020112

	THUMB_FUNC_END sub_80A6738

	THUMB_FUNC_START sub_80A6774
sub_80A6774: @ 0x080A6774
	push {r4, r5, r6, lr}
	sub sp, #0x14
	adds r6, r0, #0
	movs r0, #5
	bl GetSaveDataLocation
	adds r4, r0, #0
	add r0, sp, #0x10
	movs r1, #0
	strh r1, [r0]
	ldr r5, _080A67BC  @ gUnknown_0203EDBC
	ldr r2, _080A67C0  @ 0x01000062
	adds r1, r5, #0
	bl CpuSet
	movs r0, #0xc4
	muls r0, r6, r0
	adds r4, r4, r0
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #0xc4
	bl WriteAndVerifySramFast
	ldr r0, _080A67C4  @ 0x00020112
	str r0, [sp]
	mov r1, sp
	movs r0, #2
	strb r0, [r1, #6]
	mov r0, sp
	movs r1, #5
	bl SaveMetadata_Generate
	add sp, #0x14
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A67BC: .4byte gUnknown_0203EDBC
_080A67C0: .4byte 0x01000062
_080A67C4: .4byte 0x00020112

	THUMB_FUNC_END sub_80A6774

	THUMB_FUNC_START sub_80A67C8
sub_80A67C8: @ 0x080A67C8
	push {r4, r5, r6, lr}
	mov r6, r9
	mov r5, r8
	push {r5, r6}
	sub sp, #0x10
	adds r6, r0, #0
	mov r9, r1
	movs r0, #5
	bl CheckSaveAndGetPointer
	adds r4, r0, #0
	movs r0, #5
	bl GetSaveDataLocation
	adds r5, r0, #0
	ldr r1, _080A6834  @ ReadSramFast
	movs r0, #0xc4
	mov r8, r0
	mov r0, r8
	muls r0, r6, r0
	adds r4, r4, r0
	ldr r6, _080A6838  @ gUnknown_0203EDBC
	ldr r3, [r1]
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #0xc4
	bl _call_via_r3
	mov r1, r8
	mov r0, r9
	muls r0, r1, r0
	adds r5, r5, r0
	adds r0, r6, #0
	adds r1, r5, #0
	movs r2, #0xc4
	bl WriteAndVerifySramFast
	ldr r0, _080A683C  @ 0x00020112
	str r0, [sp]
	mov r1, sp
	movs r0, #2
	strb r0, [r1, #6]
	mov r0, sp
	movs r1, #5
	bl SaveMetadata_Generate
	add sp, #0x10
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A6834: .4byte ReadSramFast
_080A6838: .4byte gUnknown_0203EDBC
_080A683C: .4byte 0x00020112

	THUMB_FUNC_END sub_80A67C8

	THUMB_FUNC_START sub_80A6840
sub_80A6840: @ 0x080A6840
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	mov r8, r0
	mov sl, r1
	movs r0, #5
	bl CheckSaveAndGetPointer
	adds r5, r0, #0
	movs r0, #5
	bl GetSaveDataLocation
	adds r6, r0, #0
	ldr r0, _080A68CC  @ ReadSramFast
	mov r9, r0
	movs r4, #0xc4
	mov r7, r8
	muls r7, r4, r7
	adds r0, r5, r7
	mov r1, r9
	ldr r3, [r1]
	ldr r1, _080A68D0  @ gUnknown_0203EDBC
	movs r2, #0xc4
	bl _call_via_r3
	mov r0, sl
	muls r0, r4, r0
	adds r4, r0, #0
	adds r5, r5, r4
	ldr r1, _080A68D4  @ gUnknown_0203EE80
	mov r8, r1
	mov r0, r9
	ldr r3, [r0]
	adds r0, r5, #0
	movs r2, #0xc4
	bl _call_via_r3
	adds r4, r6, r4
	ldr r0, _080A68D0  @ gUnknown_0203EDBC
	adds r1, r4, #0
	movs r2, #0xc4
	bl WriteAndVerifySramFast
	adds r6, r6, r7
	mov r0, r8
	adds r1, r6, #0
	movs r2, #0xc4
	bl WriteAndVerifySramFast
	ldr r0, _080A68D8  @ 0x00020112
	str r0, [sp]
	mov r1, sp
	movs r0, #2
	strb r0, [r1, #6]
	mov r0, sp
	movs r1, #5
	bl SaveMetadata_Generate
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A68CC: .4byte ReadSramFast
_080A68D0: .4byte gUnknown_0203EDBC
_080A68D4: .4byte gUnknown_0203EE80
_080A68D8: .4byte 0x00020112

	THUMB_FUNC_END sub_80A6840

	THUMB_FUNC_START sub_80A68DC
sub_80A68DC: @ 0x080A68DC
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #0x10
	adds r4, r0, #0
	mov r8, r1
	adds r6, r2, #0
	movs r0, #5
	bl GetSaveDataLocation
	adds r5, r0, #0
	movs r0, #0xc4
	muls r4, r0, r4
	adds r1, r5, r4
	adds r0, r6, #0
	movs r2, #0xf
	bl WriteAndVerifySramFast
	adds r4, #0x10
	adds r5, r5, r4
	mov r4, r8
	movs r6, #4
_080A6908:
	adds r0, r4, #0
	adds r1, r5, #0
	bl SaveUnit
	adds r5, #0x24
	adds r4, #0x48
	subs r6, #1
	cmp r6, #0
	bge _080A6908
	ldr r0, _080A6938  @ 0x00020112
	str r0, [sp]
	mov r1, sp
	movs r0, #2
	strb r0, [r1, #6]
	mov r0, sp
	movs r1, #5
	bl SaveMetadata_Generate
	add sp, #0x10
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A6938: .4byte 0x00020112

	THUMB_FUNC_END sub_80A68DC

	THUMB_FUNC_START sub_80A693C
sub_80A693C: @ 0x080A693C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	adds r6, r1, #0
	adds r5, r2, #0
	movs r0, #5
	bl CheckSaveAndGetPointer
	adds r7, r0, #0
	ldr r1, _080A6990  @ ReadSramFast
	movs r0, #0xc4
	mov r4, r8
	muls r4, r0, r4
	adds r0, r7, r4
	ldr r3, [r1]
	adds r1, r5, #0
	movs r2, #0xf
	bl _call_via_r3
	adds r4, #0x10
	adds r4, r7, r4
	movs r5, #4
_080A696A:
	adds r0, r4, #0
	adds r1, r6, #0
	bl LoadSavedUnit
	adds r6, #0x48
	adds r4, #0x24
	subs r5, #1
	cmp r5, #0
	bge _080A696A
	movs r0, #0xc4
	mov r1, r8
	muls r1, r0, r1
	adds r0, r1, #0
	adds r0, r7, r0
	ldrb r0, [r0]
	cmp r0, #0
	beq _080A6994
	movs r0, #1
	b _080A6996
	.align 2, 0
_080A6990: .4byte ReadSramFast
_080A6994:
	movs r0, #0
_080A6996:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80A693C

	THUMB_FUNC_START sub_80A69A0
sub_80A69A0: @ 0x080A69A0
	push {r4, lr}
	sub sp, #0x10
	adds r4, r0, #0
	movs r0, #5
	bl GetSaveDataLocation
	adds r1, r0, #0
	ldr r0, _080A69D4  @ 0x000007AC
	adds r1, r1, r0
	adds r0, r4, #0
	movs r2, #0xc8
	bl WriteAndVerifySramFast
	ldr r0, _080A69D8  @ 0x00020112
	str r0, [sp]
	mov r1, sp
	movs r0, #2
	strb r0, [r1, #6]
	mov r0, sp
	movs r1, #5
	bl SaveMetadata_Generate
	add sp, #0x10
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A69D4: .4byte 0x000007AC
_080A69D8: .4byte 0x00020112

	THUMB_FUNC_END sub_80A69A0

	THUMB_FUNC_START sub_80A69DC
sub_80A69DC: @ 0x080A69DC
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #5
	bl CheckSaveAndGetPointer
	ldr r1, _080A69FC  @ ReadSramFast
	ldr r2, _080A6A00  @ 0x000007AC
	adds r0, r0, r2
	ldr r3, [r1]
	adds r1, r4, #0
	movs r2, #0xc8
	bl _call_via_r3
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A69FC: .4byte ReadSramFast
_080A6A00: .4byte 0x000007AC

	THUMB_FUNC_END sub_80A69DC

	THUMB_FUNC_START sub_80A6A04
sub_80A6A04: @ 0x080A6A04
	push {r4, lr}
	sub sp, #0x10
	adds r4, r0, #0
	movs r0, #5
	bl GetSaveDataLocation
	adds r1, r0, #0
	movs r0, #0xf5
	lsls r0, r0, #3
	adds r1, r1, r0
	adds r0, r4, #0
	movs r2, #2
	bl WriteAndVerifySramFast
	ldr r0, _080A6A3C  @ 0x00020112
	str r0, [sp]
	mov r1, sp
	movs r0, #2
	strb r0, [r1, #6]
	mov r0, sp
	movs r1, #5
	bl SaveMetadata_Generate
	add sp, #0x10
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A6A3C: .4byte 0x00020112

	THUMB_FUNC_END sub_80A6A04

	THUMB_FUNC_START sub_80A6A40
sub_80A6A40: @ 0x080A6A40
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #5
	bl CheckSaveAndGetPointer
	ldr r1, _080A6A64  @ ReadSramFast
	movs r2, #0xf5
	lsls r2, r2, #3
	adds r0, r0, r2
	ldr r3, [r1]
	adds r1, r4, #0
	movs r2, #2
	bl _call_via_r3
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A6A64: .4byte ReadSramFast

	THUMB_FUNC_END sub_80A6A40

	THUMB_FUNC_START sub_80A6A68
sub_80A6A68: @ 0x080A6A68
	push {r4, lr}
	sub sp, #0x10
	movs r0, #5
	bl sub_80A654C
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080A6A7E
	b _080A6A96
_080A6A7A:
	movs r0, #1
	b _080A6A98
_080A6A7E:
	movs r4, #0
_080A6A80:
	adds r0, r4, #0
	mov r1, sp
	bl sub_80A66F4
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq _080A6A7A
	adds r4, #1
	cmp r4, #9
	ble _080A6A80
_080A6A96:
	movs r0, #0
_080A6A98:
	add sp, #0x10
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80A6A68

	THUMB_FUNC_START sub_80A6AA0
sub_80A6AA0: @ 0x080A6AA0
	push {r4, lr}
	sub sp, #0x4c
	movs r0, #3
	bl sub_80A5DA8
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A6AE8
	movs r0, #3
	mov r1, sp
	bl sub_80A5DFC
	mov r0, sp
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x7f
	bne _080A6AE8
	ldr r1, _080A6AF0  @ ReadSramFast
	ldr r0, _080A6AF4  @ gUnknown_08A1FB30
	ldr r0, [r0]
	ldr r4, _080A6AF8  @ gUnknown_0203EF44
	ldr r3, [r1]
	adds r1, r4, #0
	movs r2, #0x1c
	bl _call_via_r3
	ldr r0, [sp, #0x2c]
	lsls r0, r0, #9
	lsrs r0, r0, #0x16
	ldrb r4, [r4, #0xf]
	cmp r0, r4
	beq _080A6AE8
	movs r0, #3
	bl sub_80A5A20
_080A6AE8:
	add sp, #0x4c
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A6AF0: .4byte ReadSramFast
_080A6AF4: .4byte gUnknown_08A1FB30
_080A6AF8: .4byte gUnknown_0203EF44

	THUMB_FUNC_END sub_80A6AA0

	THUMB_FUNC_START sub_80A6AFC
sub_80A6AFC: @ 0x080A6AFC
	push {r4, r5, lr}
	ldr r1, _080A6B4C  @ ReadSramFast
	ldr r5, _080A6B50  @ gUnknown_08A1FB30
	ldr r0, [r5]
	ldr r4, _080A6B54  @ gUnknown_0203EF44
	ldr r3, [r1]
	adds r1, r4, #0
	movs r2, #0x1c
	bl _call_via_r3
	ldr r1, [r4]
	ldr r0, _080A6B58  @ 0x50414D58
	cmp r1, r0
	bne _080A6B68
	bl GetSomeByte
	lsls r0, r0, #0x18
	ldr r1, _080A6B5C  @ 0x00020223
	adds r0, r0, r1
	ldr r1, [r4, #8]
	cmp r1, r0
	bne _080A6B68
	ldr r0, [r4, #0x10]
	ldr r1, [r5]
	adds r0, r0, r1
	str r0, [r4, #0x10]
	ldr r0, [r4, #0x18]
	adds r0, r0, r1
	str r0, [r4, #0x18]
	ldr r3, _080A6B60  @ gRAMChapterData
	ldrb r2, [r4, #0xf]
	lsls r2, r2, #0xd
	ldr r0, [r3, #0x2c]
	ldr r1, _080A6B64  @ 0xFF801FFF
	ands r0, r1
	orrs r0, r2
	str r0, [r3, #0x2c]
	movs r0, #1
	b _080A6B6A
	.align 2, 0
_080A6B4C: .4byte ReadSramFast
_080A6B50: .4byte gUnknown_08A1FB30
_080A6B54: .4byte gUnknown_0203EF44
_080A6B58: .4byte 0x50414D58
_080A6B5C: .4byte 0x00020223
_080A6B60: .4byte gRAMChapterData
_080A6B64: .4byte 0xFF801FFF
_080A6B68:
	movs r0, #0
_080A6B6A:
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80A6AFC

	THUMB_FUNC_START sub_80A6B70
sub_80A6B70: @ 0x080A6B70
	push {lr}
	ldr r2, _080A6B80  @ gUnknown_0203EF44
	ldr r1, [r2]
	ldr r0, _080A6B84  @ 0x50414D58
	cmp r1, r0
	bne _080A6B88
	ldr r0, [r2, #0x10]
	b _080A6B8A
	.align 2, 0
_080A6B80: .4byte gUnknown_0203EF44
_080A6B84: .4byte 0x50414D58
_080A6B88:
	movs r0, #0
_080A6B8A:
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80A6B70

	THUMB_FUNC_START sub_80A6B90
sub_80A6B90: @ 0x080A6B90
	push {lr}
	ldr r2, _080A6BA4  @ gUnknown_0203EF44
	ldr r1, [r2]
	ldr r0, _080A6BA8  @ 0x50414D58
	cmp r1, r0
	bne _080A6BAC
	movs r1, #0x14
	ldrsh r0, [r2, r1]
	b _080A6BAE
	.align 2, 0
_080A6BA4: .4byte gUnknown_0203EF44
_080A6BA8: .4byte 0x50414D58
_080A6BAC:
	movs r0, #0
_080A6BAE:
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80A6B90

	THUMB_FUNC_START sub_80A6BB4
sub_80A6BB4: @ 0x080A6BB4
	push {lr}
	ldr r2, _080A6BC4  @ gUnknown_0203EF44
	ldr r1, [r2]
	ldr r0, _080A6BC8  @ 0x50414D58
	cmp r1, r0
	bne _080A6BCC
	ldr r0, [r2, #0x18]
	b _080A6BCE
	.align 2, 0
_080A6BC4: .4byte gUnknown_0203EF44
_080A6BC8: .4byte 0x50414D58
_080A6BCC:
	movs r0, #0
_080A6BCE:
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80A6BB4

	THUMB_FUNC_START sub_80A6BD4
sub_80A6BD4: @ 0x080A6BD4
	push {lr}
	ldr r2, _080A6BE8  @ gUnknown_0203EF44
	ldr r1, [r2]
	ldr r0, _080A6BEC  @ 0x50414D58
	cmp r1, r0
	bne _080A6BF0
	movs r1, #0x16
	ldrsh r0, [r2, r1]
	b _080A6BF2
	.align 2, 0
_080A6BE8: .4byte gUnknown_0203EF44
_080A6BEC: .4byte 0x50414D58
_080A6BF0:
	movs r0, #0
_080A6BF2:
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80A6BD4

	THUMB_FUNC_START sub_80A6BF8
sub_80A6BF8: @ 0x080A6BF8
	push {lr}
	adds r2, r0, #0
	movs r3, #0
	lsrs r0, r1, #0x1f
	adds r1, r1, r0
	asrs r1, r1, #1
	cmp r3, r1
	bge _080A6C14
_080A6C08:
	ldrh r0, [r2]
	adds r3, r3, r0
	adds r2, #2
	subs r1, #1
	cmp r1, #0
	bne _080A6C08
_080A6C14:
	lsls r0, r3, #0x10
	lsrs r0, r0, #0x10
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80A6BF8

	THUMB_FUNC_START sub_80A6C1C
sub_80A6C1C: @ 0x080A6C1C
	push {r4, lr}
	ldr r4, _080A6C70  @ gUnknown_02020188
	bl IsSramWorking
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A6C84
	ldr r1, _080A6C74  @ ReadSramFast
	ldr r0, _080A6C78  @ 0x0E007400
	movs r2, #0xc0
	lsls r2, r2, #4
	ldr r3, [r1]
	adds r1, r4, #0
	bl _call_via_r3
	ldr r1, [r4]
	ldr r0, _080A6C7C  @ 0x50414D58
	cmp r1, r0
	bne _080A6C84
	bl GetSomeByte
	lsls r0, r0, #0x18
	ldr r1, _080A6C80  @ 0x00020223
	adds r0, r0, r1
	ldr r1, [r4, #8]
	cmp r1, r0
	bne _080A6C84
	ldrh r0, [r4, #4]
	cmp r0, #0
	beq _080A6C84
	adds r0, r4, #0
	adds r0, #8
	ldrh r1, [r4, #4]
	bl sub_80A6BF8
	ldrh r1, [r4, #6]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r1, r0
	bne _080A6C84
	movs r0, #1
	b _080A6C86
	.align 2, 0
_080A6C70: .4byte gUnknown_02020188
_080A6C74: .4byte ReadSramFast
_080A6C78: .4byte 0x0E007400
_080A6C7C: .4byte 0x50414D58
_080A6C80: .4byte 0x00020223
_080A6C84:
	movs r0, #0
_080A6C86:
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80A6C1C

	THUMB_FUNC_START sub_80A6C8C
sub_80A6C8C: @ 0x080A6C8C
	push {r4, r5, r6, lr}
	bl sub_80A6AFC
	ldr r5, _080A6CF4  @ ReadSramFast
	bl sub_80A6BB4
	adds r4, r0, #0
	ldr r6, _080A6CF8  @ gUnknown_02020188
	bl sub_80A6BD4
	adds r2, r0, #0
	ldr r3, [r5]
	adds r0, r4, #0
	adds r1, r6, #0
	bl _call_via_r3
	ldr r4, _080A6CFC  @ gUnknown_08A1FB34
	ldr r1, [r4]
	adds r0, r6, #0
	bl CopyDataWithPossibleUncomp
	ldr r1, [r4]
	ldr r0, _080A6D00  @ gRAMChapterData
	str r0, [r1, #0x18]
	ldr r0, _080A6D04  @ gGameState
	str r0, [r1, #0x1c]
	ldr r0, _080A6D08  @ gActiveUnit
	str r0, [r1, #0x20]
	ldr r0, _080A6D0C  @ gUnitLookup
	str r0, [r1, #0x24]
	ldr r0, _080A6D10  @ gBattleActor
	str r0, [r1, #0x28]
	ldr r0, _080A6D14  @ gBattleTarget
	str r0, [r1, #0x2c]
	ldr r0, _080A6D18  @ gBattleHitArray
	str r0, [r1, #0x30]
	movs r0, #0
	bl GetTrap
	ldr r1, [r4]
	str r0, [r1, #0x34]
	bl GetGlobalEventIdStorage
	ldr r1, [r4]
	str r0, [r1, #0x38]
	bl GetLocalEventIdStorage
	ldr r1, [r4]
	str r0, [r1, #0x3c]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A6CF4: .4byte ReadSramFast
_080A6CF8: .4byte gUnknown_02020188
_080A6CFC: .4byte gUnknown_08A1FB34
_080A6D00: .4byte gRAMChapterData
_080A6D04: .4byte gGameState
_080A6D08: .4byte gActiveUnit
_080A6D0C: .4byte gUnitLookup
_080A6D10: .4byte gBattleActor
_080A6D14: .4byte gBattleTarget
_080A6D18: .4byte gBattleHitArray

	THUMB_FUNC_END sub_80A6C8C

	THUMB_FUNC_START sub_80A6D1C
sub_80A6D1C: @ 0x080A6D1C
	movs r1, #0
	strb r1, [r0]
	movs r0, #1
	bx lr

	THUMB_FUNC_END sub_80A6D1C

	THUMB_FUNC_START sub_80A6D24
sub_80A6D24: @ 0x080A6D24
	push {lr}
	bl sub_80346E0
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80A6D24

	THUMB_FUNC_START sub_80A6D30
sub_80A6D30: @ 0x080A6D30
	movs r0, #0
	bx lr

	THUMB_FUNC_END sub_80A6D30

	THUMB_FUNC_START sub_80A6D34
sub_80A6D34: @ 0x080A6D34
	movs r0, #0
	bx lr

	THUMB_FUNC_END sub_80A6D34

	THUMB_FUNC_START sub_80A6D38
sub_80A6D38: @ 0x080A6D38
	push {lr}
	bl sub_80A4BB0
	ldr r1, _080A6D48  @ gBmMapHidden
	movs r0, #0
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_080A6D48: .4byte gBmMapHidden

	THUMB_FUNC_END sub_80A6D38

	THUMB_FUNC_START sub_80A6D4C
sub_80A6D4C: @ 0x080A6D4C
	push {r4, r5, lr}
	bl GetGameClock
	ldr r5, _080A6D94  @ gRAMChapterData
	ldr r1, [r5, #4]
	subs r0, r0, r1
	movs r1, #0xb4
	bl __udivsi3
	adds r4, r0, #0
	ldr r0, _080A6D98  @ 0x0000EA60
	cmp r4, r0
	ble _080A6D68
	adds r4, r0, #0
_080A6D68:
	ldr r0, _080A6D9C  @ gUnknown_0203EF60
	movs r1, #0x7f
	ldrb r2, [r5, #0xe]
	ands r2, r1
	ldrb r3, [r0]
	movs r1, #0x80
	negs r1, r1
	ands r1, r3
	orrs r1, r2
	strb r1, [r0]
	ldrh r2, [r5, #0x10]
	lsls r2, r2, #7
	ldrh r3, [r0]
	movs r1, #0x7f
	ands r1, r3
	orrs r1, r2
	strh r1, [r0]
	strh r4, [r0, #2]
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080A6D94: .4byte gRAMChapterData
_080A6D98: .4byte 0x0000EA60
_080A6D9C: .4byte gUnknown_0203EF60

	THUMB_FUNC_END sub_80A6D4C

	THUMB_FUNC_START sub_80A6DA0
sub_80A6DA0: @ 0x080A6DA0
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	mov r9, r0
	adds r7, r1, #0
	movs r1, #0
	adds r0, r7, #7
_080A6DB0:
	strb r1, [r0]
	subs r0, #1
	cmp r0, r7
	bge _080A6DB0
	movs r5, #0
	movs r0, #0
	movs r1, #1
	mov r8, r1
_080A6DC0:
	movs r4, #0
	adds r1, r0, #1
	mov ip, r1
	lsls r0, r0, #2
	add r0, r9
	adds r6, r0, #0
	adds r6, #0x30
_080A6DCE:
	cmp r4, #0
	beq _080A6DD8
	cmp r4, #1
	beq _080A6DE0
	b _080A6DEA
_080A6DD8:
	ldrb r0, [r6]
	mov r3, r8
	ands r3, r0
	b _080A6DEA
_080A6DE0:
	ldrb r1, [r6]
	movs r0, #2
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
_080A6DEA:
	lsls r0, r3, #0x18
	cmp r0, #0
	beq _080A6E0A
	adds r2, r5, #0
	cmp r5, #0
	bge _080A6DF8
	adds r2, r5, #7
_080A6DF8:
	asrs r2, r2, #3
	movs r1, #7
	ands r1, r5
	adds r2, r7, r2
	mov r0, r8
	lsls r0, r1
	ldrb r1, [r2]
	orrs r0, r1
	strb r0, [r2]
_080A6E0A:
	adds r5, #1
	adds r4, #1
	cmp r4, #1
	ble _080A6DCE
	mov r0, ip
	cmp r0, #0x1c
	ble _080A6DC0
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80A6DA0

	THUMB_FUNC_START sub_80A6E24
sub_80A6E24: @ 0x080A6E24
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	mov r8, r0
	adds r6, r1, #0
	movs r4, #0
	movs r0, #0
	movs r1, #1
	mov ip, r1
_080A6E38:
	movs r5, #0
	adds r7, r0, #1
	lsls r0, r0, #2
	add r0, r8
	adds r3, r0, #0
	adds r3, #0x30
_080A6E44:
	adds r0, r4, #0
	cmp r4, #0
	bge _080A6E4C
	adds r0, r4, #7
_080A6E4C:
	asrs r2, r0, #3
	movs r1, #7
	ands r1, r4
	mov r0, ip
	lsls r0, r1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r5, #0
	beq _080A6E64
	cmp r5, #1
	beq _080A6E7C
	b _080A6E96
_080A6E64:
	adds r0, r6, r2
	ldrb r0, [r0]
	ands r0, r1
	cmp r0, #0
	beq _080A6E76
	ldrb r1, [r3]
	mov r0, ip
	orrs r0, r1
	b _080A6E94
_080A6E76:
	ldrb r1, [r3]
	movs r0, #0xfe
	b _080A6E92
_080A6E7C:
	adds r0, r6, r2
	ldrb r0, [r0]
	ands r0, r1
	cmp r0, #0
	beq _080A6E8E
	ldrb r0, [r3]
	movs r1, #2
	orrs r0, r1
	b _080A6E94
_080A6E8E:
	ldrb r1, [r3]
	movs r0, #0xfd
_080A6E92:
	ands r0, r1
_080A6E94:
	strb r0, [r3]
_080A6E96:
	adds r4, #1
	adds r5, #1
	cmp r5, #1
	ble _080A6E44
	adds r0, r7, #0
	cmp r0, #0x1c
	ble _080A6E38
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80A6E24

	THUMB_FUNC_START sub_80A6EB0
sub_80A6EB0: @ 0x080A6EB0
	push {r4, r5, r6, r7, lr}
	adds r2, r0, #0
	adds r4, r1, #0
	movs r1, #0
	adds r0, r4, #3
_080A6EBA:
	strb r1, [r0]
	subs r0, #1
	cmp r0, r4
	bge _080A6EBA
	movs r3, #0
	adds r0, r2, #0
	adds r0, #0xc4
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r3, r0
	bge _080A6F04
	adds r6, r2, #0
	adds r6, #0xa4
	movs r1, #7
	mov ip, r1
	adds r5, r0, #0
	movs r7, #1
_080A6EDE:
	adds r0, r6, r3
	movs r2, #0
	ldrsb r2, [r0, r2]
	adds r0, r2, #0
	cmp r2, #0
	bge _080A6EEC
	adds r0, r2, #7
_080A6EEC:
	asrs r0, r0, #3
	adds r0, r4, r0
	mov r1, ip
	ands r2, r1
	adds r1, r7, #0
	lsls r1, r2
	ldrb r2, [r0]
	orrs r1, r2
	strb r1, [r0]
	adds r3, #1
	cmp r3, r5
	blt _080A6EDE
_080A6F04:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80A6EB0

	THUMB_FUNC_START sub_80A6F0C
sub_80A6F0C: @ 0x080A6F0C
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	adds r1, r5, #0
	adds r1, #0xc4
	movs r0, #0
	strb r0, [r1]
	movs r4, #0
_080A6F1C:
	adds r0, r4, #0
	cmp r4, #0
	bge _080A6F24
	adds r0, r4, #7
_080A6F24:
	asrs r0, r0, #3
	adds r0, r6, r0
	ldrb r1, [r0]
	movs r0, #7
	ands r0, r4
	asrs r1, r0
	movs r0, #1
	ands r1, r0
	cmp r1, #0
	beq _080A6F44
	adds r0, r5, #0
	adds r1, r5, #0
	adds r1, #0xa4
	adds r2, r4, #0
	bl SetupNewWMRoute
_080A6F44:
	adds r4, #1
	cmp r4, #0x1f
	ble _080A6F1C
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80A6F0C

	THUMB_FUNC_START sub_80A6F50
sub_80A6F50: @ 0x080A6F50
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	movs r2, #1
	mov r8, r2
	movs r2, #1
	mov ip, r2
	adds r6, r1, #0
	adds r4, r0, #0
	adds r4, #0x10
	movs r7, #6
_080A6F66:
	ldrb r2, [r4]
	mov r3, ip
	ands r3, r2
	movs r0, #2
	negs r0, r0
	ands r0, r5
	orrs r3, r0
	ldrb r1, [r4, #1]
	movs r0, #0x3f
	ands r1, r0
	lsls r1, r1, #1
	subs r0, #0xbe
	ands r0, r3
	orrs r1, r0
	lsrs r2, r2, #1
	mov r0, r8
	ands r2, r0
	mov r0, ip
	ands r2, r0
	lsls r2, r2, #7
	movs r0, #0x81
	negs r0, r0
	ands r0, r1
	orrs r2, r0
	ldrb r1, [r4, #2]
	lsls r1, r1, #8
	ldr r0, _080A6FB8  @ 0xFFFF00FF
	ands r0, r2
	orrs r1, r0
	adds r5, r1, #0
	strh r5, [r6]
	adds r6, #2
	adds r4, #4
	subs r7, #1
	cmp r7, #0
	bge _080A6F66
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A6FB8: .4byte 0xFFFF00FF

	THUMB_FUNC_END sub_80A6F50

	THUMB_FUNC_START sub_80A6FBC
sub_80A6FBC: @ 0x080A6FBC
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	mov r4, sp
	movs r7, #1
	adds r3, r0, #0
	adds r5, r1, #0
	movs r6, #6
_080A6FCA:
	ldrh r2, [r5]
	ldr r1, _080A6FE8  @ 0xFFFF0000
	ldr r0, [sp]
	ands r0, r1
	orrs r0, r2
	str r0, [sp]
	ldrb r1, [r4]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080A6FEC
	ldrb r0, [r3, #0x10]
	orrs r0, r7
	b _080A6FF2
	.align 2, 0
_080A6FE8: .4byte 0xFFFF0000
_080A6FEC:
	ldrb r1, [r3, #0x10]
	movs r0, #0xfe
	ands r0, r1
_080A6FF2:
	strb r0, [r3, #0x10]
	ldr r0, [sp]
	lsls r0, r0, #0x19
	lsrs r0, r0, #0x1a
	movs r2, #0
	strb r0, [r3, #0x11]
	ldrb r1, [r4]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _080A7014
	ldrb r0, [r4, #1]
	strh r0, [r3, #0x12]
	ldrb r0, [r3, #0x10]
	movs r1, #2
	orrs r0, r1
	b _080A701E
_080A7014:
	ldrb r0, [r4, #1]
	strh r0, [r3, #0x12]
	ldrb r1, [r3, #0x10]
	movs r0, #0xfd
	ands r0, r1
_080A701E:
	strb r0, [r3, #0x10]
	adds r3, #4
	adds r5, #2
	subs r6, #1
	cmp r6, #0
	bge _080A6FCA
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80A6FBC

	THUMB_FUNC_START sub_80A7034
sub_80A7034: @ 0x080A7034
	push {r4, lr}
	adds r4, r1, #0
	movs r2, #0
	adds r3, r0, #0
	adds r3, #0xc9
_080A703E:
	adds r0, r4, r2
	adds r1, r3, r2
	ldrb r1, [r1]
	strb r1, [r0]
	adds r2, #1
	cmp r2, #2
	ble _080A703E
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80A7034

	THUMB_FUNC_START sub_80A7054
sub_80A7054: @ 0x080A7054
	push {r4, lr}
	adds r4, r1, #0
	movs r2, #0
	adds r3, r0, #0
	adds r3, #0xc9
_080A705E:
	adds r0, r3, r2
	adds r1, r4, r2
	ldrb r1, [r1]
	strb r1, [r0]
	adds r2, #1
	cmp r2, #2
	ble _080A705E
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80A7054

	THUMB_FUNC_START sub_80A7074
sub_80A7074: @ 0x080A7074
	push {r4, lr}
	sub sp, #0x28
	adds r4, r0, #0
	add r0, sp, #0x24
	movs r1, #0
	strh r1, [r0]
	ldr r2, _080A70AC  @ 0x01000012
	mov r1, sp
	bl CpuSet
	mov r2, sp
	ldrb r0, [r2, #0x1c]
	movs r1, #2
	orrs r0, r1
	strb r0, [r2, #0x1c]
	movs r1, #0xc
	orrs r0, r1
	strb r0, [r2, #0x1c]
	mov r0, sp
	adds r1, r4, #0
	movs r2, #0x24
	bl WriteAndVerifySramFast
	add sp, #0x28
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A70AC: .4byte 0x01000012

	THUMB_FUNC_END sub_80A7074

	THUMB_FUNC_START sub_80A70B0
sub_80A70B0: @ 0x080A70B0
	push {r4, r5, r6, lr}
	sub sp, #0x24
	adds r6, r0, #0
	adds r4, r1, #0
	adds r0, r4, #0
	mov r1, sp
	bl sub_80A6DA0
	add r1, sp, #8
	adds r0, r4, #0
	bl sub_80A6EB0
	add r1, sp, #0xc
	adds r0, r4, #0
	bl sub_80A6F50
	mov r1, sp
	adds r1, #0x1d
	adds r0, r4, #0
	bl sub_80A7034
	adds r0, r4, #0
	adds r0, #0xcc
	ldrb r1, [r0]
	add r0, sp, #0x20
	strb r1, [r0]
	mov r1, sp
	ldrh r0, [r4, #2]
	strb r0, [r1, #0x1a]
	ldrh r0, [r4, #4]
	strb r0, [r1, #0x1b]
	mov r5, sp
	ldrb r3, [r4]
	lsls r0, r3, #0x1e
	lsrs r0, r0, #0x1f
	ldrb r1, [r5, #0x1c]
	movs r2, #2
	negs r2, r2
	ands r2, r1
	orrs r2, r0
	strb r2, [r5, #0x1c]
	mov r4, sp
	lsls r1, r3, #0x1d
	lsrs r1, r1, #0x1f
	lsls r1, r1, #1
	movs r0, #3
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r4, #0x1c]
	mov r2, sp
	lsls r3, r3, #0x1a
	lsrs r3, r3, #0x1e
	lsls r3, r3, #2
	movs r1, #0xd
	negs r1, r1
	ands r0, r1
	orrs r0, r3
	strb r0, [r2, #0x1c]
	mov r0, sp
	adds r1, r6, #0
	movs r2, #0x24
	bl WriteAndVerifySramFast
	add sp, #0x24
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80A70B0

	THUMB_FUNC_START sub_80A7138
sub_80A7138: @ 0x080A7138
	push {r4, lr}
	sub sp, #0x24
	adds r4, r1, #0
	ldr r1, _080A718C  @ ReadSramFast
	ldr r3, [r1]
	mov r1, sp
	movs r2, #0x24
	bl _call_via_r3
	adds r0, r4, #0
	mov r1, sp
	bl sub_80A6E24
	add r1, sp, #8
	adds r0, r4, #0
	bl sub_80A6F0C
	add r1, sp, #0xc
	adds r0, r4, #0
	bl sub_80A6FBC
	mov r1, sp
	adds r1, #0x1d
	adds r0, r4, #0
	bl sub_80A7054
	add r0, sp, #0x20
	ldrb r1, [r0]
	adds r0, r4, #0
	adds r0, #0xcc
	strb r1, [r0]
	mov r0, sp
	ldrb r1, [r0, #0x1c]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080A7190
	ldrb r0, [r4]
	movs r1, #2
	orrs r0, r1
	b _080A7198
	.align 2, 0
_080A718C: .4byte ReadSramFast
_080A7190:
	ldrb r1, [r4]
	movs r0, #3
	negs r0, r0
	ands r0, r1
_080A7198:
	strb r0, [r4]
	mov r0, sp
	ldrb r1, [r0, #0x1c]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080A71AE
	ldrb r0, [r4]
	movs r1, #4
	orrs r0, r1
	b _080A71B6
_080A71AE:
	ldrb r1, [r4]
	movs r0, #5
	negs r0, r0
	ands r0, r1
_080A71B6:
	strb r0, [r4]
	mov r0, sp
	ldrb r1, [r0, #0x1c]
	lsls r1, r1, #0x1c
	lsrs r1, r1, #0x1e
	lsls r1, r1, #4
	ldrb r2, [r4]
	movs r0, #0x31
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r4]
	mov r0, sp
	ldrb r0, [r0, #0x1a]
	strh r0, [r4, #2]
	mov r0, sp
	ldrb r0, [r0, #0x1b]
	strh r0, [r4, #4]
	add sp, #0x24
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80A7138

	THUMB_FUNC_START sub_80A71E4
sub_80A71E4: @ 0x080A71E4
	push {lr}
	adds r1, r0, #0
	ldr r0, _080A71F4  @ gUnknown_03005280
	bl sub_80BD260
	pop {r0}
	bx r0
	.align 2, 0
_080A71F4: .4byte gUnknown_03005280

	THUMB_FUNC_END sub_80A71E4

	THUMB_FUNC_START sub_80A71F8
sub_80A71F8: @ 0x080A71F8
	push {lr}
	adds r1, r0, #0
	ldr r0, _080A7208  @ gUnknown_03005280
	bl sub_80BD270
	pop {r0}
	bx r0
	.align 2, 0
_080A7208: .4byte gUnknown_03005280

	THUMB_FUNC_END sub_80A71F8

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
	ldr r4, _080A751C  @ gUnknown_02000000
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
	bl SaveSecureHeader
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
	bl sub_80A3984
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
	bl sub_80A3950
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
	bl SaveMetadata_Generate
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
_080A751C: .4byte gUnknown_02000000
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
