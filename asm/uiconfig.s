	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	THUMB_FUNC_START sub_80B169C
sub_80B169C: @ 0x080B169C
	push {lr}
	ldr r0, _080B16BC  @ gUnknown_08A2E974
	ldr r0, [r0]
	movs r1, #0x32
	ldrsh r2, [r0, r1]
	ldr r0, _080B16C0  @ gRAMChapterData
	ldrb r1, [r0, #0x14]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _080B16C4
	adds r0, r2, #3
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	b _080B16C6
	.align 2, 0
_080B16BC: .4byte gUnknown_08A2E974
_080B16C0: .4byte gRAMChapterData
_080B16C4:
	adds r0, r2, #0
_080B16C6:
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80B169C

	THUMB_FUNC_START sub_80B16CC
sub_80B16CC: @ 0x080B16CC
	ldr r0, _080B16D8  @ gUnknown_08A2E974
	ldr r0, [r0]
	ldrh r0, [r0, #0x2a]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bx lr
	.align 2, 0
_080B16D8: .4byte gUnknown_08A2E974

	THUMB_FUNC_END sub_80B16CC

	THUMB_FUNC_START sub_80B16DC
sub_80B16DC: @ 0x080B16DC
	push {lr}
	ldr r1, _080B16F8  @ gUnknown_08A2E978
	ldr r0, _080B16FC  @ gUnknown_08A2E974
	ldr r0, [r0]
	movs r2, #0x2a
	ldrsh r0, [r0, r2]
	adds r0, r0, r1
	ldrb r0, [r0]
	bl sub_80B1DE8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r1}
	bx r1
	.align 2, 0
_080B16F8: .4byte gUnknown_08A2E978
_080B16FC: .4byte gUnknown_08A2E974

	THUMB_FUNC_END sub_80B16DC

	THUMB_FUNC_START sub_80B1700
sub_80B1700: @ 0x080B1700
	push {r4, r5, lr}
	lsls r2, r0, #1
	adds r2, r2, r1
	movs r4, #0x1f
	ands r2, r4
	lsls r2, r2, #5
	ldr r3, _080B176C  @ gUnknown_08A2E99C
	ldr r1, _080B1770  @ gUnknown_08A2E978
	adds r0, r0, r1
	ldrb r1, [r0]
	movs r0, #0x2c
	muls r0, r1, r0
	adds r0, r0, r3
	adds r0, #0x24
	ldrb r1, [r0]
	adds r3, r1, #0
	ands r3, r4
	lsls r0, r1, #1
	ldr r1, _080B1774  @ 0x0000FFC0
	ands r0, r1
	movs r1, #0x80
	lsls r1, r1, #2
	adds r0, r0, r1
	adds r3, r3, r0
	movs r0, #0x80
	lsls r0, r0, #7
	adds r1, r3, r0
	ldr r4, _080B1778  @ gBG1TilemapBuffer
	adds r0, r2, #2
	lsls r0, r0, #1
	adds r0, r0, r4
	strh r1, [r0]
	adds r0, r2, #3
	lsls r0, r0, #1
	adds r0, r0, r4
	ldr r5, _080B177C  @ 0x00004001
	adds r1, r3, r5
	strh r1, [r0]
	adds r0, r2, #0
	adds r0, #0x22
	lsls r0, r0, #1
	adds r0, r0, r4
	adds r5, #0x1f
	adds r1, r3, r5
	strh r1, [r0]
	adds r2, #0x23
	lsls r2, r2, #1
	adds r2, r2, r4
	ldr r0, _080B1780  @ 0x00004021
	adds r3, r3, r0
	strh r3, [r2]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B176C: .4byte gUnknown_08A2E99C
_080B1770: .4byte gUnknown_08A2E978
_080B1774: .4byte 0x0000FFC0
_080B1778: .4byte gBG1TilemapBuffer
_080B177C: .4byte 0x00004001
_080B1780: .4byte 0x00004021

	THUMB_FUNC_END sub_80B1700

	THUMB_FUNC_START sub_80B1784
sub_80B1784: @ 0x080B1784
	push {r4, r5, lr}
	sub sp, #8
	ldr r4, _080B17D4  @ gUnknown_08A2E974
	ldr r0, [r4]
	adds r0, #0xa8
	bl Text_Clear
	ldr r5, _080B17D8  @ gUnknown_08A2E99C
	bl sub_80B16DC
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x15
	ldr r2, _080B17DC  @ gUnknown_08A2E978
	ldr r1, [r4]
	movs r3, #0x2a
	ldrsh r1, [r1, r3]
	adds r1, r1, r2
	ldrb r2, [r1]
	movs r1, #0x2c
	muls r1, r2, r1
	adds r0, r0, r1
	adds r0, r0, r5
	ldrh r0, [r0, #4]
	bl GetStringFromIndex
	adds r3, r0, #0
	ldr r0, [r4]
	adds r0, #0xa8
	ldr r1, _080B17E0  @ gUnknown_02023130
	movs r2, #0x16
	str r2, [sp]
	str r3, [sp, #4]
	movs r2, #0
	movs r3, #0
	bl DrawTextInline
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B17D4: .4byte gUnknown_08A2E974
_080B17D8: .4byte gUnknown_08A2E99C
_080B17DC: .4byte gUnknown_08A2E978
_080B17E0: .4byte gUnknown_02023130

	THUMB_FUNC_END sub_80B1784

	THUMB_FUNC_START sub_80B17E4
sub_80B17E4: @ 0x080B17E4
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #8
	adds r5, r0, #0
	adds r4, r1, #0
	adds r6, r2, #0
	ldr r0, _080B1840  @ gUnknown_08A2E974
	mov r8, r0
	lsls r4, r4, #3
	adds r4, #0x38
	ldr r0, [r0]
	adds r0, r0, r4
	bl Text_Clear
	ldr r2, _080B1844  @ gUnknown_08A2E99C
	ldr r0, _080B1848  @ gUnknown_08A2E978
	adds r5, r5, r0
	ldrb r1, [r5]
	movs r0, #0x2c
	muls r0, r1, r0
	adds r0, r0, r2
	ldrh r0, [r0]
	bl GetStringFromIndex
	adds r2, r0, #0
	mov r1, r8
	ldr r0, [r1]
	adds r0, r0, r4
	lsls r6, r6, #6
	ldr r1, _080B184C  @ gUnknown_020234B0
	adds r6, r6, r1
	movs r1, #9
	str r1, [sp]
	str r2, [sp, #4]
	adds r1, r6, #0
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
_080B1840: .4byte gUnknown_08A2E974
_080B1844: .4byte gUnknown_08A2E99C
_080B1848: .4byte gUnknown_08A2E978
_080B184C: .4byte gUnknown_020234B0

	THUMB_FUNC_END sub_80B17E4

	THUMB_FUNC_START sub_80B1850
sub_80B1850: @ 0x080B1850
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	str r1, [sp]
	str r2, [sp, #4]
	ldr r1, _080B1910  @ gUnknown_08A2E978
	adds r0, r0, r1
	ldrb r0, [r0]
	mov r9, r0
	ldr r1, _080B1914  @ gUnknown_08A2E99C
	movs r0, #0x2c
	mov r2, r9
	muls r2, r0, r2
	adds r0, r2, #0
	adds r4, r0, r1
	ldrb r0, [r4, #8]
	lsrs r0, r0, #3
	str r0, [sp, #8]
	ldr r1, _080B1918  @ gUnknown_08A2E974
	ldr r2, [sp]
	lsls r0, r2, #3
	adds r5, r0, #0
	adds r5, #0x70
	ldr r0, [r1]
	adds r0, r0, r5
	bl Text_Clear
	movs r0, #0
	mov r8, r0
	ldrh r0, [r4, #6]
	cmp r0, #0
	beq _080B18E0
	mov sl, r5
_080B1898:
	ldr r0, _080B1918  @ gUnknown_08A2E974
	ldr r0, [r0]
	mov r1, sl
	adds r7, r0, r1
	ldrb r0, [r4, #8]
	adds r6, r0, #0
	subs r6, #0x70
	mov r2, r9
	lsls r0, r2, #0x18
	lsrs r0, r0, #0x18
	bl sub_80B1DE8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r5, #1
	cmp r8, r0
	bne _080B18BC
	movs r5, #2
_080B18BC:
	ldrh r0, [r4, #6]
	bl GetStringFromIndex
	adds r3, r0, #0
	adds r0, r7, #0
	adds r1, r6, #0
	adds r2, r5, #0
	bl Text_InsertString
	adds r4, #8
	movs r0, #1
	add r8, r0
	mov r1, r8
	cmp r1, #3
	bgt _080B18E0
	ldrh r0, [r4, #6]
	cmp r0, #0
	bne _080B1898
_080B18E0:
	ldr r0, _080B1918  @ gUnknown_08A2E974
	ldr r2, [sp]
	lsls r1, r2, #3
	adds r1, #0x70
	ldr r0, [r0]
	adds r0, r0, r1
	ldr r2, [sp, #4]
	lsls r1, r2, #5
	ldr r2, [sp, #8]
	adds r1, r1, r2
	lsls r1, r1, #1
	ldr r2, _080B191C  @ gBG1TilemapBuffer
	adds r1, r1, r2
	bl Text_Draw
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B1910: .4byte gUnknown_08A2E978
_080B1914: .4byte gUnknown_08A2E99C
_080B1918: .4byte gUnknown_08A2E974
_080B191C: .4byte gBG1TilemapBuffer

	THUMB_FUNC_END sub_80B1850

	THUMB_FUNC_START sub_80B1920
sub_80B1920: @ 0x080B1920
	push {lr}
	movs r0, #1
	movs r1, #0x12
	bl LoadIconPalette
	movs r0, #0x80
	movs r1, #3
	bl UnpackUiVArrowGfx
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80B1920

	THUMB_FUNC_START sub_80B1938
sub_80B1938: @ 0x080B1938
	push {r4, r5, r6, r7, lr}
	ldr r1, _080B19F0  @ gUnknown_08A2E978
	ldr r6, _080B19F4  @ gUnknown_08A2E974
	ldr r0, [r6]
	movs r2, #0x2a
	ldrsh r0, [r0, r2]
	adds r0, r0, r1
	ldrb r5, [r0]
	bl GetGameClock
	movs r1, #0xf
	ands r0, r1
	movs r1, #8
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldr r2, _080B19F8  @ gUnknown_08A2E986
	movs r3, #0x83
	lsls r3, r3, #6
	movs r0, #0x12
	movs r1, #8
	bl CallARM_PushToSecondaryOAM
	ldr r0, [r6]
	movs r1, #0x2a
	ldrsh r4, [r0, r1]
	movs r2, #0x2c
	ldrsh r0, [r0, r2]
	subs r4, r4, r0
	lsls r4, r4, #4
	adds r4, #0x28
	movs r0, #0x10
	adds r1, r4, #0
	bl DisplayFrozenUiHand
	adds r0, r5, #0
	bl sub_80B1DE8
	ldr r2, _080B19FC  @ gUnknown_08A2E99C
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x15
	movs r1, #0x2c
	muls r1, r5, r1
	adds r0, r0, r1
	adds r0, r0, r2
	ldrb r0, [r0, #8]
	subs r0, #2
	adds r1, r4, #0
	bl DisplayUiHand
	ldr r0, [r6]
	adds r0, #0x37
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080B19B2
	bl sub_8095970
	cmp r0, #0
	beq _080B19DA
_080B19B2:
	bl sub_80B16CC
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080B19DA
	bl sub_80B16DC
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #3
	bne _080B19DA
	ldr r2, _080B1A00  @ gObject_16x16
	ldr r3, _080B1A04  @ 0x000020CC
	cmp r7, #0
	beq _080B19D2
	adds r3, #2
_080B19D2:
	movs r0, #0xc0
	movs r1, #0x28
	bl CallARM_PushToSecondaryOAM
_080B19DA:
	ldr r0, _080B19F4  @ gUnknown_08A2E974
	ldr r0, [r0]
	ldrh r1, [r0, #0x2e]
	ldrh r2, [r0, #0x34]
	movs r0, #0xa
	movs r3, #6
	bl sub_80976CC
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B19F0: .4byte gUnknown_08A2E978
_080B19F4: .4byte gUnknown_08A2E974
_080B19F8: .4byte gUnknown_08A2E986
_080B19FC: .4byte gUnknown_08A2E99C
_080B1A00: .4byte gObject_16x16
_080B1A04: .4byte 0x000020CC

	THUMB_FUNC_END sub_80B1938

	THUMB_FUNC_START sub_80B1A08
sub_80B1A08: @ 0x080B1A08
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x1c
	mov r9, r0
	ldr r1, _080B1C54  @ gUnknown_08205E50
	add r0, sp, #4
	movs r2, #0x18
	bl memcpy
	movs r0, #0
	mov sl, r0
	add r0, sp, #4
	bl SetupBackgrounds
	ldr r2, _080B1C58  @ gUnknown_08A2E974
	ldr r1, [r2]
	mov r0, sl
	strh r0, [r1, #0x32]
	movs r0, #0xd
	strh r0, [r1, #0x34]
	mov r2, sl
	strh r2, [r1, #0x2a]
	strh r2, [r1, #0x2c]
	strh r2, [r1, #0x2e]
	mov r0, r9
	strh r2, [r0, #0x30]
	adds r0, #0x36
	movs r2, #0
	strb r2, [r0]
	adds r1, #0x37
	ldrb r2, [r1]
	movs r0, #2
	negs r0, r0
	ands r0, r2
	strb r0, [r1]
	ldr r0, _080B1C58  @ gUnknown_08A2E974
	ldr r1, [r0]
	adds r1, #0x37
	ldrb r2, [r1]
	movs r0, #3
	negs r0, r0
	ands r0, r2
	strb r0, [r1]
	bl Font_InitForUIDefault
	bl sub_80156BC
	bl LoadUiFrameGraphics
	ldr r7, _080B1C5C  @ gLCDControlBuffer
	ldrb r0, [r7, #1]
	movs r1, #1
	mov r8, r1
	mov r2, r8
	orrs r0, r2
	movs r1, #2
	orrs r0, r1
	movs r6, #4
	orrs r0, r6
	movs r5, #8
	orrs r0, r5
	movs r4, #0x10
	orrs r0, r4
	strb r0, [r7, #1]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	ldr r2, _080B1C58  @ gUnknown_08A2E974
	ldr r0, [r2]
	ldrh r2, [r0, #0x2e]
	movs r0, #1
	movs r1, #0
	bl BG_SetPosition
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	movs r0, #3
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
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
	movs r1, #0
	strb r1, [r0]
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
	mov r2, r8
	orrs r0, r2
	movs r2, #2
	orrs r0, r2
	orrs r0, r6
	orrs r0, r5
	orrs r0, r4
	strb r0, [r1]
	adds r1, #2
	ldrb r0, [r1]
	mov r2, r8
	orrs r0, r2
	movs r2, #3
	negs r2, r2
	ands r0, r2
	orrs r0, r6
	orrs r0, r5
	orrs r0, r4
	strb r0, [r1]
	movs r0, #1
	movs r1, #0xe
	movs r2, #4
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	mov r0, sl
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #1
	movs r3, #0
	bl SetBlendTargetA
	mov r1, sl
	str r1, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #1
	bl SetBlendTargetB
	ldr r0, _080B1C60  @ gBG0TilemapBuffer
	movs r1, #0
	bl BG_Fill
	ldr r0, _080B1C64  @ gBG1TilemapBuffer
	movs r1, #0
	bl BG_Fill
	ldr r5, _080B1C68  @ gBG2TilemapBuffer
	adds r0, r5, #0
	movs r1, #0
	bl BG_Fill
	ldr r0, _080B1C6C  @ gBG3TilemapBuffer
	movs r1, #0
	bl BG_Fill
	ldr r4, _080B1C70  @ gUnknown_08A07A98
	adds r0, r4, #0
	movs r1, #0x80
	movs r2, #0x20
	bl CopyToPaletteBuffer
	movs r1, #0x90
	lsls r1, r1, #2
	adds r0, r4, #0
	movs r2, #0x20
	bl CopyToPaletteBuffer
	ldr r0, _080B1C74  @ gUnknown_08A0733C
	ldr r1, _080B1C78  @ 0x06011800
	bl CopyDataWithPossibleUncomp
	ldr r0, _080B1C7C  @ gUnknown_08A0754C
	ldr r1, _080B1C80  @ 0x06004000
	bl CopyDataWithPossibleUncomp
	ldr r0, _080B1C84  @ gUnknown_08A079B4
	ldr r4, _080B1C88  @ gUnknown_02020208
	adds r1, r4, #0
	bl CopyDataWithPossibleUncomp
	movs r2, #0x80
	lsls r2, r2, #5
	adds r0, r5, #0
	adds r1, r4, #0
	bl CallARM_FillTileRect
	bl Font_ResetAllocation
	ldr r2, _080B1C58  @ gUnknown_08A2E974
	ldr r0, [r2]
	adds r0, #0xa8
	movs r1, #0x16
	bl Text_Init
	bl sub_80B1784
	movs r3, #0xe4
	lsls r3, r3, #7
	movs r0, #1
	str r0, [sp]
	mov r0, r9
	movs r1, #0xe0
	movs r2, #0x2f
	bl sub_8097748
	ldr r1, _080B1C58  @ gUnknown_08A2E974
	ldr r0, [r1]
	adds r0, #0x68
	movs r1, #9
	bl Text_Init
	ldr r2, _080B1C58  @ gUnknown_08A2E974
	ldr r0, [r2]
	adds r0, #0xa0
	movs r1, #0xe
	bl Text_Init
	ldr r7, _080B1C58  @ gUnknown_08A2E974
	movs r6, #0x70
	movs r5, #0x38
	movs r4, #5
_080B1BE4:
	mov r0, sl
	movs r1, #5
	bl sub_80B1700
	ldr r0, [r7]
	adds r0, r0, r5
	movs r1, #9
	bl Text_Init
	ldr r0, [r7]
	adds r0, r0, r6
	movs r1, #0xe
	bl Text_Init
	mov r0, sl
	mov r1, sl
	adds r2, r4, #0
	bl sub_80B17E4
	mov r0, sl
	mov r1, sl
	adds r2, r4, #0
	bl sub_80B1850
	adds r6, #8
	adds r5, #8
	adds r4, #2
	movs r0, #1
	add sl, r0
	mov r1, sl
	cmp r1, #5
	ble _080B1BE4
	movs r0, #0
	str r0, [sp]
	mov r0, r9
	movs r1, #0
	movs r2, #0x12
	movs r3, #2
	bl sub_8086CE8
	ldr r0, _080B1C8C  @ gUnknown_08A2ECA8
	mov r1, r9
	bl Proc_Start
	movs r0, #0xf
	bl BG_EnableSyncByMask
	add sp, #0x1c
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B1C54: .4byte gUnknown_08205E50
_080B1C58: .4byte gUnknown_08A2E974
_080B1C5C: .4byte gLCDControlBuffer
_080B1C60: .4byte gBG0TilemapBuffer
_080B1C64: .4byte gBG1TilemapBuffer
_080B1C68: .4byte gBG2TilemapBuffer
_080B1C6C: .4byte gBG3TilemapBuffer
_080B1C70: .4byte gUnknown_08A07A98
_080B1C74: .4byte gUnknown_08A0733C
_080B1C78: .4byte 0x06011800
_080B1C7C: .4byte gUnknown_08A0754C
_080B1C80: .4byte 0x06004000
_080B1C84: .4byte gUnknown_08A079B4
_080B1C88: .4byte gUnknown_02020208
_080B1C8C: .4byte gUnknown_08A2ECA8

	THUMB_FUNC_END sub_80B1A08

	THUMB_FUNC_START sub_80B1C90
sub_80B1C90: @ 0x080B1C90
	push {lr}
	bl sub_80B1D14
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080B1CA4
	movs r0, #1
	negs r0, r0
	bl UnpackUiFrameBuffered
_080B1CA4:
	movs r0, #0
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80B1C90

	THUMB_FUNC_START sub_80B1CAC
sub_80B1CAC: @ 0x080B1CAC
	push {r4, lr}
	bl sub_80B1D14
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080B1D0A
	ldr r1, _080B1CD8  @ gUnknown_08A2E978
	ldr r4, _080B1CDC  @ gUnknown_08A2E974
	ldr r0, [r4]
	movs r2, #0x2a
	ldrsh r0, [r0, r2]
	adds r0, r0, r1
	ldrb r0, [r0]
	bl sub_80B1DE8
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080B1CE0
	bl sub_8002AC8
	b _080B1D0A
	.align 2, 0
_080B1CD8: .4byte gUnknown_08A2E978
_080B1CDC: .4byte gUnknown_08A2E974
_080B1CE0:
	ldr r0, [r4]
	adds r0, #0x37
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080B1CF8
	movs r0, #0x34
	movs r1, #0
	bl Sound_PlaySong80024D4
	b _080B1D0A
_080B1CF8:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080B1D06
	bl sub_80B9FC0
	b _080B1D0A
_080B1D06:
	bl sub_80160D0
_080B1D0A:
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80B1CAC

	THUMB_FUNC_START sub_80B1D14
sub_80B1D14: @ 0x080B1D14
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	movs r7, #0
	ldr r0, _080B1D64  @ gUnknown_08A2E974
	ldr r0, [r0]
	movs r1, #0x2a
	ldrsh r5, [r0, r1]
	ldr r0, _080B1D68  @ gUnknown_08A2E978
	adds r0, r5, r0
	ldrb r4, [r0]
	adds r6, r4, #0
	bl sub_80B16DC
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	ldr r0, _080B1D6C  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0x30
	ands r0, r1
	cmp r0, #0
	beq _080B1DCE
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _080B1D70
	cmp r3, #0
	beq _080B1D96
	subs r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	adds r0, r4, #0
	adds r1, r3, #0
	bl sub_80B1F64
	movs r7, #1
	b _080B1D9A
	.align 2, 0
_080B1D64: .4byte gUnknown_08A2E974
_080B1D68: .4byte gUnknown_08A2E978
_080B1D6C: .4byte gKeyStatusPtr
_080B1D70:
	ldr r2, _080B1DDC  @ gUnknown_08A2E99C
	adds r4, r3, #1
	lsls r0, r4, #3
	movs r1, #0x2c
	muls r1, r6, r1
	adds r0, r0, r1
	adds r0, r0, r2
	ldrh r0, [r0, #6]
	cmp r0, #0
	beq _080B1D96
	cmp r3, #2
	bhi _080B1D96
	lsls r0, r4, #0x18
	lsrs r3, r0, #0x18
	adds r0, r6, #0
	adds r1, r3, #0
	bl sub_80B1F64
	movs r7, #1
_080B1D96:
	cmp r7, #0
	beq _080B1DCE
_080B1D9A:
	ldr r0, _080B1DE0  @ gUnknown_08A2EC88
	mov r1, r8
	bl Proc_Start
	adds r0, r5, #0
	movs r1, #7
	bl __modsi3
	adds r1, r0, #0
	lsls r2, r5, #1
	adds r2, #5
	adds r0, r5, #0
	bl sub_80B1850
	movs r0, #3
	bl BG_EnableSyncByMask
	ldr r0, _080B1DE4  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080B1DCE
	movs r0, #0x67
	bl m4aSongNumStart
_080B1DCE:
	adds r0, r7, #0
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080B1DDC: .4byte gUnknown_08A2E99C
_080B1DE0: .4byte gUnknown_08A2EC88
_080B1DE4: .4byte gRAMChapterData

	THUMB_FUNC_END sub_80B1D14

	THUMB_FUNC_START sub_80B1DE8
sub_80B1DE8: @ 0x080B1DE8
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r2, #0
	cmp r0, #0x10
	bls _080B1DF6
	b _080B1F5A
_080B1DF6:
	lsls r0, r0, #2
	ldr r1, _080B1E00  @ _080B1E04
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080B1E00: .4byte _080B1E04
_080B1E04: @ jump table
	.4byte _080B1E48 @ case 0
	.4byte _080B1E7E @ case 1
	.4byte _080B1E8C @ case 2
	.4byte _080B1E98 @ case 3
	.4byte _080B1EA8 @ case 4
	.4byte _080B1EB8 @ case 5
	.4byte _080B1EC4 @ case 6
	.4byte _080B1ED4 @ case 7
	.4byte _080B1EE4 @ case 8
	.4byte _080B1F5A @ case 9
	.4byte _080B1EF4 @ case 10
	.4byte _080B1F04 @ case 11
	.4byte _080B1F14 @ case 12
	.4byte _080B1F20 @ case 13
	.4byte _080B1F30 @ case 14
	.4byte _080B1F40 @ case 15
	.4byte _080B1F50 @ case 16
_080B1E48:
	ldr r0, _080B1E60  @ gRAMChapterData
	adds r0, #0x42
	ldrb r0, [r0]
	lsls r0, r0, #0x1d
	lsrs r0, r0, #0x1e
	cmp r0, #1
	beq _080B1E76
	cmp r0, #1
	bgt _080B1E64
	cmp r0, #0
	beq _080B1E6E
	b _080B1E7E
	.align 2, 0
_080B1E60: .4byte gRAMChapterData
_080B1E64:
	cmp r0, #2
	beq _080B1E7A
	cmp r0, #3
	beq _080B1E72
	b _080B1E7E
_080B1E6E:
	movs r0, #0
	b _080B1F5C
_080B1E72:
	movs r0, #1
	b _080B1F5C
_080B1E76:
	movs r0, #2
	b _080B1F5C
_080B1E7A:
	movs r0, #3
	b _080B1F5C
_080B1E7E:
	ldr r0, _080B1E88  @ gRAMChapterData
	adds r0, #0x40
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	b _080B1F58
	.align 2, 0
_080B1E88: .4byte gRAMChapterData
_080B1E8C:
	ldr r0, _080B1E94  @ gRAMChapterData
	adds r0, #0x40
	b _080B1EE8
	.align 2, 0
_080B1E94: .4byte gRAMChapterData
_080B1E98:
	ldr r0, _080B1EA4  @ gRAMChapterData
	adds r0, #0x40
	ldrb r0, [r0]
	lsls r0, r0, #0x1b
	b _080B1F58
	.align 2, 0
_080B1EA4: .4byte gRAMChapterData
_080B1EA8:
	ldr r0, _080B1EB4  @ gRAMChapterData
	adds r0, #0x40
	ldrb r0, [r0]
	lsls r0, r0, #0x19
	lsrs r2, r0, #0x1e
	b _080B1F5A
	.align 2, 0
_080B1EB4: .4byte gRAMChapterData
_080B1EB8:
	ldr r0, _080B1EC0  @ gRAMChapterData
	adds r0, #0x40
	b _080B1F08
	.align 2, 0
_080B1EC0: .4byte gRAMChapterData
_080B1EC4:
	ldr r0, _080B1ED0  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1f
	b _080B1F58
	.align 2, 0
_080B1ED0: .4byte gRAMChapterData
_080B1ED4:
	ldr r0, _080B1EE0  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	b _080B1F58
	.align 2, 0
_080B1EE0: .4byte gRAMChapterData
_080B1EE4:
	ldr r0, _080B1EF0  @ gRAMChapterData
	adds r0, #0x41
_080B1EE8:
	ldrb r0, [r0]
	lsls r0, r0, #0x1c
	lsrs r2, r0, #0x1e
	b _080B1F5A
	.align 2, 0
_080B1EF0: .4byte gRAMChapterData
_080B1EF4:
	ldr r0, _080B1F00  @ gRAMChapterData
	adds r0, #0x42
	ldrb r0, [r0]
	lsls r0, r0, #0x1b
	lsrs r2, r0, #0x1e
	b _080B1F5A
	.align 2, 0
_080B1F00: .4byte gRAMChapterData
_080B1F04:
	ldr r0, _080B1F10  @ gRAMChapterData
	adds r0, #0x41
_080B1F08:
	ldrb r0, [r0]
	lsrs r2, r0, #7
	b _080B1F5A
	.align 2, 0
_080B1F10: .4byte gRAMChapterData
_080B1F14:
	ldr r0, _080B1F1C  @ gRAMChapterData
	adds r0, #0x41
	b _080B1F54
	.align 2, 0
_080B1F1C: .4byte gRAMChapterData
_080B1F20:
	ldr r0, _080B1F2C  @ gRAMChapterData
	adds r0, #0x40
	ldrb r0, [r0]
	lsls r0, r0, #0x1f
	b _080B1F58
	.align 2, 0
_080B1F2C: .4byte gRAMChapterData
_080B1F30:
	ldr r0, _080B1F3C  @ gRAMChapterData
	adds r0, #0x42
	ldrb r0, [r0]
	lsls r0, r0, #0x1f
	b _080B1F58
	.align 2, 0
_080B1F3C: .4byte gRAMChapterData
_080B1F40:
	ldr r0, _080B1F4C  @ gRAMChapterData
	adds r0, #0x42
	ldrb r0, [r0]
	lsls r0, r0, #0x1a
	b _080B1F58
	.align 2, 0
_080B1F4C: .4byte gRAMChapterData
_080B1F50:
	ldr r0, _080B1F60  @ gRAMChapterData
	adds r0, #0x42
_080B1F54:
	ldrb r0, [r0]
	lsls r0, r0, #0x19
_080B1F58:
	lsrs r2, r0, #0x1f
_080B1F5A:
	adds r0, r2, #0
_080B1F5C:
	pop {r1}
	bx r1
	.align 2, 0
_080B1F60: .4byte gRAMChapterData

	THUMB_FUNC_END sub_80B1DE8

	THUMB_FUNC_START sub_80B1F64
sub_80B1F64: @ 0x080B1F64
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r3, r1, #0x18
	cmp r0, #0x10
	bls _080B1F74
	b _080B2180
_080B1F74:
	lsls r0, r0, #2
	ldr r1, _080B1F80  @ _080B1F84
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080B1F80: .4byte _080B1F84
_080B1F84: @ jump table
	.4byte _080B1FC8 @ case 0
	.4byte _080B2030 @ case 1
	.4byte _080B2048 @ case 2
	.4byte _080B2060 @ case 3
	.4byte _080B2078 @ case 4
	.4byte _080B2090 @ case 5
	.4byte _080B209C @ case 6
	.4byte _080B20B4 @ case 7
	.4byte _080B20CC @ case 8
	.4byte _080B2180 @ case 9
	.4byte _080B20E4 @ case 10
	.4byte _080B20FC @ case 11
	.4byte _080B2114 @ case 12
	.4byte _080B2120 @ case 13
	.4byte _080B2138 @ case 14
	.4byte _080B2150 @ case 15
	.4byte _080B2168 @ case 16
_080B1FC8:
	cmp r3, #1
	beq _080B1FF4
	cmp r3, #1
	bgt _080B1FD6
	cmp r3, #0
	beq _080B1FE0
	b _080B2030
_080B1FD6:
	cmp r3, #2
	beq _080B2008
	cmp r3, #3
	beq _080B201C
	b _080B2030
_080B1FE0:
	ldr r0, _080B1FF0  @ gRAMChapterData
	adds r0, #0x42
	ldrb r2, [r0]
	movs r1, #7
	negs r1, r1
	ands r1, r2
	strb r1, [r0]
	b _080B2180
	.align 2, 0
_080B1FF0: .4byte gRAMChapterData
_080B1FF4:
	ldr r0, _080B2004  @ gRAMChapterData
	adds r0, #0x42
	ldrb r1, [r0]
	movs r2, #6
	orrs r1, r2
	strb r1, [r0]
	b _080B2180
	.align 2, 0
_080B2004: .4byte gRAMChapterData
_080B2008:
	ldr r2, _080B2018  @ gRAMChapterData
	adds r2, #0x42
	ldrb r1, [r2]
	movs r0, #7
	negs r0, r0
	ands r0, r1
	movs r1, #2
	b _080B217C
	.align 2, 0
_080B2018: .4byte gRAMChapterData
_080B201C:
	ldr r2, _080B202C  @ gRAMChapterData
	adds r2, #0x42
	ldrb r1, [r2]
	movs r0, #7
	negs r0, r0
	ands r0, r1
	movs r1, #4
	b _080B217C
	.align 2, 0
_080B202C: .4byte gRAMChapterData
_080B2030:
	ldr r2, _080B2044  @ gRAMChapterData
	adds r2, #0x40
	movs r0, #1
	adds r1, r3, #0
	ands r1, r0
	lsls r1, r1, #1
	ldrb r3, [r2]
	movs r0, #3
	negs r0, r0
	b _080B217A
	.align 2, 0
_080B2044: .4byte gRAMChapterData
_080B2048:
	ldr r2, _080B205C  @ gRAMChapterData
	adds r2, #0x40
	movs r0, #3
	adds r1, r3, #0
	ands r1, r0
	lsls r1, r1, #2
	ldrb r3, [r2]
	movs r0, #0xd
	negs r0, r0
	b _080B217A
	.align 2, 0
_080B205C: .4byte gRAMChapterData
_080B2060:
	ldr r2, _080B2074  @ gRAMChapterData
	adds r2, #0x40
	movs r0, #1
	adds r1, r3, #0
	ands r1, r0
	lsls r1, r1, #4
	ldrb r3, [r2]
	movs r0, #0x11
	negs r0, r0
	b _080B217A
	.align 2, 0
_080B2074: .4byte gRAMChapterData
_080B2078:
	ldr r2, _080B208C  @ gRAMChapterData
	adds r2, #0x40
	movs r0, #3
	adds r1, r3, #0
	ands r1, r0
	lsls r1, r1, #5
	ldrb r3, [r2]
	movs r0, #0x61
	negs r0, r0
	b _080B217A
	.align 2, 0
_080B208C: .4byte gRAMChapterData
_080B2090:
	ldr r1, _080B2098  @ gRAMChapterData
	adds r1, #0x40
	b _080B2100
	.align 2, 0
_080B2098: .4byte gRAMChapterData
_080B209C:
	ldr r2, _080B20B0  @ gRAMChapterData
	adds r2, #0x41
	movs r0, #1
	adds r1, r3, #0
	ands r1, r0
	ldrb r3, [r2]
	movs r0, #2
	negs r0, r0
	b _080B217A
	.align 2, 0
_080B20B0: .4byte gRAMChapterData
_080B20B4:
	ldr r2, _080B20C8  @ gRAMChapterData
	adds r2, #0x41
	movs r0, #1
	adds r1, r3, #0
	ands r1, r0
	lsls r1, r1, #1
	ldrb r3, [r2]
	movs r0, #3
	negs r0, r0
	b _080B217A
	.align 2, 0
_080B20C8: .4byte gRAMChapterData
_080B20CC:
	ldr r2, _080B20E0  @ gRAMChapterData
	adds r2, #0x41
	movs r0, #3
	adds r1, r3, #0
	ands r1, r0
	lsls r1, r1, #2
	ldrb r3, [r2]
	movs r0, #0xd
	negs r0, r0
	b _080B217A
	.align 2, 0
_080B20E0: .4byte gRAMChapterData
_080B20E4:
	ldr r2, _080B20F8  @ gRAMChapterData
	adds r2, #0x42
	movs r0, #3
	adds r1, r3, #0
	ands r1, r0
	lsls r1, r1, #3
	ldrb r3, [r2]
	movs r0, #0x19
	negs r0, r0
	b _080B217A
	.align 2, 0
_080B20F8: .4byte gRAMChapterData
_080B20FC:
	ldr r1, _080B2110  @ gRAMChapterData
	adds r1, #0x41
_080B2100:
	lsls r3, r3, #7
	ldrb r2, [r1]
	movs r0, #0x7f
	ands r0, r2
	orrs r0, r3
	strb r0, [r1]
	b _080B2180
	.align 2, 0
_080B2110: .4byte gRAMChapterData
_080B2114:
	ldr r2, _080B211C  @ gRAMChapterData
	adds r2, #0x41
	b _080B216C
	.align 2, 0
_080B211C: .4byte gRAMChapterData
_080B2120:
	ldr r2, _080B2134  @ gRAMChapterData
	adds r2, #0x40
	movs r0, #1
	adds r1, r3, #0
	ands r1, r0
	ldrb r3, [r2]
	movs r0, #2
	negs r0, r0
	b _080B217A
	.align 2, 0
_080B2134: .4byte gRAMChapterData
_080B2138:
	ldr r2, _080B214C  @ gRAMChapterData
	adds r2, #0x42
	movs r0, #1
	adds r1, r3, #0
	ands r1, r0
	ldrb r3, [r2]
	movs r0, #2
	negs r0, r0
	b _080B217A
	.align 2, 0
_080B214C: .4byte gRAMChapterData
_080B2150:
	ldr r2, _080B2164  @ gRAMChapterData
	adds r2, #0x42
	movs r0, #1
	adds r1, r3, #0
	ands r1, r0
	lsls r1, r1, #5
	ldrb r3, [r2]
	movs r0, #0x21
	negs r0, r0
	b _080B217A
	.align 2, 0
_080B2164: .4byte gRAMChapterData
_080B2168:
	ldr r2, _080B2184  @ gRAMChapterData
	adds r2, #0x42
_080B216C:
	movs r0, #1
	adds r1, r3, #0
	ands r1, r0
	lsls r1, r1, #6
	ldrb r3, [r2]
	movs r0, #0x41
	negs r0, r0
_080B217A:
	ands r0, r3
_080B217C:
	orrs r0, r1
	strb r0, [r2]
_080B2180:
	pop {r0}
	bx r0
	.align 2, 0
_080B2184: .4byte gRAMChapterData

	THUMB_FUNC_END sub_80B1F64

	THUMB_FUNC_START sub_80B2188
sub_80B2188: @ 0x080B2188
	push {r4, r5, r6, r7, lr}
	adds r6, r1, #0
	adds r7, r2, #0
	lsls r0, r6, #1
	adds r5, r0, #5
	movs r0, #0x1f
	ands r5, r0
	lsls r0, r5, #5
	ldr r2, _080B2204  @ gBG1TilemapBuffer
	movs r4, #0
	adds r1, r0, #0
	adds r1, #0x22
	adds r0, #2
	movs r3, #0x1a
	lsls r0, r0, #1
	adds r0, r0, r2
	lsls r1, r1, #1
	adds r1, r1, r2
_080B21AC:
	strh r4, [r0]
	strh r4, [r1]
	adds r1, #2
	adds r0, #2
	subs r3, #1
	cmp r3, #0
	bge _080B21AC
	adds r0, r6, #0
	movs r1, #7
	bl __modsi3
	adds r4, r0, #0
	adds r0, r6, #0
	movs r1, #5
	bl sub_80B1700
	adds r0, r6, #0
	adds r1, r4, #0
	adds r2, r5, #0
	bl sub_80B17E4
	adds r0, r6, #0
	adds r1, r4, #0
	adds r2, r5, #0
	bl sub_80B1850
	ldr r1, _080B2208  @ gBG0TilemapBuffer
	movs r2, #0
	adds r0, r7, #0
	adds r0, #0x62
	movs r3, #0x1a
	lsls r0, r0, #1
	adds r0, r0, r1
_080B21EE:
	strh r2, [r0]
	adds r0, #2
	subs r3, #1
	cmp r3, #0
	bge _080B21EE
	movs r0, #3
	bl BG_EnableSyncByMask
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B2204: .4byte gBG1TilemapBuffer
_080B2208: .4byte gBG0TilemapBuffer

	THUMB_FUNC_END sub_80B2188

	THUMB_FUNC_START sub_80B220C
sub_80B220C: @ 0x080B220C
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	movs r3, #0
	movs r1, #0x30
	ldrsh r0, [r4, r1]
	cmp r0, #6
	bls _080B221C
	b _080B244C
_080B221C:
	lsls r0, r0, #2
	ldr r1, _080B2228  @ _080B222C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080B2228: .4byte _080B222C
_080B222C: @ jump table
	.4byte _080B2248 @ case 0
	.4byte _080B2410 @ case 1
	.4byte _080B2410 @ case 2
	.4byte _080B2410 @ case 3
	.4byte _080B242C @ case 4
	.4byte _080B242C @ case 5
	.4byte _080B242C @ case 6
_080B2248:
	ldr r0, _080B226C  @ gKeyStatusPtr
	ldr r2, [r0]
	ldrh r1, [r2, #8]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080B2274
	ldr r0, _080B2270  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080B22D4
	movs r0, #0x6b
	bl m4aSongNumStart
	b _080B22D4
	.align 2, 0
_080B226C: .4byte gKeyStatusPtr
_080B2270: .4byte gRAMChapterData
_080B2274:
	movs r6, #1
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	beq _080B22E8
	ldr r5, _080B22DC  @ gUnknown_08A2E974
	ldr r0, [r5]
	adds r0, #0x37
	ldrb r1, [r0]
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	beq _080B2298
	bl sub_8095970
	cmp r0, #0
	bne _080B2298
	b _080B244C
_080B2298:
	ldr r1, _080B22E0  @ gUnknown_08A2E978
	ldr r0, [r5]
	movs r2, #0x2a
	ldrsh r0, [r0, r2]
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _080B22AA
	b _080B244C
_080B22AA:
	movs r0, #0
	bl sub_80B1DE8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #3
	beq _080B22BA
	b _080B244C
_080B22BA:
	ldr r0, _080B22E4  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080B22CC
	movs r0, #0x6a
	bl m4aSongNumStart
_080B22CC:
	adds r1, r4, #0
	adds r1, #0x36
	movs r0, #1
	strb r0, [r1]
_080B22D4:
	adds r0, r4, #0
	bl Proc_Break
	b _080B244C
	.align 2, 0
_080B22DC: .4byte gUnknown_08A2E974
_080B22E0: .4byte gUnknown_08A2E978
_080B22E4: .4byte gRAMChapterData
_080B22E8:
	ldrh r1, [r2, #6]
	movs r0, #0xc0
	ands r0, r1
	cmp r0, #0
	beq _080B23CC
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _080B2348
	ldr r5, _080B2344  @ gUnknown_08A2E974
	ldr r2, [r5]
	ldrh r1, [r2, #0x2a]
	movs r7, #0x2a
	ldrsh r0, [r2, r7]
	cmp r0, #0
	beq _080B2398
	subs r0, r1, #1
	strh r0, [r2, #0x2a]
	movs r1, #0x2a
	ldrsh r0, [r2, r1]
	movs r3, #0x2c
	ldrsh r1, [r2, r3]
	subs r0, r0, r1
	cmp r0, #0
	bgt _080B2340
	ldrh r1, [r2, #0x2c]
	movs r7, #0x2c
	ldrsh r0, [r2, r7]
	cmp r0, #0
	beq _080B2340
	subs r0, r1, #1
	strh r0, [r2, #0x2c]
	movs r0, #0x2a
	ldrsh r1, [r2, r0]
	subs r1, #1
	adds r0, r4, #0
	movs r2, #0
	bl sub_80B2188
	ldr r1, [r5]
	ldrh r0, [r1, #0x2e]
	subs r0, #4
	strh r0, [r1, #0x2e]
	strh r6, [r4, #0x30]
_080B2340:
	movs r3, #1
	b _080B239C
	.align 2, 0
_080B2344: .4byte gUnknown_08A2E974
_080B2348:
	ldr r5, _080B23C0  @ gUnknown_08A2E974
	ldr r2, [r5]
	movs r6, #0x2a
	ldrsh r1, [r2, r6]
	movs r7, #0x34
	ldrsh r0, [r2, r7]
	subs r0, #1
	cmp r1, r0
	bge _080B2398
	ldrh r0, [r2, #0x2a]
	adds r0, #1
	strh r0, [r2, #0x2a]
	movs r0, #0x2a
	ldrsh r1, [r2, r0]
	movs r3, #0x2c
	ldrsh r0, [r2, r3]
	subs r0, r1, r0
	cmp r0, #4
	ble _080B2396
	movs r6, #0x34
	ldrsh r0, [r2, r6]
	subs r0, #1
	cmp r1, r0
	bge _080B2396
	ldrh r0, [r2, #0x2c]
	adds r0, #1
	strh r0, [r2, #0x2c]
	adds r1, #1
	movs r2, #0xa0
	lsls r2, r2, #1
	adds r0, r4, #0
	bl sub_80B2188
	ldr r1, [r5]
	ldrh r0, [r1, #0x2e]
	adds r0, #4
	strh r0, [r1, #0x2e]
	movs r0, #4
	strh r0, [r4, #0x30]
_080B2396:
	movs r3, #1
_080B2398:
	cmp r3, #0
	beq _080B23CC
_080B239C:
	ldr r0, _080B23C4  @ gUnknown_08A2EC88
	adds r1, r4, #0
	bl Proc_Start
	movs r0, #3
	bl BG_EnableSyncByMask
	ldr r0, _080B23C8  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080B244C
	movs r0, #0x66
	bl m4aSongNumStart
	b _080B244C
	.align 2, 0
_080B23C0: .4byte gUnknown_08A2E974
_080B23C4: .4byte gUnknown_08A2EC88
_080B23C8: .4byte gRAMChapterData
_080B23CC:
	ldr r0, _080B2400  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0x30
	ands r0, r1
	cmp r0, #0
	beq _080B244C
	ldr r2, _080B2404  @ gUnknown_08A2E99C
	ldr r1, _080B2408  @ gUnknown_08A2E978
	ldr r0, _080B240C  @ gUnknown_08A2E974
	ldr r0, [r0]
	movs r3, #0x2a
	ldrsh r0, [r0, r3]
	adds r0, r0, r1
	ldrb r1, [r0]
	movs r0, #0x2c
	muls r0, r1, r0
	adds r2, #0x28
	adds r0, r0, r2
	ldr r1, [r0]
	cmp r1, #0
	beq _080B244C
	adds r0, r4, #0
	bl _call_via_r1
	b _080B244C
	.align 2, 0
_080B2400: .4byte gKeyStatusPtr
_080B2404: .4byte gUnknown_08A2E99C
_080B2408: .4byte gUnknown_08A2E978
_080B240C: .4byte gUnknown_08A2E974
_080B2410:
	ldr r0, _080B2428  @ gUnknown_08A2E974
	ldr r1, [r0]
	ldrh r0, [r1, #0x2e]
	subs r0, #4
	strh r0, [r1, #0x2e]
	ldrh r1, [r4, #0x30]
	movs r6, #0x30
	ldrsh r0, [r4, r6]
	cmp r0, #3
	bne _080B2448
	movs r0, #0
	b _080B244A
	.align 2, 0
_080B2428: .4byte gUnknown_08A2E974
_080B242C:
	ldr r0, _080B2444  @ gUnknown_08A2E974
	ldr r1, [r0]
	ldrh r0, [r1, #0x2e]
	adds r0, #4
	strh r0, [r1, #0x2e]
	ldrh r1, [r4, #0x30]
	movs r7, #0x30
	ldrsh r0, [r4, r7]
	cmp r0, #6
	bne _080B2448
	movs r0, #0
	b _080B244A
	.align 2, 0
_080B2444: .4byte gUnknown_08A2E974
_080B2448:
	adds r0, r1, #1
_080B244A:
	strh r0, [r4, #0x30]
_080B244C:
	ldr r0, _080B2460  @ gUnknown_08A2E974
	ldr r0, [r0]
	ldrh r2, [r0, #0x2e]
	movs r0, #1
	movs r1, #0
	bl BG_SetPosition
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B2460: .4byte gUnknown_08A2E974

	THUMB_FUNC_END sub_80B220C

	THUMB_FUNC_START sub_80B2464
sub_80B2464: @ 0x080B2464
	push {r4, lr}
	adds r4, r0, #0
	bl Delete6CMenuScroll
	bl EndBG3Slider
	ldr r0, _080B248C  @ gUnknown_08A2ECA8
	bl Proc_EndEach
	ldr r0, _080B2490  @ gUnknown_08A2EC88
	bl Proc_EndEach
	adds r0, r4, #0
	adds r0, #0x36
	ldrb r0, [r0]
	cmp r0, #0
	bne _080B2494
	movs r0, #1
	b _080B24A4
	.align 2, 0
_080B248C: .4byte gUnknown_08A2ECA8
_080B2490: .4byte gUnknown_08A2EC88
_080B2494:
	adds r0, r4, #0
	bl sub_8092134
	adds r0, r4, #0
	movs r1, #0
	bl Proc_Goto
	movs r0, #0
_080B24A4:
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80B2464

	THUMB_FUNC_START sub_80B24AC
sub_80B24AC: @ 0x080B24AC
	ldr r0, _080B24BC  @ gUnknown_08A2E974
	ldr r1, [r0]
	adds r1, #0x37
	ldrb r0, [r1]
	movs r2, #1
	orrs r0, r2
	strb r0, [r1]
	bx lr
	.align 2, 0
_080B24BC: .4byte gUnknown_08A2E974

	THUMB_FUNC_END sub_80B24AC

	THUMB_FUNC_START sub_80B24C0
sub_80B24C0: @ 0x080B24C0
	push {lr}
	ldr r0, _080B24D8  @ gUnknown_08A2E974
	ldr r1, [r0]
	adds r1, #0x37
	ldrb r0, [r1]
	movs r2, #2
	orrs r0, r2
	strb r0, [r1]
	bl SMS_ClearUsageTable
	pop {r0}
	bx r0
	.align 2, 0
_080B24D8: .4byte gUnknown_08A2E974

	THUMB_FUNC_END sub_80B24C0

.align 2, 0
