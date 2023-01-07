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
	ldr r0, _0808EBC4  @ Pal_UIFont
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
_0808EBC4: .4byte Pal_UIFont
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
	bl StartParallelWorker
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
	bl GetFaceDisplayBitsById
	movs r1, #0x11
	negs r1, r1
	ands r1, r0
	movs r0, #0
	bl SetFaceDisplayBitsById
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
	ldr r0, _0808F004  @ gProcScr_E_FACE
	bl Proc_Find
	bl StartFaceFadeOut
_0808EFFC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808F004: .4byte gProcScr_E_FACE

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
	bl GetFaceDisplayBitsById
	movs r1, #0x11
	negs r1, r1
	ands r1, r0
	movs r0, #0
	bl SetFaceDisplayBitsById
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
	bl SetFaceBlinkControlById
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
	bl GetFaceDisplayBitsById
	movs r1, #0x10
	orrs r0, r1
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	movs r0, #0
	movs r1, #3
	bl SetFaceBlinkControlById
	movs r0, #1
	movs r1, #1
	bl SetFaceBlinkControlById
	b _0808F990
	.align 2, 0
_0808F940: .4byte gUnknown_03005398
_0808F944:
	movs r0, #0
	bl GetFaceDisplayBitsById
	movs r1, #0x10
	orrs r0, r1
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	movs r0, #0
	movs r1, #3
	bl SetFaceBlinkControlById
	movs r0, #1
	b _0808F976
_0808F95E:
	movs r0, #1
	bl GetFaceDisplayBitsById
	movs r1, #0x10
	orrs r0, r1
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	movs r0, #1
	movs r1, #3
	bl SetFaceBlinkControlById
	movs r0, #0
_0808F976:
	movs r1, #1
	bl SetFaceBlinkControlById
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
	bl SetFaceDisplayBitsById
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
	bl PrepGetLatestCharId
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
	bl InitPrepSideBarImg
	bl ForceSyncUnitSpriteSheet
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
	bl ForceSyncUnitSpriteSheet
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
	bl PutUnitSprite
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
	bl PutUnitSprite
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
	bl UseUnitSprite
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
	bl Font_ResetAllocation
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
	bl Reset203E87C_WithVal
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
	bl Modify203E87C
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
	bl SetBlendTargetA
	str r4, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #1
	bl SetBlendTargetB
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
	bl PrepSetLatestCharId
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
	bl Font_ResetAllocation
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
	bl ResetUnitSprites
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

	THUMB_FUNC_START CanPrepScreenSave
CanPrepScreenSave: @ 0x08094FF4
	push {lr}
	ldr r0, _08095014  @ gRAMChapterData
	movs r2, #0xe
	ldrsb r2, [r0, r2]
	ldr r0, _08095018  @ gGMData
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
_08095018: .4byte gGMData
_0809501C:
	movs r0, #1
_0809501E:
	pop {r1}
	bx r1

	THUMB_FUNC_END CanPrepScreenSave

	THUMB_FUNC_START sub_8095024
sub_8095024: @ 0x08095024
	push {r4, lr}
	bl GetActivePrepMenuItemIndex
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
	bl CanPrepScreenSave
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
	ldr r0, _08095130  @ Img_PrepWindow
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
_08095130: .4byte Img_PrepWindow
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

.align 2, 0
