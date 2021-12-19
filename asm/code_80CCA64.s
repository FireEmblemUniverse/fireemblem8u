	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	THUMB_FUNC_START sub_80CCA64
sub_80CCA64: @ 0x080CCA64
	push {r4, lr}
	adds r4, r0, #0
	bl sub_8006978
	bl sub_8008250
	movs r0, #2
	movs r1, #0xf
	adds r2, r4, #0
	bl sub_8006A30
	movs r0, #0
	bl sub_8006B10
	movs r0, #1
	bl sub_8006AA8
	movs r0, #2
	bl sub_8006AA8
	movs r0, #4
	bl sub_8006AA8
	movs r0, #8
	bl sub_8006AA8
	movs r0, #0x40
	bl sub_8006AA8
	movs r0, #4
	bl sub_8006AF0
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80CCA64

	THUMB_FUNC_START sub_80CCAAC
sub_80CCAAC: @ 0x080CCAAC
	push {r4, r5, lr}
	sub sp, #0x20
	adds r4, r0, #0
	lsls r0, r1, #0x10
	lsrs r0, r0, #0x10
	adds r2, r4, #0
	adds r2, #0x44
	movs r3, #0
	movs r1, #0
	strh r1, [r2]
	adds r5, r4, #0
	adds r5, #0x46
	strb r3, [r5]
	adds r2, #3
	movs r1, #0x78
	strb r1, [r2]
	bl GetClassData
	ldrh r0, [r0]
	mov r1, sp
	bl GetStringFromIndexInBuffer
	mov r0, sp
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _080CCB16
	mov r4, sp
_080CCAE6:
	ldrb r0, [r4]
	bl sub_80B4108
	adds r1, r0, #0
	cmp r1, #0
	beq _080CCAFE
	ldrb r0, [r1, #5]
	ldrb r1, [r1, #4]
	subs r0, r0, r1
	ldrb r1, [r5]
	adds r0, r0, r1
	b _080CCB02
_080CCAFE:
	ldrb r0, [r5]
	adds r0, #4
_080CCB02:
	strb r0, [r5]
	adds r4, #1
	mov r0, sp
	adds r0, #0x13
	cmp r4, r0
	bgt _080CCB16
	movs r0, #0
	ldrsb r0, [r4, r0]
	cmp r0, #0
	bne _080CCAE6
_080CCB16:
	ldr r0, _080CCB34  @ gUnknown_08A36338
	ldr r1, _080CCB38  @ 0x06011000
	bl CopyDataWithPossibleUncomp
	ldr r0, _080CCB3C  @ gUnknown_08A372C0
	movs r1, #0xa0
	lsls r1, r1, #2
	movs r2, #0x40
	bl CopyToPaletteBuffer
	add sp, #0x20
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080CCB34: .4byte gUnknown_08A36338
_080CCB38: .4byte 0x06011000
_080CCB3C: .4byte gUnknown_08A372C0

	THUMB_FUNC_END sub_80CCAAC

	THUMB_FUNC_START sub_80CCB40
sub_80CCB40: @ 0x080CCB40
	push {r4, r5, r6, r7, lr}
	sub sp, #0x24
	adds r7, r0, #0
	adds r0, #0x41
	ldrb r1, [r0]
	lsls r1, r1, #1
	subs r0, #0x15
	adds r0, r0, r1
	ldrh r0, [r0]
	movs r6, #0x74
	bl GetClassData
	ldrh r0, [r0]
	add r1, sp, #4
	bl GetStringFromIndexInBuffer
	add r0, sp, #4
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _080CCBBC
	add r5, sp, #4
_080CCB6E:
	ldrb r0, [r5]
	bl sub_80B4108
	adds r4, r0, #0
	cmp r4, #0
	beq _080CCBA8
	ldr r3, [r4]
	cmp r3, #0
	beq _080CCBAA
	movs r1, #4
	ldrsb r1, [r4, r1]
	subs r1, r6, r1
	subs r1, #2
	movs r2, #6
	ldrsb r2, [r4, r2]
	adds r2, #6
	movs r0, #0x81
	lsls r0, r0, #7
	str r0, [sp]
	movs r0, #4
	bl PutSpriteExt
	movs r0, #5
	ldrsb r0, [r4, r0]
	movs r1, #4
	ldrsb r1, [r4, r1]
	subs r0, r0, r1
	adds r6, r6, r0
	b _080CCBAA
_080CCBA8:
	adds r6, #4
_080CCBAA:
	adds r5, #1
	mov r0, sp
	adds r0, #0x17
	cmp r5, r0
	bgt _080CCBBC
	movs r0, #0
	ldrsb r0, [r5, r0]
	cmp r0, #0
	bne _080CCB6E
_080CCBBC:
	adds r1, r7, #0
	adds r1, #0x44
	ldrh r0, [r1]
	cmp r0, #0xfe
	bhi _080CCBCA
	adds r0, #1
	strh r0, [r1]
_080CCBCA:
	add sp, #0x24
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80CCB40

	THUMB_FUNC_START sub_80CCBD4
sub_80CCBD4: @ 0x080CCBD4
	push {lr}
	bl sub_805A9E0
	ldr r0, _080CCBEC  @ gUnknown_030053A0
	bl sub_805AA28
	ldr r0, _080CCBF0  @ gUnknown_0201FADC
	bl sub_805AE14
	pop {r0}
	bx r0
	.align 2, 0
_080CCBEC: .4byte gUnknown_030053A0
_080CCBF0: .4byte gUnknown_0201FADC

	THUMB_FUNC_END sub_80CCBD4

	THUMB_FUNC_START sub_80CCBF4
sub_80CCBF4: @ 0x080CCBF4
	push {r4, lr}
	ldr r4, _080CCC1C  @ gUnknown_08A30800
	movs r0, #2
	bl GetBackgroundTileDataOffset
	adds r1, r0, #0
	ldr r0, _080CCC20  @ 0x06003000
	adds r1, r1, r0
	adds r0, r4, #0
	bl CopyDataWithPossibleUncomp
	ldr r0, _080CCC24  @ gBG2TilemapBuffer
	ldr r1, _080CCC28  @ gUnknown_08A30978
	movs r2, #0x8c
	lsls r2, r2, #5
	bl sub_80CCCE0
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080CCC1C: .4byte gUnknown_08A30800
_080CCC20: .4byte 0x06003000
_080CCC24: .4byte gBG2TilemapBuffer
_080CCC28: .4byte gUnknown_08A30978

	THUMB_FUNC_END sub_80CCBF4

	THUMB_FUNC_START sub_80CCC2C
sub_80CCC2C: @ 0x080CCC2C
	push {r4, r5, r6, lr}
	sub sp, #0x24
	adds r6, r0, #0
	ldr r0, _080CCC9C  @ gBG2TilemapBuffer
	movs r1, #6
	str r1, [sp]
	movs r1, #0
	str r1, [sp, #4]
	movs r1, #1
	str r1, [sp, #8]
	movs r1, #2
	movs r2, #1
	movs r3, #0xa
	bl DrawUiFrame
	movs r0, #0
	bl SetFontGlyphSet
	movs r0, #0
	bl SetFont
	ldrh r0, [r6, #0x2c]
	bl GetClassData
	ldrh r0, [r0]
	bl GetStringFromIndex
	ldr r4, _080CCCA0  @ gUnknown_02022D2E
	movs r5, #8
	str r5, [sp]
	str r0, [sp, #4]
	movs r0, #0
	adds r1, r4, #0
	movs r2, #0
	movs r3, #0
	bl DrawTextInline
	ldrh r0, [r6, #0x2e]
	bl GetClassData
	ldrh r0, [r0]
	bl GetStringFromIndex
	adds r4, #0x80
	str r5, [sp]
	str r0, [sp, #4]
	movs r0, #0
	adds r1, r4, #0
	movs r2, #0
	movs r3, #0
	bl DrawTextInline
	add sp, #0x24
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080CCC9C: .4byte gBG2TilemapBuffer
_080CCCA0: .4byte gUnknown_02022D2E

	THUMB_FUNC_END sub_80CCC2C

	THUMB_FUNC_START sub_80CCCA4
sub_80CCCA4: @ 0x080CCCA4
	push {lr}
	sub sp, #0x64
	mov r0, sp
	bl LoadSomeUnitStatThingUnlockIdk
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080CCCBE
	bl sub_80A2DE4
	mov r0, sp
	bl LoadSomeUnitStatThingUnlockIdk
_080CCCBE:
	mov r0, sp
	ldrb r1, [r0, #0xe]
	movs r0, #0x1c
	ands r0, r1
	cmp r0, #0
	beq _080CCCD6
	movs r0, #0xe0
	ands r0, r1
	cmp r0, #0
	beq _080CCCD6
	movs r0, #1
	b _080CCCD8
_080CCCD6:
	movs r0, #0
_080CCCD8:
	add sp, #0x64
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80CCCA4

	THUMB_FUNC_START sub_80CCCE0
sub_80CCCE0: @ 0x080CCCE0
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	lsls r2, r2, #0x10
	lsrs r5, r2, #0x10
	adds r4, r1, #2
	movs r2, #0xff
	ldr r0, [r1]
	ldrb r6, [r1]
	lsrs r3, r0, #8
	ands r3, r2
	lsls r1, r3, #0x10
	cmp r3, #0xc
	ble _080CCD28
_080CCCFA:
	asrs r0, r1, #0xa
	adds r2, r7, r0
	lsls r1, r6, #0x10
	asrs r0, r1, #0x10
	lsls r3, r3, #0x10
	cmp r0, #0
	blt _080CCD1A
_080CCD08:
	ldrh r0, [r4]
	adds r0, r5, r0
	strh r0, [r2]
	adds r4, #2
	adds r2, #2
	ldr r0, _080CCD30  @ 0xFFFF0000
	adds r1, r1, r0
	cmp r1, #0
	bge _080CCD08
_080CCD1A:
	ldr r1, _080CCD30  @ 0xFFFF0000
	adds r0, r3, r1
	lsrs r3, r0, #0x10
	lsls r1, r3, #0x10
	asrs r0, r1, #0x10
	cmp r0, #0xc
	bgt _080CCCFA
_080CCD28:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080CCD30: .4byte 0xFFFF0000

	THUMB_FUNC_END sub_80CCCE0

	THUMB_FUNC_START Make6C_PromotionSub
Make6C_PromotionSub: @ 0x080CCD34
	push {lr}
	adds r1, r0, #0
	ldr r0, _080CCD44  @ gUnknown_08B1271C
	bl Proc_StartBlocking
	pop {r1}
	bx r1
	.align 2, 0
_080CCD44: .4byte gUnknown_08B1271C

	THUMB_FUNC_END Make6C_PromotionSub

	THUMB_FUNC_START sub_80CCD48
sub_80CCD48: @ 0x080CCD48
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x20
	adds r5, r0, #0
	ldr r0, [r5, #0x14]
	str r0, [sp, #4]
	adds r1, r0, #0
	adds r1, #0x29
	movs r4, #0
	movs r0, #2
	strb r0, [r1]
	ldr r0, [sp, #4]
	adds r0, #0x38
	ldrb r0, [r0]
	adds r1, r5, #0
	adds r1, #0x42
	strh r0, [r1]
	movs r0, #9
	str r0, [r5, #0x50]
	ldr r0, _080CCE80  @ gBG0TilemapBuffer
	movs r1, #0
	bl BG_Fill
	ldr r0, _080CCE84  @ gBG1TilemapBuffer
	movs r1, #0
	bl BG_Fill
	ldr r0, _080CCE88  @ gBG2TilemapBuffer
	movs r1, #0
	bl BG_Fill
	bl LoadUiFrameGraphics
	bl LoadObjUIGfx
	movs r1, #1
	negs r1, r1
	movs r2, #0xfb
	lsls r2, r2, #1
	movs r0, #6
	str r0, [sp]
	movs r0, #0
	movs r3, #0x58
	bl sub_80CD47C
	bl sub_80CCBF4
	ldr r0, [r5, #0x50]
	movs r1, #0x8c
	lsls r1, r1, #1
	movs r2, #0x68
	bl sub_80CD408
	strh r4, [r5, #0x32]
	strh r4, [r5, #0x34]
	strh r4, [r5, #0x36]
	movs r4, #1
_080CCDC0:
	adds r0, r4, #0
	bl GetUnit
	mov sl, r0
	cmp r0, #0
	bne _080CCDCE
	b _080CCEEE
_080CCDCE:
	ldr r0, [r0]
	cmp r0, #0
	bne _080CCDD6
	b _080CCEEE
_080CCDD6:
	adds r1, r5, #0
	adds r1, #0x42
	ldrb r0, [r0, #4]
	ldrh r1, [r1]
	cmp r0, r1
	beq _080CCDE4
	b _080CCEEE
_080CCDE4:
	mov r1, sl
	ldr r0, [r1, #4]
	ldrb r0, [r0, #4]
	str r0, [sp, #8]
	mov r0, sl
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r9, r0
	movs r2, #0
	mov r8, r2
	adds r0, r5, #0
	adds r0, #0x4a
	str r0, [sp, #0x18]
	adds r1, r5, #0
	adds r1, #0x48
	str r1, [sp, #0x14]
	adds r2, r5, #0
	adds r2, #0x40
	str r2, [sp, #0xc]
	subs r0, #9
	str r0, [sp, #0x10]
	adds r3, r5, #0
	adds r3, #0x38
	adds r7, r5, #0
	adds r7, #0x32
	adds r6, r5, #0
	adds r6, #0x2c
_080CCE1E:
	ldr r1, [sp, #8]
	lsls r4, r1, #1
	add r4, r8
	ldr r2, _080CCE8C  @ gUnknown_0895DFA4
	adds r4, r4, r2
	ldrb r0, [r4]
	strh r0, [r6]
	ldrb r1, [r4]
	adds r0, r7, #0
	mov r2, r9
	str r3, [sp, #0x1c]
	bl sub_80CD570
	ldr r1, [sp, #0x18]
	add r1, r8
	strb r0, [r1]
	ldrb r0, [r4]
	bl GetClassData
	ldrh r0, [r0, #2]
	ldr r3, [sp, #0x1c]
	strh r0, [r3]
	adds r3, #2
	adds r7, #2
	adds r6, #2
	movs r0, #1
	add r8, r0
	mov r1, r8
	cmp r1, #1
	ble _080CCE1E
	mov r0, r9
	ldr r2, [sp, #0x14]
	strh r0, [r2]
	bl sub_80CCCA4
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080CCF02
	mov r1, sl
	ldr r0, [r1, #4]
	ldrb r0, [r0, #4]
	str r0, [sp, #8]
	cmp r0, #0x3e
	beq _080CCEB2
	cmp r0, #0x3e
	bgt _080CCE90
	cmp r0, #0x3d
	beq _080CCE98
	b _080CCF02
	.align 2, 0
_080CCE80: .4byte gBG0TilemapBuffer
_080CCE84: .4byte gBG1TilemapBuffer
_080CCE88: .4byte gBG2TilemapBuffer
_080CCE8C: .4byte gUnknown_0895DFA4
_080CCE90:
	ldr r2, [sp, #8]
	cmp r2, #0x47
	beq _080CCECC
	b _080CCF02
_080CCE98:
	movs r0, #0x7e
	strh r0, [r5, #0x30]
	adds r0, r5, #0
	adds r0, #0x36
	movs r1, #0x7e
	mov r2, r9
	bl sub_80CD570
	adds r1, r5, #0
	adds r1, #0x4c
	strb r0, [r1]
	movs r0, #0x7e
	b _080CCEE4
_080CCEB2:
	movs r0, #0x7f
	strh r0, [r5, #0x30]
	adds r0, r5, #0
	adds r0, #0x36
	movs r1, #0x7f
	mov r2, r9
	bl sub_80CD570
	adds r1, r5, #0
	adds r1, #0x4c
	strb r0, [r1]
	movs r0, #0x7f
	b _080CCEE4
_080CCECC:
	movs r0, #0x37
	strh r0, [r5, #0x30]
	adds r0, r5, #0
	adds r0, #0x36
	movs r1, #0x37
	mov r2, r9
	bl sub_80CD570
	adds r1, r5, #0
	adds r1, #0x4c
	strb r0, [r1]
	movs r0, #0x37
_080CCEE4:
	bl GetClassData
	ldrh r0, [r0, #2]
	strh r0, [r5, #0x3c]
	b _080CCF02
_080CCEEE:
	adds r4, #1
	adds r0, r5, #0
	adds r0, #0x40
	str r0, [sp, #0xc]
	adds r1, r5, #0
	adds r1, #0x41
	str r1, [sp, #0x10]
	cmp r4, #0x3f
	bgt _080CCF02
	b _080CCDC0
_080CCF02:
	ldrh r0, [r5, #0x32]
	cmp r0, #0
	bne _080CCF12
	ldrh r0, [r5, #0x34]
	cmp r0, #0
	bne _080CCF12
	strh r0, [r5, #0x34]
	strh r0, [r5, #0x32]
_080CCF12:
	movs r1, #0
	movs r0, #1
	ldr r2, [sp, #0xc]
	strb r0, [r2]
	ldr r0, [sp, #0x10]
	strb r1, [r0]
	adds r0, r5, #0
	ldr r1, [sp, #8]
	bl sub_80CCAAC
	adds r0, r5, #0
	bl sub_80CCB40
	bl LoadObjUIGfx
	adds r0, r5, #0
	bl Make6C_PromotionMenuSelect
	str r0, [r5, #0x54]
	ldr r1, [sp, #4]
	ldr r0, [r1, #0x14]
	adds r0, #0x31
	ldrb r0, [r0]
	cmp r0, #1
	bne _080CCF4E
	bl sub_8095A1C
	movs r0, #0xf
	bl BG_EnableSyncByMask
_080CCF4E:
	add sp, #0x20
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80CCD48

	THUMB_FUNC_START sub_80CCF60
sub_80CCF60: @ 0x080CCF60
	push {r4, lr}
	adds r4, r0, #0
	bl sub_8003D20
	bl Font_InitForUIDefault
	movs r0, #0xf
	bl BG_EnableSyncByMask
	movs r0, #0x80
	lsls r0, r0, #1
	movs r1, #2
	movs r2, #0
	bl sub_800680C
	adds r0, r4, #0
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #1
	adds r4, #0x38
	adds r4, r4, r0
	movs r1, #0
	ldrsh r0, [r4, r1]
	bl sub_80CCA64
	movs r0, #1
	negs r0, r0
	bl sub_8006AF0
	ldr r3, _080CD004  @ gLCDControlBuffer
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
	movs r0, #0xf
	bl BG_EnableSyncByMask
	ldr r3, _080CD008  @ 0x04000008
	ldrh r2, [r3]
	ldr r1, _080CD00C  @ 0x0000FFFC
	adds r0, r1, #0
	ands r0, r2
	adds r0, #1
	strh r0, [r3]
	adds r3, #2
	ldrh r2, [r3]
	adds r0, r1, #0
	ands r0, r2
	adds r0, #1
	strh r0, [r3]
	adds r3, #2
	ldrh r2, [r3]
	adds r0, r1, #0
	ands r0, r2
	adds r0, #1
	strh r0, [r3]
	ldr r2, _080CD010  @ 0x0400000E
	ldrh r0, [r2]
	ands r1, r0
	adds r1, #1
	strh r1, [r2]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080CD004: .4byte gLCDControlBuffer
_080CD008: .4byte 0x04000008
_080CD00C: .4byte 0x0000FFFC
_080CD010: .4byte 0x0400000E

	THUMB_FUNC_END sub_80CCF60

	THUMB_FUNC_START sub_80CD014
sub_80CD014: @ 0x080CD014
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x5c
	mov r9, r0
	ldr r0, _080CD06C  @ gUnknown_030053A0
	ldr r1, [r0, #0x14]
	str r1, [sp, #0x50]
	ldr r2, [r0, #0x18]
	str r2, [sp, #0x54]
	ldr r1, _080CD070  @ gUnknown_0201FADC
	ldr r7, [r1, #0x14]
	ldr r1, [r1, #0x18]
	mov sl, r1
	mov r3, r9
	adds r3, #0x40
	ldrb r1, [r3]
	adds r4, r0, #0
	cmp r1, #1
	beq _080CD042
	b _080CD164
_080CD042:
	ldrh r2, [r7, #0x32]
	movs r0, #0x32
	ldrsh r1, [r7, r0]
	ldr r0, _080CD074  @ 0x00000117
	cmp r1, r0
	bgt _080CD08C
	adds r0, r2, #0
	adds r0, #0xc
	strh r0, [r7, #0x32]
	mov r1, sl
	ldrh r0, [r1, #0x32]
	adds r0, #0xc
	strh r0, [r1, #0x32]
	ldr r2, [sp, #0x50]
	ldrh r0, [r2, #2]
	adds r0, #0xc
	strh r0, [r2, #2]
	ldr r3, [sp, #0x54]
	strh r0, [r3, #2]
	b _080CD090
	.align 2, 0
_080CD06C: .4byte gUnknown_030053A0
_080CD070: .4byte gUnknown_0201FADC
_080CD074: .4byte 0x00000117
_080CD078:
	ldr r0, _080CD088  @ gUnknown_0895EEA4
	adds r0, r2, r0
	ldrb r0, [r0]
	subs r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x58]
	b _080CD130
	.align 2, 0
_080CD088: .4byte gUnknown_0895EEA4
_080CD08C:
	movs r0, #2
	strb r0, [r3]
_080CD090:
	mov r0, r9
	adds r0, #0x40
	ldrb r0, [r0]
	cmp r0, #2
	beq _080CD09C
	b _080CD1AC
_080CD09C:
	bl sub_805A9E0
	ldr r0, _080CD198  @ gUnknown_030053A0
	bl sub_805AA28
	mov r1, r9
	adds r1, #0x42
	ldrh r4, [r1]
	subs r4, #1
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	movs r0, #0x41
	add r0, r9
	mov r8, r0
	ldrb r0, [r0]
	lsls r0, r0, #1
	mov r5, r9
	adds r5, #0x2c
	adds r0, r5, r0
	ldrh r6, [r0]
	ldr r2, _080CD19C  @ 0x0000FFFF
	str r2, [sp, #0x58]
	ldrh r0, [r1]
	bl GetUnitFromCharId
	adds r1, r0, #0
	add r0, sp, #4
	movs r2, #0x48
	bl memcpy
	mov r3, r8
	ldrb r0, [r3]
	lsls r0, r0, #1
	adds r5, r5, r0
	ldrh r0, [r5]
	bl GetClassData
	str r0, [sp, #8]
	ldr r5, [r0, #0x34]
	add r0, sp, #4
	bl GetUnitEquippedWeapon
	adds r2, r0, #0
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	add r3, sp, #0x4c
	add r0, sp, #4
	adds r1, r5, #0
	bl GetBattleAnimationId
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	movs r1, #0
	ldr r5, _080CD1A0  @ gUnknown_0895E0A4
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	lsls r0, r4, #3
	subs r3, r0, r4
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
_080CD116:
	lsls r0, r1, #0x10
	asrs r1, r0, #0x10
	adds r2, r1, r3
	adds r0, r2, r5
	ldrb r0, [r0]
	cmp r0, r6
	beq _080CD078
	adds r0, r1, #1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #6
	ble _080CD116
_080CD130:
	mov r1, r8
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	ldr r2, [sp, #0x58]
	lsls r1, r2, #0x10
	asrs r1, r1, #0x10
	ldrh r2, [r7, #0x32]
	adds r2, #0x28
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	movs r3, #6
	str r3, [sp]
	movs r3, #0x58
	bl sub_80CD47C
	ldr r0, _080CD1A4  @ gUnknown_0201FADC
	bl sub_805AE14
	mov r3, r9
	ldr r0, [r3, #0x50]
	movs r2, #0x32
	ldrsh r1, [r7, r2]
	movs r3, #0x3a
	ldrsh r2, [r7, r3]
	bl sub_80CD408
_080CD164:
	mov r1, r9
	adds r1, #0x40
	ldrb r0, [r1]
	ldr r4, _080CD198  @ gUnknown_030053A0
	cmp r0, #2
	bne _080CD1AC
	ldrh r2, [r7, #0x32]
	movs r3, #0x32
	ldrsh r0, [r7, r3]
	cmp r0, #0x82
	ble _080CD1A8
	movs r1, #0xc
	subs r0, r2, r1
	strh r0, [r7, #0x32]
	mov r2, sl
	ldrh r0, [r2, #0x32]
	subs r0, r0, r1
	strh r0, [r2, #0x32]
	ldr r3, [sp, #0x50]
	ldrh r0, [r3, #2]
	subs r0, r0, r1
	strh r0, [r3, #2]
	ldr r1, [sp, #0x54]
	strh r0, [r1, #2]
	b _080CD1AC
	.align 2, 0
_080CD198: .4byte gUnknown_030053A0
_080CD19C: .4byte 0x0000FFFF
_080CD1A0: .4byte gUnknown_0895E0A4
_080CD1A4: .4byte gUnknown_0201FADC
_080CD1A8:
	movs r0, #0
	strb r0, [r1]
_080CD1AC:
	adds r0, r4, #0
	bl sub_805A96C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080CD1BE
	adds r0, r4, #0
	bl sub_805A990
_080CD1BE:
	mov r0, r9
	bl sub_80CCB40
	add sp, #0x5c
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80CD014

	THUMB_FUNC_START sub_80CD1D4
sub_80CD1D4: @ 0x080CD1D4
	push {r4, r5, lr}
	ldr r4, [r0, #0x14]
	ldr r5, [r4, #0x14]
	adds r1, r5, #0
	adds r1, #0x31
	ldrb r1, [r1]
	cmp r1, #0
	beq _080CD208
	cmp r1, #1
	bne _080CD208
	bl Proc_End
	adds r0, r4, #0
	bl Proc_End
	adds r0, r5, #0
	bl Proc_End
	ldr r0, _080CD210  @ gUnknown_030053A0
	bl sub_805AA28
	ldr r0, _080CD214  @ gUnknown_0201FADC
	bl sub_805AE14
	bl sub_805A9E0
_080CD208:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080CD210: .4byte gUnknown_030053A0
_080CD214: .4byte gUnknown_0201FADC

	THUMB_FUNC_END sub_80CD1D4

	THUMB_FUNC_START sub_80CD218
sub_80CD218: @ 0x080CD218
	push {r4, r5, r6, lr}
	adds r1, r0, #0
	ldr r5, [r1, #0x14]
	ldr r4, [r5, #0x14]
	ldr r6, [r4, #0x14]
	adds r0, r4, #0
	adds r0, #0x31
	ldrb r0, [r0]
	cmp r0, #2
	bne _080CD27C
	adds r0, r1, #0
	bl Proc_End
	adds r0, r5, #0
	bl Proc_End
	adds r0, r4, #0
	bl Proc_End
	ldr r0, _080CD284  @ gUnknown_030053A0
	bl sub_805AA28
	ldr r0, _080CD288  @ gUnknown_0201FADC
	bl sub_805AE14
	bl sub_805A9E0
	ldr r1, _080CD28C  @ gActionData
	movs r0, #0
	strb r0, [r1, #0x11]
	adds r0, r6, #0
	movs r1, #2
	bl Proc_Goto
	bl BMapDispResume
	bl RefreshBMapGraphics
	bl RefreshEntityBmMaps
	bl RenderBmMap
	bl SMS_UpdateFromGameData
	bl MU_EndAll
	ldr r0, _080CD290  @ gActiveUnit
	ldr r0, [r0]
	bl MU_Create
_080CD27C:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080CD284: .4byte gUnknown_030053A0
_080CD288: .4byte gUnknown_0201FADC
_080CD28C: .4byte gActionData
_080CD290: .4byte gActiveUnit

	THUMB_FUNC_END sub_80CD218

	THUMB_FUNC_START sub_80CD294
sub_80CD294: @ 0x080CD294
	push {lr}
	adds r1, r0, #0
	ldr r0, [r1, #0x14]
	ldr r0, [r0, #0x14]
	adds r0, #0x31
	ldrb r0, [r0]
	cmp r0, #0
	bne _080CD2AE
	adds r0, r1, #0
	movs r1, #4
	bl Proc_Goto
	b _080CD2C6
_080CD2AE:
	cmp r0, #1
	bne _080CD2BA
	adds r0, r1, #0
	bl Proc_Break
	b _080CD2C6
_080CD2BA:
	cmp r0, #2
	bne _080CD2C6
	adds r0, r1, #0
	movs r1, #4
	bl Proc_Goto
_080CD2C6:
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80CD294

	THUMB_FUNC_START sub_80CD2CC
sub_80CD2CC: @ 0x080CD2CC
	push {lr}
	adds r1, r0, #0
	ldr r0, [r1, #0x14]
	ldr r0, [r0, #0x14]
	adds r0, #0x31
	ldrb r0, [r0]
	cmp r0, #0
	beq _080CD2E0
	cmp r0, #1
	bne _080CD2EA
_080CD2E0:
	adds r0, r1, #0
	movs r1, #5
	bl Proc_Goto
	b _080CD2F4
_080CD2EA:
	cmp r0, #2
	bne _080CD2F4
	adds r0, r1, #0
	bl Proc_Break
_080CD2F4:
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80CD2CC

	THUMB_FUNC_START sub_80CD2F8
sub_80CD2F8: @ 0x080CD2F8
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r4, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #1
	beq _080CD324
	cmp r0, #1
	bgt _080CD310
	cmp r0, #0
	beq _080CD314
	b _080CD328
_080CD310:
	cmp r0, #0xff
	bne _080CD328
_080CD314:
	adds r0, r5, #0
	bl Make6C_PromotionSub
	str r0, [r5, #0x34]
	adds r1, r4, #0
	adds r1, #0x29
	movs r0, #1
	strb r0, [r1]
_080CD324:
	movs r0, #0
	b _080CD32A
_080CD328:
	movs r0, #1
_080CD32A:
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80CD2F8

	THUMB_FUNC_START sub_80CD330
sub_80CD330: @ 0x080CD330
	push {lr}
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #0
	blt _080CD346
	cmp r0, #1
	ble _080CD346
	cmp r0, #2
	bne _080CD346
	movs r0, #0
	b _080CD348
_080CD346:
	movs r0, #1
_080CD348:
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80CD330

	THUMB_FUNC_START sub_80CD34C
sub_80CD34C: @ 0x080CD34C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	movs r0, #1
	movs r1, #0x10
	movs r2, #0x10
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	movs r4, #0
	str r4, [sp]
	movs r0, #0
	movs r1, #1
	movs r2, #0
	movs r3, #0
	bl sub_8001ED0
	movs r0, #1
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #1
	movs r3, #1
	bl sub_8001F0C
	ldr r0, _080CD404  @ gLCDControlBuffer
	mov ip, r0
	ldrb r0, [r0, #1]
	movs r6, #0x20
	orrs r0, r6
	movs r1, #0x41
	negs r1, r1
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	mov r1, ip
	strb r0, [r1, #1]
	mov r0, ip
	adds r0, #0x2d
	strb r4, [r0]
	adds r0, #4
	strb r4, [r0]
	adds r1, #0x2c
	movs r0, #0xf0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0xa0
	strb r0, [r1]
	movs r2, #0x34
	add r2, ip
	mov r8, r2
	ldrb r1, [r2]
	movs r2, #1
	orrs r1, r2
	movs r0, #2
	orrs r1, r0
	movs r5, #4
	orrs r1, r5
	movs r4, #8
	orrs r1, r4
	movs r3, #0x10
	orrs r1, r3
	mov r7, ip
	adds r7, #0x36
	ldrb r0, [r7]
	orrs r0, r2
	movs r2, #3
	negs r2, r2
	ands r0, r2
	orrs r0, r5
	orrs r0, r4
	orrs r0, r3
	orrs r1, r6
	mov r2, r8
	strb r1, [r2]
	movs r1, #0x21
	negs r1, r1
	ands r0, r1
	strb r0, [r7]
	mov r1, ip
	adds r1, #0x3d
	ldrb r0, [r1]
	orrs r0, r6
	strb r0, [r1]
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080CD404: .4byte gLCDControlBuffer

	THUMB_FUNC_END sub_80CD34C

	THUMB_FUNC_START sub_80CD408
sub_80CD408: @ 0x080CD408
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r5, r1, #0
	adds r6, r2, #0
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	lsls r6, r6, #0x10
	lsrs r6, r6, #0x10
	ldr r4, _080CD46C  @ gUnknown_0201FADC
	movs r2, #0
	strh r0, [r4]
	movs r1, #0xe
	strh r1, [r4, #2]
	movs r1, #0xe0
	lsls r1, r1, #2
	strh r1, [r4, #4]
	strh r0, [r4, #6]
	movs r0, #0xf
	strh r0, [r4, #8]
	movs r0, #0xf0
	lsls r0, r0, #2
	strh r0, [r4, #0xa]
	strh r2, [r4, #0xc]
	ldr r0, _080CD470  @ 0x0000FFFF
	strh r0, [r4, #0xe]
	ldr r0, _080CD474  @ 0x06010000
	str r0, [r4, #0x1c]
	ldr r0, _080CD478  @ gUnknown_020145C8
	str r0, [r4, #0x20]
	adds r0, r4, #0
	bl sub_805AA68
	lsls r5, r5, #0x10
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	asrs r1, r5, #0x10
	movs r0, #0xc0
	lsls r0, r0, #0xf
	adds r5, r5, r0
	asrs r5, r5, #0x10
	str r6, [sp]
	adds r0, r4, #0
	adds r2, r6, #0
	adds r3, r5, #0
	bl sub_805AE40
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080CD46C: .4byte gUnknown_0201FADC
_080CD470: .4byte 0x0000FFFF
_080CD474: .4byte 0x06010000
_080CD478: .4byte gUnknown_020145C8

	THUMB_FUNC_END sub_80CD408

	THUMB_FUNC_START sub_80CD47C
sub_80CD47C: @ 0x080CD47C
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	mov r8, r0
	mov r9, r1
	lsls r2, r2, #0x10
	lsrs r7, r2, #0x10
	lsls r3, r3, #0x10
	lsrs r6, r3, #0x10
	ldr r2, _080CD53C  @ gKeyStatusPtr
	ldr r0, [r2]
	ldrh r1, [r0, #4]
	movs r0, #0xc
	ands r0, r1
	cmp r0, #0
	beq _080CD4A4
	ldr r1, _080CD540  @ gUnknown_03005408
	movs r0, #0
	strh r0, [r1]
_080CD4A4:
	ldr r0, [r2]
	ldrh r1, [r0, #8]
	movs r5, #0x80
	lsls r5, r5, #2
	adds r0, r5, #0
	ands r0, r1
	cmp r0, #0
	beq _080CD4BC
	ldr r1, _080CD540  @ gUnknown_03005408
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
_080CD4BC:
	bl NewEfxAnimeDrvProc
	ldr r4, _080CD544  @ gUnknown_030053A0
	movs r2, #0
	movs r1, #0
	strh r7, [r4, #2]
	strh r6, [r4, #4]
	movs r3, #1
	strh r3, [r4, #0xc]
	mov r0, r8
	strh r0, [r4, #6]
	mov r0, r9
	strh r0, [r4, #8]
	ldr r0, [sp, #0x1c]
	strh r0, [r4, #0xa]
	strb r2, [r4, #1]
	strh r5, [r4, #0xe]
	movs r0, #0xa
	strh r0, [r4, #0x10]
	ldr r0, _080CD548  @ gUnknown_02000088
	str r0, [r4, #0x1c]
	ldr r0, _080CD54C  @ gUnknown_020041C8
	str r0, [r4, #0x24]
	ldr r0, _080CD550  @ gUnknown_02004088
	str r0, [r4, #0x20]
	ldr r0, _080CD554  @ gUnknown_0200F1C8
	str r0, [r4, #0x28]
	ldr r0, _080CD558  @ gUnknown_030053E0
	str r0, [r4, #0x30]
	movs r2, #4
	strh r2, [r0]
	strh r1, [r0, #2]
	strh r1, [r0, #4]
	strh r1, [r0, #6]
	strh r1, [r0, #8]
	movs r1, #0xc0
	lsls r1, r1, #2
	strh r1, [r0, #0xe]
	movs r1, #8
	strh r1, [r0, #0x10]
	strh r5, [r0, #0xa]
	strh r2, [r0, #0xc]
	strh r3, [r0, #0x12]
	ldr r1, _080CD55C  @ gBG1TilemapBuffer
	str r1, [r0, #0x14]
	ldr r1, _080CD560  @ gUnknown_02017790
	str r1, [r0, #0x18]
	ldr r1, _080CD564  @ gUnknown_02019790
	str r1, [r0, #0x1c]
	ldr r1, _080CD568  @ gUnknown_0201A790
	str r1, [r0, #0x20]
	ldr r1, _080CD56C  @ sub_80CD34C
	str r1, [r0, #0x24]
	bl sub_806E8F0
	adds r0, r4, #0
	bl sub_805AA00
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080CD53C: .4byte gKeyStatusPtr
_080CD540: .4byte gUnknown_03005408
_080CD544: .4byte gUnknown_030053A0
_080CD548: .4byte gUnknown_02000088
_080CD54C: .4byte gUnknown_020041C8
_080CD550: .4byte gUnknown_02004088
_080CD554: .4byte gUnknown_0200F1C8
_080CD558: .4byte gUnknown_030053E0
_080CD55C: .4byte gBG1TilemapBuffer
_080CD560: .4byte gUnknown_02017790
_080CD564: .4byte gUnknown_02019790
_080CD568: .4byte gUnknown_0201A790
_080CD56C: .4byte sub_80CD34C

	THUMB_FUNC_END sub_80CD47C

	THUMB_FUNC_START sub_80CD570
sub_80CD570: @ 0x080CD570
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	lsls r1, r1, #0x10
	lsrs r7, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r6, r2, #0x10
	adds r0, r7, #0
	bl GetClassData
	ldr r5, [r0, #0x34]
	adds r0, r6, #0
	bl GetItemType
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	movs r0, #0
	strh r0, [r4]
	movs r2, #0
	b _080CD5A2
_080CD59C:
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
_080CD5A2:
	lsls r0, r2, #2
	adds r1, r0, r5
	ldrh r0, [r1]
	cmp r0, r3
	bne _080CD5B2
	ldrh r0, [r1, #2]
	subs r0, #1
	strh r0, [r4]
_080CD5B2:
	ldrh r0, [r1, #2]
	cmp r0, #0
	bne _080CD59C
	movs r1, #0
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _080CD5E8
	ldr r3, _080CD5C8  @ 0x00000109
	movs r2, #0
	b _080CD5D2
	.align 2, 0
_080CD5C8: .4byte 0x00000109
_080CD5CC:
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
_080CD5D2:
	lsls r0, r2, #2
	adds r1, r0, r5
	ldrh r0, [r1]
	cmp r0, r3
	bne _080CD5E2
	ldrh r0, [r1, #2]
	subs r0, #1
	strh r0, [r4]
_080CD5E2:
	ldrh r0, [r1, #2]
	cmp r0, #0
	bne _080CD5CC
_080CD5E8:
	cmp r6, #0
	beq _080CD60C
	adds r0, r6, #0
	bl GetItemRequiredExp
	adds r4, r0, #0
	adds r0, r7, #0
	bl GetClassData
	adds r5, r0, #0
	adds r0, r6, #0
	bl GetItemType
	adds r5, #0x2c
	adds r5, r5, r0
	ldrb r5, [r5]
	cmp r4, r5
	bge _080CD610
_080CD60C:
	movs r0, #0
	b _080CD612
_080CD610:
	movs r0, #1
_080CD612:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80CD570

	THUMB_FUNC_START sub_80CD618
sub_80CD618: @ 0x080CD618
	push {lr}
	ldr r0, _080CD628  @ gUnknown_08B127EC
	movs r1, #3
	bl Proc_Start
	pop {r0}
	bx r0
	.align 2, 0
_080CD628: .4byte gUnknown_08B127EC

	THUMB_FUNC_END sub_80CD618

	THUMB_FUNC_START sub_80CD62C
sub_80CD62C: @ 0x080CD62C
	push {lr}
	bl BMapDispResume
	bl RefreshBMapGraphics
	bl RefreshEntityBmMaps
	bl MU_EndAll
	ldr r0, _080CD654  @ gActiveUnit
	ldr r0, [r0]
	bl MU_Create
	bl RenderBmMap
	bl SMS_UpdateFromGameData
	pop {r0}
	bx r0
	.align 2, 0
_080CD654: .4byte gActiveUnit

	THUMB_FUNC_END sub_80CD62C

	THUMB_FUNC_START sub_80CD658
sub_80CD658: @ 0x080CD658
	push {r4, lr}
	adds r4, r0, #0
	bl sub_80CD668
	str r0, [r4, #0x30]
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80CD658

	THUMB_FUNC_START sub_80CD668
sub_80CD668: @ 0x080CD668
	push {lr}
	adds r1, r0, #0
	ldr r0, _080CD678  @ gUnknown_08B1280C
	bl Proc_StartBlocking
	pop {r1}
	bx r1
	.align 2, 0
_080CD678: .4byte gUnknown_08B1280C

	THUMB_FUNC_END sub_80CD668

	THUMB_FUNC_START sub_80CD67C
sub_80CD67C: @ 0x080CD67C
	push {r4, r5, r6, lr}
	ldr r5, _080CD6A4  @ gUnknown_03004980
	ldr r4, [r5]
	ldrh r6, [r4, #0x34]
	movs r0, #0x34
	ldrsh r1, [r4, r0]
	movs r0, #0xa8
	lsls r0, r0, #1
	cmp r1, r0
	bgt _080CD6A8
	ldr r3, [r5, #4]
	ldr r2, [r5, #8]
	ldr r1, [r5, #0xc]
	adds r0, r6, #4
	strh r0, [r4, #0x34]
	strh r0, [r1, #0x34]
	strh r0, [r2, #0x34]
	strh r0, [r3, #0x34]
	movs r0, #1
	b _080CD6AA
	.align 2, 0
_080CD6A4: .4byte gUnknown_03004980
_080CD6A8:
	movs r0, #0
_080CD6AA:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80CD67C

	THUMB_FUNC_START sub_80CD6B0
sub_80CD6B0: @ 0x080CD6B0
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, [r4, #0x14]
	adds r0, #0x38
	ldrb r0, [r0]
	strh r0, [r4, #0x2a]
	ldrh r0, [r4, #0x2a]
	bl GetUnitFromCharId
	cmp r0, #0
	beq _080CD6D4
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	adds r0, r4, #0
	adds r0, #0x2e
	strb r1, [r0]
	b _080CD6DC
_080CD6D4:
	adds r1, r4, #0
	adds r1, #0x2e
	movs r0, #0
	strb r0, [r1]
_080CD6DC:
	bl ResetFaces
	bl Font_InitForUIDefault
	bl LoadUiFrameGraphics
	bl LoadObjUIGfx
	ldr r4, _080CD788  @ gLCDControlBuffer
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
	movs r5, #1
	orrs r1, r5
	strb r1, [r4, #0x14]
	ldrb r0, [r4, #0x18]
	movs r1, #3
	orrs r0, r1
	strb r0, [r4, #0x18]
	movs r0, #2
	bl BG_EnableSyncByMask
	bl sub_8095A1C
	ldr r0, _080CD78C  @ gBG2TilemapBuffer
	movs r1, #0
	bl BG_Fill
	movs r0, #0xf
	bl BG_EnableSyncByMask
	ldrb r0, [r4, #1]
	orrs r0, r5
	movs r1, #3
	negs r1, r1
	ands r0, r1
	subs r1, #2
	ands r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r4, #1]
	movs r0, #0x80
	lsls r0, r0, #2
	movs r1, #3
	movs r2, #1
	bl sub_800680C
	movs r0, #1
	movs r1, #0xe
	movs r2, #8
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
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080CD788: .4byte gLCDControlBuffer
_080CD78C: .4byte gBG2TilemapBuffer

	THUMB_FUNC_END sub_80CD6B0

	THUMB_FUNC_START sub_80CD790
sub_80CD790: @ 0x080CD790
	push {lr}
	ldr r0, [r0, #0x14]
	adds r0, #0x29
	movs r1, #0xff
	strb r1, [r0]
	bl sub_8010E50
	bl sub_8096C20
	bl APProc_DeleteAll
	bl EndBG3Slider_
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	movs r0, #4
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	movs r0, #8
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	movs r0, #0xf
	bl BG_EnableSyncByMask
	ldr r2, _080CD7F8  @ gLCDControlBuffer
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
	pop {r0}
	bx r0
	.align 2, 0
_080CD7F8: .4byte gLCDControlBuffer

	THUMB_FUNC_END sub_80CD790

	THUMB_FUNC_START sub_80CD7FC
sub_80CD7FC: @ 0x080CD7FC
	push {r4, r5, lr}
	sub sp, #0x1c
	adds r2, r0, #0
	add r1, sp, #0x10
	ldr r0, _080CD81C  @ gUnknown_0820707C
	ldm r0!, {r3, r4, r5}
	stm r1!, {r3, r4, r5}
	ldrh r0, [r2, #0x2a]
	cmp r0, #0x12
	beq _080CD820
	cmp r0, #0x12
	ble _080CD828
	cmp r0, #0x18
	beq _080CD824
	b _080CD828
	.align 2, 0
_080CD81C: .4byte gUnknown_0820707C
_080CD820:
	movs r5, #1
	b _080CD82A
_080CD824:
	movs r5, #2
	b _080CD82A
_080CD828:
	movs r5, #0
_080CD82A:
	adds r0, r2, #0
	adds r0, #0x2e
	ldrb r0, [r0]
	movs r4, #0
	str r4, [sp]
	movs r1, #0xd4
	movs r2, #0x50
	movs r3, #0x82
	bl sub_8007938
	lsls r0, r5, #2
	add r0, sp
	adds r0, #0x10
	ldr r0, [r0]
	str r0, [sp]
	ldr r0, _080CD88C  @ 0x06011800
	str r0, [sp, #4]
	movs r5, #1
	negs r5, r5
	str r5, [sp, #8]
	str r4, [sp, #0xc]
	movs r0, #0x16
	movs r1, #0x12
	movs r2, #0x12
	movs r3, #4
	bl sub_808F128
	movs r0, #0xa
	bl sub_808E9D8
	ldr r1, _080CD890  @ gUnknown_03004980
	ldr r2, [r1]
	movs r0, #0x82
	str r0, [r2, #0x30]
	ldr r3, [r1, #4]
	ldr r2, [r1, #8]
	ldr r1, [r1, #0xc]
	movs r0, #0x80
	lsls r0, r0, #7
	str r0, [r1, #0x30]
	str r0, [r2, #0x30]
	str r0, [r3, #0x30]
	ldr r0, _080CD894  @ gUnknown_03005398
	strb r5, [r0]
	add sp, #0x1c
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080CD88C: .4byte 0x06011800
_080CD890: .4byte gUnknown_03004980
_080CD894: .4byte gUnknown_03005398

	THUMB_FUNC_END sub_80CD7FC

	THUMB_FUNC_START sub_80CD898
sub_80CD898: @ 0x080CD898
	push {r4, r5, lr}
	sub sp, #0x1c
	add r2, sp, #0x10
	ldr r1, _080CD8B4  @ gUnknown_08207088
	ldm r1!, {r3, r4, r5}
	stm r2!, {r3, r4, r5}
	ldrh r0, [r0, #0x2a]
	cmp r0, #0x12
	beq _080CD8B8
	cmp r0, #0x12
	ble _080CD8C0
	cmp r0, #0x18
	beq _080CD8BC
	b _080CD8C0
	.align 2, 0
_080CD8B4: .4byte gUnknown_08207088
_080CD8B8:
	movs r0, #1
	b _080CD8C2
_080CD8BC:
	movs r0, #2
	b _080CD8C2
_080CD8C0:
	movs r0, #0
_080CD8C2:
	lsls r0, r0, #2
	add r0, sp
	adds r0, #0x10
	ldr r0, [r0]
	str r0, [sp]
	ldr r0, _080CD8F4  @ 0x06011800
	str r0, [sp, #4]
	movs r0, #1
	negs r0, r0
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	movs r0, #0x16
	movs r1, #0x12
	movs r2, #0x12
	movs r3, #4
	bl sub_808F128
	movs r0, #0xa
	bl sub_808E9D8
	add sp, #0x1c
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080CD8F4: .4byte 0x06011800

	THUMB_FUNC_END sub_80CD898

	THUMB_FUNC_START sub_80CD8F8
sub_80CD8F8: @ 0x080CD8F8
	push {r4, r5, lr}
	sub sp, #0x1c
	add r2, sp, #0x10
	ldr r1, _080CD914  @ gUnknown_08207094
	ldm r1!, {r3, r4, r5}
	stm r2!, {r3, r4, r5}
	ldrh r0, [r0, #0x2a]
	cmp r0, #0x12
	beq _080CD918
	cmp r0, #0x12
	ble _080CD920
	cmp r0, #0x18
	beq _080CD91C
	b _080CD920
	.align 2, 0
_080CD914: .4byte gUnknown_08207094
_080CD918:
	movs r0, #1
	b _080CD922
_080CD91C:
	movs r0, #2
	b _080CD922
_080CD920:
	movs r0, #0
_080CD922:
	lsls r0, r0, #2
	add r0, sp
	adds r0, #0x10
	ldr r0, [r0]
	str r0, [sp]
	ldr r0, _080CD954  @ 0x06011800
	str r0, [sp, #4]
	movs r0, #1
	negs r0, r0
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	movs r0, #0x16
	movs r1, #0x12
	movs r2, #0x12
	movs r3, #4
	bl sub_808F128
	movs r0, #0xa
	bl sub_808E9D8
	add sp, #0x1c
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080CD954: .4byte 0x06011800

	THUMB_FUNC_END sub_80CD8F8

	THUMB_FUNC_START sub_80CD958
sub_80CD958: @ 0x080CD958
	push {r4, r5, lr}
	sub sp, #0x1c
	add r2, sp, #0x10
	ldr r1, _080CD974  @ gUnknown_082070A0
	ldm r1!, {r3, r4, r5}
	stm r2!, {r3, r4, r5}
	ldrh r0, [r0, #0x2a]
	cmp r0, #0x12
	beq _080CD978
	cmp r0, #0x12
	ble _080CD980
	cmp r0, #0x18
	beq _080CD97C
	b _080CD980
	.align 2, 0
_080CD974: .4byte gUnknown_082070A0
_080CD978:
	movs r0, #1
	b _080CD982
_080CD97C:
	movs r0, #2
	b _080CD982
_080CD980:
	movs r0, #0
_080CD982:
	lsls r0, r0, #2
	add r0, sp
	adds r0, #0x10
	ldr r0, [r0]
	str r0, [sp]
	ldr r0, _080CD9B4  @ 0x06011800
	str r0, [sp, #4]
	movs r0, #1
	negs r0, r0
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	movs r0, #0x16
	movs r1, #0x12
	movs r2, #0x12
	movs r3, #4
	bl sub_808F128
	movs r0, #0xa
	bl sub_808E9D8
	add sp, #0x1c
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080CD9B4: .4byte 0x06011800

	THUMB_FUNC_END sub_80CD958

	THUMB_FUNC_START sub_80CD9B8
sub_80CD9B8: @ 0x080CD9B8
	push {r4, r5, lr}
	sub sp, #0x1c
	adds r2, r0, #0
	add r1, sp, #0x10
	ldr r0, _080CD9D8  @ gUnknown_082070AC
	ldm r0!, {r3, r4, r5}
	stm r1!, {r3, r4, r5}
	ldrh r0, [r2, #0x2a]
	cmp r0, #0x12
	beq _080CD9DC
	cmp r0, #0x12
	ble _080CD9E4
	cmp r0, #0x18
	beq _080CD9E0
	b _080CD9E4
	.align 2, 0
_080CD9D8: .4byte gUnknown_082070AC
_080CD9DC:
	movs r0, #1
	b _080CD9E6
_080CD9E0:
	movs r0, #2
	b _080CD9E6
_080CD9E4:
	movs r0, #0
_080CD9E6:
	lsls r0, r0, #2
	add r0, sp
	adds r0, #0x10
	ldr r0, [r0]
	movs r1, #1
	negs r1, r1
	cmp r0, r1
	bne _080CDA00
	adds r0, r2, #0
	movs r1, #3
	bl Proc_Goto
	b _080CDA1E
_080CDA00:
	str r0, [sp]
	ldr r0, _080CDA28  @ 0x06011800
	str r0, [sp, #4]
	str r1, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	movs r0, #0x16
	movs r1, #0x12
	movs r2, #0x12
	movs r3, #4
	bl sub_808F128
	movs r0, #0xa
	bl sub_808E9D8
_080CDA1E:
	add sp, #0x1c
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080CDA28: .4byte 0x06011800

	THUMB_FUNC_END sub_80CD9B8

	THUMB_FUNC_START sub_80CDA2C
sub_80CDA2C: @ 0x080CDA2C
	push {lr}
	bl sub_80CD658
	movs r0, #0
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80CDA2C

	THUMB_FUNC_START sub_80CDA38
sub_80CDA38: @ 0x080CDA38
	push {lr}
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #0xff
	beq _080CDA46
	movs r0, #1
	b _080CDA48
_080CDA46:
	movs r0, #0
_080CDA48:
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80CDA38

	THUMB_FUNC_START sub_80CDA4C
sub_80CDA4C: @ 0x080CDA4C
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r4, #0
	b _080CDA74
_080CDA54:
	lsls r1, r4, #2
	adds r0, r5, #0
	adds r0, #0x34
	adds r0, r0, r1
	ldr r1, [r0]
	ldr r0, [r1, #0x30]
	ldr r0, [r0, #0x10]
	cmp r0, #0
	bne _080CDA70
	adds r0, r1, #0
	adds r0, #0x34
	movs r1, #0
	bl Text_SetXCursor
_080CDA70:
	adds r4, #1
	adds r0, r5, #0
_080CDA74:
	adds r0, #0x60
	ldrb r0, [r0]
	cmp r4, r0
	blt _080CDA54
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80CDA4C

	THUMB_FUNC_START sub_80CDA84
sub_80CDA84: @ 0x080CDA84
	push {lr}
	bl SyncMenuBgs
	movs r0, #0
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80CDA84

	THUMB_FUNC_START sub_80CDA90
sub_80CDA90: @ 0x080CDA90
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080CDACC  @ gUnknown_02022DB8
	movs r1, #0xa
	movs r2, #6
	movs r3, #0
	bl TileMap_FillRect
	ldr r0, _080CDAD0  @ gUnknown_02023DB8
	movs r1, #0xa
	movs r2, #6
	movs r3, #0
	bl TileMap_FillRect
	ldr r0, _080CDAD4  @ gUnknown_03005380
	bl SetFont
	ldr r0, [r4, #0x14]
	bl sub_80CDA4C
	ldr r0, [r4, #0x14]
	bl RedrawMenu
	adds r0, r4, #0
	bl SyncMenuBgs
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080CDACC: .4byte gUnknown_02022DB8
_080CDAD0: .4byte gUnknown_02023DB8
_080CDAD4: .4byte gUnknown_03005380

	THUMB_FUNC_END sub_80CDA90

	THUMB_FUNC_START sub_80CDAD8
sub_80CDAD8: @ 0x080CDAD8
	push {r4, lr}
	adds r4, r0, #0
	adds r1, #0x3c
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bne _080CDB0A
	adds r0, r4, #0
	bl EndMenu
	ldr r0, [r4, #0x14]
	bl EndMenu
	ldr r0, _080CDB14  @ gUnknown_08B12614
	bl Proc_Find
	adds r4, r0, #0
	bl sub_80ADDD4
	bl sub_80CCBD4
	adds r0, r4, #0
	movs r1, #5
	bl Proc_Goto
_080CDB0A:
	movs r0, #7
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080CDB14: .4byte gUnknown_08B12614

	THUMB_FUNC_END sub_80CDAD8

	THUMB_FUNC_START sub_80CDB18
sub_80CDB18: @ 0x080CDB18
	movs r0, #0xb
	bx lr

	THUMB_FUNC_END sub_80CDB18

	THUMB_FUNC_START sub_80CDB1C
sub_80CDB1C: @ 0x080CDB1C
	push {lr}
	bl SyncMenuBgs
	movs r0, #0
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80CDB1C

	THUMB_FUNC_START sub_80CDB28
sub_80CDB28: @ 0x080CDB28
	push {lr}
	bl SyncMenuBgs
	movs r0, #0
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80CDB28

	THUMB_FUNC_START PromotionCommand_OnSelect
PromotionCommand_OnSelect: @ 0x080CDB34
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r7, r0, #0
	adds r6, r1, #0
	ldr r0, [r7, #0x14]
	ldr r0, [r0, #0x14]
	ldr r4, [r0, #0x14]
	adds r0, #0x40
	ldrb r0, [r0]
	cmp r0, #0
	bne _080CDBFA
	adds r0, r4, #0
	adds r0, #0x38
	ldrb r0, [r0]
	bl GetUnitFromCharId
	adds r5, r0, #0
	ldr r0, [r5, #4]
	ldrb r1, [r0, #4]
	adds r3, r6, #0
	adds r3, #0x3c
	movs r0, #0
	ldrsb r0, [r3, r0]
	cmp r0, #1
	bgt _080CDB78
	ldr r2, _080CDB74  @ gUnknown_0895DFA4
	lsls r1, r1, #1
	adds r0, r0, r1
	adds r0, r0, r2
	ldrb r1, [r0]
	b _080CDBA6
	.align 2, 0
_080CDB74: .4byte gUnknown_0895DFA4
_080CDB78:
	adds r2, r4, #0
	adds r2, #0x3b
	cmp r0, #2
	bne _080CDBAE
	cmp r1, #0x3e
	beq _080CDB9A
	cmp r1, #0x3e
	bgt _080CDB8E
	cmp r1, #0x3d
	beq _080CDB94
	b _080CDBA6
_080CDB8E:
	cmp r1, #0x47
	beq _080CDBA0
	b _080CDBA6
_080CDB94:
	movs r0, #0x7e
	strb r0, [r2]
	b _080CDBAE
_080CDB9A:
	movs r0, #0x7f
	strb r0, [r2]
	b _080CDBAE
_080CDBA0:
	movs r0, #0x37
	strb r0, [r2]
	b _080CDBAE
_080CDBA6:
	adds r0, r4, #0
	adds r0, #0x3b
	strb r1, [r0]
	adds r2, r0, #0
_080CDBAE:
	ldrb r0, [r2]
	cmp r0, #0x1e
	bgt _080CDBCA
	cmp r0, #0x1d
	blt _080CDBCA
	ldr r0, [r5, #0xc]
	movs r1, #0x80
	lsls r1, r1, #4
	ands r0, r1
	cmp r0, #0
	beq _080CDBCA
	adds r0, r5, #0
	bl TryRemoveUnitFromBallista
_080CDBCA:
	ldr r0, _080CDC04  @ gUnknown_03005360
	ldr r1, _080CDC08  @ 0x06001000
	movs r2, #0x80
	movs r3, #5
	bl Font_InitForUI
	ldr r0, _080CDC0C  @ gUnknown_02022DBA
	movs r1, #0xa
	movs r2, #6
	movs r3, #0
	bl TileMap_FillRect
	movs r0, #1
	bl BG_EnableSyncByMask
	ldr r0, _080CDC10  @ gUnknown_08B12930
	movs r1, #0
	str r1, [sp]
	str r7, [sp, #4]
	movs r1, #2
	movs r2, #0
	movs r3, #0
	bl StartMenuExt
_080CDBFA:
	movs r0, #0
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080CDC04: .4byte gUnknown_03005360
_080CDC08: .4byte 0x06001000
_080CDC0C: .4byte gUnknown_02022DBA
_080CDC10: .4byte gUnknown_08B12930

	THUMB_FUNC_END PromotionCommand_OnSelect

	THUMB_FUNC_START sub_80CDC14
sub_80CDC14: @ 0x080CDC14
	push {r4, lr}
	ldr r1, [r0, #0x14]
	ldr r4, [r1, #0x14]
	ldr r0, [r4, #0x14]
	ldr r0, [r0, #0x14]
	adds r0, #0x31
	ldrb r0, [r0]
	cmp r0, #0
	beq _080CDC2E
	cmp r0, #1
	beq _080CDC32
	cmp r0, #2
	beq _080CDC32
_080CDC2E:
	movs r0, #0
	b _080CDC42
_080CDC32:
	adds r0, r1, #0
	bl Proc_End
	adds r0, r4, #0
	movs r1, #2
	bl Proc_Goto
	movs r0, #0xb
_080CDC42:
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80CDC14

	THUMB_FUNC_START sub_80CDC48
sub_80CDC48: @ 0x080CDC48
	push {r4, r5, r6, r7, lr}
	sub sp, #0x20
	adds r7, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	ldr r1, [r5, #0x30]
	ldrb r0, [r1, #8]
	cmp r0, #0
	beq _080CDC64
	adds r0, r5, #0
	adds r0, #0x34
	ldrb r1, [r1, #8]
	bl Text_SetColorId
_080CDC64:
	adds r0, r5, #0
	adds r0, #0x3d
	ldrb r0, [r0]
	adds r4, r5, #0
	adds r4, #0x34
	cmp r0, #2
	bne _080CDC7A
	adds r0, r4, #0
	movs r1, #1
	bl Text_SetColorId
_080CDC7A:
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0x14
	bl sub_8003E00
	adds r0, r4, #0
	movs r1, #8
	bl Text_SetXCursor
	adds r0, r4, #0
	adds r1, r6, #0
	bl Text_AppendString
	adds r0, r7, #0
	adds r0, #0x64
	ldrb r0, [r0]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1e
	bl BG_GetMapBuffer
	adds r1, r0, #0
	movs r2, #0x2c
	ldrsh r0, [r5, r2]
	lsls r0, r0, #5
	movs r3, #0x2a
	ldrsh r2, [r5, r3]
	adds r0, r0, r2
	lsls r0, r0, #1
	adds r1, r1, r0
	adds r0, r4, #0
	bl Text_Draw
	add sp, #0x20
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80CDC48

	THUMB_FUNC_START PromotionCommand_OnTextDraw
PromotionCommand_OnTextDraw: @ 0x080CDCC4
	push {r4, r5, lr}
	sub sp, #0x48
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, [r4, #0x14]
	ldr r1, [r0, #0x14]
	adds r0, r5, #0
	adds r0, #0x3c
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #1
	adds r1, #0x2c
	adds r1, r1, r0
	ldrh r0, [r1]
	bl GetClassData
	ldrh r0, [r0]
	bl GetStringFromIndex
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_80CDC48
	add sp, #0x48
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END PromotionCommand_OnTextDraw

	THUMB_FUNC_START PromotionCommand_OnChange
PromotionCommand_OnChange: @ 0x080CDD00
	push {lr}
	ldr r0, [r0, #0x14]
	ldr r3, [r0, #0x14]
	adds r2, r3, #0
	adds r2, #0x40
	movs r0, #1
	strb r0, [r2]
	adds r1, #0x3c
	ldrb r0, [r1]
	adds r1, r3, #0
	adds r1, #0x41
	strb r0, [r1]
	ldrb r1, [r1]
	lsls r1, r1, #1
	adds r0, r3, #0
	adds r0, #0x38
	adds r0, r0, r1
	movs r1, #0
	ldrsh r0, [r0, r1]
	bl sub_80CCA64
	movs r0, #1
	negs r0, r0
	bl sub_8006AF0
	pop {r1}
	bx r1

	THUMB_FUNC_END PromotionCommand_OnChange

	THUMB_FUNC_START Usability_ThirdPromotionOption
Usability_ThirdPromotionOption: @ 0x080CDD38
	push {r4, lr}
	ldr r0, _080CDD6C  @ gUnknown_08B12A08
	bl Proc_Find
	ldr r0, [r0, #0x14]
	ldr r4, [r0, #0x14]
	bl sub_80CCCA4
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080CDD70
	adds r0, r4, #0
	adds r0, #0x38
	ldrb r0, [r0]
	bl GetUnitFromCharId
	ldr r0, [r0, #4]
	ldrb r0, [r0, #4]
	cmp r0, #0x3d
	blt _080CDD70
	cmp r0, #0x3e
	ble _080CDD68
	cmp r0, #0x47
	bne _080CDD70
_080CDD68:
	movs r0, #1
	b _080CDD72
	.align 2, 0
_080CDD6C: .4byte gUnknown_08B12A08
_080CDD70:
	movs r0, #3
_080CDD72:
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END Usability_ThirdPromotionOption

	THUMB_FUNC_START sub_80CDD78
sub_80CDD78: @ 0x080CDD78
	push {r4, r5, r6, lr}
	sub sp, #0xc
	adds r6, r0, #0
	adds r0, #0x4c
	movs r5, #0
	strb r5, [r0]
	bl sub_8003D20
	bl Font_InitForUIDefault
	movs r0, #0
	bl SetFontGlyphSet
	ldr r4, _080CDDC4  @ gUnknown_03005380
	ldr r1, _080CDDC8  @ 0x06001400
	adds r0, r4, #0
	movs r2, #0xa0
	movs r3, #5
	bl Font_InitForUI
	adds r0, r4, #0
	bl SetFont
	ldr r0, _080CDDCC  @ gUnknown_08B129E4
	ldr r1, _080CDDD0  @ gUnknown_08B12A60
	ldr r1, [r1]
	str r5, [sp]
	str r5, [sp, #4]
	str r6, [sp, #8]
	movs r2, #2
	movs r3, #0
	bl StartMenuCore
	str r0, [r6, #0x50]
	add sp, #0xc
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080CDDC4: .4byte gUnknown_03005380
_080CDDC8: .4byte 0x06001400
_080CDDCC: .4byte gUnknown_08B129E4
_080CDDD0: .4byte gUnknown_08B12A60

	THUMB_FUNC_END sub_80CDD78

	THUMB_FUNC_START sub_80CDDD4
sub_80CDDD4: @ 0x080CDDD4
	bx lr

	THUMB_FUNC_END sub_80CDDD4

	THUMB_FUNC_START nullsub_61
nullsub_61: @ 0x080CDDD8
	bx lr

	THUMB_FUNC_END nullsub_61

	THUMB_FUNC_START Make6C_PromotionMenuSelect
Make6C_PromotionMenuSelect: @ 0x080CDDDC
	push {lr}
	adds r1, r0, #0
	ldr r0, _080CDDEC  @ gUnknown_08B12A08
	bl Proc_Start
	pop {r1}
	bx r1
	.align 2, 0
_080CDDEC: .4byte gUnknown_08B12A08

	THUMB_FUNC_END Make6C_PromotionMenuSelect

	THUMB_FUNC_START sub_80CDDF0
sub_80CDDF0: @ 0x080CDDF0
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	ldr r5, [r4, #0x14]
	ldr r7, [r5, #0x14]
	adds r0, r5, #0
	adds r0, #0x38
	ldrb r0, [r0]
	bl GetUnitFromCharId
	adds r6, r0, #0
	cmp r6, #0
	bne _080CDE10
	adds r0, r4, #0
	bl Proc_End
	b _080CDE6A
_080CDE10:
	bl GetThread2SkipStack
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r1, r4, #0
	adds r1, #0x4c
	strh r0, [r1]
	ldr r2, _080CDE58  @ gLCDControlBuffer
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
	adds r0, r5, #0
	adds r0, #0x3b
	ldrb r1, [r0]
	movs r2, #1
	negs r2, r2
	adds r0, r6, #0
	movs r3, #0
	bl sub_802F664
	adds r0, r7, #0
	adds r0, #0x31
	ldrb r0, [r0]
	cmp r0, #2
	beq _080CDE60
	ldr r1, _080CDE5C  @ gBattleStats
	movs r0, #0x88
	lsls r0, r0, #1
	b _080CDE64
	.align 2, 0
_080CDE58: .4byte gLCDControlBuffer
_080CDE5C: .4byte gBattleStats
_080CDE60:
	ldr r1, _080CDE70  @ gBattleStats
	movs r0, #0x10
_080CDE64:
	strh r0, [r1]
	bl BeginBattleAnimations
_080CDE6A:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080CDE70: .4byte gBattleStats

	THUMB_FUNC_END sub_80CDDF0

	THUMB_FUNC_START sub_80CDE74
sub_80CDE74: @ 0x080CDE74
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r0, #0x4c
	movs r1, #0
	ldrsh r4, [r0, r1]
	bl GetThread2SkipStack
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r4, r0
	bne _080CDE90
	adds r0, r5, #0
	bl Proc_Break
_080CDE90:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80CDE74

	THUMB_FUNC_START sub_80CDE98
sub_80CDE98: @ 0x080CDE98
	push {lr}
	ldr r0, [r0, #0x14]
	adds r0, #0x38
	ldrb r0, [r0]
	bl GetUnitFromCharId
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80CDE98

	THUMB_FUNC_START sub_80CDEA8
sub_80CDEA8: @ 0x080CDEA8
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r5, [r4, #0x14]
	ldr r1, _080CDF40  @ gUnknown_03005398
	movs r2, #1
	negs r2, r2
	adds r0, r2, #0
	strb r0, [r1]
	bl sub_808F270
	bl sub_8010E50
	bl APProc_DeleteAll
	bl EndBG3Slider_
	ldr r3, _080CDF44  @ gLCDControlBuffer
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
	ldr r0, _080CDF48  @ gUnknown_08B12A64
	adds r1, r4, #0
	bl Proc_StartBlocking
	adds r0, r5, #0
	adds r0, #0x31
	ldrb r0, [r0]
	cmp r0, #0
	beq _080CDF38
	ldr r1, [r5, #0x3c]
	movs r0, #1
	negs r0, r0
	cmp r1, r0
	beq _080CDF38
	ldr r0, [r5, #0x38]
	bl UnitUpdateUsedItem
_080CDF38:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080CDF40: .4byte gUnknown_03005398
_080CDF44: .4byte gLCDControlBuffer
_080CDF48: .4byte gUnknown_08B12A64

	THUMB_FUNC_END sub_80CDEA8

	THUMB_FUNC_START sub_80CDF4C
sub_80CDF4C: @ 0x080CDF4C
	push {r4, lr}
	ldr r4, _080CDF5C  @ gUnknown_08B19E0C
_080CDF50:
	ldrb r0, [r4]
	cmp r0, #0xc
	bne _080CDF60
	movs r0, #1
	b _080CDF72
	.align 2, 0
_080CDF5C: .4byte gUnknown_08B19E0C
_080CDF60:
	ldrh r0, [r4, #6]
	bl CheckEventId
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080CDF70
	adds r4, #0xc
	b _080CDF50
_080CDF70:
	movs r0, #0
_080CDF72:
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80CDF4C

	THUMB_FUNC_START sub_80CDF78
sub_80CDF78: @ 0x080CDF78
	push {lr}
	movs r0, #0xe0
	movs r1, #3
	bl sub_80B53BC
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80CDF78

	THUMB_FUNC_START sub_80CDF88
sub_80CDF88: @ 0x080CDF88
	push {r4, r5, lr}
	sub sp, #4
	bl GetGameClock
	ldr r3, _080CE014  @ gUnknown_08B12AA8
	movs r4, #0x80
	lsls r4, r4, #6
	str r4, [sp]
	movs r0, #3
	movs r1, #0x10
	movs r2, #8
	bl PutSprite
	ldr r5, _080CE018  @ gUnknown_08B12AA4
	ldr r0, [r5]
	adds r0, #0x2f
	ldrb r0, [r0]
	cmp r0, #0
	bne _080CDFBC
	ldr r3, _080CE01C  @ gUnknown_08B12AC2
	str r4, [sp]
	movs r0, #3
	movs r1, #0xb0
	movs r2, #3
	bl PutSprite
_080CDFBC:
	ldr r3, _080CE020  @ gUnknown_08B12AD0
	str r4, [sp]
	movs r0, #3
	movs r1, #0xb0
	movs r2, #0xf
	bl PutSprite
	ldr r2, [r5]
	adds r0, r2, #0
	adds r0, #0x29
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r1, r2, #0
	adds r1, #0x2a
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	subs r0, r0, r1
	lsls r0, r0, #1
	adds r3, r0, #5
	adds r0, r2, #0
	adds r0, #0x2b
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r1, r2, #0
	adds r1, #0x2c
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	subs r0, r0, r1
	lsls r0, r0, #1
	adds r4, r0, #5
	adds r0, r2, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	cmp r0, #1
	beq _080CE0B8
	cmp r0, #1
	bgt _080CE024
	cmp r0, #0
	beq _080CE02A
	b _080CE11A
	.align 2, 0
_080CE014: .4byte gUnknown_08B12AA8
_080CE018: .4byte gUnknown_08B12AA4
_080CE01C: .4byte gUnknown_08B12AC2
_080CE020: .4byte gUnknown_08B12AD0
_080CE024:
	cmp r0, #2
	beq _080CE0CA
	b _080CE11A
_080CE02A:
	lsls r1, r3, #3
	movs r0, #0xc
	bl DisplayUiHand
	ldr r1, [r5]
	adds r0, r1, #0
	adds r0, #0x30
	ldrb r0, [r0]
	cmp r0, #0
	beq _080CE04A
	adds r0, r1, #0
	adds r0, #0x3c
	ldrb r0, [r0]
	cmp r0, #6
	bgt _080CE054
	b _080CE11A
_080CE04A:
	adds r0, r1, #0
	adds r0, #0x3d
	ldrb r0, [r0]
	cmp r0, #6
	ble _080CE11A
_080CE054:
	ldr r4, _080CE090  @ gUnknown_08B12AA4
	ldr r0, [r4]
	adds r0, #0x2a
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _080CE070
	ldr r2, _080CE094  @ 0x000030E0
	movs r0, #0x20
	movs r1, #0x20
	movs r3, #1
	bl sub_80B53F8
_080CE070:
	ldr r1, [r4]
	adds r0, r1, #0
	adds r0, #0x2a
	movs r2, #0
	ldrsb r2, [r0, r2]
	adds r0, #6
	ldrb r0, [r0]
	cmp r0, #0
	beq _080CE098
	adds r0, r1, #0
	adds r0, #0x3c
	ldrb r0, [r0]
	subs r0, #6
	cmp r2, r0
	blt _080CE0A4
	b _080CE11A
	.align 2, 0
_080CE090: .4byte gUnknown_08B12AA4
_080CE094: .4byte 0x000030E0
_080CE098:
	adds r0, r1, #0
	adds r0, #0x3d
	ldrb r0, [r0]
	subs r0, #6
	cmp r2, r0
	bge _080CE11A
_080CE0A4:
	ldr r2, _080CE0B4  @ 0x000030E0
	movs r0, #0x20
	movs r1, #0x88
	movs r3, #0
	bl sub_80B53F8
	b _080CE11A
	.align 2, 0
_080CE0B4: .4byte 0x000030E0
_080CE0B8:
	lsls r1, r3, #3
	movs r0, #0xc
	bl DisplayFrozenUiHand
	lsls r1, r4, #3
	movs r0, #0x50
	bl DisplayUiHand
	b _080CE11A
_080CE0CA:
	lsls r1, r3, #3
	movs r0, #0xc
	bl DisplayFrozenUiHand
	ldr r1, [r5]
	adds r0, r1, #0
	adds r0, #0x3f
	ldrb r0, [r0]
	cmp r0, #4
	bls _080CE11A
	adds r0, r1, #0
	adds r0, #0x2e
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _080CE0F8
	ldr r2, _080CE140  @ 0x000030E0
	movs r0, #0x90
	movs r1, #0x38
	movs r3, #1
	bl sub_80B53F8
_080CE0F8:
	ldr r0, [r5]
	adds r1, r0, #0
	adds r1, #0x2e
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, #0x3f
	ldrb r0, [r0]
	subs r0, #4
	cmp r1, r0
	bge _080CE11A
	ldr r2, _080CE140  @ 0x000030E0
	movs r0, #0x90
	movs r1, #0x80
	movs r3, #0
	bl sub_80B53F8
_080CE11A:
	ldr r0, _080CE144  @ gUnknown_08B12AA4
	ldr r0, [r0]
	adds r1, r0, #0
	adds r1, #0x2c
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	lsls r1, r1, #4
	adds r0, #0x3e
	ldrb r2, [r0]
	movs r0, #0xa
	movs r3, #6
	bl sub_80976CC
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080CE140: .4byte 0x000030E0
_080CE144: .4byte gUnknown_08B12AA4

	THUMB_FUNC_END sub_80CDF88

	THUMB_FUNC_START sub_80CE148
sub_80CE148: @ 0x080CE148
	push {r4, lr}
	sub sp, #8
	ldr r4, _080CE1B0  @ gUnknown_08B12AA4
	ldr r1, [r4]
	adds r0, r1, #0
	adds r0, #0x30
	ldrb r0, [r0]
	cmp r0, #0
	bne _080CE1A8
	adds r0, r1, #0
	adds r0, #0xec
	bl Text_Clear
	ldr r0, _080CE1B4  @ 0x000005D4
	bl GetStringFromIndex
	adds r3, r0, #0
	ldr r0, [r4]
	adds r0, #0xec
	ldr r1, _080CE1B8  @ gUnknown_02023130
	movs r2, #0x16
	str r2, [sp]
	str r3, [sp, #4]
	movs r2, #0
	movs r3, #0
	bl DrawTextInline
	ldr r0, [r4]
	adds r4, r0, #0
	adds r4, #0xec
	ldr r2, _080CE1BC  @ gUnknown_08B12B04
	adds r1, r0, #0
	adds r1, #0x29
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, #0x54
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	bl GetStringFromIndex
	adds r1, r0, #0
	adds r0, r4, #0
	bl Text_AppendString
_080CE1A8:
	add sp, #8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080CE1B0: .4byte gUnknown_08B12AA4
_080CE1B4: .4byte 0x000005D4
_080CE1B8: .4byte gUnknown_02023130
_080CE1BC: .4byte gUnknown_08B12B04

	THUMB_FUNC_END sub_80CE148

	THUMB_FUNC_START sub_80CE1C0
sub_80CE1C0: @ 0x080CE1C0
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r5, r0, #0
	adds r6, r1, #0
	adds r7, r2, #0
	ldr r4, _080CE1F8  @ gUnknown_08B12AA4
	lsls r1, r6, #3
	adds r1, #0x7c
	ldr r0, [r4]
	adds r0, r0, r1
	bl Text_Clear
	ldr r4, [r4]
	adds r0, r4, #0
	adds r0, #0x30
	ldrb r0, [r0]
	cmp r0, #0
	beq _080CE200
	ldr r1, _080CE1FC  @ gUnknown_08B12AE0
	adds r0, r4, #0
	adds r0, #0x40
	adds r0, r0, r5
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	b _080CE210
	.align 2, 0
_080CE1F8: .4byte gUnknown_08B12AA4
_080CE1FC: .4byte gUnknown_08B12AE0
_080CE200:
	ldr r1, _080CE23C  @ gUnknown_08B12B04
	adds r0, r4, #0
	adds r0, #0x54
	adds r0, r0, r5
	ldrb r0, [r0]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
_080CE210:
	bl GetStringFromIndex
	adds r3, r0, #0
	ldr r0, _080CE240  @ gUnknown_08B12AA4
	lsls r1, r6, #3
	adds r1, #0x7c
	ldr r0, [r0]
	adds r0, r0, r1
	lsls r1, r7, #6
	ldr r2, _080CE244  @ gUnknown_020234AC
	adds r1, r1, r2
	movs r2, #9
	str r2, [sp]
	str r3, [sp, #4]
	movs r2, #0
	movs r3, #0
	bl DrawTextInline
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080CE23C: .4byte gUnknown_08B12B04
_080CE240: .4byte gUnknown_08B12AA4
_080CE244: .4byte gUnknown_020234AC

	THUMB_FUNC_END sub_80CE1C0

	THUMB_FUNC_START sub_80CE248
sub_80CE248: @ 0x080CE248
	push {r4, r5, r6, lr}
	ldr r0, _080CE260  @ gUnknown_08B12AA4
	ldr r1, [r0]
	adds r0, r1, #0
	adds r0, #0x30
	ldrb r0, [r0]
	cmp r0, #0
	beq _080CE264
	adds r0, r1, #0
	adds r0, #0x3c
	b _080CE268
	.align 2, 0
_080CE260: .4byte gUnknown_08B12AA4
_080CE264:
	adds r0, r1, #0
	adds r0, #0x3d
_080CE268:
	ldrb r6, [r0]
	movs r4, #0
	movs r5, #5
_080CE26E:
	cmp r4, r6
	bge _080CE27C
	adds r0, r4, #0
	adds r1, r4, #0
	adds r2, r5, #0
	bl sub_80CE1C0
_080CE27C:
	adds r5, #2
	adds r4, #1
	cmp r4, #5
	ble _080CE26E
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80CE248

	THUMB_FUNC_START sub_80CE28C
sub_80CE28C: @ 0x080CE28C
	push {r4, r5, lr}
	movs r0, #0xa0
	movs r2, #0
	ldr r5, _080CE2D8  @ gBG1TilemapBuffer
	movs r4, #0
_080CE296:
	movs r1, #0
	adds r3, r0, #0
	adds r3, #0x20
	adds r2, #1
	adds r0, #1
	lsls r0, r0, #1
	adds r0, r0, r5
_080CE2A4:
	strh r4, [r0]
	adds r0, #2
	adds r1, #1
	cmp r1, #0x1b
	ble _080CE2A4
	adds r0, r3, #0
	cmp r2, #0xb
	ble _080CE296
	ldr r0, _080CE2DC  @ gBG0TilemapBuffer
	movs r3, #0
	ldr r1, _080CE2E0  @ 0x000004C2
	adds r2, r0, r1
	subs r1, #0x40
	adds r0, r0, r1
	movs r1, #0x1b
_080CE2C2:
	strh r3, [r0]
	strh r3, [r2]
	adds r2, #2
	adds r0, #2
	subs r1, #1
	cmp r1, #0
	bge _080CE2C2
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080CE2D8: .4byte gBG1TilemapBuffer
_080CE2DC: .4byte gBG0TilemapBuffer
_080CE2E0: .4byte 0x000004C2

	THUMB_FUNC_END sub_80CE28C

	THUMB_FUNC_START sub_80CE2E4
sub_80CE2E4: @ 0x080CE2E4
	push {lr}
	movs r0, #2
	bl BG_EnableSyncByMask
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80CE2E4

	THUMB_FUNC_START sub_80CE2F0
sub_80CE2F0: @ 0x080CE2F0
	push {lr}
	movs r0, #3
	bl BG_EnableSyncByMask
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80CE2F0

	THUMB_FUNC_START sub_80CE2FC
sub_80CE2FC: @ 0x080CE2FC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	ldr r4, [r0, #0x34]
	adds r0, r4, #0
	movs r1, #6
	bl __modsi3
	ldr r5, _080CE37C  @ gUnknown_08B12AA4
	lsls r0, r0, #3
	adds r6, r0, #0
	adds r6, #0xb4
	ldr r0, [r5]
	adds r0, r0, r6
	bl Text_Clear
	ldr r0, _080CE380  @ gUnknown_08B19E0C
	mov r8, r0
	ldr r0, [r5]
	adds r0, #0x68
	adds r0, r0, r4
	ldrb r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	add r0, r8
	ldrh r0, [r0, #8]
	bl CheckEventId
	lsls r0, r0, #0x18
	movs r7, #0
	cmp r0, #0
	bne _080CE342
	movs r7, #4
_080CE342:
	ldr r0, [r5]
	adds r0, #0x68
	adds r0, r0, r4
	ldrb r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	add r0, r8
	ldrh r0, [r0, #2]
	bl GetStringFromIndex
	adds r3, r0, #0
	ldr r0, [r5]
	adds r0, r0, r6
	ldr r1, _080CE384  @ gUnknown_020235FE
	movs r2, #0x12
	str r2, [sp]
	str r3, [sp, #4]
	adds r2, r7, #0
	movs r3, #0
	bl DrawTextInline
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080CE37C: .4byte gUnknown_08B12AA4
_080CE380: .4byte gUnknown_08B19E0C
_080CE384: .4byte gUnknown_020235FE

	THUMB_FUNC_END sub_80CE2FC

	THUMB_FUNC_START sub_80CE388
sub_80CE388: @ 0x080CE388
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	ldr r4, [r0, #0x34]
	adds r0, r4, #0
	movs r1, #6
	bl __modsi3
	ldr r5, _080CE408  @ gUnknown_08B12AA4
	lsls r0, r0, #3
	adds r6, r0, #0
	adds r6, #0xb4
	ldr r0, [r5]
	adds r0, r0, r6
	bl Text_Clear
	ldr r0, _080CE40C  @ gUnknown_08B19E0C
	mov r8, r0
	ldr r0, [r5]
	adds r0, #0x68
	adds r0, r0, r4
	ldrb r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	add r0, r8
	ldrh r0, [r0, #8]
	bl CheckEventId
	lsls r0, r0, #0x18
	movs r7, #0
	cmp r0, #0
	bne _080CE3CE
	movs r7, #4
_080CE3CE:
	ldr r0, [r5]
	adds r0, #0x68
	adds r0, r0, r4
	ldrb r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	add r0, r8
	ldrh r0, [r0, #2]
	bl GetStringFromIndex
	adds r3, r0, #0
	ldr r0, [r5]
	adds r0, r0, r6
	ldr r1, _080CE410  @ gUnknown_0202387E
	movs r2, #0x12
	str r2, [sp]
	str r3, [sp, #4]
	adds r2, r7, #0
	movs r3, #0
	bl DrawTextInline
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080CE408: .4byte gUnknown_08B12AA4
_080CE40C: .4byte gUnknown_08B19E0C
_080CE410: .4byte gUnknown_0202387E

	THUMB_FUNC_END sub_80CE388

	THUMB_FUNC_START sub_80CE414
sub_80CE414: @ 0x080CE414
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	movs r0, #5
	str r0, [sp, #8]
	movs r5, #0
	mov r8, r5
	ldr r0, _080CE47C  @ gUnknown_08B12AA4
	ldr r0, [r0]
	adds r0, #0x3e
	mov r1, r8
	strb r1, [r0]
	ldr r1, _080CE480  @ gUnknown_08B19E0C
	ldrb r0, [r1]
	cmp r0, #0xc
	beq _080CE4B8
	movs r6, #0
_080CE43C:
	adds r4, r6, r1
	ldrh r0, [r4, #6]
	bl CheckEventId
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080CE4A8
	ldr r0, _080CE47C  @ gUnknown_08B12AA4
	ldr r2, [r0]
	adds r0, r2, #0
	adds r0, #0x30
	ldrb r0, [r0]
	cmp r0, #0
	beq _080CE484
	adds r0, r2, #0
	adds r0, #0x29
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r1, r2, #0
	adds r1, #0x40
	adds r1, r1, r0
	ldrb r0, [r4, #1]
	ldrb r1, [r1]
	cmp r0, r1
	bne _080CE4A8
	adds r0, r2, #0
	adds r0, #0x68
	adds r0, r0, r5
	mov r2, r8
	strb r2, [r0]
	b _080CE4A6
	.align 2, 0
_080CE47C: .4byte gUnknown_08B12AA4
_080CE480: .4byte gUnknown_08B19E0C
_080CE484:
	adds r0, r2, #0
	adds r0, #0x29
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r1, r2, #0
	adds r1, #0x54
	adds r1, r1, r0
	ldrb r0, [r4]
	ldrb r1, [r1]
	cmp r0, r1
	bne _080CE4A8
	adds r0, r2, #0
	adds r0, #0x68
	adds r0, r0, r5
	mov r1, r8
	strb r1, [r0]
_080CE4A6:
	adds r5, #1
_080CE4A8:
	adds r6, #0xc
	movs r2, #1
	add r8, r2
	ldr r1, _080CE57C  @ gUnknown_08B19E0C
	adds r0, r6, r1
	ldrb r0, [r0]
	cmp r0, #0xc
	bne _080CE43C
_080CE4B8:
	ldr r1, _080CE580  @ gUnknown_08B12AA4
	ldr r0, [r1]
	adds r0, #0x3e
	strb r5, [r0]
	lsls r0, r5, #0x18
	lsrs r6, r0, #0x18
	ldr r0, [r1]
	adds r0, #0x2c
	movs r4, #0
	ldrsb r4, [r0, r4]
	adds r5, r4, #0
	movs r0, #0
	mov r8, r0
	cmp r6, #0
	beq _080CE56C
	mov sl, r1
_080CE4D8:
	adds r0, r5, #0
	movs r1, #6
	bl __modsi3
	adds r5, r0, #0
	lsls r0, r5, #3
	adds r7, r0, #0
	adds r7, #0xb4
	mov r1, sl
	ldr r0, [r1]
	adds r0, r0, r7
	bl Text_Clear
	mov r2, sl
	ldr r0, [r2]
	adds r0, #0x68
	adds r0, r0, r4
	ldrb r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _080CE57C  @ gUnknown_08B19E0C
	adds r0, r0, r1
	ldrh r0, [r0, #8]
	bl CheckEventId
	lsls r0, r0, #0x18
	movs r2, #0
	mov r9, r2
	cmp r0, #0
	bne _080CE51A
	movs r0, #4
	mov r9, r0
_080CE51A:
	mov r1, sl
	ldr r0, [r1]
	adds r0, #0x68
	adds r0, r0, r4
	ldrb r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r2, _080CE57C  @ gUnknown_08B19E0C
	adds r0, r0, r2
	ldrh r0, [r0, #2]
	bl GetStringFromIndex
	adds r3, r0, #0
	mov r1, sl
	ldr r0, [r1]
	adds r0, r0, r7
	ldr r2, [sp, #8]
	lsls r1, r2, #6
	ldr r2, _080CE584  @ gUnknown_020234BE
	adds r1, r1, r2
	movs r2, #0x12
	str r2, [sp]
	str r3, [sp, #4]
	mov r2, r9
	movs r3, #0
	bl DrawTextInline
	ldr r0, [sp, #8]
	adds r0, #2
	str r0, [sp, #8]
	adds r5, #1
	subs r6, #1
	adds r4, #1
	movs r1, #1
	add r8, r1
	mov r2, r8
	cmp r2, #5
	bgt _080CE56C
	cmp r6, #0
	bne _080CE4D8
_080CE56C:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080CE57C: .4byte gUnknown_08B19E0C
_080CE580: .4byte gUnknown_08B12AA4
_080CE584: .4byte gUnknown_020234BE

	THUMB_FUNC_END sub_80CE414

	THUMB_FUNC_START sub_80CE588
sub_80CE588: @ 0x080CE588
	push {r4, r5, lr}
	movs r0, #0xa0
	movs r1, #0
	ldr r5, _080CE5B8  @ gBG1TilemapBuffer
	movs r4, #0
_080CE592:
	adds r2, r0, #0
	adds r2, #0x20
	adds r3, r1, #1
	adds r0, #0xa
	movs r1, #0x12
	lsls r0, r0, #1
	adds r0, r0, r5
_080CE5A0:
	strh r4, [r0]
	adds r0, #2
	subs r1, #1
	cmp r1, #0
	bge _080CE5A0
	adds r0, r2, #0
	adds r1, r3, #0
	cmp r1, #0xb
	ble _080CE592
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080CE5B8: .4byte gBG1TilemapBuffer

	THUMB_FUNC_END sub_80CE588

	THUMB_FUNC_START sub_80CE5BC
sub_80CE5BC: @ 0x080CE5BC
	push {lr}
	sub sp, #4
	adds r1, r0, #0
	cmp r1, #0
	beq _080CE5DA
	ldrb r0, [r1]
	cmp r0, #0
	beq _080CE5DA
_080CE5CC:
	ldrb r0, [r1]
	cmp r0, #0
	beq _080CE5DA
	cmp r0, #1
	bne _080CE5DE
	adds r0, r1, #1
	b _080CE5EA
_080CE5DA:
	movs r0, #0
	b _080CE5EA
_080CE5DE:
	adds r0, r1, #0
	mov r1, sp
	bl GetCharTextWidth
	adds r1, r0, #0
	b _080CE5CC
_080CE5EA:
	add sp, #4
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80CE5BC

	THUMB_FUNC_START sub_80CE5F0
sub_80CE5F0: @ 0x080CE5F0
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	sub sp, #8
	mov r8, r0
	adds r5, r1, #0
	movs r4, #1
	ldr r0, _080CE618  @ gUnknown_08B19E0C
	mov r2, r8
	lsls r1, r2, #1
	add r1, r8
	lsls r1, r1, #2
	adds r1, r1, r0
	ldrh r0, [r1, #4]
	bl GetStringFromIndex
	adds r6, r0, #0
	b _080CE61E
	.align 2, 0
_080CE618: .4byte gUnknown_08B19E0C
_080CE61C:
	adds r4, #1
_080CE61E:
	adds r0, r6, #0
	bl sub_80CE5BC
	adds r6, r0, #0
	cmp r6, #0
	bne _080CE61C
	ldr r0, _080CE654  @ gUnknown_08B12AA4
	ldr r1, [r0]
	adds r1, #0x3f
	strb r4, [r1]
	ldr r1, [r0]
	adds r1, #0x2e
	movs r7, #0
	ldrsb r7, [r1, r7]
	cmp r5, #0
	beq _080CE672
	cmp r4, #4
	ble _080CE660
	cmp r5, #1
	bne _080CE658
	subs r1, r4, #4
	adds r7, #4
	cmp r7, r1
	ble _080CE660
	adds r7, r1, #0
	b _080CE660
	.align 2, 0
_080CE654: .4byte gUnknown_08B12AA4
_080CE658:
	subs r7, #4
	cmp r7, #0
	bge _080CE660
	movs r7, #0
_080CE660:
	cmp r5, #0
	beq _080CE672
	ldr r0, [r0]
	adds r0, #0x2e
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, r7
	beq _080CE73A
_080CE672:
	bl sub_80CE588
	ldr r5, _080CE6C0  @ gUnknown_08B12AA4
	ldr r0, [r5]
	adds r0, #0x2e
	strb r7, [r0]
	ldr r0, [r5]
	adds r0, #0xb4
	bl Text_Clear
	ldr r0, _080CE6C4  @ gUnknown_08B19E0C
	mov r1, r8
	lsls r4, r1, #1
	add r4, r8
	lsls r4, r4, #2
	adds r4, r4, r0
	ldrh r0, [r4, #2]
	bl GetStringFromIndex
	adds r3, r0, #0
	ldr r0, [r5]
	adds r0, #0xb4
	ldr r1, _080CE6C8  @ gUnknown_020235FC
	movs r2, #0x12
	str r2, [sp]
	str r3, [sp, #4]
	movs r2, #3
	movs r3, #2
	bl DrawTextInline
	ldrh r0, [r4, #4]
	bl GetStringFromIndex
	adds r6, r0, #0
	movs r2, #0
	mov r8, r2
	adds r0, r7, #4
	mov r9, r0
	b _080CE71E
	.align 2, 0
_080CE6C0: .4byte gUnknown_08B12AA4
_080CE6C4: .4byte gUnknown_08B19E0C
_080CE6C8: .4byte gUnknown_020235FC
_080CE6CC:
	cmp r8, r7
	blt _080CE71A
	mov r0, r8
	movs r1, #5
	bl __modsi3
	adds r4, r0, #0
	ldr r5, _080CE748  @ gUnknown_08B12AA4
	lsls r4, r4, #3
	adds r4, #0xbc
	ldr r0, [r5]
	adds r0, r0, r4
	bl Text_Clear
	ldr r0, [r5]
	adds r2, r0, r4
	mov r1, r8
	subs r0, r1, r7
	adds r1, r0, #0
	cmp r0, #0
	bge _080CE6F8
	adds r1, r0, #3
_080CE6F8:
	asrs r1, r1, #2
	lsls r1, r1, #2
	subs r1, r0, r1
	lsls r1, r1, #7
	movs r0, #0x80
	lsls r0, r0, #2
	adds r1, r1, r0
	ldr r0, _080CE74C  @ gUnknown_020234BE
	adds r1, r1, r0
	movs r0, #0x11
	str r0, [sp]
	str r6, [sp, #4]
	adds r0, r2, #0
	movs r2, #0
	movs r3, #0
	bl DrawTextInline
_080CE71A:
	movs r1, #1
	add r8, r1
_080CE71E:
	cmp r8, r9
	bge _080CE734
	mov r2, r8
	cmp r2, #0
	beq _080CE6CC
	adds r0, r6, #0
	bl sub_80CE5BC
	adds r6, r0, #0
	cmp r6, #0
	bne _080CE6CC
_080CE734:
	movs r0, #2
	bl BG_EnableSyncByMask
_080CE73A:
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080CE748: .4byte gUnknown_08B12AA4
_080CE74C: .4byte gUnknown_020234BE

	THUMB_FUNC_END sub_80CE5F0

	THUMB_FUNC_START sub_80CE750
sub_80CE750: @ 0x080CE750
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	mov r8, r0
	mov r9, r1
	movs r4, #0xd0
	lsls r4, r4, #1
	ldr r0, _080CE774  @ gUnknown_08B12AA4
	ldr r0, [r0]
	adds r0, #0x2f
	ldrb r0, [r0]
	cmp r0, #0
	beq _080CE778
	cmp r0, #1
	beq _080CE7DC
	b _080CE83A
	.align 2, 0
_080CE774: .4byte gUnknown_08B12AA4
_080CE778:
	movs r0, #0
	ldr r7, _080CE7D8  @ gBG1TilemapBuffer
_080CE77C:
	movs r1, #0x40
	negs r1, r1
	adds r1, r1, r4
	mov ip, r1
	adds r6, r0, #1
	adds r3, r4, #0
	adds r3, #0x22
	adds r2, r4, #0
	adds r2, #0x62
	adds r1, r4, #2
	adds r0, r4, #0
	adds r0, #0x42
	movs r5, #7
	lsls r0, r0, #1
	adds r4, r0, r7
	lsls r1, r1, #1
	adds r1, r1, r7
	lsls r2, r2, #1
	adds r2, r2, r7
	lsls r3, r3, #1
	adds r3, r3, r7
_080CE7A6:
	ldrh r0, [r1]
	strh r0, [r4]
	ldrh r0, [r3]
	strh r0, [r2]
	adds r3, #2
	adds r2, #2
	adds r1, #2
	adds r4, #2
	subs r5, #1
	cmp r5, #0
	bge _080CE7A6
	mov r4, ip
	adds r0, r6, #0
	cmp r0, #4
	ble _080CE77C
	mov r0, r9
	movs r1, #6
	bl __modsi3
	adds r1, r0, #0
	mov r0, r9
	movs r2, #5
	bl sub_80CE1C0
	b _080CE83A
	.align 2, 0
_080CE7D8: .4byte gBG1TilemapBuffer
_080CE7DC:
	movs r0, #0
	ldr r1, _080CE850  @ gUnknown_08B12BEC
	mov sl, r1
	ldr r7, _080CE854  @ gBG1TilemapBuffer
_080CE7E4:
	movs r1, #0x40
	negs r1, r1
	adds r1, r1, r4
	mov ip, r1
	adds r6, r0, #1
	adds r3, r4, #0
	adds r3, #0x2a
	adds r2, r4, #0
	adds r2, #0x6a
	adds r1, r4, #0
	adds r1, #0xa
	adds r0, r4, #0
	adds r0, #0x4a
	movs r5, #0x12
	lsls r0, r0, #1
	adds r4, r0, r7
	lsls r1, r1, #1
	adds r1, r1, r7
	lsls r2, r2, #1
	adds r2, r2, r7
	lsls r3, r3, #1
	adds r3, r3, r7
_080CE810:
	ldrh r0, [r1]
	strh r0, [r4]
	ldrh r0, [r3]
	strh r0, [r2]
	adds r3, #2
	adds r2, #2
	adds r1, #2
	adds r4, #2
	subs r5, #1
	cmp r5, #0
	bge _080CE810
	mov r4, ip
	adds r0, r6, #0
	cmp r0, #4
	ble _080CE7E4
	mov r0, sl
	mov r1, r8
	bl Proc_Start
	mov r1, r9
	str r1, [r0, #0x34]
_080CE83A:
	movs r0, #2
	bl BG_EnableSyncByMask
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080CE850: .4byte gUnknown_08B12BEC
_080CE854: .4byte gBG1TilemapBuffer

	THUMB_FUNC_END sub_80CE750

	THUMB_FUNC_START sub_80CE858
sub_80CE858: @ 0x080CE858
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	mov r8, r0
	mov r9, r1
	movs r4, #0xa0
	ldr r0, _080CE87C  @ gUnknown_08B12AA4
	ldr r0, [r0]
	adds r0, #0x2f
	ldrb r0, [r0]
	cmp r0, #0
	beq _080CE880
	cmp r0, #1
	beq _080CE8E4
	b _080CE940
	.align 2, 0
_080CE87C: .4byte gUnknown_08B12AA4
_080CE880:
	movs r0, #0
	ldr r7, _080CE8E0  @ gBG1TilemapBuffer
_080CE884:
	movs r1, #0x40
	adds r1, r1, r4
	mov ip, r1
	adds r6, r0, #1
	adds r3, r4, #0
	adds r3, #0x62
	adds r2, r4, #0
	adds r2, #0x22
	adds r1, r4, #0
	adds r1, #0x42
	adds r0, r4, #2
	movs r5, #7
	lsls r0, r0, #1
	adds r4, r0, r7
	lsls r1, r1, #1
	adds r1, r1, r7
	lsls r2, r2, #1
	adds r2, r2, r7
	lsls r3, r3, #1
	adds r3, r3, r7
_080CE8AC:
	ldrh r0, [r1]
	strh r0, [r4]
	ldrh r0, [r3]
	strh r0, [r2]
	adds r3, #2
	adds r2, #2
	adds r1, #2
	adds r4, #2
	subs r5, #1
	cmp r5, #0
	bge _080CE8AC
	mov r4, ip
	adds r0, r6, #0
	cmp r0, #4
	ble _080CE884
	mov r0, r9
	movs r1, #6
	bl __modsi3
	adds r1, r0, #0
	mov r0, r9
	movs r2, #0xf
	bl sub_80CE1C0
	b _080CE940
	.align 2, 0
_080CE8E0: .4byte gBG1TilemapBuffer
_080CE8E4:
	movs r0, #0
	ldr r1, _080CE954  @ gUnknown_08B12C14
	mov sl, r1
	ldr r7, _080CE958  @ gBG1TilemapBuffer
_080CE8EC:
	movs r1, #0x40
	adds r1, r1, r4
	mov ip, r1
	adds r6, r0, #1
	adds r3, r4, #0
	adds r3, #0x6a
	adds r2, r4, #0
	adds r2, #0x2a
	adds r1, r4, #0
	adds r1, #0x4a
	adds r0, r4, #0
	adds r0, #0xa
	movs r5, #0x12
	lsls r0, r0, #1
	adds r4, r0, r7
	lsls r1, r1, #1
	adds r1, r1, r7
	lsls r2, r2, #1
	adds r2, r2, r7
	lsls r3, r3, #1
	adds r3, r3, r7
_080CE916:
	ldrh r0, [r1]
	strh r0, [r4]
	ldrh r0, [r3]
	strh r0, [r2]
	adds r3, #2
	adds r2, #2
	adds r1, #2
	adds r4, #2
	subs r5, #1
	cmp r5, #0
	bge _080CE916
	mov r4, ip
	adds r0, r6, #0
	cmp r0, #4
	ble _080CE8EC
	mov r0, sl
	mov r1, r8
	bl Proc_Start
	mov r1, r9
	str r1, [r0, #0x34]
_080CE940:
	movs r0, #2
	bl BG_EnableSyncByMask
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080CE954: .4byte gUnknown_08B12C14
_080CE958: .4byte gBG1TilemapBuffer

	THUMB_FUNC_END sub_80CE858

	THUMB_FUNC_START sub_80CE95C
sub_80CE95C: @ 0x080CE95C
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r7, r0, #0
	ldr r5, [r7, #0x34]
	adds r0, r5, #0
	movs r1, #5
	bl __modsi3
	adds r4, r0, #0
	ldr r2, _080CE998  @ gUnknown_08B19E0C
	ldr r0, _080CE99C  @ gUnknown_08B12AA4
	ldr r0, [r0]
	adds r1, r0, #0
	adds r1, #0x2b
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, #0x68
	adds r0, r0, r1
	ldrb r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrh r0, [r0, #4]
	bl GetStringFromIndex
	adds r6, r0, #0
	b _080CE9A2
	.align 2, 0
_080CE998: .4byte gUnknown_08B19E0C
_080CE99C: .4byte gUnknown_08B12AA4
_080CE9A0:
	subs r5, #1
_080CE9A2:
	cmp r5, #0
	beq _080CE9B2
	adds r0, r6, #0
	bl sub_80CE5BC
	adds r6, r0, #0
	cmp r6, #0
	bne _080CE9A0
_080CE9B2:
	ldr r5, _080CE9E0  @ gUnknown_08B12AA4
	lsls r4, r4, #3
	adds r4, #0xbc
	ldr r0, [r5]
	adds r0, r0, r4
	bl Text_Clear
	ldr r0, [r5]
	adds r0, r0, r4
	ldr r1, _080CE9E4  @ gUnknown_0202393E
	movs r2, #0x11
	str r2, [sp]
	str r6, [sp, #4]
	movs r2, #0
	movs r3, #0
	bl DrawTextInline
	movs r0, #0
	str r0, [r7, #0x34]
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080CE9E0: .4byte gUnknown_08B12AA4
_080CE9E4: .4byte gUnknown_0202393E

	THUMB_FUNC_END sub_80CE95C

	THUMB_FUNC_START sub_80CE9E8
sub_80CE9E8: @ 0x080CE9E8
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	ldr r0, [r7, #0x38]
	cmp r0, #0
	bne _080CEA60
	movs r3, #0xe0
	lsls r3, r3, #1
	movs r6, #0x98
	lsls r6, r6, #2
	movs r0, #0
	ldr r5, _080CEA5C  @ gBG1TilemapBuffer
_080CE9FE:
	movs r1, #0x20
	negs r1, r1
	adds r1, r1, r3
	mov ip, r1
	adds r4, r0, #1
	adds r1, r3, #0
	adds r1, #0xa
	adds r0, r3, #0
	adds r0, #0x2a
	movs r3, #0x12
	lsls r0, r0, #1
	adds r2, r0, r5
	lsls r1, r1, #1
	adds r1, r1, r5
_080CEA1A:
	ldrh r0, [r1]
	strh r0, [r2]
	adds r1, #2
	adds r2, #2
	subs r3, #1
	cmp r3, #0
	bge _080CEA1A
	mov r3, ip
	adds r0, r4, #0
	cmp r0, #6
	ble _080CE9FE
	ldr r0, [r7, #0x34]
	cmp r0, #0
	beq _080CEA38
	subs r6, #0x20
_080CEA38:
	ldr r2, _080CEA5C  @ gBG1TilemapBuffer
	adds r1, r6, #0
	adds r1, #0xa
	adds r0, r3, #0
	adds r0, #0x2a
	movs r3, #0x12
	lsls r0, r0, #1
	adds r4, r0, r2
	lsls r1, r1, #1
	adds r1, r1, r2
_080CEA4C:
	ldrh r0, [r1]
	strh r0, [r4]
	adds r1, #2
	adds r4, #2
	subs r3, #1
	cmp r3, #0
	bge _080CEA4C
	b _080CEAC6
	.align 2, 0
_080CEA5C: .4byte gBG1TilemapBuffer
_080CEA60:
	movs r3, #0x80
	lsls r3, r3, #1
	movs r6, #0x88
	lsls r6, r6, #2
	movs r0, #0
	ldr r5, _080CEAD8  @ gBG1TilemapBuffer
_080CEA6C:
	adds r4, r0, #1
	movs r0, #0x20
	adds r0, r0, r3
	mov ip, r0
	adds r1, r3, #0
	adds r1, #0x2a
	adds r0, r3, #0
	adds r0, #0xa
	movs r3, #0x12
	lsls r0, r0, #1
	adds r2, r0, r5
	lsls r1, r1, #1
	adds r1, r1, r5
_080CEA86:
	ldrh r0, [r1]
	strh r0, [r2]
	adds r1, #2
	adds r2, #2
	subs r3, #1
	cmp r3, #0
	bge _080CEA86
	mov r3, ip
	adds r0, r4, #0
	cmp r0, #6
	ble _080CEA6C
	ldr r0, [r7, #0x34]
	cmp r0, #0
	beq _080CEAA4
	adds r6, #0x20
_080CEAA4:
	ldr r2, _080CEAD8  @ gBG1TilemapBuffer
	adds r1, r6, #0
	adds r1, #0x2a
	adds r0, r3, #0
	adds r0, #0xa
	movs r3, #0x12
	lsls r0, r0, #1
	adds r4, r0, r2
	lsls r1, r1, #1
	adds r1, r1, r2
_080CEAB8:
	ldrh r0, [r1]
	strh r0, [r4]
	adds r1, #2
	adds r4, #2
	subs r3, #1
	cmp r3, #0
	bge _080CEAB8
_080CEAC6:
	movs r0, #2
	bl BG_EnableSyncByMask
	ldr r0, [r7, #0x34]
	cmp r0, #0
	bne _080CEADC
	movs r0, #1
	str r0, [r7, #0x34]
	b _080CEAE2
	.align 2, 0
_080CEAD8: .4byte gBG1TilemapBuffer
_080CEADC:
	adds r0, r7, #0
	bl Proc_Break
_080CEAE2:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80CE9E8

	THUMB_FUNC_START sub_80CEAE8
sub_80CEAE8: @ 0x080CEAE8
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	movs r5, #0
	ldr r3, _080CEB5C  @ gUnknown_08B19E0C
	movs r1, #0
	ldr r2, _080CEB60  @ gUnknown_08B12AA4
_080CEAF4:
	mov r4, sp
	adds r0, r4, r5
	strb r1, [r0]
	ldr r0, [r2]
	adds r0, #0x54
	adds r0, r0, r5
	strb r1, [r0]
	adds r5, #1
	cmp r5, #0x13
	ble _080CEAF4
	ldrb r4, [r3]
	cmp r4, #0xc
	beq _080CEB2A
	adds r5, r3, #0
_080CEB10:
	ldrh r0, [r5, #6]
	bl CheckEventId
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080CEB22
	mov r1, sp
	adds r0, r1, r4
	strb r4, [r0]
_080CEB22:
	adds r5, #0xc
	ldrb r4, [r5]
	cmp r4, #0xc
	bne _080CEB10
_080CEB2A:
	ldr r0, _080CEB60  @ gUnknown_08B12AA4
	ldr r1, [r0]
	adds r1, #0x3d
	movs r2, #0
	strb r2, [r1]
	movs r5, #0
	adds r6, r0, #0
	adds r7, r6, #0
_080CEB3A:
	mov r4, sp
	adds r0, r4, r5
	ldrb r4, [r0]
	cmp r4, #0
	beq _080CEB94
	ldr r1, [r6]
	adds r2, r1, #0
	adds r2, #0x3d
	ldrb r0, [r2]
	cmp r0, #0
	bne _080CEB64
	adds r0, r1, #0
	adds r0, #0x54
	strb r4, [r0]
	ldr r1, [r7]
	b _080CEB8C
	.align 2, 0
_080CEB5C: .4byte gUnknown_08B19E0C
_080CEB60: .4byte gUnknown_08B12AA4
_080CEB64:
	movs r3, #0
	ldrb r2, [r2]
	cmp r3, r2
	bge _080CEB78
	adds r0, r1, #0
	adds r0, #0x54
	ldrb r0, [r0]
	cmp r0, r4
	bne _080CEB78
	movs r3, #1
_080CEB78:
	cmp r3, #0
	bne _080CEB94
	ldr r0, [r6]
	adds r1, r0, #0
	adds r1, #0x3d
	adds r0, #0x54
	ldrb r1, [r1]
	adds r0, r0, r1
	strb r4, [r0]
	ldr r1, [r6]
_080CEB8C:
	adds r1, #0x3d
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
_080CEB94:
	adds r5, #1
	cmp r5, #0xb
	ble _080CEB3A
	add sp, #0x14
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80CEAE8

	THUMB_FUNC_START sub_80CEBA4
sub_80CEBA4: @ 0x080CEBA4
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	movs r5, #0
	ldr r6, _080CEC20  @ gUnknown_08B19E0C
	movs r4, #0xff
	ldr r3, _080CEC24  @ gUnknown_08B12AA4
	movs r2, #0
_080CEBB2:
	mov r1, sp
	adds r0, r1, r5
	ldrb r1, [r0]
	orrs r1, r4
	strb r1, [r0]
	ldr r0, [r3]
	adds r0, #0x40
	adds r0, r0, r5
	strb r2, [r0]
	adds r5, #1
	cmp r5, #0x13
	ble _080CEBB2
	ldrb r2, [r6]
	cmp r2, #0xc
	beq _080CEBEE
	adds r4, r6, #0
_080CEBD2:
	ldrh r0, [r4, #6]
	bl CheckEventId
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080CEBE6
	ldrb r2, [r4, #1]
	mov r1, sp
	adds r0, r1, r2
	strb r2, [r0]
_080CEBE6:
	adds r4, #0xc
	ldrb r2, [r4]
	cmp r2, #0xc
	bne _080CEBD2
_080CEBEE:
	ldr r0, _080CEC24  @ gUnknown_08B12AA4
	ldr r1, [r0]
	adds r1, #0x3c
	movs r2, #0
	strb r2, [r1]
	movs r5, #0
	adds r6, r0, #0
	adds r7, r6, #0
_080CEBFE:
	mov r0, sp
	adds r1, r0, r5
	ldrb r0, [r1]
	cmp r0, #0xff
	beq _080CEC58
	adds r2, r0, #0
	ldr r1, [r6]
	adds r3, r1, #0
	adds r3, #0x3c
	ldrb r0, [r3]
	cmp r0, #0
	bne _080CEC28
	adds r0, r1, #0
	adds r0, #0x40
	strb r2, [r0]
	ldr r1, [r7]
	b _080CEC50
	.align 2, 0
_080CEC20: .4byte gUnknown_08B19E0C
_080CEC24: .4byte gUnknown_08B12AA4
_080CEC28:
	movs r4, #0
	ldrb r3, [r3]
	cmp r4, r3
	bge _080CEC3C
	adds r0, r1, #0
	adds r0, #0x40
	ldrb r0, [r0]
	cmp r0, r2
	bne _080CEC3C
	movs r4, #1
_080CEC3C:
	cmp r4, #0
	bne _080CEC58
	ldr r0, [r6]
	adds r1, r0, #0
	adds r1, #0x3c
	adds r0, #0x40
	ldrb r1, [r1]
	adds r0, r0, r1
	strb r2, [r0]
	ldr r1, [r6]
_080CEC50:
	adds r1, #0x3c
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
_080CEC58:
	adds r5, #1
	cmp r5, #0xb
	ble _080CEBFE
	add sp, #0x14
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80CEBA4

	THUMB_FUNC_START sub_80CEC68
sub_80CEC68: @ 0x080CEC68
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	movs r0, #0xa0
	movs r1, #0
	ldr r2, _080CECA8  @ gBG2TilemapBuffer
	mov ip, r2
	ldr r7, _080CECAC  @ 0x00000FFF
_080CEC78:
	adds r4, r0, #0
	adds r4, #0x20
	adds r5, r1, #1
	lsls r0, r0, #1
	mov r1, ip
	adds r2, r0, r1
	movs r3, #8
_080CEC86:
	ldrh r1, [r2]
	adds r0, r7, #0
	ands r0, r1
	adds r0, r6, r0
	strh r0, [r2]
	adds r2, #2
	subs r3, #1
	cmp r3, #0
	bge _080CEC86
	adds r0, r4, #0
	adds r1, r5, #0
	cmp r1, #0xb
	ble _080CEC78
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080CECA8: .4byte gBG2TilemapBuffer
_080CECAC: .4byte 0x00000FFF

	THUMB_FUNC_END sub_80CEC68

	THUMB_FUNC_START sub_80CECB0
sub_80CECB0: @ 0x080CECB0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	str r0, [sp, #4]
	movs r0, #0
	mov sl, r0
	bl SetupBackgrounds
	ldr r5, _080CEED0  @ gUnknown_08B12AA4
	ldr r0, [r5]
	adds r0, #0x2f
	mov r1, sl
	strb r1, [r0]
	movs r0, #0xb3
	bl CheckEventId
	ldr r1, [r5]
	adds r1, #0x30
	strb r0, [r1]
	ldr r0, [r5]
	adds r0, #0x29
	mov r2, sl
	strb r2, [r0]
	ldr r0, [r5]
	adds r0, #0x2a
	strb r2, [r0]
	ldr r0, [r5]
	adds r0, #0x2b
	strb r2, [r0]
	ldr r0, [r5]
	adds r0, #0x2c
	strb r2, [r0]
	bl sub_80CEAE8
	bl sub_80CEBA4
	bl LoadUiFrameGraphics
	ldr r7, _080CEED4  @ gLCDControlBuffer
	ldrb r0, [r7, #1]
	movs r1, #1
	mov r9, r1
	mov r2, r9
	orrs r0, r2
	movs r1, #2
	orrs r0, r1
	movs r2, #4
	mov r8, r2
	mov r1, r8
	orrs r0, r1
	movs r6, #8
	orrs r0, r6
	movs r4, #0x10
	orrs r0, r4
	strb r0, [r7, #1]
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
	movs r0, #3
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	ldr r0, _080CEED8  @ gBG0TilemapBuffer
	movs r1, #0
	bl BG_Fill
	ldr r0, _080CEEDC  @ gBG1TilemapBuffer
	movs r1, #0
	bl BG_Fill
	ldr r0, _080CEEE0  @ gBG2TilemapBuffer
	movs r1, #0
	bl BG_Fill
	ldr r0, _080CEEE4  @ gBG3TilemapBuffer
	movs r1, #0
	bl BG_Fill
	ldrb r0, [r7, #1]
	movs r1, #0x20
	orrs r0, r1
	movs r1, #0x41
	negs r1, r1
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r7, #1]
	adds r0, r7, #0
	adds r0, #0x2d
	mov r2, sl
	strb r2, [r0]
	adds r1, r7, #0
	adds r1, #0x31
	movs r0, #0x28
	strb r0, [r1]
	subs r1, #5
	movs r0, #0xf0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0x88
	strb r0, [r1]
	adds r1, #4
	ldrb r0, [r1]
	mov r2, r9
	orrs r0, r2
	movs r2, #2
	orrs r0, r2
	mov r2, r8
	orrs r0, r2
	orrs r0, r6
	orrs r0, r4
	strb r0, [r1]
	adds r2, r7, #0
	adds r2, #0x36
	ldrb r0, [r2]
	mov r1, r9
	orrs r0, r1
	movs r1, #3
	negs r1, r1
	ands r0, r1
	mov r1, r8
	orrs r0, r1
	orrs r0, r6
	orrs r0, r4
	strb r0, [r2]
	ldr r0, _080CEEE8  @ gUnknown_08B17B44
	movs r1, #0x90
	lsls r1, r1, #2
	movs r2, #0x20
	bl CopyToPaletteBuffer
	ldr r0, _080CEEEC  @ gUnknown_08B17864
	ldr r1, _080CEEF0  @ 0x06011000
	bl CopyDataWithPossibleUncomp
	ldr r0, _080CEEF4  @ gUnknown_08B177C0
	ldr r1, _080CEEF8  @ 0x06011800
	bl CopyDataWithPossibleUncomp
	ldr r0, _080CEEFC  @ gUnknown_08B176CC
	ldr r4, _080CEF00  @ gUnknown_02020288
	adds r1, r4, #0
	bl CopyDataWithPossibleUncomp
	movs r2, #0x80
	lsls r2, r2, #5
	ldr r0, _080CEEE0  @ gBG2TilemapBuffer
	adds r1, r4, #0
	bl CallARM_FillTileRect
	ldr r0, _080CEF04  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1e
	adds r0, #4
	lsls r0, r0, #5
	ldr r1, _080CEF08  @ gUiFramePaletteA
	adds r0, r0, r1
	movs r1, #0x40
	movs r2, #0x20
	bl CopyToPaletteBuffer
	bl sub_8003D20
	ldr r0, [r5]
	adds r0, #0xec
	movs r1, #0x16
	bl Text_Init
	bl sub_80CE148
	ldr r0, [r5]
	adds r0, #0xac
	movs r1, #9
	bl Text_Init
	ldr r0, [r5]
	adds r0, #0xe4
	movs r1, #0x12
	bl Text_Init
	movs r6, #0xb4
	movs r4, #0x7c
	movs r2, #5
	mov sl, r2
_080CEE44:
	ldr r0, [r5]
	adds r0, r0, r4
	movs r1, #9
	bl Text_Init
	ldr r0, [r5]
	adds r0, r0, r6
	movs r1, #0x12
	bl Text_Init
	adds r6, #8
	adds r4, #8
	movs r0, #1
	negs r0, r0
	add sl, r0
	mov r1, sl
	cmp r1, #0
	bge _080CEE44
	bl sub_80CE248
	bl sub_80CE414
	movs r0, #0
	str r0, [sp]
	ldr r0, [sp, #4]
	movs r1, #0
	movs r2, #0x12
	movs r3, #2
	bl sub_8086CE8
	ldr r0, _080CEF0C  @ gUnknown_08B12B1C
	ldr r1, [sp, #4]
	bl Proc_Start
	movs r0, #0xf
	bl BG_EnableSyncByMask
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #4
	str r0, [sp]
	ldr r0, [sp, #4]
	movs r1, #0xe0
	movs r2, #0x2f
	bl sub_8097748
	ldr r0, _080CEED0  @ gUnknown_08B12AA4
	ldr r0, [r0]
	adds r1, r0, #0
	adds r1, #0x2c
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	lsls r1, r1, #4
	adds r0, #0x3e
	ldrb r2, [r0]
	movs r0, #0xa
	movs r3, #6
	bl sub_80976CC
	bl sub_8097668
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080CEED0: .4byte gUnknown_08B12AA4
_080CEED4: .4byte gLCDControlBuffer
_080CEED8: .4byte gBG0TilemapBuffer
_080CEEDC: .4byte gBG1TilemapBuffer
_080CEEE0: .4byte gBG2TilemapBuffer
_080CEEE4: .4byte gBG3TilemapBuffer
_080CEEE8: .4byte gUnknown_08B17B44
_080CEEEC: .4byte gUnknown_08B17864
_080CEEF0: .4byte 0x06011000
_080CEEF4: .4byte gUnknown_08B177C0
_080CEEF8: .4byte 0x06011800
_080CEEFC: .4byte gUnknown_08B176CC
_080CEF00: .4byte gUnknown_02020288
_080CEF04: .4byte gRAMChapterData
_080CEF08: .4byte gUiFramePaletteA
_080CEF0C: .4byte gUnknown_08B12B1C

	THUMB_FUNC_END sub_80CECB0

	THUMB_FUNC_START sub_80CEF10
sub_80CEF10: @ 0x080CEF10
	push {r4, lr}
	sub sp, #4
	movs r0, #1
	movs r1, #0xf
	movs r2, #4
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	movs r4, #0
	str r4, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #1
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

	THUMB_FUNC_END sub_80CEF10

	THUMB_FUNC_START sub_80CEF48
sub_80CEF48: @ 0x080CEF48
	push {r4, lr}
	ldr r1, _080CEF64  @ gUnknown_08B12AA4
	ldr r1, [r1]
	adds r1, #0x2f
	ldrb r2, [r1]
	ldr r4, _080CEF68  @ gKeyStatusPtr
	cmp r2, #1
	beq _080CEF82
	cmp r2, #1
	bgt _080CEF6C
	cmp r2, #0
	beq _080CEF72
	b _080CEFC0
	.align 2, 0
_080CEF64: .4byte gUnknown_08B12AA4
_080CEF68: .4byte gKeyStatusPtr
_080CEF6C:
	cmp r2, #2
	beq _080CEF9E
	b _080CEFC0
_080CEF72:
	ldr r1, [r4]
	ldrh r2, [r1, #8]
	movs r1, #4
	ands r1, r2
	cmp r1, #0
	beq _080CEF82
	movs r0, #4
	b _080CEFCE
_080CEF82:
	ldr r1, [r4]
	ldrh r2, [r1, #8]
	movs r1, #1
	ands r1, r2
	cmp r1, #0
	beq _080CEF92
	movs r0, #2
	b _080CEFCE
_080CEF92:
	movs r1, #2
	ands r1, r2
	cmp r1, #0
	beq _080CEFC0
_080CEF9A:
	movs r0, #3
	b _080CEFCE
_080CEF9E:
	ldr r1, [r4]
	ldrh r3, [r1, #8]
	ands r2, r3
	cmp r2, #0
	bne _080CEF9A
	movs r1, #0x11
	ands r1, r3
	cmp r1, #0
	beq _080CEFB4
	movs r0, #5
	b _080CEFCE
_080CEFB4:
	movs r1, #0x20
	ands r1, r3
	cmp r1, #0
	beq _080CEFC0
	movs r0, #6
	b _080CEFCE
_080CEFC0:
	ldr r1, [r4]
	ldrh r2, [r1, #6]
	movs r1, #0xc0
	ands r1, r2
	cmp r1, #0
	beq _080CEFCE
	movs r0, #1
_080CEFCE:
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80CEF48

	THUMB_FUNC_START sub_80CEFD4
sub_80CEFD4: @ 0x080CEFD4
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	movs r4, #0
	bl sub_80CEF48
	subs r0, #1
	cmp r0, #5
	bls _080CEFE6
	b _080CF43A
_080CEFE6:
	lsls r0, r0, #2
	ldr r1, _080CEFF0  @ _080CEFF4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080CEFF0: .4byte _080CEFF4
_080CEFF4: @ jump table
	.4byte _080CF1AC @ case 0
	.4byte _080CF00C @ case 1
	.4byte _080CF0D4 @ case 2
	.4byte _080CF13C @ case 3
	.4byte _080CF094 @ case 4
	.4byte _080CF0B4 @ case 5
_080CF00C:
	ldr r0, _080CF03C  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080CF01E
	movs r0, #0x6a
	bl m4aSongNumStart
_080CF01E:
	ldr r4, _080CF040  @ gUnknown_08B12AA4
	ldr r1, [r4]
	adds r1, #0x2f
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldr r1, [r4]
	adds r0, r1, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	cmp r0, #1
	beq _080CF044
	cmp r0, #2
	beq _080CF04A
	b _080CF43A
	.align 2, 0
_080CF03C: .4byte gRAMChapterData
_080CF040: .4byte gUnknown_08B12AA4
_080CF044:
	movs r0, #0x80
	lsls r0, r0, #6
	b _080CF114
_080CF04A:
	adds r1, #0x2e
	movs r0, #0
	strb r0, [r1]
	ldr r2, _080CF090  @ gUnknown_08B19E0C
	ldr r0, [r4]
	adds r1, r0, #0
	adds r1, #0x2b
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, #0x68
	adds r0, r0, r1
	ldrb r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrh r0, [r0, #8]
	bl SetEventId
	ldr r0, [r4]
	adds r1, r0, #0
	adds r1, #0x2b
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, #0x68
	adds r0, r0, r1
	ldrb r0, [r0]
	movs r1, #0
	bl sub_80CE5F0
	bl sub_809764C
	b _080CF43A
	.align 2, 0
_080CF090: .4byte gUnknown_08B19E0C
_080CF094:
	ldr r0, _080CF0B0  @ gUnknown_08B12AA4
	ldr r0, [r0]
	adds r1, r0, #0
	adds r1, #0x2b
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, #0x68
	adds r0, r0, r1
	ldrb r0, [r0]
	movs r1, #1
	bl sub_80CE5F0
	b _080CF43A
	.align 2, 0
_080CF0B0: .4byte gUnknown_08B12AA4
_080CF0B4:
	ldr r0, _080CF0D0  @ gUnknown_08B12AA4
	ldr r0, [r0]
	adds r1, r0, #0
	adds r1, #0x2b
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, #0x68
	adds r0, r0, r1
	ldrb r0, [r0]
	movs r1, #2
	bl sub_80CE5F0
	b _080CF43A
	.align 2, 0
_080CF0D0: .4byte gUnknown_08B12AA4
_080CF0D4:
	ldr r0, _080CF108  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080CF0E6
	movs r0, #0x6b
	bl m4aSongNumStart
_080CF0E6:
	ldr r2, _080CF10C  @ gUnknown_08B12AA4
	ldr r0, [r2]
	adds r1, r0, #0
	adds r1, #0x2f
	ldrb r0, [r1]
	cmp r0, #0
	beq _080CF134
	subs r0, #1
	strb r0, [r1]
	ldr r0, [r2]
	adds r0, #0x2f
	ldrb r0, [r0]
	cmp r0, #0
	beq _080CF110
	cmp r0, #1
	beq _080CF120
	b _080CF43A
	.align 2, 0
_080CF108: .4byte gRAMChapterData
_080CF10C: .4byte gUnknown_08B12AA4
_080CF110:
	movs r0, #0x80
	lsls r0, r0, #5
_080CF114:
	bl sub_80CEC68
	movs r0, #4
	bl BG_EnableSyncByMask
	b _080CF43A
_080CF120:
	ldr r0, _080CF130  @ gUnknown_08B12B9C
	adds r1, r5, #0
	bl Proc_StartBlocking
	bl sub_8097668
	b _080CF43A
	.align 2, 0
_080CF130: .4byte gUnknown_08B12B9C
_080CF134:
	adds r0, r5, #0
	bl Proc_Break
	b _080CF43A
_080CF13C:
	ldr r0, _080CF170  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080CF14E
	movs r0, #0x6a
	bl m4aSongNumStart
_080CF14E:
	ldr r3, _080CF174  @ gUnknown_08B12AA4
	ldr r2, [r3]
	adds r2, #0x30
	ldrb r0, [r2]
	adds r0, #1
	movs r1, #1
	ands r0, r1
	strb r0, [r2]
	ldr r0, [r3]
	adds r0, #0x30
	ldrb r0, [r0]
	cmp r0, #0
	beq _080CF178
	movs r0, #0xb3
	bl SetEventId
	b _080CF17E
	.align 2, 0
_080CF170: .4byte gRAMChapterData
_080CF174: .4byte gUnknown_08B12AA4
_080CF178:
	movs r0, #0xb3
	bl UnsetEventId
_080CF17E:
	ldr r2, _080CF1A4  @ gUnknown_08B12AA4
	ldr r0, [r2]
	adds r0, #0x29
	movs r1, #0
	strb r1, [r0]
	ldr r0, [r2]
	adds r0, #0x2a
	strb r1, [r0]
	ldr r0, [r2]
	adds r0, #0x2b
	strb r1, [r0]
	ldr r0, [r2]
	adds r0, #0x2c
	strb r1, [r0]
	ldr r0, _080CF1A8  @ gUnknown_08B12B3C
	adds r1, r5, #0
	bl Proc_StartBlocking
	b _080CF43A
	.align 2, 0
_080CF1A4: .4byte gUnknown_08B12AA4
_080CF1A8: .4byte gUnknown_08B12B3C
_080CF1AC:
	ldr r6, _080CF1C8  @ gUnknown_08B12AA4
	ldr r3, [r6]
	adds r0, r3, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	adds r7, r6, #0
	cmp r0, #1
	bne _080CF1BE
	b _080CF2E8
_080CF1BE:
	cmp r0, #1
	bgt _080CF1CC
	cmp r0, #0
	beq _080CF1D4
	b _080CF424
	.align 2, 0
_080CF1C8: .4byte gUnknown_08B12AA4
_080CF1CC:
	cmp r0, #2
	bne _080CF1D2
	b _080CF3A4
_080CF1D2:
	b _080CF424
_080CF1D4:
	ldr r0, _080CF230  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _080CF234
	adds r1, r3, #0
	adds r1, #0x29
	ldrb r2, [r1]
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	beq _080CF2C0
	subs r0, r2, #1
	strb r0, [r1]
	ldr r1, [r6]
	adds r0, r1, #0
	adds r0, #0x29
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r2, r1, #0
	adds r2, #0x2a
	movs r1, #0
	ldrsb r1, [r2, r1]
	subs r0, r0, r1
	cmp r0, #0
	bgt _080CF22C
	ldrb r1, [r2]
	movs r0, #0
	ldrsb r0, [r2, r0]
	cmp r0, #0
	beq _080CF22C
	subs r0, r1, #1
	strb r0, [r2]
	ldr r0, [r6]
	adds r0, #0x29
	movs r1, #0
	ldrsb r1, [r0, r1]
	subs r1, #1
	adds r0, r5, #0
	bl sub_80CE750
_080CF22C:
	movs r4, #1
	b _080CF2C6
	.align 2, 0
_080CF230: .4byte gKeyStatusPtr
_080CF234:
	adds r0, r3, #0
	adds r0, #0x29
	movs r1, #0
	ldrsb r1, [r0, r1]
	adds r0, #7
	ldrb r0, [r0]
	cmp r0, #0
	beq _080CF252
	adds r0, r3, #0
	adds r0, #0x3c
	ldrb r0, [r0]
	subs r0, #1
	cmp r1, r0
	blt _080CF25E
	b _080CF2C0
_080CF252:
	adds r0, r3, #0
	adds r0, #0x3d
	ldrb r0, [r0]
	subs r0, #1
	cmp r1, r0
	bge _080CF2C0
_080CF25E:
	ldr r0, [r7]
	adds r0, #0x29
	ldrb r1, [r0]
	adds r1, #1
	strb r1, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r0, #0x29
	movs r2, #0
	ldrsb r2, [r0, r2]
	adds r0, #1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r2, r0
	cmp r0, #4
	ble _080CF2BE
	adds r0, r1, #0
	adds r0, #0x30
	ldrb r0, [r0]
	cmp r0, #0
	beq _080CF298
	adds r0, r1, #0
	adds r0, #0x3c
	ldrb r0, [r0]
	subs r0, #1
	cmp r2, r0
	blt _080CF2A4
	b _080CF2BE
_080CF298:
	adds r0, r1, #0
	adds r0, #0x3d
	ldrb r0, [r0]
	subs r0, #1
	cmp r2, r0
	bge _080CF2BE
_080CF2A4:
	ldr r1, [r7]
	adds r1, #0x2a
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldr r0, [r7]
	adds r0, #0x29
	movs r1, #0
	ldrsb r1, [r0, r1]
	adds r1, #1
	adds r0, r5, #0
	bl sub_80CE858
_080CF2BE:
	movs r4, #1
_080CF2C0:
	cmp r4, #0
	bne _080CF2C6
	b _080CF43A
_080CF2C6:
	ldr r0, _080CF2E0  @ gUnknown_08B12B9C
	adds r1, r5, #0
	bl Proc_Start
	ldr r2, _080CF2E4  @ gUnknown_08B12AA4
	ldr r0, [r2]
	adds r0, #0x2b
	movs r1, #0
	strb r1, [r0]
	ldr r0, [r2]
	adds r0, #0x2c
	strb r1, [r0]
	b _080CF424
	.align 2, 0
_080CF2E0: .4byte gUnknown_08B12B9C
_080CF2E4: .4byte gUnknown_08B12AA4
_080CF2E8:
	ldr r0, _080CF348  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _080CF34C
	adds r1, r3, #0
	adds r1, #0x2b
	ldrb r2, [r1]
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bne _080CF306
	b _080CF424
_080CF306:
	subs r0, r2, #1
	strb r0, [r1]
	ldr r1, [r6]
	adds r0, r1, #0
	adds r0, #0x2b
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r2, r1, #0
	adds r2, #0x2c
	movs r1, #0
	ldrsb r1, [r2, r1]
	subs r0, r0, r1
	cmp r0, #0
	bgt _080CF342
	ldrb r1, [r2]
	movs r0, #0
	ldrsb r0, [r2, r0]
	cmp r0, #0
	beq _080CF342
	subs r0, r1, #1
	strb r0, [r2]
	ldr r0, [r6]
	adds r0, #0x2b
	movs r1, #0
	ldrsb r1, [r0, r1]
	subs r1, #1
	adds r0, r5, #0
	bl sub_80CE750
_080CF342:
	movs r4, #1
	b _080CF428
	.align 2, 0
_080CF348: .4byte gKeyStatusPtr
_080CF34C:
	adds r2, r3, #0
	adds r2, #0x2b
	movs r1, #0
	ldrsb r1, [r2, r1]
	adds r0, r3, #0
	adds r0, #0x3e
	ldrb r0, [r0]
	subs r0, #1
	cmp r1, r0
	bge _080CF424
	ldrb r0, [r2]
	adds r0, #1
	strb r0, [r2]
	ldr r1, [r6]
	adds r0, r1, #0
	adds r0, #0x2b
	movs r3, #0
	ldrsb r3, [r0, r3]
	adds r2, r1, #0
	adds r2, #0x2c
	movs r0, #0
	ldrsb r0, [r2, r0]
	subs r0, r3, r0
	cmp r0, #4
	ble _080CF3A0
	adds r0, r1, #0
	adds r0, #0x3e
	ldrb r0, [r0]
	subs r0, #1
	cmp r3, r0
	bge _080CF3A0
	ldrb r0, [r2]
	adds r0, #1
	strb r0, [r2]
	ldr r0, [r6]
	adds r0, #0x2b
	movs r1, #0
	ldrsb r1, [r0, r1]
	adds r1, #1
	adds r0, r5, #0
	bl sub_80CE858
_080CF3A0:
	movs r4, #1
	b _080CF428
_080CF3A4:
	ldr r0, _080CF3E4  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _080CF3EC
	adds r1, r3, #0
	adds r1, #0x2e
	ldrb r2, [r1]
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	beq _080CF424
	subs r0, r2, #1
	movs r4, #0
	strb r0, [r1]
	ldr r0, _080CF3E8  @ gUnknown_08B12C3C
	adds r1, r5, #0
	bl Proc_StartBlocking
	adds r5, r0, #0
	ldr r0, [r6]
	adds r0, #0x2e
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	str r0, [r5, #0x34]
	str r4, [r5, #0x38]
	movs r4, #1
	b _080CF428
	.align 2, 0
_080CF3E4: .4byte gKeyStatusPtr
_080CF3E8: .4byte gUnknown_08B12C3C
_080CF3EC:
	adds r2, r3, #0
	adds r2, #0x2e
	movs r1, #0
	ldrsb r1, [r2, r1]
	adds r0, r3, #0
	adds r0, #0x3f
	ldrb r0, [r0]
	subs r0, #4
	cmp r1, r0
	bge _080CF424
	ldrb r0, [r2]
	adds r0, #1
	strb r0, [r2]
	ldr r0, _080CF440  @ gUnknown_08B12C3C
	adds r1, r5, #0
	bl Proc_StartBlocking
	adds r5, r0, #0
	ldr r0, [r6]
	adds r0, #0x2e
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r0, #3
	str r0, [r5, #0x34]
	movs r0, #1
	str r0, [r5, #0x38]
	movs r4, #1
_080CF424:
	cmp r4, #0
	beq _080CF43A
_080CF428:
	ldr r0, _080CF444  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080CF43A
	movs r0, #0x66
	bl m4aSongNumStart
_080CF43A:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080CF440: .4byte gUnknown_08B12C3C
_080CF444: .4byte gRAMChapterData

	THUMB_FUNC_END sub_80CEFD4

	THUMB_FUNC_START sub_80CF448
sub_80CF448: @ 0x080CF448
	push {lr}
	bl EndBG3Slider
	ldr r0, _080CF45C  @ gUnknown_08B12B1C
	bl Proc_EndEach
	bl Delete6CMenuScroll
	pop {r0}
	bx r0
	.align 2, 0
_080CF45C: .4byte gUnknown_08B12B1C

	THUMB_FUNC_END sub_80CF448

	THUMB_FUNC_START sub_80CF460
sub_80CF460: @ 0x080CF460
	push {r4, lr}
	ldr r4, _080CF468  @ gUnknown_08B19E0C
	b _080CF474
	.align 2, 0
_080CF468: .4byte gUnknown_08B19E0C
_080CF46C:
	ldrh r0, [r4, #6]
	bl SetEventId
	adds r4, #0xc
_080CF474:
	ldrb r0, [r4]
	cmp r0, #0xc
	bne _080CF46C
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80CF460

	THUMB_FUNC_START sub_80CF480
sub_80CF480: @ 0x080CF480
	push {r4, lr}
	ldr r4, _080CF488  @ gUnknown_08B19E0C
	b _080CF4AA
	.align 2, 0
_080CF488: .4byte gUnknown_08B19E0C
_080CF48C:
	ldrh r0, [r4, #6]
	bl CheckEventId
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080CF4A8
	ldrh r0, [r4, #8]
	bl CheckEventId
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080CF4A8
	movs r0, #0
	b _080CF4B2
_080CF4A8:
	adds r4, #0xc
_080CF4AA:
	ldrb r0, [r4]
	cmp r0, #0xc
	bne _080CF48C
	movs r0, #1
_080CF4B2:
	pop {r4}
	pop {r1}
	bx r1
	THUMB_FUNC_END sub_80CF480
