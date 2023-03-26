	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	THUMB_FUNC_START sub_80AF524
sub_80AF524: @ 0x080AF524
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r4, r0, #0
	movs r0, #0
	bl SetupBackgrounds
	bl Font_ResetAllocation
	bl Font_InitForUIDefault
	bl LoadObjUIGfx
	bl LoadUiFrameGraphics
	bl Font_LoadForUI
	ldr r7, _080AF7A4  @ gLCDControlBuffer
	ldrb r2, [r7, #1]
	movs r0, #1
	orrs r2, r0
	movs r1, #2
	mov sl, r1
	mov r3, sl
	orrs r2, r3
	movs r0, #4
	orrs r2, r0
	movs r1, #8
	orrs r2, r1
	movs r3, #0x10
	orrs r2, r3
	ldrb r3, [r7, #0xc]
	subs r1, #0xc
	adds r0, r1, #0
	ands r0, r3
	strb r0, [r7, #0xc]
	ldrb r3, [r7, #0x10]
	adds r0, r1, #0
	ands r0, r3
	mov r3, sl
	orrs r0, r3
	strb r0, [r7, #0x10]
	ldrb r0, [r7, #0x14]
	ands r1, r0
	movs r0, #1
	orrs r1, r0
	strb r1, [r7, #0x14]
	ldrb r0, [r7, #0x18]
	movs r1, #3
	orrs r0, r1
	strb r0, [r7, #0x18]
	movs r0, #0x21
	negs r0, r0
	ands r2, r0
	movs r1, #0x41
	negs r1, r1
	ands r2, r1
	movs r3, #0x7f
	ands r2, r3
	strb r2, [r7, #1]
	movs r0, #0
	bl RegisterBlankTile
	ldr r0, _080AF7A8  @ gBG0TilemapBuffer
	mov r8, r0
	movs r1, #0
	bl BG_Fill
	ldr r6, _080AF7AC  @ gBG1TilemapBuffer
	adds r0, r6, #0
	movs r1, #0
	bl BG_Fill
	ldr r0, _080AF7B0  @ gBG2TilemapBuffer
	movs r1, #0
	bl BG_Fill
	ldr r0, _080AF7B4  @ gBG3TilemapBuffer
	movs r1, #0
	bl BG_Fill
	movs r0, #0xf
	bl BG_EnableSyncByMask
	adds r0, r4, #0
	adds r0, #0x35
	movs r1, #0
	mov r9, r1
	mov r2, r9
	strb r2, [r0]
	adds r0, #2
	strb r2, [r0]
	mov r3, r9
	strh r3, [r4, #0x2a]
	adds r0, #4
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	subs r0, #0xf
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r2, r4, #0
	adds r2, #0x32
	movs r0, #0xff
	strb r0, [r2]
	adds r0, r4, #0
	adds r0, #0x2e
	strb r1, [r0]
	strh r3, [r4, #0x2c]
	adds r0, #0x11
	strb r1, [r0]
	adds r0, r4, #0
	bl sub_80AED64
	bl sub_80AFF30
	adds r0, r4, #0
	bl sub_80AF878
	adds r0, r4, #0
	bl ResetPrepScreenHandCursor
	movs r0, #0xa0
	lsls r0, r0, #2
	movs r1, #2
	bl sub_80AD4A0
	adds r0, r4, #0
	bl sub_80AF350
	adds r0, r4, #0
	bl sub_80AF3C8
	movs r5, #0x80
	lsls r5, r5, #5
	movs r0, #3
	str r0, [sp]
	adds r0, r4, #0
	movs r1, #0xd8
	movs r2, #0x48
	adds r3, r5, #0
	bl PrepStartSideBarScroll
	adds r0, r4, #0
	bl sub_80AF338
	ldr r0, _080AF7B8  @ gUnknown_08A2C908
	ldr r1, _080AF7BC  @ 0x06004000
	bl Decompress
	ldr r0, _080AF7C0  @ gUnknown_08A01EE4
	movs r1, #0x80
	movs r2, #0x20
	bl CopyToPaletteBuffer
	ldr r0, _080AF7C4  @ gUnknown_08A01F04
	movs r1, #0xa0
	movs r2, #0x20
	bl CopyToPaletteBuffer
	movs r1, #0xe1
	lsls r1, r1, #1
	adds r0, r6, r1
	ldr r1, _080AF7C8  @ gUnknown_08A2C4C8
	adds r2, r5, #0
	bl CallARM_FillTileRect
	movs r2, #0xab
	lsls r2, r2, #1
	adds r6, r6, r2
	ldr r1, _080AF7CC  @ gUnknown_08A2C5A8
	adds r0, r6, #0
	adds r2, r5, #0
	bl CallARM_FillTileRect
	movs r3, #0xcf
	lsls r3, r3, #1
	add r8, r3
	mov r0, r8
	adds r1, r4, #0
	bl sub_80AF4D0
	ldr r0, _080AF7D0  @ gUnknown_08A2D32C
	ldr r1, _080AF7D4  @ 0x06016000
	bl Decompress
	ldr r0, _080AF7D8  @ gUnknown_08A2E1B8
	movs r1, #0xe0
	lsls r1, r1, #2
	movs r2, #0x20
	bl CopyToPaletteBuffer
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	ldr r1, _080AF7DC  @ 0x0000FFFC
	movs r0, #2
	movs r2, #0
	bl BG_SetPosition
	ldrb r0, [r7, #1]
	movs r1, #0x20
	orrs r0, r1
	movs r1, #0x41
	negs r1, r1
	ands r0, r1
	movs r2, #0x7f
	ands r0, r2
	strb r0, [r7, #1]
	adds r1, r7, #0
	adds r1, #0x34
	ldrb r0, [r1]
	movs r3, #1
	orrs r0, r3
	mov r2, sl
	orrs r0, r2
	movs r3, #4
	orrs r0, r3
	movs r2, #8
	orrs r0, r2
	movs r3, #0x10
	orrs r0, r3
	strb r0, [r1]
	subs r1, #7
	movs r0, #4
	strb r0, [r1]
	adds r1, #4
	movs r0, #0x42
	strb r0, [r1]
	subs r1, #5
	movs r0, #0xf0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0x90
	strb r0, [r1]
	adds r2, r7, #0
	adds r2, #0x36
	ldrb r0, [r2]
	movs r1, #1
	orrs r0, r1
	mov r3, sl
	orrs r0, r3
	subs r1, #6
	ands r0, r1
	movs r1, #8
	orrs r0, r1
	movs r3, #0x10
	orrs r0, r3
	strb r0, [r2]
	ldr r0, _080AF7E0  @ gUnknown_08A2CABC
	ldr r1, _080AF7E4  @ 0x06012000
	bl Decompress
	ldr r0, _080AF7E8  @ gUnknown_08A2D2CC
	movs r1, #0x98
	lsls r1, r1, #2
	movs r2, #0x60
	bl CopyToPaletteBuffer
	adds r0, r4, #0
	bl sub_80B0444
	movs r0, #1
	movs r1, #0xf
	movs r2, #3
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	mov r0, r9
	str r0, [sp]
	movs r0, #0
	movs r1, #1
	movs r2, #0
	movs r3, #0
	bl SetBlendTargetA
	mov r1, r9
	str r1, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #1
	bl SetBlendTargetB
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0xe
	bl sub_8086BB8
	adds r0, r4, #0
	bl NewGreenTextColorManager
	bl sub_80AF1D8
	ldr r0, _080AF7EC  @ sub_80AF510
	adds r1, r4, #0
	bl StartParallelWorker
	ldr r0, _080AF7F0  @ gUnknown_08A21308
	adds r1, r4, #0
	bl Proc_Start
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080AF7A4: .4byte gLCDControlBuffer
_080AF7A8: .4byte gBG0TilemapBuffer
_080AF7AC: .4byte gBG1TilemapBuffer
_080AF7B0: .4byte gBG2TilemapBuffer
_080AF7B4: .4byte gBG3TilemapBuffer
_080AF7B8: .4byte gUnknown_08A2C908
_080AF7BC: .4byte 0x06004000
_080AF7C0: .4byte gUnknown_08A01EE4
_080AF7C4: .4byte gUnknown_08A01F04
_080AF7C8: .4byte gUnknown_08A2C4C8
_080AF7CC: .4byte gUnknown_08A2C5A8
_080AF7D0: .4byte gUnknown_08A2D32C
_080AF7D4: .4byte 0x06016000
_080AF7D8: .4byte gUnknown_08A2E1B8
_080AF7DC: .4byte 0x0000FFFC
_080AF7E0: .4byte gUnknown_08A2CABC
_080AF7E4: .4byte 0x06012000
_080AF7E8: .4byte gUnknown_08A2D2CC
_080AF7EC: .4byte sub_80AF510
_080AF7F0: .4byte gUnknown_08A21308

	THUMB_FUNC_END sub_80AF524

	THUMB_FUNC_START sub_80AF7F4
sub_80AF7F4: @ 0x080AF7F4
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	bl MusicProc4Exists
	lsls r0, r0, #0x18
	asrs r3, r0, #0x18
	cmp r3, #0
	bne _080AF834
	adds r0, r4, #0
	adds r0, #0x32
	strb r5, [r0]
	movs r0, #1
	strh r0, [r4, #0x2c]
	ldr r1, _080AF830  @ gUnknown_08A20E74
	lsls r0, r5, #4
	adds r0, r0, r1
	ldr r0, [r0]
	movs r2, #0x80
	lsls r2, r2, #1
	str r3, [sp]
	adds r1, r2, #0
	adds r3, r6, #0
	bl sub_80029E8
	movs r0, #1
	b _080AF836
	.align 2, 0
_080AF830: .4byte gUnknown_08A20E74
_080AF834:
	movs r0, #0
_080AF836:
	add sp, #4
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80AF7F4

	THUMB_FUNC_START sub_80AF840
sub_80AF840: @ 0x080AF840
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	bl MusicProc4Exists
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _080AF870
	movs r4, #0
	strh r0, [r5, #0x2c]
	movs r1, #0x80
	lsls r1, r1, #1
	str r0, [sp]
	movs r0, #0
	movs r2, #0
	movs r3, #0x18
	bl sub_80029E8
	adds r0, r5, #0
	adds r0, #0x2f
	strb r4, [r0]
	adds r0, #1
	strb r4, [r0]
_080AF870:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80AF840

	THUMB_FUNC_START sub_80AF878
sub_80AF878: @ 0x080AF878
	push {r4, lr}
	adds r4, r0, #0
	adds r4, #0x35
	ldrb r1, [r4]
	bl sub_80AECEC
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080AF892
	ldrb r0, [r4]
	bl sub_80B0018
	b _080AF89A
_080AF892:
	movs r0, #1
	negs r0, r0
	bl sub_80B0018
_080AF89A:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80AF878

	THUMB_FUNC_START sub_80AF8A0
sub_80AF8A0: @ 0x080AF8A0
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	movs r6, #0
	adds r0, #0x37
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _080AF994
	ldr r0, _080AF97C  @ gKeyStatusPtr
	ldr r2, [r0]
	ldrh r3, [r2, #6]
	adds r5, r4, #0
	adds r5, #0x38
	movs r0, #4
	strb r0, [r5]
	ldrh r1, [r2, #4]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080AF8D2
	ldrh r3, [r2, #4]
	movs r0, #8
	strb r0, [r5]
_080AF8D2:
	movs r0, #0x40
	ands r0, r3
	cmp r0, #0
	beq _080AF8DE
	movs r6, #4
	negs r6, r6
_080AF8DE:
	movs r0, #0x80
	ands r0, r3
	cmp r0, #0
	beq _080AF8E8
	movs r6, #4
_080AF8E8:
	movs r0, #0x20
	ands r0, r3
	cmp r0, #0
	beq _080AF902
	adds r0, r4, #0
	adds r0, #0x35
	ldrb r0, [r0]
	movs r1, #3
	ands r0, r1
	cmp r0, #0
	beq _080AF902
	movs r6, #1
	negs r6, r6
_080AF902:
	movs r0, #0x10
	ands r3, r0
	cmp r3, #0
	beq _080AF91A
	adds r0, r4, #0
	adds r0, #0x35
	ldrb r0, [r0]
	movs r1, #3
	ands r0, r1
	cmp r0, #2
	bhi _080AF91A
	movs r6, #1
_080AF91A:
	cmp r6, #0
	beq _080AF986
	adds r2, r4, #0
	adds r2, #0x35
	ldrb r0, [r2]
	adds r0, r0, r6
	cmp r0, #0
	bge _080AF92C
	b _080AFA5C
_080AF92C:
	adds r1, r4, #0
	adds r1, #0x36
	ldrb r1, [r1]
	cmp r0, r1
	blt _080AF938
	b _080AFA5C
_080AF938:
	strb r0, [r2]
	adds r0, r4, #0
	bl sub_80AF878
	adds r0, r4, #0
	bl sub_80AF378
	adds r5, r4, #0
	adds r5, #0x37
	strb r0, [r5]
	lsls r0, r0, #0x18
	asrs r1, r0, #0x18
	cmp r1, #0
	beq _080AF980
	movs r0, #1
	negs r0, r0
	cmp r1, r0
	bne _080AF964
	adds r0, r4, #0
	movs r1, #0xa
	bl Proc_Goto
_080AF964:
	movs r0, #0
	ldrsb r0, [r5, r0]
	cmp r0, #1
	bne _080AF974
	adds r0, r4, #0
	movs r1, #0xb
	bl Proc_Goto
_080AF974:
	adds r0, r4, #0
	bl sub_80AF3C8
	b _080AF986
	.align 2, 0
_080AF97C: .4byte gKeyStatusPtr
_080AF980:
	adds r0, r4, #0
	bl sub_80AF350
_080AF986:
	adds r0, r4, #0
	adds r0, #0x37
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _080AF9D4
_080AF994:
	adds r5, r4, #0
	adds r5, #0x37
	movs r1, #0
	ldrsb r1, [r5, r1]
	adds r0, r4, #0
	adds r0, #0x38
	ldrb r0, [r0]
	adds r2, r1, #0
	muls r2, r0, r2
	ldrh r0, [r4, #0x2a]
	adds r2, r2, r0
	strh r2, [r4, #0x2a]
	ldr r1, _080AF9D0  @ 0x0000FFFC
	movs r0, #0xff
	ands r2, r0
	movs r0, #2
	bl BG_SetPosition
	ldrh r0, [r4, #0x2a]
	movs r1, #0xf
	ands r0, r1
	cmp r0, #0
	bne _080AF9C6
	movs r0, #0
	strb r0, [r5]
_080AF9C6:
	adds r0, r4, #0
	bl sub_80AF338
	b _080AFA5C
	.align 2, 0
_080AF9D0: .4byte 0x0000FFFC
_080AF9D4:
	ldr r0, _080AF9EC  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _080AF9F0
	adds r0, r4, #0
	bl sub_80AF840
	b _080AFA5C
	.align 2, 0
_080AF9EC: .4byte gKeyStatusPtr
_080AF9F0:
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080AFA30
	adds r5, r4, #0
	adds r5, #0x35
	ldrb r1, [r5]
	adds r0, r4, #0
	bl sub_80AECEC
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080AFA16
	ldrb r1, [r5]
	adds r0, r4, #0
	movs r2, #0x20
	bl sub_80AF7F4
	b _080AFA5C
_080AFA16:
	ldr r0, _080AFA2C  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080AFA5C
	movs r0, #0x6c
	bl m4aSongNumStart
	b _080AFA5C
	.align 2, 0
_080AFA2C: .4byte gPlaySt
_080AFA30:
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _080AFA4C
	bl MusicProc4Exists
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080AFA5C
	adds r0, r4, #0
	movs r1, #2
	bl Proc_Goto
	b _080AFA5C
_080AFA4C:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080AFA5C
	adds r0, r4, #0
	movs r1, #3
	bl Proc_Goto
_080AFA5C:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80AF8A0

	THUMB_FUNC_START sub_80AFA64
sub_80AFA64: @ 0x080AFA64
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	bl MusicProc4Exists
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _080AFA8A
	str r0, [sp]
	movs r0, #0x43
	movs r1, #0
	movs r2, #0xc0
	movs r3, #0x18
	bl sub_80029E8
	adds r0, r4, #0
	bl Proc_Break
_080AFA8A:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80AFA64

	THUMB_FUNC_START sub_80AFA94
sub_80AFA94: @ 0x080AFA94
	push {r4, lr}
	adds r4, r0, #0
	bl EndBG3Slider
	adds r0, r4, #0
	bl EndAllProcChildren
	ldr r0, _080AFAB0  @ gUnknown_08A21308
	bl Proc_EndEach
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080AFAB0: .4byte gUnknown_08A21308

	THUMB_FUNC_END sub_80AFA94

	THUMB_FUNC_START sub_80AFAB4
sub_80AFAB4: @ 0x080AFAB4
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #0x10
	adds r4, r0, #0
	adds r5, r4, #0
	adds r5, #0x3b
	ldrb r0, [r5]
	negs r0, r0
	movs r1, #3
	bl __divsi3
	adds r1, r4, #0
	adds r1, #0x3c
	movs r2, #0
	mov r8, r2
	strb r0, [r1]
	ldrb r0, [r5]
	negs r0, r0
	lsls r0, r0, #1
	movs r1, #3
	bl __divsi3
	adds r6, r4, #0
	adds r6, #0x3d
	strb r0, [r6]
	ldrb r0, [r5]
	adds r5, #3
	strb r0, [r5]
	ldr r0, _080AFBA8  @ gBG0TilemapBuffer
	movs r1, #0
	bl BG_Fill
	ldr r0, _080AFBAC  @ gBG1TilemapBuffer
	movs r1, #0
	bl BG_Fill
	ldr r0, _080AFBB0  @ gBG2TilemapBuffer
	movs r1, #0
	bl BG_Fill
	ldr r4, _080AFBB4  @ gUnknown_08A212D4
	ldr r0, [r4]
	movs r1, #0
	ldrsb r1, [r6, r1]
	adds r1, #1
	str r1, [sp]
	movs r1, #7
	str r1, [sp, #4]
	movs r6, #0xa
	str r6, [sp, #8]
	movs r1, #0xb
	str r1, [sp, #0xc]
	movs r1, #0
	movs r2, #7
	movs r3, #1
	bl sub_80AC844
	ldr r0, [r4]
	movs r1, #0
	ldrsb r1, [r5, r1]
	adds r1, #0xb
	str r1, [sp]
	movs r1, #5
	str r1, [sp, #4]
	movs r1, #0x12
	str r1, [sp, #8]
	movs r1, #0xe
	str r1, [sp, #0xc]
	movs r1, #0xa
	movs r2, #5
	movs r3, #1
	bl sub_80AC844
	ldr r4, _080AFBB8  @ gUnknown_08A212D8
	ldr r0, [r4]
	movs r1, #0
	ldrsb r1, [r5, r1]
	adds r1, #0xc
	str r1, [sp]
	mov r1, r8
	str r1, [sp, #4]
	movs r1, #0x10
	str r1, [sp, #8]
	movs r1, #0x20
	str r1, [sp, #0xc]
	movs r1, #0xc
	movs r2, #0
	movs r3, #2
	bl sub_80AC844
	ldr r0, [r4]
	movs r1, #0
	ldrsb r1, [r5, r1]
	adds r1, #0xf
	str r1, [sp]
	movs r1, #6
	str r1, [sp, #4]
	str r6, [sp, #8]
	movs r1, #2
	str r1, [sp, #0xc]
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl sub_80AC844
	movs r0, #0
	ldrsb r0, [r5, r0]
	lsls r0, r0, #3
	adds r0, #0xd8
	movs r1, #0x48
	bl sub_80976AC
	movs r0, #7
	bl BG_EnableSyncByMask
	add sp, #0x10
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080AFBA8: .4byte gBG0TilemapBuffer
_080AFBAC: .4byte gBG1TilemapBuffer
_080AFBB0: .4byte gBG2TilemapBuffer
_080AFBB4: .4byte gUnknown_08A212D4
_080AFBB8: .4byte gUnknown_08A212D8

	THUMB_FUNC_END sub_80AFAB4

	THUMB_FUNC_START sub_80AFBBC
sub_80AFBBC: @ 0x080AFBBC
	push {r4, r5, r6, lr}
	mov r6, r9
	mov r5, r8
	push {r5, r6}
	adds r5, r0, #0
	adds r0, #0x3b
	movs r1, #0
	mov r9, r1
	mov r2, r9
	strb r2, [r0]
	ldr r6, _080AFC3C  @ gUnknown_08A212D4
	ldr r0, [r6]
	movs r1, #0xe0
	lsls r1, r1, #1
	adds r0, r0, r1
	ldr r1, _080AFC40  @ gUnknown_08A2C4C8
	movs r2, #0x80
	lsls r2, r2, #5
	mov r8, r2
	bl CallARM_FillTileRect
	ldr r0, [r6]
	movs r1, #0xaa
	lsls r1, r1, #1
	adds r0, r0, r1
	ldr r1, _080AFC44  @ gUnknown_08A2C5A8
	mov r2, r8
	bl CallARM_FillTileRect
	ldr r0, _080AFC48  @ gBG2TilemapBuffer
	ldr r4, _080AFC4C  @ gUnknown_08A212D8
	ldr r1, [r4]
	movs r2, #0x80
	lsls r2, r2, #2
	bl CpuFastSet
	ldr r0, [r4]
	adds r1, r5, #0
	bl sub_80AF4D0
	ldr r0, _080AFC50  @ gUnknown_0202396C
	ldr r1, _080AFC54  @ gUnknown_08A2C92C
	movs r2, #0x90
	lsls r2, r2, #5
	bl CallARM_FillTileRect
	ldr r0, [r6]
	ldr r2, _080AFC58  @ 0x00000642
	adds r0, r0, r2
	ldr r1, _080AFC5C  @ gUnknown_08A2C7A4
	mov r2, r8
	bl CallARM_FillTileRect
	bl HidePrepScreenHandCursor
	adds r5, #0x3a
	mov r0, r9
	strb r0, [r5]
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080AFC3C: .4byte gUnknown_08A212D4
_080AFC40: .4byte gUnknown_08A2C4C8
_080AFC44: .4byte gUnknown_08A2C5A8
_080AFC48: .4byte gBG2TilemapBuffer
_080AFC4C: .4byte gUnknown_08A212D8
_080AFC50: .4byte gUnknown_0202396C
_080AFC54: .4byte gUnknown_08A2C92C
_080AFC58: .4byte 0x00000642
_080AFC5C: .4byte gUnknown_08A2C7A4

	THUMB_FUNC_END sub_80AFBBC

	THUMB_FUNC_START sub_80AFC60
sub_80AFC60: @ 0x080AFC60
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r1, r5, #0
	adds r1, #0x3a
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldrb r1, [r1]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	muls r0, r1, r0
	asrs r0, r0, #6
	adds r4, r5, #0
	adds r4, #0x3b
	strb r0, [r4]
	adds r0, r5, #0
	bl sub_80AFAB4
	ldrb r0, [r4]
	cmp r0, #0x18
	bne _080AFC92
	adds r0, r5, #0
	bl Proc_Break
_080AFC92:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80AFC60

	THUMB_FUNC_START sub_80AFC98
sub_80AFC98: @ 0x080AFC98
	push {lr}
	adds r2, r0, #0
	ldr r0, _080AFCBC  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #5
	ands r0, r1
	cmp r0, #0
	bne _080AFCE0
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _080AFCC0
	adds r0, r2, #0
	bl sub_80AF0E0
	b _080AFCE0
	.align 2, 0
_080AFCBC: .4byte gKeyStatusPtr
_080AFCC0:
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _080AFCD0
	adds r0, r2, #0
	bl sub_80AF140
	b _080AFCE0
_080AFCD0:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080AFCE0
	adds r0, r2, #0
	movs r1, #3
	bl Proc_Goto
_080AFCE0:
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80AFC98

	THUMB_FUNC_START sub_80AFCE4
sub_80AFCE4: @ 0x080AFCE4
	push {r4, lr}
	adds r4, r0, #0
	bl sub_80AF878
	adds r4, #0x3a
	movs r0, #0
	strb r0, [r4]
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80AFCE4

	THUMB_FUNC_START sub_80AFCF8
sub_80AFCF8: @ 0x080AFCF8
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r1, r5, #0
	adds r1, #0x3a
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldrb r0, [r1]
	movs r1, #8
	subs r1, r1, r0
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	muls r0, r1, r0
	cmp r0, #0
	bge _080AFD1A
	adds r0, #0x3f
_080AFD1A:
	asrs r0, r0, #6
	adds r4, r5, #0
	adds r4, #0x3b
	strb r0, [r4]
	adds r0, r5, #0
	bl sub_80AFAB4
	ldrb r0, [r4]
	cmp r0, #0
	bne _080AFD40
	adds r0, r5, #0
	bl sub_80AF350
	adds r0, r5, #0
	bl sub_80AF338
	adds r0, r5, #0
	bl Proc_Break
_080AFD40:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80AFCF8

	THUMB_FUNC_START sub_80AFD48
sub_80AFD48: @ 0x080AFD48
	push {lr}
	adds r2, r0, #0
	adds r2, #0x3a
	movs r1, #0
	strb r1, [r2]
	strh r1, [r0, #0x2c]
	bl sub_80AEF64
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80AFD48

	THUMB_FUNC_START sub_80AFD5C
sub_80AFD5C: @ 0x080AFD5C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x10
	mov r8, r0
	mov r7, r8
	adds r7, #0x3a
	ldrb r0, [r7]
	adds r0, #1
	strb r0, [r7]
	ldrb r0, [r7]
	movs r1, #8
	subs r1, r1, r0
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	muls r1, r0, r1
	cmp r1, #0
	bge _080AFD84
	adds r1, #0x3f
_080AFD84:
	asrs r1, r1, #6
	movs r0, #0x18
	subs r0, r0, r1
	mov r6, r8
	adds r6, #0x3b
	strb r0, [r6]
	ldrb r0, [r6]
	movs r5, #3
	movs r1, #3
	bl __udivsi3
	movs r1, #0x14
	subs r1, r1, r0
	mov r4, r8
	adds r4, #0x3c
	strb r1, [r4]
	ldr r0, _080AFDEC  @ gBG1TilemapBuffer
	movs r1, #0
	bl BG_Fill
	ldr r0, _080AFDF0  @ gUnknown_08A212D4
	ldr r0, [r0]
	str r5, [sp]
	movs r1, #0
	ldrsb r1, [r4, r1]
	adds r1, #4
	str r1, [sp, #4]
	movs r1, #0x18
	str r1, [sp, #8]
	str r5, [sp, #0xc]
	movs r1, #1
	movs r2, #0x19
	movs r3, #1
	bl sub_80AC844
	movs r0, #2
	bl BG_EnableSyncByMask
	ldrb r0, [r6]
	cmp r0, #0x18
	bne _080AFDE0
	movs r0, #0
	strb r0, [r7]
	mov r0, r8
	bl Proc_Break
_080AFDE0:
	add sp, #0x10
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080AFDEC: .4byte gBG1TilemapBuffer
_080AFDF0: .4byte gUnknown_08A212D4

	THUMB_FUNC_END sub_80AFD5C

	THUMB_FUNC_START sub_80AFDF4
sub_80AFDF4: @ 0x080AFDF4
	push {lr}
	adds r3, r0, #0
	adds r0, #0x3f
	ldrb r0, [r0]
	cmp r0, #0
	bne _080AFE88
	adds r0, r3, #0
	adds r0, #0x30
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _080AFE34
	ldrh r2, [r3, #0x2c]
	ldr r1, _080AFE30  @ gUnknown_08A20E74
	adds r0, r3, #0
	adds r0, #0x32
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #4
	adds r1, #4
	adds r0, r0, r1
	ldr r0, [r0]
	cmp r2, r0
	blt _080AFE34
	adds r0, r3, #0
	bl sub_80AEF24
	b _080AFE88
	.align 2, 0
_080AFE30: .4byte gUnknown_08A20E74
_080AFE34:
	ldr r0, _080AFE4C  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _080AFE50
	adds r0, r3, #0
	bl sub_80AF0E0
	b _080AFE88
	.align 2, 0
_080AFE4C: .4byte gKeyStatusPtr
_080AFE50:
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _080AFE60
	adds r0, r3, #0
	bl sub_80AF140
	b _080AFE88
_080AFE60:
	movs r0, #0xc
	ands r0, r1
	cmp r0, #0
	beq _080AFE70
	adds r0, r3, #0
	bl Proc_Break
	b _080AFE88
_080AFE70:
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _080AFE88
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080AFE88
	adds r0, r3, #0
	movs r1, #3
	bl Proc_Goto
_080AFE88:
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80AFDF4

	THUMB_FUNC_START sub_80AFE8C
sub_80AFE8C: @ 0x080AFE8C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r7, r0, #0
	adds r1, r7, #0
	adds r1, #0x3a
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldrb r0, [r1]
	movs r1, #8
	subs r1, r1, r0
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	muls r0, r1, r0
	cmp r0, #0
	bge _080AFEB0
	adds r0, #0x3f
_080AFEB0:
	asrs r0, r0, #6
	adds r6, r7, #0
	adds r6, #0x3b
	strb r0, [r6]
	ldrb r0, [r6]
	movs r5, #3
	movs r1, #3
	bl __udivsi3
	movs r1, #0x14
	subs r1, r1, r0
	adds r4, r7, #0
	adds r4, #0x3c
	strb r1, [r4]
	ldr r0, _080AFF14  @ gBG1TilemapBuffer
	movs r1, #0
	bl BG_Fill
	ldr r0, _080AFF18  @ gUnknown_08A212D4
	ldr r0, [r0]
	str r5, [sp]
	movs r1, #0
	ldrsb r1, [r4, r1]
	adds r1, #4
	str r1, [sp, #4]
	movs r1, #0x18
	str r1, [sp, #8]
	str r5, [sp, #0xc]
	movs r1, #1
	movs r2, #0x19
	movs r3, #1
	bl sub_80AC844
	movs r0, #2
	bl BG_EnableSyncByMask
	ldrb r1, [r6]
	cmp r1, #0
	bne _080AFF0A
	adds r0, r7, #0
	adds r0, #0x30
	strb r1, [r0]
	adds r0, r7, #0
	bl Proc_Break
_080AFF0A:
	add sp, #0x10
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080AFF14: .4byte gBG1TilemapBuffer
_080AFF18: .4byte gUnknown_08A212D4

	THUMB_FUNC_END sub_80AFE8C

	THUMB_FUNC_START StartSoundRoomScreen
StartSoundRoomScreen: @ 0x080AFF1C
	push {lr}
	adds r1, r0, #0
	ldr r0, _080AFF2C  @ gUnknown_08A21338
	bl Proc_StartBlocking
	pop {r1}
	bx r1
	.align 2, 0
_080AFF2C: .4byte gUnknown_08A21338

	THUMB_FUNC_END StartSoundRoomScreen

	THUMB_FUNC_START sub_80AFF30
sub_80AFF30: @ 0x080AFF30
	push {r4, r5, r6, lr}
	ldr r6, _080AFFF8  @ 0x06014000
	ldr r4, _080AFFFC  @ gUnknown_0201F148
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #5
	bl InitSomeOtherGraphicsRelatedStruct
	ldr r0, _080B0000  @ Pal_UIFont
	movs r5, #0xd0
	lsls r5, r5, #2
	adds r1, r5, #0
	movs r2, #0x40
	bl CopyToPaletteBuffer
	ldr r0, _080B0004  @ gPaletteBuffer
	adds r0, r0, r5
	movs r1, #0
	strh r1, [r0]
	bl EnablePaletteSync
	adds r0, r4, #0
	bl SetFont
	adds r0, r4, #0
	adds r0, #0x20
	bl Text_Init3
	adds r0, r4, #0
	adds r0, #0x28
	bl Text_Init3
	adds r4, #0x30
	movs r5, #2
_080AFF74:
	adds r0, r4, #0
	bl Text_Init3
	adds r4, #8
	subs r5, #1
	cmp r5, #0
	bge _080AFF74
	movs r0, #0
	bl SetFont
	ldr r5, _080AFFFC  @ gUnknown_0201F148
	ldr r0, _080B0008  @ 0x0001FFFF
	ands r0, r6
	lsrs r0, r0, #5
	ldr r2, _080B000C  @ 0x000003FF
	adds r1, r2, #0
	ands r0, r1
	movs r2, #0xa0
	lsls r2, r2, #8
	adds r1, r2, #0
	adds r0, r0, r1
	adds r1, r5, #0
	adds r1, #0x50
	strh r0, [r1]
	movs r0, #0
	bl SetFont
	movs r0, #0
	bl SetFontGlyphSet
	adds r4, r5, #0
	adds r4, #0x18
	adds r0, r4, #0
	movs r1, #5
	bl Text_Init
	adds r0, r4, #0
	bl Text_Clear
	ldr r0, _080B0010  @ 0x000005AA
	bl GetStringFromIndex
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0
	bl Text_InsertString
	adds r4, #0x30
	adds r0, r4, #0
	movs r1, #2
	bl Text_Init
	adds r0, r4, #0
	bl Text_Clear
	ldr r0, _080B0014  @ 0x000005AE
	bl GetStringFromIndex
	adds r1, r0, #0
	adds r0, r4, #0
	bl Text_AppendString
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080AFFF8: .4byte 0x06014000
_080AFFFC: .4byte gUnknown_0201F148
_080B0000: .4byte Pal_UIFont
_080B0004: .4byte gPaletteBuffer
_080B0008: .4byte 0x0001FFFF
_080B000C: .4byte 0x000003FF
_080B0010: .4byte 0x000005AA
_080B0014: .4byte 0x000005AE

	THUMB_FUNC_END sub_80AFF30

	THUMB_FUNC_START sub_80B0018
sub_80B0018: @ 0x080B0018
	push {r4, r5, lr}
	adds r1, r0, #0
	movs r0, #1
	negs r0, r0
	cmp r1, r0
	bne _080B002A
	movs r0, #0xfa
	lsls r0, r0, #3
	b _080B0034
_080B002A:
	ldr r0, _080B0080  @ gUnknown_08A20E74
	lsls r1, r1, #4
	adds r0, #0xc
	adds r1, r1, r0
	ldr r0, [r1]
_080B0034:
	bl GetStringFromIndex
	adds r5, r0, #0
	ldr r4, _080B0084  @ gUnknown_0201F148
	adds r0, r4, #0
	bl SetFont
	movs r0, #1
	bl SetFontGlyphSet
	adds r4, #0x20
	adds r0, r4, #0
	movs r1, #0
	bl Text_80046B4
	movs r0, #0xb0
	adds r1, r5, #0
	bl GetStringTextCenteredPos
	adds r1, r0, #0
	adds r0, r4, #0
	bl Text_SetXCursor
	adds r0, r4, #0
	movs r1, #0
	bl Text_SetColorId
	adds r0, r4, #0
	adds r1, r5, #0
	bl Text_AppendString
	movs r0, #0
	bl SetFont
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B0080: .4byte gUnknown_08A20E74
_080B0084: .4byte gUnknown_0201F148

	THUMB_FUNC_END sub_80B0018

	THUMB_FUNC_START sub_80B0088
sub_80B0088: @ 0x080B0088
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov sl, r0
	lsls r1, r1, #0x10
	lsrs r7, r1, #0x10
	cmp r7, #0x20
	bls _080B015C
	movs r0, #0xff
	mov r1, sl
	ands r1, r0
	mov sl, r1
	ldr r4, _080B016C  @ gSinLookup
	movs r2, #0x80
	adds r2, r2, r4
	mov r9, r2
	movs r1, #0
	ldrsh r0, [r2, r1]
	lsls r0, r0, #4
	movs r2, #0x80
	lsls r2, r2, #1
	mov r8, r2
	mov r1, r8
	bl Div
	adds r6, r0, #0
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	movs r1, #0
	ldrsh r0, [r4, r1]
	negs r0, r0
	lsls r0, r0, #4
	adds r1, r7, #0
	bl Div
	adds r5, r0, #0
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	movs r2, #0
	ldrsh r0, [r4, r2]
	lsls r0, r0, #4
	mov r1, r8
	bl Div
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	mov r1, r9
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #4
	adds r1, r7, #0
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	movs r0, #0
	adds r1, r6, #0
	adds r2, r5, #0
	adds r3, r4, #0
	bl WriteOAMRotScaleData
	movs r4, #0
	ldr r6, _080B0170  @ gUnknown_0201F198
	movs r5, #0x24
_080B0112:
	lsls r0, r4, #2
	ldrh r1, [r6]
	adds r0, r0, r1
	movs r2, #0x80
	lsls r2, r2, #5
	adds r0, r0, r2
	str r0, [sp]
	movs r0, #4
	adds r1, r5, #0
	movs r2, #0x84
	lsls r2, r2, #1
	add r2, sl
	ldr r3, _080B0174  @ gObject_32x16
	bl PutSpriteExt
	adds r5, #0x20
	adds r4, #1
	cmp r4, #4
	ble _080B0112
	movs r6, #0xcb
	lsls r6, r6, #8
	movs r5, #0x18
	movs r4, #2
_080B0140:
	str r6, [sp]
	movs r0, #4
	adds r1, r5, #0
	movs r2, #0x80
	lsls r2, r2, #1
	add r2, sl
	ldr r3, _080B0178  @ gObject_64x32
	bl PutSpriteExt
	adds r6, #8
	adds r5, #0x40
	subs r4, #1
	cmp r4, #0
	bge _080B0140
_080B015C:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B016C: .4byte gSinLookup
_080B0170: .4byte gUnknown_0201F198
_080B0174: .4byte gObject_32x16
_080B0178: .4byte gObject_64x32

	THUMB_FUNC_END sub_80B0088

	THUMB_FUNC_START sub_80B017C
sub_80B017C: @ 0x080B017C
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	mov r9, r0
	mov r8, r1
	adds r4, r2, #0
	movs r6, #0
	movs r7, #0xd
	cmp r3, #0
	beq _080B01EA
	movs r0, #0xff
	ands r1, r0
	mov r8, r1
	cmp r4, #7
	ble _080B01CC
	mov r5, r9
_080B01A0:
	subs r4, #8
	ldr r1, _080B01F8  @ 0x000001FF
	ands r1, r5
	lsls r0, r7, #0xc
	ldr r2, _080B01FC  @ 0x00000847
	adds r0, r0, r2
	str r0, [sp]
	movs r0, #0
	mov r2, r8
	ldr r3, _080B0200  @ gObject_8x8
	bl PutSpriteExt
	adds r5, #8
	adds r6, #1
	cmp r6, #2
	ble _080B01C2
	movs r7, #0xe
_080B01C2:
	cmp r6, #4
	ble _080B01C8
	movs r7, #0xf
_080B01C8:
	cmp r4, #7
	bgt _080B01A0
_080B01CC:
	lsls r1, r6, #3
	add r1, r9
	ldr r0, _080B01F8  @ 0x000001FF
	ands r1, r0
	ldr r3, _080B0200  @ gObject_8x8
	lsls r0, r7, #0xc
	adds r0, r4, r0
	movs r2, #0x84
	lsls r2, r2, #4
	adds r0, r0, r2
	str r0, [sp]
	movs r0, #0
	mov r2, r8
	bl PutSpriteExt
_080B01EA:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B01F8: .4byte 0x000001FF
_080B01FC: .4byte 0x00000847
_080B0200: .4byte gObject_8x8

	THUMB_FUNC_END sub_80B017C

	THUMB_FUNC_START sub_80B0204
sub_80B0204: @ 0x080B0204
	push {r4, r5, r6, r7, lr}
	ldr r7, [r0, #0x14]
	ldr r0, _080B023C  @ gUnknown_0201F19C
	movs r6, #0x40
	adds r5, r0, #0
	adds r5, #0x30
	movs r4, #1
_080B0212:
	ldrb r3, [r5]
	adds r0, r7, #0
	adds r0, #0x3d
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #3
	adds r0, #0xf
	adds r1, r6, #0
	adds r2, r3, #0
	bl sub_80B017C
	adds r6, #8
	adds r5, #0x31
	subs r4, #1
	cmp r4, #0
	bge _080B0212
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B023C: .4byte gUnknown_0201F19C

	THUMB_FUNC_END sub_80B0204

	THUMB_FUNC_START sub_80B0240
sub_80B0240: @ 0x080B0240
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r6, r0, #0
	adds r7, r1, #0
	adds r0, r2, #0
	movs r1, #0x3c
	bl __divsi3
	adds r5, r0, #0
	movs r1, #0x3c
	bl __divsi3
	adds r4, r0, #0
	adds r0, r5, #0
	movs r1, #0x3c
	bl __modsi3
	mov r8, r0
	ldr r3, _080B02C8  @ gUnknown_08A214A6
	movs r5, #0x80
	lsls r5, r5, #7
	str r5, [sp]
	movs r0, #0
	adds r1, r6, #0
	adds r2, r7, #0
	bl PutSpriteExt
	adds r1, r6, #0
	adds r1, #0x28
	ldr r0, _080B02CC  @ gUnknown_08A21508
	mov r9, r0
	lsls r4, r4, #2
	add r4, r9
	ldr r3, [r4]
	str r5, [sp]
	movs r0, #0
	adds r2, r7, #0
	bl PutSpriteExt
	adds r1, r6, #0
	adds r1, #0x30
	ldr r3, _080B02D0  @ gUnknown_08A214AE
	str r5, [sp]
	movs r0, #0
	adds r2, r7, #0
	bl PutSpriteExt
	mov r0, r8
	cmp r0, #9
	ble _080B02D4
	adds r4, r6, #0
	adds r4, #0x38
	movs r1, #0xa
	bl __divsi3
	lsls r0, r0, #2
	add r0, r9
	ldr r3, [r0]
	str r5, [sp]
	movs r0, #0
	adds r1, r4, #0
	adds r2, r7, #0
	bl PutSpriteExt
	b _080B02E6
	.align 2, 0
_080B02C8: .4byte gUnknown_08A214A6
_080B02CC: .4byte gUnknown_08A21508
_080B02D0: .4byte gUnknown_08A214AE
_080B02D4:
	adds r1, r6, #0
	adds r1, #0x38
	mov r0, r9
	ldr r3, [r0]
	str r5, [sp]
	movs r0, #0
	adds r2, r7, #0
	bl PutSpriteExt
_080B02E6:
	adds r5, r6, #0
	adds r5, #0x40
	ldr r4, _080B0318  @ gUnknown_08A21508
	mov r0, r8
	movs r1, #0xa
	bl __modsi3
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r3, [r0]
	movs r0, #0x80
	lsls r0, r0, #7
	str r0, [sp]
	movs r0, #0
	adds r1, r5, #0
	adds r2, r7, #0
	bl PutSpriteExt
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B0318: .4byte gUnknown_08A21508

	THUMB_FUNC_END sub_80B0240

	THUMB_FUNC_START sub_80B031C
sub_80B031C: @ 0x080B031C
	movs r1, #0
	str r1, [r0, #0x2c]
	bx lr

	THUMB_FUNC_END sub_80B031C

	THUMB_FUNC_START sub_80B0324
sub_80B0324: @ 0x080B0324
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r7, r0, #0
	ldr r6, [r7, #0x14]
	adds r4, r6, #0
	adds r4, #0x3c
	movs r0, #0
	ldrsb r0, [r4, r0]
	lsls r0, r0, #3
	adds r0, #6
	movs r1, #0x80
	lsls r1, r1, #1
	bl sub_80B0088
	adds r0, r6, #0
	adds r0, #0x30
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _080B03CA
	movs r0, #0
	ldrsb r0, [r4, r0]
	lsls r5, r0, #3
	adds r5, #0x24
	movs r4, #0xff
	ands r5, r4
	movs r2, #0xc
	subs r2, r2, r0
	lsls r2, r2, #3
	adds r2, #4
	ands r2, r4
	movs r0, #0x80
	lsls r0, r0, #3
	adds r2, r2, r0
	ldr r3, _080B0424  @ gUnknown_08A2146A
	movs r0, #0xa0
	lsls r0, r0, #7
	str r0, [sp]
	movs r0, #0
	movs r1, #4
	bl PutSpriteExt
	adds r2, r5, #1
	ands r2, r4
	ldr r3, _080B0428  @ gUnknown_08A2148A
	movs r4, #0x80
	lsls r4, r4, #7
	str r4, [sp]
	movs r0, #0
	movs r1, #0x7c
	bl PutSpriteExt
	ldrh r1, [r6, #0x2c]
	lsls r0, r1, #5
	adds r0, r0, r1
	lsls r0, r0, #1
	ldr r2, _080B042C  @ gUnknown_08A20E74
	adds r1, r6, #0
	adds r1, #0x32
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	lsls r1, r1, #4
	adds r2, #4
	adds r1, r1, r2
	ldr r1, [r1]
	adds r1, #0x78
	bl __divsi3
	adds r1, r0, #0
	adds r1, #0x7c
	ldr r3, _080B0430  @ gUnknown_08A2149E
	str r4, [sp]
	movs r0, #0
	adds r2, r5, #0
	bl PutSpriteExt
	ldrh r2, [r6, #0x2c]
	movs r0, #0x30
	adds r1, r5, #0
	bl sub_80B0240
_080B03CA:
	adds r6, #0x3d
	movs r1, #0
	ldrsb r1, [r6, r1]
	lsls r1, r1, #3
	adds r1, #0x11
	ldr r5, _080B0434  @ 0x000001FF
	ands r1, r5
	ldr r3, _080B0438  @ gUnknown_08A21440
	movs r4, #0xc0
	lsls r4, r4, #6
	str r4, [sp]
	movs r0, #0xb
	movs r2, #0x58
	bl PutSprite
	movs r1, #0
	ldrsb r1, [r6, r1]
	lsls r1, r1, #3
	adds r1, #0x11
	ands r1, r5
	ldr r3, _080B043C  @ gUnknown_08A2144E
	str r4, [sp]
	movs r0, #0xb
	movs r2, #0x68
	bl PutSprite
	movs r1, #0
	ldrsb r1, [r6, r1]
	lsls r1, r1, #3
	adds r1, #0x11
	ands r1, r5
	ldr r3, _080B0440  @ gUnknown_08A2145C
	str r4, [sp]
	movs r0, #0xb
	movs r2, #0x78
	bl PutSprite
	adds r0, r7, #0
	bl sub_80B0204
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B0424: .4byte gUnknown_08A2146A
_080B0428: .4byte gUnknown_08A2148A
_080B042C: .4byte gUnknown_08A20E74
_080B0430: .4byte gUnknown_08A2149E
_080B0434: .4byte 0x000001FF
_080B0438: .4byte gUnknown_08A21440
_080B043C: .4byte gUnknown_08A2144E
_080B0440: .4byte gUnknown_08A2145C

	THUMB_FUNC_END sub_80B0324

	THUMB_FUNC_START sub_80B0444
sub_80B0444: @ 0x080B0444
	push {lr}
	adds r1, r0, #0
	ldr r0, _080B0454  @ gUnknown_08A21530
	bl Proc_Start
	pop {r1}
	bx r1
	.align 2, 0
_080B0454: .4byte gUnknown_08A21530

	THUMB_FUNC_END sub_80B0444

	THUMB_FUNC_START sub_80B0458
sub_80B0458: @ 0x080B0458
	push {r4, lr}
	ldr r0, _080B0490  @ 0x04000006
	ldrh r0, [r0]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0xa0
	bls _080B046A
	movs r2, #0
_080B046A:
	movs r0, #1
	ands r0, r2
	cmp r0, #0
	bne _080B04AE
	cmp r2, #0x63
	bhi _080B049C
	ldr r1, _080B0494  @ 0x04000050
	movs r0, #0xc1
	strh r0, [r1]
	ldr r4, _080B0498  @ 0x04000054
	movs r0, #0x64
	subs r0, r0, r2
	lsls r0, r0, #4
	movs r1, #0x64
	bl __divsi3
	strh r0, [r4]
	b _080B04AE
	.align 2, 0
_080B0490: .4byte 0x04000006
_080B0494: .4byte 0x04000050
_080B0498: .4byte 0x04000054
_080B049C:
	ldr r1, _080B04B4  @ 0x04000050
	movs r2, #0xa2
	lsls r2, r2, #1
	adds r0, r2, #0
	strh r0, [r1]
	adds r1, #2
	ldr r2, _080B04B8  @ 0x0000100A
	adds r0, r2, #0
	strh r0, [r1]
_080B04AE:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B04B4: .4byte 0x04000050
_080B04B8: .4byte 0x0000100A

	THUMB_FUNC_END sub_80B0458

	THUMB_FUNC_START sub_80B04BC
sub_80B04BC: @ 0x080B04BC
	push {lr}
	movs r1, #4
	str r1, [r0, #0x58]
	ldr r0, _080B04F0  @ gUnknown_08A21550
	bl SetupBackgrounds
	ldr r2, _080B04F4  @ gLCDControlBuffer
	ldrb r1, [r2]
	movs r0, #8
	negs r0, r0
	ands r0, r1
	movs r1, #1
	orrs r0, r1
	strb r0, [r2]
	ldrb r1, [r2, #0x15]
	movs r0, #0x3f
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	movs r1, #0x21
	negs r1, r1
	ands r0, r1
	strb r0, [r2, #0x15]
	pop {r0}
	bx r0
	.align 2, 0
_080B04F0: .4byte gUnknown_08A21550
_080B04F4: .4byte gLCDControlBuffer

	THUMB_FUNC_END sub_80B04BC

	THUMB_FUNC_START sub_80B04F8
sub_80B04F8: @ 0x080B04F8
	push {lr}
	ldr r0, _080B058C  @ gUnknown_08B1754C
	movs r1, #0
	movs r2, #0x40
	bl CopyToPaletteBuffer
	ldr r0, _080B0590  @ gUnknown_08A295B4
	movs r1, #0x40
	movs r2, #0x20
	bl CopyToPaletteBuffer
	ldr r0, _080B0594  @ Img_CommGameBgScreen
	ldr r1, _080B0598  @ 0x06001000
	bl Decompress
	ldr r0, _080B059C  @ gBG0TilemapBuffer
	ldr r1, _080B05A0  @ gUnknown_08A295D4
	movs r2, #0x80
	bl CallARM_FillTileRect
	movs r0, #1
	bl BG_EnableSyncByMask
	ldr r0, _080B05A4  @ gUnknown_08A2C11C
	movs r1, #0x88
	lsls r1, r1, #2
	movs r2, #0x80
	lsls r2, r2, #1
	bl CopyToPaletteBuffer
	ldr r0, _080B05A8  @ gUnknown_08A29A88
	ldr r1, _080B05AC  @ 0x06010800
	bl Decompress
	ldr r0, _080B05B0  @ gUnknown_08A2B1E4
	ldr r1, _080B05B4  @ 0x06014000
	bl Decompress
	ldr r0, _080B05B8  @ sub_80B0458
	bl SetPrimaryHBlankHandler
	ldr r2, _080B05BC  @ gLCDControlBuffer
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
	ldrb r0, [r2, #0xc]
	movs r1, #3
	orrs r0, r1
	strb r0, [r2, #0xc]
	ldrb r3, [r2, #0x10]
	movs r1, #4
	negs r1, r1
	adds r0, r1, #0
	ands r0, r3
	strb r0, [r2, #0x10]
	ldrb r3, [r2, #0x14]
	adds r0, r1, #0
	ands r0, r3
	movs r3, #2
	orrs r0, r3
	strb r0, [r2, #0x14]
	ldrb r0, [r2, #0x18]
	ands r1, r0
	orrs r1, r3
	strb r1, [r2, #0x18]
	pop {r0}
	bx r0
	.align 2, 0
_080B058C: .4byte gUnknown_08B1754C
_080B0590: .4byte gUnknown_08A295B4
_080B0594: .4byte Img_CommGameBgScreen
_080B0598: .4byte 0x06001000
_080B059C: .4byte gBG0TilemapBuffer
_080B05A0: .4byte gUnknown_08A295D4
_080B05A4: .4byte gUnknown_08A2C11C
_080B05A8: .4byte gUnknown_08A29A88
_080B05AC: .4byte 0x06010800
_080B05B0: .4byte gUnknown_08A2B1E4
_080B05B4: .4byte 0x06014000
_080B05B8: .4byte sub_80B0458
_080B05BC: .4byte gLCDControlBuffer

	THUMB_FUNC_END sub_80B04F8

	THUMB_FUNC_START nullsub_66
nullsub_66: @ 0x080B05C0
	bx lr

	THUMB_FUNC_END nullsub_66

	THUMB_FUNC_START sub_80B05C4
sub_80B05C4: @ 0x080B05C4
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, [r4, #0x58]
	cmp r0, #0
	blt _080B05FC
	ldr r3, _080B0604  @ gUnknown_08A2051C
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [sp]
	movs r0, #4
	movs r1, #0x38
	movs r2, #8
	bl PutSpriteExt
	ldr r1, _080B0608  @ gUnknown_08A2099C
	ldr r0, [r4, #0x58]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r3, [r0]
	movs r0, #0xc0
	lsls r0, r0, #6
	str r0, [sp]
	movs r0, #4
	movs r1, #0x40
	movs r2, #0x10
	bl PutSpriteExt
_080B05FC:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B0604: .4byte gUnknown_08A2051C
_080B0608: .4byte gUnknown_08A2099C

	THUMB_FUNC_END sub_80B05C4

	THUMB_FUNC_START sub_80B060C
sub_80B060C: @ 0x080B060C
	push {lr}
	adds r1, r0, #0
	ldr r0, _080B061C  @ gUnknown_08A21568
	bl Proc_Start
	pop {r0}
	bx r0
	.align 2, 0
_080B061C: .4byte gUnknown_08A21568

	THUMB_FUNC_END sub_80B060C

	THUMB_FUNC_START sub_80B0620
sub_80B0620: @ 0x080B0620
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080B0634  @ gUnknown_08A21568
	bl Proc_Find
	str r4, [r0, #0x58]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B0634: .4byte gUnknown_08A21568

	THUMB_FUNC_END sub_80B0620

.align 2, 0
