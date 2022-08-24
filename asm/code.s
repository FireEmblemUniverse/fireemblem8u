	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	THUMB_FUNC_START sub_808E9D8
sub_808E9D8: @ 0x0808E9D8
	ldr r3, _0808E9E8  @ gUnknown_0203E82C
	lsls r0, r0, #0xa
	ldr r1, [r3, #0x48]
	ldr r2, _0808E9EC  @ 0x000003FF
	ands r1, r2
	orrs r1, r0
	str r1, [r3, #0x48]
	bx lr
	.align 2, 0
_0808E9E8: .4byte gUnknown_0203E82C
_0808E9EC: .4byte 0x000003FF

	THUMB_FUNC_END sub_808E9D8

	THUMB_FUNC_START sub_808E9F0
sub_808E9F0: @ 0x0808E9F0
	push {r4, lr}
	ldr r4, _0808EA10  @ gUnknown_0203E82C
	ldr r3, [r4, #0x48]
	lsrs r2, r3, #0xa
	ldr r1, _0808EA14  @ 0x003FFFFF
	ands r1, r0
	orrs r2, r1
	lsls r2, r2, #0xa
	ldr r0, _0808EA18  @ 0x000003FF
	ands r0, r3
	orrs r0, r2
	str r0, [r4, #0x48]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808EA10: .4byte gUnknown_0203E82C
_0808EA14: .4byte 0x003FFFFF
_0808EA18: .4byte 0x000003FF

	THUMB_FUNC_END sub_808E9F0

	THUMB_FUNC_START sub_808EA1C
sub_808EA1C: @ 0x0808EA1C
	push {r4, lr}
	adds r4, r0, #0
	bl sub_808EA3C
	adds r1, r0, #0
	ldr r0, _0808EA38  @ 0x003FFFFF
	eors r0, r4
	ands r0, r1
	bl sub_808E9D8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808EA38: .4byte 0x003FFFFF

	THUMB_FUNC_END sub_808EA1C

	THUMB_FUNC_START sub_808EA3C
sub_808EA3C: @ 0x0808EA3C
	ldr r0, _0808EA44  @ gUnknown_0203E82C
	ldr r0, [r0, #0x48]
	lsrs r0, r0, #0xa
	bx lr
	.align 2, 0
_0808EA44: .4byte gUnknown_0203E82C

	THUMB_FUNC_END sub_808EA3C

	THUMB_FUNC_START sub_808EA48
sub_808EA48: @ 0x0808EA48
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r2, #0x20
	orrs r1, r2
	ldr r2, _0808EA64  @ gUnknown_0203E82C
	lsls r1, r1, #8
	adds r1, #0x40
	adds r0, r0, r1
	adds r2, #0x4c
	strh r0, [r2]
	bx lr
	.align 2, 0
_0808EA64: .4byte gUnknown_0203E82C

	THUMB_FUNC_END sub_808EA48

	THUMB_FUNC_START sub_808EA68
sub_808EA68: @ 0x0808EA68
	ldr r0, _0808EA70  @ gUnknown_0203E82C
	adds r0, #0x4c
	ldrh r0, [r0]
	bx lr
	.align 2, 0
_0808EA70: .4byte gUnknown_0203E82C

	THUMB_FUNC_END sub_808EA68

	THUMB_FUNC_START sub_808EA74
sub_808EA74: @ 0x0808EA74
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r1, r1, #0x10
	ldr r2, _0808EA88  @ gUnknown_0203E82C
	lsrs r1, r1, #8
	adds r0, r0, r1
	adds r2, #0x4e
	strh r0, [r2]
	bx lr
	.align 2, 0
_0808EA88: .4byte gUnknown_0203E82C

	THUMB_FUNC_END sub_808EA74

	THUMB_FUNC_START sub_808EA8C
sub_808EA8C: @ 0x0808EA8C
	ldr r0, _0808EA94  @ gUnknown_0203E82C
	adds r0, #0x4e
	ldrh r0, [r0]
	bx lr
	.align 2, 0
_0808EA94: .4byte gUnknown_0203E82C

	THUMB_FUNC_END sub_808EA8C

	THUMB_FUNC_START sub_808EA98
sub_808EA98: @ 0x0808EA98
	push {r4, r5, lr}
	ldr r0, _0808EAF8  @ 0x04000006
	ldrh r0, [r0]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0xa0
	bls _0808EAAA
	movs r4, #0
_0808EAAA:
	ldr r0, _0808EAFC  @ gUnknown_0203E82C
	adds r5, r0, #0
	adds r5, #0x48
	ldrb r0, [r5]
	lsls r0, r0, #0x1b
	lsrs r0, r0, #0x18
	subs r0, #0x20
	cmp r4, r0
	bne _0808EACC
	bl sub_808EA68
	ldr r1, _0808EB00  @ 0x04000050
	strh r0, [r1]
	bl sub_808EA8C
	ldr r1, _0808EB04  @ 0x04000052
	strh r0, [r1]
_0808EACC:
	cmp r4, #0
	beq _0808EADE
	ldrh r0, [r5]
	lsls r0, r0, #0x16
	lsrs r0, r0, #0x1b
	lsls r0, r0, #3
	adds r0, #4
	cmp r4, r0
	bne _0808EAF2
_0808EADE:
	ldr r1, _0808EB00  @ 0x04000050
	ldr r2, _0808EB08  @ gUnknown_030030BC
	ldrh r0, [r2]
	strh r0, [r1]
	ldr r3, _0808EB04  @ 0x04000052
	ldrb r1, [r2, #8]
	ldrb r0, [r2, #9]
	lsls r0, r0, #8
	adds r1, r1, r0
	strh r1, [r3]
_0808EAF2:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0808EAF8: .4byte 0x04000006
_0808EAFC: .4byte gUnknown_0203E82C
_0808EB00: .4byte 0x04000050
_0808EB04: .4byte 0x04000052
_0808EB08: .4byte gUnknown_030030BC

	THUMB_FUNC_END sub_808EA98

	THUMB_FUNC_START sub_808EB0C
sub_808EB0C: @ 0x0808EB0C
	push {r4, r5, lr}
	sub sp, #0x40
	adds r3, r0, #0
	add r2, sp, #0x18
	ldr r1, [r3, #0x2c]
	ldrb r0, [r1]
	adds r5, r2, #0
	cmp r0, #0x80
	bne _0808EBB6
	ldrb r0, [r1, #1]
	cmp r0, #0x23
	bne _0808EBB6
	adds r0, r1, #2
	str r0, [r3, #0x2c]
	ldrb r0, [r1, #2]
	add r4, sp, #0x38
	cmp r0, #1
	beq _0808EB46
_0808EB30:
	ldr r1, [r3, #0x2c]
	ldrb r0, [r1]
	strb r0, [r2]
	ldrb r0, [r1, #1]
	strb r0, [r2, #1]
	adds r0, r1, #2
	str r0, [r3, #0x2c]
	adds r2, #2
	ldrb r0, [r1, #2]
	cmp r0, #1
	bne _0808EB30
_0808EB46:
	ldr r0, [r3, #0x2c]
	adds r0, #1
	str r0, [r3, #0x2c]
	movs r0, #0
	strb r0, [r2]
	movs r0, #0x80
	lsls r0, r0, #9
	bl sub_808E9F0
	ldr r1, _0808EBC0  @ 0x06017800
	mov r0, sp
	movs r2, #0x12
	bl InitSomeOtherGraphicsRelatedStruct
	mov r0, sp
	bl SetFont
	adds r0, r4, #0
	bl Text_Init3
	adds r0, r4, #0
	movs r1, #0
	bl Text_80046B4
	movs r0, #0
	bl SetFontGlyphSet
	movs r0, #0x30
	adds r1, r5, #0
	bl GetStringTextCenteredPos
	adds r1, r0, #0
	adds r0, r4, #0
	movs r2, #0
	adds r3, r5, #0
	bl Text_InsertString
	movs r0, #0
	bl SetFont
	ldr r0, _0808EBC4  @ gUnknown_0859EF00
	movs r1, #0x90
	lsls r1, r1, #2
	movs r2, #0x20
	bl CopyToPaletteBuffer
	ldr r0, _0808EBC8  @ gUnknown_085A643C
	movs r1, #0x88
	lsls r1, r1, #2
	movs r2, #0x20
	bl CopyToPaletteBuffer
	ldr r0, _0808EBCC  @ gUnknown_085A638C
	ldr r1, _0808EBD0  @ 0x06017900
	bl CopyDataWithPossibleUncomp
_0808EBB6:
	add sp, #0x40
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0808EBC0: .4byte 0x06017800
_0808EBC4: .4byte gUnknown_0859EF00
_0808EBC8: .4byte gUnknown_085A643C
_0808EBCC: .4byte gUnknown_085A638C
_0808EBD0: .4byte 0x06017900

	THUMB_FUNC_END sub_808EB0C

	THUMB_FUNC_START sub_808EBD4
sub_808EBD4: @ 0x0808EBD4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	adds r6, r0, #0
	movs r0, #0
	str r0, [sp, #4]
	str r0, [sp, #8]
	adds r1, r6, #0
	adds r1, #0x55
	strb r0, [r1]
	adds r1, #1
	strb r0, [r1]
	bl sub_808EA3C
	lsrs r0, r0, #0xb
	movs r1, #7
	ands r0, r1
	cmp r0, #0
	beq _0808EC0E
	bl sub_808EA3C
	lsrs r0, r0, #0xb
	movs r1, #7
	ands r0, r1
	subs r0, #1
	b _0808EC12
_0808EC0E:
	bl GetTextDisplaySpeed
_0808EC12:
	adds r1, r6, #0
	adds r1, #0x52
	strb r0, [r1]
	movs r0, #0
	ldrsb r0, [r1, r0]
	movs r2, #0x7f
	cmp r0, #0
	beq _0808EC24
	movs r2, #1
_0808EC24:
	adds r0, r6, #0
	adds r0, #0x53
	movs r1, #0
	strb r2, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #0xa
	strb r1, [r0]
	adds r0, r6, #0
	bl sub_808EB0C
	adds r0, r6, #0
	adds r0, #0x5b
	movs r1, #0
	ldrsb r1, [r0, r1]
	adds r7, r0, #0
	movs r0, #0x5c
	adds r0, r0, r6
	mov r9, r0
	cmp r1, #0
	blt _0808EC58
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bge _0808EC8A
_0808EC58:
	movs r0, #1
	bl SetFontGlyphSet
	ldr r0, [r6, #0x2c]
	add r2, sp, #8
	add r1, sp, #4
	bl sub_808F428
	movs r0, #0
	bl SetFontGlyphSet
	ldr r1, [sp, #4]
	adds r0, r1, #7
	cmp r0, #0
	bge _0808EC78
	adds r0, #7
_0808EC78:
	asrs r0, r0, #3
	strb r0, [r7]
	ldr r0, [sp, #8]
	cmp r0, #0
	bge _0808EC84
	adds r0, #7
_0808EC84:
	asrs r0, r0, #3
	mov r1, r9
	strb r0, [r1]
_0808EC8A:
	bl sub_808EA3C
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	beq _0808EC98
	b _0808EDE6
_0808EC98:
	movs r2, #0x58
	adds r2, r2, r6
	mov r8, r2
	mov r3, r9
	movs r0, #0
	ldrsb r0, [r3, r0]
	mvns r0, r0
	ldrb r1, [r2]
	adds r0, r0, r1
	str r0, [sp, #0x10]
	bl sub_808EA3C
	movs r1, #2
	ands r1, r0
	cmp r1, #0
	beq _0808ED38
	adds r5, r6, #0
	adds r5, #0x57
	ldrb r0, [r5]
	movs r1, #0
	ldrsb r1, [r7, r1]
	subs r0, r0, r1
	subs r0, #2
	str r0, [sp, #0xc]
	bl sub_808EA3C
	movs r2, #0xc0
	lsls r2, r2, #8
	mov sl, r2
	ands r0, r2
	lsrs r0, r0, #0xe
	ldrb r1, [r5]
	movs r3, #0
	ldrsb r3, [r7, r3]
	subs r1, r1, r3
	subs r1, #2
	mov ip, r1
	mov r7, r9
	movs r4, #0
	ldrsb r4, [r7, r4]
	mvns r2, r4
	mov r1, r8
	ldrb r1, [r1]
	adds r2, r2, r1
	adds r3, #2
	adds r4, #2
	str r4, [sp]
	mov r1, ip
	bl sub_8008668
	bl sub_808EA3C
	movs r1, #0x80
	lsls r1, r1, #3
	ands r1, r0
	cmp r1, #0
	bne _0808EDAA
	bl sub_808EA3C
	movs r1, #0x80
	lsls r1, r1, #0xb
	ands r1, r0
	movs r4, #3
	cmp r1, #0
	beq _0808ED1C
	movs r4, #5
_0808ED1C:
	bl sub_808EA3C
	mov r2, sl
	ands r0, r2
	lsrs r0, r0, #0xe
	ldrb r1, [r5]
	subs r1, #1
	mov r3, r8
	ldrb r2, [r3]
	subs r2, #2
	adds r3, r4, #0
	bl sub_80084E0
	b _0808EDAA
_0808ED38:
	adds r5, r6, #0
	adds r5, #0x57
	ldrb r0, [r5]
	adds r0, #1
	str r0, [sp, #0xc]
	bl sub_808EA3C
	movs r1, #0xc0
	lsls r1, r1, #8
	mov sl, r1
	ands r0, r1
	lsrs r0, r0, #0xe
	ldrb r1, [r5]
	adds r1, #1
	mov ip, r1
	mov r2, r9
	movs r4, #0
	ldrsb r4, [r2, r4]
	mvns r2, r4
	mov r3, r8
	ldrb r3, [r3]
	adds r2, r2, r3
	movs r3, #0
	ldrsb r3, [r7, r3]
	adds r3, #2
	adds r4, #2
	str r4, [sp]
	bl sub_8008668
	bl sub_808EA3C
	movs r1, #0x80
	lsls r1, r1, #3
	ands r1, r0
	cmp r1, #0
	bne _0808EDAA
	bl sub_808EA3C
	movs r1, #0x80
	lsls r1, r1, #0xb
	ands r1, r0
	movs r4, #2
	cmp r1, #0
	beq _0808ED92
	movs r4, #5
_0808ED92:
	bl sub_808EA3C
	mov r7, sl
	ands r0, r7
	lsrs r0, r0, #0xe
	ldrb r1, [r5]
	mov r3, r8
	ldrb r2, [r3]
	subs r2, #2
	adds r3, r4, #0
	bl sub_80084E0
_0808EDAA:
	bl sub_808EA3C
	movs r1, #0x80
	lsls r1, r1, #9
	ands r1, r0
	cmp r1, #0
	beq _0808EDE0
	bl sub_808EA3C
	adds r1, r0, #0
	movs r0, #0xc0
	lsls r0, r0, #8
	ands r0, r1
	lsrs r0, r0, #0xe
	bl BG_GetMapBuffer
	ldr r7, [sp, #0x10]
	lsls r1, r7, #6
	adds r0, r0, r1
	ldr r2, [sp, #0xc]
	lsls r1, r2, #1
	adds r0, r0, r1
	movs r1, #6
	movs r2, #0
	movs r3, #0
	bl TileMap_FillRect
_0808EDE0:
	movs r0, #0xf
	bl BG_EnableSyncByMask
_0808EDE6:
	adds r0, r6, #0
	bl sub_808F3D8
	ldr r0, _0808EE5C  @ sub_808F5C8
	adds r1, r6, #0
	bl Get6CDifferedLoop6C
	ldr r0, [r6, #0x30]
	bl SetFont
	movs r0, #1
	bl SetFontGlyphSet
	mov r3, r9
	movs r0, #0
	ldrsb r0, [r3, r0]
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	movs r5, #0
	cmp r0, #0
	blt _0808EE38
_0808EE10:
	lsls r0, r5, #2
	adds r4, r6, #0
	adds r4, #0x34
	adds r4, r4, r0
	ldr r0, [r4]
	bl Text_Init3
	ldr r0, [r4]
	movs r1, #0xb
	bl Text_SetColorId
	adds r5, #1
	mov r7, r9
	movs r0, #0
	ldrsb r0, [r7, r0]
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	cmp r5, r0
	ble _0808EE10
_0808EE38:
	adds r0, r6, #0
	bl sub_808F2BC
	movs r0, #0
	bl SetFont
	bl sub_808EA3C
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	beq _0808EE60
	adds r0, r6, #0
	movs r1, #3
	bl Proc_Goto
	b _0808EF30
	.align 2, 0
_0808EE5C: .4byte sub_808F5C8
_0808EE60:
	bl sub_808EA3C
	movs r1, #0x80
	ands r1, r0
	cmp r1, #0
	beq _0808EE7E
	movs r0, #0x10
	movs r1, #1
	bl sub_808EA74
	adds r0, r6, #0
	movs r1, #3
	bl Proc_Goto
	b _0808EE86
_0808EE7E:
	movs r0, #0
	movs r1, #0x10
	bl sub_808EA74
_0808EE86:
	bl sub_808EA3C
	movs r1, #0x80
	lsls r1, r1, #9
	ands r1, r0
	cmp r1, #0
	beq _0808EEA4
	ldr r5, _0808EEA0  @ gUnknown_0203E82C
	adds r4, r6, #0
	adds r4, #0x58
	ldrb r1, [r4]
	subs r1, #5
	b _0808EEAE
	.align 2, 0
_0808EEA0: .4byte gUnknown_0203E82C
_0808EEA4:
	ldr r5, _0808EF58  @ gUnknown_0203E82C
	adds r4, r6, #0
	adds r4, #0x58
	ldrb r1, [r4]
	subs r1, #1
_0808EEAE:
	adds r3, r5, #0
	adds r3, #0x48
	movs r0, #0x1f
	ands r1, r0
	ldrb r2, [r3]
	movs r0, #0x20
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	mov r0, r9
	movs r1, #0
	ldrsb r1, [r0, r1]
	ldrb r4, [r4]
	adds r1, r1, r4
	adds r1, #1
	adds r3, r5, #0
	adds r3, #0x48
	movs r2, #0x1f
	mov r8, r2
	mov r7, r8
	ands r1, r7
	lsls r1, r1, #5
	ldrh r2, [r3]
	ldr r0, _0808EF5C  @ 0xFFFFFC1F
	ands r0, r2
	orrs r0, r1
	strh r0, [r3]
	bl sub_808EA3C
	movs r6, #0xc0
	lsls r6, r6, #8
	ands r0, r6
	lsrs r0, r0, #0xe
	movs r4, #1
	adds r5, r4, #0
	lsls r5, r0
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	bl sub_808EA3C
	ands r0, r6
	lsrs r0, r0, #0xe
	lsls r4, r0
	mov r0, r8
	eors r4, r0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_808EA48
	bl sub_808EA3C
	movs r1, #0x80
	lsls r1, r1, #0xc
	ands r1, r0
	cmp r1, #0
	bne _0808EF30
	movs r0, #0
	bl SetSecondaryHBlankHandler
	ldr r0, _0808EF60  @ sub_808EA98
	bl SetSecondaryHBlankHandler
_0808EF30:
	bl sub_808EA3C
	adds r1, r0, #0
	movs r0, #0xc0
	lsls r0, r0, #8
	ands r0, r1
	lsrs r0, r0, #0xe
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808EF58: .4byte gUnknown_0203E82C
_0808EF5C: .4byte 0xFFFFFC1F
_0808EF60: .4byte sub_808EA98

	THUMB_FUNC_END sub_808EBD4

	THUMB_FUNC_START sub_808EF64
sub_808EF64: @ 0x0808EF64
	adds r0, #0x56
	movs r1, #0
	strb r1, [r0]
	bx lr

	THUMB_FUNC_END sub_808EF64

	THUMB_FUNC_START sub_808EF6C
sub_808EF6C: @ 0x0808EF6C
	push {r4, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x56
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldrb r2, [r1]
	cmp r2, #0x10
	beq _0808EF8A
	movs r0, #0x10
	subs r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	b _0808EF8C
_0808EF8A:
	movs r1, #1
_0808EF8C:
	adds r0, r2, #0
	bl sub_808EA74
	adds r0, r4, #0
	adds r0, #0x56
	ldrb r0, [r0]
	cmp r0, #0x10
	bne _0808EFA2
	adds r0, r4, #0
	bl Proc_Break
_0808EFA2:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_808EF6C

	THUMB_FUNC_START sub_808EFA8
sub_808EFA8: @ 0x0808EFA8
	push {r4, lr}
	adds r4, r0, #0
	bl sub_808F2BC
	movs r0, #0
	bl sub_80057A8
	movs r1, #0x11
	negs r1, r1
	ands r1, r0
	movs r0, #0
	bl sub_800578C
	bl sub_808FFE8
	bl sub_808EA3C
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	beq _0808EFDC
	adds r0, r4, #0
	movs r1, #5
	bl Proc_Goto
	b _0808EFE4
_0808EFDC:
	adds r1, r4, #0
	adds r1, #0x56
	movs r0, #0x10
	strb r0, [r1]
_0808EFE4:
	bl sub_808EA3C
	movs r1, #0x80
	lsls r1, r1, #0xa
	ands r1, r0
	cmp r1, #0
	beq _0808EFFC
	ldr r0, _0808F004  @ gUnknown_08591154
	bl Proc_Find
	bl sub_8005F38
_0808EFFC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808F004: .4byte gUnknown_08591154

	THUMB_FUNC_END sub_808EFA8

	THUMB_FUNC_START sub_808F008
sub_808F008: @ 0x0808F008
	push {r4, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x56
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	ldrb r2, [r1]
	cmp r2, #0x10
	beq _0808F026
	movs r0, #0x10
	subs r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	b _0808F028
_0808F026:
	movs r1, #1
_0808F028:
	adds r0, r2, #0
	bl sub_808EA74
	adds r0, r4, #0
	adds r0, #0x56
	ldrb r0, [r0]
	cmp r0, #0
	bne _0808F046
	movs r0, #0x80
	lsls r0, r0, #9
	bl sub_808EA1C
	adds r0, r4, #0
	bl Proc_Break
_0808F046:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_808F008

	THUMB_FUNC_START sub_808F04C
sub_808F04C: @ 0x0808F04C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0808F080  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0xa
	ands r0, r1
	cmp r0, #0
	beq _0808F07A
	bl sub_808EA3C
	movs r1, #0x40
	ands r1, r0
	cmp r1, #0
	bne _0808F07A
	bl sub_800D3E4
	bl sub_808FFE8
	adds r0, r4, #0
	movs r1, #0
	bl Proc_Goto
_0808F07A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808F080: .4byte gKeyStatusPtr

	THUMB_FUNC_END sub_808F04C

	THUMB_FUNC_START sub_808F084
sub_808F084: @ 0x0808F084
	push {r4, lr}
	adds r4, r0, #0
	bl sub_808EA3C
	adds r1, r0, #0
	movs r0, #0xc0
	lsls r0, r0, #8
	ands r0, r1
	lsrs r0, r0, #0xe
	bl BG_GetMapBuffer
	adds r1, r4, #0
	adds r1, #0x58
	ldrb r1, [r1]
	subs r1, #1
	lsls r1, r1, #6
	adds r0, r0, r1
	adds r4, #0x5c
	movs r2, #0
	ldrsb r2, [r4, r2]
	adds r2, #1
	movs r1, #0x1f
	movs r3, #0
	bl TileMap_FillRect
	movs r0, #0xf
	bl BG_EnableSyncByMask
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_808F084

	THUMB_FUNC_START sub_808F0C4
sub_808F0C4: @ 0x0808F0C4
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0
	bl sub_80057A8
	movs r1, #0x11
	negs r1, r1
	ands r1, r0
	movs r0, #0
	bl sub_800578C
	adds r0, r4, #0
	bl sub_808F084
	movs r0, #0
	bl SetSecondaryHBlankHandler
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_808F0C4

	THUMB_FUNC_START sub_808F0EC
sub_808F0EC: @ 0x0808F0EC
	push {r4, r5, lr}
	adds r5, r0, #0
	bl sub_808F2BC
	adds r0, r5, #0
	adds r0, #0x54
	movs r4, #0
	strb r4, [r0]
	movs r0, #1
	bl SetFontGlyphSet
	adds r1, r5, #0
	adds r1, #0x59
	strb r4, [r1]
	adds r2, r5, #0
	adds r2, #0x5a
	strb r4, [r2]
	ldr r0, [r5, #0x2c]
	bl sub_808F358
	movs r0, #0
	bl SetFontGlyphSet
	adds r0, r5, #0
	bl sub_808FFC4
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_808F0EC

	THUMB_FUNC_START sub_808F128
sub_808F128: @ 0x0808F128
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	mov sl, r0
	str r1, [sp]
	str r2, [sp, #4]
	str r3, [sp, #8]
	ldr r7, [sp, #0x30]
	ldr r5, [sp, #0x34]
	ldr r6, _0808F17C  @ gUnknown_08A01DBC
	adds r0, r6, #0
	bl Proc_Find
	adds r4, r0, #0
	cmp r4, #0
	beq _0808F18A
	ldr r0, [sp, #0x2c]
	bl GetStringFromIndex
	str r0, [r4, #0x2c]
	bl sub_808F5A0
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0808F166
	bl sub_800A2A4
	str r0, [r4, #0x2c]
_0808F166:
	adds r0, r4, #0
	adds r0, #0x56
	ldrb r0, [r0]
	cmp r0, #0x10
	bne _0808F180
	adds r0, r4, #0
	movs r1, #3
	bl Proc_Goto
	b _0808F254
	.align 2, 0
_0808F17C: .4byte gUnknown_08A01DBC
_0808F180:
	adds r0, r4, #0
	movs r1, #2
	bl Proc_Goto
	b _0808F254
_0808F18A:
	ldr r0, [sp, #0x38]
	cmp r0, #0
	beq _0808F19A
	adds r0, r6, #0
	ldr r1, [sp, #0x38]
	bl Proc_StartBlocking
	b _0808F1A2
_0808F19A:
	adds r0, r6, #0
	movs r1, #3
	bl Proc_Start
_0808F1A2:
	adds r4, r0, #0
	movs r0, #0x80
	lsls r0, r0, #7
	bl sub_808E9D8
	bl sub_8006A98
	ldr r0, _0808F264  @ gUnknown_0203E82C
	str r0, [r4, #0x30]
	adds r3, r4, #0
	adds r3, #0x57
	adds r6, r4, #0
	adds r6, #0x58
	movs r1, #0x5b
	adds r1, r1, r4
	mov ip, r1
	movs r1, #0x5c
	adds r1, r1, r4
	mov r8, r1
	movs r1, #0x50
	adds r1, r1, r4
	mov r9, r1
	adds r2, r4, #0
	adds r2, #0x34
	adds r0, #0x40
	adds r1, r4, #0
	adds r1, #0x48
_0808F1D8:
	str r0, [r1]
	subs r0, #8
	subs r1, #4
	cmp r1, r2
	bge _0808F1D8
	mov r0, sl
	strb r0, [r3]
	mov r1, sp
	ldrb r1, [r1]
	strb r1, [r6]
	mov r0, sp
	ldrb r1, [r0, #4]
	mov r0, ip
	strb r1, [r0]
	mov r0, sp
	ldrb r1, [r0, #8]
	mov r0, r8
	strb r1, [r0]
	str r7, [r4, #0x4c]
	cmp r5, #0
	bge _0808F204
	movs r5, #5
_0808F204:
	movs r6, #0xf
	adds r0, r6, #0
	ands r0, r5
	adds r5, r0, #0
	adds r5, #0x10
	cmp r7, #0
	bne _0808F214
	ldr r7, _0808F268  @ 0x06013000
_0808F214:
	ldr r0, [r4, #0x30]
	adds r1, r7, #0
	adds r2, r5, #0
	bl InitSomeOtherGraphicsRelatedStruct
	movs r0, #0
	bl SetFont
	ldr r0, _0808F26C  @ gUnknown_0859EF60
	lsls r1, r5, #5
	movs r2, #0x20
	bl CopyToPaletteBuffer
	lsls r0, r7, #0x11
	lsrs r0, r0, #0x16
	ands r5, r6
	lsls r1, r5, #0xc
	adds r0, r0, r1
	mov r1, r9
	strh r0, [r1]
	ldr r0, [sp, #0x2c]
	bl GetStringFromIndex
	str r0, [r4, #0x2c]
	bl sub_808F5A0
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0808F254
	bl sub_800A2A4
	str r0, [r4, #0x2c]
_0808F254:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808F264: .4byte gUnknown_0203E82C
_0808F268: .4byte 0x06013000
_0808F26C: .4byte gUnknown_0859EF60

	THUMB_FUNC_END sub_808F128

	THUMB_FUNC_START sub_808F270
sub_808F270: @ 0x0808F270
	push {lr}
	ldr r0, _0808F280  @ gUnknown_08A01DBC
	bl Proc_Find
	bl Proc_End
	pop {r0}
	bx r0
	.align 2, 0
_0808F280: .4byte gUnknown_08A01DBC

	THUMB_FUNC_END sub_808F270

	THUMB_FUNC_START sub_808F284
sub_808F284: @ 0x0808F284
	push {lr}
	ldr r0, _0808F294  @ gUnknown_08A01DBC
	bl Proc_Find
	cmp r0, #0
	bne _0808F298
	movs r0, #0
	b _0808F29A
	.align 2, 0
_0808F294: .4byte gUnknown_08A01DBC
_0808F298:
	movs r0, #1
_0808F29A:
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_808F284

	THUMB_FUNC_START sub_808F2A0
sub_808F2A0: @ 0x0808F2A0
	push {lr}
	ldr r0, _0808F2B8  @ gUnknown_08A01DBC
	bl Proc_Find
	cmp r0, #0
	beq _0808F2B2
	movs r1, #0
	bl Proc_Goto
_0808F2B2:
	pop {r0}
	bx r0
	.align 2, 0
_0808F2B8: .4byte gUnknown_08A01DBC

	THUMB_FUNC_END sub_808F2A0

	THUMB_FUNC_START sub_808F2BC
sub_808F2BC: @ 0x0808F2BC
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x30]
	bl SetFont
	adds r0, r5, #0
	adds r0, #0x5c
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	movs r4, #0
	cmp r0, #0
	blt _0808F300
_0808F2DA:
	lsls r1, r4, #2
	adds r0, r5, #0
	adds r0, #0x34
	adds r0, r0, r1
	ldr r0, [r0]
	movs r1, #0
	bl Text_80046B4
	adds r4, #1
	adds r0, r5, #0
	adds r0, #0x5c
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	cmp r4, r0
	ble _0808F2DA
_0808F300:
	movs r0, #0
	bl SetFont
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_808F2BC

	THUMB_FUNC_START sub_808F30C
sub_808F30C: @ 0x0808F30C
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x30]
	bl SetFont
	adds r0, r5, #0
	adds r0, #0x5c
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	movs r4, #0
	cmp r0, #0
	blt _0808F350
_0808F32A:
	lsls r1, r4, #2
	adds r0, r5, #0
	adds r0, #0x34
	adds r0, r0, r1
	ldr r0, [r0]
	movs r1, #0
	bl Text_SetXCursor
	adds r4, #1
	adds r0, r5, #0
	adds r0, #0x5c
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	cmp r4, r0
	ble _0808F32A
_0808F350:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_808F30C

	THUMB_FUNC_START sub_808F358
sub_808F358: @ 0x0808F358
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r4, r0, #0
	mov r8, r1
	adds r7, r2, #0
	movs r6, #0
	ldrb r5, [r7]
	movs r0, #1
	bl SetFontGlyphSet
_0808F370:
	ldrb r0, [r4]
	cmp r0, #7
	bgt _0808F392
	cmp r0, #4
	bge _0808F3A4
	cmp r0, #1
	beq _0808F3A8
	cmp r0, #1
	bgt _0808F388
	cmp r0, #0
	beq _0808F3C4
	b _0808F3B4
_0808F388:
	cmp r0, #2
	beq _0808F3A4
	cmp r0, #3
	beq _0808F3C4
	b _0808F3B4
_0808F392:
	cmp r0, #0x19
	ble _0808F39C
	cmp r0, #0x80
	beq _0808F3B0
	b _0808F3B4
_0808F39C:
	cmp r0, #0x18
	bge _0808F3C4
	cmp r0, #0x16
	blt _0808F3B4
_0808F3A4:
	adds r4, #1
	b _0808F370
_0808F3A8:
	adds r4, #1
	adds r5, #0x10
	movs r6, #0
	b _0808F370
_0808F3B0:
	adds r4, #2
	b _0808F370
_0808F3B4:
	adds r0, r4, #0
	mov r1, sp
	bl GetCharTextWidth
	adds r4, r0, #0
	ldr r0, [sp]
	adds r6, r6, r0
	b _0808F370
_0808F3C4:
	mov r0, r8
	strb r6, [r0]
	strb r5, [r7]
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_808F358

	THUMB_FUNC_START sub_808F3D8
sub_808F3D8: @ 0x0808F3D8
	push {r4, lr}
	adds r4, r0, #0
	bl sub_808EA3C
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	bne _0808F420
	bl sub_808EA3C
	movs r1, #2
	ands r1, r0
	cmp r1, #0
	beq _0808F406
	adds r1, r4, #0
	adds r1, #0x57
	adds r0, r4, #0
	adds r0, #0x5b
	ldrb r0, [r0]
	mvns r0, r0
	ldrb r2, [r1]
	adds r0, r0, r2
	b _0808F40E
_0808F406:
	adds r1, r4, #0
	adds r1, #0x57
	ldrb r0, [r1]
	adds r0, #2
_0808F40E:
	strb r0, [r1]
	adds r2, r4, #0
	adds r2, #0x58
	adds r1, r4, #0
	adds r1, #0x5c
	ldrb r0, [r2]
	ldrb r1, [r1]
	subs r0, r0, r1
	strb r0, [r2]
_0808F420:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_808F3D8

	THUMB_FUNC_START sub_808F428
sub_808F428: @ 0x0808F428
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r4, r0, #0
	mov r8, r1
	adds r7, r2, #0
	movs r5, #0
	movs r6, #0x10
	str r5, [r1]
	str r5, [r7]
	movs r0, #1
	bl SetFontGlyphSet
_0808F444:
	ldrb r2, [r4]
	cmp r2, #0x19
	bhi _0808F4D0
	lsls r0, r2, #2
	ldr r1, _0808F454  @ _0808F458
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0808F454: .4byte _0808F458
_0808F458: @ jump table
	.4byte _0808F4C2 @ case 0
	.4byte _0808F4C2 @ case 1
	.4byte _0808F4C2 @ case 2
	.4byte _0808F4C0 @ case 3
	.4byte _0808F4D0 @ case 4
	.4byte _0808F4D0 @ case 5
	.4byte _0808F4D0 @ case 6
	.4byte _0808F4D0 @ case 7
	.4byte _0808F4D0 @ case 8
	.4byte _0808F4D0 @ case 9
	.4byte _0808F4D0 @ case 10
	.4byte _0808F4D0 @ case 11
	.4byte _0808F4D0 @ case 12
	.4byte _0808F4D0 @ case 13
	.4byte _0808F4D0 @ case 14
	.4byte _0808F4D0 @ case 15
	.4byte _0808F4D0 @ case 16
	.4byte _0808F4D0 @ case 17
	.4byte _0808F4D0 @ case 18
	.4byte _0808F4D0 @ case 19
	.4byte _0808F4D0 @ case 20
	.4byte _0808F4D0 @ case 21
	.4byte _0808F4D0 @ case 22
	.4byte _0808F4D0 @ case 23
	.4byte _0808F4C2 @ case 24
	.4byte _0808F4C2 @ case 25
_0808F4C0:
	adds r5, #8
_0808F4C2:
	mov r1, r8
	ldr r0, [r1]
	cmp r0, r5
	bge _0808F4CC
	str r5, [r1]
_0808F4CC:
	movs r5, #0
	ldrb r2, [r4]
_0808F4D0:
	cmp r2, #0x19
	bhi _0808F55C
	lsls r0, r2, #2
	ldr r1, _0808F4E0  @ _0808F4E4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0808F4E0: .4byte _0808F4E4
_0808F4E4: @ jump table
	.4byte _0808F550 @ case 0
	.4byte _0808F54C @ case 1
	.4byte _0808F550 @ case 2
	.4byte _0808F55C @ case 3
	.4byte _0808F55C @ case 4
	.4byte _0808F55C @ case 5
	.4byte _0808F55C @ case 6
	.4byte _0808F55C @ case 7
	.4byte _0808F55C @ case 8
	.4byte _0808F55C @ case 9
	.4byte _0808F55C @ case 10
	.4byte _0808F55C @ case 11
	.4byte _0808F55C @ case 12
	.4byte _0808F55C @ case 13
	.4byte _0808F55C @ case 14
	.4byte _0808F55C @ case 15
	.4byte _0808F55C @ case 16
	.4byte _0808F55C @ case 17
	.4byte _0808F55C @ case 18
	.4byte _0808F55C @ case 19
	.4byte _0808F55C @ case 20
	.4byte _0808F55C @ case 21
	.4byte _0808F55C @ case 22
	.4byte _0808F55C @ case 23
	.4byte _0808F54C @ case 24
	.4byte _0808F54C @ case 25
_0808F54C:
	adds r6, #0x10
	b _0808F55C
_0808F550:
	ldr r0, [r7]
	cmp r0, r6
	bge _0808F558
	str r6, [r7]
_0808F558:
	movs r6, #0
	ldrb r2, [r4]
_0808F55C:
	adds r0, r2, #0
	cmp r0, #7
	bgt _0808F56C
	cmp r0, #1
	bge _0808F57A
	cmp r0, #0
	beq _0808F592
	b _0808F582
_0808F56C:
	cmp r2, #0x16
	blt _0808F582
	cmp r2, #0x19
	ble _0808F57A
	cmp r2, #0x80
	beq _0808F57E
	b _0808F582
_0808F57A:
	adds r4, #1
	b _0808F444
_0808F57E:
	adds r4, #2
	b _0808F444
_0808F582:
	adds r0, r4, #0
	mov r1, sp
	bl GetCharTextWidth
	adds r4, r0, #0
	ldr r0, [sp]
	adds r5, r5, r0
	b _0808F444
_0808F592:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_808F428

	THUMB_FUNC_START sub_808F5A0
sub_808F5A0: @ 0x0808F5A0
	push {lr}
	adds r1, r0, #0
_0808F5A4:
	ldrb r0, [r1]
	cmp r0, #0
	beq _0808F5B0
	cmp r0, #0x80
	beq _0808F5B4
	b _0808F5C0
_0808F5B0:
	movs r0, #0
	b _0808F5C4
_0808F5B4:
	adds r1, #1
	ldrb r0, [r1]
	cmp r0, #0x20
	bne _0808F5C0
	movs r0, #1
	b _0808F5C4
_0808F5C0:
	adds r1, #1
	b _0808F5A4
_0808F5C4:
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_808F5A0

	THUMB_FUNC_START sub_808F5C8
sub_808F5C8: @ 0x0808F5C8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	mov r8, r0
	adds r0, #0x57
	ldrb r0, [r0]
	lsls r6, r0, #3
	mov r0, r8
	adds r0, #0x58
	ldrb r0, [r0]
	lsls r7, r0, #3
	movs r0, #0
	mov r9, r0
	bl sub_808EA3C
	movs r1, #0x80
	lsls r1, r1, #1
	ands r1, r0
	negs r1, r1
	asrs r1, r1, #0x1f
	movs r0, #0x80
	lsls r0, r0, #3
	ands r1, r0
	str r1, [sp, #4]
	bl sub_808EA3C
	adds r1, r0, #0
	movs r2, #0xc0
	lsls r2, r2, #8
	ands r1, r2
	movs r0, #0x80
	lsls r0, r0, #7
	cmp r1, r0
	beq _0808F638
	cmp r1, r0
	bhi _0808F61C
	cmp r1, #0
	beq _0808F62A
	b _0808F662
_0808F61C:
	movs r0, #0x80
	lsls r0, r0, #8
	cmp r1, r0
	beq _0808F648
	cmp r1, r2
	beq _0808F658
	b _0808F662
_0808F62A:
	ldr r0, _0808F634  @ gLCDControlBuffer
	ldrh r1, [r0, #0x1c]
	subs r6, r6, r1
	ldrh r0, [r0, #0x1e]
	b _0808F660
	.align 2, 0
_0808F634: .4byte gLCDControlBuffer
_0808F638:
	ldr r0, _0808F644  @ gLCDControlBuffer
	ldrh r1, [r0, #0x20]
	subs r6, r6, r1
	ldrh r0, [r0, #0x22]
	b _0808F660
	.align 2, 0
_0808F644: .4byte gLCDControlBuffer
_0808F648:
	ldr r0, _0808F654  @ gLCDControlBuffer
	ldrh r1, [r0, #0x24]
	subs r6, r6, r1
	ldrh r0, [r0, #0x26]
	b _0808F660
	.align 2, 0
_0808F654: .4byte gLCDControlBuffer
_0808F658:
	ldr r0, _0808F6D0  @ gLCDControlBuffer
	ldrh r1, [r0, #0x28]
	subs r6, r6, r1
	ldrh r0, [r0, #0x2a]
_0808F660:
	subs r7, r7, r0
_0808F662:
	bl sub_808EA3C
	movs r1, #0x80
	lsls r1, r1, #9
	ands r1, r0
	cmp r1, #0
	beq _0808F6A6
	adds r1, r6, #0
	subs r1, #0x10
	ldr r5, _0808F6D4  @ 0x000001FF
	ands r1, r5
	adds r2, r7, #0
	subs r2, #0x18
	movs r4, #0xff
	ands r2, r4
	ldr r3, _0808F6D8  @ gUnknown_08A01D88
	ldr r0, _0808F6DC  @ 0x000013C8
	str r0, [sp]
	movs r0, #0
	bl PutSpriteExt
	adds r1, r6, #0
	subs r1, #8
	ands r1, r5
	adds r2, r7, #0
	subs r2, #0x14
	ands r2, r4
	ldr r3, _0808F6E0  @ gUnknown_08A01DAE
	movs r0, #0x8f
	lsls r0, r0, #6
	str r0, [sp]
	movs r0, #0
	bl PutSpriteExt
_0808F6A6:
	movs r4, #0
	mov r0, r8
	adds r0, #0x5c
	movs r1, #0
	ldrsb r1, [r0, r1]
	lsrs r2, r1, #0x1f
	adds r1, r1, r2
	asrs r1, r1, #1
	str r0, [sp, #0xc]
	movs r2, #0x50
	add r2, r8
	mov sl, r2
	movs r3, #0x5b
	add r8, r3
	cmp r4, r1
	bge _0808F73A
_0808F6C6:
	movs r5, #0
	mov r9, r5
	adds r0, r4, #1
	str r0, [sp, #0x10]
	b _0808F716
	.align 2, 0
_0808F6D0: .4byte gLCDControlBuffer
_0808F6D4: .4byte 0x000001FF
_0808F6D8: .4byte gUnknown_08A01D88
_0808F6DC: .4byte 0x000013C8
_0808F6E0: .4byte gUnknown_08A01DAE
_0808F6E4:
	mov r2, r9
	lsls r1, r2, #5
	adds r1, r6, r1
	ldr r0, _0808F768  @ 0x000001FF
	ands r1, r0
	lsls r2, r4, #4
	adds r2, r7, r2
	movs r0, #0xff
	ands r2, r0
	mov r3, r9
	lsls r0, r3, #2
	mov r5, sl
	ldrh r5, [r5]
	adds r0, r0, r5
	lsls r3, r4, #6
	adds r0, r0, r3
	ldr r3, [sp, #4]
	adds r0, r0, r3
	str r0, [sp]
	movs r0, #2
	ldr r3, _0808F76C  @ gObject_32x16
	bl PutSpriteExt
	movs r5, #1
	add r9, r5
_0808F716:
	mov r1, r8
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bge _0808F722
	adds r0, #3
_0808F722:
	asrs r0, r0, #2
	cmp r9, r0
	blt _0808F6E4
	ldr r4, [sp, #0x10]
	ldr r2, [sp, #0xc]
	movs r0, #0
	ldrsb r0, [r2, r0]
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	cmp r4, r0
	blt _0808F6C6
_0808F73A:
	mov r3, r8
	ldrb r0, [r3]
	movs r1, #3
	ands r0, r1
	cmp r0, #0
	beq _0808F7DA
	movs r1, #0
	ldrsb r1, [r3, r1]
	adds r0, r1, #0
	cmp r1, #0
	bge _0808F752
	adds r0, r1, #3
_0808F752:
	asrs r0, r0, #2
	lsls r4, r0, #2
	str r4, [sp, #8]
	lsls r0, r0, #5
	adds r6, r6, r0
	movs r4, #0
	ldr r5, [sp, #0xc]
	movs r0, #0
	ldrsb r0, [r5, r0]
	b _0808F7D0
	.align 2, 0
_0808F768: .4byte 0x000001FF
_0808F76C: .4byte gObject_32x16
_0808F770:
	movs r0, #0
	mov r9, r0
	adds r1, r4, #1
	str r1, [sp, #0x10]
	b _0808F7AC
_0808F77A:
	mov r2, r9
	lsls r1, r2, #3
	adds r1, r6, r1
	ldr r0, _0808F818  @ 0x000001FF
	ands r1, r0
	lsls r2, r4, #4
	adds r2, r7, r2
	movs r0, #0xff
	ands r2, r0
	mov r3, sl
	ldrh r0, [r3]
	ldr r5, [sp, #8]
	adds r0, r0, r5
	add r0, r9
	lsls r3, r4, #6
	adds r0, r0, r3
	ldr r3, [sp, #4]
	adds r0, r0, r3
	str r0, [sp]
	movs r0, #2
	ldr r3, _0808F81C  @ gObject_8x16
	bl PutSpriteExt
	movs r5, #1
	add r9, r5
_0808F7AC:
	mov r0, r8
	movs r1, #0
	ldrsb r1, [r0, r1]
	adds r0, r1, #0
	cmp r1, #0
	bge _0808F7BA
	adds r0, r1, #3
_0808F7BA:
	asrs r0, r0, #2
	lsls r0, r0, #2
	subs r0, r1, r0
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r9, r0
	blt _0808F77A
	ldr r4, [sp, #0x10]
	ldr r1, [sp, #0xc]
	movs r0, #0
	ldrsb r0, [r1, r0]
_0808F7D0:
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	cmp r4, r0
	blt _0808F770
_0808F7DA:
	mov r2, r9
	lsls r1, r2, #5
	adds r1, r6, r1
	ldr r0, _0808F818  @ 0x000001FF
	ands r1, r0
	lsls r2, r4, #4
	adds r2, r7, r2
	movs r0, #0xff
	ands r2, r0
	ldr r3, _0808F820  @ gObject_32x16
	mov r5, r9
	lsls r0, r5, #2
	mov r6, sl
	ldrh r6, [r6]
	adds r0, r0, r6
	lsls r4, r4, #6
	adds r0, r0, r4
	ldr r4, [sp, #4]
	adds r0, r0, r4
	str r0, [sp]
	movs r0, #2
	bl PutSpriteExt
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808F818: .4byte 0x000001FF
_0808F81C: .4byte gObject_8x16
_0808F820: .4byte gObject_32x16

	THUMB_FUNC_END sub_808F5C8

	THUMB_FUNC_START sub_808F824
sub_808F824: @ 0x0808F824
	push {lr}
	subs r0, #0x16
	cmp r0, #9
	bhi _0808F8AC
	lsls r0, r0, #2
	ldr r1, _0808F838  @ _0808F83C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0808F838: .4byte _0808F83C
_0808F83C: @ jump table
	.4byte _0808F864 @ case 0
	.4byte _0808F86A @ case 1
	.4byte _0808F870 @ case 2
	.4byte _0808F876 @ case 3
	.4byte _0808F87C @ case 4
	.4byte _0808F882 @ case 5
	.4byte _0808F88E @ case 6
	.4byte _0808F894 @ case 7
	.4byte _0808F89A @ case 8
	.4byte _0808F8A0 @ case 9
_0808F864:
	movs r0, #0
	movs r1, #0
	b _0808F886
_0808F86A:
	movs r0, #0
	movs r1, #1
	b _0808F886
_0808F870:
	movs r0, #0
	movs r1, #3
	b _0808F886
_0808F876:
	movs r0, #0
	movs r1, #2
	b _0808F886
_0808F87C:
	movs r0, #0
	movs r1, #4
	b _0808F886
_0808F882:
	movs r0, #0
	movs r1, #5
_0808F886:
	bl sub_8006458
	movs r0, #1
	b _0808F8AE
_0808F88E:
	movs r0, #0
	movs r1, #0
	b _0808F8A4
_0808F894:
	movs r0, #0
	movs r1, #2
	b _0808F8A4
_0808F89A:
	movs r0, #0
	movs r1, #3
	b _0808F8A4
_0808F8A0:
	movs r0, #0
	movs r1, #4
_0808F8A4:
	bl sub_80064DC
	movs r0, #1
	b _0808F8AE
_0808F8AC:
	movs r0, #0
_0808F8AE:
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_808F824

	THUMB_FUNC_START sub_808F8B4
sub_808F8B4: @ 0x0808F8B4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	mov r8, r0
	ldr r6, [r0, #0x14]
	adds r0, r6, #0
	adds r0, #0x53
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	mov sl, r0
	ldr r0, _0808F8F0  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0xf3
	ands r0, r1
	cmp r0, #0
	beq _0808F8F4
	bl sub_808EA3C
	movs r1, #0x20
	ands r1, r0
	cmp r1, #0
	bne _0808F8F4
	movs r0, #0x7f
	mov sl, r0
	b _0808F90E
	.align 2, 0
_0808F8F0: .4byte gKeyStatusPtr
_0808F8F4:
	adds r1, r6, #0
	adds r1, #0x55
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	cmp r0, #0
	ble _0808F906
	b _0808FE94
_0808F906:
	adds r0, r6, #0
	adds r0, #0x52
	ldrb r0, [r0]
	strb r0, [r1]
_0808F90E:
	ldr r0, [r6, #0x30]
	bl SetFont
	ldr r0, _0808F940  @ gUnknown_03005398
	ldrb r0, [r0]
	cmp r0, #0
	beq _0808F944
	cmp r0, #1
	beq _0808F95E
	movs r0, #0
	bl sub_80057A8
	movs r1, #0x10
	orrs r0, r1
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	movs r0, #0
	movs r1, #3
	bl sub_8006458
	movs r0, #1
	movs r1, #1
	bl sub_8006458
	b _0808F990
	.align 2, 0
_0808F940: .4byte gUnknown_03005398
_0808F944:
	movs r0, #0
	bl sub_80057A8
	movs r1, #0x10
	orrs r0, r1
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	movs r0, #0
	movs r1, #3
	bl sub_8006458
	movs r0, #1
	b _0808F976
_0808F95E:
	movs r0, #1
	bl sub_80057A8
	movs r1, #0x10
	orrs r0, r1
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	movs r0, #1
	movs r1, #3
	bl sub_8006458
	movs r0, #0
_0808F976:
	movs r1, #1
	bl sub_8006458
	b _0808F990
_0808F97E:
	adds r1, r6, #0
	adds r1, #0x5f
	movs r0, #1
	strb r0, [r1]
	mov r0, r8
	movs r1, #1
	bl Proc_Goto
	b _0808FE68
_0808F990:
	movs r0, #0
	mov r9, r0
	cmp r9, sl
	blt _0808F99A
	b _0808FE68
_0808F99A:
	ldr r0, [r6, #0x2c]
	ldrb r1, [r0]
	adds r2, r0, #0
	cmp r1, #0x80
	bls _0808F9A6
	b _0808FDEA
_0808F9A6:
	lsls r0, r1, #2
	ldr r1, _0808F9B0  @ _0808F9B4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0808F9B0: .4byte _0808F9B4
_0808F9B4: @ jump table
	.4byte _0808FC64 @ case 0
	.4byte _0808FC92 @ case 1
	.4byte _0808FD02 @ case 2
	.4byte _0808FD48 @ case 3
	.4byte _0808FCBE @ case 4
	.4byte _0808FCC8 @ case 5
	.4byte _0808FCD2 @ case 6
	.4byte _0808FCDC @ case 7
	.4byte _0808FDEA @ case 8
	.4byte _0808FDEA @ case 9
	.4byte _0808FDEA @ case 10
	.4byte _0808FDEA @ case 11
	.4byte _0808FDEA @ case 12
	.4byte _0808FDEA @ case 13
	.4byte _0808FDEA @ case 14
	.4byte _0808FDEA @ case 15
	.4byte _0808FDEA @ case 16
	.4byte _0808FDEA @ case 17
	.4byte _0808FDEA @ case 18
	.4byte _0808FDEA @ case 19
	.4byte _0808FDEA @ case 20
	.4byte _0808FDEA @ case 21
	.4byte _0808FCE6 @ case 22
	.4byte _0808FCF4 @ case 23
	.4byte _0808FBB8 @ case 24
	.4byte _0808FC18 @ case 25
	.4byte _0808FDEA @ case 26
	.4byte _0808FDEA @ case 27
	.4byte _0808FDEA @ case 28
	.4byte _0808FDEA @ case 29
	.4byte _0808FDEA @ case 30
	.4byte _0808FDEA @ case 31
	.4byte _0808FDEA @ case 32
	.4byte _0808FDEA @ case 33
	.4byte _0808FDEA @ case 34
	.4byte _0808FDEA @ case 35
	.4byte _0808FDEA @ case 36
	.4byte _0808FDEA @ case 37
	.4byte _0808FDEA @ case 38
	.4byte _0808FDEA @ case 39
	.4byte _0808FDEA @ case 40
	.4byte _0808FDEA @ case 41
	.4byte _0808FDEA @ case 42
	.4byte _0808FDEA @ case 43
	.4byte _0808FDEA @ case 44
	.4byte _0808FDEA @ case 45
	.4byte _0808FDEA @ case 46
	.4byte _0808FDEA @ case 47
	.4byte _0808FDEA @ case 48
	.4byte _0808FDEA @ case 49
	.4byte _0808FDEA @ case 50
	.4byte _0808FDEA @ case 51
	.4byte _0808FDEA @ case 52
	.4byte _0808FDEA @ case 53
	.4byte _0808FDEA @ case 54
	.4byte _0808FDEA @ case 55
	.4byte _0808FDEA @ case 56
	.4byte _0808FDEA @ case 57
	.4byte _0808FDEA @ case 58
	.4byte _0808FDEA @ case 59
	.4byte _0808FDEA @ case 60
	.4byte _0808FDEA @ case 61
	.4byte _0808FDEA @ case 62
	.4byte _0808FDEA @ case 63
	.4byte _0808FDEA @ case 64
	.4byte _0808FDEA @ case 65
	.4byte _0808FDEA @ case 66
	.4byte _0808FDEA @ case 67
	.4byte _0808FDEA @ case 68
	.4byte _0808FDEA @ case 69
	.4byte _0808FDEA @ case 70
	.4byte _0808FDEA @ case 71
	.4byte _0808FDEA @ case 72
	.4byte _0808FDEA @ case 73
	.4byte _0808FDEA @ case 74
	.4byte _0808FDEA @ case 75
	.4byte _0808FDEA @ case 76
	.4byte _0808FDEA @ case 77
	.4byte _0808FDEA @ case 78
	.4byte _0808FDEA @ case 79
	.4byte _0808FDEA @ case 80
	.4byte _0808FDEA @ case 81
	.4byte _0808FDEA @ case 82
	.4byte _0808FDEA @ case 83
	.4byte _0808FDEA @ case 84
	.4byte _0808FDEA @ case 85
	.4byte _0808FDEA @ case 86
	.4byte _0808FDEA @ case 87
	.4byte _0808FDEA @ case 88
	.4byte _0808FDEA @ case 89
	.4byte _0808FDEA @ case 90
	.4byte _0808FDEA @ case 91
	.4byte _0808FDEA @ case 92
	.4byte _0808FDEA @ case 93
	.4byte _0808FDEA @ case 94
	.4byte _0808FDEA @ case 95
	.4byte _0808FDEA @ case 96
	.4byte _0808FDEA @ case 97
	.4byte _0808FDEA @ case 98
	.4byte _0808FDEA @ case 99
	.4byte _0808FDEA @ case 100
	.4byte _0808FDEA @ case 101
	.4byte _0808FDEA @ case 102
	.4byte _0808FDEA @ case 103
	.4byte _0808FDEA @ case 104
	.4byte _0808FDEA @ case 105
	.4byte _0808FDEA @ case 106
	.4byte _0808FDEA @ case 107
	.4byte _0808FDEA @ case 108
	.4byte _0808FDEA @ case 109
	.4byte _0808FDEA @ case 110
	.4byte _0808FDEA @ case 111
	.4byte _0808FDEA @ case 112
	.4byte _0808FDEA @ case 113
	.4byte _0808FDEA @ case 114
	.4byte _0808FDEA @ case 115
	.4byte _0808FDEA @ case 116
	.4byte _0808FDEA @ case 117
	.4byte _0808FDEA @ case 118
	.4byte _0808FDEA @ case 119
	.4byte _0808FDEA @ case 120
	.4byte _0808FDEA @ case 121
	.4byte _0808FDEA @ case 122
	.4byte _0808FDEA @ case 123
	.4byte _0808FDEA @ case 124
	.4byte _0808FDEA @ case 125
	.4byte _0808FDEA @ case 126
	.4byte _0808FDEA @ case 127
	.4byte _0808FDCA @ case 128
_0808FBB8:
	adds r4, r6, #0
	adds r4, #0x54
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	bl sub_808EA3C
	movs r1, #0x80
	lsls r1, r1, #2
	ands r1, r0
	ldr r5, _0808FC10  @ gUnknown_08A01E5C
	cmp r1, #0
	beq _0808FBD4
	ldr r5, _0808FC14  @ gUnknown_08A01E54
_0808FBD4:
	movs r3, #0
	ldrsb r3, [r4, r3]
	lsls r1, r3, #2
	adds r0, r6, #0
	adds r0, #0x34
	adds r0, r0, r1
	ldr r1, [r0]
	adds r0, r6, #0
	adds r0, #0x57
	ldrb r2, [r0]
	lsls r2, r2, #3
	adds r0, #1
	lsls r3, r3, #1
	ldrb r0, [r0]
	adds r3, r3, r0
	lsls r3, r3, #3
	movs r0, #0xb
	str r0, [sp]
	movs r0, #1
_0808FBFA:
	str r0, [sp, #4]
	mov r0, r8
	str r0, [sp, #8]
	adds r0, r5, #0
	bl sub_80900EC
_0808FC06:
	ldr r0, [r6, #0x2c]
	adds r0, #1
	str r0, [r6, #0x2c]
	b _0808FD3C
	.align 2, 0
_0808FC10: .4byte gUnknown_08A01E5C
_0808FC14: .4byte gUnknown_08A01E54
_0808FC18:
	adds r4, r6, #0
	adds r4, #0x54
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	bl sub_808EA3C
	movs r1, #0x80
	lsls r1, r1, #2
	ands r1, r0
	ldr r5, _0808FC5C  @ gUnknown_08A01E5C
	cmp r1, #0
	beq _0808FC34
	ldr r5, _0808FC60  @ gUnknown_08A01E54
_0808FC34:
	movs r3, #0
	ldrsb r3, [r4, r3]
	lsls r1, r3, #2
	adds r0, r6, #0
	adds r0, #0x34
	adds r0, r0, r1
	ldr r1, [r0]
	adds r0, r6, #0
	adds r0, #0x57
	ldrb r2, [r0]
	lsls r2, r2, #3
	adds r0, #1
	lsls r3, r3, #1
	ldrb r0, [r0]
	adds r3, r3, r0
	lsls r3, r3, #3
	movs r0, #0xb
	str r0, [sp]
	movs r0, #2
	b _0808FBFA
	.align 2, 0
_0808FC5C: .4byte gUnknown_08A01E5C
_0808FC60: .4byte gUnknown_08A01E54
_0808FC64:
	bl sub_808EA3C
	movs r1, #4
	ands r1, r0
	cmp r1, #0
	beq _0808FC80
	movs r0, #4
	bl sub_808EA1C
	adds r0, r6, #0
	movs r1, #4
	bl Proc_Goto
	b _0808FC88
_0808FC80:
	adds r0, r6, #0
	movs r1, #0
	bl Proc_Goto
_0808FC88:
	mov r0, r8
	movs r1, #0x63
	bl Proc_Goto
	b _0808FD3C
_0808FC92:
	adds r0, r2, #1
	str r0, [r6, #0x2c]
	adds r3, r6, #0
	adds r3, #0x54
	movs r2, #0
	ldrsb r2, [r3, r2]
	adds r2, #1
	adds r0, r6, #0
	adds r0, #0x5c
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	cmp r2, r0
	blt _0808FCB6
	b _0808F97E
_0808FCB6:
	ldrb r0, [r3]
	adds r0, #1
	strb r0, [r3]
	b _0808FE5E
_0808FCBE:
	adds r1, r6, #0
	adds r1, #0x55
	movs r0, #8
	strb r0, [r1]
	b _0808FC06
_0808FCC8:
	adds r1, r6, #0
	adds r1, #0x55
	movs r0, #0x10
	strb r0, [r1]
	b _0808FC06
_0808FCD2:
	adds r1, r6, #0
	adds r1, #0x55
	movs r0, #0x20
	strb r0, [r1]
	b _0808FC06
_0808FCDC:
	adds r1, r6, #0
	adds r1, #0x55
	movs r0, #0x80
	strb r0, [r1]
	b _0808FC06
_0808FCE6:
	adds r0, r2, #1
	str r0, [r6, #0x2c]
	ldr r0, _0808FCF0  @ 0x0000FFF7
	ands r7, r0
	b _0808FE5E
	.align 2, 0
_0808FCF0: .4byte 0x0000FFF7
_0808FCF4:
	adds r0, r2, #1
	str r0, [r6, #0x2c]
	movs r0, #8
	orrs r7, r0
	lsls r0, r7, #0x10
	lsrs r7, r0, #0x10
	b _0808FE5E
_0808FD02:
	adds r1, r2, #1
	str r1, [r6, #0x2c]
	ldrb r0, [r2, #1]
	cmp r0, #1
	bne _0808FD10
	adds r0, r1, #1
	str r0, [r6, #0x2c]
_0808FD10:
	bl sub_808EA3C
	movs r1, #8
	ands r1, r0
	cmp r1, #0
	beq _0808FD26
	mov r0, r8
	movs r1, #2
	bl Proc_Goto
	b _0808FD3C
_0808FD26:
	adds r0, r6, #0
	adds r0, #0x54
	ldrb r0, [r0]
	adds r0, #1
	adds r1, r6, #0
	adds r1, #0x5f
	strb r0, [r1]
	mov r0, r8
	movs r1, #1
	bl Proc_Goto
_0808FD3C:
	ldr r0, _0808FD44  @ 0x0000FFEF
	ands r7, r0
	b _0808FE68
	.align 2, 0
_0808FD44: .4byte 0x0000FFEF
_0808FD48:
	ldr r0, _0808FD90  @ 0x0000FFEF
	ands r7, r0
	ldr r0, [r6, #0x2c]
	adds r0, #1
	str r0, [r6, #0x2c]
	bl sub_808EA3C
	movs r1, #0x80
	lsls r1, r1, #1
	ands r1, r0
	cmp r1, #0
	beq _0808FD94
	adds r0, r6, #0
	adds r0, #0x57
	ldrb r1, [r0]
	adds r5, r6, #0
	adds r5, #0x59
	lsls r1, r1, #3
	ldrb r0, [r5]
	adds r1, r1, r0
	adds r1, #4
	adds r0, r6, #0
	adds r0, #0x58
	ldrb r2, [r0]
	adds r4, r6, #0
	adds r4, #0x5a
	lsls r2, r2, #3
	ldrb r0, [r4]
	adds r2, r2, r0
	adds r2, #8
	movs r3, #0x80
	lsls r3, r3, #3
	mov r0, r8
	bl sub_8007D04
	b _0808FDBE
	.align 2, 0
_0808FD90: .4byte 0x0000FFEF
_0808FD94:
	adds r0, r6, #0
	adds r0, #0x57
	ldrb r1, [r0]
	adds r5, r6, #0
	adds r5, #0x59
	lsls r1, r1, #3
	ldrb r0, [r5]
	adds r1, r1, r0
	adds r1, #4
	adds r0, r6, #0
	adds r0, #0x58
	ldrb r2, [r0]
	adds r4, r6, #0
	adds r4, #0x5a
	lsls r2, r2, #3
	ldrb r0, [r4]
	adds r2, r2, r0
	adds r2, #8
	mov r0, r8
	bl sub_8007CD8
_0808FDBE:
	adds r1, r5, #0
	adds r2, r4, #0
	ldr r0, [r6, #0x2c]
	bl sub_808F358
	b _0808FE68
_0808FDCA:
	ldr r0, [r6, #0x2c]
	adds r1, r0, #1
	str r1, [r6, #0x2c]
	ldrb r0, [r0, #1]
	cmp r0, #0x21
	bne _0808FDE2
	adds r2, r6, #0
	adds r2, #0x5e
	ldrb r1, [r2]
	movs r0, #1
	subs r0, r0, r1
	strb r0, [r2]
_0808FDE2:
	ldr r0, [r6, #0x2c]
	adds r0, #1
	str r0, [r6, #0x2c]
	b _0808FE5E
_0808FDEA:
	adds r0, r6, #0
	adds r0, #0x5e
	ldrb r0, [r0]
	cmp r0, #0
	beq _0808FE0E
	adds r5, r6, #0
	adds r5, #0x54
	movs r0, #0
	ldrsb r0, [r5, r0]
	lsls r0, r0, #2
	adds r4, r6, #0
	adds r4, #0x34
	adds r0, r4, r0
	ldr r0, [r0]
	movs r1, #0xc
	bl Text_SetColorId
	b _0808FE26
_0808FE0E:
	adds r5, r6, #0
	adds r5, #0x54
	movs r0, #0
	ldrsb r0, [r5, r0]
	lsls r0, r0, #2
	adds r4, r6, #0
	adds r4, #0x34
	adds r0, r4, r0
	ldr r0, [r0]
	movs r1, #0xb
	bl Text_SetColorId
_0808FE26:
	movs r0, #0
	ldrsb r0, [r5, r0]
	lsls r0, r0, #2
	adds r0, r4, r0
	ldr r0, [r0]
	ldr r1, [r6, #0x2c]
	bl Text_AppendChar
	str r0, [r6, #0x2c]
	bl GetTextDisplaySpeed
	cmp r0, #1
	beq _0808FE5E
	bl sub_808EA3C
	movs r1, #0x10
	ands r1, r0
	cmp r1, #0
	bne _0808FE5E
	ldr r0, _0808FE80  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0808FE5E
	movs r0, #0x6e
	bl m4aSongNumStart
_0808FE5E:
	movs r0, #1
	add r9, r0
	cmp r9, sl
	bge _0808FE68
	b _0808F99A
_0808FE68:
	movs r0, #0
	bl SetFont
	ldr r0, _0808FE84  @ gUnknown_03005398
	ldrb r0, [r0]
	cmp r0, #0
	beq _0808FE88
	cmp r0, #1
	beq _0808FE8C
	movs r0, #0
	b _0808FE8E
	.align 2, 0
_0808FE80: .4byte gRAMChapterData
_0808FE84: .4byte gUnknown_03005398
_0808FE88:
	movs r0, #0
	b _0808FE8E
_0808FE8C:
	movs r0, #1
_0808FE8E:
	adds r1, r7, #0
	bl sub_800578C
_0808FE94:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_808F8B4

	THUMB_FUNC_START sub_808FEA4
sub_808FEA4: @ 0x0808FEA4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	mov r8, r1
	mov ip, r2
	adds r4, r0, #0
	movs r6, #0
	cmp r6, ip
	bge _0808FF00
_0808FEBA:
	adds r1, r4, #0
	movs r2, #0
	adds r0, r6, #1
	mov r9, r0
	cmp r2, r8
	bge _0808FEF4
	mov r7, ip
	subs r7, #1
	mov sl, r2
_0808FECC:
	adds r5, r2, #1
	movs r3, #6
_0808FED0:
	ldr r0, [r1, #4]
	stm r1!, {r0}
	subs r3, #1
	cmp r3, #0
	bge _0808FED0
	cmp r6, r7
	bne _0808FEE2
	mov r0, sl
	b _0808FEEC
_0808FEE2:
	adds r0, r2, #0
	adds r0, #0x20
	lsls r0, r0, #5
	adds r0, r0, r4
	ldr r0, [r0]
_0808FEEC:
	stm r1!, {r0}
	adds r2, r5, #0
	cmp r2, r8
	blt _0808FECC
_0808FEF4:
	movs r0, #0x80
	lsls r0, r0, #3
	adds r4, r4, r0
	mov r6, r9
	cmp r6, ip
	blt _0808FEBA
_0808FF00:
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_808FEA4

	THUMB_FUNC_START sub_808FF10
sub_808FF10: @ 0x0808FF10
	adds r0, #0x4c
	movs r1, #0
	strh r1, [r0]
	bx lr

	THUMB_FUNC_END sub_808FF10

	THUMB_FUNC_START sub_808FF18
sub_808FF18: @ 0x0808FF18
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r7, r0, #0
	ldr r5, [r7, #0x14]
	adds r6, r5, #0
	adds r6, #0x54
	movs r2, #0
	ldrsb r2, [r6, r2]
	adds r2, #1
	lsls r2, r2, #1
	ldr r0, [r5, #0x4c]
	adds r1, r5, #0
	adds r1, #0x5b
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl sub_808FEA4
	adds r1, r7, #0
	adds r1, #0x4c
	ldrh r0, [r1]
	adds r0, #1
	movs r2, #0
	mov r8, r2
	strh r0, [r1]
	movs r0, #0
	ldrsh r1, [r1, r0]
	adds r4, r5, #0
	adds r4, #0x5f
	ldrb r0, [r4]
	lsls r0, r0, #4
	cmp r1, r0
	bne _0808FF92
	adds r0, r5, #0
	bl sub_808F30C
	ldrb r1, [r4]
	subs r1, #1
	ldrb r0, [r6]
	subs r0, r0, r1
	strb r0, [r6]
	adds r1, r5, #0
	adds r1, #0x59
	mov r2, r8
	strb r2, [r1]
	subs r4, #5
	strb r2, [r4]
	ldr r0, [r5, #0x2c]
	adds r2, r4, #0
	bl sub_808F358
	movs r0, #0
	ldrsb r0, [r6, r0]
	lsls r0, r0, #4
	ldrb r1, [r4]
	adds r0, r0, r1
	strb r0, [r4]
	adds r0, r7, #0
	bl Proc_Break
_0808FF92:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_808FF18

	THUMB_FUNC_START sub_808FF9C
sub_808FF9C: @ 0x0808FF9C
	push {r4, lr}
	ldr r4, [r0, #0x14]
	adds r0, r4, #0
	bl sub_808F2BC
	adds r1, r4, #0
	adds r1, #0x54
	movs r0, #0
	strb r0, [r1]
	adds r1, #5
	strb r0, [r1]
	adds r2, r4, #0
	adds r2, #0x5a
	strb r0, [r2]
	ldr r0, [r4, #0x2c]
	bl sub_808F358
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_808FF9C

	THUMB_FUNC_START sub_808FFC4
sub_808FFC4: @ 0x0808FFC4
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _0808FFE4  @ gUnknown_08A01E64
	adds r0, r4, #0
	bl Proc_Find
	bl Proc_End
	adds r0, r4, #0
	adds r1, r5, #0
	bl Proc_Start
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0808FFE4: .4byte gUnknown_08A01E64

	THUMB_FUNC_END sub_808FFC4

	THUMB_FUNC_START sub_808FFE8
sub_808FFE8: @ 0x0808FFE8
	push {lr}
	ldr r0, _0808FFF8  @ gUnknown_08A01E64
	bl Proc_Find
	bl Proc_End
	pop {r0}
	bx r0
	.align 2, 0
_0808FFF8: .4byte gUnknown_08A01E64

	THUMB_FUNC_END sub_808FFE8

	THUMB_FUNC_START sub_808FFFC
sub_808FFFC: @ 0x0808FFFC
	push {lr}
	bl sub_808EA3C
	movs r1, #4
	ands r1, r0
	cmp r1, #0
	bne _0809000E
	movs r0, #0
	b _08090010
_0809000E:
	movs r0, #1
_08090010:
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_808FFFC

	THUMB_FUNC_START sub_8090014
sub_8090014: @ 0x08090014
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r1, _08090040  @ gKeyStatusPtr
	ldr r0, [r1]
	ldrh r2, [r0, #8]
	movs r0, #2
	ands r0, r2
	adds r5, r1, #0
	cmp r0, #0
	beq _08090048
	ldr r0, _08090044  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809003A
	movs r0, #0x6b
	bl m4aSongNumStart
_0809003A:
	movs r0, #0
	b _08090068
	.align 2, 0
_08090040: .4byte gKeyStatusPtr
_08090044: .4byte gRAMChapterData
_08090048:
	movs r6, #1
	adds r0, r6, #0
	ands r0, r2
	cmp r0, #0
	beq _08090078
	ldr r0, _08090074  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08090064
	movs r0, #0x6a
	bl m4aSongNumStart
_08090064:
	movs r1, #0x2a
	ldrsh r0, [r4, r1]
_08090068:
	bl sub_8008A0C
	adds r0, r4, #0
	bl Proc_Break
	b _080900E2
	.align 2, 0
_08090074: .4byte gRAMChapterData
_08090078:
	movs r0, #0x20
	ands r0, r2
	cmp r0, #0
	beq _0809009C
	movs r2, #0x2a
	ldrsh r0, [r4, r2]
	cmp r0, #2
	bne _0809009C
	ldr r0, _080900E8  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809009A
	movs r0, #0x67
	bl m4aSongNumStart
_0809009A:
	strh r6, [r4, #0x2a]
_0809009C:
	ldr r0, [r5]
	ldrh r1, [r0, #8]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _080900C6
	movs r1, #0x2a
	ldrsh r0, [r4, r1]
	cmp r0, #1
	bne _080900C6
	ldr r0, _080900E8  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080900C2
	movs r0, #0x67
	bl m4aSongNumStart
_080900C2:
	movs r0, #2
	strh r0, [r4, #0x2a]
_080900C6:
	movs r2, #0x2c
	ldrsh r0, [r4, r2]
	movs r1, #0x2a
	ldrsh r2, [r4, r1]
	subs r2, #1
	lsls r1, r2, #2
	adds r1, r1, r2
	lsls r1, r1, #3
	adds r0, r0, r1
	subs r0, #4
	movs r2, #0x2e
	ldrsh r1, [r4, r2]
	bl DisplayUiHand
_080900E2:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080900E8: .4byte gRAMChapterData

	THUMB_FUNC_END sub_8090014

	THUMB_FUNC_START sub_80900EC
sub_80900EC: @ 0x080900EC
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	adds r5, r0, #0
	mov r8, r1
	adds r4, r2, #0
	mov r9, r3
	ldr r6, [sp, #0x1c]
	ldr r7, [sp, #0x24]
	ldr r0, [r5]
	bl GetStringFromIndex
	adds r3, r0, #0
	mov r0, r8
	movs r1, #0x10
	adds r2, r6, #0
	bl Text_InsertString
	ldr r0, [r5, #4]
	bl GetStringFromIndex
	adds r3, r0, #0
	mov r0, r8
	movs r1, #0x38
	adds r2, r6, #0
	bl Text_InsertString
	ldr r0, _08090148  @ gUnknown_08A01EC4
	adds r1, r7, #0
	bl Proc_StartBlocking
	mov r1, sp
	ldrh r1, [r1, #0x20]
	strh r1, [r0, #0x2a]
	adds r4, #0x10
	strh r4, [r0, #0x2c]
	mov r2, r9
	strh r2, [r0, #0x2e]
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08090148: .4byte gUnknown_08A01EC4

	THUMB_FUNC_END sub_80900EC

	THUMB_FUNC_START sub_809014C
sub_809014C: @ 0x0809014C
	push {r4, r5, lr}
	ldr r0, _080901B8  @ gUnknown_0200E158
	bl InitUnitStack
	movs r5, #1
_08090156:
	adds r0, r5, #0
	bl GetUnit
	adds r4, r0, #0
	cmp r4, #0
	beq _0809017A
	ldr r0, [r4]
	cmp r0, #0
	beq _0809017A
	adds r0, r4, #0
	bl IsUnitInCurrentRoster
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809017A
	adds r0, r4, #0
	bl PushUnit
_0809017A:
	adds r5, #1
	cmp r5, #0x3f
	ble _08090156
	movs r5, #1
_08090182:
	adds r0, r5, #0
	bl GetUnit
	adds r4, r0, #0
	cmp r4, #0
	beq _080901A6
	ldr r0, [r4]
	cmp r0, #0
	beq _080901A6
	adds r0, r4, #0
	bl IsUnitInCurrentRoster
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080901A6
	adds r0, r4, #0
	bl PushUnit
_080901A6:
	adds r5, #1
	cmp r5, #0x3f
	ble _08090182
	bl LoadPlayerUnitsFromUnitStack
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080901B8: .4byte gUnknown_0200E158

	THUMB_FUNC_END sub_809014C

	THUMB_FUNC_START sub_80901BC
sub_80901BC: @ 0x080901BC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	lsls r1, r1, #0x18
	lsrs r7, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r6, r2, #0x18
	ldr r0, _08090234  @ gUnknown_08A17B58
	ldr r3, [r0]
	movs r0, #0xa0
	lsls r0, r0, #7
	str r0, [sp]
	movs r0, #0xd
	mov r1, r8
	adds r2, r7, #0
	bl PutSpriteExt
	movs r5, #0
	subs r0, r6, #1
	cmp r5, r0
	bge _08090210
	mov r4, r8
	adds r4, #8
_080901F2:
	ldr r0, _08090234  @ gUnknown_08A17B58
	ldr r3, [r0, #4]
	movs r0, #0xa0
	lsls r0, r0, #7
	str r0, [sp]
	movs r0, #0xd
	adds r1, r4, #0
	adds r2, r7, #0
	bl PutSpriteExt
	adds r4, #0x10
	adds r5, #1
	subs r0, r6, #1
	cmp r5, r0
	blt _080901F2
_08090210:
	lsls r1, r5, #4
	add r1, r8
	adds r1, #8
	ldr r0, _08090234  @ gUnknown_08A17B58
	ldr r3, [r0, #8]
	movs r0, #0xa0
	lsls r0, r0, #7
	str r0, [sp]
	movs r0, #0xd
	adds r2, r7, #0
	bl PutSpriteExt
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08090234: .4byte gUnknown_08A17B58

	THUMB_FUNC_END sub_80901BC

	THUMB_FUNC_START sub_8090238
sub_8090238: @ 0x08090238
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	ldr r5, _080902C0  @ gUnknown_02023D12
	adds r0, r5, #0
	movs r1, #4
	movs r2, #1
	movs r3, #0
	bl TileMap_FillRect
	ldr r4, _080902C4  @ gUnknown_0200E150
	adds r0, r4, #0
	bl Text_Clear
	movs r7, #0
	mov r8, r4
	mov sl, r5
_08090266:
	movs r6, #0
	lsls r0, r7, #3
	adds r1, r7, #1
	mov r9, r1
	adds r0, r0, r7
	lsls r5, r0, #4
	ldr r2, _080902C8  @ gUnknown_08A17C48
	adds r1, r5, r2
_08090276:
	ldrb r0, [r1]
	ldr r2, [sp]
	cmp r0, r2
	bne _080902FC
	ldr r4, _080902C4  @ gUnknown_0200E150
	adds r0, r4, #0
	movs r1, #0
	bl Text_SetXCursor
	adds r0, r4, #0
	movs r1, #0
	bl Text_SetColorId
	ldr r0, _080902CC  @ 0x000004FD
	bl GetStringFromIndex
	adds r1, r0, #0
	adds r0, r4, #0
	bl Text_AppendString
	cmp r7, #5
	bne _080902D0
	cmp r6, #0
	beq _080902D0
	adds r0, r4, #0
	mov r1, sl
	bl Text_Draw
	adds r1, r6, #0
	adds r1, #0x6f
	mov r0, sl
	adds r0, #8
	movs r2, #0xa0
	lsls r2, r2, #7
	bl DrawIcon
	b _08090306
	.align 2, 0
_080902C0: .4byte gUnknown_02023D12
_080902C4: .4byte gUnknown_0200E150
_080902C8: .4byte gUnknown_08A17C48
_080902CC: .4byte 0x000004FD
_080902D0:
	mov r0, r8
	movs r1, #4
	bl Text_Advance
	ldr r1, _080902F4  @ gUnknown_08A17C4C
	adds r0, r5, r1
	ldr r0, [r0]
	bl GetStringFromIndex
	adds r1, r0, #0
	mov r0, r8
	bl Text_AppendString
	mov r0, r8
	ldr r1, _080902F8  @ gUnknown_02023D12
	bl Text_Draw
	b _08090306
	.align 2, 0
_080902F4: .4byte gUnknown_08A17C4C
_080902F8: .4byte gUnknown_02023D12
_080902FC:
	adds r5, #0x10
	adds r1, #0x10
	adds r6, #1
	cmp r6, #8
	ble _08090276
_08090306:
	mov r7, r9
	cmp r7, #9
	ble _08090266
	movs r0, #4
	bl BG_EnableSyncByMask
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8090238

	THUMB_FUNC_START sub_8090324
sub_8090324: @ 0x08090324
	push {lr}
	adds r3, r0, #0
	movs r2, #0
	ldr r1, _08090348  @ gUnknown_0200F15C
_0809032C:
	ldr r0, [r1]
	cmp r0, r3
	beq _08090354
	adds r1, #4
	adds r2, #1
	cmp r2, #7
	ble _0809032C
	movs r2, #0
	ldr r1, _08090348  @ gUnknown_0200F15C
_0809033E:
	ldr r0, [r1]
	cmp r0, #0xff
	bne _0809034C
	str r3, [r1]
	b _08090354
	.align 2, 0
_08090348: .4byte gUnknown_0200F15C
_0809034C:
	adds r1, #4
	adds r2, #1
	cmp r2, #7
	ble _0809033E
_08090354:
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8090324

	THUMB_FUNC_START sub_8090358
sub_8090358: @ 0x08090358
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x28
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x14
	ldr r3, _0809040C  @ gUnknown_0200F158
	movs r2, #0xff
	add r1, sp, #0x1c
_0809036A:
	str r2, [r1]
	subs r1, #4
	cmp r1, sp
	bge _0809036A
	cmp r0, #0
	ble _08090378
	subs r0, #1
_08090378:
	movs r6, #0
	ldrb r3, [r3]
	cmp r0, r3
	bge _080903BE
	ldr r1, _08090410  @ gUnknown_0200D6E0
	adds r5, r0, #0
	mov r7, sp
	lsls r0, r5, #2
	adds r4, r0, r1
_0809038A:
	ldr r0, [r4]
	ldr r0, [r0]
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _080903AA
	ldr r0, [r4]
	ldr r0, [r0]
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl GetItemIconId
	str r0, [r7]
_080903AA:
	adds r5, #1
	adds r7, #4
	adds r4, #4
	adds r6, #1
	cmp r6, #7
	bgt _080903BE
	ldr r0, _0809040C  @ gUnknown_0200F158
	ldrb r0, [r0]
	cmp r5, r0
	blt _0809038A
_080903BE:
	movs r6, #0
	ldr r7, _08090414  @ gUnknown_0200F15C
	mov r8, r7
_080903C4:
	lsls r1, r6, #2
	mov r2, r8
	adds r0, r1, r2
	ldr r0, [r0]
	adds r4, r1, #0
	adds r6, #1
	cmp r0, #0xff
	beq _080903FC
	movs r5, #0
	adds r1, r0, #0
	mov r2, sp
	movs r3, #7
_080903DC:
	ldr r0, [r2]
	cmp r0, r1
	bne _080903E4
	movs r5, #1
_080903E4:
	adds r2, #4
	subs r3, #1
	cmp r3, #0
	bge _080903DC
	cmp r5, #0
	bne _080903FC
	adds r4, r4, r7
	ldr r0, [r4]
	bl ClearIconGfx
	movs r0, #0xff
	str r0, [r4]
_080903FC:
	cmp r6, #7
	ble _080903C4
	add sp, #0x28
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809040C: .4byte gUnknown_0200F158
_08090410: .4byte gUnknown_0200D6E0
_08090414: .4byte gUnknown_0200F15C

	THUMB_FUNC_END sub_8090358

	THUMB_FUNC_START sub_8090418
sub_8090418: @ 0x08090418
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	adds r4, r0, #0
	lsls r1, r1, #0x18
	lsrs r5, r1, #0x18
	cmp r1, #0
	beq _0809045A
	bl sub_8095394
	b _0809045E
_08090430:
	adds r0, r4, #0
	adds r0, #0x2c
	strb r3, [r0]
	strh r3, [r4, #0x3e]
	b _08090508
_0809043A:
	adds r0, r4, #0
	adds r0, #0x2c
	strb r3, [r0]
	strh r1, [r4, #0x3e]
	b _08090508
_08090444:
	subs r1, r3, r1
	adds r0, r4, #0
	adds r0, #0x2c
	strb r1, [r0]
	b _08090508
_0809044E:
	adds r1, r4, #0
	adds r1, #0x2c
	movs r0, #1
	strb r0, [r1]
	strh r7, [r4, #0x3e]
	b _08090508
_0809045A:
	bl GetLastStatScreenUid
_0809045E:
	adds r1, r0, #0
	movs r3, #0
	ldr r0, _08090498  @ gUnknown_0200F158
	ldrb r6, [r0]
	mov r9, r0
	cmp r3, r6
	bge _08090508
	lsls r0, r5, #0x18
	asrs r0, r0, #0x18
	mov r8, r0
	movs r0, #0x2c
	adds r0, r0, r4
	mov ip, r0
	movs r5, #0x40
	negs r5, r5
	movs r7, #0x10
	negs r7, r7
	ldr r2, _0809049C  @ gUnknown_0200D6E0
_08090482:
	mov r0, r8
	cmp r0, #0
	beq _080904A0
	ldr r0, [r2]
	ldr r0, [r0]
	ldr r0, [r0]
	ldrb r0, [r0, #4]
	cmp r0, r1
	beq _080904AE
	b _080904FC
	.align 2, 0
_08090498: .4byte gUnknown_0200F158
_0809049C: .4byte gUnknown_0200D6E0
_080904A0:
	ldr r0, [r2]
	ldr r0, [r0]
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, r1
	bne _080904FC
_080904AE:
	adds r0, r4, #0
	adds r0, #0x30
	movs r1, #0
	strb r3, [r0]
	cmp r3, #0
	beq _08090430
	mov r0, r9
	ldrb r2, [r0]
	subs r0, r2, #1
	cmp r3, r0
	bne _080904DA
	cmp r2, #6
	bls _0809043A
	movs r0, #5
	mov r1, ip
	strb r0, [r1]
	mov r1, r9
	ldrb r0, [r1]
	subs r0, #6
	lsls r0, r0, #4
	strh r0, [r4, #0x3e]
	b _08090508
_080904DA:
	ldrh r2, [r4, #0x3e]
	lsrs r1, r2, #4
	adds r0, r1, #0
	cmp r3, r0
	ble _080904EA
	adds r0, #5
	cmp r3, r0
	blt _08090444
_080904EA:
	cmp r2, r7
	bgt _0809044E
	cmp r2, r5
	bge _08090508
	movs r0, #4
	mov r1, ip
	strb r0, [r1]
	strh r5, [r4, #0x3e]
	b _08090508
_080904FC:
	adds r5, #0x10
	adds r7, #0x10
	adds r2, #4
	adds r3, #1
	cmp r3, r6
	blt _08090482
_08090508:
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8090418

	THUMB_FUNC_START sub_8090514
sub_8090514: @ 0x08090514
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	asrs r2, r0, #0x18
	cmp r2, #0
	beq _080905B4
	ldr r0, _080905B0  @ gLCDControlBuffer
	mov ip, r0
	ldrb r0, [r0, #1]
	movs r1, #0x20
	orrs r0, r1
	movs r1, #0x40
	orrs r0, r1
	movs r1, #0x7f
	ands r0, r1
	mov r1, ip
	strb r0, [r1, #1]
	mov r0, ip
	adds r0, #0x2d
	movs r2, #0
	strb r2, [r0]
	adds r1, #0x31
	movs r0, #0x3a
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x2c
	movs r3, #0xf0
	strb r3, [r0]
	subs r1, #1
	movs r0, #0x98
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x2f
	strb r2, [r0]
	adds r0, #4
	strb r2, [r0]
	subs r0, #5
	strb r3, [r0]
	adds r1, #2
	movs r0, #0x20
	strb r0, [r1]
	mov r2, ip
	adds r2, #0x34
	ldrb r0, [r2]
	movs r1, #1
	orrs r0, r1
	movs r5, #2
	orrs r0, r5
	movs r4, #4
	orrs r0, r4
	movs r3, #8
	orrs r0, r3
	movs r6, #0x10
	orrs r0, r6
	strb r0, [r2]
	mov r7, ip
	adds r7, #0x35
	ldrb r2, [r7]
	movs r1, #2
	negs r1, r1
	adds r0, r1, #0
	ands r0, r2
	orrs r0, r5
	orrs r0, r4
	orrs r0, r3
	orrs r0, r6
	strb r0, [r7]
	mov r2, ip
	adds r2, #0x36
	ldrb r0, [r2]
	ands r1, r0
	orrs r1, r5
	orrs r1, r4
	orrs r1, r3
	movs r0, #0x11
	negs r0, r0
	ands r1, r0
	strb r1, [r2]
	b _08090614
	.align 2, 0
_080905B0: .4byte gLCDControlBuffer
_080905B4:
	ldr r0, _0809061C  @ gLCDControlBuffer
	mov ip, r0
	ldrb r0, [r0, #1]
	movs r1, #0x20
	orrs r0, r1
	movs r1, #0x41
	negs r1, r1
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	mov r1, ip
	strb r0, [r1, #1]
	mov r0, ip
	adds r0, #0x2d
	strb r2, [r0]
	adds r1, #0x31
	movs r0, #0x3a
	strb r0, [r1]
	subs r1, #5
	movs r0, #0xf0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0x98
	strb r0, [r1]
	mov r2, ip
	adds r2, #0x34
	ldrb r0, [r2]
	movs r1, #1
	orrs r0, r1
	movs r6, #2
	orrs r0, r6
	movs r5, #4
	orrs r0, r5
	movs r4, #8
	orrs r0, r4
	movs r3, #0x10
	orrs r0, r3
	strb r0, [r2]
	adds r2, #2
	ldrb r1, [r2]
	movs r0, #2
	negs r0, r0
	ands r0, r1
	orrs r0, r6
	orrs r0, r5
	orrs r0, r4
	orrs r0, r3
	strb r0, [r2]
_08090614:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809061C: .4byte gLCDControlBuffer

	THUMB_FUNC_END sub_8090514

	THUMB_FUNC_START sub_8090620
sub_8090620: @ 0x08090620
	push {r4, lr}
	adds r4, r0, #0
	bl MU_EndAll
	ldr r0, [r4, #0x40]
	bl Proc_End
	ldr r0, [r4, #0x44]
	bl Proc_End
	bl EndGreenTextColorManager
	ldr r2, _08090660  @ gLCDControlBuffer
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
	adds r0, r4, #0
	adds r0, #0x39
	ldrb r0, [r0]
	cmp r0, #1
	bne _08090664
	movs r0, #0x11
	bl SetStatScreenConfig
	b _0809066A
	.align 2, 0
_08090660: .4byte gLCDControlBuffer
_08090664:
	movs r0, #0x1f
	bl SetStatScreenConfig
_0809066A:
	ldr r1, _080906A4  @ gUnknown_0200D6E0
	adds r0, r4, #0
	adds r0, #0x30
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r0, [r0]
	adds r1, r4, #0
	bl StartStatScreen
	ldr r1, _080906A8  @ gRAMChapterData
	adds r0, r4, #0
	adds r0, #0x34
	ldrb r0, [r0]
	adds r2, r4, #0
	adds r2, #0x32
	lsls r0, r0, #7
	ldrb r2, [r2]
	adds r0, r0, r2
	strb r0, [r1, #0x1a]
	adds r1, r4, #0
	adds r1, #0x29
	movs r0, #4
	strb r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080906A4: .4byte gUnknown_0200D6E0
_080906A8: .4byte gRAMChapterData

	THUMB_FUNC_END sub_8090620

	THUMB_FUNC_START sub_80906AC
sub_80906AC: @ 0x080906AC
	push {lr}
	bl sub_8090D80
	ldr r2, _080906D4  @ gLCDControlBuffer
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
	pop {r0}
	bx r0
	.align 2, 0
_080906D4: .4byte gLCDControlBuffer

	THUMB_FUNC_END sub_80906AC

	THUMB_FUNC_START sub_80906D8
sub_80906D8: @ 0x080906D8
	ldr r2, _080906F4  @ gLCDControlBuffer
	ldrb r0, [r2, #1]
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
	strb r0, [r2, #1]
	bx lr
	.align 2, 0
_080906F4: .4byte gLCDControlBuffer

	THUMB_FUNC_END sub_80906D8

	THUMB_FUNC_START sub_80906F8
sub_80906F8: @ 0x080906F8
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x14]
	str r0, [r5, #0x2c]
	adds r0, r5, #0
	adds r0, #0x3b
	movs r4, #0
	strb r4, [r0]
	adds r0, #1
	strb r4, [r0]
	ldr r0, [r5, #0x2c]
	ldrh r0, [r0, #0x3e]
	movs r1, #0
	strh r0, [r5, #0x38]
	adds r0, r5, #0
	adds r0, #0x3a
	strb r1, [r0]
	adds r0, r5, #0
	bl Make6CMenuScroll
	str r0, [r5, #0x34]
	movs r0, #0xe0
	movs r1, #0x40
	bl sub_80976AC
	ldr r0, [r5, #0x2c]
	ldrh r1, [r0, #0x3e]
	ldr r0, _08090778  @ gUnknown_0200F158
	ldrb r2, [r0]
	movs r0, #0xa
	movs r3, #6
	bl sub_80976CC
	movs r0, #0xe4
	lsls r0, r0, #7
	movs r1, #1
	bl sub_8097700
	bl SMS_FlushIndirect
	movs r0, #7
	strh r0, [r5, #0x3e]
	adds r1, r5, #0
	adds r1, #0x40
	movs r0, #0xe1
	strh r0, [r1]
	adds r0, r5, #0
	adds r0, #0x44
	strh r4, [r0]
	subs r0, #2
	strh r4, [r0]
	adds r0, #6
	movs r1, #4
	strh r1, [r0]
	subs r0, #2
	strh r1, [r0]
	ldr r0, _0809077C  @ gUnknown_08A1C7D8
	ldr r1, _08090780  @ 0x06010280
	bl CopyDataWithPossibleUncomp
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08090778: .4byte gUnknown_0200F158
_0809077C: .4byte gUnknown_08A1C7D8
_08090780: .4byte 0x06010280

	THUMB_FUNC_END sub_80906F8

	THUMB_FUNC_START sub_8090784
sub_8090784: @ 0x08090784
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x2c
	adds r6, r0, #0
	add r1, sp, #4
	ldr r0, _08090834  @ gUnknown_08205B84
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldr r0, [r0]
	str r0, [r1]
	ldr r0, [r6, #0x2c]
	adds r0, #0x34
	ldrb r0, [r0]
	ldr r5, _08090838  @ 0x000020E2
	cmp r0, #0
	bne _080907AC
	movs r5, #0xe2
_080907AC:
	adds r4, r6, #0
	adds r4, #0x3b
	ldrb r0, [r4]
	lsrs r0, r0, #3
	movs r1, #3
	ands r0, r1
	lsls r0, r0, #2
	add r0, sp
	adds r0, #4
	ldr r2, [r0]
	adds r2, #7
	ldr r3, _0809083C  @ gUnknown_08A17B64
	movs r7, #0x90
	lsls r7, r7, #8
	str r7, [sp]
	movs r0, #0xb
	adds r1, r5, #0
	bl PutSpriteExt
	ldr r1, _08090840  @ gUnknown_08A17C20
	ldr r0, [r6, #0x2c]
	adds r0, #0x2f
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r3, [r0]
	str r7, [sp]
	movs r0, #0xd
	movs r1, #0x10
	movs r2, #8
	bl PutSpriteExt
	ldr r0, [r6, #0x2c]
	ldrh r1, [r0, #0x3e]
	ldr r0, _08090844  @ gUnknown_0200F158
	ldrb r2, [r0]
	movs r0, #0xa
	movs r3, #6
	bl sub_80976CC
	ldr r5, [r6, #0x2c]
	adds r0, r5, #0
	adds r0, #0x29
	ldrb r0, [r0]
	str r4, [sp, #0x14]
	cmp r0, #2
	bls _0809084C
	ldr r2, _08090848  @ gUnknown_08A17C48
	adds r3, r5, #0
	adds r3, #0x2d
	adds r0, r5, #0
	adds r0, #0x2f
	ldrb r1, [r0]
	lsls r0, r1, #3
	adds r0, r0, r1
	ldrb r3, [r3]
	adds r0, r0, r3
	lsls r0, r0, #4
	adds r0, r0, r2
	ldrb r0, [r0, #8]
	adds r1, r5, #0
	adds r1, #0x2c
	ldrb r1, [r1]
	lsls r1, r1, #4
	adds r1, #0x28
	bl DisplayUiHand
	b _08090862
	.align 2, 0
_08090834: .4byte gUnknown_08205B84
_08090838: .4byte 0x000020E2
_0809083C: .4byte gUnknown_08A17B64
_08090840: .4byte gUnknown_08A17C20
_08090844: .4byte gUnknown_0200F158
_08090848: .4byte gUnknown_08A17C48
_0809084C:
	adds r0, r5, #0
	adds r0, #0x2c
	ldrb r2, [r0]
	lsls r2, r2, #4
	adds r2, #0x40
	ldr r3, _080908B4  @ gUnknown_08A17B6C
	str r7, [sp]
	movs r0, #0xd
	movs r1, #4
	bl PutSpriteExt
_08090862:
	ldr r1, [r6, #0x2c]
	ldrh r0, [r6, #0x38]
	ldrh r2, [r1, #0x3e]
	cmp r0, r2
	bne _08090876
	ldrh r0, [r1, #0x3e]
	movs r1, #0xf
	ands r0, r1
	cmp r0, #0
	beq _080908C0
_08090876:
	ldr r0, _080908B8  @ gPaletteBuffer
	ldr r1, _080908BC  @ gUnknown_02013460
	ldrh r1, [r1, #0x10]
	movs r3, #0xcf
	lsls r3, r3, #2
	adds r0, r0, r3
	strh r1, [r0]
	bl EnablePaletteSync
	adds r2, r6, #0
	adds r2, #0x3c
	movs r0, #0x20
	strb r0, [r2]
	ldr r0, [r6, #0x2c]
	ldrh r0, [r0, #0x3e]
	strh r0, [r6, #0x38]
	adds r0, r6, #0
	adds r0, #0x3a
	ldrb r1, [r0]
	str r2, [sp, #0x18]
	mov r9, r0
	cmp r1, #0
	bne _080908FC
	movs r0, #1
	bl sub_8090514
	movs r0, #1
	mov r4, r9
	strb r0, [r4]
	b _080908FC
	.align 2, 0
_080908B4: .4byte gUnknown_08A17B6C
_080908B8: .4byte gPaletteBuffer
_080908BC: .4byte gUnknown_02013460
_080908C0:
	ldr r2, _08090B20  @ gPaletteBuffer
	ldr r3, _08090B24  @ gUnknown_02013460
	adds r4, r6, #0
	adds r4, #0x3c
	ldrb r0, [r4]
	lsrs r0, r0, #2
	movs r1, #0xf
	ands r0, r1
	lsls r0, r0, #1
	adds r0, r0, r3
	ldrh r0, [r0]
	movs r1, #0xcf
	lsls r1, r1, #2
	adds r2, r2, r1
	strh r0, [r2]
	bl EnablePaletteSync
	adds r0, r6, #0
	adds r0, #0x3a
	ldrb r1, [r0]
	str r4, [sp, #0x18]
	mov r9, r0
	cmp r1, #1
	bne _080908FC
	movs r0, #0
	bl sub_8090514
	movs r0, #0
	mov r2, r9
	strb r0, [r2]
_080908FC:
	bl SMS_FlushIndirect
	ldrh r0, [r6, #0x38]
	lsrs r7, r0, #4
	movs r1, #0xf
	ands r0, r1
	negs r0, r0
	mov r8, r0
	movs r5, #0
	ldr r0, _08090B28  @ gUnknown_0200F158
	adds r3, r6, #0
	adds r3, #0x46
	str r3, [sp, #0x24]
	adds r4, r6, #0
	adds r4, #0x48
	str r4, [sp, #0x28]
	adds r1, r6, #0
	adds r1, #0x42
	str r1, [sp, #0x1c]
	adds r2, r6, #0
	adds r2, #0x44
	str r2, [sp, #0x20]
	ldrb r0, [r0]
	cmp r7, r0
	bge _08090964
	ldr r1, _08090B2C  @ gUnknown_0200D6E0
	adds r4, r7, #0
	lsls r0, r7, #2
	adds r0, r0, r1
	mov sl, r0
_08090938:
	lsls r2, r5, #4
	mov r0, r8
	adds r0, #0x38
	adds r2, r2, r0
	mov r3, sl
	adds r3, #4
	mov sl, r3
	subs r3, #4
	ldm r3!, {r0}
	ldr r3, [r0]
	movs r0, #4
	movs r1, #8
	bl sub_8027B60
	adds r4, #1
	adds r5, #1
	cmp r5, #5
	bgt _08090964
	ldr r0, _08090B28  @ gUnknown_0200F158
	ldrb r0, [r0]
	cmp r4, r0
	blt _08090938
_08090964:
	mov r4, r9
	ldrb r0, [r4]
	cmp r0, #0
	beq _08090990
	adds r3, r5, r7
	ldr r0, _08090B28  @ gUnknown_0200F158
	ldrb r0, [r0]
	cmp r3, r0
	bge _08090990
	lsls r2, r5, #4
	mov r0, r8
	adds r0, #0x38
	adds r2, r2, r0
	ldr r1, _08090B2C  @ gUnknown_0200D6E0
	lsls r0, r3, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r3, [r0]
	movs r0, #4
	movs r1, #8
	bl sub_8027B60
_08090990:
	ldr r2, _08090B30  @ gKeyStatusPtr
	ldr r0, [r2]
	ldrh r1, [r0, #8]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _080909A8
	movs r0, #0x1f
	ldr r1, [sp, #0x24]
	strh r0, [r1]
	movs r0, #1
	strh r0, [r6, #0x3e]
_080909A8:
	ldr r0, [r2]
	ldrh r1, [r0, #8]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _080909C2
	movs r0, #0x1f
	ldr r2, [sp, #0x28]
	strh r0, [r2]
	adds r1, r6, #0
	adds r1, #0x40
	movs r0, #0xe7
	strh r0, [r1]
_080909C2:
	ldr r3, [sp, #0x24]
	ldrh r0, [r3]
	ldr r4, [sp, #0x1c]
	ldrh r4, [r4]
	adds r0, r0, r4
	ldr r1, [sp, #0x1c]
	strh r0, [r1]
	ldr r2, [sp, #0x28]
	ldrh r0, [r2]
	ldr r3, [sp, #0x20]
	ldrh r3, [r3]
	adds r0, r0, r3
	ldr r4, [sp, #0x20]
	strh r0, [r4]
	ldr r0, [sp, #0x24]
	ldrh r1, [r0]
	movs r2, #0
	ldrsh r0, [r0, r2]
	cmp r0, #4
	ble _080909F0
	subs r0, r1, #1
	ldr r3, [sp, #0x24]
	strh r0, [r3]
_080909F0:
	ldr r4, [sp, #0x28]
	ldrh r1, [r4]
	movs r2, #0
	ldrsh r0, [r4, r2]
	cmp r0, #4
	ble _08090A00
	subs r0, r1, #1
	strh r0, [r4]
_08090A00:
	bl GetGameClock
	movs r1, #3
	ands r1, r0
	cmp r1, #0
	bne _08090A2C
	ldrh r1, [r6, #0x3e]
	movs r3, #0x3e
	ldrsh r0, [r6, r3]
	cmp r0, #6
	bgt _08090A1A
	adds r0, r1, #1
	strh r0, [r6, #0x3e]
_08090A1A:
	adds r1, r6, #0
	adds r1, #0x40
	ldrh r2, [r1]
	movs r4, #0
	ldrsh r0, [r1, r4]
	cmp r0, #0xe1
	ble _08090A2C
	subs r0, r2, #1
	strh r0, [r1]
_08090A2C:
	ldr r1, [r6, #0x2c]
	adds r0, r1, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	cmp r0, #1
	bls _08090A90
	adds r0, r1, #0
	adds r0, #0x39
	ldrb r0, [r0]
	cmp r0, #3
	beq _08090A90
	movs r0, #0x3e
	ldrsh r4, [r6, r0]
	ldr r5, _08090B34  @ gObject_8x8
	ldr r1, [sp, #0x1c]
	ldrh r0, [r1]
	lsrs r0, r0, #5
	movs r1, #6
	bl __umodsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r2, _08090B38  @ 0x00001414
	adds r0, r0, r2
	str r0, [sp]
	movs r0, #0
	adds r1, r4, #0
	movs r2, #0x28
	adds r3, r5, #0
	bl PutSprite
	movs r3, #0x3e
	ldrsh r4, [r6, r3]
	ldr r1, [sp, #0x1c]
	ldrh r0, [r1]
	lsrs r0, r0, #5
	movs r1, #6
	bl __umodsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r2, _08090B3C  @ 0x0000141A
	adds r0, r0, r2
	str r0, [sp]
	movs r0, #0
	adds r1, r4, #0
	movs r2, #0x30
	adds r3, r5, #0
	bl PutSprite
_08090A90:
	ldr r1, [r6, #0x2c]
	adds r0, r1, #0
	adds r0, #0x2f
	adds r2, r1, #0
	adds r2, #0x2e
	ldrb r0, [r0]
	ldrb r2, [r2]
	cmp r0, r2
	bcs _08090AFE
	adds r0, r1, #0
	adds r0, #0x39
	ldrb r0, [r0]
	cmp r0, #3
	beq _08090AFE
	adds r4, r6, #0
	adds r4, #0x40
	movs r3, #0
	ldrsh r5, [r4, r3]
	ldr r6, _08090B40  @ gObject_8x8_HFlipped
	ldr r1, [sp, #0x20]
	ldrh r0, [r1]
	lsrs r0, r0, #5
	movs r1, #6
	bl __umodsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r2, _08090B38  @ 0x00001414
	adds r0, r0, r2
	str r0, [sp]
	movs r0, #0
	adds r1, r5, #0
	movs r2, #0x28
	adds r3, r6, #0
	bl PutSprite
	movs r3, #0
	ldrsh r4, [r4, r3]
	ldr r1, [sp, #0x20]
	ldrh r0, [r1]
	lsrs r0, r0, #5
	movs r1, #6
	bl __umodsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r2, _08090B3C  @ 0x0000141A
	adds r0, r0, r2
	str r0, [sp]
	movs r0, #0
	adds r1, r4, #0
	movs r2, #0x30
	adds r3, r6, #0
	bl PutSprite
_08090AFE:
	ldr r3, [sp, #0x14]
	ldrb r0, [r3]
	adds r0, #1
	strb r0, [r3]
	ldr r4, [sp, #0x18]
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	add sp, #0x2c
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08090B20: .4byte gPaletteBuffer
_08090B24: .4byte gUnknown_02013460
_08090B28: .4byte gUnknown_0200F158
_08090B2C: .4byte gUnknown_0200D6E0
_08090B30: .4byte gKeyStatusPtr
_08090B34: .4byte gObject_8x8
_08090B38: .4byte 0x00001414
_08090B3C: .4byte 0x0000141A
_08090B40: .4byte gObject_8x8_HFlipped

	THUMB_FUNC_END sub_8090784

	THUMB_FUNC_START nullsub_63
nullsub_63: @ 0x08090B44
	bx lr

	THUMB_FUNC_END nullsub_63

	THUMB_FUNC_START sub_8090B48
sub_8090B48: @ 0x08090B48
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r7, r0, #0
	mov r8, r1
	ldr r0, [r7, #0xc]
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	bne _08090B66
	mov r1, r8
	adds r1, #0x3b
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
_08090B66:
	ldr r5, _08090C48  @ gUnknown_0200D3E0
	ldr r4, _08090C4C  @ gUnknown_0200F158
	ldrb r1, [r4]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	str r7, [r0]
	movs r1, #1
	negs r1, r1
	adds r0, r7, #0
	bl BattleGenerateUiStats
	ldrb r0, [r4]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r5
	ldr r3, _08090C50  @ gBattleActor
	adds r0, r3, #0
	adds r0, #0x5a
	ldrh r0, [r0]
	adds r0, #1
	movs r2, #0xff
	ands r0, r2
	subs r0, #1
	strh r0, [r1, #4]
	ldrb r0, [r4]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r5
	adds r0, r3, #0
	adds r0, #0x60
	ldrh r0, [r0]
	adds r0, #1
	ands r0, r2
	subs r0, #1
	strh r0, [r1, #6]
	ldrb r0, [r4]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r5
	adds r0, r3, #0
	adds r0, #0x62
	ldrh r0, [r0]
	adds r0, #1
	ands r0, r2
	subs r0, #1
	strh r0, [r1, #8]
	adds r0, r7, #0
	bl GetUnitSupporterCount
	adds r5, r0, #0
	movs r6, #0
	movs r4, #0
	cmp r6, r5
	bge _08090BF2
_08090BDC:
	adds r0, r7, #0
	adds r1, r4, #0
	bl CanUnitSupportNow
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08090BEC
	adds r6, #1
_08090BEC:
	adds r4, #1
	cmp r4, r5
	blt _08090BDC
_08090BF2:
	cmp r6, #3
	ble _08090C0C
	mov r5, r8
	adds r5, #0x2e
	ldrb r4, [r5]
	subs r0, r6, #1
	movs r1, #3
	bl __divsi3
	adds r0, #6
	cmp r4, r0
	bge _08090C0C
	strb r0, [r5]
_08090C0C:
	ldr r4, _08090C48  @ gUnknown_0200D3E0
	ldr r3, _08090C4C  @ gUnknown_0200F158
	ldrb r1, [r3]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	strb r6, [r0, #0xa]
	ldr r0, _08090C54  @ gUnknown_0200D6E0
	ldrb r1, [r3]
	lsls r2, r1, #2
	adds r2, r2, r0
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	str r0, [r2]
	ldrb r0, [r3]
	adds r0, #1
	strb r0, [r3]
	adds r0, r7, #0
	bl GetUnitSMSId
	bl SMS_RegisterUsage
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08090C48: .4byte gUnknown_0200D3E0
_08090C4C: .4byte gUnknown_0200F158
_08090C50: .4byte gBattleActor
_08090C54: .4byte gUnknown_0200D6E0

	THUMB_FUNC_END sub_8090B48

	THUMB_FUNC_START sub_8090C58
sub_8090C58: @ 0x08090C58
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r0, _08090CAC  @ gUnknown_0200F158
	movs r1, #0
	strb r1, [r0]
	adds r0, r6, #0
	adds r0, #0x39
	ldrb r0, [r0]
	cmp r0, #1
	bne _08090CB4
	ldr r0, _08090CB0  @ gRAMChapterData
	ldrb r0, [r0, #0xf]
	adds r5, r0, #1
	adds r0, #0x40
	cmp r5, r0
	bge _08090CF0
_08090C78:
	adds r0, r5, #0
	bl GetUnit
	adds r4, r0, #0
	cmp r4, #0
	beq _08090C9E
	ldr r0, [r4]
	cmp r0, #0
	beq _08090C9E
	adds r0, r4, #0
	bl IsUnitInCurrentRoster
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08090C9E
	adds r0, r4, #0
	adds r1, r6, #0
	bl sub_8090B48
_08090C9E:
	adds r5, #1
	ldr r0, _08090CB0  @ gRAMChapterData
	ldrb r0, [r0, #0xf]
	adds r0, #0x40
	cmp r5, r0
	blt _08090C78
	b _08090CF0
	.align 2, 0
_08090CAC: .4byte gUnknown_0200F158
_08090CB0: .4byte gRAMChapterData
_08090CB4:
	ldr r0, _08090CBC  @ gRAMChapterData
	ldrb r0, [r0, #0xf]
	adds r4, r0, #1
	b _08090CEA
	.align 2, 0
_08090CBC: .4byte gRAMChapterData
_08090CC0:
	adds r0, r4, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq _08090CE4
	ldr r0, [r2]
	cmp r0, #0
	beq _08090CE4
	ldr r0, [r2, #0xc]
	ldr r1, _08090CF8  @ 0x0001000C
	ands r0, r1
	cmp r0, #0
	bne _08090CE4
	adds r0, r2, #0
	adds r1, r6, #0
	bl sub_8090B48
_08090CE4:
	adds r4, #1
	ldr r0, _08090CFC  @ gRAMChapterData
	ldrb r0, [r0, #0xf]
_08090CEA:
	adds r0, #0x40
	cmp r4, r0
	blt _08090CC0
_08090CF0:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08090CF8: .4byte 0x0001000C
_08090CFC: .4byte gRAMChapterData

	THUMB_FUNC_END sub_8090C58

	THUMB_FUNC_START sub_8090D00
sub_8090D00: @ 0x08090D00
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r0, _08090D44  @ gUnknown_0200F158
	movs r1, #0
	strb r1, [r0]
	adds r0, r6, #0
	adds r0, #0x39
	ldrb r0, [r0]
	cmp r0, #1
	bne _08090D48
	movs r5, #1
_08090D16:
	adds r0, r5, #0
	bl GetUnit
	adds r4, r0, #0
	cmp r4, #0
	beq _08090D3C
	ldr r0, [r4]
	cmp r0, #0
	beq _08090D3C
	adds r0, r4, #0
	bl IsUnitInCurrentRoster
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08090D3C
	adds r0, r4, #0
	adds r1, r6, #0
	bl sub_8090B48
_08090D3C:
	adds r5, #1
	cmp r5, #0x3f
	ble _08090D16
	b _08090D74
	.align 2, 0
_08090D44: .4byte gUnknown_0200F158
_08090D48:
	movs r4, #1
_08090D4A:
	adds r0, r4, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq _08090D6E
	ldr r0, [r2]
	cmp r0, #0
	beq _08090D6E
	ldr r0, [r2, #0xc]
	ldr r1, _08090D7C  @ 0x0001000C
	ands r0, r1
	cmp r0, #0
	bne _08090D6E
	adds r0, r2, #0
	adds r1, r6, #0
	bl sub_8090B48
_08090D6E:
	adds r4, #1
	cmp r4, #0x3f
	ble _08090D4A
_08090D74:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08090D7C: .4byte 0x0001000C

	THUMB_FUNC_END sub_8090D00

	THUMB_FUNC_START sub_8090D80
sub_8090D80: @ 0x08090D80
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x18
	mov r8, r0
	ldr r2, _08090E60  @ gLCDControlBuffer
	ldrb r0, [r2, #1]
	movs r6, #1
	orrs r0, r6
	movs r1, #2
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2, #1]
	movs r0, #0
	bl SetInterrupt_LCDVCountMatch
	movs r0, #0
	bl SetupBackgrounds
	bl Font_InitForUIDefault
	bl sub_8003D20
	bl ResetIconGraphics
	bl SetupMapSpritesPalettes
	movs r4, #0
	str r4, [sp, #4]
	ldr r1, _08090E64  @ gUnknown_02022C08
	ldr r2, _08090E68  @ 0x01000008
	add r0, sp, #4
	bl CpuFastSet
	bl LoadObjUIGfx
	mov r0, r8
	bl NewGreenTextColorManager
	mov r0, r8
	adds r0, #0x3b
	strb r4, [r0]
	subs r0, #0xd
	movs r5, #6
	strb r5, [r0]
	mov r0, r8
	bl sub_8090D00
	mov r0, r8
	adds r0, #0x39
	ldrb r0, [r0]
	cmp r0, #1
	bne _08090E14
	mov r0, r8
	adds r0, #0x2a
	ldrb r0, [r0]
	mov r1, r8
	adds r1, #0x32
	str r1, [sp, #0x14]
	mov r2, r8
	adds r2, #0x29
	str r2, [sp, #8]
	movs r1, #0x2f
	add r1, r8
	mov sl, r1
	cmp r0, #1
	bne _08090E88
_08090E14:
	ldr r4, _08090E6C  @ gRAMChapterData
	ldrb r1, [r4, #0x1a]
	mov r3, r8
	adds r3, #0x34
	mov r2, r8
	adds r2, #0x32
	str r2, [sp, #0x14]
	cmp r1, #0
	beq _08090E38
	lsrs r0, r1, #7
	ands r0, r6
	adds r2, #1
	strb r0, [r2]
	strb r0, [r3]
	movs r0, #0x7f
	ands r1, r0
	ldr r0, [sp, #0x14]
	strb r1, [r0]
_08090E38:
	mov r0, r8
	adds r0, #0x29
	ldrb r1, [r0]
	str r0, [sp, #8]
	movs r2, #0x2f
	add r2, r8
	mov sl, r2
	cmp r1, #4
	beq _08090E7E
	ldrb r0, [r2]
	cmp r0, #0
	beq _08090E7E
	ldrb r0, [r4, #0x19]
	lsrs r1, r0, #4
	cmp r1, #0
	beq _08090E7E
	cmp r1, #6
	bls _08090E70
	strb r5, [r2]
	b _08090E74
	.align 2, 0
_08090E60: .4byte gLCDControlBuffer
_08090E64: .4byte gUnknown_02022C08
_08090E68: .4byte 0x01000008
_08090E6C: .4byte gRAMChapterData
_08090E70:
	mov r0, sl
	strb r1, [r0]
_08090E74:
	mov r1, sl
	ldrb r0, [r1]
	mov r1, r8
	adds r1, #0x36
	strb r0, [r1]
_08090E7E:
	ldr r2, [sp, #0x14]
	ldrb r0, [r2]
	ldrb r1, [r3]
	bl sub_8092BF0
_08090E88:
	ldr r0, _08090F70  @ gBG0TilemapBuffer
	movs r1, #0
	bl BG_Fill
	ldr r4, _08090F74  @ gBG1TilemapBuffer
	adds r0, r4, #0
	movs r1, #0
	bl BG_Fill
	ldr r0, _08090F78  @ gBG2TilemapBuffer
	movs r1, #0
	bl BG_Fill
	bl ResetIconGraphics_
	movs r0, #4
	bl LoadIconPalettes
	bl LoadUiFrameGraphics
	ldr r0, _08090F7C  @ gUnknown_08A1CD68
	ldr r1, _08090F80  @ 0x06014800
	bl CopyDataWithPossibleUncomp
	mov r1, sl
	ldrb r0, [r1]
	ldr r2, _08090F84  @ gUnknown_08A1D288
	cmp r0, #0
	beq _08090EC4
	ldr r2, _08090F88  @ gUnknown_08A1CDC4
_08090EC4:
	ldr r1, _08090F8C  @ 0x06015800
	adds r0, r2, #0
	bl CopyDataWithPossibleUncomp
	ldr r0, _08090F90  @ gUnknown_08A1B154
	movs r1, #0xc8
	lsls r1, r1, #2
	movs r2, #0x40
	bl CopyToPaletteBuffer
	bl sub_8097FDC
	ldr r1, _08090F94  @ gUnknown_08A1C8B4
	movs r2, #0x80
	lsls r2, r2, #5
	adds r0, r4, #0
	bl CallARM_FillTileRect
	movs r4, #0
	mov r2, r8
	adds r2, #0x2e
	str r2, [sp, #0x10]
	mov r0, r8
	adds r0, #0x2b
	str r0, [sp, #0xc]
	ldr r6, _08090F98  @ gUnknown_0200E098
	movs r1, #0x10
	adds r1, r1, r6
	mov r9, r1
	adds r5, r6, #0
	movs r7, #0
_08090F02:
	lsls r0, r4, #3
	ldr r1, _08090F9C  @ gUnknown_0200E060
	adds r0, r0, r1
	movs r1, #5
	bl Text_Init
	adds r0, r5, #0
	movs r1, #8
	bl Text_Allocate
	adds r0, r6, #0
	adds r0, #8
	adds r0, r7, r0
	movs r1, #7
	bl Text_Init
	mov r0, r9
	movs r1, #5
	bl Text_Init
	movs r2, #0x18
	add r9, r2
	adds r5, #0x18
	adds r7, #0x18
	adds r4, #1
	cmp r4, #6
	ble _08090F02
	ldr r0, _08090FA0  @ gUnknown_0200E140
	movs r1, #4
	bl Text_Init
	ldr r0, _08090FA4  @ gUnknown_0200E148
	movs r1, #0x14
	bl Text_Init
	ldr r0, _08090FA8  @ gUnknown_0200E150
	movs r1, #8
	bl Text_Init
	ldr r1, [sp, #0x14]
	ldrb r0, [r1]
	bl sub_8090238
	ldr r2, [sp, #8]
	ldrb r0, [r2]
	cmp r0, #4
	bne _08090FAC
	mov r0, r8
	movs r1, #0
	bl sub_8090418
	movs r0, #0
	ldr r1, [sp, #8]
	strb r0, [r1]
	b _08090FBE
	.align 2, 0
_08090F70: .4byte gBG0TilemapBuffer
_08090F74: .4byte gBG1TilemapBuffer
_08090F78: .4byte gBG2TilemapBuffer
_08090F7C: .4byte gUnknown_08A1CD68
_08090F80: .4byte 0x06014800
_08090F84: .4byte gUnknown_08A1D288
_08090F88: .4byte gUnknown_08A1CDC4
_08090F8C: .4byte 0x06015800
_08090F90: .4byte gUnknown_08A1B154
_08090F94: .4byte gUnknown_08A1C8B4
_08090F98: .4byte gUnknown_0200E098
_08090F9C: .4byte gUnknown_0200E060
_08090FA0: .4byte gUnknown_0200E140
_08090FA4: .4byte gUnknown_0200E148
_08090FA8: .4byte gUnknown_0200E150
_08090FAC:
	mov r0, r8
	adds r0, #0x39
	ldrb r0, [r0]
	cmp r0, #1
	bne _08090FBE
	mov r0, r8
	movs r1, #1
	bl sub_8090418
_08090FBE:
	movs r1, #0
	movs r0, #0
	mov r2, r8
	strh r0, [r2, #0x3c]
	ldr r0, [sp, #0xc]
	strb r1, [r0]
	ldr r4, _08091014  @ gUnknown_0200E140
	adds r0, r4, #0
	bl Text_Clear
	adds r0, r4, #0
	movs r1, #4
	bl Text_SetXCursor
	adds r0, r4, #0
	movs r1, #0
	bl Text_SetColorId
	ldr r0, _08091018  @ 0x000004E5
	bl GetStringFromIndex
	adds r1, r0, #0
	adds r0, r4, #0
	bl Text_AppendString
	ldr r1, _0809101C  @ gUnknown_02023DEE
	adds r0, r4, #0
	bl Text_Draw
	ldr r1, _08091020  @ gUnknown_0200F15C
	movs r2, #0xff
	adds r0, r1, #0
	adds r0, #0x4c
_08091000:
	str r2, [r0]
	subs r0, #4
	cmp r0, r1
	bge _08091000
	mov r1, r8
	ldrh r0, [r1, #0x3e]
	lsrs r4, r0, #4
	adds r0, r4, #6
	b _08091042
	.align 2, 0
_08091014: .4byte gUnknown_0200E140
_08091018: .4byte 0x000004E5
_0809101C: .4byte gUnknown_02023DEE
_08091020: .4byte gUnknown_0200F15C
_08091024:
	lsls r1, r4, #0x18
	lsrs r1, r1, #0x18
	mov r2, sl
	ldrb r3, [r2]
	movs r0, #1
	str r0, [sp]
	mov r0, r8
	ldr r2, _08091164  @ gBG0TilemapBuffer
	bl sub_80922F0
	adds r4, #1
	mov r1, r8
	ldrh r0, [r1, #0x3e]
	lsrs r0, r0, #4
	adds r0, #6
_08091042:
	cmp r4, r0
	bge _0809104E
	ldr r0, _08091168  @ gUnknown_0200F158
	ldrb r0, [r0]
	cmp r4, r0
	blt _08091024
_0809104E:
	ldr r2, [sp, #0x10]
	ldrb r0, [r2]
	mov r2, sl
	ldrb r1, [r2]
	movs r2, #1
	bl sub_8092298
	ldr r7, _0809116C  @ gLCDControlBuffer
	ldrb r0, [r7, #1]
	movs r1, #0x20
	orrs r0, r1
	movs r1, #0x41
	negs r1, r1
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r7, #1]
	adds r1, r7, #0
	adds r1, #0x2d
	movs r5, #0x10
	movs r0, #0x10
	strb r0, [r1]
	adds r1, #4
	movs r0, #0x3a
	strb r0, [r1]
	subs r1, #5
	movs r0, #0xe0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0x98
	strb r0, [r1]
	adds r1, #4
	ldrb r0, [r1]
	movs r6, #1
	orrs r0, r6
	movs r4, #2
	orrs r0, r4
	movs r3, #4
	orrs r0, r3
	movs r2, #8
	orrs r0, r2
	orrs r0, r5
	strb r0, [r1]
	movs r0, #0x36
	adds r0, r0, r7
	mov r9, r0
	ldrb r1, [r0]
	movs r0, #2
	negs r0, r0
	ands r0, r1
	orrs r0, r4
	orrs r0, r3
	orrs r0, r2
	orrs r0, r5
	mov r1, r9
	strb r0, [r1]
	movs r0, #0xf
	bl BG_EnableSyncByMask
	movs r0, #3
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	mov r0, r8
	ldrh r2, [r0, #0x3e]
	subs r2, #0x38
	movs r0, #0xff
	ands r2, r0
	movs r0, #0
	movs r1, #0
	bl BG_SetPosition
	ldrb r2, [r7, #0xc]
	movs r1, #4
	negs r1, r1
	adds r0, r1, #0
	ands r0, r2
	strb r0, [r7, #0xc]
	ldrb r2, [r7, #0x10]
	adds r0, r1, #0
	ands r0, r2
	orrs r0, r4
	strb r0, [r7, #0x10]
	ldrb r0, [r7, #0x14]
	ands r1, r0
	orrs r1, r6
	strb r1, [r7, #0x14]
	ldrb r0, [r7, #0x18]
	movs r1, #3
	orrs r0, r1
	strb r0, [r7, #0x18]
	ldr r0, _08091170  @ gUnknown_08A1C7D8
	ldr r1, _08091174  @ gUnknown_020239A8
	bl CopyDataWithPossibleUncomp
	ldr r0, _08091178  @ gUnknown_08A1A084
	movs r1, #0xf0
	lsls r1, r1, #1
	movs r2, #0x20
	bl CopyToPaletteBuffer
	ldr r0, _0809117C  @ gUnknown_08A17B08
	mov r1, r8
	bl Proc_Start
	mov r1, r8
	str r0, [r1, #0x40]
	movs r0, #0
	movs r1, #0
	movs r2, #0xa
	bl sub_8086BB8
	mov r2, r8
	str r0, [r2, #0x44]
	movs r1, #1
	negs r1, r1
	movs r0, #0
	bl LoadDialogueBoxGfx
	add sp, #0x18
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08091164: .4byte gBG0TilemapBuffer
_08091168: .4byte gUnknown_0200F158
_0809116C: .4byte gLCDControlBuffer
_08091170: .4byte gUnknown_08A1C7D8
_08091174: .4byte gUnknown_020239A8
_08091178: .4byte gUnknown_08A1A084
_0809117C: .4byte gUnknown_08A17B08

	THUMB_FUNC_END sub_8090D80

	THUMB_FUNC_START sub_8091180
sub_8091180: @ 0x08091180
	push {lr}
	adds r3, r0, #0
	adds r0, #0x29
	movs r1, #0
	strb r1, [r0]
	adds r0, #8
	movs r2, #1
	strb r2, [r0]
	subs r0, #5
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #3
	strb r1, [r0]
	adds r0, #9
	ldrb r0, [r0]
	cmp r0, #3
	bne _080911AC
	adds r0, r3, #0
	adds r0, #0x2f
	strb r1, [r0]
	b _080911B2
_080911AC:
	adds r0, r3, #0
	adds r0, #0x2f
	strb r2, [r0]
_080911B2:
	ldrb r0, [r0]
	adds r2, r3, #0
	adds r2, #0x36
	movs r1, #0
	strb r0, [r2]
	movs r2, #0
	strh r1, [r3, #0x3e]
	adds r1, r3, #0
	adds r1, #0x32
	movs r0, #1
	strb r0, [r1]
	subs r1, #8
	strb r2, [r1]
	adds r1, #9
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x34
	strb r2, [r0]
	adds r0, #1
	strb r2, [r0]
	adds r0, r3, #0
	bl sub_8090D80
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8091180

	THUMB_FUNC_START sub_80911E4
sub_80911E4: @ 0x080911E4
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r2, r0, #0
	adds r5, r1, #0
	adds r0, r5, #0
	adds r0, #0x3a
	adds r6, r5, #0
	adds r6, #0x3b
	ldrb r0, [r0]
	ldrb r1, [r6]
	cmp r0, r1
	bls _08091268
	ldr r0, [r2, #0xc]
	movs r1, #0xb
	negs r1, r1
	ands r0, r1
	str r0, [r2, #0xc]
	ldr r0, [r2]
	ldrb r0, [r0, #4]
	bl sub_80952EC
	ldrh r0, [r5, #0x3e]
	lsrs r4, r0, #4
	adds r0, r4, #6
	b _08091234
_08091216:
	lsls r1, r4, #0x18
	lsrs r1, r1, #0x18
	adds r0, r5, #0
	adds r0, #0x2f
	ldrb r3, [r0]
	movs r0, #1
	str r0, [sp]
	adds r0, r5, #0
	ldr r2, _0809125C  @ gBG0TilemapBuffer
	bl sub_80922F0
	adds r4, #1
	ldrh r0, [r5, #0x3e]
	lsrs r0, r0, #4
	adds r0, #6
_08091234:
	cmp r4, r0
	bge _08091240
	ldr r0, _08091260  @ gUnknown_0200F158
	ldrb r0, [r0]
	cmp r4, r0
	blt _08091216
_08091240:
	ldrb r0, [r6]
	adds r0, #1
	strb r0, [r6]
	ldr r0, _08091264  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809127A
	movs r0, #0x6a
	bl m4aSongNumStart
	b _0809127A
	.align 2, 0
_0809125C: .4byte gBG0TilemapBuffer
_08091260: .4byte gUnknown_0200F158
_08091264: .4byte gRAMChapterData
_08091268:
	ldr r0, _08091284  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809127A
	movs r0, #0x6c
	bl m4aSongNumStart
_0809127A:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08091284: .4byte gRAMChapterData

	THUMB_FUNC_END sub_80911E4

	THUMB_FUNC_START sub_8091288
sub_8091288: @ 0x08091288
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, [r4]
	ldrb r0, [r0, #4]
	bl IsCharacterForceDeployed
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0809130C
	ldr r0, [r4, #0xc]
	movs r1, #0xa
	orrs r0, r1
	str r0, [r4, #0xc]
	ldr r0, [r4]
	ldrb r0, [r0, #4]
	bl sub_8095314
	ldrh r0, [r5, #0x3e]
	lsrs r4, r0, #4
	adds r0, r4, #6
	adds r6, r5, #0
	adds r6, #0x3b
	b _080912D8
_080912BA:
	lsls r1, r4, #0x18
	lsrs r1, r1, #0x18
	adds r0, r5, #0
	adds r0, #0x2f
	ldrb r3, [r0]
	movs r0, #1
	str r0, [sp]
	adds r0, r5, #0
	ldr r2, _08091300  @ gBG0TilemapBuffer
	bl sub_80922F0
	adds r4, #1
	ldrh r0, [r5, #0x3e]
	lsrs r0, r0, #4
	adds r0, #6
_080912D8:
	cmp r4, r0
	bge _080912E4
	ldr r0, _08091304  @ gUnknown_0200F158
	ldrb r0, [r0]
	cmp r4, r0
	blt _080912BA
_080912E4:
	ldrb r0, [r6]
	subs r0, #1
	strb r0, [r6]
	ldr r0, _08091308  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809131E
	movs r0, #0x6b
	bl m4aSongNumStart
	b _0809131E
	.align 2, 0
_08091300: .4byte gBG0TilemapBuffer
_08091304: .4byte gUnknown_0200F158
_08091308: .4byte gRAMChapterData
_0809130C:
	ldr r0, _08091328  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809131E
	movs r0, #0x6c
	bl m4aSongNumStart
_0809131E:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08091328: .4byte gRAMChapterData

	THUMB_FUNC_END sub_8091288

	THUMB_FUNC_START sub_809132C
sub_809132C: @ 0x0809132C
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r0, #0x30
	ldrb r0, [r0]
	ldr r1, _08091358  @ gUnknown_0200D6E0
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r5, [r0]
	ldr r1, [r5, #0xc]
	movs r0, #0x80
	lsls r0, r0, #0x12
	ands r0, r1
	cmp r0, #0
	beq _08091360
	adds r0, r4, #0
	adds r0, #0x2c
	ldrb r1, [r0]
	lsls r1, r1, #4
	adds r1, #0x38
	ldr r2, _0809135C  @ 0x00000C52
	b _080913B2
	.align 2, 0
_08091358: .4byte gUnknown_0200D6E0
_0809135C: .4byte 0x00000C52
_08091360:
	movs r0, #8
	ands r1, r0
	cmp r1, #0
	beq _080913CA
	bl CheckSomethingSomewhere
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08091390
	adds r0, r5, #0
	bl sub_8097E74
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08091390
	adds r0, r4, #0
	adds r0, #0x2c
	ldrb r1, [r0]
	lsls r1, r1, #4
	adds r1, #0x38
	ldr r2, _0809138C  @ 0x0000088A
	b _080913B2
	.align 2, 0
_0809138C: .4byte 0x0000088A
_08091390:
	bl CheckSomethingSomewhere
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080913C0
	adds r0, r5, #0
	bl sub_8097E38
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080913C0
	adds r0, r4, #0
	adds r0, #0x2c
	ldrb r1, [r0]
	lsls r1, r1, #4
	adds r1, #0x38
	ldr r2, _080913BC  @ 0x00000889
_080913B2:
	movs r0, #0
	adds r3, r4, #0
	bl sub_8097DA8
	b _080913D2
	.align 2, 0
_080913BC: .4byte 0x00000889
_080913C0:
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_80911E4
	b _080913D2
_080913CA:
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_8091288
_080913D2:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_809132C

	THUMB_FUNC_START sub_80913D8
sub_80913D8: @ 0x080913D8
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r2, r1, #0
	ldr r0, [r5]
	ldr r1, [r5, #4]
	ldr r0, [r0, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	movs r1, #0x80
	lsls r1, r1, #2
	ands r0, r1
	cmp r0, #0
	beq _0809140C
	ldr r0, _08091408  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809143C
	movs r0, #0x6c
	bl m4aSongNumStart
	b _0809143C
	.align 2, 0
_08091408: .4byte gRAMChapterData
_0809140C:
	ldr r4, [r5, #0xc]
	movs r0, #0xc0
	lsls r0, r0, #8
	ands r0, r4
	lsrs r1, r0, #0xe
	adds r0, r1, r2
	adds r0, #3
	movs r1, #3
	bl __modsi3
	lsls r1, r0, #0xe
	ldr r0, _08091444  @ 0xFFFF3FFF
	ands r4, r0
	orrs r4, r1
	str r4, [r5, #0xc]
	ldr r0, _08091448  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809143C
	movs r0, #0x6a
	bl m4aSongNumStart
_0809143C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08091444: .4byte 0xFFFF3FFF
_08091448: .4byte gRAMChapterData

	THUMB_FUNC_END sub_80913D8

	THUMB_FUNC_START sub_809144C
sub_809144C: @ 0x0809144C
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r5, r0, #0
	ldr r2, _08091474  @ gKeyStatusPtr
	ldr r0, [r2]
	ldrh r1, [r0, #4]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	mov ip, r2
	cmp r0, #0
	beq _08091478
	adds r1, r5, #0
	adds r1, #0x31
	movs r0, #2
	b _0809147E
	.align 2, 0
_08091474: .4byte gKeyStatusPtr
_08091478:
	adds r1, r5, #0
	adds r1, #0x31
	movs r0, #1
_0809147E:
	strb r0, [r1]
	mov r8, r1
	mov r0, ip
	ldr r3, [r0]
	ldrh r4, [r3, #8]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r4
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	cmp r7, #0
	beq _080914A0
	adds r0, r5, #0
	movs r1, #3
	bl Proc_Goto
	b _080917CA
_080914A0:
	movs r1, #1
	mov r9, r1
	mov r6, r9
	ands r6, r4
	cmp r6, #0
	beq _0809150C
	adds r0, r5, #0
	adds r0, #0x39
	ldrb r0, [r0]
	cmp r0, #1
	beq _080914C8
	cmp r0, #1
	bgt _080914C0
	cmp r0, #0
	beq _080914D0
	b _080917CA
_080914C0:
	cmp r0, #3
	bne _080914C6
	b _080915BE
_080914C6:
	b _080917CA
_080914C8:
	adds r0, r5, #0
	bl sub_809132C
	b _080917CA
_080914D0:
	ldr r1, _08091504  @ gUnknown_0200D6E0
	adds r0, r5, #0
	adds r0, #0x30
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r0, [r0]
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl SetLastStatScreenUid
	ldr r0, _08091508  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080914FC
	movs r0, #0x6a
	bl m4aSongNumStart
_080914FC:
	adds r0, r5, #0
	bl Proc_Break
	b _080917CA
	.align 2, 0
_08091504: .4byte gUnknown_0200D6E0
_08091508: .4byte gRAMChapterData
_0809150C:
	ldrh r1, [r3, #6]
	movs r2, #0x20
	adds r0, r2, #0
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	cmp r7, #0
	beq _080915A0
	adds r0, r5, #0
	adds r0, #0x39
	ldrb r0, [r0]
	cmp r0, #3
	bne _08091560
	adds r0, r2, #0
	ands r0, r4
	cmp r0, #0
	bne _08091530
	b _080917CA
_08091530:
	ldr r1, _08091558  @ gUnknown_0200D6E0
	adds r4, r5, #0
	adds r4, #0x30
	ldrb r0, [r4]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r0, [r0]
	movs r1, #1
	negs r1, r1
	bl sub_80913D8
	ldrb r1, [r4]
	ldr r2, _0809155C  @ gBG0TilemapBuffer
	adds r0, r5, #0
	adds r0, #0x2f
	ldrb r3, [r0]
	str r6, [sp]
	b _080915E0
	.align 2, 0
_08091558: .4byte gUnknown_0200D6E0
_0809155C: .4byte gBG0TilemapBuffer
_08091560:
	adds r0, r5, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	cmp r0, #1
	bhi _0809156C
	b _080917CA
_0809156C:
	adds r1, r5, #0
	adds r1, #0x36
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	adds r0, r5, #0
	movs r1, #2
	bl Proc_Goto
	adds r0, r5, #0
	adds r0, #0x2d
	strb r6, [r0]
	ldr r0, _0809159C  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	bge _08091592
	b _080917CA
_08091592:
	movs r0, #0x6f
	bl m4aSongNumStart
	b _080917CA
	.align 2, 0
_0809159C: .4byte gRAMChapterData
_080915A0:
	movs r6, #0x10
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	beq _08091634
	adds r0, r5, #0
	adds r0, #0x39
	ldrb r0, [r0]
	cmp r0, #3
	bne _080915F0
	adds r0, r6, #0
	ands r0, r4
	cmp r0, #0
	bne _080915BE
	b _080917CA
_080915BE:
	ldr r1, _080915E8  @ gUnknown_0200D6E0
	adds r4, r5, #0
	adds r4, #0x30
	ldrb r0, [r4]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r0, [r0]
	movs r1, #1
	bl sub_80913D8
	ldrb r1, [r4]
	ldr r2, _080915EC  @ gBG0TilemapBuffer
	adds r0, r5, #0
	adds r0, #0x2f
	ldrb r3, [r0]
	str r7, [sp]
_080915E0:
	adds r0, r5, #0
	bl sub_80922F0
	b _080917CA
	.align 2, 0
_080915E8: .4byte gUnknown_0200D6E0
_080915EC: .4byte gBG0TilemapBuffer
_080915F0:
	adds r0, r5, #0
	adds r0, #0x2f
	adds r1, r5, #0
	adds r1, #0x2e
	ldrb r0, [r0]
	ldrb r1, [r1]
	cmp r0, r1
	bcc _08091602
	b _080917CA
_08091602:
	adds r1, r5, #0
	adds r1, #0x36
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	adds r0, r5, #0
	adds r0, #0x2d
	strb r7, [r0]
	ldr r0, _08091630  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08091624
	movs r0, #0x6f
	bl m4aSongNumStart
_08091624:
	adds r0, r5, #0
	movs r1, #2
	bl Proc_Goto
	b _080917CA
	.align 2, 0
_08091630: .4byte gRAMChapterData
_08091634:
	movs r7, #0x40
	adds r0, r7, #0
	ands r0, r1
	cmp r0, #0
	bne _08091654
	ldrh r1, [r3, #4]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08091716
	ldrh r1, [r3, #0x10]
	adds r0, r7, #0
	ands r0, r1
	cmp r0, #0
	beq _08091716
_08091654:
	adds r6, r5, #0
	adds r6, #0x30
	ldrb r0, [r6]
	cmp r0, #0
	bne _08091688
	adds r0, r7, #0
	ands r0, r4
	cmp r0, #0
	bne _08091668
	b _080917CA
_08091668:
	ldr r0, _08091684  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809167A
	movs r0, #0x66
	bl m4aSongNumStart
_0809167A:
	adds r1, r5, #0
	adds r1, #0x29
	movs r0, #3
	strb r0, [r1]
	b _080917CA
	.align 2, 0
_08091684: .4byte gRAMChapterData
_08091688:
	subs r0, #1
	strb r0, [r6]
	ldr r0, _08091708  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809169E
	movs r0, #0x66
	bl m4aSongNumStart
_0809169E:
	adds r0, r5, #0
	adds r0, #0x2c
	ldrb r1, [r0]
	adds r4, r0, #0
	cmp r1, #1
	bhi _08091710
	ldrh r0, [r5, #0x3e]
	lsrs r0, r0, #4
	cmp r0, #0
	beq _08091710
	cmp r1, #0
	bne _080916C0
	ldrb r0, [r6]
	adds r0, #1
	strb r0, [r6]
	movs r0, #1
	strb r0, [r4]
_080916C0:
	ldrh r1, [r5, #0x3e]
	lsrs r1, r1, #4
	subs r1, #1
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldr r2, _0809170C  @ gBG0TilemapBuffer
	adds r0, r5, #0
	adds r0, #0x2f
	ldrb r3, [r0]
	mov r0, r9
	str r0, [sp]
	adds r0, r5, #0
	bl sub_80922F0
	adds r1, r5, #0
	adds r1, #0x29
	movs r0, #2
	strb r0, [r1]
	mov r1, r8
	ldrb r0, [r1]
	lsls r0, r0, #2
	ldrh r2, [r5, #0x3e]
	subs r2, r2, r0
	strh r2, [r5, #0x3e]
	subs r2, #0x38
	movs r0, #0xff
	ands r2, r0
	movs r0, #0
	movs r1, #0
	bl BG_SetPosition
	ldrb r0, [r4]
	cmp r0, #0
	bne _080917CA
	b _080917C6
	.align 2, 0
_08091708: .4byte gRAMChapterData
_0809170C: .4byte gBG0TilemapBuffer
_08091710:
	ldrb r0, [r4]
	subs r0, #1
	b _080917C8
_08091716:
	mov r0, ip
	ldr r2, [r0]
	ldrh r1, [r2, #6]
	movs r3, #0x80
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	bne _0809173C
	ldrh r1, [r2, #4]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080917CA
	ldrh r1, [r2, #0x10]
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	beq _080917CA
_0809173C:
	adds r6, r5, #0
	adds r6, #0x30
	ldrb r1, [r6]
	ldr r7, _080917B8  @ gUnknown_0200F158
	ldrb r0, [r7]
	subs r0, #1
	cmp r1, r0
	bge _080917CA
	adds r0, r1, #1
	strb r0, [r6]
	ldr r0, _080917BC  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08091762
	movs r0, #0x66
	bl m4aSongNumStart
_08091762:
	adds r0, r5, #0
	adds r0, #0x2c
	ldrb r1, [r0]
	adds r4, r0, #0
	cmp r1, #4
	bne _080917C4
	ldrb r1, [r6]
	ldrb r0, [r7]
	subs r0, #1
	cmp r1, r0
	beq _080917C4
	ldrh r1, [r5, #0x3e]
	lsrs r1, r1, #4
	adds r1, #6
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldr r2, _080917C0  @ gBG0TilemapBuffer
	adds r0, r5, #0
	adds r0, #0x2f
	ldrb r3, [r0]
	movs r4, #1
	str r4, [sp]
	adds r0, r5, #0
	bl sub_80922F0
	adds r0, r5, #0
	adds r0, #0x29
	strb r4, [r0]
	mov r1, r8
	ldrb r2, [r1]
	lsls r2, r2, #2
	ldrh r0, [r5, #0x3e]
	adds r2, r2, r0
	strh r2, [r5, #0x3e]
	subs r2, #0x38
	movs r0, #0xff
	ands r2, r0
	movs r0, #0
	movs r1, #0
	bl BG_SetPosition
	b _080917CA
	.align 2, 0
_080917B8: .4byte gUnknown_0200F158
_080917BC: .4byte gRAMChapterData
_080917C0: .4byte gBG0TilemapBuffer
_080917C4:
	ldrb r0, [r4]
_080917C6:
	adds r0, #1
_080917C8:
	strb r0, [r4]
_080917CA:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_809144C

	THUMB_FUNC_START sub_80917D8
sub_80917D8: @ 0x080917D8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	adds r7, r0, #0
	adds r4, r7, #0
	adds r4, #0x2b
	ldrb r0, [r4]
	ldr r2, _0809180C  @ gKeyStatusPtr
	cmp r0, #0
	beq _08091810
	ldr r0, [r2]
	ldrh r1, [r0, #8]
	movs r0, #0x81
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08091810
	bl CloseHelpBox
	movs r0, #0
	strb r0, [r4]
	b _08091AA0
	.align 2, 0
_0809180C: .4byte gKeyStatusPtr
_08091810:
	ldr r0, [r2]
	ldrh r1, [r0, #8]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080918F8
	adds r0, r7, #0
	adds r0, #0x2b
	ldrb r0, [r0]
	cmp r0, #0
	bne _080918F8
	adds r1, r7, #0
	adds r1, #0x32
	ldrb r0, [r1]
	str r0, [sp, #4]
	adds r2, r7, #0
	adds r2, #0x2a
	movs r0, #1
	strb r0, [r2]
	ldr r0, _08091898  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	mov r8, r1
	cmp r0, #0
	blt _0809184A
	movs r0, #0x6a
	bl m4aSongNumStart
_0809184A:
	ldr r2, _0809189C  @ gUnknown_08A17C48
	adds r5, r7, #0
	adds r5, #0x2d
	adds r6, r7, #0
	adds r6, #0x2f
	ldrb r1, [r6]
	lsls r0, r1, #3
	adds r0, r0, r1
	ldrb r1, [r5]
	adds r0, r0, r1
	lsls r0, r0, #4
	adds r0, r0, r2
	ldrb r0, [r0]
	mov r1, r8
	strb r0, [r1]
	adds r4, r7, #0
	adds r4, #0x33
	ldrb r0, [r4]
	adds r0, #1
	movs r1, #1
	ands r0, r1
	strb r0, [r4]
	mov r1, r8
	ldrb r0, [r1]
	ldrb r1, [r4]
	bl sub_8092BF0
	lsls r0, r0, #0x18
	mov r9, r4
	movs r1, #0x34
	adds r1, r1, r7
	mov sl, r1
	adds r1, r7, #0
	adds r1, #0x35
	str r1, [sp, #8]
	cmp r0, #0
	beq _080918CC
	movs r4, #0
	b _080918B8
	.align 2, 0
_08091898: .4byte gRAMChapterData
_0809189C: .4byte gUnknown_08A17C48
_080918A0:
	lsls r1, r4, #0x18
	lsrs r1, r1, #0x18
	ldrb r3, [r6]
	movs r0, #1
	str r0, [sp]
	adds r0, r7, #0
	ldr r2, _080918F0  @ gBG0TilemapBuffer
	bl sub_80922F0
	adds r4, #1
	cmp r4, #5
	bgt _080918C0
_080918B8:
	ldr r0, _080918F4  @ gUnknown_0200F158
	ldrb r0, [r0]
	cmp r4, r0
	blt _080918A0
_080918C0:
	ldrh r0, [r7, #0x3e]
	bl sub_8090358
	movs r0, #1
	bl BG_EnableSyncByMask
_080918CC:
	mov r1, r9
	ldrb r0, [r1]
	mov r1, sl
	strb r0, [r1]
	ldrb r0, [r5]
	ldr r1, [sp, #8]
	strb r0, [r1]
	mov r1, r8
	ldrb r0, [r1]
	ldr r1, [sp, #4]
	cmp r0, r1
	bne _080918E6
	b _08091AA0
_080918E6:
	mov r1, r8
	ldrb r0, [r1]
	bl sub_8090238
	b _08091AA0
	.align 2, 0
_080918F0: .4byte gBG0TilemapBuffer
_080918F4: .4byte gUnknown_0200F158
_080918F8:
	ldr r0, [r2]
	ldrh r1, [r0, #6]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08091934
	adds r0, r7, #0
	adds r0, #0x2b
	ldrb r4, [r0]
	cmp r4, #0
	bne _08091934
	ldr r0, _08091930  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08091920
	movs r0, #0x66
	bl m4aSongNumStart
_08091920:
	adds r1, r7, #0
	adds r1, #0x33
	movs r0, #1
	strb r0, [r1]
	adds r0, r7, #0
	adds r0, #0x29
	strb r4, [r0]
	b _08091AA0
	.align 2, 0
_08091930: .4byte gRAMChapterData
_08091934:
	ldr r2, [r2]
	ldrh r1, [r2, #6]
	movs r0, #0x20
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0
	beq _080919CA
	adds r1, r7, #0
	adds r1, #0x33
	movs r0, #1
	strb r0, [r1]
	subs r1, #6
	ldrb r0, [r1]
	adds r5, r1, #0
	cmp r0, #0
	bne _080919C4
	adds r0, r7, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	cmp r0, #1
	bhi _08091962
	b _08091AA0
_08091962:
	adds r0, r7, #0
	adds r0, #0x39
	ldrb r0, [r0]
	cmp r0, #3
	bne _0809196E
	b _08091AA0
_0809196E:
	ldr r0, _080919BC  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08091980
	movs r0, #0x6f
	bl m4aSongNumStart
_08091980:
	adds r1, r7, #0
	adds r1, #0x36
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	movs r4, #8
	ldr r2, _080919C0  @ gUnknown_08A17C48
	ldrb r1, [r1]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r1, r0, #4
	adds r0, r1, #0
	adds r0, #0x80
	adds r0, r0, r2
	ldrb r0, [r0, #8]
	cmp r0, #0
	bne _080919B6
	adds r0, r1, r2
	adds r1, r0, #0
	adds r1, #0x80
_080919A8:
	subs r1, #0x10
	subs r4, #1
	cmp r4, #0
	ble _080919B6
	ldrb r0, [r1, #8]
	cmp r0, #0
	beq _080919A8
_080919B6:
	strb r4, [r5]
	b _08091A32
	.align 2, 0
_080919BC: .4byte gRAMChapterData
_080919C0: .4byte gUnknown_08A17C48
_080919C4:
	subs r0, #1
	strb r0, [r1]
	b _08091A46
_080919CA:
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _08091A60
	adds r1, r7, #0
	adds r1, #0x33
	movs r0, #1
	strb r0, [r1]
	adds r3, r7, #0
	adds r3, #0x2d
	ldrb r0, [r3]
	adds r6, r7, #0
	adds r6, #0x2f
	cmp r0, #8
	beq _080919FE
	ldr r2, _08091A3C  @ gUnknown_08A17C48
	adds r4, r0, #1
	ldrb r1, [r6]
	lsls r0, r1, #3
	adds r0, r0, r1
	adds r0, r0, r4
	lsls r0, r0, #4
	adds r0, r0, r2
	ldrb r0, [r0, #8]
	cmp r0, #0
	bne _08091A44
_080919FE:
	adds r1, r7, #0
	adds r1, #0x2e
	ldrb r0, [r6]
	ldrb r1, [r1]
	cmp r0, r1
	bcs _08091AA0
	adds r0, r7, #0
	adds r0, #0x39
	ldrb r0, [r0]
	cmp r0, #3
	beq _08091AA0
	strb r5, [r3]
	ldr r0, _08091A40  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08091A28
	movs r0, #0x6f
	bl m4aSongNumStart
_08091A28:
	adds r1, r7, #0
	adds r1, #0x36
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
_08091A32:
	adds r0, r7, #0
	movs r1, #2
	bl Proc_Goto
	b _08091AA0
	.align 2, 0
_08091A3C: .4byte gUnknown_08A17C48
_08091A40: .4byte gRAMChapterData
_08091A44:
	strb r4, [r3]
_08091A46:
	ldr r0, _08091A5C  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08091AA0
	movs r0, #0x67
	bl m4aSongNumStart
	b _08091AA0
	.align 2, 0
_08091A5C: .4byte gRAMChapterData
_08091A60:
	ldrh r1, [r2, #8]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08091AA0
	adds r1, r7, #0
	adds r1, #0x2b
	ldrb r0, [r1]
	cmp r0, #0
	bne _08091AA0
	movs r0, #1
	strb r0, [r1]
	ldr r2, _08091AB0  @ gUnknown_08A17C48
	adds r3, r7, #0
	adds r3, #0x2d
	adds r0, r7, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	lsls r1, r0, #3
	adds r1, r1, r0
	ldrb r3, [r3]
	adds r1, r1, r3
	lsls r1, r1, #4
	adds r0, r1, r2
	ldrb r0, [r0, #8]
	adds r2, #0xc
	adds r1, r1, r2
	ldr r2, [r1]
	movs r1, #0x28
	bl StartHelpBox
_08091AA0:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08091AB0: .4byte gUnknown_08A17C48

	THUMB_FUNC_END sub_80917D8

	THUMB_FUNC_START sub_8091AB4
sub_8091AB4: @ 0x08091AB4
	push {r4, lr}
	sub sp, #4
	movs r0, #1
	movs r1, #0xe
	movs r2, #3
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	movs r4, #0
	str r4, [sp]
	movs r0, #0
	movs r1, #1
	movs r2, #0
	movs r3, #0
	bl sub_8001ED0
	str r4, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #1
	bl sub_8001F0C
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8091AB4

	THUMB_FUNC_START sub_8091AEC
sub_8091AEC: @ 0x08091AEC
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r0, #0x2d
	ldrb r6, [r0]
	ldr r0, _08091B2C  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08091B34
	adds r0, r4, #0
	adds r0, #0x2b
	ldrb r0, [r0]
	cmp r0, #0
	bne _08091B34
	ldr r0, _08091B30  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08091B1E
	movs r0, #0x6b
	bl m4aSongNumStart
_08091B1E:
	movs r0, #0
	bl SetLastStatScreenUid
	adds r0, r4, #0
	bl Proc_Break
	b _08091BF6
	.align 2, 0
_08091B2C: .4byte gKeyStatusPtr
_08091B30: .4byte gRAMChapterData
_08091B34:
	adds r5, r4, #0
	adds r5, #0x29
	ldrb r0, [r5]
	cmp r0, #1
	beq _08091B62
	cmp r0, #1
	bgt _08091B48
	cmp r0, #0
	beq _08091B52
	b _08091BC4
_08091B48:
	cmp r0, #2
	beq _08091B94
	cmp r0, #3
	beq _08091B5A
	b _08091BC4
_08091B52:
	adds r0, r4, #0
	bl sub_809144C
	b _08091BC4
_08091B5A:
	adds r0, r4, #0
	bl sub_80917D8
	b _08091BC4
_08091B62:
	adds r0, r4, #0
	adds r0, #0x31
	ldrb r2, [r0]
	lsls r2, r2, #2
	ldrh r0, [r4, #0x3e]
	adds r2, r2, r0
	strh r2, [r4, #0x3e]
	subs r2, #0x38
	movs r0, #0xff
	ands r2, r0
	movs r0, #0
	movs r1, #0
	bl BG_SetPosition
	ldrh r0, [r4, #0x3e]
	movs r1, #0xf
	ands r0, r1
	cmp r0, #0
	bne _08091BC4
	movs r0, #0
	strb r0, [r5]
	ldrh r0, [r4, #0x3e]
	bl sub_8090358
	b _08091BC4
_08091B94:
	adds r0, r4, #0
	adds r0, #0x31
	ldrb r0, [r0]
	lsls r0, r0, #2
	ldrh r2, [r4, #0x3e]
	subs r2, r2, r0
	strh r2, [r4, #0x3e]
	subs r2, #0x38
	movs r0, #0xff
	ands r2, r0
	movs r0, #0
	movs r1, #0
	bl BG_SetPosition
	ldrh r0, [r4, #0x3e]
	movs r1, #0xf
	ands r0, r1
	cmp r0, #0
	bne _08091BC4
	movs r0, #0
	strb r0, [r5]
	ldrh r0, [r4, #0x3e]
	bl sub_8090358
_08091BC4:
	adds r0, r4, #0
	adds r0, #0x2b
	ldrb r0, [r0]
	cmp r0, #0
	beq _08091BF6
	adds r0, r4, #0
	adds r0, #0x2d
	ldrb r3, [r0]
	cmp r6, r3
	beq _08091BF6
	ldr r2, _08091BFC  @ gUnknown_08A17C48
	adds r0, #9
	ldrb r0, [r0]
	lsls r1, r0, #3
	adds r1, r1, r0
	adds r1, r1, r3
	lsls r1, r1, #4
	adds r0, r1, r2
	ldrb r0, [r0, #8]
	adds r2, #0xc
	adds r1, r1, r2
	ldr r2, [r1]
	movs r1, #0x28
	bl StartHelpBox
_08091BF6:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08091BFC: .4byte gUnknown_08A17C48

	THUMB_FUNC_END sub_8091AEC

	THUMB_FUNC_START sub_8091C00
sub_8091C00: @ 0x08091C00
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x39
	ldrb r0, [r0]
	cmp r0, #1
	bne _08091C28
	ldr r1, _08091CA8  @ gUnknown_0200D6E0
	adds r0, r4, #0
	adds r0, #0x30
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r0, [r0]
	ldr r0, [r0]
	ldrb r0, [r0, #4]
	bl sub_80953C0
	bl sub_809014C
_08091C28:
	ldr r3, _08091CAC  @ gRAMChapterData
	adds r0, r4, #0
	adds r0, #0x34
	ldrb r0, [r0]
	adds r1, r4, #0
	adds r1, #0x32
	lsls r0, r0, #7
	ldrb r1, [r1]
	adds r0, r0, r1
	strb r0, [r3, #0x1a]
	adds r0, r4, #0
	adds r0, #0x2f
	ldrb r2, [r0]
	cmp r2, #0
	beq _08091C52
	lsls r2, r2, #4
	ldrb r1, [r3, #0x19]
	movs r0, #0xf
	ands r0, r1
	orrs r0, r2
	strb r0, [r3, #0x19]
_08091C52:
	ldr r0, [r4, #0x40]
	bl Proc_End
	ldr r0, [r4, #0x44]
	cmp r0, #0
	beq _08091C62
	bl Proc_End
_08091C62:
	bl EndGreenTextColorManager
	ldr r0, _08091CB0  @ gBG0TilemapBuffer
	movs r1, #0
	bl BG_Fill
	ldr r0, _08091CB4  @ gBG1TilemapBuffer
	movs r1, #0
	bl BG_Fill
	ldr r0, _08091CB8  @ gBG2TilemapBuffer
	movs r1, #0
	bl BG_Fill
	movs r0, #0xf
	bl BG_EnableSyncByMask
	ldr r2, _08091CBC  @ gLCDControlBuffer
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
	bl sub_8003D20
	bl ResetIconGraphics
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08091CA8: .4byte gUnknown_0200D6E0
_08091CAC: .4byte gRAMChapterData
_08091CB0: .4byte gBG0TilemapBuffer
_08091CB4: .4byte gBG1TilemapBuffer
_08091CB8: .4byte gBG2TilemapBuffer
_08091CBC: .4byte gLCDControlBuffer

	THUMB_FUNC_END sub_8091C00

	THUMB_FUNC_START sub_8091CC0
sub_8091CC0: @ 0x08091CC0
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r0, _08091CE4  @ gUnknown_0200D7E0
	movs r1, #0x1f
	movs r2, #0x1f
	movs r3, #0
	bl TileMap_FillRect
	ldrh r0, [r5, #0x3e]
	lsrs r4, r0, #4
	adds r0, r4, #6
	cmp r4, r0
	bge _08091D12
	ldr r0, _08091CE8  @ gUnknown_0200F158
	adds r6, r5, #0
	adds r6, #0x2f
	b _08091D0C
	.align 2, 0
_08091CE4: .4byte gUnknown_0200D7E0
_08091CE8: .4byte gUnknown_0200F158
_08091CEC:
	lsls r1, r4, #0x18
	lsrs r1, r1, #0x18
	ldrb r3, [r6]
	movs r0, #0
	str r0, [sp]
	adds r0, r5, #0
	ldr r2, _08091D48  @ gUnknown_0200D7E0
	bl sub_80922F0
	adds r4, #1
	ldrh r0, [r5, #0x3e]
	lsrs r0, r0, #4
	adds r0, #6
	cmp r4, r0
	bge _08091D12
	ldr r0, _08091D4C  @ gUnknown_0200F158
_08091D0C:
	ldrb r0, [r0]
	cmp r4, r0
	blt _08091CEC
_08091D12:
	ldr r4, _08091D50  @ gUnknown_0200DFE0
	adds r0, r4, #0
	movs r1, #0x1f
	movs r2, #1
	movs r3, #0
	bl TileMap_FillRect
	adds r6, r5, #0
	adds r6, #0x2f
	ldrb r1, [r6]
	adds r0, r4, #0
	bl sub_80921CC
	movs r1, #0
	movs r0, #0
	strh r0, [r5, #0x3c]
	ldrb r0, [r6]
	adds r2, r5, #0
	adds r2, #0x37
	strb r0, [r2]
	adds r0, r5, #0
	adds r0, #0x38
	strb r1, [r0]
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08091D48: .4byte gUnknown_0200D7E0
_08091D4C: .4byte gUnknown_0200F158
_08091D50: .4byte gUnknown_0200DFE0

	THUMB_FUNC_END sub_8091CC0

	THUMB_FUNC_START sub_8091D54
sub_8091D54: @ 0x08091D54
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	adds r5, r0, #0
	adds r2, r5, #0
	adds r2, #0x38
	ldr r1, _08091DB4  @ gUnknown_08A17B30
	ldrh r0, [r5, #0x3c]
	adds r0, r0, r1
	ldrb r0, [r0]
	ldrb r1, [r2]
	adds r0, r0, r1
	strb r0, [r2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x14
	bls _08091D80
	movs r0, #0x14
	strb r0, [r2]
_08091D80:
	ldrh r0, [r5, #0x3c]
	adds r0, #1
	strh r0, [r5, #0x3c]
	movs r3, #0
	str r2, [sp, #0xc]
	adds r2, r5, #0
	adds r2, #0x36
	str r2, [sp, #8]
	movs r0, #0x2f
	adds r0, r0, r5
	mov sl, r0
	ldr r1, [sp, #0xc]
	str r1, [sp, #4]
_08091D9A:
	ldr r2, [sp, #8]
	ldrb r0, [r2]
	mov r1, sl
	ldrb r1, [r1]
	cmp r0, r1
	bls _08091DB8
	ldr r2, [sp, #4]
	ldrb r0, [r2]
	adds r0, r3, r0
	cmp r0, #0x14
	bgt _08091DC0
	b _08091DC6
	.align 2, 0
_08091DB4: .4byte gUnknown_08A17B30
_08091DB8:
	ldr r1, [sp, #4]
	ldrb r0, [r1]
	cmp r3, r0
	bge _08091DC4
_08091DC0:
	movs r1, #0
	b _08091DCC
_08091DC4:
	subs r0, r3, r0
_08091DC6:
	adds r0, #8
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
_08091DCC:
	ldrh r0, [r5, #0x3e]
	lsrs r4, r0, #3
	adds r0, r4, #0
	adds r0, #0xc
	lsls r6, r1, #1
	adds r2, r3, #1
	mov r9, r2
	cmp r4, r0
	bge _08091E10
	movs r0, #0x1f
	mov r8, r0
	ldr r1, _08091E8C  @ gBG0TilemapBuffer
	mov ip, r1
	ldr r7, _08091E90  @ gUnknown_0200D7E0
	adds r2, r6, #0
_08091DEA:
	adds r0, r4, #0
	mov r1, r8
	ands r0, r1
	lsls r1, r0, #5
	adds r1, #8
	adds r1, r1, r3
	lsls r1, r1, #1
	add r1, ip
	lsls r0, r0, #6
	adds r0, r2, r0
	adds r0, r0, r7
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	ldrh r0, [r5, #0x3e]
	lsrs r0, r0, #3
	adds r0, #0xc
	cmp r4, r0
	blt _08091DEA
_08091E10:
	ldr r0, _08091E94  @ gBG2TilemapBuffer
	ldr r1, _08091E98  @ gUnknown_0200DFE0
	adds r2, r6, r1
	adds r1, r3, #0
	adds r1, #0xa8
	movs r4, #1
	lsls r1, r1, #1
	adds r1, r1, r0
_08091E20:
	ldrh r0, [r2]
	strh r0, [r1]
	adds r2, #0x40
	adds r1, #0x40
	subs r4, #1
	cmp r4, #0
	bge _08091E20
	mov r3, r9
	cmp r3, #0x13
	ble _08091D9A
	movs r0, #5
	bl BG_EnableSyncByMask
	ldr r2, [sp, #0xc]
	ldrb r0, [r2]
	cmp r0, #0x13
	bls _08091EF4
	ldr r1, [sp, #8]
	ldrb r0, [r1]
	mov r2, sl
	strb r0, [r2]
	ldr r0, _08091E9C  @ gUnknown_02023DF8
	movs r1, #0x16
	movs r2, #1
	movs r3, #0
	bl TileMap_FillRect
	ldr r0, _08091EA0  @ gUnknown_02022CB8
	movs r1, #0x16
	movs r2, #0x1f
	movs r3, #0
	bl TileMap_FillRect
	adds r4, r5, #0
	adds r4, #0x32
	adds r6, r5, #0
	adds r6, #0x2e
	ldr r1, _08091EA4  @ gUnknown_0200F15C
	movs r2, #0xff
	adds r0, r1, #0
	adds r0, #0x4c
_08091E72:
	str r2, [r0]
	subs r0, #4
	cmp r0, r1
	bge _08091E72
	bl ResetIconGraphics
	ldrb r0, [r4]
	bl sub_8090238
	ldrh r0, [r5, #0x3e]
	lsrs r4, r0, #4
	adds r0, r4, #6
	b _08091EC4
	.align 2, 0
_08091E8C: .4byte gBG0TilemapBuffer
_08091E90: .4byte gUnknown_0200D7E0
_08091E94: .4byte gBG2TilemapBuffer
_08091E98: .4byte gUnknown_0200DFE0
_08091E9C: .4byte gUnknown_02023DF8
_08091EA0: .4byte gUnknown_02022CB8
_08091EA4: .4byte gUnknown_0200F15C
_08091EA8:
	lsls r1, r4, #0x18
	lsrs r1, r1, #0x18
	mov r0, sl
	ldrb r3, [r0]
	movs r0, #0
	str r0, [sp]
	adds r0, r5, #0
	ldr r2, _08091F04  @ gUnknown_0200D7E0
	bl sub_80922F0
	adds r4, #1
	ldrh r0, [r5, #0x3e]
	lsrs r0, r0, #4
	adds r0, #6
_08091EC4:
	cmp r4, r0
	bge _08091ED0
	ldr r0, _08091F08  @ gUnknown_0200F158
	ldrb r0, [r0]
	cmp r4, r0
	blt _08091EA8
_08091ED0:
	ldr r0, _08091F0C  @ gUnknown_0200DFE0
	mov r2, sl
	ldrb r1, [r2]
	bl sub_80921CC
	ldrb r0, [r6]
	mov r2, sl
	ldrb r1, [r2]
	movs r2, #0
	bl sub_8092298
	movs r0, #0
	ldr r1, [sp, #0xc]
	strb r0, [r1]
	strh r0, [r5, #0x3c]
	adds r0, r5, #0
	bl Proc_Break
_08091EF4:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08091F04: .4byte gUnknown_0200D7E0
_08091F08: .4byte gUnknown_0200F158
_08091F0C: .4byte gUnknown_0200DFE0

	THUMB_FUNC_END sub_8091D54

	THUMB_FUNC_START sub_8091F10
sub_8091F10: @ 0x08091F10
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov r8, r0
	mov r2, r8
	adds r2, #0x38
	ldr r1, _08091FEC  @ gUnknown_08A17B36
	mov r3, r8
	ldrh r0, [r3, #0x3c]
	adds r0, r0, r1
	ldrb r0, [r0]
	ldrb r1, [r2]
	adds r0, r0, r1
	strb r0, [r2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x14
	bls _08091F3E
	movs r0, #0x14
	strb r0, [r2]
_08091F3E:
	mov r3, r8
	ldrh r0, [r3, #0x3c]
	adds r0, #1
	strh r0, [r3, #0x3c]
	mov r0, r8
	adds r0, #0x36
	mov r1, r8
	adds r1, #0x37
	ldrb r0, [r0]
	ldrb r1, [r1]
	cmp r0, r1
	bls _08092000
	movs r5, #0
	str r2, [sp]
	ldrb r0, [r2]
	cmp r5, r0
	blt _08091F62
	b _0809208E
_08091F62:
	adds r7, r2, #0
_08091F64:
	mov r1, r8
	ldrh r0, [r1, #0x3e]
	lsrs r4, r0, #3
	adds r0, r4, #0
	adds r0, #0xc
	adds r6, r5, #0
	adds r6, #0x1c
	movs r3, #8
	adds r3, r3, r5
	mov ip, r3
	adds r5, #1
	mov sl, r5
	cmp r4, r0
	bge _08091FB6
	adds r5, r6, #0
	lsls r2, r3, #1
	movs r0, #0x1f
	mov r9, r0
_08091F88:
	adds r3, r4, #0
	mov r1, r9
	ands r3, r1
	lsls r1, r3, #5
	ldrb r0, [r7]
	subs r0, r5, r0
	adds r1, r1, r0
	lsls r1, r1, #1
	ldr r0, _08091FF0  @ gBG0TilemapBuffer
	adds r1, r1, r0
	lsls r0, r3, #6
	adds r0, r2, r0
	ldr r3, _08091FF4  @ gUnknown_0200D7E0
	adds r0, r0, r3
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	mov r1, r8
	ldrh r0, [r1, #0x3e]
	lsrs r0, r0, #3
	adds r0, #0xc
	cmp r4, r0
	blt _08091F88
_08091FB6:
	ldr r3, _08091FF8  @ gBG2TilemapBuffer
	mov r9, r3
	adds r5, r6, #0
	mov r1, ip
	lsls r0, r1, #1
	ldr r3, _08091FFC  @ gUnknown_0200DFE0
	adds r2, r0, r3
	movs r3, #0xa0
	movs r4, #1
_08091FC8:
	ldrb r0, [r7]
	subs r0, r5, r0
	adds r0, r3, r0
	lsls r0, r0, #1
	add r0, r9
	ldrh r1, [r2]
	strh r1, [r0]
	adds r2, #0x40
	adds r3, #0x20
	subs r4, #1
	cmp r4, #0
	bge _08091FC8
	mov r5, sl
	ldrb r0, [r7]
	cmp r5, r0
	blt _08091F64
	b _0809208E
	.align 2, 0
_08091FEC: .4byte gUnknown_08A17B36
_08091FF0: .4byte gBG0TilemapBuffer
_08091FF4: .4byte gUnknown_0200D7E0
_08091FF8: .4byte gBG2TilemapBuffer
_08091FFC: .4byte gUnknown_0200DFE0
_08092000:
	movs r5, #0
	str r2, [sp]
	ldrb r1, [r2]
	cmp r5, r1
	bge _0809208E
	adds r7, r2, #0
_0809200C:
	mov r3, r8
	ldrh r0, [r3, #0x3e]
	lsrs r4, r0, #3
	adds r0, r4, #0
	adds r0, #0xc
	adds r6, r5, #0
	adds r6, #0x1c
	adds r1, r5, #1
	mov sl, r1
	cmp r4, r0
	bge _0809205C
	mov ip, r6
	movs r3, #0x1f
	mov r9, r3
_08092028:
	adds r3, r4, #0
	mov r0, r9
	ands r3, r0
	lsls r2, r3, #5
	adds r2, #8
	adds r2, r2, r5
	lsls r2, r2, #1
	ldr r1, _080920B4  @ gBG0TilemapBuffer
	adds r2, r2, r1
	ldrb r0, [r7]
	mov r1, ip
	subs r0, r1, r0
	lsls r0, r0, #1
	lsls r1, r3, #6
	adds r0, r0, r1
	ldr r3, _080920B8  @ gUnknown_0200D7E0
	adds r0, r0, r3
	ldrh r0, [r0]
	strh r0, [r2]
	adds r4, #1
	mov r1, r8
	ldrh r0, [r1, #0x3e]
	lsrs r0, r0, #3
	adds r0, #0xc
	cmp r4, r0
	blt _08092028
_0809205C:
	movs r4, #0
	ldr r3, _080920BC  @ gUnknown_0200DFE0
	mov ip, r3
	adds r3, r6, #0
	adds r0, r5, #0
	adds r0, #0xa8
	lsls r0, r0, #1
	ldr r1, _080920C0  @ gBG2TilemapBuffer
	adds r2, r0, r1
_0809206E:
	ldrb r0, [r7]
	subs r0, r3, r0
	lsls r0, r0, #1
	lsls r1, r4, #6
	adds r0, r0, r1
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r2]
	adds r2, #0x40
	adds r4, #1
	cmp r4, #1
	ble _0809206E
	mov r5, sl
	ldrb r3, [r7]
	cmp r5, r3
	blt _0809200C
_0809208E:
	movs r0, #5
	bl BG_EnableSyncByMask
	ldr r1, [sp]
	ldrb r0, [r1]
	cmp r0, #0x13
	bls _080920A2
	mov r0, r8
	bl Proc_Break
_080920A2:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080920B4: .4byte gBG0TilemapBuffer
_080920B8: .4byte gUnknown_0200D7E0
_080920BC: .4byte gUnknown_0200DFE0
_080920C0: .4byte gBG2TilemapBuffer

	THUMB_FUNC_END sub_8091F10

	THUMB_FUNC_START sub_80920C4
sub_80920C4: @ 0x080920C4
	push {lr}
	ldr r0, _080920D8  @ gUnknown_08A177A0
	movs r1, #3
	bl Proc_Start
	adds r0, #0x39
	movs r1, #0
	strb r1, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_080920D8: .4byte gUnknown_08A177A0

	THUMB_FUNC_END sub_80920C4

	THUMB_FUNC_START sub_80920DC
sub_80920DC: @ 0x080920DC
	push {r4, lr}
	adds r1, r0, #0
	cmp r1, #0
	bne _080920F4
	ldr r0, _080920F0  @ gUnknown_08A178C0
	movs r1, #3
	bl Proc_Start
	b _080920FA
	.align 2, 0
_080920F0: .4byte gUnknown_08A178C0
_080920F4:
	ldr r0, _08092118  @ gUnknown_08A178C0
	bl Proc_StartBlocking
_080920FA:
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x39
	movs r0, #1
	strb r0, [r1]
	bl CheckSomethingSomewhere
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _0809211C
	adds r1, r4, #0
	adds r1, #0x3a
	movs r0, #5
	b _08092124
	.align 2, 0
_08092118: .4byte gUnknown_08A178C0
_0809211C:
	bl GetChapterAllyUnitCount
	adds r1, r4, #0
	adds r1, #0x3a
_08092124:
	strb r0, [r1]
	adds r1, r4, #0
	adds r1, #0x3b
	movs r0, #0
	strb r0, [r1]
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80920DC

	THUMB_FUNC_START sub_8092134
sub_8092134: @ 0x08092134
	push {lr}
	adds r1, r0, #0
	cmp r1, #0
	bne _0809214C
	ldr r0, _08092148  @ gUnknown_08A17990
	movs r1, #3
	bl Proc_Start
	b _08092152
	.align 2, 0
_08092148: .4byte gUnknown_08A17990
_0809214C:
	ldr r0, _08092160  @ gUnknown_08A17990
	bl Proc_StartBlocking
_08092152:
	adds r1, r0, #0
	adds r1, #0x39
	movs r0, #3
	strb r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_08092160: .4byte gUnknown_08A17990

	THUMB_FUNC_END sub_8092134

	THUMB_FUNC_START sub_8092164
sub_8092164: @ 0x08092164
	push {lr}
	adds r1, r0, #0
	cmp r1, #0
	bne _0809217C
	ldr r0, _08092178  @ gUnknown_08A178C0
	movs r1, #3
	bl Proc_Start
	b _08092182
	.align 2, 0
_08092178: .4byte gUnknown_08A178C0
_0809217C:
	ldr r0, _08092190  @ gUnknown_08A178C0
	bl Proc_StartBlocking
_08092182:
	adds r1, r0, #0
	adds r1, #0x39
	movs r0, #4
	strb r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_08092190: .4byte gUnknown_08A178C0

	THUMB_FUNC_END sub_8092164

	THUMB_FUNC_START sub_8092194
sub_8092194: @ 0x08092194
	push {r4, lr}
	adds r1, r0, #0
	cmp r1, #0
	bne _080921AC
	ldr r0, _080921A8  @ gUnknown_08A17A30
	movs r1, #3
	bl Proc_Start
	b _080921B2
	.align 2, 0
_080921A8: .4byte gUnknown_08A17A30
_080921AC:
	ldr r0, _080921C8  @ gUnknown_08A17A30
	bl Proc_StartBlocking
_080921B2:
	adds r4, r0, #0
	bl SMS_ClearUsageTable
	adds r1, r4, #0
	adds r1, #0x39
	movs r0, #5
	strb r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080921C8: .4byte gUnknown_08A17A30

	THUMB_FUNC_END sub_8092194

	THUMB_FUNC_START sub_80921CC
sub_80921CC: @ 0x080921CC
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	adds r7, r0, #0
	lsls r1, r1, #0x18
	lsrs r4, r1, #0x18
	adds r6, r7, #0
	adds r6, #0x12
	adds r0, r6, #0
	movs r1, #0x13
	movs r2, #1
	movs r3, #0
	bl TileMap_FillRect
	ldr r0, _08092214  @ gUnknown_0200E148
	mov r8, r0
	bl Text_Clear
	cmp r4, #5
	bne _08092218
	movs r5, #0
	adds r4, r6, #0
_080921FA:
	adds r1, r5, #0
	adds r1, #0x70
	adds r0, r4, #0
	movs r2, #0xa0
	lsls r2, r2, #7
	bl DrawIcon
	adds r4, #4
	adds r5, #1
	cmp r5, #7
	ble _080921FA
	b _0809227C
	.align 2, 0
_08092214: .4byte gUnknown_0200E148
_08092218:
	movs r5, #1
	ldr r3, _08092290  @ gUnknown_08A17C48
	lsls r0, r4, #3
	adds r0, r0, r4
	lsls r1, r0, #4
	adds r2, r1, #0
	adds r2, #0x10
	adds r0, r2, r3
	ldrb r0, [r0, #8]
	adds r7, #0x10
	mov r9, r7
	cmp r0, #0
	beq _08092274
	mov r7, r8
	mov r8, r3
	adds r0, r1, r3
	adds r4, r0, #0
	adds r4, #0x10
	adds r6, r2, #0
_0809223E:
	ldrb r1, [r4, #8]
	subs r1, #0x40
	adds r0, r7, #0
	bl Text_SetXCursor
	adds r0, r7, #0
	movs r1, #0
	bl Text_SetColorId
	mov r0, r8
	adds r0, #4
	adds r0, r6, r0
	ldr r0, [r0]
	bl GetStringFromIndex
	adds r1, r0, #0
	adds r0, r7, #0
	bl Text_AppendString
	adds r4, #0x10
	adds r6, #0x10
	adds r5, #1
	cmp r5, #8
	bgt _08092274
	ldrb r0, [r4, #8]
	cmp r0, #0
	bne _0809223E
_08092274:
	ldr r0, _08092294  @ gUnknown_0200E148
	mov r1, r9
	bl Text_Draw
_0809227C:
	movs r0, #4
	bl BG_EnableSyncByMask
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08092290: .4byte gUnknown_08A17C48
_08092294: .4byte gUnknown_0200E148

	THUMB_FUNC_END sub_80921CC

	THUMB_FUNC_START sub_8092298
sub_8092298: @ 0x08092298
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r3, r1, #0x18
	adds r7, r3, #0
	lsls r2, r2, #0x18
	lsrs r5, r2, #0x18
	cmp r3, #0
	beq _080922CE
	ldr r4, _080922E8  @ gUnknown_02023D9C
	adds r0, r4, #0
	movs r1, #2
	adds r2, r3, #0
	bl sub_8004B88
	adds r0, r4, #2
	movs r1, #0
	movs r2, #0x16
	bl sub_8004B0C
	adds r4, #4
	adds r0, r4, #0
	movs r1, #2
	adds r2, r6, #0
	bl sub_8004B88
_080922CE:
	cmp r5, #0
	beq _080922DA
	ldr r0, _080922EC  @ gUnknown_02023DE8
	adds r1, r7, #0
	bl sub_80921CC
_080922DA:
	movs r0, #4
	bl BG_EnableSyncByMask
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080922E8: .4byte gUnknown_02023D9C
_080922EC: .4byte gUnknown_02023DE8

	THUMB_FUNC_END sub_8092298

	THUMB_FUNC_START sub_80922F0
sub_80922F0: @ 0x080922F0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x58
	str r0, [sp, #0x24]
	mov sl, r2
	ldr r4, [sp, #0x78]
	lsls r1, r1, #0x18
	lsrs r7, r1, #0x18
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	str r3, [sp, #0x28]
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	adds r0, r7, #0
	movs r1, #7
	bl __umodsi3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0x2c]
	lsls r0, r7, #1
	str r0, [sp, #0x30]
	movs r0, #0x1f
	ldr r1, [sp, #0x30]
	ands r1, r0
	str r1, [sp, #0x30]
	ldr r1, _0809238C  @ gUnknown_0200D6E0
	lsls r0, r7, #2
	adds r6, r0, r1
	ldr r0, [r6]
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	movs r1, #8
	ands r0, r1
	negs r0, r0
	lsrs r0, r0, #0x1f
	mov r9, r0
	cmp r4, #0
	beq _080923CA
	ldr r2, [sp, #0x2c]
	lsls r4, r2, #3
	ldr r0, _08092390  @ gUnknown_0200E060
	adds r5, r4, r0
	adds r0, r5, #0
	bl Text_Clear
	adds r0, r5, #0
	movs r1, #0
	bl Text_SetXCursor
	bl CheckSomethingSomewhere
	lsls r0, r0, #0x18
	mov r8, r4
	cmp r0, #0
	bne _08092394
	ldr r0, [sp, #0x24]
	adds r0, #0x39
	ldrb r0, [r0]
	cmp r0, #1
	bne _08092394
	ldr r0, [r6]
	ldr r0, [r0]
	ldr r0, [r0]
	ldrb r0, [r0, #4]
	bl IsCharacterForceDeployed
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08092394
	adds r0, r5, #0
	movs r1, #4
	bl Text_SetColorId
	b _0809239E
	.align 2, 0
_0809238C: .4byte gUnknown_0200D6E0
_08092390: .4byte gUnknown_0200E060
_08092394:
	ldr r0, _08092414  @ gUnknown_0200E060
	add r0, r8
	mov r1, r9
	bl Text_SetColorId
_0809239E:
	ldr r4, _08092414  @ gUnknown_0200E060
	add r4, r8
	ldr r1, _08092418  @ gUnknown_0200D6E0
	lsls r0, r7, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r0, [r0]
	ldr r0, [r0]
	ldrh r0, [r0]
	bl GetStringFromIndex
	adds r1, r0, #0
	adds r0, r4, #0
	bl Text_AppendString
	ldr r3, [sp, #0x30]
	lsls r1, r3, #6
	add r1, sl
	adds r1, #6
	adds r0, r4, #0
	bl Text_Draw
_080923CA:
	ldr r4, [sp, #0x2c]
	lsls r5, r4, #1
	adds r0, r5, r4
	lsls r0, r0, #3
	mov r8, r0
	ldr r6, _0809241C  @ gUnknown_0200E098
	adds r0, r0, r6
	bl Text_Clear
	adds r0, r6, #0
	adds r0, #8
	add r0, r8
	bl Text_Clear
	ldr r0, [sp, #0x30]
	lsls r4, r0, #6
	mov r1, sl
	adds r1, r1, r4
	str r1, [sp, #0x34]
	adds r0, r1, #0
	adds r0, #0x10
	movs r1, #0x18
	movs r2, #1
	movs r3, #0
	bl TileMap_FillRect
	str r4, [sp, #0x54]
	str r5, [sp, #0x50]
	ldr r2, [sp, #0x28]
	cmp r2, #5
	bls _0809240A
	b _08092A48
_0809240A:
	lsls r0, r2, #2
	ldr r1, _08092420  @ _08092424
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08092414: .4byte gUnknown_0200E060
_08092418: .4byte gUnknown_0200D6E0
_0809241C: .4byte gUnknown_0200E098
_08092420: .4byte _08092424
_08092424: @ jump table
	.4byte _0809243C @ case 0
	.4byte _080925A0 @ case 1
	.4byte _08092664 @ case 2
	.4byte _0809279A @ case 3
	.4byte _080928B0 @ case 4
	.4byte _080929E8 @ case 5
_0809243C:
	ldr r0, _080924B0  @ gUnknown_0200D6E0
	lsls r6, r7, #2
	adds r0, r0, r6
	mov r8, r0
	ldr r0, [r0]
	ldr r0, [r0]
	ldr r0, [r0, #4]
	ldrh r0, [r0]
	bl GetStringFromIndex
	adds r2, r0, #0
	ldr r3, [sp, #0x50]
	ldr r4, [sp, #0x2c]
	adds r5, r3, r4
	lsls r5, r5, #3
	ldr r4, _080924B4  @ gUnknown_0200E098
	adds r0, r5, r4
	ldr r7, [sp, #0x54]
	add r7, sl
	adds r1, r7, #0
	adds r1, #0x10
	movs r3, #0
	str r3, [sp]
	str r2, [sp, #4]
	movs r2, #0
	bl DrawTextInline
	adds r4, #8
	adds r5, r5, r4
	mov r4, r9
	adds r0, r5, #0
	adds r1, r4, #0
	bl Text_SetColorId
	mov r1, r8
	ldr r0, [r1]
	ldr r0, [r0]
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	str r6, [sp, #0x4c]
	cmp r0, #0
	bne _080924BC
	ldr r0, _080924B8  @ 0x00000537
	bl GetStringFromIndex
	adds r1, r7, #0
	adds r1, #0x22
	movs r2, #0
	str r2, [sp]
	str r0, [sp, #4]
	adds r0, r5, #0
	adds r2, r4, #0
	movs r3, #0
	bl DrawTextInline
	b _0809251A
	.align 2, 0
_080924B0: .4byte gUnknown_0200D6E0
_080924B4: .4byte gUnknown_0200E098
_080924B8: .4byte 0x00000537
_080924BC:
	mov r3, r8
	ldr r0, [r3]
	ldr r0, [r0]
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl GetItemName
	adds r1, r7, #0
	adds r1, #0x22
	movs r6, #0
	str r6, [sp]
	str r0, [sp, #4]
	adds r0, r5, #0
	adds r2, r4, #0
	movs r3, #0
	bl DrawTextInline
	adds r4, r7, #0
	adds r4, #0x1e
	mov r1, r8
	ldr r0, [r1]
	ldr r0, [r0]
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl GetItemIconId
	adds r1, r0, #0
	movs r2, #0x80
	lsls r2, r2, #7
	adds r0, r4, #0
	bl DrawIcon
	mov r2, r8
	ldr r0, [r2]
	ldr r0, [r0]
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl GetItemIconId
	bl sub_8090324
_0809251A:
	ldr r3, [sp, #0x50]
	ldr r4, [sp, #0x2c]
	adds r0, r3, r4
	lsls r0, r0, #3
	ldr r1, _08092550  @ gUnknown_0200E0A8
	adds r5, r0, r1
	adds r0, r5, #0
	bl Text_Clear
	ldr r0, _08092554  @ gUnknown_0200D6E0
	ldr r6, [sp, #0x4c]
	adds r0, r6, r0
	ldr r0, [r0]
	ldr r0, [r0]
	ldr r4, [r0, #0xc]
	movs r0, #0xc0
	lsls r0, r0, #8
	ands r4, r0
	movs r0, #0x80
	lsls r0, r0, #7
	cmp r4, r0
	beq _08092562
	cmp r4, r0
	bhi _08092558
	cmp r4, #0
	beq _08092584
	b _08092BC6
	.align 2, 0
_08092550: .4byte gUnknown_0200E0A8
_08092554: .4byte gUnknown_0200D6E0
_08092558:
	movs r0, #0x80
	lsls r0, r0, #8
	cmp r4, r0
	beq _08092566
	b _08092BC6
_08092562:
	movs r0, #0xbf
	b _08092568
_08092566:
	movs r0, #0xc0
_08092568:
	bl GetStringFromIndex
	ldr r1, [sp, #0x54]
	add r1, sl
	adds r1, #0x30
	movs r2, #0
	str r2, [sp]
	str r0, [sp, #4]
	adds r0, r5, #0
	movs r2, #4
	movs r3, #8
	bl DrawTextInline
	b _08092BC6
_08092584:
	movs r0, #0xbe
	bl GetStringFromIndex
	ldr r1, [sp, #0x54]
	add r1, sl
	adds r1, #0x30
	str r4, [sp]
	str r0, [sp, #4]
	adds r0, r5, #0
	movs r2, #1
	movs r3, #4
	bl DrawTextInline
	b _08092BC6
_080925A0:
	ldr r1, _0809265C  @ gUnknown_0200D6E0
	lsls r0, r7, #2
	adds r6, r0, r1
	ldr r0, [r6]
	ldr r0, [r0]
	ldr r0, [r0, #4]
	ldrh r0, [r0]
	bl GetStringFromIndex
	adds r3, r0, #0
	ldr r1, [sp, #0x50]
	ldr r2, [sp, #0x2c]
	adds r0, r1, r2
	lsls r0, r0, #3
	ldr r1, _08092660  @ gUnknown_0200E098
	adds r0, r0, r1
	ldr r7, [sp, #0x54]
	add r7, sl
	adds r1, r7, #0
	adds r1, #0x10
	mov r8, r9
	movs r2, #0
	str r2, [sp]
	str r3, [sp, #4]
	mov r2, r8
	movs r3, #4
	bl DrawTextInline
	adds r3, r7, #0
	adds r3, #0x22
	movs r1, #2
	mov r4, r9
	cmp r4, #0
	beq _080925E6
	movs r1, #1
_080925E6:
	ldr r0, [r6]
	ldr r0, [r0]
	movs r2, #8
	ldrsb r2, [r0, r2]
	adds r0, r3, #0
	bl DrawDecNumber
	adds r3, r7, #0
	adds r3, #0x28
	movs r1, #2
	mov r0, r9
	cmp r0, #0
	beq _08092602
	movs r1, #1
_08092602:
	ldr r0, [r6]
	ldr r0, [r0]
	ldrb r2, [r0, #9]
	adds r0, r3, #0
	bl DrawDecNumber
	adds r5, r7, #0
	adds r5, #0x2e
	movs r4, #2
	mov r1, r9
	cmp r1, #0
	beq _0809261C
	movs r4, #1
_0809261C:
	ldr r0, [r6]
	ldr r0, [r0]
	bl GetUnitCurrentHp
	adds r2, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	bl DrawDecNumber
	adds r0, r7, #0
	adds r0, #0x30
	mov r1, r8
	movs r2, #0x16
	bl sub_8004B0C
	adds r4, r7, #0
	adds r4, #0x34
	movs r5, #2
	mov r2, r9
	cmp r2, #0
	beq _08092648
	movs r5, #1
_08092648:
	ldr r0, [r6]
	ldr r0, [r0]
	bl GetUnitMaxHp
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	bl DrawDecNumber
	b _08092BC6
	.align 2, 0
_0809265C: .4byte gUnknown_0200D6E0
_08092660: .4byte gUnknown_0200E098
_08092664:
	ldr r5, [sp, #0x54]
	add r5, sl
	movs r3, #0x12
	adds r3, r3, r5
	mov r8, r3
	ldr r1, _08092788  @ gUnknown_0200D6E0
	lsls r0, r7, #2
	adds r4, r0, r1
	ldr r0, [r4]
	ldr r2, [r0]
	ldr r0, [r2, #4]
	movs r1, #0x14
	ldrsb r1, [r0, r1]
	movs r0, #0x14
	ldrsb r0, [r2, r0]
	movs r6, #2
	cmp r1, r0
	bne _0809268A
	movs r6, #4
_0809268A:
	adds r0, r2, #0
	bl GetUnitPower
	adds r2, r0, #0
	mov r0, r8
	adds r1, r6, #0
	bl DrawDecNumber
	adds r7, r5, #0
	adds r7, #0x18
	ldr r0, [r4]
	ldr r2, [r0]
	ldr r0, [r2, #4]
	movs r1, #0x15
	ldrsb r1, [r0, r1]
	movs r0, #0x15
	ldrsb r0, [r2, r0]
	movs r6, #2
	cmp r1, r0
	bne _080926B4
	movs r6, #4
_080926B4:
	adds r0, r2, #0
	bl GetUnitSkill
	adds r2, r0, #0
	adds r0, r7, #0
	adds r1, r6, #0
	bl DrawDecNumber
	adds r7, r5, #0
	adds r7, #0x1e
	ldr r0, [r4]
	ldr r2, [r0]
	ldr r0, [r2, #4]
	movs r1, #0x16
	ldrsb r1, [r0, r1]
	movs r0, #0x16
	ldrsb r0, [r2, r0]
	movs r6, #2
	cmp r1, r0
	bne _080926DE
	movs r6, #4
_080926DE:
	adds r0, r2, #0
	bl GetUnitSpeed
	adds r2, r0, #0
	adds r0, r7, #0
	adds r1, r6, #0
	bl DrawDecNumber
	adds r7, r5, #0
	adds r7, #0x24
	ldr r0, [r4]
	ldr r1, [r0]
	movs r0, #0x19
	ldrsb r0, [r1, r0]
	movs r6, #2
	cmp r0, #0x1e
	bne _08092702
	movs r6, #4
_08092702:
	adds r0, r1, #0
	bl GetUnitLuck
	adds r2, r0, #0
	adds r0, r7, #0
	adds r1, r6, #0
	bl DrawDecNumber
	adds r7, r5, #0
	adds r7, #0x2a
	ldr r0, [r4]
	ldr r2, [r0]
	ldr r0, [r2, #4]
	movs r1, #0x17
	ldrsb r1, [r0, r1]
	movs r0, #0x17
	ldrsb r0, [r2, r0]
	movs r6, #2
	cmp r1, r0
	bne _0809272C
	movs r6, #4
_0809272C:
	adds r0, r2, #0
	bl GetUnitDefense
	adds r2, r0, #0
	adds r0, r7, #0
	adds r1, r6, #0
	bl DrawDecNumber
	adds r7, r5, #0
	adds r7, #0x30
	ldr r0, [r4]
	ldr r2, [r0]
	ldr r0, [r2, #4]
	movs r1, #0x18
	ldrsb r1, [r0, r1]
	movs r0, #0x18
	ldrsb r0, [r2, r0]
	movs r6, #2
	cmp r1, r0
	bne _08092756
	movs r6, #4
_08092756:
	adds r0, r2, #0
	bl GetUnitResistance
	adds r2, r0, #0
	adds r0, r7, #0
	adds r1, r6, #0
	bl DrawDecNumber
	ldr r0, [r4]
	ldr r0, [r0]
	bl GetUnitAffinityIcon
	adds r1, r0, #0
	movs r0, #1
	negs r0, r0
	cmp r1, r0
	bne _0809278C
	adds r0, r5, #0
	adds r0, #0x34
	movs r1, #2
	movs r2, #0x14
	bl sub_8004B0C
	b _08092BC6
	.align 2, 0
_08092788: .4byte gUnknown_0200D6E0
_0809278C:
	adds r0, r5, #0
	adds r0, #0x34
	movs r2, #0xa0
	lsls r2, r2, #7
	bl DrawIcon
	b _08092BC6
_0809279A:
	ldr r0, _080927DC  @ gUnknown_0200D6E0
	lsls r4, r7, #2
	adds r7, r4, r0
	ldr r0, [r7]
	ldr r0, [r0]
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	str r4, [sp, #0x4c]
	cmp r5, #0
	bne _080927E8
	ldr r0, _080927E0  @ 0x00000537
	bl GetStringFromIndex
	adds r3, r0, #0
	ldr r4, [sp, #0x50]
	ldr r6, [sp, #0x2c]
	adds r0, r4, r6
	lsls r0, r0, #3
	ldr r1, _080927E4  @ gUnknown_0200E098
	adds r0, r0, r1
	ldr r1, [sp, #0x54]
	add r1, sl
	adds r1, #0x14
	mov r2, r9
	str r5, [sp]
	str r3, [sp, #4]
	movs r3, #0
	bl DrawTextInline
	b _0809284C
	.align 2, 0
_080927DC: .4byte gUnknown_0200D6E0
_080927E0: .4byte 0x00000537
_080927E4: .4byte gUnknown_0200E098
_080927E8:
	ldr r0, [r7]
	ldr r0, [r0]
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl GetItemName
	adds r5, r0, #0
	ldr r1, [sp, #0x50]
	ldr r2, [sp, #0x2c]
	adds r0, r1, r2
	lsls r0, r0, #3
	ldr r1, _080928A8  @ gUnknown_0200E098
	adds r0, r0, r1
	ldr r4, [sp, #0x54]
	add r4, sl
	adds r1, r4, #0
	adds r1, #0x14
	mov r2, r9
	movs r3, #0
	str r3, [sp]
	str r5, [sp, #4]
	bl DrawTextInline
	adds r4, #0x10
	ldr r0, [r7]
	ldr r0, [r0]
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl GetItemIconId
	adds r1, r0, #0
	movs r2, #0x80
	lsls r2, r2, #7
	adds r0, r4, #0
	bl DrawIcon
	ldr r0, [r7]
	ldr r0, [r0]
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl GetItemIconId
	bl sub_8090324
_0809284C:
	ldr r5, [sp, #0x54]
	add r5, sl
	adds r3, r5, #0
	adds r3, #0x24
	movs r1, #2
	mov r4, r9
	cmp r4, #0
	beq _0809285E
	movs r1, #1
_0809285E:
	ldr r0, _080928AC  @ gUnknown_0200D6E0
	ldr r6, [sp, #0x4c]
	adds r4, r6, r0
	ldr r0, [r4]
	movs r6, #4
	ldrsh r2, [r0, r6]
	adds r0, r3, #0
	bl DrawDecNumber
	adds r3, r5, #0
	adds r3, #0x2c
	movs r1, #2
	mov r0, r9
	cmp r0, #0
	beq _0809287E
	movs r1, #1
_0809287E:
	ldr r0, [r4]
	movs r6, #6
	ldrsh r2, [r0, r6]
	adds r0, r3, #0
	bl DrawDecNumber
	adds r1, r5, #0
	adds r1, #0x34
	movs r3, #2
	mov r0, r9
	cmp r0, #0
	beq _08092898
	movs r3, #1
_08092898:
	ldr r0, [r4]
	movs r4, #8
	ldrsh r2, [r0, r4]
	adds r0, r1, #0
	adds r1, r3, #0
	bl DrawDecNumber
	b _08092BC6
	.align 2, 0
_080928A8: .4byte gUnknown_0200E098
_080928AC: .4byte gUnknown_0200D6E0
_080928B0:
	ldr r0, _080928F4  @ gUnknown_0200D6E0
	lsls r1, r7, #2
	adds r0, r1, r0
	ldr r0, [r0]
	ldr r2, [r0]
	ldr r5, [r2, #0xc]
	movs r0, #0x10
	ands r5, r0
	str r1, [sp, #0x4c]
	cmp r5, #0
	beq _080928FC
	adds r0, r2, #0
	bl GetUnitRescueName
	adds r5, r0, #0
	ldr r6, [sp, #0x50]
	ldr r1, [sp, #0x2c]
	adds r0, r6, r1
	lsls r0, r0, #3
	ldr r1, _080928F8  @ gUnknown_0200E0A0
	adds r0, r0, r1
	ldr r1, [sp, #0x54]
	add r1, sl
	adds r1, #0x22
	mov r2, r9
	negs r4, r2
	movs r3, #0
	str r3, [sp]
	str r5, [sp, #4]
	movs r3, #2
	bl DrawTextInline
	b _08092924
	.align 2, 0
_080928F4: .4byte gUnknown_0200D6E0
_080928F8: .4byte gUnknown_0200E0A0
_080928FC:
	ldr r0, _080929D8  @ 0x00000536
	bl GetStringFromIndex
	adds r3, r0, #0
	ldr r4, [sp, #0x50]
	ldr r6, [sp, #0x2c]
	adds r0, r4, r6
	lsls r0, r0, #3
	ldr r1, _080929DC  @ gUnknown_0200E0A0
	adds r0, r0, r1
	ldr r1, [sp, #0x54]
	add r1, sl
	adds r1, #0x22
	mov r2, r9
	negs r4, r2
	str r5, [sp]
	str r3, [sp, #4]
	movs r3, #2
	bl DrawTextInline
_08092924:
	mov r8, r4
	ldr r7, [sp, #0x54]
	add r7, sl
	adds r3, r7, #0
	adds r3, #0x14
	movs r1, #2
	mov r4, r9
	cmp r4, #0
	beq _08092938
	movs r1, #1
_08092938:
	ldr r0, _080929E0  @ gUnknown_0200D6E0
	ldr r6, [sp, #0x4c]
	adds r4, r6, r0
	ldr r0, [r4]
	ldr r0, [r0]
	movs r2, #0x1d
	ldrsb r2, [r0, r2]
	ldr r0, [r0, #4]
	ldrb r0, [r0, #0x12]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r2, r2, r0
	adds r0, r3, #0
	bl DrawDecNumber
	adds r3, r7, #0
	adds r3, #0x1a
	movs r5, #2
	mov r0, r9
	cmp r0, #0
	beq _08092964
	movs r5, #1
_08092964:
	ldr r0, [r4]
	ldr r1, [r0]
	ldr r0, [r1, #4]
	movs r2, #0x11
	ldrsb r2, [r0, r2]
	ldr r0, [r1]
	ldrb r0, [r0, #0x13]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r2, r2, r0
	movs r0, #0x1a
	ldrsb r0, [r1, r0]
	adds r2, r2, r0
	adds r0, r3, #0
	adds r1, r5, #0
	bl DrawDecNumber
	adds r5, r7, #0
	adds r5, #0x20
	movs r6, #2
	mov r1, r9
	cmp r1, #0
	beq _08092994
	movs r6, #1
_08092994:
	ldr r0, [r4]
	ldr r0, [r0]
	bl GetUnitAid
	adds r2, r0, #0
	adds r0, r5, #0
	adds r1, r6, #0
	bl DrawDecNumber
	ldr r0, [r4]
	ldr r0, [r0]
	bl GetUnitStatusName
	adds r4, r0, #0
	ldr r2, [sp, #0x50]
	ldr r3, [sp, #0x2c]
	adds r0, r2, r3
	lsls r0, r0, #3
	ldr r1, _080929E4  @ gUnknown_0200E098
	adds r0, r0, r1
	adds r1, r7, #0
	adds r1, #0x2e
	mov r6, r8
	mov r2, r9
	orrs r6, r2
	lsrs r2, r6, #0x1f
	movs r3, #0
	str r3, [sp]
	str r4, [sp, #4]
	movs r3, #2
	bl DrawTextInline
	b _08092BC6
	.align 2, 0
_080929D8: .4byte 0x00000536
_080929DC: .4byte gUnknown_0200E0A0
_080929E0: .4byte gUnknown_0200D6E0
_080929E4: .4byte gUnknown_0200E098
_080929E8:
	movs r6, #0
	lsls r3, r7, #2
	ldr r0, _08092A40  @ gUnknown_0200D6E0
	adds r7, r3, r0
	ldr r5, [sp, #0x54]
	add r5, sl
_080929F4:
	add r1, sp, #8
	ldr r0, _08092A44  @ gUnknown_08205B94
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldr r0, [r0]
	str r0, [r1]
	ldr r0, [r7]
	ldr r0, [r0]
	adds r0, #0x28
	adds r0, r0, r6
	ldrb r0, [r0]
	bl GetWeaponLevelFromExp
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	lsls r0, r6, #2
	adds r0, #0x14
	adds r3, r5, r0
	movs r1, #2
	cmp r4, #6
	bne _08092A24
	movs r1, #4
_08092A24:
	lsls r0, r4, #2
	add r0, sp
	adds r0, #8
	ldr r2, [r0]
	adds r0, r3, #0
	bl sub_8004B0C
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #7
	bls _080929F4
	b _08092BC6
	.align 2, 0
_08092A40: .4byte gUnknown_0200D6E0
_08092A44: .4byte gUnknown_08205B94
_08092A48:
	ldr r1, [sp, #0x28]
	subs r1, #6
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0x38]
	movs r4, #0
	str r4, [sp, #0x3c]
	ldr r1, _08092B10  @ gUnknown_0200D6E0
	lsls r0, r7, #2
	adds r5, r0, r1
	ldr r0, [r5]
	ldr r0, [r0]
	bl GetUnitSupporterCount
	str r0, [sp, #0x40]
	adds r0, r6, #0
	adds r0, #0x10
	add r0, r8
	bl Text_Clear
	movs r6, #0
	ldr r0, [sp, #0x40]
	cmp r4, r0
	blt _08092A7E
	b _08092B7E
_08092A7E:
	adds r7, r5, #0
	mov r1, r8
	str r1, [sp, #0x44]
	ldr r2, [sp, #0x34]
	str r2, [sp, #0x48]
	mov r3, r9
	negs r3, r3
	mov r0, r9
	orrs r3, r0
	mov r8, r3
_08092A92:
	ldr r0, [r7]
	ldr r0, [r0]
	adds r1, r6, #0
	bl CanUnitSupportNow
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08092B72
	ldr r1, [sp, #0x3c]
	ldr r2, [sp, #0x38]
	cmp r1, r2
	bcc _08092B68
	ldr r0, [r7]
	ldr r0, [r0]
	adds r1, r6, #0
	bl GetUnitSupporterUnit
	cmp r0, #0
	beq _08092B72
	ldr r0, [r7]
	ldr r0, [r0]
	adds r1, r6, #0
	bl GetUnitSupporterUnit
	ldr r0, [r0, #0xc]
	movs r1, #8
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0
	bne _08092B18
	ldr r0, [r7]
	ldr r0, [r0]
	adds r1, r6, #0
	bl GetUnitSupporterCharacter
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl GetCharacterData
	ldrh r0, [r0]
	bl GetStringFromIndex
	adds r2, r0, #0
	lsls r0, r4, #3
	ldr r1, _08092B14  @ gUnknown_0200E098
	adds r0, r0, r1
	ldr r3, [sp, #0x44]
	adds r0, r3, r0
	lsls r1, r4, #1
	adds r1, r1, r4
	lsls r1, r1, #2
	adds r1, #0x12
	ldr r3, [sp, #0x48]
	adds r1, r3, r1
	str r5, [sp]
	str r2, [sp, #4]
	mov r3, r8
	lsrs r2, r3, #0x1f
	movs r3, #0
	bl DrawTextInline
	b _08092B56
	.align 2, 0
_08092B10: .4byte gUnknown_0200D6E0
_08092B14: .4byte gUnknown_0200E098
_08092B18:
	ldr r0, [r7]
	ldr r0, [r0]
	adds r1, r6, #0
	bl GetUnitSupporterCharacter
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl GetCharacterData
	ldrh r0, [r0]
	bl GetStringFromIndex
	adds r3, r0, #0
	lsls r0, r4, #3
	ldr r1, _08092B64  @ gUnknown_0200E098
	adds r0, r0, r1
	ldr r1, [sp, #0x44]
	adds r0, r1, r0
	lsls r1, r4, #1
	adds r1, r1, r4
	lsls r1, r1, #2
	adds r1, #0x12
	ldr r2, [sp, #0x48]
	adds r1, r2, r1
	movs r2, #0
	str r2, [sp]
	str r3, [sp, #4]
	movs r2, #1
	movs r3, #0
	bl DrawTextInline
_08092B56:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #3
	beq _08092B7E
	b _08092B72
	.align 2, 0
_08092B64: .4byte gUnknown_0200E098
_08092B68:
	ldr r0, [sp, #0x3c]
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0x3c]
_08092B72:
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldr r3, [sp, #0x40]
	cmp r6, r3
	blt _08092A92
_08092B7E:
	cmp r4, #2
	bhi _08092BC6
	ldr r6, [sp, #0x50]
	ldr r1, [sp, #0x2c]
	adds r0, r6, r1
	lsls r5, r0, #3
	ldr r7, [sp, #0x54]
	add r7, sl
	mov r2, r9
	negs r6, r2
	orrs r6, r2
_08092B94:
	ldr r0, _08092BDC  @ 0x00000536
	bl GetStringFromIndex
	adds r3, r0, #0
	lsls r0, r4, #3
	ldr r1, _08092BE0  @ gUnknown_0200E098
	adds r0, r0, r1
	adds r0, r5, r0
	lsls r1, r4, #1
	adds r1, r1, r4
	lsls r1, r1, #2
	adds r1, #0x12
	adds r1, r7, r1
	movs r2, #0
	str r2, [sp]
	str r3, [sp, #4]
	lsrs r2, r6, #0x1f
	movs r3, #0
	bl DrawTextInline
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #2
	bls _08092B94
_08092BC6:
	movs r0, #1
	bl BG_EnableSyncByMask
	add sp, #0x58
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08092BDC: .4byte 0x00000536
_08092BE0: .4byte gUnknown_0200E098

	THUMB_FUNC_END sub_80922F0

	THUMB_FUNC_START sub_8092BE4
sub_8092BE4: @ 0x08092BE4
	ldr r0, [r0, #0xc]
	movs r1, #0xc0
	lsls r1, r1, #8
	ands r0, r1
	bx lr

	THUMB_FUNC_END sub_8092BE4

	THUMB_FUNC_START sub_8092BF0
sub_8092BF0: @ 0x08092BF0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x60
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r2, r1, #0x18
	movs r1, #1
	ands r2, r1
	subs r0, #1
	cmp r0, #0x1f
	bls _08092C12
	bl _08094FE0
_08092C12:
	lsls r0, r0, #2
	ldr r1, _08092C1C  @ _08092C20
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08092C1C: .4byte _08092C20
_08092C20: @ jump table
	.4byte _08092CA0 @ case 0
	.4byte _08092F90 @ case 1
	.4byte _08092E84 @ case 2
	.4byte _08093094 @ case 3
	.4byte _08093190 @ case 4
	.4byte _0809329C @ case 5
	.4byte _080933A8 @ case 6
	.4byte _080934B4 @ case 7
	.4byte _080935C0 @ case 8
	.4byte _080936CC @ case 9
	.4byte _080937D8 @ case 10
	.4byte _080938E4 @ case 11
	.4byte _08093C58 @ case 12
	.4byte _08093D64 @ case 13
	.4byte _08093F68 @ case 14
	.4byte _0809405C @ case 15
	.4byte _08094150 @ case 16
	.4byte _08094244 @ case 17
	.4byte _080939F0 @ case 18
	.4byte _08093B4C @ case 19
	.4byte _08094374 @ case 20
	.4byte _08094480 @ case 21
	.4byte _08094608 @ case 22
	.4byte _0809470C @ case 23
	.4byte _08094808 @ case 24
	.4byte _08094904 @ case 25
	.4byte _08094A00 @ case 26
	.4byte _08094AFC @ case 27
	.4byte _08094BF8 @ case 28
	.4byte _08094CF4 @ case 29
	.4byte _08094DF0 @ case 30
	.4byte _08094EDC @ case 31
_08092CA0:
	cmp r2, #0
	bne _08092D94
	movs r0, #0
	str r0, [sp, #0x40]
	movs r1, #0
	ldr r3, _08092D8C  @ gUnknown_0200F158
	mov ip, r3
	ldrb r0, [r3]
	subs r0, #1
	cmp r2, r0
	bge _08092D16
	adds r7, r3, #0
	mov sl, r7
_08092CBA:
	movs r3, #0
	mov r2, sl
	ldrb r0, [r2]
	adds r1, #1
	subs r0, r0, r1
	mov r8, r1
	cmp r3, r0
	bge _08092D06
	ldr r7, _08092D90  @ gUnknown_0200D6E0
	mov r9, r7
_08092CCE:
	adds r7, r3, #1
	lsls r0, r7, #2
	mov r1, r9
	adds r6, r0, r1
	ldr r5, [r6]
	ldr r0, [r5]
	ldr r2, [r0]
	lsls r0, r3, #2
	adds r4, r0, r1
	ldr r3, [r4]
	ldr r0, [r3]
	ldr r1, [r0]
	ldrb r0, [r2, #0xa]
	ldrb r1, [r1, #0xa]
	cmp r0, r1
	bcs _08092CF6
	str r5, [r4]
	str r3, [r6]
	movs r2, #1
	str r2, [sp, #0x40]
_08092CF6:
	lsls r0, r7, #0x18
	lsrs r3, r0, #0x18
	mov r7, sl
	ldrb r0, [r7]
	mov r1, r8
	subs r0, r0, r1
	cmp r3, r0
	blt _08092CCE
_08092D06:
	mov r2, r8
	lsls r0, r2, #0x18
	lsrs r1, r0, #0x18
	mov r3, ip
	ldrb r0, [r3]
	subs r0, #1
	cmp r1, r0
	blt _08092CBA
_08092D16:
	movs r1, #0
	ldr r7, _08092D8C  @ gUnknown_0200F158
	ldrb r0, [r7]
	subs r0, #1
	cmp r1, r0
	bge _08092D86
	mov sl, r7
_08092D24:
	movs r3, #0
	mov r2, sl
	ldrb r0, [r2]
	adds r1, #1
	subs r0, r0, r1
	mov r8, r1
	cmp r3, r0
	bge _08092D76
	ldr r7, _08092D90  @ gUnknown_0200D6E0
	mov r9, r7
	movs r7, #2
	mov ip, r8
_08092D3C:
	adds r6, r3, #1
	lsls r0, r6, #2
	mov r1, r9
	adds r5, r0, r1
	ldr r4, [r5]
	ldr r0, [r4]
	ldr r1, [r0, #0xc]
	ands r1, r7
	lsls r0, r3, #2
	mov r2, r9
	adds r3, r0, r2
	ldr r2, [r3]
	ldr r0, [r2]
	ldr r0, [r0, #0xc]
	ands r0, r7
	cmp r1, r0
	bcs _08092D66
	str r4, [r3]
	str r2, [r5]
	movs r3, #1
	str r3, [sp, #0x40]
_08092D66:
	lsls r0, r6, #0x18
	lsrs r3, r0, #0x18
	mov r1, sl
	ldrb r0, [r1]
	mov r2, ip
	subs r0, r0, r2
	cmp r3, r0
	blt _08092D3C
_08092D76:
	mov r3, r8
	lsls r0, r3, #0x18
	lsrs r1, r0, #0x18
	ldr r7, _08092D8C  @ gUnknown_0200F158
	ldrb r0, [r7]
	subs r0, #1
	cmp r1, r0
	blt _08092D24
_08092D86:
	ldr r0, [sp, #0x40]
	bl _080945F2
	.align 2, 0
_08092D8C: .4byte gUnknown_0200F158
_08092D90: .4byte gUnknown_0200D6E0
_08092D94:
	movs r1, #0
	str r1, [sp, #0x44]
	ldr r2, _08092E7C  @ gUnknown_0200F158
	mov ip, r2
	ldrb r0, [r2]
	subs r0, #1
	adds r3, r1, #0
	cmp r3, r0
	bge _08092E06
	adds r7, r2, #0
	mov sl, r7
_08092DAA:
	movs r3, #0
	mov r2, sl
	ldrb r0, [r2]
	adds r1, #1
	subs r0, r0, r1
	mov r8, r1
	cmp r3, r0
	bge _08092DF6
	ldr r7, _08092E80  @ gUnknown_0200D6E0
	mov r9, r7
_08092DBE:
	adds r7, r3, #1
	lsls r0, r7, #2
	mov r1, r9
	adds r6, r0, r1
	ldr r5, [r6]
	ldr r0, [r5]
	ldr r2, [r0]
	lsls r0, r3, #2
	adds r4, r0, r1
	ldr r3, [r4]
	ldr r0, [r3]
	ldr r1, [r0]
	ldrb r0, [r2, #0xa]
	ldrb r1, [r1, #0xa]
	cmp r0, r1
	bls _08092DE6
	str r5, [r4]
	str r3, [r6]
	movs r2, #1
	str r2, [sp, #0x44]
_08092DE6:
	lsls r0, r7, #0x18
	lsrs r3, r0, #0x18
	mov r7, sl
	ldrb r0, [r7]
	mov r1, r8
	subs r0, r0, r1
	cmp r3, r0
	blt _08092DBE
_08092DF6:
	mov r2, r8
	lsls r0, r2, #0x18
	lsrs r1, r0, #0x18
	mov r3, ip
	ldrb r0, [r3]
	subs r0, #1
	cmp r1, r0
	blt _08092DAA
_08092E06:
	movs r1, #0
	ldr r7, _08092E7C  @ gUnknown_0200F158
	ldrb r0, [r7]
	subs r0, #1
	cmp r1, r0
	bge _08092E76
	mov sl, r7
_08092E14:
	movs r3, #0
	mov r2, sl
	ldrb r0, [r2]
	adds r1, #1
	subs r0, r0, r1
	mov r8, r1
	cmp r3, r0
	bge _08092E66
	ldr r7, _08092E80  @ gUnknown_0200D6E0
	mov r9, r7
	movs r7, #2
	mov ip, r8
_08092E2C:
	adds r6, r3, #1
	lsls r0, r6, #2
	mov r1, r9
	adds r5, r0, r1
	ldr r4, [r5]
	ldr r0, [r4]
	ldr r1, [r0, #0xc]
	ands r1, r7
	lsls r0, r3, #2
	mov r2, r9
	adds r3, r0, r2
	ldr r2, [r3]
	ldr r0, [r2]
	ldr r0, [r0, #0xc]
	ands r0, r7
	cmp r1, r0
	bls _08092E56
	str r4, [r3]
	str r2, [r5]
	movs r3, #1
	str r3, [sp, #0x44]
_08092E56:
	lsls r0, r6, #0x18
	lsrs r3, r0, #0x18
	mov r1, sl
	ldrb r0, [r1]
	mov r2, ip
	subs r0, r0, r2
	cmp r3, r0
	blt _08092E2C
_08092E66:
	mov r3, r8
	lsls r0, r3, #0x18
	lsrs r1, r0, #0x18
	ldr r7, _08092E7C  @ gUnknown_0200F158
	ldrb r0, [r7]
	subs r0, #1
	cmp r1, r0
	blt _08092E14
_08092E76:
	ldr r0, [sp, #0x44]
	bl _080945F2
	.align 2, 0
_08092E7C: .4byte gUnknown_0200F158
_08092E80: .4byte gUnknown_0200D6E0
_08092E84:
	cmp r2, #0
	bne _08092F0C
	movs r1, #0
	mov sl, r1
	ldr r3, _08092F04  @ gUnknown_0200F158
	mov ip, r3
	ldrb r0, [r3]
	subs r0, #1
	cmp r2, r0
	blt _08092E9C
	bl _08094EC8
_08092E9C:
	adds r7, r3, #0
	mov r9, r7
_08092EA0:
	movs r2, #0
	mov r3, r9
	ldrb r0, [r3]
	adds r1, #1
	subs r0, r0, r1
	adds r7, r1, #0
	cmp r2, r0
	bge _08092EF0
	ldr r0, _08092F08  @ gUnknown_0200D6E0
	mov r8, r0
_08092EB4:
	adds r6, r2, #1
	lsls r0, r6, #2
	mov r1, r8
	adds r5, r0, r1
	ldr r4, [r5]
	ldr r1, [r4]
	lsls r0, r2, #2
	mov r3, r8
	adds r2, r0, r3
	ldr r3, [r2]
	ldr r0, [r3]
	ldrb r1, [r1, #8]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	ldrb r0, [r0, #8]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r1, r0
	ble _08092EE2
	str r4, [r2]
	str r3, [r5]
	movs r0, #1
	mov sl, r0
_08092EE2:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r1, r9
	ldrb r0, [r1]
	subs r0, r0, r7
	cmp r2, r0
	blt _08092EB4
_08092EF0:
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	mov r2, ip
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt _08092EA0
	bl _08094EC8
	.align 2, 0
_08092F04: .4byte gUnknown_0200F158
_08092F08: .4byte gUnknown_0200D6E0
_08092F0C:
	movs r7, #0
	mov sl, r7
	movs r1, #0
	ldr r0, _08092F88  @ gUnknown_0200F158
	mov ip, r0
	ldrb r0, [r0]
	subs r0, #1
	cmp sl, r0
	blt _08092F22
	bl _08094EC8
_08092F22:
	ldr r2, _08092F88  @ gUnknown_0200F158
	mov r9, r2
_08092F26:
	movs r2, #0
	mov r3, r9
	ldrb r0, [r3]
	adds r1, #1
	subs r0, r0, r1
	adds r7, r1, #0
	cmp r2, r0
	bge _08092F76
	ldr r0, _08092F8C  @ gUnknown_0200D6E0
	mov r8, r0
_08092F3A:
	adds r6, r2, #1
	lsls r0, r6, #2
	mov r1, r8
	adds r5, r0, r1
	ldr r4, [r5]
	ldr r1, [r4]
	lsls r0, r2, #2
	mov r3, r8
	adds r2, r0, r3
	ldr r3, [r2]
	ldr r0, [r3]
	ldrb r1, [r1, #8]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	ldrb r0, [r0, #8]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r1, r0
	bge _08092F68
	str r4, [r2]
	str r3, [r5]
	movs r0, #1
	mov sl, r0
_08092F68:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r1, r9
	ldrb r0, [r1]
	subs r0, r0, r7
	cmp r2, r0
	blt _08092F3A
_08092F76:
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	mov r2, ip
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt _08092F26
	bl _08094EC8
	.align 2, 0
_08092F88: .4byte gUnknown_0200F158
_08092F8C: .4byte gUnknown_0200D6E0
_08092F90:
	cmp r2, #0
	bne _08093014
	movs r7, #0
	mov ip, r7
	movs r1, #0
	ldr r3, _0809300C  @ gUnknown_0200F158
	ldrb r0, [r3]
	subs r0, #1
	cmp r2, r0
	blt _08092FA8
	bl _0809435C
_08092FA8:
	adds r7, r3, #0
	mov sl, r7
_08092FAC:
	movs r3, #0
	mov r2, sl
	ldrb r0, [r2]
	adds r1, #1
	subs r0, r0, r1
	mov r8, r1
	cmp r3, r0
	bge _08092FF8
	ldr r7, _08093010  @ gUnknown_0200D6E0
	mov r9, r7
_08092FC0:
	adds r7, r3, #1
	lsls r0, r7, #2
	mov r1, r9
	adds r6, r0, r1
	ldr r5, [r6]
	ldr r0, [r5]
	ldr r2, [r0, #4]
	lsls r0, r3, #2
	adds r3, r0, r1
	ldr r4, [r3]
	ldr r0, [r4]
	ldr r1, [r0, #4]
	ldrb r0, [r2, #0xa]
	ldrb r1, [r1, #0xa]
	cmp r0, r1
	bcs _08092FE8
	str r5, [r3]
	str r4, [r6]
	movs r2, #1
	mov ip, r2
_08092FE8:
	lsls r0, r7, #0x18
	lsrs r3, r0, #0x18
	mov r7, sl
	ldrb r0, [r7]
	mov r1, r8
	subs r0, r0, r1
	cmp r3, r0
	blt _08092FC0
_08092FF8:
	mov r2, r8
	lsls r0, r2, #0x18
	lsrs r1, r0, #0x18
	ldr r3, _0809300C  @ gUnknown_0200F158
	ldrb r0, [r3]
	subs r0, #1
	cmp r1, r0
	blt _08092FAC
	bl _0809435C
	.align 2, 0
_0809300C: .4byte gUnknown_0200F158
_08093010: .4byte gUnknown_0200D6E0
_08093014:
	movs r0, #0
	mov ip, r0
	movs r1, #0
	ldr r2, _0809308C  @ gUnknown_0200F158
	ldrb r0, [r2]
	subs r0, #1
	cmp ip, r0
	blt _08093028
	bl _0809435C
_08093028:
	adds r3, r2, #0
	mov sl, r3
_0809302C:
	movs r3, #0
	mov r7, sl
	ldrb r0, [r7]
	adds r1, #1
	subs r0, r0, r1
	mov r8, r1
	cmp r3, r0
	bge _08093078
	ldr r0, _08093090  @ gUnknown_0200D6E0
	mov r9, r0
_08093040:
	adds r7, r3, #1
	lsls r0, r7, #2
	mov r1, r9
	adds r6, r0, r1
	ldr r5, [r6]
	ldr r0, [r5]
	ldr r2, [r0, #4]
	lsls r0, r3, #2
	adds r3, r0, r1
	ldr r4, [r3]
	ldr r0, [r4]
	ldr r1, [r0, #4]
	ldrb r0, [r2, #0xa]
	ldrb r1, [r1, #0xa]
	cmp r0, r1
	bls _08093068
	str r5, [r3]
	str r4, [r6]
	movs r2, #1
	mov ip, r2
_08093068:
	lsls r0, r7, #0x18
	lsrs r3, r0, #0x18
	mov r7, sl
	ldrb r0, [r7]
	mov r1, r8
	subs r0, r0, r1
	cmp r3, r0
	blt _08093040
_08093078:
	mov r2, r8
	lsls r0, r2, #0x18
	lsrs r1, r0, #0x18
	ldr r3, _0809308C  @ gUnknown_0200F158
	ldrb r0, [r3]
	subs r0, #1
	cmp r1, r0
	blt _0809302C
	bl _0809435C
	.align 2, 0
_0809308C: .4byte gUnknown_0200F158
_08093090: .4byte gUnknown_0200D6E0
_08093094:
	cmp r2, #0
	bne _08093114
	movs r0, #0
	mov ip, r0
	movs r1, #0
	ldr r3, _0809310C  @ gUnknown_0200F158
	ldrb r0, [r3]
	subs r0, #1
	cmp r2, r0
	blt _080930AC
	bl _0809435C
_080930AC:
	adds r7, r3, #0
	mov sl, r7
_080930B0:
	movs r3, #0
	mov r2, sl
	ldrb r0, [r2]
	adds r1, #1
	subs r0, r0, r1
	mov r8, r1
	cmp r3, r0
	bge _080930F8
	ldr r7, _08093110  @ gUnknown_0200D6E0
	mov r9, r7
_080930C4:
	adds r7, r3, #1
	lsls r0, r7, #2
	mov r1, r9
	adds r6, r0, r1
	ldr r5, [r6]
	ldr r2, [r5]
	lsls r0, r3, #2
	adds r3, r0, r1
	ldr r4, [r3]
	ldr r1, [r4]
	ldrb r0, [r2, #9]
	ldrb r1, [r1, #9]
	cmp r0, r1
	bls _080930E8
	str r5, [r3]
	str r4, [r6]
	movs r2, #1
	mov ip, r2
_080930E8:
	lsls r0, r7, #0x18
	lsrs r3, r0, #0x18
	mov r7, sl
	ldrb r0, [r7]
	mov r1, r8
	subs r0, r0, r1
	cmp r3, r0
	blt _080930C4
_080930F8:
	mov r2, r8
	lsls r0, r2, #0x18
	lsrs r1, r0, #0x18
	ldr r3, _0809310C  @ gUnknown_0200F158
	ldrb r0, [r3]
	subs r0, #1
	cmp r1, r0
	blt _080930B0
	bl _0809435C
	.align 2, 0
_0809310C: .4byte gUnknown_0200F158
_08093110: .4byte gUnknown_0200D6E0
_08093114:
	movs r0, #0
	mov ip, r0
	movs r1, #0
	ldr r2, _08093188  @ gUnknown_0200F158
	ldrb r0, [r2]
	subs r0, #1
	cmp ip, r0
	blt _08093128
	bl _0809435C
_08093128:
	adds r3, r2, #0
	mov sl, r3
_0809312C:
	movs r3, #0
	mov r7, sl
	ldrb r0, [r7]
	adds r1, #1
	subs r0, r0, r1
	mov r8, r1
	cmp r3, r0
	bge _08093174
	ldr r0, _0809318C  @ gUnknown_0200D6E0
	mov r9, r0
_08093140:
	adds r7, r3, #1
	lsls r0, r7, #2
	mov r1, r9
	adds r6, r0, r1
	ldr r5, [r6]
	ldr r2, [r5]
	lsls r0, r3, #2
	adds r3, r0, r1
	ldr r4, [r3]
	ldr r1, [r4]
	ldrb r0, [r2, #9]
	ldrb r1, [r1, #9]
	cmp r0, r1
	bcs _08093164
	str r5, [r3]
	str r4, [r6]
	movs r2, #1
	mov ip, r2
_08093164:
	lsls r0, r7, #0x18
	lsrs r3, r0, #0x18
	mov r7, sl
	ldrb r0, [r7]
	mov r1, r8
	subs r0, r0, r1
	cmp r3, r0
	blt _08093140
_08093174:
	mov r2, r8
	lsls r0, r2, #0x18
	lsrs r1, r0, #0x18
	ldr r3, _08093188  @ gUnknown_0200F158
	ldrb r0, [r3]
	subs r0, #1
	cmp r1, r0
	blt _0809312C
	bl _0809435C
	.align 2, 0
_08093188: .4byte gUnknown_0200F158
_0809318C: .4byte gUnknown_0200D6E0
_08093190:
	cmp r2, #0
	bne _08093218
	movs r0, #0
	mov sl, r0
	movs r1, #0
	ldr r3, _08093210  @ gUnknown_0200F158
	ldrb r0, [r3]
	subs r0, #1
	cmp r2, r0
	blt _080931A8
	bl _08094EC8
_080931A8:
	movs r5, #0
	ldrb r0, [r3]
	adds r1, #1
	subs r0, r0, r1
	mov r8, r1
	cmp r5, r0
	bge _080931FA
	ldr r1, _08093214  @ gUnknown_0200D6E0
	mov r9, r1
_080931BA:
	adds r7, r5, #1
	lsls r0, r7, #2
	mov r2, r9
	adds r6, r0, r2
	ldr r0, [r6]
	ldr r0, [r0]
	bl GetUnitCurrentHp
	adds r4, r0, #0
	lsls r0, r5, #2
	mov r3, r9
	adds r5, r0, r3
	ldr r0, [r5]
	ldr r0, [r0]
	bl GetUnitCurrentHp
	cmp r4, r0
	ble _080931EA
	ldr r1, [r5]
	ldr r0, [r6]
	str r0, [r5]
	str r1, [r6]
	movs r0, #1
	mov sl, r0
_080931EA:
	lsls r0, r7, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _08093210  @ gUnknown_0200F158
	ldrb r0, [r0]
	mov r1, r8
	subs r0, r0, r1
	cmp r5, r0
	blt _080931BA
_080931FA:
	mov r2, r8
	lsls r0, r2, #0x18
	lsrs r1, r0, #0x18
	ldr r3, _08093210  @ gUnknown_0200F158
	ldrb r0, [r3]
	subs r0, #1
	cmp r1, r0
	blt _080931A8
	bl _08094EC8
	.align 2, 0
_08093210: .4byte gUnknown_0200F158
_08093214: .4byte gUnknown_0200D6E0
_08093218:
	movs r7, #0
	mov sl, r7
	movs r1, #0
	ldr r2, _08093294  @ gUnknown_0200F158
	ldrb r0, [r2]
	subs r0, #1
	cmp sl, r0
	blt _0809322C
	bl _08094FCE
_0809322C:
	movs r5, #0
	ldrb r0, [r2]
	adds r1, #1
	subs r0, r0, r1
	mov r8, r1
	cmp r5, r0
	bge _0809327E
	ldr r0, _08093298  @ gUnknown_0200D6E0
	mov r9, r0
_0809323E:
	adds r7, r5, #1
	lsls r0, r7, #2
	mov r1, r9
	adds r6, r0, r1
	ldr r0, [r6]
	ldr r0, [r0]
	bl GetUnitCurrentHp
	adds r4, r0, #0
	lsls r0, r5, #2
	mov r2, r9
	adds r5, r0, r2
	ldr r0, [r5]
	ldr r0, [r0]
	bl GetUnitCurrentHp
	cmp r4, r0
	bge _0809326E
	ldr r1, [r5]
	ldr r0, [r6]
	str r0, [r5]
	str r1, [r6]
	movs r3, #1
	mov sl, r3
_0809326E:
	lsls r0, r7, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _08093294  @ gUnknown_0200F158
	ldrb r0, [r0]
	mov r7, r8
	subs r0, r0, r7
	cmp r5, r0
	blt _0809323E
_0809327E:
	mov r1, r8
	lsls r0, r1, #0x18
	lsrs r1, r0, #0x18
	ldr r2, _08093294  @ gUnknown_0200F158
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt _0809322C
	bl _08094FCE
	.align 2, 0
_08093294: .4byte gUnknown_0200F158
_08093298: .4byte gUnknown_0200D6E0
_0809329C:
	cmp r2, #0
	bne _08093324
	movs r3, #0
	mov sl, r3
	movs r1, #0
	ldr r3, _0809331C  @ gUnknown_0200F158
	ldrb r0, [r3]
	subs r0, #1
	cmp r2, r0
	blt _080932B4
	bl _08094FCE
_080932B4:
	movs r5, #0
	ldrb r0, [r3]
	adds r1, #1
	subs r0, r0, r1
	mov r8, r1
	cmp r5, r0
	bge _08093306
	ldr r7, _08093320  @ gUnknown_0200D6E0
	mov r9, r7
_080932C6:
	adds r7, r5, #1
	lsls r0, r7, #2
	mov r1, r9
	adds r6, r0, r1
	ldr r0, [r6]
	ldr r0, [r0]
	bl GetUnitMaxHp
	adds r4, r0, #0
	lsls r0, r5, #2
	mov r2, r9
	adds r5, r0, r2
	ldr r0, [r5]
	ldr r0, [r0]
	bl GetUnitMaxHp
	cmp r4, r0
	ble _080932F6
	ldr r1, [r5]
	ldr r0, [r6]
	str r0, [r5]
	str r1, [r6]
	movs r3, #1
	mov sl, r3
_080932F6:
	lsls r0, r7, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _0809331C  @ gUnknown_0200F158
	ldrb r0, [r0]
	mov r7, r8
	subs r0, r0, r7
	cmp r5, r0
	blt _080932C6
_08093306:
	mov r1, r8
	lsls r0, r1, #0x18
	lsrs r1, r0, #0x18
	ldr r3, _0809331C  @ gUnknown_0200F158
	ldrb r0, [r3]
	subs r0, #1
	cmp r1, r0
	blt _080932B4
	bl _08094FCE
	.align 2, 0
_0809331C: .4byte gUnknown_0200F158
_08093320: .4byte gUnknown_0200D6E0
_08093324:
	movs r3, #0
	mov sl, r3
	movs r1, #0
	ldr r2, _080933A0  @ gUnknown_0200F158
	ldrb r0, [r2]
	subs r0, #1
	cmp sl, r0
	blt _08093338
	bl _08094FCE
_08093338:
	movs r5, #0
	ldrb r0, [r2]
	adds r1, #1
	subs r0, r0, r1
	mov r8, r1
	cmp r5, r0
	bge _0809338A
	ldr r7, _080933A4  @ gUnknown_0200D6E0
	mov r9, r7
_0809334A:
	adds r7, r5, #1
	lsls r0, r7, #2
	mov r1, r9
	adds r6, r0, r1
	ldr r0, [r6]
	ldr r0, [r0]
	bl GetUnitMaxHp
	adds r4, r0, #0
	lsls r0, r5, #2
	mov r2, r9
	adds r5, r0, r2
	ldr r0, [r5]
	ldr r0, [r0]
	bl GetUnitMaxHp
	cmp r4, r0
	bge _0809337A
	ldr r1, [r5]
	ldr r0, [r6]
	str r0, [r5]
	str r1, [r6]
	movs r3, #1
	mov sl, r3
_0809337A:
	lsls r0, r7, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _080933A0  @ gUnknown_0200F158
	ldrb r0, [r0]
	mov r7, r8
	subs r0, r0, r7
	cmp r5, r0
	blt _0809334A
_0809338A:
	mov r1, r8
	lsls r0, r1, #0x18
	lsrs r1, r0, #0x18
	ldr r2, _080933A0  @ gUnknown_0200F158
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt _08093338
	bl _08094FCE
	.align 2, 0
_080933A0: .4byte gUnknown_0200F158
_080933A4: .4byte gUnknown_0200D6E0
_080933A8:
	cmp r2, #0
	bne _08093430
	movs r3, #0
	mov sl, r3
	movs r1, #0
	ldr r3, _08093428  @ gUnknown_0200F158
	ldrb r0, [r3]
	subs r0, #1
	cmp r2, r0
	blt _080933C0
	bl _08094FCE
_080933C0:
	movs r5, #0
	ldrb r0, [r3]
	adds r1, #1
	subs r0, r0, r1
	mov r8, r1
	cmp r5, r0
	bge _08093412
	ldr r7, _0809342C  @ gUnknown_0200D6E0
	mov r9, r7
_080933D2:
	adds r7, r5, #1
	lsls r0, r7, #2
	mov r1, r9
	adds r6, r0, r1
	ldr r0, [r6]
	ldr r0, [r0]
	bl GetUnitPower
	adds r4, r0, #0
	lsls r0, r5, #2
	mov r2, r9
	adds r5, r0, r2
	ldr r0, [r5]
	ldr r0, [r0]
	bl GetUnitPower
	cmp r4, r0
	ble _08093402
	ldr r1, [r5]
	ldr r0, [r6]
	str r0, [r5]
	str r1, [r6]
	movs r3, #1
	mov sl, r3
_08093402:
	lsls r0, r7, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _08093428  @ gUnknown_0200F158
	ldrb r0, [r0]
	mov r7, r8
	subs r0, r0, r7
	cmp r5, r0
	blt _080933D2
_08093412:
	mov r1, r8
	lsls r0, r1, #0x18
	lsrs r1, r0, #0x18
	ldr r3, _08093428  @ gUnknown_0200F158
	ldrb r0, [r3]
	subs r0, #1
	cmp r1, r0
	blt _080933C0
	bl _08094FCE
	.align 2, 0
_08093428: .4byte gUnknown_0200F158
_0809342C: .4byte gUnknown_0200D6E0
_08093430:
	movs r3, #0
	mov sl, r3
	movs r1, #0
	ldr r2, _080934AC  @ gUnknown_0200F158
	ldrb r0, [r2]
	subs r0, #1
	cmp sl, r0
	blt _08093444
	bl _08094FCE
_08093444:
	movs r5, #0
	ldrb r0, [r2]
	adds r1, #1
	subs r0, r0, r1
	mov r8, r1
	cmp r5, r0
	bge _08093496
	ldr r7, _080934B0  @ gUnknown_0200D6E0
	mov r9, r7
_08093456:
	adds r7, r5, #1
	lsls r0, r7, #2
	mov r1, r9
	adds r6, r0, r1
	ldr r0, [r6]
	ldr r0, [r0]
	bl GetUnitPower
	adds r4, r0, #0
	lsls r0, r5, #2
	mov r2, r9
	adds r5, r0, r2
	ldr r0, [r5]
	ldr r0, [r0]
	bl GetUnitPower
	cmp r4, r0
	bge _08093486
	ldr r1, [r5]
	ldr r0, [r6]
	str r0, [r5]
	str r1, [r6]
	movs r3, #1
	mov sl, r3
_08093486:
	lsls r0, r7, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _080934AC  @ gUnknown_0200F158
	ldrb r0, [r0]
	mov r7, r8
	subs r0, r0, r7
	cmp r5, r0
	blt _08093456
_08093496:
	mov r1, r8
	lsls r0, r1, #0x18
	lsrs r1, r0, #0x18
	ldr r2, _080934AC  @ gUnknown_0200F158
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt _08093444
	bl _08094FCE
	.align 2, 0
_080934AC: .4byte gUnknown_0200F158
_080934B0: .4byte gUnknown_0200D6E0
_080934B4:
	cmp r2, #0
	bne _0809353C
	movs r3, #0
	mov sl, r3
	movs r1, #0
	ldr r3, _08093534  @ gUnknown_0200F158
	ldrb r0, [r3]
	subs r0, #1
	cmp r2, r0
	blt _080934CC
	bl _08094FCE
_080934CC:
	movs r5, #0
	ldrb r0, [r3]
	adds r1, #1
	subs r0, r0, r1
	mov r8, r1
	cmp r5, r0
	bge _0809351E
	ldr r7, _08093538  @ gUnknown_0200D6E0
	mov r9, r7
_080934DE:
	adds r7, r5, #1
	lsls r0, r7, #2
	mov r1, r9
	adds r6, r0, r1
	ldr r0, [r6]
	ldr r0, [r0]
	bl GetUnitSkill
	adds r4, r0, #0
	lsls r0, r5, #2
	mov r2, r9
	adds r5, r0, r2
	ldr r0, [r5]
	ldr r0, [r0]
	bl GetUnitSkill
	cmp r4, r0
	ble _0809350E
	ldr r1, [r5]
	ldr r0, [r6]
	str r0, [r5]
	str r1, [r6]
	movs r3, #1
	mov sl, r3
_0809350E:
	lsls r0, r7, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _08093534  @ gUnknown_0200F158
	ldrb r0, [r0]
	mov r7, r8
	subs r0, r0, r7
	cmp r5, r0
	blt _080934DE
_0809351E:
	mov r1, r8
	lsls r0, r1, #0x18
	lsrs r1, r0, #0x18
	ldr r3, _08093534  @ gUnknown_0200F158
	ldrb r0, [r3]
	subs r0, #1
	cmp r1, r0
	blt _080934CC
	bl _08094FCE
	.align 2, 0
_08093534: .4byte gUnknown_0200F158
_08093538: .4byte gUnknown_0200D6E0
_0809353C:
	movs r3, #0
	mov sl, r3
	movs r1, #0
	ldr r2, _080935B8  @ gUnknown_0200F158
	ldrb r0, [r2]
	subs r0, #1
	cmp sl, r0
	blt _08093550
	bl _08094FCE
_08093550:
	movs r5, #0
	ldrb r0, [r2]
	adds r1, #1
	subs r0, r0, r1
	mov r8, r1
	cmp r5, r0
	bge _080935A2
	ldr r7, _080935BC  @ gUnknown_0200D6E0
	mov r9, r7
_08093562:
	adds r7, r5, #1
	lsls r0, r7, #2
	mov r1, r9
	adds r6, r0, r1
	ldr r0, [r6]
	ldr r0, [r0]
	bl GetUnitSkill
	adds r4, r0, #0
	lsls r0, r5, #2
	mov r2, r9
	adds r5, r0, r2
	ldr r0, [r5]
	ldr r0, [r0]
	bl GetUnitSkill
	cmp r4, r0
	bge _08093592
	ldr r1, [r5]
	ldr r0, [r6]
	str r0, [r5]
	str r1, [r6]
	movs r3, #1
	mov sl, r3
_08093592:
	lsls r0, r7, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _080935B8  @ gUnknown_0200F158
	ldrb r0, [r0]
	mov r7, r8
	subs r0, r0, r7
	cmp r5, r0
	blt _08093562
_080935A2:
	mov r1, r8
	lsls r0, r1, #0x18
	lsrs r1, r0, #0x18
	ldr r2, _080935B8  @ gUnknown_0200F158
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt _08093550
	bl _08094FCE
	.align 2, 0
_080935B8: .4byte gUnknown_0200F158
_080935BC: .4byte gUnknown_0200D6E0
_080935C0:
	cmp r2, #0
	bne _08093648
	movs r3, #0
	mov sl, r3
	movs r1, #0
	ldr r3, _08093640  @ gUnknown_0200F158
	ldrb r0, [r3]
	subs r0, #1
	cmp r2, r0
	blt _080935D8
	bl _08094FCE
_080935D8:
	movs r5, #0
	ldrb r0, [r3]
	adds r1, #1
	subs r0, r0, r1
	mov r8, r1
	cmp r5, r0
	bge _0809362A
	ldr r7, _08093644  @ gUnknown_0200D6E0
	mov r9, r7
_080935EA:
	adds r7, r5, #1
	lsls r0, r7, #2
	mov r1, r9
	adds r6, r0, r1
	ldr r0, [r6]
	ldr r0, [r0]
	bl GetUnitSpeed
	adds r4, r0, #0
	lsls r0, r5, #2
	mov r2, r9
	adds r5, r0, r2
	ldr r0, [r5]
	ldr r0, [r0]
	bl GetUnitSpeed
	cmp r4, r0
	ble _0809361A
	ldr r1, [r5]
	ldr r0, [r6]
	str r0, [r5]
	str r1, [r6]
	movs r3, #1
	mov sl, r3
_0809361A:
	lsls r0, r7, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _08093640  @ gUnknown_0200F158
	ldrb r0, [r0]
	mov r7, r8
	subs r0, r0, r7
	cmp r5, r0
	blt _080935EA
_0809362A:
	mov r1, r8
	lsls r0, r1, #0x18
	lsrs r1, r0, #0x18
	ldr r3, _08093640  @ gUnknown_0200F158
	ldrb r0, [r3]
	subs r0, #1
	cmp r1, r0
	blt _080935D8
	bl _08094FCE
	.align 2, 0
_08093640: .4byte gUnknown_0200F158
_08093644: .4byte gUnknown_0200D6E0
_08093648:
	movs r3, #0
	mov sl, r3
	movs r1, #0
	ldr r2, _080936C4  @ gUnknown_0200F158
	ldrb r0, [r2]
	subs r0, #1
	cmp sl, r0
	blt _0809365C
	bl _08094FCE
_0809365C:
	movs r5, #0
	ldrb r0, [r2]
	adds r1, #1
	subs r0, r0, r1
	mov r8, r1
	cmp r5, r0
	bge _080936AE
	ldr r7, _080936C8  @ gUnknown_0200D6E0
	mov r9, r7
_0809366E:
	adds r7, r5, #1
	lsls r0, r7, #2
	mov r1, r9
	adds r6, r0, r1
	ldr r0, [r6]
	ldr r0, [r0]
	bl GetUnitSpeed
	adds r4, r0, #0
	lsls r0, r5, #2
	mov r2, r9
	adds r5, r0, r2
	ldr r0, [r5]
	ldr r0, [r0]
	bl GetUnitSpeed
	cmp r4, r0
	bge _0809369E
	ldr r1, [r5]
	ldr r0, [r6]
	str r0, [r5]
	str r1, [r6]
	movs r3, #1
	mov sl, r3
_0809369E:
	lsls r0, r7, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _080936C4  @ gUnknown_0200F158
	ldrb r0, [r0]
	mov r7, r8
	subs r0, r0, r7
	cmp r5, r0
	blt _0809366E
_080936AE:
	mov r1, r8
	lsls r0, r1, #0x18
	lsrs r1, r0, #0x18
	ldr r2, _080936C4  @ gUnknown_0200F158
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt _0809365C
	bl _08094FCE
	.align 2, 0
_080936C4: .4byte gUnknown_0200F158
_080936C8: .4byte gUnknown_0200D6E0
_080936CC:
	cmp r2, #0
	bne _08093754
	movs r3, #0
	mov sl, r3
	movs r1, #0
	ldr r3, _0809374C  @ gUnknown_0200F158
	ldrb r0, [r3]
	subs r0, #1
	cmp r2, r0
	blt _080936E4
	bl _08094FCE
_080936E4:
	movs r5, #0
	ldrb r0, [r3]
	adds r1, #1
	subs r0, r0, r1
	mov r8, r1
	cmp r5, r0
	bge _08093736
	ldr r7, _08093750  @ gUnknown_0200D6E0
	mov r9, r7
_080936F6:
	adds r7, r5, #1
	lsls r0, r7, #2
	mov r1, r9
	adds r6, r0, r1
	ldr r0, [r6]
	ldr r0, [r0]
	bl GetUnitLuck
	adds r4, r0, #0
	lsls r0, r5, #2
	mov r2, r9
	adds r5, r0, r2
	ldr r0, [r5]
	ldr r0, [r0]
	bl GetUnitLuck
	cmp r4, r0
	ble _08093726
	ldr r1, [r5]
	ldr r0, [r6]
	str r0, [r5]
	str r1, [r6]
	movs r3, #1
	mov sl, r3
_08093726:
	lsls r0, r7, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _0809374C  @ gUnknown_0200F158
	ldrb r0, [r0]
	mov r7, r8
	subs r0, r0, r7
	cmp r5, r0
	blt _080936F6
_08093736:
	mov r1, r8
	lsls r0, r1, #0x18
	lsrs r1, r0, #0x18
	ldr r3, _0809374C  @ gUnknown_0200F158
	ldrb r0, [r3]
	subs r0, #1
	cmp r1, r0
	blt _080936E4
	bl _08094FCE
	.align 2, 0
_0809374C: .4byte gUnknown_0200F158
_08093750: .4byte gUnknown_0200D6E0
_08093754:
	movs r3, #0
	mov sl, r3
	movs r1, #0
	ldr r2, _080937D0  @ gUnknown_0200F158
	ldrb r0, [r2]
	subs r0, #1
	cmp sl, r0
	blt _08093768
	bl _08094FCE
_08093768:
	movs r5, #0
	ldrb r0, [r2]
	adds r1, #1
	subs r0, r0, r1
	mov r8, r1
	cmp r5, r0
	bge _080937BA
	ldr r7, _080937D4  @ gUnknown_0200D6E0
	mov r9, r7
_0809377A:
	adds r7, r5, #1
	lsls r0, r7, #2
	mov r1, r9
	adds r6, r0, r1
	ldr r0, [r6]
	ldr r0, [r0]
	bl GetUnitLuck
	adds r4, r0, #0
	lsls r0, r5, #2
	mov r2, r9
	adds r5, r0, r2
	ldr r0, [r5]
	ldr r0, [r0]
	bl GetUnitLuck
	cmp r4, r0
	bge _080937AA
	ldr r1, [r5]
	ldr r0, [r6]
	str r0, [r5]
	str r1, [r6]
	movs r3, #1
	mov sl, r3
_080937AA:
	lsls r0, r7, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _080937D0  @ gUnknown_0200F158
	ldrb r0, [r0]
	mov r7, r8
	subs r0, r0, r7
	cmp r5, r0
	blt _0809377A
_080937BA:
	mov r1, r8
	lsls r0, r1, #0x18
	lsrs r1, r0, #0x18
	ldr r2, _080937D0  @ gUnknown_0200F158
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt _08093768
	bl _08094FCE
	.align 2, 0
_080937D0: .4byte gUnknown_0200F158
_080937D4: .4byte gUnknown_0200D6E0
_080937D8:
	cmp r2, #0
	bne _08093860
	movs r3, #0
	mov sl, r3
	movs r1, #0
	ldr r3, _08093858  @ gUnknown_0200F158
	ldrb r0, [r3]
	subs r0, #1
	cmp r2, r0
	blt _080937F0
	bl _08094FCE
_080937F0:
	movs r5, #0
	ldrb r0, [r3]
	adds r1, #1
	subs r0, r0, r1
	mov r8, r1
	cmp r5, r0
	bge _08093842
	ldr r7, _0809385C  @ gUnknown_0200D6E0
	mov r9, r7
_08093802:
	adds r7, r5, #1
	lsls r0, r7, #2
	mov r1, r9
	adds r6, r0, r1
	ldr r0, [r6]
	ldr r0, [r0]
	bl GetUnitDefense
	adds r4, r0, #0
	lsls r0, r5, #2
	mov r2, r9
	adds r5, r0, r2
	ldr r0, [r5]
	ldr r0, [r0]
	bl GetUnitDefense
	cmp r4, r0
	ble _08093832
	ldr r1, [r5]
	ldr r0, [r6]
	str r0, [r5]
	str r1, [r6]
	movs r3, #1
	mov sl, r3
_08093832:
	lsls r0, r7, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _08093858  @ gUnknown_0200F158
	ldrb r0, [r0]
	mov r7, r8
	subs r0, r0, r7
	cmp r5, r0
	blt _08093802
_08093842:
	mov r1, r8
	lsls r0, r1, #0x18
	lsrs r1, r0, #0x18
	ldr r3, _08093858  @ gUnknown_0200F158
	ldrb r0, [r3]
	subs r0, #1
	cmp r1, r0
	blt _080937F0
	bl _08094FCE
	.align 2, 0
_08093858: .4byte gUnknown_0200F158
_0809385C: .4byte gUnknown_0200D6E0
_08093860:
	movs r3, #0
	mov sl, r3
	movs r1, #0
	ldr r2, _080938DC  @ gUnknown_0200F158
	ldrb r0, [r2]
	subs r0, #1
	cmp sl, r0
	blt _08093874
	bl _08094FCE
_08093874:
	movs r5, #0
	ldrb r0, [r2]
	adds r1, #1
	subs r0, r0, r1
	mov r8, r1
	cmp r5, r0
	bge _080938C6
	ldr r7, _080938E0  @ gUnknown_0200D6E0
	mov r9, r7
_08093886:
	adds r7, r5, #1
	lsls r0, r7, #2
	mov r1, r9
	adds r6, r0, r1
	ldr r0, [r6]
	ldr r0, [r0]
	bl GetUnitDefense
	adds r4, r0, #0
	lsls r0, r5, #2
	mov r2, r9
	adds r5, r0, r2
	ldr r0, [r5]
	ldr r0, [r0]
	bl GetUnitDefense
	cmp r4, r0
	bge _080938B6
	ldr r1, [r5]
	ldr r0, [r6]
	str r0, [r5]
	str r1, [r6]
	movs r3, #1
	mov sl, r3
_080938B6:
	lsls r0, r7, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _080938DC  @ gUnknown_0200F158
	ldrb r0, [r0]
	mov r7, r8
	subs r0, r0, r7
	cmp r5, r0
	blt _08093886
_080938C6:
	mov r1, r8
	lsls r0, r1, #0x18
	lsrs r1, r0, #0x18
	ldr r2, _080938DC  @ gUnknown_0200F158
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt _08093874
	bl _08094FCE
	.align 2, 0
_080938DC: .4byte gUnknown_0200F158
_080938E0: .4byte gUnknown_0200D6E0
_080938E4:
	cmp r2, #0
	bne _0809396C
	movs r3, #0
	mov sl, r3
	movs r1, #0
	ldr r3, _08093964  @ gUnknown_0200F158
	ldrb r0, [r3]
	subs r0, #1
	cmp r2, r0
	blt _080938FC
	bl _08094FCE
_080938FC:
	movs r5, #0
	ldrb r0, [r3]
	adds r1, #1
	subs r0, r0, r1
	mov r8, r1
	cmp r5, r0
	bge _0809394E
	ldr r7, _08093968  @ gUnknown_0200D6E0
	mov r9, r7
_0809390E:
	adds r7, r5, #1
	lsls r0, r7, #2
	mov r1, r9
	adds r6, r0, r1
	ldr r0, [r6]
	ldr r0, [r0]
	bl GetUnitResistance
	adds r4, r0, #0
	lsls r0, r5, #2
	mov r2, r9
	adds r5, r0, r2
	ldr r0, [r5]
	ldr r0, [r0]
	bl GetUnitResistance
	cmp r4, r0
	ble _0809393E
	ldr r1, [r5]
	ldr r0, [r6]
	str r0, [r5]
	str r1, [r6]
	movs r3, #1
	mov sl, r3
_0809393E:
	lsls r0, r7, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _08093964  @ gUnknown_0200F158
	ldrb r0, [r0]
	mov r7, r8
	subs r0, r0, r7
	cmp r5, r0
	blt _0809390E
_0809394E:
	mov r1, r8
	lsls r0, r1, #0x18
	lsrs r1, r0, #0x18
	ldr r3, _08093964  @ gUnknown_0200F158
	ldrb r0, [r3]
	subs r0, #1
	cmp r1, r0
	blt _080938FC
	bl _08094FCE
	.align 2, 0
_08093964: .4byte gUnknown_0200F158
_08093968: .4byte gUnknown_0200D6E0
_0809396C:
	movs r3, #0
	mov sl, r3
	movs r1, #0
	ldr r2, _080939E8  @ gUnknown_0200F158
	ldrb r0, [r2]
	subs r0, #1
	cmp sl, r0
	blt _08093980
	bl _08094FCE
_08093980:
	movs r5, #0
	ldrb r0, [r2]
	adds r1, #1
	subs r0, r0, r1
	mov r8, r1
	cmp r5, r0
	bge _080939D2
	ldr r7, _080939EC  @ gUnknown_0200D6E0
	mov r9, r7
_08093992:
	adds r7, r5, #1
	lsls r0, r7, #2
	mov r1, r9
	adds r6, r0, r1
	ldr r0, [r6]
	ldr r0, [r0]
	bl GetUnitResistance
	adds r4, r0, #0
	lsls r0, r5, #2
	mov r2, r9
	adds r5, r0, r2
	ldr r0, [r5]
	ldr r0, [r0]
	bl GetUnitResistance
	cmp r4, r0
	bge _080939C2
	ldr r1, [r5]
	ldr r0, [r6]
	str r0, [r5]
	str r1, [r6]
	movs r3, #1
	mov sl, r3
_080939C2:
	lsls r0, r7, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _080939E8  @ gUnknown_0200F158
	ldrb r0, [r0]
	mov r7, r8
	subs r0, r0, r7
	cmp r5, r0
	blt _08093992
_080939D2:
	mov r1, r8
	lsls r0, r1, #0x18
	lsrs r1, r0, #0x18
	ldr r2, _080939E8  @ gUnknown_0200F158
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt _08093980
	bl _08094FCE
	.align 2, 0
_080939E8: .4byte gUnknown_0200F158
_080939EC: .4byte gUnknown_0200D6E0
_080939F0:
	cmp r2, #0
	bne _08093AA0
	movs r3, #0
	str r3, [sp, #0x48]
	movs r1, #0
	ldr r7, _08093A98  @ gUnknown_0200F158
	ldrb r0, [r7]
	subs r0, #1
	cmp r2, r0
	bge _08093A90
	adds r0, r7, #0
	mov sl, r0
_08093A08:
	movs r2, #0
	mov r3, sl
	ldrb r0, [r3]
	adds r1, #1
	subs r0, r0, r1
	mov r9, r1
	cmp r2, r0
	bge _08093A80
	ldr r7, _08093A9C  @ gUnknown_0200D6E0
	mov ip, r7
_08093A1C:
	adds r0, r2, #1
	mov r8, r0
	lsls r0, r0, #2
	mov r1, ip
	adds r7, r0, r1
	ldr r6, [r7]
	ldr r1, [r6]
	ldr r0, [r1, #4]
	movs r3, #0x11
	ldrsb r3, [r0, r3]
	ldr r0, [r1]
	ldrb r0, [r0, #0x13]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r3, r3, r0
	movs r0, #0x1a
	ldrsb r0, [r1, r0]
	adds r3, r3, r0
	lsls r0, r2, #2
	mov r2, ip
	adds r4, r0, r2
	ldr r5, [r4]
	ldr r2, [r5]
	ldr r0, [r2, #4]
	ldrb r0, [r0, #0x11]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldr r1, [r2]
	ldrb r1, [r1, #0x13]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, r0, r1
	movs r1, #0x1a
	ldrsb r1, [r2, r1]
	adds r0, r0, r1
	cmp r3, r0
	ble _08093A6E
	str r6, [r4]
	str r5, [r7]
	movs r3, #1
	str r3, [sp, #0x48]
_08093A6E:
	mov r7, r8
	lsls r0, r7, #0x18
	lsrs r2, r0, #0x18
	mov r1, sl
	ldrb r0, [r1]
	mov r3, r9
	subs r0, r0, r3
	cmp r2, r0
	blt _08093A1C
_08093A80:
	mov r7, r9
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	ldr r2, _08093A98  @ gUnknown_0200F158
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt _08093A08
_08093A90:
	ldr r3, [sp, #0x48]
	bl _08094ECA
	.align 2, 0
_08093A98: .4byte gUnknown_0200F158
_08093A9C: .4byte gUnknown_0200D6E0
_08093AA0:
	movs r7, #0
	str r7, [sp, #0x4c]
	movs r1, #0
	ldr r2, _08093B44  @ gUnknown_0200F158
	ldrb r0, [r2]
	subs r0, #1
	cmp r7, r0
	bge _08093B3C
	adds r3, r2, #0
	mov sl, r3
_08093AB4:
	movs r2, #0
	mov r7, sl
	ldrb r0, [r7]
	adds r1, #1
	subs r0, r0, r1
	mov r9, r1
	cmp r2, r0
	bge _08093B2C
	ldr r0, _08093B48  @ gUnknown_0200D6E0
	mov ip, r0
_08093AC8:
	adds r1, r2, #1
	mov r8, r1
	lsls r0, r1, #2
	mov r3, ip
	adds r7, r0, r3
	ldr r6, [r7]
	ldr r1, [r6]
	ldr r0, [r1, #4]
	movs r3, #0x11
	ldrsb r3, [r0, r3]
	ldr r0, [r1]
	ldrb r0, [r0, #0x13]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r3, r3, r0
	movs r0, #0x1a
	ldrsb r0, [r1, r0]
	adds r3, r3, r0
	lsls r0, r2, #2
	mov r1, ip
	adds r4, r0, r1
	ldr r5, [r4]
	ldr r2, [r5]
	ldr r0, [r2, #4]
	ldrb r0, [r0, #0x11]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldr r1, [r2]
	ldrb r1, [r1, #0x13]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, r0, r1
	movs r1, #0x1a
	ldrsb r1, [r2, r1]
	adds r0, r0, r1
	cmp r3, r0
	bge _08093B1A
	str r6, [r4]
	str r5, [r7]
	movs r2, #1
	str r2, [sp, #0x4c]
_08093B1A:
	mov r3, r8
	lsls r0, r3, #0x18
	lsrs r2, r0, #0x18
	mov r7, sl
	ldrb r0, [r7]
	mov r1, r9
	subs r0, r0, r1
	cmp r2, r0
	blt _08093AC8
_08093B2C:
	mov r2, r9
	lsls r0, r2, #0x18
	lsrs r1, r0, #0x18
	ldr r3, _08093B44  @ gUnknown_0200F158
	ldrb r0, [r3]
	subs r0, #1
	cmp r1, r0
	blt _08093AB4
_08093B3C:
	ldr r7, [sp, #0x4c]
	bl _0809435E
	.align 2, 0
_08093B44: .4byte gUnknown_0200F158
_08093B48: .4byte gUnknown_0200D6E0
_08093B4C:
	cmp r2, #0
	bne _08093BD4
	movs r0, #0
	mov sl, r0
	movs r1, #0
	ldr r3, _08093BCC  @ gUnknown_0200F158
	ldrb r0, [r3]
	subs r0, #1
	cmp r2, r0
	blt _08093B64
	bl _08094EC8
_08093B64:
	movs r5, #0
	ldrb r0, [r3]
	adds r1, #1
	subs r0, r0, r1
	mov r8, r1
	cmp r5, r0
	bge _08093BB6
	ldr r1, _08093BD0  @ gUnknown_0200D6E0
	mov r9, r1
_08093B76:
	adds r7, r5, #1
	lsls r0, r7, #2
	mov r2, r9
	adds r6, r0, r2
	ldr r0, [r6]
	ldr r0, [r0]
	bl GetUnitAid
	adds r4, r0, #0
	lsls r0, r5, #2
	mov r3, r9
	adds r5, r0, r3
	ldr r0, [r5]
	ldr r0, [r0]
	bl GetUnitAid
	cmp r4, r0
	ble _08093BA6
	ldr r1, [r5]
	ldr r0, [r6]
	str r0, [r5]
	str r1, [r6]
	movs r0, #1
	mov sl, r0
_08093BA6:
	lsls r0, r7, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _08093BCC  @ gUnknown_0200F158
	ldrb r0, [r0]
	mov r1, r8
	subs r0, r0, r1
	cmp r5, r0
	blt _08093B76
_08093BB6:
	mov r2, r8
	lsls r0, r2, #0x18
	lsrs r1, r0, #0x18
	ldr r3, _08093BCC  @ gUnknown_0200F158
	ldrb r0, [r3]
	subs r0, #1
	cmp r1, r0
	blt _08093B64
	bl _08094EC8
	.align 2, 0
_08093BCC: .4byte gUnknown_0200F158
_08093BD0: .4byte gUnknown_0200D6E0
_08093BD4:
	movs r7, #0
	mov sl, r7
	movs r1, #0
	ldr r2, _08093C50  @ gUnknown_0200F158
	ldrb r0, [r2]
	subs r0, #1
	cmp sl, r0
	blt _08093BE8
	bl _08094FCE
_08093BE8:
	movs r5, #0
	ldrb r0, [r2]
	adds r1, #1
	subs r0, r0, r1
	mov r8, r1
	cmp r5, r0
	bge _08093C3A
	ldr r0, _08093C54  @ gUnknown_0200D6E0
	mov r9, r0
_08093BFA:
	adds r7, r5, #1
	lsls r0, r7, #2
	mov r1, r9
	adds r6, r0, r1
	ldr r0, [r6]
	ldr r0, [r0]
	bl GetUnitAid
	adds r4, r0, #0
	lsls r0, r5, #2
	mov r2, r9
	adds r5, r0, r2
	ldr r0, [r5]
	ldr r0, [r0]
	bl GetUnitAid
	cmp r4, r0
	bge _08093C2A
	ldr r1, [r5]
	ldr r0, [r6]
	str r0, [r5]
	str r1, [r6]
	movs r3, #1
	mov sl, r3
_08093C2A:
	lsls r0, r7, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _08093C50  @ gUnknown_0200F158
	ldrb r0, [r0]
	mov r7, r8
	subs r0, r0, r7
	cmp r5, r0
	blt _08093BFA
_08093C3A:
	mov r1, r8
	lsls r0, r1, #0x18
	lsrs r1, r0, #0x18
	ldr r2, _08093C50  @ gUnknown_0200F158
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt _08093BE8
	bl _08094FCE
	.align 2, 0
_08093C50: .4byte gUnknown_0200F158
_08093C54: .4byte gUnknown_0200D6E0
_08093C58:
	cmp r2, #0
	bne _08093CE0
	movs r3, #0
	mov sl, r3
	movs r1, #0
	ldr r3, _08093CD8  @ gUnknown_0200F158
	ldrb r0, [r3]
	subs r0, #1
	cmp r2, r0
	blt _08093C70
	bl _08094FCE
_08093C70:
	movs r5, #0
	ldrb r0, [r3]
	adds r1, #1
	subs r0, r0, r1
	mov r8, r1
	cmp r5, r0
	bge _08093CC2
	ldr r7, _08093CDC  @ gUnknown_0200D6E0
	mov r9, r7
_08093C82:
	adds r7, r5, #1
	lsls r0, r7, #2
	mov r1, r9
	adds r6, r0, r1
	ldr r0, [r6]
	ldr r0, [r0]
	bl GetUnitAffinityIcon
	adds r4, r0, #0
	lsls r0, r5, #2
	mov r2, r9
	adds r5, r0, r2
	ldr r0, [r5]
	ldr r0, [r0]
	bl GetUnitAffinityIcon
	cmp r4, r0
	bge _08093CB2
	ldr r1, [r5]
	ldr r0, [r6]
	str r0, [r5]
	str r1, [r6]
	movs r3, #1
	mov sl, r3
_08093CB2:
	lsls r0, r7, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _08093CD8  @ gUnknown_0200F158
	ldrb r0, [r0]
	mov r7, r8
	subs r0, r0, r7
	cmp r5, r0
	blt _08093C82
_08093CC2:
	mov r1, r8
	lsls r0, r1, #0x18
	lsrs r1, r0, #0x18
	ldr r3, _08093CD8  @ gUnknown_0200F158
	ldrb r0, [r3]
	subs r0, #1
	cmp r1, r0
	blt _08093C70
	bl _08094FCE
	.align 2, 0
_08093CD8: .4byte gUnknown_0200F158
_08093CDC: .4byte gUnknown_0200D6E0
_08093CE0:
	movs r3, #0
	mov sl, r3
	movs r1, #0
	ldr r2, _08093D5C  @ gUnknown_0200F158
	ldrb r0, [r2]
	subs r0, #1
	cmp sl, r0
	blt _08093CF4
	bl _08094FCE
_08093CF4:
	movs r5, #0
	ldrb r0, [r2]
	adds r1, #1
	subs r0, r0, r1
	mov r8, r1
	cmp r5, r0
	bge _08093D46
	ldr r7, _08093D60  @ gUnknown_0200D6E0
	mov r9, r7
_08093D06:
	adds r7, r5, #1
	lsls r0, r7, #2
	mov r1, r9
	adds r6, r0, r1
	ldr r0, [r6]
	ldr r0, [r0]
	bl GetUnitAffinityIcon
	adds r4, r0, #0
	lsls r0, r5, #2
	mov r2, r9
	adds r5, r0, r2
	ldr r0, [r5]
	ldr r0, [r0]
	bl GetUnitAffinityIcon
	cmp r4, r0
	ble _08093D36
	ldr r1, [r5]
	ldr r0, [r6]
	str r0, [r5]
	str r1, [r6]
	movs r3, #1
	mov sl, r3
_08093D36:
	lsls r0, r7, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _08093D5C  @ gUnknown_0200F158
	ldrb r0, [r0]
	mov r7, r8
	subs r0, r0, r7
	cmp r5, r0
	blt _08093D06
_08093D46:
	mov r1, r8
	lsls r0, r1, #0x18
	lsrs r1, r0, #0x18
	ldr r2, _08093D5C  @ gUnknown_0200F158
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt _08093CF4
	bl _08094FCE
	.align 2, 0
_08093D5C: .4byte gUnknown_0200F158
_08093D60: .4byte gUnknown_0200D6E0
_08093D64:
	cmp r2, #0
	beq _08093D6A
	b _08093E6C
_08093D6A:
	movs r3, #0
	str r3, [sp, #0x50]
	movs r4, #0
	ldr r0, _08093DA8  @ gUnknown_0200F158
	ldrb r0, [r0]
	cmp r2, r0
	bcs _08093DA2
	ldr r5, _08093DAC  @ gUnknown_0200D6E0
_08093D7A:
	lsls r0, r4, #2
	adds r0, r0, r5
	ldr r0, [r0]
	ldr r0, [r0]
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl GetItemIndex
	mov r7, sp
	adds r1, r7, r4
	strb r0, [r1]
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r0, _08093DA8  @ gUnknown_0200F158
	ldrb r0, [r0]
	cmp r4, r0
	bcc _08093D7A
_08093DA2:
	movs r4, #0
	b _08093E56
	.align 2, 0
_08093DA8: .4byte gUnknown_0200F158
_08093DAC: .4byte gUnknown_0200D6E0
_08093DB0:
	movs r6, #0
	ldrb r0, [r1]
	adds r1, r4, #1
	subs r0, r0, r1
	str r1, [sp, #0x58]
	cmp r6, r0
	bge _08093E50
	ldr r0, _08093DF8  @ gUnknown_0200D6E0
	mov sl, r0
_08093DC2:
	adds r0, r6, #1
	mov r1, sp
	adds r1, r1, r0
	mov r8, r1
	mov r2, sp
	adds r5, r2, r6
	ldrb r4, [r1]
	adds r3, r4, #0
	ldrb r2, [r5]
	mov r9, r0
	cmp r3, r2
	bls _08093DFC
	adds r1, r2, #0
	strb r4, [r5]
	mov r3, r8
	strb r1, [r3]
	lsls r2, r6, #2
	add r2, sl
	ldr r3, [r2]
	lsls r1, r0, #2
	add r1, sl
	ldr r0, [r1]
	str r0, [r2]
	str r3, [r1]
	movs r7, #1
	str r7, [sp, #0x50]
	b _08093E3E
	.align 2, 0
_08093DF8: .4byte gUnknown_0200D6E0
_08093DFC:
	cmp r3, r2
	bne _08093E3E
	mov r1, r9
	lsls r0, r1, #2
	mov r2, sl
	adds r7, r0, r2
	ldr r0, [r7]
	ldr r0, [r0]
	bl GetUnitEquippedWeapon
	adds r4, r0, #0
	lsls r0, r6, #2
	mov r3, sl
	adds r6, r0, r3
	ldr r0, [r6]
	ldr r0, [r0]
	bl GetUnitEquippedWeapon
	lsls r4, r4, #0x10
	lsls r0, r0, #0x10
	cmp r4, r0
	bls _08093E3E
	ldrb r1, [r5]
	mov r2, r8
	ldrb r0, [r2]
	strb r0, [r5]
	strb r1, [r2]
	ldr r3, [r6]
	ldr r0, [r7]
	str r0, [r6]
	str r3, [r7]
	movs r3, #1
	str r3, [sp, #0x50]
_08093E3E:
	mov r7, r9
	lsls r0, r7, #0x18
	lsrs r6, r0, #0x18
	ldr r0, _08093E68  @ gUnknown_0200F158
	ldrb r0, [r0]
	ldr r1, [sp, #0x58]
	subs r0, r0, r1
	cmp r6, r0
	blt _08093DC2
_08093E50:
	ldr r2, [sp, #0x58]
	lsls r0, r2, #0x18
	lsrs r4, r0, #0x18
_08093E56:
	ldr r1, _08093E68  @ gUnknown_0200F158
	ldrb r0, [r1]
	subs r0, #1
	cmp r4, r0
	blt _08093DB0
	ldr r3, [sp, #0x50]
	bl _08094ECA
	.align 2, 0
_08093E68: .4byte gUnknown_0200F158
_08093E6C:
	movs r7, #0
	str r7, [sp, #0x54]
	movs r4, #0
	ldr r0, _08093EA8  @ gUnknown_0200F158
	ldrb r0, [r0]
	cmp r7, r0
	bcs _08093EA4
	ldr r5, _08093EAC  @ gUnknown_0200D6E0
_08093E7C:
	lsls r0, r4, #2
	adds r0, r0, r5
	ldr r0, [r0]
	ldr r0, [r0]
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl GetItemIndex
	mov r2, sp
	adds r1, r2, r4
	strb r0, [r1]
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r0, _08093EA8  @ gUnknown_0200F158
	ldrb r0, [r0]
	cmp r4, r0
	bcc _08093E7C
_08093EA4:
	movs r4, #0
	b _08093F56
	.align 2, 0
_08093EA8: .4byte gUnknown_0200F158
_08093EAC: .4byte gUnknown_0200D6E0
_08093EB0:
	movs r6, #0
	ldrb r0, [r1]
	adds r1, r4, #1
	subs r0, r0, r1
	str r1, [sp, #0x5c]
	cmp r6, r0
	bge _08093F50
	ldr r3, _08093EF8  @ gUnknown_0200D6E0
	mov sl, r3
_08093EC2:
	adds r0, r6, #1
	mov r7, sp
	adds r7, r7, r0
	mov r8, r7
	mov r1, sp
	adds r5, r1, r6
	ldrb r4, [r7]
	adds r3, r4, #0
	ldrb r2, [r5]
	mov r9, r0
	cmp r3, r2
	bcs _08093EFC
	adds r1, r2, #0
	strb r4, [r5]
	strb r1, [r7]
	lsls r2, r6, #2
	add r2, sl
	ldr r3, [r2]
	lsls r1, r0, #2
	add r1, sl
	ldr r0, [r1]
	str r0, [r2]
	str r3, [r1]
	movs r2, #1
	str r2, [sp, #0x54]
	b _08093F3E
	.align 2, 0
_08093EF8: .4byte gUnknown_0200D6E0
_08093EFC:
	cmp r3, r2
	bne _08093F3E
	mov r3, r9
	lsls r0, r3, #2
	mov r1, sl
	adds r7, r0, r1
	ldr r0, [r7]
	ldr r0, [r0]
	bl GetUnitEquippedWeapon
	adds r4, r0, #0
	lsls r0, r6, #2
	mov r2, sl
	adds r6, r0, r2
	ldr r0, [r6]
	ldr r0, [r0]
	bl GetUnitEquippedWeapon
	lsls r4, r4, #0x10
	lsls r0, r0, #0x10
	cmp r4, r0
	bcs _08093F3E
	ldrb r1, [r5]
	mov r3, r8
	ldrb r0, [r3]
	strb r0, [r5]
	strb r1, [r3]
	ldr r3, [r6]
	ldr r0, [r7]
	str r0, [r6]
	str r3, [r7]
	movs r7, #1
	str r7, [sp, #0x54]
_08093F3E:
	mov r1, r9
	lsls r0, r1, #0x18
	lsrs r6, r0, #0x18
	ldr r0, _08093F64  @ gUnknown_0200F158
	ldrb r0, [r0]
	ldr r2, [sp, #0x5c]
	subs r0, r0, r2
	cmp r6, r0
	blt _08093EC2
_08093F50:
	ldr r3, [sp, #0x5c]
	lsls r0, r3, #0x18
	lsrs r4, r0, #0x18
_08093F56:
	ldr r1, _08093F64  @ gUnknown_0200F158
	ldrb r0, [r1]
	subs r0, #1
	cmp r4, r0
	blt _08093EB0
	ldr r7, [sp, #0x54]
	b _0809435E
	.align 2, 0
_08093F64: .4byte gUnknown_0200F158
_08093F68:
	cmp r2, #0
	bne _08093FE4
	movs r0, #0
	mov ip, r0
	movs r1, #0
	ldr r3, _08093FDC  @ gUnknown_0200F158
	ldrb r0, [r3]
	subs r0, #1
	cmp r2, r0
	bge _08093FD6
	adds r7, r3, #0
	mov sl, r7
_08093F80:
	movs r2, #0
	mov r3, sl
	ldrb r0, [r3]
	adds r1, #1
	subs r0, r0, r1
	mov r9, r1
	cmp r2, r0
	bge _08093FC6
	mov r8, r9
_08093F92:
	adds r6, r2, #1
	lsls r0, r6, #2
	ldr r7, _08093FE0  @ gUnknown_0200D6E0
	adds r5, r0, r7
	ldr r4, [r5]
	lsls r0, r2, #2
	adds r2, r0, r7
	ldr r3, [r2]
	movs r0, #4
	ldrsh r1, [r4, r0]
	movs r7, #4
	ldrsh r0, [r3, r7]
	cmp r1, r0
	ble _08093FB6
	str r4, [r2]
	str r3, [r5]
	movs r0, #1
	mov ip, r0
_08093FB6:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r1, sl
	ldrb r0, [r1]
	mov r3, r8
	subs r0, r0, r3
	cmp r2, r0
	blt _08093F92
_08093FC6:
	mov r7, r9
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	ldr r2, _08093FDC  @ gUnknown_0200F158
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt _08093F80
_08093FD6:
	mov r3, ip
	bl _08094ECA
	.align 2, 0
_08093FDC: .4byte gUnknown_0200F158
_08093FE0: .4byte gUnknown_0200D6E0
_08093FE4:
	movs r7, #0
	mov ip, r7
	movs r1, #0
	ldr r2, _08094054  @ gUnknown_0200F158
	ldrb r0, [r2]
	subs r0, #1
	cmp ip, r0
	bge _0809404E
	adds r3, r2, #0
	mov sl, r3
_08093FF8:
	movs r2, #0
	mov r7, sl
	ldrb r0, [r7]
	adds r1, #1
	subs r0, r0, r1
	mov r9, r1
	cmp r2, r0
	bge _0809403E
	mov r8, r9
_0809400A:
	adds r6, r2, #1
	lsls r0, r6, #2
	ldr r1, _08094058  @ gUnknown_0200D6E0
	adds r5, r0, r1
	ldr r4, [r5]
	lsls r0, r2, #2
	adds r2, r0, r1
	ldr r3, [r2]
	movs r7, #4
	ldrsh r1, [r4, r7]
	movs r7, #4
	ldrsh r0, [r3, r7]
	cmp r1, r0
	bge _0809402E
	str r4, [r2]
	str r3, [r5]
	movs r0, #1
	mov ip, r0
_0809402E:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r1, sl
	ldrb r0, [r1]
	mov r3, r8
	subs r0, r0, r3
	cmp r2, r0
	blt _0809400A
_0809403E:
	mov r7, r9
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	ldr r2, _08094054  @ gUnknown_0200F158
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt _08093FF8
_0809404E:
	mov r3, ip
	bl _08094ECA
	.align 2, 0
_08094054: .4byte gUnknown_0200F158
_08094058: .4byte gUnknown_0200D6E0
_0809405C:
	cmp r2, #0
	bne _080940D8
	movs r7, #0
	mov ip, r7
	movs r1, #0
	ldr r3, _080940D0  @ gUnknown_0200F158
	ldrb r0, [r3]
	subs r0, #1
	cmp r2, r0
	bge _080940CA
	adds r7, r3, #0
	mov sl, r7
_08094074:
	movs r2, #0
	mov r3, sl
	ldrb r0, [r3]
	adds r1, #1
	subs r0, r0, r1
	mov r9, r1
	cmp r2, r0
	bge _080940BA
	mov r8, r9
_08094086:
	adds r6, r2, #1
	lsls r0, r6, #2
	ldr r7, _080940D4  @ gUnknown_0200D6E0
	adds r5, r0, r7
	ldr r4, [r5]
	lsls r0, r2, #2
	adds r2, r0, r7
	ldr r3, [r2]
	movs r0, #6
	ldrsh r1, [r4, r0]
	movs r7, #6
	ldrsh r0, [r3, r7]
	cmp r1, r0
	ble _080940AA
	str r4, [r2]
	str r3, [r5]
	movs r0, #1
	mov ip, r0
_080940AA:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r1, sl
	ldrb r0, [r1]
	mov r3, r8
	subs r0, r0, r3
	cmp r2, r0
	blt _08094086
_080940BA:
	mov r7, r9
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	ldr r2, _080940D0  @ gUnknown_0200F158
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt _08094074
_080940CA:
	mov r3, ip
	bl _08094ECA
	.align 2, 0
_080940D0: .4byte gUnknown_0200F158
_080940D4: .4byte gUnknown_0200D6E0
_080940D8:
	movs r7, #0
	mov ip, r7
	movs r1, #0
	ldr r2, _08094148  @ gUnknown_0200F158
	ldrb r0, [r2]
	subs r0, #1
	cmp ip, r0
	bge _08094142
	adds r3, r2, #0
	mov sl, r3
_080940EC:
	movs r2, #0
	mov r7, sl
	ldrb r0, [r7]
	adds r1, #1
	subs r0, r0, r1
	mov r9, r1
	cmp r2, r0
	bge _08094132
	mov r8, r9
_080940FE:
	adds r6, r2, #1
	lsls r0, r6, #2
	ldr r1, _0809414C  @ gUnknown_0200D6E0
	adds r5, r0, r1
	ldr r4, [r5]
	lsls r0, r2, #2
	adds r2, r0, r1
	ldr r3, [r2]
	movs r7, #6
	ldrsh r1, [r4, r7]
	movs r7, #6
	ldrsh r0, [r3, r7]
	cmp r1, r0
	bge _08094122
	str r4, [r2]
	str r3, [r5]
	movs r0, #1
	mov ip, r0
_08094122:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r1, sl
	ldrb r0, [r1]
	mov r3, r8
	subs r0, r0, r3
	cmp r2, r0
	blt _080940FE
_08094132:
	mov r7, r9
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	ldr r2, _08094148  @ gUnknown_0200F158
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt _080940EC
_08094142:
	mov r3, ip
	bl _08094ECA
	.align 2, 0
_08094148: .4byte gUnknown_0200F158
_0809414C: .4byte gUnknown_0200D6E0
_08094150:
	cmp r2, #0
	bne _080941CC
	movs r7, #0
	mov ip, r7
	movs r1, #0
	ldr r3, _080941C4  @ gUnknown_0200F158
	ldrb r0, [r3]
	subs r0, #1
	cmp r2, r0
	bge _080941BE
	adds r7, r3, #0
	mov sl, r7
_08094168:
	movs r2, #0
	mov r3, sl
	ldrb r0, [r3]
	adds r1, #1
	subs r0, r0, r1
	mov r9, r1
	cmp r2, r0
	bge _080941AE
	mov r8, r9
_0809417A:
	adds r6, r2, #1
	lsls r0, r6, #2
	ldr r7, _080941C8  @ gUnknown_0200D6E0
	adds r5, r0, r7
	ldr r4, [r5]
	lsls r0, r2, #2
	adds r2, r0, r7
	ldr r3, [r2]
	movs r0, #8
	ldrsh r1, [r4, r0]
	movs r7, #8
	ldrsh r0, [r3, r7]
	cmp r1, r0
	ble _0809419E
	str r4, [r2]
	str r3, [r5]
	movs r0, #1
	mov ip, r0
_0809419E:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r1, sl
	ldrb r0, [r1]
	mov r3, r8
	subs r0, r0, r3
	cmp r2, r0
	blt _0809417A
_080941AE:
	mov r7, r9
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	ldr r2, _080941C4  @ gUnknown_0200F158
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt _08094168
_080941BE:
	mov r3, ip
	bl _08094ECA
	.align 2, 0
_080941C4: .4byte gUnknown_0200F158
_080941C8: .4byte gUnknown_0200D6E0
_080941CC:
	movs r7, #0
	mov ip, r7
	movs r1, #0
	ldr r2, _0809423C  @ gUnknown_0200F158
	ldrb r0, [r2]
	subs r0, #1
	cmp ip, r0
	bge _08094236
	adds r3, r2, #0
	mov sl, r3
_080941E0:
	movs r2, #0
	mov r7, sl
	ldrb r0, [r7]
	adds r1, #1
	subs r0, r0, r1
	mov r9, r1
	cmp r2, r0
	bge _08094226
	mov r8, r9
_080941F2:
	adds r6, r2, #1
	lsls r0, r6, #2
	ldr r1, _08094240  @ gUnknown_0200D6E0
	adds r5, r0, r1
	ldr r4, [r5]
	lsls r0, r2, #2
	adds r2, r0, r1
	ldr r3, [r2]
	movs r7, #8
	ldrsh r1, [r4, r7]
	movs r7, #8
	ldrsh r0, [r3, r7]
	cmp r1, r0
	bge _08094216
	str r4, [r2]
	str r3, [r5]
	movs r0, #1
	mov ip, r0
_08094216:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r1, sl
	ldrb r0, [r1]
	mov r3, r8
	subs r0, r0, r3
	cmp r2, r0
	blt _080941F2
_08094226:
	mov r7, r9
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	ldr r2, _0809423C  @ gUnknown_0200F158
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt _080941E0
_08094236:
	mov r3, ip
	bl _08094ECA
	.align 2, 0
_0809423C: .4byte gUnknown_0200F158
_08094240: .4byte gUnknown_0200D6E0
_08094244:
	cmp r2, #0
	bne _080942D8
	movs r7, #0
	mov ip, r7
	movs r1, #0
	ldr r3, _080942D0  @ gUnknown_0200F158
	ldrb r0, [r3]
	subs r0, #1
	cmp r2, r0
	blt _0809425A
	b _0809435C
_0809425A:
	adds r7, r3, #0
	mov sl, r7
_0809425E:
	movs r3, #0
	mov r2, sl
	ldrb r0, [r2]
	adds r1, #1
	subs r0, r0, r1
	mov r8, r1
	cmp r3, r0
	bge _080942BE
	ldr r7, _080942D4  @ gUnknown_0200D6E0
	mov r9, r7
_08094272:
	adds r7, r3, #1
	lsls r0, r7, #2
	mov r1, r9
	adds r6, r0, r1
	ldr r5, [r6]
	ldr r0, [r5]
	movs r2, #0x1d
	ldrsb r2, [r0, r2]
	ldr r0, [r0, #4]
	ldrb r0, [r0, #0x12]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r2, r2, r0
	lsls r0, r3, #2
	adds r3, r0, r1
	ldr r4, [r3]
	ldr r0, [r4]
	movs r1, #0x1d
	ldrsb r1, [r0, r1]
	ldr r0, [r0, #4]
	ldrb r0, [r0, #0x12]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r1, r1, r0
	cmp r2, r1
	ble _080942AE
	str r5, [r3]
	str r4, [r6]
	movs r2, #1
	mov ip, r2
_080942AE:
	lsls r0, r7, #0x18
	lsrs r3, r0, #0x18
	mov r7, sl
	ldrb r0, [r7]
	mov r1, r8
	subs r0, r0, r1
	cmp r3, r0
	blt _08094272
_080942BE:
	mov r2, r8
	lsls r0, r2, #0x18
	lsrs r1, r0, #0x18
	ldr r3, _080942D0  @ gUnknown_0200F158
	ldrb r0, [r3]
	subs r0, #1
	cmp r1, r0
	blt _0809425E
	b _0809435C
	.align 2, 0
_080942D0: .4byte gUnknown_0200F158
_080942D4: .4byte gUnknown_0200D6E0
_080942D8:
	movs r0, #0
	mov ip, r0
	movs r1, #0
	ldr r2, _0809436C  @ gUnknown_0200F158
	ldrb r0, [r2]
	subs r0, #1
	cmp ip, r0
	bge _0809435C
	adds r3, r2, #0
	mov sl, r3
_080942EC:
	movs r3, #0
	mov r7, sl
	ldrb r0, [r7]
	adds r1, #1
	subs r0, r0, r1
	mov r8, r1
	cmp r3, r0
	bge _0809434C
	ldr r0, _08094370  @ gUnknown_0200D6E0
	mov r9, r0
_08094300:
	adds r7, r3, #1
	lsls r0, r7, #2
	mov r1, r9
	adds r6, r0, r1
	ldr r5, [r6]
	ldr r0, [r5]
	movs r2, #0x1d
	ldrsb r2, [r0, r2]
	ldr r0, [r0, #4]
	ldrb r0, [r0, #0x12]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r2, r2, r0
	lsls r0, r3, #2
	adds r3, r0, r1
	ldr r4, [r3]
	ldr r0, [r4]
	movs r1, #0x1d
	ldrsb r1, [r0, r1]
	ldr r0, [r0, #4]
	ldrb r0, [r0, #0x12]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r1, r1, r0
	cmp r2, r1
	bge _0809433C
_08094334:
	str r5, [r3]
	str r4, [r6]
	movs r2, #1
	mov ip, r2
_0809433C:
	lsls r0, r7, #0x18
	lsrs r3, r0, #0x18
	mov r7, sl
	ldrb r0, [r7]
	mov r1, r8
	subs r0, r0, r1
	cmp r3, r0
	blt _08094300
_0809434C:
	mov r2, r8
	lsls r0, r2, #0x18
	lsrs r1, r0, #0x18
	ldr r3, _0809436C  @ gUnknown_0200F158
	ldrb r0, [r3]
	subs r0, #1
	cmp r1, r0
	blt _080942EC
_0809435C:
	mov r7, ip
_0809435E:
	cmp r7, #0
	bne _08094366
	bl _08094FE0
_08094366:
	movs r0, #1
	bl _08094FE2
	.align 2, 0
_0809436C: .4byte gUnknown_0200F158
_08094370: .4byte gUnknown_0200D6E0
_08094374:
	cmp r2, #0
	bne _080943FC
	movs r0, #0
	mov sl, r0
	movs r1, #0
	ldr r3, _080943F4  @ gUnknown_0200F158
	mov ip, r3
	ldrb r0, [r3]
	subs r0, #1
	cmp r2, r0
	blt _0809438E
	bl _08094EC8
_0809438E:
	adds r7, r3, #0
	mov r9, r7
_08094392:
	movs r2, #0
	mov r3, r9
	ldrb r0, [r3]
	adds r1, #1
	subs r0, r0, r1
	adds r7, r1, #0
	cmp r2, r0
	bge _080943E2
	ldr r0, _080943F8  @ gUnknown_0200D6E0
	mov r8, r0
_080943A6:
	adds r6, r2, #1
	lsls r0, r6, #2
	mov r1, r8
	adds r5, r0, r1
	ldr r4, [r5]
	ldr r0, [r4]
	adds r0, #0x30
	ldrb r1, [r0]
	lsls r1, r1, #0x1c
	lsls r0, r2, #2
	mov r3, r8
	adds r2, r0, r3
	ldr r3, [r2]
	ldr r0, [r3]
	adds r0, #0x30
	ldrb r0, [r0]
	lsls r0, r0, #0x1c
	cmp r1, r0
	bls _080943D4
	str r4, [r2]
	str r3, [r5]
	movs r0, #1
	mov sl, r0
_080943D4:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r1, r9
	ldrb r0, [r1]
	subs r0, r0, r7
	cmp r2, r0
	blt _080943A6
_080943E2:
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	mov r2, ip
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt _08094392
	bl _08094EC8
	.align 2, 0
_080943F4: .4byte gUnknown_0200F158
_080943F8: .4byte gUnknown_0200D6E0
_080943FC:
	movs r7, #0
	mov sl, r7
	movs r1, #0
	ldr r0, _08094478  @ gUnknown_0200F158
	mov ip, r0
	ldrb r0, [r0]
	subs r0, #1
	cmp sl, r0
	blt _08094412
	bl _08094EC8
_08094412:
	ldr r2, _08094478  @ gUnknown_0200F158
	mov r9, r2
_08094416:
	movs r2, #0
	mov r3, r9
	ldrb r0, [r3]
	adds r1, #1
	subs r0, r0, r1
	adds r7, r1, #0
	cmp r2, r0
	bge _08094466
	ldr r0, _0809447C  @ gUnknown_0200D6E0
	mov r8, r0
_0809442A:
	adds r6, r2, #1
	lsls r0, r6, #2
	mov r1, r8
	adds r5, r0, r1
	ldr r4, [r5]
	ldr r0, [r4]
	adds r0, #0x30
	ldrb r1, [r0]
	lsls r1, r1, #0x1c
	lsls r0, r2, #2
	mov r3, r8
	adds r2, r0, r3
	ldr r3, [r2]
	ldr r0, [r3]
	adds r0, #0x30
	ldrb r0, [r0]
	lsls r0, r0, #0x1c
	cmp r1, r0
	bcs _08094458
	str r4, [r2]
	str r3, [r5]
	movs r0, #1
	mov sl, r0
_08094458:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r1, r9
	ldrb r0, [r1]
	subs r0, r0, r7
	cmp r2, r0
	blt _0809442A
_08094466:
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	mov r2, ip
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt _08094416
	bl _08094EC8
	.align 2, 0
_08094478: .4byte gUnknown_0200F158
_0809447C: .4byte gUnknown_0200D6E0
_08094480:
	cmp r2, #0
	bne _08094540
	movs r7, #0
	mov r9, r7
	movs r1, #0
	ldr r0, _080944B0  @ gUnknown_0200F158
	ldrb r3, [r0]
	cmp r2, r3
	bcs _080944C8
	ldr r6, _080944B4  @ gUnknown_0200D6E0
	movs r5, #0x10
	movs r4, #1
_08094498:
	lsls r0, r1, #2
	adds r0, r0, r6
	ldr r0, [r0]
	ldr r0, [r0]
	ldr r2, [r0, #0xc]
	ands r2, r5
	cmp r2, #0
	beq _080944B8
	mov r2, sp
	adds r0, r2, r1
	strb r4, [r0]
	b _080944BE
	.align 2, 0
_080944B0: .4byte gUnknown_0200F158
_080944B4: .4byte gUnknown_0200D6E0
_080944B8:
	mov r7, sp
	adds r0, r7, r1
	strb r2, [r0]
_080944BE:
	adds r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, r3
	bcc _08094498
_080944C8:
	movs r1, #0
	ldr r2, _08094538  @ gUnknown_0200F158
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt _080944D6
	b _080945F0
_080944D6:
	mov r8, r2
	ldr r3, _0809453C  @ gUnknown_0200D6E0
	mov ip, r3
	mov sl, r8
_080944DE:
	movs r2, #0
	mov r7, r8
	ldrb r0, [r7]
	adds r1, #1
	subs r0, r0, r1
	adds r6, r1, #0
	cmp r2, r0
	bge _08094528
	mov r7, ip
_080944F0:
	adds r5, r2, #1
	mov r0, sp
	adds r4, r0, r5
	adds r1, r0, r2
	ldrb r3, [r4]
	ldrb r0, [r1]
	cmp r3, r0
	bls _0809451A
	ldrb r0, [r1]
	strb r3, [r1]
	strb r0, [r4]
	lsls r2, r2, #2
	adds r2, r2, r7
	ldr r3, [r2]
	lsls r1, r5, #2
	adds r1, r1, r7
	ldr r0, [r1]
	str r0, [r2]
	str r3, [r1]
	movs r1, #1
	mov r9, r1
_0809451A:
	lsls r0, r5, #0x18
	lsrs r2, r0, #0x18
	mov r3, r8
	ldrb r0, [r3]
	subs r0, r0, r6
	cmp r2, r0
	blt _080944F0
_08094528:
	lsls r0, r6, #0x18
	lsrs r1, r0, #0x18
	mov r7, sl
	ldrb r0, [r7]
	subs r0, #1
	cmp r1, r0
	blt _080944DE
	b _080945F0
	.align 2, 0
_08094538: .4byte gUnknown_0200F158
_0809453C: .4byte gUnknown_0200D6E0
_08094540:
	movs r1, #0
	mov r9, r1
	ldr r0, _0809456C  @ gUnknown_0200F158
	ldrb r2, [r0]
	cmp r9, r2
	bcs _08094584
	ldr r6, _08094570  @ gUnknown_0200D6E0
	adds r3, r2, #0
	movs r5, #0x10
	movs r4, #1
_08094554:
	lsls r0, r1, #2
	adds r0, r0, r6
	ldr r0, [r0]
	ldr r0, [r0]
	ldr r2, [r0, #0xc]
	ands r2, r5
	cmp r2, #0
	beq _08094574
	mov r2, sp
	adds r0, r2, r1
	strb r4, [r0]
	b _0809457A
	.align 2, 0
_0809456C: .4byte gUnknown_0200F158
_08094570: .4byte gUnknown_0200D6E0
_08094574:
	mov r7, sp
	adds r0, r7, r1
	strb r2, [r0]
_0809457A:
	adds r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, r3
	bcc _08094554
_08094584:
	movs r1, #0
	ldr r2, _08094600  @ gUnknown_0200F158
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	bge _080945F0
	mov r8, r2
	ldr r3, _08094604  @ gUnknown_0200D6E0
	mov ip, r3
	mov sl, r8
_08094598:
	movs r2, #0
	mov r7, r8
	ldrb r0, [r7]
	adds r1, #1
	subs r0, r0, r1
	adds r6, r1, #0
	cmp r2, r0
	bge _080945E2
	mov r7, ip
_080945AA:
	adds r5, r2, #1
	mov r0, sp
	adds r4, r0, r5
	adds r1, r0, r2
	ldrb r3, [r4]
	ldrb r0, [r1]
	cmp r3, r0
	bcs _080945D4
	ldrb r0, [r1]
	strb r3, [r1]
	strb r0, [r4]
	lsls r2, r2, #2
	adds r2, r2, r7
	ldr r3, [r2]
	lsls r1, r5, #2
_080945C8:
	adds r1, r1, r7
	ldr r0, [r1]
	str r0, [r2]
	str r3, [r1]
	movs r1, #1
	mov r9, r1
_080945D4:
	lsls r0, r5, #0x18
	lsrs r2, r0, #0x18
	mov r3, r8
	ldrb r0, [r3]
	subs r0, r0, r6
	cmp r2, r0
	blt _080945AA
_080945E2:
	lsls r0, r6, #0x18
	lsrs r1, r0, #0x18
	mov r7, sl
	ldrb r0, [r7]
	subs r0, #1
	cmp r1, r0
	blt _08094598
_080945F0:
	mov r0, r9
_080945F2:
	cmp r0, #0
	bne _080945FA
	bl _08094FE0
_080945FA:
	movs r0, #1
	bl _08094FE2
	.align 2, 0
_08094600: .4byte gUnknown_0200F158
_08094604: .4byte gUnknown_0200D6E0
_08094608:
	cmp r2, #0
	bne _0809468C
	movs r1, #0
	mov sl, r1
	ldr r3, _08094684  @ gUnknown_0200F158
	mov ip, r3
	ldrb r0, [r3]
	subs r0, #1
	cmp r2, r0
	blt _08094620
	bl _08094EC8
_08094620:
	adds r7, r3, #0
	mov r9, r7
_08094624:
	movs r2, #0
	mov r3, r9
	ldrb r0, [r3]
	adds r1, #1
	subs r0, r0, r1
	adds r7, r1, #0
	cmp r2, r0
	bge _08094670
	ldr r0, _08094688  @ gUnknown_0200D6E0
	mov r8, r0
_08094638:
	adds r6, r2, #1
	lsls r0, r6, #2
	mov r1, r8
	adds r5, r0, r1
	ldr r4, [r5]
	ldr r1, [r4]
	adds r1, #0x28
	lsls r0, r2, #2
	mov r3, r8
	adds r2, r0, r3
	ldr r3, [r2]
	ldr r0, [r3]
	adds r0, #0x28
	ldrb r1, [r1]
	ldrb r0, [r0]
	cmp r1, r0
	bls _08094662
	str r4, [r2]
	str r3, [r5]
	movs r0, #1
	mov sl, r0
_08094662:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r1, r9
	ldrb r0, [r1]
	subs r0, r0, r7
	cmp r2, r0
	blt _08094638
_08094670:
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	mov r2, ip
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt _08094624
	bl _08094EC8
	.align 2, 0
_08094684: .4byte gUnknown_0200F158
_08094688: .4byte gUnknown_0200D6E0
_0809468C:
	movs r7, #0
	mov sl, r7
	movs r1, #0
	ldr r0, _08094704  @ gUnknown_0200F158
	mov ip, r0
	ldrb r0, [r0]
	subs r0, #1
	cmp sl, r0
	blt _080946A2
	bl _08094EC8
_080946A2:
	ldr r2, _08094704  @ gUnknown_0200F158
	mov r9, r2
_080946A6:
	movs r2, #0
	mov r3, r9
	ldrb r0, [r3]
	adds r1, #1
	subs r0, r0, r1
	adds r7, r1, #0
	cmp r2, r0
	bge _080946F2
	ldr r0, _08094708  @ gUnknown_0200D6E0
	mov r8, r0
_080946BA:
	adds r6, r2, #1
	lsls r0, r6, #2
	mov r1, r8
	adds r5, r0, r1
	ldr r4, [r5]
	ldr r1, [r4]
	adds r1, #0x28
	lsls r0, r2, #2
	mov r3, r8
	adds r2, r0, r3
	ldr r3, [r2]
	ldr r0, [r3]
	adds r0, #0x28
	ldrb r1, [r1]
	ldrb r0, [r0]
	cmp r1, r0
	bcs _080946E4
	str r4, [r2]
	str r3, [r5]
	movs r0, #1
	mov sl, r0
_080946E4:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r1, r9
	ldrb r0, [r1]
	subs r0, r0, r7
	cmp r2, r0
	blt _080946BA
_080946F2:
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	mov r2, ip
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt _080946A6
	bl _08094EC8
	.align 2, 0
_08094704: .4byte gUnknown_0200F158
_08094708: .4byte gUnknown_0200D6E0
_0809470C:
	cmp r2, #0
	bne _0809478C
	movs r7, #0
	mov sl, r7
	movs r1, #0
	ldr r0, _08094784  @ gUnknown_0200F158
	mov ip, r0
	ldrb r0, [r0]
	subs r0, #1
	cmp r2, r0
	blt _08094724
	b _08094EC8
_08094724:
	ldr r2, _08094784  @ gUnknown_0200F158
	mov r9, r2
_08094728:
	movs r2, #0
	mov r3, r9
	ldrb r0, [r3]
	adds r1, #1
	subs r0, r0, r1
	adds r7, r1, #0
	cmp r2, r0
	bge _08094774
	ldr r0, _08094788  @ gUnknown_0200D6E0
	mov r8, r0
_0809473C:
	adds r6, r2, #1
	lsls r0, r6, #2
	mov r1, r8
	adds r5, r0, r1
	ldr r4, [r5]
	ldr r1, [r4]
	adds r1, #0x29
	lsls r0, r2, #2
	mov r3, r8
	adds r2, r0, r3
	ldr r3, [r2]
	ldr r0, [r3]
	adds r0, #0x29
	ldrb r1, [r1]
	ldrb r0, [r0]
	cmp r1, r0
	bls _08094766
	str r4, [r2]
	str r3, [r5]
	movs r0, #1
	mov sl, r0
_08094766:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r1, r9
	ldrb r0, [r1]
	subs r0, r0, r7
	cmp r2, r0
	blt _0809473C
_08094774:
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	mov r2, ip
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt _08094728
	b _08094EC8
	.align 2, 0
_08094784: .4byte gUnknown_0200F158
_08094788: .4byte gUnknown_0200D6E0
_0809478C:
	movs r7, #0
	mov sl, r7
	movs r1, #0
	ldr r0, _08094800  @ gUnknown_0200F158
	mov ip, r0
	ldrb r0, [r0]
	subs r0, #1
	cmp sl, r0
	blt _080947A0
	b _08094EC8
_080947A0:
	ldr r2, _08094800  @ gUnknown_0200F158
	mov r9, r2
_080947A4:
	movs r2, #0
	mov r3, r9
	ldrb r0, [r3]
	adds r1, #1
	subs r0, r0, r1
	adds r7, r1, #0
	cmp r2, r0
	bge _080947F0
	ldr r0, _08094804  @ gUnknown_0200D6E0
	mov r8, r0
_080947B8:
	adds r6, r2, #1
	lsls r0, r6, #2
	mov r1, r8
	adds r5, r0, r1
	ldr r4, [r5]
	ldr r1, [r4]
	adds r1, #0x29
	lsls r0, r2, #2
	mov r3, r8
	adds r2, r0, r3
	ldr r3, [r2]
	ldr r0, [r3]
	adds r0, #0x29
	ldrb r1, [r1]
	ldrb r0, [r0]
	cmp r1, r0
	bcs _080947E2
	str r4, [r2]
	str r3, [r5]
	movs r0, #1
	mov sl, r0
_080947E2:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r1, r9
	ldrb r0, [r1]
	subs r0, r0, r7
	cmp r2, r0
	blt _080947B8
_080947F0:
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	mov r2, ip
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt _080947A4
	b _08094EC8
	.align 2, 0
_08094800: .4byte gUnknown_0200F158
_08094804: .4byte gUnknown_0200D6E0
_08094808:
	cmp r2, #0
	bne _08094888
	movs r7, #0
	mov sl, r7
	movs r1, #0
	ldr r0, _08094880  @ gUnknown_0200F158
	mov ip, r0
	ldrb r0, [r0]
	subs r0, #1
	cmp r2, r0
	blt _08094820
	b _08094EC8
_08094820:
	ldr r2, _08094880  @ gUnknown_0200F158
	mov r9, r2
_08094824:
	movs r2, #0
	mov r3, r9
	ldrb r0, [r3]
	adds r1, #1
	subs r0, r0, r1
	adds r7, r1, #0
	cmp r2, r0
	bge _08094870
	ldr r0, _08094884  @ gUnknown_0200D6E0
	mov r8, r0
_08094838:
	adds r6, r2, #1
	lsls r0, r6, #2
	mov r1, r8
	adds r5, r0, r1
	ldr r4, [r5]
	ldr r1, [r4]
	adds r1, #0x2a
	lsls r0, r2, #2
	mov r3, r8
	adds r2, r0, r3
	ldr r3, [r2]
	ldr r0, [r3]
	adds r0, #0x2a
	ldrb r1, [r1]
	ldrb r0, [r0]
	cmp r1, r0
	bls _08094862
	str r4, [r2]
	str r3, [r5]
	movs r0, #1
	mov sl, r0
_08094862:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r1, r9
	ldrb r0, [r1]
	subs r0, r0, r7
	cmp r2, r0
	blt _08094838
_08094870:
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	mov r2, ip
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt _08094824
	b _08094EC8
	.align 2, 0
_08094880: .4byte gUnknown_0200F158
_08094884: .4byte gUnknown_0200D6E0
_08094888:
	movs r7, #0
	mov sl, r7
	movs r1, #0
	ldr r0, _080948FC  @ gUnknown_0200F158
	mov ip, r0
	ldrb r0, [r0]
	subs r0, #1
	cmp sl, r0
	blt _0809489C
	b _08094EC8
_0809489C:
	ldr r2, _080948FC  @ gUnknown_0200F158
	mov r9, r2
_080948A0:
	movs r2, #0
	mov r3, r9
	ldrb r0, [r3]
	adds r1, #1
	subs r0, r0, r1
	adds r7, r1, #0
	cmp r2, r0
	bge _080948EC
	ldr r0, _08094900  @ gUnknown_0200D6E0
	mov r8, r0
_080948B4:
	adds r6, r2, #1
	lsls r0, r6, #2
	mov r1, r8
	adds r5, r0, r1
	ldr r4, [r5]
	ldr r1, [r4]
	adds r1, #0x2a
	lsls r0, r2, #2
	mov r3, r8
	adds r2, r0, r3
	ldr r3, [r2]
	ldr r0, [r3]
	adds r0, #0x2a
	ldrb r1, [r1]
	ldrb r0, [r0]
	cmp r1, r0
	bcs _080948DE
	str r4, [r2]
	str r3, [r5]
	movs r0, #1
	mov sl, r0
_080948DE:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r1, r9
	ldrb r0, [r1]
	subs r0, r0, r7
	cmp r2, r0
	blt _080948B4
_080948EC:
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	mov r2, ip
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt _080948A0
	b _08094EC8
	.align 2, 0
_080948FC: .4byte gUnknown_0200F158
_08094900: .4byte gUnknown_0200D6E0
_08094904:
	cmp r2, #0
	bne _08094984
	movs r7, #0
	mov sl, r7
	movs r1, #0
	ldr r0, _0809497C  @ gUnknown_0200F158
	mov ip, r0
	ldrb r0, [r0]
	subs r0, #1
	cmp r2, r0
	blt _0809491C
	b _08094EC8
_0809491C:
	ldr r2, _0809497C  @ gUnknown_0200F158
	mov r9, r2
_08094920:
	movs r2, #0
	mov r3, r9
	ldrb r0, [r3]
	adds r1, #1
	subs r0, r0, r1
	adds r7, r1, #0
	cmp r2, r0
	bge _0809496C
	ldr r0, _08094980  @ gUnknown_0200D6E0
	mov r8, r0
_08094934:
	adds r6, r2, #1
	lsls r0, r6, #2
	mov r1, r8
	adds r5, r0, r1
	ldr r4, [r5]
	ldr r1, [r4]
	adds r1, #0x2b
	lsls r0, r2, #2
	mov r3, r8
	adds r2, r0, r3
	ldr r3, [r2]
	ldr r0, [r3]
	adds r0, #0x2b
	ldrb r1, [r1]
	ldrb r0, [r0]
	cmp r1, r0
	bls _0809495E
	str r4, [r2]
	str r3, [r5]
	movs r0, #1
	mov sl, r0
_0809495E:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r1, r9
	ldrb r0, [r1]
	subs r0, r0, r7
	cmp r2, r0
	blt _08094934
_0809496C:
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	mov r2, ip
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt _08094920
	b _08094EC8
	.align 2, 0
_0809497C: .4byte gUnknown_0200F158
_08094980: .4byte gUnknown_0200D6E0
_08094984:
	movs r7, #0
	mov sl, r7
	movs r1, #0
	ldr r0, _080949F8  @ gUnknown_0200F158
	mov ip, r0
	ldrb r0, [r0]
	subs r0, #1
	cmp sl, r0
	blt _08094998
	b _08094EC8
_08094998:
	ldr r2, _080949F8  @ gUnknown_0200F158
	mov r9, r2
_0809499C:
	movs r2, #0
	mov r3, r9
	ldrb r0, [r3]
	adds r1, #1
	subs r0, r0, r1
	adds r7, r1, #0
	cmp r2, r0
	bge _080949E8
	ldr r0, _080949FC  @ gUnknown_0200D6E0
	mov r8, r0
_080949B0:
	adds r6, r2, #1
	lsls r0, r6, #2
	mov r1, r8
	adds r5, r0, r1
	ldr r4, [r5]
	ldr r1, [r4]
	adds r1, #0x2b
	lsls r0, r2, #2
	mov r3, r8
	adds r2, r0, r3
	ldr r3, [r2]
	ldr r0, [r3]
	adds r0, #0x2b
	ldrb r1, [r1]
	ldrb r0, [r0]
	cmp r1, r0
	bcs _080949DA
	str r4, [r2]
	str r3, [r5]
	movs r0, #1
	mov sl, r0
_080949DA:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r1, r9
	ldrb r0, [r1]
	subs r0, r0, r7
	cmp r2, r0
	blt _080949B0
_080949E8:
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	mov r2, ip
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt _0809499C
	b _08094EC8
	.align 2, 0
_080949F8: .4byte gUnknown_0200F158
_080949FC: .4byte gUnknown_0200D6E0
_08094A00:
	cmp r2, #0
	bne _08094A80
	movs r7, #0
	mov sl, r7
	movs r1, #0
	ldr r0, _08094A78  @ gUnknown_0200F158
	mov ip, r0
	ldrb r0, [r0]
	subs r0, #1
	cmp r2, r0
	blt _08094A18
	b _08094EC8
_08094A18:
	ldr r2, _08094A78  @ gUnknown_0200F158
	mov r9, r2
_08094A1C:
	movs r2, #0
	mov r3, r9
	ldrb r0, [r3]
	adds r1, #1
	subs r0, r0, r1
	adds r7, r1, #0
	cmp r2, r0
	bge _08094A68
	ldr r0, _08094A7C  @ gUnknown_0200D6E0
	mov r8, r0
_08094A30:
	adds r6, r2, #1
	lsls r0, r6, #2
	mov r1, r8
	adds r5, r0, r1
	ldr r4, [r5]
	ldr r1, [r4]
	adds r1, #0x2c
	lsls r0, r2, #2
	mov r3, r8
	adds r2, r0, r3
	ldr r3, [r2]
	ldr r0, [r3]
	adds r0, #0x2c
	ldrb r1, [r1]
	ldrb r0, [r0]
	cmp r1, r0
	bls _08094A5A
	str r4, [r2]
	str r3, [r5]
	movs r0, #1
	mov sl, r0
_08094A5A:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r1, r9
	ldrb r0, [r1]
	subs r0, r0, r7
	cmp r2, r0
	blt _08094A30
_08094A68:
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	mov r2, ip
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt _08094A1C
	b _08094EC8
	.align 2, 0
_08094A78: .4byte gUnknown_0200F158
_08094A7C: .4byte gUnknown_0200D6E0
_08094A80:
	movs r7, #0
	mov sl, r7
	movs r1, #0
	ldr r0, _08094AF4  @ gUnknown_0200F158
	mov ip, r0
	ldrb r0, [r0]
	subs r0, #1
	cmp sl, r0
	blt _08094A94
	b _08094EC8
_08094A94:
	ldr r2, _08094AF4  @ gUnknown_0200F158
	mov r9, r2
_08094A98:
	movs r2, #0
	mov r3, r9
	ldrb r0, [r3]
	adds r1, #1
	subs r0, r0, r1
	adds r7, r1, #0
	cmp r2, r0
	bge _08094AE4
	ldr r0, _08094AF8  @ gUnknown_0200D6E0
	mov r8, r0
_08094AAC:
	adds r6, r2, #1
	lsls r0, r6, #2
	mov r1, r8
	adds r5, r0, r1
	ldr r4, [r5]
	ldr r1, [r4]
	adds r1, #0x2c
	lsls r0, r2, #2
	mov r3, r8
	adds r2, r0, r3
	ldr r3, [r2]
	ldr r0, [r3]
	adds r0, #0x2c
	ldrb r1, [r1]
	ldrb r0, [r0]
	cmp r1, r0
	bcs _08094AD6
	str r4, [r2]
	str r3, [r5]
	movs r0, #1
	mov sl, r0
_08094AD6:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r1, r9
	ldrb r0, [r1]
	subs r0, r0, r7
	cmp r2, r0
	blt _08094AAC
_08094AE4:
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	mov r2, ip
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt _08094A98
	b _08094EC8
	.align 2, 0
_08094AF4: .4byte gUnknown_0200F158
_08094AF8: .4byte gUnknown_0200D6E0
_08094AFC:
	cmp r2, #0
	bne _08094B7C
	movs r7, #0
	mov sl, r7
	movs r1, #0
	ldr r0, _08094B74  @ gUnknown_0200F158
	mov ip, r0
	ldrb r0, [r0]
	subs r0, #1
	cmp r2, r0
	blt _08094B14
	b _08094EC8
_08094B14:
	ldr r2, _08094B74  @ gUnknown_0200F158
	mov r9, r2
_08094B18:
	movs r2, #0
	mov r3, r9
	ldrb r0, [r3]
	adds r1, #1
	subs r0, r0, r1
	adds r7, r1, #0
	cmp r2, r0
	bge _08094B64
	ldr r0, _08094B78  @ gUnknown_0200D6E0
	mov r8, r0
_08094B2C:
	adds r6, r2, #1
	lsls r0, r6, #2
	mov r1, r8
	adds r5, r0, r1
	ldr r4, [r5]
	ldr r1, [r4]
	adds r1, #0x2d
	lsls r0, r2, #2
	mov r3, r8
	adds r2, r0, r3
	ldr r3, [r2]
	ldr r0, [r3]
	adds r0, #0x2d
	ldrb r1, [r1]
	ldrb r0, [r0]
	cmp r1, r0
	bls _08094B56
	str r4, [r2]
	str r3, [r5]
	movs r0, #1
	mov sl, r0
_08094B56:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r1, r9
	ldrb r0, [r1]
	subs r0, r0, r7
	cmp r2, r0
	blt _08094B2C
_08094B64:
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	mov r2, ip
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt _08094B18
	b _08094EC8
	.align 2, 0
_08094B74: .4byte gUnknown_0200F158
_08094B78: .4byte gUnknown_0200D6E0
_08094B7C:
	movs r7, #0
	mov sl, r7
	movs r1, #0
	ldr r0, _08094BF0  @ gUnknown_0200F158
	mov ip, r0
	ldrb r0, [r0]
	subs r0, #1
	cmp sl, r0
	blt _08094B90
	b _08094EC8
_08094B90:
	ldr r2, _08094BF0  @ gUnknown_0200F158
	mov r9, r2
_08094B94:
	movs r2, #0
	mov r3, r9
	ldrb r0, [r3]
	adds r1, #1
	subs r0, r0, r1
	adds r7, r1, #0
	cmp r2, r0
	bge _08094BE0
	ldr r0, _08094BF4  @ gUnknown_0200D6E0
	mov r8, r0
_08094BA8:
	adds r6, r2, #1
	lsls r0, r6, #2
	mov r1, r8
	adds r5, r0, r1
	ldr r4, [r5]
	ldr r1, [r4]
	adds r1, #0x2d
	lsls r0, r2, #2
	mov r3, r8
	adds r2, r0, r3
	ldr r3, [r2]
	ldr r0, [r3]
	adds r0, #0x2d
	ldrb r1, [r1]
	ldrb r0, [r0]
	cmp r1, r0
	bcs _08094BD2
	str r4, [r2]
	str r3, [r5]
	movs r0, #1
	mov sl, r0
_08094BD2:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r1, r9
	ldrb r0, [r1]
	subs r0, r0, r7
	cmp r2, r0
	blt _08094BA8
_08094BE0:
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	mov r2, ip
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt _08094B94
	b _08094EC8
	.align 2, 0
_08094BF0: .4byte gUnknown_0200F158
_08094BF4: .4byte gUnknown_0200D6E0
_08094BF8:
	cmp r2, #0
	bne _08094C78
	movs r7, #0
	mov sl, r7
	movs r1, #0
	ldr r0, _08094C70  @ gUnknown_0200F158
	mov ip, r0
	ldrb r0, [r0]
	subs r0, #1
	cmp r2, r0
	blt _08094C10
	b _08094EC8
_08094C10:
	ldr r2, _08094C70  @ gUnknown_0200F158
	mov r9, r2
_08094C14:
	movs r2, #0
	mov r3, r9
	ldrb r0, [r3]
	adds r1, #1
	subs r0, r0, r1
	adds r7, r1, #0
	cmp r2, r0
	bge _08094C60
	ldr r0, _08094C74  @ gUnknown_0200D6E0
	mov r8, r0
_08094C28:
	adds r6, r2, #1
	lsls r0, r6, #2
	mov r1, r8
	adds r5, r0, r1
	ldr r4, [r5]
	ldr r1, [r4]
	adds r1, #0x2e
	lsls r0, r2, #2
	mov r3, r8
	adds r2, r0, r3
	ldr r3, [r2]
	ldr r0, [r3]
	adds r0, #0x2e
	ldrb r1, [r1]
	ldrb r0, [r0]
	cmp r1, r0
	bls _08094C52
	str r4, [r2]
	str r3, [r5]
	movs r0, #1
	mov sl, r0
_08094C52:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r1, r9
	ldrb r0, [r1]
	subs r0, r0, r7
	cmp r2, r0
	blt _08094C28
_08094C60:
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	mov r2, ip
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt _08094C14
	b _08094EC8
	.align 2, 0
_08094C70: .4byte gUnknown_0200F158
_08094C74: .4byte gUnknown_0200D6E0
_08094C78:
	movs r7, #0
	mov sl, r7
	movs r1, #0
	ldr r0, _08094CEC  @ gUnknown_0200F158
	mov ip, r0
	ldrb r0, [r0]
	subs r0, #1
	cmp sl, r0
	blt _08094C8C
	b _08094EC8
_08094C8C:
	ldr r2, _08094CEC  @ gUnknown_0200F158
	mov r9, r2
_08094C90:
	movs r2, #0
	mov r3, r9
	ldrb r0, [r3]
	adds r1, #1
	subs r0, r0, r1
	adds r7, r1, #0
	cmp r2, r0
	bge _08094CDC
	ldr r0, _08094CF0  @ gUnknown_0200D6E0
	mov r8, r0
_08094CA4:
	adds r6, r2, #1
	lsls r0, r6, #2
	mov r1, r8
	adds r5, r0, r1
	ldr r4, [r5]
	ldr r1, [r4]
	adds r1, #0x2e
	lsls r0, r2, #2
	mov r3, r8
	adds r2, r0, r3
	ldr r3, [r2]
	ldr r0, [r3]
	adds r0, #0x2e
	ldrb r1, [r1]
	ldrb r0, [r0]
	cmp r1, r0
	bcs _08094CCE
	str r4, [r2]
	str r3, [r5]
	movs r0, #1
	mov sl, r0
_08094CCE:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r1, r9
	ldrb r0, [r1]
	subs r0, r0, r7
	cmp r2, r0
	blt _08094CA4
_08094CDC:
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	mov r2, ip
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt _08094C90
	b _08094EC8
	.align 2, 0
_08094CEC: .4byte gUnknown_0200F158
_08094CF0: .4byte gUnknown_0200D6E0
_08094CF4:
	cmp r2, #0
	bne _08094D74
	movs r7, #0
	mov sl, r7
	movs r1, #0
	ldr r0, _08094D6C  @ gUnknown_0200F158
	mov ip, r0
	ldrb r0, [r0]
	subs r0, #1
	cmp r2, r0
	blt _08094D0C
	b _08094EC8
_08094D0C:
	ldr r2, _08094D6C  @ gUnknown_0200F158
	mov r9, r2
_08094D10:
	movs r2, #0
	mov r3, r9
	ldrb r0, [r3]
	adds r1, #1
	subs r0, r0, r1
	adds r7, r1, #0
	cmp r2, r0
	bge _08094D5C
	ldr r0, _08094D70  @ gUnknown_0200D6E0
	mov r8, r0
_08094D24:
	adds r6, r2, #1
	lsls r0, r6, #2
	mov r1, r8
	adds r5, r0, r1
	ldr r4, [r5]
	ldr r1, [r4]
	adds r1, #0x2f
	lsls r0, r2, #2
	mov r3, r8
	adds r2, r0, r3
	ldr r3, [r2]
	ldr r0, [r3]
	adds r0, #0x2f
	ldrb r1, [r1]
	ldrb r0, [r0]
	cmp r1, r0
	bls _08094D4E
	str r4, [r2]
	str r3, [r5]
	movs r0, #1
	mov sl, r0
_08094D4E:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r1, r9
	ldrb r0, [r1]
	subs r0, r0, r7
	cmp r2, r0
	blt _08094D24
_08094D5C:
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	mov r2, ip
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt _08094D10
	b _08094EC8
	.align 2, 0
_08094D6C: .4byte gUnknown_0200F158
_08094D70: .4byte gUnknown_0200D6E0
_08094D74:
	movs r7, #0
	mov sl, r7
	movs r1, #0
	ldr r0, _08094DE8  @ gUnknown_0200F158
	mov ip, r0
	ldrb r0, [r0]
	subs r0, #1
	cmp sl, r0
	blt _08094D88
	b _08094EC8
_08094D88:
	ldr r2, _08094DE8  @ gUnknown_0200F158
	mov r9, r2
_08094D8C:
	movs r2, #0
	mov r3, r9
	ldrb r0, [r3]
	adds r1, #1
	subs r0, r0, r1
	adds r7, r1, #0
	cmp r2, r0
	bge _08094DD8
	ldr r0, _08094DEC  @ gUnknown_0200D6E0
	mov r8, r0
_08094DA0:
	adds r6, r2, #1
	lsls r0, r6, #2
	mov r1, r8
	adds r5, r0, r1
	ldr r4, [r5]
	ldr r1, [r4]
	adds r1, #0x2f
	lsls r0, r2, #2
	mov r3, r8
	adds r2, r0, r3
	ldr r3, [r2]
	ldr r0, [r3]
	adds r0, #0x2f
	ldrb r1, [r1]
	ldrb r0, [r0]
	cmp r1, r0
	bcs _08094DCA
	str r4, [r2]
	str r3, [r5]
	movs r0, #1
	mov sl, r0
_08094DCA:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r1, r9
	ldrb r0, [r1]
	subs r0, r0, r7
	cmp r2, r0
	blt _08094DA0
_08094DD8:
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	mov r2, ip
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt _08094D8C
	b _08094EC8
	.align 2, 0
_08094DE8: .4byte gUnknown_0200F158
_08094DEC: .4byte gUnknown_0200D6E0
_08094DF0:
	cmp r2, #0
	bne _08094E64
	movs r7, #0
	mov sl, r7
	movs r1, #0
	ldr r0, _08094E5C  @ gUnknown_0200F158
	mov ip, r0
	ldrb r0, [r0]
	subs r0, #1
	cmp r2, r0
	bge _08094EC8
	ldr r2, _08094E5C  @ gUnknown_0200F158
	mov r9, r2
_08094E0A:
	movs r2, #0
	mov r3, r9
	ldrb r0, [r3]
	adds r1, #1
	subs r0, r0, r1
	mov r8, r1
	cmp r2, r0
	bge _08094E48
_08094E1A:
	adds r6, r2, #1
	lsls r0, r6, #2
	ldr r7, _08094E60  @ gUnknown_0200D6E0
	adds r5, r0, r7
	ldr r4, [r5]
	lsls r0, r2, #2
	adds r2, r0, r7
	ldr r3, [r2]
	ldrb r0, [r4, #0xa]
	ldrb r7, [r3, #0xa]
	cmp r0, r7
	bls _08094E3A
	str r4, [r2]
	str r3, [r5]
	movs r0, #1
	mov sl, r0
_08094E3A:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r3, r9
	ldrb r0, [r3]
	subs r0, r0, r1
	cmp r2, r0
	blt _08094E1A
_08094E48:
	mov r7, r8
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	mov r2, ip
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt _08094E0A
	b _08094EC8
	.align 2, 0
_08094E5C: .4byte gUnknown_0200F158
_08094E60: .4byte gUnknown_0200D6E0
_08094E64:
	movs r7, #0
	mov sl, r7
	movs r1, #0
	ldr r0, _08094ED4  @ gUnknown_0200F158
	mov ip, r0
	ldrb r0, [r0]
	subs r0, #1
	cmp sl, r0
	bge _08094EC8
	ldr r2, _08094ED4  @ gUnknown_0200F158
	mov r9, r2
_08094E7A:
	movs r2, #0
	mov r3, r9
	ldrb r0, [r3]
	adds r1, #1
	subs r0, r0, r1
	mov r8, r1
	cmp r2, r0
	bge _08094EB8
_08094E8A:
	adds r6, r2, #1
	lsls r0, r6, #2
	ldr r7, _08094ED8  @ gUnknown_0200D6E0
	adds r5, r0, r7
	ldr r4, [r5]
	lsls r0, r2, #2
	adds r2, r0, r7
	ldr r3, [r2]
	ldrb r0, [r4, #0xa]
	ldrb r7, [r3, #0xa]
	cmp r0, r7
	bcs _08094EAA
	str r4, [r2]
	str r3, [r5]
	movs r0, #1
	mov sl, r0
_08094EAA:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r3, r9
	ldrb r0, [r3]
	subs r0, r0, r1
	cmp r2, r0
	blt _08094E8A
_08094EB8:
	mov r7, r8
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	mov r2, ip
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt _08094E7A
_08094EC8:
	mov r3, sl
_08094ECA:
	cmp r3, #0
	bne _08094ED0
	b _08094FE0
_08094ED0:
	movs r0, #1
	b _08094FE2
	.align 2, 0
_08094ED4: .4byte gUnknown_0200F158
_08094ED8: .4byte gUnknown_0200D6E0
_08094EDC:
	cmp r2, #0
	bne _08094F5C
	movs r7, #0
	mov sl, r7
	movs r1, #0
	ldr r2, _08094F54  @ gUnknown_0200F158
	ldrb r0, [r2]
	subs r0, #1
	cmp sl, r0
	bge _08094FCE
_08094EF0:
	movs r5, #0
	ldrb r0, [r2]
	adds r1, #1
	subs r0, r0, r1
	mov r8, r1
	cmp r5, r0
	bge _08094F42
	ldr r0, _08094F58  @ gUnknown_0200D6E0
	mov r9, r0
_08094F02:
	adds r7, r5, #1
	lsls r0, r7, #2
	mov r1, r9
	adds r6, r0, r1
	ldr r0, [r6]
	ldr r0, [r0]
	bl sub_8092BE4
	adds r4, r0, #0
	lsls r0, r5, #2
	mov r2, r9
	adds r5, r0, r2
	ldr r0, [r5]
	ldr r0, [r0]
	bl sub_8092BE4
	cmp r4, r0
	ble _08094F32
	ldr r1, [r5]
	ldr r0, [r6]
	str r0, [r5]
	str r1, [r6]
	movs r3, #1
	mov sl, r3
_08094F32:
	lsls r0, r7, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _08094F54  @ gUnknown_0200F158
	ldrb r0, [r0]
	mov r7, r8
	subs r0, r0, r7
	cmp r5, r0
	blt _08094F02
_08094F42:
	mov r1, r8
	lsls r0, r1, #0x18
	lsrs r1, r0, #0x18
	ldr r2, _08094F54  @ gUnknown_0200F158
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt _08094EF0
	b _08094FCE
	.align 2, 0
_08094F54: .4byte gUnknown_0200F158
_08094F58: .4byte gUnknown_0200D6E0
_08094F5C:
	movs r3, #0
	mov sl, r3
	movs r1, #0
	ldr r2, _08094FD8  @ gUnknown_0200F158
	ldrb r0, [r2]
	subs r0, #1
	cmp sl, r0
	bge _08094FCE
_08094F6C:
	movs r5, #0
	ldrb r0, [r2]
	adds r1, #1
	subs r0, r0, r1
	mov r8, r1
	cmp r5, r0
	bge _08094FBE
	ldr r7, _08094FDC  @ gUnknown_0200D6E0
	mov r9, r7
_08094F7E:
	adds r7, r5, #1
	lsls r0, r7, #2
	mov r1, r9
	adds r6, r0, r1
	ldr r0, [r6]
	ldr r0, [r0]
	bl sub_8092BE4
	adds r4, r0, #0
	lsls r0, r5, #2
	mov r2, r9
	adds r5, r0, r2
	ldr r0, [r5]
	ldr r0, [r0]
	bl sub_8092BE4
	cmp r4, r0
	bge _08094FAE
	ldr r1, [r5]
	ldr r0, [r6]
	str r0, [r5]
	str r1, [r6]
	movs r3, #1
	mov sl, r3
_08094FAE:
	lsls r0, r7, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _08094FD8  @ gUnknown_0200F158
	ldrb r0, [r0]
	mov r7, r8
	subs r0, r0, r7
	cmp r5, r0
	blt _08094F7E
_08094FBE:
	mov r1, r8
	lsls r0, r1, #0x18
	lsrs r1, r0, #0x18
	ldr r2, _08094FD8  @ gUnknown_0200F158
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt _08094F6C
_08094FCE:
	mov r2, sl
	cmp r2, #0
	beq _08094FE0
	movs r0, #1
	b _08094FE2
	.align 2, 0
_08094FD8: .4byte gUnknown_0200F158
_08094FDC: .4byte gUnknown_0200D6E0
_08094FE0:
	movs r0, #0
_08094FE2:
	add sp, #0x60
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8092BF0

	THUMB_FUNC_START sub_8094FF4
sub_8094FF4: @ 0x08094FF4
	push {lr}
	ldr r0, _08095014  @ gRAMChapterData
	movs r2, #0xe
	ldrsb r2, [r0, r2]
	ldr r0, _08095018  @ gUnknown_03005280
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _0809501C
	adds r0, r2, #0
	subs r0, #0x24
	cmp r0, #0x13
	bhi _0809501C
	movs r0, #0
	b _0809501E
	.align 2, 0
_08095014: .4byte gRAMChapterData
_08095018: .4byte gUnknown_03005280
_0809501C:
	movs r0, #1
_0809501E:
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8094FF4

	THUMB_FUNC_START sub_8095024
sub_8095024: @ 0x08095024
	push {r4, lr}
	bl sub_809710C
	adds r4, r0, #0
	bl CheckSomethingSomewhere
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08095048
	ldr r0, _08095044  @ gUnknown_08A18200
	lsls r1, r4, #1
	adds r1, r1, r4
	lsls r1, r1, #2
	adds r0, #8
	b _08095086
	.align 2, 0
_08095044: .4byte gUnknown_08A18200
_08095048:
	cmp r4, #4
	bne _08095064
	movs r0, #2
	bl sub_80A095C
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0809507C
	ldr r0, _08095060  @ gUnknown_08A18200
	ldr r0, [r0, #0x30]
	b _0809508A
	.align 2, 0
_08095060: .4byte gUnknown_08A18200
_08095064:
	cmp r4, #2
	bne _0809507C
	bl sub_8094FF4
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0809507C
	ldr r0, _08095078  @ gUnknown_08A18200
	ldr r0, [r0, #0x18]
	b _0809508A
	.align 2, 0
_08095078: .4byte gUnknown_08A18200
_0809507C:
	ldr r0, _08095090  @ gUnknown_08A18200
	lsls r1, r4, #1
	adds r1, r1, r4
	lsls r1, r1, #2
	adds r0, #4
_08095086:
	adds r1, r1, r0
	ldr r0, [r1]
_0809508A:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08095090: .4byte gUnknown_08A18200

	THUMB_FUNC_END sub_8095024

	THUMB_FUNC_START sub_8095094
sub_8095094: @ 0x08095094
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r3, #0
	movs r2, #0
	movs r5, #1
_0809509E:
	adds r0, r1, #0
	asrs r0, r2
	ands r0, r5
	cmp r0, #0
	beq _080950B2
	cmp r4, r3
	bne _080950B0
	adds r0, r2, #0
	b _080950BC
_080950B0:
	adds r3, #1
_080950B2:
	adds r2, #1
	cmp r2, #3
	ble _0809509E
	movs r0, #1
	negs r0, r0
_080950BC:
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8095094

	THUMB_FUNC_START sub_80950C4
sub_80950C4: @ 0x080950C4
	push {r4, lr}
	adds r3, r0, #0
	movs r2, #0
	movs r1, #0
	movs r4, #1
_080950CE:
	adds r0, r3, #0
	asrs r0, r1
	ands r0, r4
	cmp r0, #0
	beq _080950DA
	adds r2, #1
_080950DA:
	adds r1, #1
	cmp r1, #3
	ble _080950CE
	adds r0, r2, #0
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80950C4

	THUMB_FUNC_START sub_80950E8
sub_80950E8: @ 0x080950E8
	push {r4, r5, r6, lr}
	sub sp, #0x10
	adds r2, r0, #0
	adds r4, r1, #0
	mov r1, sp
	ldr r0, _0809512C  @ gUnknown_08205BB0
	ldm r0!, {r3, r5, r6}
	stm r1!, {r3, r5, r6}
	ldr r0, [r0]
	str r0, [r1]
	ldr r0, _08095130  @ gUnknown_08A1D8D0
	movs r1, #0xc0
	lsls r1, r1, #0x13
	adds r2, r2, r1
	adds r1, r2, #0
	bl CopyDataWithPossibleUncomp
	ldr r0, _08095134  @ gRAMChapterData
	adds r0, #0x41
	ldrb r1, [r0]
	movs r0, #0xc
	ands r0, r1
	add r0, sp
	ldr r0, [r0]
	lsls r4, r4, #5
	adds r1, r4, #0
	movs r2, #0x20
	bl CopyToPaletteBuffer
	add sp, #0x10
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0809512C: .4byte gUnknown_08205BB0
_08095130: .4byte gUnknown_08A1D8D0
_08095134: .4byte gRAMChapterData

	THUMB_FUNC_END sub_80950E8

	THUMB_FUNC_START sub_8095138
sub_8095138: @ 0x08095138
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	mov r8, r0
	adds r7, r1, #0
	mov r9, r2
	mov sl, r3
	ldr r1, _080951AC  @ gUnknown_08A1A41C
	lsls r0, r2, #0xf
	lsrs r0, r0, #0x14
	movs r3, #0x80
	lsls r3, r3, #5
	adds r2, r3, #0
	adds r0, r0, r2
	lsls r6, r0, #0x10
	lsrs r2, r6, #0x10
	mov r0, r8
	bl CallARM_FillTileRect
	movs r5, #0
	cmp r5, r7
	bge _08095182
	mov r4, r8
	adds r4, #0x40
	adds r5, r7, #0
_0809516E:
	adds r0, r4, #0
	ldr r1, _080951B0  @ gUnknown_08A1A434
	lsrs r2, r6, #0x10
	bl CallARM_FillTileRect
	adds r4, #0x80
	subs r5, #1
	cmp r5, #0
	bne _0809516E
	adds r5, r7, #0
_08095182:
	lsls r0, r5, #7
	add r0, r8
	adds r0, #0x40
	ldr r1, _080951B4  @ gUnknown_08A1A474
	mov r4, sl
	lsls r2, r4, #0xc
	mov r4, r9
	lsls r3, r4, #0xf
	lsrs r3, r3, #0x14
	adds r2, r2, r3
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	bl CallARM_FillTileRect
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080951AC: .4byte gUnknown_08A1A41C
_080951B0: .4byte gUnknown_08A1A434
_080951B4: .4byte gUnknown_08A1A474

	THUMB_FUNC_END sub_8095138

	THUMB_FUNC_START sub_80951B8
sub_80951B8: @ 0x080951B8
	push {lr}
	adds r2, r0, #0
	adds r2, #0x33
	movs r1, #1
	strb r1, [r2]
	movs r1, #0xa
	bl Proc_Goto
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80951B8

	THUMB_FUNC_START sub_80951CC
sub_80951CC: @ 0x080951CC
	push {lr}
	adds r2, r0, #0
	adds r2, #0x33
	movs r1, #2
	strb r1, [r2]
	movs r1, #0xa
	bl Proc_Goto
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80951CC

	THUMB_FUNC_START sub_80951E0
sub_80951E0: @ 0x080951E0
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r2, r4, #0
	adds r2, #0x33
	movs r1, #0
	movs r0, #4
	strb r0, [r2]
	movs r2, #0x80
	lsls r2, r2, #1
	str r1, [sp]
	movs r0, #0x37
	adds r1, r2, #0
	movs r3, #0x20
	bl sub_80029E8
	adds r0, r4, #0
	movs r1, #0xa
	bl Proc_Goto
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80951E0

	THUMB_FUNC_START sub_8095210
sub_8095210: @ 0x08095210
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0809523C  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08095226
	movs r0, #0x6a
	bl m4aSongNumStart
_08095226:
	adds r1, r4, #0
	adds r1, #0x33
	movs r0, #3
	strb r0, [r1]
	adds r0, r4, #0
	movs r1, #8
	bl Proc_Goto
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809523C: .4byte gRAMChapterData

	THUMB_FUNC_END sub_8095210

	THUMB_FUNC_START sub_8095240
sub_8095240: @ 0x08095240
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2b
	ldrb r0, [r0]
	cmp r0, #0
	beq _0809525C
	bl sub_8096BC4
	adds r0, r4, #0
	movs r1, #0xb
	bl Proc_Goto
	movs r0, #1
	b _0809525E
_0809525C:
	movs r0, #0
_0809525E:
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8095240

	THUMB_FUNC_START sub_8095264
sub_8095264: @ 0x08095264
	push {lr}
	ldr r0, _08095278  @ gUnknown_08A1829C
	bl Proc_Find
	adds r0, #0x2b
	ldrb r0, [r0]
	cmp r0, #0
	beq _0809527C
	movs r0, #1
	b _0809527E
	.align 2, 0
_08095278: .4byte gUnknown_08A1829C
_0809527C:
	movs r0, #0
_0809527E:
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8095264

	THUMB_FUNC_START sub_8095284
sub_8095284: @ 0x08095284
	push {lr}
	movs r1, #5
	bl Proc_Goto
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8095284

	THUMB_FUNC_START sub_8095290
sub_8095290: @ 0x08095290
	push {r4, lr}
	adds r4, r0, #0
	bl CheckSomethingSomewhere
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080952AC
	bl sub_8095504
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080952B8
	bl sub_8096BE0
_080952AC:
	adds r0, r4, #0
	movs r1, #5
	bl Proc_Goto
	movs r0, #1
	b _080952BA
_080952B8:
	movs r0, #0
_080952BA:
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8095290

	THUMB_FUNC_START sub_80952C0
sub_80952C0: @ 0x080952C0
	push {lr}
	movs r1, #5
	bl Proc_Goto
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80952C0

	THUMB_FUNC_START sub_80952CC
sub_80952CC: @ 0x080952CC
	bx lr

	THUMB_FUNC_END sub_80952CC

	THUMB_FUNC_START __malloc_unlock_1
__malloc_unlock_1: @ 0x080952D0
	bx lr

	THUMB_FUNC_END __malloc_unlock_1

	THUMB_FUNC_START sub_80952D4
sub_80952D4: @ 0x080952D4
	push {lr}
	ldr r1, _080952E8  @ gUnknown_0203E87C
	movs r2, #0
	adds r0, r1, #4
_080952DC:
	strb r2, [r0]
	subs r0, #1
	cmp r0, r1
	bge _080952DC
	pop {r0}
	bx r0
	.align 2, 0
_080952E8: .4byte gUnknown_0203E87C

	THUMB_FUNC_END sub_80952D4

	THUMB_FUNC_START sub_80952EC
sub_80952EC: @ 0x080952EC
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	movs r2, #0
	ldr r4, _08095304  @ gUnknown_0203E87C
_080952F6:
	adds r1, r2, r4
	ldrb r0, [r1]
	cmp r0, #0
	bne _08095308
	strb r3, [r1]
	b _0809530E
	.align 2, 0
_08095304: .4byte gUnknown_0203E87C
_08095308:
	adds r2, #1
	cmp r2, #4
	ble _080952F6
_0809530E:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80952EC

	THUMB_FUNC_START sub_8095314
sub_8095314: @ 0x08095314
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	movs r1, #0
	ldr r3, _08095344  @ gUnknown_0203E87C
	adds r4, r3, #0
_08095320:
	adds r0, r1, r3
	ldrb r0, [r0]
	cmp r0, r2
	bne _08095348
	adds r2, r1, #0
	cmp r1, #3
	bgt _0809533C
	adds r1, r1, r4
_08095330:
	ldrb r0, [r1, #1]
	strb r0, [r1]
	adds r1, #1
	adds r2, #1
	cmp r2, #3
	ble _08095330
_0809533C:
	movs r0, #0
	strb r0, [r3, #4]
	b _0809534E
	.align 2, 0
_08095344: .4byte gUnknown_0203E87C
_08095348:
	adds r1, #1
	cmp r1, #4
	ble _08095320
_0809534E:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8095314

	THUMB_FUNC_START sub_8095354
sub_8095354: @ 0x08095354
	ldr r1, _08095360  @ gUnknown_020121CC
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	bx lr
	.align 2, 0
_08095360: .4byte gUnknown_020121CC

	THUMB_FUNC_END sub_8095354

	THUMB_FUNC_START sub_8095364
sub_8095364: @ 0x08095364
	ldr r2, _08095370  @ gUnknown_020121CC
	lsls r0, r0, #2
	adds r0, r0, r2
	str r1, [r0]
	bx lr
	.align 2, 0
_08095370: .4byte gUnknown_020121CC

	THUMB_FUNC_END sub_8095364

	THUMB_FUNC_START sub_8095374
sub_8095374: @ 0x08095374
	ldr r0, _08095380  @ gUnknown_020121CC
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r0, r1
	ldr r0, [r0]
	bx lr
	.align 2, 0
_08095380: .4byte gUnknown_020121CC

	THUMB_FUNC_END sub_8095374

	THUMB_FUNC_START sub_8095384
sub_8095384: @ 0x08095384
	ldr r1, _08095390  @ gUnknown_020121CC
	movs r2, #0x80
	lsls r2, r2, #1
	adds r1, r1, r2
	str r0, [r1]
	bx lr
	.align 2, 0
_08095390: .4byte gUnknown_020121CC

	THUMB_FUNC_END sub_8095384

	THUMB_FUNC_START sub_8095394
sub_8095394: @ 0x08095394
	push {lr}
	ldr r0, _080953A8  @ gUnknown_03005280
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080953AC
	bl sub_80C4088
	b _080953B6
	.align 2, 0
_080953A8: .4byte gUnknown_03005280
_080953AC:
	ldr r0, _080953BC  @ gUnknown_020121CC
	movs r1, #0x82
	lsls r1, r1, #1
	adds r0, r0, r1
	ldr r0, [r0]
_080953B6:
	pop {r1}
	bx r1
	.align 2, 0
_080953BC: .4byte gUnknown_020121CC

	THUMB_FUNC_END sub_8095394

	THUMB_FUNC_START sub_80953C0
sub_80953C0: @ 0x080953C0
	push {lr}
	adds r2, r0, #0
	ldr r0, _080953D8  @ gUnknown_03005280
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080953DC
	adds r0, r2, #0
	bl sub_80C409C
	b _080953E6
	.align 2, 0
_080953D8: .4byte gUnknown_03005280
_080953DC:
	ldr r0, _080953EC  @ gUnknown_020121CC
	movs r1, #0x82
	lsls r1, r1, #1
	adds r0, r0, r1
	str r2, [r0]
_080953E6:
	pop {r0}
	bx r0
	.align 2, 0
_080953EC: .4byte gUnknown_020121CC

	THUMB_FUNC_END sub_80953C0

	THUMB_FUNC_START IsCharacterForceDeployed
IsCharacterForceDeployed: @ 0x080953F0
	push {r4, lr}
	adds r4, r0, #0
	bl CheckSomethingSomewhere
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08095414
	bl GetChapterThing
	cmp r0, #0
	bne _08095414
	lsls r0, r4, #0x10
	lsrs r0, r0, #0x10
	bl IsCharacterForceDeployed_
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	b _08095416
_08095414:
	movs r0, #0
_08095416:
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END IsCharacterForceDeployed

	THUMB_FUNC_START sub_809541C
sub_809541C: @ 0x0809541C
	push {r4, r5, lr}
	movs r5, #0
	movs r4, #1
_08095422:
	adds r0, r4, #0
	bl GetUnit
	cmp r0, #0
	beq _0809544A
	ldr r2, [r0]
	cmp r2, #0
	beq _0809544A
	ldr r0, [r0, #0xc]
	ldr r1, _08095458  @ 0x00010004
	ands r0, r1
	cmp r0, #0
	bne _0809544A
	ldrb r0, [r2, #4]
	bl IsCharacterForceDeployed
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809544A
	adds r5, #1
_0809544A:
	adds r4, #1
	cmp r4, #0x3f
	ble _08095422
	adds r0, r5, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08095458: .4byte 0x00010004

	THUMB_FUNC_END sub_809541C

	THUMB_FUNC_START SomeLeftoverFunctionThatReturns0
SomeLeftoverFunctionThatReturns0: @ 0x0809545C
	movs r0, #0
	bx lr

	THUMB_FUNC_END SomeLeftoverFunctionThatReturns0

	THUMB_FUNC_START IsUnitInCurrentRoster
IsUnitInCurrentRoster: @ 0x08095460
	push {lr}
	adds r2, r0, #0
	ldr r0, [r2, #0xc]
	ldr r1, _08095488  @ 0x00010004
	ands r0, r1
	cmp r0, #0
	bne _08095490
	ldr r0, [r2]
	ldr r1, [r2, #4]
	ldr r0, [r0, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	movs r1, #0x80
	lsls r1, r1, #2
	ands r0, r1
	cmp r0, #0
	bne _0809548C
	movs r0, #1
	b _08095492
	.align 2, 0
_08095488: .4byte 0x00010004
_0809548C:
	movs r0, #8
	str r0, [r2, #0xc]
_08095490:
	movs r0, #0
_08095492:
	pop {r1}
	bx r1

	THUMB_FUNC_END IsUnitInCurrentRoster

	THUMB_FUNC_START sub_8095498
sub_8095498: @ 0x08095498
	push {r4, r5, r6, lr}
	sub sp, #4
	movs r6, #0
	adds r2, r0, #0
	adds r2, #0x2f
	strb r6, [r2]
	ldr r0, _080954F8  @ gRAMChapterData
	ldrb r1, [r0, #0x14]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _080954EE
	movs r4, #0
	adds r5, r2, #0
_080954B4:
	adds r0, r4, #0
	bl sub_80A095C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080954CA
	movs r0, #1
	lsls r0, r4
	ldrb r1, [r5]
	orrs r0, r1
	strb r0, [r5]
_080954CA:
	adds r4, #1
	cmp r4, #3
	ble _080954B4
	movs r0, #2
	bl sub_80A095C
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080954DE
	movs r6, #1
_080954DE:
	ldr r1, _080954FC  @ sub_80951E0
	ldr r3, _08095500  @ 0x00000577
	movs r0, #0
	str r0, [sp]
	movs r0, #4
	adds r2, r6, #0
	bl sub_8097024
_080954EE:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080954F8: .4byte gRAMChapterData
_080954FC: .4byte sub_80951E0
_08095500: .4byte 0x00000577

	THUMB_FUNC_END sub_8095498

	THUMB_FUNC_START sub_8095504
sub_8095504: @ 0x08095504
	push {lr}
	ldr r0, _08095518  @ gRAMChapterData
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x7d
	beq _0809551C
	movs r0, #1
	b _0809551E
	.align 2, 0
_08095518: .4byte gRAMChapterData
_0809551C:
	movs r0, #0
_0809551E:
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8095504

	THUMB_FUNC_START sub_8095524
sub_8095524: @ 0x08095524
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	bl sub_8096FAC
	bl CheckSomethingSomewhere
	lsls r0, r0, #0x18
	asrs r4, r0, #0x18
	cmp r4, #0
	bne _080955CC
	ldr r1, _0809557C  @ sub_80951B8
	ldr r3, _08095580  @ 0x00000574
	str r4, [sp]
	movs r0, #0
	movs r2, #0
	bl sub_8097024
	ldr r1, _08095584  @ sub_80951CC
	ldr r3, _08095588  @ 0x00000576
	str r4, [sp]
	movs r0, #1
	movs r2, #0
	bl sub_8097024
	adds r0, r5, #0
	bl sub_8095498
	bl sub_8095504
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _08095590
	ldr r1, _0809558C  @ sub_80952C0
	movs r3, #0xaf
	lsls r3, r3, #3
	str r4, [sp]
	movs r0, #7
	movs r2, #0
	bl sub_8097024
	b _080955A0
	.align 2, 0
_0809557C: .4byte sub_80951B8
_08095580: .4byte 0x00000574
_08095584: .4byte sub_80951CC
_08095588: .4byte 0x00000576
_0809558C: .4byte sub_80952C0
_08095590:
	ldr r1, _080955C0  @ sub_80952C0
	movs r3, #0xaf
	lsls r3, r3, #3
	str r0, [sp]
	movs r0, #7
	movs r2, #1
	bl sub_8097024
_080955A0:
	movs r4, #0
	bl sub_8094FF4
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080955AE
	movs r4, #1
_080955AE:
	ldr r1, _080955C4  @ sub_8095210
	ldr r3, _080955C8  @ 0x00000579
	movs r0, #0
	str r0, [sp]
	movs r0, #2
	adds r2, r4, #0
	bl sub_8097024
	b _080955F8
	.align 2, 0
_080955C0: .4byte sub_80952C0
_080955C4: .4byte sub_8095210
_080955C8: .4byte 0x00000579
_080955CC:
	ldr r1, _08095630  @ sub_80951B8
	ldr r3, _08095634  @ 0x00000574
	movs r4, #0
	str r4, [sp]
	movs r0, #0
	movs r2, #0
	bl sub_8097024
	ldr r1, _08095638  @ sub_80951CC
	ldr r3, _0809563C  @ 0x00000576
	str r4, [sp]
	movs r0, #1
	movs r2, #0
	bl sub_8097024
	ldr r1, _08095640  @ sub_8095284
	ldr r3, _08095644  @ 0x0000075C
	str r4, [sp]
	movs r0, #3
	movs r2, #0
	bl sub_8097024
_080955F8:
	ldr r0, _08095648  @ sub_8095290
	bl sub_8096FD0
	ldr r0, _0809564C  @ sub_8095240
	bl sub_8096FEC
	ldr r0, _08095650  @ gBG0TilemapBuffer
	movs r1, #0xc
	movs r2, #0x13
	movs r3, #0
	bl TileMap_FillRect
	ldr r0, _08095654  @ gBG1TilemapBuffer
	movs r1, #0xc
	movs r2, #0x13
	movs r3, #0
	bl TileMap_FillRect
	bl CheckSomethingSomewhere
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08095658
	movs r0, #1
	movs r1, #5
	bl sub_8097200
	b _08095660
	.align 2, 0
_08095630: .4byte sub_80951B8
_08095634: .4byte 0x00000574
_08095638: .4byte sub_80951CC
_0809563C: .4byte 0x00000576
_08095640: .4byte sub_8095284
_08095644: .4byte 0x0000075C
_08095648: .4byte sub_8095290
_0809564C: .4byte sub_8095240
_08095650: .4byte gBG0TilemapBuffer
_08095654: .4byte gBG1TilemapBuffer
_08095658:
	movs r0, #1
	movs r1, #6
	bl sub_8097200
_08095660:
	adds r0, r5, #0
	adds r0, #0x2d
	ldrb r0, [r0]
	bl sub_80970CC
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8095524

	THUMB_FUNC_START sub_8095674
sub_8095674: @ 0x08095674
	push {r4, r5, lr}
	movs r5, #0
	b _08095696
_0809567A:
	bl GetLastStatScreenUid
	adds r4, r0, #0
	adds r0, r5, #0
	bl sub_8095354
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r4, r0
	bne _08095694
	adds r0, r5, #0
	b _080956A0
_08095694:
	adds r5, #1
_08095696:
	bl sub_8095374
	cmp r5, r0
	blt _0809567A
	movs r0, #0
_080956A0:
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8095674

	THUMB_FUNC_START sub_80956A8
sub_80956A8: @ 0x080956A8
	push {r4, r5, lr}
	movs r5, #0
	b _080956C6
_080956AE:
	adds r0, r5, #0
	bl sub_8095354
	ldr r0, [r0]
	ldrb r4, [r0, #4]
	bl sub_8095394
	cmp r4, r0
	bne _080956C4
	adds r0, r5, #0
	b _080956D0
_080956C4:
	adds r5, #1
_080956C6:
	bl sub_8095374
	cmp r5, r0
	blt _080956AE
	movs r0, #0
_080956D0:
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80956A8

	THUMB_FUNC_START sub_80956D8
sub_80956D8: @ 0x080956D8
	push {r4, lr}
	ldr r0, _08095740  @ gUnknown_020111CC
	bl InitUnitStack
	movs r4, #1
_080956E2:
	adds r0, r4, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq _08095704
	ldr r0, [r2]
	cmp r0, #0
	beq _08095704
	ldr r0, [r2, #0xc]
	ldr r1, _08095744  @ 0x0001000C
	ands r0, r1
	cmp r0, #0
	bne _08095704
	adds r0, r2, #0
	bl PushUnit
_08095704:
	adds r4, #1
	cmp r4, #0x3f
	ble _080956E2
	movs r4, #1
_0809570C:
	adds r0, r4, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq _0809572E
	ldr r0, [r2]
	cmp r0, #0
	beq _0809572E
	ldr r0, [r2, #0xc]
	ldr r1, _08095744  @ 0x0001000C
	ands r0, r1
	cmp r0, #0
	beq _0809572E
	adds r0, r2, #0
	bl PushUnit
_0809572E:
	adds r4, #1
	cmp r4, #0x3f
	ble _0809570C
	bl LoadPlayerUnitsFromUnitStack
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08095740: .4byte gUnknown_020111CC
_08095744: .4byte 0x0001000C

	THUMB_FUNC_END sub_80956D8

	THUMB_FUNC_START SortPlayerUnitsForPrepScreen
SortPlayerUnitsForPrepScreen: @ 0x08095748
	push {r4, r5, r6, r7, lr}
	bl GetChapterAllyUnitCount
	adds r7, r0, #0
	movs r6, #0
	ldr r0, _0809580C  @ gUnknown_020111CC
	bl InitUnitStack
	movs r5, #1
_0809575A:
	adds r0, r5, #0
	bl GetUnit
	adds r4, r0, #0
	cmp r4, #0
	beq _08095794
	ldr r0, [r4]
	cmp r0, #0
	beq _08095794
	ldr r0, [r4, #0xc]
	ldr r1, _08095810  @ 0xFDFFFFFF
	ands r0, r1
	str r0, [r4, #0xc]
	adds r0, r4, #0
	bl IsUnitInCurrentRoster
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08095794
	ldr r0, [r4]
	ldrb r0, [r0, #4]
	bl IsCharacterForceDeployed
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08095794
	adds r0, r4, #0
	bl PushUnit
_08095794:
	adds r5, #1
	cmp r5, #0x3f
	ble _0809575A
	movs r5, #1
_0809579C:
	adds r0, r5, #0
	bl GetUnit
	adds r4, r0, #0
	cmp r4, #0
	beq _080957CE
	ldr r0, [r4]
	cmp r0, #0
	beq _080957CE
	adds r0, r4, #0
	bl IsUnitInCurrentRoster
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080957C8
	ldr r0, [r4]
	ldrb r0, [r0, #4]
	bl IsCharacterForceDeployed
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080957CE
_080957C8:
	adds r0, r4, #0
	bl PushUnit
_080957CE:
	adds r5, #1
	cmp r5, #0x3f
	ble _0809579C
	bl LoadPlayerUnitsFromUnitStack
	movs r5, #1
_080957DA:
	adds r0, r5, #0
	bl GetUnit
	adds r4, r0, #0
	cmp r4, #0
	beq _08095832
	ldr r0, [r4]
	cmp r0, #0
	beq _08095832
	adds r0, r4, #0
	bl IsUnitInCurrentRoster
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08095832
	adds r0, r4, #0
	bl SomeLeftoverFunctionThatReturns0
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08095818
	ldr r0, [r4, #0xc]
	ldr r1, _08095814  @ gUnknown_02000008
	b _0809582E
	.align 2, 0
_0809580C: .4byte gUnknown_020111CC
_08095810: .4byte 0xFDFFFFFF
_08095814: .4byte gUnknown_02000008
_08095818:
	cmp r7, r6
	ble _0809582A
	ldr r0, [r4, #0xc]
	movs r1, #9
	negs r1, r1
	ands r0, r1
	str r0, [r4, #0xc]
	adds r6, #1
	b _08095832
_0809582A:
	ldr r0, [r4, #0xc]
	movs r1, #8
_0809582E:
	orrs r0, r1
	str r0, [r4, #0xc]
_08095832:
	adds r5, #1
	cmp r5, #0x3f
	ble _080957DA
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END SortPlayerUnitsForPrepScreen

	THUMB_FUNC_START sub_8095840
sub_8095840: @ 0x08095840
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	movs r4, #1
_08095848:
	adds r0, r4, #0
	bl GetUnit
	adds r5, r0, #0
	adds r4, #1
	mov r8, r4
	cmp r5, #0
	beq _080958AC
	ldr r0, [r5]
	cmp r0, #0
	beq _080958AC
	movs r7, #0
	ldr r0, [r5, #0xc]
	movs r1, #8
	orrs r0, r1
	str r0, [r5, #0xc]
	adds r0, r5, #0
	bl GetUnitItemCount
	cmp r7, r0
	bge _080958A2
	adds r4, r5, #0
	adds r4, #0x1e
	adds r6, r0, #0
_08095878:
	ldrh r0, [r4]
	bl GetItemIndex
	cmp r0, #0xb7
	beq _08095894
	cmp r0, #0xb7
	bgt _08095890
	cmp r0, #0x84
	bgt _0809589A
	cmp r0, #0x81
	blt _0809589A
	b _08095894
_08095890:
	cmp r0, #0xcc
	bne _0809589A
_08095894:
	movs r0, #0
	strh r0, [r4]
	movs r7, #1
_0809589A:
	adds r4, #2
	subs r6, #1
	cmp r6, #0
	bne _08095878
_080958A2:
	cmp r7, #0
	beq _080958AC
	adds r0, r5, #0
	bl UnitRemoveInvalidItems
_080958AC:
	mov r4, r8
	cmp r4, #0x3f
	ble _08095848
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8095840

	THUMB_FUNC_START sub_80958BC
sub_80958BC: @ 0x080958BC
	push {r4, r5, r6, lr}
	movs r6, #0
	movs r5, #1
_080958C2:
	adds r0, r5, #0
	bl GetUnit
	adds r4, r0, #0
	cmp r4, #0
	beq _080958EA
	ldr r0, [r4]
	cmp r0, #0
	beq _080958EA
	adds r0, r4, #0
	bl IsUnitInCurrentRoster
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080958EA
	adds r0, r6, #0
	adds r1, r4, #0
	bl sub_8095364
	adds r6, #1
_080958EA:
	adds r5, #1
	cmp r5, #0x3f
	ble _080958C2
	adds r0, r6, #0
	bl sub_8095384
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80958BC

	THUMB_FUNC_START sub_80958FC
sub_80958FC: @ 0x080958FC
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r4, #0
	b _08095918
_08095904:
	adds r0, r4, #0
	bl sub_8095354
	ldr r0, [r0]
	ldrb r0, [r0, #4]
	cmp r0, r5
	bne _08095916
	adds r0, r4, #0
	b _08095922
_08095916:
	adds r4, #1
_08095918:
	bl sub_8095374
	cmp r4, r0
	blt _08095904
	movs r0, #0
_08095922:
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80958FC

	THUMB_FUNC_START sub_8095928
sub_8095928: @ 0x08095928
	push {r4, lr}
	bl SMS_ClearUsageTable
	movs r4, #0
	b _0809595E
_08095932:
	adds r0, r4, #0
	bl sub_8095354
	adds r2, r0, #0
	ldr r1, [r2, #0xc]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	bne _0809594C
	movs r0, #3
	negs r0, r0
	ands r1, r0
	b _08095950
_0809594C:
	movs r0, #0xa
	orrs r1, r0
_08095950:
	str r1, [r2, #0xc]
	adds r0, r2, #0
	bl GetUnitSMSId
	bl SMS_RegisterUsage
	adds r4, #1
_0809595E:
	bl sub_8095374
	cmp r4, r0
	blt _08095932
	bl SMS_FlushIndirect
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8095928

	THUMB_FUNC_START sub_8095970
sub_8095970: @ 0x08095970
	push {r4, r5, r6, lr}
	movs r5, #0
	bl GetChapterAllyUnitCount
	adds r6, r0, #0
	movs r4, #0
	b _080959A0
_0809597E:
	adds r0, r4, #0
	bl sub_8095354
	adds r2, r0, #0
	ldr r1, [r2, #0xc]
	movs r3, #8
	adds r0, r1, #0
	ands r0, r3
	cmp r0, #0
	bne _0809599E
	cmp r5, r6
	blt _0809599C
	orrs r1, r3
	str r1, [r2, #0xc]
	b _0809599E
_0809599C:
	adds r5, #1
_0809599E:
	adds r4, #1
_080959A0:
	bl sub_8095374
	cmp r4, r0
	blt _0809597E
	lsls r0, r5, #0x18
	asrs r0, r0, #0x18
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8095970

	THUMB_FUNC_START sub_80959B4
sub_80959B4: @ 0x080959B4
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x2b
	movs r0, #0
	strb r0, [r1]
	subs r1, #2
	strb r0, [r1]
	movs r6, #0
	adds r7, r1, #0
	b _080959FC
_080959CA:
	adds r0, r6, #0
	bl sub_8095354
	adds r3, r0, #0
	ldr r0, [r3, #0xc]
	movs r5, #8
	ands r0, r5
	cmp r0, #0
	bne _080959F4
	adds r2, r4, #0
	adds r2, #0x2b
	adds r1, r4, #0
	adds r1, #0x2a
	ldrb r0, [r2]
	ldrb r1, [r1]
	cmp r0, r1
	bcc _080959F0
	str r5, [r3, #0xc]
	b _080959F4
_080959F0:
	adds r0, #1
	strb r0, [r2]
_080959F4:
	ldrb r0, [r7]
	adds r0, #1
	strb r0, [r7]
	adds r6, #1
_080959FC:
	bl sub_8095374
	cmp r6, r0
	blt _080959CA
	adds r2, r4, #0
	adds r2, #0x29
	adds r0, r4, #0
	adds r0, #0x2a
	ldrb r2, [r2]
	ldrb r1, [r0]
	cmp r2, r1
	bcs _08095A16
	strb r2, [r0]
_08095A16:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80959B4

	THUMB_FUNC_START sub_8095A1C
sub_8095A1C: @ 0x08095A1C
	push {lr}
	ldr r0, _08095A34  @ gUnknown_08A006E4
	bl Proc_EndEach
	movs r0, #0
	movs r1, #0
	movs r2, #0xa
	bl sub_8086BB8
	pop {r0}
	bx r0
	.align 2, 0
_08095A34: .4byte gUnknown_08A006E4

	THUMB_FUNC_END sub_8095A1C

	THUMB_FUNC_START EndBG3Slider_
EndBG3Slider_: @ 0x08095A38
	push {lr}
	bl EndBG3Slider
	pop {r0}
	bx r0

	THUMB_FUNC_END EndBG3Slider_

	THUMB_FUNC_START sub_8095A44
sub_8095A44: @ 0x08095A44
	push {r4, r5, lr}
	sub sp, #0x20
	adds r2, r0, #0
	adds r4, r1, #0
	ldr r0, _08095AA0  @ 0x06010000
	adds r2, r2, r0
	mov r0, sp
	adds r1, r2, #0
	adds r2, r4, #0
	bl InitSomeOtherGraphicsRelatedStruct
	ldr r0, _08095AA4  @ gUnknown_0859EF00
	adds r4, #0x10
	lsls r4, r4, #5
	adds r1, r4, #0
	movs r2, #0x20
	bl CopyToPaletteBuffer
	add r4, sp, #0x18
	adds r0, r4, #0
	bl Text_Init3
	mov r0, sp
	bl SetFont
	movs r0, #0
	bl SetFontGlyphSet
	adds r0, r4, #0
	movs r1, #0
	bl Text_80046B4
	bl GetChapterThing
	adds r5, r4, #0
	cmp r0, #2
	beq _08095AAC
	ldr r0, _08095AA8  @ gRAMChapterData
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetROMChapterStruct
	adds r0, #0x8a
	ldrh r0, [r0]
	b _08095AB0
	.align 2, 0
_08095AA0: .4byte 0x06010000
_08095AA4: .4byte gUnknown_0859EF00
_08095AA8: .4byte gRAMChapterData
_08095AAC:
	movs r0, #0xcf
	lsls r0, r0, #1
_08095AB0:
	bl GetStringFromIndex
	adds r4, r0, #0
	movs r0, #0x60
	adds r1, r4, #0
	bl GetStringTextCenteredPos
	adds r1, r0, #0
	adds r0, r5, #0
	movs r2, #0
	adds r3, r4, #0
	bl Text_InsertString
	movs r0, #0
	bl SetFont
	add sp, #0x20
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8095A44

	THUMB_FUNC_START sub_8095AD8
sub_8095AD8: @ 0x08095AD8
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0
	bl sub_80953C0
	movs r0, #0
	str r0, [r4, #0x40]
	strh r0, [r4, #0x3c]
	bl CheckSomethingSomewhere
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08095AFA
	adds r1, r4, #0
	adds r1, #0x2a
	movs r0, #5
	b _08095B02
_08095AFA:
	bl GetChapterAllyUnitCount
	adds r1, r4, #0
	adds r1, #0x2a
_08095B02:
	strb r0, [r1]
	adds r0, r4, #0
	adds r0, #0x30
	movs r1, #0
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #2
	strb r1, [r0]
	subs r0, #9
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8095AD8

	THUMB_FUNC_START sub_8095B30
sub_8095B30: @ 0x08095B30
	push {r4, r5, lr}
	ldr r5, _08095B5C  @ gUnknown_020111A4
	movs r4, #4
_08095B36:
	adds r0, r5, #0
	bl Text_Clear
	adds r5, #8
	subs r4, #1
	cmp r4, #0
	bge _08095B36
	ldr r0, _08095B60  @ gUnknown_02023E42
	movs r1, #0xf
	movs r2, #0xa
	movs r3, #0
	bl TileMap_FillRect
	movs r0, #4
	bl BG_EnableSyncByMask
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08095B5C: .4byte gUnknown_020111A4
_08095B60: .4byte gUnknown_02023E42

	THUMB_FUNC_END sub_8095B30

	THUMB_FUNC_START sub_8095B64
sub_8095B64: @ 0x08095B64
	push {r4, lr}
	ldr r4, _08095B80  @ gUnknown_020111A4
	bl GetStringFromIndex
_08095B6C:
	adds r1, r0, #0
_08095B6E:
	ldrb r0, [r1]
	cmp r0, #0
	beq _08095B8C
	cmp r0, #1
	bne _08095B84
	adds r4, #8
	adds r1, #1
	b _08095B6E
	.align 2, 0
_08095B80: .4byte gUnknown_020111A4
_08095B84:
	adds r0, r4, #0
	bl Text_AppendChar
	b _08095B6C
_08095B8C:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8095B64

	THUMB_FUNC_START sub_8095B94
sub_8095B94: @ 0x08095B94
	push {r4, r5, lr}
	bl CheckSomethingSomewhere
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	negs r1, r0
	orrs r1, r0
	lsrs r1, r1, #0x1f
	movs r5, #0
	negs r1, r1
	adds r4, r1, #7
_08095BAA:
	lsls r0, r5, #3
	ldr r1, _08095BD0  @ gUnknown_020111A4
	adds r0, r0, r1
	lsls r1, r4, #6
	ldr r2, _08095BD4  @ gUnknown_02023CC2
	adds r1, r1, r2
	bl Text_Draw
	adds r4, #2
	adds r5, #1
	cmp r5, #4
	ble _08095BAA
	movs r0, #4
	bl BG_EnableSyncByMask
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08095BD0: .4byte gUnknown_020111A4
_08095BD4: .4byte gUnknown_02023CC2

	THUMB_FUNC_END sub_8095B94

	THUMB_FUNC_START sub_8095BD8
sub_8095BD8: @ 0x08095BD8
	push {lr}
	adds r0, #0x4c
	movs r1, #0
	strh r1, [r0]
	bl sub_8095B30
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8095BD8

	THUMB_FUNC_START sub_8095BE8
sub_8095BE8: @ 0x08095BE8
	push {lr}
	ldr r0, [r0, #0x58]
	bl sub_8095B64
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8095BE8

	THUMB_FUNC_START sub_8095BF4
sub_8095BF4: @ 0x08095BF4
	push {lr}
	bl sub_8095B94
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8095BF4

	THUMB_FUNC_START sub_8095C00
sub_8095C00: @ 0x08095C00
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r4, r1, #0
	ldr r5, _08095C28  @ gUnknown_08A1826C
	adds r0, r5, #0
	bl Proc_Find
	cmp r0, #0
	beq _08095C16
	bl Proc_End
_08095C16:
	adds r0, r5, #0
	adds r1, r4, #0
	bl Proc_Start
	str r6, [r0, #0x58]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08095C28: .4byte gUnknown_08A1826C

	THUMB_FUNC_END sub_8095C00

	THUMB_FUNC_START sub_8095C2C
sub_8095C2C: @ 0x08095C2C
	push {r4, lr}
	adds r4, r0, #0
	bl sub_80AD2D4
	bl sub_8096C20
	bl EndBG3Slider_
	bl sub_809710C
	adds r4, #0x2d
	strb r0, [r4]
	bl sub_80972B0
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8095C2C

	THUMB_FUNC_START sub_8095C50
sub_8095C50: @ 0x08095C50
	push {r4, lr}
	adds r2, r0, #0
	adds r4, r1, #0
	ldr r0, _08095C78  @ gUnknown_08A1AC88
	ldr r1, _08095C7C  @ 0x06010000
	adds r2, r2, r1
	adds r1, r2, #0
	bl CopyDataWithPossibleUncomp
	ldr r0, _08095C80  @ gUnknown_08A1B174
	adds r4, #0x10
	lsls r4, r4, #5
	adds r1, r4, #0
	movs r2, #0x20
	bl CopyToPaletteBuffer
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08095C78: .4byte gUnknown_08A1AC88
_08095C7C: .4byte 0x06010000
_08095C80: .4byte gUnknown_08A1B174

	THUMB_FUNC_END sub_8095C50

	THUMB_FUNC_START sub_8095C84
sub_8095C84: @ 0x08095C84
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r7, r0, #0
	ldr r0, _08095E00  @ gUnknown_08A181E8
	bl SetupBackgrounds
	bl Font_InitForUIDefault
	bl LoadUiFrameGraphics
	movs r0, #0
	movs r1, #0xe
	bl LoadDialogueBoxGfx
	ldr r2, _08095E04  @ gLCDControlBuffer
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
	bl LoadObjUIGfx
	bl SMS_ClearUsageTable
	bl sub_80958BC
	adds r0, r7, #0
	bl sub_80959B4
	bl sub_80956D8
	ldr r0, _08095E08  @ gBG0TilemapBuffer
	movs r1, #0
	bl BG_Fill
	ldr r0, _08095E0C  @ gBG1TilemapBuffer
	movs r1, #0
	bl BG_Fill
	ldr r0, _08095E10  @ gBG2TilemapBuffer
	movs r1, #0
	bl BG_Fill
	ldr r5, _08095E14  @ gUnknown_020111A4
	movs r4, #4
_08095CF2:
	adds r0, r5, #0
	movs r1, #0xe
	bl Text_Init
	adds r5, #8
	subs r4, #1
	cmp r4, #0
	bge _08095CF2
	movs r0, #0x35
	adds r0, r0, r7
	mov r8, r0
	ldr r5, _08095E18  @ gUnknown_02011184
	movs r4, #3
_08095D0C:
	adds r0, r5, #0
	movs r1, #8
	bl Text_Init
	adds r5, #8
	subs r4, #1
	cmp r4, #0
	bge _08095D0C
	ldr r0, _08095E1C  @ gUnknown_0201117C
	movs r1, #0xa
	bl Text_Init
	ldr r0, _08095E20  @ gUnknown_08A1A4C8
	ldr r1, _08095E24  @ 0x06014800
	bl CopyDataWithPossibleUncomp
	ldr r0, _08095E28  @ gUnknown_08A1D510
	ldr r1, _08095E2C  @ 0x06016000
	bl CopyDataWithPossibleUncomp
	ldr r0, _08095E30  @ gUnknown_08A1B154
	movs r1, #0xc8
	lsls r1, r1, #2
	movs r2, #0x40
	bl CopyToPaletteBuffer
	movs r0, #0xe0
	lsls r0, r0, #7
	movs r1, #6
	bl sub_8095C50
	ldr r0, _08095E34  @ gUnknown_08A1D4C8
	movs r1, #0xa0
	lsls r1, r1, #2
	movs r2, #0x20
	bl CopyToPaletteBuffer
	bl EnablePaletteSync
	ldr r3, _08095E04  @ gLCDControlBuffer
	ldrb r2, [r3, #0xc]
	movs r1, #4
	negs r1, r1
	adds r0, r1, #0
	ands r0, r2
	strb r0, [r3, #0xc]
	ldrb r2, [r3, #0x10]
	adds r0, r1, #0
	ands r0, r2
	movs r2, #2
	orrs r0, r2
	strb r0, [r3, #0x10]
	ldrb r0, [r3, #0x14]
	ands r1, r0
	movs r0, #1
	orrs r1, r0
	strb r1, [r3, #0x14]
	ldrb r0, [r3, #0x18]
	movs r1, #3
	orrs r0, r1
	strb r0, [r3, #0x18]
	ldrb r1, [r3, #1]
	movs r0, #0x21
	negs r0, r0
	ands r0, r1
	movs r1, #0x41
	negs r1, r1
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r3, #1]
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
	adds r0, r7, #0
	bl sub_8095524
	movs r0, #0xf
	bl BG_EnableSyncByMask
	bl SetDefaultColorEffects
	adds r0, r7, #0
	bl sub_8096BFC
	bl sub_8095A1C
	ldr r0, _08095E38  @ gUiFramePaletteB
	movs r1, #0x40
	movs r2, #0x60
	bl CopyToPaletteBuffer
	bl CheckSomethingSomewhere
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08095E48
	ldr r0, _08095E3C  @ gUnknown_08A1B698
	ldr r4, _08095E40  @ gUnknown_02020188
	adds r1, r4, #0
	bl CopyDataWithPossibleUncomp
	ldr r0, _08095E44  @ gUnknown_020235EA
	movs r2, #0x80
	lsls r2, r2, #5
	adds r1, r4, #0
	bl CallARM_FillTileRect
	b _08095E76
	.align 2, 0
_08095E00: .4byte gUnknown_08A181E8
_08095E04: .4byte gLCDControlBuffer
_08095E08: .4byte gBG0TilemapBuffer
_08095E0C: .4byte gBG1TilemapBuffer
_08095E10: .4byte gBG2TilemapBuffer
_08095E14: .4byte gUnknown_020111A4
_08095E18: .4byte gUnknown_02011184
_08095E1C: .4byte gUnknown_0201117C
_08095E20: .4byte gUnknown_08A1A4C8
_08095E24: .4byte 0x06014800
_08095E28: .4byte gUnknown_08A1D510
_08095E2C: .4byte 0x06016000
_08095E30: .4byte gUnknown_08A1B154
_08095E34: .4byte gUnknown_08A1D4C8
_08095E38: .4byte gUiFramePaletteB
_08095E3C: .4byte gUnknown_08A1B698
_08095E40: .4byte gUnknown_02020188
_08095E44: .4byte gUnknown_020235EA
_08095E48:
	ldr r0, _08095EAC  @ gUnknown_08A1B658
	ldr r5, _08095EB0  @ gUnknown_02020188
	adds r1, r5, #0
	bl CopyDataWithPossibleUncomp
	ldr r4, _08095EB4  @ gUnknown_02023548
	movs r6, #0x80
	lsls r6, r6, #5
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r6, #0
	bl CallARM_FillTileRect
	ldr r0, _08095EB8  @ gUnknown_08A1B698
	adds r1, r5, #0
	bl CopyDataWithPossibleUncomp
	adds r4, #0xe2
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r6, #0
	bl CallARM_FillTileRect
_08095E76:
	movs r0, #0xb0
	lsls r0, r0, #7
	movs r1, #0xb
	bl sub_8095A44
	adds r0, r7, #0
	bl sub_80AD1AC
	movs r0, #0xd0
	lsls r0, r0, #7
	bl sub_80AD1D0
	bl sub_809710C
	mov r1, r8
	strb r0, [r1]
	bl sub_8095024
	bl sub_8095B64
	bl sub_8095B94
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08095EAC: .4byte gUnknown_08A1B658
_08095EB0: .4byte gUnknown_02020188
_08095EB4: .4byte gUnknown_02023548
_08095EB8: .4byte gUnknown_08A1B698

	THUMB_FUNC_END sub_8095C84

	THUMB_FUNC_START sub_8095EBC
sub_8095EBC: @ 0x08095EBC
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	movs r5, #0
	ldr r2, _08095F28  @ gLCDControlBuffer
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
	movs r4, #1
_08095EE2:
	adds r0, r4, #0
	bl GetUnit
	adds r1, r0, #0
	cmp r1, #0
	beq _08095F06
	ldr r0, [r1]
	cmp r0, #0
	beq _08095F06
	adds r0, r1, #0
	bl IsUnitInCurrentRoster
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08095F06
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
_08095F06:
	adds r4, #1
	cmp r4, #0x3f
	ble _08095EE2
	cmp r5, #0
	bne _08095F20
	adds r1, r6, #0
	adds r1, #0x36
	movs r0, #1
	strb r0, [r1]
	adds r0, r6, #0
	movs r1, #6
	bl Proc_Goto
_08095F20:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08095F28: .4byte gLCDControlBuffer

	THUMB_FUNC_END sub_8095EBC

	THUMB_FUNC_START sub_8095F2C
sub_8095F2C: @ 0x08095F2C
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	bl sub_809710C
	adds r6, r0, #0
	adds r4, r5, #0
	adds r4, #0x35
	ldrb r0, [r4]
	cmp r0, r6
	beq _08095F4C
	bl sub_8095024
	adds r1, r5, #0
	bl sub_8095C00
	strb r6, [r4]
_08095F4C:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8095F2C

	THUMB_FUNC_START sub_8095F54
sub_8095F54: @ 0x08095F54
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r7, r0, #0
	ldr r5, _08095FCC  @ gUnknown_02011184
	adds r0, #0x2f
	ldrb r0, [r0]
	bl sub_80950C4
	adds r3, r0, #0
	lsls r3, r3, #1
	adds r3, #2
	movs r0, #1
	str r0, [sp]
	movs r0, #3
	movs r1, #5
	movs r2, #9
	bl DrawUiFrame2
	movs r4, #0
	movs r6, #0xc0
	lsls r6, r6, #1
_08095F7E:
	adds r0, r7, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	asrs r0, r4
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _08095FB6
	adds r0, r5, #0
	bl Text_Clear
	ldr r1, _08095FD0  @ gUnknown_08A196BC
	lsls r0, r4, #2
	adds r0, r0, r1
	ldr r0, [r0]
	bl GetStringFromIndex
	ldr r1, _08095FD4  @ gUnknown_02022CB0
	adds r1, r6, r1
	movs r2, #0
	str r2, [sp]
	str r0, [sp, #4]
	adds r0, r5, #0
	movs r3, #0
	bl DrawTextInline
	adds r5, #8
	adds r6, #0x80
_08095FB6:
	adds r4, #1
	cmp r4, #3
	ble _08095F7E
	movs r0, #3
	bl BG_EnableSyncByMask
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08095FCC: .4byte gUnknown_02011184
_08095FD0: .4byte gUnknown_08A196BC
_08095FD4: .4byte gUnknown_02022CB0

	THUMB_FUNC_END sub_8095F54

	THUMB_FUNC_START sub_8095FD8
sub_8095FD8: @ 0x08095FD8
	push {lr}
	ldr r0, _08095FFC  @ gUnknown_02022DEE
	movs r1, #8
	movs r2, #9
	movs r3, #0
	bl TileMap_FillRect
	ldr r0, _08096000  @ gUnknown_020235EE
	movs r1, #8
	movs r2, #9
	movs r3, #0
	bl TileMap_FillRect
	movs r0, #3
	bl BG_EnableSyncByMask
	pop {r0}
	bx r0
	.align 2, 0
_08095FFC: .4byte gUnknown_02022DEE
_08096000: .4byte gUnknown_020235EE

	THUMB_FUNC_END sub_8095FD8

	THUMB_FUNC_START sub_8096004
sub_8096004: @ 0x08096004
	push {r4, lr}
	adds r4, r0, #0
	bl sub_809735C
	adds r0, r4, #0
	bl sub_8095F54
	adds r4, #0x2e
	ldrb r1, [r4]
	lsls r1, r1, #4
	adds r1, #0x30
	movs r3, #0x80
	lsls r3, r3, #3
	movs r0, #0x1c
	movs r2, #7
	bl sub_80AD51C
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8096004

	THUMB_FUNC_START sub_809602C
sub_809602C: @ 0x0809602C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	adds r7, r0, #0
	add r1, sp, #4
	ldr r0, _08096080  @ gUnknown_08205BC0
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldr r0, [r0]
	str r0, [r1]
	adds r5, r7, #0
	adds r5, #0x2e
	ldrb r0, [r5]
	mov r9, r0
	movs r1, #0x1c
	mov sl, r1
	lsls r0, r0, #4
	adds r6, r0, #0
	adds r6, #0x30
	adds r4, r7, #0
	adds r4, #0x34
	ldrb r2, [r4]
	mov r8, r2
	cmp r2, #0
	beq _08096088
	ldr r0, _08096084  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0x81
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	bne _08096076
	b _08096184
_08096076:
	bl CloseHelpBox
	movs r0, #0
	strb r0, [r4]
	b _08096246
	.align 2, 0
_08096080: .4byte gUnknown_08205BC0
_08096084: .4byte gKeyStatusPtr
_08096088:
	ldr r0, _080960DC  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080960E4
	ldr r0, _080960E0  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080960A8
	movs r0, #0x6a
	bl m4aSongNumStart
_080960A8:
	ldrb r0, [r5]
	adds r1, r7, #0
	adds r1, #0x2f
	ldrb r1, [r1]
	bl sub_8095094
	cmp r0, #2
	bne _080960CA
	movs r2, #0x80
	lsls r2, r2, #1
	mov r3, r8
	str r3, [sp]
	movs r0, #0x37
	adds r1, r2, #0
	movs r3, #0x20
	bl sub_80029E8
_080960CA:
	adds r1, r7, #0
	adds r1, #0x33
	movs r0, #4
	strb r0, [r1]
	adds r0, r7, #0
	movs r1, #8
	bl Proc_Goto
	b _08096246
	.align 2, 0
_080960DC: .4byte gKeyStatusPtr
_080960E0: .4byte gRAMChapterData
_080960E4:
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08096110
	movs r0, #1
	strb r0, [r4]
	ldrb r0, [r5]
	adds r1, r7, #0
	adds r1, #0x2f
	ldrb r1, [r1]
	bl sub_8095094
	lsls r0, r0, #2
	add r0, sp
	adds r0, #4
	ldr r2, [r0]
	movs r0, #0x1c
	adds r1, r6, #0
	bl StartHelpBox
	b _08096246
_08096110:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08096184
	adds r0, r7, #0
	bl sub_8095FD8
	ldr r0, _08096170  @ gUnknown_08A1B658
	ldr r5, _08096174  @ gUnknown_02020188
	adds r1, r5, #0
	bl CopyDataWithPossibleUncomp
	ldr r4, _08096178  @ gUnknown_02023548
	movs r6, #0x80
	lsls r6, r6, #5
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r6, #0
	bl CallARM_FillTileRect
	ldr r0, _0809617C  @ gUnknown_08A1B698
	adds r1, r5, #0
	bl CopyDataWithPossibleUncomp
	adds r4, #0xe2
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r6, #0
	bl CallARM_FillTileRect
	movs r0, #1
	movs r1, #6
	bl sub_8097200
	ldr r0, _08096180  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08096166
	movs r0, #0x6b
	bl m4aSongNumStart
_08096166:
	adds r0, r7, #0
	bl Proc_Break
	b _08096246
	.align 2, 0
_08096170: .4byte gUnknown_08A1B658
_08096174: .4byte gUnknown_02020188
_08096178: .4byte gUnknown_02023548
_0809617C: .4byte gUnknown_08A1B698
_08096180: .4byte gRAMChapterData
_08096184:
	ldr r0, _080961E0  @ gKeyStatusPtr
	ldr r2, [r0]
	ldrh r1, [r2, #6]
	movs r3, #0x40
	adds r0, r3, #0
	ands r0, r1
	adds r5, r7, #0
	adds r5, #0x2e
	cmp r0, #0
	beq _080961B6
	ldrb r0, [r5]
	cmp r0, #0
	bne _080961B2
	ldrh r1, [r2, #8]
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	beq _080961B6
	adds r0, r7, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	bl sub_80950C4
_080961B2:
	subs r0, #1
	strb r0, [r5]
_080961B6:
	ldr r6, _080961E0  @ gKeyStatusPtr
	ldr r0, [r6]
	ldrh r1, [r0, #6]
	movs r4, #0x80
	mov r8, r4
	mov r0, r8
	ands r0, r1
	cmp r0, #0
	beq _080961F4
	ldrb r4, [r5]
	adds r0, r7, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	bl sub_80950C4
	subs r0, #1
	cmp r4, r0
	bge _080961E4
	ldrb r0, [r5]
	adds r0, #1
	b _080961F2
	.align 2, 0
_080961E0: .4byte gKeyStatusPtr
_080961E4:
	ldr r0, [r6]
	ldrh r1, [r0, #8]
	mov r0, r8
	ands r0, r1
	cmp r0, #0
	beq _080961F4
	movs r0, #0
_080961F2:
	strb r0, [r5]
_080961F4:
	ldrb r2, [r5]
	cmp r9, r2
	beq _08096246
	lsls r0, r2, #4
	adds r6, r0, #0
	adds r6, #0x30
	adds r0, r7, #0
	adds r0, #0x34
	ldrb r0, [r0]
	cmp r0, #0
	beq _08096226
	adds r0, r7, #0
	adds r0, #0x2f
	ldrb r1, [r0]
	adds r0, r2, #0
	bl sub_8095094
	lsls r0, r0, #2
	add r0, sp
	adds r0, #4
	ldr r2, [r0]
	mov r0, sl
	adds r1, r6, #0
	bl StartHelpBox
_08096226:
	movs r3, #0x80
	lsls r3, r3, #3
	mov r0, sl
	adds r1, r6, #0
	movs r2, #7
	bl sub_80AD51C
	ldr r0, _08096258  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08096246
	movs r0, #0x66
	bl m4aSongNumStart
_08096246:
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08096258: .4byte gRAMChapterData

	THUMB_FUNC_END sub_809602C

	THUMB_FUNC_START sub_809625C
sub_809625C: @ 0x0809625C
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r4, #1
_08096262:
	adds r0, r4, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq _0809627C
	ldr r0, [r2]
	cmp r0, #0
	beq _0809627C
	ldr r0, [r2, #0xc]
	ldr r1, _08096290  @ 0xFDFFFFFF
	ands r0, r1
	str r0, [r2, #0xc]
_0809627C:
	adds r4, #1
	cmp r4, #0x3f
	ble _08096262
	adds r1, r5, #0
	adds r1, #0x36
	movs r0, #1
	strb r0, [r1]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08096290: .4byte 0xFDFFFFFF

	THUMB_FUNC_END sub_809625C

	THUMB_FUNC_START sub_8096294
sub_8096294: @ 0x08096294
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	bl EndBG3Slider_
	bl sub_8096C20
	movs r0, #0
	bl SetupBackgrounds
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
	bl sub_8001ED0
	movs r0, #1
	bl sub_8001F48
	adds r0, r4, #0
	adds r0, #0x36
	ldrb r0, [r0]
	cmp r0, #0
	beq _080962D8
	adds r0, r4, #0
	bl nullsub_20
_080962D8:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8096294

	THUMB_FUNC_START sub_80962E0
sub_80962E0: @ 0x080962E0
	push {r4, lr}
	adds r4, r0, #0
	bl sub_80956D8
	adds r4, #0x36
	ldrb r0, [r4]
	cmp r0, #0
	beq _080962F6
	bl sub_8034278
	b _08096304
_080962F6:
	bl CheckSomethingSomewhere
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08096304
	bl sub_8042EA8
_08096304:
	bl sub_801240C
	bl SMS_ClearUsageTable
	bl RefreshEntityBmMaps
	bl SMS_UpdateFromGameData
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80962E0

	THUMB_FUNC_START sub_809631C
sub_809631C: @ 0x0809631C
	push {r4, lr}
	adds r4, r0, #0
	bl sub_8095C2C
	adds r0, r4, #0
	adds r0, #0x33
	ldrb r0, [r0]
	subs r0, #1
	cmp r0, #4
	bhi _08096384
	lsls r0, r0, #2
	ldr r1, _0809633C  @ _08096340
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0809633C: .4byte _08096340
_08096340: @ jump table
	.4byte _08096364 @ case 0
	.4byte _0809635C @ case 1
	.4byte _0809637E @ case 2
	.4byte _08096374 @ case 3
	.4byte _08096354 @ case 4
_08096354:
	adds r0, r4, #0
	bl sub_808E79C
	b _08096384
_0809635C:
	adds r0, r4, #0
	bl sub_8099F68
	b _08096384
_08096364:
	ldr r0, _08096370  @ gUnknown_08A18E8C
	adds r1, r4, #0
	bl Proc_StartBlocking
	b _08096384
	.align 2, 0
_08096370: .4byte gUnknown_08A18E8C
_08096374:
	movs r0, #2
	adds r1, r4, #0
	bl sub_80A0944
	b _08096384
_0809637E:
	adds r0, r4, #0
	bl sub_803410C
_08096384:
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_809631C

	THUMB_FUNC_START sub_8096390
sub_8096390: @ 0x08096390
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r4, #0
	adds r5, #0x33
	ldrb r0, [r5]
	cmp r0, #3
	bne _080963AC
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #0x80
	movs r2, #0x20
	movs r3, #0
	bl ISuspectThisToBeMusicRelated_8002730
_080963AC:
	ldrb r0, [r5]
	subs r0, #1
	cmp r0, #4
	bhi _080963F4
	lsls r0, r0, #2
	ldr r1, _080963C0  @ _080963C4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080963C0: .4byte _080963C4
_080963C4: @ jump table
	.4byte _080963EC @ case 0
	.4byte _080963EC @ case 1
	.4byte _080963E2 @ case 2
	.4byte _080963D8 @ case 3
	.4byte _080963EC @ case 4
_080963D8:
	adds r0, r4, #0
	movs r1, #9
	bl Proc_Goto
	b _080963F4
_080963E2:
	adds r0, r4, #0
	movs r1, #7
	bl Proc_Goto
	b _080963F4
_080963EC:
	adds r0, r4, #0
	movs r1, #9
	bl Proc_Goto
_080963F4:
	adds r1, r4, #0
	adds r1, #0x33
	movs r0, #0
	strb r0, [r1]
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8096390

	THUMB_FUNC_START sub_8096404
sub_8096404: @ 0x08096404
	ldr r2, _08096420  @ gLCDControlBuffer
	ldrb r0, [r2, #1]
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
	strb r0, [r2, #1]
	bx lr
	.align 2, 0
_08096420: .4byte gLCDControlBuffer

	THUMB_FUNC_END sub_8096404

	THUMB_FUNC_START sub_8096424
sub_8096424: @ 0x08096424
	push {lr}
	bl CheckSomethingSomewhere
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08096438
	bl AddSkipThread2
	bl BMapDispSuspend
_08096438:
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8096424

	THUMB_FUNC_START sub_809643C
sub_809643C: @ 0x0809643C
	push {lr}
	bl CheckSomethingSomewhere
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08096450
	bl BMapDispResume
	bl SubSkipThread2
_08096450:
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_809643C

	THUMB_FUNC_START sub_8096454
sub_8096454: @ 0x08096454
	push {lr}
	ldr r0, _08096464  @ gUnknown_08A1829C
	movs r1, #3
	bl Proc_Start
	pop {r0}
	bx r0
	.align 2, 0
_08096464: .4byte gUnknown_08A1829C

	THUMB_FUNC_END sub_8096454

	THUMB_FUNC_START sub_8096468
sub_8096468: @ 0x08096468
	push {lr}
	ldr r0, _08096480  @ gUnknown_08A1829C
	movs r1, #3
	bl Proc_Start
	bl sub_8095840
	bl sub_80952D4
	pop {r0}
	bx r0
	.align 2, 0
_08096480: .4byte gUnknown_08A1829C

	THUMB_FUNC_END sub_8096468

	THUMB_FUNC_START sub_8096484
sub_8096484: @ 0x08096484
	push {lr}
	bl HasConvoyAccess
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8096484

	THUMB_FUNC_START sub_8096494
sub_8096494: @ 0x08096494
	push {lr}
	sub sp, #4
	bl sub_808F270
	bl sub_8010E50
	bl APProc_DeleteAll
	ldr r3, _080964F0  @ gLCDControlBuffer
	ldrb r2, [r3, #0xc]
	movs r1, #4
	negs r1, r1
	adds r0, r1, #0
	ands r0, r2
	strb r0, [r3, #0xc]
	ldrb r2, [r3, #0x10]
	adds r0, r1, #0
	ands r0, r2
	movs r2, #1
	orrs r0, r2
	strb r0, [r3, #0x10]
	ldrb r0, [r3, #0x14]
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	strb r1, [r3, #0x14]
	ldrb r0, [r3, #0x18]
	movs r1, #3
	orrs r0, r1
	strb r0, [r3, #0x18]
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
	bl sub_8001ED0
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_080964F0: .4byte gLCDControlBuffer

	THUMB_FUNC_END sub_8096494

	THUMB_FUNC_START sub_80964F4
sub_80964F4: @ 0x080964F4
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r0, #0x80
	lsls r0, r0, #1
	bl GetUnitFromCharId
	adds r5, r0, #0
	cmp r5, #0
	bne _0809650E
	adds r0, r4, #0
	bl Proc_End
	b _08096556
_0809650E:
	bl GetThread2SkipStack
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r1, r4, #0
	adds r1, #0x4c
	movs r4, #0
	strh r0, [r1]
	ldr r2, _0809655C  @ gLCDControlBuffer
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
	subs r1, #0x80
	adds r0, r5, #0
	movs r2, #0
	bl sub_802F598
	ldr r1, _08096560  @ gBattleStats
	movs r0, #0x88
	lsls r0, r0, #1
	strh r0, [r1]
	ldr r0, _08096564  @ gBattleActor
	adds r0, #0x4a
	strh r4, [r0]
	ldr r0, _08096568  @ gBattleTarget
	adds r0, #0x4a
	strh r4, [r0]
	bl BeginBattleAnimations
_08096556:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0809655C: .4byte gLCDControlBuffer
_08096560: .4byte gBattleStats
_08096564: .4byte gBattleActor
_08096568: .4byte gBattleTarget

	THUMB_FUNC_END sub_80964F4

	THUMB_FUNC_START sub_809656C
sub_809656C: @ 0x0809656C
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r0, #0x4c
	movs r1, #0
	ldrsh r4, [r0, r1]
	bl GetThread2SkipStack
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r4, r0
	bne _08096588
	adds r0, r5, #0
	bl Proc_Break
_08096588:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_809656C

	THUMB_FUNC_START sub_8096590
sub_8096590: @ 0x08096590
	push {r4, lr}
	sub sp, #4
	movs r4, #0x80
	lsls r4, r4, #1
	adds r0, r4, #0
	bl GetUnitFromCharId
	adds r1, r0, #0
	cmp r1, #0
	beq _080965A8
	movs r0, #0xff
	strb r0, [r1, #9]
_080965A8:
	movs r0, #3
	movs r1, #0
	movs r2, #0
	movs r3, #0x10
	bl SetSpecialColorEffectsParameters
	ldr r2, _080965EC  @ gLCDControlBuffer
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
	movs r0, #0
	str r0, [sp]
	movs r0, #0x34
	adds r1, r4, #0
	adds r2, r4, #0
	movs r3, #0x20
	bl sub_80029E8
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080965EC: .4byte gLCDControlBuffer

	THUMB_FUNC_END sub_8096590

	THUMB_FUNC_START sub_80965F0
sub_80965F0: @ 0x080965F0
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	bl sub_808F270
	bl sub_8010E50
	bl APProc_DeleteAll
	ldr r3, _08096660  @ gLCDControlBuffer
	ldrb r2, [r3, #0xc]
	movs r1, #4
	negs r1, r1
	adds r0, r1, #0
	ands r0, r2
	strb r0, [r3, #0xc]
	ldrb r2, [r3, #0x10]
	adds r0, r1, #0
	ands r0, r2
	movs r2, #1
	orrs r0, r2
	strb r0, [r3, #0x10]
	ldrb r0, [r3, #0x14]
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	strb r1, [r3, #0x14]
	ldrb r0, [r3, #0x18]
	movs r1, #3
	orrs r0, r1
	strb r0, [r3, #0x18]
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
	bl sub_8001ED0
	adds r0, r4, #0
	bl sub_80ADDD4
	ldr r0, _08096664  @ gUnknown_08A184B4
	adds r1, r4, #0
	bl Proc_StartBlocking
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08096660: .4byte gLCDControlBuffer
_08096664: .4byte gUnknown_08A184B4

	THUMB_FUNC_END sub_80965F0

	THUMB_FUNC_START sub_8096668
sub_8096668: @ 0x08096668
	push {lr}
	sub sp, #4
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #0
	str r0, [sp]
	movs r2, #0
	movs r3, #0x20
	bl sub_80029E8
	add sp, #4
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8096668

	THUMB_FUNC_START NewPrepScreenTraineePromotionManager
NewPrepScreenTraineePromotionManager: @ 0x08096684
	push {lr}
	ldr r0, _08096694  @ gUnknown_08A184F4
	movs r1, #3
	bl Proc_Start
	pop {r0}
	bx r0
	.align 2, 0
_08096694: .4byte gUnknown_08A184F4

	THUMB_FUNC_END NewPrepScreenTraineePromotionManager

	THUMB_FUNC_START PrepScreenTraineePromotionManagerExists
PrepScreenTraineePromotionManagerExists: @ 0x08096698
	push {lr}
	ldr r0, _080966AC  @ gUnknown_08A184F4
	bl Proc_Find
	cmp r0, #0
	beq _080966A6
	movs r0, #1
_080966A6:
	pop {r1}
	bx r1
	.align 2, 0
_080966AC: .4byte gUnknown_08A184F4

	THUMB_FUNC_END PrepScreenTraineePromotionManagerExists

	THUMB_FUNC_START sub_80966B0
sub_80966B0: @ 0x080966B0
	push {lr}
	ldr r0, _080966C4  @ gUnknown_08A1829C
	bl Proc_Find
	cmp r0, #0
	beq _080966BE
	movs r0, #1
_080966BE:
	pop {r1}
	bx r1
	.align 2, 0
_080966C4: .4byte gUnknown_08A1829C

	THUMB_FUNC_END sub_80966B0

	THUMB_FUNC_START sub_80966C8
sub_80966C8: @ 0x080966C8
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	ldr r3, _080966EC  @ gUnknown_08A1856E
	str r2, [sp]
	movs r0, #4
	adds r1, r4, #0
	adds r2, r5, #0
	bl PutSpriteExt
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080966EC: .4byte gUnknown_08A1856E

	THUMB_FUNC_END sub_80966C8

	THUMB_FUNC_START sub_80966F0
sub_80966F0: @ 0x080966F0
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r6, r0, #0
	mov r9, r1
	adds r4, r2, #0
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	mov r8, r3
	movs r0, #1
	ands r0, r4
	cmp r0, #0
	beq _08096724
	subs r6, #4
	adds r1, r6, #0
	adds r1, #0x40
	ldr r0, _08096750  @ gUnknown_08A18614
	ldr r3, [r0, #0x28]
	mov r0, r8
	str r0, [sp]
	movs r0, #4
	mov r2, r9
	bl PutSpriteExt
_08096724:
	ldr r3, _08096754  @ gUnknown_08A18582
	mov r0, r8
	str r0, [sp]
	movs r0, #4
	adds r1, r6, #0
	mov r2, r9
	bl PutSpriteExt
	asrs r7, r4, #1
	cmp r7, #9
	bgt _08096758
	adds r1, r6, #0
	adds r1, #0x30
	ldr r0, _08096750  @ gUnknown_08A18614
	ldr r3, [r0, #0x2c]
	mov r0, r8
	str r0, [sp]
	movs r0, #4
	mov r2, r9
	bl PutSpriteExt
	b _0809677A
	.align 2, 0
_08096750: .4byte gUnknown_08A18614
_08096754: .4byte gUnknown_08A18582
_08096758:
	adds r5, r6, #0
	adds r5, #0x30
	ldr r4, _080967AC  @ gUnknown_08A18614
	adds r0, r7, #0
	movs r1, #0xa
	bl __divsi3
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r3, [r0]
	mov r0, r8
	str r0, [sp]
	movs r0, #4
	adds r1, r5, #0
	mov r2, r9
	bl PutSpriteExt
_0809677A:
	adds r5, r6, #0
	adds r5, #0x38
	ldr r4, _080967AC  @ gUnknown_08A18614
	adds r0, r7, #0
	movs r1, #0xa
	bl __modsi3
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r3, [r0]
	mov r0, r8
	str r0, [sp]
	movs r0, #4
	adds r1, r5, #0
	mov r2, r9
	bl PutSpriteExt
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080967AC: .4byte gUnknown_08A18614

	THUMB_FUNC_END sub_80966F0

	THUMB_FUNC_START sub_80967B0
sub_80967B0: @ 0x080967B0
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r6, r0, #0
	mov r9, r1
	adds r4, r2, #0
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	mov r8, r3
	movs r0, #1
	ands r0, r4
	cmp r0, #0
	beq _080967E4
	subs r6, #4
	adds r1, r6, #0
	adds r1, #0x40
	ldr r0, _08096810  @ gUnknown_08A18614
	ldr r3, [r0, #0x28]
	mov r0, r8
	str r0, [sp]
	movs r0, #4
	mov r2, r9
	bl PutSpriteExt
_080967E4:
	ldr r3, _08096814  @ gUnknown_08A18590
	mov r0, r8
	str r0, [sp]
	movs r0, #4
	adds r1, r6, #0
	mov r2, r9
	bl PutSpriteExt
	asrs r7, r4, #1
	cmp r7, #9
	bgt _08096818
	adds r1, r6, #0
	adds r1, #0x30
	ldr r0, _08096810  @ gUnknown_08A18614
	ldr r3, [r0, #0x2c]
	mov r0, r8
	str r0, [sp]
	movs r0, #4
	mov r2, r9
	bl PutSpriteExt
	b _0809683A
	.align 2, 0
_08096810: .4byte gUnknown_08A18614
_08096814: .4byte gUnknown_08A18590
_08096818:
	adds r5, r6, #0
	adds r5, #0x30
	ldr r4, _0809686C  @ gUnknown_08A18614
	adds r0, r7, #0
	movs r1, #0xa
	bl __divsi3
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r3, [r0]
	mov r0, r8
	str r0, [sp]
	movs r0, #4
	adds r1, r5, #0
	mov r2, r9
	bl PutSpriteExt
_0809683A:
	adds r5, r6, #0
	adds r5, #0x38
	ldr r4, _0809686C  @ gUnknown_08A18614
	adds r0, r7, #0
	movs r1, #0xa
	bl __modsi3
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r3, [r0]
	mov r0, r8
	str r0, [sp]
	movs r0, #4
	adds r1, r5, #0
	mov r2, r9
	bl PutSpriteExt
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809686C: .4byte gUnknown_08A18614

	THUMB_FUNC_END sub_80967B0

	THUMB_FUNC_START sub_8096870
sub_8096870: @ 0x08096870
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r6, r0, #0
	mov r9, r1
	adds r4, r2, #0
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	mov r8, r3
	movs r0, #1
	ands r0, r4
	cmp r0, #0
	beq _080968A4
	subs r6, #4
	adds r1, r6, #0
	adds r1, #0x3c
	ldr r0, _080968D0  @ gUnknown_08A18614
	ldr r3, [r0, #0x28]
	mov r0, r8
	str r0, [sp]
	movs r0, #4
	mov r2, r9
	bl PutSpriteExt
_080968A4:
	adds r1, r6, #4
	ldr r3, _080968D4  @ gUnknown_08A1859E
	mov r0, r8
	str r0, [sp]
	movs r0, #4
	mov r2, r9
	bl PutSpriteExt
	asrs r7, r4, #1
	cmp r7, #9
	bgt _080968D8
	adds r1, r6, #0
	adds r1, #0x2c
	ldr r0, _080968D0  @ gUnknown_08A18614
	ldr r3, [r0, #0x2c]
	mov r0, r8
	str r0, [sp]
	movs r0, #4
	mov r2, r9
	bl PutSpriteExt
	b _080968FA
	.align 2, 0
_080968D0: .4byte gUnknown_08A18614
_080968D4: .4byte gUnknown_08A1859E
_080968D8:
	adds r5, r6, #0
	adds r5, #0x2c
	ldr r4, _0809692C  @ gUnknown_08A18614
	adds r0, r7, #0
	movs r1, #0xa
	bl __divsi3
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r3, [r0]
	mov r0, r8
	str r0, [sp]
	movs r0, #4
	adds r1, r5, #0
	mov r2, r9
	bl PutSpriteExt
_080968FA:
	adds r5, r6, #0
	adds r5, #0x34
	ldr r4, _0809692C  @ gUnknown_08A18614
	adds r0, r7, #0
	movs r1, #0xa
	bl __modsi3
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r3, [r0]
	mov r0, r8
	str r0, [sp]
	movs r0, #4
	adds r1, r5, #0
	mov r2, r9
	bl PutSpriteExt
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809692C: .4byte gUnknown_08A18614

	THUMB_FUNC_END sub_8096870

	THUMB_FUNC_START sub_8096930
sub_8096930: @ 0x08096930
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	ldr r3, _08096954  @ gUnknown_08A185AC
	str r2, [sp]
	movs r0, #4
	adds r1, r4, #0
	adds r2, r5, #0
	bl PutSpriteExt
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08096954: .4byte gUnknown_08A185AC

	THUMB_FUNC_END sub_8096930

	THUMB_FUNC_START sub_8096958
sub_8096958: @ 0x08096958
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r7, r0, #0
	movs r4, #0xa0
	movs r5, #8
	bl CheckSomethingSomewhere
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08096974
	b _08096A80
_08096974:
	adds r0, r7, #0
	adds r0, #0x30
	ldrb r0, [r0]
	cmp r0, #4
	bhi _080969E8
	lsls r0, r0, #2
	ldr r1, _08096988  @ _0809698C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08096988: .4byte _0809698C
_0809698C: @ jump table
	.4byte _080969E8 @ case 0
	.4byte _080969A0 @ case 1
	.4byte _080969B4 @ case 2
	.4byte _080969C8 @ case 3
	.4byte _080969DC @ case 4
_080969A0:
	adds r0, r7, #0
	adds r0, #0x2f
	ldrb r2, [r0]
	movs r3, #0xc7
	lsls r3, r3, #7
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_80966F0
	b _080969E8
_080969B4:
	adds r0, r7, #0
	adds r0, #0x2f
	ldrb r2, [r0]
	movs r3, #0xc7
	lsls r3, r3, #7
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_80967B0
	b _080969E8
_080969C8:
	adds r0, r7, #0
	adds r0, #0x2f
	ldrb r2, [r0]
	movs r3, #0xc7
	lsls r3, r3, #7
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_8096870
	b _080969E8
_080969DC:
	movs r2, #0xc7
	lsls r2, r2, #7
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_8096930
_080969E8:
	movs r0, #0x33
	adds r0, r0, r7
	mov r8, r0
	movs r1, #0x34
	adds r1, r1, r7
	mov r9, r1
	ldr r6, _08096A6C  @ 0x0000B6C0
	movs r5, #0x80
	movs r4, #2
_080969FA:
	str r6, [sp]
	movs r0, #4
	adds r1, r5, #0
	movs r2, #0x18
	ldr r3, _08096A70  @ gObject_32x16
	bl PutSpriteExt
	adds r6, #4
	adds r5, #0x20
	subs r4, #1
	cmp r4, #0
	bge _080969FA
	mov r1, r8
	ldrb r0, [r1]
	cmp r0, #0
	bne _08096A26
	ldrh r0, [r7, #0x36]
	lsrs r0, r0, #2
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _08096A38
_08096A26:
	ldr r3, _08096A74  @ gUnknown_08A18E4E
	movs r0, #0xc0
	lsls r0, r0, #2
	str r0, [sp]
	movs r0, #4
	movs r1, #0x14
	movs r2, #0x8c
	bl PutSpriteExt
_08096A38:
	mov r1, r9
	ldrb r0, [r1]
	cmp r0, #0
	bne _08096A4C
	ldrh r0, [r7, #0x36]
	lsrs r0, r0, #2
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _08096A5E
_08096A4C:
	ldr r3, _08096A78  @ gUnknown_08A18E76
	movs r0, #0xc0
	lsls r0, r0, #2
	str r0, [sp]
	movs r0, #4
	movs r1, #0x64
	movs r2, #0x8c
	bl PutSpriteExt
_08096A5E:
	ldr r2, _08096A7C  @ 0x00009380
	movs r0, #0x74
	movs r1, #0x28
	bl sub_80966C8
	b _08096AA4
	.align 2, 0
_08096A6C: .4byte 0x0000B6C0
_08096A70: .4byte gObject_32x16
_08096A74: .4byte gUnknown_08A18E4E
_08096A78: .4byte gUnknown_08A18E76
_08096A7C: .4byte 0x00009380
_08096A80:
	bl sub_8095264
	cmp r0, #0
	beq _08096A9A
	ldr r3, _08096AB4  @ gUnknown_08A18E62
	movs r0, #0xc0
	lsls r0, r0, #2
	str r0, [sp]
	movs r0, #4
	movs r1, #0x14
	movs r2, #0x8c
	bl PutSpriteExt
_08096A9A:
	ldr r2, _08096AB8  @ 0x00009380
	movs r0, #0x74
	movs r1, #0x20
	bl sub_80966C8
_08096AA4:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08096AB4: .4byte gUnknown_08A18E62
_08096AB8: .4byte 0x00009380

	THUMB_FUNC_END sub_8096958

	THUMB_FUNC_START sub_8096ABC
sub_8096ABC: @ 0x08096ABC
	push {r4, r5, lr}
	sub sp, #8
	adds r5, r0, #0
	adds r1, r5, #0
	adds r1, #0x2a
	movs r0, #0
	strb r0, [r1]
	strh r0, [r5, #0x36]
	bl SMS_FlushIndirect
	bl CheckSomethingSomewhere
	lsls r0, r0, #0x18
	asrs r1, r0, #0x18
	cmp r1, #0
	beq _08096AFC
	ldr r0, _08096AF4  @ gUnknown_08A1B194
	ldr r3, _08096AF8  @ 0x00009E40
	movs r1, #1
	str r1, [sp]
	movs r1, #0xd
	str r1, [sp, #4]
	movs r1, #0x3c
	movs r2, #0x10
	bl APProc_Create
	str r0, [r5, #0x38]
	b _08096B86
	.align 2, 0
_08096AF4: .4byte gUnknown_08A1B194
_08096AF8: .4byte 0x00009E40
_08096AFC:
	ldr r0, _08096B28  @ gUnknown_08A1B194
	ldr r3, _08096B2C  @ 0x00009E40
	str r1, [sp]
	movs r1, #0xd
	str r1, [sp, #4]
	movs r1, #0x3c
	movs r2, #0x10
	bl APProc_Create
	str r0, [r5, #0x38]
	ldr r0, _08096B30  @ gRAMChapterData
	movs r4, #0xe
	ldrsb r4, [r0, r4]
	adds r0, r4, #0
	subs r0, #0x24
	cmp r0, #9
	bhi _08096B34
	adds r1, r5, #0
	adds r1, #0x30
	movs r0, #2
	b _08096B74
	.align 2, 0
_08096B28: .4byte gUnknown_08A1B194
_08096B2C: .4byte 0x00009E40
_08096B30: .4byte gRAMChapterData
_08096B34:
	adds r0, r4, #0
	subs r0, #0x2e
	cmp r0, #9
	bhi _08096B44
	adds r1, r5, #0
	adds r1, #0x30
	movs r0, #3
	b _08096B74
_08096B44:
	adds r0, r4, #0
	bl sub_80C0960
	cmp r0, #0
	beq _08096B56
	adds r1, r5, #0
	adds r1, #0x30
	movs r0, #4
	b _08096B74
_08096B56:
	adds r0, r4, #0
	subs r0, #0x15
	cmp r0, #1
	bls _08096B66
	cmp r4, #0x22
	beq _08096B66
	cmp r4, #0x23
	bne _08096B6E
_08096B66:
	adds r1, r5, #0
	adds r1, #0x30
	movs r0, #0
	b _08096B74
_08096B6E:
	adds r1, r5, #0
	adds r1, #0x30
	movs r0, #1
_08096B74:
	strb r0, [r1]
	adds r0, r4, #0
	bl GetROMChapterStruct
	adds r0, #0x80
	ldrb r0, [r0]
	adds r1, r5, #0
	adds r1, #0x2f
	strb r0, [r1]
_08096B86:
	adds r1, r5, #0
	adds r1, #0x2b
	movs r0, #0
	strb r0, [r1]
	adds r0, r5, #0
	adds r0, #0x33
	movs r1, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8096ABC

	THUMB_FUNC_START sub_8096BA4
sub_8096BA4: @ 0x08096BA4
	push {r4, lr}
	adds r4, r0, #0
	bl sub_8096958
	ldrh r0, [r4, #0x36]
	adds r0, #1
	strh r0, [r4, #0x36]
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8096BA4

	THUMB_FUNC_START sub_8096BB8
sub_8096BB8: @ 0x08096BB8
	push {lr}
	ldr r0, [r0, #0x38]
	bl APProc_Delete
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8096BB8

	THUMB_FUNC_START sub_8096BC4
sub_8096BC4: @ 0x08096BC4
	push {lr}
	ldr r0, _08096BDC  @ gUnknown_08A186B4
	bl Proc_Find
	cmp r0, #0
	beq _08096BD8
	adds r1, r0, #0
	adds r1, #0x33
	movs r0, #0
	strb r0, [r1]
_08096BD8:
	pop {r0}
	bx r0
	.align 2, 0
_08096BDC: .4byte gUnknown_08A186B4

	THUMB_FUNC_END sub_8096BC4

	THUMB_FUNC_START sub_8096BE0
sub_8096BE0: @ 0x08096BE0
	push {lr}
	ldr r0, _08096BF8  @ gUnknown_08A186B4
	bl Proc_Find
	cmp r0, #0
	beq _08096BF4
	adds r1, r0, #0
	adds r1, #0x34
	movs r0, #0
	strb r0, [r1]
_08096BF4:
	pop {r0}
	bx r0
	.align 2, 0
_08096BF8: .4byte gUnknown_08A186B4

	THUMB_FUNC_END sub_8096BE0

	THUMB_FUNC_START sub_8096BFC
sub_8096BFC: @ 0x08096BFC
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _08096C1C  @ gUnknown_08A186B4
	adds r0, r4, #0
	bl Proc_Find
	bl Proc_End
	adds r0, r4, #0
	adds r1, r5, #0
	bl Proc_Start
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08096C1C: .4byte gUnknown_08A186B4

	THUMB_FUNC_END sub_8096BFC

	THUMB_FUNC_START sub_8096C20
sub_8096C20: @ 0x08096C20
	push {lr}
	ldr r0, _08096C30  @ gUnknown_08A186B4
	bl Proc_Find
	bl Proc_End
	pop {r0}
	bx r0
	.align 2, 0
_08096C30: .4byte gUnknown_08A186B4

	THUMB_FUNC_END sub_8096C20

	THUMB_FUNC_START sub_8096C34
sub_8096C34: @ 0x08096C34
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r2, r0, #0
	adds r3, r2, #0
	subs r3, #0x38
	cmp r3, #0
	bge _08096C4A
	movs r7, #0
	adds r6, r2, #0
	b _08096C60
_08096C4A:
	adds r0, r2, #0
	adds r0, #0x38
	cmp r0, #0xf0
	ble _08096C5A
	movs r7, #0xf
	adds r6, r2, #0
	subs r6, #0x78
	b _08096C60
_08096C5A:
	asrs r7, r3, #3
	lsls r0, r7, #3
	subs r6, r2, r0
_08096C60:
	adds r3, r1, #0
	subs r3, #0x28
	adds r0, r1, #0
	adds r0, #0x30
	cmp r0, #0xa0
	ble _08096C72
	movs r5, #8
	subs r1, #0x40
	b _08096C82
_08096C72:
	adds r0, r3, #0
	cmp r0, #0
	bge _08096C7C
	adds r0, r1, #0
	subs r0, #0x21
_08096C7C:
	asrs r5, r0, #3
	lsls r0, r5, #3
	subs r1, r1, r0
_08096C82:
	mov r8, r1
	ldr r4, _08096CC8  @ gUnknown_02022CB0
	adds r0, r4, #0
	movs r1, #2
	adds r2, r7, #0
	bl DrawDecNumber
	adds r0, r4, #0
	adds r0, #0x80
	movs r1, #2
	adds r2, r5, #0
	bl DrawDecNumber
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r4, r1
	movs r1, #2
	adds r2, r6, #0
	bl DrawDecNumber
	movs r1, #0xc0
	lsls r1, r1, #1
	adds r0, r4, r1
	movs r1, #2
	mov r2, r8
	bl DrawDecNumber
	movs r0, #1
	bl BG_EnableSyncByMask
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08096CC8: .4byte gUnknown_02022CB0

	THUMB_FUNC_END sub_8096C34

	THUMB_FUNC_START sub_8096CCC
sub_8096CCC: @ 0x08096CCC
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r2, #0
	movs r1, #7
	adds r0, #0x54
_08096CD6:
	str r2, [r0]
	subs r0, #4
	subs r1, #1
	cmp r1, #0
	bge _08096CD6
	movs r4, #0
	adds r0, r5, #0
	adds r0, #0x2a
	strb r4, [r0]
	adds r0, #1
	strb r4, [r0]
	adds r0, r5, #0
	bl sub_80AD47C
	movs r0, #0xc0
	lsls r0, r0, #3
	movs r1, #1
	bl sub_80AD4A0
	str r4, [r5, #0x58]
	str r4, [r5, #0x5c]
	str r4, [r5, #0x60]
	adds r0, r5, #0
	adds r0, #0x29
	strb r4, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8096CCC

	THUMB_FUNC_START sub_8096D10
sub_8096D10: @ 0x08096D10
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	adds r4, r0, #0
	adds r5, r4, #0
	adds r5, #0x2a
	ldrb r0, [r5]
	mov r9, r0
	movs r1, #0x34
	ldrsh r0, [r4, r1]
	adds r0, #1
	lsls r0, r0, #3
	adds r0, #4
	mov r8, r0
	movs r2, #0x36
	ldrsh r0, [r4, r2]
	adds r0, #1
	lsls r0, r0, #3
	mov r2, r9
	lsls r1, r2, #4
	adds r7, r0, r1
	movs r3, #0x80
	lsls r3, r3, #3
	mov r0, r8
	adds r1, r7, #0
	movs r2, #6
	bl sub_80AD51C
	ldrb r1, [r5]
	lsls r1, r1, #2
	adds r0, r4, #0
	adds r0, #0x38
	adds r0, r0, r1
	ldr r5, [r0]
	adds r6, r4, #0
	adds r6, #0x29
	movs r0, #0
	ldrsb r0, [r6, r0]
	cmp r0, #0
	beq _08096D84
	ldr r2, _08096D80  @ gKeyStatusPtr
	ldr r0, [r2]
	ldrh r1, [r0, #8]
	movs r0, #0x81
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	bne _08096D74
	b _08096E8C
_08096D74:
	bl CloseHelpBox
	movs r0, #0
	strb r0, [r6]
	b _08096F34
	.align 2, 0
_08096D80: .4byte gKeyStatusPtr
_08096D84:
	ldr r1, _08096DAC  @ gKeyStatusPtr
	ldr r0, [r1]
	ldrh r3, [r0, #8]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r3
	adds r2, r1, #0
	cmp r0, #0
	beq _08096DB0
	ldr r2, [r5, #0x30]
	cmp r2, #0
	bne _08096D9E
	b _08096F34
_08096D9E:
	mov r0, r8
	adds r1, r7, #0
	bl StartHelpBox
	movs r0, #1
	strb r0, [r6]
	b _08096F34
	.align 2, 0
_08096DAC: .4byte gKeyStatusPtr
_08096DB0:
	movs r6, #1
	adds r0, r6, #0
	ands r0, r3
	cmp r0, #0
	beq _08096DF8
	adds r0, r5, #0
	adds r0, #0x38
	ldrb r1, [r0]
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	bne _08096E74
	ldr r0, [r5, #0x2c]
	cmp r0, #0
	beq _08096E74
	adds r0, r4, #0
	movs r1, #0
	bl Proc_Goto
	ldr r0, [r4, #0x14]
	ldr r1, [r5, #0x2c]
	bl _call_via_r1
	ldr r0, _08096DF4  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	bge _08096DEC
	b _08096F34
_08096DEC:
	movs r0, #0x6a
	bl m4aSongNumStart
	b _08096F34
	.align 2, 0
_08096DF4: .4byte gRAMChapterData
_08096DF8:
	movs r0, #2
	ands r0, r3
	cmp r0, #0
	beq _08096E38
	ldr r1, [r4, #0x58]
	cmp r1, #0
	bne _08096E08
	b _08096F34
_08096E08:
	ldr r0, [r4, #0x14]
	bl _call_via_r1
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08096E74
	adds r0, r4, #0
	movs r1, #0
	bl Proc_Goto
	ldr r0, _08096E34  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	bge _08096E2A
	b _08096F34
_08096E2A:
	movs r0, #0x6b
	bl m4aSongNumStart
	b _08096F34
	.align 2, 0
_08096E34: .4byte gRAMChapterData
_08096E38:
	movs r0, #8
	ands r0, r3
	cmp r0, #0
	beq _08096E8C
	ldr r1, [r4, #0x5c]
	cmp r1, #0
	beq _08096F34
	ldr r0, [r4, #0x14]
	bl _call_via_r1
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08096E74
	ldr r0, _08096E70  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08096E64
	movs r0, #0x6a
	bl m4aSongNumStart
_08096E64:
	adds r0, r4, #0
	movs r1, #0
	bl Proc_Goto
	b _08096F34
	.align 2, 0
_08096E70: .4byte gRAMChapterData
_08096E74:
	ldr r0, _08096E88  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08096F34
	movs r0, #0x6c
	bl m4aSongNumStart
	b _08096F34
	.align 2, 0
_08096E88: .4byte gRAMChapterData
_08096E8C:
	ldr r3, [r2]
	ldrh r1, [r3, #6]
	movs r6, #0x40
	adds r0, r6, #0
	ands r0, r1
	adds r5, r4, #0
	adds r5, #0x2a
	cmp r0, #0
	beq _08096EB8
	ldrb r0, [r5]
	cmp r0, #0
	bne _08096EB4
	ldrh r1, [r3, #8]
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	beq _08096EB8
	adds r0, r4, #0
	adds r0, #0x2b
	ldrb r0, [r0]
_08096EB4:
	subs r0, #1
	strb r0, [r5]
_08096EB8:
	ldr r2, [r2]
	ldrh r1, [r2, #6]
	movs r3, #0x80
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	beq _08096EE6
	ldrb r1, [r5]
	adds r0, r4, #0
	adds r0, #0x2b
	ldrb r0, [r0]
	subs r0, #1
	cmp r1, r0
	bge _08096ED8
	adds r0, r1, #1
	b _08096EE4
_08096ED8:
	ldrh r1, [r2, #8]
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	beq _08096EE6
	movs r0, #0
_08096EE4:
	strb r0, [r5]
_08096EE6:
	ldrb r0, [r5]
	cmp r9, r0
	beq _08096F34
	ldr r0, _08096F40  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08096EFE
	movs r0, #0x66
	bl m4aSongNumStart
_08096EFE:
	adds r0, r4, #0
	adds r0, #0x29
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _08096F34
	movs r1, #0x34
	ldrsh r0, [r4, r1]
	adds r0, #1
	lsls r0, r0, #3
	adds r0, #4
	movs r2, #0x36
	ldrsh r1, [r4, r2]
	adds r1, #1
	lsls r1, r1, #3
	ldrb r3, [r5]
	lsls r2, r3, #4
	adds r1, r1, r2
	lsls r3, r3, #2
	adds r2, r4, #0
	adds r2, #0x38
	adds r2, r2, r3
	ldr r5, [r2]
	ldr r2, [r5, #0x30]
	bl StartHelpBox
_08096F34:
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08096F40: .4byte gRAMChapterData

	THUMB_FUNC_END sub_8096D10

	THUMB_FUNC_START sub_8096F44
sub_8096F44: @ 0x08096F44
	push {lr}
	adds r2, r0, #0
	movs r1, #0x34
	ldrsh r0, [r2, r1]
	adds r0, #1
	lsls r0, r0, #3
	adds r0, #4
	movs r3, #0x36
	ldrsh r1, [r2, r3]
	adds r1, #1
	lsls r1, r1, #3
	adds r2, #0x2a
	ldrb r2, [r2]
	lsls r2, r2, #4
	adds r1, r1, r2
	bl DisplayFrozenUiHand
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8096F44

	THUMB_FUNC_START sub_8096F6C
sub_8096F6C: @ 0x08096F6C
	push {lr}
	adds r2, r0, #0
	movs r1, #0x34
	ldrsh r0, [r2, r1]
	adds r0, #1
	lsls r0, r0, #3
	adds r0, #4
	movs r3, #0x36
	ldrsh r1, [r2, r3]
	adds r1, #1
	lsls r1, r1, #3
	adds r2, #0x2a
	ldrb r2, [r2]
	lsls r2, r2, #4
	adds r1, r1, r2
	movs r3, #0x80
	lsls r3, r3, #3
	movs r2, #6
	bl sub_80AD51C
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8096F6C

	THUMB_FUNC_START sub_8096F98
sub_8096F98: @ 0x08096F98
	push {lr}
	ldr r1, [r0, #0x60]
	cmp r1, #0
	beq _08096FA6
	ldr r0, [r0, #0x14]
	bl _call_via_r1
_08096FA6:
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8096F98

	THUMB_FUNC_START sub_8096FAC
sub_8096FAC: @ 0x08096FAC
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _08096FCC  @ gUnknown_08A186EC
	adds r0, r4, #0
	bl Proc_Find
	bl Proc_End
	adds r0, r4, #0
	adds r1, r5, #0
	bl Proc_Start
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08096FCC: .4byte gUnknown_08A186EC

	THUMB_FUNC_END sub_8096FAC

	THUMB_FUNC_START sub_8096FD0
sub_8096FD0: @ 0x08096FD0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08096FE8  @ gUnknown_08A186EC
	bl Proc_Find
	cmp r0, #0
	beq _08096FE0
	str r4, [r0, #0x58]
_08096FE0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08096FE8: .4byte gUnknown_08A186EC

	THUMB_FUNC_END sub_8096FD0

	THUMB_FUNC_START sub_8096FEC
sub_8096FEC: @ 0x08096FEC
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08097004  @ gUnknown_08A186EC
	bl Proc_Find
	cmp r0, #0
	beq _08096FFC
	str r4, [r0, #0x5c]
_08096FFC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08097004: .4byte gUnknown_08A186EC

	THUMB_FUNC_END sub_8096FEC

	THUMB_FUNC_START sub_8097008
sub_8097008: @ 0x08097008
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08097020  @ gUnknown_08A186EC
	bl Proc_Find
	cmp r0, #0
	beq _08097018
	str r4, [r0, #0x60]
_08097018:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08097020: .4byte gUnknown_08A186EC

	THUMB_FUNC_END sub_8097008

	THUMB_FUNC_START sub_8097024
sub_8097024: @ 0x08097024
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	adds r6, r0, #0
	adds r7, r1, #0
	mov r8, r2
	mov r9, r3
	ldr r0, _08097074  @ gUnknown_08A186EC
	bl Proc_Find
	adds r1, r0, #0
	cmp r1, #0
	beq _080970B8
	movs r4, #0
	movs r0, #0x38
	adds r0, r0, r1
	mov sl, r0
	mov r3, sl
_0809704C:
	ldr r2, [r3]
	cmp r2, #0
	beq _08097078
	adds r0, r2, #0
	adds r0, #0x39
	ldrb r0, [r0]
	cmp r0, r6
	bne _08097078
	str r7, [r2, #0x2c]
	adds r0, r2, #0
	adds r0, #0x38
	mov r1, r8
	strb r1, [r0]
	ldr r0, [r3]
	mov r2, r9
	str r2, [r0, #0x34]
	ldr r1, [sp, #0x20]
	str r1, [r0, #0x30]
	b _080970B8
	.align 2, 0
_08097074: .4byte gUnknown_08A186EC
_08097078:
	adds r3, #4
	adds r4, #1
	cmp r4, #7
	ble _0809704C
	adds r5, r1, #0
	adds r5, #0x2b
	ldrb r4, [r5]
	ldr r0, _080970C8  @ gUnknown_08A186DC
	bl Proc_Start
	lsls r1, r4, #2
	add r1, sl
	str r0, [r1]
	adds r0, #0x39
	strb r6, [r0]
	ldr r0, [r1]
	str r7, [r0, #0x2c]
	adds r0, #0x38
	mov r2, r8
	strb r2, [r0]
	ldr r0, [r1]
	mov r1, r9
	str r1, [r0, #0x34]
	ldr r2, [sp, #0x20]
	str r2, [r0, #0x30]
	adds r0, #0x3c
	movs r1, #7
	bl Text_Init
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
_080970B8:
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080970C8: .4byte gUnknown_08A186DC

	THUMB_FUNC_END sub_8097024

	THUMB_FUNC_START sub_80970CC
sub_80970CC: @ 0x080970CC
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r4, #0
	ldr r0, _080970F8  @ gUnknown_08A186EC
	bl Proc_Find
	cmp r0, #0
	beq _08097106
	movs r2, #0
	adds r3, r0, #0
	adds r3, #0x2a
	adds r1, r0, #0
	adds r1, #0x38
_080970E6:
	ldr r0, [r1]
	cmp r0, #0
	beq _080970FE
	adds r0, #0x39
	ldrb r0, [r0]
	cmp r0, r5
	bne _080970FC
	strb r4, [r3]
	b _08097106
	.align 2, 0
_080970F8: .4byte gUnknown_08A186EC
_080970FC:
	adds r4, #1
_080970FE:
	adds r1, #4
	adds r2, #1
	cmp r2, #7
	ble _080970E6
_08097106:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80970CC

	THUMB_FUNC_START sub_809710C
sub_809710C: @ 0x0809710C
	push {r4, r5, lr}
	movs r4, #0
	ldr r0, _0809713C  @ gUnknown_08A186EC
	bl Proc_Find
	cmp r0, #0
	beq _0809714A
	movs r3, #0
	movs r1, #0x2a
	adds r1, r1, r0
	mov ip, r1
	adds r2, r0, #0
	adds r2, #0x38
_08097126:
	ldr r1, [r2]
	cmp r1, #0
	beq _08097142
	mov r5, ip
	ldrb r0, [r5]
	cmp r0, r4
	bne _08097140
	adds r0, r1, #0
	adds r0, #0x39
	ldrb r0, [r0]
	b _0809714C
	.align 2, 0
_0809713C: .4byte gUnknown_08A186EC
_08097140:
	adds r4, #1
_08097142:
	adds r2, #4
	adds r3, #1
	cmp r3, #7
	ble _08097126
_0809714A:
	movs r0, #0
_0809714C:
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_809710C

	THUMB_FUNC_START sub_8097154
sub_8097154: @ 0x08097154
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	sub sp, #8
	adds r6, r0, #0
	adds r5, r1, #0
	ldr r0, _080971F8  @ gUnknown_08A186EC
	bl Proc_Find
	mov r8, r0
	cmp r0, #0
	beq _080971EA
	movs r0, #0
	mov r1, r8
	strh r6, [r1, #0x34]
	strh r5, [r1, #0x36]
	mov r4, r8
	adds r4, #0x2b
	ldrb r3, [r4]
	lsls r3, r3, #1
	adds r3, #2
	str r0, [sp]
	adds r0, r6, #0
	adds r1, r5, #0
	movs r2, #0xa
	bl DrawUiFrame2
	ldrb r0, [r4]
	mov r9, r4
	cmp r0, #1
	bls _080971E4
	movs r7, #0
	ldrb r0, [r4]
	cmp r7, r0
	bge _080971E4
	adds r0, r5, #1
	lsls r0, r0, #5
	adds r0, #2
	adds r6, r0, r6
_080971A4:
	lsls r1, r7, #2
	mov r0, r8
	adds r0, #0x38
	adds r0, r0, r1
	ldr r4, [r0]
	adds r5, r4, #0
	adds r5, #0x3c
	adds r0, r5, #0
	bl Text_Clear
	ldr r0, [r4, #0x34]
	bl GetStringFromIndex
	lsls r1, r6, #1
	ldr r2, _080971FC  @ gBG0TilemapBuffer
	adds r1, r1, r2
	adds r4, #0x38
	ldrb r3, [r4]
	movs r2, #1
	ands r2, r3
	movs r3, #0
	str r3, [sp]
	str r0, [sp, #4]
	adds r0, r5, #0
	bl DrawTextInline
	adds r6, #0x40
	adds r7, #1
	mov r1, r9
	ldrb r1, [r1]
	cmp r7, r1
	blt _080971A4
_080971E4:
	movs r0, #3
	bl BG_EnableSyncByMask
_080971EA:
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080971F8: .4byte gUnknown_08A186EC
_080971FC: .4byte gBG0TilemapBuffer

	THUMB_FUNC_END sub_8097154

	THUMB_FUNC_START sub_8097200
sub_8097200: @ 0x08097200
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	sub sp, #8
	adds r5, r0, #0
	adds r4, r1, #0
	ldr r0, _0809728C  @ gUnknown_08A186EC
	bl Proc_Find
	mov r8, r0
	cmp r0, #0
	beq _0809727E
	strh r5, [r0, #0x34]
	strh r4, [r0, #0x36]
	adds r0, #0x2b
	ldrb r1, [r0]
	mov r9, r0
	cmp r1, #1
	bls _08097278
	movs r7, #0
	ldrb r0, [r0]
	cmp r7, r0
	bge _08097278
	adds r0, r4, #1
	lsls r0, r0, #5
	adds r0, #2
	adds r6, r0, r5
_08097238:
	lsls r1, r7, #2
	mov r0, r8
	adds r0, #0x38
	adds r0, r0, r1
	ldr r4, [r0]
	adds r5, r4, #0
	adds r5, #0x3c
	adds r0, r5, #0
	bl Text_Clear
	ldr r0, [r4, #0x34]
	bl GetStringFromIndex
	lsls r1, r6, #1
	ldr r2, _08097290  @ gBG0TilemapBuffer
	adds r1, r1, r2
	adds r4, #0x38
	ldrb r3, [r4]
	movs r2, #1
	ands r2, r3
	movs r3, #0
	str r3, [sp]
	str r0, [sp, #4]
	adds r0, r5, #0
	bl DrawTextInline
	adds r6, #0x40
	adds r7, #1
	mov r1, r9
	ldrb r1, [r1]
	cmp r7, r1
	blt _08097238
_08097278:
	movs r0, #1
	bl BG_EnableSyncByMask
_0809727E:
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809728C: .4byte gUnknown_08A186EC
_08097290: .4byte gBG0TilemapBuffer

	THUMB_FUNC_END sub_8097200

	THUMB_FUNC_START sub_8097294
sub_8097294: @ 0x08097294
	push {lr}
	ldr r0, _080972A4  @ gUnknown_08A186EC
	bl Proc_Find
	cmp r0, #0
	bne _080972A8
	movs r0, #0
	b _080972AC
	.align 2, 0
_080972A4: .4byte gUnknown_08A186EC
_080972A8:
	adds r0, #0x2b
	ldrb r0, [r0]
_080972AC:
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8097294

	THUMB_FUNC_START sub_80972B0
sub_80972B0: @ 0x080972B0
	push {r4, lr}
	ldr r0, _080972D0  @ gUnknown_08A186EC
	bl Proc_Find
	adds r4, r0, #0
	cmp r4, #0
	beq _080972CA
	bl sub_80972D4
	adds r0, r4, #0
	movs r1, #0xa
	bl Proc_Goto
_080972CA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080972D0: .4byte gUnknown_08A186EC

	THUMB_FUNC_END sub_80972B0

	THUMB_FUNC_START sub_80972D4
sub_80972D4: @ 0x080972D4
	push {r4, r5, lr}
	ldr r0, _08097334  @ gUnknown_08A186EC
	bl Proc_Find
	adds r4, r0, #0
	cmp r4, #0
	beq _0809732C
	movs r1, #0x36
	ldrsh r0, [r4, r1]
	lsls r0, r0, #5
	movs r2, #0x34
	ldrsh r1, [r4, r2]
	adds r0, r0, r1
	lsls r0, r0, #1
	ldr r1, _08097338  @ gBG0TilemapBuffer
	adds r0, r0, r1
	adds r5, r4, #0
	adds r5, #0x2b
	ldrb r2, [r5]
	lsls r2, r2, #1
	adds r2, #2
	movs r1, #9
	movs r3, #0
	bl TileMap_FillRect
	movs r1, #0x36
	ldrsh r0, [r4, r1]
	lsls r0, r0, #5
	movs r2, #0x34
	ldrsh r1, [r4, r2]
	adds r0, r0, r1
	lsls r0, r0, #1
	ldr r1, _0809733C  @ gBG1TilemapBuffer
	adds r0, r0, r1
	ldrb r2, [r5]
	lsls r2, r2, #1
	adds r2, #2
	movs r1, #9
	movs r3, #0
	bl TileMap_FillRect
	movs r0, #3
	bl BG_EnableSyncByMask
_0809732C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08097334: .4byte gUnknown_08A186EC
_08097338: .4byte gBG0TilemapBuffer
_0809733C: .4byte gBG1TilemapBuffer

	THUMB_FUNC_END sub_80972D4

	THUMB_FUNC_START sub_8097340
sub_8097340: @ 0x08097340
	push {lr}
	ldr r0, _08097350  @ gUnknown_08A186EC
	bl Proc_Find
	cmp r0, #0
	bne _08097354
	movs r0, #0
	b _08097356
	.align 2, 0
_08097350: .4byte gUnknown_08A186EC
_08097354:
	movs r0, #1
_08097356:
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8097340

	THUMB_FUNC_START sub_809735C
sub_809735C: @ 0x0809735C
	push {lr}
	ldr r0, _08097374  @ gUnknown_08A186EC
	bl Proc_Find
	cmp r0, #0
	beq _0809736E
	movs r1, #2
	bl Proc_Goto
_0809736E:
	pop {r0}
	bx r0
	.align 2, 0
_08097374: .4byte gUnknown_08A186EC

	THUMB_FUNC_END sub_809735C

	THUMB_FUNC_START sub_8097378
sub_8097378: @ 0x08097378
	push {lr}
	ldr r0, _08097390  @ gUnknown_08A186EC
	bl Proc_Find
	cmp r0, #0
	beq _0809738A
	movs r1, #0
	bl Proc_Goto
_0809738A:
	pop {r0}
	bx r0
	.align 2, 0
_08097390: .4byte gUnknown_08A186EC

	THUMB_FUNC_END sub_8097378

	THUMB_FUNC_START sub_8097394
sub_8097394: @ 0x08097394
	push {lr}
	ldr r0, _080973AC  @ gUnknown_08A186EC
	bl Proc_Find
	cmp r0, #0
	beq _080973A6
	movs r1, #1
	bl Proc_Goto
_080973A6:
	pop {r0}
	bx r0
	.align 2, 0
_080973AC: .4byte gUnknown_08A186EC

	THUMB_FUNC_END sub_8097394

	THUMB_FUNC_START sub_80973B0
sub_80973B0: @ 0x080973B0
	adds r3, r0, #0
	movs r2, #0
	movs r1, #0
	strh r1, [r3, #0x2a]
	adds r0, #0x2c
	strb r2, [r0]
	adds r0, #1
	strb r2, [r0]
	strh r1, [r3, #0x2e]
	strh r1, [r3, #0x32]
	adds r0, #7
	strb r2, [r0]
	ldrh r0, [r3, #0x2e]
	strh r0, [r3, #0x30]
	movs r0, #0xe4
	lsls r0, r0, #2
	strh r0, [r3, #0x36]
	movs r0, #0x80
	lsls r0, r0, #5
	strh r0, [r3, #0x38]
	adds r0, r3, #0
	adds r0, #0x3a
	strb r2, [r0]
	adds r0, #1
	strb r2, [r0]
	bx lr

	THUMB_FUNC_END sub_80973B0

	THUMB_FUNC_START sub_80973E4
sub_80973E4: @ 0x080973E4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x1c
	adds r4, r0, #0
	ldrh r1, [r4, #0x36]
	ldrh r0, [r4, #0x38]
	adds r1, r1, r0
	mov r9, r1
	adds r1, r4, #0
	adds r1, #0x34
	ldrh r0, [r4, #0x32]
	ldrb r1, [r1]
	cmp r0, r1
	bhi _08097408
	b _0809762A
_08097408:
	movs r6, #0
	adds r0, r4, #0
	adds r0, #0x2d
	mov sl, r0
	adds r0, #0xd
	str r0, [sp, #0x14]
	adds r1, r4, #0
	adds r1, #0x3b
	str r1, [sp, #0x18]
	mov r2, sl
	ldrb r2, [r2]
	cmp r6, r2
	bge _08097448
	movs r5, #1
_08097424:
	ldrh r1, [r4, #0x2a]
	adds r1, #1
	adds r0, r4, #0
	adds r0, #0x2c
	ldrb r2, [r0]
	adds r2, r2, r5
	mov r3, r9
	str r3, [sp]
	movs r0, #4
	ldr r3, _08097534  @ gUnknown_08A18744
	bl PutSpriteExt
	adds r5, #8
	adds r6, #1
	mov r0, sl
	ldrb r0, [r0]
	cmp r6, r0
	blt _08097424
_08097448:
	cmp r6, #0
	bne _0809744E
	b _080975D8
_0809744E:
	mov r1, sl
	ldrb r0, [r1]
	lsls r7, r0, #0x13
	ldrh r2, [r4, #0x2e]
	str r2, [sp, #0xc]
	ldrh r5, [r4, #0x32]
	adds r0, r4, #0
	adds r0, #0x34
	ldrb r6, [r0]
	str r0, [sp, #0x10]
	movs r3, #0x2c
	adds r3, r3, r4
	mov r8, r3
	cmp r5, r6
	bhi _0809746E
	b _080975A6
_0809746E:
	adds r0, r7, #0
	adds r1, r5, #0
	bl __udivsi3
	str r0, [sp, #4]
	adds r0, r7, #0
	muls r0, r6, r0
	adds r1, r5, #0
	bl __udivsi3
	str r0, [sp, #8]
	ldr r5, [sp, #0xc]
	cmp r5, #0
	beq _080974AE
	ldrh r1, [r4, #0x2a]
	ldr r6, _08097538  @ 0x00002001
	adds r1, r1, r6
	mov r0, r8
	ldrb r2, [r0]
	subs r2, #8
	ldr r3, _0809753C  @ gUnknown_08A187F0
	ldr r5, [sp, #0x14]
	ldrb r0, [r5]
	lsrs r0, r0, #3
	lsls r0, r0, #2
	adds r0, r0, r3
	ldr r3, [r0]
	mov r6, r9
	str r6, [sp]
	movs r0, #4
	bl PutSpriteExt
_080974AE:
	movs r6, #0
	ldr r0, [sp, #8]
	lsrs r5, r0, #0x13
	cmp r6, r5
	bcs _080974E6
	ldr r1, [sp, #4]
	ldr r2, [sp, #0xc]
	adds r0, r1, #0
	muls r0, r2, r0
	lsrs r0, r0, #0x14
	adds r7, r0, #1
_080974C4:
	ldrh r1, [r4, #0x2a]
	adds r1, #1
	mov r3, r8
	ldrb r2, [r3]
	adds r2, r2, r7
	lsls r0, r6, #3
	adds r2, r2, r0
	ldr r0, _08097540  @ gUnknown_08A1879C
	ldr r3, [r0, #0x20]
	mov r0, r9
	str r0, [sp]
	movs r0, #4
	bl PutSpriteExt
	adds r6, #1
	cmp r6, r5
	bcc _080974C4
_080974E6:
	ldrh r0, [r4, #0x2e]
	lsrs r0, r0, #4
	ldr r1, [sp, #0x10]
	ldrb r1, [r1]
	adds r0, r0, r1
	ldrh r2, [r4, #0x32]
	cmp r0, r2
	bne _08097544
	mov r3, sl
	ldrb r0, [r3]
	lsls r0, r0, #3
	ldr r5, [sp, #4]
	ldr r2, [sp, #0xc]
	adds r1, r5, #0
	muls r1, r2, r1
	lsrs r2, r1, #0x14
	lsls r3, r6, #3
	adds r1, r2, r3
	subs r0, r0, r1
	cmp r0, #0
	beq _080975A6
	ldrh r1, [r4, #0x2a]
	adds r1, #1
	adds r2, #1
	mov r5, r8
	ldrb r5, [r5]
	adds r2, r2, r5
	adds r2, r2, r3
	ldr r3, _08097540  @ gUnknown_08A1879C
	lsls r0, r0, #2
	adds r0, r0, r3
	ldr r3, [r0]
	mov r6, r9
	str r6, [sp]
	movs r0, #4
	bl PutSpriteExt
	b _080975A6
	.align 2, 0
_08097534: .4byte gUnknown_08A18744
_08097538: .4byte 0x00002001
_0809753C: .4byte gUnknown_08A187F0
_08097540: .4byte gUnknown_08A1879C
_08097544:
	ldr r0, [sp, #8]
	lsrs r5, r0, #0x10
	movs r0, #7
	ands r5, r0
	cmp r5, #0
	beq _0809757C
	ldrh r1, [r4, #0x2a]
	adds r1, #1
	ldr r3, [sp, #4]
	ldr r0, [sp, #0xc]
	adds r2, r3, #0
	muls r2, r0, r2
	lsrs r2, r2, #0x14
	adds r2, #1
	mov r3, r8
	ldrb r3, [r3]
	adds r2, r2, r3
	lsls r0, r6, #3
	adds r2, r2, r0
	ldr r3, _0809763C  @ gUnknown_08A1879C
	lsls r0, r5, #2
	adds r0, r0, r3
	ldr r3, [r0]
	mov r5, r9
	str r5, [sp]
	movs r0, #4
	bl PutSpriteExt
_0809757C:
	ldrh r1, [r4, #0x2a]
	adds r1, #1
	mov r6, sl
	ldrb r2, [r6]
	lsls r2, r2, #3
	mov r0, r8
	ldrb r0, [r0]
	adds r2, r2, r0
	adds r2, #2
	ldr r3, _08097640  @ gUnknown_08A187F0
	ldr r5, [sp, #0x18]
	ldrb r0, [r5]
	lsrs r0, r0, #3
	lsls r0, r0, #2
	adds r0, r0, r3
	ldr r3, [r0]
	mov r6, r9
	str r6, [sp]
	movs r0, #4
	bl PutSpriteExt
_080975A6:
	ldrh r1, [r4, #0x2a]
	adds r1, #1
	mov r0, r8
	ldrb r2, [r0]
	subs r2, #7
	ldr r3, _08097644  @ gUnknown_08A1874C
	mov r5, r9
	str r5, [sp]
	movs r0, #4
	bl PutSpriteExt
	ldrh r1, [r4, #0x2a]
	adds r1, #1
	mov r6, r8
	ldrb r2, [r6]
	mov r3, sl
	ldrb r0, [r3]
	lsls r0, r0, #3
	adds r0, #1
	adds r2, r2, r0
	ldr r3, _08097648  @ gUnknown_08A18754
	str r5, [sp]
	movs r0, #4
	bl PutSpriteExt
_080975D8:
	ldrh r1, [r4, #0x30]
	ldrh r0, [r4, #0x2e]
	cmp r1, r0
	beq _08097600
	cmp r1, r0
	bls _080975EC
	ldr r5, [sp, #0x14]
	ldrb r0, [r5]
	adds r0, #3
	strb r0, [r5]
_080975EC:
	ldrh r0, [r4, #0x30]
	ldrh r6, [r4, #0x2e]
	cmp r0, r6
	bcs _080975FC
	ldr r1, [sp, #0x18]
	ldrb r0, [r1]
	adds r0, #3
	strb r0, [r1]
_080975FC:
	ldrh r0, [r4, #0x2e]
	strh r0, [r4, #0x30]
_08097600:
	ldr r2, [sp, #0x14]
	ldrb r0, [r2]
	adds r0, #1
	movs r2, #0
	ldr r3, [sp, #0x14]
	strb r0, [r3]
	ldr r1, [sp, #0x18]
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldrb r0, [r3]
	lsrs r0, r0, #3
	cmp r0, #5
	bls _0809761E
	strb r2, [r3]
_0809761E:
	ldr r5, [sp, #0x18]
	ldrb r0, [r5]
	lsrs r0, r0, #3
	cmp r0, #5
	bls _0809762A
	strb r2, [r5]
_0809762A:
	add sp, #0x1c
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809763C: .4byte gUnknown_08A1879C
_08097640: .4byte gUnknown_08A187F0
_08097644: .4byte gUnknown_08A1874C
_08097648: .4byte gUnknown_08A18754

	THUMB_FUNC_END sub_80973E4

	THUMB_FUNC_START sub_809764C
sub_809764C: @ 0x0809764C
	push {lr}
	ldr r0, _08097664  @ gUnknown_08A18808
	bl Proc_Find
	cmp r0, #0
	beq _0809765E
	movs r1, #1
	bl Proc_Goto
_0809765E:
	pop {r0}
	bx r0
	.align 2, 0
_08097664: .4byte gUnknown_08A18808

	THUMB_FUNC_END sub_809764C

	THUMB_FUNC_START sub_8097668
sub_8097668: @ 0x08097668
	push {lr}
	ldr r0, _08097680  @ gUnknown_08A18808
	bl Proc_Find
	cmp r0, #0
	beq _0809767A
	movs r1, #0
	bl Proc_Goto
_0809767A:
	pop {r0}
	bx r0
	.align 2, 0
_08097680: .4byte gUnknown_08A18808

	THUMB_FUNC_END sub_8097668

	THUMB_FUNC_START Delete6CMenuScroll
Delete6CMenuScroll: @ 0x08097684
	push {lr}
	ldr r0, _08097694  @ gUnknown_08A18808
	bl Proc_Find
	bl Proc_End
	pop {r0}
	bx r0
	.align 2, 0
_08097694: .4byte gUnknown_08A18808

	THUMB_FUNC_END Delete6CMenuScroll

	THUMB_FUNC_START Make6CMenuScroll
Make6CMenuScroll: @ 0x08097698
	push {lr}
	adds r1, r0, #0
	ldr r0, _080976A8  @ gUnknown_08A18808
	bl Proc_Start
	pop {r1}
	bx r1
	.align 2, 0
_080976A8: .4byte gUnknown_08A18808

	THUMB_FUNC_END Make6CMenuScroll

	THUMB_FUNC_START sub_80976AC
sub_80976AC: @ 0x080976AC
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _080976C8  @ gUnknown_08A18808
	bl Proc_Find
	cmp r0, #0
	beq _080976C2
	strh r4, [r0, #0x2a]
	adds r0, #0x2c
	strb r5, [r0]
_080976C2:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080976C8: .4byte gUnknown_08A18808

	THUMB_FUNC_END sub_80976AC

	THUMB_FUNC_START sub_80976CC
sub_80976CC: @ 0x080976CC
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	lsls r1, r1, #0x10
	lsrs r6, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r4, r2, #0x10
	lsls r3, r3, #0x18
	lsrs r5, r3, #0x18
	ldr r0, _080976FC  @ gUnknown_08A18808
	bl Proc_Find
	cmp r0, #0
	beq _080976F6
	adds r1, r0, #0
	adds r1, #0x2d
	strb r7, [r1]
	strh r6, [r0, #0x2e]
	strh r4, [r0, #0x32]
	adds r0, #0x34
	strb r5, [r0]
_080976F6:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080976FC: .4byte gUnknown_08A18808

	THUMB_FUNC_END sub_80976CC

	THUMB_FUNC_START sub_8097700
sub_8097700: @ 0x08097700
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _08097738  @ gUnknown_08A19CAC
	adds r1, #0x10
	lsls r1, r1, #5
	movs r2, #0x20
	bl CopyToPaletteBuffer
	ldr r0, _0809773C  @ gUnknown_08A19C0C
	ldr r2, _08097740  @ 0x06010000
	adds r1, r4, r2
	bl CopyDataWithPossibleUncomp
	ldr r0, _08097744  @ gUnknown_08A18808
	bl Proc_Find
	adds r2, r0, #0
	cmp r2, #0
	beq _08097730
	asrs r0, r4, #5
	strh r0, [r2, #0x36]
	lsls r0, r5, #0xc
	strh r0, [r2, #0x38]
_08097730:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08097738: .4byte gUnknown_08A19CAC
_0809773C: .4byte gUnknown_08A19C0C
_08097740: .4byte 0x06010000
_08097744: .4byte gUnknown_08A18808

	THUMB_FUNC_END sub_8097700

	THUMB_FUNC_START sub_8097748
sub_8097748: @ 0x08097748
	push {r4, r5, r6, lr}
	mov r6, r9
	mov r5, r8
	push {r5, r6}
	adds r4, r0, #0
	mov r8, r1
	mov r9, r2
	adds r5, r3, #0
	ldr r6, [sp, #0x18]
	ldr r0, _0809779C  @ gUnknown_08A18808
	adds r1, r4, #0
	bl Proc_Start
	adds r4, r0, #0
	mov r0, r8
	strh r0, [r4, #0x2a]
	adds r0, r4, #0
	adds r0, #0x2c
	mov r1, r9
	strb r1, [r0]
	ldr r0, _080977A0  @ gUnknown_08A19CAC
	adds r1, r6, #0
	adds r1, #0x10
	lsls r1, r1, #5
	movs r2, #0x20
	bl CopyToPaletteBuffer
	ldr r0, _080977A4  @ gUnknown_08A19C0C
	ldr r2, _080977A8  @ 0x06010000
	adds r1, r5, r2
	bl CopyDataWithPossibleUncomp
	asrs r5, r5, #5
	strh r5, [r4, #0x36]
	lsls r6, r6, #0xc
	strh r6, [r4, #0x38]
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0809779C: .4byte gUnknown_08A18808
_080977A0: .4byte gUnknown_08A19CAC
_080977A4: .4byte gUnknown_08A19C0C
_080977A8: .4byte 0x06010000

	THUMB_FUNC_END sub_8097748

	THUMB_FUNC_START sub_80977AC
sub_80977AC: @ 0x080977AC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	mov r8, r1
	adds r5, r2, #0
	adds r6, r3, #0
	ldr r7, [sp, #0x18]
	bl Text_Clear
	adds r0, r4, #0
	adds r1, r5, #0
	bl Text_SetColorId
	adds r0, r4, #0
	adds r1, r6, #0
	bl Text_SetXCursor
	adds r0, r4, #0
	adds r1, r7, #0
	bl Text_AppendString
	adds r0, r4, #0
	mov r1, r8
	bl Text_Draw
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80977AC

	THUMB_FUNC_START sub_80977EC
sub_80977EC: @ 0x080977EC
	push {r4, r5, lr}
	adds r3, r0, #0
	ldr r5, _08097800  @ gUnknown_02012F56
	ldrh r4, [r5]
	adds r2, r4, #0
	cmp r2, #0
	bne _08097804
	strb r2, [r3]
	strh r2, [r1]
	b _08097838
	.align 2, 0
_08097800: .4byte gUnknown_02012F56
_08097804:
	cmp r2, #7
	bhi _08097816
	ldrb r0, [r3]
	cmp r0, r2
	bcc _08097812
	subs r0, r4, #1
	strb r0, [r3]
_08097812:
	movs r0, #0
	b _08097836
_08097816:
	ldrh r0, [r1]
	lsrs r0, r0, #4
	adds r2, r0, #7
	ldrh r0, [r5]
	cmp r2, r0
	bge _0809782E
	ldrb r0, [r3]
	cmp r0, #6
	bne _08097838
	movs r0, #5
	strb r0, [r3]
	b _08097838
_0809782E:
	cmp r2, r0
	ble _08097838
	subs r0, #7
	lsls r0, r0, #4
_08097836:
	strh r0, [r1]
_08097838:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80977EC

	THUMB_FUNC_START sub_8097840
sub_8097840: @ 0x08097840
	push {lr}
	ldr r0, _0809785C  @ 0x04000006
	ldrh r0, [r0]
	adds r3, r0, #0
	cmp r3, #0xa0
	bne _08097864
	movs r3, #0
	ldr r0, _08097860  @ gUnknown_02013458
	ldr r2, [r0]
	ldr r1, [r0, #4]
	str r1, [r0]
	str r2, [r0, #4]
	b _0809786C
	.align 2, 0
_0809785C: .4byte 0x04000006
_08097860: .4byte gUnknown_02013458
_08097864:
	ldr r0, _08097884  @ gUnknown_02013458
	cmp r3, #0xa0
	bls _0809786C
	movs r3, #0
_0809786C:
	ldr r2, _08097888  @ 0x04000042
	ldr r1, [r0]
	lsls r0, r3, #2
	adds r0, r0, r1
	ldrb r1, [r0]
	lsls r1, r1, #8
	ldrb r0, [r0, #1]
	orrs r0, r1
	strh r0, [r2]
	pop {r0}
	bx r0
	.align 2, 0
_08097884: .4byte gUnknown_02013458
_08097888: .4byte 0x04000042

	THUMB_FUNC_END sub_8097840

	THUMB_FUNC_START sub_809788C
sub_809788C: @ 0x0809788C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	adds r4, r0, #0
	ldr r2, _08097908  @ gLCDControlBuffer
	ldrb r1, [r2, #1]
	movs r0, #0x21
	negs r0, r0
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r2, #1]
	adds r0, r4, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	mov ip, r2
	cmp r0, #0
	bge _08097918
	movs r0, #0x96
	str r0, [r4, #0x2c]
	movs r3, #0
	ldr r0, _0809790C  @ gUnknown_02012F58
	mov r9, r0
	adds r4, #0x29
	mov r8, r4
	ldr r1, _08097910  @ gUnknown_02013458
	mov sl, r1
	mov r7, r9
	movs r4, #0
	movs r2, #0xf0
	movs r6, #0xa0
	lsls r6, r6, #2
	ldr r5, _08097914  @ 0x00000281
_080978DA:
	lsls r0, r3, #2
	adds r0, r0, r7
	strb r4, [r0]
	strb r2, [r0, #1]
	adds r1, r0, r6
	strb r4, [r1]
	adds r0, r0, r5
	strb r2, [r0]
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #0x9f
	bls _080978DA
	mov r1, ip
	adds r1, #0x2f
	movs r0, #0
	strb r0, [r1]
	adds r1, #4
	strb r0, [r1]
	subs r1, #5
	movs r0, #0xf0
	b _08097960
	.align 2, 0
_08097908: .4byte gLCDControlBuffer
_0809790C: .4byte gUnknown_02012F58
_08097910: .4byte gUnknown_02013458
_08097914: .4byte 0x00000281
_08097918:
	movs r0, #0
	str r0, [r4, #0x2c]
	movs r3, #0
	ldr r0, _080979CC  @ gUnknown_02012F58
	mov r9, r0
	adds r4, #0x29
	mov r8, r4
	ldr r1, _080979D0  @ gUnknown_02013458
	mov sl, r1
	mov r6, r9
	movs r2, #0x78
	movs r5, #0xa0
	lsls r5, r5, #2
	ldr r4, _080979D4  @ 0x00000281
_08097934:
	lsls r0, r3, #2
	adds r0, r0, r6
	strb r2, [r0]
	strb r2, [r0, #1]
	adds r1, r0, r5
	strb r2, [r1]
	adds r0, r0, r4
	strb r2, [r0]
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #0x9f
	bls _08097934
	mov r2, ip
	adds r2, #0x2f
	movs r1, #0
	movs r0, #0x78
	strb r0, [r2]
	adds r2, #4
	strb r1, [r2]
	mov r1, ip
	adds r1, #0x2e
_08097960:
	strb r0, [r1]
	adds r1, #4
	movs r0, #0xa0
	strb r0, [r1]
	mov r2, ip
	adds r2, #0x35
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
	strb r0, [r2]
	adds r2, #1
	ldrb r1, [r2]
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
	strb r0, [r2]
	movs r0, #0
	mov r1, r8
	strb r0, [r1]
	mov r0, r9
	mov r1, sl
	str r0, [r1]
	movs r0, #0xa0
	lsls r0, r0, #2
	add r0, r9
	str r0, [r1, #4]
	ldr r0, _080979D8  @ sub_8097840
	bl SetPrimaryHBlankHandler
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080979CC: .4byte gUnknown_02012F58
_080979D0: .4byte gUnknown_02013458
_080979D4: .4byte 0x00000281
_080979D8: .4byte sub_8097840

	THUMB_FUNC_END sub_809788C

	THUMB_FUNC_START sub_80979DC
sub_80979DC: @ 0x080979DC
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	adds r6, r0, #0
	adds r0, #0x2a
	movs r1, #0
	ldrsb r1, [r0, r1]
	ldr r0, [r6, #0x2c]
	adds r0, r0, r1
	str r0, [r6, #0x2c]
	cmp r0, #0x96
	ble _080979FA
	movs r0, #0x96
	str r0, [r6, #0x2c]
_080979FA:
	ldr r0, [r6, #0x2c]
	cmp r0, #0
	bge _08097A04
	movs r0, #0
	str r0, [r6, #0x2c]
_08097A04:
	movs r1, #0
	movs r0, #0x29
	adds r0, r0, r6
	mov r9, r0
	ldr r7, _08097A44  @ gUnknown_02013458
	movs r2, #0x78
	mov r8, r2
_08097A12:
	ldr r0, [r6, #0x2c]
	lsls r5, r1, #0x10
	cmp r0, #0
	ble _08097A32
	adds r4, r0, #0
	muls r4, r0, r4
	adds r0, r4, #0
	asrs r4, r5, #0x10
	adds r1, r4, #0
	subs r1, #0x50
	adds r2, r1, #0
	muls r2, r1, r2
	adds r1, r2, #0
	subs r0, r0, r1
	cmp r0, #0
	bge _08097A48
_08097A32:
	ldr r0, [r7, #4]
	asrs r1, r5, #0xe
	adds r0, r1, r0
	mov r4, r8
	strb r4, [r0]
	ldr r0, [r7, #4]
	adds r1, r1, r0
	strb r4, [r1, #1]
	b _08097A6E
	.align 2, 0
_08097A44: .4byte gUnknown_02013458
_08097A48:
	bl Sqrt
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x78
	ble _08097A58
	movs r3, #0x78
_08097A58:
	ldr r1, [r7, #4]
	lsls r2, r4, #2
	adds r1, r2, r1
	mov r4, r8
	subs r0, r4, r3
	strb r0, [r1]
	ldr r0, [r7, #4]
	adds r2, r2, r0
	adds r0, r3, #0
	adds r0, #0x78
	strb r0, [r2, #1]
_08097A6E:
	movs r1, #0x80
	lsls r1, r1, #9
	adds r0, r5, r1
	lsrs r1, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x9f
	ble _08097A12
	mov r2, r9
	ldrb r0, [r2]
	adds r0, #1
	strb r0, [r2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x28
	bne _08097A92
	adds r0, r6, #0
	bl Proc_Break
_08097A92:
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80979DC

	THUMB_FUNC_START sub_8097AA0
sub_8097AA0: @ 0x08097AA0
	push {lr}
	movs r0, #0
	bl SetPrimaryHBlankHandler
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8097AA0

	THUMB_FUNC_START sub_8097AAC
sub_8097AAC: @ 0x08097AAC
	push {r4, lr}
	adds r2, r0, #0
	lsls r4, r1, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _08097AC8  @ gUnknown_08A18840
	adds r1, r2, #0
	bl Proc_StartBlocking
	adds r1, r0, #0
	adds r1, #0x2a
	strb r4, [r1]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08097AC8: .4byte gUnknown_08A18840

	THUMB_FUNC_END sub_8097AAC

	THUMB_FUNC_START sub_8097ACC
sub_8097ACC: @ 0x08097ACC
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	adds r1, r0, #0
	adds r1, #0x29
	movs r7, #0
	strb r7, [r1]
	ldr r1, _08097B6C  @ gLCDControlBuffer
	mov ip, r1
	ldrb r1, [r1, #1]
	movs r2, #1
	mov r8, r2
	mov r6, r8
	orrs r1, r6
	movs r2, #2
	mov r9, r2
	mov r6, r9
	orrs r1, r6
	movs r5, #4
	orrs r1, r5
	movs r4, #8
	orrs r1, r4
	movs r3, #0x10
	orrs r1, r3
	movs r2, #0x21
	negs r2, r2
	ands r1, r2
	movs r2, #0x40
	orrs r1, r2
	movs r2, #0x7f
	ands r1, r2
	mov r2, ip
	strb r1, [r2, #1]
	adds r2, #0x35
	ldrb r1, [r2]
	mov r6, r8
	orrs r1, r6
	mov r6, r9
	orrs r1, r6
	orrs r1, r5
	orrs r1, r4
	orrs r1, r3
	strb r1, [r2]
	mov r3, ip
	adds r3, #0x36
	ldrb r2, [r3]
	movs r1, #2
	negs r1, r1
	ands r1, r2
	movs r2, #3
	negs r2, r2
	ands r1, r2
	subs r2, #2
	ands r1, r2
	subs r2, #4
	ands r1, r2
	subs r2, #8
	ands r1, r2
	strb r1, [r3]
	adds r0, #0x2a
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	ble _08097B70
	mov r0, ip
	adds r0, #0x2f
	strb r7, [r0]
	adds r0, #4
	strb r7, [r0]
	mov r1, ip
	adds r1, #0x2e
	movs r0, #0xf0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0xa0
	strb r0, [r1]
	b _08097B8A
	.align 2, 0
_08097B6C: .4byte gLCDControlBuffer
_08097B70:
	mov r1, ip
	adds r1, #0x2f
	movs r0, #0x78
	strb r0, [r1]
	mov r2, ip
	adds r2, #0x33
	movs r1, #0x50
	strb r1, [r2]
	subs r2, #5
	strb r0, [r2]
	mov r0, ip
	adds r0, #0x32
	strb r1, [r0]
_08097B8A:
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8097ACC

	THUMB_FUNC_START sub_8097B98
sub_8097B98: @ 0x08097B98
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	adds r6, r0, #0
	adds r2, r6, #0
	adds r2, #0x29
	ldrb r0, [r2]
	adds r0, #1
	strb r0, [r2]
	ldr r4, _08097C18  @ gLCDControlBuffer
	ldrb r1, [r4, #1]
	movs r0, #0x21
	negs r0, r0
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r4, #1]
	ldrb r0, [r2]
	movs r1, #0xf
	subs r1, r1, r0
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #7
	muls r0, r1, r0
	movs r1, #0xe1
	bl __divsi3
	movs r1, #0xa0
	lsls r1, r1, #2
	subs r1, r1, r0
	asrs r5, r1, #4
	adds r0, r6, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	ble _08097C1C
	lsls r1, r5, #1
	adds r2, r1, r5
	adds r0, r4, #0
	adds r0, #0x2f
	strb r2, [r0]
	adds r0, #4
	strb r1, [r0]
	movs r3, #0x10
	negs r3, r3
	adds r0, r3, #0
	subs r0, r0, r2
	adds r2, r4, #0
	adds r2, #0x2e
	strb r0, [r2]
	movs r2, #0x60
	negs r2, r2
	adds r0, r2, #0
	subs r0, r0, r1
	adds r1, r4, #0
	adds r1, #0x32
	strb r0, [r1]
	b _08097C40
	.align 2, 0
_08097C18: .4byte gLCDControlBuffer
_08097C1C:
	lsls r2, r5, #1
	adds r1, r2, r5
	movs r0, #0x78
	subs r0, r0, r1
	adds r3, r4, #0
	adds r3, #0x2f
	strb r0, [r3]
	movs r0, #0x50
	subs r0, r0, r2
	adds r3, #4
	strb r0, [r3]
	adds r1, #0x78
	adds r0, r4, #0
	adds r0, #0x2e
	strb r1, [r0]
	adds r2, #0x50
	adds r0, #4
	strb r2, [r0]
_08097C40:
	adds r2, r4, #0
	adds r2, #0x35
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
	strb r0, [r2]
	adds r2, #1
	ldrb r1, [r2]
	movs r0, #2
	negs r0, r0
	ands r0, r1
	movs r3, #3
	negs r3, r3
	mov sl, r3
	ands r0, r3
	movs r1, #5
	negs r1, r1
	mov r9, r1
	ands r0, r1
	subs r3, #6
	mov r8, r3
	ands r0, r3
	movs r7, #0x11
	negs r7, r7
	ands r0, r7
	strb r0, [r2]
	cmp r5, #0x27
	ble _08097CB4
	adds r0, r6, #0
	bl Proc_Break
	adds r0, r6, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	ble _08097CB4
	ldrb r1, [r4, #1]
	movs r0, #2
	negs r0, r0
	ands r0, r1
	mov r1, sl
	ands r0, r1
	mov r2, r9
	ands r0, r2
	mov r3, r8
	ands r0, r3
	ands r0, r7
	strb r0, [r4, #1]
_08097CB4:
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8097B98

	THUMB_FUNC_START sub_8097CC4
sub_8097CC4: @ 0x08097CC4
	movs r0, #0
	bx lr

	THUMB_FUNC_END sub_8097CC4

	THUMB_FUNC_START sub_8097CC8
sub_8097CC8: @ 0x08097CC8
	push {lr}
	bl GetConvoyItemCount
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8097CC8

	THUMB_FUNC_START sub_8097CD8
sub_8097CD8: @ 0x08097CD8
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2a]
	ldrh r1, [r4, #0x2c]
	cmp r0, r1
	bne _08097D04
	ldr r2, _08097D10  @ gLCDControlBuffer
	ldrb r0, [r2, #1]
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
	strb r0, [r2, #1]
	adds r0, r4, #0
	bl Proc_Break
_08097D04:
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08097D10: .4byte gLCDControlBuffer

	THUMB_FUNC_END sub_8097CD8

	THUMB_FUNC_START sub_8097D14
sub_8097D14: @ 0x08097D14
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	ldr r0, _08097D4C  @ gUnknown_08A18888
	bl Proc_Start
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r4, [r0, #0x2a]
	ldr r2, _08097D50  @ gLCDControlBuffer
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
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08097D4C: .4byte gUnknown_08A18888
_08097D50: .4byte gLCDControlBuffer

	THUMB_FUNC_END sub_8097D14

	THUMB_FUNC_START sub_8097D54
sub_8097D54: @ 0x08097D54
	push {lr}
	cmp r0, #0
	beq _08097D64
	adds r1, r0, #0
	adds r1, #0x28
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
_08097D64:
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8097D54

	THUMB_FUNC_START sub_8097D68
sub_8097D68: @ 0x08097D68
	push {lr}
	cmp r0, #0
	beq _08097D7C
	adds r1, r0, #0
	adds r1, #0x28
	ldrb r0, [r1]
	cmp r0, #0
	beq _08097D7C
	subs r0, #1
	strb r0, [r1]
_08097D7C:
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8097D68

	THUMB_FUNC_START sub_8097D80
sub_8097D80: @ 0x08097D80
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08097DA4  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0xf3
	ands r0, r1
	cmp r0, #0
	beq _08097D9C
	bl CloseHelpBox
	adds r0, r4, #0
	bl Proc_Break
_08097D9C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08097DA4: .4byte gKeyStatusPtr

	THUMB_FUNC_END sub_8097D80

	THUMB_FUNC_START sub_8097DA8
sub_8097DA8: @ 0x08097DA8
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r2, #0
	adds r6, r3, #0
	cmp r4, #0
	bge _08097DC4
	cmp r1, #0
	bge _08097DC4
	bl GetUiHandPrevDisplayX
	adds r4, r0, #0
	bl GetUiHandPrevDisplayY
	adds r1, r0, #0
_08097DC4:
	adds r0, r4, #0
	adds r2, r5, #0
	bl StartHelpBox
	ldr r0, _08097DDC  @ gUnknown_08A188A8
	adds r1, r6, #0
	bl Proc_StartBlocking
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08097DDC: .4byte gUnknown_08A188A8

	THUMB_FUNC_END sub_8097DA8

	THUMB_FUNC_START sub_8097DE0
sub_8097DE0: @ 0x08097DE0
	push {r4, lr}
	adds r4, r1, #0
	bl CanUnitUseWeapon
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08097E00
	adds r0, r4, #0
	bl GetItemAttributes
	movs r1, #0x80
	ands r1, r0
	cmp r1, #0
	bne _08097E00
	movs r0, #1
	b _08097E02
_08097E00:
	movs r0, #0
_08097E02:
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8097DE0

	THUMB_FUNC_START sub_8097E08
sub_8097E08: @ 0x08097E08
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	movs r6, #0
	movs r4, #0
_08097E10:
	lsls r1, r4, #1
	adds r0, r5, #0
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r1, [r0]
	adds r0, r5, #0
	bl sub_8097DE0
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _08097E2A
	adds r6, #1
_08097E2A:
	adds r4, #1
	cmp r4, #4
	ble _08097E10
	adds r0, r6, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8097E08

	THUMB_FUNC_START sub_8097E38
sub_8097E38: @ 0x08097E38
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4]
	ldr r1, [r4, #4]
	ldr r0, [r0, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	movs r1, #0x80
	lsls r1, r1, #2
	ands r0, r1
	cmp r0, #0
	bne _08097E6A
	adds r0, r4, #0
	bl sub_8031F50
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08097E6A
	adds r0, r4, #0
	bl sub_8097E08
	cmp r0, #0
	beq _08097E6A
	movs r0, #1
	b _08097E6C
_08097E6A:
	movs r0, #0
_08097E6C:
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8097E38

	THUMB_FUNC_START sub_8097E74
sub_8097E74: @ 0x08097E74
	push {r4, lr}
	movs r2, #0
	ldr r0, [r0]
	ldrb r3, [r0, #4]
	ldr r1, _08097E8C  @ gUnknown_08205BFC
_08097E7E:
	movs r4, #0
	ldrsh r0, [r1, r4]
	cmp r3, r0
	bne _08097E90
	movs r0, #0
	b _08097E9A
	.align 2, 0
_08097E8C: .4byte gUnknown_08205BFC
_08097E90:
	adds r1, #2
	adds r2, #1
	cmp r2, #0xa
	bls _08097E7E
	movs r0, #1
_08097E9A:
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8097E74

	THUMB_FUNC_START sub_8097EA0
sub_8097EA0: @ 0x08097EA0
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r7, r1, #0
	adds r5, r2, #0
	adds r6, r3, #0
	cmp r4, r5
	beq _08097F3A
	bl CheckSomethingSomewhere
	cmp r0, #0
	beq _08097F3A
	ldr r0, [r4, #0xc]
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	bne _08097EF6
	lsls r1, r7, #1
	adds r0, r4, #0
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r1, [r0]
	adds r0, r4, #0
	bl sub_8097DE0
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08097EF6
	adds r0, r4, #0
	bl sub_8097E08
	cmp r0, #1
	bgt _08097EF6
	lsls r1, r6, #1
	adds r0, r5, #0
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r1, [r0]
	adds r0, r4, #0
	bl sub_8097DE0
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08097F36
_08097EF6:
	ldr r0, [r5, #0xc]
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	bne _08097F3A
	lsls r1, r6, #1
	adds r0, r5, #0
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r1, [r0]
	adds r0, r5, #0
	bl sub_8097DE0
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08097F3A
	adds r0, r5, #0
	bl sub_8097E08
	cmp r0, #1
	bgt _08097F3A
	lsls r1, r7, #1
	adds r0, r4, #0
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r1, [r0]
	adds r0, r5, #0
	bl sub_8097DE0
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08097F3A
_08097F36:
	movs r0, #0
	b _08097F3C
_08097F3A:
	movs r0, #1
_08097F3C:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8097EA0

	THUMB_FUNC_START sub_8097F44
sub_8097F44: @ 0x08097F44
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	bl CheckSomethingSomewhere
	cmp r0, #0
	beq _08097F90
	ldr r0, [r4, #0xc]
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	bne _08097F90
	lsls r1, r5, #1
	adds r0, r4, #0
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r1, [r0]
	adds r0, r4, #0
	bl sub_8097DE0
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08097F90
	adds r0, r4, #0
	bl sub_8097E08
	cmp r0, #1
	bne _08097F90
	adds r0, r4, #0
	adds r1, r6, #0
	bl sub_8097DE0
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08097F90
	movs r0, #0
	b _08097F92
_08097F90:
	movs r0, #1
_08097F92:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8097F44

	THUMB_FUNC_START sub_8097F98
sub_8097F98: @ 0x08097F98
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	bl CheckSomethingSomewhere
	cmp r0, #0
	beq _08097FD4
	ldr r0, [r4, #0xc]
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	bne _08097FD4
	lsls r1, r5, #1
	adds r0, r4, #0
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r1, [r0]
	adds r0, r4, #0
	bl sub_8097DE0
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08097FD4
	adds r0, r4, #0
	bl sub_8097E08
	cmp r0, #1
	bne _08097FD4
	movs r0, #0
	b _08097FD6
_08097FD4:
	movs r0, #1
_08097FD6:
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8097F98

	THUMB_FUNC_START sub_8097FDC
sub_8097FDC: @ 0x08097FDC
	push {r4, lr}
	movs r1, #0
	ldr r4, _08098008  @ gUnknown_0202BD31
	ldr r2, _0809800C  @ gUnknown_02013460
	ldr r3, _08098010  @ gUnknown_08A1D448
_08097FE6:
	ldrb r0, [r4]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1e
	lsls r0, r0, #4
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r3
	ldrh r0, [r0]
	strh r0, [r2]
	adds r2, #2
	adds r1, #1
	cmp r1, #0xf
	ble _08097FE6
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08098008: .4byte gUnknown_0202BD31
_0809800C: .4byte gUnknown_02013460
_08098010: .4byte gUnknown_08A1D448

	THUMB_FUNC_END sub_8097FDC

	THUMB_FUNC_START sub_8098014
sub_8098014: @ 0x08098014
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	movs r5, #0
	ldr r4, _08098034  @ gUnknown_08A188C0
_0809801C:
	adds r0, r6, #0
	bl GetItemType
	ldrb r1, [r4]
	cmp r0, r1
	blt _08098038
	ldrb r1, [r4, #1]
	cmp r0, r1
	bgt _08098038
	adds r0, r5, #0
	b _08098042
	.align 2, 0
_08098034: .4byte gUnknown_08A188C0
_08098038:
	adds r4, #4
	adds r5, #1
	cmp r5, #8
	ble _0809801C
	movs r0, #8
_08098042:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8098014

	THUMB_FUNC_START sub_8098048
sub_8098048: @ 0x08098048
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov r9, r0
	ldr r0, _08098100  @ gUnknown_02012914
	mov r8, r0
	ldr r0, _08098104  @ gUnknown_02012F56
	movs r1, #0
	strh r1, [r0]
	movs r4, #0
	ldr r1, _08098108  @ gUnknown_02012F54
	mov sl, r0
	adds r2, r1, #0
	ldrh r1, [r2]
	cmp r4, r1
	bge _080980B4
	ldr r1, _0809810C  @ gUnknown_08A188C0
	mov r3, r9
	lsls r0, r3, #2
	adds r6, r0, r1
	mov r7, sl
_08098078:
	ldr r1, _08098110  @ gUnknown_020122D4
	lsls r0, r4, #2
	adds r5, r0, r1
	ldrh r0, [r5, #2]
	str r2, [sp]
	bl GetItemType
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, [sp]
	ldrb r1, [r6]
	cmp r0, r1
	bcc _080980AA
	ldrb r3, [r6, #1]
	cmp r0, r3
	bhi _080980AA
	ldr r0, [r5]
	mov r1, r8
	adds r1, #4
	mov r8, r1
	subs r1, #4
	stm r1!, {r0}
	ldrh r0, [r7]
	adds r0, #1
	strh r0, [r7]
_080980AA:
	adds r4, #1
	ldr r0, _08098108  @ gUnknown_02012F54
	ldrh r0, [r0]
	cmp r4, r0
	blt _08098078
_080980B4:
	movs r4, #0
	ldrh r2, [r2]
	cmp r4, r2
	bge _080980F6
	ldr r1, _0809810C  @ gUnknown_08A188C0
	mov r2, r9
	lsls r0, r2, #2
	adds r6, r0, r1
_080980C4:
	ldr r1, _08098110  @ gUnknown_020122D4
	lsls r0, r4, #2
	adds r5, r0, r1
	ldrh r0, [r5, #2]
	bl GetItemType
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrb r3, [r6]
	cmp r0, r3
	bcc _080980E0
	ldrb r1, [r6, #1]
	cmp r0, r1
	bls _080980EC
_080980E0:
	ldr r0, [r5]
	mov r2, r8
	adds r2, #4
	mov r8, r2
	subs r2, #4
	stm r2!, {r0}
_080980EC:
	adds r4, #1
	ldr r0, _08098108  @ gUnknown_02012F54
	ldrh r0, [r0]
	cmp r4, r0
	blt _080980C4
_080980F6:
	movs r2, #1
	ldr r5, _08098100  @ gUnknown_02012914
	ldr r3, _08098104  @ gUnknown_02012F56
	mov sl, r3
	b _0809811A
	.align 2, 0
_08098100: .4byte gUnknown_02012914
_08098104: .4byte gUnknown_02012F56
_08098108: .4byte gUnknown_02012F54
_0809810C: .4byte gUnknown_08A188C0
_08098110: .4byte gUnknown_020122D4
_08098114:
	lsls r0, r2, #1
	adds r0, r0, r2
	adds r2, r0, #1
_0809811A:
	mov r1, sl
	ldrh r0, [r1]
	movs r1, #3
	str r2, [sp]
	bl __udivsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r2, [sp]
	cmp r2, r0
	blt _08098114
	cmp r2, #0
	ble _080981BC
_08098134:
	adds r4, r2, #0
	mov r3, sl
	ldrh r3, [r3]
	cmp r2, r3
	bge _080981AE
	ldr r0, _080981D8  @ gUnknown_02012F56
	mov sl, r0
_08098142:
	subs r7, r4, r2
	adds r4, #1
	mov r9, r4
	cmp r7, #0
	blt _080981A2
	ldr r1, _080981DC  @ gUnknown_02012914
	mov r8, r1
_08098150:
	lsls r0, r7, #2
	mov r3, r8
	adds r6, r0, r3
	ldrh r0, [r6, #2]
	str r2, [sp]
	bl GetItemIndex
	adds r4, r0, #0
	ldr r2, [sp]
	adds r0, r7, r2
	lsls r0, r0, #2
	mov r1, r8
	adds r5, r0, r1
	ldrh r0, [r5, #2]
	bl GetItemIndex
	ldr r2, [sp]
	cmp r4, r0
	bgt _08098194
	ldrh r0, [r6, #2]
	str r2, [sp]
	bl GetItemIndex
	adds r4, r0, #0
	ldrh r0, [r5, #2]
	bl GetItemIndex
	ldr r2, [sp]
	cmp r4, r0
	bne _080981A2
	ldrh r0, [r6, #2]
	ldrh r3, [r5, #2]
	cmp r0, r3
	bls _0809819C
_08098194:
	ldr r1, [r6]
	ldr r0, [r5]
	str r0, [r6]
	str r1, [r5]
_0809819C:
	subs r7, r7, r2
	cmp r7, #0
	bge _08098150
_080981A2:
	mov r4, r9
	ldr r0, _080981D8  @ gUnknown_02012F56
	ldr r5, _080981DC  @ gUnknown_02012914
	ldrh r0, [r0]
	cmp r4, r0
	blt _08098142
_080981AE:
	adds r0, r2, #0
	movs r1, #3
	bl __divsi3
	adds r2, r0, #0
	cmp r2, #0
	bgt _08098134
_080981BC:
	ldr r1, _080981E0  @ gUnknown_020122D4
	movs r2, #0xc8
	lsls r2, r2, #1
	adds r0, r5, #0
	bl CpuFastSet
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080981D8: .4byte gUnknown_02012F56
_080981DC: .4byte gUnknown_02012914
_080981E0: .4byte gUnknown_020122D4

	THUMB_FUNC_END sub_8098048

	THUMB_FUNC_START SomethingPrepListRelated
SomethingPrepListRelated: @ 0x080981E4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	mov r8, r0
	mov sl, r1
	mov r9, r2
	ldr r6, _080982AC  @ gUnknown_020122D4
	ldr r1, _080982B0  @ gUnknown_02012F54
	movs r0, #0
	strh r0, [r1]
	movs r0, #2
	ands r0, r2
	cmp r0, #0
	beq _0809825E
	movs r5, #1
_08098206:
	adds r0, r5, #0
	bl GetUnit
	adds r4, r0, #0
	adds r7, r5, #1
	cmp r4, #0
	beq _08098258
	ldr r0, [r4]
	cmp r0, #0
	beq _08098258
	ldr r0, [r4, #0xc]
	ldr r1, _080982B4  @ 0x00010004
	ands r0, r1
	cmp r0, #0
	bne _08098258
	cmp r4, r8
	beq _08098258
	adds r0, r4, #0
	bl GetUnitItemCount
	adds r5, r0, #0
	movs r2, #0
	cmp r2, r5
	bge _08098258
	ldr r3, _080982B0  @ gUnknown_02012F54
	adds r1, r4, #0
	adds r1, #0x1e
_0809823C:
	ldr r0, [r4]
	ldrb r0, [r0, #4]
	strb r0, [r6]
	ldrh r0, [r1]
	strh r0, [r6, #2]
	strb r2, [r6, #1]
	adds r6, #4
	ldrh r0, [r3]
	adds r0, #1
	strh r0, [r3]
	adds r1, #2
	adds r2, #1
	cmp r2, r5
	blt _0809823C
_08098258:
	adds r5, r7, #0
	cmp r5, #0x3f
	ble _08098206
_0809825E:
	movs r0, #1
	mov r1, r9
	ands r0, r1
	cmp r0, #0
	beq _08098298
	bl GetConvoyItemArray
	adds r1, r0, #0
	movs r2, #0
	ldrh r0, [r1]
	cmp r0, #0
	beq _08098298
	movs r4, #0
	ldr r3, _080982B0  @ gUnknown_02012F54
_0809827A:
	ldrh r0, [r1]
	strh r0, [r6, #2]
	strb r4, [r6]
	strb r2, [r6, #1]
	adds r6, #4
	ldrh r0, [r3]
	adds r0, #1
	strh r0, [r3]
	adds r1, #2
	adds r2, #1
	cmp r2, #0x63
	bgt _08098298
	ldrh r0, [r1]
	cmp r0, #0
	bne _0809827A
_08098298:
	mov r0, sl
	bl sub_8098048
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080982AC: .4byte gUnknown_020122D4
_080982B0: .4byte gUnknown_02012F54
_080982B4: .4byte 0x00010004

	THUMB_FUNC_END SomethingPrepListRelated

	THUMB_FUNC_START sub_80982B8
sub_80982B8: @ 0x080982B8
	push {r4, r5, lr}
	bl ClearConvoyItems
	movs r4, #0
	ldr r0, _080982F4  @ gUnknown_02012F54
	ldrh r0, [r0]
	cmp r4, r0
	bcs _080982EC
	ldr r5, _080982F8  @ gUnknown_020122D4
_080982CA:
	lsls r0, r4, #2
	adds r1, r0, r5
	ldrb r0, [r1]
	cmp r0, #0
	bne _080982DE
	ldrh r0, [r1, #2]
	cmp r0, #0
	beq _080982DE
	bl AddItemToConvoy
_080982DE:
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	ldr r0, _080982F4  @ gUnknown_02012F54
	ldrh r0, [r0]
	cmp r4, r0
	bcc _080982CA
_080982EC:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080982F4: .4byte gUnknown_02012F54
_080982F8: .4byte gUnknown_020122D4

	THUMB_FUNC_END sub_80982B8

	THUMB_FUNC_START sub_80982FC
sub_80982FC: @ 0x080982FC
	push {r4, r5, lr}
	bl ClearConvoyItems
	movs r4, #0
	movs r5, #0x88
_08098306:
	subs r0, r5, r4
	bl AddItemToConvoy
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0x63
	bls _08098306
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80982FC

	THUMB_FUNC_START sub_809831C
sub_809831C: @ 0x0809831C
	push {r4, lr}
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	movs r2, #0
	movs r1, #0
	movs r4, #1
_08098328:
	adds r0, r3, #0
	asrs r0, r1
	ands r0, r4
	cmp r0, #0
	beq _08098334
	adds r2, #1
_08098334:
	adds r1, #1
	cmp r1, #0xf
	ble _08098328
	adds r0, r2, #0
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_809831C

	THUMB_FUNC_START sub_8098344
sub_8098344: @ 0x08098344
	push {r4, r5, lr}
	adds r5, r1, #0
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	movs r3, #0
	movs r2, #0
	movs r1, #1
_08098352:
	adds r0, r4, #0
	asrs r0, r2
	ands r0, r1
	cmp r0, #0
	beq _08098368
	cmp r3, r5
	bne _08098366
	adds r0, r1, #0
	lsls r0, r2
	b _08098370
_08098366:
	adds r3, #1
_08098368:
	adds r2, #1
	cmp r2, #0xf
	ble _08098352
	movs r0, #0
_08098370:
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8098344

	THUMB_FUNC_START sub_8098378
sub_8098378: @ 0x08098378
	push {lr}
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	movs r1, #0
	movs r3, #1
_08098382:
	adds r0, r2, #0
	asrs r0, r1
	ands r0, r3
	cmp r0, #0
	beq _08098390
	adds r0, r1, #0
	b _08098398
_08098390:
	adds r1, #1
	cmp r1, #0xf
	ble _08098382
	movs r0, #0
_08098398:
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8098378

	THUMB_FUNC_START CanUnitPrepScreenUse
CanUnitPrepScreenUse: @ 0x0809839C
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	bl GetUnitItemCount
	adds r6, r0, #0
	movs r4, #0
	cmp r4, r6
	bge _080983CA
_080983AC:
	lsls r1, r4, #1
	adds r0, r5, #0
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r1, [r0]
	adds r0, r5, #0
	bl CanUnitUseItemPrepScreen
	cmp r0, #0
	beq _080983C4
	movs r0, #1
	b _080983CC
_080983C4:
	adds r4, #1
	cmp r4, r6
	blt _080983AC
_080983CA:
	movs r0, #0
_080983CC:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	THUMB_FUNC_END CanUnitPrepScreenUse

	THUMB_FUNC_START sub_80983D4
sub_80983D4: @ 0x080983D4
	push {lr}
	ldr r0, _08098400  @ 0x04000006
	ldrh r0, [r0]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0xa0
	bls _080983E6
	movs r2, #0
_080983E6:
	cmp r2, #0
	bne _080983F0
	ldr r1, _08098404  @ 0x04000012
	movs r0, #0xf8
	strh r0, [r1]
_080983F0:
	cmp r2, #0x48
	bne _080983FA
	ldr r1, _08098404  @ 0x04000012
	movs r0, #0xfc
	strh r0, [r1]
_080983FA:
	pop {r0}
	bx r0
	.align 2, 0
_08098400: .4byte 0x04000006
_08098404: .4byte 0x04000012

	THUMB_FUNC_END sub_80983D4

	THUMB_FUNC_START sub_8098408
sub_8098408: @ 0x08098408
	push {r4, lr}
	adds r4, r0, #0
	adds r2, r4, #0
	adds r2, #0x29
	ldrb r1, [r2]
	movs r0, #2
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	adds r1, r4, #0
	adds r1, #0x2b
	movs r0, #0xff
	strb r0, [r1]
	adds r1, #2
	movs r0, #1
	negs r0, r0
	strb r0, [r1]
	adds r1, #1
	movs r0, #0
	strb r0, [r1]
	strh r0, [r4, #0x34]
	str r0, [r4, #0x48]
	str r0, [r4, #0x44]
	bl sub_8096484
	adds r1, r4, #0
	adds r1, #0x2c
	strb r0, [r1]
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8098408

	THUMB_FUNC_START sub_8098448
sub_8098448: @ 0x08098448
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08098468  @ gUnknown_08A1B1FC
	ldr r1, _0809846C  @ 0x06013000
	bl CopyDataWithPossibleUncomp
	ldr r0, _08098470  @ gUnknown_08A1B638
	ldr r1, [r4, #0x34]
	adds r1, #0x10
	lsls r1, r1, #5
	movs r2, #0x20
	bl CopyToPaletteBuffer
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08098468: .4byte gUnknown_08A1B1FC
_0809846C: .4byte 0x06013000
_08098470: .4byte gUnknown_08A1B638

	THUMB_FUNC_END sub_8098448

	THUMB_FUNC_START sub_8098474
sub_8098474: @ 0x08098474
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, [r4, #0x38]
	cmp r0, #0
	beq _0809849C
	ldr r1, [r4, #0x2c]
	ldr r2, [r4, #0x30]
	ldr r3, _080984A4  @ gUnknown_08A18928
	ldr r0, [r4, #0x34]
	movs r4, #0xf
	ands r0, r4
	lsls r0, r0, #0xc
	movs r4, #0xb0
	lsls r4, r4, #3
	adds r0, r0, r4
	str r0, [sp]
	movs r0, #4
	bl PutSpriteExt
_0809849C:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080984A4: .4byte gUnknown_08A18928

	THUMB_FUNC_END sub_8098474

	THUMB_FUNC_START sub_80984A8
sub_80984A8: @ 0x080984A8
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	adds r1, r3, #0
	ldr r0, _080984C8  @ gUnknown_08A18944
	bl Proc_Start
	movs r1, #0
	str r1, [r0, #0x38]
	str r4, [r0, #0x2c]
	str r5, [r0, #0x30]
	str r6, [r0, #0x34]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080984C8: .4byte gUnknown_08A18944

	THUMB_FUNC_END sub_80984A8

	THUMB_FUNC_START sub_80984CC
sub_80984CC: @ 0x080984CC
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _080984E8  @ gUnknown_08A18944
	bl Proc_Find
	movs r1, #1
	str r1, [r0, #0x38]
	str r4, [r0, #0x2c]
	str r5, [r0, #0x30]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080984E8: .4byte gUnknown_08A18944

	THUMB_FUNC_END sub_80984CC

	THUMB_FUNC_START sub_80984EC
sub_80984EC: @ 0x080984EC
	push {lr}
	ldr r0, _080984FC  @ gUnknown_08A18944
	bl Proc_Find
	movs r1, #0
	str r1, [r0, #0x38]
	pop {r0}
	bx r0
	.align 2, 0
_080984FC: .4byte gUnknown_08A18944

	THUMB_FUNC_END sub_80984EC

	THUMB_FUNC_START sub_8098500
sub_8098500: @ 0x08098500
	push {lr}
	ldr r0, _08098510  @ gUnknown_08A18944
	bl Proc_Find
	bl Proc_End
	pop {r0}
	bx r0
	.align 2, 0
_08098510: .4byte gUnknown_08A18944

	THUMB_FUNC_END sub_8098500

	THUMB_FUNC_START sub_8098514
sub_8098514: @ 0x08098514
	push {lr}
	ldr r0, _08098528  @ gUiFramePaletteA
	movs r1, #0x90
	lsls r1, r1, #2
	movs r2, #0x20
	bl CopyToPaletteBuffer
	pop {r0}
	bx r0
	.align 2, 0
_08098528: .4byte gUiFramePaletteA

	THUMB_FUNC_END sub_8098514

	THUMB_FUNC_START sub_809852C
sub_809852C: @ 0x0809852C
	push {lr}
	sub sp, #4
	adds r2, r0, #0
	ldr r0, [r2, #0x34]
	cmp r0, #0
	beq _0809854A
	ldr r1, [r2, #0x2c]
	ldr r2, [r2, #0x30]
	ldr r3, _08098550  @ gUnknown_08A18964
	movs r0, #0x96
	lsls r0, r0, #6
	str r0, [sp]
	movs r0, #4
	bl PutSpriteExt
_0809854A:
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_08098550: .4byte gUnknown_08A18964

	THUMB_FUNC_END sub_809852C

	THUMB_FUNC_START sub_8098554
sub_8098554: @ 0x08098554
	push {lr}
	adds r1, r0, #0
	ldr r0, _0809856C  @ gUnknown_08A1898C
	bl Proc_Start
	movs r1, #0
	str r1, [r0, #0x34]
	str r1, [r0, #0x2c]
	str r1, [r0, #0x30]
	pop {r0}
	bx r0
	.align 2, 0
_0809856C: .4byte gUnknown_08A1898C

	THUMB_FUNC_END sub_8098554

	THUMB_FUNC_START sub_8098570
sub_8098570: @ 0x08098570
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _0809858C  @ gUnknown_08A1898C
	bl Proc_Find
	movs r1, #1
	str r1, [r0, #0x34]
	str r4, [r0, #0x2c]
	str r5, [r0, #0x30]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0809858C: .4byte gUnknown_08A1898C

	THUMB_FUNC_END sub_8098570

	THUMB_FUNC_START sub_8098590
sub_8098590: @ 0x08098590
	push {lr}
	ldr r0, _080985A0  @ gUnknown_08A1898C
	bl Proc_Find
	movs r1, #0
	str r1, [r0, #0x34]
	pop {r0}
	bx r0
	.align 2, 0
_080985A0: .4byte gUnknown_08A1898C

	THUMB_FUNC_END sub_8098590

	THUMB_FUNC_START sub_80985A4
sub_80985A4: @ 0x080985A4
	push {lr}
	ldr r0, _080985B4  @ gUnknown_08A1898C
	bl Proc_Find
	bl Proc_End
	pop {r0}
	bx r0
	.align 2, 0
_080985B4: .4byte gUnknown_08A1898C

	THUMB_FUNC_END sub_80985A4

	THUMB_FUNC_START sub_80985B8
sub_80985B8: @ 0x080985B8
	push {r4, r5, lr}
	ldr r0, _080985F8  @ gUnknown_02013588
	ldr r4, _080985FC  @ gUnknown_0202310E
	adds r1, r4, #0
	bl Text_Draw
	adds r5, r4, #0
	adds r5, #0x10
	bl GetPartyGoldAmount
	adds r2, r0, #0
	adds r0, r5, #0
	movs r1, #2
	bl sub_8004B88
	adds r4, #0x12
	adds r0, r4, #0
	movs r1, #3
	movs r2, #0x1e
	bl sub_8004B0C
	movs r0, #0xa8
	movs r1, #0x85
	bl sub_80984CC
	movs r0, #1
	bl BG_EnableSyncByMask
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080985F8: .4byte gUnknown_02013588
_080985FC: .4byte gUnknown_0202310E

	THUMB_FUNC_END sub_80985B8

	THUMB_FUNC_START sub_8098600
sub_8098600: @ 0x08098600
	push {lr}
	ldr r0, _0809861C  @ gUnknown_0202310E
	movs r1, #0xa
	movs r2, #1
	movs r3, #0
	bl TileMap_FillRect
	bl sub_80984EC
	movs r0, #1
	bl BG_EnableSyncByMask
	pop {r0}
	bx r0
	.align 2, 0
_0809861C: .4byte gUnknown_0202310E

	THUMB_FUNC_END sub_8098600

	THUMB_FUNC_START sub_8098620
sub_8098620: @ 0x08098620
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x28
	adds r7, r0, #0
	add r1, sp, #4
	ldr r0, _08098970  @ gUnknown_08205C14
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldm r0!, {r2, r3}
	stm r1!, {r2, r3}
	ldr r0, _08098974  @ gUnknown_08A181E8
	bl SetupBackgrounds
	ldr r4, _08098978  @ gLCDControlBuffer
	ldrb r1, [r4]
	movs r0, #8
	negs r0, r0
	ands r0, r1
	strb r0, [r4]
	add r0, sp, #4
	bl SetupFaceGfxData
	ldrb r1, [r4, #1]
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
	strb r0, [r4, #1]
	ldr r0, _0809897C  @ 0x06017800
	movs r1, #0
	bl SetupDebugFontForOBJ
	ldrb r2, [r4, #0xc]
	movs r1, #4
	negs r1, r1
	adds r0, r1, #0
	ands r0, r2
	strb r0, [r4, #0xc]
	ldrb r2, [r4, #0x10]
	adds r0, r1, #0
	ands r0, r2
	movs r2, #2
	orrs r0, r2
	strb r0, [r4, #0x10]
	ldrb r0, [r4, #0x14]
	ands r1, r0
	movs r0, #1
	orrs r1, r0
	strb r1, [r4, #0x14]
	ldrb r0, [r4, #0x18]
	movs r1, #3
	orrs r0, r1
	strb r0, [r4, #0x18]
	bl Font_InitForUIDefault
	bl ResetIconGraphics_
	movs r0, #4
	bl LoadIconPalettes
	bl LoadUiFrameGraphics
	ldr r0, _08098980  @ gUiFramePaletteD
	movs r1, #0x40
	movs r2, #0x20
	bl CopyToPaletteBuffer
	bl LoadObjUIGfx
	bl sub_80958BC
	bl sub_8095394
	bl sub_80958FC
	adds r1, r7, #0
	adds r1, #0x2a
	movs r4, #0
	strb r0, [r1]
	adds r0, r7, #0
	bl sub_80AD47C
	ldr r0, _08098984  @ sub_809A274
	adds r1, r7, #0
	bl Get6CDifferedLoop6C
	adds r0, r7, #0
	bl sub_80AC9C0
	movs r0, #0
	bl SetPrimaryHBlankHandler
	movs r0, #0
	bl BG_GetMapBuffer
	movs r1, #0
	bl BG_Fill
	movs r0, #1
	bl BG_GetMapBuffer
	movs r1, #0
	bl BG_Fill
	movs r0, #2
	bl BG_GetMapBuffer
	movs r1, #0
	bl BG_Fill
	ldr r0, _08098988  @ gPaletteBuffer
	strh r4, [r0]
	bl EnablePaletteSync
	add r4, sp, #0x24
	mov sl, r4
	ldr r5, _0809898C  @ gUnknown_02013498
	movs r4, #0xe
_08098726:
	adds r0, r5, #0
	movs r1, #5
	bl Text_Init
	adds r5, #8
	subs r4, #1
	cmp r4, #0
	bge _08098726
	movs r0, #0x2b
	adds r0, r0, r7
	mov r8, r0
	ldr r0, _08098990  @ gUnknown_02013510
	adds r6, r0, #0
	adds r6, #0x28
	adds r5, r0, #0
	movs r4, #4
_08098746:
	adds r0, r5, #0
	movs r1, #7
	bl Text_Init
	adds r0, r6, #0
	movs r1, #7
	bl Text_Init
	adds r6, #8
	adds r5, #8
	subs r4, #1
	cmp r4, #0
	bge _08098746
	ldr r4, _08098994  @ gUnknown_02013560
	adds r0, r4, #0
	movs r1, #8
	bl Text_Allocate
	adds r0, r4, #0
	adds r0, #8
	movs r1, #8
	bl Text_Allocate
	adds r0, r4, #0
	adds r0, #0x10
	movs r1, #8
	bl Text_Init
	adds r0, r4, #0
	adds r0, #0x28
	movs r1, #7
	bl Text_Init
	adds r0, r4, #0
	adds r0, #0x30
	movs r1, #5
	bl Text_Init
	ldr r0, _08098998  @ 0x06014000
	movs r1, #1
	negs r1, r1
	bl LoadDialogueBoxGfx
	movs r0, #0
	bl sub_8001F48
	movs r0, #0
	bl sub_8001F64
	movs r1, #0
	mov r9, r1
	str r1, [sp]
	movs r0, #0
	movs r2, #0
	movs r3, #0
	bl sub_8001ED0
	mov r2, r9
	str r2, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl sub_8001F0C
	ldr r3, _08098978  @ gLCDControlBuffer
	movs r4, #0x36
	adds r4, r4, r3
	mov ip, r4
	ldrb r2, [r4]
	movs r1, #0x20
	orrs r2, r1
	ldrb r0, [r3, #1]
	orrs r0, r1
	movs r1, #0x41
	negs r1, r1
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r3, #1]
	adds r0, r3, #0
	adds r0, #0x2d
	mov r1, r9
	strb r1, [r0]
	adds r0, #4
	movs r4, #4
	strb r4, [r0]
	adds r1, r3, #0
	adds r1, #0x2c
	movs r0, #0xf0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0x44
	strb r0, [r1]
	adds r6, r3, #0
	adds r6, #0x34
	ldrb r0, [r6]
	movs r5, #1
	orrs r0, r5
	movs r3, #2
	orrs r0, r3
	orrs r0, r4
	movs r4, #8
	orrs r0, r4
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r6]
	orrs r2, r5
	orrs r2, r3
	movs r0, #5
	negs r0, r0
	ands r2, r0
	orrs r2, r4
	orrs r2, r1
	mov r3, ip
	strb r2, [r3]
	ldr r2, _0809899C  @ 0x0000FFFC
	movs r0, #0
	movs r1, #4
	bl BG_SetPosition
	movs r0, #1
	movs r1, #0
	movs r2, #4
	bl BG_SetPosition
	ldr r1, _080989A0  @ 0x0000FFD8
	ldrh r2, [r7, #0x34]
	subs r2, #4
	movs r0, #0xff
	ands r2, r0
	movs r0, #2
	bl BG_SetPosition
	movs r0, #7
	bl BG_EnableSyncByMask
	bl SetupMapSpritesPalettes
	mov r4, r9
	str r4, [sp, #0x24]
	ldr r1, _080989A4  @ gUnknown_02022C08
	ldr r2, _080989A8  @ 0x01000008
	mov r0, sl
	bl CpuFastSet
	bl SMS_FlushIndirect
	ldr r0, _080989AC  @ gUnknown_08A1D4E8
	ldr r1, _080989B0  @ 0x06013E00
	bl CopyDataWithPossibleUncomp
	movs r0, #0x3c
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #0xd0
	bl sub_80ACA4C
	movs r0, #0xc0
	lsls r0, r0, #3
	movs r1, #1
	bl sub_80AD4A0
	bl sub_8095A1C
	mov r1, r8
	ldrb r0, [r1]
	cmp r0, #0xff
	beq _080988E2
	adds r5, r0, #0
	movs r1, #3
	bl __umodsi3
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x12
	adds r4, #0x18
	adds r0, r5, #0
	movs r1, #3
	bl __udivsi3
	adds r2, r0, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x14
	ldrh r0, [r7, #0x34]
	subs r0, #4
	subs r2, r2, r0
	movs r0, #0
	adds r1, r4, #0
	movs r3, #2
	bl sub_80AC9D4
	mov r2, r8
	ldrb r0, [r2]
	bl sub_8095354
	adds r1, r0, #0
	ldr r0, _080989B4  @ 0x00000503
	str r0, [sp]
	movs r0, #0
	movs r2, #0x3c
	movs r3, #0x4c
	bl sub_8099E98
_080988E2:
	movs r3, #0x80
	lsls r3, r3, #2
	movs r4, #4
	str r4, [sp]
	adds r0, r7, #0
	movs r1, #0xe0
	movs r2, #0xb
	bl sub_8097748
	ldrh r4, [r7, #0x34]
	bl sub_8095374
	subs r0, #1
	movs r1, #3
	bl __divsi3
	adds r2, r0, #0
	adds r2, #1
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #6
	adds r1, r4, #0
	movs r3, #4
	bl sub_80976CC
	bl sub_8097668
	bl sub_8095928
	movs r0, #1
	movs r1, #8
	movs r2, #8
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	mov r0, r9
	str r0, [sp]
	movs r0, #0
	movs r1, #1
	movs r2, #0
	movs r3, #0
	bl sub_8001ED0
	mov r1, r9
	str r1, [sp]
	movs r0, #0
	movs r1, #1
	movs r2, #0
	movs r3, #0
	bl sub_8001F0C
	ldr r0, _080989B8  @ sub_80983D4
	bl SetPrimaryHBlankHandler
	movs r0, #0xa8
	movs r1, #0x85
	movs r2, #0xb
	adds r3, r7, #0
	bl sub_80984A8
	adds r0, r7, #0
	bl sub_8098554
	add sp, #0x28
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08098970: .4byte gUnknown_08205C14
_08098974: .4byte gUnknown_08A181E8
_08098978: .4byte gLCDControlBuffer
_0809897C: .4byte 0x06017800
_08098980: .4byte gUiFramePaletteD
_08098984: .4byte sub_809A274
_08098988: .4byte gPaletteBuffer
_0809898C: .4byte gUnknown_02013498
_08098990: .4byte gUnknown_02013510
_08098994: .4byte gUnknown_02013560
_08098998: .4byte 0x06014000
_0809899C: .4byte 0x0000FFFC
_080989A0: .4byte 0x0000FFD8
_080989A4: .4byte gUnknown_02022C08
_080989A8: .4byte 0x01000008
_080989AC: .4byte gUnknown_08A1D4E8
_080989B0: .4byte 0x06013E00
_080989B4: .4byte 0x00000503
_080989B8: .4byte sub_80983D4

	THUMB_FUNC_END sub_8098620

	THUMB_FUNC_START sub_80989BC
sub_80989BC: @ 0x080989BC
	push {lr}
	adds r0, #0x2a
	ldrb r0, [r0]
	bl sub_8095354
	ldr r0, [r0]
	ldrb r0, [r0, #4]
	bl sub_80953C0
	bl DeleteEach6CDifferedLoop
	bl sub_80AD580
	bl sub_80ACB00
	movs r0, #0
	bl sub_8099F50
	movs r0, #1
	bl sub_8099F50
	bl EndBG3Slider_
	bl EndHelpPromptSprite
	bl Delete6CMenuScroll
	bl sub_8098500
	bl sub_80985A4
	movs r0, #0
	bl SetPrimaryHBlankHandler
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80989BC

	THUMB_FUNC_START sub_8098A04
sub_8098A04: @ 0x08098A04
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #8
	adds r5, r0, #0
	movs r1, #0xa
	movs r2, #6
	movs r3, #0
	bl TileMap_FillRect
	ldr r4, _08098A68  @ gUnknown_02013560
	adds r0, r4, #0
	bl Text_Clear
	movs r0, #8
	adds r0, r0, r4
	mov r8, r0
	bl Text_Clear
	ldr r0, _08098A6C  @ 0x00000583
	bl GetStringFromIndex
	adds r1, r5, #0
	adds r1, #0x42
	movs r6, #0
	str r6, [sp]
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r2, #0
	movs r3, #0
	bl DrawTextInline
	ldr r0, _08098A70  @ 0x00000584
	bl GetStringFromIndex
	adds r5, #0xc2
	str r6, [sp]
	str r0, [sp, #4]
	mov r0, r8
	adds r1, r5, #0
	movs r2, #0
	movs r3, #0
	bl DrawTextInline
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08098A68: .4byte gUnknown_02013560
_08098A6C: .4byte 0x00000583
_08098A70: .4byte 0x00000584

	THUMB_FUNC_END sub_8098A04

	THUMB_FUNC_START sub_8098A74
sub_8098A74: @ 0x08098A74
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r6, r0, #0
	movs r1, #0xa
	movs r2, #8
	movs r3, #0
	bl TileMap_FillRect
	ldr r4, _08098AB0  @ gUnknown_02013560
	adds r0, r4, #0
	bl Text_Clear
	adds r0, r4, #0
	adds r0, #8
	bl Text_Clear
	adds r4, #0x10
	adds r0, r4, #0
	bl Text_Clear
	bl sub_80C4070
	cmp r0, #1
	beq _08098AC8
	cmp r0, #1
	bgt _08098AB4
	cmp r0, #0
	beq _08098ABE
	b _08098ADA
	.align 2, 0
_08098AB0: .4byte gUnknown_02013560
_08098AB4:
	cmp r0, #2
	beq _08098AD0
	cmp r0, #3
	beq _08098AD8
	b _08098ADA
_08098ABE:
	ldr r5, _08098AC4  @ 0x00000672
	b _08098ADA
	.align 2, 0
_08098AC4: .4byte 0x00000672
_08098AC8:
	ldr r5, _08098ACC  @ 0x00000673
	b _08098ADA
	.align 2, 0
_08098ACC: .4byte 0x00000673
_08098AD0:
	ldr r5, _08098AD4  @ 0x00000674
	b _08098ADA
	.align 2, 0
_08098AD4: .4byte 0x00000674
_08098AD8:
	ldr r5, _08098B38  @ 0x00000675
_08098ADA:
	adds r0, r5, #0
	bl GetStringFromIndex
	ldr r4, _08098B3C  @ gUnknown_02013560
	adds r1, r6, #0
	adds r1, #0x80
	movs r5, #0
	str r5, [sp]
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r2, #0
	movs r3, #4
	bl DrawTextInline
	ldr r0, _08098B40  @ 0x00000583
	bl GetStringFromIndex
	adds r2, r4, #0
	adds r2, #8
	movs r3, #0x80
	lsls r3, r3, #1
	adds r1, r6, r3
	str r5, [sp]
	str r0, [sp, #4]
	adds r0, r2, #0
	movs r2, #0
	movs r3, #4
	bl DrawTextInline
	ldr r0, _08098B44  @ 0x00000584
	bl GetStringFromIndex
	adds r4, #0x10
	movs r2, #0xc0
	lsls r2, r2, #1
	adds r1, r6, r2
	str r5, [sp]
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r2, #0
	movs r3, #4
	bl DrawTextInline
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08098B38: .4byte 0x00000675
_08098B3C: .4byte gUnknown_02013560
_08098B40: .4byte 0x00000583
_08098B44: .4byte 0x00000584

	THUMB_FUNC_END sub_8098A74

	THUMB_FUNC_START sub_8098B48
sub_8098B48: @ 0x08098B48
	push {lr}
	sub sp, #4
	ldr r0, _08098B64  @ 0x0000A440
	str r0, [sp]
	movs r0, #0x88
	movs r1, #0x59
	movs r2, #9
	movs r3, #4
	bl sub_809A31C
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_08098B64: .4byte 0x0000A440

	THUMB_FUNC_END sub_8098B48

	THUMB_FUNC_START sub_8098B68
sub_8098B68: @ 0x08098B68
	push {lr}
	sub sp, #4
	bl sub_80C4070
	cmp r0, #3
	bne _08098B8C
	ldr r0, _08098B88  @ 0x0000A440
	str r0, [sp]
	movs r0, #0x88
	movs r1, #0x51
	movs r2, #9
	movs r3, #6
	bl sub_809A31C
	b _08098B9C
	.align 2, 0
_08098B88: .4byte 0x0000A440
_08098B8C:
	ldr r0, _08098BA4  @ 0x0000A440
	str r0, [sp]
	movs r0, #0x88
	movs r1, #0x51
	movs r2, #9
	movs r3, #6
	bl sub_809A31C
_08098B9C:
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_08098BA4: .4byte 0x0000A440

	THUMB_FUNC_END sub_8098B68

	THUMB_FUNC_START sub_8098BA8
sub_8098BA8: @ 0x08098BA8
	push {lr}
	sub sp, #4
	ldr r0, _08098BC4  @ 0x0000A440
	str r0, [sp]
	movs r0, #8
	movs r1, #0x5c
	movs r2, #0xa
	movs r3, #5
	bl sub_809A31C
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_08098BC4: .4byte 0x0000A440

	THUMB_FUNC_END sub_8098BA8

	THUMB_FUNC_START sub_8098BC8
sub_8098BC8: @ 0x08098BC8
	push {lr}
	sub sp, #4
	ldr r0, _08098BE4  @ 0x0000A840
	str r0, [sp]
	movs r0, #0x88
	movs r1, #0x51
	movs r2, #9
	movs r3, #6
	bl sub_809A31C
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_08098BE4: .4byte 0x0000A840

	THUMB_FUNC_END sub_8098BC8

	THUMB_FUNC_START sub_8098BE8
sub_8098BE8: @ 0x08098BE8
	push {lr}
	ldr r0, _08098C04  @ gUnknown_03005280
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08098C0C
	ldr r0, _08098C08  @ sub_8098B68
	bl Find6CDifferedLoop
	bl Proc_End
	b _08098C16
	.align 2, 0
_08098C04: .4byte gUnknown_03005280
_08098C08: .4byte sub_8098B68
_08098C0C:
	ldr r0, _08098C30  @ sub_8098B48
	bl Find6CDifferedLoop
	bl Proc_End
_08098C16:
	ldr r0, _08098C34  @ sub_8098BA8
	bl Find6CDifferedLoop
	bl Proc_End
	ldr r0, _08098C38  @ sub_8098BC8
	bl Find6CDifferedLoop
	bl Proc_End
	pop {r0}
	bx r0
	.align 2, 0
_08098C30: .4byte sub_8098B48
_08098C34: .4byte sub_8098BA8
_08098C38: .4byte sub_8098BC8

	THUMB_FUNC_END sub_8098BE8

	THUMB_FUNC_START sub_8098C3C
sub_8098C3C: @ 0x08098C3C
	push {r4, r5, r6, lr}
	sub sp, #0x10
	adds r2, r0, #0
	adds r4, r1, #0
	mov r1, sp
	ldr r0, _08098C80  @ gUnknown_08205C34
	ldm r0!, {r3, r5, r6}
	stm r1!, {r3, r5, r6}
	ldr r0, [r0]
	str r0, [r1]
	ldr r0, _08098C84  @ gUnknown_08A1D8D0
	movs r1, #0xc0
	lsls r1, r1, #0x13
	adds r2, r2, r1
	adds r1, r2, #0
	bl CopyDataWithPossibleUncomp
	ldr r0, _08098C88  @ gRAMChapterData
	adds r0, #0x41
	ldrb r1, [r0]
	movs r0, #0xc
	ands r0, r1
	add r0, sp
	ldr r0, [r0]
	lsls r4, r4, #5
	adds r1, r4, #0
	movs r2, #0x20
	bl CopyToPaletteBuffer
	add sp, #0x10
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08098C80: .4byte gUnknown_08205C34
_08098C84: .4byte gUnknown_08A1D8D0
_08098C88: .4byte gRAMChapterData

	THUMB_FUNC_END sub_8098C3C

	THUMB_FUNC_START sub_8098C8C
sub_8098C8C: @ 0x08098C8C
	push {r4, lr}
	adds r2, r0, #0
	adds r4, r1, #0
	ldr r0, _08098CB4  @ gUnknown_08A1D7DC
	ldr r1, _08098CB8  @ 0x06010000
	adds r2, r2, r1
	adds r1, r2, #0
	bl CopyDataWithPossibleUncomp
	ldr r0, _08098CBC  @ gUiFramePaletteD
	adds r4, #0x10
	lsls r4, r4, #5
	adds r1, r4, #0
	movs r2, #0x20
	bl CopyToPaletteBuffer
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08098CB4: .4byte gUnknown_08A1D7DC
_08098CB8: .4byte 0x06010000
_08098CBC: .4byte gUiFramePaletteD

	THUMB_FUNC_END sub_8098C8C

	THUMB_FUNC_START sub_8098CC0
sub_8098CC0: @ 0x08098CC0
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r6, r0, #0
	bl LoadUiFrameGraphics
	movs r0, #1
	movs r1, #0
	movs r2, #4
	bl BG_SetPosition
	adds r0, r6, #0
	bl sub_809A08C
	movs r0, #0
	bl BG_GetMapBuffer
	movs r1, #0
	bl BG_Fill
	movs r0, #1
	bl BG_GetMapBuffer
	movs r1, #0
	bl BG_Fill
	movs r0, #2
	bl BG_GetMapBuffer
	movs r1, #0
	bl BG_Fill
	movs r0, #0xc0
	lsls r0, r0, #7
	movs r1, #5
	bl sub_8098C3C
	movs r0, #0x80
	lsls r0, r0, #4
	movs r1, #0xa
	bl sub_8098C8C
	ldr r0, _08098D78  @ gUnknown_08A1B8B8
	ldr r4, _08098D7C  @ gUnknown_02020188
	adds r1, r4, #0
	bl CopyDataWithPossibleUncomp
	ldr r0, _08098D80  @ gBG1TilemapBuffer
	movs r2, #0x80
	lsls r2, r2, #5
	adds r1, r4, #0
	bl CallARM_FillTileRect
	ldr r0, _08098D84  @ gUiFramePaletteD
	movs r1, #0x40
	movs r2, #0x20
	bl CopyToPaletteBuffer
	adds r5, r6, #0
	adds r5, #0x2a
	ldrb r0, [r5]
	bl sub_8095354
	adds r1, r0, #0
	ldr r0, _08098D88  @ 0x00000503
	str r0, [sp]
	movs r0, #0
	movs r2, #0x3c
	movs r3, #0x4c
	bl sub_8099E98
	ldr r4, _08098D8C  @ gUnknown_02013510
	ldr r7, _08098D90  @ gUnknown_02022EEC
	ldrb r0, [r5]
	bl sub_8095354
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r7, #0
	movs r3, #2
	bl sub_8099F7C
	ldr r0, _08098D94  @ gUnknown_03005280
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08098D98
	adds r0, r7, #0
	subs r0, #0x20
	bl sub_8098A74
	b _08098DA0
	.align 2, 0
_08098D78: .4byte gUnknown_08A1B8B8
_08098D7C: .4byte gUnknown_02020188
_08098D80: .4byte gBG1TilemapBuffer
_08098D84: .4byte gUiFramePaletteD
_08098D88: .4byte 0x00000503
_08098D8C: .4byte gUnknown_02013510
_08098D90: .4byte gUnknown_02022EEC
_08098D94: .4byte gUnknown_03005280
_08098D98:
	adds r0, r7, #0
	adds r0, #0x60
	bl sub_8098A04
_08098DA0:
	adds r1, r6, #0
	adds r1, #0x32
	movs r0, #0
	strb r0, [r1]
	adds r0, r6, #0
	adds r0, #0x2a
	ldrb r5, [r0]
	adds r0, r5, #0
	movs r1, #3
	bl __umodsi3
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x12
	adds r4, #0x18
	adds r0, r5, #0
	movs r1, #3
	bl __udivsi3
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x14
	ldrh r0, [r6, #0x34]
	subs r0, #4
	subs r1, r1, r0
	movs r3, #0x80
	lsls r3, r3, #4
	adds r0, r4, #0
	movs r2, #7
	bl sub_80AD51C
	adds r0, r6, #0
	movs r1, #0
	bl sub_809A504
	bl sub_80ACAE4
	bl sub_80ACAA4
	movs r0, #0x78
	movs r1, #0x8c
	movs r2, #9
	adds r3, r6, #0
	bl StartHelpPromptSprite
	bl sub_8098BE8
	ldr r0, _08098E14  @ gUnknown_03005280
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08098E1C
	ldr r0, _08098E18  @ sub_8098B68
	adds r1, r6, #0
	bl Get6CDifferedLoop6C
	b _08098E24
	.align 2, 0
_08098E14: .4byte gUnknown_03005280
_08098E18: .4byte sub_8098B68
_08098E1C:
	ldr r0, _08098E3C  @ sub_8098B48
	adds r1, r6, #0
	bl Get6CDifferedLoop6C
_08098E24:
	bl sub_80985B8
	bl sub_8098590
	movs r0, #7
	bl BG_EnableSyncByMask
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08098E3C: .4byte sub_8098B48

	THUMB_FUNC_END sub_8098CC0

	THUMB_FUNC_START sub_8098E40
sub_8098E40: @ 0x08098E40
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	mov r3, r8
	adds r3, #0x2a
	ldrb r7, [r3]
	ldr r0, _08098F1C  @ gKeyStatusPtr
	ldr r2, [r0]
	ldrh r5, [r2, #6]
	mov r4, r8
	adds r4, #0x31
	movs r0, #4
	strb r0, [r4]
	ldrh r1, [r2, #4]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08098E6E
	ldrh r5, [r2, #4]
	movs r0, #8
	strb r0, [r4]
_08098E6E:
	movs r0, #0x40
	ands r0, r5
	cmp r0, #0
	beq _08098E80
	ldrb r0, [r3]
	subs r0, #3
	cmp r0, #0
	blt _08098E80
	strb r0, [r3]
_08098E80:
	movs r0, #0x80
	ands r0, r5
	mov r6, r8
	adds r6, #0x2a
	cmp r0, #0
	beq _08098E9E
	ldrb r4, [r6]
	adds r4, #3
	bl sub_8095374
	cmp r4, r0
	bge _08098E9E
	ldrb r0, [r6]
	adds r0, #3
	strb r0, [r6]
_08098E9E:
	movs r0, #0x20
	ands r0, r5
	cmp r0, #0
	beq _08098EBA
	ldrb r4, [r6]
	adds r0, r4, #0
	movs r1, #3
	bl __umodsi3
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08098EBA
	subs r0, r4, #1
	strb r0, [r6]
_08098EBA:
	movs r0, #0x10
	ands r5, r0
	cmp r5, #0
	beq _08098EE4
	ldrb r4, [r6]
	adds r0, r4, #0
	movs r1, #3
	bl __umodsi3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bhi _08098EE4
	adds r4, #1
	bl sub_8095374
	cmp r4, r0
	bge _08098EE4
	ldrb r0, [r6]
	adds r0, #1
	strb r0, [r6]
_08098EE4:
	ldrb r0, [r6]
	cmp r0, r7
	beq _08098FA0
	movs r1, #3
	bl __udivsi3
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x14
	bl sub_8095374
	subs r0, #1
	movs r1, #3
	bl __divsi3
	lsls r2, r0, #4
	mov r0, r8
	ldrh r1, [r0, #0x34]
	subs r0, r4, r1
	cmp r0, #0x20
	ble _08098F20
	adds r0, r1, #0
	adds r0, #0x30
	cmp r0, r2
	bge _08098F20
	lsrs r1, r1, #4
	adds r1, #4
	b _08098F34
	.align 2, 0
_08098F1C: .4byte gKeyStatusPtr
_08098F20:
	mov r1, r8
	ldrh r0, [r1, #0x34]
	subs r1, r4, r0
	adds r7, r0, #0
	cmp r1, #0xf
	bgt _08098F54
	cmp r7, #0
	beq _08098F54
	lsrs r1, r7, #4
	subs r1, #1
_08098F34:
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov r0, r8
	movs r2, #0
	bl sub_809A114
	ldrb r0, [r6]
	movs r1, #3
	bl __umodsi3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x12
	adds r0, #0x18
	bl sub_80AD4E4
	b _08098F84
_08098F54:
	ldrb r5, [r6]
	adds r0, r5, #0
	movs r1, #3
	bl __umodsi3
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x12
	adds r4, #0x18
	adds r0, r5, #0
	movs r1, #3
	bl __udivsi3
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x14
	subs r0, r7, #4
	subs r1, r1, r0
	movs r3, #0x80
	lsls r3, r3, #4
	adds r0, r4, #0
	movs r2, #7
	bl sub_80AD51C
_08098F84:
	ldr r0, _08098F9C  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08098F96
	movs r0, #0x65
	bl m4aSongNumStart
_08098F96:
	movs r0, #1
	b _08098FA2
	.align 2, 0
_08098F9C: .4byte gRAMChapterData
_08098FA0:
	movs r0, #0
_08098FA2:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8098E40

	THUMB_FUNC_START sub_8098FAC
sub_8098FAC: @ 0x08098FAC
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	movs r1, #3
	bl __udivsi3
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x14
	bl sub_8095374
	subs r0, #1
	movs r1, #3
	bl __divsi3
	lsls r2, r0, #4
	ldrh r1, [r6, #0x34]
	subs r0, r7, r1
	cmp r0, #0x20
	ble _0809904C
	adds r0, r1, #0
	adds r0, #0x30
	cmp r0, r2
	bge _0809904C
	adds r0, r6, #0
	adds r0, #0x31
	ldrb r2, [r0]
	adds r2, r1, r2
	strh r2, [r6, #0x34]
	ldr r1, _080990D0  @ 0x0000FFD8
	subs r2, #4
	movs r0, #0xff
	ands r2, r0
	movs r0, #2
	bl BG_SetPosition
	adds r1, r6, #0
	adds r1, #0x2b
	ldrb r0, [r1]
	cmp r0, #0xff
	beq _0809902C
	adds r5, r0, #0
	movs r1, #3
	bl __umodsi3
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x12
	adds r4, #0x18
	adds r0, r5, #0
	movs r1, #3
	bl __udivsi3
	adds r2, r0, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x14
	ldrh r0, [r6, #0x34]
	subs r0, #4
	subs r2, r2, r0
	movs r0, #0
	adds r1, r4, #0
	movs r3, #2
	bl sub_80AC9D4
_0809902C:
	ldrh r4, [r6, #0x34]
	bl sub_8095374
	subs r0, #1
	movs r1, #3
	bl __divsi3
	adds r2, r0, #0
	adds r2, #1
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #6
	adds r1, r4, #0
	movs r3, #4
	bl sub_80976CC
_0809904C:
	ldrh r1, [r6, #0x34]
	subs r0, r7, r1
	cmp r0, #0xf
	bgt _080990C8
	cmp r1, #0
	beq _080990C8
	adds r0, r6, #0
	adds r0, #0x31
	ldrb r2, [r0]
	subs r2, r1, r2
	strh r2, [r6, #0x34]
	ldr r1, _080990D0  @ 0x0000FFD8
	subs r2, #4
	movs r0, #0xff
	ands r2, r0
	movs r0, #2
	bl BG_SetPosition
	adds r1, r6, #0
	adds r1, #0x2b
	ldrb r0, [r1]
	cmp r0, #0xff
	beq _080990A8
	adds r5, r0, #0
	movs r1, #3
	bl __umodsi3
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x12
	adds r4, #0x18
	adds r0, r5, #0
	movs r1, #3
	bl __udivsi3
	adds r2, r0, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x14
	ldrh r0, [r6, #0x34]
	subs r0, #4
	subs r2, r2, r0
	movs r0, #0
	adds r1, r4, #0
	movs r3, #2
	bl sub_80AC9D4
_080990A8:
	ldrh r4, [r6, #0x34]
	bl sub_8095374
	subs r0, #1
	movs r1, #3
	bl __divsi3
	adds r2, r0, #0
	adds r2, #1
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #6
	adds r1, r4, #0
	movs r3, #4
	bl sub_80976CC
_080990C8:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080990D0: .4byte 0x0000FFD8

	THUMB_FUNC_END sub_8098FAC

	THUMB_FUNC_START sub_80990D4
sub_80990D4: @ 0x080990D4
	push {r4, lr}
	adds r4, r0, #0
	bl sub_80989BC
	movs r0, #0x31
	bl SetStatScreenConfig
	adds r0, r4, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	bl sub_8095354
	adds r1, r4, #0
	bl StartStatScreen
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80990D4

	THUMB_FUNC_START sub_8099100
sub_8099100: @ 0x08099100
	push {r4, lr}
	adds r4, r0, #0
	bl sub_8098620
	bl sub_8095674
	adds r1, r4, #0
	adds r1, #0x2a
	strb r0, [r1]
	adds r0, r4, #0
	bl sub_809A08C
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8099100

	THUMB_FUNC_START sub_8099120
sub_8099120: @ 0x08099120
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r6, r0, #0
	ldrh r0, [r6, #0x34]
	movs r1, #0xf
	ands r0, r1
	cmp r0, #0
	beq _08099132
	b _0809930E
_08099132:
	ldr r0, _0809914C  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08099150
	adds r0, r6, #0
	bl Proc_Break
	b _08099314
	.align 2, 0
_0809914C: .4byte gKeyStatusPtr
_08099150:
	movs r2, #1
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	bne _0809915C
	b _08099288
_0809915C:
	ldr r0, _080991A4  @ gUnknown_03005280
	ldrb r1, [r0]
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	beq _08099202
	bl sub_80C4070
	cmp r0, #2
	beq _080991A8
	cmp r0, #3
	bne _080991FC
	adds r4, r6, #0
	adds r4, #0x2a
	ldrb r0, [r4]
	adds r5, r6, #0
	adds r5, #0x2b
	strb r0, [r5]
	ldrb r7, [r4]
	adds r0, r7, #0
	movs r1, #3
	bl __umodsi3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bhi _08099230
	bl sub_8095374
	subs r0, #1
	cmp r7, r0
	bge _08099230
	ldrb r0, [r4]
	adds r0, #1
	b _08099234
	.align 2, 0
_080991A4: .4byte gUnknown_03005280
_080991A8:
	adds r0, r6, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	bl sub_8095354
	movs r1, #0x72
	bl UnitHasItem
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080991E0
	ldr r0, _080991DC  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080991D0
	movs r0, #0x6a
	bl m4aSongNumStart
_080991D0:
	adds r0, r6, #0
	movs r1, #0xd
	bl Proc_Goto
	b _08099314
	.align 2, 0
_080991DC: .4byte gRAMChapterData
_080991E0:
	ldr r0, _080991F8  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	bge _080991EE
	b _08099314
_080991EE:
	movs r0, #0x6c
	bl m4aSongNumStart
	b _08099314
	.align 2, 0
_080991F8: .4byte gRAMChapterData
_080991FC:
	adds r0, r6, #0
	movs r1, #0xd
	b _0809926A
_08099202:
	adds r4, r6, #0
	adds r4, #0x2a
	ldrb r0, [r4]
	adds r5, r6, #0
	adds r5, #0x2b
	strb r0, [r5]
	ldrb r7, [r4]
	adds r0, r7, #0
	movs r1, #3
	bl __umodsi3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bhi _08099230
	bl sub_8095374
	subs r0, #1
	cmp r7, r0
	bge _08099230
	ldrb r0, [r4]
	adds r0, #1
	b _08099234
_08099230:
	ldrb r0, [r4]
	subs r0, #1
_08099234:
	strb r0, [r4]
	ldrb r5, [r5]
	adds r0, r5, #0
	movs r1, #3
	bl __umodsi3
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x12
	adds r4, #0x18
	adds r0, r5, #0
	movs r1, #3
	bl __udivsi3
	adds r2, r0, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x14
	ldrh r0, [r6, #0x34]
	subs r0, #4
	subs r2, r2, r0
	movs r0, #0
	adds r1, r4, #0
	movs r3, #2
	bl sub_80AC9D4
	adds r0, r6, #0
	movs r1, #2
_0809926A:
	bl Proc_Goto
	ldr r0, _08099284  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08099314
	movs r0, #0x6a
	bl m4aSongNumStart
	b _08099314
	.align 2, 0
_08099284: .4byte gRAMChapterData
_08099288:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080992CC
	ldr r0, _080992C4  @ gUnknown_03005280
	ldrb r1, [r0]
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	beq _080992A8
	adds r2, r6, #0
	adds r2, #0x29
	ldrb r0, [r2]
	movs r1, #1
	orrs r0, r1
	strb r0, [r2]
_080992A8:
	adds r0, r6, #0
	movs r1, #0xd
	bl Proc_Goto
	ldr r0, _080992C8  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08099314
	movs r0, #0x6b
	bl m4aSongNumStart
	b _08099314
	.align 2, 0
_080992C4: .4byte gUnknown_03005280
_080992C8: .4byte gRAMChapterData
_080992CC:
	adds r0, r6, #0
	bl sub_8098E40
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809930E
	adds r7, r6, #0
	adds r7, #0x2a
	ldrb r0, [r7]
	bl sub_8095354
	adds r1, r0, #0
	ldr r0, _0809931C  @ 0x00000503
	str r0, [sp]
	movs r0, #0
	movs r2, #0x3c
	movs r3, #0x4c
	bl sub_8099E98
	ldr r4, _08099320  @ gUnknown_02013510
	ldr r5, _08099324  @ gUnknown_02022EEC
	ldrb r0, [r7]
	bl sub_8095354
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	movs r3, #2
	bl sub_8099F7C
	movs r0, #1
	bl BG_EnableSyncByMask
_0809930E:
	adds r0, r6, #0
	bl sub_8098FAC
_08099314:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809931C: .4byte 0x00000503
_08099320: .4byte gUnknown_02013510
_08099324: .4byte gUnknown_02022EEC

	THUMB_FUNC_END sub_8099120

	THUMB_FUNC_START sub_8099328
sub_8099328: @ 0x08099328
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	mov r9, r0
	mov r8, r1
	mov sl, r2
	mov r0, r8
	movs r1, #0xa
	movs r2, #6
	movs r3, #0
	bl TileMap_FillRect
	ldr r7, _08099454  @ gUnknown_02013560
	adds r0, r7, #0
	bl Text_Clear
	bl sub_8095374
	movs r4, #0
	cmp r0, #1
	bgt _08099358
	movs r4, #1
_08099358:
	ldr r0, _08099458  @ 0x00000594
	bl GetStringFromIndex
	adds r3, r0, #0
	adds r0, r7, #0
	movs r1, #0
	adds r2, r4, #0
	bl Text_InsertString
	bl sub_8095374
	movs r4, #0
	cmp r0, #1
	bgt _08099376
	movs r4, #1
_08099376:
	ldr r0, _0809945C  @ 0x00000595
	bl GetStringFromIndex
	adds r3, r0, #0
	adds r0, r7, #0
	movs r1, #0x20
	adds r2, r4, #0
	bl Text_InsertString
	mov r1, r8
	adds r1, #0x40
	adds r0, r7, #0
	bl Text_Draw
	adds r5, r7, #0
	adds r5, #8
	adds r0, r5, #0
	bl Text_Clear
	mov r0, sl
	bl CanUnitPrepScreenUse
	movs r4, #0
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080993AC
	movs r4, #1
_080993AC:
	ldr r0, _08099460  @ 0x00000596
	bl GetStringFromIndex
	adds r3, r0, #0
	adds r0, r5, #0
	movs r1, #0
	adds r2, r4, #0
	bl Text_InsertString
	movs r6, #0
	mov r4, r9
	adds r4, #0x2c
	movs r0, #0
	ldrsb r0, [r4, r0]
	cmp r0, #0
	bne _080993CE
	movs r6, #1
_080993CE:
	ldr r0, _08099464  @ 0x0000059A
	bl GetStringFromIndex
	adds r3, r0, #0
	adds r0, r5, #0
	movs r1, #0x20
	adds r2, r6, #0
	bl Text_InsertString
	mov r1, r8
	adds r1, #0xc0
	adds r0, r5, #0
	bl Text_Draw
	adds r5, r7, #0
	adds r5, #0x10
	adds r0, r5, #0
	bl Text_Clear
	movs r6, #0
	movs r0, #0
	ldrsb r0, [r4, r0]
	cmp r0, #0
	bne _08099400
	movs r6, #1
_08099400:
	movs r0, #0xb3
	lsls r0, r0, #3
	bl GetStringFromIndex
	adds r3, r0, #0
	adds r0, r5, #0
	movs r1, #0
	adds r2, r6, #0
	bl Text_InsertString
	ldr r0, _08099468  @ gUnknown_03005280
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08099470
	adds r6, r5, #0
	movs r5, #0
	movs r0, #0
	ldrsb r0, [r4, r0]
	cmp r0, #0
	beq _0809943E
	mov r0, sl
	bl GetUnitItemCount
	cmp r0, #0
	ble _0809943E
	bl CheckSomethingSomewhere
	cmp r0, #0
	beq _08099440
_0809943E:
	movs r5, #1
_08099440:
	ldr r0, _0809946C  @ 0x00000597
	bl GetStringFromIndex
	adds r3, r0, #0
	adds r0, r6, #0
	movs r1, #0x20
	adds r2, r5, #0
	bl Text_InsertString
	b _080994A2
	.align 2, 0
_08099454: .4byte gUnknown_02013560
_08099458: .4byte 0x00000594
_0809945C: .4byte 0x00000595
_08099460: .4byte 0x00000596
_08099464: .4byte 0x0000059A
_08099468: .4byte gUnknown_03005280
_0809946C: .4byte 0x00000597
_08099470:
	bl CheckSomethingSomewhere
	cmp r0, #0
	beq _08099490
	ldr r0, _0809948C  @ 0x00000599
	bl GetStringFromIndex
	adds r3, r0, #0
	adds r0, r5, #0
	movs r1, #0x20
	movs r2, #1
	bl Text_InsertString
	b _080994A2
	.align 2, 0
_0809948C: .4byte 0x00000599
_08099490:
	ldr r0, _080994BC  @ 0x00000599
	bl GetStringFromIndex
	adds r3, r0, #0
	adds r0, r5, #0
	movs r1, #0x20
	movs r2, #0
	bl Text_InsertString
_080994A2:
	ldr r0, _080994C0  @ gUnknown_02013570
	movs r1, #0xa0
	lsls r1, r1, #1
	add r1, r8
	bl Text_Draw
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080994BC: .4byte 0x00000599
_080994C0: .4byte gUnknown_02013570

	THUMB_FUNC_END sub_8099328

	THUMB_FUNC_START sub_80994C4
sub_80994C4: @ 0x080994C4
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	sub sp, #8
	adds r4, r0, #0
	movs r0, #0x2b
	adds r0, r0, r4
	mov r9, r0
	ldrb r0, [r0]
	bl sub_8095354
	adds r6, r0, #0
	adds r4, #0x32
	movs r1, #0
	mov r8, r1
	movs r0, #1
	strb r0, [r4]
	movs r0, #0
	bl BG_GetMapBuffer
	movs r1, #0
	bl BG_Fill
	ldr r5, _080995B8  @ gUnknown_02013510
	ldr r7, _080995BC  @ gUnknown_02022EEC
	mov r2, r9
	ldrb r0, [r2]
	bl sub_8095354
	adds r2, r0, #0
	adds r0, r5, #0
	adds r1, r7, #0
	movs r3, #0
	bl sub_8099F7C
	ldr r0, _080995C0  @ gUnknown_08A1B8B8
	ldr r4, _080995C4  @ gUnknown_02020188
	adds r1, r4, #0
	bl CopyDataWithPossibleUncomp
	ldr r0, _080995C8  @ gBG1TilemapBuffer
	movs r2, #0x80
	lsls r2, r2, #5
	adds r1, r4, #0
	bl CallARM_FillTileRect
	movs r0, #0
	movs r1, #0x1f
	bl sub_8098570
	adds r0, r6, #0
	bl GetUnitPortraitId
	ldr r3, _080995CC  @ 0xFFFFFEC0
	adds r1, r7, r3
	movs r2, #0x9c
	lsls r2, r2, #2
	mov r3, r8
	str r3, [sp]
	movs r3, #3
	bl sub_8005988
	adds r5, #0x80
	adds r0, r5, #0
	bl Text_Clear
	ldr r0, [r6]
	ldrh r0, [r0]
	bl GetStringFromIndex
	adds r4, r0, #0
	movs r0, #0x28
	adds r1, r4, #0
	bl GetStringTextCenteredPos
	adds r3, r0, #0
	ldr r0, _080995D0  @ 0xFFFFFECC
	adds r1, r7, r0
	mov r2, r8
	str r2, [sp]
	str r4, [sp, #4]
	adds r0, r5, #0
	movs r2, #0
	bl DrawTextInline
	adds r0, r7, #0
	subs r0, #0xb6
	movs r1, #3
	movs r2, #0x24
	movs r3, #0x25
	bl sub_8004D5C
	adds r0, r7, #0
	subs r0, #0xae
	movs r1, #3
	movs r2, #0x1d
	bl sub_8004B0C
	adds r0, r7, #0
	subs r0, #0xb0
	movs r2, #8
	ldrsb r2, [r6, r2]
	movs r1, #2
	bl DrawDecNumber
	adds r0, r7, #0
	subs r0, #0xaa
	ldrb r2, [r6, #9]
	movs r1, #2
	bl DrawDecNumber
	movs r0, #7
	bl BG_EnableSyncByMask
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080995B8: .4byte gUnknown_02013510
_080995BC: .4byte gUnknown_02022EEC
_080995C0: .4byte gUnknown_08A1B8B8
_080995C4: .4byte gUnknown_02020188
_080995C8: .4byte gBG1TilemapBuffer
_080995CC: .4byte 0xFFFFFEC0
_080995D0: .4byte 0xFFFFFECC

	THUMB_FUNC_END sub_80994C4

	THUMB_FUNC_START sub_80995D4
sub_80995D4: @ 0x080995D4
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r0, _0809963C  @ gUnknown_02022F06
	movs r1, #0xc
	movs r2, #0x14
	movs r3, #0
	bl TileMap_FillRect
	movs r0, #0xc0
	lsls r0, r0, #7
	movs r1, #5
	bl sub_8098C3C
	movs r0, #0x80
	lsls r0, r0, #4
	movs r1, #0xa
	bl sub_8098C8C
	adds r0, r6, #0
	bl sub_80994C4
	adds r0, r6, #0
	adds r0, #0x2b
	ldrb r5, [r0]
	adds r0, r5, #0
	movs r1, #3
	bl __umodsi3
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x12
	adds r4, #0x14
	adds r0, r5, #0
	movs r1, #3
	bl __udivsi3
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x14
	ldrh r0, [r6, #0x34]
	subs r0, #4
	subs r1, r1, r0
	adds r0, r4, #0
	bl sub_809A21C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08099640
	bl sub_80ACAC8
	b _08099644
	.align 2, 0
_0809963C: .4byte gUnknown_02022F06
_08099640:
	bl sub_80ACAE4
_08099644:
	bl sub_8098BE8
	movs r0, #1
	bl BG_EnableSyncByMask
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80995D4

	THUMB_FUNC_START sub_8099654
sub_8099654: @ 0x08099654
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r5, _080996A8  @ gUnknown_02022F0E
	adds r0, #0x2b
	ldrb r0, [r0]
	bl sub_8095354
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_8099328
	ldr r0, _080996AC  @ sub_8098BC8
	adds r1, r4, #0
	bl Get6CDifferedLoop6C
	movs r0, #0x78
	movs r1, #0x8c
	movs r2, #9
	adds r3, r4, #0
	bl StartHelpPromptSprite
	adds r4, #0x2e
	ldrb r1, [r4]
	movs r0, #1
	ands r0, r1
	lsls r0, r0, #5
	adds r0, #0x90
	lsrs r1, r1, #1
	lsls r1, r1, #4
	adds r1, #0x54
	movs r3, #0x80
	lsls r3, r3, #3
	movs r2, #3
	bl sub_80AD51C
	movs r0, #1
	bl BG_EnableSyncByMask
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080996A8: .4byte gUnknown_02022F0E
_080996AC: .4byte sub_8098BC8

	THUMB_FUNC_END sub_8099654

	THUMB_FUNC_START sub_80996B0
sub_80996B0: @ 0x080996B0
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r0, #0x2b
	ldrb r0, [r0]
	bl sub_8095354
	adds r5, r0, #0
	adds r0, r4, #0
	movs r1, #0
	bl sub_809A504
	ldr r0, _080996E0  @ gUnknown_02013510
	ldr r1, _080996E4  @ gUnknown_02022EEC
	adds r2, r5, #0
	movs r3, #0
	bl sub_8099F7C
	movs r0, #4
	bl BG_EnableSyncByMask
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080996E0: .4byte gUnknown_02013510
_080996E4: .4byte gUnknown_02022EEC

	THUMB_FUNC_END sub_80996B0

	THUMB_FUNC_START sub_80996E8
sub_80996E8: @ 0x080996E8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	adds r6, r5, #0
	adds r6, #0x2e
	ldrb r0, [r6]
	mov r8, r0
	adds r4, r5, #0
	adds r4, #0x2d
	ldrb r0, [r4]
	cmp r0, #0xff
	beq _08099704
	b _08099930
_08099704:
	ldr r0, _08099734  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08099754
	mov r1, r8
	strb r1, [r4]
	ldr r0, _08099738  @ gUnknown_03005280
	ldrb r1, [r0]
	movs r2, #1
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	beq _0809973C
	ldrb r1, [r6]
	adds r0, r2, #0
	ands r0, r1
	lsls r0, r0, #5
	adds r0, #0x88
	b _08099A4C
	.align 2, 0
_08099734: .4byte gKeyStatusPtr
_08099738: .4byte gUnknown_03005280
_0809973C:
	ldrb r1, [r6]
	adds r0, r2, #0
	ands r0, r1
	lsls r0, r0, #5
	adds r0, #0x88
	lsrs r1, r1, #1
	lsls r1, r1, #4
	adds r1, #0x54
	ldr r3, _08099750  @ gUnknown_08A188F8
	b _08099A54
	.align 2, 0
_08099750: .4byte gUnknown_08A188F8
_08099754:
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _0809975E
	b _080998F0
_0809975E:
	mov r0, r8
	cmp r0, #5
	bls _08099766
	b _080998D4
_08099766:
	lsls r0, r0, #2
	ldr r1, _08099770  @ _08099774
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08099770: .4byte _08099774
_08099774: @ jump table
	.4byte _0809978C @ case 0
	.4byte _0809979C @ case 1
	.4byte _080997AC @ case 2
	.4byte _080997C8 @ case 3
	.4byte _08099854 @ case 4
	.4byte _08099868 @ case 5
_0809978C:
	bl sub_8095374
	cmp r0, #1
	bgt _08099796
	b _080998D4
_08099796:
	adds r0, r5, #0
	movs r1, #4
	b _080998B4
_0809979C:
	bl sub_8095374
	cmp r0, #1
	bgt _080997A6
	b _080998D4
_080997A6:
	adds r0, r5, #0
	movs r1, #8
	b _080998B4
_080997AC:
	adds r0, r5, #0
	adds r0, #0x2b
	ldrb r0, [r0]
	bl sub_8095354
	bl CanUnitPrepScreenUse
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080997C2
	b _080998D4
_080997C2:
	adds r0, r5, #0
	movs r1, #9
	b _080998B4
_080997C8:
	bl CheckSomethingSomewhere
	cmp r0, #0
	beq _080997F8
	adds r0, r5, #0
	adds r0, #0x2b
	ldrb r0, [r0]
	bl sub_8095354
	ldr r0, [r0, #0xc]
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	bne _080997F8
	subs r1, #9
	ldr r2, _080997F4  @ 0x0000088B
	adds r0, r1, #0
	adds r3, r5, #0
	bl sub_8097DA8
	b _08099A90
	.align 2, 0
_080997F4: .4byte 0x0000088B
_080997F8:
	adds r0, r5, #0
	adds r0, #0x2c
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _080998D4
	adds r6, r5, #0
	adds r6, #0x2b
	ldrb r0, [r6]
	bl sub_8095354
	bl sub_809A538
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080998D4
	ldr r4, _0809984C  @ gUnknown_02022F0E
	ldrb r0, [r6]
	bl sub_8095354
	adds r2, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_8099328
	ldr r5, _08099850  @ gUnknown_02013510
	subs r4, #0x22
	ldrb r0, [r6]
	bl sub_8095354
	adds r2, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	movs r3, #0
	bl sub_8099F7C
	movs r0, #1
	bl BG_EnableSyncByMask
	b _080998B8
	.align 2, 0
_0809984C: .4byte gUnknown_02022F0E
_08099850: .4byte gUnknown_02013510
_08099854:
	adds r0, r5, #0
	adds r0, #0x2c
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _080998D4
	adds r0, r5, #0
	movs r1, #0xa
	b _080998B4
_08099868:
	ldr r0, _080998A4  @ gUnknown_03005280
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080998A8
	adds r0, r5, #0
	adds r0, #0x2c
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _080998D4
	adds r0, r5, #0
	adds r0, #0x2b
	ldrb r0, [r0]
	bl sub_8095354
	bl GetUnitItemCount
	cmp r0, #0
	ble _080998D4
	bl CheckSomethingSomewhere
	cmp r0, #0
	bne _080998D4
	adds r0, r5, #0
	movs r1, #0xb
	b _080998B4
	.align 2, 0
_080998A4: .4byte gUnknown_03005280
_080998A8:
	bl CheckSomethingSomewhere
	cmp r0, #0
	bne _080998D4
	adds r0, r5, #0
	movs r1, #0xc
_080998B4:
	bl Proc_Goto
_080998B8:
	ldr r0, _080998D0  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	bge _080998C6
	b _08099A90
_080998C6:
	movs r0, #0x6a
	bl m4aSongNumStart
	b _08099A90
	.align 2, 0
_080998D0: .4byte gRAMChapterData
_080998D4:
	ldr r0, _080998EC  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	bge _080998E2
	b _08099A90
_080998E2:
	movs r0, #0x6c
	bl m4aSongNumStart
	b _08099A90
	.align 2, 0
_080998EC: .4byte gRAMChapterData
_080998F0:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08099948
	adds r2, r5, #0
	adds r2, #0x2b
	ldrb r0, [r2]
	adds r1, r5, #0
	adds r1, #0x2a
	strb r0, [r1]
	movs r0, #0xff
	strb r0, [r2]
	movs r0, #0
	bl sub_80ACA84
	ldr r0, _0809992C  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08099920
	movs r0, #0x6b
	bl m4aSongNumStart
_08099920:
	adds r0, r5, #0
	movs r1, #0
	bl Proc_Goto
	b _08099A90
	.align 2, 0
_0809992C: .4byte gRAMChapterData
_08099930:
	ldr r0, _0809996C  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0x81
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08099948
	bl CloseHelpBox
	movs r0, #0xff
	strb r0, [r4]
_08099948:
	ldr r2, _0809996C  @ gKeyStatusPtr
	ldr r6, [r2]
	ldrh r1, [r6, #6]
	movs r7, #0x20
	adds r0, r7, #0
	ands r0, r1
	adds r4, r5, #0
	adds r4, #0x2e
	cmp r0, #0
	beq _0809997E
	ldrb r3, [r4]
	movs r0, #1
	ands r0, r3
	cmp r0, #0
	beq _08099970
	subs r0, r3, #1
	b _0809997C
	.align 2, 0
_0809996C: .4byte gKeyStatusPtr
_08099970:
	ldrh r1, [r6, #8]
	adds r0, r7, #0
	ands r0, r1
	cmp r0, #0
	beq _0809997E
	adds r0, r3, #1
_0809997C:
	strb r0, [r4]
_0809997E:
	ldr r6, [r2]
	ldrh r1, [r6, #6]
	movs r7, #0x10
	adds r0, r7, #0
	ands r0, r1
	cmp r0, #0
	beq _080999A8
	ldrb r3, [r4]
	movs r0, #1
	ands r0, r3
	cmp r0, #0
	bne _0809999A
	adds r0, r3, #1
	b _080999A6
_0809999A:
	ldrh r1, [r6, #8]
	adds r0, r7, #0
	ands r0, r1
	cmp r0, #0
	beq _080999A8
	subs r0, r3, #1
_080999A6:
	strb r0, [r4]
_080999A8:
	ldr r6, [r2]
	ldrh r1, [r6, #6]
	movs r7, #0x40
	adds r0, r7, #0
	ands r0, r1
	cmp r0, #0
	beq _080999CE
	ldrb r3, [r4]
	cmp r3, #1
	bls _080999C0
	subs r0, r3, #2
	b _080999CC
_080999C0:
	ldrh r1, [r6, #8]
	adds r0, r7, #0
	ands r0, r1
	cmp r0, #0
	beq _080999CE
	adds r0, r3, #4
_080999CC:
	strb r0, [r4]
_080999CE:
	ldr r2, [r2]
	ldrh r1, [r2, #6]
	movs r6, #0x80
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	beq _080999F4
	ldrb r3, [r4]
	cmp r3, #3
	bhi _080999E6
	adds r0, r3, #2
	b _080999F2
_080999E6:
	ldrh r1, [r2, #8]
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	beq _080999F4
	subs r0, r3, #4
_080999F2:
	strb r0, [r4]
_080999F4:
	adds r6, r4, #0
	ldrb r1, [r6]
	cmp r8, r1
	beq _08099A90
	ldr r0, _08099A64  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08099A0E
	movs r0, #0x65
	bl m4aSongNumStart
_08099A0E:
	ldrb r1, [r6]
	movs r7, #1
	adds r0, r7, #0
	ands r0, r1
	lsls r0, r0, #5
	adds r0, #0x90
	lsrs r1, r1, #1
	lsls r1, r1, #4
	adds r1, #0x54
	movs r3, #0x80
	lsls r3, r3, #3
	movs r2, #3
	bl sub_80AD51C
	adds r0, r5, #0
	adds r0, #0x2d
	ldrb r0, [r0]
	cmp r0, #0xff
	beq _08099A90
	ldr r0, _08099A68  @ gUnknown_03005280
	ldrb r1, [r0]
	adds r0, r7, #0
	ands r0, r1
	cmp r0, #0
	beq _08099A70
	ldrb r1, [r6]
	adds r0, r7, #0
	ands r0, r1
	movs r2, #0x26
	muls r0, r2, r0
	adds r0, #0x90
_08099A4C:
	lsrs r1, r1, #1
	lsls r1, r1, #4
	adds r1, #0x54
	ldr r3, _08099A6C  @ gUnknown_08A18910
_08099A54:
	ldrb r2, [r6]
	lsls r2, r2, #2
	adds r2, r2, r3
	ldr r2, [r2]
	bl StartHelpBox
	b _08099A90
	.align 2, 0
_08099A64: .4byte gRAMChapterData
_08099A68: .4byte gUnknown_03005280
_08099A6C: .4byte gUnknown_08A18910
_08099A70:
	ldrb r1, [r4]
	adds r0, r7, #0
	ands r0, r1
	movs r2, #0x26
	muls r0, r2, r0
	adds r0, #0x90
	lsrs r1, r1, #1
	lsls r1, r1, #4
	adds r1, #0x54
	ldr r3, _08099A9C  @ gUnknown_08A188F8
	ldrb r2, [r4]
	lsls r2, r2, #2
	adds r2, r2, r3
	ldr r2, [r2]
	bl StartHelpBox
_08099A90:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08099A9C: .4byte gUnknown_08A188F8

	THUMB_FUNC_END sub_80996E8

	THUMB_FUNC_START sub_8099AA0
sub_8099AA0: @ 0x08099AA0
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	movs r0, #0
	bl BG_GetMapBuffer
	movs r1, #0
	bl BG_Fill
	ldr r4, _08099AF0  @ gUnknown_02013510
	ldr r5, _08099AF4  @ gUnknown_02022EEC
	adds r0, r6, #0
	adds r0, #0x2b
	ldrb r0, [r0]
	bl sub_8095354
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	movs r3, #0
	bl sub_8099F7C
	adds r4, #0x28
	adds r5, #0x1e
	adds r6, #0x2a
	ldrb r0, [r6]
	bl sub_8095354
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	movs r3, #0
	bl sub_8099F7C
	movs r0, #1
	bl BG_EnableSyncByMask
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08099AF0: .4byte gUnknown_02013510
_08099AF4: .4byte gUnknown_02022EEC

	THUMB_FUNC_END sub_8099AA0

	THUMB_FUNC_START sub_8099AF8
sub_8099AF8: @ 0x08099AF8
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #4
	mov r8, r0
	movs r0, #1
	movs r1, #0
	movs r2, #4
	bl BG_SetPosition
	movs r0, #1
	bl BG_GetMapBuffer
	movs r1, #0
	bl BG_Fill
	movs r0, #2
	bl BG_GetMapBuffer
	movs r1, #0
	bl BG_Fill
	ldr r0, _08099C3C  @ gBG0TilemapBuffer
	movs r1, #0x1f
	movs r2, #8
	movs r3, #0
	bl TileMap_FillRect
	movs r0, #0xc0
	lsls r0, r0, #7
	movs r1, #5
	bl sub_8098C3C
	ldr r0, _08099C40  @ gUnknown_08A1B8B8
	ldr r5, _08099C44  @ gUnknown_02020188
	adds r1, r5, #0
	bl CopyDataWithPossibleUncomp
	ldr r4, _08099C48  @ gBG1TilemapBuffer
	movs r6, #0x80
	lsls r6, r6, #5
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r6, #0
	bl CallARM_FillTileRect
	ldr r0, _08099C4C  @ gUnknown_08A1B990
	adds r1, r5, #0
	bl CopyDataWithPossibleUncomp
	ldr r0, _08099C50  @ 0x0000025E
	adds r4, r4, r0
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r6, #0
	bl CallARM_FillTileRect
	mov r1, r8
	adds r1, #0x32
	movs r0, #0
	strb r0, [r1]
	mov r6, r8
	adds r6, #0x2a
	ldrb r5, [r6]
	adds r0, r5, #0
	movs r1, #3
	bl __umodsi3
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x12
	adds r4, #0x18
	adds r0, r5, #0
	movs r1, #3
	bl __udivsi3
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x14
	mov r2, r8
	ldrh r0, [r2, #0x34]
	subs r0, #4
	subs r1, r1, r0
	movs r3, #0x80
	lsls r3, r3, #4
	adds r0, r4, #0
	movs r2, #7
	bl sub_80AD51C
	mov r0, r8
	movs r1, #0
	bl sub_809A504
	movs r0, #7
	bl BG_EnableSyncByMask
	mov r4, r8
	adds r4, #0x2b
	ldrb r0, [r4]
	bl sub_8095354
	adds r1, r0, #0
	ldr r0, _08099C54  @ 0x00000503
	str r0, [sp]
	movs r0, #0
	movs r2, #0x3c
	movs r3, #0x4c
	bl sub_8099E98
	ldrb r0, [r6]
	bl sub_8095354
	adds r1, r0, #0
	ldr r0, _08099C58  @ 0x00000502
	str r0, [sp]
	movs r0, #1
	movs r2, #0xb4
	movs r3, #0x4c
	bl sub_8099E98
	ldrb r5, [r4]
	adds r0, r5, #0
	movs r1, #3
	bl __umodsi3
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x12
	adds r4, #0x18
	adds r0, r5, #0
	movs r1, #3
	bl __udivsi3
	adds r2, r0, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x14
	mov r1, r8
	ldrh r0, [r1, #0x34]
	subs r0, #4
	subs r2, r2, r0
	movs r0, #0
	adds r1, r4, #0
	movs r3, #2
	bl sub_80AC9D4
	ldr r0, _08099C5C  @ sub_8099AA0
	movs r1, #1
	mov r2, r8
	bl sub_80ACE20
	bl sub_80ACAE4
	bl sub_8098590
	bl EndHelpPromptSprite
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08099C3C: .4byte gBG0TilemapBuffer
_08099C40: .4byte gUnknown_08A1B8B8
_08099C44: .4byte gUnknown_02020188
_08099C48: .4byte gBG1TilemapBuffer
_08099C4C: .4byte gUnknown_08A1B990
_08099C50: .4byte 0x0000025E
_08099C54: .4byte 0x00000503
_08099C58: .4byte 0x00000502
_08099C5C: .4byte sub_8099AA0

	THUMB_FUNC_END sub_8099AF8

	THUMB_FUNC_START sub_8099C60
sub_8099C60: @ 0x08099C60
	push {lr}
	bl sub_8098BE8
	movs r0, #1
	bl BG_EnableSyncByMask
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8099C60

	THUMB_FUNC_START sub_8099C70
sub_8099C70: @ 0x08099C70
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r6, r0, #0
	ldrh r0, [r6, #0x34]
	movs r1, #0xf
	ands r0, r1
	cmp r0, #0
	beq _08099C82
	b _08099D9C
_08099C82:
	ldr r0, _08099C9C  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08099CA0
	adds r0, r6, #0
	bl Proc_Break
	b _08099DA2
	.align 2, 0
_08099C9C: .4byte gKeyStatusPtr
_08099CA0:
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08099D10
	adds r5, r6, #0
	adds r5, #0x2a
	ldrb r0, [r5]
	bl sub_8095354
	bl GetUnitItemCount
	adds r7, r0, #0
	adds r4, r6, #0
	adds r4, #0x2b
	ldrb r0, [r4]
	bl sub_8095354
	bl GetUnitItemCount
	adds r1, r0, #0
	ldrb r0, [r5]
	ldrb r4, [r4]
	cmp r0, r4
	beq _08099CF8
	cmp r7, #0
	bgt _08099CD8
	cmp r1, #0
	ble _08099CF8
_08099CD8:
	adds r0, r6, #0
	movs r1, #6
	bl Proc_Goto
	ldr r0, _08099CF4  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08099DA2
	movs r0, #0x6a
	bl m4aSongNumStart
	b _08099DA2
	.align 2, 0
_08099CF4: .4byte gRAMChapterData
_08099CF8:
	ldr r0, _08099D0C  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08099DA2
	movs r0, #0x6c
	bl m4aSongNumStart
	b _08099DA2
	.align 2, 0
_08099D0C: .4byte gRAMChapterData
_08099D10:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08099D40
	movs r0, #1
	bl sub_8099F50
	adds r0, r6, #0
	movs r1, #2
	bl Proc_Goto
	ldr r0, _08099D3C  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08099DA2
	movs r0, #0x6b
	bl m4aSongNumStart
	b _08099DA2
	.align 2, 0
_08099D3C: .4byte gRAMChapterData
_08099D40:
	adds r0, r6, #0
	bl sub_8098E40
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08099D9C
	adds r7, r6, #0
	adds r7, #0x2a
	ldrb r0, [r7]
	bl sub_8095354
	adds r1, r0, #0
	ldr r0, _08099DAC  @ 0x00000502
	str r0, [sp]
	movs r0, #1
	movs r2, #0xb4
	movs r3, #0x4c
	bl sub_8099E98
	ldr r4, _08099DB0  @ gUnknown_02013538
	ldr r5, _08099DB4  @ gUnknown_02022F0A
	ldrb r0, [r7]
	bl sub_8095354
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	movs r3, #2
	bl sub_8099F7C
	subs r4, #0x28
	subs r5, #0x1e
	adds r0, r6, #0
	adds r0, #0x2b
	ldrb r0, [r0]
	bl sub_8095354
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	movs r3, #1
	bl sub_8099F7C
	movs r0, #1
	bl BG_EnableSyncByMask
_08099D9C:
	adds r0, r6, #0
	bl sub_8098FAC
_08099DA2:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08099DAC: .4byte 0x00000502
_08099DB0: .4byte gUnknown_02013538
_08099DB4: .4byte gUnknown_02022F0A

	THUMB_FUNC_END sub_8099C70

	THUMB_FUNC_START sub_8099DB8
sub_8099DB8: @ 0x08099DB8
	push {r4, r5, lr}
	adds r4, r0, #0
	bl sub_80989BC
	adds r0, r4, #0
	adds r0, #0x2b
	ldrb r0, [r0]
	bl sub_8095354
	adds r5, r0, #0
	adds r0, r4, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	bl sub_8095354
	adds r1, r0, #0
	adds r0, r5, #0
	adds r2, r4, #0
	bl sub_809BE3C
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8099DB8

	THUMB_FUNC_START sub_8099DE8
sub_8099DE8: @ 0x08099DE8
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2b
	ldrb r0, [r0]
	bl sub_8095354
	adds r1, r4, #0
	bl sub_809CCFC
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8099DE8

	THUMB_FUNC_START sub_8099E00
sub_8099E00: @ 0x08099E00
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2b
	ldrb r0, [r0]
	bl sub_8095354
	adds r1, r4, #0
	bl sub_809EAD8
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8099E00

	THUMB_FUNC_START sub_8099E18
sub_8099E18: @ 0x08099E18
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2b
	ldrb r0, [r0]
	bl sub_8095354
	adds r1, r4, #0
	bl sub_80A070C
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8099E18

	THUMB_FUNC_START sub_8099E30
sub_8099E30: @ 0x08099E30
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2b
	ldrb r0, [r0]
	bl sub_8095354
	adds r1, r4, #0
	bl sub_809FD88
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8099E30

	THUMB_FUNC_START sub_8099E48
sub_8099E48: @ 0x08099E48
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2b
	ldrb r0, [r0]
	bl sub_8095354
	ldr r1, _08099E64  @ gUnknown_08A188E4
	adds r2, r4, #0
	bl MakeShopArmory
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08099E64: .4byte gUnknown_08A188E4

	THUMB_FUNC_END sub_8099E48

	THUMB_FUNC_START sub_8099E68
sub_8099E68: @ 0x08099E68
	push {lr}
	adds r2, r0, #0
	ldr r0, _08099E94  @ gUnknown_03005280
	ldrb r1, [r0]
	movs r3, #1
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	beq _08099E8E
	adds r0, r2, #0
	adds r0, #0x29
	ldrb r1, [r0]
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	beq _08099E8E
	movs r0, #0
	bl sub_80C409C
_08099E8E:
	pop {r0}
	bx r0
	.align 2, 0
_08099E94: .4byte gUnknown_03005280

	THUMB_FUNC_END sub_8099E68

	THUMB_FUNC_START sub_8099E98
sub_8099E98: @ 0x08099E98
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r4, r0, #0
	adds r6, r1, #0
	ldr r0, [sp, #0x20]
	lsls r2, r2, #0x10
	lsrs r7, r2, #0x10
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	mov r8, r3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r9, r0
	ldr r0, _08099EF8  @ gUnknown_08A189A4
	bl Proc_Find
	adds r5, r0, #0
	lsls r1, r4, #2
	adds r0, #0x44
	adds r0, r0, r1
	ldr r0, [r0]
	cmp r0, r6
	beq _08099EFC
	cmp r0, #0
	beq _08099ED6
	adds r0, r4, #0
	bl DeleteFaceByIndex
_08099ED6:
	cmp r6, #0
	beq _08099F18
	adds r0, r6, #0
	bl GetUnitPortraitId
	adds r1, r0, #0
	lsls r2, r7, #0x10
	asrs r2, r2, #0x10
	mov r0, r8
	lsls r3, r0, #0x10
	asrs r3, r3, #0x10
	mov r0, r9
	str r0, [sp]
	adds r0, r4, #0
	bl sub_80064F4
	b _08099F18
	.align 2, 0
_08099EF8: .4byte gUnknown_08A189A4
_08099EFC:
	cmp r6, #0
	beq _08099F18
	lsls r1, r7, #0x10
	asrs r1, r1, #0x10
	mov r0, r8
	lsls r2, r0, #0x10
	asrs r2, r2, #0x10
	adds r0, r4, #0
	bl sub_8006618
	adds r0, r4, #0
	mov r1, r9
	bl sub_800578C
_08099F18:
	lsls r1, r4, #2
	adds r0, r5, #0
	adds r0, #0x44
	adds r0, r0, r1
	str r6, [r0]
	lsls r1, r4, #1
	adds r0, r5, #0
	adds r0, #0x38
	adds r0, r0, r1
	strh r7, [r0]
	adds r0, r5, #0
	adds r0, #0x3c
	adds r0, r0, r1
	mov r2, r8
	strh r2, [r0]
	adds r0, r5, #0
	adds r0, #0x40
	adds r0, r0, r1
	mov r1, r9
	strh r1, [r0]
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8099E98

	THUMB_FUNC_START sub_8099F50
sub_8099F50: @ 0x08099F50
	push {lr}
	sub sp, #4
	movs r1, #0
	str r1, [sp]
	movs r2, #0
	movs r3, #0
	bl sub_8099E98
	add sp, #4
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8099F50

	THUMB_FUNC_START sub_8099F68
sub_8099F68: @ 0x08099F68
	push {lr}
	adds r1, r0, #0
	ldr r0, _08099F78  @ gUnknown_08A189A4
	bl Proc_StartBlocking
	pop {r1}
	bx r1
	.align 2, 0
_08099F78: .4byte gUnknown_08A189A4

	THUMB_FUNC_END sub_8099F68

	THUMB_FUNC_START sub_8099F7C
sub_8099F7C: @ 0x08099F7C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	adds r6, r0, #0
	adds r4, r1, #0
	mov r8, r2
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	str r3, [sp]
	adds r0, r4, #0
	movs r1, #0xc
	movs r2, #0x14
	movs r3, #0
	bl TileMap_FillRect
	movs r0, #2
	ldr r1, [sp]
	ands r0, r1
	cmp r0, #0
	beq _08099FAE
	bl ResetIconGraphics
_08099FAE:
	mov r0, r8
	cmp r0, #0
	beq _0809A07C
	bl GetUnitItemCount
	str r0, [sp, #4]
	movs r1, #0
	mov r9, r1
	cmp r9, r0
	bge _0809A07C
	adds r0, r4, #0
	adds r0, #0x16
	str r0, [sp, #8]
	adds r1, r4, #4
	str r1, [sp, #0xc]
	mov sl, r4
_08099FCE:
	mov r1, r9
	lsls r0, r1, #1
	mov r1, r8
	adds r1, #0x1e
	adds r1, r1, r0
	ldrh r5, [r1]
	movs r0, #4
	ldr r1, [sp]
	ands r0, r1
	cmp r0, #0
	beq _08099FEE
	mov r0, r8
	adds r1, r5, #0
	bl CanUnitUseItemPrepScreen
	b _08099FF6
_08099FEE:
	mov r0, r8
	adds r1, r5, #0
	bl IsItemDisplayUsable
_08099FF6:
	movs r7, #0
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0809A000
	movs r7, #1
_0809A000:
	movs r0, #1
	ldr r1, [sp]
	ands r0, r1
	cmp r0, #0
	bne _0809A02E
	adds r0, r6, #0
	bl Text_Clear
	adds r0, r6, #0
	adds r1, r7, #0
	bl Text_SetColorId
	adds r0, r6, #0
	movs r1, #0
	bl Text_SetXCursor
	adds r0, r5, #0
	bl GetItemName
	adds r1, r0, #0
	adds r0, r6, #0
	bl Text_AppendString
_0809A02E:
	adds r0, r5, #0
	bl GetItemIconId
	adds r1, r0, #0
	mov r0, sl
	movs r2, #0x80
	lsls r2, r2, #7
	bl DrawIcon
	adds r0, r6, #0
	ldr r1, [sp, #0xc]
	bl Text_Draw
	movs r4, #1
	cmp r7, #0
	bne _0809A050
	movs r4, #2
_0809A050:
	adds r0, r5, #0
	bl GetItemUses
	adds r2, r0, #0
	ldr r0, [sp, #8]
	adds r1, r4, #0
	bl DrawDecNumber
	adds r6, #8
	ldr r0, [sp, #8]
	adds r0, #0x80
	str r0, [sp, #8]
	ldr r1, [sp, #0xc]
	adds r1, #0x80
	str r1, [sp, #0xc]
	movs r0, #0x80
	add sl, r0
	movs r1, #1
	add r9, r1
	ldr r0, [sp, #4]
	cmp r9, r0
	blt _08099FCE
_0809A07C:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8099F7C

	THUMB_FUNC_START sub_809A08C
sub_809A08C: @ 0x0809A08C
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	movs r1, #3
	bl __udivsi3
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x14
	adds r6, r4, #0
	bl sub_8095374
	subs r0, #1
	movs r1, #3
	bl __divsi3
	lsls r1, r0, #4
	ldrh r0, [r5, #0x34]
	subs r0, r4, r0
	cmp r0, #0x20
	ble _0809A0C6
	cmp r4, r1
	bne _0809A0C0
	adds r0, r4, #0
	subs r0, #0x30
	b _0809A0D6
_0809A0C0:
	adds r0, r4, #0
	subs r0, #0x20
	b _0809A0D6
_0809A0C6:
	cmp r0, #0xf
	bgt _0809A0D8
	cmp r4, #0
	bne _0809A0D2
	strh r4, [r5, #0x34]
	b _0809A0D8
_0809A0D2:
	adds r0, r6, #0
	subs r0, #0x10
_0809A0D6:
	strh r0, [r5, #0x34]
_0809A0D8:
	ldr r1, _0809A110  @ 0x0000FFD8
	ldrh r2, [r5, #0x34]
	subs r2, #4
	movs r0, #0xff
	ands r2, r0
	movs r0, #2
	bl BG_SetPosition
	ldrh r4, [r5, #0x34]
	bl sub_8095374
	subs r0, #1
	movs r1, #3
	bl __divsi3
	adds r2, r0, #0
	adds r2, #1
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #6
	adds r1, r4, #0
	movs r3, #4
	bl sub_80976CC
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0809A110: .4byte 0x0000FFD8

	THUMB_FUNC_END sub_809A08C

	THUMB_FUNC_START sub_809A114
sub_809A114: @ 0x0809A114
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov sl, r1
	lsls r2, r2, #0x18
	lsrs r5, r2, #0x18
	lsls r0, r1, #1
	add r0, sl
	str r0, [sp]
	movs r1, #0xf
	bl __modsi3
	lsls r0, r0, #3
	ldr r1, _0809A1C0  @ gUnknown_02013498
	adds r4, r0, r1
	ldr r0, _0809A1C4  @ gUnknown_03005280
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0809A154
	bl sub_80C4070
	movs r1, #1
	str r1, [sp, #4]
	cmp r0, #2
	beq _0809A158
_0809A154:
	movs r0, #0
	str r0, [sp, #4]
_0809A158:
	movs r7, #0
	lsls r0, r5, #0x18
	asrs r0, r0, #0x18
	mov r9, r0
_0809A160:
	mov r1, r9
	cmp r1, #0
	bne _0809A16C
	adds r0, r4, #0
	bl Text_Clear
_0809A16C:
	ldr r0, [sp]
	adds r5, r0, r7
	bl sub_8095374
	cmp r5, r0
	bge _0809A1FA
	adds r0, r7, #0
	movs r1, #3
	bl __modsi3
	lsls r0, r0, #3
	mov r8, r0
	mov r1, sl
	lsls r6, r1, #1
	movs r0, #0x1f
	ands r6, r0
	mov r0, r9
	cmp r0, #0
	bne _0809A1EA
	adds r0, r5, #0
	bl sub_8095354
	adds r5, r0, #0
	adds r0, r4, #0
	movs r1, #0
	bl Text_SetXCursor
	ldr r1, [sp, #4]
	cmp r1, #0
	beq _0809A1D2
	adds r0, r5, #0
	movs r1, #0x72
	bl UnitHasItem
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809A1C8
	adds r0, r4, #0
	movs r1, #0
	bl Text_SetColorId
	b _0809A1DA
	.align 2, 0
_0809A1C0: .4byte gUnknown_02013498
_0809A1C4: .4byte gUnknown_03005280
_0809A1C8:
	adds r0, r4, #0
	movs r1, #1
	bl Text_SetColorId
	b _0809A1DA
_0809A1D2:
	adds r0, r4, #0
	movs r1, #0
	bl Text_SetColorId
_0809A1DA:
	ldr r0, [r5]
	ldrh r0, [r0]
	bl GetStringFromIndex
	adds r1, r0, #0
	adds r0, r4, #0
	bl Text_AppendString
_0809A1EA:
	lsls r1, r6, #5
	add r1, r8
	lsls r1, r1, #1
	ldr r0, _0809A218  @ gBG2TilemapBuffer
	adds r1, r1, r0
	adds r0, r4, #0
	bl Text_Draw
_0809A1FA:
	adds r4, #8
	adds r7, #1
	cmp r7, #2
	ble _0809A160
	movs r0, #4
	bl BG_EnableSyncByMask
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809A218: .4byte gBG2TilemapBuffer

	THUMB_FUNC_END sub_809A114

	THUMB_FUNC_START sub_809A21C
sub_809A21C: @ 0x0809A21C
	push {lr}
	cmp r0, #0x60
	bhi _0809A22A
	cmp r1, #0x1f
	ble _0809A22A
	movs r0, #1
	b _0809A22C
_0809A22A:
	movs r0, #0
_0809A22C:
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_809A21C

	THUMB_FUNC_START sub_809A230
sub_809A230: @ 0x0809A230
	push {r4, r5, r6, lr}
	sub sp, #4
	lsls r1, r1, #0x10
	lsrs r6, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r5, r2, #0x10
	ldr r1, [r0, #4]
	ldrb r4, [r1, #4]
	movs r1, #0x72
	bl UnitHasItem
	lsls r0, r0, #0x18
	movs r1, #0xf0
	lsls r1, r1, #8
	cmp r0, #0
	beq _0809A254
	movs r1, #0xc0
	lsls r1, r1, #8
_0809A254:
	movs r0, #0x80
	lsls r0, r0, #4
	adds r3, r0, #0
	adds r3, r1, r3
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	str r4, [sp]
	movs r0, #0
	adds r1, r6, #0
	adds r2, r5, #0
	bl sub_8027C48
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_809A230

	THUMB_FUNC_START sub_809A274
sub_809A274: @ 0x0809A274
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	movs r6, #0
	b _0809A308
_0809A27C:
	adds r0, r6, #0
	movs r1, #3
	bl __modsi3
	lsls r5, r0, #6
	adds r0, r6, #0
	movs r1, #3
	bl __divsi3
	lsls r0, r0, #4
	ldrh r1, [r7, #0x34]
	subs r4, r0, r1
	adds r0, r4, #0
	adds r0, #0x14
	cmp r0, #0x44
	bhi _0809A306
	adds r0, r7, #0
	adds r0, #0x32
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0809A2B8
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_809A21C
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0809A306
_0809A2B8:
	ldr r0, _0809A2E8  @ gUnknown_03005280
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0809A2EC
	bl sub_80C4070
	cmp r0, #2
	bne _0809A2EC
	adds r0, r6, #0
	bl sub_8095354
	adds r1, r5, #0
	adds r1, #0x18
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	adds r2, r4, #4
	movs r3, #0xff
	ands r2, r3
	bl sub_809A230
	b _0809A306
	.align 2, 0
_0809A2E8: .4byte gUnknown_03005280
_0809A2EC:
	adds r5, #0x18
	adds r4, #4
	movs r0, #0xff
	ands r4, r0
	adds r0, r6, #0
	bl sub_8095354
	adds r3, r0, #0
	movs r0, #0
	adds r1, r5, #0
	adds r2, r4, #0
	bl sub_8027B60
_0809A306:
	adds r6, #1
_0809A308:
	bl sub_8095374
	cmp r6, r0
	blt _0809A27C
	bl SMS_FlushDirect
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_809A274

	THUMB_FUNC_START sub_809A31C
sub_809A31C: @ 0x0809A31C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x18
	str r0, [sp, #4]
	mov sl, r1
	str r2, [sp, #8]
	str r3, [sp, #0xc]
	ldr r7, [sp, #0x38]
	cmp r2, #0
	bgt _0809A338
	b _0809A4E6
_0809A338:
	cmp r3, #0
	bgt _0809A33E
	b _0809A4E6
_0809A33E:
	ldr r4, _0809A4F8  @ gObject_8x8
	str r7, [sp]
	movs r0, #4
	ldr r1, [sp, #4]
	mov r2, sl
	adds r3, r4, #0
	bl PutSpriteExt
	ldr r0, [sp, #8]
	lsls r0, r0, #3
	mov r9, r0
	ldr r6, [sp, #4]
	add r6, r9
	adds r0, r7, #3
	str r0, [sp]
	movs r0, #4
	adds r1, r6, #0
	mov r2, sl
	adds r3, r4, #0
	bl PutSpriteExt
	ldr r1, [sp, #0xc]
	lsls r1, r1, #3
	mov r8, r1
	mov r5, sl
	add r5, r8
	adds r0, r7, #0
	adds r0, #0xd
	str r0, [sp]
	movs r0, #4
	adds r1, r6, #0
	adds r2, r5, #0
	adds r3, r4, #0
	bl PutSpriteExt
	adds r0, r7, #0
	adds r0, #0xa
	str r0, [sp]
	movs r0, #4
	ldr r1, [sp, #4]
	adds r2, r5, #0
	adds r3, r4, #0
	bl PutSpriteExt
	movs r5, #1
	ldr r3, [sp, #8]
	subs r3, #1
	str r3, [sp, #0x10]
	cmp r5, r3
	bge _0809A3D6
	ldr r6, _0809A4FC  @ gObject_16x8
	ldr r4, [sp, #4]
	adds r4, #8
_0809A3A8:
	adds r0, r7, #1
	str r0, [sp]
	movs r0, #4
	adds r1, r4, #0
	mov r2, sl
	adds r3, r6, #0
	bl PutSpriteExt
	adds r0, r7, #0
	adds r0, #0xb
	str r0, [sp]
	movs r0, #4
	adds r1, r4, #0
	mov r2, sl
	add r2, r8
	adds r3, r6, #0
	bl PutSpriteExt
	adds r4, #0x10
	adds r5, #2
	ldr r0, [sp, #0x10]
	cmp r5, r0
	blt _0809A3A8
_0809A3D6:
	ldr r1, [sp, #8]
	cmp r5, r1
	bge _0809A412
	ldr r6, _0809A4F8  @ gObject_8x8
	lsls r0, r5, #3
	ldr r3, [sp, #4]
	adds r4, r0, r3
	subs r5, r1, r5
_0809A3E6:
	adds r0, r7, #1
	str r0, [sp]
	movs r0, #4
	adds r1, r4, #0
	mov r2, sl
	adds r3, r6, #0
	bl PutSpriteExt
	adds r0, r7, #0
	adds r0, #0xb
	str r0, [sp]
	movs r0, #4
	adds r1, r4, #0
	mov r2, sl
	add r2, r8
	adds r3, r6, #0
	bl PutSpriteExt
	adds r4, #8
	subs r5, #1
	cmp r5, #0
	bne _0809A3E6
_0809A412:
	ldr r0, [sp, #0xc]
	cmp r0, #1
	ble _0809A44E
	ldr r5, _0809A4F8  @ gObject_8x8
	mov r4, sl
	adds r4, #8
	adds r6, r0, #0
	subs r6, #1
_0809A422:
	adds r0, r7, #4
	str r0, [sp]
	movs r0, #4
	ldr r1, [sp, #4]
	adds r2, r4, #0
	adds r3, r5, #0
	bl PutSpriteExt
	adds r0, r7, #0
	adds r0, #9
	str r0, [sp]
	movs r0, #4
	ldr r1, [sp, #4]
	add r1, r9
	adds r2, r4, #0
	adds r3, r5, #0
	bl PutSpriteExt
	adds r4, #8
	subs r6, #1
	cmp r6, #0
	bne _0809A422
_0809A44E:
	movs r6, #1
	ldr r1, [sp, #0xc]
	cmp r6, r1
	bge _0809A4E6
	ldr r3, [sp, #8]
	subs r3, #3
	mov r9, r3
	adds r7, #5
	mov r8, r7
_0809A460:
	movs r5, #1
	adds r0, r6, #1
	str r0, [sp, #0x14]
	cmp r5, r9
	bge _0809A48A
	ldr r4, [sp, #4]
	adds r4, #8
	lsls r7, r6, #3
_0809A470:
	mov r1, r8
	str r1, [sp]
	movs r0, #4
	adds r1, r4, #0
	mov r3, sl
	adds r2, r3, r7
	ldr r3, _0809A500  @ gObject_32x8
	bl PutSpriteExt
	adds r4, #0x20
	adds r5, #4
	cmp r5, r9
	blt _0809A470
_0809A48A:
	ldr r0, [sp, #0x10]
	cmp r5, r0
	bge _0809A4B4
	lsls r0, r5, #3
	ldr r1, [sp, #4]
	adds r4, r0, r1
	lsls r7, r6, #3
_0809A498:
	mov r3, r8
	str r3, [sp]
	movs r0, #4
	adds r1, r4, #0
	mov r3, sl
	adds r2, r3, r7
	ldr r3, _0809A4FC  @ gObject_16x8
	bl PutSpriteExt
	adds r4, #0x10
	adds r5, #2
	ldr r0, [sp, #0x10]
	cmp r5, r0
	blt _0809A498
_0809A4B4:
	ldr r1, [sp, #8]
	cmp r5, r1
	bge _0809A4DE
	lsls r0, r5, #3
	ldr r3, [sp, #4]
	adds r4, r0, r3
	lsls r6, r6, #3
	subs r5, r1, r5
_0809A4C4:
	mov r0, r8
	str r0, [sp]
	movs r0, #4
	adds r1, r4, #0
	mov r3, sl
	adds r2, r3, r6
	ldr r3, _0809A4F8  @ gObject_8x8
	bl PutSpriteExt
	adds r4, #8
	subs r5, #1
	cmp r5, #0
	bne _0809A4C4
_0809A4DE:
	ldr r6, [sp, #0x14]
	ldr r0, [sp, #0xc]
	cmp r6, r0
	blt _0809A460
_0809A4E6:
	add sp, #0x18
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809A4F8: .4byte gObject_8x8
_0809A4FC: .4byte gObject_16x8
_0809A500: .4byte gObject_32x8

	THUMB_FUNC_END sub_809A31C

	THUMB_FUNC_START sub_809A504
sub_809A504: @ 0x0809A504
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldrh r0, [r5, #0x34]
	lsrs r4, r0, #4
	adds r0, r4, #4
	cmp r4, r0
	bge _0809A530
	lsls r6, r1, #0x18
_0809A518:
	lsls r1, r4, #0x18
	lsrs r1, r1, #0x18
	adds r0, r5, #0
	asrs r2, r6, #0x18
	bl sub_809A114
	adds r4, #1
	ldrh r0, [r5, #0x34]
	lsrs r0, r0, #4
	adds r0, #4
	cmp r4, r0
	blt _0809A518
_0809A530:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_809A504

	THUMB_FUNC_START sub_809A538
sub_809A538: @ 0x0809A538
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	bl GetUnitItemCount
	adds r7, r0, #0
	bl sub_8097CC8
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	movs r4, #0
	cmp r4, r7
	bge _0809A56E
	cmp r6, #0x63
	bgt _0809A56E
_0809A554:
	ldrh r0, [r5, #0x1e]
	bl AddItemToConvoy
	adds r0, r5, #0
	movs r1, #0
	bl UnitRemoveItem
	adds r4, #1
	cmp r4, r7
	bge _0809A56E
	adds r0, r4, r6
	cmp r0, #0x63
	ble _0809A554
_0809A56E:
	cmp r4, #0
	bgt _0809A576
	movs r0, #0
	b _0809A578
_0809A576:
	movs r0, #1
_0809A578:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_809A538

	THUMB_FUNC_START sub_809A580
sub_809A580: @ 0x0809A580
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r0, r1, #0
	movs r7, #0
	lsls r1, r0, #1
	mov r8, r1
	movs r1, #7
	bl __modsi3
	mov sl, r0
	movs r2, #0
	mov r9, r2
_0809A5A0:
	mov r0, r8
	adds r4, r0, r7
	bl sub_8095374
	cmp r4, r0
	bge _0809A61A
	adds r0, r4, #0
	bl sub_8095354
	adds r5, r0, #0
	movs r6, #0
	bl CheckSomethingSomewhere
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0809A5D2
	ldr r0, [r5]
	ldrb r0, [r0, #4]
	bl IsCharacterForceDeployed
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809A5D2
	movs r6, #4
	b _0809A5DE
_0809A5D2:
	ldr r0, [r5, #0xc]
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	beq _0809A5DE
	movs r6, #1
_0809A5DE:
	mov r1, sl
	lsls r4, r1, #1
	adds r4, r4, r7
	lsls r4, r4, #3
	ldr r0, _0809A63C  @ gUnknown_02013598
	adds r4, r4, r0
	adds r0, r4, #0
	bl Text_Clear
	ldr r0, [r5]
	ldrh r0, [r0]
	bl GetStringFromIndex
	movs r1, #0x1f
	mov r2, r8
	ands r1, r2
	lsls r1, r1, #5
	adds r1, #0x10
	add r1, r9
	lsls r1, r1, #1
	ldr r2, _0809A640  @ gBG2TilemapBuffer
	adds r1, r1, r2
	movs r2, #0
	str r2, [sp]
	str r0, [sp, #4]
	adds r0, r4, #0
	adds r2, r6, #0
	movs r3, #0
	bl DrawTextInline
_0809A61A:
	movs r0, #7
	add r9, r0
	adds r7, #1
	cmp r7, #1
	ble _0809A5A0
	movs r0, #4
	bl BG_EnableSyncByMask
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809A63C: .4byte gUnknown_02013598
_0809A640: .4byte gBG2TilemapBuffer

	THUMB_FUNC_END sub_809A580

	THUMB_FUNC_START sub_809A644
sub_809A644: @ 0x0809A644
	push {lr}
	lsls r0, r0, #1
	movs r1, #0x1f
	ands r0, r1
	lsls r0, r0, #6
	ldr r1, _0809A668  @ gUnknown_02023CC8
	adds r0, r0, r1
	movs r1, #0xd
	movs r2, #1
	movs r3, #0
	bl TileMap_FillRect
	movs r0, #4
	bl BG_EnableSyncByMask
	pop {r0}
	bx r0
	.align 2, 0
_0809A668: .4byte gUnknown_02023CC8

	THUMB_FUNC_END sub_809A644

	THUMB_FUNC_START sub_809A66C
sub_809A66C: @ 0x0809A66C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	mov r8, r0
	movs r6, #0
	b _0809A6AE
_0809A67A:
	asrs r0, r6, #1
	lsls r0, r0, #4
	mov r2, r8
	ldrh r1, [r2, #0x30]
	subs r5, r0, r1
	adds r0, r5, #0
	adds r0, #0xf
	cmp r0, #0x5f
	bhi _0809A6AC
	movs r0, #1
	ands r0, r6
	lsls r4, r0, #3
	subs r4, r4, r0
	lsls r4, r4, #3
	adds r4, #0x70
	adds r5, #0x18
	adds r0, r6, #0
	bl sub_8095354
	adds r3, r0, #0
	movs r0, #0
	adds r1, r4, #0
	adds r2, r5, #0
	bl sub_8027B60
_0809A6AC:
	adds r6, #1
_0809A6AE:
	bl sub_8095374
	cmp r6, r0
	blt _0809A67A
	mov r0, r8
	ldrh r1, [r0, #0x30]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #0
	beq _0809A758
	ldr r1, _0809A754  @ gLCDControlBuffer
	mov ip, r1
	ldrb r0, [r1, #1]
	movs r1, #0x20
	orrs r0, r1
	movs r1, #0x40
	orrs r0, r1
	movs r1, #0x7f
	ands r0, r1
	mov r2, ip
	strb r0, [r2, #1]
	mov r0, ip
	adds r0, #0x2d
	movs r2, #0
	strb r2, [r0]
	adds r0, #4
	strb r2, [r0]
	subs r0, #5
	movs r3, #0xf0
	strb r3, [r0]
	mov r1, ip
	adds r1, #0x30
	movs r0, #0x1a
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x2f
	strb r2, [r0]
	adds r1, #3
	movs r0, #0x78
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x2e
	strb r3, [r0]
	subs r1, #1
	movs r0, #0xa0
	strb r0, [r1]
	mov r6, ip
	adds r6, #0x34
	ldrb r0, [r6]
	movs r5, #1
	orrs r0, r5
	movs r3, #2
	orrs r0, r3
	movs r4, #5
	negs r4, r4
	ands r0, r4
	movs r2, #8
	orrs r0, r2
	movs r1, #0x11
	negs r1, r1
	ands r0, r1
	strb r0, [r6]
	mov r1, ip
	adds r1, #0x35
	ldrb r0, [r1]
	orrs r0, r5
	orrs r0, r3
	ands r0, r4
	orrs r0, r2
	movs r6, #0x10
	orrs r0, r6
	strb r0, [r1]
	mov r4, ip
	adds r4, #0x36
	ldrb r0, [r4]
	orrs r0, r5
	orrs r0, r3
	movs r1, #4
	orrs r0, r1
	orrs r0, r2
	orrs r0, r6
	strb r0, [r4]
	b _0809A76E
	.align 2, 0
_0809A754: .4byte gLCDControlBuffer
_0809A758:
	ldr r2, _0809A7D0  @ gLCDControlBuffer
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
_0809A76E:
	mov r0, r8
	adds r0, #0x37
	ldrb r1, [r0]
	adds r7, r0, #0
	cmp r1, #0
	beq _0809A77E
	adds r0, r1, #1
	strb r0, [r7]
_0809A77E:
	movs r5, #0x87
	lsls r5, r5, #8
	movs r4, #4
	movs r6, #2
_0809A786:
	str r5, [sp]
	movs r0, #4
	adds r1, r4, #0
	movs r2, #0x81
	ldr r3, _0809A7D4  @ gObject_32x16
	bl PutSpriteExt
	adds r5, #4
	adds r4, #0x20
	subs r6, #1
	cmp r6, #0
	bge _0809A786
	ldrb r0, [r7]
	lsrs r0, r0, #2
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _0809A7EC
	mov r0, r8
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #0
	beq _0809A7EC
	bl CheckSomethingSomewhere
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809A7DC
	ldr r3, _0809A7D8  @ gUnknown_08A18E62
	movs r0, #0x40
	str r0, [sp]
	movs r0, #4
	movs r1, #0x80
	movs r2, #0x82
	bl PutSpriteExt
	b _0809A7EC
	.align 2, 0
_0809A7D0: .4byte gLCDControlBuffer
_0809A7D4: .4byte gObject_32x16
_0809A7D8: .4byte gUnknown_08A18E62
_0809A7DC:
	ldr r3, _0809A80C  @ gUnknown_08A18E4E
	movs r0, #0x40
	str r0, [sp]
	movs r0, #4
	movs r1, #0x80
	movs r2, #0x82
	bl PutSpriteExt
_0809A7EC:
	ldr r3, _0809A810  @ gUnknown_08A18E34
	movs r0, #0x40
	str r0, [sp]
	movs r0, #4
	movs r1, #0x80
	movs r2, #0x8f
	bl PutSpriteExt
	bl SMS_FlushDirect
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809A80C: .4byte gUnknown_08A18E4E
_0809A810: .4byte gUnknown_08A18E34

	THUMB_FUNC_END sub_809A66C

	THUMB_FUNC_START sub_809A814
sub_809A814: @ 0x0809A814
	push {r4, r5, lr}
	bl Font_InitForUIDefault
	ldr r5, _0809A868  @ gUnknown_02013598
	movs r4, #0xd
_0809A81E:
	adds r0, r5, #0
	movs r1, #5
	bl Text_Init
	adds r5, #8
	subs r4, #1
	cmp r4, #0
	bge _0809A81E
	ldr r5, _0809A86C  @ gUnknown_02013608
	movs r4, #4
_0809A832:
	adds r0, r5, #0
	movs r1, #7
	bl Text_Init
	adds r5, #8
	subs r4, #1
	cmp r4, #0
	bge _0809A832
	ldr r4, _0809A870  @ gUnknown_02013630
	adds r0, r4, #0
	movs r1, #7
	bl Text_Init
	adds r0, r4, #0
	adds r0, #8
	movs r1, #0xa
	bl Text_Init
	adds r4, #0x10
	adds r0, r4, #0
	movs r1, #0xc
	bl Text_Init
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0809A868: .4byte gUnknown_02013598
_0809A86C: .4byte gUnknown_02013608
_0809A870: .4byte gUnknown_02013630

	THUMB_FUNC_END sub_809A814

	THUMB_FUNC_START sub_809A874
sub_809A874: @ 0x0809A874
	push {r4, lr}
	bl ResetIconGraphics_
	bl LoadUiFrameGraphics
	bl LoadObjUIGfx
	movs r0, #4
	bl LoadIconPalettes
	movs r4, #0xc0
	lsls r4, r4, #7
	adds r0, r4, #0
	movs r1, #8
	bl sub_8095A44
	adds r0, r4, #0
	movs r1, #0xf
	bl sub_80950E8
	ldr r0, _0809A8D8  @ gUnknown_08A1B730
	ldr r1, _0809A8DC  @ 0x06000440
	bl CopyDataWithPossibleUncomp
	ldr r0, _0809A8E0  @ gUnknown_08A1B7C8
	ldr r4, _0809A8E4  @ gUnknown_02020188
	adds r1, r4, #0
	bl CopyDataWithPossibleUncomp
	ldr r0, _0809A8E8  @ gBG1TilemapBuffer
	movs r2, #0x80
	lsls r2, r2, #5
	adds r1, r4, #0
	bl CallARM_FillTileRect
	ldr r0, _0809A8EC  @ gUnknown_08A1D510
	ldr r1, _0809A8F0  @ 0x06010800
	bl CopyDataWithPossibleUncomp
	ldr r0, _0809A8F4  @ gUnknown_08A1D79C
	movs r1, #0xc8
	lsls r1, r1, #2
	movs r2, #0x20
	bl CopyToPaletteBuffer
	bl EnablePaletteSync
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809A8D8: .4byte gUnknown_08A1B730
_0809A8DC: .4byte 0x06000440
_0809A8E0: .4byte gUnknown_08A1B7C8
_0809A8E4: .4byte gUnknown_02020188
_0809A8E8: .4byte gBG1TilemapBuffer
_0809A8EC: .4byte gUnknown_08A1D510
_0809A8F0: .4byte 0x06010800
_0809A8F4: .4byte gUnknown_08A1D79C

	THUMB_FUNC_END sub_809A874

	THUMB_FUNC_START sub_809A8F8
sub_809A8F8: @ 0x0809A8F8
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	bl SetupMapSpritesPalettes
	movs r0, #0
	str r0, [sp]
	ldr r1, _0809A928  @ gUnknown_02022C08
	ldr r2, _0809A92C  @ 0x01000008
	mov r0, sp
	bl CpuFastSet
	bl sub_80958BC
	ldr r0, [r4, #0x14]
	bl sub_80959B4
	bl sub_8095928
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809A928: .4byte gUnknown_02022C08
_0809A92C: .4byte 0x01000008

	THUMB_FUNC_END sub_809A8F8

	THUMB_FUNC_START sub_809A930
sub_809A930: @ 0x0809A930
	push {r4, r5, r6, lr}
	mov r6, r9
	mov r5, r8
	push {r5, r6}
	sub sp, #8
	adds r5, r0, #0
	ldr r4, _0809A9E0  @ gUnknown_02022D72
	adds r0, r4, #0
	movs r1, #6
	movs r2, #1
	movs r3, #0
	bl TileMap_FillRect
	adds r0, r5, #0
	bl GetUnitPortraitId
	adds r1, r4, #0
	subs r1, #0x88
	movs r2, #0x9c
	lsls r2, r2, #2
	movs r3, #0
	mov r9, r3
	str r3, [sp]
	movs r3, #2
	bl sub_8005988
	ldr r0, _0809A9E4  @ gUnknown_02013630
	mov r8, r0
	bl Text_Clear
	ldr r0, [r5]
	ldrh r0, [r0]
	bl GetStringFromIndex
	adds r1, r0, #0
	movs r0, #0x38
	bl GetStringTextCenteredPos
	adds r6, r0, #0
	ldr r0, [r5]
	ldrh r0, [r0]
	bl GetStringFromIndex
	adds r1, r4, #0
	subs r1, #0x80
	mov r2, r9
	str r2, [sp]
	str r0, [sp, #4]
	mov r0, r8
	movs r2, #0
	adds r3, r6, #0
	bl DrawTextInline
	adds r0, r4, #0
	movs r1, #3
	movs r2, #0x24
	movs r3, #0x25
	bl sub_8004D5C
	adds r0, r4, #0
	adds r0, #8
	movs r1, #3
	movs r2, #0x1d
	bl sub_8004B0C
	adds r0, r4, #6
	movs r2, #8
	ldrsb r2, [r5, r2]
	movs r1, #2
	bl DrawDecNumber
	adds r4, #0xc
	ldrb r2, [r5, #9]
	adds r0, r4, #0
	movs r1, #2
	bl DrawDecNumber
	movs r0, #1
	bl BG_EnableSyncByMask
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0809A9E0: .4byte gUnknown_02022D72
_0809A9E4: .4byte gUnknown_02013630

	THUMB_FUNC_END sub_809A930

	THUMB_FUNC_START sub_809A9E8
sub_809A9E8: @ 0x0809A9E8
	push {lr}
	ldrh r0, [r0, #0x2e]
	bl sub_8095354
	bl sub_809A930
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_809A9E8

	THUMB_FUNC_START sub_809A9F8
sub_809A9F8: @ 0x0809A9F8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	adds r7, r0, #0
	bl ResetIconGraphics_
	ldr r4, _0809AAE4  @ gUnknown_02022DEA
	adds r0, r4, #0
	movs r1, #0xb
	movs r2, #0xa
	movs r3, #0
	bl TileMap_FillRect
	adds r0, r7, #0
	bl GetUnitItemCount
	str r0, [sp, #8]
	movs r0, #0
	mov r8, r0
	ldr r2, [sp, #8]
	cmp r8, r2
	bge _0809AACC
	movs r0, #0x14
	adds r0, r0, r4
	mov sl, r0
	mov r9, r4
	movs r2, #0xa0
	lsls r2, r2, #1
	str r2, [sp, #0xc]
_0809AA38:
	mov r0, r8
	lsls r1, r0, #1
	adds r0, r7, #0
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r4, [r0]
	adds r0, r4, #0
	bl GetItemIconId
	adds r1, r0, #0
	mov r0, r9
	movs r2, #0x80
	lsls r2, r2, #7
	bl DrawIcon
	mov r2, r8
	lsls r1, r2, #3
	ldr r0, _0809AAE8  @ gUnknown_02013608
	adds r5, r1, r0
	adds r0, r5, #0
	bl Text_Clear
	adds r0, r7, #0
	adds r1, r4, #0
	bl IsItemDisplayUsable
	movs r6, #0
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0809AA76
	movs r6, #1
_0809AA76:
	adds r0, r4, #0
	bl GetItemName
	ldr r1, _0809AAEC  @ gUnknown_02022CAA
	adds r1, #4
	ldr r2, [sp, #0xc]
	adds r1, r2, r1
	movs r2, #0
	str r2, [sp]
	str r0, [sp, #4]
	adds r0, r5, #0
	adds r2, r6, #0
	movs r3, #0
	bl DrawTextInline
	adds r0, r7, #0
	adds r1, r4, #0
	bl IsItemDisplayUsable
	lsls r0, r0, #0x18
	movs r5, #1
	cmp r0, #0
	beq _0809AAA6
	movs r5, #2
_0809AAA6:
	adds r0, r4, #0
	bl GetItemUses
	adds r2, r0, #0
	mov r0, sl
	adds r1, r5, #0
	bl DrawDecNumber
	movs r0, #0x80
	add sl, r0
	add r9, r0
	ldr r2, [sp, #0xc]
	adds r2, #0x80
	str r2, [sp, #0xc]
	movs r0, #1
	add r8, r0
	ldr r2, [sp, #8]
	cmp r8, r2
	blt _0809AA38
_0809AACC:
	movs r0, #1
	bl BG_EnableSyncByMask
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809AAE4: .4byte gUnknown_02022DEA
_0809AAE8: .4byte gUnknown_02013608
_0809AAEC: .4byte gUnknown_02022CAA

	THUMB_FUNC_END sub_809A9F8

	THUMB_FUNC_START sub_809AAF0
sub_809AAF0: @ 0x0809AAF0
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r7, r0, #0
	lsls r1, r1, #0x18
	asrs r6, r1, #0x18
	cmp r6, #0
	bne _0809AB34
	ldr r4, _0809ABBC  @ gUnknown_02013640
	adds r0, r4, #0
	bl Text_Clear
	ldr r0, _0809ABC0  @ 0x000005A1
	bl GetStringFromIndex
	ldr r5, _0809ABC4  @ gUnknown_02022D02
	str r6, [sp]
	str r0, [sp, #4]
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0
	movs r3, #6
	bl DrawTextInline
	ldr r0, _0809ABC8  @ 0x000005A2
	bl GetStringFromIndex
	str r6, [sp]
	str r0, [sp, #4]
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0
	movs r3, #0x29
	bl DrawTextInline
_0809AB34:
	ldr r4, _0809ABCC  @ gUnknown_02022D08
	adds r0, r4, #0
	movs r1, #1
	movs r2, #1
	movs r3, #0
	bl TileMap_FillRect
	adds r3, r4, #2
	adds r5, r7, #0
	adds r5, #0x29
	adds r6, r7, #0
	adds r6, #0x2a
	ldrb r0, [r5]
	movs r1, #2
	ldrb r2, [r6]
	cmp r0, r2
	bne _0809AB58
	movs r1, #1
_0809AB58:
	ldrb r2, [r6]
	ldrb r0, [r5]
	subs r2, r2, r0
	adds r0, r3, #0
	bl DrawDecNumber
	adds r0, r4, #0
	adds r0, #0x10
	movs r1, #4
	movs r2, #1
	movs r3, #0
	bl TileMap_FillRect
	adds r3, r4, #0
	adds r3, #0x12
	ldrb r0, [r5]
	movs r1, #2
	ldrb r2, [r6]
	cmp r0, r2
	bne _0809AB82
	movs r1, #4
_0809AB82:
	ldrb r2, [r5]
	adds r0, r3, #0
	bl DrawDecNumber
	adds r0, r4, #0
	adds r0, #0x14
	movs r1, #0
	movs r2, #0x16
	bl sub_8004B0C
	adds r3, r4, #0
	adds r3, #0x18
	ldrb r0, [r5]
	movs r1, #2
	ldrb r2, [r6]
	cmp r0, r2
	bne _0809ABA6
	movs r1, #4
_0809ABA6:
	ldrb r2, [r6]
	adds r0, r3, #0
	bl DrawDecNumber
	movs r0, #1
	bl BG_EnableSyncByMask
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809ABBC: .4byte gUnknown_02013640
_0809ABC0: .4byte 0x000005A1
_0809ABC4: .4byte gUnknown_02022D02
_0809ABC8: .4byte 0x000005A2
_0809ABCC: .4byte gUnknown_02022D08

	THUMB_FUNC_END sub_809AAF0

	THUMB_FUNC_START sub_809ABD0
sub_809ABD0: @ 0x0809ABD0
	push {r4, lr}
	adds r4, r0, #0
	adds r2, r1, #0
	adds r0, #0x2a
	adds r3, r4, #0
	adds r3, #0x29
	ldrb r1, [r3]
	ldrb r0, [r0]
	cmp r0, r1
	bls _0809AC20
	adds r0, r1, #1
	strb r0, [r3]
	ldr r0, [r2, #0xc]
	movs r1, #0xb
	negs r1, r1
	ands r0, r1
	str r0, [r2, #0xc]
	ldr r0, [r2]
	ldrb r0, [r0, #4]
	bl sub_80952EC
	ldr r0, _0809AC1C  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809AC0C
	movs r0, #0x6a
	bl m4aSongNumStart
_0809AC0C:
	ldrh r1, [r4, #0x2e]
	lsrs r1, r1, #1
	adds r0, r4, #0
	bl sub_809A580
	movs r0, #1
	b _0809AC34
	.align 2, 0
_0809AC1C: .4byte gRAMChapterData
_0809AC20:
	ldr r0, _0809AC3C  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809AC32
	movs r0, #0x6c
	bl m4aSongNumStart
_0809AC32:
	movs r0, #0
_0809AC34:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0809AC3C: .4byte gRAMChapterData

	THUMB_FUNC_END sub_809ABD0

	THUMB_FUNC_START sub_809AC40
sub_809AC40: @ 0x0809AC40
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	ldr r0, [r4]
	ldrb r0, [r0, #4]
	bl IsCharacterForceDeployed
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0809AC94
	adds r1, r5, #0
	adds r1, #0x29
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	ldr r0, [r4, #0xc]
	movs r1, #0xa
	orrs r0, r1
	str r0, [r4, #0xc]
	ldr r0, [r4]
	ldrb r0, [r0, #4]
	bl sub_8095314
	ldr r0, _0809AC90  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809AC80
	movs r0, #0x6b
	bl m4aSongNumStart
_0809AC80:
	ldrh r1, [r5, #0x2e]
	lsrs r1, r1, #1
	adds r0, r5, #0
	bl sub_809A580
	movs r0, #1
	b _0809ACA8
	.align 2, 0
_0809AC90: .4byte gRAMChapterData
_0809AC94:
	ldr r0, _0809ACB0  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809ACA6
	movs r0, #0x6c
	bl m4aSongNumStart
_0809ACA6:
	movs r0, #0
_0809ACA8:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0809ACB0: .4byte gRAMChapterData

	THUMB_FUNC_END sub_809AC40

	THUMB_FUNC_START sub_809ACB4
sub_809ACB4: @ 0x0809ACB4
	push {r4, r5, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2e]
	bl sub_8095354
	adds r5, r0, #0
	ldr r1, [r5, #0xc]
	movs r0, #0x80
	lsls r0, r0, #0x12
	ands r0, r1
	cmp r0, #0
	beq _0809ACF4
	ldrh r1, [r4, #0x2e]
	movs r2, #1
	ands r2, r1
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #3
	adds r0, #0x70
	lsrs r1, r1, #1
	lsls r1, r1, #4
	ldrh r2, [r4, #0x30]
	subs r1, r1, r2
	adds r1, #0x18
	ldr r2, _0809ACF0  @ 0x00000C52
_0809ACE6:
	adds r3, r4, #0
	bl sub_8097DA8
	b _0809AD88
	.align 2, 0
_0809ACF0: .4byte 0x00000C52
_0809ACF4:
	movs r0, #8
	ands r1, r0
	cmp r1, #0
	beq _0809AD76
	bl CheckSomethingSomewhere
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809AD34
	adds r0, r5, #0
	bl sub_8097E74
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0809AD34
	ldrh r1, [r4, #0x2e]
	movs r2, #1
	ands r2, r1
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #3
	adds r0, #0x70
	lsrs r1, r1, #1
	lsls r1, r1, #4
	ldrh r2, [r4, #0x30]
	subs r1, r1, r2
	adds r1, #0x18
	ldr r2, _0809AD30  @ 0x0000088A
	b _0809ACE6
	.align 2, 0
_0809AD30: .4byte 0x0000088A
_0809AD34:
	bl CheckSomethingSomewhere
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809AD6C
	adds r0, r5, #0
	bl sub_8097E38
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0809AD6C
	ldrh r1, [r4, #0x2e]
	movs r2, #1
	ands r2, r1
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #3
	adds r0, #0x70
	lsrs r1, r1, #1
	lsls r1, r1, #4
	ldrh r2, [r4, #0x30]
	subs r1, r1, r2
	adds r1, #0x18
	ldr r2, _0809AD68  @ 0x00000889
	b _0809ACE6
	.align 2, 0
_0809AD68: .4byte 0x00000889
_0809AD6C:
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_809ABD0
	b _0809AD7E
_0809AD76:
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_809AC40
_0809AD7E:
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809AD88
	movs r0, #1
	b _0809AD8A
_0809AD88:
	movs r0, #0
_0809AD8A:
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_809ACB4

	THUMB_FUNC_START sub_809AD90
sub_809AD90: @ 0x0809AD90
	push {r4, r5, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x30]
	lsrs r1, r0, #4
	cmp r1, #0
	ble _0809ADA4
	ldrh r0, [r4, #0x2e]
	lsrs r0, r0, #1
	cmp r0, r1
	ble _0809ADBA
_0809ADA4:
	adds r5, r1, #5
	bl sub_8095374
	subs r0, #1
	asrs r0, r0, #1
	cmp r5, r0
	bge _0809ADBE
	ldrh r0, [r4, #0x2e]
	lsrs r0, r0, #1
	cmp r0, r5
	blt _0809ADBE
_0809ADBA:
	movs r0, #1
	b _0809ADC0
_0809ADBE:
	movs r0, #0
_0809ADC0:
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_809AD90

	THUMB_FUNC_START sub_809ADC8
sub_809ADC8: @ 0x0809ADC8
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	bl sub_809AD90
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809AE0A
	ldrh r0, [r5, #0x2e]
	lsrs r4, r0, #1
	ldrh r0, [r5, #0x30]
	lsrs r6, r0, #4
	bl sub_8095374
	subs r0, #1
	asrs r1, r0, #1
	cmp r4, r6
	bgt _0809ADFC
	cmp r4, #0
	bne _0809ADF2
	strh r4, [r5, #0x30]
	b _0809ADF8
_0809ADF2:
	subs r0, r4, #1
	lsls r0, r0, #4
	strh r0, [r5, #0x30]
_0809ADF8:
	cmp r4, r6
	ble _0809AE0A
_0809ADFC:
	cmp r4, r1
	bne _0809AE04
	subs r0, r4, #5
	b _0809AE06
_0809AE04:
	subs r0, r4, #4
_0809AE06:
	lsls r0, r0, #4
	strh r0, [r5, #0x30]
_0809AE0A:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_809ADC8

	THUMB_FUNC_START sub_809AE10
sub_809AE10: @ 0x0809AE10
	push {r4, r5, lr}
	movs r5, #0
	ldrh r0, [r0, #0x30]
	lsrs r4, r0, #4
	bl sub_8095374
	subs r0, #1
	asrs r1, r0, #1
	cmp r4, #0
	ble _0809AE26
	movs r5, #1
_0809AE26:
	adds r0, r4, #5
	cmp r0, r1
	bge _0809AE30
	movs r0, #2
	orrs r5, r0
_0809AE30:
	adds r0, r5, #0
	bl sub_80ACD60
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_809AE10

	THUMB_FUNC_START sub_809AE3C
sub_809AE3C: @ 0x0809AE3C
	push {r4, lr}
	adds r4, r0, #0
	bl sub_80958BC
	bl sub_8095394
	bl sub_80958FC
	movs r1, #0
	strh r0, [r4, #0x2e]
	ldr r0, [r4, #0x14]
	adds r0, #0x2a
	ldrb r0, [r0]
	adds r2, r4, #0
	adds r2, #0x2a
	strb r0, [r2]
	ldr r0, [r4, #0x14]
	adds r0, #0x2b
	ldrb r0, [r0]
	subs r2, #1
	strb r0, [r2]
	ldr r0, [r4, #0x14]
	ldrh r0, [r0, #0x3c]
	strh r0, [r4, #0x30]
	ldrh r0, [r4, #0x2e]
	strh r0, [r4, #0x2c]
	adds r0, r4, #0
	adds r0, #0x37
	strb r1, [r0]
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_809AE3C

	THUMB_FUNC_START sub_809AE7C
sub_809AE7C: @ 0x0809AE7C
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r0, _0809AFF8  @ gUnknown_08A181E8
	bl SetupBackgrounds
	ldr r4, _0809AFFC  @ gLCDControlBuffer
	ldrb r1, [r4, #1]
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
	strb r0, [r4, #1]
	adds r0, r5, #0
	bl sub_809ADC8
	ldr r0, _0809B000  @ gBG0TilemapBuffer
	movs r1, #0
	bl BG_Fill
	ldr r0, _0809B004  @ gBG1TilemapBuffer
	movs r1, #0
	bl BG_Fill
	ldr r0, _0809B008  @ gBG2TilemapBuffer
	movs r1, #0
	bl BG_Fill
	ldrb r2, [r4, #0xc]
	movs r1, #4
	negs r1, r1
	adds r0, r1, #0
	ands r0, r2
	movs r3, #2
	orrs r0, r3
	strb r0, [r4, #0xc]
	ldrb r2, [r4, #0x10]
	adds r0, r1, #0
	ands r0, r2
	orrs r0, r3
	strb r0, [r4, #0x10]
	ldrb r0, [r4, #0x14]
	ands r1, r0
	movs r0, #1
	orrs r1, r0
	strb r1, [r4, #0x14]
	ldrb r0, [r4, #0x18]
	movs r1, #3
	orrs r0, r1
	strb r0, [r4, #0x18]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	ldrh r2, [r5, #0x30]
	subs r2, #0x18
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #2
	movs r1, #0
	bl BG_SetPosition
	movs r0, #3
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	bl sub_809A814
	bl sub_809A874
	movs r0, #7
	bl BG_EnableSyncByMask
	bl SetDefaultColorEffects
	adds r0, r5, #0
	bl sub_809A8F8
	ldr r0, _0809B00C  @ sub_809A66C
	adds r1, r5, #0
	bl Get6CDifferedLoop6C
	adds r0, r5, #0
	bl sub_80AD47C
	movs r0, #0xc0
	lsls r0, r0, #3
	movs r1, #1
	bl sub_80AD4A0
	ldrh r1, [r5, #0x2e]
	movs r2, #1
	ands r2, r1
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #3
	adds r0, #0x70
	lsrs r1, r1, #1
	lsls r1, r1, #4
	ldrh r2, [r5, #0x30]
	subs r2, #0x18
	subs r1, r1, r2
	movs r3, #0x80
	lsls r3, r3, #4
	movs r2, #7
	bl sub_80AD51C
	movs r3, #0x80
	lsls r3, r3, #2
	movs r0, #2
	str r0, [sp]
	adds r0, r5, #0
	movs r1, #0xe0
	movs r2, #0x20
	bl sub_8097748
	ldrh r4, [r5, #0x30]
	bl sub_8095374
	adds r2, r0, #0
	subs r2, #1
	lsrs r0, r2, #0x1f
	adds r2, r2, r0
	asrs r2, r2, #1
	adds r2, #1
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #0xa
	adds r1, r4, #0
	movs r3, #6
	bl sub_80976CC
	movs r0, #0x20
	movs r1, #0x8f
	movs r2, #9
	adds r3, r5, #0
	bl StartHelpPromptSprite
	ldrh r0, [r5, #0x2e]
	bl sub_8095354
	bl sub_809A9F8
	ldrh r0, [r5, #0x2e]
	bl sub_8095354
	bl sub_809A930
	movs r4, #0
_0809AFC4:
	ldrh r1, [r5, #0x30]
	lsrs r1, r1, #4
	adds r1, r1, r4
	adds r0, r5, #0
	bl sub_809A580
	adds r4, #1
	cmp r4, #5
	ble _0809AFC4
	adds r0, r5, #0
	movs r1, #0
	bl sub_809AAF0
	adds r0, r5, #0
	bl NewGreenTextColorManager
	ldr r0, _0809B010  @ 0x06014800
	movs r1, #5
	bl LoadDialogueBoxGfx
	bl sub_8095A1C
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0809AFF8: .4byte gUnknown_08A181E8
_0809AFFC: .4byte gLCDControlBuffer
_0809B000: .4byte gBG0TilemapBuffer
_0809B004: .4byte gBG1TilemapBuffer
_0809B008: .4byte gBG2TilemapBuffer
_0809B00C: .4byte sub_809A66C
_0809B010: .4byte 0x06014800

	THUMB_FUNC_END sub_809AE7C

	THUMB_FUNC_START sub_809B014
sub_809B014: @ 0x0809B014
	push {lr}
	bl Delete6CMenuScroll
	bl DeleteEach6CDifferedLoop
	bl sub_80AD2D4
	bl sub_80AD580
	bl EndHelpPromptSprite
	bl sub_80ACDDC
	bl EndBG3Slider_
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_809B014

	THUMB_FUNC_START sub_809B038
sub_809B038: @ 0x0809B038
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldrh r0, [r5, #0x2c]
	ldrh r1, [r5, #0x2e]
	cmp r0, r1
	beq _0809B046
	b _0809B25A
_0809B046:
	ldr r4, _0809B094  @ gKeyStatusPtr
	ldr r2, [r4]
	ldrh r6, [r2, #6]
	adds r3, r5, #0
	adds r3, #0x36
	movs r7, #4
	strb r7, [r3]
	ldrh r1, [r2, #4]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0809B066
	ldrh r6, [r2, #4]
	movs r0, #8
	strb r0, [r3]
_0809B066:
	ldr r0, [r4]
	ldrh r1, [r0, #8]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _0809B0BC
	adds r0, r5, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #0
	bne _0809B09C
	ldr r0, _0809B098  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	bge _0809B08A
	b _0809B2D4
_0809B08A:
	movs r0, #0x6c
	bl m4aSongNumStart
	b _0809B2D4
	.align 2, 0
_0809B094: .4byte gKeyStatusPtr
_0809B098: .4byte gRAMChapterData
_0809B09C:
	ldr r0, _0809B0B8  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809B0AE
	movs r0, #0x6a
	bl m4aSongNumStart
_0809B0AE:
	adds r0, r5, #0
	movs r1, #0x63
	bl Proc_Goto
	b _0809B2D4
	.align 2, 0
_0809B0B8: .4byte gRAMChapterData
_0809B0BC:
	adds r0, r7, #0
	ands r0, r1
	cmp r0, #0
	beq _0809B0E4
	ldr r0, _0809B0E0  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809B0D6
	movs r0, #0x6a
	bl m4aSongNumStart
_0809B0D6:
	adds r0, r5, #0
	movs r1, #3
	bl Proc_Goto
	b _0809B2D4
	.align 2, 0
_0809B0E0: .4byte gRAMChapterData
_0809B0E4:
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0809B0F8
	adds r0, r5, #0
	movs r1, #4
	bl Proc_Goto
	b _0809B2D4
_0809B0F8:
	movs r2, #1
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	beq _0809B11A
	adds r0, r5, #0
	bl sub_809ACB4
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0809B110
	b _0809B2D4
_0809B110:
	adds r0, r5, #0
	movs r1, #1
	bl sub_809AAF0
	b _0809B2D4
_0809B11A:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0809B144
	ldr r0, _0809B140  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809B134
	movs r0, #0x6b
	bl m4aSongNumStart
_0809B134:
	adds r0, r5, #0
	movs r1, #0xa
	bl Proc_Goto
	b _0809B2D4
	.align 2, 0
_0809B140: .4byte gRAMChapterData
_0809B144:
	movs r0, #0x20
	ands r0, r6
	cmp r0, #0
	beq _0809B15A
	ldrh r1, [r5, #0x2e]
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	beq _0809B15A
	subs r0, r1, #1
	strh r0, [r5, #0x2e]
_0809B15A:
	movs r0, #0x10
	ands r0, r6
	cmp r0, #0
	beq _0809B17E
	ldrh r1, [r5, #0x2e]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _0809B17E
	ldrh r4, [r5, #0x2e]
	bl sub_8095374
	subs r0, #1
	cmp r4, r0
	bge _0809B17E
	ldrh r0, [r5, #0x2e]
	adds r0, #1
	strh r0, [r5, #0x2e]
_0809B17E:
	movs r0, #0x40
	ands r0, r6
	cmp r0, #0
	beq _0809B190
	ldrh r0, [r5, #0x2e]
	subs r0, #2
	cmp r0, #0
	blt _0809B190
	strh r0, [r5, #0x2e]
_0809B190:
	movs r0, #0x80
	ands r6, r0
	cmp r6, #0
	beq _0809B1AC
	ldrh r4, [r5, #0x2e]
	adds r4, #2
	bl sub_8095374
	subs r0, #1
	cmp r4, r0
	bgt _0809B1AC
	ldrh r0, [r5, #0x2e]
	adds r0, #2
	strh r0, [r5, #0x2e]
_0809B1AC:
	ldrh r0, [r5, #0x2c]
	ldrh r1, [r5, #0x2e]
	cmp r0, r1
	bne _0809B1B6
	b _0809B2D4
_0809B1B6:
	ldrh r0, [r5, #0x2e]
	bl sub_8095354
	bl sub_809A9F8
	ldr r0, _0809B224  @ sub_809A9E8
	movs r1, #1
	adds r2, r5, #0
	bl sub_80ACE20
	ldr r0, _0809B228  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809B1DC
	movs r0, #0x65
	bl m4aSongNumStart
_0809B1DC:
	adds r0, r5, #0
	bl sub_809AD90
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809B22C
	ldrh r0, [r5, #0x2e]
	ldrh r1, [r5, #0x2c]
	cmp r0, r1
	bcs _0809B1FC
	ldrh r1, [r5, #0x30]
	lsrs r1, r1, #4
	subs r1, #1
	adds r0, r5, #0
	bl sub_809A580
_0809B1FC:
	ldrh r0, [r5, #0x2e]
	ldrh r1, [r5, #0x2c]
	cmp r0, r1
	bls _0809B210
	ldrh r1, [r5, #0x30]
	lsrs r1, r1, #4
	adds r1, #6
	adds r0, r5, #0
	bl sub_809A580
_0809B210:
	ldrh r0, [r5, #0x2e]
	movs r1, #1
	ands r1, r0
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #3
	adds r0, #0x70
	bl sub_80AD4E4
	b _0809B252
	.align 2, 0
_0809B224: .4byte sub_809A9E8
_0809B228: .4byte gRAMChapterData
_0809B22C:
	ldrh r1, [r5, #0x2e]
	strh r1, [r5, #0x2c]
	movs r2, #1
	ands r2, r1
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #3
	adds r0, #0x70
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x11
	lsls r1, r1, #4
	ldrh r2, [r5, #0x30]
	subs r2, #0x18
	subs r1, r1, r2
	movs r3, #0x80
	lsls r3, r3, #4
	movs r2, #7
	bl sub_80AD51C
_0809B252:
	ldrh r0, [r5, #0x2c]
	ldrh r1, [r5, #0x2e]
	cmp r0, r1
	beq _0809B2D4
_0809B25A:
	ldrh r3, [r5, #0x2e]
	ldrh r2, [r5, #0x2c]
	cmp r3, r2
	bcs _0809B26E
	adds r0, r5, #0
	adds r0, #0x36
	ldrb r1, [r0]
	ldrh r0, [r5, #0x30]
	subs r0, r0, r1
	strh r0, [r5, #0x30]
_0809B26E:
	cmp r3, r2
	bls _0809B27E
	adds r1, r5, #0
	adds r1, #0x36
	ldrh r0, [r5, #0x30]
	ldrb r1, [r1]
	adds r0, r0, r1
	strh r0, [r5, #0x30]
_0809B27E:
	ldrh r1, [r5, #0x30]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #0
	bne _0809B2A4
	lsrs r0, r1, #4
	subs r0, #1
	bl sub_809A644
	ldrh r0, [r5, #0x30]
	lsrs r0, r0, #4
	adds r0, #6
	bl sub_809A644
	adds r0, r5, #0
	bl sub_809AE10
	ldrh r0, [r5, #0x2e]
	strh r0, [r5, #0x2c]
_0809B2A4:
	ldrh r2, [r5, #0x30]
	subs r2, #0x18
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #2
	movs r1, #0
	bl BG_SetPosition
	ldrh r4, [r5, #0x30]
	bl sub_8095374
	adds r2, r0, #0
	subs r2, #1
	lsrs r0, r2, #0x1f
	adds r2, r2, r0
	asrs r2, r2, #1
	adds r2, #1
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #0xa
	adds r1, r4, #0
	movs r3, #6
	bl sub_80976CC
_0809B2D4:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_809B038

	THUMB_FUNC_START sub_809B2DC
sub_809B2DC: @ 0x0809B2DC
	push {r4, lr}
	adds r4, r0, #0
	ldrh r1, [r4, #0x34]
	adds r1, #4
	strh r1, [r4, #0x34]
	ldrh r0, [r4, #0x30]
	adds r0, #4
	strh r0, [r4, #0x30]
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	cmp r1, #0x20
	bne _0809B2FA
	adds r0, r4, #0
	bl Proc_Break
_0809B2FA:
	ldrh r2, [r4, #0x30]
	subs r2, #0x18
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #2
	movs r1, #0
	bl BG_SetPosition
	ldrh r1, [r4, #0x30]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #0
	bne _0809B31C
	lsrs r0, r1, #4
	subs r0, #1
	bl sub_809A644
_0809B31C:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_809B2DC

	THUMB_FUNC_START sub_809B324
sub_809B324: @ 0x0809B324
	push {r4, lr}
	adds r4, r0, #0
	ldrh r1, [r4, #0x30]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #0
	bne _0809B33C
	lsrs r1, r1, #4
	subs r1, #1
	adds r0, r4, #0
	bl sub_809A580
_0809B33C:
	ldrh r1, [r4, #0x34]
	subs r1, #4
	strh r1, [r4, #0x34]
	ldrh r0, [r4, #0x30]
	subs r0, #4
	strh r0, [r4, #0x30]
	lsls r1, r1, #0x10
	cmp r1, #0
	bne _0809B354
	adds r0, r4, #0
	bl Proc_Break
_0809B354:
	ldrh r2, [r4, #0x30]
	subs r2, #0x18
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #2
	movs r1, #0
	bl BG_SetPosition
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_809B324

	THUMB_FUNC_START nullsub_21
nullsub_21: @ 0x0809B36C
	bx lr

	THUMB_FUNC_END nullsub_21

	THUMB_FUNC_START sub_809B370
sub_809B370: @ 0x0809B370
	push {lr}
	bl nullsub_21
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0xd0
	movs r1, #0x68
	movs r2, #0
	bl sub_80AD51C
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_809B370

	THUMB_FUNC_START sub_809B388
sub_809B388: @ 0x0809B388
	push {lr}
	adds r3, r0, #0
	ldrh r1, [r3, #0x2e]
	movs r2, #1
	ands r2, r1
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #3
	adds r0, #0x70
	lsrs r1, r1, #1
	lsls r1, r1, #4
	ldrh r2, [r3, #0x30]
	subs r2, #0x18
	subs r1, r1, r2
	movs r3, #0x80
	lsls r3, r3, #4
	movs r2, #7
	bl sub_80AD51C
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_809B388

	THUMB_FUNC_START sub_809B3B4
sub_809B3B4: @ 0x0809B3B4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0809B404  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0809B3D8
	ldr r0, _0809B408  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809B3D8
	movs r0, #0x6c
	bl m4aSongNumStart
_0809B3D8:
	ldr r0, _0809B404  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0809B3FE
	ldr r0, _0809B408  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809B3F8
	movs r0, #0x65
	bl m4aSongNumStart
_0809B3F8:
	adds r0, r4, #0
	bl Proc_Break
_0809B3FE:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809B404: .4byte gKeyStatusPtr
_0809B408: .4byte gRAMChapterData

	THUMB_FUNC_END sub_809B3B4

	THUMB_FUNC_START sub_809B40C
sub_809B40C: @ 0x0809B40C
	push {lr}
	ldr r2, [r0, #0x14]
	ldrh r1, [r0, #0x30]
	strh r1, [r2, #0x3c]
	ldr r1, [r0, #0x14]
	adds r2, r0, #0
	adds r2, #0x29
	ldrb r2, [r2]
	adds r1, #0x2b
	strb r2, [r1]
	ldrh r0, [r0, #0x2e]
	bl sub_8095354
	ldr r0, [r0]
	ldrb r0, [r0, #4]
	bl sub_80953C0
	bl EndBG3Slider_
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_809B40C

	THUMB_FUNC_START sub_809B438
sub_809B438: @ 0x0809B438
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x14]
	adds r0, #0x36
	movs r5, #1
	strb r5, [r0]
	ldr r0, [r4, #0x14]
	movs r1, #6
	bl Proc_Goto
	adds r4, #0x37
	strb r5, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_809B438

	THUMB_FUNC_START sub_809B458
sub_809B458: @ 0x0809B458
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2e]
	bl sub_8095354
	ldr r0, [r0]
	ldrb r0, [r0, #4]
	bl sub_80953C0
	adds r0, r4, #0
	bl sub_80920DC
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_809B458

	THUMB_FUNC_START sub_809B478
sub_809B478: @ 0x0809B478
	push {r4, r5, lr}
	adds r4, r0, #0
	bl sub_80956A8
	movs r1, #0
	strh r0, [r4, #0x2c]
	strh r0, [r4, #0x2e]
	adds r4, #0x29
	strb r1, [r4]
	movs r5, #1
_0809B48C:
	adds r0, r5, #0
	bl GetUnit
	adds r1, r0, #0
	cmp r1, #0
	beq _0809B4AE
	ldr r0, [r1]
	cmp r0, #0
	beq _0809B4AE
	ldr r0, [r1, #0xc]
	ldr r1, _0809B4BC  @ 0x0001000C
	ands r0, r1
	cmp r0, #0
	bne _0809B4AE
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
_0809B4AE:
	adds r5, #1
	cmp r5, #0x3f
	ble _0809B48C
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0809B4BC: .4byte 0x0001000C

	THUMB_FUNC_END sub_809B478

	THUMB_FUNC_START sub_809B4C0
sub_809B4C0: @ 0x0809B4C0
	ldr r2, _0809B4E0  @ gLCDControlBuffer
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
	bx lr
	.align 2, 0
_0809B4E0: .4byte gLCDControlBuffer

	THUMB_FUNC_END sub_809B4C0

	THUMB_FUNC_START sub_809B4E4
sub_809B4E4: @ 0x0809B4E4
	ldr r2, _0809B500  @ gLCDControlBuffer
	ldrb r0, [r2, #1]
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
	strb r0, [r2, #1]
	bx lr
	.align 2, 0
_0809B500: .4byte gLCDControlBuffer

	THUMB_FUNC_END sub_809B4E4

	THUMB_FUNC_START sub_809B504
sub_809B504: @ 0x0809B504
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x11
	bl SetStatScreenConfig
	ldrh r0, [r4, #0x2e]
	bl sub_8095354
	adds r1, r4, #0
	bl StartStatScreen
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_809B504

	THUMB_FUNC_START sub_809B520
sub_809B520: @ 0x0809B520
	push {r4, lr}
	adds r4, r0, #0
	bl sub_80958BC
	bl sub_8095674
	strh r0, [r4, #0x2c]
	strh r0, [r4, #0x2e]
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_809B520

	THUMB_FUNC_START sub_809B538
sub_809B538: @ 0x0809B538
	push {r4, r5, r6, lr}
	adds r6, r2, #0
	lsls r1, r1, #1
	adds r4, r0, #0
	adds r4, #0x1e
	adds r4, r4, r1
	ldrh r5, [r4]
	lsls r3, r3, #1
	adds r1, r6, #0
	adds r1, #0x1e
	adds r1, r1, r3
	ldrh r2, [r1]
	strh r2, [r4]
	strh r5, [r1]
	bl UnitRemoveInvalidItems
	adds r0, r6, #0
	bl UnitRemoveInvalidItems
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_809B538

	THUMB_FUNC_START sub_809B564
sub_809B564: @ 0x0809B564
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0809B5C8  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _0809B5E8
	ldr r0, [r4, #0x34]
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	bne _0809B582
	b _0809B744
_0809B582:
	ldr r0, [r4, #0x2c]
	bl GetUnitItemCount
	adds r2, r0, #0
	ldr r3, [r4, #0x38]
	cmp r3, #0xff
	beq _0809B5B0
	ldr r0, [r4, #0x3c]
	cmp r0, #0xff
	bne _0809B5B0
	ldr r0, [r4, #0x34]
	adds r0, #8
	asrs r0, r0, #3
	movs r1, #1
	ands r0, r1
	asrs r1, r3, #3
	cmp r0, r1
	beq _0809B5B0
	movs r0, #5
	cmp r2, #5
	beq _0809B5AE
	adds r0, r2, #1
_0809B5AE:
	adds r2, r0, #0
_0809B5B0:
	cmp r2, #0
	bgt _0809B5B6
	b _0809B744
_0809B5B6:
	ldr r1, [r4, #0x34]
	movs r0, #7
	ands r0, r1
	cmp r2, r0
	ble _0809B5CC
	adds r0, r1, #0
	subs r0, #8
	b _0809B5CE
	.align 2, 0
_0809B5C8: .4byte gKeyStatusPtr
_0809B5CC:
	subs r0, r2, #1
_0809B5CE:
	str r0, [r4, #0x34]
	ldr r0, _0809B5E4  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	bge _0809B5DE
	b _0809B738
_0809B5DE:
	movs r0, #0x67
	b _0809B734
	.align 2, 0
_0809B5E4: .4byte gRAMChapterData
_0809B5E8:
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _0809B658
	ldr r0, [r4, #0x34]
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	beq _0809B5FC
	b _0809B744
_0809B5FC:
	ldr r0, [r4, #0x30]
	bl GetUnitItemCount
	adds r2, r0, #0
	ldr r3, [r4, #0x38]
	cmp r3, #0xff
	beq _0809B62A
	ldr r0, [r4, #0x3c]
	cmp r0, #0xff
	bne _0809B62A
	ldr r0, [r4, #0x34]
	adds r0, #8
	asrs r0, r0, #3
	movs r1, #1
	ands r0, r1
	asrs r1, r3, #3
	cmp r0, r1
	beq _0809B62A
	movs r0, #5
	cmp r2, #5
	beq _0809B628
	adds r0, r2, #1
_0809B628:
	adds r2, r0, #0
_0809B62A:
	cmp r2, #0
	bgt _0809B630
	b _0809B744
_0809B630:
	ldr r1, [r4, #0x34]
	movs r0, #7
	ands r0, r1
	cmp r2, r0
	ble _0809B640
	adds r0, r1, #0
	adds r0, #8
	b _0809B642
_0809B640:
	adds r0, r2, #7
_0809B642:
	str r0, [r4, #0x34]
	ldr r0, _0809B654  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809B738
	movs r0, #0x67
	b _0809B734
	.align 2, 0
_0809B654: .4byte gRAMChapterData
_0809B658:
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0809B6C4
	ldr r0, [r4, #0x34]
	asrs r0, r0, #3
	lsls r0, r0, #2
	adds r1, r4, #0
	adds r1, #0x2c
	adds r1, r1, r0
	ldr r0, [r1]
	bl GetUnitItemCount
	adds r3, r0, #0
	ldr r1, [r4, #0x38]
	cmp r1, #0xff
	beq _0809B694
	ldr r0, [r4, #0x3c]
	cmp r0, #0xff
	bne _0809B694
	ldr r0, [r4, #0x34]
	asrs r0, r0, #3
	asrs r1, r1, #3
	cmp r0, r1
	beq _0809B694
	movs r0, #5
	cmp r3, #5
	beq _0809B692
	adds r0, r3, #1
_0809B692:
	adds r3, r0, #0
_0809B694:
	ldr r2, [r4, #0x34]
	movs r0, #7
	ands r0, r2
	cmp r0, #0
	ble _0809B6A4
	subs r0, r2, #1
	str r0, [r4, #0x34]
	b _0809B726
_0809B6A4:
	ldr r0, _0809B6C0  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0809B744
	movs r0, #8
	ands r2, r0
	adds r0, r2, r3
	subs r0, #1
	str r0, [r4, #0x34]
	b _0809B726
	.align 2, 0
_0809B6C0: .4byte gKeyStatusPtr
_0809B6C4:
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0809B744
	ldr r0, [r4, #0x34]
	asrs r0, r0, #3
	lsls r0, r0, #2
	adds r1, r4, #0
	adds r1, #0x2c
	adds r1, r1, r0
	ldr r0, [r1]
	bl GetUnitItemCount
	adds r3, r0, #0
	ldr r1, [r4, #0x38]
	cmp r1, #0xff
	beq _0809B700
	ldr r0, [r4, #0x3c]
	cmp r0, #0xff
	bne _0809B700
	ldr r0, [r4, #0x34]
	asrs r0, r0, #3
	asrs r1, r1, #3
	cmp r0, r1
	beq _0809B700
	movs r0, #5
	cmp r3, #5
	beq _0809B6FE
	adds r0, r3, #1
_0809B6FE:
	adds r3, r0, #0
_0809B700:
	ldr r2, [r4, #0x34]
	movs r0, #7
	ands r0, r2
	subs r1, r3, #1
	cmp r0, r1
	bge _0809B712
	adds r0, r2, #1
	str r0, [r4, #0x34]
	b _0809B726
_0809B712:
	ldr r0, _0809B73C  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0809B744
	movs r0, #8
	ands r2, r0
	str r2, [r4, #0x34]
_0809B726:
	ldr r0, _0809B740  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809B738
	movs r0, #0x66
_0809B734:
	bl m4aSongNumStart
_0809B738:
	movs r0, #1
	b _0809B746
	.align 2, 0
_0809B73C: .4byte gKeyStatusPtr
_0809B740: .4byte gRAMChapterData
_0809B744:
	movs r0, #0
_0809B746:
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_809B564

	THUMB_FUNC_START sub_809B74C
sub_809B74C: @ 0x0809B74C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x18
	adds r4, r0, #0
	mov r9, r1
	mov sl, r2
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	str r3, [sp, #8]
	movs r1, #0xb
	movs r2, #9
	movs r3, #0
	bl TileMap_FillRect
	mov r0, sl
	bl GetUnitItemCount
	str r0, [sp, #0x10]
	movs r0, #0
	str r0, [sp, #0xc]
	ldr r1, [sp, #0x10]
	cmp r0, r1
	bge _0809B820
	adds r0, r4, #4
	str r0, [sp, #0x14]
	mov r8, r4
_0809B786:
	ldr r0, [sp, #0xc]
	lsls r1, r0, #1
	mov r0, sl
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r6, [r0]
	ldr r1, [sp, #8]
	cmp r1, #0
	beq _0809B7A2
	mov r0, sl
	adds r1, r6, #0
	bl CanUnitUseItemPrepScreen
	b _0809B7AA
_0809B7A2:
	mov r0, sl
	adds r1, r6, #0
	bl IsItemDisplayUsable
_0809B7AA:
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	mov r0, r9
	bl Text_Clear
	adds r0, r6, #0
	bl GetItemName
	adds r1, r0, #0
	movs r2, #0
	lsls r0, r4, #0x18
	asrs r5, r0, #0x18
	cmp r5, #0
	bne _0809B7C8
	movs r2, #1
_0809B7C8:
	movs r0, #0
	str r0, [sp]
	str r1, [sp, #4]
	mov r0, r9
	ldr r1, [sp, #0x14]
	movs r3, #0
	bl DrawTextInline
	mov r4, r8
	adds r4, #0x16
	movs r7, #1
	cmp r5, #0
	beq _0809B7E4
	movs r7, #2
_0809B7E4:
	adds r0, r6, #0
	bl GetItemUses
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r7, #0
	bl DrawDecNumber
	adds r0, r6, #0
	bl GetItemIconId
	adds r1, r0, #0
	mov r0, r8
	movs r2, #0x80
	lsls r2, r2, #7
	bl DrawIcon
	movs r0, #8
	add r9, r0
	ldr r1, [sp, #0x14]
	adds r1, #0x80
	str r1, [sp, #0x14]
	movs r0, #0x80
	add r8, r0
	ldr r1, [sp, #0xc]
	adds r1, #1
	str r1, [sp, #0xc]
	ldr r0, [sp, #0x10]
	cmp r1, r0
	blt _0809B786
_0809B820:
	add sp, #0x18
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_809B74C

	THUMB_FUNC_START sub_809B830
sub_809B830: @ 0x0809B830
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r7, r1, #0
	adds r0, r7, #0
	bl GetUnitItemCount
	adds r6, r0, #0
	movs r5, #0
	cmp r5, r6
	bge _0809B866
_0809B844:
	lsls r1, r5, #1
	adds r0, r7, #0
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r0, [r0]
	bl GetItemIconId
	adds r1, r0, #0
	adds r0, r4, #0
	movs r2, #0x80
	lsls r2, r2, #7
	bl DrawIcon
	adds r4, #0x80
	adds r5, #1
	cmp r5, r6
	blt _0809B844
_0809B866:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_809B830

	THUMB_FUNC_START sub_809B86C
sub_809B86C: @ 0x0809B86C
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	sub sp, #0x28
	mov r8, r0
	add r1, sp, #8
	ldr r0, _0809B964  @ gUnknown_08205C44
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldm r0!, {r2, r3}
	stm r1!, {r2, r3}
	ldr r0, _0809B968  @ gUnknown_08A181E8
	ldrh r0, [r0]
	bl SetupBackgrounds
	add r0, sp, #8
	bl SetupFaceGfxData
	ldr r3, _0809B96C  @ gLCDControlBuffer
	ldrb r1, [r3, #0xc]
	movs r2, #4
	negs r2, r2
	adds r0, r2, #0
	ands r0, r1
	movs r1, #1
	orrs r0, r1
	strb r0, [r3, #0xc]
	ldrb r1, [r3, #0x10]
	adds r0, r2, #0
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	strb r0, [r3, #0x10]
	ldrb r0, [r3, #0x14]
	ands r2, r0
	strb r2, [r3, #0x14]
	ldrb r0, [r3, #0x18]
	movs r1, #3
	orrs r0, r1
	strb r0, [r3, #0x18]
	movs r0, #0
	bl BG_GetMapBuffer
	movs r1, #0
	bl BG_Fill
	movs r0, #1
	bl BG_GetMapBuffer
	movs r1, #0
	bl BG_Fill
	movs r0, #2
	bl BG_GetMapBuffer
	movs r1, #0
	bl BG_Fill
	bl Font_InitForUIDefault
	bl ResetIconGraphics_
	bl LoadUiFrameGraphics
	bl LoadObjUIGfx
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
	ldr r0, _0809B970  @ 0x06014000
	movs r1, #1
	negs r1, r1
	bl LoadDialogueBoxGfx
	movs r0, #4
	bl LoadIconPalettes
	bl sub_8095A1C
	ldr r0, _0809B974  @ gUnknown_02013510
	adds r6, r0, #0
	adds r6, #0x28
	adds r5, r0, #0
	movs r4, #4
_0809B932:
	adds r0, r5, #0
	movs r1, #7
	bl Text_Allocate
	adds r0, r6, #0
	movs r1, #7
	bl Text_Allocate
	adds r6, #8
	adds r5, #8
	subs r4, #1
	cmp r4, #0
	bge _0809B932
	movs r0, #0xff
	mov r4, r8
	str r0, [r4, #0x38]
	ldr r1, [r4, #0x40]
	movs r0, #1
	negs r0, r0
	cmp r1, r0
	beq _0809B978
	adds r0, r1, #0
	adds r0, #8
	str r0, [r4, #0x34]
	b _0809B992
	.align 2, 0
_0809B964: .4byte gUnknown_08205C44
_0809B968: .4byte gUnknown_08A181E8
_0809B96C: .4byte gLCDControlBuffer
_0809B970: .4byte 0x06014000
_0809B974: .4byte gUnknown_02013510
_0809B978:
	mov r1, r8
	ldr r0, [r1, #0x2c]
	bl GetUnitItemCount
	cmp r0, #0
	bne _0809B98C
	movs r0, #8
	mov r2, r8
	str r0, [r2, #0x34]
	b _0809B992
_0809B98C:
	movs r0, #0
	mov r3, r8
	str r0, [r3, #0x34]
_0809B992:
	movs r0, #0xff
	mov r4, r8
	str r0, [r4, #0x3c]
	ldr r0, [r4, #0x2c]
	bl GetUnitPortraitId
	adds r1, r0, #0
	movs r4, #4
	negs r4, r4
	ldr r0, _0809BB24  @ 0x00000203
	str r0, [sp]
	movs r0, #0
	movs r2, #0x40
	adds r3, r4, #0
	bl sub_80064F4
	mov r1, r8
	ldr r0, [r1, #0x30]
	bl GetUnitPortraitId
	adds r1, r0, #0
	ldr r0, _0809BB28  @ 0x00000202
	str r0, [sp]
	movs r0, #1
	movs r2, #0xae
	adds r3, r4, #0
	bl sub_80064F4
	movs r6, #0
	str r6, [sp]
	movs r0, #1
	movs r1, #8
	movs r2, #0xe
	movs r3, #0xc
	bl DrawUiFrame2
	str r6, [sp]
	movs r0, #0xf
	movs r1, #8
	movs r2, #0xe
	movs r3, #0xc
	bl DrawUiFrame2
	movs r0, #7
	bl BG_EnableSyncByMask
	mov r2, r8
	ldr r0, [r2, #0x2c]
	ldr r0, [r0]
	ldrh r0, [r0]
	bl GetStringFromIndex
	adds r7, r0, #0
	bl GetStringTextWidth
	adds r3, r0, #0
	movs r4, #0x30
	subs r3, r4, r3
	lsrs r0, r3, #0x1f
	adds r3, r3, r0
	asrs r3, r3, #1
	ldr r0, _0809BB2C  @ gBG0TilemapBuffer
	mov r9, r0
	movs r5, #6
	str r5, [sp]
	str r7, [sp, #4]
	movs r0, #0
	mov r1, r9
	movs r2, #0
	bl DrawTextInline
	mov r1, r8
	ldr r0, [r1, #0x30]
	ldr r0, [r0]
	ldrh r0, [r0]
	bl GetStringFromIndex
	adds r7, r0, #0
	bl GetStringTextWidth
	subs r4, r4, r0
	lsrs r0, r4, #0x1f
	adds r4, r4, r0
	asrs r4, r4, #1
	mov r1, r9
	adds r1, #0x30
	str r5, [sp]
	str r7, [sp, #4]
	movs r0, #0
	movs r2, #0
	adds r3, r4, #0
	bl DrawTextInline
	movs r0, #0x91
	lsls r0, r0, #2
	add r0, r9
	ldr r4, _0809BB30  @ gUnknown_02013510
	mov r3, r8
	ldr r2, [r3, #0x2c]
	adds r1, r4, #0
	movs r3, #0
	bl sub_809B74C
	movs r0, #0x98
	lsls r0, r0, #2
	add r0, r9
	adds r4, #0x28
	mov r1, r8
	ldr r2, [r1, #0x30]
	adds r1, r4, #0
	movs r3, #0
	bl sub_809B74C
	mov r0, r8
	bl sub_80AC9C0
	mov r0, r8
	bl sub_80AD47C
	movs r0, #0xc0
	lsls r0, r0, #3
	movs r1, #1
	bl sub_80AD4A0
	mov r2, r8
	ldr r1, [r2, #0x34]
	asrs r2, r1, #3
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #4
	adds r0, #0x10
	movs r2, #7
	ands r1, r2
	lsls r1, r1, #4
	adds r1, #0x48
	movs r3, #0x80
	lsls r3, r3, #4
	movs r2, #0xb
	bl sub_80AD51C
	movs r0, #0xc8
	movs r1, #0x93
	movs r2, #2
	mov r3, r8
	bl StartHelpPromptSprite
	movs r1, #0xe0
	lsls r1, r1, #4
	movs r3, #0xc0
	lsls r3, r3, #4
	movs r0, #0x80
	lsls r0, r0, #3
	str r0, [sp]
	mov r4, r8
	str r4, [sp, #4]
	movs r0, #0xd
	movs r2, #0xf
	bl sub_80ADB7C
	movs r1, #0x28
	negs r1, r1
	movs r4, #1
	negs r4, r4
	movs r0, #0
	adds r2, r4, #0
	movs r3, #1
	bl sub_80ADBFC
	movs r0, #1
	movs r1, #0xb8
	adds r2, r4, #0
	movs r3, #0
	bl sub_80ADBFC
	movs r0, #1
	movs r1, #0xe
	movs r2, #4
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	str r6, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl sub_8001ED0
	str r6, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #1
	bl sub_8001F0C
	add sp, #0x28
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809BB24: .4byte 0x00000203
_0809BB28: .4byte 0x00000202
_0809BB2C: .4byte gBG0TilemapBuffer
_0809BB30: .4byte gUnknown_02013510

	THUMB_FUNC_END sub_809B86C

	THUMB_FUNC_START sub_809BB34
sub_809BB34: @ 0x0809BB34
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	ldr r2, [r6, #0x3c]
	cmp r2, #0xff
	beq _0809BB60
	ldr r0, _0809BB5C  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0x81
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	bne _0809BB54
	b _0809BDB8
_0809BB54:
	bl CloseHelpBox
	movs r0, #0xff
	b _0809BE18
	.align 2, 0
_0809BB5C: .4byte gKeyStatusPtr
_0809BB60:
	ldr r0, _0809BB9C  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0809BBA0
	ldr r2, [r6, #0x34]
	asrs r3, r2, #3
	lsls r1, r3, #2
	adds r0, r6, #0
	adds r0, #0x2c
	adds r0, r0, r1
	ldr r0, [r0]
	movs r4, #7
	ands r4, r2
	lsls r1, r4, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r2, [r0]
	cmp r2, #0
	bne _0809BB90
	b _0809BE1A
_0809BB90:
	lsls r0, r3, #3
	subs r0, r0, r3
	lsls r0, r0, #4
	adds r0, #0x10
	lsls r1, r4, #4
	b _0809BE10
	.align 2, 0
_0809BB9C: .4byte gKeyStatusPtr
_0809BBA0:
	ldr r4, [r6, #0x38]
	cmp r4, #0xff
	bne _0809BBA8
	b _0809BD00
_0809BBA8:
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _0809BBB2
	b _0809BCB8
_0809BBB2:
	asrs r0, r4, #3
	lsls r0, r0, #2
	adds r7, r6, #0
	adds r7, #0x2c
	adds r0, r7, r0
	ldr r0, [r0]
	movs r1, #7
	mov r8, r1
	ands r4, r1
	ldr r3, [r6, #0x34]
	asrs r1, r3, #3
	lsls r1, r1, #2
	adds r1, r7, r1
	ldr r2, [r1]
	mov r1, r8
	ands r3, r1
	adds r1, r4, #0
	bl sub_8097EA0
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0809BBF4
	movs r1, #1
	negs r1, r1
	ldr r2, _0809BBF0  @ 0x0000088B
	adds r0, r1, #0
	adds r3, r6, #0
	bl sub_8097DA8
	b _0809BE1A
	.align 2, 0
_0809BBF0: .4byte 0x0000088B
_0809BBF4:
	ldr r1, [r6, #0x38]
	asrs r0, r1, #3
	lsls r0, r0, #2
	adds r0, r7, r0
	ldr r0, [r0]
	mov r2, r8
	ands r1, r2
	ldr r3, [r6, #0x34]
	asrs r2, r3, #3
	lsls r2, r2, #2
	adds r2, r7, r2
	ldr r2, [r2]
	mov r4, r8
	ands r3, r4
	bl sub_809B538
	ldr r4, _0809BC58  @ gUnknown_02022EEC
	ldr r5, _0809BC5C  @ gUnknown_02013510
	ldr r2, [r6, #0x2c]
	adds r0, r4, #0
	adds r1, r5, #0
	movs r3, #0
	bl sub_809B74C
	adds r4, #0x1c
	adds r5, #0x28
	ldr r2, [r6, #0x30]
	adds r0, r4, #0
	adds r1, r5, #0
	movs r3, #0
	bl sub_809B74C
	movs r0, #1
	bl BG_EnableSyncByMask
	ldr r0, [r6, #0x38]
	asrs r0, r0, #3
	lsls r0, r0, #2
	adds r0, r7, r0
	ldr r0, [r0]
	bl GetUnitItemCount
	adds r2, r0, #0
	cmp r2, #0
	bne _0809BC60
	ldr r0, [r6, #0x38]
	adds r0, #8
	movs r1, #8
	ands r0, r1
	b _0809BC74
	.align 2, 0
_0809BC58: .4byte gUnknown_02022EEC
_0809BC5C: .4byte gUnknown_02013510
_0809BC60:
	ldr r1, [r6, #0x38]
	adds r0, r1, #0
	mov r3, r8
	ands r0, r3
	cmp r2, r0
	bgt _0809BC76
	movs r0, #8
	ands r1, r0
	adds r0, r1, r2
	subs r0, #1
_0809BC74:
	str r0, [r6, #0x38]
_0809BC76:
	ldr r0, _0809BCB4  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809BC88
	movs r0, #0x6a
	bl m4aSongNumStart
_0809BC88:
	movs r0, #0
	bl sub_80ACA84
	ldr r1, [r6, #0x38]
	str r1, [r6, #0x34]
	movs r0, #0xff
	str r0, [r6, #0x38]
	asrs r2, r1, #3
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #4
	adds r0, #0x10
	movs r2, #7
	ands r1, r2
	lsls r1, r1, #4
	adds r1, #0x48
	movs r3, #0x80
	lsls r3, r3, #4
	movs r2, #0xb
	bl sub_80AD51C
	b _0809BE1A
	.align 2, 0
_0809BCB4: .4byte gRAMChapterData
_0809BCB8:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _0809BCC2
	b _0809BDB8
_0809BCC2:
	str r4, [r6, #0x34]
	str r2, [r6, #0x38]
	asrs r1, r4, #3
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #4
	adds r0, #0x10
	movs r1, #7
	ands r4, r1
	lsls r1, r4, #4
	adds r1, #0x48
	movs r3, #0x80
	lsls r3, r3, #4
	movs r2, #0xb
	bl sub_80AD51C
	ldr r0, _0809BCFC  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809BCF4
	movs r0, #0x6b
	bl m4aSongNumStart
_0809BCF4:
	movs r0, #0
	bl sub_80ACA84
	b _0809BE1A
	.align 2, 0
_0809BCFC: .4byte gRAMChapterData
_0809BD00:
	movs r2, #1
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	beq _0809BD90
	ldr r0, [r6, #0x34]
	asrs r0, r0, #3
	adds r0, #1
	ands r0, r2
	lsls r0, r0, #2
	adds r1, r6, #0
	adds r1, #0x2c
	adds r1, r1, r0
	ldr r0, [r1]
	bl GetUnitItemCount
	adds r4, r0, #0
	ldr r2, [r6, #0x34]
	str r2, [r6, #0x38]
	asrs r0, r2, #3
	lsls r1, r0, #3
	subs r1, r1, r0
	lsls r1, r1, #4
	adds r1, #0x10
	movs r0, #7
	ands r2, r0
	lsls r2, r2, #4
	adds r2, #0x48
	movs r0, #0
	movs r3, #0
	bl sub_80AC9D4
	cmp r4, #4
	bgt _0809BD50
	ldr r0, [r6, #0x34]
	adds r0, #8
	movs r1, #8
	ands r0, r1
	adds r0, r0, r4
	b _0809BD58
_0809BD50:
	ldr r0, [r6, #0x34]
	adds r0, #8
	movs r1, #0xf
	ands r0, r1
_0809BD58:
	str r0, [r6, #0x34]
	ldr r1, [r6, #0x34]
	asrs r2, r1, #3
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #4
	adds r0, #0x10
	movs r2, #7
	ands r1, r2
	lsls r1, r1, #4
	adds r1, #0x48
	movs r3, #0x80
	lsls r3, r3, #4
	movs r2, #0xb
	bl sub_80AD51C
	ldr r0, _0809BD8C  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809BE1A
	movs r0, #0x6a
	bl m4aSongNumStart
	b _0809BE1A
	.align 2, 0
_0809BD8C: .4byte gRAMChapterData
_0809BD90:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0809BDB8
	adds r0, r6, #0
	bl Proc_Break
	ldr r0, _0809BDB4  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809BE1A
	movs r0, #0x6b
	bl m4aSongNumStart
	b _0809BE1A
	.align 2, 0
_0809BDB4: .4byte gRAMChapterData
_0809BDB8:
	adds r0, r6, #0
	bl sub_809B564
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809BE1A
	ldr r1, [r6, #0x34]
	asrs r2, r1, #3
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #4
	adds r0, #0x10
	movs r5, #7
	ands r1, r5
	lsls r1, r1, #4
	adds r1, #0x48
	movs r3, #0x80
	lsls r3, r3, #4
	movs r2, #0xb
	bl sub_80AD51C
	ldr r0, [r6, #0x3c]
	cmp r0, #0xff
	beq _0809BE1A
	ldr r2, [r6, #0x34]
	asrs r4, r2, #3
	lsls r1, r4, #2
	adds r0, r6, #0
	adds r0, #0x2c
	adds r0, r0, r1
	ldr r0, [r0]
	adds r3, r5, #0
	ands r3, r2
	lsls r1, r3, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r2, [r0]
	cmp r2, #0
	beq _0809BE1A
	lsls r0, r4, #3
	subs r0, r0, r4
	lsls r0, r0, #4
	adds r0, #0x10
	lsls r1, r3, #4
_0809BE10:
	adds r1, #0x48
	bl StartItemHelpBox
	ldr r0, [r6, #0x34]
_0809BE18:
	str r0, [r6, #0x3c]
_0809BE1A:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_809BB34

	THUMB_FUNC_START sub_809BE24
sub_809BE24: @ 0x0809BE24
	push {lr}
	bl EndBG3Slider_
	movs r0, #0
	bl DeleteFaceByIndex
	movs r0, #1
	bl DeleteFaceByIndex
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_809BE24

	THUMB_FUNC_START sub_809BE3C
sub_809BE3C: @ 0x0809BE3C
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r1, r2, #0
	ldr r0, _0809BE5C  @ gUnknown_08A1901C
	bl Proc_StartBlocking
	str r4, [r0, #0x2c]
	str r5, [r0, #0x30]
	movs r1, #1
	negs r1, r1
	str r1, [r0, #0x40]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0809BE5C: .4byte gUnknown_08A1901C

	THUMB_FUNC_END sub_809BE3C

	THUMB_FUNC_START sub_809BE60
sub_809BE60: @ 0x0809BE60
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	adds r1, r3, #0
	ldr r0, _0809BE7C  @ gUnknown_08A1901C
	bl Proc_StartBlocking
	str r4, [r0, #0x2c]
	str r5, [r0, #0x30]
	str r6, [r0, #0x40]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0809BE7C: .4byte gUnknown_08A1901C

	THUMB_FUNC_END sub_809BE60

	THUMB_FUNC_START sub_809BE80
sub_809BE80: @ 0x0809BE80
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	ldr r5, _0809BEAC  @ gKeyStatusPtr
	ldr r0, [r5]
	ldrh r1, [r0, #6]
	movs r7, #0x40
	adds r0, r7, #0
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	cmp r6, #0
	beq _0809BEC2
	ldr r0, [r4, #0x2c]
	bl GetUnitItemCount
	adds r2, r0, #0
	ldr r0, [r4, #0x30]
	cmp r0, #0
	ble _0809BEB0
	subs r0, #1
	str r0, [r4, #0x30]
	b _0809BEEE
	.align 2, 0
_0809BEAC: .4byte gKeyStatusPtr
_0809BEB0:
	ldr r0, [r5]
	ldrh r1, [r0, #8]
	adds r0, r7, #0
	ands r0, r1
	cmp r0, #0
	beq _0809BF08
	subs r0, r2, #1
	str r0, [r4, #0x30]
	b _0809BEEE
_0809BEC2:
	movs r7, #0x80
	adds r0, r7, #0
	ands r0, r1
	cmp r0, #0
	beq _0809BF08
	ldr r0, [r4, #0x2c]
	bl GetUnitItemCount
	subs r0, #1
	ldr r1, [r4, #0x30]
	cmp r1, r0
	bge _0809BEE0
	adds r0, r1, #1
	str r0, [r4, #0x30]
	b _0809BEEE
_0809BEE0:
	ldr r0, [r5]
	ldrh r1, [r0, #8]
	adds r0, r7, #0
	ands r0, r1
	cmp r0, #0
	beq _0809BF08
	str r6, [r4, #0x30]
_0809BEEE:
	ldr r0, _0809BF04  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809BF00
	movs r0, #0x66
	bl m4aSongNumStart
_0809BF00:
	movs r0, #1
	b _0809BF0A
	.align 2, 0
_0809BF04: .4byte gRAMChapterData
_0809BF08:
	movs r0, #0
_0809BF0A:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_809BE80

	THUMB_FUNC_START sub_809BF10
sub_809BF10: @ 0x0809BF10
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	mov r8, r0
	ldr r6, _0809BF78  @ gUnknown_02013498
	adds r5, r6, #0
	movs r4, #7
_0809BF20:
	adds r0, r5, #0
	bl Text_Clear
	adds r5, #8
	subs r4, #1
	cmp r4, #0
	bge _0809BF20
	ldr r0, _0809BF7C  @ 0x000004E9
	bl GetStringFromIndex
	adds r1, r6, #0
	adds r6, #8
	ldr r5, _0809BF80  @ gUnknown_02023D88
	movs r7, #0
	str r7, [sp]
	str r0, [sp, #4]
	adds r0, r1, #0
	adds r1, r5, #0
	movs r2, #3
	movs r3, #0
	bl DrawTextInline
	mov r0, r8
	bl UnitHasMagicRank
	lsls r0, r0, #0x18
	asrs r4, r0, #0x18
	cmp r4, #0
	beq _0809BF88
	ldr r0, _0809BF84  @ 0x000004FF
	bl GetStringFromIndex
	adds r2, r6, #0
	adds r6, #8
	adds r1, r5, #0
	adds r1, #0x80
	str r7, [sp]
	str r0, [sp, #4]
	adds r0, r2, #0
	movs r2, #3
	movs r3, #0
	bl DrawTextInline
	b _0809BFA4
	.align 2, 0
_0809BF78: .4byte gUnknown_02013498
_0809BF7C: .4byte 0x000004E9
_0809BF80: .4byte gUnknown_02023D88
_0809BF84: .4byte 0x000004FF
_0809BF88:
	ldr r0, _0809C090  @ 0x000004FE
	bl GetStringFromIndex
	adds r2, r6, #0
	adds r6, #8
	adds r1, r5, #0
	adds r1, #0x80
	str r4, [sp]
	str r0, [sp, #4]
	adds r0, r2, #0
	movs r2, #3
	movs r3, #0
	bl DrawTextInline
_0809BFA4:
	ldr r0, _0809C094  @ 0x000004EC
	bl GetStringFromIndex
	adds r1, r6, #0
	adds r6, #8
	ldr r7, _0809C098  @ gUnknown_02023E88
	movs r5, #0
	str r5, [sp]
	str r0, [sp, #4]
	adds r0, r1, #0
	adds r1, r7, #0
	movs r2, #3
	movs r3, #0
	bl DrawTextInline
	ldr r0, _0809C09C  @ 0x000004ED
	bl GetStringFromIndex
	adds r2, r6, #0
	adds r6, #8
	adds r1, r7, #0
	adds r1, #0x80
	str r5, [sp]
	str r0, [sp, #4]
	adds r0, r2, #0
	movs r2, #3
	movs r3, #0
	bl DrawTextInline
	ldr r0, _0809C0A0  @ 0x000004EE
	bl GetStringFromIndex
	adds r2, r6, #0
	adds r6, #8
	adds r1, r7, #0
	subs r1, #0xf2
	str r5, [sp]
	str r0, [sp, #4]
	adds r0, r2, #0
	movs r2, #3
	movs r3, #0
	bl DrawTextInline
	ldr r0, _0809C0A4  @ 0x000004EF
	bl GetStringFromIndex
	adds r2, r6, #0
	adds r6, #8
	adds r1, r7, #0
	subs r1, #0x72
	str r5, [sp]
	str r0, [sp, #4]
	adds r0, r2, #0
	movs r2, #3
	movs r3, #0
	bl DrawTextInline
	movs r0, #0x9e
	lsls r0, r0, #3
	bl GetStringFromIndex
	adds r2, r6, #0
	adds r6, #8
	adds r1, r7, #0
	adds r1, #0xe
	str r5, [sp]
	str r0, [sp, #4]
	adds r0, r2, #0
	movs r2, #3
	movs r3, #0
	bl DrawTextInline
	ldr r0, _0809C0A8  @ 0x000004F7
	bl GetStringFromIndex
	adds r2, r6, #0
	adds r6, #8
	adds r1, r7, #0
	adds r1, #0x8e
	str r5, [sp]
	str r0, [sp, #4]
	adds r0, r2, #0
	movs r2, #3
	movs r3, #0
	bl DrawTextInline
	mov r1, r8
	ldr r0, [r1, #4]
	ldrh r0, [r0]
	bl GetStringFromIndex
	adds r4, r0, #0
	movs r0, #0x40
	adds r1, r4, #0
	bl GetStringTextCenteredPos
	adds r3, r0, #0
	adds r0, r6, #0
	ldr r2, _0809C0AC  @ 0xFFFFFE8A
	adds r1, r7, r2
	str r5, [sp]
	str r4, [sp, #4]
	movs r2, #0
	bl DrawTextInline
	ldr r1, _0809C0B0  @ 0xFFFFFE82
	adds r0, r7, r1
	movs r1, #3
	movs r2, #0x24
	movs r3, #0x25
	bl sub_8004D5C
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809C090: .4byte 0x000004FE
_0809C094: .4byte 0x000004EC
_0809C098: .4byte gUnknown_02023E88
_0809C09C: .4byte 0x000004ED
_0809C0A0: .4byte 0x000004EE
_0809C0A4: .4byte 0x000004EF
_0809C0A8: .4byte 0x000004F7
_0809C0AC: .4byte 0xFFFFFE8A
_0809C0B0: .4byte 0xFFFFFE82

	THUMB_FUNC_END sub_809BF10

	THUMB_FUNC_START sub_809C0B4
sub_809C0B4: @ 0x0809C0B4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x2c
	adds r5, r0, #0
	mov r8, r1
	movs r0, #2
	bl UnpackUiBarPalette
	add r4, sp, #0xc
	adds r0, r5, #0
	bl GetUnitCurrentHp
	adds r2, r0, #0
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r3, r0, #3
	movs r0, #0xb
	ldrsb r0, [r5, r0]
	movs r1, #0xc0
	ands r0, r1
	cmp r0, #0x80
	beq _0809C0E8
	adds r0, r3, #0
	movs r1, #0x3c
	b _0809C0EC
_0809C0E8:
	adds r0, r2, #0
	movs r1, #5
_0809C0EC:
	bl __divsi3
	str r0, [r4]
	adds r0, r5, #0
	bl GetUnitPower
	adds r1, r0, #0
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	ldr r1, [r5, #4]
	ldrb r1, [r1, #0x14]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl __divsi3
	str r0, [sp, #0x10]
	adds r0, r5, #0
	bl GetUnitSkill
	adds r1, r0, #0
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	ldr r1, [r5, #4]
	ldrb r1, [r1, #0x15]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl __divsi3
	str r0, [sp, #0x14]
	adds r0, r5, #0
	bl GetUnitSpeed
	adds r1, r0, #0
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	ldr r1, [r5, #4]
	ldrb r1, [r1, #0x16]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl __divsi3
	str r0, [sp, #0x18]
	adds r0, r5, #0
	bl GetUnitLuck
	adds r1, r0, #0
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	movs r1, #0x1e
	bl __divsi3
	str r0, [sp, #0x1c]
	adds r0, r5, #0
	bl GetUnitDefense
	adds r1, r0, #0
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	ldr r1, [r5, #4]
	ldrb r1, [r1, #0x17]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl __divsi3
	str r0, [sp, #0x20]
	adds r0, r5, #0
	bl GetUnitResistance
	adds r1, r0, #0
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	ldr r4, [r5, #4]
	movs r1, #0x18
	ldrsb r1, [r4, r1]
	bl __divsi3
	str r0, [sp, #0x24]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	ldr r0, [r5]
	ldrb r0, [r0, #0x13]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r1, r1, r0
	movs r0, #0x1a
	ldrsb r0, [r5, r0]
	adds r1, r1, r0
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	movs r1, #0x19
	ldrsb r1, [r4, r1]
	bl __divsi3
	str r0, [sp, #0x28]
	movs r5, #0
	add r6, sp, #0xc
	movs r7, #0xe0
	lsls r7, r7, #7
_0809C1BE:
	mov r4, r8
	asrs r4, r5
	movs r0, #1
	ands r4, r0
	cmp r4, #0
	beq _0809C200
	lsls r0, r7, #0xf
	lsrs r0, r0, #0x14
	movs r2, #3
	ands r2, r5
	lsls r2, r2, #6
	adds r2, #0x92
	asrs r3, r5, #2
	lsls r1, r3, #3
	subs r1, r1, r3
	adds r2, r2, r1
	lsls r2, r2, #1
	ldr r1, _0809C1FC  @ gBG0TilemapBuffer
	adds r2, r2, r1
	movs r1, #0x18
	str r1, [sp]
	ldr r1, [r6]
	str r1, [sp, #4]
	movs r1, #0
	str r1, [sp, #8]
	movs r1, #4
	movs r3, #0xc0
	lsls r3, r3, #6
	bl sub_8086B2C
	b _0809C22E
	.align 2, 0
_0809C1FC: .4byte gBG0TilemapBuffer
_0809C200:
	lsls r0, r7, #0xf
	lsrs r0, r0, #0x14
	movs r2, #3
	ands r2, r5
	lsls r2, r2, #6
	adds r2, #0x92
	asrs r3, r5, #2
	lsls r1, r3, #3
	subs r1, r1, r3
	adds r2, r2, r1
	lsls r2, r2, #1
	ldr r1, _0809C250  @ gBG0TilemapBuffer
	adds r2, r2, r1
	movs r1, #0x18
	str r1, [sp]
	ldr r1, [r6]
	str r1, [sp, #4]
	str r4, [sp, #8]
	movs r1, #4
	movs r3, #0x80
	lsls r3, r3, #6
	bl sub_8086B2C
_0809C22E:
	adds r6, #4
	movs r0, #0x80
	lsls r0, r0, #1
	adds r7, r7, r0
	adds r5, #1
	cmp r5, #7
	ble _0809C1BE
	movs r0, #1
	bl BG_EnableSyncByMask
	add sp, #0x2c
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809C250: .4byte gBG0TilemapBuffer

	THUMB_FUNC_END sub_809C0B4

	THUMB_FUNC_START sub_809C254
sub_809C254: @ 0x0809C254
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	ldr r6, _0809C274  @ gUnknown_02023D90
	bl GetUnitCurrentHp
	adds r2, r0, #0
	movs r0, #0xb
	ldrsb r0, [r4, r0]
	movs r1, #0xc0
	ands r0, r1
	cmp r0, #0x80
	bne _0809C278
	cmp r2, #0x78
	beq _0809C27C
	b _0809C280
	.align 2, 0
_0809C274: .4byte gUnknown_02023D90
_0809C278:
	cmp r2, #0x3c
	bne _0809C280
_0809C27C:
	movs r5, #4
	b _0809C282
_0809C280:
	movs r5, #2
_0809C282:
	adds r0, r4, #0
	bl GetUnitCurrentHp
	adds r2, r0, #0
	adds r0, r6, #0
	adds r1, r5, #0
	bl DrawDecNumber
	ldr r5, _0809C3E0  @ gUnknown_02023E10
	adds r0, r4, #0
	bl GetUnitPower
	ldr r1, [r4, #4]
	ldrb r1, [r1, #0x14]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	movs r6, #2
	cmp r0, r1
	bne _0809C2AA
	movs r6, #4
_0809C2AA:
	adds r0, r4, #0
	bl GetUnitPower
	adds r2, r0, #0
	adds r0, r5, #0
	adds r1, r6, #0
	bl DrawDecNumber
	adds r7, r5, #0
	adds r7, #0x80
	adds r0, r4, #0
	bl GetUnitSkill
	ldr r1, [r4, #4]
	ldrb r1, [r1, #0x15]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	movs r6, #2
	cmp r0, r1
	bne _0809C2D4
	movs r6, #4
_0809C2D4:
	adds r0, r4, #0
	bl GetUnitSkill
	adds r2, r0, #0
	adds r0, r7, #0
	adds r1, r6, #0
	bl DrawDecNumber
	movs r0, #0x80
	lsls r0, r0, #1
	adds r7, r5, r0
	adds r0, r4, #0
	bl GetUnitSpeed
	ldr r1, [r4, #4]
	ldrb r1, [r1, #0x16]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	movs r6, #2
	cmp r0, r1
	bne _0809C300
	movs r6, #4
_0809C300:
	adds r0, r4, #0
	bl GetUnitSpeed
	adds r2, r0, #0
	adds r0, r7, #0
	adds r1, r6, #0
	bl DrawDecNumber
	adds r7, r5, #0
	subs r7, #0x72
	adds r0, r4, #0
	bl GetUnitLuck
	movs r6, #2
	cmp r0, #0x1e
	bne _0809C322
	movs r6, #4
_0809C322:
	adds r0, r4, #0
	bl GetUnitLuck
	adds r2, r0, #0
	adds r0, r7, #0
	adds r1, r6, #0
	bl DrawDecNumber
	adds r7, r5, #0
	adds r7, #0xe
	adds r0, r4, #0
	bl GetUnitDefense
	ldr r1, [r4, #4]
	ldrb r1, [r1, #0x17]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	movs r6, #2
	cmp r0, r1
	bne _0809C34C
	movs r6, #4
_0809C34C:
	adds r0, r4, #0
	bl GetUnitDefense
	adds r2, r0, #0
	adds r0, r7, #0
	adds r1, r6, #0
	bl DrawDecNumber
	adds r7, r5, #0
	adds r7, #0x8e
	adds r0, r4, #0
	bl GetUnitResistance
	ldr r1, [r4, #4]
	ldrb r1, [r1, #0x18]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	movs r6, #2
	cmp r0, r1
	bne _0809C376
	movs r6, #4
_0809C376:
	adds r0, r4, #0
	bl GetUnitResistance
	adds r2, r0, #0
	adds r0, r7, #0
	adds r1, r6, #0
	bl DrawDecNumber
	movs r1, #0x87
	lsls r1, r1, #1
	adds r6, r5, r1
	ldr r2, [r4, #4]
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	ldr r0, [r4]
	ldrb r0, [r0, #0x13]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r1, r1, r0
	movs r0, #0x1a
	ldrsb r0, [r4, r0]
	adds r3, r1, r0
	movs r0, #0x19
	ldrsb r0, [r2, r0]
	movs r1, #2
	cmp r3, r0
	bne _0809C3AE
	movs r1, #4
_0809C3AE:
	adds r0, r6, #0
	adds r2, r3, #0
	bl DrawDecNumber
	ldr r1, _0809C3E4  @ 0xFFFFFEFE
	adds r0, r5, r1
	movs r1, #1
	movs r2, #1
	movs r3, #0
	bl TileMap_FillRect
	ldr r1, _0809C3E8  @ 0xFFFFFF00
	adds r0, r5, r1
	movs r2, #8
	ldrsb r2, [r4, r2]
	movs r1, #2
	bl DrawDecNumber
	movs r0, #4
	bl BG_EnableSyncByMask
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809C3E0: .4byte gUnknown_02023E10
_0809C3E4: .4byte 0xFFFFFEFE
_0809C3E8: .4byte 0xFFFFFF00

	THUMB_FUNC_END sub_809C254

	THUMB_FUNC_START sub_809C3EC
sub_809C3EC: @ 0x0809C3EC
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r6, r0, #0
	adds r5, r1, #0
	ldr r4, _0809C46C  @ gUnknown_02013560
	adds r0, r4, #0
	bl Text_Clear
	adds r0, r4, #0
	adds r0, #8
	bl Text_Clear
	adds r4, #0x20
	adds r0, r4, #0
	bl Text_Clear
	movs r0, #1
	negs r0, r0
	cmp r5, r0
	beq _0809C4A2
	lsls r1, r5, #1
	adds r0, r6, #0
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r4, [r0]
	adds r0, r4, #0
	bl GetItemUseDescId
	adds r5, r0, #0
	mov r1, sp
	ldr r0, _0809C470  @ gUnknown_08205C64
	ldm r0!, {r2, r3, r7}
	stm r1!, {r2, r3, r7}
	cmp r5, #0
	beq _0809C4A2
	adds r0, r6, #0
	adds r1, r4, #0
	bl CanUnitUseItemPrepScreen
	cmp r0, #0
	beq _0809C478
	ldr r0, [sp]
	movs r1, #0
	bl Text_SetColorId
	ldr r0, [sp, #4]
	movs r1, #0
	bl Text_SetColorId
	ldr r0, [sp, #8]
	movs r1, #0
	bl Text_SetColorId
	adds r0, r5, #0
	bl GetStringFromIndex
	adds r1, r0, #0
	ldr r2, _0809C474  @ gUnknown_02022FC6
	mov r0, sp
	movs r3, #3
	bl sub_8008A3C
	b _0809C4A2
	.align 2, 0
_0809C46C: .4byte gUnknown_02013560
_0809C470: .4byte gUnknown_08205C64
_0809C474: .4byte gUnknown_02022FC6
_0809C478:
	ldr r0, [sp]
	movs r1, #1
	bl Text_SetColorId
	ldr r0, [sp, #4]
	movs r1, #1
	bl Text_SetColorId
	ldr r0, [sp, #8]
	movs r1, #1
	bl Text_SetColorId
	adds r0, r5, #0
	bl GetStringFromIndex
	adds r1, r0, #0
	ldr r2, _0809C4B0  @ gUnknown_02022FC6
	mov r0, sp
	movs r3, #3
	bl sub_8008A3C
_0809C4A2:
	movs r0, #1
	bl BG_EnableSyncByMask
	add sp, #0xc
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809C4B0: .4byte gUnknown_02022FC6

	THUMB_FUNC_END sub_809C3EC

	THUMB_FUNC_START sub_809C4B4
sub_809C4B4: @ 0x0809C4B4
	push {lr}
	sub sp, #4
	movs r3, #0xc8
	lsls r3, r3, #8
	ldr r0, [r0, #0x2c]
	ldr r0, [r0, #4]
	ldrb r0, [r0, #4]
	str r0, [sp]
	movs r0, #0
	movs r1, #0x78
	movs r2, #0xa
	bl sub_8027C48
	bl SMS_FlushDirect
	add sp, #4
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_809C4B4

	THUMB_FUNC_START sub_809C4D8
sub_809C4D8: @ 0x0809C4D8
	movs r1, #0
	str r1, [r0, #0x30]
	movs r1, #0xff
	str r1, [r0, #0x38]
	bx lr

	THUMB_FUNC_END sub_809C4D8

	THUMB_FUNC_START sub_809C4E4
sub_809C4E4: @ 0x0809C4E4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x28
	adds r7, r0, #0
	add r1, sp, #8
	ldr r0, _0809C7E0  @ gUnknown_08205C70
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldm r0!, {r2, r3, r6}
	stm r1!, {r2, r3, r6}
	ldm r0!, {r4, r6}
	stm r1!, {r4, r6}
	ldr r4, _0809C7E4  @ gLCDControlBuffer
	ldrb r1, [r4]
	movs r0, #8
	negs r0, r0
	ands r0, r1
	strb r0, [r4]
	ldr r0, _0809C7E8  @ gUnknown_08A181E8
	bl SetupBackgrounds
	add r0, sp, #8
	bl SetupFaceGfxData
	movs r0, #0xff
	str r0, [r7, #0x34]
	movs r0, #0
	bl BG_GetMapBuffer
	movs r1, #0
	bl BG_Fill
	movs r0, #1
	bl BG_GetMapBuffer
	movs r1, #0
	bl BG_Fill
	movs r0, #2
	bl BG_GetMapBuffer
	movs r1, #0
	bl BG_Fill
	ldrb r1, [r4, #0xc]
	movs r2, #4
	negs r2, r2
	adds r0, r2, #0
	ands r0, r1
	movs r1, #1
	orrs r0, r1
	strb r0, [r4, #0xc]
	ldrb r1, [r4, #0x10]
	adds r0, r2, #0
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	strb r0, [r4, #0x10]
	ldrb r0, [r4, #0x14]
	ands r2, r0
	strb r2, [r4, #0x14]
	ldrb r0, [r4, #0x18]
	movs r1, #3
	orrs r0, r1
	strb r0, [r4, #0x18]
	bl Font_InitForUIDefault
	bl ResetIconGraphics_
	bl LoadUiFrameGraphics
	bl LoadObjUIGfx
	bl SetupMapSpritesPalettes
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
	ldr r0, _0809C7EC  @ 0x06014000
	movs r1, #1
	negs r1, r1
	bl LoadDialogueBoxGfx
	movs r0, #4
	bl LoadIconPalettes
	bl sub_8095A1C
	ldr r5, _0809C7F0  @ gUnknown_02013510
	movs r4, #4
_0809C5B6:
	adds r0, r5, #0
	movs r1, #7
	bl Text_Allocate
	adds r5, #8
	subs r4, #1
	cmp r4, #0
	bge _0809C5B6
	ldr r5, _0809C7F4  @ gUnknown_02013498
	movs r4, #7
_0809C5CA:
	adds r0, r5, #0
	movs r1, #3
	bl Text_Init
	adds r5, #8
	subs r4, #1
	cmp r4, #0
	bge _0809C5CA
	ldr r0, _0809C7F4  @ gUnknown_02013498
	mov sl, r0
	adds r0, #0x40
	movs r1, #8
	bl Text_Init
	mov r0, sl
	adds r0, #0xc8
	movs r1, #0xf
	bl Text_Init
	mov r0, sl
	adds r0, #0xd0
	movs r1, #0xf
	bl Text_Init
	mov r0, sl
	adds r0, #0xe8
	movs r1, #0xf
	bl Text_Init
	mov r0, sl
	adds r0, #0xd8
	movs r1, #0xe
	bl Text_Init
	mov r0, sl
	adds r0, #0xe0
	movs r1, #8
	bl Text_Init
	ldr r0, [r7, #0x2c]
	bl sub_809BF10
	ldr r0, [r7, #0x2c]
	bl sub_809C254
	ldr r0, [r7, #0x2c]
	movs r1, #0
	bl sub_809C0B4
	ldr r0, [r7, #0x2c]
	bl GetUnitPortraitId
	adds r1, r0, #0
	movs r3, #4
	negs r3, r3
	ldr r0, _0809C7F8  @ 0x00000203
	str r0, [sp]
	movs r0, #0
	movs r2, #0x40
	bl sub_80064F4
	movs r0, #0xc0
	lsls r0, r0, #7
	movs r1, #5
	bl sub_8098C3C
	movs r0, #0x80
	lsls r0, r0, #4
	movs r1, #0xa
	bl sub_8098C8C
	ldr r0, _0809C7FC  @ gUnknown_08A1BAB8
	ldr r1, _0809C800  @ 0x06000440
	bl CopyDataWithPossibleUncomp
	ldr r0, _0809C804  @ gUnknown_08A1BAE4
	ldr r4, _0809C808  @ gUnknown_02020188
	adds r1, r4, #0
	bl CopyDataWithPossibleUncomp
	ldr r0, _0809C80C  @ gBG1TilemapBuffer
	movs r2, #0x80
	lsls r2, r2, #5
	adds r1, r4, #0
	bl CallARM_FillTileRect
	movs r0, #7
	bl BG_EnableSyncByMask
	movs r1, #0xe0
	lsls r1, r1, #4
	movs r3, #0xc0
	lsls r3, r3, #4
	movs r2, #0
	str r2, [sp]
	str r7, [sp, #4]
	movs r0, #0xd
	movs r2, #0xf
	bl sub_80ADB7C
	movs r1, #0x28
	negs r1, r1
	movs r2, #1
	negs r2, r2
	movs r0, #0
	movs r3, #1
	bl sub_80ADBFC
	ldr r0, [r7, #0x2c]
	ldr r0, [r0]
	ldrh r0, [r0]
	bl GetStringFromIndex
	adds r4, r0, #0
	bl GetStringTextWidth
	movs r3, #0x30
	subs r3, r3, r0
	lsrs r0, r3, #0x1f
	adds r3, r3, r0
	asrs r3, r3, #1
	movs r0, #6
	str r0, [sp]
	str r4, [sp, #4]
	movs r0, #0
	ldr r1, _0809C810  @ gBG0TilemapBuffer
	movs r2, #0
	bl DrawTextInline
	adds r0, r7, #0
	bl sub_80AC9C0
	adds r0, r7, #0
	bl sub_80AD47C
	movs r0, #0xc0
	lsls r0, r0, #3
	movs r1, #1
	bl sub_80AD4A0
	ldr r0, _0809C814  @ sub_809C4B4
	adds r1, r7, #0
	bl Get6CDifferedLoop6C
	ldr r6, _0809C7E4  @ gLCDControlBuffer
	ldrb r0, [r6, #1]
	movs r3, #0x20
	mov ip, r3
	mov r4, ip
	orrs r0, r4
	movs r1, #0x41
	negs r1, r1
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r6, #1]
	adds r1, r6, #0
	adds r1, #0x2d
	movs r0, #0x68
	strb r0, [r1]
	adds r1, #4
	movs r0, #0x5e
	strb r0, [r1]
	subs r1, #5
	movs r0, #0xf0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0x92
	strb r0, [r1]
	movs r0, #0x34
	adds r0, r0, r6
	mov r9, r0
	ldrb r1, [r0]
	movs r2, #1
	mov r8, r2
	mov r3, r8
	orrs r1, r3
	movs r5, #2
	orrs r1, r5
	movs r4, #4
	orrs r1, r4
	movs r3, #8
	orrs r1, r3
	movs r2, #0x10
	orrs r1, r2
	ldr r6, _0809C818  @ gUnknown_030030B6
	ldrb r0, [r6]
	mov r6, r8
	orrs r0, r6
	orrs r0, r5
	orrs r0, r4
	orrs r0, r3
	orrs r0, r2
	mov r2, ip
	orrs r1, r2
	mov r3, r9
	strb r1, [r3]
	movs r1, #0x21
	negs r1, r1
	ands r0, r1
	ldr r4, _0809C818  @ gUnknown_030030B6
	strb r0, [r4]
	movs r0, #3
	movs r1, #0
	movs r2, #0
	movs r3, #8
	bl SetSpecialColorEffectsParameters
	movs r6, #0
	str r6, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #1
	bl sub_8001ED0
	adds r0, r7, #0
	bl NewGreenTextColorManager
	movs r0, #0xc0
	movs r1, #0x90
	movs r2, #9
	adds r3, r7, #0
	bl StartHelpPromptSprite
	ldr r0, [r7, #0x2c]
	ldr r1, [r7, #0x30]
	bl sub_809C3EC
	mov r1, sl
	adds r1, #0x78
	ldr r2, [r7, #0x2c]
	ldr r0, _0809C81C  @ gUnknown_02022EEC
	movs r3, #1
	bl sub_809B74C
	ldr r1, [r7, #0x30]
	asrs r2, r1, #3
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #4
	adds r0, #0x10
	movs r2, #7
	ands r1, r2
	lsls r1, r1, #4
	adds r1, #0x48
	movs r2, #0xb
	movs r3, #0x80
	lsls r3, r3, #4
	bl sub_80AD51C
	ldr r0, [r7, #0x2c]
	bl GetUnitSMSId
	bl SMS_RegisterUsage
	bl SMS_FlushIndirect
	add sp, #0x28
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809C7E0: .4byte gUnknown_08205C70
_0809C7E4: .4byte gLCDControlBuffer
_0809C7E8: .4byte gUnknown_08A181E8
_0809C7EC: .4byte 0x06014000
_0809C7F0: .4byte gUnknown_02013510
_0809C7F4: .4byte gUnknown_02013498
_0809C7F8: .4byte 0x00000203
_0809C7FC: .4byte gUnknown_08A1BAB8
_0809C800: .4byte 0x06000440
_0809C804: .4byte gUnknown_08A1BAE4
_0809C808: .4byte gUnknown_02020188
_0809C80C: .4byte gBG1TilemapBuffer
_0809C810: .4byte gBG0TilemapBuffer
_0809C814: .4byte sub_809C4B4
_0809C818: .4byte gUnknown_030030B6
_0809C81C: .4byte gUnknown_02022EEC

	THUMB_FUNC_END sub_809C4E4

	THUMB_FUNC_START sub_809C820
sub_809C820: @ 0x0809C820
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x38]
	cmp r0, #0xff
	beq _0809C848
	ldr r0, _0809C844  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0x81
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0809C8F0
	bl CloseHelpBox
	movs r0, #0xff
	b _0809C938
	.align 2, 0
_0809C844: .4byte gKeyStatusPtr
_0809C848:
	ldr r0, _0809C8A8  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	bne _0809C91C
	movs r5, #1
	adds r0, r5, #0
	ands r0, r1
	cmp r0, #0
	beq _0809C8C8
	ldr r0, [r4, #0x2c]
	ldr r2, [r4, #0x30]
	lsls r2, r2, #1
	adds r1, r0, #0
	adds r1, #0x1e
	adds r1, r1, r2
	ldrh r1, [r1]
	bl CanUnitUseItemPrepScreen
	cmp r0, #0
	beq _0809C8B0
	ldr r2, [r4, #0x30]
	str r2, [r4, #0x34]
	lsls r2, r2, #4
	adds r2, #0x48
	movs r0, #0
	movs r1, #0x10
	movs r3, #0
	bl sub_80AC9D4
	str r5, [r4, #0x3c]
	ldr r0, _0809C8AC  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809C89E
	movs r0, #0x6a
	bl m4aSongNumStart
_0809C89E:
	adds r0, r4, #0
	movs r1, #2
	bl Proc_Goto
	b _0809C93A
	.align 2, 0
_0809C8A8: .4byte gKeyStatusPtr
_0809C8AC: .4byte gRAMChapterData
_0809C8B0:
	ldr r0, _0809C8C4  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809C93A
	movs r0, #0x6c
	bl m4aSongNumStart
	b _0809C93A
	.align 2, 0
_0809C8C4: .4byte gRAMChapterData
_0809C8C8:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0809C8F0
	adds r0, r4, #0
	movs r1, #6
	bl Proc_Goto
	ldr r0, _0809C8EC  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809C93A
	movs r0, #0x6b
	bl m4aSongNumStart
	b _0809C93A
	.align 2, 0
_0809C8EC: .4byte gRAMChapterData
_0809C8F0:
	adds r0, r4, #0
	bl sub_809BE80
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809C93A
	ldr r1, [r4, #0x30]
	lsls r1, r1, #4
	adds r1, #0x48
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x10
	movs r2, #0xb
	bl sub_80AD51C
	ldr r0, [r4, #0x2c]
	ldr r1, [r4, #0x30]
	bl sub_809C3EC
	ldr r0, [r4, #0x38]
	cmp r0, #0xff
	beq _0809C93A
_0809C91C:
	ldr r0, [r4, #0x2c]
	ldr r3, [r4, #0x30]
	lsls r1, r3, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r2, [r0]
	cmp r2, #0
	beq _0809C93A
	lsls r1, r3, #4
	adds r1, #0x48
	movs r0, #0x10
	bl StartItemHelpBox
	ldr r0, [r4, #0x30]
_0809C938:
	str r0, [r4, #0x38]
_0809C93A:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_809C820

	THUMB_FUNC_START sub_809C940
sub_809C940: @ 0x0809C940
	push {lr}
	bl EndBG3Slider_
	movs r0, #0
	bl DeleteFaceByIndex
	movs r0, #1
	bl DeleteFaceByIndex
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_809C940

	THUMB_FUNC_START sub_809C958
sub_809C958: @ 0x0809C958
	push {r4, r5, r6, lr}
	sub sp, #8
	ldr r4, _0809C9C4  @ gUnknown_02013570
	adds r0, r4, #0
	bl Text_Clear
	ldr r0, _0809C9C8  @ 0x00000585
	bl GetStringFromIndex
	adds r1, r4, #0
	adds r4, #8
	ldr r5, _0809C9CC  @ gUnknown_0202400A
	movs r6, #0
	str r6, [sp]
	str r0, [sp, #4]
	adds r0, r1, #0
	adds r1, r5, #0
	movs r2, #0
	movs r3, #0
	bl DrawTextInline
	adds r0, r4, #0
	bl Text_Clear
	ldr r0, _0809C9D0  @ 0x00000843
	bl GetStringFromIndex
	adds r5, #0x84
	str r6, [sp]
	str r0, [sp, #4]
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0
	movs r3, #0
	bl DrawTextInline
	ldr r0, _0809C9D4  @ 0x00000844
	bl GetStringFromIndex
	str r6, [sp]
	str r0, [sp, #4]
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0
	movs r3, #0x20
	bl DrawTextInline
	movs r0, #4
	bl BG_EnableSyncByMask
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0809C9C4: .4byte gUnknown_02013570
_0809C9C8: .4byte 0x00000585
_0809C9CC: .4byte gUnknown_0202400A
_0809C9D0: .4byte 0x00000843
_0809C9D4: .4byte 0x00000844

	THUMB_FUNC_END sub_809C958

	THUMB_FUNC_START sub_809C9D8
sub_809C9D8: @ 0x0809C9D8
	push {lr}
	ldr r0, _0809C9F0  @ gUnknown_0202400A
	movs r1, #0xd
	movs r2, #4
	movs r3, #0
	bl TileMap_FillRect
	movs r0, #4
	bl BG_EnableSyncByMask
	pop {r0}
	bx r0
	.align 2, 0
_0809C9F0: .4byte gUnknown_0202400A

	THUMB_FUNC_END sub_809C9D8

	THUMB_FUNC_START sub_809C9F4
sub_809C9F4: @ 0x0809C9F4
	push {r4, lr}
	adds r4, r0, #0
	bl sub_809C958
	ldr r0, [r4, #0x3c]
	lsls r0, r0, #5
	adds r0, #0x94
	movs r3, #0x80
	lsls r3, r3, #4
	movs r1, #0x78
	movs r2, #0
	bl sub_80AD51C
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_809C9F4

	THUMB_FUNC_START sub_809CA14
sub_809CA14: @ 0x0809CA14
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r7, [r4, #0x3c]
	ldr r0, _0809CA6C  @ 0x0000A440
	str r0, [sp]
	movs r0, #0x80
	movs r1, #0x64
	movs r2, #0xc
	movs r3, #4
	bl sub_809A31C
	ldr r5, _0809CA70  @ gKeyStatusPtr
	ldr r3, [r5]
	ldrh r1, [r3, #8]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0809CA78
	ldr r1, [r4, #0x30]
	lsls r1, r1, #4
	adds r1, #0x48
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x10
	movs r2, #0xb
	bl sub_80AD51C
	movs r0, #0
	bl sub_80ACA84
	bl sub_809C9D8
	ldr r0, _0809CA74  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809CADA
	movs r0, #0x6b
	bl m4aSongNumStart
	b _0809CADA
	.align 2, 0
_0809CA6C: .4byte 0x0000A440
_0809CA70: .4byte gKeyStatusPtr
_0809CA74: .4byte gRAMChapterData
_0809CA78:
	movs r6, #1
	adds r2, r6, #0
	ands r2, r1
	cmp r2, #0
	beq _0809CAE8
	bl sub_809C9D8
	ldr r0, [r4, #0x3c]
	cmp r0, #0
	bne _0809CAB0
	bl sub_80AD564
	ldr r0, _0809CAAC  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809CAA2
	movs r0, #0x6a
	bl m4aSongNumStart
_0809CAA2:
	adds r0, r4, #0
	movs r1, #3
	bl Proc_Goto
	b _0809CB2A
	.align 2, 0
_0809CAAC: .4byte gRAMChapterData
_0809CAB0:
	ldr r1, [r4, #0x30]
	lsls r1, r1, #4
	adds r1, #0x48
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x10
	movs r2, #0xb
	bl sub_80AD51C
	ldr r0, _0809CAE4  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809CAD4
	movs r0, #0x6b
	bl m4aSongNumStart
_0809CAD4:
	movs r0, #0
	bl sub_80ACA84
_0809CADA:
	adds r0, r4, #0
	bl Proc_Break
	b _0809CB2A
	.align 2, 0
_0809CAE4: .4byte gRAMChapterData
_0809CAE8:
	ldrh r1, [r3, #6]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _0809CAF4
	str r2, [r4, #0x3c]
_0809CAF4:
	ldr r0, [r5]
	ldrh r1, [r0, #6]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _0809CB02
	str r6, [r4, #0x3c]
_0809CB02:
	ldr r0, [r4, #0x3c]
	cmp r7, r0
	beq _0809CB2A
	lsls r0, r0, #5
	adds r0, #0x94
	movs r3, #0x80
	lsls r3, r3, #4
	movs r1, #0x78
	movs r2, #0
	bl sub_80AD51C
	ldr r0, _0809CB34  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809CB2A
	movs r0, #0x67
	bl m4aSongNumStart
_0809CB2A:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809CB34: .4byte gRAMChapterData

	THUMB_FUNC_END sub_809CA14

	THUMB_FUNC_START sub_809CB38
sub_809CB38: @ 0x0809CB38
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x2c]
	ldr r1, [r4, #0x30]
	lsls r1, r1, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r0, [r0]
	bl GetItemIndex
	cmp r0, #0x8a
	beq _0809CB78
	cmp r0, #0x8a
	bgt _0809CB62
	cmp r0, #0x64
	blt _0809CBA0
	cmp r0, #0x68
	ble _0809CB78
	cmp r0, #0x88
	beq _0809CB78
	b _0809CBA0
_0809CB62:
	cmp r0, #0xb7
	beq _0809CB98
	cmp r0, #0xb7
	bgt _0809CB74
	cmp r0, #0x99
	bgt _0809CBA0
	cmp r0, #0x97
	blt _0809CBA0
	b _0809CB78
_0809CB74:
	cmp r0, #0xc1
	bne _0809CBA0
_0809CB78:
	ldr r0, _0809CB94  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809CB8A
	movs r0, #0x6a
	bl m4aSongNumStart
_0809CB8A:
	adds r0, r4, #0
	movs r1, #5
	bl Proc_Goto
	b _0809CBA0
	.align 2, 0
_0809CB94: .4byte gRAMChapterData
_0809CB98:
	adds r0, r4, #0
	movs r1, #4
	bl Proc_Goto
_0809CBA0:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_809CB38

	THUMB_FUNC_START sub_809CBA8
sub_809CBA8: @ 0x0809CBA8
	push {r4, lr}
	adds r4, r0, #0
	bl EndBG3Slider_
	bl Font_InitForUIDefault
	movs r0, #0
	bl SetupBackgrounds
	bl EndGreenTextColorManager
	bl GetThread2SkipStack
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [r4, #0x40]
	bl ResetFaces
	bl EndHelpPromptSprite
	ldr r2, _0809CC38  @ gLCDControlBuffer
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
	adds r1, r2, #0
	adds r1, #0x34
	ldrb r0, [r1]
	movs r3, #0x20
	orrs r0, r3
	strb r0, [r1]
	adds r2, #0x36
	ldrb r0, [r2]
	orrs r0, r3
	strb r0, [r2]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #8
	bl SetSpecialColorEffectsParameters
	bl sub_80ADC90
	bl DeleteEach6CDifferedLoop
	movs r0, #0
	bl DeleteFaceByIndex
	movs r0, #0
	bl sub_80ACA84
	ldr r0, [r4, #0x2c]
	ldr r2, [r4, #0x30]
	movs r1, #1
	movs r3, #0
	bl sub_802F664
	ldr r1, _0809CC3C  @ gBattleStats
	movs r0, #0x88
	lsls r0, r0, #1
	strh r0, [r1]
	bl BeginBattleAnimations
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809CC38: .4byte gLCDControlBuffer
_0809CC3C: .4byte gBattleStats

	THUMB_FUNC_END sub_809CBA8

	THUMB_FUNC_START sub_809CC40
sub_809CC40: @ 0x0809CC40
	push {r4, lr}
	adds r4, r0, #0
	bl GetThread2SkipStack
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, [r4, #0x40]
	cmp r1, r0
	bne _0809CC58
	adds r0, r4, #0
	bl Proc_Break
_0809CC58:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_809CC40

	THUMB_FUNC_START sub_809CC60
sub_809CC60: @ 0x0809CC60
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x2c]
	bl GetUnitItemCount
	adds r5, r0, #0
	ldr r0, [r4, #0x2c]
	ldr r0, [r0]
	ldrb r0, [r0, #4]
	bl sub_80953C0
	cmp r5, #0
	bne _0809CC84
	adds r0, r4, #0
	movs r1, #7
	bl Proc_Goto
	b _0809CC94
_0809CC84:
	ldr r0, [r4, #0x30]
	cmp r0, r5
	blt _0809CC8E
	subs r0, #1
	str r0, [r4, #0x30]
_0809CC8E:
	adds r0, r4, #0
	bl Proc_Break
_0809CC94:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_809CC60

	THUMB_FUNC_START sub_809CC9C
sub_809CC9C: @ 0x0809CC9C
	push {lr}
	movs r0, #0x80
	lsls r0, r0, #1
	bl Sound_SetSEVolume
	bl CheckSomethingSomewhere
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809CCB8
	movs r0, #0x38
	bl sub_8002620
	b _0809CCDA
_0809CCB8:
	ldr r0, _0809CCD0  @ gUnknown_03005280
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0809CCD4
	bl sub_800270C
	bl sub_80B9FC0
	b _0809CCDA
	.align 2, 0
_0809CCD0: .4byte gUnknown_03005280
_0809CCD4:
	movs r0, #0x34
	bl sub_8002620
_0809CCDA:
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_809CC9C

	THUMB_FUNC_START sub_809CCE0
sub_809CCE0: @ 0x0809CCE0
	push {lr}
	sub sp, #4
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #0
	str r0, [sp]
	movs r2, #0
	movs r3, #0x10
	bl sub_80029E8
	add sp, #4
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_809CCE0

	THUMB_FUNC_START sub_809CCFC
sub_809CCFC: @ 0x0809CCFC
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0809CD10  @ gUnknown_08A19064
	bl Proc_StartBlocking
	str r4, [r0, #0x2c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809CD10: .4byte gUnknown_08A19064

	THUMB_FUNC_END sub_809CCFC

	THUMB_FUNC_START sub_809CD14
sub_809CD14: @ 0x0809CD14
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r6, r0, #0
	adds r5, r1, #0
	adds r7, r2, #0
	adds r0, r3, #0
	bl GetStringFromIndex
	mov r9, r0
	ldr r0, [sp, #0x28]
	bl GetItemIconId
	mov r8, r0
	mov r0, r9
	bl GetStringTextWidth
	mov sl, r0
	mov r0, r8
	cmp r0, #0
	beq _0809CD60
	lsls r4, r7, #5
	adds r4, r4, r5
	lsls r4, r4, #1
	ldr r0, _0809CDCC  @ gBG2TilemapBuffer
	adds r4, r4, r0
	ldr r0, [sp, #0x28]
	bl GetItemIconId
	adds r1, r0, #0
	movs r2, #0x80
	lsls r2, r2, #7
	adds r0, r4, #0
	bl DrawIcon
_0809CD60:
	ldr r4, _0809CDD0  @ gUnknown_02013570
	adds r0, r4, #0
	bl Text_Clear
	lsls r0, r7, #5
	mov r1, r8
	cmp r1, #0
	beq _0809CD72
	adds r0, #2
_0809CD72:
	adds r0, r0, r5
	lsls r0, r0, #1
	ldr r1, _0809CDCC  @ gBG2TilemapBuffer
	adds r1, r0, r1
	movs r0, #0
	str r0, [sp]
	mov r0, r9
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r2, #0
	movs r3, #0
	bl DrawTextInline
	movs r0, #4
	bl BG_EnableSyncByMask
	lsls r0, r5, #3
	subs r0, #4
	str r0, [r6, #0x40]
	lsls r0, r7, #3
	subs r0, #4
	str r0, [r6, #0x44]
	mov r0, sl
	cmp r0, #0
	bge _0809CDA6
	adds r0, #7
_0809CDA6:
	asrs r1, r0, #3
	adds r0, r1, #1
	str r0, [r6, #0x48]
	mov r0, r8
	cmp r0, #0
	beq _0809CDB6
	adds r0, r1, #3
	str r0, [r6, #0x48]
_0809CDB6:
	movs r0, #2
	str r0, [r6, #0x4c]
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809CDCC: .4byte gBG2TilemapBuffer
_0809CDD0: .4byte gUnknown_02013570

	THUMB_FUNC_END sub_809CD14

	THUMB_FUNC_START sub_809CDD4
sub_809CDD4: @ 0x0809CDD4
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r7, r0, #0
	ldr r4, [r7, #0x14]
	movs r0, #0xe0
	lsls r0, r0, #1
	movs r1, #3
	movs r2, #0
	adds r3, r7, #0
	bl sub_807EDF8
	ldr r0, [r4, #0x2c]
	bl GetUnitCurrentHp
	adds r1, r7, #0
	adds r1, #0x30
	strb r0, [r1]
	ldr r0, [r4, #0x2c]
	bl GetUnitPower
	adds r1, r7, #0
	adds r1, #0x31
	strb r0, [r1]
	ldr r0, [r4, #0x2c]
	bl GetUnitSkill
	adds r1, r7, #0
	adds r1, #0x32
	strb r0, [r1]
	ldr r0, [r4, #0x2c]
	bl GetUnitSpeed
	adds r1, r7, #0
	adds r1, #0x33
	strb r0, [r1]
	ldr r0, [r4, #0x2c]
	bl GetUnitLuck
	adds r1, r7, #0
	adds r1, #0x34
	strb r0, [r1]
	ldr r0, [r4, #0x2c]
	bl GetUnitDefense
	adds r1, r7, #0
	adds r1, #0x35
	strb r0, [r1]
	ldr r0, [r4, #0x2c]
	bl GetUnitResistance
	adds r1, r7, #0
	adds r1, #0x36
	strb r0, [r1]
	ldr r1, [r4, #0x2c]
	ldr r2, [r1, #4]
	ldr r0, [r1]
	ldrb r0, [r0, #0x13]
	ldrb r2, [r2, #0x11]
	adds r0, r0, r2
	ldrb r1, [r1, #0x1a]
	adds r1, r1, r0
	adds r0, r7, #0
	adds r0, #0x37
	strb r1, [r0]
	ldr r0, [r4, #0x2c]
	ldr r1, [r4, #0x30]
	lsls r3, r1, #1
	adds r2, r0, #0
	adds r2, #0x1e
	adds r2, r2, r3
	ldrh r5, [r2]
	bl ApplyStatBoostItem
	adds r6, r0, #0
	ldr r0, [r4, #0x2c]
	movs r1, #0
	bl sub_809C0B4
	ldr r0, [r4, #0x2c]
	bl sub_809C254
	ldr r0, [r4, #0x2c]
	bl GetUnitCurrentHp
	adds r1, r7, #0
	adds r1, #0x38
	strb r0, [r1]
	ldr r0, [r4, #0x2c]
	bl GetUnitPower
	adds r1, r7, #0
	adds r1, #0x39
	strb r0, [r1]
	ldr r0, [r4, #0x2c]
	bl GetUnitSkill
	adds r1, r7, #0
	adds r1, #0x3a
	strb r0, [r1]
	ldr r0, [r4, #0x2c]
	bl GetUnitSpeed
	adds r1, r7, #0
	adds r1, #0x3b
	strb r0, [r1]
	ldr r0, [r4, #0x2c]
	bl GetUnitLuck
	adds r1, r7, #0
	adds r1, #0x3c
	strb r0, [r1]
	ldr r0, [r4, #0x2c]
	bl GetUnitDefense
	adds r1, r7, #0
	adds r1, #0x3d
	strb r0, [r1]
	ldr r0, [r4, #0x2c]
	bl GetUnitResistance
	adds r1, r7, #0
	adds r1, #0x3e
	strb r0, [r1]
	ldr r1, [r4, #0x2c]
	ldr r2, [r1, #4]
	ldr r0, [r1]
	ldrb r0, [r0, #0x13]
	ldrb r2, [r2, #0x11]
	adds r0, r0, r2
	ldrb r1, [r1, #0x1a]
	adds r1, r1, r0
	adds r0, r7, #0
	adds r0, #0x3f
	strb r1, [r0]
	str r5, [sp]
	adds r0, r7, #0
	movs r1, #0xe
	movs r2, #0xe
	adds r3, r6, #0
	bl sub_809CD14
	movs r4, #0
_0809CEF0:
	adds r0, r7, #0
	adds r0, #0x30
	adds r3, r0, r4
	adds r0, #8
	adds r2, r0, r4
	ldrb r0, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	beq _0809CF1E
	asrs r1, r4, #2
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #3
	adds r0, #0xb0
	movs r1, #3
	ands r1, r4
	lsls r1, r1, #4
	adds r1, #0x2a
	ldrb r2, [r2]
	ldrb r3, [r3]
	subs r2, r2, r3
	bl sub_807EFF0
_0809CF1E:
	adds r4, #1
	cmp r4, #7
	ble _0809CEF0
	movs r0, #0x78
	str r0, [r7, #0x2c]
	ldr r0, _0809CF44  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809CF3A
	movs r0, #0x5a
	bl m4aSongNumStart
_0809CF3A:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809CF44: .4byte gRAMChapterData

	THUMB_FUNC_END sub_809CDD4

	THUMB_FUNC_START sub_809CF48
sub_809CF48: @ 0x0809CF48
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r0, [r5, #0x40]
	ldr r1, [r5, #0x44]
	ldr r2, [r5, #0x48]
	ldr r3, [r5, #0x4c]
	ldr r4, _0809CF84  @ 0x0000A440
	str r4, [sp]
	bl sub_809A31C
	ldr r0, [r5, #0x2c]
	subs r0, #1
	str r0, [r5, #0x2c]
	cmp r0, #0
	beq _0809CF76
	ldr r0, _0809CF88  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #3
	ands r0, r1
	cmp r0, #0
	beq _0809CF7C
_0809CF76:
	adds r0, r5, #0
	bl Proc_Break
_0809CF7C:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0809CF84: .4byte 0x0000A440
_0809CF88: .4byte gKeyStatusPtr

	THUMB_FUNC_END sub_809CF48

	THUMB_FUNC_START sub_809CF8C
sub_809CF8C: @ 0x0809CF8C
	push {r4, r5, lr}
	ldr r4, [r0, #0x14]
	ldr r0, [r4, #0x2c]
	bl GetUnitItemCount
	adds r5, r0, #0
	ldr r0, _0809CFB4  @ gUnknown_02024044
	movs r1, #0xe
	movs r2, #1
	movs r3, #0
	bl TileMap_FillRect
	cmp r5, #0
	bne _0809CFB8
	adds r0, r4, #0
	movs r1, #6
	bl Proc_Goto
	b _0809CFD4
	.align 2, 0
_0809CFB4: .4byte gUnknown_02024044
_0809CFB8:
	ldr r0, [r4, #0x30]
	cmp r0, r5
	blt _0809CFC2
	subs r0, #1
	str r0, [r4, #0x30]
_0809CFC2:
	ldr r1, [r4, #0x30]
	lsls r1, r1, #4
	adds r1, #0x48
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x10
	movs r2, #0xb
	bl sub_80AD51C
_0809CFD4:
	ldr r0, _0809D008  @ gUnknown_02022EEC
	ldr r1, _0809D00C  @ gUnknown_02013510
	ldr r2, [r4, #0x2c]
	movs r3, #1
	bl sub_809B74C
	ldr r0, [r4, #0x2c]
	ldr r1, [r4, #0x30]
	bl sub_809C3EC
	movs r0, #0
	bl sub_80ACA84
	bl sub_807EE74
	movs r0, #5
	bl BG_EnableSyncByMask
	ldr r0, _0809D010  @ 0x06014000
	movs r1, #1
	negs r1, r1
	bl LoadDialogueBoxGfx
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0809D008: .4byte gUnknown_02022EEC
_0809D00C: .4byte gUnknown_02013510
_0809D010: .4byte 0x06014000

	THUMB_FUNC_END sub_809CF8C

	THUMB_FUNC_START sub_809D014
sub_809D014: @ 0x0809D014
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r6, r0, #0
	adds r5, r1, #0
	adds r7, r2, #0
	movs r0, #0x1f
	bl GetStringFromIndex
	mov r9, r0
	ldr r0, [sp, #0x28]
	bl GetItemIconId
	mov r8, r0
	mov r0, r9
	bl GetStringTextWidth
	mov sl, r0
	mov r0, r8
	cmp r0, #0
	beq _0809D060
	lsls r4, r7, #5
	adds r4, r4, r5
	lsls r4, r4, #1
	ldr r0, _0809D0CC  @ gBG2TilemapBuffer
	adds r4, r4, r0
	ldr r0, [sp, #0x28]
	bl GetItemIconId
	adds r1, r0, #0
	movs r2, #0x80
	lsls r2, r2, #7
	adds r0, r4, #0
	bl DrawIcon
_0809D060:
	ldr r4, _0809D0D0  @ gUnknown_02013570
	adds r0, r4, #0
	bl Text_Clear
	lsls r0, r7, #5
	mov r1, r8
	cmp r1, #0
	beq _0809D072
	adds r0, #2
_0809D072:
	adds r0, r0, r5
	lsls r0, r0, #1
	ldr r1, _0809D0CC  @ gBG2TilemapBuffer
	adds r1, r0, r1
	movs r0, #0
	str r0, [sp]
	mov r0, r9
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r2, #0
	movs r3, #0
	bl DrawTextInline
	movs r0, #4
	bl BG_EnableSyncByMask
	lsls r0, r5, #3
	subs r0, #4
	str r0, [r6, #0x34]
	lsls r0, r7, #3
	subs r0, #4
	str r0, [r6, #0x38]
	mov r0, sl
	cmp r0, #0
	bge _0809D0A6
	adds r0, #7
_0809D0A6:
	asrs r1, r0, #3
	adds r0, r1, #1
	str r0, [r6, #0x3c]
	mov r0, r8
	cmp r0, #0
	beq _0809D0B6
	adds r0, r1, #3
	str r0, [r6, #0x3c]
_0809D0B6:
	movs r0, #2
	str r0, [r6, #0x40]
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809D0CC: .4byte gBG2TilemapBuffer
_0809D0D0: .4byte gUnknown_02013570

	THUMB_FUNC_END sub_809D014

	THUMB_FUNC_START sub_809D0D4
sub_809D0D4: @ 0x0809D0D4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r7, r0, #0
	ldr r4, [r7, #0x14]
	movs r0, #0xe0
	lsls r0, r0, #1
	movs r1, #3
	movs r2, #0
	adds r3, r7, #0
	bl sub_807EDF8
	ldr r0, [r4, #0x2c]
	ldrb r0, [r0, #8]
	movs r1, #0x30
	adds r1, r1, r7
	mov r8, r1
	strb r0, [r1]
	ldr r0, [r4, #0x2c]
	ldr r1, [r4, #0x30]
	lsls r3, r1, #1
	adds r2, r0, #0
	adds r2, #0x1e
	adds r2, r2, r3
	ldrh r5, [r2]
	bl sub_802F978
	adds r6, r0, #0
	ldr r0, [r4, #0x2c]
	movs r1, #0
	bl sub_809C0B4
	ldr r0, [r4, #0x2c]
	bl sub_809C254
	ldr r0, [r4, #0x2c]
	ldrb r0, [r0, #8]
	adds r4, r7, #0
	adds r4, #0x31
	strb r0, [r4]
	str r5, [sp]
	adds r0, r7, #0
	movs r1, #0x11
	movs r2, #0xe
	adds r3, r6, #0
	bl sub_809D014
	mov r0, r8
	movs r1, #0
	ldrsb r1, [r0, r1]
	movs r0, #0
	ldrsb r0, [r4, r0]
	cmp r1, r0
	beq _0809D154
	adds r2, r0, #0
	mov r1, r8
	movs r0, #0
	ldrsb r0, [r1, r0]
	subs r2, r2, r0
	movs r0, #0xb0
	movs r1, #0x1a
	bl sub_807EFF0
_0809D154:
	movs r0, #0x78
	str r0, [r7, #0x2c]
	ldr r0, _0809D178  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809D16A
	movs r0, #0x5a
	bl m4aSongNumStart
_0809D16A:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809D178: .4byte gRAMChapterData

	THUMB_FUNC_END sub_809D0D4

	THUMB_FUNC_START sub_809D17C
sub_809D17C: @ 0x0809D17C
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r0, [r5, #0x34]
	ldr r1, [r5, #0x38]
	ldr r2, [r5, #0x3c]
	ldr r3, [r5, #0x40]
	ldr r4, _0809D1B8  @ 0x0000A440
	str r4, [sp]
	bl sub_809A31C
	ldr r0, [r5, #0x2c]
	subs r0, #1
	str r0, [r5, #0x2c]
	cmp r0, #0
	beq _0809D1AA
	ldr r0, _0809D1BC  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #3
	ands r0, r1
	cmp r0, #0
	beq _0809D1B0
_0809D1AA:
	adds r0, r5, #0
	bl Proc_Break
_0809D1B0:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0809D1B8: .4byte 0x0000A440
_0809D1BC: .4byte gKeyStatusPtr

	THUMB_FUNC_END sub_809D17C

	THUMB_FUNC_START sub_809D1C0
sub_809D1C0: @ 0x0809D1C0
	push {r4, r5, lr}
	ldr r4, [r0, #0x14]
	ldr r0, [r4, #0x2c]
	bl GetUnitItemCount
	adds r5, r0, #0
	ldr r0, _0809D1E8  @ gUnknown_0202404A
	movs r1, #0xc
	movs r2, #1
	movs r3, #0
	bl TileMap_FillRect
	cmp r5, #0
	bne _0809D1EC
	adds r0, r4, #0
	movs r1, #6
	bl Proc_Goto
	b _0809D208
	.align 2, 0
_0809D1E8: .4byte gUnknown_0202404A
_0809D1EC:
	ldr r0, [r4, #0x30]
	cmp r0, r5
	blt _0809D1F6
	subs r0, #1
	str r0, [r4, #0x30]
_0809D1F6:
	ldr r1, [r4, #0x30]
	lsls r1, r1, #4
	adds r1, #0x48
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x10
	movs r2, #0xb
	bl sub_80AD51C
_0809D208:
	ldr r0, _0809D238  @ gUnknown_02022EEC
	ldr r1, _0809D23C  @ gUnknown_02013510
	ldr r2, [r4, #0x2c]
	movs r3, #1
	bl sub_809B74C
	ldr r0, [r4, #0x2c]
	ldr r1, [r4, #0x30]
	bl sub_809C3EC
	movs r0, #0
	bl sub_80ACA84
	movs r0, #5
	bl BG_EnableSyncByMask
	ldr r0, _0809D240  @ 0x06014000
	movs r1, #1
	negs r1, r1
	bl LoadDialogueBoxGfx
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0809D238: .4byte gUnknown_02022EEC
_0809D23C: .4byte gUnknown_02013510
_0809D240: .4byte 0x06014000

	THUMB_FUNC_END sub_809D1C0

	THUMB_FUNC_START sub_809D244
sub_809D244: @ 0x0809D244
	push {r4, r5, r6, lr}
	sub sp, #4
	ldr r6, _0809D270  @ 0x0000DFC0
	movs r5, #0x30
	movs r4, #3
_0809D24E:
	str r6, [sp]
	movs r0, #4
	adds r1, r5, #0
	movs r2, #0x10
	ldr r3, _0809D274  @ gObject_32x16
	bl PutSpriteExt
	adds r6, #4
	adds r5, #0x20
	subs r4, #1
	cmp r4, #0
	bge _0809D24E
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0809D270: .4byte 0x0000DFC0
_0809D274: .4byte gObject_32x16

	THUMB_FUNC_END sub_809D244

	THUMB_FUNC_START sub_809D278
sub_809D278: @ 0x0809D278
	push {r4, r5, lr}
	sub sp, #0xc
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _0809D2B8  @ sub_809D244
	bl Get6CDifferedLoop6C
	ldr r0, _0809D2BC  @ gUnknown_08A191F4
	lsls r4, r4, #2
	adds r4, r4, r0
	ldr r0, [r4]
	ldr r1, _0809D2C0  @ gUnknown_08A19200
	ldr r1, [r1]
	bl GetStringFromIndexInBuffer
	adds r2, r0, #0
	movs r0, #0xf0
	lsls r0, r0, #7
	movs r1, #2
	str r1, [sp]
	movs r1, #3
	str r1, [sp, #4]
	str r5, [sp, #8]
	movs r1, #0xd
	movs r3, #1
	bl sub_80ADD24
	add sp, #0xc
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0809D2B8: .4byte sub_809D244
_0809D2BC: .4byte gUnknown_08A191F4
_0809D2C0: .4byte gUnknown_08A19200

	THUMB_FUNC_END sub_809D278

	THUMB_FUNC_START StoreConvoyWeaponIconGraphics
StoreConvoyWeaponIconGraphics: @ 0x0809D2C4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0809D2F0  @ gUnknown_08A1A3FC
	lsls r1, r1, #5
	movs r2, #0x20
	bl CopyToPaletteBuffer
	ldr r0, _0809D2F4  @ gUnknown_08A1A0A4
	movs r2, #0xc0
	lsls r2, r2, #0x13
	adds r1, r4, r2
	bl CopyDataWithPossibleUncomp
	ldr r0, _0809D2F8  @ gUnknown_08A1A23C
	ldr r1, _0809D2FC  @ 0x06000200
	adds r4, r4, r1
	adds r1, r4, #0
	bl CopyDataWithPossibleUncomp
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809D2F0: .4byte gUnknown_08A1A3FC
_0809D2F4: .4byte gUnknown_08A1A0A4
_0809D2F8: .4byte gUnknown_08A1A23C
_0809D2FC: .4byte 0x06000200

	THUMB_FUNC_END StoreConvoyWeaponIconGraphics

	THUMB_FUNC_START sub_809D300
sub_809D300: @ 0x0809D300
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	str r0, [sp]
	mov sl, r1
	str r2, [sp, #4]
	str r3, [sp, #8]
	mov r0, sl
	movs r1, #0xc
	movs r2, #0x1f
	movs r3, #0
	bl TileMap_FillRect
	ldr r1, _0809D350  @ gUnknown_02012F56
	ldrh r0, [r1]
	cmp r0, #0
	bne _0809D354
	ldr r0, [sp]
	bl Text_Clear
	movs r0, #0xb5
	lsls r0, r0, #3
	bl GetStringFromIndex
	adds r3, r0, #0
	ldr r0, [sp]
	movs r1, #0
	movs r2, #1
	bl Text_InsertString
	mov r1, sl
	adds r1, #6
	ldr r0, [sp]
	bl Text_Draw
	b _0809D3FE
	.align 2, 0
_0809D350: .4byte gUnknown_02012F56
_0809D354:
	ldr r6, [sp, #4]
	adds r0, r6, #7
	cmp r6, r0
	bge _0809D3FE
	ldrh r1, [r1]
	cmp r6, r1
	bge _0809D3FE
_0809D362:
	movs r0, #7
	ands r0, r6
	lsls r0, r0, #3
	ldr r1, [sp]
	adds r1, r1, r0
	mov r8, r1
	ldr r1, _0809D410  @ gUnknown_020122D4
	lsls r0, r6, #2
	adds r0, r0, r1
	ldrh r7, [r0, #2]
	ldr r0, [sp, #8]
	adds r1, r7, #0
	bl IsItemDisplayUsable
	movs r1, #0
	mov r9, r1
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0809D38C
	movs r0, #1
	mov r9, r0
_0809D38C:
	mov r0, r8
	bl Text_Clear
	adds r0, r7, #0
	bl GetItemName
	adds r3, r0, #0
	mov r0, r8
	movs r1, #0
	mov r2, r9
	bl Text_InsertString
	lsls r5, r6, #1
	movs r0, #0x1f
	ands r5, r0
	lsls r5, r5, #6
	adds r4, r5, #2
	add r4, sl
	adds r0, r7, #0
	bl GetItemIconId
	adds r1, r0, #0
	adds r0, r4, #0
	movs r2, #0x80
	lsls r2, r2, #7
	bl DrawIcon
	adds r1, r5, #6
	add r1, sl
	mov r0, r8
	bl Text_Draw
	adds r5, #0x18
	mov r1, sl
	adds r4, r1, r5
	movs r5, #1
	mov r0, r9
	cmp r0, #0
	bne _0809D3DC
	movs r5, #2
_0809D3DC:
	adds r0, r7, #0
	bl GetItemUses
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	bl DrawDecNumber
	adds r6, #1
	ldr r0, [sp, #4]
	adds r0, #7
	cmp r6, r0
	bge _0809D3FE
	ldr r0, _0809D414  @ gUnknown_02012F56
	ldrh r0, [r0]
	cmp r6, r0
	blt _0809D362
_0809D3FE:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809D410: .4byte gUnknown_020122D4
_0809D414: .4byte gUnknown_02012F56

	THUMB_FUNC_END sub_809D300

	THUMB_FUNC_START sub_809D418
sub_809D418: @ 0x0809D418
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	adds r5, r1, #0
	adds r7, r5, #0
	adds r0, r5, #7
	cmp r5, r0
	bge _0809D468
	ldr r0, _0809D474  @ gUnknown_02012F56
	ldrh r0, [r0]
	cmp r5, r0
	bge _0809D468
	ldr r1, _0809D478  @ gUnknown_020122D4
	lsls r0, r5, #2
	adds r6, r0, r1
_0809D438:
	ldrh r0, [r6, #2]
	lsls r4, r5, #1
	movs r1, #0x1f
	ands r4, r1
	lsls r4, r4, #6
	adds r4, #2
	add r4, r8
	bl GetItemIconId
	adds r1, r0, #0
	adds r0, r4, #0
	movs r2, #0x80
	lsls r2, r2, #7
	bl DrawIcon
	adds r6, #4
	adds r5, #1
	adds r0, r7, #7
	cmp r5, r0
	bge _0809D468
	ldr r0, _0809D474  @ gUnknown_02012F56
	ldrh r0, [r0]
	cmp r5, r0
	blt _0809D438
_0809D468:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809D474: .4byte gUnknown_02012F56
_0809D478: .4byte gUnknown_020122D4

	THUMB_FUNC_END sub_809D418

	THUMB_FUNC_START sub_809D47C
sub_809D47C: @ 0x0809D47C
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	adds r5, r0, #0
	mov r9, r1
	ldr r0, _0809D528  @ gUnknown_02012F56
	ldrh r0, [r0]
	cmp r0, r2
	ble _0809D51C
	lsls r4, r2, #1
	movs r0, #0x1f
	ands r4, r0
	movs r0, #7
	ands r0, r2
	lsls r0, r0, #3
	adds r7, r5, r0
	ldr r1, _0809D52C  @ gUnknown_020122D4
	lsls r0, r2, #2
	adds r0, r0, r1
	ldrh r6, [r0, #2]
	adds r0, r3, #0
	adds r1, r6, #0
	bl IsItemDisplayUsable
	movs r1, #0
	mov r8, r1
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0809D4BC
	movs r0, #1
	mov r8, r0
_0809D4BC:
	lsls r4, r4, #6
	add r4, r9
	adds r0, r4, #0
	movs r1, #0xc
	movs r2, #1
	movs r3, #0
	bl TileMap_FillRect
	adds r0, r7, #0
	bl Text_Clear
	adds r0, r6, #0
	bl GetItemName
	adds r3, r0, #0
	adds r0, r7, #0
	movs r1, #0
	mov r2, r8
	bl Text_InsertString
	adds r5, r4, #2
	adds r0, r6, #0
	bl GetItemIconId
	adds r1, r0, #0
	movs r2, #0x80
	lsls r2, r2, #7
	adds r0, r5, #0
	bl DrawIcon
	adds r1, r4, #6
	adds r0, r7, #0
	bl Text_Draw
	adds r4, #0x18
	movs r5, #1
	mov r1, r8
	cmp r1, #0
	bne _0809D50C
	movs r5, #2
_0809D50C:
	adds r0, r6, #0
	bl GetItemUses
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	bl DrawDecNumber
_0809D51C:
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809D528: .4byte gUnknown_02012F56
_0809D52C: .4byte gUnknown_020122D4

	THUMB_FUNC_END sub_809D47C

	THUMB_FUNC_START sub_809D530
sub_809D530: @ 0x0809D530
	push {lr}
	ldr r0, _0809D568  @ 0x04000006
	ldrh r0, [r0]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0xa0
	bls _0809D542
	movs r2, #0
_0809D542:
	cmp r2, #0xc
	bne _0809D552
	ldr r1, _0809D56C  @ 0x04000050
	movs r0, #0xc8
	strh r0, [r1]
	adds r1, #4
	movs r0, #8
	strh r0, [r1]
_0809D552:
	cmp r2, #0x34
	beq _0809D55A
	cmp r2, #0
	bne _0809D564
_0809D55A:
	ldr r0, _0809D56C  @ 0x04000050
	movs r1, #0
	strh r1, [r0]
	adds r0, #4
	strh r1, [r0]
_0809D564:
	pop {r0}
	bx r0
	.align 2, 0
_0809D568: .4byte 0x04000006
_0809D56C: .4byte 0x04000050

	THUMB_FUNC_END sub_809D530

	THUMB_FUNC_START sub_809D570
sub_809D570: @ 0x0809D570
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0
	strh r0, [r4, #0x38]
	movs r0, #0xff
	strh r0, [r4, #0x36]
	ldr r0, [r4, #0x2c]
	bl GetUnitItemCount
	cmp r0, #0
	bne _0809D58E
	adds r1, r4, #0
	adds r1, #0x33
	movs r0, #1
	b _0809D594
_0809D58E:
	adds r1, r4, #0
	adds r1, #0x33
	movs r0, #0
_0809D594:
	strb r0, [r1]
	ldr r0, _0809D5B0  @ gUnknown_03005280
	ldrb r0, [r0]
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	beq _0809D5B4
	bl sub_80C4048
	cmp r0, #0
	beq _0809D5C8
	adds r0, #0x2b
	b _0809D5C6
	.align 2, 0
_0809D5B0: .4byte gUnknown_03005280
_0809D5B4:
	adds r0, r4, #0
	adds r0, #0x30
	ldrb r0, [r0]
	cmp r0, #0
	bne _0809D5D4
	ldr r0, _0809D5D0  @ gUnknown_08A1829C
	bl Proc_Find
	adds r0, #0x32
_0809D5C6:
	ldrb r0, [r0]
_0809D5C8:
	adds r1, r4, #0
	adds r1, #0x35
	strb r0, [r1]
	b _0809D5DA
	.align 2, 0
_0809D5D0: .4byte gUnknown_08A1829C
_0809D5D4:
	adds r0, r4, #0
	adds r0, #0x35
	strb r1, [r0]
_0809D5DA:
	adds r2, r4, #0
	adds r2, #0x32
	movs r1, #0
	movs r0, #4
	strb r0, [r2]
	adds r0, r4, #0
	adds r0, #0x31
	strb r1, [r0]
	movs r3, #0
	adds r1, r4, #0
	adds r1, #0x4c
	adds r0, #9
	movs r2, #8
_0809D5F4:
	strh r3, [r0]
	strh r3, [r1]
	adds r1, #2
	adds r0, #2
	subs r2, #1
	cmp r2, #0
	bge _0809D5F4
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_809D570

	THUMB_FUNC_START sub_809D608
sub_809D608: @ 0x0809D608
	push {r4, lr}
	ldr r4, _0809D638  @ gUnknown_02013648
	ldr r1, _0809D63C  @ 0x06011000
	adds r0, r4, #0
	movs r2, #0xb
	bl InitSomeOtherGraphicsRelatedStruct
	ldr r0, _0809D640  @ gUnknown_0859EF00
	movs r1, #0xd8
	lsls r1, r1, #2
	movs r2, #0x20
	bl CopyToPaletteBuffer
	adds r4, #0x90
	adds r0, r4, #0
	bl Text_Init3
	movs r0, #0
	bl SetFont
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809D638: .4byte gUnknown_02013648
_0809D63C: .4byte 0x06011000
_0809D640: .4byte gUnknown_0859EF00

	THUMB_FUNC_END sub_809D608

	THUMB_FUNC_START sub_809D644
sub_809D644: @ 0x0809D644
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	bl sub_8097CC8
	adds r5, r0, #0
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	ldr r0, [r4, #0x2c]
	bl GetUnitItemCount
	adds r6, r0, #0
	ldr r4, _0809D6BC  @ gUnknown_02013648
	adds r0, r4, #0
	bl SetFont
	movs r0, #0
	bl SetFontGlyphSet
	adds r4, #0x90
	adds r0, r4, #0
	movs r1, #0
	bl Text_80046B4
	adds r7, r4, #0
	movs r4, #0
	cmp r5, #0x64
	beq _0809D67E
	cmp r6, #0
	bne _0809D680
_0809D67E:
	movs r4, #1
_0809D680:
	ldr r0, _0809D6C0  @ 0x0000059E
	bl GetStringFromIndex
	adds r3, r0, #0
	adds r0, r7, #0
	movs r1, #0
	adds r2, r4, #0
	bl Text_InsertString
	ldr r5, _0809D6C4  @ gUnknown_020136D8
	movs r4, #0
	cmp r6, #5
	bne _0809D69C
	movs r4, #1
_0809D69C:
	ldr r0, _0809D6C8  @ 0x0000059F
	bl GetStringFromIndex
	adds r3, r0, #0
	adds r0, r5, #0
	movs r1, #0x40
	adds r2, r4, #0
	bl Text_InsertString
	movs r0, #0
	bl SetFont
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809D6BC: .4byte gUnknown_02013648
_0809D6C0: .4byte 0x0000059E
_0809D6C4: .4byte gUnknown_020136D8
_0809D6C8: .4byte 0x0000059F

	THUMB_FUNC_END sub_809D644

	THUMB_FUNC_START sub_809D6CC
sub_809D6CC: @ 0x0809D6CC
	push {r4, r5, r6, lr}
	sub sp, #8
	movs r0, #0
	bl SetFont
	ldr r6, _0809D77C  @ gUnknown_02022D10
	adds r0, r6, #0
	movs r1, #0xc
	movs r2, #1
	movs r3, #0
	bl TileMap_FillRect
	movs r0, #0xb3
	lsls r0, r0, #3
	bl GetStringFromIndex
	ldr r4, _0809D780  @ gUnknown_02013660
	adds r1, r6, #0
	adds r1, #0xda
	movs r5, #0
	str r5, [sp]
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r2, #0
	movs r3, #2
	bl DrawTextInline
	adds r1, r6, #0
	subs r1, #0x26
	movs r2, #0x9c
	lsls r2, r2, #2
	movs r0, #1
	str r0, [sp]
	movs r0, #0xab
	movs r3, #2
	bl sub_8005988
	movs r0, #0xb4
	lsls r0, r0, #3
	bl GetStringFromIndex
	adds r4, #8
	subs r1, r6, #2
	str r5, [sp]
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r2, #0
	movs r3, #4
	bl DrawTextInline
	adds r5, r6, #0
	adds r5, #0xa
	bl sub_8097CC8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r4, #2
	cmp r0, #0x64
	bne _0809D744
	movs r4, #4
_0809D744:
	bl sub_8097CC8
	adds r2, r0, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_8004B88
	adds r0, r6, #0
	adds r0, #0xc
	movs r1, #0
	movs r2, #0x16
	bl sub_8004B0C
	adds r0, r6, #0
	adds r0, #0x12
	movs r1, #2
	movs r2, #0x64
	bl sub_8004B88
	movs r0, #1
	bl BG_EnableSyncByMask
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0809D77C: .4byte gUnknown_02022D10
_0809D780: .4byte gUnknown_02013660

	THUMB_FUNC_END sub_809D6CC

	THUMB_FUNC_START sub_809D784
sub_809D784: @ 0x0809D784
	push {r4, lr}
	sub sp, #4
	ldr r0, _0809D7C4  @ 0x0000A840
	str r0, [sp]
	movs r0, #0x40
	movs r1, #0x21
	movs r2, #5
	movs r3, #4
	bl sub_809A31C
	ldr r4, _0809D7C8  @ gObject_32x16
	ldr r0, _0809D7CC  @ 0x0000B080
	str r0, [sp]
	movs r0, #4
	movs r1, #0x48
	movs r2, #0x25
	adds r3, r4, #0
	bl PutSpriteExt
	ldr r0, _0809D7D0  @ 0x0000B088
	str r0, [sp]
	movs r0, #4
	movs r1, #0x48
	movs r2, #0x35
	adds r3, r4, #0
	bl PutSpriteExt
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809D7C4: .4byte 0x0000A840
_0809D7C8: .4byte gObject_32x16
_0809D7CC: .4byte 0x0000B080
_0809D7D0: .4byte 0x0000B088

	THUMB_FUNC_END sub_809D784

	THUMB_FUNC_START sub_809D7D4
sub_809D7D4: @ 0x0809D7D4
	push {lr}
	sub sp, #4
	ldr r0, _0809D800  @ 0x0000A840
	str r0, [sp]
	movs r0, #0x40
	movs r1, #0x21
	movs r2, #5
	movs r3, #2
	bl sub_809A31C
	ldr r3, _0809D804  @ gObject_32x16
	ldr r0, _0809D808  @ 0x0000B080
	str r0, [sp]
	movs r0, #4
	movs r1, #0x48
	movs r2, #0x25
	bl PutSpriteExt
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_0809D800: .4byte 0x0000A840
_0809D804: .4byte gObject_32x16
_0809D808: .4byte 0x0000B080

	THUMB_FUNC_END sub_809D7D4

	THUMB_FUNC_START sub_809D80C
sub_809D80C: @ 0x0809D80C
	push {lr}
	sub sp, #4
	ldr r0, _0809D838  @ 0x0000A840
	str r0, [sp]
	movs r0, #0x40
	movs r1, #0x31
	movs r2, #5
	movs r3, #2
	bl sub_809A31C
	ldr r3, _0809D83C  @ gObject_32x16
	ldr r0, _0809D840  @ 0x0000B088
	str r0, [sp]
	movs r0, #4
	movs r1, #0x48
	movs r2, #0x35
	bl PutSpriteExt
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_0809D838: .4byte 0x0000A840
_0809D83C: .4byte gObject_32x16
_0809D840: .4byte 0x0000B088

	THUMB_FUNC_END sub_809D80C

	THUMB_FUNC_START sub_809D844
sub_809D844: @ 0x0809D844
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r6, r0, #0
	adds r7, r6, #0
	adds r7, #0x35
	ldrb r0, [r7]
	lsls r4, r0, #1
	adds r4, r4, r0
	lsls r4, r4, #2
	adds r4, #0x7c
	bl GetGameClock
	ldr r2, _0809D8BC  @ gPaletteBuffer
	lsrs r0, r0, #2
	movs r1, #0xf
	ands r0, r1
	lsls r0, r0, #1
	ldr r1, _0809D8C0  @ gUnknown_08A1BD60
	adds r0, r0, r1
	ldrh r0, [r0]
	ldr r1, _0809D8C4  @ 0x0000029A
	adds r2, r2, r1
	strh r0, [r2]
	bl EnablePaletteSync
	ldr r1, _0809D8C8  @ gUnknown_08A19608
	ldrb r0, [r7]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r3, [r0]
	movs r5, #0x85
	lsls r5, r5, #7
	str r5, [sp]
	movs r0, #4
	adds r1, r4, #0
	movs r2, #0x18
	bl PutSprite
	ldr r3, _0809D8CC  @ gUnknown_08A195F8
	str r5, [sp]
	movs r0, #4
	adds r1, r4, #0
	movs r2, #0x18
	bl PutSprite
	ldrb r0, [r7]
	lsls r0, r0, #1
	adds r6, #0x4c
	adds r6, r6, r0
	ldrh r1, [r6]
	ldr r0, _0809D8D0  @ gUnknown_02012F56
	ldrh r2, [r0]
	movs r0, #0xc
	movs r3, #7
	bl sub_80976CC
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809D8BC: .4byte gPaletteBuffer
_0809D8C0: .4byte gUnknown_08A1BD60
_0809D8C4: .4byte 0x0000029A
_0809D8C8: .4byte gUnknown_08A19608
_0809D8CC: .4byte gUnknown_08A195F8
_0809D8D0: .4byte gUnknown_02012F56

	THUMB_FUNC_END sub_809D844

	THUMB_FUNC_START sub_809D8D4
sub_809D8D4: @ 0x0809D8D4
	push {r4, r5, r6, lr}
	movs r5, #0
	lsls r2, r2, #0xc
	ldr r4, _0809D910  @ 0x0001FFFF
	adds r3, r1, #0
	ands r3, r4
	lsrs r3, r3, #5
	adds r6, r2, r3
	movs r3, #0x80
	lsls r3, r3, #2
	adds r1, r1, r3
	ands r1, r4
	lsrs r1, r1, #5
	adds r2, r2, r1
	adds r3, r0, #0
	adds r3, #0x40
	adds r1, r0, #0
_0809D8F6:
	adds r0, r6, r5
	strh r0, [r1]
	adds r0, r2, r5
	strh r0, [r3]
	adds r3, #2
	adds r1, #2
	adds r5, #1
	cmp r5, #0xe
	ble _0809D8F6
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0809D910: .4byte 0x0001FFFF

	THUMB_FUNC_END sub_809D8D4

	THUMB_FUNC_START sub_809D914
sub_809D914: @ 0x0809D914
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _0809D9F8  @ gLCDControlBuffer
	ldrb r1, [r4]
	movs r0, #8
	negs r0, r0
	ands r0, r1
	strb r0, [r4]
	movs r0, #0
	bl SetupBackgrounds
	movs r0, #0
	bl BG_GetMapBuffer
	movs r1, #0
	bl BG_Fill
	movs r0, #1
	bl BG_GetMapBuffer
	movs r1, #0
	bl BG_Fill
	movs r0, #2
	bl BG_GetMapBuffer
	movs r1, #0
	bl BG_Fill
	ldrb r1, [r4, #0xc]
	movs r2, #4
	negs r2, r2
	adds r0, r2, #0
	ands r0, r1
	movs r1, #1
	orrs r0, r1
	strb r0, [r4, #0xc]
	ldrb r1, [r4, #0x10]
	adds r0, r2, #0
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	strb r0, [r4, #0x10]
	ldrb r0, [r4, #0x14]
	ands r2, r0
	strb r2, [r4, #0x14]
	ldrb r0, [r4, #0x18]
	movs r1, #3
	orrs r0, r1
	strb r0, [r4, #0x18]
	bl ResetFaces
	bl Font_InitForUIDefault
	bl ResetIconGraphics_
	bl LoadUiFrameGraphics
	bl LoadObjUIGfx
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	adds r0, r5, #0
	adds r0, #0x35
	ldrb r0, [r0]
	lsls r0, r0, #1
	adds r5, #0x4c
	adds r5, r5, r0
	ldrh r2, [r5]
	subs r2, #0x28
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #2
	movs r1, #0
	bl BG_SetPosition
	ldr r0, _0809D9FC  @ 0x06013000
	movs r1, #1
	negs r1, r1
	bl LoadDialogueBoxGfx
	movs r0, #4
	bl LoadIconPalettes
	bl sub_8095A1C
	movs r0, #8
	bl BG_EnableSyncByMask
	ldrb r1, [r4, #1]
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
	strb r0, [r4, #1]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0809D9F8: .4byte gLCDControlBuffer
_0809D9FC: .4byte 0x06013000

	THUMB_FUNC_END sub_809D914

	THUMB_FUNC_START sub_809DA00
sub_809DA00: @ 0x0809DA00
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	sub sp, #8
	adds r7, r0, #0
	movs r0, #0xa0
	lsls r0, r0, #7
	movs r1, #5
	bl sub_8098C3C
	movs r0, #0x80
	lsls r0, r0, #4
	movs r1, #0xa
	bl sub_8098C8C
	ldr r0, _0809DC38  @ gUnknown_08A1B9EC
	ldr r4, _0809DC3C  @ gUnknown_02020188
	adds r1, r4, #0
	bl CopyDataWithPossibleUncomp
	ldr r5, _0809DC40  @ gBG1TilemapBuffer
	movs r6, #0x80
	lsls r6, r6, #5
	adds r0, r5, #0
	adds r1, r4, #0
	adds r2, r6, #0
	bl CallARM_FillTileRect
	ldr r0, _0809DC44  @ gUnknown_08A1BCC0
	adds r1, r4, #0
	bl CopyDataWithPossibleUncomp
	adds r0, r5, #0
	adds r1, r4, #0
	adds r2, r6, #0
	bl CallARM_FillTileRect
	movs r0, #7
	bl BG_EnableSyncByMask
	movs r1, #0xe0
	lsls r1, r1, #4
	movs r3, #0xc0
	lsls r3, r3, #4
	movs r0, #0
	str r0, [sp]
	str r7, [sp, #4]
	movs r0, #0xd
	movs r2, #0xf
	bl sub_80ADB7C
	movs r0, #0
	movs r1, #0x90
	movs r2, #6
	movs r3, #2
	bl sub_80ADBFC
	ldr r0, [r7, #0x2c]
	ldr r0, [r0]
	ldrh r0, [r0]
	bl GetStringFromIndex
	adds r0, r7, #0
	bl sub_80AC9C0
	adds r0, r7, #0
	bl sub_80AD47C
	movs r0, #0xc0
	lsls r0, r0, #3
	movs r1, #1
	bl sub_80AD4A0
	ldr r5, _0809DC48  @ gLCDControlBuffer
	ldrb r0, [r5, #1]
	movs r1, #0x20
	mov r8, r1
	mov r2, r8
	orrs r0, r2
	movs r1, #0x41
	negs r1, r1
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r5, #1]
	adds r1, r5, #0
	adds r1, #0x2d
	movs r0, #0x80
	strb r0, [r1]
	adds r1, #4
	movs r0, #0x28
	strb r0, [r1]
	subs r1, #5
	movs r0, #0xe0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0x98
	strb r0, [r1]
	movs r0, #0x34
	adds r0, r0, r5
	mov r9, r0
	ldrb r1, [r0]
	movs r6, #1
	orrs r1, r6
	movs r2, #2
	orrs r1, r2
	movs r0, #4
	orrs r1, r0
	movs r4, #8
	orrs r1, r4
	movs r3, #0x10
	orrs r1, r3
	adds r5, #0x36
	ldrb r0, [r5]
	orrs r0, r6
	orrs r0, r2
	movs r2, #5
	negs r2, r2
	ands r0, r2
	orrs r0, r4
	orrs r0, r3
	mov r2, r8
	orrs r1, r2
	mov r2, r9
	strb r1, [r2]
	mov r1, r8
	orrs r0, r1
	strb r0, [r5]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #8
	bl SetSpecialColorEffectsParameters
	adds r0, r7, #0
	bl NewGreenTextColorManager
	movs r0, #0xc3
	movs r1, #0x93
	movs r2, #9
	adds r3, r7, #0
	bl StartHelpPromptSprite
	ldr r4, _0809DC4C  @ gUnknown_02013660
	adds r0, r4, #0
	movs r1, #4
	bl Text_Init
	adds r0, r4, #0
	adds r0, #8
	movs r1, #4
	bl Text_Init
	bl sub_809D608
	adds r4, #0x10
	movs r5, #4
_0809DB3C:
	adds r0, r4, #0
	movs r1, #7
	bl Text_Init
	adds r4, #8
	subs r5, #1
	cmp r5, #0
	bge _0809DB3C
	movs r2, #0x35
	adds r2, r2, r7
	mov r8, r2
	movs r0, #0x4c
	adds r0, r0, r7
	mov r9, r0
	ldr r4, _0809DC50  @ gUnknown_02013698
	movs r5, #7
_0809DB5C:
	adds r0, r4, #0
	movs r1, #7
	bl Text_Allocate
	adds r4, #8
	subs r5, #1
	cmp r5, #0
	bge _0809DB5C
	movs r0, #0
	bl SetPrimaryHBlankHandler
	ldr r0, _0809DC54  @ sub_809D530
	bl SetPrimaryHBlankHandler
	movs r4, #0x80
	lsls r4, r4, #7
	adds r0, r4, #0
	movs r1, #6
	bl StoreConvoyWeaponIconGraphics
	ldr r5, _0809DC58  @ gUnknown_02022D86
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #6
	bl sub_809D8D4
	ldr r0, _0809DC5C  @ gUnknown_08A19CCC
	ldr r1, _0809DC60  @ 0x06015000
	bl CopyDataWithPossibleUncomp
	ldr r0, _0809DC64  @ gUnknown_08A1A084
	movs r6, #0xa0
	lsls r6, r6, #2
	adds r1, r6, #0
	movs r2, #0x20
	bl CopyToPaletteBuffer
	movs r3, #0xb0
	lsls r3, r3, #7
	movs r0, #9
	str r0, [sp]
	adds r0, r7, #0
	movs r1, #0xe1
	movs r2, #0x2f
	bl sub_8097748
	bl sub_8097668
	ldr r0, [r7, #0x2c]
	mov r2, r8
	ldrb r1, [r2]
	movs r2, #1
	bl SomethingPrepListRelated
	ldr r4, _0809DC50  @ gUnknown_02013698
	ldr r1, _0809DC68  @ gUnknown_02023CC6
	mov r2, r8
	ldrb r0, [r2]
	lsls r0, r0, #1
	add r0, r9
	ldrh r2, [r0]
	lsrs r2, r2, #4
	ldr r3, [r7, #0x2c]
	adds r0, r4, #0
	bl sub_809D300
	movs r0, #4
	bl BG_EnableSyncByMask
	movs r0, #0xb3
	lsls r0, r0, #1
	adds r5, r5, r0
	subs r4, #0x28
	ldr r2, [r7, #0x2c]
	adds r0, r5, #0
	adds r1, r4, #0
	movs r3, #0
	bl sub_809B74C
	bl sub_809D6CC
	adds r0, r7, #0
	bl sub_80ACCE0
	movs r0, #0
	adds r1, r6, #0
	movs r2, #2
	bl sub_80ACCF4
	movs r0, #0x78
	movs r1, #0x18
	movs r2, #0xe9
	movs r3, #0x18
	bl sub_80ACD7C
	movs r0, #3
	bl sub_80ACD60
	ldr r0, _0809DC6C  @ sub_809D844
	adds r1, r7, #0
	bl Get6CDifferedLoop6C
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809DC38: .4byte gUnknown_08A1B9EC
_0809DC3C: .4byte gUnknown_02020188
_0809DC40: .4byte gBG1TilemapBuffer
_0809DC44: .4byte gUnknown_08A1BCC0
_0809DC48: .4byte gLCDControlBuffer
_0809DC4C: .4byte gUnknown_02013660
_0809DC50: .4byte gUnknown_02013698
_0809DC54: .4byte sub_809D530
_0809DC58: .4byte gUnknown_02022D86
_0809DC5C: .4byte gUnknown_08A19CCC
_0809DC60: .4byte 0x06015000
_0809DC64: .4byte gUnknown_08A1A084
_0809DC68: .4byte gUnknown_02023CC6
_0809DC6C: .4byte sub_809D844

	THUMB_FUNC_END sub_809DA00

	THUMB_FUNC_START sub_809DC70
sub_809DC70: @ 0x0809DC70
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0
	adds r1, r4, #0
	bl sub_809D278
	movs r0, #0
	bl sub_80ACA84
	adds r0, r4, #0
	bl sub_809D644
	adds r0, r4, #0
	adds r0, #0x33
	ldrb r1, [r0]
	lsls r1, r1, #4
	adds r1, #0x24
	movs r3, #0x80
	lsls r3, r3, #3
	movs r0, #0x44
	movs r2, #4
	bl sub_80AD51C
	ldr r0, _0809DCC8  @ sub_809D7D4
	bl Find6CDifferedLoop
	bl Proc_End
	ldr r0, _0809DCCC  @ sub_809D80C
	bl Find6CDifferedLoop
	bl Proc_End
	ldr r0, _0809DCD0  @ sub_809D784
	adds r1, r4, #0
	bl Get6CDifferedLoop6C
	movs r0, #7
	bl BG_EnableSyncByMask
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809DCC8: .4byte sub_809D7D4
_0809DCCC: .4byte sub_809D80C
_0809DCD0: .4byte sub_809D784

	THUMB_FUNC_END sub_809DC70

	THUMB_FUNC_START sub_809DCD4
sub_809DCD4: @ 0x0809DCD4
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r4, r5, #0
	adds r4, #0x33
	ldrb r6, [r4]
	ldrh r0, [r5, #0x38]
	cmp r0, #0
	beq _0809DCE6
	b _0809DE34
_0809DCE6:
	ldr r1, _0809DD04  @ gKeyStatusPtr
	ldr r0, [r1]
	ldrh r3, [r0, #8]
	movs r7, #1
	adds r0, r7, #0
	ands r0, r3
	mov ip, r1
	cmp r0, #0
	beq _0809DDE8
	cmp r6, #0
	beq _0809DD08
	cmp r6, #1
	beq _0809DD70
	b _0809DEEC
	.align 2, 0
_0809DD04: .4byte gKeyStatusPtr
_0809DD08:
	bl sub_8097CC8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x63
	bhi _0809DDCC
	ldr r0, [r5, #0x2c]
	bl GetUnitItemCount
	cmp r0, #0
	ble _0809DDCC
	ldrb r2, [r4]
	lsls r2, r2, #4
	adds r2, #0x24
	movs r0, #0
	movs r1, #0x44
	movs r3, #2
	bl sub_80AC9D4
	ldr r0, _0809DD64  @ sub_809D784
	bl Find6CDifferedLoop
	bl Proc_End
	ldr r0, _0809DD68  @ sub_809D7D4
	adds r1, r5, #0
	bl Get6CDifferedLoop6C
	movs r0, #1
	adds r1, r5, #0
	bl sub_809D278
	ldr r0, _0809DD6C  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809DD5A
	movs r0, #0x6a
	bl m4aSongNumStart
_0809DD5A:
	adds r0, r5, #0
	movs r1, #3
	bl Proc_Goto
	b _0809DEEC
	.align 2, 0
_0809DD64: .4byte sub_809D784
_0809DD68: .4byte sub_809D7D4
_0809DD6C: .4byte gRAMChapterData
_0809DD70:
	ldr r0, [r5, #0x2c]
	bl GetUnitItemCount
	cmp r0, #4
	bgt _0809DDCC
	ldrb r2, [r4]
	lsls r2, r2, #4
	adds r2, #0x24
	movs r0, #0
	movs r1, #0x44
	movs r3, #2
	bl sub_80AC9D4
	ldr r0, _0809DDC0  @ sub_809D784
	bl Find6CDifferedLoop
	bl Proc_End
	ldr r0, _0809DDC4  @ sub_809D80C
	adds r1, r5, #0
	bl Get6CDifferedLoop6C
	movs r0, #2
	adds r1, r5, #0
	bl sub_809D278
	ldr r0, _0809DDC8  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809DDB6
	movs r0, #0x6a
	bl m4aSongNumStart
_0809DDB6:
	adds r0, r5, #0
	movs r1, #4
	bl Proc_Goto
	b _0809DEEC
	.align 2, 0
_0809DDC0: .4byte sub_809D784
_0809DDC4: .4byte sub_809D80C
_0809DDC8: .4byte gRAMChapterData
_0809DDCC:
	ldr r0, _0809DDE4  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	bge _0809DDDA
	b _0809DEEC
_0809DDDA:
	movs r0, #0x6c
	bl m4aSongNumStart
	b _0809DEEC
	.align 2, 0
_0809DDE4: .4byte gRAMChapterData
_0809DDE8:
	movs r0, #2
	ands r0, r3
	cmp r0, #0
	beq _0809DE10
	adds r0, r5, #0
	movs r1, #8
	bl Proc_Goto
	ldr r0, _0809DE0C  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809DEEC
	movs r0, #0x6b
	bl m4aSongNumStart
	b _0809DEEC
	.align 2, 0
_0809DE0C: .4byte gRAMChapterData
_0809DE10:
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r3
	cmp r0, #0
	beq _0809DE54
	lsls r1, r6, #4
	adds r1, #0x24
	ldr r2, _0809DE30  @ gUnknown_08A19204
	lsls r0, r6, #2
	adds r0, r0, r2
	ldr r2, [r0]
	movs r0, #0x44
	bl StartHelpBox
	strh r7, [r5, #0x38]
	b _0809DEEC
	.align 2, 0
_0809DE30: .4byte gUnknown_08A19204
_0809DE34:
	ldr r2, _0809DE50  @ gKeyStatusPtr
	ldr r0, [r2]
	ldrh r1, [r0, #8]
	movs r0, #0x81
	lsls r0, r0, #1
	ands r0, r1
	mov ip, r2
	cmp r0, #0
	beq _0809DE54
	bl CloseHelpBox
	movs r0, #0
	strh r0, [r5, #0x38]
	b _0809DEEC
	.align 2, 0
_0809DE50: .4byte gKeyStatusPtr
_0809DE54:
	mov r0, ip
	ldr r3, [r0]
	ldrh r1, [r3, #6]
	movs r2, #0x40
	adds r0, r2, #0
	ands r0, r1
	adds r4, r5, #0
	adds r4, #0x33
	cmp r0, #0
	beq _0809DE80
	ldrb r0, [r4]
	cmp r0, #0
	beq _0809DE72
	subs r0, #1
	b _0809DE7E
_0809DE72:
	ldrh r1, [r3, #8]
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	beq _0809DE80
	movs r0, #1
_0809DE7E:
	strb r0, [r4]
_0809DE80:
	mov r0, ip
	ldr r2, [r0]
	ldrh r1, [r2, #6]
	movs r3, #0x80
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	beq _0809DEA8
	ldrb r0, [r4]
	cmp r0, #0
	bne _0809DE9A
	adds r0, #1
	b _0809DEA6
_0809DE9A:
	ldrh r1, [r2, #8]
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	beq _0809DEA8
	movs r0, #0
_0809DEA6:
	strb r0, [r4]
_0809DEA8:
	ldrb r0, [r4]
	cmp r6, r0
	beq _0809DEEC
	ldr r0, _0809DEF4  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809DEC0
	movs r0, #0x66
	bl m4aSongNumStart
_0809DEC0:
	ldrb r1, [r4]
	lsls r1, r1, #4
	adds r1, #0x24
	movs r3, #0x80
	lsls r3, r3, #3
	movs r0, #0x44
	movs r2, #4
	bl sub_80AD51C
	ldrh r0, [r5, #0x38]
	cmp r0, #0
	beq _0809DEEC
	ldrb r0, [r4]
	lsls r1, r0, #4
	adds r1, #0x24
	ldr r2, _0809DEF8  @ gUnknown_08A19204
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r2, [r0]
	movs r0, #0x44
	bl StartHelpBox
_0809DEEC:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809DEF4: .4byte gRAMChapterData
_0809DEF8: .4byte gUnknown_08A19204

	THUMB_FUNC_END sub_809DCD4

	THUMB_FUNC_START sub_809DEFC
sub_809DEFC: @ 0x0809DEFC
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	bl ResetIconGraphics_
	ldr r0, [r4, #0x2c]
	adds r5, r4, #0
	adds r5, #0x35
	ldrb r1, [r5]
	movs r2, #1
	bl SomethingPrepListRelated
	ldr r0, _0809DF8C  @ gUnknown_02013698
	ldr r1, _0809DF90  @ gUnknown_02023CC6
	ldrb r2, [r5]
	lsls r2, r2, #1
	adds r6, r4, #0
	adds r6, #0x4c
	adds r2, r6, r2
	ldrh r2, [r2]
	lsrs r2, r2, #4
	ldr r3, [r4, #0x2c]
	bl sub_809D300
	ldr r0, _0809DF94  @ gUnknown_02022EEC
	ldr r1, [r4, #0x2c]
	bl sub_809B830
	ldrb r0, [r5]
	lsls r0, r0, #1
	adds r7, r4, #0
	adds r7, #0x3a
	adds r1, r7, r0
	ldrh r1, [r1]
	lsls r1, r1, #4
	adds r0, r6, r0
	ldrh r0, [r0]
	subs r0, #0x28
	subs r1, r1, r0
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x80
	movs r2, #0xb
	bl sub_80AD51C
	movs r0, #5
	bl BG_EnableSyncByMask
	ldrh r0, [r4, #0x38]
	cmp r0, #0
	beq _0809DFA8
	ldr r0, _0809DF98  @ gUnknown_02012F56
	ldrh r0, [r0]
	cmp r0, #0
	beq _0809DFA0
	ldr r2, _0809DF9C  @ gUnknown_020122D4
	ldrb r3, [r5]
	lsls r3, r3, #1
	adds r0, r7, r3
	ldrh r1, [r0]
	lsls r0, r1, #2
	adds r0, r0, r2
	ldrh r2, [r0, #2]
	lsls r1, r1, #4
	adds r3, r6, r3
	ldrh r0, [r3]
	subs r0, #0x28
	subs r1, r1, r0
	movs r0, #0x80
	bl StartItemHelpBox
	movs r0, #1
	b _0809DFA6
	.align 2, 0
_0809DF8C: .4byte gUnknown_02013698
_0809DF90: .4byte gUnknown_02023CC6
_0809DF94: .4byte gUnknown_02022EEC
_0809DF98: .4byte gUnknown_02012F56
_0809DF9C: .4byte gUnknown_020122D4
_0809DFA0:
	bl CloseHelpBox
	movs r0, #0xff
_0809DFA6:
	strh r0, [r4, #0x38]
_0809DFA8:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_809DEFC

	THUMB_FUNC_START sub_809DFB0
sub_809DFB0: @ 0x0809DFB0
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r6, r0, #0
	movs r3, #0
	movs r7, #4
	adds r1, r6, #0
	adds r1, #0x34
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldrb r4, [r1]
	cmp r4, #4
	bge _0809DFDE
	subs r1, r7, r4
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #5
	muls r0, r1, r0
	movs r1, #0x10
	bl __divsi3
	adds r3, r0, #0
	subs r3, #0x60
_0809DFDE:
	adds r5, r6, #0
	adds r5, #0x35
	cmp r4, #4
	bne _0809DFFE
	ldrb r0, [r5]
	cmp r0, #0
	bne _0809DFF0
	movs r0, #8
	b _0809DFF2
_0809DFF0:
	subs r0, #1
_0809DFF2:
	strb r0, [r5]
	adds r0, r6, #0
	str r3, [sp]
	bl sub_809DEFC
	ldr r3, [sp]
_0809DFFE:
	adds r4, r6, #0
	adds r4, #0x34
	ldrb r1, [r4]
	cmp r1, r7
	blt _0809E01E
	subs r1, r1, r7
	subs r1, r7, r1
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #5
	muls r0, r1, r0
	adds r1, r7, #0
	muls r1, r7, r1
	bl __divsi3
	adds r3, r0, #0
_0809E01E:
	movs r0, #0xff
	ands r3, r0
	ldrb r1, [r5]
	lsls r1, r1, #1
	adds r0, r6, #0
	adds r0, #0x4c
	adds r0, r0, r1
	ldrh r2, [r0]
	subs r2, #0x28
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #2
	adds r1, r3, #0
	bl BG_SetPosition
	ldrb r1, [r4]
	lsls r0, r7, #1
	cmp r1, r0
	bne _0809E04C
	adds r0, r6, #0
	movs r1, #4
	bl Proc_Goto
_0809E04C:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_809DFB0

	THUMB_FUNC_START sub_809E054
sub_809E054: @ 0x0809E054
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r7, r0, #0
	movs r0, #4
	mov r8, r0
	adds r1, r7, #0
	adds r1, #0x34
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldrb r4, [r1]
	cmp r4, #4
	bge _0809E086
	mov r2, r8
	subs r1, r2, r4
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #5
	muls r0, r1, r0
	movs r1, #0x10
	bl __divsi3
	movs r1, #0x60
	subs r6, r1, r0
_0809E086:
	adds r5, r7, #0
	adds r5, #0x35
	cmp r4, #4
	bne _0809E0A2
	ldrb r0, [r5]
	cmp r0, #8
	bne _0809E098
	movs r0, #0
	b _0809E09A
_0809E098:
	adds r0, #1
_0809E09A:
	strb r0, [r5]
	adds r0, r7, #0
	bl sub_809DEFC
_0809E0A2:
	adds r4, r7, #0
	adds r4, #0x34
	ldrb r1, [r4]
	cmp r1, r8
	blt _0809E0C6
	mov r0, r8
	subs r1, r1, r0
	subs r1, r0, r1
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #5
	muls r0, r1, r0
	mov r2, r8
	mov r1, r8
	muls r1, r2, r1
	bl __divsi3
	negs r6, r0
_0809E0C6:
	movs r0, #0xff
	ands r6, r0
	ldrb r1, [r5]
	lsls r1, r1, #1
	adds r0, r7, #0
	adds r0, #0x4c
	adds r0, r0, r1
	ldrh r2, [r0]
	subs r2, #0x28
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #2
	adds r1, r6, #0
	bl BG_SetPosition
	ldrb r1, [r4]
	mov r2, r8
	lsls r0, r2, #1
	cmp r1, r0
	bne _0809E0F6
	adds r0, r7, #0
	movs r1, #4
	bl Proc_Goto
_0809E0F6:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_809E054

	THUMB_FUNC_START sub_809E100
sub_809E100: @ 0x0809E100
	push {r4, r5, lr}
	mov ip, r0
	ldr r0, _0809E128  @ gUnknown_02012F56
	ldrh r4, [r0]
	adds r5, r0, #0
	cmp r4, #0
	bne _0809E12C
	mov r3, ip
	adds r3, #0x35
	ldrb r0, [r3]
	lsls r0, r0, #1
	mov r1, ip
	adds r1, #0x3a
	adds r1, r1, r0
	mov r2, ip
	adds r2, #0x4c
	adds r0, r2, r0
	strh r4, [r0]
	strh r4, [r1]
	b _0809E14A
	.align 2, 0
_0809E128: .4byte gUnknown_02012F56
_0809E12C:
	mov r2, ip
	adds r2, #0x35
	ldrb r0, [r2]
	lsls r0, r0, #1
	mov r1, ip
	adds r1, #0x3a
	adds r4, r1, r0
	ldrh r1, [r4]
	ldrh r0, [r5]
	subs r0, #1
	adds r3, r2, #0
	adds r2, #0x17
	cmp r1, r0
	ble _0809E14A
	strh r0, [r4]
_0809E14A:
	ldrh r0, [r5]
	cmp r0, #6
	bls _0809E168
	ldrb r0, [r3]
	lsls r0, r0, #1
	adds r4, r2, r0
	ldrh r0, [r4]
	lsrs r0, r0, #4
	adds r0, #7
	ldrh r1, [r5]
	cmp r0, r1
	ble _0809E168
	subs r0, r1, #7
	lsls r0, r0, #4
	strh r0, [r4]
_0809E168:
	ldrb r0, [r3]
	lsls r0, r0, #1
	adds r0, r2, r0
	ldrh r2, [r0]
	subs r2, #0x28
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #2
	movs r1, #0
	bl BG_SetPosition
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_809E100

	THUMB_FUNC_START sub_809E184
sub_809E184: @ 0x0809E184
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov ip, r0
	adds r0, #0x35
	ldrb r1, [r0]
	lsls r1, r1, #1
	adds r0, #5
	adds r4, r0, r1
	ldrh r3, [r4]
	lsls r2, r3, #4
	adds r0, #0x12
	adds r0, r0, r1
	ldrh r0, [r0]
	subs r0, #0x28
	subs r2, r2, r0
	cmp r2, #0x37
	bgt _0809E1B0
	cmp r3, #0
	beq _0809E1B0
	adds r0, r3, #1
	strh r0, [r4]
_0809E1B0:
	mov r4, ip
	adds r4, #0x35
	ldrb r0, [r4]
	lsls r0, r0, #1
	mov r3, ip
	adds r3, #0x3a
	adds r6, r3, r0
	ldrh r5, [r6]
	lsls r1, r5, #4
	mov r2, ip
	adds r2, #0x4c
	adds r0, r2, r0
	ldrh r0, [r0]
	subs r0, #0x28
	subs r1, r1, r0
	adds r7, r3, #0
	mov r8, r2
	cmp r1, #0x78
	ble _0809E1E4
	ldr r0, _0809E214  @ gUnknown_02012F56
	ldrh r0, [r0]
	subs r0, #1
	cmp r5, r0
	beq _0809E1E4
	subs r0, r5, #1
	strh r0, [r6]
_0809E1E4:
	mov r0, ip
	bl sub_809E100
	ldrb r0, [r4]
	lsls r0, r0, #1
	adds r1, r7, r0
	ldrh r1, [r1]
	lsls r1, r1, #4
	add r0, r8
	ldrh r0, [r0]
	subs r0, #0x28
	subs r1, r1, r0
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x80
	movs r2, #0xb
	bl sub_80AD51C
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809E214: .4byte gUnknown_02012F56

	THUMB_FUNC_END sub_809E184

	THUMB_FUNC_START sub_809E218
sub_809E218: @ 0x0809E218
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	adds r7, r1, #0
	bl ResetIconGraphics_
	ldr r0, _0809E2B0  @ gUnknown_02023CC6
	mov r8, r0
	adds r6, r4, #0
	adds r6, #0x35
	ldrb r0, [r6]
	lsls r0, r0, #1
	adds r5, r4, #0
	adds r5, #0x4c
	adds r0, r5, r0
	ldrh r1, [r0]
	lsrs r1, r1, #4
	mov r0, r8
	bl sub_809D418
	ldr r0, _0809E2B4  @ gUnknown_02022EEC
	ldr r1, [r4, #0x2c]
	bl sub_809B830
	movs r0, #5
	bl BG_EnableSyncByMask
	cmp r7, #0
	bge _0809E26A
	ldr r0, _0809E2B8  @ gUnknown_02013698
	ldrb r1, [r6]
	lsls r1, r1, #1
	adds r1, r5, r1
	ldrh r2, [r1]
	lsrs r2, r2, #4
	subs r2, #1
	ldr r3, [r4, #0x2c]
	mov r1, r8
	bl sub_809D47C
_0809E26A:
	cmp r7, #0
	ble _0809E284
	ldr r0, _0809E2B8  @ gUnknown_02013698
	ldrb r1, [r6]
	lsls r1, r1, #1
	adds r1, r5, r1
	ldrh r2, [r1]
	lsrs r2, r2, #4
	adds r2, #7
	ldr r3, [r4, #0x2c]
	mov r1, r8
	bl sub_809D47C
_0809E284:
	ldrb r1, [r6]
	lsls r1, r1, #1
	adds r1, r5, r1
	ldrh r0, [r1]
	adds r0, r0, r7
	strh r0, [r1]
	ldrb r0, [r6]
	lsls r0, r0, #1
	adds r0, r5, r0
	ldrh r2, [r0]
	subs r2, #0x28
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #2
	movs r1, #0
	bl BG_SetPosition
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809E2B0: .4byte gUnknown_02023CC6
_0809E2B4: .4byte gUnknown_02022EEC
_0809E2B8: .4byte gUnknown_02013698

	THUMB_FUNC_END sub_809E218

	THUMB_FUNC_START sub_809E2BC
sub_809E2BC: @ 0x0809E2BC
	push {lr}
	bl sub_809D6CC
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_809E2BC

	THUMB_FUNC_START sub_809E2C8
sub_809E2C8: @ 0x0809E2C8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r7, r0, #0
	ldr r0, [r7, #0x2c]
	bl GetUnitItemCount
	adds r2, r0, #0
	cmp r2, #5
	beq _0809E2E4
	ldr r0, _0809E2FC  @ gUnknown_02012F56
	ldrh r0, [r0]
	cmp r0, #0
	bne _0809E304
_0809E2E4:
	ldr r0, _0809E300  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	bge _0809E2F2
	b _0809E412
_0809E2F2:
	movs r0, #0x6c
	bl m4aSongNumStart
	b _0809E412
	.align 2, 0
_0809E2FC: .4byte gUnknown_02012F56
_0809E300: .4byte gRAMChapterData
_0809E304:
	movs r5, #0
	strh r5, [r7, #0x38]
	ldr r1, [r7, #0x2c]
	lsls r0, r2, #1
	adds r1, #0x1e
	adds r1, r1, r0
	ldr r4, _0809E3E4  @ gUnknown_020122D4
	movs r0, #0x35
	adds r0, r0, r7
	mov r8, r0
	ldrb r0, [r0]
	lsls r0, r0, #1
	adds r6, r7, #0
	adds r6, #0x3a
	adds r0, r6, r0
	ldrh r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r4
	ldrh r0, [r0, #2]
	strh r0, [r1]
	ldr r0, [r7, #0x2c]
	bl UnitRemoveInvalidItems
	mov r1, r8
	ldrb r0, [r1]
	lsls r0, r0, #1
	adds r0, r6, r0
	ldrh r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r4
	strh r5, [r0, #2]
	bl sub_80982B8
	ldr r0, [r7, #0x2c]
	mov r2, r8
	ldrb r1, [r2]
	movs r2, #1
	bl SomethingPrepListRelated
	adds r0, r7, #0
	bl sub_809E100
	bl ResetIconGraphics_
	ldr r0, _0809E3E8  @ gUnknown_02022EEC
	ldr r4, _0809E3EC  @ gUnknown_02013670
	ldr r2, [r7, #0x2c]
	adds r1, r4, #0
	movs r3, #0
	bl sub_809B74C
	adds r4, #0x28
	ldr r1, _0809E3F0  @ gUnknown_02023CC6
	mov r2, r8
	ldrb r0, [r2]
	lsls r0, r0, #1
	adds r5, r7, #0
	adds r5, #0x4c
	adds r0, r5, r0
	ldrh r2, [r0]
	lsrs r2, r2, #4
	ldr r3, [r7, #0x2c]
	adds r0, r4, #0
	bl sub_809D300
	ldr r0, _0809E3F4  @ sub_809E2BC
	movs r1, #1
	adds r2, r7, #0
	bl sub_80ACE20
	mov r1, r8
	ldrb r0, [r1]
	lsls r0, r0, #1
	adds r6, r6, r0
	ldrh r1, [r6]
	lsls r1, r1, #4
	adds r5, r5, r0
	ldrh r0, [r5]
	subs r0, #0x28
	subs r1, r1, r0
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x80
	movs r2, #0xb
	bl sub_80AD51C
	movs r0, #5
	bl BG_EnableSyncByMask
	ldr r1, _0809E3F8  @ gActionData
	movs r0, #0x1c
	strb r0, [r1, #0x11]
	ldr r0, [r7, #0x2c]
	bl GetUnitItemCount
	cmp r0, #5
	bne _0809E400
	adds r0, r7, #0
	movs r1, #1
	bl Proc_Goto
	ldr r0, _0809E3FC  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809E412
	movs r0, #0x6b
	bl m4aSongNumStart
	b _0809E412
	.align 2, 0
_0809E3E4: .4byte gUnknown_020122D4
_0809E3E8: .4byte gUnknown_02022EEC
_0809E3EC: .4byte gUnknown_02013670
_0809E3F0: .4byte gUnknown_02023CC6
_0809E3F4: .4byte sub_809E2BC
_0809E3F8: .4byte gActionData
_0809E3FC: .4byte gRAMChapterData
_0809E400:
	ldr r0, _0809E41C  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809E412
	movs r0, #0x6a
	bl m4aSongNumStart
_0809E412:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809E41C: .4byte gRAMChapterData

	THUMB_FUNC_END sub_809E2C8

	THUMB_FUNC_START sub_809E420
sub_809E420: @ 0x0809E420
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	adds r4, r0, #0
	adds r7, r4, #0
	adds r7, #0x35
	ldrb r0, [r7]
	lsls r0, r0, #1
	movs r1, #0x3a
	adds r1, r1, r4
	mov r8, r1
	adds r1, r1, r0
	ldrh r1, [r1]
	mov sl, r1
	adds r5, r4, #0
	adds r5, #0x4c
	adds r6, r5, r0
	ldrh r0, [r6]
	movs r2, #0xf
	mov r9, r2
	mov r1, r9
	ands r1, r0
	mov r9, r1
	cmp r1, #0
	beq _0809E458
	b _0809E648
_0809E458:
	ldrh r0, [r4, #0x38]
	cmp r0, #0
	beq _0809E462
	cmp r0, #0xff
	bne _0809E500
_0809E462:
	ldr r1, _0809E49C  @ gKeyStatusPtr
	ldr r0, [r1]
	ldrh r3, [r0, #8]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r3
	mov r8, r1
	cmp r0, #0
	beq _0809E4C4
	ldr r0, _0809E4A0  @ gUnknown_02012F56
	ldrh r0, [r0]
	cmp r0, #0
	beq _0809E4A8
	ldr r1, _0809E4A4  @ gUnknown_020122D4
	mov r2, sl
	lsls r0, r2, #2
	adds r0, r0, r1
	ldrh r2, [r0, #2]
	mov r0, sl
	lsls r1, r0, #4
	ldrh r0, [r6]
	subs r0, #0x28
	subs r1, r1, r0
	movs r0, #0x80
	bl StartItemHelpBox
	movs r0, #1
	strh r0, [r4, #0x38]
	b _0809E79A
	.align 2, 0
_0809E49C: .4byte gKeyStatusPtr
_0809E4A0: .4byte gUnknown_02012F56
_0809E4A4: .4byte gUnknown_020122D4
_0809E4A8:
	ldr r0, _0809E4C0  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	bge _0809E4B6
	b _0809E79A
_0809E4B6:
	movs r0, #0x6c
	bl m4aSongNumStart
	b _0809E79A
	.align 2, 0
_0809E4C0: .4byte gRAMChapterData
_0809E4C4:
	movs r0, #1
	ands r0, r3
	cmp r0, #0
	beq _0809E4D4
	adds r0, r4, #0
	bl sub_809E2C8
	b _0809E79A
_0809E4D4:
	movs r0, #2
	ands r0, r3
	cmp r0, #0
	beq _0809E520
	adds r0, r4, #0
	movs r1, #1
	bl Proc_Goto
	ldr r0, _0809E4FC  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809E4F6
	movs r0, #0x6b
	bl m4aSongNumStart
_0809E4F6:
	mov r1, r9
	strh r1, [r4, #0x38]
	b _0809E79A
	.align 2, 0
_0809E4FC: .4byte gRAMChapterData
_0809E500:
	ldr r2, _0809E51C  @ gKeyStatusPtr
	ldr r0, [r2]
	ldrh r1, [r0, #8]
	movs r0, #0x81
	lsls r0, r0, #1
	ands r0, r1
	mov r8, r2
	cmp r0, #0
	beq _0809E520
	bl CloseHelpBox
	mov r2, r9
	strh r2, [r4, #0x38]
	b _0809E79A
	.align 2, 0
_0809E51C: .4byte gKeyStatusPtr
_0809E520:
	mov r0, r8
	ldr r2, [r0]
	ldrh r1, [r2, #6]
	movs r0, #0x20
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0
	beq _0809E568
	movs r0, #0
	bl sub_80ACDA4
	ldr r0, _0809E564  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809E54A
	movs r0, #0x67
	bl m4aSongNumStart
_0809E54A:
	adds r0, r4, #0
	movs r1, #5
	bl Proc_Goto
	adds r1, r4, #0
	adds r1, #0x34
	movs r0, #0
	strb r0, [r1]
	adds r0, r4, #0
	bl sub_809DFB0
	b _0809E79A
	.align 2, 0
_0809E564: .4byte gRAMChapterData
_0809E568:
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _0809E5A4
	movs r0, #1
	bl sub_80ACDA4
	ldr r0, _0809E5A0  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809E588
	movs r0, #0x67
	bl m4aSongNumStart
_0809E588:
	adds r0, r4, #0
	movs r1, #6
	bl Proc_Goto
	adds r0, r4, #0
	adds r0, #0x34
	strb r5, [r0]
	adds r0, r4, #0
	bl sub_809E054
	b _0809E79A
	.align 2, 0
_0809E5A0: .4byte gRAMChapterData
_0809E5A4:
	ldrh r1, [r2, #4]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0809E5B8
	adds r1, r4, #0
	adds r1, #0x32
	movs r0, #8
	b _0809E5BE
_0809E5B8:
	adds r1, r4, #0
	adds r1, #0x32
	movs r0, #4
_0809E5BE:
	strb r0, [r1]
	adds r7, r1, #0
	mov r1, r8
	ldr r2, [r1]
	ldrh r1, [r2, #6]
	movs r3, #0x40
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	bne _0809E5EC
	ldrh r1, [r2, #4]
	adds r0, r3, #0
	ands r0, r1
	adds r6, r4, #0
	adds r6, #0x35
	adds r5, r4, #0
	adds r5, #0x3a
	cmp r0, #0
	beq _0809E608
	movs r0, #0
	ldrsb r0, [r7, r0]
	cmp r0, #8
	bne _0809E608
_0809E5EC:
	adds r0, r4, #0
	adds r0, #0x35
	ldrb r1, [r0]
	lsls r1, r1, #1
	adds r2, r4, #0
	adds r2, #0x3a
	adds r3, r2, r1
	ldrh r1, [r3]
	adds r6, r0, #0
	adds r5, r2, #0
	cmp r1, #0
	beq _0809E608
	subs r0, r1, #1
	strh r0, [r3]
_0809E608:
	mov r0, r8
	ldr r2, [r0]
	ldrh r1, [r2, #6]
	movs r3, #0x80
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	bne _0809E62A
	ldrh r1, [r2, #4]
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	beq _0809E6A8
	movs r0, #0
	ldrsb r0, [r7, r0]
	cmp r0, #8
	bne _0809E6A8
_0809E62A:
	ldrb r0, [r6]
	lsls r0, r0, #1
	adds r2, r5, r0
	ldrh r1, [r2]
	ldr r0, _0809E644  @ gUnknown_02012F56
	ldrh r0, [r0]
	subs r0, #1
	cmp r1, r0
	bge _0809E6A8
	adds r0, r1, #1
	strh r0, [r2]
	b _0809E6A8
	.align 2, 0
_0809E644: .4byte gUnknown_02012F56
_0809E648:
	mov r1, sl
	lsls r0, r1, #4
	ldrh r2, [r6]
	adds r1, r2, #0
	subs r1, #0x28
	subs r0, r0, r1
	cmp r0, #0x37
	bgt _0809E666
	adds r0, r4, #0
	adds r0, #0x32
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r2, r0
	strh r0, [r6]
_0809E666:
	ldrb r0, [r7]
	lsls r0, r0, #1
	mov r2, r8
	adds r1, r2, r0
	ldrh r1, [r1]
	lsls r1, r1, #4
	adds r3, r5, r0
	ldrh r2, [r3]
	adds r0, r2, #0
	subs r0, #0x28
	subs r1, r1, r0
	cmp r1, #0x78
	ble _0809E68E
	adds r0, r4, #0
	adds r0, #0x32
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r0, r2, r0
	strh r0, [r3]
_0809E68E:
	ldrb r0, [r7]
	lsls r0, r0, #1
	adds r0, r5, r0
	ldrh r2, [r0]
	subs r2, #0x28
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #2
	movs r1, #0
	bl BG_SetPosition
	adds r6, r7, #0
	mov r5, r8
_0809E6A8:
	ldrb r0, [r6]
	lsls r0, r0, #1
	adds r0, r5, r0
	ldrh r0, [r0]
	cmp sl, r0
	beq _0809E79A
	ldr r1, _0809E710  @ gUnknown_020122D4
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrh r0, [r0, #2]
	mov r8, r0
	ldr r0, _0809E714  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809E6D0
	movs r0, #0x66
	bl m4aSongNumStart
_0809E6D0:
	ldrb r0, [r6]
	lsls r0, r0, #1
	adds r1, r5, r0
	ldrh r3, [r1]
	lsls r2, r3, #4
	adds r1, r4, #0
	adds r1, #0x4c
	adds r0, r1, r0
	ldrh r0, [r0]
	subs r0, #0x28
	subs r2, r2, r0
	adds r7, r1, #0
	cmp r2, #0x37
	bgt _0809E718
	cmp r3, #0
	beq _0809E718
	ldrh r0, [r4, #0x38]
	cmp r0, #0
	beq _0809E702
	adds r1, r2, #0
	adds r1, #0x10
	movs r0, #0x80
	mov r2, r8
	bl StartItemHelpBox
_0809E702:
	adds r0, r4, #0
	adds r0, #0x32
	movs r1, #0
	ldrsb r1, [r0, r1]
	negs r1, r1
	b _0809E750
	.align 2, 0
_0809E710: .4byte gUnknown_020122D4
_0809E714: .4byte gRAMChapterData
_0809E718:
	ldrb r0, [r6]
	lsls r0, r0, #1
	adds r1, r5, r0
	ldrh r2, [r1]
	lsls r1, r2, #4
	adds r0, r7, r0
	ldrh r0, [r0]
	subs r0, #0x28
	subs r1, r1, r0
	cmp r1, #0x78
	ble _0809E75C
	ldr r0, _0809E758  @ gUnknown_02012F56
	ldrh r0, [r0]
	subs r0, #1
	cmp r2, r0
	beq _0809E75C
	ldrh r0, [r4, #0x38]
	cmp r0, #0
	beq _0809E748
	subs r1, #0x10
	movs r0, #0x80
	mov r2, r8
	bl StartItemHelpBox
_0809E748:
	adds r0, r4, #0
	adds r0, #0x32
	movs r1, #0
	ldrsb r1, [r0, r1]
_0809E750:
	adds r0, r4, #0
	bl sub_809E218
	b _0809E79A
	.align 2, 0
_0809E758: .4byte gUnknown_02012F56
_0809E75C:
	ldrh r0, [r4, #0x38]
	cmp r0, #0
	beq _0809E77C
	ldrb r0, [r6]
	lsls r0, r0, #1
	adds r1, r5, r0
	ldrh r1, [r1]
	lsls r1, r1, #4
	adds r0, r7, r0
	ldrh r0, [r0]
	subs r0, #0x28
	subs r1, r1, r0
	movs r0, #0x80
	mov r2, r8
	bl StartItemHelpBox
_0809E77C:
	ldrb r0, [r6]
	lsls r0, r0, #1
	adds r1, r5, r0
	ldrh r1, [r1]
	lsls r1, r1, #4
	adds r0, r7, r0
	ldrh r0, [r0]
	subs r0, #0x28
	subs r1, r1, r0
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x80
	movs r2, #0xb
	bl sub_80AD51C
_0809E79A:
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_809E420

	THUMB_FUNC_START sub_809E7A8
sub_809E7A8: @ 0x0809E7A8
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	ldr r6, _0809E7D8  @ gKeyStatusPtr
	ldr r0, [r6]
	ldrh r1, [r0, #6]
	movs r7, #0x40
	adds r0, r7, #0
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0
	beq _0809E7EE
	ldr r0, [r4, #0x2c]
	bl GetUnitItemCount
	adds r3, r0, #0
	adds r2, r4, #0
	adds r2, #0x31
	ldrb r0, [r2]
	cmp r0, #0
	beq _0809E7DC
	subs r0, #1
	strb r0, [r2]
	b _0809E81E
	.align 2, 0
_0809E7D8: .4byte gKeyStatusPtr
_0809E7DC:
	ldr r0, [r6]
	ldrh r1, [r0, #8]
	adds r0, r7, #0
	ands r0, r1
	cmp r0, #0
	beq _0809E838
	subs r0, r3, #1
	strb r0, [r2]
	b _0809E81E
_0809E7EE:
	movs r7, #0x80
	adds r0, r7, #0
	ands r0, r1
	cmp r0, #0
	beq _0809E838
	ldr r0, [r4, #0x2c]
	bl GetUnitItemCount
	adds r2, r4, #0
	adds r2, #0x31
	ldrb r1, [r2]
	subs r0, #1
	cmp r1, r0
	bge _0809E810
	adds r0, r1, #1
	strb r0, [r2]
	b _0809E81E
_0809E810:
	ldr r0, [r6]
	ldrh r1, [r0, #8]
	adds r0, r7, #0
	ands r0, r1
	cmp r0, #0
	beq _0809E838
	strb r5, [r2]
_0809E81E:
	ldr r0, _0809E834  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809E830
	movs r0, #0x66
	bl m4aSongNumStart
_0809E830:
	movs r0, #1
	b _0809E83A
	.align 2, 0
_0809E834: .4byte gRAMChapterData
_0809E838:
	movs r0, #0
_0809E83A:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_809E7A8

	THUMB_FUNC_START sub_809E840
sub_809E840: @ 0x0809E840
	push {lr}
	adds r0, #0x31
	ldrb r1, [r0]
	lsls r1, r1, #4
	adds r1, #0x48
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x10
	movs r2, #0xb
	bl sub_80AD51C
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_809E840

	THUMB_FUNC_START sub_809E85C
sub_809E85C: @ 0x0809E85C
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x2c]
	adds r7, r5, #0
	adds r7, #0x31
	ldrb r2, [r7]
	lsls r2, r2, #1
	adds r1, r0, #0
	adds r1, #0x1e
	adds r1, r1, r2
	ldrh r4, [r1]
	bl GetUnitItemCount
	ldr r1, [r5, #0x2c]
	ldrb r0, [r7]
	lsls r0, r0, #1
	adds r1, #0x1e
	adds r1, r1, r0
	movs r0, #0
	strh r0, [r1]
	ldr r0, [r5, #0x2c]
	bl UnitRemoveInvalidItems
	adds r0, r4, #0
	bl sub_8098014
	adds r6, r5, #0
	adds r6, #0x35
	strb r0, [r6]
	adds r0, r4, #0
	bl AddItemToConvoy
	ldr r0, [r5, #0x2c]
	ldrb r1, [r6]
	movs r2, #1
	bl SomethingPrepListRelated
	adds r0, r5, #0
	bl sub_809E100
	bl ResetIconGraphics_
	ldr r0, _0809E924  @ gUnknown_02022EEC
	ldr r4, _0809E928  @ gUnknown_02013670
	ldr r2, [r5, #0x2c]
	adds r1, r4, #0
	movs r3, #0
	bl sub_809B74C
	adds r4, #0x28
	ldr r1, _0809E92C  @ gUnknown_02023CC6
	ldrb r2, [r6]
	lsls r2, r2, #1
	adds r0, r5, #0
	adds r0, #0x4c
	adds r0, r0, r2
	ldrh r2, [r0]
	lsrs r2, r2, #4
	ldr r3, [r5, #0x2c]
	adds r0, r4, #0
	bl sub_809D300
	ldr r0, _0809E930  @ sub_809E2BC
	movs r1, #1
	adds r2, r5, #0
	bl sub_80ACE20
	movs r0, #4
	bl BG_EnableSyncByMask
	ldr r0, [r5, #0x2c]
	bl GetUnitItemCount
	adds r4, r0, #0
	ldr r1, _0809E934  @ gActionData
	movs r0, #0x1c
	strb r0, [r1, #0x11]
	cmp r4, #0
	beq _0809E906
	bl sub_8097CC8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x64
	bne _0809E93C
_0809E906:
	adds r0, r5, #0
	movs r1, #1
	bl Proc_Goto
	ldr r0, _0809E938  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809E96A
	movs r0, #0x6b
	bl m4aSongNumStart
	b _0809E96A
	.align 2, 0
_0809E924: .4byte gUnknown_02022EEC
_0809E928: .4byte gUnknown_02013670
_0809E92C: .4byte gUnknown_02023CC6
_0809E930: .4byte sub_809E2BC
_0809E934: .4byte gActionData
_0809E938: .4byte gRAMChapterData
_0809E93C:
	ldr r0, _0809E970  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809E94E
	movs r0, #0x6a
	bl m4aSongNumStart
_0809E94E:
	ldrb r0, [r7]
	cmp r4, r0
	bgt _0809E96A
	subs r0, r4, #1
	strb r0, [r7]
	ldrb r1, [r7]
	lsls r1, r1, #4
	adds r1, #0x48
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x10
	movs r2, #0xb
	bl sub_80AD51C
_0809E96A:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809E970: .4byte gRAMChapterData

	THUMB_FUNC_END sub_809E85C

	THUMB_FUNC_START sub_809E974
sub_809E974: @ 0x0809E974
	push {r4, r5, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x38]
	cmp r0, #1
	bne _0809E99C
	ldr r0, _0809E998  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0x81
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0809EA34
	bl CloseHelpBox
	movs r0, #0
	strh r0, [r4, #0x38]
	b _0809EA76
	.align 2, 0
_0809E998: .4byte gKeyStatusPtr
_0809E99C:
	ldr r0, _0809E9D0  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0809E9D4
	ldr r0, [r4, #0x2c]
	adds r1, r4, #0
	adds r1, #0x31
	ldrb r3, [r1]
	lsls r1, r3, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r2, [r0]
	cmp r2, #0
	beq _0809EA76
	lsls r1, r3, #4
	adds r1, #0x48
	movs r0, #0x10
	bl StartItemHelpBox
	movs r0, #1
	strh r0, [r4, #0x38]
	b _0809EA76
	.align 2, 0
_0809E9D0: .4byte gKeyStatusPtr
_0809E9D4:
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0809EA0C
	ldr r0, [r4, #0x2c]
	adds r1, r4, #0
	adds r1, #0x31
	ldrb r1, [r1]
	bl sub_8097F98
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0809EA04
	movs r1, #1
	negs r1, r1
	ldr r2, _0809EA00  @ 0x0000088B
	adds r0, r1, #0
	adds r3, r4, #0
	bl sub_8097DA8
	b _0809EA76
	.align 2, 0
_0809EA00: .4byte 0x0000088B
_0809EA04:
	adds r0, r4, #0
	bl sub_809E85C
	b _0809EA76
_0809EA0C:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0809EA34
	adds r0, r4, #0
	movs r1, #1
	bl Proc_Goto
	ldr r0, _0809EA30  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809EA76
	movs r0, #0x6b
	bl m4aSongNumStart
	b _0809EA76
	.align 2, 0
_0809EA30: .4byte gRAMChapterData
_0809EA34:
	adds r0, r4, #0
	bl sub_809E7A8
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809EA76
	adds r5, r4, #0
	adds r5, #0x31
	ldrb r1, [r5]
	lsls r1, r1, #4
	adds r1, #0x48
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x10
	movs r2, #0xb
	bl sub_80AD51C
	ldrh r0, [r4, #0x38]
	cmp r0, #1
	bne _0809EA76
	ldr r0, [r4, #0x2c]
	ldrb r3, [r5]
	lsls r1, r3, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r2, [r0]
	cmp r2, #0
	beq _0809EA76
	lsls r1, r3, #4
	adds r1, #0x48
	movs r0, #0x10
	bl StartItemHelpBox
_0809EA76:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_809E974

	THUMB_FUNC_START sub_809EA7C
sub_809EA7C: @ 0x0809EA7C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0809EAA0  @ gUnknown_03005280
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0809EAA4
	bl sub_80C4048
	cmp r0, #0
	beq _0809EABE
	adds r1, r4, #0
	adds r1, #0x35
	ldrb r1, [r1]
	adds r0, #0x2b
	b _0809EABC
	.align 2, 0
_0809EAA0: .4byte gUnknown_03005280
_0809EAA4:
	adds r0, r4, #0
	adds r0, #0x30
	ldrb r0, [r0]
	cmp r0, #0
	bne _0809EABE
	ldr r0, _0809EAD4  @ gUnknown_08A1829C
	bl Proc_Find
	adds r1, r4, #0
	adds r1, #0x35
	ldrb r1, [r1]
	adds r0, #0x32
_0809EABC:
	strb r1, [r0]
_0809EABE:
	adds r0, r4, #0
	bl sub_80ADDD4
	bl EndBG3Slider_
	movs r0, #0
	bl SetPrimaryHBlankHandler
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809EAD4: .4byte gUnknown_08A1829C

	THUMB_FUNC_END sub_809EA7C

	THUMB_FUNC_START sub_809EAD8
sub_809EAD8: @ 0x0809EAD8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0809EAF0  @ gUnknown_08A1920C
	bl Proc_StartBlocking
	str r4, [r0, #0x2c]
	adds r0, #0x30
	movs r1, #0
	strb r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809EAF0: .4byte gUnknown_08A1920C

	THUMB_FUNC_END sub_809EAD8

	THUMB_FUNC_START sub_809EAF4
sub_809EAF4: @ 0x0809EAF4
	push {r4, lr}
	ldr r4, _0809EB10  @ gActiveUnit
	ldr r0, [r4]
	cmp r0, #0
	beq _0809EB08
	bl MU_EndAll
	ldr r0, [r4]
	bl ShowUnitSMS
_0809EB08:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809EB10: .4byte gActiveUnit

	THUMB_FUNC_END sub_809EAF4

	THUMB_FUNC_START sub_809EB14
sub_809EB14: @ 0x0809EB14
	push {r4, lr}
	ldr r4, _0809EB34  @ gActiveUnit
	ldr r0, [r4]
	cmp r0, #0
	beq _0809EB2C
	bl HideUnitSMS
	ldr r0, [r4]
	bl MU_Create
	bl MU_SetDefaultFacing_Auto
_0809EB2C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809EB34: .4byte gActiveUnit

	THUMB_FUNC_END sub_809EB14

	THUMB_FUNC_START sub_809EB38
sub_809EB38: @ 0x0809EB38
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0809EB54  @ gUnknown_08A192EC
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x2c]
	adds r0, #0x30
	movs r1, #1
	strb r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809EB54: .4byte gUnknown_08A192EC

	THUMB_FUNC_END sub_809EB38

	THUMB_FUNC_START sub_809EB58
sub_809EB58: @ 0x0809EB58
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0809EB74  @ gUnknown_08A192EC
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x2c]
	adds r0, #0x30
	movs r1, #2
	strb r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809EB74: .4byte gUnknown_08A192EC

	THUMB_FUNC_END sub_809EB58

	THUMB_FUNC_START sub_809EB78
sub_809EB78: @ 0x0809EB78
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0809EBA4  @ gUnknown_08A1829C
	bl Proc_Find
	adds r2, r0, #0
	movs r0, #0
	strh r0, [r4, #0x36]
	movs r0, #0xff
	strh r0, [r4, #0x34]
	ldr r0, _0809EBA8  @ gUnknown_03005280
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0809EBB4
	bl sub_80C4048
	cmp r0, #0
	beq _0809EBAC
	adds r0, #0x2a
	b _0809EBB8
	.align 2, 0
_0809EBA4: .4byte gUnknown_08A1829C
_0809EBA8: .4byte gUnknown_03005280
_0809EBAC:
	adds r1, r4, #0
	adds r1, #0x33
	movs r0, #0
	b _0809EBBE
_0809EBB4:
	adds r0, r2, #0
	adds r0, #0x31
_0809EBB8:
	ldrb r0, [r0]
	adds r1, r4, #0
	adds r1, #0x33
_0809EBBE:
	strb r0, [r1]
	adds r2, r4, #0
	adds r2, #0x31
	movs r0, #0
	movs r1, #4
	strb r1, [r2]
	adds r1, r4, #0
	adds r1, #0x30
	strb r0, [r1]
	movs r3, #0
	adds r1, #0x1a
	adds r0, r4, #0
	adds r0, #0x38
	movs r2, #8
_0809EBDA:
	strh r3, [r0]
	strh r3, [r1]
	adds r1, #2
	adds r0, #2
	subs r2, #1
	cmp r2, #0
	bge _0809EBDA
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_809EB78

	THUMB_FUNC_START sub_809EBF0
sub_809EBF0: @ 0x0809EBF0
	push {r4, lr}
	sub sp, #8
	ldr r4, _0809EC2C  @ gUnknown_02022D10
	adds r0, r4, #0
	movs r1, #0xc
	movs r2, #1
	movs r3, #0
	bl TileMap_FillRect
	ldr r0, _0809EC30  @ 0x000005A9
	bl GetStringFromIndex
	ldr r2, _0809EC34  @ gUnknown_020136D8
	movs r1, #0
	str r1, [sp]
	str r0, [sp, #4]
	adds r0, r2, #0
	adds r1, r4, #0
	movs r2, #0
	movs r3, #0
	bl DrawTextInline
	movs r0, #1
	bl BG_EnableSyncByMask
	add sp, #8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809EC2C: .4byte gUnknown_02022D10
_0809EC30: .4byte 0x000005A9
_0809EC34: .4byte gUnknown_020136D8

	THUMB_FUNC_END sub_809EBF0

	THUMB_FUNC_START sub_809EC38
sub_809EC38: @ 0x0809EC38
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	adds r6, r0, #0
	adds r6, #0x33
	ldrb r1, [r6]
	lsls r1, r1, #1
	adds r5, r0, #0
	adds r5, #0x38
	adds r1, r5, r1
	ldrh r4, [r1]
	ldr r0, _0809EC84  @ gUnknown_02022D18
	mov r8, r0
	movs r1, #0xa
	movs r2, #1
	movs r3, #0
	bl TileMap_FillRect
	ldr r7, _0809EC88  @ gUnknown_02013668
	adds r0, r7, #0
	bl Text_Clear
	ldr r0, _0809EC8C  @ gUnknown_02012F56
	ldrh r0, [r0]
	cmp r0, r4
	bgt _0809EC94
	ldr r0, _0809EC90  @ 0x00000536
	bl GetStringFromIndex
	movs r1, #0
	str r1, [sp]
	str r0, [sp, #4]
	adds r0, r7, #0
	mov r1, r8
	movs r2, #1
	b _0809ECBA
	.align 2, 0
_0809EC84: .4byte gUnknown_02022D18
_0809EC88: .4byte gUnknown_02013668
_0809EC8C: .4byte gUnknown_02012F56
_0809EC90: .4byte 0x00000536
_0809EC94:
	ldr r0, _0809ECC4  @ gUnknown_020122D4
	ldrb r1, [r6]
	lsls r1, r1, #1
	adds r1, r5, r1
	ldrh r1, [r1]
	lsls r1, r1, #2
	adds r1, r1, r0
	ldrb r4, [r1]
	cmp r4, #0
	bne _0809ECC8
	movs r0, #0xb3
	lsls r0, r0, #3
	bl GetStringFromIndex
	str r4, [sp]
	str r0, [sp, #4]
	adds r0, r7, #0
	mov r1, r8
	movs r2, #3
_0809ECBA:
	movs r3, #0
	bl DrawTextInline
	b _0809ECE8
	.align 2, 0
_0809ECC4: .4byte gUnknown_020122D4
_0809ECC8:
	adds r0, r4, #0
	bl GetUnitFromCharId
	ldr r0, [r0]
	ldrh r0, [r0]
	bl GetStringFromIndex
	movs r1, #0
	str r1, [sp]
	str r0, [sp, #4]
	adds r0, r7, #0
	mov r1, r8
	movs r2, #0
	movs r3, #0
	bl DrawTextInline
_0809ECE8:
	movs r0, #1
	bl BG_EnableSyncByMask
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_809EC38

	THUMB_FUNC_START sub_809ECFC
sub_809ECFC: @ 0x0809ECFC
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r6, r0, #0
	adds r7, r6, #0
	adds r7, #0x33
	ldrb r0, [r7]
	lsls r4, r0, #1
	adds r4, r4, r0
	lsls r4, r4, #2
	adds r4, #0x7c
	bl GetGameClock
	ldr r2, _0809ED74  @ gPaletteBuffer
	lsrs r0, r0, #2
	movs r1, #0xf
	ands r0, r1
	lsls r0, r0, #1
	ldr r1, _0809ED78  @ gUnknown_08A1BD60
	adds r0, r0, r1
	ldrh r0, [r0]
	ldr r1, _0809ED7C  @ 0x0000029A
	adds r2, r2, r1
	strh r0, [r2]
	bl EnablePaletteSync
	ldr r1, _0809ED80  @ gUnknown_08A19608
	ldrb r0, [r7]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r3, [r0]
	movs r5, #0x85
	lsls r5, r5, #7
	str r5, [sp]
	movs r0, #4
	adds r1, r4, #0
	movs r2, #0x18
	bl PutSprite
	ldr r3, _0809ED84  @ gUnknown_08A195F8
	str r5, [sp]
	movs r0, #4
	adds r1, r4, #0
	movs r2, #0x18
	bl PutSprite
	ldrb r0, [r7]
	lsls r0, r0, #1
	adds r6, #0x4a
	adds r6, r6, r0
	ldrh r1, [r6]
	ldr r0, _0809ED88  @ gUnknown_02012F56
	ldrh r2, [r0]
	movs r0, #0xc
	movs r3, #7
	bl sub_80976CC
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809ED74: .4byte gPaletteBuffer
_0809ED78: .4byte gUnknown_08A1BD60
_0809ED7C: .4byte 0x0000029A
_0809ED80: .4byte gUnknown_08A19608
_0809ED84: .4byte gUnknown_08A195F8
_0809ED88: .4byte gUnknown_02012F56

	THUMB_FUNC_END sub_809ECFC

	THUMB_FUNC_START sub_809ED8C
sub_809ED8C: @ 0x0809ED8C
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	sub sp, #8
	adds r7, r0, #0
	ldr r0, _0809F0C0  @ gLCDControlBuffer
	mov r8, r0
	ldrb r1, [r0]
	movs r0, #8
	negs r0, r0
	ands r0, r1
	mov r1, r8
	strb r0, [r1]
	movs r0, #0
	bl SetupBackgrounds
	movs r0, #0
	bl BG_GetMapBuffer
	movs r1, #0
	bl BG_Fill
	movs r0, #1
	bl BG_GetMapBuffer
	movs r1, #0
	bl BG_Fill
	movs r0, #2
	bl BG_GetMapBuffer
	movs r1, #0
	bl BG_Fill
	mov r0, r8
	ldrb r2, [r0, #0xc]
	movs r1, #4
	negs r1, r1
	adds r0, r1, #0
	ands r0, r2
	movs r2, #1
	mov r9, r2
	mov r2, r9
	orrs r0, r2
	mov r2, r8
	strb r0, [r2, #0xc]
	ldrb r2, [r2, #0x10]
	adds r0, r1, #0
	ands r0, r2
	movs r5, #2
	orrs r0, r5
	mov r2, r8
	strb r0, [r2, #0x10]
	ldrb r0, [r2, #0x14]
	ands r1, r0
	strb r1, [r2, #0x14]
	ldrb r0, [r2, #0x18]
	movs r1, #3
	orrs r0, r1
	strb r0, [r2, #0x18]
	bl ResetFaces
	bl Font_InitForUIDefault
	bl ResetIconGraphics_
	bl LoadUiFrameGraphics
	bl LoadObjUIGfx
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	adds r0, r7, #0
	adds r0, #0x33
	ldrb r1, [r0]
	lsls r1, r1, #1
	adds r0, #0x17
	adds r0, r0, r1
	ldrh r2, [r0]
	subs r2, #0x28
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #2
	movs r1, #0
	bl BG_SetPosition
	ldr r0, _0809F0C4  @ 0x06012000
	movs r1, #1
	negs r1, r1
	bl LoadDialogueBoxGfx
	movs r0, #4
	bl LoadIconPalettes
	bl sub_8095A1C
	movs r0, #0xa0
	lsls r0, r0, #7
	movs r1, #5
	bl sub_8098C3C
	ldr r0, _0809F0C8  @ gUnknown_08A1B9EC
	ldr r4, _0809F0CC  @ gUnknown_02020188
	adds r1, r4, #0
	bl CopyDataWithPossibleUncomp
	ldr r0, _0809F0D0  @ gBG1TilemapBuffer
	movs r2, #0x80
	lsls r2, r2, #5
	adds r1, r4, #0
	bl CallARM_FillTileRect
	movs r0, #7
	bl BG_EnableSyncByMask
	adds r0, r7, #0
	bl sub_80AC9C0
	adds r0, r7, #0
	bl sub_80AD47C
	movs r0, #0xc0
	lsls r0, r0, #3
	movs r1, #1
	bl sub_80AD4A0
	mov r1, r8
	ldrb r0, [r1, #1]
	movs r1, #0x20
	orrs r0, r1
	movs r1, #0x41
	negs r1, r1
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	mov r2, r8
	strb r0, [r2, #1]
	mov r1, r8
	adds r1, #0x2d
	movs r0, #0x80
	strb r0, [r1]
	adds r1, #4
	movs r0, #0x28
	strb r0, [r1]
	subs r1, #5
	movs r0, #0xe0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0x98
	strb r0, [r1]
	adds r2, #0x34
	ldrb r0, [r2]
	mov r1, r9
	orrs r0, r1
	orrs r0, r5
	movs r1, #4
	orrs r0, r1
	movs r4, #8
	orrs r0, r4
	movs r3, #0x10
	orrs r0, r3
	strb r0, [r2]
	adds r2, #2
	ldrb r0, [r2]
	mov r1, r9
	orrs r0, r1
	orrs r0, r5
	movs r1, #5
	negs r1, r1
	ands r0, r1
	orrs r0, r4
	orrs r0, r3
	strb r0, [r2]
	adds r0, r7, #0
	bl NewGreenTextColorManager
	movs r0, #0xc3
	movs r1, #0x93
	movs r2, #9
	adds r3, r7, #0
	bl StartHelpPromptSprite
	ldr r4, _0809F0D4  @ gUnknown_02013660
	adds r0, r4, #0
	movs r1, #6
	bl Text_Init
	adds r0, r4, #0
	adds r0, #8
	movs r1, #5
	bl Text_Init
	adds r0, r4, #0
	adds r0, #0x78
	movs r1, #4
	bl Text_Init
	adds r4, #0x10
	movs r5, #4
_0809EF2C:
	adds r0, r4, #0
	movs r1, #7
	bl Text_Init
	adds r4, #8
	subs r5, #1
	cmp r5, #0
	bge _0809EF2C
	movs r2, #0x33
	adds r2, r2, r7
	mov r8, r2
	adds r6, r7, #0
	adds r6, #0x4a
	ldr r4, _0809F0D8  @ gUnknown_02013698
	movs r5, #7
_0809EF4A:
	adds r0, r4, #0
	movs r1, #7
	bl Text_Allocate
	adds r4, #8
	subs r5, #1
	cmp r5, #0
	bge _0809EF4A
	movs r4, #0x80
	lsls r4, r4, #7
	adds r0, r4, #0
	movs r1, #6
	bl StoreConvoyWeaponIconGraphics
	ldr r0, _0809F0DC  @ gUnknown_02022D86
	mov r9, r0
	adds r1, r4, #0
	movs r2, #6
	bl sub_809D8D4
	ldr r0, _0809F0E0  @ gUnknown_08A19CCC
	ldr r1, _0809F0E4  @ 0x06015000
	bl CopyDataWithPossibleUncomp
	ldr r0, _0809F0E8  @ gUnknown_08A1A084
	movs r4, #0xa0
	lsls r4, r4, #2
	adds r1, r4, #0
	movs r2, #0x20
	bl CopyToPaletteBuffer
	movs r3, #0xb0
	lsls r3, r3, #7
	movs r0, #9
	str r0, [sp]
	adds r0, r7, #0
	movs r1, #0xe1
	movs r2, #0x2f
	bl sub_8097748
	bl sub_8097668
	ldr r0, [r7, #0x2c]
	mov r2, r8
	ldrb r1, [r2]
	movs r2, #3
	bl SomethingPrepListRelated
	adds r0, r7, #0
	bl sub_809F5F4
	ldr r5, _0809F0D8  @ gUnknown_02013698
	ldr r1, _0809F0EC  @ gUnknown_02023CC6
	mov r2, r8
	ldrb r0, [r2]
	lsls r0, r0, #1
	adds r0, r6, r0
	ldrh r2, [r0]
	lsrs r2, r2, #4
	ldr r3, [r7, #0x2c]
	adds r0, r5, #0
	bl sub_809D300
	movs r0, #4
	bl BG_EnableSyncByMask
	movs r0, #0xb3
	lsls r0, r0, #1
	add r0, r9
	adds r1, r5, #0
	subs r1, #0x28
	ldr r2, [r7, #0x2c]
	movs r3, #0
	bl sub_809B74C
	bl sub_809EBF0
	adds r0, r7, #0
	bl sub_80ACCE0
	movs r0, #0
	adds r1, r4, #0
	movs r2, #2
	bl sub_80ACCF4
	movs r0, #0x78
	movs r1, #0x18
	movs r2, #0xe9
	movs r3, #0x18
	bl sub_80ACD7C
	movs r0, #3
	bl sub_80ACD60
	ldr r0, _0809F0F0  @ sub_809ECFC
	adds r1, r7, #0
	bl Get6CDifferedLoop6C
	ldr r0, [r7, #0x2c]
	bl GetUnitPortraitId
	adds r1, r0, #0
	movs r3, #4
	negs r3, r3
	ldr r0, _0809F0F4  @ 0x00000203
	str r0, [sp]
	movs r0, #0
	movs r2, #0x40
	bl sub_80064F4
	ldr r0, [r7, #0x2c]
	ldr r0, [r0]
	ldrh r0, [r0]
	bl GetStringFromIndex
	mov r8, r0
	movs r1, #0xe0
	lsls r1, r1, #4
	movs r3, #0xc0
	lsls r3, r3, #4
	movs r0, #0x80
	lsls r0, r0, #3
	str r0, [sp]
	str r7, [sp, #4]
	movs r0, #0xd
	movs r2, #0xf
	bl sub_80ADB7C
	movs r1, #0x28
	negs r1, r1
	movs r2, #1
	negs r2, r2
	movs r0, #0
	movs r3, #1
	bl sub_80ADBFC
	movs r0, #1
	movs r1, #0x98
	movs r2, #6
	movs r3, #2
	bl sub_80ADBFC
	movs r0, #1
	movs r1, #0xe
	movs r2, #4
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	movs r4, #0
	str r4, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl sub_8001ED0
	str r4, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #1
	bl sub_8001F0C
	movs r0, #0x30
	mov r1, r8
	bl GetStringTextCenteredPos
	adds r3, r0, #0
	subs r5, #0x38
	str r4, [sp]
	mov r0, r8
	str r0, [sp, #4]
	adds r0, r5, #0
	ldr r1, _0809F0F8  @ gBG0TilemapBuffer
	movs r2, #0
	bl DrawTextInline
	adds r0, r7, #0
	bl sub_809EC38
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809F0C0: .4byte gLCDControlBuffer
_0809F0C4: .4byte 0x06012000
_0809F0C8: .4byte gUnknown_08A1B9EC
_0809F0CC: .4byte gUnknown_02020188
_0809F0D0: .4byte gBG1TilemapBuffer
_0809F0D4: .4byte gUnknown_02013660
_0809F0D8: .4byte gUnknown_02013698
_0809F0DC: .4byte gUnknown_02022D86
_0809F0E0: .4byte gUnknown_08A19CCC
_0809F0E4: .4byte 0x06015000
_0809F0E8: .4byte gUnknown_08A1A084
_0809F0EC: .4byte gUnknown_02023CC6
_0809F0F0: .4byte sub_809ECFC
_0809F0F4: .4byte 0x00000203
_0809F0F8: .4byte gBG0TilemapBuffer

	THUMB_FUNC_END sub_809ED8C

	THUMB_FUNC_START sub_809F0FC
sub_809F0FC: @ 0x0809F0FC
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0809F120  @ gUnknown_03005280
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0809F124
	bl sub_80C4048
	cmp r0, #0
	beq _0809F134
	adds r1, r4, #0
	adds r1, #0x33
	ldrb r1, [r1]
	adds r0, #0x2a
	b _0809F132
	.align 2, 0
_0809F120: .4byte gUnknown_03005280
_0809F124:
	ldr r0, _0809F14C  @ gUnknown_08A1829C
	bl Proc_Find
	adds r1, r4, #0
	adds r1, #0x33
	ldrb r1, [r1]
	adds r0, #0x31
_0809F132:
	strb r1, [r0]
_0809F134:
	adds r0, r4, #0
	bl sub_80ADDD4
	movs r0, #0
	bl DeleteFaceByIndex
	bl EndBG3Slider_
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809F14C: .4byte gUnknown_08A1829C

	THUMB_FUNC_END sub_809F0FC

	THUMB_FUNC_START sub_809F150
sub_809F150: @ 0x0809F150
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	bl ResetIconGraphics_
	ldr r0, [r4, #0x2c]
	adds r5, r4, #0
	adds r5, #0x33
	ldrb r1, [r5]
	movs r2, #3
	bl SomethingPrepListRelated
	adds r0, r4, #0
	bl sub_809F370
	ldr r0, _0809F1F0  @ gUnknown_02013698
	ldr r1, _0809F1F4  @ gUnknown_02023CC6
	ldrb r2, [r5]
	lsls r2, r2, #1
	adds r6, r4, #0
	adds r6, #0x4a
	adds r2, r6, r2
	ldrh r2, [r2]
	lsrs r2, r2, #4
	ldr r3, [r4, #0x2c]
	bl sub_809D300
	ldr r0, _0809F1F8  @ gUnknown_02022EEC
	ldr r1, [r4, #0x2c]
	bl sub_809B830
	ldrb r0, [r5]
	lsls r0, r0, #1
	adds r7, r4, #0
	adds r7, #0x38
	adds r1, r7, r0
	ldrh r1, [r1]
	lsls r1, r1, #4
	adds r0, r6, r0
	ldrh r0, [r0]
	subs r0, #0x28
	subs r1, r1, r0
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x80
	movs r2, #0xb
	bl sub_80AD51C
	movs r0, #5
	bl BG_EnableSyncByMask
	ldr r0, _0809F1FC  @ sub_809EC38
	movs r1, #2
	adds r2, r4, #0
	bl sub_80ACE20
	ldrh r0, [r4, #0x36]
	cmp r0, #0
	beq _0809F210
	ldr r0, _0809F200  @ gUnknown_02012F56
	ldrh r0, [r0]
	cmp r0, #0
	beq _0809F208
	ldr r2, _0809F204  @ gUnknown_020122D4
	ldrb r3, [r5]
	lsls r3, r3, #1
	adds r0, r7, r3
	ldrh r1, [r0]
	lsls r0, r1, #2
	adds r0, r0, r2
	ldrh r2, [r0, #2]
	lsls r1, r1, #4
	adds r3, r6, r3
	ldrh r0, [r3]
	subs r0, #0x28
	subs r1, r1, r0
	movs r0, #0x80
	bl StartItemHelpBox
	movs r0, #1
	b _0809F20E
	.align 2, 0
_0809F1F0: .4byte gUnknown_02013698
_0809F1F4: .4byte gUnknown_02023CC6
_0809F1F8: .4byte gUnknown_02022EEC
_0809F1FC: .4byte sub_809EC38
_0809F200: .4byte gUnknown_02012F56
_0809F204: .4byte gUnknown_020122D4
_0809F208:
	bl CloseHelpBox
	movs r0, #0xff
_0809F20E:
	strh r0, [r4, #0x36]
_0809F210:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_809F150

	THUMB_FUNC_START sub_809F218
sub_809F218: @ 0x0809F218
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r7, r0, #0
	movs r0, #4
	mov r8, r0
	adds r1, r7, #0
	adds r1, #0x32
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldrb r4, [r1]
	cmp r4, #4
	bge _0809F24A
	mov r2, r8
	subs r1, r2, r4
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #5
	muls r0, r1, r0
	movs r1, #0x10
	bl __divsi3
	adds r6, r0, #0
	subs r6, #0x60
_0809F24A:
	adds r5, r7, #0
	adds r5, #0x33
	cmp r4, #4
	bne _0809F266
	ldrb r0, [r5]
	cmp r0, #0
	bne _0809F25C
	movs r0, #8
	b _0809F25E
_0809F25C:
	subs r0, #1
_0809F25E:
	strb r0, [r5]
	adds r0, r7, #0
	bl sub_809F150
_0809F266:
	adds r4, r7, #0
	adds r4, #0x32
	ldrb r1, [r4]
	cmp r1, r8
	blt _0809F28A
	mov r0, r8
	subs r1, r1, r0
	subs r1, r0, r1
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #5
	muls r0, r1, r0
	mov r2, r8
	mov r1, r8
	muls r1, r2, r1
	bl __divsi3
	adds r6, r0, #0
_0809F28A:
	movs r0, #0xff
	ands r6, r0
	ldrb r1, [r5]
	lsls r1, r1, #1
	adds r0, r7, #0
	adds r0, #0x4a
	adds r0, r0, r1
	ldrh r2, [r0]
	subs r2, #0x28
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #2
	adds r1, r6, #0
	bl BG_SetPosition
	ldrb r1, [r4]
	mov r2, r8
	lsls r0, r2, #1
	cmp r1, r0
	bne _0809F2BA
	adds r0, r7, #0
	movs r1, #1
	bl Proc_Goto
_0809F2BA:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_809F218

	THUMB_FUNC_START sub_809F2C4
sub_809F2C4: @ 0x0809F2C4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r7, r0, #0
	movs r0, #4
	mov r8, r0
	adds r1, r7, #0
	adds r1, #0x32
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldrb r4, [r1]
	cmp r4, #4
	bge _0809F2F6
	mov r2, r8
	subs r1, r2, r4
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #5
	muls r0, r1, r0
	movs r1, #0x10
	bl __divsi3
	movs r1, #0x60
	subs r6, r1, r0
_0809F2F6:
	adds r5, r7, #0
	adds r5, #0x33
	cmp r4, #4
	bne _0809F312
	ldrb r0, [r5]
	cmp r0, #8
	bne _0809F308
	movs r0, #0
	b _0809F30A
_0809F308:
	adds r0, #1
_0809F30A:
	strb r0, [r5]
	adds r0, r7, #0
	bl sub_809F150
_0809F312:
	adds r4, r7, #0
	adds r4, #0x32
	ldrb r1, [r4]
	cmp r1, r8
	blt _0809F336
	mov r0, r8
	subs r1, r1, r0
	subs r1, r0, r1
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #5
	muls r0, r1, r0
	mov r2, r8
	mov r1, r8
	muls r1, r2, r1
	bl __divsi3
	negs r6, r0
_0809F336:
	movs r0, #0xff
	ands r6, r0
	ldrb r1, [r5]
	lsls r1, r1, #1
	adds r0, r7, #0
	adds r0, #0x4a
	adds r0, r0, r1
	ldrh r2, [r0]
	subs r2, #0x28
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #2
	adds r1, r6, #0
	bl BG_SetPosition
	ldrb r1, [r4]
	mov r2, r8
	lsls r0, r2, #1
	cmp r1, r0
	bne _0809F366
	adds r0, r7, #0
	movs r1, #1
	bl Proc_Goto
_0809F366:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_809F2C4

	THUMB_FUNC_START sub_809F370
sub_809F370: @ 0x0809F370
	push {r4, r5, lr}
	mov ip, r0
	ldr r0, _0809F398  @ gUnknown_02012F56
	ldrh r4, [r0]
	adds r5, r0, #0
	cmp r4, #0
	bne _0809F39C
	mov r3, ip
	adds r3, #0x33
	ldrb r0, [r3]
	lsls r0, r0, #1
	mov r1, ip
	adds r1, #0x38
	adds r1, r1, r0
	mov r2, ip
	adds r2, #0x4a
	adds r0, r2, r0
	strh r4, [r0]
	strh r4, [r1]
	b _0809F3BA
	.align 2, 0
_0809F398: .4byte gUnknown_02012F56
_0809F39C:
	mov r2, ip
	adds r2, #0x33
	ldrb r0, [r2]
	lsls r0, r0, #1
	mov r1, ip
	adds r1, #0x38
	adds r4, r1, r0
	ldrh r1, [r4]
	ldrh r0, [r5]
	subs r0, #1
	adds r3, r2, #0
	adds r2, #0x17
	cmp r1, r0
	ble _0809F3BA
	strh r0, [r4]
_0809F3BA:
	ldrh r0, [r5]
	cmp r0, #6
	bls _0809F3D8
	ldrb r0, [r3]
	lsls r0, r0, #1
	adds r4, r2, r0
	ldrh r0, [r4]
	lsrs r0, r0, #4
	adds r0, #7
	ldrh r1, [r5]
	cmp r0, r1
	ble _0809F3D8
	subs r0, r1, #7
	lsls r0, r0, #4
	strh r0, [r4]
_0809F3D8:
	ldrb r0, [r3]
	lsls r0, r0, #1
	adds r0, r2, r0
	ldrh r2, [r0]
	subs r2, #0x28
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #2
	movs r1, #0
	bl BG_SetPosition
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_809F370

	THUMB_FUNC_START sub_809F3F4
sub_809F3F4: @ 0x0809F3F4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	adds r7, r1, #0
	bl ResetIconGraphics_
	ldr r0, _0809F48C  @ gUnknown_02023CC6
	mov r8, r0
	adds r6, r4, #0
	adds r6, #0x33
	ldrb r0, [r6]
	lsls r0, r0, #1
	adds r5, r4, #0
	adds r5, #0x4a
	adds r0, r5, r0
	ldrh r1, [r0]
	lsrs r1, r1, #4
	mov r0, r8
	bl sub_809D418
	ldr r0, _0809F490  @ gUnknown_02022EEC
	ldr r1, [r4, #0x2c]
	bl sub_809B830
	movs r0, #5
	bl BG_EnableSyncByMask
	cmp r7, #0
	bge _0809F446
	ldr r0, _0809F494  @ gUnknown_02013698
	ldrb r1, [r6]
	lsls r1, r1, #1
	adds r1, r5, r1
	ldrh r2, [r1]
	lsrs r2, r2, #4
	subs r2, #1
	ldr r3, [r4, #0x2c]
	mov r1, r8
	bl sub_809D47C
_0809F446:
	cmp r7, #0
	ble _0809F460
	ldr r0, _0809F494  @ gUnknown_02013698
	ldrb r1, [r6]
	lsls r1, r1, #1
	adds r1, r5, r1
	ldrh r2, [r1]
	lsrs r2, r2, #4
	adds r2, #7
	ldr r3, [r4, #0x2c]
	mov r1, r8
	bl sub_809D47C
_0809F460:
	ldrb r1, [r6]
	lsls r1, r1, #1
	adds r1, r5, r1
	ldrh r0, [r1]
	adds r0, r0, r7
	strh r0, [r1]
	ldrb r0, [r6]
	lsls r0, r0, #1
	adds r0, r5, r0
	ldrh r2, [r0]
	subs r2, #0x28
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #2
	movs r1, #0
	bl BG_SetPosition
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809F48C: .4byte gUnknown_02023CC6
_0809F490: .4byte gUnknown_02022EEC
_0809F494: .4byte gUnknown_02013698

	THUMB_FUNC_END sub_809F3F4

	THUMB_FUNC_START sub_809F498
sub_809F498: @ 0x0809F498
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	adds r6, r0, #0
	ldr r0, [r6, #0x2c]
	bl GetUnitItemCount
	adds r2, r0, #0
	cmp r2, #5
	beq _0809F4B6
	ldr r0, _0809F4CC  @ gUnknown_02012F56
	ldrh r0, [r0]
	cmp r0, #0
	bne _0809F4D4
_0809F4B6:
	ldr r0, _0809F4D0  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	bge _0809F4C4
	b _0809F5E2
_0809F4C4:
	movs r0, #0x6c
	bl m4aSongNumStart
	b _0809F5E2
	.align 2, 0
_0809F4CC: .4byte gUnknown_02012F56
_0809F4D0: .4byte gRAMChapterData
_0809F4D4:
	movs r4, #0
	strh r4, [r6, #0x36]
	ldr r1, [r6, #0x2c]
	lsls r0, r2, #1
	adds r1, #0x1e
	adds r1, r1, r0
	ldr r0, _0809F5B8  @ gUnknown_020122D4
	mov r9, r0
	adds r7, r6, #0
	adds r7, #0x33
	ldrb r0, [r7]
	lsls r0, r0, #1
	adds r5, r6, #0
	adds r5, #0x38
	adds r0, r5, r0
	ldrh r0, [r0]
	lsls r0, r0, #2
	add r0, r9
	ldrh r0, [r0, #2]
	strh r0, [r1]
	ldr r0, [r6, #0x2c]
	bl UnitRemoveInvalidItems
	ldrb r0, [r7]
	lsls r0, r0, #1
	adds r0, r5, r0
	ldrh r0, [r0]
	lsls r0, r0, #2
	add r0, r9
	strh r4, [r0, #2]
	bl sub_80982B8
	ldr r0, [r6, #0x2c]
	ldrb r1, [r7]
	movs r2, #3
	bl SomethingPrepListRelated
	adds r0, r6, #0
	bl sub_809F370
	bl ResetIconGraphics_
	ldr r0, _0809F5BC  @ gUnknown_02022EEC
	ldr r4, _0809F5C0  @ gUnknown_02013670
	ldr r2, [r6, #0x2c]
	adds r1, r4, #0
	movs r3, #0
	bl sub_809B74C
	adds r4, #0x28
	ldr r1, _0809F5C4  @ gUnknown_02023CC6
	ldrb r0, [r7]
	lsls r0, r0, #1
	movs r2, #0x4a
	adds r2, r2, r6
	mov r8, r2
	add r0, r8
	ldrh r2, [r0]
	lsrs r2, r2, #4
	ldr r3, [r6, #0x2c]
	adds r0, r4, #0
	bl sub_809D300
	ldrb r0, [r7]
	lsls r0, r0, #1
	adds r0, r5, r0
	ldrh r0, [r0]
	lsls r0, r0, #2
	add r0, r9
	ldrb r0, [r0]
	cmp r0, #0
	beq _0809F56E
	ldr r0, _0809F5C8  @ sub_809EC38
	movs r1, #1
	adds r2, r6, #0
	bl sub_80ACE20
_0809F56E:
	ldrb r0, [r7]
	lsls r0, r0, #1
	adds r1, r5, r0
	ldrh r1, [r1]
	lsls r1, r1, #4
	add r0, r8
	ldrh r0, [r0]
	subs r0, #0x28
	subs r1, r1, r0
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x80
	movs r2, #0xb
	bl sub_80AD51C
	movs r0, #5
	bl BG_EnableSyncByMask
	ldr r0, [r6, #0x2c]
	bl GetUnitItemCount
	cmp r0, #5
	bne _0809F5D0
	adds r0, r6, #0
	movs r1, #1
	bl Proc_Goto
	ldr r0, _0809F5CC  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809F5E2
	movs r0, #0x6b
	bl m4aSongNumStart
	b _0809F5E2
	.align 2, 0
_0809F5B8: .4byte gUnknown_020122D4
_0809F5BC: .4byte gUnknown_02022EEC
_0809F5C0: .4byte gUnknown_02013670
_0809F5C4: .4byte gUnknown_02023CC6
_0809F5C8: .4byte sub_809EC38
_0809F5CC: .4byte gRAMChapterData
_0809F5D0:
	ldr r0, _0809F5F0  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809F5E2
	movs r0, #0x6a
	bl m4aSongNumStart
_0809F5E2:
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809F5F0: .4byte gRAMChapterData

	THUMB_FUNC_END sub_809F498

	THUMB_FUNC_START sub_809F5F4
sub_809F5F4: @ 0x0809F5F4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov ip, r0
	adds r0, #0x33
	ldrb r1, [r0]
	lsls r1, r1, #1
	adds r0, #5
	adds r4, r0, r1
	ldrh r3, [r4]
	lsls r2, r3, #4
	adds r0, #0x12
	adds r0, r0, r1
	ldrh r0, [r0]
	subs r0, #0x28
	subs r2, r2, r0
	cmp r2, #0x37
	bgt _0809F620
	cmp r3, #0
	beq _0809F620
	adds r0, r3, #1
	strh r0, [r4]
_0809F620:
	mov r4, ip
	adds r4, #0x33
	ldrb r0, [r4]
	lsls r0, r0, #1
	mov r3, ip
	adds r3, #0x38
	adds r6, r3, r0
	ldrh r5, [r6]
	lsls r1, r5, #4
	mov r2, ip
	adds r2, #0x4a
	adds r0, r2, r0
	ldrh r0, [r0]
	subs r0, #0x28
	subs r1, r1, r0
	adds r7, r3, #0
	mov r8, r2
	cmp r1, #0x78
	ble _0809F654
	ldr r0, _0809F684  @ gUnknown_02012F56
	ldrh r0, [r0]
	subs r0, #1
	cmp r5, r0
	beq _0809F654
	subs r0, r5, #1
	strh r0, [r6]
_0809F654:
	mov r0, ip
	bl sub_809F370
	ldrb r0, [r4]
	lsls r0, r0, #1
	adds r1, r7, r0
	ldrh r1, [r1]
	lsls r1, r1, #4
	add r0, r8
	ldrh r0, [r0]
	subs r0, #0x28
	subs r1, r1, r0
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x80
	movs r2, #0xb
	bl sub_80AD51C
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809F684: .4byte gUnknown_02012F56

	THUMB_FUNC_END sub_809F5F4

	THUMB_FUNC_START sub_809F688
sub_809F688: @ 0x0809F688
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	adds r4, r0, #0
	adds r6, r4, #0
	adds r6, #0x33
	ldrb r0, [r6]
	lsls r0, r0, #1
	movs r1, #0x38
	adds r1, r1, r4
	mov r8, r1
	adds r1, r1, r0
	ldrh r1, [r1]
	mov r9, r1
	adds r5, r4, #0
	adds r5, #0x4a
	adds r7, r5, r0
	ldrh r0, [r7]
	movs r2, #0xf
	mov sl, r2
	mov r1, sl
	ands r1, r0
	mov sl, r1
	cmp r1, #0
	beq _0809F6C0
	b _0809F908
_0809F6C0:
	ldrh r0, [r4, #0x36]
	cmp r0, #0
	beq _0809F6CC
	cmp r0, #0xff
	beq _0809F6CC
	b _0809F7C0
_0809F6CC:
	ldr r1, _0809F708  @ gKeyStatusPtr
	ldr r0, [r1]
	ldrh r3, [r0, #8]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r3
	mov r8, r1
	cmp r0, #0
	beq _0809F714
	ldr r0, _0809F70C  @ gUnknown_02012F56
	ldrh r0, [r0]
	cmp r0, #0
	beq _0809F724
	ldr r1, _0809F710  @ gUnknown_020122D4
	mov r2, r9
	lsls r0, r2, #2
	adds r0, r0, r1
	ldrh r2, [r0, #2]
	mov r0, r9
	lsls r1, r0, #4
	ldrh r0, [r7]
	subs r0, #0x28
	subs r1, r1, r0
	movs r0, #0x80
	bl StartItemHelpBox
	movs r0, #1
	strh r0, [r4, #0x36]
	b _0809FA7A
	.align 2, 0
_0809F708: .4byte gKeyStatusPtr
_0809F70C: .4byte gUnknown_02012F56
_0809F710: .4byte gUnknown_020122D4
_0809F714:
	movs r0, #1
	ands r0, r3
	cmp r0, #0
	beq _0809F794
	ldr r0, _0809F73C  @ gUnknown_02012F56
	ldrh r0, [r0]
	cmp r0, #0
	bne _0809F744
_0809F724:
	ldr r0, _0809F740  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	bge _0809F732
	b _0809FA7A
_0809F732:
	movs r0, #0x6c
	bl m4aSongNumStart
	b _0809FA7A
	.align 2, 0
_0809F73C: .4byte gUnknown_02012F56
_0809F740: .4byte gRAMChapterData
_0809F744:
	ldr r0, _0809F76C  @ gUnknown_020122D4
	mov r2, r9
	lsls r1, r2, #2
	adds r1, r1, r0
	ldrb r0, [r1]
	cmp r0, #0
	bne _0809F770
	lsls r2, r2, #4
	ldrh r0, [r7]
	subs r0, #0x28
	subs r2, r2, r0
	movs r0, #0
	movs r1, #0x80
	movs r3, #2
	bl sub_80AC9D4
	adds r0, r4, #0
	movs r1, #7
	b _0809F774
	.align 2, 0
_0809F76C: .4byte gUnknown_020122D4
_0809F770:
	adds r0, r4, #0
	movs r1, #6
_0809F774:
	bl Proc_Goto
	ldr r0, _0809F790  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	bge _0809F786
	b _0809FA7A
_0809F786:
	movs r0, #0x6a
	bl m4aSongNumStart
	b _0809FA7A
	.align 2, 0
_0809F790: .4byte gRAMChapterData
_0809F794:
	movs r0, #2
	ands r0, r3
	cmp r0, #0
	beq _0809F7E0
	adds r0, r4, #0
	movs r1, #8
	bl Proc_Goto
	ldr r0, _0809F7BC  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809F7B6
	movs r0, #0x6b
	bl m4aSongNumStart
_0809F7B6:
	mov r0, sl
	strh r0, [r4, #0x36]
	b _0809FA7A
	.align 2, 0
_0809F7BC: .4byte gRAMChapterData
_0809F7C0:
	ldr r2, _0809F7DC  @ gKeyStatusPtr
	ldr r0, [r2]
	ldrh r1, [r0, #8]
	movs r0, #0x81
	lsls r0, r0, #1
	ands r0, r1
	mov r8, r2
	cmp r0, #0
	beq _0809F7E0
	bl CloseHelpBox
	mov r1, sl
	strh r1, [r4, #0x36]
	b _0809FA7A
	.align 2, 0
_0809F7DC: .4byte gKeyStatusPtr
_0809F7E0:
	mov r0, r8
	ldr r2, [r0]
	ldrh r1, [r2, #6]
	movs r0, #0x20
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0
	beq _0809F828
	movs r0, #0
	bl sub_80ACDA4
	ldr r0, _0809F824  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809F80A
	movs r0, #0x67
	bl m4aSongNumStart
_0809F80A:
	adds r0, r4, #0
	movs r1, #3
	bl Proc_Goto
	adds r1, r4, #0
	adds r1, #0x32
	movs r0, #0
	strb r0, [r1]
	adds r0, r4, #0
	bl sub_809F218
	b _0809FA7A
	.align 2, 0
_0809F824: .4byte gRAMChapterData
_0809F828:
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _0809F864
	movs r0, #1
	bl sub_80ACDA4
	ldr r0, _0809F860  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809F848
	movs r0, #0x67
	bl m4aSongNumStart
_0809F848:
	adds r0, r4, #0
	movs r1, #4
	bl Proc_Goto
	adds r0, r4, #0
	adds r0, #0x32
	strb r5, [r0]
	adds r0, r4, #0
	bl sub_809F2C4
	b _0809FA7A
	.align 2, 0
_0809F860: .4byte gRAMChapterData
_0809F864:
	ldrh r1, [r2, #4]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0809F878
	adds r1, r4, #0
	adds r1, #0x31
	movs r0, #8
	b _0809F87E
_0809F878:
	adds r1, r4, #0
	adds r1, #0x31
	movs r0, #4
_0809F87E:
	strb r0, [r1]
	adds r7, r1, #0
	mov r1, r8
	ldr r2, [r1]
	ldrh r1, [r2, #6]
	movs r3, #0x40
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	bne _0809F8AC
	ldrh r1, [r2, #4]
	adds r0, r3, #0
	ands r0, r1
	adds r6, r4, #0
	adds r6, #0x33
	adds r5, r4, #0
	adds r5, #0x38
	cmp r0, #0
	beq _0809F8C8
	movs r0, #0
	ldrsb r0, [r7, r0]
	cmp r0, #8
	bne _0809F8C8
_0809F8AC:
	adds r0, r4, #0
	adds r0, #0x33
	ldrb r1, [r0]
	lsls r1, r1, #1
	adds r2, r4, #0
	adds r2, #0x38
	adds r3, r2, r1
	ldrh r1, [r3]
	adds r6, r0, #0
	adds r5, r2, #0
	cmp r1, #0
	beq _0809F8C8
	subs r0, r1, #1
	strh r0, [r3]
_0809F8C8:
	mov r0, r8
	ldr r2, [r0]
	ldrh r1, [r2, #6]
	movs r3, #0x80
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	bne _0809F8EA
	ldrh r1, [r2, #4]
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	beq _0809F966
	movs r0, #0
	ldrsb r0, [r7, r0]
	cmp r0, #8
	bne _0809F966
_0809F8EA:
	ldrb r0, [r6]
	lsls r0, r0, #1
	adds r2, r5, r0
	ldrh r1, [r2]
	ldr r0, _0809F904  @ gUnknown_02012F56
	ldrh r0, [r0]
	subs r0, #1
	cmp r1, r0
	bge _0809F966
	adds r0, r1, #1
	strh r0, [r2]
	b _0809F966
	.align 2, 0
_0809F904: .4byte gUnknown_02012F56
_0809F908:
	mov r1, r9
	lsls r0, r1, #4
	ldrh r2, [r7]
	adds r1, r2, #0
	subs r1, #0x28
	subs r0, r0, r1
	cmp r0, #0x37
	bgt _0809F926
	adds r0, r4, #0
	adds r0, #0x31
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r2, r0
	strh r0, [r7]
_0809F926:
	ldrb r0, [r6]
	lsls r0, r0, #1
	mov r2, r8
	adds r1, r2, r0
	ldrh r1, [r1]
	lsls r1, r1, #4
	adds r3, r5, r0
	ldrh r2, [r3]
	adds r0, r2, #0
	subs r0, #0x28
	subs r1, r1, r0
	cmp r1, #0x78
	ble _0809F94E
	adds r0, r4, #0
	adds r0, #0x31
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r0, r2, r0
	strh r0, [r3]
_0809F94E:
	ldrb r0, [r6]
	lsls r0, r0, #1
	adds r0, r5, r0
	ldrh r2, [r0]
	subs r2, #0x28
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #2
	movs r1, #0
	bl BG_SetPosition
	mov r5, r8
_0809F966:
	ldrb r0, [r6]
	lsls r0, r0, #1
	adds r0, r5, r0
	ldrh r0, [r0]
	cmp r9, r0
	bne _0809F974
	b _0809FA7A
_0809F974:
	ldr r7, _0809F9F0  @ gUnknown_020122D4
	lsls r0, r0, #2
	adds r0, r0, r7
	ldrh r0, [r0, #2]
	mov r8, r0
	ldr r0, _0809F9F4  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809F990
	movs r0, #0x66
	bl m4aSongNumStart
_0809F990:
	ldrb r0, [r6]
	lsls r0, r0, #1
	adds r0, r5, r0
	ldrh r1, [r0]
	lsls r1, r1, #2
	adds r1, r1, r7
	mov r2, r9
	lsls r0, r2, #2
	adds r0, r0, r7
	ldrb r1, [r1]
	ldrb r0, [r0]
	cmp r1, r0
	beq _0809F9B0
	adds r0, r4, #0
	bl sub_809EC38
_0809F9B0:
	ldrb r0, [r6]
	lsls r0, r0, #1
	adds r1, r5, r0
	ldrh r3, [r1]
	lsls r2, r3, #4
	adds r1, r4, #0
	adds r1, #0x4a
	adds r0, r1, r0
	ldrh r0, [r0]
	subs r0, #0x28
	subs r2, r2, r0
	adds r7, r1, #0
	cmp r2, #0x37
	bgt _0809F9F8
	cmp r3, #0
	beq _0809F9F8
	ldrh r0, [r4, #0x36]
	cmp r0, #0
	beq _0809F9E2
	adds r1, r2, #0
	adds r1, #0x10
	movs r0, #0x80
	mov r2, r8
	bl StartItemHelpBox
_0809F9E2:
	adds r0, r4, #0
	adds r0, #0x31
	movs r1, #0
	ldrsb r1, [r0, r1]
	negs r1, r1
	b _0809FA30
	.align 2, 0
_0809F9F0: .4byte gUnknown_020122D4
_0809F9F4: .4byte gRAMChapterData
_0809F9F8:
	ldrb r0, [r6]
	lsls r0, r0, #1
	adds r1, r5, r0
	ldrh r2, [r1]
	lsls r1, r2, #4
	adds r0, r7, r0
	ldrh r0, [r0]
	subs r0, #0x28
	subs r1, r1, r0
	cmp r1, #0x78
	ble _0809FA3C
	ldr r0, _0809FA38  @ gUnknown_02012F56
	ldrh r0, [r0]
	subs r0, #1
	cmp r2, r0
	beq _0809FA3C
	ldrh r0, [r4, #0x36]
	cmp r0, #0
	beq _0809FA28
	subs r1, #0x10
	movs r0, #0x80
	mov r2, r8
	bl StartItemHelpBox
_0809FA28:
	adds r0, r4, #0
	adds r0, #0x31
	movs r1, #0
	ldrsb r1, [r0, r1]
_0809FA30:
	adds r0, r4, #0
	bl sub_809F3F4
	b _0809FA7A
	.align 2, 0
_0809FA38: .4byte gUnknown_02012F56
_0809FA3C:
	ldrh r0, [r4, #0x36]
	cmp r0, #0
	beq _0809FA5C
	ldrb r0, [r6]
	lsls r0, r0, #1
	adds r1, r5, r0
	ldrh r1, [r1]
	lsls r1, r1, #4
	adds r0, r7, r0
	ldrh r0, [r0]
	subs r0, #0x28
	subs r1, r1, r0
	movs r0, #0x80
	mov r2, r8
	bl StartItemHelpBox
_0809FA5C:
	ldrb r0, [r6]
	lsls r0, r0, #1
	adds r1, r5, r0
	ldrh r1, [r1]
	lsls r1, r1, #4
	adds r0, r7, r0
	ldrh r0, [r0]
	subs r0, #0x28
	subs r1, r1, r0
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x80
	movs r2, #0xb
	bl sub_80AD51C
_0809FA7A:
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_809F688

	THUMB_FUNC_START sub_809FA88
sub_809FA88: @ 0x0809FA88
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x2c]
	bl GetUnitItemCount
	adds r1, r0, #0
	adds r0, r4, #0
	adds r0, #0x30
	ldrb r0, [r0]
	mov ip, r0
	adds r5, r1, #0
	cmp r5, #5
	bne _0809FAA6
	movs r5, #4
	b _0809FAAE
_0809FAA6:
	ldrh r0, [r4, #0x36]
	cmp r0, #0
	beq _0809FAAE
	subs r5, #1
_0809FAAE:
	cmp r1, #0
	beq _0809FB2C
	ldr r2, _0809FAD4  @ gKeyStatusPtr
	ldr r6, [r2]
	ldrh r1, [r6, #6]
	movs r7, #0x40
	adds r0, r7, #0
	ands r0, r1
	adds r3, r4, #0
	adds r3, #0x30
	cmp r0, #0
	beq _0809FAE4
	ldrb r0, [r3]
	cmp r0, #0
	beq _0809FAD8
	subs r0, #1
	strb r0, [r3]
	b _0809FAE4
	.align 2, 0
_0809FAD4: .4byte gKeyStatusPtr
_0809FAD8:
	ldrh r1, [r6, #8]
	adds r0, r7, #0
	ands r0, r1
	cmp r0, #0
	beq _0809FAE4
	strb r5, [r3]
_0809FAE4:
	ldr r2, [r2]
	ldrh r1, [r2, #6]
	movs r4, #0x80
	adds r0, r4, #0
	ands r0, r1
	cmp r0, #0
	beq _0809FB0A
	ldrb r0, [r3]
	cmp r0, r5
	bge _0809FAFC
	adds r0, #1
	b _0809FB08
_0809FAFC:
	ldrh r1, [r2, #8]
	adds r0, r4, #0
	ands r0, r1
	cmp r0, #0
	beq _0809FB0A
	movs r0, #0
_0809FB08:
	strb r0, [r3]
_0809FB0A:
	ldrb r3, [r3]
	cmp ip, r3
	beq _0809FB2C
	ldr r0, _0809FB28  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809FB22
	movs r0, #0x66
	bl m4aSongNumStart
_0809FB22:
	movs r0, #1
	b _0809FB2E
	.align 2, 0
_0809FB28: .4byte gRAMChapterData
_0809FB2C:
	movs r0, #0
_0809FB2E:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_809FA88

	THUMB_FUNC_START sub_809FB34
sub_809FB34: @ 0x0809FB34
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x2c]
	bl GetUnitItemCount
	adds r1, r0, #0
	cmp r1, #5
	bne _0809FB50
	adds r1, r4, #0
	adds r1, #0x30
	movs r0, #4
	strb r0, [r1]
	adds r0, r1, #0
	b _0809FB56
_0809FB50:
	adds r0, r4, #0
	adds r0, #0x30
	strb r1, [r0]
_0809FB56:
	ldrb r1, [r0]
	lsls r1, r1, #4
	adds r1, #0x48
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x10
	movs r2, #0xb
	bl sub_80AD51C
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_809FB34

	THUMB_FUNC_START sub_809FB70
sub_809FB70: @ 0x0809FB70
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r7, r6, #0
	adds r7, #0x33
	ldrb r1, [r7]
	lsls r1, r1, #1
	adds r0, #0x38
	adds r0, r0, r1
	ldrh r4, [r0]
	ldr r1, [r6, #0x2c]
	adds r0, r6, #0
	adds r0, #0x30
	ldrb r0, [r0]
	lsls r0, r0, #1
	adds r1, #0x1e
	adds r1, r1, r0
	ldrh r5, [r1]
	ldr r0, _0809FC0C  @ gUnknown_020122D4
	lsls r4, r4, #2
	adds r4, r4, r0
	ldrh r0, [r4, #2]
	strh r0, [r1]
	ldr r0, [r6, #0x2c]
	bl UnitRemoveInvalidItems
	strh r5, [r4, #2]
	bl sub_80982B8
	cmp r5, #0
	bne _0809FBB6
	ldr r0, [r6, #0x2c]
	ldrb r1, [r7]
	movs r2, #3
	bl SomethingPrepListRelated
_0809FBB6:
	adds r0, r6, #0
	bl sub_809F370
	ldr r0, _0809FC10  @ gUnknown_02022EEC
	ldr r4, _0809FC14  @ gUnknown_02013670
	ldr r2, [r6, #0x2c]
	adds r1, r4, #0
	movs r3, #0
	bl sub_809B74C
	adds r4, #0x28
	ldr r1, _0809FC18  @ gUnknown_02023CC6
	ldrb r2, [r7]
	lsls r2, r2, #1
	adds r0, r6, #0
	adds r0, #0x4a
	adds r0, r0, r2
	ldrh r2, [r0]
	lsrs r2, r2, #4
	ldr r3, [r6, #0x2c]
	adds r0, r4, #0
	bl sub_809D300
	ldr r0, _0809FC1C  @ sub_809EC38
	movs r1, #1
	adds r2, r6, #0
	bl sub_80ACE20
	movs r0, #4
	bl BG_EnableSyncByMask
	ldr r0, _0809FC20  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809FC06
	movs r0, #0x6a
	bl m4aSongNumStart
_0809FC06:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809FC0C: .4byte gUnknown_020122D4
_0809FC10: .4byte gUnknown_02022EEC
_0809FC14: .4byte gUnknown_02013670
_0809FC18: .4byte gUnknown_02023CC6
_0809FC1C: .4byte sub_809EC38
_0809FC20: .4byte gRAMChapterData

	THUMB_FUNC_END sub_809FB70

	THUMB_FUNC_START sub_809FC24
sub_809FC24: @ 0x0809FC24
	push {r4, r5, lr}
	adds r5, r0, #0
	ldrh r0, [r5, #0x36]
	cmp r0, #1
	bne _0809FC4C
	ldr r0, _0809FC48  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0x81
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0809FD0C
	bl CloseHelpBox
	movs r0, #0
	strh r0, [r5, #0x36]
	b _0809FD4E
	.align 2, 0
_0809FC48: .4byte gKeyStatusPtr
_0809FC4C:
	ldr r0, _0809FC80  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0809FC84
	ldr r0, [r5, #0x2c]
	adds r1, r5, #0
	adds r1, #0x30
	ldrb r3, [r1]
	lsls r1, r3, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r2, [r0]
	cmp r2, #0
	beq _0809FD4E
	lsls r1, r3, #4
	adds r1, #0x48
	movs r0, #0x10
	bl StartItemHelpBox
	movs r0, #1
	strh r0, [r5, #0x36]
	b _0809FD4E
	.align 2, 0
_0809FC80: .4byte gKeyStatusPtr
_0809FC84:
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0809FCE0
	ldr r0, [r5, #0x2c]
	adds r1, r5, #0
	adds r1, #0x30
	ldrb r1, [r1]
	ldr r4, _0809FCC4  @ gUnknown_020122D4
	adds r2, r5, #0
	adds r2, #0x33
	ldrb r3, [r2]
	lsls r3, r3, #1
	adds r2, #5
	adds r2, r2, r3
	ldrh r2, [r2]
	lsls r2, r2, #2
	adds r2, r2, r4
	ldrh r2, [r2, #2]
	bl sub_8097F44
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0809FCCC
	movs r1, #1
	negs r1, r1
	ldr r2, _0809FCC8  @ 0x0000088B
	adds r0, r1, #0
	adds r3, r5, #0
	bl sub_8097DA8
	b _0809FD4E
	.align 2, 0
_0809FCC4: .4byte gUnknown_020122D4
_0809FCC8: .4byte 0x0000088B
_0809FCCC:
	movs r0, #0
	bl sub_80ACA84
	adds r0, r5, #0
	bl Proc_Break
	adds r0, r5, #0
	bl sub_809FB70
	b _0809FD4E
_0809FCE0:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0809FD0C
	movs r0, #0
	bl sub_80ACA84
	adds r0, r5, #0
	bl Proc_Break
	ldr r0, _0809FD08  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809FD4E
	movs r0, #0x6b
	bl m4aSongNumStart
	b _0809FD4E
	.align 2, 0
_0809FD08: .4byte gRAMChapterData
_0809FD0C:
	adds r0, r5, #0
	bl sub_809FA88
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809FD4E
	adds r4, r5, #0
	adds r4, #0x30
	ldrb r1, [r4]
	lsls r1, r1, #4
	adds r1, #0x48
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x10
	movs r2, #0xb
	bl sub_80AD51C
	ldrh r0, [r5, #0x36]
	cmp r0, #1
	bne _0809FD4E
	ldr r0, [r5, #0x2c]
	ldrb r3, [r4]
	lsls r1, r3, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r2, [r0]
	cmp r2, #0
	beq _0809FD4E
	lsls r1, r3, #4
	adds r1, #0x48
	movs r0, #0x10
	bl StartItemHelpBox
_0809FD4E:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_809FC24

	THUMB_FUNC_START sub_809FD54
sub_809FD54: @ 0x0809FD54
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r0, #0x33
	ldrb r1, [r0]
	lsls r1, r1, #1
	adds r0, #5
	adds r0, r0, r1
	ldrh r4, [r0]
	lsls r4, r4, #2
	ldr r0, _0809FD84  @ gUnknown_020122D4
	adds r4, r4, r0
	ldr r6, [r5, #0x2c]
	ldrb r0, [r4]
	bl GetUnitFromCharId
	adds r1, r0, #0
	ldrb r2, [r4, #1]
	adds r0, r6, #0
	adds r3, r5, #0
	bl sub_809BE60
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0809FD84: .4byte gUnknown_020122D4

	THUMB_FUNC_END sub_809FD54

	THUMB_FUNC_START sub_809FD88
sub_809FD88: @ 0x0809FD88
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0809FD9C  @ gUnknown_08A19424
	bl Proc_StartBlocking
	str r4, [r0, #0x2c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809FD9C: .4byte gUnknown_08A19424

	THUMB_FUNC_END sub_809FD88

	THUMB_FUNC_START sub_809FDA0
sub_809FDA0: @ 0x0809FDA0
	push {r4, r5, r6, lr}
	sub sp, #4
	ldr r6, _0809FDCC  @ 0x0000DF80
	movs r5, #0x30
	movs r4, #3
_0809FDAA:
	str r6, [sp]
	movs r0, #4
	adds r1, r5, #0
	movs r2, #0x10
	ldr r3, _0809FDD0  @ gObject_32x16
	bl PutSpriteExt
	adds r6, #4
	adds r5, #0x20
	subs r4, #1
	cmp r4, #0
	bge _0809FDAA
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0809FDCC: .4byte 0x0000DF80
_0809FDD0: .4byte gObject_32x16

	THUMB_FUNC_END sub_809FDA0

	THUMB_FUNC_START sub_809FDD4
sub_809FDD4: @ 0x0809FDD4
	push {r4, r5, lr}
	sub sp, #0xc
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _0809FE10  @ sub_809FDA0
	bl Get6CDifferedLoop6C
	ldr r0, _0809FE14  @ gUnknown_08A1951C
	lsls r4, r4, #2
	adds r4, r4, r0
	ldr r0, [r4]
	ldr r1, _0809FE18  @ gUnknown_08A19524
	ldr r1, [r1]
	bl GetStringFromIndexInBuffer
	adds r2, r0, #0
	movs r0, #0xe0
	lsls r0, r0, #7
	movs r1, #1
	str r1, [sp]
	str r1, [sp, #4]
	str r5, [sp, #8]
	movs r1, #0xd
	movs r3, #1
	bl sub_80ADD24
	add sp, #0xc
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0809FE10: .4byte sub_809FDA0
_0809FE14: .4byte gUnknown_08A1951C
_0809FE18: .4byte gUnknown_08A19524

	THUMB_FUNC_END sub_809FDD4

	THUMB_FUNC_START sub_809FE1C
sub_809FE1C: @ 0x0809FE1C
	push {lr}
	ldr r0, _0809FE4C  @ 0x04000006
	ldrh r0, [r0]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0xa0
	bls _0809FE2E
	movs r2, #0
_0809FE2E:
	cmp r2, #0xc
	bne _0809FE38
	ldr r1, _0809FE50  @ 0x04000050
	movs r0, #0xc8
	strh r0, [r1]
_0809FE38:
	cmp r2, #0x34
	beq _0809FE40
	cmp r2, #0
	bne _0809FE48
_0809FE40:
	ldr r1, _0809FE50  @ 0x04000050
	ldr r2, _0809FE54  @ 0x00000242
	adds r0, r2, #0
	strh r0, [r1]
_0809FE48:
	pop {r0}
	bx r0
	.align 2, 0
_0809FE4C: .4byte 0x04000006
_0809FE50: .4byte 0x04000050
_0809FE54: .4byte 0x00000242

	THUMB_FUNC_END sub_809FE1C

	THUMB_FUNC_START sub_809FE58
sub_809FE58: @ 0x0809FE58
	movs r2, #0
	movs r1, #0
	strh r1, [r0, #0x34]
	movs r1, #0xff
	strh r1, [r0, #0x32]
	adds r0, #0x30
	strb r2, [r0]
	bx lr

	THUMB_FUNC_END sub_809FE58

	THUMB_FUNC_START sub_809FE68
sub_809FE68: @ 0x0809FE68
	push {r4, r5, lr}
	ldr r4, _0809FEE4  @ gUnknown_02013648
	ldr r1, _0809FEE8  @ 0x06011000
	adds r0, r4, #0
	movs r2, #0xb
	bl InitSomeOtherGraphicsRelatedStruct
	ldr r0, _0809FEEC  @ gUnknown_0859EF00
	movs r1, #0xd8
	lsls r1, r1, #2
	movs r2, #0x20
	bl CopyToPaletteBuffer
	adds r5, r4, #0
	adds r5, #0x90
	adds r0, r5, #0
	bl Text_Init3
	adds r0, r4, #0
	bl SetFont
	movs r0, #0
	bl SetFontGlyphSet
	adds r0, r5, #0
	movs r1, #0
	bl Text_80046B4
	ldr r0, _0809FEF0  @ 0x0000059C
	bl GetStringFromIndex
	adds r3, r0, #0
	adds r0, r5, #0
	movs r1, #0
	movs r2, #0
	bl Text_InsertString
	ldr r0, _0809FEF4  @ 0x0000059B
	bl GetStringFromIndex
	adds r3, r0, #0
	adds r0, r5, #0
	movs r1, #0x40
	movs r2, #0
	bl Text_InsertString
	ldr r0, _0809FEF8  @ 0x0000059D
	bl GetStringFromIndex
	adds r3, r0, #0
	adds r0, r5, #0
	movs r1, #0x80
	movs r2, #3
	bl Text_InsertString
	movs r0, #0
	bl SetFont
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0809FEE4: .4byte gUnknown_02013648
_0809FEE8: .4byte 0x06011000
_0809FEEC: .4byte gUnknown_0859EF00
_0809FEF0: .4byte 0x0000059C
_0809FEF4: .4byte 0x0000059B
_0809FEF8: .4byte 0x0000059D

	THUMB_FUNC_END sub_809FE68

	THUMB_FUNC_START sub_809FEFC
sub_809FEFC: @ 0x0809FEFC
	push {r4, lr}
	sub sp, #4
	ldr r0, _0809FF5C  @ 0x00008840
	str r0, [sp]
	movs r0, #0xa0
	movs r1, #0x5b
	movs r2, #8
	movs r3, #4
	bl sub_809A31C
	ldr r4, _0809FF60  @ gObject_32x16
	ldr r0, _0809FF64  @ 0x0000B088
	str r0, [sp]
	movs r0, #4
	movs r1, #0xb0
	movs r2, #0x5e
	adds r3, r4, #0
	bl PutSpriteExt
	ldr r0, _0809FF68  @ 0x0000B08C
	str r0, [sp]
	movs r0, #4
	movs r1, #0xd0
	movs r2, #0x5e
	adds r3, r4, #0
	bl PutSpriteExt
	ldr r0, _0809FF6C  @ 0x0000B080
	str r0, [sp]
	movs r0, #4
	movs r1, #0xa8
	movs r2, #0x6e
	adds r3, r4, #0
	bl PutSpriteExt
	ldr r0, _0809FF70  @ 0x0000B084
	str r0, [sp]
	movs r0, #4
	movs r1, #0xc8
	movs r2, #0x6e
	adds r3, r4, #0
	bl PutSpriteExt
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809FF5C: .4byte 0x00008840
_0809FF60: .4byte gObject_32x16
_0809FF64: .4byte 0x0000B088
_0809FF68: .4byte 0x0000B08C
_0809FF6C: .4byte 0x0000B080
_0809FF70: .4byte 0x0000B084

	THUMB_FUNC_END sub_809FEFC

	THUMB_FUNC_START sub_809FF74
sub_809FF74: @ 0x0809FF74
	push {lr}
	sub sp, #4
	ldr r3, _0809FFA0  @ gObject_32x16
	ldr r0, _0809FFA4  @ 0x0000B090
	str r0, [sp]
	movs r0, #4
	movs r1, #0x88
	movs r2, #0x48
	bl PutSpriteExt
	ldr r3, _0809FFA8  @ gObject_8x16
	ldr r0, _0809FFAC  @ 0x0000B094
	str r0, [sp]
	movs r0, #4
	movs r1, #0xa8
	movs r2, #0x48
	bl PutSpriteExt
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_0809FFA0: .4byte gObject_32x16
_0809FFA4: .4byte 0x0000B090
_0809FFA8: .4byte gObject_8x16
_0809FFAC: .4byte 0x0000B094

	THUMB_FUNC_END sub_809FF74

	THUMB_FUNC_START sub_809FFB0
sub_809FFB0: @ 0x0809FFB0
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r6, _080A0008  @ gUnknown_02022F10
	adds r0, r6, #0
	movs r1, #0xa
	movs r2, #1
	movs r3, #0
	bl TileMap_FillRect
	cmp r4, #0
	beq _080A0022
	adds r0, r4, #0
	bl sub_80B5268
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0
	beq _0809FFE2
	adds r0, r4, #0
	bl GetItemAttributes
	movs r1, #0x10
	ands r1, r0
	cmp r1, #0
	beq _080A000C
_0809FFE2:
	adds r0, r6, #0
	adds r0, #0xa
	movs r1, #1
	movs r2, #0x14
	bl sub_8004B0C
	adds r0, r6, #0
	adds r0, #0xc
	movs r1, #1
	movs r2, #0x14
	bl sub_8004B0C
	adds r0, r6, #0
	adds r0, #0xe
	movs r1, #1
	movs r2, #0x14
	bl sub_8004B0C
	b _080A0018
	.align 2, 0
_080A0008: .4byte gUnknown_02022F10
_080A000C:
	adds r0, r6, #0
	adds r0, #0xc
	movs r1, #2
	adds r2, r5, #0
	bl sub_8004B88
_080A0018:
	ldr r0, _080A0030  @ gUnknown_02022F1E
	movs r1, #3
	movs r2, #0x1e
	bl sub_8004B0C
_080A0022:
	movs r0, #1
	bl BG_EnableSyncByMask
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A0030: .4byte gUnknown_02022F1E

	THUMB_FUNC_END sub_809FFB0

	THUMB_FUNC_START sub_80A0034
sub_80A0034: @ 0x080A0034
	push {r4, r5, lr}
	ldr r4, _080A0074  @ gUnknown_02022E90
	adds r0, r4, #0
	movs r1, #0xa
	movs r2, #1
	movs r3, #0
	bl TileMap_FillRect
	movs r0, #0xa3
	lsls r0, r0, #2
	adds r5, r4, r0
	bl GetPartyGoldAmount
	adds r2, r0, #0
	adds r0, r5, #0
	movs r1, #2
	bl sub_8004B88
	ldr r0, _080A0078  @ 0x0000028E
	adds r4, r4, r0
	adds r0, r4, #0
	movs r1, #3
	movs r2, #0x1e
	bl sub_8004B0C
	movs r0, #1
	bl BG_EnableSyncByMask
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A0074: .4byte gUnknown_02022E90
_080A0078: .4byte 0x0000028E

	THUMB_FUNC_END sub_80A0034

	THUMB_FUNC_START sub_80A007C
sub_80A007C: @ 0x080A007C
	push {r4, lr}
	sub sp, #8
	movs r0, #0
	bl SetFont
	ldr r4, _080A00D4  @ gUnknown_02022D10
	adds r0, r4, #0
	movs r1, #0xc
	movs r2, #1
	movs r3, #0
	bl TileMap_FillRect
	movs r0, #0xb3
	lsls r0, r0, #3
	bl GetStringFromIndex
	ldr r3, _080A00D8  @ gUnknown_02013660
	adds r1, r4, #0
	adds r1, #0xda
	movs r2, #0
	str r2, [sp]
	str r0, [sp, #4]
	adds r0, r3, #0
	movs r3, #2
	bl DrawTextInline
	subs r4, #0x26
	movs r2, #0x9c
	lsls r2, r2, #2
	movs r0, #1
	str r0, [sp]
	movs r0, #0xab
	adds r1, r4, #0
	movs r3, #2
	bl sub_8005988
	movs r0, #1
	bl BG_EnableSyncByMask
	add sp, #8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A00D4: .4byte gUnknown_02022D10
_080A00D8: .4byte gUnknown_02013660

	THUMB_FUNC_END sub_80A007C

	THUMB_FUNC_START sub_80A00DC
sub_80A00DC: @ 0x080A00DC
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r7, r0, #0
	ldr r5, _080A0300  @ gLCDControlBuffer
	ldrb r1, [r5]
	movs r0, #8
	negs r0, r0
	ands r0, r1
	strb r0, [r5]
	movs r0, #0
	bl SetupBackgrounds
	movs r0, #0
	bl BG_GetMapBuffer
	movs r1, #0
	bl BG_Fill
	movs r0, #1
	bl BG_GetMapBuffer
	movs r1, #0
	bl BG_Fill
	movs r0, #2
	bl BG_GetMapBuffer
	movs r1, #0
	bl BG_Fill
	ldrb r2, [r5, #0xc]
	movs r1, #4
	negs r1, r1
	adds r0, r1, #0
	ands r0, r2
	strb r0, [r5, #0xc]
	ldrb r2, [r5, #0x10]
	adds r0, r1, #0
	ands r0, r2
	movs r2, #2
	mov r9, r2
	mov r2, r9
	orrs r0, r2
	strb r0, [r5, #0x10]
	ldrb r0, [r5, #0x14]
	ands r1, r0
	strb r1, [r5, #0x14]
	ldrb r0, [r5, #0x18]
	movs r1, #3
	orrs r0, r1
	strb r0, [r5, #0x18]
	bl ResetFaces
	bl Font_InitForUIDefault
	bl ResetIconGraphics_
	bl LoadUiFrameGraphics
	bl LoadObjUIGfx
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
	ldr r0, _080A0304  @ 0x06014000
	movs r1, #1
	negs r1, r1
	bl LoadDialogueBoxGfx
	movs r0, #4
	bl LoadIconPalettes
	bl sub_8095A1C
	movs r0, #0xa0
	lsls r0, r0, #7
	movs r1, #5
	bl sub_8098C3C
	movs r0, #0x80
	lsls r0, r0, #4
	movs r1, #8
	bl sub_8098C8C
	ldr r0, _080A0308  @ gUnknown_08A1BBD0
	ldr r4, _080A030C  @ gUnknown_02020188
	adds r1, r4, #0
	bl CopyDataWithPossibleUncomp
	ldr r0, _080A0310  @ gBG1TilemapBuffer
	movs r2, #0x80
	lsls r2, r2, #5
	adds r1, r4, #0
	bl CallARM_FillTileRect
	movs r0, #7
	bl BG_EnableSyncByMask
	ldr r0, [r7, #0x2c]
	bl GetUnitPortraitId
	adds r1, r0, #0
	ldr r0, _080A0314  @ 0x00000503
	str r0, [sp]
	movs r0, #0
	movs r2, #0x44
	movs r3, #0x48
	bl sub_80064F4
	adds r0, r7, #0
	bl sub_80AC9C0
	adds r0, r7, #0
	bl sub_80AD47C
	movs r0, #0xc0
	lsls r0, r0, #3
	movs r1, #1
	bl sub_80AD4A0
	ldrb r0, [r5, #1]
	movs r6, #0x20
	orrs r0, r6
	movs r1, #0x41
	negs r1, r1
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r5, #1]
	adds r1, r5, #0
	adds r1, #0x2d
	movs r0, #0x80
	strb r0, [r1]
	adds r1, #4
	movs r0, #0x28
	strb r0, [r1]
	subs r1, #5
	movs r0, #0xe0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0x98
	strb r0, [r1]
	movs r0, #0x34
	adds r0, r0, r5
	mov r8, r0
	ldrb r1, [r0]
	movs r2, #1
	orrs r1, r2
	mov r0, r9
	orrs r1, r0
	movs r0, #4
	orrs r1, r0
	movs r4, #8
	orrs r1, r4
	movs r3, #0x10
	orrs r1, r3
	adds r5, #0x36
	ldrb r0, [r5]
	orrs r0, r2
	mov r2, r9
	orrs r0, r2
	movs r2, #5
	negs r2, r2
	ands r0, r2
	orrs r0, r4
	orrs r0, r3
	orrs r1, r6
	mov r2, r8
	strb r1, [r2]
	orrs r0, r6
	strb r0, [r5]
	movs r0, #0
	movs r1, #8
	movs r2, #8
	movs r3, #8
	bl SetSpecialColorEffectsParameters
	adds r0, r7, #0
	bl NewGreenTextColorManager
	movs r0, #0x78
	movs r1, #0x8c
	movs r2, #2
	adds r3, r7, #0
	bl StartHelpPromptSprite
	movs r0, #0xa5
	movs r1, #0x80
	movs r2, #0xa
	adds r3, r7, #0
	bl sub_80984A8
	movs r0, #0xa5
	movs r1, #0x80
	bl sub_80984CC
	ldr r4, _080A0318  @ gUnknown_02013660
	adds r0, r4, #0
	movs r1, #4
	bl Text_Init
	adds r0, r4, #0
	adds r0, #8
	movs r1, #2
	bl Text_Init
	bl sub_809FE68
	adds r4, #0x10
	movs r5, #4
_080A029E:
	adds r0, r4, #0
	movs r1, #7
	bl Text_Init
	adds r4, #8
	subs r5, #1
	cmp r5, #0
	bge _080A029E
	movs r0, #0
	bl SetPrimaryHBlankHandler
	ldr r0, _080A031C  @ sub_809FE1C
	bl SetPrimaryHBlankHandler
	movs r0, #4
	bl BG_EnableSyncByMask
	ldr r0, _080A0320  @ gUnknown_02022EEC
	ldr r1, _080A0324  @ gUnknown_02013670
	ldr r2, [r7, #0x2c]
	movs r3, #0
	bl sub_809B74C
	bl sub_80A007C
	ldr r0, _080A0328  @ sub_809FF74
	adds r1, r7, #0
	bl Get6CDifferedLoop6C
	ldr r1, [r7, #0x2c]
	adds r0, r7, #0
	adds r0, #0x30
	ldrb r0, [r0]
	lsls r0, r0, #1
	adds r1, #0x1e
	adds r1, r1, r0
	ldrh r0, [r1]
	bl sub_809FFB0
	bl sub_80A0034
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A0300: .4byte gLCDControlBuffer
_080A0304: .4byte 0x06014000
_080A0308: .4byte gUnknown_08A1BBD0
_080A030C: .4byte gUnknown_02020188
_080A0310: .4byte gBG1TilemapBuffer
_080A0314: .4byte 0x00000503
_080A0318: .4byte gUnknown_02013660
_080A031C: .4byte sub_809FE1C
_080A0320: .4byte gUnknown_02022EEC
_080A0324: .4byte gUnknown_02013670
_080A0328: .4byte sub_809FF74

	THUMB_FUNC_END sub_80A00DC

	THUMB_FUNC_START sub_80A032C
sub_80A032C: @ 0x080A032C
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	ldr r6, _080A035C  @ gKeyStatusPtr
	ldr r0, [r6]
	ldrh r1, [r0, #6]
	movs r7, #0x40
	adds r0, r7, #0
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0
	beq _080A0372
	ldr r0, [r4, #0x2c]
	bl GetUnitItemCount
	adds r3, r0, #0
	adds r2, r4, #0
	adds r2, #0x30
	ldrb r0, [r2]
	cmp r0, #0
	beq _080A0360
	subs r0, #1
	strb r0, [r2]
	b _080A03A2
	.align 2, 0
_080A035C: .4byte gKeyStatusPtr
_080A0360:
	ldr r0, [r6]
	ldrh r1, [r0, #8]
	adds r0, r7, #0
	ands r0, r1
	cmp r0, #0
	beq _080A03BC
	subs r0, r3, #1
	strb r0, [r2]
	b _080A03A2
_080A0372:
	movs r7, #0x80
	adds r0, r7, #0
	ands r0, r1
	cmp r0, #0
	beq _080A03BC
	ldr r0, [r4, #0x2c]
	bl GetUnitItemCount
	adds r2, r4, #0
	adds r2, #0x30
	ldrb r1, [r2]
	subs r0, #1
	cmp r1, r0
	bge _080A0394
	adds r0, r1, #1
	strb r0, [r2]
	b _080A03A2
_080A0394:
	ldr r0, [r6]
	ldrh r1, [r0, #8]
	adds r0, r7, #0
	ands r0, r1
	cmp r0, #0
	beq _080A03BC
	strb r5, [r2]
_080A03A2:
	ldr r0, _080A03B8  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A03B4
	movs r0, #0x66
	bl m4aSongNumStart
_080A03B4:
	movs r0, #1
	b _080A03BE
	.align 2, 0
_080A03B8: .4byte gRAMChapterData
_080A03BC:
	movs r0, #0
_080A03BE:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80A032C

	THUMB_FUNC_START sub_80A03C4
sub_80A03C4: @ 0x080A03C4
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, _080A0418  @ gUnknown_02022EEC
	ldr r1, _080A041C  @ gUnknown_02013670
	ldr r2, [r4, #0x2c]
	movs r3, #0
	bl sub_809B74C
	ldr r1, [r4, #0x2c]
	adds r5, r4, #0
	adds r5, #0x30
	ldrb r0, [r5]
	lsls r0, r0, #1
	adds r1, #0x1e
	adds r1, r1, r0
	ldrh r0, [r1]
	bl sub_809FFB0
	movs r0, #0
	bl sub_80ACA84
	ldr r0, _080A0420  @ sub_809FEFC
	bl Find6CDifferedLoop
	bl Proc_End
	ldrb r1, [r5]
	lsls r1, r1, #4
	adds r1, #0x48
	movs r3, #0x80
	lsls r3, r3, #3
	movs r0, #0x10
	movs r2, #0xb
	bl sub_80AD51C
	movs r0, #0
	adds r1, r4, #0
	bl sub_809FDD4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A0418: .4byte gUnknown_02022EEC
_080A041C: .4byte gUnknown_02013670
_080A0420: .4byte sub_809FEFC

	THUMB_FUNC_END sub_80A03C4

	THUMB_FUNC_START sub_80A0424
sub_80A0424: @ 0x080A0424
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x34]
	cmp r0, #1
	bne _080A044C
	ldr r0, _080A0448  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0x81
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080A0518
	bl CloseHelpBox
	movs r0, #0
	strh r0, [r4, #0x34]
	b _080A056A
	.align 2, 0
_080A0448: .4byte gKeyStatusPtr
_080A044C:
	ldr r0, _080A0484  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080A0488
	ldr r0, [r4, #0x2c]
	adds r1, r4, #0
	adds r1, #0x30
	ldrb r3, [r1]
	lsls r1, r3, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r2, [r0]
	cmp r2, #0
	bne _080A0472
	b _080A056A
_080A0472:
	lsls r1, r3, #4
	adds r1, #0x48
	movs r0, #0x10
	bl StartItemHelpBox
	movs r0, #1
	strh r0, [r4, #0x34]
	b _080A056A
	.align 2, 0
_080A0484: .4byte gKeyStatusPtr
_080A0488:
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080A04F0
	ldr r1, [r4, #0x2c]
	adds r6, r4, #0
	adds r6, #0x30
	ldrb r0, [r6]
	lsls r0, r0, #1
	adds r1, #0x1e
	adds r1, r1, r0
	ldrh r5, [r1]
	adds r0, r5, #0
	bl sub_80B5268
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _080A04BA
	adds r0, r5, #0
	bl GetItemAttributes
	movs r1, #0x10
	ands r1, r0
	cmp r1, #0
	beq _080A04CE
_080A04BA:
	ldrb r1, [r6]
	lsls r1, r1, #4
	adds r1, #0x48
	movs r2, #0x85
	lsls r2, r2, #4
	movs r0, #0x10
	adds r3, r4, #0
	bl sub_8097DA8
	b _080A056A
_080A04CE:
	adds r0, r4, #0
	movs r1, #2
	bl Proc_Goto
	ldr r0, _080A04EC  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A056A
	movs r0, #0x6a
	bl m4aSongNumStart
	b _080A056A
	.align 2, 0
_080A04EC: .4byte gRAMChapterData
_080A04F0:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080A0518
	adds r0, r4, #0
	movs r1, #3
	bl Proc_Goto
	ldr r0, _080A0514  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A056A
	movs r0, #0x6b
	bl m4aSongNumStart
	b _080A056A
	.align 2, 0
_080A0514: .4byte gRAMChapterData
_080A0518:
	adds r0, r4, #0
	bl sub_80A032C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A056A
	adds r5, r4, #0
	adds r5, #0x30
	ldrb r1, [r5]
	lsls r1, r1, #4
	adds r1, #0x48
	movs r3, #0x80
	lsls r3, r3, #3
	movs r0, #0x10
	movs r2, #0xb
	bl sub_80AD51C
	ldr r1, [r4, #0x2c]
	ldrb r0, [r5]
	lsls r0, r0, #1
	adds r1, #0x1e
	adds r1, r1, r0
	ldrh r0, [r1]
	bl sub_809FFB0
	ldrh r0, [r4, #0x34]
	cmp r0, #1
	bne _080A056A
	ldr r0, [r4, #0x2c]
	ldrb r3, [r5]
	lsls r1, r3, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r2, [r0]
	cmp r2, #0
	beq _080A056A
	lsls r1, r3, #4
	adds r1, #0x48
	movs r0, #0x10
	bl StartItemHelpBox
_080A056A:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80A0424

	THUMB_FUNC_START sub_80A0570
sub_80A0570: @ 0x080A0570
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r4, #0
	adds r5, #0x31
	movs r0, #1
	strb r0, [r5]
	ldr r0, _080A05B8  @ sub_809FEFC
	adds r1, r4, #0
	bl Get6CDifferedLoop6C
	adds r0, r4, #0
	adds r0, #0x30
	ldrb r2, [r0]
	lsls r2, r2, #4
	adds r2, #0x48
	movs r0, #0
	movs r1, #0x10
	movs r3, #2
	bl sub_80AC9D4
	ldrb r0, [r5]
	lsls r0, r0, #5
	adds r0, #0xa4
	movs r3, #0x80
	lsls r3, r3, #3
	movs r1, #0x6f
	movs r2, #0
	bl sub_80AD51C
	movs r0, #1
	adds r1, r4, #0
	bl sub_809FDD4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A05B8: .4byte sub_809FEFC

	THUMB_FUNC_END sub_80A0570

	THUMB_FUNC_START sub_80A05BC
sub_80A05BC: @ 0x080A05BC
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x2c]
	adds r5, r4, #0
	adds r5, #0x30
	ldrb r0, [r5]
	lsls r0, r0, #1
	adds r1, #0x1e
	adds r1, r1, r0
	ldrh r0, [r1]
	bl sub_80B5268
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl sub_8024E20
	ldr r1, [r4, #0x2c]
	ldrb r0, [r5]
	lsls r0, r0, #1
	adds r1, #0x1e
	adds r1, r1, r0
	movs r0, #0
	strh r0, [r1]
	ldr r0, [r4, #0x2c]
	bl UnitRemoveInvalidItems
	ldr r0, _080A0628  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A0602
	movs r0, #0xb9
	bl m4aSongNumStart
_080A0602:
	bl sub_80A0034
	ldr r0, [r4, #0x2c]
	bl GetUnitItemCount
	cmp r0, #0
	bne _080A0634
	ldr r0, _080A062C  @ gUnknown_02022EEC
	ldr r1, _080A0630  @ gUnknown_02013670
	ldr r2, [r4, #0x2c]
	movs r3, #0
	bl sub_809B74C
	adds r0, r4, #0
	movs r1, #3
	bl Proc_Goto
	b _080A0646
	.align 2, 0
_080A0628: .4byte gRAMChapterData
_080A062C: .4byte gUnknown_02022EEC
_080A0630: .4byte gUnknown_02013670
_080A0634:
	ldrb r1, [r5]
	cmp r0, r1
	bne _080A063E
	subs r0, #1
	strb r0, [r5]
_080A063E:
	adds r0, r4, #0
	movs r1, #1
	bl Proc_Goto
_080A0646:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80A05BC

	THUMB_FUNC_START sub_80A064C
sub_80A064C: @ 0x080A064C
	push {r4, r5, r6, lr}
	adds r1, r0, #0
	adds r4, r1, #0
	adds r4, #0x31
	ldrb r5, [r4]
	ldr r6, _080A0670  @ gKeyStatusPtr
	ldr r3, [r6]
	ldrh r2, [r3, #8]
	movs r0, #1
	ands r0, r2
	cmp r0, #0
	beq _080A0674
	cmp r5, #0
	bne _080A0680
	adds r0, r1, #0
	bl sub_80A05BC
	b _080A06E6
	.align 2, 0
_080A0670: .4byte gKeyStatusPtr
_080A0674:
	movs r0, #2
	ands r0, r2
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0
	beq _080A06A0
_080A0680:
	adds r0, r1, #0
	movs r1, #1
	bl Proc_Goto
	ldr r0, _080A069C  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A06E6
	movs r0, #0x6b
	bl m4aSongNumStart
	b _080A06E6
	.align 2, 0
_080A069C: .4byte gRAMChapterData
_080A06A0:
	ldrh r1, [r3, #6]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _080A06AC
	strb r2, [r4]
_080A06AC:
	ldr r0, [r6]
	ldrh r1, [r0, #6]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _080A06BC
	movs r0, #1
	strb r0, [r4]
_080A06BC:
	ldrb r0, [r4]
	cmp r5, r0
	beq _080A06E6
	ldr r0, _080A06EC  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A06D4
	movs r0, #0x67
	bl m4aSongNumStart
_080A06D4:
	ldrb r0, [r4]
	lsls r0, r0, #5
	adds r0, #0xa4
	movs r3, #0x80
	lsls r3, r3, #3
	movs r1, #0x6f
	movs r2, #0
	bl sub_80AD51C
_080A06E6:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A06EC: .4byte gRAMChapterData

	THUMB_FUNC_END sub_80A064C

	THUMB_FUNC_START sub_80A06F0
sub_80A06F0: @ 0x080A06F0
	push {lr}
	bl EndBG3Slider_
	movs r0, #0
	bl DeleteFaceByIndex
	movs r0, #0
	bl SetPrimaryHBlankHandler
	bl sub_8098500
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80A06F0

	THUMB_FUNC_START sub_80A070C
sub_80A070C: @ 0x080A070C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080A0720  @ gUnknown_08A19528
	bl Proc_StartBlocking
	str r4, [r0, #0x2c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A0720: .4byte gUnknown_08A19528

	THUMB_FUNC_END sub_80A070C

	THUMB_FUNC_START sub_80A0724
sub_80A0724: @ 0x080A0724
	push {lr}
	sub sp, #0x10
	ldr r0, [r0, #0x2c]
	str r0, [sp]
	ldr r0, _080A0754  @ 0x06011000
	str r0, [sp, #4]
	movs r0, #1
	negs r0, r0
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	movs r0, #0xa
	movs r1, #7
	movs r2, #0x11
	movs r3, #4
	bl sub_808F128
	movs r0, #0x7c
	bl sub_808E9D8
	add sp, #0x10
	pop {r0}
	bx r0
	.align 2, 0
_080A0754: .4byte 0x06011000

	THUMB_FUNC_END sub_80A0724

	THUMB_FUNC_START sub_80A0758
sub_80A0758: @ 0x080A0758
	bx lr

	THUMB_FUNC_END sub_80A0758

	THUMB_FUNC_START __malloc_unlock_2
__malloc_unlock_2: @ 0x080A075C
	bx lr

	THUMB_FUNC_END __malloc_unlock_2

	THUMB_FUNC_START sub_80A0760
sub_80A0760: @ 0x080A0760
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r0, #0x30
	movs r4, #1
	strb r4, [r0]
	bl sub_80A0A34
	adds r1, r5, #0
	adds r1, #0x31
	strb r0, [r1]
	bl sub_80A0A70
	adds r1, r5, #0
	adds r1, #0x32
	strb r0, [r1]
	adds r0, r5, #0
	adds r0, #0x33
	strb r4, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80A0760

	THUMB_FUNC_START sub_80A078C
sub_80A078C: @ 0x080A078C
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	sub sp, #8
	mov r9, r0
	ldr r6, _080A084C  @ gUnknown_02013498
	movs r0, #0
	bl SetFontGlyphSet
	movs r0, #0
	bl SetFont
	ldr r0, _080A0850  @ gUnknown_02022F28
	movs r1, #0x1f
	movs r2, #0xa
	movs r3, #0
	bl TileMap_FillRect
	movs r4, #0
_080A07B4:
	adds r0, r6, #0
	bl Text_Clear
	ldr r1, _080A0854  @ gUnknown_08A196D0
	lsls r0, r4, #2
	adds r0, r0, r1
	ldr r0, [r0]
	bl GetStringFromIndex
	adds r3, r0, #0
	adds r5, r6, #0
	adds r6, #8
	asrs r2, r4, #1
	lsls r2, r2, #6
	movs r0, #0xa2
	lsls r0, r0, #1
	adds r2, r2, r0
	movs r1, #1
	ands r1, r4
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #1
	adds r2, r2, r0
	lsls r2, r2, #1
	ldr r0, _080A0858  @ gBG0TilemapBuffer
	mov r8, r0
	adds r1, r2, r0
	movs r2, #0
	mov r0, r9
	adds r0, #0x30
	adds r0, r0, r4
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _080A07FE
	movs r2, #1
_080A07FE:
	movs r7, #0
	str r7, [sp]
	str r3, [sp, #4]
	adds r0, r5, #0
	movs r3, #0
	bl DrawTextInline
	adds r4, #1
	cmp r4, #3
	ble _080A07B4
	ldr r0, _080A084C  @ gUnknown_02013498
	adds r6, r0, #0
	adds r6, #0xf0
	adds r0, r6, #0
	bl Text_Clear
	ldr r0, _080A085C  @ gUnknown_08A196BC
	ldr r0, [r0, #0xc]
	bl GetStringFromIndex
	mov r1, r8
	adds r1, #0x2c
	str r7, [sp]
	str r0, [sp, #4]
	adds r0, r6, #0
	movs r2, #0
	movs r3, #0
	bl DrawTextInline
	movs r0, #1
	bl BG_EnableSyncByMask
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A084C: .4byte gUnknown_02013498
_080A0850: .4byte gUnknown_02022F28
_080A0854: .4byte gUnknown_08A196D0
_080A0858: .4byte gBG0TilemapBuffer
_080A085C: .4byte gUnknown_08A196BC

	THUMB_FUNC_END sub_80A078C

	THUMB_FUNC_START sub_80A0860
sub_80A0860: @ 0x080A0860
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r3, r5, #0
	adds r3, #0x29
	ldrb r4, [r3]
	ldr r2, _080A08F0  @ gKeyStatusPtr
	ldr r0, [r2]
	ldrh r1, [r0, #6]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _080A0884
	movs r0, #1
	ands r0, r4
	cmp r0, #0
	beq _080A0884
	subs r0, r4, #1
	strb r0, [r3]
_080A0884:
	ldr r0, [r2]
	ldrh r1, [r0, #6]
	movs r0, #0x10
	ands r0, r1
	adds r3, r5, #0
	adds r3, #0x29
	cmp r0, #0
	beq _080A08A2
	ldrb r1, [r3]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _080A08A2
	adds r0, r1, #1
	strb r0, [r3]
_080A08A2:
	ldr r0, [r2]
	ldrh r1, [r0, #6]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _080A08BA
	ldrb r1, [r3]
	lsrs r0, r1, #1
	cmp r0, #0
	bne _080A08BA
	adds r0, r1, #2
	strb r0, [r3]
_080A08BA:
	ldr r0, [r2]
	ldrh r1, [r0, #6]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _080A08D2
	ldrb r1, [r3]
	lsrs r0, r1, #1
	cmp r0, #0
	beq _080A08D2
	subs r0, r1, #2
	strb r0, [r3]
_080A08D2:
	ldrb r3, [r3]
	cmp r4, r3
	beq _080A08F8
	ldr r0, _080A08F4  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A08EA
	movs r0, #0x65
	bl m4aSongNumStart
_080A08EA:
	movs r0, #1
	b _080A08FA
	.align 2, 0
_080A08F0: .4byte gKeyStatusPtr
_080A08F4: .4byte gRAMChapterData
_080A08F8:
	movs r0, #0
_080A08FA:
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80A0860

	THUMB_FUNC_START sub_80A0900
sub_80A0900: @ 0x080A0900
	push {r4, lr}
	adds r4, r0, #0
	bl sub_808F270
	adds r0, r4, #0
	bl sub_80ADDD4
	bl EndBG3Slider_
	movs r0, #0
	bl DeleteFaceByIndex
	movs r0, #0
	bl SetPrimaryHBlankHandler
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80A0900

	THUMB_FUNC_START sub_80A0924
sub_80A0924: @ 0x080A0924
	push {lr}
	adds r1, r0, #0
	adds r1, #0x29
	ldrb r1, [r1]
	cmp r1, #0
	blt _080A093E
	cmp r1, #1
	ble _080A093E
	cmp r1, #2
	bne _080A093E
	movs r1, #4
	bl Proc_Goto
_080A093E:
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80A0924

	THUMB_FUNC_START sub_80A0944
sub_80A0944: @ 0x080A0944
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080A0958  @ gUnknown_08A1962C
	bl Proc_StartBlocking
	adds r0, #0x29
	strb r4, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A0958: .4byte gUnknown_08A1962C

	THUMB_FUNC_END sub_80A0944

	THUMB_FUNC_START sub_80A095C
sub_80A095C: @ 0x080A095C
	push {lr}
	cmp r0, #1
	beq _080A0976
	cmp r0, #1
	bgt _080A096C
	cmp r0, #0
	beq _080A0972
	b _080A0986
_080A096C:
	cmp r0, #2
	beq _080A097C
	b _080A0986
_080A0972:
	movs r0, #1
	b _080A0988
_080A0976:
	bl sub_80A0A34
	b _080A0980
_080A097C:
	bl sub_80A0A70
_080A0980:
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	b _080A0988
_080A0986:
	movs r0, #0
_080A0988:
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80A095C

	THUMB_FUNC_START sub_80A098C
sub_80A098C: @ 0x080A098C
	push {lr}
	ldr r0, _080A09A4  @ gRAMChapterData
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetROMChapterStruct
	adds r0, #0x7a
	ldrh r0, [r0]
	pop {r1}
	bx r1
	.align 2, 0
_080A09A4: .4byte gRAMChapterData

	THUMB_FUNC_END sub_80A098C

	THUMB_FUNC_START sub_80A09A8
sub_80A09A8: @ 0x080A09A8
	push {lr}
	ldr r0, _080A09C0  @ gRAMChapterData
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetROMChapterStruct
	adds r0, #0x76
	ldrh r0, [r0]
	pop {r1}
	bx r1
	.align 2, 0
_080A09C0: .4byte gRAMChapterData

	THUMB_FUNC_END sub_80A09A8

	THUMB_FUNC_START sub_80A09C4
sub_80A09C4: @ 0x080A09C4
	push {lr}
	ldr r0, _080A09DC  @ gRAMChapterData
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetROMChapterStruct
	adds r0, #0x7c
	ldrh r0, [r0]
	pop {r1}
	bx r1
	.align 2, 0
_080A09DC: .4byte gRAMChapterData

	THUMB_FUNC_END sub_80A09C4

	THUMB_FUNC_START sub_80A09E0
sub_80A09E0: @ 0x080A09E0
	push {lr}
	ldr r0, _080A09F8  @ gRAMChapterData
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetROMChapterStruct
	adds r0, #0x7f
	ldrb r0, [r0]
	pop {r1}
	bx r1
	.align 2, 0
_080A09F8: .4byte gRAMChapterData

	THUMB_FUNC_END sub_80A09E0

	THUMB_FUNC_START sub_80A09FC
sub_80A09FC: @ 0x080A09FC
	push {lr}
	ldr r0, _080A0A14  @ gRAMChapterData
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetROMChapterStruct
	adds r0, #0x7e
	ldrb r0, [r0]
	pop {r1}
	bx r1
	.align 2, 0
_080A0A14: .4byte gRAMChapterData

	THUMB_FUNC_END sub_80A09FC

	THUMB_FUNC_START sub_80A0A18
sub_80A0A18: @ 0x080A0A18
	push {lr}
	bl sub_80A098C
	cmp r0, #0
	beq _080A0A2E
	bl sub_80A09A8
	cmp r0, #0
	bne _080A0A2E
	movs r0, #1
	b _080A0A30
_080A0A2E:
	movs r0, #0
_080A0A30:
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80A0A18

	THUMB_FUNC_START sub_80A0A34
sub_80A0A34: @ 0x080A0A34
	push {lr}
	ldr r0, _080A0A50  @ gRAMChapterData
	ldrb r1, [r0, #0x14]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	bne _080A0A4A
	bl sub_80A098C
	cmp r0, #0
	bne _080A0A54
_080A0A4A:
	movs r0, #0
	b _080A0A56
	.align 2, 0
_080A0A50: .4byte gRAMChapterData
_080A0A54:
	movs r0, #1
_080A0A56:
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80A0A34

	THUMB_FUNC_START sub_80A0A5C
sub_80A0A5C: @ 0x080A0A5C
	push {lr}
	bl sub_80A09FC
	cmp r0, #1
	beq _080A0A6A
	movs r0, #0
	b _080A0A6C
_080A0A6A:
	movs r0, #1
_080A0A6C:
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80A0A5C

	THUMB_FUNC_START sub_80A0A70
sub_80A0A70: @ 0x080A0A70
	movs r0, #1
	bx lr

	THUMB_FUNC_END sub_80A0A70

	THUMB_FUNC_START sub_80A0A74
sub_80A0A74: @ 0x080A0A74
	push {lr}
	ldr r0, _080A0A88  @ gRAMChapterData
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x61
	bgt _080A0A8C
	movs r0, #0
	b _080A0A8E
	.align 2, 0
_080A0A88: .4byte gRAMChapterData
_080A0A8C:
	movs r0, #1
_080A0A8E:
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80A0A74

	THUMB_FUNC_START sub_80A0A94
sub_80A0A94: @ 0x080A0A94
	ldr r0, _080A0A9C  @ gUnknown_020136F0
	ldr r0, [r0]
	bx lr
	.align 2, 0
_080A0A9C: .4byte gUnknown_020136F0

	THUMB_FUNC_END sub_80A0A94

	THUMB_FUNC_START sub_80A0AA0
sub_80A0AA0: @ 0x080A0AA0
	push {lr}
	adds r1, r0, #0
	ldr r0, _080A0AB4  @ gUnknown_020136F0
	ldr r0, [r0]
	subs r0, #1
	cmp r1, r0
	bge _080A0AB8
	adds r0, r1, #1
	b _080A0ABA
	.align 2, 0
_080A0AB4: .4byte gUnknown_020136F0
_080A0AB8:
	movs r0, #0
_080A0ABA:
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80A0AA0

	THUMB_FUNC_START sub_80A0AC0
sub_80A0AC0: @ 0x080A0AC0
	push {lr}
	cmp r0, #0
	bne _080A0ACA
	ldr r0, _080A0AD0  @ gUnknown_020136F0
	ldr r0, [r0]
_080A0ACA:
	subs r0, #1
	pop {r1}
	bx r1
	.align 2, 0
_080A0AD0: .4byte gUnknown_020136F0

	THUMB_FUNC_END sub_80A0AC0

	THUMB_FUNC_START sub_80A0AD4
sub_80A0AD4: @ 0x080A0AD4
	ldr r2, _080A0AE8  @ gUnknown_08A196FC
	ldr r3, [r2]
	lsls r2, r0, #1
	adds r2, r2, r0
	lsls r2, r2, #3
	adds r2, r2, r3
	adds r2, #2
	adds r2, r2, r1
	ldrb r0, [r2]
	bx lr
	.align 2, 0
_080A0AE8: .4byte gUnknown_08A196FC

	THUMB_FUNC_END sub_80A0AD4

	THUMB_FUNC_START sub_80A0AEC
sub_80A0AEC: @ 0x080A0AEC
	ldr r2, _080A0B00  @ gUnknown_08A196FC
	ldr r3, [r2]
	lsls r2, r0, #1
	adds r2, r2, r0
	lsls r2, r2, #3
	adds r2, r2, r3
	adds r2, #9
	adds r2, r2, r1
	ldrb r0, [r2]
	bx lr
	.align 2, 0
_080A0B00: .4byte gUnknown_08A196FC

	THUMB_FUNC_END sub_80A0AEC

	THUMB_FUNC_START sub_80A0B04
sub_80A0B04: @ 0x080A0B04
	ldr r2, _080A0B1C  @ gUnknown_08A196FC
	ldr r3, [r2]
	lsls r2, r0, #1
	adds r2, r2, r0
	lsls r2, r2, #3
	adds r2, r2, r3
	adds r2, #0x10
	adds r2, r2, r1
	movs r0, #0
	ldrsb r0, [r2, r0]
	bx lr
	.align 2, 0
_080A0B1C: .4byte gUnknown_08A196FC

	THUMB_FUNC_END sub_80A0B04

	THUMB_FUNC_START sub_80A0B20
sub_80A0B20: @ 0x080A0B20
	push {r4, r5, lr}
	adds r5, r1, #0
	ldr r4, _080A0B40  @ gCharacterData
	bl sub_80A0B44
	subs r0, #1
	movs r1, #0x34
	muls r0, r1, r0
	adds r4, #0x2c
	adds r0, r0, r4
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r0, [r0]
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080A0B40: .4byte gCharacterData

	THUMB_FUNC_END sub_80A0B20

	THUMB_FUNC_START sub_80A0B44
sub_80A0B44: @ 0x080A0B44
	ldr r1, _080A0B54  @ gUnknown_08A196FC
	ldr r2, [r1]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	ldrb r0, [r1]
	bx lr
	.align 2, 0
_080A0B54: .4byte gUnknown_08A196FC

	THUMB_FUNC_END sub_80A0B44

	THUMB_FUNC_START sub_80A0B58
sub_80A0B58: @ 0x080A0B58
	ldr r1, _080A0B68  @ gUnknown_08A196FC
	ldr r2, [r1]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	ldrb r0, [r1, #1]
	bx lr
	.align 2, 0
_080A0B68: .4byte gUnknown_08A196FC

	THUMB_FUNC_END sub_80A0B58

	THUMB_FUNC_START sub_80A0B6C
sub_80A0B6C: @ 0x080A0B6C
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r4, #1
_080A0B72:
	adds r0, r4, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq _080A0BA0
	ldr r3, [r2]
	cmp r3, #0
	beq _080A0BA0
	ldr r0, [r2, #0xc]
	ldr r1, _080A0B9C  @ 0x00010004
	ands r0, r1
	cmp r0, #0
	bne _080A0BA0
	ldrb r0, [r3, #4]
	cmp r0, r5
	bne _080A0BA0
	ldr r0, [r2, #4]
	ldrb r0, [r0, #4]
	b _080A0BB2
	.align 2, 0
_080A0B9C: .4byte 0x00010004
_080A0BA0:
	adds r4, #1
	cmp r4, #0x3f
	ble _080A0B72
	ldr r2, _080A0BB8  @ gCharacterData
	subs r1, r5, #1
	movs r0, #0x34
	muls r0, r1, r0
	adds r0, r0, r2
	ldrb r0, [r0, #5]
_080A0BB2:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080A0BB8: .4byte gCharacterData

	THUMB_FUNC_END sub_80A0B6C

	THUMB_FUNC_START sub_80A0BBC
sub_80A0BBC: @ 0x080A0BBC
	push {r4, lr}
	adds r4, r0, #0
	bl sub_80847F8
	adds r1, r0, #0
	ldrh r0, [r1]
	ldr r2, _080A0BE0  @ 0x0000FFFF
	cmp r0, r2
	beq _080A0BEC
_080A0BCE:
	ldrh r0, [r1]
	cmp r0, r4
	beq _080A0BDA
	ldrh r0, [r1, #2]
	cmp r0, r4
	bne _080A0BE4
_080A0BDA:
	movs r0, #1
	b _080A0BEE
	.align 2, 0
_080A0BE0: .4byte 0x0000FFFF
_080A0BE4:
	adds r1, #0x10
	ldrh r0, [r1]
	cmp r0, r2
	bne _080A0BCE
_080A0BEC:
	movs r0, #0
_080A0BEE:
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80A0BBC

	THUMB_FUNC_START sub_80A0BF4
sub_80A0BF4: @ 0x080A0BF4
	push {r4, r5, r6, r7, lr}
	bl sub_80847F8
	adds r6, r0, #0
	ldrh r0, [r6]
	ldr r1, _080A0C3C  @ 0x0000FFFF
	cmp r0, r1
	beq _080A0C34
	adds r7, r1, #0
_080A0C06:
	ldrh r0, [r6]
	movs r1, #0
	bl SetSomeUnitStatThingUnlockMaybeIdk
	ldrh r0, [r6, #2]
	movs r1, #0
	bl SetSomeUnitStatThingUnlockMaybeIdk
	ldrh r4, [r6]
	ldrh r5, [r6, #2]
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_80A3468
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_80A3724
	adds r6, #0x10
	ldrh r0, [r6]
	cmp r0, r7
	bne _080A0C06
_080A0C34:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A0C3C: .4byte 0x0000FFFF

	THUMB_FUNC_END sub_80A0BF4

	THUMB_FUNC_START sub_80A0C40
sub_80A0C40: @ 0x080A0C40
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x90
	adds r4, r0, #0
	mov r1, sp
	movs r0, #0
	strh r0, [r1]
	ldr r7, _080A0DC0  @ gUnknown_08A196FC
	ldr r1, [r7]
	ldr r2, _080A0DC4  @ 0x01000600
	mov r0, sp
	bl CpuSet
	ldr r5, _080A0DC8  @ gUnknown_020136F0
	movs r1, #0
	str r1, [r5]
	adds r4, #0x42
	movs r0, #0
	ldrsb r0, [r4, r0]
	cmp r0, #0
	bne _080A0C72
	b _080A0DD8
_080A0C72:
	add r0, sp, #0x24
	strh r1, [r0]
	add r1, sp, #4
	ldr r2, _080A0DCC  @ 0x01000010
	bl CpuSet
	movs r4, #1
_080A0C80:
	adds r0, r4, #0
	bl GetUnit
	cmp r0, #0
	beq _080A0CB0
	ldr r2, [r0]
	cmp r2, #0
	beq _080A0CB0
	ldr r0, [r0, #0xc]
	ldr r1, _080A0DD0  @ 0x00010004
	ands r0, r1
	cmp r0, #0
	bne _080A0CB0
	ldrb r1, [r2, #4]
	lsrs r2, r1, #5
	lsls r2, r2, #2
	add r2, sp
	movs r0, #0x1f
	ands r0, r1
	movs r1, #1
	lsls r1, r0
	ldr r0, [r2, #4]
	orrs r0, r1
	str r0, [r2, #4]
_080A0CB0:
	adds r4, #1
	cmp r4, #0x3f
	ble _080A0C80
	movs r4, #1
	ldr r0, _080A0DC8  @ gUnknown_020136F0
	mov sl, r0
_080A0CBC:
	adds r0, r4, #0
	bl GetUnit
	adds r5, r0, #0
	adds r4, #1
	str r4, [sp, #0x8c]
	cmp r5, #0
	beq _080A0DB6
	ldr r2, [r5]
	cmp r2, #0
	beq _080A0DB6
	ldr r0, [r5, #0xc]
	ldr r1, _080A0DD0  @ 0x00010004
	ands r0, r1
	cmp r0, #0
	bne _080A0DB6
	ldrb r0, [r2, #4]
	bl sub_80A1B6C
	cmp r0, #0
	beq _080A0DB6
	mov r0, sl
	ldr r1, [r0]
	ldr r0, _080A0DC0  @ gUnknown_08A196FC
	ldr r2, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	ldr r1, [r5]
	ldrb r1, [r1, #4]
	strb r1, [r0]
	mov r0, sl
	ldr r1, [r0]
	ldr r0, _080A0DC0  @ gUnknown_08A196FC
	ldr r2, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	ldr r1, [r5, #4]
	ldrb r1, [r1, #4]
	strb r1, [r0, #1]
	movs r6, #0
	ldr r0, [r5]
	ldrb r0, [r0, #4]
	subs r0, #1
	movs r1, #0x34
	muls r0, r1, r0
	ldr r1, _080A0DD4  @ gCharacterData+0x2C
	adds r0, r0, r1
	ldr r0, [r0]
	ldrb r0, [r0, #0x15]
	cmp r6, r0
	bge _080A0DAE
	ldr r7, _080A0DC8  @ gUnknown_020136F0
	ldr r0, _080A0DC0  @ gUnknown_08A196FC
	mov r8, r0
_080A0D30:
	ldr r0, [r7]
	adds r1, r6, #0
	bl sub_80A0B20
	adds r4, r0, #0
	adds r0, r5, #0
	adds r1, r6, #0
	bl GetUnitSupportLevel
	ldr r2, [r7]
	mov r1, r8
	ldr r3, [r1]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #3
	adds r1, r1, r3
	adds r1, #2
	adds r1, r1, r6
	strb r0, [r1]
	adds r0, r4, #0
	bl sub_80A0B6C
	ldr r2, [r7]
	mov r1, r8
	ldr r3, [r1]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #3
	adds r1, r1, r3
	adds r1, #9
	adds r1, r1, r6
	strb r0, [r1]
	ldr r0, [r7]
	mov r1, r8
	ldr r2, [r1]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	adds r1, #0x10
	add r1, r9
	asrs r0, r4, #5
	lsls r0, r0, #2
	add r0, sp
	movs r2, #0x1f
	ands r2, r4
	ldr r0, [r0, #4]
	lsrs r0, r2
	movs r2, #1
	ands r0, r2
	strb r0, [r1]
	adds r6, #1
	ldr r0, [r5]
	ldrb r0, [r0, #4]
	subs r0, #1
	movs r1, #0x34
	muls r0, r1, r0
	ldr r1, _080A0DD4  @ gCharacterData+0x2C
	adds r0, r0, r1
	ldr r0, [r0]
	ldrb r0, [r0, #0x15]
	cmp r6, r0
	blt _080A0D30
_080A0DAE:
	mov r1, sl
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
_080A0DB6:
	ldr r4, [sp, #0x8c]
	cmp r4, #0x3f
	bgt _080A0DBE
	b _080A0CBC
_080A0DBE:
	b _080A0EAE
	.align 2, 0
_080A0DC0: .4byte gUnknown_08A196FC
_080A0DC4: .4byte 0x01000600
_080A0DC8: .4byte gUnknown_020136F0
_080A0DCC: .4byte 0x01000010
_080A0DD0: .4byte 0x00010004
_080A0DD4: .4byte gCharacterData+0x2C
_080A0DD8:
	add r4, sp, #0x28
	adds r0, r4, #0
	bl LoadSomeUnitStatThingUnlockIdk
	ldr r0, _080A0E50  @ 0x0000026A
	bl GetStringFromIndex
	bl SetTacticianName
	movs r6, #0
	add r0, sp, #0x28
	mov sl, r0
	ldr r1, _080A0E54  @ gCharacterData
	mov r8, r1
_080A0DF4:
	adds r0, r6, #0
	mov r1, sl
	bl sub_80A37F0
	lsls r0, r0, #0x18
	adds r4, r6, #1
	cmp r0, #0
	beq _080A0EA8
	adds r0, r6, #0
	bl sub_80A1B6C
	cmp r0, #0
	beq _080A0EA8
	ldr r1, [r5]
	ldr r2, [r7]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	strb r6, [r0]
	ldr r0, [r5]
	ldr r2, [r7]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	subs r2, r6, #1
	movs r0, #0x34
	muls r0, r2, r0
	add r0, r8
	ldrb r0, [r0, #5]
	strb r0, [r1, #1]
	ldr r1, [r5]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	ldr r1, [r7]
	adds r1, r1, r0
	adds r1, #2
	adds r0, r6, #0
	mov r2, sl
	bl sub_80A35EC
	movs r0, #0
	mov r9, r0
	b _080A0E98
	.align 2, 0
_080A0E50: .4byte 0x0000026A
_080A0E54: .4byte gCharacterData
_080A0E58:
	ldr r0, [r5]
	mov r1, r9
	bl sub_80A0B20
	ldr r1, [r5]
	ldr r3, [r7]
	lsls r2, r1, #1
	adds r2, r2, r1
	lsls r2, r2, #3
	adds r2, r2, r3
	adds r2, #9
	add r2, r9
	subs r3, r0, #1
	movs r1, #0x34
	muls r1, r3, r1
	add r1, r8
	ldrb r1, [r1, #5]
	strb r1, [r2]
	add r1, sp, #0x28
	bl sub_80A37F0
	ldr r2, [r5]
	ldr r3, [r7]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #3
	adds r1, r1, r3
	adds r1, #0x10
	add r1, r9
	strb r0, [r1]
	movs r1, #1
	add r9, r1
_080A0E98:
	adds r0, r6, #0
	bl sub_80A1B6C
	cmp r9, r0
	blt _080A0E58
	ldr r0, [r5]
	adds r0, #1
	str r0, [r5]
_080A0EA8:
	adds r6, r4, #0
	cmp r6, #0xff
	ble _080A0DF4
_080A0EAE:
	add sp, #0x90
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80A0C40

	THUMB_FUNC_START sub_80A0EC0
sub_80A0EC0: @ 0x080A0EC0
	push {r4, r5, lr}
	adds r0, #0x42
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _080A0EF4
	movs r4, #1
_080A0ED0:
	adds r0, r4, #0
	bl GetUnit
	adds r1, r0, #0
	cmp r1, #0
	beq _080A0EEC
	ldr r0, [r1]
	cmp r0, #0
	beq _080A0EEC
	adds r0, r1, #0
	bl GetUnitSMSId
	bl SMS_RegisterUsage
_080A0EEC:
	adds r4, #1
	cmp r4, #0x3f
	ble _080A0ED0
	b _080A0F1C
_080A0EF4:
	movs r4, #0
	ldr r0, _080A0F28  @ gUnknown_020136F0
	ldr r0, [r0]
	cmp r4, r0
	bge _080A0F1C
	movs r5, #0
_080A0F00:
	ldr r0, _080A0F2C  @ gUnknown_08A196FC
	ldr r0, [r0]
	adds r0, r5, r0
	ldrb r0, [r0, #1]
	bl GetClassSMSId
	bl SMS_RegisterUsage
	adds r5, #0x18
	adds r4, #1
	ldr r0, _080A0F28  @ gUnknown_020136F0
	ldr r0, [r0]
	cmp r4, r0
	blt _080A0F00
_080A0F1C:
	bl SMS_FlushIndirect
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A0F28: .4byte gUnknown_020136F0
_080A0F2C: .4byte gUnknown_08A196FC

	THUMB_FUNC_END sub_80A0EC0

	THUMB_FUNC_START sub_80A0F30
sub_80A0F30: @ 0x080A0F30
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	movs r6, #0
	movs r4, #0
	ldr r7, _080A0F3C  @ gCharacterData+0x2C
	b _080A0F4C
	.align 2, 0
_080A0F3C: .4byte gCharacterData+0x2C
_080A0F40:
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_80A0AD4
	adds r6, r6, r0
	adds r4, #1
_080A0F4C:
	adds r0, r5, #0
	bl sub_80A0B44
	subs r0, #1
	movs r1, #0x34
	muls r0, r1, r0
	adds r0, r0, r7
	ldr r0, [r0]
	ldrb r0, [r0, #0x15]
	cmp r4, r0
	blt _080A0F40
	adds r0, r6, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80A0F30

	THUMB_FUNC_START sub_80A0F6C
sub_80A0F6C: @ 0x080A0F6C
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	adds r6, r1, #0
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A0F88
	adds r0, r6, #0
	bl sub_80A0F30
	cmp r0, #5
	beq _080A0FCA
	b _080A0FD0
_080A0F88:
	movs r0, #0
	mov r8, r0
	adds r0, r6, #0
	bl sub_80A0F30
	mov r9, r0
	adds r0, r6, #0
	bl sub_80A0B44
	bl sub_80A1B6C
	adds r7, r0, #0
	movs r5, #0
	cmp r8, r7
	bge _080A0FC6
_080A0FA6:
	adds r0, r6, #0
	bl sub_80A0B44
	adds r4, r0, #0
	adds r0, r6, #0
	adds r1, r5, #0
	bl sub_80A0B20
	adds r1, r0, #0
	adds r0, r4, #0
	bl sub_80A3468
	add r8, r0
	adds r5, #1
	cmp r5, r7
	blt _080A0FA6
_080A0FC6:
	cmp r8, r9
	bne _080A0FCE
_080A0FCA:
	movs r0, #2
	b _080A0FDA
_080A0FCE:
	mov r0, r9
_080A0FD0:
	cmp r0, #0
	beq _080A0FD8
	movs r0, #1
	b _080A0FDA
_080A0FD8:
	movs r0, #0
_080A0FDA:
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80A0F6C

	THUMB_FUNC_START sub_80A0FE8
sub_80A0FE8: @ 0x080A0FE8
	push {r4, r5, r6, r7, lr}
	ldr r6, _080A10A4  @ gUnknown_02013590
	bl sub_80A3544
	adds r7, r0, #0
	adds r4, r6, #0
	subs r4, #8
	adds r0, r4, #0
	movs r1, #0x10
	bl Text_Init
	adds r0, r6, #0
	movs r1, #9
	bl Text_Init
	adds r0, r4, #0
	bl Text_Clear
	ldr r0, _080A10A8  @ 0x000005AD
	bl GetStringFromIndex
	adds r5, r0, #0
	movs r0, #0x80
	adds r1, r5, #0
	bl GetStringTextCenteredPos
	adds r1, r0, #0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	adds r0, r4, #0
	movs r2, #0
	adds r3, r5, #0
	bl Text_InsertString
	ldr r5, _080A10AC  @ gUnknown_02023136
	adds r0, r4, #0
	adds r1, r5, #0
	bl Text_Draw
	adds r0, r6, #0
	bl Text_Clear
	movs r4, #0
	cmp r7, #0x64
	bne _080A1044
	movs r4, #4
_080A1044:
	ldr r0, _080A10B0  @ 0x000005AA
	bl GetStringFromIndex
	adds r3, r0, #0
	adds r0, r6, #0
	movs r1, #0
	adds r2, r4, #0
	bl Text_InsertString
	adds r0, r6, #0
	movs r1, #0x34
	bl Text_SetXCursor
	movs r1, #2
	cmp r7, #0x64
	bne _080A1066
	movs r1, #4
_080A1066:
	adds r0, r6, #0
	bl Text_SetColorId
	adds r0, r6, #0
	adds r1, r7, #0
	bl Text_AppendNumberOr2Dashes
	movs r4, #0
	cmp r7, #0x64
	bne _080A107C
	movs r4, #4
_080A107C:
	ldr r0, _080A10B4  @ 0x000005AE
	bl GetStringFromIndex
	adds r3, r0, #0
	adds r0, r6, #0
	movs r1, #0x3c
	adds r2, r4, #0
	bl Text_InsertString
	ldr r0, _080A10B8  @ 0xFFFFFC18
	adds r1, r5, r0
	adds r0, r6, #0
	bl Text_Draw
	movs r0, #1
	bl BG_EnableSyncByMask
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A10A4: .4byte gUnknown_02013590
_080A10A8: .4byte 0x000005AD
_080A10AC: .4byte gUnknown_02023136
_080A10B0: .4byte 0x000005AA
_080A10B4: .4byte 0x000005AE
_080A10B8: .4byte 0xFFFFFC18

	THUMB_FUNC_END sub_80A0FE8

	THUMB_FUNC_START sub_80A10BC
sub_80A10BC: @ 0x080A10BC
	movs r1, #0
	str r1, [r0, #0x2c]
	adds r2, r0, #0
	adds r2, #0x40
	strb r1, [r2]
	str r1, [r0, #0x34]
	str r1, [r0, #0x38]
	subs r1, #1
	str r1, [r0, #0x3c]
	bx lr

	THUMB_FUNC_END sub_80A10BC

	THUMB_FUNC_START sub_80A10D0
sub_80A10D0: @ 0x080A10D0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080A10F0  @ gUnknown_08A1DD0C
	ldr r1, _080A10F4  @ 0x06017800
	bl CopyDataWithPossibleUncomp
	ldr r0, _080A10F8  @ gUnknown_08A1E0D8
	ldr r1, [r4, #0x34]
	adds r1, #0x10
	lsls r1, r1, #5
	movs r2, #0x20
	bl CopyToPaletteBuffer
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A10F0: .4byte gUnknown_08A1DD0C
_080A10F4: .4byte 0x06017800
_080A10F8: .4byte gUnknown_08A1E0D8

	THUMB_FUNC_END sub_80A10D0

	THUMB_FUNC_START sub_80A10FC
sub_80A10FC: @ 0x080A10FC
	push {r4, lr}
	sub sp, #4
	ldr r1, [r0, #0x2c]
	ldr r2, [r0, #0x30]
	ldr r3, _080A1138  @ gUnknown_08A19700
	ldr r0, [r0, #0x34]
	movs r4, #0xf
	ands r0, r4
	lsls r0, r0, #0xc
	movs r4, #0xfc
	lsls r4, r4, #4
	adds r0, r0, r4
	str r0, [sp]
	movs r0, #4
	bl PutSpriteExt
	ldr r3, _080A113C  @ gUnknown_08A19726
	movs r0, #0x87
	lsls r0, r0, #6
	str r0, [sp]
	movs r0, #4
	movs r1, #4
	movs r2, #0
	bl PutSpriteExt
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A1138: .4byte gUnknown_08A19700
_080A113C: .4byte gUnknown_08A19726

	THUMB_FUNC_END sub_80A10FC

	THUMB_FUNC_START sub_80A1140
sub_80A1140: @ 0x080A1140
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	adds r1, r3, #0
	ldr r0, _080A115C  @ gUnknown_08A1973C
	bl Proc_Start
	str r4, [r0, #0x2c]
	str r5, [r0, #0x30]
	str r6, [r0, #0x34]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A115C: .4byte gUnknown_08A1973C

	THUMB_FUNC_END sub_80A1140

	THUMB_FUNC_START sub_80A1160
sub_80A1160: @ 0x080A1160
	push {lr}
	ldr r0, _080A1170  @ gUnknown_08A1973C
	bl Proc_Find
	bl Proc_End
	pop {r0}
	bx r0
	.align 2, 0
_080A1170: .4byte gUnknown_08A1973C

	THUMB_FUNC_END sub_80A1160

	THUMB_FUNC_START sub_80A1174
sub_80A1174: @ 0x080A1174
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	mov r8, r0
	bl sub_80A0A94
	adds r7, r0, #0
	movs r6, #0
	cmp r6, r7
	bge _080A11CE
_080A118A:
	adds r0, r6, #0
	movs r1, #3
	bl __divsi3
	lsls r0, r0, #4
	mov r2, r8
	ldr r1, [r2, #0x34]
	subs r1, #0x24
	subs r5, r0, r1
	adds r0, r6, #0
	movs r1, #3
	bl __modsi3
	lsls r0, r0, #6
	adds r4, r0, #0
	adds r4, #0x18
	adds r0, r5, #0
	subs r0, #0x24
	cmp r0, #0x52
	bhi _080A11C8
	adds r0, r6, #0
	bl sub_80A0B58
	str r0, [sp]
	movs r0, #0
	adds r1, r4, #0
	adds r2, r5, #0
	movs r3, #0xc8
	lsls r3, r3, #8
	bl sub_8027C48
_080A11C8:
	adds r6, #1
	cmp r6, r7
	blt _080A118A
_080A11CE:
	bl SMS_FlushDirect
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80A1174

	THUMB_FUNC_START sub_80A11E0
sub_80A11E0: @ 0x080A11E0
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x3c]
	movs r1, #1
	negs r1, r1
	cmp r0, r1
	beq _080A1268
	str r0, [r4, #0x38]
	str r1, [r4, #0x3c]
	movs r1, #3
	bl __divsi3
	adds r1, r0, #0
	ldr r0, [r4, #0x34]
	cmp r0, #0
	bge _080A1202
	adds r0, #0xf
_080A1202:
	asrs r0, r0, #4
	subs r0, r1, r0
	lsls r0, r0, #4
	adds r0, #0x24
	cmp r0, #0x24
	bgt _080A121C
	cmp r1, #0
	bne _080A1216
	str r1, [r4, #0x34]
	b _080A121C
_080A1216:
	subs r0, r1, #1
	lsls r0, r0, #4
	str r0, [r4, #0x34]
_080A121C:
	ldr r0, [r4, #0x38]
	movs r1, #3
	bl __divsi3
	adds r5, r0, #0
	ldr r0, [r4, #0x34]
	cmp r0, #0
	bge _080A122E
	adds r0, #0xf
_080A122E:
	asrs r0, r0, #4
	subs r0, r5, r0
	lsls r0, r0, #4
	adds r0, #0x24
	cmp r0, #0x73
	ble _080A1268
	bl sub_80A0A94
	subs r0, #1
	movs r1, #3
	bl __divsi3
	cmp r5, r0
	bne _080A125A
	bl sub_80A0A94
	subs r0, #1
	movs r1, #3
	bl __divsi3
	subs r0, #5
	b _080A1264
_080A125A:
	ldr r0, [r4, #0x38]
	movs r1, #3
	bl __divsi3
	subs r0, #4
_080A1264:
	lsls r0, r0, #4
	str r0, [r4, #0x34]
_080A1268:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80A11E0

	THUMB_FUNC_START sub_80A1270
sub_80A1270: @ 0x080A1270
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r6, r0, #0
	ldr r7, _080A14D0  @ gLCDControlBuffer
	ldrb r1, [r7]
	movs r0, #8
	negs r0, r0
	ands r0, r1
	strb r0, [r7]
	movs r0, #0
	bl SetupBackgrounds
	movs r0, #0
	bl BG_GetMapBuffer
	movs r1, #0
	bl BG_Fill
	movs r0, #1
	bl BG_GetMapBuffer
	movs r1, #0
	bl BG_Fill
	movs r0, #2
	bl BG_GetMapBuffer
	movs r1, #0
	bl BG_Fill
	ldrb r2, [r7, #0xc]
	movs r1, #4
	negs r1, r1
	adds r0, r1, #0
	ands r0, r2
	strb r0, [r7, #0xc]
	ldrb r0, [r7, #0x10]
	movs r2, #3
	orrs r0, r2
	strb r0, [r7, #0x10]
	ldrb r0, [r7, #0x14]
	ands r1, r0
	movs r0, #1
	mov r9, r0
	mov r0, r9
	orrs r1, r0
	strb r1, [r7, #0x14]
	ldrb r0, [r7, #0x18]
	orrs r0, r2
	strb r0, [r7, #0x18]
	bl ResetFaces
	bl Font_InitForUIDefault
	bl ResetIconGraphics_
	movs r0, #0x80
	lsls r0, r0, #7
	movs r1, #1
	negs r1, r1
	bl LoadUiFrameGraphicsTo
	bl LoadObjUIGfx
	movs r0, #0xe
	bl LoadIconPalettes
	adds r0, r6, #0
	bl sub_80A11E0
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	movs r0, #1
	movs r1, #0
	movs r2, #2
	bl BG_SetPosition
	ldr r1, _080A14D4  @ 0x0000FFD8
	ldr r2, [r6, #0x34]
	subs r2, #0x24
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #2
	bl BG_SetPosition
	movs r5, #0
	str r5, [sp]
	adds r0, r6, #0
	movs r1, #0
	movs r2, #0x12
	movs r3, #2
	bl sub_8086CE8
	bl SetupMapSpritesPalettes
	bl SMS_ClearUsageTable
	adds r0, r6, #0
	bl sub_80A0EC0
	movs r0, #0xa0
	lsls r0, r0, #7
	movs r1, #5
	bl sub_8098C3C
	ldr r0, _080A14D8  @ gUnknown_08A1DB80
	ldr r4, _080A14DC  @ gUnknown_02020188
	adds r1, r4, #0
	bl CopyDataWithPossibleUncomp
	ldr r0, _080A14E0  @ gUnknown_020235AA
	movs r2, #0x90
	lsls r2, r2, #5
	adds r1, r4, #0
	bl CallARM_FillTileRect
	ldr r0, _080A14E4  @ gUnknown_08A1A8E4
	ldr r1, _080A14E8  @ 0x06013800
	bl CopyDataWithPossibleUncomp
	ldr r0, _080A14EC  @ gUnknown_08A1B174
	movs r1, #0x90
	lsls r1, r1, #2
	movs r2, #0x20
	bl CopyToPaletteBuffer
	movs r0, #7
	bl BG_EnableSyncByMask
	ldrb r0, [r7, #1]
	movs r1, #0x20
	mov ip, r1
	mov r2, ip
	orrs r0, r2
	movs r1, #0x41
	negs r1, r1
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r7, #1]
	adds r0, r7, #0
	adds r0, #0x2d
	strb r5, [r0]
	adds r1, r7, #0
	adds r1, #0x31
	movs r0, #0x26
	strb r0, [r1]
	subs r1, #5
	movs r0, #0xf0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0x86
	strb r0, [r1]
	movs r0, #0x34
	adds r0, r0, r7
	mov r8, r0
	ldrb r1, [r0]
	mov r2, r9
	orrs r1, r2
	movs r2, #2
	orrs r1, r2
	movs r0, #4
	orrs r1, r0
	movs r4, #8
	orrs r1, r4
	movs r3, #0x10
	orrs r1, r3
	adds r5, r7, #0
	adds r5, #0x36
	ldrb r0, [r5]
	mov r7, r9
	orrs r0, r7
	orrs r0, r2
	movs r2, #5
	negs r2, r2
	ands r0, r2
	orrs r0, r4
	orrs r0, r3
	mov r2, ip
	orrs r1, r2
	mov r7, r8
	strb r1, [r7]
	orrs r0, r2
	strb r0, [r5]
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
	bl sub_8001ED0
	ldr r5, _080A14F0  @ gUnknown_02013498
	movs r4, #0x14
_080A140A:
	adds r0, r5, #0
	movs r1, #5
	bl Text_Init
	adds r5, #8
	subs r4, #1
	cmp r4, #0
	bge _080A140A
	bl sub_80A0FE8
	bl sub_80A0A94
	cmp r0, #0
	beq _080A1476
	adds r0, r6, #0
	bl sub_80AD47C
	movs r0, #0xc0
	lsls r0, r0, #3
	movs r1, #1
	bl sub_80AD4A0
	ldr r4, [r6, #0x38]
	adds r0, r4, #0
	movs r1, #3
	bl __modsi3
	lsls r0, r0, #6
	adds r5, r0, #0
	adds r5, #0x14
	adds r0, r4, #0
	movs r1, #3
	bl __divsi3
	ldr r1, [r6, #0x34]
	cmp r1, #0
	bge _080A1456
	adds r1, #0xf
_080A1456:
	asrs r1, r1, #4
	subs r1, r0, r1
	lsls r1, r1, #4
	adds r1, #0x24
	movs r3, #0x80
	lsls r3, r3, #4
	adds r0, r5, #0
	movs r2, #7
	bl sub_80AD51C
	movs r0, #0xc0
	movs r1, #1
	movs r2, #9
	adds r3, r6, #0
	bl StartHelpPromptSprite
_080A1476:
	movs r0, #0x88
	movs r1, #9
	movs r2, #0xb
	adds r3, r6, #0
	bl sub_80A1140
	ldr r0, _080A14F4  @ sub_80A1174
	adds r1, r6, #0
	bl Get6CDifferedLoop6C
	movs r3, #0x80
	lsls r3, r3, #2
	movs r0, #4
	str r0, [sp]
	adds r0, r6, #0
	movs r1, #0xd8
	movs r2, #0x2d
	bl sub_8097748
	ldrh r4, [r6, #0x34]
	bl sub_80A0A94
	subs r0, #1
	movs r1, #3
	bl __divsi3
	adds r2, r0, #0
	adds r2, #1
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #0xa
	adds r1, r4, #0
	movs r3, #6
	bl sub_80976CC
	bl sub_8097668
	ldr r1, [r6, #0x34]
	cmp r1, #0
	bge _080A14C8
	adds r1, #0xf
_080A14C8:
	asrs r4, r1, #4
	adds r5, r6, #0
	adds r5, #0x43
	b _080A1502
	.align 2, 0
_080A14D0: .4byte gLCDControlBuffer
_080A14D4: .4byte 0x0000FFD8
_080A14D8: .4byte gUnknown_08A1DB80
_080A14DC: .4byte gUnknown_02020188
_080A14E0: .4byte gUnknown_020235AA
_080A14E4: .4byte gUnknown_08A1A8E4
_080A14E8: .4byte 0x06013800
_080A14EC: .4byte gUnknown_08A1B174
_080A14F0: .4byte gUnknown_02013498
_080A14F4: .4byte sub_80A1174
_080A14F8:
	adds r0, r6, #0
	adds r1, r4, #0
	bl sub_80A199C
	adds r4, #1
_080A1502:
	ldr r0, [r6, #0x34]
	cmp r0, #0
	bge _080A150A
	adds r0, #0xf
_080A150A:
	asrs r0, r0, #4
	adds r0, #6
	cmp r4, r0
	blt _080A14F8
	adds r0, r6, #0
	bl NewGreenTextColorManager
	movs r0, #0
	strb r0, [r5]
	ldr r0, _080A154C  @ 0x06014800
	movs r1, #0xa
	bl LoadDialogueBoxGfx
	ldr r2, _080A1550  @ gLCDControlBuffer
	ldrb r0, [r2, #1]
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
	strb r0, [r2, #1]
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A154C: .4byte 0x06014800
_080A1550: .4byte gLCDControlBuffer

	THUMB_FUNC_END sub_80A1270

	THUMB_FUNC_START sub_80A1554
sub_80A1554: @ 0x080A1554
	push {r4, lr}
	adds r4, r0, #0
	bl sub_808F270
	adds r0, r4, #0
	bl sub_80ADDD4
	bl EndBG3Slider_
	movs r0, #0
	bl DeleteFaceByIndex
	movs r0, #0
	bl SetPrimaryHBlankHandler
	bl sub_80A1160
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80A1554

	THUMB_FUNC_START sub_80A157C
sub_80A157C: @ 0x080A157C
	push {lr}
	sub sp, #4
	movs r0, #1
	movs r1, #0xe
	movs r2, #3
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	movs r0, #1
	str r0, [sp]
	movs r0, #0
	movs r1, #1
	movs r2, #0
	movs r3, #0
	bl sub_8001ED0
	movs r0, #0
	str r0, [sp]
	movs r1, #0
	movs r2, #0
	movs r3, #1
	bl sub_8001F0C
	add sp, #4
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80A157C

	THUMB_FUNC_START sub_80A15B0
sub_80A15B0: @ 0x080A15B0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	adds r6, r0, #0
	bl sub_80A0A94
	cmp r0, #0
	bne _080A15C6
	b _080A18D8
_080A15C6:
	adds r0, r6, #0
	adds r0, #0x40
	movs r7, #0
	ldrsb r7, [r0, r7]
	mov r8, r0
	cmp r7, #0
	beq _080A15D6
	b _080A1864
_080A15D6:
	ldr r0, [r6, #0x38]
	mov sl, r0
	ldr r4, _080A1620  @ gKeyStatusPtr
	ldr r2, [r4]
	ldrh r5, [r2, #6]
	adds r3, r6, #0
	adds r3, #0x41
	movs r0, #4
	strb r0, [r3]
	ldrh r1, [r2, #4]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080A15FA
	ldrh r5, [r2, #4]
	movs r0, #8
	strb r0, [r3]
_080A15FA:
	adds r0, r6, #0
	adds r0, #0x43
	movs r1, #0
	ldrsb r1, [r0, r1]
	mov r9, r0
	cmp r1, #0
	beq _080A1624
	ldr r0, [r4]
	ldrh r1, [r0, #8]
	movs r0, #0x81
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080A16DC
	bl CloseHelpBox
	mov r1, r9
	strb r7, [r1]
	b _080A1900
	.align 2, 0
_080A1620: .4byte gKeyStatusPtr
_080A1624:
	ldr r0, [r4]
	ldrh r1, [r0, #8]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080A1684
	ldr r7, [r6, #0x38]
	adds r0, r7, #0
	movs r1, #3
	bl __modsi3
	lsls r0, r0, #6
	adds r0, #0x14
	mov r8, r0
	adds r0, r7, #0
	movs r1, #3
	bl __divsi3
	adds r1, r0, #0
	ldr r0, [r6, #0x34]
	cmp r0, #0
	bge _080A1654
	adds r0, #0xf
_080A1654:
	asrs r4, r0, #4
	subs r4, r1, r4
	lsls r4, r4, #4
	adds r4, #0x24
	ldr r5, _080A1680  @ gCharacterData
	adds r0, r7, #0
	bl sub_80A0B44
	subs r0, #1
	movs r1, #0x34
	muls r0, r1, r0
	adds r0, r0, r5
	ldrh r2, [r0, #2]
	mov r0, r8
	adds r1, r4, #0
	bl StartHelpBox
	movs r0, #1
	mov r1, r9
	strb r0, [r1]
	b _080A1900
	.align 2, 0
_080A1680: .4byte gCharacterData
_080A1684:
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080A16B0
	adds r0, r6, #0
	movs r1, #2
	bl Proc_Goto
	ldr r0, _080A16AC  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	bge _080A16A2
	b _080A1900
_080A16A2:
	movs r0, #0x6a
	bl m4aSongNumStart
	b _080A1900
	.align 2, 0
_080A16AC: .4byte gRAMChapterData
_080A16B0:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080A16DC
	adds r0, r6, #0
	movs r1, #3
	bl Proc_Goto
	ldr r0, _080A16D8  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	bge _080A16CE
	b _080A1900
_080A16CE:
	movs r0, #0x6b
	bl m4aSongNumStart
	b _080A1900
	.align 2, 0
_080A16D8: .4byte gRAMChapterData
_080A16DC:
	movs r0, #0x20
	ands r0, r5
	cmp r0, #0
	beq _080A16F6
	ldr r4, [r6, #0x38]
	adds r0, r4, #0
	movs r1, #3
	bl __modsi3
	cmp r0, #0
	beq _080A16F6
	subs r0, r4, #1
	str r0, [r6, #0x38]
_080A16F6:
	movs r0, #0x10
	ands r0, r5
	cmp r0, #0
	beq _080A1722
	ldr r4, [r6, #0x38]
	adds r0, r4, #0
	movs r1, #3
	bl __modsi3
	cmp r0, #2
	beq _080A1722
	adds r0, r4, #1
	str r0, [r6, #0x38]
	bl sub_80A0A94
	ldr r1, [r6, #0x38]
	cmp r1, r0
	blt _080A1722
	bl sub_80A0A94
	subs r0, #1
	str r0, [r6, #0x38]
_080A1722:
	movs r0, #0x40
	ands r0, r5
	cmp r0, #0
	beq _080A1734
	ldr r0, [r6, #0x38]
	cmp r0, #2
	ble _080A1734
	subs r0, #3
	str r0, [r6, #0x38]
_080A1734:
	movs r0, #0x80
	ands r5, r0
	cmp r5, #0
	beq _080A174E
	ldr r4, [r6, #0x38]
	adds r4, #3
	bl sub_80A0A94
	cmp r4, r0
	bge _080A174E
	ldr r0, [r6, #0x38]
	adds r0, #3
	str r0, [r6, #0x38]
_080A174E:
	ldr r0, [r6, #0x38]
	cmp sl, r0
	bne _080A1756
	b _080A185A
_080A1756:
	movs r1, #3
	bl __divsi3
	adds r1, r0, #0
	ldr r0, [r6, #0x34]
	cmp r0, #0
	bge _080A1766
	adds r0, #0xf
_080A1766:
	asrs r0, r0, #4
	subs r0, r1, r0
	lsls r4, r0, #4
	movs r0, #0
	mov r1, r8
	strb r0, [r1]
	ldr r0, _080A17A4  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A1784
	movs r0, #0x65
	bl m4aSongNumStart
_080A1784:
	cmp r4, #0xf
	bgt _080A17A8
	ldr r1, [r6, #0x34]
	cmp r1, #0
	beq _080A17A8
	cmp r1, #0
	bge _080A1794
	adds r1, #0xf
_080A1794:
	asrs r1, r1, #4
	subs r1, #1
	adds r0, r6, #0
	bl sub_80A199C
	movs r0, #0xff
	b _080A17D4
	.align 2, 0
_080A17A4: .4byte gRAMChapterData
_080A17A8:
	cmp r4, #0x4f
	ble _080A17EA
	bl sub_80A0A94
	subs r0, #1
	movs r1, #3
	bl __divsi3
	subs r0, #5
	lsls r0, r0, #4
	ldr r1, [r6, #0x34]
	cmp r1, r0
	beq _080A17EA
	cmp r1, #0
	bge _080A17C8
	adds r1, #0xf
_080A17C8:
	asrs r1, r1, #4
	adds r1, #6
	adds r0, r6, #0
	bl sub_80A199C
	movs r0, #1
_080A17D4:
	mov r1, r8
	strb r0, [r1]
	ldr r0, [r6, #0x38]
	movs r1, #3
	bl __modsi3
	lsls r0, r0, #6
	adds r0, #0x14
	bl sub_80AD4E4
	b _080A1804
_080A17EA:
	ldr r0, [r6, #0x38]
	movs r1, #3
	bl __modsi3
	lsls r0, r0, #6
	adds r0, #0x14
	adds r1, r4, #0
	adds r1, #0x24
	movs r3, #0x80
	lsls r3, r3, #4
	movs r2, #7
	bl sub_80AD51C
_080A1804:
	mov r1, r9
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	beq _080A185A
	ldr r7, [r6, #0x38]
	adds r0, r7, #0
	movs r1, #3
	bl __modsi3
	lsls r0, r0, #6
	adds r0, #0x14
	mov r9, r0
	adds r0, r7, #0
	movs r1, #3
	bl __divsi3
	ldr r4, [r6, #0x34]
	cmp r4, #0
	bge _080A182E
	adds r4, #0xf
_080A182E:
	asrs r4, r4, #4
	subs r4, r0, r4
	lsls r4, r4, #4
	mov r1, r8
	movs r0, #0
	ldrsb r0, [r1, r0]
	lsls r0, r0, #4
	subs r0, #0x24
	subs r4, r4, r0
	ldr r5, _080A18D0  @ gCharacterData
	adds r0, r7, #0
	bl sub_80A0B44
	subs r0, #1
	movs r1, #0x34
	muls r0, r1, r0
	adds r0, r0, r5
	ldrh r2, [r0, #2]
	mov r0, r9
	adds r1, r4, #0
	bl StartHelpBox
_080A185A:
	mov r1, r8
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	beq _080A1900
_080A1864:
	mov r2, r8
	movs r0, #0
	ldrsb r0, [r2, r0]
	cmp r0, #0
	bge _080A187A
	adds r0, r6, #0
	adds r0, #0x41
	ldrb r1, [r0]
	ldr r0, [r6, #0x34]
	subs r0, r0, r1
	str r0, [r6, #0x34]
_080A187A:
	movs r0, #0
	ldrsb r0, [r2, r0]
	cmp r0, #0
	ble _080A188E
	adds r0, r6, #0
	adds r0, #0x41
	ldrb r1, [r0]
	ldr r0, [r6, #0x34]
	adds r0, r0, r1
	str r0, [r6, #0x34]
_080A188E:
	ldr r1, [r6, #0x34]
	movs r0, #0xf
	ands r1, r0
	cmp r1, #0
	bne _080A189C
	mov r0, r8
	strb r1, [r0]
_080A189C:
	ldrh r4, [r6, #0x34]
	bl sub_80A0A94
	subs r0, #1
	movs r1, #3
	bl __divsi3
	adds r2, r0, #0
	adds r2, #1
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #0xa
	adds r1, r4, #0
	movs r3, #6
	bl sub_80976CC
	ldr r1, _080A18D4  @ 0x0000FFD8
	ldr r2, [r6, #0x34]
	subs r2, #0x24
	movs r0, #0xff
	ands r2, r0
	movs r0, #2
	bl BG_SetPosition
	b _080A1900
	.align 2, 0
_080A18D0: .4byte gCharacterData
_080A18D4: .4byte 0x0000FFD8
_080A18D8:
	ldr r0, _080A1910  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080A1900
	adds r0, r6, #0
	movs r1, #3
	bl Proc_Goto
	ldr r0, _080A1914  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A1900
	movs r0, #0x6b
	bl m4aSongNumStart
_080A1900:
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A1910: .4byte gKeyStatusPtr
_080A1914: .4byte gRAMChapterData

	THUMB_FUNC_END sub_80A15B0

	THUMB_FUNC_START sub_80A1918
sub_80A1918: @ 0x080A1918
	push {lr}
	adds r2, r0, #0
	adds r0, #0x42
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldr r1, [r2, #0x38]
	bl sub_80A2C08
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80A1918

	THUMB_FUNC_START sub_80A1930
sub_80A1930: @ 0x080A1930
	push {lr}
	sub sp, #4
	adds r0, #0x42
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _080A1952
	movs r1, #0x80
	lsls r1, r1, #1
	str r0, [sp]
	movs r0, #0x43
	movs r2, #0xc0
	movs r3, #0x18
	bl sub_80029E8
	b _080A1964
_080A1952:
	movs r2, #0x80
	lsls r2, r2, #1
	movs r0, #0
	str r0, [sp]
	movs r0, #0x34
	adds r1, r2, #0
	movs r3, #0x18
	bl sub_80029E8
_080A1964:
	add sp, #4
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80A1930

	THUMB_FUNC_START sub_80A196C
sub_80A196C: @ 0x080A196C
	push {lr}
	adds r1, r0, #0
	ldr r0, _080A1980  @ gUnknown_08A1975C
	bl Proc_StartBlocking
	adds r0, #0x42
	movs r1, #1
	strb r1, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_080A1980: .4byte gUnknown_08A1975C

	THUMB_FUNC_END sub_80A196C

	THUMB_FUNC_START sub_80A1984
sub_80A1984: @ 0x080A1984
	push {lr}
	adds r1, r0, #0
	ldr r0, _080A1998  @ gUnknown_08A1975C
	bl Proc_StartBlocking
	adds r0, #0x42
	movs r1, #0
	strb r1, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_080A1998: .4byte gUnknown_08A1975C

	THUMB_FUNC_END sub_80A1984

	THUMB_FUNC_START sub_80A199C
sub_80A199C: @ 0x080A199C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	str r0, [sp]
	mov sl, r1
	movs r0, #0
	bl SetFontGlyphSet
	movs r0, #0
	bl SetFont
	mov r0, sl
	lsls r4, r0, #1
	add r4, sl
	adds r0, r4, #0
	movs r1, #0x15
	bl __modsi3
	lsls r0, r0, #3
	ldr r1, _080A1A10  @ gUnknown_02013498
	adds r5, r0, r1
	movs r7, #0
	adds r6, r4, #0
_080A19D0:
	adds r0, r5, #0
	bl Text_Clear
	bl sub_80A0A94
	cmp r6, r0
	bge _080A1A66
	adds r0, r7, #0
	movs r1, #3
	bl __modsi3
	lsls r0, r0, #3
	mov r8, r0
	mov r1, sl
	lsls r4, r1, #1
	movs r0, #0x1f
	ands r4, r0
	ldr r0, [sp]
	adds r0, #0x42
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r1, r6, #0
	bl sub_80A0F6C
	cmp r0, #1
	beq _080A1A1E
	cmp r0, #1
	bgt _080A1A14
	cmp r0, #0
	beq _080A1A1A
	b _080A1A28
	.align 2, 0
_080A1A10: .4byte gUnknown_02013498
_080A1A14:
	cmp r0, #2
	beq _080A1A24
	b _080A1A28
_080A1A1A:
	movs r0, #1
	b _080A1A26
_080A1A1E:
	movs r1, #0
	mov r9, r1
	b _080A1A28
_080A1A24:
	movs r0, #4
_080A1A26:
	mov r9, r0
_080A1A28:
	adds r0, r5, #0
	movs r1, #0
	bl Text_SetXCursor
	adds r0, r5, #0
	mov r1, r9
	bl Text_SetColorId
	adds r0, r6, #0
	bl sub_80A0B44
	subs r0, #1
	movs r1, #0x34
	muls r0, r1, r0
	ldr r1, _080A1A88  @ gCharacterData
	adds r0, r0, r1
	ldrh r0, [r0]
	bl GetStringFromIndex
	adds r1, r0, #0
	adds r0, r5, #0
	bl Text_AppendString
	lsls r1, r4, #5
	add r1, r8
	lsls r1, r1, #1
	ldr r0, _080A1A8C  @ gBG2TilemapBuffer
	adds r1, r1, r0
	adds r0, r5, #0
	bl Text_Draw
_080A1A66:
	adds r5, #8
	adds r6, #1
	adds r7, #1
	cmp r7, #2
	ble _080A19D0
	movs r0, #4
	bl BG_EnableSyncByMask
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A1A88: .4byte gCharacterData
_080A1A8C: .4byte gBG2TilemapBuffer

	THUMB_FUNC_END sub_80A199C

	THUMB_FUNC_START sub_80A1A90
sub_80A1A90: @ 0x080A1A90
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080A1AA8  @ gUnknown_08A1975C
	bl Proc_Find
	cmp r0, #0
	beq _080A1AA0
	str r4, [r0, #0x3c]
_080A1AA0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A1AA8: .4byte gUnknown_08A1975C

	THUMB_FUNC_END sub_80A1A90

	THUMB_FUNC_START sub_80A1AAC
sub_80A1AAC: @ 0x080A1AAC
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r5, r0, #0
	adds r6, r1, #0
	mov r8, r2
	bl sub_80A0B44
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_80A0B20
	adds r2, r0, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	movs r0, #0
	adds r1, r4, #0
	mov r3, r8
	bl sub_8083790
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80A1AAC

	THUMB_FUNC_START sub_80A1AE4
sub_80A1AE4: @ 0x080A1AE4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	movs r0, #0
	ldr r1, _080A1B58  @ gBG1TilemapBuffer
	mov sl, r1
	ldr r6, _080A1B5C  @ gBG2TilemapBuffer
	mov r9, r6
	ldr r7, _080A1B60  @ gUnknown_020136F4
	ldr r1, _080A1B64  @ gBG0TilemapBuffer
	mov r8, r1
	movs r6, #0x80
	lsls r6, r6, #4
	adds r6, r6, r7
	mov ip, r6
_080A1B08:
	adds r1, r0, #1
	str r1, [sp]
	lsls r0, r0, #1
	ldr r6, _080A1B68  @ gUnknown_020146F4
	adds r4, r0, r6
	adds r3, r0, r7
	adds r2, r0, #0
	movs r5, #0x13
_080A1B18:
	mov r1, r8
	adds r0, r2, r1
	ldrh r0, [r0]
	strh r0, [r3]
	mov r6, ip
	adds r1, r2, r6
	mov r6, sl
	adds r0, r2, r6
	ldrh r0, [r0]
	strh r0, [r1]
	mov r1, r9
	adds r0, r2, r1
	ldrh r0, [r0]
	strh r0, [r4]
	adds r4, #0x40
	adds r3, #0x40
	adds r2, #0x40
	subs r5, #1
	cmp r5, #0
	bge _080A1B18
	ldr r0, [sp]
	cmp r0, #0x1d
	ble _080A1B08
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A1B58: .4byte gBG1TilemapBuffer
_080A1B5C: .4byte gBG2TilemapBuffer
_080A1B60: .4byte gUnknown_020136F4
_080A1B64: .4byte gBG0TilemapBuffer
_080A1B68: .4byte gUnknown_020146F4

	THUMB_FUNC_END sub_80A1AE4

	THUMB_FUNC_START sub_80A1B6C
sub_80A1B6C: @ 0x080A1B6C
	push {lr}
	ldr r2, _080A1B84  @ gCharacterData
	subs r0, #1
	movs r1, #0x34
	muls r0, r1, r0
	adds r2, #0x2c
	adds r0, r0, r2
	ldr r0, [r0]
	cmp r0, #0
	beq _080A1B88
	ldrb r0, [r0, #0x15]
	b _080A1B8A
	.align 2, 0
_080A1B84: .4byte gCharacterData
_080A1B88:
	movs r0, #0
_080A1B8A:
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80A1B6C

	THUMB_FUNC_START sub_80A1B90
sub_80A1B90: @ 0x080A1B90
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r6, r0, #0
	ldr r1, [r6, #0x30]
	adds r1, #0x80
	ldr r4, _080A1C6C  @ 0x000001FF
	ands r1, r4
	ldr r3, _080A1C70  @ gUnknown_08A1983C
	movs r0, #0x8f
	lsls r0, r0, #6
	str r0, [sp]
	movs r0, #4
	movs r2, #8
	bl PutSpriteExt
	ldr r1, [r6, #0x30]
	adds r1, #0x20
	ands r1, r4
	ldr r3, _080A1C74  @ gUnknown_08A19850
	ldr r5, _080A1C78  @ 0x0000E280
	str r5, [sp]
	movs r0, #4
	movs r2, #0x50
	bl PutSpriteExt
	ldr r1, [r6, #0x30]
	adds r1, #5
	ands r1, r4
	ldr r3, _080A1C7C  @ gUnknown_08A19700
	ldr r0, _080A1C80  @ 0x0000ABC0
	str r0, [sp]
	movs r0, #4
	movs r2, #0x67
	bl PutSpriteExt
	ldr r1, [r6, #0x30]
	adds r1, #0x14
	ands r1, r4
	ldr r3, _080A1C84  @ gUnknown_08A1985E
	str r5, [sp]
	movs r0, #4
	movs r2, #0x6f
	bl PutSpriteExt
	ldr r1, [r6, #0x30]
	adds r1, #0xc
	ands r1, r4
	ldr r3, _080A1C88  @ gUnknown_08A19872
	movs r0, #0xaf
	lsls r0, r0, #6
	str r0, [sp]
	movs r0, #4
	movs r2, #0x90
	bl PutSpriteExt
	ldr r0, [r6, #0x30]
	adds r7, r0, #0
	adds r7, #0x70
	ands r7, r4
	ldr r0, [r6, #0x34]
	adds r2, r0, #0
	adds r2, #0x16
	movs r4, #0
	adds r0, r6, #0
	adds r0, #0x3c
	ldrb r0, [r0]
	cmp r4, r0
	bge _080A1C60
	adds r5, r2, #0
_080A1C1A:
	movs r3, #0xc0
	lsls r3, r3, #8
	adds r0, r6, #0
	adds r0, #0x3f
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0
	bne _080A1C2E
	movs r3, #0xd0
	lsls r3, r3, #8
_080A1C2E:
	cmp r0, #2
	bne _080A1C36
	movs r3, #0xf0
	lsls r3, r3, #8
_080A1C36:
	movs r1, #0xc0
	lsls r1, r1, #4
	adds r0, r1, #0
	orrs r3, r0
	adds r0, r6, #0
	adds r0, #0x4d
	adds r0, r0, r4
	ldrb r0, [r0]
	str r0, [sp]
	movs r0, #0
	adds r1, r7, #0
	adds r2, r5, #0
	bl sub_8027C48
	adds r5, #0x10
	adds r4, #1
	adds r0, r6, #0
	adds r0, #0x3c
	ldrb r0, [r0]
	cmp r4, r0
	blt _080A1C1A
_080A1C60:
	bl SMS_FlushDirect
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A1C6C: .4byte 0x000001FF
_080A1C70: .4byte gUnknown_08A1983C
_080A1C74: .4byte gUnknown_08A19850
_080A1C78: .4byte 0x0000E280
_080A1C7C: .4byte gUnknown_08A19700
_080A1C80: .4byte 0x0000ABC0
_080A1C84: .4byte gUnknown_08A1985E
_080A1C88: .4byte gUnknown_08A19872

	THUMB_FUNC_END sub_80A1B90

	THUMB_FUNC_START sub_80A1C8C
sub_80A1C8C: @ 0x080A1C8C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x24
	mov r9, r0
	mov sl, r1
	add r1, sp, #8
	ldr r0, _080A1D20  @ gUnknown_08205C90
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	mov r0, r9
	adds r0, #0x3f
	mov r1, sl
	adds r4, r0, r1
	ldrb r0, [r4]
	cmp r0, #0
	bne _080A1D28
	movs r5, #0
	lsls r1, r1, #1
	mov r8, r1
	mov r0, r8
	adds r0, #3
	lsls r0, r0, #5
	adds r0, #0x10
	ldr r1, _080A1D24  @ gBG2TilemapBuffer
	lsls r0, r0, #1
	adds r4, r0, r1
_080A1CC6:
	adds r0, r4, #0
	movs r1, #1
	movs r2, #0x14
	bl sub_8004B0C
	adds r4, #2
	adds r5, #1
	cmp r5, #4
	ble _080A1CC6
	movs r5, #0
	mov r0, r8
	adds r0, #3
	lsls r0, r0, #5
	adds r0, #0x16
	ldr r1, _080A1D24  @ gBG2TilemapBuffer
	lsls r0, r0, #1
	adds r4, r0, r1
_080A1CE8:
	adds r0, r4, #0
	movs r1, #1
	movs r2, #0x14
	bl sub_8004B0C
	adds r4, #2
	adds r5, #1
	cmp r5, #1
	ble _080A1CE8
	movs r5, #0
	mov r0, r8
	adds r0, #3
	lsls r0, r0, #5
	adds r0, #0x19
	ldr r1, _080A1D24  @ gBG2TilemapBuffer
	lsls r0, r0, #1
	adds r4, r0, r1
_080A1D0A:
	adds r0, r4, #0
	movs r1, #1
	movs r2, #0x14
	bl sub_8004B0C
	adds r4, #2
	adds r5, #1
	cmp r5, #2
	ble _080A1D0A
	b _080A1E68
	.align 2, 0
_080A1D20: .4byte gUnknown_08205C90
_080A1D24: .4byte gBG2TilemapBuffer
_080A1D28:
	movs r7, #0
	mov r2, r9
	ldr r0, [r2, #0x2c]
	bl sub_80A0B44
	str r0, [sp, #0x14]
	mov r3, r9
	ldr r0, [r3, #0x2c]
	mov r1, sl
	bl sub_80A0B20
	str r0, [sp, #0x18]
	ldrb r0, [r4]
	cmp r0, #2
	bne _080A1D48
	movs r7, #1
_080A1D48:
	mov r4, r9
	ldr r0, [r4, #0x2c]
	mov r1, sl
	bl sub_80A0B20
	subs r0, #1
	movs r6, #0x34
	muls r0, r6, r0
	ldr r1, _080A1DD8  @ gCharacterData
	adds r0, r0, r1
	ldrh r0, [r0]
	bl GetStringFromIndex
	mov r2, sl
	lsls r2, r2, #1
	mov r8, r2
	mov r4, r8
	adds r4, #3
	lsls r3, r4, #5
	str r3, [sp, #0x1c]
	lsls r4, r4, #6
	ldr r5, _080A1DDC  @ gUnknown_02023CC8
	adds r1, r4, r5
	movs r2, #5
	str r2, [sp]
	str r0, [sp, #4]
	movs r0, #0
	adds r2, r7, #0
	movs r3, #0
	bl DrawTextInline
	adds r5, #0xc
	adds r4, r4, r5
	mov r1, r9
	ldr r0, [r1, #0x2c]
	mov r1, sl
	bl sub_80A0B20
	subs r0, #1
	muls r0, r6, r0
	ldr r2, _080A1DD8  @ gCharacterData
	adds r0, r0, r2
	ldrb r1, [r0, #9]
	adds r1, #0x79
	movs r2, #0xe0
	lsls r2, r2, #8
	adds r0, r4, #0
	bl DrawIcon
	ldr r0, [sp, #0x14]
	ldr r1, [sp, #0x18]
	bl sub_80A3468
	cmp r0, #2
	bne _080A1E24
	movs r5, #0
	mov r0, r9
	adds r0, #0x46
	mov r3, sl
	adds r6, r0, r3
	ldr r0, [sp, #0x1c]
	adds r0, #0x19
	add r4, sp, #8
	mov r9, r4
	lsls r4, r0, #1
_080A1DCA:
	movs r7, #1
	ldrb r0, [r6]
	cmp r0, #2
	bne _080A1DE0
	movs r7, #4
	b _080A1DE8
	.align 2, 0
_080A1DD8: .4byte gCharacterData
_080A1DDC: .4byte gUnknown_02023CC8
_080A1DE0:
	ldrb r0, [r6]
	cmp r0, r5
	ble _080A1DE8
	movs r7, #0
_080A1DE8:
	ldr r3, _080A1E20  @ gBG2TilemapBuffer
	adds r0, r4, r3
	mov r1, r9
	adds r1, #4
	mov r9, r1
	subs r1, #4
	ldm r1!, {r2}
	adds r1, r7, #0
	str r3, [sp, #0x20]
	bl sub_8004B0C
	adds r4, #2
	adds r5, #1
	ldr r3, [sp, #0x20]
	cmp r5, #1
	ble _080A1DCA
	mov r0, r8
	adds r0, #3
	lsls r0, r0, #6
	adds r1, r3, #0
	adds r1, #0x36
	adds r0, r0, r1
	movs r1, #1
	movs r2, #0x14
	bl sub_8004B0C
	b _080A1E68
	.align 2, 0
_080A1E20: .4byte gBG2TilemapBuffer
_080A1E24:
	movs r5, #0
	mov r0, r9
	adds r0, #0x46
	mov r2, sl
	adds r6, r0, r2
	ldr r0, [sp, #0x1c]
	adds r0, #0x19
	add r3, sp, #8
	mov r8, r3
	lsls r4, r0, #1
_080A1E38:
	movs r7, #1
	ldrb r0, [r6]
	cmp r0, #3
	bne _080A1E44
	movs r7, #4
	b _080A1E4C
_080A1E44:
	ldrb r0, [r6]
	cmp r0, r5
	ble _080A1E4C
	movs r7, #0
_080A1E4C:
	ldr r0, _080A1E78  @ gBG2TilemapBuffer
	adds r0, r4, r0
	mov r1, r8
	adds r1, #4
	mov r8, r1
	subs r1, #4
	ldm r1!, {r2}
	adds r1, r7, #0
	bl sub_8004B0C
	adds r4, #2
	adds r5, #1
	cmp r5, #2
	ble _080A1E38
_080A1E68:
	add sp, #0x24
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A1E78: .4byte gBG2TilemapBuffer

	THUMB_FUNC_END sub_80A1C8C

	THUMB_FUNC_START sub_80A1E7C
sub_80A1E7C: @ 0x080A1E7C
	push {r4, r5, r6, lr}
	sub sp, #0x20
	adds r5, r0, #0
	ldr r1, _080A1F54  @ 0x06015000
	mov r0, sp
	movs r2, #0xe
	bl InitSomeOtherGraphicsRelatedStruct
	ldr r0, _080A1F58  @ gUnknown_0859EF00
	movs r1, #0xf0
	lsls r1, r1, #2
	movs r2, #0x20
	bl CopyToPaletteBuffer
	add r6, sp, #0x18
	adds r0, r6, #0
	bl Text_Init3
	mov r0, sp
	bl SetFont
	movs r0, #0
	bl SetFontGlyphSet
	adds r0, r6, #0
	movs r1, #0
	bl Text_80046B4
	ldr r4, _080A1F5C  @ gCharacterData
	ldr r0, [r5, #0x2c]
	bl sub_80A0B44
	subs r0, #1
	movs r1, #0x34
	muls r0, r1, r0
	adds r0, r0, r4
	ldrh r0, [r0]
	bl GetStringFromIndex
	adds r4, r0, #0
	movs r0, #0x28
	adds r1, r4, #0
	bl GetStringTextCenteredPos
	adds r1, r0, #0
	adds r0, r6, #0
	movs r2, #0
	adds r3, r4, #0
	bl Text_InsertString
	movs r4, #0
	adds r5, #0x3d
	ldrb r0, [r5]
	cmp r0, #0
	bne _080A1EEC
	movs r4, #1
_080A1EEC:
	ldr r0, _080A1F60  @ 0x000005AB
	bl GetStringFromIndex
	adds r3, r0, #0
	adds r0, r6, #0
	movs r1, #0x30
	adds r2, r4, #0
	bl Text_InsertString
	movs r4, #0
	ldrb r0, [r5]
	cmp r0, #0
	bne _080A1F08
	movs r4, #1
_080A1F08:
	ldr r0, _080A1F64  @ 0x000005AC
	bl GetStringFromIndex
	adds r3, r0, #0
	adds r0, r6, #0
	movs r1, #0x60
	adds r2, r4, #0
	bl Text_InsertString
	ldrb r0, [r5]
	bl sub_80AEBEC
	adds r1, r0, #0
	lsls r1, r1, #3
	adds r1, #0x60
	adds r0, r6, #0
	bl Text_SetXCursor
	ldrb r0, [r5]
	movs r1, #2
	cmp r0, #0
	bne _080A1F36
	movs r1, #1
_080A1F36:
	adds r0, r6, #0
	bl Text_SetColorId
	ldrb r1, [r5]
	adds r0, r6, #0
	bl Text_AppendNumberOr2Dashes
	movs r0, #0
	bl SetFont
	add sp, #0x20
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A1F54: .4byte 0x06015000
_080A1F58: .4byte gUnknown_0859EF00
_080A1F5C: .4byte gCharacterData
_080A1F60: .4byte 0x000005AB
_080A1F64: .4byte 0x000005AC

	THUMB_FUNC_END sub_80A1E7C

	THUMB_FUNC_START sub_80A1F68
sub_80A1F68: @ 0x080A1F68
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	adds r6, r0, #0
	adds r0, #0x38
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _080A1FF4
	movs r4, #0
	adds r0, r6, #0
	adds r0, #0x3c
	mov r8, r0
	ldrb r0, [r0]
	cmp r4, r0
	bge _080A203E
	movs r1, #0x3f
	adds r1, r1, r6
	mov sl, r1
_080A1F94:
	ldr r0, [r6, #0x2c]
	adds r1, r4, #0
	bl sub_80A0B20
	adds r7, r0, #0
	mov r2, sl
	adds r1, r2, r4
	movs r0, #0
	strb r0, [r1]
	movs r5, #1
	adds r4, #1
	mov r9, r4
	adds r4, r1, #0
_080A1FAE:
	adds r0, r5, #0
	bl GetUnit
	adds r1, r0, #0
	cmp r1, #0
	beq _080A1FE2
	ldr r0, [r1]
	cmp r0, #0
	beq _080A1FE2
	ldrb r0, [r0, #4]
	cmp r0, r7
	bne _080A1FE2
	ldr r1, [r1, #0xc]
	movs r0, #0x80
	lsls r0, r0, #9
	ands r0, r1
	cmp r0, #0
	bne _080A1FE2
	movs r0, #4
	ands r1, r0
	cmp r1, #0
	beq _080A1FDE
	movs r0, #2
	b _080A1FE0
_080A1FDE:
	movs r0, #1
_080A1FE0:
	strb r0, [r4]
_080A1FE2:
	adds r5, #1
	cmp r5, #0x3f
	ble _080A1FAE
	mov r4, r9
	mov r0, r8
	ldrb r0, [r0]
	cmp r4, r0
	blt _080A1F94
	b _080A203E
_080A1FF4:
	adds r1, r6, #0
	adds r1, #0x3b
	strb r0, [r1]
	movs r4, #0
	adds r0, r6, #0
	adds r0, #0x3c
	mov r8, r0
	ldrb r2, [r0]
	cmp r4, r2
	bge _080A203E
	adds r7, r1, #0
_080A200A:
	adds r0, r6, #0
	adds r0, #0x3f
	adds r5, r0, r4
	movs r0, #0
	strb r0, [r5]
	ldr r0, [r6, #0x2c]
	adds r1, r4, #0
	bl sub_80A0B04
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A2034
	movs r0, #1
	strb r0, [r5]
	ldr r0, [r6, #0x2c]
	adds r1, r4, #0
	bl sub_80A0AD4
	ldrb r1, [r7]
	adds r1, r1, r0
	strb r1, [r7]
_080A2034:
	adds r4, #1
	mov r0, r8
	ldrb r0, [r0]
	cmp r4, r0
	blt _080A200A
_080A203E:
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80A1F68

	THUMB_FUNC_START sub_80A204C
sub_80A204C: @ 0x080A204C
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	movs r4, #0
	adds r0, #0x3c
	ldrb r1, [r0]
	cmp r4, r1
	bge _080A2074
	adds r7, r5, #0
	adds r7, #0x46
	adds r6, r0, #0
_080A2060:
	ldr r0, [r5, #0x2c]
	adds r1, r4, #0
	bl sub_80A0AD4
	adds r1, r7, r4
	strb r0, [r1]
	adds r4, #1
	ldrb r0, [r6]
	cmp r4, r0
	blt _080A2060
_080A2074:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80A204C

	THUMB_FUNC_START sub_80A207C
sub_80A207C: @ 0x080A207C
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	adds r4, r0, #0
	adds r0, #0x38
	movs r5, #0
	ldrsb r5, [r0, r5]
	cmp r5, #0
	beq _080A20A2
	ldr r0, [r4, #0x2c]
	bl sub_80A0F30
	movs r1, #5
	subs r1, r1, r0
	adds r0, r4, #0
	adds r0, #0x3d
	strb r1, [r0]
	b _080A20EE
_080A20A2:
	ldr r0, [r4, #0x2c]
	bl sub_80A0B44
	mov r9, r0
	adds r1, r4, #0
	adds r1, #0x3d
	strb r5, [r1]
	movs r5, #0
	adds r0, r4, #0
	adds r0, #0x3c
	mov r8, r1
	adds r7, r0, #0
	ldrb r0, [r7]
	cmp r5, r0
	bge _080A20E0
	mov r6, r8
_080A20C2:
	ldr r0, [r4, #0x2c]
	adds r1, r5, #0
	bl sub_80A0B20
	adds r1, r0, #0
	mov r0, r9
	bl sub_80A3468
	ldrb r1, [r6]
	adds r1, r1, r0
	strb r1, [r6]
	adds r5, #1
	ldrb r2, [r7]
	cmp r5, r2
	blt _080A20C2
_080A20E0:
	ldr r0, [r4, #0x2c]
	bl sub_80A0F30
	mov r2, r8
	ldrb r1, [r2]
	subs r1, r1, r0
	strb r1, [r2]
_080A20EE:
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80A207C

	THUMB_FUNC_START sub_80A20FC
sub_80A20FC: @ 0x080A20FC
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	bl SMS_ClearUsageTable
	movs r4, #0
	b _080A2124
_080A2108:
	ldr r0, [r5, #0x2c]
	adds r1, r4, #0
	bl sub_80A0AEC
	adds r1, r5, #0
	adds r1, #0x4d
	adds r1, r1, r4
	strb r0, [r1]
	ldrb r0, [r1]
	bl GetClassSMSId
	bl SMS_RegisterUsage
	adds r4, #1
_080A2124:
	adds r0, r5, #0
	adds r0, #0x3c
	ldrb r0, [r0]
	cmp r4, r0
	blt _080A2108
	bl SMS_FlushIndirect
	movs r4, #0
	adds r0, r5, #0
	adds r0, #0x3c
	adds r6, r0, #0
	b _080A2146
_080A213C:
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_80A1C8C
	adds r4, #1
_080A2146:
	ldrb r0, [r6]
	cmp r4, r0
	blt _080A213C
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80A20FC

	THUMB_FUNC_START sub_80A2154
sub_80A2154: @ 0x080A2154
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r5, r1, #0
	adds r4, r2, #0
_080A215C:
	cmp r5, #0
	blt _080A21C8
	adds r0, r7, #0
	adds r0, #0x3c
	ldrb r0, [r0]
	subs r0, #1
	cmp r5, r0
	bgt _080A21C8
	adds r0, r7, #0
	adds r0, #0x3f
	adds r0, r0, r5
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080A21C4
	ldr r0, [r7, #0x2c]
	adds r1, r5, #0
	bl sub_80A0AD4
	cmp r0, #0
	ble _080A21C4
	adds r6, r7, #0
	adds r6, #0x39
	ldrb r0, [r6]
	movs r1, #0xe3
	ands r1, r0
	movs r2, #7
	adds r0, r5, #0
	ands r0, r2
	lsls r0, r0, #2
	adds r1, r1, r0
	strb r1, [r6]
	movs r4, #3
	ands r4, r1
	ldr r0, [r7, #0x2c]
	adds r1, r5, #0
	bl sub_80A0AD4
	cmp r4, r0
	blt _080A21C8
	ldr r0, [r7, #0x2c]
	adds r1, r5, #0
	bl sub_80A0AD4
	ldrb r2, [r6]
	movs r1, #0xfc
	ands r1, r2
	subs r0, #1
	adds r1, r1, r0
	strb r1, [r6]
	b _080A21C8
_080A21C4:
	adds r5, r5, r4
	b _080A215C
_080A21C8:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80A2154

	THUMB_FUNC_START sub_80A21D0
sub_80A21D0: @ 0x080A21D0
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0
	str r0, [r4, #0x30]
	str r0, [r4, #0x34]
	adds r2, r4, #0
	adds r2, #0x39
	ldrb r1, [r2]
	movs r0, #0xfc
	ands r0, r1
	movs r1, #0xe3
	ands r0, r1
	strb r0, [r2]
	ldr r0, [r4, #0x2c]
	bl sub_80A0B44
	bl sub_80A1B6C
	adds r1, r4, #0
	adds r1, #0x3c
	strb r0, [r1]
	adds r0, r4, #0
	bl sub_80A1F68
	adds r0, r4, #0
	bl sub_80A204C
	adds r0, r4, #0
	bl sub_80A207C
	adds r0, r4, #0
	movs r1, #0
	movs r2, #1
	bl sub_80A2154
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80A21D0

	THUMB_FUNC_START sub_80A221C
sub_80A221C: @ 0x080A221C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r3, _080A2270  @ gUnknown_02022C28
	adds r5, r3, #0
	adds r5, #0x20
	movs r0, #0x1f
	mov r8, r0
	movs r7, #0xf8
	lsls r7, r7, #2
	movs r6, #0xf8
	lsls r6, r6, #7
	movs r4, #0xf
	movs r0, #0x1f
	mov ip, r0
_080A223A:
	ldrh r2, [r3]
	mov r1, ip
	ands r1, r2
	lsrs r1, r1, #1
	mov r0, r8
	ands r1, r0
	adds r0, r7, #0
	ands r0, r2
	lsrs r0, r0, #1
	ands r0, r7
	adds r1, r1, r0
	adds r0, r6, #0
	ands r0, r2
	lsrs r0, r0, #1
	ands r0, r6
	adds r1, r1, r0
	strh r1, [r5]
	adds r5, #2
	adds r3, #2
	subs r4, #1
	cmp r4, #0
	bge _080A223A
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A2270: .4byte gUnknown_02022C28

	THUMB_FUNC_END sub_80A221C

	THUMB_FUNC_START sub_80A2274
sub_80A2274: @ 0x080A2274
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r4, _080A2418  @ gLCDControlBuffer
	ldrb r1, [r4]
	movs r0, #8
	negs r0, r0
	ands r0, r1
	strb r0, [r4]
	movs r0, #0
	bl SetupBackgrounds
	ldrb r2, [r4, #0xc]
	movs r1, #4
	negs r1, r1
	adds r0, r1, #0
	ands r0, r2
	movs r3, #1
	orrs r0, r3
	strb r0, [r4, #0xc]
	ldrb r0, [r4, #0x10]
	movs r2, #3
	orrs r0, r2
	strb r0, [r4, #0x10]
	ldrb r0, [r4, #0x14]
	ands r1, r0
	orrs r1, r3
	strb r1, [r4, #0x14]
	ldrb r0, [r4, #0x18]
	orrs r0, r2
	strb r0, [r4, #0x18]
	bl Font_InitForUIDefault
	bl ResetIconGraphics_
	bl LoadUiFrameGraphics
	bl LoadObjUIGfx
	bl SetupMapSpritesPalettes
	bl sub_80A221C
	movs r0, #0xd
	bl LoadIconPalettes
	adds r0, r5, #0
	bl NewGreenTextColorManager
	adds r0, r5, #0
	adds r0, #0x38
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _080A2340
	ldr r2, _080A241C  @ gRAMChapterData
	adds r2, #0x40
	ldrb r1, [r2]
	movs r0, #0x61
	negs r0, r0
	ands r0, r1
	movs r1, #0x20
	orrs r0, r1
	strb r0, [r2]
	adds r0, r5, #0
	bl sub_80AD47C
	movs r0, #0xc0
	lsls r0, r0, #3
	movs r1, #1
	bl sub_80AD4A0
	movs r0, #1
	bl sub_80AD594
	adds r1, r5, #0
	adds r1, #0x3a
	movs r0, #0xff
	strb r0, [r1]
	adds r0, r5, #0
	adds r0, #0x3b
	ldrb r0, [r0]
	cmp r0, #0
	beq _080A2340
	adds r0, r5, #0
	adds r0, #0x39
	ldrb r1, [r0]
	movs r0, #3
	ands r0, r1
	lsls r0, r0, #3
	adds r0, #0xc4
	lsrs r1, r1, #2
	movs r2, #7
	ands r1, r2
	lsls r1, r1, #4
	adds r1, #0x18
	movs r3, #0x80
	lsls r3, r3, #4
	movs r2, #1
	bl sub_80AD51C
_080A2340:
	movs r0, #0
	movs r1, #4
	movs r2, #0
	bl BG_SetPosition
	movs r0, #1
	movs r1, #4
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
	movs r4, #0
	str r4, [sp]
	movs r0, #0
	movs r1, #1
	movs r2, #0
	movs r3, #0
	bl sub_8001ED0
	str r4, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #1
	bl sub_8001F0C
	movs r0, #0
	bl sub_8001F48
	movs r0, #0
	bl sub_8001F64
	bl sub_8095A1C
	movs r0, #0x80
	lsls r0, r0, #7
	movs r1, #5
	bl sub_8098C3C
	ldr r0, _080A2420  @ gUnknown_08A1DC1C
	ldr r4, _080A2424  @ gUnknown_02020188
	adds r1, r4, #0
	bl CopyDataWithPossibleUncomp
	ldr r0, _080A2428  @ gBG1TilemapBuffer
	movs r2, #0x80
	lsls r2, r2, #5
	adds r1, r4, #0
	bl CallARM_FillTileRect
	ldr r4, _080A242C  @ gCharacterData
	ldr r0, [r5, #0x2c]
	bl sub_80A0B44
	subs r0, #1
	movs r1, #0x34
	muls r0, r1, r0
	adds r0, r0, r4
	ldrh r2, [r0, #6]
	ldr r1, _080A2430  @ gUnknown_02022CEC
	movs r3, #0x80
	lsls r3, r3, #2
	movs r0, #2
	str r0, [sp]
	adds r0, r5, #0
	bl sub_8005E98
	adds r0, r5, #0
	bl sub_80A20FC
	adds r0, r5, #0
	bl sub_80A1E7C
	ldr r0, _080A2434  @ gUnknown_08A1DD0C
	ldr r1, _080A2438  @ 0x06017800
	bl CopyDataWithPossibleUncomp
	ldr r0, _080A243C  @ gUnknown_08A1E0D8
	movs r1, #0xd0
	lsls r1, r1, #2
	movs r2, #0x20
	bl CopyToPaletteBuffer
	ldr r0, _080A2440  @ gUnknown_08A1D79C
	movs r1, #0x90
	lsls r1, r1, #2
	movs r2, #0x20
	bl CopyToPaletteBuffer
	ldr r0, _080A2444  @ sub_80A1B90
	adds r1, r5, #0
	bl Get6CDifferedLoop6C
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A2418: .4byte gLCDControlBuffer
_080A241C: .4byte gRAMChapterData
_080A2420: .4byte gUnknown_08A1DC1C
_080A2424: .4byte gUnknown_02020188
_080A2428: .4byte gBG1TilemapBuffer
_080A242C: .4byte gCharacterData
_080A2430: .4byte gUnknown_02022CEC
_080A2434: .4byte gUnknown_08A1DD0C
_080A2438: .4byte 0x06017800
_080A243C: .4byte gUnknown_08A1E0D8
_080A2440: .4byte gUnknown_08A1D79C
_080A2444: .4byte sub_80A1B90

	THUMB_FUNC_END sub_80A2274

	THUMB_FUNC_START sub_80A2448
sub_80A2448: @ 0x080A2448
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	ldr r0, _080A247C  @ gKeyStatusPtr
	ldr r1, [r0]
	ldrh r3, [r1, #8]
	movs r0, #2
	ands r0, r3
	cmp r0, #0
	beq _080A2484
	ldr r0, _080A2480  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A2470
	movs r0, #0x6b
	bl m4aSongNumStart
_080A2470:
	adds r0, r6, #0
	movs r1, #3
	bl Proc_Goto
	b _080A25EA
	.align 2, 0
_080A247C: .4byte gKeyStatusPtr
_080A2480: .4byte gRAMChapterData
_080A2484:
	ldrh r2, [r1, #6]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r2
	cmp r0, #0
	beq _080A249A
	adds r0, r6, #0
	movs r1, #4
	bl Proc_Goto
	b _080A25EA
_080A249A:
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r2
	cmp r0, #0
	beq _080A24AE
	adds r0, r6, #0
	movs r1, #5
	bl Proc_Goto
	b _080A25EA
_080A24AE:
	adds r0, r6, #0
	adds r0, #0x38
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _080A24BE
	b _080A25EA
_080A24BE:
	adds r0, r6, #0
	adds r0, #0x3b
	ldrb r0, [r0]
	cmp r0, #0
	bne _080A24CA
	b _080A25D0
_080A24CA:
	adds r1, r6, #0
	adds r1, #0x39
	ldrb r7, [r1]
	movs r0, #1
	ands r0, r3
	adds r5, r1, #0
	cmp r0, #0
	beq _080A24FC
	ldr r0, _080A24F8  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A24EC
	movs r0, #0x6a
	bl m4aSongNumStart
_080A24EC:
	adds r0, r6, #0
	movs r1, #2
	bl Proc_Goto
	b _080A25EA
	.align 2, 0
_080A24F8: .4byte gRAMChapterData
_080A24FC:
	movs r0, #0x20
	ands r0, r2
	cmp r0, #0
	beq _080A2516
	movs r1, #3
	ands r1, r7
	cmp r1, #0
	beq _080A2516
	movs r0, #0xfc
	ands r0, r7
	adds r0, #0xff
	adds r0, r0, r1
	strb r0, [r5]
_080A2516:
	ldr r0, _080A25C8  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _080A2550
	ldrb r1, [r5]
	movs r0, #3
	mov r8, r0
	mov r4, r8
	ands r4, r1
	ldr r0, [r6, #0x2c]
	lsrs r1, r1, #2
	movs r2, #7
	ands r1, r2
	bl sub_80A0AD4
	subs r0, #1
	cmp r4, r0
	bge _080A2550
	ldrb r0, [r5]
	movs r1, #0xfc
	ands r1, r0
	adds r1, #1
	mov r2, r8
	ands r2, r0
	adds r1, r1, r2
	strb r1, [r5]
_080A2550:
	ldr r4, _080A25C8  @ gKeyStatusPtr
	ldr r0, [r4]
	ldrh r1, [r0, #6]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _080A2572
	ldrb r1, [r5]
	lsrs r1, r1, #2
	movs r0, #7
	ands r1, r0
	subs r1, #1
	movs r2, #1
	negs r2, r2
	adds r0, r6, #0
	bl sub_80A2154
_080A2572:
	ldr r0, [r4]
	ldrh r1, [r0, #6]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _080A2590
	ldrb r1, [r5]
	lsrs r1, r1, #2
	movs r0, #7
	ands r1, r0
	adds r1, #1
	adds r0, r6, #0
	movs r2, #1
	bl sub_80A2154
_080A2590:
	ldrb r1, [r5]
	cmp r7, r1
	beq _080A25EA
	movs r0, #3
	ands r0, r1
	lsls r0, r0, #3
	adds r0, #0xc4
	lsrs r1, r1, #2
	movs r2, #7
	ands r1, r2
	lsls r1, r1, #4
	adds r1, #0x18
	movs r3, #0x80
	lsls r3, r3, #4
	movs r2, #1
	bl sub_80AD51C
	ldr r0, _080A25CC  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A25EA
	movs r0, #0x65
	bl m4aSongNumStart
	b _080A25EA
	.align 2, 0
_080A25C8: .4byte gKeyStatusPtr
_080A25CC: .4byte gRAMChapterData
_080A25D0:
	movs r0, #1
	ands r0, r3
	cmp r0, #0
	beq _080A25EA
	ldr r0, _080A25F4  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A25EA
	movs r0, #0x6c
	bl m4aSongNumStart
_080A25EA:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A25F4: .4byte gRAMChapterData

	THUMB_FUNC_END sub_80A2448

	THUMB_FUNC_START sub_80A25F8
sub_80A25F8: @ 0x080A25F8
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	movs r0, #0
	bl SetupBackgrounds
	ldr r3, _080A26A4  @ gLCDControlBuffer
	ldrb r2, [r3, #0xc]
	movs r1, #4
	negs r1, r1
	adds r0, r1, #0
	ands r0, r2
	strb r0, [r3, #0xc]
	ldrb r2, [r3, #0x10]
	adds r0, r1, #0
	ands r0, r2
	movs r2, #1
	orrs r0, r2
	strb r0, [r3, #0x10]
	ldrb r0, [r3, #0x14]
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	strb r1, [r3, #0x14]
	ldrb r0, [r3, #0x18]
	movs r1, #3
	orrs r0, r1
	strb r0, [r3, #0x18]
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
	bl sub_8001ED0
	movs r0, #0
	str r0, [sp]
	movs r1, #1
	movs r2, #0
	movs r3, #0
	bl sub_8001F0C
	bl ResetFaces
	bl Font_InitForUIDefault
	bl ResetIconGraphics_
	bl LoadLegacyUiFrameGraphics
	bl LoadObjUIGfx
	ldr r0, [r5, #0x2c]
	bl sub_80A0B44
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, [r5, #0x2c]
	adds r5, #0x39
	ldrb r1, [r5]
	lsrs r1, r1, #2
	movs r2, #7
	ands r1, r2
	bl sub_80A0B20
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldrb r0, [r5]
	movs r2, #3
	ands r2, r0
	adds r2, #1
	adds r0, r4, #0
	bl sub_8083764
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A26A4: .4byte gLCDControlBuffer

	THUMB_FUNC_END sub_80A25F8

	THUMB_FUNC_START sub_80A26A8
sub_80A26A8: @ 0x080A26A8
	push {r4, r5, lr}
	sub sp, #4
	adds r0, #0x3a
	movs r5, #0
	strb r5, [r0]
	bl sub_80AD564
	ldr r2, _080A2728  @ gLCDControlBuffer
	ldrb r1, [r2, #0xc]
	movs r3, #4
	negs r3, r3
	adds r0, r3, #0
	ands r0, r1
	movs r4, #1
	orrs r0, r4
	strb r0, [r2, #0xc]
	ldrb r0, [r2, #0x10]
	movs r1, #3
	orrs r0, r1
	strb r0, [r2, #0x10]
	ldrb r1, [r2, #0x14]
	adds r0, r3, #0
	ands r0, r1
	orrs r0, r4
	strb r0, [r2, #0x14]
	ldrb r0, [r2, #0x18]
	ands r3, r0
	strb r3, [r2, #0x18]
	movs r0, #1
	movs r1, #0
	movs r2, #0x10
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	str r5, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #1
	bl sub_8001ED0
	movs r0, #1
	str r0, [sp]
	movs r1, #1
	movs r2, #1
	movs r3, #0
	bl sub_8001F0C
	bl sub_80A1AE4
	ldr r0, _080A272C  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A271E
	movs r0, #0xc8
	bl m4aSongNumStart
_080A271E:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A2728: .4byte gLCDControlBuffer
_080A272C: .4byte gRAMChapterData

	THUMB_FUNC_END sub_80A26A8

	THUMB_FUNC_START sub_80A2730
sub_80A2730: @ 0x080A2730
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	str r0, [sp]
	movs r4, #0
	ldr r0, _080A27A0  @ gBG2TilemapBuffer
	mov sl, r0
_080A2744:
	ldr r2, [sp]
	adds r1, r4, r2
	cmp r1, #0x1d
	bhi _080A27B4
	adds r3, r4, #1
	mov r9, r3
	ldr r2, _080A27A4  @ gUnknown_020136F4
	lsls r1, r1, #1
	movs r3, #0x80
	lsls r3, r3, #5
	adds r0, r2, r3
	adds r0, r0, r1
	mov ip, r0
	adds r7, r1, r2
	adds r6, r1, #0
	lsls r0, r4, #1
	ldr r4, _080A27A8  @ gBG0TilemapBuffer
	adds r5, r0, r4
	adds r3, r0, #0
	ldr r0, _080A27AC  @ gBG1TilemapBuffer
	mov r8, r0
	movs r4, #0x13
_080A2770:
	ldrh r0, [r7]
	strh r0, [r5]
	mov r2, r8
	adds r1, r3, r2
	ldr r2, _080A27B0  @ gUnknown_02013EF4
	adds r0, r6, r2
	ldrh r0, [r0]
	strh r0, [r1]
	mov r0, sl
	adds r1, r3, r0
	mov r2, ip
	ldrh r0, [r2]
	strh r0, [r1]
	movs r0, #0x40
	add ip, r0
	adds r7, #0x40
	adds r6, #0x40
	adds r5, #0x40
	adds r3, #0x40
	subs r4, #1
	cmp r4, #0
	bge _080A2770
	b _080A27DC
	.align 2, 0
_080A27A0: .4byte gBG2TilemapBuffer
_080A27A4: .4byte gUnknown_020136F4
_080A27A8: .4byte gBG0TilemapBuffer
_080A27AC: .4byte gBG1TilemapBuffer
_080A27B0: .4byte gUnknown_02013EF4
_080A27B4:
	adds r1, r4, #1
	mov r9, r1
	movs r3, #0
	lsls r0, r4, #1
	mov r4, sl
	adds r2, r0, r4
	ldr r4, _080A27F8  @ gBG1TilemapBuffer
	adds r1, r0, r4
	ldr r4, _080A27FC  @ gBG0TilemapBuffer
	adds r0, r0, r4
	movs r4, #0x13
_080A27CA:
	strh r3, [r0]
	strh r3, [r1]
	strh r3, [r2]
	adds r2, #0x40
	adds r1, #0x40
	adds r0, #0x40
	subs r4, #1
	cmp r4, #0
	bge _080A27CA
_080A27DC:
	mov r4, r9
	cmp r4, #0x1d
	ble _080A2744
	movs r0, #7
	bl BG_EnableSyncByMask
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A27F8: .4byte gBG1TilemapBuffer
_080A27FC: .4byte gBG0TilemapBuffer

	THUMB_FUNC_END sub_80A2730

	THUMB_FUNC_START sub_80A2800
sub_80A2800: @ 0x080A2800
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r6, r7, #0
	adds r6, #0x3a
	ldrb r0, [r6]
	adds r0, #1
	strb r0, [r6]
	ldrb r0, [r6]
	movs r4, #0xa
	subs r4, r4, r0
	lsls r0, r4, #3
	muls r0, r4, r0
	movs r1, #0x64
	bl __divsi3
	movs r5, #8
	subs r5, r5, r0
	lsls r0, r4, #4
	muls r0, r4, r0
	movs r1, #0x64
	bl __divsi3
	movs r4, #0x10
	subs r4, r4, r0
	negs r0, r5
	lsls r0, r0, #3
	str r0, [r7, #0x30]
	adds r0, r5, #0
	bl sub_80A2730
	lsls r1, r4, #0x18
	lsrs r1, r1, #0x18
	movs r2, #0x10
	subs r2, r2, r4
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	movs r0, #1
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	ldrb r0, [r6]
	cmp r0, #0xa
	bne _080A2864
	adds r0, r7, #0
	bl Proc_Break
	ldr r0, [r7, #0x2c]
	bl sub_80A0AA0
	str r0, [r7, #0x2c]
_080A2864:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80A2800

	THUMB_FUNC_START sub_80A286C
sub_80A286C: @ 0x080A286C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	mov r7, r8
	adds r7, #0x3a
	ldrb r0, [r7]
	adds r0, #1
	strb r0, [r7]
	ldrb r0, [r7]
	movs r4, #0xa
	subs r4, r4, r0
	lsls r0, r4, #3
	muls r0, r4, r0
	movs r1, #0x64
	bl __divsi3
	adds r6, r0, #0
	movs r5, #8
	subs r6, r5, r6
	lsls r0, r4, #4
	muls r0, r4, r0
	movs r1, #0x64
	bl __divsi3
	movs r4, #0x10
	subs r4, r4, r0
	subs r5, r5, r6
	lsls r5, r5, #3
	mov r0, r8
	str r5, [r0, #0x30]
	subs r6, #8
	adds r0, r6, #0
	bl sub_80A2730
	movs r1, #0x10
	subs r1, r1, r4
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	movs r0, #1
	adds r2, r4, #0
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	ldrb r0, [r7]
	cmp r0, #0xa
	bne _080A28D4
	mov r0, r8
	bl Proc_Break
_080A28D4:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80A286C

	THUMB_FUNC_START sub_80A28E0
sub_80A28E0: @ 0x080A28E0
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r6, r7, #0
	adds r6, #0x3a
	ldrb r0, [r6]
	adds r0, #1
	strb r0, [r6]
	ldrb r0, [r6]
	movs r4, #0xa
	subs r4, r4, r0
	lsls r0, r4, #3
	muls r0, r4, r0
	movs r1, #0x64
	bl __divsi3
	movs r5, #8
	subs r5, r5, r0
	lsls r0, r4, #4
	muls r0, r4, r0
	movs r1, #0x64
	bl __divsi3
	movs r4, #0x10
	subs r4, r4, r0
	lsls r0, r5, #3
	str r0, [r7, #0x30]
	negs r5, r5
	adds r0, r5, #0
	bl sub_80A2730
	lsls r1, r4, #0x18
	lsrs r1, r1, #0x18
	movs r2, #0x10
	subs r2, r2, r4
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	movs r0, #1
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	ldrb r0, [r6]
	cmp r0, #0xa
	bne _080A2944
	adds r0, r7, #0
	bl Proc_Break
	ldr r0, [r7, #0x2c]
	bl sub_80A0AC0
	str r0, [r7, #0x2c]
_080A2944:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80A28E0

	THUMB_FUNC_START sub_80A294C
sub_80A294C: @ 0x080A294C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	mov r7, r8
	adds r7, #0x3a
	ldrb r0, [r7]
	adds r0, #1
	strb r0, [r7]
	ldrb r0, [r7]
	movs r4, #0xa
	subs r4, r4, r0
	lsls r0, r4, #3
	muls r0, r4, r0
	movs r1, #0x64
	bl __divsi3
	adds r5, r0, #0
	movs r6, #8
	subs r5, r6, r5
	lsls r0, r4, #4
	muls r0, r4, r0
	movs r1, #0x64
	bl __divsi3
	movs r4, #0x10
	subs r4, r4, r0
	adds r0, r5, #0
	subs r0, #8
	lsls r0, r0, #3
	mov r1, r8
	str r0, [r1, #0x30]
	subs r6, r6, r5
	adds r0, r6, #0
	bl sub_80A2730
	movs r1, #0x10
	subs r1, r1, r4
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	movs r0, #1
	adds r2, r4, #0
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	ldrb r0, [r7]
	cmp r0, #0xa
	bne _080A29B6
	mov r0, r8
	bl Proc_Break
_080A29B6:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80A294C

	THUMB_FUNC_START sub_80A29C0
sub_80A29C0: @ 0x080A29C0
	push {r4, r5, r6, lr}
	mov r6, r9
	mov r5, r8
	push {r5, r6}
	sub sp, #4
	adds r4, r0, #0
	bl ResetFaces
	bl Font_InitForUIDefault
	bl ResetIconGraphics_
	ldr r6, _080A2A94  @ gBG0TilemapBuffer
	adds r0, r6, #0
	movs r1, #0
	bl BG_Fill
	ldr r0, _080A2A98  @ gBG1TilemapBuffer
	mov r8, r0
	movs r1, #0
	bl BG_Fill
	ldr r0, _080A2A9C  @ gBG2TilemapBuffer
	movs r1, #0
	bl BG_Fill
	adds r2, r4, #0
	adds r2, #0x39
	ldrb r1, [r2]
	movs r0, #0xfc
	ands r0, r1
	movs r1, #0
	mov r9, r1
	movs r1, #0xe3
	ands r0, r1
	strb r0, [r2]
	ldr r0, [r4, #0x2c]
	bl sub_80A0B44
	bl sub_80A1B6C
	adds r1, r4, #0
	adds r1, #0x3c
	strb r0, [r1]
	adds r0, r4, #0
	bl sub_80A1F68
	adds r0, r4, #0
	bl sub_80A204C
	adds r0, r4, #0
	bl sub_80A207C
	adds r0, r4, #0
	movs r1, #0
	movs r2, #1
	bl sub_80A2154
	ldr r0, _080A2AA0  @ gUnknown_08A1DC1C
	ldr r5, _080A2AA4  @ gUnknown_02020188
	adds r1, r5, #0
	bl CopyDataWithPossibleUncomp
	movs r2, #0x80
	lsls r2, r2, #5
	mov r0, r8
	adds r1, r5, #0
	bl CallARM_FillTileRect
	ldr r5, _080A2AA8  @ gCharacterData
	ldr r0, [r4, #0x2c]
	bl sub_80A0B44
	subs r0, #1
	movs r1, #0x34
	muls r0, r1, r0
	adds r0, r0, r5
	ldrh r2, [r0, #6]
	adds r6, #0x44
	movs r3, #0x80
	lsls r3, r3, #2
	movs r0, #2
	str r0, [sp]
	adds r0, r4, #0
	adds r1, r6, #0
	bl sub_8005E98
	adds r0, r4, #0
	bl sub_80A20FC
	adds r0, r4, #0
	bl sub_80A1E7C
	bl sub_80A1AE4
	adds r4, #0x3a
	mov r0, r9
	strb r0, [r4]
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A2A94: .4byte gBG0TilemapBuffer
_080A2A98: .4byte gBG1TilemapBuffer
_080A2A9C: .4byte gBG2TilemapBuffer
_080A2AA0: .4byte gUnknown_08A1DC1C
_080A2AA4: .4byte gUnknown_02020188
_080A2AA8: .4byte gCharacterData

	THUMB_FUNC_END sub_80A29C0

	THUMB_FUNC_START sub_80A2AAC
sub_80A2AAC: @ 0x080A2AAC
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r2, _080A2B58  @ gLCDControlBuffer
	ldrb r3, [r2, #0xc]
	movs r1, #4
	negs r1, r1
	adds r0, r1, #0
	ands r0, r3
	movs r4, #1
	orrs r0, r4
	strb r0, [r2, #0xc]
	ldrb r0, [r2, #0x10]
	movs r3, #3
	orrs r0, r3
	strb r0, [r2, #0x10]
	ldrb r0, [r2, #0x14]
	ands r1, r0
	orrs r1, r4
	strb r1, [r2, #0x14]
	ldrb r0, [r2, #0x18]
	orrs r0, r3
	strb r0, [r2, #0x18]
	movs r0, #1
	movs r1, #0
	movs r2, #0xc
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	movs r0, #0
	str r0, [sp]
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl sub_8001ED0
	movs r0, #1
	str r0, [sp]
	movs r1, #1
	movs r2, #1
	movs r3, #1
	bl sub_8001F0C
	movs r0, #0
	bl sub_8001F48
	movs r0, #0
	bl sub_8001F64
	adds r0, r5, #0
	adds r0, #0x38
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _080A2B50
	adds r0, r5, #0
	adds r0, #0x3b
	ldrb r0, [r0]
	cmp r0, #0
	beq _080A2B50
	adds r0, r5, #0
	adds r0, #0x39
	ldrb r1, [r0]
	movs r0, #3
	ands r0, r1
	lsls r0, r0, #3
	adds r0, #0xc4
	lsrs r1, r1, #2
	movs r2, #7
	ands r1, r2
	lsls r1, r1, #4
	adds r1, #0x18
	movs r3, #0x80
	lsls r3, r3, #4
	movs r2, #1
	bl sub_80AD51C
	adds r1, r5, #0
	adds r1, #0x3a
	movs r0, #0xff
	strb r0, [r1]
_080A2B50:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A2B58: .4byte gLCDControlBuffer

	THUMB_FUNC_END sub_80A2AAC

	THUMB_FUNC_START sub_80A2B5C
sub_80A2B5C: @ 0x080A2B5C
	push {r4, lr}
	adds r4, r0, #0
	bl sub_80ADDD4
	bl EndBG3Slider_
	movs r0, #0
	bl DeleteFaceByIndex
	ldr r0, [r4, #0x2c]
	bl sub_80A1A90
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80A2B5C

	THUMB_FUNC_START sub_80A2B7C
sub_80A2B7C: @ 0x080A2B7C
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, [r4, #0x2c]
	adds r1, r4, #0
	adds r1, #0x39
	ldrb r3, [r1]
	lsrs r1, r3, #2
	movs r2, #7
	ands r1, r2
	movs r2, #3
	ands r2, r3
	adds r2, #1
	bl sub_80A1AAC
	adds r4, #0x3e
	movs r3, #0
	strb r0, [r4]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080A2BB8
	movs r1, #0x80
	lsls r1, r1, #1
	str r3, [sp]
	movs r0, #9
	movs r2, #0x80
	movs r3, #0x10
	bl sub_80029E8
	b _080A2BC8
_080A2BB8:
	ldrb r0, [r4]
	movs r2, #0x80
	lsls r2, r2, #1
	str r3, [sp]
	adds r1, r2, #0
	movs r3, #0x10
	bl sub_80029E8
_080A2BC8:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80A2B7C

	THUMB_FUNC_START sub_80A2BD0
sub_80A2BD0: @ 0x080A2BD0
	push {lr}
	sub sp, #4
	adds r0, #0x3e
	ldrb r0, [r0]
	cmp r0, #0
	bne _080A2BEE
	movs r2, #0x80
	lsls r2, r2, #1
	str r0, [sp]
	movs r0, #9
	movs r1, #0x80
	movs r3, #0x10
	bl sub_80029E8
	b _080A2C00
_080A2BEE:
	movs r2, #0x80
	lsls r2, r2, #1
	movs r0, #0
	str r0, [sp]
	movs r0, #9
	adds r1, r2, #0
	movs r3, #0x10
	bl sub_80029E8
_080A2C00:
	add sp, #4
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80A2BD0

	THUMB_FUNC_START sub_80A2C08
sub_80A2C08: @ 0x080A2C08
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r1, r2, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _080A2C28  @ gUnknown_08A19880
	bl Proc_StartBlocking
	adds r1, r0, #0
	adds r1, #0x38
	strb r4, [r1]
	str r5, [r0, #0x2c]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A2C28: .4byte gUnknown_08A19880

	THUMB_FUNC_END sub_80A2C08

	THUMB_FUNC_START sub_80A2C2C
sub_80A2C2C: @ 0x080A2C2C
	ldr r0, _080A2C34  @ gUnknown_0203E884
	movs r1, #0
	strb r1, [r0]
	bx lr
	.align 2, 0
_080A2C34: .4byte gUnknown_0203E884

	THUMB_FUNC_END sub_80A2C2C

	THUMB_FUNC_START sub_80A2C38
sub_80A2C38: @ 0x080A2C38
	bx lr

	THUMB_FUNC_END sub_80A2C38

	THUMB_FUNC_START sub_80A2C3C
sub_80A2C3C: @ 0x080A2C3C
	push {r4, r5, lr}
	sub sp, #8
	ldr r0, _080A2C94  @ 0x12345678
	str r0, [sp]
	ldr r0, _080A2C98  @ 0x87654321
	str r0, [sp, #4]
	bl SetSramFastFunc
	ldr r2, _080A2C9C  @ 0x04000200
	ldrh r0, [r2]
	movs r3, #0x80
	lsls r3, r3, #6
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2]
	ldr r5, _080A2CA0  @ gUnknown_08A1FAF4
	ldr r1, [r5]
	ldr r4, _080A2CA4  @ 0x000073A0
	adds r1, r1, r4
	mov r0, sp
	movs r2, #4
	bl WriteSramFast
	ldr r2, _080A2CA8  @ ReadSramFast
	ldr r0, [r5]
	adds r0, r0, r4
	add r1, sp, #4
	ldr r3, [r2]
	movs r2, #4
	bl _call_via_r3
	ldr r3, _080A2CAC  @ gUnknown_0203E88E
	movs r2, #0
	ldr r1, [sp, #4]
	ldr r0, [sp]
	cmp r1, r0
	bne _080A2C88
	movs r2, #1
_080A2C88:
	strb r2, [r3]
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A2C94: .4byte 0x12345678
_080A2C98: .4byte 0x87654321
_080A2C9C: .4byte 0x04000200
_080A2CA0: .4byte gUnknown_08A1FAF4
_080A2CA4: .4byte 0x000073A0
_080A2CA8: .4byte ReadSramFast
_080A2CAC: .4byte gUnknown_0203E88E

	THUMB_FUNC_END sub_80A2C3C

	THUMB_FUNC_START sub_80A2CB0
sub_80A2CB0: @ 0x080A2CB0
	ldr r0, _080A2CBC  @ gUnknown_0203E88E
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bx lr
	.align 2, 0
_080A2CBC: .4byte gUnknown_0203E88E

	THUMB_FUNC_END sub_80A2CB0

	THUMB_FUNC_START sub_80A2CC0
sub_80A2CC0: @ 0x080A2CC0
	push {r4, r5, r6, lr}
	sub sp, #0x40
	movs r1, #1
	negs r1, r1
	add r0, sp, #0x3c
_080A2CCA:
	str r1, [r0]
	subs r0, #4
	cmp r0, sp
	bge _080A2CCA
	movs r4, #0
	ldr r6, _080A2CF4  @ gUnknown_08A1FAF4
	ldr r5, _080A2CF8  @ 0x000001FF
_080A2CD8:
	lsls r0, r4, #6
	ldr r1, [r6]
	adds r1, r1, r0
	mov r0, sp
	movs r2, #0x40
	bl WriteAndVerifySramFast
	adds r4, #1
	cmp r4, r5
	ble _080A2CD8
	add sp, #0x40
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A2CF4: .4byte gUnknown_08A1FAF4
_080A2CF8: .4byte 0x000001FF

	THUMB_FUNC_END sub_80A2CC0

	THUMB_FUNC_START sub_80A2CFC
sub_80A2CFC: @ 0x080A2CFC
	push {r4, lr}
	adds r2, r0, #0
	movs r3, #0
	movs r4, #0
	lsrs r0, r1, #0x1f
	adds r1, r1, r0
	asrs r1, r1, #1
	cmp r3, r1
	bge _080A2D1C
_080A2D0E:
	ldrh r0, [r2]
	adds r3, r3, r0
	eors r4, r0
	adds r2, #2
	subs r1, #1
	cmp r1, #0
	bne _080A2D0E
_080A2D1C:
	adds r0, r3, r4
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80A2CFC

	THUMB_FUNC_START LoadSomeUnitStatThingUnlockIdk
LoadSomeUnitStatThingUnlockIdk: @ 0x080A2D28
	push {r4, r5, lr}
	sub sp, #0x64
	adds r5, r0, #0
	bl sub_80A2CB0
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A2D9C
	cmp r5, #0
	bne _080A2D3E
	mov r5, sp
_080A2D3E:
	ldr r1, _080A2D88  @ ReadSramFast
	ldr r0, _080A2D8C  @ gUnknown_08A1FAF4
	ldr r0, [r0]
	ldr r3, [r1]
	adds r1, r5, #0
	movs r2, #0x64
	bl _call_via_r3
	ldr r1, _080A2D90  @ gUnknown_08205C9C
	adds r0, r5, #0
	bl sub_8012E98
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A2D9C
	ldr r1, [r5, #8]
	ldr r0, _080A2D94  @ 0x00040624
	cmp r1, r0
	bne _080A2D9C
	ldrh r1, [r5, #0xc]
	ldr r0, _080A2D98  @ 0x0000200A
	cmp r1, r0
	bne _080A2D9C
	adds r4, r5, #0
	adds r4, #0x60
	adds r0, r5, #0
	movs r1, #0x50
	bl sub_80A2CFC
	ldrh r1, [r4]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r1, r0
	bne _080A2D9C
	movs r0, #1
	b _080A2D9E
	.align 2, 0
_080A2D88: .4byte ReadSramFast
_080A2D8C: .4byte gUnknown_08A1FAF4
_080A2D90: .4byte gUnknown_08205C9C
_080A2D94: .4byte 0x00040624
_080A2D98: .4byte 0x0000200A
_080A2D9C:
	movs r0, #0
_080A2D9E:
	add sp, #0x64
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END LoadSomeUnitStatThingUnlockIdk

	THUMB_FUNC_START SaveSomeUnitStatThingUnlockIdk
SaveSomeUnitStatThingUnlockIdk: @ 0x080A2DA8
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0x50
	bl sub_80A2CFC
	adds r1, r4, #0
	adds r1, #0x60
	strh r0, [r1]
	ldr r0, _080A2DCC  @ gUnknown_08A1FAF4
	ldr r1, [r0]
	adds r0, r4, #0
	movs r2, #0x64
	bl WriteAndVerifySramFast
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A2DCC: .4byte gUnknown_08A1FAF4

	THUMB_FUNC_END SaveSomeUnitStatThingUnlockIdk

	THUMB_FUNC_START sub_80A2DD0
sub_80A2DD0: @ 0x080A2DD0
	push {lr}
	ldr r1, _080A2DE0  @ gUnknown_08A1FAF4
	ldr r1, [r1]
	movs r2, #0x64
	bl WriteAndVerifySramFast
	pop {r0}
	bx r0
	.align 2, 0
_080A2DE0: .4byte gUnknown_08A1FAF4

	THUMB_FUNC_END sub_80A2DD0

	THUMB_FUNC_START sub_80A2DE4
sub_80A2DE4: @ 0x080A2DE4
	push {r4, r5, lr}
	sub sp, #0x64
	bl sub_80A2CC0
	ldr r1, _080A2E9C  @ gUnknown_08205C9C
	mov r0, sp
	bl CopyString
	ldr r0, _080A2EA0  @ 0x00040624
	str r0, [sp, #8]
	mov r1, sp
	movs r4, #0
	movs r5, #0
	ldr r0, _080A2EA4  @ 0x0000200A
	strh r0, [r1, #0xc]
	mov r2, sp
	ldrb r1, [r2, #0xe]
	movs r3, #2
	negs r3, r3
	adds r0, r3, #0
	ands r0, r1
	strb r0, [r2, #0xe]
	movs r1, #3
	negs r1, r1
	ands r1, r0
	strb r1, [r2, #0xe]
	movs r0, #5
	negs r0, r0
	ands r0, r1
	strb r0, [r2, #0xe]
	movs r1, #9
	negs r1, r1
	ands r1, r0
	strb r1, [r2, #0xe]
	movs r0, #0x11
	negs r0, r0
	ands r0, r1
	strb r0, [r2, #0xe]
	movs r1, #0x21
	negs r1, r1
	ands r1, r0
	strb r1, [r2, #0xe]
	movs r0, #0x41
	negs r0, r0
	ands r0, r1
	strb r0, [r2, #0xe]
	mov r1, sp
	movs r0, #0
	strb r0, [r1, #0xe]
	ldrb r0, [r1, #0xf]
	ands r3, r0
	strb r3, [r1, #0xf]
	mov r0, sp
	strb r4, [r0, #0xf]
	strh r5, [r0, #0x10]
	strh r5, [r0, #0x12]
	adds r0, #0x63
	strb r4, [r0]
	subs r0, #1
	strb r4, [r0]
	add r3, sp, #0x20
	add r4, sp, #0x40
	add r1, sp, #0x14
	movs r2, #0
	subs r0, #0x43
_080A2E66:
	strb r2, [r0]
	subs r0, #1
	cmp r0, r1
	bge _080A2E66
	adds r1, r3, #0
	movs r2, #0
	adds r0, r1, #0
	adds r0, #0x1f
_080A2E76:
	strb r2, [r0]
	subs r0, #1
	cmp r0, r1
	bge _080A2E76
	adds r1, r4, #0
	movs r2, #0
	adds r0, r1, #0
	adds r0, #0x1f
_080A2E86:
	strb r2, [r0]
	subs r0, #1
	cmp r0, r1
	bge _080A2E86
	mov r0, sp
	bl SaveSomeUnitStatThingUnlockIdk
	add sp, #0x64
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A2E9C: .4byte gUnknown_08205C9C
_080A2EA0: .4byte 0x00040624
_080A2EA4: .4byte 0x0000200A

	THUMB_FUNC_END sub_80A2DE4

	THUMB_FUNC_START sub_80A2EA8
sub_80A2EA8: @ 0x080A2EA8
	push {r4, lr}
	sub sp, #4
	ldr r4, _080A2ECC  @ gUnknown_02020188
	mov r1, sp
	movs r0, #0
	strh r0, [r1]
	ldr r2, _080A2ED0  @ 0x010000A2
	mov r0, sp
	adds r1, r4, #0
	bl CpuSet
	adds r0, r4, #0
	bl sub_80A3950
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A2ECC: .4byte gUnknown_02020188
_080A2ED0: .4byte 0x010000A2

	THUMB_FUNC_END sub_80A2EA8

	THUMB_FUNC_START GetSaveDataOffsetPointer
GetSaveDataOffsetPointer: @ 0x080A2ED4
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r1, _080A2EE4  @ gUnknown_08A1FAF4
	ldr r1, [r1]
	adds r1, r1, r0
	adds r0, r1, #0
	bx lr
	.align 2, 0
_080A2EE4: .4byte gUnknown_08A1FAF4

	THUMB_FUNC_END GetSaveDataOffsetPointer

	THUMB_FUNC_START sub_80A2EE8
sub_80A2EE8: @ 0x080A2EE8
	ldr r1, _080A2EF4  @ gUnknown_08A1FAF4
	ldr r1, [r1]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bx lr
	.align 2, 0
_080A2EF4: .4byte gUnknown_08A1FAF4

	THUMB_FUNC_END sub_80A2EE8

	THUMB_FUNC_START sub_80A2EF8
sub_80A2EF8: @ 0x080A2EF8
	push {r4, r5, lr}
	sub sp, #0x10
	adds r4, r0, #0
	adds r5, r1, #0
	cmp r4, #0
	bne _080A2F06
	mov r4, sp
_080A2F06:
	ldr r2, _080A2F34  @ ReadSramFast
	ldr r0, _080A2F38  @ gUnknown_08A1FAF4
	lsls r1, r5, #4
	adds r1, #0x64
	ldr r0, [r0]
	adds r0, r0, r1
	ldr r3, [r2]
	adds r1, r4, #0
	movs r2, #0x10
	bl _call_via_r3
	ldrh r1, [r4, #4]
	ldr r0, _080A2F3C  @ 0x0000200A
	cmp r1, r0
	bne _080A2F88
	cmp r5, #6
	bhi _080A2F88
	lsls r0, r5, #2
	ldr r1, _080A2F40  @ _080A2F44
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080A2F34: .4byte ReadSramFast
_080A2F38: .4byte gUnknown_08A1FAF4
_080A2F3C: .4byte 0x0000200A
_080A2F40: .4byte _080A2F44
_080A2F44: @ jump table
	.4byte _080A2F60 @ case 0
	.4byte _080A2F60 @ case 1
	.4byte _080A2F60 @ case 2
	.4byte _080A2F60 @ case 3
	.4byte _080A2F60 @ case 4
	.4byte _080A2F68 @ case 5
	.4byte _080A2F70 @ case 6
_080A2F60:
	ldr r1, _080A2F64  @ 0x00040624
	b _080A2F72
	.align 2, 0
_080A2F64: .4byte 0x00040624
_080A2F68:
	ldr r1, _080A2F6C  @ 0x00020112
	b _080A2F72
	.align 2, 0
_080A2F6C: .4byte 0x00020112
_080A2F70:
	ldr r1, _080A2F84  @ 0x00020223
_080A2F72:
	ldr r0, [r4]
	cmp r0, r1
	bne _080A2F88
	adds r0, r4, #0
	bl sub_80A6430
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	b _080A2F8A
	.align 2, 0
_080A2F84: .4byte 0x00020223
_080A2F88:
	movs r0, #0
_080A2F8A:
	add sp, #0x10
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80A2EF8

	THUMB_FUNC_START sub_80A2F94
sub_80A2F94: @ 0x080A2F94
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r6, r1, #0
	movs r7, #0
	movs r5, #0
	ldr r0, _080A2FC4  @ 0x0000200A
	strh r0, [r4, #4]
	adds r0, r6, #0
	bl GetSaveDataLocation
	strh r0, [r4, #8]
	cmp r6, #6
	bgt _080A301A
	ldrb r0, [r4, #6]
	cmp r0, #2
	beq _080A2FE8
	cmp r0, #2
	bgt _080A2FC8
	cmp r0, #0
	beq _080A2FD2
	cmp r0, #1
	beq _080A2FDC
	b _080A301A
	.align 2, 0
_080A2FC4: .4byte 0x0000200A
_080A2FC8:
	cmp r0, #3
	beq _080A2FF4
	cmp r0, #0xff
	beq _080A2FFC
	b _080A301A
_080A2FD2:
	ldr r0, _080A2FD8  @ 0x00000DC8
	strh r0, [r4, #0xa]
	b _080A3002
	.align 2, 0
_080A2FD8: .4byte 0x00000DC8
_080A2FDC:
	ldr r0, _080A2FE4  @ 0x00001F78
	strh r0, [r4, #0xa]
	b _080A3002
	.align 2, 0
_080A2FE4: .4byte 0x00001F78
_080A2FE8:
	ldr r0, _080A2FF0  @ 0x00000874
	strh r0, [r4, #0xa]
	b _080A3002
	.align 2, 0
_080A2FF0: .4byte 0x00000874
_080A2FF4:
	movs r0, #0xc0
	lsls r0, r0, #4
	strh r0, [r4, #0xa]
	b _080A3002
_080A2FFC:
	strh r5, [r4, #0xa]
	strh r5, [r4, #8]
	strh r5, [r4, #4]
_080A3002:
	adds r0, r4, #0
	bl sub_80A6454
	ldr r0, _080A3020  @ gUnknown_08A1FAF4
	lsls r2, r6, #4
	adds r2, #0x64
	ldr r1, [r0]
	adds r1, r1, r2
	adds r0, r4, #0
	movs r2, #0x10
	bl WriteAndVerifySramFast
_080A301A:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A3020: .4byte gUnknown_08A1FAF4

	THUMB_FUNC_END sub_80A2F94

	THUMB_FUNC_START sub_80A3024
sub_80A3024: @ 0x080A3024
	push {r4, lr}
	sub sp, #0x14
	adds r4, r0, #0
	cmp r4, #6
	bgt _080A3050
	add r0, sp, #0x10
	ldr r2, _080A3058  @ 0x0000FFFF
	adds r1, r2, #0
	strh r1, [r0]
	ldr r2, _080A305C  @ 0x01000008
	mov r1, sp
	bl CpuSet
	ldr r1, _080A3060  @ gUnknown_08A1FAF4
	lsls r0, r4, #4
	adds r0, #0x64
	ldr r1, [r1]
	adds r1, r1, r0
	mov r0, sp
	movs r2, #0x10
	bl WriteAndVerifySramFast
_080A3050:
	add sp, #0x14
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A3058: .4byte 0x0000FFFF
_080A305C: .4byte 0x01000008
_080A3060: .4byte gUnknown_08A1FAF4

	THUMB_FUNC_END sub_80A3024

	THUMB_FUNC_START GetSaveDataLocation
GetSaveDataLocation: @ 0x080A3064
	push {lr}
	cmp r0, #6
	bhi _080A310C
	lsls r0, r0, #2
	ldr r1, _080A3074  @ _080A3078
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080A3074: .4byte _080A3078
_080A3078: @ jump table
	.4byte _080A3094 @ case 0
	.4byte _080A30A8 @ case 1
	.4byte _080A30BC @ case 2
	.4byte _080A30D0 @ case 3
	.4byte _080A30DC @ case 4
	.4byte _080A30F0 @ case 5
	.4byte _080A3104 @ case 6
_080A3094:
	ldr r0, _080A30A0  @ gUnknown_08A1FAF4
	ldr r0, [r0]
	ldr r1, _080A30A4  @ 0x00003FC4
	adds r0, r0, r1
	b _080A310E
	.align 2, 0
_080A30A0: .4byte gUnknown_08A1FAF4
_080A30A4: .4byte 0x00003FC4
_080A30A8:
	ldr r0, _080A30B4  @ gUnknown_08A1FAF4
	ldr r0, [r0]
	ldr r1, _080A30B8  @ 0x00004D8C
	adds r0, r0, r1
	b _080A310E
	.align 2, 0
_080A30B4: .4byte gUnknown_08A1FAF4
_080A30B8: .4byte 0x00004D8C
_080A30BC:
	ldr r0, _080A30C8  @ gUnknown_08A1FAF4
	ldr r0, [r0]
	ldr r1, _080A30CC  @ 0x00005B54
	adds r0, r0, r1
	b _080A310E
	.align 2, 0
_080A30C8: .4byte gUnknown_08A1FAF4
_080A30CC: .4byte 0x00005B54
_080A30D0:
	ldr r0, _080A30D8  @ gUnknown_08A1FAF4
	ldr r0, [r0]
	adds r0, #0xd4
	b _080A310E
	.align 2, 0
_080A30D8: .4byte gUnknown_08A1FAF4
_080A30DC:
	ldr r0, _080A30E8  @ gUnknown_08A1FAF4
	ldr r0, [r0]
	ldr r1, _080A30EC  @ 0x0000204C
	adds r0, r0, r1
	b _080A310E
	.align 2, 0
_080A30E8: .4byte gUnknown_08A1FAF4
_080A30EC: .4byte 0x0000204C
_080A30F0:
	ldr r0, _080A30FC  @ gUnknown_08A1FAF4
	ldr r0, [r0]
	ldr r1, _080A3100  @ 0x0000691C
	adds r0, r0, r1
	b _080A310E
	.align 2, 0
_080A30FC: .4byte gUnknown_08A1FAF4
_080A3100: .4byte 0x0000691C
_080A3104:
	ldr r0, _080A3108  @ 0x0E007400
	b _080A310E
	.align 2, 0
_080A3108: .4byte 0x0E007400
_080A310C:
	movs r0, #0
_080A310E:
	pop {r1}
	bx r1

	THUMB_FUNC_END GetSaveDataLocation

	THUMB_FUNC_START sub_80A3114
sub_80A3114: @ 0x080A3114
	push {lr}
	sub sp, #0x10
	adds r1, r0, #0
	mov r0, sp
	bl sub_80A2EF8
	mov r0, sp
	ldrh r0, [r0, #8]
	bl GetSaveDataOffsetPointer
	add sp, #0x10
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80A3114

	THUMB_FUNC_START SaveLocalEventIndexes
SaveLocalEventIndexes: @ 0x080A3130
	push {r4, r5, lr}
	adds r4, r0, #0
	bl GetLocalEventIdStorage
	adds r5, r0, #0
	bl GetLocalEventIdStorageSize
	adds r2, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	bl WriteAndVerifySramFast
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END SaveLocalEventIndexes

	THUMB_FUNC_START SaveGlobalEventIndexes
SaveGlobalEventIndexes: @ 0x080A3150
	push {r4, r5, lr}
	adds r4, r0, #0
	bl GetGlobalEventIdStorage
	adds r5, r0, #0
	bl GetGlobalEventIdStorageSize
	adds r2, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	bl WriteAndVerifySramFast
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END SaveGlobalEventIndexes

	THUMB_FUNC_START LoadLocalEventIds
LoadLocalEventIds: @ 0x080A3170
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r4, _080A3194  @ ReadSramFast
	bl GetLocalEventIdStorage
	adds r5, r0, #0
	bl GetLocalEventIdStorageSize
	adds r2, r0, #0
	ldr r3, [r4]
	adds r0, r6, #0
	adds r1, r5, #0
	bl _call_via_r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A3194: .4byte ReadSramFast

	THUMB_FUNC_END LoadLocalEventIds

	THUMB_FUNC_START LoadGlobalEventIds
LoadGlobalEventIds: @ 0x080A3198
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r4, _080A31BC  @ ReadSramFast
	bl GetGlobalEventIdStorage
	adds r5, r0, #0
	bl GetGlobalEventIdStorageSize
	adds r2, r0, #0
	ldr r3, [r4]
	adds r0, r6, #0
	adds r1, r5, #0
	bl _call_via_r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A31BC: .4byte ReadSramFast

	THUMB_FUNC_END LoadGlobalEventIds

	THUMB_FUNC_START sub_80A31C0
sub_80A31C0: @ 0x080A31C0
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	ldr r4, _080A31E0  @ ReadSramFast
	bl GetGlobalEventIdStorageSize
	adds r2, r0, #0
	ldr r3, [r4]
	adds r0, r5, #0
	adds r1, r6, #0
	bl _call_via_r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A31E0: .4byte ReadSramFast

	THUMB_FUNC_END sub_80A31C0

	THUMB_FUNC_START SaveConvoyItems
SaveConvoyItems: @ 0x080A31E4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0xb0
	mov r8, r0
	bl GetConvoyItemArray
	adds r6, r0, #0
	add r5, sp, #0x64
	movs r0, #0
	mov ip, r0
	movs r7, #0
_080A31FC:
	mov r0, sp
	adds r1, r0, r7
	ldrh r0, [r6]
	strb r0, [r1]
	ldrh r0, [r6]
	lsrs r4, r0, #8
	movs r0, #0x3f
	ands r4, r0
	movs r3, #7
	mov r0, ip
	ands r3, r0
	ldr r0, _080A3264  @ gUnknown_08205CA4
	adds r0, r3, r0
	ldrb r2, [r5]
	ldrb r1, [r0]
	ands r1, r2
	adds r0, r4, #0
	lsls r0, r3
	orrs r1, r0
	strb r1, [r5]
	cmp r3, #1
	ble _080A3242
	adds r5, #1
	cmp r3, #2
	ble _080A3242
	ldr r0, _080A3268  @ gUnknown_08205CAC
	adds r0, r3, r0
	ldrb r2, [r5]
	ldrb r1, [r0]
	ands r1, r2
	movs r0, #8
	subs r0, r0, r3
	asrs r4, r0
	orrs r1, r4
	strb r1, [r5]
_080A3242:
	movs r0, #6
	add ip, r0
	adds r6, #2
	adds r7, #1
	cmp r7, #0x63
	ble _080A31FC
	mov r0, sp
	mov r1, r8
	movs r2, #0xb0
	bl WriteAndVerifySramFast
	add sp, #0xb0
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A3264: .4byte gUnknown_08205CA4
_080A3268: .4byte gUnknown_08205CAC

	THUMB_FUNC_END SaveConvoyItems

	THUMB_FUNC_START LoadConvoyItems
LoadConvoyItems: @ 0x080A326C
	push {r4, r5, r6, r7, lr}
	sub sp, #0xb0
	ldr r1, _080A32E0  @ ReadSramFast
	ldr r3, [r1]
	mov r1, sp
	movs r2, #0xb0
	bl _call_via_r3
	bl GetConvoyItemArray
	adds r4, r0, #0
	add r5, sp, #0x64
	movs r7, #0
	movs r6, #0
_080A3288:
	mov r1, sp
	adds r0, r1, r6
	ldrb r0, [r0]
	strh r0, [r4]
	movs r3, #7
	ands r3, r7
	ldrb r1, [r5]
	ldr r0, _080A32E4  @ gUnknown_08205CA4
	adds r0, r3, r0
	ldrb r0, [r0]
	bics r1, r0
	asrs r1, r3
	lsls r1, r1, #0x18
	lsrs r2, r1, #0x18
	cmp r3, #1
	ble _080A32C4
	adds r5, #1
	cmp r3, #2
	ble _080A32C4
	ldrb r1, [r5]
	ldr r0, _080A32E8  @ gUnknown_08205CAC
	adds r0, r3, r0
	ldrb r0, [r0]
	bics r1, r0
	movs r0, #8
	subs r0, r0, r3
	lsls r1, r0
	orrs r2, r1
	lsls r0, r2, #0x18
	lsrs r2, r0, #0x18
_080A32C4:
	lsls r0, r2, #8
	ldrh r1, [r4]
	orrs r0, r1
	strh r0, [r4]
	adds r7, #6
	adds r4, #2
	adds r6, #1
	cmp r6, #0x63
	ble _080A3288
	add sp, #0xb0
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A32E0: .4byte ReadSramFast
_080A32E4: .4byte gUnknown_08205CA4
_080A32E8: .4byte gUnknown_08205CAC

	THUMB_FUNC_END LoadConvoyItems

	THUMB_FUNC_START sub_80A32EC
sub_80A32EC: @ 0x080A32EC
	movs r0, #1
	bx lr

	THUMB_FUNC_END sub_80A32EC

	THUMB_FUNC_START sub_80A32F0
sub_80A32F0: @ 0x080A32F0
	push {r4, lr}
	bl sub_80A2CB0
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080A3304
	movs r0, #0
	b _080A3320
_080A3300:
	movs r0, #1
	b _080A3320
_080A3304:
	movs r4, #0
_080A3306:
	adds r0, r4, #0
	bl sub_80A52DC
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080A3300
	adds r4, #1
	cmp r4, #2
	ble _080A3306
	bl sub_80A6A68
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
_080A3320:
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80A32F0

	THUMB_FUNC_START sub_80A3328
sub_80A3328: @ 0x080A3328
	movs r0, #1
	bx lr

	THUMB_FUNC_END sub_80A3328

	THUMB_FUNC_START sub_80A332C
sub_80A332C: @ 0x080A332C
	push {r4, lr}
	movs r0, #0
	bl sub_80A3834
	adds r4, r0, #0
	bl sub_80A3870
	ands r0, r4
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80A332C

	THUMB_FUNC_START sub_80A3348
sub_80A3348: @ 0x080A3348
	push {r4, lr}
	sub sp, #0x94
	movs r4, #0
	bl sub_80A3870
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080A335C
	movs r0, #0
	b _080A33BC
_080A335C:
	mov r0, sp
	bl sub_80A3898
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A33BA
	mov r0, sp
	ldrb r0, [r0]
	lsls r0, r0, #0x1f
	cmp r0, #0
	beq _080A3374
	movs r4, #1
_080A3374:
	mov r0, sp
	ldrb r0, [r0, #0x18]
	lsls r0, r0, #0x1f
	cmp r0, #0
	beq _080A3382
	movs r0, #2
	orrs r4, r0
_080A3382:
	add r0, sp, #0x30
	ldrb r0, [r0]
	lsls r0, r0, #0x1f
	cmp r0, #0
	beq _080A3390
	movs r0, #4
	orrs r4, r0
_080A3390:
	add r0, sp, #0x48
	ldrb r0, [r0]
	lsls r0, r0, #0x1f
	cmp r0, #0
	beq _080A339E
	movs r0, #8
	orrs r4, r0
_080A339E:
	add r0, sp, #0x60
	ldrb r0, [r0]
	lsls r0, r0, #0x1f
	cmp r0, #0
	beq _080A33AC
	movs r0, #0x10
	orrs r4, r0
_080A33AC:
	add r0, sp, #0x78
	ldrb r0, [r0]
	lsls r0, r0, #0x1f
	cmp r0, #0
	beq _080A33BA
	movs r0, #0x20
	orrs r4, r0
_080A33BA:
	adds r0, r4, #0
_080A33BC:
	add sp, #0x94
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80A3348

	THUMB_FUNC_START sub_80A33C4
sub_80A33C4: @ 0x080A33C4
	push {lr}
	sub sp, #0x64
	mov r0, sp
	bl LoadSomeUnitStatThingUnlockIdk
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A33E2
	bl sub_80A6C1C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A33E2
	movs r0, #1
	b _080A33E4
_080A33E2:
	movs r0, #0
_080A33E4:
	add sp, #0x64
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80A33C4

	THUMB_FUNC_START sub_80A33EC
sub_80A33EC: @ 0x080A33EC
	push {r4, lr}
	bl sub_80A2CB0
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080A33FE
	b _080A3412
_080A33FA:
	movs r0, #1
	b _080A3414
_080A33FE:
	movs r4, #0
_080A3400:
	adds r0, r4, #0
	bl sub_80A530C
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080A33FA
	adds r4, #1
	cmp r4, #2
	ble _080A3400
_080A3412:
	movs r0, #0
_080A3414:
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80A33EC

	THUMB_FUNC_START sub_80A341C
sub_80A341C: @ 0x080A341C
	push {r4, lr}
	sub sp, #0x4c
	ldr r4, _080A3458  @ gUnknown_02020188
	adds r0, r4, #0
	bl sub_80A38F4
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A345C
	movs r3, #0
	adds r1, r4, #0
	movs r2, #0xf
_080A3434:
	ldrb r0, [r1]
	cmp r0, #0
	beq _080A3448
	ldrb r0, [r1, #1]
	cmp r0, #0
	bne _080A3442
	movs r3, #1
_080A3442:
	cmp r0, #2
	bne _080A3448
	movs r3, #1
_080A3448:
	adds r1, #0x14
	subs r2, #1
	cmp r2, #0
	bge _080A3434
	cmp r3, #0
	beq _080A345C
	movs r0, #1
	b _080A345E
	.align 2, 0
_080A3458: .4byte gUnknown_02020188
_080A345C:
	movs r0, #0
_080A345E:
	add sp, #0x4c
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80A341C

	THUMB_FUNC_START sub_80A3468
sub_80A3468: @ 0x080A3468
	push {r4, r5, r6, r7, lr}
	adds r2, r0, #0
	ldr r7, _080A3498  @ gUnknown_08A1FAF8
	ldr r0, [r7]
	cmp r0, #0
	beq _080A34C4
	movs r6, #0
	adds r5, r7, #0
	adds r3, r7, #4
	adds r4, r7, #0
_080A347C:
	ldr r0, [r4]
	cmp r0, r2
	bne _080A3488
	ldr r0, [r3]
	cmp r0, r1
	bne _080A3494
_080A3488:
	ldr r0, [r4]
	cmp r0, r1
	bne _080A349C
	ldr r0, [r3]
	cmp r0, r2
	beq _080A34A2
_080A3494:
	movs r0, #2
	b _080A34C6
	.align 2, 0
_080A3498: .4byte gUnknown_08A1FAF8
_080A349C:
	ldr r0, [r3]
	cmp r0, r2
	bne _080A34A8
_080A34A2:
	ldr r0, [r4]
	cmp r0, r1
	bne _080A3494
_080A34A8:
	ldr r0, [r3]
	cmp r0, r1
	bne _080A34B4
	ldr r0, [r5]
	cmp r0, r2
	bne _080A3494
_080A34B4:
	adds r6, #8
	adds r5, #8
	adds r3, #8
	adds r4, #8
	adds r0, r6, r7
	ldr r0, [r0]
	cmp r0, #0
	bne _080A347C
_080A34C4:
	movs r0, #3
_080A34C6:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80A3468

	THUMB_FUNC_START sub_80A34CC
sub_80A34CC: @ 0x080A34CC
	push {r4, r5, r6, lr}
	movs r5, #0
	bl sub_80847F8
	adds r4, r0, #0
	ldrh r0, [r4]
	ldr r1, _080A34FC  @ 0x0000FFFF
	cmp r0, r1
	beq _080A34F2
	adds r6, r1, #0
_080A34E0:
	ldrh r0, [r4]
	ldrh r1, [r4, #2]
	bl sub_80A3468
	adds r5, r5, r0
	adds r4, #0x10
	ldrh r0, [r4]
	cmp r0, r6
	bne _080A34E0
_080A34F2:
	adds r0, r5, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_080A34FC: .4byte 0x0000FFFF

	THUMB_FUNC_END sub_80A34CC

	THUMB_FUNC_START sub_80A3500
sub_80A3500: @ 0x080A3500
	push {r4, r5, r6, r7, lr}
	sub sp, #0x64
	adds r4, r0, #0
	movs r5, #0
	cmp r4, #0
	bne _080A3514
	mov r4, sp
	mov r0, sp
	bl LoadSomeUnitStatThingUnlockIdk
_080A3514:
	movs r0, #0
	adds r7, r4, #0
	adds r7, #0x20
	movs r6, #3
_080A351C:
	movs r2, #0
	adds r4, r0, #1
	adds r0, r7, r0
	ldrb r3, [r0]
_080A3524:
	lsls r1, r2, #1
	adds r0, r3, #0
	asrs r0, r1
	ands r0, r6
	adds r5, r5, r0
	adds r2, #1
	cmp r2, #3
	ble _080A3524
	adds r0, r4, #0
	cmp r0, #0x1f
	ble _080A351C
	adds r0, r5, #0
	add sp, #0x64
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80A3500

	THUMB_FUNC_START sub_80A3544
sub_80A3544: @ 0x080A3544
	push {r4, r5, lr}
	movs r0, #0
	bl sub_80A3500
	adds r4, r0, #0
	bl sub_80A34CC
	adds r5, r0, #0
	cmp r4, #0
	ble _080A356A
	movs r0, #0x64
	muls r0, r4, r0
	adds r1, r5, #0
	bl __divsi3
	cmp r0, #0
	bne _080A356A
	movs r4, #1
	b _080A3576
_080A356A:
	movs r0, #0x64
	muls r0, r4, r0
	adds r1, r5, #0
	bl __divsi3
	adds r4, r0, #0
_080A3576:
	cmp r4, #0x64
	ble _080A357C
	movs r4, #0x64
_080A357C:
	adds r0, r4, #0
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80A3544

	THUMB_FUNC_START sub_80A3584
sub_80A3584: @ 0x080A3584
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x64
	mov r8, r0
	adds r7, r1, #0
	adds r5, r2, #0
	movs r6, #0
	bl sub_80847F8
	adds r4, r0, #0
	cmp r5, #0
	bne _080A35A6
	mov r5, sp
	mov r0, sp
	bl LoadSomeUnitStatThingUnlockIdk
_080A35A6:
	adds r3, r5, #0
	adds r3, #0x20
	b _080A35B0
_080A35AC:
	adds r6, #1
	adds r4, #0x10
_080A35B0:
	ldrh r1, [r4]
	ldr r0, _080A35E8  @ 0x0000FFFF
	cmp r1, r0
	beq _080A35CC
	cmp r1, r8
	bne _080A35C2
	ldrh r0, [r4, #2]
	cmp r0, r7
	beq _080A35CC
_080A35C2:
	cmp r1, r7
	bne _080A35AC
	ldrh r0, [r4, #2]
	cmp r0, r8
	bne _080A35AC
_080A35CC:
	asrs r0, r6, #2
	movs r2, #3
	ands r6, r2
	lsls r1, r6, #1
	adds r0, r3, r0
	ldrb r0, [r0]
	asrs r0, r1
	ands r0, r2
	add sp, #0x64
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080A35E8: .4byte 0x0000FFFF

	THUMB_FUNC_END sub_80A3584

	THUMB_FUNC_START sub_80A35EC
sub_80A35EC: @ 0x080A35EC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x78
	str r0, [sp, #0x64]
	mov r8, r1
	str r2, [sp, #0x68]
	ldr r0, _080A3630  @ gCharacterData
	mov sl, r0
	ldr r6, [sp, #0x64]
	subs r6, #1
	movs r0, #0x34
	adds r1, r6, #0
	muls r1, r0, r1
	mov r9, r1
	mov r0, sl
	adds r0, #0x2c
	adds r7, r1, r0
	ldr r0, [r7]
	cmp r0, #0
	bne _080A3634
	movs r0, #0
	movs r3, #6
_080A361E:
	mov r2, r8
	strb r0, [r2]
	movs r1, #1
	add r8, r1
	subs r3, #1
	cmp r3, #0
	bge _080A361E
	b _080A370A
	.align 2, 0
_080A3630: .4byte gCharacterData
_080A3634:
	movs r4, #0
	bl sub_80847F8
	adds r5, r0, #0
	ldr r2, [sp, #0x68]
	cmp r2, #0
	bne _080A364E
	mov r1, sp
	adds r0, r1, #0
	str r0, [sp, #0x68]
	mov r0, sp
	bl LoadSomeUnitStatThingUnlockIdk
_080A364E:
	ldrh r0, [r5]
	ldr r1, _080A36CC  @ 0x0000FFFF
	str r6, [sp, #0x74]
	cmp r0, r1
	beq _080A36E8
	str r7, [sp, #0x70]
	mov r2, r9
	str r2, [sp, #0x6c]
_080A365E:
	ldrh r0, [r5]
	ldr r1, [sp, #0x64]
	cmp r0, r1
	beq _080A3678
	ldrh r0, [r5, #2]
	adds r2, r4, #1
	mov r9, r2
	movs r1, #0x10
	adds r1, r1, r5
	mov ip, r1
	ldr r2, [sp, #0x64]
	cmp r0, r2
	bne _080A36DC
_080A3678:
	asrs r1, r4, #2
	adds r0, r4, #0
	movs r2, #3
	ands r0, r2
	lsls r0, r0, #1
	mov sl, r0
	movs r3, #0
	ldr r2, [sp, #0x70]
	ldr r0, [r2]
	adds r4, #1
	mov r9, r4
	movs r2, #0x10
	adds r2, r2, r5
	mov ip, r2
	ldrb r0, [r0, #0x15]
	cmp r3, r0
	bge _080A36DC
	ldr r0, _080A36D0  @ gCharacterData+0x2C
	ldr r2, [sp, #0x6c]
	adds r6, r2, r0
	ldr r0, [sp, #0x68]
	adds r0, #0x20
	adds r7, r0, r1
_080A36A6:
	ldr r4, [r6]
	adds r0, r4, r3
	ldrh r1, [r5]
	ldrb r2, [r0]
	cmp r1, r2
	beq _080A36B8
	ldrh r0, [r5, #2]
	cmp r0, r2
	bne _080A36D4
_080A36B8:
	mov r0, r8
	adds r1, r0, r3
	ldrb r0, [r7]
	mov r2, sl
	asrs r0, r2
	movs r2, #3
	ands r0, r2
	strb r0, [r1]
	b _080A36DC
	.align 2, 0
_080A36CC: .4byte 0x0000FFFF
_080A36D0: .4byte gCharacterData+0x2C
_080A36D4:
	adds r3, #1
	ldrb r4, [r4, #0x15]
	cmp r3, r4
	blt _080A36A6
_080A36DC:
	mov r4, r9
	mov r5, ip
	ldrh r0, [r5]
	ldr r1, _080A371C  @ 0x0000FFFF
	cmp r0, r1
	bne _080A365E
_080A36E8:
	movs r0, #0x34
	ldr r2, [sp, #0x74]
	muls r0, r2, r0
	ldr r1, _080A3720  @ gCharacterData
	adds r1, #0x2c
	adds r0, r0, r1
	ldr r0, [r0]
	ldrb r3, [r0, #0x15]
	cmp r3, #6
	bgt _080A370A
	movs r1, #0
_080A36FE:
	mov r2, r8
	adds r0, r2, r3
	strb r1, [r0]
	adds r3, #1
	cmp r3, #6
	ble _080A36FE
_080A370A:
	add sp, #0x78
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A371C: .4byte 0x0000FFFF
_080A3720: .4byte gCharacterData

	THUMB_FUNC_END sub_80A35EC

	THUMB_FUNC_START sub_80A3724
sub_80A3724: @ 0x080A3724
	push {r4, r5, r6, r7, lr}
	sub sp, #0x64
	adds r7, r0, #0
	adds r5, r1, #0
	movs r6, #3
	ands r6, r2
	mov r0, sp
	bl LoadSomeUnitStatThingUnlockIdk
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A379C
	movs r4, #0
	bl sub_80847F8
	adds r2, r0, #0
	add r0, sp, #0x20
	mov ip, r0
	b _080A374E
_080A374A:
	adds r4, #1
	adds r2, #0x10
_080A374E:
	ldrh r1, [r2]
	ldr r0, _080A3798  @ 0x0000FFFF
	cmp r1, r0
	beq _080A376A
	cmp r1, r7
	bne _080A3760
	ldrh r0, [r2, #2]
	cmp r0, r5
	beq _080A376A
_080A3760:
	cmp r1, r5
	bne _080A374A
	ldrh r0, [r2, #2]
	cmp r0, r7
	bne _080A374A
_080A376A:
	asrs r0, r4, #2
	movs r3, #3
	ands r4, r3
	lsls r1, r4, #1
	mov r2, ip
	adds r4, r2, r0
	ldrb r2, [r4]
	adds r0, r2, #0
	asrs r0, r1
	ands r0, r3
	cmp r0, r6
	bge _080A379C
	adds r0, r3, #0
	lsls r0, r1
	bics r2, r0
	lsls r6, r1
	adds r0, r2, r6
	strb r0, [r4]
	mov r0, sp
	bl SaveSomeUnitStatThingUnlockIdk
	movs r0, #1
	b _080A379E
	.align 2, 0
_080A3798: .4byte 0x0000FFFF
_080A379C:
	movs r0, #0
_080A379E:
	add sp, #0x64
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80A3724

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
	bl LoadSomeUnitStatThingUnlockIdk
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
	bl SaveSomeUnitStatThingUnlockIdk
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
	bl LoadSomeUnitStatThingUnlockIdk
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
	bl LoadSomeUnitStatThingUnlockIdk
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
	bl LoadSomeUnitStatThingUnlockIdk
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
	bl sub_80A2CB0
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A38EC
	cmp r5, #0
	bne _080A38AC
	ldr r5, _080A38DC  @ gUnknown_02020188
_080A38AC:
	ldr r1, _080A38E0  @ ReadSramFast
	ldr r0, _080A38E4  @ gUnknown_08A1FAF4
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
	bl sub_80A2CFC
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
_080A38E4: .4byte gUnknown_08A1FAF4
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
	bl sub_80A2CB0
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A3948
	cmp r5, #0
	bne _080A3908
	ldr r5, _080A3938  @ gUnknown_02020188
_080A3908:
	ldr r1, _080A393C  @ ReadSramFast
	ldr r0, _080A3940  @ gUnknown_08A1FAF4
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
	bl sub_80A2CFC
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
_080A3940: .4byte gUnknown_08A1FAF4
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
	bl sub_80A2CFC
	adds r4, r5, r4
	strh r0, [r4]
	ldr r0, _080A397C  @ gUnknown_08A1FAF4
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
_080A397C: .4byte gUnknown_08A1FAF4
_080A3980: .4byte 0x0000725C

	THUMB_FUNC_END sub_80A3950

	THUMB_FUNC_START sub_80A3984
sub_80A3984: @ 0x080A3984
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0x90
	bl sub_80A2CFC
	adds r1, r4, #0
	adds r1, #0x90
	strh r0, [r1]
	ldr r0, _080A39AC  @ gUnknown_08A1FAF4
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
_080A39AC: .4byte gUnknown_08A1FAF4
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
	bl sub_80A2CB0
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A3E98
	cmp r4, #0
	bne _080A3E62
	mov r4, sp
_080A3E62:
	ldr r1, _080A3E8C  @ ReadSramFast
	ldr r0, _080A3E90  @ gUnknown_08A1FAF4
	ldr r0, [r0]
	ldr r2, _080A3E94  @ 0x00007224
	adds r0, r0, r2
	ldr r3, [r1]
	adds r1, r4, #0
	movs r2, #0x24
	bl _call_via_r3
	adds r0, r4, #0
	movs r1, #0x20
	bl sub_80A2CFC
	ldrh r1, [r4, #0x20]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r1, r0
	bne _080A3E98
	movs r0, #1
	b _080A3E9A
	.align 2, 0
_080A3E8C: .4byte ReadSramFast
_080A3E90: .4byte gUnknown_08A1FAF4
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
	bl sub_80A2CFC
	strh r0, [r4, #0x20]
	ldr r0, _080A3EC8  @ gUnknown_08A1FAF4
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
_080A3EC8: .4byte gUnknown_08A1FAF4
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
	bl sub_80A2CB0
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A3FF4
	cmp r4, #0
	bne _080A3FBE
	mov r4, sp
_080A3FBE:
	ldr r1, _080A3FE8  @ ReadSramFast
	ldr r0, _080A3FEC  @ gUnknown_08A1FAF4
	ldr r0, [r0]
	ldr r2, _080A3FF0  @ 0x00007248
	adds r0, r0, r2
	ldr r3, [r1]
	adds r1, r4, #0
	movs r2, #0x14
	bl _call_via_r3
	adds r0, r4, #0
	movs r1, #0x10
	bl sub_80A2CFC
	ldrh r1, [r4, #0x10]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r1, r0
	bne _080A3FF4
	movs r0, #1
	b _080A3FF6
	.align 2, 0
_080A3FE8: .4byte ReadSramFast
_080A3FEC: .4byte gUnknown_08A1FAF4
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
	bl sub_80A2CFC
	strh r0, [r4, #0x10]
	ldr r0, _080A4024  @ gUnknown_08A1FAF4
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
_080A4024: .4byte gUnknown_08A1FAF4
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
	bl LoadSomeUnitStatThingUnlockIdk
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080A40BA
	bl sub_80A2DE4
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
	bl sub_80A2CB0
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
	ldr r1, _080A4674  @ gUnknown_0202BCB0
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
	bl sub_80A2EF8
	mov r0, sp
	adds r1, r4, #0
	bl sub_80A2F94
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
	bl sub_80A2EF8
	ldrb r1, [r7, #0xc]
	mov r0, sp
	bl sub_80A2F94
_080A4662:
	add sp, #0x10
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A4670: .4byte gUnknown_0203E884
_080A4674: .4byte gUnknown_0202BCB0
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
	bl LoadSomeUnitStatThingUnlockIdk
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
	bl LoadSomeUnitStatThingUnlockIdk
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
	bl LoadSomeUnitStatThingUnlockIdk
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080A4C48
	bl sub_80A2DE4
	mov r0, sp
	bl LoadSomeUnitStatThingUnlockIdk
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
	bl SaveSomeUnitStatThingUnlockIdk
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
	bl LoadSomeUnitStatThingUnlockIdk
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
	bl LoadSomeUnitStatThingUnlockIdk
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A4CF6
	mov r0, sp
	ldrb r1, [r0, #0xf]
	movs r2, #1
	orrs r1, r2
	strb r1, [r0, #0xf]
	bl SaveSomeUnitStatThingUnlockIdk
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
	bl LoadSomeUnitStatThingUnlockIdk
	mov r0, sp
	adds r0, #0x62
	strb r4, [r0]
	mov r0, sp
	bl sub_80A2DD0
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
	bl LoadSomeUnitStatThingUnlockIdk
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
	bl sub_80A2F94
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
	bl sub_80A3114
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
	bl sub_80A2F94
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
	bl sub_80A2F94
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
	bl LoadSomeUnitStatThingUnlockIdk
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
	bl SaveSomeUnitStatThingUnlockIdk
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
	bl sub_80A2F94
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
	bl sub_80A3114
	adds r7, r0, #0
	ldr r0, _080A51F0  @ gUnknown_0202BCB0
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
_080A51F0: .4byte gUnknown_0202BCB0
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
	bl sub_80A2EF8
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80A5218

	THUMB_FUNC_START sub_80A522C
sub_80A522C: @ 0x080A522C
	push {r4, lr}
	adds r4, r1, #0
	bl sub_80A3114
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
	bl sub_80A3114
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
	bl sub_80A3114
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
	bl sub_80A3114
	ldr r1, _080A52B4  @ 0x00000D6C
	adds r0, r0, r1
	ldr r4, _080A52B8  @ gUnknown_02020188
	adds r1, r4, #0
	bl sub_80A31C0
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
	bl sub_80A2F94
	cmp r4, #3
	bne _080A5A40
	mov r0, sp
	movs r1, #4
	bl sub_80A2F94
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
	bl sub_80A2CB0
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
	bl sub_80A2F94
	ldr r0, _080A5C10  @ gUnknown_0202BCB0
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
_080A5C10: .4byte gUnknown_0202BCB0

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
	bl sub_80A3114
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
	bl sub_80A2CB0
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
	bl sub_80A2EF8
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080A5DF4
	bl sub_80A63D0
	strb r0, [r4]
	ldrb r1, [r4]
	adds r1, #3
	movs r0, #0
	bl sub_80A2EF8
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
	bl LoadSomeUnitStatThingUnlockIdk
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
	bl LoadSomeUnitStatThingUnlockIdk
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
	bl sub_80A2DD0
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
	bl GetSaveDataOffsetPointer
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
	bl GetSaveDataOffsetPointer
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
	bl sub_80A2EF8
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
	bl sub_80A2F94
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
	bl sub_80A3114
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
	bl sub_80A3114
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
	bl sub_80A2F94
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
	bl sub_80A2F94
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
	bl sub_80A3114
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
	bl sub_80A2F94
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
	bl sub_80A3114
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
	bl sub_80A2F94
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
	bl sub_80A2F94
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
	bl sub_80A3114
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
	bl sub_80A2F94
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
	bl sub_80A3114
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
	bl sub_80A2F94
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
	bl sub_80A3114
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
	bl sub_80A2CB0
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
	ldr r0, _080A6D04  @ gUnknown_0202BCB0
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
_080A6D04: .4byte gUnknown_0202BCB0
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
	bl SaveSomeUnitStatThingUnlockIdk
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
	bl sub_80A2F94
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
