	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	THUMB_FUNC_START WriteFadedPaletteFromArchive
WriteFadedPaletteFromArchive: @ 0x08013550
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r7, r0, #0
	mov r8, r1
	str r2, [sp]
	mov sl, r3
	bl SetSomethingInPaletteBB_2A
	mov r0, r8
	bl SetSomethingInPaletteBB_5A
	ldr r0, [sp]
	bl SetSomethingInPaletteBB_8A
	bl GetPaletteBufferBuffer
	mov r9, r0
	movs r0, #0x80
	lsls r0, r0, #1
	cmp r7, r0
	ble _080135D4
	ldr r0, _080135CC  @ 0xFFFFFF00
	adds r7, r7, r0
	movs r5, #0
	mov ip, r5
_0801358A:
	movs r0, #1
	lsls r0, r5
	mov r1, sl
	ands r0, r1
	cmp r0, #0
	beq _080135C0
	movs r4, #0
	movs r6, #0x1f
	mov r3, ip
	add r3, r9
	lsls r0, r5, #5
	ldr r1, _080135D0  @ gPaletteBuffer
	adds r2, r0, r1
_080135A4:
	ldrh r0, [r3]
	adds r1, r6, #0
	ands r1, r0
	subs r0, r6, r1
	muls r0, r7, r0
	asrs r0, r0, #8
	adds r1, r1, r0
	ands r1, r6
	strh r1, [r2]
	adds r3, #2
	adds r2, #2
	adds r4, #1
	cmp r4, #0xf
	ble _080135A4
_080135C0:
	movs r0, #0x30
	add ip, r0
	adds r5, #1
	cmp r5, #0x1f
	ble _0801358A
	b _08013614
	.align 2, 0
_080135CC: .4byte 0xFFFFFF00
_080135D0: .4byte gPaletteBuffer
_080135D4:
	movs r5, #0
	mov ip, r5
_080135D8:
	movs r0, #1
	lsls r0, r5
	mov r1, sl
	ands r0, r1
	cmp r0, #0
	beq _0801360A
	movs r4, #0
	movs r6, #0x1f
	mov r3, ip
	add r3, r9
	lsls r0, r5, #5
	ldr r1, _08013670  @ gPaletteBuffer
	adds r2, r0, r1
_080135F2:
	ldrh r1, [r3]
	adds r0, r6, #0
	ands r0, r1
	muls r0, r7, r0
	asrs r0, r0, #8
	ands r0, r6
	strh r0, [r2]
	adds r3, #2
	adds r2, #2
	adds r4, #1
	cmp r4, #0xf
	ble _080135F2
_0801360A:
	movs r0, #0x30
	add ip, r0
	adds r5, #1
	cmp r5, #0x1f
	ble _080135D8
_08013614:
	movs r0, #0x80
	lsls r0, r0, #1
	cmp r8, r0
	ble _08013678
	ldr r1, _08013674  @ 0xFFFFFF00
	add r8, r1
	movs r5, #0
	mov ip, r5
_08013624:
	movs r0, #1
	lsls r0, r5
	mov r7, sl
	ands r0, r7
	cmp r0, #0
	beq _08013664
	movs r4, #0
	movs r6, #0xf8
	lsls r6, r6, #2
	mov r3, ip
	add r3, r9
	lsls r0, r5, #5
	ldr r1, _08013670  @ gPaletteBuffer
	adds r2, r0, r1
_08013640:
	ldrh r1, [r3]
	adds r0, r6, #0
	ands r0, r1
	subs r1, r6, r0
	mov r7, r8
	muls r7, r1, r7
	adds r1, r7, #0
	asrs r1, r1, #8
	adds r0, r0, r1
	ands r0, r6
	ldrh r1, [r2]
	orrs r0, r1
	strh r0, [r2]
	adds r3, #2
	adds r2, #2
	adds r4, #1
	cmp r4, #0xf
	ble _08013640
_08013664:
	movs r0, #0x30
	add ip, r0
	adds r5, #1
	cmp r5, #0x1f
	ble _08013624
	b _080136C0
	.align 2, 0
_08013670: .4byte gPaletteBuffer
_08013674: .4byte 0xFFFFFF00
_08013678:
	movs r5, #0
	movs r7, #0
_0801367C:
	movs r0, #1
	lsls r0, r5
	mov r1, sl
	ands r0, r1
	cmp r0, #0
	beq _080136B8
	movs r4, #0
	movs r6, #0xf8
	lsls r6, r6, #2
	mov r0, r9
	adds r3, r7, r0
	lsls r0, r5, #5
	ldr r1, _08013720  @ gPaletteBuffer
	adds r2, r0, r1
_08013698:
	ldrh r1, [r3]
	adds r0, r6, #0
	ands r0, r1
	mov r1, r8
	muls r1, r0, r1
	adds r0, r1, #0
	asrs r0, r0, #8
	ands r0, r6
	ldrh r1, [r2]
	orrs r0, r1
	strh r0, [r2]
	adds r3, #2
	adds r2, #2
	adds r4, #1
	cmp r4, #0xf
	ble _08013698
_080136B8:
	adds r7, #0x30
	adds r5, #1
	cmp r5, #0x1f
	ble _0801367C
_080136C0:
	movs r0, #0x80
	lsls r0, r0, #1
	ldr r5, [sp]
	cmp r5, r0
	ble _08013728
	ldr r7, _08013724  @ 0xFFFFFF00
	adds r5, r5, r7
	str r5, [sp]
	movs r5, #0
_080136D2:
	movs r0, #1
	lsls r0, r5
	mov r1, sl
	ands r0, r1
	adds r7, r5, #1
	cmp r0, #0
	beq _08013718
	movs r4, #0
	lsls r0, r5, #1
	adds r0, r0, r5
	lsls r0, r0, #4
	movs r6, #0xf8
	lsls r6, r6, #7
	mov r1, r9
	adds r3, r0, r1
	lsls r0, r5, #5
	ldr r5, _08013720  @ gPaletteBuffer
	adds r2, r0, r5
_080136F6:
	ldrh r1, [r3]
	adds r0, r6, #0
	ands r0, r1
	subs r1, r6, r0
	ldr r5, [sp]
	muls r1, r5, r1
	asrs r1, r1, #8
	adds r0, r0, r1
	ands r0, r6
	ldrh r1, [r2]
	orrs r0, r1
	strh r0, [r2]
	adds r3, #2
	adds r2, #2
	adds r4, #1
	cmp r4, #0xf
	ble _080136F6
_08013718:
	adds r5, r7, #0
	cmp r5, #0x1f
	ble _080136D2
	b _08013772
	.align 2, 0
_08013720: .4byte gPaletteBuffer
_08013724: .4byte 0xFFFFFF00
_08013728:
	movs r5, #0
_0801372A:
	movs r0, #1
	lsls r0, r5
	mov r7, sl
	ands r0, r7
	adds r7, r5, #1
	cmp r0, #0
	beq _0801376C
	movs r4, #0
	lsls r0, r5, #1
	adds r0, r0, r5
	lsls r0, r0, #4
	movs r6, #0xf8
	lsls r6, r6, #7
	mov r1, r9
	adds r3, r0, r1
	lsls r0, r5, #5
	ldr r5, _08013788  @ gPaletteBuffer
	adds r2, r0, r5
_0801374E:
	ldrh r1, [r3]
	adds r0, r6, #0
	ands r0, r1
	ldr r1, [sp]
	muls r0, r1, r0
	asrs r0, r0, #8
	ands r0, r6
	ldrh r1, [r2]
	orrs r0, r1
	strh r0, [r2]
	adds r3, #2
	adds r2, #2
	adds r4, #1
	cmp r4, #0xf
	ble _0801374E
_0801376C:
	adds r5, r7, #0
	cmp r5, #0x1f
	ble _0801372A
_08013772:
	bl EnablePaletteSync
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08013788: .4byte gPaletteBuffer

	THUMB_FUNC_END WriteFadedPaletteFromArchive

	THUMB_FUNC_START sub_801378C
sub_801378C: @ 0x0801378C
	movs r1, #0
	str r1, [r0, #0x44]
	bx lr

	THUMB_FUNC_END sub_801378C

	THUMB_FUNC_START sub_8013794
sub_8013794: @ 0x08013794
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x44]
	ldr r0, [r4, #0x48]
	adds r2, r1, r0
	str r2, [r4, #0x44]
	movs r7, #0x80
	lsls r7, r7, #1
	subs r3, r7, r2
	ldr r0, [r4, #0x2c]
	adds r1, r0, #0
	muls r1, r3, r1
	ldr r0, [r4, #0x38]
	muls r0, r2, r0
	adds r0, r1, r0
	cmp r0, #0
	bge _080137B8
	adds r0, #0xff
_080137B8:
	asrs r6, r0, #8
	ldr r0, [r4, #0x30]
	adds r1, r0, #0
	muls r1, r3, r1
	ldr r0, [r4, #0x3c]
	muls r0, r2, r0
	adds r1, r1, r0
	cmp r1, #0
	bge _080137CC
	adds r1, #0xff
_080137CC:
	asrs r5, r1, #8
	ldr r0, [r4, #0x34]
	adds r1, r0, #0
	muls r1, r3, r1
	ldr r0, [r4, #0x40]
	muls r0, r2, r0
	adds r1, r1, r0
	cmp r1, #0
	bge _080137E0
	adds r1, #0xff
_080137E0:
	asrs r2, r1, #8
	ldr r3, [r4, #0x4c]
	adds r0, r6, #0
	adds r1, r5, #0
	bl WriteFadedPaletteFromArchive
	ldr r0, [r4, #0x44]
	cmp r0, r7
	bne _080137F8
	adds r0, r4, #0
	bl Proc_Break
_080137F8:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8013794

	THUMB_FUNC_START sub_8013800
sub_8013800: @ 0x08013800
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	adds r5, r0, #0
	adds r6, r1, #0
	mov r8, r2
	mov r9, r3
	ldr r7, [sp, #0x1c]
	ldr r4, [sp, #0x28]
	ldr r1, [sp, #0x2c]
	ldr r0, _08013840  @ gUnknown_08599FD4
	bl Proc_Start
	str r5, [r0, #0x2c]
	str r6, [r0, #0x30]
	mov r1, r8
	str r1, [r0, #0x34]
	mov r1, r9
	str r1, [r0, #0x38]
	str r7, [r0, #0x3c]
	ldr r1, [sp, #0x20]
	str r1, [r0, #0x40]
	str r4, [r0, #0x48]
	ldr r1, [sp, #0x24]
	str r1, [r0, #0x4c]
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08013840: .4byte gUnknown_08599FD4

	THUMB_FUNC_END sub_8013800

	THUMB_FUNC_START sub_8013844
sub_8013844: @ 0x08013844
	push {lr}
	ldr r0, _08013854  @ gUnknown_08599FD4
	bl Proc_Find
	cmp r0, #0
	bne _08013858
	movs r0, #0
	b _0801385A
	.align 2, 0
_08013854: .4byte gUnknown_08599FD4
_08013858:
	movs r0, #1
_0801385A:
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8013844

	THUMB_FUNC_START sub_8013860
sub_8013860: @ 0x08013860
	adds r2, r0, #0
	adds r2, #0x64
	movs r1, #0
	strh r1, [r2]
	adds r0, #0x66
	movs r1, #0x5a
	strh r1, [r0]
	bx lr

	THUMB_FUNC_END sub_8013860

	THUMB_FUNC_START sub_8013870
sub_8013870: @ 0x08013870
	push {r4, r5, lr}
	adds r3, r0, #0
	movs r4, #0
	ldr r5, _080138D4  @ gKeyStatusPtr
	ldr r0, [r5]
	ldrh r1, [r0, #8]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0801388E
	adds r1, r3, #0
	adds r1, #0x66
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
_0801388E:
	adds r1, r3, #0
	adds r1, #0x64
	ldrh r2, [r1]
	adds r0, r2, #1
	strh r0, [r1]
	movs r0, #0xf
	ands r0, r2
	cmp r0, #0
	bne _080138CE
	ldr r0, [r5]
	ldrh r1, [r0, #4]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _080138B6
	adds r0, r3, #0
	adds r0, #0x66
	movs r2, #0
	ldrsh r0, [r0, r2]
	negs r4, r0
_080138B6:
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _080138C6
	adds r0, r3, #0
	adds r0, #0x66
	movs r1, #0
	ldrsh r4, [r0, r1]
_080138C6:
	movs r0, #0x9a
	adds r1, r4, #0
	bl PlaySpacialSoundMaybe
_080138CE:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080138D4: .4byte gKeyStatusPtr

	THUMB_FUNC_END sub_8013870

	THUMB_FUNC_START sub_80138D8
sub_80138D8: @ 0x080138D8
	push {lr}
	ldr r0, _080138E8  @ gUnknown_08599FF4
	movs r1, #3
	bl Proc_Start
	pop {r0}
	bx r0
	.align 2, 0
_080138E8: .4byte gUnknown_08599FF4

	THUMB_FUNC_END sub_80138D8

	THUMB_FUNC_START sub_80138EC
sub_80138EC: @ 0x080138EC
	bx lr

	THUMB_FUNC_END sub_80138EC

	THUMB_FUNC_START sub_80138F0
sub_80138F0: @ 0x080138F0
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r3, r2, #0
	ldr r0, _08013908  @ gUnknown_0859A120
	adds r1, r4, #0
	adds r2, r5, #0
	bl sub_8013928
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08013908: .4byte gUnknown_0859A120

	THUMB_FUNC_END sub_80138F0

	THUMB_FUNC_START sub_801390C
sub_801390C: @ 0x0801390C
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r3, r2, #0
	ldr r0, _08013924  @ gUnknown_0859A140
	adds r1, r4, #0
	adds r2, r5, #0
	bl sub_8013928
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08013924: .4byte gUnknown_0859A140

	THUMB_FUNC_END sub_801390C

	THUMB_FUNC_START sub_8013928
sub_8013928: @ 0x08013928
	push {r4, r5, r6, lr}
	mov r6, r9
	mov r5, r8
	push {r5, r6}
	mov r9, r0
	adds r5, r1, #0
	adds r6, r2, #0
	adds r1, r3, #0
	lsls r4, r5, #1
	adds r4, r4, r5
	lsls r4, r4, #4
	ldr r0, _0801397C  @ gUnknown_0202B6B0
	adds r4, r4, r0
	ldr r0, _08013980  @ gUnknown_0859A00C
	bl Proc_Start
	mov r8, r0
	lsls r5, r5, #5
	ldr r0, _08013984  @ gPaletteBuffer
	adds r5, r5, r0
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #0x10
	bl CpuSet
	str r5, [r4, #0x24]
	mov r0, r9
	str r0, [r4, #0x20]
	movs r0, #0
	strh r0, [r4, #0x28]
	strh r6, [r4, #0x2a]
	adds r6, #1
	strh r6, [r4, #0x2c]
	mov r0, r8
	str r4, [r0, #0x2c]
	adds r0, r4, #0
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0801397C: .4byte gUnknown_0202B6B0
_08013980: .4byte gUnknown_0859A00C
_08013984: .4byte gPaletteBuffer

	THUMB_FUNC_END sub_8013928

	THUMB_FUNC_START sub_8013988
sub_8013988: @ 0x08013988
	push {lr}
	ldr r0, _08013994  @ gUnknown_0859A00C
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
_08013994: .4byte gUnknown_0859A00C

	THUMB_FUNC_END sub_8013988

	THUMB_FUNC_START sub_8013998
sub_8013998: @ 0x08013998
	strh r1, [r0, #0x2c]
	bx lr

	THUMB_FUNC_END sub_8013998

	THUMB_FUNC_START sub_801399C
sub_801399C: @ 0x0801399C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	adds r7, r0, #0
	ldr r0, [r7, #0x2c]
	mov sl, r0
	ldr r1, [r0, #0x20]
	str r1, [sp, #8]
	ldr r1, [r0, #0x24]
	ldrh r0, [r0, #0x28]
	mov r2, sl
	ldrh r2, [r2, #0x2c]
	cmp r0, r2
	beq _080139C6
	mov r3, sl
	ldrh r3, [r3, #0x2a]
	cmp r0, r3
	bls _080139CE
_080139C6:
	adds r0, r7, #0
	bl Proc_End
	b _08013A74
_080139CE:
	movs r0, #0
	str r0, [sp, #4]
	str r1, [sp, #0xc]
_080139D4:
	ldr r1, [sp, #4]
	lsls r2, r1, #1
	mov r3, sl
	adds r0, r2, r3
	ldrh r0, [r0]
	movs r1, #0x1f
	ands r1, r0
	movs r6, #0xf8
	lsls r6, r6, #2
	ands r6, r0
	movs r3, #0xf8
	lsls r3, r3, #7
	mov r9, r3
	ands r3, r0
	mov r9, r3
	ldr r0, [sp, #8]
	adds r2, r2, r0
	ldrh r0, [r2]
	movs r2, #0x1f
	ands r2, r0
	movs r4, #0xf8
	lsls r4, r4, #2
	ands r4, r0
	movs r3, #0xf8
	lsls r3, r3, #7
	mov r8, r3
	ands r3, r0
	mov r8, r3
	ldr r0, [r7, #0x2c]
	ldrh r3, [r0, #0x28]
	ldrh r0, [r0, #0x2a]
	str r0, [sp]
	movs r0, #0
	bl Interpolate
	adds r5, r0, #0
	ldr r0, [r7, #0x2c]
	ldrh r3, [r0, #0x28]
	ldrh r0, [r0, #0x2a]
	str r0, [sp]
	movs r0, #0
	adds r1, r6, #0
	adds r2, r4, #0
	bl Interpolate
	adds r4, r0, #0
	ldr r0, [r7, #0x2c]
	ldrh r3, [r0, #0x28]
	ldrh r0, [r0, #0x2a]
	str r0, [sp]
	movs r0, #0
	mov r1, r9
	mov r2, r8
	bl Interpolate
	movs r1, #0xf8
	lsls r1, r1, #7
	ands r0, r1
	movs r2, #0xf8
	lsls r2, r2, #2
	ands r4, r2
	orrs r0, r4
	movs r3, #0x1f
	ands r5, r3
	orrs r0, r5
	ldr r1, [sp, #0xc]
	strh r0, [r1]
	adds r1, #2
	str r1, [sp, #0xc]
	ldr r2, [sp, #4]
	adds r2, #1
	str r2, [sp, #4]
	cmp r2, #0xf
	ble _080139D4
	bl EnablePaletteSync
	ldr r1, [r7, #0x2c]
	ldrh r0, [r1, #0x28]
	adds r0, #1
	strh r0, [r1, #0x28]
_08013A74:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_801399C

	THUMB_FUNC_START sub_8013A84
sub_8013A84: @ 0x08013A84
	push {lr}
	adds r1, r0, #0
	ldr r0, _08013A9C  @ gUnknown_0859A120
	lsls r1, r1, #5
	ldr r2, _08013AA0  @ gPaletteBuffer
	adds r1, r1, r2
	movs r2, #0x10
	bl CpuSet
	pop {r0}
	bx r0
	.align 2, 0
_08013A9C: .4byte gUnknown_0859A120
_08013AA0: .4byte gPaletteBuffer

	THUMB_FUNC_END sub_8013A84

	THUMB_FUNC_START sub_8013AA4
sub_8013AA4: @ 0x08013AA4
	push {lr}
	adds r1, r0, #0
	ldr r0, _08013ABC  @ gUnknown_0859A140
	lsls r1, r1, #5
	ldr r2, _08013AC0  @ gPaletteBuffer
	adds r1, r1, r2
	movs r2, #0x10
	bl CpuSet
	pop {r0}
	bx r0
	.align 2, 0
_08013ABC: .4byte gUnknown_0859A140
_08013AC0: .4byte gPaletteBuffer

	THUMB_FUNC_END sub_8013AA4

	THUMB_FUNC_START sub_8013AC4
sub_8013AC4: @ 0x08013AC4
	push {r4, lr}
	movs r4, #0
_08013AC8:
	adds r0, r4, #0
	bl sub_8013A84
	adds r4, #1
	cmp r4, #0x1f
	ble _08013AC8
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8013AC4

	THUMB_FUNC_START sub_8013ADC
sub_8013ADC: @ 0x08013ADC
	push {r4, lr}
	movs r4, #0
_08013AE0:
	adds r0, r4, #0
	bl sub_8013A84
	adds r4, #1
	cmp r4, #0x1f
	ble _08013AE0
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8013ADC

	THUMB_FUNC_START sub_8013AF4
sub_8013AF4: @ 0x08013AF4
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r3, _08013B58  @ gLCDControlBuffer
	adds r1, r3, #0
	adds r1, #0x34
	ldrb r0, [r1]
	movs r2, #0x20
	orrs r0, r2
	strb r0, [r1]
	adds r1, #1
	ldrb r0, [r1]
	orrs r0, r2
	strb r0, [r1]
	adds r1, #2
	ldrb r0, [r1]
	orrs r0, r2
	strb r0, [r1]
	subs r1, #1
	ldrb r0, [r1]
	orrs r0, r2
	strb r0, [r1]
	movs r0, #3
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	movs r0, #1
	str r0, [sp]
	movs r1, #1
	movs r2, #1
	movs r3, #1
	bl SetBlendTargetA
	movs r0, #1
	bl sub_8001F48
	adds r1, r4, #0
	adds r1, #0x64
	movs r2, #0
	movs r0, #0x10
	strh r0, [r1]
	adds r4, #0x66
	strh r2, [r4]
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08013B58: .4byte gLCDControlBuffer

	THUMB_FUNC_END sub_8013AF4

	THUMB_FUNC_START sub_8013B5C
sub_8013B5C: @ 0x08013B5C
	push {lr}
	adds r2, r0, #0
	ldr r0, _08013B74  @ gLCDControlBuffer
	adds r3, r0, #0
	adds r3, #0x46
	ldrb r0, [r3]
	cmp r0, #0x10
	bne _08013B78
	adds r0, r2, #0
	bl Proc_End
	b _08013B9C
	.align 2, 0
_08013B74: .4byte gLCDControlBuffer
_08013B78:
	adds r1, r2, #0
	adds r1, #0x66
	adds r0, r2, #0
	adds r0, #0x64
	ldrh r0, [r0]
	ldrh r2, [r1]
	adds r0, r0, r2
	strh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xff
	ble _08013B96
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r1]
_08013B96:
	ldrh r0, [r1]
	lsrs r0, r0, #4
	strb r0, [r3]
_08013B9C:
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8013B5C

	THUMB_FUNC_START sub_8013BA0
sub_8013BA0: @ 0x08013BA0
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r3, _08013C14  @ gLCDControlBuffer
	adds r1, r3, #0
	adds r1, #0x34
	ldrb r0, [r1]
	movs r2, #0x20
	orrs r0, r2
	strb r0, [r1]
	adds r1, #1
	ldrb r0, [r1]
	orrs r0, r2
	strb r0, [r1]
	adds r1, #2
	ldrb r0, [r1]
	orrs r0, r2
	strb r0, [r1]
	subs r1, #1
	ldrb r0, [r1]
	orrs r0, r2
	strb r0, [r1]
	movs r0, #3
	movs r1, #0
	movs r2, #0
	movs r3, #0x10
	bl SetSpecialColorEffectsParameters
	movs r4, #1
	str r4, [sp]
	movs r0, #1
	movs r1, #1
	movs r2, #1
	movs r3, #1
	bl SetBlendTargetA
	str r4, [sp]
	movs r0, #1
	movs r1, #1
	movs r2, #1
	movs r3, #1
	bl SetBlendTargetB
	movs r0, #1
	bl sub_8001F48
	adds r1, r5, #0
	adds r1, #0x64
	movs r0, #0x10
	strh r0, [r1]
	adds r5, #0x66
	adds r0, #0xf0
	strh r0, [r5]
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08013C14: .4byte gLCDControlBuffer

	THUMB_FUNC_END sub_8013BA0

	THUMB_FUNC_START sub_8013C18
sub_8013C18: @ 0x08013C18
	push {lr}
	adds r1, r0, #0
	ldr r0, _08013C30  @ gLCDControlBuffer
	adds r3, r0, #0
	adds r3, #0x46
	ldrb r0, [r3]
	cmp r0, #0
	bne _08013C34
	adds r0, r1, #0
	bl Proc_End
	b _08013C54
	.align 2, 0
_08013C30: .4byte gLCDControlBuffer
_08013C34:
	adds r2, r1, #0
	adds r2, #0x66
	adds r0, r1, #0
	adds r0, #0x64
	ldrh r1, [r2]
	ldrh r0, [r0]
	subs r1, r1, r0
	strh r1, [r2]
	lsls r1, r1, #0x10
	cmp r1, #0
	bgt _08013C4E
	movs r0, #0
	strh r0, [r2]
_08013C4E:
	ldrh r0, [r2]
	lsrs r0, r0, #4
	strb r0, [r3]
_08013C54:
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8013C18

	THUMB_FUNC_START sub_8013C58
sub_8013C58: @ 0x08013C58
	push {lr}
	bl sub_8013AF4
	movs r0, #2
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8013C58

	THUMB_FUNC_START sub_8013C70
sub_8013C70: @ 0x08013C70
	push {lr}
	bl sub_8013BA0
	movs r0, #2
	movs r1, #0
	movs r2, #0
	movs r3, #0x10
	bl SetSpecialColorEffectsParameters
	pop {r0}
	bx r0

	@ possible file boundry

	THUMB_FUNC_END sub_8013C70

	THUMB_FUNC_START sub_8013C88
sub_8013C88: @ 0x08013C88
	push {lr}
	ldr r0, _08013CB8  @ gUnknown_0859A044
	bl Proc_Find
	cmp r0, #0
	bne _08013CC8
	ldr r0, _08013CBC  @ gUnknown_0859A024
	bl Proc_Find
	cmp r0, #0
	bne _08013CC8
	ldr r0, _08013CC0  @ gUnknown_0859A084
	bl Proc_Find
	cmp r0, #0
	bne _08013CC8
	ldr r0, _08013CC4  @ gUnknown_0859A064
	bl Proc_Find
	cmp r0, #0
	bne _08013CC8
	movs r0, #0
	b _08013CCA
	.align 2, 0
_08013CB8: .4byte gUnknown_0859A044
_08013CBC: .4byte gUnknown_0859A024
_08013CC0: .4byte gUnknown_0859A084
_08013CC4: .4byte gUnknown_0859A064
_08013CC8:
	movs r0, #1
_08013CCA:
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8013C88

	THUMB_FUNC_START sub_8013CD0
sub_8013CD0: @ 0x08013CD0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08013CE8  @ gUnknown_0859A024
	movs r1, #3
	bl Proc_Start
	adds r0, #0x64
	strh r4, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08013CE8: .4byte gUnknown_0859A024

	THUMB_FUNC_END sub_8013CD0

	THUMB_FUNC_START sub_8013CEC
sub_8013CEC: @ 0x08013CEC
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08013D04  @ gUnknown_0859A044
	movs r1, #3
	bl Proc_Start
	adds r0, #0x64
	strh r4, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08013D04: .4byte gUnknown_0859A044

	THUMB_FUNC_END sub_8013CEC

	THUMB_FUNC_START sub_8013D08
sub_8013D08: @ 0x08013D08
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08013D1C  @ gUnknown_0859A024
	bl Proc_StartBlocking
	adds r0, #0x64
	strh r4, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08013D1C: .4byte gUnknown_0859A024

	THUMB_FUNC_END sub_8013D08

	THUMB_FUNC_START sub_8013D20
sub_8013D20: @ 0x08013D20
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08013D34  @ gUnknown_0859A044
	bl Proc_StartBlocking
	adds r0, #0x64
	strh r4, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08013D34: .4byte gUnknown_0859A044

	THUMB_FUNC_END sub_8013D20

	THUMB_FUNC_START sub_8013D38
sub_8013D38: @ 0x08013D38
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08013D4C  @ gUnknown_0859A064
	bl Proc_StartBlocking
	adds r0, #0x64
	strh r4, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08013D4C: .4byte gUnknown_0859A064

	THUMB_FUNC_END sub_8013D38

	THUMB_FUNC_START sub_8013D50
sub_8013D50: @ 0x08013D50
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08013D64  @ gUnknown_0859A084
	bl Proc_StartBlocking
	adds r0, #0x64
	strh r4, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08013D64: .4byte gUnknown_0859A084

	THUMB_FUNC_END sub_8013D50

	THUMB_FUNC_START StartFadeInBlackMedium
StartFadeInBlackMedium: @ 0x08013D68
	push {lr}
	movs r0, #0x10
	bl sub_8013CD0
	pop {r0}
	bx r0

	THUMB_FUNC_END StartFadeInBlackMedium

	THUMB_FUNC_START sub_8013D74
sub_8013D74: @ 0x08013D74
	push {lr}
	movs r0, #4
	bl sub_8013CD0
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8013D74

	THUMB_FUNC_START sub_8013D80
sub_8013D80: @ 0x08013D80
	push {lr}
	movs r0, #0x40
	bl sub_8013CD0
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8013D80

	THUMB_FUNC_START sub_8013D8C
sub_8013D8C: @ 0x08013D8C
	push {lr}
	movs r0, #0x10
	bl sub_8013CEC
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8013D8C

	THUMB_FUNC_START sub_8013D98
sub_8013D98: @ 0x08013D98
	push {lr}
	movs r0, #4
	bl sub_8013CEC
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8013D98

	THUMB_FUNC_START sub_8013DA4
sub_8013DA4: @ 0x08013DA4
	push {lr}
	movs r0, #0x40
	bl sub_8013CEC
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8013DA4

	THUMB_FUNC_START sub_8013DB0
sub_8013DB0: @ 0x08013DB0
	push {lr}
	adds r1, r0, #0
	movs r0, #0x10
	bl sub_8013D08
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8013DB0

	THUMB_FUNC_START sub_8013DC0
sub_8013DC0: @ 0x08013DC0
	push {lr}
	adds r1, r0, #0
	movs r0, #4
	bl sub_8013D08
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8013DC0

	THUMB_FUNC_START sub_8013DD0
sub_8013DD0: @ 0x08013DD0
	push {lr}
	adds r1, r0, #0
	movs r0, #0x40
	bl sub_8013D08
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8013DD0

	THUMB_FUNC_START sub_8013DE0
sub_8013DE0: @ 0x08013DE0
	push {lr}
	adds r1, r0, #0
	movs r0, #0x10
	bl sub_8013D20
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8013DE0

	THUMB_FUNC_START sub_8013DF0
sub_8013DF0: @ 0x08013DF0
	push {lr}
	adds r1, r0, #0
	movs r0, #4
	bl sub_8013D20
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8013DF0

	THUMB_FUNC_START sub_8013E00
sub_8013E00: @ 0x08013E00
	push {lr}
	adds r1, r0, #0
	movs r0, #0x40
	bl sub_8013D20
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8013E00

	THUMB_FUNC_START sub_8013E10
sub_8013E10: @ 0x08013E10
	push {lr}
	adds r1, r0, #0
	movs r0, #4
	bl sub_8013D38
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8013E10

	THUMB_FUNC_START sub_8013E20
sub_8013E20: @ 0x08013E20
	push {lr}
	adds r1, r0, #0
	movs r0, #4
	bl sub_8013D50
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8013E20

	THUMB_FUNC_START sub_8013E30
sub_8013E30: @ 0x08013E30
	push {lr}
	adds r2, r0, #0
	ldr r3, _08013E44  @ sub_80141B0
	movs r0, #1
	movs r1, #4
	bl sub_8014098
	pop {r0}
	bx r0
	.align 2, 0
_08013E44: .4byte sub_80141B0

	THUMB_FUNC_END sub_8013E30

	THUMB_FUNC_START sub_8013E48
sub_8013E48: @ 0x08013E48
	push {lr}
	adds r2, r0, #0
	ldr r3, _08013E5C  @ sub_80141B0
	movs r0, #1
	movs r1, #8
	bl sub_8014098
	pop {r0}
	bx r0
	.align 2, 0
_08013E5C: .4byte sub_80141B0

	THUMB_FUNC_END sub_8013E48

	THUMB_FUNC_START sub_8013E60
sub_8013E60: @ 0x08013E60
	push {lr}
	adds r2, r0, #0
	ldr r3, _08013E74  @ sub_80141B0
	movs r0, #1
	movs r1, #0x10
	bl sub_8014098
	pop {r0}
	bx r0
	.align 2, 0
_08013E74: .4byte sub_80141B0

	THUMB_FUNC_END sub_8013E60

	THUMB_FUNC_START sub_8013E78
sub_8013E78: @ 0x08013E78
	push {lr}
	adds r2, r0, #0
	ldr r3, _08013E8C  @ sub_80141B0
	movs r0, #1
	movs r1, #0x20
	bl sub_8014098
	pop {r0}
	bx r0
	.align 2, 0
_08013E8C: .4byte sub_80141B0

	THUMB_FUNC_END sub_8013E78

	THUMB_FUNC_START sub_8013E90
sub_8013E90: @ 0x08013E90
	push {lr}
	adds r2, r0, #0
	ldr r3, _08013EA4  @ sub_80141B0
	movs r0, #1
	movs r1, #0x40
	bl sub_8014098
	pop {r0}
	bx r0
	.align 2, 0
_08013EA4: .4byte sub_80141B0

	THUMB_FUNC_END sub_8013E90

	THUMB_FUNC_START sub_8013EA8
sub_8013EA8: @ 0x08013EA8
	push {lr}
	adds r2, r0, #0
	movs r0, #0
	movs r1, #8
	movs r3, #0
	bl sub_8014098
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8013EA8

	THUMB_FUNC_START sub_8013EBC
sub_8013EBC: @ 0x08013EBC
	push {lr}
	adds r2, r0, #0
	movs r0, #0
	movs r1, #0x10
	movs r3, #0
	bl sub_8014098
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8013EBC

	THUMB_FUNC_START sub_8013ED0
sub_8013ED0: @ 0x08013ED0
	push {lr}
	adds r2, r0, #0
	movs r0, #0
	movs r1, #0x20
	movs r3, #0
	bl sub_8014098
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8013ED0

	THUMB_FUNC_START sub_8013EE4
sub_8013EE4: @ 0x08013EE4
	push {lr}
	adds r2, r0, #0
	movs r0, #0
	movs r1, #0x40
	movs r3, #0
	bl sub_8014098
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8013EE4

	THUMB_FUNC_START sub_8013EF8
sub_8013EF8: @ 0x08013EF8
	push {lr}
	adds r2, r0, #0
	ldr r3, _08013F0C  @ sub_80141B0
	movs r0, #3
	movs r1, #4
	bl sub_8014098
	pop {r0}
	bx r0
	.align 2, 0
_08013F0C: .4byte sub_80141B0

	THUMB_FUNC_END sub_8013EF8

	THUMB_FUNC_START sub_8013F10
sub_8013F10: @ 0x08013F10
	push {lr}
	adds r2, r0, #0
	ldr r3, _08013F24  @ sub_80141B0
	movs r0, #3
	movs r1, #8
	bl sub_8014098
	pop {r0}
	bx r0
	.align 2, 0
_08013F24: .4byte sub_80141B0

	THUMB_FUNC_END sub_8013F10

	THUMB_FUNC_START sub_8013F28
sub_8013F28: @ 0x08013F28
	push {lr}
	adds r2, r0, #0
	ldr r3, _08013F3C  @ sub_80141B0
	movs r0, #3
	movs r1, #0x10
	bl sub_8014098
	pop {r0}
	bx r0
	.align 2, 0
_08013F3C: .4byte sub_80141B0

	THUMB_FUNC_END sub_8013F28

	THUMB_FUNC_START sub_8013F40
sub_8013F40: @ 0x08013F40
	push {lr}
	adds r2, r0, #0
	ldr r3, _08013F54  @ sub_80141B0
	movs r0, #3
	movs r1, #0x20
	bl sub_8014098
	pop {r0}
	bx r0
	.align 2, 0
_08013F54: .4byte sub_80141B0

	THUMB_FUNC_END sub_8013F40

	THUMB_FUNC_START sub_8013F58
sub_8013F58: @ 0x08013F58
	push {lr}
	adds r2, r0, #0
	ldr r3, _08013F6C  @ sub_80141B0
	movs r0, #3
	movs r1, #0x40
	bl sub_8014098
	pop {r0}
	bx r0
	.align 2, 0
_08013F6C: .4byte sub_80141B0

	THUMB_FUNC_END sub_8013F58

	THUMB_FUNC_START sub_8013F70
sub_8013F70: @ 0x08013F70
	push {lr}
	adds r2, r0, #0
	movs r0, #2
	movs r1, #4
	movs r3, #0
	bl sub_8014098
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8013F70

	THUMB_FUNC_START sub_8013F84
sub_8013F84: @ 0x08013F84
	push {lr}
	adds r2, r0, #0
	movs r0, #2
	movs r1, #8
	movs r3, #0
	bl sub_8014098
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8013F84

	THUMB_FUNC_START sub_8013F98
sub_8013F98: @ 0x08013F98
	push {lr}
	adds r2, r0, #0
	movs r0, #2
	movs r1, #8
	movs r3, #0
	bl sub_8014098
	bl sub_8014170
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8013F98

	THUMB_FUNC_START sub_8013FB0
sub_8013FB0: @ 0x08013FB0
	push {lr}
	adds r2, r0, #0
	movs r0, #2
	movs r1, #0x10
	movs r3, #0
	bl sub_8014098
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8013FB0

	THUMB_FUNC_START sub_8013FC4
sub_8013FC4: @ 0x08013FC4
	push {lr}
	adds r2, r0, #0
	movs r0, #2
	movs r1, #0x20
	movs r3, #0
	bl sub_8014098
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8013FC4

	THUMB_FUNC_START sub_8013FD8
sub_8013FD8: @ 0x08013FD8
	push {lr}
	adds r2, r0, #0
	movs r0, #2
	movs r1, #0x40
	movs r3, #0
	bl sub_8014098
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8013FD8

	THUMB_FUNC_START sub_8013FEC
sub_8013FEC: @ 0x08013FEC
	push {lr}
	adds r2, r0, #0
	movs r0, #6
	movs r1, #0x10
	movs r3, #0
	bl sub_8014098
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8013FEC

	THUMB_FUNC_START sub_8014000
sub_8014000: @ 0x08014000
	push {lr}
	adds r2, r0, #0
	movs r0, #7
	movs r1, #0x10
	movs r3, #0
	bl sub_8014098
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8014000

	THUMB_FUNC_START sub_8014014
sub_8014014: @ 0x08014014
	push {lr}
	adds r2, r0, #0
	movs r0, #6
	movs r1, #8
	movs r3, #0
	bl sub_8014098
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8014014

	THUMB_FUNC_START sub_8014028
sub_8014028: @ 0x08014028
	push {lr}
	adds r2, r0, #0
	movs r0, #4
	movs r1, #4
	movs r3, #0
	bl sub_8014098
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8014028

	THUMB_FUNC_START sub_801403C
sub_801403C: @ 0x0801403C
	push {lr}
	adds r2, r0, #0
	movs r0, #4
	movs r1, #8
	movs r3, #0
	bl sub_8014098
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_801403C

	THUMB_FUNC_START sub_8014050
sub_8014050: @ 0x08014050
	push {lr}
	adds r2, r0, #0
	ldr r3, _08014064  @ sub_801420C
	movs r0, #7
	movs r1, #8
	bl sub_8014098
	pop {r0}
	bx r0
	.align 2, 0
_08014064: .4byte sub_801420C

	THUMB_FUNC_END sub_8014050

	THUMB_FUNC_START WaitForFade
WaitForFade: @ 0x08014068
	push {r4, lr}
	adds r4, r0, #0
	bl sub_8013C88
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0801407C
	adds r0, r4, #0
	bl Proc_Break
_0801407C:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END WaitForFade

	THUMB_FUNC_START sub_8014084
sub_8014084: @ 0x08014084
	push {lr}
	adds r2, r0, #0
	adds r3, r1, #0
	movs r0, #3
	movs r1, #0x40
	bl sub_8014098
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8014084

	THUMB_FUNC_START sub_8014098
sub_8014098: @ 0x08014098
	push {r4, r5, r6, r7, lr}
	adds r4, r1, #0
	adds r1, r2, #0
	adds r5, r3, #0
	ldr r7, _080140DC  @ gUnknown_080D7964
	lsls r2, r0, #1
	adds r2, r2, r0
	lsls r6, r2, #2
	adds r0, r6, r7
	ldr r2, [r0]
	ldr r0, _080140E0  @ gUnknown_0859A0A4
	bl _call_via_r2
	str r4, [r0, #0x54]
	str r5, [r0, #0x4c]
	asrs r4, r4, #4
	cmp r4, #0
	bne _080140BE
	movs r4, #1
_080140BE:
	adds r0, r7, #4
	adds r0, r6, r0
	ldr r1, [r0]
	adds r0, r7, #0
	adds r0, #8
	adds r0, r6, r0
	ldr r0, [r0]
	muls r0, r4, r0
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl _call_via_r1
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080140DC: .4byte gUnknown_080D7964
_080140E0: .4byte gUnknown_0859A0A4

	THUMB_FUNC_END sub_8014098

	THUMB_FUNC_START sub_80140E4
sub_80140E4: @ 0x080140E4
	push {lr}
	ldr r0, _080140F0  @ gUnknown_0859A0A4
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
_080140F0: .4byte gUnknown_0859A0A4

	THUMB_FUNC_END sub_80140E4

	THUMB_FUNC_START sub_80140F4
sub_80140F4: @ 0x080140F4
	movs r1, #0
	str r1, [r0, #0x58]
	str r1, [r0, #0x5c]
	str r1, [r0, #0x4c]
	bx lr

	THUMB_FUNC_END sub_80140F4

	THUMB_FUNC_START sub_8014100
sub_8014100: @ 0x08014100
	push {r4, lr}
	adds r4, r0, #0
	bl sub_8014124
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0801411E
	ldr r0, [r4, #0x4c]
	cmp r0, #0
	beq _08014118
	bl _call_via_r0
_08014118:
	adds r0, r4, #0
	bl Proc_Break
_0801411E:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8014100

	THUMB_FUNC_START sub_8014124
sub_8014124: @ 0x08014124
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x58]
	ldr r2, [r4, #0x54]
	adds r1, r0, r2
	str r1, [r4, #0x58]
	ldr r0, [r4, #0x5c]
	adds r0, r0, r2
	str r0, [r4, #0x5c]
	cmp r1, #0xf
	bgt _08014142
	cmp r0, r2
	beq _08014148
_0801413E:
	movs r0, #1
	b _08014160
_08014142:
	adds r0, r1, #0
	subs r0, #0x10
	str r0, [r4, #0x58]
_08014148:
	bl CALLARM_MaybeScreenFadeIn
	ldr r1, _08014168  @ gPaletteBuffer
	movs r0, #0
	strh r0, [r1]
	bl EnablePaletteSync
	ldr r1, [r4, #0x5c]
	ldr r0, _0801416C  @ 0x000001FF
	cmp r1, r0
	ble _0801413E
	movs r0, #0
_08014160:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08014168: .4byte gPaletteBuffer
_0801416C: .4byte 0x000001FF

	THUMB_FUNC_END sub_8014124

	THUMB_FUNC_START sub_8014170
sub_8014170: @ 0x08014170
	push {lr}
	movs r0, #0x10
	movs r1, #0x10
	movs r2, #0
	bl sub_800183C
	bl sub_8014194
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8014170

	THUMB_FUNC_START sub_8014184
sub_8014184: @ 0x08014184
	push {lr}
	movs r2, #0
	bl sub_800183C
	bl sub_8014194
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8014184

	THUMB_FUNC_START sub_8014194
sub_8014194: @ 0x08014194
	push {lr}
	ldr r0, _080141AC  @ gUnknown_0859A0A4
	bl Proc_Find
	adds r1, r0, #0
	cmp r1, #0
	beq _080141A6
	movs r0, #0
	str r0, [r1, #0x4c]
_080141A6:
	pop {r0}
	bx r0
	.align 2, 0
_080141AC: .4byte gUnknown_0859A0A4

	THUMB_FUNC_END sub_8014194

	THUMB_FUNC_START sub_80141B0
sub_80141B0: @ 0x080141B0
	push {lr}
	sub sp, #4
	movs r0, #3
	movs r1, #0
	movs r2, #0
	movs r3, #0x10
	bl SetSpecialColorEffectsParameters
	movs r0, #1
	str r0, [sp]
	movs r1, #1
	movs r2, #1
	movs r3, #1
	bl SetBlendTargetA
	movs r0, #1
	bl sub_8001F48
	ldr r1, _08014204  @ gPaletteBuffer
	movs r0, #0
	strh r0, [r1]
	bl EnablePaletteSync
	ldr r2, _08014208  @ gLCDControlBuffer
	ldrb r1, [r2, #1]
	movs r0, #2
	negs r0, r0
	ands r0, r1
	movs r1, #3
	negs r1, r1
	ands r0, r1
	subs r1, #2
	ands r0, r1
	subs r1, #4
	ands r0, r1
	subs r1, #8
	ands r0, r1
	strb r0, [r2, #1]
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_08014204: .4byte gPaletteBuffer
_08014208: .4byte gLCDControlBuffer

	THUMB_FUNC_END sub_80141B0

	THUMB_FUNC_START sub_801420C
sub_801420C: @ 0x0801420C
	push {lr}
	sub sp, #4
	movs r0, #2
	movs r1, #0
	movs r2, #0
	movs r3, #0x10
	bl SetSpecialColorEffectsParameters
	movs r0, #1
	str r0, [sp]
	movs r1, #1
	movs r2, #1
	movs r3, #1
	bl SetBlendTargetA
	movs r0, #1
	bl sub_8001F48
	add sp, #4
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_801420C

	THUMB_FUNC_START NewBlockingTimer
NewBlockingTimer: @ 0x08014238
	push {r4, lr}
	adds r2, r0, #0
	adds r4, r1, #0
	ldr r0, _08014250  @ gUnknown_0859A0D4
	adds r1, r2, #0
	bl Proc_StartBlocking
	str r4, [r0, #0x58]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08014250: .4byte gUnknown_0859A0D4

	THUMB_FUNC_END NewBlockingTimer

	THUMB_FUNC_START Timer6C_Countdown
Timer6C_Countdown: @ 0x08014254
	push {lr}
	adds r1, r0, #0
	ldr r0, [r1, #0x58]
	cmp r0, #0
	bne _08014266
	adds r0, r1, #0
	bl Proc_Break
	b _0801426A
_08014266:
	subs r0, #1
	str r0, [r1, #0x58]
_0801426A:
	pop {r0}
	bx r0

	THUMB_FUNC_END Timer6C_Countdown

	THUMB_FUNC_START sub_8014270
sub_8014270: @ 0x08014270
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	adds r6, r1, #0
	movs r5, #0
	cmp r4, #0
	bne _08014298
	ldr r0, _08014294  @ gUnknown_0859A0EC
	ldrb r1, [r0]
	strb r1, [r6]
	adds r6, #1
	ldrb r0, [r0, #1]
	strb r0, [r6]
	strb r4, [r6, #1]
	movs r0, #1
	b _08014324
	.align 2, 0
_08014294: .4byte gUnknown_0859A0EC
_08014298:
	cmp r4, #0
	bge _080142AA
	ldr r0, _080142B4  @ gUnknown_0859A0F0
	ldrb r1, [r0]
	strb r1, [r6]
	ldrb r0, [r0, #1]
	strb r0, [r6, #1]
	negs r4, r4
	movs r5, #2
_080142AA:
	ldr r0, _080142B8  @ 0x0001869F
	cmp r4, r0
	ble _080142BC
	adds r5, #0xa
	b _080142EA
	.align 2, 0
_080142B4: .4byte gUnknown_0859A0F0
_080142B8: .4byte 0x0001869F
_080142BC:
	ldr r0, _080142C8  @ 0x0000270F
	cmp r4, r0
	ble _080142CC
	adds r5, #8
	b _080142EA
	.align 2, 0
_080142C8: .4byte 0x0000270F
_080142CC:
	ldr r0, _080142D8  @ 0x000003E7
	cmp r4, r0
	ble _080142DC
	adds r5, #6
	b _080142EA
	.align 2, 0
_080142D8: .4byte 0x000003E7
_080142DC:
	cmp r4, #0x63
	ble _080142E4
	adds r5, #4
	b _080142EA
_080142E4:
	cmp r4, #9
	ble _080142EA
	adds r5, #2
_080142EA:
	mov r8, r5
	cmp r4, #0
	ble _08014316
	ldr r7, _08014330  @ gUnknown_0859A0EC
_080142F2:
	adds r0, r4, #0
	movs r1, #0xa
	bl DivRem
	adds r2, r6, r5
	ldrb r1, [r7]
	strb r1, [r2]
	ldrb r1, [r7, #1]
	adds r1, r1, r0
	strb r1, [r2, #1]
	adds r0, r4, #0
	movs r1, #0xa
	bl Div
	adds r4, r0, #0
	subs r5, #2
	cmp r4, #0
	bgt _080142F2
_08014316:
	mov r0, r8
	adds r1, r6, r0
	movs r0, #0
	strb r0, [r1, #2]
	mov r1, r8
	asrs r0, r1, #1
	adds r0, #1
_08014324:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08014330: .4byte gUnknown_0859A0EC

	THUMB_FUNC_END sub_8014270

	THUMB_FUNC_START String_FromNumber
String_FromNumber: @ 0x08014334
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	movs r6, #0
	cmp r4, #0
	bne _08014350
	ldr r0, _0801434C  @ gUnknown_0859A0F3
	ldrb r0, [r0]
	strb r0, [r5]
	strb r4, [r5, #1]
	movs r0, #1
	b _080143CE
	.align 2, 0
_0801434C: .4byte gUnknown_0859A0F3
_08014350:
	cmp r4, #0
	bge _0801435E
	ldr r0, _08014368  @ gUnknown_0859A0F4
	ldrb r0, [r0]
	strb r0, [r5]
	adds r5, #1
	negs r4, r4
_0801435E:
	ldr r0, _0801436C  @ 0x0001869F
	cmp r4, r0
	ble _08014370
	movs r6, #5
	b _0801439E
	.align 2, 0
_08014368: .4byte gUnknown_0859A0F4
_0801436C: .4byte 0x0001869F
_08014370:
	ldr r0, _0801437C  @ 0x0000270F
	cmp r4, r0
	ble _08014380
	movs r6, #4
	b _0801439E
	.align 2, 0
_0801437C: .4byte 0x0000270F
_08014380:
	ldr r0, _0801438C  @ 0x000003E7
	cmp r4, r0
	ble _08014390
	movs r6, #3
	b _0801439E
	.align 2, 0
_0801438C: .4byte 0x000003E7
_08014390:
	cmp r4, #0x63
	ble _08014398
	movs r6, #2
	b _0801439E
_08014398:
	cmp r4, #9
	ble _0801439E
	movs r6, #1
_0801439E:
	adds r7, r6, #0
	cmp r4, #0
	ble _080143C6
_080143A4:
	adds r0, r4, #0
	movs r1, #0xa
	bl DivRem
	adds r2, r5, r6
	ldr r1, _080143D4  @ gUnknown_0859A0F3
	ldrb r1, [r1]
	adds r1, r1, r0
	strb r1, [r2]
	adds r0, r4, #0
	movs r1, #0xa
	bl Div
	adds r4, r0, #0
	subs r6, #1
	cmp r4, #0
	bgt _080143A4
_080143C6:
	adds r0, r5, r7
	movs r1, #0
	strb r1, [r0, #1]
	adds r0, r7, #1
_080143CE:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080143D4: .4byte gUnknown_0859A0F3

	THUMB_FUNC_END String_FromNumber

	THUMB_FUNC_START DrawMapBattleInfoText
DrawMapBattleInfoText: @ 0x080143D8
	push {r4, r5, r6, lr}
	mov r6, r9
	mov r5, r8
	push {r5, r6}
	mov r9, r0
	mov r8, r1
	adds r4, r2, #0
	adds r6, r3, #0
	ldr r5, _08014438  @ gUnknown_03000800
	adds r0, r5, #0
	adds r1, r4, #0
	bl Text_Init
	adds r0, r6, #0
	bl GetStringTextWidth
	lsls r4, r4, #3
	subs r4, r4, r0
	subs r4, #1
	lsrs r0, r4, #0x1f
	adds r4, r4, r0
	asrs r4, r4, #1
	adds r0, r5, #0
	adds r1, r4, #0
	bl Text_SetXCursor
	adds r0, r5, #0
	mov r1, r8
	bl Text_SetColorId
	adds r0, r5, #0
	adds r1, r6, #0
	bl Text_AppendString
	adds r0, r5, #0
	mov r1, r9
	bl Text_Draw
	movs r0, #1
	bl BG_EnableSyncByMask
	adds r0, r5, #0
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08014438: .4byte gUnknown_03000800

	THUMB_FUNC_END DrawMapBattleInfoText

	THUMB_FUNC_START MADrawTextMaybe
MADrawTextMaybe: @ 0x0801443C
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r6, r1, #0
	adds r5, r2, #0
	ldr r4, _0801447C  @ gUnknown_03000800
	adds r0, r5, #0
	bl GetStringTextWidth
	adds r1, r0, #7
	cmp r1, #0
	bge _08014454
	adds r1, #7
_08014454:
	asrs r1, r1, #3
	adds r0, r4, #0
	bl Text_Init
	adds r0, r4, #0
	adds r1, r6, #0
	bl Text_SetColorId
	adds r0, r4, #0
	adds r1, r5, #0
	bl Text_AppendString
	adds r0, r4, #0
	adds r1, r7, #0
	bl Text_Draw
	adds r0, r4, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0801447C: .4byte gUnknown_03000800

	THUMB_FUNC_END MADrawTextMaybe

	THUMB_FUNC_START DeleteAllPaletteAnimator
DeleteAllPaletteAnimator: @ 0x08014480
	push {lr}
	ldr r0, _0801448C  @ gUnknown_0859A0F8
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
_0801448C: .4byte gUnknown_0859A0F8

	THUMB_FUNC_END DeleteAllPaletteAnimator

	THUMB_FUNC_START NewPaletteAnimator
NewPaletteAnimator: @ 0x08014490
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r5, r0, #0
	mov r8, r1
	adds r4, r2, #0
	adds r6, r3, #0
	ldr r1, [sp, #0x14]
	ldr r0, _080144C8  @ gUnknown_0859A0F8
	bl Proc_Start
	str r5, [r0, #0x2c]
	movs r2, #0
	mov r1, r8
	strh r1, [r0, #0x30]
	lsrs r1, r4, #0x1f
	adds r4, r4, r1
	asrs r4, r4, #1
	strh r4, [r0, #0x32]
	strh r6, [r0, #0x36]
	strh r6, [r0, #0x34]
	strh r2, [r0, #0x38]
	strh r2, [r0, #0x3a]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_080144C8: .4byte gUnknown_0859A0F8

	THUMB_FUNC_END NewPaletteAnimator

	THUMB_FUNC_START sub_80144CC
sub_80144CC: @ 0x080144CC
	push {r4, lr}
	sub sp, #4
	ldr r4, [sp, #0xc]
	str r4, [sp]
	bl NewPaletteAnimator
	movs r1, #0
	strh r1, [r0, #0x3a]
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80144CC

	THUMB_FUNC_START NewPaletteAnimator_
NewPaletteAnimator_: @ 0x080144E4
	push {r4, lr}
	sub sp, #4
	ldr r4, [sp, #0xc]
	str r4, [sp]
	bl NewPaletteAnimator
	movs r1, #1
	strh r1, [r0, #0x3a]
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END NewPaletteAnimator_

	THUMB_FUNC_START sub_80144FC
sub_80144FC: @ 0x080144FC
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x36]
	adds r0, #1
	strh r0, [r4, #0x36]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r1, [r4, #0x34]
	cmp r0, r1
	bcc _08014558
	movs r0, #0
	strh r0, [r4, #0x36]
	ldrh r0, [r4, #0x38]
	ldrh r1, [r4, #0x32]
	bl DivRem
	adds r5, r0, #0
	ldrh r0, [r4, #0x3a]
	cmp r0, #0
	beq _0801452A
	mvns r0, r5
	ldrh r2, [r4, #0x32]
	adds r5, r0, r2
_0801452A:
	lsls r6, r5, #1
	ldr r0, [r4, #0x2c]
	adds r0, r0, r6
	ldrh r1, [r4, #0x30]
	ldrh r2, [r4, #0x32]
	subs r2, r2, r5
	lsls r2, r2, #1
	bl CopyToPaletteBuffer
	cmp r5, #0
	ble _08014552
	ldr r0, [r4, #0x2c]
	ldrh r1, [r4, #0x32]
	lsls r1, r1, #1
	ldrh r2, [r4, #0x30]
	adds r1, r1, r2
	subs r1, r1, r6
	adds r2, r6, #0
	bl CopyToPaletteBuffer
_08014552:
	ldrh r0, [r4, #0x38]
	adds r0, #1
	strh r0, [r4, #0x38]
_08014558:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80144FC

	THUMB_FUNC_START sub_8014560
sub_8014560: @ 0x08014560
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	mov r9, r0
	mov sl, r1
	ldr r0, [sp, #0x24]
	lsls r3, r3, #0x10
	lsrs r4, r3, #0x10
	adds r3, r2, #0
	adds r0, r3, r0
	cmp r3, r0
	bge _080145B8
	mov r8, r0
	mov r0, sl
	lsls r0, r0, #1
	mov ip, r0
_08014584:
	mov r1, sl
	ldr r2, [sp, #0x20]
	adds r0, r1, r2
	adds r6, r3, #1
	cmp r1, r0
	bge _080145B2
	adds r5, r0, #0
	lsls r0, r3, #6
	add r0, r9
	mov r7, ip
	adds r2, r7, r0
_0801459A:
	cmp r1, #0x1f
	bhi _080145A4
	cmp r3, #0x1f
	bhi _080145A4
	strh r4, [r2]
_080145A4:
	adds r2, #2
	adds r1, #1
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r1, r5
	blt _0801459A
_080145B2:
	adds r3, r6, #0
	cmp r3, r8
	blt _08014584
_080145B8:
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8014560

	THUMB_FUNC_START sub_80145C8
sub_80145C8: @ 0x080145C8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	str r0, [sp]
	adds r7, r1, #0
	mov sl, r2
	ldr r0, [sp, #0x28]
	mov ip, r0
	ldr r0, [sp, #0x34]
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	mov r9, r3
	ldr r1, [sp, #0x30]
	str r1, [sp, #4]
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08014648
	movs r5, #0
	ldr r2, [sp, #0x2c]
	cmp r5, r2
	bge _08014690
_080145F8:
	movs r2, #0
	adds r6, r5, #1
	cmp r2, ip
	bge _0801463E
	lsls r3, r5, #6
	movs r0, #0x80
	lsls r0, r0, #3
	mov r8, r0
_08014608:
	adds r0, r7, r2
	adds r4, r2, #1
	cmp r0, #0x1f
	bhi _08014638
	mov r2, sl
	adds r1, r2, r5
	cmp r1, #0x1f
	bhi _08014638
	lsls r1, r1, #6
	lsls r0, r0, #1
	ldr r2, [sp]
	adds r0, r0, r2
	adds r1, r1, r0
	mov r2, ip
	subs r0, r2, r4
	lsls r0, r0, #1
	ldr r2, [sp, #4]
	adds r0, r0, r2
	adds r0, r3, r0
	ldrh r0, [r0]
	add r0, r9
	mov r2, r8
	eors r0, r2
	strh r0, [r1]
_08014638:
	adds r2, r4, #0
	cmp r2, ip
	blt _08014608
_0801463E:
	adds r5, r6, #0
	ldr r0, [sp, #0x2c]
	cmp r5, r0
	blt _080145F8
	b _08014690
_08014648:
	movs r5, #0
	ldr r1, [sp, #0x2c]
	cmp r5, r1
	bge _08014690
	lsls r2, r7, #1
	mov r8, r2
_08014654:
	movs r2, #0
	adds r6, r5, #1
	cmp r2, ip
	bge _08014688
	lsls r0, r5, #6
	ldr r1, [sp, #4]
	adds r4, r1, r0
	ldr r3, [sp]
	add r3, r8
_08014666:
	adds r0, r7, r2
	cmp r0, #0x1f
	bhi _0801467E
	mov r0, sl
	adds r1, r0, r5
	cmp r1, #0x1f
	bhi _0801467E
	lsls r1, r1, #6
	adds r1, r1, r3
	ldrh r0, [r4]
	add r0, r9
	strh r0, [r1]
_0801467E:
	adds r4, #2
	adds r3, #2
	adds r2, #1
	cmp r2, ip
	blt _08014666
_08014688:
	adds r5, r6, #0
	ldr r1, [sp, #0x2c]
	cmp r5, r1
	blt _08014654
_08014690:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80145C8

	THUMB_FUNC_START sub_80146A0
sub_80146A0: @ 0x080146A0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	str r0, [sp]
	mov r9, r1
	str r2, [sp, #4]
	ldr r7, [sp, #0x28]
	ldr r5, [sp, #0x34]
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	mov sl, r3
	ldr r0, [sp, #0x30]
	mov r8, r0
	movs r0, #0x20
	adds r1, r7, #0
	bl Div
	adds r4, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	bl Div
	adds r6, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	bl DivRem
	adds r1, r7, #0
	muls r1, r0, r1
	lsls r1, r1, #1
	add r1, r8
	ldr r2, [sp, #0x2c]
	adds r0, r6, #0
	muls r0, r2, r0
	lsls r0, r0, #6
	adds r1, r1, r0
	mov r8, r1
	movs r5, #0
	cmp r5, r2
	bge _0801473A
	mov r0, r9
	lsls r0, r0, #1
	mov ip, r0
_080146FC:
	movs r4, #0
	adds r6, r5, #1
	cmp r4, r7
	bge _08014732
	lsls r0, r5, #6
	mov r1, r8
	adds r3, r1, r0
	ldr r2, [sp]
	add r2, ip
_0801470E:
	mov r1, r9
	adds r0, r1, r4
	cmp r0, #0x1f
	bhi _08014728
	ldr r0, [sp, #4]
	adds r1, r0, r5
	cmp r1, #0x1f
	bhi _08014728
	lsls r1, r1, #6
	adds r1, r1, r2
	ldrh r0, [r3]
	add r0, sl
	strh r0, [r1]
_08014728:
	adds r3, #2
	adds r2, #2
	adds r4, #1
	cmp r4, r7
	blt _0801470E
_08014732:
	adds r5, r6, #0
	ldr r1, [sp, #0x2c]
	cmp r5, r1
	blt _080146FC
_0801473A:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80146A0

	THUMB_FUNC_START sub_801474C
sub_801474C: @ 0x0801474C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	str r0, [sp]
	mov sl, r1
	str r2, [sp, #4]
	ldr r0, [sp, #0x30]
	mov r8, r0
	ldr r5, [sp, #0x3c]
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	str r3, [sp, #8]
	ldr r6, [sp, #0x38]
	ldrb r0, [r6]
	adds r0, #1
	mov r9, r0
	adds r6, #2
	mov r1, r8
	bl Div
	adds r4, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	bl Div
	adds r1, r4, #0
	muls r1, r0, r1
	subs r5, r5, r1
	mov r1, r8
	muls r1, r5, r1
	lsls r1, r1, #1
	adds r1, r6, r1
	ldr r2, [sp, #0x34]
	muls r0, r2, r0
	lsls r0, r0, #6
	adds r6, r1, r0
	movs r5, #0
	cmp r5, r2
	bge _080147F2
	mov r7, sl
	lsls r7, r7, #1
	mov ip, r7
_080147A6:
	movs r4, #0
	adds r0, r5, #1
	str r0, [sp, #0xc]
	cmp r4, r8
	bge _080147EA
	ldr r1, [sp, #0x34]
	subs r0, r1, r5
	subs r0, #1
	mov r2, r9
	muls r2, r0, r2
	adds r0, r2, #0
	lsls r0, r0, #1
	adds r3, r6, r0
	ldr r2, [sp]
	add r2, ip
_080147C4:
	mov r7, sl
	adds r0, r7, r4
	cmp r0, #0x1f
	bhi _080147E0
	ldr r0, [sp, #4]
	adds r1, r0, r5
	cmp r1, #0x1f
	bhi _080147E0
	lsls r1, r1, #6
	adds r1, r1, r2
	ldrh r0, [r3]
	ldr r7, [sp, #8]
	adds r0, r7, r0
	strh r0, [r1]
_080147E0:
	adds r3, #2
	adds r2, #2
	adds r4, #1
	cmp r4, r8
	blt _080147C4
_080147EA:
	ldr r5, [sp, #0xc]
	ldr r0, [sp, #0x34]
	cmp r5, r0
	blt _080147A6
_080147F2:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_801474C

	THUMB_FUNC_START sub_8014804
sub_8014804: @ 0x08014804
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	adds r5, r1, #0
	mov ip, r2
	ldr r0, [sp, #0x18]
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	adds r2, r3, #2
	movs r1, #0xff
	ldr r0, [r3]
	ldrb r7, [r3]
	lsrs r3, r0, #8
	ands r3, r1
	lsls r1, r3, #0x10
	asrs r0, r1, #0x10
	cmp r0, #0
	blt _0801486C
_0801482A:
	asrs r0, r1, #0x10
	add r0, ip
	lsls r4, r3, #0x10
	cmp r0, #0x1f
	bhi _08014860
	lsls r0, r0, #5
	adds r0, r5, r0
	lsls r0, r0, #1
	mov r3, r8
	adds r1, r3, r0
	lsls r3, r7, #0x10
	asrs r0, r3, #0x10
	cmp r0, #0
	blt _08014860
_08014846:
	asrs r3, r3, #0x10
	adds r0, r5, r3
	cmp r0, #0x1f
	bhi _08014854
	ldrh r0, [r2]
	adds r0, r6, r0
	strh r0, [r1]
_08014854:
	subs r0, r3, #1
	adds r2, #2
	adds r1, #2
	lsls r3, r0, #0x10
	cmp r3, #0
	bge _08014846
_08014860:
	ldr r1, _08014878  @ 0xFFFF0000
	adds r0, r4, r1
	lsrs r3, r0, #0x10
	lsls r1, r3, #0x10
	cmp r1, #0
	bge _0801482A
_0801486C:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08014878: .4byte 0xFFFF0000

	THUMB_FUNC_END sub_8014804

	THUMB_FUNC_START FutureCall2_Loop
FutureCall2_Loop: @ 0x0801487C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x34]
	subs r0, #1
	str r0, [r4, #0x34]
	movs r1, #1
	negs r1, r1
	cmp r0, r1
	bne _0801489A
	ldr r0, [r4, #0x2c]
	bl _call_via_r0
	adds r0, r4, #0
	bl Proc_Break
_0801489A:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END FutureCall2_Loop

	THUMB_FUNC_START FutureCall_Loop
FutureCall_Loop: @ 0x080148A0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x34]
	subs r0, #1
	str r0, [r4, #0x34]
	movs r1, #1
	negs r1, r1
	cmp r0, r1
	bne _080148C0
	ldr r1, [r4, #0x2c]
	ldr r0, [r4, #0x30]
	bl _call_via_r1
	adds r0, r4, #0
	bl Proc_Break
_080148C0:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END FutureCall_Loop

	THUMB_FUNC_START SetupFutureCall2
SetupFutureCall2: @ 0x080148C8
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _080148E0  @ gUnknown_0859A100
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x2c]
	str r5, [r0, #0x34]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080148E0: .4byte gUnknown_0859A100

	THUMB_FUNC_END SetupFutureCall2

	THUMB_FUNC_START SetupFutureCall
SetupFutureCall: @ 0x080148E4
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	ldr r0, _08014900  @ gUnknown_0859A110
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x2c]
	str r5, [r0, #0x30]
	str r6, [r0, #0x34]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08014900: .4byte gUnknown_0859A110

	THUMB_FUNC_END SetupFutureCall

	THUMB_FUNC_START sub_8014904
sub_8014904: @ 0x08014904
	push {lr}
	cmp r1, #0
	ble _08014916
	movs r2, #0
_0801490C:
	strb r2, [r0]
	adds r0, #1
	subs r1, #1
	cmp r1, #0
	bgt _0801490C
_08014916:
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8014904

	THUMB_FUNC_START sub_801491C
sub_801491C: @ 0x0801491C
	push {lr}
	cmp r1, #0
	ble _0801492C
_08014922:
	strb r2, [r0]
	adds r0, #1
	subs r1, #1
	cmp r1, #0
	bgt _08014922
_0801492C:
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_801491C

	THUMB_FUNC_START sub_8014930
sub_8014930: @ 0x08014930
	push {lr}
	cmp r1, #0
	ble _08014940
_08014936:
	strh r2, [r0]
	adds r0, #2
	subs r1, #1
	cmp r1, #0
	bgt _08014936
_08014940:
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8014930

	THUMB_FUNC_START sub_8014944
sub_8014944: @ 0x08014944
	push {r4, lr}
	adds r1, r0, #0
	ldr r0, _08014964  @ gUnknown_0859A1E0
	bl Proc_StartBlocking
	adds r4, r0, #0
	bl GetThread2SkipStack
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r4, #0x64
	strh r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08014964: .4byte gUnknown_0859A1E0

	THUMB_FUNC_END sub_8014944

	THUMB_FUNC_START sub_8014968
sub_8014968: @ 0x08014968
	push {r4, lr}
	adds r4, r0, #0
	bl GetThread2SkipStack
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r1, r4, #0
	adds r1, #0x64
	movs r2, #0
	ldrsh r1, [r1, r2]
	cmp r0, r1
	bne _08014986
	adds r0, r4, #0
	bl Proc_Break
_08014986:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8014968

	THUMB_FUNC_START sub_801498C
sub_801498C: @ 0x0801498C
	push {r4, lr}
	adds r4, r0, #0
	adds r3, r2, #0
	movs r0, #0x1f
	ands r0, r3
	cmp r0, #0
	beq _080149AA
	lsrs r2, r3, #0x1f
	adds r2, r3, r2
	lsls r2, r2, #0xa
	lsrs r2, r2, #0xb
	adds r0, r4, #0
	bl CpuSet
	b _080149BC
_080149AA:
	adds r2, r3, #0
	cmp r2, #0
	bge _080149B2
	adds r2, #3
_080149B2:
	lsls r2, r2, #9
	lsrs r2, r2, #0xb
	adds r0, r4, #0
	bl CpuFastSet
_080149BC:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_801498C

	THUMB_FUNC_START sub_80149C4
sub_80149C4: @ 0x080149C4
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r5, r1, #0
	lsls r7, r2, #5
	cmp r3, #0
	ble _080149EA
	adds r4, r3, #0
_080149D2:
	adds r0, r6, #0
	adds r1, r5, #0
	adds r2, r7, #0
	bl sub_801498C
	adds r6, r6, r7
	movs r0, #0x80
	lsls r0, r0, #3
	adds r5, r5, r0
	subs r4, #1
	cmp r4, #0
	bne _080149D2
_080149EA:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80149C4

	THUMB_FUNC_START sub_80149F0
sub_80149F0: @ 0x080149F0
	push {r4, lr}
	adds r4, r0, #0
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	cmp r2, #0
	ble _08014A0C
_080149FC:
	ldrh r0, [r4]
	adds r0, r3, r0
	strh r0, [r1]
	adds r4, #2
	adds r1, #2
	subs r2, #2
	cmp r2, #0
	bgt _080149FC
_08014A0C:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80149F0

	THUMB_FUNC_START sub_8014A14
sub_8014A14: @ 0x08014A14
	push {lr}
	cmp r0, #1
	beq _08014A40
	cmp r0, #1
	bgt _08014A24
	cmp r0, #0
	beq _08014A2E
	b _08014A70
_08014A24:
	cmp r0, #2
	beq _08014A50
	cmp r0, #3
	beq _08014A60
	b _08014A70
_08014A2E:
	lsls r0, r2, #5
	adds r0, r0, r1
	lsls r0, r0, #1
	ldr r1, _08014A3C  @ gBG0TilemapBuffer
	adds r0, r0, r1
	b _08014A72
	.align 2, 0
_08014A3C: .4byte gBG0TilemapBuffer
_08014A40:
	lsls r0, r2, #5
	adds r0, r0, r1
	lsls r0, r0, #1
	ldr r1, _08014A4C  @ gBG1TilemapBuffer
	adds r0, r0, r1
	b _08014A72
	.align 2, 0
_08014A4C: .4byte gBG1TilemapBuffer
_08014A50:
	lsls r0, r2, #5
	adds r0, r0, r1
	lsls r0, r0, #1
	ldr r1, _08014A5C  @ gBG2TilemapBuffer
	adds r0, r0, r1
	b _08014A72
	.align 2, 0
_08014A5C: .4byte gBG2TilemapBuffer
_08014A60:
	lsls r0, r2, #5
	adds r0, r0, r1
	lsls r0, r0, #1
	ldr r1, _08014A6C  @ gBG3TilemapBuffer
	adds r0, r0, r1
	b _08014A72
	.align 2, 0
_08014A6C: .4byte gBG3TilemapBuffer
_08014A70:
	movs r0, #0
_08014A72:
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8014A14

	THUMB_FUNC_START sub_8014A78
sub_8014A78: @ 0x08014A78
	push {r4, r5, lr}
	ldr r4, _08014AFC  @ gLCDControlBuffer
	ldrb r1, [r4, #0xc]
	movs r5, #0x80
	adds r0, r5, #0
	ands r0, r1
	cmp r0, #0
	bne _08014A9C
	movs r0, #0
	bl GetBackgroundTileDataOffset
	movs r1, #0xc0
	lsls r1, r1, #0x13
	adds r0, r0, r1
	movs r1, #0x10
	movs r2, #0
	bl sub_8014930
_08014A9C:
	ldrb r1, [r4, #0x10]
	adds r0, r5, #0
	ands r0, r1
	cmp r0, #0
	bne _08014ABA
	movs r0, #1
	bl GetBackgroundTileDataOffset
	movs r1, #0xc0
	lsls r1, r1, #0x13
	adds r0, r0, r1
	movs r1, #0x10
	movs r2, #0
	bl sub_8014930
_08014ABA:
	ldrb r1, [r4, #0x14]
	adds r0, r5, #0
	ands r0, r1
	cmp r0, #0
	bne _08014AD8
	movs r0, #2
	bl GetBackgroundTileDataOffset
	movs r1, #0xc0
	lsls r1, r1, #0x13
	adds r0, r0, r1
	movs r1, #0x10
	movs r2, #0
	bl sub_8014930
_08014AD8:
	ldrb r1, [r4, #0x18]
	adds r0, r5, #0
	ands r0, r1
	cmp r0, #0
	bne _08014AF6
	movs r0, #3
	bl GetBackgroundTileDataOffset
	movs r1, #0xc0
	lsls r1, r1, #0x13
	adds r0, r0, r1
	movs r1, #0x10
	movs r2, #0
	bl sub_8014930
_08014AF6:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08014AFC: .4byte gLCDControlBuffer

	THUMB_FUNC_END sub_8014A78

	THUMB_FUNC_START RerangeSomething
RerangeSomething: @ 0x08014B00
	push {lr}
	adds r1, r0, #0
	cmp r1, #0
	bge _08014B0E
	movs r0, #0x60
	negs r0, r0
	b _08014B24
_08014B0E:
	cmp r1, #0xef
	bgt _08014B22
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #6
	movs r1, #0xf0
	bl Div
	subs r0, #0x60
	b _08014B24
_08014B22:
	movs r0, #0x5f
_08014B24:
	pop {r1}
	bx r1

	THUMB_FUNC_END RerangeSomething

	THUMB_FUNC_START PlaySpacialSoundMaybe
PlaySpacialSoundMaybe: @ 0x08014B28
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r6, r1, #0
	ldr r0, _08014B78  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08014B42
	lsls r0, r4, #0x10
	lsrs r0, r0, #0x10
	bl m4aSongNumStart
_08014B42:
	ldr r2, _08014B7C  @ gMPlayTable
	ldr r1, _08014B80  @ gSongTable
	lsls r0, r4, #3
	adds r0, r0, r1
	ldrh r1, [r0, #4]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r4, [r0]
	adds r0, r4, #0
	bl m4aMPlayImmInit
	ldr r5, _08014B84  @ 0x0000FFFF
	adds r0, r6, #0
	bl RerangeSomething
	adds r2, r0, #0
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	adds r0, r4, #0
	adds r1, r5, #0
	bl m4aMPlayPanpotControl
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08014B78: .4byte gRAMChapterData
_08014B7C: .4byte gMPlayTable
_08014B80: .4byte gSongTable
_08014B84: .4byte 0x0000FFFF

	THUMB_FUNC_END PlaySpacialSoundMaybe

	THUMB_FUNC_START sub_8014B88
sub_8014B88: @ 0x08014B88
	push {lr}
	adds r3, r0, #0
	adds r2, r1, #0
	ldr r0, _08014B9C  @ sub_8014BA0
	adds r1, r3, #0
	bl SetupFutureCall
	pop {r0}
	bx r0
	.align 2, 0
_08014B9C: .4byte sub_8014BA0

	THUMB_FUNC_END sub_8014B88

	THUMB_FUNC_START sub_8014BA0
sub_8014BA0: @ 0x08014BA0
	push {lr}
	adds r1, r0, #0
	ldr r0, _08014BBC  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08014BB8
	lsls r0, r1, #0x10
	lsrs r0, r0, #0x10
	bl m4aSongNumStart
_08014BB8:
	pop {r0}
	bx r0
	.align 2, 0
_08014BBC: .4byte gRAMChapterData

	THUMB_FUNC_END sub_8014BA0

	THUMB_FUNC_START sub_8014BC0
sub_8014BC0: @ 0x08014BC0
	push {lr}
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #0
	bl Sound_PlaySong80024D4
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8014BC0

	THUMB_FUNC_START sub_8014BD0
sub_8014BD0: @ 0x08014BD0
	push {lr}
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl Sound_FadeOutBGM
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8014BD0

	THUMB_FUNC_START sub_8014BE0
sub_8014BE0: @ 0x08014BE0
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #5
	ldr r1, _08014C34  @ gPaletteBuffer
	movs r2, #0x1f
	mov ip, r2
	movs r7, #0xf8
	lsls r7, r7, #2
	movs r6, #0xf8
	lsls r6, r6, #7
	adds r4, r0, r1
	movs r5, #0xf
_08014BF6:
	ldrh r1, [r4]
	movs r0, #0x1f
	ands r0, r1
	lsrs r0, r0, #2
	lsls r2, r0, #1
	adds r2, r2, r0
	adds r0, r7, #0
	ands r0, r1
	lsrs r0, r0, #2
	lsls r3, r0, #1
	adds r3, r3, r0
	adds r0, r6, #0
	ands r0, r1
	lsrs r0, r0, #2
	lsls r1, r0, #1
	adds r1, r1, r0
	mov r0, ip
	ands r2, r0
	ands r3, r7
	orrs r2, r3
	ands r1, r6
	orrs r2, r1
	strh r2, [r4]
	adds r4, #2
	subs r5, #1
	cmp r5, #0
	bge _08014BF6
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08014C34: .4byte gPaletteBuffer

	THUMB_FUNC_END sub_8014BE0

	THUMB_FUNC_START sub_8014C38
sub_8014C38: @ 0x08014C38
	push {lr}
	adds r3, r0, #0
	cmp r2, #0
	beq _08014C4E
_08014C40:
	ldrb r0, [r3]
	strb r0, [r1]
	adds r1, #1
	adds r3, #1
	subs r2, #1
	cmp r2, #0
	bne _08014C40
_08014C4E:
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8014C38

	THUMB_FUNC_START sub_8014C54
sub_8014C54: @ 0x08014C54
	push {r4, r5, r6, lr}
	mov r6, r9
	mov r5, r8
	push {r5, r6}
	adds r6, r0, #0
	mov r9, r1
	adds r5, r2, #0
	mov r8, r3
	ldr r4, [sp, #0x18]
	mov r0, r8
	bl GetStringTextWidth
	adds r1, r0, #0
	lsls r4, r4, #3
	subs r4, r4, r1
	asrs r1, r4, #1
	adds r0, r6, #0
	bl Text_SetXCursor
	adds r0, r6, #0
	mov r1, r8
	bl Text_AppendString
	lsls r5, r5, #5
	add r5, r9
	lsls r5, r5, #1
	ldr r0, _08014CA0  @ gBG0TilemapBuffer
	adds r5, r5, r0
	adds r0, r6, #0
	adds r1, r5, #0
	bl Text_Draw
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08014CA0: .4byte gBG0TilemapBuffer

	THUMB_FUNC_END sub_8014C54

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

	THUMB_FUNC_START sub_8014F50
sub_8014F50: @ 0x08014F50
	push {r4, r5, r6, lr}
	ldr r6, [r0]
	ldr r3, [r1]
	muls r3, r6, r3
	ldr r5, [r0, #4]
	ldr r4, [r1, #0xc]
	muls r4, r5, r4
	adds r3, r3, r4
	ldr r4, [r0, #8]
	ldr r0, [r1, #0x18]
	muls r0, r4, r0
	adds r3, r3, r0
	asrs r3, r3, #0xc
	str r3, [r2]
	ldr r0, [r1, #4]
	muls r0, r6, r0
	ldr r3, [r1, #0x10]
	muls r3, r5, r3
	adds r0, r0, r3
	ldr r3, [r1, #0x1c]
	muls r3, r4, r3
	adds r0, r0, r3
	asrs r0, r0, #0xc
	str r0, [r2, #4]
	ldr r0, [r1, #8]
	muls r0, r6, r0
	ldr r3, [r1, #0x14]
	muls r3, r5, r3
	adds r0, r0, r3
	ldr r1, [r1, #0x20]
	muls r1, r4, r1
	adds r0, r0, r1
	asrs r0, r0, #0xc
	str r0, [r2, #8]
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8014F50

	THUMB_FUNC_START sub_8014F9C
sub_8014F9C: @ 0x08014F9C
	push {r4, r5, r6, lr}
	sub sp, #0x30
	adds r3, r0, #0
	adds r4, r1, #0
	adds r6, r2, #0
	cmp r3, r6
	beq _08014FAE
	cmp r4, r6
	bne _08014FB2
_08014FAE:
	mov r5, sp
	b _08014FB4
_08014FB2:
	adds r5, r6, #0
_08014FB4:
	ldr r1, [r3]
	ldr r0, [r4]
	muls r0, r1, r0
	ldr r2, [r3, #4]
	ldr r1, [r4, #0xc]
	muls r1, r2, r1
	adds r0, r0, r1
	ldr r2, [r3, #8]
	ldr r1, [r4, #0x18]
	muls r1, r2, r1
	adds r0, r0, r1
	asrs r0, r0, #0xc
	str r0, [r5]
	ldr r1, [r3]
	ldr r0, [r4, #4]
	muls r0, r1, r0
	ldr r2, [r3, #4]
	ldr r1, [r4, #0x10]
	muls r1, r2, r1
	adds r0, r0, r1
	ldr r2, [r3, #8]
	ldr r1, [r4, #0x1c]
	muls r1, r2, r1
	adds r0, r0, r1
	asrs r0, r0, #0xc
	str r0, [r5, #4]
	ldr r1, [r3]
	ldr r0, [r4, #8]
	muls r0, r1, r0
	ldr r2, [r3, #4]
	ldr r1, [r4, #0x14]
	muls r1, r2, r1
	adds r0, r0, r1
	ldr r2, [r3, #8]
	ldr r1, [r4, #0x20]
	muls r1, r2, r1
	adds r0, r0, r1
	asrs r0, r0, #0xc
	str r0, [r5, #8]
	ldr r1, [r3, #0xc]
	ldr r0, [r4]
	muls r0, r1, r0
	ldr r2, [r3, #0x10]
	ldr r1, [r4, #0xc]
	muls r1, r2, r1
	adds r0, r0, r1
	ldr r2, [r3, #0x14]
	ldr r1, [r4, #0x18]
	muls r1, r2, r1
	adds r0, r0, r1
	asrs r0, r0, #0xc
	str r0, [r5, #0xc]
	ldr r1, [r3, #0xc]
	ldr r0, [r4, #4]
	muls r0, r1, r0
	ldr r2, [r3, #0x10]
	ldr r1, [r4, #0x10]
	muls r1, r2, r1
	adds r0, r0, r1
	ldr r2, [r3, #0x14]
	ldr r1, [r4, #0x1c]
	muls r1, r2, r1
	adds r0, r0, r1
	asrs r0, r0, #0xc
	str r0, [r5, #0x10]
	ldr r1, [r3, #0xc]
	ldr r0, [r4, #8]
	muls r0, r1, r0
	ldr r2, [r3, #0x10]
	ldr r1, [r4, #0x14]
	muls r1, r2, r1
	adds r0, r0, r1
	ldr r2, [r3, #0x14]
	ldr r1, [r4, #0x20]
	muls r1, r2, r1
	adds r0, r0, r1
	asrs r0, r0, #0xc
	str r0, [r5, #0x14]
	ldr r1, [r3, #0x18]
	ldr r0, [r4]
	muls r0, r1, r0
	ldr r2, [r3, #0x1c]
	ldr r1, [r4, #0xc]
	muls r1, r2, r1
	adds r0, r0, r1
	ldr r2, [r3, #0x20]
	ldr r1, [r4, #0x18]
	muls r1, r2, r1
	adds r0, r0, r1
	asrs r0, r0, #0xc
	str r0, [r5, #0x18]
	ldr r1, [r3, #0x18]
	ldr r0, [r4, #4]
	muls r0, r1, r0
	ldr r2, [r3, #0x1c]
	ldr r1, [r4, #0x10]
	muls r1, r2, r1
	adds r0, r0, r1
	ldr r2, [r3, #0x20]
	ldr r1, [r4, #0x1c]
	muls r1, r2, r1
	adds r0, r0, r1
	asrs r0, r0, #0xc
	str r0, [r5, #0x1c]
	ldr r1, [r3, #0x18]
	ldr r0, [r4, #8]
	muls r0, r1, r0
	ldr r2, [r3, #0x1c]
	ldr r1, [r4, #0x14]
	muls r1, r2, r1
	adds r0, r0, r1
	ldr r2, [r3, #0x20]
	ldr r1, [r4, #0x20]
	muls r1, r2, r1
	adds r0, r0, r1
	asrs r0, r0, #0xc
	str r0, [r5, #0x20]
	ldr r1, [r3]
	ldr r0, [r4, #0x24]
	muls r0, r1, r0
	ldr r2, [r3, #0xc]
	ldr r1, [r4, #0x28]
	muls r1, r2, r1
	adds r0, r0, r1
	ldr r2, [r3, #0x18]
	ldr r1, [r4, #0x2c]
	muls r1, r2, r1
	adds r0, r0, r1
	asrs r0, r0, #0xc
	ldr r1, [r3, #0x24]
	adds r0, r0, r1
	str r0, [r5, #0x24]
	ldr r1, [r3, #4]
	ldr r0, [r4, #0x24]
	muls r0, r1, r0
	ldr r2, [r3, #0x10]
	ldr r1, [r4, #0x28]
	muls r1, r2, r1
	adds r0, r0, r1
	ldr r2, [r3, #0x1c]
	ldr r1, [r4, #0x2c]
	muls r1, r2, r1
	adds r0, r0, r1
	asrs r0, r0, #0xc
	ldr r1, [r3, #0x28]
	adds r0, r0, r1
	str r0, [r5, #0x28]
	ldr r1, [r3, #8]
	ldr r0, [r4, #0x24]
	muls r0, r1, r0
	ldr r2, [r3, #0x14]
	ldr r1, [r4, #0x28]
	muls r1, r2, r1
	adds r0, r0, r1
	ldr r2, [r3, #0x20]
	ldr r1, [r4, #0x2c]
	muls r1, r2, r1
	adds r0, r0, r1
	asrs r0, r0, #0xc
	ldr r1, [r3, #0x2c]
	adds r0, r0, r1
	str r0, [r5, #0x2c]
	cmp r5, sp
	bne _08015104
	mov r0, sp
	adds r1, r6, #0
	bl sub_801512C
_08015104:
	add sp, #0x30
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8014F9C

	THUMB_FUNC_START sub_801510C
sub_801510C: @ 0x0801510C
	movs r2, #0x80
	lsls r2, r2, #5
	str r2, [r0]
	movs r1, #0
	str r1, [r0, #4]
	str r1, [r0, #8]
	str r1, [r0, #0xc]
	str r2, [r0, #0x10]
	str r1, [r0, #0x14]
	str r1, [r0, #0x18]
	str r1, [r0, #0x1c]
	str r2, [r0, #0x20]
	str r1, [r0, #0x24]
	str r1, [r0, #0x28]
	str r1, [r0, #0x2c]
	bx lr

	THUMB_FUNC_END sub_801510C

	THUMB_FUNC_START sub_801512C
sub_801512C: @ 0x0801512C
	ldr r2, [r0]
	str r2, [r1]
	ldr r2, [r0, #4]
	str r2, [r1, #4]
	ldr r2, [r0, #8]
	str r2, [r1, #8]
	ldr r2, [r0, #0xc]
	str r2, [r1, #0xc]
	ldr r2, [r0, #0x10]
	str r2, [r1, #0x10]
	ldr r2, [r0, #0x14]
	str r2, [r1, #0x14]
	ldr r2, [r0, #0x18]
	str r2, [r1, #0x18]
	ldr r2, [r0, #0x1c]
	str r2, [r1, #0x1c]
	ldr r2, [r0, #0x20]
	str r2, [r1, #0x20]
	ldr r2, [r0, #0x24]
	str r2, [r1, #0x24]
	ldr r2, [r0, #0x28]
	str r2, [r1, #0x28]
	ldr r0, [r0, #0x2c]
	str r0, [r1, #0x2c]
	bx lr

	THUMB_FUNC_END sub_801512C

	THUMB_FUNC_START sub_8015160
sub_8015160: @ 0x08015160
	push {r4, lr}
	ldr r3, _080151A8  @ gSinLookup
	lsls r1, r1, #0x10
	movs r2, #0xff
	lsls r2, r2, #0x10
	ands r2, r1
	asrs r2, r2, #0x10
	adds r1, r2, #0
	adds r1, #0x40
	lsls r1, r1, #1
	adds r1, r1, r3
	ldrh r4, [r1]
	lsls r2, r2, #1
	adds r2, r2, r3
	ldrh r2, [r2]
	movs r1, #0x80
	lsls r1, r1, #5
	str r1, [r0]
	movs r3, #0
	str r3, [r0, #4]
	str r3, [r0, #8]
	str r3, [r0, #0xc]
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	str r4, [r0, #0x10]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	negs r1, r2
	str r1, [r0, #0x14]
	str r3, [r0, #0x18]
	str r2, [r0, #0x1c]
	str r4, [r0, #0x20]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080151A8: .4byte gSinLookup

	THUMB_FUNC_END sub_8015160

	THUMB_FUNC_START sub_80151AC
sub_80151AC: @ 0x080151AC
	push {r4, lr}
	ldr r3, _080151F0  @ gSinLookup
	lsls r1, r1, #0x10
	movs r2, #0xff
	lsls r2, r2, #0x10
	ands r2, r1
	asrs r2, r2, #0x10
	adds r1, r2, #0
	adds r1, #0x40
	lsls r1, r1, #1
	adds r1, r1, r3
	lsls r2, r2, #1
	adds r2, r2, r3
	ldrh r2, [r2]
	movs r3, #0
	ldrsh r4, [r1, r3]
	str r4, [r0]
	movs r3, #0
	str r3, [r0, #4]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	negs r1, r2
	str r1, [r0, #8]
	str r3, [r0, #0xc]
	movs r1, #0x80
	lsls r1, r1, #5
	str r1, [r0, #0x10]
	str r3, [r0, #0x14]
	str r2, [r0, #0x18]
	str r3, [r0, #0x1c]
	str r4, [r0, #0x20]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080151F0: .4byte gSinLookup

	THUMB_FUNC_END sub_80151AC

	THUMB_FUNC_START sub_80151F4
sub_80151F4: @ 0x080151F4
	push {r4, lr}
	ldr r3, _08015238  @ gSinLookup
	lsls r1, r1, #0x10
	movs r2, #0xff
	lsls r2, r2, #0x10
	ands r2, r1
	asrs r2, r2, #0x10
	adds r1, r2, #0
	adds r1, #0x40
	lsls r1, r1, #1
	adds r1, r1, r3
	lsls r2, r2, #1
	adds r2, r2, r3
	ldrh r2, [r2]
	movs r4, #0
	ldrsh r3, [r1, r4]
	str r3, [r0]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	negs r1, r2
	str r1, [r0, #4]
	movs r1, #0
	str r1, [r0, #8]
	str r2, [r0, #0xc]
	str r3, [r0, #0x10]
	str r1, [r0, #0x14]
	str r1, [r0, #0x18]
	str r1, [r0, #0x1c]
	movs r1, #0x80
	lsls r1, r1, #5
	str r1, [r0, #0x20]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08015238: .4byte gSinLookup

	THUMB_FUNC_END sub_80151F4

	THUMB_FUNC_START sub_801523C
sub_801523C: @ 0x0801523C
	bx lr

	THUMB_FUNC_END sub_801523C

	THUMB_FUNC_START sub_8015240
sub_8015240: @ 0x08015240
	push {r4, lr}
	adds r4, r0, #0
	ldr r2, [r4]
	ldr r0, [r1]
	muls r0, r2, r0
	ldr r3, [r4, #4]
	ldr r2, [r1, #4]
	muls r2, r3, r2
	adds r0, r0, r2
	ldr r2, [r4, #8]
	ldr r1, [r1, #8]
	muls r1, r2, r1
	adds r0, r0, r1
	asrs r0, r0, #0xc
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8015240

	THUMB_FUNC_START sub_8015264
sub_8015264: @ 0x08015264
	push {r4, r5, r6, lr}
	ldr r6, [r0, #4]
	ldr r3, [r1, #8]
	muls r3, r6, r3
	ldr r5, [r0, #8]
	ldr r4, [r1, #4]
	muls r4, r5, r4
	subs r3, r3, r4
	asrs r3, r3, #0xc
	str r3, [r2]
	ldr r3, [r1]
	muls r3, r5, r3
	ldr r4, [r0]
	ldr r0, [r1, #8]
	muls r0, r4, r0
	subs r3, r3, r0
	asrs r3, r3, #0xc
	str r3, [r2, #4]
	ldr r0, [r1, #4]
	muls r0, r4, r0
	ldr r1, [r1]
	muls r1, r6, r1
	subs r0, r0, r1
	asrs r0, r0, #0xc
	str r0, [r2, #8]
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8015264

	THUMB_FUNC_START sub_801529C
sub_801529C: @ 0x0801529C
	muls r0, r3, r0
	muls r1, r2, r1
	subs r0, r0, r1
	bx lr

	THUMB_FUNC_END sub_801529C

	.align 2, 0 @ Don't pad with nop.
