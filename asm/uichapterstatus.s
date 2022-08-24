	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	THUMB_FUNC_START sub_808DCF8
sub_808DCF8: @ 0x0808DCF8
	push {r4, lr}
	movs r2, #0
	ldr r0, _0808DD14  @ gRAMChapterData
	ldrb r0, [r0, #0xe]
	subs r0, #0xd
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x14
	bhi _0808DD84
	lsls r0, r0, #2
	ldr r1, _0808DD18  @ _0808DD1C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0808DD14: .4byte gRAMChapterData
_0808DD18: .4byte _0808DD1C
_0808DD1C: @ jump table
	.4byte _0808DD70 @ case 0
	.4byte _0808DD84 @ case 1
	.4byte _0808DD74 @ case 2
	.4byte _0808DD84 @ case 3
	.4byte _0808DD84 @ case 4
	.4byte _0808DD84 @ case 5
	.4byte _0808DD84 @ case 6
	.4byte _0808DD7C @ case 7
	.4byte _0808DD84 @ case 8
	.4byte _0808DD84 @ case 9
	.4byte _0808DD84 @ case 10
	.4byte _0808DD84 @ case 11
	.4byte _0808DD84 @ case 12
	.4byte _0808DD84 @ case 13
	.4byte _0808DD84 @ case 14
	.4byte _0808DD78 @ case 15
	.4byte _0808DD84 @ case 16
	.4byte _0808DD84 @ case 17
	.4byte _0808DD84 @ case 18
	.4byte _0808DD84 @ case 19
	.4byte _0808DD7C @ case 20
_0808DD70:
	movs r0, #0x51
	b _0808DD7E
_0808DD74:
	movs r0, #0x43
	b _0808DD7E
_0808DD78:
	movs r0, #0x53
	b _0808DD7E
_0808DD7C:
	movs r0, #0x41
_0808DD7E:
	bl GetUnitFromCharId
	adds r2, r0, #0
_0808DD84:
	cmp r2, #0
	beq _0808DD8C
_0808DD88:
	adds r0, r2, #0
	b _0808DDBA
_0808DD8C:
	movs r4, #0x81
_0808DD8E:
	adds r0, r4, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq _0808DDB2
	ldr r1, [r2]
	cmp r1, #0
	beq _0808DDB2
	ldr r0, [r2, #4]
	ldr r1, [r1, #0x28]
	ldr r0, [r0, #0x28]
	orrs r1, r0
	movs r0, #0x80
	lsls r0, r0, #8
	ands r1, r0
	cmp r1, #0
	bne _0808DD88
_0808DDB2:
	adds r4, #1
	cmp r4, #0xbf
	ble _0808DD8E
	movs r0, #0
_0808DDBA:
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_808DCF8

	THUMB_FUNC_START sub_808DDC0
sub_808DDC0: @ 0x0808DDC0
	push {r4, r5, lr}
	movs r5, #0
	movs r4, #0x81
_0808DDC6:
	adds r0, r4, #0
	bl GetUnit
	cmp r0, #0
	beq _0808DDEA
	ldr r1, [r0]
	cmp r1, #0
	beq _0808DDEA
	ldr r0, [r0, #4]
	ldr r1, [r1, #0x28]
	ldr r0, [r0, #0x28]
	orrs r1, r0
	movs r0, #0x80
	lsls r0, r0, #8
	ands r1, r0
	cmp r1, #0
	beq _0808DDEA
	adds r5, #1
_0808DDEA:
	adds r4, #1
	cmp r4, #0xbf
	ble _0808DDC6
	adds r0, r5, #0
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_808DDC0

	THUMB_FUNC_START sub_808DDF8
sub_808DDF8: @ 0x0808DDF8
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	movs r6, #0
	adds r4, r5, #1
	b _0808DE24
_0808DE02:
	adds r0, r4, #0
	bl GetUnit
	adds r1, r0, #0
	cmp r1, #0
	beq _0808DE20
	ldr r0, [r1]
	cmp r0, #0
	beq _0808DE20
	ldr r0, [r1, #0xc]
	ldr r1, _0808DE34  @ 0x0001000C
	ands r0, r1
	cmp r0, #0
	bne _0808DE20
	adds r6, #1
_0808DE20:
	adds r4, #1
	adds r0, r5, #0
_0808DE24:
	adds r0, #0x40
	cmp r4, r0
	blt _0808DE02
	adds r0, r6, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0808DE34: .4byte 0x0001000C

	THUMB_FUNC_END sub_808DDF8

	THUMB_FUNC_START sub_808DE38
sub_808DE38: @ 0x0808DE38
	push {r4, r5, r6, lr}
	adds r2, r0, #0
	ldr r0, _0808DEB4  @ gUnknown_08A2E8F0
	adds r0, #0x5e
	ldrh r5, [r0]
	ldr r6, _0808DEB8  @ gUnknown_02022BA4
	adds r3, r2, #0
	adds r3, #0x40
	ldrb r0, [r3]
	lsrs r4, r0, #1
	movs r1, #0x1f
	ands r4, r1
	adds r0, #1
	strb r0, [r3]
	cmp r4, #0x10
	ble _0808DE60
	movs r0, #0xf
	ands r0, r4
	movs r1, #0x10
	subs r4, r1, r0
_0808DE60:
	adds r1, r2, #0
	adds r1, #0x2e
	adds r0, r2, #0
	adds r0, #0x2f
	ldrb r1, [r1]
	ldrb r2, [r0]
	cmp r1, r2
	beq _0808DE76
	strb r1, [r0]
	movs r0, #0
	strb r0, [r3]
_0808DE76:
	movs r3, #0x1f
	movs r0, #0x1f
	ands r0, r5
	movs r2, #0x10
	subs r2, r2, r4
	adds r1, r0, #0
	muls r1, r2, r1
	asrs r1, r1, #4
	ands r1, r3
	movs r3, #0xf8
	lsls r3, r3, #2
	adds r0, r5, #0
	ands r0, r3
	muls r0, r2, r0
	asrs r0, r0, #4
	ands r0, r3
	adds r1, r1, r0
	movs r3, #0xf8
	lsls r3, r3, #7
	ands r5, r3
	adds r0, r5, #0
	muls r0, r2, r0
	asrs r0, r0, #4
	ands r0, r3
	adds r1, r1, r0
	strh r1, [r6]
	bl EnablePaletteSync
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0808DEB4: .4byte gUnknown_08A2E8F0
_0808DEB8: .4byte gUnknown_02022BA4

	THUMB_FUNC_END sub_808DE38

	THUMB_FUNC_START sub_808DEBC
sub_808DEBC: @ 0x0808DEBC
	push {lr}
	sub sp, #4
	adds r1, r0, #0
	cmp r1, #0
	beq _0808DEDA
	ldrb r0, [r1]
	cmp r0, #0
	beq _0808DEDA
_0808DECC:
	ldrb r0, [r1]
	cmp r0, #0
	beq _0808DEDA
	cmp r0, #1
	bne _0808DEDE
	adds r0, r1, #1
	b _0808DEEA
_0808DEDA:
	movs r0, #0
	b _0808DEEA
_0808DEDE:
	adds r0, r1, #0
	mov r1, sp
	bl GetCharTextWidth
	adds r1, r0, #0
	b _0808DECC
_0808DEEA:
	add sp, #4
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_808DEBC

	THUMB_FUNC_START sub_808DEF0
sub_808DEF0: @ 0x0808DEF0
	push {lr}
	sub sp, #4
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0808DF18
	movs r0, #0
	str r0, [sp]
	ldr r1, _0808DF10  @ gUnknown_02022C48
	ldr r2, _0808DF14  @ 0x01000008
	mov r0, sp
	bl CpuFastSet
	bl EnablePaletteSync
	b _0808DF1C
	.align 2, 0
_0808DF10: .4byte gUnknown_02022C48
_0808DF14: .4byte 0x01000008
_0808DF18:
	bl SetupMapSpritesPalettes
_0808DF1C:
	add sp, #4
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_808DEF0

	THUMB_FUNC_START sub_808DF24
sub_808DF24: @ 0x0808DF24
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	adds r7, r0, #0
	movs r0, #0
	bl SetupBackgrounds
	ldr r4, _0808E060  @ gLCDControlBuffer
	ldrb r0, [r4, #0xc]
	mov r9, r0
	movs r5, #4
	negs r5, r5
	ldrb r0, [r4, #0x10]
	adds r2, r5, #0
	ands r2, r0
	movs r6, #1
	mov r8, r6
	mov r0, r8
	orrs r2, r0
	ldrb r0, [r4, #0x14]
	adds r1, r5, #0
	ands r1, r0
	movs r6, #2
	mov ip, r6
	mov r0, ip
	orrs r1, r0
	ldrb r3, [r4, #0x18]
	movs r0, #3
	orrs r3, r0
	adds r0, r5, #0
	mov r6, r9
	ands r0, r6
	strb r0, [r4, #0xc]
	ands r2, r5
	mov r0, r8
	orrs r2, r0
	strb r2, [r4, #0x10]
	ands r1, r5
	mov r6, ip
	orrs r1, r6
	strb r1, [r4, #0x14]
	ands r3, r5
	orrs r3, r6
	strb r3, [r4, #0x18]
	bl Font_InitForUIDefault
	bl LoadUiFrameGraphics
	movs r5, #0
	movs r0, #0
	strh r0, [r7, #0x3c]
	adds r0, r7, #0
	adds r0, #0x3e
	strb r5, [r0]
	subs r0, #0x14
	strb r5, [r0]
	ldr r4, _0808E064  @ 0x0000FFFE
	ldr r2, _0808E068  @ 0x0000FFFC
	movs r0, #0
	adds r1, r4, #0
	bl BG_SetPosition
	movs r0, #1
	movs r1, #0
	adds r2, r4, #0
	bl BG_SetPosition
	ldr r2, _0808E06C  @ 0x0000FFDC
	movs r0, #2
	movs r1, #0
	bl BG_SetPosition
	movs r0, #3
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	bl ClearBg0Bg1
	ldr r0, _0808E070  @ gUiFramePaletteA
	movs r1, #0x40
	movs r2, #0x60
	bl CopyToPaletteBuffer
	ldr r0, _0808E074  @ gUnknown_08A2E5EC
	ldr r1, _0808E078  @ 0x06005800
	bl CopyDataWithPossibleUncomp
	ldr r0, _0808E07C  @ gUnknown_08A2E4C4
	ldr r4, _0808E080  @ gUnknown_02020188
	adds r1, r4, #0
	bl CopyDataWithPossibleUncomp
	ldr r0, _0808E084  @ gBG2TilemapBuffer
	movs r2, #0x80
	lsls r2, r2, #5
	adds r1, r4, #0
	bl CallARM_FillTileRect
	ldr r0, _0808E088  @ gUnknown_08A2D32C
	ldr r1, _0808E08C  @ 0x06013000
	bl CopyDataWithPossibleUncomp
	ldr r0, _0808E090  @ gUnknown_08A2E1B8
	movs r1, #0xc0
	lsls r1, r1, #2
	movs r2, #0x40
	bl CopyToPaletteBuffer
	ldr r0, _0808E094  @ gUnknown_08A2E1F8
	ldr r1, _0808E098  @ 0x06013300
	bl CopyDataWithPossibleUncomp
	bl SetDefaultColorEffects
	movs r0, #0xf
	bl BG_EnableSyncByMask
	adds r0, r7, #0
	adds r0, #0x2d
	strb r5, [r0]
	adds r0, #1
	strb r5, [r0]
	adds r0, #0x12
	strb r5, [r0]
	bl GetPlayerLeaderUnitId
	bl GetUnitFromCharId
	str r0, [r7, #0x34]
	movs r0, #0
	bl sub_808DDF8
	adds r1, r7, #0
	adds r1, #0x30
	strb r0, [r1]
	bl sub_80A4BB0
	adds r1, r7, #0
	adds r1, #0x2b
	strb r0, [r1]
	ldr r2, [r7, #0x34]
	ldr r1, [r2, #0xc]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0808E09C
	movs r0, #3
	negs r0, r0
	ands r1, r0
	str r1, [r2, #0xc]
	adds r1, r7, #0
	adds r1, #0x29
	movs r0, #1
	strb r0, [r1]
	b _0808E0A2
	.align 2, 0
_0808E060: .4byte gLCDControlBuffer
_0808E064: .4byte 0x0000FFFE
_0808E068: .4byte 0x0000FFFC
_0808E06C: .4byte 0x0000FFDC
_0808E070: .4byte gUiFramePaletteA
_0808E074: .4byte gUnknown_08A2E5EC
_0808E078: .4byte 0x06005800
_0808E07C: .4byte gUnknown_08A2E4C4
_0808E080: .4byte gUnknown_02020188
_0808E084: .4byte gBG2TilemapBuffer
_0808E088: .4byte gUnknown_08A2D32C
_0808E08C: .4byte 0x06013000
_0808E090: .4byte gUnknown_08A2E1B8
_0808E094: .4byte gUnknown_08A2E1F8
_0808E098: .4byte 0x06013300
_0808E09C:
	adds r0, r7, #0
	adds r0, #0x29
	strb r5, [r0]
_0808E0A2:
	bl sub_808DDC0
	cmp r0, #0
	beq _0808E0AE
	bl sub_808DCF8
_0808E0AE:
	str r0, [r7, #0x38]
	movs r0, #0x80
	bl sub_808DDF8
	adds r1, r7, #0
	adds r1, #0x31
	strb r0, [r1]
	bl SetupMapSpritesPalettes
	adds r4, r7, #0
	adds r4, #0x34
	movs r5, #1
_0808E0C6:
	ldr r0, [r4]
	cmp r0, #0
	beq _0808E0D4
	bl GetUnitSMSId
	bl SMS_RegisterUsage
_0808E0D4:
	adds r4, #4
	subs r5, #1
	cmp r5, #0
	bge _0808E0C6
	bl SMS_FlushIndirect
	ldr r6, _0808E190  @ gLCDControlBuffer
	ldrb r0, [r6, #1]
	movs r1, #0x20
	orrs r0, r1
	movs r1, #0x41
	negs r1, r1
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r6, #1]
	adds r1, r6, #0
	adds r1, #0x2d
	movs r0, #0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0x28
	strb r0, [r1]
	subs r1, #5
	movs r0, #0xf0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0x48
	strb r0, [r1]
	adds r3, r6, #0
	adds r3, #0x34
	ldrb r0, [r3]
	movs r5, #1
	orrs r0, r5
	movs r1, #2
	orrs r0, r1
	movs r4, #4
	orrs r0, r4
	movs r2, #8
	orrs r0, r2
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r3]
	adds r3, #2
	ldrb r0, [r3]
	orrs r0, r5
	movs r5, #3
	negs r5, r5
	ands r0, r5
	orrs r0, r4
	orrs r0, r2
	orrs r0, r1
	strb r0, [r3]
	adds r0, r7, #0
	movs r1, #0
	movs r2, #0xe
	bl sub_8086BB8
	ldr r0, _0808E194  @ gUnknown_08B1754C
	movs r1, #0xe0
	lsls r1, r1, #1
	movs r2, #0x40
	bl CopyToPaletteBuffer
	movs r0, #0xc8
	movs r1, #0x12
	movs r2, #2
	adds r3, r7, #0
	bl StartHelpPromptSprite
	ldr r0, _0808E198  @ gUnknown_08A01CA4
	adds r1, r7, #0
	bl Proc_Start
	ldrb r1, [r6, #1]
	movs r0, #2
	negs r0, r0
	ands r0, r1
	ands r0, r5
	movs r1, #5
	negs r1, r1
	ands r0, r1
	subs r1, #4
	ands r0, r1
	subs r1, #8
	ands r0, r1
	strb r0, [r6, #1]
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808E190: .4byte gLCDControlBuffer
_0808E194: .4byte gUnknown_08B1754C
_0808E198: .4byte gUnknown_08A01CA4

	THUMB_FUNC_END sub_808DF24

	THUMB_FUNC_START sub_808E19C
sub_808E19C: @ 0x0808E19C
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	ldr r5, _0808E22C  @ gUnknown_02004BBC
	ldr r0, _0808E230  @ gUnknown_02022F1A
	movs r1, #3
	movs r2, #3
	movs r3, #0
	bl TileMap_FillRect
	adds r0, r5, #0
	adds r0, #8
	bl SetFont
	movs r0, #0
	bl SetFontGlyphSet
	adds r0, r5, #0
	movs r1, #0
	bl Text_80046B4
	cmp r6, #0
	bne _0808E1CC
	b _0808E318
_0808E1CC:
	ldr r0, [r6, #0xc]
	movs r1, #0xa0
	lsls r1, r1, #2
	ands r0, r1
	cmp r0, #0
	beq _0808E238
	adds r0, r5, #0
	movs r1, #2
	bl Text_SetColorId
	adds r0, r5, #0
	movs r1, #0x82
	bl Text_SetXCursor
	ldr r4, _0808E234  @ 0x00000535
	adds r0, r4, #0
	bl GetStringFromIndex
	adds r1, r0, #0
	adds r0, r5, #0
	bl Text_AppendString
	adds r0, r5, #0
	movs r1, #0xa2
	bl Text_SetXCursor
	adds r0, r4, #0
	bl GetStringFromIndex
	adds r1, r0, #0
	adds r0, r5, #0
	bl Text_AppendString
	adds r0, r5, #0
	movs r1, #0xba
	bl Text_SetXCursor
	adds r0, r4, #0
	bl GetStringFromIndex
	adds r1, r0, #0
	adds r0, r5, #0
	bl Text_AppendString
	movs r0, #1
	bl sub_808DEF0
	b _0808E364
	.align 2, 0
_0808E22C: .4byte gUnknown_02004BBC
_0808E230: .4byte gUnknown_02022F1A
_0808E234: .4byte 0x00000535
_0808E238:
	adds r0, r5, #0
	movs r1, #0
	bl Text_SetColorId
	ldr r0, [r6]
	ldrh r0, [r0]
	bl GetStringFromIndex
	adds r4, r0, #0
	movs r0, #0x30
	adds r1, r4, #0
	bl GetStringTextCenteredPos
	adds r1, r0, #0
	adds r0, r5, #0
	bl Text_SetXCursor
	adds r0, r5, #0
	adds r1, r4, #0
	bl Text_AppendString
	adds r0, r5, #0
	movs r1, #2
	bl Text_SetColorId
	adds r0, r5, #0
	movs r1, #0x8a
	bl Text_SetXCursor
	movs r1, #8
	ldrsb r1, [r6, r1]
	adds r0, r5, #0
	bl Text_AppendNumberOr2Dashes
	adds r0, r6, #0
	bl GetUnitCurrentHp
	cmp r0, #0x63
	ble _0808E2A4
	adds r0, r5, #0
	movs r1, #0xa2
	bl Text_SetXCursor
	ldr r0, _0808E2A0  @ 0x00000535
	bl GetStringFromIndex
	adds r1, r0, #0
	adds r0, r5, #0
	bl Text_AppendString
	b _0808E2BA
	.align 2, 0
_0808E2A0: .4byte 0x00000535
_0808E2A4:
	adds r0, r5, #0
	movs r1, #0xaa
	bl Text_SetXCursor
	adds r0, r6, #0
	bl GetUnitCurrentHp
	adds r1, r0, #0
	adds r0, r5, #0
	bl Text_AppendNumberOr2Dashes
_0808E2BA:
	adds r0, r6, #0
	bl GetUnitMaxHp
	cmp r0, #0x63
	ble _0808E2E0
	adds r0, r5, #0
	movs r1, #0xba
	bl Text_SetXCursor
	ldr r0, _0808E2DC  @ 0x00000535
	bl GetStringFromIndex
	adds r1, r0, #0
	adds r0, r5, #0
	bl Text_AppendString
	b _0808E2F6
	.align 2, 0
_0808E2DC: .4byte 0x00000535
_0808E2E0:
	adds r0, r5, #0
	movs r1, #0xc2
	bl Text_SetXCursor
	adds r0, r6, #0
	bl GetUnitMaxHp
	adds r1, r0, #0
	adds r0, r5, #0
	bl Text_AppendNumberOr2Dashes
_0808E2F6:
	adds r0, r6, #0
	bl GetUnitMiniPortraitId
	ldr r1, _0808E314  @ gUnknown_02022F1A
	movs r2, #0xa0
	lsls r2, r2, #2
	movs r3, #0
	str r3, [sp]
	movs r3, #4
	bl sub_8005988
	movs r0, #0
	bl sub_808DEF0
	b _0808E364
	.align 2, 0
_0808E314: .4byte gUnknown_02022F1A
_0808E318:
	adds r0, r5, #0
	movs r1, #2
	bl Text_SetColorId
	adds r0, r5, #0
	movs r1, #0x82
	bl Text_SetXCursor
	ldr r4, _0808E3CC  @ 0x00000535
	adds r0, r4, #0
	bl GetStringFromIndex
	adds r1, r0, #0
	adds r0, r5, #0
	bl Text_AppendString
	adds r0, r5, #0
	movs r1, #0xa2
	bl Text_SetXCursor
	adds r0, r4, #0
	bl GetStringFromIndex
	adds r1, r0, #0
	adds r0, r5, #0
	bl Text_AppendString
	adds r0, r5, #0
	movs r1, #0xba
	bl Text_SetXCursor
	adds r0, r4, #0
	bl GetStringFromIndex
	adds r1, r0, #0
	adds r0, r5, #0
	bl Text_AppendString
_0808E364:
	adds r0, r5, #0
	movs r1, #0
	bl Text_SetColorId
	adds r0, r5, #0
	movs r1, #0xb3
	bl Text_SetXCursor
	ldr r0, _0808E3D0  @ 0x00000539
	bl GetStringFromIndex
	adds r1, r0, #0
	adds r0, r5, #0
	bl Text_AppendString
	movs r0, #0
	bl SetFont
	movs r0, #1
	bl BG_EnableSyncByMask
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
	movs r0, #1
	movs r1, #0xd
	movs r2, #3
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	movs r0, #0
	bl sub_8001F48
	movs r0, #0
	bl sub_8001F64
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0808E3CC: .4byte 0x00000535
_0808E3D0: .4byte 0x00000539

	THUMB_FUNC_END sub_808E19C

	THUMB_FUNC_START sub_808E3D4
sub_808E3D4: @ 0x0808E3D4
	ldr r2, _0808E3F0  @ gLCDControlBuffer
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
_0808E3F0: .4byte gLCDControlBuffer

	THUMB_FUNC_END sub_808E3D4

	THUMB_FUNC_START sub_808E3F4
sub_808E3F4: @ 0x0808E3F4
	push {r4, lr}
	ldr r0, _0808E430  @ gUnknown_0859EF00
	movs r1, #0xd0
	lsls r1, r1, #2
	movs r2, #0x20
	bl CopyToPaletteBuffer
	ldr r4, _0808E434  @ gUnknown_02004BC4
	ldr r1, _0808E438  @ 0x06017800
	adds r0, r4, #0
	movs r2, #0x1a
	bl InitSomeOtherGraphicsRelatedStruct
	adds r0, r4, #0
	bl SetFont
	movs r0, #0
	bl SetFontGlyphSet
	subs r4, #8
	adds r0, r4, #0
	bl Text_Init3
	movs r0, #0
	bl SetFont
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808E430: .4byte gUnknown_0859EF00
_0808E434: .4byte gUnknown_02004BC4
_0808E438: .4byte 0x06017800

	THUMB_FUNC_END sub_808E3F4

	THUMB_FUNC_START sub_808E43C
sub_808E43C: @ 0x0808E43C
	push {r4, r5, lr}
	ldr r5, _0808E4A0  @ gUnknown_02023028
	adds r0, r5, #0
	movs r1, #0xf
	movs r2, #6
	movs r3, #0
	bl TileMap_FillRect
	adds r0, r5, #0
	adds r0, #0x18
	ldr r1, _0808E4A4  @ gRAMChapterData
	ldrh r2, [r1, #0x10]
	movs r1, #2
	bl sub_8004B88
	adds r4, r5, #0
	adds r4, #0x96
	bl GetPartyGoldAmount
	adds r2, r0, #0
	adds r0, r4, #0
	movs r1, #2
	bl sub_8004B88
	adds r0, r5, #0
	adds r0, #0x98
	movs r1, #3
	movs r2, #0x1e
	bl sub_8004B0C
	ldr r1, _0808E4A8  @ 0xFFFFFEE2
	adds r0, r5, r1
	movs r1, #3
	movs r2, #0x24
	movs r3, #0x25
	bl sub_8004D5C
	adds r0, r5, #0
	subs r0, #0x9e
	movs r1, #3
	movs r2, #0x22
	movs r3, #0x23
	bl sub_8004D5C
	movs r0, #1
	bl BG_EnableSyncByMask
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0808E4A0: .4byte gUnknown_02023028
_0808E4A4: .4byte gRAMChapterData
_0808E4A8: .4byte 0xFFFFFEE2

	THUMB_FUNC_END sub_808E43C

	THUMB_FUNC_START sub_808E4AC
sub_808E4AC: @ 0x0808E4AC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	ldr r0, _0808E504  @ gUnknown_08A01B3C
	bl InitTextBatch
	adds r0, r6, #0
	bl sub_808E3F4
	adds r0, r6, #0
	adds r0, #0x2e
	ldrb r1, [r0]
	lsls r1, r1, #2
	adds r0, #6
	adds r0, r0, r1
	ldr r0, [r0]
	bl sub_808E19C
	ldr r4, _0808E508  @ gUnknown_020235F0
	adds r0, r6, #0
	adds r0, #0x30
	ldrb r2, [r0]
	adds r0, r4, #0
	movs r1, #2
	bl sub_8004B88
	ldr r0, _0808E50C  @ gRAMChapterData
	ldrb r0, [r0, #0xd]
	cmp r0, #0
	beq _0808E510
	adds r0, r4, #0
	adds r0, #0xe
	movs r1, #2
	movs r2, #0x14
	bl sub_8004B0C
	adds r0, r4, #0
	adds r0, #0x10
	movs r1, #2
	movs r2, #0x14
	bl sub_8004B0C
	b _0808E520
	.align 2, 0
_0808E504: .4byte gUnknown_08A01B3C
_0808E508: .4byte gUnknown_020235F0
_0808E50C: .4byte gRAMChapterData
_0808E510:
	adds r0, r4, #0
	adds r0, #0xe
	adds r1, r6, #0
	adds r1, #0x31
	ldrb r2, [r1]
	movs r1, #2
	bl sub_8004B88
_0808E520:
	adds r4, r6, #0
	adds r4, #0x2c
	movs r0, #1
	strb r0, [r4]
	bl GetChapterThing
	mov r8, r4
	cmp r0, #2
	beq _0808E548
	ldr r0, _0808E544  @ gRAMChapterData
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetROMChapterStruct
	adds r0, #0x88
	ldrh r0, [r0]
	b _0808E54C
	.align 2, 0
_0808E544: .4byte gRAMChapterData
_0808E548:
	movs r0, #0xe0
	lsls r0, r0, #1
_0808E54C:
	bl GetStringFromIndex
	adds r5, r0, #0
	ldr r7, _0808E5B4  @ gUnknown_02004BAC
	movs r0, #0x60
	adds r1, r5, #0
	bl GetStringTextCenteredPos
	adds r1, r0, #0
	adds r0, r7, #0
	movs r2, #0
	adds r3, r5, #0
	bl Text_InsertString
	adds r0, r5, #0
	bl sub_808DEBC
	adds r5, r0, #0
	cmp r5, #0
	beq _0808E592
	adds r4, r7, #0
	adds r4, #8
	movs r0, #0x60
	adds r1, r5, #0
	bl GetStringTextCenteredPos
	adds r1, r0, #0
	adds r0, r4, #0
	movs r2, #0
	adds r3, r5, #0
	bl Text_InsertString
	movs r0, #2
	mov r1, r8
	strb r0, [r1]
_0808E592:
	mov r1, r8
	ldrb r0, [r1]
	cmp r0, #2
	bne _0808E5BC
	ldr r4, _0808E5B8  @ gUnknown_02022F2A
	adds r0, r7, #0
	adds r1, r4, #0
	bl Text_Draw
	adds r0, r7, #0
	adds r0, #8
	adds r4, #0x80
	adds r1, r4, #0
	bl Text_Draw
	b _0808E5C4
	.align 2, 0
_0808E5B4: .4byte gUnknown_02004BAC
_0808E5B8: .4byte gUnknown_02022F2A
_0808E5BC:
	ldr r1, _0808E5FC  @ gUnknown_02022F6A
	adds r0, r7, #0
	bl Text_Draw
_0808E5C4:
	adds r4, r6, #0
	adds r4, #0x2b
	ldrb r0, [r4]
	cmp r0, #0
	beq _0808E5E6
	ldr r0, _0808E600  @ gRAMChapterData
	ldrb r1, [r0, #0x14]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	bne _0808E5E6
	ldr r0, _0808E604  @ gUnknown_02022CDC
	ldrb r2, [r4]
	adds r2, #1
	movs r1, #0
	bl DrawDecNumber
_0808E5E6:
	bl sub_808E43C
	movs r0, #1
	bl BG_EnableSyncByMask
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808E5FC: .4byte gUnknown_02022F6A
_0808E600: .4byte gRAMChapterData
_0808E604: .4byte gUnknown_02022CDC

	THUMB_FUNC_END sub_808E4AC

	THUMB_FUNC_START sub_808E608
sub_808E608: @ 0x0808E608
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r3, r5, #0
	adds r3, #0x2e
	ldrb r7, [r3]
	adds r4, r5, #0
	adds r4, #0x3e
	movs r0, #0
	strb r0, [r4]
	ldr r1, _0808E638  @ gKeyStatusPtr
	ldr r6, [r1]
	ldrh r2, [r6, #8]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r2
	mov ip, r1
	cmp r0, #0
	beq _0808E63C
	movs r0, #1
	strb r0, [r4]
	adds r0, r5, #0
	bl sub_808DCAC
	b _0808E710
	.align 2, 0
_0808E638: .4byte gKeyStatusPtr
_0808E63C:
	movs r0, #1
	ands r0, r2
	cmp r0, #0
	beq _0808E690
	ldrb r1, [r3]
	lsls r1, r1, #2
	adds r0, r5, #0
	adds r0, #0x34
	adds r0, r0, r1
	ldr r2, [r0]
	cmp r2, #0
	beq _0808E670
	ldr r0, [r2, #0xc]
	movs r1, #0xa0
	lsls r1, r1, #2
	ands r0, r1
	cmp r0, #0
	bne _0808E670
	movs r0, #0xb
	ldrsb r0, [r2, r0]
	bl SetLastStatScreenUid
	adds r1, r5, #0
	adds r1, #0x2a
	movs r0, #1
	strb r0, [r1]
_0808E670:
	ldr r0, _0808E68C  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0808E682
	movs r0, #0x6a
	bl m4aSongNumStart
_0808E682:
	adds r0, r5, #0
	movs r1, #1
	bl Proc_Goto
	b _0808E710
	.align 2, 0
_0808E68C: .4byte gRAMChapterData
_0808E690:
	movs r0, #2
	ands r0, r2
	cmp r0, #0
	beq _0808E6B8
	adds r0, r5, #0
	movs r1, #1
	bl Proc_Goto
	ldr r0, _0808E6B4  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0808E710
	movs r0, #0x6b
	bl m4aSongNumStart
	b _0808E710
	.align 2, 0
_0808E6B4: .4byte gRAMChapterData
_0808E6B8:
	ldrh r1, [r6, #6]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _0808E6CC
	ldrb r0, [r3]
	cmp r0, #0
	beq _0808E6CC
	subs r0, #1
	strb r0, [r3]
_0808E6CC:
	mov r1, ip
	ldr r0, [r1]
	ldrh r1, [r0, #6]
	movs r0, #0x10
	ands r0, r1
	adds r4, r5, #0
	adds r4, #0x2e
	cmp r0, #0
	beq _0808E6E8
	ldrb r0, [r4]
	cmp r0, #0
	bne _0808E6E8
	adds r0, #1
	strb r0, [r4]
_0808E6E8:
	ldrb r0, [r4]
	cmp r0, r7
	beq _0808E710
	ldr r0, _0808E718  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0808E700
	movs r0, #0x66
	bl m4aSongNumStart
_0808E700:
	ldrb r0, [r4]
	lsls r0, r0, #2
	adds r1, r5, #0
	adds r1, #0x34
	adds r1, r1, r0
	ldr r0, [r1]
	bl sub_808E19C
_0808E710:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808E718: .4byte gRAMChapterData

	THUMB_FUNC_END sub_808E608

	THUMB_FUNC_START sub_808E71C
sub_808E71C: @ 0x0808E71C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0808E744  @ gUnknown_08A01CA4
	bl Proc_EndEach
	bl EndHelpPromptSprite
	adds r0, r4, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #0
	beq _0808E73E
	ldr r0, [r4, #0x34]
	ldr r1, [r0, #0xc]
	movs r2, #2
	orrs r1, r2
	str r1, [r0, #0xc]
_0808E73E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808E744: .4byte gUnknown_08A01CA4

	THUMB_FUNC_END sub_808E71C

	THUMB_FUNC_START sub_808E748
sub_808E748: @ 0x0808E748
	push {lr}
	adds r1, r0, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	cmp r0, #0
	beq _0808E75A
	ldr r0, _0808E760  @ gProcScr_ADJUSTSFROMXI
	bl Proc_StartBlocking
_0808E75A:
	pop {r0}
	bx r0
	.align 2, 0
_0808E760: .4byte gProcScr_ADJUSTSFROMXI

	THUMB_FUNC_END sub_808E748

	THUMB_FUNC_START NewChapterStatusScreen
NewChapterStatusScreen: @ 0x0808E764
	push {r4, lr}
	adds r4, r0, #0
	cmp r4, #0
	beq _0808E784
	ldr r0, _0808E780  @ gUnknown_08A01B54
	adds r1, r4, #0
	bl Proc_StartBlocking
	adds r1, r0, #0
	adds r1, #0x3f
	movs r0, #0
	strb r0, [r1]
	b _0808E790
	.align 2, 0
_0808E780: .4byte gUnknown_08A01B54
_0808E784:
	ldr r0, _0808E798  @ gUnknown_08A01B54
	movs r1, #3
	bl Proc_Start
	adds r0, #0x3f
	strb r4, [r0]
_0808E790:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808E798: .4byte gUnknown_08A01B54

	THUMB_FUNC_END NewChapterStatusScreen

	THUMB_FUNC_START sub_808E79C
sub_808E79C: @ 0x0808E79C
	push {lr}
	adds r1, r0, #0
	ldr r0, _0808E7B0  @ gUnknown_08A01C04
	bl Proc_StartBlocking
	adds r0, #0x3f
	movs r1, #1
	strb r1, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_0808E7B0: .4byte gUnknown_08A01C04

	THUMB_FUNC_END sub_808E79C

	THUMB_FUNC_START sub_808E7B4
sub_808E7B4: @ 0x0808E7B4
	push {r4, lr}
	adds r4, r0, #0
	bl LoadObjUIGfx
	ldr r0, _0808E804  @ gUnknown_08A2E4A4
	movs r1, #0xa0
	lsls r1, r1, #2
	movs r2, #0x20
	bl CopyToPaletteBuffer
	ldr r0, _0808E808  @ gUnknown_08A2E8F0
	movs r1, #0xb8
	lsls r1, r1, #2
	movs r2, #0x20
	bl CopyToPaletteBuffer
	ldr r0, _0808E80C  @ gUnknown_08A2E214
	ldr r1, _0808E810  @ 0x06016800
	bl CopyDataWithPossibleUncomp
	adds r4, #0x64
	movs r0, #0
	strh r0, [r4]
	movs r0, #0x80
	movs r1, #0x13
	bl sub_80895B4
	movs r4, #0xb8
	lsls r4, r4, #4
	ldr r0, _0808E814  @ gRAMChapterData
	bl sub_808979C
	adds r1, r0, #0
	adds r0, r4, #0
	bl sub_8089624
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808E804: .4byte gUnknown_08A2E4A4
_0808E808: .4byte gUnknown_08A2E8F0
_0808E80C: .4byte gUnknown_08A2E214
_0808E810: .4byte 0x06016800
_0808E814: .4byte gRAMChapterData

	THUMB_FUNC_END sub_808E7B4

	THUMB_FUNC_START sub_808E818
sub_808E818: @ 0x0808E818
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	ldr r7, [r0, #0x14]
	ldr r3, _0808E990  @ gUnknown_08A01B18
	ldr r0, _0808E994  @ 0x00008580
	str r0, [sp]
	movs r0, #4
	movs r1, #4
	movs r2, #3
	bl PutSprite
	ldr r3, _0808E998  @ gUnknown_08A01B2C
	ldr r0, _0808E99C  @ 0x00009580
	str r0, [sp]
	movs r0, #4
	movs r1, #0x96
	movs r2, #0x7c
	bl PutSprite
	adds r0, r7, #0
	adds r0, #0x3f
	ldrb r0, [r0]
	cmp r0, #0
	bne _0808E862
	ldr r3, _0808E9A0  @ gUnknown_08A01C7C
	movs r0, #0xde
	lsls r0, r0, #6
	str r0, [sp]
	movs r0, #4
	movs r1, #4
	movs r2, #0xb
	bl PutSprite
_0808E862:
	adds r5, r7, #0
	adds r5, #0x2e
	ldrb r0, [r5]
	lsls r1, r0, #3
	subs r1, r1, r0
	lsls r1, r1, #3
	ldr r3, _0808E9A4  @ gUnknown_08A01AE6
	movs r0, #0xeb
	lsls r0, r0, #7
	str r0, [sp]
	movs r0, #4
	movs r2, #0x2c
	bl PutSprite
	ldr r3, _0808E9A8  @ gUnknown_08A01AAC
	movs r4, #0
	str r4, [sp]
	movs r0, #4
	movs r1, #8
	movs r2, #0x25
	bl PutSprite
	ldr r3, _0808E9AC  @ gUnknown_08A01ABA
	str r4, [sp]
	movs r0, #4
	movs r1, #0x40
	movs r2, #0x25
	bl PutSprite
	ldr r3, _0808E9B0  @ gUnknown_08A01AD6
	str r4, [sp]
	movs r0, #4
	movs r1, #0x12
	movs r2, #0x73
	bl PutSprite
	ldr r3, _0808E9B4  @ gUnknown_08A01ADE
	str r4, [sp]
	movs r0, #4
	movs r1, #0x12
	movs r2, #0x83
	bl PutSprite
	ldr r3, _0808E9B8  @ gUnknown_08A01AC8
	str r4, [sp]
	movs r0, #4
	movs r1, #0x1c
	movs r2, #0x43
	bl PutSprite
	mov r8, r5
	movs r0, #0x34
	adds r0, r0, r7
	mov r9, r0
	movs r1, #0x2b
	adds r1, r1, r7
	mov sl, r1
	ldr r6, _0808E9BC  @ 0x0000A3C0
	movs r5, #0xa0
	movs r4, #1
_0808E8DA:
	str r6, [sp]
	movs r0, #4
	adds r1, r5, #0
	movs r2, #0x3c
	ldr r3, _0808E9C0  @ gObject_32x16
	bl PutSprite
	adds r6, #4
	adds r5, #0x20
	subs r4, #1
	cmp r4, #0
	bge _0808E8DA
	ldr r3, _0808E9C0  @ gObject_32x16
	ldr r0, _0808E9C4  @ 0x0000A3D0
	str r0, [sp]
	movs r0, #4
	movs r1, #0xb4
	movs r2, #0x4b
	bl PutSprite
	ldr r6, _0808E9C8  @ 0x0000A3D4
	movs r5, #0x9c
	movs r4, #1
_0808E908:
	str r6, [sp]
	movs r0, #4
	adds r1, r5, #0
	movs r2, #0x5b
	ldr r3, _0808E9C0  @ gObject_32x16
	bl PutSprite
	adds r6, #4
	adds r5, #0x20
	subs r4, #1
	cmp r4, #0
	bge _0808E908
	ldr r4, _0808E9CC  @ gUnknown_020230CE
	bl GetGameClock
	adds r2, r0, #0
	adds r0, r4, #0
	movs r1, #2
	movs r3, #0
	bl sub_8004C68
	movs r0, #1
	bl BG_EnableSyncByMask
	mov r1, r8
	ldrb r0, [r1]
	lsls r0, r0, #2
	add r0, r9
	ldr r3, [r0]
	cmp r3, #0
	beq _0808E950
	movs r0, #4
	movs r1, #0x88
	movs r2, #0x3d
	bl sub_8027B60
_0808E950:
	bl SMS_FlushDirect
	mov r1, sl
	ldrb r0, [r1]
	cmp r0, #0
	beq _0808E97A
	ldr r0, _0808E9D0  @ gRAMChapterData
	ldrb r1, [r0, #0x14]
	movs r0, #4
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0
	bne _0808E97A
	ldr r3, _0808E9D4  @ gUnknown_08A01AA4
	str r0, [sp]
	movs r0, #4
	movs r1, #0xdb
	movs r2, #3
	bl PutSprite
_0808E97A:
	adds r0, r7, #0
	bl sub_808DE38
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808E990: .4byte gUnknown_08A01B18
_0808E994: .4byte 0x00008580
_0808E998: .4byte gUnknown_08A01B2C
_0808E99C: .4byte 0x00009580
_0808E9A0: .4byte gUnknown_08A01C7C
_0808E9A4: .4byte gUnknown_08A01AE6
_0808E9A8: .4byte gUnknown_08A01AAC
_0808E9AC: .4byte gUnknown_08A01ABA
_0808E9B0: .4byte gUnknown_08A01AD6
_0808E9B4: .4byte gUnknown_08A01ADE
_0808E9B8: .4byte gUnknown_08A01AC8
_0808E9BC: .4byte 0x0000A3C0
_0808E9C0: .4byte gObject_32x16
_0808E9C4: .4byte 0x0000A3D0
_0808E9C8: .4byte 0x0000A3D4
_0808E9CC: .4byte gUnknown_020230CE
_0808E9D0: .4byte gRAMChapterData
_0808E9D4: .4byte gUnknown_08A01AA4

	THUMB_FUNC_END sub_808E818

