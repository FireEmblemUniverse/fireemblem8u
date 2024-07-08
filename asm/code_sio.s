	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	@ Everything related to link arena multiplayer stuff

	@ Needs further splitting, but since I know nothing about
	@ all this, this will have to wait.

	THUMB_FUNC_START sub_80469C4
sub_80469C4: @ 0x080469C4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x6c
	adds r7, r0, #0
	movs r0, #0
	str r0, [sp, #0x54]
	bl ClearSioBG
	bl InitSioBG
	ldr r1, [sp, #0x54]
	str r1, [sp]
	adds r0, r7, #0
	movs r1, #0
	movs r2, #0x10
	movs r3, #4
	bl StartMuralBackgroundExt
	ldr r0, _08046AB8  @ Img_TacticianSelObj
	ldr r1, _08046ABC  @ 0x06014800
	bl Decompress
	ldr r0, _08046AC0  @ Font_0203DB64
	bl SetTextFont
	bl InitSystemTextFont
	bl ResetTextFont
	movs r0, #0xc0
	movs r1, #0x10
	adds r2, r7, #0
	bl StartLinkArenaButtonSpriteDraw
	ldr r4, _08046AC4  @ gSioTexts
	adds r0, r4, #0
	movs r1, #0x18
	bl InitText
	adds r4, #8
	adds r0, r4, #0
	movs r1, #0x18
	bl InitText
	ldr r0, _08046AC8  @ 0x0000074C
	movs r1, #0
	bl sub_8043100
	ldr r0, _08046ACC  @ 0x0000074D
	movs r1, #1
	bl sub_8043100
	movs r0, #1
	negs r0, r0
	str r0, [r7, #0x4c]
	movs r2, #2
	mov r9, r2
	mov r3, sp
	adds r3, #0x50
	str r3, [sp, #0x58]
	add r6, sp, #4
	movs r5, #8
	mov r4, sp
	adds r4, #0x52
_08046A4A:
	movs r0, #0
	strb r0, [r4]
	mov r0, r9
	bl IsSaveValid
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08046B34
	mov r0, r9
	add r1, sp, #4
	bl ReadGameSavePlaySt
	add r0, sp, #4
	bl GetChapterTitleExtra
	adds r2, r7, #0
	adds r2, #0x2c
	adds r1, r2, r5
	str r0, [r1]
	ldrb r1, [r6, #0x14]
	movs r0, #0x40
	ands r0, r1
	mov sl, r2
	cmp r0, #0
	beq _08046A84
	ldrb r0, [r4]
	movs r1, #4
	orrs r0, r1
	strb r0, [r4]
_08046A84:
	mov r0, sp
	adds r0, #0x46
	ldrb r0, [r0]
	lsls r0, r0, #0x1a
	cmp r0, #0
	blt _08046AD0
	ldrb r0, [r6, #0x1b]
	cmp r0, #1
	bne _08046A9E
	ldrb r0, [r4]
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r4]
_08046A9E:
	ldrb r0, [r6, #0x1b]
	cmp r0, #2
	bne _08046AAC
	ldrb r0, [r4]
	movs r1, #0x20
	orrs r0, r1
	strb r0, [r4]
_08046AAC:
	ldrb r0, [r6, #0x1b]
	cmp r0, #3
	bne _08046AE4
	ldrb r0, [r4]
	movs r1, #0x40
	b _08046AE0
	.align 2, 0
_08046AB8: .4byte Img_TacticianSelObj
_08046ABC: .4byte 0x06014800
_08046AC0: .4byte Font_0203DB64
_08046AC4: .4byte gSioTexts
_08046AC8: .4byte 0x0000074C
_08046ACC: .4byte 0x0000074D
_08046AD0:
	ldrb r0, [r6, #0x1b]
	cmp r0, #3
	bne _08046ADC
	ldrb r0, [r4]
	movs r1, #0x40
	b _08046AE0
_08046ADC:
	ldrb r0, [r4]
	movs r1, #0x20
_08046AE0:
	orrs r0, r1
	strb r0, [r4]
_08046AE4:
	add r0, sp, #4
	bl IsGameNotFirstChapter
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08046B02
	adds r2, r7, #0
	adds r2, #0x38
	adds r1, r2, r5
	mov r3, sl
	adds r0, r3, r5
	ldr r0, [r0]
	str r0, [r1]
	mov r8, r2
	b _08046B10
_08046B02:
	adds r1, r7, #0
	adds r1, #0x38
	adds r0, r1, r5
	movs r2, #1
	negs r2, r2
	str r2, [r0]
	mov r8, r1
_08046B10:
	mov r3, r8
	adds r0, r3, r5
	ldr r0, [r0]
	movs r1, #1
	negs r1, r1
	cmp r0, r1
	beq _08046B50
	ldr r2, [sp, #0x54]
	cmp r2, #0
	bne _08046B2E
	mov r3, r9
	str r3, [r7, #0x50]
	movs r0, #1
	str r0, [sp, #0x54]
	b _08046B50
_08046B2E:
	mov r1, r9
	str r1, [r7, #0x4c]
	b _08046B50
_08046B34:
	adds r2, r7, #0
	adds r2, #0x2c
	adds r3, r2, r5
	mov r8, r3
	adds r1, r7, #0
	adds r1, #0x38
	adds r0, r1, r5
	movs r3, #1
	negs r3, r3
	str r3, [r0]
	mov r0, r8
	str r3, [r0]
	mov sl, r2
	mov r8, r1
_08046B50:
	subs r5, #4
	subs r4, #1
	movs r1, #1
	negs r1, r1
	add r9, r1
	mov r2, r9
	cmp r2, #0
	blt _08046B62
	b _08046A4A
_08046B62:
	adds r0, r1, #0
	ldr r1, [r7, #0x4c]
	cmp r1, r0
	bne _08046B72
	ldr r0, [r7, #0x50]
	str r0, [r7, #0x4c]
	str r0, [r7, #0x48]
	b _08046B74
_08046B72:
	str r1, [r7, #0x48]
_08046B74:
	movs r0, #0xd0
	lsls r0, r0, #1
	bl PutChapterTitleBG
	movs r3, #0
	mov r9, r3
	movs r0, #0xa0
	lsls r0, r0, #1
	str r0, [sp, #0x5c]
	mov r1, sl
	str r1, [sp, #0x60]
	movs r2, #0x80
	lsls r2, r2, #1
	str r2, [sp, #0x64]
	ldr r6, [sp, #0x58]
	str r3, [sp, #0x68]
	movs r0, #0x88
	lsls r0, r0, #7
	mov sl, r0
_08046B9A:
	ldr r0, [sp, #0x68]
	add r0, r8
	ldr r1, [r0]
	movs r0, #1
	negs r0, r0
	cmp r1, r0
	bne _08046BB0
	ldrb r1, [r6]
	movs r0, #2
	orrs r0, r1
	strb r0, [r6]
_08046BB0:
	ldrb r1, [r6]
	movs r0, #1
	orrs r0, r1
	mov r4, r9
	adds r4, #4
	adds r1, r4, #0
	bl sub_80895B4
	ldrb r0, [r6]
	mov r5, r9
	adds r5, #7
	adds r1, r5, #0
	bl sub_80895B4
	ldr r0, _08046C58  @ gBG1TilemapBuffer+0x006
	ldr r1, [sp, #0x64]
	adds r0, r1, r0
	adds r1, r4, #0
	bl sub_8089720
	mov r2, sl
	lsls r0, r2, #0xf
	lsrs r0, r0, #0x14
	ldr r3, [sp, #0x60]
	ldm r3!, {r1}
	str r3, [sp, #0x60]
	bl PutChapterTitleGfx
	ldr r0, _08046C5C  @ gBG0TilemapBuffer+0x006
	ldr r1, [sp, #0x5c]
	adds r0, r1, r0
	adds r1, r5, #0
	bl sub_80896D8
	ldr r2, [sp, #0x5c]
	movs r3, #0x80
	lsls r3, r3, #1
	adds r2, r2, r3
	str r2, [sp, #0x5c]
	ldr r0, [sp, #0x64]
	adds r0, r0, r3
	str r0, [sp, #0x64]
	adds r6, #1
	ldr r1, [sp, #0x68]
	adds r1, #4
	str r1, [sp, #0x68]
	movs r2, #0x80
	lsls r2, r2, #4
	add sl, r2
	movs r3, #1
	add r9, r3
	mov r0, r9
	cmp r0, #2
	ble _08046B9A
	ldr r2, _08046C60  @ gLCDControlBuffer
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
	adds r0, r7, #0
	movs r1, #1
	movs r2, #0
	bl StartLinkArenaTitleBanner
	bl sub_804C508
	movs r0, #0xf
	bl BG_EnableSyncByMask
	add sp, #0x6c
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08046C58: .4byte gBG1TilemapBuffer+0x006
_08046C5C: .4byte gBG0TilemapBuffer+0x006
_08046C60: .4byte gLCDControlBuffer

	THUMB_FUNC_END sub_80469C4

	THUMB_FUNC_START sub_8046C64
sub_8046C64: @ 0x08046C64
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r5, r3, #0
	ldr r0, [sp, #0x14]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov ip, r1
	lsls r2, r2, #0x18
	lsrs r6, r2, #0x18
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldr r1, _08046CEC  @ gKeyStatusPtr
	ldr r3, [r1]
	ldrh r2, [r3, #6]
	movs r0, #0x40
	ands r0, r2
	cmp r0, #0
	beq _08046CB2
	ldr r0, [r4]
	cmp r0, r6
	bgt _08046C94
	ldrh r3, [r3, #8]
	cmp r2, r3
	bne _08046CB2
_08046C94:
	subs r2, r7, #1
	movs r3, #1
	negs r3, r3
_08046C9A:
	ldr r0, [r4]
	subs r0, #1
	str r0, [r4]
	cmp r0, #0
	bge _08046CA6
	str r2, [r4]
_08046CA6:
	ldr r0, [r4]
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r0, [r0]
	cmp r0, r3
	beq _08046C9A
_08046CB2:
	ldr r1, [r1]
	ldrh r2, [r1, #6]
	movs r0, #0x80
	ands r0, r2
	cmp r0, #0
	beq _08046CE6
	ldr r0, [r4]
	cmp r0, ip
	blt _08046CCA
	ldrh r1, [r1, #8]
	cmp r2, r1
	bne _08046CE6
_08046CCA:
	ldr r0, [r4]
	adds r0, #1
	str r0, [r4]
	adds r1, r7, #0
	bl __modsi3
	str r0, [r4]
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r1, [r0]
	movs r0, #1
	negs r0, r0
	cmp r1, r0
	beq _08046CCA
_08046CE6:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08046CEC: .4byte gKeyStatusPtr

	THUMB_FUNC_END sub_8046C64

	THUMB_FUNC_START sub_8046CF0
sub_8046CF0: @ 0x08046CF0
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	ldr r5, [r6, #0x48]
	adds r0, #0x48
	ldr r1, [r6, #0x50]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldr r2, [r6, #0x4c]
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	adds r3, r6, #0
	adds r3, #0x38
	movs r4, #3
	str r4, [sp]
	bl sub_8046C64
	ldr r1, [r6, #0x48]
	lsls r1, r1, #5
	adds r1, #0x28
	movs r0, #0x1c
	bl DisplayUiHand
	ldr r0, [r6, #0x48]
	cmp r5, r0
	beq _08046D2A
	movs r0, #3
	bl SioPlaySoundEffect
_08046D2A:
	ldr r4, _08046D68  @ gKeyStatusPtr
	ldr r0, [r4]
	ldrh r1, [r0, #8]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08046D44
	movs r0, #2
	bl SioPlaySoundEffect
	adds r0, r6, #0
	bl Proc_Break
_08046D44:
	ldr r0, [r4]
	ldrh r1, [r0, #8]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08046D5E
	movs r0, #1
	bl SioPlaySoundEffect
	adds r0, r6, #0
	movs r1, #4
	bl Proc_Goto
_08046D5E:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08046D68: .4byte gKeyStatusPtr

	THUMB_FUNC_END sub_8046CF0

	THUMB_FUNC_START sub_8046D6C
sub_8046D6C: @ 0x08046D6C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x48]
	bl ReadGameSave
	ldr r1, _08046DAC  @ gPlaySt
	ldrb r2, [r1, #0x14]
	movs r0, #0xdf
	ands r0, r2
	strb r0, [r1, #0x14]
	adds r1, #0x41
	ldrb r2, [r1]
	movs r0, #0xd
	negs r0, r0
	ands r0, r2
	strb r0, [r1]
	ldr r1, _08046DB0  @ gLinkArenaSt
	ldr r0, [r4, #0x48]
	strb r0, [r1, #4]
	bl SetupMapSpritesPalettes
	bl sub_80496A4
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08046DAC: .4byte gPlaySt
_08046DB0: .4byte gLinkArenaSt

	THUMB_FUNC_END sub_8046D6C

	THUMB_FUNC_START sub_8046DB4
sub_8046DB4: @ 0x08046DB4
	push {lr}
	adds r1, r0, #0
	ldr r0, _08046DCC  @ gLinkArenaSt
	ldrb r0, [r0, #3]
	cmp r0, #0xff
	bne _08046DC8
	adds r0, r1, #0
	movs r1, #1
	bl Proc_Goto
_08046DC8:
	pop {r0}
	bx r0
	.align 2, 0
_08046DCC: .4byte gLinkArenaSt

	THUMB_FUNC_END sub_8046DB4

	THUMB_FUNC_START sub_8046DD0
sub_8046DD0: @ 0x08046DD0
	push {lr}
	adds r1, r0, #0
	ldr r0, _08046DE8  @ gLinkArenaSt
	ldrb r0, [r0, #4]
	cmp r0, #0xff
	bne _08046DE4
	adds r0, r1, #0
	movs r1, #2
	bl Proc_Goto
_08046DE4:
	pop {r0}
	bx r0
	.align 2, 0
_08046DE8: .4byte gLinkArenaSt

	THUMB_FUNC_END sub_8046DD0

	THUMB_FUNC_START sub_8046DEC
sub_8046DEC: @ 0x08046DEC
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08046E08  @ ProcScr_AtMenu
	bl Proc_Find
	cmp r0, #0
	bne _08046E00
	adds r0, r4, #0
	bl Proc_Break
_08046E00:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08046E08: .4byte ProcScr_AtMenu

	THUMB_FUNC_END sub_8046DEC

	THUMB_FUNC_START sub_8046E0C
sub_8046E0C: @ 0x08046E0C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08046E48  @ gUnk_Sio_0203DD24
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _08046E40
	bl sub_804309C
	bl nullsub_13
	bl sub_804C4F8
	bl sub_804C590
	bl EndLinkArenaButtonSpriteDraw
	bl BMapVSync_End
	bl StartPrepAtMenu
	adds r0, r4, #0
	movs r1, #5
	bl Proc_Goto
_08046E40:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08046E48: .4byte gUnk_Sio_0203DD24

	THUMB_FUNC_END sub_8046E0C

	THUMB_FUNC_START sub_8046E4C
sub_8046E4C: @ 0x08046E4C
	push {lr}
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8046E4C

	.align 2, 0
