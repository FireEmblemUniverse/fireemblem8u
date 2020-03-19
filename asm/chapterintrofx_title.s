	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	@ Proc Displaying Chapter Title in the middle of the screen

	THUMB_FUNC_START sub_802237C
sub_802237C: @ 0x0802237C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	str r0, [sp]
	ldr r1, _080223A4  @ gRAMChapterData
	movs r0, #0xe
	ldrsb r0, [r1, r0]
	cmp r0, #0x16
	beq _08022398
	cmp r0, #0x23
	bne _080223AC
_08022398:
	ldr r1, _080223A8  @ 0x000003E7
	ldr r0, [sp]
	bl Proc_Goto
	b _080224BE
	.align 2, 0
_080223A4: .4byte gRAMChapterData
_080223A8: .4byte 0x000003E7
_080223AC:
	bl SetupBackgroundForWeatherMaybe
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
	ldr r2, _080224D0  @ gBG0TilemapBuffer
	mov r8, r2
	mov r0, r8
	movs r1, #0
	bl BG_Fill
	ldr r0, _080224D4  @ gBG1TilemapBuffer
	movs r1, #0
	bl BG_Fill
	ldr r0, _080224D8  @ gBG2TilemapBuffer
	movs r1, #0
	bl BG_Fill
	ldr r0, _080224DC  @ gBG3TilemapBuffer
	movs r1, #0
	bl BG_Fill
	ldr r7, _080224E0  @ gLCDControlBuffer
	ldrb r0, [r7, #1]
	movs r5, #0x20
	orrs r0, r5
	movs r1, #0x41
	negs r1, r1
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r7, #1]
	movs r0, #0x34
	adds r0, r0, r7
	mov r9, r0
	ldrb r1, [r0]
	movs r2, #1
	orrs r1, r2
	movs r0, #2
	orrs r1, r0
	movs r6, #4
	orrs r1, r6
	movs r4, #8
	orrs r1, r4
	movs r3, #0x10
	orrs r1, r3
	movs r0, #0x36
	adds r0, r0, r7
	mov ip, r0
	ldrb r2, [r0]
	movs r0, #2
	negs r0, r0
	ands r0, r2
	movs r2, #3
	negs r2, r2
	mov sl, r2
	ands r0, r2
	orrs r0, r6
	orrs r0, r4
	orrs r0, r3
	orrs r1, r5
	mov r2, r9
	strb r1, [r2]
	orrs r0, r5
	mov r1, ip
	strb r0, [r1]
	adds r0, r7, #0
	adds r0, #0x2d
	movs r5, #0
	strb r5, [r0]
	adds r1, r7, #0
	adds r1, #0x31
	movs r0, #0x40
	strb r0, [r1]
	subs r1, #5
	movs r0, #0xf0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0x60
	strb r0, [r1]
	movs r0, #8
	movs r1, #1
	bl sub_80895B4
	movs r4, #0x80
	lsls r4, r4, #1
	ldr r0, _080224E4  @ gRAMChapterData
	bl sub_808979C
	adds r1, r0, #0
	adds r0, r4, #0
	bl sub_8089624
	ldr r2, _080224E8  @ 0x00000246
	add r8, r2
	mov r0, r8
	movs r1, #1
	bl sub_80896D8
	bl EnablePaletteSync
	movs r0, #0xf
	bl BG_EnableSyncByMask
	ldrb r0, [r7, #1]
	movs r1, #1
	orrs r0, r1
	mov r2, sl
	ands r0, r2
	subs r1, #6
	ands r0, r1
	subs r1, #4
	ands r0, r1
	subs r1, #8
	ands r0, r1
	strb r0, [r7, #1]
	ldr r0, [sp]
	adds r0, #0x52
	strh r5, [r0]
_080224BE:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080224D0: .4byte gBG0TilemapBuffer
_080224D4: .4byte gBG1TilemapBuffer
_080224D8: .4byte gBG2TilemapBuffer
_080224DC: .4byte gBG3TilemapBuffer
_080224E0: .4byte gLCDControlBuffer
_080224E4: .4byte gRAMChapterData
_080224E8: .4byte 0x00000246

	THUMB_FUNC_END sub_802237C

	THUMB_FUNC_START sub_80224EC
sub_80224EC: @ 0x080224EC
	push {lr}
	ldr r0, _08022520  @ gBG0TilemapBuffer
	movs r1, #0
	bl BG_Fill
	movs r0, #1
	bl BG_EnableSyncByMask
	ldr r2, _08022524  @ gLCDControlBuffer
	ldrb r1, [r2, #1]
	movs r0, #2
	negs r0, r0
	ands r0, r1
	movs r1, #3
	negs r1, r1
	ands r0, r1
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
_08022520: .4byte gBG0TilemapBuffer
_08022524: .4byte gLCDControlBuffer

	THUMB_FUNC_END sub_80224EC

	THUMB_FUNC_START sub_8022528
sub_8022528: @ 0x08022528
	push {r4, r5, lr}
	movs r0, #0
	bl SetupBackgrounds
	ldr r0, _080225A0  @ gBG2TilemapBuffer
	movs r1, #0
	bl BG_Fill
	movs r0, #4
	bl BG_EnableSyncByMask
	bl DisableMapPaletteAnimations
	ldr r4, _080225A4  @ gRAMChapterData
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	bl UnpackChapterMapGraphics
	bl SetupMapSpritesPalettes
	bl LoadObjUIGfx
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	bl GetROMChapterStruct
	ldrb r0, [r0, #0x10]
	lsls r0, r0, #4
	bl sub_8015A40
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r0, #0xf
	movs r1, #0xf8
	lsls r1, r1, #1
	ands r0, r1
	ldr r5, _080225A8  @ gUnknown_0202BCB0
	strh r0, [r5, #0xc]
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	bl GetROMChapterStruct
	ldrb r0, [r0, #0x11]
	lsls r0, r0, #4
	bl sub_8015A6C
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r0, #0xf
	movs r1, #0xfc
	lsls r1, r1, #2
	ands r0, r1
	strh r0, [r5, #0xe]
	bl RefreshEntityBmMaps
	bl RenderBmMap
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080225A0: .4byte gBG2TilemapBuffer
_080225A4: .4byte gRAMChapterData
_080225A8: .4byte gUnknown_0202BCB0

	THUMB_FUNC_END sub_8022528

.align 2, 0
