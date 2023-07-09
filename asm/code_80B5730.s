	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	THUMB_FUNC_START WorldMap_Destruct
WorldMap_Destruct: @ 0x080B8A18
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x50]
	bl Proc_End
	ldr r0, [r4, #0x44]
	bl Proc_End
	ldr r0, [r4, #0x48]
	bl Proc_End
	movs r0, #0
	bl SetSecondaryHBlankHandler
	bl sub_80C1D70
	movs r0, #0
	bl SetPrimaryHBlankHandler
	bl EndTalk
	bl ClearTalkText
	bl ResetUnitSprites
	movs r0, #3
	movs r1, #0
	movs r2, #0
	movs r3, #0x10
	bl SetSpecialColorEffectsParameters
	bl sub_80BF15C
	bl sub_80C3E94
	ldr r2, _080B8A78  @ gGMData
	ldrb r1, [r2]
	movs r0, #0x41
	negs r0, r0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	subs r1, #0x81
	ands r0, r1
	strb r0, [r2]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B8A78: .4byte gGMData

	THUMB_FUNC_END WorldMap_Destruct

	THUMB_FUNC_START sub_80B8A7C
sub_80B8A7C: @ 0x080B8A7C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x10
	adds r7, r0, #0
	adds r0, #0x40
	movs r2, #0
	strb r2, [r0]
	adds r0, #1
	strb r2, [r0]
	adds r3, r7, #0
	adds r3, #0x29
	ldrb r0, [r3]
	movs r1, #2
	orrs r0, r1
	strb r0, [r3]
	ldr r0, _080B8B00  @ gGMData
	mov r8, r0
	strb r2, [r0, #1]
	ldr r0, [r7, #0x54]
	mov r4, sp
	adds r4, #0xa
	movs r1, #0
	add r2, sp, #8
	adds r3, r4, #0
	bl sub_80BE0A4
	add r0, sp, #8
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r2, #0
	ldrsh r1, [r4, r2]
	subs r1, #0xe
	add r5, sp, #0xc
	mov r6, sp
	adds r6, #0xe
	adds r2, r5, #0
	adds r3, r6, #0
	bl GetWMCenteredCameraPosition
	mov r3, r8
	movs r4, #2
	ldrsh r0, [r3, r4]
	movs r2, #4
	ldrsh r1, [r3, r2]
	movs r3, #0
	ldrsh r2, [r5, r3]
	movs r4, #0
	ldrsh r3, [r6, r4]
	movs r4, #2
	str r4, [sp]
	bl sub_80C0834
	asrs r0, r0, #2
	cmp r0, #1
	bgt _080B8B04
	ldrh r0, [r5]
	mov r1, r8
	strh r0, [r1, #2]
	ldrh r0, [r6]
	strh r0, [r1, #4]
	adds r0, r7, #0
	movs r1, #7
	bl Proc_Goto
	b _080B8B2E
	.align 2, 0
_080B8B00: .4byte gGMData
_080B8B04:
	cmp r0, #0xf
	bgt _080B8B0C
	movs r0, #0x10
	b _080B8B12
_080B8B0C:
	cmp r0, #0x4b
	ble _080B8B12
	movs r0, #0x4b
_080B8B12:
	movs r1, #1
	negs r1, r1
	movs r3, #0
	ldrsh r2, [r5, r3]
	movs r4, #0
	ldrsh r3, [r6, r4]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	adds r0, r1, #0
	bl sub_80BF404
_080B8B2E:
	add sp, #0x10
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80B8A7C

	THUMB_FUNC_START sub_80B8B3C
sub_80B8B3C: @ 0x080B8B3C
	push {r4, lr}
	adds r4, r0, #0
	bl sub_80BF490
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080B8B58
	adds r1, r4, #0
	adds r1, #0x41
	movs r0, #0x14
	strb r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
_080B8B58:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80B8B3C

	THUMB_FUNC_START sub_80B8B60
sub_80B8B60: @ 0x080B8B60
	push {r4, lr}
	adds r3, r0, #0
	ldr r4, _080B8B90  @ gGMData
	lsls r0, r3, #2
	adds r0, r0, r4
	adds r0, #0x30
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _080B8B9C
	movs r2, #4
	adds r1, r4, #0
	adds r1, #0x10
_080B8B7C:
	movs r4, #0x12
	ldrsh r0, [r1, r4]
	cmp r0, #0
	beq _080B8B94
	ldrb r0, [r1, #0x11]
	cmp r0, r3
	bne _080B8B94
	movs r0, #1
	b _080B8B9E
	.align 2, 0
_080B8B90: .4byte gGMData
_080B8B94:
	adds r1, #4
	adds r2, #1
	cmp r2, #6
	ble _080B8B7C
_080B8B9C:
	movs r0, #0
_080B8B9E:
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80B8B60

	THUMB_FUNC_START sub_80B8BA4
sub_80B8BA4: @ 0x080B8BA4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x10
	adds r6, r0, #0
	ldr r0, [r6, #0x54]
	movs r1, #0
	bl sub_80BE12C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080B8BBE
	b _080B8D50
_080B8BBE:
	adds r5, r6, #0
	adds r5, #0x40
	movs r4, #0
	ldrsb r4, [r5, r4]
	bl sub_80BD29C
	subs r0, #1
	mov r8, r5
	cmp r4, r0
	blt _080B8BD4
	b _080B8CEC
_080B8BD4:
	bl sub_80BD29C
	movs r1, #0
	ldrsb r1, [r5, r1]
	subs r0, r0, r1
	cmp r0, #2
	beq _080B8BFA
	adds r0, r1, #1
	bl sub_80BD28C
	bl sub_80BCA1C
	cmp r0, #0
	blt _080B8C40
	adds r0, r6, #0
	movs r1, #0x11
	bl Proc_Goto
	b _080B8D50
_080B8BFA:
	adds r0, r1, #1
	bl sub_80BD28C
	ldr r1, _080B8CB8  @ gGMData
	lsls r0, r0, #2
	adds r0, r0, r1
	adds r0, #0x30
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080B8C40
	movs r0, #0
	ldrsb r0, [r5, r0]
	adds r0, #1
	bl sub_80BD28C
	lsls r0, r0, #5
	ldr r1, _080B8CBC  @ gUnknown_082060B0
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #3
	beq _080B8C40
	movs r0, #0
	ldrsb r0, [r5, r0]
	adds r0, #1
	bl sub_80BD28C
	adds r1, r6, #0
	adds r1, #0x3e
	strb r0, [r1]
	adds r0, r6, #0
	movs r1, #0xe
	bl Proc_Goto
_080B8C40:
	adds r0, r6, #0
	adds r0, #0x41
	ldrb r2, [r0]
	movs r1, #0
	ldrsb r1, [r0, r1]
	adds r7, r0, #0
	cmp r1, #0
	bgt _080B8CC0
	mov r1, r8
	movs r0, #0
	ldrsb r0, [r1, r0]
	bl sub_80BD28C
	adds r5, r0, #0
	mov r1, r8
	movs r0, #0
	ldrsb r0, [r1, r0]
	adds r0, #1
	bl sub_80BD28C
	adds r4, r0, #0
	ldr r0, [r6, #0x54]
	movs r1, #0
	movs r2, #1
	bl MapMU_80BE108
	mov r0, sp
	movs r2, #0
	strb r2, [r0]
	strh r5, [r0, #6]
	strh r4, [r0, #8]
	movs r0, #1
	negs r0, r0
	str r0, [sp, #0xc]
	mov r1, sp
	adds r0, r6, #0
	adds r0, #0x29
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	lsrs r0, r0, #0x1f
	strb r0, [r1, #1]
	mov r0, sp
	strh r2, [r0, #0xa]
	movs r0, #1
	strb r0, [r1, #2]
	movs r0, #0xff
	strb r0, [r1, #3]
	movs r0, #4
	strb r0, [r1, #4]
	ldr r0, [r6, #0x54]
	bl sub_80BDEB4
	movs r0, #8
	strb r0, [r7]
	mov r1, r8
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	b _080B8D50
	.align 2, 0
_080B8CB8: .4byte gGMData
_080B8CBC: .4byte gUnknown_082060B0
_080B8CC0:
	adds r0, r6, #0
	adds r0, #0x29
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080B8CE0
	ldr r0, _080B8CE8  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #4]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080B8CE0
	subs r0, r2, #2
	strb r0, [r7]
_080B8CE0:
	ldrb r0, [r7]
	subs r0, #1
	strb r0, [r7]
	b _080B8D50
	.align 2, 0
_080B8CE8: .4byte gKeyStatusPtr
_080B8CEC:
	adds r2, r6, #0
	adds r2, #0x29
	ldrb r1, [r2]
	movs r0, #3
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	movs r0, #0
	ldrsb r0, [r5, r0]
	bl sub_80BD28C
	ldr r4, _080B8D28  @ gGMData
	strb r0, [r4, #0x11]
	ldr r0, [r6, #0x54]
	movs r1, #0
	movs r2, #0
	bl MapMU_80BE108
	ldrb r2, [r4, #0x11]
	lsls r0, r2, #5
	ldr r1, _080B8D2C  @ gUnknown_082060B0
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #3
	bne _080B8D30
	adds r0, r6, #0
	movs r1, #0xe
	bl Proc_Goto
	b _080B8D50
	.align 2, 0
_080B8D28: .4byte gGMData
_080B8D2C: .4byte gUnknown_082060B0
_080B8D30:
	adds r0, r2, #0
	bl sub_80B8B60
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080B8D46
	adds r0, r6, #0
	movs r1, #0x10
	bl Proc_Goto
	b _080B8D50
_080B8D46:
	movs r0, #1
	strb r0, [r4, #1]
	adds r0, r6, #0
	bl Proc_Break
_080B8D50:
	add sp, #0x10
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80B8BA4

	THUMB_FUNC_START SetupGraphicSystemsForWorldMap
SetupGraphicSystemsForWorldMap: @ 0x080B8D5C
	push {r4, lr}
	movs r0, #0
	bl SetupBackgrounds
	ldr r4, _080B8DF8  @ gLCDControlBuffer
	ldrb r1, [r4, #1]
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
	strb r0, [r4, #1]
	ldr r0, _080B8DFC  @ gBG0TilemapBuffer
	movs r1, #0
	bl BG_Fill
	ldr r0, _080B8E00  @ gBG1TilemapBuffer
	movs r1, #0
	bl BG_Fill
	ldr r0, _080B8E04  @ gBG2TilemapBuffer
	movs r1, #0
	bl BG_Fill
	ldr r0, _080B8E08  @ gBG3TilemapBuffer
	movs r1, #0
	bl BG_Fill
	ldrb r2, [r4, #0xc]
	movs r1, #4
	negs r1, r1
	adds r0, r1, #0
	ands r0, r2
	strb r0, [r4, #0xc]
	ldrb r0, [r4, #0x10]
	ands r1, r0
	movs r0, #1
	orrs r1, r0
	strb r1, [r4, #0x10]
	ldrb r0, [r4, #0x14]
	movs r1, #3
	orrs r0, r1
	strb r0, [r4, #0x14]
	ldrb r0, [r4, #0x18]
	orrs r0, r1
	strb r0, [r4, #0x18]
	movs r0, #6
	bl GetSaveWriteAddr
	bl LoadLegacyUiFrameGraphics
	bl ResetText
	bl ResetFaces
	ldr r0, _080B8E0C  @ gUnknown_08A3D728
	bl SetupFaceGfxData
	bl ResetUnitSprites
	bl MU_Init
	bl SetupMapSpritesPalettes
	ldr r1, _080B8E10  @ gBmSt
	movs r0, #0
	strh r0, [r1, #0xc]
	strh r0, [r1, #0xe]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B8DF8: .4byte gLCDControlBuffer
_080B8DFC: .4byte gBG0TilemapBuffer
_080B8E00: .4byte gBG1TilemapBuffer
_080B8E04: .4byte gBG2TilemapBuffer
_080B8E08: .4byte gBG3TilemapBuffer
_080B8E0C: .4byte gUnknown_08A3D728
_080B8E10: .4byte gBmSt

	THUMB_FUNC_END SetupGraphicSystemsForWorldMap

	THUMB_FUNC_START sub_80B8E14
sub_80B8E14: @ 0x080B8E14
	push {r4, lr}
	ldr r0, _080B8E48  @ gUnknown_08A97A40
	movs r1, #0x98
	lsls r1, r1, #2
	movs r2, #0x40
	bl CopyToPaletteBuffer
	ldr r0, _080B8E4C  @ gUnknown_08A96308
	ldr r1, _080B8E50  @ 0x06011000
	bl Decompress
	ldr r0, _080B8E54  @ gUnknown_08A97410
	ldr r4, _080B8E58  @ gGenericBuffer
	adds r1, r4, #0
	bl Decompress
	ldr r1, _080B8E5C  @ 0x06010280
	adds r0, r4, #0
	movs r2, #0xc
	movs r3, #4
	bl Copy2dChr
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B8E48: .4byte gUnknown_08A97A40
_080B8E4C: .4byte gUnknown_08A96308
_080B8E50: .4byte 0x06011000
_080B8E54: .4byte gUnknown_08A97410
_080B8E58: .4byte gGenericBuffer
_080B8E5C: .4byte 0x06010280

	THUMB_FUNC_END sub_80B8E14

	THUMB_FUNC_START sub_80B8E60
sub_80B8E60: @ 0x080B8E60
	push {r4, r5, lr}
	sub sp, #4
	movs r5, #0
	strh r5, [r0, #0x3a]
	bl SetDefaultColorEffects
	ldr r0, _080B8F74  @ gBG0TilemapBuffer
	movs r1, #0
	bl BG_Fill
	ldr r0, _080B8F78  @ gBG1TilemapBuffer
	movs r1, #0
	bl BG_Fill
	ldr r0, _080B8F7C  @ gBG2TilemapBuffer
	movs r1, #0
	bl BG_Fill
	ldr r0, _080B8F80  @ gBG3TilemapBuffer
	movs r1, #0
	bl BG_Fill
	movs r0, #0xf
	bl BG_EnableSyncByMask
	ldr r4, _080B8F84  @ gPal_MiscUiGraphics
	movs r1, #0x80
	lsls r1, r1, #2
	adds r0, r4, #0
	movs r2, #0x40
	bl CopyToPaletteBuffer
	movs r1, #0xd8
	lsls r1, r1, #2
	adds r0, r4, #0
	movs r2, #0x20
	bl CopyToPaletteBuffer
	ldr r0, _080B8F88  @ gUnknown_08AA11D0
	ldr r4, _080B8F8C  @ gGenericBuffer
	adds r1, r4, #0
	bl Decompress
	ldr r1, _080B8F90  @ 0x06015300
	adds r0, r4, #0
	movs r2, #8
	movs r3, #2
	bl Copy2dChr
	bl sub_80B8E14
	ldr r0, _080B8F94  @ gUnknown_08A97FA4
	movs r1, #0xe0
	lsls r1, r1, #1
	movs r2, #0x20
	bl CopyToPaletteBuffer
	ldr r0, _080B8F98  @ gUnknown_08A97ED8
	ldr r1, _080B8F9C  @ 0x06005000
	bl Decompress
	bl LoadUiFrameGraphics
	bl ResetText
	bl ResetTextFont
	ldr r4, _080B8FA0  @ gLCDControlBuffer
	ldrb r1, [r4, #1]
	movs r0, #0x21
	negs r0, r0
	ands r0, r1
	movs r1, #0x41
	negs r1, r1
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r4, #1]
	movs r0, #0x36
	adds r0, r0, r4
	mov ip, r0
	ldrb r1, [r0]
	movs r0, #1
	orrs r1, r0
	movs r0, #2
	orrs r1, r0
	movs r0, #4
	orrs r1, r0
	movs r0, #8
	orrs r1, r0
	movs r0, #0x10
	orrs r1, r0
	adds r3, r4, #0
	adds r3, #0x34
	ldrb r0, [r3]
	movs r2, #0x20
	orrs r0, r2
	strb r0, [r3]
	adds r3, #1
	ldrb r0, [r3]
	orrs r0, r2
	strb r0, [r3]
	orrs r1, r2
	mov r0, ip
	strb r1, [r0]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl sub_80AE168
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	str r5, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl SetBlendTargetA
	movs r0, #1
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #1
	bl SetBlendTargetB
	bl sub_80C1D00
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B8F74: .4byte gBG0TilemapBuffer
_080B8F78: .4byte gBG1TilemapBuffer
_080B8F7C: .4byte gBG2TilemapBuffer
_080B8F80: .4byte gBG3TilemapBuffer
_080B8F84: .4byte gPal_MiscUiGraphics
_080B8F88: .4byte gUnknown_08AA11D0
_080B8F8C: .4byte gGenericBuffer
_080B8F90: .4byte 0x06015300
_080B8F94: .4byte gUnknown_08A97FA4
_080B8F98: .4byte gUnknown_08A97ED8
_080B8F9C: .4byte 0x06005000
_080B8FA0: .4byte gLCDControlBuffer

	THUMB_FUNC_END sub_80B8E60

	THUMB_FUNC_START DeployEveryUnit
DeployEveryUnit: @ 0x080B8FA4
	push {r4, lr}
	movs r4, #1
_080B8FA8:
	adds r0, r4, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq _080B8FC4
	ldr r0, [r2]
	cmp r0, #0
	beq _080B8FC4
	ldr r0, [r2, #0xc]
	movs r1, #9
	negs r1, r1
	ands r0, r1
	str r0, [r2, #0xc]
_080B8FC4:
	adds r4, #1
	cmp r4, #0x3f
	ble _080B8FA8
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END DeployEveryUnit

	THUMB_FUNC_START nullsub_22
nullsub_22: @ 0x080B8FD0
	bx lr

	THUMB_FUNC_END nullsub_22

	THUMB_FUNC_START sub_80B8FD4
sub_80B8FD4: @ 0x080B8FD4
	ldr r2, _080B8FE8  @ gGMData
	ldrb r0, [r2]
	movs r1, #1
	orrs r0, r1
	movs r1, #9
	negs r1, r1
	ands r0, r1
	strb r0, [r2]
	bx lr
	.align 2, 0
_080B8FE8: .4byte gGMData

	THUMB_FUNC_END sub_80B8FD4

	THUMB_FUNC_START sub_80B8FEC
sub_80B8FEC: @ 0x080B8FEC
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080B9010  @ gGMData
	bl sub_80BD014
	adds r1, r0, #0
	cmp r1, #0
	blt _080B9014
	ldr r0, [r4, #0x48]
	adds r0, #0x33
	strb r1, [r0]
	ldr r1, [r4, #0x48]
	adds r1, #0x32
	ldrb r0, [r1]
	movs r2, #2
	orrs r0, r2
	strb r0, [r1]
	b _080B9022
	.align 2, 0
_080B9010: .4byte gGMData
_080B9014:
	ldr r0, [r4, #0x48]
	adds r0, #0x32
	ldrb r2, [r0]
	movs r1, #3
	negs r1, r1
	ands r1, r2
	strb r1, [r0]
_080B9022:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80B8FEC

	THUMB_FUNC_START sub_80B9028
sub_80B9028: @ 0x080B9028
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	sub sp, #8
	adds r5, r0, #0
	movs r6, #0
	add r0, sp, #4
	mov r8, r0
	ldr r4, _080B906C  @ gGMData
	ldr r1, _080B9070  @ gUnknown_082060B0
	mov r9, r1
	mov r7, sp
	adds r7, #6
_080B9044:
	movs r3, #0x12
	ldrsh r0, [r4, r3]
	cmp r0, #0
	beq _080B90B6
	ldrb r1, [r4, #0x10]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080B9074
	ldr r0, [r5, #0x54]
	movs r1, #0x12
	ldrsh r2, [r4, r1]
	ldrb r1, [r4, #0x11]
	str r1, [sp]
	adds r1, r6, #0
	movs r3, #1
	negs r3, r3
	bl MapMU_SetUnitClass
	b _080B9088
	.align 2, 0
_080B906C: .4byte gGMData
_080B9070: .4byte gUnknown_082060B0
_080B9074:
	ldr r0, [r5, #0x54]
	movs r3, #0x12
	ldrsh r2, [r4, r3]
	ldrb r1, [r4, #0x11]
	str r1, [sp]
	adds r1, r6, #0
	movs r3, #1
	negs r3, r3
	bl MapMU_SetUnitChar
_080B9088:
	ldrb r0, [r4, #0x11]
	lsls r0, r0, #5
	add r0, r9
	ldrh r0, [r0, #0x18]
	mov r1, r8
	strh r0, [r1]
	ldrb r0, [r4, #0x11]
	lsls r0, r0, #5
	add r0, r9
	ldrh r0, [r0, #0x1a]
	strh r0, [r7]
	ldr r0, [r5, #0x54]
	movs r3, #0
	ldrsh r2, [r1, r3]
	movs r1, #0
	ldrsh r3, [r7, r1]
	adds r1, r6, #0
	bl sub_80BE35C
	ldr r0, [r5, #0x54]
	adds r1, r6, #0
	bl sub_80BDDC4
_080B90B6:
	adds r4, #4
	adds r6, #1
	cmp r6, #6
	ble _080B9044
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80B9028

	THUMB_FUNC_START sub_80B90CC
sub_80B90CC: @ 0x080B90CC
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r2, _080B9110  @ gGMData
	ldrb r1, [r2]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _080B9102
	movs r5, #4
	adds r4, r2, #0
	adds r4, #0x20
_080B90E2:
	ldr r0, [r6, #0x54]
	adds r1, r5, #0
	bl MapMU_RemoveUnit
	movs r0, #0
	strh r0, [r4, #2]
	ldrb r1, [r4]
	movs r0, #0xfd
	ands r0, r1
	movs r1, #0xfe
	ands r0, r1
	strb r0, [r4]
	adds r4, #4
	adds r5, #1
	cmp r5, #6
	ble _080B90E2
_080B9102:
	adds r0, r6, #0
	bl sub_80B9028
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B9110: .4byte gGMData

	THUMB_FUNC_END sub_80B90CC

	THUMB_FUNC_START sub_80B9114
sub_80B9114: @ 0x080B9114
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	movs r2, #0
	ldr r0, _080B9140  @ gGMData
	movs r6, #2
	adds r3, r0, #0
	adds r3, #0x30
	movs r5, #2
_080B9124:
	ldrb r1, [r3]
	adds r0, r5, #0
	ands r0, r1
	cmp r0, #0
	beq _080B9144
	ldr r0, [r4, #0x48]
	adds r0, #0x33
	strb r2, [r0]
	ldr r1, [r4, #0x48]
	adds r1, #0x32
	ldrb r0, [r1]
	orrs r0, r6
	strb r0, [r1]
	b _080B914C
	.align 2, 0
_080B9140: .4byte gGMData
_080B9144:
	adds r3, #4
	adds r2, #1
	cmp r2, #0x1c
	ble _080B9124
_080B914C:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80B9114

	THUMB_FUNC_START sub_80B9154
sub_80B9154: @ 0x080B9154
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	bl SetupGraphicSystemsForWorldMap
	adds r0, r5, #0
	bl sub_80B8E60
	adds r0, r5, #0
	bl DeployEveryUnit
	movs r0, #5
	bl NewMapScreen
	str r0, [r5, #0x44]
	str r0, [sp]
	movs r0, #5
	movs r1, #0
	movs r2, #3
	movs r3, #0xa
	bl sub_80BB9A4
	str r0, [r5, #0x48]
	ldr r0, [r5, #0x44]
	movs r1, #0xa0
	lsls r1, r1, #2
	movs r2, #0xc
	bl NewGmapUnitContainer
	str r0, [r5, #0x4c]
	movs r1, #0x96
	lsls r1, r1, #5
	ldr r3, [r5, #0x44]
	movs r0, #5
	movs r2, #4
	bl NewGmapCursor
	str r0, [r5, #0x50]
	adds r0, r5, #0
	bl NewMapMU
	str r0, [r5, #0x54]
	ldr r4, _080B9210  @ gGMData
	adds r0, r4, #0
	bl sub_80BCA0C
	adds r0, r5, #0
	bl sub_80C368C
	adds r0, r5, #0
	bl sub_80B8FEC
	adds r0, r5, #0
	bl sub_80B90CC
	ldrb r1, [r4]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080B91D2
	adds r0, r5, #0
	bl sub_80B9114
_080B91D2:
	ldr r0, [r5, #0x44]
	ldr r1, [r0, #0x4c]
	adds r1, #0x31
	ldrb r2, [r1]
	movs r0, #3
	orrs r0, r2
	strb r0, [r1]
	ldr r0, _080B9214  @ gPlaySt
	ldrb r1, [r0, #0x14]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _080B91FE
	bl sub_80BCFB4
	ldr r0, [r5, #0x48]
	adds r0, #0x32
	ldrb r2, [r0]
	movs r1, #3
	negs r1, r1
	ands r1, r2
	strb r1, [r0]
_080B91FE:
	adds r1, r5, #0
	adds r1, #0x2a
	movs r0, #0
	strb r0, [r1]
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B9210: .4byte gGMData
_080B9214: .4byte gPlaySt

	THUMB_FUNC_END sub_80B9154

	THUMB_FUNC_START sub_80B9218
sub_80B9218: @ 0x080B9218
	push {r4, r5, r6, lr}
	sub sp, #8
	mov r2, sp
	ldr r1, _080B9260  @ gGMData
	ldr r0, [r1, #8]
	asrs r0, r0, #8
	strh r0, [r2]
	mov r4, sp
	adds r4, #2
	ldr r0, [r1, #0xc]
	asrs r0, r0, #8
	strh r0, [r4]
	add r2, sp, #4
	ldrh r0, [r1, #2]
	strh r0, [r2]
	mov r3, sp
	adds r3, #6
	ldrh r0, [r1, #4]
	strh r0, [r3]
	mov r0, sp
	ldrh r5, [r0]
	ldrh r0, [r2]
	subs r0, r5, r0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	adds r6, r1, #0
	cmp r0, #0x1f
	bgt _080B9268
	lsls r0, r5, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x1f
	ble _080B9264
	adds r0, r5, #0
	subs r0, #0x20
	b _080B9282
	.align 2, 0
_080B9260: .4byte gGMData
_080B9264:
	movs r0, #0
	b _080B9282
_080B9268:
	cmp r0, #0xd0
	ble _080B9284
	lsls r1, r5, #0x10
	ldr r0, _080B927C  @ 0x01BF0000
	cmp r1, r0
	bgt _080B9280
	adds r0, r5, #0
	subs r0, #0xd0
	b _080B9282
	.align 2, 0
_080B927C: .4byte 0x01BF0000
_080B9280:
	movs r0, #0xf0
_080B9282:
	strh r0, [r2]
_080B9284:
	ldrh r4, [r4]
	ldrh r0, [r3]
	subs r0, r4, r0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x1f
	bgt _080B92A4
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x1f
	ble _080B92A0
	adds r0, r4, #0
	subs r0, #0x20
	b _080B92BE
_080B92A0:
	movs r0, #0
	b _080B92BE
_080B92A4:
	cmp r0, #0x80
	ble _080B92C0
	lsls r1, r4, #0x10
	ldr r0, _080B92B8  @ 0x011F0000
	cmp r1, r0
	bgt _080B92BC
	adds r0, r4, #0
	subs r0, #0x80
	b _080B92BE
	.align 2, 0
_080B92B8: .4byte 0x011F0000
_080B92BC:
	movs r0, #0xa0
_080B92BE:
	strh r0, [r3]
_080B92C0:
	ldrh r0, [r2]
	strh r0, [r6, #2]
	ldrh r0, [r3]
	strh r0, [r6, #4]
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80B9218

	THUMB_FUNC_START sub_80B92D0
sub_80B92D0: @ 0x080B92D0
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	ldr r7, _080B930C  @ gGMData
	ldrb r0, [r7, #0x11]
	cmp r0, r4
	bne _080B9356
	lsls r0, r4, #2
	adds r0, r0, r7
	adds r0, #0x30
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _080B9344
	lsls r0, r4, #5
	ldr r1, _080B9310  @ gUnknown_082060B0
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #3
	beq _080B9344
	adds r0, r4, #0
	bl sub_80BCA1C
	cmp r0, #0
	blt _080B9314
	adds r0, r5, #0
	movs r1, #0x10
	b _080B934E
	.align 2, 0
_080B930C: .4byte gGMData
_080B9310: .4byte gUnknown_082060B0
_080B9314:
	adds r0, r7, #0
	bl sub_80BD014
	adds r3, r0, #0
	ldr r2, _080B9340  @ gPlaySt
	ldrb r1, [r2, #0x14]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	bne _080B9338
	adds r0, r2, #0
	adds r0, #0x42
	ldrb r0, [r0]
	lsls r0, r0, #0x1a
	cmp r0, #0
	blt _080B9338
	cmp r3, #2
	beq _080B93D6
_080B9338:
	adds r0, r5, #0
	movs r1, #0x12
	b _080B934E
	.align 2, 0
_080B9340: .4byte gPlaySt
_080B9344:
	adds r0, r5, #0
	adds r0, #0x3e
	strb r4, [r0]
	adds r0, r5, #0
	movs r1, #0xe
_080B934E:
	bl Proc_Goto
_080B9352:
	movs r0, #1
	b _080B93D8
_080B9356:
	movs r0, #0x11
	ldrsb r0, [r7, r0]
	lsls r1, r4, #0x18
	asrs r6, r1, #0x18
	adds r1, r6, #0
	movs r2, #0
	bl sub_80BCCFC
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080B938A
	bl sub_80BD29C
	adds r1, r0, #0
	cmp r1, #2
	bne _080B9384
	lsls r0, r4, #2
	adds r0, r0, r7
	adds r0, #0x30
	ldrb r0, [r0]
	ands r1, r0
	cmp r1, #0
	bne _080B9344
_080B9384:
	adds r0, r5, #0
	movs r1, #6
	b _080B934E
_080B938A:
	movs r0, #0x11
	ldrsb r0, [r7, r0]
	adds r1, r6, #0
	movs r2, #1
	bl sub_80BCCFC
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080B93D6
	bl sub_80BD29C
	adds r2, r0, #0
	cmp r2, #2
	bne _080B93CC
	lsls r0, r4, #5
	ldr r1, _080B93C8  @ gUnknown_082060B0
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #3
	beq _080B93C0
	lsls r0, r4, #2
	adds r0, r0, r7
	adds r0, #0x30
	ldrb r0, [r0]
	ands r2, r0
	cmp r2, #0
	bne _080B9344
_080B93C0:
	adds r0, r5, #0
	movs r1, #6
	b _080B934E
	.align 2, 0
_080B93C8: .4byte gUnknown_082060B0
_080B93CC:
	adds r0, r5, #0
	movs r1, #6
	bl Proc_Goto
	b _080B9352
_080B93D6:
	movs r0, #0
_080B93D8:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80B92D0

	THUMB_FUNC_START sub_80B93E0
sub_80B93E0: @ 0x080B93E0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	adds r7, r0, #0
	ldr r0, _080B9408  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #4]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080B940C
	movs r0, #2
	mov r8, r0
	adds r1, r7, #0
	adds r1, #0x2a
	movs r0, #0
	strb r0, [r1]
	adds r6, r1, #0
	b _080B9414
	.align 2, 0
_080B9408: .4byte gKeyStatusPtr
_080B940C:
	movs r2, #4
	mov r8, r2
	adds r6, r7, #0
	adds r6, #0x2a
_080B9414:
	adds r5, r6, #0
	ldrb r1, [r5]
	movs r0, #0
	ldrsb r0, [r5, r0]
	cmp r0, #0
	ble _080B9426
	subs r0, r1, #1
	strb r0, [r5]
	b _080B954A
_080B9426:
	bl sub_80BF294
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080B9432
	b _080B954A
_080B9432:
	ldr r0, _080B944C  @ gKeyStatusPtr
	ldr r3, [r0]
	ldrh r2, [r3, #4]
	movs r0, #2
	ands r0, r2
	cmp r0, #0
	beq _080B9450
	movs r3, #0xf0
	ands r3, r2
	movs r0, #0xa
	strb r0, [r5]
	b _080B946E
	.align 2, 0
_080B944C: .4byte gKeyStatusPtr
_080B9450:
	ldrh r0, [r3, #8]
	movs r4, #0xf0
	adds r1, r4, #0
	ands r1, r0
	cmp r1, #0
	beq _080B9468
	movs r0, #0xa
	strb r0, [r5]
	ldrh r0, [r3, #8]
	adds r3, r4, #0
	ands r3, r0
	b _080B946E
_080B9468:
	adds r3, r4, #0
	ands r3, r2
	strb r1, [r6]
_080B946E:
	cmp r3, #0
	beq _080B954A
	ldr r2, _080B94A8  @ gGMData
	ldr r0, [r2, #8]
	asrs r0, r0, #8
	cmp r0, #0
	bge _080B947E
	adds r0, #0xf
_080B947E:
	lsls r0, r0, #0xc
	lsrs r1, r0, #0x10
	ldr r0, [r2, #0xc]
	asrs r0, r0, #8
	cmp r0, #0
	bge _080B948C
	adds r0, #0xf
_080B948C:
	lsls r0, r0, #0xc
	lsrs r6, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r2, r1, #0x10
	adds r4, r6, #0
	movs r0, #0x10
	ands r0, r3
	cmp r0, #0
	beq _080B94AC
	lsls r0, r2, #0x10
	movs r2, #0x80
	lsls r2, r2, #9
	b _080B94B8
	.align 2, 0
_080B94A8: .4byte gGMData
_080B94AC:
	movs r0, #0x20
	ands r0, r3
	cmp r0, #0
	beq _080B94BC
	lsls r0, r2, #0x10
	ldr r2, _080B94CC  @ 0xFFFF0000
_080B94B8:
	adds r0, r0, r2
	lsrs r2, r0, #0x10
_080B94BC:
	movs r0, #0x80
	ands r0, r3
	cmp r0, #0
	beq _080B94D0
	lsls r0, r4, #0x10
	movs r3, #0x80
	lsls r3, r3, #9
	b _080B94DC
	.align 2, 0
_080B94CC: .4byte 0xFFFF0000
_080B94D0:
	movs r0, #0x40
	ands r3, r0
	cmp r3, #0
	beq _080B94E0
	lsls r0, r4, #0x10
	ldr r3, _080B94EC  @ 0xFFFF0000
_080B94DC:
	adds r0, r0, r3
	lsrs r4, r0, #0x10
_080B94E0:
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0
	bgt _080B94F0
	movs r2, #1
	b _080B94F6
	.align 2, 0
_080B94EC: .4byte 0xFFFF0000
_080B94F0:
	cmp r0, #0x1c
	ble _080B94F6
	movs r2, #0x1c
_080B94F6:
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0
	bgt _080B9502
	movs r4, #1
	b _080B9508
_080B9502:
	cmp r0, #0x12
	ble _080B9508
	movs r4, #0x12
_080B9508:
	lsls r0, r2, #0x10
	asrs r5, r0, #0x10
	lsls r4, r4, #0x10
	cmp r1, r0
	bne _080B9518
	lsls r0, r6, #0x10
	cmp r0, r4
	beq _080B954A
_080B9518:
	ldr r0, _080B9558  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080B952A
	movs r0, #0x65
	bl m4aSongNumStart
_080B952A:
	lsls r0, r5, #4
	adds r0, #8
	lsls r0, r0, #0x10
	asrs r1, r4, #0xc
	adds r1, #8
	lsls r1, r1, #0x10
	lsrs r0, r0, #0x10
	orrs r0, r1
	str r0, [sp, #4]
	str r7, [sp]
	movs r0, #0
	add r1, sp, #4
	mov r2, r8
	movs r3, #0
	bl sub_80BF210
_080B954A:
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B9558: .4byte gPlaySt

	THUMB_FUNC_END sub_80B93E0

	THUMB_FUNC_START sub_80B955C
sub_80B955C: @ 0x080B955C
	push {r4, r5, r6, lr}
	adds r4, r1, #0
	movs r5, #0
	b _080B9566
_080B9564:
	adds r5, #1
_080B9566:
	cmp r5, #0x1c
	bgt _080B9574
	adds r0, r5, #0
	bl sub_80BBA4C
	cmp r0, r4
	bne _080B9564
_080B9574:
	movs r4, #1
	ldr r6, _080B959C  @ gGMData
_080B9578:
	adds r0, r5, r4
	cmp r0, #0x1c
	ble _080B9580
	subs r0, #0x1d
_080B9580:
	bl sub_80BBA4C
	adds r2, r0, #0
	lsls r0, r2, #2
	adds r0, r0, r6
	adds r0, #0x30
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080B95A0
	adds r0, r2, #0
	b _080B95AA
	.align 2, 0
_080B959C: .4byte gGMData
_080B95A0:
	adds r4, #1
	cmp r4, #0x1c
	ble _080B9578
	movs r0, #1
	negs r0, r0
_080B95AA:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80B955C

	THUMB_FUNC_START sub_80B95B0
sub_80B95B0: @ 0x080B95B0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	ldr r0, _080B9614  @ gGMData
	ldr r1, [r0, #8]
	asrs r1, r1, #8
	mov r8, r1
	ldr r0, [r0, #0xc]
	asrs r7, r0, #8
	movs r5, #0xf0
	lsls r5, r5, #7
	movs r6, #0
	movs r4, #0
_080B95CC:
	ldr r1, _080B9614  @ gGMData
	lsls r0, r4, #2
	adds r0, r0, r1
	adds r0, #0x30
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080B9600
	lsls r1, r4, #5
	ldr r0, _080B9618  @ gUnknown_082060B0
	adds r1, r1, r0
	movs r0, #0x18
	ldrsh r2, [r1, r0]
	movs r0, #0x1a
	ldrsh r3, [r1, r0]
	movs r0, #5
	str r0, [sp]
	mov r0, r8
	adds r1, r7, #0
	bl sub_80C0834
	cmp r0, r5
	bge _080B9600
	adds r6, r4, #0
	adds r5, r0, #0
_080B9600:
	adds r4, #1
	cmp r4, #0x1c
	ble _080B95CC
	adds r0, r6, #0
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080B9614: .4byte gGMData
_080B9618: .4byte gUnknown_082060B0

	THUMB_FUNC_END sub_80B95B0

	THUMB_FUNC_START sub_80B961C
sub_80B961C: @ 0x080B961C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x14
	mov r8, r0
	add r2, sp, #8
	lsls r1, r1, #5
	ldr r0, _080B96D0  @ gUnknown_082060B0
	adds r1, r1, r0
	ldrh r0, [r1, #0x18]
	strh r0, [r2]
	adds r2, #2
	ldrh r0, [r1, #0x1a]
	strh r0, [r2]
	ldr r7, _080B96D4  @ gGMData
	add r0, sp, #8
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r0, r0, #8
	str r0, [r7, #8]
	movs r3, #0
	ldrsh r0, [r2, r3]
	lsls r0, r0, #8
	str r0, [r7, #0xc]
	add r0, sp, #8
	movs r4, #0
	ldrsh r0, [r0, r4]
	movs r3, #0
	ldrsh r1, [r2, r3]
	add r5, sp, #0xc
	mov r6, sp
	adds r6, #0xe
	adds r2, r5, #0
	adds r3, r6, #0
	bl GetWMCenteredCameraPosition
	add r2, sp, #0x10
	ldrh r0, [r7, #2]
	strh r0, [r2]
	mov r1, sp
	adds r1, #0x12
	ldrh r0, [r7, #4]
	strh r0, [r1]
	movs r4, #0
	ldrsh r0, [r2, r4]
	movs r2, #0
	ldrsh r1, [r1, r2]
	movs r3, #0
	ldrsh r2, [r5, r3]
	movs r4, #0
	ldrsh r3, [r6, r4]
	movs r4, #4
	str r4, [sp]
	bl sub_80C0834
	cmp r0, #0
	bge _080B9692
	ldr r1, _080B96D8  @ 0x000001FF
	adds r0, r0, r1
_080B9692:
	asrs r0, r0, #9
	adds r0, #6
	cmp r0, #0xa
	ble _080B969C
	movs r0, #0xa
_080B969C:
	movs r1, #1
	negs r1, r1
	movs r3, #0
	ldrsh r2, [r5, r3]
	movs r4, #0
	ldrsh r3, [r6, r4]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	movs r4, #0
	str r4, [sp, #4]
	adds r0, r1, #0
	bl sub_80BF404
	strb r4, [r7, #1]
	mov r0, r8
	movs r1, #8
	bl Proc_Goto
	add sp, #0x14
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B96D0: .4byte gUnknown_082060B0
_080B96D4: .4byte gGMData
_080B96D8: .4byte 0x000001FF

	THUMB_FUNC_END sub_80B961C

	THUMB_FUNC_START sub_80B96DC
sub_80B96DC: @ 0x080B96DC
	push {r4, lr}
	adds r4, r0, #0
	bl sub_80BF3F4
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080B96F0
	adds r0, r4, #0
	bl Proc_Break
_080B96F0:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80B96DC

	THUMB_FUNC_START sub_80B96F8
sub_80B96F8: @ 0x080B96F8
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r2, _080B9728  @ gGMData
	ldr r5, [r2, #8]
	ldr r6, [r2, #0xc]
	ldr r0, _080B972C  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r3, #4
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	beq _080B9736
	ldrb r1, [r2]
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	beq _080B9730
	movs r0, #5
	negs r0, r0
	ands r0, r1
	b _080B9734
	.align 2, 0
_080B9728: .4byte gGMData
_080B972C: .4byte gKeyStatusPtr
_080B9730:
	movs r0, #4
	orrs r0, r1
_080B9734:
	strb r0, [r2]
_080B9736:
	ldr r0, [r4, #0x48]
	asrs r1, r5, #8
	asrs r2, r6, #8
	movs r3, #0
	str r3, [sp]
	bl sub_80BB628
	adds r1, r0, #0
	cmp r1, #0
	blt _080B9798
	ldr r0, _080B9778  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r2, [r0, #8]
	movs r0, #1
	ands r0, r2
	cmp r0, #0
	beq _080B9780
	adds r0, r4, #0
	bl sub_80B92D0
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080B97BC
	ldr r0, _080B977C  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080B97EA
	movs r0, #0x6a
	bl m4aSongNumStart
	b _080B97EA
	.align 2, 0
_080B9778: .4byte gKeyStatusPtr
_080B977C: .4byte gPlaySt
_080B9780:
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r2
	cmp r0, #0
	beq _080B97BC
	adds r0, r4, #0
	bl sub_80B955C
	adds r1, r0, #0
	cmp r1, #0
	blt _080B97BC
	b _080B97AE
_080B9798:
	ldr r0, _080B97B8  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080B97BC
	bl sub_80B95B0
	adds r1, r0, #0
_080B97AE:
	adds r0, r4, #0
	bl sub_80B961C
	b _080B97EA
	.align 2, 0
_080B97B8: .4byte gKeyStatusPtr
_080B97BC:
	ldr r0, _080B97D4  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080B97D8
	adds r0, r4, #0
	movs r1, #5
	bl Proc_Goto
	b _080B97EA
	.align 2, 0
_080B97D4: .4byte gKeyStatusPtr
_080B97D8:
	adds r0, r4, #0
	bl sub_80B93E0
	ldr r0, _080B97F4  @ gGMData
	str r5, [r0, #8]
	str r6, [r0, #0xc]
	adds r0, r4, #0
	bl sub_80B9218
_080B97EA:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B97F4: .4byte gGMData

	THUMB_FUNC_END sub_80B96F8

	THUMB_FUNC_START sub_80B97F8
sub_80B97F8: @ 0x080B97F8
	ldr r1, _080B9800  @ gGMData
	movs r0, #1
	strb r0, [r1, #1]
	bx lr
	.align 2, 0
_080B9800: .4byte gGMData

	THUMB_FUNC_END sub_80B97F8

	THUMB_FUNC_START sub_80B9804
sub_80B9804: @ 0x080B9804
	push {lr}
	bl sub_80B96F8
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80B9804

	THUMB_FUNC_START sub_80B9810
sub_80B9810: @ 0x080B9810
	push {lr}
	bl sub_80C1D70
	movs r0, #8
	bl Proc_EndEachMarked
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80B9810

	THUMB_FUNC_START sub_80B9820
sub_80B9820: @ 0x080B9820
	push {lr}
	bl sub_8092194
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80B9820

	THUMB_FUNC_START sub_80B982C
sub_80B982C: @ 0x080B982C
	push {r4, lr}
	ldr r3, [r0, #0x44]
	movs r1, #0x2a
	adds r1, r1, r3
	mov ip, r1
	ldrb r1, [r1]
	movs r4, #1
	orrs r1, r4
	movs r2, #6
	orrs r1, r2
	mov r2, ip
	strb r1, [r2]
	ldr r2, [r3, #0x4c]
	adds r2, #0x31
	ldrb r3, [r2]
	movs r1, #3
	orrs r1, r3
	strb r1, [r2]
	ldr r0, [r0, #0x4c]
	movs r1, #1
	negs r1, r1
	bl MapUnitC_MarkSomething
	ldr r2, _080B9878  @ gLCDControlBuffer
	ldrb r0, [r2, #1]
	orrs r0, r4
	movs r1, #2
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2, #1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B9878: .4byte gLCDControlBuffer

	THUMB_FUNC_END sub_80B982C

	THUMB_FUNC_START sub_80B987C
sub_80B987C: @ 0x080B987C
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #8
	bl Proc_BlockEachMarked
	ldr r0, _080B9898  @ ProcScr_E_Guide2
	adds r1, r4, #0
	bl Proc_StartBlocking
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080B9898: .4byte ProcScr_E_Guide2

	THUMB_FUNC_END sub_80B987C

	THUMB_FUNC_START sub_80B989C
sub_80B989C: @ 0x080B989C
	push {lr}
	movs r0, #8
	bl Proc_UnblockEachMarked
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80B989C

	THUMB_FUNC_START sub_80B98A8
sub_80B98A8: @ 0x080B98A8
	push {r4, lr}
	ldr r3, [r0, #0x44]
	movs r1, #0x2a
	adds r1, r1, r3
	mov ip, r1
	ldrb r1, [r1]
	movs r4, #1
	orrs r1, r4
	movs r2, #6
	orrs r1, r2
	mov r2, ip
	strb r1, [r2]
	ldr r2, [r3, #0x4c]
	adds r2, #0x31
	ldrb r3, [r2]
	movs r1, #3
	orrs r1, r3
	strb r1, [r2]
	ldr r0, [r0, #0x4c]
	movs r1, #1
	negs r1, r1
	bl MapUnitC_MarkSomething
	ldr r2, _080B98F4  @ gLCDControlBuffer
	ldrb r0, [r2, #1]
	orrs r0, r4
	movs r1, #2
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2, #1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B98F4: .4byte gLCDControlBuffer

	THUMB_FUNC_END sub_80B98A8

	THUMB_FUNC_START sub_80B98F8
sub_80B98F8: @ 0x080B98F8
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #8
	bl Proc_BlockEachMarked
	ldr r0, _080B9914  @ gProcScr_Config3
	adds r1, r4, #0
	bl Proc_StartBlocking
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080B9914: .4byte gProcScr_Config3

	THUMB_FUNC_END sub_80B98F8

	THUMB_FUNC_START sub_80B9918
sub_80B9918: @ 0x080B9918
	push {lr}
	movs r0, #8
	bl Proc_UnblockEachMarked
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80B9918

	THUMB_FUNC_START sub_80B9924
sub_80B9924: @ 0x080B9924
	push {r4, lr}
	ldr r3, [r0, #0x44]
	movs r1, #0x2a
	adds r1, r1, r3
	mov ip, r1
	ldrb r1, [r1]
	movs r4, #1
	orrs r1, r4
	movs r2, #6
	orrs r1, r2
	mov r2, ip
	strb r1, [r2]
	ldr r2, [r3, #0x4c]
	adds r2, #0x31
	ldrb r3, [r2]
	movs r1, #3
	orrs r1, r3
	strb r1, [r2]
	ldr r0, [r0, #0x4c]
	movs r1, #1
	negs r1, r1
	bl MapUnitC_MarkSomething
	ldr r2, _080B9970  @ gLCDControlBuffer
	ldrb r0, [r2, #1]
	orrs r0, r4
	movs r1, #2
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2, #1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B9970: .4byte gLCDControlBuffer

	THUMB_FUNC_END sub_80B9924

	THUMB_FUNC_START sub_80B9974
sub_80B9974: @ 0x080B9974
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #8
	bl Proc_BlockEachMarked
	ldr r0, _080B9990  @ gUnknown_08A3E8B8
	adds r1, r4, #0
	bl Proc_StartBlocking
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080B9990: .4byte gUnknown_08A3E8B8

	THUMB_FUNC_END sub_80B9974

	THUMB_FUNC_START sub_80B9994
sub_80B9994: @ 0x080B9994
	push {lr}
	movs r0, #8
	bl Proc_UnblockEachMarked
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80B9994

	THUMB_FUNC_START sub_80B99A0
sub_80B99A0: @ 0x080B99A0
	push {r4, lr}
	ldr r3, [r0, #0x44]
	movs r1, #0x2a
	adds r1, r1, r3
	mov ip, r1
	ldrb r1, [r1]
	movs r4, #1
	orrs r1, r4
	movs r2, #6
	orrs r1, r2
	mov r2, ip
	strb r1, [r2]
	ldr r2, [r3, #0x4c]
	adds r2, #0x31
	ldrb r3, [r2]
	movs r1, #3
	orrs r1, r3
	strb r1, [r2]
	ldr r0, [r0, #0x4c]
	movs r1, #1
	negs r1, r1
	bl MapUnitC_MarkSomething
	ldr r2, _080B99EC  @ gLCDControlBuffer
	ldrb r0, [r2, #1]
	orrs r0, r4
	movs r1, #2
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2, #1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B99EC: .4byte gLCDControlBuffer

	THUMB_FUNC_END sub_80B99A0

	THUMB_FUNC_START sub_80B99F0
sub_80B99F0: @ 0x080B99F0
	ldr r2, _080B9A0C  @ gLCDControlBuffer
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
_080B9A0C: .4byte gLCDControlBuffer

	THUMB_FUNC_END sub_80B99F0

	THUMB_FUNC_START WorldMap_HideEverything
WorldMap_HideEverything: @ 0x080B9A10
	ldr r2, _080B9A30  @ gLCDControlBuffer
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
_080B9A30: .4byte gLCDControlBuffer

	THUMB_FUNC_END WorldMap_HideEverything

	THUMB_FUNC_START sub_80B9A34
sub_80B9A34: @ 0x080B9A34
	push {lr}
	adds r2, r0, #0
	ldr r1, [r2, #0x2c]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _080B9A52
	movs r0, #0x45
	negs r0, r0
	ands r1, r0
	str r1, [r2, #0x2c]
	movs r0, #4
	movs r1, #0
	bl NewFadeIn
_080B9A52:
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80B9A34

	THUMB_FUNC_START sub_80B9A58
sub_80B9A58: @ 0x080B9A58
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x54]
	movs r1, #0
	movs r2, #0
	bl MapMU_80BE108
	ldr r4, _080B9A8C  @ gGMData
	ldrb r0, [r4, #0x11]
	bl WMLoc_GetChapterId
	ldr r1, _080B9A90  @ gPlaySt
	movs r2, #0
	strb r0, [r1, #0xe]
	strb r2, [r4, #1]
	ldrb r0, [r4, #0x11]
	bl sub_80BCA1C
	adds r1, r0, #0
	movs r0, #0
	adds r2, r5, #0
	bl sub_80C07D4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B9A8C: .4byte gGMData
_080B9A90: .4byte gPlaySt

	THUMB_FUNC_END sub_80B9A58

	THUMB_FUNC_START sub_80B9A94
sub_80B9A94: @ 0x080B9A94
	push {r4, lr}
	adds r4, r0, #0
	bl sub_80C081C
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080B9AA8
	adds r0, r4, #0
	bl Proc_Break
_080B9AA8:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80B9A94

	THUMB_FUNC_START sub_80B9AB0
sub_80B9AB0: @ 0x080B9AB0
	push {lr}
	movs r0, #4
	bl Sound_FadeOutBGM
	ldr r2, _080B9AE8  @ gLCDControlBuffer
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
	bl sub_80B895C
	bl sub_80C3660
	bl EndWMFaceCtrl
	pop {r0}
	bx r0
	.align 2, 0
_080B9AE8: .4byte gLCDControlBuffer

	THUMB_FUNC_END sub_80B9AB0

	THUMB_FUNC_START sub_80B9AEC
sub_80B9AEC: @ 0x080B9AEC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r7, r0, #0
	movs r4, #4
	ldr r6, _080B9B34  @ gGMData
	movs r0, #0xcc
	adds r0, r0, r6
	mov r8, r0
	adds r5, r6, #0
	adds r5, #0x10
_080B9B02:
	movs r1, #0x12
	ldrsh r0, [r5, r1]
	cmp r0, #0
	beq _080B9B20
	ldrb r0, [r6, #0x11]
	ldrb r1, [r5, #0x11]
	cmp r0, r1
	bne _080B9B20
	subs r0, r4, #4
	mov r1, r8
	strb r0, [r1]
	ldr r0, [r7, #0x54]
	adds r1, r4, #0
	bl MapMU_RemoveUnit
_080B9B20:
	adds r5, #4
	adds r4, #1
	cmp r4, #6
	ble _080B9B02
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B9B34: .4byte gGMData

	THUMB_FUNC_END sub_80B9AEC

	THUMB_FUNC_START WorldMap_InitChapterTransition
WorldMap_InitChapterTransition: @ 0x080B9B38
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x54]
	movs r1, #0
	movs r2, #0
	bl MapMU_80BE108
	ldr r5, _080B9B70  @ gGMData
	ldrb r2, [r5, #0x11]
	lsls r0, r2, #5
	ldr r1, _080B9B74  @ gUnknown_082060B0
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #3
	beq _080B9B7C
	adds r0, r4, #0
	adds r0, #0x3e
	ldrb r0, [r0]
	bl WMLoc_GetChapterId
	ldr r1, _080B9B78  @ gPlaySt
	strb r0, [r1, #0xe]
	ldrb r1, [r5]
	movs r0, #3
	negs r0, r0
	ands r0, r1
	strb r0, [r5]
	b _080B9B86
	.align 2, 0
_080B9B70: .4byte gGMData
_080B9B74: .4byte gUnknown_082060B0
_080B9B78: .4byte gPlaySt
_080B9B7C:
	adds r0, r2, #0
	bl WMLoc_GetChapterId
	ldr r1, _080B9B9C  @ gPlaySt
	strb r0, [r1, #0xe]
_080B9B86:
	adds r0, r4, #0
	bl CallChapterWMIntroEvents
	ldr r1, _080B9BA0  @ gGMData
	movs r0, #0
	strb r0, [r1, #1]
	bl sub_80C1AB0
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B9B9C: .4byte gPlaySt
_080B9BA0: .4byte gGMData

	THUMB_FUNC_END WorldMap_InitChapterTransition

	THUMB_FUNC_START sub_80B9BA4
sub_80B9BA4: @ 0x080B9BA4
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r6, r0, #0
	bl EventEngineExists
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080B9CA4
	ldr r0, [r6, #0x44]
	ldr r0, [r0, #0x4c]
	bl MapRoute_80BC2DC
	ldr r0, _080B9C04  @ gGMData
	ldrb r1, [r0]
	movs r0, #0x80
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0
	bne _080B9C08
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	str r4, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl SetBlendTargetA
	str r4, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #1
	movs r3, #0
	bl SetBlendTargetB
	movs r0, #0
	bl SetBlendBackdropA
	movs r0, #0
	bl SetBlendBackdropB
	b _080B9C26
	.align 2, 0
_080B9C04: .4byte gGMData
_080B9C08:
	ldr r2, _080B9C68  @ gLCDControlBuffer
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
_080B9C26:
	bl sub_80B895C
	bl sub_80C3660
	bl EndWMFaceCtrl
	bl sub_80C0200
	bl sub_80C2460
	bl sub_80C1F5C
	ldr r5, _080B9C6C  @ gGMData
	ldrb r1, [r5]
	movs r0, #0xc0
	ands r0, r1
	cmp r0, #0
	beq _080B9C70
	movs r0, #1
	bl Sound_FadeOutBGM
	movs r0, #1
	bl Sound_FadeOutSE
	ldrb r0, [r5, #0x11]
	adds r2, r6, #0
	adds r2, #0x3e
	strb r0, [r2]
	adds r0, r6, #0
	movs r1, #0xf
	bl Proc_Goto
	b _080B9CA4
	.align 2, 0
_080B9C68: .4byte gLCDControlBuffer
_080B9C6C: .4byte gGMData
_080B9C70:
	ldrb r1, [r5, #0x11]
	lsls r1, r1, #5
	ldr r0, _080B9CAC  @ gUnknown_082060B0
	adds r1, r1, r0
	movs r2, #0x18
	ldrsh r0, [r1, r2]
	movs r2, #0x1a
	ldrsh r1, [r1, r2]
	lsls r2, r0, #8
	str r2, [r5, #8]
	lsls r2, r1, #8
	str r2, [r5, #0xc]
	mov r4, sp
	adds r4, #6
	add r2, sp, #4
	adds r3, r4, #0
	bl GetWMCenteredCameraPosition
	add r0, sp, #4
	ldrh r0, [r0]
	strh r0, [r5, #2]
	ldrh r0, [r4]
	strh r0, [r5, #4]
	adds r0, r6, #0
	bl Proc_Break
_080B9CA4:
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B9CAC: .4byte gUnknown_082060B0

	THUMB_FUNC_END sub_80B9BA4

	THUMB_FUNC_START WorldMap_WaitForChapterIntroEvents
WorldMap_WaitForChapterIntroEvents: @ 0x080B9CB0
	push {r4, lr}
	adds r4, r0, #0
	bl EventEngineExists
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080B9CFA
	ldr r2, _080B9D00  @ gLCDControlBuffer
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
	bl sub_80B895C
	bl sub_80C3660
	bl EndWMFaceCtrl
	bl sub_80C0200
	bl sub_80C2460
	bl sub_80C1F5C
	adds r0, r4, #0
	bl Proc_Break
_080B9CFA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B9D00: .4byte gLCDControlBuffer

	THUMB_FUNC_END WorldMap_WaitForChapterIntroEvents

	THUMB_FUNC_START sub_80B9D04
sub_80B9D04: @ 0x080B9D04
	ldr r0, _080B9D10  @ gGMData
	ldrb r1, [r0]
	movs r2, #2
	orrs r1, r2
	strb r1, [r0]
	bx lr
	.align 2, 0
_080B9D10: .4byte gGMData

	THUMB_FUNC_END sub_80B9D04

	THUMB_FUNC_START sub_80B9D14
sub_80B9D14: @ 0x080B9D14
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	movs r4, #0
	ldr r3, _080B9D2C  @ gGMData
	ldrb r1, [r3]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _080B9D30
	movs r4, #1
	b _080B9D96
	.align 2, 0
_080B9D2C: .4byte gGMData
_080B9D30:
	ldr r0, _080B9D44  @ gPlaySt
	ldrb r1, [r0, #0x14]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _080B9D60
	movs r2, #4
	adds r1, r3, #0
	adds r1, #0x10
	b _080B9D50
	.align 2, 0
_080B9D44: .4byte gPlaySt
_080B9D48:
	adds r1, #4
	adds r2, #1
	cmp r2, #6
	bgt _080B9D58
_080B9D50:
	movs r3, #0x12
	ldrsh r0, [r1, r3]
	cmp r0, #0
	beq _080B9D48
_080B9D58:
	cmp r2, #7
	bne _080B9D92
	movs r4, #1
	b _080B9D96
_080B9D60:
	ldrb r0, [r3, #0x11]
	lsls r0, r0, #5
	ldr r1, _080B9D78  @ gUnknown_082060B0
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #3
	bne _080B9D92
	movs r2, #4
	adds r1, r3, #0
	adds r1, #0x10
	b _080B9D84
	.align 2, 0
_080B9D78: .4byte gUnknown_082060B0
_080B9D7C:
	adds r1, #4
	adds r2, #1
	cmp r2, #6
	bgt _080B9D8C
_080B9D84:
	movs r3, #0x12
	ldrsh r0, [r1, r3]
	cmp r0, #0
	beq _080B9D7C
_080B9D8C:
	cmp r2, #7
	bne _080B9D92
	movs r4, #1
_080B9D92:
	cmp r4, #0
	beq _080B9DAC
_080B9D96:
	movs r0, #0
	mov r1, sp
	bl sub_80C1A74
	ldr r0, [sp]
	cmp r0, #0
	ble _080B9DAC
	adds r0, r5, #0
	movs r1, #2
	bl Proc_Goto
_080B9DAC:
	bl sub_80C1AF8
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80B9D14

	THUMB_FUNC_START sub_80B9DB8
sub_80B9DB8: @ 0x080B9DB8
	push {lr}
	bl sub_80C1ADC
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80B9DB8

	THUMB_FUNC_START sub_80B9DC4
sub_80B9DC4: @ 0x080B9DC4
	push {r4, lr}
	adds r4, r0, #0
	bl sub_80C1BE0
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080B9DD8
	adds r0, r4, #0
	bl Proc_Break
_080B9DD8:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80B9DC4

	THUMB_FUNC_START sub_80B9DE0
sub_80B9DE0: @ 0x080B9DE0
	push {r4, lr}
	sub sp, #4
	ldr r0, [r0, #0x54]
	mov r4, sp
	adds r4, #2
	movs r1, #0
	mov r2, sp
	adds r3, r4, #0
	bl sub_80BE3A0
	mov r0, sp
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r2, #0
	ldrsh r1, [r4, r2]
	bl sub_80C168C
	mov r3, sp
	ldr r1, _080B9E38  @ gGMData
	ldrb r0, [r1, #0x11]
	lsls r0, r0, #5
	ldr r2, _080B9E3C  @ gUnknown_082060B0
	adds r0, r0, r2
	ldrh r0, [r0, #0x18]
	strh r0, [r3]
	ldrb r0, [r1, #0x11]
	lsls r0, r0, #5
	adds r0, r0, r2
	ldrh r0, [r0, #0x1a]
	strh r0, [r4]
	mov r0, sp
	movs r2, #0
	ldrsh r0, [r0, r2]
	lsls r0, r0, #8
	str r0, [r1, #8]
	movs r2, #0
	ldrsh r0, [r4, r2]
	lsls r0, r0, #8
	str r0, [r1, #0xc]
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B9E38: .4byte gGMData
_080B9E3C: .4byte gUnknown_082060B0

	THUMB_FUNC_END sub_80B9DE0

	THUMB_FUNC_START sub_80B9E40
sub_80B9E40: @ 0x080B9E40
	push {r4, lr}
	adds r4, r0, #0
	bl sub_80C16DC
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080B9E5A
	ldr r1, _080B9E60  @ gGMData
	movs r0, #1
	strb r0, [r1, #1]
	adds r0, r4, #0
	bl Proc_Break
_080B9E5A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B9E60: .4byte gGMData

	THUMB_FUNC_END sub_80B9E40

	THUMB_FUNC_START sub_80B9E64
sub_80B9E64: @ 0x080B9E64
	push {lr}
	sub sp, #4
	bl sub_80B895C
	bl sub_80C3660
	bl EndWMFaceCtrl
	mov r2, sp
	ldr r1, _080B9EA0  @ gGMData
	ldrh r0, [r1, #2]
	strh r0, [r2]
	adds r2, #2
	ldrh r0, [r1, #4]
	strh r0, [r2]
	mov r0, sp
	movs r3, #0
	ldrsh r0, [r0, r3]
	adds r0, #0x78
	lsls r0, r0, #8
	str r0, [r1, #8]
	movs r3, #0
	ldrsh r0, [r2, r3]
	adds r0, #0x50
	lsls r0, r0, #8
	str r0, [r1, #0xc]
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_080B9EA0: .4byte gGMData

	THUMB_FUNC_END sub_80B9E64

	THUMB_FUNC_START sub_80B9EA4
sub_80B9EA4: @ 0x080B9EA4
	push {lr}
	sub sp, #4
	ldr r2, _080B9F04  @ gLCDControlBuffer
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
	movs r0, #0
	movs r1, #0
	movs r2, #0
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
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #1
	bl SetBlendTargetB
	movs r0, #1
	bl Sound_FadeOutBGM
	movs r0, #1
	bl Sound_FadeOutSE
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_080B9F04: .4byte gLCDControlBuffer

	THUMB_FUNC_END sub_80B9EA4

	THUMB_FUNC_START DoNothing
DoNothing: @ 0x080B9F08
	push {lr}
	bl nullsub_22
	pop {r0}
	bx r0

	THUMB_FUNC_END DoNothing

	THUMB_FUNC_START sub_80B9F14
sub_80B9F14: @ 0x080B9F14
	push {lr}
	adds r1, r0, #0
	movs r0, #0
	bl sub_80C400C
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80B9F14

	THUMB_FUNC_START sub_80B9F24
sub_80B9F24: @ 0x080B9F24
	push {lr}
	adds r1, r0, #0
	movs r0, #1
	bl sub_80C400C
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80B9F24

	THUMB_FUNC_START sub_80B9F34
sub_80B9F34: @ 0x080B9F34
	push {lr}
	adds r1, r0, #0
	movs r0, #2
	bl sub_80C400C
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80B9F34

	THUMB_FUNC_START sub_80B9F44
sub_80B9F44: @ 0x080B9F44
	push {lr}
	adds r1, r0, #0
	movs r0, #3
	bl sub_80C400C
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80B9F44

	THUMB_FUNC_START sub_80B9F54
sub_80B9F54: @ 0x080B9F54
	push {r4, lr}
	ldr r4, _080B9F68  @ gPlaySt
	ldrb r1, [r4, #0x14]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _080B9F6C
	movs r4, #8
	b _080B9FAA
	.align 2, 0
_080B9F68: .4byte gPlaySt
_080B9F6C:
	ldr r0, _080B9F90  @ gGMData
	bl sub_80BD014
	cmp r0, #0
	blt _080B9FA8
	ldrb r1, [r4, #0x1b]
	cmp r1, #1
	blt _080B9F84
	cmp r1, #2
	ble _080B9F84
	cmp r1, #3
	beq _080B9F98
_080B9F84:
	ldr r1, _080B9F94  @ gUnknown_08A3DD88
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrh r4, [r0]
	b _080B9FAA
	.align 2, 0
_080B9F90: .4byte gGMData
_080B9F94: .4byte gUnknown_08A3DD88
_080B9F98:
	ldr r1, _080B9FA4  @ gUnknown_08A3DD88
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrh r4, [r0, #2]
	b _080B9FAA
	.align 2, 0
_080B9FA4: .4byte gUnknown_08A3DD88
_080B9FA8:
	movs r4, #4
_080B9FAA:
	bl Sound_GetCurrentSong
	cmp r0, r4
	beq _080B9FB8
	adds r0, r4, #0
	bl OverrideBgm
_080B9FB8:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80B9F54

	THUMB_FUNC_START sub_80B9FC0
sub_80B9FC0: @ 0x080B9FC0
	push {lr}
	ldr r0, _080B9FD0  @ gUnknown_08A3D748
	bl Proc_Find
	bl sub_80B9F54
	pop {r0}
	bx r0
	.align 2, 0
_080B9FD0: .4byte gUnknown_08A3D748

	THUMB_FUNC_END sub_80B9FC0

	THUMB_FUNC_START sub_80B9FD4
sub_80B9FD4: @ 0x080B9FD4
	push {lr}
	ldr r0, _080BA000  @ gGMData
	bl sub_80BD014
	cmp r0, #0
	bge _080B9FE2
	movs r0, #0
_080B9FE2:
	bl WMLoc_GetChapterId
	ldr r2, _080BA004  @ gPlaySt
	strb r0, [r2, #0xe]
	adds r2, #0x4a
	ldrb r1, [r2]
	movs r0, #0xf
	negs r0, r0
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	strb r0, [r2]
	pop {r0}
	bx r0
	.align 2, 0
_080BA000: .4byte gGMData
_080BA004: .4byte gPlaySt

	THUMB_FUNC_END sub_80B9FD4

	THUMB_FUNC_START sub_80BA008
sub_80BA008: @ 0x080BA008
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080BA020  @ gUnknown_08A3D748
	bl Proc_Find
	str r4, [r0, #0x2c]
	movs r1, #0
	bl Proc_Goto
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BA020: .4byte gUnknown_08A3D748

	THUMB_FUNC_END sub_80BA008

	THUMB_FUNC_START EndWM
EndWM: @ 0x080BA024
	push {lr}
	ldr r0, _080BA04C  @ gUnknown_08A20DA4
	bl Proc_Find
	bl Proc_End
	ldr r0, _080BA050  @ gUnknown_08A3D748
	bl Proc_Find
	bl Proc_End
	bl ResetDialogueScreen
	bl APProc_DeleteAll
	movs r0, #0
	bl SetupBackgrounds
	pop {r0}
	bx r0
	.align 2, 0
_080BA04C: .4byte gUnknown_08A20DA4
_080BA050: .4byte gUnknown_08A3D748

	THUMB_FUNC_END EndWM

	THUMB_FUNC_START sub_80BA054
sub_80BA054: @ 0x080BA054
	push {lr}
	ldr r0, _080BA068  @ gUnknown_08A3D748
	bl Proc_Find
	cmp r0, #0
	beq _080BA062
	movs r0, #1
_080BA062:
	pop {r1}
	bx r1
	.align 2, 0
_080BA068: .4byte gUnknown_08A3D748

	THUMB_FUNC_END sub_80BA054

	THUMB_FUNC_START sub_80BA06C
sub_80BA06C: @ 0x080BA06C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x2c]
	cmp r0, #0
	ble _080BA07C
	subs r0, #1
	str r0, [r4, #0x2c]
	b _080BA0AE
_080BA07C:
	adds r0, r4, #0
	adds r0, #0x30
	ldrb r0, [r0]
	cmp r0, #6
	beq _080BA08C
	cmp r0, #7
	beq _080BA09C
	b _080BA0A8
_080BA08C:
	ldr r0, [r4, #0x34]
	ldr r1, [r4, #0x40]
	ldr r2, [r4, #0x44]
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	bl sub_80B86CC
	b _080BA0A8
_080BA09C:
	ldr r0, [r4, #0x34]
	ldr r1, [r4, #0x44]
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	bl sub_80B8844
_080BA0A8:
	adds r0, r4, #0
	bl Proc_Break
_080BA0AE:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80BA06C

	THUMB_FUNC_START sub_80BA0B4
sub_80BA0B4: @ 0x080BA0B4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	adds r4, r1, #0
	adds r6, r2, #0
	mov r8, r3
	ldr r7, [sp, #0x18]
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _080BA0F8  @ gUnknown_08A3D748
	bl Proc_Find
	adds r1, r0, #0
	ldr r0, _080BA0FC  @ gUnknown_08A3DD08
	bl Proc_Start
	str r5, [r0, #0x2c]
	adds r1, r0, #0
	adds r1, #0x30
	strb r4, [r1]
	str r6, [r0, #0x34]
	mov r1, r8
	str r1, [r0, #0x40]
	str r7, [r0, #0x38]
	ldr r1, [sp, #0x1c]
	str r1, [r0, #0x3c]
	ldr r1, [sp, #0x20]
	str r1, [r0, #0x44]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BA0F8: .4byte gUnknown_08A3D748
_080BA0FC: .4byte gUnknown_08A3DD08

	THUMB_FUNC_END sub_80BA0B4

	THUMB_FUNC_START sub_80BA100
sub_80BA100: @ 0x080BA100
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	adds r6, r0, #0
	ldr r0, [r6, #0x30]
	lsls r0, r0, #5
	ldr r1, _080BA194  @ gUnknown_020228AA
	adds r5, r0, r1
	adds r4, r6, #0
	adds r4, #0x34
	ldr r0, [r6, #0x2c]
	adds r0, #1
	str r0, [r6, #0x2c]
	movs r1, #0x1f
	mov r9, r1
	movs r1, #0x20
	subs r3, r1, r0
	movs r2, #0xf8
	lsls r2, r2, #2
	mov r8, r2
	movs r7, #0xf8
	lsls r7, r7, #7
	mov ip, r7
	movs r0, #0xe
	mov sl, r0
_080BA136:
	ldrh r2, [r4]
	movs r0, #0x1f
	ands r0, r2
	adds r1, r0, #0
	muls r1, r3, r1
	asrs r1, r1, #5
	mov r7, r9
	ands r1, r7
	mov r0, r8
	ands r0, r2
	muls r0, r3, r0
	asrs r0, r0, #5
	mov r7, r8
	ands r0, r7
	adds r1, r1, r0
	mov r0, ip
	ands r0, r2
	muls r0, r3, r0
	asrs r0, r0, #5
	mov r2, ip
	ands r0, r2
	adds r1, r1, r0
	strh r1, [r5]
	adds r4, #2
	adds r5, #2
	movs r7, #1
	negs r7, r7
	add sl, r7
	mov r0, sl
	cmp r0, #0
	bge _080BA136
	bl EnablePaletteSync
	ldr r0, [r6, #0x2c]
	cmp r0, #0x20
	bne _080BA184
	adds r0, r6, #0
	bl Proc_Break
_080BA184:
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BA194: .4byte gUnknown_020228AA

	THUMB_FUNC_END sub_80BA100

	THUMB_FUNC_START sub_80BA198
sub_80BA198: @ 0x080BA198
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, _080BA1E4  @ gUnknown_08A3D748
	bl Proc_Find
	adds r1, r0, #0
	ldr r0, _080BA1E8  @ gUnknown_08A3DD20
	bl Proc_Start
	adds r5, r0, #0
	movs r0, #0x1f
	ands r4, r0
	str r4, [r5, #0x30]
	movs r0, #0
	str r0, [r5, #0x2c]
	ldr r0, _080BA1EC  @ gPal_MapSprite
	movs r1, #0xe0
	lsls r1, r1, #2
	movs r2, #0x80
	bl CopyToPaletteBuffer
	ldr r0, _080BA1F0  @ gPaletteBuffer
	lsls r4, r4, #5
	adds r4, r4, r0
	adds r4, #2
	adds r5, #0x34
	movs r1, #0xe
_080BA1CE:
	ldrh r0, [r4]
	strh r0, [r5]
	adds r4, #2
	adds r5, #2
	subs r1, #1
	cmp r1, #0
	bge _080BA1CE
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080BA1E4: .4byte gUnknown_08A3D748
_080BA1E8: .4byte gUnknown_08A3DD20
_080BA1EC: .4byte gPal_MapSprite
_080BA1F0: .4byte gPaletteBuffer

	THUMB_FUNC_END sub_80BA198

	THUMB_FUNC_START sub_80BA1F4
sub_80BA1F4: @ 0x080BA1F4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	adds r6, r0, #0
	ldr r0, [r6, #0x30]
	lsls r0, r0, #5
	ldr r1, _080BA284  @ gUnknown_020228AA
	adds r5, r0, r1
	adds r4, r6, #0
	adds r4, #0x34
	ldr r0, [r6, #0x2c]
	adds r0, #1
	str r0, [r6, #0x2c]
	movs r1, #0x1f
	mov r9, r1
	adds r3, r0, #0
	movs r2, #0xf8
	lsls r2, r2, #2
	mov r8, r2
	movs r7, #0xf8
	lsls r7, r7, #7
	mov ip, r7
	movs r0, #0xe
	mov sl, r0
_080BA228:
	ldrh r2, [r4]
	movs r0, #0x1f
	ands r0, r2
	adds r1, r0, #0
	muls r1, r3, r1
	asrs r1, r1, #5
	mov r7, r9
	ands r1, r7
	mov r0, r8
	ands r0, r2
	muls r0, r3, r0
	asrs r0, r0, #5
	mov r7, r8
	ands r0, r7
	adds r1, r1, r0
	mov r0, ip
	ands r0, r2
	muls r0, r3, r0
	asrs r0, r0, #5
	mov r2, ip
	ands r0, r2
	adds r1, r1, r0
	strh r1, [r5]
	adds r4, #2
	adds r5, #2
	movs r7, #1
	negs r7, r7
	add sl, r7
	mov r0, sl
	cmp r0, #0
	bge _080BA228
	bl EnablePaletteSync
	ldr r0, [r6, #0x2c]
	cmp r0, #0x20
	bne _080BA276
	adds r0, r6, #0
	bl Proc_Break
_080BA276:
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BA284: .4byte gUnknown_020228AA

	THUMB_FUNC_END sub_80BA1F4

	THUMB_FUNC_START sub_80BA288
sub_80BA288: @ 0x080BA288
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, _080BA2D4  @ gUnknown_08A3D748
	bl Proc_Find
	adds r1, r0, #0
	ldr r0, _080BA2D8  @ gUnknown_08A3DD38
	bl Proc_Start
	adds r5, r0, #0
	movs r0, #0x1f
	ands r4, r0
	str r4, [r5, #0x30]
	movs r0, #0
	str r0, [r5, #0x2c]
	ldr r0, _080BA2DC  @ gPal_MapSprite
	movs r1, #0xe0
	lsls r1, r1, #2
	movs r2, #0x80
	bl CopyToPaletteBuffer
	ldr r0, _080BA2E0  @ gPaletteBuffer
	lsls r4, r4, #5
	adds r4, r4, r0
	adds r4, #2
	adds r5, #0x34
	movs r1, #0xe
_080BA2BE:
	ldrh r0, [r4]
	strh r0, [r5]
	adds r4, #2
	adds r5, #2
	subs r1, #1
	cmp r1, #0
	bge _080BA2BE
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080BA2D4: .4byte gUnknown_08A3D748
_080BA2D8: .4byte gUnknown_08A3DD38
_080BA2DC: .4byte gPal_MapSprite
_080BA2E0: .4byte gPaletteBuffer

	THUMB_FUNC_END sub_80BA288

	THUMB_FUNC_START NewWorldMap
NewWorldMap: @ 0x080BA2E4
	push {lr}
	ldr r0, _080BA310  @ gUnknown_08A3D748
	movs r1, #3
	bl Proc_Start
	adds r3, r0, #0
	adds r2, r3, #0
	adds r2, #0x29
	ldrb r1, [r2]
	movs r0, #3
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	ldr r0, _080BA314  @ gPlaySt
	ldrb r1, [r0, #0x14]
	movs r2, #4
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	beq _080BA318
	str r2, [r3, #0x2c]
	b _080BA330
	.align 2, 0
_080BA310: .4byte gUnknown_08A3D748
_080BA314: .4byte gPlaySt
_080BA318:
	ldr r0, _080BA328  @ gGMData
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080BA32C
	movs r0, #0xc
	b _080BA32E
	.align 2, 0
_080BA328: .4byte gGMData
_080BA32C:
	movs r0, #0x10
_080BA32E:
	str r0, [r3, #0x2c]
_080BA330:
	pop {r0}
	bx r0

	THUMB_FUNC_END NewWorldMap

	THUMB_FUNC_START WorldMap_SetupChapterStuff
WorldMap_SetupChapterStuff: @ 0x080BA334
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	movs r0, #4
	bl Sound_FadeOutBGM
	ldr r2, _080BA360  @ gGMData
	ldrb r1, [r2]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _080BA356
	ldr r6, _080BA364  @ gPlaySt
	ldrb r1, [r6, #0x14]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _080BA368
_080BA356:
	ldr r0, [r5, #0x2c]
	bl sub_80BA008
	b _080BA3BC
	.align 2, 0
_080BA360: .4byte gGMData
_080BA364: .4byte gPlaySt
_080BA368:
	ldrb r0, [r2, #0x11]
	adds r1, r2, #0
	adds r1, #0xc8
	strb r0, [r1]
	bl WMLoc_GetNextLocId
	cmp r0, #0
	blt _080BA3BC
	bl WMLoc_GetChapterId
	adds r4, r0, #0
	strb r4, [r6, #0xe]
	ldr r6, _080BA3D0  @ gUnknown_088B39EC
	bl GetROMChapterStruct
	adds r0, #0x75
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r6
	ldr r0, [r0]
	cmp r0, #0
	beq _080BA3C8
	bl sub_80BCFB4
	ldr r1, [r5, #0x48]
	adds r1, #0x32
	ldrb r2, [r1]
	movs r0, #3
	negs r0, r0
	ands r0, r2
	strb r0, [r1]
	adds r0, r4, #0
	bl GetROMChapterStruct
	adds r0, #0x75
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r6
	ldr r0, [r0]
	movs r1, #0
	bl CallEvent
_080BA3BC:
	adds r0, r5, #0
	bl StartWMFaceCtrl
	movs r0, #0
	bl NewMapMuEntry
_080BA3C8:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080BA3D0: .4byte gUnknown_088B39EC

	THUMB_FUNC_END WorldMap_SetupChapterStuff

	THUMB_FUNC_START CallChapterWMIntroEvents
CallChapterWMIntroEvents: @ 0x080BA3D4
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r6, _080BA41C  @ gUnknown_088B3AD8
	ldr r4, _080BA420  @ gPlaySt
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	bl GetROMChapterStruct
	adds r0, #0x75
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r6
	ldr r0, [r0]
	cmp r0, #0
	beq _080BA416
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	bl GetROMChapterStruct
	adds r0, #0x75
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r6
	ldr r0, [r0]
	movs r1, #0
	bl CallEvent
	adds r0, r5, #0
	bl StartWMFaceCtrl
	movs r0, #0
	bl NewMapMuEntry
_080BA416:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080BA41C: .4byte gUnknown_088B3AD8
_080BA420: .4byte gPlaySt

	THUMB_FUNC_END CallChapterWMIntroEvents

	THUMB_FUNC_START sub_80BA424
sub_80BA424: @ 0x080BA424
	push {r4, lr}
	bl sub_8002AC8
	ldr r4, _080BA454  @ gUnknown_08A3D748
	adds r0, r4, #0
	bl Proc_Find
	ldr r0, [r0, #0x44]
	ldr r0, [r0, #0x4c]
	bl MapRoute_80BC2DC
	adds r0, r4, #0
	bl Proc_Find
	ldr r0, [r0, #0x44]
	ldr r1, [r0, #0x4c]
	adds r1, #0x31
	ldrb r2, [r1]
	movs r0, #3
	orrs r0, r2
	strb r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BA454: .4byte gUnknown_08A3D748

	THUMB_FUNC_END sub_80BA424

	THUMB_FUNC_START sub_80BA458
sub_80BA458: @ 0x080BA458
	push {r4, r5, r6, lr}
	ldr r4, _080BA48C  @ gBG3TilemapBuffer
	movs r3, #0
	movs r1, #0
	movs r2, #0x90
	lsls r2, r2, #8
	adds r6, r2, #0
_080BA466:
	adds r5, r1, #1
	movs r2, #0x1f
_080BA46A:
	adds r1, r3, #0
	orrs r1, r6
	strh r1, [r4]
	adds r1, r3, #1
	lsls r1, r1, #0x10
	lsrs r3, r1, #0x10
	adds r4, #2
	subs r2, #1
	cmp r2, #0
	bge _080BA46A
	adds r1, r5, #0
	cmp r1, #0x1f
	ble _080BA466
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_080BA48C: .4byte gBG3TilemapBuffer

	THUMB_FUNC_END sub_80BA458

	THUMB_FUNC_START sub_80BA490
sub_80BA490: @ 0x080BA490
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	ldr r6, _080BA4CC  @ 0x06008000
	movs r5, #0
	movs r4, #0x1f
_080BA49A:
	ldr r0, [r7, #0x3c]
	adds r0, r0, r5
	adds r1, r6, #0
	movs r2, #0x80
	lsls r2, r2, #1
	bl CpuFastSet
	movs r0, #0x80
	lsls r0, r0, #3
	adds r6, r6, r0
	movs r0, #0xf0
	lsls r0, r0, #3
	adds r5, r5, r0
	subs r4, #1
	cmp r4, #0
	bge _080BA49A
	bl sub_80BA458
	movs r0, #8
	bl BG_EnableSyncByMask
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BA4CC: .4byte 0x06008000

	THUMB_FUNC_END sub_80BA490

	THUMB_FUNC_START sub_80BA4D0
sub_80BA4D0: @ 0x080BA4D0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	ldr r1, [r0, #0x40]
	str r1, [sp]
	ldr r3, [r0, #0x44]
	adds r5, r0, #0
	adds r5, #0x2e
	movs r2, #0
	ldrsb r2, [r5, r2]
	lsls r2, r2, #5
	adds r4, r0, #0
	adds r4, #0x2d
	movs r0, #0
	ldrsb r0, [r4, r0]
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	adds r2, r2, r0
	adds r3, r3, r2
	ldrb r1, [r4]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080BA588
	movs r1, #0
	str r5, [sp, #4]
	mov sl, r4
	movs r2, #0x1f
	mov r9, r2
_080BA512:
	adds r5, r3, #0
	ldr r2, [sp, #4]
	movs r0, #0
	ldrsb r0, [r2, r0]
	adds r0, r1, r0
	mov r2, r9
	ands r0, r2
	movs r6, #0
	movs r2, #0x20
	adds r2, r2, r5
	mov r8, r2
	adds r1, #1
	mov ip, r1
	lsls r0, r0, #6
	ldr r1, [sp]
	adds r7, r0, r1
_080BA532:
	lsls r1, r6, #1
	mov r2, sl
	movs r0, #0
	ldrsb r0, [r2, r0]
	adds r4, r1, r0
	mov r0, r9
	ands r4, r0
	lsls r3, r4, #1
	adds r3, r3, r7
	ldrh r0, [r3]
	ldr r1, _080BA584  @ 0x00000FFF
	ands r1, r0
	ldrb r2, [r5]
	movs r0, #0xf0
	ands r0, r2
	adds r0, #0x90
	lsls r0, r0, #8
	orrs r1, r0
	strh r1, [r3]
	adds r5, #1
	adds r2, r4, #1
	mov r1, r9
	ands r2, r1
	lsls r2, r2, #1
	adds r2, r2, r7
	ldrh r0, [r2]
	ldr r1, _080BA584  @ 0x00000FFF
	ands r1, r0
	ldrb r0, [r5]
	adds r0, #9
	lsls r0, r0, #0xc
	orrs r1, r0
	strh r1, [r2]
	adds r6, #1
	cmp r6, #0xf
	ble _080BA532
	mov r3, r8
	mov r1, ip
	cmp r1, #0x15
	ble _080BA512
	b _080BA602
	.align 2, 0
_080BA584: .4byte 0x00000FFF
_080BA588:
	movs r1, #0
	str r5, [sp, #4]
	mov sl, r4
	movs r2, #0x1f
	mov r9, r2
_080BA592:
	adds r5, r3, #0
	ldr r2, [sp, #4]
	movs r0, #0
	ldrsb r0, [r2, r0]
	adds r0, r1, r0
	mov r2, r9
	ands r0, r2
	movs r6, #0
	movs r2, #0x20
	adds r2, r2, r5
	mov r8, r2
	adds r1, #1
	mov ip, r1
	lsls r0, r0, #6
	ldr r1, [sp]
	adds r7, r0, r1
_080BA5B2:
	lsls r1, r6, #1
	mov r2, sl
	movs r0, #0
	ldrsb r0, [r2, r0]
	adds r4, r1, r0
	mov r0, r9
	ands r4, r0
	lsls r2, r4, #1
	adds r2, r2, r7
	ldrh r0, [r2]
	ldr r1, _080BA618  @ 0x00000FFF
	ands r1, r0
	ldrb r0, [r5]
	adds r0, #9
	lsls r0, r0, #0xc
	orrs r1, r0
	strh r1, [r2]
	adds r2, r4, #1
	mov r1, r9
	ands r2, r1
	lsls r2, r2, #1
	adds r2, r2, r7
	ldrh r0, [r2]
	ldr r1, _080BA618  @ 0x00000FFF
	ands r1, r0
	ldrb r3, [r5]
	movs r0, #0xf0
	ands r0, r3
	adds r0, #0x90
	lsls r0, r0, #8
	orrs r1, r0
	strh r1, [r2]
	adds r5, #1
	adds r6, #1
	cmp r6, #0xf
	ble _080BA5B2
	mov r3, r8
	mov r1, ip
	cmp r1, #0x15
	ble _080BA592
_080BA602:
	movs r0, #8
	bl BG_EnableSyncByMask
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BA618: .4byte 0x00000FFF

	THUMB_FUNC_END sub_80BA4D0

	THUMB_FUNC_START sub_80BA61C
sub_80BA61C: @ 0x080BA61C
	movs r1, #0
	strh r1, [r0, #0x38]
	adds r0, #0x40
	strh r1, [r0]
	bx lr

	THUMB_FUNC_END sub_80BA61C

	THUMB_FUNC_START sub_80BA628
sub_80BA628: @ 0x080BA628
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	adds r6, r0, #0
	movs r1, #0x38
	ldrsh r0, [r6, r1]
	cmp r0, #0
	beq _080BA6C8
	movs r2, #0
	cmp r2, r0
	bge _080BA6C4
_080BA642:
	lsls r1, r2, #3
	ldr r0, [r6, #0x3c]
	adds r4, r0, r1
	movs r0, #0
	ldrsb r0, [r4, r0]
	lsls r0, r0, #3
	mov r9, r0
	ldrb r0, [r4, #2]
	movs r1, #0x1f
	ands r1, r0
	movs r0, #4
	ldrsb r0, [r4, r0]
	lsls r0, r0, #5
	mov r8, r0
	movs r3, #0
	movs r0, #5
	ldrsb r0, [r4, r0]
	adds r2, #1
	mov sl, r2
	cmp r3, r0
	bge _080BA6BA
	lsls r0, r1, #5
	ldr r1, _080BA6D8  @ 0x06008000
	adds r7, r0, r1
_080BA672:
	movs r2, #3
	ldrsb r2, [r4, r2]
	lsls r0, r3, #0x18
	asrs r5, r0, #0x18
	adds r2, r2, r5
	movs r0, #0x1f
	ands r2, r0
	movs r1, #1
	ldrsb r1, [r4, r1]
	adds r1, r1, r5
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #7
	ldr r1, [r6, #0x2c]
	adds r1, r1, r0
	mov r3, r9
	lsls r0, r3, #2
	adds r0, r1, r0
	lsls r2, r2, #0xa
	adds r1, r2, r7
	mov r2, r8
	cmp r2, #0
	bge _080BA6A2
	adds r2, #3
_080BA6A2:
	lsls r2, r2, #9
	lsrs r2, r2, #0xb
	bl CpuFastSet
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #5
	ldrsb r1, [r4, r1]
	cmp r0, r1
	blt _080BA672
_080BA6BA:
	mov r2, sl
	movs r1, #0x38
	ldrsh r0, [r6, r1]
	cmp r2, r0
	blt _080BA642
_080BA6C4:
	movs r0, #0
	strh r0, [r6, #0x38]
_080BA6C8:
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BA6D8: .4byte 0x06008000

	THUMB_FUNC_END sub_80BA628

	THUMB_FUNC_START sub_80BA6DC
sub_80BA6DC: @ 0x080BA6DC
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	movs r1, #0x38
	ldrsh r0, [r4, r1]
	cmp r0, #7
	bgt _080BA70E
	adds r1, r0, #0
	lsls r1, r1, #3
	ldr r0, [r4, #0x3c]
	adds r0, r0, r1
	strb r5, [r0]
	strb r2, [r0, #1]
	strb r3, [r0, #2]
	ldr r1, [sp, #0xc]
	strb r1, [r0, #3]
	ldr r1, [sp, #0x10]
	strb r1, [r0, #4]
	ldr r1, [sp, #0x14]
	strb r1, [r0, #5]
	ldrh r0, [r4, #0x38]
	adds r0, #1
	strh r0, [r4, #0x38]
	movs r0, #0
	b _080BA710
_080BA70E:
	movs r0, #1
_080BA710:
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80BA6DC

	THUMB_FUNC_START NewMapScreenVSynce
NewMapScreenVSynce: @ 0x080BA718
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	adds r7, r3, #0
	ldr r0, _080BA74C  @ gUnknown_08A3DDF4
	movs r1, #0
	bl Proc_Start
	adds r2, r0, #0
	cmp r2, #0
	beq _080BA750
	str r4, [r2, #0x2c]
	str r5, [r2, #0x30]
	str r6, [r2, #0x34]
	movs r0, #0
	strh r0, [r2, #0x38]
	str r7, [r2, #0x3c]
	adds r1, r2, #0
	adds r1, #0x40
	strh r0, [r1]
	ldr r0, [sp, #0x14]
	str r0, [r2, #0x44]
	adds r0, r2, #0
	b _080BA752
	.align 2, 0
_080BA74C: .4byte gUnknown_08A3DDF4
_080BA750:
	movs r0, #0
_080BA752:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END NewMapScreenVSynce

	THUMB_FUNC_START MapScreen_OnDelete
MapScreen_OnDelete: @ 0x080BA758
	push {lr}
	ldr r0, [r0, #0x48]
	bl Proc_End
	pop {r0}
	bx r0

	THUMB_FUNC_END MapScreen_OnDelete

	THUMB_FUNC_START MapScreen_Init
MapScreen_Init: @ 0x080BA764
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	adds r2, r6, #0
	adds r2, #0x29
	ldrb r0, [r2]
	movs r1, #1
	orrs r0, r1
	strb r0, [r2]
	adds r1, r6, #0
	adds r1, #0x2a
	movs r0, #0
	strb r0, [r1]
	movs r4, #0
	strh r0, [r6, #0x36]
	strh r0, [r6, #0x34]
	strh r0, [r6, #0x3a]
	strh r0, [r6, #0x38]
	ldr r0, _080BA7FC  @ gUnknown_08A83364
	str r0, [r6, #0x3c]
	movs r0, #3
	bl BG_GetMapBuffer
	str r0, [r6, #0x40]
	ldr r0, _080BA800  @ gUnknown_08A96064
	ldr r5, _080BA804  @ gUnknown_020087A0
	adds r1, r5, #0
	bl Decompress
	str r5, [r6, #0x44]
	adds r0, r6, #0
	adds r0, #0x2c
	strb r4, [r0]
	subs r0, #1
	strb r4, [r0]
	adds r0, #3
	strb r4, [r0]
	subs r0, #1
	strb r4, [r0]
	adds r0, #3
	strb r4, [r0]
	subs r0, #1
	strb r4, [r0]
	adds r0, #3
	strb r4, [r0]
	subs r0, #1
	strb r4, [r0]
	ldr r0, _080BA808  @ gUnknown_08A95FE4
	movs r1, #0x90
	lsls r1, r1, #1
	movs r2, #0x80
	bl CopyToPaletteBuffer
	bl EnablePaletteSync
	ldr r0, _080BA80C  @ gBG3TilemapBuffer
	movs r1, #0
	bl BG_Fill
	movs r0, #8
	bl BG_EnableSyncByMask
	ldr r0, [r6, #0x3c]
	ldr r1, [r6, #0x40]
	ldr r2, [r6, #0x44]
	ldr r3, _080BA810  @ gUnknown_03001DA8
	ldr r4, _080BA814  @ gUnknown_03001DE8
	str r4, [sp]
	bl NewMapScreenVSynce
	str r0, [r6, #0x48]
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080BA7FC: .4byte gUnknown_08A83364
_080BA800: .4byte gUnknown_08A96064
_080BA804: .4byte gUnknown_020087A0
_080BA808: .4byte gUnknown_08A95FE4
_080BA80C: .4byte gBG3TilemapBuffer
_080BA810: .4byte gUnknown_03001DA8
_080BA814: .4byte gUnknown_03001DE8

	THUMB_FUNC_END MapScreen_Init

	THUMB_FUNC_START sub_80BA818
sub_80BA818: @ 0x080BA818
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	mov sl, r0
	mov r8, r1
	adds r6, r2, #0
	mov r0, r8
	movs r1, #0x3c
	bl __modsi3
	adds r7, r0, #0
	adds r0, r6, #0
	movs r1, #0x28
	bl __modsi3
	mov r9, r0
	adds r0, r7, #0
	adds r0, #0x20
	cmp r0, #0x20
	ble _080BA878
	movs r5, #0x20
	subs r4, r5, r7
	str r6, [sp]
	str r4, [sp, #4]
	movs r0, #0x16
	str r0, [sp, #8]
	mov r0, sl
	adds r1, r7, #0
	mov r2, r9
	mov r3, r8
	bl sub_80BA6DC
	adds r1, r7, r4
	mov r0, r8
	adds r3, r0, r4
	str r6, [sp]
	subs r5, r5, r4
	str r5, [sp, #4]
	movs r0, #0x16
	str r0, [sp, #8]
	mov r0, sl
	mov r2, r9
	bl sub_80BA6DC
	b _080BA88E
_080BA878:
	str r6, [sp]
	movs r0, #0x20
	str r0, [sp, #4]
	movs r0, #0x16
	str r0, [sp, #8]
	mov r0, sl
	adds r1, r7, #0
	mov r2, r9
	mov r3, r8
	bl sub_80BA6DC
_080BA88E:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80BA818

	THUMB_FUNC_START sub_80BA8A0
sub_80BA8A0: @ 0x080BA8A0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	adds r7, r0, #0
	adds r5, r7, #0
	adds r5, #0x2b
	adds r4, r7, #0
	adds r4, #0x2d
	movs r1, #0
	ldrsb r1, [r5, r1]
	movs r0, #0
	ldrsb r0, [r4, r0]
	cmp r1, r0
	beq _080BA9A6
	adds r0, r7, #0
	bl sub_80BA4D0
	movs r2, #0
	ldrsb r2, [r4, r2]
	movs r0, #0
	ldrsb r0, [r5, r0]
	subs r1, r2, r0
	cmp r1, #0
	blt _080BA8DC
	cmp r1, #1
	bgt _080BA8E2
	b _080BA90A
_080BA8DC:
	subs r0, r0, r2
	cmp r0, #1
	ble _080BA90A
_080BA8E2:
	ldr r0, [r7, #0x48]
	adds r4, r7, #0
	adds r4, #0x2d
	movs r1, #0
	ldrsb r1, [r4, r1]
	adds r5, r7, #0
	adds r5, #0x2e
	movs r2, #0
	ldrsb r2, [r5, r2]
	bl sub_80BA818
	ldrb r0, [r4]
	adds r1, r7, #0
	adds r1, #0x2b
	strb r0, [r1]
	ldrb r1, [r5]
	adds r0, r7, #0
	adds r0, #0x2c
	strb r1, [r0]
	b _080BAAEE
_080BA90A:
	adds r2, r7, #0
	adds r2, #0x2d
	adds r0, r7, #0
	adds r0, #0x2b
	movs r3, #0
	ldrsb r3, [r2, r3]
	movs r1, #0
	ldrsb r1, [r0, r1]
	mov sl, r0
	mov r8, r2
	cmp r3, r1
	ble _080BA938
	adds r0, r3, #0
	adds r0, #0x1e
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #0x3c
	bl __modsi3
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	b _080BA944
_080BA938:
	mov r1, r8
	movs r0, #0
	ldrsb r0, [r1, r0]
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	adds r4, r6, #0
_080BA944:
	adds r0, r7, #0
	adds r0, #0x2e
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #0x28
	bl __modsi3
	lsls r0, r0, #0x18
	asrs r0, r0, #8
	lsrs r5, r0, #0x10
	asrs r1, r0, #0x10
	adds r0, r1, #0
	adds r0, #0x15
	cmp r0, #0x27
	bgt _080BA96A
	movs r2, #0x15
	mov r9, r2
	b _080BA974
_080BA96A:
	movs r0, #0x28
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r9, r0
_080BA974:
	ldr r0, [r7, #0x48]
	lsls r1, r6, #0x10
	asrs r1, r1, #0x10
	lsls r2, r5, #0x10
	asrs r2, r2, #0x10
	lsls r3, r4, #0x10
	asrs r3, r3, #0x10
	adds r4, r7, #0
	adds r4, #0x2e
	ldrb r4, [r4]
	lsls r4, r4, #0x18
	asrs r4, r4, #0x18
	str r4, [sp]
	movs r4, #1
	str r4, [sp, #4]
	mov r5, r9
	lsls r4, r5, #0x10
	asrs r4, r4, #0x10
	str r4, [sp, #8]
	bl sub_80BA6DC
	mov r1, r8
	ldrb r0, [r1]
	mov r2, sl
	strb r0, [r2]
_080BA9A6:
	adds r2, r7, #0
	adds r2, #0x2c
	adds r0, r7, #0
	adds r0, #0x2e
	movs r3, #0
	ldrsb r3, [r2, r3]
	movs r1, #0
	ldrsb r1, [r0, r1]
	str r0, [sp, #0x10]
	str r2, [sp, #0xc]
	cmp r3, r1
	bne _080BA9C0
	b _080BAAEE
_080BA9C0:
	adds r0, r7, #0
	bl sub_80BA4D0
	ldr r3, [sp, #0x10]
	movs r2, #0
	ldrsb r2, [r3, r2]
	ldr r4, [sp, #0xc]
	movs r0, #0
	ldrsb r0, [r4, r0]
	subs r1, r2, r0
	cmp r1, #0
	blt _080BA9DE
	cmp r1, #1
	bgt _080BA9E4
	b _080BAA08
_080BA9DE:
	subs r0, r0, r2
	cmp r0, #1
	ble _080BAA08
_080BA9E4:
	ldr r0, [r7, #0x48]
	adds r4, r7, #0
	adds r4, #0x2d
	movs r1, #0
	ldrsb r1, [r4, r1]
	ldr r5, [sp, #0x10]
	movs r2, #0
	ldrsb r2, [r5, r2]
	bl sub_80BA818
	ldrb r1, [r4]
	adds r0, r7, #0
	adds r0, #0x2b
	strb r1, [r0]
	ldrb r0, [r5]
	ldr r1, [sp, #0xc]
	strb r0, [r1]
	b _080BAAEE
_080BAA08:
	ldr r2, [sp, #0x10]
	movs r1, #0
	ldrsb r1, [r2, r1]
	ldr r3, [sp, #0xc]
	movs r0, #0
	ldrsb r0, [r3, r0]
	cmp r1, r0
	ble _080BAA30
	adds r0, r1, #0
	adds r0, #0x14
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	mov r9, r4
	asrs r0, r0, #0x10
	movs r1, #0x28
	bl __modsi3
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	b _080BAA3C
_080BAA30:
	ldr r5, [sp, #0x10]
	movs r0, #0
	ldrsb r0, [r5, r0]
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	mov r9, r5
_080BAA3C:
	adds r0, r7, #0
	adds r0, #0x2d
	movs r1, #0
	ldrsb r1, [r0, r1]
	adds r0, r1, #0
	cmp r1, #0
	bge _080BAA4C
	adds r0, #0x1f
_080BAA4C:
	asrs r0, r0, #5
	lsls r0, r0, #5
	subs r0, r1, r0
	lsls r0, r0, #0x18
	asrs r0, r0, #8
	lsrs r4, r0, #0x10
	adds r0, r1, #0
	movs r1, #0x3c
	bl __modsi3
	lsls r0, r0, #0x18
	asrs r0, r0, #8
	lsrs r6, r0, #0x10
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	mov sl, r0
	cmp r0, #0
	bgt _080BAA92
	ldr r0, [r7, #0x48]
	lsls r1, r6, #0x10
	asrs r1, r1, #0x10
	lsls r2, r5, #0x10
	asrs r2, r2, #0x10
	mov r4, r9
	lsls r3, r4, #0x10
	asrs r3, r3, #0x10
	str r3, [sp]
	movs r3, #0x1f
	str r3, [sp, #4]
	movs r3, #1
	str r3, [sp, #8]
	mov r3, sl
	bl sub_80BA6DC
	b _080BAAE6
_080BAA92:
	movs r4, #0x20
	mov r0, sl
	subs r4, r4, r0
	ldr r0, [r7, #0x48]
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	lsls r5, r5, #0x10
	mov r8, r5
	mov r1, r8
	asrs r1, r1, #0x10
	mov r8, r1
	mov r2, r9
	lsls r5, r2, #0x10
	asrs r5, r5, #0x10
	str r5, [sp]
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	str r4, [sp, #4]
	movs r3, #1
	mov r9, r3
	str r3, [sp, #8]
	adds r1, r6, #0
	mov r2, r8
	mov r3, sl
	bl sub_80BA6DC
	movs r1, #0x1f
	subs r1, r1, r4
	ldr r0, [r7, #0x48]
	adds r6, r6, r4
	add r4, sl
	str r5, [sp]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	str r1, [sp, #4]
	mov r5, r9
	str r5, [sp, #8]
	adds r1, r6, #0
	mov r2, r8
	adds r3, r4, #0
	bl sub_80BA6DC
_080BAAE6:
	ldr r1, [sp, #0x10]
	ldrb r0, [r1]
	ldr r2, [sp, #0xc]
	strb r0, [r2]
_080BAAEE:
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80BA8A0

	THUMB_FUNC_START sub_80BAB00
sub_80BAB00: @ 0x080BAB00
	ldr r1, _080BAB08  @ gUnknown_03001E30
	movs r0, #0
	strb r0, [r1]
	bx lr
	.align 2, 0
_080BAB08: .4byte gUnknown_03001E30

	THUMB_FUNC_END sub_80BAB00

	THUMB_FUNC_START sub_80BAB0C
sub_80BAB0C: @ 0x080BAB0C
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r0, #0x29
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080BABE6
	ldr r0, _080BAB34  @ gGMData
	ldrh r1, [r0, #2]
	strh r1, [r4, #0x34]
	ldrh r0, [r0, #4]
	strh r0, [r4, #0x36]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	cmp r1, #0
	bge _080BAB38
	movs r0, #0
	b _080BAB3E
	.align 2, 0
_080BAB34: .4byte gGMData
_080BAB38:
	cmp r1, #0xf0
	ble _080BAB40
	movs r0, #0xf0
_080BAB3E:
	strh r0, [r4, #0x34]
_080BAB40:
	movs r1, #0x36
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bge _080BAB4C
	movs r0, #0
	strh r0, [r4, #0x36]
_080BAB4C:
	movs r1, #0x34
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bge _080BAB56
	adds r0, #7
_080BAB56:
	asrs r0, r0, #3
	adds r7, r4, #0
	adds r7, #0x2d
	strb r0, [r7]
	movs r1, #0x36
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bge _080BAB68
	adds r0, #7
_080BAB68:
	asrs r0, r0, #3
	adds r6, r4, #0
	adds r6, #0x2e
	strb r0, [r6]
	adds r5, r4, #0
	adds r5, #0x2a
	ldrb r1, [r5]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _080BAB92
	ldr r0, _080BABEC  @ gUnknown_08A95FE4
	movs r1, #0x90
	lsls r1, r1, #1
	movs r2, #0x80
	bl CopyToPaletteBuffer
	ldrb r1, [r5]
	movs r0, #0xfb
	ands r0, r1
	strb r0, [r5]
_080BAB92:
	ldrb r1, [r5]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080BABB2
	ldr r0, [r4, #0x48]
	movs r1, #0
	ldrsb r1, [r7, r1]
	movs r2, #0
	ldrsb r2, [r6, r2]
	bl sub_80BA818
	ldrb r1, [r5]
	movs r0, #0xfd
	ands r0, r1
	strb r0, [r5]
_080BABB2:
	ldrb r1, [r5]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080BABCE
	bl sub_80BA458
	adds r0, r4, #0
	bl sub_80BA4D0
	ldrb r1, [r5]
	movs r0, #0xfe
	ands r0, r1
	strb r0, [r5]
_080BABCE:
	adds r0, r4, #0
	bl sub_80BA8A0
	ldrh r1, [r4, #0x34]
	ldrh r2, [r4, #0x36]
	movs r0, #3
	bl BG_SetPosition
	ldrh r0, [r4, #0x34]
	strh r0, [r4, #0x38]
	ldrh r0, [r4, #0x36]
	strh r0, [r4, #0x3a]
_080BABE6:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BABEC: .4byte gUnknown_08A95FE4

	THUMB_FUNC_END sub_80BAB0C

	THUMB_FUNC_START NewMapScreen
NewMapScreen: @ 0x080BABF0
	push {r4, lr}
	adds r1, r0, #0
	ldr r0, _080BAC14  @ gUnknown_08A3DE84
	bl Proc_Start
	adds r4, r0, #0
	ldr r1, _080BAC18  @ gUnknown_03005324
	movs r2, #0xa0
	lsls r2, r2, #7
	movs r3, #0xe
	bl NewMapRoute
	str r0, [r4, #0x4c]
	adds r0, r4, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080BAC14: .4byte gUnknown_08A3DE84
_080BAC18: .4byte gUnknown_03005324

.equ gMMSDataTable, unit_icon_move_table

	THUMB_FUNC_END NewMapScreen

	THUMB_FUNC_START MMS_GetGfx
MMS_GetGfx: @ 0x080BAC1C
	lsls r0, r0, #0x10
	ldr r1, _080BAC2C  @ gMMSDataTable
	lsrs r0, r0, #0xd
	subs r0, #8
	adds r0, r0, r1
	ldr r0, [r0]
	bx lr
	.align 2, 0
_080BAC2C: .4byte gMMSDataTable

	THUMB_FUNC_END MMS_GetGfx

	THUMB_FUNC_START MMS_GetROMTCS2
MMS_GetROMTCS2: @ 0x080BAC30
	lsls r0, r0, #0x10
	ldr r1, _080BAC40  @ gMMSDataTable
	lsrs r0, r0, #0xd
	adds r1, r1, r0
	subs r1, #4
	ldr r0, [r1]
	bx lr
	.align 2, 0
_080BAC40: .4byte gMMSDataTable

	THUMB_FUNC_END MMS_GetROMTCS2

	THUMB_FUNC_START GetMapUnitMMSGfxBuffer
GetMapUnitMMSGfxBuffer: @ 0x080BAC44
	adds r1, r0, #0
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #9
	ldr r1, _080BAC54  @ gUnknown_0200AF00
	adds r0, r0, r1
	bx lr
	.align 2, 0
_080BAC54: .4byte gUnknown_0200AF00

	THUMB_FUNC_END GetMapUnitMMSGfxBuffer

	THUMB_FUNC_START GmapUnit_Destruct
GmapUnit_Destruct: @ 0x080BAC58
	push {lr}
	ldr r0, [r0, #0x40]
	bl AP_Delete
	pop {r0}
	bx r0

	THUMB_FUNC_END GmapUnit_Destruct

	THUMB_FUNC_START GmapUnit_Init
GmapUnit_Init: @ 0x080BAC64
	movs r2, #0
	strh r2, [r0, #0x2a]
	adds r3, r0, #0
	adds r3, #0x37
	movs r1, #4
	strb r1, [r3]
	strh r2, [r0, #0x3e]
	strh r2, [r0, #0x3c]
	bx lr

	THUMB_FUNC_END GmapUnit_Init

	THUMB_FUNC_START GmapUnit_Loop
GmapUnit_Loop: @ 0x080BAC78
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	sub sp, #0xc
	adds r7, r0, #0
	ldrh r1, [r7, #0x2a]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _080BAC90
	b _080BADC2
_080BAC90:
	ldr r0, _080BACAC  @ gGMData
	ldrb r1, [r0]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _080BACB0
	mov r4, sp
	adds r4, #0xa
	add r0, sp, #8
	adds r1, r4, #0
	bl GetWMDisplayPosition
	b _080BACC0
	.align 2, 0
_080BACAC: .4byte gGMData
_080BACB0:
	add r1, sp, #8
	ldr r2, [r7, #0x14]
	ldrh r0, [r2, #0x34]
	strh r0, [r1]
	adds r1, #2
	ldrh r0, [r2, #0x36]
	strh r0, [r1]
	adds r4, r1, #0
_080BACC0:
	add r1, sp, #8
	ldrh r0, [r7, #0x3c]
	ldrh r1, [r1]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	ldrh r0, [r7, #0x3e]
	ldrh r1, [r4]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	asrs r4, r0, #0x10
	movs r1, #0x80
	lsls r1, r1, #0xe
	adds r0, r0, r1
	lsrs r0, r0, #0x10
	cmp r0, #0xdf
	bhi _080BADC2
	lsls r0, r3, #0x10
	asrs r2, r0, #0x10
	movs r3, #0x80
	lsls r3, r3, #0xd
	adds r0, r0, r3
	ldr r1, _080BAD6C  @ 0x010F0000
	cmp r0, r1
	bhi _080BADC2
	ldr r0, _080BAD70  @ 0x000001FF
	mov r8, r0
	mov r1, r8
	ands r1, r2
	mov r8, r1
	mov r3, r8
	movs r2, #0xff
	mov r9, r2
	mov r0, r9
	ands r0, r4
	mov r9, r0
	adds r0, r7, #0
	adds r0, #0x37
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #4
	bne _080BAD7C
	ldr r6, _080BAD74  @ gUnknown_08205F7C
	adds r5, r7, #0
	adds r5, #0x34
	movs r0, #0
	ldrsb r0, [r5, r0]
	adds r0, r0, r6
	ldrb r0, [r0]
	ldr r1, [r7, #0x30]
	lsls r1, r1, #5
	ldr r2, _080BAD78  @ 0x06010000
	adds r1, r1, r2
	bl sub_80270DC
	adds r0, r7, #0
	adds r0, #0x36
	ldrb r0, [r0]
	movs r1, #0xf
	ands r1, r0
	lsls r1, r1, #0xc
	ldr r4, [r7, #0x30]
	movs r0, #0
	ldrsb r0, [r5, r0]
	adds r0, r0, r6
	adds r4, r4, r1
	ldrb r0, [r0]
	adds r4, r4, r0
	ldrh r0, [r7, #0x2e]
	adds r4, r4, r0
	ldrh r0, [r7, #0x38]
	ldrh r1, [r7, #0x2c]
	mov r2, r8
	mov r3, r9
	str r4, [sp]
	ldrh r5, [r7, #0x2a]
	movs r4, #2
	ands r4, r5
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	str r4, [sp, #4]
	bl SMS_DisplayOne
	b _080BADC2
	.align 2, 0
_080BAD6C: .4byte 0x010F0000
_080BAD70: .4byte 0x000001FF
_080BAD74: .4byte gUnknown_08205F7C
_080BAD78: .4byte 0x06010000
_080BAD7C:
	ldrh r2, [r7, #0x2a]
	movs r0, #2
	ands r0, r2
	cmp r0, #0
	beq _080BAD9A
	movs r4, #0x80
	lsls r4, r4, #3
	adds r1, r4, #0
	mov r4, r9
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	orrs r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r9, r0
_080BAD9A:
	movs r0, #4
	ands r0, r2
	cmp r0, #0
	beq _080BADB2
	ldr r0, [r7, #0x40]
	adds r0, #0x20
	movs r1, #1
	strb r1, [r0]
	ldrh r1, [r7, #0x2a]
	ldr r0, _080BADD0  @ 0x0000FFFB
	ands r0, r1
	strh r0, [r7, #0x2a]
_080BADB2:
	ldr r0, [r7, #0x40]
	lsls r1, r3, #0x10
	asrs r1, r1, #0x10
	mov r3, r9
	lsls r2, r3, #0x10
	asrs r2, r2, #0x10
	bl AP_Update
_080BADC2:
	add sp, #0xc
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BADD0: .4byte 0x0000FFFB

	THUMB_FUNC_END GmapUnit_Loop

	THUMB_FUNC_START GetPaletteIdForAllegience
GetPaletteIdForAllegience: @ 0x080BADD4
	push {lr}
	cmp r0, #1
	beq _080BADE6
	cmp r0, #1
	ble _080BADE2
	cmp r0, #2
	beq _080BADEA
_080BADE2:
	movs r0, #0xc
	b _080BADEC
_080BADE6:
	movs r0, #0xd
	b _080BADEC
_080BADEA:
	movs r0, #0xe
_080BADEC:
	pop {r1}
	bx r1

	THUMB_FUNC_END GetPaletteIdForAllegience

	THUMB_FUNC_START NewMapUnit
NewMapUnit: @ 0x080BADF0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	mov r9, r0
	adds r4, r2, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov r8, r1
	movs r7, #0
	ldr r0, [r0, #0x34]
	cmp r0, #0
	beq _080BAE1E
	mov r1, r9
	adds r1, #0x34
_080BAE10:
	adds r1, #4
	adds r7, #1
	cmp r7, #6
	bgt _080BAE1E
	ldr r0, [r1]
	cmp r0, #0
	bne _080BAE10
_080BAE1E:
	cmp r7, #7
	bne _080BAE28
	movs r0, #1
	negs r0, r0
	b _080BAEFA
_080BAE28:
	mov r0, r9
	ldr r1, [r0, #0x14]
	ldr r0, _080BAE40  @ gUnknown_08A3DECC
	bl Proc_Start
	adds r5, r0, #0
	cmp r5, #0
	bne _080BAE44
	movs r0, #2
	negs r0, r0
	b _080BAEFA
	.align 2, 0
_080BAE40: .4byte gUnknown_08A3DECC
_080BAE44:
	movs r0, #0x80
	lsls r0, r0, #4
	strh r0, [r5, #0x2e]
	adds r0, r5, #0
	adds r0, #0x35
	strb r4, [r0]
	ldrb r0, [r0]
	bl GetPaletteIdForAllegience
	movs r1, #0x36
	adds r1, r1, r5
	mov sl, r1
	strb r0, [r1]
	adds r4, r5, #0
	adds r4, #0x34
	strb r7, [r4]
	mov r0, r8
	strh r0, [r5, #0x38]
	strh r0, [r5, #0x3a]
	mov r0, r8
	bl GetClassSMSId
	movs r1, #0
	ldrsb r1, [r4, r1]
	ldr r2, _080BAEEC  @ gUnknown_08205F7C
	adds r2, r1, r2
	ldrb r2, [r2]
	bl SMS_SomethingGmapUnit
	movs r0, #8
	strh r0, [r5, #0x2c]
	mov r0, r8
	bl MMS_GetROMTCS2
	movs r1, #8
	bl AP_Create
	adds r6, r0, #0
	cmp r6, #0
	beq _080BAEF0
	adds r0, r5, #0
	adds r0, #0x37
	movs r1, #0
	ldrsb r1, [r0, r1]
	adds r0, r6, #0
	bl AP_SwitchAnimation
	mov r0, r8
	bl MMS_GetGfx
	adds r4, r0, #0
	adds r0, r7, #0
	bl GetMapUnitMMSGfxBuffer
	adds r1, r0, #0
	adds r0, r4, #0
	bl Decompress
	adds r0, r7, #0
	bl GetMapUnitMMSGfxBuffer
	str r0, [r6, #0x24]
	mov r1, r9
	ldr r0, [r1, #0x2c]
	str r0, [r5, #0x30]
	lsls r3, r7, #2
	ldr r1, [r1, #0x2c]
	adds r1, r1, r3
	mov r0, sl
	ldrb r2, [r0]
	movs r0, #0xf
	ands r0, r2
	lsls r0, r0, #0xc
	adds r1, r1, r0
	ldrh r0, [r5, #0x2e]
	adds r1, r1, r0
	strh r1, [r6, #0x22]
	str r6, [r5, #0x40]
	mov r0, r9
	adds r0, #0x34
	adds r0, r0, r3
	str r5, [r0]
	adds r0, r7, #0
	b _080BAEFA
	.align 2, 0
_080BAEEC: .4byte gUnknown_08205F7C
_080BAEF0:
	ldr r0, _080BAF08  @ gUnknown_08A3DECC
	bl Proc_End
	movs r0, #3
	negs r0, r0
_080BAEFA:
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080BAF08: .4byte gUnknown_08A3DECC

	THUMB_FUNC_END NewMapUnit

	THUMB_FUNC_START MapUnitC_DeleteGmapUnit
MapUnitC_DeleteGmapUnit: @ 0x080BAF0C
	push {r4, r5, r6, lr}
	lsls r1, r1, #2
	adds r0, #0x34
	adds r6, r0, r1
	ldr r5, [r6]
	cmp r5, #0
	beq _080BAF2C
	ldr r0, [r5, #0x40]
	bl AP_Delete
	movs r4, #0
	str r4, [r5, #0x40]
	adds r0, r5, #0
	bl Proc_End
	str r4, [r6]
_080BAF2C:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END MapUnitC_DeleteGmapUnit

	THUMB_FUNC_START MapUnitC_SetPosition
MapUnitC_SetPosition: @ 0x080BAF34
	lsls r1, r1, #2
	adds r0, #0x34
	adds r0, r0, r1
	ldr r0, [r0]
	strh r2, [r0, #0x3c]
	strh r3, [r0, #0x3e]
	bx lr

	THUMB_FUNC_END MapUnitC_SetPosition

	THUMB_FUNC_START sub_80BAF44
sub_80BAF44: @ 0x080BAF44
	lsls r1, r1, #2
	adds r0, #0x34
	adds r0, r0, r1
	ldr r1, [r0]
	ldrh r0, [r1, #0x3c]
	strh r0, [r2]
	ldrh r0, [r1, #0x3e]
	strh r0, [r3]
	bx lr

	THUMB_FUNC_END sub_80BAF44

	THUMB_FUNC_START sub_80BAF58
sub_80BAF58: @ 0x080BAF58
	lsls r1, r1, #2
	adds r0, #0x34
	adds r0, r0, r1
	ldr r1, [r0]
	ldrh r0, [r1, #0x3c]
	adds r0, r0, r2
	strh r0, [r1, #0x3c]
	ldrh r0, [r1, #0x3e]
	adds r0, r0, r3
	strh r0, [r1, #0x3e]
	bx lr

	THUMB_FUNC_END sub_80BAF58

	THUMB_FUNC_START sub_80BAF70
sub_80BAF70: @ 0x080BAF70
	lsls r1, r1, #2
	adds r0, #0x34
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, #0x37
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bx lr

	THUMB_FUNC_END sub_80BAF70

	THUMB_FUNC_START MapUnitC_SetTCSAnim
MapUnitC_SetTCSAnim: @ 0x080BAF84
	push {lr}
	lsls r1, r1, #2
	adds r0, #0x34
	adds r0, r0, r1
	ldr r0, [r0]
	adds r1, r0, #0
	adds r1, #0x37
	strb r2, [r1]
	ldr r0, [r0, #0x40]
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl AP_SwitchAnimation
	pop {r0}
	bx r0

	THUMB_FUNC_END MapUnitC_SetTCSAnim

	THUMB_FUNC_START sub_80BAFA4
sub_80BAFA4: @ 0x080BAFA4
	push {lr}
	lsls r1, r1, #2
	adds r0, #0x34
	adds r0, r0, r1
	ldr r3, [r0]
	lsls r2, r2, #0x18
	cmp r2, #0
	beq _080BAFBC
	ldrh r1, [r3, #0x2a]
	movs r0, #1
	orrs r0, r1
	b _080BAFC2
_080BAFBC:
	ldrh r1, [r3, #0x2a]
	ldr r0, _080BAFC8  @ 0x0000FFFE
	ands r0, r1
_080BAFC2:
	strh r0, [r3, #0x2a]
	pop {r0}
	bx r0
	.align 2, 0
_080BAFC8: .4byte 0x0000FFFE

	THUMB_FUNC_END sub_80BAFA4

	THUMB_FUNC_START sub_80BAFCC
sub_80BAFCC: @ 0x080BAFCC
	lsls r1, r1, #2
	adds r0, #0x34
	adds r0, r0, r1
	ldr r0, [r0]
	ldrh r1, [r0, #0x2a]
	movs r0, #2
	ands r0, r1
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bx lr

	THUMB_FUNC_END sub_80BAFCC

	THUMB_FUNC_START sub_80BAFE0
sub_80BAFE0: @ 0x080BAFE0
	push {lr}
	lsls r1, r1, #2
	adds r0, #0x34
	adds r0, r0, r1
	ldr r3, [r0]
	lsls r2, r2, #0x18
	cmp r2, #0
	beq _080BAFF8
	ldrh r1, [r3, #0x2a]
	movs r0, #2
	orrs r0, r1
	b _080BAFFE
_080BAFF8:
	ldrh r1, [r3, #0x2a]
	ldr r0, _080BB004  @ 0x0000FFFD
	ands r0, r1
_080BAFFE:
	strh r0, [r3, #0x2a]
	pop {r0}
	bx r0
	.align 2, 0
_080BB004: .4byte 0x0000FFFD

	THUMB_FUNC_END sub_80BAFE0

	THUMB_FUNC_START sub_80BB008
sub_80BB008: @ 0x080BB008
	lsls r1, r1, #2
	adds r0, #0x34
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r0, [r0, #0x40]
	ldrh r0, [r0, #0x1e]
	bx lr

	THUMB_FUNC_END sub_80BB008

	THUMB_FUNC_START MapUnitC_SetTCSOAMIndex
MapUnitC_SetTCSOAMIndex: @ 0x080BB018
	lsls r1, r1, #2
	adds r0, #0x34
	adds r0, r0, r1
	ldr r1, [r0]
	ldr r0, [r1, #0x40]
	strh r2, [r0, #0x1e]
	strh r2, [r1, #0x2c]
	bx lr

	THUMB_FUNC_END MapUnitC_SetTCSOAMIndex

	THUMB_FUNC_START sub_80BB028
sub_80BB028: @ 0x080BB028
	lsls r1, r1, #2
	adds r0, #0x34
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, #0x35
	ldrb r0, [r0]
	bx lr

	THUMB_FUNC_END sub_80BB028

	THUMB_FUNC_START MapUnitC_SetAllegienceColorIndex
MapUnitC_SetAllegienceColorIndex: @ 0x080BB038
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	lsls r5, r1, #2
	adds r0, #0x34
	adds r0, r0, r5
	ldr r4, [r0]
	cmp r2, #0
	blt _080BB04E
	adds r0, r4, #0
	adds r0, #0x35
	strb r2, [r0]
_080BB04E:
	adds r0, r4, #0
	adds r0, #0x35
	ldrb r0, [r0]
	bl GetPaletteIdForAllegience
	adds r1, r4, #0
	adds r1, #0x36
	strb r0, [r1]
	ldr r3, [r4, #0x40]
	ldr r2, [r6, #0x2c]
	adds r2, r2, r5
	movs r1, #0xf
	ands r1, r0
	lsls r1, r1, #0xc
	adds r2, r2, r1
	ldrh r4, [r4, #0x2e]
	adds r2, r2, r4
	strh r2, [r3, #0x22]
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END MapUnitC_SetAllegienceColorIndex

	THUMB_FUNC_START sub_80BB078
sub_80BB078: @ 0x080BB078
	push {r4, r5, lr}
	lsls r1, r1, #2
	adds r3, r0, #0
	adds r3, #0x34
	adds r3, r3, r1
	ldr r4, [r3]
	adds r3, r4, #0
	adds r3, #0x36
	strb r2, [r3]
	ldr r5, [r4, #0x40]
	ldr r3, [r0, #0x2c]
	adds r3, r3, r1
	movs r0, #0xf
	ands r0, r2
	lsls r0, r0, #0xc
	adds r3, r3, r0
	ldrh r4, [r4, #0x2e]
	adds r3, r3, r4
	strh r3, [r5, #0x22]
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80BB078

	THUMB_FUNC_START MapUnitC_MarkSomething
MapUnitC_MarkSomething: @ 0x080BB0A4
	push {r4, r5, lr}
	cmp r1, #0
	blt _080BB0BC
	lsls r1, r1, #2
	adds r0, #0x34
	adds r0, r0, r1
	ldr r2, [r0]
	ldrh r1, [r2, #0x2a]
	movs r0, #4
	orrs r0, r1
	strh r0, [r2, #0x2a]
	b _080BB0D8
_080BB0BC:
	movs r4, #4
	adds r1, r0, #0
	adds r1, #0x34
	movs r3, #6
_080BB0C4:
	ldr r2, [r1]
	cmp r2, #0
	beq _080BB0D0
	ldrh r0, [r2, #0x2a]
	orrs r0, r4
	strh r0, [r2, #0x2a]
_080BB0D0:
	adds r1, #4
	subs r3, #1
	cmp r3, #0
	bge _080BB0C4
_080BB0D8:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END MapUnitC_MarkSomething

	THUMB_FUNC_START sub_80BB0E0
sub_80BB0E0: @ 0x080BB0E0
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	mov r8, r0
	adds r7, r1, #0
	adds r4, r2, #0
	lsls r0, r7, #2
	mov r9, r0
	mov r0, r8
	adds r0, #0x34
	add r0, r9
	ldr r5, [r0]
	ldr r0, [r5, #0x40]
	cmp r0, #0
	beq _080BB104
	bl AP_Delete
_080BB104:
	adds r2, r4, #0
	cmp r2, #0
	bne _080BB10C
	ldrh r2, [r5, #0x38]
_080BB10C:
	ldrh r1, [r5, #0x3a]
	cmp r2, r1
	beq _080BB17A
	strh r2, [r5, #0x3a]
	lsls r0, r2, #0x10
	lsrs r4, r0, #0x10
	adds r0, r4, #0
	bl MMS_GetROMTCS2
	movs r1, #8
	bl AP_Create
	adds r6, r0, #0
	cmp r6, #0
	bne _080BB12E
	movs r0, #0
	b _080BB17C
_080BB12E:
	adds r0, r5, #0
	adds r0, #0x37
	movs r1, #0
	ldrsb r1, [r0, r1]
	adds r0, r6, #0
	bl AP_SwitchAnimation
	adds r0, r4, #0
	bl MMS_GetGfx
	adds r4, r0, #0
	adds r0, r7, #0
	bl GetMapUnitMMSGfxBuffer
	adds r1, r0, #0
	adds r0, r4, #0
	bl Decompress
	adds r0, r7, #0
	bl GetMapUnitMMSGfxBuffer
	str r0, [r6, #0x24]
	mov r1, r8
	ldr r0, [r1, #0x2c]
	str r0, [r5, #0x30]
	ldr r1, [r1, #0x2c]
	add r1, r9
	adds r0, r5, #0
	adds r0, #0x36
	ldrb r2, [r0]
	movs r0, #0xf
	ands r0, r2
	lsls r0, r0, #0xc
	adds r1, r1, r0
	ldrh r0, [r5, #0x2e]
	adds r1, r1, r0
	strh r1, [r6, #0x22]
	str r6, [r5, #0x40]
_080BB17A:
	movs r0, #1
_080BB17C:
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80BB0E0

	THUMB_FUNC_START sub_80BB188
sub_80BB188: @ 0x080BB188
	lsls r1, r1, #2
	adds r0, #0x34
	adds r0, r0, r1
	ldr r0, [r0]
	ldrh r0, [r0, #0x38]
	bx lr

	THUMB_FUNC_END sub_80BB188

	THUMB_FUNC_START sub_80BB194
sub_80BB194: @ 0x080BB194
	lsls r1, r1, #2
	adds r0, #0x34
	adds r0, r0, r1
	ldr r0, [r0]
	ldrh r0, [r0, #0x3a]
	bx lr

	THUMB_FUNC_END sub_80BB194

	THUMB_FUNC_START GmapUnitContainer_Destruct
GmapUnitContainer_Destruct: @ 0x080BB1A0
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r4, #0x34
	adds r6, r4, #0
	movs r7, #0
	movs r5, #6
_080BB1AC:
	cmp r6, #0
	beq _080BB1B8
	ldr r0, [r4]
	bl Proc_End
	str r7, [r4]
_080BB1B8:
	adds r4, #4
	subs r5, #1
	cmp r5, #0
	bge _080BB1AC
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END GmapUnitContainer_Destruct

	THUMB_FUNC_START GmapUnitContainer_Init
GmapUnitContainer_Init: @ 0x080BB1C8
	push {lr}
	sub sp, #4
	adds r1, r0, #0
	movs r0, #0
	str r0, [sp]
	adds r1, #0x34
	ldr r2, _080BB1E4  @ 0x05000007
	mov r0, sp
	bl CpuSet
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_080BB1E4: .4byte 0x05000007

	THUMB_FUNC_END GmapUnitContainer_Init

	THUMB_FUNC_START NewGmapUnitContainer
NewGmapUnitContainer: @ 0x080BB1E8
	push {r4, r5, lr}
	adds r3, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	ldr r0, _080BB208  @ gUnknown_08A3DEFC
	adds r1, r3, #0
	bl Proc_Start
	str r4, [r0, #0x2c]
	adds r1, r0, #0
	adds r1, #0x30
	strb r5, [r1]
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080BB208: .4byte gUnknown_08A3DEFC

	THUMB_FUNC_END NewGmapUnitContainer

	THUMB_FUNC_START GmapUnitFade_Destruct
GmapUnitFade_Destruct: @ 0x080BB20C
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	movs r6, #0
	b _080BB250
_080BB214:
	adds r0, r5, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r4, r5, #0
	adds r4, #0x30
	cmp r0, #0
	bge _080BB238
	ldr r0, _080BB260  @ gUnknown_08A3D748
	bl Proc_Find
	ldr r0, [r0, #0x4c]
	adds r1, r4, r6
	ldrb r1, [r1]
	movs r2, #0
	bl sub_80BAFA4
_080BB238:
	ldr r0, _080BB260  @ gUnknown_08A3D748
	bl Proc_Find
	ldr r0, [r0, #0x4c]
	adds r1, r4, r6
	ldrb r1, [r1]
	movs r2, #1
	negs r2, r2
	bl MapUnitC_SetAllegienceColorIndex
	adds r6, #1
	adds r0, r5, #0
_080BB250:
	adds r0, #0x37
	ldrb r0, [r0]
	cmp r6, r0
	blt _080BB214
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080BB260: .4byte gUnknown_08A3D748

	THUMB_FUNC_END GmapUnitFade_Destruct

	THUMB_FUNC_START GmapUnitFade_Init
GmapUnitFade_Init: @ 0x080BB264
	movs r1, #0
	strh r1, [r0, #0x2e]
	bx lr

	THUMB_FUNC_END GmapUnitFade_Init

	THUMB_FUNC_START sub_80BB26C
sub_80BB26C: @ 0x080BB26C
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r4, r2, #0
	adds r5, r3, #0
	cmp r0, #0
	blt _080BB2B0
	ldr r2, _080BB2AC  @ gPaletteBuffer
	lsls r0, r0, #4
	movs r3, #0x80
	lsls r3, r3, #1
	adds r1, r1, r3
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r1, [r0]
	movs r3, #0x1f
	ands r3, r1
	movs r0, #0xf8
	lsls r0, r0, #2
	ands r0, r1
	lsrs r0, r0, #5
	mov r8, r0
	movs r0, #0xf8
	lsls r0, r0, #7
	ands r1, r0
	lsrs r1, r1, #0xa
	mov r9, r1
	b _080BB2B8
	.align 2, 0
_080BB2AC: .4byte gPaletteBuffer
_080BB2B0:
	movs r0, #0
	mov r9, r0
	mov r8, r0
	movs r3, #0
_080BB2B8:
	cmp r4, #0
	blt _080BB2E8
	ldr r2, _080BB2E4  @ gPaletteBuffer
	lsls r0, r4, #4
	movs r4, #0x80
	lsls r4, r4, #1
	adds r1, r5, r4
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r1, [r0]
	movs r2, #0x1f
	ands r2, r1
	movs r0, #0xf8
	lsls r0, r0, #2
	ands r0, r1
	lsrs r4, r0, #5
	movs r0, #0xf8
	lsls r0, r0, #7
	ands r1, r0
	lsrs r7, r1, #0xa
	b _080BB2EE
	.align 2, 0
_080BB2E4: .4byte gPaletteBuffer
_080BB2E8:
	movs r7, #0
	movs r4, #0
	movs r2, #0
_080BB2EE:
	movs r5, #0x80
	lsls r5, r5, #5
	subs r0, r2, r3
	ldr r2, [sp, #0x20]
	adds r1, r0, #0
	muls r1, r2, r1
	adds r0, r5, #0
	str r3, [sp]
	bl DivArm
	adds r6, r0, #0
	ldr r3, [sp]
	adds r6, r3, r6
	mov r3, r8
	subs r0, r4, r3
	ldr r4, [sp, #0x20]
	adds r1, r0, #0
	muls r1, r4, r1
	adds r0, r5, #0
	bl DivArm
	adds r4, r0, #0
	add r4, r8
	mov r1, r9
	subs r0, r7, r1
	ldr r2, [sp, #0x20]
	adds r1, r0, #0
	muls r1, r2, r1
	adds r0, r5, #0
	bl DivArm
	add r0, r9
	lsls r0, r0, #0xa
	lsls r4, r4, #5
	adds r0, r0, r4
	adds r0, r0, r6
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80BB26C

	THUMB_FUNC_START GmapUnitFade_Loop
GmapUnitFade_Loop: @ 0x080BB348
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	adds r5, r0, #0
	ldrh r0, [r5, #0x2e]
	adds r0, #1
	strh r0, [r5, #0x2e]
	ldr r6, _080BB398  @ gUnknown_02022BE8
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r1, [r5, #0x2c]
	cmp r0, r1
	bcs _080BB39C
	ldrh r0, [r5, #0x2e]
	ldrh r1, [r5, #0x2c]
	movs r2, #0
	bl sub_800B7E0
	mov r8, r0
	movs r4, #0
	adds r7, r5, #0
	adds r7, #0x29
	adds r5, #0x2a
_080BB378:
	movs r0, #0
	ldrsb r0, [r7, r0]
	movs r2, #0
	ldrsb r2, [r5, r2]
	mov r1, r8
	str r1, [sp]
	adds r1, r4, #0
	adds r3, r4, #0
	bl sub_80BB26C
	strh r0, [r6]
	adds r6, #2
	adds r4, #1
	cmp r4, #0xf
	ble _080BB378
	b _080BB3D4
	.align 2, 0
_080BB398: .4byte gUnknown_02022BE8
_080BB39C:
	adds r1, r5, #0
	adds r1, #0x2a
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	blt _080BB3C0
	lsls r0, r0, #5
	ldr r2, _080BB3BC  @ 0xFFFFFEC0
	adds r1, r6, r2
	adds r0, r0, r1
	adds r1, r6, #0
	movs r2, #0x10
	bl CpuSet
	b _080BB3CE
	.align 2, 0
_080BB3BC: .4byte 0xFFFFFEC0
_080BB3C0:
	add r0, sp, #4
	movs r1, #0
	strh r1, [r0]
	ldr r2, _080BB3E4  @ 0x01000010
	adds r1, r6, #0
	bl CpuSet
_080BB3CE:
	adds r0, r5, #0
	bl Proc_Break
_080BB3D4:
	bl EnablePaletteSync
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BB3E4: .4byte 0x01000010

	THUMB_FUNC_END GmapUnitFade_Loop

	THUMB_FUNC_START sub_80BB3E8
sub_80BB3E8: @ 0x080BB3E8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	mov r8, r0
	adds r5, r1, #0
	adds r6, r2, #0
	adds r7, r3, #0
	ldr r1, [sp, #0x1c]
	cmp r1, #0
	beq _080BB40C
	ldr r0, _080BB408  @ gUnknown_08A3DF2C
	bl Proc_StartBlocking
	b _080BB414
	.align 2, 0
_080BB408: .4byte gUnknown_08A3DF2C
_080BB40C:
	ldr r0, _080BB43C  @ gUnknown_08A3DF2C
	movs r1, #3
	bl Proc_Start
_080BB414:
	adds r4, r0, #0
	adds r0, r4, #0
	adds r0, #0x29
	strb r5, [r0]
	adds r0, #1
	strb r6, [r0]
	strh r7, [r4, #0x2c]
	cmp r5, #0
	blt _080BB444
	lsls r0, r5, #5
	ldr r1, _080BB440  @ pPalette10Buffer
	adds r0, r0, r1
	movs r2, #0xa0
	lsls r2, r2, #1
	adds r1, r1, r2
	movs r2, #0x10
	bl CpuSet
	b _080BB454
	.align 2, 0
_080BB43C: .4byte gUnknown_08A3DF2C
_080BB440: .4byte pPalette10Buffer
_080BB444:
	mov r1, sp
	movs r0, #0
	strh r0, [r1]
	ldr r1, _080BB474  @ gUnknown_02022BE8
	ldr r2, _080BB478  @ 0x01000010
	mov r0, sp
	bl CpuSet
_080BB454:
	bl EnablePaletteSync
	adds r0, r4, #0
	adds r0, #0x30
	mov r1, r8
	strb r1, [r0]
	adds r1, r4, #0
	adds r1, #0x37
	movs r0, #1
	strb r0, [r1]
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080BB474: .4byte gUnknown_02022BE8
_080BB478: .4byte 0x01000010

	THUMB_FUNC_END sub_80BB3E8

	THUMB_FUNC_START sub_80BB47C
sub_80BB47C: @ 0x080BB47C
	push {lr}
	ldr r0, _080BB488  @ gUnknown_08A3DF2C
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
_080BB488: .4byte gUnknown_08A3DF2C

	THUMB_FUNC_END sub_80BB47C

	THUMB_FUNC_START sub_80BB48C
sub_80BB48C: @ 0x080BB48C
	push {lr}
	ldr r0, _080BB498  @ gUnknown_08A3DF2C
	bl Proc_Find
	pop {r1}
	bx r1
	.align 2, 0
_080BB498: .4byte gUnknown_08A3DF2C

	THUMB_FUNC_END sub_80BB48C

	THUMB_FUNC_START sub_80BB49C
sub_80BB49C: @ 0x080BB49C
	push {r4, lr}
	adds r4, r0, #0
	bl sub_80BB48C
	cmp r0, #0
	beq _080BB4BA
	adds r1, r0, #0
	adds r1, #0x37
	adds r0, #0x30
	ldrb r2, [r1]
	adds r0, r0, r2
	strb r4, [r0]
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
_080BB4BA:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80BB49C

	THUMB_FUNC_START sub_80BB4C0
sub_80BB4C0: @ 0x080BB4C0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r5, r0, #0
	mov r8, r1
	adds r7, r2, #0
	ldr r0, _080BB504  @ gUnknown_08A3D748
	bl Proc_Find
	ldr r6, [r0, #0x4c]
	lsls r1, r5, #2
	adds r0, r6, #0
	adds r0, #0x34
	adds r0, r0, r1
	ldr r4, [r0]
	bl sub_80BB48C
	cmp r0, #0
	bne _080BB508
	adds r0, r4, #0
	adds r0, #0x35
	ldrb r0, [r0]
	bl GetPaletteIdForAllegience
	adds r2, r0, #0
	movs r1, #1
	negs r1, r1
	str r7, [sp]
	adds r0, r5, #0
	mov r3, r8
	bl sub_80BB3E8
	b _080BB50E
	.align 2, 0
_080BB504: .4byte gUnknown_08A3D748
_080BB508:
	adds r0, r5, #0
	bl sub_80BB49C
_080BB50E:
	adds r0, r6, #0
	adds r1, r5, #0
	movs r2, #0xa
	bl sub_80BB078
	ldr r0, _080BB534  @ gUnknown_08A3D748
	bl Proc_Find
	ldr r0, [r0, #0x4c]
	adds r1, r5, #0
	movs r2, #1
	bl sub_80BAFA4
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BB534: .4byte gUnknown_08A3D748

	THUMB_FUNC_END sub_80BB4C0

	THUMB_FUNC_START sub_80BB538
sub_80BB538: @ 0x080BB538
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r5, r0, #0
	mov r8, r1
	adds r7, r2, #0
	ldr r0, _080BB57C  @ gUnknown_08A3D748
	bl Proc_Find
	ldr r6, [r0, #0x4c]
	lsls r1, r5, #2
	adds r0, r6, #0
	adds r0, #0x34
	adds r0, r0, r1
	ldr r4, [r0]
	bl sub_80BB48C
	cmp r0, #0
	bne _080BB580
	adds r0, r4, #0
	adds r0, #0x35
	ldrb r0, [r0]
	bl GetPaletteIdForAllegience
	adds r1, r0, #0
	movs r2, #1
	negs r2, r2
	str r7, [sp]
	adds r0, r5, #0
	mov r3, r8
	bl sub_80BB3E8
	b _080BB586
	.align 2, 0
_080BB57C: .4byte gUnknown_08A3D748
_080BB580:
	adds r0, r5, #0
	bl sub_80BB49C
_080BB586:
	adds r0, r6, #0
	adds r1, r5, #0
	movs r2, #0xa
	bl sub_80BB078
	ldr r0, _080BB5AC  @ gUnknown_08A3D748
	bl Proc_Find
	ldr r0, [r0, #0x4c]
	adds r1, r5, #0
	movs r2, #1
	bl sub_80BAFA4
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BB5AC: .4byte gUnknown_08A3D748

	THUMB_FUNC_END sub_80BB538

	THUMB_FUNC_START WMLoc_GetChapterId
WMLoc_GetChapterId: @ 0x080BB5B0
	push {lr}
	adds r1, r0, #0
	ldr r0, _080BB5CC  @ gPlaySt
	ldrb r0, [r0, #0x1b]
	cmp r0, #2
	beq _080BB5C0
	cmp r0, #3
	beq _080BB5D4
_080BB5C0:
	lsls r0, r1, #5
	ldr r1, _080BB5D0  @ gUnknown_082060B0
	adds r0, r0, r1
	ldrb r0, [r0, #4]
	b _080BB5DC
	.align 2, 0
_080BB5CC: .4byte gPlaySt
_080BB5D0: .4byte gUnknown_082060B0
_080BB5D4:
	lsls r0, r1, #5
	ldr r1, _080BB5E0  @ gUnknown_082060B0
	adds r0, r0, r1
	ldrb r0, [r0, #5]
_080BB5DC:
	pop {r1}
	bx r1
	.align 2, 0
_080BB5E0: .4byte gUnknown_082060B0

	THUMB_FUNC_END WMLoc_GetChapterId

	THUMB_FUNC_START WMLoc_GetNextLocId
WMLoc_GetNextLocId: @ 0x080BB5E4
	push {r4, lr}
	lsls r0, r0, #5
	ldr r1, _080BB614  @ gUnknown_082060B0
	adds r4, r0, r1
	movs r1, #6
	ldrsh r0, [r4, r1]
	bl CheckFlag
	lsls r0, r0, #0x18
	adds r1, r4, #0
	adds r1, #8
	cmp r0, #0
	beq _080BB600
	adds r1, #2
_080BB600:
	ldr r0, _080BB618  @ gPlaySt
	ldrb r0, [r0, #0x1b]
	cmp r0, #2
	beq _080BB60C
	cmp r0, #3
	beq _080BB61C
_080BB60C:
	movs r0, #0
	ldrsb r0, [r1, r0]
	b _080BB620
	.align 2, 0
_080BB614: .4byte gUnknown_082060B0
_080BB618: .4byte gPlaySt
_080BB61C:
	movs r0, #1
	ldrsb r0, [r1, r0]
_080BB620:
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END WMLoc_GetNextLocId

	THUMB_FUNC_START sub_80BB628
sub_80BB628: @ 0x080BB628
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	str r1, [sp]
	str r2, [sp, #4]
	mov sl, r3
	movs r0, #0
	mov r9, r0
	ldr r1, _080BB66C  @ gUnknown_082060B0
	mov ip, r1
_080BB642:
	mov r2, r9
	lsls r0, r2, #2
	ldr r3, _080BB670  @ gGMData
	adds r0, r0, r3
	adds r0, #0x30
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080BB6D8
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080BB678
	mov r4, ip
	ldrb r0, [r4, #2]
	lsls r0, r0, #4
	ldr r6, _080BB674  @ gUnknown_08205FA0
	adds r0, r0, r6
	b _080BB682
	.align 2, 0
_080BB66C: .4byte gUnknown_082060B0
_080BB670: .4byte gGMData
_080BB674: .4byte gUnknown_08205FA0
_080BB678:
	mov r7, ip
	ldrb r0, [r7, #3]
	lsls r0, r0, #4
	ldr r1, _080BB6D4  @ gUnknown_08205FA0
	adds r0, r0, r1
_080BB682:
	mov r3, ip
	movs r4, #0x18
	ldrsh r2, [r3, r4]
	movs r6, #0xa
	ldrsb r6, [r0, r6]
	mov r8, r6
	movs r5, #8
	ldrsb r5, [r0, r5]
	subs r3, r2, r5
	mov r7, sl
	subs r3, r3, r7
	mov r4, ip
	movs r6, #0x1a
	ldrsh r1, [r4, r6]
	movs r6, #0xb
	ldrsb r6, [r0, r6]
	movs r4, #9
	ldrsb r4, [r0, r4]
	subs r0, r1, r4
	ldr r7, [sp, #0x2c]
	subs r0, r0, r7
	str r0, [sp, #8]
	add r2, r8
	subs r2, r2, r5
	add r2, sl
	adds r1, r1, r6
	subs r1, r1, r4
	adds r0, r1, r7
	ldr r1, [sp]
	cmp r1, r3
	blt _080BB6D8
	cmp r1, r2
	bge _080BB6D8
	ldr r2, [sp, #4]
	ldr r3, [sp, #8]
	cmp r2, r3
	blt _080BB6D8
	cmp r2, r0
	bge _080BB6D8
	mov r0, r9
	b _080BB6EA
	.align 2, 0
_080BB6D4: .4byte gUnknown_08205FA0
_080BB6D8:
	movs r4, #0x20
	add ip, r4
	movs r6, #1
	add r9, r6
	mov r7, r9
	cmp r7, #0x1c
	ble _080BB642
	movs r0, #1
	negs r0, r0
_080BB6EA:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80BB628

	THUMB_FUNC_START sub_80BB6FC
sub_80BB6FC: @ 0x080BB6FC
	adds r0, #0x32
	ldrb r1, [r0]
	movs r2, #1
	orrs r1, r2
	strb r1, [r0]
	bx lr

	THUMB_FUNC_END sub_80BB6FC

	THUMB_FUNC_START sub_80BB708
sub_80BB708: @ 0x080BB708
	adds r0, #0x32
	ldrb r2, [r0]
	movs r1, #2
	negs r1, r1
	ands r1, r2
	strb r1, [r0]
	bx lr

	THUMB_FUNC_END sub_80BB708

	THUMB_FUNC_START GmapScreen2_Destruct
GmapScreen2_Destruct: @ 0x080BB718
	push {lr}
	ldr r0, [r0, #0x38]
	bl AP_Delete
	pop {r0}
	bx r0

	THUMB_FUNC_END GmapScreen2_Destruct

	THUMB_FUNC_START GmapScreen2_Init
GmapScreen2_Init: @ 0x080BB724
	push {lr}
	movs r1, #0
	movs r3, #0
	adds r2, r0, #0
	adds r2, #0x34
_080BB72E:
	stm r2!, {r3}
	adds r1, #1
	cmp r1, #0
	beq _080BB72E
	adds r0, #0x32
	ldrb r1, [r0]
	movs r2, #1
	orrs r1, r2
	strb r1, [r0]
	pop {r0}
	bx r0

	THUMB_FUNC_END GmapScreen2_Init

	THUMB_FUNC_START sub_80BB744
sub_80BB744: @ 0x080BB744
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r3, #0
	ldr r5, [sp, #0x14]
	mov r4, sp
	ldrh r3, [r0, #0x34]
	strh r3, [r4]
	mov r3, sp
	adds r3, #2
	ldrh r4, [r0, #0x36]
	strh r4, [r3]
	mov r0, sp
	ldrh r0, [r0]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	subs r1, r1, r0
	strh r1, [r6]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	subs r2, r2, r4
	strh r2, [r5]
	adds r2, #0x20
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	cmp r2, #0xdf
	bhi _080BB78C
	ldrh r0, [r6]
	adds r0, #0x20
	lsls r0, r0, #0x10
	ldr r1, _080BB788  @ 0x012F0000
	cmp r0, r1
	bhi _080BB78C
	movs r0, #1
	b _080BB78E
	.align 2, 0
_080BB788: .4byte 0x012F0000
_080BB78C:
	movs r0, #0
_080BB78E:
	add sp, #4
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80BB744

	THUMB_FUNC_START GmapScreen2_Loop
GmapScreen2_Loop: @ 0x080BB798
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	mov r8, r0
	mov r2, r8
	adds r2, #0x32
	ldrb r1, [r2]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _080BB7B6
	b _080BB988
_080BB7B6:
	mov r1, r8
	ldr r0, [r1, #0x2c]
	lsrs r0, r0, #5
	mov sl, r0
	movs r7, #0
	str r2, [sp, #0xc]
	add r2, sp, #4
	mov r9, r2
_080BB7C6:
	ldr r0, _080BB7EC  @ gGMData
	lsls r1, r7, #2
	adds r1, r1, r0
	adds r1, #0x30
	ldrb r2, [r1]
	movs r0, #1
	ands r0, r2
	cmp r0, #0
	beq _080BB894
	lsls r1, r7, #5
	ldr r0, _080BB7F0  @ gUnknown_082060B0
	adds r6, r1, r0
	movs r0, #2
	ands r0, r2
	cmp r0, #0
	beq _080BB7F4
	ldrb r0, [r6, #2]
	b _080BB7F6
	.align 2, 0
_080BB7EC: .4byte gGMData
_080BB7F0: .4byte gUnknown_082060B0
_080BB7F4:
	ldrb r0, [r6, #3]
_080BB7F6:
	lsls r0, r0, #4
	ldr r1, _080BB8D0  @ gUnknown_08205FA0
	adds r5, r0, r1
	movs r0, #8
	ldrsb r0, [r5, r0]
	ldrh r1, [r6, #0x18]
	subs r1, r1, r0
	movs r0, #9
	ldrsb r0, [r5, r0]
	ldrh r2, [r6, #0x1a]
	subs r2, r2, r0
	mov r3, r8
	ldr r0, [r3, #0x3c]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	mov r4, sp
	adds r4, #6
	str r4, [sp]
	add r3, sp, #4
	bl sub_80BB744
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080BB894
	mov r1, r9
	ldrh r0, [r1]
	ldr r2, _080BB8D4  @ 0x000001FF
	adds r1, r2, #0
	ands r0, r1
	mov r3, r9
	strh r0, [r3]
	ldrb r3, [r4]
	strh r3, [r4]
	adds r0, r7, #0
	cmp r7, #0
	bge _080BB844
	adds r0, #0x1f
_080BB844:
	asrs r0, r0, #5
	lsls r0, r0, #2
	mov r2, r8
	adds r2, #0x34
	adds r2, r2, r0
	movs r0, #0x1f
	ands r0, r7
	movs r1, #1
	lsls r1, r0
	ldr r0, [r2]
	ands r0, r1
	cmp r0, #0
	beq _080BB868
	movs r1, #0x80
	lsls r1, r1, #3
	adds r0, r1, #0
	orrs r3, r0
	strh r3, [r4]
_080BB868:
	mov r2, r9
	movs r3, #0
	ldrsh r1, [r2, r3]
	movs r0, #0
	ldrsh r2, [r4, r0]
	ldr r3, [r5, #4]
	ldrh r4, [r5]
	add r4, sl
	mov r0, r8
	adds r0, #0x30
	ldrb r5, [r0]
	movs r0, #0xf
	ands r0, r5
	lsls r0, r0, #0xc
	adds r4, r4, r0
	movs r0, #0x80
	lsls r0, r0, #4
	adds r4, r4, r0
	str r4, [sp]
	movs r0, #0xc
	bl PutSpriteExt
_080BB894:
	adds r7, #1
	cmp r7, #0x1c
	ble _080BB7C6
	ldr r2, [sp, #0xc]
	ldrb r1, [r2]
	movs r4, #2
	adds r0, r4, #0
	ands r0, r1
	cmp r0, #0
	beq _080BB988
	mov r3, r8
	adds r3, #0x33
	ldrb r0, [r3]
	lsls r2, r0, #5
	ldr r1, _080BB8D8  @ gUnknown_082060B0
	adds r6, r2, r1
	ldr r2, _080BB8DC  @ gGMData
	lsls r0, r0, #2
	adds r0, r0, r2
	adds r0, #0x30
	ldrb r1, [r0]
	adds r0, r4, #0
	ands r0, r1
	mov r9, r2
	adds r7, r3, #0
	cmp r0, #0
	beq _080BB8E0
	ldrb r0, [r6, #2]
	b _080BB8E2
	.align 2, 0
_080BB8D0: .4byte gUnknown_08205FA0
_080BB8D4: .4byte 0x000001FF
_080BB8D8: .4byte gUnknown_082060B0
_080BB8DC: .4byte gGMData
_080BB8E0:
	ldrb r0, [r6, #3]
_080BB8E2:
	lsls r0, r0, #4
	ldr r1, _080BB998  @ gUnknown_08205FA0
	adds r5, r0, r1
	add r3, sp, #8
	mov r0, r8
	ldr r1, [r0, #0x3c]
	ldrh r0, [r1, #0x34]
	strh r0, [r3]
	mov r4, sp
	adds r4, #0xa
	ldrh r0, [r1, #0x36]
	strh r0, [r4]
	add r2, sp, #4
	movs r0, #8
	ldrsb r0, [r5, r0]
	ldrh r1, [r6, #0x18]
	subs r1, r1, r0
	movs r0, #0xc
	ldrsb r0, [r5, r0]
	adds r0, r0, r1
	ldrh r1, [r3]
	subs r0, r0, r1
	strh r0, [r2]
	adds r2, #2
	movs r0, #9
	ldrsb r0, [r5, r0]
	ldrh r1, [r6, #0x1a]
	subs r1, r1, r0
	movs r0, #0xd
	ldrsb r0, [r5, r0]
	adds r0, r0, r1
	ldrh r1, [r4]
	subs r0, r0, r1
	strh r0, [r2]
	adds r0, #0x20
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0xdf
	bhi _080BB988
	add r0, sp, #4
	ldrh r0, [r0]
	adds r0, #0x20
	lsls r0, r0, #0x10
	ldr r1, _080BB99C  @ 0x012F0000
	cmp r0, r1
	bhi _080BB988
	ldrb r0, [r7]
	lsls r0, r0, #2
	add r0, r9
	adds r0, #0x30
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	add r0, sp, #4
	ldrh r0, [r0]
	ldr r5, _080BB9A0  @ 0x000001FF
	ands r5, r0
	ldrb r4, [r2]
	ldrb r3, [r7]
	lsrs r0, r3, #5
	lsls r0, r0, #2
	mov r2, r8
	adds r2, #0x34
	adds r2, r2, r0
	movs r0, #0x1f
	ands r3, r0
	movs r1, #1
	lsls r1, r3
	ldr r0, [r2]
	ands r0, r1
	cmp r0, #0
	beq _080BB97A
	movs r1, #0x80
	lsls r1, r1, #3
	adds r0, r1, #0
	orrs r4, r0
_080BB97A:
	mov r2, r8
	ldr r0, [r2, #0x38]
	adds r1, r5, #0
	lsls r2, r4, #0x10
	asrs r2, r2, #0x10
	bl AP_Update
_080BB988:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BB998: .4byte gUnknown_08205FA0
_080BB99C: .4byte 0x012F0000
_080BB9A0: .4byte 0x000001FF

	THUMB_FUNC_END GmapScreen2_Loop

	THUMB_FUNC_START sub_80BB9A4
sub_80BB9A4: @ 0x080BB9A4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	mov r8, r3
	ldr r0, _080BBA20  @ gUnknown_08A3DF64
	adds r1, r4, #0
	bl Proc_Start
	adds r7, r0, #0
	str r5, [r7, #0x2c]
	adds r4, r7, #0
	adds r4, #0x30
	movs r2, #0
	strb r6, [r4]
	adds r0, #0x31
	mov r1, r8
	strb r1, [r0]
	ldr r0, [sp, #0x18]
	str r0, [r7, #0x3c]
	adds r3, r7, #0
	adds r3, #0x32
	ldrb r1, [r3]
	movs r0, #3
	negs r0, r0
	ands r0, r1
	strb r0, [r3]
	adds r0, r7, #0
	adds r0, #0x33
	strb r2, [r0]
	ldr r0, _080BBA24  @ gUnknown_08A97AEC
	movs r1, #0xb
	bl AP_Create
	str r0, [r7, #0x38]
	movs r1, #1
	bl AP_SwitchAnimation
	ldr r3, [r7, #0x38]
	ldr r1, [r7, #0x2c]
	movs r0, #0x80
	lsls r0, r0, #5
	adds r1, r1, r0
	lsrs r1, r1, #5
	ldrb r2, [r4]
	movs r0, #0xf
	ands r0, r2
	lsls r0, r0, #0xc
	adds r1, r1, r0
	movs r0, #0x80
	lsls r0, r0, #4
	adds r1, r1, r0
	strh r1, [r3, #0x22]
	adds r0, r7, #0
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080BBA20: .4byte gUnknown_08A3DF64
_080BBA24: .4byte gUnknown_08A97AEC

	THUMB_FUNC_END sub_80BB9A4

	THUMB_FUNC_START sub_80BBA28
sub_80BBA28: @ 0x080BBA28
	push {lr}
	cmp r0, #0x1c
	bls _080BBA38
	ldr r0, _080BBA34  @ 0x0000066D
	b _080BBA40
	.align 2, 0
_080BBA34: .4byte 0x0000066D
_080BBA38:
	lsls r0, r0, #5
	ldr r1, _080BBA48  @ gUnknown_082060B0
	adds r0, r0, r1
	ldrh r0, [r0, #0x1c]
_080BBA40:
	bl GetStringFromIndex
	pop {r1}
	bx r1
	.align 2, 0
_080BBA48: .4byte gUnknown_082060B0

	THUMB_FUNC_END sub_80BBA28

	THUMB_FUNC_START sub_80BBA4C
sub_80BBA4C: @ 0x080BBA4C
	push {lr}
	adds r3, r0, #0
	ldr r0, _080BBA60  @ gPlaySt
	ldrb r0, [r0, #0x1b]
	cmp r0, #2
	beq _080BBA5C
	cmp r0, #3
	beq _080BBA64
_080BBA5C:
	movs r2, #0
	b _080BBA66
	.align 2, 0
_080BBA60: .4byte gPlaySt
_080BBA64:
	movs r2, #1
_080BBA66:
	ldr r0, _080BBA7C  @ gUnknown_08206450
	lsls r1, r2, #3
	subs r1, r1, r2
	lsls r1, r1, #2
	adds r1, r1, r2
	adds r1, r3, r1
	adds r1, r1, r0
	ldrb r0, [r1]
	pop {r1}
	bx r1
	.align 2, 0
_080BBA7C: .4byte gUnknown_08206450

	THUMB_FUNC_END sub_80BBA4C

	THUMB_FUNC_START nullsub_59
nullsub_59: @ 0x080BBA80
	bx lr

	THUMB_FUNC_END nullsub_59

	THUMB_FUNC_START GmapCursor_Init
GmapCursor_Init: @ 0x080BBA84
	push {lr}
	adds r3, r0, #0
	adds r1, r3, #0
	adds r1, #0x31
	movs r0, #0
	strb r0, [r1]
	adds r1, #1
	strb r0, [r1]
	adds r1, #1
	strb r0, [r1]
	str r0, [r3, #0x3c]
	str r0, [r3, #0x38]
	str r0, [r3, #0x44]
	str r0, [r3, #0x40]
	adds r1, #0x15
	movs r2, #0
	movs r0, #0xc0
	lsls r0, r0, #2
	strh r0, [r1]
	adds r0, r3, #0
	adds r0, #0x34
	strb r2, [r0]
	subs r1, #0x13
	movs r0, #4
	strb r0, [r1]
	ldr r0, _080BBACC  @ gPaletteBuffer
	ldr r1, _080BBAD0  @ gUnknown_08A97ACC
	ldrh r1, [r1]
	movs r2, #0xa7
	lsls r2, r2, #2
	adds r0, r0, r2
	strh r1, [r0]
	bl EnablePaletteSync
	pop {r0}
	bx r0
	.align 2, 0
_080BBACC: .4byte gPaletteBuffer
_080BBAD0: .4byte gUnknown_08A97ACC

	THUMB_FUNC_END GmapCursor_Init

	THUMB_FUNC_START GmapCursor_Destruct
GmapCursor_Destruct: @ 0x080BBAD4
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r6, r0, #0
	ldr r0, _080BBBB4  @ gGMData
	ldrb r1, [r0, #1]
	adds r2, r6, #0
	adds r2, #0x32
	strb r1, [r2]
	ldr r7, [r0, #8]
	str r7, [r6, #0x38]
	ldr r0, [r0, #0xc]
	mov ip, r0
	str r0, [r6, #0x3c]
	movs r0, #0
	ldrsb r0, [r2, r0]
	cmp r0, #0
	ble _080BBBAA
	ldr r5, [r6, #0x2c]
	adds r0, r6, #0
	adds r0, #0x33
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r4, r0, #1
	adds r4, r4, r0
	lsls r4, r4, #2
	ldr r0, _080BBBB8  @ gUnknown_08206498
	adds r4, r4, r0
	add r2, sp, #4
	ldr r1, [r6, #0x4c]
	ldrh r0, [r1, #0x34]
	strh r0, [r2]
	mov r3, sp
	adds r3, #6
	ldrh r0, [r1, #0x36]
	strh r0, [r3]
	asrs r1, r7, #8
	adds r0, r2, #0
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r1, r1, r0
	movs r0, #8
	ldrsb r0, [r4, r0]
	subs r1, r1, r0
	mov r7, ip
	asrs r2, r7, #8
	movs r7, #0
	ldrsh r0, [r3, r7]
	subs r2, r2, r0
	movs r0, #9
	ldrsb r0, [r4, r0]
	subs r2, r2, r0
	ldr r3, [r4, #4]
	lsrs r5, r5, #5
	ldrh r4, [r4]
	adds r5, r5, r4
	adds r0, r6, #0
	adds r0, #0x30
	ldrb r4, [r0]
	movs r0, #0xf
	ands r0, r4
	lsls r0, r0, #0xc
	adds r5, r5, r0
	movs r0, #0x80
	lsls r0, r0, #4
	adds r5, r5, r0
	str r5, [sp]
	movs r0, #4
	bl PutSprite
	adds r4, r6, #0
	adds r4, #0x35
	ldrb r0, [r4]
	subs r0, #1
	strb r0, [r4]
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0
	bne _080BBBA2
	adds r1, r6, #0
	adds r1, #0x34
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xf
	bls _080BBB86
	strb r2, [r1]
_080BBB86:
	ldr r2, _080BBBBC  @ gPaletteBuffer
	ldrb r0, [r1]
	lsls r0, r0, #1
	ldr r1, _080BBBC0  @ gUnknown_08A97ACC
	adds r0, r0, r1
	ldrh r0, [r0]
	movs r1, #0xa7
	lsls r1, r1, #2
	adds r2, r2, r1
	strh r0, [r2]
	bl EnablePaletteSync
	movs r0, #4
	strb r0, [r4]
_080BBBA2:
	ldr r0, [r6, #0x38]
	str r0, [r6, #0x40]
	ldr r0, [r6, #0x3c]
	str r0, [r6, #0x44]
_080BBBAA:
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BBBB4: .4byte gGMData
_080BBBB8: .4byte gUnknown_08206498
_080BBBBC: .4byte gPaletteBuffer
_080BBBC0: .4byte gUnknown_08A97ACC

	THUMB_FUNC_END GmapCursor_Destruct

	THUMB_FUNC_START NewGmapCursor
NewGmapCursor: @ 0x080BBBC4
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	mov r8, r3
	ldr r0, _080BBBF0  @ gUnknown_08A3DF94
	adds r1, r4, #0
	bl Proc_Start
	str r5, [r0, #0x2c]
	adds r1, r0, #0
	adds r1, #0x30
	strb r6, [r1]
	mov r1, r8
	str r1, [r0, #0x4c]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_080BBBF0: .4byte gUnknown_08A3DF94

	THUMB_FUNC_END NewGmapCursor

	THUMB_FUNC_START sub_80BBBF4
sub_80BBBF4: @ 0x080BBBF4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	mov r8, r1
	mov ip, r2
	lsls r3, r3, #0x10
	lsrs r7, r3, #0x10
	b _080BBC44
_080BBC06:
	ldrb r0, [r4, #1]
	mov r1, ip
	muls r1, r0, r1
	adds r0, r1, #0
	ldrb r1, [r4]
	adds r0, r0, r1
	lsls r0, r0, #1
	mov r1, r8
	adds r3, r1, r0
	ldrb r5, [r4, #2]
	ldrb r6, [r4, #3]
	adds r2, r4, #4
	movs r0, #0
	cmp r0, r6
	bge _080BBC42
_080BBC24:
	adds r4, r0, #1
	cmp r5, #0
	beq _080BBC3C
	adds r1, r5, #0
_080BBC2C:
	ldrh r0, [r2]
	adds r0, r7, r0
	strh r0, [r3]
	adds r2, #2
	adds r3, #2
	subs r1, #1
	cmp r1, #0
	bne _080BBC2C
_080BBC3C:
	adds r0, r4, #0
	cmp r0, r6
	blt _080BBC24
_080BBC42:
	adds r4, r2, #0
_080BBC44:
	ldrb r0, [r4]
	cmp r0, #0xff
	bne _080BBC06
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80BBBF4

	THUMB_FUNC_START sub_80BBC54
sub_80BBC54: @ 0x080BBC54
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r1, [r5, #0x2c]
	lsrs r1, r1, #5
	adds r0, #0x30
	ldrb r0, [r0]
	lsls r0, r0, #0xc
	orrs r1, r0
	lsls r1, r1, #0x10
	lsrs r6, r1, #0x10
	mov r1, sp
	movs r0, #0
	strh r0, [r1]
	ldr r1, _080BBC80  @ gUnknown_02019D00
	ldr r2, _080BBC84  @ 0x01000960
	mov r0, sp
	bl CpuSet
	movs r4, #0
	b _080BBCA6
	.align 2, 0
_080BBC80: .4byte gUnknown_02019D00
_080BBC84: .4byte 0x01000960
_080BBC88:
	adds r0, r1, r4
	movs r1, #0
	ldrsb r1, [r0, r1]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _080BBCC0  @ gUnknown_08206674
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r1, _080BBCC4  @ gUnknown_02019D00
	movs r2, #0x3c
	adds r3, r6, #0
	bl sub_80BBBF4
	adds r4, #1
_080BBCA6:
	ldr r1, [r5, #0x40]
	adds r0, r1, #0
	adds r0, #0x20
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r4, r0
	blt _080BBC88
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080BBCC0: .4byte gUnknown_08206674
_080BBCC4: .4byte gUnknown_02019D00

	THUMB_FUNC_END sub_80BBC54

	THUMB_FUNC_START sub_80BBCC8
sub_80BBCC8: @ 0x080BBCC8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r5, r0, #0
	adds r4, r1, #0
	cmp r4, #0x12
	bgt _080BBCE6
	adds r0, r4, #0
	adds r0, #0x15
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	b _080BBCE8
_080BBCE6:
	movs r0, #0x28
_080BBCE8:
	mov r9, r0
	movs r0, #0x1f
	adds r7, r5, #0
	ands r7, r0
	movs r0, #0x20
	subs r0, r0, r7
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	adds r0, r2, #0
	bl BG_GetMapBuffer
	mov sl, r0
	lsls r0, r4, #4
	subs r0, r0, r4
	lsls r0, r0, #2
	adds r0, r0, r5
	lsls r0, r0, #1
	ldr r1, _080BBD44  @ gUnknown_02019D00
	adds r6, r0, r1
	mov r1, r8
	cmp r1, #0x1e
	bls _080BBD48
	lsls r0, r4, #0x10
	lsrs r5, r0, #0x10
	cmp r5, r9
	bcs _080BBD8E
_080BBD1E:
	movs r0, #0x1f
	ands r0, r5
	lsls r0, r0, #5
	adds r0, r0, r7
	lsls r0, r0, #1
	mov r3, sl
	adds r4, r3, r0
	adds r0, r6, #0
	adds r1, r4, #0
	movs r2, #0x1f
	bl CpuSet
	adds r6, #0x78
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, r9
	bcc _080BBD1E
	b _080BBD8E
	.align 2, 0
_080BBD44: .4byte gUnknown_02019D00
_080BBD48:
	lsls r0, r4, #0x10
	lsrs r5, r0, #0x10
	cmp r5, r9
	bcs _080BBD8E
	mov r1, r8
	movs r0, #0x1f
	subs r1, r0, r1
	str r1, [sp]
_080BBD58:
	adds r0, r5, #0
	movs r3, #0x1f
	ands r0, r3
	lsls r0, r0, #6
	mov r1, sl
	adds r4, r1, r0
	lsls r1, r7, #1
	adds r1, r4, r1
	adds r0, r6, #0
	mov r2, r8
	bl CpuSet
	mov r3, r8
	lsls r0, r3, #1
	adds r0, r6, r0
	adds r1, r4, #0
	ldr r2, [sp]
	ldr r3, _080BBDA0  @ 0x001FFFFF
	ands r2, r3
	bl CpuSet
	adds r6, #0x78
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, r9
	bcc _080BBD58
_080BBD8E:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BBDA0: .4byte 0x001FFFFF

	THUMB_FUNC_END sub_80BBCC8

	THUMB_FUNC_START sub_80BBDA4
sub_80BBDA4: @ 0x080BBDA4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	adds r6, r0, #0
	mov r8, r1
	adds r4, r2, #0
	mov r9, r3
	ldr r0, [sp, #0x20]
	bl BG_GetMapBuffer
	mov ip, r0
	cmp r6, r4
	beq _080BBE16
	cmp r6, r4
	ble _080BBDD4
	adds r0, r6, #0
	adds r0, #0x1e
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	mov r2, r8
	lsls r0, r2, #0x10
	b _080BBDDC
_080BBDD4:
	lsls r0, r6, #0x10
	lsrs r1, r0, #0x10
	mov r3, r8
	lsls r0, r3, #0x10
_080BBDDC:
	lsrs r2, r0, #0x10
	movs r7, #0x1f
	ands r7, r1
	lsls r0, r2, #4
	subs r0, r0, r2
	lsls r0, r0, #2
	adds r0, r0, r1
	lsls r0, r0, #1
	ldr r1, _080BBE2C  @ gUnknown_02019D00
	adds r5, r0, r1
	movs r1, #0
	movs r0, #0x1f
	mov sl, r0
_080BBDF6:
	adds r0, r2, r1
	mov r3, sl
	ands r0, r3
	lsls r0, r0, #5
	adds r0, r0, r7
	lsls r0, r0, #1
	mov r3, ip
	adds r4, r3, r0
	ldrh r0, [r5]
	strh r0, [r4]
	adds r5, #0x78
	adds r0, r1, #1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #0x14
	bls _080BBDF6
_080BBE16:
	cmp r8, r9
	beq _080BBEA0
	cmp r8, r9
	ble _080BBE30
	lsls r0, r6, #0x10
	lsrs r1, r0, #0x10
	mov r0, r8
	adds r0, #0x14
	lsls r0, r0, #0x10
	b _080BBE38
	.align 2, 0
_080BBE2C: .4byte gUnknown_02019D00
_080BBE30:
	lsls r0, r6, #0x10
	lsrs r1, r0, #0x10
	mov r2, r8
	lsls r0, r2, #0x10
_080BBE38:
	lsrs r2, r0, #0x10
	movs r3, #0x1f
	mov r8, r3
	adds r7, r1, #0
	ands r7, r3
	adds r3, r2, #0
	mov r0, r8
	ands r3, r0
	lsls r0, r2, #4
	subs r0, r0, r2
	lsls r0, r0, #2
	adds r0, r0, r1
	lsls r0, r0, #1
	ldr r1, _080BBE78  @ gUnknown_02019D00
	adds r5, r0, r1
	movs r0, #0x20
	subs r0, r0, r7
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	cmp r6, #0x1e
	bls _080BBE7C
	lsls r0, r3, #5
	adds r0, r0, r7
	lsls r0, r0, #1
	mov r1, ip
	adds r4, r1, r0
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #0x1f
	bl CpuSet
	b _080BBEA0
	.align 2, 0
_080BBE78: .4byte gUnknown_02019D00
_080BBE7C:
	lsls r0, r3, #6
	mov r2, ip
	adds r4, r2, r0
	lsls r1, r7, #1
	adds r1, r4, r1
	adds r0, r5, #0
	adds r2, r6, #0
	bl CpuSet
	lsls r0, r6, #1
	adds r0, r5, r0
	mov r3, r8
	subs r2, r3, r6
	ldr r1, _080BBEB0  @ 0x001FFFFF
	ands r2, r1
	adds r1, r4, #0
	bl CpuSet
_080BBEA0:
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BBEB0: .4byte 0x001FFFFF

	THUMB_FUNC_END sub_80BBDA4

	THUMB_FUNC_START nullsub_38
nullsub_38: @ 0x080BBEB4
	bx lr

	THUMB_FUNC_END nullsub_38

	THUMB_FUNC_START sub_80BBEB8
sub_80BBEB8: @ 0x080BBEB8
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r4, #0
	adds r5, #0x31
	movs r1, #0
	movs r0, #4
	strb r0, [r5]
	adds r0, r4, #0
	adds r0, #0x32
	strb r1, [r0]
	adds r1, r4, #0
	adds r1, #0x33
	movs r0, #0xff
	strb r0, [r1]
	adds r1, #1
	movs r0, #2
	strb r0, [r1]
	adds r1, #1
	movs r0, #1
	strb r0, [r1]
	bl BG_GetPriority
	adds r1, r4, #0
	adds r1, #0x3a
	strb r0, [r1]
	subs r1, #4
	ldr r0, [r4, #0x14]
	ldrh r0, [r0, #0x34]
	strb r0, [r1]
	adds r1, #1
	ldr r0, [r4, #0x14]
	ldrh r0, [r0, #0x36]
	strb r0, [r1]
	adds r0, r4, #0
	adds r0, #0x39
	movs r1, #0xfe
	strb r1, [r0]
	subs r0, #1
	strb r1, [r0]
	adds r0, r4, #0
	bl sub_80BBC54
	ldrb r1, [r5]
	movs r0, #3
	orrs r0, r1
	strb r0, [r5]
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80BBEB8

	THUMB_FUNC_START sub_80BBF1C
sub_80BBF1C: @ 0x080BBF1C
	push {r4, r5, r6, r7, lr}
	adds r3, r0, #0
	lsls r1, r1, #0x10
	lsrs r5, r1, #0x10
	cmp r2, #0
	ble _080BBF50
	ldr r0, _080BBF58  @ 0x0000F3FF
	mov ip, r0
	ldr r0, _080BBF5C  @ 0xFFFFF3FF
	adds r6, r0, #0
	movs r7, #0xc0
	lsls r7, r7, #4
	adds r4, r2, #0
_080BBF36:
	ldrh r2, [r3]
	mov r1, ip
	ands r1, r2
	adds r1, r5, r1
	ands r1, r6
	adds r0, r7, #0
	ands r0, r2
	orrs r1, r0
	strh r1, [r3]
	adds r3, #2
	subs r4, #1
	cmp r4, #0
	bne _080BBF36
_080BBF50:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BBF58: .4byte 0x0000F3FF
_080BBF5C: .4byte 0xFFFFF3FF

	THUMB_FUNC_END sub_80BBF1C

	THUMB_FUNC_START sub_80BBF60
sub_80BBF60: @ 0x080BBF60
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	sub sp, #8
	adds r7, r0, #0
	adds r0, #0x31
	ldrb r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	bne _080BBF7A
	b _080BC0AA
_080BBF7A:
	adds r6, r7, #0
	adds r6, #0x36
	ldrb r0, [r6]
	adds r5, r7, #0
	adds r5, #0x38
	strb r0, [r5]
	adds r4, r7, #0
	adds r4, #0x37
	ldrb r0, [r4]
	adds r3, r7, #0
	adds r3, #0x39
	strb r0, [r3]
	add r2, sp, #4
	ldr r1, [r7, #0x14]
	ldrh r0, [r1, #0x34]
	strh r0, [r2]
	adds r2, #2
	ldrh r0, [r1, #0x36]
	strh r0, [r2]
	add r0, sp, #4
	movs r1, #0
	ldrsh r0, [r0, r1]
	mov r8, r6
	mov ip, r5
	adds r6, r4, #0
	mov r9, r2
	cmp r0, #0
	bge _080BBFB4
	adds r0, #7
_080BBFB4:
	asrs r0, r0, #3
	mov r2, r8
	strb r0, [r2]
	mov r4, r9
	movs r1, #0
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bge _080BBFC6
	adds r0, #7
_080BBFC6:
	asrs r0, r0, #3
	strb r0, [r6]
	ldrh r0, [r7, #0x36]
	adds r5, r7, #0
	adds r5, #0x34
	ldrh r2, [r7, #0x38]
	cmp r0, r2
	beq _080BC054
	mov r4, r8
	movs r2, #0
	ldrsb r2, [r4, r2]
	mov r1, ip
	movs r0, #0
	ldrsb r0, [r1, r0]
	subs r1, r2, r0
	cmp r1, #0
	blt _080BBFEE
	cmp r1, #1
	bgt _080BC00E
	b _080BBFF4
_080BBFEE:
	subs r0, r0, r2
	cmp r0, #1
	bgt _080BC00E
_080BBFF4:
	movs r2, #0
	ldrsb r2, [r6, r2]
	movs r0, #0
	ldrsb r0, [r3, r0]
	subs r1, r2, r0
	cmp r1, #0
	blt _080BC008
	cmp r1, #1
	bgt _080BC00E
	b _080BC02C
_080BC008:
	subs r0, r0, r2
	cmp r0, #1
	ble _080BC02C
_080BC00E:
	mov r2, r8
	movs r0, #0
	ldrsb r0, [r2, r0]
	movs r1, #0
	ldrsb r1, [r6, r1]
	adds r4, r7, #0
	adds r4, #0x34
	ldrb r2, [r4]
	bl sub_80BBCC8
	ldrb r0, [r4]
	bl BG_EnableSync
	adds r5, r4, #0
	b _080BC054
_080BC02C:
	mov r4, r8
	movs r0, #0
	ldrsb r0, [r4, r0]
	movs r1, #0
	ldrsb r1, [r6, r1]
	mov r4, ip
	movs r2, #0
	ldrsb r2, [r4, r2]
	ldrb r3, [r3]
	lsls r3, r3, #0x18
	asrs r3, r3, #0x18
	adds r5, r7, #0
	adds r5, #0x34
	ldrb r4, [r5]
	str r4, [sp]
	bl sub_80BBDA4
	ldrb r0, [r5]
	bl BG_EnableSync
_080BC054:
	adds r4, r7, #0
	adds r4, #0x31
	ldrb r1, [r4]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080BC070
	adds r0, r7, #0
	bl sub_80BBC54
	ldrb r1, [r4]
	movs r0, #0xfd
	ands r0, r1
	strb r0, [r4]
_080BC070:
	ldrb r1, [r4]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080BC098
	mov r1, r8
	movs r0, #0
	ldrsb r0, [r1, r0]
	movs r1, #0
	ldrsb r1, [r6, r1]
	ldrb r2, [r5]
	bl sub_80BBCC8
	ldrb r0, [r5]
	bl BG_EnableSync
	ldrb r1, [r4]
	movs r0, #0xfe
	ands r0, r1
	strb r0, [r4]
_080BC098:
	ldrb r0, [r5]
	add r1, sp, #4
	ldrh r2, [r1]
	ldr r1, _080BC0B8  @ 0x000001FF
	ands r1, r2
	mov r3, r9
	ldrb r2, [r3]
	bl BG_SetPosition
_080BC0AA:
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BC0B8: .4byte 0x000001FF

	THUMB_FUNC_END sub_80BBF60

	THUMB_FUNC_START MapRoute_StartTransition
MapRoute_StartTransition: @ 0x080BC0BC
	push {r4, lr}
	adds r4, r0, #0
	adds r4, #0x35
	ldrb r0, [r4]
	bl BG_GetMapBuffer
	movs r1, #0
	bl BG_Fill
	ldrb r0, [r4]
	bl BG_EnableSync
	ldr r0, _080BC0F0  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080BC0E8
	movs r0, #0xc4
	lsls r0, r0, #2
	bl m4aSongNumStart
_080BC0E8:
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080BC0F0: .4byte gPlaySt

	THUMB_FUNC_END MapRoute_StartTransition

	THUMB_FUNC_START sub_80BC0F4
sub_80BC0F4: @ 0x080BC0F4
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	movs r0, #1
	movs r1, #0
	movs r2, #0x10
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	ldr r2, _080BC174  @ gUnknown_030030BC
	ldrh r0, [r2]
	ldr r1, _080BC178  @ 0x0000FFC0
	ands r1, r0
	adds r5, r4, #0
	adds r5, #0x35
	movs r0, #1
	ldrb r3, [r5]
	lsls r0, r3
	orrs r1, r0
	ldr r0, _080BC17C  @ 0x0000C0FF
	ands r1, r0
	movs r3, #0x80
	lsls r3, r3, #4
	adds r0, r3, #0
	orrs r1, r0
	strh r1, [r2]
	adds r0, r4, #0
	bl sub_80BBC54
	adds r0, r4, #0
	adds r0, #0x36
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r1, r4, #0
	adds r1, #0x37
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	ldrb r2, [r5]
	bl sub_80BBCC8
	mov r2, sp
	ldr r1, [r4, #0x14]
	ldrh r0, [r1, #0x34]
	strh r0, [r2]
	mov r0, sp
	adds r0, #2
	ldrh r3, [r1, #0x36]
	strh r3, [r0]
	ldrb r0, [r5]
	mov r1, sp
	ldrh r2, [r1]
	ldr r1, _080BC180  @ 0x000001FF
	ands r1, r2
	movs r2, #0xff
	ands r2, r3
	bl BG_SetPosition
	movs r0, #0
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080BC174: .4byte gUnknown_030030BC
_080BC178: .4byte 0x0000FFC0
_080BC17C: .4byte 0x0000C0FF
_080BC180: .4byte 0x000001FF

	THUMB_FUNC_END sub_80BC0F4

	THUMB_FUNC_START MapRoute_EnableBGSyncs
MapRoute_EnableBGSyncs: @ 0x080BC184
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r6, r4, #0
	adds r6, #0x35
	ldrb r5, [r6]
	movs r0, #3
	bl BG_GetPriority
	adds r1, r0, #0
	adds r0, r5, #0
	bl BG_SetPriority
	movs r1, #1
	adds r0, r1, #0
	ldrb r6, [r6]
	lsls r0, r6
	adds r4, #0x34
	ldrb r4, [r4]
	lsls r1, r4
	orrs r0, r1
	bl BG_EnableSyncByMask
	movs r0, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	THUMB_FUNC_END MapRoute_EnableBGSyncs

	THUMB_FUNC_START MapRoute_TransitionLoop
MapRoute_TransitionLoop: @ 0x080BC1B8
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldrh r0, [r6, #0x3e]
	adds r0, #1
	strh r0, [r6, #0x3e]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x3c
	ldrsh r1, [r6, r2]
	cmp r0, r1
	bge _080BC1F2
	movs r1, #0x3e
	ldrsh r0, [r6, r1]
	lsls r0, r0, #4
	movs r2, #0x3c
	ldrsh r1, [r6, r2]
	bl __divsi3
	lsls r1, r0, #0x18
	lsrs r1, r1, #0x18
	movs r2, #0x10
	subs r2, r2, r0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	movs r0, #1
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	b _080BC220
_080BC1F2:
	adds r0, r6, #0
	adds r0, #0x35
	ldrb r0, [r0]
	bl BG_GetMapBuffer
	adds r5, r0, #0
	adds r4, r6, #0
	adds r4, #0x34
	ldrb r0, [r4]
	bl BG_GetMapBuffer
	adds r1, r0, #0
	movs r2, #0x80
	lsls r2, r2, #2
	adds r0, r5, #0
	bl CpuFastSet
	ldrb r0, [r4]
	bl BG_EnableSync
	adds r0, r6, #0
	bl Proc_Break
_080BC220:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END MapRoute_TransitionLoop

	THUMB_FUNC_START MapRoute_TransitionEnd
MapRoute_TransitionEnd: @ 0x080BC228
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r5, #0
	adds r4, #0x35
	ldrb r0, [r4]
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	ldrb r0, [r4]
	bl BG_GetMapBuffer
	movs r1, #0
	bl BG_Fill
	ldrb r0, [r4]
	adds r1, r5, #0
	adds r1, #0x3a
	ldrb r1, [r1]
	bl BG_SetPriority
	adds r2, r5, #0
	adds r2, #0x34
	movs r1, #1
	adds r0, r1, #0
	ldrb r2, [r2]
	lsls r0, r2
	ldrb r4, [r4]
	lsls r1, r4
	orrs r0, r1
	bl BG_EnableSyncByMask
	bl SetDefaultColorEffects
	ldr r2, _080BC290  @ gUnknown_030030BC
	ldrh r1, [r2]
	ldr r0, _080BC294  @ 0x0000FFC0
	ands r0, r1
	ldr r1, _080BC298  @ 0x0000C0FF
	ands r0, r1
	strh r0, [r2]
	adds r2, r5, #0
	adds r2, #0x32
	ldrb r1, [r2]
	movs r0, #0xfe
	ands r0, r1
	strb r0, [r2]
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080BC290: .4byte gUnknown_030030BC
_080BC294: .4byte 0x0000FFC0
_080BC298: .4byte 0x0000C0FF

	THUMB_FUNC_END MapRoute_TransitionEnd

	THUMB_FUNC_START MapRoute_BeginRouteTransition
MapRoute_BeginRouteTransition: @ 0x080BC29C
	push {lr}
	adds r2, r0, #0
	cmp r1, #1
	bgt _080BC2BC
	adds r3, r2, #0
	adds r3, #0x31
	ldrb r1, [r3]
	movs r0, #3
	orrs r0, r1
	strb r0, [r3]
	adds r2, #0x32
	ldrb r1, [r2]
	movs r0, #0xfe
	ands r0, r1
	strb r0, [r2]
	b _080BC2D6
_080BC2BC:
	movs r0, #0
	strh r1, [r2, #0x3c]
	strh r0, [r2, #0x3e]
	adds r3, r2, #0
	adds r3, #0x32
	ldrb r1, [r3]
	movs r0, #1
	orrs r0, r1
	strb r0, [r3]
	adds r0, r2, #0
	movs r1, #1
	bl Proc_Goto
_080BC2D6:
	pop {r0}
	bx r0

	THUMB_FUNC_END MapRoute_BeginRouteTransition

	THUMB_FUNC_START MapRoute_80BC2DC
MapRoute_80BC2DC: @ 0x080BC2DC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r6, r0, #0
	adds r7, r6, #0
	adds r7, #0x32
	ldrb r1, [r7]
	movs r0, #1
	mov r8, r0
	ands r0, r1
	cmp r0, #0
	beq _080BC38A
	mov r2, sp
	ldr r1, [r6, #0x14]
	ldrh r0, [r1, #0x34]
	strh r0, [r2]
	mov r4, sp
	adds r4, #2
	ldrh r0, [r1, #0x36]
	strh r0, [r4]
	adds r0, r6, #0
	bl sub_80BBC54
	mov r0, sp
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bge _080BC318
	adds r0, #7
_080BC318:
	asrs r0, r0, #3
	movs r2, #0
	ldrsh r1, [r4, r2]
	cmp r1, #0
	bge _080BC324
	adds r1, #7
_080BC324:
	asrs r1, r1, #3
	adds r4, r6, #0
	adds r4, #0x34
	ldrb r2, [r4]
	bl sub_80BBCC8
	adds r5, r6, #0
	adds r5, #0x35
	ldrb r0, [r5]
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	ldrb r0, [r5]
	bl BG_GetMapBuffer
	movs r1, #0
	bl BG_Fill
	ldrb r0, [r5]
	adds r1, r6, #0
	adds r1, #0x3a
	ldrb r1, [r1]
	bl BG_SetPriority
	mov r0, r8
	ldrb r4, [r4]
	lsls r0, r4
	mov r1, r8
	ldrb r5, [r5]
	lsls r1, r5
	orrs r0, r1
	bl BG_EnableSyncByMask
	bl SetDefaultColorEffects
	ldr r2, _080BC398  @ gUnknown_030030BC
	ldrh r1, [r2]
	ldr r0, _080BC39C  @ 0x0000FFC0
	ands r0, r1
	ldr r1, _080BC3A0  @ 0x0000C0FF
	ands r0, r1
	strh r0, [r2]
	ldrb r1, [r7]
	movs r0, #0xfe
	ands r0, r1
	strb r0, [r7]
	adds r0, r6, #0
	movs r1, #0
	bl Proc_Goto
_080BC38A:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BC398: .4byte gUnknown_030030BC
_080BC39C: .4byte 0x0000FFC0
_080BC3A0: .4byte 0x0000C0FF

	THUMB_FUNC_END MapRoute_80BC2DC

	THUMB_FUNC_START NewMapRoute
NewMapRoute: @ 0x080BC3A4
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r4, r0, #0
	mov r8, r1
	adds r5, r2, #0
	adds r6, r3, #0
	ldr r0, _080BC3D0  @ gUnknown_08A3DFC4
	adds r1, r4, #0
	bl Proc_Start
	str r5, [r0, #0x2c]
	adds r1, r0, #0
	adds r1, #0x30
	strb r6, [r1]
	mov r1, r8
	str r1, [r0, #0x40]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_080BC3D0: .4byte gUnknown_08A3DFC4

	THUMB_FUNC_END NewMapRoute

	THUMB_FUNC_START sub_80BC3D4
sub_80BC3D4: @ 0x080BC3D4
	push {lr}
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _080BC3EC  @ gUnknown_08206674
	adds r1, r1, r0
	ldr r1, [r1, #8]
	cmp r1, #0
	bne _080BC3F0
	movs r0, #0
	b _080BC400
	.align 2, 0
_080BC3EC: .4byte gUnknown_08206674
_080BC3F0:
	movs r2, #0
	b _080BC3F8
_080BC3F4:
	adds r1, #8
	adds r2, #1
_080BC3F8:
	ldr r0, [r1]
	cmp r0, #0
	bge _080BC3F4
	adds r0, r2, #0
_080BC400:
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80BC3D4

	THUMB_FUNC_START sub_80BC404
sub_80BC404: @ 0x080BC404
	push {r4, lr}
	adds r4, r0, #0
	adds r4, #0x34
	ldrb r0, [r4]
	bl BG_GetMapBuffer
	movs r1, #0
	bl BG_Fill
	movs r0, #1
	ldrb r4, [r4]
	lsls r0, r4
	bl BG_EnableSyncByMask
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80BC404

	THUMB_FUNC_START sub_80BC428
sub_80BC428: @ 0x080BC428
	push {r4, r5, r6, lr}
	movs r4, #0
	adds r1, r0, #0
	adds r1, #0x60
	ldrb r2, [r1]
	cmp r4, r2
	bge _080BC44E
	adds r6, r0, #0
	adds r6, #0x34
	adds r5, r1, #0
_080BC43C:
	ldm r6!, {r0}
	adds r0, #0x34
	movs r1, #0
	bl Text_SetCursor
	adds r4, #1
	ldrb r0, [r5]
	cmp r4, r0
	blt _080BC43C
_080BC44E:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80BC428

	THUMB_FUNC_START sub_80BC454
sub_80BC454: @ 0x080BC454
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _080BC47C  @ gGMData
	movs r0, #0
	strb r0, [r1, #1]
	ldr r0, _080BC480  @ gUnknown_0201AFC0
	ldr r1, _080BC484  @ 0x06001000
	movs r2, #0x80
	movs r3, #0
	bl InitTextFont
	ldr r0, _080BC488  @ gUnknown_08A3E124
	ldr r1, _080BC48C  @ gUnknown_08A3E148
	ldr r1, [r1]
	adds r2, r4, #0
	bl StartMenuAt
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080BC47C: .4byte gGMData
_080BC480: .4byte gUnknown_0201AFC0
_080BC484: .4byte 0x06001000
_080BC488: .4byte gUnknown_08A3E124
_080BC48C: .4byte gUnknown_08A3E148

	THUMB_FUNC_END sub_80BC454

	THUMB_FUNC_START sub_80BC490
sub_80BC490: @ 0x080BC490
	push {lr}
	movs r0, #1
	bl BG_EnableSyncByMask
	movs r0, #0
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80BC490

	THUMB_FUNC_START sub_80BC4A0
sub_80BC4A0: @ 0x080BC4A0
	push {lr}
	bl ClearBg0Bg1
	movs r0, #0
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80BC4A0

	THUMB_FUNC_START sub_80BC4AC
sub_80BC4AC: @ 0x080BC4AC
	push {lr}
	ldr r0, _080BC4C0  @ gUnknown_08A3D748
	bl Proc_Find
	movs r1, #3
	bl Proc_Goto
	movs r0, #0x1b
	pop {r1}
	bx r1
	.align 2, 0
_080BC4C0: .4byte gUnknown_08A3D748

	THUMB_FUNC_END sub_80BC4AC

	THUMB_FUNC_START sub_80BC4C4
sub_80BC4C4: @ 0x080BC4C4
	push {lr}
	ldr r0, _080BC4D8  @ gUnknown_08A3D748
	bl Proc_Find
	movs r1, #9
	bl Proc_Goto
	movs r0, #0x17
	pop {r1}
	bx r1
	.align 2, 0
_080BC4D8: .4byte gUnknown_08A3D748

	THUMB_FUNC_END sub_80BC4C4

	THUMB_FUNC_START sub_80BC4DC
sub_80BC4DC: @ 0x080BC4DC
	push {lr}
	ldr r0, _080BC4F0  @ gUnknown_08A3D748
	bl Proc_Find
	movs r1, #0xc
	bl Proc_Goto
	movs r0, #0x17
	pop {r1}
	bx r1
	.align 2, 0
_080BC4F0: .4byte gUnknown_08A3D748

	THUMB_FUNC_END sub_80BC4DC

	THUMB_FUNC_START sub_80BC4F4
sub_80BC4F4: @ 0x080BC4F4
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r5, r1, #0
	adds r1, r6, #0
	adds r1, #0x63
	ldrb r2, [r1]
	movs r1, #8
	ands r1, r2
	cmp r1, #0
	bne _080BC566
	bl sub_80CF480
	lsls r0, r0, #0x18
	adds r4, r5, #0
	adds r4, #0x34
	cmp r0, #0
	bne _080BC51E
	adds r0, r4, #0
	movs r1, #4
	bl Text_SetColor
_080BC51E:
	adds r0, r5, #0
	adds r0, #0x3d
	ldrb r0, [r0]
	cmp r0, #2
	bne _080BC530
	adds r0, r4, #0
	movs r1, #1
	bl Text_SetColor
_080BC530:
	ldr r0, [r5, #0x30]
	ldrh r0, [r0, #4]
	bl GetStringFromIndex
	adds r1, r0, #0
	adds r0, r4, #0
	bl Text_DrawString
	adds r0, r6, #0
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
	bl PutText
_080BC566:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80BC4F4

	THUMB_FUNC_START sub_80BC56C
sub_80BC56C: @ 0x080BC56C
	push {lr}
	ldr r0, _080BC580  @ gUnknown_08A3D748
	bl Proc_Find
	movs r1, #0xa
	bl Proc_Goto
	movs r0, #0x17
	pop {r1}
	bx r1
	.align 2, 0
_080BC580: .4byte gUnknown_08A3D748

	THUMB_FUNC_END sub_80BC56C

	THUMB_FUNC_START sub_80BC584
sub_80BC584: @ 0x080BC584
	push {lr}
	ldr r0, _080BC598  @ gUnknown_08A3D748
	bl Proc_Find
	movs r1, #0xb
	bl Proc_Goto
	movs r0, #0x17
	pop {r1}
	bx r1
	.align 2, 0
_080BC598: .4byte gUnknown_08A3D748

	THUMB_FUNC_END sub_80BC584

	THUMB_FUNC_START sub_80BC59C
sub_80BC59C: @ 0x080BC59C
	push {lr}
	ldr r0, _080BC5B0  @ gUnknown_08A3D748
	bl Proc_Find
	movs r1, #0xd
	bl Proc_Goto
	movs r0, #0x17
	pop {r1}
	bx r1
	.align 2, 0
_080BC5B0: .4byte gUnknown_08A3D748

	THUMB_FUNC_END sub_80BC59C

	THUMB_FUNC_START sub_80BC5B4
sub_80BC5B4: @ 0x080BC5B4
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _080BC5E0  @ gGMData
	movs r0, #0
	strb r0, [r4, #1]
	ldr r0, _080BC5E4  @ gUnknown_0201AFC0
	ldr r1, _080BC5E8  @ 0x06001000
	movs r2, #0x80
	movs r3, #0
	bl InitTextFont
	ldr r0, [r4, #8]
	asrs r0, r0, #8
	movs r2, #2
	ldrsh r1, [r4, r2]
	subs r0, r0, r1
	cmp r0, #0x97
	bgt _080BC5F4
	ldr r0, _080BC5EC  @ gUnknown_08A3E200
	ldr r1, _080BC5F0  @ gUnknown_08A3E224
	b _080BC5F8
	.align 2, 0
_080BC5E0: .4byte gGMData
_080BC5E4: .4byte gUnknown_0201AFC0
_080BC5E8: .4byte 0x06001000
_080BC5EC: .4byte gUnknown_08A3E200
_080BC5F0: .4byte gUnknown_08A3E224
_080BC5F4:
	ldr r0, _080BC618  @ gUnknown_08A3E200
	ldr r1, _080BC61C  @ gUnknown_08A3E228
_080BC5F8:
	ldr r1, [r1]
	adds r2, r5, #0
	bl StartMenuAt
	adds r3, r0, #0
	ldr r0, _080BC620  @ gGMData
	adds r0, #0xcd
	adds r1, r3, #0
	adds r1, #0x60
	ldrb r2, [r0]
	ldrb r0, [r1]
	cmp r2, r0
	bcs _080BC624
	adds r1, #1
	strb r2, [r1]
	b _080BC62C
	.align 2, 0
_080BC618: .4byte gUnknown_08A3E200
_080BC61C: .4byte gUnknown_08A3E228
_080BC620: .4byte gGMData
_080BC624:
	subs r0, #1
	adds r2, r3, #0
	adds r2, #0x61
	strb r0, [r2]
_080BC62C:
	adds r0, r3, #0
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80BC5B4

	THUMB_FUNC_START sub_80BC634
sub_80BC634: @ 0x080BC634
	push {lr}
	movs r0, #1
	bl BG_EnableSyncByMask
	movs r0, #0
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80BC634

	THUMB_FUNC_START sub_80BC644
sub_80BC644: @ 0x080BC644
	push {lr}
	bl ClearBg0Bg1
	movs r0, #0
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80BC644

	THUMB_FUNC_START sub_80BC650
sub_80BC650: @ 0x080BC650
	push {lr}
	ldr r0, _080BC66C  @ gGMData
	adds r0, #0xcd
	movs r1, #0
	strb r1, [r0]
	ldr r0, _080BC670  @ gUnknown_08A3D748
	bl Proc_Find
	movs r1, #3
	bl Proc_Goto
	movs r0, #0x1b
	pop {r1}
	bx r1
	.align 2, 0
_080BC66C: .4byte gGMData
_080BC670: .4byte gUnknown_08A3D748

	THUMB_FUNC_END sub_80BC650

	THUMB_FUNC_START sub_80BC674
sub_80BC674: @ 0x080BC674
	push {lr}
	ldr r1, _080BC69C  @ gGMData
	ldrb r2, [r1, #0x11]
	lsls r0, r2, #2
	adds r0, r0, r1
	adds r0, #0x30
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _080BC6A4
	lsls r0, r2, #5
	ldr r1, _080BC6A0  @ gUnknown_082060B0
	adds r0, r0, r1
	ldr r0, [r0, #0xc]
	ldrh r0, [r0]
	cmp r0, #0
	beq _080BC6A4
	movs r0, #1
	b _080BC6A6
	.align 2, 0
_080BC69C: .4byte gGMData
_080BC6A0: .4byte gUnknown_082060B0
_080BC6A4:
	movs r0, #3
_080BC6A6:
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80BC674

	THUMB_FUNC_START sub_80BC6AC
sub_80BC6AC: @ 0x080BC6AC
	push {lr}
	ldr r1, _080BC6D4  @ gGMData
	ldrb r2, [r1, #0x11]
	lsls r0, r2, #2
	adds r0, r0, r1
	adds r0, #0x30
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _080BC6DC
	lsls r0, r2, #5
	ldr r1, _080BC6D8  @ gUnknown_082060B0
	adds r0, r0, r1
	ldr r0, [r0, #0x10]
	ldrh r0, [r0]
	cmp r0, #0
	beq _080BC6DC
	movs r0, #1
	b _080BC6DE
	.align 2, 0
_080BC6D4: .4byte gGMData
_080BC6D8: .4byte gUnknown_082060B0
_080BC6DC:
	movs r0, #3
_080BC6DE:
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80BC6AC

	THUMB_FUNC_START sub_80BC6E4
sub_80BC6E4: @ 0x080BC6E4
	push {lr}
	ldr r1, _080BC718  @ gGMData
	ldrb r2, [r1, #0x11]
	lsls r0, r2, #2
	adds r0, r0, r1
	adds r0, #0x30
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _080BC724
	lsls r0, r2, #5
	ldr r1, _080BC71C  @ gUnknown_082060B0
	adds r0, r0, r1
	ldr r0, [r0, #0x14]
	ldrh r0, [r0]
	cmp r0, #0
	beq _080BC724
	ldr r0, _080BC720  @ gPlaySt
	ldrb r1, [r0, #0x14]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _080BC724
	movs r0, #1
	b _080BC726
	.align 2, 0
_080BC718: .4byte gGMData
_080BC71C: .4byte gUnknown_082060B0
_080BC720: .4byte gPlaySt
_080BC724:
	movs r0, #3
_080BC726:
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80BC6E4

	THUMB_FUNC_START sub_80BC72C
sub_80BC72C: @ 0x080BC72C
	push {lr}
	ldr r1, _080BC748  @ gGMData
	ldrb r0, [r1, #0x11]
	lsls r0, r0, #2
	adds r0, r0, r1
	adds r0, #0x30
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080BC74C
	movs r0, #3
	b _080BC74E
	.align 2, 0
_080BC748: .4byte gGMData
_080BC74C:
	movs r0, #1
_080BC74E:
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80BC72C

	THUMB_FUNC_START sub_80BC754
sub_80BC754: @ 0x080BC754
	push {lr}
	ldr r1, _080BC770  @ gGMData
	ldrb r0, [r1, #0x11]
	lsls r0, r0, #2
	adds r0, r0, r1
	adds r0, #0x30
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _080BC774
	movs r0, #3
	b _080BC776
	.align 2, 0
_080BC770: .4byte gGMData
_080BC774:
	movs r0, #1
_080BC776:
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80BC754

	THUMB_FUNC_START sub_80BC77C
sub_80BC77C: @ 0x080BC77C
	push {lr}
	ldr r1, _080BC79C  @ gGMData
	adds r0, #0x61
	ldrb r0, [r0]
	adds r1, #0xcd
	strb r0, [r1]
	ldr r0, _080BC7A0  @ gUnknown_08A3D748
	bl Proc_Find
	movs r1, #0x13
	bl Proc_Goto
	movs r0, #0x17
	pop {r1}
	bx r1
	.align 2, 0
_080BC79C: .4byte gGMData
_080BC7A0: .4byte gUnknown_08A3D748

	THUMB_FUNC_END sub_80BC77C

	THUMB_FUNC_START sub_80BC7A4
sub_80BC7A4: @ 0x080BC7A4
	push {lr}
	ldr r1, _080BC7C4  @ gGMData
	adds r0, #0x61
	ldrb r0, [r0]
	adds r1, #0xcd
	strb r0, [r1]
	ldr r0, _080BC7C8  @ gUnknown_08A3D748
	bl Proc_Find
	movs r1, #0x14
	bl Proc_Goto
	movs r0, #0x17
	pop {r1}
	bx r1
	.align 2, 0
_080BC7C4: .4byte gGMData
_080BC7C8: .4byte gUnknown_08A3D748

	THUMB_FUNC_END sub_80BC7A4

	THUMB_FUNC_START sub_80BC7CC
sub_80BC7CC: @ 0x080BC7CC
	push {lr}
	ldr r1, _080BC7EC  @ gGMData
	adds r0, #0x61
	ldrb r0, [r0]
	adds r1, #0xcd
	strb r0, [r1]
	ldr r0, _080BC7F0  @ gUnknown_08A3D748
	bl Proc_Find
	movs r1, #0x15
	bl Proc_Goto
	movs r0, #0x17
	pop {r1}
	bx r1
	.align 2, 0
_080BC7EC: .4byte gGMData
_080BC7F0: .4byte gUnknown_08A3D748

	THUMB_FUNC_END sub_80BC7CC

	THUMB_FUNC_START sub_80BC7F4
sub_80BC7F4: @ 0x080BC7F4
	push {lr}
	ldr r1, _080BC814  @ gGMData
	adds r0, #0x61
	ldrb r0, [r0]
	adds r1, #0xcd
	strb r0, [r1]
	ldr r0, _080BC818  @ gUnknown_08A3D748
	bl Proc_Find
	movs r1, #0x16
	bl Proc_Goto
	movs r0, #0x17
	pop {r1}
	bx r1
	.align 2, 0
_080BC814: .4byte gGMData
_080BC818: .4byte gUnknown_08A3D748

	THUMB_FUNC_END sub_80BC7F4

	THUMB_FUNC_START sub_80BC81C
sub_80BC81C: @ 0x080BC81C
	push {r4, r5, r6, lr}
	sub sp, #4
	movs r0, #0
	str r0, [sp]
	ldr r4, _080BC890  @ gGMData
	ldr r2, _080BC894  @ 0x05000035
	mov r0, sp
	adds r1, r4, #0
	bl CpuSet
	adds r0, r4, #0
	adds r0, #0xa4
	bl sub_80BC898
	movs r5, #0
	movs r6, #0xfd
	adds r2, r4, #0
	adds r2, #0x10
	movs r3, #6
_080BC842:
	strh r5, [r2, #2]
	ldrb r1, [r2]
	adds r0, r6, #0
	ands r0, r1
	strb r0, [r2]
	adds r2, #4
	subs r3, #1
	cmp r3, #0
	bge _080BC842
	movs r3, #0
	movs r0, #1
	strh r0, [r4, #0x12]
	ldrb r1, [r4, #0x10]
	movs r0, #0xfd
	ands r0, r1
	strb r0, [r4, #0x10]
	strb r3, [r4, #0x11]
	adds r2, r4, #0
	adds r2, #0x30
	ldrb r1, [r2]
	movs r0, #2
	orrs r0, r1
	strb r0, [r2]
	ldrb r0, [r4]
	movs r1, #4
	orrs r0, r1
	movs r1, #0x30
	orrs r0, r1
	strb r0, [r4]
	adds r0, r4, #0
	adds r0, #0xcd
	strb r3, [r0]
	adds r0, #1
	bl StoreRNState
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080BC890: .4byte gGMData
_080BC894: .4byte 0x05000035

	THUMB_FUNC_END sub_80BC81C

	THUMB_FUNC_START sub_80BC898
sub_80BC898: @ 0x080BC898
	push {r4, lr}
	adds r3, r0, #0
	movs r2, #0
	movs r4, #0xff
_080BC8A0:
	adds r1, r3, r2
	ldrb r0, [r1]
	orrs r0, r4
	strb r0, [r1]
	adds r2, #1
	cmp r2, #0x1f
	bls _080BC8A0
	adds r1, r3, #0
	adds r1, #0x20
	movs r0, #0
	strb r0, [r1]
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80BC898
