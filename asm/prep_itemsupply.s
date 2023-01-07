	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	THUMB_FUNC_START sub_809D244
sub_809D244: @ 0x0809D244
	push {r4, r5, r6, lr}
	sub sp, #4
	ldr r6, _0809D270  @ 0x0000DFC0
	movs r5, #0x30
	movs r4, #3
_0809D24E:
	str r6, [sp]
	movs r0, #4
	adds r1, r5, #0
	movs r2, #0x10
	ldr r3, _0809D274  @ gObject_32x16
	bl PutSpriteExt
	adds r6, #4
	adds r5, #0x20
	subs r4, #1
	cmp r4, #0
	bge _0809D24E
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0809D270: .4byte 0x0000DFC0
_0809D274: .4byte gObject_32x16

	THUMB_FUNC_END sub_809D244

	THUMB_FUNC_START sub_809D278
sub_809D278: @ 0x0809D278
	push {r4, r5, lr}
	sub sp, #0xc
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _0809D2B8  @ sub_809D244
	bl StartParallelWorker
	ldr r0, _0809D2BC  @ gUnknown_08A191F4
	lsls r4, r4, #2
	adds r4, r4, r0
	ldr r0, [r4]
	ldr r1, _0809D2C0  @ gUnknown_08A19200
	ldr r1, [r1]
	bl GetStringFromIndexInBuffer
	adds r2, r0, #0
	movs r0, #0xf0
	lsls r0, r0, #7
	movs r1, #2
	str r1, [sp]
	movs r1, #3
	str r1, [sp, #4]
	str r5, [sp, #8]
	movs r1, #0xd
	movs r3, #1
	bl sub_80ADD24
	add sp, #0xc
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0809D2B8: .4byte sub_809D244
_0809D2BC: .4byte gUnknown_08A191F4
_0809D2C0: .4byte gUnknown_08A19200

	THUMB_FUNC_END sub_809D278

	THUMB_FUNC_START StoreConvoyWeaponIconGraphics
StoreConvoyWeaponIconGraphics: @ 0x0809D2C4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0809D2F0  @ gUnknown_08A1A3FC
	lsls r1, r1, #5
	movs r2, #0x20
	bl CopyToPaletteBuffer
	ldr r0, _0809D2F4  @ gUnknown_08A1A0A4
	movs r2, #0xc0
	lsls r2, r2, #0x13
	adds r1, r4, r2
	bl CopyDataWithPossibleUncomp
	ldr r0, _0809D2F8  @ gUnknown_08A1A23C
	ldr r1, _0809D2FC  @ 0x06000200
	adds r4, r4, r1
	adds r1, r4, #0
	bl CopyDataWithPossibleUncomp
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809D2F0: .4byte gUnknown_08A1A3FC
_0809D2F4: .4byte gUnknown_08A1A0A4
_0809D2F8: .4byte gUnknown_08A1A23C
_0809D2FC: .4byte 0x06000200

	THUMB_FUNC_END StoreConvoyWeaponIconGraphics

	THUMB_FUNC_START sub_809D300
sub_809D300: @ 0x0809D300
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	str r0, [sp]
	mov sl, r1
	str r2, [sp, #4]
	str r3, [sp, #8]
	mov r0, sl
	movs r1, #0xc
	movs r2, #0x1f
	movs r3, #0
	bl TileMap_FillRect
	ldr r1, _0809D350  @ gUnknown_02012F56
	ldrh r0, [r1]
	cmp r0, #0
	bne _0809D354
	ldr r0, [sp]
	bl Text_Clear
	movs r0, #0xb5
	lsls r0, r0, #3
	bl GetStringFromIndex
	adds r3, r0, #0
	ldr r0, [sp]
	movs r1, #0
	movs r2, #1
	bl Text_InsertString
	mov r1, sl
	adds r1, #6
	ldr r0, [sp]
	bl Text_Draw
	b _0809D3FE
	.align 2, 0
_0809D350: .4byte gUnknown_02012F56
_0809D354:
	ldr r6, [sp, #4]
	adds r0, r6, #7
	cmp r6, r0
	bge _0809D3FE
	ldrh r1, [r1]
	cmp r6, r1
	bge _0809D3FE
_0809D362:
	movs r0, #7
	ands r0, r6
	lsls r0, r0, #3
	ldr r1, [sp]
	adds r1, r1, r0
	mov r8, r1
	ldr r1, _0809D410  @ gUnknown_020122D4
	lsls r0, r6, #2
	adds r0, r0, r1
	ldrh r7, [r0, #2]
	ldr r0, [sp, #8]
	adds r1, r7, #0
	bl IsItemDisplayUsable
	movs r1, #0
	mov r9, r1
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0809D38C
	movs r0, #1
	mov r9, r0
_0809D38C:
	mov r0, r8
	bl Text_Clear
	adds r0, r7, #0
	bl GetItemName
	adds r3, r0, #0
	mov r0, r8
	movs r1, #0
	mov r2, r9
	bl Text_InsertString
	lsls r5, r6, #1
	movs r0, #0x1f
	ands r5, r0
	lsls r5, r5, #6
	adds r4, r5, #2
	add r4, sl
	adds r0, r7, #0
	bl GetItemIconId
	adds r1, r0, #0
	adds r0, r4, #0
	movs r2, #0x80
	lsls r2, r2, #7
	bl DrawIcon
	adds r1, r5, #6
	add r1, sl
	mov r0, r8
	bl Text_Draw
	adds r5, #0x18
	mov r1, sl
	adds r4, r1, r5
	movs r5, #1
	mov r0, r9
	cmp r0, #0
	bne _0809D3DC
	movs r5, #2
_0809D3DC:
	adds r0, r7, #0
	bl GetItemUses
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	bl DrawDecNumber
	adds r6, #1
	ldr r0, [sp, #4]
	adds r0, #7
	cmp r6, r0
	bge _0809D3FE
	ldr r0, _0809D414  @ gUnknown_02012F56
	ldrh r0, [r0]
	cmp r6, r0
	blt _0809D362
_0809D3FE:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809D410: .4byte gUnknown_020122D4
_0809D414: .4byte gUnknown_02012F56

	THUMB_FUNC_END sub_809D300

	THUMB_FUNC_START sub_809D418
sub_809D418: @ 0x0809D418
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	adds r5, r1, #0
	adds r7, r5, #0
	adds r0, r5, #7
	cmp r5, r0
	bge _0809D468
	ldr r0, _0809D474  @ gUnknown_02012F56
	ldrh r0, [r0]
	cmp r5, r0
	bge _0809D468
	ldr r1, _0809D478  @ gUnknown_020122D4
	lsls r0, r5, #2
	adds r6, r0, r1
_0809D438:
	ldrh r0, [r6, #2]
	lsls r4, r5, #1
	movs r1, #0x1f
	ands r4, r1
	lsls r4, r4, #6
	adds r4, #2
	add r4, r8
	bl GetItemIconId
	adds r1, r0, #0
	adds r0, r4, #0
	movs r2, #0x80
	lsls r2, r2, #7
	bl DrawIcon
	adds r6, #4
	adds r5, #1
	adds r0, r7, #7
	cmp r5, r0
	bge _0809D468
	ldr r0, _0809D474  @ gUnknown_02012F56
	ldrh r0, [r0]
	cmp r5, r0
	blt _0809D438
_0809D468:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809D474: .4byte gUnknown_02012F56
_0809D478: .4byte gUnknown_020122D4

	THUMB_FUNC_END sub_809D418

	THUMB_FUNC_START sub_809D47C
sub_809D47C: @ 0x0809D47C
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	adds r5, r0, #0
	mov r9, r1
	ldr r0, _0809D528  @ gUnknown_02012F56
	ldrh r0, [r0]
	cmp r0, r2
	ble _0809D51C
	lsls r4, r2, #1
	movs r0, #0x1f
	ands r4, r0
	movs r0, #7
	ands r0, r2
	lsls r0, r0, #3
	adds r7, r5, r0
	ldr r1, _0809D52C  @ gUnknown_020122D4
	lsls r0, r2, #2
	adds r0, r0, r1
	ldrh r6, [r0, #2]
	adds r0, r3, #0
	adds r1, r6, #0
	bl IsItemDisplayUsable
	movs r1, #0
	mov r8, r1
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0809D4BC
	movs r0, #1
	mov r8, r0
_0809D4BC:
	lsls r4, r4, #6
	add r4, r9
	adds r0, r4, #0
	movs r1, #0xc
	movs r2, #1
	movs r3, #0
	bl TileMap_FillRect
	adds r0, r7, #0
	bl Text_Clear
	adds r0, r6, #0
	bl GetItemName
	adds r3, r0, #0
	adds r0, r7, #0
	movs r1, #0
	mov r2, r8
	bl Text_InsertString
	adds r5, r4, #2
	adds r0, r6, #0
	bl GetItemIconId
	adds r1, r0, #0
	movs r2, #0x80
	lsls r2, r2, #7
	adds r0, r5, #0
	bl DrawIcon
	adds r1, r4, #6
	adds r0, r7, #0
	bl Text_Draw
	adds r4, #0x18
	movs r5, #1
	mov r1, r8
	cmp r1, #0
	bne _0809D50C
	movs r5, #2
_0809D50C:
	adds r0, r6, #0
	bl GetItemUses
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	bl DrawDecNumber
_0809D51C:
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809D528: .4byte gUnknown_02012F56
_0809D52C: .4byte gUnknown_020122D4

	THUMB_FUNC_END sub_809D47C

	THUMB_FUNC_START sub_809D530
sub_809D530: @ 0x0809D530
	push {lr}
	ldr r0, _0809D568  @ 0x04000006
	ldrh r0, [r0]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0xa0
	bls _0809D542
	movs r2, #0
_0809D542:
	cmp r2, #0xc
	bne _0809D552
	ldr r1, _0809D56C  @ 0x04000050
	movs r0, #0xc8
	strh r0, [r1]
	adds r1, #4
	movs r0, #8
	strh r0, [r1]
_0809D552:
	cmp r2, #0x34
	beq _0809D55A
	cmp r2, #0
	bne _0809D564
_0809D55A:
	ldr r0, _0809D56C  @ 0x04000050
	movs r1, #0
	strh r1, [r0]
	adds r0, #4
	strh r1, [r0]
_0809D564:
	pop {r0}
	bx r0
	.align 2, 0
_0809D568: .4byte 0x04000006
_0809D56C: .4byte 0x04000050

	THUMB_FUNC_END sub_809D530

	THUMB_FUNC_START sub_809D570
sub_809D570: @ 0x0809D570
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0
	strh r0, [r4, #0x38]
	movs r0, #0xff
	strh r0, [r4, #0x36]
	ldr r0, [r4, #0x2c]
	bl GetUnitItemCount
	cmp r0, #0
	bne _0809D58E
	adds r1, r4, #0
	adds r1, #0x33
	movs r0, #1
	b _0809D594
_0809D58E:
	adds r1, r4, #0
	adds r1, #0x33
	movs r0, #0
_0809D594:
	strb r0, [r1]
	ldr r0, _0809D5B0  @ gGMData
	ldrb r0, [r0]
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	beq _0809D5B4
	bl sub_80C4048
	cmp r0, #0
	beq _0809D5C8
	adds r0, #0x2b
	b _0809D5C6
	.align 2, 0
_0809D5B0: .4byte gGMData
_0809D5B4:
	adds r0, r4, #0
	adds r0, #0x30
	ldrb r0, [r0]
	cmp r0, #0
	bne _0809D5D4
	ldr r0, _0809D5D0  @ ProcScr_AtMenu
	bl Proc_Find
	adds r0, #0x32
_0809D5C6:
	ldrb r0, [r0]
_0809D5C8:
	adds r1, r4, #0
	adds r1, #0x35
	strb r0, [r1]
	b _0809D5DA
	.align 2, 0
_0809D5D0: .4byte ProcScr_AtMenu
_0809D5D4:
	adds r0, r4, #0
	adds r0, #0x35
	strb r1, [r0]
_0809D5DA:
	adds r2, r4, #0
	adds r2, #0x32
	movs r1, #0
	movs r0, #4
	strb r0, [r2]
	adds r0, r4, #0
	adds r0, #0x31
	strb r1, [r0]
	movs r3, #0
	adds r1, r4, #0
	adds r1, #0x4c
	adds r0, #9
	movs r2, #8
_0809D5F4:
	strh r3, [r0]
	strh r3, [r1]
	adds r1, #2
	adds r0, #2
	subs r2, #1
	cmp r2, #0
	bge _0809D5F4
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_809D570

	THUMB_FUNC_START sub_809D608
sub_809D608: @ 0x0809D608
	push {r4, lr}
	ldr r4, _0809D638  @ gUnknown_02013648
	ldr r1, _0809D63C  @ 0x06011000
	adds r0, r4, #0
	movs r2, #0xb
	bl InitSomeOtherGraphicsRelatedStruct
	ldr r0, _0809D640  @ Pal_UIFont
	movs r1, #0xd8
	lsls r1, r1, #2
	movs r2, #0x20
	bl CopyToPaletteBuffer
	adds r4, #0x90
	adds r0, r4, #0
	bl Text_Init3
	movs r0, #0
	bl SetFont
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809D638: .4byte gUnknown_02013648
_0809D63C: .4byte 0x06011000
_0809D640: .4byte Pal_UIFont

	THUMB_FUNC_END sub_809D608

	THUMB_FUNC_START sub_809D644
sub_809D644: @ 0x0809D644
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	bl GetConvoyItemCount_
	adds r5, r0, #0
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	ldr r0, [r4, #0x2c]
	bl GetUnitItemCount
	adds r6, r0, #0
	ldr r4, _0809D6BC  @ gUnknown_02013648
	adds r0, r4, #0
	bl SetFont
	movs r0, #0
	bl SetFontGlyphSet
	adds r4, #0x90
	adds r0, r4, #0
	movs r1, #0
	bl Text_80046B4
	adds r7, r4, #0
	movs r4, #0
	cmp r5, #0x64
	beq _0809D67E
	cmp r6, #0
	bne _0809D680
_0809D67E:
	movs r4, #1
_0809D680:
	ldr r0, _0809D6C0  @ 0x0000059E
	bl GetStringFromIndex
	adds r3, r0, #0
	adds r0, r7, #0
	movs r1, #0
	adds r2, r4, #0
	bl Text_InsertString
	ldr r5, _0809D6C4  @ gUnknown_020136D8
	movs r4, #0
	cmp r6, #5
	bne _0809D69C
	movs r4, #1
_0809D69C:
	ldr r0, _0809D6C8  @ 0x0000059F
	bl GetStringFromIndex
	adds r3, r0, #0
	adds r0, r5, #0
	movs r1, #0x40
	adds r2, r4, #0
	bl Text_InsertString
	movs r0, #0
	bl SetFont
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809D6BC: .4byte gUnknown_02013648
_0809D6C0: .4byte 0x0000059E
_0809D6C4: .4byte gUnknown_020136D8
_0809D6C8: .4byte 0x0000059F

	THUMB_FUNC_END sub_809D644

	THUMB_FUNC_START sub_809D6CC
sub_809D6CC: @ 0x0809D6CC
	push {r4, r5, r6, lr}
	sub sp, #8
	movs r0, #0
	bl SetFont
	ldr r6, _0809D77C  @ gUnknown_02022D10
	adds r0, r6, #0
	movs r1, #0xc
	movs r2, #1
	movs r3, #0
	bl TileMap_FillRect
	movs r0, #0xb3
	lsls r0, r0, #3
	bl GetStringFromIndex
	ldr r4, _0809D780  @ gUnknown_02013660
	adds r1, r6, #0
	adds r1, #0xda
	movs r5, #0
	str r5, [sp]
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r2, #0
	movs r3, #2
	bl DrawTextInline
	adds r1, r6, #0
	subs r1, #0x26
	movs r2, #0x9c
	lsls r2, r2, #2
	movs r0, #1
	str r0, [sp]
	movs r0, #0xab
	movs r3, #2
	bl PutFaceChibi
	movs r0, #0xb4
	lsls r0, r0, #3
	bl GetStringFromIndex
	adds r4, #8
	subs r1, r6, #2
	str r5, [sp]
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r2, #0
	movs r3, #4
	bl DrawTextInline
	adds r5, r6, #0
	adds r5, #0xa
	bl GetConvoyItemCount_
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r4, #2
	cmp r0, #0x64
	bne _0809D744
	movs r4, #4
_0809D744:
	bl GetConvoyItemCount_
	adds r2, r0, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_8004B88
	adds r0, r6, #0
	adds r0, #0xc
	movs r1, #0
	movs r2, #0x16
	bl sub_8004B0C
	adds r0, r6, #0
	adds r0, #0x12
	movs r1, #2
	movs r2, #0x64
	bl sub_8004B88
	movs r0, #1
	bl BG_EnableSyncByMask
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0809D77C: .4byte gUnknown_02022D10
_0809D780: .4byte gUnknown_02013660

	THUMB_FUNC_END sub_809D6CC

	THUMB_FUNC_START sub_809D784
sub_809D784: @ 0x0809D784
	push {r4, lr}
	sub sp, #4
	ldr r0, _0809D7C4  @ 0x0000A840
	str r0, [sp]
	movs r0, #0x40
	movs r1, #0x21
	movs r2, #5
	movs r3, #4
	bl sub_809A31C
	ldr r4, _0809D7C8  @ gObject_32x16
	ldr r0, _0809D7CC  @ 0x0000B080
	str r0, [sp]
	movs r0, #4
	movs r1, #0x48
	movs r2, #0x25
	adds r3, r4, #0
	bl PutSpriteExt
	ldr r0, _0809D7D0  @ 0x0000B088
	str r0, [sp]
	movs r0, #4
	movs r1, #0x48
	movs r2, #0x35
	adds r3, r4, #0
	bl PutSpriteExt
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809D7C4: .4byte 0x0000A840
_0809D7C8: .4byte gObject_32x16
_0809D7CC: .4byte 0x0000B080
_0809D7D0: .4byte 0x0000B088

	THUMB_FUNC_END sub_809D784

	THUMB_FUNC_START sub_809D7D4
sub_809D7D4: @ 0x0809D7D4
	push {lr}
	sub sp, #4
	ldr r0, _0809D800  @ 0x0000A840
	str r0, [sp]
	movs r0, #0x40
	movs r1, #0x21
	movs r2, #5
	movs r3, #2
	bl sub_809A31C
	ldr r3, _0809D804  @ gObject_32x16
	ldr r0, _0809D808  @ 0x0000B080
	str r0, [sp]
	movs r0, #4
	movs r1, #0x48
	movs r2, #0x25
	bl PutSpriteExt
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_0809D800: .4byte 0x0000A840
_0809D804: .4byte gObject_32x16
_0809D808: .4byte 0x0000B080

	THUMB_FUNC_END sub_809D7D4

	THUMB_FUNC_START sub_809D80C
sub_809D80C: @ 0x0809D80C
	push {lr}
	sub sp, #4
	ldr r0, _0809D838  @ 0x0000A840
	str r0, [sp]
	movs r0, #0x40
	movs r1, #0x31
	movs r2, #5
	movs r3, #2
	bl sub_809A31C
	ldr r3, _0809D83C  @ gObject_32x16
	ldr r0, _0809D840  @ 0x0000B088
	str r0, [sp]
	movs r0, #4
	movs r1, #0x48
	movs r2, #0x35
	bl PutSpriteExt
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_0809D838: .4byte 0x0000A840
_0809D83C: .4byte gObject_32x16
_0809D840: .4byte 0x0000B088

	THUMB_FUNC_END sub_809D80C

	THUMB_FUNC_START sub_809D844
sub_809D844: @ 0x0809D844
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r6, r0, #0
	adds r7, r6, #0
	adds r7, #0x35
	ldrb r0, [r7]
	lsls r4, r0, #1
	adds r4, r4, r0
	lsls r4, r4, #2
	adds r4, #0x7c
	bl GetGameClock
	ldr r2, _0809D8BC  @ gPaletteBuffer
	lsrs r0, r0, #2
	movs r1, #0xf
	ands r0, r1
	lsls r0, r0, #1
	ldr r1, _0809D8C0  @ gUnknown_08A1BD60
	adds r0, r0, r1
	ldrh r0, [r0]
	ldr r1, _0809D8C4  @ 0x0000029A
	adds r2, r2, r1
	strh r0, [r2]
	bl EnablePaletteSync
	ldr r1, _0809D8C8  @ gUnknown_08A19608
	ldrb r0, [r7]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r3, [r0]
	movs r5, #0x85
	lsls r5, r5, #7
	str r5, [sp]
	movs r0, #4
	adds r1, r4, #0
	movs r2, #0x18
	bl PutSprite
	ldr r3, _0809D8CC  @ gUnknown_08A195F8
	str r5, [sp]
	movs r0, #4
	adds r1, r4, #0
	movs r2, #0x18
	bl PutSprite
	ldrb r0, [r7]
	lsls r0, r0, #1
	adds r6, #0x4c
	adds r6, r6, r0
	ldrh r1, [r6]
	ldr r0, _0809D8D0  @ gUnknown_02012F56
	ldrh r2, [r0]
	movs r0, #0xc
	movs r3, #7
	bl sub_80976CC
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809D8BC: .4byte gPaletteBuffer
_0809D8C0: .4byte gUnknown_08A1BD60
_0809D8C4: .4byte 0x0000029A
_0809D8C8: .4byte gUnknown_08A19608
_0809D8CC: .4byte gUnknown_08A195F8
_0809D8D0: .4byte gUnknown_02012F56

	THUMB_FUNC_END sub_809D844

	THUMB_FUNC_START sub_809D8D4
sub_809D8D4: @ 0x0809D8D4
	push {r4, r5, r6, lr}
	movs r5, #0
	lsls r2, r2, #0xc
	ldr r4, _0809D910  @ 0x0001FFFF
	adds r3, r1, #0
	ands r3, r4
	lsrs r3, r3, #5
	adds r6, r2, r3
	movs r3, #0x80
	lsls r3, r3, #2
	adds r1, r1, r3
	ands r1, r4
	lsrs r1, r1, #5
	adds r2, r2, r1
	adds r3, r0, #0
	adds r3, #0x40
	adds r1, r0, #0
_0809D8F6:
	adds r0, r6, r5
	strh r0, [r1]
	adds r0, r2, r5
	strh r0, [r3]
	adds r3, #2
	adds r1, #2
	adds r5, #1
	cmp r5, #0xe
	ble _0809D8F6
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0809D910: .4byte 0x0001FFFF

	THUMB_FUNC_END sub_809D8D4

	THUMB_FUNC_START sub_809D914
sub_809D914: @ 0x0809D914
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _0809D9F8  @ gLCDControlBuffer
	ldrb r1, [r4]
	movs r0, #8
	negs r0, r0
	ands r0, r1
	strb r0, [r4]
	movs r0, #0
	bl SetupBackgrounds
	movs r0, #0
	bl BG_GetMapBuffer
	movs r1, #0
	bl BG_Fill
	movs r0, #1
	bl BG_GetMapBuffer
	movs r1, #0
	bl BG_Fill
	movs r0, #2
	bl BG_GetMapBuffer
	movs r1, #0
	bl BG_Fill
	ldrb r1, [r4, #0xc]
	movs r2, #4
	negs r2, r2
	adds r0, r2, #0
	ands r0, r1
	movs r1, #1
	orrs r0, r1
	strb r0, [r4, #0xc]
	ldrb r1, [r4, #0x10]
	adds r0, r2, #0
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	strb r0, [r4, #0x10]
	ldrb r0, [r4, #0x14]
	ands r2, r0
	strb r2, [r4, #0x14]
	ldrb r0, [r4, #0x18]
	movs r1, #3
	orrs r0, r1
	strb r0, [r4, #0x18]
	bl ResetFaces
	bl Font_InitForUIDefault
	bl ResetIconGraphics_
	bl LoadUiFrameGraphics
	bl LoadObjUIGfx
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	adds r0, r5, #0
	adds r0, #0x35
	ldrb r0, [r0]
	lsls r0, r0, #1
	adds r5, #0x4c
	adds r5, r5, r0
	ldrh r2, [r5]
	subs r2, #0x28
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #2
	movs r1, #0
	bl BG_SetPosition
	ldr r0, _0809D9FC  @ 0x06013000
	movs r1, #1
	negs r1, r1
	bl LoadDialogueBoxGfx
	movs r0, #4
	bl LoadIconPalettes
	bl EndSlidingWallEffectMaybe
	movs r0, #8
	bl BG_EnableSyncByMask
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
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0809D9F8: .4byte gLCDControlBuffer
_0809D9FC: .4byte 0x06013000

	THUMB_FUNC_END sub_809D914

	THUMB_FUNC_START sub_809DA00
sub_809DA00: @ 0x0809DA00
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	sub sp, #8
	adds r7, r0, #0
	movs r0, #0xa0
	lsls r0, r0, #7
	movs r1, #5
	bl sub_8098C3C
	movs r0, #0x80
	lsls r0, r0, #4
	movs r1, #0xa
	bl PutImg_PrepPopupWindow
	ldr r0, _0809DC38  @ gUnknown_08A1B9EC
	ldr r4, _0809DC3C  @ gGenericBuffer
	adds r1, r4, #0
	bl CopyDataWithPossibleUncomp
	ldr r5, _0809DC40  @ gBG1TilemapBuffer
	movs r6, #0x80
	lsls r6, r6, #5
	adds r0, r5, #0
	adds r1, r4, #0
	adds r2, r6, #0
	bl CallARM_FillTileRect
	ldr r0, _0809DC44  @ gUnknown_08A1BCC0
	adds r1, r4, #0
	bl CopyDataWithPossibleUncomp
	adds r0, r5, #0
	adds r1, r4, #0
	adds r2, r6, #0
	bl CallARM_FillTileRect
	movs r0, #7
	bl BG_EnableSyncByMask
	movs r1, #0xe0
	lsls r1, r1, #4
	movs r3, #0xc0
	lsls r3, r3, #4
	movs r0, #0
	str r0, [sp]
	str r7, [sp, #4]
	movs r0, #0xd
	movs r2, #0xf
	bl StartSmallBrownNameBoxes
	movs r0, #0
	movs r1, #0x90
	movs r2, #6
	movs r3, #2
	bl sub_80ADBFC
	ldr r0, [r7, #0x2c]
	ldr r0, [r0]
	ldrh r0, [r0]
	bl GetStringFromIndex
	adds r0, r7, #0
	bl sub_80AC9C0
	adds r0, r7, #0
	bl ResetPrepScreenHandCursor
	movs r0, #0xc0
	lsls r0, r0, #3
	movs r1, #1
	bl sub_80AD4A0
	ldr r5, _0809DC48  @ gLCDControlBuffer
	ldrb r0, [r5, #1]
	movs r1, #0x20
	mov r8, r1
	mov r2, r8
	orrs r0, r2
	movs r1, #0x41
	negs r1, r1
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r5, #1]
	adds r1, r5, #0
	adds r1, #0x2d
	movs r0, #0x80
	strb r0, [r1]
	adds r1, #4
	movs r0, #0x28
	strb r0, [r1]
	subs r1, #5
	movs r0, #0xe0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0x98
	strb r0, [r1]
	movs r0, #0x34
	adds r0, r0, r5
	mov r9, r0
	ldrb r1, [r0]
	movs r6, #1
	orrs r1, r6
	movs r2, #2
	orrs r1, r2
	movs r0, #4
	orrs r1, r0
	movs r4, #8
	orrs r1, r4
	movs r3, #0x10
	orrs r1, r3
	adds r5, #0x36
	ldrb r0, [r5]
	orrs r0, r6
	orrs r0, r2
	movs r2, #5
	negs r2, r2
	ands r0, r2
	orrs r0, r4
	orrs r0, r3
	mov r2, r8
	orrs r1, r2
	mov r2, r9
	strb r1, [r2]
	mov r1, r8
	orrs r0, r1
	strb r0, [r5]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #8
	bl SetSpecialColorEffectsParameters
	adds r0, r7, #0
	bl NewGreenTextColorManager
	movs r0, #0xc3
	movs r1, #0x93
	movs r2, #9
	adds r3, r7, #0
	bl StartHelpPromptSprite
	ldr r4, _0809DC4C  @ gUnknown_02013660
	adds r0, r4, #0
	movs r1, #4
	bl Text_Init
	adds r0, r4, #0
	adds r0, #8
	movs r1, #4
	bl Text_Init
	bl sub_809D608
	adds r4, #0x10
	movs r5, #4
_0809DB3C:
	adds r0, r4, #0
	movs r1, #7
	bl Text_Init
	adds r4, #8
	subs r5, #1
	cmp r5, #0
	bge _0809DB3C
	movs r2, #0x35
	adds r2, r2, r7
	mov r8, r2
	movs r0, #0x4c
	adds r0, r0, r7
	mov r9, r0
	ldr r4, _0809DC50  @ gUnknown_02013698
	movs r5, #7
_0809DB5C:
	adds r0, r4, #0
	movs r1, #7
	bl Text_Allocate
	adds r4, #8
	subs r5, #1
	cmp r5, #0
	bge _0809DB5C
	movs r0, #0
	bl SetPrimaryHBlankHandler
	ldr r0, _0809DC54  @ sub_809D530
	bl SetPrimaryHBlankHandler
	movs r4, #0x80
	lsls r4, r4, #7
	adds r0, r4, #0
	movs r1, #6
	bl StoreConvoyWeaponIconGraphics
	ldr r5, _0809DC58  @ gUnknown_02022D86
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #6
	bl sub_809D8D4
	ldr r0, _0809DC5C  @ gUnknown_08A19CCC
	ldr r1, _0809DC60  @ 0x06015000
	bl CopyDataWithPossibleUncomp
	ldr r0, _0809DC64  @ gUnknown_08A1A084
	movs r6, #0xa0
	lsls r6, r6, #2
	adds r1, r6, #0
	movs r2, #0x20
	bl CopyToPaletteBuffer
	movs r3, #0xb0
	lsls r3, r3, #7
	movs r0, #9
	str r0, [sp]
	adds r0, r7, #0
	movs r1, #0xe1
	movs r2, #0x2f
	bl sub_8097748
	bl sub_8097668
	ldr r0, [r7, #0x2c]
	mov r2, r8
	ldrb r1, [r2]
	movs r2, #1
	bl SomethingPrepListRelated
	ldr r4, _0809DC50  @ gUnknown_02013698
	ldr r1, _0809DC68  @ gUnknown_02023CC6
	mov r2, r8
	ldrb r0, [r2]
	lsls r0, r0, #1
	add r0, r9
	ldrh r2, [r0]
	lsrs r2, r2, #4
	ldr r3, [r7, #0x2c]
	adds r0, r4, #0
	bl sub_809D300
	movs r0, #4
	bl BG_EnableSyncByMask
	movs r0, #0xb3
	lsls r0, r0, #1
	adds r5, r5, r0
	subs r4, #0x28
	ldr r2, [r7, #0x2c]
	adds r0, r5, #0
	adds r1, r4, #0
	movs r3, #0
	bl sub_809B74C
	bl sub_809D6CC
	adds r0, r7, #0
	bl sub_80ACCE0
	movs r0, #0
	adds r1, r6, #0
	movs r2, #2
	bl sub_80ACCF4
	movs r0, #0x78
	movs r1, #0x18
	movs r2, #0xe9
	movs r3, #0x18
	bl sub_80ACD7C
	movs r0, #3
	bl sub_80ACD60
	ldr r0, _0809DC6C  @ sub_809D844
	adds r1, r7, #0
	bl StartParallelWorker
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809DC38: .4byte gUnknown_08A1B9EC
_0809DC3C: .4byte gGenericBuffer
_0809DC40: .4byte gBG1TilemapBuffer
_0809DC44: .4byte gUnknown_08A1BCC0
_0809DC48: .4byte gLCDControlBuffer
_0809DC4C: .4byte gUnknown_02013660
_0809DC50: .4byte gUnknown_02013698
_0809DC54: .4byte sub_809D530
_0809DC58: .4byte gUnknown_02022D86
_0809DC5C: .4byte gUnknown_08A19CCC
_0809DC60: .4byte 0x06015000
_0809DC64: .4byte gUnknown_08A1A084
_0809DC68: .4byte gUnknown_02023CC6
_0809DC6C: .4byte sub_809D844

	THUMB_FUNC_END sub_809DA00

	THUMB_FUNC_START sub_809DC70
sub_809DC70: @ 0x0809DC70
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0
	adds r1, r4, #0
	bl sub_809D278
	movs r0, #0
	bl sub_80ACA84
	adds r0, r4, #0
	bl sub_809D644
	adds r0, r4, #0
	adds r0, #0x33
	ldrb r1, [r0]
	lsls r1, r1, #4
	adds r1, #0x24
	movs r3, #0x80
	lsls r3, r3, #3
	movs r0, #0x44
	movs r2, #4
	bl ShowPrepScreenHandCursor
	ldr r0, _0809DCC8  @ sub_809D7D4
	bl GetParallelWorker
	bl Proc_End
	ldr r0, _0809DCCC  @ sub_809D80C
	bl GetParallelWorker
	bl Proc_End
	ldr r0, _0809DCD0  @ sub_809D784
	adds r1, r4, #0
	bl StartParallelWorker
	movs r0, #7
	bl BG_EnableSyncByMask
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809DCC8: .4byte sub_809D7D4
_0809DCCC: .4byte sub_809D80C
_0809DCD0: .4byte sub_809D784

	THUMB_FUNC_END sub_809DC70

	THUMB_FUNC_START sub_809DCD4
sub_809DCD4: @ 0x0809DCD4
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r4, r5, #0
	adds r4, #0x33
	ldrb r6, [r4]
	ldrh r0, [r5, #0x38]
	cmp r0, #0
	beq _0809DCE6
	b _0809DE34
_0809DCE6:
	ldr r1, _0809DD04  @ gKeyStatusPtr
	ldr r0, [r1]
	ldrh r3, [r0, #8]
	movs r7, #1
	adds r0, r7, #0
	ands r0, r3
	mov ip, r1
	cmp r0, #0
	beq _0809DDE8
	cmp r6, #0
	beq _0809DD08
	cmp r6, #1
	beq _0809DD70
	b _0809DEEC
	.align 2, 0
_0809DD04: .4byte gKeyStatusPtr
_0809DD08:
	bl GetConvoyItemCount_
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x63
	bhi _0809DDCC
	ldr r0, [r5, #0x2c]
	bl GetUnitItemCount
	cmp r0, #0
	ble _0809DDCC
	ldrb r2, [r4]
	lsls r2, r2, #4
	adds r2, #0x24
	movs r0, #0
	movs r1, #0x44
	movs r3, #2
	bl sub_80AC9D4
	ldr r0, _0809DD64  @ sub_809D784
	bl GetParallelWorker
	bl Proc_End
	ldr r0, _0809DD68  @ sub_809D7D4
	adds r1, r5, #0
	bl StartParallelWorker
	movs r0, #1
	adds r1, r5, #0
	bl sub_809D278
	ldr r0, _0809DD6C  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809DD5A
	movs r0, #0x6a
	bl m4aSongNumStart
_0809DD5A:
	adds r0, r5, #0
	movs r1, #3
	bl Proc_Goto
	b _0809DEEC
	.align 2, 0
_0809DD64: .4byte sub_809D784
_0809DD68: .4byte sub_809D7D4
_0809DD6C: .4byte gRAMChapterData
_0809DD70:
	ldr r0, [r5, #0x2c]
	bl GetUnitItemCount
	cmp r0, #4
	bgt _0809DDCC
	ldrb r2, [r4]
	lsls r2, r2, #4
	adds r2, #0x24
	movs r0, #0
	movs r1, #0x44
	movs r3, #2
	bl sub_80AC9D4
	ldr r0, _0809DDC0  @ sub_809D784
	bl GetParallelWorker
	bl Proc_End
	ldr r0, _0809DDC4  @ sub_809D80C
	adds r1, r5, #0
	bl StartParallelWorker
	movs r0, #2
	adds r1, r5, #0
	bl sub_809D278
	ldr r0, _0809DDC8  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809DDB6
	movs r0, #0x6a
	bl m4aSongNumStart
_0809DDB6:
	adds r0, r5, #0
	movs r1, #4
	bl Proc_Goto
	b _0809DEEC
	.align 2, 0
_0809DDC0: .4byte sub_809D784
_0809DDC4: .4byte sub_809D80C
_0809DDC8: .4byte gRAMChapterData
_0809DDCC:
	ldr r0, _0809DDE4  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	bge _0809DDDA
	b _0809DEEC
_0809DDDA:
	movs r0, #0x6c
	bl m4aSongNumStart
	b _0809DEEC
	.align 2, 0
_0809DDE4: .4byte gRAMChapterData
_0809DDE8:
	movs r0, #2
	ands r0, r3
	cmp r0, #0
	beq _0809DE10
	adds r0, r5, #0
	movs r1, #8
	bl Proc_Goto
	ldr r0, _0809DE0C  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809DEEC
	movs r0, #0x6b
	bl m4aSongNumStart
	b _0809DEEC
	.align 2, 0
_0809DE0C: .4byte gRAMChapterData
_0809DE10:
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r3
	cmp r0, #0
	beq _0809DE54
	lsls r1, r6, #4
	adds r1, #0x24
	ldr r2, _0809DE30  @ gUnknown_08A19204
	lsls r0, r6, #2
	adds r0, r0, r2
	ldr r2, [r0]
	movs r0, #0x44
	bl StartHelpBox
	strh r7, [r5, #0x38]
	b _0809DEEC
	.align 2, 0
_0809DE30: .4byte gUnknown_08A19204
_0809DE34:
	ldr r2, _0809DE50  @ gKeyStatusPtr
	ldr r0, [r2]
	ldrh r1, [r0, #8]
	movs r0, #0x81
	lsls r0, r0, #1
	ands r0, r1
	mov ip, r2
	cmp r0, #0
	beq _0809DE54
	bl CloseHelpBox
	movs r0, #0
	strh r0, [r5, #0x38]
	b _0809DEEC
	.align 2, 0
_0809DE50: .4byte gKeyStatusPtr
_0809DE54:
	mov r0, ip
	ldr r3, [r0]
	ldrh r1, [r3, #6]
	movs r2, #0x40
	adds r0, r2, #0
	ands r0, r1
	adds r4, r5, #0
	adds r4, #0x33
	cmp r0, #0
	beq _0809DE80
	ldrb r0, [r4]
	cmp r0, #0
	beq _0809DE72
	subs r0, #1
	b _0809DE7E
_0809DE72:
	ldrh r1, [r3, #8]
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	beq _0809DE80
	movs r0, #1
_0809DE7E:
	strb r0, [r4]
_0809DE80:
	mov r0, ip
	ldr r2, [r0]
	ldrh r1, [r2, #6]
	movs r3, #0x80
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	beq _0809DEA8
	ldrb r0, [r4]
	cmp r0, #0
	bne _0809DE9A
	adds r0, #1
	b _0809DEA6
_0809DE9A:
	ldrh r1, [r2, #8]
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	beq _0809DEA8
	movs r0, #0
_0809DEA6:
	strb r0, [r4]
_0809DEA8:
	ldrb r0, [r4]
	cmp r6, r0
	beq _0809DEEC
	ldr r0, _0809DEF4  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809DEC0
	movs r0, #0x66
	bl m4aSongNumStart
_0809DEC0:
	ldrb r1, [r4]
	lsls r1, r1, #4
	adds r1, #0x24
	movs r3, #0x80
	lsls r3, r3, #3
	movs r0, #0x44
	movs r2, #4
	bl ShowPrepScreenHandCursor
	ldrh r0, [r5, #0x38]
	cmp r0, #0
	beq _0809DEEC
	ldrb r0, [r4]
	lsls r1, r0, #4
	adds r1, #0x24
	ldr r2, _0809DEF8  @ gUnknown_08A19204
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r2, [r0]
	movs r0, #0x44
	bl StartHelpBox
_0809DEEC:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809DEF4: .4byte gRAMChapterData
_0809DEF8: .4byte gUnknown_08A19204

	THUMB_FUNC_END sub_809DCD4

	THUMB_FUNC_START sub_809DEFC
sub_809DEFC: @ 0x0809DEFC
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	bl ResetIconGraphics_
	ldr r0, [r4, #0x2c]
	adds r5, r4, #0
	adds r5, #0x35
	ldrb r1, [r5]
	movs r2, #1
	bl SomethingPrepListRelated
	ldr r0, _0809DF8C  @ gUnknown_02013698
	ldr r1, _0809DF90  @ gUnknown_02023CC6
	ldrb r2, [r5]
	lsls r2, r2, #1
	adds r6, r4, #0
	adds r6, #0x4c
	adds r2, r6, r2
	ldrh r2, [r2]
	lsrs r2, r2, #4
	ldr r3, [r4, #0x2c]
	bl sub_809D300
	ldr r0, _0809DF94  @ gUnknown_02022EEC
	ldr r1, [r4, #0x2c]
	bl sub_809B830
	ldrb r0, [r5]
	lsls r0, r0, #1
	adds r7, r4, #0
	adds r7, #0x3a
	adds r1, r7, r0
	ldrh r1, [r1]
	lsls r1, r1, #4
	adds r0, r6, r0
	ldrh r0, [r0]
	subs r0, #0x28
	subs r1, r1, r0
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x80
	movs r2, #0xb
	bl ShowPrepScreenHandCursor
	movs r0, #5
	bl BG_EnableSyncByMask
	ldrh r0, [r4, #0x38]
	cmp r0, #0
	beq _0809DFA8
	ldr r0, _0809DF98  @ gUnknown_02012F56
	ldrh r0, [r0]
	cmp r0, #0
	beq _0809DFA0
	ldr r2, _0809DF9C  @ gUnknown_020122D4
	ldrb r3, [r5]
	lsls r3, r3, #1
	adds r0, r7, r3
	ldrh r1, [r0]
	lsls r0, r1, #2
	adds r0, r0, r2
	ldrh r2, [r0, #2]
	lsls r1, r1, #4
	adds r3, r6, r3
	ldrh r0, [r3]
	subs r0, #0x28
	subs r1, r1, r0
	movs r0, #0x80
	bl StartItemHelpBox
	movs r0, #1
	b _0809DFA6
	.align 2, 0
_0809DF8C: .4byte gUnknown_02013698
_0809DF90: .4byte gUnknown_02023CC6
_0809DF94: .4byte gUnknown_02022EEC
_0809DF98: .4byte gUnknown_02012F56
_0809DF9C: .4byte gUnknown_020122D4
_0809DFA0:
	bl CloseHelpBox
	movs r0, #0xff
_0809DFA6:
	strh r0, [r4, #0x38]
_0809DFA8:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_809DEFC

	THUMB_FUNC_START sub_809DFB0
sub_809DFB0: @ 0x0809DFB0
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r6, r0, #0
	movs r3, #0
	movs r7, #4
	adds r1, r6, #0
	adds r1, #0x34
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldrb r4, [r1]
	cmp r4, #4
	bge _0809DFDE
	subs r1, r7, r4
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #5
	muls r0, r1, r0
	movs r1, #0x10
	bl __divsi3
	adds r3, r0, #0
	subs r3, #0x60
_0809DFDE:
	adds r5, r6, #0
	adds r5, #0x35
	cmp r4, #4
	bne _0809DFFE
	ldrb r0, [r5]
	cmp r0, #0
	bne _0809DFF0
	movs r0, #8
	b _0809DFF2
_0809DFF0:
	subs r0, #1
_0809DFF2:
	strb r0, [r5]
	adds r0, r6, #0
	str r3, [sp]
	bl sub_809DEFC
	ldr r3, [sp]
_0809DFFE:
	adds r4, r6, #0
	adds r4, #0x34
	ldrb r1, [r4]
	cmp r1, r7
	blt _0809E01E
	subs r1, r1, r7
	subs r1, r7, r1
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #5
	muls r0, r1, r0
	adds r1, r7, #0
	muls r1, r7, r1
	bl __divsi3
	adds r3, r0, #0
_0809E01E:
	movs r0, #0xff
	ands r3, r0
	ldrb r1, [r5]
	lsls r1, r1, #1
	adds r0, r6, #0
	adds r0, #0x4c
	adds r0, r0, r1
	ldrh r2, [r0]
	subs r2, #0x28
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #2
	adds r1, r3, #0
	bl BG_SetPosition
	ldrb r1, [r4]
	lsls r0, r7, #1
	cmp r1, r0
	bne _0809E04C
	adds r0, r6, #0
	movs r1, #4
	bl Proc_Goto
_0809E04C:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_809DFB0

	THUMB_FUNC_START sub_809E054
sub_809E054: @ 0x0809E054
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r7, r0, #0
	movs r0, #4
	mov r8, r0
	adds r1, r7, #0
	adds r1, #0x34
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldrb r4, [r1]
	cmp r4, #4
	bge _0809E086
	mov r2, r8
	subs r1, r2, r4
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #5
	muls r0, r1, r0
	movs r1, #0x10
	bl __divsi3
	movs r1, #0x60
	subs r6, r1, r0
_0809E086:
	adds r5, r7, #0
	adds r5, #0x35
	cmp r4, #4
	bne _0809E0A2
	ldrb r0, [r5]
	cmp r0, #8
	bne _0809E098
	movs r0, #0
	b _0809E09A
_0809E098:
	adds r0, #1
_0809E09A:
	strb r0, [r5]
	adds r0, r7, #0
	bl sub_809DEFC
_0809E0A2:
	adds r4, r7, #0
	adds r4, #0x34
	ldrb r1, [r4]
	cmp r1, r8
	blt _0809E0C6
	mov r0, r8
	subs r1, r1, r0
	subs r1, r0, r1
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #5
	muls r0, r1, r0
	mov r2, r8
	mov r1, r8
	muls r1, r2, r1
	bl __divsi3
	negs r6, r0
_0809E0C6:
	movs r0, #0xff
	ands r6, r0
	ldrb r1, [r5]
	lsls r1, r1, #1
	adds r0, r7, #0
	adds r0, #0x4c
	adds r0, r0, r1
	ldrh r2, [r0]
	subs r2, #0x28
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #2
	adds r1, r6, #0
	bl BG_SetPosition
	ldrb r1, [r4]
	mov r2, r8
	lsls r0, r2, #1
	cmp r1, r0
	bne _0809E0F6
	adds r0, r7, #0
	movs r1, #4
	bl Proc_Goto
_0809E0F6:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_809E054

	THUMB_FUNC_START sub_809E100
sub_809E100: @ 0x0809E100
	push {r4, r5, lr}
	mov ip, r0
	ldr r0, _0809E128  @ gUnknown_02012F56
	ldrh r4, [r0]
	adds r5, r0, #0
	cmp r4, #0
	bne _0809E12C
	mov r3, ip
	adds r3, #0x35
	ldrb r0, [r3]
	lsls r0, r0, #1
	mov r1, ip
	adds r1, #0x3a
	adds r1, r1, r0
	mov r2, ip
	adds r2, #0x4c
	adds r0, r2, r0
	strh r4, [r0]
	strh r4, [r1]
	b _0809E14A
	.align 2, 0
_0809E128: .4byte gUnknown_02012F56
_0809E12C:
	mov r2, ip
	adds r2, #0x35
	ldrb r0, [r2]
	lsls r0, r0, #1
	mov r1, ip
	adds r1, #0x3a
	adds r4, r1, r0
	ldrh r1, [r4]
	ldrh r0, [r5]
	subs r0, #1
	adds r3, r2, #0
	adds r2, #0x17
	cmp r1, r0
	ble _0809E14A
	strh r0, [r4]
_0809E14A:
	ldrh r0, [r5]
	cmp r0, #6
	bls _0809E168
	ldrb r0, [r3]
	lsls r0, r0, #1
	adds r4, r2, r0
	ldrh r0, [r4]
	lsrs r0, r0, #4
	adds r0, #7
	ldrh r1, [r5]
	cmp r0, r1
	ble _0809E168
	subs r0, r1, #7
	lsls r0, r0, #4
	strh r0, [r4]
_0809E168:
	ldrb r0, [r3]
	lsls r0, r0, #1
	adds r0, r2, r0
	ldrh r2, [r0]
	subs r2, #0x28
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #2
	movs r1, #0
	bl BG_SetPosition
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_809E100

	THUMB_FUNC_START sub_809E184
sub_809E184: @ 0x0809E184
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov ip, r0
	adds r0, #0x35
	ldrb r1, [r0]
	lsls r1, r1, #1
	adds r0, #5
	adds r4, r0, r1
	ldrh r3, [r4]
	lsls r2, r3, #4
	adds r0, #0x12
	adds r0, r0, r1
	ldrh r0, [r0]
	subs r0, #0x28
	subs r2, r2, r0
	cmp r2, #0x37
	bgt _0809E1B0
	cmp r3, #0
	beq _0809E1B0
	adds r0, r3, #1
	strh r0, [r4]
_0809E1B0:
	mov r4, ip
	adds r4, #0x35
	ldrb r0, [r4]
	lsls r0, r0, #1
	mov r3, ip
	adds r3, #0x3a
	adds r6, r3, r0
	ldrh r5, [r6]
	lsls r1, r5, #4
	mov r2, ip
	adds r2, #0x4c
	adds r0, r2, r0
	ldrh r0, [r0]
	subs r0, #0x28
	subs r1, r1, r0
	adds r7, r3, #0
	mov r8, r2
	cmp r1, #0x78
	ble _0809E1E4
	ldr r0, _0809E214  @ gUnknown_02012F56
	ldrh r0, [r0]
	subs r0, #1
	cmp r5, r0
	beq _0809E1E4
	subs r0, r5, #1
	strh r0, [r6]
_0809E1E4:
	mov r0, ip
	bl sub_809E100
	ldrb r0, [r4]
	lsls r0, r0, #1
	adds r1, r7, r0
	ldrh r1, [r1]
	lsls r1, r1, #4
	add r0, r8
	ldrh r0, [r0]
	subs r0, #0x28
	subs r1, r1, r0
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x80
	movs r2, #0xb
	bl ShowPrepScreenHandCursor
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809E214: .4byte gUnknown_02012F56

	THUMB_FUNC_END sub_809E184

	THUMB_FUNC_START sub_809E218
sub_809E218: @ 0x0809E218
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	adds r7, r1, #0
	bl ResetIconGraphics_
	ldr r0, _0809E2B0  @ gUnknown_02023CC6
	mov r8, r0
	adds r6, r4, #0
	adds r6, #0x35
	ldrb r0, [r6]
	lsls r0, r0, #1
	adds r5, r4, #0
	adds r5, #0x4c
	adds r0, r5, r0
	ldrh r1, [r0]
	lsrs r1, r1, #4
	mov r0, r8
	bl sub_809D418
	ldr r0, _0809E2B4  @ gUnknown_02022EEC
	ldr r1, [r4, #0x2c]
	bl sub_809B830
	movs r0, #5
	bl BG_EnableSyncByMask
	cmp r7, #0
	bge _0809E26A
	ldr r0, _0809E2B8  @ gUnknown_02013698
	ldrb r1, [r6]
	lsls r1, r1, #1
	adds r1, r5, r1
	ldrh r2, [r1]
	lsrs r2, r2, #4
	subs r2, #1
	ldr r3, [r4, #0x2c]
	mov r1, r8
	bl sub_809D47C
_0809E26A:
	cmp r7, #0
	ble _0809E284
	ldr r0, _0809E2B8  @ gUnknown_02013698
	ldrb r1, [r6]
	lsls r1, r1, #1
	adds r1, r5, r1
	ldrh r2, [r1]
	lsrs r2, r2, #4
	adds r2, #7
	ldr r3, [r4, #0x2c]
	mov r1, r8
	bl sub_809D47C
_0809E284:
	ldrb r1, [r6]
	lsls r1, r1, #1
	adds r1, r5, r1
	ldrh r0, [r1]
	adds r0, r0, r7
	strh r0, [r1]
	ldrb r0, [r6]
	lsls r0, r0, #1
	adds r0, r5, r0
	ldrh r2, [r0]
	subs r2, #0x28
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #2
	movs r1, #0
	bl BG_SetPosition
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809E2B0: .4byte gUnknown_02023CC6
_0809E2B4: .4byte gUnknown_02022EEC
_0809E2B8: .4byte gUnknown_02013698

	THUMB_FUNC_END sub_809E218

	THUMB_FUNC_START sub_809E2BC
sub_809E2BC: @ 0x0809E2BC
	push {lr}
	bl sub_809D6CC
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_809E2BC

	THUMB_FUNC_START sub_809E2C8
sub_809E2C8: @ 0x0809E2C8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r7, r0, #0
	ldr r0, [r7, #0x2c]
	bl GetUnitItemCount
	adds r2, r0, #0
	cmp r2, #5
	beq _0809E2E4
	ldr r0, _0809E2FC  @ gUnknown_02012F56
	ldrh r0, [r0]
	cmp r0, #0
	bne _0809E304
_0809E2E4:
	ldr r0, _0809E300  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	bge _0809E2F2
	b _0809E412
_0809E2F2:
	movs r0, #0x6c
	bl m4aSongNumStart
	b _0809E412
	.align 2, 0
_0809E2FC: .4byte gUnknown_02012F56
_0809E300: .4byte gRAMChapterData
_0809E304:
	movs r5, #0
	strh r5, [r7, #0x38]
	ldr r1, [r7, #0x2c]
	lsls r0, r2, #1
	adds r1, #0x1e
	adds r1, r1, r0
	ldr r4, _0809E3E4  @ gUnknown_020122D4
	movs r0, #0x35
	adds r0, r0, r7
	mov r8, r0
	ldrb r0, [r0]
	lsls r0, r0, #1
	adds r6, r7, #0
	adds r6, #0x3a
	adds r0, r6, r0
	ldrh r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r4
	ldrh r0, [r0, #2]
	strh r0, [r1]
	ldr r0, [r7, #0x2c]
	bl UnitRemoveInvalidItems
	mov r1, r8
	ldrb r0, [r1]
	lsls r0, r0, #1
	adds r0, r6, r0
	ldrh r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r4
	strh r5, [r0, #2]
	bl sub_80982B8
	ldr r0, [r7, #0x2c]
	mov r2, r8
	ldrb r1, [r2]
	movs r2, #1
	bl SomethingPrepListRelated
	adds r0, r7, #0
	bl sub_809E100
	bl ResetIconGraphics_
	ldr r0, _0809E3E8  @ gUnknown_02022EEC
	ldr r4, _0809E3EC  @ gUnknown_02013670
	ldr r2, [r7, #0x2c]
	adds r1, r4, #0
	movs r3, #0
	bl sub_809B74C
	adds r4, #0x28
	ldr r1, _0809E3F0  @ gUnknown_02023CC6
	mov r2, r8
	ldrb r0, [r2]
	lsls r0, r0, #1
	adds r5, r7, #0
	adds r5, #0x4c
	adds r0, r5, r0
	ldrh r2, [r0]
	lsrs r2, r2, #4
	ldr r3, [r7, #0x2c]
	adds r0, r4, #0
	bl sub_809D300
	ldr r0, _0809E3F4  @ sub_809E2BC
	movs r1, #1
	adds r2, r7, #0
	bl sub_80ACE20
	mov r1, r8
	ldrb r0, [r1]
	lsls r0, r0, #1
	adds r6, r6, r0
	ldrh r1, [r6]
	lsls r1, r1, #4
	adds r5, r5, r0
	ldrh r0, [r5]
	subs r0, #0x28
	subs r1, r1, r0
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x80
	movs r2, #0xb
	bl ShowPrepScreenHandCursor
	movs r0, #5
	bl BG_EnableSyncByMask
	ldr r1, _0809E3F8  @ gActionData
	movs r0, #0x1c
	strb r0, [r1, #0x11]
	ldr r0, [r7, #0x2c]
	bl GetUnitItemCount
	cmp r0, #5
	bne _0809E400
	adds r0, r7, #0
	movs r1, #1
	bl Proc_Goto
	ldr r0, _0809E3FC  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809E412
	movs r0, #0x6b
	bl m4aSongNumStart
	b _0809E412
	.align 2, 0
_0809E3E4: .4byte gUnknown_020122D4
_0809E3E8: .4byte gUnknown_02022EEC
_0809E3EC: .4byte gUnknown_02013670
_0809E3F0: .4byte gUnknown_02023CC6
_0809E3F4: .4byte sub_809E2BC
_0809E3F8: .4byte gActionData
_0809E3FC: .4byte gRAMChapterData
_0809E400:
	ldr r0, _0809E41C  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809E412
	movs r0, #0x6a
	bl m4aSongNumStart
_0809E412:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809E41C: .4byte gRAMChapterData

	THUMB_FUNC_END sub_809E2C8

	THUMB_FUNC_START sub_809E420
sub_809E420: @ 0x0809E420
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	adds r4, r0, #0
	adds r7, r4, #0
	adds r7, #0x35
	ldrb r0, [r7]
	lsls r0, r0, #1
	movs r1, #0x3a
	adds r1, r1, r4
	mov r8, r1
	adds r1, r1, r0
	ldrh r1, [r1]
	mov sl, r1
	adds r5, r4, #0
	adds r5, #0x4c
	adds r6, r5, r0
	ldrh r0, [r6]
	movs r2, #0xf
	mov r9, r2
	mov r1, r9
	ands r1, r0
	mov r9, r1
	cmp r1, #0
	beq _0809E458
	b _0809E648
_0809E458:
	ldrh r0, [r4, #0x38]
	cmp r0, #0
	beq _0809E462
	cmp r0, #0xff
	bne _0809E500
_0809E462:
	ldr r1, _0809E49C  @ gKeyStatusPtr
	ldr r0, [r1]
	ldrh r3, [r0, #8]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r3
	mov r8, r1
	cmp r0, #0
	beq _0809E4C4
	ldr r0, _0809E4A0  @ gUnknown_02012F56
	ldrh r0, [r0]
	cmp r0, #0
	beq _0809E4A8
	ldr r1, _0809E4A4  @ gUnknown_020122D4
	mov r2, sl
	lsls r0, r2, #2
	adds r0, r0, r1
	ldrh r2, [r0, #2]
	mov r0, sl
	lsls r1, r0, #4
	ldrh r0, [r6]
	subs r0, #0x28
	subs r1, r1, r0
	movs r0, #0x80
	bl StartItemHelpBox
	movs r0, #1
	strh r0, [r4, #0x38]
	b _0809E79A
	.align 2, 0
_0809E49C: .4byte gKeyStatusPtr
_0809E4A0: .4byte gUnknown_02012F56
_0809E4A4: .4byte gUnknown_020122D4
_0809E4A8:
	ldr r0, _0809E4C0  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	bge _0809E4B6
	b _0809E79A
_0809E4B6:
	movs r0, #0x6c
	bl m4aSongNumStart
	b _0809E79A
	.align 2, 0
_0809E4C0: .4byte gRAMChapterData
_0809E4C4:
	movs r0, #1
	ands r0, r3
	cmp r0, #0
	beq _0809E4D4
	adds r0, r4, #0
	bl sub_809E2C8
	b _0809E79A
_0809E4D4:
	movs r0, #2
	ands r0, r3
	cmp r0, #0
	beq _0809E520
	adds r0, r4, #0
	movs r1, #1
	bl Proc_Goto
	ldr r0, _0809E4FC  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809E4F6
	movs r0, #0x6b
	bl m4aSongNumStart
_0809E4F6:
	mov r1, r9
	strh r1, [r4, #0x38]
	b _0809E79A
	.align 2, 0
_0809E4FC: .4byte gRAMChapterData
_0809E500:
	ldr r2, _0809E51C  @ gKeyStatusPtr
	ldr r0, [r2]
	ldrh r1, [r0, #8]
	movs r0, #0x81
	lsls r0, r0, #1
	ands r0, r1
	mov r8, r2
	cmp r0, #0
	beq _0809E520
	bl CloseHelpBox
	mov r2, r9
	strh r2, [r4, #0x38]
	b _0809E79A
	.align 2, 0
_0809E51C: .4byte gKeyStatusPtr
_0809E520:
	mov r0, r8
	ldr r2, [r0]
	ldrh r1, [r2, #6]
	movs r0, #0x20
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0
	beq _0809E568
	movs r0, #0
	bl sub_80ACDA4
	ldr r0, _0809E564  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809E54A
	movs r0, #0x67
	bl m4aSongNumStart
_0809E54A:
	adds r0, r4, #0
	movs r1, #5
	bl Proc_Goto
	adds r1, r4, #0
	adds r1, #0x34
	movs r0, #0
	strb r0, [r1]
	adds r0, r4, #0
	bl sub_809DFB0
	b _0809E79A
	.align 2, 0
_0809E564: .4byte gRAMChapterData
_0809E568:
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _0809E5A4
	movs r0, #1
	bl sub_80ACDA4
	ldr r0, _0809E5A0  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809E588
	movs r0, #0x67
	bl m4aSongNumStart
_0809E588:
	adds r0, r4, #0
	movs r1, #6
	bl Proc_Goto
	adds r0, r4, #0
	adds r0, #0x34
	strb r5, [r0]
	adds r0, r4, #0
	bl sub_809E054
	b _0809E79A
	.align 2, 0
_0809E5A0: .4byte gRAMChapterData
_0809E5A4:
	ldrh r1, [r2, #4]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0809E5B8
	adds r1, r4, #0
	adds r1, #0x32
	movs r0, #8
	b _0809E5BE
_0809E5B8:
	adds r1, r4, #0
	adds r1, #0x32
	movs r0, #4
_0809E5BE:
	strb r0, [r1]
	adds r7, r1, #0
	mov r1, r8
	ldr r2, [r1]
	ldrh r1, [r2, #6]
	movs r3, #0x40
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	bne _0809E5EC
	ldrh r1, [r2, #4]
	adds r0, r3, #0
	ands r0, r1
	adds r6, r4, #0
	adds r6, #0x35
	adds r5, r4, #0
	adds r5, #0x3a
	cmp r0, #0
	beq _0809E608
	movs r0, #0
	ldrsb r0, [r7, r0]
	cmp r0, #8
	bne _0809E608
_0809E5EC:
	adds r0, r4, #0
	adds r0, #0x35
	ldrb r1, [r0]
	lsls r1, r1, #1
	adds r2, r4, #0
	adds r2, #0x3a
	adds r3, r2, r1
	ldrh r1, [r3]
	adds r6, r0, #0
	adds r5, r2, #0
	cmp r1, #0
	beq _0809E608
	subs r0, r1, #1
	strh r0, [r3]
_0809E608:
	mov r0, r8
	ldr r2, [r0]
	ldrh r1, [r2, #6]
	movs r3, #0x80
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	bne _0809E62A
	ldrh r1, [r2, #4]
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	beq _0809E6A8
	movs r0, #0
	ldrsb r0, [r7, r0]
	cmp r0, #8
	bne _0809E6A8
_0809E62A:
	ldrb r0, [r6]
	lsls r0, r0, #1
	adds r2, r5, r0
	ldrh r1, [r2]
	ldr r0, _0809E644  @ gUnknown_02012F56
	ldrh r0, [r0]
	subs r0, #1
	cmp r1, r0
	bge _0809E6A8
	adds r0, r1, #1
	strh r0, [r2]
	b _0809E6A8
	.align 2, 0
_0809E644: .4byte gUnknown_02012F56
_0809E648:
	mov r1, sl
	lsls r0, r1, #4
	ldrh r2, [r6]
	adds r1, r2, #0
	subs r1, #0x28
	subs r0, r0, r1
	cmp r0, #0x37
	bgt _0809E666
	adds r0, r4, #0
	adds r0, #0x32
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r2, r0
	strh r0, [r6]
_0809E666:
	ldrb r0, [r7]
	lsls r0, r0, #1
	mov r2, r8
	adds r1, r2, r0
	ldrh r1, [r1]
	lsls r1, r1, #4
	adds r3, r5, r0
	ldrh r2, [r3]
	adds r0, r2, #0
	subs r0, #0x28
	subs r1, r1, r0
	cmp r1, #0x78
	ble _0809E68E
	adds r0, r4, #0
	adds r0, #0x32
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r0, r2, r0
	strh r0, [r3]
_0809E68E:
	ldrb r0, [r7]
	lsls r0, r0, #1
	adds r0, r5, r0
	ldrh r2, [r0]
	subs r2, #0x28
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #2
	movs r1, #0
	bl BG_SetPosition
	adds r6, r7, #0
	mov r5, r8
_0809E6A8:
	ldrb r0, [r6]
	lsls r0, r0, #1
	adds r0, r5, r0
	ldrh r0, [r0]
	cmp sl, r0
	beq _0809E79A
	ldr r1, _0809E710  @ gUnknown_020122D4
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrh r0, [r0, #2]
	mov r8, r0
	ldr r0, _0809E714  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809E6D0
	movs r0, #0x66
	bl m4aSongNumStart
_0809E6D0:
	ldrb r0, [r6]
	lsls r0, r0, #1
	adds r1, r5, r0
	ldrh r3, [r1]
	lsls r2, r3, #4
	adds r1, r4, #0
	adds r1, #0x4c
	adds r0, r1, r0
	ldrh r0, [r0]
	subs r0, #0x28
	subs r2, r2, r0
	adds r7, r1, #0
	cmp r2, #0x37
	bgt _0809E718
	cmp r3, #0
	beq _0809E718
	ldrh r0, [r4, #0x38]
	cmp r0, #0
	beq _0809E702
	adds r1, r2, #0
	adds r1, #0x10
	movs r0, #0x80
	mov r2, r8
	bl StartItemHelpBox
_0809E702:
	adds r0, r4, #0
	adds r0, #0x32
	movs r1, #0
	ldrsb r1, [r0, r1]
	negs r1, r1
	b _0809E750
	.align 2, 0
_0809E710: .4byte gUnknown_020122D4
_0809E714: .4byte gRAMChapterData
_0809E718:
	ldrb r0, [r6]
	lsls r0, r0, #1
	adds r1, r5, r0
	ldrh r2, [r1]
	lsls r1, r2, #4
	adds r0, r7, r0
	ldrh r0, [r0]
	subs r0, #0x28
	subs r1, r1, r0
	cmp r1, #0x78
	ble _0809E75C
	ldr r0, _0809E758  @ gUnknown_02012F56
	ldrh r0, [r0]
	subs r0, #1
	cmp r2, r0
	beq _0809E75C
	ldrh r0, [r4, #0x38]
	cmp r0, #0
	beq _0809E748
	subs r1, #0x10
	movs r0, #0x80
	mov r2, r8
	bl StartItemHelpBox
_0809E748:
	adds r0, r4, #0
	adds r0, #0x32
	movs r1, #0
	ldrsb r1, [r0, r1]
_0809E750:
	adds r0, r4, #0
	bl sub_809E218
	b _0809E79A
	.align 2, 0
_0809E758: .4byte gUnknown_02012F56
_0809E75C:
	ldrh r0, [r4, #0x38]
	cmp r0, #0
	beq _0809E77C
	ldrb r0, [r6]
	lsls r0, r0, #1
	adds r1, r5, r0
	ldrh r1, [r1]
	lsls r1, r1, #4
	adds r0, r7, r0
	ldrh r0, [r0]
	subs r0, #0x28
	subs r1, r1, r0
	movs r0, #0x80
	mov r2, r8
	bl StartItemHelpBox
_0809E77C:
	ldrb r0, [r6]
	lsls r0, r0, #1
	adds r1, r5, r0
	ldrh r1, [r1]
	lsls r1, r1, #4
	adds r0, r7, r0
	ldrh r0, [r0]
	subs r0, #0x28
	subs r1, r1, r0
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x80
	movs r2, #0xb
	bl ShowPrepScreenHandCursor
_0809E79A:
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_809E420

	THUMB_FUNC_START sub_809E7A8
sub_809E7A8: @ 0x0809E7A8
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	ldr r6, _0809E7D8  @ gKeyStatusPtr
	ldr r0, [r6]
	ldrh r1, [r0, #6]
	movs r7, #0x40
	adds r0, r7, #0
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0
	beq _0809E7EE
	ldr r0, [r4, #0x2c]
	bl GetUnitItemCount
	adds r3, r0, #0
	adds r2, r4, #0
	adds r2, #0x31
	ldrb r0, [r2]
	cmp r0, #0
	beq _0809E7DC
	subs r0, #1
	strb r0, [r2]
	b _0809E81E
	.align 2, 0
_0809E7D8: .4byte gKeyStatusPtr
_0809E7DC:
	ldr r0, [r6]
	ldrh r1, [r0, #8]
	adds r0, r7, #0
	ands r0, r1
	cmp r0, #0
	beq _0809E838
	subs r0, r3, #1
	strb r0, [r2]
	b _0809E81E
_0809E7EE:
	movs r7, #0x80
	adds r0, r7, #0
	ands r0, r1
	cmp r0, #0
	beq _0809E838
	ldr r0, [r4, #0x2c]
	bl GetUnitItemCount
	adds r2, r4, #0
	adds r2, #0x31
	ldrb r1, [r2]
	subs r0, #1
	cmp r1, r0
	bge _0809E810
	adds r0, r1, #1
	strb r0, [r2]
	b _0809E81E
_0809E810:
	ldr r0, [r6]
	ldrh r1, [r0, #8]
	adds r0, r7, #0
	ands r0, r1
	cmp r0, #0
	beq _0809E838
	strb r5, [r2]
_0809E81E:
	ldr r0, _0809E834  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809E830
	movs r0, #0x66
	bl m4aSongNumStart
_0809E830:
	movs r0, #1
	b _0809E83A
	.align 2, 0
_0809E834: .4byte gRAMChapterData
_0809E838:
	movs r0, #0
_0809E83A:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_809E7A8

	THUMB_FUNC_START sub_809E840
sub_809E840: @ 0x0809E840
	push {lr}
	adds r0, #0x31
	ldrb r1, [r0]
	lsls r1, r1, #4
	adds r1, #0x48
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x10
	movs r2, #0xb
	bl ShowPrepScreenHandCursor
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_809E840

	THUMB_FUNC_START sub_809E85C
sub_809E85C: @ 0x0809E85C
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x2c]
	adds r7, r5, #0
	adds r7, #0x31
	ldrb r2, [r7]
	lsls r2, r2, #1
	adds r1, r0, #0
	adds r1, #0x1e
	adds r1, r1, r2
	ldrh r4, [r1]
	bl GetUnitItemCount
	ldr r1, [r5, #0x2c]
	ldrb r0, [r7]
	lsls r0, r0, #1
	adds r1, #0x1e
	adds r1, r1, r0
	movs r0, #0
	strh r0, [r1]
	ldr r0, [r5, #0x2c]
	bl UnitRemoveInvalidItems
	adds r0, r4, #0
	bl sub_8098014
	adds r6, r5, #0
	adds r6, #0x35
	strb r0, [r6]
	adds r0, r4, #0
	bl AddItemToConvoy
	ldr r0, [r5, #0x2c]
	ldrb r1, [r6]
	movs r2, #1
	bl SomethingPrepListRelated
	adds r0, r5, #0
	bl sub_809E100
	bl ResetIconGraphics_
	ldr r0, _0809E924  @ gUnknown_02022EEC
	ldr r4, _0809E928  @ gUnknown_02013670
	ldr r2, [r5, #0x2c]
	adds r1, r4, #0
	movs r3, #0
	bl sub_809B74C
	adds r4, #0x28
	ldr r1, _0809E92C  @ gUnknown_02023CC6
	ldrb r2, [r6]
	lsls r2, r2, #1
	adds r0, r5, #0
	adds r0, #0x4c
	adds r0, r0, r2
	ldrh r2, [r0]
	lsrs r2, r2, #4
	ldr r3, [r5, #0x2c]
	adds r0, r4, #0
	bl sub_809D300
	ldr r0, _0809E930  @ sub_809E2BC
	movs r1, #1
	adds r2, r5, #0
	bl sub_80ACE20
	movs r0, #4
	bl BG_EnableSyncByMask
	ldr r0, [r5, #0x2c]
	bl GetUnitItemCount
	adds r4, r0, #0
	ldr r1, _0809E934  @ gActionData
	movs r0, #0x1c
	strb r0, [r1, #0x11]
	cmp r4, #0
	beq _0809E906
	bl GetConvoyItemCount_
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x64
	bne _0809E93C
_0809E906:
	adds r0, r5, #0
	movs r1, #1
	bl Proc_Goto
	ldr r0, _0809E938  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809E96A
	movs r0, #0x6b
	bl m4aSongNumStart
	b _0809E96A
	.align 2, 0
_0809E924: .4byte gUnknown_02022EEC
_0809E928: .4byte gUnknown_02013670
_0809E92C: .4byte gUnknown_02023CC6
_0809E930: .4byte sub_809E2BC
_0809E934: .4byte gActionData
_0809E938: .4byte gRAMChapterData
_0809E93C:
	ldr r0, _0809E970  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809E94E
	movs r0, #0x6a
	bl m4aSongNumStart
_0809E94E:
	ldrb r0, [r7]
	cmp r4, r0
	bgt _0809E96A
	subs r0, r4, #1
	strb r0, [r7]
	ldrb r1, [r7]
	lsls r1, r1, #4
	adds r1, #0x48
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x10
	movs r2, #0xb
	bl ShowPrepScreenHandCursor
_0809E96A:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809E970: .4byte gRAMChapterData

	THUMB_FUNC_END sub_809E85C

	THUMB_FUNC_START sub_809E974
sub_809E974: @ 0x0809E974
	push {r4, r5, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x38]
	cmp r0, #1
	bne _0809E99C
	ldr r0, _0809E998  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0x81
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0809EA34
	bl CloseHelpBox
	movs r0, #0
	strh r0, [r4, #0x38]
	b _0809EA76
	.align 2, 0
_0809E998: .4byte gKeyStatusPtr
_0809E99C:
	ldr r0, _0809E9D0  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0809E9D4
	ldr r0, [r4, #0x2c]
	adds r1, r4, #0
	adds r1, #0x31
	ldrb r3, [r1]
	lsls r1, r3, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r2, [r0]
	cmp r2, #0
	beq _0809EA76
	lsls r1, r3, #4
	adds r1, #0x48
	movs r0, #0x10
	bl StartItemHelpBox
	movs r0, #1
	strh r0, [r4, #0x38]
	b _0809EA76
	.align 2, 0
_0809E9D0: .4byte gKeyStatusPtr
_0809E9D4:
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0809EA0C
	ldr r0, [r4, #0x2c]
	adds r1, r4, #0
	adds r1, #0x31
	ldrb r1, [r1]
	bl sub_8097F98
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0809EA04
	movs r1, #1
	negs r1, r1
	ldr r2, _0809EA00  @ 0x0000088B
	adds r0, r1, #0
	adds r3, r4, #0
	bl sub_8097DA8
	b _0809EA76
	.align 2, 0
_0809EA00: .4byte 0x0000088B
_0809EA04:
	adds r0, r4, #0
	bl sub_809E85C
	b _0809EA76
_0809EA0C:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0809EA34
	adds r0, r4, #0
	movs r1, #1
	bl Proc_Goto
	ldr r0, _0809EA30  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809EA76
	movs r0, #0x6b
	bl m4aSongNumStart
	b _0809EA76
	.align 2, 0
_0809EA30: .4byte gRAMChapterData
_0809EA34:
	adds r0, r4, #0
	bl sub_809E7A8
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809EA76
	adds r5, r4, #0
	adds r5, #0x31
	ldrb r1, [r5]
	lsls r1, r1, #4
	adds r1, #0x48
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x10
	movs r2, #0xb
	bl ShowPrepScreenHandCursor
	ldrh r0, [r4, #0x38]
	cmp r0, #1
	bne _0809EA76
	ldr r0, [r4, #0x2c]
	ldrb r3, [r5]
	lsls r1, r3, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r2, [r0]
	cmp r2, #0
	beq _0809EA76
	lsls r1, r3, #4
	adds r1, #0x48
	movs r0, #0x10
	bl StartItemHelpBox
_0809EA76:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_809E974

	THUMB_FUNC_START sub_809EA7C
sub_809EA7C: @ 0x0809EA7C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0809EAA0  @ gGMData
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0809EAA4
	bl sub_80C4048
	cmp r0, #0
	beq _0809EABE
	adds r1, r4, #0
	adds r1, #0x35
	ldrb r1, [r1]
	adds r0, #0x2b
	b _0809EABC
	.align 2, 0
_0809EAA0: .4byte gGMData
_0809EAA4:
	adds r0, r4, #0
	adds r0, #0x30
	ldrb r0, [r0]
	cmp r0, #0
	bne _0809EABE
	ldr r0, _0809EAD4  @ ProcScr_AtMenu
	bl Proc_Find
	adds r1, r4, #0
	adds r1, #0x35
	ldrb r1, [r1]
	adds r0, #0x32
_0809EABC:
	strb r1, [r0]
_0809EABE:
	adds r0, r4, #0
	bl EndAllProcChildren
	bl EndBG3Slider_
	movs r0, #0
	bl SetPrimaryHBlankHandler
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809EAD4: .4byte ProcScr_AtMenu

	THUMB_FUNC_END sub_809EA7C

	THUMB_FUNC_START StartPrepItemSupplyProc
StartPrepItemSupplyProc: @ 0x0809EAD8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0809EAF0  @ ProcScr_PrepItemSupplyScreen
	bl Proc_StartBlocking
	str r4, [r0, #0x2c]
	adds r0, #0x30
	movs r1, #0
	strb r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809EAF0: .4byte ProcScr_PrepItemSupplyScreen

	THUMB_FUNC_END StartPrepItemSupplyProc



	THUMB_FUNC_START sub_809EAF4
sub_809EAF4: @ 0x0809EAF4
	push {r4, lr}
	ldr r4, _0809EB10  @ gActiveUnit
	ldr r0, [r4]
	cmp r0, #0
	beq _0809EB08
	bl MU_EndAll
	ldr r0, [r4]
	bl ShowUnitSprite
_0809EB08:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809EB10: .4byte gActiveUnit

	THUMB_FUNC_END sub_809EAF4

	THUMB_FUNC_START sub_809EB14
sub_809EB14: @ 0x0809EB14
	push {r4, lr}
	ldr r4, _0809EB34  @ gActiveUnit
	ldr r0, [r4]
	cmp r0, #0
	beq _0809EB2C
	bl HideUnitSprite
	ldr r0, [r4]
	bl MU_Create
	bl MU_SetDefaultFacing_Auto
_0809EB2C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809EB34: .4byte gActiveUnit

	THUMB_FUNC_END sub_809EB14

	THUMB_FUNC_START StartBmSupply
StartBmSupply: @ 0x0809EB38
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0809EB54  @ ProcScr_BmSupplyScreen
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x2c]
	adds r0, #0x30
	movs r1, #1
	strb r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809EB54: .4byte ProcScr_BmSupplyScreen

	THUMB_FUNC_END StartBmSupply

	THUMB_FUNC_START MaybeStartSelectConvoyItemProc
MaybeStartSelectConvoyItemProc: @ 0x0809EB58
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0809EB74  @ ProcScr_BmSupplyScreen
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x2c]
	adds r0, #0x30
	movs r1, #2
	strb r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809EB74: .4byte ProcScr_BmSupplyScreen

	THUMB_FUNC_END MaybeStartSelectConvoyItemProc

.align 2, 0
