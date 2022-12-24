	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

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
	bl EndPrepScreenMenu
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

	THUMB_FUNC_START AtMenu_Reinitialize
AtMenu_Reinitialize: @ 0x08095C84
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
	bl AtMenu_AutoCapDeployPrepScreenUnits
	bl ReorderPlayerUnitsBasedOnDeployment
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
	bl AtMenu_InitPrepScreenMenu
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
	ldr r4, _08095E40  @ gGenericBuffer
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
_08095E40: .4byte gGenericBuffer
_08095E44: .4byte gUnknown_020235EA
_08095E48:
	ldr r0, _08095EAC  @ gUnknown_08A1B658
	ldr r5, _08095EB0  @ gGenericBuffer
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
	bl Prep_DrawChapterGoal
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
_08095EB0: .4byte gGenericBuffer
_08095EB4: .4byte gUnknown_02023548
_08095EB8: .4byte gUnknown_08A1B698

	THUMB_FUNC_END AtMenu_Reinitialize

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
	ldr r5, _08096174  @ gGenericBuffer
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
_08096174: .4byte gGenericBuffer
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
	bl SetBlendTargetA
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
	bl ReorderPlayerUnitsBasedOnDeployment
	adds r4, #0x36
	ldrb r0, [r4]
	cmp r0, #0
	beq _080962F6
	bl EndPrepScreen
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

	THUMB_FUNC_START AtMenu_StartSubmenu
AtMenu_StartSubmenu: @ 0x0809631C
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

	THUMB_FUNC_END AtMenu_StartSubmenu

	THUMB_FUNC_START AtMenu_OnSubmenuEnd
AtMenu_OnSubmenuEnd: @ 0x08096390
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

	THUMB_FUNC_END AtMenu_OnSubmenuEnd

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

	THUMB_FUNC_START AtMenu_LockGame
AtMenu_LockGame: @ 0x08096424
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

	THUMB_FUNC_END AtMenu_LockGame

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

.align 2, 0
