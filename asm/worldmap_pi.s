	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	THUMB_FUNC_START sub_80BE65C
sub_80BE65C: @ 0x080BE65C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r7, r1, #0
	ldr r1, _080BE688  @ gUnknown_08A3E448
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r1, #2
	ldrsb r1, [r0, r1]
	mov sl, r1
	ldrb r0, [r0, #3]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	str r0, [sp]
	cmp r2, #0
	beq _080BE68C
	cmp r2, #1
	beq _080BE694
	b _080BE69C
	.align 2, 0
_080BE688: .4byte gUnknown_08A3E448
_080BE68C:
	movs r0, #0xd
	mov r9, r0
	movs r1, #4
	b _080BE69A
_080BE694:
	movs r0, #0xd
	mov r9, r0
	movs r1, #9
_080BE69A:
	mov r8, r1
_080BE69C:
	mov r0, sl
	cmp r0, #0
	bge _080BE6EC
	ldr r1, [sp]
	cmp r1, #0
	bge _080BE6EC
	ldr r5, _080BE800  @ gBG1TilemapBuffer
	adds r0, r5, #0
	mov r1, r9
	mov r2, r8
	movs r3, #0
	bl TileMap_FillRect
	ldr r6, _080BE804  @ gBG0TilemapBuffer
	adds r0, r6, #0
	mov r1, r9
	mov r2, r8
	movs r3, #0
	bl TileMap_FillRect
	adds r4, r7, #0
	subs r4, #0xa
	mov r0, r8
	subs r4, r0, r4
	lsls r4, r4, #6
	ldr r0, _080BE808  @ gUnknown_0201B958
	adds r0, r4, r0
	adds r1, r5, #0
	mov r2, r9
	adds r3, r7, #0
	bl TileMap_CopyRect
	ldr r0, _080BE80C  @ gUnknown_0201B458
	adds r4, r4, r0
	adds r0, r4, #0
	adds r1, r6, #0
	mov r2, r9
	adds r3, r7, #0
	bl TileMap_CopyRect
_080BE6EC:
	mov r1, sl
	cmp r1, #0
	ble _080BE746
	ldr r0, [sp]
	cmp r0, #0
	bge _080BE746
	movs r5, #0x1e
	mov r1, r9
	subs r5, r5, r1
	lsls r5, r5, #1
	ldr r6, _080BE800  @ gBG1TilemapBuffer
	adds r6, r5, r6
	adds r0, r6, #0
	mov r2, r8
	movs r3, #0
	bl TileMap_FillRect
	ldr r0, _080BE804  @ gBG0TilemapBuffer
	adds r5, r5, r0
	adds r0, r5, #0
	mov r1, r9
	mov r2, r8
	movs r3, #0
	bl TileMap_FillRect
	adds r4, r7, #0
	subs r4, #0xa
	mov r0, r8
	subs r4, r0, r4
	lsls r4, r4, #6
	ldr r0, _080BE808  @ gUnknown_0201B958
	adds r0, r4, r0
	adds r1, r6, #0
	mov r2, r9
	adds r3, r7, #0
	bl TileMap_CopyRect
	ldr r0, _080BE80C  @ gUnknown_0201B458
	adds r4, r4, r0
	adds r0, r4, #0
	adds r1, r5, #0
	mov r2, r9
	adds r3, r7, #0
	bl TileMap_CopyRect
_080BE746:
	mov r1, sl
	cmp r1, #0
	bge _080BE798
	ldr r0, [sp]
	cmp r0, #0
	ble _080BE798
	ldr r5, _080BE810  @ gBG1TilemapBuffer+0x400
	adds r0, r5, #0
	movs r1, #0xd
	movs r2, #4
	movs r3, #0
	bl TileMap_FillRect
	ldr r6, _080BE814  @ gBG0TilemapBuffer+0x400
	adds r0, r6, #0
	movs r1, #0xd
	movs r2, #4
	movs r3, #0
	bl TileMap_FillRect
	ldr r0, _080BE818  @ gUnknown_0201BBD8
	movs r4, #0x16
	subs r4, r4, r7
	lsls r4, r4, #6
	ldr r1, _080BE81C  @ 0xFFFFFC00
	adds r5, r5, r1
	adds r5, r4, r5
	adds r1, r5, #0
	movs r2, #0xd
	adds r3, r7, #0
	bl TileMap_CopyRect
	ldr r0, _080BE820  @ gUnknown_0201B758
	ldr r1, _080BE81C  @ 0xFFFFFC00
	adds r6, r6, r1
	adds r4, r4, r6
	adds r1, r4, #0
	movs r2, #0xd
	adds r3, r7, #0
	bl TileMap_CopyRect
_080BE798:
	mov r0, sl
	cmp r0, #0
	ble _080BE7EA
	ldr r1, [sp]
	cmp r1, #0
	ble _080BE7EA
	ldr r5, _080BE824  @ gBG1TilemapBuffer+0x422
	adds r0, r5, #0
	movs r1, #0xd
	movs r2, #4
	movs r3, #0
	bl TileMap_FillRect
	ldr r6, _080BE828  @ gBG0TilemapBuffer+0x422
	adds r0, r6, #0
	movs r1, #0xd
	movs r2, #4
	movs r3, #0
	bl TileMap_FillRect
	ldr r0, _080BE818  @ gUnknown_0201BBD8
	movs r4, #0x16
	subs r4, r4, r7
	lsls r4, r4, #6
	ldr r1, _080BE81C  @ 0xFFFFFC00
	adds r5, r5, r1
	adds r5, r4, r5
	adds r1, r5, #0
	movs r2, #0xd
	adds r3, r7, #0
	bl TileMap_CopyRect
	ldr r0, _080BE820  @ gUnknown_0201B758
	ldr r1, _080BE81C  @ 0xFFFFFC00
	adds r6, r6, r1
	adds r4, r4, r6
	adds r1, r4, #0
	movs r2, #0xd
	adds r3, r7, #0
	bl TileMap_CopyRect
_080BE7EA:
	movs r0, #3
	bl BG_EnableSyncByMask
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BE800: .4byte gBG1TilemapBuffer
_080BE804: .4byte gBG0TilemapBuffer
_080BE808: .4byte gUnknown_0201B958
_080BE80C: .4byte gUnknown_0201B458
_080BE810: .4byte gBG1TilemapBuffer+0x400
_080BE814: .4byte gBG0TilemapBuffer+0x400
_080BE818: .4byte gUnknown_0201BBD8
_080BE81C: .4byte 0xFFFFFC00
_080BE820: .4byte gUnknown_0201B758
_080BE824: .4byte gBG1TilemapBuffer+0x422
_080BE828: .4byte gBG0TilemapBuffer+0x422

	THUMB_FUNC_END sub_80BE65C

	THUMB_FUNC_START sub_80BE82C
sub_80BE82C: @ 0x080BE82C
	push {r4, r5, lr}
	ldr r1, _080BE8C4  @ gUnknown_08A3E448
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r4, #2
	ldrsb r4, [r0, r4]
	movs r5, #3
	ldrsb r5, [r0, r5]
	cmp r4, #0
	bge _080BE85C
	cmp r5, #0
	bge _080BE85C
	ldr r0, _080BE8C8  @ gBG1TilemapBuffer
	movs r1, #0xd
	movs r2, #9
	movs r3, #0
	bl TileMap_FillRect
	ldr r0, _080BE8CC  @ gBG0TilemapBuffer
	movs r1, #0xd
	movs r2, #9
	movs r3, #0
	bl TileMap_FillRect
_080BE85C:
	cmp r4, #0
	ble _080BE87C
	cmp r5, #0
	bge _080BE87C
	ldr r0, _080BE8D0  @ gBG1TilemapBuffer+0x022
	movs r1, #0xd
	movs r2, #9
	movs r3, #0
	bl TileMap_FillRect
	ldr r0, _080BE8D4  @ gBG0TilemapBuffer+0x022
	movs r1, #0xd
	movs r2, #9
	movs r3, #0
	bl TileMap_FillRect
_080BE87C:
	cmp r4, #0
	bge _080BE89C
	cmp r5, #0
	ble _080BE89C
	ldr r0, _080BE8D8  @ gBG1TilemapBuffer+0x400
	movs r1, #0xd
	movs r2, #4
	movs r3, #0
	bl TileMap_FillRect
	ldr r0, _080BE8DC  @ gBG0TilemapBuffer+0x400
	movs r1, #0xd
	movs r2, #4
	movs r3, #0
	bl TileMap_FillRect
_080BE89C:
	cmp r4, #0
	ble _080BE8BC
	cmp r5, #0
	ble _080BE8BC
	ldr r0, _080BE8E0  @ gBG1TilemapBuffer+0x422
	movs r1, #0xd
	movs r2, #4
	movs r3, #0
	bl TileMap_FillRect
	ldr r0, _080BE8E4  @ gBG0TilemapBuffer+0x422
	movs r1, #0xd
	movs r2, #4
	movs r3, #0
	bl TileMap_FillRect
_080BE8BC:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080BE8C4: .4byte gUnknown_08A3E448
_080BE8C8: .4byte gBG1TilemapBuffer
_080BE8CC: .4byte gBG0TilemapBuffer
_080BE8D0: .4byte gBG1TilemapBuffer+0x022
_080BE8D4: .4byte gBG0TilemapBuffer+0x022
_080BE8D8: .4byte gBG1TilemapBuffer+0x400
_080BE8DC: .4byte gBG0TilemapBuffer+0x400
_080BE8E0: .4byte gBG1TilemapBuffer+0x422
_080BE8E4: .4byte gBG0TilemapBuffer+0x422

	THUMB_FUNC_END sub_80BE82C

	THUMB_FUNC_START sub_80BE8E8
sub_80BE8E8: @ 0x080BE8E8
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r4, #0x2c
	adds r0, r4, #0
	bl ClearText
	adds r0, r5, #0
	bl GetWorldMapNodeName
	adds r5, r0, #0
	movs r0, #0x40
	adds r1, r5, #0
	bl GetStringTextCenteredPos
	adds r1, r0, #0
	adds r0, r4, #0
	movs r2, #0
	adds r3, r5, #0
	bl Text_InsertDrawString
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80BE8E8

	THUMB_FUNC_START sub_80BE918
sub_80BE918: @ 0x080BE918
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	adds r5, #0x34
	adds r0, r5, #0
	bl ClearText
	ldr r1, _080BE954  @ gCharacterData
	subs r4, #1
	movs r0, #0x34
	muls r0, r4, r0
	adds r0, r0, r1
	ldrh r0, [r0]
	bl GetStringFromIndex
	adds r4, r0, #0
	movs r0, #0x44
	adds r1, r4, #0
	bl GetStringTextCenteredPos
	adds r1, r0, #0
	adds r0, r5, #0
	movs r2, #5
	adds r3, r4, #0
	bl Text_InsertDrawString
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080BE954: .4byte gCharacterData

	THUMB_FUNC_END sub_80BE918

	THUMB_FUNC_START sub_80BE958
sub_80BE958: @ 0x080BE958
	push {lr}
	sub sp, #4
	adds r2, r0, #0
	adds r1, r2, #0
	adds r1, #0x5f
	ldrb r0, [r1]
	cmp r0, #0
	beq _080BE974
	bl GetUnitFromCharId
	bl GetUnitMiniPortraitId
	adds r3, r0, #0
	b _080BE980
_080BE974:
	adds r0, r2, #0
	adds r0, #0x60
	ldrb r0, [r0]
	cmp r0, #0
	beq _080BE980
	ldr r3, _080BE998  @ 0x00007F04
_080BE980:
	ldr r1, _080BE99C  @ gUnknown_0201B7DA
	movs r2, #0x88
	lsls r2, r2, #2
	movs r0, #0
	str r0, [sp]
	adds r0, r3, #0
	movs r3, #4
	bl PutFaceChibi
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_080BE998: .4byte 0x00007F04
_080BE99C: .4byte gUnknown_0201B7DA

	THUMB_FUNC_END sub_80BE958

	THUMB_FUNC_START sub_80BE9A0
sub_80BE9A0: @ 0x080BE9A0
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r4, #0x34
	adds r0, r4, #0
	bl ClearText
	adds r0, r5, #0
	bl GetClassData
	ldrh r0, [r0]
	bl GetStringFromIndex
	adds r5, r0, #0
	movs r0, #0x44
	adds r1, r5, #0
	bl GetStringTextCenteredPos
	adds r1, r0, #0
	adds r0, r4, #0
	movs r2, #5
	adds r3, r5, #0
	bl Text_InsertDrawString
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80BE9A0

	THUMB_FUNC_START sub_80BE9D8
sub_80BE9D8: @ 0x080BE9D8
	push {r4, r5, lr}
	adds r2, r1, #0
	ldr r1, _080BEA0C  @ gGMData
	lsls r0, r2, #2
	adds r0, r0, r1
	adds r0, #0x30
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _080BEA56
	lsls r1, r2, #5
	ldr r2, _080BEA10  @ gWMNodeData
	adds r0, r1, r2
	ldr r0, [r0, #0xc]
	ldrh r3, [r0]
	adds r4, r1, #0
	adds r5, r2, #0
	cmp r3, #0
	beq _080BEA20
	ldr r2, _080BEA14  @ gUnknown_0201B430
	ldr r0, _080BEA18  @ 0x000002BA
	adds r1, r2, r0
	ldr r0, _080BEA1C  @ 0x00003231
	strh r0, [r1]
	b _080BEA2A
	.align 2, 0
_080BEA0C: .4byte gGMData
_080BEA10: .4byte gWMNodeData
_080BEA14: .4byte gUnknown_0201B430
_080BEA18: .4byte 0x000002BA
_080BEA1C: .4byte 0x00003231
_080BEA20:
	ldr r1, _080BEA40  @ gUnknown_0201B430
	ldr r2, _080BEA44  @ 0x000002BA
	adds r0, r1, r2
	strh r3, [r0]
	adds r2, r1, #0
_080BEA2A:
	adds r0, r4, r5
	ldr r0, [r0, #0x10]
	ldrh r1, [r0]
	cmp r1, #0
	beq _080BEA4C
	movs r3, #0xaf
	lsls r3, r3, #2
	adds r1, r2, r3
	ldr r0, _080BEA48  @ 0x00003232
	strh r0, [r1]
	b _080BEA68
	.align 2, 0
_080BEA40: .4byte gUnknown_0201B430
_080BEA44: .4byte 0x000002BA
_080BEA48: .4byte 0x00003232
_080BEA4C:
	movs r3, #0xaf
	lsls r3, r3, #2
	adds r0, r2, r3
	strh r1, [r0]
	b _080BEA68
_080BEA56:
	ldr r0, _080BEA70  @ gUnknown_0201B430
	ldr r2, _080BEA74  @ 0x000002BA
	adds r1, r0, r2
	movs r2, #0
	strh r2, [r1]
	movs r3, #0xaf
	lsls r3, r3, #2
	adds r0, r0, r3
	strh r2, [r0]
_080BEA68:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080BEA70: .4byte gUnknown_0201B430
_080BEA74: .4byte 0x000002BA

	THUMB_FUNC_END sub_80BE9D8

	THUMB_FUNC_START sub_80BEA78
sub_80BEA78: @ 0x080BEA78
	push {r4, r5, lr}
	adds r2, r0, #0
	adds r1, r2, #0
	adds r1, #0x5f
	ldrb r0, [r1]
	cmp r0, #0
	beq _080BEA90
	bl GetUnitFromCharId
	movs r5, #8
	ldrsb r5, [r0, r5]
	b _080BEA9C
_080BEA90:
	adds r0, r2, #0
	adds r0, #0x60
	ldrb r0, [r0]
	cmp r0, #0
	beq _080BEA9C
	movs r5, #0
_080BEA9C:
	ldr r4, _080BEAD8  @ gUnknown_0201B864
	ldr r1, _080BEADC  @ 0x00005233
	adds r0, r1, #0
	strh r0, [r4]
	adds r1, r4, #0
	adds r1, #0x40
	ldr r2, _080BEAE0  @ 0x00005253
	adds r0, r2, #0
	strh r0, [r1]
	ldr r3, _080BEAE4  @ 0x00005234
	adds r0, r3, #0
	strh r0, [r4, #2]
	adds r1, #2
	adds r2, #1
	adds r0, r2, #0
	strh r0, [r1]
	cmp r5, #0
	bne _080BEAE8
	adds r3, #0xb
	adds r2, r3, #0
	strh r2, [r4, #4]
	adds r0, r4, #0
	adds r0, #0x44
	adds r3, #0x20
	adds r1, r3, #0
	strh r1, [r0]
	strh r2, [r4, #6]
	adds r0, #2
	strh r1, [r0]
	b _080BEB1C
	.align 2, 0
_080BEAD8: .4byte gUnknown_0201B864
_080BEADC: .4byte 0x00005233
_080BEAE0: .4byte 0x00005253
_080BEAE4: .4byte 0x00005234
_080BEAE8:
	cmp r5, #9
	ble _080BEB04
	adds r0, r5, #0
	movs r1, #0xa
	bl __divsi3
	ldr r2, _080BEB24  @ 0x00005235
	adds r1, r0, r2
	strh r1, [r4, #4]
	adds r1, r4, #0
	adds r1, #0x44
	ldr r3, _080BEB28  @ 0x00005255
	adds r0, r0, r3
	strh r0, [r1]
_080BEB04:
	adds r0, r5, #0
	movs r1, #0xa
	bl __modsi3
	ldr r2, _080BEB24  @ 0x00005235
	adds r1, r0, r2
	strh r1, [r4, #6]
	adds r1, r4, #0
	adds r1, #0x46
	ldr r3, _080BEB28  @ 0x00005255
	adds r0, r0, r3
	strh r0, [r1]
_080BEB1C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080BEB24: .4byte 0x00005235
_080BEB28: .4byte 0x00005255

	THUMB_FUNC_END sub_80BEA78

	THUMB_FUNC_START sub_80BEB2C
sub_80BEB2C: @ 0x080BEB2C
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r0, #0x5e
	ldrb r0, [r0]
	cmp r0, #0
	beq _080BEB3E
	cmp r0, #1
	beq _080BEB74
	b _080BEBB4
_080BEB3E:
	ldr r4, _080BEB68  @ gUnknown_0201BBD8
	adds r0, r4, #0
	movs r1, #0xd
	movs r2, #4
	movs r3, #0
	bl TileMap_FillRect
	ldr r0, _080BEB6C  @ gUnknown_0201B718
	movs r1, #0xd
	movs r2, #2
	movs r3, #0
	bl TileMap_FillRect
	ldr r1, _080BEB70  @ gUnknown_08A98EAC
	movs r2, #0x80
	lsls r2, r2, #8
	adds r0, r4, #0
	bl CallARM_FillTileRect
	b _080BEBB4
	.align 2, 0
_080BEB68: .4byte gUnknown_0201BBD8
_080BEB6C: .4byte gUnknown_0201B718
_080BEB70: .4byte gUnknown_08A98EAC
_080BEB74:
	ldr r5, _080BEBC4  @ gUnknown_0201BBD8
	adds r0, r5, #0
	movs r1, #0xd
	movs r2, #9
	movs r3, #0
	bl TileMap_FillRect
	ldr r4, _080BEBC8  @ gUnknown_0201B718
	adds r0, r4, #0
	movs r1, #0xd
	movs r2, #7
	movs r3, #0
	bl TileMap_FillRect
	ldr r1, _080BEBCC  @ gUnknown_08A98F30
	movs r2, #0x80
	lsls r2, r2, #8
	adds r0, r5, #0
	bl CallARM_FillTileRect
	adds r0, r6, #0
	adds r0, #0x34
	adds r4, #0xc8
	adds r1, r4, #0
	bl PutText
	adds r0, r6, #0
	bl sub_80BEA78
	adds r0, r6, #0
	bl sub_80BE958
_080BEBB4:
	adds r0, r6, #0
	adds r0, #0x2c
	ldr r1, _080BEBD0  @ gUnknown_0201B71C
	bl PutText
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080BEBC4: .4byte gUnknown_0201BBD8
_080BEBC8: .4byte gUnknown_0201B718
_080BEBCC: .4byte gUnknown_08A98F30
_080BEBD0: .4byte gUnknown_0201B71C

	THUMB_FUNC_END sub_80BEB2C

	THUMB_FUNC_START sub_80BEBD4
sub_80BEBD4: @ 0x080BEBD4
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0
	str r0, [r4, #0x58]
	adds r1, r4, #0
	adds r1, #0x55
	movs r0, #1
	strb r0, [r1]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl sub_80C089C
	adds r1, r4, #0
	adds r1, #0x50
	strb r0, [r1]
	ldr r0, _080BEC50  @ gUnknown_08A3E448
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	lsls r1, r1, #2
	adds r1, r1, r0
	movs r0, #2
	ldrsb r0, [r1, r0]
	ldrb r1, [r1, #3]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl sub_80BE594
	adds r1, r4, #0
	adds r1, #0x57
	strb r0, [r1]
	adds r0, r4, #0
	bl sub_80BEB2C
	adds r3, r4, #0
	adds r3, #0x4e
	ldr r1, _080BEC54  @ gGMData
	ldr r0, [r1, #8]
	asrs r0, r0, #8
	strb r0, [r3]
	adds r2, r4, #0
	adds r2, #0x4f
	ldr r0, [r1, #0xc]
	asrs r0, r0, #8
	strb r0, [r2]
	ldrb r1, [r3]
	adds r0, r4, #0
	adds r0, #0x4c
	strb r1, [r0]
	ldrb r0, [r2]
	adds r1, r4, #0
	adds r1, #0x4d
	strb r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BEC50: .4byte gUnknown_08A3E448
_080BEC54: .4byte gGMData

	THUMB_FUNC_END sub_80BEBD4

	THUMB_FUNC_START sub_80BEC58
sub_80BEC58: @ 0x080BEC58
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r0, #0x5e
	ldrb r0, [r0]
	cmp r0, #0
	beq _080BEC6A
	cmp r0, #1
	beq _080BEC74
	b _080BEC80
_080BEC6A:
	ldr r1, _080BEC70  @ gUnknown_08A3E458
	b _080BEC76
	.align 2, 0
_080BEC70: .4byte gUnknown_08A3E458
_080BEC74:
	ldr r1, _080BECB4  @ gUnknown_08A3E45E
_080BEC76:
	ldr r0, [r4, #0x58]
	adds r0, r0, r1
	movs r1, #0
	ldrsb r1, [r0, r1]
	movs r5, #3
_080BEC80:
	adds r0, r4, #0
	adds r0, #0x50
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r2, r4, #0
	adds r2, #0x5e
	ldrb r2, [r2]
	bl sub_80BE65C
	ldr r0, [r4, #0x58]
	adds r0, #1
	str r0, [r4, #0x58]
	cmp r0, r5
	bne _080BECAE
	movs r0, #0
	str r0, [r4, #0x58]
	adds r1, r4, #0
	adds r1, #0x55
	strb r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
_080BECAE:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080BECB4: .4byte gUnknown_08A3E45E

	THUMB_FUNC_END sub_80BEC58

	THUMB_FUNC_START sub_80BECB8
sub_80BECB8: @ 0x080BECB8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r4, r0, #0
	adds r3, r4, #0
	adds r3, #0x4e
	ldrb r0, [r3]
	adds r2, r4, #0
	adds r2, #0x4c
	strb r0, [r2]
	movs r0, #0x4f
	adds r0, r0, r4
	mov ip, r0
	ldrb r0, [r0]
	adds r1, r4, #0
	adds r1, #0x4d
	strb r0, [r1]
	ldr r1, _080BED18  @ gGMData
	ldr r0, [r1, #8]
	asrs r5, r0, #8
	strb r5, [r3]
	ldr r0, [r1, #0xc]
	asrs r1, r0, #8
	mov r0, ip
	strb r1, [r0]
	ldrh r0, [r3]
	ldrh r2, [r2]
	cmp r0, r2
	beq _080BEDB6
	adds r7, r1, #0
	ldr r0, [r4, #0x14]
	ldr r0, [r0, #0x48]
	movs r1, #0
	str r1, [sp]
	adds r1, r5, #0
	adds r2, r7, #0
	movs r3, #0
	bl sub_80BB628
	adds r5, r0, #0
	cmp r5, #0
	bge _080BED1C
	adds r0, r4, #0
	bl Proc_Break
	b _080BEDB6
	.align 2, 0
_080BED18: .4byte gGMData
_080BED1C:
	adds r0, r4, #0
	adds r0, #0x5c
	ldrh r1, [r0]
	mov r8, r0
	adds r6, r4, #0
	adds r6, #0x50
	cmp r1, r5
	beq _080BED7A
	movs r0, #0
	ldrsb r0, [r6, r0]
	bl sub_80BE82C
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_80BEF20
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl sub_80C089C
	strb r0, [r6]
	adds r0, r4, #0
	adds r0, #0x5e
	ldrb r1, [r0]
	adds r2, r0, #0
	cmp r1, #0
	beq _080BED5C
	cmp r1, #1
	beq _080BED64
	b _080BED6A
_080BED5C:
	ldr r0, _080BED60  @ gUnknown_08A3E458
	b _080BED66
	.align 2, 0
_080BED60: .4byte gUnknown_08A3E458
_080BED64:
	ldr r0, _080BEDC4  @ gUnknown_08A3E45E
_080BED66:
	movs r7, #2
	ldrsb r7, [r0, r7]
_080BED6A:
	movs r0, #0
	ldrsb r0, [r6, r0]
	ldrb r2, [r2]
	adds r1, r7, #0
	bl sub_80BE65C
	mov r1, r8
	strh r5, [r1]
_080BED7A:
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl sub_80C089C
	movs r2, #0
	ldrsb r2, [r6, r2]
	cmp r0, r2
	beq _080BEDB6
	ldr r1, _080BEDC8  @ gUnknown_08A3E448
	lsls r0, r0, #2
	adds r3, r0, r1
	lsls r0, r2, #2
	adds r2, r0, r1
	movs r1, #2
	ldrsb r1, [r3, r1]
	movs r0, #2
	ldrsb r0, [r2, r0]
	cmp r1, r0
	bne _080BEDB0
	movs r1, #3
	ldrsb r1, [r3, r1]
	movs r0, #3
	ldrsb r0, [r2, r0]
	cmp r1, r0
	beq _080BEDB6
_080BEDB0:
	adds r0, r4, #0
	bl Proc_Break
_080BEDB6:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BEDC4: .4byte gUnknown_08A3E45E
_080BEDC8: .4byte gUnknown_08A3E448

	THUMB_FUNC_END sub_80BECB8

	THUMB_FUNC_START sub_80BEDCC
sub_80BEDCC: @ 0x080BEDCC
	adds r0, #0x56
	movs r1, #1
	strb r1, [r0]
	bx lr

	THUMB_FUNC_END sub_80BEDCC

	THUMB_FUNC_START sub_80BEDD4
sub_80BEDD4: @ 0x080BEDD4
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r2, r4, #0
	adds r2, #0x55
	movs r0, #1
	strb r0, [r2]
	adds r0, r4, #0
	adds r0, #0x5e
	ldrb r0, [r0]
	cmp r0, #0
	beq _080BEDF0
	cmp r0, #1
	beq _080BEDF8
	b _080BEE04
_080BEDF0:
	ldr r1, _080BEDF4  @ gUnknown_08A3E45B
	b _080BEDFA
	.align 2, 0
_080BEDF4: .4byte gUnknown_08A3E45B
_080BEDF8:
	ldr r1, _080BEE44  @ gUnknown_08A3E461
_080BEDFA:
	ldr r0, [r4, #0x58]
	adds r0, r0, r1
	movs r1, #0
	ldrsb r1, [r0, r1]
	movs r5, #3
_080BEE04:
	adds r0, r4, #0
	adds r0, #0x50
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r2, r4, #0
	adds r2, #0x5e
	ldrb r2, [r2]
	bl sub_80BE65C
	ldr r0, [r4, #0x58]
	adds r0, #1
	str r0, [r4, #0x58]
	cmp r0, r5
	bne _080BEE3C
	movs r0, #0
	str r0, [r4, #0x58]
	adds r1, r4, #0
	adds r1, #0x55
	strb r0, [r1]
	adds r1, #1
	strb r0, [r1]
	adds r1, #1
	movs r0, #0xff
	strb r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
_080BEE3C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080BEE44: .4byte gUnknown_08A3E461

	THUMB_FUNC_END sub_80BEDD4

	THUMB_FUNC_START sub_80BEE48
sub_80BEE48: @ 0x080BEE48
	push {r4, r5, lr}
	adds r2, r0, #0
	adds r4, r1, #0
	movs r5, #0
	ldr r1, _080BEE78  @ gGMData
_080BEE52:
	movs r3, #0x12
	ldrsh r0, [r1, r3]
	cmp r0, #0
	beq _080BEE88
	ldrb r0, [r1, #0x11]
	cmp r0, r2
	bne _080BEE88
	adds r0, r5, #0
	bl sub_80BD20C
	cmp r0, #1
	beq _080BEE7C
	cmp r0, #1
	ble _080BEE72
	cmp r0, #2
	beq _080BEE80
_080BEE72:
	movs r0, #0
	b _080BEE82
	.align 2, 0
_080BEE78: .4byte gGMData
_080BEE7C:
	movs r0, #0x80
	b _080BEE82
_080BEE80:
	movs r0, #0x40
_080BEE82:
	str r0, [r4]
	adds r0, r5, #0
	b _080BEE96
_080BEE88:
	adds r1, #4
	adds r5, #1
	cmp r5, #6
	ble _080BEE52
	movs r0, #1
	negs r0, r0
	str r0, [r4]
_080BEE96:
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80BEE48

	THUMB_FUNC_START sub_80BEE9C
sub_80BEE9C: @ 0x080BEE9C
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r0, r1, #0
	mov r1, sp
	bl sub_80BEE48
	cmp r0, #0
	blt _080BEF00
	ldr r1, _080BEEDC  @ gGMData
	lsls r0, r0, #2
	adds r2, r0, r1
	ldrb r1, [r2, #0x10]
	movs r5, #2
	adds r0, r5, #0
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #0
	beq _080BEEEA
	adds r1, r4, #0
	adds r1, #0x5f
	movs r0, #0
	strb r0, [r1]
	ldrb r1, [r2, #0x10]
	adds r0, r5, #0
	ands r0, r1
	cmp r0, #0
	beq _080BEEE0
	ldrb r1, [r2, #0x12]
	b _080BEEE2
	.align 2, 0
_080BEEDC: .4byte gGMData
_080BEEE0:
	movs r1, #0
_080BEEE2:
	adds r0, r4, #0
	adds r0, #0x60
	strb r1, [r0]
	b _080BEEF8
_080BEEEA:
	ldrh r0, [r2, #0x12]
	adds r1, r4, #0
	adds r1, #0x5f
	strb r0, [r1]
	adds r0, r4, #0
	adds r0, #0x60
	strb r3, [r0]
_080BEEF8:
	adds r1, r4, #0
	adds r1, #0x5e
	movs r0, #1
	b _080BEF0E
_080BEF00:
	adds r1, r4, #0
	adds r1, #0x5f
	movs r0, #0
	strb r0, [r1]
	adds r1, #1
	strb r0, [r1]
	subs r1, #2
_080BEF0E:
	strb r0, [r1]
	ldr r0, [sp]
	movs r1, #8
	bl sub_80BE5B4
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80BEE9C

	THUMB_FUNC_START sub_80BEF20
sub_80BEF20: @ 0x080BEF20
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	bl sub_80BEE9C
	adds r0, r4, #0
	bl sub_80BEB2C
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_80BE8E8
	adds r1, r4, #0
	adds r1, #0x5f
	ldrb r0, [r1]
	cmp r0, #0
	beq _080BEF4C
	adds r1, r0, #0
	adds r0, r4, #0
	bl sub_80BE918
	b _080BEF5E
_080BEF4C:
	adds r1, r4, #0
	adds r1, #0x60
	ldrb r0, [r1]
	cmp r0, #0
	beq _080BEF5E
	adds r1, r0, #0
	adds r0, r4, #0
	bl sub_80BE9A0
_080BEF5E:
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_80BE9D8
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80BEF20

	THUMB_FUNC_START sub_80BEF6C
sub_80BEF6C: @ 0x080BEF6C
	push {r4, lr}
	sub sp, #8
	adds r4, r0, #0
	add r2, sp, #4
	ldr r1, _080BEFB4  @ gGMData
	ldr r0, [r1, #8]
	asrs r0, r0, #8
	strh r0, [r2]
	adds r2, #2
	ldr r0, [r1, #0xc]
	asrs r0, r0, #8
	strh r0, [r2]
	ldr r0, [r4, #0x14]
	ldr r0, [r0, #0x48]
	add r1, sp, #4
	movs r3, #0
	ldrsh r1, [r1, r3]
	movs r3, #0
	ldrsh r2, [r2, r3]
	movs r3, #0
	str r3, [sp]
	bl sub_80BB628
	adds r1, r0, #0
	cmp r1, #0
	blt _080BEFAC
	adds r0, r4, #0
	bl sub_80BEF20
	adds r0, r4, #0
	bl Proc_Break
_080BEFAC:
	add sp, #8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BEFB4: .4byte gGMData

	THUMB_FUNC_END sub_80BEF6C

	THUMB_FUNC_START sub_80BEFB8
sub_80BEFB8: @ 0x080BEFB8
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r7, r0, #0
	movs r0, #0
	str r0, [r7, #0x58]
	adds r0, r7, #0
	adds r0, #0x56
	movs r1, #0
	strb r1, [r0]
	subs r0, #6
	strb r1, [r0]
	adds r1, r7, #0
	adds r1, #0x57
	movs r0, #0xff
	strb r0, [r1]
	adds r6, r7, #0
	adds r6, #0x5c
	ldr r0, _080BF040  @ 0x0000FFFF
	strh r0, [r6]
	adds r5, r7, #0
	adds r5, #0x2c
	adds r0, r5, #0
	movs r1, #8
	bl InitText
	adds r4, r7, #0
	adds r4, #0x34
	adds r0, r4, #0
	movs r1, #8
	bl InitText
	adds r0, r5, #0
	bl ClearText
	adds r0, r4, #0
	bl ClearText
	add r2, sp, #4
	ldr r1, _080BF044  @ gGMData
	ldr r0, [r1, #8]
	asrs r0, r0, #8
	strh r0, [r2]
	adds r2, #2
	ldr r0, [r1, #0xc]
	asrs r0, r0, #8
	strh r0, [r2]
	ldr r0, [r7, #0x14]
	ldr r0, [r0, #0x48]
	add r1, sp, #4
	movs r3, #0
	ldrsh r1, [r1, r3]
	movs r3, #0
	ldrsh r2, [r2, r3]
	movs r3, #0
	str r3, [sp]
	bl sub_80BB628
	adds r1, r0, #0
	cmp r1, #0
	blt _080BF038
	strh r1, [r6]
	adds r0, r7, #0
	bl sub_80BEF20
_080BF038:
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BF040: .4byte 0x0000FFFF
_080BF044: .4byte gGMData

	THUMB_FUNC_END sub_80BEFB8

	THUMB_FUNC_START sub_80BF048
sub_80BF048: @ 0x080BF048
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r2, _080BF118  @ gLCDControlBuffer
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
	adds r2, #0x36
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
	movs r1, #0x20
	orrs r0, r1
	strb r0, [r2]
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
	movs r0, #1
	movs r1, #0xe
	movs r2, #3
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	movs r0, #0
	str r0, [sp]
	movs r1, #1
	movs r2, #0
	movs r3, #0
	bl SetBlendTargetA
	movs r0, #1
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #1
	movs r3, #1
	bl SetBlendTargetB
	movs r0, #0
	bl SetBlendBackdropA
	ldr r0, _080BF11C  @ gUnknown_08A9901C
	ldr r4, _080BF120  @ gGenericBuffer
	adds r1, r4, #0
	bl Decompress
	ldr r1, _080BF124  @ 0x06004660
	adds r0, r4, #0
	movs r2, #0xd
	movs r3, #2
	bl Copy2dChr
	ldr r0, _080BF128  @ gUnknown_08A99120
	movs r1, #0xa0
	movs r2, #0x20
	bl CopyToPaletteBuffer
	ldr r0, _080BF12C  @ gUnknown_08A97A80
	ldr r1, _080BF130  @ 0x06004620
	bl Decompress
	ldr r0, _080BF134  @ gUnknown_08A97A60
	movs r1, #0x60
	movs r2, #0x20
	bl CopyToPaletteBuffer
	bl ResetTextFont
	ldr r0, _080BF138  @ gUnknown_08A3E464
	ldr r1, [r5, #0x14]
	bl Proc_Start
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080BF118: .4byte gLCDControlBuffer
_080BF11C: .4byte gUnknown_08A9901C
_080BF120: .4byte gGenericBuffer
_080BF124: .4byte 0x06004660
_080BF128: .4byte gUnknown_08A99120
_080BF12C: .4byte gUnknown_08A97A80
_080BF130: .4byte 0x06004620
_080BF134: .4byte gUnknown_08A97A60
_080BF138: .4byte gUnknown_08A3E464

	THUMB_FUNC_END sub_80BF048

.align 2, 0
