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
	bl SetPalFadeStClkEnd1
	mov r0, r8
	bl SetPalFadeStClkEnd2
	ldr r0, [sp]
	bl SetPalFadeStClkEnd3
	bl GetPalFadeSt
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

.align 2, 0
