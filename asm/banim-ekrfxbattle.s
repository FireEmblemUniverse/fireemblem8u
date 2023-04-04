	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	THUMB_FUNC_START NewEkrDispUP
NewEkrDispUP: @ 0x08051AC4
	push {r4, lr}
	ldr r4, _08051AEC  @ gUnknown_0200006C
	ldr r0, _08051AF0  @ gProc_ekrDispUP
	movs r1, #5
	bl Proc_Start
	str r0, [r4]
	movs r0, #0
	movs r1, #0
	bl EkrDispUP_8051B48
	bl sub_8051B08
	bl sub_8051BA0
	bl sub_8051B80
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08051AEC: .4byte gUnknown_0200006C
_08051AF0: .4byte gProc_ekrDispUP

	THUMB_FUNC_END NewEkrDispUP

	THUMB_FUNC_START sub_8051AF4
sub_8051AF4: @ 0x08051AF4
	push {lr}
	ldr r0, _08051B04  @ gUnknown_0200006C
	ldr r0, [r0]
	bl Proc_End
	pop {r0}
	bx r0
	.align 2, 0
_08051B04: .4byte gUnknown_0200006C

	THUMB_FUNC_END sub_8051AF4

	THUMB_FUNC_START sub_8051B08
sub_8051B08: @ 0x08051B08
	ldr r0, _08051B14  @ gUnknown_0200006C
	ldr r1, [r0]
	movs r0, #0
	str r0, [r1, #0x4c]
	str r0, [r1, #0x50]
	bx lr
	.align 2, 0
_08051B14: .4byte gUnknown_0200006C

	THUMB_FUNC_END sub_8051B08

	THUMB_FUNC_START sub_8051B18
sub_8051B18: @ 0x08051B18
	ldr r0, _08051B24  @ gUnknown_0200006C
	ldr r1, [r0]
	movs r0, #1
	str r0, [r1, #0x4c]
	str r0, [r1, #0x50]
	bx lr
	.align 2, 0
_08051B24: .4byte gUnknown_0200006C

	THUMB_FUNC_END sub_8051B18

	THUMB_FUNC_START sub_8051B28
sub_8051B28: @ 0x08051B28
	ldr r0, _08051B34  @ gUnknown_0200006C
	ldr r1, [r0]
	movs r0, #1
	str r0, [r1, #0x4c]
	bx lr
	.align 2, 0
_08051B34: .4byte gUnknown_0200006C

	THUMB_FUNC_END sub_8051B28

	THUMB_FUNC_START sub_8051B38
sub_8051B38: @ 0x08051B38
	ldr r0, _08051B44  @ gUnknown_0200006C
	ldr r1, [r0]
	movs r0, #1
	str r0, [r1, #0x50]
	bx lr
	.align 2, 0
_08051B44: .4byte gUnknown_0200006C

	THUMB_FUNC_END sub_8051B38

	THUMB_FUNC_START EkrDispUP_8051B48
EkrDispUP_8051B48: @ 0x08051B48
	ldr r2, _08051B58  @ gUnknown_0200006C
	ldr r2, [r2]
	movs r3, #0
	strh r0, [r2, #0x32]
	strh r1, [r2, #0x3a]
	adds r2, #0x29
	strb r3, [r2]
	bx lr
	.align 2, 0
_08051B58: .4byte gUnknown_0200006C

	THUMB_FUNC_END EkrDispUP_8051B48

	THUMB_FUNC_START sub_8051B5C
sub_8051B5C: @ 0x08051B5C
	ldr r2, _08051B6C  @ gUnknown_0200006C
	ldr r2, [r2]
	strh r0, [r2, #0x32]
	strh r1, [r2, #0x3a]
	adds r2, #0x29
	movs r0, #1
	strb r0, [r2]
	bx lr
	.align 2, 0
_08051B6C: .4byte gUnknown_0200006C

	THUMB_FUNC_END sub_8051B5C

	THUMB_FUNC_START sub_8051B70
sub_8051B70: @ 0x08051B70
	ldr r0, _08051B7C  @ gUnknown_0200006C
	ldr r0, [r0]
	adds r0, #0x29
	movs r1, #1
	strb r1, [r0]
	bx lr
	.align 2, 0
_08051B7C: .4byte gUnknown_0200006C

	THUMB_FUNC_END sub_8051B70

	THUMB_FUNC_START sub_8051B80
sub_8051B80: @ 0x08051B80
	ldr r0, _08051B8C  @ gUnknown_0200006C
	ldr r0, [r0]
	adds r0, #0x29
	movs r1, #0
	strb r1, [r0]
	bx lr
	.align 2, 0
_08051B8C: .4byte gUnknown_0200006C

	THUMB_FUNC_END sub_8051B80

	THUMB_FUNC_START sub_8051B90
sub_8051B90: @ 0x08051B90
	ldr r0, _08051B9C  @ gUnknown_0200006C
	ldr r0, [r0]
	adds r0, #0x2a
	movs r1, #1
	strb r1, [r0]
	bx lr
	.align 2, 0
_08051B9C: .4byte gUnknown_0200006C

	THUMB_FUNC_END sub_8051B90

	THUMB_FUNC_START sub_8051BA0
sub_8051BA0: @ 0x08051BA0
	ldr r0, _08051BAC  @ gUnknown_0200006C
	ldr r0, [r0]
	adds r0, #0x2a
	movs r1, #0
	strb r1, [r0]
	bx lr
	.align 2, 0
_08051BAC: .4byte gUnknown_0200006C

	THUMB_FUNC_END sub_8051BA0

	THUMB_FUNC_START ekrDispUP_Loop
ekrDispUP_Loop: @ 0x08051BB0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	adds r7, r0, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	cmp r0, #1
	beq _08051CA6
	adds r0, r7, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #0
	bne _08051CA6
	ldrh r0, [r7, #0x3a]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x13
	lsls r1, r0, #5
	mov r8, r1
	cmp r1, #0
	bge _08051BE2
	movs r2, #0
	mov r8, r2
_08051BE2:
	adds r6, r0, #7
	cmp r6, #6
	ble _08051BEA
	movs r6, #6
_08051BEA:
	movs r0, #6
	subs r0, r0, r6
	lsls r1, r0, #4
	subs r1, r1, r0
	lsls r1, r1, #1
	str r1, [sp, #8]
	ldr r0, _08051C08  @ gUnknown_0203E120
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	blt _08051C0C
	cmp r0, #2
	bgt _08051C0C
	movs r4, #0
	b _08051C0E
	.align 2, 0
_08051C08: .4byte gUnknown_0203E120
_08051C0C:
	movs r4, #0xf
_08051C0E:
	ldr r2, _08051CB8  @ gBG0TilemapBuffer
	mov r9, r2
	movs r0, #0x80
	mov sl, r0
	str r0, [sp]
	mov r0, r9
	movs r1, #0x1e
	movs r2, #7
	movs r3, #0
	bl FillBGRect
	cmp r6, #0
	ble _08051CA0
	ldr r0, [r7, #0x4c]
	cmp r0, #0
	bne _08051C64
	ldr r0, _08051CBC  @ gUnknown_0880210C
	ldr r1, [sp, #8]
	adds r0, r1, r0
	mov r2, r8
	lsls r5, r2, #1
	lsls r1, r4, #1
	add r1, r9
	adds r5, r5, r1
	lsls r4, r6, #0x10
	lsrs r4, r4, #0x10
	movs r1, #1
	negs r1, r1
	str r1, [sp]
	str r1, [sp, #4]
	adds r1, r5, #0
	movs r2, #0xf
	adds r3, r4, #0
	bl sub_8070E94
	mov r0, sl
	str r0, [sp]
	adds r0, r5, #0
	movs r1, #0xf
	adds r2, r4, #0
	movs r3, #2
	bl sub_8070D04
_08051C64:
	ldr r0, [r7, #0x50]
	cmp r0, #0
	bne _08051CA0
	ldr r0, _08051CC0  @ gUnknown_088021C0
	ldr r1, [sp, #8]
	adds r0, r1, r0
	mov r2, r8
	lsls r5, r2, #1
	movs r2, #0xf
	lsls r1, r2, #1
	add r1, r9
	adds r5, r5, r1
	lsls r4, r6, #0x10
	lsrs r4, r4, #0x10
	movs r1, #1
	negs r1, r1
	str r1, [sp]
	str r1, [sp, #4]
	adds r1, r5, #0
	adds r3, r4, #0
	bl sub_8070E94
	mov r0, sl
	str r0, [sp]
	adds r0, r5, #0
	movs r1, #0xf
	adds r2, r4, #0
	movs r3, #3
	bl sub_8070D04
_08051CA0:
	movs r0, #1
	bl BG_EnableSyncByMask
_08051CA6:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08051CB8: .4byte gBG0TilemapBuffer
_08051CBC: .4byte gUnknown_0880210C
_08051CC0: .4byte gUnknown_088021C0

	THUMB_FUNC_END ekrDispUP_Loop

	THUMB_FUNC_START sub_8051CC4
sub_8051CC4: @ 0x08051CC4
	push {r4, r5, r6, lr}
	sub sp, #0x10
	ldr r4, _08051DB8  @ gLCDControlBuffer
	ldrb r0, [r4]
	movs r2, #8
	negs r2, r2
	ands r2, r0
	ldrb r0, [r4, #1]
	movs r5, #1
	orrs r0, r5
	movs r6, #2
	orrs r0, r6
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r4, #1]
	movs r0, #0x41
	negs r0, r0
	ands r2, r0
	strb r2, [r4]
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
	movs r0, #0
	movs r1, #0
	bl SetBackgroundTileDataOffset
	movs r0, #1
	movs r1, #0
	bl SetBackgroundTileDataOffset
	movs r0, #2
	movs r1, #0
	bl SetBackgroundTileDataOffset
	movs r1, #0x80
	lsls r1, r1, #8
	movs r0, #3
	bl SetBackgroundTileDataOffset
	movs r1, #0xc0
	lsls r1, r1, #7
	movs r0, #0
	bl SetBackgroundMapDataOffset
	movs r1, #0xd0
	lsls r1, r1, #7
	movs r0, #1
	bl SetBackgroundMapDataOffset
	movs r1, #0xe0
	lsls r1, r1, #7
	movs r0, #2
	bl SetBackgroundMapDataOffset
	movs r1, #0xf0
	lsls r1, r1, #7
	movs r0, #3
	bl SetBackgroundMapDataOffset
	ldrb r2, [r4, #0xc]
	movs r1, #4
	negs r1, r1
	adds r0, r1, #0
	ands r0, r2
	strb r0, [r4, #0xc]
	ldrb r2, [r4, #0x10]
	adds r0, r1, #0
	ands r0, r2
	orrs r0, r5
	strb r0, [r4, #0x10]
	ldrb r0, [r4, #0x14]
	ands r1, r0
	orrs r1, r6
	strb r1, [r4, #0x14]
	ldrb r0, [r4, #0x18]
	movs r1, #3
	orrs r0, r1
	strb r0, [r4, #0x18]
	movs r4, #0
	str r4, [sp]
	ldr r1, _08051DBC  @ gBG0TilemapBuffer
	ldr r5, _08051DC0  @ 0x01000200
	mov r0, sp
	adds r2, r5, #0
	bl CpuFastSet
	str r4, [sp, #4]
	add r0, sp, #4
	ldr r1, _08051DC4  @ gBG1TilemapBuffer
	adds r2, r5, #0
	bl CpuFastSet
	str r4, [sp, #8]
	add r0, sp, #8
	ldr r6, _08051DC8  @ gBG2TilemapBuffer
	adds r1, r6, #0
	adds r2, r5, #0
	bl CpuFastSet
	bl sub_805B028
	cmp r0, #0
	bne _08051DCC
	bl sub_8051E00
	b _08051DD8
	.align 2, 0
_08051DB8: .4byte gLCDControlBuffer
_08051DBC: .4byte gBG0TilemapBuffer
_08051DC0: .4byte 0x01000200
_08051DC4: .4byte gBG1TilemapBuffer
_08051DC8: .4byte gBG2TilemapBuffer
_08051DCC:
	str r4, [sp, #0xc]
	add r0, sp, #0xc
	adds r1, r6, #0
	adds r2, r5, #0
	bl CpuFastSet
_08051DD8:
	bl sub_8051F1C
	bl EnablePaletteSync
	movs r0, #1
	bl BG_EnableSyncByMask
	movs r0, #2
	bl BG_EnableSyncByMask
	movs r0, #4
	bl BG_EnableSyncByMask
	bl SetDefaultColorEffects
	add sp, #0x10
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8051CC4

	THUMB_FUNC_START sub_8051E00
sub_8051E00: @ 0x08051E00
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r4, _08051E40  @ gUnknown_0201FADC
	ldr r2, _08051E44  @ gUnknown_0203E11C
	movs r0, #0
	ldrsh r1, [r2, r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	ldr r3, _08051E48  @ battle_terrain_table
	adds r5, r0, r3
	movs r6, #2
	ldrsh r1, [r2, r6]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r3, r0, r3
	ldr r0, _08051E4C  @ gUnknown_0203E120
	movs r7, #0
	ldrsh r1, [r0, r7]
	mov r8, r2
	adds r6, r0, #0
	cmp r1, #3
	bgt _08051E54
	cmp r1, #1
	bge _08051E78
	cmp r1, #0
	beq _08051E5C
	ldr r0, _08051E50  @ gUnknown_020145C8
	b _08051E8A
	.align 2, 0
_08051E40: .4byte gUnknown_0201FADC
_08051E44: .4byte gUnknown_0203E11C
_08051E48: .4byte battle_terrain_table
_08051E4C: .4byte gUnknown_0203E120
_08051E50: .4byte gUnknown_020145C8
_08051E54:
	ldr r7, _08051E70  @ gUnknown_020145C8
	mov ip, r7
	cmp r1, #4
	bne _08051E8C
_08051E5C:
	ldr r0, _08051E74  @ gUnknown_0200003C
	ldr r1, _08051E70  @ gUnknown_020145C8
	str r1, [r0]
	movs r7, #0x80
	lsls r7, r7, #5
	adds r2, r1, r7
	str r2, [r0, #4]
	mov ip, r1
	b _08051E8C
	.align 2, 0
_08051E70: .4byte gUnknown_020145C8
_08051E74: .4byte gUnknown_0200003C
_08051E78:
	ldr r0, _08051EFC  @ gUnknown_0200003C
	ldr r1, _08051F00  @ gUnknown_02014DC8
	str r1, [r0]
	movs r7, #0x80
	lsls r7, r7, #5
	adds r2, r1, r7
	str r2, [r0, #4]
	ldr r0, _08051F04  @ 0xFFFFF800
	adds r0, r0, r1
_08051E8A:
	mov ip, r0
_08051E8C:
	ldr r0, _08051F08  @ gPlaySt
	ldrb r0, [r0, #0x15]
	ldr r0, _08051F0C  @ gUnknown_0200004C
	ldr r1, [r5, #0x10]
	str r1, [r0]
	ldr r1, [r3, #0x10]
	str r1, [r0, #4]
	ldr r2, _08051F10  @ gUnknown_02000044
	ldr r1, _08051F14  @ gUnknown_085B9D6C
	movs r3, #0
	ldrsh r0, [r6, r3]
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r0, [r0]
	str r0, [r2]
	movs r7, #0
	ldrsh r0, [r6, r7]
	lsls r0, r0, #1
	adds r0, #1
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	str r0, [r2, #4]
	mov r1, r8
	ldrh r0, [r1]
	movs r2, #0
	strh r0, [r4]
	movs r0, #4
	strh r0, [r4, #2]
	movs r1, #0xa0
	lsls r1, r1, #2
	strh r1, [r4, #4]
	mov r3, r8
	ldrh r0, [r3, #2]
	strh r0, [r4, #6]
	movs r0, #5
	strh r0, [r4, #8]
	strh r1, [r4, #0xa]
	ldrh r0, [r6]
	strh r0, [r4, #0xc]
	movs r0, #2
	strh r0, [r4, #0xe]
	str r2, [r4, #0x1c]
	mov r6, ip
	str r6, [r4, #0x20]
	ldr r0, _08051F18  @ gUnknown_0203E102
	ldrh r0, [r0]
	strh r0, [r4, #0x10]
	adds r0, r4, #0
	bl sub_805AA68
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08051EFC: .4byte gUnknown_0200003C
_08051F00: .4byte gUnknown_02014DC8
_08051F04: .4byte 0xFFFFF800
_08051F08: .4byte gPlaySt
_08051F0C: .4byte gUnknown_0200004C
_08051F10: .4byte gUnknown_02000044
_08051F14: .4byte gUnknown_085B9D6C
_08051F18: .4byte gUnknown_0203E102

	THUMB_FUNC_END sub_8051E00

	THUMB_FUNC_START sub_8051F1C
sub_8051F1C: @ 0x08051F1C
	push {r4, r5, r6, lr}
	sub sp, #8
	ldr r4, _08051F5C  @ Pal_UIFont
	adds r0, r4, #0
	movs r1, #0x40
	movs r2, #0x20
	bl CopyToPaletteBuffer
	adds r0, r4, #0
	movs r1, #0x60
	movs r2, #0x20
	bl CopyToPaletteBuffer
	ldr r0, _08051F60  @ gSomeFontStruct
	ldr r1, _08051F64  @ 0x06001880
	movs r2, #0xc4
	movs r3, #2
	bl Font_InitForUI
	bl Font_SetSomeSpecialDrawingRoutine
	ldr r0, _08051F68  @ gUnknown_08801C14
	ldr r1, _08051F6C  @ 0x06001000
	bl LZ77UnCompVram
	ldr r0, _08051F70  @ gUnknown_0203E104
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _08051F78
	ldr r5, _08051F74  @ gUnknown_085B9354
	b _08051F86
	.align 2, 0
_08051F5C: .4byte Pal_UIFont
_08051F60: .4byte gSomeFontStruct
_08051F64: .4byte 0x06001880
_08051F68: .4byte gUnknown_08801C14
_08051F6C: .4byte 0x06001000
_08051F70: .4byte gUnknown_0203E104
_08051F74: .4byte gUnknown_085B9354
_08051F78:
	ldr r0, _08051FC0  @ gpEkrBattleUnitLeft
	ldr r0, [r0]
	ldr r0, [r0]
	ldrh r0, [r0]
	bl GetStringFromIndex
	adds r5, r0, #0
_08051F86:
	ldr r4, _08051FC4  @ gTextEkrlvupMsg
	adds r0, r4, #0
	movs r1, #7
	bl Text_Init
	movs r0, #0x38
	adds r1, r5, #0
	bl GetStringTextCenteredPos
	adds r1, r0, #0
	adds r0, r4, #0
	bl Text_SetXCursor
	ldr r0, _08051FC8  @ gUnknown_08801F7C
	ldr r1, _08051FCC  @ 0x06001880
	bl LZ77UnCompVram
	adds r0, r4, #0
	adds r1, r5, #0
	bl Text_AppendString
	ldr r0, _08051FD0  @ gUnknown_0203E104
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _08051FD8
	ldr r5, _08051FD4  @ gUnknown_085B9354
	b _08051FE6
	.align 2, 0
_08051FC0: .4byte gpEkrBattleUnitLeft
_08051FC4: .4byte gTextEkrlvupMsg
_08051FC8: .4byte gUnknown_08801F7C
_08051FCC: .4byte 0x06001880
_08051FD0: .4byte gUnknown_0203E104
_08051FD4: .4byte gUnknown_085B9354
_08051FD8:
	ldr r0, _08052020  @ gpEkrBattleUnitLeft
	ldr r0, [r0]
	adds r0, #0x4a
	ldrh r0, [r0]
	bl GetItemName
	adds r5, r0, #0
_08051FE6:
	ldr r4, _08052024  @ gUnknown_02017670
	adds r0, r4, #0
	movs r1, #8
	bl Text_Init
	movs r0, #0x40
	adds r1, r5, #0
	bl GetStringTextCenteredPos
	adds r1, r0, #0
	adds r0, r4, #0
	bl Text_SetXCursor
	ldr r0, _08052028  @ gUnknown_08801FF4
	ldr r1, _0805202C  @ 0x06001A40
	bl LZ77UnCompVram
	adds r0, r4, #0
	adds r1, r5, #0
	bl Text_AppendString
	ldr r0, _08052030  @ gUnknown_0203E104
	movs r1, #2
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _08052038
	ldr r5, _08052034  @ gUnknown_085B9354
	b _08052046
	.align 2, 0
_08052020: .4byte gpEkrBattleUnitLeft
_08052024: .4byte gUnknown_02017670
_08052028: .4byte gUnknown_08801FF4
_0805202C: .4byte 0x06001A40
_08052030: .4byte gUnknown_0203E104
_08052034: .4byte gUnknown_085B9354
_08052038:
	ldr r0, _08052080  @ gpEkrBattleUnitRight
	ldr r0, [r0]
	ldr r0, [r0]
	ldrh r0, [r0]
	bl GetStringFromIndex
	adds r5, r0, #0
_08052046:
	ldr r4, _08052084  @ gUnknown_02017678
	adds r0, r4, #0
	movs r1, #7
	bl Text_Init
	movs r0, #0x38
	adds r1, r5, #0
	bl GetStringTextCenteredPos
	adds r1, r0, #0
	adds r0, r4, #0
	bl Text_SetXCursor
	ldr r0, _08052088  @ gUnknown_08802044
	ldr r1, _0805208C  @ 0x06001C40
	bl LZ77UnCompVram
	adds r0, r4, #0
	adds r1, r5, #0
	bl Text_AppendString
	ldr r0, _08052090  @ gUnknown_0203E104
	movs r1, #2
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _08052098
	ldr r5, _08052094  @ gUnknown_085B9354
	b _080520A6
	.align 2, 0
_08052080: .4byte gpEkrBattleUnitRight
_08052084: .4byte gUnknown_02017678
_08052088: .4byte gUnknown_08802044
_0805208C: .4byte 0x06001C40
_08052090: .4byte gUnknown_0203E104
_08052094: .4byte gUnknown_085B9354
_08052098:
	ldr r0, _0805215C  @ gpEkrBattleUnitRight
	ldr r0, [r0]
	adds r0, #0x4a
	ldrh r0, [r0]
	bl GetItemName
	adds r5, r0, #0
_080520A6:
	ldr r4, _08052160  @ gUnknown_02017668
	adds r0, r4, #0
	movs r1, #8
	bl Text_Init
	movs r0, #0x3e
	adds r1, r5, #0
	bl GetStringTextCenteredPos
	adds r1, r0, #0
	adds r0, r4, #0
	bl Text_SetXCursor
	ldr r0, _08052164  @ gUnknown_088020BC
	ldr r1, _08052168  @ 0x06001E00
	bl LZ77UnCompVram
	adds r0, r4, #0
	adds r1, r5, #0
	bl Text_AppendString
	ldr r4, _0805216C  @ gBG0TilemapBuffer
	adds r0, r4, #0
	movs r1, #0x80
	bl BG_Fill
	ldr r0, _08052170  @ gUnknown_08802508
	adds r6, r4, #0
	adds r6, #0x3c
	movs r1, #1
	negs r1, r1
	str r1, [sp]
	str r1, [sp, #4]
	adds r1, r6, #0
	movs r2, #2
	movs r3, #0x14
	bl sub_8070E94
	adds r4, #0x3e
	movs r5, #0x80
	str r5, [sp]
	adds r0, r4, #0
	movs r1, #1
	movs r2, #0x14
	movs r3, #2
	bl sub_8070D04
	str r5, [sp]
	adds r0, r6, #0
	movs r1, #1
	movs r2, #0x14
	movs r3, #3
	bl sub_8070D04
	movs r0, #1
	bl BG_EnableSyncByMask
	ldr r6, _08052174  @ gUnknown_0203E114
	movs r1, #0
	ldrsh r0, [r6, r1]
	lsls r0, r0, #5
	ldr r5, _08052178  @ gUnknown_08802558
	adds r0, r0, r5
	ldr r4, _0805217C  @ pPalette2Buffer
	adds r1, r4, #0
	movs r2, #8
	bl CpuFastSet
	movs r1, #2
	ldrsh r0, [r6, r1]
	lsls r0, r0, #5
	adds r0, r0, r5
	adds r4, #0x20
	adds r1, r4, #0
	movs r2, #8
	bl CpuFastSet
	bl EnablePaletteSync
	ldr r1, _08052180  @ gUnknown_02000038
	movs r0, #0
	strh r0, [r1]
	strh r0, [r1, #2]
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0805215C: .4byte gpEkrBattleUnitRight
_08052160: .4byte gUnknown_02017668
_08052164: .4byte gUnknown_088020BC
_08052168: .4byte 0x06001E00
_0805216C: .4byte gBG0TilemapBuffer
_08052170: .4byte gUnknown_08802508
_08052174: .4byte gUnknown_0203E114
_08052178: .4byte gUnknown_08802558
_0805217C: .4byte pPalette2Buffer
_08052180: .4byte gUnknown_02000038

	THUMB_FUNC_END sub_8051F1C

	THUMB_FUNC_START sub_8052184
sub_8052184: @ 0x08052184
	push {r4, r5, lr}
	ldr r0, _0805219C  @ gUnknown_0203E120
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #4
	bhi _080521C4
	lsls r0, r0, #2
	ldr r1, _080521A0  @ _080521A4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0805219C: .4byte gUnknown_0203E120
_080521A0: .4byte _080521A4
_080521A4: @ jump table
	.4byte _0805220C @ case 0
	.4byte _080521B8 @ case 1
	.4byte _080521C4 @ case 2
	.4byte _0805220C @ case 3
	.4byte _0805220C @ case 4
_080521B8:
	ldr r0, _080521C0  @ gUnknown_0203E100
	movs r2, #0
	ldrsh r0, [r0, r2]
	b _0805220E
	.align 2, 0
_080521C0: .4byte gUnknown_0203E100
_080521C4:
	movs r1, #0
	movs r5, #0
	ldr r0, _080521F4  @ gUnknown_0203E0FC
	movs r2, #0
	ldrsh r0, [r0, r2]
	cmp r0, #0
	bne _080521EC
	ldr r4, _080521F8  @ gEkrBuIndexes
	ldrb r0, [r4]
	ldrb r1, [r4, #1]
	bl ShouldCallBattleQuote
	lsls r0, r0, #0x18
	asrs r5, r0, #0x18
	ldrb r0, [r4, #1]
	ldrb r1, [r4]
	bl ShouldCallBattleQuote
	lsls r0, r0, #0x18
	asrs r1, r0, #0x18
_080521EC:
	cmp r5, #1
	bne _080521FC
	movs r0, #0
	b _0805220E
	.align 2, 0
_080521F4: .4byte gUnknown_0203E0FC
_080521F8: .4byte gEkrBuIndexes
_080521FC:
	cmp r1, #1
	beq _0805220C
	ldr r0, _08052208  @ gUnknown_0203E100
	movs r1, #0
	ldrsh r0, [r0, r1]
	b _0805220E
	.align 2, 0
_08052208: .4byte gUnknown_0203E100
_0805220C:
	movs r0, #1
_0805220E:
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8052184

	THUMB_FUNC_START sub_8052214
sub_8052214: @ 0x08052214
	ldr r2, _0805221C  @ gUnknown_02017760
	strh r0, [r2]
	strh r1, [r2, #2]
	bx lr
	.align 2, 0
_0805221C: .4byte gUnknown_02017760

	THUMB_FUNC_END sub_8052214

	THUMB_FUNC_START sub_8052220
sub_8052220: @ 0x08052220
	push {r4, lr}
	ldr r0, _08052284  @ gUnknown_02017728
	movs r4, #0
	str r4, [r0]
	ldr r0, _08052288  @ gUnknown_0201772C
	str r4, [r0]
	ldr r0, _0805228C  @ gUnknown_02017730
	str r4, [r0]
	ldr r0, _08052290  @ gUnknown_02017738
	str r4, [r0]
	ldr r0, _08052294  @ gUnknown_0201773C
	str r4, [r0]
	ldr r0, _08052298  @ gUnknown_02017740
	str r4, [r0]
	ldr r0, _0805229C  @ gUnknown_02017748
	str r4, [r0]
	ldr r0, _080522A0  @ gUnknown_0201774C
	str r4, [r0]
	ldr r0, _080522A4  @ gUnknown_02017750
	str r4, [r0]
	ldr r0, _080522A8  @ gUnknown_02017754
	str r4, [r0]
	ldr r0, _080522AC  @ gUnknown_02017758
	str r4, [r0]
	ldr r0, _080522B0  @ gUnknown_0201775C
	str r4, [r0]
	movs r0, #0
	movs r1, #0
	bl sub_8052214
	ldr r0, _080522B4  @ gUnknown_02017764
	strh r4, [r0]
	strh r4, [r0, #2]
	ldr r0, _080522B8  @ gUnknown_02017768
	strh r4, [r0]
	strh r4, [r0, #2]
	ldr r0, _080522BC  @ gUnknown_02017780
	strh r4, [r0]
	strh r4, [r0, #2]
	ldr r0, _080522C0  @ gUnknown_0201776C
	str r4, [r0]
	str r4, [r0, #4]
	ldr r0, _080522C4  @ gUnknown_02017778
	str r4, [r0]
	ldr r0, _080522C8  @ gUnknown_0201777C
	str r4, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08052284: .4byte gUnknown_02017728
_08052288: .4byte gUnknown_0201772C
_0805228C: .4byte gUnknown_02017730
_08052290: .4byte gUnknown_02017738
_08052294: .4byte gUnknown_0201773C
_08052298: .4byte gUnknown_02017740
_0805229C: .4byte gUnknown_02017748
_080522A0: .4byte gUnknown_0201774C
_080522A4: .4byte gUnknown_02017750
_080522A8: .4byte gUnknown_02017754
_080522AC: .4byte gUnknown_02017758
_080522B0: .4byte gUnknown_0201775C
_080522B4: .4byte gUnknown_02017764
_080522B8: .4byte gUnknown_02017768
_080522BC: .4byte gUnknown_02017780
_080522C0: .4byte gUnknown_0201776C
_080522C4: .4byte gUnknown_02017778
_080522C8: .4byte gUnknown_0201777C

	THUMB_FUNC_END sub_8052220

	THUMB_FUNC_START sub_80522CC
sub_80522CC: @ 0x080522CC
	push {lr}
	ldr r0, _080522E4  @ gUnknown_02017728
	ldr r0, [r0]
	cmp r0, #0
	bne _080522EC
	ldr r0, _080522E8  @ gUnknown_0201772C
	ldr r0, [r0]
	cmp r0, #0
	bne _080522EC
	movs r0, #1
	b _080522EE
	.align 2, 0
_080522E4: .4byte gUnknown_02017728
_080522E8: .4byte gUnknown_0201772C
_080522EC:
	movs r0, #0
_080522EE:
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80522CC

	THUMB_FUNC_START sub_80522F4
sub_80522F4: @ 0x080522F4
	ldr r1, _08052300  @ gUnknown_02017780
	lsls r0, r0, #1
	adds r0, r0, r1
	movs r1, #0
	ldrsh r0, [r0, r1]
	bx lr
	.align 2, 0
_08052300: .4byte gUnknown_02017780

	THUMB_FUNC_END sub_80522F4

	THUMB_FUNC_START sub_8052304
sub_8052304: @ 0x08052304
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	bl GetAISSubjectId
	adds r1, r0, #0
	ldrh r0, [r4, #0xe]
	subs r0, #1
	lsls r0, r0, #1
	adds r0, r0, r1
	bl sub_8058A34
	movs r1, #0x80
	lsls r1, r1, #3
	ands r1, r0
	cmp r1, #0
	bne _080523E0
	ldr r1, _08052350  @ gUnknown_02017728
	ldr r0, [r1]
	cmp r0, #0
	bne _080523E0
	movs r0, #1
	str r0, [r1]
	ldr r0, _08052354  @ gProc_efxHPBar
	movs r1, #3
	bl Proc_Start
	adds r6, r0, #0
	str r4, [r6, #0x64]
	adds r0, r4, #0
	bl GetAISSubjectId
	cmp r0, #0
	bne _0805235C
	ldr r0, _08052358  @ gUnknown_02000000
	ldr r1, [r0, #8]
	str r1, [r6, #0x5c]
	ldr r0, [r0]
	b _08052364
	.align 2, 0
_08052350: .4byte gUnknown_02017728
_08052354: .4byte gProc_efxHPBar
_08052358: .4byte gUnknown_02000000
_0805235C:
	ldr r0, _080523B8  @ gUnknown_02000000
	ldr r1, [r0]
	str r1, [r6, #0x5c]
	ldr r0, [r0, #8]
_08052364:
	str r0, [r6, #0x60]
	ldr r4, _080523BC  @ gUnknown_0203E152
	ldr r0, [r6, #0x60]
	bl GetAISSubjectId
	lsls r0, r0, #1
	adds r0, r0, r4
	movs r1, #0
	ldrsh r5, [r0, r1]
	adds r4, r5, #1
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	ldr r0, [r6, #0x60]
	bl GetAISSubjectId
	lsls r5, r5, #1
	adds r5, r5, r0
	adds r0, r5, #0
	bl sub_8058A60
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [r6, #0x4c]
	ldr r0, [r6, #0x60]
	bl GetAISSubjectId
	lsls r4, r4, #0x10
	asrs r4, r4, #0xf
	adds r4, r4, r0
	adds r0, r4, #0
	bl sub_8058A60
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [r6, #0x50]
	ldr r1, [r6, #0x4c]
	cmp r1, r0
	ble _080523C0
	movs r0, #1
	negs r0, r0
	b _080523C2
	.align 2, 0
_080523B8: .4byte gUnknown_02000000
_080523BC: .4byte gUnknown_0203E152
_080523C0:
	movs r0, #1
_080523C2:
	str r0, [r6, #0x48]
	movs r1, #0
	strh r1, [r6, #0x2c]
	ldr r0, [r6, #0x4c]
	strh r0, [r6, #0x2e]
	str r1, [r6, #0x54]
	str r1, [r6, #0x58]
	ldr r0, [r6, #0x60]
	bl GetAISSubjectId
	ldr r1, _080523E8  @ gUnknown_02017780
	lsls r0, r0, #1
	adds r0, r0, r1
	movs r1, #1
	strh r1, [r0]
_080523E0:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080523E8: .4byte gUnknown_02017780

	THUMB_FUNC_END sub_8052304

	THUMB_FUNC_START sub_80523EC
sub_80523EC: @ 0x080523EC
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r4, _08052490  @ gUnknown_02000000
	ldr r0, [r5, #0x60]
	bl GetAISSubjectId
	lsls r0, r0, #3
	adds r0, r0, r4
	ldr r6, [r0]
	ldr r0, [r5, #0x60]
	bl GetAISSubjectId
	lsls r0, r0, #1
	adds r0, #1
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r7, [r0]
	ldr r1, [r5, #0x58]
	cmp r1, #0
	bne _0805244E
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #2
	bne _0805244E
	strh r1, [r5, #0x2c]
	ldr r1, [r5, #0x48]
	ldrh r0, [r5, #0x2e]
	adds r0, r0, r1
	strh r0, [r5, #0x2e]
	ldr r0, [r5, #0x60]
	bl GetAISSubjectId
	ldr r1, _08052494  @ gUnknown_0203E1AC
	lsls r0, r0, #1
	adds r0, r0, r1
	ldr r2, [r5, #0x48]
	ldrh r1, [r0]
	adds r1, r1, r2
	strh r1, [r0]
	movs r0, #0x2e
	ldrsh r1, [r5, r0]
	ldr r0, [r5, #0x50]
	cmp r1, r0
	bne _0805244E
	movs r0, #1
	str r0, [r5, #0x58]
_0805244E:
	ldr r1, [r5, #0x54]
	cmp r1, #0x1e
	bne _080524F0
	ldr r0, [r5, #0x58]
	cmp r0, #1
	bne _080524F0
	ldr r4, _08052498  @ gUnknown_0203E152
	ldr r0, [r5, #0x60]
	bl GetAISSubjectId
	lsls r0, r0, #1
	adds r0, r0, r4
	ldrh r1, [r0]
	adds r1, #1
	movs r4, #0
	strh r1, [r0]
	ldr r0, [r5, #0x60]
	bl GetAISSubjectId
	ldr r1, _0805249C  @ gUnknown_02017780
	lsls r0, r0, #1
	adds r0, r0, r1
	strh r4, [r0]
	ldr r0, [r5, #0x50]
	cmp r0, #0
	bne _080524E4
	bl sub_804FD54
	cmp r0, #1
	bne _080524A0
	movs r0, #0
	b _080524B4
	.align 2, 0
_08052490: .4byte gUnknown_02000000
_08052494: .4byte gUnknown_0203E1AC
_08052498: .4byte gUnknown_0203E152
_0805249C: .4byte gUnknown_02017780
_080524A0:
	ldr r4, _080524C4  @ gEkrBuIndexes
	adds r0, r6, #0
	bl GetAISSubjectId
	adds r0, r0, r4
	ldrb r0, [r0]
	bl sub_80835A8
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
_080524B4:
	cmp r0, #1
	bne _080524C8
	adds r0, r6, #0
	adds r1, r7, #0
	bl sub_8052DD4
	b _080524E4
	.align 2, 0
_080524C4: .4byte gEkrBuIndexes
_080524C8:
	bl sub_805B07C
	adds r0, r6, #0
	adds r1, r7, #0
	bl sub_8052FAC
	ldr r0, [r5, #0x60]
	bl GetAISSubjectId
	ldr r1, _080524EC  @ gUnknown_0203E104
	lsls r0, r0, #1
	adds r0, r0, r1
	movs r1, #0
	strh r1, [r0]
_080524E4:
	adds r0, r5, #0
	bl Proc_Break
	b _080524FC
	.align 2, 0
_080524EC: .4byte gUnknown_0203E104
_080524F0:
	adds r0, r1, #1
	str r0, [r5, #0x54]
	cmp r0, #0x1d
	bls _080524FC
	movs r0, #0x1e
	str r0, [r5, #0x54]
_080524FC:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80523EC

	THUMB_FUNC_START sub_8052504
sub_8052504: @ 0x08052504
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _0805254C  @ gUnknown_0201774C
	ldr r0, [r0]
	cmp r0, #0
	bne _0805259C
	ldr r0, _08052550  @ gUnknown_0201772C
	ldr r0, [r0]
	cmp r0, #0
	bne _0805259C
	strh r0, [r5, #0x2c]
	movs r0, #1
	strh r0, [r5, #0x2e]
	ldr r0, [r5, #0x64]
	bl GetCoreAIStruct
	adds r4, r0, #0
	bl sub_805A2F0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl sub_805A21C
	cmp r0, #1
	bne _08052596
	ldr r0, _08052554  @ gUnknown_0203E120
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #4
	bhi _08052596
	lsls r0, r0, #2
	ldr r1, _08052558  @ _0805255C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0805254C: .4byte gUnknown_0201774C
_08052550: .4byte gUnknown_0201772C
_08052554: .4byte gUnknown_0203E120
_08052558: .4byte _0805255C
_0805255C: @ jump table
	.4byte _08052570 @ case 0
	.4byte _08052570 @ case 1
	.4byte _08052584 @ case 2
	.4byte _08052570 @ case 3
	.4byte _08052570 @ case 4
_08052570:
	movs r0, #0x10
	strh r0, [r5, #0x2e]
	adds r0, r4, #0
	bl GetCoreAIStruct
	movs r1, #1
	negs r1, r1
	bl sub_80533D0
	b _08052596
_08052584:
	movs r0, #0x14
	strh r0, [r5, #0x2e]
	adds r0, r4, #0
	bl GetCoreAIStruct
	movs r1, #1
	negs r1, r1
	bl sub_80533D0
_08052596:
	adds r0, r5, #0
	bl Proc_Break
_0805259C:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8052504

	THUMB_FUNC_START sub_80525A4
sub_80525A4: @ 0x080525A4
	push {lr}
	adds r2, r0, #0
	ldrh r0, [r2, #0x2c]
	adds r0, #1
	strh r0, [r2, #0x2c]
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	movs r3, #0x2e
	ldrsh r0, [r2, r3]
	subs r0, #4
	cmp r1, r0
	bne _080525CA
	ldr r0, [r2, #0x64]
	bl GetCoreAIStruct
	movs r0, #4
	bl BG_EnableSyncByMask
	b _080525E0
_080525CA:
	movs r3, #0x2e
	ldrsh r0, [r2, r3]
	cmp r1, r0
	bne _080525E0
	ldr r1, _080525E4  @ gUnknown_02017728
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r2, #0
	bl Proc_Break
_080525E0:
	pop {r0}
	bx r0
	.align 2, 0
_080525E4: .4byte gUnknown_02017728

	THUMB_FUNC_END sub_80525A4

	THUMB_FUNC_START sub_80525E8
sub_80525E8: @ 0x080525E8
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r1, _08052620  @ gUnknown_02017728
	ldr r0, [r1]
	cmp r0, #0
	bne _080526BA
	movs r0, #1
	str r0, [r1]
	ldr r0, _08052624  @ gProc_efxHPBarResire
	movs r1, #3
	bl Proc_Start
	adds r6, r0, #0
	adds r0, r4, #0
	bl GetCoreAIStruct
	str r0, [r6, #0x64]
	adds r0, r4, #0
	bl GetAISSubjectId
	cmp r0, #0
	bne _0805262C
	ldr r0, _08052628  @ gUnknown_02000000
	ldr r1, [r0, #8]
	str r1, [r6, #0x5c]
	ldr r0, [r0]
	b _08052634
	.align 2, 0
_08052620: .4byte gUnknown_02017728
_08052624: .4byte gProc_efxHPBarResire
_08052628: .4byte gUnknown_02000000
_0805262C:
	ldr r0, _08052688  @ gUnknown_02000000
	ldr r1, [r0]
	str r1, [r6, #0x5c]
	ldr r0, [r0, #8]
_08052634:
	str r0, [r6, #0x60]
	ldr r4, _0805268C  @ gUnknown_0203E152
	ldr r0, [r6, #0x60]
	bl GetAISSubjectId
	lsls r0, r0, #1
	adds r0, r0, r4
	movs r1, #0
	ldrsh r5, [r0, r1]
	adds r4, r5, #1
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	ldr r0, [r6, #0x60]
	bl GetAISSubjectId
	lsls r5, r5, #1
	adds r5, r5, r0
	adds r0, r5, #0
	bl sub_8058A60
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [r6, #0x4c]
	ldr r0, [r6, #0x60]
	bl GetAISSubjectId
	lsls r4, r4, #0x10
	asrs r4, r4, #0xf
	adds r4, r4, r0
	adds r0, r4, #0
	bl sub_8058A60
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [r6, #0x50]
	ldr r1, [r6, #0x4c]
	cmp r1, r0
	ble _08052690
	movs r0, #1
	negs r0, r0
	b _08052692
	.align 2, 0
_08052688: .4byte gUnknown_02000000
_0805268C: .4byte gUnknown_0203E152
_08052690:
	movs r0, #1
_08052692:
	str r0, [r6, #0x48]
	adds r0, r6, #0
	adds r0, #0x29
	movs r1, #0
	strb r1, [r0]
	strh r1, [r6, #0x2c]
	ldr r0, [r6, #0x4c]
	strh r0, [r6, #0x2e]
	str r1, [r6, #0x54]
	str r1, [r6, #0x58]
	ldr r0, _080526C0  @ gUnknown_02017750
	str r1, [r0]
	ldr r0, [r6, #0x60]
	bl GetAISSubjectId
	ldr r1, _080526C4  @ gUnknown_02017780
	lsls r0, r0, #1
	adds r0, r0, r1
	movs r1, #1
	strh r1, [r0]
_080526BA:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080526C0: .4byte gUnknown_02017750
_080526C4: .4byte gUnknown_02017780

	THUMB_FUNC_END sub_80525E8

	THUMB_FUNC_START sub_80526C8
sub_80526C8: @ 0x080526C8
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x60]
	bl GetAISSubjectId
	ldr r0, [r5, #0x60]
	bl GetAISSubjectId
	ldr r1, [r5, #0x58]
	cmp r1, #0
	bne _08052718
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #2
	bne _08052718
	strh r1, [r5, #0x2c]
	ldr r1, [r5, #0x48]
	ldrh r0, [r5, #0x2e]
	adds r0, r0, r1
	strh r0, [r5, #0x2e]
	ldr r0, [r5, #0x60]
	bl GetAISSubjectId
	ldr r1, _08052764  @ gUnknown_0203E1AC
	lsls r0, r0, #1
	adds r0, r0, r1
	ldr r2, [r5, #0x48]
	ldrh r1, [r0]
	adds r1, r1, r2
	strh r1, [r0]
	movs r0, #0x2e
	ldrsh r1, [r5, r0]
	ldr r0, [r5, #0x50]
	cmp r1, r0
	bne _08052718
	movs r0, #1
	str r0, [r5, #0x58]
_08052718:
	ldr r0, [r5, #0x54]
	cmp r0, #0x54
	bne _08052774
	ldr r6, [r5, #0x58]
	cmp r6, #1
	bne _08052774
	ldr r4, _08052768  @ gUnknown_0203E152
	ldr r0, [r5, #0x60]
	bl GetAISSubjectId
	lsls r0, r0, #1
	adds r0, r0, r4
	ldrh r1, [r0]
	adds r1, #1
	movs r4, #0
	strh r1, [r0]
	ldr r0, [r5, #0x60]
	bl GetAISSubjectId
	ldr r1, _0805276C  @ gUnknown_02017780
	lsls r0, r0, #1
	adds r0, r0, r1
	strh r4, [r0]
	ldr r0, [r5, #0x50]
	cmp r0, #0
	bne _08052752
	adds r0, r5, #0
	adds r0, #0x29
	strb r6, [r0]
_08052752:
	strh r4, [r5, #0x2c]
	movs r0, #0xa
	strh r0, [r5, #0x2e]
	ldr r0, _08052770  @ gUnknown_02017750
	str r6, [r0]
	adds r0, r5, #0
	bl Proc_Break
	b _08052780
	.align 2, 0
_08052764: .4byte gUnknown_0203E1AC
_08052768: .4byte gUnknown_0203E152
_0805276C: .4byte gUnknown_02017780
_08052770: .4byte gUnknown_02017750
_08052774:
	adds r0, #1
	str r0, [r5, #0x54]
	cmp r0, #0x53
	bls _08052780
	movs r0, #0x54
	str r0, [r5, #0x54]
_08052780:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80526C8

	THUMB_FUNC_START sub_8052788
sub_8052788: @ 0x08052788
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	ldrh r0, [r6, #0x2c]
	adds r0, #1
	movs r7, #0
	strh r0, [r6, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x2e
	ldrsh r1, [r6, r2]
	cmp r0, r1
	ble _08052822
	ldr r4, _08052804  @ gUnknown_0203E152
	ldr r0, [r6, #0x5c]
	bl GetAISSubjectId
	lsls r0, r0, #1
	adds r0, r0, r4
	movs r1, #0
	ldrsh r5, [r0, r1]
	adds r4, r5, #1
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	ldr r0, [r6, #0x5c]
	bl GetAISSubjectId
	lsls r5, r5, #1
	adds r5, r5, r0
	adds r0, r5, #0
	bl sub_8058A60
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [r6, #0x4c]
	ldr r0, [r6, #0x5c]
	bl GetAISSubjectId
	lsls r4, r4, #0x10
	asrs r4, r4, #0xf
	adds r4, r4, r0
	adds r0, r4, #0
	bl sub_8058A60
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [r6, #0x50]
	strh r7, [r6, #0x2c]
	ldr r1, [r6, #0x4c]
	strh r1, [r6, #0x2e]
	str r7, [r6, #0x54]
	str r7, [r6, #0x58]
	cmp r1, r0
	bne _080527F6
	movs r0, #1
	str r0, [r6, #0x58]
_080527F6:
	ldr r1, [r6, #0x4c]
	ldr r0, [r6, #0x50]
	cmp r1, r0
	ble _08052808
	movs r0, #1
	negs r0, r0
	b _0805280A
	.align 2, 0
_08052804: .4byte gUnknown_0203E152
_08052808:
	movs r0, #1
_0805280A:
	str r0, [r6, #0x48]
	adds r0, r6, #0
	bl Proc_Break
	ldr r0, [r6, #0x5c]
	bl GetAISSubjectId
	ldr r1, _08052828  @ gUnknown_02017780
	lsls r0, r0, #1
	adds r0, r0, r1
	movs r1, #2
	strh r1, [r0]
_08052822:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08052828: .4byte gUnknown_02017780

	THUMB_FUNC_END sub_8052788

	THUMB_FUNC_START sub_805282C
sub_805282C: @ 0x0805282C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	ldr r4, _08052900  @ gUnknown_02000000
	ldr r0, [r5, #0x5c]
	bl GetAISSubjectId
	lsls r0, r0, #3
	adds r0, r0, r4
	ldr r7, [r0]
	ldr r0, [r5, #0x5c]
	bl GetAISSubjectId
	ldr r0, [r5, #0x60]
	bl GetAISSubjectId
	lsls r0, r0, #3
	adds r0, r0, r4
	ldr r6, [r0]
	ldr r0, [r5, #0x60]
	bl GetAISSubjectId
	lsls r0, r0, #1
	adds r0, #1
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r0, [r0]
	mov r8, r0
	ldr r1, [r5, #0x58]
	cmp r1, #0
	bne _080528BC
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #4
	bne _080528BC
	strh r1, [r5, #0x2c]
	ldr r1, [r5, #0x48]
	ldrh r0, [r5, #0x2e]
	adds r0, r0, r1
	strh r0, [r5, #0x2e]
	ldr r0, [r5, #0x5c]
	bl GetAISSubjectId
	ldr r1, _08052904  @ gUnknown_0203E1AC
	lsls r0, r0, #1
	adds r0, r0, r1
	ldr r2, [r5, #0x48]
	ldrh r1, [r0]
	adds r1, r1, r2
	strh r1, [r0]
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #0x75
	bl SomePlaySound_8071990
	movs r0, #2
	ldrsh r1, [r7, r0]
	movs r0, #0x75
	movs r2, #1
	bl sub_8071AB0
	movs r0, #0x2e
	ldrsh r1, [r5, r0]
	ldr r0, [r5, #0x50]
	cmp r1, r0
	bne _080528BC
	movs r0, #1
	str r0, [r5, #0x58]
_080528BC:
	ldr r1, [r5, #0x54]
	cmp r1, #0x1e
	bne _08052960
	ldr r0, [r5, #0x58]
	cmp r0, #1
	bne _08052960
	ldr r4, _08052908  @ gUnknown_0203E152
	ldr r0, [r5, #0x5c]
	bl GetAISSubjectId
	lsls r0, r0, #1
	adds r0, r0, r4
	ldrh r1, [r0]
	adds r1, #1
	movs r4, #0
	strh r1, [r0]
	ldr r0, [r5, #0x5c]
	bl GetAISSubjectId
	ldr r1, _0805290C  @ gUnknown_02017780
	lsls r0, r0, #1
	adds r0, r0, r1
	strh r4, [r0]
	adds r0, r5, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #1
	bne _08052954
	bl sub_804FD54
	cmp r0, #1
	bne _08052910
	movs r0, #0
	b _08052924
	.align 2, 0
_08052900: .4byte gUnknown_02000000
_08052904: .4byte gUnknown_0203E1AC
_08052908: .4byte gUnknown_0203E152
_0805290C: .4byte gUnknown_02017780
_08052910:
	ldr r4, _08052934  @ gEkrBuIndexes
	adds r0, r6, #0
	bl GetAISSubjectId
	adds r0, r0, r4
	ldrb r0, [r0]
	bl sub_80835A8
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
_08052924:
	cmp r0, #1
	bne _08052938
	adds r0, r6, #0
	mov r1, r8
	bl sub_8052DD4
	b _08052954
	.align 2, 0
_08052934: .4byte gEkrBuIndexes
_08052938:
	bl sub_805B07C
	adds r0, r6, #0
	mov r1, r8
	bl sub_8052FAC
	ldr r0, [r5, #0x60]
	bl GetAISSubjectId
	ldr r1, _0805295C  @ gUnknown_0203E104
	lsls r0, r0, #1
	adds r0, r0, r1
	movs r1, #0
	strh r1, [r0]
_08052954:
	adds r0, r5, #0
	bl Proc_Break
	b _0805296C
	.align 2, 0
_0805295C: .4byte gUnknown_0203E104
_08052960:
	adds r0, r1, #1
	str r0, [r5, #0x54]
	cmp r0, #0x1d
	bls _0805296C
	movs r0, #0x1e
	str r0, [r5, #0x54]
_0805296C:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_805282C

	THUMB_FUNC_START sub_8052978
sub_8052978: @ 0x08052978
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r1, _080529A8  @ gUnknown_02017728
	ldr r5, [r1]
	cmp r5, #0
	bne _080529E6
	movs r0, #1
	str r0, [r1]
	ldr r0, _080529AC  @ gProc_efxAvoid
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	strh r5, [r4, #0x2c]
	adds r0, r6, #0
	bl GetAISSubjectId
	cmp r0, #0
	bne _080529B4
	ldr r0, _080529B0  @ gUnknown_02000000
	ldr r1, [r0, #8]
	str r1, [r4, #0x5c]
	ldr r0, [r0]
	b _080529BC
	.align 2, 0
_080529A8: .4byte gUnknown_02017728
_080529AC: .4byte gProc_efxAvoid
_080529B0: .4byte gUnknown_02000000
_080529B4:
	ldr r0, _080529EC  @ gUnknown_02000000
	ldr r1, [r0]
	str r1, [r4, #0x5c]
	ldr r0, [r0, #8]
_080529BC:
	str r0, [r4, #0x60]
	ldr r0, [r4, #0x60]
	movs r1, #1
	bl sub_806C61C
	str r6, [r4, #0x64]
	adds r1, r4, #0
	adds r1, #0x29
	movs r0, #0
	strb r0, [r1]
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #0xd7
	bl SomePlaySound_8071990
	movs r0, #2
	ldrsh r1, [r6, r0]
	movs r0, #0xd7
	movs r2, #1
	bl sub_8071AB0
_080529E6:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080529EC: .4byte gUnknown_02000000

	THUMB_FUNC_END sub_8052978

	THUMB_FUNC_START sub_80529F0
sub_80529F0: @ 0x080529F0
	push {lr}
	adds r1, r0, #0
	ldrh r0, [r1, #0x2c]
	adds r0, #1
	strh r0, [r1, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x1e
	bne _08052A08
	adds r0, r1, #0
	bl Proc_Break
_08052A08:
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80529F0

	THUMB_FUNC_START sub_8052A0C
sub_8052A0C: @ 0x08052A0C
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	ldr r1, _08052A3C  @ gUnknown_02017728
	ldr r0, [r1]
	cmp r0, #0
	bne _08052AD8
	movs r0, #1
	str r0, [r1]
	ldr r0, _08052A40  @ gProc_efxHPBarLive
	movs r1, #3
	bl Proc_Start
	adds r6, r0, #0
	adds r0, r7, #0
	bl GetAISSubjectId
	cmp r0, #0
	bne _08052A48
	ldr r0, _08052A44  @ gUnknown_02000000
	ldr r1, [r0, #8]
	str r1, [r6, #0x5c]
	ldr r0, [r0]
	b _08052A50
	.align 2, 0
_08052A3C: .4byte gUnknown_02017728
_08052A40: .4byte gProc_efxHPBarLive
_08052A44: .4byte gUnknown_02000000
_08052A48:
	ldr r0, _08052AA8  @ gUnknown_02000000
	ldr r1, [r0]
	str r1, [r6, #0x5c]
	ldr r0, [r0, #8]
_08052A50:
	str r0, [r6, #0x60]
	ldr r4, _08052AAC  @ gUnknown_0203E152
	ldr r0, [r6, #0x60]
	bl GetAISSubjectId
	lsls r0, r0, #1
	adds r0, r0, r4
	movs r1, #0
	ldrsh r5, [r0, r1]
	adds r4, r5, #1
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	ldr r0, [r6, #0x60]
	bl GetAISSubjectId
	lsls r5, r5, #1
	adds r5, r5, r0
	adds r0, r5, #0
	bl sub_8058A60
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [r6, #0x4c]
	ldr r0, [r6, #0x60]
	bl GetAISSubjectId
	lsls r4, r4, #0x10
	asrs r4, r4, #0xf
	adds r4, r4, r0
	adds r0, r4, #0
	bl sub_8058A60
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	str r1, [r6, #0x50]
	movs r0, #0
	str r0, [r6, #0x54]
	str r0, [r6, #0x58]
	ldr r0, [r6, #0x4c]
	cmp r0, r1
	bne _08052AB0
	movs r0, #1
	str r0, [r6, #0x58]
	b _08052ABE
	.align 2, 0
_08052AA8: .4byte gUnknown_02000000
_08052AAC: .4byte gUnknown_0203E152
_08052AB0:
	cmp r0, r1
	ble _08052ABA
	movs r0, #1
	negs r0, r0
	b _08052ABC
_08052ABA:
	movs r0, #1
_08052ABC:
	str r0, [r6, #0x48]
_08052ABE:
	movs r0, #0
	strh r0, [r6, #0x2c]
	ldr r0, [r6, #0x4c]
	strh r0, [r6, #0x2e]
	str r7, [r6, #0x64]
	ldr r0, [r6, #0x5c]
	bl GetAISSubjectId
	ldr r1, _08052AE0  @ gUnknown_02017780
	lsls r0, r0, #1
	adds r0, r0, r1
	movs r1, #2
	strh r1, [r0]
_08052AD8:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08052AE0: .4byte gUnknown_02017780

	THUMB_FUNC_END sub_8052A0C

	THUMB_FUNC_START sub_8052AE4
sub_8052AE4: @ 0x08052AE4
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r6, [r5, #0x60]
	ldr r1, [r5, #0x58]
	cmp r1, #0
	bne _08052B40
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #4
	bne _08052B40
	strh r1, [r5, #0x2c]
	ldr r1, [r5, #0x48]
	ldrh r0, [r5, #0x2e]
	adds r0, r0, r1
	strh r0, [r5, #0x2e]
	adds r0, r6, #0
	bl GetAISSubjectId
	ldr r1, _08052B78  @ gUnknown_0203E1AC
	lsls r0, r0, #1
	adds r0, r0, r1
	ldr r2, [r5, #0x48]
	ldrh r1, [r0]
	adds r1, r1, r2
	strh r1, [r0]
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #0x75
	bl SomePlaySound_8071990
	movs r0, #2
	ldrsh r1, [r6, r0]
	movs r0, #0x75
	movs r2, #1
	bl sub_8071AB0
	movs r0, #0x2e
	ldrsh r1, [r5, r0]
	ldr r0, [r5, #0x50]
	cmp r1, r0
	bne _08052B40
	movs r0, #1
	str r0, [r5, #0x58]
_08052B40:
	ldr r1, [r5, #0x54]
	cmp r1, #0x1e
	bne _08052B84
	ldr r0, [r5, #0x58]
	cmp r0, #1
	bne _08052B84
	ldr r4, _08052B7C  @ gUnknown_0203E152
	adds r0, r6, #0
	bl GetAISSubjectId
	lsls r0, r0, #1
	adds r0, r0, r4
	ldrh r1, [r0]
	adds r1, #1
	movs r4, #0
	strh r1, [r0]
	adds r0, r6, #0
	bl GetAISSubjectId
	ldr r1, _08052B80  @ gUnknown_02017780
	lsls r0, r0, #1
	adds r0, r0, r1
	strh r4, [r0]
	adds r0, r5, #0
	bl Proc_Break
	b _08052B90
	.align 2, 0
_08052B78: .4byte gUnknown_0203E1AC
_08052B7C: .4byte gUnknown_0203E152
_08052B80: .4byte gUnknown_02017780
_08052B84:
	adds r0, r1, #1
	str r0, [r5, #0x54]
	cmp r0, #0x1d
	bls _08052B90
	movs r0, #0x1e
	str r0, [r5, #0x54]
_08052B90:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8052AE4

	THUMB_FUNC_START sub_8052B98
sub_8052B98: @ 0x08052B98
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	adds r7, r2, #0
	bl GetAISSubjectId
	adds r1, r0, #0
	ldrh r0, [r5, #0xe]
	subs r0, #1
	lsls r0, r0, #1
	adds r0, r0, r1
	bl sub_8058A34
	movs r1, #0x80
	lsls r1, r1, #3
	ands r1, r0
	cmp r1, #0
	bne _08052C12
	adds r0, r5, #0
	bl GetAISSubjectId
	cmp r0, #0
	bne _08052BD0
	ldr r0, _08052BCC  @ gpEkrBattleUnitRight
	b _08052BD2
	.align 2, 0
_08052BCC: .4byte gpEkrBattleUnitRight
_08052BD0:
	ldr r0, _08052C18  @ gpEkrBattleUnitLeft
_08052BD2:
	ldr r0, [r0]
	adds r0, #0x4a
	ldrh r0, [r0]
	bl GetItemIndex
	cmp r0, #0xb5
	beq _08052C12
	ldr r1, _08052C1C  @ gUnknown_02017728
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08052C20  @ gProc_efxNoDamage
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	str r6, [r4, #0x60]
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r4, #0
	adds r0, #0x29
	strb r7, [r0]
	str r5, [r4, #0x64]
	ldr r0, [r4, #0x5c]
	movs r1, #0
	bl sub_806C61C
	ldr r0, [r4, #0x5c]
	ldr r1, [r4, #0x60]
	bl sub_8052C7C
_08052C12:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08052C18: .4byte gpEkrBattleUnitLeft
_08052C1C: .4byte gUnknown_02017728
_08052C20: .4byte gProc_efxNoDamage

	THUMB_FUNC_END sub_8052B98

	THUMB_FUNC_START sub_8052C24
sub_8052C24: @ 0x08052C24
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetCoreAIStruct
	adds r5, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	movs r1, #0x2c
	ldrsh r0, [r4, r1]
	cmp r0, #8
	bne _08052C70
	ldr r6, _08052C78  @ gUnknown_0203E152
	ldr r0, [r4, #0x5c]
	bl GetAISSubjectId
	lsls r0, r0, #1
	adds r0, r0, r6
	ldrh r1, [r0]
	adds r1, #1
	strh r1, [r0]
	adds r0, r4, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #1
	bne _08052C6A
	adds r0, r5, #0
	bl GetAISSubjectId
	lsls r0, r0, #1
	adds r0, r0, r6
	ldrh r1, [r0]
	adds r1, #1
	strh r1, [r0]
_08052C6A:
	adds r0, r4, #0
	bl Proc_Break
_08052C70:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08052C78: .4byte gUnknown_0203E152

	THUMB_FUNC_END sub_8052C24

	THUMB_FUNC_START sub_8052C7C
sub_8052C7C: @ 0x08052C7C
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _08052C9C  @ gProc_efxNoDamageYure
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	str r5, [r0, #0x60]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r1, [r0, #0x2e]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08052C9C: .4byte gProc_efxNoDamageYure

	THUMB_FUNC_END sub_8052C7C

	THUMB_FUNC_START sub_8052CA0
sub_8052CA0: @ 0x08052CA0
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	adds r7, r0, #0
	ldr r0, [r7, #0x5c]
	mov r8, r0
	ldr r1, [r7, #0x60]
	mov r9, r1
	ldr r4, _08052D04  @ gUnknown_080DA438
	movs r2, #0x2c
	ldrsh r0, [r7, r2]
	lsls r0, r0, #1
	adds r0, r0, r4
	movs r2, #0
	ldrsh r1, [r0, r2]
	movs r0, #1
	negs r0, r0
	cmp r1, r0
	bne _08052D10
	bl sub_806FAB0
	cmp r0, #0
	bne _08052CFC
	ldr r0, [r7, #0x5c]
	bl GetAISSubjectId
	ldr r5, _08052D08  @ gUnknown_02000028
	lsls r0, r0, #1
	adds r0, r0, r5
	ldr r4, _08052D0C  @ gUnknown_0201FB0C
	ldr r1, [r4]
	ldrh r0, [r0]
	subs r0, r0, r1
	mov r1, r8
	strh r0, [r1, #2]
	ldr r0, [r7, #0x60]
	bl GetAISSubjectId
	lsls r0, r0, #1
	adds r0, r0, r5
	ldr r1, [r4]
	ldrh r0, [r0]
	subs r0, r0, r1
	mov r2, r9
	strh r0, [r2, #2]
_08052CFC:
	adds r0, r7, #0
	bl Proc_Break
	b _08052D78
	.align 2, 0
_08052D04: .4byte gUnknown_080DA438
_08052D08: .4byte gUnknown_02000028
_08052D0C: .4byte gUnknown_0201FB0C
_08052D10:
	mov r0, r8
	bl GetAISSubjectId
	cmp r0, #1
	bne _08052D2C
	movs r1, #0x2c
	ldrsh r0, [r7, r1]
	lsls r0, r0, #1
	adds r0, r0, r4
	ldrh r0, [r0]
	negs r0, r0
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	b _08052D36
_08052D2C:
	movs r2, #0x2c
	ldrsh r0, [r7, r2]
	lsls r0, r0, #1
	adds r0, r0, r4
	ldrh r4, [r0]
_08052D36:
	bl sub_806FAB0
	cmp r0, #0
	bne _08052D72
	ldr r0, [r7, #0x5c]
	bl GetAISSubjectId
	ldr r6, _08052D84  @ gUnknown_02000028
	lsls r0, r0, #1
	adds r0, r0, r6
	ldr r5, _08052D88  @ gUnknown_0201FB0C
	ldr r1, [r5]
	ldrh r0, [r0]
	subs r0, r0, r1
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	adds r0, r4, r0
	mov r1, r8
	strh r0, [r1, #2]
	ldr r0, [r7, #0x60]
	bl GetAISSubjectId
	lsls r0, r0, #1
	adds r0, r0, r6
	ldr r1, [r5]
	ldrh r0, [r0]
	subs r0, r0, r1
	adds r4, r4, r0
	mov r2, r9
	strh r4, [r2, #2]
_08052D72:
	ldrh r0, [r7, #0x2c]
	adds r0, #1
	strh r0, [r7, #0x2c]
_08052D78:
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08052D84: .4byte gUnknown_02000028
_08052D88: .4byte gUnknown_0201FB0C

	THUMB_FUNC_END sub_8052CA0

	THUMB_FUNC_START sub_8052D8C
sub_8052D8C: @ 0x08052D8C
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r1, _08052DB0  @ gUnknown_02017728
	ldr r4, [r1]
	cmp r4, #0
	bne _08052DA8
	movs r0, #1
	str r0, [r1]
	ldr r0, _08052DB4  @ gProc_efxStatusCHG
	movs r1, #3
	bl Proc_Start
	strh r4, [r0, #0x2c]
	str r5, [r0, #0x64]
_08052DA8:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08052DB0: .4byte gUnknown_02017728
_08052DB4: .4byte gProc_efxStatusCHG

	THUMB_FUNC_END sub_8052D8C

	THUMB_FUNC_START sub_8052DB8
sub_8052DB8: @ 0x08052DB8
	push {lr}
	adds r1, r0, #0
	ldrh r0, [r1, #0x2c]
	adds r0, #1
	strh r0, [r1, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x11
	bne _08052DD0
	adds r0, r1, #0
	bl Proc_Break
_08052DD0:
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8052DB8

	THUMB_FUNC_START sub_8052DD4
sub_8052DD4: @ 0x08052DD4
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _08052DF4  @ gProc_efxDeadEvent
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	str r5, [r0, #0x60]
	ldr r1, _08052DF8  @ gUnknown_02017738
	movs r0, #1
	str r0, [r1]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08052DF4: .4byte gProc_efxDeadEvent
_08052DF8: .4byte gUnknown_02017738

	THUMB_FUNC_END sub_8052DD4

	THUMB_FUNC_START sub_8052DFC
sub_8052DFC: @ 0x08052DFC
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x5c]
	bl GetCoreAIStruct
	adds r7, r0, #0
	movs r6, #0
	ldr r0, _08052E68  @ gUnknown_0201774C
	ldr r0, [r0]
	cmp r0, #0
	bne _08052E2E
	ldr r0, _08052E6C  @ gUnknown_0201772C
	ldr r0, [r0]
	cmp r0, #0
	bne _08052E2E
	ldr r4, _08052E70  @ gUnknown_0201FB04
	adds r0, r7, #0
	bl GetAISSubjectId
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r0, [r0]
	cmp r0, #1
	bne _08052E2E
	movs r6, #1
_08052E2E:
	cmp r6, #1
	bne _08052E62
	movs r0, #7
	strh r0, [r5, #0x2c]
	ldr r0, _08052E74  @ gUnknown_0203E120
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _08052E5C
	ldr r0, [r5, #0x5c]
	bl GetAISSubjectId
	ldr r1, _08052E78  @ gUnknown_02017744
	ldr r1, [r1]
	cmp r0, r1
	beq _08052E5C
	movs r1, #1
	negs r1, r1
	adds r0, r7, #0
	bl sub_80533D0
	movs r0, #0
	strh r0, [r5, #0x2c]
_08052E5C:
	adds r0, r5, #0
	bl Proc_Break
_08052E62:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08052E68: .4byte gUnknown_0201774C
_08052E6C: .4byte gUnknown_0201772C
_08052E70: .4byte gUnknown_0201FB04
_08052E74: .4byte gUnknown_0203E120
_08052E78: .4byte gUnknown_02017744

	THUMB_FUNC_END sub_8052DFC

	THUMB_FUNC_START sub_8052E7C
sub_8052E7C: @ 0x08052E7C
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #8
	bne _08052EA6
	movs r0, #1
	movs r1, #7
	bl NewEkrWindowAppear
	movs r0, #1
	movs r1, #7
	movs r2, #0
	bl NewEkrNamewinAppear
	adds r0, r4, #0
	bl Proc_Break
_08052EA6:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8052E7C

	THUMB_FUNC_START sub_8052EAC
sub_8052EAC: @ 0x08052EAC
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	bl DoesEkrWindowAppearExist
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _08052F0A
	bl EkrGauge_8051218
	bl sub_8051B90
	movs r0, #0
	str r0, [sp]
	ldr r1, _08052F14  @ gBG0TilemapBuffer
	ldr r2, _08052F18  @ 0x01000200
	mov r0, sp
	bl CpuFastSet
	ldr r0, _08052F1C  @ gUnknown_02000038
	ldrh r1, [r0]
	ldrh r2, [r0, #2]
	movs r0, #0
	bl BG_SetPosition
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	movs r0, #1
	bl BG_EnableSyncByMask
	bl EkrGauge_8051190
	ldr r4, _08052F20  @ gEkrBuIndexes
	ldr r0, [r5, #0x5c]
	bl GetAISSubjectId
	adds r0, r0, r4
	ldrb r0, [r0]
	bl sub_80835DC
	adds r0, r5, #0
	bl Proc_Break
_08052F0A:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08052F14: .4byte gBG0TilemapBuffer
_08052F18: .4byte 0x01000200
_08052F1C: .4byte gUnknown_02000038
_08052F20: .4byte gEkrBuIndexes

	THUMB_FUNC_END sub_8052EAC

	THUMB_FUNC_START sub_8052F24
sub_8052F24: @ 0x08052F24
	push {r4, r5, lr}
	adds r4, r0, #0
	bl BattleEventEngineExists
	adds r5, r0, #0
	cmp r5, #0
	bne _08052F7A
	bl sub_805B07C
	ldr r0, [r4, #0x5c]
	ldr r1, [r4, #0x60]
	bl sub_8052FAC
	bl sub_8051F1C
	ldr r0, [r4, #0x5c]
	bl GetAISSubjectId
	ldr r1, _08052F80  @ gUnknown_0203E104
	lsls r0, r0, #1
	adds r0, r0, r1
	strh r5, [r0]
	movs r0, #1
	bl BG_EnableSyncByMask
	movs r0, #0
	movs r1, #7
	bl NewEkrWindowAppear
	movs r0, #0
	movs r1, #7
	movs r2, #0
	bl NewEkrNamewinAppear
	bl EkrGauge_8051228
	bl sub_8051BA0
	bl EkrGauge_8051180
	adds r0, r4, #0
	bl Proc_Break
_08052F7A:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08052F80: .4byte gUnknown_0203E104

	THUMB_FUNC_END sub_8052F24

	THUMB_FUNC_START sub_8052F84
sub_8052F84: @ 0x08052F84
	push {r4, lr}
	adds r4, r0, #0
	bl DoesEkrWindowAppearExist
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _08052FA0
	ldr r1, _08052FA8  @ gUnknown_02017738
	movs r0, #0
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
_08052FA0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08052FA8: .4byte gUnknown_02017738

	THUMB_FUNC_END sub_8052F84

	THUMB_FUNC_START sub_8052FAC
sub_8052FAC: @ 0x08052FAC
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, _08052FE0  @ gUnknown_02017728
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r1, _08052FE4  @ gUnknown_02017734
	movs r0, #1
	str r0, [r1]
	ldr r0, _08052FE8  @ gProc_efxDead
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	str r5, [r0, #0x60]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r1, [r0, #0x2e]
	adds r0, r4, #0
	bl sub_8054B64
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08052FE0: .4byte gUnknown_02017728
_08052FE4: .4byte gUnknown_02017734
_08052FE8: .4byte gProc_efxDead

	THUMB_FUNC_END sub_8052FAC

	THUMB_FUNC_START sub_8052FEC
sub_8052FEC: @ 0x08052FEC
	push {r4, r5, lr}
	adds r5, r0, #0
	bl sub_806FAB0
	cmp r0, #1
	bne _08053030
	ldr r0, [r5, #0x5c]
	bl GetAISSubjectId
	cmp r0, #0
	bne _08053030
	ldr r0, [r5, #0x5c]
	bl GetAISSubjectId
	adds r4, r0, #0
	ldr r0, [r5, #0x5c]
	bl GetAISSubjectId
	adds r1, r0, #0
	ldr r0, _0805302C  @ gUnknown_0203E152
	lsls r4, r4, #1
	adds r4, r4, r0
	movs r2, #0
	ldrsh r0, [r4, r2]
	lsls r0, r0, #1
	adds r0, r0, r1
	bl sub_8058A60
	lsls r0, r0, #0x10
	asrs r4, r0, #0x10
	b _08053032
	.align 2, 0
_0805302C: .4byte gUnknown_0203E152
_08053030:
	movs r4, #1
_08053032:
	ldr r0, _08053054  @ gUnknown_0201774C
	ldr r0, [r0]
	cmp r0, #0
	bne _0805307A
	ldr r0, _08053058  @ gUnknown_0201772C
	ldr r0, [r0]
	cmp r0, #0
	bne _0805307A
	bl sub_806FAB0
	cmp r0, #2
	bne _0805305C
	ldr r0, [r5, #0x5c]
	bl sub_80701F4
	b _08053070
	.align 2, 0
_08053054: .4byte gUnknown_0201774C
_08053058: .4byte gUnknown_0201772C
_0805305C:
	cmp r4, #0
	bne _08053068
	ldr r0, [r5, #0x5c]
	bl sub_8070204
	b _08053070
_08053068:
	ldr r0, [r5, #0x5c]
	ldr r1, [r5, #0x60]
	bl sub_8053120
_08053070:
	movs r0, #0x32
	strh r0, [r5, #0x2e]
	adds r0, r5, #0
	bl Proc_Break
_0805307A:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8052FEC

	THUMB_FUNC_START sub_8053080
sub_8053080: @ 0x08053080
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r5, [r4, #0x5c]
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	cmp r1, #0x1e
	bne _080530F6
	adds r0, r5, #0
	bl sub_8070214
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq _08053112
	ldr r0, [r4, #0x5c]
	bl sub_8070234
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080530D2
	ldr r0, [r4, #0x5c]
	ldr r1, [r4, #0x60]
	bl sub_805328C
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #0xd6
	bl SomePlaySound_8071990
	movs r0, #2
	ldrsh r1, [r5, r0]
	movs r0, #0xd6
	movs r2, #1
	bl sub_8071AB0
	movs r0, #0x64
	strh r0, [r4, #0x2e]
	b _08053112
_080530D2:
	ldr r0, [r4, #0x5c]
	ldr r1, [r4, #0x60]
	bl sub_80531A4
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #0xd6
	bl SomePlaySound_8071990
	movs r2, #2
	ldrsh r1, [r5, r2]
	movs r0, #0xd6
	movs r2, #1
	bl sub_8071AB0
	movs r0, #0x32
	strh r0, [r4, #0x2e]
	b _08053112
_080530F6:
	movs r2, #0x2e
	ldrsh r0, [r4, r2]
	cmp r1, r0
	bne _08053112
	ldr r1, _08053118  @ gUnknown_02017728
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	ldr r1, _0805311C  @ gUnknown_02017734
	movs r0, #0
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
_08053112:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08053118: .4byte gUnknown_02017728
_0805311C: .4byte gUnknown_02017734

	THUMB_FUNC_END sub_8053080

	THUMB_FUNC_START sub_8053120
sub_8053120: @ 0x08053120
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _08053140  @ gProc_efxDeadPika
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	str r5, [r0, #0x60]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r1, [r0, #0x2e]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08053140: .4byte gProc_efxDeadPika

	THUMB_FUNC_END sub_8053120

	THUMB_FUNC_START sub_8053144
sub_8053144: @ 0x08053144
	push {r4, r5, lr}
	adds r3, r0, #0
	ldr r4, [r3, #0x5c]
	ldr r5, [r3, #0x60]
	ldrh r0, [r3, #0x2c]
	adds r0, #1
	strh r0, [r3, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #6
	ble _0805317C
	ldrh r2, [r4]
	ldr r1, _08053178  @ 0x0000FFFD
	adds r0, r1, #0
	ands r0, r2
	strh r0, [r4]
	ldrh r0, [r5]
	ands r1, r0
	strh r1, [r5]
	movs r0, #0
	strh r0, [r3, #0x2c]
	ldrh r0, [r3, #0x2e]
	adds r0, #1
	strh r0, [r3, #0x2e]
	b _0805318A
	.align 2, 0
_08053178: .4byte 0x0000FFFD
_0805317C:
	ldrh r0, [r4]
	movs r1, #2
	orrs r0, r1
	strh r0, [r4]
	ldrh r0, [r5]
	orrs r0, r1
	strh r0, [r5]
_0805318A:
	movs r1, #0x2e
	ldrsh r0, [r3, r1]
	cmp r0, #5
	ble _0805319E
	movs r0, #0
	strh r0, [r3, #0x2c]
	strh r0, [r3, #0x2e]
	adds r0, r3, #0
	bl Proc_Break
_0805319E:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8053144

	THUMB_FUNC_START sub_80531A4
sub_80531A4: @ 0x080531A4
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	adds r6, r1, #0
	ldr r0, _08053204  @ gProc_efxDeadAlpha
	movs r1, #3
	bl Proc_Start
	str r5, [r0, #0x5c]
	str r6, [r0, #0x60]
	movs r4, #0
	strh r4, [r0, #0x2c]
	strh r4, [r0, #0x2e]
	movs r0, #0xa
	strh r0, [r5, #0xa]
	strh r0, [r6, #0xa]
	bl AnimSort
	movs r0, #0
	movs r1, #0x10
	movs r2, #0x10
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
	movs r3, #1
	bl SetBlendTargetB
	ldr r1, _08053208  @ gLCDControlBuffer
	adds r1, #0x3d
	ldrb r0, [r1]
	movs r2, #0x20
	orrs r0, r2
	strb r0, [r1]
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08053204: .4byte gProc_efxDeadAlpha
_08053208: .4byte gLCDControlBuffer

	THUMB_FUNC_END sub_80531A4

	THUMB_FUNC_START sub_805320C
sub_805320C: @ 0x0805320C
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r2, [r4, #0x5c]
	ldr r3, [r4, #0x60]
	ldr r0, [r2, #0x1c]
	movs r1, #0x80
	lsls r1, r1, #3
	orrs r0, r1
	str r0, [r2, #0x1c]
	ldr r0, [r3, #0x1c]
	orrs r0, r1
	str r0, [r3, #0x1c]
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x3c
	ble _08053260
	ldrh r0, [r2]
	movs r1, #2
	orrs r0, r1
	strh r0, [r2]
	ldrh r0, [r3]
	orrs r0, r1
	strh r0, [r3]
	ldr r0, [r2, #0x1c]
	ldr r1, _0805325C  @ 0xFFFFFBFF
	ands r0, r1
	str r0, [r2, #0x1c]
	ldr r0, [r3, #0x1c]
	ands r0, r1
	str r0, [r3, #0x1c]
	bl SetDefaultColorEffects
	adds r0, r4, #0
	bl Proc_Break
	b _08053282
	.align 2, 0
_0805325C: .4byte 0xFFFFFBFF
_08053260:
	movs r0, #0x2c
	ldrsh r3, [r4, r0]
	movs r0, #0x3c
	str r0, [sp]
	movs r0, #0
	movs r1, #0x10
	movs r2, #0
	bl Interpolate
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	movs r0, #0
	movs r2, #0x10
	movs r3, #0
	bl SetSpecialColorEffectsParameters
_08053282:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_805320C

	THUMB_FUNC_START sub_805328C
sub_805328C: @ 0x0805328C
	push {r4, r5, r6, lr}
	mov r6, r9
	mov r5, r8
	push {r5, r6}
	sub sp, #4
	adds r5, r0, #0
	adds r6, r1, #0
	ldr r0, _08053360  @ gProc_efxDeadDragonAlpha
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	str r6, [r4, #0x60]
	ldrh r0, [r5]
	movs r1, #2
	movs r2, #0
	mov r9, r2
	movs r2, #0
	mov r8, r2
	orrs r0, r1
	strh r0, [r5]
	ldrh r0, [r6]
	orrs r0, r1
	strh r0, [r6]
	movs r0, #0
	movs r1, #0
	movs r2, #1
	bl sub_806FC8C
	mov r0, r8
	strh r0, [r4, #0x2c]
	strh r0, [r4, #0x2e]
	movs r0, #1
	movs r1, #0x10
	movs r2, #0x10
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	mov r1, r8
	str r1, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #1
	bl SetBlendTargetA
	mov r2, r8
	str r2, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #1
	movs r3, #0
	bl SetBlendTargetB
	ldr r4, _08053364  @ gLCDControlBuffer
	ldrb r0, [r4, #1]
	movs r2, #0x20
	orrs r0, r2
	movs r1, #0x41
	negs r1, r1
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r4, #1]
	adds r0, r4, #0
	adds r0, #0x2d
	mov r1, r9
	strb r1, [r0]
	adds r0, #4
	strb r1, [r0]
	adds r1, r4, #0
	adds r1, #0x2c
	movs r0, #0xf0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0xa0
	strb r0, [r1]
	adds r3, r4, #0
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
	orrs r0, r2
	strb r0, [r3]
	adds r1, r4, #0
	adds r1, #0x3d
	ldrb r0, [r1]
	orrs r0, r2
	strb r0, [r1]
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08053360: .4byte gProc_efxDeadDragonAlpha
_08053364: .4byte gLCDControlBuffer

	THUMB_FUNC_END sub_805328C

	THUMB_FUNC_START sub_8053368
sub_8053368: @ 0x08053368
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x3c
	ble _080533A4
	movs r0, #0
	bl sub_80559D0
	ldr r0, _080533A0  @ gBG3TilemapBuffer
	movs r1, #0xf0
	lsls r1, r1, #8
	bl BG_Fill
	movs r0, #8
	bl BG_EnableSyncByMask
	bl SetDefaultColorEffects
	adds r0, r4, #0
	bl Proc_Break
	b _080533C6
	.align 2, 0
_080533A0: .4byte gBG3TilemapBuffer
_080533A4:
	movs r0, #0x2c
	ldrsh r3, [r4, r0]
	movs r0, #0x3c
	str r0, [sp]
	movs r0, #0
	movs r1, #0x10
	movs r2, #0
	bl Interpolate
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	movs r0, #1
	movs r2, #0x10
	movs r3, #0
	bl SetSpecialColorEffectsParameters
_080533C6:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8053368

	THUMB_FUNC_START sub_80533D0
sub_80533D0: @ 0x080533D0
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	lsls r1, r1, #0x10
	lsrs r6, r1, #0x10
	ldr r0, _080533EC  @ gUnknown_0203E120
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #4
	bhi _0805349E
	lsls r0, r0, #2
	ldr r1, _080533F0  @ _080533F4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080533EC: .4byte gUnknown_0203E120
_080533F0: .4byte _080533F4
_080533F4: @ jump table
	.4byte _0805349E @ case 0
	.4byte _08053408 @ case 1
	.4byte _08053408 @ case 2
	.4byte _0805349E @ case 3
	.4byte _0805349E @ case 4
_08053408:
	ldr r0, _0805343C  @ gProc_efxFarAttack
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	adds r0, r5, #0
	bl GetAISSubjectId
	adds r2, r4, #0
	adds r2, #0x29
	movs r1, #0
	strb r0, [r2]
	strh r1, [r4, #0x2c]
	lsls r1, r6, #0x10
	asrs r2, r1, #0x10
	movs r0, #1
	negs r0, r0
	cmp r2, r0
	beq _08053444
	asrs r0, r1, #0x11
	strh r0, [r4, #0x2e]
	subs r0, r2, r0
	strh r0, [r4, #0x30]
	ldr r2, _08053440  @ gUnknown_0203E120
	b _0805345E
	.align 2, 0
_0805343C: .4byte gProc_efxFarAttack
_08053440: .4byte gUnknown_0203E120
_08053444:
	ldr r0, _08053454  @ gUnknown_0203E120
	movs r2, #0
	ldrsh r1, [r0, r2]
	adds r2, r0, #0
	cmp r1, #1
	bne _08053458
	movs r0, #5
	b _0805345A
	.align 2, 0
_08053454: .4byte gUnknown_0203E120
_08053458:
	movs r0, #7
_0805345A:
	strh r0, [r4, #0x2e]
	strh r0, [r4, #0x30]
_0805345E:
	movs r1, #0
	ldrsh r0, [r2, r1]
	movs r1, #0xf0
	cmp r0, #1
	bne _0805346A
	movs r1, #0x20
_0805346A:
	adds r0, r4, #0
	adds r0, #0x29
	ldrb r2, [r0]
	cmp r2, #0
	bne _08053482
	negs r0, r1
	strh r0, [r4, #0x32]
	lsrs r0, r0, #1
	strh r0, [r4, #0x34]
	strh r0, [r4, #0x36]
	strh r2, [r4, #0x38]
	b _08053490
_08053482:
	movs r0, #0
	strh r0, [r4, #0x32]
	negs r1, r1
	lsrs r0, r1, #1
	strh r0, [r4, #0x34]
	strh r0, [r4, #0x36]
	strh r1, [r4, #0x38]
_08053490:
	ldr r1, _080534A4  @ gUnknown_0201FB0C
	movs r2, #0x32
	ldrsh r0, [r4, r2]
	str r0, [r1]
	ldr r1, _080534A8  @ gUnknown_02017748
	movs r0, #1
	str r0, [r1]
_0805349E:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080534A4: .4byte gUnknown_0201FB0C
_080534A8: .4byte gUnknown_02017748

	THUMB_FUNC_END sub_80533D0

	THUMB_FUNC_START sub_80534AC
sub_80534AC: @ 0x080534AC
	push {r4, lr}
	ldr r3, _080534DC  @ gUnknown_02000000
	ldr r4, [r3]
	negs r1, r1
	ldr r2, _080534E0  @ gUnknown_02000028
	ldrh r0, [r2]
	adds r0, r0, r1
	strh r0, [r4, #2]
	ldr r4, [r3, #4]
	ldrh r0, [r2]
	adds r0, r0, r1
	strh r0, [r4, #2]
	ldr r4, [r3, #8]
	ldrh r0, [r2, #2]
	adds r0, r0, r1
	strh r0, [r4, #2]
	ldr r4, [r3, #0xc]
	ldrh r0, [r2, #2]
	adds r0, r0, r1
	strh r0, [r4, #2]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080534DC: .4byte gUnknown_02000000
_080534E0: .4byte gUnknown_02000028

	THUMB_FUNC_END sub_80534AC

	THUMB_FUNC_START sub_80534E4
sub_80534E4: @ 0x080534E4
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x32
	ldrsh r1, [r4, r0]
	adds r0, r4, #0
	bl sub_80534AC
	movs r1, #0x32
	ldrsh r0, [r4, r1]
	movs r1, #0
	bl sub_806FB2C
	movs r1, #0x32
	ldrsh r0, [r4, r1]
	bl sub_8053618
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80534E4

	THUMB_FUNC_START sub_8053514
sub_8053514: @ 0x08053514
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	movs r0, #0x32
	ldrsh r1, [r4, r0]
	movs r5, #0x34
	ldrsh r2, [r4, r5]
	movs r0, #0x2c
	ldrsh r3, [r4, r0]
	movs r5, #0x2e
	ldrsh r0, [r4, r5]
	str r0, [sp]
	movs r0, #1
	bl Interpolate
	adds r1, r0, #0
	ldr r5, _08053580  @ gUnknown_0201FB0C
	str r1, [r5]
	adds r0, r4, #0
	bl sub_80534AC
	ldr r0, [r5]
	movs r1, #0
	bl sub_806FB2C
	ldr r0, [r5]
	bl sub_8053618
	bl sub_805B028
	cmp r0, #0
	beq _0805355A
	ldr r0, [r5]
	bl sub_805B034
_0805355A:
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x2e
	ldrsh r1, [r4, r2]
	cmp r0, r1
	ble _08053576
	movs r0, #1
	strh r0, [r4, #0x2c]
	adds r0, r4, #0
	bl Proc_Break
_08053576:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08053580: .4byte gUnknown_0201FB0C

	THUMB_FUNC_END sub_8053514

	THUMB_FUNC_START sub_8053584
sub_8053584: @ 0x08053584
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	movs r0, #0x36
	ldrsh r1, [r4, r0]
	movs r5, #0x38
	ldrsh r2, [r4, r5]
	movs r0, #0x2c
	ldrsh r3, [r4, r0]
	movs r5, #0x30
	ldrsh r0, [r4, r5]
	str r0, [sp]
	movs r0, #4
	bl Interpolate
	adds r1, r0, #0
	ldr r5, _080535EC  @ gUnknown_0201FB0C
	str r1, [r5]
	adds r0, r4, #0
	bl sub_80534AC
	ldr r0, [r5]
	movs r1, #0
	bl sub_806FB2C
	ldr r0, [r5]
	bl sub_8053618
	bl sub_805B028
	cmp r0, #0
	beq _080535CA
	ldr r0, [r5]
	bl sub_805B034
_080535CA:
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x30
	ldrsh r1, [r4, r2]
	cmp r0, r1
	ble _08053606
	adds r0, r4, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #0
	bne _080535F4
	ldr r1, _080535F0  @ gUnknown_02017744
	movs r0, #1
	b _080535F8
	.align 2, 0
_080535EC: .4byte gUnknown_0201FB0C
_080535F0: .4byte gUnknown_02017744
_080535F4:
	ldr r1, _08053610  @ gUnknown_02017744
	movs r0, #0
_080535F8:
	str r0, [r1]
	ldr r1, _08053614  @ gUnknown_02017748
	movs r0, #0
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
_08053606:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08053610: .4byte gUnknown_02017744
_08053614: .4byte gUnknown_02017748

	THUMB_FUNC_END sub_8053584

	THUMB_FUNC_START sub_8053618
sub_8053618: @ 0x08053618
	push {r4, r5, lr}
	sub sp, #0x10
	adds r5, r0, #0
	bl sub_806FAB0
	cmp r0, #2
	beq _08053668
	bl sub_805B028
	cmp r0, #0
	bne _08053668
	asrs r4, r5, #3
	movs r1, #7
	ands r1, r5
	movs r0, #2
	movs r2, #0
	bl BG_SetPosition
	lsls r4, r4, #1
	ldr r0, _08053670  @ gUnknown_0201C912
	adds r4, r4, r0
	movs r0, #0x84
	lsls r0, r0, #1
	adds r4, r4, r0
	ldr r2, _08053674  @ gBG2TilemapBuffer
	movs r0, #0x20
	str r0, [sp]
	movs r0, #0x14
	str r0, [sp, #4]
	subs r0, #0x15
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	adds r0, r4, #0
	movs r1, #0x42
	movs r3, #0x20
	bl sub_8070EF4
	movs r0, #4
	bl BG_EnableSyncByMask
_08053668:
	add sp, #0x10
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08053670: .4byte gUnknown_0201C912
_08053674: .4byte gBG2TilemapBuffer

	THUMB_FUNC_END sub_8053618

	THUMB_FUNC_START sub_8053678
sub_8053678: @ 0x08053678
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _080536B0  @ gProc_efxQuakePure
	movs r1, #3
	bl Proc_Start
	ldr r2, _080536B4  @ gUnknown_085B9804
	lsls r1, r4, #3
	adds r1, r1, r2
	ldr r1, [r1]
	str r1, [r0, #0x44]
	lsls r4, r4, #1
	adds r4, #1
	lsls r4, r4, #2
	adds r4, r4, r2
	ldr r1, [r4]
	adds r3, r0, #0
	adds r3, #0x29
	movs r2, #0
	strb r1, [r3]
	adds r1, r0, #0
	adds r1, #0x2a
	strb r5, [r1]
	strh r2, [r0, #0x2c]
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080536B0: .4byte gProc_efxQuakePure
_080536B4: .4byte gUnknown_085B9804

	THUMB_FUNC_END sub_8053678

	THUMB_FUNC_START sub_80536B8
sub_80536B8: @ 0x080536B8
	push {r4, lr}
	adds r4, r0, #0
	ldr r3, [r4, #0x44]
	movs r1, #0x2c
	ldrsh r0, [r4, r1]
	lsls r0, r0, #2
	adds r2, r0, r3
	movs r0, #0
	ldrsh r1, [r2, r0]
	ldr r0, _080536E4  @ 0x00007FFF
	cmp r1, r0
	beq _080536E8
	adds r0, r1, #0
	movs r3, #2
	ldrsh r1, [r2, r3]
	bl sub_8052214
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	b _08053710
	.align 2, 0
_080536E4: .4byte 0x00007FFF
_080536E8:
	adds r0, r4, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	cmp r0, #0
	beq _080536F8
	cmp r0, #1
	beq _08053708
	b _08053710
_080536F8:
	strh r0, [r4, #0x2c]
	movs r1, #0
	ldrsh r0, [r3, r1]
	movs r2, #2
	ldrsh r1, [r3, r2]
	bl sub_8052214
	b _08053710
_08053708:
	movs r0, #0
	movs r1, #0
	bl sub_8052214
_08053710:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80536B8

	THUMB_FUNC_START sub_8053718
sub_8053718: @ 0x08053718
	push {lr}
	ldr r0, _08053728  @ gProc_efxHitQuakePure
	movs r1, #3
	bl Proc_Start
	pop {r1}
	bx r1
	.align 2, 0
_08053728: .4byte gProc_efxHitQuakePure

	THUMB_FUNC_END sub_8053718

	THUMB_FUNC_START nullsub_56
nullsub_56: @ 0x0805372C
	bx lr

	THUMB_FUNC_END nullsub_56

	THUMB_FUNC_START sub_8053730
sub_8053730: @ 0x08053730
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08053740  @ gUnknown_02017748
	ldr r0, [r0]
	cmp r0, #1
	bne _08053744
	movs r0, #0
	b _08053820
	.align 2, 0
_08053740: .4byte gUnknown_02017748
_08053744:
	ldr r1, _08053770  @ gUnknown_0201773C
	movs r0, #1
	str r0, [r1]
	ldr r0, _08053774  @ gProc_efxQuake
	movs r1, #3
	bl Proc_Start
	adds r2, r0, #0
	movs r0, #0
	strh r0, [r2, #0x2c]
	ldr r1, _08053778  @ gUnknown_02000000
	ldr r0, [r1]
	str r0, [r2, #0x5c]
	ldr r0, [r1, #8]
	str r0, [r2, #0x60]
	cmp r4, #6
	bhi _0805380C
	lsls r0, r4, #2
	ldr r1, _0805377C  @ _08053780
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08053770: .4byte gUnknown_0201773C
_08053774: .4byte gProc_efxQuake
_08053778: .4byte gUnknown_02000000
_0805377C: .4byte _08053780
_08053780: @ jump table
	.4byte _0805379C @ case 0
	.4byte _080537AC @ case 1
	.4byte _080537BC @ case 2
	.4byte _080537CC @ case 3
	.4byte _080537DC @ case 4
	.4byte _080537EC @ case 5
	.4byte _080537FC @ case 6
_0805379C:
	ldr r0, _080537A8  @ gUnknown_080DA4BA
	str r0, [r2, #0x44]
	adds r1, r2, #0
	adds r1, #0x29
	movs r0, #0
	b _08053816
	.align 2, 0
_080537A8: .4byte gUnknown_080DA4BA
_080537AC:
	ldr r0, _080537B8  @ gUnknown_080DA4DC
	str r0, [r2, #0x44]
	adds r1, r2, #0
	adds r1, #0x29
	movs r0, #0
	b _08053816
	.align 2, 0
_080537B8: .4byte gUnknown_080DA4DC
_080537BC:
	ldr r0, _080537C8  @ gUnknown_080DA526
	str r0, [r2, #0x44]
	adds r1, r2, #0
	adds r1, #0x29
	movs r0, #0
	b _08053816
	.align 2, 0
_080537C8: .4byte gUnknown_080DA526
_080537CC:
	ldr r0, _080537D8  @ gUnknown_080DA570
	str r0, [r2, #0x44]
	adds r1, r2, #0
	adds r1, #0x29
	movs r0, #0
	b _08053816
	.align 2, 0
_080537D8: .4byte gUnknown_080DA570
_080537DC:
	ldr r0, _080537E8  @ gUnknown_080DA5BA
	str r0, [r2, #0x44]
	adds r1, r2, #0
	adds r1, #0x29
	movs r0, #0
	b _08053816
	.align 2, 0
_080537E8: .4byte gUnknown_080DA5BA
_080537EC:
	ldr r0, _080537F8  @ gUnknown_080DA604
	str r0, [r2, #0x44]
	adds r1, r2, #0
	adds r1, #0x29
	movs r0, #1
	b _08053816
	.align 2, 0
_080537F8: .4byte gUnknown_080DA604
_080537FC:
	ldr r0, _08053808  @ gUnknown_080DA66E
	str r0, [r2, #0x44]
	adds r1, r2, #0
	adds r1, #0x29
	movs r0, #1
	b _08053816
	.align 2, 0
_08053808: .4byte gUnknown_080DA66E
_0805380C:
	ldr r0, _08053828  @ gUnknown_080DA4BA
	str r0, [r2, #0x44]
	adds r1, r2, #0
	adds r1, #0x29
	movs r0, #0
_08053816:
	strb r0, [r1]
	movs r0, #0
	strh r0, [r2, #0x34]
	strh r0, [r2, #0x3c]
	adds r0, r2, #0
_08053820:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08053828: .4byte gUnknown_080DA4BA

	THUMB_FUNC_END sub_8053730

	THUMB_FUNC_START sub_805382C
sub_805382C: @ 0x0805382C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r7, r0, #0
	ldr r1, [r7, #0x44]
	movs r2, #0x2c
	ldrsh r0, [r7, r2]
	lsls r0, r0, #2
	adds r2, r0, r1
	movs r3, #0
	ldrsh r1, [r2, r3]
	ldr r0, _080538AC  @ 0x00007FFF
	cmp r1, r0
	bne _080538C0
	ldr r3, _080538B0  @ gUnknown_02000028
	movs r4, #0
	ldrsh r2, [r3, r4]
	ldr r0, _080538B4  @ gUnknown_0201FB0C
	ldr r1, [r0]
	subs r6, r2, r1
	ldr r2, _080538B8  @ gUnknown_0200002C
	movs r4, #2
	ldrsh r0, [r3, r4]
	subs r4, r0, r1
	movs r0, #2
	ldrsh r5, [r2, r0]
	lsls r1, r6, #0x10
	asrs r1, r1, #0x10
	movs r3, #0
	ldrsh r2, [r2, r3]
	movs r0, #0
	bl sub_80559F0
	lsls r1, r4, #0x10
	asrs r1, r1, #0x10
	adds r2, r5, #0
	movs r0, #1
	bl sub_80559F0
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	bl sub_806FAB0
	cmp r0, #0
	beq _0805389E
	ldrh r1, [r7, #0x34]
	ldrh r2, [r7, #0x3c]
	movs r0, #3
	bl BG_SetPosition
	movs r0, #0
	movs r1, #0
	bl sub_8052214
_0805389E:
	ldr r1, _080538BC  @ gUnknown_0201773C
	movs r0, #0
	str r0, [r1]
	adds r0, r7, #0
	bl Proc_End
	b _080539D2
	.align 2, 0
_080538AC: .4byte 0x00007FFF
_080538B0: .4byte gUnknown_02000028
_080538B4: .4byte gUnknown_0201FB0C
_080538B8: .4byte gUnknown_0200002C
_080538BC: .4byte gUnknown_0201773C
_080538C0:
	movs r4, #0
	ldrsh r0, [r2, r4]
	movs r3, #2
	ldrsh r1, [r2, r3]
	bl sub_8052214
	ldrh r0, [r7, #0x2c]
	adds r0, #1
	strh r0, [r7, #0x2c]
	ldr r5, _08053918  @ gUnknown_02017760
	ldrh r1, [r5]
	ldrh r2, [r5, #2]
	movs r0, #2
	bl BG_SetPosition
	bl sub_806FAB0
	cmp r0, #0
	beq _08053900
	ldrh r1, [r5]
	ldrh r4, [r7, #0x34]
	adds r1, r1, r4
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldrh r2, [r5, #2]
	ldrh r0, [r7, #0x3c]
	adds r2, r2, r0
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #3
	bl BG_SetPosition
_08053900:
	bl sub_806FAB0
	cmp r0, #0
	beq _08053920
	ldr r4, _0805391C  @ gUnknown_02000028
	movs r2, #0
	ldrsh r1, [r4, r2]
	movs r3, #0
	ldrsh r0, [r5, r3]
	subs r1, r1, r0
	b _0805392C
	.align 2, 0
_08053918: .4byte gUnknown_02017760
_0805391C: .4byte gUnknown_02000028
_08053920:
	ldr r4, _0805398C  @ gUnknown_02000028
	movs r2, #0
	ldrsh r1, [r4, r2]
	movs r3, #0
	ldrsh r0, [r5, r3]
	adds r1, r1, r0
_0805392C:
	ldr r3, _08053990  @ gUnknown_0201FB0C
	ldr r0, [r3]
	subs r6, r1, r0
	ldr r2, _08053994  @ gUnknown_0200002C
	movs r1, #0
	ldrsh r0, [r2, r1]
	mov r8, r0
	movs r1, #2
	ldrsh r0, [r5, r1]
	mov r1, r8
	subs r1, r1, r0
	mov r8, r1
	adds r5, r2, #0
	movs r2, #2
	ldrsh r1, [r4, r2]
	ldr r2, _08053998  @ gUnknown_02017760
	movs r4, #0
	ldrsh r0, [r2, r4]
	adds r1, r1, r0
	ldr r0, [r3]
	subs r4, r1, r0
	movs r0, #2
	ldrsh r1, [r5, r0]
	movs r3, #2
	ldrsh r0, [r2, r3]
	subs r5, r1, r0
	ldr r0, _0805399C  @ gUnknown_0203E120
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _080539A0
	lsls r1, r6, #0x10
	asrs r1, r1, #0x10
	mov r3, r8
	lsls r2, r3, #0x10
	asrs r2, r2, #0x10
	movs r0, #0
	bl sub_80559F0
	lsls r1, r4, #0x10
	asrs r1, r1, #0x10
	lsls r2, r5, #0x10
	asrs r2, r2, #0x10
	movs r0, #1
	bl sub_80559F0
	b _080539D2
	.align 2, 0
_0805398C: .4byte gUnknown_02000028
_08053990: .4byte gUnknown_0201FB0C
_08053994: .4byte gUnknown_0200002C
_08053998: .4byte gUnknown_02017760
_0805399C: .4byte gUnknown_0203E120
_080539A0:
	cmp r0, #0
	blt _080539D2
	cmp r0, #2
	bgt _080539D2
	ldr r0, [r7, #0x5c]
	bl GetAISSubjectId
	cmp r0, #0
	bne _080539C4
	lsls r1, r6, #0x10
	asrs r1, r1, #0x10
	mov r4, r8
	lsls r2, r4, #0x10
	asrs r2, r2, #0x10
	movs r0, #0
	bl sub_80559F0
	b _080539D2
_080539C4:
	lsls r1, r4, #0x10
	asrs r1, r1, #0x10
	lsls r2, r5, #0x10
	asrs r2, r2, #0x10
	movs r0, #1
	bl sub_80559F0
_080539D2:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_805382C

	THUMB_FUNC_START sub_80539DC
sub_80539DC: @ 0x080539DC
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	mov r8, r0
	mov r9, r1
	adds r6, r2, #0
	ldr r0, _08053A20  @ gUnknown_02017740
	ldr r7, [r0]
	cmp r7, #0
	beq _080539F4
	b _08053B90
_080539F4:
	movs r4, #1
	str r4, [r0]
	ldr r0, _08053A24  @ gProc_efxHitQuake
	movs r1, #3
	bl Proc_Start
	adds r5, r0, #0
	mov r0, r8
	str r0, [r5, #0x5c]
	mov r1, r9
	str r1, [r5, #0x60]
	strh r7, [r5, #0x2c]
	adds r0, r5, #0
	adds r0, #0x29
	strb r4, [r0]
	cmp r6, #0
	beq _08053A5C
	cmp r6, #1
	bne _08053A2C
	ldr r0, _08053A28  @ gUnknown_080DA4DC
	b _08053A5E
	.align 2, 0
_08053A20: .4byte gUnknown_02017740
_08053A24: .4byte gProc_efxHitQuake
_08053A28: .4byte gUnknown_080DA4DC
_08053A2C:
	cmp r6, #2
	bne _08053A38
	ldr r0, _08053A34  @ gUnknown_080DA526
	b _08053A5E
	.align 2, 0
_08053A34: .4byte gUnknown_080DA526
_08053A38:
	cmp r6, #3
	bne _08053A44
	ldr r0, _08053A40  @ gUnknown_080DA570
	b _08053A5E
	.align 2, 0
_08053A40: .4byte gUnknown_080DA570
_08053A44:
	cmp r6, #4
	bne _08053A50
	ldr r0, _08053A4C  @ gUnknown_080DA9F8
	b _08053A5E
	.align 2, 0
_08053A4C: .4byte gUnknown_080DA9F8
_08053A50:
	cmp r6, #5
	bne _08053A5C
	ldr r0, _08053A58  @ gUnknown_080DAA8E
	b _08053A5E
	.align 2, 0
_08053A58: .4byte gUnknown_080DAA8E
_08053A5C:
	ldr r0, _08053A74  @ gUnknown_080DA4BA
_08053A5E:
	str r0, [r5, #0x44]
	movs r0, #1
	str r0, [r5, #0x48]
	bl sub_806FAB0
	adds r4, r0, #0
	cmp r4, #0
	beq _08053A78
	movs r0, #0
	str r0, [r5, #0x64]
	b _08053B90
	.align 2, 0
_08053A74: .4byte gUnknown_080DA4BA
_08053A78:
	bl sub_805B028
	cmp r0, #0
	beq _08053A84
	str r4, [r5, #0x64]
	b _08053B90
_08053A84:
	ldr r0, _08053A94  @ gUnknown_0203E120
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _08053A98
	str r0, [r5, #0x64]
	b _08053B90
	.align 2, 0
_08053A94: .4byte gUnknown_0203E120
_08053A98:
	ldr r0, [r5, #0x5c]
	bl GetAISSubjectId
	ldr r1, _08053AC8  @ gUnknown_0201FB0C
	ldr r1, [r1]
	ldr r2, _08053ACC  @ gUnknown_02000030
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	subs r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r4, r1, #0x10
	mov r0, r8
	bl GetAISSubjectId
	cmp r0, #0
	bne _08053AD4
	movs r0, #0x40
	strh r0, [r5, #0x36]
	movs r0, #0x68
	strh r0, [r5, #0x3e]
	ldr r0, _08053AD0  @ gUnknown_085C7338
	b _08053ADE
	.align 2, 0
_08053AC8: .4byte gUnknown_0201FB0C
_08053ACC: .4byte gUnknown_02000030
_08053AD0: .4byte gUnknown_085C7338
_08053AD4:
	movs r0, #0xb0
	strh r0, [r5, #0x36]
	movs r0, #0x68
	strh r0, [r5, #0x3e]
	ldr r0, _08053B04  @ gUnknown_085C72AC
_08053ADE:
	movs r1, #5
	bl AnimCreate
	adds r2, r0, #0
	ldrh r1, [r5, #0x36]
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	subs r1, r1, r0
	strh r1, [r2, #2]
	ldrh r0, [r5, #0x3e]
	strh r0, [r2, #4]
	ldr r0, _08053B08  @ gUnknown_0201775C
	ldr r0, [r0]
	cmp r0, #1
	bne _08053B0C
	movs r0, #0xd3
	lsls r0, r0, #6
	b _08053B10
	.align 2, 0
_08053B04: .4byte gUnknown_085C72AC
_08053B08: .4byte gUnknown_0201775C
_08053B0C:
	movs r0, #0xf3
	lsls r0, r0, #6
_08053B10:
	strh r0, [r2, #8]
	str r2, [r5, #0x64]
	ldr r4, _08053B9C  @ gUnknown_0200003C
	mov r0, r8
	bl GetAISSubjectId
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r0, [r0]
	ldr r1, _08053BA0  @ 0x06011800
	movs r2, #0x80
	lsls r2, r2, #4
	bl RegisterTileGraphics
	ldr r4, _08053BA4  @ gUnknown_0203E118
	mov r0, r9
	bl GetAISSubjectId
	lsls r0, r0, #1
	adds r0, r0, r4
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0x39
	bne _08053B56
	ldr r4, _08053BA8  @ gUnknown_0200004C
	mov r0, r9
	bl GetAISSubjectId
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r0, [r0]
	ldr r1, _08053BAC  @ gUnknown_02016828
	movs r2, #8
	bl CpuFastSet
_08053B56:
	ldr r4, _08053BA8  @ gUnknown_0200004C
	mov r0, r8
	bl GetAISSubjectId
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r0, [r0]
	ldr r1, _08053BB0  @ gUnknown_02022B08
	movs r2, #8
	bl CpuFastSet
	bl EnablePaletteSync
	ldr r0, _08053BB4  @ gUnknown_0203E120
	movs r1, #0
	ldrsh r4, [r0, r1]
	mov r0, r8
	bl GetAISSubjectId
	adds r1, r0, #0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	adds r0, r4, #0
	bl sub_805AFA0
	ldr r0, _08053BB8  @ gUnknown_0201FB0C
	ldr r0, [r0]
	bl sub_8053618
_08053B90:
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08053B9C: .4byte gUnknown_0200003C
_08053BA0: .4byte 0x06011800
_08053BA4: .4byte gUnknown_0203E118
_08053BA8: .4byte gUnknown_0200004C
_08053BAC: .4byte gUnknown_02016828
_08053BB0: .4byte gUnknown_02022B08
_08053BB4: .4byte gUnknown_0203E120
_08053BB8: .4byte gUnknown_0201FB0C

	THUMB_FUNC_END sub_80539DC

	THUMB_FUNC_START sub_8053BBC
sub_8053BBC: @ 0x08053BBC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r7, r0, #0
	ldr r5, [r7, #0x44]
	movs r1, #0x2c
	ldrsh r0, [r7, r1]
	lsls r0, r0, #2
	adds r0, r0, r5
	movs r2, #0
	ldrsh r1, [r0, r2]
	ldr r0, _08053C0C  @ 0x00007FFF
	cmp r1, r0
	beq _08053BDC
	b _08053CF0
_08053BDC:
	movs r0, #0
	movs r1, #0
	bl sub_8052214
	ldr r0, _08053C10  @ gUnknown_0203E120
	movs r3, #0
	ldrsh r0, [r0, r3]
	cmp r0, #0
	bne _08053C14
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	bl sub_806FAB0
	cmp r0, #0
	beq _08053C36
	movs r0, #3
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	b _08053C36
	.align 2, 0
_08053C0C: .4byte 0x00007FFF
_08053C10: .4byte gUnknown_0203E120
_08053C14:
	cmp r0, #0
	blt _08053C36
	cmp r0, #2
	bgt _08053C36
	bl sub_806FAB0
	cmp r0, #0
	beq _08053C2E
	movs r0, #3
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
_08053C2E:
	ldr r0, _08053CD8  @ gUnknown_0201FB0C
	ldr r0, [r0]
	bl sub_8053618
_08053C36:
	ldr r0, [r7, #0x64]
	cmp r0, #0
	beq _08053C46
	bl AnimDelete
	ldr r0, _08053CDC  @ gUnknown_0201FADC
	bl sub_805AE58
_08053C46:
	ldr r3, _08053CE0  @ gUnknown_02000028
	movs r4, #0
	ldrsh r2, [r3, r4]
	ldr r0, _08053CD8  @ gUnknown_0201FB0C
	ldr r1, [r0]
	subs r6, r2, r1
	ldr r2, _08053CE4  @ gUnknown_0200002C
	movs r5, #2
	ldrsh r0, [r3, r5]
	subs r4, r0, r1
	movs r0, #2
	ldrsh r5, [r2, r0]
	lsls r1, r6, #0x10
	asrs r1, r1, #0x10
	movs r3, #0
	ldrsh r2, [r2, r3]
	movs r0, #0
	bl sub_80559F0
	lsls r1, r4, #0x10
	asrs r1, r1, #0x10
	adds r2, r5, #0
	movs r0, #1
	bl sub_80559F0
	ldr r1, _08053CE8  @ gUnknown_02017740
	movs r0, #0
	str r0, [r1]
	adds r0, r7, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #1
	bne _08053CCE
	bl sub_806FAB0
	cmp r0, #0
	beq _08053C9A
	movs r0, #3
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
_08053C9A:
	ldr r4, _08053CEC  @ gUnknown_02000038
	ldrh r1, [r4]
	ldrh r2, [r4, #2]
	movs r0, #0
	bl BG_SetPosition
	ldrh r0, [r4]
	negs r0, r0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldrh r1, [r4, #2]
	negs r1, r1
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl EkrGauge_80511E4
	ldrh r0, [r4]
	negs r0, r0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r1, [r4, #2]
	negs r1, r1
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	bl sub_8051B5C
_08053CCE:
	adds r0, r7, #0
	bl Proc_End
	b _08053F02
	.align 2, 0
_08053CD8: .4byte gUnknown_0201FB0C
_08053CDC: .4byte gUnknown_0201FADC
_08053CE0: .4byte gUnknown_02000028
_08053CE4: .4byte gUnknown_0200002C
_08053CE8: .4byte gUnknown_02017740
_08053CEC: .4byte gUnknown_02000038
_08053CF0:
	movs r6, #0x2c
	ldrsh r4, [r7, r6]
	cmp r4, #0
	bne _08053D1C
	ldr r0, [r7, #0x64]
	cmp r0, #0
	beq _08053D1C
	ldr r0, [r7, #0x5c]
	bl GetAISSubjectId
	adds r1, r0, #0
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #1
	ldr r1, _08053D70  @ gUnknown_02023F68
	adds r0, r0, r1
	str r4, [sp]
	movs r1, #0xf
	movs r2, #5
	movs r3, #0
	bl FillBGRect
_08053D1C:
	movs r1, #0x2c
	ldrsh r0, [r7, r1]
	lsls r0, r0, #2
	adds r0, r0, r5
	movs r2, #0
	ldrsh r4, [r0, r2]
	movs r3, #2
	ldrsh r5, [r0, r3]
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_8052214
	ldrh r0, [r7, #0x2c]
	adds r0, #1
	strh r0, [r7, #0x2c]
	ldr r0, [r7, #0x64]
	cmp r0, #0
	beq _08053D80
	ldr r0, [r7, #0x5c]
	bl GetAISSubjectId
	ldr r1, _08053D74  @ gUnknown_0201FB0C
	ldr r1, [r1]
	ldr r2, _08053D78  @ gUnknown_02000030
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	subs r1, r1, r0
	ldr r3, [r7, #0x64]
	ldr r2, _08053D7C  @ gUnknown_02017760
	ldrh r0, [r2]
	ldrh r6, [r7, #0x36]
	adds r0, r0, r6
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	subs r0, r0, r1
	strh r0, [r3, #2]
	ldrh r0, [r7, #0x3e]
	ldrh r1, [r2, #2]
	subs r0, r0, r1
	strh r0, [r3, #4]
	b _08053D8C
	.align 2, 0
_08053D70: .4byte gUnknown_02023F68
_08053D74: .4byte gUnknown_0201FB0C
_08053D78: .4byte gUnknown_02000030
_08053D7C: .4byte gUnknown_02017760
_08053D80:
	ldr r0, _08053E40  @ gUnknown_02017760
	ldrh r1, [r0]
	ldrh r2, [r0, #2]
	movs r0, #2
	bl BG_SetPosition
_08053D8C:
	adds r0, r7, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #1
	bne _08053E04
	bl sub_806FAB0
	cmp r0, #0
	beq _08053DAE
	negs r1, r4
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r2, r5, #0x10
	lsrs r2, r2, #0x10
	movs r0, #3
	bl BG_SetPosition
_08053DAE:
	ldr r5, _08053E40  @ gUnknown_02017760
	ldr r4, _08053E44  @ gUnknown_02000038
	ldrh r1, [r4]
	ldrh r0, [r5]
	adds r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldrh r2, [r4, #2]
	ldrh r3, [r5, #2]
	adds r2, r2, r3
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #0
	bl BG_SetPosition
	ldrh r0, [r4]
	ldrh r6, [r5]
	adds r0, r0, r6
	negs r0, r0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldrh r1, [r4, #2]
	ldrh r2, [r5, #2]
	adds r1, r1, r2
	negs r1, r1
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl EkrGauge_80511E4
	ldrh r0, [r4]
	ldrh r3, [r5]
	adds r0, r0, r3
	negs r0, r0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r1, [r4, #2]
	ldrh r5, [r5, #2]
	adds r1, r1, r5
	negs r1, r1
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	bl sub_8051B5C
_08053E04:
	bl sub_806FAB0
	cmp r0, #0
	beq _08053E18
	ldr r0, _08053E40  @ gUnknown_02017760
	ldrh r1, [r0]
	ldrh r2, [r0, #2]
	movs r0, #3
	bl BG_SetPosition
_08053E18:
	bl sub_806FAB0
	cmp r0, #0
	beq _08053E54
	ldr r4, _08053E48  @ gUnknown_02000028
	mov ip, r4
	movs r5, #0
	ldrsh r1, [r4, r5]
	ldr r2, _08053E40  @ gUnknown_02017760
	movs r6, #0
	ldrsh r0, [r2, r6]
	subs r1, r1, r0
	ldr r4, _08053E4C  @ gUnknown_0201FB0C
	ldr r0, [r4]
	subs r6, r1, r0
	ldr r3, _08053E50  @ gUnknown_0200002C
	movs r0, #0
	ldrsh r1, [r3, r0]
	b _08053E70
	.align 2, 0
_08053E40: .4byte gUnknown_02017760
_08053E44: .4byte gUnknown_02000038
_08053E48: .4byte gUnknown_02000028
_08053E4C: .4byte gUnknown_0201FB0C
_08053E50: .4byte gUnknown_0200002C
_08053E54:
	ldr r6, _08053EBC  @ gUnknown_02000028
	mov ip, r6
	movs r0, #0
	ldrsh r1, [r6, r0]
	ldr r2, _08053EC0  @ gUnknown_02017760
	movs r3, #0
	ldrsh r0, [r2, r3]
	adds r1, r1, r0
	ldr r4, _08053EC4  @ gUnknown_0201FB0C
	ldr r0, [r4]
	subs r6, r1, r0
	ldr r3, _08053EC8  @ gUnknown_0200002C
	movs r5, #0
	ldrsh r1, [r3, r5]
_08053E70:
	movs r5, #2
	ldrsh r0, [r2, r5]
	subs r1, r1, r0
	mov r8, r1
	mov r5, ip
	movs r1, #2
	ldrsh r0, [r5, r1]
	movs r5, #0
	ldrsh r1, [r2, r5]
	adds r0, r0, r1
	ldr r1, [r4]
	subs r4, r0, r1
	movs r0, #2
	ldrsh r1, [r3, r0]
	movs r3, #2
	ldrsh r0, [r2, r3]
	subs r5, r1, r0
	ldr r0, _08053ECC  @ gUnknown_0203E120
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _08053ED0
	lsls r1, r6, #0x10
	asrs r1, r1, #0x10
	mov r3, r8
	lsls r2, r3, #0x10
	asrs r2, r2, #0x10
	movs r0, #0
	bl sub_80559F0
	lsls r1, r4, #0x10
	asrs r1, r1, #0x10
	lsls r2, r5, #0x10
	asrs r2, r2, #0x10
	movs r0, #1
	bl sub_80559F0
	b _08053F02
	.align 2, 0
_08053EBC: .4byte gUnknown_02000028
_08053EC0: .4byte gUnknown_02017760
_08053EC4: .4byte gUnknown_0201FB0C
_08053EC8: .4byte gUnknown_0200002C
_08053ECC: .4byte gUnknown_0203E120
_08053ED0:
	cmp r0, #0
	blt _08053F02
	cmp r0, #2
	bgt _08053F02
	ldr r0, [r7, #0x5c]
	bl GetAISSubjectId
	cmp r0, #0
	bne _08053EF4
	lsls r1, r6, #0x10
	asrs r1, r1, #0x10
	mov r4, r8
	lsls r2, r4, #0x10
	asrs r2, r2, #0x10
	movs r0, #0
	bl sub_80559F0
	b _08053F02
_08053EF4:
	lsls r1, r4, #0x10
	asrs r1, r1, #0x10
	lsls r2, r5, #0x10
	asrs r2, r2, #0x10
	movs r0, #1
	bl sub_80559F0
_08053F02:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8053BBC

.align 2, 0
