	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	@ Display standing map sprites and various tile/unit markers

	THUMB_FUNC_START sub_8026618
sub_8026618: @ 0x08026618
	ldr r1, _08026624  @ gUnknown_0203A4CC
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	bx lr
	.align 2, 0
_08026624: .4byte gUnknown_0203A4CC

	THUMB_FUNC_END sub_8026618

	THUMB_FUNC_START SetupMapSpritesPalettes
SetupMapSpritesPalettes: @ 0x08026628
	push {lr}
	ldr r0, _08026650  @ unit_icon_pal_player
	movs r1, #0xe0
	lsls r1, r1, #2
	movs r2, #0x80
	bl CopyToPaletteBuffer
	ldr r0, _08026654  @ gUnknown_0202BCB0
	ldrb r1, [r0, #4]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0802665C
	ldr r0, _08026658  @ unit_icon_pal_p4
	movs r1, #0xd8
	lsls r1, r1, #2
	movs r2, #0x20
	bl CopyToPaletteBuffer
	b _08026668
	.align 2, 0
_08026650: .4byte unit_icon_pal_player
_08026654: .4byte gUnknown_0202BCB0
_08026658: .4byte unit_icon_pal_p4
_0802665C:
	ldr r0, _0802666C  @ gUnknown_0859EEC0
	movs r1, #0xd8
	lsls r1, r1, #2
	movs r2, #0x20
	bl CopyToPaletteBuffer
_08026668:
	pop {r0}
	bx r0
	.align 2, 0
_0802666C: .4byte gUnknown_0859EEC0

	THUMB_FUNC_END SetupMapSpritesPalettes

	THUMB_FUNC_START sub_8026670
sub_8026670: @ 0x08026670
	push {lr}
	ldr r0, _08026684  @ gUnknown_0859EEE0
	movs r1, #0xf0
	lsls r1, r1, #2
	movs r2, #0x20
	bl CopyToPaletteBuffer
	pop {r0}
	bx r0
	.align 2, 0
_08026684: .4byte gUnknown_0859EEE0

	THUMB_FUNC_END sub_8026670

	THUMB_FUNC_START SMS_ClearUsageTable
SMS_ClearUsageTable: @ 0x08026688
	push {r4, r5, r6, lr}
	movs r2, #0xcf
	ldr r5, _080266B0  @ gUnknown_0203A014
	ldr r6, _080266B4  @ gUnknown_0203A010
	ldr r4, _080266B8  @ gUnknown_02033F40
	movs r3, #0xff
_08026694:
	adds r1, r2, r4
	ldrb r0, [r1]
	orrs r0, r3
	strb r0, [r1]
	subs r2, #1
	cmp r2, #0
	bge _08026694
	movs r0, #0
	str r0, [r5]
	movs r0, #0x3f
	str r0, [r6]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080266B0: .4byte gUnknown_0203A014
_080266B4: .4byte gUnknown_0203A010
_080266B8: .4byte gUnknown_02033F40

	THUMB_FUNC_END SMS_ClearUsageTable

	THUMB_FUNC_START sub_80266BC
sub_80266BC: @ 0x080266BC
	push {r4, r5, r6, lr}
	movs r2, #0xcf
	ldr r5, _080266E4  @ gUnknown_0203A014
	ldr r6, _080266E8  @ gUnknown_0203A010
	ldr r4, _080266EC  @ gUnknown_02033F40
	movs r3, #0xff
_080266C8:
	adds r1, r2, r4
	ldrb r0, [r1]
	orrs r0, r3
	strb r0, [r1]
	subs r2, #1
	cmp r2, #0
	bge _080266C8
	movs r0, #0
	str r0, [r5]
	movs r0, #0x5f
	str r0, [r6]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080266E4: .4byte gUnknown_0203A014
_080266E8: .4byte gUnknown_0203A010
_080266EC: .4byte gUnknown_02033F40

	THUMB_FUNC_END sub_80266BC

	THUMB_FUNC_START SMS_80266F0
SMS_80266F0: @ 0x080266F0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r7, r0, #0
	mov r8, r1
	ldr r1, _0802672C  @ gUnknown_0859B66C
	mov r2, r8
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r6, [r0]
	ldr r5, _08026730  @ unit_icon_wait_table
	movs r4, #0x7f
	ands r4, r7
	lsls r4, r4, #3
	adds r0, r5, #4
	adds r0, r4, r0
	ldr r0, [r0]
	ldr r1, _08026734  @ gUnknown_0859B668
	ldr r1, [r1]
	bl CopyDataWithPossibleUncomp
	adds r4, r4, r5
	ldrh r0, [r4, #2]
	cmp r0, #1
	beq _08026748
	cmp r0, #1
	bgt _08026738
	cmp r0, #0
	beq _0802673E
	b _08026766
	.align 2, 0
_0802672C: .4byte gUnknown_0859B66C
_08026730: .4byte unit_icon_wait_table
_08026734: .4byte gUnknown_0859B668
_08026738:
	cmp r0, #2
	beq _08026752
	b _08026766
_0802673E:
	adds r0, r6, #0
	adds r1, r7, #0
	bl SomethingSMS_16x16
	b _0802675A
_08026748:
	adds r0, r6, #0
	adds r1, r7, #0
	bl SomethingSMS_16x32
	b _0802675A
_08026752:
	adds r0, r6, #0
	adds r1, r7, #0
	bl SomethingSMS_32x32
_0802675A:
	ldr r2, _08026778  @ gUnknown_02033F40
	add r2, r8
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	strb r0, [r2]
_08026766:
	ldr r0, _08026778  @ gUnknown_02033F40
	add r0, r8
	ldrb r0, [r0]
	lsls r0, r0, #1
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08026778: .4byte gUnknown_02033F40

	THUMB_FUNC_END SMS_80266F0

	THUMB_FUNC_START SMS_SomethingGmapUnit
SMS_SomethingGmapUnit: @ 0x0802677C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	mov r8, r1
	adds r7, r2, #0
	ldr r5, _080267B0  @ unit_icon_wait_table
	movs r4, #0x7f
	ands r4, r6
	lsls r4, r4, #3
	adds r0, r5, #4
	adds r0, r4, r0
	ldr r0, [r0]
	ldr r1, _080267B4  @ gUnknown_0859B668
	ldr r1, [r1]
	bl CopyDataWithPossibleUncomp
	adds r4, r4, r5
	ldrh r0, [r4, #2]
	cmp r0, #1
	beq _080267C8
	cmp r0, #1
	bgt _080267B8
	cmp r0, #0
	beq _080267BE
	b _080267E6
	.align 2, 0
_080267B0: .4byte unit_icon_wait_table
_080267B4: .4byte gUnknown_0859B668
_080267B8:
	cmp r0, #2
	beq _080267D2
	b _080267E6
_080267BE:
	adds r0, r7, #0
	adds r1, r6, #0
	bl SomethingSMS_16x16
	b _080267DA
_080267C8:
	adds r0, r7, #0
	adds r1, r6, #0
	bl SomethingSMS_16x32
	b _080267DA
_080267D2:
	adds r0, r7, #0
	adds r1, r6, #0
	bl SomethingSMS_32x32
_080267DA:
	ldr r2, _080267F8  @ gUnknown_02033F40
	add r2, r8
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	strb r0, [r2]
_080267E6:
	ldr r0, _080267F8  @ gUnknown_02033F40
	add r0, r8
	ldrb r0, [r0]
	lsls r0, r0, #1
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080267F8: .4byte gUnknown_02033F40

	THUMB_FUNC_END SMS_SomethingGmapUnit

	THUMB_FUNC_START SMS_RegisterUsage
SMS_RegisterUsage: @ 0x080267FC
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	ldr r0, _08026834  @ gUnknown_02033F40
	adds r7, r6, r0
	ldrb r1, [r7]
	cmp r1, #0xff
	bne _080268B0
	ldr r5, _08026838  @ unit_icon_wait_table
	movs r4, #0x7f
	ands r4, r6
	lsls r4, r4, #3
	adds r0, r5, #4
	adds r0, r4, r0
	ldr r0, [r0]
	ldr r1, _0802683C  @ gUnknown_0859B668
	ldr r1, [r1]
	bl CopyDataWithPossibleUncomp
	adds r4, r4, r5
	ldrh r0, [r4, #2]
	cmp r0, #1
	beq _08026864
	cmp r0, #1
	bgt _08026840
	cmp r0, #0
	beq _08026846
	b _080268A6
	.align 2, 0
_08026834: .4byte gUnknown_02033F40
_08026838: .4byte unit_icon_wait_table
_0802683C: .4byte gUnknown_0859B668
_08026840:
	cmp r0, #2
	beq _08026880
	b _080268A6
_08026846:
	ldr r4, _08026860  @ gUnknown_0203A010
	ldr r0, [r4]
	adds r1, r6, #0
	bl SomethingSMS_16x16_0
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	strb r0, [r7]
	ldr r0, [r4]
	subs r0, #1
	b _080268A4
	.align 2, 0
_08026860: .4byte gUnknown_0203A010
_08026864:
	ldr r4, _0802687C  @ gUnknown_0203A014
	ldr r0, [r4]
	adds r1, r6, #0
	bl SomethingSMS_16x32
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	strb r0, [r7]
	ldr r0, [r4]
	adds r0, #2
	b _080268A4
	.align 2, 0
_0802687C: .4byte gUnknown_0203A014
_08026880:
	ldr r4, _080268BC  @ gUnknown_0203A014
	ldr r1, [r4]
	movs r0, #0x1e
	ands r0, r1
	cmp r0, #0x1e
	bne _08026890
	adds r0, r1, #2
	str r0, [r4]
_08026890:
	ldr r0, [r4]
	adds r1, r6, #0
	bl SomethingSMS_32x32
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	strb r0, [r7]
	ldr r0, [r4]
	adds r0, #4
_080268A4:
	str r0, [r4]
_080268A6:
	ldr r1, _080268C0  @ gUnknown_0203A4CC
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _080268C4  @ gUnknown_02033F40
_080268B0:
	adds r0, r6, r0
	ldrb r0, [r0]
	lsls r0, r0, #1
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080268BC: .4byte gUnknown_0203A014
_080268C0: .4byte gUnknown_0203A4CC
_080268C4: .4byte gUnknown_02033F40

	THUMB_FUNC_END SMS_RegisterUsage

	THUMB_FUNC_START SomethingSMS_16x16_0
SomethingSMS_16x16_0: @ 0x080268C8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	str r0, [sp]
	adds r2, r1, #0
	ldr r1, _08026950  @ gUnknown_0859B67C
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	lsls r0, r0, #5
	mov r9, r0
	lsrs r0, r2, #7
	movs r1, #1
	bics r1, r0
	movs r6, #0
	ldr r0, _08026954  @ gUnknown_0859B668
	mov sl, r0
	movs r0, #0x80
	lsls r0, r0, #3
	add r0, r9
	ldr r2, _08026958  @ gUnknown_02034010
	adds r4, r0, r2
	movs r3, #0x40
	mov r8, r3
	movs r7, #0
	lsls r5, r1, #7
_08026902:
	mov r1, sl
	ldr r0, [r1]
	adds r0, r0, r7
	lsls r1, r6, #0xd
	ldr r2, _08026958  @ gUnknown_02034010
	add r2, r9
	adds r1, r1, r2
	movs r2, #0x10
	bl CpuFastSet
	mov r2, sl
	ldr r0, [r2]
	add r0, r8
	adds r1, r4, #0
	movs r2, #0x10
	bl CpuFastSet
	movs r3, #0x80
	lsls r3, r3, #6
	adds r4, r4, r3
	add r8, r5
	adds r7, r7, r5
	adds r6, #1
	cmp r6, #2
	ble _08026902
	ldr r0, _08026950  @ gUnknown_0859B67C
	ldr r2, [sp]
	lsls r1, r2, #1
	adds r1, r1, r0
	ldrh r0, [r1]
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08026950: .4byte gUnknown_0859B67C
_08026954: .4byte gUnknown_0859B668
_08026958: .4byte gUnknown_02034010

	THUMB_FUNC_END SomethingSMS_16x16_0

	THUMB_FUNC_START SomethingSMS_16x16
SomethingSMS_16x16: @ 0x0802695C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	str r0, [sp, #8]
	mov r9, r1
	ldr r1, _08026A28  @ gUnknown_0859B67C
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	lsls r5, r0, #5
	mov r1, r9
	lsrs r0, r1, #7
	movs r2, #1
	mov r9, r2
	mov r1, r9
	bics r1, r0
	mov r9, r1
	movs r7, #0
	mov r2, sp
	adds r2, #4
	str r2, [sp, #0xc]
	ldr r0, _08026A2C  @ gUnknown_02034010
	mov r8, r0
	movs r1, #0xc0
	lsls r1, r1, #4
	adds r0, r5, r1
	mov r2, r8
	adds r6, r0, r2
	movs r0, #0x40
	str r0, [sp, #0x10]
	movs r1, #0
	mov sl, r1
_080269A2:
	movs r2, #0
	str r2, [sp]
	lsls r4, r7, #0xd
	mov r0, r8
	adds r1, r5, r0
	adds r1, r4, r1
	mov r0, sp
	ldr r2, _08026A30  @ 0x01000010
	bl CpuFastSet
	movs r1, #0
	str r1, [sp, #4]
	movs r1, #0x80
	lsls r1, r1, #3
	add r1, r8
	adds r1, r4, r1
	adds r1, r1, r5
	ldr r0, [sp, #0xc]
	ldr r2, _08026A30  @ 0x01000010
	bl CpuFastSet
	ldr r2, _08026A34  @ gUnknown_0859B668
	ldr r0, [r2]
	add r0, sl
	movs r1, #0x80
	lsls r1, r1, #4
	add r1, r8
	adds r4, r4, r1
	adds r4, r4, r5
	adds r1, r4, #0
	movs r2, #0x10
	bl CpuFastSet
	ldr r1, _08026A34  @ gUnknown_0859B668
	ldr r0, [r1]
	ldr r2, [sp, #0x10]
	adds r0, r0, r2
	adds r1, r6, #0
	movs r2, #0x10
	bl CpuFastSet
	movs r0, #0x80
	lsls r0, r0, #6
	adds r6, r6, r0
	mov r1, r9
	lsls r0, r1, #7
	ldr r2, [sp, #0x10]
	adds r2, r2, r0
	str r2, [sp, #0x10]
	add sl, r0
	adds r7, #1
	cmp r7, #2
	ble _080269A2
	ldr r0, _08026A28  @ gUnknown_0859B67C
	ldr r2, [sp, #8]
	lsls r1, r2, #1
	adds r1, r1, r0
	ldrh r0, [r1]
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08026A28: .4byte gUnknown_0859B67C
_08026A2C: .4byte gUnknown_02034010
_08026A30: .4byte 0x01000010
_08026A34: .4byte gUnknown_0859B668

	THUMB_FUNC_END SomethingSMS_16x16

	THUMB_FUNC_START SomethingSMS_16x32
SomethingSMS_16x32: @ 0x08026A38
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	str r0, [sp]
	adds r2, r1, #0
	ldr r1, _08026B1C  @ gUnknown_0859B67C
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	lsls r6, r0, #5
	lsrs r0, r2, #7
	movs r1, #1
	bics r1, r0
	movs r0, #0
	mov r9, r0
	ldr r2, _08026B20  @ gUnknown_0859B668
	mov r8, r2
	ldr r3, _08026B24  @ gUnknown_02034010
	mov sl, r3
	movs r2, #0xc0
	lsls r2, r2, #4
	adds r0, r6, r2
	adds r7, r0, r3
	movs r3, #0xc0
	str r3, [sp, #4]
	movs r0, #0x80
	str r0, [sp, #8]
	movs r2, #0x40
	str r2, [sp, #0xc]
	movs r3, #0
	str r3, [sp, #0x10]
	lsls r5, r1, #8
_08026A7E:
	mov r1, r8
	ldr r0, [r1]
	ldr r2, [sp, #0x10]
	adds r0, r0, r2
	mov r3, r9
	lsls r4, r3, #0xd
	mov r2, sl
	adds r1, r6, r2
	adds r1, r4, r1
	movs r2, #0x10
	bl CpuFastSet
	mov r3, r8
	ldr r0, [r3]
	ldr r1, [sp, #0xc]
	adds r0, r0, r1
	movs r1, #0x80
	lsls r1, r1, #3
	add r1, sl
	adds r1, r4, r1
	adds r1, r1, r6
	movs r2, #0x10
	bl CpuFastSet
	mov r2, r8
	ldr r0, [r2]
	ldr r3, [sp, #8]
	adds r0, r0, r3
	movs r1, #0x80
	lsls r1, r1, #4
	add r1, sl
	adds r4, r4, r1
	adds r4, r4, r6
	adds r1, r4, #0
	movs r2, #0x10
	bl CpuFastSet
	mov r1, r8
	ldr r0, [r1]
	ldr r2, [sp, #4]
	adds r0, r0, r2
	adds r1, r7, #0
	movs r2, #0x10
	bl CpuFastSet
	movs r3, #0x80
	lsls r3, r3, #6
	adds r7, r7, r3
	ldr r0, [sp, #4]
	adds r0, r0, r5
	str r0, [sp, #4]
	ldr r1, [sp, #8]
	adds r1, r1, r5
	str r1, [sp, #8]
	ldr r2, [sp, #0xc]
	adds r2, r2, r5
	str r2, [sp, #0xc]
	ldr r3, [sp, #0x10]
	adds r3, r3, r5
	str r3, [sp, #0x10]
	movs r0, #1
	add r9, r0
	mov r1, r9
	cmp r1, #2
	ble _08026A7E
	ldr r0, _08026B1C  @ gUnknown_0859B67C
	ldr r2, [sp]
	lsls r1, r2, #1
	adds r1, r1, r0
	ldrh r0, [r1]
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08026B1C: .4byte gUnknown_0859B67C
_08026B20: .4byte gUnknown_0859B668
_08026B24: .4byte gUnknown_02034010

	THUMB_FUNC_END SomethingSMS_16x32

	THUMB_FUNC_START SomethingSMS_32x32
SomethingSMS_32x32: @ 0x08026B28
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	str r0, [sp]
	adds r2, r1, #0
	ldr r1, _08026C10  @ gUnknown_0859B67C
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	lsls r6, r0, #5
	lsrs r0, r2, #7
	movs r1, #1
	bics r1, r0
	movs r0, #0
	mov r9, r0
	ldr r2, _08026C14  @ gUnknown_0859B668
	mov r8, r2
	ldr r3, _08026C18  @ gUnknown_02034010
	mov sl, r3
	movs r2, #0xc0
	lsls r2, r2, #4
	adds r0, r6, r2
	adds r7, r0, r3
	movs r3, #0xc0
	lsls r3, r3, #1
	str r3, [sp, #4]
	movs r0, #0x80
	lsls r0, r0, #1
	str r0, [sp, #8]
	movs r2, #0x80
	str r2, [sp, #0xc]
	movs r3, #0
	str r3, [sp, #0x10]
	lsls r5, r1, #9
_08026B72:
	mov r1, r8
	ldr r0, [r1]
	ldr r2, [sp, #0x10]
	adds r0, r0, r2
	mov r3, r9
	lsls r4, r3, #0xd
	mov r2, sl
	adds r1, r6, r2
	adds r1, r4, r1
	movs r2, #0x20
	bl CpuFastSet
	mov r3, r8
	ldr r0, [r3]
	ldr r1, [sp, #0xc]
	adds r0, r0, r1
	movs r1, #0x80
	lsls r1, r1, #3
	add r1, sl
	adds r1, r4, r1
	adds r1, r1, r6
	movs r2, #0x20
	bl CpuFastSet
	mov r2, r8
	ldr r0, [r2]
	ldr r3, [sp, #8]
	adds r0, r0, r3
	movs r1, #0x80
	lsls r1, r1, #4
	add r1, sl
	adds r4, r4, r1
	adds r4, r4, r6
	adds r1, r4, #0
	movs r2, #0x20
	bl CpuFastSet
	mov r1, r8
	ldr r0, [r1]
	ldr r2, [sp, #4]
	adds r0, r0, r2
	adds r1, r7, #0
	movs r2, #0x20
	bl CpuFastSet
	movs r3, #0x80
	lsls r3, r3, #6
	adds r7, r7, r3
	ldr r0, [sp, #4]
	adds r0, r0, r5
	str r0, [sp, #4]
	ldr r1, [sp, #8]
	adds r1, r1, r5
	str r1, [sp, #8]
	ldr r2, [sp, #0xc]
	adds r2, r2, r5
	str r2, [sp, #0xc]
	ldr r3, [sp, #0x10]
	adds r3, r3, r5
	str r3, [sp, #0x10]
	movs r0, #1
	add r9, r0
	mov r1, r9
	cmp r1, #2
	ble _08026B72
	ldr r0, _08026C10  @ gUnknown_0859B67C
	ldr r2, [sp]
	lsls r1, r2, #1
	adds r1, r1, r0
	ldrh r0, [r1]
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08026C10: .4byte gUnknown_0859B67C
_08026C14: .4byte gUnknown_0859B668
_08026C18: .4byte gUnknown_02034010

	THUMB_FUNC_END SomethingSMS_32x32

	THUMB_FUNC_START sub_8026C1C
sub_8026C1C: @ 0x08026C1C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	str r1, [sp]
	bl GetUnitSMSId
	str r0, [sp, #4]
	bl SMS_RegisterUsage
	lsls r7, r0, #5
	ldr r1, _08026C84  @ gUnknown_0859B73C
	ldr r2, [sp]
	lsls r0, r2, #1
	adds r0, r0, r1
	ldrh r6, [r0]
	movs r4, #0
	bl GetGameClock
	movs r1, #0x48
	bl __umodsi3
	adds r1, r0, #0
	cmp r1, #0x43
	ble _08026C54
	movs r4, #1
_08026C54:
	cmp r1, #0x23
	ble _08026C5A
	movs r4, #2
_08026C5A:
	cmp r1, #0x1f
	ble _08026C60
	movs r4, #1
_08026C60:
	cmp r1, #0
	blt _08026C66
	movs r4, #0
_08026C66:
	ldr r1, _08026C88  @ unit_icon_wait_table
	movs r0, #0x7f
	ldr r2, [sp, #4]
	ands r0, r2
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r0, [r0, #2]
	cmp r0, #1
	beq _08026D18
	cmp r0, #1
	bgt _08026C8C
	cmp r0, #0
	beq _08026C94
	b _08026EF2
	.align 2, 0
_08026C84: .4byte gUnknown_0859B73C
_08026C88: .4byte unit_icon_wait_table
_08026C8C:
	cmp r0, #2
	bne _08026C92
	b _08026E10
_08026C92:
	b _08026EF2
_08026C94:
	movs r1, #0
	lsls r4, r4, #0xd
	str r4, [sp, #8]
	ldr r0, _08026D0C  @ gUnknown_02034010
	mov r8, r0
	lsrs r5, r6, #1
	movs r0, #1
	bics r0, r6
	lsls r0, r0, #2
	movs r4, #0xf
	lsls r4, r0
_08026CAA:
	movs r6, #0
	lsls r2, r1, #0xd
	adds r1, #1
	mov r9, r1
	adds r0, r7, r5
	adds r0, r0, r2
	mov r1, r8
	adds r3, r0, r1
	movs r1, #0x80
	lsls r1, r1, #3
	adds r0, r5, r1
	adds r0, r7, r0
	adds r0, r0, r2
	mov r1, r8
	adds r2, r0, r1
_08026CC8:
	ldrb r1, [r3]
	adds r0, r4, #0
	ands r0, r1
	strb r0, [r3]
	ldrb r1, [r2]
	adds r0, r4, #0
	ands r0, r1
	strb r0, [r2]
	adds r3, #0x20
	adds r2, #0x20
	adds r6, #1
	cmp r6, #1
	ble _08026CC8
	mov r1, r9
	cmp r1, #2
	ble _08026CAA
	ldr r2, _08026D0C  @ gUnknown_02034010
	adds r0, r7, r2
	ldr r1, [sp, #8]
	adds r0, r1, r0
	ldr r2, _08026D10  @ 0x06011000
	adds r1, r7, r2
	movs r2, #0x10
	bl CpuFastSet
	ldr r1, _08026D0C  @ gUnknown_02034010
	movs r2, #0x80
	lsls r2, r2, #3
	adds r0, r1, r2
	ldr r1, [sp, #8]
	adds r0, r1, r0
	adds r0, r0, r7
	ldr r2, _08026D14  @ 0x06011400
	b _08026DF2
	.align 2, 0
_08026D0C: .4byte gUnknown_02034010
_08026D10: .4byte 0x06011000
_08026D14: .4byte 0x06011400
_08026D18:
	movs r1, #0
	lsls r4, r4, #0xd
	str r4, [sp, #8]
	ldr r2, _08026DFC  @ gUnknown_02034010
	mov sl, r2
	lsrs r2, r6, #1
	mov ip, r2
	bics r0, r6
	lsls r0, r0, #2
	movs r2, #0xf
	mov r8, r2
	lsls r2, r0
	mov r8, r2
_08026D32:
	movs r6, #0
	lsls r2, r1, #0xd
	adds r1, #1
	mov r9, r1
	adds r5, r2, #0
	mov r1, ip
	adds r0, r7, r1
	adds r0, r0, r5
	mov r2, sl
	adds r4, r0, r2
_08026D46:
	lsls r2, r6, #5
	ldrb r1, [r4]
	mov r0, r8
	ands r0, r1
	strb r0, [r4]
	movs r1, #0x80
	lsls r1, r1, #3
	adds r0, r2, r1
	adds r0, r7, r0
	add r0, ip
	adds r0, r0, r5
	add r0, sl
	ldrb r3, [r0]
	mov r1, r8
	ands r1, r3
	strb r1, [r0]
	movs r1, #0x80
	lsls r1, r1, #4
	adds r0, r2, r1
	adds r0, r7, r0
	add r0, ip
	adds r0, r0, r5
	add r0, sl
	ldrb r3, [r0]
	mov r1, r8
	ands r1, r3
	strb r1, [r0]
	movs r0, #0xc0
	lsls r0, r0, #4
	adds r2, r2, r0
	adds r2, r7, r2
	add r2, ip
	adds r2, r2, r5
	add r2, sl
	ldrb r1, [r2]
	mov r0, r8
	ands r0, r1
	strb r0, [r2]
	adds r4, #0x20
	adds r6, #1
	cmp r6, #1
	ble _08026D46
	mov r1, r9
	cmp r1, #2
	ble _08026D32
	ldr r1, _08026DFC  @ gUnknown_02034010
	adds r0, r7, r1
	ldr r2, [sp, #8]
	adds r0, r2, r0
	ldr r2, _08026E00  @ 0x06011000
	adds r1, r7, r2
	movs r2, #0x10
	bl CpuFastSet
	ldr r1, _08026DFC  @ gUnknown_02034010
	movs r2, #0x80
	lsls r2, r2, #3
	adds r0, r1, r2
	ldr r1, [sp, #8]
	adds r0, r1, r0
	adds r0, r0, r7
	ldr r2, _08026E04  @ 0x06011400
	adds r1, r7, r2
	movs r2, #0x10
	bl CpuFastSet
	ldr r1, _08026DFC  @ gUnknown_02034010
	movs r2, #0x80
	lsls r2, r2, #4
	adds r0, r1, r2
	ldr r1, [sp, #8]
	adds r0, r1, r0
	adds r0, r0, r7
	ldr r2, _08026E08  @ 0x06011800
	adds r1, r7, r2
	movs r2, #0x10
	bl CpuFastSet
	ldr r1, _08026DFC  @ gUnknown_02034010
	movs r2, #0xc0
	lsls r2, r2, #4
	adds r0, r1, r2
	ldr r1, [sp, #8]
	adds r0, r1, r0
	adds r0, r0, r7
	ldr r2, _08026E0C  @ 0x06011C00
_08026DF2:
	adds r1, r7, r2
	movs r2, #0x10
	bl CpuFastSet
	b _08026EF2
	.align 2, 0
_08026DFC: .4byte gUnknown_02034010
_08026E00: .4byte 0x06011000
_08026E04: .4byte 0x06011400
_08026E08: .4byte 0x06011800
_08026E0C: .4byte 0x06011C00
_08026E10:
	movs r1, #0
	lsls r4, r4, #0xd
	str r4, [sp, #8]
	ldr r0, _08026F14  @ gUnknown_02034010
	mov sl, r0
	lsrs r2, r6, #1
	mov ip, r2
	movs r0, #1
	bics r0, r6
	lsls r0, r0, #2
	movs r2, #0xf
	mov r8, r2
	lsls r2, r0
	mov r8, r2
_08026E2C:
	movs r6, #0
	adds r0, r1, #1
	mov r9, r0
	lsls r5, r1, #0xd
	mov r1, ip
	adds r0, r7, r1
	adds r0, r0, r5
	mov r2, sl
	adds r4, r0, r2
_08026E3E:
	lsls r2, r6, #5
	ldrb r1, [r4]
	mov r0, r8
	ands r0, r1
	strb r0, [r4]
	movs r1, #0x80
	lsls r1, r1, #3
	adds r0, r2, r1
	adds r0, r7, r0
	add r0, ip
	adds r0, r0, r5
	add r0, sl
	ldrb r3, [r0]
	mov r1, r8
	ands r1, r3
	strb r1, [r0]
	movs r1, #0x80
	lsls r1, r1, #4
	adds r0, r2, r1
	adds r0, r7, r0
	add r0, ip
	adds r0, r0, r5
	add r0, sl
	ldrb r3, [r0]
	mov r1, r8
	ands r1, r3
	strb r1, [r0]
	movs r0, #0xc0
	lsls r0, r0, #4
	adds r2, r2, r0
	adds r2, r7, r2
	add r2, ip
	adds r2, r2, r5
	add r2, sl
	ldrb r1, [r2]
	mov r0, r8
	ands r0, r1
	strb r0, [r2]
	adds r4, #0x20
	adds r6, #1
	cmp r6, #3
	ble _08026E3E
	mov r1, r9
	cmp r1, #2
	ble _08026E2C
	ldr r1, _08026F14  @ gUnknown_02034010
	adds r0, r7, r1
	ldr r2, [sp, #8]
	adds r0, r2, r0
	ldr r2, _08026F18  @ 0x06011000
	adds r1, r7, r2
	movs r2, #0x20
	bl CpuFastSet
	ldr r1, _08026F14  @ gUnknown_02034010
	movs r2, #0x80
	lsls r2, r2, #3
	adds r0, r1, r2
	ldr r1, [sp, #8]
	adds r0, r1, r0
	adds r0, r0, r7
	ldr r2, _08026F1C  @ 0x06011400
	adds r1, r7, r2
	movs r2, #0x20
	bl CpuFastSet
	ldr r1, _08026F14  @ gUnknown_02034010
	movs r2, #0x80
	lsls r2, r2, #4
	adds r0, r1, r2
	ldr r1, [sp, #8]
	adds r0, r1, r0
	adds r0, r0, r7
	ldr r2, _08026F20  @ 0x06011800
	adds r1, r7, r2
	movs r2, #0x20
	bl CpuFastSet
	ldr r1, _08026F14  @ gUnknown_02034010
	movs r2, #0xc0
	lsls r2, r2, #4
	adds r0, r1, r2
	ldr r1, [sp, #8]
	adds r0, r1, r0
	adds r0, r0, r7
	ldr r2, _08026F24  @ 0x06011C00
	adds r1, r7, r2
	movs r2, #0x20
	bl CpuFastSet
_08026EF2:
	ldr r0, [sp]
	cmp r0, #0x3f
	bne _08026F02
	ldr r0, _08026F28  @ gUnknown_02033F40
	ldr r1, [sp, #4]
	adds r0, r1, r0
	movs r1, #0xff
	strb r1, [r0]
_08026F02:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08026F14: .4byte gUnknown_02034010
_08026F18: .4byte 0x06011000
_08026F1C: .4byte 0x06011400
_08026F20: .4byte 0x06011800
_08026F24: .4byte 0x06011C00
_08026F28: .4byte gUnknown_02033F40

	THUMB_FUNC_END sub_8026C1C

	THUMB_FUNC_START SMS_FlushDirect
SMS_FlushDirect: @ 0x08026F2C
	push {r4, r5, lr}
	bl GetGameClock
	movs r1, #0x48
	bl __umodsi3
	adds r4, r0, #0
	adds r5, r4, #0
	cmp r4, #0
	bne _08026F4C
	ldr r0, _08026F84  @ gUnknown_02034010
	ldr r1, _08026F88  @ 0x06011000
	movs r2, #0x80
	lsls r2, r2, #4
	bl CpuFastSet
_08026F4C:
	cmp r4, #0x20
	bne _08026F5C
	ldr r0, _08026F8C  @ gUnknown_02036010
	ldr r1, _08026F88  @ 0x06011000
	movs r2, #0x80
	lsls r2, r2, #4
	bl CpuFastSet
_08026F5C:
	cmp r4, #0x24
	bne _08026F6C
	ldr r0, _08026F90  @ gUnknown_02038010
	ldr r1, _08026F88  @ 0x06011000
	movs r2, #0x80
	lsls r2, r2, #4
	bl CpuFastSet
_08026F6C:
	cmp r5, #0x44
	bne _08026F7C
	ldr r0, _08026F8C  @ gUnknown_02036010
	ldr r1, _08026F88  @ 0x06011000
	movs r2, #0x80
	lsls r2, r2, #4
	bl CpuFastSet
_08026F7C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08026F84: .4byte gUnknown_02034010
_08026F88: .4byte 0x06011000
_08026F8C: .4byte gUnknown_02036010
_08026F90: .4byte gUnknown_02038010

	THUMB_FUNC_END SMS_FlushDirect

	THUMB_FUNC_START SMS_FlushIndirect
SMS_FlushIndirect: @ 0x08026F94
	push {lr}
	ldr r0, _08026FB4  @ gUnknown_0203A4CC
	movs r1, #0
	str r1, [r0]
	bl GetGameClock
	movs r1, #0x48
	bl __umodsi3
	adds r1, r0, #0
	cmp r0, #0x43
	bgt _08026FC0
	cmp r0, #0x23
	ble _08026FBC
	ldr r0, _08026FB8  @ gUnknown_02038010
	b _08026FC2
	.align 2, 0
_08026FB4: .4byte gUnknown_0203A4CC
_08026FB8: .4byte gUnknown_02038010
_08026FBC:
	cmp r0, #0x1f
	ble _08026FD8
_08026FC0:
	ldr r0, _08026FD0  @ gUnknown_02036010
_08026FC2:
	ldr r1, _08026FD4  @ 0x06011000
	movs r2, #0x80
	lsls r2, r2, #6
	bl RegisterTileGraphics
	b _08026FE8
	.align 2, 0
_08026FD0: .4byte gUnknown_02036010
_08026FD4: .4byte 0x06011000
_08026FD8:
	cmp r1, #0
	blt _08026FE8
	ldr r0, _08026FEC  @ gUnknown_02034010
	ldr r1, _08026FF0  @ 0x06011000
	movs r2, #0x80
	lsls r2, r2, #6
	bl RegisterTileGraphics
_08026FE8:
	pop {r0}
	bx r0
	.align 2, 0
_08026FEC: .4byte gUnknown_02034010
_08026FF0: .4byte 0x06011000

	THUMB_FUNC_END SMS_FlushIndirect

	THUMB_FUNC_START sub_8026FF4
sub_8026FF4: @ 0x08026FF4
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	bl GetGameClock
	movs r1, #0x48
	bl __umodsi3
	adds r1, r0, #0
	movs r2, #0
	cmp r0, #0
	bne _0802700E
	ldr r2, _08027058  @ gUnknown_02034010
_0802700E:
	cmp r0, #0x20
	bne _08027014
	ldr r2, _0802705C  @ gUnknown_02036010
_08027014:
	cmp r0, #0x24
	bne _0802701A
	ldr r2, _08027060  @ gUnknown_02038010
_0802701A:
	cmp r1, #0x44
	bne _08027020
	ldr r2, _0802705C  @ gUnknown_02036010
_08027020:
	cmp r2, #0
	beq _08027050
	ldr r1, _08027064  @ gUnknown_0859B66C
	lsls r0, r4, #2
	adds r0, r0, r1
	ldr r0, [r0]
	lsls r0, r0, #5
	adds r1, r5, #0
	adds r1, #0x20
	adds r5, r0, r1
	adds r4, r0, r2
	movs r6, #3
_08027038:
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0x10
	bl CpuFastSet
	movs r0, #0x80
	lsls r0, r0, #3
	adds r5, r5, r0
	adds r4, r4, r0
	subs r6, #1
	cmp r6, #0
	bge _08027038
_08027050:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08027058: .4byte gUnknown_02034010
_0802705C: .4byte gUnknown_02036010
_08027060: .4byte gUnknown_02038010
_08027064: .4byte gUnknown_0859B66C

	THUMB_FUNC_END sub_8026FF4

	THUMB_FUNC_START sub_8027068
sub_8027068: @ 0x08027068
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	bl GetGameClock
	movs r1, #0x48
	bl __umodsi3
	adds r1, r0, #0
	movs r2, #0
	cmp r0, #0x43
	bgt _08027090
	cmp r0, #0x23
	ble _0802708C
	ldr r2, _08027088  @ gUnknown_02038010
	b _0802709E
	.align 2, 0
_08027088: .4byte gUnknown_02038010
_0802708C:
	cmp r0, #0x1f
	ble _08027098
_08027090:
	ldr r2, _08027094  @ gUnknown_02036010
	b _0802709E
	.align 2, 0
_08027094: .4byte gUnknown_02036010
_08027098:
	cmp r1, #0
	blt _0802709E
	ldr r2, _080270D4  @ gUnknown_02034010
_0802709E:
	cmp r2, #0
	beq _080270CE
	ldr r1, _080270D8  @ gUnknown_0859B66C
	lsls r0, r4, #2
	adds r0, r0, r1
	ldr r0, [r0]
	lsls r0, r0, #5
	adds r1, r5, #0
	adds r1, #0x20
	adds r5, r0, r1
	adds r4, r0, r2
	movs r6, #3
_080270B6:
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0x40
	bl RegisterTileGraphics
	movs r0, #0x80
	lsls r0, r0, #3
	adds r5, r5, r0
	adds r4, r4, r0
	subs r6, #1
	cmp r6, #0
	bge _080270B6
_080270CE:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080270D4: .4byte gUnknown_02034010
_080270D8: .4byte gUnknown_0859B66C

	THUMB_FUNC_END sub_8027068

	THUMB_FUNC_START sub_80270DC
sub_80270DC: @ 0x080270DC
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r7, r1, #0
	bl GetGameClock
	movs r1, #0x48
	bl __umodsi3
	adds r1, r0, #0
	movs r5, #0
	cmp r0, #0x43
	bgt _08027104
	cmp r0, #0x23
	ble _08027100
	ldr r5, _080270FC  @ gUnknown_02038010
	b _08027112
	.align 2, 0
_080270FC: .4byte gUnknown_02038010
_08027100:
	cmp r0, #0x1f
	ble _0802710C
_08027104:
	ldr r5, _08027108  @ gUnknown_02036010
	b _08027112
	.align 2, 0
_08027108: .4byte gUnknown_02036010
_0802710C:
	cmp r1, #0
	blt _08027112
	ldr r5, _08027138  @ gUnknown_02034010
_08027112:
	cmp r5, #0
	beq _08027130
	lsls r4, r4, #5
	movs r6, #3
_0802711A:
	adds r0, r5, r4
	adds r1, r7, r4
	movs r2, #0x80
	bl RegisterTileGraphics
	movs r0, #0x80
	lsls r0, r0, #3
	adds r4, r4, r0
	subs r6, #1
	cmp r6, #0
	bge _0802711A
_08027130:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08027138: .4byte gUnknown_02034010

	THUMB_FUNC_END sub_80270DC

	THUMB_FUNC_START GetUnitSpritePaletteIndexWrapper
GetUnitSpritePaletteIndexWrapper: @ 0x0802713C
	push {lr}
	adds r2, r0, #0
	ldr r1, [r2, #0xc]
	movs r0, #0x80
	lsls r0, r0, #0x14
	ands r0, r1
	cmp r0, #0
	beq _08027150
	movs r0, #0xb
	b _08027162
_08027150:
	movs r0, #2
	ands r1, r0
	cmp r1, #0
	bne _08027160
	adds r0, r2, #0
	bl GetUnitMapSpritePaletteIndex
	b _08027162
_08027160:
	movs r0, #0xf
_08027162:
	pop {r1}
	bx r1

	THUMB_FUNC_END GetUnitSpritePaletteIndexWrapper

	THUMB_FUNC_START GetUnitMapSpritePaletteIndex
GetUnitMapSpritePaletteIndex: @ 0x08027168
	push {lr}
	adds r1, r0, #0
	movs r2, #0xb
	ldrsb r2, [r1, r2]
	movs r1, #0xc0
	ands r2, r1
	cmp r2, #0x40
	beq _08027194
	cmp r2, #0x40
	bgt _08027182
	cmp r2, #0
	beq _0802718C
	b _0802719A
_08027182:
	cmp r2, #0x80
	beq _08027190
	cmp r2, #0xc0
	beq _08027198
	b _0802719A
_0802718C:
	movs r0, #0xc
	b _0802719A
_08027190:
	movs r0, #0xd
	b _0802719A
_08027194:
	movs r0, #0xe
	b _0802719A
_08027198:
	movs r0, #0xb
_0802719A:
	pop {r1}
	bx r1

	THUMB_FUNC_END GetUnitMapSpritePaletteIndex

	THUMB_FUNC_START SMS_UpdateFromGameData
SMS_UpdateFromGameData: @ 0x080271A0
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	movs r0, #0
	mov r8, r0
	ldr r0, _080272C0  @ gUnknown_0203A4C8
	ldr r1, _080272C4  @ gUnknown_0203A018
	mov r2, r8
	str r2, [r1]
	movs r2, #0x80
	lsls r2, r2, #3
	strh r2, [r1, #6]
	adds r1, #0xc
	str r1, [r0]
	movs r7, #1
_080271C0:
	adds r0, r7, #0
	bl GetUnit
	adds r6, r0, #0
	cmp r6, #0
	beq _08027282
	ldr r0, [r6]
	cmp r0, #0
	beq _08027282
	movs r0, #0
	str r0, [r6, #0x3c]
	ldr r3, [r6, #0xc]
	ldr r0, _080272C8  @ 0x00000201
	ands r0, r3
	cmp r0, #0
	bne _08027282
	movs r2, #0x11
	ldrsb r2, [r6, r2]
	ldr r0, _080272CC  @ gBmMapUnit
	ldr r1, [r0]
	lsls r0, r2, #2
	adds r0, r0, r1
	movs r1, #0x10
	ldrsb r1, [r6, r1]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _08027282
	adds r0, r6, #0
	adds r0, #0x30
	ldrb r0, [r0]
	movs r1, #0xf
	ands r1, r0
	cmp r1, #0xb
	beq _0802720C
	cmp r1, #0xd
	bne _08027212
_0802720C:
	movs r0, #2
	orrs r3, r0
	str r3, [r6, #0xc]
_08027212:
	lsls r0, r2, #4
	bl SMS_GetNewInfoStruct
	adds r5, r0, #0
	movs r0, #0x11
	ldrsb r0, [r6, r0]
	lsls r0, r0, #4
	strh r0, [r5, #6]
	movs r0, #0x10
	ldrsb r0, [r6, r0]
	lsls r0, r0, #4
	strh r0, [r5, #4]
	adds r0, r6, #0
	bl GetUnitSMSId
	bl SMS_RegisterUsage
	adds r4, r0, #0
	adds r0, r6, #0
	bl GetUnitSpritePaletteIndexWrapper
	adds r4, #0x80
	movs r1, #0xf
	ands r1, r0
	lsls r1, r1, #0xc
	adds r4, r4, r1
	strh r4, [r5, #8]
	adds r0, r6, #0
	bl GetUnitSMSId
	ldr r2, _080272D0  @ unit_icon_wait_table
	movs r1, #0x7f
	ands r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	ldrh r0, [r1, #2]
	adds r2, r0, #0
	strb r0, [r5, #0xb]
	ldr r0, [r6, #0xc]
	movs r1, #0x80
	lsls r1, r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0802726E
	adds r0, r2, #3
	strb r0, [r5, #0xb]
_0802726E:
	ldr r0, [r6, #0xc]
	movs r1, #0x80
	lsls r1, r1, #0x11
	ands r0, r1
	cmp r0, #0
	beq _08027280
	ldrb r0, [r5, #0xb]
	adds r0, #0x40
	strb r0, [r5, #0xb]
_08027280:
	str r5, [r6, #0x3c]
_08027282:
	adds r7, #1
	cmp r7, #0xc5
	ble _080271C0
	movs r0, #0
	bl GetTrap
	adds r4, r0, #0
	ldrb r0, [r4, #2]
	cmp r0, #0
	beq _0802734C
	ldr r1, _080272D4  @ 0xFFFFC080
	adds r6, r1, #0
	ldr r7, _080272D8  @ unit_icon_wait_table + 0x2DA @ [91].size ballista
	movs r2, #0x58
	adds r2, r2, r7
	mov r9, r2
_080272A2:
	cmp r0, #1
	bne _08027316
	movs r0, #5
	ldrsb r0, [r4, r0]
	cmp r0, #0
	bne _08027316
	ldrb r0, [r4, #3]
	cmp r0, #0x36
	beq _080272E6
	cmp r0, #0x36
	bgt _080272DC
	cmp r0, #0x35
	beq _080272E2
	b _080272F8
	.align 2, 0
_080272C0: .4byte gUnknown_0203A4C8
_080272C4: .4byte gUnknown_0203A018
_080272C8: .4byte 0x00000201
_080272CC: .4byte gBmMapUnit
_080272D0: .4byte unit_icon_wait_table
_080272D4: .4byte 0xFFFFC080
_080272D8: .4byte unit_icon_wait_table + 0x2DA @ [91].size ballista
_080272DC:
	cmp r0, #0x37
	beq _080272EA
	b _080272F8
_080272E2:
	movs r0, #0x5b
	b _080272EC
_080272E6:
	movs r0, #0x5c
	b _080272EC
_080272EA:
	movs r0, #0x5d
_080272EC:
	bl SMS_RegisterUsage
	adds r0, r0, r6
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
_080272F8:
	ldrb r0, [r4, #1]
	lsls r0, r0, #4
	bl SMS_GetNewInfoStruct
	adds r5, r0, #0
	ldrb r0, [r4, #1]
	lsls r0, r0, #4
	strh r0, [r5, #6]
	ldrb r0, [r4]
	lsls r0, r0, #4
	strh r0, [r5, #4]
	mov r0, r8
	strh r0, [r5, #8]
	ldrh r0, [r7]
	strb r0, [r5, #0xb]
_08027316:
	ldrb r0, [r4, #2]
	cmp r0, #0xd
	bne _08027344
	ldrb r0, [r4, #1]
	lsls r0, r0, #4
	bl SMS_GetNewInfoStruct
	adds r5, r0, #0
	ldrb r0, [r4, #1]
	lsls r0, r0, #4
	strh r0, [r5, #6]
	ldrb r0, [r4]
	lsls r0, r0, #4
	strh r0, [r5, #4]
	movs r0, #0x66
	bl SMS_RegisterUsage
	ldr r1, _08027364  @ 0xFFFFB080
	adds r0, r0, r1
	strh r0, [r5, #8]
	mov r2, r9
	ldrh r0, [r2]
	strb r0, [r5, #0xb]
_08027344:
	adds r4, #8
	ldrb r0, [r4, #2]
	cmp r0, #0
	bne _080272A2
_0802734C:
	ldr r0, _08027368  @ gUnknown_0203A4CC
	ldr r0, [r0]
	cmp r0, #0
	beq _08027358
	bl SMS_FlushIndirect
_08027358:
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08027364: .4byte 0xFFFFB080
_08027368: .4byte gUnknown_0203A4CC

	THUMB_FUNC_END SMS_UpdateFromGameData

	THUMB_FUNC_START SMS_GetNewInfoStruct
SMS_GetNewInfoStruct: @ 0x0802736C
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r2, _08027388  @ gUnknown_0203A018
	ldr r3, _0802738C  @ gUnknown_0203A4C8
_08027374:
	ldr r1, [r2]
	cmp r1, #0
	beq _08027390
	movs r5, #6
	ldrsh r0, [r1, r5]
	cmp r0, r4
	blt _08027390
	adds r2, r1, #0
	b _08027374
	.align 2, 0
_08027388: .4byte gUnknown_0203A018
_0802738C: .4byte gUnknown_0203A4C8
_08027390:
	ldr r0, [r3]
	str r1, [r0]
	str r0, [r2]
	adds r1, r0, #0
	adds r1, #0xc
	str r1, [r3]
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END SMS_GetNewInfoStruct

	THUMB_FUNC_START SMS_DisplayAllFromInfoStructs
SMS_DisplayAllFromInfoStructs: @ 0x080273A4
	push {r4, r5, r6, lr}
	ldr r0, _0802741C  @ gUnknown_0203A018
	ldr r6, [r0]
	bl DisplayUnitAdditionalBlinkingIcons
	cmp r6, #0
	bne _080273B4
	b _08027526
_080273B4:
	movs r3, #0
	movs r0, #4
	ldrsh r1, [r6, r0]
	ldr r2, _08027420  @ gUnknown_0202BCB0
	movs r4, #0xc
	ldrsh r0, [r2, r4]
	subs r4, r1, r0
	movs r5, #6
	ldrsh r1, [r6, r5]
	movs r5, #0xe
	ldrsh r0, [r2, r5]
	subs r5, r1, r0
	adds r1, r4, #0
	adds r1, #0x10
	movs r0, #0x80
	lsls r0, r0, #1
	cmp r1, r0
	bls _080273DA
	b _0802751E
_080273DA:
	adds r0, r5, #0
	adds r0, #0x20
	cmp r0, #0xc0
	bls _080273E4
	b _0802751E
_080273E4:
	movs r0, #0xb
	ldrsb r0, [r6, r0]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _080273F2
	b _0802751E
_080273F2:
	ldrb r1, [r6, #0xb]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08027406
	bl GetGameClock
	adds r3, r0, #0
	movs r0, #2
	ands r3, r0
_08027406:
	ldrb r0, [r6, #0xb]
	movs r1, #0xf
	ands r1, r0
	cmp r1, #5
	bls _08027412
	b _0802751E
_08027412:
	lsls r0, r1, #2
	ldr r1, _08027424  @ _08027428
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0802741C: .4byte gUnknown_0203A018
_08027420: .4byte gUnknown_0202BCB0
_08027424: .4byte _08027428
_08027428: @ jump table
	.4byte _08027440 @ case 0
	.4byte _08027464 @ case 1
	.4byte _08027488 @ case 2
	.4byte _080274B0 @ case 3
	.4byte _080274D0 @ case 4
	.4byte _080274F8 @ case 5
_08027440:
	adds r0, r4, r3
	movs r1, #0x80
	lsls r1, r1, #2
	adds r0, r0, r1
	subs r1, #1
	ands r0, r1
	movs r2, #0x80
	lsls r2, r2, #1
	adds r1, r5, r2
	movs r2, #0xff
	ands r1, r2
	ldr r2, _08027460  @ gObject_16x16
	ldrh r3, [r6, #8]
	movs r4, #0x80
	lsls r4, r4, #4
	b _080274EC
	.align 2, 0
_08027460: .4byte gObject_16x16
_08027464:
	adds r0, r4, r3
	movs r1, #0x80
	lsls r1, r1, #2
	adds r0, r0, r1
	subs r1, #1
	ands r0, r1
	adds r1, r5, #0
	adds r1, #0xf0
	movs r2, #0xff
	ands r1, r2
	ldr r2, _08027484  @ gObject_16x32
	ldrh r3, [r6, #8]
	movs r4, #0x80
	lsls r4, r4, #4
	b _080274EC
	.align 2, 0
_08027484: .4byte gObject_16x32
_08027488:
	adds r0, r3, #0
	subs r0, #8
	adds r0, r4, r0
	movs r1, #0x80
	lsls r1, r1, #2
	adds r0, r0, r1
	subs r1, #1
	ands r0, r1
	adds r1, r5, #0
	adds r1, #0xf0
	movs r2, #0xff
	ands r1, r2
	ldr r2, _080274AC  @ gObject_32x32
	ldrh r3, [r6, #8]
	movs r4, #0x80
	lsls r4, r4, #4
	b _080274EC
	.align 2, 0
_080274AC: .4byte gObject_32x32
_080274B0:
	adds r0, r4, r3
	movs r1, #0x80
	lsls r1, r1, #2
	adds r0, r0, r1
	subs r1, #1
	ands r0, r1
	movs r2, #0x80
	lsls r2, r2, #1
	adds r1, r5, r2
	movs r2, #0xff
	ands r1, r2
	ldr r2, _080274CC  @ gObject_16x16
	b _080274E6
	.align 2, 0
_080274CC: .4byte gObject_16x16
_080274D0:
	adds r0, r4, r3
	movs r1, #0x80
	lsls r1, r1, #2
	adds r0, r0, r1
	subs r1, #1
	ands r0, r1
	adds r1, r5, #0
	adds r1, #0xf0
	movs r2, #0xff
	ands r1, r2
	ldr r2, _080274F4  @ gObject_16x32
_080274E6:
	ldrh r3, [r6, #8]
	movs r4, #0xc0
	lsls r4, r4, #4
_080274EC:
	adds r3, r3, r4
	bl CallARM_PushToSecondaryOAM
	b _0802751E
	.align 2, 0
_080274F4: .4byte gObject_16x32
_080274F8:
	adds r0, r3, #0
	subs r0, #8
	adds r0, r4, r0
	movs r1, #0x80
	lsls r1, r1, #2
	adds r0, r0, r1
	subs r1, #1
	ands r0, r1
	adds r1, r5, #0
	adds r1, #0xf0
	movs r2, #0xff
	ands r1, r2
	ldr r2, _0802752C  @ gObject_32x32
	ldrh r3, [r6, #8]
	movs r4, #0xc0
	lsls r4, r4, #4
	adds r3, r3, r4
	bl CallARM_PushToSecondaryOAM
_0802751E:
	ldr r6, [r6]
	cmp r6, #0
	beq _08027526
	b _080273B4
_08027526:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802752C: .4byte gObject_32x32

	THUMB_FUNC_END SMS_DisplayAllFromInfoStructs

	THUMB_FUNC_START DisplayChapterTileMarker
DisplayChapterTileMarker: @ 0x08027530
	push {r4, r5, lr}
	ldr r4, _080275CC  @ gRAMChapterData
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	bl GetROMChapterStruct
	adds r0, #0x8f
	ldrb r5, [r0]
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	bl GetROMChapterStruct
	adds r0, #0x90
	ldrb r4, [r0]
	bl GetGameClock
	movs r2, #0
	movs r1, #0x1f
	ands r1, r0
	cmp r1, #0x13
	bhi _0802755C
	movs r2, #1
_0802755C:
	cmp r5, #0xff
	beq _080275C6
	cmp r2, #0
	beq _080275C6
	ldr r0, _080275D0  @ gBmMapFog
	ldr r0, [r0]
	lsls r1, r4, #2
	adds r0, r1, r0
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r0, [r0]
	cmp r0, #0
	beq _080275C6
	ldr r0, _080275D4  @ gBmMapTerrain
	ldr r0, [r0]
	adds r0, r1, r0
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r0, [r0]
	cmp r0, #0x22
	beq _080275C6
	lsls r1, r5, #4
	ldr r2, _080275D8  @ gUnknown_0202BCB0
	movs r3, #0xc
	ldrsh r0, [r2, r3]
	subs r3, r1, r0
	lsls r1, r4, #4
	movs r4, #0xe
	ldrsh r0, [r2, r4]
	subs r2, r1, r0
	adds r1, r3, #0
	adds r1, #0x10
	movs r0, #0x80
	lsls r0, r0, #1
	cmp r1, r0
	bhi _080275C6
	adds r0, r2, #0
	adds r0, #0x10
	cmp r0, #0xb0
	bhi _080275C6
	movs r1, #0x81
	lsls r1, r1, #2
	adds r0, r3, r1
	subs r1, #5
	ands r0, r1
	ldr r3, _080275DC  @ 0x00000107
	adds r1, r2, r3
	movs r2, #0xff
	ands r1, r2
	ldr r2, _080275E0  @ gObject_8x8
	ldr r3, _080275E4  @ 0x00000C51
	bl CallARM_PushToSecondaryOAM
_080275C6:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080275CC: .4byte gRAMChapterData
_080275D0: .4byte gBmMapFog
_080275D4: .4byte gBmMapTerrain
_080275D8: .4byte gUnknown_0202BCB0
_080275DC: .4byte 0x00000107
_080275E0: .4byte gObject_8x8
_080275E4: .4byte 0x00000C51

	THUMB_FUNC_END DisplayChapterTileMarker

	THUMB_FUNC_START DisplayUnitAdditionalBlinkingIcons
DisplayUnitAdditionalBlinkingIcons: @ 0x080275E8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	ldr r1, _08027618  @ gUnknown_080D7C0C
	mov r0, sp
	movs r2, #6
	bl memcpy
	bl GetChapterThing
	cmp r0, #2
	beq _08027620
	ldr r0, _0802761C  @ gRAMChapterData
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetROMChapterStruct
	adds r0, #0x8e
	ldrb r0, [r0]
	b _08027622
	.align 2, 0
_08027618: .4byte gUnknown_080D7C0C
_0802761C: .4byte gRAMChapterData
_08027620:
	movs r0, #0
_08027622:
	mov r9, r0
	bl GetGameClock
	movs r2, #0
	movs r1, #0x1f
	ands r1, r0
	cmp r1, #0x13
	bhi _08027634
	movs r2, #1
_08027634:
	adds r7, r2, #0
	bl GetGameClock
	lsrs r0, r0, #3
	movs r1, #0xc
	bl __umodsi3
	str r0, [sp, #8]
	bl GetGameClock
	lsrs r0, r0, #4
	movs r1, #7
	bl __umodsi3
	str r0, [sp, #0xc]
	bl GetGameClock
	lsrs r0, r0, #3
	movs r1, #9
	bl __umodsi3
	str r0, [sp, #0x10]
	bl GetGameClock
	lsrs r0, r0, #2
	movs r1, #0x12
	bl __umodsi3
	mov sl, r0
	movs r0, #0x84
	bl CheckEventId
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0802767C
	b _08027A08
_0802767C:
	bl DisplayChapterTileMarker
	movs r1, #1
	mov r8, r1
_08027684:
	mov r0, r8
	bl GetUnit
	adds r4, r0, #0
	cmp r4, #0
	bne _08027692
	b _080279FC
_08027692:
	ldr r0, [r4]
	cmp r0, #0
	bne _0802769A
	b _080279FC
_0802769A:
	ldr r0, [r4, #0xc]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _080276A6
	b _080279FC
_080276A6:
	adds r0, r4, #0
	bl GetUnitStandingSpriteDataFlagThing
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080276B4
	b _080279FC
_080276B4:
	adds r0, r4, #0
	adds r0, #0x30
	ldrb r0, [r0]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1c
	subs r0, #1
	lsls r6, r7, #0x18
	cmp r0, #9
	bls _080276C8
	b _080278A6
_080276C8:
	lsls r0, r0, #2
	ldr r1, _080276D4  @ _080276D8
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080276D4: .4byte _080276D8
_080276D8: @ jump table
	.4byte _08027700 @ case 0
	.4byte _080277A8 @ case 1
	.4byte _08027754 @ case 2
	.4byte _080277F8 @ case 3
	.4byte _08027858 @ case 4
	.4byte _08027858 @ case 5
	.4byte _08027858 @ case 6
	.4byte _08027858 @ case 7
	.4byte _080278A6 @ case 8
	.4byte _080278A6 @ case 9
_08027700:
	movs r1, #0x10
	ldrsb r1, [r4, r1]
	lsls r1, r1, #4
	ldr r2, _0802774C  @ gUnknown_0202BCB0
	movs r3, #0xc
	ldrsh r0, [r2, r3]
	subs r3, r1, r0
	movs r0, #0x11
	ldrsb r0, [r4, r0]
	lsls r0, r0, #4
	movs r5, #0xe
	ldrsh r1, [r2, r5]
	subs r2, r0, r1
	adds r1, r3, #0
	adds r1, #0x10
	movs r0, #0x80
	lsls r0, r0, #1
	lsls r6, r7, #0x18
	cmp r1, r0
	bls _0802772A
	b _080278A6
_0802772A:
	adds r0, r2, #0
	adds r0, #0x10
	cmp r0, #0xb0
	bls _08027734
	b _080278A6
_08027734:
	movs r1, #0xff
	lsls r1, r1, #1
	adds r0, r3, r1
	adds r1, #1
	ands r0, r1
	adds r1, r2, #0
	adds r1, #0xfc
	movs r2, #0xff
	ands r1, r2
	ldr r3, _08027750  @ gUnknown_0859B938
	ldr r5, [sp, #8]
	b _0802783C
	.align 2, 0
_0802774C: .4byte gUnknown_0202BCB0
_08027750: .4byte gUnknown_0859B938
_08027754:
	movs r1, #0x10
	ldrsb r1, [r4, r1]
	lsls r1, r1, #4
	ldr r2, _080277A0  @ gUnknown_0202BCB0
	movs r3, #0xc
	ldrsh r0, [r2, r3]
	subs r3, r1, r0
	movs r0, #0x11
	ldrsb r0, [r4, r0]
	lsls r0, r0, #4
	movs r5, #0xe
	ldrsh r1, [r2, r5]
	subs r2, r0, r1
	adds r1, r3, #0
	adds r1, #0x10
	movs r0, #0x80
	lsls r0, r0, #1
	lsls r6, r7, #0x18
	cmp r1, r0
	bls _0802777E
	b _080278A6
_0802777E:
	adds r0, r2, #0
	adds r0, #0x10
	cmp r0, #0xb0
	bls _08027788
	b _080278A6
_08027788:
	movs r1, #0xff
	lsls r1, r1, #1
	adds r0, r3, r1
	adds r1, #1
	ands r0, r1
	adds r1, r2, #0
	adds r1, #0xfc
	movs r2, #0xff
	ands r1, r2
	ldr r3, _080277A4  @ gUnknown_0859B898
	mov r5, sl
	b _0802783C
	.align 2, 0
_080277A0: .4byte gUnknown_0202BCB0
_080277A4: .4byte gUnknown_0859B898
_080277A8:
	movs r1, #0x10
	ldrsb r1, [r4, r1]
	lsls r1, r1, #4
	ldr r2, _080277EC  @ gUnknown_0202BCB0
	movs r3, #0xc
	ldrsh r0, [r2, r3]
	subs r3, r1, r0
	movs r0, #0x11
	ldrsb r0, [r4, r0]
	lsls r0, r0, #4
	movs r5, #0xe
	ldrsh r1, [r2, r5]
	subs r2, r0, r1
	adds r0, r3, #0
	adds r0, #0x10
	movs r5, #0x80
	lsls r5, r5, #1
	lsls r6, r7, #0x18
	cmp r0, r5
	bhi _080278A6
	adds r0, r2, #0
	adds r0, #0x10
	cmp r0, #0xb0
	bhi _080278A6
	ldr r1, _080277F0  @ 0x00000202
	adds r0, r3, r1
	subs r1, #3
	ands r0, r1
	adds r1, r2, r5
	movs r2, #0xff
	ands r1, r2
	ldr r3, _080277F4  @ gUnknown_0859B7F4
	ldr r5, [sp, #0xc]
	b _0802783C
	.align 2, 0
_080277EC: .4byte gUnknown_0202BCB0
_080277F0: .4byte 0x00000202
_080277F4: .4byte gUnknown_0859B7F4
_080277F8:
	movs r1, #0x10
	ldrsb r1, [r4, r1]
	lsls r1, r1, #4
	ldr r2, _0802784C  @ gUnknown_0202BCB0
	movs r3, #0xc
	ldrsh r0, [r2, r3]
	subs r3, r1, r0
	movs r0, #0x11
	ldrsb r0, [r4, r0]
	lsls r0, r0, #4
	movs r5, #0xe
	ldrsh r1, [r2, r5]
	subs r2, r0, r1
	adds r1, r3, #0
	adds r1, #0x10
	movs r0, #0x80
	lsls r0, r0, #1
	lsls r6, r7, #0x18
	cmp r1, r0
	bhi _080278A6
	adds r0, r2, #0
	adds r0, #0x10
	cmp r0, #0xb0
	bhi _080278A6
	ldr r1, _08027850  @ 0x00000201
	adds r0, r3, r1
	subs r1, #2
	ands r0, r1
	adds r1, r2, #0
	adds r1, #0xfb
	movs r2, #0xff
	ands r1, r2
	ldr r3, _08027854  @ gUnknown_0859B858
	ldr r5, [sp, #0x10]
_0802783C:
	lsls r2, r5, #2
	adds r2, r2, r3
	ldr r2, [r2]
	movs r3, #0
	bl CallARM_PushToSecondaryOAM
	b _080278A6
	.align 2, 0
_0802784C: .4byte gUnknown_0202BCB0
_08027850: .4byte 0x00000201
_08027854: .4byte gUnknown_0859B858
_08027858:
	lsls r0, r7, #0x18
	adds r6, r0, #0
	cmp r6, #0
	bne _08027862
	b _080279FC
_08027862:
	movs r1, #0x10
	ldrsb r1, [r4, r1]
	lsls r1, r1, #4
	ldr r2, _08027914  @ gUnknown_0202BCB0
	movs r3, #0xc
	ldrsh r0, [r2, r3]
	subs r3, r1, r0
	movs r0, #0x11
	ldrsb r0, [r4, r0]
	lsls r0, r0, #4
	movs r5, #0xe
	ldrsh r1, [r2, r5]
	subs r2, r0, r1
	adds r1, r3, #0
	adds r1, #0x10
	movs r0, #0x80
	lsls r0, r0, #1
	cmp r1, r0
	bhi _080278A6
	adds r0, r2, #0
	adds r0, #0x10
	cmp r0, #0xb0
	bhi _080278A6
	ldr r1, _08027918  @ 0x000001FF
	adds r0, r3, r1
	ands r0, r1
	adds r1, r2, #0
	adds r1, #0xfb
	movs r2, #0xff
	ands r1, r2
	ldr r2, _0802791C  @ gUnknown_0859B968
	movs r3, #0
	bl CallARM_PushToSecondaryOAM
_080278A6:
	cmp r6, #0
	bne _080278AC
	b _080279FC
_080278AC:
	ldr r0, [r4, #0xc]
	movs r1, #0x10
	ands r0, r1
	cmp r0, #0
	beq _08027930
	movs r1, #0x10
	ldrsb r1, [r4, r1]
	lsls r1, r1, #4
	ldr r2, _08027914  @ gUnknown_0202BCB0
	movs r3, #0xc
	ldrsh r0, [r2, r3]
	subs r3, r1, r0
	movs r0, #0x11
	ldrsb r0, [r4, r0]
	lsls r0, r0, #4
	movs r5, #0xe
	ldrsh r1, [r2, r5]
	subs r2, r0, r1
	adds r1, r3, #0
	adds r1, #0x10
	movs r0, #0x80
	lsls r0, r0, #1
	cmp r1, r0
	bls _080278DE
	b _080279FC
_080278DE:
	adds r0, r2, #0
	adds r0, #0x10
	cmp r0, #0xb0
	bls _080278E8
	b _080279FC
_080278E8:
	ldr r1, _08027920  @ 0x00000209
	adds r0, r3, r1
	subs r1, #0xa
	ands r0, r1
	ldr r3, _08027924  @ 0x00000107
	adds r1, r2, r3
	movs r2, #0xff
	ands r1, r2
	ldr r2, _08027928  @ gObject_8x8
	ldrb r3, [r4, #0x1b]
	lsrs r3, r3, #6
	lsls r3, r3, #1
	add r3, sp
	ldrh r4, [r3]
	movs r3, #0xf
	ands r3, r4
	lsls r3, r3, #0xc
	ldr r4, _0802792C  @ 0x00000803
	adds r3, r3, r4
	bl CallARM_PushToSecondaryOAM
	b _080279FC
	.align 2, 0
_08027914: .4byte gUnknown_0202BCB0
_08027918: .4byte 0x000001FF
_0802791C: .4byte gUnknown_0859B968
_08027920: .4byte 0x00000209
_08027924: .4byte 0x00000107
_08027928: .4byte gObject_8x8
_0802792C: .4byte 0x00000803
_08027930:
	movs r1, #0xb
	ldrsb r1, [r4, r1]
	movs r0, #0xc0
	ands r1, r0
	ldr r2, [r4]
	cmp r1, #0
	beq _080279B0
	ldr r0, [r4, #4]
	ldr r1, [r2, #0x28]
	ldr r0, [r0, #0x28]
	orrs r1, r0
	movs r0, #0x80
	lsls r0, r0, #8
	ands r1, r0
	cmp r1, #0
	beq _080279B0
	movs r1, #0x10
	ldrsb r1, [r4, r1]
	lsls r1, r1, #4
	ldr r2, _0802799C  @ gUnknown_0202BCB0
	movs r5, #0xc
	ldrsh r0, [r2, r5]
	subs r3, r1, r0
	movs r0, #0x11
	ldrsb r0, [r4, r0]
	lsls r0, r0, #4
	movs r4, #0xe
	ldrsh r1, [r2, r4]
	subs r2, r0, r1
	adds r1, r3, #0
	adds r1, #0x10
	movs r0, #0x80
	lsls r0, r0, #1
	cmp r1, r0
	bhi _080279FC
	adds r0, r2, #0
	adds r0, #0x10
	cmp r0, #0xb0
	bhi _080279FC
	ldr r5, _080279A0  @ 0x00000209
	adds r0, r3, r5
	ldr r1, _080279A4  @ 0x000001FF
	ands r0, r1
	ldr r3, _080279A8  @ 0x00000107
	adds r1, r2, r3
	movs r2, #0xff
	ands r1, r2
	ldr r2, _080279AC  @ gObject_8x8
	movs r3, #0x81
	lsls r3, r3, #4
	bl CallARM_PushToSecondaryOAM
	b _080279FC
	.align 2, 0
_0802799C: .4byte gUnknown_0202BCB0
_080279A0: .4byte 0x00000209
_080279A4: .4byte 0x000001FF
_080279A8: .4byte 0x00000107
_080279AC: .4byte gObject_8x8
_080279B0:
	ldrb r2, [r2, #4]
	cmp r9, r2
	bne _080279FC
	movs r1, #0x10
	ldrsb r1, [r4, r1]
	lsls r1, r1, #4
	ldr r2, _08027A18  @ gUnknown_0202BCB0
	movs r5, #0xc
	ldrsh r0, [r2, r5]
	subs r3, r1, r0
	movs r0, #0x11
	ldrsb r0, [r4, r0]
	lsls r0, r0, #4
	movs r4, #0xe
	ldrsh r1, [r2, r4]
	subs r2, r0, r1
	adds r1, r3, #0
	adds r1, #0x10
	movs r0, #0x80
	lsls r0, r0, #1
	cmp r1, r0
	bhi _080279FC
	adds r0, r2, #0
	adds r0, #0x10
	cmp r0, #0xb0
	bhi _080279FC
	ldr r5, _08027A1C  @ 0x00000209
	adds r0, r3, r5
	ldr r1, _08027A20  @ 0x000001FF
	ands r0, r1
	ldr r3, _08027A24  @ 0x00000107
	adds r1, r2, r3
	movs r2, #0xff
	ands r1, r2
	ldr r2, _08027A28  @ gObject_8x8
	ldr r3, _08027A2C  @ 0x00000811
	bl CallARM_PushToSecondaryOAM
_080279FC:
	movs r4, #1
	add r8, r4
	mov r5, r8
	cmp r5, #0xbf
	bgt _08027A08
	b _08027684
_08027A08:
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08027A18: .4byte gUnknown_0202BCB0
_08027A1C: .4byte 0x00000209
_08027A20: .4byte 0x000001FF
_08027A24: .4byte 0x00000107
_08027A28: .4byte gObject_8x8
_08027A2C: .4byte 0x00000811

	THUMB_FUNC_END DisplayUnitAdditionalBlinkingIcons

	THUMB_FUNC_START sub_8027A30
sub_8027A30: @ 0x08027A30
	ldr r1, _08027A38  @ gUnknown_0202BCB0
	ldr r0, _08027A3C  @ 0x0000FFFF
	strh r0, [r1, #0x18]
	bx lr
	.align 2, 0
_08027A38: .4byte gUnknown_0202BCB0
_08027A3C: .4byte 0x0000FFFF

	THUMB_FUNC_END sub_8027A30

	THUMB_FUNC_START sub_8027A40
sub_8027A40: @ 0x08027A40
	ldr r1, _08027A48  @ gUnknown_0203A4D0
	movs r0, #0
	str r0, [r1]
	bx lr
	.align 2, 0
_08027A48: .4byte gUnknown_0203A4D0

	THUMB_FUNC_END sub_8027A40

	THUMB_FUNC_START sub_8027A4C
sub_8027A4C: @ 0x08027A4C
	push {r4, lr}
	ldr r2, _08027AB4  @ gUnknown_0202BCB0
	movs r1, #0x16
	ldrsh r0, [r2, r1]
	ldr r1, _08027AB8  @ gBmMapUnit
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r3, #0x14
	ldrsh r1, [r2, r3]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	bl GetUnit
	adds r4, r0, #0
	cmp r4, #0
	beq _08027AC0
	ldr r0, [r4, #0xc]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	bne _08027AC0
	movs r0, #0xb
	ldrsb r0, [r4, r0]
	movs r1, #0xc0
	ands r0, r1
	cmp r0, #0
	bne _08027AC0
	adds r0, r4, #0
	adds r0, #0x30
	ldrb r0, [r0]
	movs r1, #0xf
	ands r1, r0
	cmp r1, #4
	beq _08027AC0
	cmp r1, #2
	beq _08027AC0
	ldr r1, _08027ABC  @ gUnknown_0203A4D0
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	cmp r0, #5
	bne _08027AC0
	adds r0, r4, #0
	bl MU_Create
	adds r0, r4, #0
	bl HideUnitSMS
	b _08027AFA
	.align 2, 0
_08027AB4: .4byte gUnknown_0202BCB0
_08027AB8: .4byte gBmMapUnit
_08027ABC: .4byte gUnknown_0203A4D0
_08027AC0:
	ldr r2, _08027B00  @ gUnknown_0202BCB0
	ldr r1, [r2, #0x18]
	ldr r0, [r2, #0x14]
	cmp r1, r0
	beq _08027AFA
	ldr r1, _08027B04  @ gUnknown_0203A4D0
	movs r0, #0
	str r0, [r1]
	movs r1, #0x1a
	ldrsh r0, [r2, r1]
	ldr r1, _08027B08  @ gBmMapUnit
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r3, #0x18
	ldrsh r1, [r2, r3]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	bl GetUnit
	adds r4, r0, #0
	cmp r4, #0
	beq _08027AFA
	bl MU_EndAll
	adds r0, r4, #0
	bl ShowUnitSMS
_08027AFA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08027B00: .4byte gUnknown_0202BCB0
_08027B04: .4byte gUnknown_0203A4D0
_08027B08: .4byte gBmMapUnit

	THUMB_FUNC_END sub_8027A4C

	THUMB_FUNC_START sub_8027B0C
sub_8027B0C: @ 0x08027B0C
	push {lr}
	ldr r2, _08027B54  @ gBmMapUnit
	ldr r2, [r2]
	lsls r1, r1, #2
	adds r1, r1, r2
	ldr r1, [r1]
	adds r1, r1, r0
	ldrb r0, [r1]
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq _08027B58
	ldr r0, [r2, #0xc]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	bne _08027B58
	movs r0, #0xb
	ldrsb r0, [r2, r0]
	movs r1, #0xc0
	ands r0, r1
	cmp r0, #0
	bne _08027B58
	adds r0, r2, #0
	adds r0, #0x30
	ldrb r0, [r0]
	movs r1, #0xf
	ands r1, r0
	cmp r1, #4
	beq _08027B58
	cmp r1, #2
	beq _08027B58
	movs r0, #1
	b _08027B5A
	.align 2, 0
_08027B54: .4byte gBmMapUnit
_08027B58:
	movs r0, #0
_08027B5A:
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8027B0C

	THUMB_FUNC_START sub_8027B60
sub_8027B60: @ 0x08027B60
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	mov r9, r0
	mov r8, r1
	adds r7, r2, #0
	adds r4, r3, #0
	adds r0, r4, #0
	bl GetUnitSMSId
	adds r5, r0, #0
	bl SMS_RegisterUsage
	adds r6, r0, #0
	mov r1, r8
	adds r1, #0x10
	movs r0, #0x80
	lsls r0, r0, #1
	cmp r1, r0
	bhi _08027C36
	adds r0, r7, #0
	adds r0, #0x20
	cmp r0, #0xc0
	bhi _08027C36
	ldr r1, _08027BB0  @ unit_icon_wait_table
	movs r0, #0x7f
	ands r0, r5
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r0, [r0, #2]
	cmp r0, #1
	beq _08027BE4
	cmp r0, #1
	bgt _08027BB4
	cmp r0, #0
	beq _08027BBA
	b _08027C36
	.align 2, 0
_08027BB0: .4byte unit_icon_wait_table
_08027BB4:
	cmp r0, #2
	beq _08027C10
	b _08027C36
_08027BBA:
	adds r0, r4, #0
	bl GetUnitSpritePaletteIndexWrapper
	movs r1, #0xf
	ands r1, r0
	lsls r1, r1, #0xc
	movs r2, #0x88
	lsls r2, r2, #4
	adds r0, r6, r2
	adds r1, r1, r0
	ldr r3, _08027BE0  @ gObject_16x16
	str r1, [sp]
	mov r0, r9
	mov r1, r8
	adds r2, r7, #0
	bl PutSprite
	b _08027C36
	.align 2, 0
_08027BE0: .4byte gObject_16x16
_08027BE4:
	adds r0, r4, #0
	bl GetUnitSpritePaletteIndexWrapper
	movs r1, #0xf
	ands r1, r0
	lsls r1, r1, #0xc
	movs r2, #0x88
	lsls r2, r2, #4
	adds r0, r6, r2
	adds r1, r1, r0
	adds r2, r7, #0
	subs r2, #0x10
	ldr r3, _08027C0C  @ gObject_16x32
	str r1, [sp]
	mov r0, r9
	mov r1, r8
	bl PutSprite
	b _08027C36
	.align 2, 0
_08027C0C: .4byte gObject_16x32
_08027C10:
	adds r0, r4, #0
	bl GetUnitSpritePaletteIndexWrapper
	movs r4, #0xf
	ands r4, r0
	lsls r4, r4, #0xc
	movs r1, #0x88
	lsls r1, r1, #4
	adds r0, r6, r1
	adds r4, r4, r0
	mov r1, r8
	subs r1, #8
	adds r2, r7, #0
	subs r2, #0x10
	ldr r3, _08027C44  @ gObject_32x32
	str r4, [sp]
	mov r0, r9
	bl PutSprite
_08027C36:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08027C44: .4byte gObject_32x32

	THUMB_FUNC_END sub_8027B60

	THUMB_FUNC_START sub_8027C48
sub_8027C48: @ 0x08027C48
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	mov r9, r0
	adds r6, r1, #0
	adds r5, r2, #0
	ldr r0, [sp, #0x20]
	lsls r3, r3, #0x10
	lsrs r7, r3, #0x10
	bl GetClassSMSId
	mov r8, r0
	bl SMS_RegisterUsage
	adds r4, r0, #0
	adds r4, #0x80
	adds r1, r6, #0
	adds r1, #0x10
	movs r0, #0x80
	lsls r0, r0, #1
	cmp r1, r0
	bhi _08027CE8
	adds r0, r5, #0
	adds r0, #0x20
	cmp r0, #0xc0
	bhi _08027CE8
	ldr r1, _08027C9C  @ unit_icon_wait_table
	movs r0, #0x7f
	mov r2, r8
	ands r0, r2
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r0, [r0, #2]
	cmp r0, #1
	beq _08027CBC
	cmp r0, #1
	bgt _08027CA0
	cmp r0, #0
	beq _08027CA6
	b _08027CE8
	.align 2, 0
_08027C9C: .4byte unit_icon_wait_table
_08027CA0:
	cmp r0, #2
	beq _08027CD4
	b _08027CE8
_08027CA6:
	ldr r3, _08027CB8  @ gObject_16x16
	adds r0, r7, r4
	str r0, [sp]
	mov r0, r9
	adds r1, r6, #0
	adds r2, r5, #0
	bl PutSprite
	b _08027CE8
	.align 2, 0
_08027CB8: .4byte gObject_16x16
_08027CBC:
	adds r2, r5, #0
	subs r2, #0x10
	ldr r3, _08027CD0  @ gObject_16x32
	adds r0, r7, r4
	str r0, [sp]
	mov r0, r9
	adds r1, r6, #0
	bl PutSprite
	b _08027CE8
	.align 2, 0
_08027CD0: .4byte gObject_16x32
_08027CD4:
	adds r1, r6, #0
	subs r1, #8
	adds r2, r5, #0
	subs r2, #0x10
	ldr r3, _08027CF8  @ gObject_32x32
	adds r0, r7, r4
	str r0, [sp]
	mov r0, r9
	bl PutSprite
_08027CE8:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08027CF8: .4byte gObject_32x32

	THUMB_FUNC_END sub_8027C48

	THUMB_FUNC_START sub_8027CFC
sub_8027CFC: @ 0x08027CFC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	mov r8, r0
	adds r5, r1, #0
	adds r4, r2, #0
	adds r0, r3, #0
	bl GetClassSMSId
	adds r6, r0, #0
	bl SMS_RegisterUsage
	adds r7, r0, #0
	adds r7, #0x80
	adds r1, r5, #0
	adds r1, #0x10
	movs r0, #0x80
	lsls r0, r0, #1
	cmp r1, r0
	bhi _08027DA0
	adds r0, r4, #0
	adds r0, #0x20
	cmp r0, #0xc0
	bhi _08027DA0
	ldr r1, _08027D48  @ unit_icon_wait_table
	movs r0, #0x7f
	ands r0, r6
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r0, [r0, #2]
	cmp r0, #1
	beq _08027D60
	cmp r0, #1
	bgt _08027D4C
	cmp r0, #0
	beq _08027D52
	b _08027DA0
	.align 2, 0
_08027D48: .4byte unit_icon_wait_table
_08027D4C:
	cmp r0, #2
	beq _08027D80
	b _08027DA0
_08027D52:
	movs r0, #0x80
	lsls r0, r0, #4
	adds r2, r4, r0
	ldr r3, _08027D5C  @ gObject_16x16
	b _08027D70
	.align 2, 0
_08027D5C: .4byte gObject_16x16
_08027D60:
	adds r2, r4, #0
	subs r2, #0x10
	movs r0, #0xff
	ands r2, r0
	movs r0, #0x80
	lsls r0, r0, #4
	adds r2, r2, r0
	ldr r3, _08027D7C  @ gObject_16x32
_08027D70:
	str r7, [sp]
	mov r0, r8
	adds r1, r5, #0
	bl PutSpriteExt
	b _08027DA0
	.align 2, 0
_08027D7C: .4byte gObject_16x32
_08027D80:
	adds r1, r5, #0
	subs r1, #8
	ldr r0, _08027DAC  @ 0x000001FF
	ands r1, r0
	adds r2, r4, #0
	subs r2, #0x10
	movs r0, #0xff
	ands r2, r0
	movs r0, #0x80
	lsls r0, r0, #4
	adds r2, r2, r0
	ldr r3, _08027DB0  @ gObject_32x32
	str r7, [sp]
	mov r0, r8
	bl PutSpriteExt
_08027DA0:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08027DAC: .4byte 0x000001FF
_08027DB0: .4byte gObject_32x32

	THUMB_FUNC_END sub_8027CFC

	THUMB_FUNC_START sub_8027DB4
sub_8027DB4: @ 0x08027DB4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	mov r8, r0
	adds r6, r1, #0
	adds r5, r2, #0
	ldr r0, [sp, #0x1c]
	ldr r4, [sp, #0x20]
	lsls r3, r3, #0x10
	lsrs r7, r3, #0x10
	bl GetClassSMSId
	adds r2, r0, #0
	ldr r0, _08027E08  @ gUnknown_0859B66C
	lsls r4, r4, #2
	adds r4, r4, r0
	ldr r0, [r4]
	adds r4, r0, #1
	adds r1, r6, #0
	adds r1, #0x10
	movs r0, #0x80
	lsls r0, r0, #1
	cmp r1, r0
	bhi _08027E3C
	adds r0, r5, #0
	adds r0, #0x20
	cmp r0, #0xc0
	bhi _08027E3C
	ldr r1, _08027E0C  @ unit_icon_wait_table
	movs r0, #0x7f
	ands r0, r2
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r0, [r0, #2]
	cmp r0, #0
	blt _08027E3C
	cmp r0, #1
	ble _08027E10
	cmp r0, #2
	beq _08027E28
	b _08027E3C
	.align 2, 0
_08027E08: .4byte gUnknown_0859B66C
_08027E0C: .4byte unit_icon_wait_table
_08027E10:
	adds r2, r5, #0
	subs r2, #0x10
	ldr r3, _08027E24  @ gObject_16x32
	adds r0, r7, r4
	str r0, [sp]
	mov r0, r8
	adds r1, r6, #0
	bl PutSprite
	b _08027E3C
	.align 2, 0
_08027E24: .4byte gObject_16x32
_08027E28:
	adds r1, r6, #0
	subs r1, #8
	adds r2, r5, #0
	subs r2, #0x10
	ldr r3, _08027E48  @ gObject_32x32
	adds r0, r7, r4
	str r0, [sp]
	mov r0, r8
	bl PutSprite
_08027E3C:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08027E48: .4byte gObject_32x32

	THUMB_FUNC_END sub_8027DB4

	THUMB_FUNC_START sub_8027E4C
sub_8027E4C: @ 0x08027E4C
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	mov r9, r0
	mov r8, r1
	adds r6, r2, #0
	adds r7, r3, #0
	ldr r0, [sp, #0x20]
	bl GetUnitSMSId
	adds r4, r0, #0
	bl SMS_RegisterUsage
	adds r5, r0, #0
	adds r5, #0x80
	mov r1, r8
	adds r1, #0x10
	movs r0, #0x80
	lsls r0, r0, #1
	cmp r1, r0
	bhi _08027F16
	adds r0, r6, #0
	adds r0, #0x20
	cmp r0, #0xc0
	bhi _08027F16
	ldr r1, _08027E9C  @ unit_icon_wait_table
	movs r0, #0x7f
	ands r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r0, [r0, #2]
	cmp r0, #1
	beq _08027ECC
	cmp r0, #1
	bgt _08027EA0
	cmp r0, #0
	beq _08027EA6
	b _08027F16
	.align 2, 0
_08027E9C: .4byte unit_icon_wait_table
_08027EA0:
	cmp r0, #2
	beq _08027EF4
	b _08027F16
_08027EA6:
	ldr r0, [sp, #0x20]
	bl GetUnitMapSpritePaletteIndex
	movs r1, #0xf
	ands r1, r0
	lsls r1, r1, #0xc
	adds r1, r7, r1
	adds r1, r1, r5
	ldr r3, _08027EC8  @ gObject_16x16
	str r1, [sp]
	mov r0, r9
	mov r1, r8
	adds r2, r6, #0
	bl PutSprite
	b _08027F16
	.align 2, 0
_08027EC8: .4byte gObject_16x16
_08027ECC:
	ldr r0, [sp, #0x20]
	bl GetUnitMapSpritePaletteIndex
	movs r1, #0xf
	ands r1, r0
	lsls r1, r1, #0xc
	adds r1, r7, r1
	adds r1, r1, r5
	adds r2, r6, #0
	subs r2, #0x10
	ldr r3, _08027EF0  @ gObject_16x32
	str r1, [sp]
	mov r0, r9
	mov r1, r8
	bl PutSprite
	b _08027F16
	.align 2, 0
_08027EF0: .4byte gObject_16x32
_08027EF4:
	ldr r0, [sp, #0x20]
	bl GetUnitMapSpritePaletteIndex
	movs r4, #0xf
	ands r4, r0
	lsls r4, r4, #0xc
	adds r4, r7, r4
	adds r4, r4, r5
	mov r1, r8
	subs r1, #8
	adds r2, r6, #0
	subs r2, #0x10
	ldr r3, _08027F24  @ gObject_32x32
	str r4, [sp]
	mov r0, r9
	bl PutSprite
_08027F16:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08027F24: .4byte gObject_32x32

	THUMB_FUNC_END sub_8027E4C

	THUMB_FUNC_START SMS_DisplayOne
SMS_DisplayOne: @ 0x08027F28
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	mov ip, r0
	mov r8, r1
	adds r5, r2, #0
	adds r6, r3, #0
	ldr r0, [sp, #0x20]
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	adds r1, r5, #0
	adds r1, #0x10
	movs r0, #0x88
	lsls r0, r0, #1
	cmp r1, r0
	bhi _08027FFE
	adds r0, r6, #0
	adds r0, #0x20
	cmp r0, #0xe0
	bhi _08027FFE
	ldr r4, _08027F74  @ unit_icon_wait_table
	mov r0, ip
	bl GetClassSMSId
	movs r1, #0x7f
	ands r1, r0
	lsls r1, r1, #3
	adds r1, r1, r4
	ldrh r0, [r1, #2]
	cmp r0, #1
	beq _08027FA8
	cmp r0, #1
	bgt _08027F78
	cmp r0, #0
	beq _08027F7E
	b _08027FFE
	.align 2, 0
_08027F74: .4byte unit_icon_wait_table
_08027F78:
	cmp r0, #2
	beq _08027FD8
	b _08027FFE
_08027F7E:
	adds r1, r5, #0
	subs r1, #8
	ldr r0, _08027FA0  @ 0x000001FF
	ands r1, r0
	adds r2, r6, #0
	subs r2, #0x10
	movs r0, #0xff
	ands r2, r0
	cmp r7, #0
	beq _08027F98
	movs r0, #0x80
	lsls r0, r0, #3
	orrs r2, r0
_08027F98:
	ldr r3, _08027FA4  @ gObject_16x16
	ldr r0, [sp, #0x1c]
	adds r0, #0x40
	b _08027FC6
	.align 2, 0
_08027FA0: .4byte 0x000001FF
_08027FA4: .4byte gObject_16x16
_08027FA8:
	adds r1, r5, #0
	subs r1, #8
	ldr r0, _08027FD0  @ 0x000001FF
	ands r1, r0
	adds r2, r6, #0
	subs r2, #0x20
	movs r0, #0xff
	ands r2, r0
	cmp r7, #0
	beq _08027FC2
	movs r0, #0x80
	lsls r0, r0, #3
	orrs r2, r0
_08027FC2:
	ldr r3, _08027FD4  @ gObject_16x32
	ldr r0, [sp, #0x1c]
_08027FC6:
	str r0, [sp]
	mov r0, r8
	bl PutSpriteExt
	b _08027FFE
	.align 2, 0
_08027FD0: .4byte 0x000001FF
_08027FD4: .4byte gObject_16x32
_08027FD8:
	adds r1, r5, #0
	subs r1, #0x10
	ldr r0, _0802800C  @ 0x000001FF
	ands r1, r0
	adds r2, r6, #0
	subs r2, #0x20
	movs r0, #0xff
	ands r2, r0
	cmp r7, #0
	beq _08027FF2
	movs r0, #0x80
	lsls r0, r0, #3
	orrs r2, r0
_08027FF2:
	ldr r3, _08028010  @ gObject_32x32
	ldr r0, [sp, #0x1c]
	str r0, [sp]
	mov r0, r8
	bl PutSpriteExt
_08027FFE:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802800C: .4byte 0x000001FF
_08028010: .4byte gObject_32x32

	THUMB_FUNC_END SMS_DisplayOne

	THUMB_FUNC_START sub_8028014
sub_8028014: @ 0x08028014
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	mov r9, r0
	adds r7, r1, #0
	adds r6, r2, #0
	mov r8, r3
	ldr r0, [sp, #0x20]
	bl GetUnitSMSId
	adds r5, r0, #0
	bl SMS_RegisterUsage
	adds r4, r0, #0
	adds r4, #0x80
	adds r1, r7, #0
	adds r1, #0x10
	movs r0, #0x80
	lsls r0, r0, #1
	cmp r1, r0
	bhi _080280E8
	adds r0, r6, #0
	adds r0, #0x20
	cmp r0, #0xc0
	bhi _080280E8
	ldr r1, _08028064  @ unit_icon_wait_table
	movs r0, #0x7f
	ands r0, r5
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r0, [r0, #2]
	cmp r0, #1
	beq _08028098
	cmp r0, #1
	bgt _08028068
	cmp r0, #0
	beq _0802806E
	b _080280E8
	.align 2, 0
_08028064: .4byte unit_icon_wait_table
_08028068:
	cmp r0, #2
	beq _080280C4
	b _080280E8
_0802806E:
	ldr r3, _08028090  @ gUnknown_0859B976
	add r4, r8
	str r4, [sp]
	mov r0, r9
	adds r1, r7, #0
	adds r2, r6, #0
	bl PutSprite
	ldr r3, _08028094  @ gUnknown_0859B98E
	str r4, [sp]
	mov r0, r9
	adds r1, r7, #0
	adds r2, r6, #0
	bl PutSprite
	b _080280E8
	.align 2, 0
_08028090: .4byte gUnknown_0859B976
_08028094: .4byte gUnknown_0859B98E
_08028098:
	adds r5, r6, #0
	subs r5, #0x10
	ldr r3, _080280BC  @ gUnknown_0859B97E
	add r4, r8
	str r4, [sp]
	mov r0, r9
	adds r1, r7, #0
	adds r2, r5, #0
	bl PutSprite
	ldr r3, _080280C0  @ gUnknown_0859B996
	str r4, [sp]
	mov r0, r9
	adds r1, r7, #0
	adds r2, r5, #0
	bl PutSprite
	b _080280E8
	.align 2, 0
_080280BC: .4byte gUnknown_0859B97E
_080280C0: .4byte gUnknown_0859B996
_080280C4:
	adds r5, r7, #0
	subs r5, #8
	subs r6, #0x10
	ldr r3, _080280F8  @ gUnknown_0859B986
	add r4, r8
	str r4, [sp]
	mov r0, r9
	adds r1, r5, #0
	adds r2, r6, #0
	bl PutSprite
	ldr r3, _080280FC  @ gUnknown_0859B99E
	str r4, [sp]
	mov r0, r9
	adds r1, r5, #0
	adds r2, r6, #0
	bl PutSprite
_080280E8:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080280F8: .4byte gUnknown_0859B986
_080280FC: .4byte gUnknown_0859B99E

	THUMB_FUNC_END sub_8028014

	THUMB_FUNC_START sub_8028100
sub_8028100: @ 0x08028100
	ldr r1, _08028108  @ gUnknown_0203A018
	movs r0, #0
	str r0, [r1]
	bx lr
	.align 2, 0
_08028108: .4byte gUnknown_0203A018

	THUMB_FUNC_END sub_8028100

	THUMB_FUNC_START HideUnitSMS
HideUnitSMS: @ 0x0802810C
	push {r4, lr}
	adds r4, r0, #0
	cmp r4, #0
	bne _08028118
	bl SMS_UpdateFromGameData
_08028118:
	ldr r2, [r4, #0x3c]
	cmp r2, #0
	beq _0802812A
	ldrb r1, [r2, #0xb]
	movs r3, #0x80
	negs r3, r3
	adds r0, r3, #0
	orrs r0, r1
	strb r0, [r2, #0xb]
_0802812A:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END HideUnitSMS

	THUMB_FUNC_START ShowUnitSMS
ShowUnitSMS: @ 0x08028130
	push {lr}
	ldr r2, [r0, #0x3c]
	cmp r2, #0
	beq _08028140
	ldrb r1, [r2, #0xb]
	movs r0, #0x7f
	ands r0, r1
	strb r0, [r2, #0xb]
_08028140:
	pop {r0}
	bx r0

	THUMB_FUNC_END ShowUnitSMS

	THUMB_FUNC_START GetUnitStandingSpriteDataFlagThing
GetUnitStandingSpriteDataFlagThing: @ 0x08028144
	push {lr}
	ldr r0, [r0, #0x3c]
	cmp r0, #0
	beq _0802815A
	ldrb r1, [r0, #0xb]
	movs r0, #0x80
	negs r0, r0
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	b _0802815C
_0802815A:
	movs r0, #0x80
_0802815C:
	pop {r1}
	bx r1

	THUMB_FUNC_END GetUnitStandingSpriteDataFlagThing

	THUMB_FUNC_START sub_8028160
sub_8028160: @ 0x08028160
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	mov r8, r0
	adds r5, r1, #0
	mov r9, r2
	ldr r0, _080281C4  @ gUnknown_0859B73C
	lsls r3, r3, #1
	adds r3, r3, r0
	ldrh r6, [r3]
	movs r3, #0
	cmp r3, r9
	bge _080281B8
	movs r0, #7
	ands r0, r6
	lsls r0, r0, #2
	movs r1, #0xf
	mov ip, r1
	mov r7, ip
	lsls r7, r0
	mov ip, r7
_0802818C:
	adds r4, r3, #1
	cmp r5, #0
	ble _080281B2
	mov r0, ip
	mvns r2, r0
	asrs r1, r6, #3
	lsls r1, r1, #2
	lsls r0, r3, #0xa
	adds r3, r5, #0
	adds r0, r0, r1
	mov r7, r8
	adds r1, r7, r0
_080281A4:
	ldr r0, [r1]
	ands r0, r2
	str r0, [r1]
	adds r1, #0x20
	subs r3, #1
	cmp r3, #0
	bne _080281A4
_080281B2:
	adds r3, r4, #0
	cmp r3, r9
	blt _0802818C
_080281B8:
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080281C4: .4byte gUnknown_0859B73C

	THUMB_FUNC_END sub_8028160

.align 2, 0
