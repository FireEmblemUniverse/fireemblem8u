	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	THUMB_FUNC_START sub_80A882C
sub_80A882C: @ 0x080A882C
	push {lr}
	movs r1, #0x12
	bl Proc_Goto
	movs r0, #0xc0
	movs r1, #0
	movs r2, #0x10
	movs r3, #0
	bl ISuspectThisToBeMusicRelated_8002730
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80A882C

	THUMB_FUNC_START sub_80A8844
sub_80A8844: @ 0x080A8844
	push {r4, r5, lr}
	adds r5, r1, #0
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	movs r3, #0
	movs r2, #0
	movs r1, #1
_080A8852:
	adds r0, r4, #0
	asrs r0, r2
	ands r0, r1
	cmp r0, #0
	beq _080A886C
	cmp r5, r3
	bne _080A886A
	adds r0, r1, #0
	lsls r0, r2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	b _080A8874
_080A886A:
	adds r3, #1
_080A886C:
	adds r2, #1
	cmp r2, #7
	ble _080A8852
	movs r0, #0xff
_080A8874:
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80A8844

	THUMB_FUNC_START sub_80A887C
sub_80A887C: @ 0x080A887C
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r4, r1, #0x18
	movs r3, #0
	movs r2, #0
	movs r1, #1
_080A888C:
	adds r0, r5, #0
	asrs r0, r2
	ands r0, r1
	cmp r0, #0
	beq _080A88A8
	adds r0, r4, #0
	asrs r0, r2
	ands r0, r1
	cmp r0, #0
	beq _080A88A6
	lsls r0, r3, #0x18
	lsrs r0, r0, #0x18
	b _080A88B0
_080A88A6:
	adds r3, #1
_080A88A8:
	adds r2, #1
	cmp r2, #7
	ble _080A888C
	movs r0, #0xff
_080A88B0:
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80A887C

	THUMB_FUNC_START sub_80A88B8
sub_80A88B8: @ 0x080A88B8
	push {lr}
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	movs r1, #0
	movs r3, #1
_080A88C2:
	adds r0, r2, #0
	asrs r0, r1
	ands r0, r3
	cmp r0, #0
	beq _080A88D2
	lsls r0, r1, #0x18
	lsrs r0, r0, #0x18
	b _080A88DA
_080A88D2:
	adds r1, #1
	cmp r1, #7
	ble _080A88C2
	movs r0, #0xff
_080A88DA:
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80A88B8

	THUMB_FUNC_START sub_80A88E0
sub_80A88E0: @ 0x080A88E0
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x3f
	ldrb r0, [r0]
	cmp r0, #0xff
	beq _080A88F6
	adds r0, r4, #0
	adds r0, #0x36
	ldrb r1, [r0]
	cmp r1, #0
	bne _080A8904
_080A88F6:
	bl CloseHelpBox
	adds r1, r4, #0
	adds r1, #0x3e
	movs r0, #0
	strb r0, [r1]
	b _080A8940
_080A8904:
	adds r1, r4, #0
	adds r1, #0x42
	ldrh r1, [r1]
	cmp r1, #0x10
	beq _080A891C
	cmp r1, #0x10
	bgt _080A8918
	cmp r1, #2
	beq _080A891C
	b _080A8940
_080A8918:
	cmp r1, #0x20
	bne _080A8940
_080A891C:
	ldrb r0, [r0]
	cmp r0, #0
	beq _080A8940
	adds r4, #0x3e
	ldrb r0, [r4]
	cmp r0, #0
	bne _080A8940
	ldr r0, _080A8948  @ 0x06014000
	movs r1, #9
	bl LoadDialogueBoxGfx
	ldr r2, _080A894C  @ 0x00000882
	movs r0, #0x30
	movs r1, #0x30
	bl StartHelpBoxExt_Unk
	movs r0, #1
	strb r0, [r4]
_080A8940:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A8948: .4byte 0x06014000
_080A894C: .4byte 0x00000882

	THUMB_FUNC_END sub_80A88E0

	THUMB_FUNC_START sub_80A8950
sub_80A8950: @ 0x080A8950
	push {r4, r5, r6, r7, lr}
	sub sp, #0x168
	adds r4, r0, #0
	bl SaveMetadata_LoadId
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080A8964
	movs r0, #0
	b _080A89DA
_080A8964:
	adds r0, r4, #0
	mov r1, sp
	bl LoadSavedChapterState
	mov r0, sp
	ldrb r0, [r0, #0x1b]
	cmp r0, #1
	blt _080A897C
	cmp r0, #2
	ble _080A897C
	cmp r0, #3
	beq _080A8980
_080A897C:
	movs r6, #1
	b _080A8982
_080A8980:
	movs r6, #0xf
_080A8982:
	adds r0, r4, #0
	bl GetSaveSourceAddress
	adds r7, r0, #0
	movs r5, #0
	adds r4, r7, #0
	adds r4, #0x4c
	b _080A8996
_080A8992:
	adds r4, #0x24
	adds r5, #1
_080A8996:
	cmp r5, #0x32
	bgt _080A89D4
	adds r0, r4, #0
	add r1, sp, #0x4c
	bl LoadSavedUnit
	ldr r0, [sp, #0x4c]
	add r1, sp, #0x4c
	cmp r0, #0
	beq _080A8992
	ldrb r0, [r0, #4]
	cmp r0, r6
	bne _080A8992
	ldr r4, _080A89CC  @ gUnknown_0203EF64
	strb r6, [r4]
	ldrb r0, [r1, #8]
	strb r0, [r4, #1]
	ldr r1, _080A89D0  @ 0x00000D8C
	adds r0, r7, r1
	add r5, sp, #0x94
	adds r1, r5, #0
	bl LoadWMStuff
	ldrb r0, [r5, #0x11]
	strb r0, [r4, #2]
	b _080A89D8
	.align 2, 0
_080A89CC: .4byte gUnknown_0203EF64
_080A89D0: .4byte 0x00000D8C
_080A89D4:
	bl sub_80AA700
_080A89D8:
	movs r0, #2
_080A89DA:
	add sp, #0x168
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80A8950

	THUMB_FUNC_START sub_80A89E4
sub_80A89E4: @ 0x080A89E4
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	movs r7, #8
	adds r5, r6, #0
	adds r5, #0x40
	ldrb r0, [r5]
	cmp r0, #8
	bne _080A8A14
	ldr r0, _080A8A10  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0xf9
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080A8A70
	bl CloseHelpBox
	movs r0, #7
	strb r0, [r5]
	b _080A8A70
	.align 2, 0
_080A8A10: .4byte gKeyStatusPtr
_080A8A14:
	ldr r0, _080A8A48  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080A8A70
	adds r4, r6, #0
	adds r4, #0x2c
	ldrb r0, [r4]
	bl sub_80A8950
	cmp r0, #0
	bne _080A8A50
	ldr r0, _080A8A4C  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A8A70
	movs r0, #0x6c
	bl m4aSongNumStart
	b _080A8A70
	.align 2, 0
_080A8A48: .4byte gKeyStatusPtr
_080A8A4C: .4byte gRAMChapterData
_080A8A50:
	cmp r0, #0
	blt _080A8A70
	cmp r0, #2
	bgt _080A8A70
	ldr r0, _080A8A8C  @ 0x06014000
	movs r1, #9
	bl LoadDialogueBoxGfx
	ldrb r1, [r4]
	lsls r1, r1, #5
	adds r1, #0x2c
	ldr r2, _080A8A90  @ 0x0000FFFE
	movs r0, #0x50
	bl StartItemHelpBox
	strb r7, [r5]
_080A8A70:
	adds r1, r6, #0
	adds r1, #0x40
	ldrb r0, [r1]
	cmp r0, #0
	beq _080A8A88
	cmp r0, r7
	bge _080A8A82
	subs r0, #1
	strb r0, [r1]
_080A8A82:
	ldrb r0, [r1]
	cmp r0, #0
	bne _080A8A94
_080A8A88:
	movs r0, #0
	b _080A8A96
	.align 2, 0
_080A8A8C: .4byte 0x06014000
_080A8A90: .4byte 0x0000FFFE
_080A8A94:
	movs r0, #1
_080A8A96:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80A89E4

	THUMB_FUNC_START sub_80A8A9C
sub_80A8A9C: @ 0x080A8A9C
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	movs r0, #0xac
	lsls r0, r0, #4
	bl sub_8089678
	movs r4, #0
	ldr r6, _080A8ACC  @ 0x0001FFFF
	movs r5, #0xb4
	lsls r5, r5, #9
_080A8AB0:
	adds r0, r7, #0
	adds r0, #0x37
	adds r1, r0, r4
	ldrb r0, [r1]
	cmp r0, #0xff
	beq _080A8AD0
	adds r0, r5, #0
	ands r0, r6
	lsrs r0, r0, #5
	ldrb r1, [r1]
	bl sub_8089624
	b _080A8ADE
	.align 2, 0
_080A8ACC: .4byte 0x0001FFFF
_080A8AD0:
	adds r0, r5, #0
	ands r0, r6
	lsrs r0, r0, #5
	movs r1, #1
	negs r1, r1
	bl sub_8089624
_080A8ADE:
	movs r0, #0x80
	lsls r0, r0, #4
	adds r5, r5, r0
	adds r4, #1
	cmp r4, #2
	ble _080A8AB0
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80A8A9C

	THUMB_FUNC_START sub_80A8AF0
sub_80A8AF0: @ 0x080A8AF0
	push {r4, r5, lr}
	sub sp, #4
	ldr r5, _080A8B2C  @ gRAMChapterData
	ldrb r1, [r5, #0x14]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	bne _080A8B7E
	movs r4, #0xe
	ldrsb r4, [r5, r4]
	ldr r2, _080A8B30  @ gGMData
	ldrb r1, [r2]
	movs r0, #3
	ands r0, r1
	cmp r0, #3
	bne _080A8B34
	cmp r4, #1
	bls _080A8B7E
	cmp r4, #0x38
	beq _080A8B7E
	adds r0, r2, #0
	bl sub_80BD014
	cmp r0, #0
	bge _080A8B24
	movs r0, #0
_080A8B24:
	bl WMLoc_GetChapterId
	strb r0, [r5, #0xe]
	b _080A8B7E
	.align 2, 0
_080A8B2C: .4byte gRAMChapterData
_080A8B30: .4byte gGMData
_080A8B34:
	movs r0, #0xe
	ldrsb r0, [r5, r0]
	cmp r0, #6
	bne _080A8B4E
	movs r0, #0x88
	bl CheckEventId
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A8B4E
	movs r0, #0x38
	strb r0, [r5, #0xe]
	b _080A8B7E
_080A8B4E:
	cmp r4, #1
	beq _080A8B7E
	cmp r4, #0xa
	beq _080A8B7E
	cmp r4, #0x17
	beq _080A8B7E
	ldr r4, _080A8C18  @ gRAMChapterData
	adds r0, r4, #0
	adds r0, #0x4a
	ldrb r1, [r0]
	movs r0, #0xe
	ands r0, r1
	cmp r0, #4
	beq _080A8B7E
	ldr r0, _080A8C1C  @ gGameState
	ldrb r1, [r0, #4]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	bne _080A8B7E
	ldr r0, _080A8C20  @ gGMData
	bl sub_80BD224
	strb r0, [r4, #0xe]
_080A8B7E:
	bl sub_80AA700
	ldr r0, _080A8C24  @ gUnknown_08A20050
	bl SetupBackgrounds
	ldr r3, _080A8C28  @ gLCDControlBuffer
	ldrb r1, [r3, #1]
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
	strb r0, [r3, #1]
	ldrb r1, [r3]
	movs r0, #8
	negs r0, r0
	ands r0, r1
	strb r0, [r3]
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
	movs r4, #0
	str r4, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #1
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
	movs r0, #1
	movs r1, #6
	movs r2, #0x10
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A8C18: .4byte gRAMChapterData
_080A8C1C: .4byte gGameState
_080A8C20: .4byte gGMData
_080A8C24: .4byte gUnknown_08A20050
_080A8C28: .4byte gLCDControlBuffer

	THUMB_FUNC_END sub_80A8AF0

	THUMB_FUNC_START sub_80A8C2C
sub_80A8C2C: @ 0x080A8C2C
	push {r4, lr}
	sub sp, #4
	bl sub_80AA700
	ldr r0, _080A8CCC  @ gUnknown_08A20050
	bl SetupBackgrounds
	ldr r3, _080A8CD0  @ gLCDControlBuffer
	ldrb r1, [r3, #1]
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
	strb r0, [r3, #1]
	ldrb r1, [r3]
	movs r0, #8
	negs r0, r0
	ands r0, r1
	strb r0, [r3]
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
	movs r4, #0
	str r4, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #1
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
	movs r0, #1
	movs r1, #6
	movs r2, #0x10
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A8CCC: .4byte gUnknown_08A20050
_080A8CD0: .4byte gLCDControlBuffer

	THUMB_FUNC_END sub_80A8C2C

	THUMB_FUNC_START ProcSaveMenu_InitScreen
ProcSaveMenu_InitScreen: @ 0x080A8CD4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	mov r8, r0
	bl Font_ResetAllocation
	bl LoadUiFrameGraphics
	bl LoadObjUIGfx
	ldr r0, _080A8EB0  @ gUnknown_08A25DCC
	movs r6, #0x80
	lsls r6, r6, #1
	adds r1, r6, #0
	adds r2, r6, #0
	bl CopyToPaletteBuffer
	ldr r4, _080A8EB4  @ gUnknown_08A21658
	movs r0, #3
	bl GetBackgroundTileDataOffset
	adds r1, r0, #0
	movs r0, #0xc0
	lsls r0, r0, #0x13
	adds r1, r1, r0
	adds r0, r4, #0
	bl CopyDataWithPossibleUncomp
	ldr r0, _080A8EB8  @ gBG3TilemapBuffer
	ldr r1, _080A8EBC  @ gUnknown_08A25ECC
	movs r2, #0x80
	lsls r2, r2, #8
	bl CallARM_FillTileRect
	ldr r0, _080A8EC0  @ gUnknown_08A268D8
	movs r1, #0xe0
	movs r2, #0x20
	bl CopyToPaletteBuffer
	ldr r4, _080A8EC4  @ gUnknown_08A26380
	movs r0, #3
	bl GetBackgroundTileDataOffset
	adds r1, r0, #0
	ldr r2, _080A8EC8  @ 0x06004C00
	adds r1, r1, r2
	adds r0, r4, #0
	bl CopyDataWithPossibleUncomp
	ldr r0, _080A8ECC  @ gUnknown_08A268F8
	ldr r4, _080A8ED0  @ gGenericBuffer
	adds r1, r4, #0
	bl CopyDataWithPossibleUncomp
	ldr r0, _080A8ED4  @ gBG2TilemapBuffer
	ldr r2, _080A8ED8  @ 0x00007260
	adds r1, r4, #0
	bl CallARM_FillTileRect
	ldr r0, _080A8EDC  @ Img_SaveScreenSprits
	ldr r1, _080A8EE0  @ 0x06010800
	bl CopyDataWithPossibleUncomp
	ldr r0, _080A8EE4  @ Pal_SaveScreenSprits
	movs r1, #0x90
	lsls r1, r1, #2
	adds r2, r6, #0
	bl CopyToPaletteBuffer
	ldr r0, _080A8EE8  @ gUnknown_08A295B4
	movs r1, #0x40
	movs r2, #0x20
	bl CopyToPaletteBuffer
	ldr r0, _080A8EEC  @ gUnknown_02022AE8
	adds r1, r0, #0
	subs r1, #0x20
	movs r2, #1
	bl sub_80AA790
	ldr r0, _080A8EF0  @ gUnknown_08A2C23C
	ldr r1, _080A8EF4  @ gUnknown_020007A0
	movs r2, #2
	bl sub_80AA790
	movs r0, #0xf
	bl BG_EnableSyncByMask
	mov r0, r8
	adds r0, #0x29
	movs r4, #0
	strb r4, [r0]
	ldr r1, _080A8EF8  @ gLCDControlBuffer
	adds r2, r1, #0
	adds r2, #0x34
	ldrb r0, [r2]
	movs r3, #0x20
	orrs r0, r3
	strb r0, [r2]
	adds r1, #0x35
	ldrb r0, [r1]
	orrs r0, r3
	strb r0, [r1]
	mov r0, r8
	adds r0, #0x36
	strb r4, [r0]
	mov r1, r8
	adds r1, #0x2d
	movs r0, #0xff
	strb r0, [r1]
	mov r0, r8
	adds r0, #0x3d
	strb r4, [r0]
	movs r7, #0
	ldr r0, _080A8EFC  @ gSinLookup
	mov r9, r0
	movs r1, #0x80
	add r1, r9
	mov sl, r1
	adds r5, r6, #0
_080A8DCA:
	mov r2, sl
	movs r1, #0
	ldrsh r0, [r2, r1]
	lsls r0, r0, #4
	adds r1, r5, #0
	bl Div
	adds r6, r0, #0
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	mov r2, r9
	movs r1, #0
	ldrsh r0, [r2, r1]
	negs r0, r0
	lsls r0, r0, #4
	adds r1, r5, #0
	bl Div
	lsls r2, r0, #0x10
	asrs r0, r2, #0x10
	str r0, [sp, #8]
	mov r1, r9
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #4
	adds r1, r5, #0
	bl Div
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	mov r1, sl
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #4
	adds r1, r5, #0
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	adds r0, r7, #0
	adds r1, r6, #0
	ldr r2, [sp, #8]
	adds r3, r4, #0
	bl WriteOAMRotScaleData
	adds r7, #1
	cmp r7, #3
	ble _080A8DCA
	mov r1, r8
	adds r1, #0x44
	movs r2, #0
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r1]
	subs r1, #5
	movs r0, #0xff
	strb r0, [r1]
	mov r0, r8
	adds r0, #0x3e
	strb r2, [r0]
	adds r0, #2
	strb r2, [r0]
	movs r7, #0
	mov r4, r8
	adds r4, #0x2c
_080A8E50:
	lsls r0, r7, #0x18
	lsrs r0, r0, #0x18
	mov r1, r8
	bl sub_80ABC14
	adds r7, #1
	cmp r7, #3
	ble _080A8E50
	ldrb r0, [r4]
	bl sub_80ABD88
	bl sub_80AB794
	movs r0, #2
	bl BG_EnableSyncByMask
	ldr r2, _080A8EF8  @ gLCDControlBuffer
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
	ldr r1, _080A8F00  @ gPaletteBuffer
	movs r0, #0
	strh r0, [r1]
	bl EnablePaletteSync
	mov r0, r8
	bl sub_80A8A9C
	mov r0, r8
	bl New6C_savedraw
	mov r1, r8
	str r0, [r1, #0x58]
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A8EB0: .4byte gUnknown_08A25DCC
_080A8EB4: .4byte gUnknown_08A21658
_080A8EB8: .4byte gBG3TilemapBuffer
_080A8EBC: .4byte gUnknown_08A25ECC
_080A8EC0: .4byte gUnknown_08A268D8
_080A8EC4: .4byte gUnknown_08A26380
_080A8EC8: .4byte 0x06004C00
_080A8ECC: .4byte gUnknown_08A268F8
_080A8ED0: .4byte gGenericBuffer
_080A8ED4: .4byte gBG2TilemapBuffer
_080A8ED8: .4byte 0x00007260
_080A8EDC: .4byte Img_SaveScreenSprits
_080A8EE0: .4byte 0x06010800
_080A8EE4: .4byte Pal_SaveScreenSprits
_080A8EE8: .4byte gUnknown_08A295B4
_080A8EEC: .4byte gUnknown_02022AE8
_080A8EF0: .4byte gUnknown_08A2C23C
_080A8EF4: .4byte gUnknown_020007A0
_080A8EF8: .4byte gLCDControlBuffer
_080A8EFC: .4byte gSinLookup
_080A8F00: .4byte gPaletteBuffer

	THUMB_FUNC_END ProcSaveMenu_InitScreen

	THUMB_FUNC_START sub_80A8F04
sub_80A8F04: @ 0x080A8F04
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, _080A8F34  @ Img_GameMainMenuObjs
	ldr r1, _080A8F38  @ 0x06014000
	bl CopyDataWithPossibleUncomp
	adds r0, r5, #0
	bl sub_80AB89C
	adds r6, r5, #0
	adds r6, #0x42
	ldrh r0, [r6]
	cmp r0, #0x20
	bne _080A8F3C
	movs r0, #0x20
	adds r1, r5, #0
	bl sub_80ABF44
	adds r1, r5, #0
	adds r1, #0x2b
	strb r0, [r1]
	adds r4, r5, #0
	adds r4, #0x2e
	b _080A8F6A
	.align 2, 0
_080A8F34: .4byte Img_GameMainMenuObjs
_080A8F38: .4byte 0x06014000
_080A8F3C:
	adds r4, r5, #0
	adds r4, #0x2e
	movs r1, #0
	movs r0, #2
	strb r0, [r4]
	adds r0, r5, #0
	adds r0, #0x2c
	strb r1, [r0]
	adds r2, r5, #0
	adds r2, #0x2b
	strb r1, [r2]
	adds r0, #8
	strb r1, [r0]
	adds r0, #0x12
	strh r1, [r0]
	subs r0, #0x16
	ldrb r0, [r0]
	ldrb r1, [r2]
	bl sub_80A8844
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	strh r0, [r6]
_080A8F6A:
	ldrb r0, [r4]
	cmp r0, #2
	bne _080A8F78
	adds r1, r5, #0
	adds r1, #0x2f
	movs r0, #0
	strb r0, [r1]
_080A8F78:
	ldrb r0, [r4]
	cmp r0, #5
	bne _080A8F86
	adds r1, r5, #0
	adds r1, #0x2f
	movs r0, #0xdc
	strb r0, [r1]
_080A8F86:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80A8F04

	THUMB_FUNC_START sub_80A8F8C
sub_80A8F8C: @ 0x080A8F8C
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r1, r5, #0
	adds r1, #0x2e
	movs r4, #0
	movs r0, #5
	strb r0, [r1]
	bl GetLastUsedGameSaveSlot
	adds r1, r5, #0
	adds r1, #0x2c
	strb r0, [r1]
	adds r0, r5, #0
	adds r0, #0x2b
	strb r4, [r0]
	adds r0, #9
	strb r4, [r0]
	adds r0, #0x12
	movs r2, #0
	strh r4, [r0]
	subs r0, #0x16
	movs r1, #0x40
	strb r1, [r0]
	adds r0, #0x12
	strh r1, [r0]
	subs r0, #0x11
	strb r2, [r0]
	adds r1, r5, #0
	adds r1, #0x2f
	movs r0, #0xdc
	strb r0, [r1]
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80A8F8C

	THUMB_FUNC_START sub_80A8FD0
sub_80A8FD0: @ 0x080A8FD0
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r1, r5, #0
	adds r1, #0x2e
	movs r4, #0
	movs r0, #5
	strb r0, [r1]
	bl GetLastUsedGameSaveSlot
	adds r1, r5, #0
	adds r1, #0x2c
	strb r0, [r1]
	adds r0, r5, #0
	adds r0, #0x2b
	strb r4, [r0]
	adds r0, #9
	strb r4, [r0]
	adds r0, #0x12
	movs r2, #0
	strh r4, [r0]
	subs r0, #0x16
	movs r1, #0x80
	strb r1, [r0]
	adds r0, #0x12
	strh r1, [r0]
	subs r0, #0x11
	strb r2, [r0]
	adds r1, r5, #0
	adds r1, #0x2f
	movs r0, #0xdc
	strb r0, [r1]
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80A8FD0

	THUMB_FUNC_START sub_80A9014
sub_80A9014: @ 0x080A9014
	push {lr}
	adds r1, r0, #0
	adds r1, #0x2e
	ldrb r1, [r1]
	bl Proc_Goto
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80A9014

	THUMB_FUNC_START Loop6C_savemenu
Loop6C_savemenu: @ 0x080A9024
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r1, r5, #0
	adds r1, #0x2e
	movs r0, #2
	strb r0, [r1]
	ldr r0, _080A9054  @ gKeyStatusPtr
	ldr r3, [r0]
	ldrh r1, [r3, #6]
	movs r6, #0x40
	adds r0, r6, #0
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0
	beq _080A906C
	adds r2, r5, #0
	adds r2, #0x2b
	ldrb r0, [r2]
	cmp r0, #0
	beq _080A9058
	subs r0, #1
	b _080A908A
	.align 2, 0
_080A9054: .4byte gKeyStatusPtr
_080A9058:
	ldrh r1, [r3, #8]
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	beq _080A90C2
	adds r0, r5, #0
	adds r0, #0x31
	ldrb r0, [r0]
	subs r0, #1
	b _080A908A
_080A906C:
	movs r6, #0x80
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	beq _080A90C2
	adds r2, r5, #0
	adds r2, #0x2b
	ldrb r1, [r2]
	adds r0, r5, #0
	adds r0, #0x31
	ldrb r0, [r0]
	subs r0, #1
	cmp r1, r0
	bge _080A90A4
	adds r0, r1, #1
_080A908A:
	strb r0, [r2]
	ldr r0, _080A90A0  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A90C2
	movs r0, #0x66
	bl m4aSongNumStart
	b _080A90C2
	.align 2, 0
_080A90A0: .4byte gRAMChapterData
_080A90A4:
	ldrh r1, [r3, #8]
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	beq _080A90C2
	strb r4, [r2]
	ldr r0, _080A911C  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A90C2
	movs r0, #0x66
	bl m4aSongNumStart
_080A90C2:
	ldr r0, _080A9120  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _080A90D2
	b _080A921A
_080A90D2:
	adds r0, r5, #0
	adds r0, #0x30
	ldrb r0, [r0]
	adds r1, r5, #0
	adds r1, #0x2b
	ldrb r1, [r1]
	bl sub_80A8844
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r4, r5, #0
	adds r4, #0x42
	strh r0, [r4]
	ldr r0, _080A911C  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A90FE
	movs r0, #0x6a
	bl m4aSongNumStart
_080A90FE:
	adds r1, r5, #0
	adds r1, #0x29
	movs r0, #0
	strb r0, [r1]
	ldrh r0, [r4]
	subs r0, #1
	cmp r0, #0x1f
	bls _080A9110
	b _080A9246
_080A9110:
	lsls r0, r0, #2
	ldr r1, _080A9124  @ _080A9128
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080A911C: .4byte gRAMChapterData
_080A9120: .4byte gKeyStatusPtr
_080A9124: .4byte _080A9128
_080A9128: @ jump table
	.4byte _080A91A8 @ case 0
	.4byte _080A91B4 @ case 1
	.4byte _080A9246 @ case 2
	.4byte _080A91B4 @ case 3
	.4byte _080A9246 @ case 4
	.4byte _080A9246 @ case 5
	.4byte _080A9246 @ case 6
	.4byte _080A91B4 @ case 7
	.4byte _080A9246 @ case 8
	.4byte _080A9246 @ case 9
	.4byte _080A9246 @ case 10
	.4byte _080A9246 @ case 11
	.4byte _080A9246 @ case 12
	.4byte _080A9246 @ case 13
	.4byte _080A9246 @ case 14
	.4byte _080A91D4 @ case 15
	.4byte _080A9246 @ case 16
	.4byte _080A9246 @ case 17
	.4byte _080A9246 @ case 18
	.4byte _080A9246 @ case 19
	.4byte _080A9246 @ case 20
	.4byte _080A9246 @ case 21
	.4byte _080A9246 @ case 22
	.4byte _080A9246 @ case 23
	.4byte _080A9246 @ case 24
	.4byte _080A9246 @ case 25
	.4byte _080A9246 @ case 26
	.4byte _080A9246 @ case 27
	.4byte _080A9246 @ case 28
	.4byte _080A9246 @ case 29
	.4byte _080A9246 @ case 30
	.4byte _080A91FC @ case 31
_080A91A8:
	adds r0, r5, #0
	adds r0, #0x3f
	ldrb r1, [r0]
	subs r0, #0x13
	strb r1, [r0]
	b _080A91CA
_080A91B4:
	bl GetLastUsedGameSaveSlot
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #1
	movs r2, #1
	bl sub_80AB98C
	adds r1, r5, #0
	adds r1, #0x2c
	strb r0, [r1]
_080A91CA:
	adds r0, r5, #0
	movs r1, #3
	bl Proc_Goto
	b _080A9246
_080A91D4:
	adds r4, r5, #0
	adds r4, #0x2c
	ldrb r0, [r4]
	movs r1, #0
	movs r2, #1
	bl sub_80AB98C
	strb r0, [r4]
	adds r0, r5, #0
	movs r1, #1
	bl Proc_Goto
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #0xc0
	movs r2, #0x10
	movs r3, #0
	bl ISuspectThisToBeMusicRelated_8002730
	b _080A9246
_080A91FC:
	adds r2, r5, #0
	adds r2, #0x34
	adds r1, r5, #0
	adds r1, #0x33
	ldrb r0, [r2]
	ldrb r1, [r1]
	cmp r0, r1
	bcc _080A9210
	movs r0, #0
	strb r0, [r2]
_080A9210:
	adds r0, r5, #0
	movs r1, #8
	bl Proc_Goto
	b _080A9246
_080A921A:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080A9246
	ldr r0, _080A924C  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A9234
	movs r0, #0x6b
	bl m4aSongNumStart
_080A9234:
	adds r0, r5, #0
	movs r1, #0x12
	bl Proc_Goto
	adds r1, r5, #0
	adds r1, #0x42
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r1]
_080A9246:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A924C: .4byte gRAMChapterData

	THUMB_FUNC_END Loop6C_savemenu

	THUMB_FUNC_START sub_80A9250
sub_80A9250: @ 0x080A9250
	push {lr}
	adds r2, r0, #0
	adds r2, #0x2a
	ldrb r2, [r2]
	cmp r2, #1
	beq _080A9272
	cmp r2, #1
	bgt _080A9266
	cmp r2, #0
	beq _080A926C
	b _080A927C
_080A9266:
	cmp r2, #2
	beq _080A9278
	b _080A927C
_080A926C:
	movs r3, #0
	movs r1, #0
	b _080A927C
_080A9272:
	movs r3, #1
	movs r1, #0
	b _080A927C
_080A9278:
	movs r3, #1
	movs r1, #1
_080A927C:
	adds r0, #0x2c
	ldrb r0, [r0]
	lsls r3, r3, #0x18
	asrs r3, r3, #0x18
	movs r2, #1
	bl SaveNewGame
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80A9250

	THUMB_FUNC_START sub_80A9290
sub_80A9290: @ 0x080A9290
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r4, #0
	adds r5, #0x36
	ldrb r1, [r5]
	cmp r1, #0
	bne _080A933C
	ldr r0, _080A92C8  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A92B0
	movs r0, #0x6a
	bl m4aSongNumStart
_080A92B0:
	adds r0, r4, #0
	adds r0, #0x42
	ldrh r0, [r0]
	cmp r0, #8
	beq _080A9312
	cmp r0, #8
	bgt _080A92CC
	cmp r0, #2
	beq _080A9324
	cmp r0, #4
	beq _080A92E0
	b _080A9334
	.align 2, 0
_080A92C8: .4byte gRAMChapterData
_080A92CC:
	cmp r0, #0x20
	beq _080A9324
	cmp r0, #0x20
	bgt _080A92DA
	cmp r0, #0x10
	beq _080A9324
	b _080A9334
_080A92DA:
	cmp r0, #0x40
	beq _080A9316
	b _080A9334
_080A92E0:
	adds r1, r4, #0
	adds r1, #0x2d
	ldrb r0, [r1]
	cmp r0, #0xff
	bne _080A92FC
	adds r0, r4, #0
	adds r0, #0x2c
	ldrb r0, [r0]
	strb r0, [r1]
	adds r0, r4, #0
	movs r1, #1
	bl sub_80AB9FC
	b _080A9488
_080A92FC:
	ldrb r0, [r1]
	adds r1, r4, #0
	adds r1, #0x2c
	ldrb r1, [r1]
	bl CopyGameSave
	adds r0, r4, #0
	movs r1, #6
	bl Proc_Goto
	b _080A9488
_080A9312:
	movs r0, #2
	b _080A9318
_080A9316:
	movs r0, #1
_080A9318:
	strb r0, [r5]
	adds r0, r4, #0
	movs r1, #1
	bl sub_80AB83C
	b _080A9334
_080A9324:
	adds r1, r4, #0
	adds r1, #0x36
	movs r0, #2
	strb r0, [r1]
	adds r0, r4, #0
	movs r1, #1
	bl sub_80AB83C
_080A9334:
	adds r0, r4, #0
	bl sub_80A88E0
	b _080A9488
_080A933C:
	adds r5, r4, #0
	adds r5, #0x42
	ldrh r0, [r5]
	cmp r0, #0x10
	beq _080A93D0
	cmp r0, #0x10
	bgt _080A9354
	cmp r0, #2
	beq _080A93A4
	cmp r0, #8
	beq _080A93DC
	b _080A947A
_080A9354:
	cmp r0, #0x20
	beq _080A935E
	cmp r0, #0x40
	beq _080A9424
	b _080A947A
_080A935E:
	cmp r1, #1
	bne _080A940C
	adds r1, r4, #0
	adds r1, #0x44
	movs r0, #0xf0
	strh r0, [r1]
	adds r0, r4, #0
	adds r0, #0x2c
	ldrb r0, [r0]
	bl LoadGame
	ldr r0, _080A93A0  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A9386
	movs r0, #0x6a
	bl m4aSongNumStart
_080A9386:
	adds r0, r4, #0
	adds r0, #0x35
	ldrb r0, [r0]
	cmp r0, #0x10
	beq _080A93C2
	cmp r0, #0x20
	bne _080A947A
	adds r0, r4, #0
	movs r1, #0xe
	bl Proc_Goto
	b _080A947A
	.align 2, 0
_080A93A0: .4byte gRAMChapterData
_080A93A4:
	cmp r1, #1
	bne _080A940C
	adds r1, r4, #0
	adds r1, #0x44
	movs r0, #0xf0
	strh r0, [r1]
	ldr r0, _080A93CC  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A93C2
	movs r0, #0x6a
	bl m4aSongNumStart
_080A93C2:
	adds r0, r4, #0
	bl sub_80A882C
	b _080A947A
	.align 2, 0
_080A93CC: .4byte gRAMChapterData
_080A93D0:
	cmp r1, #1
	bne _080A940C
	adds r0, r4, #0
	bl sub_80A9250
	b _080A9432
_080A93DC:
	cmp r1, #1
	bne _080A940C
	adds r0, r4, #0
	adds r0, #0x2c
	ldrb r0, [r0]
	bl sub_80A4DC8
	adds r0, r4, #0
	movs r1, #6
	bl Proc_Goto
	ldr r0, _080A9408  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A947A
	movs r0, #0x6a
	bl m4aSongNumStart
	b _080A947A
	.align 2, 0
_080A9408: .4byte gRAMChapterData
_080A940C:
	ldr r0, _080A9420  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A947A
	movs r0, #0x6b
	bl m4aSongNumStart
	b _080A947A
	.align 2, 0
_080A9420: .4byte gRAMChapterData
_080A9424:
	cmp r1, #1
	bne _080A9454
	adds r0, r4, #0
	adds r0, #0x2c
	ldrb r0, [r0]
	bl SaveGame
_080A9432:
	adds r0, r4, #0
	movs r1, #6
	bl Proc_Goto
	ldr r0, _080A9450  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A947A
	movs r0, #0x60
	bl m4aSongNumStart
	b _080A947A
	.align 2, 0
_080A9450: .4byte gRAMChapterData
_080A9454:
	adds r0, r4, #0
	movs r1, #0x11
	bl Proc_Goto
	ldrh r1, [r5]
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r2, #0
	orrs r0, r1
	strh r0, [r5]
	ldr r0, _080A9490  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A947A
	movs r0, #0x6b
	bl m4aSongNumStart
_080A947A:
	adds r0, r4, #0
	movs r1, #0
	bl sub_80AB83C
	adds r0, r4, #0
	bl sub_80A88E0
_080A9488:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A9490: .4byte gRAMChapterData

	THUMB_FUNC_END sub_80A9290

	THUMB_FUNC_START sub_80A9494
sub_80A9494: @ 0x080A9494
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r1, r5, #0
	adds r1, #0x2e
	movs r0, #5
	strb r0, [r1]
	adds r0, r5, #0
	bl sub_80A89E4
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A94AE
	b _080A96C8
_080A94AE:
	adds r0, r5, #0
	adds r0, #0x36
	ldrb r1, [r0]
	adds r4, r0, #0
	cmp r1, #0
	bne _080A9504
	ldr r0, _080A94D0  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _080A94D4
	movs r1, #1
	negs r1, r1
	adds r0, r5, #0
	b _080A94E0
	.align 2, 0
_080A94D0: .4byte gKeyStatusPtr
_080A94D4:
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _080A9564
	adds r0, r5, #0
	movs r1, #1
_080A94E0:
	bl sub_80AB9FC
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A9564
	ldr r0, _080A9500  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A9564
	movs r0, #0x66
	bl m4aSongNumStart
	b _080A9564
	.align 2, 0
_080A9500: .4byte gRAMChapterData
_080A9504:
	ldr r0, _080A9534  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r2, [r0, #8]
	movs r0, #0x20
	ands r0, r2
	cmp r0, #0
	beq _080A953C
	cmp r1, #1
	beq _080A9564
	movs r0, #1
	strb r0, [r4]
	ldr r0, _080A9538  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A952C
	movs r0, #0x67
	bl m4aSongNumStart
_080A952C:
	adds r0, r5, #0
	bl sub_80A88E0
	b _080A9564
	.align 2, 0
_080A9534: .4byte gKeyStatusPtr
_080A9538: .4byte gRAMChapterData
_080A953C:
	movs r0, #0x10
	ands r0, r2
	cmp r0, #0
	beq _080A9564
	cmp r1, #2
	beq _080A9564
	movs r0, #2
	strb r0, [r4]
	ldr r0, _080A9598  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A955E
	movs r0, #0x67
	bl m4aSongNumStart
_080A955E:
	adds r0, r5, #0
	bl sub_80A88E0
_080A9564:
	ldr r0, _080A959C  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r2, [r0, #8]
	movs r1, #1
	ands r1, r2
	cmp r1, #0
	beq _080A9648
	adds r1, r5, #0
	adds r1, #0x29
	movs r0, #0
	strb r0, [r1]
	adds r0, r5, #0
	adds r0, #0x42
	ldrh r0, [r0]
	cmp r0, #8
	beq _080A9614
	cmp r0, #8
	bgt _080A95A6
	cmp r0, #2
	beq _080A95BA
	cmp r0, #2
	bgt _080A95A0
	cmp r0, #1
	beq _080A95D8
	b _080A96C8
	.align 2, 0
_080A9598: .4byte gRAMChapterData
_080A959C: .4byte gKeyStatusPtr
_080A95A0:
	cmp r0, #4
	beq _080A9614
	b _080A96C8
_080A95A6:
	cmp r0, #0x40
	beq _080A9614
	cmp r0, #0x40
	bgt _080A95B4
	cmp r0, #0x10
	beq _080A95F8
	b _080A96C8
_080A95B4:
	cmp r0, #0x80
	beq _080A95C6
	b _080A96C8
_080A95BA:
	adds r0, r5, #0
	adds r0, #0x3f
	ldrb r0, [r0]
	cmp r0, #0xff
	bne _080A9614
	b _080A95D8
_080A95C6:
	adds r0, r5, #0
	adds r0, #0x3f
	ldrb r0, [r0]
	cmp r0, #0xff
	beq _080A95D8
	adds r1, r5, #0
	adds r1, #0x44
	movs r0, #0xf0
	strh r0, [r1]
_080A95D8:
	ldr r0, _080A95F4  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A95EA
	movs r0, #0x6a
	bl m4aSongNumStart
_080A95EA:
	adds r0, r5, #0
	bl sub_80A882C
	b _080A96C8
	.align 2, 0
_080A95F4: .4byte gRAMChapterData
_080A95F8:
	adds r0, r5, #0
	adds r0, #0x3f
	ldrb r0, [r0]
	cmp r0, #0xff
	beq _080A9620
	ldr r0, _080A961C  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A9614
	movs r0, #0x6a
	bl m4aSongNumStart
_080A9614:
	adds r0, r5, #0
	bl sub_80A9290
	b _080A96C8
	.align 2, 0
_080A961C: .4byte gRAMChapterData
_080A9620:
	adds r0, r5, #0
	bl sub_80A9250
	adds r0, r5, #0
	movs r1, #6
	bl Proc_Goto
	ldr r0, _080A9644  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A96C8
	movs r0, #0x60
	bl m4aSongNumStart
	b _080A96C8
	.align 2, 0
_080A9644: .4byte gRAMChapterData
_080A9648:
	movs r0, #2
	ands r0, r2
	cmp r0, #0
	beq _080A96C8
	adds r0, r5, #0
	adds r0, #0x29
	strb r1, [r0]
	ldr r0, _080A9680  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A9668
	movs r0, #0x6b
	bl m4aSongNumStart
_080A9668:
	ldrb r0, [r4]
	cmp r0, #0
	beq _080A9684
	adds r0, r5, #0
	movs r1, #0
	bl sub_80AB83C
	adds r0, r5, #0
	bl sub_80A88E0
	b _080A96C8
	.align 2, 0
_080A9680: .4byte gRAMChapterData
_080A9684:
	adds r2, r5, #0
	adds r2, #0x2d
	ldrb r1, [r2]
	adds r0, r1, #0
	cmp r0, #0xff
	beq _080A969C
	adds r0, r5, #0
	adds r0, #0x2c
	strb r1, [r0]
	movs r0, #0xff
	strb r0, [r2]
	b _080A96C8
_080A969C:
	adds r4, r5, #0
	adds r4, #0x42
	ldrh r1, [r4]
	movs r0, #0xc0
	ands r0, r1
	cmp r0, #0
	beq _080A96C0
	adds r0, r5, #0
	movs r1, #0x11
	bl Proc_Goto
	ldrh r1, [r4]
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r2, #0
	orrs r0, r1
	strh r0, [r4]
	b _080A96C8
_080A96C0:
	adds r0, r5, #0
	movs r1, #4
	bl Proc_Goto
_080A96C8:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80A9494

	THUMB_FUNC_START sub_80A96D0
sub_80A96D0: @ 0x080A96D0
	push {lr}
	bl sub_80A9290
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80A96D0

	THUMB_FUNC_START sub_80A96DC
sub_80A96DC: @ 0x080A96DC
	adds r3, r0, #0
	adds r3, #0x2e
	movs r2, #0
	movs r1, #6
	strb r1, [r3]
	adds r0, #0x29
	strb r2, [r0]
	bx lr

	THUMB_FUNC_END sub_80A96DC

	THUMB_FUNC_START sub_80A96EC
sub_80A96EC: @ 0x080A96EC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r7, r0, #0
	adds r3, r7, #0
	adds r3, #0x29
	ldrb r0, [r3]
	cmp r0, #8
	bne _080A9764
	adds r4, r7, #0
	adds r4, #0x2c
	ldrb r0, [r4]
	adds r1, r7, #0
	bl sub_80ABC14
	movs r0, #4
	adds r1, r7, #0
	bl sub_80ABC14
	ldrb r1, [r4]
	adds r0, r7, #0
	adds r0, #0x37
	adds r2, r0, r1
	ldrb r0, [r2]
	cmp r0, #0xff
	beq _080A9740
	lsls r0, r1, #0xb
	movs r1, #0xb4
	lsls r1, r1, #9
	adds r0, r0, r1
	ldr r1, _080A973C  @ 0x0001FFFF
	ands r0, r1
	lsrs r0, r0, #5
	ldrb r1, [r2]
	bl sub_8089624
	b _080A9756
	.align 2, 0
_080A973C: .4byte 0x0001FFFF
_080A9740:
	lsls r0, r1, #0xb
	movs r2, #0xb4
	lsls r2, r2, #9
	adds r0, r0, r2
	ldr r1, _080A9760  @ 0x0001FFFF
	ands r0, r1
	lsrs r0, r0, #5
	movs r1, #1
	negs r1, r1
	bl sub_8089624
_080A9756:
	ldrb r0, [r4]
	bl sub_80ABD88
	b _080A9828
	.align 2, 0
_080A9760: .4byte 0x0001FFFF
_080A9764:
	cmp r0, #0x20
	bne _080A97DA
	adds r0, r7, #0
	bl sub_80AB89C
	adds r0, r7, #0
	adds r0, #0x42
	ldrh r0, [r0]
	cmp r0, #0x10
	bne _080A978E
	adds r0, r7, #0
	movs r1, #0x12
	bl Proc_Goto
	movs r0, #0xc0
	movs r1, #0
	movs r2, #0x10
	movs r3, #0
	bl ISuspectThisToBeMusicRelated_8002730
	b _080A9828
_080A978E:
	cmp r0, #0x40
	bne _080A979C
	adds r0, r7, #0
	movs r1, #0x11
	bl Proc_Goto
	b _080A9828
_080A979C:
	adds r0, r7, #0
	bl sub_80ABA98
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A9828
	adds r2, r7, #0
	adds r2, #0x2d
	ldrb r1, [r2]
	adds r0, r1, #0
	cmp r0, #0xff
	beq _080A97C0
	adds r0, r7, #0
	adds r0, #0x2c
	strb r1, [r0]
	movs r0, #0xff
	strb r0, [r2]
	b _080A97D0
_080A97C0:
	adds r4, r7, #0
	adds r4, #0x2c
	ldrb r0, [r4]
	movs r1, #1
	movs r2, #1
	bl sub_80AB98C
	strb r0, [r4]
_080A97D0:
	adds r0, r7, #0
	movs r1, #5
	bl Proc_Goto
	b _080A9828
_080A97DA:
	cmp r0, #0x30
	bne _080A9828
	adds r0, r7, #0
	adds r0, #0x2c
	movs r1, #0
	strb r1, [r0]
	adds r2, r7, #0
	adds r2, #0x2d
	movs r0, #0xff
	strb r0, [r2]
	strb r1, [r3]
	adds r0, r7, #0
	adds r0, #0x2b
	strb r1, [r0]
	adds r0, #5
	ldrb r0, [r0]
	bl sub_80A8844
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r1, r7, #0
	adds r1, #0x42
	strh r0, [r1]
	ldr r0, _080A9824  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A981A
	movs r0, #0x6b
	bl m4aSongNumStart
_080A981A:
	adds r0, r7, #0
	movs r1, #4
	bl Proc_Goto
	b _080A99AC
	.align 2, 0
_080A9824: .4byte gRAMChapterData
_080A9828:
	adds r0, r7, #0
	adds r0, #0x29
	ldrb r1, [r0]
	mov sl, r0
	cmp r1, #0x10
	bne _080A98A0
	ldr r4, _080A989C  @ gSinLookup
	movs r0, #0x80
	adds r0, r0, r4
	mov r9, r0
	movs r1, #0
	ldrsh r0, [r0, r1]
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
	mov r1, r8
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
	mov r1, r8
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	adds r1, r7, #0
	adds r1, #0x2c
	ldrb r1, [r1]
	str r0, [sp]
	adds r0, r1, #0
	adds r1, r6, #0
	b _080A9918
	.align 2, 0
_080A989C: .4byte gSinLookup
_080A98A0:
	cmp r1, #7
	bhi _080A9928
	ldr r4, _080A9924  @ gSinLookup
	movs r0, #0x80
	adds r0, r0, r4
	mov r9, r0
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r0, r0, #4
	movs r6, #0x80
	lsls r6, r6, #1
	adds r1, r6, #0
	bl Div
	mov r8, r0
	mov r2, r8
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	mov r8, r2
	movs r1, #0
	ldrsh r0, [r4, r1]
	negs r0, r0
	lsls r0, r0, #4
	mov r2, sl
	ldrb r1, [r2]
	lsls r1, r1, #5
	subs r1, r6, r1
	bl Div
	adds r5, r0, #0
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	movs r1, #0
	ldrsh r0, [r4, r1]
	lsls r0, r0, #4
	adds r1, r6, #0
	bl Div
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	mov r2, r9
	movs r1, #0
	ldrsh r0, [r2, r1]
	lsls r0, r0, #4
	mov r2, sl
	ldrb r1, [r2]
	lsls r1, r1, #5
	subs r6, r6, r1
	adds r1, r6, #0
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	adds r1, r7, #0
	adds r1, #0x2c
	ldrb r1, [r1]
	str r0, [sp]
	adds r0, r1, #0
	mov r1, r8
_080A9918:
	adds r2, r5, #0
	adds r3, r4, #0
	bl WriteOAMRotScaleData
	b _080A99A4
	.align 2, 0
_080A9924: .4byte gSinLookup
_080A9928:
	cmp r1, #0xf
	bhi _080A99A4
	ldr r4, _080A99BC  @ gSinLookup
	movs r0, #0x80
	adds r0, r0, r4
	mov r9, r0
	movs r1, #0
	ldrsh r0, [r0, r1]
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
	mov r2, sl
	ldrb r1, [r2]
	lsls r1, r1, #5
	subs r1, #0xe0
	bl Div
	adds r5, r0, #0
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	movs r1, #0
	ldrsh r0, [r4, r1]
	lsls r0, r0, #4
	mov r1, r8
	bl Div
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	mov r2, r9
	movs r1, #0
	ldrsh r0, [r2, r1]
	lsls r0, r0, #4
	mov r2, sl
	ldrb r1, [r2]
	lsls r1, r1, #5
	subs r1, #0xe0
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	adds r1, r7, #0
	adds r1, #0x2c
	ldrb r1, [r1]
	str r0, [sp]
	adds r0, r1, #0
	adds r1, r6, #0
	adds r2, r5, #0
	adds r3, r4, #0
	bl WriteOAMRotScaleData
_080A99A4:
	mov r1, sl
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
_080A99AC:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A99BC: .4byte gSinLookup

	THUMB_FUNC_END sub_80A96EC

	THUMB_FUNC_START sub_80A99C0
sub_80A99C0: @ 0x080A99C0
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r1, r5, #0
	adds r1, #0x2e
	movs r0, #3
	strb r0, [r1]
	adds r4, r5, #0
	adds r4, #0x29
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	ldrb r1, [r4]
	movs r0, #0xe
	subs r0, r0, r1
	movs r1, #0xdc
	muls r1, r0, r1
	muls r0, r1, r0
	movs r1, #0xc4
	bl __divsi3
	movs r2, #0x24
	negs r2, r2
	adds r1, r2, #0
	subs r1, r1, r0
	adds r0, r5, #0
	adds r0, #0x2f
	strb r1, [r0]
	ldrb r0, [r4]
	cmp r0, #0xe
	bne _080A9A02
	adds r0, r5, #0
	bl Proc_Break
_080A9A02:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80A99C0

	THUMB_FUNC_START sub_80A9A08
sub_80A9A08: @ 0x080A9A08
	push {lr}
	adds r0, #0x35
	ldrb r0, [r0]
	bl sub_80ABF74
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80A9A08

	THUMB_FUNC_START sub_80A9A18
sub_80A9A18: @ 0x080A9A18
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r1, r5, #0
	adds r1, #0x2e
	movs r0, #4
	strb r0, [r1]
	adds r4, r5, #0
	adds r4, #0x29
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	ldrb r1, [r4]
	movs r0, #0xe
	subs r0, r0, r1
	movs r1, #0xdc
	muls r1, r0, r1
	muls r0, r1, r0
	movs r1, #0xc4
	bl __divsi3
	adds r1, r5, #0
	adds r1, #0x2f
	strb r0, [r1]
	ldrb r0, [r4]
	cmp r0, #0xe
	bne _080A9A5A
	ldr r0, _080A9A60  @ Img_GameMainMenuObjs
	ldr r1, _080A9A64  @ 0x06014000
	bl CopyDataWithPossibleUncomp
	adds r0, r5, #0
	bl Proc_Break
_080A9A5A:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A9A60: .4byte Img_GameMainMenuObjs
_080A9A64: .4byte 0x06014000

	THUMB_FUNC_END sub_80A9A18

	THUMB_FUNC_START sub_80A9A68
sub_80A9A68: @ 0x080A9A68
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r1, r5, #0
	adds r1, #0x2e
	movs r0, #8
	strb r0, [r1]
	adds r4, r5, #0
	adds r4, #0x29
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	ldrb r1, [r4]
	movs r0, #0xe
	subs r0, r0, r1
	movs r1, #0xdc
	muls r1, r0, r1
	muls r0, r1, r0
	movs r1, #0xc4
	bl __divsi3
	movs r1, #0xdc
	subs r1, r1, r0
	adds r0, r5, #0
	adds r0, #0x46
	strh r1, [r0]
	ldrb r0, [r4]
	cmp r0, #0xe
	bne _080A9AA8
	adds r0, r5, #0
	movs r1, #0xa
	bl Proc_Goto
_080A9AA8:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80A9A68

	THUMB_FUNC_START sub_80A9AB0
sub_80A9AB0: @ 0x080A9AB0
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r1, r5, #0
	adds r1, #0x2e
	movs r0, #8
	strb r0, [r1]
	adds r4, r5, #0
	adds r4, #0x29
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	ldrb r1, [r4]
	movs r0, #0xe
	subs r0, r0, r1
	movs r1, #0xdc
	muls r1, r0, r1
	muls r0, r1, r0
	movs r1, #0xc4
	bl __divsi3
	adds r1, r5, #0
	adds r1, #0x46
	strh r0, [r1]
	ldrb r0, [r4]
	cmp r0, #0xe
	bne _080A9AEC
	adds r0, r5, #0
	movs r1, #2
	bl Proc_Goto
_080A9AEC:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80A9AB0

	THUMB_FUNC_START sub_80A9AF4
sub_80A9AF4: @ 0x080A9AF4
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r1, r5, #0
	adds r1, #0x2e
	movs r0, #0xc
	strb r0, [r1]
	adds r4, r5, #0
	adds r4, #0x29
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	ldrb r1, [r4]
	movs r0, #0xe
	subs r0, r0, r1
	movs r1, #0xdc
	muls r1, r0, r1
	muls r0, r1, r0
	movs r1, #0xc4
	bl __divsi3
	movs r2, #0xdc
	lsls r2, r2, #1
	adds r1, r2, #0
	subs r1, r1, r0
	adds r0, r5, #0
	adds r0, #0x46
	strh r1, [r0]
	adds r1, #0x24
	subs r0, #0x17
	strb r1, [r0]
	ldrb r0, [r4]
	cmp r0, #0xe
	bne _080A9B3E
	adds r0, r5, #0
	movs r1, #0xb
	bl Proc_Goto
_080A9B3E:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80A9AF4

	THUMB_FUNC_START sub_80A9B44
sub_80A9B44: @ 0x080A9B44
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r1, r5, #0
	adds r1, #0x2e
	movs r0, #0xd
	strb r0, [r1]
	adds r4, r5, #0
	adds r4, #0x29
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	ldrb r1, [r4]
	movs r0, #0xe
	subs r0, r0, r1
	movs r1, #0xdc
	muls r1, r0, r1
	muls r0, r1, r0
	movs r1, #0xc4
	bl __divsi3
	adds r0, #0xdc
	adds r1, r5, #0
	adds r1, #0x46
	strh r0, [r1]
	adds r0, #0x24
	subs r1, #0x17
	strb r0, [r1]
	ldrb r0, [r4]
	cmp r0, #0xe
	bne _080A9B88
	adds r0, r5, #0
	movs r1, #0xa
	bl Proc_Goto
_080A9B88:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80A9B44

	THUMB_FUNC_START sub_80A9B90
sub_80A9B90: @ 0x080A9B90
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r2, r4, #0
	adds r2, #0x34
	ldrb r7, [r2]
	adds r1, r4, #0
	adds r1, #0x2e
	movs r0, #0xa
	strb r0, [r1]
	ldr r0, _080A9BD4  @ gKeyStatusPtr
	ldr r3, [r0]
	ldrh r1, [r3, #6]
	movs r6, #0x40
	adds r0, r6, #0
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0
	beq _080A9BD8
	ldrb r0, [r2]
	cmp r0, #0
	bne _080A9BCE
	ldrh r1, [r3, #8]
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	beq _080A9C02
	adds r0, r4, #0
	adds r0, #0x33
	ldrb r0, [r0]
_080A9BCE:
	subs r0, #1
	strb r0, [r2]
	b _080A9C02
	.align 2, 0
_080A9BD4: .4byte gKeyStatusPtr
_080A9BD8:
	movs r6, #0x80
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	beq _080A9C02
	ldrb r1, [r2]
	adds r0, r4, #0
	adds r0, #0x33
	ldrb r0, [r0]
	subs r0, #1
	cmp r1, r0
	bge _080A9BF6
	adds r0, r1, #1
	strb r0, [r2]
	b _080A9C02
_080A9BF6:
	ldrh r1, [r3, #8]
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	beq _080A9C02
	strb r5, [r2]
_080A9C02:
	adds r0, r4, #0
	adds r0, #0x34
	adds r5, r0, #0
	ldrb r0, [r5]
	cmp r7, r0
	beq _080A9C20
	ldr r0, _080A9C70  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A9C20
	movs r0, #0x66
	bl m4aSongNumStart
_080A9C20:
	ldr r0, _080A9C74  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r2, [r0, #8]
	movs r1, #1
	ands r1, r2
	cmp r1, #0
	beq _080A9CEC
	adds r0, r4, #0
	adds r0, #0x32
	ldrb r0, [r0]
	ldrb r1, [r5]
	bl sub_80A8844
	adds r5, r4, #0
	adds r5, #0x35
	movs r6, #0
	strb r0, [r5]
	ldr r0, _080A9C70  @ gRAMChapterData
	adds r7, r0, #0
	adds r7, #0x41
	ldrb r0, [r7]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A9C56
	movs r0, #0x6a
	bl m4aSongNumStart
_080A9C56:
	adds r0, r4, #0
	adds r0, #0x29
	strb r6, [r0]
	ldrb r0, [r5]
	cmp r0, #0x10
	beq _080A9CA6
	cmp r0, #0x10
	bgt _080A9C78
	cmp r0, #2
	beq _080A9C82
	cmp r0, #4
	beq _080A9C8C
	b _080A9CDC
	.align 2, 0
_080A9C70: .4byte gRAMChapterData
_080A9C74: .4byte gKeyStatusPtr
_080A9C78:
	cmp r0, #0x20
	beq _080A9CA6
	cmp r0, #0x40
	bne _080A9CDC
	b _080A9CA6
_080A9C82:
	str r6, [sp]
	movs r0, #0
	movs r1, #0xc0
	movs r2, #0
	b _080A9C96
_080A9C8C:
	movs r2, #0x80
	lsls r2, r2, #1
	str r6, [sp]
	movs r0, #9
	movs r1, #0xc0
_080A9C96:
	movs r3, #0x18
	bl sub_80029E8
	adds r0, r4, #0
	movs r1, #0xe
	bl Proc_Goto
	b _080A9D14
_080A9CA6:
	bl GetLastUsedGameSaveSlot
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #1
	movs r2, #1
	bl sub_80AB98C
	adds r1, r4, #0
	adds r1, #0x2c
	strb r0, [r1]
	adds r0, r4, #0
	movs r1, #0
	bl sub_80A9D20
	ldrb r0, [r7]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A9CD2
	movs r0, #0x6a
	bl m4aSongNumStart
_080A9CD2:
	adds r0, r4, #0
	movs r1, #0xc
	bl Proc_Goto
	b _080A9D14
_080A9CDC:
	adds r0, r4, #0
	bl sub_80A882C
	adds r0, r4, #0
	movs r1, #0x12
	bl Proc_Goto
	b _080A9D14
_080A9CEC:
	movs r0, #2
	ands r0, r2
	cmp r0, #0
	beq _080A9D14
	adds r0, r4, #0
	adds r0, #0x29
	strb r1, [r0]
	adds r0, r4, #0
	movs r1, #9
	bl Proc_Goto
	ldr r0, _080A9D1C  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A9D14
	movs r0, #0x6b
	bl m4aSongNumStart
_080A9D14:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A9D1C: .4byte gRAMChapterData

	THUMB_FUNC_END sub_80A9B90

	THUMB_FUNC_START sub_80A9D20
sub_80A9D20: @ 0x080A9D20
	push {r4, lr}
	adds r3, r0, #0
	adds r2, r3, #0
	adds r2, #0x2c
	ldrb r4, [r2]
	cmp r4, #2
	bls _080A9D32
	movs r0, #0
	strb r0, [r2]
_080A9D32:
	cmp r1, #0
	bne _080A9D3A
_080A9D36:
	movs r0, #1
	b _080A9D7E
_080A9D3A:
	cmp r1, #0
	ble _080A9D4C
	ldrb r0, [r2]
	cmp r0, #1
	bhi _080A9D48
	adds r0, #1
	b _080A9D58
_080A9D48:
	movs r0, #0
	b _080A9D58
_080A9D4C:
	ldrb r0, [r2]
	cmp r0, #0
	bne _080A9D56
	movs r0, #2
	b _080A9D58
_080A9D56:
	subs r0, #1
_080A9D58:
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x2c
	ldrb r0, [r0]
	cmp r4, r0
	beq _080A9D7C
	ldr r0, _080A9D78  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A9D36
	movs r0, #0x66
	bl m4aSongNumStart
	b _080A9D36
	.align 2, 0
_080A9D78: .4byte gRAMChapterData
_080A9D7C:
	movs r0, #0
_080A9D7E:
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80A9D20

	THUMB_FUNC_START sub_80A9D84
sub_80A9D84: @ 0x080A9D84
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080A9DB4  @ 0x06014000
	movs r1, #9
	bl LoadDialogueBoxGfx
	ldr r0, [r4, #0x2c]
	ldr r1, [r4, #0x30]
	ldr r2, [r4, #0x58]
	bl StartHelpBoxExt_Unk
	ldr r0, _080A9DB8  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A9DAC
	movs r0, #0x70
	bl m4aSongNumStart
_080A9DAC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A9DB4: .4byte 0x06014000
_080A9DB8: .4byte gRAMChapterData

	THUMB_FUNC_END sub_80A9D84

	THUMB_FUNC_START sub_80A9DBC
sub_80A9DBC: @ 0x080A9DBC
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080A9DF0  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	ldr r0, _080A9DF4  @ 0x00000103
	ands r0, r1
	cmp r0, #0
	beq _080A9DEA
	ldr r0, _080A9DF8  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A9DE0
	movs r0, #0x71
	bl m4aSongNumStart
_080A9DE0:
	bl CloseHelpBox
	adds r0, r4, #0
	bl Proc_Break
_080A9DEA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A9DF0: .4byte gKeyStatusPtr
_080A9DF4: .4byte 0x00000103
_080A9DF8: .4byte gRAMChapterData

	THUMB_FUNC_END sub_80A9DBC

	THUMB_FUNC_START sub_80A9DFC
sub_80A9DFC: @ 0x080A9DFC
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	adds r4, r2, #0
	adds r1, r3, #0
	ldr r0, _080A9E18  @ gUnknown_08A20068
	bl Proc_StartBlocking
	str r4, [r0, #0x58]
	str r5, [r0, #0x2c]
	str r6, [r0, #0x30]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A9E18: .4byte gUnknown_08A20068

	THUMB_FUNC_END sub_80A9DFC

	THUMB_FUNC_START sub_80A9E1C
sub_80A9E1C: @ 0x080A9E1C
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x2e
	movs r0, #5
	strb r0, [r1]
	adds r3, r4, #0
	adds r3, #0x36
	ldrb r1, [r3]
	cmp r1, #0
	bne _080A9E62
	ldr r0, _080A9E4C  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _080A9E50
	movs r1, #1
	negs r1, r1
	adds r0, r4, #0
	bl sub_80A9D20
	b _080A9EB6
	.align 2, 0
_080A9E4C: .4byte gKeyStatusPtr
_080A9E50:
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _080A9EB6
	adds r0, r4, #0
	movs r1, #1
	bl sub_80A9D20
	b _080A9EB6
_080A9E62:
	ldr r0, _080A9E8C  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r2, [r0, #8]
	movs r0, #0x20
	ands r0, r2
	cmp r0, #0
	beq _080A9E94
	cmp r1, #1
	beq _080A9EB6
	movs r0, #1
	strb r0, [r3]
	ldr r0, _080A9E90  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A9EB6
	movs r0, #0x67
	bl m4aSongNumStart
	b _080A9EB6
	.align 2, 0
_080A9E8C: .4byte gKeyStatusPtr
_080A9E90: .4byte gRAMChapterData
_080A9E94:
	movs r0, #0x10
	ands r0, r2
	cmp r0, #0
	beq _080A9EB6
	cmp r1, #2
	beq _080A9EB6
	movs r0, #2
	strb r0, [r3]
	ldr r0, _080A9EDC  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A9EB6
	movs r0, #0x67
	bl m4aSongNumStart
_080A9EB6:
	ldr r0, _080A9EE0  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r3, #1
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	bne _080A9EC8
	b _080A9FBC
_080A9EC8:
	adds r0, r4, #0
	adds r0, #0x35
	ldrb r0, [r0]
	cmp r0, #0x20
	beq _080A9F24
	cmp r0, #0x20
	bgt _080A9EE4
	cmp r0, #0x10
	beq _080A9F5C
	b _080AA00A
	.align 2, 0
_080A9EDC: .4byte gRAMChapterData
_080A9EE0: .4byte gKeyStatusPtr
_080A9EE4:
	cmp r0, #0x40
	beq _080A9EEA
	b _080AA00A
_080A9EEA:
	adds r0, r4, #0
	adds r0, #0x2c
	ldrb r2, [r0]
	adds r0, #0xe
	adds r0, r0, r2
	ldrb r1, [r0]
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	beq _080A9F18
	adds r0, r4, #0
	adds r0, #0x3f
	ldrb r0, [r0]
	cmp r0, #0xff
	bne _080A9FA0
	adds r0, r2, #0
	bl LoadGame
	adds r0, r4, #0
	movs r1, #0xe
	bl Proc_Goto
	b _080A9F86
_080A9F18:
	ldr r2, _080A9F20  @ 0x00000892
	movs r0, #0x40
	movs r1, #0x30
	b _080A9FAE
	.align 2, 0
_080A9F20: .4byte 0x00000892
_080A9F24:
	adds r0, r4, #0
	adds r0, #0x2c
	ldrb r2, [r0]
	adds r0, #0xe
	adds r0, r0, r2
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080A9F52
	adds r0, r4, #0
	adds r0, #0x3f
	ldrb r0, [r0]
	cmp r0, #0xff
	bne _080A9FA0
	adds r0, r2, #0
	bl LoadGame
	adds r0, r4, #0
	movs r1, #0xe
	bl Proc_Goto
	b _080A9F86
_080A9F52:
	ldr r2, _080A9F58  @ 0x00000891
	b _080A9FAA
	.align 2, 0
_080A9F58: .4byte 0x00000891
_080A9F5C:
	adds r0, r4, #0
	adds r0, #0x2c
	ldrb r2, [r0]
	adds r0, #0xe
	adds r0, r0, r2
	ldrb r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _080A9FA8
	adds r0, r4, #0
	adds r0, #0x3f
	ldrb r0, [r0]
	cmp r0, #0xff
	bne _080A9FA0
	adds r0, r2, #0
	bl LoadGame
	adds r0, r4, #0
	bl sub_80A882C
_080A9F86:
	ldr r0, _080A9F9C  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080AA00A
	movs r0, #0x6a
	bl m4aSongNumStart
	b _080AA00A
	.align 2, 0
_080A9F9C: .4byte gRAMChapterData
_080A9FA0:
	adds r0, r4, #0
	bl sub_80A9290
	b _080AA00A
_080A9FA8:
	ldr r2, _080A9FB8  @ 0x00000895
_080A9FAA:
	movs r0, #0x2e
	movs r1, #0x38
_080A9FAE:
	adds r3, r4, #0
	bl sub_80A9DFC
	b _080AA00A
	.align 2, 0
_080A9FB8: .4byte 0x00000895
_080A9FBC:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080AA00A
	ldr r0, _080A9FF0  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A9FD6
	movs r0, #0x6b
	bl m4aSongNumStart
_080A9FD6:
	adds r0, r4, #0
	adds r0, #0x36
	ldrb r5, [r0]
	cmp r5, #0
	beq _080A9FF4
	adds r0, r4, #0
	movs r1, #0
	bl sub_80AB83C
	adds r0, r4, #0
	bl sub_80A88E0
	b _080AA00A
	.align 2, 0
_080A9FF0: .4byte gRAMChapterData
_080A9FF4:
	ldr r0, _080AA010  @ Img_GameMainMenuObjs
	ldr r1, _080AA014  @ 0x06014000
	bl CopyDataWithPossibleUncomp
	adds r0, r4, #0
	adds r0, #0x29
	strb r5, [r0]
	adds r0, r4, #0
	movs r1, #0xd
	bl Proc_Goto
_080AA00A:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080AA010: .4byte Img_GameMainMenuObjs
_080AA014: .4byte 0x06014000

	THUMB_FUNC_END sub_80A9E1C

	THUMB_FUNC_START sub_80AA018
sub_80AA018: @ 0x080AA018
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #1
	movs r2, #2
	bl sub_80ABBB0
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80AA018

	THUMB_FUNC_START sub_80AA030
sub_80AA030: @ 0x080AA030
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x60]
	cmp r0, #0
	beq _080AA03E
	bl APProc_Delete
_080AA03E:
	ldr r0, [r4, #0x58]
	bl Proc_End
	movs r0, #0
	bl SetPrimaryHBlankHandler
	adds r5, r4, #0
	adds r5, #0x42
	ldrh r2, [r5]
	cmp r2, #0x20
	bne _080AA084
	adds r0, r4, #0
	adds r0, #0x35
	ldrb r0, [r0]
	cmp r0, #1
	beq _080AA064
	cmp r0, #0x10
	beq _080AA06C
	b _080AA0FA
_080AA064:
	movs r0, #6
	bl SetNextGameActionId
	b _080AA0FA
_080AA06C:
	movs r0, #0xc
	bl SetNextGameActionId
	ldr r2, _080AA080  @ gRAMChapterData
	ldrb r1, [r2, #0x14]
	movs r0, #4
	orrs r0, r1
	strb r0, [r2, #0x14]
	b _080AA0FA
	.align 2, 0
_080AA080: .4byte gRAMChapterData
_080AA084:
	movs r0, #0x40
	ands r0, r2
	cmp r0, #0
	bne _080AA0FA
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r1, #0
	ands r0, r2
	cmp r0, #0
	beq _080AA0BC
	movs r0, #0xc0
	movs r2, #0x10
	movs r3, #0
	bl ISuspectThisToBeMusicRelated_8002730
	ldrh r1, [r5]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _080AA0B4
	movs r0, #0xa
	bl SetNextGameActionId
	b _080AA0FA
_080AA0B4:
	movs r0, #5
	bl SetNextGameActionId
	b _080AA0FA
_080AA0BC:
	movs r0, #1
	ands r0, r2
	cmp r0, #0
	beq _080AA0D2
	movs r0, #3
	bl LoadSuspendedGame
	movs r0, #4
	bl SetNextGameActionId
	b _080AA0FA
_080AA0D2:
	movs r0, #0x82
	ands r0, r2
	cmp r0, #0
	beq _080AA0EC
	adds r4, #0x2c
	ldrb r0, [r4]
	bl LoadGame
	ldrb r0, [r4]
	adds r0, #1
	bl SetNextGameActionId
	b _080AA0FA
_080AA0EC:
	movs r0, #0x10
	ands r0, r2
	cmp r0, #0
	beq _080AA0FA
	movs r0, #0
	bl SetNextGameActionId
_080AA0FA:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80AA030

	THUMB_FUNC_START sub_80AA100
sub_80AA100: @ 0x080AA100
	push {lr}
	sub sp, #4
	str r0, [sp]
	movs r0, #0
	movs r1, #0xc0
	movs r2, #0
	movs r3, #0x18
	bl sub_80029E8
	add sp, #4
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80AA100

	THUMB_FUNC_START sub_80AA118
sub_80AA118: @ 0x080AA118
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r0, #7
	bl SetNextGameActionId
	ldr r4, _080AA140  @ gRAMChapterData
	ldrb r1, [r4, #0x14]
	movs r0, #0x80
	orrs r0, r1
	strb r0, [r4, #0x14]
	bl sub_80A6C8C
	movs r0, #0x7f
	strb r0, [r4, #0xe]
	ldr r0, [r5, #0x14]
	bl Proc_End
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080AA140: .4byte gRAMChapterData

	THUMB_FUNC_END sub_80AA118

	THUMB_FUNC_START sub_80AA144
sub_80AA144: @ 0x080AA144
	push {lr}
	adds r1, r0, #0
	ldr r0, _080AA154  @ gUnknown_08A20098
	bl Proc_StartBlocking
	pop {r0}
	bx r0
	.align 2, 0
_080AA154: .4byte gUnknown_08A20098

	THUMB_FUNC_END sub_80AA144

	THUMB_FUNC_START sub_80AA158
sub_80AA158: @ 0x080AA158
	push {r4, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x42
	movs r0, #0x20
	strh r0, [r1]
	ldr r0, [r4, #0x58]
	bl Proc_End
	movs r0, #0
	bl SetPrimaryHBlankHandler
	ldr r0, [r4, #0x60]
	cmp r0, #0
	beq _080AA17A
	bl APProc_Delete
_080AA17A:
	adds r0, r4, #0
	adds r0, #0x35
	ldrb r0, [r0]
	cmp r0, #4
	beq _080AA1AE
	cmp r0, #4
	bgt _080AA18E
	cmp r0, #2
	beq _080AA1A6
	b _080AA1B4
_080AA18E:
	cmp r0, #0x20
	beq _080AA19E
	cmp r0, #0x40
	bne _080AA1B4
	adds r0, r4, #0
	bl sub_80AA144
	b _080AA1B4
_080AA19E:
	adds r0, r4, #0
	bl sub_80B1688
	b _080AA1B4
_080AA1A6:
	adds r0, r4, #0
	bl sub_80AFF1C
	b _080AA1B4
_080AA1AE:
	adds r0, r4, #0
	bl sub_80A1984
_080AA1B4:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80AA158

	THUMB_FUNC_START sub_80AA1BC
sub_80AA1BC: @ 0x080AA1BC
	push {lr}
	adds r1, r0, #0
	adds r1, #0x35
	ldrb r1, [r1]
	cmp r1, #4
	beq _080AA1E2
	cmp r1, #4
	bgt _080AA1D2
	cmp r1, #2
	beq _080AA1E2
	b _080AA1E8
_080AA1D2:
	cmp r1, #0x10
	beq _080AA1DA
	cmp r1, #0x20
	bne _080AA1E8
_080AA1DA:
	movs r1, #0xb
	bl Proc_Goto
	b _080AA1E8
_080AA1E2:
	movs r1, #0xa
	bl Proc_Goto
_080AA1E8:
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80AA1BC

	THUMB_FUNC_START sub_80AA1EC
sub_80AA1EC: @ 0x080AA1EC
	adds r0, #0x29
	movs r1, #0
	strb r1, [r0]
	ldr r2, _080AA244  @ gLCDControlBuffer
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
	adds r3, r2, #0
	adds r3, #0x34
	ldrb r0, [r3]
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
	strb r0, [r3]
	adds r2, #0x36
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
	bx lr
	.align 2, 0
_080AA244: .4byte gLCDControlBuffer

	THUMB_FUNC_END sub_80AA1EC

	THUMB_FUNC_START sub_80AA248
sub_80AA248: @ 0x080AA248
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r1, r5, #0
	adds r1, #0x29
	ldrb r0, [r1]
	adds r4, r0, #1
	strb r4, [r1]
	ldrb r0, [r1]
	movs r1, #0x10
	subs r1, r1, r0
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #4
	muls r0, r1, r0
	cmp r0, #0
	bge _080AA26A
	adds r0, #0xff
_080AA26A:
	asrs r0, r0, #8
	movs r2, #0x50
	subs r2, r2, r0
	ldr r3, _080AA2A4  @ gLCDControlBuffer
	adds r1, r3, #0
	adds r1, #0x2d
	movs r0, #0
	strb r0, [r1]
	movs r0, #0x50
	subs r0, r0, r2
	adds r1, #4
	strb r0, [r1]
	subs r1, #5
	movs r0, #0xf0
	strb r0, [r1]
	adds r2, #0x50
	adds r0, r3, #0
	adds r0, #0x30
	strb r2, [r0]
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x10
	bne _080AA29E
	adds r0, r5, #0
	bl Proc_Break
_080AA29E:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080AA2A4: .4byte gLCDControlBuffer

	THUMB_FUNC_END sub_80AA248

	THUMB_FUNC_START sub_80AA2A8
sub_80AA2A8: @ 0x080AA2A8
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r1, r5, #0
	adds r1, #0x29
	ldrb r0, [r1]
	adds r4, r0, #1
	strb r4, [r1]
	ldrb r0, [r1]
	movs r1, #0x10
	subs r1, r1, r0
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #4
	muls r0, r1, r0
	cmp r0, #0
	bge _080AA2CA
	adds r0, #0xff
_080AA2CA:
	asrs r0, r0, #8
	movs r2, #0x50
	subs r2, r2, r0
	ldr r3, _080AA308  @ gLCDControlBuffer
	adds r1, r3, #0
	adds r1, #0x2d
	movs r0, #0
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x31
	strb r2, [r0]
	subs r1, #1
	movs r0, #0xf0
	strb r0, [r1]
	movs r1, #0x60
	negs r1, r1
	adds r0, r1, #0
	subs r0, r0, r2
	adds r1, r3, #0
	adds r1, #0x30
	strb r0, [r1]
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x10
	bne _080AA302
	adds r0, r5, #0
	bl Proc_Break
_080AA302:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080AA308: .4byte gLCDControlBuffer

	THUMB_FUNC_END sub_80AA2A8

	THUMB_FUNC_START sub_80AA30C
sub_80AA30C: @ 0x080AA30C
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r0, _080AA408  @ gBG0TilemapBuffer
	movs r1, #0
	bl BG_Fill
	ldr r0, _080AA40C  @ gBG1TilemapBuffer
	movs r1, #0
	bl BG_Fill
	bl Font_ResetAllocation
	bl LoadUiFrameGraphics
	bl LoadObjUIGfx
	ldr r0, _080AA410  @ gUnknown_08A25DCC
	movs r5, #0x80
	lsls r5, r5, #1
	adds r1, r5, #0
	adds r2, r5, #0
	bl CopyToPaletteBuffer
	ldr r4, _080AA414  @ gUnknown_08A21658
	movs r0, #3
	bl GetBackgroundTileDataOffset
	adds r1, r0, #0
	movs r0, #0xc0
	lsls r0, r0, #0x13
	adds r1, r1, r0
	adds r0, r4, #0
	bl CopyDataWithPossibleUncomp
	ldr r0, _080AA418  @ gBG3TilemapBuffer
	ldr r1, _080AA41C  @ gUnknown_08A25ECC
	movs r2, #0x80
	lsls r2, r2, #8
	bl CallARM_FillTileRect
	ldr r0, _080AA420  @ gUnknown_08A268D8
	movs r1, #0xe0
	movs r2, #0x20
	bl CopyToPaletteBuffer
	ldr r4, _080AA424  @ gUnknown_08A26380
	movs r0, #3
	bl GetBackgroundTileDataOffset
	adds r1, r0, #0
	ldr r0, _080AA428  @ 0x06004C00
	adds r1, r1, r0
	adds r0, r4, #0
	bl CopyDataWithPossibleUncomp
	ldr r0, _080AA42C  @ gUnknown_08A268F8
	ldr r4, _080AA430  @ gGenericBuffer
	adds r1, r4, #0
	bl CopyDataWithPossibleUncomp
	ldr r0, _080AA434  @ gBG2TilemapBuffer
	ldr r2, _080AA438  @ 0x00007260
	adds r1, r4, #0
	bl CallARM_FillTileRect
	ldr r0, _080AA43C  @ Img_SaveScreenSprits
	ldr r1, _080AA440  @ 0x06010800
	bl CopyDataWithPossibleUncomp
	ldr r0, _080AA444  @ Pal_SaveScreenSprits
	movs r1, #0x90
	lsls r1, r1, #2
	adds r2, r5, #0
	bl CopyToPaletteBuffer
	ldr r0, _080AA448  @ gUnknown_08A295B4
	movs r1, #0x40
	movs r2, #0x20
	bl CopyToPaletteBuffer
	ldr r0, _080AA44C  @ gUnknown_02022AE8
	adds r1, r0, #0
	subs r1, #0x20
	movs r2, #1
	bl sub_80AA790
	ldr r0, _080AA450  @ Img_GameMainMenuObjs
	ldr r1, _080AA454  @ 0x06014000
	bl CopyDataWithPossibleUncomp
	bl sub_80AB794
	adds r0, r6, #0
	bl sub_80A8A9C
	adds r0, r6, #0
	adds r0, #0x2c
	ldrb r0, [r0]
	bl sub_80ABD88
	movs r0, #0xc
	bl Proc_UnblockEachMarked
	movs r0, #0xd
	bl Proc_UnblockEachMarked
	movs r0, #3
	bl BG_EnableSyncByMask
	adds r0, r6, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	cmp r0, #3
	beq _080AA3FE
	adds r1, r6, #0
	adds r1, #0x2e
	movs r0, #5
	strb r0, [r1]
	adds r1, #1
	movs r0, #0xdc
	strb r0, [r1]
_080AA3FE:
	bl EnablePaletteSync
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080AA408: .4byte gBG0TilemapBuffer
_080AA40C: .4byte gBG1TilemapBuffer
_080AA410: .4byte gUnknown_08A25DCC
_080AA414: .4byte gUnknown_08A21658
_080AA418: .4byte gBG3TilemapBuffer
_080AA41C: .4byte gUnknown_08A25ECC
_080AA420: .4byte gUnknown_08A268D8
_080AA424: .4byte gUnknown_08A26380
_080AA428: .4byte 0x06004C00
_080AA42C: .4byte gUnknown_08A268F8
_080AA430: .4byte gGenericBuffer
_080AA434: .4byte gBG2TilemapBuffer
_080AA438: .4byte 0x00007260
_080AA43C: .4byte Img_SaveScreenSprits
_080AA440: .4byte 0x06010800
_080AA444: .4byte Pal_SaveScreenSprits
_080AA448: .4byte gUnknown_08A295B4
_080AA44C: .4byte gUnknown_02022AE8
_080AA450: .4byte Img_GameMainMenuObjs
_080AA454: .4byte 0x06014000

	THUMB_FUNC_END sub_80AA30C

	THUMB_FUNC_START sub_80AA458
sub_80AA458: @ 0x080AA458
	push {lr}
	adds r1, r0, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	cmp r0, #3
	bne _080AA46E
	adds r0, r1, #0
	movs r1, #2
	bl Proc_Goto
	b _080AA476
_080AA46E:
	adds r0, r1, #0
	movs r1, #5
	bl Proc_Goto
_080AA476:
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80AA458

	THUMB_FUNC_START sub_80AA47C
sub_80AA47C: @ 0x080AA47C
	push {lr}
	adds r3, r0, #0
	adds r0, #0x42
	ldrh r1, [r0]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	bne _080AA496
	movs r0, #0xc0
	movs r1, #8
	movs r2, #8
	bl StartHelpPromptSprite
_080AA496:
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80AA47C

	THUMB_FUNC_START sub_80AA49C
sub_80AA49C: @ 0x080AA49C
	push {lr}
	adds r1, r0, #0
	adds r0, #0x35
	ldrb r0, [r0]
	cmp r0, #0x20
	bne _080AA4AE
	adds r0, r1, #0
	bl sub_80AA6EC
_080AA4AE:
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80AA49C

	THUMB_FUNC_START sub_80AA4B4
sub_80AA4B4: @ 0x080AA4B4
	push {lr}
	bl EndHelpPromptSprite
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80AA4B4

	THUMB_FUNC_START Make6C_savemenu
Make6C_savemenu: @ 0x080AA4C0
	push {lr}
	adds r1, r0, #0
	ldr r0, _080AA4F0  @ ProcScr_SaveMenu
	bl Proc_StartBlocking
	adds r3, r0, #0
	adds r3, #0x42
	movs r2, #0
	movs r1, #0x80
	lsls r1, r1, #1
	strh r1, [r3]
	adds r0, #0x35
	strb r2, [r0]
	ldr r2, _080AA4F4  @ gRAMChapterData
	adds r2, #0x40
	ldrb r1, [r2]
	movs r0, #0x61
	negs r0, r0
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	pop {r0}
	bx r0
	.align 2, 0
_080AA4F0: .4byte ProcScr_SaveMenu
_080AA4F4: .4byte gRAMChapterData

	THUMB_FUNC_END Make6C_savemenu

	THUMB_FUNC_START sub_80AA4F8
sub_80AA4F8: @ 0x080AA4F8
	push {lr}
	adds r2, r0, #0
	ldr r0, _080AA514  @ gGameState
	ldrb r1, [r0, #4]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	bne _080AA510
	adds r0, r2, #0
	movs r1, #0x14
	bl Proc_Goto
_080AA510:
	pop {r0}
	bx r0
	.align 2, 0
_080AA514: .4byte gGameState

	THUMB_FUNC_END sub_80AA4F8

	THUMB_FUNC_START Make6C_savemenu2
Make6C_savemenu2: @ 0x080AA518
	push {lr}
	adds r1, r0, #0
	ldr r0, _080AA528  @ gUnknown_08A203A8
	bl Proc_StartBlocking
	pop {r0}
	bx r0
	.align 2, 0
_080AA528: .4byte gUnknown_08A203A8

	THUMB_FUNC_END Make6C_savemenu2

	THUMB_FUNC_START savemenu_SetDifficultyChoice
savemenu_SetDifficultyChoice: @ 0x080AA52C
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _080AA54C  @ ProcScr_SaveMenu
	bl Proc_Find
	cmp r0, #0
	beq _080AA546
	adds r1, r0, #0
	adds r1, #0x2a
	strb r4, [r1]
	adds r0, #0x3d
	strb r5, [r0]
_080AA546:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080AA54C: .4byte ProcScr_SaveMenu

	THUMB_FUNC_END savemenu_SetDifficultyChoice

	THUMB_FUNC_START sub_80AA550
sub_80AA550: @ 0x080AA550
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r5, r0, #0
	mov r1, sp
	movs r0, #0
	strh r0, [r1]
	ldr r4, _080AA5F0  @ gUnknown_08A204B8
	ldr r1, [r4]
	ldr r2, _080AA5F4  @ 0x010000A2
	mov r0, sp
	bl CpuSet
	ldr r0, [r4]
	bl LoadBonusContentData
	cmp r0, #0
	beq _080AA5E6
	movs r0, #0
	str r0, [r5, #0x5c]
	str r0, [r5, #0x58]
	mov r8, r4
	movs r6, #0
	movs r0, #0xfc
	mov r9, r0
	movs r7, #0xf
_080AA588:
	mov r1, r8
	ldr r0, [r1]
	adds r2, r0, r6
	ldrb r0, [r2]
	movs r4, #3
	ands r4, r0
	cmp r4, #1
	bne _080AA5D2
	ldrb r0, [r2, #1]
	cmp r0, #3
	bne _080AA5B2
	str r4, [r5, #0x58]
	ldrb r1, [r2]
	mov r0, r9
	ands r0, r1
	adds r0, #2
	strb r0, [r2]
	movs r0, #0
	movs r1, #0x75
	bl sub_80A3F08
_080AA5B2:
	mov r1, r8
	ldr r0, [r1]
	adds r2, r0, r6
	ldrb r0, [r2, #1]
	cmp r0, #4
	bne _080AA5D2
	str r4, [r5, #0x5c]
	ldrb r1, [r2]
	mov r0, r9
	ands r0, r1
	adds r0, #2
	strb r0, [r2]
	movs r0, #0
	movs r1, #0x76
	bl sub_80A3F08
_080AA5D2:
	adds r6, #0x14
	subs r7, #1
	cmp r7, #0
	bge _080AA588
	ldr r0, [r5, #0x58]
	cmp r0, #0
	bne _080AA5F8
	ldr r0, [r5, #0x5c]
	cmp r0, #0
	bne _080AA5F8
_080AA5E6:
	adds r0, r5, #0
	movs r1, #0xa
	bl Proc_Goto
	b _080AA600
	.align 2, 0
_080AA5F0: .4byte gUnknown_08A204B8
_080AA5F4: .4byte 0x010000A2
_080AA5F8:
	ldr r0, _080AA610  @ 0x06014000
	movs r1, #9
	bl LoadDialogueBoxGfx
_080AA600:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080AA610: .4byte 0x06014000

	THUMB_FUNC_END sub_80AA550

	THUMB_FUNC_START sub_80AA614
sub_80AA614: @ 0x080AA614
	push {lr}
	adds r1, r0, #0
	ldr r0, [r1, #0x58]
	cmp r0, #0
	beq _080AA64C
	adds r1, #0x4c
	movs r0, #0
	strh r0, [r1]
	ldr r2, _080AA644  @ 0x00000893
	movs r0, #0x40
	movs r1, #0x30
	bl StartHelpBoxExt_Unk
	ldr r0, _080AA648  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080AA654
	movs r0, #0x5b
	bl m4aSongNumStart
	b _080AA654
	.align 2, 0
_080AA644: .4byte 0x00000893
_080AA648: .4byte gRAMChapterData
_080AA64C:
	adds r0, r1, #0
	movs r1, #0
	bl Proc_Goto
_080AA654:
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80AA614

	THUMB_FUNC_START sub_80AA658
sub_80AA658: @ 0x080AA658
	push {lr}
	adds r1, r0, #0
	ldr r0, [r1, #0x5c]
	cmp r0, #0
	beq _080AA690
	adds r1, #0x4c
	movs r0, #0
	strh r0, [r1]
	ldr r2, _080AA688  @ 0x00000894
	movs r0, #0x40
	movs r1, #0x30
	bl StartHelpBoxExt_Unk
	ldr r0, _080AA68C  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080AA698
	movs r0, #0x5b
	bl m4aSongNumStart
	b _080AA698
	.align 2, 0
_080AA688: .4byte 0x00000894
_080AA68C: .4byte gRAMChapterData
_080AA690:
	adds r0, r1, #0
	movs r1, #1
	bl Proc_Goto
_080AA698:
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80AA658

	THUMB_FUNC_START sub_80AA69C
sub_80AA69C: @ 0x080AA69C
	push {r4, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x4c
	ldrh r2, [r1]
	movs r3, #0
	ldrsh r0, [r1, r3]
	cmp r0, #0x1e
	ble _080AA6CC
	ldr r0, _080AA6C8  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0xb
	ands r0, r1
	cmp r0, #0
	beq _080AA6D0
	bl CloseHelpBox
	adds r0, r4, #0
	bl Proc_Break
	b _080AA6D0
	.align 2, 0
_080AA6C8: .4byte gKeyStatusPtr
_080AA6CC:
	adds r0, r2, #1
	strh r0, [r1]
_080AA6D0:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80AA69C

	THUMB_FUNC_START sub_80AA6D8
sub_80AA6D8: @ 0x080AA6D8
	push {lr}
	ldr r0, _080AA6E8  @ gUnknown_08A204B8
	ldr r0, [r0]
	bl SaveBonusContentData
	pop {r0}
	bx r0
	.align 2, 0
_080AA6E8: .4byte gUnknown_08A204B8

	THUMB_FUNC_END sub_80AA6D8

	THUMB_FUNC_START sub_80AA6EC
sub_80AA6EC: @ 0x080AA6EC
	push {lr}
	adds r1, r0, #0
	ldr r0, _080AA6FC  @ gUnknown_08A204BC
	bl Proc_StartBlocking
	pop {r0}
	bx r0
	.align 2, 0
_080AA6FC: .4byte gUnknown_08A204BC

	THUMB_FUNC_END sub_80AA6EC

	THUMB_FUNC_START sub_80AA700
sub_80AA700: @ 0x080AA700
	ldr r1, _080AA714  @ gUnknown_0203EF64
	movs r0, #0
	strb r0, [r1]
	movs r0, #0xff
	strb r0, [r1, #1]
	movs r0, #1
	negs r0, r0
	strb r0, [r1, #2]
	bx lr
	.align 2, 0
_080AA714: .4byte gUnknown_0203EF64

	THUMB_FUNC_END sub_80AA700

	THUMB_FUNC_START sub_80AA718
sub_80AA718: @ 0x080AA718
	push {lr}
	ldr r1, _080AA734  @ gUnknown_0203EF64
	ldrb r0, [r1]
	cmp r0, #0
	beq _080AA73C
	ldr r2, _080AA738  @ gCharacterData
	subs r0, #1
	movs r1, #0x34
	muls r0, r1, r0
	adds r0, r0, r2
	ldrh r0, [r0]
	bl GetStringFromIndex
	b _080AA73E
	.align 2, 0
_080AA734: .4byte gUnknown_0203EF64
_080AA738: .4byte gCharacterData
_080AA73C:
	movs r0, #0
_080AA73E:
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80AA718

	THUMB_FUNC_START sub_80AA744
sub_80AA744: @ 0x080AA744
	push {lr}
	ldr r1, _080AA75C  @ gUnknown_0203EF64
	ldrb r0, [r1]
	cmp r0, #0
	beq _080AA756
	movs r0, #1
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bge _080AA760
_080AA756:
	movs r0, #1
	negs r0, r0
	b _080AA764
	.align 2, 0
_080AA75C: .4byte gUnknown_0203EF64
_080AA760:
	movs r0, #1
	ldrsb r0, [r1, r0]
_080AA764:
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80AA744

	THUMB_FUNC_START sub_80AA768
sub_80AA768: @ 0x080AA768
	push {lr}
	ldr r1, _080AA780  @ gUnknown_0203EF64
	ldrb r0, [r1]
	cmp r0, #0
	beq _080AA77A
	movs r0, #2
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bge _080AA784
_080AA77A:
	movs r0, #0
	b _080AA78C
	.align 2, 0
_080AA780: .4byte gUnknown_0203EF64
_080AA784:
	movs r0, #2
	ldrsb r0, [r1, r0]
	bl sub_80BBA28
_080AA78C:
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80AA768

	THUMB_FUNC_START sub_80AA790
sub_80AA790: @ 0x080AA790
	push {lr}
	lsls r2, r2, #4
	cmp r2, #0
	ble _080AA7A8
	adds r3, r0, #0
_080AA79A:
	ldrh r0, [r3]
	strh r0, [r1]
	adds r3, #2
	adds r1, #2
	subs r2, #1
	cmp r2, #0
	bne _080AA79A
_080AA7A8:
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80AA790

	THUMB_FUNC_START sub_80AA7AC
sub_80AA7AC: @ 0x080AA7AC
	push {r4, r5, lr}
	movs r2, #0x3f
	ands r2, r0
	asrs r2, r2, #2
	ldr r4, _080AA7DC  @ gPaletteBuffer
	lsls r2, r2, #1
	ldr r0, _080AA7E0  @ gUnknown_08A28088
	adds r2, r2, r0
	ldrh r3, [r2]
	ldr r5, _080AA7E4  @ 0x00000222
	adds r0, r4, r5
	strh r3, [r0]
	lsls r1, r1, #6
	ldr r0, _080AA7E8  @ 0x00000342
	adds r1, r1, r0
	adds r1, r1, r4
	ldrh r0, [r2]
	strh r0, [r1]
	bl EnablePaletteSync
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080AA7DC: .4byte gPaletteBuffer
_080AA7E0: .4byte gUnknown_08A28088
_080AA7E4: .4byte 0x00000222
_080AA7E8: .4byte 0x00000342

	THUMB_FUNC_END sub_80AA7AC

	THUMB_FUNC_START sub_80AA7EC
sub_80AA7EC: @ 0x080AA7EC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	ldr r4, [r0, #0x14]
	adds r0, r4, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	lsls r0, r0, #5
	movs r1, #0xdc
	bl __divsi3
	movs r1, #0x20
	subs r1, r1, r0
	lsls r1, r1, #0x18
	movs r0, #0x92
	lsls r0, r0, #0x18
	adds r1, r1, r0
	lsrs r1, r1, #0x18
	mov r9, r1
	movs r1, #0x8f
	mov r8, r1
	adds r0, r4, #0
	adds r0, #0x42
	ldrh r0, [r0]
	cmp r0, #1
	bne _080AA83A
	ldr r0, [r4, #0x54]
	mov r4, sp
	adds r4, #6
	add r5, sp, #8
	add r1, sp, #4
	adds r2, r4, #0
	adds r3, r5, #0
	bl ComputeDisplayTime
	b _080AA858
_080AA83A:
	adds r0, r4, #0
	adds r0, #0x2c
	ldrb r1, [r0]
	lsls r1, r1, #2
	adds r0, #0x1c
	adds r0, r0, r1
	ldr r0, [r0]
	mov r4, sp
	adds r4, #6
	add r5, sp, #8
	add r1, sp, #4
	adds r2, r4, #0
	adds r3, r5, #0
	bl ComputeDisplayTime
_080AA858:
	mov sl, r4
	mov r1, r8
	adds r1, #6
	mov r2, r9
	subs r2, #0xe
	ldr r3, _080AA9CC  @ gUnknown_08A20590
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [sp]
	movs r0, #0xd
	bl PutSpriteExt
	add r0, sp, #4
	ldrh r0, [r0]
	mov r7, r9
	subs r7, #8
	cmp r0, #0x63
	bls _080AA8BE
	mov r5, r8
	adds r5, #0xa
	ldr r4, _080AA9D0  @ gUnknown_08A2067C
	add r0, sp, #4
	ldrh r0, [r0]
	movs r6, #0x64
	movs r1, #0x64
	bl __udivsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0xe
	adds r0, r0, r4
	ldr r3, [r0]
	movs r0, #0xe0
	lsls r0, r0, #7
	str r0, [sp]
	movs r0, #0xd
	adds r1, r5, #0
	adds r2, r7, #0
	bl PutSpriteExt
	add r5, sp, #4
	adds r0, r5, #0
	ldrh r4, [r0]
	adds r0, r4, #0
	movs r1, #0x64
	bl __udivsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	muls r0, r6, r0
	subs r4, r4, r0
	strh r4, [r5]
_080AA8BE:
	add r0, sp, #4
	ldrh r0, [r0]
	cmp r0, #9
	bls _080AA8EE
	mov r5, r8
	adds r5, #0x12
	ldr r4, _080AA9D0  @ gUnknown_08A2067C
	add r0, sp, #4
	ldrh r0, [r0]
	movs r1, #0xa
	bl __udivsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0xe
	adds r0, r0, r4
	ldr r3, [r0]
	movs r0, #0xe0
	lsls r0, r0, #7
	str r0, [sp]
	movs r0, #0xd
	adds r1, r5, #0
	adds r2, r7, #0
	bl PutSpriteExt
_080AA8EE:
	mov r6, r8
	adds r6, #0x1a
	ldr r5, _080AA9D0  @ gUnknown_08A2067C
	add r0, sp, #4
	ldrh r0, [r0]
	movs r1, #0xa
	bl __umodsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0xe
	adds r0, r0, r5
	ldr r3, [r0]
	movs r4, #0xe0
	lsls r4, r4, #7
	str r4, [sp]
	movs r0, #0xd
	adds r1, r6, #0
	adds r2, r7, #0
	bl PutSpriteExt
	mov r1, r8
	adds r1, #0x22
	mov r2, r9
	subs r2, #7
	ldr r3, [r5, #0x28]
	str r4, [sp]
	movs r0, #0xd
	bl PutSpriteExt
	adds r6, #0x10
	mov r1, sl
	ldrh r0, [r1]
	movs r1, #0xa
	bl __udivsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0xe
	adds r0, r0, r5
	ldr r3, [r0]
	str r4, [sp]
	movs r0, #0xd
	adds r1, r6, #0
	adds r2, r7, #0
	bl PutSpriteExt
	adds r6, #8
	mov r1, sl
	ldrh r0, [r1]
	movs r1, #0xa
	bl __umodsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0xe
	adds r0, r0, r5
	ldr r3, [r0]
	str r4, [sp]
	movs r0, #0xd
	adds r1, r6, #0
	adds r2, r7, #0
	bl PutSpriteExt
	mov r1, r8
	adds r1, #0x3a
	mov r2, r9
	adds r2, #1
	ldr r5, _080AA9D4  @ gUnknown_08A20650
	ldr r3, [r5, #0x28]
	str r4, [sp]
	movs r0, #0xd
	bl PutSpriteExt
	adds r6, #0x10
	mov r1, sp
	ldrh r0, [r1, #8]
	movs r1, #0xa
	bl __udivsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0xe
	adds r0, r0, r5
	ldr r3, [r0]
	str r4, [sp]
	movs r0, #0xd
	adds r1, r6, #0
	mov r2, r9
	bl PutSpriteExt
	adds r6, #8
	mov r1, sp
	ldrh r0, [r1, #8]
	movs r1, #0xa
	bl __umodsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0xe
	adds r0, r0, r5
	ldr r3, [r0]
	str r4, [sp]
	movs r0, #0xd
	adds r1, r6, #0
	mov r2, r9
	bl PutSpriteExt
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080AA9CC: .4byte gUnknown_08A20590
_080AA9D0: .4byte gUnknown_08A2067C
_080AA9D4: .4byte gUnknown_08A20650

	THUMB_FUNC_END sub_80AA7EC

	THUMB_FUNC_START sub_80AA9D8
sub_80AA9D8: @ 0x080AA9D8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	ldrh r1, [r0, #0x3e]
	adds r1, #1
	strh r1, [r0, #0x3e]
	adds r2, r0, #0
	adds r2, #0x40
	ldrh r1, [r2]
	adds r1, #2
	strh r1, [r2]
	ldrh r4, [r0, #0x3e]
	lsls r4, r4, #0x14
	lsrs r4, r4, #0x17
	ldrh r0, [r2]
	lsrs r7, r0, #3
	movs r0, #0xff
	ands r7, r0
	movs r0, #0
	movs r1, #1
	bl sub_8014E74
	adds r6, r7, #0
	ldr r1, _080AAA64  @ gSinLookup
	mov sl, r1
	lsls r4, r4, #0x10
	asrs r2, r4, #0x10
	mov r8, r2
	adds r5, r0, #0
	mov r9, r4
	movs r4, #0x9f
_080AAA1A:
	movs r0, #0xff
	ands r0, r6
	lsls r0, r0, #1
	add r0, sl
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r1, #0xc0
	lsls r1, r1, #2
	bl __divsi3
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add r0, r8
	ldr r2, _080AAA68  @ 0x000001FF
	adds r1, r2, #0
	ands r0, r1
	strh r0, [r5]
	adds r6, #0xc
	adds r5, #2
	subs r4, #1
	cmp r4, #0
	bge _080AAA1A
	mov r0, r9
	lsrs r1, r0, #0x10
	adds r2, r7, #0
	movs r0, #2
	bl BG_SetPosition
	bl sub_8014EA8
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080AAA64: .4byte gSinLookup
_080AAA68: .4byte 0x000001FF

	THUMB_FUNC_END sub_80AA9D8

	THUMB_FUNC_START sub_80AAA6C
sub_80AAA6C: @ 0x080AAA6C
	push {lr}
	bl sub_8014E3C
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80AAA6C

	THUMB_FUNC_START sub_80AAA78
sub_80AAA78: @ 0x080AAA78
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r6, r0, #0
	adds r1, r6, #0
	adds r1, #0x29
	movs r7, #0
	movs r0, #1
	strb r0, [r1]
	movs r5, #0
	strh r7, [r6, #0x2c]
	movs r4, #0x80
	lsls r4, r4, #1
	strh r4, [r6, #0x2e]
	adds r0, r6, #0
	adds r0, #0x3a
	strb r5, [r0]
	adds r1, #0x12
	movs r0, #0x28
	strb r0, [r1]
	strh r7, [r6, #0x30]
	adds r0, r6, #0
	adds r0, #0x32
	strb r5, [r0]
	str r4, [sp]
	movs r0, #0
	adds r1, r4, #0
	movs r2, #0
	movs r3, #0
	bl WriteOAMRotScaleData
	str r4, [sp]
	movs r0, #1
	adds r1, r4, #0
	movs r2, #0
	movs r3, #0
	bl WriteOAMRotScaleData
	str r4, [sp]
	movs r0, #2
	adds r1, r4, #0
	movs r2, #0
	movs r3, #0
	bl WriteOAMRotScaleData
	str r4, [sp]
	movs r0, #3
	adds r1, r4, #0
	movs r2, #0
	movs r3, #0
	bl WriteOAMRotScaleData
	strh r7, [r6, #0x2a]
	adds r0, r6, #0
	bl sub_80AB534
	str r0, [r6, #0x34]
	adds r0, r6, #0
	adds r0, #0x39
	strb r5, [r0]
	ldr r1, [r6, #0x14]
	adds r2, r1, #0
	adds r2, #0x3f
	ldrb r0, [r2]
	cmp r0, #0xff
	bne _080AAAFE
	str r7, [r1, #0x60]
	b _080AAB1C
_080AAAFE:
	ldr r0, _080AAB64  @ gUnknown_08A280A8
	movs r1, #0xa0
	lsls r1, r1, #1
	ldrb r2, [r2]
	lsls r2, r2, #5
	adds r2, #0x30
	movs r3, #0xc5
	lsls r3, r3, #6
	str r7, [sp]
	movs r4, #4
	str r4, [sp, #4]
	bl APProc_Create
	ldr r1, [r6, #0x14]
	str r0, [r1, #0x60]
_080AAB1C:
	ldr r0, [r6, #0x14]
	adds r0, #0x2c
	ldrb r2, [r0]
	adds r0, r6, #0
	adds r0, #0x3c
	movs r1, #0
	strb r2, [r0]
	adds r0, #4
	strh r1, [r0]
	strh r1, [r6, #0x3e]
	ldr r0, _080AAB68  @ gUnknown_02000000
	bl sub_8014DA8
	ldr r1, _080AAB6C  @ 0x04000018
	movs r0, #0
	bl sub_8014EC4
	movs r0, #0
	bl sub_8014EF4
	adds r0, r6, #0
	bl sub_80AA9D8
	ldr r0, _080AAB70  @ gUnknown_03004990
	ldr r0, [r0]
	ldr r1, _080AAB74  @ 0x0000079E
	adds r0, r0, r1
	movs r1, #1
	strb r1, [r0]
	bl sub_80AB548
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080AAB64: .4byte gUnknown_08A280A8
_080AAB68: .4byte gUnknown_02000000
_080AAB6C: .4byte 0x04000018
_080AAB70: .4byte gUnknown_03004990
_080AAB74: .4byte 0x0000079E

	THUMB_FUNC_END sub_80AAA78

	THUMB_FUNC_START sub_80AAB78
sub_80AAB78: @ 0x080AAB78
	push {lr}
	lsls r1, r1, #0x10
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080AABA4
	ldr r2, _080AABA0  @ gPaletteBuffer
	lsrs r0, r1, #0x12
	movs r1, #0xf
	ands r0, r1
	movs r1, #0xc8
	lsls r1, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	movs r1, #0xb4
	lsls r1, r1, #2
	adds r2, r2, r1
	strh r0, [r2]
	b _080AABB2
	.align 2, 0
_080AABA0: .4byte gPaletteBuffer
_080AABA4:
	ldr r0, _080AABBC  @ gPaletteBuffer
	ldr r2, _080AABC0  @ 0x0000033A
	adds r1, r0, r2
	ldrh r1, [r1]
	subs r2, #0x6a
	adds r0, r0, r2
	strh r1, [r0]
_080AABB2:
	bl EnablePaletteSync
	pop {r0}
	bx r0
	.align 2, 0
_080AABBC: .4byte gPaletteBuffer
_080AABC0: .4byte 0x0000033A

	THUMB_FUNC_END sub_80AAB78

	THUMB_FUNC_START sub_80AABC4
sub_80AABC4: @ 0x080AABC4
	push {r4, r5, r6, lr}
	mov r6, sl
	mov r5, r9
	mov r4, r8
	push {r4, r5, r6}
	sub sp, #4
	adds r6, r1, #0
	mov r8, r2
	adds r4, r3, #0
	ldr r0, [sp, #0x20]
	ldr r5, [sp, #0x24]
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	ldr r1, _080AAC34  @ 0x000001FF
	mov r9, r1
	adds r1, r6, #0
	mov r2, r9
	ands r1, r2
	ldr r3, _080AAC38  @ gUnknown_08A2051C
	movs r2, #0xf
	mov sl, r2
	ands r0, r2
	lsls r0, r0, #0xc
	str r0, [sp]
	movs r0, #4
	mov r2, r8
	bl PutSpriteExt
	adds r6, #8
	mov r0, r9
	ands r6, r0
	movs r1, #8
	add r8, r1
	ldr r0, _080AAC3C  @ gUnknown_08A209B8
	lsls r4, r4, #2
	adds r4, r4, r0
	ldr r3, [r4]
	mov r2, sl
	ands r5, r2
	lsls r5, r5, #0xc
	str r5, [sp]
	movs r0, #4
	adds r1, r6, #0
	mov r2, r8
	bl PutSpriteExt
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080AAC34: .4byte 0x000001FF
_080AAC38: .4byte gUnknown_08A2051C
_080AAC3C: .4byte gUnknown_08A209B8

	THUMB_FUNC_END sub_80AABC4

	THUMB_FUNC_START sub_80AAC40
sub_80AAC40: @ 0x080AAC40
	push {r4, r5, r6, lr}
	mov r6, sl
	mov r5, r9
	mov r4, r8
	push {r4, r5, r6}
	sub sp, #4
	adds r6, r1, #0
	mov r8, r2
	adds r4, r3, #0
	ldr r0, [sp, #0x20]
	ldr r5, [sp, #0x24]
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	ldr r1, _080AACB0  @ 0x000001FF
	mov r9, r1
	adds r1, r6, #0
	mov r2, r9
	ands r1, r2
	ldr r3, _080AACB4  @ gUnknown_08A2051C
	movs r2, #0xf
	mov sl, r2
	ands r0, r2
	lsls r0, r0, #0xc
	str r0, [sp]
	movs r0, #4
	mov r2, r8
	bl PutSpriteExt
	adds r6, #8
	mov r0, r9
	ands r6, r0
	movs r1, #8
	add r8, r1
	ldr r0, _080AACB8  @ gUnknown_08A2099C
	lsls r4, r4, #2
	adds r4, r4, r0
	ldr r3, [r4]
	mov r2, sl
	ands r5, r2
	lsls r5, r5, #0xc
	str r5, [sp]
	movs r0, #4
	adds r1, r6, #0
	mov r2, r8
	bl PutSpriteExt
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080AACB0: .4byte 0x000001FF
_080AACB4: .4byte gUnknown_08A2051C
_080AACB8: .4byte gUnknown_08A2099C

	THUMB_FUNC_END sub_80AAC40

	THUMB_FUNC_START sub_80AACBC
sub_80AACBC: @ 0x080AACBC
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r7, r0, #0
	adds r4, r7, #0
	adds r4, #0x3c
	ldr r0, [r7, #0x14]
	adds r1, r0, #0
	adds r1, #0x2c
	ldrb r0, [r4]
	ldrb r2, [r1]
	cmp r0, r2
	beq _080AACE8
	ldrb r0, [r1]
	bl sub_80ABD88
	ldr r0, [r7, #0x14]
	adds r0, #0x2c
	ldrb r0, [r0]
	strb r0, [r4]
_080AACE8:
	ldrh r0, [r7, #0x2a]
	ldrb r1, [r4]
	bl sub_80ABE3C
	bl EnablePaletteSync
	ldr r1, [r7, #0x14]
	adds r4, r1, #0
	adds r4, #0x3f
	ldrb r3, [r4]
	adds r0, r3, #0
	cmp r0, #0xff
	beq _080AADBA
	adds r5, r1, #0
	adds r5, #0x44
	ldrh r2, [r5]
	adds r1, r2, #0
	movs r0, #0x80
	lsls r0, r0, #1
	cmp r1, r0
	beq _080AADBA
	cmp r1, #0xf
	bhi _080AAD1C
	movs r0, #0xff
	strb r0, [r4]
	b _080AADB0
_080AAD1C:
	ldr r0, _080AADDC  @ gSinLookup
	mov r9, r0
	movs r4, #0xff
	adds r0, r4, #0
	ands r0, r2
	adds r0, #0x40
	lsls r0, r0, #1
	add r0, r9
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r0, r0, #4
	ldrh r1, [r5]
	bl Div
	mov r8, r0
	mov r2, r8
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	mov r8, r2
	ldr r1, [r7, #0x14]
	adds r1, #0x44
	ldrh r2, [r1]
	adds r0, r4, #0
	ands r0, r2
	lsls r0, r0, #1
	add r0, r9
	movs r2, #0
	ldrsh r0, [r0, r2]
	negs r0, r0
	lsls r0, r0, #4
	ldrh r1, [r1]
	bl Div
	adds r6, r0, #0
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	ldr r1, [r7, #0x14]
	adds r1, #0x44
	ldrh r2, [r1]
	adds r0, r4, #0
	ands r0, r2
	lsls r0, r0, #1
	add r0, r9
	movs r2, #0
	ldrsh r0, [r0, r2]
	lsls r0, r0, #4
	ldrh r1, [r1]
	bl Div
	adds r5, r0, #0
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	ldr r1, [r7, #0x14]
	adds r1, #0x44
	ldrh r0, [r1]
	ands r4, r0
	adds r4, #0x40
	lsls r4, r4, #1
	add r4, r9
	movs r2, #0
	ldrsh r0, [r4, r2]
	lsls r0, r0, #4
	ldrh r1, [r1]
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	movs r0, #3
	mov r1, r8
	adds r2, r6, #0
	adds r3, r5, #0
	bl WriteOAMRotScaleData
_080AADB0:
	ldr r1, [r7, #0x14]
	adds r1, #0x44
	ldrh r0, [r1]
	subs r0, #0x10
	strh r0, [r1]
_080AADBA:
	ldrh r0, [r7, #0x2a]
	adds r1, r7, #0
	adds r1, #0x3c
	ldrb r1, [r1]
	bl sub_80AA7AC
	ldrh r0, [r7, #0x2a]
	adds r0, #1
	strh r0, [r7, #0x2a]
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080AADDC: .4byte gSinLookup

	THUMB_FUNC_END sub_80AACBC

	THUMB_FUNC_START sub_80AADE0
sub_80AADE0: @ 0x080AADE0
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, [r4, #0x14]
	adds r0, #0x2f
	ldrb r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #4
	movs r1, #0xdc
	bl __divsi3
	movs r1, #0xe8
	lsls r1, r1, #1
	adds r5, r0, r1
	movs r0, #0xff
	ands r5, r0
	ldr r3, _080AAE38  @ gUnknown_08A2051C
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [sp]
	movs r0, #4
	movs r1, #0x30
	adds r2, r5, #0
	bl PutSpriteExt
	ldr r1, [r4, #0x14]
	adds r0, r1, #0
	adds r0, #0x46
	ldrh r0, [r0]
	cmp r0, #0
	beq _080AAE5C
	adds r0, r1, #0
	adds r0, #0x35
	ldrb r1, [r0]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _080AAE40
	adds r2, r5, #0
	adds r2, #8
	ldr r0, _080AAE3C  @ gUnknown_08A209B8
	ldr r3, [r0, #0x28]
	b _080AAE48
	.align 2, 0
_080AAE38: .4byte gUnknown_08A2051C
_080AAE3C: .4byte gUnknown_08A209B8
_080AAE40:
	adds r2, r5, #0
	adds r2, #8
	ldr r0, _080AAE58  @ gUnknown_08A209B8
	ldr r3, [r0, #0x20]
_080AAE48:
	movs r0, #0x80
	lsls r0, r0, #7
	str r0, [sp]
	movs r0, #4
	movs r1, #0x38
	bl PutSpriteExt
	b _080AAE82
	.align 2, 0
_080AAE58: .4byte gUnknown_08A209B8
_080AAE5C:
	adds r0, r1, #0
	adds r0, #0x42
	ldrb r0, [r0]
	bl sub_80A88B8
	lsls r0, r0, #0x18
	adds r2, r5, #0
	adds r2, #8
	ldr r1, _080AAE8C  @ gUnknown_08A209B8
	lsrs r0, r0, #0x16
	adds r0, r0, r1
	ldr r3, [r0]
	movs r0, #0x80
	lsls r0, r0, #7
	str r0, [sp]
	movs r0, #4
	movs r1, #0x38
	bl PutSpriteExt
_080AAE82:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080AAE8C: .4byte gUnknown_08A209B8

	THUMB_FUNC_END sub_80AADE0

	THUMB_FUNC_START sub_80AAE90
sub_80AAE90: @ 0x080AAE90
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	sub sp, #8
	adds r5, r0, #0
	ldr r2, [r5, #0x14]
	adds r0, r2, #0
	adds r0, #0x2f
	ldrb r1, [r0]
	adds r0, #0x17
	ldrh r0, [r0]
	adds r7, r1, r0
	cmp r7, #0xdb
	bgt _080AAF5E
	adds r0, r2, #0
	adds r0, #0x31
	ldrb r3, [r0]
	lsls r0, r3, #1
	adds r0, r0, r3
	lsls r0, r0, #3
	adds r0, r0, r3
	asrs r0, r0, #1
	movs r1, #0x44
	subs r1, r1, r0
	mov r8, r1
	cmp r1, #1
	bgt _080AAECC
	movs r0, #2
	mov r8, r0
_080AAECC:
	movs r6, #0
	cmp r6, r3
	bge _080AAF36
	mov r4, r8
	movs r2, #0x30
	mov r9, r2
_080AAED8:
	ldr r0, [r5, #0x14]
	adds r0, #0x30
	ldrb r0, [r0]
	adds r1, r6, #0
	bl sub_80A8844
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl sub_80A88B8
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	ldr r0, [r5, #0x14]
	adds r0, #0x2b
	ldrb r0, [r0]
	cmp r6, r0
	bne _080AAF10
	movs r0, #1
	str r0, [sp]
	movs r0, #4
	str r0, [sp, #4]
	adds r0, r5, #0
	mov r2, r9
	subs r1, r2, r7
	adds r2, r4, #0
	bl sub_80AABC4
	b _080AAF24
_080AAF10:
	movs r0, #6
	str r0, [sp]
	movs r0, #4
	str r0, [sp, #4]
	adds r0, r5, #0
	mov r2, r9
	subs r1, r2, r7
	adds r2, r4, #0
	bl sub_80AABC4
_080AAF24:
	adds r4, #0x19
	adds r6, #1
	ldr r0, [r5, #0x14]
	adds r1, r0, #0
	adds r1, #0x31
	adds r2, r0, #0
	ldrb r1, [r1]
	cmp r6, r1
	blt _080AAED8
_080AAF36:
	adds r0, r2, #0
	adds r0, #0x2e
	ldrb r0, [r0]
	cmp r0, #2
	bne _080AAF5E
	adds r0, r2, #0
	adds r0, #0x2b
	ldrb r0, [r0]
	lsls r2, r0, #1
	adds r2, r2, r0
	lsls r2, r2, #3
	adds r2, r2, r0
	add r2, r8
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	movs r0, #0
	movs r1, #0x1c
	adds r3, r5, #0
	bl sub_80AB4F4
_080AAF5E:
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80AAE90

	THUMB_FUNC_START sub_80AAF6C
sub_80AAF6C: @ 0x080AAF6C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	adds r5, r0, #0
	ldr r2, [r5, #0x14]
	adds r0, r2, #0
	adds r0, #0x46
	ldrh r0, [r0]
	subs r0, #1
	lsls r0, r0, #0x10
	movs r1, #0xdb
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _080AB050
	adds r1, r2, #0
	adds r1, #0x33
	ldrb r0, [r1]
	cmp r0, #7
	bne _080AAF9A
	movs r7, #2
	movs r0, #0x15
	b _080AAFAE
_080AAF9A:
	ldrb r0, [r1]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	movs r0, #0x44
	subs r7, r0, r1
	cmp r7, #1
	bgt _080AAFAC
	movs r7, #2
_080AAFAC:
	movs r0, #0x19
_080AAFAE:
	mov r8, r0
	movs r6, #0
	ldr r0, [r5, #0x14]
	adds r1, r0, #0
	adds r1, #0x33
	adds r2, r0, #0
	ldrb r1, [r1]
	cmp r6, r1
	bge _080AB030
	adds r4, r7, #0
_080AAFC2:
	adds r0, #0x32
	ldrb r0, [r0]
	adds r1, r6, #0
	bl sub_80A8844
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl sub_80A88B8
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	ldr r1, [r5, #0x14]
	adds r0, r1, #0
	adds r0, #0x34
	ldrb r0, [r0]
	cmp r6, r0
	bne _080AB002
	adds r0, r1, #0
	adds r0, #0x46
	ldrh r0, [r0]
	movs r1, #0x86
	lsls r1, r1, #1
	subs r1, r1, r0
	movs r0, #1
	str r0, [sp]
	movs r0, #4
	str r0, [sp, #4]
	adds r0, r5, #0
	adds r2, r4, #0
	bl sub_80AAC40
	b _080AB01E
_080AB002:
	adds r0, r1, #0
	adds r0, #0x46
	ldrh r0, [r0]
	movs r1, #0x86
	lsls r1, r1, #1
	subs r1, r1, r0
	movs r0, #6
	str r0, [sp]
	movs r0, #4
	str r0, [sp, #4]
	adds r0, r5, #0
	adds r2, r4, #0
	bl sub_80AAC40
_080AB01E:
	add r4, r8
	adds r6, #1
	ldr r0, [r5, #0x14]
	adds r1, r0, #0
	adds r1, #0x33
	adds r2, r0, #0
	ldrb r1, [r1]
	cmp r6, r1
	blt _080AAFC2
_080AB030:
	adds r0, r2, #0
	adds r0, #0x2e
	ldrb r0, [r0]
	cmp r0, #0xa
	bne _080AB050
	adds r0, r2, #0
	adds r0, #0x34
	ldrb r0, [r0]
	mov r2, r8
	muls r2, r0, r2
	adds r2, r7, r2
	movs r0, #0
	movs r1, #0x1c
	adds r3, r5, #0
	bl sub_80AB4F4
_080AB050:
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80AAF6C

	THUMB_FUNC_START sub_80AB05C
sub_80AB05C: @ 0x080AB05C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov r8, r0
	ldr r0, [r0, #0x14]
	adds r0, #0x2f
	ldrb r0, [r0]
	cmp r0, #0
	bne _080AB076
	b _080AB1DA
_080AB076:
	mov r0, r8
	bl sub_80AA7EC
	mov r0, r8
	bl sub_80AADE0
	movs r7, #0
	movs r0, #0xf
	mov sl, r0
	movs r1, #0xa
	mov r9, r1
_080AB08C:
	mov r2, r8
	ldr r1, [r2, #0x14]
	adds r0, r1, #0
	adds r0, #0x2e
	ldrb r0, [r0]
	movs r2, #0
	cmp r0, #6
	bne _080AB0AA
	adds r0, r1, #0
	adds r0, #0x2c
	ldrb r0, [r0]
	cmp r0, r7
	bne _080AB0AA
	movs r2, #0x80
	lsls r2, r2, #1
_080AB0AA:
	mov r1, r8
	ldr r0, [r1, #0x14]
	adds r0, #0x2f
	ldrb r1, [r0]
	movs r0, #0xf8
	subs r1, r0, r1
	ldr r0, _080AB168  @ 0x000001FF
	ands r1, r0
	lsls r5, r7, #5
	adds r5, #0x20
	adds r5, r2, r5
	ldr r0, _080AB16C  @ gUnknown_08A209F0
	lsls r6, r7, #2
	adds r0, r6, r0
	ldr r3, [r0]
	lsls r4, r7, #1
	mov r0, r9
	mov r2, sl
	ands r0, r2
	lsls r0, r0, #0xc
	str r0, [sp]
	movs r0, #4
	adds r2, r5, #0
	bl PutSpriteExt
	mov r1, r8
	ldr r0, [r1, #0x14]
	adds r0, #0x2f
	ldrb r1, [r0]
	movs r2, #0xf8
	subs r1, r2, r1
	ldr r0, _080AB168  @ 0x000001FF
	ands r1, r0
	adds r5, #8
	ldr r0, _080AB170  @ gUnknown_08A209E4
	adds r6, r6, r0
	ldr r3, [r6]
	adds r4, #0xb
	mov r2, sl
	ands r4, r2
	lsls r4, r4, #0xc
	str r4, [sp]
	movs r0, #4
	adds r2, r5, #0
	bl PutSpriteExt
	movs r0, #2
	add r9, r0
	adds r7, #1
	cmp r7, #2
	ble _080AB08C
	mov r1, r8
	ldr r2, [r1, #0x14]
	adds r3, r2, #0
	adds r3, #0x3f
	ldrb r0, [r3]
	cmp r0, #0xff
	beq _080AB1DA
	adds r0, r2, #0
	adds r0, #0x44
	ldrh r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #1
	cmp r1, r0
	beq _080AB178
	ldr r0, [r2, #0x60]
	cmp r0, #0
	beq _080AB13E
	bl APProc_Delete
	mov r2, r8
	ldr r1, [r2, #0x14]
	movs r0, #0
	str r0, [r1, #0x60]
_080AB13E:
	mov r0, r8
	ldr r2, [r0, #0x14]
	adds r0, r2, #0
	adds r0, #0x42
	ldrh r1, [r0]
	movs r0, #1
	ands r0, r1
	adds r0, r2, #0
	adds r0, #0x3f
	ldrb r2, [r0]
	lsls r2, r2, #5
	adds r2, #0x1e
	ldr r3, _080AB174  @ gUnknown_08A20588
	movs r0, #0xc0
	lsls r0, r0, #6
	str r0, [sp]
	movs r0, #4
	movs r1, #0xca
	bl PutSpriteExt
	b _080AB1DA
	.align 2, 0
_080AB168: .4byte 0x000001FF
_080AB16C: .4byte gUnknown_08A209F0
_080AB170: .4byte gUnknown_08A209E4
_080AB174: .4byte gUnknown_08A20588
_080AB178:
	adds r0, r2, #0
	adds r0, #0x42
	ldrh r0, [r0]
	cmp r0, #1
	bne _080AB1A0
	ldr r0, [r2, #0x60]
	adds r1, r2, #0
	adds r1, #0x2f
	ldrb r2, [r1]
	movs r1, #0xda
	lsls r1, r1, #1
	subs r1, r1, r2
	ldrb r2, [r3]
	lsls r2, r2, #5
	adds r2, #0x30
	movs r3, #0xc5
	lsls r3, r3, #6
	bl APProc_SetParameters
	b _080AB1DA
_080AB1A0:
	ldr r0, [r2, #0x60]
	movs r1, #0xa0
	lsls r1, r1, #1
	ldrb r2, [r3]
	lsls r2, r2, #5
	adds r2, #0x30
	movs r3, #0xc5
	lsls r3, r3, #6
	bl APProc_SetParameters
	mov r1, r8
	ldr r0, [r1, #0x14]
	adds r1, r0, #0
	adds r1, #0x2f
	ldrb r2, [r1]
	movs r1, #0xd3
	lsls r1, r1, #1
	subs r1, r1, r2
	adds r0, #0x3f
	ldrb r2, [r0]
	lsls r2, r2, #5
	adds r2, #0x1e
	ldr r3, _080AB248  @ gUnknown_08A20588
	movs r0, #0xc0
	lsls r0, r0, #6
	str r0, [sp]
	movs r0, #4
	bl PutSpriteExt
_080AB1DA:
	mov r2, r8
	ldr r1, [r2, #0x14]
	adds r0, r1, #0
	adds r0, #0x2e
	ldrb r0, [r0]
	subs r0, #5
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bhi _080AB28E
	adds r0, r1, #0
	adds r0, #0x36
	ldrb r0, [r0]
	cmp r0, #0
	beq _080AB250
	ldr r3, _080AB24C  @ gUnknown_08A20536
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [sp]
	movs r0, #4
	movs r1, #0x2c
	movs r2, #0x80
	bl PutSpriteExt
	mov r1, r8
	ldr r0, [r1, #0x14]
	adds r0, #0x36
	ldrb r1, [r0]
	subs r1, #1
	lsrs r0, r1, #0x1f
	adds r0, r1, r0
	asrs r0, r0, #1
	lsls r0, r0, #1
	subs r1, r1, r0
	movs r0, #0x2c
	muls r0, r1, r0
	adds r0, #0x34
	movs r1, #0x88
	bl DisplayUiHand
	mov r2, r8
	ldr r0, [r2, #0x14]
	adds r0, #0x2c
	ldrb r2, [r0]
	lsls r2, r2, #0x15
	movs r0, #0x80
	lsls r0, r0, #0xe
	adds r2, r2, r0
	asrs r2, r2, #0x10
	movs r0, #1
	movs r1, #0xc
	mov r3, r8
	bl sub_80AB4F4
	b _080AB26E
	.align 2, 0
_080AB248: .4byte gUnknown_08A20588
_080AB24C: .4byte gUnknown_08A20536
_080AB250:
	adds r1, #0x2c
	ldrb r0, [r1]
	cmp r0, #0xff
	beq _080AB26E
	adds r2, r0, #0
	lsls r2, r2, #0x15
	movs r1, #0x80
	lsls r1, r1, #0xe
	adds r2, r2, r1
	asrs r2, r2, #0x10
	movs r0, #1
	movs r1, #0xc
	mov r3, r8
	bl sub_80AB4F4
_080AB26E:
	mov r2, r8
	ldr r0, [r2, #0x14]
	adds r1, r0, #0
	adds r1, #0x2d
	ldrb r0, [r1]
	cmp r0, #0xff
	beq _080AB28E
	adds r1, r0, #0
	lsls r1, r1, #0x1d
	movs r0, #0x80
	lsls r0, r0, #0x16
	adds r1, r1, r0
	lsrs r1, r1, #0x18
	movs r0, #1
	bl sub_80AB514
_080AB28E:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80AB05C

	THUMB_FUNC_START sub_80AB2A0
sub_80AB2A0: @ 0x080AB2A0
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x29
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _080AB2EC
	ldr r0, [r4, #0x14]
	adds r1, r0, #0
	adds r1, #0x42
	ldrh r2, [r1]
	adds r1, r2, #0
	cmp r1, #0xff
	bhi _080AB2D4
	cmp r1, #0x20
	bne _080AB2CE
	adds r0, #0x35
	ldrb r0, [r0]
	adds r1, r4, #0
	adds r1, #0x33
	strb r0, [r1]
	b _080AB2D4
_080AB2CE:
	adds r0, r4, #0
	adds r0, #0x33
	strb r2, [r0]
_080AB2D4:
	adds r0, r4, #0
	bl sub_80AAE90
	adds r0, r4, #0
	bl sub_80AAF6C
	adds r0, r4, #0
	bl sub_80AB05C
	adds r0, r4, #0
	bl sub_80AACBC
_080AB2EC:
	adds r0, r4, #0
	bl sub_80AA9D8
	ldrh r0, [r4, #0x2a]
	bl sub_80AB56C
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80AB2A0

	THUMB_FUNC_START New6C_savedraw
New6C_savedraw: @ 0x080AB300
	push {lr}
	adds r1, r0, #0
	ldr r0, _080AB310  @ gUnknown_08A206A8
	bl Proc_Start
	pop {r1}
	bx r1
	.align 2, 0
_080AB310: .4byte gUnknown_08A206A8

	THUMB_FUNC_END New6C_savedraw

	THUMB_FUNC_START sub_80AB314
sub_80AB314: @ 0x080AB314
	adds r2, r0, #0
	adds r1, r2, #0
	adds r1, #0x36
	movs r0, #0
	strb r0, [r1]
	movs r1, #0
	strh r0, [r2, #0x2a]
	strh r0, [r2, #0x2e]
	strh r0, [r2, #0x30]
	strh r0, [r2, #0x32]
	strh r0, [r2, #0x34]
	adds r0, r2, #0
	adds r0, #0x37
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #2
	strb r1, [r0]
	subs r0, #0xe
	strb r1, [r0]
	bx lr

	THUMB_FUNC_END sub_80AB314

	THUMB_FUNC_START sub_80AB340
sub_80AB340: @ 0x080AB340
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	adds r7, r0, #0
	ldr r1, _080AB3DC  @ gUnknown_08205DE9
	add r0, sp, #4
	movs r2, #8
	bl memcpy
	ldr r0, [r7, #0x14]
	adds r0, #0x29
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _080AB368
	b _080AB4E0
_080AB368:
	ldrh r0, [r7, #0x2a]
	adds r0, #1
	strh r0, [r7, #0x2a]
	adds r3, r7, #0
	adds r3, #0x2c
	ldrb r0, [r3]
	str r3, [sp, #0xc]
	cmp r0, #3
	bhi _080AB37E
	adds r0, #1
	strb r0, [r3]
_080AB37E:
	adds r0, r7, #0
	adds r0, #0x36
	ldrb r1, [r0]
	str r0, [sp, #0x10]
	cmp r1, #0
	bne _080AB38C
	b _080AB49C
_080AB38C:
	ldrh r2, [r7, #0x32]
	ldrh r5, [r7, #0x2e]
	ldrb r0, [r3]
	cmp r0, #3
	bhi _080AB3C6
	movs r1, #0x32
	ldrsh r0, [r7, r1]
	movs r2, #0x34
	ldrsh r1, [r7, r2]
	subs r0, r0, r1
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	ldrh r3, [r7, #0x34]
	adds r0, r0, r3
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	movs r4, #0x2e
	ldrsh r0, [r7, r4]
	movs r3, #0x30
	ldrsh r1, [r7, r3]
	subs r0, r0, r1
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	ldrh r4, [r7, #0x30]
	adds r0, r0, r4
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
_080AB3C6:
	adds r0, r7, #0
	adds r0, #0x3a
	ldrb r1, [r0]
	adds r3, r0, #0
	cmp r1, #0
	bne _080AB3E0
	lsls r1, r5, #0x10
	movs r4, #0x9c
	lsls r4, r4, #0x10
	b _080AB3E6
	.align 2, 0
_080AB3DC: .4byte gUnknown_08205DE9
_080AB3E0:
	lsls r1, r5, #0x10
	movs r4, #0xb0
	lsls r4, r4, #0x10
_080AB3E6:
	adds r0, r1, r4
	lsrs r6, r0, #0x10
	ldrh r0, [r7, #0x32]
	strh r0, [r7, #0x34]
	ldrh r0, [r7, #0x2e]
	strh r0, [r7, #0x30]
	ldrb r0, [r3]
	cmp r0, #0
	bne _080AB468
	ldr r0, _080AB460  @ 0x000001FF
	mov r9, r0
	lsrs r1, r1, #0x10
	ands r1, r0
	lsls r4, r2, #0x10
	asrs r4, r4, #0x10
	ldrh r0, [r7, #0x2a]
	lsrs r0, r0, #3
	movs r2, #7
	mov r8, r2
	mov r3, r8
	ands r0, r3
	add r0, sp
	adds r0, #4
	ldrb r2, [r0]
	adds r2, r4, r2
	movs r0, #0xff
	mov sl, r0
	ands r2, r0
	movs r5, #0xc0
	lsls r5, r5, #6
	str r5, [sp]
	movs r0, #4
	ldr r3, _080AB464  @ gUnknown_08A20570
	bl PutSpriteExt
	lsls r1, r6, #0x10
	asrs r1, r1, #0x10
	mov r2, r9
	ands r1, r2
	movs r3, #0x80
	lsls r3, r3, #5
	adds r0, r3, #0
	orrs r1, r0
	ldrh r0, [r7, #0x2a]
	lsrs r0, r0, #3
	mov r2, r8
	ands r0, r2
	add r0, sp
	adds r0, #4
	ldrb r0, [r0]
	adds r4, r4, r0
	mov r3, sl
	ands r4, r3
	str r5, [sp]
	movs r0, #4
	adds r2, r4, #0
	ldr r3, _080AB464  @ gUnknown_08A20570
	bl PutSpriteExt
	b _080AB490
	.align 2, 0
_080AB460: .4byte 0x000001FF
_080AB464: .4byte gUnknown_08A20570
_080AB468:
	lsls r2, r2, #0x10
	ldrh r0, [r7, #0x2a]
	lsrs r0, r0, #3
	movs r1, #7
	ands r0, r1
	add r0, sp
	adds r0, #4
	asrs r2, r2, #0x10
	ldrb r0, [r0]
	adds r2, r2, r0
	movs r0, #0xff
	ands r2, r0
	ldr r3, _080AB498  @ gUnknown_08A20570
	movs r0, #0xc0
	lsls r0, r0, #6
	str r0, [sp]
	movs r0, #4
	movs r1, #4
	bl PutSpriteExt
_080AB490:
	movs r0, #0
	ldr r4, [sp, #0xc]
	strb r0, [r4]
	b _080AB4A8
	.align 2, 0
_080AB498: .4byte gUnknown_08A20570
_080AB49C:
	ldrb r0, [r3]
	cmp r0, #4
	bne _080AB4A8
	movs r0, #0
	ldr r1, [sp, #0x10]
	strb r0, [r1]
_080AB4A8:
	adds r4, r7, #0
	adds r4, #0x38
	ldrb r0, [r4]
	cmp r0, #0
	beq _080AB4C8
	adds r0, r7, #0
	adds r0, #0x37
	ldrb r2, [r0]
	ldr r3, _080AB4F0  @ gUnknown_08A20570
	movs r0, #0xc0
	lsls r0, r0, #6
	str r0, [sp]
	movs r0, #4
	movs r1, #6
	bl PutSpriteExt
_080AB4C8:
	adds r1, r7, #0
	adds r1, #0x39
	ldrb r0, [r1]
	cmp r0, #0
	beq _080AB4D6
	movs r0, #0
	strb r0, [r4]
_080AB4D6:
	movs r0, #0
	ldr r2, [sp, #0x10]
	strb r0, [r2]
	movs r0, #1
	strb r0, [r1]
_080AB4E0:
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080AB4F0: .4byte gUnknown_08A20570

	THUMB_FUNC_END sub_80AB340

	THUMB_FUNC_START sub_80AB4F4
sub_80AB4F4: @ 0x080AB4F4
	ldr r3, [r3, #0x34]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	subs r2, #0xc
	strh r2, [r3, #0x32]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	subs r1, #2
	strh r1, [r3, #0x2e]
	adds r2, r3, #0
	adds r2, #0x36
	movs r1, #1
	strb r1, [r2]
	adds r3, #0x3a
	strb r0, [r3]
	bx lr

	THUMB_FUNC_END sub_80AB4F4

	THUMB_FUNC_START sub_80AB514
sub_80AB514: @ 0x080AB514
	ldr r2, [r2, #0x34]
	mov ip, r2
	adds r2, #0x37
	movs r3, #0
	strb r1, [r2]
	adds r2, #1
	movs r1, #1
	strb r1, [r2]
	mov r1, ip
	adds r1, #0x3a
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x39
	strb r3, [r0]
	bx lr

	THUMB_FUNC_END sub_80AB514

	THUMB_FUNC_START sub_80AB534
sub_80AB534: @ 0x080AB534
	push {lr}
	adds r1, r0, #0
	ldr r0, _080AB544  @ gUnknown_08A206D8
	bl Proc_Start
	pop {r1}
	bx r1
	.align 2, 0
_080AB544: .4byte gUnknown_08A206D8

	THUMB_FUNC_END sub_80AB534

	THUMB_FUNC_START sub_80AB548
sub_80AB548: @ 0x080AB548
	push {lr}
	movs r2, #0
	movs r3, #0xa0
	ldr r0, _080AB568  @ gUnknown_020007E0
	movs r1, #0x13
_080AB552:
	strb r2, [r0, #0xe]
	str r3, [r0, #4]
	str r3, [r0]
	strh r2, [r0, #0xa]
	strh r2, [r0, #8]
	adds r0, #0x10
	subs r1, #1
	cmp r1, #0
	bge _080AB552
	pop {r0}
	bx r0
	.align 2, 0
_080AB568: .4byte gUnknown_020007E0

	THUMB_FUNC_END sub_80AB548

	THUMB_FUNC_START sub_80AB56C
sub_80AB56C: @ 0x080AB56C
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	mov r9, r0
	movs r0, #0
	mov r8, r0
	ldr r6, _080AB5C8  @ gUnknown_020007E0
	movs r7, #0x13
_080AB580:
	movs r0, #0xe
	ldrsb r0, [r6, r0]
	cmp r0, #0
	beq _080AB674
	ldr r2, [r6]
	adds r1, r2, #0
	adds r1, #0xc0
	ldr r0, _080AB5CC  @ 0x00000C5F
	cmp r1, r0
	bhi _080AB606
	ldr r5, [r6, #4]
	ldr r0, _080AB5D0  @ 0x000003BF
	cmp r5, r0
	bgt _080AB5DC
	adds r0, r2, #0
	movs r1, #0xc
	bl __divsi3
	adds r4, r0, #0
	ldr r0, _080AB5D4  @ 0x000001FF
	ands r4, r0
	adds r0, r5, #0
	movs r1, #0xc
	bl __divsi3
	movs r2, #0xff
	ands r2, r0
	movs r0, #0xc0
	lsls r0, r0, #6
	str r0, [sp]
	movs r0, #0xe
	adds r1, r4, #0
	ldr r3, _080AB5D8  @ gUnknown_08A20580
	bl PutSpriteExt
	b _080AB606
	.align 2, 0
_080AB5C8: .4byte gUnknown_020007E0
_080AB5CC: .4byte 0x00000C5F
_080AB5D0: .4byte 0x000003BF
_080AB5D4: .4byte 0x000001FF
_080AB5D8: .4byte gUnknown_08A20580
_080AB5DC:
	adds r0, r2, #0
	movs r1, #0xc
	bl __divsi3
	adds r4, r0, #0
	ldr r0, _080AB65C  @ 0x000001FF
	ands r4, r0
	adds r0, r5, #0
	movs r1, #0xc
	bl __divsi3
	movs r2, #0xff
	ands r2, r0
	movs r0, #0xc0
	lsls r0, r0, #6
	str r0, [sp]
	movs r0, #0xe
	adds r1, r4, #0
	ldr r3, _080AB660  @ gUnknown_08A20578
	bl PutSpriteExt
_080AB606:
	movs r2, #8
	ldrsh r1, [r6, r2]
	ldr r0, [r6]
	adds r0, r0, r1
	str r0, [r6]
	movs r0, #0xa
	ldrsh r1, [r6, r0]
	ldr r0, [r6, #4]
	adds r0, r0, r1
	str r0, [r6, #4]
	movs r0, #3
	mov r1, r9
	ands r0, r1
	cmp r0, #0
	bne _080AB638
	movs r0, #0xc
	ldrsb r0, [r6, r0]
	ldrh r2, [r6, #8]
	adds r0, r0, r2
	strh r0, [r6, #8]
	movs r0, #0xd
	ldrsb r0, [r6, r0]
	ldrh r1, [r6, #0xa]
	adds r0, r0, r1
	strh r0, [r6, #0xa]
_080AB638:
	ldr r0, [r6]
	movs r2, #0xb4
	lsls r2, r2, #3
	adds r0, r0, r2
	ldr r1, _080AB664  @ 0x0000167F
	cmp r0, r1
	bhi _080AB654
	ldr r1, [r6, #4]
	ldr r0, _080AB668  @ 0xFFFFFC40
	cmp r1, r0
	blt _080AB654
	ldr r0, _080AB66C  @ 0x00000B3F
	cmp r1, r0
	ble _080AB670
_080AB654:
	movs r0, #0
	strb r0, [r6, #0xe]
	b _080AB674
	.align 2, 0
_080AB65C: .4byte 0x000001FF
_080AB660: .4byte gUnknown_08A20578
_080AB664: .4byte 0x0000167F
_080AB668: .4byte 0xFFFFFC40
_080AB66C: .4byte 0x00000B3F
_080AB670:
	movs r0, #1
	add r8, r0
_080AB674:
	subs r7, #1
	adds r6, #0x10
	cmp r7, #0
	blt _080AB67E
	b _080AB580
_080AB67E:
	ldr r0, _080AB71C  @ gUnknown_020007E0
	mov r1, r8
	cmp r1, #0x12
	bgt _080AB70E
	adds r6, r0, #0
	movs r5, #0
	movs r7, #0x13
_080AB68C:
	movs r0, #0xe
	ldrsb r0, [r6, r0]
	cmp r0, #0
	bne _080AB706
	bl AdvanceGetLCGRNValue
	movs r1, #0xb
	bl DivRem
	cmp r0, #0
	bne _080AB706
	bl AdvanceGetLCGRNValue
	movs r1, #0x11
	bl DivRem
	adds r4, r0, #0
	bl AdvanceGetLCGRNValue
	movs r1, #0x1f
	bl DivRem
	subs r4, #8
	lsls r1, r4, #4
	subs r1, r1, r4
	lsls r1, r1, #1
	adds r1, r1, r0
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	str r0, [r6]
	movs r0, #0xf0
	lsls r0, r0, #3
	str r0, [r6, #4]
	bl AdvanceGetLCGRNValue
	movs r1, #7
	bl DivRem
	adds r0, #6
	strh r0, [r6, #8]
	bl AdvanceGetLCGRNValue
	movs r1, #0x19
	bl DivRem
	movs r2, #0x18
	negs r2, r2
	adds r1, r2, #0
	subs r1, r1, r0
	strh r1, [r6, #0xa]
	bl AdvanceGetLCGRNValue
	movs r1, #3
	bl DivRem
	adds r0, #1
	strb r0, [r6, #0xc]
	strb r5, [r6, #0xd]
	movs r0, #1
	strb r0, [r6, #0xe]
_080AB706:
	subs r7, #1
	adds r6, #0x10
	cmp r7, #0
	bge _080AB68C
_080AB70E:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080AB71C: .4byte gUnknown_020007E0

	THUMB_FUNC_END sub_80AB56C

	THUMB_FUNC_START sub_80AB720
sub_80AB720: @ 0x080AB720
	push {r4, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x40
	movs r0, #0
	strh r0, [r1]
	strh r0, [r4, #0x3e]
	ldr r1, _080AB754  @ 0x04000018
	bl sub_8014EC4
	movs r0, #0
	bl sub_8014EF4
	adds r0, r4, #0
	bl sub_80AA9D8
	ldr r0, _080AB758  @ gUnknown_03004990
	ldr r0, [r0]
	ldr r1, _080AB75C  @ 0x0000079E
	adds r0, r0, r1
	movs r1, #1
	strb r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080AB754: .4byte 0x04000018
_080AB758: .4byte gUnknown_03004990
_080AB75C: .4byte 0x0000079E

	THUMB_FUNC_END sub_80AB720

	THUMB_FUNC_START sub_80AB760
sub_80AB760: @ 0x080AB760
	push {lr}
	ldr r0, _080AB774  @ gUnknown_08A206F8
	movs r1, #3
	bl Proc_Start
	ldr r0, _080AB778  @ gUnknown_02000000
	bl sub_8014DA8
	pop {r0}
	bx r0
	.align 2, 0
_080AB774: .4byte gUnknown_08A206F8
_080AB778: .4byte gUnknown_02000000

	THUMB_FUNC_END sub_80AB760

	THUMB_FUNC_START sub_80AB77C
sub_80AB77C: @ 0x080AB77C
	push {lr}
	ldr r0, _080AB790  @ gUnknown_08A206F8
	bl Proc_EndEach
	movs r0, #0
	bl SetPrimaryHBlankHandler
	pop {r0}
	bx r0
	.align 2, 0
_080AB790: .4byte gUnknown_08A206F8

	THUMB_FUNC_END sub_80AB77C

	THUMB_FUNC_START sub_80AB794
sub_80AB794: @ 0x080AB794
	push {lr}
	ldr r0, _080AB7B0  @ gUnknown_02000920
	ldr r1, _080AB7B4  @ 0x06001000
	movs r2, #0x80
	movs r3, #4
	bl Font_InitForUI
	ldr r0, _080AB7B8  @ gUnknown_02000938
	movs r1, #0xa
	bl Text_Init
	pop {r0}
	bx r0
	.align 2, 0
_080AB7B0: .4byte gUnknown_02000920
_080AB7B4: .4byte 0x06001000
_080AB7B8: .4byte gUnknown_02000938

	THUMB_FUNC_END sub_80AB794

	THUMB_FUNC_START sub_80AB7BC
sub_80AB7BC: @ 0x080AB7BC
	push {r4, r5, lr}
	lsls r1, r1, #0x18
	cmp r1, #0
	beq _080AB820
	bl GetStringFromIndex
	adds r5, r0, #0
	ldr r0, _080AB814  @ gUnknown_02000920
	bl SetFont
	ldr r4, _080AB818  @ gUnknown_02000938
	adds r0, r4, #0
	bl Text_Clear
	adds r0, r4, #0
	movs r1, #0
	bl Text_SetXCursor
	adds r0, r4, #0
	movs r1, #0
	bl Text_SetColorId
	adds r0, r4, #0
	adds r1, r5, #0
	bl Text_AppendString
	adds r0, r4, #0
	movs r1, #0x2c
	bl Text_SetXCursor
	movs r0, #0xa1
	lsls r0, r0, #1
	bl GetStringFromIndex
	adds r1, r0, #0
	adds r0, r4, #0
	bl Text_AppendString
	ldr r1, _080AB81C  @ gUnknown_020238F6
	adds r0, r4, #0
	bl Text_Draw
	b _080AB82C
	.align 2, 0
_080AB814: .4byte gUnknown_02000920
_080AB818: .4byte gUnknown_02000938
_080AB81C: .4byte gUnknown_020238F6
_080AB820:
	ldr r0, _080AB838  @ gUnknown_020238F6
	movs r1, #0xb
	movs r2, #1
	movs r3, #0
	bl TileMap_FillRect
_080AB82C:
	movs r0, #2
	bl BG_EnableSyncByMask
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080AB838: .4byte gUnknown_020238F6

	THUMB_FUNC_END sub_80AB7BC

	THUMB_FUNC_START sub_80AB83C
sub_80AB83C: @ 0x080AB83C
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	lsls r4, r1, #0x18
	lsrs r4, r4, #0x18
	ldr r5, _080AB870  @ gUnknown_08A20720
	adds r0, #0x42
	ldrb r0, [r0]
	bl sub_80A88B8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x16
	adds r0, r0, r5
	ldr r0, [r0]
	lsls r4, r4, #0x18
	asrs r4, r4, #0x18
	adds r1, r4, #0
	bl sub_80AB7BC
	cmp r4, #0
	bne _080AB86A
	adds r0, r6, #0
	adds r0, #0x36
	strb r4, [r0]
_080AB86A:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080AB870: .4byte gUnknown_08A20720

	THUMB_FUNC_END sub_80AB83C

	THUMB_FUNC_START sub_80AB874
sub_80AB874: @ 0x080AB874
	adds r3, r0, #0
	adds r3, #0x30
	ldrb r2, [r3]
	orrs r1, r2
	strb r1, [r3]
	adds r0, #0x31
	ldrb r1, [r0]
	adds r1, #1
	strb r1, [r0]
	bx lr

	THUMB_FUNC_END sub_80AB874

	THUMB_FUNC_START sub_80AB888
sub_80AB888: @ 0x080AB888
	adds r3, r0, #0
	adds r3, #0x32
	ldrb r2, [r3]
	orrs r1, r2
	strb r1, [r3]
	adds r0, #0x33
	ldrb r1, [r0]
	adds r1, #1
	strb r1, [r0]
	bx lr

	THUMB_FUNC_END sub_80AB888

	THUMB_FUNC_START sub_80AB89C
sub_80AB89C: @ 0x080AB89C
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	movs r5, #0
	adds r0, #0x31
	strb r5, [r0]
	subs r0, #1
	strb r5, [r0]
	adds r0, #0x14
	ldrh r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #1
	cmp r1, r0
	bne _080AB8BE
	adds r0, r4, #0
	movs r1, #1
	bl sub_80AB874
_080AB8BE:
	movs r1, #0
	adds r7, r4, #0
	adds r7, #0x32
	adds r6, r4, #0
	adds r6, #0x33
	adds r2, r4, #0
	adds r2, #0x37
_080AB8CC:
	adds r0, r2, r1
	ldrb r0, [r0]
	cmp r0, #0xff
	beq _080AB8D6
	adds r5, #1
_080AB8D6:
	adds r1, #1
	cmp r1, #2
	ble _080AB8CC
	cmp r5, #0
	ble _080AB8FC
	adds r0, r4, #0
	movs r1, #2
	bl sub_80AB874
	cmp r5, #2
	bgt _080AB8F4
	adds r0, r4, #0
	movs r1, #4
	bl sub_80AB874
_080AB8F4:
	adds r0, r4, #0
	movs r1, #8
	bl sub_80AB874
_080AB8FC:
	cmp r5, #2
	bgt _080AB908
	adds r0, r4, #0
	movs r1, #0x10
	bl sub_80AB874
_080AB908:
	movs r0, #0
	strb r0, [r7]
	strb r0, [r6]
	bl sub_80A32F0
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080AB920
	adds r0, r4, #0
	movs r1, #1
	bl sub_80AB888
_080AB920:
	bl sub_80A3328
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080AB932
	adds r0, r4, #0
	movs r1, #2
	bl sub_80AB888
_080AB932:
	bl sub_80A332C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080AB944
	adds r0, r4, #0
	movs r1, #4
	bl sub_80AB888
_080AB944:
	bl sub_80A33EC
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080AB956
	adds r0, r4, #0
	movs r1, #0x10
	bl sub_80AB888
_080AB956:
	bl sub_80A341C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080AB968
	adds r0, r4, #0
	movs r1, #0x20
	bl sub_80AB888
_080AB968:
	ldrb r0, [r7]
	cmp r0, #0
	beq _080AB984
	adds r2, r4, #0
	adds r2, #0x30
	ldrb r0, [r2]
	movs r1, #0x20
	orrs r0, r1
	strb r0, [r2]
	adds r1, r4, #0
	adds r1, #0x31
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
_080AB984:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80AB89C

	THUMB_FUNC_START sub_80AB98C
sub_80AB98C: @ 0x080AB98C
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsls r2, r2, #0x18
	cmp r2, #0
	ble _080AB9CA
	movs r5, #0
	lsls r6, r1, #0x18
_080AB9A0:
	adds r0, r4, #0
	bl SaveMetadata_LoadId
	lsls r0, r0, #0x18
	cmp r0, r6
	beq _080AB9C6
	cmp r4, #2
	bne _080AB9B4
	movs r4, #0
	b _080AB9BA
_080AB9B4:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
_080AB9BA:
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #2
	bls _080AB9A0
	b _080AB9F2
_080AB9C6:
	adds r0, r4, #0
	b _080AB9F4
_080AB9CA:
	movs r5, #0
	lsls r6, r1, #0x18
_080AB9CE:
	adds r0, r4, #0
	bl SaveMetadata_LoadId
	lsls r0, r0, #0x18
	cmp r0, r6
	beq _080AB9C6
	cmp r4, #0
	bne _080AB9E2
	movs r4, #2
	b _080AB9E8
_080AB9E2:
	subs r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
_080AB9E8:
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #2
	bls _080AB9CE
_080AB9F2:
	movs r0, #0xff
_080AB9F4:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80AB98C

	THUMB_FUNC_START sub_80AB9FC
sub_80AB9FC: @ 0x080AB9FC
	push {r4, r5, lr}
	mov ip, r0
	lsls r1, r1, #0x18
	lsrs r2, r1, #0x18
	movs r1, #0
	adds r0, #0x2c
	ldrb r5, [r0]
	adds r0, #0x16
	ldrh r0, [r0]
	cmp r0, #4
	beq _080ABA34
	cmp r0, #4
	bgt _080ABA20
	cmp r0, #1
	beq _080ABA90
	cmp r0, #2
	beq _080ABA3E
	b _080ABA40
_080ABA20:
	cmp r0, #0x10
	beq _080ABA40
	cmp r0, #0x10
	bgt _080ABA2E
	cmp r0, #8
	beq _080ABA3E
	b _080ABA40
_080ABA2E:
	cmp r0, #0x80
	bne _080ABA40
	b _080ABA3E
_080ABA34:
	mov r0, ip
	adds r0, #0x2d
	ldrb r0, [r0]
	cmp r0, #0xff
	bne _080ABA40
_080ABA3E:
	movs r1, #1
_080ABA40:
	lsls r0, r2, #0x18
	adds r2, r0, #0
	cmp r2, #0
	ble _080ABA5C
	mov r0, ip
	adds r0, #0x2c
	ldrb r3, [r0]
	adds r4, r0, #0
	cmp r3, #2
	bne _080ABA58
	movs r0, #0
	b _080ABA6E
_080ABA58:
	adds r0, r3, #1
	b _080ABA6E
_080ABA5C:
	mov r0, ip
	adds r0, #0x2c
	ldrb r3, [r0]
	adds r4, r0, #0
	cmp r3, #0
	bne _080ABA6C
	movs r0, #2
	b _080ABA6E
_080ABA6C:
	subs r0, r3, #1
_080ABA6E:
	strb r0, [r4]
	mov r0, ip
	adds r0, #0x42
	ldrh r0, [r0]
	cmp r0, #0x40
	beq _080ABA8C
	ldrb r0, [r4]
	asrs r2, r2, #0x18
	bl sub_80AB98C
	strb r0, [r4]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r5, r0
	beq _080ABA90
_080ABA8C:
	movs r0, #1
	b _080ABA92
_080ABA90:
	movs r0, #0
_080ABA92:
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80AB9FC

	THUMB_FUNC_START sub_80ABA98
sub_80ABA98: @ 0x080ABA98
	push {lr}
	adds r1, r0, #0
	adds r1, #0x42
	ldrh r1, [r1]
	adds r0, #0x30
	ldrb r0, [r0]
	ands r1, r0
	cmp r1, #0
	bne _080ABAAE
	movs r0, #0
	b _080ABAB0
_080ABAAE:
	movs r0, #1
_080ABAB0:
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80ABA98

	THUMB_FUNC_START sub_80ABAB4
sub_80ABAB4: @ 0x080ABAB4
	push {r4, lr}
	mov ip, r0
	mov r2, ip
	adds r2, #0x29
	adds r0, #0x2b
	ldrb r0, [r0]
	ldrb r1, [r2]
	adds r0, r0, r1
	strb r0, [r2]
	ldr r3, _080ABB24  @ gLCDControlBuffer
	ldrb r1, [r3, #1]
	movs r0, #0x21
	negs r0, r0
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r3, #1]
	mov r0, ip
	adds r0, #0x2a
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	ble _080ABB28
	ldrb r1, [r2]
	lsls r0, r1, #1
	adds r0, r0, r1
	adds r1, r3, #0
	adds r1, #0x2f
	strb r0, [r1]
	ldrb r0, [r2]
	lsls r0, r0, #1
	adds r1, #4
	strb r0, [r1]
	ldrb r1, [r2]
	lsls r0, r1, #1
	adds r0, r0, r1
	movs r4, #0x10
	negs r4, r4
	adds r1, r4, #0
	subs r1, r1, r0
	adds r0, r3, #0
	adds r0, #0x2e
	strb r1, [r0]
	ldrb r0, [r2]
	lsls r0, r0, #1
	movs r2, #0x60
	negs r2, r2
	adds r1, r2, #0
	subs r1, r1, r0
	adds r0, r3, #0
	adds r0, #0x32
	strb r1, [r0]
	b _080ABB5E
	.align 2, 0
_080ABB24: .4byte gLCDControlBuffer
_080ABB28:
	ldrb r1, [r2]
	lsls r0, r1, #1
	adds r0, r0, r1
	movs r1, #0x78
	subs r1, r1, r0
	adds r0, r3, #0
	adds r0, #0x2f
	strb r1, [r0]
	ldrb r0, [r2]
	lsls r0, r0, #1
	movs r1, #0x50
	subs r1, r1, r0
	adds r0, r3, #0
	adds r0, #0x33
	strb r1, [r0]
	ldrb r1, [r2]
	lsls r0, r1, #1
	adds r0, r0, r1
	adds r0, #0x78
	adds r1, r3, #0
	adds r1, #0x2e
	strb r0, [r1]
	ldrb r0, [r2]
	lsls r0, r0, #1
	adds r0, #0x50
	adds r1, #4
	strb r0, [r1]
_080ABB5E:
	adds r2, r3, #0
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
	mov r0, ip
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #0x27
	bls _080ABBA8
	mov r0, ip
	bl Proc_Break
_080ABBA8:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80ABAB4

	THUMB_FUNC_START sub_80ABBB0
sub_80ABBB0: @ 0x080ABBB0
	push {r4, r5, lr}
	adds r3, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	ldr r0, _080ABBE0  @ gUnknown_08A2073C
	adds r1, r3, #0
	bl Proc_StartBlocking
	adds r2, r0, #0
	adds r2, #0x2a
	movs r1, #0
	strb r4, [r2]
	adds r2, #1
	strb r5, [r2]
	adds r0, #0x29
	strb r1, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080ABBE0: .4byte gUnknown_08A2073C

	THUMB_FUNC_END sub_80ABBB0

	THUMB_FUNC_START sub_80ABBE4
sub_80ABBE4: @ 0x080ABBE4
	push {lr}
	ldr r0, _080ABBF8  @ gBG2TilemapBuffer
	ldr r1, _080ABBFC  @ 0x06007000
	movs r2, #0x80
	lsls r2, r2, #4
	bl RegisterTileGraphics
	pop {r0}
	bx r0
	.align 2, 0
_080ABBF8: .4byte gBG2TilemapBuffer
_080ABBFC: .4byte 0x06007000

	THUMB_FUNC_END sub_80ABBE4

	THUMB_FUNC_START sub_80ABC00
sub_80ABC00: @ 0x080ABC00
	push {lr}
	adds r1, r0, #0
	ldr r0, _080ABC10  @ gUnknown_08A2075C
	bl Proc_Start
	pop {r1}
	bx r1
	.align 2, 0
_080ABC10: .4byte gUnknown_08A2075C

	THUMB_FUNC_END sub_80ABC00

	THUMB_FUNC_START sub_80ABC14
sub_80ABC14: @ 0x080ABC14
	push {r4, r5, r6, r7, lr}
	sub sp, #0x120
	adds r7, r1, #0
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	adds r6, r5, #0
	cmp r5, #2
	bls _080ABC26
	b _080ABD48
_080ABC26:
	adds r0, r5, #0
	bl SaveMetadata_LoadId
	lsls r0, r0, #0x18
	asrs r2, r0, #0x18
	cmp r2, #0
	beq _080ABD04
	adds r0, r5, #0
	mov r1, sp
	bl LoadSavedChapterState
	mov r0, sp
	movs r2, #0xe
	ldrsb r2, [r0, r2]
	ldrb r1, [r0, #0x14]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	bne _080ABC6C
	mov r0, sp
	adds r0, #0x4a
	ldrb r1, [r0]
	movs r0, #0xe
	ands r0, r1
	cmp r0, #8
	bne _080ABC6C
	add r4, sp, #0x4c
	adds r0, r5, #0
	adds r1, r4, #0
	bl LoadSavedWMStuff
	adds r0, r4, #0
	bl sub_80BD224
	adds r2, r0, #0
_080ABC6C:
	mov r0, sp
	movs r4, #0xe
	ldrsb r4, [r0, r4]
	movs r5, #0
	strb r2, [r0, #0xe]
	bl sub_8089768
	adds r1, r7, #0
	adds r1, #0x37
	adds r1, r1, r6
	strb r0, [r1]
	mov r0, sp
	strb r4, [r0, #0xe]
	lsls r1, r6, #2
	adds r0, r7, #0
	adds r0, #0x48
	adds r0, r0, r1
	ldr r1, [sp]
	str r1, [r0]
	adds r0, r7, #0
	adds r0, #0x3a
	adds r4, r0, r6
	strb r5, [r4]
	adds r0, r6, #0
	bl CheckChapterCompleted
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080ABCAE
	ldrb r0, [r4]
	movs r1, #1
	orrs r0, r1
	strb r0, [r4]
_080ABCAE:
	adds r0, r6, #0
	bl LoadSavedEid8A
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080ABCC2
	ldrb r0, [r4]
	movs r1, #2
	orrs r0, r1
	strb r0, [r4]
_080ABCC2:
	mov r0, sp
	ldrb r1, [r0, #0x14]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _080ABCD6
	ldrb r0, [r4]
	movs r1, #4
	orrs r0, r1
	strb r0, [r4]
_080ABCD6:
	ldr r0, _080ABCF8  @ gUnknown_02000940
	adds r0, r6, r0
	mov r1, sp
	ldrb r1, [r1, #0x14]
	strb r1, [r0]
	ldr r0, _080ABCFC  @ gUnknown_02000944
	adds r0, r6, r0
	mov r1, sp
	ldrb r1, [r1, #0x1b]
	strb r1, [r0]
	lsls r1, r6, #3
	ldr r0, _080ABD00  @ gUnknown_02000948
	adds r1, r1, r0
	add r0, sp, #0x40
	ldm r0!, {r2, r3}
	stm r1!, {r2, r3}
	b _080ABD7E
	.align 2, 0
_080ABCF8: .4byte gUnknown_02000940
_080ABCFC: .4byte gUnknown_02000944
_080ABD00: .4byte gUnknown_02000948
_080ABD04:
	adds r0, r7, #0
	adds r0, #0x37
	adds r0, r0, r6
	movs r1, #0xff
	strb r1, [r0]
	adds r0, r7, #0
	adds r0, #0x3a
	adds r0, r0, r6
	strb r2, [r0]
	lsls r1, r6, #2
	adds r0, r7, #0
	adds r0, #0x48
	adds r0, r0, r1
	str r2, [r0]
	ldr r0, _080ABD3C  @ gUnknown_02000940
	adds r0, r6, r0
	strb r2, [r0]
	ldr r0, _080ABD40  @ gUnknown_02000944
	adds r0, r6, r0
	strb r2, [r0]
	lsls r0, r6, #3
	ldr r1, _080ABD44  @ gUnknown_02000948
	adds r0, r0, r1
	movs r1, #0
	movs r2, #8
	bl memset
	b _080ABD7E
	.align 2, 0
_080ABD3C: .4byte gUnknown_02000940
_080ABD40: .4byte gUnknown_02000944
_080ABD44: .4byte gUnknown_02000948
_080ABD48:
	adds r4, r7, #0
	adds r4, #0x44
	ldrh r1, [r4]
	movs r0, #0x80
	lsls r0, r0, #1
	cmp r1, r0
	bne _080ABD7E
	movs r0, #3
	bl sub_80A5DA8
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080ABD7A
	movs r0, #3
	mov r1, sp
	bl sub_80A5DFC
	mov r0, sp
	ldrb r0, [r0, #0xc]
	adds r1, r7, #0
	adds r1, #0x3f
	strb r0, [r1]
	ldr r0, [sp]
	str r0, [r7, #0x54]
	b _080ABD7E
_080ABD7A:
	movs r0, #0xf0
	strh r0, [r4]
_080ABD7E:
	add sp, #0x120
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80ABC14

	THUMB_FUNC_START sub_80ABD88
sub_80ABD88: @ 0x080ABD88
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	movs r6, #0
	movs r7, #0x40
_080ABD98:
	ldr r0, _080ABDE0  @ gUnknown_02000940
	adds r0, r6, r0
	ldrb r1, [r0]
	adds r0, r7, #0
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	negs r0, r0
	asrs r5, r0, #0x1f
	movs r0, #4
	ands r5, r0
	ldr r1, _080ABDE4  @ gUnknown_02000948
	lsls r0, r6, #3
	adds r0, r0, r1
	ldrb r0, [r0, #2]
	lsls r0, r0, #0x1a
	cmp r0, #0
	blt _080ABDEC
	ldr r0, _080ABDE8  @ gUnknown_02000944
	adds r0, r6, r0
	ldrb r1, [r0]
	cmp r1, #1
	bne _080ABDCA
	movs r0, #0x10
	orrs r5, r0
_080ABDCA:
	cmp r1, #2
	bne _080ABDD6
	movs r0, #0x20
	orrs r5, r0
	lsls r0, r5, #0x18
	lsrs r5, r0, #0x18
_080ABDD6:
	cmp r1, #3
	bne _080ABDFE
_080ABDDA:
	orrs r5, r7
	b _080ABDFE
	.align 2, 0
_080ABDE0: .4byte gUnknown_02000940
_080ABDE4: .4byte gUnknown_02000948
_080ABDE8: .4byte gUnknown_02000944
_080ABDEC:
	ldr r0, _080ABE38  @ gUnknown_02000944
	adds r0, r6, r0
	ldrb r0, [r0]
	cmp r0, #3
	beq _080ABDDA
	movs r0, #0x20
	orrs r5, r0
	lsls r0, r5, #0x18
	lsrs r5, r0, #0x18
_080ABDFE:
	cmp r6, r8
	beq _080ABE0A
	movs r0, #2
	orrs r5, r0
	lsls r0, r5, #0x18
	lsrs r5, r0, #0x18
_080ABE0A:
	movs r1, #1
	adds r0, r5, #0
	orrs r0, r1
	lsls r4, r6, #1
	adds r1, r4, #0
	adds r1, #0x1a
	bl sub_80895B4
	adds r4, #0x1b
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_80895B4
	adds r6, #1
	cmp r6, #2
	ble _080ABD98
	bl EnablePaletteSync
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080ABE38: .4byte gUnknown_02000944

	THUMB_FUNC_END sub_80ABD88

	THUMB_FUNC_START sub_80ABE3C
sub_80ABE3C: @ 0x080ABE3C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r5, r0, #0
	str r1, [sp]
	asrs r5, r5, #1
	movs r0, #0x1f
	ands r5, r0
	cmp r5, #0x10
	ble _080ABE5E
	movs r0, #0xf
	ands r0, r5
	movs r1, #0x10
	subs r5, r1, r0
_080ABE5E:
	movs r2, #0
_080ABE60:
	ldr r1, _080ABE90  @ gUnknown_02000940
	adds r0, r2, r1
	ldrb r1, [r0]
	movs r0, #0x40
	ands r0, r1
	adds r1, r2, #1
	str r1, [sp, #4]
	cmp r0, #0
	beq _080ABF22
	lsls r0, r2, #6
	movs r1, #0xa0
	lsls r1, r1, #1
	adds r0, r0, r1
	ldr r1, _080ABE94  @ gUnknown_02022ABA
	adds r0, r0, r1
	mov r8, r0
	ldr r0, [sp]
	cmp r2, r0
	bne _080ABEA0
	ldr r1, _080ABE98  @ gUnknown_08A07AEA
	mov ip, r1
	ldr r6, _080ABE9C  @ gUnknown_08A07BEA
	b _080ABEA6
	.align 2, 0
_080ABE90: .4byte gUnknown_02000940
_080ABE94: .4byte gUnknown_02022ABA
_080ABE98: .4byte gUnknown_08A07AEA
_080ABE9C: .4byte gUnknown_08A07BEA
_080ABEA0:
	ldr r0, _080ABF3C  @ gUnknown_08A07B0A
	mov ip, r0
	ldr r6, _080ABF40  @ gUnknown_08A07C0A
_080ABEA6:
	adds r2, #1
	str r2, [sp, #4]
	movs r0, #0x10
	subs r7, r0, r5
	movs r1, #0xf8
	lsls r1, r1, #7
	mov sl, r1
	movs r0, #6
	mov r9, r0
_080ABEB8:
	mov r1, ip
	ldrh r4, [r1]
	movs r0, #0x1f
	ands r0, r4
	adds r2, r0, #0
	muls r2, r5, r2
	ldrh r3, [r6]
	movs r0, #0x1f
	ands r0, r3
	muls r0, r7, r0
	adds r2, r2, r0
	asrs r2, r2, #4
	movs r0, #0x1f
	ands r2, r0
	movs r0, #0xf8
	lsls r0, r0, #2
	ands r0, r4
	adds r1, r0, #0
	muls r1, r5, r1
	movs r0, #0xf8
	lsls r0, r0, #2
	ands r0, r3
	muls r0, r7, r0
	adds r1, r1, r0
	asrs r1, r1, #4
	movs r0, #0xf8
	lsls r0, r0, #2
	ands r1, r0
	adds r2, r2, r1
	mov r0, sl
	ands r0, r4
	adds r1, r0, #0
	muls r1, r5, r1
	mov r0, sl
	ands r0, r3
	muls r0, r7, r0
	adds r1, r1, r0
	asrs r1, r1, #4
	mov r0, sl
	ands r1, r0
	adds r2, r2, r1
	mov r1, r8
	strh r2, [r1]
	movs r0, #2
	add r8, r0
	add ip, r0
	adds r6, #2
	movs r1, #1
	negs r1, r1
	add r9, r1
	mov r0, r9
	cmp r0, #0
	bge _080ABEB8
_080ABF22:
	ldr r2, [sp, #4]
	cmp r2, #2
	ble _080ABE60
	bl EnablePaletteSync
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080ABF3C: .4byte gUnknown_08A07B0A
_080ABF40: .4byte gUnknown_08A07C0A

	THUMB_FUNC_END sub_80ABE3C

	THUMB_FUNC_START sub_80ABF44
sub_80ABF44: @ 0x080ABF44
	push {r4, lr}
	adds r4, r1, #0
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	movs r1, #0
	movs r2, #1
	cmp r2, r3
	bge _080ABF6A
	adds r0, r4, #0
	adds r0, #0x30
	ldrb r4, [r0]
_080ABF5A:
	adds r0, r4, #0
	ands r0, r2
	cmp r0, #0
	beq _080ABF64
	adds r1, #1
_080ABF64:
	lsls r2, r2, #1
	cmp r2, r3
	blt _080ABF5A
_080ABF6A:
	lsls r0, r1, #0x18
	lsrs r0, r0, #0x18
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80ABF44

	THUMB_FUNC_START sub_80ABF74
sub_80ABF74: @ 0x080ABF74
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	movs r1, #0x60
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	beq _080ABF94
	ldr r6, _080ABF90  @ 0x06014000
	movs r2, #0xe
	movs r4, #2
	b _080ABFA6
	.align 2, 0
_080ABF90: .4byte 0x06014000
_080ABF94:
	movs r0, #0x10
	ands r0, r3
	cmp r0, #0
	beq _080ABFA2
	ldr r6, _080ABFD4  @ 0x06014800
	movs r2, #0xe
	movs r4, #2
_080ABFA2:
	cmp r4, #0
	ble _080ABFC8
_080ABFA6:
	lsls r7, r2, #3
	ldr r5, _080ABFD8  @ 0x060121C0
	ldr r0, _080ABFDC  @ 0x001FFFFF
	mov r8, r0
_080ABFAE:
	adds r0, r6, #0
	adds r1, r5, #0
	mov r2, r8
	ands r2, r7
	bl CpuFastSet
	movs r0, #0x80
	lsls r0, r0, #3
	adds r6, r6, r0
	adds r5, r5, r0
	subs r4, #1
	cmp r4, #0
	bne _080ABFAE
_080ABFC8:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080ABFD4: .4byte 0x06014800
_080ABFD8: .4byte 0x060121C0
_080ABFDC: .4byte 0x001FFFFF

	THUMB_FUNC_END sub_80ABF74

	THUMB_FUNC_START sub_80ABFE0
sub_80ABFE0: @ 0x080ABFE0
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r4, r6, #0
	adds r4, #0x38
	movs r5, #4
_080ABFEA:
	adds r0, r4, #0
	bl Text_Clear
	adds r4, #8
	subs r5, #1
	cmp r5, #0
	bge _080ABFEA
	adds r4, r6, #0
	adds r4, #0x38
	ldr r1, _080AC020  @ gUnknown_08A20A08
	adds r0, r6, #0
	adds r0, #0x30
	ldrb r0, [r0]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	bl GetStringFromIndex
_080AC00E:
	adds r1, r0, #0
_080AC010:
	ldrb r0, [r1]
	cmp r0, #0
	beq _080AC02C
	cmp r0, #1
	bne _080AC024
	adds r4, #8
	adds r1, #1
	b _080AC010
	.align 2, 0
_080AC020: .4byte gUnknown_08A20A08
_080AC024:
	adds r0, r4, #0
	bl Text_AppendChar
	b _080AC00E
_080AC02C:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80ABFE0

	THUMB_FUNC_START sub_80AC034
sub_80AC034: @ 0x080AC034
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r4, _080AC070  @ gUnknown_02022E76
	adds r0, r4, #0
	movs r1, #0xe
	movs r2, #0xa
	movs r3, #0
	bl TileMap_FillRect
	movs r6, #0xe0
	lsls r6, r6, #1
	adds r5, #0x38
	ldr r0, _080AC074  @ 0xFFFFFE56
	adds r7, r4, r0
	movs r4, #4
_080AC052:
	adds r1, r6, r7
	adds r0, r5, #0
	bl Text_Draw
	adds r6, #0x80
	adds r5, #8
	subs r4, #1
	cmp r4, #0
	bge _080AC052
	movs r0, #1
	bl BG_EnableSyncByMask
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080AC070: .4byte gUnknown_02022E76
_080AC074: .4byte 0xFFFFFE56

	THUMB_FUNC_END sub_80AC034

	THUMB_FUNC_START sub_80AC078
sub_80AC078: @ 0x080AC078
	ldr r0, [r0, #0x14]
	ldr r0, [r0, #0x58]
	adds r0, #0x29
	movs r1, #1
	strb r1, [r0]
	bx lr

	THUMB_FUNC_END sub_80AC078

	THUMB_FUNC_START InitDifficultySelectScreen
InitDifficultySelectScreen: @ 0x080AC084
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	bl Font_ResetAllocation
	bl LoadUiFrameGraphics
	bl Font_InitForUIDefault
	adds r4, r7, #0
	adds r4, #0x38
	movs r5, #4
_080AC09A:
	adds r0, r4, #0
	movs r1, #0xe
	bl Text_Init
	adds r4, #8
	subs r5, #1
	cmp r5, #0
	bge _080AC09A
	movs r6, #0
	ldr r0, _080AC178  @ gUnknown_08A25DCC
	movs r4, #0x80
	lsls r4, r4, #1
	adds r1, r4, #0
	adds r2, r4, #0
	bl CopyToPaletteBuffer
	ldr r0, _080AC17C  @ gUnknown_08A268D8
	movs r1, #0xe0
	movs r2, #0x20
	bl CopyToPaletteBuffer
	ldr r0, _080AC180  @ Pal_SaveScreenSprits
	movs r1, #0x90
	lsls r1, r1, #2
	adds r2, r4, #0
	bl CopyToPaletteBuffer
	ldr r0, _080AC184  @ gUnknown_08A295B4
	movs r1, #0x40
	movs r2, #0x20
	bl CopyToPaletteBuffer
	ldr r0, _080AC188  @ Img_DifficultyMenuObjs
	ldr r1, _080AC18C  @ 0x06010800
	bl CopyDataWithPossibleUncomp
	ldr r0, _080AC190  @ Pal_DifficultyMenuObjs
	movs r1, #0x88
	lsls r1, r1, #2
	movs r2, #0xa0
	lsls r2, r2, #1
	bl CopyToPaletteBuffer
	bl EnablePaletteSync
	ldr r0, [r7, #0x14]
	ldr r0, [r0, #0x58]
	adds r0, #0x29
	strb r6, [r0]
	ldr r0, _080AC194  @ gBG0TilemapBuffer
	movs r1, #0
	bl BG_Fill
	ldr r4, _080AC198  @ gBG1TilemapBuffer
	adds r0, r4, #0
	movs r1, #0
	bl BG_Fill
	ldr r0, _080AC19C  @ gUnknown_08A29558
	ldr r5, _080AC1A0  @ gGenericBuffer
	adds r1, r5, #0
	bl CopyDataWithPossibleUncomp
	movs r0, #0xd1
	lsls r0, r0, #1
	adds r4, r4, r0
	movs r2, #0x80
	lsls r2, r2, #5
	adds r0, r4, #0
	adds r1, r5, #0
	bl CallARM_FillTileRect
	adds r0, r7, #0
	bl sub_80ABFE0
	adds r0, r7, #0
	bl sub_80AC034
	movs r0, #3
	bl BG_EnableSyncByMask
	adds r0, r7, #0
	bl sub_80AC698
	str r0, [r7, #0x34]
	adds r1, r7, #0
	adds r1, #0x30
	strb r6, [r1]
	ldr r0, [r7, #0x34]
	adds r0, #0x2b
	strb r6, [r0]
	ldr r2, [r7, #0x34]
	ldr r3, _080AC1A4  @ gUnknown_08A209FC
	ldrb r0, [r1]
	lsls r0, r0, #2
	adds r0, r0, r3
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	strh r0, [r2, #0x2c]
	ldr r2, [r7, #0x34]
	ldrb r0, [r1]
	lsls r0, r0, #2
	adds r0, r0, r3
	ldrb r0, [r0, #1]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	strh r0, [r2, #0x2e]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080AC178: .4byte gUnknown_08A25DCC
_080AC17C: .4byte gUnknown_08A268D8
_080AC180: .4byte Pal_SaveScreenSprits
_080AC184: .4byte gUnknown_08A295B4
_080AC188: .4byte Img_DifficultyMenuObjs
_080AC18C: .4byte 0x06010800
_080AC190: .4byte Pal_DifficultyMenuObjs
_080AC194: .4byte gBG0TilemapBuffer
_080AC198: .4byte gBG1TilemapBuffer
_080AC19C: .4byte gUnknown_08A29558
_080AC1A0: .4byte gGenericBuffer
_080AC1A4: .4byte gUnknown_08A209FC

	THUMB_FUNC_END InitDifficultySelectScreen

	THUMB_FUNC_START sub_80AC1A8
sub_80AC1A8: @ 0x080AC1A8
	push {lr}
	adds r2, r0, #0
	adds r2, #0x30
	movs r1, #0
	strb r1, [r2]
	str r1, [r0, #0x2c]
	bl InitDifficultySelectScreen
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80AC1A8

	THUMB_FUNC_START sub_80AC1BC
sub_80AC1BC: @ 0x080AC1BC
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x2c]
	adds r4, r0, #1
	str r4, [r5, #0x2c]
	ldr r3, _080AC228  @ gLCDControlBuffer
	ldrb r0, [r3, #1]
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
	strb r0, [r3, #1]
	movs r1, #0x10
	subs r1, r1, r4
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #4
	muls r0, r1, r0
	cmp r0, #0
	bge _080AC1F2
	adds r0, #0xff
_080AC1F2:
	asrs r0, r0, #8
	movs r1, #0x50
	subs r1, r1, r0
	adds r2, r3, #0
	adds r2, #0x2d
	movs r0, #0
	strb r0, [r2]
	movs r0, #0x50
	subs r0, r0, r1
	adds r2, #4
	strb r0, [r2]
	subs r2, #5
	movs r0, #0xf0
	strb r0, [r2]
	adds r1, #0x50
	adds r0, r3, #0
	adds r0, #0x30
	strb r1, [r0]
	cmp r4, #0x10
	bne _080AC220
	adds r0, r5, #0
	bl Proc_Break
_080AC220:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080AC228: .4byte gLCDControlBuffer

	THUMB_FUNC_END sub_80AC1BC

	THUMB_FUNC_START sub_80AC22C
sub_80AC22C: @ 0x080AC22C
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x2c]
	adds r4, r0, #1
	str r4, [r5, #0x2c]
	movs r1, #0x10
	subs r1, r1, r4
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #4
	muls r0, r1, r0
	cmp r0, #0
	bge _080AC248
	adds r0, #0xff
_080AC248:
	asrs r0, r0, #8
	movs r2, #0x50
	subs r2, r2, r0
	ldr r3, _080AC284  @ gLCDControlBuffer
	adds r1, r3, #0
	adds r1, #0x2d
	movs r0, #0
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x31
	strb r2, [r0]
	subs r1, #1
	movs r0, #0xf0
	strb r0, [r1]
	movs r1, #0x60
	negs r1, r1
	adds r0, r1, #0
	subs r0, r0, r2
	adds r1, r3, #0
	adds r1, #0x30
	strb r0, [r1]
	cmp r4, #0x10
	bne _080AC27C
	adds r0, r5, #0
	bl Proc_Break
_080AC27C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080AC284: .4byte gLCDControlBuffer

	THUMB_FUNC_END sub_80AC22C

	THUMB_FUNC_START sub_80AC288
sub_80AC288: @ 0x080AC288
	push {r4, lr}
	adds r4, r0, #0
	movs r2, #0
	ldr r0, _080AC2AC  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _080AC2B8
	adds r1, r4, #0
	adds r1, #0x30
	ldrb r0, [r1]
	cmp r0, #0
	bne _080AC2B0
	movs r0, #2
	b _080AC2B2
	.align 2, 0
_080AC2AC: .4byte gKeyStatusPtr
_080AC2B0:
	subs r0, #1
_080AC2B2:
	strb r0, [r1]
	movs r2, #1
	b _080AC2D8
_080AC2B8:
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _080AC2D4
	adds r1, r4, #0
	adds r1, #0x30
	ldrb r0, [r1]
	cmp r0, #2
	bne _080AC2CE
	strb r2, [r1]
	b _080AC2D2
_080AC2CE:
	adds r0, #1
	strb r0, [r1]
_080AC2D2:
	movs r2, #1
_080AC2D4:
	cmp r2, #0
	beq _080AC324
_080AC2D8:
	ldr r0, _080AC31C  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080AC2EA
	movs r0, #0x66
	bl m4aSongNumStart
_080AC2EA:
	ldr r0, [r4, #0x34]
	adds r2, r4, #0
	adds r2, #0x30
	ldrb r1, [r2]
	adds r0, #0x2b
	strb r1, [r0]
	ldr r0, [r4, #0x34]
	ldr r1, _080AC320  @ gUnknown_08A209FC
	ldrb r2, [r2]
	lsls r2, r2, #2
	adds r2, r2, r1
	movs r1, #0
	ldrsb r1, [r2, r1]
	ldrb r2, [r2, #1]
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	bl sub_80AC680
	adds r0, r4, #0
	bl sub_80ABFE0
	adds r0, r4, #0
	bl sub_80AC034
	b _080AC3CC
	.align 2, 0
_080AC31C: .4byte gRAMChapterData
_080AC320: .4byte gUnknown_08A209FC
_080AC324:
	ldr r0, [r4, #0x34]
	adds r0, #0x29
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0
	bne _080AC3CC
	ldr r0, _080AC36C  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #9
	ands r0, r1
	cmp r0, #0
	beq _080AC398
	str r2, [r4, #0x2c]
	ldr r0, _080AC370  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080AC358
	movs r0, #0x6a
	bl m4aSongNumStart
_080AC358:
	adds r0, r4, #0
	adds r0, #0x30
	ldrb r0, [r0]
	cmp r0, #1
	beq _080AC37E
	cmp r0, #1
	bgt _080AC374
	cmp r0, #0
	beq _080AC37A
	b _080AC390
	.align 2, 0
_080AC36C: .4byte gKeyStatusPtr
_080AC370: .4byte gRAMChapterData
_080AC374:
	cmp r0, #2
	beq _080AC388
	b _080AC390
_080AC37A:
	movs r0, #0
	b _080AC380
_080AC37E:
	movs r0, #1
_080AC380:
	movs r1, #0
	bl savemenu_SetDifficultyChoice
	b _080AC390
_080AC388:
	movs r0, #2
	movs r1, #0
	bl savemenu_SetDifficultyChoice
_080AC390:
	adds r0, r4, #0
	movs r1, #1
	bl Proc_Goto
_080AC398:
	ldr r0, _080AC3D4  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080AC3CC
	movs r0, #0
	str r0, [r4, #0x2c]
	ldr r0, _080AC3D8  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080AC3BC
	movs r0, #0x6b
	bl m4aSongNumStart
_080AC3BC:
	movs r0, #3
	movs r1, #0
	bl savemenu_SetDifficultyChoice
	adds r0, r4, #0
	movs r1, #2
	bl Proc_Goto
_080AC3CC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080AC3D4: .4byte gKeyStatusPtr
_080AC3D8: .4byte gRAMChapterData

	THUMB_FUNC_END sub_80AC288

	THUMB_FUNC_START nullsub_64
nullsub_64: @ 0x080AC3DC
	bx lr

	THUMB_FUNC_END nullsub_64

	THUMB_FUNC_START NewNewGameDifficultySelect
NewNewGameDifficultySelect: @ 0x080AC3E0
	push {lr}
	adds r1, r0, #0
	ldr r0, _080AC3F0  @ ProcScr_NewGameDiffilcultySelect
	bl Proc_StartBlocking
	pop {r0}
	bx r0
	.align 2, 0
_080AC3F0: .4byte ProcScr_NewGameDiffilcultySelect

	THUMB_FUNC_END NewNewGameDifficultySelect

	THUMB_FUNC_START sub_80AC3F4
sub_80AC3F4: @ 0x080AC3F4
	adds r2, r0, #0
	adds r3, r2, #0
	adds r3, #0x29
	ldrb r1, [r3]
	movs r0, #2
	negs r0, r0
	ands r0, r1
	movs r1, #3
	negs r1, r1
	ands r0, r1
	strb r0, [r3]
	adds r1, r2, #0
	adds r1, #0x2a
	movs r0, #0
	strb r0, [r1]
	strh r0, [r2, #0x2e]
	strh r0, [r2, #0x2c]
	bx lr

	THUMB_FUNC_END sub_80AC3F4

	THUMB_FUNC_START sub_80AC418
sub_80AC418: @ 0x080AC418
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	adds r4, r6, #0
	adds r4, #0x29
	ldrb r1, [r4]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080AC452
	ldrh r0, [r6, #0x34]
	ldrh r2, [r6, #0x30]
	subs r0, r0, r2
	movs r3, #0
	strh r0, [r6, #0x38]
	ldrh r0, [r6, #0x36]
	ldrh r1, [r6, #0x32]
	subs r0, r0, r1
	strh r0, [r6, #0x3a]
	strh r2, [r6, #0x2c]
	strh r1, [r6, #0x2e]
	strh r3, [r6, #0x3c]
	ldrb r1, [r4]
	movs r0, #2
	negs r0, r0
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	strb r0, [r4]
_080AC452:
	ldrb r1, [r4]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080AC4B8
	ldrh r0, [r6, #0x3c]
	adds r0, #1
	strh r0, [r6, #0x3c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #3
	bgt _080AC4A6
	movs r1, #0x3c
	ldrsh r0, [r6, r1]
	movs r1, #4
	movs r2, #0
	bl sub_800B84C
	adds r4, r0, #0
	movs r5, #0x80
	lsls r5, r5, #5
	movs r3, #0x38
	ldrsh r0, [r6, r3]
	adds r1, r0, #0
	muls r1, r4, r1
	adds r0, r5, #0
	bl DivArm
	ldrh r1, [r6, #0x30]
	adds r1, r1, r0
	strh r1, [r6, #0x2c]
	movs r1, #0x3a
	ldrsh r0, [r6, r1]
	adds r1, r0, #0
	muls r1, r4, r1
	adds r0, r5, #0
	bl DivArm
	ldrh r1, [r6, #0x32]
	adds r1, r1, r0
	strh r1, [r6, #0x2e]
	b _080AC4B8
_080AC4A6:
	ldrh r0, [r6, #0x34]
	strh r0, [r6, #0x2c]
	ldrh r0, [r6, #0x36]
	strh r0, [r6, #0x2e]
	ldrb r1, [r4]
	movs r0, #3
	negs r0, r0
	ands r0, r1
	strb r0, [r4]
_080AC4B8:
	movs r3, #0x2c
	ldrsh r1, [r6, r3]
	ldr r3, _080AC4F0  @ gUnknown_08A20B14
	adds r0, r6, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	lsrs r0, r0, #3
	movs r2, #7
	ands r0, r2
	adds r0, r0, r3
	movs r3, #0x2e
	ldrsh r2, [r6, r3]
	ldrb r0, [r0]
	adds r2, r2, r0
	movs r0, #0xff
	ands r2, r0
	ldr r3, _080AC4F4  @ gUnknown_08A20A98
	movs r0, #0xc0
	lsls r0, r0, #6
	str r0, [sp]
	movs r0, #4
	bl PutSpriteExt
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080AC4F0: .4byte gUnknown_08A20B14
_080AC4F4: .4byte gUnknown_08A20A98

	THUMB_FUNC_END sub_80AC418

	THUMB_FUNC_START sub_80AC4F8
sub_80AC4F8: @ 0x080AC4F8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov ip, r0
	lsls r1, r1, #0x18
	lsrs r3, r1, #0x18
	movs r2, #0
	ldr r7, _080AC530  @ gPaletteBuffer
	ldr r0, _080AC534  @ gUnknown_08A28088
	mov r8, r0
	lsls r0, r3, #6
	ldr r1, _080AC538  @ 0x000002A2
	adds r0, r0, r1
	adds r6, r0, r7
	lsls r1, r3, #6
	ldr r0, _080AC53C  @ 0x000002C2
	adds r4, r7, r0
	ldr r0, _080AC540  @ gUnknown_08A2949A
	adds r5, r1, r0
_080AC522:
	cmp r2, r3
	bne _080AC544
	ldrh r0, [r5]
	strh r0, [r6]
	lsls r1, r2, #5
	b _080AC550
	.align 2, 0
_080AC530: .4byte gPaletteBuffer
_080AC534: .4byte gUnknown_08A28088
_080AC538: .4byte 0x000002A2
_080AC53C: .4byte 0x000002C2
_080AC540: .4byte gUnknown_08A2949A
_080AC544:
	lsls r0, r2, #6
	ldr r1, _080AC580  @ gUnknown_08A294BA
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r4]
	lsls r1, r3, #5
_080AC550:
	adds r4, #0x40
	adds r2, #1
	cmp r2, #2
	ble _080AC522
	movs r0, #0x3f
	mov r2, ip
	ands r0, r2
	lsrs r0, r0, #2
	ldr r2, _080AC584  @ 0x00000151
	adds r1, r1, r2
	lsls r1, r1, #1
	adds r1, r1, r7
	lsls r0, r0, #1
	add r0, r8
	ldrh r0, [r0]
	strh r0, [r1]
	bl EnablePaletteSync
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080AC580: .4byte gUnknown_08A294BA
_080AC584: .4byte 0x00000151

	THUMB_FUNC_END sub_80AC4F8

	THUMB_FUNC_START sub_80AC588
sub_80AC588: @ 0x080AC588
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r6, r0, #0
	adds r1, r6, #0
	adds r1, #0x2a
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldr r3, _080AC600  @ gUnknown_08A20AA0
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [sp]
	movs r0, #4
	movs r1, #0x38
	movs r2, #4
	bl PutSpriteExt
	ldr r3, _080AC604  @ gUnknown_08A20AAE
	movs r0, #0x80
	lsls r0, r0, #7
	str r0, [sp]
	movs r0, #4
	movs r1, #0x38
	movs r2, #4
	bl PutSpriteExt
	movs r5, #0
	movs r0, #0x2b
	adds r0, r0, r6
	mov sl, r0
	movs r1, #6
	mov r9, r1
	movs r2, #5
	mov r8, r2
	movs r7, #0xc0
	lsls r7, r7, #0xe
_080AC5D8:
	lsrs r4, r7, #0x10
	adds r0, r6, #0
	adds r0, #0x2b
	ldrb r0, [r0]
	cmp r5, r0
	bne _080AC60C
	lsls r4, r4, #0x10
	asrs r2, r4, #0x10
	movs r0, #0xf
	mov r1, r8
	ands r0, r1
	lsls r0, r0, #0xc
	str r0, [sp]
	movs r0, #4
	movs r1, #8
	ldr r3, _080AC608  @ gUnknown_08A20AC2
	bl PutSpriteExt
	b _080AC624
	.align 2, 0
_080AC600: .4byte gUnknown_08A20AA0
_080AC604: .4byte gUnknown_08A20AAE
_080AC608: .4byte gUnknown_08A20AC2
_080AC60C:
	lsls r4, r4, #0x10
	asrs r2, r4, #0x10
	movs r0, #0xf
	mov r1, r9
	ands r0, r1
	lsls r0, r0, #0xc
	str r0, [sp]
	movs r0, #4
	movs r1, #8
	ldr r3, _080AC678  @ gUnknown_08A20AC2
	bl PutSpriteExt
_080AC624:
	asrs r2, r4, #0x10
	ldr r1, _080AC67C  @ gUnknown_08A20B08
	lsls r0, r5, #2
	adds r0, r0, r1
	ldr r3, [r0]
	movs r0, #0x80
	lsls r0, r0, #7
	str r0, [sp]
	movs r0, #4
	movs r4, #0x80
	lsls r4, r4, #0xc
	asrs r1, r4, #0x10
	bl PutSpriteExt
	movs r0, #2
	add r9, r0
	add r8, r0
	movs r1, #0x80
	lsls r1, r1, #0xe
	adds r7, r7, r1
	adds r5, #1
	cmp r5, #2
	ble _080AC5D8
	adds r0, r6, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	mov r2, sl
	ldrb r1, [r2]
	bl sub_80AC4F8
	adds r0, r6, #0
	bl sub_80AC418
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080AC678: .4byte gUnknown_08A20AC2
_080AC67C: .4byte gUnknown_08A20B08

	THUMB_FUNC_END sub_80AC588

	THUMB_FUNC_START sub_80AC680
sub_80AC680: @ 0x080AC680
	ldrh r3, [r0, #0x2c]
	strh r3, [r0, #0x30]
	ldrh r3, [r0, #0x2e]
	strh r3, [r0, #0x32]
	strh r1, [r0, #0x34]
	strh r2, [r0, #0x36]
	adds r0, #0x29
	ldrb r1, [r0]
	movs r2, #1
	orrs r1, r2
	strb r1, [r0]
	bx lr

	THUMB_FUNC_END sub_80AC680

	THUMB_FUNC_START sub_80AC698
sub_80AC698: @ 0x080AC698
	push {lr}
	adds r1, r0, #0
	ldr r0, _080AC6A8  @ gUnknown_08A20B1C
	bl Proc_Start
	pop {r1}
	bx r1
	.align 2, 0
_080AC6A8: .4byte gUnknown_08A20B1C

	THUMB_FUNC_END sub_80AC698

	THUMB_FUNC_START sub_80AC6AC
sub_80AC6AC: @ 0x080AC6AC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x20
	str r0, [sp]
	str r1, [sp, #4]
	mov r9, r2
	mov sl, r3
	ldr r3, [sp, #0x40]
	ldr r0, _080AC780  @ 0xFFFFFC00
	adds r0, r0, r3
	mov r8, r0
	mov r1, r8
	muls r1, r0, r1
	lsls r5, r3, #1
	movs r6, #0x80
	lsls r6, r6, #3
	adds r0, r5, r6
	muls r0, r1, r0
	asrs r1, r0, #0x1f
	adds r4, r3, #0
	muls r4, r3, r4
	movs r2, #0xc0
	lsls r2, r2, #4
	subs r2, r2, r5
	muls r4, r2, r4
	asrs r5, r4, #0x1f
	subs r6, r6, r3
	adds r2, r6, #0
	muls r2, r6, r2
	muls r2, r3, r2
	str r2, [sp, #0x18]
	asrs r2, r2, #0x1f
	str r2, [sp, #0x1c]
	mov r2, r8
	muls r2, r3, r2
	muls r2, r3, r2
	str r2, [sp, #8]
	asrs r2, r2, #0x1f
	str r2, [sp, #0xc]
	ldr r2, [sp, #4]
	asrs r3, r2, #0x1f
	bl __muldi3
	str r0, [sp, #0x10]
	str r1, [sp, #0x14]
	mov r2, r9
	asrs r3, r2, #0x1f
	adds r1, r5, #0
	adds r0, r4, #0
	bl __muldi3
	ldr r2, [sp, #0x10]
	ldr r3, [sp, #0x14]
	adds r2, r2, r0
	adcs r3, r1
	str r2, [sp, #0x10]
	str r3, [sp, #0x14]
	mov r3, r9
	ldr r6, [sp]
	subs r3, r3, r6
	mov r9, r3
	asrs r0, r3, #1
	adds r2, r0, #0
	mov r0, r9
	asrs r3, r0, #0x1f
	ldr r0, [sp, #0x18]
	ldr r1, [sp, #0x1c]
	bl __muldi3
	ldr r2, [sp, #0x10]
	ldr r3, [sp, #0x14]
	adds r2, r2, r0
	adcs r3, r1
	str r2, [sp, #0x10]
	str r3, [sp, #0x14]
	mov r3, sl
	ldr r6, [sp, #4]
	subs r3, r3, r6
	mov sl, r3
	asrs r0, r3, #1
	adds r2, r0, #0
	mov r0, sl
	asrs r3, r0, #0x1f
	ldr r0, [sp, #8]
	ldr r1, [sp, #0xc]
	bl __muldi3
	ldr r2, [sp, #0x10]
	ldr r3, [sp, #0x14]
	adds r0, r0, r2
	adcs r1, r3
	lsls r3, r1, #2
	lsrs r2, r0, #0x1e
	adds r0, r3, #0
	orrs r0, r2
	add sp, #0x20
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080AC780: .4byte 0xFFFFFC00

	THUMB_FUNC_END sub_80AC6AC

	THUMB_FUNC_START sub_80AC784
sub_80AC784: @ 0x080AC784
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x18
	mov sl, r0
	mov r9, r1
	adds r6, r2, #0
	mov r8, r3
	ldr r2, [sp, #0x38]
	lsls r3, r2, #1
	adds r3, r3, r2
	lsls r0, r3, #1
	adds r4, r2, #0
	muls r4, r0, r4
	lsls r5, r3, #0xb
	subs r0, r4, r5
	asrs r1, r0, #0x1f
	subs r4, r5, r4
	str r4, [sp]
	asrs r4, r4, #0x1f
	str r4, [sp, #4]
	muls r3, r2, r3
	lsls r4, r2, #0xc
	subs r4, r3, r4
	movs r5, #0x80
	lsls r5, r5, #0xd
	adds r4, r4, r5
	asrs r5, r4, #0x1f
	lsls r2, r2, #0xb
	subs r2, r3, r2
	str r2, [sp, #8]
	asrs r2, r2, #0x1f
	str r2, [sp, #0xc]
	mov r2, r9
	asrs r3, r2, #0x1f
	bl __muldi3
	str r0, [sp, #0x10]
	str r1, [sp, #0x14]
	adds r2, r6, #0
	asrs r3, r6, #0x1f
	ldr r0, [sp]
	ldr r1, [sp, #4]
	bl __muldi3
	ldr r2, [sp, #0x10]
	ldr r3, [sp, #0x14]
	adds r2, r2, r0
	adcs r3, r1
	str r2, [sp, #0x10]
	str r3, [sp, #0x14]
	mov r3, sl
	subs r6, r6, r3
	asrs r0, r6, #1
	adds r2, r0, #0
	asrs r3, r6, #0x1f
	adds r1, r5, #0
	adds r0, r4, #0
	bl __muldi3
	ldr r2, [sp, #0x10]
	ldr r3, [sp, #0x14]
	adds r2, r2, r0
	adcs r3, r1
	str r2, [sp, #0x10]
	str r3, [sp, #0x14]
	mov r3, r8
	mov r5, r9
	subs r3, r3, r5
	mov r8, r3
	asrs r0, r3, #1
	adds r2, r0, #0
	mov r7, r8
	asrs r3, r7, #0x1f
	ldr r0, [sp, #8]
	ldr r1, [sp, #0xc]
	bl __muldi3
	ldr r2, [sp, #0x10]
	ldr r3, [sp, #0x14]
	adds r0, r0, r2
	adcs r1, r3
	lsls r3, r1, #0xc
	lsrs r2, r0, #0x14
	adds r0, r3, #0
	orrs r0, r2
	add sp, #0x18
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80AC784

	THUMB_FUNC_START sub_80AC844
sub_80AC844: @ 0x080AC844
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov sl, r0
	adds r5, r1, #0
	adds r4, r2, #0
	ldr r0, [sp, #0x24]
	mov r8, r0
	ldr r7, [sp, #0x28]
	ldr r1, [sp, #0x2c]
	mov r9, r1
	movs r0, #3
	ands r0, r3
	bl BG_GetMapBuffer
	str r0, [sp]
	lsls r4, r4, #5
	adds r4, r4, r5
	lsls r4, r4, #1
	add sl, r4
	mov r2, r8
	cmp r2, #0
	bge _080AC886
	add r9, r8
	lsls r0, r2, #1
	mov r1, sl
	subs r1, r1, r0
	mov sl, r1
	movs r2, #0
	mov r8, r2
_080AC886:
	cmp r7, #0
	bge _080AC89A
	ldr r0, [sp, #0x30]
	adds r0, r0, r7
	str r0, [sp, #0x30]
	lsls r0, r7, #6
	mov r1, sl
	subs r1, r1, r0
	mov sl, r1
	movs r7, #0
_080AC89A:
	movs r1, #0
	cmp r7, #0x1f
	bgt _080AC8F4
	ldr r2, [sp, #0x30]
	cmp r1, r2
	bge _080AC8F4
_080AC8A6:
	movs r5, #0
	adds r4, r1, #1
	mov r0, r8
	cmp r0, #0x1f
	bgt _080AC8E6
	cmp r5, r9
	bge _080AC8E6
	adds r0, r7, r1
	movs r2, #0x1f
	mov ip, r2
	ands r0, r2
	lsls r6, r0, #5
	mov r2, r8
	lsls r0, r1, #6
	mov r1, sl
	adds r3, r0, r1
_080AC8C6:
	adds r0, r2, #0
	mov r1, ip
	ands r0, r1
	adds r0, r6, r0
	lsls r0, r0, #1
	ldr r1, [sp]
	adds r0, r0, r1
	ldrh r1, [r3]
	strh r1, [r0]
	adds r2, #1
	adds r3, #2
	adds r5, #1
	cmp r2, #0x1f
	bgt _080AC8E6
	cmp r5, r9
	blt _080AC8C6
_080AC8E6:
	adds r1, r4, #0
	adds r0, r7, r4
	cmp r0, #0x1f
	bgt _080AC8F4
	ldr r2, [sp, #0x30]
	cmp r4, r2
	blt _080AC8A6
_080AC8F4:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80AC844

	THUMB_FUNC_START sub_80AC904
sub_80AC904: @ 0x080AC904
	push {r4, r5, r6, lr}
	movs r2, #0
	adds r4, r0, #0
	adds r4, #0x3c
	movs r3, #0
	movs r6, #0xf0
	adds r1, r0, #0
	adds r1, #0x2c
	movs r5, #0xa0
_080AC916:
	adds r0, r4, r2
	strb r3, [r0]
	strb r3, [r1]
	strb r3, [r1, #1]
	strb r6, [r1, #2]
	strb r5, [r1, #3]
	adds r1, #4
	adds r2, #1
	cmp r2, #3
	ble _080AC916
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80AC904

	THUMB_FUNC_START sub_80AC930
sub_80AC930: @ 0x080AC930
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r6, r0, #0
	movs r7, #0
	adds r4, r6, #0
	adds r4, #0x2c
_080AC93C:
	adds r0, r6, #0
	adds r0, #0x3c
	adds r0, r0, r7
	ldrb r5, [r0]
	movs r0, #1
	ands r0, r5
	cmp r0, #0
	beq _080AC9AA
	lsls r0, r7, #1
	adds r1, r6, #0
	adds r1, #0x40
	adds r1, r1, r0
	movs r2, #0
	ldrsh r3, [r1, r2]
	adds r1, r6, #0
	adds r1, #0x48
	adds r1, r1, r0
	movs r0, #0
	ldrsh r2, [r1, r0]
	ldrb r0, [r4]
	cmp r3, r0
	blt _080AC9AA
	ldrb r0, [r4, #2]
	cmp r3, r0
	bge _080AC9AA
	ldrb r0, [r4, #1]
	cmp r2, r0
	blt _080AC9AA
	ldrb r0, [r4, #3]
	cmp r2, r0
	bge _080AC9AA
	movs r0, #2
	ands r0, r5
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0
	beq _080AC99C
	adds r1, r3, #0
	subs r1, #0xc
	movs r0, #0
	str r0, [sp]
	movs r0, #3
	ldr r3, _080AC998  @ gUnknown_08A20B44
	bl PutSprite
	b _080AC9AA
	.align 2, 0
_080AC998: .4byte gUnknown_08A20B44
_080AC99C:
	adds r1, r3, #0
	subs r1, #0xc
	str r0, [sp]
	movs r0, #3
	ldr r3, _080AC9BC  @ gUnknown_08A20B3C
	bl PutSprite
_080AC9AA:
	adds r4, #4
	adds r7, #1
	cmp r7, #3
	ble _080AC93C
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080AC9BC: .4byte gUnknown_08A20B3C

	THUMB_FUNC_END sub_80AC930

	THUMB_FUNC_START sub_80AC9C0
sub_80AC9C0: @ 0x080AC9C0
	push {lr}
	adds r1, r0, #0
	ldr r0, _080AC9D0  @ gUnknown_08A20B4C
	bl Proc_Start
	pop {r1}
	bx r1
	.align 2, 0
_080AC9D0: .4byte gUnknown_08A20B4C

	THUMB_FUNC_END sub_80AC9C0

	THUMB_FUNC_START sub_80AC9D4
sub_80AC9D4: @ 0x080AC9D4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	adds r7, r1, #0
	mov r8, r2
	lsls r3, r3, #0x18
	lsrs r6, r3, #0x18
	ldr r0, _080ACA38  @ gUnknown_08A20B4C
	bl Proc_Find
	adds r4, r0, #0
	cmp r4, #0
	beq _080ACA2E
	adds r1, r4, #0
	adds r1, #0x3c
	adds r1, r1, r5
	movs r3, #1
	movs r0, #1
	strb r0, [r1]
	lsls r2, r5, #1
	adds r0, r4, #0
	adds r0, #0x40
	adds r0, r0, r2
	strh r7, [r0]
	adds r0, r4, #0
	adds r0, #0x48
	adds r0, r0, r2
	mov r2, r8
	strh r2, [r0]
	adds r0, r6, #0
	orrs r0, r3
	strb r0, [r1]
	movs r0, #2
	ands r0, r6
	cmp r0, #0
	beq _080ACA2E
	ldr r0, _080ACA3C  @ gUnknown_0859EDB0
	ldr r1, _080ACA40  @ 0x060100C0
	bl CopyDataWithPossibleUncomp
	ldr r0, _080ACA44  @ gUnknown_0859EDEC
	ldr r1, _080ACA48  @ 0x060104C0
	bl CopyDataWithPossibleUncomp
_080ACA2E:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080ACA38: .4byte gUnknown_08A20B4C
_080ACA3C: .4byte gUnknown_0859EDB0
_080ACA40: .4byte 0x060100C0
_080ACA44: .4byte gUnknown_0859EDEC
_080ACA48: .4byte 0x060104C0

	THUMB_FUNC_END sub_80AC9D4

	THUMB_FUNC_START sub_80ACA4C
sub_80ACA4C: @ 0x080ACA4C
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	adds r7, r3, #0
	ldr r0, _080ACA80  @ gUnknown_08A20B4C
	bl Proc_Find
	adds r1, r0, #0
	cmp r1, #0
	beq _080ACA7A
	lsls r0, r4, #2
	adds r1, r1, r0
	adds r0, r1, #0
	adds r0, #0x2c
	strb r5, [r0]
	adds r0, #1
	strb r6, [r0]
	adds r0, #1
	strb r7, [r0]
	adds r1, #0x2f
	ldr r0, [sp, #0x14]
	strb r0, [r1]
_080ACA7A:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080ACA80: .4byte gUnknown_08A20B4C

	THUMB_FUNC_END sub_80ACA4C

	THUMB_FUNC_START sub_80ACA84
sub_80ACA84: @ 0x080ACA84
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080ACAA0  @ gUnknown_08A20B4C
	bl Proc_Find
	cmp r0, #0
	beq _080ACA9A
	adds r0, #0x3c
	adds r0, r0, r4
	movs r1, #0
	strb r1, [r0]
_080ACA9A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080ACAA0: .4byte gUnknown_08A20B4C

	THUMB_FUNC_END sub_80ACA84

	THUMB_FUNC_START sub_80ACAA4
sub_80ACAA4: @ 0x080ACAA4
	push {lr}
	ldr r0, _080ACAC4  @ gUnknown_08A20B4C
	bl Proc_Find
	cmp r0, #0
	beq _080ACAC0
	adds r1, r0, #0
	adds r1, #0x3c
	movs r2, #0
	adds r0, #0x43
_080ACAB8:
	strb r2, [r0]
	subs r0, #1
	cmp r0, r1
	bge _080ACAB8
_080ACAC0:
	pop {r0}
	bx r0
	.align 2, 0
_080ACAC4: .4byte gUnknown_08A20B4C

	THUMB_FUNC_END sub_80ACAA4

	THUMB_FUNC_START sub_80ACAC8
sub_80ACAC8: @ 0x080ACAC8
	push {lr}
	ldr r0, _080ACAE0  @ gUnknown_08A20B4C
	bl Proc_Find
	cmp r0, #0
	beq _080ACADA
	movs r1, #1
	bl Proc_Goto
_080ACADA:
	pop {r0}
	bx r0
	.align 2, 0
_080ACAE0: .4byte gUnknown_08A20B4C

	THUMB_FUNC_END sub_80ACAC8

	THUMB_FUNC_START sub_80ACAE4
sub_80ACAE4: @ 0x080ACAE4
	push {lr}
	ldr r0, _080ACAFC  @ gUnknown_08A20B4C
	bl Proc_Find
	cmp r0, #0
	beq _080ACAF6
	movs r1, #0
	bl Proc_Goto
_080ACAF6:
	pop {r0}
	bx r0
	.align 2, 0
_080ACAFC: .4byte gUnknown_08A20B4C

	THUMB_FUNC_END sub_80ACAE4

	THUMB_FUNC_START sub_80ACB00
sub_80ACB00: @ 0x080ACB00
	push {lr}
	ldr r0, _080ACB10  @ gUnknown_08A20B4C
	bl Proc_Find
	bl Proc_End
	pop {r0}
	bx r0
	.align 2, 0
_080ACB10: .4byte gUnknown_08A20B4C

	THUMB_FUNC_END sub_80ACB00

	THUMB_FUNC_START sub_80ACB14
sub_80ACB14: @ 0x080ACB14
	movs r1, #0
	str r1, [r0, #0x2c]
	adds r2, r0, #0
	adds r2, #0x54
	strh r1, [r2]
	str r1, [r0, #0x4c]
	str r1, [r0, #0x44]
	str r1, [r0, #0x3c]
	str r1, [r0, #0x34]
	str r1, [r0, #0x50]
	str r1, [r0, #0x48]
	str r1, [r0, #0x40]
	str r1, [r0, #0x38]
	str r1, [r0, #0x30]
	bx lr

	THUMB_FUNC_END sub_80ACB14

	THUMB_FUNC_START sub_80ACB34
sub_80ACB34: @ 0x080ACB34
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r5, r0, #0
	ldr r7, [r5, #0x34]
	ldr r0, [r5, #0x3c]
	mov r8, r0
	ldr r1, [r5, #0x38]
	mov r9, r1
	ldr r2, [r5, #0x40]
	mov sl, r2
	ldr r0, [r5, #0x44]
	adds r0, #1
	str r0, [r5, #0x44]
	ldr r0, [r5, #0x48]
	adds r0, #1
	str r0, [r5, #0x48]
	movs r6, #0
_080ACB5E:
	lsls r3, r6, #2
	adds r0, r5, #0
	adds r0, #0x4c
	adds r2, r0, r3
	ldr r0, [r2]
	adds r4, r5, #0
	adds r4, #0x44
	cmp r0, #0
	beq _080ACB7E
	adds r0, r4, r3
	ldr r1, [r0]
	adds r1, #3
	str r1, [r0]
	ldr r0, [r2]
	adds r0, #1
	str r0, [r2]
_080ACB7E:
	adds r1, r4, r3
	ldr r0, [r1]
	asrs r0, r0, #3
	cmp r0, #5
	ble _080ACB8C
	movs r0, #0
	str r0, [r1]
_080ACB8C:
	adds r6, #1
	cmp r6, #1
	ble _080ACB5E
	ldr r3, [r5, #0x2c]
	cmp r3, #0
	bne _080ACC20
	ldr r2, [r5, #0x4c]
	cmp r2, #0
	beq _080ACBAC
	asrs r2, r2, #3
	subs r1, r2, #4
	ldr r0, [r5, #0x34]
	adds r7, r0, r1
	cmp r2, #4
	bne _080ACBAC
	str r3, [r5, #0x4c]
_080ACBAC:
	ldr r2, [r5, #0x50]
	cmp r2, #0
	beq _080ACBC4
	asrs r2, r2, #3
	subs r1, r2, #4
	ldr r0, [r5, #0x38]
	subs r0, r0, r1
	mov r9, r0
	cmp r2, #4
	bne _080ACBC4
	movs r0, #0
	str r0, [r5, #0x50]
_080ACBC4:
	ldr r0, [r5, #0x30]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _080ACBEE
	ldr r1, _080ACCD4  @ 0x000001FF
	ands r1, r7
	movs r2, #0xff
	mov r0, r8
	ands r2, r0
	ldr r3, _080ACCD8  @ gUnknown_08A20B7C
	adds r4, r5, #0
	adds r4, #0x54
	ldr r0, [r5, #0x44]
	asrs r0, r0, #3
	ldrh r4, [r4]
	adds r0, r0, r4
	str r0, [sp]
	movs r0, #0xd
	bl PutSpriteExt
_080ACBEE:
	ldr r0, [r5, #0x30]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	beq _080ACC20
	ldr r1, _080ACCD4  @ 0x000001FF
	mov r2, r9
	ands r1, r2
	movs r0, #0x80
	lsls r0, r0, #5
	adds r1, r1, r0
	movs r2, #0xff
	mov r0, sl
	ands r2, r0
	ldr r3, _080ACCD8  @ gUnknown_08A20B7C
	adds r4, r5, #0
	adds r4, #0x54
	ldr r0, [r5, #0x48]
	asrs r0, r0, #3
	ldrh r4, [r4]
	adds r0, r0, r4
	str r0, [sp]
	movs r0, #0xd
	bl PutSpriteExt
_080ACC20:
	ldr r0, [r5, #0x2c]
	cmp r0, #1
	bne _080ACCC2
	ldr r2, [r5, #0x4c]
	cmp r2, #0
	beq _080ACC3E
	asrs r2, r2, #3
	subs r1, r2, #4
	ldr r0, [r5, #0x3c]
	adds r0, r0, r1
	mov r8, r0
	cmp r2, #4
	bne _080ACC3E
	movs r0, #0
	str r0, [r5, #0x4c]
_080ACC3E:
	ldr r2, [r5, #0x50]
	cmp r2, #0
	beq _080ACC56
	asrs r2, r2, #3
	subs r1, r2, #4
	ldr r0, [r5, #0x40]
	subs r0, r0, r1
	mov sl, r0
	cmp r2, #4
	bne _080ACC56
	movs r0, #0
	str r0, [r5, #0x50]
_080ACC56:
	ldr r0, [r5, #0x30]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _080ACC88
	ldr r0, _080ACCD4  @ 0x000001FF
	ands r7, r0
	movs r0, #0xff
	mov r1, r8
	ands r1, r0
	mov r8, r1
	ldr r3, _080ACCDC  @ gUnknown_08A20B8A
	adds r1, r5, #0
	adds r1, #0x54
	ldr r0, [r5, #0x44]
	asrs r0, r0, #3
	lsls r0, r0, #1
	ldrh r1, [r1]
	adds r0, r0, r1
	str r0, [sp]
	movs r0, #0xd
	adds r1, r7, #0
	mov r2, r8
	bl PutSpriteExt
_080ACC88:
	ldr r0, [r5, #0x30]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	beq _080ACCC2
	ldr r0, _080ACCD4  @ 0x000001FF
	mov r2, r9
	ands r2, r0
	mov r9, r2
	movs r1, #0x80
	lsls r1, r1, #6
	add r1, r9
	movs r0, #0xff
	mov r2, sl
	ands r2, r0
	mov sl, r2
	ldr r3, _080ACCDC  @ gUnknown_08A20B8A
	adds r2, r5, #0
	adds r2, #0x54
	ldr r0, [r5, #0x48]
	asrs r0, r0, #3
	lsls r0, r0, #1
	ldrh r2, [r2]
	adds r0, r0, r2
	str r0, [sp]
	movs r0, #0xd
	mov r2, sl
	bl PutSpriteExt
_080ACCC2:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080ACCD4: .4byte 0x000001FF
_080ACCD8: .4byte gUnknown_08A20B7C
_080ACCDC: .4byte gUnknown_08A20B8A

	THUMB_FUNC_END sub_80ACB34

	THUMB_FUNC_START sub_80ACCE0
sub_80ACCE0: @ 0x080ACCE0
	push {lr}
	adds r1, r0, #0
	ldr r0, _080ACCF0  @ gUnknown_08A20B94
	bl Proc_Start
	pop {r1}
	bx r1
	.align 2, 0
_080ACCF0: .4byte gUnknown_08A20B94

	THUMB_FUNC_END sub_80ACCE0

	THUMB_FUNC_START sub_80ACCF4
sub_80ACCF4: @ 0x080ACCF4
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r4, r1, #0
	adds r7, r2, #0
	ldr r0, _080ACD4C  @ gUnknown_08A20B94
	bl Proc_Find
	adds r5, r0, #0
	cmp r5, #0
	beq _080ACD44
	ldr r0, _080ACD50  @ Pal_MapBattleInfoNum
	adds r1, r7, #0
	adds r1, #0x10
	lsls r1, r1, #5
	movs r2, #0x20
	bl CopyToPaletteBuffer
	cmp r6, #0
	bne _080ACD24
	ldr r0, _080ACD54  @ gUnknown_08A1C7D8
	ldr r2, _080ACD58  @ 0x06010000
	adds r1, r4, r2
	bl CopyDataWithPossibleUncomp
_080ACD24:
	cmp r6, #1
	bne _080ACD32
	ldr r0, _080ACD5C  @ gUnknown_08A1C704
	ldr r2, _080ACD58  @ 0x06010000
	adds r1, r4, r2
	bl CopyDataWithPossibleUncomp
_080ACD32:
	asrs r1, r4, #5
	movs r2, #0xf
	ands r2, r7
	lsls r2, r2, #0xc
	adds r1, r1, r2
	adds r2, r5, #0
	adds r2, #0x54
	strh r1, [r2]
	str r6, [r5, #0x2c]
_080ACD44:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080ACD4C: .4byte gUnknown_08A20B94
_080ACD50: .4byte Pal_MapBattleInfoNum
_080ACD54: .4byte gUnknown_08A1C7D8
_080ACD58: .4byte 0x06010000
_080ACD5C: .4byte gUnknown_08A1C704

	THUMB_FUNC_END sub_80ACCF4

	THUMB_FUNC_START sub_80ACD60
sub_80ACD60: @ 0x080ACD60
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080ACD78  @ gUnknown_08A20B94
	bl Proc_Find
	cmp r0, #0
	beq _080ACD70
	str r4, [r0, #0x30]
_080ACD70:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080ACD78: .4byte gUnknown_08A20B94

	THUMB_FUNC_END sub_80ACD60

	THUMB_FUNC_START sub_80ACD7C
sub_80ACD7C: @ 0x080ACD7C
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	adds r7, r3, #0
	ldr r0, _080ACDA0  @ gUnknown_08A20B94
	bl Proc_Find
	cmp r0, #0
	beq _080ACD98
	str r4, [r0, #0x34]
	str r5, [r0, #0x3c]
	str r6, [r0, #0x38]
	str r7, [r0, #0x40]
_080ACD98:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080ACDA0: .4byte gUnknown_08A20B94

	THUMB_FUNC_END sub_80ACD7C

	THUMB_FUNC_START sub_80ACDA4
sub_80ACDA4: @ 0x080ACDA4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080ACDD8  @ gUnknown_08A20B94
	bl Proc_Find
	adds r1, r0, #0
	cmp r1, #0
	beq _080ACDD2
	cmp r4, #0
	bne _080ACDBC
	movs r0, #1
	str r0, [r1, #0x4c]
_080ACDBC:
	cmp r4, #1
	bne _080ACDC2
	str r4, [r1, #0x50]
_080ACDC2:
	cmp r4, #2
	bne _080ACDCA
	movs r0, #1
	str r0, [r1, #0x4c]
_080ACDCA:
	cmp r4, #3
	bne _080ACDD2
	movs r0, #1
	str r0, [r1, #0x50]
_080ACDD2:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080ACDD8: .4byte gUnknown_08A20B94

	THUMB_FUNC_END sub_80ACDA4

	THUMB_FUNC_START sub_80ACDDC
sub_80ACDDC: @ 0x080ACDDC
	push {lr}
	ldr r0, _080ACDEC  @ gUnknown_08A20B94
	bl Proc_Find
	bl Proc_End
	pop {r0}
	bx r0
	.align 2, 0
_080ACDEC: .4byte gUnknown_08A20B94

	THUMB_FUNC_END sub_80ACDDC

	THUMB_FUNC_START sub_80ACDF0
sub_80ACDF0: @ 0x080ACDF0
	movs r1, #0
	str r1, [r0, #0x30]
	bx lr

	THUMB_FUNC_END sub_80ACDF0

	THUMB_FUNC_START sub_80ACDF8
sub_80ACDF8: @ 0x080ACDF8
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x30]
	ldr r0, [r4, #0x2c]
	cmp r1, r0
	blt _080ACE12
	ldr r0, [r4, #0x14]
	ldr r1, [r4, #0x34]
	bl _call_via_r1
	adds r0, r4, #0
	bl Proc_Break
_080ACE12:
	ldr r0, [r4, #0x30]
	adds r0, #1
	str r0, [r4, #0x30]
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80ACDF8

	THUMB_FUNC_START sub_80ACE20
sub_80ACE20: @ 0x080ACE20
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	adds r1, r2, #0
	ldr r0, _080ACE38  @ gUnknown_08A20BB4
	bl Proc_Start
	str r4, [r0, #0x2c]
	str r5, [r0, #0x34]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080ACE38: .4byte gUnknown_08A20BB4

	THUMB_FUNC_END sub_80ACE20

	THUMB_FUNC_START sub_80ACE3C
sub_80ACE3C: @ 0x080ACE3C
	push {lr}
	movs r2, #0
	movs r1, #3
	adds r0, #0x4d
_080ACE44:
	strb r2, [r0]
	subs r0, #1
	subs r1, #1
	cmp r1, #0
	bge _080ACE44
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80ACE3C

	THUMB_FUNC_START sub_80ACE54
sub_80ACE54: @ 0x080ACE54
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x34
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	ldr r1, [sp, #4]
	adds r1, #0x4e
	str r1, [sp, #0x14]
_080ACE6C:
	ldr r0, [sp, #4]
	adds r0, #0x4a
	ldr r2, [sp, #8]
	adds r0, r0, r2
	ldrb r0, [r0]
	adds r2, #1
	str r2, [sp, #0x1c]
	cmp r0, #0
	bne _080ACE80
	b _080AD188
_080ACE80:
	ldr r0, [sp, #4]
	adds r0, #0x3e
	ldr r3, [sp, #8]
	adds r3, r3, r0
	mov r9, r3
	movs r1, #0
	ldrsb r1, [r3, r1]
	str r0, [sp, #0x30]
	cmp r1, #1
	bgt _080ACE96
	b _080AD188
_080ACE96:
	ldr r0, [sp, #4]
	adds r0, #0x3a
	ldr r1, [sp, #8]
	adds r7, r0, r1
	movs r1, #0
	ldrsb r1, [r7, r1]
	str r0, [sp, #0x2c]
	cmp r1, #1
	bgt _080ACEAA
	b _080AD188
_080ACEAA:
	ldr r2, [sp, #8]
	lsls r2, r2, #1
	mov r8, r2
	ldr r3, [sp, #4]
	adds r3, #0x2a
	str r3, [sp, #0xc]
	adds r6, r3, #0
	add r6, r8
	ldrh r1, [r6]
	movs r2, #0x80
	lsls r2, r2, #5
	adds r0, r2, #0
	orrs r1, r0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	ldr r3, [sp, #4]
	adds r3, #0x32
	str r3, [sp, #0x10]
	adds r5, r3, #0
	add r5, r8
	movs r0, #0
	ldrsh r2, [r5, r0]
	ldr r0, [sp, #0x14]
	ldrh r3, [r0]
	ldr r0, [sp, #4]
	adds r0, #0x42
	str r0, [sp, #0x18]
	adds r4, r0, #0
	add r4, r8
	ldrh r0, [r4]
	adds r3, r3, r0
	adds r3, #4
	str r3, [sp]
	movs r0, #0xd
	ldr r3, _080ACFD4  @ gObject_8x8
	bl PutSpriteExt
	movs r2, #0
	ldrsh r1, [r6, r2]
	mov r3, r9
	movs r0, #0
	ldrsb r0, [r3, r0]
	subs r0, #1
	lsls r0, r0, #3
	adds r1, r1, r0
	movs r0, #0
	ldrsh r2, [r5, r0]
	ldr r3, [sp, #0x14]
	ldrh r0, [r3]
	ldrh r3, [r4]
	adds r0, r0, r3
	adds r0, #4
	str r0, [sp]
	movs r0, #0xd
	ldr r3, _080ACFD4  @ gObject_8x8
	bl PutSpriteExt
	ldrh r1, [r6]
	movs r2, #0xc0
	lsls r2, r2, #6
	adds r0, r2, #0
	orrs r1, r0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r3, #0
	ldrsh r2, [r5, r3]
	movs r0, #0
	ldrsb r0, [r7, r0]
	subs r0, #1
	lsls r0, r0, #3
	adds r2, r2, r0
	ldr r3, [sp, #0x14]
	ldrh r0, [r3]
	ldrh r3, [r4]
	adds r0, r0, r3
	adds r0, #4
	str r0, [sp]
	movs r0, #0xd
	ldr r3, _080ACFD4  @ gObject_8x8
	bl PutSpriteExt
	movs r0, #0
	ldrsh r1, [r6, r0]
	mov r2, r9
	movs r0, #0
	ldrsb r0, [r2, r0]
	subs r0, #1
	lsls r0, r0, #3
	adds r1, r1, r0
	movs r0, #0x80
	lsls r0, r0, #6
	orrs r1, r0
	movs r3, #0
	ldrsh r2, [r5, r3]
	movs r0, #0
	ldrsb r0, [r7, r0]
	subs r0, #1
	lsls r0, r0, #3
	adds r2, r2, r0
	ldr r3, [sp, #0x14]
	ldrh r0, [r3]
	ldrh r3, [r4]
	adds r0, r0, r3
	adds r0, #4
	str r0, [sp]
	movs r0, #0xd
	ldr r3, _080ACFD4  @ gObject_8x8
	bl PutSpriteExt
	mov r1, r9
	movs r0, #0
	ldrsb r0, [r1, r0]
	subs r4, r0, #2
	movs r2, #0
	ldrsh r7, [r5, r2]
	movs r3, #0
	ldrsh r0, [r6, r3]
	adds r5, r0, #0
	adds r5, #8
	mov sl, r8
	ldr r0, [sp, #0xc]
	str r0, [sp, #0x24]
	ldr r1, [sp, #0x10]
	str r1, [sp, #0x28]
	ldr r2, [sp, #4]
	adds r2, #0x4e
	mov r8, r2
	ldr r6, [sp, #0x18]
	cmp r4, #3
	ble _080ACFFA
_080ACFAE:
	mov r3, r8
	ldrh r0, [r3]
	mov r2, sl
	adds r1, r6, r2
	ldrh r1, [r1]
	adds r0, r0, r1
	str r0, [sp]
	movs r0, #0xd
	adds r1, r5, #0
	adds r2, r7, #0
	ldr r3, _080ACFD8  @ gObject_32x8
	bl PutSpriteExt
	adds r5, #0x20
	subs r4, #4
	cmp r4, #3
	bgt _080ACFAE
	b _080ACFFA
	.align 2, 0
_080ACFD4: .4byte gObject_8x8
_080ACFD8: .4byte gObject_32x8
_080ACFDC:
	mov r3, r8
	ldrh r0, [r3]
	mov r2, sl
	adds r1, r6, r2
	ldrh r1, [r1]
	adds r0, r0, r1
	str r0, [sp]
	movs r0, #0xd
	adds r1, r5, #0
	adds r2, r7, #0
	ldr r3, _080AD080  @ gObject_16x8
	bl PutSpriteExt
	adds r5, #0x10
	subs r4, #2
_080ACFFA:
	cmp r4, #1
	bgt _080ACFDC
	cmp r4, #0
	ble _080AD024
_080AD002:
	mov r3, r8
	ldrh r0, [r3]
	mov r2, sl
	adds r1, r6, r2
	ldrh r1, [r1]
	adds r0, r0, r1
	str r0, [sp]
	movs r0, #0xd
	adds r1, r5, #0
	adds r2, r7, #0
	ldr r3, _080AD084  @ gObject_8x8
	bl PutSpriteExt
	adds r5, #8
	subs r4, #1
	cmp r4, #0
	bgt _080AD002
_080AD024:
	ldr r3, [sp, #0x30]
	ldr r1, [sp, #8]
	adds r0, r3, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r4, r0, #2
	ldr r0, [sp, #0x28]
	add r0, sl
	movs r2, #0
	ldrsh r1, [r0, r2]
	ldr r3, [sp, #0x2c]
	ldr r2, [sp, #8]
	adds r0, r3, r2
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, #1
	lsls r0, r0, #3
	adds r7, r1, r0
	ldr r0, [sp, #0x24]
	add r0, sl
	movs r3, #0
	ldrsh r0, [r0, r3]
	adds r5, r0, #0
	adds r5, #8
	cmp r4, #3
	ble _080AD0AA
_080AD05C:
	mov r1, r8
	ldrh r0, [r1]
	mov r2, sl
	adds r1, r6, r2
	ldrh r1, [r1]
	adds r0, r0, r1
	str r0, [sp]
	movs r0, #0xd
	adds r1, r5, #0
	adds r2, r7, #0
	ldr r3, _080AD088  @ gObject_32x8
	bl PutSpriteExt
	adds r5, #0x20
	subs r4, #4
	cmp r4, #3
	bgt _080AD05C
	b _080AD0AA
	.align 2, 0
_080AD080: .4byte gObject_16x8
_080AD084: .4byte gObject_8x8
_080AD088: .4byte gObject_32x8
_080AD08C:
	mov r3, r8
	ldrh r0, [r3]
	mov r2, sl
	adds r1, r6, r2
	ldrh r1, [r1]
	adds r0, r0, r1
	str r0, [sp]
	movs r0, #0xd
	adds r1, r5, #0
	adds r2, r7, #0
	ldr r3, _080AD134  @ gObject_16x8
	bl PutSpriteExt
	adds r5, #0x10
	subs r4, #2
_080AD0AA:
	cmp r4, #1
	bgt _080AD08C
	cmp r4, #0
	ble _080AD0D4
_080AD0B2:
	mov r3, r8
	ldrh r0, [r3]
	mov r2, sl
	adds r1, r6, r2
	ldrh r1, [r1]
	adds r0, r0, r1
	str r0, [sp]
	movs r0, #0xd
	adds r1, r5, #0
	adds r2, r7, #0
	ldr r3, _080AD138  @ gObject_8x8
	bl PutSpriteExt
	adds r5, #8
	subs r4, #1
	cmp r4, #0
	bgt _080AD0B2
_080AD0D4:
	ldr r3, [sp, #0x2c]
	ldr r1, [sp, #8]
	adds r0, r3, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r1, r0, #2
	ldr r0, [sp, #0x28]
	add r0, sl
	movs r2, #0
	ldrsh r0, [r0, r2]
	adds r7, r0, #0
	adds r7, #8
	cmp r1, #0
	ble _080AD188
	add r6, sl
_080AD0F4:
	ldr r3, [sp, #0x30]
	ldr r2, [sp, #8]
	adds r0, r3, r2
	movs r4, #0
	ldrsb r4, [r0, r4]
	ldr r0, [sp, #0x24]
	add r0, sl
	movs r3, #0
	ldrsh r5, [r0, r3]
	adds r0, r7, #0
	adds r0, #8
	str r0, [sp, #0x20]
	subs r1, #1
	mov r9, r1
	cmp r4, #3
	ble _080AD15A
_080AD114:
	mov r2, r8
	ldrh r1, [r2]
	ldrh r0, [r6]
	adds r1, r1, r0
	str r1, [sp]
	movs r0, #0xd
	adds r1, r5, #0
	adds r2, r7, #0
	ldr r3, _080AD13C  @ gObject_32x8
	bl PutSpriteExt
	adds r5, #0x20
	subs r4, #4
	cmp r4, #3
	bgt _080AD114
	b _080AD15A
	.align 2, 0
_080AD134: .4byte gObject_16x8
_080AD138: .4byte gObject_8x8
_080AD13C: .4byte gObject_32x8
_080AD140:
	mov r3, r8
	ldrh r1, [r3]
	ldrh r0, [r6]
	adds r1, r1, r0
	str r1, [sp]
	movs r0, #0xd
	adds r1, r5, #0
	adds r2, r7, #0
	ldr r3, _080AD1A4  @ gObject_16x8
	bl PutSpriteExt
	adds r5, #0x10
	subs r4, #2
_080AD15A:
	cmp r4, #1
	bgt _080AD140
	cmp r4, #0
	ble _080AD180
_080AD162:
	mov r0, r8
	ldrh r1, [r0]
	ldrh r0, [r6]
	adds r1, r1, r0
	str r1, [sp]
	movs r0, #0xd
	adds r1, r5, #0
	adds r2, r7, #0
	ldr r3, _080AD1A8  @ gObject_8x8
	bl PutSpriteExt
	adds r5, #8
	subs r4, #1
	cmp r4, #0
	bgt _080AD162
_080AD180:
	ldr r7, [sp, #0x20]
	mov r1, r9
	cmp r1, #0
	bgt _080AD0F4
_080AD188:
	ldr r1, [sp, #0x1c]
	str r1, [sp, #8]
	cmp r1, #3
	bgt _080AD192
	b _080ACE6C
_080AD192:
	add sp, #0x34
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080AD1A4: .4byte gObject_16x8
_080AD1A8: .4byte gObject_8x8

	THUMB_FUNC_END sub_80ACE54

	THUMB_FUNC_START sub_80AD1AC
sub_80AD1AC: @ 0x080AD1AC
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _080AD1CC  @ gUnknown_08A20BD4
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
_080AD1CC: .4byte gUnknown_08A20BD4

	THUMB_FUNC_END sub_80AD1AC

	THUMB_FUNC_START sub_80AD1D0
sub_80AD1D0: @ 0x080AD1D0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080AD1F8  @ gUnknown_08A20BD4
	bl Proc_Find
	adds r1, r0, #0
	cmp r1, #0
	beq _080AD1F2
	lsls r0, r4, #0xf
	lsrs r0, r0, #0x14
	adds r1, #0x4e
	strh r0, [r1]
	ldr r0, _080AD1FC  @ gUnknown_08A2E950
	ldr r2, _080AD200  @ 0x06010000
	adds r1, r4, r2
	bl CopyDataWithPossibleUncomp
_080AD1F2:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080AD1F8: .4byte gUnknown_08A20BD4
_080AD1FC: .4byte gUnknown_08A2E950
_080AD200: .4byte 0x06010000

	THUMB_FUNC_END sub_80AD1D0

	THUMB_FUNC_START sub_80AD204
sub_80AD204: @ 0x080AD204
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	adds r7, r3, #0
	ldr r0, [sp, #0x1c]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	ldr r0, _080AD268  @ gUnknown_08A20BD4
	bl Proc_Find
	adds r3, r0, #0
	cmp r3, #0
	beq _080AD25C
	adds r0, #0x4a
	adds r0, r0, r4
	movs r1, #1
	strb r1, [r0]
	lsls r2, r4, #1
	adds r0, r3, #0
	adds r0, #0x2a
	adds r0, r0, r2
	strh r5, [r0]
	adds r0, r3, #0
	adds r0, #0x32
	adds r0, r0, r2
	strh r6, [r0]
	adds r0, r3, #0
	adds r0, #0x3e
	adds r0, r0, r4
	strb r7, [r0]
	adds r0, r3, #0
	adds r0, #0x3a
	adds r0, r0, r4
	ldr r1, [sp, #0x18]
	strb r1, [r0]
	adds r0, r3, #0
	adds r0, #0x42
	adds r0, r0, r2
	mov r1, r8
	strh r1, [r0]
_080AD25C:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080AD268: .4byte gUnknown_08A20BD4

	THUMB_FUNC_END sub_80AD204

	THUMB_FUNC_START sub_80AD26C
sub_80AD26C: @ 0x080AD26C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080AD288  @ gUnknown_08A20BD4
	bl Proc_Find
	cmp r0, #0
	beq _080AD282
	adds r0, #0x4a
	adds r0, r0, r4
	movs r1, #0
	strb r1, [r0]
_080AD282:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080AD288: .4byte gUnknown_08A20BD4

	THUMB_FUNC_END sub_80AD26C

	THUMB_FUNC_START sub_80AD28C
sub_80AD28C: @ 0x080AD28C
	push {lr}
	ldr r0, _080AD2A4  @ gUnknown_08A20BD4
	bl Proc_Find
	cmp r0, #0
	beq _080AD29E
	movs r1, #1
	bl Proc_Goto
_080AD29E:
	pop {r0}
	bx r0
	.align 2, 0
_080AD2A4: .4byte gUnknown_08A20BD4

	THUMB_FUNC_END sub_80AD28C

	THUMB_FUNC_START sub_80AD2A8
sub_80AD2A8: @ 0x080AD2A8
	push {r4, lr}
	ldr r0, _080AD2D0  @ gUnknown_08A20BD4
	bl Proc_Find
	adds r4, r0, #0
	cmp r4, #0
	beq _080AD2C8
	movs r1, #0
	bl Proc_Goto
	adds r0, r4, #0
	adds r0, #0x4e
	ldrh r0, [r0]
	lsls r0, r0, #5
	bl sub_80AD1D0
_080AD2C8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080AD2D0: .4byte gUnknown_08A20BD4

	THUMB_FUNC_END sub_80AD2A8

	THUMB_FUNC_START sub_80AD2D4
sub_80AD2D4: @ 0x080AD2D4
	push {lr}
	ldr r0, _080AD2E4  @ gUnknown_08A20BD4
	bl Proc_Find
	bl Proc_End
	pop {r0}
	bx r0
	.align 2, 0
_080AD2E4: .4byte gUnknown_08A20BD4

	THUMB_FUNC_END sub_80AD2D4

	THUMB_FUNC_START ParallelWorker_OnLoop
ParallelWorker_OnLoop: @ 0x080AD2E8
	push {lr}
	ldr r1, [r0, #0x14]
	ldr r2, [r0, #0x2c]
	adds r0, r1, #0
	bl _call_via_r2
	pop {r0}
	bx r0

	THUMB_FUNC_END ParallelWorker_OnLoop

	THUMB_FUNC_START StartParallelWorker
StartParallelWorker: @ 0x080AD2F8
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	bl GetParallelWorker
	cmp r0, #0
	bne _080AD310
	ldr r0, _080AD318  @ ProcScr_ParallelWorker
	adds r1, r5, #0
	bl Proc_Start
	str r4, [r0, #0x2c]
_080AD310:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080AD318: .4byte ProcScr_ParallelWorker

	THUMB_FUNC_END StartParallelWorker

	THUMB_FUNC_START EndAllParallelWorkers
EndAllParallelWorkers: @ 0x080AD31C
	push {lr}
	b _080AD324
_080AD320:
	bl Proc_End
_080AD324:
	ldr r0, _080AD334  @ ProcScr_ParallelWorker
	bl Proc_Find
	cmp r0, #0
	bne _080AD320
	pop {r0}
	bx r0
	.align 2, 0
_080AD334: .4byte ProcScr_ParallelWorker

	THUMB_FUNC_END EndAllParallelWorkers

	THUMB_FUNC_START GetParallelWorker
GetParallelWorker: @ 0x080AD338
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0
	b _080AD34A
_080AD340:
	ldr r0, [r1, #0x2c]
	cmp r0, r4
	bne _080AD34A
	adds r0, r1, #0
	b _080AD358
_080AD34A:
	ldr r0, _080AD360  @ ProcScr_ParallelWorker
	bl Proc_FindAfter
	adds r1, r0, #0
	cmp r1, #0
	bne _080AD340
	movs r0, #0
_080AD358:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080AD360: .4byte ProcScr_ParallelWorker

	THUMB_FUNC_END GetParallelWorker

	THUMB_FUNC_START sub_80AD364
sub_80AD364: @ 0x080AD364
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	bl GetGameClock
	ldr r1, _080AD424  @ gPaletteBuffer
	ldrh r2, [r5, #0x3a]
	lsls r2, r2, #5
	movs r3, #0x87
	lsls r3, r3, #2
	adds r2, r2, r3
	adds r2, r2, r1
	ldr r1, _080AD428  @ gRAMChapterData
	adds r1, #0x41
	ldrb r1, [r1]
	lsls r1, r1, #0x1c
	lsrs r1, r1, #0x1e
	lsls r1, r1, #4
	lsrs r0, r0, #2
	movs r4, #0xf
	ands r0, r4
	adds r1, r1, r0
	lsls r1, r1, #1
	ldr r0, _080AD42C  @ gUnknown_08A1D448
	adds r1, r1, r0
	ldrh r0, [r1]
	strh r0, [r2]
	bl EnablePaletteSync
	ldr r1, [r5, #0x2c]
	ldr r2, [r5, #0x30]
	adds r2, #8
	ldr r3, _080AD430  @ gObject_8x8
	ldrh r0, [r5, #0x3a]
	ands r4, r0
	lsls r4, r4, #0xc
	ldrh r0, [r5, #0x3c]
	adds r4, r4, r0
	ldrh r0, [r5, #0x36]
	adds r4, r4, r0
	str r4, [sp]
	movs r0, #4
	bl PutSpriteExt
	movs r4, #1
	ldrh r3, [r5, #0x38]
	cmp r4, r3
	bge _080AD3F2
_080AD3C4:
	lsls r0, r4, #3
	ldr r1, [r5, #0x2c]
	adds r1, r1, r0
	ldr r2, [r5, #0x30]
	adds r2, #8
	ldrh r3, [r5, #0x3a]
	movs r0, #0xf
	ands r0, r3
	lsls r0, r0, #0xc
	ldrh r3, [r5, #0x3c]
	adds r0, r0, r3
	ldrh r3, [r5, #0x36]
	adds r0, r0, r3
	adds r0, #1
	str r0, [sp]
	movs r0, #4
	ldr r3, _080AD430  @ gObject_8x8
	bl PutSpriteExt
	adds r4, #1
	ldrh r0, [r5, #0x38]
	cmp r4, r0
	blt _080AD3C4
_080AD3F2:
	ldrh r0, [r5, #0x38]
	lsls r0, r0, #3
	ldr r1, [r5, #0x2c]
	adds r1, r1, r0
	ldr r2, [r5, #0x30]
	adds r2, #8
	ldr r3, _080AD430  @ gObject_8x8
	ldrh r4, [r5, #0x3a]
	movs r0, #0xf
	ands r0, r4
	lsls r0, r0, #0xc
	ldrh r4, [r5, #0x3c]
	adds r0, r0, r4
	ldrh r4, [r5, #0x36]
	adds r0, r0, r4
	adds r0, #2
	str r0, [sp]
	movs r0, #4
	bl PutSpriteExt
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080AD424: .4byte gPaletteBuffer
_080AD428: .4byte gRAMChapterData
_080AD42C: .4byte gUnknown_08A1D448
_080AD430: .4byte gObject_8x8

	THUMB_FUNC_END sub_80AD364

	THUMB_FUNC_START sub_80AD434
sub_80AD434: @ 0x080AD434
	adds r0, #0x35
	movs r1, #0
	strb r1, [r0]
	bx lr

	THUMB_FUNC_END sub_80AD434

	THUMB_FUNC_START sub_80AD43C
sub_80AD43C: @ 0x080AD43C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x2c]
	ldr r1, [r4, #0x30]
	bl DisplayUiHand
	adds r0, r4, #0
	adds r0, #0x35
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _080AD45C
	adds r0, r4, #0
	bl sub_80AD364
_080AD45C:
	adds r0, r4, #0
	adds r0, #0x34
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _080AD474
	ldr r0, [r4, #0x2c]
	ldr r1, [r4, #0x30]
	adds r1, #2
	bl sub_8015B88
_080AD474:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80AD43C

	THUMB_FUNC_START ResetPrepScreenHandCursor
ResetPrepScreenHandCursor: @ 0x080AD47C
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _080AD49C  @ gUnknown_08A20C1C
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
_080AD49C: .4byte gUnknown_08A20C1C

	THUMB_FUNC_END ResetPrepScreenHandCursor

	THUMB_FUNC_START sub_80AD4A0
sub_80AD4A0: @ 0x080AD4A0
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	ldr r0, _080AD4D8  @ gUnknown_08A20C1C
	bl Proc_Find
	adds r2, r0, #0
	cmp r2, #0
	beq _080AD4D0
	adds r1, r2, #0
	adds r1, #0x34
	movs r0, #0
	strb r0, [r1]
	lsls r0, r5, #0xf
	lsrs r0, r0, #0x14
	strh r0, [r2, #0x36]
	movs r0, #0xf
	ands r4, r0
	strh r4, [r2, #0x3a]
	ldr r0, _080AD4DC  @ Img_PrepTextShadow
	ldr r2, _080AD4E0  @ 0x06010000
	adds r1, r5, r2
	bl CopyDataWithPossibleUncomp
_080AD4D0:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080AD4D8: .4byte gUnknown_08A20C1C
_080AD4DC: .4byte Img_PrepTextShadow
_080AD4E0: .4byte 0x06010000

	THUMB_FUNC_END sub_80AD4A0

	THUMB_FUNC_START SetPrepScreenHandXPos
SetPrepScreenHandXPos: @ 0x080AD4E4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080AD4FC  @ gUnknown_08A20C1C
	bl Proc_Find
	cmp r0, #0
	beq _080AD4F4
	str r4, [r0, #0x2c]
_080AD4F4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080AD4FC: .4byte gUnknown_08A20C1C

	THUMB_FUNC_END SetPrepScreenHandXPos

	THUMB_FUNC_START SetPrepScreenHandYPos
SetPrepScreenHandYPos: @ 0x080AD500
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080AD518  @ gUnknown_08A20C1C
	bl Proc_Find
	cmp r0, #0
	beq _080AD510
	str r4, [r0, #0x30]
_080AD510:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080AD518: .4byte gUnknown_08A20C1C

	THUMB_FUNC_END SetPrepScreenHandYPos

	THUMB_FUNC_START ShowPrepScreenHandCursor
ShowPrepScreenHandCursor: @ 0x080AD51C
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	adds r4, r2, #0
	lsls r3, r3, #0x10
	lsrs r7, r3, #0x10
	ldr r0, _080AD544  @ gUnknown_08A20C1C
	bl Proc_Find
	adds r1, r0, #0
	cmp r1, #0
	beq _080AD55C
	str r5, [r1, #0x2c]
	str r6, [r1, #0x30]
	cmp r4, #0
	bne _080AD548
	adds r0, #0x35
	strb r4, [r0]
	b _080AD554
	.align 2, 0
_080AD544: .4byte gUnknown_08A20C1C
_080AD548:
	adds r2, r1, #0
	adds r2, #0x35
	movs r0, #1
	strb r0, [r2]
	strh r4, [r1, #0x38]
	strh r7, [r1, #0x3c]
_080AD554:
	adds r0, r1, #0
	movs r1, #1
	bl Proc_Goto
_080AD55C:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END ShowPrepScreenHandCursor

	THUMB_FUNC_START HidePrepScreenHandCursor
HidePrepScreenHandCursor: @ 0x080AD564
	push {lr}
	ldr r0, _080AD57C  @ gUnknown_08A20C1C
	bl Proc_Find
	cmp r0, #0
	beq _080AD576
	movs r1, #0
	bl Proc_Goto
_080AD576:
	pop {r0}
	bx r0
	.align 2, 0
_080AD57C: .4byte gUnknown_08A20C1C

	THUMB_FUNC_END HidePrepScreenHandCursor

	THUMB_FUNC_START EndPrepScreenHandCursor
EndPrepScreenHandCursor: @ 0x080AD580
	push {lr}
	ldr r0, _080AD590  @ gUnknown_08A20C1C
	bl Proc_Find
	bl Proc_End
	pop {r0}
	bx r0
	.align 2, 0
_080AD590: .4byte gUnknown_08A20C1C

	THUMB_FUNC_END EndPrepScreenHandCursor

	THUMB_FUNC_START sub_80AD594
sub_80AD594: @ 0x080AD594
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r0, _080AD5B0  @ gUnknown_08A20C1C
	bl Proc_Find
	cmp r0, #0
	beq _080AD5A8
	adds r0, #0x34
	strb r4, [r0]
_080AD5A8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080AD5B0: .4byte gUnknown_08A20C1C

	THUMB_FUNC_END sub_80AD594

	THUMB_FUNC_START sub_80AD5B4
sub_80AD5B4: @ 0x080AD5B4
	ldr r2, _080AD5D4  @ gLCDControlBuffer
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
_080AD5D4: .4byte gLCDControlBuffer

	THUMB_FUNC_END sub_80AD5B4

	THUMB_FUNC_START EnableAllGfx
EnableAllGfx: @ 0x080AD5D8
	ldr r2, _080AD5F4  @ gLCDControlBuffer
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
_080AD5F4: .4byte gLCDControlBuffer

	THUMB_FUNC_END EnableAllGfx

	THUMB_FUNC_START sub_80AD5F8
sub_80AD5F8: @ 0x080AD5F8
	push {lr}
	movs r2, #0
	movs r1, #3
	adds r0, #0x50
_080AD600:
	strb r2, [r0]
	subs r0, #0xc
	subs r1, #1
	cmp r1, #0
	bge _080AD600
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80AD5F8

	THUMB_FUNC_START sub_80AD610
sub_80AD610: @ 0x080AD610
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	str r0, [sp, #4]
	movs r1, #0
_080AD620:
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, #0x2c
	ldr r2, [sp, #4]
	adds r5, r2, r0
	movs r0, #0
	ldrsb r0, [r5, r0]
	adds r1, #1
	str r1, [sp, #0xc]
	cmp r0, #0
	bne _080AD63A
	b _080AD934
_080AD63A:
	ldr r1, [r2, #0x60]
	movs r0, #0xf
	ands r1, r0
	lsls r1, r1, #0xc
	ldr r0, [r2, #0x5c]
	adds r0, r0, r1
	ldrh r3, [r5, #8]
	adds r0, r0, r3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	ldrb r0, [r5, #1]
	ldrh r2, [r5, #2]
	ldr r1, _080AD8B8  @ 0x000001FF
	ands r1, r2
	ldrh r3, [r5, #4]
	movs r2, #0xff
	ands r2, r3
	mov r3, r8
	str r3, [sp]
	ldr r3, _080AD8BC  @ gObject_8x8
	bl PutSpriteExt
	ldrb r0, [r5, #1]
	movs r2, #2
	ldrsh r1, [r5, r2]
	ldrb r2, [r5, #6]
	subs r2, #1
	lsls r2, r2, #3
	adds r1, r1, r2
	ldr r3, _080AD8B8  @ 0x000001FF
	ands r1, r3
	movs r2, #0x80
	lsls r2, r2, #5
	adds r1, r1, r2
	ldrh r3, [r5, #4]
	movs r2, #0xff
	ands r2, r3
	mov r3, r8
	str r3, [sp]
	ldr r3, _080AD8BC  @ gObject_8x8
	bl PutSpriteExt
	ldrb r0, [r5, #1]
	movs r2, #2
	ldrsh r1, [r5, r2]
	ldrb r2, [r5, #6]
	subs r2, #1
	lsls r2, r2, #3
	adds r1, r1, r2
	ldr r3, _080AD8B8  @ 0x000001FF
	ands r1, r3
	movs r2, #0xc0
	lsls r2, r2, #6
	adds r1, r1, r2
	movs r3, #4
	ldrsh r2, [r5, r3]
	ldrb r3, [r5, #7]
	subs r3, #1
	lsls r3, r3, #3
	adds r2, r2, r3
	movs r3, #0xff
	ands r2, r3
	mov r3, r8
	str r3, [sp]
	ldr r3, _080AD8BC  @ gObject_8x8
	bl PutSpriteExt
	ldrb r0, [r5, #1]
	ldrh r2, [r5, #2]
	ldr r1, _080AD8B8  @ 0x000001FF
	ands r1, r2
	movs r2, #0x80
	lsls r2, r2, #6
	adds r1, r1, r2
	movs r3, #4
	ldrsh r2, [r5, r3]
	ldrb r3, [r5, #7]
	subs r3, #1
	lsls r3, r3, #3
	adds r2, r2, r3
	movs r3, #0xff
	ands r2, r3
	mov r3, r8
	str r3, [sp]
	ldr r3, _080AD8BC  @ gObject_8x8
	bl PutSpriteExt
	movs r7, #1
	ldrb r0, [r5, #6]
	subs r0, #4
	cmp r7, r0
	bge _080AD750
	ldr r0, _080AD8B8  @ 0x000001FF
	mov sl, r0
	ldr r1, _080AD8C0  @ gObject_32x8
	mov r9, r1
	mov r6, r8
	adds r6, #1
_080AD700:
	ldrb r0, [r5, #1]
	movs r2, #2
	ldrsh r1, [r5, r2]
	lsls r4, r7, #3
	adds r1, r1, r4
	mov r3, sl
	ands r1, r3
	ldrh r3, [r5, #4]
	movs r2, #0xff
	ands r2, r3
	str r6, [sp]
	mov r3, r9
	bl PutSpriteExt
	ldrb r0, [r5, #1]
	movs r2, #2
	ldrsh r1, [r5, r2]
	adds r1, r1, r4
	mov r3, sl
	ands r1, r3
	movs r2, #0x80
	lsls r2, r2, #6
	adds r1, r1, r2
	movs r3, #4
	ldrsh r2, [r5, r3]
	ldrb r3, [r5, #7]
	subs r3, #1
	lsls r3, r3, #3
	adds r2, r2, r3
	movs r3, #0xff
	ands r2, r3
	str r6, [sp]
	mov r3, r9
	bl PutSpriteExt
	adds r7, #4
	ldrb r0, [r5, #6]
	subs r0, #4
	cmp r7, r0
	blt _080AD700
_080AD750:
	ldrb r0, [r5, #6]
	subs r0, #2
	cmp r7, r0
	bge _080AD7B4
	ldr r0, _080AD8B8  @ 0x000001FF
	mov sl, r0
	ldr r1, _080AD8C4  @ gObject_16x8
	mov r9, r1
	mov r6, r8
	adds r6, #1
_080AD764:
	ldrb r0, [r5, #1]
	movs r2, #2
	ldrsh r1, [r5, r2]
	lsls r4, r7, #3
	adds r1, r1, r4
	mov r3, sl
	ands r1, r3
	ldrh r3, [r5, #4]
	movs r2, #0xff
	ands r2, r3
	str r6, [sp]
	mov r3, r9
	bl PutSpriteExt
	ldrb r0, [r5, #1]
	movs r2, #2
	ldrsh r1, [r5, r2]
	adds r1, r1, r4
	mov r3, sl
	ands r1, r3
	movs r2, #0x80
	lsls r2, r2, #6
	adds r1, r1, r2
	movs r3, #4
	ldrsh r2, [r5, r3]
	ldrb r3, [r5, #7]
	subs r3, #1
	lsls r3, r3, #3
	adds r2, r2, r3
	movs r3, #0xff
	ands r2, r3
	str r6, [sp]
	mov r3, r9
	bl PutSpriteExt
	adds r7, #2
	ldrb r0, [r5, #6]
	subs r0, #2
	cmp r7, r0
	blt _080AD764
_080AD7B4:
	ldrb r0, [r5, #6]
	subs r0, #1
	cmp r7, r0
	bge _080AD818
	ldr r0, _080AD8B8  @ 0x000001FF
	mov sl, r0
	ldr r1, _080AD8BC  @ gObject_8x8
	mov r9, r1
	mov r6, r8
	adds r6, #1
_080AD7C8:
	ldrb r0, [r5, #1]
	movs r2, #2
	ldrsh r1, [r5, r2]
	lsls r4, r7, #3
	adds r1, r1, r4
	mov r3, sl
	ands r1, r3
	ldrh r3, [r5, #4]
	movs r2, #0xff
	ands r2, r3
	str r6, [sp]
	mov r3, r9
	bl PutSpriteExt
	ldrb r0, [r5, #1]
	movs r2, #2
	ldrsh r1, [r5, r2]
	adds r1, r1, r4
	mov r3, sl
	ands r1, r3
	movs r2, #0x80
	lsls r2, r2, #6
	adds r1, r1, r2
	movs r3, #4
	ldrsh r2, [r5, r3]
	ldrb r3, [r5, #7]
	subs r3, #1
	lsls r3, r3, #3
	adds r2, r2, r3
	movs r3, #0xff
	ands r2, r3
	str r6, [sp]
	mov r3, r9
	bl PutSpriteExt
	adds r7, #1
	ldrb r0, [r5, #6]
	subs r0, #1
	cmp r7, r0
	blt _080AD7C8
_080AD818:
	movs r7, #1
	ldrb r0, [r5, #7]
	subs r0, #1
	cmp r7, r0
	blt _080AD824
	b _080AD934
_080AD824:
	ldr r0, _080AD8B8  @ 0x000001FF
	mov sl, r0
	movs r1, #0xff
	mov r9, r1
	mov r2, r8
	adds r2, #9
	str r2, [sp, #8]
_080AD832:
	ldrb r0, [r5, #1]
	ldrh r2, [r5, #2]
	mov r1, sl
	ands r1, r2
	movs r3, #4
	ldrsh r2, [r5, r3]
	lsls r4, r7, #3
	adds r2, r2, r4
	mov r3, r9
	ands r2, r3
	ldr r3, [sp, #8]
	str r3, [sp]
	ldr r3, _080AD8BC  @ gObject_8x8
	bl PutSpriteExt
	ldrb r0, [r5, #1]
	movs r2, #2
	ldrsh r1, [r5, r2]
	ldrb r2, [r5, #6]
	subs r2, #1
	lsls r2, r2, #3
	adds r1, r1, r2
	mov r3, sl
	ands r1, r3
	movs r2, #0x80
	lsls r2, r2, #5
	adds r1, r1, r2
	movs r3, #4
	ldrsh r2, [r5, r3]
	adds r2, r2, r4
	mov r3, r9
	ands r2, r3
	ldr r3, [sp, #8]
	str r3, [sp]
	ldr r3, _080AD8BC  @ gObject_8x8
	bl PutSpriteExt
	movs r6, #1
	ldrb r0, [r5, #6]
	subs r0, #4
	adds r7, #1
	cmp r6, r0
	bge _080AD8EE
_080AD888:
	ldrb r0, [r5, #1]
	movs r2, #2
	ldrsh r1, [r5, r2]
	lsls r2, r6, #3
	adds r1, r1, r2
	mov r3, sl
	ands r1, r3
	movs r3, #4
	ldrsh r2, [r5, r3]
	adds r2, r2, r4
	mov r3, r9
	ands r2, r3
	mov r3, r8
	adds r3, #5
	str r3, [sp]
	ldr r3, _080AD8C0  @ gObject_32x8
	bl PutSpriteExt
	adds r6, #4
	ldrb r0, [r5, #6]
	subs r0, #4
	cmp r6, r0
	blt _080AD888
	b _080AD8EE
	.align 2, 0
_080AD8B8: .4byte 0x000001FF
_080AD8BC: .4byte gObject_8x8
_080AD8C0: .4byte gObject_32x8
_080AD8C4: .4byte gObject_16x8
_080AD8C8:
	ldrb r0, [r5, #1]
	movs r2, #2
	ldrsh r1, [r5, r2]
	lsls r2, r6, #3
	adds r1, r1, r2
	mov r3, sl
	ands r1, r3
	movs r3, #4
	ldrsh r2, [r5, r3]
	adds r2, r2, r4
	mov r3, r9
	ands r2, r3
	mov r3, r8
	adds r3, #5
	str r3, [sp]
	ldr r3, _080AD8F8  @ gObject_16x8
	bl PutSpriteExt
	adds r6, #2
_080AD8EE:
	ldrb r0, [r5, #6]
	subs r0, #2
	cmp r6, r0
	blt _080AD8C8
	b _080AD922
	.align 2, 0
_080AD8F8: .4byte gObject_16x8
_080AD8FC:
	ldrb r0, [r5, #1]
	movs r2, #2
	ldrsh r1, [r5, r2]
	lsls r2, r6, #3
	adds r1, r1, r2
	mov r3, sl
	ands r1, r3
	movs r3, #4
	ldrsh r2, [r5, r3]
	adds r2, r2, r4
	mov r3, r9
	ands r2, r3
	mov r3, r8
	adds r3, #5
	str r3, [sp]
	ldr r3, _080AD94C  @ gObject_8x8
	bl PutSpriteExt
	adds r6, #1
_080AD922:
	ldrb r0, [r5, #6]
	subs r0, #1
	cmp r6, r0
	blt _080AD8FC
	ldrb r0, [r5, #7]
	subs r0, #1
	cmp r7, r0
	bge _080AD934
	b _080AD832
_080AD934:
	ldr r1, [sp, #0xc]
	cmp r1, #3
	bgt _080AD93C
	b _080AD620
_080AD93C:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080AD94C: .4byte gObject_8x8

	THUMB_FUNC_END sub_80AD610

	THUMB_FUNC_START sub_80AD950
sub_80AD950: @ 0x080AD950
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r6, r1, #0
	adds r1, r2, #0
	ldr r0, _080AD988  @ gUnknown_08A20C4C
	bl Proc_Start
	adds r5, r0, #0
	ldr r0, _080AD98C  @ gUnknown_085B92C4
	ldr r2, _080AD990  @ 0x06010000
	adds r1, r4, r2
	bl CopyDataWithPossibleUncomp
	ldr r0, _080AD994  @ gUnknown_020228C8
	adds r1, r6, #0
	adds r1, #0x10
	lsls r1, r1, #5
	movs r2, #0x20
	bl CopyToPaletteBuffer
	lsls r4, r4, #0xf
	lsrs r4, r4, #0x14
	str r4, [r5, #0x5c]
	str r6, [r5, #0x60]
	adds r0, r5, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_080AD988: .4byte gUnknown_08A20C4C
_080AD98C: .4byte gUnknown_085B92C4
_080AD990: .4byte 0x06010000
_080AD994: .4byte gUnknown_020228C8

	THUMB_FUNC_END sub_80AD950

	THUMB_FUNC_START sub_80AD998
sub_80AD998: @ 0x080AD998
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	adds r6, r1, #0
	adds r7, r2, #0
	mov r8, r3
	ldr r0, [sp, #0x20]
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	ldr r0, _080AD9E4  @ gUnknown_08A20C4C
	bl Proc_Find
	adds r1, r0, #0
	cmp r1, #0
	beq _080AD9D8
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #2
	adds r0, #0x2c
	adds r0, r1, r0
	movs r1, #1
	strb r1, [r0]
	strb r6, [r0, #1]
	strh r7, [r0, #2]
	mov r1, r8
	strh r1, [r0, #4]
	ldr r1, [sp, #0x18]
	strb r1, [r0, #6]
	ldr r1, [sp, #0x1c]
	strb r1, [r0, #7]
	strh r5, [r0, #8]
_080AD9D8:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080AD9E4: .4byte gUnknown_08A20C4C

	THUMB_FUNC_END sub_80AD998

	THUMB_FUNC_START sub_80AD9E8
sub_80AD9E8: @ 0x080AD9E8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080ADA0C  @ gUnknown_08A20C4C
	bl Proc_Find
	adds r1, r0, #0
	cmp r1, #0
	beq _080ADA06
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #2
	adds r0, #0x2c
	adds r0, r1, r0
	movs r1, #0
	strb r1, [r0]
_080ADA06:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080ADA0C: .4byte gUnknown_08A20C4C

	THUMB_FUNC_END sub_80AD9E8

	THUMB_FUNC_START sub_80ADA10
sub_80ADA10: @ 0x080ADA10
	push {lr}
	ldr r0, _080ADA20  @ gUnknown_08A20C4C
	bl Proc_Find
	bl Proc_End
	pop {r0}
	bx r0
	.align 2, 0
_080ADA20: .4byte gUnknown_08A20C4C

	THUMB_FUNC_END sub_80ADA10

	THUMB_FUNC_START sub_80ADA24
sub_80ADA24: @ 0x080ADA24
	push {lr}
	movs r2, #0
	adds r0, #0x2c
	movs r1, #3
_080ADA2C:
	strb r2, [r0]
	strb r2, [r0, #6]
	adds r0, #8
	subs r1, #1
	cmp r1, #0
	bge _080ADA2C
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80ADA24

	THUMB_FUNC_START sub_80ADA3C
sub_80ADA3C: @ 0x080ADA3C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x30
	mov sl, r0
	add r1, sp, #4
	ldr r0, _080ADB24  @ gUnknown_08205E18
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldr r0, [r0]
	str r0, [r1]
	add r2, sp, #0x14
	adds r1, r2, #0
	ldr r0, _080ADB28  @ gUnknown_08205E28
	ldm r0!, {r3, r5, r7}
	stm r1!, {r3, r5, r7}
	ldr r0, [r0]
	str r0, [r1]
	mov r4, sl
	adds r4, #0x2d
	str r4, [sp, #0x28]
	mov r5, sl
	adds r5, #0x2c
	movs r7, #3
	str r7, [sp, #0x24]
_080ADA72:
	movs r0, #0
	ldrsb r0, [r5, r0]
	cmp r0, #0
	beq _080ADB58
	movs r0, #2
	ldrsh r6, [r5, r0]
	movs r0, #6
	ldrsb r0, [r5, r0]
	cmp r0, #0
	beq _080ADB2C
	ldrb r4, [r5, #1]
	adds r0, r4, #0
	movs r1, #1
	ands r0, r1
	mov r7, sl
	adds r7, #0x50
	movs r2, #0x4e
	add r2, sl
	mov r8, r2
	movs r3, #0x4c
	add r3, sl
	mov r9, r3
	cmp r0, #0
	beq _080ADACA
	ldrb r0, [r7]
	adds r1, r6, #0
	adds r1, #0x60
	movs r3, #4
	ldrsh r2, [r5, r3]
	mov ip, r2
	mov r2, r8
	movs r3, #0
	ldrsh r2, [r2, r3]
	add r2, ip
	lsls r3, r4, #2
	add r3, sp
	adds r3, #0x14
	ldr r3, [r3]
	mov r4, r9
	ldrh r4, [r4]
	str r4, [sp]
	bl PutSpriteExt
	adds r6, #0x20
_080ADACA:
	ldrb r0, [r7]
	movs r1, #4
	ldrsh r2, [r5, r1]
	mov r3, r8
	movs r4, #0
	ldrsh r1, [r3, r4]
	adds r2, r2, r1
	ldr r3, [sp, #0x28]
	ldrb r1, [r3]
	lsls r1, r1, #2
	add r1, sp
	adds r1, #4
	ldr r3, [r1]
	mov r4, r9
	ldrh r1, [r4]
	str r1, [sp]
	adds r1, r6, #0
	bl PutSpriteExt
	ldr r0, [sp, #0x28]
	ldrb r3, [r0]
	adds r0, r3, #0
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _080ADB58
	adds r6, #0x60
	ldrb r0, [r7]
	movs r4, #4
	ldrsh r2, [r5, r4]
	mov r7, r8
	movs r4, #0
	ldrsh r1, [r7, r4]
	adds r2, r2, r1
	lsls r1, r3, #2
	add r1, sp
	adds r1, #0x14
	ldr r3, [r1]
	mov r7, r9
	ldrh r1, [r7]
	str r1, [sp]
	adds r1, r6, #0
	bl PutSpriteExt
	b _080ADB58
	.align 2, 0
_080ADB24: .4byte gUnknown_08205E18
_080ADB28: .4byte gUnknown_08205E28
_080ADB2C:
	mov r0, sl
	adds r0, #0x50
	ldrb r0, [r0]
	movs r1, #4
	ldrsh r2, [r5, r1]
	mov r1, sl
	adds r1, #0x4e
	movs r3, #0
	ldrsh r1, [r1, r3]
	adds r2, r2, r1
	ldrb r1, [r5, #1]
	lsls r1, r1, #2
	add r1, sp
	adds r1, #4
	ldr r3, [r1]
	mov r1, sl
	adds r1, #0x4c
	ldrh r1, [r1]
	str r1, [sp]
	adds r1, r6, #0
	bl PutSpriteExt
_080ADB58:
	ldr r4, [sp, #0x28]
	adds r4, #8
	str r4, [sp, #0x28]
	adds r5, #8
	ldr r7, [sp, #0x24]
	subs r7, #1
	str r7, [sp, #0x24]
	cmp r7, #0
	blt _080ADB6C
	b _080ADA72
_080ADB6C:
	add sp, #0x30
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80ADA3C

	THUMB_FUNC_START StartSmallBrownNameBoxes
StartSmallBrownNameBoxes: @ 0x080ADB7C
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	mov r9, r0
	adds r4, r1, #0
	mov r8, r2
	adds r5, r3, #0
	ldr r6, [sp, #0x1c]
	ldr r7, [sp, #0x20]
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	lsls r6, r6, #0x10
	lsrs r6, r6, #0x10
	bl EndSmallBrownNameBoxes
	ldr r0, _080ADBEC  @ gUnknown_08A20D6C
	adds r1, r7, #0
	bl Proc_Start
	adds r7, r0, #0
	ldr r0, _080ADBF0  @ gUnknown_08A1B0D8
	ldr r2, _080ADBF4  @ 0x06010000
	adds r1, r4, r2
	bl CopyDataWithPossibleUncomp
	ldr r0, _080ADBF8  @ gUnknown_08A1B154
	mov r1, r8
	adds r1, #0x10
	lsls r1, r1, #5
	movs r2, #0x20
	bl CopyToPaletteBuffer
	lsls r4, r4, #0xf
	lsrs r4, r4, #0x14
	movs r0, #0xf
	mov r1, r8
	ands r0, r1
	lsls r0, r0, #0xc
	adds r4, r4, r0
	adds r5, r5, r4
	adds r0, r7, #0
	adds r0, #0x4c
	strh r5, [r0]
	adds r0, #2
	strh r6, [r0]
	adds r0, #2
	mov r2, r9
	strb r2, [r0]
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080ADBEC: .4byte gUnknown_08A20D6C
_080ADBF0: .4byte gUnknown_08A1B0D8
_080ADBF4: .4byte 0x06010000
_080ADBF8: .4byte gUnknown_08A1B154

	THUMB_FUNC_END StartSmallBrownNameBoxes

	THUMB_FUNC_START sub_80ADBFC
sub_80ADBFC: @ 0x080ADBFC
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	mov r8, r3
	ldr r0, _080ADC3C  @ gUnknown_08A20D6C
	bl Proc_Find
	lsls r4, r4, #3
	adds r0, r0, r4
	adds r2, r0, #0
	adds r2, #0x2c
	movs r1, #1
	strb r1, [r2]
	ldr r2, _080ADC40  @ 0x000001FF
	adds r1, r2, #0
	ands r5, r1
	strh r5, [r0, #0x2e]
	movs r1, #0xff
	ands r6, r1
	strh r6, [r0, #0x30]
	adds r0, #0x2d
	mov r1, r8
	strb r1, [r0]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080ADC3C: .4byte gUnknown_08A20D6C
_080ADC40: .4byte 0x000001FF

	THUMB_FUNC_END sub_80ADBFC

	THUMB_FUNC_START sub_80ADC44
sub_80ADC44: @ 0x080ADC44
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080ADC64  @ gUnknown_08A20D6C
	bl Proc_Find
	adds r1, r0, #0
	cmp r1, #0
	beq _080ADC5E
	lsls r0, r4, #3
	adds r0, r1, r0
	adds r0, #0x2c
	movs r1, #0
	strb r1, [r0]
_080ADC5E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080ADC64: .4byte gUnknown_08A20D6C

	THUMB_FUNC_END sub_80ADC44

	THUMB_FUNC_START sub_80ADC68
sub_80ADC68: @ 0x080ADC68
	push {r4, r5, lr}
	adds r4, r0, #0
	lsls r1, r1, #0x18
	lsrs r5, r1, #0x18
	ldr r0, _080ADC8C  @ gUnknown_08A20D6C
	bl Proc_Find
	adds r1, r0, #0
	cmp r1, #0
	beq _080ADC84
	lsls r0, r4, #3
	adds r0, r1, r0
	adds r0, #0x32
	strb r5, [r0]
_080ADC84:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080ADC8C: .4byte gUnknown_08A20D6C

	THUMB_FUNC_END sub_80ADC68

	THUMB_FUNC_START EndSmallBrownNameBoxes
EndSmallBrownNameBoxes: @ 0x080ADC90
	push {lr}
	ldr r0, _080ADCA0  @ gUnknown_08A20D6C
	bl Proc_Find
	bl Proc_End
	pop {r0}
	bx r0
	.align 2, 0
_080ADCA0: .4byte gUnknown_08A20D6C

	THUMB_FUNC_END EndSmallBrownNameBoxes

	THUMB_FUNC_START sub_80ADCA4
sub_80ADCA4: @ 0x080ADCA4
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	bl SetFont
	adds r2, r4, #0
	adds r2, #0x5a
	adds r1, r4, #0
	adds r1, #0x5c
	ldrh r0, [r2]
	ldrh r1, [r1]
	cmp r0, r1
	bne _080ADCC2
	movs r0, #0
	strh r0, [r2]
_080ADCC2:
	ldrh r0, [r2]
	adds r7, r2, #0
	cmp r0, #0
	bne _080ADD10
	movs r6, #0
	adds r5, r4, #0
	adds r5, #0x5e
	b _080ADCFC
_080ADCD2:
	ldrb r0, [r1]
	cmp r0, #1
	bne _080ADCE8
	adds r0, r4, #0
	adds r0, #0x58
	ldrb r1, [r0]
	adds r1, #1
	strb r1, [r0]
	ldr r0, [r4, #0x54]
	adds r0, #1
	b _080ADCF8
_080ADCE8:
	adds r0, r4, #0
	adds r0, #0x58
	ldrb r0, [r0]
	lsls r0, r0, #3
	adds r0, #0x44
	adds r0, r4, r0
	bl Text_AppendChar
_080ADCF8:
	str r0, [r4, #0x54]
	adds r6, #1
_080ADCFC:
	ldrh r0, [r5]
	cmp r6, r0
	bge _080ADD10
	ldr r1, [r4, #0x54]
	ldrb r0, [r1]
	cmp r0, #0
	bne _080ADCD2
	adds r0, r4, #0
	bl Proc_Break
_080ADD10:
	ldrh r0, [r7]
	adds r0, #1
	strh r0, [r7]
	movs r0, #0
	bl SetFont
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80ADCA4

	THUMB_FUNC_START sub_80ADD24
sub_80ADD24: @ 0x080ADD24
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	adds r7, r0, #0
	mov r9, r1
	mov r8, r2
	adds r5, r3, #0
	ldr r4, _080ADDC8  @ gUnknown_08A20D8C
	adds r0, r4, #0
	bl Proc_Find
	adds r6, r0, #0
	cmp r6, #0
	bne _080ADD4C
	adds r0, r4, #0
	ldr r1, [sp, #0x24]
	bl Proc_StartBlocking
	adds r6, r0, #0
_080ADD4C:
	adds r0, r6, #0
	adds r0, #0x2c
	ldr r2, _080ADDCC  @ 0x06010000
	adds r1, r7, r2
	mov r2, r9
	bl InitSomeOtherGraphicsRelatedStruct
	mov r0, r8
	str r0, [r6, #0x54]
	adds r0, r6, #0
	adds r0, #0x58
	movs r1, #0
	strb r1, [r0]
	adds r0, #1
	strb r5, [r0]
	adds r0, #1
	strh r1, [r0]
	adds r1, r6, #0
	adds r1, #0x5c
	ldr r0, [sp, #0x1c]
	strh r0, [r1]
	adds r1, #2
	ldr r0, [sp, #0x20]
	strh r0, [r1]
	mov r7, r9
	adds r7, #0x10
	cmp r5, #0
	ble _080ADD9E
	adds r4, r6, #0
	adds r4, #0x44
_080ADD88:
	adds r0, r4, #0
	bl Text_Init3
	adds r0, r4, #0
	movs r1, #0
	bl Text_80046B4
	adds r4, #8
	subs r5, #1
	cmp r5, #0
	bne _080ADD88
_080ADD9E:
	ldr r0, _080ADDD0  @ Pal_UIFont
	lsls r1, r7, #5
	movs r2, #0x20
	bl CopyToPaletteBuffer
	movs r0, #0
	bl SetFontGlyphSet
	movs r0, #0
	bl SetFont
	adds r0, r6, #0
	movs r1, #0
	bl Proc_Goto
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080ADDC8: .4byte gUnknown_08A20D8C
_080ADDCC: .4byte 0x06010000
_080ADDD0: .4byte Pal_UIFont

	THUMB_FUNC_END sub_80ADD24

	THUMB_FUNC_START EndAllProcChildren
EndAllProcChildren: @ 0x080ADDD4
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r4, #0
	b _080ADDE2
_080ADDDC:
	adds r0, r4, #0
	bl Proc_End
_080ADDE2:
	adds r0, r4, #0
	adds r1, r5, #0
	bl Proc_FindAfterWithParent
	adds r4, r0, #0
	cmp r4, #0
	bne _080ADDDC
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END EndAllProcChildren

	THUMB_FUNC_START sub_80ADDF8
sub_80ADDF8: @ 0x080ADDF8
	bx lr

	THUMB_FUNC_END sub_80ADDF8

	THUMB_FUNC_START sub_80ADDFC
sub_80ADDFC: @ 0x080ADDFC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x14
	ldr r4, [sp, #0x2c]
	ldr r5, [sp, #0x30]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	lsls r1, r1, #0x10
	lsrs r7, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r1, r2, #0x10
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	lsls r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r6, r5, #0x10
	lsrs r2, r4, #0x10
	asrs r4, r4, #0x10
	cmp r4, #4
	bgt _080ADE2A
	movs r2, #4
_080ADE2A:
	lsls r0, r6, #0x10
	asrs r0, r0, #0x10
	cmp r0, #4
	bgt _080ADE34
	movs r6, #4
_080ADE34:
	lsls r0, r1, #0x10
	asrs r0, r0, #8
	str r0, [sp]
	lsls r0, r3, #0x10
	asrs r0, r0, #8
	str r0, [sp, #4]
	mov r0, sp
	movs r1, #0
	strh r1, [r0, #8]
	strh r1, [r0, #0xa]
	mov r5, sp
	lsls r1, r2, #0x10
	asrs r1, r1, #0x10
	movs r4, #0x80
	lsls r4, r4, #9
	adds r0, r4, #0
	bl __divsi3
	strh r0, [r5, #0xc]
	mov r5, sp
	lsls r1, r6, #0x10
	asrs r1, r1, #0x10
	adds r0, r4, #0
	bl __divsi3
	strh r0, [r5, #0xe]
	mov r1, sp
	lsls r0, r7, #4
	strh r0, [r1, #0x10]
	ldr r1, _080ADE8C  @ gUnknown_030030D8
	mov r0, r8
	cmp r0, #2
	bne _080ADE78
	subs r1, #0x10
_080ADE78:
	mov r0, sp
	movs r2, #1
	bl BgAffineSet
	add sp, #0x14
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080ADE8C: .4byte gUnknown_030030D8

	THUMB_FUNC_END sub_80ADDFC

	THUMB_FUNC_START sub_80ADE90
sub_80ADE90: @ 0x080ADE90
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r3, #0
	cmp r0, #2
	bne _080ADEA6
	ldr r3, _080ADEDC  @ gUnknown_030030C8
_080ADEA6:
	movs r4, #2
	ldrsh r0, [r3, r4]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	muls r0, r1, r0
	asrs r0, r0, #8
	strh r0, [r3, #2]
	movs r4, #6
	ldrsh r0, [r3, r4]
	muls r0, r1, r0
	asrs r0, r0, #8
	strh r0, [r3, #6]
	movs r1, #0
	ldrsh r0, [r3, r1]
	lsls r1, r2, #0x10
	asrs r1, r1, #0x10
	muls r0, r1, r0
	asrs r0, r0, #8
	strh r0, [r3]
	movs r2, #4
	ldrsh r0, [r3, r2]
	muls r0, r1, r0
	asrs r0, r0, #8
	strh r0, [r3, #4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080ADEDC: .4byte gUnknown_030030C8

	THUMB_FUNC_END sub_80ADE90

	THUMB_FUNC_START sub_80ADEE0
sub_80ADEE0: @ 0x080ADEE0
	push {r4, r5, r6, r7, lr}
	ldr r4, [sp, #0x14]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	lsls r3, r3, #0x10
	lsrs r5, r3, #0x10
	lsls r4, r4, #0x10
	lsrs r6, r4, #0x10
	movs r4, #0
	cmp r0, #2
	bne _080ADF00
	ldr r4, _080ADF44  @ gUnknown_030030C8
_080ADF00:
	movs r3, #0
	ldrsh r0, [r4, r3]
	lsls r3, r1, #0x10
	asrs r3, r3, #0x10
	negs r3, r3
	adds r1, r0, #0
	muls r1, r3, r1
	movs r7, #2
	ldrsh r0, [r4, r7]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	negs r2, r2
	muls r0, r2, r0
	adds r1, r1, r0
	lsls r0, r5, #0x10
	asrs r0, r0, #8
	adds r1, r1, r0
	str r1, [r4, #8]
	movs r1, #4
	ldrsh r0, [r4, r1]
	adds r1, r0, #0
	muls r1, r3, r1
	movs r3, #6
	ldrsh r0, [r4, r3]
	muls r0, r2, r0
	adds r1, r1, r0
	lsls r0, r6, #0x10
	asrs r0, r0, #8
	adds r1, r1, r0
	str r1, [r4, #0xc]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080ADF44: .4byte gUnknown_030030C8

	THUMB_FUNC_END sub_80ADEE0

	THUMB_FUNC_START sub_80ADF48
sub_80ADF48: @ 0x080ADF48
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x14
	mov r8, r1
	adds r1, r2, #0
	ldr r2, [sp, #0x2c]
	ldr r6, [sp, #0x30]
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	movs r0, #0x80
	lsls r0, r0, #3
	cmp r2, r0
	bgt _080ADF66
	adds r2, r0, #0
_080ADF66:
	cmp r6, r0
	bgt _080ADF6C
	adds r6, r0, #0
_080ADF6C:
	str r1, [sp]
	str r3, [sp, #4]
	mov r0, sp
	movs r1, #0
	strh r1, [r0, #8]
	strh r1, [r0, #0xa]
	mov r5, sp
	movs r4, #0x80
	lsls r4, r4, #0x11
	adds r0, r4, #0
	adds r1, r2, #0
	bl __divsi3
	strh r0, [r5, #0xc]
	mov r5, sp
	adds r0, r4, #0
	adds r1, r6, #0
	bl __divsi3
	strh r0, [r5, #0xe]
	mov r1, sp
	mov r2, r8
	asrs r0, r2, #4
	strh r0, [r1, #0x10]
	ldr r1, _080ADFB8  @ gUnknown_030030D8
	cmp r7, #2
	bne _080ADFA4
	subs r1, #0x10
_080ADFA4:
	mov r0, sp
	movs r2, #1
	bl BgAffineSet
	add sp, #0x14
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080ADFB8: .4byte gUnknown_030030D8

	THUMB_FUNC_END sub_80ADF48

	THUMB_FUNC_START sub_80ADFBC
sub_80ADFBC: @ 0x080ADFBC
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r3, #0
	cmp r0, #2
	bne _080ADFCA
	ldr r3, _080ADFF8  @ gUnknown_030030C8
_080ADFCA:
	movs r4, #2
	ldrsh r0, [r3, r4]
	muls r0, r1, r0
	asrs r0, r0, #0x10
	strh r0, [r3, #2]
	movs r4, #6
	ldrsh r0, [r3, r4]
	muls r0, r1, r0
	asrs r0, r0, #0x10
	strh r0, [r3, #6]
	movs r1, #0
	ldrsh r0, [r3, r1]
	muls r0, r2, r0
	asrs r0, r0, #0x10
	strh r0, [r3]
	movs r4, #4
	ldrsh r0, [r3, r4]
	muls r0, r2, r0
	asrs r0, r0, #0x10
	strh r0, [r3, #4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080ADFF8: .4byte gUnknown_030030C8

	THUMB_FUNC_END sub_80ADFBC

	THUMB_FUNC_START sub_80ADFFC
sub_80ADFFC: @ 0x080ADFFC
	push {r4, r5, r6, lr}
	adds r5, r3, #0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r4, #0
	cmp r0, #2
	bne _080AE00C
	ldr r4, _080AE040  @ gUnknown_030030C8
_080AE00C:
	movs r3, #0
	ldrsh r0, [r4, r3]
	negs r3, r1
	muls r0, r3, r0
	movs r6, #2
	ldrsh r1, [r4, r6]
	negs r2, r2
	muls r1, r2, r1
	adds r0, r0, r1
	asrs r0, r0, #8
	adds r0, r0, r5
	str r0, [r4, #8]
	movs r1, #4
	ldrsh r0, [r4, r1]
	muls r0, r3, r0
	movs r3, #6
	ldrsh r1, [r4, r3]
	muls r1, r2, r1
	adds r0, r0, r1
	asrs r0, r0, #8
	ldr r1, [sp, #0x10]
	adds r0, r0, r1
	str r0, [r4, #0xc]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080AE040: .4byte gUnknown_030030C8

	THUMB_FUNC_END sub_80ADFFC

	THUMB_FUNC_START sub_80AE044
sub_80AE044: @ 0x080AE044
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	adds r7, r1, #0
	mov ip, r2
	mov r9, r3
	ldr r2, [sp, #0x20]
	ldr r4, [sp, #0x28]
	ldr r3, [sp, #0x2c]
	ldrh r1, [r7]
	lsrs r1, r1, #1
	mov r8, r1
	movs r1, #0x78
	mov sl, r1
	adds r6, r7, #4
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #0xd
	movs r0, #0xc0
	lsls r0, r0, #0x13
	adds r5, r1, r0
	cmp r4, #0
	beq _080AE0DC
	cmp r3, #0
	beq _080AE0DC
	movs r0, #1
	negs r0, r0
	cmp r4, r0
	bne _080AE086
	ldrh r4, [r7]
	ldrh r3, [r7, #2]
_080AE086:
	mov r1, ip
	asrs r1, r1, #1
	mov ip, r1
	asrs r2, r2, #1
	asrs r4, r4, #1
	lsls r4, r4, #1
	ldr r0, [sp, #0x24]
	mov r1, r8
	muls r1, r0, r1
	adds r0, r1, #0
	lsls r0, r0, #1
	adds r0, r6, r0
	lsls r1, r2, #1
	adds r6, r0, r1
	mov r2, sl
	mov r0, r9
	muls r0, r2, r0
	lsls r0, r0, #1
	adds r0, r5, r0
	mov r2, ip
	lsls r1, r2, #1
	adds r5, r0, r1
	cmp r3, #0
	ble _080AE0DC
	asrs r7, r4, #1
	adds r4, r3, #0
	ldr r0, _080AE0EC  @ 0x001FFFFF
	mov r9, r0
_080AE0BE:
	adds r0, r6, #0
	adds r1, r5, #0
	mov r2, r9
	ands r2, r7
	bl CpuSet
	mov r1, r8
	lsls r0, r1, #1
	adds r6, r6, r0
	mov r2, sl
	lsls r0, r2, #1
	adds r5, r5, r0
	subs r4, #1
	cmp r4, #0
	bne _080AE0BE
_080AE0DC:
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080AE0EC: .4byte 0x001FFFFF

	THUMB_FUNC_END sub_80AE044

	THUMB_FUNC_START sub_80AE0F0
sub_80AE0F0: @ 0x080AE0F0
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r4, r1, #0
	ldr r6, [sp, #0x20]
	ldr r1, [sp, #0x24]
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov r9, r1
	movs r1, #0x78
	mov r8, r1
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #0xd
	movs r0, #0xc0
	lsls r0, r0, #0x13
	adds r5, r1, r0
	cmp r3, #0
	beq _080AE15A
	cmp r6, #0
	beq _080AE15A
	asrs r4, r4, #1
	asrs r3, r3, #1
	lsls r3, r3, #1
	mov r0, r8
	muls r0, r2, r0
	lsls r0, r0, #1
	adds r0, r5, r0
	lsls r1, r4, #1
	adds r5, r0, r1
	cmp r6, #0
	ble _080AE15A
	adds r4, r6, #0
	lsls r0, r3, #0xa
	lsrs r6, r0, #0xb
	movs r7, #0x80
	lsls r7, r7, #0x11
_080AE13E:
	mov r0, sp
	mov r1, r9
	strh r1, [r0]
	adds r1, r5, #0
	adds r2, r6, #0
	orrs r2, r7
	bl CpuSet
	mov r1, r8
	lsls r0, r1, #1
	adds r5, r5, r0
	subs r4, #1
	cmp r4, #0
	bne _080AE13E
_080AE15A:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80AE0F0

	THUMB_FUNC_START sub_80AE168
sub_80AE168: @ 0x080AE168
	push {r4, lr}
	movs r3, #0x1f
	ands r1, r3
	ands r2, r3
	ldr r4, _080AE188  @ gPaletteBuffer
	lsls r2, r2, #0xa
	lsls r1, r1, #5
	adds r2, r2, r1
	ands r3, r0
	adds r2, r2, r3
	strh r2, [r4]
	bl EnablePaletteSync
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080AE188: .4byte gPaletteBuffer

	THUMB_FUNC_END sub_80AE168

	THUMB_FUNC_START FadeInOut_Init
FadeInOut_Init: @ 0x080AE18C
	push {r4, lr}
	adds r4, r0, #0
	bl ArchiveCurrentPalettes
	movs r0, #0
	str r0, [r4, #0x2c]
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END FadeInOut_Init

	THUMB_FUNC_START FadeIn_Loop
FadeIn_Loop: @ 0x080AE1A0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x2c]
	ldr r1, [r4, #0x30]
	adds r1, r0, r1
	str r1, [r4, #0x2c]
	adds r0, r4, #0
	adds r0, #0x29
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _080AE1C4
	lsls r1, r1, #1
	movs r0, #0x80
	lsls r0, r0, #2
	subs r2, r0, r1
	b _080AE1C6
_080AE1C4:
	lsls r2, r1, #1
_080AE1C6:
	ldr r3, [r4, #0x34]
	adds r0, r2, #0
	adds r1, r2, #0
	bl WriteFadedPaletteFromArchive
	ldr r2, _080AE1FC  @ gLCDControlBuffer
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
	ldr r0, [r4, #0x2c]
	cmp r0, #0x80
	bne _080AE1F6
	adds r0, r4, #0
	bl Proc_Break
_080AE1F6:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080AE1FC: .4byte gLCDControlBuffer

	THUMB_FUNC_END FadeIn_Loop

	THUMB_FUNC_START FadeOut_Loop
FadeOut_Loop: @ 0x080AE200
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x2c]
	ldr r1, [r4, #0x30]
	adds r1, r0, r1
	str r1, [r4, #0x2c]
	adds r0, r4, #0
	adds r0, #0x29
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _080AE224
	lsls r0, r1, #1
	movs r1, #0x80
	lsls r1, r1, #1
	adds r2, r0, r1
	b _080AE22C
_080AE224:
	lsls r1, r1, #1
	movs r0, #0x80
	lsls r0, r0, #1
	subs r2, r0, r1
_080AE22C:
	ldr r3, [r4, #0x34]
	adds r0, r2, #0
	adds r1, r2, #0
	bl WriteFadedPaletteFromArchive
	ldr r0, [r4, #0x2c]
	cmp r0, #0x80
	bne _080AE242
	adds r0, r4, #0
	bl Proc_Break
_080AE242:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END FadeOut_Loop

	THUMB_FUNC_START FadeInOut_DisableGfx
FadeInOut_DisableGfx: @ 0x080AE248
	push {lr}
	ldr r1, [r0, #0x34]
	ldr r0, _080AE270  @ 0x0000FFFF
	cmp r1, r0
	bne _080AE278
	ldr r2, _080AE274  @ gLCDControlBuffer
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
	movs r1, #0x10
	orrs r0, r1
	b _080AE294
	.align 2, 0
_080AE270: .4byte 0x0000FFFF
_080AE274: .4byte gLCDControlBuffer
_080AE278:
	ldr r2, _080AE29C  @ gLCDControlBuffer
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
_080AE294:
	strb r0, [r2, #1]
	pop {r0}
	bx r0
	.align 2, 0
_080AE29C: .4byte gLCDControlBuffer

	THUMB_FUNC_END FadeInOut_DisableGfx

	THUMB_FUNC_START FadeInExists
FadeInExists: @ 0x080AE2A0
	push {lr}
	ldr r0, _080AE2B4  @ gUnknown_08A20DA4
	bl Proc_Find
	cmp r0, #0
	beq _080AE2AE
	movs r0, #1
_080AE2AE:
	pop {r1}
	bx r1
	.align 2, 0
_080AE2B4: .4byte gUnknown_08A20DA4

	THUMB_FUNC_END FadeInExists

	THUMB_FUNC_START FadeOutExists
FadeOutExists: @ 0x080AE2B8
	push {lr}
	ldr r0, _080AE2CC  @ gUnknown_08A20DCC
	bl Proc_Find
	cmp r0, #0
	beq _080AE2C6
	movs r0, #1
_080AE2C6:
	pop {r1}
	bx r1
	.align 2, 0
_080AE2CC: .4byte gUnknown_08A20DCC

	THUMB_FUNC_END FadeOutExists

	THUMB_FUNC_START NewFadeIn
NewFadeIn: @ 0x080AE2D0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080AE2F0  @ gUnknown_08A20DA4
	movs r1, #4
	bl Proc_Start
	adds r2, r0, #0
	adds r2, #0x29
	movs r1, #0
	strb r1, [r2]
	str r4, [r0, #0x30]
	subs r1, #1
	str r1, [r0, #0x34]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080AE2F0: .4byte gUnknown_08A20DA4

	THUMB_FUNC_END NewFadeIn

	THUMB_FUNC_START NewFadeOut
NewFadeOut: @ 0x080AE2F4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080AE314  @ gUnknown_08A20DCC
	movs r1, #4
	bl Proc_Start
	adds r2, r0, #0
	adds r2, #0x29
	movs r1, #0
	strb r1, [r2]
	str r4, [r0, #0x30]
	subs r1, #1
	str r1, [r0, #0x34]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080AE314: .4byte gUnknown_08A20DCC

	THUMB_FUNC_END NewFadeOut

	THUMB_FUNC_START sub_80AE318
sub_80AE318: @ 0x080AE318
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080AE338  @ gUnknown_08A20DA4
	bl Proc_StartBlocking
	adds r2, r0, #0
	adds r2, #0x29
	movs r1, #0
	strb r1, [r2]
	str r4, [r0, #0x30]
	subs r1, #1
	str r1, [r0, #0x34]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080AE338: .4byte gUnknown_08A20DA4

	THUMB_FUNC_END sub_80AE318

	THUMB_FUNC_START sub_80AE33C
sub_80AE33C: @ 0x080AE33C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080AE35C  @ gUnknown_08A20DCC
	bl Proc_StartBlocking
	adds r2, r0, #0
	adds r2, #0x29
	movs r1, #0
	strb r1, [r2]
	str r4, [r0, #0x30]
	subs r1, #1
	str r1, [r0, #0x34]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080AE35C: .4byte gUnknown_08A20DCC

	THUMB_FUNC_END sub_80AE33C

	THUMB_FUNC_START sub_80AE360
sub_80AE360: @ 0x080AE360
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080AE380  @ gUnknown_08A20DA4
	movs r1, #4
	bl Proc_Start
	adds r2, r0, #0
	adds r2, #0x29
	movs r1, #0
	strb r1, [r2]
	str r4, [r0, #0x30]
	ldr r1, _080AE384  @ 0x0000FFFF
	str r1, [r0, #0x34]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080AE380: .4byte gUnknown_08A20DA4
_080AE384: .4byte 0x0000FFFF

	THUMB_FUNC_END sub_80AE360

	THUMB_FUNC_START sub_80AE388
sub_80AE388: @ 0x080AE388
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080AE3A8  @ gUnknown_08A20DCC
	movs r1, #4
	bl Proc_Start
	adds r2, r0, #0
	adds r2, #0x29
	movs r1, #0
	strb r1, [r2]
	str r4, [r0, #0x30]
	ldr r1, _080AE3AC  @ 0x0000FFFF
	str r1, [r0, #0x34]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080AE3A8: .4byte gUnknown_08A20DCC
_080AE3AC: .4byte 0x0000FFFF

	THUMB_FUNC_END sub_80AE388

	THUMB_FUNC_START sub_80AE3B0
sub_80AE3B0: @ 0x080AE3B0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080AE3D0  @ gUnknown_08A20DA4
	movs r1, #4
	bl Proc_Start
	adds r2, r0, #0
	adds r2, #0x29
	movs r1, #1
	strb r1, [r2]
	str r4, [r0, #0x30]
	subs r1, #2
	str r1, [r0, #0x34]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080AE3D0: .4byte gUnknown_08A20DA4

	THUMB_FUNC_END sub_80AE3B0

	THUMB_FUNC_START sub_80AE3D4
sub_80AE3D4: @ 0x080AE3D4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080AE3F4  @ gUnknown_08A20DCC
	movs r1, #4
	bl Proc_Start
	adds r2, r0, #0
	adds r2, #0x29
	movs r1, #1
	strb r1, [r2]
	str r4, [r0, #0x30]
	subs r1, #2
	str r1, [r0, #0x34]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080AE3F4: .4byte gUnknown_08A20DCC

	THUMB_FUNC_END sub_80AE3D4

	THUMB_FUNC_START sub_80AE3F8
sub_80AE3F8: @ 0x080AE3F8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080AE418  @ gUnknown_08A20DA4
	bl Proc_StartBlocking
	adds r2, r0, #0
	adds r2, #0x29
	movs r1, #1
	strb r1, [r2]
	str r4, [r0, #0x30]
	subs r1, #2
	str r1, [r0, #0x34]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080AE418: .4byte gUnknown_08A20DA4

	THUMB_FUNC_END sub_80AE3F8

	THUMB_FUNC_START sub_80AE41C
sub_80AE41C: @ 0x080AE41C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080AE43C  @ gUnknown_08A20DCC
	bl Proc_StartBlocking
	adds r2, r0, #0
	adds r2, #0x29
	movs r1, #1
	strb r1, [r2]
	str r4, [r0, #0x30]
	subs r1, #2
	str r1, [r0, #0x34]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080AE43C: .4byte gUnknown_08A20DCC

	THUMB_FUNC_END sub_80AE41C

	THUMB_FUNC_START sub_80AE440
sub_80AE440: @ 0x080AE440
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080AE460  @ gUnknown_08A20DA4
	movs r1, #4
	bl Proc_Start
	adds r2, r0, #0
	adds r2, #0x29
	movs r1, #1
	strb r1, [r2]
	str r4, [r0, #0x30]
	ldr r1, _080AE464  @ 0x0000FFFF
	str r1, [r0, #0x34]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080AE460: .4byte gUnknown_08A20DA4
_080AE464: .4byte 0x0000FFFF

	THUMB_FUNC_END sub_80AE440

	THUMB_FUNC_START sub_80AE468
sub_80AE468: @ 0x080AE468
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080AE488  @ gUnknown_08A20DCC
	movs r1, #4
	bl Proc_Start
	adds r2, r0, #0
	adds r2, #0x29
	movs r1, #1
	strb r1, [r2]
	str r4, [r0, #0x30]
	ldr r1, _080AE48C  @ 0x0000FFFF
	str r1, [r0, #0x34]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080AE488: .4byte gUnknown_08A20DCC
_080AE48C: .4byte 0x0000FFFF

	THUMB_FUNC_END sub_80AE468

	THUMB_FUNC_START sub_80AE490
sub_80AE490: @ 0x080AE490
	push {lr}
	sub sp, #4
	movs r0, #0
	str r0, [sp]
	ldr r1, _080AE4AC  @ gPaletteBuffer
	ldr r2, _080AE4B0  @ 0x01000100
	mov r0, sp
	bl CpuFastSet
	bl EnablePaletteSync
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_080AE4AC: .4byte gPaletteBuffer
_080AE4B0: .4byte 0x01000100

	THUMB_FUNC_END sub_80AE490

	THUMB_FUNC_START sub_80AE4B4
sub_80AE4B4: @ 0x080AE4B4
	push {lr}
	ldr r0, _080AE4D0  @ gUnknown_08A20DA4
	bl Proc_Find
	bl Proc_End
	ldr r0, _080AE4D4  @ gUnknown_08A20DCC
	bl Proc_Find
	bl Proc_End
	pop {r0}
	bx r0
	.align 2, 0
_080AE4D0: .4byte gUnknown_08A20DA4
_080AE4D4: .4byte gUnknown_08A20DCC

	THUMB_FUNC_END sub_80AE4B4

	THUMB_FUNC_START sub_80AE4D8
sub_80AE4D8: @ 0x080AE4D8
	adds r2, r0, #0
	movs r0, #0
	str r0, [r2, #0x2c]
	adds r1, r2, #0
	adds r1, #0x34
	strb r0, [r1]
	str r0, [r2, #0x3c]
	str r0, [r2, #0x44]
	str r0, [r2, #0x40]
	str r0, [r2, #0x48]
	adds r1, #3
	strb r0, [r1]
	adds r1, #1
	strb r0, [r1]
	str r0, [r2, #0x4c]
	str r0, [r2, #0x50]
	str r0, [r2, #0x58]
	adds r1, #1
	strb r0, [r1]
	str r0, [r2, #0x54]
	movs r1, #0
	strh r0, [r2, #0x30]
	strh r0, [r2, #0x32]
	adds r3, r2, #0
	adds r3, #0x3a
	movs r0, #1
	strb r0, [r3]
	adds r0, r2, #0
	adds r0, #0x36
	strb r1, [r0]
	bx lr

	THUMB_FUNC_END sub_80AE4D8

	THUMB_FUNC_START sub_80AE518
sub_80AE518: @ 0x080AE518
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	adds r5, r0, #0
	ldr r6, [r5, #0x2c]
	ldr r0, [r5, #0x58]
	cmp r0, #0
	beq _080AE54C
	adds r1, r5, #0
	adds r1, #0x39
	movs r0, #0
	strb r0, [r1]
	ldr r1, [r5, #0x58]
	adds r0, r5, #0
	bl _call_via_r1
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080AE542
	b _080AE70E
_080AE542:
	b _080AE54E
_080AE544:
	adds r0, r5, #0
	bl Proc_Break
	b _080AE706
_080AE54C:
	str r0, [r5, #0x58]
_080AE54E:
	movs r0, #0x37
	adds r0, r0, r5
	mov r9, r0
_080AE554:
	ldrb r0, [r6]
	cmp r0, #4
	bne _080AE55C
	adds r6, #0xc
_080AE55C:
	ldrb r0, [r6]
	cmp r0, #5
	bne _080AE5AE
	adds r0, r5, #0
	adds r0, #0x3a
	movs r1, #0
	ldrsb r1, [r0, r1]
	cmp r1, #0
	beq _080AE5A6
	subs r0, #4
	ldrb r3, [r0]
	movs r1, #0
	ldrsb r1, [r0, r1]
	adds r2, r0, #0
	cmp r1, #0
	bne _080AE580
	ldrb r0, [r6, #0xa]
	b _080AE586
_080AE580:
	cmp r1, #0
	ble _080AE588
	subs r0, r3, #1
_080AE586:
	strb r0, [r2]
_080AE588:
	movs r0, #0
	ldrsb r0, [r2, r0]
	cmp r0, #0
	beq _080AE5AC
	adds r1, r6, #0
	subs r1, #0xc
	ldrb r0, [r1]
	cmp r0, #4
	beq _080AE5AE
_080AE59A:
	adds r6, r1, #0
	subs r1, #0xc
	ldrb r0, [r1]
	cmp r0, #4
	bne _080AE59A
	b _080AE5AE
_080AE5A6:
	adds r0, r5, #0
	adds r0, #0x36
	strb r1, [r0]
_080AE5AC:
	adds r6, #0xc
_080AE5AE:
	ldrb r0, [r6]
	cmp r0, #8
	bne _080AE5D2
	ldr r0, [r5, #0x58]
	cmp r0, #0
	beq _080AE5D0
	ldr r0, [r5, #0x54]
	adds r0, #1
	str r0, [r5, #0x54]
	adds r1, r5, #0
	adds r1, #0x39
	movs r0, #1
	strb r0, [r1]
	ldr r1, [r5, #0x58]
	adds r0, r5, #0
	bl _call_via_r1
_080AE5D0:
	adds r6, #0xc
_080AE5D2:
	ldrb r0, [r6]
	cmp r0, #6
	bne _080AE5DA
	b _080AE706
_080AE5DA:
	subs r0, #9
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bls _080AE544
	adds r0, r5, #0
	adds r0, #0x38
	ldrb r1, [r0]
	mov r8, r0
	cmp r1, #0
	bne _080AE6EA
	ldrb r0, [r6]
	cmp r0, #1
	bgt _080AE60A
	cmp r0, #0
	blt _080AE60A
	ldr r0, [r5, #0x44]
	cmp r0, #0
	bne _080AE60A
	mov r2, r9
	ldrb r1, [r2]
	movs r0, #1
	subs r0, r0, r1
	strb r0, [r2]
_080AE60A:
	ldrb r0, [r6]
	cmp r0, #1
	beq _080AE64A
	cmp r0, #1
	bgt _080AE61A
	cmp r0, #0
	beq _080AE624
	b _080AE6EA
_080AE61A:
	cmp r0, #2
	beq _080AE674
	cmp r0, #3
	beq _080AE6D8
	b _080AE6EA
_080AE624:
	ldr r0, [r6, #4]
	ldr r2, [r5, #0x40]
	movs r1, #0xc0
	lsls r1, r1, #0x13
	adds r2, r2, r1
	ldr r1, [r5, #0x3c]
	adds r1, r1, r2
	ldr r2, [r5, #0x44]
	adds r1, r1, r2
	mov r2, r9
	ldrb r3, [r2]
	ldr r2, [r5, #0x48]
	muls r2, r3, r2
	adds r1, r1, r2
	ldrh r2, [r6, #8]
	lsrs r2, r2, #2
	bl CpuFastSet
	b _080AE66A
_080AE64A:
	ldr r0, [r6, #4]
	ldr r2, [r5, #0x40]
	movs r1, #0xc0
	lsls r1, r1, #0x13
	adds r2, r2, r1
	ldr r1, [r5, #0x3c]
	adds r1, r1, r2
	ldr r2, [r5, #0x44]
	adds r1, r1, r2
	mov r2, r9
	ldrb r3, [r2]
	ldr r2, [r5, #0x48]
	muls r2, r3, r2
	adds r1, r1, r2
	bl CopyDataWithPossibleUncomp
_080AE66A:
	ldrh r1, [r6, #8]
	ldr r0, [r5, #0x44]
	adds r0, r0, r1
	str r0, [r5, #0x44]
	b _080AE6EA
_080AE674:
	ldr r1, [r5, #0x48]
	movs r0, #0x80
	lsls r0, r0, #8
	adds r4, r5, #0
	adds r4, #0x37
	adds r7, r5, #0
	adds r7, #0x34
	cmp r1, r0
	bne _080AE69A
	ldrb r0, [r7]
	mov r1, r9
	ldrb r2, [r1]
	lsls r2, r2, #0xf
	ldr r1, [r5, #0x3c]
	adds r1, r1, r2
	ldr r2, _080AE6D4  @ 0x0000FFFF
	ands r1, r2
	bl SetBackgroundTileDataOffset
_080AE69A:
	ldrb r0, [r7]
	bl BG_GetMapBuffer
	ldr r1, [r6, #4]
	adds r2, r5, #0
	adds r2, #0x35
	ldrb r2, [r2]
	lsls r2, r2, #0xc
	ldrb r4, [r4]
	ldr r3, [r5, #0x48]
	muls r4, r3, r4
	ldr r3, [r5, #0x40]
	adds r3, r3, r4
	lsls r3, r3, #0x11
	lsrs r3, r3, #0x16
	adds r2, r2, r3
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	bl CallARM_FillTileRect
	movs r0, #0
	str r0, [r5, #0x44]
	movs r0, #1
	ldrb r7, [r7]
	lsls r0, r7
	bl BG_EnableSyncByMask
	b _080AE6EA
	.align 2, 0
_080AE6D4: .4byte 0x0000FFFF
_080AE6D8:
	ldr r0, [r6, #4]
	adds r1, r5, #0
	adds r1, #0x35
	ldrb r1, [r1]
	lsls r1, r1, #5
	ldrh r2, [r6, #8]
	lsls r2, r2, #5
	bl CopyToPaletteBuffer
_080AE6EA:
	mov r2, r8
	ldrb r0, [r2]
	adds r0, #1
	movs r1, #0
	strb r0, [r2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrb r2, [r6, #0xa]
	cmp r0, r2
	bls _080AE706
	adds r6, #0xc
	mov r0, r8
	strb r1, [r0]
	b _080AE554
_080AE706:
	str r6, [r5, #0x2c]
	ldr r0, [r5, #0x50]
	adds r0, #1
	str r0, [r5, #0x50]
_080AE70E:
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80AE518

	THUMB_FUNC_START sub_80AE71C
sub_80AE71C: @ 0x080AE71C
	push {r4, lr}
	adds r1, r0, #0
	ldr r0, [r1, #0x2c]
	ldrb r0, [r0]
	cmp r0, #0xa
	bne _080AE74A
	adds r4, r1, #0
	adds r4, #0x34
	ldrb r0, [r4]
	ldr r1, [r1, #0x3c]
	bl SetBackgroundTileDataOffset
	ldrb r0, [r4]
	bl BG_GetMapBuffer
	movs r1, #0
	bl BG_Fill
	movs r0, #1
	ldrb r4, [r4]
	lsls r0, r4
	bl BG_EnableSyncByMask
_080AE74A:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80AE71C

	THUMB_FUNC_START sub_80AE750
sub_80AE750: @ 0x080AE750
	push {lr}
	ldr r0, _080AE760  @ gUnknown_08A20DFC
	bl Proc_Find
	cmp r0, #0
	bne _080AE764
	movs r0, #0
	b _080AE766
	.align 2, 0
_080AE760: .4byte gUnknown_08A20DFC
_080AE764:
	movs r0, #1
_080AE766:
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80AE750

	THUMB_FUNC_START sub_80AE76C
sub_80AE76C: @ 0x080AE76C
	push {lr}
	ldr r0, _080AE78C  @ gUnknown_08A20DFC
	bl Proc_Find
	adds r1, r0, #0
	cmp r1, #0
	beq _080AE788
	ldr r2, [r1, #0x2c]
	ldrb r0, [r2]
	cmp r0, #6
	bne _080AE788
	adds r0, r2, #0
	adds r0, #0xc
	str r0, [r1, #0x2c]
_080AE788:
	pop {r0}
	bx r0
	.align 2, 0
_080AE78C: .4byte gUnknown_08A20DFC

	THUMB_FUNC_END sub_80AE76C

	THUMB_FUNC_START sub_80AE790
sub_80AE790: @ 0x080AE790
	push {lr}
	ldr r0, _080AE7A0  @ gUnknown_08A20DFC
	bl Proc_Find
	bl Proc_End
	pop {r0}
	bx r0
	.align 2, 0
_080AE7A0: .4byte gUnknown_08A20DFC

	THUMB_FUNC_END sub_80AE790

	THUMB_FUNC_START sub_80AE7A4
sub_80AE7A4: @ 0x080AE7A4
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r0, _080AE7C0  @ gUnknown_08A20DFC
	bl Proc_Find
	cmp r0, #0
	beq _080AE7B8
	adds r0, #0x3a
	strb r4, [r0]
_080AE7B8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080AE7C0: .4byte gUnknown_08A20DFC

	THUMB_FUNC_END sub_80AE7A4

	THUMB_FUNC_START sub_80AE7C4
sub_80AE7C4: @ 0x080AE7C4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	adds r5, r0, #0
	mov r8, r1
	mov r9, r2
	mov sl, r3
	ldr r6, [sp, #0x20]
	ldr r7, [sp, #0x24]
	ldr r1, [sp, #0x30]
	cmp r1, #0
	bne _080AE7EC
	ldr r0, _080AE7E8  @ gUnknown_08A20DFC
	movs r1, #3
	b _080AE7EE
	.align 2, 0
_080AE7E8: .4byte gUnknown_08A20DFC
_080AE7EC:
	ldr r0, _080AE848  @ gUnknown_08A20DFC
_080AE7EE:
	bl Proc_Start
	adds r4, r0, #0
	str r5, [r4, #0x2c]
	adds r0, r4, #0
	adds r0, #0x34
	mov r1, r8
	strb r1, [r0]
	adds r1, r4, #0
	adds r1, #0x35
	ldr r0, [sp, #0x28]
	strb r0, [r1]
	cmp r7, #0
	bge _080AE80E
	movs r7, #0x80
	lsls r7, r7, #7
_080AE80E:
	cmp r6, #0
	bge _080AE814
	movs r6, #0
_080AE814:
	mov r0, r8
	bl GetBackgroundTileDataOffset
	str r0, [r4, #0x3c]
	str r6, [r4, #0x40]
	str r7, [r4, #0x48]
	mov r2, r9
	strh r2, [r4, #0x30]
	mov r6, sl
	strh r6, [r4, #0x32]
	ldr r0, [sp, #0x2c]
	str r0, [r4, #0x58]
	mov r1, r8
	lsls r0, r1, #0x10
	lsrs r0, r0, #0x10
	mov r2, r9
	negs r1, r2
	movs r3, #0xff
	ands r1, r3
	mov r6, sl
	negs r2, r6
	ands r2, r3
	bl BG_SetPosition
	b _080AE856
	.align 2, 0
_080AE848: .4byte gUnknown_08A20DFC
_080AE84C:
	ldrb r0, [r5, #0xa]
	ldr r1, [r4, #0x4c]
	adds r1, r1, r0
	str r1, [r4, #0x4c]
	adds r5, #0xc
_080AE856:
	ldrb r0, [r5]
	cmp r0, #9
	bls _080AE84C
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80AE7C4

	THUMB_FUNC_START sub_80AE86C
sub_80AE86C: @ 0x080AE86C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r6, r1, #0
	ldr r1, [r0, #0x30]
	lsls r1, r1, #5
	ldr r2, _080AE92C  @ gPaletteBuffer
	adds r1, r1, r2
	mov r8, r1
	ldr r1, [r0, #0x3c]
	mov ip, r1
	ldr r7, [r0, #0x40]
	movs r1, #0
	ldr r0, [r0, #0x34]
	cmp r1, r0
	bge _080AE918
	str r0, [sp, #4]
	movs r0, #0x80
	subs r5, r0, r6
	movs r0, #0xf8
	lsls r0, r0, #7
	mov sl, r0
_080AE89E:
	adds r1, #1
	str r1, [sp]
	movs r1, #0xf
	mov r9, r1
_080AE8A6:
	mov r0, ip
	ldrh r4, [r0]
	movs r0, #0x1f
	ands r0, r4
	adds r2, r0, #0
	muls r2, r5, r2
	ldrh r3, [r7]
	movs r0, #0x1f
	ands r0, r3
	muls r0, r6, r0
	adds r2, r2, r0
	asrs r2, r2, #7
	movs r1, #0x1f
	ands r2, r1
	movs r0, #0xf8
	lsls r0, r0, #2
	ands r0, r4
	adds r1, r0, #0
	muls r1, r5, r1
	movs r0, #0xf8
	lsls r0, r0, #2
	ands r0, r3
	muls r0, r6, r0
	adds r1, r1, r0
	asrs r1, r1, #7
	movs r0, #0xf8
	lsls r0, r0, #2
	ands r1, r0
	adds r2, r2, r1
	mov r0, sl
	ands r0, r4
	adds r1, r0, #0
	muls r1, r5, r1
	mov r0, sl
	ands r0, r3
	muls r0, r6, r0
	adds r1, r1, r0
	asrs r1, r1, #7
	mov r0, sl
	ands r1, r0
	adds r2, r2, r1
	mov r1, r8
	strh r2, [r1]
	movs r0, #2
	add r8, r0
	add ip, r0
	adds r7, #2
	movs r1, #1
	negs r1, r1
	add r9, r1
	mov r0, r9
	cmp r0, #0
	bge _080AE8A6
	ldr r1, [sp]
	ldr r0, [sp, #4]
	cmp r1, r0
	blt _080AE89E
_080AE918:
	bl EnablePaletteSync
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080AE92C: .4byte gPaletteBuffer

	THUMB_FUNC_END sub_80AE86C

	THUMB_FUNC_START sub_80AE930
sub_80AE930: @ 0x080AE930
	movs r1, #0
	str r1, [r0, #0x38]
	bx lr

	THUMB_FUNC_END sub_80AE930

	THUMB_FUNC_START sub_80AE938
sub_80AE938: @ 0x080AE938
	push {lr}
	adds r2, r0, #0
	ldr r0, [r2, #0x38]
	ldr r1, [r2, #0x2c]
	adds r0, r0, r1
	str r0, [r2, #0x38]
	movs r1, #0x80
	lsls r1, r1, #1
	cmp r0, r1
	ble _080AE950
	movs r0, #0
	str r0, [r2, #0x38]
_080AE950:
	ldr r0, [r2, #0x38]
	subs r1, r1, r0
	cmp r0, #0x7f
	bgt _080AE95A
	adds r1, r0, #0
_080AE95A:
	adds r0, r2, #0
	bl sub_80AE86C
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80AE938

	THUMB_FUNC_START sub_80AE964
sub_80AE964: @ 0x080AE964
	push {r4, r5, r6, lr}
	mov r6, r9
	mov r5, r8
	push {r5, r6}
	mov r8, r0
	mov r9, r1
	adds r4, r2, #0
	adds r5, r3, #0
	ldr r6, [sp, #0x18]
	ldr r1, [sp, #0x1c]
	ldr r0, _080AE998  @ gUnknown_08A20E24
	bl Proc_Start
	str r4, [r0, #0x2c]
	str r5, [r0, #0x30]
	str r6, [r0, #0x34]
	mov r1, r8
	str r1, [r0, #0x3c]
	mov r1, r9
	str r1, [r0, #0x40]
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080AE998: .4byte gUnknown_08A20E24

	THUMB_FUNC_END sub_80AE964

	THUMB_FUNC_START sub_80AE99C
sub_80AE99C: @ 0x080AE99C
	push {lr}
	ldr r0, _080AE9AC  @ gUnknown_08A20E24
	bl Proc_Find
	bl Proc_End
	pop {r0}
	bx r0
	.align 2, 0
_080AE9AC: .4byte gUnknown_08A20E24

	THUMB_FUNC_END sub_80AE99C

	THUMB_FUNC_START sub_80AE9B0
sub_80AE9B0: @ 0x080AE9B0
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	sub sp, #8
	adds r5, r0, #0
	adds r6, r1, #0
	mov r8, r2
	mov r9, r3
	ldr r4, [sp, #0x2c]
	ldr r0, [sp, #0x34]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r7, r0, #0
	cmp r5, #0
	beq _080AE9E0
	ldr r1, _080AEA1C  @ 0x000003FF
	ands r1, r0
	lsls r1, r1, #5
	ldr r0, _080AEA20  @ 0x06010000
	adds r1, r1, r0
	adds r0, r5, #0
	bl CopyDataWithPossibleUncomp
_080AE9E0:
	cmp r6, #0
	beq _080AE9F4
	adds r1, r4, #0
	adds r1, #0x10
	lsls r1, r1, #5
	ldr r2, [sp, #0x30]
	lsls r2, r2, #5
	adds r0, r6, #0
	bl CopyToPaletteBuffer
_080AE9F4:
	movs r0, #0xf
	ands r4, r0
	lsls r3, r4, #0xc
	adds r3, r3, r7
	ldr r0, [sp, #0x28]
	str r0, [sp]
	ldr r0, [sp, #0x38]
	str r0, [sp, #4]
	mov r0, r8
	mov r1, r9
	ldr r2, [sp, #0x24]
	bl APProc_Create
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080AEA1C: .4byte 0x000003FF
_080AEA20: .4byte 0x06010000

	THUMB_FUNC_END sub_80AE9B0

	THUMB_FUNC_START sub_80AEA24
sub_80AEA24: @ 0x080AEA24
	push {lr}
	adds r1, r0, #0
	cmp r1, #1
	beq _080AEA4C
	cmp r1, #1
	bgt _080AEA36
	cmp r1, #0
	beq _080AEA40
	b _080AEA68
_080AEA36:
	cmp r1, #2
	beq _080AEA58
	cmp r1, #3
	beq _080AEA64
	b _080AEA68
_080AEA40:
	ldr r0, _080AEA48  @ gLCDControlBuffer
	ldrh r0, [r0, #0x1c]
	b _080AEA68
	.align 2, 0
_080AEA48: .4byte gLCDControlBuffer
_080AEA4C:
	ldr r0, _080AEA54  @ gLCDControlBuffer
	ldrh r0, [r0, #0x20]
	b _080AEA68
	.align 2, 0
_080AEA54: .4byte gLCDControlBuffer
_080AEA58:
	ldr r0, _080AEA60  @ gLCDControlBuffer
	ldrh r0, [r0, #0x24]
	b _080AEA68
	.align 2, 0
_080AEA60: .4byte gLCDControlBuffer
_080AEA64:
	ldr r0, _080AEA6C  @ gLCDControlBuffer
	ldrh r0, [r0, #0x28]
_080AEA68:
	pop {r1}
	bx r1
	.align 2, 0
_080AEA6C: .4byte gLCDControlBuffer

	THUMB_FUNC_END sub_80AEA24

	THUMB_FUNC_START sub_80AEA70
sub_80AEA70: @ 0x080AEA70
	push {lr}
	adds r1, r0, #0
	cmp r1, #1
	beq _080AEA98
	cmp r1, #1
	bgt _080AEA82
	cmp r1, #0
	beq _080AEA8C
	b _080AEAB4
_080AEA82:
	cmp r1, #2
	beq _080AEAA4
	cmp r1, #3
	beq _080AEAB0
	b _080AEAB4
_080AEA8C:
	ldr r0, _080AEA94  @ gLCDControlBuffer
	ldrh r0, [r0, #0x1e]
	b _080AEAB4
	.align 2, 0
_080AEA94: .4byte gLCDControlBuffer
_080AEA98:
	ldr r0, _080AEAA0  @ gLCDControlBuffer
	ldrh r0, [r0, #0x22]
	b _080AEAB4
	.align 2, 0
_080AEAA0: .4byte gLCDControlBuffer
_080AEAA4:
	ldr r0, _080AEAAC  @ gLCDControlBuffer
	ldrh r0, [r0, #0x26]
	b _080AEAB4
	.align 2, 0
_080AEAAC: .4byte gLCDControlBuffer
_080AEAB0:
	ldr r0, _080AEAB8  @ gLCDControlBuffer
	ldrh r0, [r0, #0x2a]
_080AEAB4:
	pop {r1}
	bx r1
	.align 2, 0
_080AEAB8: .4byte gLCDControlBuffer

	THUMB_FUNC_END sub_80AEA70

	THUMB_FUNC_START sub_80AEABC
sub_80AEABC: @ 0x080AEABC
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	adds r0, r4, #0
	adds r1, r5, #0
	bl strcpy
	adds r0, r5, #0
	bl strlen
	adds r4, r4, r0
	adds r0, r4, #0
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80AEABC

	THUMB_FUNC_START sub_80AEADC
sub_80AEADC: @ 0x080AEADC
	strb r0, [r1]
	adds r1, #1
	movs r0, #0
	strb r0, [r1]
	adds r0, r1, #0
	bx lr

	THUMB_FUNC_END sub_80AEADC

	THUMB_FUNC_START sub_80AEAE8
sub_80AEAE8: @ 0x080AEAE8
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	adds r6, r1, #0
	ldr r0, [r5]
	mov r1, sp
	bl GetCharTextWidth
	adds r4, r0, #0
	ldr r1, [r5]
	subs r4, r4, r1
	ldr r0, [r6]
	adds r2, r4, #0
	bl memcpy
	ldr r0, [r5]
	adds r0, r0, r4
	str r0, [r5]
	ldr r0, [r6]
	adds r0, r0, r4
	str r0, [r6]
	adds r0, r4, #0
	add sp, #4
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80AEAE8

	THUMB_FUNC_START sub_80AEB1C
sub_80AEB1C: @ 0x080AEB1C
	push {lr}
	movs r0, #0
	bl SetPrimaryHBlankHandler
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80AEB1C

	THUMB_FUNC_START sub_80AEB28
sub_80AEB28: @ 0x080AEB28
	push {lr}
	sub sp, #4
	adds r3, r0, #0
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #0
	str r0, [sp]
	movs r2, #0
	bl sub_80029E8
	add sp, #4
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80AEB28

	THUMB_FUNC_START sub_80AEB44
sub_80AEB44: @ 0x080AEB44
	push {lr}
	sub sp, #4
	movs r2, #0x80
	lsls r2, r2, #1
	movs r1, #0
	str r1, [sp]
	adds r1, r2, #0
	movs r3, #0x20
	bl sub_80029E8
	add sp, #4
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80AEB44

	THUMB_FUNC_START sub_80AEB60
sub_80AEB60: @ 0x080AEB60
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080AEB88  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080AEB76
	movs r0, #0x70
	bl m4aSongNumStart
_080AEB76:
	ldr r0, [r4, #0x2c]
	ldr r1, [r4, #0x30]
	ldr r2, [r4, #0x58]
	bl StartHelpBox_Unk
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080AEB88: .4byte gRAMChapterData

	THUMB_FUNC_END sub_80AEB60

	THUMB_FUNC_START sub_80AEB8C
sub_80AEB8C: @ 0x080AEB8C
	push {lr}
	adds r2, r0, #0
	ldr r0, _080AEBC0  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	ldr r0, _080AEBC4  @ 0x0000030B
	ands r0, r1
	cmp r0, #0
	beq _080AEBBA
	adds r0, r2, #0
	bl Proc_Break
	ldr r0, _080AEBC8  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080AEBB6
	movs r0, #0x71
	bl m4aSongNumStart
_080AEBB6:
	bl CloseHelpBox
_080AEBBA:
	pop {r0}
	bx r0
	.align 2, 0
_080AEBC0: .4byte gKeyStatusPtr
_080AEBC4: .4byte 0x0000030B
_080AEBC8: .4byte gRAMChapterData

	THUMB_FUNC_END sub_80AEB8C

	THUMB_FUNC_START sub_80AEBCC
sub_80AEBCC: @ 0x080AEBCC
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	adds r1, r3, #0
	ldr r0, _080AEBE8  @ gUnknown_08A20E44
	bl Proc_StartBlocking
	str r4, [r0, #0x2c]
	str r5, [r0, #0x30]
	str r6, [r0, #0x58]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080AEBE8: .4byte gUnknown_08A20E44

	THUMB_FUNC_END sub_80AEBCC

	THUMB_FUNC_START sub_80AEBEC
sub_80AEBEC: @ 0x080AEBEC
	push {r4, lr}
	movs r4, #0
_080AEBF0:
	adds r4, #1
	movs r1, #0xa
	bl __divsi3
	cmp r0, #0
	bne _080AEBF0
	adds r0, r4, #0
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80AEBEC

	THUMB_FUNC_START sub_80AEC04
sub_80AEC04: @ 0x080AEC04
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r5, r1, #0
	ldr r4, [sp, #0x14]
	ldr r0, [sp, #0x18]
	subs r7, r2, r6
	subs r2, r0, r5
	adds r1, r7, #0
	muls r1, r2, r1
	subs r3, r3, r5
	subs r4, r4, r6
	adds r0, r3, #0
	muls r0, r4, r0
	subs r1, r1, r0
	cmp r1, #0
	blt _080AEC4C
	ldr r0, [sp, #0x20]
	subs r5, r0, r5
	adds r1, r4, #0
	muls r1, r5, r1
	ldr r0, [sp, #0x1c]
	subs r4, r0, r6
	adds r0, r2, #0
	muls r0, r4, r0
	subs r1, r1, r0
	cmp r1, #0
	blt _080AEC4C
	adds r0, r4, #0
	muls r0, r3, r0
	adds r1, r5, #0
	muls r1, r7, r1
	subs r0, r0, r1
	cmp r0, #0
	blt _080AEC4C
	movs r0, #1
	b _080AEC4E
_080AEC4C:
	movs r0, #0
_080AEC4E:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80AEC04

	THUMB_FUNC_START sub_80AEC54
sub_80AEC54: @ 0x080AEC54
	push {lr}
	sub sp, #0x64
	mov r0, sp
	bl LoadGeneralGameMetadata
	movs r0, #0
	add sp, #0x64
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80AEC54

	THUMB_FUNC_START sub_80AEC68
sub_80AEC68: @ 0x080AEC68
	push {lr}
	sub sp, #0x64
	mov r0, sp
	bl LoadGeneralGameMetadata
	movs r0, #0
	add sp, #0x64
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80AEC68

	THUMB_FUNC_START sub_80AEC7C
sub_80AEC7C: @ 0x080AEC7C
	push {lr}
	adds r0, #0x34
	ldrb r0, [r0]
	cmp r0, #0x64
	beq _080AEC8A
	movs r0, #0
	b _080AEC8C
_080AEC8A:
	movs r0, #1
_080AEC8C:
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80AEC7C

	THUMB_FUNC_START sub_80AEC90
sub_80AEC90: @ 0x080AEC90
	movs r0, #0
	bx lr

	THUMB_FUNC_END sub_80AEC90

	THUMB_FUNC_START sub_80AEC94
sub_80AEC94: @ 0x080AEC94
	push {lr}
	movs r2, #0
	ldr r1, _080AECA8  @ gUnknown_08A20E74
_080AEC9A:
	ldr r0, [r1]
	cmp r0, #0
	blt _080AECAC
	adds r1, #0x10
	adds r2, #1
	b _080AEC9A
	.align 2, 0
_080AECA8: .4byte gUnknown_08A20E74
_080AECAC:
	adds r0, r2, #0
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80AEC94

	THUMB_FUNC_START sub_80AECB4
sub_80AECB4: @ 0x080AECB4
	push {r4, r5, lr}
	movs r3, #0
	movs r4, #0
	ldr r0, _080AECD0  @ gUnknown_08A20E74
	adds r5, r0, #0
	adds r5, #8
	adds r2, r0, #0
_080AECC2:
	lsls r1, r3, #4
	ldr r0, [r2]
	cmp r0, #0
	bge _080AECD4
	adds r0, r4, #0
	b _080AECE4
	.align 2, 0
_080AECD0: .4byte gUnknown_08A20E74
_080AECD4:
	adds r0, r1, r5
	ldr r0, [r0]
	cmp r0, #0
	beq _080AECDE
	adds r4, #1
_080AECDE:
	adds r2, #0x10
	adds r3, #1
	b _080AECC2
_080AECE4:
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80AECB4

	THUMB_FUNC_START sub_80AECEC
sub_80AECEC: @ 0x080AECEC
	push {lr}
	asrs r3, r1, #5
	lsls r3, r3, #2
	adds r3, r3, r0
	movs r2, #0x1f
	ands r2, r1
	ldr r0, [r3, #0x40]
	lsrs r0, r2
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _080AED08
	movs r0, #0
	b _080AED0A
_080AED08:
	movs r0, #1
_080AED0A:
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80AECEC

	THUMB_FUNC_START sub_80AED10
sub_80AED10: @ 0x080AED10
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	movs r2, #0
	movs r4, #0
	ldr r3, _080AED2C  @ gUnknown_08A20E74
	adds r5, r3, #0
_080AED1C:
	lsls r1, r2, #4
	adds r0, r1, r5
	ldr r0, [r0]
	cmp r0, #0
	bge _080AED30
	adds r0, r4, #0
	b _080AED5E
	.align 2, 0
_080AED2C: .4byte gUnknown_08A20E74
_080AED30:
	adds r0, r3, #0
	adds r0, #8
	adds r0, r1, r0
	ldr r0, [r0]
	cmp r0, #0
	beq _080AED56
	asrs r1, r2, #5
	lsls r1, r1, #2
	adds r1, r1, r6
	movs r0, #0x1f
	ands r0, r2
	ldr r1, [r1, #0x40]
	lsrs r1, r0
	movs r0, #1
	ands r1, r0
	adds r0, r2, #1
	cmp r1, #0
	beq _080AED5A
	b _080AED58
_080AED56:
	adds r0, r2, #1
_080AED58:
	adds r4, r0, #0
_080AED5A:
	adds r2, r0, #0
	b _080AED1C
_080AED5E:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80AED10

	THUMB_FUNC_START sub_80AED64
sub_80AED64: @ 0x080AED64
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x2c
	adds r7, r0, #0
	bl sub_80AEC94
	movs r1, #0x36
	adds r1, r1, r7
	mov r8, r1
	movs r1, #0
	mov r2, r8
	strb r0, [r2]
	add r0, sp, #0x24
	movs r4, #0
	strh r1, [r0]
	adds r1, r7, #0
	adds r1, #0x40
	ldr r2, _080AEEB8  @ 0x01000008
	bl CpuSet
	adds r5, r7, #0
	adds r5, #0x33
	strb r4, [r5]
	mov r0, sp
	bl sub_80A3E4C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080AEE9A
	movs r6, #0
	ldr r1, _080AEEBC  @ gUnknown_08A20E74
	ldr r0, [r1]
	mov r9, r8
	mov r8, r5
	movs r3, #0x34
	adds r3, r3, r7
	mov sl, r3
	cmp r0, #0
	blt _080AEE0C
	movs r4, #0
	movs r0, #8
	adds r0, r0, r1
	mov ip, r0
_080AEDC0:
	mov r2, ip
	ldr r0, [r2]
	cmp r0, #0
	bne _080AEDFA
	adds r0, r4, r1
	ldr r1, [r0]
	asrs r0, r1, #5
	lsls r0, r0, #2
	add r0, sp
	movs r3, #0x1f
	ands r1, r3
	ldr r0, [r0]
	lsrs r0, r1
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _080AEDFA
	asrs r2, r6, #5
	lsls r2, r2, #2
	adds r2, r2, r7
	adds r0, r6, #0
	ands r0, r3
	lsls r1, r0
	ldr r0, [r2, #0x40]
	orrs r0, r1
	str r0, [r2, #0x40]
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
_080AEDFA:
	adds r4, #0x10
	movs r3, #0x10
	add ip, r3
	adds r6, #1
	ldr r1, _080AEEBC  @ gUnknown_08A20E74
	adds r0, r4, r1
	ldr r0, [r0]
	cmp r0, #0
	bge _080AEDC0
_080AEE0C:
	bl sub_80AECB4
	adds r2, r0, #0
	mov r0, r8
	ldrb r1, [r0]
	movs r0, #0x64
	muls r0, r1, r0
	mov r3, r9
	ldrb r1, [r3]
	subs r1, r1, r2
	bl __divsi3
	mov r1, sl
	strb r0, [r1]
	movs r6, #0
	ldr r1, _080AEEBC  @ gUnknown_08A20E74
	ldr r0, [r1]
	cmp r0, #0
	blt _080AEE9A
	movs r5, #0
_080AEE34:
	adds r0, r1, #0
	adds r0, #8
	adds r0, r5, r0
	ldr r2, [r0]
	cmp r2, #0
	beq _080AEE8C
	adds r0, r5, r1
	ldr r1, [r0]
	asrs r0, r1, #5
	lsls r0, r0, #2
	add r0, sp
	movs r3, #0x1f
	ands r1, r3
	ldr r0, [r0]
	lsrs r0, r1
	movs r4, #1
	ands r0, r4
	cmp r0, #0
	bne _080AEE6A
	adds r0, r7, #0
	str r3, [sp, #0x28]
	bl _call_via_r2
	lsls r0, r0, #0x18
	ldr r3, [sp, #0x28]
	cmp r0, #0
	beq _080AEE8C
_080AEE6A:
	asrs r2, r6, #5
	lsls r2, r2, #2
	adds r2, r2, r7
	adds r0, r6, #0
	ands r0, r3
	adds r1, r4, #0
	lsls r1, r0
	ldr r0, [r2, #0x40]
	orrs r0, r1
	str r0, [r2, #0x40]
	mov r2, r8
	ldrb r0, [r2]
	adds r0, #1
	strb r0, [r2]
	adds r0, r7, #0
	adds r0, #0x2e
	strb r4, [r0]
_080AEE8C:
	adds r5, #0x10
	adds r6, #1
	ldr r1, _080AEEBC  @ gUnknown_08A20E74
	adds r0, r5, r1
	ldr r0, [r0]
	cmp r0, #0
	bge _080AEE34
_080AEE9A:
	adds r0, r7, #0
	bl sub_80AED10
	adds r1, r7, #0
	adds r1, #0x36
	strb r0, [r1]
	add sp, #0x2c
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080AEEB8: .4byte 0x01000008
_080AEEBC: .4byte gUnknown_08A20E74

	THUMB_FUNC_END sub_80AED64

	THUMB_FUNC_START sub_80AEEC0
sub_80AEEC0: @ 0x080AEEC0
	bx lr

	THUMB_FUNC_END sub_80AEEC0

	THUMB_FUNC_START sub_80AEEC4
sub_80AEEC4: @ 0x080AEEC4
	push {r4, lr}
	sub sp, #4
	ldr r4, [r0, #0x14]
	movs r1, #0x80
	lsls r1, r1, #1
	str r0, [sp]
	movs r0, #0
	movs r2, #0
	movs r3, #0x78
	bl sub_80029E8
	adds r4, #0x3f
	movs r0, #1
	strb r0, [r4]
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80AEEC4

	THUMB_FUNC_START sub_80AEEE8
sub_80AEEE8: @ 0x080AEEE8
	push {r4, lr}
	ldr r4, [r0, #0x14]
	adds r0, r4, #0
	adds r0, #0x31
	ldrb r1, [r0]
	ldr r0, _080AEF20  @ gUnknown_08A212E0
	ldr r0, [r0]
	adds r0, r0, r1
	movs r1, #0
	ldrsb r1, [r0, r1]
	adds r0, r4, #0
	movs r2, #0
	bl sub_80AF7F4
	adds r0, r4, #0
	adds r0, #0x32
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl sub_80B0018
	adds r4, #0x3f
	movs r0, #0
	strb r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080AEF20: .4byte gUnknown_08A212E0

	THUMB_FUNC_END sub_80AEEE8

	THUMB_FUNC_START sub_80AEF24
sub_80AEF24: @ 0x080AEF24
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080AEF5C  @ gUnknown_08A212E4
	adds r1, r4, #0
	bl Proc_Start
	adds r4, #0x31
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	ldrb r2, [r4]
	ldr r0, _080AEF60  @ gUnknown_08A212E0
	ldr r0, [r0]
	adds r0, r0, r2
	movs r1, #0
	ldrsb r1, [r0, r1]
	movs r0, #1
	negs r0, r0
	cmp r1, r0
	beq _080AEF50
	cmp r2, #0x80
	bne _080AEF54
_080AEF50:
	movs r0, #0
	strb r0, [r4]
_080AEF54:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080AEF5C: .4byte gUnknown_08A212E4
_080AEF60: .4byte gUnknown_08A212E0

	THUMB_FUNC_END sub_80AEF24

	THUMB_FUNC_START sub_80AEF64
sub_80AEF64: @ 0x080AEF64
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	mov r9, r0
	movs r6, #0
	ldr r2, _080AF0AC  @ gUnknown_08A212E0
	movs r0, #1
	negs r0, r0
	adds r1, r0, #0
_080AEF7C:
	ldr r0, [r2]
	adds r0, r0, r6
	strb r1, [r0]
	adds r6, #1
	cmp r6, #0x7f
	ble _080AEF7C
	bl GetGameClock
	adds r3, r0, #0
	movs r0, #0x7f
	ands r3, r0
	adds r2, r3, #0
	movs r6, #0
	mov r7, r9
	adds r7, #0x31
	mov r1, r9
	adds r1, #0x35
	str r1, [sp, #4]
	mov r5, r9
	adds r5, #0x30
	str r5, [sp]
_080AEFA6:
	asrs r0, r2, #5
	lsls r0, r0, #2
	add r0, r9
	movs r1, #0x1f
	ands r1, r2
	ldr r0, [r0, #0x40]
	lsrs r0, r1
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _080AEFC6
	ldr r0, _080AF0AC  @ gUnknown_08A212E0
	ldr r0, [r0]
	adds r0, r0, r6
	strb r2, [r0]
	adds r6, #1
_080AEFC6:
	adds r1, r2, #1
	adds r0, r1, #0
	cmp r1, #0
	bge _080AEFD2
	adds r0, r2, #0
	adds r0, #0x80
_080AEFD2:
	asrs r2, r0, #7
	lsls r0, r2, #7
	subs r2, r1, r0
	cmp r2, r3
	bne _080AEFA6
	mov r8, r6
	bl GetGameClock
	adds r4, r0, #0
	adds r4, #0x7b
	ldr r0, _080AF0AC  @ gUnknown_08A212E0
	mov sl, r0
	movs r6, #0xff
_080AEFEC:
	movs r1, #0xd
	adds r2, r4, #0
	muls r2, r1, r2
	adds r1, r2, #1
	adds r0, r1, #0
	cmp r1, #0
	bge _080AF000
	movs r3, #0x80
	lsls r3, r3, #8
	adds r0, r2, r3
_080AF000:
	asrs r4, r0, #0xf
	lsls r0, r4, #0xf
	subs r4, r1, r0
	asrs r0, r4, #8
	mov r1, r8
	bl __modsi3
	adds r5, r0, #0
	movs r0, #0xd
	adds r2, r4, #0
	muls r2, r0, r2
	adds r1, r2, #1
	adds r0, r1, #0
	cmp r1, #0
	bge _080AF024
	movs r3, #0x80
	lsls r3, r3, #8
	adds r0, r2, r3
_080AF024:
	asrs r4, r0, #0xf
	lsls r0, r4, #0xf
	subs r4, r1, r0
	asrs r0, r4, #8
	mov r1, r8
	bl __modsi3
	adds r3, r0, #0
	cmp r5, r3
	beq _080AF068
	mov r1, sl
	ldr r0, [r1]
	adds r1, r0, r5
	adds r0, r0, r3
	ldrb r0, [r0]
	ldrb r2, [r1]
	adds r0, r0, r2
	strb r0, [r1]
	mov r1, sl
	ldr r0, [r1]
	adds r2, r0, r3
	adds r0, r0, r5
	ldrb r0, [r0]
	ldrb r1, [r2]
	subs r0, r0, r1
	strb r0, [r2]
	mov r2, sl
	ldr r1, [r2]
	adds r2, r1, r5
	adds r1, r1, r3
	ldrb r0, [r2]
	ldrb r1, [r1]
	subs r0, r0, r1
	strb r0, [r2]
_080AF068:
	subs r6, #1
	cmp r6, #0
	bge _080AEFEC
	movs r0, #0
	strb r0, [r7]
	ldr r3, [sp, #4]
	ldrb r2, [r3]
	lsrs r0, r2, #5
	lsls r0, r0, #2
	add r0, r9
	movs r1, #0x1f
	ands r1, r2
	ldr r0, [r0, #0x40]
	lsrs r0, r1
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _080AF0C4
	ldr r0, _080AF0AC  @ gUnknown_08A212E0
	ldr r1, [r0]
	movs r0, #0
	ldrsb r0, [r1, r0]
	adds r5, r2, #0
	cmp r0, r5
	beq _080AF0C4
	adds r3, r7, #0
	movs r4, #0
	ldr r2, [sp, #4]
_080AF0A0:
	ldrb r0, [r3]
	cmp r0, #0x80
	bne _080AF0B0
	strb r4, [r7]
	b _080AF0C4
	.align 2, 0
_080AF0AC: .4byte gUnknown_08A212E0
_080AF0B0:
	adds r0, #1
	strb r0, [r7]
	ldrb r0, [r7]
	adds r0, r1, r0
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldrb r5, [r2]
	cmp r0, r5
	bne _080AF0A0
_080AF0C4:
	movs r0, #1
	ldr r1, [sp]
	strb r0, [r1]
	mov r0, r9
	bl sub_80AEF24
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80AEF64

	THUMB_FUNC_START sub_80AF0E0
sub_80AF0E0: @ 0x080AF0E0
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x32
	ldrb r0, [r0]
	adds r2, r0, #1
	movs r0, #0x7f
	ands r2, r0
_080AF0EE:
	lsrs r0, r2, #5
	lsls r0, r0, #2
	adds r0, r0, r4
	movs r1, #0x1f
	ands r1, r2
	ldr r0, [r0, #0x40]
	lsrs r0, r1
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _080AF12A
	adds r0, r4, #0
	adds r1, r2, #0
	movs r2, #0x20
	bl sub_80AF7F4
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080AF126
	adds r0, r4, #0
	adds r0, #0x32
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl sub_80B0018
	movs r0, #1
	b _080AF138
_080AF126:
	movs r0, #0
	b _080AF138
_080AF12A:
	adds r1, r2, #1
	lsls r1, r1, #0x18
	movs r0, #0xfe
	lsls r0, r0, #0x17
	ands r0, r1
	lsrs r2, r0, #0x18
	b _080AF0EE
_080AF138:
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80AF0E0

	THUMB_FUNC_START sub_80AF140
sub_80AF140: @ 0x080AF140
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x32
	ldrb r0, [r0]
	subs r2, r0, #1
	movs r0, #0x7f
	ands r2, r0
_080AF14E:
	lsrs r0, r2, #5
	lsls r0, r0, #2
	adds r0, r0, r4
	movs r1, #0x1f
	ands r1, r2
	ldr r0, [r0, #0x40]
	lsrs r0, r1
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _080AF18A
	adds r0, r4, #0
	adds r1, r2, #0
	movs r2, #0x20
	bl sub_80AF7F4
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080AF186
	adds r0, r4, #0
	adds r0, #0x32
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl sub_80B0018
	movs r0, #1
	b _080AF198
_080AF186:
	movs r0, #0
	b _080AF198
_080AF18A:
	subs r1, r2, #1
	lsls r1, r1, #0x18
	movs r0, #0xfe
	lsls r0, r0, #0x17
	ands r0, r1
	lsrs r2, r0, #0x18
	b _080AF14E
_080AF198:
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80AF140

	THUMB_FUNC_START sub_80AF1A0
sub_80AF1A0: @ 0x080AF1A0
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r6, _080AF1D4  @ gUnknown_0201F19C
	lsls r1, r4, #1
	adds r0, r1, r4
	lsls r0, r0, #4
	adds r0, r0, r4
	adds r2, r0, r6
	movs r3, #0x2f
_080AF1B4:
	ldrb r0, [r2, #1]
	strb r0, [r2]
	adds r2, #1
	subs r3, #1
	cmp r3, #0
	bge _080AF1B4
	adds r0, r1, r4
	lsls r0, r0, #4
	adds r0, r0, r4
	adds r1, r6, #0
	adds r1, #0x30
	adds r0, r0, r1
	strb r5, [r0]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080AF1D4: .4byte gUnknown_0201F19C

	THUMB_FUNC_END sub_80AF1A0

	THUMB_FUNC_START sub_80AF1D8
sub_80AF1D8: @ 0x080AF1D8
	push {r4, r5, lr}
	movs r1, #0
	ldr r5, _080AF210  @ gUnknown_08A2C838
	ldr r3, _080AF214  @ gUnknown_0201F19C
	movs r2, #0
	adds r4, r3, #0
	adds r4, #0x31
_080AF1E6:
	adds r0, r1, r3
	strb r2, [r0]
	adds r0, r1, r4
	strb r2, [r0]
	adds r1, #1
	cmp r1, #0x30
	ble _080AF1E6
	ldr r1, _080AF218  @ 0x06010800
	adds r0, r5, #0
	bl CopyDataWithPossibleUncomp
	ldr r0, _080AF21C  @ gUnknown_08A2C8A8
	movs r1, #0xe8
	lsls r1, r1, #2
	movs r2, #0x60
	bl CopyToPaletteBuffer
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080AF210: .4byte gUnknown_08A2C838
_080AF214: .4byte gUnknown_0201F19C
_080AF218: .4byte 0x06010800
_080AF21C: .4byte gUnknown_08A2C8A8

	THUMB_FUNC_END sub_80AF1D8

	THUMB_FUNC_START sub_80AF220
sub_80AF220: @ 0x080AF220
	movs r1, #0
	str r1, [r0, #0x2c]
	bx lr

	THUMB_FUNC_END sub_80AF220

	THUMB_FUNC_START nullsub_65
nullsub_65: @ 0x080AF228
	bx lr

	THUMB_FUNC_END nullsub_65

	THUMB_FUNC_START sub_80AF22C
sub_80AF22C: @ 0x080AF22C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r4, r0, #0
	movs r7, #0
	movs r5, #0
	movs r0, #0xff
	mov r8, r0
	mov ip, r0
	movs r6, #0
	ldr r1, _080AF32C  @ gUnknown_08A212DC
	mov r9, r1
	movs r2, #0xd4
	lsls r2, r2, #2
	mov sl, r2
_080AF250:
	mov r0, r9
	ldr r2, [r0]
	lsls r3, r6, #1
	adds r2, r3, r2
	str r2, [sp]
	ldr r2, _080AF330  @ gUnknown_08A21304
	ldr r1, [r2]
	ldr r0, [r4, #0x2c]
	movs r2, #0xc6
	lsls r2, r2, #3
	adds r0, r0, r2
	add r1, sl
	adds r1, r1, r0
	ldrb r0, [r1]
	subs r0, #0x80
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x19
	ldr r1, [sp]
	strb r0, [r1]
	mov r0, r9
	ldr r2, [r0]
	adds r2, r3, r2
	ldr r1, _080AF330  @ gUnknown_08A21304
	ldr r0, [r1]
	add r0, sl
	ldr r1, [r4, #0x2c]
	adds r0, r0, r1
	ldrb r0, [r0]
	subs r0, #0x80
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x19
	movs r1, #0xf0
	subs r1, r1, r0
	strb r1, [r2, #1]
	mov r2, r9
	ldr r0, [r2]
	adds r3, r3, r0
	ldrb r0, [r3]
	cmp r0, r5
	bcs _080AF2A2
	adds r0, r5, #0
_080AF2A2:
	adds r5, r0, #0
	ldrb r0, [r3]
	cmp r0, ip
	bls _080AF2AC
	mov r0, ip
_080AF2AC:
	mov ip, r0
	ldrb r3, [r3, #1]
	adds r0, r3, #0
	cmp r3, r7
	bcs _080AF2B8
	adds r3, r7, #0
_080AF2B8:
	adds r7, r3, #0
	adds r1, r0, #0
	lsls r0, r1, #0x18
	lsrs r0, r0, #0x18
	cmp r0, r8
	bls _080AF2C6
	mov r1, r8
_080AF2C6:
	lsls r0, r1, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	ldr r0, [r4, #0x2c]
	adds r1, r0, #1
	str r1, [r4, #0x2c]
	ldr r0, _080AF334  @ 0x0000062F
	cmp r1, r0
	ble _080AF2E0
	movs r2, #0xc6
	lsls r2, r2, #3
	subs r0, r1, r2
	str r0, [r4, #0x2c]
_080AF2E0:
	adds r6, #1
	cmp r6, #0xdf
	ble _080AF250
	mov r1, ip
	subs r0, r5, r1
	cmp r0, #0x3f
	ble _080AF2F0
	movs r0, #0x3f
_080AF2F0:
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	mov r2, r8
	subs r0, r7, r2
	cmp r0, #0x3f
	ble _080AF2FE
	movs r0, #0x3f
_080AF2FE:
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	lsls r0, r5, #1
	adds r0, r0, r5
	asrs r1, r0, #2
	movs r0, #0
	bl sub_80AF1A0
	lsls r0, r7, #1
	adds r0, r0, r7
	asrs r1, r0, #2
	movs r0, #1
	bl sub_80AF1A0
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080AF32C: .4byte gUnknown_08A212DC
_080AF330: .4byte gUnknown_08A21304
_080AF334: .4byte 0x0000062F

	THUMB_FUNC_END sub_80AF22C

	THUMB_FUNC_START sub_80AF338
sub_80AF338: @ 0x080AF338
	push {lr}
	ldrh r1, [r0, #0x2a]
	adds r0, #0x36
	ldrb r0, [r0]
	adds r2, r0, #3
	asrs r2, r2, #2
	movs r0, #8
	movs r3, #5
	bl sub_80976CC
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80AF338

	THUMB_FUNC_START sub_80AF350
sub_80AF350: @ 0x080AF350
	push {lr}
	adds r2, r0, #0
	adds r0, #0x35
	ldrb r1, [r0]
	movs r0, #3
	ands r0, r1
	lsls r0, r0, #5
	adds r0, #0x60
	lsrs r1, r1, #2
	lsls r1, r1, #4
	ldrh r2, [r2, #0x2a]
	subs r2, #0x40
	subs r1, r1, r2
	movs r3, #0x80
	lsls r3, r3, #4
	movs r2, #2
	bl ShowPrepScreenHandCursor
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80AF350

	THUMB_FUNC_START sub_80AF378
sub_80AF378: @ 0x080AF378
	push {r4, lr}
	adds r2, r0, #0
	adds r0, #0x35
	ldrb r0, [r0]
	lsrs r0, r0, #2
	lsls r0, r0, #4
	ldrh r1, [r2, #0x2a]
	subs r0, r0, r1
	cmp r0, #0
	bge _080AF38E
	adds r0, #0xf
_080AF38E:
	asrs r4, r0, #4
	cmp r1, #0
	beq _080AF39E
	cmp r4, #0
	bgt _080AF39E
	movs r0, #1
	negs r0, r0
	b _080AF3C2
_080AF39E:
	ldrh r0, [r2, #0x2a]
	lsrs r0, r0, #4
	adds r3, r0, #5
	adds r0, r2, #0
	adds r0, #0x36
	ldrb r1, [r0]
	subs r0, r1, #1
	cmp r0, #0
	bge _080AF3B2
	adds r0, r1, #2
_080AF3B2:
	asrs r0, r0, #2
	cmp r3, r0
	bgt _080AF3C0
	cmp r4, #3
	ble _080AF3C0
	movs r0, #1
	b _080AF3C2
_080AF3C0:
	movs r0, #0
_080AF3C2:
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80AF378

	THUMB_FUNC_START sub_80AF3C8
sub_80AF3C8: @ 0x080AF3C8
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	ldrh r0, [r6, #0x2a]
	lsrs r0, r0, #4
	subs r0, #1
	lsls r7, r0, #2
	ldr r0, _080AF3E4  @ gBG2TilemapBuffer
	movs r1, #0
	bl BG_Fill
	adds r4, r7, #0
	adds r0, r4, #0
	b _080AF4A8
	.align 2, 0
_080AF3E4: .4byte gBG2TilemapBuffer
_080AF3E8:
	adds r0, r6, #0
	adds r1, r4, #0
	bl sub_80AECEC
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080AF3FA
	movs r5, #0
	b _080AF440
_080AF3FA:
	ldr r0, _080AF438  @ gUnknown_08A20E74
	lsls r1, r4, #4
	adds r0, #8
	adds r1, r1, r0
	ldr r0, [r1]
	cmp r0, #0
	beq _080AF440
	adds r2, r4, #0
	cmp r4, #0
	bge _080AF410
	adds r2, r4, #3
_080AF410:
	asrs r2, r2, #2
	lsls r0, r2, #1
	adds r0, #8
	movs r1, #0x1f
	ands r0, r1
	lsls r0, r0, #5
	adds r0, #0xc
	lsls r2, r2, #2
	subs r2, r4, r2
	lsls r2, r2, #2
	adds r0, r0, r2
	lsls r0, r0, #1
	ldr r1, _080AF43C  @ gBG2TilemapBuffer
	adds r0, r0, r1
	movs r1, #1
	movs r2, #0x14
	movs r3, #0x14
	bl sub_8004D5C
	b _080AF4A4
	.align 2, 0
_080AF438: .4byte gUnknown_08A20E74
_080AF43C: .4byte gBG2TilemapBuffer
_080AF440:
	cmp r4, #0x62
	ble _080AF478
	adds r2, r4, #0
	cmp r4, #0
	bge _080AF44C
	adds r2, r4, #3
_080AF44C:
	asrs r2, r2, #2
	lsls r0, r2, #1
	adds r0, #8
	movs r1, #0x1f
	ands r0, r1
	lsls r0, r0, #5
	adds r0, #0xd
	lsls r2, r2, #2
	subs r2, r4, r2
	lsls r2, r2, #2
	adds r0, r0, r2
	lsls r0, r0, #1
	ldr r1, _080AF474  @ gBG2TilemapBuffer
	adds r0, r0, r1
	adds r2, r4, #1
	adds r1, r5, #0
	bl sub_8004B88
	b _080AF4A4
	.align 2, 0
_080AF474: .4byte gBG2TilemapBuffer
_080AF478:
	adds r2, r4, #0
	cmp r4, #0
	bge _080AF480
	adds r2, r4, #3
_080AF480:
	asrs r2, r2, #2
	lsls r0, r2, #1
	adds r0, #8
	movs r1, #0x1f
	ands r0, r1
	lsls r0, r0, #5
	adds r0, #0xd
	lsls r2, r2, #2
	subs r2, r4, r2
	lsls r2, r2, #2
	adds r0, r0, r2
	lsls r0, r0, #1
	ldr r1, _080AF4CC  @ gBG2TilemapBuffer
	adds r0, r0, r1
	adds r2, r4, #1
	adds r1, r5, #0
	bl sub_8004D7C
_080AF4A4:
	adds r4, #1
	adds r0, r7, #0
_080AF4A8:
	adds r0, #0x1c
	cmp r4, r0
	bge _080AF4BE
	movs r5, #1
	cmp r4, #0
	blt _080AF4A4
	adds r0, r6, #0
	adds r0, #0x36
	ldrb r0, [r0]
	cmp r4, r0
	blt _080AF3E8
_080AF4BE:
	movs r0, #4
	bl BG_EnableSyncByMask
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080AF4CC: .4byte gBG2TilemapBuffer

	THUMB_FUNC_END sub_80AF3C8

	THUMB_FUNC_START sub_80AF4D0
sub_80AF4D0: @ 0x080AF4D0
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	ldr r6, _080AF50C  @ gUnknown_0201F160
	adds r0, r6, #0
	adds r1, r5, #0
	bl Text_Draw
	adds r3, r5, #0
	adds r3, #0x10
	adds r4, #0x34
	ldrb r0, [r4]
	movs r1, #2
	cmp r0, #0x64
	bne _080AF4F0
	movs r1, #4
_080AF4F0:
	ldrb r2, [r4]
	adds r0, r3, #0
	bl sub_8004B88
	adds r0, r6, #0
	adds r0, #0x30
	adds r1, r5, #0
	adds r1, #0x12
	bl Text_Draw
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080AF50C: .4byte gUnknown_0201F160

	THUMB_FUNC_END sub_80AF4D0

	THUMB_FUNC_START sub_80AF510
sub_80AF510: @ 0x080AF510
	push {lr}
	adds r1, r0, #0
	ldrh r0, [r1, #0x2c]
	cmp r0, #0
	beq _080AF51E
	adds r0, #1
	strh r0, [r1, #0x2c]
_080AF51E:
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80AF510

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
	bl sub_8097748
	adds r0, r4, #0
	bl sub_80AF338
	ldr r0, _080AF7B8  @ gUnknown_08A2C908
	ldr r1, _080AF7BC  @ 0x06004000
	bl CopyDataWithPossibleUncomp
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
	bl CopyDataWithPossibleUncomp
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
	bl CopyDataWithPossibleUncomp
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
	ldr r0, _080AFA2C  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080AFA5C
	movs r0, #0x6c
	bl m4aSongNumStart
	b _080AFA5C
	.align 2, 0
_080AFA2C: .4byte gRAMChapterData
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

	THUMB_FUNC_START sub_80AFF1C
sub_80AFF1C: @ 0x080AFF1C
	push {lr}
	adds r1, r0, #0
	ldr r0, _080AFF2C  @ gUnknown_08A21338
	bl Proc_StartBlocking
	pop {r1}
	bx r1
	.align 2, 0
_080AFF2C: .4byte gUnknown_08A21338

	THUMB_FUNC_END sub_80AFF1C

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
	bl CopyDataWithPossibleUncomp
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
	bl CopyDataWithPossibleUncomp
	ldr r0, _080B05B0  @ gUnknown_08A2B1E4
	ldr r1, _080B05B4  @ 0x06014000
	bl CopyDataWithPossibleUncomp
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

	THUMB_FUNC_START sub_80B0638
sub_80B0638: @ 0x080B0638
	push {lr}
	sub sp, #4
	ldr r0, _080B066C  @ gUnknown_08A209F0
	ldr r3, [r0]
	movs r0, #0x80
	lsls r0, r0, #8
	str r0, [sp]
	movs r0, #4
	movs r1, #0x18
	movs r2, #8
	bl PutSpriteExt
	ldr r0, _080B0670  @ gUnknown_08A209E4
	ldr r3, [r0]
	movs r0, #0x90
	lsls r0, r0, #8
	str r0, [sp]
	movs r0, #4
	movs r1, #0x18
	movs r2, #0x10
	bl PutSpriteExt
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_080B066C: .4byte gUnknown_08A209F0
_080B0670: .4byte gUnknown_08A209E4

	THUMB_FUNC_END sub_80B0638

	THUMB_FUNC_START sub_80B0674
sub_80B0674: @ 0x080B0674
	push {r4, lr}
	ldr r2, _080B06B4  @ gRAMChapterData
	ldrb r1, [r2, #0x14]
	movs r3, #0x40
	adds r0, r3, #0
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	negs r0, r0
	asrs r4, r0, #0x1f
	movs r0, #4
	ands r4, r0
	adds r0, r2, #0
	adds r0, #0x42
	ldrb r0, [r0]
	lsls r0, r0, #0x1a
	cmp r0, #0
	blt _080B06B8
	ldrb r1, [r2, #0x1b]
	cmp r1, #1
	bne _080B06A2
	movs r0, #0x10
	orrs r4, r0
_080B06A2:
	cmp r1, #2
	bne _080B06AA
	movs r0, #0x20
	orrs r4, r0
_080B06AA:
	cmp r1, #3
	bne _080B06C2
_080B06AE:
	orrs r4, r3
	b _080B06C2
	.align 2, 0
_080B06B4: .4byte gRAMChapterData
_080B06B8:
	ldrb r0, [r2, #0x1b]
	cmp r0, #3
	beq _080B06AE
	movs r0, #0x20
	orrs r4, r0
_080B06C2:
	movs r0, #1
	orrs r0, r4
	movs r1, #0x18
	bl sub_80895B4
	adds r0, r4, #0
	movs r1, #0x19
	bl sub_80895B4
	bl EnablePaletteSync
	movs r0, #0xac
	lsls r0, r0, #4
	bl sub_8089678
	movs r4, #0xb4
	lsls r4, r4, #4
	ldr r0, _080B06F8  @ gRAMChapterData
	bl sub_8089768
	adds r1, r0, #0
	adds r0, r4, #0
	bl sub_8089624
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B06F8: .4byte gRAMChapterData

	THUMB_FUNC_END sub_80B0674

	THUMB_FUNC_START sub_80B06FC
sub_80B06FC: @ 0x080B06FC
	push {r4, r5, lr}
	ldr r0, _080B074C  @ 0x04000006
	ldrh r0, [r0]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0xa0
	bls _080B070E
	movs r5, #0
_080B070E:
	movs r0, #1
	ands r0, r5
	cmp r0, #0
	bne _080B0746
	cmp r5, #0x63
	bhi _080B0730
	ldr r1, _080B0750  @ 0x04000050
	movs r0, #0xc8
	strh r0, [r1]
	ldr r4, _080B0754  @ 0x04000054
	movs r0, #0x64
	subs r0, r0, r5
	lsls r0, r0, #4
	movs r1, #0x64
	bl __divsi3
	strh r0, [r4]
_080B0730:
	cmp r5, #0
	bne _080B073C
	ldr r0, _080B0758  @ 0x04000012
	ldr r1, _080B075C  @ gLCDControlBuffer
	ldrh r1, [r1, #0x1e]
	strh r1, [r0]
_080B073C:
	cmp r5, #0x78
	bne _080B0746
	ldr r1, _080B0758  @ 0x04000012
	movs r0, #4
	strh r0, [r1]
_080B0746:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B074C: .4byte 0x04000006
_080B0750: .4byte 0x04000050
_080B0754: .4byte 0x04000054
_080B0758: .4byte 0x04000012
_080B075C: .4byte gLCDControlBuffer

	THUMB_FUNC_END sub_80B06FC

	THUMB_FUNC_START sub_80B0760
sub_80B0760: @ 0x080B0760
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	movs r0, #0
	mov r9, r0
	mov r0, sp
	mov r1, r9
	strh r1, [r0]
	ldr r0, _080B07D0  @ gUnknown_08A21598
	ldr r1, [r0]
	ldr r2, _080B07D4  @ 0x01000040
	mov r0, sp
	bl CpuSet
	mov r0, sp
	adds r0, #2
	mov r3, r9
	strh r3, [r0]
	ldr r4, _080B07D8  @ gUnknown_08A21590
	ldr r1, [r4]
	ldr r2, _080B07DC  @ 0x010000A2
	bl CpuSet
	ldr r0, [r4]
	bl LoadBonusContentData
	cmp r0, #0
	beq _080B086E
	ldr r0, [r4]
	ldr r1, _080B07E0  @ gUnknown_08A21594
	ldr r1, [r1]
	movs r2, #0x51
	bl CpuFastSet
	movs r0, #0
	mov r8, r0
	movs r7, #0
_080B07AE:
	ldr r2, _080B07D8  @ gUnknown_08A21590
	ldr r0, [r2]
	adds r3, r0, r7
	ldrb r1, [r3]
	movs r0, #3
	ands r0, r1
	cmp r0, #0
	beq _080B0852
	ldrb r1, [r3, #1]
	cmp r1, #1
	beq _080B07EA
	cmp r1, #1
	bgt _080B07E4
	cmp r1, #0
	beq _080B07F6
	b _080B0834
	.align 2, 0
_080B07D0: .4byte gUnknown_08A21598
_080B07D4: .4byte 0x01000040
_080B07D8: .4byte gUnknown_08A21590
_080B07DC: .4byte 0x010000A2
_080B07E0: .4byte gUnknown_08A21594
_080B07E4:
	cmp r1, #2
	beq _080B07F6
	b _080B0834
_080B07EA:
	ldr r0, _080B0820  @ gRAMChapterData
	adds r0, #0x2b
	ldrb r0, [r0]
	ands r1, r0
	cmp r1, #0
	beq _080B0852
_080B07F6:
	ldr r5, _080B0824  @ gUnknown_08A21598
	ldr r0, [r5]
	mov r1, r9
	lsls r4, r1, #2
	adds r0, r4, r0
	movs r6, #0
	mov r3, r8
	strb r3, [r0]
	bl GetBonusContentClaimFlags
	movs r2, #1
	adds r1, r2, #0
	mov r3, r8
	lsls r1, r3
	ands r1, r0
	cmp r1, #0
	beq _080B0828
	ldr r0, [r5]
	adds r0, r4, r0
	strb r6, [r0, #1]
	b _080B082E
	.align 2, 0
_080B0820: .4byte gRAMChapterData
_080B0824: .4byte gUnknown_08A21598
_080B0828:
	ldr r0, [r5]
	adds r0, r4, r0
	strb r2, [r0, #1]
_080B082E:
	movs r0, #1
	add r9, r0
	ldr r2, _080B0878  @ gUnknown_08A21590
_080B0834:
	ldr r0, [r2]
	adds r0, r0, r7
	ldrb r1, [r0]
	movs r0, #3
	ands r0, r1
	cmp r0, #1
	bne _080B0852
	ldr r0, _080B087C  @ gUnknown_08A21594
	ldr r1, [r0]
	adds r1, r1, r7
	ldrb r2, [r1]
	movs r0, #0xfc
	ands r0, r2
	adds r0, #2
	strb r0, [r1]
_080B0852:
	adds r7, #0x14
	movs r1, #1
	add r8, r1
	mov r3, r8
	cmp r3, #0xf
	ble _080B07AE
	ldr r0, _080B0880  @ gUnknown_08A2159C
	ldr r0, [r0]
	mov r1, r9
	str r1, [r0]
	ldr r0, _080B087C  @ gUnknown_08A21594
	ldr r0, [r0]
	bl SaveBonusContentData
_080B086E:
	mov r3, r9
	cmp r3, #0
	beq _080B0884
	movs r0, #1
	b _080B0886
	.align 2, 0
_080B0878: .4byte gUnknown_08A21590
_080B087C: .4byte gUnknown_08A21594
_080B0880: .4byte gUnknown_08A2159C
_080B0884:
	movs r0, #0
_080B0886:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80B0760

	THUMB_FUNC_START sub_80B0894
sub_80B0894: @ 0x080B0894
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	adds r5, r0, #0
	ldr r4, _080B0938  @ gUnknown_08A215A0
	movs r1, #6
	bl __modsi3
	lsls r0, r0, #4
	ldr r1, [r4]
	adds r6, r1, r0
	lsls r0, r5, #1
	str r0, [sp, #8]
	movs r0, #0x1f
	ldr r1, [sp, #8]
	ands r1, r0
	str r1, [sp, #8]
	ldr r0, _080B093C  @ gUnknown_08A21598
	ldr r1, [r0]
	lsls r0, r5, #2
	adds r0, r0, r1
	ldrb r2, [r0, #1]
	str r2, [sp, #0xc]
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	str r0, [sp, #0x10]
	ldr r3, _080B0940  @ gUnknown_08A21590
	ldr r1, [r3]
	lsls r0, r0, #2
	ldr r2, [sp, #0x10]
	adds r0, r0, r2
	lsls r7, r0, #2
	adds r1, r1, r7
	ldrb r1, [r1, #2]
	mov r8, r1
	movs r3, #0
	mov r9, r3
	ldr r0, [sp, #8]
	lsls r4, r0, #6
	ldr r1, _080B0944  @ gBG2TilemapBuffer
	adds r1, r1, r4
	mov sl, r1
	mov r0, sl
	movs r1, #0x14
	movs r2, #1
	bl TileMap_FillRect
	adds r0, r6, #0
	bl Text_Clear
	cmp r5, #0x1f
	ble _080B0906
	b _080B0A08
_080B0906:
	ldr r2, _080B0940  @ gUnknown_08A21590
	ldr r0, [r2]
	adds r1, r0, r7
	ldrb r0, [r1]
	movs r2, #3
	ands r2, r0
	cmp r2, #0
	beq _080B0A08
	cmp r2, #1
	bne _080B091E
	movs r3, #4
	mov r9, r3
_080B091E:
	ldr r0, [sp, #0xc]
	cmp r0, #0
	bne _080B0928
	movs r2, #1
	mov r9, r2
_080B0928:
	ldrb r0, [r1, #1]
	cmp r0, #0
	blt _080B09CA
	cmp r0, #1
	ble _080B0948
	cmp r0, #2
	beq _080B099C
	b _080B09CA
	.align 2, 0
_080B0938: .4byte gUnknown_08A215A0
_080B093C: .4byte gUnknown_08A21598
_080B0940: .4byte gUnknown_08A21590
_080B0944: .4byte gBG2TilemapBuffer
_080B0948:
	mov r0, r8
	bl GetItemName
	ldr r1, _080B0998  @ gBG2TilemapBuffer
	adds r1, #4
	adds r1, r4, r1
	movs r2, #0
	str r2, [sp]
	str r0, [sp, #4]
	adds r0, r6, #0
	mov r2, r9
	movs r3, #0
	bl DrawTextInline
	ldr r0, _080B0998  @ gBG2TilemapBuffer
	adds r0, #0x14
	adds r5, r4, r0
	mov r4, r9
	cmp r4, #0
	bne _080B0972
	movs r4, #2
_080B0972:
	mov r0, r8
	bl GetItemMaxUses
	adds r2, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	bl DrawDecNumber
	mov r0, r8
	bl GetItemIconId
	adds r1, r0, #0
	movs r2, #0x80
	lsls r2, r2, #7
	mov r0, sl
	bl DrawIcon
	b _080B09CA
	.align 2, 0
_080B0998: .4byte gBG2TilemapBuffer
_080B099C:
	mov r0, r8
	bl GetItemName
	ldr r1, _080B0A18  @ gBG2TilemapBuffer
	adds r1, #4
	adds r1, r4, r1
	movs r2, #0
	str r2, [sp]
	str r0, [sp, #4]
	adds r0, r6, #0
	mov r2, r9
	movs r3, #0
	bl DrawTextInline
	mov r0, r8
	bl GetItemIconId
	adds r1, r0, #0
	movs r2, #0x80
	lsls r2, r2, #7
	mov r0, sl
	bl DrawIcon
_080B09CA:
	adds r6, #8
	adds r0, r6, #0
	bl Text_Clear
	ldr r3, [sp, #8]
	lsls r1, r3, #6
	ldr r0, _080B0A1C  @ gUnknown_02023CC0
	adds r5, r1, r0
	mov r2, r9
	cmp r2, #0
	bne _080B09E2
	movs r2, #3
_080B09E2:
	movs r0, #0
	str r0, [sp]
	ldr r0, _080B0A20  @ gUnknown_08A21590
	ldr r3, [sp, #0x10]
	lsls r1, r3, #2
	adds r1, r1, r3
	lsls r1, r1, #2
	ldr r0, [r0]
	adds r0, r0, r1
	adds r0, #3
	str r0, [sp, #4]
	adds r0, r6, #0
	adds r1, r5, #0
	movs r3, #0
	bl DrawTextInline
	movs r0, #4
	bl BG_EnableSyncByMask
_080B0A08:
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B0A18: .4byte gBG2TilemapBuffer
_080B0A1C: .4byte gUnknown_02023CC0
_080B0A20: .4byte gUnknown_08A21590

	THUMB_FUNC_END sub_80B0894

	THUMB_FUNC_START sub_80B0A24
sub_80B0A24: @ 0x080B0A24
	push {r4, r5, lr}
	ldr r1, _080B0A4C  @ gUnknown_08A21598
	lsls r0, r0, #2
	ldr r4, [r1]
	adds r4, r4, r0
	movs r5, #0
	ldrsb r5, [r4, r5]
	bl GetBonusContentClaimFlags
	adds r1, r0, #0
	movs r0, #1
	lsls r0, r5
	orrs r0, r1
	bl SetBonusContentClaimFlags
	movs r0, #0
	strb r0, [r4, #1]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B0A4C: .4byte gUnknown_08A21598

	THUMB_FUNC_END sub_80B0A24

	THUMB_FUNC_START sub_80B0A50
sub_80B0A50: @ 0x080B0A50
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	movs r5, #0
	bl ResetUnitSprites
	movs r4, #1
_080B0A5C:
	adds r0, r4, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq _080B0A98
	ldr r3, [r2]
	cmp r3, #0
	beq _080B0A98
	ldr r0, [r2, #0xc]
	ldr r1, _080B0AB4  @ 0x00010004
	ands r0, r1
	cmp r0, #0
	bne _080B0A98
	ldrb r0, [r3, #4]
	cmp r0, #1
	beq _080B0A82
	cmp r0, #0xf
	bne _080B0A98
_080B0A82:
	ldr r0, _080B0AB8  @ gUnknown_08A215A4
	ldr r1, [r0]
	lsls r0, r5, #3
	adds r0, r0, r1
	str r2, [r0, #4]
	adds r5, #1
	adds r0, r2, #0
	bl GetUnitSMSId
	bl UseUnitSprite
_080B0A98:
	adds r4, #1
	cmp r4, #0x3f
	ble _080B0A5C
	adds r1, r5, #1
	adds r0, r6, #0
	adds r0, #0x2b
	strb r1, [r0]
	bl SetupMapSpritesPalettes
	bl ForceSyncUnitSpriteSheet
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B0AB4: .4byte 0x00010004
_080B0AB8: .4byte gUnknown_08A215A4

	THUMB_FUNC_END sub_80B0A50

	THUMB_FUNC_START sub_80B0ABC
sub_80B0ABC: @ 0x080B0ABC
	push {lr}
	sub sp, #4
	movs r0, #0
	str r0, [sp]
	movs r0, #3
	movs r1, #6
	movs r2, #0x18
	movs r3, #0xc
	bl DrawUiFrame2
	movs r0, #3
	bl BG_EnableSyncByMask
	add sp, #4
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80B0ABC

	THUMB_FUNC_START sub_80B0ADC
sub_80B0ADC: @ 0x080B0ADC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r6, r0, #0
	movs r0, #0
	bl SetupBackgrounds
	ldr r0, _080B0D04  @ gUnknown_08B1754C
	movs r1, #0xc0
	lsls r1, r1, #1
	movs r2, #0x40
	bl CopyToPaletteBuffer
	ldr r0, _080B0D08  @ gUnknown_08A295B4
	movs r1, #0xe0
	lsls r1, r1, #1
	movs r2, #0x20
	bl CopyToPaletteBuffer
	ldr r0, _080B0D0C  @ Img_CommGameBgScreen
	ldr r1, _080B0D10  @ 0x06008000
	bl CopyDataWithPossibleUncomp
	ldr r0, _080B0D14  @ gBG3TilemapBuffer
	ldr r1, _080B0D18  @ gUnknown_08A295D4
	movs r2, #0xc0
	lsls r2, r2, #8
	bl CallARM_FillTileRect
	movs r0, #8
	bl BG_EnableSyncByMask
	bl LoadUiFrameGraphics
	bl Font_InitForUIDefault
	bl ResetIconGraphics_
	movs r0, #4
	bl LoadIconPalettes
	bl LoadObjUIGfx
	bl sub_80B0674
	bl sub_80B0ABC
	ldr r0, _080B0D1C  @ gLCDControlBuffer
	mov ip, r0
	ldrb r1, [r0, #1]
	movs r0, #0x21
	negs r0, r0
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	movs r1, #0x7f
	ands r0, r1
	mov r1, ip
	strb r0, [r1, #1]
	mov r7, ip
	adds r7, #0x35
	ldrb r0, [r7]
	movs r4, #1
	orrs r0, r4
	movs r5, #2
	orrs r0, r5
	movs r1, #4
	orrs r0, r1
	movs r3, #8
	orrs r0, r3
	movs r2, #0x10
	orrs r0, r2
	strb r0, [r7]
	adds r7, #1
	ldrb r0, [r7]
	orrs r0, r4
	orrs r0, r5
	movs r1, #5
	negs r1, r1
	ands r0, r1
	orrs r0, r3
	orrs r0, r2
	strb r0, [r7]
	mov r1, ip
	adds r1, #0x2f
	movs r0, #0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0x38
	strb r0, [r1]
	subs r1, #5
	movs r0, #0xf0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0x88
	strb r0, [r1]
	mov r0, ip
	ldrb r2, [r0, #0xc]
	movs r1, #4
	negs r1, r1
	adds r0, r1, #0
	ands r0, r2
	mov r2, ip
	strb r0, [r2, #0xc]
	ldrb r2, [r2, #0x10]
	adds r0, r1, #0
	ands r0, r2
	orrs r0, r5
	mov r2, ip
	strb r0, [r2, #0x10]
	ldrb r0, [r2, #0x14]
	ands r1, r0
	strb r1, [r2, #0x14]
	ldrb r0, [r2, #0x18]
	movs r1, #3
	orrs r0, r1
	strb r0, [r2, #0x18]
	bl sub_80B0760
	movs r5, #0
	ldr r0, _080B0D20  @ gUnknown_08A2159C
	ldr r0, [r0]
	ldr r0, [r0]
	cmp r5, r0
	bge _080B0C0C
	ldr r7, _080B0D24  @ gUnknown_08A215A0
_080B0BDE:
	lsls r0, r5, #4
	ldr r4, [r7]
	adds r4, r4, r0
	adds r0, r4, #0
	movs r1, #7
	bl Text_Init
	adds r4, #8
	adds r0, r4, #0
	movs r1, #0xa
	bl Text_Init
	adds r0, r5, #0
	bl sub_80B0894
	adds r5, #1
	cmp r5, #5
	bgt _080B0C0C
	ldr r0, _080B0D20  @ gUnknown_08A2159C
	ldr r0, [r0]
	ldr r0, [r0]
	cmp r5, r0
	blt _080B0BDE
_080B0C0C:
	adds r0, r6, #0
	adds r0, #0x29
	str r0, [sp]
	movs r1, #0x2e
	adds r1, r1, r6
	mov sl, r1
	movs r2, #0x2a
	adds r2, r2, r6
	mov r8, r2
	movs r0, #0x2b
	adds r0, r0, r6
	mov r9, r0
	ldr r7, _080B0D24  @ gUnknown_08A215A0
	movs r4, #0x60
	movs r5, #1
_080B0C2A:
	ldr r0, [r7]
	adds r0, r0, r4
	movs r1, #6
	bl Text_Init
	adds r4, #8
	subs r5, #1
	cmp r5, #0
	bge _080B0C2A
	movs r5, #2
	ldr r0, _080B0D24  @ gUnknown_08A215A0
	ldr r0, [r0]
	adds r0, #0x70
	movs r1, #0xf
	bl Text_Init
	ldr r0, _080B0D28  @ sub_80B0638
	adds r1, r6, #0
	bl StartParallelWorker
	movs r0, #2
	bl BG_EnableSyncByMask
	ldr r0, _080B0D2C  @ sub_80B06FC
	bl SetPrimaryHBlankHandler
	movs r0, #0
	ldr r1, [sp]
	strb r0, [r1]
	movs r1, #0
	strh r0, [r6, #0x2c]
	mov r2, sl
	strb r1, [r2]
	mov r2, r8
	strb r1, [r2]
	mov r1, r9
	strb r5, [r1]
	str r0, [r6, #0x34]
	ldr r1, _080B0D30  @ 0x0000FFD8
	ldrh r2, [r6, #0x2c]
	subs r2, #0x38
	movs r0, #0xff
	ands r2, r0
	movs r0, #2
	bl BG_SetPosition
	adds r0, r6, #0
	bl ResetPrepScreenHandCursor
	movs r0, #0xc0
	lsls r0, r0, #3
	movs r1, #1
	bl sub_80AD4A0
	ldr r2, [sp]
	ldrb r1, [r2]
	lsls r1, r1, #4
	movs r2, #0x2c
	ldrsh r0, [r6, r2]
	subs r0, #0x38
	subs r1, r1, r0
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x28
	movs r2, #0x13
	bl ShowPrepScreenHandCursor
	adds r0, r6, #0
	bl NewGreenTextColorManager
	adds r0, r6, #0
	bl Make6CMenuScroll
	movs r0, #0xc8
	movs r1, #0x40
	bl sub_80976AC
	movs r0, #0x80
	lsls r0, r0, #2
	movs r1, #2
	bl InitPrepSideBarImg
	ldrh r1, [r6, #0x2c]
	ldr r0, _080B0D20  @ gUnknown_08A2159C
	ldr r0, [r0]
	ldrh r2, [r0]
	movs r0, #8
	movs r3, #5
	bl sub_80976CC
	adds r0, r6, #0
	bl sub_80AC9C0
	adds r0, r6, #0
	bl sub_80B0A50
	ldr r0, _080B0D34  @ 0x06013800
	movs r1, #5
	bl LoadDialogueBoxGfx
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B0D04: .4byte gUnknown_08B1754C
_080B0D08: .4byte gUnknown_08A295B4
_080B0D0C: .4byte Img_CommGameBgScreen
_080B0D10: .4byte 0x06008000
_080B0D14: .4byte gBG3TilemapBuffer
_080B0D18: .4byte gUnknown_08A295D4
_080B0D1C: .4byte gLCDControlBuffer
_080B0D20: .4byte gUnknown_08A2159C
_080B0D24: .4byte gUnknown_08A215A0
_080B0D28: .4byte sub_80B0638
_080B0D2C: .4byte sub_80B06FC
_080B0D30: .4byte 0x0000FFD8
_080B0D34: .4byte 0x06013800

	THUMB_FUNC_END sub_80B0ADC

	THUMB_FUNC_START sub_80B0D38
sub_80B0D38: @ 0x080B0D38
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	adds r6, r5, #0
	adds r6, #0x29
	ldrb r4, [r6]
	movs r0, #0x2e
	adds r0, r0, r5
	mov r8, r0
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _080B0D58
	b _080B0F36
_080B0D58:
	ldr r0, _080B0D94  @ gKeyStatusPtr
	ldr r2, [r0]
	ldrh r1, [r2, #8]
	movs r7, #1
	adds r0, r7, #0
	ands r0, r1
	cmp r0, #0
	beq _080B0E48
	ldr r0, _080B0D98  @ gUnknown_08A21598
	ldr r1, [r0]
	lsls r0, r4, #2
	adds r0, r0, r1
	movs r4, #0
	ldrsb r4, [r0, r4]
	bl GetBonusContentClaimFlags
	adds r1, r7, #0
	lsls r1, r4
	ands r1, r0
	cmp r1, #0
	beq _080B0DA0
	movs r1, #1
	negs r1, r1
	ldr r2, _080B0D9C  @ 0x0000088F
	adds r0, r1, #0
	adds r3, r5, #0
	bl sub_80AEBCC
	b _080B0F82
	.align 2, 0
_080B0D94: .4byte gKeyStatusPtr
_080B0D98: .4byte gUnknown_08A21598
_080B0D9C: .4byte 0x0000088F
_080B0DA0:
	adds r0, r5, #0
	adds r0, #0x2b
	ldrb r0, [r0]
	cmp r0, #0
	beq _080B0E2C
	ldr r7, _080B0DC8  @ gUnknown_08A21590
	ldr r1, [r7]
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r4, r0, #2
	adds r1, r1, r4
	ldrb r0, [r1, #1]
	cmp r0, #0
	bge _080B0DBE
	b _080B0F82
_080B0DBE:
	cmp r0, #1
	ble _080B0DCC
	cmp r0, #2
	beq _080B0DF0
	b _080B0F82
	.align 2, 0
_080B0DC8: .4byte gUnknown_08A21590
_080B0DCC:
	adds r0, r5, #0
	movs r1, #1
	bl Proc_Goto
	ldr r0, _080B0DEC  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	bge _080B0DE2
	b _080B0F82
_080B0DE2:
	movs r0, #0x6a
	bl m4aSongNumStart
	b _080B0F82
	.align 2, 0
_080B0DEC: .4byte gRAMChapterData
_080B0DF0:
	ldrb r0, [r1, #2]
	cmp r0, #0x9f
	bne _080B0DFC
	ldr r0, _080B0E24  @ 0x00000BB8
	bl sub_8024E20
_080B0DFC:
	ldr r0, [r7]
	adds r0, r0, r4
	ldrb r0, [r0, #2]
	cmp r0, #0xa0
	bne _080B0E0C
	ldr r0, _080B0E28  @ 0x00001388
	bl sub_8024E20
_080B0E0C:
	ldrb r0, [r6]
	bl sub_80B0A24
	ldrb r0, [r6]
	bl sub_80B0894
	adds r0, r5, #0
	movs r1, #2
	bl Proc_Goto
	b _080B0F82
	.align 2, 0
_080B0E24: .4byte 0x00000BB8
_080B0E28: .4byte 0x00001388
_080B0E2C:
	ldr r0, _080B0E44  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	bge _080B0E3A
	b _080B0F82
_080B0E3A:
	movs r0, #0x6c
	bl m4aSongNumStart
	b _080B0F82
	.align 2, 0
_080B0E44: .4byte gRAMChapterData
_080B0E48:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080B0E70
	adds r0, r5, #0
	bl Proc_Break
	ldr r0, _080B0E6C  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	bge _080B0E64
	b _080B0F82
_080B0E64:
	movs r0, #0x6b
	bl m4aSongNumStart
	b _080B0F82
	.align 2, 0
_080B0E6C: .4byte gRAMChapterData
_080B0E70:
	ldrh r1, [r2, #6]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _080B0E7C
	subs r4, #1
_080B0E7C:
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _080B0E86
	adds r4, #1
_080B0E86:
	ldrb r0, [r6]
	cmp r0, r4
	beq _080B0F28
	cmp r4, #0
	blt _080B0F82
	ldr r0, _080B0ED0  @ gUnknown_08A2159C
	ldr r0, [r0]
	ldr r0, [r0]
	cmp r4, r0
	bge _080B0F82
	ldr r0, _080B0ED4  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080B0EAC
	movs r0, #0x66
	bl m4aSongNumStart
_080B0EAC:
	strb r4, [r6]
	ldrb r2, [r6]
	lsls r1, r2, #4
	movs r3, #0x2c
	ldrsh r0, [r5, r3]
	cmp r1, r0
	bne _080B0ED8
	cmp r2, #0
	beq _080B0ED8
	movs r0, #0xff
	mov r4, r8
	strb r0, [r4]
	ldrb r0, [r6]
	subs r0, #1
	bl sub_80B0894
	b _080B0F28
	.align 2, 0
_080B0ED0: .4byte gUnknown_08A2159C
_080B0ED4: .4byte gRAMChapterData
_080B0ED8:
	adds r0, r5, #0
	adds r0, #0x29
	ldrb r3, [r0]
	lsls r1, r3, #4
	movs r4, #0x2c
	ldrsh r2, [r5, r4]
	subs r1, r1, r2
	adds r2, r0, #0
	cmp r1, #0x40
	bne _080B0F10
	ldr r0, _080B0F0C  @ gUnknown_08A2159C
	ldr r0, [r0]
	ldr r0, [r0]
	subs r0, #1
	cmp r3, r0
	bge _080B0F10
	adds r1, r5, #0
	adds r1, #0x2e
	movs r0, #1
	strb r0, [r1]
	ldrb r0, [r2]
	adds r0, #1
	bl sub_80B0894
	b _080B0F28
	.align 2, 0
_080B0F0C: .4byte gUnknown_08A2159C
_080B0F10:
	ldrb r1, [r2]
	lsls r1, r1, #4
	movs r2, #0x2c
	ldrsh r0, [r5, r2]
	subs r0, #0x38
	subs r1, r1, r0
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x28
	movs r2, #0x13
	bl ShowPrepScreenHandCursor
_080B0F28:
	adds r0, r5, #0
	adds r0, #0x2e
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _080B0F82
_080B0F36:
	adds r2, r5, #0
	adds r2, #0x2e
	movs r0, #0
	ldrsb r0, [r2, r0]
	cmp r0, #0
	bge _080B0F48
	ldrh r0, [r5, #0x2c]
	subs r0, #4
	strh r0, [r5, #0x2c]
_080B0F48:
	movs r0, #0
	ldrsb r0, [r2, r0]
	cmp r0, #0
	ble _080B0F56
	ldrh r0, [r5, #0x2c]
	adds r0, #4
	strh r0, [r5, #0x2c]
_080B0F56:
	ldrh r1, [r5, #0x2c]
	movs r0, #0xf
	ands r1, r0
	cmp r1, #0
	bne _080B0F62
	strb r1, [r2]
_080B0F62:
	ldr r1, _080B0F8C  @ 0x0000FFD8
	ldrh r2, [r5, #0x2c]
	subs r2, #0x38
	movs r0, #0xff
	ands r2, r0
	movs r0, #2
	bl BG_SetPosition
	ldrh r1, [r5, #0x2c]
	ldr r0, _080B0F90  @ gUnknown_08A2159C
	ldr r0, [r0]
	ldrh r2, [r0]
	movs r0, #8
	movs r3, #5
	bl sub_80976CC
_080B0F82:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B0F8C: .4byte 0x0000FFD8
_080B0F90: .4byte gUnknown_08A2159C

	THUMB_FUNC_END sub_80B0D38

	THUMB_FUNC_START sub_80B0F94
sub_80B0F94: @ 0x080B0F94
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	movs r5, #0
	adds r0, #0x2b
	ldrb r0, [r0]
	subs r0, #1
	cmp r5, r0
	bge _080B0FFC
	movs r4, #0x30
_080B0FA8:
	ldr r0, _080B0FD4  @ gUnknown_08A215A4
	ldr r1, [r0]
	lsls r0, r5, #3
	adds r0, r0, r1
	ldr r1, [r0, #4]
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _080B0FD8
	ldr r0, [r1, #4]
	ldrb r0, [r0, #4]
	str r0, [sp]
	movs r0, #0
	movs r1, #0x60
	adds r2, r4, #0
	movs r3, #0xc4
	lsls r3, r3, #8
	bl PutUnitSpriteForClassId
	b _080B0FEC
	.align 2, 0
_080B0FD4: .4byte gUnknown_08A215A4
_080B0FD8:
	ldr r0, [r1, #4]
	ldrb r0, [r0, #4]
	str r0, [sp]
	movs r0, #0
	movs r1, #0x60
	adds r2, r4, #0
	movs r3, #0xf4
	lsls r3, r3, #8
	bl PutUnitSpriteForClassId
_080B0FEC:
	adds r4, #0x10
	adds r5, #1
	adds r0, r6, #0
	adds r0, #0x2b
	ldrb r0, [r0]
	subs r0, #1
	cmp r5, r0
	blt _080B0FA8
_080B0FFC:
	bl SyncUnitSpriteSheet
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80B0F94

	THUMB_FUNC_START sub_80B1008
sub_80B1008: @ 0x080B1008
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x34]
	cmp r0, #0
	beq _080B101A
	bl Proc_End
	movs r0, #0
	str r0, [r4, #0x34]
_080B101A:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80B1008

	THUMB_FUNC_START sub_80B1020
sub_80B1020: @ 0x080B1020
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	str r0, [sp, #4]
	ldr r0, _080B1138  @ gUnknown_08A215A0
	ldr r0, [r0]
	adds r6, r0, #0
	adds r6, #0x60
	ldr r0, [sp, #4]
	adds r0, #0x2b
	ldrb r0, [r0]
	mov sl, r0
	lsls r4, r0, #1
	adds r3, r4, #2
	movs r0, #1
	str r0, [sp]
	movs r0, #0xb
	movs r1, #5
	movs r2, #0xe
	bl DrawUiFrame2
	ldr r3, _080B113C  @ gLCDControlBuffer
	ldrb r0, [r3, #1]
	movs r1, #0x20
	orrs r0, r1
	movs r1, #0x40
	orrs r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r3, #1]
	adds r2, r3, #0
	adds r2, #0x34
	ldrb r0, [r2]
	movs r1, #1
	orrs r0, r1
	movs r1, #2
	orrs r0, r1
	movs r1, #5
	negs r1, r1
	ands r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2]
	adds r1, r3, #0
	adds r1, #0x2d
	movs r0, #0x58
	strb r0, [r1]
	adds r1, #4
	movs r0, #0x28
	strb r0, [r1]
	subs r1, #5
	movs r0, #0xc8
	strb r0, [r1]
	adds r4, #7
	lsls r4, r4, #3
	adds r0, r3, #0
	adds r0, #0x30
	strb r4, [r0]
	ldr r0, [sp, #4]
	adds r0, #0x29
	ldrb r2, [r0]
	lsls r2, r2, #4
	ldr r1, [sp, #4]
	movs r3, #0x2c
	ldrsh r0, [r1, r3]
	subs r0, #0x38
	subs r2, r2, r0
	movs r0, #0
	movs r1, #0x28
	movs r3, #1
	bl sub_80AC9D4
	ldr r0, [sp, #4]
	adds r0, #0x2a
	ldrb r1, [r0]
	lsls r1, r1, #4
	adds r1, #0x30
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x5c
	movs r2, #0xc
	bl ShowPrepScreenHandCursor
	movs r0, #0
	mov r9, r0
	cmp r9, sl
	bge _080B11C0
	ldr r0, _080B1140  @ gUnknown_02022CC4
	movs r1, #0xc9
	lsls r1, r1, #1
	adds r1, r0, r1
	str r1, [sp, #8]
	movs r3, #0xc0
	lsls r3, r3, #1
	adds r3, r0, r3
	str r3, [sp, #0xc]
	movs r0, #0
	mov r8, r0
_080B10EE:
	movs r7, #0
	ldr r1, _080B1144  @ gUnknown_08A215A4
	ldr r0, [r1]
	add r0, r8
	ldr r4, [r0, #4]
	adds r0, r6, #0
	bl Text_Clear
	adds r0, r6, #0
	movs r1, #0
	bl Text_SetXCursor
	mov r0, sl
	subs r0, #1
	cmp r9, r0
	bne _080B1148
	bl GetConvoyItemCount
	adds r5, r0, #0
	cmp r5, #0x64
	bne _080B111A
	movs r7, #1
_080B111A:
	adds r0, r6, #0
	movs r1, #0
	adds r2, r7, #0
	bl Text_SetParameters
	movs r0, #0xc2
	lsls r0, r0, #2
	bl GetStringFromIndex
	adds r1, r0, #0
	adds r0, r6, #0
	bl Text_AppendString
	b _080B1170
	.align 2, 0
_080B1138: .4byte gUnknown_08A215A0
_080B113C: .4byte gLCDControlBuffer
_080B1140: .4byte gUnknown_02022CC4
_080B1144: .4byte gUnknown_08A215A4
_080B1148:
	adds r0, r4, #0
	bl GetUnitItemCount
	adds r5, r0, #0
	cmp r5, #5
	bne _080B1156
	movs r7, #1
_080B1156:
	adds r0, r6, #0
	movs r1, #0
	adds r2, r7, #0
	bl Text_SetParameters
	ldr r0, [r4]
	ldrh r0, [r0]
	bl GetStringFromIndex
	adds r1, r0, #0
	adds r0, r6, #0
	bl Text_AppendString
_080B1170:
	cmp r7, #0
	bne _080B1184
	ldr r3, _080B1180  @ gUnknown_08A215A4
	ldr r0, [r3]
	add r0, r8
	movs r1, #1
	b _080B118C
	.align 2, 0
_080B1180: .4byte gUnknown_08A215A4
_080B1184:
	ldr r1, _080B11DC  @ gUnknown_08A215A4
	ldr r0, [r1]
	add r0, r8
	movs r1, #0
_080B118C:
	strb r1, [r0]
	adds r0, r6, #0
	ldr r1, [sp, #0xc]
	bl Text_Draw
	movs r1, #1
	cmp r7, #0
	bne _080B119E
	movs r1, #2
_080B119E:
	ldr r0, [sp, #8]
	adds r2, r5, #0
	bl sub_8004B88
	adds r6, #8
	ldr r3, [sp, #8]
	adds r3, #0x80
	str r3, [sp, #8]
	ldr r0, [sp, #0xc]
	adds r0, #0x80
	str r0, [sp, #0xc]
	movs r1, #8
	add r8, r1
	movs r3, #1
	add r9, r3
	cmp r9, sl
	blt _080B10EE
_080B11C0:
	ldr r0, _080B11E0  @ sub_80B0F94
	ldr r1, [sp, #4]
	bl StartParallelWorker
	ldr r1, [sp, #4]
	str r0, [r1, #0x34]
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B11DC: .4byte gUnknown_08A215A4
_080B11E0: .4byte sub_80B0F94

	THUMB_FUNC_END sub_80B1020

	THUMB_FUNC_START sub_80B11E4
sub_80B11E4: @ 0x080B11E4
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	adds r4, r0, #0
	movs r0, #0x2a
	adds r0, r0, r4
	mov r8, r0
	ldrb r3, [r0]
	ldr r1, _080B122C  @ gUnknown_08A215A4
	mov r9, r1
	ldr r0, [r1]
	lsls r3, r3, #3
	adds r3, r3, r0
	ldr r0, _080B1230  @ gUnknown_08A21598
	adds r6, r4, #0
	adds r6, #0x29
	ldrb r5, [r6]
	lsls r1, r5, #2
	ldr r0, [r0]
	adds r0, r0, r1
	movs r2, #0
	ldrsb r2, [r0, r2]
	ldr r0, _080B1234  @ gUnknown_08A21590
	ldr r1, [r0]
	lsls r0, r2, #2
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r1, r1, r0
	ldrb r7, [r1, #2]
	movs r0, #0
	ldrsb r0, [r3, r0]
	cmp r0, #0
	bne _080B1238
	movs r0, #0
	b _080B127A
	.align 2, 0
_080B122C: .4byte gUnknown_08A215A4
_080B1230: .4byte gUnknown_08A21598
_080B1234: .4byte gUnknown_08A21590
_080B1238:
	adds r0, r5, #0
	bl sub_80B0A24
	ldrb r0, [r6]
	bl sub_80B0894
	mov r0, r8
	ldrb r2, [r0]
	adds r0, r4, #0
	adds r0, #0x2b
	ldrb r0, [r0]
	subs r0, #1
	cmp r2, r0
	bne _080B1260
	adds r0, r7, #0
	bl MakeNewItem
	bl AddItemToConvoy
	b _080B1278
_080B1260:
	mov r0, r9
	ldr r1, [r0]
	lsls r0, r2, #3
	adds r0, r0, r1
	ldr r4, [r0, #4]
	adds r0, r7, #0
	bl MakeNewItem
	adds r1, r0, #0
	adds r0, r4, #0
	bl UnitAddItem
_080B1278:
	movs r0, #1
_080B127A:
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80B11E4

	THUMB_FUNC_START sub_80B1288
sub_80B1288: @ 0x080B1288
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r5, #0
	adds r6, #0x2a
	ldrb r4, [r6]
	ldr r0, _080B12B8  @ gKeyStatusPtr
	ldr r2, [r0]
	ldrh r1, [r2, #8]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080B12CE
	adds r0, r5, #0
	bl sub_80B11E4
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080B12BC
	adds r0, r5, #0
	movs r1, #2
	bl Proc_Goto
	b _080B1344
	.align 2, 0
_080B12B8: .4byte gKeyStatusPtr
_080B12BC:
	movs r1, #1
	negs r1, r1
	movs r2, #0x89
	lsls r2, r2, #4
	adds r0, r1, #0
	adds r3, r5, #0
	bl sub_80AEBCC
	b _080B1344
_080B12CE:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080B12F4
	adds r0, r5, #0
	bl Proc_Break
	ldr r0, _080B12F0  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080B1344
	movs r0, #0x6b
	bl m4aSongNumStart
	b _080B1344
	.align 2, 0
_080B12F0: .4byte gRAMChapterData
_080B12F4:
	ldrh r1, [r2, #6]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _080B1300
	subs r4, #1
_080B1300:
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _080B130A
	adds r4, #1
_080B130A:
	ldrb r0, [r6]
	cmp r4, r0
	beq _080B1344
	cmp r4, #0
	blt _080B1344
	adds r0, r5, #0
	adds r0, #0x2b
	ldrb r0, [r0]
	cmp r4, r0
	bge _080B1344
	ldr r0, _080B134C  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080B1330
	movs r0, #0x66
	bl m4aSongNumStart
_080B1330:
	strb r4, [r6]
	ldrb r1, [r6]
	lsls r1, r1, #4
	adds r1, #0x30
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x5c
	movs r2, #0xc
	bl ShowPrepScreenHandCursor
_080B1344:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B134C: .4byte gRAMChapterData

	THUMB_FUNC_END sub_80B1288

	THUMB_FUNC_START sub_80B1350
sub_80B1350: @ 0x080B1350
	push {r4, lr}
	adds r4, r0, #0
	bl sub_80B1008
	ldr r2, _080B13B0  @ gLCDControlBuffer
	ldrb r1, [r2, #1]
	movs r0, #0x21
	negs r0, r0
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r2, #1]
	ldr r0, _080B13B4  @ gBG1TilemapBuffer
	movs r1, #0
	bl BG_Fill
	ldr r0, _080B13B8  @ gBG0TilemapBuffer
	movs r1, #0
	bl BG_Fill
	bl sub_80B0ABC
	movs r0, #3
	bl BG_EnableSyncByMask
	movs r0, #0
	bl sub_80ACA84
	adds r0, r4, #0
	adds r0, #0x29
	ldrb r1, [r0]
	lsls r1, r1, #4
	movs r2, #0x2c
	ldrsh r0, [r4, r2]
	subs r0, #0x38
	subs r1, r1, r0
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x28
	movs r2, #0x13
	bl ShowPrepScreenHandCursor
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B13B0: .4byte gLCDControlBuffer
_080B13B4: .4byte gBG1TilemapBuffer
_080B13B8: .4byte gBG0TilemapBuffer

	THUMB_FUNC_END sub_80B1350

	THUMB_FUNC_START sub_80B13BC
sub_80B13BC: @ 0x080B13BC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x34
	adds r4, r0, #0
	adds r6, r4, #0
	adds r6, #0x29
	ldrb r0, [r6]
	ldr r1, _080B14FC  @ gUnknown_08A21598
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r2, #0
	ldrsb r2, [r0, r2]
	ldr r0, _080B1500  @ gUnknown_08A21590
	ldr r1, [r0]
	lsls r0, r2, #2
	adds r0, r0, r2
	lsls r0, r0, #2
	str r0, [sp, #0x30]
	adds r1, r1, r0
	ldrb r1, [r1, #2]
	str r1, [sp, #0x2c]
	ldr r0, _080B1504  @ gUnknown_08A215A0
	ldr r0, [r0]
	adds r5, r0, #0
	adds r5, #0x70
	ldr r2, _080B1508  @ gLCDControlBuffer
	ldrb r1, [r2, #1]
	movs r0, #0x21
	negs r0, r0
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r2, #1]
	ldr r1, _080B150C  @ gBG0TilemapBuffer
	mov sl, r1
	mov r0, sl
	movs r1, #0
	bl BG_Fill
	ldr r0, _080B1510  @ gBG1TilemapBuffer
	movs r1, #0
	bl BG_Fill
	bl sub_80B0ABC
	movs r0, #3
	bl BG_EnableSyncByMask
	adds r0, r4, #0
	bl sub_80B1008
	bl GetLastUsedGameSaveSlot
	bl SaveGame
	movs r0, #0
	str r0, [r4, #0x30]
	bl sub_80ACA84
	ldrb r1, [r6]
	lsls r1, r1, #4
	movs r2, #0x2c
	ldrsh r0, [r4, r2]
	subs r0, #0x38
	subs r1, r1, r0
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x28
	movs r2, #0x13
	bl ShowPrepScreenHandCursor
	adds r0, r5, #0
	bl Text_Clear
	adds r0, r5, #0
	movs r1, #0
	movs r2, #0
	bl Text_SetParameters
	adds r0, r5, #0
	movs r1, #0
	bl Text_SetXCursor
	ldr r0, [sp, #0x2c]
	bl GetItemName
	adds r7, r0, #0
	ldr r0, _080B1514  @ 0x00000883
	add r1, sp, #0xc
	bl GetStringFromIndexInBuffer
	adds r6, r0, #0
	adds r0, r7, #0
	bl GetStringTextWidth
	adds r4, r0, #0
	adds r0, r6, #0
	bl GetStringTextWidth
	adds r4, r4, r0
	adds r0, r4, #7
	cmp r0, #0
	bge _080B1498
	adds r0, #7
_080B1498:
	asrs r0, r0, #3
	adds r0, #4
	mov r9, r0
	lsrs r0, r0, #0x1f
	add r0, r9
	asrs r0, r0, #1
	movs r1, #0xf
	subs r1, r1, r0
	mov r8, r1
	adds r0, r5, #0
	adds r1, r7, #0
	bl Text_AppendString
	adds r0, r5, #0
	adds r1, r6, #0
	bl Text_AppendString
	mov r0, r8
	lsls r4, r0, #1
	ldr r1, _080B1518  @ 0x00000286
	add r1, sl
	adds r1, r4, r1
	adds r0, r5, #0
	bl Text_Draw
	ldr r0, _080B151C  @ 0x00000282
	add r0, sl
	adds r4, r4, r0
	ldr r0, [sp, #0x2c]
	bl GetItemIconId
	adds r1, r0, #0
	movs r2, #0x80
	lsls r2, r2, #7
	adds r0, r4, #0
	bl DrawIcon
	ldr r1, _080B1500  @ gUnknown_08A21590
	ldr r0, [r1]
	ldr r2, [sp, #0x30]
	adds r0, r0, r2
	ldrb r0, [r0, #1]
	cmp r0, #0
	blt _080B154A
	cmp r0, #1
	ble _080B1520
	cmp r0, #2
	beq _080B1538
	b _080B154A
	.align 2, 0
_080B14FC: .4byte gUnknown_08A21598
_080B1500: .4byte gUnknown_08A21590
_080B1504: .4byte gUnknown_08A215A0
_080B1508: .4byte gLCDControlBuffer
_080B150C: .4byte gBG0TilemapBuffer
_080B1510: .4byte gBG1TilemapBuffer
_080B1514: .4byte 0x00000883
_080B1518: .4byte 0x00000286
_080B151C: .4byte 0x00000282
_080B1520:
	ldr r0, _080B1534  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080B154A
	movs r0, #0x5a
	bl m4aSongNumStart
	b _080B154A
	.align 2, 0
_080B1534: .4byte gRAMChapterData
_080B1538:
	ldr r0, _080B15D8  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080B154A
	movs r0, #0xb9
	bl m4aSongNumStart
_080B154A:
	ldr r0, _080B15DC  @ gBG1TilemapBuffer
	movs r1, #3
	str r1, [sp]
	movs r1, #0
	str r1, [sp, #4]
	movs r1, #1
	str r1, [sp, #8]
	mov r1, r8
	movs r2, #0xa
	mov r3, r9
	bl DrawUiFrame
	ldr r0, _080B15E0  @ gLCDControlBuffer
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
	mov r2, ip
	adds r2, #0x34
	ldrb r0, [r2]
	movs r1, #1
	orrs r0, r1
	movs r1, #2
	orrs r0, r1
	movs r1, #5
	negs r1, r1
	ands r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x11
	negs r1, r1
	ands r0, r1
	strb r0, [r2]
	mov r2, r8
	lsls r0, r2, #3
	mov r1, ip
	adds r1, #0x2d
	strb r0, [r1]
	adds r1, #4
	movs r0, #0x50
	strb r0, [r1]
	mov r0, r8
	add r0, r9
	lsls r0, r0, #3
	subs r1, #5
	strb r0, [r1]
	adds r1, #4
	movs r0, #0x68
	strb r0, [r1]
	movs r0, #3
	bl BG_EnableSyncByMask
	ldr r2, _080B15E4  @ 0x0000FFFC
	movs r0, #0
	movs r1, #0
	bl BG_SetPosition
	add sp, #0x34
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B15D8: .4byte gRAMChapterData
_080B15DC: .4byte gBG1TilemapBuffer
_080B15E0: .4byte gLCDControlBuffer
_080B15E4: .4byte 0x0000FFFC

	THUMB_FUNC_END sub_80B13BC

	THUMB_FUNC_START sub_80B15E8
sub_80B15E8: @ 0x080B15E8
	push {lr}
	adds r2, r0, #0
	ldr r0, [r2, #0x30]
	adds r0, #1
	str r0, [r2, #0x30]
	cmp r0, #0x1e
	ble _080B1610
	ldr r0, _080B160C  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #3
	ands r0, r1
	cmp r0, #0
	beq _080B1610
	adds r0, r2, #0
	bl Proc_Break
	b _080B161C
	.align 2, 0
_080B160C: .4byte gKeyStatusPtr
_080B1610:
	ldr r0, [r2, #0x30]
	cmp r0, #0x78
	ble _080B161C
	adds r0, r2, #0
	bl Proc_Break
_080B161C:
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80B15E8

	THUMB_FUNC_START sub_80B1620
sub_80B1620: @ 0x080B1620
	push {lr}
	ldr r0, _080B1660  @ gBG0TilemapBuffer
	movs r1, #0
	bl BG_Fill
	ldr r0, _080B1664  @ gBG1TilemapBuffer
	movs r1, #0
	bl BG_Fill
	bl sub_80B0ABC
	movs r0, #3
	bl BG_EnableSyncByMask
	ldr r2, _080B1668  @ gLCDControlBuffer
	ldrb r1, [r2, #1]
	movs r0, #0x21
	negs r0, r0
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r2, #1]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	pop {r0}
	bx r0
	.align 2, 0
_080B1660: .4byte gBG0TilemapBuffer
_080B1664: .4byte gBG1TilemapBuffer
_080B1668: .4byte gLCDControlBuffer

	THUMB_FUNC_END sub_80B1620

	THUMB_FUNC_START sub_80B166C
sub_80B166C: @ 0x080B166C
	push {r4, lr}
	adds r4, r0, #0
	bl EndGreenTextColorManager
	adds r0, r4, #0
	bl EndAllProcChildren
	movs r0, #0
	bl SetPrimaryHBlankHandler
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80B166C

	THUMB_FUNC_START sub_80B1688
sub_80B1688: @ 0x080B1688
	push {lr}
	adds r1, r0, #0
	ldr r0, _080B1698  @ gUnknown_08A215A8
	bl Proc_StartBlocking
	pop {r0}
	bx r0
	.align 2, 0
_080B1698: .4byte gUnknown_08A215A8

	THUMB_FUNC_END sub_80B1688

.align 2, 0
