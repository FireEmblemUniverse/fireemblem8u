	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	@ Everything related to that small window that pops up when you're selecting another unit for an action
	@ Such as healing, stealing, hammerning (I may be wrong on some of that but you got what this is)

	THUMB_FUNC_START sub_803471C
sub_803471C: @ 0x0803471C
	push {r4, r5, r6, lr}
	sub sp, #0xc
	adds r4, r0, #0
	ldr r1, _08034788  @ gUnknown_080D7F8C
	add r0, sp, #4
	movs r2, #6
	bl memcpy
	adds r0, r4, #0
	adds r0, #0x60
	ldrb r0, [r0]
	adds r2, r4, #0
	adds r2, #0x62
	lsls r0, r0, #3
	ldrb r2, [r2]
	adds r6, r0, r2
	adds r0, r4, #0
	adds r0, #0x61
	ldrb r0, [r0]
	adds r0, #1
	lsls r5, r0, #3
	ldr r2, [r4, #0x2c]
	ldr r0, [r2, #0xc]
	movs r1, #0x20
	ands r0, r1
	cmp r0, #0
	beq _08034790
	bl GetGameClock
	movs r1, #0x1f
	ands r1, r0
	cmp r1, #0x13
	bhi _0803479E
	adds r1, r6, #0
	adds r1, #9
	adds r2, r5, #7
	ldr r3, _0803478C  @ gObject_8x8
	ldr r0, [r4, #0x2c]
	ldrb r0, [r0, #0x1b]
	lsrs r0, r0, #6
	lsls r0, r0, #1
	add r0, sp
	adds r0, #4
	ldrh r4, [r0]
	movs r0, #0xf
	ands r0, r4
	lsls r0, r0, #0xc
	adds r0, #3
	str r0, [sp]
	movs r0, #2
	bl PutSprite
	b _0803479E
	.align 2, 0
_08034788: .4byte gUnknown_080D7F8C
_0803478C: .4byte gObject_8x8
_08034790:
	str r2, [sp]
	movs r0, #2
	adds r1, r6, #0
	adds r2, r5, #0
	movs r3, #0
	bl sub_8027E4C
_0803479E:
	add sp, #0xc
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_803471C

	THUMB_FUNC_START NewUnitInfoWindow
NewUnitInfoWindow: @ 0x080347A8
	push {r4, lr}
	adds r1, r0, #0
	ldr r0, _080347D0  @ gUnknown_0859E13C
	bl Proc_Start
	adds r4, r0, #0
	adds r0, #0x30
	movs r1, #6
	bl Text_Allocate
	bl ResetIconGraphics
	movs r0, #4
	bl LoadIconPalettes
	adds r0, r4, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080347D0: .4byte gUnknown_0859E13C

	THUMB_FUNC_END NewUnitInfoWindow

	THUMB_FUNC_START UnitInfoWindow_PositionUnitName
UnitInfoWindow_PositionUnitName: @ 0x080347D4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x2c]
	ldr r0, [r0]
	ldrh r0, [r0]
	bl GetStringFromIndex
	bl GetStringTextWidth
	cmp r0, #0x27
	bgt _080347FA
	adds r2, r4, #0
	adds r2, #0x62
	movs r0, #4
	strb r0, [r2]
	adds r1, r4, #0
	adds r1, #0x63
	movs r0, #0x18
	b _08034808
_080347FA:
	adds r2, r4, #0
	adds r2, #0x62
	movs r0, #0
	strb r0, [r2]
	adds r1, r4, #0
	adds r1, #0x63
	movs r0, #0x10
_08034808:
	strb r0, [r1]
	ldr r0, [r4, #0x2c]
	ldr r0, [r0, #4]
	ldrb r0, [r0, #4]
	cmp r0, #0x66
	bne _0803481A
	ldrb r0, [r1]
	adds r0, #6
	b _08034828
_0803481A:
	cmp r0, #0x3b
	bne _0803482A
	ldrb r0, [r2]
	subs r0, #3
	strb r0, [r2]
	ldrb r0, [r1]
	adds r0, #3
_08034828:
	strb r0, [r1]
_0803482A:
	ldrb r0, [r2]
	adds r0, #8
	strb r0, [r2]
	ldrb r0, [r1]
	subs r0, #0x10
	strb r0, [r1]
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END UnitInfoWindow_PositionUnitName

	THUMB_FUNC_START UnitInfoWindow_DrawBase
UnitInfoWindow_DrawBase: @ 0x0803483C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x20
	mov r8, r0
	str r1, [sp, #4]
	adds r7, r2, #0
	mov r9, r3
	ldr r6, [sp, #0x40]
	cmp r0, #0
	bne _08034862
	ldr r0, _080349C0  @ gUnknown_0859E13C
	bl Proc_Find
	mov r8, r0
	bl ClearBg0Bg1
_08034862:
	ldr r0, [sp, #4]
	mov r1, r8
	str r0, [r1, #0x2c]
	mov r0, r8
	adds r0, #0x60
	strb r7, [r0]
	adds r0, #1
	mov r2, r9
	strb r2, [r0]
	mov r5, r9
	adds r5, #2
	ldr r3, [sp, #0x44]
	lsls r3, r3, #1
	adds r3, #2
	movs r0, #3
	str r0, [sp]
	adds r0, r7, #0
	adds r1, r5, #0
	adds r2, r6, #0
	bl DrawUiFrame2
	mov r3, r9
	lsls r4, r3, #5
	adds r0, r4, r7
	lsls r0, r0, #1
	ldr r1, _080349C4  @ gBG1TilemapBuffer
	mov sl, r1
	add r0, sl
	ldr r1, _080349C8  @ gUnknown_08A173EC
	movs r2, #0x80
	lsls r2, r2, #5
	bl CallARM_FillTileRect
	str r5, [sp, #0x14]
	str r4, [sp, #0x18]
	mov r2, r9
	adds r2, #1
	str r2, [sp, #0x10]
	mov r3, r8
	adds r3, #0x30
	str r3, [sp, #0xc]
	mov r4, r8
	adds r4, #0x63
	str r4, [sp, #0x1c]
	cmp r6, #0xa
	ble _0803496C
	adds r2, r7, #0
	adds r2, #8
	adds r0, r7, r6
	subs r1, r0, #1
	mov r6, sl
	mov sl, r0
	cmp r2, r1
	bge _08034914
	str r1, [sp, #8]
	lsls r1, r2, #1
	lsls r0, r5, #6
	adds r0, r0, r6
	adds r5, r1, r0
	ldr r3, [sp, #0x10]
	lsls r0, r3, #6
	adds r0, r0, r6
	adds r4, r1, r0
	ldr r3, _080349CC  @ gUnknown_080D7F92
	movs r0, #3
	negs r0, r0
	add r0, sl
	mov ip, r0
	mov r0, r9
	lsls r0, r0, #6
	mov r9, r0
	add r9, r6
	add r1, r9
_080348F4:
	cmp r2, ip
	blt _080348FA
	adds r3, #2
_080348FA:
	ldrh r0, [r3]
	strh r0, [r1]
	ldrh r0, [r3, #8]
	strh r0, [r4]
	ldrh r0, [r3, #0x10]
	strh r0, [r5]
	adds r5, #2
	adds r4, #2
	adds r1, #2
	adds r2, #1
	ldr r0, [sp, #8]
	cmp r2, r0
	blt _080348F4
_08034914:
	ldr r0, [sp, #0x18]
	adds r0, #7
	adds r0, r0, r7
	lsls r0, r0, #1
	adds r0, r0, r6
	ldr r2, _080349CC  @ gUnknown_080D7F92
	ldrh r1, [r2]
	strh r1, [r0]
	ldr r4, [sp, #0x10]
	lsls r3, r4, #5
	adds r0, r3, #7
	adds r0, r0, r7
	lsls r0, r0, #1
	adds r0, r0, r6
	ldrh r1, [r2, #8]
	strh r1, [r0]
	ldr r0, [sp, #0x14]
	lsls r2, r0, #5
	adds r0, r2, #7
	adds r0, r0, r7
	lsls r0, r0, #1
	adds r0, r0, r6
	ldr r4, _080349CC  @ gUnknown_080D7F92
	ldrh r1, [r4, #0x10]
	strh r1, [r0]
	ldr r0, [sp, #0x18]
	subs r0, #1
	add r0, sl
	lsls r0, r0, #1
	adds r0, r0, r6
	ldrh r1, [r4, #6]
	strh r1, [r0]
	subs r3, #1
	add r3, sl
	lsls r3, r3, #1
	adds r3, r3, r6
	ldrh r0, [r4, #0xe]
	strh r0, [r3]
	subs r2, #1
	add r2, sl
	lsls r2, r2, #1
	adds r2, r2, r6
	ldrh r0, [r4, #0x16]
	strh r0, [r2]
_0803496C:
	ldr r0, [sp, #0xc]
	bl Text_Clear
	mov r0, r8
	bl UnitInfoWindow_PositionUnitName
	ldr r0, [sp, #0x1c]
	ldrb r1, [r0]
	ldr r0, [sp, #0xc]
	bl Text_SetXCursor
	ldr r1, [sp, #4]
	ldr r0, [r1]
	ldrh r0, [r0]
	bl GetStringFromIndex
	adds r1, r0, #0
	ldr r0, [sp, #0xc]
	bl Text_AppendString
	ldr r2, [sp, #0x10]
	lsls r1, r2, #5
	adds r1, #3
	adds r1, r1, r7
	lsls r1, r1, #1
	ldr r0, _080349D0  @ gBG0TilemapBuffer
	adds r1, r1, r0
	ldr r0, [sp, #0xc]
	bl Text_Draw
	movs r0, #3
	bl BG_EnableSyncByMask
	mov r0, r8
	add sp, #0x20
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080349C0: .4byte gUnknown_0859E13C
_080349C4: .4byte gBG1TilemapBuffer
_080349C8: .4byte gUnknown_08A173EC
_080349CC: .4byte gUnknown_080D7F92
_080349D0: .4byte gBG0TilemapBuffer

	THUMB_FUNC_END UnitInfoWindow_DrawBase

	THUMB_FUNC_START GetUnitInfoWindowX
GetUnitInfoWindowX: @ 0x080349D4
	push {lr}
	adds r2, r1, #0
	ldrb r0, [r0, #0x10]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #4
	ldr r1, _080349F0  @ gUnknown_0202BCB0
	movs r3, #0xc
	ldrsh r1, [r1, r3]
	subs r0, r0, r1
	cmp r0, #0x77
	ble _080349F4
	movs r0, #0
	b _080349F8
	.align 2, 0
_080349F0: .4byte gUnknown_0202BCB0
_080349F4:
	movs r0, #0x1e
	subs r0, r0, r2
_080349F8:
	pop {r1}
	bx r1

	THUMB_FUNC_END GetUnitInfoWindowX

	THUMB_FUNC_START sub_80349FC
sub_80349FC: @ 0x080349FC
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	bl Text_Clear
	ldr r0, _08034A54  @ 0x000004E9
	bl GetStringFromIndex
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0
	movs r2, #3
	bl Text_InsertString
	ldr r0, _08034A58  @ 0x00000539
	bl GetStringFromIndex
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x28
	movs r2, #3
	bl Text_InsertString
	adds r0, r5, #0
	bl GetUnitCurrentHp
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x20
	movs r2, #2
	bl Text_InsertNumberOr2Dashes
	adds r0, r5, #0
	bl GetUnitMaxHp
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x38
	movs r2, #2
	bl Text_InsertNumberOr2Dashes
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08034A54: .4byte 0x000004E9
_08034A58: .4byte 0x00000539

	THUMB_FUNC_END sub_80349FC

	THUMB_FUNC_START sub_8034A5C
sub_8034A5C: @ 0x08034A5C
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	bl Text_Clear
	ldr r0, _08034AA0  @ 0x000004F7
	bl GetStringFromIndex
	adds r3, r0, #0
	adds r0, r5, #0
	movs r1, #0
	movs r2, #3
	bl Text_InsertString
	ldr r0, [r4, #4]
	movs r3, #0x11
	ldrsb r3, [r0, r3]
	ldr r0, [r4]
	ldrb r0, [r0, #0x13]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r3, r3, r0
	movs r0, #0x1a
	ldrsb r0, [r4, r0]
	adds r3, r3, r0
	adds r0, r5, #0
	movs r1, #0x38
	movs r2, #2
	bl Text_InsertNumberOr2Dashes
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08034AA0: .4byte 0x000004F7

	THUMB_FUNC_END sub_8034A5C

	THUMB_FUNC_START sub_8034AA4
sub_8034AA4: @ 0x08034AA4
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	bl Text_Clear
	movs r0, #0x9f
	lsls r0, r0, #3
	bl GetStringFromIndex
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0
	movs r2, #3
	bl Text_InsertString
	adds r0, r5, #0
	bl GetUnitAid
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x38
	movs r2, #2
	bl Text_InsertNumberOr2Dashes
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8034AA4

	THUMB_FUNC_START sub_8034ADC
sub_8034ADC: @ 0x08034ADC
	push {r4, lr}
	lsls r4, r2, #5
	adds r4, #4
	adds r4, r4, r1
	lsls r4, r4, #1
	ldr r1, _08034B0C  @ gBG0TilemapBuffer
	adds r4, r4, r1
	ldr r1, [r0]
	ldr r2, [r0, #4]
	ldr r0, [r1, #0x28]
	ldr r1, [r2, #0x28]
	orrs r0, r1
	bl GetUnitAidIconId
	adds r1, r0, #0
	movs r2, #0xa0
	lsls r2, r2, #7
	adds r0, r4, #0
	bl DrawIcon
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08034B0C: .4byte gBG0TilemapBuffer

	THUMB_FUNC_END sub_8034ADC

	THUMB_FUNC_START sub_8034B10
sub_8034B10: @ 0x08034B10
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	bl Text_Clear
	ldr r0, _08034B44  @ 0x000004FA
	bl GetStringFromIndex
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0
	movs r2, #3
	bl Text_InsertString
	adds r0, r5, #0
	bl GetUnitStatusName
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x18
	movs r2, #2
	bl Text_InsertString
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08034B44: .4byte 0x000004FA

	THUMB_FUNC_END sub_8034B10

	THUMB_FUNC_START sub_8034B48
sub_8034B48: @ 0x08034B48
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	bl Text_Clear
	movs r0, #0x9e
	lsls r0, r0, #3
	bl GetStringFromIndex
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0
	movs r2, #3
	bl Text_InsertString
	ldr r0, _08034BA8  @ 0x0000053A
	bl GetStringFromIndex
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x28
	movs r2, #3
	bl Text_InsertString
	adds r0, r5, #0
	bl GetUnitResistance
	adds r3, r0, #0
	adds r3, r3, r6
	adds r0, r4, #0
	movs r1, #0x38
	movs r2, #2
	bl Text_InsertNumberOr2Dashes
	adds r0, r5, #0
	bl GetUnitResistance
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x20
	movs r2, #2
	bl Text_InsertNumberOr2Dashes
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08034BA8: .4byte 0x0000053A

	THUMB_FUNC_END sub_8034B48

	THUMB_FUNC_START sub_8034BAC
sub_8034BAC: @ 0x08034BAC
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	bl Text_Clear
	movs r0, #0x9e
	lsls r0, r0, #3
	bl GetStringFromIndex
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0
	movs r2, #3
	bl Text_InsertString
	adds r0, r5, #0
	bl GetUnitResistance
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x38
	movs r2, #2
	bl Text_InsertNumberOr2Dashes
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8034BAC

	THUMB_FUNC_START sub_8034BE4
sub_8034BE4: @ 0x08034BE4
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	bl Text_Clear
	ldr r0, _08034C14  @ 0x000004F4
	bl GetStringFromIndex
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0
	movs r2, #3
	bl Text_InsertString
	adds r0, r4, #0
	movs r1, #0x38
	movs r2, #2
	adds r3, r5, #0
	bl Text_InsertNumberOr2Dashes
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08034C14: .4byte 0x000004F4

	THUMB_FUNC_END sub_8034BE4

	THUMB_FUNC_START NewUnitInfoWindow_WithAllLines
NewUnitInfoWindow_WithAllLines: @ 0x08034C18
	push {r4, r5, lr}
	bl NewUnitInfoWindow
	adds r4, r0, #0
	adds r4, #0x38
	movs r5, #4
_08034C24:
	adds r0, r4, #0
	movs r1, #7
	bl Text_Allocate
	adds r4, #8
	subs r5, #1
	cmp r5, #0
	bge _08034C24
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END NewUnitInfoWindow_WithAllLines

	THUMB_FUNC_START sub_8034C3C
sub_8034C3C: @ 0x08034C3C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	str r0, [sp, #8]
	bl GetUnitItemCount
	mov sl, r0
	ldr r0, [sp, #8]
	movs r1, #0xd
	bl GetUnitInfoWindowX
	adds r5, r0, #0
	movs r0, #0xd
	str r0, [sp]
	mov r0, sl
	str r0, [sp, #4]
	cmp r0, #0
	bne _08034C6A
	movs r0, #1
	str r0, [sp, #4]
_08034C6A:
	movs r0, #0
	ldr r1, [sp, #8]
	adds r2, r5, #0
	movs r3, #0
	bl UnitInfoWindow_DrawBase
	adds r4, r0, #0
	mov r0, sl
	cmp r0, #0
	bne _08034CB0
	adds r4, #0x38
	adds r0, r4, #0
	bl Text_Clear
	movs r0, #0xb5
	lsls r0, r0, #3
	bl GetStringFromIndex
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0
	movs r2, #1
	bl Text_InsertString
	adds r1, r5, #0
	adds r1, #0x63
	lsls r1, r1, #1
	ldr r0, _08034CAC  @ gBG0TilemapBuffer
	adds r1, r1, r0
	adds r0, r4, #0
	bl Text_Draw
	b _08034D34
	.align 2, 0
_08034CAC: .4byte gBG0TilemapBuffer
_08034CB0:
	movs r0, #0
	mov r9, r0
	cmp r9, sl
	bge _08034D34
	ldr r3, _08034D44  @ gBG0TilemapBuffer
	adds r2, r5, #0
	adds r2, #0x61
	adds r1, r5, #0
	adds r1, #0x6b
	adds r0, r5, #0
	adds r0, #0x63
	adds r5, r4, #0
	adds r5, #0x38
	lsls r0, r0, #1
	adds r0, r0, r3
	mov r8, r0
	lsls r1, r1, #1
	adds r7, r1, r3
	lsls r2, r2, #1
	adds r6, r2, r3
_08034CD8:
	mov r0, r9
	lsls r1, r0, #1
	ldr r0, [sp, #8]
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r4, [r0]
	adds r0, r5, #0
	bl Text_Clear
	adds r0, r4, #0
	bl GetItemName
	adds r1, r0, #0
	adds r0, r5, #0
	bl Text_AppendString
	adds r0, r5, #0
	mov r1, r8
	bl Text_Draw
	adds r0, r4, #0
	bl GetItemUses
	adds r2, r0, #0
	adds r0, r7, #0
	movs r1, #2
	bl DrawDecNumber
	adds r0, r4, #0
	bl GetItemIconId
	adds r1, r0, #0
	adds r0, r6, #0
	movs r2, #0x80
	lsls r2, r2, #7
	bl DrawIcon
	adds r6, #0x80
	adds r7, #0x80
	movs r0, #0x80
	add r8, r0
	adds r5, #8
	movs r0, #1
	add r9, r0
	cmp r9, sl
	blt _08034CD8
_08034D34:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08034D44: .4byte gBG0TilemapBuffer

	THUMB_FUNC_END sub_8034C3C

	THUMB_FUNC_START sub_8034D48
sub_8034D48: @ 0x08034D48
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x20
	str r0, [sp, #8]
	bl GetUnitItemCount
	str r0, [sp, #0xc]
	ldr r0, [sp, #8]
	movs r1, #0xd
	bl GetUnitInfoWindowX
	str r0, [sp, #0x10]
	movs r0, #0xd
	str r0, [sp]
	ldr r0, [sp, #0xc]
	str r0, [sp, #4]
	movs r0, #0
	ldr r1, [sp, #8]
	ldr r2, [sp, #0x10]
	movs r3, #0
	bl UnitInfoWindow_DrawBase
	movs r1, #0
	mov sl, r1
	ldr r1, [sp, #0xc]
	cmp sl, r1
	bge _08034E46
	ldr r1, [sp, #0x10]
	adds r1, #0x6b
	str r1, [sp, #0x14]
	ldr r1, [sp, #0x10]
	adds r1, #0x63
	str r1, [sp, #0x18]
	movs r1, #0x60
	str r1, [sp, #0x1c]
	adds r7, r0, #0
	adds r7, #0x38
_08034D98:
	mov r1, sl
	lsls r0, r1, #1
	ldr r1, [sp, #8]
	adds r1, #0x1e
	adds r1, r1, r0
	ldrh r6, [r1]
	adds r0, r6, #0
	bl IsItemStealable
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	adds r0, r7, #0
	bl Text_Clear
	movs r1, #0
	lsls r4, r4, #0x18
	asrs r4, r4, #0x18
	mov r9, r4
	cmp r4, #0
	bne _08034DC4
	movs r1, #1
_08034DC4:
	adds r0, r7, #0
	bl Text_SetColorId
	adds r0, r6, #0
	bl GetItemName
	adds r1, r0, #0
	adds r0, r7, #0
	bl Text_AppendString
	ldr r0, [sp, #0x18]
	lsls r1, r0, #1
	ldr r0, _08034E58  @ gBG0TilemapBuffer
	mov r8, r0
	add r1, r8
	adds r0, r7, #0
	bl Text_Draw
	ldr r1, [sp, #0x14]
	lsls r0, r1, #1
	mov r1, r8
	adds r4, r0, r1
	movs r5, #1
	mov r0, r9
	cmp r0, #0
	beq _08034DFA
	movs r5, #2
_08034DFA:
	adds r0, r6, #0
	bl GetItemUses
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	bl DrawDecNumber
	ldr r4, [sp, #0x1c]
	adds r4, #1
	ldr r1, [sp, #0x10]
	adds r4, r4, r1
	lsls r4, r4, #1
	add r4, r8
	adds r0, r6, #0
	bl GetItemIconId
	adds r1, r0, #0
	adds r0, r4, #0
	movs r2, #0x80
	lsls r2, r2, #7
	bl DrawIcon
	ldr r0, [sp, #0x14]
	adds r0, #0x40
	str r0, [sp, #0x14]
	ldr r1, [sp, #0x18]
	adds r1, #0x40
	str r1, [sp, #0x18]
	ldr r0, [sp, #0x1c]
	adds r0, #0x40
	str r0, [sp, #0x1c]
	adds r7, #8
	movs r1, #1
	add sl, r1
	ldr r0, [sp, #0xc]
	cmp sl, r0
	blt _08034D98
_08034E46:
	add sp, #0x20
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08034E58: .4byte gBG0TilemapBuffer

	THUMB_FUNC_END sub_8034D48

	THUMB_FUNC_START DrawHammerneUnitInfoWindow
DrawHammerneUnitInfoWindow: @ 0x08034E5C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x1c
	str r0, [sp, #8]
	bl GetUnitItemCount
	str r0, [sp, #0x10]
	ldr r0, [sp, #8]
	movs r1, #0x10
	bl GetUnitInfoWindowX
	mov r9, r0
	movs r0, #0x10
	str r0, [sp]
	ldr r0, [sp, #0x10]
	str r0, [sp, #4]
	movs r0, #0
	ldr r1, [sp, #8]
	mov r2, r9
	movs r3, #0
	bl UnitInfoWindow_DrawBase
	movs r1, #0
	str r1, [sp, #0xc]
	ldr r2, [sp, #0x10]
	cmp r1, r2
	bge _08034F80
	mov r1, r9
	adds r1, #0x6c
	str r1, [sp, #0x14]
	mov r2, r9
	adds r2, #0x63
	str r2, [sp, #0x18]
	movs r1, #0x60
	mov sl, r1
	adds r7, r0, #0
	adds r7, #0x38
_08034EAC:
	ldr r2, [sp, #0xc]
	lsls r0, r2, #1
	ldr r1, [sp, #8]
	adds r1, #0x1e
	adds r1, r1, r0
	ldrh r6, [r1]
	adds r0, r6, #0
	bl IsItemHammernable
	movs r5, #0
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08034EC8
	movs r5, #1
_08034EC8:
	adds r0, r7, #0
	bl Text_Clear
	adds r0, r7, #0
	adds r1, r5, #0
	bl Text_SetColorId
	adds r0, r6, #0
	bl GetItemName
	adds r1, r0, #0
	adds r0, r7, #0
	bl Text_AppendString
	ldr r0, [sp, #0x18]
	lsls r1, r0, #1
	ldr r2, _08034F98  @ gBG0TilemapBuffer
	mov r8, r2
	add r1, r8
	adds r0, r7, #0
	bl Text_Draw
	ldr r1, [sp, #0x14]
	lsls r0, r1, #1
	add r0, r8
	adds r1, r5, #0
	movs r2, #0x16
	bl sub_8004B0C
	adds r0, r6, #0
	bl IsItemHammernable
	lsls r0, r0, #0x18
	movs r5, #1
	cmp r0, #0
	beq _08034F12
	movs r5, #2
_08034F12:
	mov r4, sl
	adds r4, #0xb
	add r4, r9
	lsls r4, r4, #1
	add r4, r8
	adds r0, r6, #0
	bl GetItemUses
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	bl DrawDecNumber
	mov r4, sl
	adds r4, #0xe
	add r4, r9
	lsls r4, r4, #1
	add r4, r8
	adds r0, r6, #0
	bl GetItemMaxUses
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	bl DrawDecNumber
	mov r4, sl
	adds r4, #1
	add r4, r9
	lsls r4, r4, #1
	add r4, r8
	adds r0, r6, #0
	bl GetItemIconId
	adds r1, r0, #0
	adds r0, r4, #0
	movs r2, #0x80
	lsls r2, r2, #7
	bl DrawIcon
	ldr r2, [sp, #0x14]
	adds r2, #0x40
	str r2, [sp, #0x14]
	ldr r0, [sp, #0x18]
	adds r0, #0x40
	str r0, [sp, #0x18]
	movs r1, #0x40
	add sl, r1
	adds r7, #8
	ldr r2, [sp, #0xc]
	adds r2, #1
	str r2, [sp, #0xc]
	ldr r0, [sp, #0x10]
	cmp r2, r0
	blt _08034EAC
_08034F80:
	movs r0, #3
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
_08034F98: .4byte gBG0TilemapBuffer

	THUMB_FUNC_END DrawHammerneUnitInfoWindow

	THUMB_FUNC_START sub_8034F9C
sub_8034F9C: @ 0x08034F9C
	push {lr}
	bl NewUnitInfoWindow
	adds r0, #0x38
	movs r1, #8
	bl Text_Allocate
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8034F9C

	THUMB_FUNC_START sub_8034FB0
sub_8034FB0: @ 0x08034FB0
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r6, r0, #0
	movs r1, #0xa
	bl GetUnitInfoWindowX
	adds r4, r0, #0
	movs r0, #0xa
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	movs r0, #0
	adds r1, r6, #0
	adds r2, r4, #0
	movs r3, #0
	bl UnitInfoWindow_DrawBase
	adds r5, r0, #0
	adds r5, #0x38
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_80349FC
	adds r4, #0x61
	lsls r4, r4, #1
	ldr r0, _08034FF8  @ gBG0TilemapBuffer
	adds r4, r4, r0
	adds r0, r5, #0
	adds r1, r4, #0
	bl Text_Draw
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08034FF8: .4byte gBG0TilemapBuffer

	THUMB_FUNC_END sub_8034FB0

	THUMB_FUNC_START sub_8034FFC
sub_8034FFC: @ 0x08034FFC
	push {r4, lr}
	bl NewUnitInfoWindow
	adds r4, r0, #0
	adds r0, #0x38
	movs r1, #8
	bl Text_Allocate
	adds r4, #0x40
	adds r0, r4, #0
	movs r1, #8
	bl Text_Allocate
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8034FFC

	THUMB_FUNC_START sub_803501C
sub_803501C: @ 0x0803501C
	push {r4, r5, r6, lr}
	mov r6, r9
	mov r5, r8
	push {r5, r6}
	sub sp, #8
	mov r8, r0
	movs r1, #0xa
	bl GetUnitInfoWindowX
	adds r4, r0, #0
	movs r0, #0xa
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	movs r0, #0
	mov r1, r8
	adds r2, r4, #0
	movs r3, #0
	bl UnitInfoWindow_DrawBase
	adds r5, r0, #0
	adds r6, r5, #0
	adds r6, #0x38
	adds r0, r6, #0
	mov r1, r8
	bl sub_80349FC
	adds r1, r4, #0
	adds r1, #0x61
	lsls r1, r1, #1
	ldr r0, _0803508C  @ gBG0TilemapBuffer
	mov r9, r0
	add r1, r9
	adds r0, r6, #0
	bl Text_Draw
	adds r5, #0x40
	adds r0, r5, #0
	mov r1, r8
	bl sub_8034B10
	adds r4, #0xa1
	lsls r4, r4, #1
	add r4, r9
	adds r0, r5, #0
	adds r1, r4, #0
	bl Text_Draw
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0803508C: .4byte gBG0TilemapBuffer

	THUMB_FUNC_END sub_803501C

	THUMB_FUNC_START sub_8035090
sub_8035090: @ 0x08035090
	push {lr}
	bl NewUnitInfoWindow
	adds r0, #0x38
	movs r1, #8
	bl Text_Allocate
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8035090

	THUMB_FUNC_START sub_80350A4
sub_80350A4: @ 0x080350A4
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r6, r0, #0
	movs r1, #0xa
	bl GetUnitInfoWindowX
	adds r4, r0, #0
	movs r0, #0xa
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	movs r0, #0
	adds r1, r6, #0
	adds r2, r4, #0
	movs r3, #0
	bl UnitInfoWindow_DrawBase
	adds r5, r0, #0
	adds r5, #0x38
	adds r0, r6, #0
	adds r0, #0x31
	ldrb r0, [r0]
	lsrs r0, r0, #4
	movs r2, #7
	subs r2, r2, r0
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_8034B48
	adds r4, #0x61
	lsls r4, r4, #1
	ldr r0, _080350F8  @ gBG0TilemapBuffer
	adds r4, r4, r0
	adds r0, r5, #0
	adds r1, r4, #0
	bl Text_Draw
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080350F8: .4byte gBG0TilemapBuffer

	THUMB_FUNC_END sub_80350A4

	THUMB_FUNC_START sub_80350FC
sub_80350FC: @ 0x080350FC
	push {r4, lr}
	bl NewUnitInfoWindow
	adds r4, r0, #0
	adds r0, #0x38
	movs r1, #8
	bl Text_Allocate
	adds r4, #0x40
	adds r0, r4, #0
	movs r1, #8
	bl Text_Allocate
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80350FC

	THUMB_FUNC_START sub_803511C
sub_803511C: @ 0x0803511C
	push {r4, r5, r6, lr}
	mov r6, r9
	mov r5, r8
	push {r5, r6}
	sub sp, #8
	adds r6, r0, #0
	mov r9, r1
	movs r1, #0xa
	bl GetUnitInfoWindowX
	adds r4, r0, #0
	movs r0, #0xa
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	movs r0, #0
	adds r1, r6, #0
	adds r2, r4, #0
	movs r3, #0
	bl UnitInfoWindow_DrawBase
	adds r5, r0, #0
	movs r0, #0x38
	adds r0, r0, r5
	mov r8, r0
	adds r0, r6, #0
	adds r0, #0x31
	ldrb r0, [r0]
	lsrs r0, r0, #4
	movs r2, #7
	subs r2, r2, r0
	mov r0, r8
	adds r1, r6, #0
	bl sub_8034BAC
	adds r1, r4, #0
	adds r1, #0x61
	lsls r1, r1, #1
	ldr r6, _08035198  @ gBG0TilemapBuffer
	adds r1, r1, r6
	mov r0, r8
	bl Text_Draw
	adds r5, #0x40
	adds r0, r5, #0
	mov r1, r9
	bl sub_8034BE4
	adds r4, #0xa1
	lsls r4, r4, #1
	adds r4, r4, r6
	adds r0, r5, #0
	adds r1, r4, #0
	bl Text_Draw
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08035198: .4byte gBG0TilemapBuffer

	THUMB_FUNC_END sub_803511C

	THUMB_FUNC_START sub_803519C
sub_803519C: @ 0x0803519C
	push {r4, r5, lr}
	adds r5, r0, #0
	bl NewUnitInfoWindow
	ldr r4, _080351C8  @ gUnknown_0203A9FC
	str r0, [r4]
	adds r0, #0x38
	movs r1, #8
	bl Text_Allocate
	adds r0, r5, #0
	bl NewUnitInfoWindow
	str r0, [r4, #4]
	adds r0, #0x38
	movs r1, #8
	bl Text_Allocate
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080351C8: .4byte gUnknown_0203A9FC

	THUMB_FUNC_END sub_803519C

	THUMB_FUNC_START sub_80351CC
sub_80351CC: @ 0x080351CC
	push {r4, lr}
	sub sp, #8
	adds r4, r0, #0
	bl ResetIconGraphics_
	movs r0, #4
	bl LoadIconPalettes
	adds r0, r4, #0
	bl sub_803519C
	ldr r0, _08035200  @ gObject_16x16_VFlipped
	str r0, [sp]
	movs r0, #6
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r1, #2
	movs r2, #0
	movs r3, #0
	bl StartSpriteRefresher
	add sp, #8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08035200: .4byte gObject_16x16_VFlipped

	THUMB_FUNC_END sub_80351CC

	THUMB_FUNC_START SetupUnitRescueWindow
SetupUnitRescueWindow: @ 0x08035204
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	mov r8, r0
	movs r1, #0xa
	bl GetUnitInfoWindowX
	adds r4, r0, #0
	bl ClearBg0Bg1
	ldr r6, _080352AC  @ gUnknown_0203A9FC
	ldr r0, [r6]
	ldr r5, _080352B0  @ gActiveUnit
	ldr r1, [r5]
	movs r7, #0xa
	str r7, [sp]
	movs r2, #1
	mov sl, r2
	str r2, [sp, #4]
	adds r2, r4, #0
	movs r3, #0
	bl UnitInfoWindow_DrawBase
	ldr r0, [r6]
	adds r0, #0x38
	ldr r1, [r5]
	bl sub_8034AA4
	ldr r0, [r6]
	adds r0, #0x38
	adds r1, r4, #0
	adds r1, #0x61
	lsls r1, r1, #1
	ldr r2, _080352B4  @ gBG0TilemapBuffer
	mov r9, r2
	add r1, r9
	bl Text_Draw
	ldr r0, [r5]
	adds r1, r4, #1
	movs r2, #3
	bl sub_8034ADC
	ldr r0, [r6, #4]
	str r7, [sp]
	mov r1, sl
	str r1, [sp, #4]
	mov r1, r8
	adds r2, r4, #0
	movs r3, #6
	bl UnitInfoWindow_DrawBase
	ldr r0, [r6, #4]
	adds r0, #0x38
	mov r1, r8
	bl sub_8034A5C
	ldr r0, [r6, #4]
	adds r0, #0x38
	ldr r2, _080352B8  @ 0x00000121
	adds r1, r4, r2
	lsls r1, r1, #1
	add r1, r9
	bl Text_Draw
	adds r4, #4
	lsls r4, r4, #3
	movs r0, #0
	adds r1, r4, #0
	movs r2, #0x27
	bl MoveSpriteRefresher
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080352AC: .4byte gUnknown_0203A9FC
_080352B0: .4byte gActiveUnit
_080352B4: .4byte gBG0TilemapBuffer
_080352B8: .4byte 0x00000121

	THUMB_FUNC_END SetupUnitRescueWindow

	THUMB_FUNC_START sub_80352BC
sub_80352BC: @ 0x080352BC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r5, r0, #0
	movs r1, #0xa
	bl GetUnitInfoWindowX
	adds r4, r0, #0
	bl ClearBg0Bg1
	ldrb r0, [r5, #0x1b]
	bl GetUnit
	adds r7, r0, #0
	ldr r6, _08035370  @ gUnknown_0203A9FC
	ldr r0, [r6]
	ldr r5, _08035374  @ gActiveUnit
	ldr r1, [r5]
	movs r2, #0xa
	mov sl, r2
	str r2, [sp]
	movs r2, #1
	mov r9, r2
	str r2, [sp, #4]
	adds r2, r4, #0
	movs r3, #0
	bl UnitInfoWindow_DrawBase
	ldr r0, [r6]
	adds r0, #0x38
	ldr r1, [r5]
	bl sub_8034AA4
	ldr r0, [r6]
	adds r0, #0x38
	adds r1, r4, #0
	adds r1, #0x61
	lsls r1, r1, #1
	ldr r2, _08035378  @ gBG0TilemapBuffer
	mov r8, r2
	add r1, r8
	bl Text_Draw
	ldr r0, [r5]
	adds r1, r4, #1
	movs r2, #3
	bl sub_8034ADC
	ldr r0, [r6, #4]
	mov r1, sl
	str r1, [sp]
	mov r2, r9
	str r2, [sp, #4]
	adds r1, r7, #0
	adds r2, r4, #0
	movs r3, #6
	bl UnitInfoWindow_DrawBase
	ldr r0, [r6, #4]
	adds r0, #0x38
	adds r1, r7, #0
	bl sub_8034A5C
	ldr r0, [r6, #4]
	adds r0, #0x38
	ldr r2, _0803537C  @ 0x00000121
	adds r1, r4, r2
	lsls r1, r1, #1
	add r1, r8
	bl Text_Draw
	adds r4, #4
	lsls r4, r4, #3
	movs r0, #0
	adds r1, r4, #0
	movs r2, #0x27
	bl MoveSpriteRefresher
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08035370: .4byte gUnknown_0203A9FC
_08035374: .4byte gActiveUnit
_08035378: .4byte gBG0TilemapBuffer
_0803537C: .4byte 0x00000121

	THUMB_FUNC_END sub_80352BC

	THUMB_FUNC_START sub_8035380
sub_8035380: @ 0x08035380
	push {r4, lr}
	sub sp, #8
	adds r4, r0, #0
	bl ResetIconGraphics_
	movs r0, #4
	bl LoadIconPalettes
	adds r0, r4, #0
	bl sub_803519C
	ldr r0, _080353B4  @ gObject_16x16
	str r0, [sp]
	movs r0, #6
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r1, #2
	movs r2, #0
	movs r3, #0
	bl StartSpriteRefresher
	add sp, #8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080353B4: .4byte gObject_16x16

	THUMB_FUNC_END sub_8035380

	THUMB_FUNC_START sub_80353B8
sub_80353B8: @ 0x080353B8
	push {r4, r5, r6, lr}
	mov r6, sl
	mov r5, r9
	mov r4, r8
	push {r4, r5, r6}
	sub sp, #8
	mov r8, r0
	movs r1, #0xa
	bl GetUnitInfoWindowX
	adds r4, r0, #0
	ldr r0, _0803546C  @ gActiveUnit
	ldr r0, [r0]
	ldrb r0, [r0, #0x1b]
	bl GetUnit
	adds r6, r0, #0
	bl ClearBg0Bg1
	ldr r5, _08035470  @ gUnknown_0203A9FC
	ldr r0, [r5]
	movs r1, #0xa
	mov sl, r1
	str r1, [sp]
	movs r2, #1
	mov r9, r2
	str r2, [sp, #4]
	adds r1, r6, #0
	adds r2, r4, #0
	movs r3, #0
	bl UnitInfoWindow_DrawBase
	ldr r0, [r5]
	adds r0, #0x38
	adds r1, r6, #0
	bl sub_8034A5C
	ldr r0, [r5]
	adds r0, #0x38
	adds r1, r4, #0
	adds r1, #0x61
	lsls r1, r1, #1
	ldr r6, _08035474  @ gBG0TilemapBuffer
	adds r1, r1, r6
	bl Text_Draw
	ldr r0, [r5, #4]
	mov r1, sl
	str r1, [sp]
	mov r2, r9
	str r2, [sp, #4]
	mov r1, r8
	adds r2, r4, #0
	movs r3, #6
	bl UnitInfoWindow_DrawBase
	ldr r0, [r5, #4]
	adds r0, #0x38
	mov r1, r8
	bl sub_8034AA4
	ldr r0, [r5, #4]
	adds r0, #0x38
	ldr r2, _08035478  @ 0x00000121
	adds r1, r4, r2
	lsls r1, r1, #1
	adds r1, r1, r6
	bl Text_Draw
	adds r1, r4, #1
	mov r0, r8
	movs r2, #9
	bl sub_8034ADC
	adds r4, #4
	lsls r4, r4, #3
	movs r0, #0
	adds r1, r4, #0
	movs r2, #0x27
	bl MoveSpriteRefresher
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0803546C: .4byte gActiveUnit
_08035470: .4byte gUnknown_0203A9FC
_08035474: .4byte gBG0TilemapBuffer
_08035478: .4byte 0x00000121

	THUMB_FUNC_END sub_80353B8

.align 2, 0
