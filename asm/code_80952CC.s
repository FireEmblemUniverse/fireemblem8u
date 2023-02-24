
	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

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
	bl PutUnitSpriteForClassId
	adds r5, #0x10
	adds r4, #1
	adds r0, r6, #0
	adds r0, #0x3c
	ldrb r0, [r0]
	cmp r4, r0
	blt _080A1C1A
_080A1C60:
	bl SyncUnitSpriteSheet
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
	ldr r0, _080A1F58  @ Pal_UIFont
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
_080A1F58: .4byte Pal_UIFont
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
	bl ResetUnitSprites
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
	bl UseUnitSprite
	adds r4, #1
_080A2124:
	adds r0, r5, #0
	adds r0, #0x3c
	ldrb r0, [r0]
	cmp r4, r0
	blt _080A2108
	bl ForceSyncUnitSpriteSheet
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
	bl ResetPrepScreenHandCursor
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
	bl ShowPrepScreenHandCursor
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
	bl SetBlendTargetA
	str r4, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #1
	bl SetBlendTargetB
	movs r0, #0
	bl sub_8001F48
	movs r0, #0
	bl sub_8001F64
	bl EndSlidingWallEffectMaybe
	movs r0, #0x80
	lsls r0, r0, #7
	movs r1, #5
	bl sub_8098C3C
	ldr r0, _080A2420  @ gUnknown_08A1DC1C
	ldr r4, _080A2424  @ gGenericBuffer
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
	bl PutFace80x72
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
	ldr r0, _080A2440  @ Pal_MapBattleInfoNum
	movs r1, #0x90
	lsls r1, r1, #2
	movs r2, #0x20
	bl CopyToPaletteBuffer
	ldr r0, _080A2444  @ sub_80A1B90
	adds r1, r5, #0
	bl StartParallelWorker
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A2418: .4byte gLCDControlBuffer
_080A241C: .4byte gRAMChapterData
_080A2420: .4byte gUnknown_08A1DC1C
_080A2424: .4byte gGenericBuffer
_080A2428: .4byte gBG1TilemapBuffer
_080A242C: .4byte gCharacterData
_080A2430: .4byte gUnknown_02022CEC
_080A2434: .4byte gUnknown_08A1DD0C
_080A2438: .4byte 0x06017800
_080A243C: .4byte gUnknown_08A1E0D8
_080A2440: .4byte Pal_MapBattleInfoNum
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
	bl ShowPrepScreenHandCursor
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
	bl SetBlendTargetA
	movs r0, #0
	str r0, [sp]
	movs r1, #1
	movs r2, #0
	movs r3, #0
	bl SetBlendTargetB
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
	bl HidePrepScreenHandCursor
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
	bl SetBlendTargetA
	movs r0, #1
	str r0, [sp]
	movs r1, #1
	movs r2, #1
	movs r3, #0
	bl SetBlendTargetB
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
	ldr r5, _080A2AA4  @ gGenericBuffer
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
	bl PutFace80x72
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
_080A2AA4: .4byte gGenericBuffer
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
	bl SetBlendTargetA
	movs r0, #1
	str r0, [sp]
	movs r1, #1
	movs r2, #1
	movs r3, #1
	bl SetBlendTargetB
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
	bl ShowPrepScreenHandCursor
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
	bl EndAllProcChildren
	bl EndBG3Slider_
	movs r0, #0
	bl EndFaceById
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

.align 2, 0
