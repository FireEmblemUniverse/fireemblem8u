	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

    @ event 18 effect proc
    @ arbitrary color effect (STARTFADE, ENDFADE, FADECOLORS)

	THUMB_FUNC_START sub_80126BC
sub_80126BC: @ 0x080126BC
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	adds r6, r0, #0
	ldrh r0, [r6, #0x30]
	ldrh r1, [r6, #0x32]
	adds r0, r0, r1
	strh r0, [r6, #0x32]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0xff
	bls _080126DC
	adds r0, r6, #0
	bl Proc_Break
_080126DC:
	ldr r4, _080127B0  @ gUnknown_03000700
	movs r2, #0
	mov r8, r2
	ldr r3, _080127B4  @ 0x000003FF
	mov r9, r3
_080126E6:
	movs r7, #1
	mov r0, r8
	lsls r7, r0
	ldr r0, [r6, #0x2c]
	ands r0, r7
	cmp r0, #0
	beq _08012794
	ldrh r1, [r4, #4]
	lsls r1, r1, #0x16
	lsrs r1, r1, #0x16
	ldrh r2, [r6, #0x32]
	movs r0, #0x80
	lsls r0, r0, #1
	subs r3, r0, r2
	muls r1, r3, r1
	ldrh r0, [r6, #0x34]
	muls r0, r2, r0
	adds r0, r1, r0
	cmp r0, #0
	bge _08012710
	adds r0, #0xff
_08012710:
	lsls r0, r0, #8
	lsrs r0, r0, #0x10
	mov ip, r0
	ldr r0, [r4, #4]
	lsls r0, r0, #0xc
	lsrs r0, r0, #0x16
	adds r1, r0, #0
	muls r1, r3, r1
	ldrh r0, [r6, #0x36]
	muls r0, r2, r0
	adds r0, r1, r0
	cmp r0, #0
	bge _0801272C
	adds r0, #0xff
_0801272C:
	lsls r0, r0, #8
	lsrs r5, r0, #0x10
	ldrh r0, [r4, #6]
	lsls r0, r0, #0x12
	lsrs r0, r0, #0x16
	adds r1, r0, #0
	muls r1, r3, r1
	ldrh r0, [r6, #0x38]
	muls r0, r2, r0
	adds r0, r1, r0
	cmp r0, #0
	bge _08012746
	adds r0, #0xff
_08012746:
	lsls r2, r0, #8
	lsrs r2, r2, #0x10
	mov r0, ip
	adds r1, r5, #0
	adds r3, r7, #0
	bl WriteFadedPaletteFromArchive
	bl GetSomethingInPaletteBB_2A
	ldr r2, _080127B4  @ 0x000003FF
	adds r1, r2, #0
	ands r0, r1
	ldrh r1, [r4]
	ldr r3, _080127B8  @ 0xFFFFFC00
	adds r2, r3, #0
	ands r1, r2
	orrs r1, r0
	strh r1, [r4]
	bl GetSomethingInPaletteBB_5A
	mov r1, r9
	ands r0, r1
	lsls r0, r0, #0xa
	ldr r1, [r4]
	ldr r2, _080127BC  @ 0xFFF003FF
	ands r1, r2
	orrs r1, r0
	str r1, [r4]
	bl GetSomethingInPaletteBB_8A
	mov r2, r9
	ands r0, r2
	lsls r0, r0, #4
	ldrh r1, [r4, #2]
	ldr r3, _080127C0  @ 0xFFFFC00F
	adds r2, r3, #0
	ands r1, r2
	orrs r1, r0
	strh r1, [r4, #2]
_08012794:
	adds r4, #8
	mov r0, r8
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	cmp r0, #0x1f
	bls _080126E6
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080127B0: .4byte gUnknown_03000700
_080127B4: .4byte 0x000003FF
_080127B8: .4byte 0xFFFFFC00
_080127BC: .4byte 0xFFF003FF
_080127C0: .4byte 0xFFFFC00F

	THUMB_FUNC_END sub_80126BC

	THUMB_FUNC_START sub_80127C4
sub_80127C4: @ 0x080127C4
	push {r4, r5, r6, r7, lr}
	bl ArchiveCurrentPalettes
	ldr r2, _08012814  @ gUnknown_03000700
	movs r3, #0
	ldr r0, _08012818  @ 0xFFFFFC00
	mov ip, r0
	ldr r6, _0801281C  @ 0xFFFFC00F
	movs r7, #0x80
	lsls r7, r7, #1
	adds r5, r7, #0
	ldr r4, _08012820  @ 0xFFF003FF
_080127DC:
	ldrh r1, [r2]
	mov r0, ip
	ands r0, r1
	orrs r0, r5
	strh r0, [r2]
	ldr r0, [r2]
	ands r0, r4
	movs r1, #0x80
	lsls r1, r1, #0xb
	orrs r0, r1
	str r0, [r2]
	ldrh r1, [r2, #2]
	adds r0, r6, #0
	ands r0, r1
	movs r7, #0x80
	lsls r7, r7, #5
	adds r1, r7, #0
	orrs r0, r1
	strh r0, [r2, #2]
	adds r2, #8
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #0x1f
	bls _080127DC
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08012814: .4byte gUnknown_03000700
_08012818: .4byte 0xFFFFFC00
_0801281C: .4byte 0xFFFFC00F
_08012820: .4byte 0xFFF003FF

	THUMB_FUNC_END sub_80127C4

	THUMB_FUNC_START sub_8012824
sub_8012824: @ 0x08012824
	push {r4, r5, r6, r7, lr}
	movs r4, #0x80
	lsls r4, r4, #1
	movs r3, #1
	negs r3, r3
	adds r0, r4, #0
	adds r1, r4, #0
	adds r2, r4, #0
	bl WriteFadedPaletteFromArchive
	ldr r2, _08012880  @ gUnknown_03000700
	movs r3, #0
	ldr r0, _08012884  @ 0xFFFFFC00
	mov ip, r0
	ldr r6, _08012888  @ 0xFFFFC00F
	adds r5, r4, #0
	ldr r4, _0801288C  @ 0xFFF003FF
_08012846:
	ldrh r1, [r2]
	mov r0, ip
	ands r0, r1
	orrs r0, r5
	strh r0, [r2]
	ldr r0, [r2]
	ands r0, r4
	movs r1, #0x80
	lsls r1, r1, #0xb
	orrs r0, r1
	str r0, [r2]
	ldrh r1, [r2, #2]
	adds r0, r6, #0
	ands r0, r1
	movs r7, #0x80
	lsls r7, r7, #5
	adds r1, r7, #0
	orrs r0, r1
	strh r0, [r2, #2]
	adds r2, #8
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #0x1f
	bls _08012846
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08012880: .4byte gUnknown_03000700
_08012884: .4byte 0xFFFFFC00
_08012888: .4byte 0xFFFFC00F
_0801288C: .4byte 0xFFF003FF

	THUMB_FUNC_END sub_8012824

	THUMB_FUNC_START sub_8012890
sub_8012890: @ 0x08012890
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r1, #0
	ldr r4, [sp, #0x18]
	ldr r1, [sp, #0x1c]
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	mov r8, r2
	lsls r3, r3, #0x10
	lsrs r7, r3, #0x10
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	ldr r0, _080128C4  @ gUnknown_08592568
	bl Proc_StartBlocking
	adds r1, r0, #0
	cmp r5, #0
	bne _080128C8
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r1, #0x30]
	b _080128CA
	.align 2, 0
_080128C4: .4byte gUnknown_08592568
_080128C8:
	strh r5, [r1, #0x30]
_080128CA:
	movs r0, #0
	strh r0, [r1, #0x32]
	str r6, [r1, #0x2c]
	mov r0, r8
	strh r0, [r1, #0x34]
	strh r7, [r1, #0x36]
	strh r4, [r1, #0x38]
	ldr r3, _0801293C  @ gUnknown_03000700
	movs r4, #0
	ldr r0, _08012940  @ 0xFFFFFC00
	mov r8, r0
	ldr r5, _08012944  @ 0x000003FF
	ldr r7, _08012948  @ 0xFFFFC00F
_080128E4:
	movs r0, #1
	lsls r0, r4
	ands r0, r6
	cmp r0, #0
	beq _08012926
	ldrh r1, [r3]
	lsls r1, r1, #0x16
	lsrs r1, r1, #0x16
	ldrh r2, [r3, #4]
	mov r0, r8
	ands r0, r2
	orrs r0, r1
	strh r0, [r3, #4]
	ldr r0, [r3]
	lsls r0, r0, #0xc
	lsrs r0, r0, #0x16
	ands r0, r5
	lsls r0, r0, #0xa
	ldr r1, [r3, #4]
	ldr r2, _0801294C  @ 0xFFF003FF
	ands r1, r2
	orrs r1, r0
	str r1, [r3, #4]
	ldrh r1, [r3, #2]
	lsls r1, r1, #0x12
	lsrs r1, r1, #0x16
	ands r1, r5
	lsls r1, r1, #4
	ldrh r2, [r3, #6]
	adds r0, r7, #0
	ands r0, r2
	orrs r0, r1
	strh r0, [r3, #6]
_08012926:
	adds r3, #8
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0x1f
	bls _080128E4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801293C: .4byte gUnknown_03000700
_08012940: .4byte 0xFFFFFC00
_08012944: .4byte 0x000003FF
_08012948: .4byte 0xFFFFC00F
_0801294C: .4byte 0xFFF003FF

	THUMB_FUNC_END sub_8012890

	.align 2, 0 @ Don't pad with nop.
