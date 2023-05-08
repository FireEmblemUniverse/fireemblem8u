	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	THUMB_FUNC_START sub_80758D4
sub_80758D4: @ 0x080758D4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	adds r7, r0, #0
	ldr r4, _08075A38  @ gEkrBg2QuakeVec
	ldrh r1, [r4]
	ldrh r2, [r4, #2]
	movs r0, #2
	bl BG_SetPosition
	ldr r6, _08075A3C  @ gEkrBg0QuakeVec
	ldrh r1, [r6]
	ldrh r0, [r4]
	adds r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldrh r2, [r6, #2]
	ldrh r3, [r4, #2]
	adds r2, r2, r3
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #0
	bl BG_SetPosition
	ldrh r0, [r6]
	ldrh r1, [r4]
	adds r0, r0, r1
	negs r0, r0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldrh r1, [r6, #2]
	ldrh r2, [r4, #2]
	adds r1, r1, r2
	negs r1, r1
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl EkrGauge_Setxy323A
	ldrh r0, [r6]
	ldrh r3, [r4]
	adds r0, r0, r3
	negs r0, r0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r1, [r6, #2]
	ldrh r2, [r4, #2]
	adds r1, r1, r2
	negs r1, r1
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	bl sub_8051B5C
	ldr r3, _08075A40  @ gEkrXPosBase
	mov r9, r3
	ldrh r5, [r4]
	ldrh r0, [r3]
	adds r1, r5, r0
	ldr r2, _08075A44  @ gEkrBgXOffset
	mov sl, r2
	ldr r0, [r2]
	subs r1, r1, r0
	ldr r3, _08075A48  @ gEkrYPosBase
	mov r8, r3
	ldrh r2, [r3]
	ldrh r3, [r4, #2]
	subs r2, r2, r3
	mov r4, r9
	ldrh r4, [r4, #2]
	adds r5, r5, r4
	subs r5, r5, r0
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	mov r0, r8
	ldrh r4, [r0, #2]
	subs r4, r4, r3
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	movs r0, #0
	bl SetEkrFrontAnimPostion
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	movs r0, #1
	adds r1, r5, #0
	adds r2, r4, #0
	bl SetEkrFrontAnimPostion
	ldrh r0, [r7, #0x2c]
	adds r0, #1
	strh r0, [r7, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x2e
	ldrsh r1, [r7, r2]
	cmp r0, r1
	ble _08075A2A
	ldr r1, _08075A4C  @ gUnknown_0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	ldrh r1, [r6]
	ldrh r2, [r6, #2]
	movs r0, #0
	bl BG_SetPosition
	ldrh r0, [r6]
	negs r0, r0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldrh r1, [r6, #2]
	negs r1, r1
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl EkrGauge_Setxy323A
	ldrh r0, [r6]
	negs r0, r0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r1, [r6, #2]
	negs r1, r1
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	bl sub_8051B5C
	mov r3, sl
	ldr r0, [r3]
	mov r4, r9
	ldrh r1, [r4]
	subs r1, r1, r0
	ldrh r4, [r4, #2]
	subs r4, r4, r0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	mov r0, r8
	ldrh r5, [r0, #2]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r3, #0
	ldrsh r2, [r0, r3]
	movs r0, #0
	bl SetEkrFrontAnimPostion
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	movs r0, #1
	adds r1, r4, #0
	adds r2, r5, #0
	bl SetEkrFrontAnimPostion
	ldr r0, [r7, #0x60]
	bl Proc_End
	adds r0, r7, #0
	bl Proc_Break
_08075A2A:
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08075A38: .4byte gEkrBg2QuakeVec
_08075A3C: .4byte gEkrBg0QuakeVec
_08075A40: .4byte gEkrXPosBase
_08075A44: .4byte gEkrBgXOffset
_08075A48: .4byte gEkrYPosBase
_08075A4C: .4byte gUnknown_0201774C

	THUMB_FUNC_END sub_80758D4

	THUMB_FUNC_START sub_8075A50
sub_8075A50: @ 0x08075A50
	push {lr}
	lsls r1, r0, #1
	adds r1, r1, r0
	ldr r0, _08075A68  @ gBattleBGDataTable
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r0, [r1]
	ldr r1, _08075A6C  @ 0x06008000
	bl LZ77UnCompVram
	pop {r0}
	bx r0
	.align 2, 0
_08075A68: .4byte gBattleBGDataTable
_08075A6C: .4byte 0x06008000

	THUMB_FUNC_END sub_8075A50

	THUMB_FUNC_START sub_8075A70
sub_8075A70: @ 0x08075A70
	push {r4, lr}
	sub sp, #8
	lsls r1, r0, #1
	adds r1, r1, r0
	adds r1, #1
	ldr r0, _08075AA8  @ gBattleBGDataTable
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r0, [r1]
	ldr r4, _08075AAC  @ gEkrTsaBuffer
	adds r1, r4, #0
	bl LZ77UnCompWram
	ldr r1, _08075AB0  @ gBG3TilemapBuffer
	movs r0, #6
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r2, #0x1e
	movs r3, #0x14
	bl sub_8070E94
	add sp, #8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08075AA8: .4byte gBattleBGDataTable
_08075AAC: .4byte gEkrTsaBuffer
_08075AB0: .4byte gBG3TilemapBuffer

	THUMB_FUNC_END sub_8075A70

	THUMB_FUNC_START sub_8075AB4
sub_8075AB4: @ 0x08075AB4
	push {lr}
	lsls r1, r0, #1
	adds r1, r1, r0
	adds r1, #2
	ldr r0, _08075AD0  @ gBattleBGDataTable
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r0, [r1]
	ldr r1, _08075AD4  @ pPalette6Buffer
	bl LZ77UnCompWram
	pop {r0}
	bx r0
	.align 2, 0
_08075AD0: .4byte gBattleBGDataTable
_08075AD4: .4byte pPalette6Buffer

	THUMB_FUNC_END sub_8075AB4

	THUMB_FUNC_START sub_8075AD8
sub_8075AD8: @ 0x08075AD8
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	bl sub_8075A50
	movs r5, #0
	str r5, [sp]
	ldr r1, _08075B14  @ 0x0600FFE0
	ldr r2, _08075B18  @ 0x01000008
	mov r0, sp
	bl CpuFastSet
	adds r0, r4, #0
	bl sub_8075A70
	adds r0, r4, #0
	bl sub_8075AB4
	ldr r0, _08075B1C  @ gPaletteBuffer
	strh r5, [r0]
	movs r0, #8
	bl BG_EnableSyncByMask
	bl EnablePaletteSync
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08075B14: .4byte 0x0600FFE0
_08075B18: .4byte 0x01000008
_08075B1C: .4byte gPaletteBuffer

	THUMB_FUNC_END sub_8075AD8

	THUMB_FUNC_START CheckEkrPopupEnded
CheckEkrPopupEnded: @ 0x08075B20
	push {lr}
	ldr r0, _08075B30  @ gpEkrPopupEndFlag
	ldr r0, [r0]
	cmp r0, #1
	beq _08075B34
	movs r0, #0
	b _08075B36
	.align 2, 0
_08075B30: .4byte gpEkrPopupEndFlag
_08075B34:
	movs r0, #1
_08075B36:
	pop {r1}
	bx r1

	THUMB_FUNC_END CheckEkrPopupEnded

	THUMB_FUNC_START DeleteAnimsOnPopup
DeleteAnimsOnPopup: @ 0x08075B3C
	push {r4, lr}
	ldr r4, _08075B54  @ gpAnimOnPopuProc
	ldr r0, [r4]
	cmp r0, #0
	beq _08075B4E
	bl Proc_End
	movs r0, #0
	str r0, [r4]
_08075B4E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08075B54: .4byte gpAnimOnPopuProc

	THUMB_FUNC_END DeleteAnimsOnPopup

	THUMB_FUNC_START sub_8075B58
sub_8075B58: @ 0x08075B58
	push {lr}
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #0x5a
	bl SomePlaySound_8071990
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8075B58

	THUMB_FUNC_START sub_8075B68
sub_8075B68: @ 0x08075B68
	push {lr}
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #0x5c
	bl SomePlaySound_8071990
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8075B68

	THUMB_FUNC_START MakeBattlePopupTileMapFromTSA
MakeBattlePopupTileMapFromTSA: @ 0x08075B78
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r2, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov sl, r1
	ldr r3, _08075CA4  @ gEkrTsaBuffer
	movs r0, #0x88
	lsls r0, r0, #5
	mov r8, r0
	ldrh r0, [r3]
	add r0, r8
	strh r0, [r2]
	adds r1, r2, #0
	adds r1, #0x40
	ldrh r0, [r3, #0x34]
	add r0, r8
	strh r0, [r1]
	adds r1, #0x40
	adds r0, r3, #0
	adds r0, #0x68
	ldrh r0, [r0]
	add r0, r8
	strh r0, [r1]
	adds r1, #0x40
	adds r0, r3, #0
	adds r0, #0x9c
	ldrh r0, [r0]
	add r0, r8
	strh r0, [r1]
	ldrh r0, [r3, #2]
	add r0, r8
	strh r0, [r2, #2]
	subs r1, #0x7e
	ldrh r0, [r3, #0x36]
	add r0, r8
	strh r0, [r1]
	adds r1, #0x40
	adds r0, r3, #0
	adds r0, #0x6a
	ldrh r0, [r0]
	add r0, r8
	strh r0, [r1]
	adds r1, #0x40
	adds r0, r3, #0
	adds r0, #0x9e
	ldrh r0, [r0]
	add r0, r8
	strh r0, [r1]
	movs r1, #0
	mov r9, r1
	cmp r9, sl
	bcs _08075C38
	adds r7, r2, #0
	adds r7, #0xc4
	str r7, [sp]
	movs r0, #0x6c
	adds r0, r0, r3
	mov ip, r0
	adds r6, r2, #0
	adds r6, #0x84
	adds r5, r2, #0
	adds r5, #0x44
	adds r4, r3, #4
	adds r1, r2, #0
_08075C02:
	ldrh r0, [r4]
	add r0, r8
	strh r0, [r1, #4]
	ldrh r0, [r4, #0x34]
	add r0, r8
	strh r0, [r5]
	mov r7, ip
	ldrh r0, [r7]
	add r0, r8
	strh r0, [r6]
	ldrh r0, [r7, #0x34]
	add r0, r8
	ldr r7, [sp]
	strh r0, [r7]
	adds r0, r7, #0
	adds r0, #2
	str r0, [sp]
	movs r7, #2
	add ip, r7
	adds r6, #2
	adds r5, #2
	adds r4, #2
	adds r1, #2
	movs r0, #1
	add r9, r0
	cmp r9, sl
	bcc _08075C02
_08075C38:
	mov r1, r9
	lsls r0, r1, #1
	adds r2, r0, r2
	ldrh r0, [r3, #0x30]
	add r0, r8
	strh r0, [r2, #4]
	adds r1, r2, #0
	adds r1, #0x44
	adds r0, r3, #0
	adds r0, #0x64
	ldrh r0, [r0]
	add r0, r8
	strh r0, [r1]
	adds r1, #0x40
	adds r0, r3, #0
	adds r0, #0x98
	ldrh r0, [r0]
	add r0, r8
	strh r0, [r1]
	adds r1, #0x40
	adds r0, r3, #0
	adds r0, #0xcc
	ldrh r0, [r0]
	add r0, r8
	strh r0, [r1]
	ldrh r0, [r3, #0x32]
	add r0, r8
	strh r0, [r2, #6]
	subs r1, #0x7e
	adds r0, r3, #0
	adds r0, #0x66
	ldrh r0, [r0]
	add r0, r8
	strh r0, [r1]
	adds r1, #0x40
	adds r0, r3, #0
	adds r0, #0x9a
	ldrh r0, [r0]
	add r0, r8
	strh r0, [r1]
	adds r1, #0x40
	adds r0, r3, #0
	adds r0, #0xce
	ldrh r0, [r0]
	add r0, r8
	strh r0, [r1]
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08075CA4: .4byte gEkrTsaBuffer

	THUMB_FUNC_END MakeBattlePopupTileMapFromTSA

	THUMB_FUNC_START DrawBattlePopup
DrawBattlePopup: @ 0x08075CA8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	str r0, [sp]
	mov r9, r1
	mov sl, r2
	ldr r0, _08075D14  @ gUnknown_08803B30
	ldr r1, _08075D18  @ 0x06002000
	bl LZ77UnCompVram
	ldr r0, _08075D1C  @ gUnknown_08803CD0
	ldr r1, _08075D20  @ gEkrTsaBuffer
	bl LZ77UnCompWram
	ldr r0, _08075D24  @ gSomeFontStruct
	ldr r1, _08075D28  @ 0x06002100
	movs r2, #0x84
	lsls r2, r2, #1
	movs r3, #1
	bl Font_InitForUI
	bl Font_SetSomeSpecialDrawingRoutine
	ldr r0, _08075D2C  @ gUnknown_08803CB0
	ldr r1, _08075D30  @ pPalette1Buffer
	movs r2, #8
	bl CpuFastSet
	mov r0, r9
	cmp r0, #0
	bne _08075D34
	movs r0, #1
	bl GetStringFromIndex
	adds r4, r0, #0
	bl GetStringTextWidth
	str r0, [sp, #4]
	adds r1, r0, #0
	adds r1, #0x10
	mov r8, r1
	movs r0, #2
	bl GetStringFromIndex
	adds r4, r0, #0
	bl GetStringTextWidth
	mov r2, r8
	adds r7, r0, r2
	b _08075D7A
	.align 2, 0
_08075D14: .4byte gUnknown_08803B30
_08075D18: .4byte 0x06002000
_08075D1C: .4byte gUnknown_08803CD0
_08075D20: .4byte gEkrTsaBuffer
_08075D24: .4byte gSomeFontStruct
_08075D28: .4byte 0x06002100
_08075D2C: .4byte gUnknown_08803CB0
_08075D30: .4byte pPalette1Buffer
_08075D34:
	mov r0, r9
	cmp r0, #1
	bne _08075D62
	movs r1, #0
	str r1, [sp, #4]
	mov r0, sl
	movs r1, #1
	bl GetItemNameWithArticle
	adds r4, r0, #0
	bl GetStringTextWidth
	adds r0, #0x10
	mov r8, r0
	movs r0, #3
	bl GetStringFromIndex
	adds r4, r0, #0
	bl GetStringTextWidth
	add r0, r8
	adds r7, r0, #4
	b _08075D7A
_08075D62:
	movs r2, #0
	str r2, [sp, #4]
	movs r0, #0x10
	mov r8, r0
	movs r0, #0xd
	bl GetStringFromIndex
	adds r4, r0, #0
	bl GetStringTextWidth
	adds r7, r0, #0
	adds r7, #0x10
_08075D7A:
	adds r0, r7, #7
	asrs r6, r0, #3
	ldr r0, _08075DD4  @ gBG1TilemapBuffer
	lsls r1, r6, #0x10
	lsrs r1, r1, #0x10
	bl MakeBattlePopupTileMapFromTSA
	ldr r5, _08075DD8  @ gTextEkrlvupMsg
	adds r0, r5, #0
	adds r1, r6, #0
	bl Text_Init
	lsls r0, r6, #3
	subs r0, r0, r7
	asrs r0, r0, #1
	str r0, [sp, #8]
	adds r0, r5, #0
	ldr r1, [sp, #8]
	bl Text_SetXCursor
	ldr r0, _08075DDC  @ gUnknown_08803BD0
	ldr r1, _08075DE0  @ 0x06002100
	bl LZ77UnCompVram
	mov r1, r9
	cmp r1, #0
	bne _08075DE4
	movs r0, #1
	bl GetStringFromIndex
	adds r4, r0, #0
	adds r0, r5, #0
	movs r1, #0
	bl Text_SetColorId
	adds r0, r5, #0
	adds r1, r4, #0
	bl Text_AppendString
	adds r0, r5, #0
	movs r1, #0x10
	bl Text_Advance
	movs r0, #2
	b _08075E0E
	.align 2, 0
_08075DD4: .4byte gBG1TilemapBuffer
_08075DD8: .4byte gTextEkrlvupMsg
_08075DDC: .4byte gUnknown_08803BD0
_08075DE0: .4byte 0x06002100
_08075DE4:
	mov r2, r9
	cmp r2, #1
	bne _08075E26
	mov r0, sl
	movs r1, #1
	bl GetItemNameWithArticle
	adds r4, r0, #0
	adds r0, r5, #0
	movs r1, #1
	bl Text_SetColorId
	adds r0, r5, #0
	adds r1, r4, #0
	bl Text_AppendString
	adds r0, r5, #0
	movs r1, #0x14
	bl Text_Advance
	movs r0, #3
_08075E0E:
	bl GetStringFromIndex
	adds r4, r0, #0
	adds r0, r5, #0
	movs r1, #0
	bl Text_SetColorId
	adds r0, r5, #0
	adds r1, r4, #0
	bl Text_AppendString
	b _08075E3E
_08075E26:
	movs r0, #0xd
	bl GetStringFromIndex
	adds r4, r0, #0
	adds r0, r5, #0
	movs r1, #0
	bl Text_SetColorId
	adds r0, r5, #0
	adds r1, r4, #0
	bl Text_AppendString
_08075E3E:
	adds r1, r6, #2
	lsls r1, r1, #3
	movs r0, #0xe0
	subs r0, r0, r1
	asrs r4, r0, #1
	negs r1, r4
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldr r2, _08075E80  @ 0x0000FFD0
	movs r0, #1
	bl BG_SetPosition
	movs r0, #2
	bl BG_EnableSyncByMask
	bl ResetIconGraphics_
	mov r0, r9
	cmp r0, #0
	bne _08075E84
	movs r0, #1
	movs r1, #0x12
	bl LoadIconPalette
	mov r0, sl
	bl GetItemType
	adds r0, #0x70
	movs r1, #0x40
	bl LoadIconObjectGraphics
	b _08075EC0
	.align 2, 0
_08075E80: .4byte 0x0000FFD0
_08075E84:
	mov r1, r9
	cmp r1, #1
	bne _08075EA8
	movs r0, #0
	movs r1, #0x12
	bl LoadIconPalette
	mov r0, sl
	bl GetItemIconId
	movs r1, #0x40
	bl LoadIconObjectGraphics
	adds r0, r4, #0
	subs r0, #0xe
	mov r2, r8
	adds r4, r0, r2
	b _08075EC0
_08075EA8:
	movs r0, #1
	movs r1, #0x12
	bl LoadIconPalette
	mov r0, sl
	adds r0, #0x70
	movs r1, #0x40
	bl LoadIconObjectGraphics
	adds r0, r4, #0
	subs r0, #0x10
	adds r4, r0, r7
_08075EC0:
	ldr r0, _08075F10  @ gPopupIconFrameData
	movs r1, #0x96
	bl AnimCreate
	ldr r1, [sp]
	str r0, [r1, #0x60]
	movs r1, #0x91
	lsls r1, r1, #6
	strh r1, [r0, #8]
	ldr r1, [sp, #8]
	adds r1, #0x10
	adds r1, r4, r1
	ldr r2, [sp, #4]
	adds r1, r1, r2
	strh r1, [r0, #2]
	movs r1, #0x38
	strh r1, [r0, #4]
	bl EnablePaletteSync
	bl SetDefaultColorEffects
	ldr r2, _08075F14  @ gLCDControlBuffer
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
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08075F10: .4byte gPopupIconFrameData
_08075F14: .4byte gLCDControlBuffer

	THUMB_FUNC_END DrawBattlePopup

	THUMB_FUNC_START NewEkrPopup
NewEkrPopup: @ 0x08075F18
	push {r4, r5, lr}
	ldr r0, _08075F6C  @ gEkrDistanceType
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #4
	bne _08075F9E
	ldr r4, _08075F70  @ gpAnimOnPopuProc
	ldr r0, _08075F74  @ ProcScr_ekrPopup2
	movs r1, #3
	bl Proc_Start
	adds r5, r0, #0
	str r5, [r4]
	ldr r1, _08075F78  @ gpEkrPopupEndFlag
	movs r0, #0
	str r0, [r1]
	subs r0, #1
	str r0, [r5, #0x44]
	str r0, [r5, #0x48]
	movs r2, #0
	ldr r4, _08075F7C  @ gpEkrBattleUnitRight
	ldr r3, _08075F80  @ gpEkrBattleUnitLeft
_08075F44:
	ldr r0, [r4]
	adds r0, #0x28
	adds r0, r0, r2
	ldrb r0, [r0]
	cmp r0, #0
	bne _08075F86
	ldr r0, [r3]
	adds r0, #0x28
	adds r0, r0, r2
	ldrb r0, [r0]
	cmp r0, #0
	beq _08075F86
	ldr r1, [r5, #0x44]
	movs r0, #1
	negs r0, r0
	cmp r1, r0
	bne _08075F84
	str r2, [r5, #0x44]
	b _08075F86
	.align 2, 0
_08075F6C: .4byte gEkrDistanceType
_08075F70: .4byte gpAnimOnPopuProc
_08075F74: .4byte ProcScr_ekrPopup2
_08075F78: .4byte gpEkrPopupEndFlag
_08075F7C: .4byte gpEkrBattleUnitRight
_08075F80: .4byte gpEkrBattleUnitLeft
_08075F84:
	str r2, [r5, #0x48]
_08075F86:
	adds r2, #1
	cmp r2, #7
	ble _08075F44
	ldr r1, [r5, #0x44]
	movs r0, #1
	negs r0, r0
	cmp r1, r0
	beq _0807603C
	movs r0, #0x80
	bl Sound_SetSEVolume
	b _08076066
_08075F9E:
	ldr r4, _08076048  @ gpAnimOnPopuProc
	ldr r0, _0807604C  @ ProcScr_ekrPopup
	movs r1, #3
	bl Proc_Start
	adds r5, r0, #0
	str r5, [r4]
	ldr r1, _08076050  @ gpEkrPopupEndFlag
	movs r0, #0
	str r0, [r1]
	strh r0, [r5, #0x2c]
	str r0, [r5, #0x48]
	str r0, [r5, #0x44]
	str r0, [r5, #0x50]
	str r0, [r5, #0x4c]
	ldr r0, _08076054  @ gBanimSomeObjPalIndex
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _08075FF4
	ldr r4, _08076058  @ gpEkrBattleUnitLeft
	ldr r0, [r4]
	bl HasBattleUnitGainedWeaponLevel
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _08075FDE
	ldr r0, [r4]
	adds r0, #0x4a
	ldrh r0, [r0]
	str r0, [r5, #0x44]
_08075FDE:
	ldr r0, [r4]
	bl DidBattleUnitBreakWeapon
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _08075FF4
	ldr r0, [r4]
	adds r0, #0x4a
	ldrh r0, [r0]
	str r0, [r5, #0x48]
_08075FF4:
	ldr r0, _08076054  @ gBanimSomeObjPalIndex
	movs r1, #2
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _0807602C
	ldr r4, _0807605C  @ gpEkrBattleUnitRight
	ldr r0, [r4]
	bl HasBattleUnitGainedWeaponLevel
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _08076016
	ldr r0, [r4]
	adds r0, #0x4a
	ldrh r0, [r0]
	str r0, [r5, #0x4c]
_08076016:
	ldr r0, [r4]
	bl DidBattleUnitBreakWeapon
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _0807602C
	ldr r0, [r4]
	adds r0, #0x4a
	ldrh r0, [r0]
	str r0, [r5, #0x50]
_0807602C:
	ldr r0, [r5, #0x44]
	ldr r1, [r5, #0x48]
	adds r0, r0, r1
	ldr r1, [r5, #0x4c]
	adds r0, r0, r1
	ldr r1, [r5, #0x50]
	cmn r0, r1
	bne _08076060
_0807603C:
	ldr r1, _08076050  @ gpEkrPopupEndFlag
	movs r0, #1
	str r0, [r1]
	bl DeleteAnimsOnPopup
	b _08076066
	.align 2, 0
_08076048: .4byte gpAnimOnPopuProc
_0807604C: .4byte ProcScr_ekrPopup
_08076050: .4byte gpEkrPopupEndFlag
_08076054: .4byte gBanimSomeObjPalIndex
_08076058: .4byte gpEkrBattleUnitLeft
_0807605C: .4byte gpEkrBattleUnitRight
_08076060:
	movs r0, #0x80
	bl Sound_SetSEVolume
_08076066:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END NewEkrPopup

	THUMB_FUNC_START BattlePopup_Wait16Frames
BattlePopup_Wait16Frames: @ 0x0807606C
	push {lr}
	adds r1, r0, #0
	ldrh r0, [r1, #0x2c]
	adds r0, #1
	strh r0, [r1, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x10
	ble _08076084
	adds r0, r1, #0
	bl Proc_Break
_08076084:
	pop {r0}
	bx r0

	THUMB_FUNC_END BattlePopup_Wait16Frames

	THUMB_FUNC_START ekrPopup_DrawWRankUp
ekrPopup_DrawWRankUp: @ 0x08076088
	push {r4, lr}
	adds r4, r0, #0
	ldr r2, [r4, #0x44]
	cmp r2, #0
	beq _080760A4
	movs r1, #0
	bl DrawBattlePopup
	bl sub_8075B58
	movs r0, #0
	strh r0, [r4, #0x2c]
	movs r0, #0x60
	strh r0, [r4, #0x2e]
_080760A4:
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END ekrPopup_DrawWRankUp

	THUMB_FUNC_START ekrPopup_WaitWRankUp
ekrPopup_WaitWRankUp: @ 0x080760B0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x44]
	cmp r0, #0
	bne _080760C2
	adds r0, r4, #0
	bl Proc_Break
	b _080760E4
_080760C2:
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x2e
	ldrsh r1, [r4, r2]
	cmp r0, r1
	ble _080760E4
	ldr r0, [r4, #0x60]
	bl AnimDelete
	bl ClearBG1
	adds r0, r4, #0
	bl Proc_Break
_080760E4:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END ekrPopup_WaitWRankUp

	THUMB_FUNC_START ekrPopup_DrawWRankUp2
ekrPopup_DrawWRankUp2: @ 0x080760EC
	push {r4, lr}
	adds r4, r0, #0
	ldr r2, [r4, #0x4c]
	cmp r2, #0
	beq _08076108
	movs r1, #0
	bl DrawBattlePopup
	bl sub_8075B58
	movs r0, #0
	strh r0, [r4, #0x2c]
	movs r0, #0x60
	strh r0, [r4, #0x2e]
_08076108:
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END ekrPopup_DrawWRankUp2

	THUMB_FUNC_START ekrPopup_WaitWRankUp2
ekrPopup_WaitWRankUp2: @ 0x08076114
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x4c]
	cmp r0, #0
	bne _08076126
	adds r0, r4, #0
	bl Proc_Break
	b _08076148
_08076126:
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x2e
	ldrsh r1, [r4, r2]
	cmp r0, r1
	ble _08076148
	ldr r0, [r4, #0x60]
	bl AnimDelete
	bl ClearBG1
	adds r0, r4, #0
	bl Proc_Break
_08076148:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END ekrPopup_WaitWRankUp2

	THUMB_FUNC_START ekrPopup_DrawWpnBroke
ekrPopup_DrawWpnBroke: @ 0x08076150
	push {r4, lr}
	adds r4, r0, #0
	ldr r2, [r4, #0x48]
	cmp r2, #0
	beq _0807616C
	movs r1, #1
	bl DrawBattlePopup
	bl sub_8075B68
	movs r0, #0
	strh r0, [r4, #0x2c]
	movs r0, #0x6c
	strh r0, [r4, #0x2e]
_0807616C:
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END ekrPopup_DrawWpnBroke

	THUMB_FUNC_START ekrPopup_WaitWpnBroke
ekrPopup_WaitWpnBroke: @ 0x08076178
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x48]
	cmp r0, #0
	bne _0807618A
	adds r0, r4, #0
	bl Proc_Break
	b _080761AC
_0807618A:
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x2e
	ldrsh r1, [r4, r2]
	cmp r0, r1
	ble _080761AC
	ldr r0, [r4, #0x60]
	bl AnimDelete
	bl ClearBG1
	adds r0, r4, #0
	bl Proc_Break
_080761AC:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END ekrPopup_WaitWpnBroke

	THUMB_FUNC_START ekrPopup_DrawWpnBroke2
ekrPopup_DrawWpnBroke2: @ 0x080761B4
	push {r4, lr}
	adds r4, r0, #0
	ldr r2, [r4, #0x50]
	cmp r2, #0
	beq _080761D0
	movs r1, #1
	bl DrawBattlePopup
	bl sub_8075B68
	movs r0, #0
	strh r0, [r4, #0x2c]
	movs r0, #0x6c
	strh r0, [r4, #0x2e]
_080761D0:
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END ekrPopup_DrawWpnBroke2

	THUMB_FUNC_START ekrPopup_WaitWpnBroke2
ekrPopup_WaitWpnBroke2: @ 0x080761DC
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x50]
	cmp r0, #0
	bne _080761EE
	adds r0, r4, #0
	bl Proc_Break
	b _08076214
_080761EE:
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x2e
	ldrsh r1, [r4, r2]
	cmp r0, r1
	ble _08076214
	movs r0, #0
	strh r0, [r4, #0x2c]
	ldr r0, [r4, #0x60]
	bl AnimDelete
	bl ClearBG1
	adds r0, r4, #0
	bl Proc_Break
_08076214:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END ekrPopup_WaitWpnBroke2

	THUMB_FUNC_START ekrPopup_MarkEnd
ekrPopup_MarkEnd: @ 0x0807621C
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x10
	ble _08076242
	ldr r0, _08076248  @ gpEkrPopupEndFlag
	movs r1, #1
	str r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #1
	bl Sound_SetSEVolume
	adds r0, r4, #0
	bl Proc_Break
_08076242:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08076248: .4byte gpEkrPopupEndFlag

	THUMB_FUNC_END ekrPopup_MarkEnd

	THUMB_FUNC_START nullsub_68
nullsub_68: @ 0x0807624C
	bx lr

	THUMB_FUNC_END nullsub_68

	THUMB_FUNC_START sub_8076250
sub_8076250: @ 0x08076250
	push {r4, lr}
	adds r4, r0, #0
	ldr r2, [r4, #0x44]
	movs r0, #1
	negs r0, r0
	cmp r2, r0
	bne _08076268
	adds r0, r4, #0
	movs r1, #1
	bl Proc_Goto
	b _08076288
_08076268:
	ldr r0, [r4, #0x4c]
	cmp r0, #0
	beq _08076282
	adds r0, r4, #0
	movs r1, #2
	bl DrawBattlePopup
	bl sub_8075B58
	movs r0, #0
	strh r0, [r4, #0x2c]
	movs r0, #0x60
	strh r0, [r4, #0x2e]
_08076282:
	adds r0, r4, #0
	bl Proc_Break
_08076288:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8076250

	THUMB_FUNC_START sub_8076290
sub_8076290: @ 0x08076290
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x50]
	cmp r0, #0
	bne _080762A2
	adds r0, r4, #0
	bl Proc_Break
	b _080762C8
_080762A2:
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x2e
	ldrsh r1, [r4, r2]
	cmp r0, r1
	ble _080762C8
	movs r0, #0
	strh r0, [r4, #0x2c]
	ldr r0, [r4, #0x60]
	bl AnimDelete
	bl ClearBG1
	adds r0, r4, #0
	bl Proc_Break
_080762C8:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8076290

	THUMB_FUNC_START sub_80762D0
sub_80762D0: @ 0x080762D0
	push {r4, lr}
	adds r4, r0, #0
	ldr r2, [r4, #0x48]
	movs r0, #1
	negs r0, r0
	cmp r2, r0
	bne _080762E8
	adds r0, r4, #0
	movs r1, #5
	bl Proc_Goto
	b _08076308
_080762E8:
	ldr r0, [r4, #0x4c]
	cmp r0, #0
	beq _08076302
	adds r0, r4, #0
	movs r1, #2
	bl DrawBattlePopup
	bl sub_8075B58
	movs r0, #0
	strh r0, [r4, #0x2c]
	movs r0, #0x60
	strh r0, [r4, #0x2e]
_08076302:
	adds r0, r4, #0
	bl Proc_Break
_08076308:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80762D0

	THUMB_FUNC_START CheckBanimHensei
CheckBanimHensei: @ 0x08076310
	push {lr}
	ldr r0, _08076324  @ gBattleStats
	ldrh r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	bne _08076328
	movs r0, #0
	b _0807632A
	.align 2, 0
_08076324: .4byte gBattleStats
_08076328:
	movs r0, #1
_0807632A:
	pop {r1}
	bx r1

	THUMB_FUNC_END CheckBanimHensei

	THUMB_FUNC_START BeginAnimsOnBattle_Hensei
BeginAnimsOnBattle_Hensei: @ 0x08076330
	push {lr}
	bl NewEkrBattleDeamon
	bl AnimClearAll
	bl GetEkrSomePosMaybe
	ldr r1, _08076350  @ gEkrPos2Maybe
	str r0, [r1]
	bl NewEkrHenseiInitPROC
	movs r0, #0
	bl SetPrimaryHBlankHandler
	pop {r0}
	bx r0
	.align 2, 0
_08076350: .4byte gEkrPos2Maybe

	THUMB_FUNC_END BeginAnimsOnBattle_Hensei

	THUMB_FUNC_START ExecEkrHenseiEnd
ExecEkrHenseiEnd: @ 0x08076354
	push {lr}
	bl AnimClearAll
	bl NewEkrHenseiEnd
	ldr r0, _08076368  @ MainUpdate_8055C68
	bl SetMainUpdateRoutine
	pop {r0}
	bx r0
	.align 2, 0
_08076368: .4byte MainUpdate_8055C68

	THUMB_FUNC_END ExecEkrHenseiEnd

	THUMB_FUNC_START NewEkrHenseiInitPROC
NewEkrHenseiInitPROC: @ 0x0807636C
	push {lr}
	ldr r0, _0807637C  @ ProcScr_ekrHenseiInit
	movs r1, #3
	bl Proc_Start
	pop {r0}
	bx r0
	.align 2, 0
_0807637C: .4byte ProcScr_ekrHenseiInit

	THUMB_FUNC_END NewEkrHenseiInitPROC

	THUMB_FUNC_START sub_8076380
sub_8076380: @ 0x08076380
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r0, #0
	bl SetupOAMBufferSplice
	bl EfxClearScreenFx
	bl UpdateBanimFrame
	bl NewEkrGauge
	bl NewEkrDispUP
	bl NewEkrBattle
	ldr r0, _080763D4  @ gEkrPairSomeTile
	movs r1, #0
	ldrsh r0, [r0, r1]
	subs r0, #1
	bl sub_8075AD8
	ldr r4, _080763D8  @ gPaletteBuffer
	ldr r1, _080763DC  @ gEkrBgPalBackupMaybe
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r4, #0
	bl CpuFastSet
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0x20
	movs r3, #0x10
	bl EkrMaybePalFadeWithVal
	bl EnablePaletteSync
	adds r0, r5, #0
	bl Proc_Break
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080763D4: .4byte gEkrPairSomeTile
_080763D8: .4byte gPaletteBuffer
_080763DC: .4byte gEkrBgPalBackupMaybe

	THUMB_FUNC_END sub_8076380

	THUMB_FUNC_START sub_80763E0
sub_80763E0: @ 0x080763E0
	push {r4, lr}
	adds r4, r0, #0
	bl EkrGauge_Set4C
	bl EkrDispUpSet4C
	movs r0, #0
	strh r0, [r4, #0x2c]
	movs r0, #0x10
	strh r0, [r4, #0x2e]
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80763E0

	THUMB_FUNC_START sub_8076400
sub_8076400: @ 0x08076400
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	movs r0, #0x2c
	ldrsh r3, [r6, r0]
	movs r1, #0x2e
	ldrsh r0, [r6, r1]
	str r0, [sp]
	movs r0, #0
	movs r1, #0x10
	movs r2, #0
	bl Interpolate
	adds r5, r0, #0
	ldr r0, _0807645C  @ gEkrBgPalBackupMaybe
	ldr r4, _08076460  @ gPaletteBuffer
	movs r2, #0x80
	lsls r2, r2, #1
	adds r1, r4, #0
	bl CpuFastSet
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0x20
	adds r3, r5, #0
	bl EkrMaybePalFadeWithVal
	bl EnablePaletteSync
	ldrh r1, [r6, #0x2c]
	adds r1, #1
	strh r1, [r6, #0x2c]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r2, #0x2e
	ldrsh r0, [r6, r2]
	adds r0, #1
	cmp r1, r0
	bne _08076454
	adds r0, r6, #0
	bl Proc_Break
_08076454:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807645C: .4byte gEkrBgPalBackupMaybe
_08076460: .4byte gPaletteBuffer

	THUMB_FUNC_END sub_8076400

	THUMB_FUNC_START sub_8076464
sub_8076464: @ 0x08076464
	push {lr}
	bl Proc_Break
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8076464

	THUMB_FUNC_START NewEkrHenseiEnd
NewEkrHenseiEnd: @ 0x08076470
	push {lr}
	ldr r0, _08076480  @ ProcScr_ekrHenseiEnd
	movs r1, #3
	bl Proc_Start
	pop {r0}
	bx r0
	.align 2, 0
_08076480: .4byte ProcScr_ekrHenseiEnd

	THUMB_FUNC_END NewEkrHenseiEnd

	THUMB_FUNC_START sub_8076484
sub_8076484: @ 0x08076484
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080764A8  @ gPaletteBuffer
	ldr r1, _080764AC  @ gEkrBgPalBackupMaybe
	movs r2, #0x80
	lsls r2, r2, #1
	bl CpuFastSet
	movs r0, #0
	strh r0, [r4, #0x2c]
	movs r0, #0x10
	strh r0, [r4, #0x2e]
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080764A8: .4byte gPaletteBuffer
_080764AC: .4byte gEkrBgPalBackupMaybe

	THUMB_FUNC_END sub_8076484

	THUMB_FUNC_START sub_80764B0
sub_80764B0: @ 0x080764B0
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	movs r0, #0x2c
	ldrsh r3, [r6, r0]
	movs r1, #0x2e
	ldrsh r0, [r6, r1]
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0x10
	bl Interpolate
	adds r5, r0, #0
	ldr r0, _0807650C  @ gEkrBgPalBackupMaybe
	ldr r4, _08076510  @ gPaletteBuffer
	movs r2, #0x80
	lsls r2, r2, #1
	adds r1, r4, #0
	bl CpuFastSet
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0x20
	adds r3, r5, #0
	bl EkrMaybePalFadeWithVal
	bl EnablePaletteSync
	ldrh r1, [r6, #0x2c]
	adds r1, #1
	strh r1, [r6, #0x2c]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r2, #0x2e
	ldrsh r0, [r6, r2]
	adds r0, #1
	cmp r1, r0
	bne _08076504
	adds r0, r6, #0
	bl Proc_Break
_08076504:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807650C: .4byte gEkrBgPalBackupMaybe
_08076510: .4byte gPaletteBuffer

	THUMB_FUNC_END sub_80764B0

	THUMB_FUNC_START sub_8076514
sub_8076514: @ 0x08076514
	push {r4, lr}
	adds r4, r0, #0
	bl EndEkrBattleDeamon
	bl EndEkrGauge
	ldr r0, _08076538  @ OnGameLoopMain
	bl SetMainUpdateRoutine
	ldr r0, _0807653C  @ OnVBlank
	bl SetInterrupt_LCDVBlank
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08076538: .4byte OnGameLoopMain
_0807653C: .4byte OnVBlank

	THUMB_FUNC_END sub_8076514

.align 2, 0
