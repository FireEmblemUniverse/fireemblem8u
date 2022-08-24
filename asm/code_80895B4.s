	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	THUMB_FUNC_START sub_80895B4
sub_80895B4: @ 0x080895B4
	push {lr}
	adds r2, r0, #0
	movs r0, #1
	ands r0, r2
	ldr r3, _080895DC  @ gUnknown_08A07C58
	cmp r0, #0
	beq _080895C4
	ldr r3, _080895E0  @ gUnknown_08A07AD8
_080895C4:
	movs r0, #0x80
	ands r0, r2
	cmp r0, #0
	bne _0808960A
	movs r0, #8
	ands r0, r2
	cmp r0, #0
	beq _080895E4
	movs r0, #0xa0
	lsls r0, r0, #1
	adds r3, r3, r0
	b _0808960A
	.align 2, 0
_080895DC: .4byte gUnknown_08A07C58
_080895E0: .4byte gUnknown_08A07AD8
_080895E4:
	movs r0, #0x10
	ands r0, r2
	cmp r0, #0
	bne _0808960A
	movs r0, #0x20
	ands r0, r2
	cmp r0, #0
	beq _080895F6
	adds r3, #0x40
_080895F6:
	movs r0, #0x40
	ands r0, r2
	cmp r0, #0
	beq _08089600
	adds r3, #0x80
_08089600:
	movs r0, #4
	ands r0, r2
	cmp r0, #0
	beq _0808960A
	adds r3, #0x80
_0808960A:
	movs r0, #2
	ands r0, r2
	cmp r0, #0
	beq _08089614
	adds r3, #0x20
_08089614:
	lsls r1, r1, #5
	adds r0, r3, #0
	movs r2, #0x20
	bl CopyToPaletteBuffer
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80895B4

	THUMB_FUNC_START sub_8089624
sub_8089624: @ 0x08089624
	push {r4, lr}
	adds r4, r0, #0
	adds r3, r1, #0
	movs r0, #0x84
	lsls r0, r0, #1
	cmp r3, r0
	bls _08089634
	movs r3, #0x54
_08089634:
	ldr r2, _08089660  @ gUnknown_0203E78C
	ldr r0, _08089664  @ 0x000003FF
	adds r1, r0, #0
	adds r0, r4, #0
	ands r0, r1
	strh r0, [r2, #2]
	ldr r1, _08089668  @ chap_title_data
	lsls r0, r3, #1
	adds r0, r0, r3
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	lsls r1, r4, #5
	movs r2, #0xc0
	lsls r2, r2, #0x13
	adds r1, r1, r2
	bl CopyDataWithPossibleUncomp
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08089660: .4byte gUnknown_0203E78C
_08089664: .4byte 0x000003FF
_08089668: .4byte chap_title_data

	THUMB_FUNC_END sub_8089624

	THUMB_FUNC_START sub_808966C
sub_808966C: @ 0x0808966C
	push {lr}
	bl sub_8089624
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_808966C

	THUMB_FUNC_START sub_8089678
sub_8089678: @ 0x08089678
	push {lr}
	adds r1, r0, #0
	ldr r3, _0808969C  @ gUnknown_0203E78C
	ldr r0, _080896A0  @ 0x000003FF
	adds r2, r0, #0
	adds r0, r1, #0
	ands r0, r2
	strh r0, [r3]
	ldr r0, _080896A4  @ gUnknown_08A09E4C
	lsls r1, r1, #5
	movs r2, #0xc0
	lsls r2, r2, #0x13
	adds r1, r1, r2
	bl CopyDataWithPossibleUncomp
	pop {r0}
	bx r0
	.align 2, 0
_0808969C: .4byte gUnknown_0203E78C
_080896A0: .4byte 0x000003FF
_080896A4: .4byte gUnknown_08A09E4C

	THUMB_FUNC_END sub_8089678

	THUMB_FUNC_START sub_80896A8
sub_80896A8: @ 0x080896A8
	push {lr}
	adds r1, r0, #0
	ldr r3, _080896CC  @ gUnknown_0203E78C
	ldr r0, _080896D0  @ 0x000003FF
	adds r2, r0, #0
	adds r0, r1, #0
	ands r0, r2
	strh r0, [r3]
	ldr r0, _080896D4  @ gUnknown_08A0A4E8
	lsls r1, r1, #5
	movs r2, #0xc0
	lsls r2, r2, #0x13
	adds r1, r1, r2
	bl CopyDataWithPossibleUncomp
	pop {r0}
	bx r0
	.align 2, 0
_080896CC: .4byte gUnknown_0203E78C
_080896D0: .4byte 0x000003FF
_080896D4: .4byte gUnknown_08A0A4E8

	THUMB_FUNC_END sub_80896A8

	THUMB_FUNC_START sub_80896D8
sub_80896D8: @ 0x080896D8
	push {lr}
	adds r2, r0, #0
	ldr r0, _080896F8  @ gUnknown_0203E78C
	lsls r1, r1, #0xc
	ldrh r0, [r0, #2]
	adds r1, r1, r0
	movs r0, #0x3f
_080896E6:
	strh r1, [r2]
	adds r1, #1
	adds r2, #2
	subs r0, #1
	cmp r0, #0
	bge _080896E6
	pop {r0}
	bx r0
	.align 2, 0
_080896F8: .4byte gUnknown_0203E78C

	THUMB_FUNC_END sub_80896D8

	THUMB_FUNC_START sub_80896FC
sub_80896FC: @ 0x080896FC
	push {lr}
	adds r2, r0, #0
	ldr r0, _0808971C  @ gUnknown_0203E78C
	lsls r1, r1, #0xc
	ldrh r0, [r0, #2]
	adds r1, r1, r0
	movs r0, #0x3f
_0808970A:
	strh r1, [r2]
	adds r1, #1
	adds r2, #2
	subs r0, #1
	cmp r0, #0
	bge _0808970A
	pop {r0}
	bx r0
	.align 2, 0
_0808971C: .4byte gUnknown_0203E78C

	THUMB_FUNC_END sub_80896FC

	THUMB_FUNC_START sub_8089720
sub_8089720: @ 0x08089720
	push {lr}
	adds r2, r0, #0
	ldr r0, _08089740  @ gUnknown_0203E78C
	lsls r1, r1, #0xc
	ldrh r0, [r0]
	adds r1, r1, r0
	movs r0, #0x7f
_0808972E:
	strh r1, [r2]
	adds r1, #1
	adds r2, #2
	subs r0, #1
	cmp r0, #0
	bge _0808972E
	pop {r0}
	bx r0
	.align 2, 0
_08089740: .4byte gUnknown_0203E78C

	THUMB_FUNC_END sub_8089720

	THUMB_FUNC_START sub_8089744
sub_8089744: @ 0x08089744
	push {lr}
	adds r2, r1, #0
	ldr r1, _08089760  @ gUnknown_08A0A9F8
	ldr r3, _08089764  @ gUnknown_0203E78C
	lsls r2, r2, #0xc
	ldrh r3, [r3]
	adds r2, r2, r3
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	bl CallARM_FillTileRect
	pop {r0}
	bx r0
	.align 2, 0
_08089760: .4byte gUnknown_08A0A9F8
_08089764: .4byte gUnknown_0203E78C

	THUMB_FUNC_END sub_8089744

	THUMB_FUNC_START sub_8089768
sub_8089768: @ 0x08089768
	push {lr}
	adds r1, r0, #0
	cmp r1, #0
	bne _08089774
	movs r0, #0x54
	b _08089798
_08089774:
	ldrb r2, [r1, #0x14]
	movs r0, #4
	ands r0, r2
	cmp r0, #0
	beq _08089782
	movs r0, #0x57
	b _08089798
_08089782:
	movs r0, #0x20
	ands r0, r2
	cmp r0, #0
	bne _08089796
	movs r0, #0xe
	ldrsb r0, [r1, r0]
	bl GetROMChapterStruct
	ldrb r0, [r0, #0xe]
	b _08089798
_08089796:
	movs r0, #0x55
_08089798:
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8089768

	THUMB_FUNC_START sub_808979C
sub_808979C: @ 0x0808979C
	push {r4, r5, lr}
	adds r4, r0, #0
	cmp r4, #0
	bne _080897AE
	movs r0, #0x54
	b _080897F2
_080897A8:
	adds r0, r1, #0
	adds r0, #0x46
	b _080897F2
_080897AE:
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	bl sub_80BCFDC
	adds r5, r0, #0
	ldrb r1, [r4, #0x14]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	bne _080897CC
	ldr r0, _080897F8  @ gUnknown_03005280
	bl sub_80BD014
	cmp r0, r5
	beq _080897E8
_080897CC:
	movs r1, #0
	ldr r0, _080897FC  @ gUnknown_08206951
	ldrb r0, [r0]
	cmp r1, r0
	bge _080897E8
	ldr r3, _08089800  @ gUnknown_08206948
	adds r2, r0, #0
_080897DA:
	adds r0, r1, r3
	ldrb r0, [r0]
	cmp r5, r0
	beq _080897A8
	adds r1, #1
	cmp r1, r2
	blt _080897DA
_080897E8:
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	bl GetROMChapterStruct
	ldrb r0, [r0, #0xe]
_080897F2:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080897F8: .4byte gUnknown_03005280
_080897FC: .4byte gUnknown_08206951
_08089800: .4byte gUnknown_08206948

	THUMB_FUNC_END sub_808979C

	THUMB_FUNC_START LoadDialogueBoxGfx
LoadDialogueBoxGfx: @ 0x08089804
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	cmp r5, #0
	bne _08089810
	ldr r5, _080898A4  @ 0x06013000
_08089810:
	cmp r6, #0
	bge _08089816
	movs r6, #5
_08089816:
	movs r4, #0xf
	adds r0, r4, #0
	ands r0, r6
	adds r6, r0, #0
	adds r6, #0x10
	ldr r0, _080898A8  @ gUnknown_08A0285C
	movs r2, #0xd8
	lsls r2, r2, #2
	adds r1, r5, r2
	bl CopyDataWithPossibleUncomp
	ldr r0, _080898AC  @ gUnknown_08A02884
	movs r2, #0xec
	lsls r2, r2, #3
	adds r1, r5, r2
	bl CopyDataWithPossibleUncomp
	ldr r0, _080898B0  @ gUnknown_08A028AC
	movs r2, #0xb6
	lsls r2, r2, #4
	adds r1, r5, r2
	bl CopyDataWithPossibleUncomp
	ldr r0, _080898B4  @ gUnknown_08A02914
	movs r2, #0xf6
	lsls r2, r2, #4
	adds r1, r5, r2
	bl CopyDataWithPossibleUncomp
	ldr r0, _080898B8  @ gUnknown_08A02980
	movs r2, #0x9b
	lsls r2, r2, #5
	adds r1, r5, r2
	bl CopyDataWithPossibleUncomp
	ldr r7, _080898BC  @ gUnknown_0203E794
	adds r0, r7, #0
	adds r1, r5, #0
	adds r2, r6, #0
	bl InitSomeOtherGraphicsRelatedStruct
	adds r0, r7, #0
	adds r0, #0x18
	bl Text_Init3
	adds r0, r7, #0
	adds r0, #0x20
	bl Text_Init3
	adds r0, r7, #0
	adds r0, #0x28
	bl Text_Init3
	movs r0, #0
	bl SetFont
	ldr r0, _080898C0  @ gUnknown_0859EF40
	lsls r1, r6, #5
	movs r2, #0x20
	bl CopyToPaletteBuffer
	lsls r0, r5, #0x11
	lsrs r0, r0, #0x16
	ands r6, r4
	lsls r1, r6, #0xc
	adds r0, r0, r1
	strh r0, [r7, #0x30]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080898A4: .4byte 0x06013000
_080898A8: .4byte gUnknown_08A0285C
_080898AC: .4byte gUnknown_08A02884
_080898B0: .4byte gUnknown_08A028AC
_080898B4: .4byte gUnknown_08A02914
_080898B8: .4byte gUnknown_08A02980
_080898BC: .4byte gUnknown_0203E794
_080898C0: .4byte gUnknown_0859EF40

	THUMB_FUNC_END LoadDialogueBoxGfx

	THUMB_FUNC_START sub_80898C4
sub_80898C4: @ 0x080898C4
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	cmp r5, #0
	bne _080898D0
	ldr r5, _08089960  @ 0x06013000
_080898D0:
	cmp r6, #0
	bge _080898D6
	movs r6, #5
_080898D6:
	movs r4, #0xf
	adds r0, r4, #0
	ands r0, r6
	adds r6, r0, #0
	adds r6, #0x10
	ldr r0, _08089964  @ gUnknown_08A0285C
	movs r2, #0xd8
	lsls r2, r2, #2
	adds r1, r5, r2
	bl CopyDataWithPossibleUncomp
	ldr r0, _08089968  @ gUnknown_08A02884
	movs r2, #0xec
	lsls r2, r2, #3
	adds r1, r5, r2
	bl CopyDataWithPossibleUncomp
	ldr r0, _0808996C  @ gUnknown_08A028AC
	movs r2, #0xb6
	lsls r2, r2, #4
	adds r1, r5, r2
	bl CopyDataWithPossibleUncomp
	ldr r0, _08089970  @ gUnknown_08A02914
	movs r2, #0xf6
	lsls r2, r2, #4
	adds r1, r5, r2
	bl CopyDataWithPossibleUncomp
	ldr r0, _08089974  @ gUnknown_08A02980
	movs r2, #0x9b
	lsls r2, r2, #5
	adds r1, r5, r2
	bl CopyDataWithPossibleUncomp
	ldr r7, _08089978  @ gUnknown_0203E794
	adds r0, r7, #0
	adds r1, r5, #0
	adds r2, r6, #0
	bl InitSomeOtherGraphicsRelatedStruct
	adds r0, r7, #0
	adds r0, #0x18
	bl Text_Init3
	adds r0, r7, #0
	adds r0, #0x20
	bl Text_Init3
	adds r1, r7, #0
	adds r1, #0x2c
	movs r0, #0
	strb r0, [r1]
	bl SetFont
	ldr r0, _0808997C  @ gUnknown_0859EF40
	lsls r1, r6, #5
	movs r2, #0x20
	bl CopyToPaletteBuffer
	lsls r0, r5, #0x11
	lsrs r0, r0, #0x16
	ands r6, r4
	lsls r1, r6, #0xc
	adds r0, r0, r1
	strh r0, [r7, #0x30]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08089960: .4byte 0x06013000
_08089964: .4byte gUnknown_08A0285C
_08089968: .4byte gUnknown_08A02884
_0808996C: .4byte gUnknown_08A028AC
_08089970: .4byte gUnknown_08A02914
_08089974: .4byte gUnknown_08A02980
_08089978: .4byte gUnknown_0203E794
_0808997C: .4byte gUnknown_0859EF40

	THUMB_FUNC_END sub_80898C4

	THUMB_FUNC_START sub_8089980
sub_8089980: @ 0x08089980
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x2c
	mov sl, r0
	str r1, [sp, #4]
	adds r7, r2, #0
	mov r9, r3
	adds r0, r7, #7
	movs r1, #0x10
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	movs r0, #0xf
	adds r1, r7, #0
	ands r1, r0
	cmp r7, #0x1f
	bgt _080899AA
	movs r7, #0x20
_080899AA:
	cmp r7, #0xc0
	ble _080899B0
	movs r7, #0xc0
_080899B0:
	mov r0, r9
	cmp r0, #0xf
	bgt _080899BA
	movs r0, #0x10
	mov r9, r0
_080899BA:
	mov r0, r9
	cmp r0, #0x30
	ble _080899C4
	movs r0, #0x30
	mov r9, r0
_080899C4:
	adds r0, r7, #0
	adds r0, #0x1f
	cmp r0, #0
	bge _080899CE
	adds r0, #0x1f
_080899CE:
	asrs r2, r0, #5
	mov r0, r9
	adds r0, #0xf
	cmp r0, #0
	bge _080899DA
	adds r0, #0xf
_080899DA:
	asrs r0, r0, #4
	str r0, [sp, #8]
	lsls r0, r3, #0x18
	lsrs r3, r0, #0x18
	mov r8, r3
	subs r5, r2, #1
	str r0, [sp, #0x1c]
	str r5, [sp, #0x14]
	ldr r0, [sp, #4]
	subs r0, #8
	str r0, [sp, #0x10]
	ldr r3, [sp, #4]
	add r3, r9
	str r3, [sp, #0x28]
	mov r0, sl
	subs r0, #8
	str r0, [sp, #0xc]
	mov r3, sl
	adds r3, r3, r7
	str r3, [sp, #0x24]
	lsls r1, r1, #0x18
	str r1, [sp, #0x20]
	cmp r5, #0
	blt _08089A92
_08089A0A:
	ldr r4, [sp, #8]
	subs r0, r5, #1
	str r0, [sp, #0x18]
	cmp r4, #0
	blt _08089A88
	lsls r6, r4, #6
	mov r1, r8
	lsls r0, r1, #0x18
	asrs r0, r0, #0x18
	mov r8, r0
_08089A1E:
	adds r0, r4, #1
	lsls r2, r0, #4
	cmp r2, r9
	ble _08089A28
	mov r2, r9
_08089A28:
	subs r2, #0x10
	adds r0, r5, #1
	lsls r0, r0, #5
	mov r3, r8
	cmp r3, #0
	beq _08089A5C
	subs r0, #0x20
	mov r3, sl
	adds r1, r3, r0
	ldr r0, [sp, #4]
	adds r2, r0, r2
	ldr r3, _08089A54  @ gUnknown_0203E794
	lsls r0, r5, #2
	ldrh r3, [r3, #0x30]
	adds r0, r0, r3
	adds r0, r0, r6
	str r0, [sp]
	movs r0, #0
	ldr r3, _08089A58  @ gObject_16x16
	bl PutSprite
	b _08089A80
	.align 2, 0
_08089A54: .4byte gUnknown_0203E794
_08089A58: .4byte gObject_16x16
_08089A5C:
	cmp r0, r7
	ble _08089A62
	adds r0, r7, #0
_08089A62:
	subs r0, #0x20
	mov r3, sl
	adds r1, r3, r0
	ldr r0, [sp, #4]
	adds r2, r0, r2
	ldr r3, _08089ADC  @ gUnknown_0203E794
	lsls r0, r5, #2
	ldrh r3, [r3, #0x30]
	adds r0, r0, r3
	adds r0, r0, r6
	str r0, [sp]
	movs r0, #0
	ldr r3, _08089AE0  @ gObject_32x16
	bl PutSprite
_08089A80:
	subs r6, #0x40
	subs r4, #1
	cmp r4, #0
	bge _08089A1E
_08089A88:
	movs r1, #0
	mov r8, r1
	ldr r5, [sp, #0x18]
	cmp r5, #0
	bge _08089A0A
_08089A92:
	ldr r3, [sp, #0x1c]
	lsrs r3, r3, #0x18
	mov r8, r3
	ldr r5, [sp, #0x14]
	cmp r5, #0
	blt _08089B1E
	ldr r6, _08089ADC  @ gUnknown_0203E794
_08089AA0:
	adds r0, r5, #1
	lsls r0, r0, #5
	mov r1, r8
	cmp r1, #0
	beq _08089AE8
	subs r0, #0x20
	mov r3, sl
	adds r4, r3, r0
	ldrh r0, [r6, #0x30]
	adds r0, #0x1b
	str r0, [sp]
	movs r0, #0
	adds r1, r4, #0
	ldr r2, [sp, #0x10]
	ldr r3, _08089AE4  @ gObject_16x8
	bl PutSprite
	ldrh r0, [r6, #0x30]
	adds r0, #0x3b
	str r0, [sp]
	movs r0, #0
	adds r1, r4, #0
	ldr r2, [sp, #0x28]
	ldr r3, _08089AE4  @ gObject_16x8
	bl PutSprite
	movs r0, #0
	mov r8, r0
	b _08089B18
	.align 2, 0
_08089ADC: .4byte gUnknown_0203E794
_08089AE0: .4byte gObject_32x16
_08089AE4: .4byte gObject_16x8
_08089AE8:
	cmp r0, r7
	ble _08089AEE
	adds r0, r7, #0
_08089AEE:
	subs r0, #0x20
	mov r1, sl
	adds r4, r1, r0
	ldrh r0, [r6, #0x30]
	adds r0, #0x1b
	str r0, [sp]
	movs r0, #0
	adds r1, r4, #0
	ldr r2, [sp, #0x10]
	ldr r3, _08089C28  @ gObject_32x8
	bl PutSprite
	ldrh r0, [r6, #0x30]
	adds r0, #0x3b
	str r0, [sp]
	movs r0, #0
	adds r1, r4, #0
	ldr r2, [sp, #0x28]
	ldr r3, _08089C28  @ gObject_32x8
	bl PutSprite
_08089B18:
	subs r5, #1
	cmp r5, #0
	bge _08089AA0
_08089B1E:
	ldr r4, [sp, #8]
	cmp r4, #0
	blt _08089B7C
_08089B24:
	adds r0, r4, #1
	lsls r2, r0, #4
	cmp r2, r9
	ble _08089B2E
	mov r2, r9
_08089B2E:
	subs r2, #0x10
	ldr r3, [sp, #4]
	adds r5, r3, r2
	ldr r7, _08089C2C  @ gObject_8x16
	ldr r6, _08089C30  @ gUnknown_0203E794
	ldrh r0, [r6, #0x30]
	adds r0, #0x5f
	str r0, [sp]
	movs r0, #0
	ldr r1, [sp, #0xc]
	adds r2, r5, #0
	adds r3, r7, #0
	bl PutSprite
	ldrh r0, [r6, #0x30]
	adds r0, #0x1f
	str r0, [sp]
	movs r0, #0
	ldr r1, [sp, #0x24]
	adds r2, r5, #0
	adds r3, r7, #0
	bl PutSprite
	ldr r0, [sp, #0x20]
	cmp r0, #0
	beq _08089B76
	ldrh r0, [r6, #0x30]
	adds r0, #0x1a
	str r0, [sp]
	movs r0, #0
	ldr r1, [sp, #0x24]
	subs r1, #8
	adds r2, r5, #0
	adds r3, r7, #0
	bl PutSprite
_08089B76:
	subs r4, #1
	cmp r4, #0
	bge _08089B24
_08089B7C:
	ldr r6, _08089C34  @ gObject_8x8
	ldr r5, _08089C30  @ gUnknown_0203E794
	ldrh r0, [r5, #0x30]
	adds r0, #0x5b
	str r0, [sp]
	movs r0, #0
	ldr r1, [sp, #0xc]
	ldr r2, [sp, #0x10]
	adds r3, r6, #0
	bl PutSprite
	ldrh r0, [r5, #0x30]
	adds r0, #0x5c
	str r0, [sp]
	movs r0, #0
	ldr r1, [sp, #0x24]
	ldr r2, [sp, #0x10]
	adds r3, r6, #0
	bl PutSprite
	ldrh r0, [r5, #0x30]
	adds r0, #0x5d
	str r0, [sp]
	movs r0, #0
	ldr r1, [sp, #0xc]
	ldr r2, [sp, #0x28]
	adds r3, r6, #0
	bl PutSprite
	ldrh r0, [r5, #0x30]
	adds r0, #0x5e
	str r0, [sp]
	movs r0, #0
	ldr r1, [sp, #0x24]
	ldr r2, [sp, #0x28]
	adds r3, r6, #0
	bl PutSprite
	ldr r1, [sp, #0x20]
	cmp r1, #0
	beq _08089BF6
	ldr r4, [sp, #0x24]
	subs r4, #8
	ldrh r0, [r5, #0x30]
	adds r0, #0x1b
	str r0, [sp]
	movs r0, #0
	adds r1, r4, #0
	ldr r2, [sp, #0x10]
	adds r3, r6, #0
	bl PutSprite
	ldrh r0, [r5, #0x30]
	adds r0, #0x3b
	str r0, [sp]
	movs r0, #0
	adds r1, r4, #0
	ldr r2, [sp, #0x28]
	adds r3, r6, #0
	bl PutSprite
_08089BF6:
	ldr r0, [sp, #0x4c]
	cmp r0, #0
	bne _08089C16
	ldr r2, [sp, #4]
	subs r2, #0xb
	ldr r3, _08089C38  @ gObject_32x16
	ldr r0, _08089C30  @ gUnknown_0203E794
	ldrh r1, [r0, #0x30]
	ldr r0, _08089C3C  @ 0x000003FF
	ands r0, r1
	adds r0, #0x7b
	str r0, [sp]
	movs r0, #0
	mov r1, sl
	bl PutSprite
_08089C16:
	add sp, #0x2c
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08089C28: .4byte gObject_32x8
_08089C2C: .4byte gObject_8x16
_08089C30: .4byte gUnknown_0203E794
_08089C34: .4byte gObject_8x8
_08089C38: .4byte gObject_32x16
_08089C3C: .4byte 0x000003FF

	THUMB_FUNC_END sub_8089980

	THUMB_FUNC_START sub_8089C40
sub_8089C40: @ 0x08089C40
	push {r4, lr}
	ldr r4, _08089CC0  @ gUnknown_0203E7AC
	bl GetItemType
	bl GetWeaponTypeDisplayString
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0
	movs r2, #8
	bl Text_InsertString
	movs r0, #0xa0
	lsls r0, r0, #3
	bl GetStringFromIndex
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x2f
	movs r2, #8
	bl Text_InsertString
	ldr r0, _08089CC4  @ 0x00000502
	bl GetStringFromIndex
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x61
	movs r2, #8
	bl Text_InsertString
	adds r4, #8
	ldr r0, _08089CC8  @ 0x00000503
	bl GetStringFromIndex
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0
	movs r2, #8
	bl Text_InsertString
	ldr r0, _08089CCC  @ 0x000004F4
	bl GetStringFromIndex
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x2f
	movs r2, #8
	bl Text_InsertString
	ldr r0, _08089CD0  @ 0x00000501
	bl GetStringFromIndex
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x61
	movs r2, #8
	bl Text_InsertString
	movs r0, #2
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08089CC0: .4byte gUnknown_0203E7AC
_08089CC4: .4byte 0x00000502
_08089CC8: .4byte 0x00000503
_08089CCC: .4byte 0x000004F4
_08089CD0: .4byte 0x00000501

	THUMB_FUNC_END sub_8089C40

	THUMB_FUNC_START sub_8089CD4
sub_8089CD4: @ 0x08089CD4
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _08089D4C  @ gUnknown_0203E7AC
	bl GetItemDisplayRankString
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x20
	movs r2, #7
	bl Text_InsertString
	adds r0, r5, #0
	bl GetItemDisplayRangeString
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x43
	movs r2, #7
	bl Text_InsertString
	adds r0, r5, #0
	bl GetItemWeight
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x81
	movs r2, #7
	bl Text_InsertNumberOr2Dashes
	adds r4, #8
	adds r0, r5, #0
	bl GetItemMight
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x20
	movs r2, #7
	bl Text_InsertNumberOr2Dashes
	adds r0, r5, #0
	bl GetItemHit
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x51
	movs r2, #7
	bl Text_InsertNumberOr2Dashes
	adds r0, r5, #0
	bl GetItemCrit
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x81
	movs r2, #7
	bl Text_InsertNumberOr2Dashes
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08089D4C: .4byte gUnknown_0203E7AC

	THUMB_FUNC_END sub_8089CD4

	THUMB_FUNC_START sub_8089D50
sub_8089D50: @ 0x08089D50
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _08089DA8  @ gUnknown_0203E7AC
	ldr r0, _08089DAC  @ 0x00000509
	bl GetStringFromIndex
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0
	movs r2, #8
	bl Text_InsertString
	adds r0, r5, #0
	bl GetItemDisplayRankString
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x1e
	movs r2, #7
	bl Text_InsertString
	movs r0, #0xa0
	lsls r0, r0, #3
	bl GetStringFromIndex
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x30
	movs r2, #8
	bl Text_InsertString
	adds r0, r5, #0
	bl GetItemDisplayRangeString
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x46
	movs r2, #7
	bl Text_InsertString
	movs r0, #1
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08089DA8: .4byte gUnknown_0203E7AC
_08089DAC: .4byte 0x00000509

	THUMB_FUNC_END sub_8089D50

	THUMB_FUNC_START sub_8089DB0
sub_8089DB0: @ 0x08089DB0
	push {r4, lr}
	ldr r4, _08089DE0  @ gUnknown_0203E7AC
	ldr r0, _08089DE4  @ 0x00000147
	bl GetStringFromIndex
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0
	movs r2, #8
	bl Text_InsertString
	movs r0, #0xa4
	lsls r0, r0, #1
	bl GetStringFromIndex
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x5a
	movs r2, #8
	bl Text_InsertString
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08089DE0: .4byte gUnknown_0203E7AC
_08089DE4: .4byte 0x00000147

	THUMB_FUNC_END sub_8089DB0

	THUMB_FUNC_START sub_8089DE8
sub_8089DE8: @ 0x08089DE8
	push {r4, lr}
	bl sub_80AA768
	adds r3, r0, #0
	cmp r3, #0
	beq _08089E04
	ldr r0, _08089E00  @ gUnknown_0203E7AC
	movs r1, #0x1a
	movs r2, #7
	bl Text_InsertString
	b _08089E1A
	.align 2, 0
_08089E00: .4byte gUnknown_0203E7AC
_08089E04:
	ldr r4, _08089E30  @ gUnknown_0203E7AC
	movs r0, #0xa7
	lsls r0, r0, #3
	bl GetStringFromIndex
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x1a
	movs r2, #7
	bl Text_InsertString
_08089E1A:
	bl sub_80AA744
	adds r3, r0, #0
	cmp r3, #0
	blt _08089E34
	ldr r0, _08089E30  @ gUnknown_0203E7AC
	movs r1, #0x74
	movs r2, #7
	bl Text_InsertNumberOr2Dashes
	b _08089E48
	.align 2, 0
_08089E30: .4byte gUnknown_0203E7AC
_08089E34:
	ldr r4, _08089E50  @ gUnknown_0203E7AC
	ldr r0, _08089E54  @ 0x00000535
	bl GetStringFromIndex
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x6c
	movs r2, #7
	bl Text_InsertString
_08089E48:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08089E50: .4byte gUnknown_0203E7AC
_08089E54: .4byte 0x00000535

	THUMB_FUNC_END sub_8089DE8

	THUMB_FUNC_START sub_8089E58
sub_8089E58: @ 0x08089E58
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x5e
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	cmp r0, #0
	bgt _08089EE6
	adds r0, r4, #0
	adds r0, #0x60
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r0, [r4, #0x30]
	bl SetFont
	movs r6, #0
	adds r0, r4, #0
	adds r0, #0x62
	movs r2, #0
	ldrsh r1, [r0, r2]
	adds r7, r0, #0
	cmp r6, r1
	bge _08089EE0
	adds r5, r4, #0
	adds r5, #0x5c
_08089E8E:
	ldr r0, [r4, #0x2c]
	ldrb r2, [r0]
	adds r3, r0, #0
	cmp r2, #1
	beq _08089EB0
	cmp r2, #1
	bgt _08089EA2
	cmp r2, #0
	beq _08089EA8
	b _08089EC0
_08089EA2:
	cmp r2, #4
	beq _08089EBC
	b _08089EC0
_08089EA8:
	adds r0, r4, #0
	bl Proc_Break
	b _08089EE0
_08089EB0:
	adds r0, r3, #1
	str r0, [r4, #0x2c]
	ldrh r0, [r5]
	adds r0, #1
	strh r0, [r5]
	b _08089ED6
_08089EBC:
	adds r0, r3, #1
	b _08089ED4
_08089EC0:
	movs r0, #0
	ldrsh r1, [r5, r0]
	lsls r1, r1, #2
	adds r0, r4, #0
	adds r0, #0x34
	adds r0, r0, r1
	ldr r0, [r0]
	adds r1, r3, #0
	bl Text_AppendChar
_08089ED4:
	str r0, [r4, #0x2c]
_08089ED6:
	adds r6, #1
	movs r1, #0
	ldrsh r0, [r7, r1]
	cmp r6, r0
	blt _08089E8E
_08089EE0:
	movs r0, #0
	bl SetFont
_08089EE6:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8089E58

	THUMB_FUNC_START sub_8089EEC
sub_8089EEC: @ 0x08089EEC
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x30]
	bl SetFont
	movs r6, #0
_08089EF8:
	lsls r1, r6, #2
	adds r0, r4, #0
	adds r0, #0x34
	adds r0, r0, r1
	ldr r5, [r0]
	ldrb r0, [r5, #4]
	lsls r0, r0, #3
	ldr r1, [r4, #0x2c]
	bl GetStringTextCenteredPos
	adds r1, r0, #0
	adds r0, r5, #0
	bl Text_SetXCursor
_08089F14:
	ldr r0, [r4, #0x2c]
	ldrb r1, [r0]
	cmp r1, #1
	beq _08089F34
	cmp r1, #1
	bgt _08089F26
	cmp r1, #0
	beq _08089F4C
	b _08089F40
_08089F26:
	cmp r1, #5
	bgt _08089F40
	cmp r1, #4
	blt _08089F40
	adds r0, #1
	str r0, [r4, #0x2c]
	b _08089F14
_08089F34:
	adds r0, #1
	str r0, [r4, #0x2c]
	adds r6, #1
	cmp r6, #5
	ble _08089EF8
	b _08089F4C
_08089F40:
	ldr r1, [r4, #0x2c]
	adds r0, r5, #0
	bl Text_AppendChar
	str r0, [r4, #0x2c]
	b _08089F14
_08089F4C:
	ldr r0, [r4, #0x30]
	bl SetFont
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8089EEC

	THUMB_FUNC_START sub_8089F58
sub_8089F58: @ 0x08089F58
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, [r5, #0x58]
	ldr r0, _08089F80  @ gUnknown_0203E794
	bl SetFont
	movs r0, #0
	bl SetFontGlyphSet
	adds r0, r4, #0
	bl GetHelpBoxItemInfoKind
	adds r1, r0, #0
	cmp r1, #1
	beq _08089F96
	cmp r1, #1
	bgt _08089F84
	cmp r1, #0
	beq _08089F8E
	b _08089FB8
	.align 2, 0
_08089F80: .4byte gUnknown_0203E794
_08089F84:
	cmp r1, #2
	beq _08089FA4
	cmp r1, #3
	beq _08089FAC
	b _08089FB8
_08089F8E:
	adds r0, r5, #0
	adds r0, #0x64
	strh r1, [r0]
	b _08089FB8
_08089F96:
	adds r0, r4, #0
	bl sub_8089C40
	adds r1, r5, #0
	adds r1, #0x64
	movs r0, #2
	b _08089FB6
_08089FA4:
	adds r0, r4, #0
	bl sub_8089D50
	b _08089FB0
_08089FAC:
	bl sub_8089DB0
_08089FB0:
	adds r1, r5, #0
	adds r1, #0x64
	movs r0, #1
_08089FB6:
	strh r0, [r1]
_08089FB8:
	movs r0, #0
	bl SetFont
	adds r0, r5, #0
	bl Proc_Break
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8089F58

	THUMB_FUNC_START sub_8089FCC
sub_8089FCC: @ 0x08089FCC
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, [r5, #0x58]
	ldr r0, _08089FE8  @ gUnknown_0203E794
	bl SetFont
	adds r0, r4, #0
	bl GetHelpBoxItemInfoKind
	cmp r0, #1
	beq _08089FEC
	cmp r0, #3
	beq _08089FF4
	b _08089FF8
	.align 2, 0
_08089FE8: .4byte gUnknown_0203E794
_08089FEC:
	adds r0, r4, #0
	bl sub_8089CD4
	b _08089FF8
_08089FF4:
	bl sub_8089DE8
_08089FF8:
	movs r0, #0
	bl SetFont
	adds r0, r5, #0
	bl Proc_Break
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8089FCC

	THUMB_FUNC_START sub_808A00C
sub_808A00C: @ 0x0808A00C
	push {r4, r5, r6, lr}
	mov r6, sl
	mov r5, r9
	mov r4, r8
	push {r4, r5, r6}
	mov sl, r0
	ldr r5, _0808A0B4  @ gUnknown_0203E794
	adds r0, r5, #0
	bl SetFont
	movs r0, #1
	bl SetFontGlyphSet
	movs r0, #0x18
	adds r0, r0, r5
	mov r9, r0
	movs r1, #6
	bl Text_SetColorId
	movs r1, #0x20
	adds r1, r1, r5
	mov r8, r1
	mov r0, r8
	movs r1, #6
	bl Text_SetColorId
	adds r6, r5, #0
	adds r6, #0x28
	adds r0, r6, #0
	movs r1, #6
	bl Text_SetColorId
	movs r0, #0
	bl SetFont
	ldr r4, _0808A0B8  @ gUnknown_08A01628
	adds r0, r4, #0
	bl Proc_EndEach
	adds r0, r4, #0
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	str r5, [r4, #0x30]
	mov r0, r9
	str r0, [r4, #0x34]
	mov r1, r8
	str r1, [r4, #0x38]
	str r6, [r4, #0x3c]
	mov r0, sl
	adds r0, #0x64
	ldrh r1, [r0]
	adds r0, r4, #0
	adds r0, #0x5c
	movs r5, #0
	strh r1, [r0]
	mov r1, sl
	ldr r0, [r1, #0x5c]
	bl GetStringFromIndex
	bl sub_800A2A4
	str r0, [r4, #0x2c]
	adds r1, r4, #0
	adds r1, #0x62
	movs r3, #1
	strh r3, [r1]
	adds r0, r4, #0
	adds r0, #0x5e
	strh r5, [r0]
	ldr r0, _0808A0BC  @ gRAMChapterData
	adds r0, #0x40
	ldrb r0, [r0]
	lsls r0, r0, #0x19
	lsrs r2, r0, #0x1e
	cmp r2, #1
	beq _0808A0D2
	cmp r2, #1
	bgt _0808A0C0
	cmp r2, #0
	beq _0808A0CA
	b _0808A0EE
	.align 2, 0
_0808A0B4: .4byte gUnknown_0203E794
_0808A0B8: .4byte gUnknown_08A01628
_0808A0BC: .4byte gRAMChapterData
_0808A0C0:
	cmp r2, #2
	beq _0808A0DA
	cmp r2, #3
	beq _0808A0E4
	b _0808A0EE
_0808A0CA:
	adds r1, r4, #0
	adds r1, #0x60
	movs r0, #2
	b _0808A0EC
_0808A0D2:
	adds r0, r4, #0
	adds r0, #0x60
	strh r2, [r0]
	b _0808A0EE
_0808A0DA:
	adds r0, r4, #0
	adds r0, #0x60
	strh r3, [r0]
	strh r2, [r1]
	b _0808A0EE
_0808A0E4:
	adds r0, r4, #0
	adds r0, #0x60
	strh r5, [r0]
	movs r0, #0x7f
_0808A0EC:
	strh r0, [r1]
_0808A0EE:
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_808A00C

	THUMB_FUNC_START sub_808A0FC
sub_808A0FC: @ 0x0808A0FC
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _0808A114  @ gUnknown_08A01650
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x58]
	str r5, [r0, #0x5c]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0808A114: .4byte gUnknown_08A01650

	THUMB_FUNC_END sub_808A0FC

	THUMB_FUNC_START sub_808A118
sub_808A118: @ 0x0808A118
	push {r4, lr}
	ldr r4, _0808A154  @ gUnknown_0203E794
	adds r0, r4, #0
	bl SetFont
	adds r0, r4, #0
	adds r0, #0x18
	bl sub_80045FC
	adds r0, r4, #0
	adds r0, #0x20
	bl sub_80045FC
	adds r4, #0x28
	adds r0, r4, #0
	bl sub_80045FC
	ldr r0, _0808A158  @ gUnknown_08A01628
	bl Proc_EndEach
	ldr r0, _0808A15C  @ gUnknown_08A01650
	bl Proc_EndEach
	movs r0, #0
	bl SetFont
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808A154: .4byte gUnknown_0203E794
_0808A158: .4byte gUnknown_08A01628
_0808A15C: .4byte gUnknown_08A01650

	THUMB_FUNC_END sub_808A118

	THUMB_FUNC_START sub_808A160
sub_808A160: @ 0x0808A160
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r1, #5
	bl UpdateHelpBoxDisplay
	adds r2, r4, #0
	adds r2, #0x48
	adds r4, #0x4a
	ldrh r3, [r2]
	movs r0, #0
	ldrsh r1, [r2, r0]
	movs r5, #0
	ldrsh r0, [r4, r5]
	cmp r1, r0
	bge _0808A182
	adds r0, r3, #1
	strh r0, [r2]
_0808A182:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_808A160

	THUMB_FUNC_START sub_808A188
sub_808A188: @ 0x0808A188
	push {r4, r5, lr}
	adds r4, r0, #0
	bl sub_808A444
	ldr r0, [r4, #0x2c]
	ldrb r1, [r0, #0x10]
	ldrb r2, [r0, #0x11]
	adds r0, r4, #0
	bl sub_808A43C
	adds r5, r4, #0
	adds r5, #0x4a
	movs r1, #0
	ldrsh r0, [r5, r1]
	movs r1, #3
	bl __divsi3
	strh r0, [r5]
	adds r4, #0x48
	strh r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_808A188

	THUMB_FUNC_START sub_808A1B8
sub_808A1B8: @ 0x0808A1B8
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0
	bl UpdateHelpBoxDisplay
	adds r1, r4, #0
	adds r1, #0x48
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _0808A1D8
	adds r0, r4, #0
	bl Proc_Break
_0808A1D8:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_808A1B8

	THUMB_FUNC_START sub_808A1E0
sub_808A1E0: @ 0x0808A1E0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0808A1FC  @ gUnknown_0203E7C8
	movs r3, #0
	strb r4, [r0, #0x10]
	strb r1, [r0, #0x11]
	strh r2, [r0, #0x12]
	str r3, [r0, #0x14]
	str r3, [r0, #0x18]
	bl sub_808A354
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808A1FC: .4byte gUnknown_0203E7C8

	THUMB_FUNC_END sub_808A1E0

	THUMB_FUNC_START sub_808A200
sub_808A200: @ 0x0808A200
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r6, r0, #0
	ldr r4, _0808A244  @ gUnknown_08A01678
	adds r0, r4, #0
	bl Proc_Find
	adds r5, r0, #0
	cmp r5, #0
	bne _0808A24C
	adds r0, r4, #0
	movs r1, #3
	bl Proc_Start
	adds r5, r0, #0
	ldr r0, _0808A248  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0808A230
	movs r0, #0x70
	bl m4aSongNumStart
_0808A230:
	ldrb r1, [r6, #0x10]
	ldrb r2, [r6, #0x11]
	adds r0, r5, #0
	bl sub_808A43C
	adds r0, r5, #0
	bl sub_808A444
	b _0808A268
	.align 2, 0
_0808A244: .4byte gUnknown_08A01678
_0808A248: .4byte gRAMChapterData
_0808A24C:
	ldrh r0, [r5, #0x30]
	strh r0, [r5, #0x38]
	ldrh r0, [r5, #0x32]
	strh r0, [r5, #0x3a]
	adds r0, r5, #0
	adds r0, #0x44
	ldrh r1, [r0]
	subs r0, #4
	strh r1, [r0]
	adds r0, #6
	ldrh r0, [r0]
	adds r1, r5, #0
	adds r1, #0x42
	strh r0, [r1]
_0808A268:
	str r6, [r5, #0x2c]
	adds r1, r5, #0
	adds r1, #0x48
	movs r0, #0
	strh r0, [r1]
	adds r1, #2
	movs r0, #0xc
	strh r0, [r1]
	ldrh r0, [r6, #0x12]
	adds r4, r5, #0
	adds r4, #0x4c
	strh r0, [r4]
	movs r0, #1
	bl SetFontGlyphSet
	ldrh r0, [r4]
	bl GetStringFromIndex
	add r2, sp, #4
	mov r1, sp
	bl sub_8003FAC
	movs r0, #0
	bl SetFontGlyphSet
	ldr r1, [sp]
	ldr r2, [sp, #4]
	adds r0, r5, #0
	bl sub_808A384
	ldrb r1, [r6, #0x10]
	ldrb r2, [r6, #0x11]
	adds r0, r5, #0
	bl sub_808A3C4
	bl sub_808A118
	adds r0, r5, #0
	adds r0, #0x4e
	ldrh r0, [r0]
	ldrh r1, [r4]
	bl sub_808A0FC
	ldr r0, _0808A2CC  @ gUnknown_0203E7E4
	str r6, [r0]
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0808A2CC: .4byte gUnknown_0203E7E4

	THUMB_FUNC_END sub_808A200

	THUMB_FUNC_START sub_808A2D0
sub_808A2D0: @ 0x0808A2D0
	push {lr}
	ldr r0, _0808A2F4  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0808A2E4
	movs r0, #0x71
	bl m4aSongNumStart
_0808A2E4:
	bl sub_808A118
	ldr r0, _0808A2F8  @ gUnknown_08A01678
	bl Proc_BreakEach
	pop {r0}
	bx r0
	.align 2, 0
_0808A2F4: .4byte gRAMChapterData
_0808A2F8: .4byte gUnknown_08A01678

	THUMB_FUNC_END sub_808A2D0

	THUMB_FUNC_START sub_808A2FC
sub_808A2FC: @ 0x0808A2FC
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x50
	movs r1, #0
	strh r1, [r0]
	ldr r0, [r4, #0x2c]
	ldr r1, [r0, #0x14]
	cmp r1, #0
	beq _0808A314
	adds r0, r4, #0
	bl _call_via_r1
_0808A314:
	ldr r0, [r4, #0x2c]
	bl sub_808A200
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_808A2FC

	THUMB_FUNC_START sub_808A320
sub_808A320: @ 0x0808A320
	push {lr}
	adds r2, r0, #0
	ldr r0, _0808A33C  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0808A338
	adds r0, r2, #0
	bl Proc_Break
_0808A338:
	pop {r0}
	bx r0
	.align 2, 0
_0808A33C: .4byte gKeyStatusPtr

	THUMB_FUNC_END sub_808A320

	THUMB_FUNC_START sub_808A340
sub_808A340: @ 0x0808A340
	push {r4, lr}
	adds r4, r0, #0
	bl sub_808A2D0
	adds r0, r4, #0
	bl Proc_End
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_808A340

	THUMB_FUNC_START sub_808A354
sub_808A354: @ 0x0808A354
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0808A368  @ gUnknown_08A01698
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x2c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808A368: .4byte gUnknown_08A01698

	THUMB_FUNC_END sub_808A354

	THUMB_FUNC_START sub_808A36C
sub_808A36C: @ 0x0808A36C
	push {lr}
	ldr r0, _0808A380  @ gUnknown_08A01698
	bl Proc_Find
	cmp r0, #0
	beq _0808A37A
	movs r0, #1
_0808A37A:
	pop {r1}
	bx r1
	.align 2, 0
_0808A380: .4byte gUnknown_08A01698

	THUMB_FUNC_END sub_808A36C

	THUMB_FUNC_START sub_808A384
sub_808A384: @ 0x0808A384
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	adds r4, #0x1f
	movs r0, #0xe0
	ands r4, r0
	adds r0, r6, #0
	adds r0, #0x4e
	ldrh r0, [r0]
	bl sub_808A454
	cmp r0, #1
	beq _0808A3A6
	cmp r0, #2
	beq _0808A3AC
	b _0808A3B4
_0808A3A6:
	movs r4, #0xa0
	adds r5, #0x20
	b _0808A3B4
_0808A3AC:
	cmp r4, #0x5f
	bgt _0808A3B2
	movs r4, #0x60
_0808A3B2:
	adds r5, #0x10
_0808A3B4:
	adds r0, r6, #0
	adds r0, #0x44
	strh r4, [r0]
	adds r0, #2
	strh r5, [r0]
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_808A384

	THUMB_FUNC_START sub_808A3C4
sub_808A3C4: @ 0x0808A3C4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	adds r4, r1, #0
	mov r8, r2
	adds r0, #0x44
	movs r1, #0
	ldrsh r0, [r0, r1]
	adds r6, r0, #0
	adds r6, #0x10
	adds r0, r5, #0
	adds r0, #0x46
	movs r1, #0
	ldrsh r0, [r0, r1]
	adds r7, r0, #0
	adds r7, #0x10
	adds r0, r6, #0
	movs r1, #6
	bl __divsi3
	adds r0, #0x10
	subs r4, r4, r0
	strh r4, [r5, #0x3c]
	lsls r4, r4, #0x10
	cmp r4, #0
	bge _0808A3FE
	movs r0, #0
	strh r0, [r5, #0x3c]
_0808A3FE:
	movs r1, #0x3c
	ldrsh r0, [r5, r1]
	adds r0, r0, r6
	cmp r0, #0xf0
	ble _0808A40E
	movs r0, #0xf0
	subs r0, r0, r6
	strh r0, [r5, #0x3c]
_0808A40E:
	mov r0, r8
	adds r0, #0x10
	strh r0, [r5, #0x3e]
	movs r1, #0x3e
	ldrsh r0, [r5, r1]
	adds r0, r0, r7
	cmp r0, #0xa0
	ble _0808A424
	mov r1, r8
	subs r0, r1, r7
	strh r0, [r5, #0x3e]
_0808A424:
	ldrh r0, [r5, #0x3c]
	adds r0, #8
	strh r0, [r5, #0x3c]
	ldrh r0, [r5, #0x3e]
	adds r0, #8
	strh r0, [r5, #0x3e]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_808A3C4

	THUMB_FUNC_START sub_808A43C
sub_808A43C: @ 0x0808A43C
	strh r1, [r0, #0x38]
	strh r2, [r0, #0x3a]
	bx lr

	THUMB_FUNC_END sub_808A43C

	THUMB_FUNC_START sub_808A444
sub_808A444: @ 0x0808A444
	adds r2, r0, #0
	adds r2, #0x40
	movs r1, #0x20
	strh r1, [r2]
	adds r0, #0x42
	movs r1, #0x10
	strh r1, [r0]
	bx lr

	THUMB_FUNC_END sub_808A444

	THUMB_FUNC_START sub_808A454
sub_808A454: @ 0x0808A454
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0808A464  @ 0x0000FFFE
	cmp r4, r0
	bne _0808A468
	movs r0, #3
	b _0808A49E
	.align 2, 0
_0808A464: .4byte 0x0000FFFE
_0808A468:
	adds r0, r4, #0
	bl GetItemAttributes
	movs r1, #0x80
	lsls r1, r1, #3
	ands r1, r0
	cmp r1, #0
	bne _0808A498
	adds r0, r4, #0
	bl GetItemAttributes
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	beq _0808A48A
	movs r0, #1
	b _0808A49E
_0808A48A:
	adds r0, r4, #0
	bl GetItemAttributes
	movs r1, #4
	ands r1, r0
	cmp r1, #0
	bne _0808A49C
_0808A498:
	movs r0, #0
	b _0808A49E
_0808A49C:
	movs r0, #2
_0808A49E:
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_808A454

	THUMB_FUNC_START sub_808A4A4
sub_808A4A4: @ 0x0808A4A4
	push {lr}
	adds r2, r0, #0
	ldr r0, _0808A4C0  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0808A4BC
	adds r0, r2, #0
	bl Proc_Break
_0808A4BC:
	pop {r0}
	bx r0
	.align 2, 0
_0808A4C0: .4byte gKeyStatusPtr

	THUMB_FUNC_END sub_808A4A4

	THUMB_FUNC_START sub_808A4C4
sub_808A4C4: @ 0x0808A4C4
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	movs r1, #1
	negs r1, r1
	movs r0, #0
	bl LoadDialogueBoxGfx
	bl GetUiHandPrevDisplayX
	adds r4, r0, #0
	bl GetUiHandPrevDisplayY
	adds r1, r0, #0
	adds r0, r4, #0
	adds r2, r5, #0
	bl sub_808A1E0
	ldr r0, _0808A4F8  @ gUnknown_08A016C8
	adds r1, r6, #0
	bl Proc_StartBlocking
	movs r0, #1
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0808A4F8: .4byte gUnknown_08A016C8

	THUMB_FUNC_END sub_808A4C4

	THUMB_FUNC_START sub_808A4FC
sub_808A4FC: @ 0x0808A4FC
	push {lr}
	ldr r0, _0808A50C  @ gUnknown_08A016E0
	bl Proc_Find
	cmp r0, #0
	bne _0808A510
	movs r0, #0
	b _0808A512
	.align 2, 0
_0808A50C: .4byte gUnknown_08A016E0
_0808A510:
	movs r0, #1
_0808A512:
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_808A4FC

	THUMB_FUNC_START sub_808A518
sub_808A518: @ 0x0808A518
	ldr r1, _0808A520  @ gUnknown_0203E7E8
	adds r1, #0x42
	strh r0, [r1]
	bx lr
	.align 2, 0
_0808A520: .4byte gUnknown_0203E7E8

	THUMB_FUNC_END sub_808A518

	THUMB_FUNC_START sub_808A524
sub_808A524: @ 0x0808A524
	ldr r0, _0808A52C  @ gUnknown_0203E7E8
	adds r0, #0x42
	ldrh r0, [r0]
	bx lr
	.align 2, 0
_0808A52C: .4byte gUnknown_0203E7E8

	THUMB_FUNC_END sub_808A524

	THUMB_FUNC_START sub_808A530
sub_808A530: @ 0x0808A530
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	mov r9, r0
	ldr r3, _0808A590  @ gUnknown_0203E7E8
	adds r0, r3, #0
	adds r0, #0x40
	ldrh r2, [r0]
	ldr r0, _0808A594  @ 0x000003FF
	ands r0, r2
	ldrh r3, [r3, #0x18]
	adds r0, r0, r3
	lsls r0, r0, #5
	ldr r2, _0808A598  @ 0x06010000
	adds r5, r0, r2
	movs r7, #0
	lsls r0, r1, #1
	cmp r7, r0
	bge _0808A5C2
	adds r3, r0, #0
_0808A55C:
	adds r4, r5, #0
	movs r2, #0
	adds r0, r7, #1
	mov r8, r0
	cmp r2, r9
	bge _0808A5B6
_0808A568:
	adds r6, r2, #1
	movs r1, #6
_0808A56C:
	ldr r0, [r4, #4]
	stm r4!, {r0}
	subs r1, #1
	cmp r1, #0
	bge _0808A56C
	subs r0, r3, #1
	cmp r7, r0
	bne _0808A5A4
	str r3, [sp]
	bl sub_808A524
	movs r1, #1
	ands r1, r0
	ldr r3, [sp]
	cmp r1, #0
	bne _0808A5A0
	ldr r0, _0808A59C  @ 0x44444444
	b _0808A5AE
	.align 2, 0
_0808A590: .4byte gUnknown_0203E7E8
_0808A594: .4byte 0x000003FF
_0808A598: .4byte 0x06010000
_0808A59C: .4byte 0x44444444
_0808A5A0:
	movs r0, #0
	b _0808A5AE
_0808A5A4:
	adds r0, r2, #0
	adds r0, #0x20
	lsls r0, r0, #5
	adds r0, r0, r5
	ldr r0, [r0]
_0808A5AE:
	stm r4!, {r0}
	adds r2, r6, #0
	cmp r2, r9
	blt _0808A568
_0808A5B6:
	movs r2, #0x80
	lsls r2, r2, #3
	adds r5, r5, r2
	mov r7, r8
	cmp r7, r3
	blt _0808A55C
_0808A5C2:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_808A530

	THUMB_FUNC_START sub_808A5D0
sub_808A5D0: @ 0x0808A5D0
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	cmp r5, #0
	bne _0808A5DC
	ldr r5, _0808A634  @ 0x06013000
_0808A5DC:
	cmp r6, #0
	bge _0808A5E2
	movs r6, #5
_0808A5E2:
	movs r0, #0xf
	ands r0, r6
	adds r6, r0, #0
	adds r6, #0x10
	bl sub_808A524
	movs r1, #0x10
	ands r1, r0
	cmp r1, #0
	beq _0808A64C
	ldr r0, _0808A638  @ gUnknown_08A029A8
	movs r2, #0xd8
	lsls r2, r2, #2
	adds r1, r5, r2
	bl CopyDataWithPossibleUncomp
	ldr r0, _0808A63C  @ gUnknown_08A02A1C
	movs r2, #0xec
	lsls r2, r2, #3
	adds r1, r5, r2
	bl CopyDataWithPossibleUncomp
	ldr r0, _0808A640  @ gUnknown_08A02A94
	movs r2, #0xb6
	lsls r2, r2, #4
	adds r1, r5, r2
	bl CopyDataWithPossibleUncomp
	ldr r0, _0808A644  @ gUnknown_08A02B3C
	movs r2, #0xf8
	lsls r2, r2, #4
	adds r1, r5, r2
	bl CopyDataWithPossibleUncomp
	ldr r0, _0808A648  @ gUnknown_08A02BAC
	movs r2, #0x9c
	lsls r2, r2, #5
	adds r1, r5, r2
	bl CopyDataWithPossibleUncomp
	b _0808A688
	.align 2, 0
_0808A634: .4byte 0x06013000
_0808A638: .4byte gUnknown_08A029A8
_0808A63C: .4byte gUnknown_08A02A1C
_0808A640: .4byte gUnknown_08A02A94
_0808A644: .4byte gUnknown_08A02B3C
_0808A648: .4byte gUnknown_08A02BAC
_0808A64C:
	ldr r0, _0808A6FC  @ gUnknown_08A0285C
	movs r2, #0xd8
	lsls r2, r2, #2
	adds r1, r5, r2
	bl CopyDataWithPossibleUncomp
	ldr r0, _0808A700  @ gUnknown_08A02884
	movs r2, #0xec
	lsls r2, r2, #3
	adds r1, r5, r2
	bl CopyDataWithPossibleUncomp
	ldr r0, _0808A704  @ gUnknown_08A028AC
	movs r2, #0xb6
	lsls r2, r2, #4
	adds r1, r5, r2
	bl CopyDataWithPossibleUncomp
	ldr r0, _0808A708  @ gUnknown_08A02914
	movs r2, #0xf6
	lsls r2, r2, #4
	adds r1, r5, r2
	bl CopyDataWithPossibleUncomp
	ldr r0, _0808A70C  @ gUnknown_08A02980
	movs r2, #0x9b
	lsls r2, r2, #5
	adds r1, r5, r2
	bl CopyDataWithPossibleUncomp
_0808A688:
	bl sub_8006A98
	bl sub_808A524
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	bne _0808A728
	ldr r4, _0808A710  @ gUnknown_0203E7E8
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r6, #0
	bl InitSomeOtherGraphicsRelatedStruct
	adds r0, r4, #0
	adds r0, #0x18
	bl Text_Init3
	adds r0, r4, #0
	adds r0, #0x20
	bl Text_Init3
	adds r0, r4, #0
	adds r0, #0x28
	bl Text_Init3
	bl sub_808A524
	movs r1, #0x10
	ands r1, r0
	cmp r1, #0
	beq _0808A6E4
	bl sub_808A524
	movs r1, #0x20
	ands r1, r0
	cmp r1, #0
	bne _0808A6E4
	adds r0, r4, #0
	adds r0, #0x30
	bl Text_Init3
	adds r0, r4, #0
	adds r0, #0x38
	bl Text_Init3
_0808A6E4:
	movs r0, #0
	bl SetFont
	bl sub_808A524
	movs r1, #0x10
	ands r1, r0
	cmp r1, #0
	beq _0808A718
	ldr r0, _0808A714  @ gUnknown_0859EF80
	b _0808A71A
	.align 2, 0
_0808A6FC: .4byte gUnknown_08A0285C
_0808A700: .4byte gUnknown_08A02884
_0808A704: .4byte gUnknown_08A028AC
_0808A708: .4byte gUnknown_08A02914
_0808A70C: .4byte gUnknown_08A02980
_0808A710: .4byte gUnknown_0203E7E8
_0808A714: .4byte gUnknown_0859EF80
_0808A718:
	ldr r0, _0808A724  @ gUnknown_0859EF60
_0808A71A:
	lsls r1, r6, #5
	movs r2, #0x20
	bl CopyToPaletteBuffer
	b _0808A764
	.align 2, 0
_0808A724: .4byte gUnknown_0859EF60
_0808A728:
	ldr r0, _0808A738  @ gUnknown_0203E7E8
	adds r1, r5, #0
	adds r2, r6, #0
	bl InitSomeOtherGraphicsRelatedStruct
	movs r4, #0
	lsls r7, r6, #5
	b _0808A748
	.align 2, 0
_0808A738: .4byte gUnknown_0203E7E8
_0808A73C:
	lsls r0, r4, #3
	ldr r1, _0808A79C  @ gUnknown_0203E800
	adds r0, r0, r1
	bl Text_Init3
	adds r4, #1
_0808A748:
	bl sub_808A524
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x18
	cmp r4, r0
	blt _0808A73C
	movs r0, #0
	bl SetFont
	ldr r0, _0808A7A0  @ gUnknown_0859EF00
	adds r1, r7, #0
	movs r2, #0x20
	bl CopyToPaletteBuffer
_0808A764:
	ldr r2, _0808A7A4  @ gUnknown_0203E7E8
	lsls r1, r5, #0x11
	lsrs r1, r1, #0x16
	movs r0, #0xf
	ands r0, r6
	lsls r0, r0, #0xc
	adds r1, r1, r0
	adds r2, #0x40
	strh r1, [r2]
	bl sub_808A524
	movs r1, #0x10
	ands r1, r0
	cmp r1, #0
	beq _0808A794
	ldr r0, _0808A7A8  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0808A794
	ldr r0, _0808A7AC  @ 0x000002E6
	bl m4aSongNumStart
_0808A794:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808A79C: .4byte gUnknown_0203E800
_0808A7A0: .4byte gUnknown_0859EF00
_0808A7A4: .4byte gUnknown_0203E7E8
_0808A7A8: .4byte gRAMChapterData
_0808A7AC: .4byte 0x000002E6

	THUMB_FUNC_END sub_808A5D0

	THUMB_FUNC_START sub_808A7B0
sub_808A7B0: @ 0x0808A7B0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	adds r0, #0x46
	movs r1, #0
	ldrsh r0, [r0, r1]
	adds r0, #0x10
	mov r8, r0
	adds r1, r4, #0
	adds r1, #0x44
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, #0xbf
	ble _0808A7D6
	movs r0, #0xc0
	strh r0, [r1]
_0808A7D6:
	movs r2, #0
	ldrsh r0, [r1, r2]
	adds r7, r0, #0
	adds r7, #0x10
	bl sub_808A524
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	bne _0808A828
	strh r5, [r4, #0x3c]
	adds r0, r6, #0
	adds r0, #8
	strh r0, [r4, #0x3e]
	bl sub_808A524
	movs r1, #0x40
	ands r1, r0
	cmp r1, #0
	bne _0808A820
	movs r1, #0x3c
	ldrsh r0, [r4, r1]
	adds r0, r0, r7
	cmp r0, #0xf0
	ble _0808A80E
	movs r0, #0xf0
	subs r0, r0, r7
	strh r0, [r4, #0x3c]
_0808A80E:
	movs r2, #0x3e
	ldrsh r0, [r4, r2]
	add r0, r8
	cmp r0, #0xa0
	ble _0808A820
	movs r0, #0x98
	mov r1, r8
	subs r0, r0, r1
	strh r0, [r4, #0x3e]
_0808A820:
	ldrh r0, [r4, #0x3c]
	adds r0, #8
	strh r0, [r4, #0x3c]
	b _0808A82C
_0808A828:
	strh r5, [r4, #0x3c]
	strh r6, [r4, #0x3e]
_0808A82C:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_808A7B0

	THUMB_FUNC_START sub_808A838
sub_808A838: @ 0x0808A838
	movs r3, #0xf8
	ands r3, r1
	adds r1, r0, #0
	adds r1, #0x44
	strh r3, [r1]
	adds r0, #0x46
	strh r2, [r0]
	bx lr

	THUMB_FUNC_END sub_808A838

	THUMB_FUNC_START sub_808A848
sub_808A848: @ 0x0808A848
	push {r4, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x40
	ldrb r0, [r1]
	cmp r0, #0xff
	bne _0808A862
	movs r1, #1
	negs r1, r1
	movs r0, #0
	bl sub_808A5D0
	b _0808A86A
_0808A862:
	ldr r0, [r4, #0x3c]
	ldrb r1, [r1]
	bl sub_808A5D0
_0808A86A:
	ldr r0, [r4, #0x2c]
	ldr r1, [r4, #0x30]
	ldr r2, [r4, #0x34]
	bl sub_808AC0C
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_808A848

	THUMB_FUNC_START sub_808A87C
sub_808A87C: @ 0x0808A87C
	push {r4, lr}
	adds r4, r0, #0
	bl sub_808A524
	movs r1, #0x82
	ands r1, r0
	cmp r1, #0
	bne _0808A8A2
	ldr r0, _0808A8A8  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0xa
	ands r0, r1
	cmp r0, #0
	beq _0808A8A2
	adds r0, r4, #0
	movs r1, #2
	bl Proc_Goto
_0808A8A2:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808A8A8: .4byte gKeyStatusPtr

	THUMB_FUNC_END sub_808A87C

	THUMB_FUNC_START sub_808A8AC
sub_808A8AC: @ 0x0808A8AC
	push {lr}
	bl sub_808A524
	movs r1, #0x10
	ands r1, r0
	cmp r1, #0
	beq _0808A8CC
	ldr r0, _0808A8DC  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0808A8CC
	ldr r0, _0808A8E0  @ 0x000002E7
	bl m4aSongNumStart
_0808A8CC:
	movs r0, #0
	bl SetFontGlyphSet
	bl sub_808A9F0
	pop {r0}
	bx r0
	.align 2, 0
_0808A8DC: .4byte gRAMChapterData
_0808A8E0: .4byte 0x000002E7

	THUMB_FUNC_END sub_808A8AC

	THUMB_FUNC_START sub_808A8E4
sub_808A8E4: @ 0x0808A8E4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r7, r0, #0
	adds r5, r1, #0
	movs r1, #0x3c
	ldrsh r0, [r7, r1]
	mov r8, r0
	movs r3, #0x3e
	ldrsh r2, [r7, r3]
	mov r9, r2
	adds r0, r7, #0
	adds r0, #0x40
	movs r4, #0
	ldrsh r1, [r0, r4]
	adds r0, #4
	movs r6, #0
	ldrsh r2, [r0, r6]
	adds r4, r7, #0
	adds r4, #0x48
	movs r3, #0
	ldrsh r0, [r4, r3]
	mov ip, r0
	movs r6, #0x4a
	adds r6, r6, r7
	mov sl, r6
	movs r3, #0
	ldrsh r0, [r6, r3]
	str r0, [sp]
	adds r0, r5, #0
	mov r3, ip
	bl sub_8012DCC
	str r0, [sp, #4]
	adds r0, r7, #0
	adds r0, #0x42
	movs r6, #0
	ldrsh r1, [r0, r6]
	adds r0, #4
	movs r3, #0
	ldrsh r2, [r0, r3]
	movs r6, #0
	ldrsh r3, [r4, r6]
	mov r4, sl
	movs r6, #0
	ldrsh r0, [r4, r6]
	str r0, [sp]
	adds r0, r5, #0
	bl sub_8012DCC
	adds r3, r0, #0
	mov r0, r8
	strh r0, [r7, #0x30]
	mov r1, r9
	strh r1, [r7, #0x32]
	mov r0, r8
	mov r1, r9
	ldr r2, [sp, #4]
	bl sub_808ACFC
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_808A8E4

	THUMB_FUNC_START sub_808A974
sub_808A974: @ 0x0808A974
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r1, #5
	bl sub_808A8E4
	adds r2, r4, #0
	adds r2, #0x48
	adds r4, #0x4a
	ldrh r3, [r2]
	movs r0, #0
	ldrsh r1, [r2, r0]
	movs r5, #0
	ldrsh r0, [r4, r5]
	cmp r1, r0
	bge _0808A996
	adds r0, r3, #1
	strh r0, [r2]
_0808A996:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_808A974

	THUMB_FUNC_START sub_808A99C
sub_808A99C: @ 0x0808A99C
	push {r4, r5, lr}
	adds r4, r0, #0
	bl ResetHelpBoxInitSize
	adds r5, r4, #0
	adds r5, #0x4a
	movs r1, #0
	ldrsh r0, [r5, r1]
	movs r1, #3
	bl __divsi3
	strh r0, [r5]
	adds r4, #0x48
	strh r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_808A99C

	THUMB_FUNC_START sub_808A9C0
sub_808A9C0: @ 0x0808A9C0
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0
	bl sub_808A8E4
	adds r1, r4, #0
	adds r1, #0x48
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _0808A9E6
	adds r0, r4, #0
	bl Proc_Break
	ldr r0, _0808A9EC  @ gUnknown_08A01818
	bl Proc_EndEach
_0808A9E6:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808A9EC: .4byte gUnknown_08A01818

	THUMB_FUNC_END sub_808A9C0

	THUMB_FUNC_START sub_808A9F0
sub_808A9F0: @ 0x0808A9F0
	push {lr}
	bl sub_808BAA4
	ldr r0, _0808AA00  @ gUnknown_08A01740
	bl Proc_BreakEach
	pop {r0}
	bx r0
	.align 2, 0
_0808AA00: .4byte gUnknown_08A01740

	THUMB_FUNC_END sub_808A9F0

	THUMB_FUNC_START sub_808AA04
sub_808AA04: @ 0x0808AA04
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	adds r7, r1, #0
	mov r8, r2
	adds r5, r3, #0
	ldr r4, _0808AA30  @ gUnknown_08A016E0
	adds r0, r4, #0
	bl Proc_EndEach
	movs r0, #0
	bl sub_808A518
	cmp r5, #0
	bne _0808AA34
	adds r0, r4, #0
	movs r1, #3
	bl Proc_Start
	b _0808AA3C
	.align 2, 0
_0808AA30: .4byte gUnknown_08A016E0
_0808AA34:
	adds r0, r4, #0
	adds r1, r5, #0
	bl Proc_StartBlocking
_0808AA3C:
	adds r2, r0, #0
	str r6, [r2, #0x2c]
	str r7, [r2, #0x30]
	mov r0, r8
	str r0, [r2, #0x34]
	adds r1, r2, #0
	adds r1, #0x40
	movs r0, #0xff
	strb r0, [r1]
	subs r1, #8
	movs r0, #1
	strb r0, [r1]
	ldr r0, _0808AA68  @ gUnknown_08A01818
	movs r1, #0
	bl Proc_Start
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808AA68: .4byte gUnknown_08A01818

	THUMB_FUNC_END sub_808AA04

	THUMB_FUNC_START sub_808AA6C
sub_808AA6C: @ 0x0808AA6C
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	adds r6, r0, #0
	adds r7, r1, #0
	mov r8, r2
	mov r9, r3
	ldr r5, [sp, #0x20]
	ldr r4, _0808AA9C  @ gUnknown_08A016E0
	adds r0, r4, #0
	bl Proc_EndEach
	movs r0, #0
	bl sub_808A518
	cmp r5, #0
	bne _0808AAA0
	adds r0, r4, #0
	movs r1, #3
	bl Proc_Start
	b _0808AAA8
	.align 2, 0
_0808AA9C: .4byte gUnknown_08A016E0
_0808AAA0:
	adds r0, r4, #0
	adds r1, r5, #0
	bl Proc_StartBlocking
_0808AAA8:
	adds r2, r0, #0
	str r6, [r2, #0x2c]
	str r7, [r2, #0x30]
	mov r0, r8
	str r0, [r2, #0x34]
	adds r1, r2, #0
	adds r1, #0x40
	ldr r0, [sp, #0x1c]
	strb r0, [r1]
	mov r0, r9
	str r0, [r2, #0x3c]
	subs r1, #8
	movs r0, #1
	strb r0, [r1]
	ldr r0, _0808AAD8  @ gUnknown_08A01818
	movs r1, #0
	bl Proc_Start
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808AAD8: .4byte gUnknown_08A01818

	THUMB_FUNC_END sub_808AA6C

	THUMB_FUNC_START sub_808AADC
sub_808AADC: @ 0x0808AADC
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r3, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	movs r7, #0
	movs r6, #0x10
	str r7, [r4]
	str r7, [r5]
_0808AAEE:
	ldrb r0, [r3]
	cmp r0, #7
	bgt _0808AB10
	cmp r0, #4
	bge _0808AB38
	cmp r0, #1
	beq _0808AB2C
	cmp r0, #1
	bgt _0808AB06
	cmp r0, #0
	beq _0808AB6E
	b _0808AB80
_0808AB06:
	cmp r0, #2
	beq _0808AB3C
	cmp r0, #3
	beq _0808AB52
	b _0808AB80
_0808AB10:
	cmp r0, #0x19
	ble _0808AB1A
	cmp r0, #0x80
	beq _0808AB28
	b _0808AB80
_0808AB1A:
	cmp r0, #0x18
	bge _0808AB36
	cmp r0, #0x14
	bgt _0808AB80
	cmp r0, #0x12
	blt _0808AB80
	b _0808AB6E
_0808AB28:
	adds r3, #2
	b _0808AAEE
_0808AB2C:
	adds r6, #0x10
	ldr r0, [r4]
	cmp r0, r7
	bge _0808AB36
	str r7, [r4]
_0808AB36:
	movs r7, #0
_0808AB38:
	adds r3, #1
	b _0808AAEE
_0808AB3C:
	adds r3, #1
	ldr r0, [r5]
	cmp r0, r6
	bge _0808AB46
	str r6, [r5]
_0808AB46:
	movs r6, #0
	ldr r0, [r4]
	cmp r0, r7
	bge _0808AB6A
	str r7, [r4]
	b _0808AB6A
_0808AB52:
	adds r3, #1
	ldr r0, [r5]
	cmp r0, r6
	bge _0808AB5C
	str r6, [r5]
_0808AB5C:
	movs r6, #0
	adds r1, r7, #0
	adds r1, #8
	ldr r0, [r4]
	cmp r0, r1
	bge _0808AB6A
	str r1, [r4]
_0808AB6A:
	movs r7, #0
	b _0808AAEE
_0808AB6E:
	ldr r0, [r4]
	cmp r0, r7
	bge _0808AB76
	str r7, [r4]
_0808AB76:
	ldr r0, [r5]
	cmp r0, r6
	bge _0808AB90
	str r6, [r5]
	b _0808AB90
_0808AB80:
	adds r0, r3, #0
	mov r1, sp
	bl GetCharTextWidth
	adds r3, r0, #0
	ldr r0, [sp]
	adds r7, r7, r0
	b _0808AAEE
_0808AB90:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_808AADC

	THUMB_FUNC_START sub_808AB98
sub_808AB98: @ 0x0808AB98
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r1, #0
	movs r5, #0
	adds r4, r0, #0
	strb r5, [r6]
	movs r0, #1
	bl SetFontGlyphSet
_0808ABAA:
	ldrb r0, [r4]
	cmp r0, #7
	bgt _0808ABCC
	cmp r0, #4
	bge _0808ABE2
	cmp r0, #1
	beq _0808ABE6
	cmp r0, #1
	bgt _0808ABC2
	cmp r0, #0
	beq _0808AC00
	b _0808ABF0
_0808ABC2:
	cmp r0, #2
	beq _0808ABE2
	cmp r0, #3
	beq _0808AC00
	b _0808ABF0
_0808ABCC:
	cmp r0, #0x19
	ble _0808ABD6
	cmp r0, #0x80
	beq _0808ABEC
	b _0808ABF0
_0808ABD6:
	cmp r0, #0x18
	bge _0808ABE6
	cmp r0, #0x14
	bgt _0808ABF0
	cmp r0, #0x12
	blt _0808ABF0
_0808ABE2:
	adds r4, #1
	b _0808ABAA
_0808ABE6:
	adds r4, #1
	movs r5, #0
	b _0808ABAA
_0808ABEC:
	adds r4, #2
	b _0808ABAA
_0808ABF0:
	adds r0, r4, #0
	mov r1, sp
	bl GetCharTextWidth
	adds r4, r0, #0
	ldr r0, [sp]
	adds r5, r5, r0
	b _0808ABAA
_0808AC00:
	adds r0, r5, #2
	strb r0, [r6]
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_808AB98

	THUMB_FUNC_START sub_808AC0C
sub_808AC0C: @ 0x0808AC0C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	adds r6, r0, #0
	adds r7, r1, #0
	mov r8, r2
	movs r5, #0
	str r5, [sp]
	str r5, [sp, #4]
	ldr r4, _0808AC5C  @ gUnknown_08A01740
	adds r0, r4, #0
	bl Proc_EndEach
	adds r0, r4, #0
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	adds r1, r6, #0
	adds r2, r7, #0
	bl SetHelpBoxInitPosition
	adds r0, r4, #0
	bl ResetHelpBoxInitSize
	str r5, [r4, #0x2c]
	adds r0, r4, #0
	adds r0, #0x48
	strh r5, [r0]
	bl sub_808A524
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	beq _0808AC60
	adds r0, r4, #0
	adds r0, #0x4a
	strh r5, [r0]
	b _0808AC68
	.align 2, 0
_0808AC5C: .4byte gUnknown_08A01740
_0808AC60:
	adds r1, r4, #0
	adds r1, #0x4a
	movs r0, #0xc
	strh r0, [r1]
_0808AC68:
	adds r1, r4, #0
	adds r1, #0x4e
	movs r0, #0
	strh r0, [r1]
	adds r5, r4, #0
	adds r5, #0x4c
	mov r0, r8
	strh r0, [r5]
	movs r0, #1
	bl SetFontGlyphSet
	ldrh r0, [r5]
	bl GetStringFromIndex
	bl sub_800A2A4
	add r2, sp, #4
	mov r1, sp
	bl sub_808AADC
	movs r0, #0
	bl SetFontGlyphSet
	ldr r1, [sp]
	ldr r2, [sp, #4]
	adds r0, r4, #0
	bl sub_808A838
	bl sub_808A524
	movs r1, #0x80
	lsls r1, r1, #1
	ands r1, r0
	cmp r1, #0
	beq _0808ACD6
	adds r0, r4, #0
	adds r0, #0x44
	movs r2, #0
	ldrsh r1, [r0, r2]
	movs r0, #0xd8
	subs r0, r0, r1
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	adds r6, r6, r0
	adds r0, r4, #0
	adds r0, #0x46
	movs r2, #0
	ldrsh r1, [r0, r2]
	movs r0, #0x90
	subs r0, r0, r1
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	adds r7, r7, r0
_0808ACD6:
	adds r0, r4, #0
	adds r1, r6, #0
	adds r2, r7, #0
	bl sub_808A7B0
	bl sub_808BAA4
	ldrh r0, [r5]
	ldr r1, [sp]
	ldr r2, [sp, #4]
	bl sub_808BA60
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_808AC0C

	THUMB_FUNC_START sub_808ACFC
sub_808ACFC: @ 0x0808ACFC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x28
	str r0, [sp, #4]
	str r1, [sp, #8]
	adds r4, r2, #0
	mov r8, r3
	mov r0, r8
	asrs r0, r0, #5
	str r0, [sp, #0x14]
	cmp r4, #0x1f
	bgt _0808AD1C
	movs r4, #0x20
_0808AD1C:
	cmp r4, #0xc0
	ble _0808AD22
	movs r4, #0xc0
_0808AD22:
	mov r1, r8
	cmp r1, #0xf
	bgt _0808AD2C
	movs r2, #0x10
	mov r8, r2
_0808AD2C:
	mov r3, r8
	cmp r3, #0x50
	ble _0808AD36
	movs r0, #0x50
	mov r8, r0
_0808AD36:
	bl sub_808A524
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	beq _0808AD44
	b _0808B020
_0808AD44:
	mov r0, r8
	adds r0, #0xf
	cmp r0, #0
	bge _0808AD4E
	adds r0, #0xf
_0808AD4E:
	asrs r0, r0, #4
	str r0, [sp, #0x10]
	adds r0, r4, #7
	cmp r0, #0
	bge _0808AD5A
	adds r0, #7
_0808AD5A:
	asrs r0, r0, #3
	adds r1, r0, #1
	str r1, [sp, #0xc]
	movs r7, #0
	subs r0, #3
	ldr r2, [sp, #8]
	subs r2, #8
	str r2, [sp, #0x24]
	ldr r3, [sp, #8]
	add r3, r8
	str r3, [sp, #0x1c]
	ldr r1, [sp, #4]
	subs r1, #8
	str r1, [sp, #0x20]
	cmp r7, r0
	bge _0808ADBE
	mov sl, r0
_0808AD7C:
	lsls r6, r7, #3
	ldr r5, [sp, #0x10]
	adds r4, r7, #4
	cmp r5, #0
	blt _0808ADB8
	ldr r2, _0808AE04  @ gUnknown_0203E828
	mov r9, r2
_0808AD8A:
	adds r0, r5, #1
	lsls r0, r0, #4
	cmp r0, r8
	ble _0808AD94
	mov r0, r8
_0808AD94:
	subs r0, #0x10
	ldr r3, [sp, #8]
	adds r2, r3, r0
	mov r1, r9
	ldrh r0, [r1]
	adds r0, r0, r7
	lsls r1, r5, #6
	adds r0, r0, r1
	str r0, [sp]
	movs r0, #2
	ldr r3, [sp, #4]
	adds r1, r3, r6
	ldr r3, _0808AE08  @ gObject_32x16
	bl PutSprite
	subs r5, #1
	cmp r5, #0
	bge _0808AD8A
_0808ADB8:
	adds r7, r4, #0
	cmp r7, sl
	blt _0808AD7C
_0808ADBE:
	ldr r0, [sp, #0xc]
	cmp r7, r0
	bge _0808AE40
	subs r0, #2
	mov sl, r0
_0808ADC8:
	lsls r6, r7, #3
	ldr r5, [sp, #0x10]
	cmp r5, #0
	blt _0808AE32
	ldr r1, _0808AE04  @ gUnknown_0203E828
	mov r9, r1
	lsls r4, r5, #6
_0808ADD6:
	adds r0, r5, #1
	lsls r0, r0, #4
	cmp r0, r8
	ble _0808ADE0
	mov r0, r8
_0808ADE0:
	subs r0, #0x10
	cmp r7, sl
	bge _0808AE10
	ldr r3, [sp, #8]
	adds r2, r3, r0
	mov r1, r9
	ldrh r0, [r1]
	adds r0, r0, r7
	adds r0, r0, r4
	str r0, [sp]
	movs r0, #2
	ldr r3, [sp, #4]
	adds r1, r3, r6
	ldr r3, _0808AE0C  @ gObject_16x16
	bl PutSprite
	b _0808AE2A
	.align 2, 0
_0808AE04: .4byte gUnknown_0203E828
_0808AE08: .4byte gObject_32x16
_0808AE0C: .4byte gObject_16x16
_0808AE10:
	ldr r1, [sp, #8]
	adds r2, r1, r0
	mov r3, r9
	ldrh r0, [r3]
	adds r0, r0, r7
	adds r0, r0, r4
	str r0, [sp]
	movs r0, #2
	ldr r3, [sp, #4]
	adds r1, r3, r6
	ldr r3, _0808AEAC  @ gObject_8x16
	bl PutSprite
_0808AE2A:
	subs r4, #0x40
	subs r5, #1
	cmp r5, #0
	bge _0808ADD6
_0808AE32:
	cmp r7, sl
	bge _0808AE38
	adds r7, #1
_0808AE38:
	adds r7, #1
	ldr r0, [sp, #0xc]
	cmp r7, r0
	blt _0808ADC8
_0808AE40:
	movs r7, #0
	ldr r1, [sp, #0xc]
	cmp r7, r1
	bge _0808AEEC
	ldr r2, _0808AEB0  @ gUnknown_0203E7E8
	str r2, [sp, #0x18]
_0808AE4C:
	lsls r6, r7, #3
	ldr r0, [sp, #0xc]
	subs r0, #2
	cmp r7, r0
	bge _0808AEB8
	ldr r3, [sp, #4]
	adds r3, r3, r6
	mov r9, r3
	ldr r0, [sp, #0x18]
	adds r0, #0x40
	mov sl, r0
	ldrh r5, [r0]
	adds r6, r5, #0
	adds r6, #0x1b
	adds r4, r7, #6
	adds r0, r4, #0
	movs r1, #0xa
	bl __modsi3
	cmp r0, #0
	bne _0808AE78
	adds r6, #2
_0808AE78:
	str r6, [sp]
	movs r0, #2
	mov r1, r9
	ldr r2, [sp, #0x24]
	ldr r3, _0808AEB4  @ gObject_16x8
	bl PutSprite
	mov r2, sl
	ldrh r1, [r2]
	adds r2, r1, #0
	adds r2, #0x3b
	movs r0, #7
	ands r4, r0
	cmp r4, #0
	bne _0808AE98
	adds r2, #2
_0808AE98:
	str r2, [sp]
	movs r0, #2
	mov r1, r9
	ldr r2, [sp, #0x1c]
	ldr r3, _0808AEB4  @ gObject_16x8
	bl PutSprite
	adds r7, #1
	b _0808AEE4
	.align 2, 0
_0808AEAC: .4byte gObject_8x16
_0808AEB0: .4byte gUnknown_0203E7E8
_0808AEB4: .4byte gObject_16x8
_0808AEB8:
	ldr r3, [sp, #4]
	adds r4, r3, r6
	ldr r1, _0808AF60  @ gUnknown_0203E828
	ldrh r0, [r1]
	adds r0, #0x1b
	str r0, [sp]
	movs r0, #2
	adds r1, r4, #0
	ldr r2, [sp, #0x24]
	ldr r3, _0808AF64  @ gObject_8x8
	bl PutSprite
	ldr r2, _0808AF60  @ gUnknown_0203E828
	ldrh r0, [r2]
	adds r0, #0x3b
	str r0, [sp]
	movs r0, #2
	adds r1, r4, #0
	ldr r2, [sp, #0x1c]
	ldr r3, _0808AF64  @ gObject_8x8
	bl PutSprite
_0808AEE4:
	adds r7, #1
	ldr r3, [sp, #0xc]
	cmp r7, r3
	blt _0808AE4C
_0808AEEC:
	bl sub_808A524
	movs r1, #0x10
	ands r1, r0
	cmp r1, #0
	beq _0808AF70
	ldr r5, [sp, #0x10]
	lsls r7, r7, #3
	mov r9, r7
	cmp r5, #0
	blt _0808AFBA
_0808AF02:
	adds r0, r5, #1
	lsls r0, r0, #4
	cmp r0, r8
	ble _0808AF0C
	mov r0, r8
_0808AF0C:
	subs r0, #0x10
	ldr r1, [sp, #8]
	adds r4, r1, r0
	ldr r6, _0808AF68  @ gObject_8x16
	ldr r0, _0808AF6C  @ gUnknown_0203E7E8
	adds r7, r0, #0
	adds r7, #0x40
	ldrh r2, [r7]
	movs r0, #1
	ands r0, r5
	adds r1, r2, #0
	adds r1, #0x5f
	cmp r0, #0
	beq _0808AF2A
	adds r1, #0x20
_0808AF2A:
	str r1, [sp]
	movs r0, #2
	ldr r1, [sp, #0x20]
	adds r2, r4, #0
	adds r3, r6, #0
	bl PutSprite
	ldr r1, [sp, #4]
	add r1, r9
	ldrh r0, [r7]
	adds r2, r0, #0
	adds r2, #0x1f
	ldr r3, [sp, #0x14]
	cmp r5, r3
	bne _0808AF4A
	adds r2, #0x5f
_0808AF4A:
	str r2, [sp]
	movs r0, #2
	adds r2, r4, #0
	adds r3, r6, #0
	bl PutSprite
	subs r5, #1
	cmp r5, #0
	bge _0808AF02
	b _0808AFBA
	.align 2, 0
_0808AF60: .4byte gUnknown_0203E828
_0808AF64: .4byte gObject_8x8
_0808AF68: .4byte gObject_8x16
_0808AF6C: .4byte gUnknown_0203E7E8
_0808AF70:
	ldr r5, [sp, #0x10]
	lsls r7, r7, #3
	mov r9, r7
	cmp r5, #0
	blt _0808AFBA
	ldr r6, _0808B010  @ gObject_8x16
	ldr r7, _0808B014  @ gUnknown_0203E828
_0808AF7E:
	adds r0, r5, #1
	lsls r0, r0, #4
	cmp r0, r8
	ble _0808AF88
	mov r0, r8
_0808AF88:
	subs r0, #0x10
	ldr r1, [sp, #8]
	adds r4, r1, r0
	ldrh r0, [r7]
	adds r0, #0x5f
	str r0, [sp]
	movs r0, #2
	ldr r1, [sp, #0x20]
	adds r2, r4, #0
	adds r3, r6, #0
	bl PutSprite
	ldrh r0, [r7]
	adds r0, #0x1f
	str r0, [sp]
	movs r0, #2
	ldr r1, [sp, #4]
	add r1, r9
	adds r2, r4, #0
	adds r3, r6, #0
	bl PutSprite
	subs r5, #1
	cmp r5, #0
	bge _0808AF7E
_0808AFBA:
	ldr r5, _0808B018  @ gObject_8x8
	ldr r4, _0808B01C  @ gUnknown_0203E7E8
	adds r4, #0x40
	ldrh r0, [r4]
	adds r0, #0x5b
	str r0, [sp]
	movs r0, #2
	ldr r1, [sp, #0x20]
	ldr r2, [sp, #0x24]
	adds r3, r5, #0
	bl PutSprite
	ldr r6, [sp, #4]
	add r6, r9
	ldrh r0, [r4]
	adds r0, #0x5c
	str r0, [sp]
	movs r0, #2
	adds r1, r6, #0
	ldr r2, [sp, #0x24]
	adds r3, r5, #0
	bl PutSprite
	ldrh r0, [r4]
	adds r0, #0x5d
	str r0, [sp]
	movs r0, #2
	ldr r1, [sp, #0x20]
	ldr r2, [sp, #0x1c]
	adds r3, r5, #0
	bl PutSprite
	ldrh r0, [r4]
	adds r0, #0x5e
	str r0, [sp]
	movs r0, #2
	adds r1, r6, #0
	ldr r2, [sp, #0x1c]
	adds r3, r5, #0
	bl PutSprite
	b _0808B082
	.align 2, 0
_0808B010: .4byte gObject_8x16
_0808B014: .4byte gUnknown_0203E828
_0808B018: .4byte gObject_8x8
_0808B01C: .4byte gUnknown_0203E7E8
_0808B020:
	adds r0, r4, #0
	adds r0, #0x1f
	cmp r0, #0
	bge _0808B02A
	adds r0, #0x1f
_0808B02A:
	asrs r0, r0, #5
	str r0, [sp, #0xc]
	bl sub_808A524
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x18
	subs r0, #1
	str r0, [sp, #0x10]
	ldr r7, [sp, #0xc]
	subs r7, #1
	cmp r7, #0
	blt _0808B082
_0808B042:
	ldr r5, [sp, #0x10]
	subs r2, r7, #1
	mov r8, r2
	cmp r5, #0
	blt _0808B07C
	lsls r6, r7, #5
	ldr r3, _0808B094  @ gUnknown_0203E828
	mov r9, r3
	lsls r0, r5, #4
	ldr r1, [sp, #8]
	adds r4, r0, r1
_0808B058:
	lsls r0, r7, #2
	mov r2, r9
	ldrh r2, [r2]
	adds r0, r0, r2
	lsls r1, r5, #6
	adds r0, r0, r1
	str r0, [sp]
	movs r0, #2
	ldr r3, [sp, #4]
	adds r1, r3, r6
	adds r2, r4, #0
	ldr r3, _0808B098  @ gObject_32x16
	bl PutSprite
	subs r4, #0x10
	subs r5, #1
	cmp r5, #0
	bge _0808B058
_0808B07C:
	mov r7, r8
	cmp r7, #0
	bge _0808B042
_0808B082:
	add sp, #0x28
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808B094: .4byte gUnknown_0203E828
_0808B098: .4byte gObject_32x16

	THUMB_FUNC_END sub_808ACFC

	THUMB_FUNC_START sub_808B09C
sub_808B09C: @ 0x0808B09C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0808B0D0  @ gUnknown_08A01740
	bl Proc_Find
	adds r2, r4, #0
	adds r2, #0x59
	movs r1, #0
	strb r1, [r2]
	ldrh r1, [r0, #0x30]
	subs r1, #8
	subs r2, #9
	strb r1, [r2]
	ldrh r0, [r0, #0x32]
	subs r0, #8
	adds r1, r4, #0
	adds r1, #0x51
	strb r0, [r1]
	ldr r0, [r4, #0x2c]
	adds r1, #1
	bl sub_808AB98
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808B0D0: .4byte gUnknown_08A01740

	THUMB_FUNC_END sub_808B09C

	THUMB_FUNC_START sub_808B0D4
sub_808B0D4: @ 0x0808B0D4
	push {lr}
	bl sub_808A524
	movs r1, #4
	ands r1, r0
	cmp r1, #0
	beq _0808B0F4
	movs r0, #0
	bl sub_80057A8
	movs r1, #0x11
	negs r1, r1
	ands r1, r0
	movs r0, #0
	bl sub_800578C
_0808B0F4:
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_808B0D4

	THUMB_FUNC_START sub_808B0F8
sub_808B0F8: @ 0x0808B0F8
	push {lr}
	bl sub_808A524
	movs r1, #4
	ands r1, r0
	cmp r1, #0
	beq _0808B116
	movs r0, #0
	bl sub_80057A8
	movs r1, #0x10
	orrs r1, r0
	movs r0, #0
	bl sub_800578C
_0808B116:
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_808B0F8

	THUMB_FUNC_START sub_808B11C
sub_808B11C: @ 0x0808B11C
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _0808B174  @ gUnknown_0203E800
	adds r0, r4, #0
	bl sub_80045FC
	adds r0, r4, #0
	adds r0, #8
	bl sub_80045FC
	adds r0, r4, #0
	adds r0, #0x10
	bl sub_80045FC
	bl sub_808A524
	movs r1, #0x10
	ands r1, r0
	cmp r1, #0
	beq _0808B160
	bl sub_808A524
	movs r1, #0x20
	ands r1, r0
	cmp r1, #0
	bne _0808B160
	adds r0, r4, #0
	adds r0, #0x18
	bl sub_80045FC
	adds r0, r4, #0
	adds r0, #0x20
	bl sub_80045FC
_0808B160:
	adds r0, r5, #0
	adds r0, #0x58
	movs r1, #0
	strb r1, [r0]
	subs r0, #0x10
	strh r1, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0808B174: .4byte gUnknown_0203E800

	THUMB_FUNC_END sub_808B11C

	THUMB_FUNC_START sub_808B178
sub_808B178: @ 0x0808B178
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x14
	adds r6, r0, #0
	adds r0, #0x4e
	movs r2, #0
	ldrsh r1, [r0, r2]
	mov r8, r1
	ldr r0, _0808B1AC  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0xf3
	ands r0, r1
	cmp r0, #0
	beq _0808B200
	bl sub_808A524
	movs r1, #8
	ands r1, r0
	cmp r1, #0
	bne _0808B200
	movs r3, #0x80
	mov r8, r3
	b _0808B21A
	.align 2, 0
_0808B1AC: .4byte gKeyStatusPtr
_0808B1B0:
	bl sub_808B0D4
	ldr r0, _0808B1D0  @ gUnknown_08A016E0
	bl Proc_Find
	movs r1, #1
	bl Proc_Goto
	adds r0, r6, #0
	movs r1, #1
	bl Proc_Goto
	ldr r0, _0808B1D4  @ gUnknown_08A01818
	bl Proc_EndEach
	b _0808B4C0
	.align 2, 0
_0808B1D0: .4byte gUnknown_08A016E0
_0808B1D4: .4byte gUnknown_08A01818
_0808B1D8:
	adds r0, r1, #1
	str r0, [r6, #0x2c]
	b _0808B772
_0808B1DE:
	adds r1, r6, #0
	adds r1, #0x58
	movs r0, #0
	strb r0, [r1]
	adds r0, r6, #0
	movs r1, #4
	bl Proc_Goto
	b _0808B772
_0808B1F0:
	adds r0, r6, #0
	bl Proc_Break
	b _0808B772
_0808B1F8:
	adds r0, r6, #0
	bl sub_808B11C
	b _0808B772
_0808B200:
	adds r1, r6, #0
	adds r1, #0x4a
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	cmp r0, #0
	ble _0808B212
	b _0808B778
_0808B212:
	adds r0, r6, #0
	adds r0, #0x4c
	ldrh r0, [r0]
	strh r0, [r1]
_0808B21A:
	bl sub_808B0F8
	ldr r0, [r6, #0x30]
	bl SetFont
	movs r7, #0
	cmp r7, r8
	blt _0808B22C
	b _0808B772
_0808B22C:
	ldr r0, [r6, #0x2c]
	ldrb r1, [r0]
	adds r2, r0, #0
	cmp r1, #0x80
	bls _0808B238
	b _0808B6A8
_0808B238:
	lsls r0, r1, #2
	ldr r1, _0808B244  @ _0808B248
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0808B244: .4byte _0808B248
_0808B248: @ jump table
	.4byte _0808B56C @ case 0
	.4byte _0808B572 @ case 1
	.4byte _0808B5EA @ case 2
	.4byte _0808B664 @ case 3
	.4byte _0808B59A @ case 4
	.4byte _0808B5AE @ case 5
	.4byte _0808B5C2 @ case 6
	.4byte _0808B5D6 @ case 7
	.4byte _0808B6A8 @ case 8
	.4byte _0808B6A8 @ case 9
	.4byte _0808B6A8 @ case 10
	.4byte _0808B6A8 @ case 11
	.4byte _0808B6A8 @ case 12
	.4byte _0808B6A8 @ case 13
	.4byte _0808B6A8 @ case 14
	.4byte _0808B6A8 @ case 15
	.4byte _0808B6A8 @ case 16
	.4byte _0808B6A8 @ case 17
	.4byte _0808B4FE @ case 18
	.4byte _0808B4FE @ case 19
	.4byte _0808B4FE @ case 20
	.4byte _0808B6A8 @ case 21
	.4byte _0808B6A8 @ case 22
	.4byte _0808B6A8 @ case 23
	.4byte _0808B44C @ case 24
	.4byte _0808B488 @ case 25
	.4byte _0808B6A8 @ case 26
	.4byte _0808B6A8 @ case 27
	.4byte _0808B6A8 @ case 28
	.4byte _0808B6A8 @ case 29
	.4byte _0808B6A8 @ case 30
	.4byte _0808B6A8 @ case 31
	.4byte _0808B6A8 @ case 32
	.4byte _0808B6A8 @ case 33
	.4byte _0808B6A8 @ case 34
	.4byte _0808B6A8 @ case 35
	.4byte _0808B6A8 @ case 36
	.4byte _0808B6A8 @ case 37
	.4byte _0808B6A8 @ case 38
	.4byte _0808B6A8 @ case 39
	.4byte _0808B6A8 @ case 40
	.4byte _0808B6A8 @ case 41
	.4byte _0808B6A8 @ case 42
	.4byte _0808B6A8 @ case 43
	.4byte _0808B6A8 @ case 44
	.4byte _0808B6A8 @ case 45
	.4byte _0808B6A8 @ case 46
	.4byte _0808B6A8 @ case 47
	.4byte _0808B6A8 @ case 48
	.4byte _0808B6A8 @ case 49
	.4byte _0808B6A8 @ case 50
	.4byte _0808B6A8 @ case 51
	.4byte _0808B6A8 @ case 52
	.4byte _0808B6A8 @ case 53
	.4byte _0808B6A8 @ case 54
	.4byte _0808B6A8 @ case 55
	.4byte _0808B6A8 @ case 56
	.4byte _0808B6A8 @ case 57
	.4byte _0808B6A8 @ case 58
	.4byte _0808B6A8 @ case 59
	.4byte _0808B6A8 @ case 60
	.4byte _0808B6A8 @ case 61
	.4byte _0808B6A8 @ case 62
	.4byte _0808B6A8 @ case 63
	.4byte _0808B6A8 @ case 64
	.4byte _0808B6A8 @ case 65
	.4byte _0808B6A8 @ case 66
	.4byte _0808B6A8 @ case 67
	.4byte _0808B6A8 @ case 68
	.4byte _0808B6A8 @ case 69
	.4byte _0808B6A8 @ case 70
	.4byte _0808B6A8 @ case 71
	.4byte _0808B6A8 @ case 72
	.4byte _0808B6A8 @ case 73
	.4byte _0808B6A8 @ case 74
	.4byte _0808B6A8 @ case 75
	.4byte _0808B6A8 @ case 76
	.4byte _0808B6A8 @ case 77
	.4byte _0808B6A8 @ case 78
	.4byte _0808B6A8 @ case 79
	.4byte _0808B6A8 @ case 80
	.4byte _0808B6A8 @ case 81
	.4byte _0808B6A8 @ case 82
	.4byte _0808B6A8 @ case 83
	.4byte _0808B6A8 @ case 84
	.4byte _0808B6A8 @ case 85
	.4byte _0808B6A8 @ case 86
	.4byte _0808B6A8 @ case 87
	.4byte _0808B6A8 @ case 88
	.4byte _0808B6A8 @ case 89
	.4byte _0808B6A8 @ case 90
	.4byte _0808B6A8 @ case 91
	.4byte _0808B6A8 @ case 92
	.4byte _0808B6A8 @ case 93
	.4byte _0808B6A8 @ case 94
	.4byte _0808B6A8 @ case 95
	.4byte _0808B6A8 @ case 96
	.4byte _0808B6A8 @ case 97
	.4byte _0808B6A8 @ case 98
	.4byte _0808B6A8 @ case 99
	.4byte _0808B6A8 @ case 100
	.4byte _0808B6A8 @ case 101
	.4byte _0808B6A8 @ case 102
	.4byte _0808B6A8 @ case 103
	.4byte _0808B6A8 @ case 104
	.4byte _0808B6A8 @ case 105
	.4byte _0808B6A8 @ case 106
	.4byte _0808B6A8 @ case 107
	.4byte _0808B6A8 @ case 108
	.4byte _0808B6A8 @ case 109
	.4byte _0808B6A8 @ case 110
	.4byte _0808B6A8 @ case 111
	.4byte _0808B6A8 @ case 112
	.4byte _0808B6A8 @ case 113
	.4byte _0808B6A8 @ case 114
	.4byte _0808B6A8 @ case 115
	.4byte _0808B6A8 @ case 116
	.4byte _0808B6A8 @ case 117
	.4byte _0808B6A8 @ case 118
	.4byte _0808B6A8 @ case 119
	.4byte _0808B6A8 @ case 120
	.4byte _0808B6A8 @ case 121
	.4byte _0808B6A8 @ case 122
	.4byte _0808B6A8 @ case 123
	.4byte _0808B6A8 @ case 124
	.4byte _0808B6A8 @ case 125
	.4byte _0808B6A8 @ case 126
	.4byte _0808B6A8 @ case 127
	.4byte _0808B4D0 @ case 128
_0808B44C:
	bl sub_808B0D4
	ldr r0, _0808B480  @ gUnknown_08A01740
	bl Proc_Find
	adds r3, r0, #0
	ldr r0, _0808B484  @ gUnknown_08A016D8
	adds r1, r6, #0
	adds r1, #0x48
	movs r5, #0
	ldrsh r4, [r1, r5]
	lsls r2, r4, #2
	subs r1, #0x14
	adds r1, r1, r2
	ldr r1, [r1]
	movs r5, #0x3c
	ldrsh r2, [r3, r5]
	movs r5, #0x3e
	ldrsh r3, [r3, r5]
	lsls r4, r4, #4
	adds r3, r3, r4
	movs r4, #6
	str r4, [sp]
	movs r4, #1
	b _0808B4B8
	.align 2, 0
_0808B480: .4byte gUnknown_08A01740
_0808B484: .4byte gUnknown_08A016D8
_0808B488:
	bl sub_808B0D4
	ldr r0, _0808B4C8  @ gUnknown_08A01740
	bl Proc_Find
	adds r3, r0, #0
	ldr r0, _0808B4CC  @ gUnknown_08A016D8
	adds r1, r6, #0
	adds r1, #0x48
	movs r2, #0
	ldrsh r4, [r1, r2]
	lsls r2, r4, #2
	subs r1, #0x14
	adds r1, r1, r2
	ldr r1, [r1]
	movs r5, #0x3c
	ldrsh r2, [r3, r5]
	movs r5, #0x3e
	ldrsh r3, [r3, r5]
	lsls r4, r4, #4
	adds r3, r3, r4
	movs r4, #6
	str r4, [sp]
	movs r4, #2
_0808B4B8:
	str r4, [sp, #4]
	str r6, [sp, #8]
	bl sub_80900EC
_0808B4C0:
	ldr r0, [r6, #0x2c]
	adds r0, #1
	str r0, [r6, #0x2c]
	b _0808B772
	.align 2, 0
_0808B4C8: .4byte gUnknown_08A01740
_0808B4CC: .4byte gUnknown_08A016D8
_0808B4D0:
	adds r1, r2, #1
	str r1, [r6, #0x2c]
	ldrb r0, [r2, #1]
	cmp r0, #0x21
	bne _0808B4F2
	adds r2, r6, #0
	adds r2, #0x59
	ldrb r0, [r2]
	adds r0, #1
	movs r1, #1
	ands r0, r1
	strb r0, [r2]
	ldr r0, [r6, #0x2c]
	adds r0, #1
	str r0, [r6, #0x2c]
	subs r7, #1
	b _0808B76A
_0808B4F2:
	cmp r0, #4
	bne _0808B4F8
	b _0808B1B0
_0808B4F8:
	cmp r0, #0x25
	bne _0808B4FE
	b _0808B1D8
_0808B4FE:
	ldr r0, _0808B568  @ gUnknown_08A01740
	bl Proc_Find
	adds r4, r0, #0
	bl sub_808B0D4
	ldr r0, [r6, #0x2c]
	adds r1, r0, #1
	str r1, [r6, #0x2c]
	ldrb r0, [r0, #1]
	cmp r0, #1
	bne _0808B51A
	adds r0, r1, #1
	str r0, [r6, #0x2c]
_0808B51A:
	cmp r4, #0
	bne _0808B520
	b _0808B772
_0808B520:
	adds r0, r6, #0
	bl sub_808B11C
	ldr r0, [r6, #0x2c]
	add r2, sp, #0x10
	add r1, sp, #0xc
	bl sub_808AADC
	ldr r0, [sp, #0xc]
	adds r1, r6, #0
	adds r1, #0x56
	movs r2, #0
	strb r0, [r1]
	ldr r0, [sp, #0x10]
	adds r1, #1
	strb r0, [r1]
	adds r0, r4, #0
	adds r0, #0x44
	ldrh r1, [r0]
	adds r0, r6, #0
	adds r0, #0x54
	strb r1, [r0]
	adds r0, r4, #0
	adds r0, #0x46
	ldrh r0, [r0]
	adds r1, r6, #0
	adds r1, #0x55
	strb r0, [r1]
	adds r0, r6, #0
	adds r0, #0x58
	strb r2, [r0]
	adds r0, r6, #0
	movs r1, #6
	bl Proc_Goto
	b _0808B772
	.align 2, 0
_0808B568: .4byte gUnknown_08A01740
_0808B56C:
	bl sub_808B0D4
	b _0808B606
_0808B572:
	bl sub_808B0D4
	ldr r0, [r6, #0x2c]
	adds r0, #1
	str r0, [r6, #0x2c]
	adds r0, r6, #0
	adds r0, #0x55
	ldrb r1, [r0]
	adds r2, r6, #0
	adds r2, #0x48
	movs r3, #0
	ldrsh r0, [r2, r3]
	adds r0, #1
	cmp r1, r0
	bne _0808B592
	b _0808B1DE
_0808B592:
	ldrh r0, [r2]
	adds r0, #1
	strh r0, [r2]
	b _0808B76A
_0808B59A:
	bl sub_808B0D4
	ldr r0, [r6, #0x2c]
	adds r0, #1
	str r0, [r6, #0x2c]
	adds r1, r6, #0
	adds r1, #0x4a
	movs r0, #8
	strh r0, [r1]
	b _0808B772
_0808B5AE:
	bl sub_808B0D4
	ldr r0, [r6, #0x2c]
	adds r0, #1
	str r0, [r6, #0x2c]
	adds r1, r6, #0
	adds r1, #0x4a
	movs r0, #0x10
	strh r0, [r1]
	b _0808B772
_0808B5C2:
	bl sub_808B0D4
	ldr r0, [r6, #0x2c]
	adds r0, #1
	str r0, [r6, #0x2c]
	adds r1, r6, #0
	adds r1, #0x4a
	movs r0, #0x20
	strh r0, [r1]
	b _0808B772
_0808B5D6:
	bl sub_808B0D4
	ldr r0, [r6, #0x2c]
	adds r0, #1
	str r0, [r6, #0x2c]
	adds r1, r6, #0
	adds r1, #0x4a
	movs r0, #0x40
	strh r0, [r1]
	b _0808B772
_0808B5EA:
	bl sub_808B0D4
	ldr r0, [r6, #0x2c]
	adds r1, r0, #1
	str r1, [r6, #0x2c]
	ldrb r0, [r0, #1]
	cmp r0, #1
	bne _0808B5FE
	adds r0, r1, #1
	str r0, [r6, #0x2c]
_0808B5FE:
	ldr r0, [r6, #0x2c]
	ldrb r0, [r0]
	cmp r0, #0
	bne _0808B638
_0808B606:
	bl sub_808A524
	movs r1, #2
	ands r1, r0
	cmp r1, #0
	bne _0808B614
	b _0808B1F0
_0808B614:
	ldr r0, _0808B630  @ gUnknown_08A016E0
	bl Proc_Find
	movs r1, #1
	bl Proc_Goto
	adds r0, r6, #0
	movs r1, #1
	bl Proc_Goto
	ldr r0, _0808B634  @ gUnknown_08A01818
	bl Proc_EndEach
	b _0808B772
	.align 2, 0
_0808B630: .4byte gUnknown_08A016E0
_0808B634: .4byte gUnknown_08A01818
_0808B638:
	bl sub_808A524
	movs r1, #0x10
	ands r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	cmp r1, #0
	beq _0808B64A
	b _0808B1F8
_0808B64A:
	ldr r0, [r6, #0x2c]
	ldrb r0, [r0]
	cmp r0, #0
	bne _0808B654
	b _0808B772
_0808B654:
	adds r0, r6, #0
	adds r0, #0x58
	strb r1, [r0]
	adds r0, r6, #0
	movs r1, #5
	bl Proc_Goto
	b _0808B772
_0808B664:
	bl sub_808B0D4
	ldr r0, [r6, #0x2c]
	adds r0, #1
	str r0, [r6, #0x2c]
	ldr r0, _0808B6A4  @ gUnknown_08A01740
	bl Proc_Find
	adds r4, r6, #0
	adds r4, #0x52
	movs r5, #0x3c
	ldrsh r1, [r0, r5]
	ldrb r2, [r4]
	adds r1, r1, r2
	movs r3, #0x3e
	ldrsh r2, [r0, r3]
	adds r0, r6, #0
	adds r0, #0x48
	movs r5, #0
	ldrsh r0, [r0, r5]
	lsls r0, r0, #4
	adds r2, r2, r0
	adds r2, #8
	adds r0, r6, #0
	bl sub_8007CD8
	ldr r0, [r6, #0x2c]
	adds r1, r4, #0
	bl sub_808AB98
	b _0808B772
	.align 2, 0
_0808B6A4: .4byte gUnknown_08A01740
_0808B6A8:
	bl sub_808A524
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	beq _0808B6CE
	adds r5, r6, #0
	adds r5, #0x48
	movs r1, #0
	ldrsh r0, [r5, r1]
	lsls r0, r0, #2
	adds r4, r6, #0
	adds r4, #0x34
	adds r0, r4, r0
	ldr r0, [r0]
	movs r1, #1
	bl Text_SetColorId
	b _0808B70A
_0808B6CE:
	adds r0, r6, #0
	adds r0, #0x59
	ldrb r0, [r0]
	cmp r0, #0
	beq _0808B6F2
	adds r5, r6, #0
	adds r5, #0x48
	movs r2, #0
	ldrsh r0, [r5, r2]
	lsls r0, r0, #2
	adds r4, r6, #0
	adds r4, #0x34
	adds r0, r4, r0
	ldr r0, [r0]
	movs r1, #0xa
	bl Text_SetColorId
	b _0808B70A
_0808B6F2:
	adds r5, r6, #0
	adds r5, #0x48
	movs r3, #0
	ldrsh r0, [r5, r3]
	lsls r0, r0, #2
	adds r4, r6, #0
	adds r4, #0x34
	adds r0, r4, r0
	ldr r0, [r0]
	movs r1, #6
	bl Text_SetColorId
_0808B70A:
	movs r1, #0
	ldrsh r0, [r5, r1]
	lsls r0, r0, #2
	adds r0, r4, r0
	ldr r0, [r0]
	ldr r1, [r6, #0x2c]
	bl Text_AppendChar
	str r0, [r6, #0x2c]
	bl GetTextDisplaySpeed
	adds r4, r0, #0
	cmp r4, #1
	bne _0808B730
	bl GetGameClock
	ands r0, r4
	cmp r0, #0
	beq _0808B76A
_0808B730:
	bl sub_808A524
	movs r1, #0x10
	ands r1, r0
	cmp r1, #0
	beq _0808B758
	ldr r0, _0808B750  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0808B76A
	ldr r0, _0808B754  @ 0x000002E5
	bl m4aSongNumStart
	b _0808B76A
	.align 2, 0
_0808B750: .4byte gRAMChapterData
_0808B754: .4byte 0x000002E5
_0808B758:
	ldr r0, _0808B784  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0808B76A
	movs r0, #0x6e
	bl m4aSongNumStart
_0808B76A:
	adds r7, #1
	cmp r7, r8
	bge _0808B772
	b _0808B22C
_0808B772:
	movs r0, #0
	bl SetFont
_0808B778:
	add sp, #0x14
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808B784: .4byte gRAMChapterData

	THUMB_FUNC_END sub_808B178

	THUMB_FUNC_START sub_808B788
sub_808B788: @ 0x0808B788
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0808B7B0  @ gUnknown_08A01818
	bl Proc_Find
	cmp r0, #0
	beq _0808B7AA
	ldr r0, _0808B7B4  @ gUnknown_08A016E0
	bl Proc_Find
	movs r1, #0
	bl Proc_Goto
	adds r0, r4, #0
	movs r1, #0
	bl Proc_Goto
_0808B7AA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808B7B0: .4byte gUnknown_08A01818
_0808B7B4: .4byte gUnknown_08A016E0

	THUMB_FUNC_END sub_808B788

	THUMB_FUNC_START sub_808B7B8
sub_808B7B8: @ 0x0808B7B8
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x54
	ldrb r0, [r0]
	adds r0, #1
	adds r1, r4, #0
	adds r1, #0x55
	ldrb r1, [r1]
	bl sub_808A530
	adds r1, r4, #0
	adds r1, #0x58
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x10
	bne _0808B7F8
	adds r0, r4, #0
	adds r0, #0x48
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r0, r0, #3
	ldr r1, _0808B800  @ gUnknown_0203E800
	adds r0, r0, r1
	movs r1, #0
	bl Text_SetXCursor
	adds r0, r4, #0
	bl Proc_Break
_0808B7F8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808B800: .4byte gUnknown_0203E800

	THUMB_FUNC_END sub_808B7B8

	THUMB_FUNC_START sub_808B804
sub_808B804: @ 0x0808B804
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x48
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _0808B81A
	adds r0, r4, #0
	bl Proc_Break
	b _0808B822
_0808B81A:
	adds r0, r4, #0
	movs r1, #5
	bl Proc_Goto
_0808B822:
	adds r1, r4, #0
	adds r1, #0x48
	ldrh r2, [r1]
	movs r3, #0
	ldrsh r0, [r1, r3]
	cmp r0, #0
	beq _0808B834
	subs r0, r2, #1
	strh r0, [r1]
_0808B834:
	adds r1, r4, #0
	adds r1, #0x58
	movs r0, #0
	strb r0, [r1]
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_808B804

	THUMB_FUNC_START sub_808B844
sub_808B844: @ 0x0808B844
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0808B86C  @ gUnknown_08A016E0
	bl Proc_Find
	movs r1, #3
	bl Proc_Goto
	adds r0, r4, #0
	bl Proc_Break
	movs r0, #0
	bl SetFont
	movs r0, #0
	bl SetFontGlyphSet
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808B86C: .4byte gUnknown_08A016E0

	THUMB_FUNC_END sub_808B844

	THUMB_FUNC_START sub_808B870
sub_808B870: @ 0x0808B870
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r0, _0808B900  @ gUnknown_08A01740
	bl Proc_Find
	adds r6, r0, #0
	adds r5, r4, #0
	adds r5, #0x58
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
	cmp r6, #0
	beq _0808B8C8
	adds r0, r4, #0
	adds r0, #0x54
	ldrb r0, [r0]
	ldrb r3, [r5]
	movs r2, #2
	subs r2, r2, r3
	adds r1, r0, #0
	muls r1, r2, r1
	adds r0, r4, #0
	adds r0, #0x56
	ldrb r0, [r0]
	muls r0, r3, r0
	adds r1, r1, r0
	lsrs r0, r1, #0x1f
	adds r1, r1, r0
	asrs r1, r1, #1
	adds r0, r4, #0
	adds r0, #0x55
	ldrb r0, [r0]
	muls r2, r0, r2
	adds r0, r4, #0
	adds r0, #0x57
	ldrb r0, [r0]
	muls r0, r3, r0
	adds r2, r2, r0
	lsrs r0, r2, #0x1f
	adds r2, r2, r0
	asrs r2, r2, #1
	adds r0, r6, #0
	bl sub_808A838
_0808B8C8:
	ldrb r0, [r5]
	cmp r0, #2
	bne _0808B8F8
	adds r0, r4, #0
	adds r0, #0x56
	ldrb r0, [r0]
	lsrs r0, r0, #3
	adds r1, r4, #0
	adds r1, #0x54
	strb r0, [r1]
	adds r0, r4, #0
	adds r0, #0x57
	ldrb r0, [r0]
	lsrs r0, r0, #4
	adds r1, r0, #0
	cmp r0, #5
	bls _0808B8EC
	movs r1, #5
_0808B8EC:
	adds r0, r4, #0
	adds r0, #0x55
	strb r1, [r0]
	adds r0, r4, #0
	bl Proc_Break
_0808B8F8:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0808B900: .4byte gUnknown_08A01740

	THUMB_FUNC_END sub_808B870

	THUMB_FUNC_START sub_808B904
sub_808B904: @ 0x0808B904
	push {lr}
	ldr r0, _0808B91C  @ gUnknown_08A016E0
	bl Proc_Find
	cmp r0, #0
	beq _0808B920
	adds r0, #0x38
	ldrb r0, [r0]
	cmp r0, #0
	bne _0808B920
	movs r0, #0
	b _0808B922
	.align 2, 0
_0808B91C: .4byte gUnknown_08A016E0
_0808B920:
	movs r0, #1
_0808B922:
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_808B904

	THUMB_FUNC_START sub_808B928
sub_808B928: @ 0x0808B928
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _0808B998  @ gUnknown_0203E7E8
	adds r0, r4, #0
	bl SetFont
	movs r0, #0
	bl SetFontGlyphSet
	movs r0, #1
	bl SetFontGlyphSet
	bl sub_808A524
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	bne _0808B99C
	adds r0, r4, #0
	adds r0, #0x18
	movs r1, #6
	bl Text_SetColorId
	adds r0, r4, #0
	adds r0, #0x20
	movs r1, #6
	bl Text_SetColorId
	adds r0, r4, #0
	adds r0, #0x28
	movs r1, #6
	bl Text_SetColorId
	bl sub_808A524
	movs r1, #0x10
	ands r1, r0
	cmp r1, #0
	beq _0808B9BA
	bl sub_808A524
	movs r1, #0x20
	ands r1, r0
	cmp r1, #0
	bne _0808B9BA
	adds r0, r4, #0
	adds r0, #0x30
	movs r1, #6
	bl Text_SetColorId
	adds r0, r4, #0
	adds r0, #0x38
	movs r1, #6
	bl Text_SetColorId
	b _0808B9BA
	.align 2, 0
_0808B998: .4byte gUnknown_0203E7E8
_0808B99C:
	movs r4, #0
	b _0808B9AE
_0808B9A0:
	lsls r0, r4, #3
	ldr r1, _0808BA38  @ gUnknown_0203E800
	adds r0, r0, r1
	movs r1, #0
	bl Text_SetColorId
	adds r4, #1
_0808B9AE:
	bl sub_808A524
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x18
	cmp r4, r0
	blt _0808B9A0
_0808B9BA:
	movs r0, #0
	bl SetFont
	ldr r4, _0808BA3C  @ gUnknown_08A01760
	adds r0, r4, #0
	bl Proc_EndEach
	adds r0, r4, #0
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	ldr r1, _0808BA40  @ gUnknown_0203E7E8
	str r1, [r4, #0x30]
	adds r0, r1, #0
	adds r0, #0x18
	str r0, [r4, #0x34]
	adds r0, #8
	str r0, [r4, #0x38]
	adds r0, #8
	str r0, [r4, #0x3c]
	adds r0, #8
	str r0, [r4, #0x40]
	adds r0, #8
	str r0, [r4, #0x44]
	adds r1, r4, #0
	adds r1, #0x48
	movs r0, #0
	strh r0, [r1]
	ldr r0, [r5, #0x5c]
	bl GetStringFromIndex
	bl sub_800A2A4
	str r0, [r4, #0x2c]
	ldr r1, [r5, #0x2c]
	adds r0, r4, #0
	adds r0, #0x54
	strb r1, [r0]
	ldr r0, [r5, #0x30]
	adds r1, r4, #0
	adds r1, #0x55
	strb r0, [r1]
	bl sub_808B904
	lsls r0, r0, #0x18
	asrs r1, r0, #0x18
	cmp r1, #0
	beq _0808BA44
	bl GetTextDisplaySpeed
	adds r1, r4, #0
	adds r1, #0x4c
	strh r0, [r1]
	lsls r0, r0, #0x10
	movs r1, #0x80
	cmp r0, #0
	beq _0808BA30
	movs r1, #1
_0808BA30:
	adds r0, r4, #0
	adds r0, #0x4e
	strh r1, [r0]
	b _0808BA52
	.align 2, 0
_0808BA38: .4byte gUnknown_0203E800
_0808BA3C: .4byte gUnknown_08A01760
_0808BA40: .4byte gUnknown_0203E7E8
_0808BA44:
	adds r0, r4, #0
	adds r0, #0x4c
	strh r1, [r0]
	adds r1, r4, #0
	adds r1, #0x4e
	movs r0, #0x80
	strh r0, [r1]
_0808BA52:
	adds r1, r4, #0
	adds r1, #0x4a
	movs r0, #0
	strh r0, [r1]
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_808B928

	THUMB_FUNC_START sub_808BA60
sub_808BA60: @ 0x0808BA60
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	ldr r0, _0808BA94  @ gUnknown_08A01800
	movs r1, #3
	bl Proc_Start
	adds r1, r0, #0
	str r4, [r1, #0x5c]
	cmp r5, #0
	bge _0808BA7A
	adds r5, #7
_0808BA7A:
	asrs r0, r5, #3
	str r0, [r1, #0x2c]
	adds r0, r6, #0
	cmp r6, #0
	bge _0808BA86
	adds r0, #0xf
_0808BA86:
	asrs r0, r0, #4
	cmp r0, #5
	bgt _0808BA98
	cmp r0, #0
	bge _0808BA9A
	movs r0, #0
	b _0808BA9A
	.align 2, 0
_0808BA94: .4byte gUnknown_08A01800
_0808BA98:
	movs r0, #5
_0808BA9A:
	str r0, [r1, #0x30]
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_808BA60

	THUMB_FUNC_START sub_808BAA4
sub_808BAA4: @ 0x0808BAA4
	push {r4, lr}
	ldr r4, _0808BAFC  @ gUnknown_0203E7E8
	adds r0, r4, #0
	bl SetFont
	bl sub_808A524
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	bne _0808BB00
	adds r0, r4, #0
	adds r0, #0x18
	bl sub_80045FC
	adds r0, r4, #0
	adds r0, #0x20
	bl sub_80045FC
	adds r0, r4, #0
	adds r0, #0x28
	bl sub_80045FC
	bl sub_808A524
	movs r1, #0x10
	ands r1, r0
	cmp r1, #0
	beq _0808BB1E
	bl sub_808A524
	movs r1, #0x20
	ands r1, r0
	cmp r1, #0
	bne _0808BB1E
	adds r0, r4, #0
	adds r0, #0x30
	bl sub_80045FC
	adds r0, r4, #0
	adds r0, #0x38
	bl sub_80045FC
	b _0808BB1E
	.align 2, 0
_0808BAFC: .4byte gUnknown_0203E7E8
_0808BB00:
	movs r4, #0
	b _0808BB12
_0808BB04:
	lsls r0, r4, #3
	ldr r1, _0808BB38  @ gUnknown_0203E800
	adds r0, r0, r1
	movs r1, #0
	bl Text_80046B4
	adds r4, #1
_0808BB12:
	bl sub_808A524
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x18
	cmp r4, r0
	blt _0808BB04
_0808BB1E:
	ldr r0, _0808BB3C  @ gUnknown_08A01760
	bl Proc_EndEach
	ldr r0, _0808BB40  @ gUnknown_08A01800
	bl Proc_EndEach
	movs r0, #0
	bl SetFont
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808BB38: .4byte gUnknown_0203E800
_0808BB3C: .4byte gUnknown_08A01760
_0808BB40: .4byte gUnknown_08A01800

	THUMB_FUNC_END sub_808BAA4

	THUMB_FUNC_START sub_808BB44
sub_808BB44: @ 0x0808BB44
	push {lr}
	ldr r0, _0808BB54  @ gUnknown_08A01818
	movs r1, #0
	bl Proc_Start
	pop {r0}
	bx r0
	.align 2, 0
_0808BB54: .4byte gUnknown_08A01818

	THUMB_FUNC_END sub_808BB44

	THUMB_FUNC_START sub_808BB58
sub_808BB58: @ 0x0808BB58
	push {lr}
	ldr r0, _0808BB68  @ gUnknown_08A01818
	bl Proc_Find
	cmp r0, #0
	bne _0808BB6C
	movs r0, #0
	b _0808BB6E
	.align 2, 0
_0808BB68: .4byte gUnknown_08A01818
_0808BB6C:
	movs r0, #1
_0808BB6E:
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_808BB58

	THUMB_FUNC_START sub_808BB74
sub_808BB74: @ 0x0808BB74
	push {lr}
	ldr r0, _0808BB98  @ gUnknown_08A016E0
	bl Proc_EndEach
	ldr r0, _0808BB9C  @ gUnknown_08A01818
	bl Proc_EndEach
	ldr r0, _0808BBA0  @ gUnknown_08A01740
	bl Proc_EndEach
	ldr r0, _0808BBA4  @ gUnknown_08A01760
	bl Proc_EndEach
	ldr r0, _0808BBA8  @ gUnknown_08A01800
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
_0808BB98: .4byte gUnknown_08A016E0
_0808BB9C: .4byte gUnknown_08A01818
_0808BBA0: .4byte gUnknown_08A01740
_0808BBA4: .4byte gUnknown_08A01760
_0808BBA8: .4byte gUnknown_08A01800

	THUMB_FUNC_END sub_808BB74

	THUMB_FUNC_START sub_808BBAC
sub_808BBAC: @ 0x0808BBAC
	push {lr}
	cmp r0, #0
	bge _0808BBBE
	cmp r1, #0
	bge _0808BBBA
	movs r0, #0
	b _0808BBC8
_0808BBBA:
	movs r0, #1
	b _0808BBC8
_0808BBBE:
	cmp r1, #0
	blt _0808BBC6
	movs r0, #3
	b _0808BBC8
_0808BBC6:
	movs r0, #2
_0808BBC8:
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_808BBAC

	THUMB_FUNC_START GetCameraMovementSpeedMaybe
GetCameraMovementSpeedMaybe: @ 0x0808BBCC
	push {r4, lr}
	ldr r2, _0808BBF8  @ gUnknown_0202BCB0
	movs r0, #0x14
	ldrsh r3, [r2, r0]
	lsls r3, r3, #4
	movs r1, #0xc
	ldrsh r0, [r2, r1]
	subs r0, #8
	subs r3, r3, r0
	movs r4, #0x16
	ldrsh r1, [r2, r4]
	lsls r1, r1, #4
	movs r4, #0xe
	ldrsh r0, [r2, r4]
	subs r0, #8
	subs r1, r1, r0
	cmp r3, #0x78
	bgt _0808BBFC
	cmp r1, #0x50
	bgt _0808BC04
	movs r0, #0
	b _0808BC0A
	.align 2, 0
_0808BBF8: .4byte gUnknown_0202BCB0
_0808BBFC:
	cmp r1, #0x50
	bgt _0808BC08
	movs r0, #1
	b _0808BC0A
_0808BC04:
	movs r0, #2
	b _0808BC0A
_0808BC08:
	movs r0, #3
_0808BC0A:
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END GetCameraMovementSpeedMaybe

	THUMB_FUNC_START sub_808BC10
sub_808BC10: @ 0x0808BC10
	push {lr}
	adds r3, r0, #0
	lsls r1, r1, #0x10
	lsrs r0, r1, #0x10
	asrs r1, r1, #0x10
	cmp r1, #5
	ble _0808BC20
	movs r0, #5
_0808BC20:
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	adds r0, r0, r2
	strh r0, [r3]
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_808BC10

	THUMB_FUNC_START sub_808BC2C
sub_808BC2C: @ 0x0808BC2C
	push {r4, r5, lr}
	adds r3, r0, #0
	lsls r1, r1, #0x10
	asrs r4, r1, #0x13
	movs r0, #0xe0
	lsls r0, r0, #0xb
	ands r0, r1
	asrs r0, r0, #0x10
	movs r1, #0
	adds r5, r2, #0
	adds r5, #0xe
	adds r2, #6
	adds r0, r2, r0
_0808BC46:
	cmp r1, r4
	bge _0808BC4E
	strh r5, [r3]
	b _0808BC58
_0808BC4E:
	cmp r1, r4
	bne _0808BC56
	strh r0, [r3]
	b _0808BC58
_0808BC56:
	strh r2, [r3]
_0808BC58:
	adds r3, #2
	adds r1, #1
	cmp r1, #4
	ble _0808BC46
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_808BC2C

	THUMB_FUNC_START sub_808BC68
sub_808BC68: @ 0x0808BC68
	push {r4, lr}
	adds r4, r0, #0
	lsls r1, r1, #0x10
	lsrs r3, r1, #0x10
	asrs r1, r1, #0x10
	cmp r1, #4
	ble _0808BC78
	movs r3, #5
_0808BC78:
	lsls r0, r3, #0x10
	cmp r0, #0
	bge _0808BC80
	movs r3, #0
_0808BC80:
	adds r1, r2, #0
	adds r1, #0xf
	lsls r0, r3, #0x10
	asrs r0, r0, #0x10
	adds r0, r0, r1
	strh r0, [r4]
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_808BC68

	THUMB_FUNC_START sub_808BC94
sub_808BC94: @ 0x0808BC94
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r5, r0, #0
	adds r6, r1, #0
	mov r8, r2
	adds r0, r6, #0
	bl GetUnitCurrentHp
	movs r1, #0x32
	adds r4, r0, #0
	muls r4, r1, r4
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	adds r0, r6, #0
	bl GetUnitMaxHp
	adds r1, r0, #0
	adds r0, r4, #0
	bl Div
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	adds r0, r5, #0
	adds r1, r4, #0
	mov r2, r8
	bl sub_808BC10
	adds r0, r5, #2
	subs r1, r4, #5
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	mov r2, r8
	bl sub_808BC2C
	adds r5, #0xc
	subs r4, #0x2d
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	adds r0, r5, #0
	adds r1, r4, #0
	mov r2, r8
	bl sub_808BC68
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_808BC94

	THUMB_FUNC_START Loop6CUI1_DisplayTransition
Loop6CUI1_DisplayTransition: @ 0x0808BCF8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r7, r0, #0
	ldr r1, _0808BD44  @ gUnknown_08A01828
	adds r0, #0x50
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #3
	adds r1, r0, r1
	movs r0, #3
	ldrsb r0, [r1, r0]
	movs r4, #0
	cmp r0, #0
	blt _0808BD1A
	movs r4, #0xe
_0808BD1A:
	movs r0, #2
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bge _0808BD50
	lsls r5, r4, #5
	lsls r4, r4, #6
	ldr r0, _0808BD48  @ gBG0TilemapBuffer
	adds r0, r4, r0
	movs r1, #0xd
	movs r2, #6
	movs r3, #0
	bl TileMap_FillRect
	ldr r0, _0808BD4C  @ gBG1TilemapBuffer
	adds r0, r4, r0
	movs r1, #0xd
	movs r2, #6
	movs r3, #0
	bl TileMap_FillRect
	b _0808BD70
	.align 2, 0
_0808BD44: .4byte gUnknown_08A01828
_0808BD48: .4byte gBG0TilemapBuffer
_0808BD4C: .4byte gBG1TilemapBuffer
_0808BD50:
	lsls r5, r4, #5
	lsls r4, r4, #6
	ldr r0, _0808BDC8  @ gUnknown_02022CCA
	adds r0, r4, r0
	movs r1, #0xd
	movs r2, #6
	movs r3, #0
	bl TileMap_FillRect
	ldr r0, _0808BDCC  @ gUnknown_020234CA
	adds r0, r4, r0
	movs r1, #0xd
	movs r2, #6
	movs r3, #0
	bl TileMap_FillRect
_0808BD70:
	mov r8, r5
	adds r6, r4, #0
	movs r0, #3
	bl BG_EnableSyncByMask
	ldr r1, _0808BDD0  @ gUnknown_08A0189C
	ldr r0, [r7, #0x58]
	adds r0, r0, r1
	movs r5, #0
	ldrsb r5, [r0, r5]
	ldr r1, _0808BDD4  @ gUnknown_08A01828
	adds r0, r7, #0
	adds r0, #0x50
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrb r0, [r0, #2]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bge _0808BDE8
	movs r4, #0xd
	subs r4, r4, r5
	lsls r4, r4, #1
	ldr r0, _0808BDD8  @ gBmFrameTmap0
	adds r0, r4, r0
	ldr r1, _0808BDDC  @ gBG0TilemapBuffer
	adds r1, r6, r1
	adds r2, r5, #0
	movs r3, #6
	bl TileMap_CopyRect
	ldr r0, _0808BDE0  @ gUnknown_0200422C
	adds r4, r4, r0
	ldr r1, _0808BDE4  @ gBG1TilemapBuffer
	adds r1, r6, r1
	adds r0, r4, #0
	adds r2, r5, #0
	movs r3, #6
	bl TileMap_CopyRect
	b _0808BE0E
	.align 2, 0
_0808BDC8: .4byte gUnknown_02022CCA
_0808BDCC: .4byte gUnknown_020234CA
_0808BDD0: .4byte gUnknown_08A0189C
_0808BDD4: .4byte gUnknown_08A01828
_0808BDD8: .4byte gBmFrameTmap0
_0808BDDC: .4byte gBG0TilemapBuffer
_0808BDE0: .4byte gUnknown_0200422C
_0808BDE4: .4byte gBG1TilemapBuffer
_0808BDE8:
	ldr r0, _0808BE58  @ gBmFrameTmap0
	mov r4, r8
	adds r4, #0x1e
	subs r4, r4, r5
	lsls r4, r4, #1
	ldr r1, _0808BE5C  @ gBG0TilemapBuffer
	adds r1, r4, r1
	adds r2, r5, #0
	movs r3, #6
	bl TileMap_CopyRect
	ldr r0, _0808BE60  @ gUnknown_0200422C
	ldr r1, _0808BE64  @ gBG1TilemapBuffer
	adds r4, r4, r1
	adds r1, r4, #0
	adds r2, r5, #0
	movs r3, #6
	bl TileMap_CopyRect
_0808BE0E:
	ldr r0, [r7, #0x58]
	adds r0, #1
	str r0, [r7, #0x58]
	cmp r0, #4
	bne _0808BE4C
	adds r1, r7, #0
	adds r1, #0x55
	movs r0, #0
	strb r0, [r1]
	str r0, [r7, #0x58]
	adds r0, r7, #0
	bl Proc_Break
	ldr r2, _0808BE68  @ gUnknown_0202BCB0
	movs r1, #0x16
	ldrsh r0, [r2, r1]
	ldr r1, _0808BE6C  @ gBmMapUnit
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r3, #0x14
	ldrsh r1, [r2, r3]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	bl GetUnit
	adds r1, r0, #0
	adds r0, r7, #0
	bl DrawMinimugBoxMaybe
_0808BE4C:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808BE58: .4byte gBmFrameTmap0
_0808BE5C: .4byte gBG0TilemapBuffer
_0808BE60: .4byte gUnknown_0200422C
_0808BE64: .4byte gBG1TilemapBuffer
_0808BE68: .4byte gUnknown_0202BCB0
_0808BE6C: .4byte gBmMapUnit

	THUMB_FUNC_END Loop6CUI1_DisplayTransition

	THUMB_FUNC_START Loop6CUI1_HideTransition
Loop6CUI1_HideTransition: @ 0x0808BE70
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	ldr r3, _0808BED0  @ gUnknown_08A01828
	adds r2, r6, #0
	adds r2, #0x50
	movs r0, #0
	ldrsb r0, [r2, r0]
	lsls r0, r0, #3
	adds r0, r0, r3
	ldrb r0, [r0, #3]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r4, #0
	cmp r0, #0
	blt _0808BE94
	movs r4, #0xe
_0808BE94:
	adds r1, r6, #0
	adds r1, #0x55
	movs r0, #1
	strb r0, [r1]
	movs r0, #0
	ldrsb r0, [r2, r0]
	lsls r0, r0, #3
	adds r0, r0, r3
	ldrb r0, [r0, #2]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bge _0808BEDC
	lsls r5, r4, #5
	lsls r4, r4, #6
	ldr r0, _0808BED4  @ gBG0TilemapBuffer
	adds r0, r4, r0
	movs r1, #0xd
	movs r2, #6
	movs r3, #0
	bl TileMap_FillRect
	ldr r0, _0808BED8  @ gBG1TilemapBuffer
	adds r0, r4, r0
	movs r1, #0xd
	movs r2, #6
	movs r3, #0
	bl TileMap_FillRect
	b _0808BEFC
	.align 2, 0
_0808BED0: .4byte gUnknown_08A01828
_0808BED4: .4byte gBG0TilemapBuffer
_0808BED8: .4byte gBG1TilemapBuffer
_0808BEDC:
	lsls r5, r4, #5
	lsls r4, r4, #6
	ldr r0, _0808BF54  @ gUnknown_02022CCA
	adds r0, r4, r0
	movs r1, #0xd
	movs r2, #6
	movs r3, #0
	bl TileMap_FillRect
	ldr r0, _0808BF58  @ gUnknown_020234CA
	adds r0, r4, r0
	movs r1, #0xd
	movs r2, #6
	movs r3, #0
	bl TileMap_FillRect
_0808BEFC:
	mov r8, r5
	adds r7, r4, #0
	movs r0, #3
	bl BG_EnableSyncByMask
	ldr r1, _0808BF5C  @ gUnknown_08A018A0
	ldr r0, [r6, #0x58]
	adds r0, r0, r1
	movs r5, #0
	ldrsb r5, [r0, r5]
	ldr r1, _0808BF60  @ gUnknown_08A01828
	adds r0, r6, #0
	adds r0, #0x50
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrb r0, [r0, #2]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bge _0808BF74
	movs r4, #0xd
	subs r4, r4, r5
	lsls r4, r4, #1
	ldr r0, _0808BF64  @ gBmFrameTmap0
	adds r0, r4, r0
	ldr r1, _0808BF68  @ gBG0TilemapBuffer
	adds r1, r7, r1
	adds r2, r5, #0
	movs r3, #6
	bl TileMap_CopyRect
	ldr r0, _0808BF6C  @ gUnknown_0200422C
	adds r4, r4, r0
	ldr r1, _0808BF70  @ gBG1TilemapBuffer
	adds r1, r7, r1
	adds r0, r4, #0
	adds r2, r5, #0
	movs r3, #6
	bl TileMap_CopyRect
	b _0808BF9A
	.align 2, 0
_0808BF54: .4byte gUnknown_02022CCA
_0808BF58: .4byte gUnknown_020234CA
_0808BF5C: .4byte gUnknown_08A018A0
_0808BF60: .4byte gUnknown_08A01828
_0808BF64: .4byte gBmFrameTmap0
_0808BF68: .4byte gBG0TilemapBuffer
_0808BF6C: .4byte gUnknown_0200422C
_0808BF70: .4byte gBG1TilemapBuffer
_0808BF74:
	ldr r0, _0808BFC4  @ gBmFrameTmap0
	mov r4, r8
	adds r4, #0x1e
	subs r4, r4, r5
	lsls r4, r4, #1
	ldr r1, _0808BFC8  @ gBG0TilemapBuffer
	adds r1, r4, r1
	adds r2, r5, #0
	movs r3, #6
	bl TileMap_CopyRect
	ldr r0, _0808BFCC  @ gUnknown_0200422C
	ldr r1, _0808BFD0  @ gBG1TilemapBuffer
	adds r4, r4, r1
	adds r1, r4, #0
	adds r2, r5, #0
	movs r3, #6
	bl TileMap_CopyRect
_0808BF9A:
	ldr r0, [r6, #0x58]
	adds r0, #1
	str r0, [r6, #0x58]
	cmp r0, #3
	bne _0808BFBA
	adds r1, r6, #0
	adds r1, #0x56
	movs r0, #0
	strb r0, [r1]
	str r0, [r6, #0x58]
	adds r1, #1
	movs r0, #0xff
	strb r0, [r1]
	adds r0, r6, #0
	bl Proc_Break
_0808BFBA:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808BFC4: .4byte gBmFrameTmap0
_0808BFC8: .4byte gBG0TilemapBuffer
_0808BFCC: .4byte gUnknown_0200422C
_0808BFD0: .4byte gBG1TilemapBuffer

	THUMB_FUNC_END Loop6CUI1_HideTransition

	THUMB_FUNC_START sub_808BFD4
sub_808BFD4: @ 0x0808BFD4
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r1, _0808C00C  @ gUnknown_08A01828
	adds r0, #0x50
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bge _0808C018
	ldr r0, _0808C010  @ gUnknown_02022FE8
	movs r1, #7
	movs r2, #7
	movs r3, #0
	bl TileMap_FillRect
	ldr r0, _0808C014  @ gUnknown_020237E8
	movs r1, #7
	movs r2, #7
	movs r3, #0
	bl TileMap_FillRect
	b _0808C030
	.align 2, 0
_0808C00C: .4byte gUnknown_08A01828
_0808C010: .4byte gUnknown_02022FE8
_0808C014: .4byte gUnknown_020237E8
_0808C018:
	ldr r0, _0808C084  @ gUnknown_02023016
	movs r1, #7
	movs r2, #7
	movs r3, #0
	bl TileMap_FillRect
	ldr r0, _0808C088  @ gUnknown_02023816
	movs r1, #7
	movs r2, #7
	movs r3, #0
	bl TileMap_FillRect
_0808C030:
	movs r0, #3
	bl BG_EnableSyncByMask
	ldr r1, _0808C08C  @ gUnknown_08A018A3
	ldr r0, [r6, #0x58]
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r5, r0, #1
	ldr r1, _0808C090  @ gUnknown_08A01828
	adds r0, r6, #0
	adds r0, #0x50
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bge _0808C0A8
	ldr r4, _0808C094  @ 0x00000147
	subs r4, r4, r5
	lsls r4, r4, #1
	ldr r0, _0808C098  @ gBmFrameTmap0
	adds r0, r4, r0
	ldr r1, _0808C09C  @ gUnknown_02022FE8
	adds r2, r5, #0
	movs r3, #7
	bl TileMap_CopyRect
	ldr r0, _0808C0A0  @ gUnknown_0200422C
	adds r4, r4, r0
	ldr r1, _0808C0A4  @ gUnknown_020237E8
	adds r0, r4, #0
	adds r2, r5, #0
	movs r3, #7
	bl TileMap_CopyRect
	b _0808C0CE
	.align 2, 0
_0808C084: .4byte gUnknown_02023016
_0808C088: .4byte gUnknown_02023816
_0808C08C: .4byte gUnknown_08A018A3
_0808C090: .4byte gUnknown_08A01828
_0808C094: .4byte 0x00000147
_0808C098: .4byte gBmFrameTmap0
_0808C09C: .4byte gUnknown_02022FE8
_0808C0A0: .4byte gUnknown_0200422C
_0808C0A4: .4byte gUnknown_020237E8
_0808C0A8:
	ldr r0, _0808C0F0  @ gUnknown_02003FAC
	movs r4, #0xdf
	lsls r4, r4, #1
	subs r4, r4, r5
	lsls r4, r4, #1
	ldr r1, _0808C0F4  @ gBG0TilemapBuffer
	adds r1, r4, r1
	adds r2, r5, #0
	movs r3, #7
	bl TileMap_CopyRect
	ldr r0, _0808C0F8  @ gUnknown_020044AC
	ldr r1, _0808C0FC  @ gBG1TilemapBuffer
	adds r4, r4, r1
	adds r1, r4, #0
	adds r2, r5, #0
	movs r3, #7
	bl TileMap_CopyRect
_0808C0CE:
	ldr r0, [r6, #0x58]
	adds r0, #1
	str r0, [r6, #0x58]
	cmp r0, #3
	bne _0808C0E8
	movs r0, #0
	str r0, [r6, #0x58]
	adds r1, r6, #0
	adds r1, #0x55
	strb r0, [r1]
	adds r0, r6, #0
	bl Proc_Break
_0808C0E8:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0808C0F0: .4byte gUnknown_02003FAC
_0808C0F4: .4byte gBG0TilemapBuffer
_0808C0F8: .4byte gUnknown_020044AC
_0808C0FC: .4byte gBG1TilemapBuffer

	THUMB_FUNC_END sub_808BFD4

	THUMB_FUNC_START sub_808C100
sub_808C100: @ 0x0808C100
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r1, r6, #0
	adds r1, #0x55
	movs r0, #1
	strb r0, [r1]
	ldr r1, _0808C140  @ gUnknown_08A01828
	adds r0, r6, #0
	adds r0, #0x50
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bge _0808C14C
	ldr r0, _0808C144  @ gUnknown_02022FE8
	movs r1, #7
	movs r2, #7
	movs r3, #0
	bl TileMap_FillRect
	ldr r0, _0808C148  @ gUnknown_020237E8
	movs r1, #7
	movs r2, #7
	movs r3, #0
	bl TileMap_FillRect
	b _0808C164
	.align 2, 0
_0808C140: .4byte gUnknown_08A01828
_0808C144: .4byte gUnknown_02022FE8
_0808C148: .4byte gUnknown_020237E8
_0808C14C:
	ldr r0, _0808C1B8  @ gUnknown_02023016
	movs r1, #7
	movs r2, #7
	movs r3, #0
	bl TileMap_FillRect
	ldr r0, _0808C1BC  @ gUnknown_02023816
	movs r1, #7
	movs r2, #7
	movs r3, #0
	bl TileMap_FillRect
_0808C164:
	movs r0, #3
	bl BG_EnableSyncByMask
	ldr r1, _0808C1C0  @ gUnknown_08A018A6
	ldr r0, [r6, #0x58]
	adds r0, r0, r1
	movs r5, #0
	ldrsb r5, [r0, r5]
	ldr r1, _0808C1C4  @ gUnknown_08A01828
	adds r0, r6, #0
	adds r0, #0x50
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bge _0808C1D8
	movs r4, #0xa3
	lsls r4, r4, #1
	subs r4, r4, r5
	lsls r4, r4, #1
	ldr r0, _0808C1C8  @ gBmFrameTmap0
	adds r0, r4, r0
	ldr r1, _0808C1CC  @ gUnknown_02022FE8
	adds r2, r5, #0
	movs r3, #7
	bl TileMap_CopyRect
	ldr r0, _0808C1D0  @ gUnknown_0200422C
	adds r4, r4, r0
	ldr r1, _0808C1D4  @ gUnknown_020237E8
	adds r0, r4, #0
	adds r2, r5, #0
	movs r3, #7
	bl TileMap_CopyRect
	b _0808C1FE
	.align 2, 0
_0808C1B8: .4byte gUnknown_02023016
_0808C1BC: .4byte gUnknown_02023816
_0808C1C0: .4byte gUnknown_08A018A6
_0808C1C4: .4byte gUnknown_08A01828
_0808C1C8: .4byte gBmFrameTmap0
_0808C1CC: .4byte gUnknown_02022FE8
_0808C1D0: .4byte gUnknown_0200422C
_0808C1D4: .4byte gUnknown_020237E8
_0808C1D8:
	ldr r0, _0808C224  @ gUnknown_02003FAC
	movs r4, #0xdf
	lsls r4, r4, #1
	subs r4, r4, r5
	lsls r4, r4, #1
	ldr r1, _0808C228  @ gBG0TilemapBuffer
	adds r1, r4, r1
	adds r2, r5, #0
	movs r3, #7
	bl TileMap_CopyRect
	ldr r0, _0808C22C  @ gUnknown_020044AC
	ldr r1, _0808C230  @ gBG1TilemapBuffer
	adds r4, r4, r1
	adds r1, r4, #0
	adds r2, r5, #0
	movs r3, #7
	bl TileMap_CopyRect
_0808C1FE:
	ldr r0, [r6, #0x58]
	adds r0, #1
	str r0, [r6, #0x58]
	cmp r0, #3
	bne _0808C21C
	movs r0, #0
	str r0, [r6, #0x58]
	adds r1, r6, #0
	adds r1, #0x55
	strb r0, [r1]
	adds r1, #1
	strb r0, [r1]
	adds r0, r6, #0
	bl Proc_Break
_0808C21C:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0808C224: .4byte gUnknown_02003FAC
_0808C228: .4byte gBG0TilemapBuffer
_0808C22C: .4byte gUnknown_020044AC
_0808C230: .4byte gBG1TilemapBuffer

	THUMB_FUNC_END sub_808C100

	THUMB_FUNC_START sub_808C234
sub_808C234: @ 0x0808C234
	push {lr}
	ldr r1, _0808C27C  @ gUnknown_08A01828
	adds r0, #0x50
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #3
	adds r1, r0, r1
	movs r0, #2
	ldrsb r0, [r1, r0]
	movs r2, #0x12
	cmp r0, #0
	bge _0808C250
	movs r2, #0
_0808C250:
	movs r0, #3
	ldrsb r0, [r1, r0]
	movs r1, #0xe
	cmp r0, #0
	bge _0808C25C
	movs r1, #0
_0808C25C:
	ldr r0, _0808C280  @ gBmFrameTmap0
	lsls r1, r1, #5
	adds r1, r1, r2
	lsls r1, r1, #1
	ldr r2, _0808C284  @ gBG0TilemapBuffer
	adds r1, r1, r2
	movs r2, #0xd
	movs r3, #6
	bl TileMap_CopyRect
	movs r0, #3
	bl BG_EnableSyncByMask
	pop {r0}
	bx r0
	.align 2, 0
_0808C27C: .4byte gUnknown_08A01828
_0808C280: .4byte gBmFrameTmap0
_0808C284: .4byte gBG0TilemapBuffer

	THUMB_FUNC_END sub_808C234

	THUMB_FUNC_START sub_808C288
sub_808C288: @ 0x0808C288
	push {lr}
	ldr r1, _0808C2C0  @ gUnknown_08A01828
	adds r0, #0x50
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #0x17
	cmp r0, #0
	bge _0808C2A6
	movs r1, #0
_0808C2A6:
	ldr r0, _0808C2C4  @ gUnknown_02003FAC
	lsls r1, r1, #1
	ldr r2, _0808C2C8  @ gUnknown_02022FE8
	adds r1, r1, r2
	movs r2, #7
	movs r3, #7
	bl TileMap_CopyRect
	movs r0, #3
	bl BG_EnableSyncByMask
	pop {r0}
	bx r0
	.align 2, 0
_0808C2C0: .4byte gUnknown_08A01828
_0808C2C4: .4byte gUnknown_02003FAC
_0808C2C8: .4byte gUnknown_02022FE8

	THUMB_FUNC_END sub_808C288

	THUMB_FUNC_START sub_808C2CC
sub_808C2CC: @ 0x0808C2CC
	push {r4, r5, lr}
	adds r5, r1, #0
	movs r4, #0
	cmp r0, #0x40
	beq _0808C2F8
	cmp r0, #0x40
	bgt _0808C2E0
	cmp r0, #0
	beq _0808C2E6
	b _0808C300
_0808C2E0:
	cmp r0, #0x80
	beq _0808C2F0
	b _0808C300
_0808C2E6:
	ldr r4, _0808C2EC  @ gUnknown_08A1738C
	b _0808C304
	.align 2, 0
_0808C2EC: .4byte gUnknown_08A1738C
_0808C2F0:
	ldr r4, _0808C2F4  @ gUnknown_08A173AC
	b _0808C304
	.align 2, 0
_0808C2F4: .4byte gUnknown_08A173AC
_0808C2F8:
	ldr r4, _0808C2FC  @ gUnknown_08A173CC
	b _0808C304
	.align 2, 0
_0808C2FC: .4byte gUnknown_08A173CC
_0808C300:
	bl nullsub_8
_0808C304:
	lsls r1, r5, #5
	adds r0, r4, #0
	movs r2, #0x20
	bl CopyToPaletteBuffer
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_808C2CC

	THUMB_FUNC_START sub_808C314
sub_808C314: @ 0x0808C314
	push {lr}
	ldr r0, _0808C330  @ gUnknown_0202BCB0
	movs r2, #0x14
	ldrsh r1, [r0, r2]
	lsls r1, r1, #4
	movs r2, #0xc
	ldrsh r0, [r0, r2]
	subs r1, r1, r0
	cmp r1, #0x6f
	ble _0808C334
	movs r0, #1
	negs r0, r0
	b _0808C336
	.align 2, 0
_0808C330: .4byte gUnknown_0202BCB0
_0808C334:
	movs r0, #1
_0808C336:
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_808C314

	THUMB_FUNC_START sub_808C33C
sub_808C33C: @ 0x0808C33C
	push {lr}
	ldr r0, _0808C354  @ gUnknown_0202BCB0
	movs r2, #0x14
	ldrsh r1, [r0, r2]
	lsls r1, r1, #4
	movs r2, #0xc
	ldrsh r0, [r0, r2]
	subs r1, r1, r0
	cmp r1, #0x70
	bgt _0808C358
	movs r0, #1
	b _0808C35C
	.align 2, 0
_0808C354: .4byte gUnknown_0202BCB0
_0808C358:
	movs r0, #1
	negs r0, r0
_0808C35C:
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_808C33C

	THUMB_FUNC_START sub_808C360
sub_808C360: @ 0x0808C360
	ldr r2, _0808C380  @ 0x00002120
	adds r0, r2, #0
	strh r0, [r1]
	ldr r3, _0808C384  @ 0x00002121
	adds r0, r3, #0
	strh r0, [r1, #2]
	movs r2, #0
	strh r2, [r1, #4]
	strh r2, [r1, #6]
	adds r3, #0x1d
	adds r0, r3, #0
	strh r0, [r1, #8]
	strh r2, [r1, #0xa]
	strh r2, [r1, #0xc]
	bx lr
	.align 2, 0
_0808C380: .4byte 0x00002120
_0808C384: .4byte 0x00002121

	THUMB_FUNC_END sub_808C360

	THUMB_FUNC_START sub_808C388
sub_808C388: @ 0x0808C388
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r4, _0808C3AC  @ 0x0000016F
	cmp r1, #0
	beq _0808C448
	adds r1, #0x30
	ldrb r0, [r1]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1c
	adds r6, r1, #0
	cmp r0, #0xd
	bhi _0808C41C
	lsls r0, r0, #2
	ldr r1, _0808C3B0  @ _0808C3B4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0808C3AC: .4byte 0x0000016F
_0808C3B0: .4byte _0808C3B4
_0808C3B4: @ jump table
	.4byte _0808C448 @ case 0
	.4byte _0808C3EC @ case 1
	.4byte _0808C3F0 @ case 2
	.4byte _0808C3F4 @ case 3
	.4byte _0808C3FA @ case 4
	.4byte _0808C400 @ case 5
	.4byte _0808C406 @ case 6
	.4byte _0808C40C @ case 7
	.4byte _0808C412 @ case 8
	.4byte _0808C448 @ case 9
	.4byte _0808C448 @ case 10
	.4byte _0808C418 @ case 11
	.4byte _0808C41C @ case 12
	.4byte _0808C418 @ case 13
_0808C3EC:
	movs r2, #0
	b _0808C41C
_0808C3F0:
	movs r2, #0xa0
	b _0808C41C
_0808C3F4:
	movs r2, #0xa0
	lsls r2, r2, #1
	b _0808C41C
_0808C3FA:
	movs r2, #0xf0
	lsls r2, r2, #1
	b _0808C41C
_0808C400:
	movs r2, #0xa0
	lsls r2, r2, #2
	b _0808C41C
_0808C406:
	movs r2, #0xc8
	lsls r2, r2, #2
	b _0808C41C
_0808C40C:
	movs r2, #0xf0
	lsls r2, r2, #2
	b _0808C41C
_0808C412:
	movs r2, #0x8c
	lsls r2, r2, #3
	b _0808C41C
_0808C418:
	movs r2, #0xa0
	lsls r2, r2, #3
_0808C41C:
	ldr r0, _0808C450  @ gUnknown_08A16DEC
	adds r0, r2, r0
	ldr r1, _0808C454  @ 0x06002DE0
	movs r2, #0x28
	bl CpuFastSet
	strh r4, [r5]
	adds r4, #1
	strh r4, [r5, #2]
	adds r4, #1
	strh r4, [r5, #4]
	adds r4, #1
	strh r4, [r5, #6]
	adds r4, #1
	strh r4, [r5, #8]
	movs r0, #0
	strh r0, [r5, #0xa]
	ldrb r0, [r6]
	lsrs r0, r0, #4
	ldr r1, _0808C458  @ 0x00001128
	adds r0, r0, r1
	strh r0, [r5, #0xc]
_0808C448:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0808C450: .4byte gUnknown_08A16DEC
_0808C454: .4byte 0x06002DE0
_0808C458: .4byte 0x00001128

	THUMB_FUNC_END sub_808C388

	THUMB_FUNC_START DrawMinimugBoxMaybe
DrawMinimugBoxMaybe: @ 0x0808C45C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r0, #0x44
	ldrh r2, [r0]
	adds r0, r5, #0
	adds r0, #0x30
	ldrb r1, [r0]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #0xa
	bne _0808C47A
	movs r2, #0
_0808C47A:
	lsls r1, r2, #0x10
	asrs r2, r1, #0x10
	movs r0, #0x3f
	ands r0, r2
	adds r6, r1, #0
	cmp r0, #0
	bne _0808C518
	movs r0, #0x40
	ands r0, r2
	cmp r0, #0
	beq _0808C4A0
	ldr r0, [r4, #0x40]
	adds r1, r5, #0
	bl sub_808C388
	movs r0, #1
	bl BG_EnableSyncByMask
	b _0808C518
_0808C4A0:
	adds r0, r5, #0
	bl GetUnitCurrentHp
	cmp r0, #0x63
	ble _0808C4B2
	movs r0, #0xff
	bl StoreNumberStringOrDashesToSmallBuffer
	b _0808C4BC
_0808C4B2:
	adds r0, r5, #0
	bl GetUnitCurrentHp
	bl StoreNumberStringOrDashesToSmallBuffer
_0808C4BC:
	ldr r1, _0808C4E4  @ gUnknown_02028E44
	ldrb r0, [r1, #6]
	subs r0, #0x30
	adds r2, r4, #0
	adds r2, #0x51
	strb r0, [r2]
	ldrb r0, [r1, #7]
	subs r0, #0x30
	adds r1, r4, #0
	adds r1, #0x52
	strb r0, [r1]
	adds r0, r5, #0
	bl GetUnitMaxHp
	cmp r0, #0x63
	ble _0808C4E8
	movs r0, #0xff
	bl StoreNumberStringOrDashesToSmallBuffer
	b _0808C4F2
	.align 2, 0
_0808C4E4: .4byte gUnknown_02028E44
_0808C4E8:
	adds r0, r5, #0
	bl GetUnitMaxHp
	bl StoreNumberStringOrDashesToSmallBuffer
_0808C4F2:
	ldr r1, _0808C5C4  @ gUnknown_02028E44
	ldrb r0, [r1, #6]
	subs r0, #0x30
	adds r2, r4, #0
	adds r2, #0x53
	strb r0, [r2]
	ldrb r0, [r1, #7]
	subs r0, #0x30
	adds r1, r4, #0
	adds r1, #0x54
	strb r0, [r1]
	ldr r1, [r4, #0x40]
	adds r0, r4, #0
	adds r2, r5, #0
	bl sub_808C360
	movs r0, #1
	bl BG_EnableSyncByMask
_0808C518:
	adds r0, r4, #0
	adds r0, #0x55
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _0808C5BA
	asrs r0, r6, #0x10
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0808C53E
	adds r0, r5, #0
	adds r0, #0x30
	ldrb r1, [r0]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #0
	bne _0808C5BA
_0808C53E:
	adds r0, r4, #0
	adds r0, #0x46
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r5, r0, #3
	adds r7, r5, #0
	adds r7, #0x11
	adds r0, r4, #0
	adds r0, #0x48
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r6, r0, #3
	adds r1, r4, #0
	adds r1, #0x51
	ldrb r0, [r1]
	cmp r0, #0xf0
	beq _0808C570
	ldr r2, _0808C5C8  @ gObject_8x8
	adds r3, r0, #0
	ldr r0, _0808C5CC  @ 0x000082E0
	adds r3, r3, r0
	adds r0, r7, #0
	adds r1, r6, #0
	bl CallARM_PushToSecondaryOAM
_0808C570:
	adds r0, r5, #0
	adds r0, #0x18
	ldr r7, _0808C5C8  @ gObject_8x8
	adds r1, r4, #0
	adds r1, #0x52
	ldrb r3, [r1]
	ldr r1, _0808C5CC  @ 0x000082E0
	mov r8, r1
	add r3, r8
	adds r1, r6, #0
	adds r2, r7, #0
	bl CallARM_PushToSecondaryOAM
	adds r1, r4, #0
	adds r1, #0x53
	ldrb r0, [r1]
	cmp r0, #0xf0
	beq _0808C5A6
	adds r0, r5, #0
	adds r0, #0x29
	ldrb r3, [r1]
	ldr r1, _0808C5CC  @ 0x000082E0
	adds r3, r3, r1
	adds r1, r6, #0
	adds r2, r7, #0
	bl CallARM_PushToSecondaryOAM
_0808C5A6:
	adds r0, r5, #0
	adds r0, #0x30
	adds r1, r4, #0
	adds r1, #0x54
	ldrb r3, [r1]
	add r3, r8
	adds r1, r6, #0
	adds r2, r7, #0
	bl CallARM_PushToSecondaryOAM
_0808C5BA:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808C5C4: .4byte gUnknown_02028E44
_0808C5C8: .4byte gObject_8x8
_0808C5CC: .4byte 0x000082E0

	THUMB_FUNC_END DrawMinimugBoxMaybe

	THUMB_FUNC_START InitMinimugBoxMaybe
InitMinimugBoxMaybe: @ 0x0808C5D0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r7, r0, #0
	mov r8, r1
	movs r0, #0
	mov sl, r0
	str r0, [sp, #4]
	ldr r1, _0808C688  @ gBmFrameTmap0
	mov r9, r1
	ldr r2, _0808C68C  @ 0x01000060
	add r0, sp, #4
	bl CpuFastSet
	mov r1, r8
	ldr r0, [r1]
	ldrh r0, [r0]
	bl GetStringFromIndex
	adds r6, r0, #0
	movs r0, #0x38
	adds r1, r6, #0
	bl GetStringTextCenteredPos
	adds r5, r0, #0
	adds r4, r7, #0
	adds r4, #0x2c
	adds r0, r4, #0
	bl Text_Clear
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #5
	bl Text_SetParameters
	adds r0, r4, #0
	adds r1, r6, #0
	bl Text_AppendString
	mov r1, r9
	adds r1, #0x4a
	adds r0, r4, #0
	bl Text_Draw
	mov r0, r8
	bl GetUnitMiniPortraitId
	adds r2, r0, #0
	mov r1, r8
	ldr r0, [r1, #0xc]
	movs r1, #0x80
	lsls r1, r1, #0x10
	ands r0, r1
	cmp r0, #0
	beq _0808C646
	adds r2, #1
_0808C646:
	mov r1, r9
	adds r1, #0x42
	mov r0, sl
	str r0, [sp]
	adds r0, r2, #0
	movs r2, #0xf0
	movs r3, #4
	bl sub_8005988
	mov r0, r9
	adds r0, #0xca
	str r0, [r7, #0x40]
	adds r0, r7, #0
	adds r0, #0x44
	mov r1, sl
	strh r1, [r0]
	ldr r2, _0808C690  @ gUnknown_08A01828
	adds r1, r7, #0
	adds r1, #0x50
	movs r0, #0
	ldrsb r0, [r1, r0]
	lsls r0, r0, #3
	adds r0, r0, r2
	ldrb r0, [r0, #2]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bge _0808C694
	adds r2, r7, #0
	adds r2, #0x46
	movs r0, #5
	b _0808C69A
	.align 2, 0
_0808C688: .4byte gBmFrameTmap0
_0808C68C: .4byte 0x01000060
_0808C690: .4byte gUnknown_08A01828
_0808C694:
	adds r2, r7, #0
	adds r2, #0x46
	movs r0, #0x17
_0808C69A:
	strh r0, [r2]
	ldr r0, _0808C6B8  @ gUnknown_08A01828
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	lsls r1, r1, #3
	adds r1, r1, r0
	movs r0, #3
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bge _0808C6BC
	adds r1, r7, #0
	adds r1, #0x48
	movs r0, #3
	b _0808C6C2
	.align 2, 0
_0808C6B8: .4byte gUnknown_08A01828
_0808C6BC:
	adds r1, r7, #0
	adds r1, #0x48
	movs r0, #0x11
_0808C6C2:
	strh r0, [r1]
	adds r0, r7, #0
	mov r1, r8
	bl DrawMinimugBoxMaybe
	ldr r0, _0808C704  @ gUnknown_02003E36
	movs r2, #0x8a
	lsls r2, r2, #5
	mov r1, r8
	bl sub_808BC94
	ldr r0, _0808C708  @ gUnknown_0200422C
	ldr r1, _0808C70C  @ gUnknown_08A17484
	movs r2, #0xc0
	lsls r2, r2, #6
	bl CallARM_FillTileRect
	mov r1, r8
	movs r0, #0xb
	ldrsb r0, [r1, r0]
	movs r1, #0xc0
	ands r0, r1
	movs r1, #3
	bl sub_808C2CC
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808C704: .4byte gUnknown_02003E36
_0808C708: .4byte gUnknown_0200422C
_0808C70C: .4byte gUnknown_08A17484

	THUMB_FUNC_END InitMinimugBoxMaybe

	THUMB_FUNC_START sub_808C710
sub_808C710: @ 0x0808C710
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	bl GetCameraMovementSpeedMaybe
	adds r1, r0, #0
	movs r2, #1
	cmp r4, #5
	ble _0808C734
	cmp r4, #0xb
	bgt _0808C736
	ldr r0, _0808C74C  @ gUnknown_08A01828
	lsls r1, r1, #3
	adds r1, r1, r0
	movs r0, #5
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bge _0808C736
_0808C734:
	movs r2, #4
_0808C736:
	cmp r5, #1
	bgt _0808C73C
	subs r2, #1
_0808C73C:
	cmp r5, #0x16
	ble _0808C742
	adds r2, #1
_0808C742:
	adds r0, r2, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0808C74C: .4byte gUnknown_08A01828

	THUMB_FUNC_END sub_808C710

	THUMB_FUNC_START sub_808C750
sub_808C750: @ 0x0808C750
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r7, r0, #0
	str r1, [sp]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	lsls r0, r0, #4
	ldr r2, _0808C8C4  @ gUnknown_0202BCB0
	movs r3, #0xc
	ldrsh r1, [r2, r3]
	subs r0, r0, r1
	cmp r0, #0
	bge _0808C774
	adds r0, #7
_0808C774:
	asrs r0, r0, #3
	mov sl, r0
	ldr r1, [sp]
	movs r0, #0x11
	ldrsb r0, [r1, r0]
	lsls r0, r0, #4
	movs r3, #0xe
	ldrsh r1, [r2, r3]
	subs r0, r0, r1
	cmp r0, #0
	bge _0808C78C
	adds r0, #7
_0808C78C:
	asrs r4, r0, #3
	mov r0, sl
	adds r1, r4, #0
	bl sub_808C710
	mov r8, r0
	ldr r0, _0808C8C8  @ gUnknown_08A01860
	add r0, r8
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	add sl, r0
	ldr r0, _0808C8CC  @ gUnknown_08A01866
	add r0, r8
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r4, r4, r0
	adds r0, r7, #0
	adds r0, #0x3c
	mov r1, sl
	strb r1, [r0]
	adds r0, #1
	strb r4, [r0]
	adds r1, r7, #0
	adds r1, #0x3e
	movs r0, #8
	strb r0, [r1]
	adds r1, #1
	movs r0, #5
	strb r0, [r1]
	ldr r2, [sp]
	ldr r0, [r2]
	ldrh r0, [r0]
	bl GetStringFromIndex
	mov r9, r0
	movs r0, #0x38
	mov r1, r9
	bl GetStringTextCenteredPos
	adds r6, r0, #0
	adds r5, r7, #0
	adds r5, #0x2c
	adds r0, r5, #0
	bl Text_Clear
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #5
	bl Text_SetParameters
	adds r0, r5, #0
	mov r1, r9
	bl Text_AppendString
	ldr r0, _0808C8D0  @ gUnknown_08A0184E
	add r0, r8
	movs r1, #0
	ldrsb r1, [r0, r1]
	adds r1, r4, r1
	lsls r1, r1, #5
	ldr r0, _0808C8D4  @ gUnknown_08A01848
	add r0, r8
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	add r0, sl
	adds r1, r1, r0
	lsls r1, r1, #1
	ldr r6, _0808C8D8  @ gBG0TilemapBuffer
	adds r1, r1, r6
	adds r0, r5, #0
	bl Text_Draw
	adds r1, r4, #3
	lsls r0, r1, #5
	adds r0, #1
	add r0, sl
	lsls r0, r0, #1
	adds r0, r0, r6
	str r0, [r7, #0x40]
	adds r0, r7, #0
	adds r0, #0x44
	movs r3, #0
	strh r3, [r0]
	mov r0, sl
	adds r0, #1
	adds r2, r7, #0
	adds r2, #0x46
	strh r0, [r2]
	adds r0, r7, #0
	adds r0, #0x48
	strh r1, [r0]
	adds r0, r7, #0
	ldr r1, [sp]
	bl DrawMinimugBoxMaybe
	lsls r0, r4, #5
	add r0, sl
	lsls r0, r0, #1
	ldr r5, _0808C8DC  @ gBG1TilemapBuffer
	adds r0, r0, r5
	ldr r1, _0808C8E0  @ gUnknown_08A0186C
	mov r2, r8
	lsls r2, r2, #2
	mov r8, r2
	add r1, r8
	ldr r1, [r1]
	movs r6, #0xc4
	lsls r6, r6, #6
	adds r2, r6, #0
	bl CallARM_FillTileRect
	adds r0, r4, #1
	lsls r0, r0, #5
	add r0, sl
	lsls r0, r0, #1
	adds r0, r0, r5
	ldr r1, _0808C8E4  @ gUnknown_08A17604
	adds r2, r6, #0
	bl CallARM_FillTileRect
	adds r4, #4
	lsls r4, r4, #5
	add r4, sl
	lsls r4, r4, #1
	adds r4, r4, r5
	ldr r0, _0808C8E8  @ gUnknown_08A01884
	add r8, r0
	mov r3, r8
	ldr r1, [r3]
	adds r0, r4, #0
	adds r2, r6, #0
	bl CallARM_FillTileRect
	movs r0, #3
	bl BG_EnableSyncByMask
	ldr r1, [sp]
	movs r0, #0xb
	ldrsb r0, [r1, r0]
	movs r1, #0xc0
	ands r0, r1
	movs r1, #3
	bl sub_808C2CC
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808C8C4: .4byte gUnknown_0202BCB0
_0808C8C8: .4byte gUnknown_08A01860
_0808C8CC: .4byte gUnknown_08A01866
_0808C8D0: .4byte gUnknown_08A0184E
_0808C8D4: .4byte gUnknown_08A01848
_0808C8D8: .4byte gBG0TilemapBuffer
_0808C8DC: .4byte gBG1TilemapBuffer
_0808C8E0: .4byte gUnknown_08A0186C
_0808C8E4: .4byte gUnknown_08A17604
_0808C8E8: .4byte gUnknown_08A01884

	THUMB_FUNC_END sub_808C750

	THUMB_FUNC_START sub_808C8EC
sub_808C8EC: @ 0x0808C8EC
	push {r4, r5, r6, r7, lr}
	adds r2, r0, #0
	ldrh r1, [r2, #0x3e]
	movs r0, #0xa1
	lsls r0, r0, #3
	cmp r1, r0
	bne _0808C956
	adds r7, r2, #0
	adds r7, #0x3d
	movs r0, #0
	ldrsb r0, [r7, r0]
	lsls r0, r0, #5
	adds r5, r2, #0
	adds r5, #0x3c
	movs r1, #0
	ldrsb r1, [r5, r1]
	adds r0, r0, r1
	lsls r0, r0, #1
	ldr r1, _0808C95C  @ gBG0TilemapBuffer
	adds r0, r0, r1
	adds r6, r2, #0
	adds r6, #0x3e
	movs r1, #0
	ldrsb r1, [r6, r1]
	adds r4, r2, #0
	adds r4, #0x3f
	movs r2, #0
	ldrsb r2, [r4, r2]
	movs r3, #0
	bl TileMap_FillRect
	movs r0, #0
	ldrsb r0, [r7, r0]
	lsls r0, r0, #5
	movs r1, #0
	ldrsb r1, [r5, r1]
	adds r0, r0, r1
	lsls r0, r0, #1
	ldr r1, _0808C960  @ gBG1TilemapBuffer
	adds r0, r0, r1
	movs r1, #0
	ldrsb r1, [r6, r1]
	movs r2, #0
	ldrsb r2, [r4, r2]
	movs r3, #0
	bl TileMap_FillRect
	movs r0, #3
	bl BG_EnableSyncByMask
	movs r0, #0
	strb r0, [r6]
	strb r0, [r4]
_0808C956:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808C95C: .4byte gBG0TilemapBuffer
_0808C960: .4byte gBG1TilemapBuffer

	THUMB_FUNC_END sub_808C8EC

	THUMB_FUNC_START sub_808C964
sub_808C964: @ 0x0808C964
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	adds r4, r0, #0
	ldr r0, _0808CA48  @ gUnknown_0202BCB0
	mov r9, r0
	movs r1, #0x16
	ldrsh r0, [r0, r1]
	ldr r1, _0808CA4C  @ gBmMapTerrain
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	mov r2, r9
	movs r3, #0x14
	ldrsh r1, [r2, r3]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r7, [r0]
	ldr r0, _0808CA50  @ gUnknown_02003FAC
	mov r8, r0
	movs r1, #0xe
	movs r2, #7
	movs r3, #0
	bl TileMap_FillRect
	ldr r0, _0808CA54  @ gUnknown_020044AC
	movs r1, #0xe
	movs r2, #7
	movs r3, #0
	bl TileMap_FillRect
	adds r0, r7, #0
	bl GetTerrainName
	adds r5, r0, #0
	movs r0, #0x28
	adds r1, r5, #0
	bl GetStringTextCenteredPos
	adds r6, r0, #0
	adds r4, #0x2c
	adds r0, r4, #0
	bl Text_Clear
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #0
	bl Text_SetParameters
	adds r0, r4, #0
	adds r1, r5, #0
	bl Text_AppendString
	mov r1, r8
	adds r1, #0x82
	adds r0, r4, #0
	bl Text_Draw
	movs r6, #0x81
	lsls r6, r6, #1
	add r6, r8
	ldr r1, _0808CA58  @ gUnknown_08A1768C
	movs r2, #0x84
	lsls r2, r2, #6
	adds r0, r6, #0
	bl CallARM_FillTileRect
	ldr r0, _0808CA5C  @ gUnknown_0880B90C
	adds r0, r7, r0
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	ble _0808CA3A
	ldr r0, _0808CA60  @ gUnknown_0880C4BA
	adds r0, r7, r0
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl StoreNumberStringToSmallBuffer
	movs r0, #0x85
	lsls r0, r0, #1
	add r0, r8
	ldr r4, _0808CA64  @ gUnknown_02028E44+7
	ldr r5, _0808CA68  @ 0x00002128
	adds r1, r4, #0
	adds r2, r5, #0
	movs r3, #2
	bl sub_8013138
	ldr r0, _0808CA6C  @ gUnknown_0880C479
	adds r0, r7, r0
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl StoreNumberStringToSmallBuffer
	movs r0, #0xa5
	lsls r0, r0, #1
	add r0, r8
	adds r1, r4, #0
	adds r2, r5, #0
	movs r3, #2
	bl sub_8013138
_0808CA3A:
	cmp r7, #0x29
	bgt _0808CA70
	cmp r7, #0x27
	bge _0808CAD8
	cmp r7, #0x1b
	beq _0808CA74
	b _0808CB06
	.align 2, 0
_0808CA48: .4byte gUnknown_0202BCB0
_0808CA4C: .4byte gBmMapTerrain
_0808CA50: .4byte gUnknown_02003FAC
_0808CA54: .4byte gUnknown_020044AC
_0808CA58: .4byte gUnknown_08A1768C
_0808CA5C: .4byte gUnknown_0880B90C
_0808CA60: .4byte gUnknown_0880C4BA
_0808CA64: .4byte gUnknown_02028E44+7
_0808CA68: .4byte 0x00002128
_0808CA6C: .4byte gUnknown_0880C479
_0808CA70:
	cmp r7, #0x33
	bne _0808CB06
_0808CA74:
	ldr r4, _0808CAA8  @ gUnknown_020040AE
	ldr r1, _0808CAAC  @ gUnknown_08A176A4
	movs r2, #0x84
	lsls r2, r2, #6
	adds r0, r4, #0
	bl CallARM_FillTileRect
	ldr r1, _0808CAB0  @ gUnknown_0202BCB0
	movs r2, #0x14
	ldrsh r0, [r1, r2]
	movs r3, #0x16
	ldrsh r1, [r1, r3]
	bl GetObstacleHpAt
	adds r6, r0, #0
	cmp r6, #0x64
	bne _0808CAB8
	adds r0, r4, #0
	adds r0, #0x46
	ldr r1, _0808CAB4  @ gUnknown_08A176B4
	movs r2, #0x80
	lsls r2, r2, #1
	bl CallARM_FillTileRect
	b _0808CB06
	.align 2, 0
_0808CAA8: .4byte gUnknown_020040AE
_0808CAAC: .4byte gUnknown_08A176A4
_0808CAB0: .4byte gUnknown_0202BCB0
_0808CAB4: .4byte gUnknown_08A176B4
_0808CAB8:
	adds r0, r6, #0
	bl StoreNumberStringToSmallBuffer
	adds r0, r4, #0
	adds r0, #0x48
	ldr r1, _0808CAD0  @ gUnknown_02028E44+7
	ldr r2, _0808CAD4  @ 0x00002128
	movs r3, #2
	bl sub_8013138
	b _0808CB06
	.align 2, 0
_0808CAD0: .4byte gUnknown_02028E44+7
_0808CAD4: .4byte 0x00002128
_0808CAD8:
	ldr r1, _0808CB20  @ gUnknown_08A1769C
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r6, #0
	bl CallARM_FillTileRect
	mov r1, r9
	movs r2, #0x14
	ldrsh r0, [r1, r2]
	movs r3, #0x16
	ldrsh r1, [r1, r3]
	bl GetObstacleHpAt
	bl StoreNumberStringToSmallBuffer
	movs r0, #0x85
	lsls r0, r0, #1
	add r0, r8
	ldr r1, _0808CB24  @ gUnknown_02028E44+7
	ldr r2, _0808CB28  @ 0x00002128
	movs r3, #2
	bl sub_8013138
_0808CB06:
	ldr r0, _0808CB2C  @ gUnknown_020044EC
	ldr r1, _0808CB30  @ gUnknown_08A1742C
	movs r2, #0x80
	lsls r2, r2, #5
	bl CallARM_FillTileRect
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808CB20: .4byte gUnknown_08A1769C
_0808CB24: .4byte gUnknown_02028E44+7
_0808CB28: .4byte 0x00002128
_0808CB2C: .4byte gUnknown_020044EC
_0808CB30: .4byte gUnknown_08A1742C

	THUMB_FUNC_END sub_808C964

	THUMB_FUNC_START sub_808CB34
sub_808CB34: @ 0x0808CB34
	push {lr}
	adds r2, r0, #0
	adds r1, r2, #0
	adds r1, #0x57
	movs r0, #0xff
	strb r0, [r1]
	subs r1, #1
	movs r0, #0
	strb r0, [r1]
	str r0, [r2, #0x58]
	subs r1, #6
	movs r0, #1
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x2c
	movs r1, #5
	bl Text_Allocate
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_808CB34

	THUMB_FUNC_START sub_808CB5C
sub_808CB5C: @ 0x0808CB5C
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r1, r5, #0
	adds r1, #0x55
	movs r0, #1
	strb r0, [r1]
	bl GetCameraMovementSpeedMaybe
	adds r1, r5, #0
	adds r1, #0x50
	strb r0, [r1]
	ldr r0, _0808CBF0  @ gUnknown_08A01828
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	lsls r1, r1, #3
	adds r1, r1, r0
	movs r0, #0
	ldrsb r0, [r1, r0]
	ldrb r1, [r1, #1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl sub_808BBAC
	adds r6, r0, #0
	ldr r0, _0808CBF4  @ gUnknown_08A0190C
	bl Proc_Find
	adds r4, r0, #0
	cmp r4, #0
	beq _0808CBAA
	adds r1, r4, #0
	adds r1, #0x57
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	blt _0808CBAA
	cmp r0, r6
	beq _0808CBE8
_0808CBAA:
	ldr r0, _0808CBF8  @ gUnknown_08A019E4
	bl Proc_Find
	cmp r4, #0
	beq _0808CBC4
	adds r1, r0, #0
	adds r1, #0x57
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	blt _0808CBC4
	cmp r0, r6
	beq _0808CBE8
_0808CBC4:
	adds r0, r5, #0
	adds r0, #0x57
	strb r6, [r0]
	adds r0, r5, #0
	bl sub_808C964
	ldr r0, _0808CBFC  @ gUnknown_0202BCB0
	ldrh r1, [r0, #0x14]
	adds r2, r5, #0
	adds r2, #0x4e
	strb r1, [r2]
	ldrh r0, [r0, #0x16]
	adds r1, r5, #0
	adds r1, #0x4f
	strb r0, [r1]
	adds r0, r5, #0
	bl Proc_Break
_0808CBE8:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0808CBF0: .4byte gUnknown_08A01828
_0808CBF4: .4byte gUnknown_08A0190C
_0808CBF8: .4byte gUnknown_08A019E4
_0808CBFC: .4byte gUnknown_0202BCB0

	THUMB_FUNC_END sub_808CB5C

	THUMB_FUNC_START sub_808CC00
sub_808CC00: @ 0x0808CC00
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r3, r4, #0
	adds r3, #0x4e
	ldrb r0, [r3]
	adds r2, r4, #0
	adds r2, #0x4c
	strb r0, [r2]
	movs r0, #0x4f
	adds r0, r0, r4
	mov ip, r0
	ldrb r0, [r0]
	adds r1, r4, #0
	adds r1, #0x4d
	strb r0, [r1]
	ldr r1, _0808CC80  @ gUnknown_0202BCB0
	ldrh r0, [r1, #0x14]
	strb r0, [r3]
	ldrh r0, [r1, #0x16]
	mov r1, ip
	strb r0, [r1]
	ldrh r0, [r3]
	ldrh r2, [r2]
	cmp r0, r2
	beq _0808CC9A
	ldr r0, _0808CC84  @ gUnknown_0859A548
	bl Proc_Find
	cmp r0, #0
	bne _0808CC8C
	bl GetCameraMovementSpeedMaybe
	adds r2, r0, #0
	adds r0, r4, #0
	adds r0, #0x50
	movs r3, #0
	ldrsb r3, [r0, r3]
	cmp r2, r3
	beq _0808CC70
	ldr r1, _0808CC88  @ gUnknown_08A01828
	lsls r0, r2, #3
	adds r5, r0, r1
	lsls r0, r3, #3
	adds r2, r0, r1
	movs r1, #0
	ldrsb r1, [r5, r1]
	movs r0, #0
	ldrsb r0, [r2, r0]
	cmp r1, r0
	bne _0808CC8C
	movs r1, #1
	ldrsb r1, [r5, r1]
	movs r0, #1
	ldrsb r0, [r2, r0]
	cmp r1, r0
	bne _0808CC8C
_0808CC70:
	adds r0, r4, #0
	bl sub_808C964
	adds r0, r4, #0
	bl sub_808C288
	b _0808CC9A
	.align 2, 0
_0808CC80: .4byte gUnknown_0202BCB0
_0808CC84: .4byte gUnknown_0859A548
_0808CC88: .4byte gUnknown_08A01828
_0808CC8C:
	adds r1, r4, #0
	adds r1, #0x56
	movs r0, #1
	strb r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
_0808CC9A:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_808CC00

	THUMB_FUNC_START sub_808CCA0
sub_808CCA0: @ 0x0808CCA0
	push {r4, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x57
	movs r0, #0xff
	strb r0, [r1]
	adds r0, r4, #0
	adds r0, #0x2c
	movs r1, #7
	bl Text_Allocate
	movs r1, #0
	str r1, [r4, #0x58]
	adds r0, r4, #0
	adds r0, #0x56
	strb r1, [r0]
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_808CCA0

	THUMB_FUNC_START Loop6CUI1_Hidden
Loop6CUI1_Hidden: @ 0x0808CCC8
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r2, _0808CD64  @ gUnknown_0202BCB0
	movs r1, #0x16
	ldrsh r0, [r2, r1]
	ldr r1, _0808CD68  @ gBmMapUnit
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r3, #0x14
	ldrsh r1, [r2, r3]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	bl GetUnit
	adds r6, r0, #0
	cmp r6, #0
	beq _0808CD5C
	adds r1, r4, #0
	adds r1, #0x55
	movs r0, #1
	strb r0, [r1]
	bl GetCameraMovementSpeedMaybe
	adds r1, r4, #0
	adds r1, #0x50
	strb r0, [r1]
	ldr r0, _0808CD6C  @ gUnknown_08A01828
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	lsls r1, r1, #3
	adds r1, r1, r0
	movs r0, #2
	ldrsb r0, [r1, r0]
	ldrb r1, [r1, #3]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl sub_808BBAC
	adds r5, r0, #0
	ldr r0, _0808CD70  @ gUnknown_08A018AC
	bl Proc_Find
	cmp r0, #0
	beq _0808CD36
	adds r1, r0, #0
	adds r1, #0x57
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	blt _0808CD36
	cmp r0, r5
	beq _0808CD5C
_0808CD36:
	adds r0, r4, #0
	adds r0, #0x57
	strb r5, [r0]
	ldr r0, _0808CD64  @ gUnknown_0202BCB0
	ldrh r1, [r0, #0x14]
	adds r2, r4, #0
	adds r2, #0x4e
	strb r1, [r2]
	ldrh r0, [r0, #0x16]
	adds r1, r4, #0
	adds r1, #0x4f
	strb r0, [r1]
	adds r0, r4, #0
	adds r1, r6, #0
	bl InitMinimugBoxMaybe
	adds r0, r4, #0
	bl Proc_Break
_0808CD5C:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0808CD64: .4byte gUnknown_0202BCB0
_0808CD68: .4byte gBmMapUnit
_0808CD6C: .4byte gUnknown_08A01828
_0808CD70: .4byte gUnknown_08A018AC

	THUMB_FUNC_END Loop6CUI1_Hidden

	THUMB_FUNC_START Loop6CUI1_Displayed
Loop6CUI1_Displayed: @ 0x0808CD74
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r6, _0808CE2C  @ gUnknown_0202BCB0
	movs r1, #0x16
	ldrsh r0, [r6, r1]
	ldr r1, _0808CE30  @ gBmMapUnit
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r2, #0x14
	ldrsh r1, [r6, r2]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	bl GetUnit
	adds r7, r0, #0
	adds r4, r5, #0
	adds r4, #0x44
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
	adds r0, r5, #0
	adds r1, r7, #0
	bl DrawMinimugBoxMaybe
	ldrh r1, [r4]
	movs r0, #0x3f
	ands r0, r1
	cmp r0, #0
	bne _0808CDB8
	adds r0, r5, #0
	bl sub_808C234
_0808CDB8:
	adds r3, r5, #0
	adds r3, #0x4e
	ldrb r0, [r3]
	adds r1, r5, #0
	adds r1, #0x4c
	strb r0, [r1]
	adds r4, r5, #0
	adds r4, #0x4f
	ldrb r0, [r4]
	adds r2, r5, #0
	adds r2, #0x4d
	strb r0, [r2]
	ldrh r0, [r6, #0x14]
	strb r0, [r3]
	ldrh r0, [r6, #0x16]
	strb r0, [r4]
	ldrh r0, [r3]
	ldrh r1, [r1]
	cmp r0, r1
	beq _0808CE4A
	cmp r7, #0
	beq _0808CE3C
	ldr r0, _0808CE34  @ gUnknown_0859A548
	bl Proc_Find
	cmp r0, #0
	bne _0808CE3C
	bl GetCameraMovementSpeedMaybe
	adds r2, r0, #0
	adds r0, r5, #0
	adds r0, #0x50
	movs r3, #0
	ldrsb r3, [r0, r3]
	cmp r2, r3
	beq _0808CE22
	ldr r1, _0808CE38  @ gUnknown_08A01828
	lsls r0, r2, #3
	adds r4, r0, r1
	lsls r0, r3, #3
	adds r2, r0, r1
	movs r1, #2
	ldrsb r1, [r4, r1]
	movs r0, #2
	ldrsb r0, [r2, r0]
	cmp r1, r0
	bne _0808CE3C
	movs r1, #3
	ldrsb r1, [r4, r1]
	movs r0, #3
	ldrsb r0, [r2, r0]
	cmp r1, r0
	bne _0808CE3C
_0808CE22:
	adds r0, r5, #0
	movs r1, #1
	bl Proc_Goto
	b _0808CE4A
	.align 2, 0
_0808CE2C: .4byte gUnknown_0202BCB0
_0808CE30: .4byte gBmMapUnit
_0808CE34: .4byte gUnknown_0859A548
_0808CE38: .4byte gUnknown_08A01828
_0808CE3C:
	adds r1, r5, #0
	adds r1, #0x56
	movs r0, #1
	strb r0, [r1]
	adds r0, r5, #0
	bl Proc_Break
_0808CE4A:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END Loop6CUI1_Displayed

	THUMB_FUNC_START sub_808CE50
sub_808CE50: @ 0x0808CE50
	push {r4, lr}
	adds r4, r0, #0
	ldr r2, _0808CE80  @ gUnknown_0202BCB0
	movs r1, #0x16
	ldrsh r0, [r2, r1]
	ldr r1, _0808CE84  @ gBmMapUnit
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r3, #0x14
	ldrsh r1, [r2, r3]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	bl GetUnit
	adds r1, r0, #0
	cmp r1, #0
	bne _0808CE88
	adds r0, r4, #0
	movs r1, #3
	bl Proc_Goto
	b _0808CE94
	.align 2, 0
_0808CE80: .4byte gUnknown_0202BCB0
_0808CE84: .4byte gBmMapUnit
_0808CE88:
	adds r0, r4, #0
	bl InitMinimugBoxMaybe
	adds r0, r4, #0
	bl sub_808C234
_0808CE94:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_808CE50

	THUMB_FUNC_START Init6CUI2
Init6CUI2: @ 0x0808CE9C
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	movs r1, #7
	bl Text_Allocate
	adds r0, r4, #0
	adds r0, #0x4b
	movs r1, #0
	strb r1, [r0]
	adds r0, #0xa
	strb r1, [r0]
	str r1, [r4, #0x58]
	subs r0, #0x17
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #0x17
	strb r1, [r0]
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END Init6CUI2

	THUMB_FUNC_START Loop6CUI2
Loop6CUI2: @ 0x0808CEC8
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r4, #0
	adds r5, #0x4b
	ldrb r0, [r5]
	adds r3, r4, #0
	adds r3, #0x4a
	strb r0, [r3]
	ldr r2, _0808CF0C  @ gUnknown_0202BCB0
	movs r1, #0x16
	ldrsh r0, [r2, r1]
	ldr r1, _0808CF10  @ gBmMapUnit
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r6, #0x14
	ldrsh r1, [r2, r6]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	strb r0, [r5]
	ldrb r1, [r3]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r1, r0
	beq _0808CF14
	cmp r1, #0
	beq _0808CF14
	adds r0, r4, #0
	bl sub_808C8EC
	movs r0, #0
	str r0, [r4, #0x58]
	b _0808CFBC
	.align 2, 0
_0808CF0C: .4byte gUnknown_0202BCB0
_0808CF10: .4byte gBmMapUnit
_0808CF14:
	adds r0, r4, #0
	adds r0, #0x4b
	ldrb r1, [r0]
	adds r6, r0, #0
	cmp r1, #0
	beq _0808CFBC
	ldr r0, _0808CF64  @ gUnknown_0859A548
	bl Proc_Find
	cmp r0, #0
	bne _0808CFBC
	ldr r0, _0808CF68  @ gUnknown_08A018AC
	bl Proc_Find
	adds r5, r0, #0
	cmp r5, #0
	beq _0808CF42
	adds r0, #0x55
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _0808CF58
_0808CF42:
	ldr r0, _0808CF6C  @ gUnknown_08A019E4
	bl Proc_Find
	cmp r0, #0
	beq _0808CF70
	adds r0, #0x55
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0808CF70
_0808CF58:
	ldr r0, [r4, #0x58]
	cmp r0, #3
	bgt _0808CFBC
	adds r0, #1
	str r0, [r4, #0x58]
	b _0808CFBC
	.align 2, 0
_0808CF64: .4byte gUnknown_0859A548
_0808CF68: .4byte gUnknown_08A018AC
_0808CF6C: .4byte gUnknown_08A019E4
_0808CF70:
	ldr r0, [r4, #0x58]
	adds r0, #1
	str r0, [r4, #0x58]
	cmp r0, #7
	ble _0808CFBC
	cmp r0, #8
	bne _0808CF8E
	ldrb r0, [r6]
	bl GetUnit
	adds r1, r0, #0
	adds r0, r4, #0
	bl sub_808C750
	b _0808CFBC
_0808CF8E:
	adds r1, r4, #0
	adds r1, #0x44
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	cmp r5, #0
	beq _0808CFA6
	adds r0, r5, #0
	adds r0, #0x55
	ldrb r0, [r0]
	adds r1, #0x11
	b _0808CFAC
_0808CFA6:
	adds r1, r4, #0
	adds r1, #0x55
	movs r0, #0
_0808CFAC:
	strb r0, [r1]
	ldrb r0, [r6]
	bl GetUnit
	adds r1, r0, #0
	adds r0, r4, #0
	bl DrawMinimugBoxMaybe
_0808CFBC:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END Loop6CUI2

	THUMB_FUNC_START InitPlayerPhaseInterfaceMaybe
InitPlayerPhaseInterfaceMaybe: @ 0x0808CFC4
	push {r4, lr}
	sub sp, #4
	ldr r2, _0808D0A8  @ gLCDControlBuffer
	ldrb r1, [r2, #1]
	movs r0, #0x21
	negs r0, r0
	ands r0, r1
	movs r1, #0x41
	negs r1, r1
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r2, #1]
	adds r2, #0x36
	ldrb r0, [r2]
	movs r1, #1
	orrs r0, r1
	movs r1, #2
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	movs r1, #0x20
	orrs r0, r1
	strb r0, [r2]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	movs r0, #1
	movs r1, #0xd
	movs r2, #3
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	movs r0, #0
	str r0, [sp]
	movs r1, #1
	movs r2, #0
	movs r3, #0
	bl sub_8001ED0
	movs r0, #0
	bl sub_8001F48
	movs r0, #1
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #1
	movs r3, #1
	bl sub_8001F0C
	ldr r0, _0808D0AC  @ gUnknown_08A167C8
	ldr r1, _0808D0B0  @ 0x06002000
	bl CopyDataWithPossibleUncomp
	ldr r0, _0808D0B4  @ gUnknown_08A16D6C
	ldr r1, _0808D0B8  @ 0x06015C00
	bl CopyDataWithPossibleUncomp
	ldr r0, _0808D0BC  @ 0x06002EA0
	ldr r1, _0808D0C0  @ 0x06015D40
	movs r2, #8
	bl CpuFastSet
	ldr r0, _0808D0C4  @ gPaletteBuffer
	movs r1, #0xc0
	lsls r1, r1, #2
	movs r2, #0x20
	bl CopyToPaletteBuffer
	movs r0, #1
	movs r1, #2
	bl LoadIconPalette
	bl sub_8003D20
	ldr r4, _0808D0C8  @ gRAMChapterData
	adds r0, r4, #0
	adds r0, #0x40
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0808D092
	ldr r0, _0808D0CC  @ gUnknown_08A018AC
	movs r1, #3
	bl Proc_Start
_0808D092:
	ldr r0, _0808D0D0  @ gUnknown_0202BCB0
	ldrb r1, [r0, #4]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _0808D0D8
	ldr r0, _0808D0D4  @ gUnknown_08A01A44
	movs r1, #3
	bl Proc_Start
	b _0808D0F8
	.align 2, 0
_0808D0A8: .4byte gLCDControlBuffer
_0808D0AC: .4byte gUnknown_08A167C8
_0808D0B0: .4byte 0x06002000
_0808D0B4: .4byte gUnknown_08A16D6C
_0808D0B8: .4byte 0x06015C00
_0808D0BC: .4byte 0x06002EA0
_0808D0C0: .4byte 0x06015D40
_0808D0C4: .4byte gPaletteBuffer
_0808D0C8: .4byte gRAMChapterData
_0808D0CC: .4byte gUnknown_08A018AC
_0808D0D0: .4byte gUnknown_0202BCB0
_0808D0D4: .4byte gUnknown_08A01A44
_0808D0D8:
	adds r0, r4, #0
	adds r0, #0x42
	ldrb r0, [r0]
	lsls r0, r0, #0x1f
	cmp r0, #0
	bne _0808D0F8
	movs r0, #0x66
	bl CheckEventId
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0808D0F8
	ldr r0, _0808D12C  @ gUnknown_08A019E4
	movs r1, #3
	bl Proc_Start
_0808D0F8:
	ldr r0, _0808D130  @ gRAMChapterData
	adds r4, r0, #0
	adds r4, #0x40
	ldrb r0, [r4]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1e
	cmp r0, #0
	bne _0808D110
	ldr r0, _0808D134  @ gUnknown_08A0190C
	movs r1, #3
	bl Proc_Start
_0808D110:
	ldrb r0, [r4]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1e
	cmp r0, #1
	bne _0808D122
	ldr r0, _0808D138  @ gUnknown_08A01994
	movs r1, #3
	bl Proc_Start
_0808D122:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808D12C: .4byte gUnknown_08A019E4
_0808D130: .4byte gRAMChapterData
_0808D134: .4byte gUnknown_08A0190C
_0808D138: .4byte gUnknown_08A01994

	THUMB_FUNC_END InitPlayerPhaseInterfaceMaybe

	THUMB_FUNC_START New6CPPInterfaceConstructor
New6CPPInterfaceConstructor: @ 0x0808D13C
	push {lr}
	ldr r0, _0808D14C  @ gUnknown_08A019C4
	movs r1, #3
	bl Proc_Start
	pop {r0}
	bx r0
	.align 2, 0
_0808D14C: .4byte gUnknown_08A019C4

	THUMB_FUNC_END New6CPPInterfaceConstructor

	THUMB_FUNC_START DeletePlayerPhaseInterface6Cs
DeletePlayerPhaseInterface6Cs: @ 0x0808D150
	push {lr}
	ldr r0, _0808D17C  @ gUnknown_08A0190C
	bl Proc_EndEach
	ldr r0, _0808D180  @ gUnknown_08A01994
	bl Proc_EndEach
	ldr r0, _0808D184  @ gUnknown_08A018AC
	bl Proc_EndEach
	ldr r0, _0808D188  @ gUnknown_08A019E4
	bl Proc_EndEach
	ldr r0, _0808D18C  @ gUnknown_08A01A44
	bl Proc_EndEach
	bl SetDefaultColorEffects
	bl ClearBg0Bg1
	pop {r0}
	bx r0
	.align 2, 0
_0808D17C: .4byte gUnknown_08A0190C
_0808D180: .4byte gUnknown_08A01994
_0808D184: .4byte gUnknown_08A018AC
_0808D188: .4byte gUnknown_08A019E4
_0808D18C: .4byte gUnknown_08A01A44

	THUMB_FUNC_END DeletePlayerPhaseInterface6Cs

	THUMB_FUNC_START sub_808D190
sub_808D190: @ 0x0808D190
	push {lr}
	ldr r0, _0808D1A8  @ gUnknown_0202BCB0
	movs r2, #0x16
	ldrsh r1, [r0, r2]
	lsls r1, r1, #4
	movs r2, #0xe
	ldrsh r0, [r0, r2]
	subs r1, r1, r0
	cmp r1, #0x40
	bgt _0808D1AC
	movs r0, #0
	b _0808D1AE
	.align 2, 0
_0808D1A8: .4byte gUnknown_0202BCB0
_0808D1AC:
	movs r0, #1
_0808D1AE:
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_808D190

	THUMB_FUNC_START sub_808D1B4
sub_808D1B4: @ 0x0808D1B4
	push {lr}
	bl sub_808D190
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0808D1DC
	bl sub_808C314
	movs r1, #1
	negs r1, r1
	cmp r0, r1
	bne _0808D1D0
	movs r0, #2
	b _0808D1FA
_0808D1D0:
	bl sub_808C314
	cmp r0, #1
	bne _0808D1F8
	movs r0, #1
	b _0808D1FA
_0808D1DC:
	bl sub_808C33C
	movs r1, #1
	negs r1, r1
	cmp r0, r1
	bne _0808D1EC
	movs r0, #4
	b _0808D1FA
_0808D1EC:
	bl sub_808C33C
	cmp r0, #1
	bne _0808D1F8
	movs r0, #3
	b _0808D1FA
_0808D1F8:
	movs r0, #0
_0808D1FA:
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_808D1B4

	THUMB_FUNC_START sub_808D200
sub_808D200: @ 0x0808D200
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	ldr r7, _0808D278  @ gUnknown_020044D4
	adds r0, r7, #0
	movs r1, #0xb
	movs r2, #9
	movs r3, #0
	bl TileMap_FillRect
	ldr r6, _0808D27C  @ gUnknown_02004054
	adds r0, r6, #0
	movs r1, #0xb
	movs r2, #9
	movs r3, #0
	bl TileMap_FillRect
	adds r5, r4, #0
	adds r5, #0x44
	movs r1, #0
	ldrsh r0, [r5, r1]
	cmp r0, #0
	bne _0808D244
	ldr r1, _0808D280  @ gUnknown_08A17744
	movs r2, #0x80
	lsls r2, r2, #5
	adds r0, r7, #0
	bl CallARM_FillTileRect
	adds r0, r4, #0
	adds r0, #0x2c
	adds r1, r6, #0
	adds r1, #0x42
	bl Text_Draw
_0808D244:
	movs r1, #0
	ldrsh r0, [r5, r1]
	cmp r0, #1
	bne _0808D270
	ldr r1, _0808D284  @ gUnknown_08A176BC
	movs r2, #0x80
	lsls r2, r2, #5
	adds r0, r7, #0
	bl CallARM_FillTileRect
	adds r0, r4, #0
	adds r0, #0x2c
	adds r1, r6, #0
	adds r1, #0x42
	bl Text_Draw
	adds r0, r4, #0
	adds r0, #0x34
	adds r1, r6, #0
	adds r1, #0xc2
	bl Text_Draw
_0808D270:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808D278: .4byte gUnknown_020044D4
_0808D27C: .4byte gUnknown_02004054
_0808D280: .4byte gUnknown_08A17744
_0808D284: .4byte gUnknown_08A176BC

	THUMB_FUNC_END sub_808D200

	THUMB_FUNC_START Init6CPI
Init6CPI: @ 0x0808D288
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	movs r1, #0
	str r1, [r6, #0x58]
	adds r0, #0x56
	strb r1, [r0]
	subs r0, #6
	strb r1, [r0]
	adds r1, r6, #0
	adds r1, #0x57
	movs r0, #0xff
	strb r0, [r1]
	adds r5, r6, #0
	adds r5, #0x2c
	adds r0, r5, #0
	movs r1, #8
	bl Text_Init
	adds r4, r6, #0
	adds r4, #0x34
	adds r0, r4, #0
	movs r1, #8
	bl Text_Init
	adds r0, r6, #0
	bl NewGreenTextColorManager
	adds r0, r5, #0
	bl Text_Clear
	adds r0, r4, #0
	bl Text_Clear
	bl GetChapterThing
	cmp r0, #2
	beq _0808D2E8
	ldr r0, _0808D2E4  @ gRAMChapterData
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetROMChapterStruct
	adds r0, #0x8a
	ldrh r0, [r0]
	b _0808D2EC
	.align 2, 0
_0808D2E4: .4byte gRAMChapterData
_0808D2E8:
	movs r0, #0xcf
	lsls r0, r0, #1
_0808D2EC:
	bl GetStringFromIndex
	adds r5, r0, #0
	adds r4, r6, #0
	adds r4, #0x2c
	movs r0, #0x40
	adds r1, r5, #0
	bl GetStringTextCenteredPos
	adds r1, r0, #0
	adds r0, r4, #0
	movs r2, #0
	adds r3, r5, #0
	bl Text_InsertString
	bl GetChapterThing
	cmp r0, #2
	beq _0808D328
	ldr r0, _0808D324  @ gRAMChapterData
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetROMChapterStruct
	adds r0, #0x8c
	ldrb r0, [r0]
	b _0808D32A
	.align 2, 0
_0808D324: .4byte gRAMChapterData
_0808D328:
	movs r0, #1
_0808D32A:
	cmp r0, #4
	bls _0808D330
	b _0808D476
_0808D330:
	lsls r0, r0, #2
	ldr r1, _0808D33C  @ _0808D340
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0808D33C: .4byte _0808D340
_0808D340: @ jump table
	.4byte _0808D354 @ case 0
	.4byte _0808D35C @ case 1
	.4byte _0808D3B0 @ case 2
	.4byte _0808D354 @ case 3
	.4byte _0808D354 @ case 4
_0808D354:
	adds r1, r6, #0
	adds r1, #0x44
	movs r0, #0
	b _0808D474
_0808D35C:
	adds r4, r6, #0
	adds r4, #0x34
	ldr r0, _0808D390  @ 0x000001C1
	bl GetStringFromIndex
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x10
	movs r2, #0
	bl Text_InsertString
	ldr r0, _0808D394  @ gRAMChapterData
	ldrb r0, [r0, #0xd]
	cmp r0, #0
	beq _0808D39C
	ldr r0, _0808D398  @ 0x00000535
	bl GetStringFromIndex
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x28
	movs r2, #1
	bl Text_InsertString
	b _0808D46E
	.align 2, 0
_0808D390: .4byte 0x000001C1
_0808D394: .4byte gRAMChapterData
_0808D398: .4byte 0x00000535
_0808D39C:
	movs r0, #0x80
	bl sub_808DDF8
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x30
	movs r2, #2
	bl Text_InsertNumberOr2Dashes
	b _0808D46E
_0808D3B0:
	ldr r4, _0808D3D0  @ gRAMChapterData
	ldrh r5, [r4, #0x10]
	bl GetChapterThing
	cmp r0, #2
	beq _0808D3D4
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	bl GetROMChapterStruct
	adds r0, #0x8d
	ldrb r0, [r0]
	subs r0, #1
	cmp r5, r0
	bge _0808D3DC
	b _0808D404
	.align 2, 0
_0808D3D0: .4byte gRAMChapterData
_0808D3D4:
	movs r0, #1
	negs r0, r0
	cmp r5, r0
	blt _0808D404
_0808D3DC:
	ldr r0, _0808D400  @ 0x000001C3
	bl GetStringFromIndex
	adds r5, r0, #0
	adds r4, r6, #0
	adds r4, #0x34
	movs r0, #0x40
	adds r1, r5, #0
	bl GetStringTextCenteredPos
	adds r1, r0, #0
	adds r0, r4, #0
	movs r2, #4
	adds r3, r5, #0
	bl Text_InsertString
	b _0808D46E
	.align 2, 0
_0808D400: .4byte 0x000001C3
_0808D404:
	adds r4, r6, #0
	adds r4, #0x34
	ldr r7, _0808D444  @ gRAMChapterData
	ldrh r3, [r7, #0x10]
	adds r0, r4, #0
	movs r1, #0xa
	movs r2, #2
	bl Text_InsertNumberOr2Dashes
	ldr r0, _0808D448  @ 0x00000539
	bl GetStringFromIndex
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x12
	movs r2, #0
	bl Text_InsertString
	bl GetChapterThing
	adds r5, r4, #0
	cmp r0, #2
	beq _0808D44C
	movs r0, #0xe
	ldrsb r0, [r7, r0]
	bl GetROMChapterStruct
	adds r0, #0x8d
	ldrb r0, [r0]
	subs r3, r0, #1
	b _0808D450
	.align 2, 0
_0808D444: .4byte gRAMChapterData
_0808D448: .4byte 0x00000539
_0808D44C:
	movs r3, #1
	negs r3, r3
_0808D450:
	adds r0, r4, #0
	movs r1, #0x22
	movs r2, #2
	bl Text_InsertNumberOr2Dashes
	movs r0, #0xe1
	lsls r0, r0, #1
	bl GetStringFromIndex
	adds r3, r0, #0
	adds r0, r5, #0
	movs r1, #0x2a
	movs r2, #0
	bl Text_InsertString
_0808D46E:
	adds r1, r6, #0
	adds r1, #0x44
	movs r0, #1
_0808D474:
	strh r0, [r1]
_0808D476:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END Init6CPI

	THUMB_FUNC_START Loop16CPI
Loop16CPI: @ 0x0808D47C
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r0, #0
	str r0, [r4, #0x58]
	adds r1, r4, #0
	adds r1, #0x55
	movs r0, #1
	strb r0, [r1]
	bl GetCameraMovementSpeedMaybe
	adds r1, r4, #0
	adds r1, #0x50
	strb r0, [r1]
	ldr r0, _0808D508  @ gUnknown_08A01828
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	lsls r1, r1, #3
	adds r1, r1, r0
	movs r0, #4
	ldrsb r0, [r1, r0]
	ldrb r1, [r1, #5]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl sub_808BBAC
	adds r5, r0, #0
	ldr r0, _0808D50C  @ gUnknown_08A018AC
	bl Proc_Find
	cmp r0, #0
	beq _0808D4CC
	adds r1, r0, #0
	adds r1, #0x57
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	blt _0808D4CC
	cmp r0, r5
	beq _0808D500
_0808D4CC:
	adds r0, r4, #0
	adds r0, #0x57
	strb r5, [r0]
	adds r0, r4, #0
	bl sub_808D200
	ldr r1, _0808D510  @ gUnknown_0202BCB0
	ldrh r0, [r1, #0x14]
	adds r2, r4, #0
	adds r2, #0x4e
	strb r0, [r2]
	ldrh r0, [r1, #0x16]
	adds r3, r4, #0
	adds r3, #0x4f
	strb r0, [r3]
	ldrb r1, [r2]
	adds r0, r4, #0
	adds r0, #0x4c
	strb r1, [r0]
	ldrb r0, [r3]
	adds r1, r4, #0
	adds r1, #0x4d
	strb r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
_0808D500:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0808D508: .4byte gUnknown_08A01828
_0808D50C: .4byte gUnknown_08A018AC
_0808D510: .4byte gUnknown_0202BCB0

	THUMB_FUNC_END Loop16CPI

	THUMB_FUNC_START sub_808D514
sub_808D514: @ 0x0808D514
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	adds r7, r1, #0
	mov sl, r2
	ldr r1, _0808D69C  @ gUnknown_08A01828
	lsls r0, r0, #3
	adds r0, r0, r1
	movs r1, #4
	ldrsb r1, [r0, r1]
	mov r8, r1
	ldrb r0, [r0, #5]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	mov r9, r0
	cmp r1, #0
	bge _0808D582
	cmp r0, #0
	bge _0808D582
	ldr r4, _0808D6A0  @ gBG1TilemapBuffer
	adds r0, r4, #0
	movs r1, #0xc
	movs r2, #6
	movs r3, #0
	bl TileMap_FillRect
	ldr r5, _0808D6A4  @ gBG0TilemapBuffer
	adds r0, r5, #0
	movs r1, #0xc
	movs r2, #6
	movs r3, #0
	bl TileMap_FillRect
	movs r0, #0x10
	subs r0, r0, r7
	lsls r0, r0, #6
	ldr r1, _0808D6A8  @ gUnknown_02004254
	adds r0, r0, r1
	adds r1, r4, #0
	movs r2, #0xc
	adds r3, r7, #0
	bl TileMap_CopyRect
	movs r0, #0x12
	subs r0, r0, r7
	lsls r0, r0, #6
	ldr r1, _0808D6AC  @ gUnknown_02003D54
	adds r0, r0, r1
	adds r1, r5, #0
	movs r2, #0xc
	adds r3, r7, #0
	bl TileMap_CopyRect
_0808D582:
	mov r0, r8
	cmp r0, #0
	ble _0808D5D2
	mov r1, r9
	cmp r1, #0
	bge _0808D5D2
	ldr r4, _0808D6B0  @ gUnknown_020234CE
	adds r0, r4, #0
	movs r1, #0xc
	movs r2, #6
	movs r3, #0
	bl TileMap_FillRect
	ldr r5, _0808D6B4  @ gUnknown_02022CCE
	adds r0, r5, #0
	movs r1, #0xc
	movs r2, #6
	movs r3, #0
	bl TileMap_FillRect
	movs r0, #0x10
	subs r0, r0, r7
	lsls r0, r0, #6
	ldr r1, _0808D6A8  @ gUnknown_02004254
	adds r0, r0, r1
	adds r1, r4, #0
	movs r2, #0xc
	adds r3, r7, #0
	bl TileMap_CopyRect
	movs r0, #0x12
	subs r0, r0, r7
	lsls r0, r0, #6
	ldr r1, _0808D6AC  @ gUnknown_02003D54
	adds r0, r0, r1
	adds r1, r5, #0
	movs r2, #0xc
	adds r3, r7, #0
	bl TileMap_CopyRect
_0808D5D2:
	mov r0, r8
	cmp r0, #0
	bge _0808D62C
	mov r1, r9
	cmp r1, #0
	ble _0808D62C
	ldr r5, _0808D6B8  @ gUnknown_02023828
	adds r0, r5, #0
	movs r1, #0xc
	movs r2, #6
	movs r3, #0
	bl TileMap_FillRect
	ldr r6, _0808D6BC  @ gUnknown_02023028
	adds r0, r6, #0
	movs r1, #0xc
	movs r2, #6
	movs r3, #0
	bl TileMap_FillRect
	ldr r0, _0808D6C0  @ gUnknown_020044D4
	movs r4, #1
	mov r1, sl
	subs r4, r4, r1
	lsls r4, r4, #1
	adds r4, #0x14
	subs r4, r4, r7
	lsls r4, r4, #6
	ldr r1, _0808D6C4  @ 0xFFFFFC80
	adds r5, r5, r1
	adds r5, r4, r5
	adds r1, r5, #0
	movs r2, #0xc
	adds r3, r7, #0
	bl TileMap_CopyRect
	ldr r0, _0808D6C8  @ gUnknown_02004054
	ldr r1, _0808D6C4  @ 0xFFFFFC80
	adds r6, r6, r1
	adds r4, r4, r6
	adds r1, r4, #0
	movs r2, #0xc
	adds r3, r7, #0
	bl TileMap_CopyRect
_0808D62C:
	mov r0, r8
	cmp r0, #0
	ble _0808D686
	mov r1, r9
	cmp r1, #0
	ble _0808D686
	ldr r5, _0808D6CC  @ gUnknown_0202384E
	adds r0, r5, #0
	movs r1, #0xc
	movs r2, #6
	movs r3, #0
	bl TileMap_FillRect
	ldr r6, _0808D6D0  @ gUnknown_0202304E
	adds r0, r6, #0
	movs r1, #0xc
	movs r2, #6
	movs r3, #0
	bl TileMap_FillRect
	ldr r0, _0808D6C0  @ gUnknown_020044D4
	movs r4, #1
	mov r1, sl
	subs r4, r4, r1
	lsls r4, r4, #1
	adds r4, #0x14
	subs r4, r4, r7
	lsls r4, r4, #6
	ldr r1, _0808D6C4  @ 0xFFFFFC80
	adds r5, r5, r1
	adds r5, r4, r5
	adds r1, r5, #0
	movs r2, #0xc
	adds r3, r7, #0
	bl TileMap_CopyRect
	ldr r0, _0808D6C8  @ gUnknown_02004054
	ldr r1, _0808D6C4  @ 0xFFFFFC80
	adds r6, r6, r1
	adds r4, r4, r6
	adds r1, r4, #0
	movs r2, #0xc
	adds r3, r7, #0
	bl TileMap_CopyRect
_0808D686:
	movs r0, #3
	bl BG_EnableSyncByMask
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808D69C: .4byte gUnknown_08A01828
_0808D6A0: .4byte gBG1TilemapBuffer
_0808D6A4: .4byte gBG0TilemapBuffer
_0808D6A8: .4byte gUnknown_02004254
_0808D6AC: .4byte gUnknown_02003D54
_0808D6B0: .4byte gUnknown_020234CE
_0808D6B4: .4byte gUnknown_02022CCE
_0808D6B8: .4byte gUnknown_02023828
_0808D6BC: .4byte gUnknown_02023028
_0808D6C0: .4byte gUnknown_020044D4
_0808D6C4: .4byte 0xFFFFFC80
_0808D6C8: .4byte gUnknown_02004054
_0808D6CC: .4byte gUnknown_0202384E
_0808D6D0: .4byte gUnknown_0202304E

	THUMB_FUNC_END sub_808D514

	THUMB_FUNC_START Loop26CPI
Loop26CPI: @ 0x0808D6D4
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _0808D718  @ gUnknown_08A019DC
	ldr r0, [r4, #0x58]
	adds r0, r0, r1
	movs r1, #0
	ldrsb r1, [r0, r1]
	adds r0, r4, #0
	adds r0, #0x50
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r2, r4, #0
	adds r2, #0x44
	movs r3, #0
	ldrsh r2, [r2, r3]
	bl sub_808D514
	ldr r0, [r4, #0x58]
	adds r0, #1
	str r0, [r4, #0x58]
	cmp r0, #5
	bne _0808D712
	movs r0, #0
	str r0, [r4, #0x58]
	adds r1, r4, #0
	adds r1, #0x55
	strb r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
_0808D712:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808D718: .4byte gUnknown_08A019DC

	THUMB_FUNC_END Loop26CPI

	THUMB_FUNC_START Loop46CPI
Loop46CPI: @ 0x0808D71C
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r6, r4, #0
	adds r6, #0x55
	movs r5, #0
	movs r0, #1
	strb r0, [r6]
	ldr r1, _0808D774  @ gUnknown_08A019E1
	ldr r0, [r4, #0x58]
	adds r0, r0, r1
	movs r1, #0
	ldrsb r1, [r0, r1]
	adds r0, r4, #0
	adds r0, #0x50
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r2, r4, #0
	adds r2, #0x44
	movs r3, #0
	ldrsh r2, [r2, r3]
	bl sub_808D514
	ldr r0, [r4, #0x58]
	adds r0, #1
	str r0, [r4, #0x58]
	cmp r0, #3
	bne _0808D76C
	str r5, [r4, #0x58]
	strb r5, [r6]
	adds r0, r4, #0
	adds r0, #0x56
	strb r5, [r0]
	adds r1, r4, #0
	adds r1, #0x57
	movs r0, #0xff
	strb r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
_0808D76C:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0808D774: .4byte gUnknown_08A019E1

	THUMB_FUNC_END Loop46CPI

	THUMB_FUNC_START sub_808D778
sub_808D778: @ 0x0808D778
	bx lr

	THUMB_FUNC_END sub_808D778

	THUMB_FUNC_START __malloc_unlock_0
__malloc_unlock_0: @ 0x0808D77C
	bx lr

	THUMB_FUNC_END __malloc_unlock_0

	THUMB_FUNC_START sub_808D780
sub_808D780: @ 0x0808D780
	bx lr

	THUMB_FUNC_END sub_808D780

	THUMB_FUNC_START Loop36CPI
Loop36CPI: @ 0x0808D784
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r3, r4, #0
	adds r3, #0x4e
	ldrb r0, [r3]
	adds r2, r4, #0
	adds r2, #0x4c
	strb r0, [r2]
	movs r0, #0x4f
	adds r0, r0, r4
	mov ip, r0
	ldrb r0, [r0]
	adds r1, r4, #0
	adds r1, #0x4d
	strb r0, [r1]
	ldr r1, _0808D808  @ gUnknown_0202BCB0
	ldrh r0, [r1, #0x14]
	strb r0, [r3]
	ldrh r0, [r1, #0x16]
	mov r1, ip
	strb r0, [r1]
	ldrh r0, [r3]
	ldrh r2, [r2]
	cmp r0, r2
	beq _0808D802
	ldr r0, _0808D80C  @ gUnknown_0859A548
	bl Proc_Find
	cmp r0, #0
	bne _0808D7F4
	bl GetCameraMovementSpeedMaybe
	adds r2, r0, #0
	adds r0, r4, #0
	adds r0, #0x50
	movs r3, #0
	ldrsb r3, [r0, r3]
	cmp r2, r3
	beq _0808D802
	ldr r1, _0808D810  @ gUnknown_08A01828
	lsls r0, r2, #3
	adds r5, r0, r1
	lsls r0, r3, #3
	adds r2, r0, r1
	movs r1, #4
	ldrsb r1, [r5, r1]
	movs r0, #4
	ldrsb r0, [r2, r0]
	cmp r1, r0
	bne _0808D7F4
	movs r1, #5
	ldrsb r1, [r5, r1]
	movs r0, #5
	ldrsb r0, [r2, r0]
	cmp r1, r0
	beq _0808D802
_0808D7F4:
	adds r1, r4, #0
	adds r1, #0x56
	movs r0, #1
	strb r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
_0808D802:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0808D808: .4byte gUnknown_0202BCB0
_0808D80C: .4byte gUnknown_0859A548
_0808D810: .4byte gUnknown_08A01828

	THUMB_FUNC_END Loop36CPI

	THUMB_FUNC_START sub_808D814
sub_808D814: @ 0x0808D814
	push {lr}
	ldr r0, _0808D85C  @ gUnknown_08A0190C
	bl Proc_Find
	cmp r0, #0
	beq _0808D82C
	adds r0, #0x56
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _0808D858
_0808D82C:
	ldr r0, _0808D860  @ gUnknown_08A018AC
	bl Proc_Find
	cmp r0, #0
	beq _0808D842
	adds r0, #0x56
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _0808D858
_0808D842:
	ldr r0, _0808D864  @ gUnknown_08A019E4
	bl Proc_Find
	cmp r0, #0
	beq _0808D868
	adds r0, #0x56
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0808D868
_0808D858:
	movs r0, #1
	b _0808D86A
	.align 2, 0
_0808D85C: .4byte gUnknown_08A0190C
_0808D860: .4byte gUnknown_08A018AC
_0808D864: .4byte gUnknown_08A019E4
_0808D868:
	movs r0, #0
_0808D86A:
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_808D814

	THUMB_FUNC_START sub_808D870
sub_808D870: @ 0x0808D870
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0808D898  @ gUnknown_08A199C8
	ldr r1, _0808D89C  @ 0x06015000
	bl CopyDataWithPossibleUncomp
	adds r1, r4, #0
	adds r1, #0x46
	movs r2, #0
	movs r0, #0x88
	strh r0, [r1]
	adds r1, #2
	movs r0, #0x8c
	strh r0, [r1]
	adds r0, r4, #0
	adds r0, #0x56
	strb r2, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808D898: .4byte gUnknown_08A199C8
_0808D89C: .4byte 0x06015000

	THUMB_FUNC_END sub_808D870

	THUMB_FUNC_START sub_808D8A0
sub_808D8A0: @ 0x0808D8A0
	push {r4, r5, lr}
	adds r3, r0, #0
	adds r5, r2, #0
	ldr r0, _0808D920  @ gUnknown_08A01828
	lsls r1, r1, #3
	adds r1, r1, r0
	movs r2, #4
	ldrsb r2, [r1, r2]
	movs r4, #5
	ldrsb r4, [r1, r4]
	cmp r2, #0
	bge _0808D8CE
	cmp r4, #0
	bge _0808D8CE
	adds r1, r3, #0
	adds r1, #0x46
	movs r0, #8
	strh r0, [r1]
	adds r1, r5, #0
	subs r1, #0x14
	adds r0, r3, #0
	adds r0, #0x48
	strh r1, [r0]
_0808D8CE:
	cmp r2, #0
	ble _0808D8E8
	cmp r4, #0
	bge _0808D8E8
	adds r1, r3, #0
	adds r1, #0x46
	movs r0, #0xac
	strh r0, [r1]
	adds r1, r5, #0
	subs r1, #0x14
	adds r0, r3, #0
	adds r0, #0x48
	strh r1, [r0]
_0808D8E8:
	cmp r2, #0
	bge _0808D900
	cmp r4, #0
	ble _0808D900
	adds r1, r3, #0
	adds r1, #0x46
	movs r0, #8
	strh r0, [r1]
	movs r0, #0xa4
	subs r0, r0, r5
	adds r1, #2
	strh r0, [r1]
_0808D900:
	cmp r2, #0
	ble _0808D918
	cmp r4, #0
	ble _0808D918
	adds r1, r3, #0
	adds r1, #0x46
	movs r0, #0xac
	strh r0, [r1]
	movs r0, #0xa4
	subs r0, r0, r5
	adds r1, #2
	strh r0, [r1]
_0808D918:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0808D920: .4byte gUnknown_08A01828

	THUMB_FUNC_END sub_808D8A0

	THUMB_FUNC_START sub_808D924
sub_808D924: @ 0x0808D924
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r6, _0808D970  @ 0x000001FF
	adds r1, r4, #0
	ands r1, r6
	movs r0, #0xff
	ands r5, r0
	ldr r0, _0808D974  @ gObject_32x16
	mov r8, r0
	movs r0, #0x8a
	lsls r0, r0, #6
	str r0, [sp]
	movs r0, #4
	adds r2, r5, #0
	mov r3, r8
	bl PutSprite
	adds r4, #0x20
	ands r4, r6
	ldr r0, _0808D978  @ 0x00002284
	str r0, [sp]
	movs r0, #4
	adds r1, r4, #0
	adds r2, r5, #0
	mov r3, r8
	bl PutSprite
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0808D970: .4byte 0x000001FF
_0808D974: .4byte gObject_32x16
_0808D978: .4byte 0x00002284

	THUMB_FUNC_END sub_808D924

	THUMB_FUNC_START sub_808D97C
sub_808D97C: @ 0x0808D97C
	push {r4, r5, lr}
	adds r4, r0, #0
	bl GetCameraMovementSpeedMaybe
	adds r1, r4, #0
	adds r1, #0x50
	movs r5, #0
	strb r0, [r1]
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	ldr r2, [r4, #0x58]
	adds r0, r4, #0
	bl sub_808D8A0
	str r5, [r4, #0x58]
	ldr r1, _0808D9B4  @ gUnknown_0202BCB0
	ldrh r0, [r1, #0x14]
	adds r2, r4, #0
	adds r2, #0x4e
	strb r0, [r2]
	ldrh r0, [r1, #0x16]
	adds r4, #0x4f
	strb r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0808D9B4: .4byte gUnknown_0202BCB0

	THUMB_FUNC_END sub_808D97C

	THUMB_FUNC_START sub_808D9B8
sub_808D9B8: @ 0x0808D9B8
	push {r4, lr}
	adds r4, r0, #0
	ldr r2, [r4, #0x58]
	adds r2, #4
	str r2, [r4, #0x58]
	adds r0, #0x50
	movs r1, #0
	ldrsb r1, [r0, r1]
	adds r0, r4, #0
	bl sub_808D8A0
	adds r0, r4, #0
	adds r0, #0x46
	movs r1, #0
	ldrsh r0, [r0, r1]
	adds r1, r4, #0
	adds r1, #0x48
	movs r2, #0
	ldrsh r1, [r1, r2]
	bl sub_808D924
	ldr r0, [r4, #0x58]
	cmp r0, #0x18
	bne _0808D9F6
	adds r0, r4, #0
	bl Proc_Break
	adds r1, r4, #0
	adds r1, #0x56
	movs r0, #0
	strb r0, [r1]
_0808D9F6:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_808D9B8

	THUMB_FUNC_START sub_808D9FC
sub_808D9FC: @ 0x0808D9FC
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r0, #0x46
	movs r1, #0
	ldrsh r0, [r0, r1]
	adds r1, r4, #0
	adds r1, #0x48
	movs r2, #0
	ldrsh r1, [r1, r2]
	bl sub_808D924
	adds r3, r4, #0
	adds r3, #0x4e
	ldrb r0, [r3]
	adds r2, r4, #0
	adds r2, #0x4c
	strb r0, [r2]
	movs r0, #0x4f
	adds r0, r0, r4
	mov ip, r0
	ldrb r0, [r0]
	adds r1, r4, #0
	adds r1, #0x4d
	strb r0, [r1]
	ldr r1, _0808DA94  @ gUnknown_0202BCB0
	ldrh r0, [r1, #0x14]
	strb r0, [r3]
	ldrh r0, [r1, #0x16]
	mov r1, ip
	strb r0, [r1]
	ldrh r0, [r3]
	ldrh r2, [r2]
	cmp r0, r2
	beq _0808DA8C
	ldr r0, _0808DA98  @ gUnknown_0859A548
	bl Proc_Find
	cmp r0, #0
	bne _0808DA7E
	bl GetCameraMovementSpeedMaybe
	adds r2, r0, #0
	adds r0, r4, #0
	adds r0, #0x50
	movs r3, #0
	ldrsb r3, [r0, r3]
	cmp r2, r3
	beq _0808DA8C
	ldr r1, _0808DA9C  @ gUnknown_08A01828
	lsls r0, r2, #3
	adds r5, r0, r1
	lsls r0, r3, #3
	adds r2, r0, r1
	movs r1, #4
	ldrsb r1, [r5, r1]
	movs r0, #4
	ldrsb r0, [r2, r0]
	cmp r1, r0
	bne _0808DA7E
	movs r1, #5
	ldrsb r1, [r5, r1]
	movs r0, #5
	ldrsb r0, [r2, r0]
	cmp r1, r0
	beq _0808DA8C
_0808DA7E:
	adds r1, r4, #0
	adds r1, #0x56
	movs r0, #1
	strb r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
_0808DA8C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0808DA94: .4byte gUnknown_0202BCB0
_0808DA98: .4byte gUnknown_0859A548
_0808DA9C: .4byte gUnknown_08A01828

	THUMB_FUNC_END sub_808D9FC

	THUMB_FUNC_START sub_808DAA0
sub_808DAA0: @ 0x0808DAA0
	push {r4, lr}
	adds r4, r0, #0
	ldr r2, [r4, #0x58]
	subs r2, #4
	str r2, [r4, #0x58]
	adds r0, #0x50
	movs r1, #0
	ldrsb r1, [r0, r1]
	adds r0, r4, #0
	bl sub_808D8A0
	adds r0, r4, #0
	adds r0, #0x46
	movs r1, #0
	ldrsh r0, [r0, r1]
	adds r1, r4, #0
	adds r1, #0x48
	movs r2, #0
	ldrsh r1, [r1, r2]
	bl sub_808D924
	ldr r1, [r4, #0x58]
	cmp r1, #0
	bne _0808DADC
	adds r0, r4, #0
	adds r0, #0x56
	strb r1, [r0]
	adds r0, r4, #0
	bl Proc_Break
_0808DADC:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_808DAA0

	THUMB_FUNC_START MinimalVBlankHandler
MinimalVBlankHandler: @ 0x0808DAE4
	push {lr}
	ldr r1, _0808DB04  @ gUnknown_03007FF8
	movs r0, #1
	strh r0, [r1]
	bl FlushLCDControl
	bl FlushBackgrounds
	bl FlushTiles
	bl m4aSoundVSync
	bl m4aSoundMain
	pop {r0}
	bx r0
	.align 2, 0
_0808DB04: .4byte gUnknown_03007FF8

	THUMB_FUNC_END MinimalVBlankHandler

	THUMB_FUNC_START sub_808DB08
sub_808DB08: @ 0x0808DB08
	push {r4, lr}
	ldr r4, _0808DB30  @ gKeyStatusPtr
	ldr r0, [r4]
	bl UpdateKeyStatus
	ldr r0, [r4]
	ldrh r1, [r0, #8]
	movs r0, #9
	ands r0, r1
	cmp r0, #0
	beq _0808DB24
	movs r0, #0xff
	bl SoftReset
_0808DB24:
	bl VBlankIntrWait
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808DB30: .4byte gKeyStatusPtr

	THUMB_FUNC_END sub_808DB08

	THUMB_FUNC_START sub_808DB34
sub_808DB34: @ 0x0808DB34
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x7c
	add r5, sp, #0x18
	bl Font_InitForUIDefault
	bl Font_LoadForDialogue
	add r7, sp, #8
	add r0, sp, #0x10
	mov r8, r0
	mov r4, sp
	movs r6, #2
_0808DB50:
	adds r0, r4, #0
	movs r1, #0x16
	bl Text_Init
	adds r0, r4, #0
	movs r1, #0
	bl Text_SetColorId
	adds r4, #8
	subs r6, #1
	cmp r6, #0
	bge _0808DB50
	movs r1, #0
	str r1, [r5, #0x30]
	mov r0, sp
	str r0, [r5, #0x34]
	str r7, [r5, #0x38]
	mov r0, r8
	str r0, [r5, #0x3c]
	adds r0, r5, #0
	adds r0, #0x5c
	strh r1, [r0]
	ldr r0, _0808DBC0  @ 0x0000088E
	bl GetStringFromIndex
	str r0, [r5, #0x2c]
	adds r0, r5, #0
	bl sub_8089EEC
	ldr r4, _0808DBC4  @ gUnknown_02022E30
	mov r0, sp
	adds r1, r4, #0
	bl Text_Draw
	adds r1, r4, #0
	adds r1, #0xc0
	adds r0, r7, #0
	bl Text_Draw
	movs r0, #0xa0
	lsls r0, r0, #1
	adds r4, r4, r0
	mov r0, r8
	adds r1, r4, #0
	bl Text_Draw
	movs r0, #1
	bl BG_EnableSyncByMask
	add sp, #0x7c
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808DBC0: .4byte 0x0000088E
_0808DBC4: .4byte gUnknown_02022E30

	THUMB_FUNC_END sub_808DB34

	THUMB_FUNC_START sub_808DBC8
sub_808DBC8: @ 0x0808DBC8
	push {r4, r5, lr}
	sub sp, #8
	movs r0, #0
	bl SetupBackgrounds
	bl m4aSoundInit
	bl Proc_Init
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	ldr r4, _0808DC60  @ gLCDControlBuffer
	ldrb r0, [r4, #1]
	movs r1, #1
	orrs r0, r1
	movs r1, #3
	negs r1, r1
	ands r0, r1
	subs r1, #2
	ands r0, r1
	subs r1, #4
	ands r0, r1
	subs r1, #8
	ands r0, r1
	subs r1, #0x10
	ands r0, r1
	subs r1, #0x20
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r4, #1]
	bl SetDefaultColorEffects
	movs r0, #0
	bl SetPrimaryHBlankHandler
	movs r0, #0
	strh r0, [r4, #0x38]
	bl FlushLCDControl
	movs r4, #0
	str r4, [sp]
	movs r1, #0xc0
	lsls r1, r1, #0x13
	ldr r5, _0808DC64  @ 0x01000008
	mov r0, sp
	adds r2, r5, #0
	bl CpuFastSet
	str r4, [sp, #4]
	add r0, sp, #4
	ldr r1, _0808DC68  @ 0x06008000
	adds r2, r5, #0
	bl CpuFastSet
	bl sub_808DB34
	ldr r0, _0808DC6C  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0808DC52
	movs r0, #0x7b
	bl m4aSongNumStart
_0808DC52:
	ldr r0, _0808DC70  @ sub_808DB08
	bl SetMainUpdateRoutine
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0808DC60: .4byte gLCDControlBuffer
_0808DC64: .4byte 0x01000008
_0808DC68: .4byte 0x06008000
_0808DC6C: .4byte gRAMChapterData
_0808DC70: .4byte sub_808DB08

	THUMB_FUNC_END sub_808DBC8

	THUMB_FUNC_START sub_808DC74
sub_808DC74: @ 0x0808DC74
	push {lr}
	ldr r1, _0808DC9C  @ 0x04000004
	movs r0, #8
	strh r0, [r1]
	ldr r1, _0808DCA0  @ 0x04000208
	movs r0, #1
	strh r0, [r1]
	movs r1, #0x80
	lsls r1, r1, #0x13
	movs r0, #0
	strh r0, [r1]
	ldr r0, _0808DCA4  @ MinimalVBlankHandler
	bl SetInterrupt_LCDVBlank
	ldr r0, _0808DCA8  @ sub_808DBC8
	bl SetMainUpdateRoutine
	pop {r0}
	bx r0
	.align 2, 0
_0808DC9C: .4byte 0x04000004
_0808DCA0: .4byte 0x04000208
_0808DCA4: .4byte MinimalVBlankHandler
_0808DCA8: .4byte sub_808DBC8

	THUMB_FUNC_END sub_808DC74

	THUMB_FUNC_START sub_808DCAC
sub_808DCAC: @ 0x0808DCAC
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0808DCC8  @ 0x06015000
	movs r1, #6
	bl LoadDialogueBoxGfx
	ldr r0, _0808DCCC  @ gUnknown_08A01D18
	adds r1, r4, #0
	bl StartMovingHelpBox
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808DCC8: .4byte 0x06015000
_0808DCCC: .4byte gUnknown_08A01D18

	THUMB_FUNC_END sub_808DCAC

	THUMB_FUNC_START sub_808DCD0
sub_808DCD0: @ 0x0808DCD0
	push {r4, lr}
	movs r4, #1
_0808DCD4:
	adds r0, r4, #0
	bl GetUnit
	adds r1, r0, #0
	cmp r1, #0
	beq _0808DCEA
	ldr r0, [r1]
	cmp r0, #0
	beq _0808DCEA
	adds r0, r1, #0
	b _0808DCF2
_0808DCEA:
	adds r4, #1
	cmp r4, #0x3f
	ble _0808DCD4
	movs r0, #0
_0808DCF2:
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_808DCD0

.align 2, 0
