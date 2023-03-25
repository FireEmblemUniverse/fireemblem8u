
	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	THUMB_FUNC_START sub_809BE80
sub_809BE80: @ 0x0809BE80
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	ldr r5, _0809BEAC  @ gKeyStatusPtr
	ldr r0, [r5]
	ldrh r1, [r0, #6]
	movs r7, #0x40
	adds r0, r7, #0
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	cmp r6, #0
	beq _0809BEC2
	ldr r0, [r4, #0x2c]
	bl GetUnitItemCount
	adds r2, r0, #0
	ldr r0, [r4, #0x30]
	cmp r0, #0
	ble _0809BEB0
	subs r0, #1
	str r0, [r4, #0x30]
	b _0809BEEE
	.align 2, 0
_0809BEAC: .4byte gKeyStatusPtr
_0809BEB0:
	ldr r0, [r5]
	ldrh r1, [r0, #8]
	adds r0, r7, #0
	ands r0, r1
	cmp r0, #0
	beq _0809BF08
	subs r0, r2, #1
	str r0, [r4, #0x30]
	b _0809BEEE
_0809BEC2:
	movs r7, #0x80
	adds r0, r7, #0
	ands r0, r1
	cmp r0, #0
	beq _0809BF08
	ldr r0, [r4, #0x2c]
	bl GetUnitItemCount
	subs r0, #1
	ldr r1, [r4, #0x30]
	cmp r1, r0
	bge _0809BEE0
	adds r0, r1, #1
	str r0, [r4, #0x30]
	b _0809BEEE
_0809BEE0:
	ldr r0, [r5]
	ldrh r1, [r0, #8]
	adds r0, r7, #0
	ands r0, r1
	cmp r0, #0
	beq _0809BF08
	str r6, [r4, #0x30]
_0809BEEE:
	ldr r0, _0809BF04  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809BF00
	movs r0, #0x66
	bl m4aSongNumStart
_0809BF00:
	movs r0, #1
	b _0809BF0A
	.align 2, 0
_0809BF04: .4byte gPlaySt
_0809BF08:
	movs r0, #0
_0809BF0A:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_809BE80

	THUMB_FUNC_START DrawPrepScreenItemUseStatLabels
DrawPrepScreenItemUseStatLabels: @ 0x0809BF10
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	mov r8, r0
	ldr r6, _0809BF78  @ gUnknown_02013498
	adds r5, r6, #0
	movs r4, #7
_0809BF20:
	adds r0, r5, #0
	bl Text_Clear
	adds r5, #8
	subs r4, #1
	cmp r4, #0
	bge _0809BF20
	ldr r0, _0809BF7C  @ 0x000004E9
	bl GetStringFromIndex
	adds r1, r6, #0
	adds r6, #8
	ldr r5, _0809BF80  @ gUnknown_02023D88
	movs r7, #0
	str r7, [sp]
	str r0, [sp, #4]
	adds r0, r1, #0
	adds r1, r5, #0
	movs r2, #3
	movs r3, #0
	bl DrawTextInline
	mov r0, r8
	bl UnitHasMagicRank
	lsls r0, r0, #0x18
	asrs r4, r0, #0x18
	cmp r4, #0
	beq _0809BF88
	ldr r0, _0809BF84  @ 0x000004FF
	bl GetStringFromIndex
	adds r2, r6, #0
	adds r6, #8
	adds r1, r5, #0
	adds r1, #0x80
	str r7, [sp]
	str r0, [sp, #4]
	adds r0, r2, #0
	movs r2, #3
	movs r3, #0
	bl DrawTextInline
	b _0809BFA4
	.align 2, 0
_0809BF78: .4byte gUnknown_02013498
_0809BF7C: .4byte 0x000004E9
_0809BF80: .4byte gUnknown_02023D88
_0809BF84: .4byte 0x000004FF
_0809BF88:
	ldr r0, _0809C090  @ 0x000004FE
	bl GetStringFromIndex
	adds r2, r6, #0
	adds r6, #8
	adds r1, r5, #0
	adds r1, #0x80
	str r4, [sp]
	str r0, [sp, #4]
	adds r0, r2, #0
	movs r2, #3
	movs r3, #0
	bl DrawTextInline
_0809BFA4:
	ldr r0, _0809C094  @ 0x000004EC
	bl GetStringFromIndex
	adds r1, r6, #0
	adds r6, #8
	ldr r7, _0809C098  @ gUnknown_02023E88
	movs r5, #0
	str r5, [sp]
	str r0, [sp, #4]
	adds r0, r1, #0
	adds r1, r7, #0
	movs r2, #3
	movs r3, #0
	bl DrawTextInline
	ldr r0, _0809C09C  @ 0x000004ED
	bl GetStringFromIndex
	adds r2, r6, #0
	adds r6, #8
	adds r1, r7, #0
	adds r1, #0x80
	str r5, [sp]
	str r0, [sp, #4]
	adds r0, r2, #0
	movs r2, #3
	movs r3, #0
	bl DrawTextInline
	ldr r0, _0809C0A0  @ 0x000004EE
	bl GetStringFromIndex
	adds r2, r6, #0
	adds r6, #8
	adds r1, r7, #0
	subs r1, #0xf2
	str r5, [sp]
	str r0, [sp, #4]
	adds r0, r2, #0
	movs r2, #3
	movs r3, #0
	bl DrawTextInline
	ldr r0, _0809C0A4  @ 0x000004EF
	bl GetStringFromIndex
	adds r2, r6, #0
	adds r6, #8
	adds r1, r7, #0
	subs r1, #0x72
	str r5, [sp]
	str r0, [sp, #4]
	adds r0, r2, #0
	movs r2, #3
	movs r3, #0
	bl DrawTextInline
	movs r0, #0x9e
	lsls r0, r0, #3
	bl GetStringFromIndex
	adds r2, r6, #0
	adds r6, #8
	adds r1, r7, #0
	adds r1, #0xe
	str r5, [sp]
	str r0, [sp, #4]
	adds r0, r2, #0
	movs r2, #3
	movs r3, #0
	bl DrawTextInline
	ldr r0, _0809C0A8  @ 0x000004F7
	bl GetStringFromIndex
	adds r2, r6, #0
	adds r6, #8
	adds r1, r7, #0
	adds r1, #0x8e
	str r5, [sp]
	str r0, [sp, #4]
	adds r0, r2, #0
	movs r2, #3
	movs r3, #0
	bl DrawTextInline
	mov r1, r8
	ldr r0, [r1, #4]
	ldrh r0, [r0]
	bl GetStringFromIndex
	adds r4, r0, #0
	movs r0, #0x40
	adds r1, r4, #0
	bl GetStringTextCenteredPos
	adds r3, r0, #0
	adds r0, r6, #0
	ldr r2, _0809C0AC  @ 0xFFFFFE8A
	adds r1, r7, r2
	str r5, [sp]
	str r4, [sp, #4]
	movs r2, #0
	bl DrawTextInline
	ldr r1, _0809C0B0  @ 0xFFFFFE82
	adds r0, r7, r1
	movs r1, #3
	movs r2, #0x24
	movs r3, #0x25
	bl sub_8004D5C
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809C090: .4byte 0x000004FE
_0809C094: .4byte 0x000004EC
_0809C098: .4byte gUnknown_02023E88
_0809C09C: .4byte 0x000004ED
_0809C0A0: .4byte 0x000004EE
_0809C0A4: .4byte 0x000004EF
_0809C0A8: .4byte 0x000004F7
_0809C0AC: .4byte 0xFFFFFE8A
_0809C0B0: .4byte 0xFFFFFE82

	THUMB_FUNC_END DrawPrepScreenItemUseStatLabels

	THUMB_FUNC_START DrawPrepScreenItemUseStatBars
DrawPrepScreenItemUseStatBars: @ 0x0809C0B4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x2c
	adds r5, r0, #0
	mov r8, r1
	movs r0, #2
	bl UnpackUiBarPalette
	add r4, sp, #0xc
	adds r0, r5, #0
	bl GetUnitCurrentHp
	adds r2, r0, #0
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r3, r0, #3
	movs r0, #0xb
	ldrsb r0, [r5, r0]
	movs r1, #0xc0
	ands r0, r1
	cmp r0, #0x80
	beq _0809C0E8
	adds r0, r3, #0
	movs r1, #0x3c
	b _0809C0EC
_0809C0E8:
	adds r0, r2, #0
	movs r1, #5
_0809C0EC:
	bl __divsi3
	str r0, [r4]
	adds r0, r5, #0
	bl GetUnitPower
	adds r1, r0, #0
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	ldr r1, [r5, #4]
	ldrb r1, [r1, #0x14]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl __divsi3
	str r0, [sp, #0x10]
	adds r0, r5, #0
	bl GetUnitSkill
	adds r1, r0, #0
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	ldr r1, [r5, #4]
	ldrb r1, [r1, #0x15]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl __divsi3
	str r0, [sp, #0x14]
	adds r0, r5, #0
	bl GetUnitSpeed
	adds r1, r0, #0
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	ldr r1, [r5, #4]
	ldrb r1, [r1, #0x16]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl __divsi3
	str r0, [sp, #0x18]
	adds r0, r5, #0
	bl GetUnitLuck
	adds r1, r0, #0
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	movs r1, #0x1e
	bl __divsi3
	str r0, [sp, #0x1c]
	adds r0, r5, #0
	bl GetUnitDefense
	adds r1, r0, #0
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	ldr r1, [r5, #4]
	ldrb r1, [r1, #0x17]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl __divsi3
	str r0, [sp, #0x20]
	adds r0, r5, #0
	bl GetUnitResistance
	adds r1, r0, #0
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	ldr r4, [r5, #4]
	movs r1, #0x18
	ldrsb r1, [r4, r1]
	bl __divsi3
	str r0, [sp, #0x24]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	ldr r0, [r5]
	ldrb r0, [r0, #0x13]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r1, r1, r0
	movs r0, #0x1a
	ldrsb r0, [r5, r0]
	adds r1, r1, r0
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	movs r1, #0x19
	ldrsb r1, [r4, r1]
	bl __divsi3
	str r0, [sp, #0x28]
	movs r5, #0
	add r6, sp, #0xc
	movs r7, #0xe0
	lsls r7, r7, #7
_0809C1BE:
	mov r4, r8
	asrs r4, r5
	movs r0, #1
	ands r4, r0
	cmp r4, #0
	beq _0809C200
	lsls r0, r7, #0xf
	lsrs r0, r0, #0x14
	movs r2, #3
	ands r2, r5
	lsls r2, r2, #6
	adds r2, #0x92
	asrs r3, r5, #2
	lsls r1, r3, #3
	subs r1, r1, r3
	adds r2, r2, r1
	lsls r2, r2, #1
	ldr r1, _0809C1FC  @ gBG0TilemapBuffer
	adds r2, r2, r1
	movs r1, #0x18
	str r1, [sp]
	ldr r1, [r6]
	str r1, [sp, #4]
	movs r1, #0
	str r1, [sp, #8]
	movs r1, #4
	movs r3, #0xc0
	lsls r3, r3, #6
	bl DrawStatBarGfx
	b _0809C22E
	.align 2, 0
_0809C1FC: .4byte gBG0TilemapBuffer
_0809C200:
	lsls r0, r7, #0xf
	lsrs r0, r0, #0x14
	movs r2, #3
	ands r2, r5
	lsls r2, r2, #6
	adds r2, #0x92
	asrs r3, r5, #2
	lsls r1, r3, #3
	subs r1, r1, r3
	adds r2, r2, r1
	lsls r2, r2, #1
	ldr r1, _0809C250  @ gBG0TilemapBuffer
	adds r2, r2, r1
	movs r1, #0x18
	str r1, [sp]
	ldr r1, [r6]
	str r1, [sp, #4]
	str r4, [sp, #8]
	movs r1, #4
	movs r3, #0x80
	lsls r3, r3, #6
	bl DrawStatBarGfx
_0809C22E:
	adds r6, #4
	movs r0, #0x80
	lsls r0, r0, #1
	adds r7, r7, r0
	adds r5, #1
	cmp r5, #7
	ble _0809C1BE
	movs r0, #1
	bl BG_EnableSyncByMask
	add sp, #0x2c
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809C250: .4byte gBG0TilemapBuffer

	THUMB_FUNC_END DrawPrepScreenItemUseStatBars

	THUMB_FUNC_START DrawPrepScreenItemUseStatValues
DrawPrepScreenItemUseStatValues: @ 0x0809C254
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	ldr r6, _0809C274  @ gUnknown_02023D90
	bl GetUnitCurrentHp
	adds r2, r0, #0
	movs r0, #0xb
	ldrsb r0, [r4, r0]
	movs r1, #0xc0
	ands r0, r1
	cmp r0, #0x80
	bne _0809C278
	cmp r2, #0x78
	beq _0809C27C
	b _0809C280
	.align 2, 0
_0809C274: .4byte gUnknown_02023D90
_0809C278:
	cmp r2, #0x3c
	bne _0809C280
_0809C27C:
	movs r5, #4
	b _0809C282
_0809C280:
	movs r5, #2
_0809C282:
	adds r0, r4, #0
	bl GetUnitCurrentHp
	adds r2, r0, #0
	adds r0, r6, #0
	adds r1, r5, #0
	bl DrawDecNumber
	ldr r5, _0809C3E0  @ gUnknown_02023E10
	adds r0, r4, #0
	bl GetUnitPower
	ldr r1, [r4, #4]
	ldrb r1, [r1, #0x14]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	movs r6, #2
	cmp r0, r1
	bne _0809C2AA
	movs r6, #4
_0809C2AA:
	adds r0, r4, #0
	bl GetUnitPower
	adds r2, r0, #0
	adds r0, r5, #0
	adds r1, r6, #0
	bl DrawDecNumber
	adds r7, r5, #0
	adds r7, #0x80
	adds r0, r4, #0
	bl GetUnitSkill
	ldr r1, [r4, #4]
	ldrb r1, [r1, #0x15]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	movs r6, #2
	cmp r0, r1
	bne _0809C2D4
	movs r6, #4
_0809C2D4:
	adds r0, r4, #0
	bl GetUnitSkill
	adds r2, r0, #0
	adds r0, r7, #0
	adds r1, r6, #0
	bl DrawDecNumber
	movs r0, #0x80
	lsls r0, r0, #1
	adds r7, r5, r0
	adds r0, r4, #0
	bl GetUnitSpeed
	ldr r1, [r4, #4]
	ldrb r1, [r1, #0x16]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	movs r6, #2
	cmp r0, r1
	bne _0809C300
	movs r6, #4
_0809C300:
	adds r0, r4, #0
	bl GetUnitSpeed
	adds r2, r0, #0
	adds r0, r7, #0
	adds r1, r6, #0
	bl DrawDecNumber
	adds r7, r5, #0
	subs r7, #0x72
	adds r0, r4, #0
	bl GetUnitLuck
	movs r6, #2
	cmp r0, #0x1e
	bne _0809C322
	movs r6, #4
_0809C322:
	adds r0, r4, #0
	bl GetUnitLuck
	adds r2, r0, #0
	adds r0, r7, #0
	adds r1, r6, #0
	bl DrawDecNumber
	adds r7, r5, #0
	adds r7, #0xe
	adds r0, r4, #0
	bl GetUnitDefense
	ldr r1, [r4, #4]
	ldrb r1, [r1, #0x17]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	movs r6, #2
	cmp r0, r1
	bne _0809C34C
	movs r6, #4
_0809C34C:
	adds r0, r4, #0
	bl GetUnitDefense
	adds r2, r0, #0
	adds r0, r7, #0
	adds r1, r6, #0
	bl DrawDecNumber
	adds r7, r5, #0
	adds r7, #0x8e
	adds r0, r4, #0
	bl GetUnitResistance
	ldr r1, [r4, #4]
	ldrb r1, [r1, #0x18]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	movs r6, #2
	cmp r0, r1
	bne _0809C376
	movs r6, #4
_0809C376:
	adds r0, r4, #0
	bl GetUnitResistance
	adds r2, r0, #0
	adds r0, r7, #0
	adds r1, r6, #0
	bl DrawDecNumber
	movs r1, #0x87
	lsls r1, r1, #1
	adds r6, r5, r1
	ldr r2, [r4, #4]
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	ldr r0, [r4]
	ldrb r0, [r0, #0x13]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r1, r1, r0
	movs r0, #0x1a
	ldrsb r0, [r4, r0]
	adds r3, r1, r0
	movs r0, #0x19
	ldrsb r0, [r2, r0]
	movs r1, #2
	cmp r3, r0
	bne _0809C3AE
	movs r1, #4
_0809C3AE:
	adds r0, r6, #0
	adds r2, r3, #0
	bl DrawDecNumber
	ldr r1, _0809C3E4  @ 0xFFFFFEFE
	adds r0, r5, r1
	movs r1, #1
	movs r2, #1
	movs r3, #0
	bl TileMap_FillRect
	ldr r1, _0809C3E8  @ 0xFFFFFF00
	adds r0, r5, r1
	movs r2, #8
	ldrsb r2, [r4, r2]
	movs r1, #2
	bl DrawDecNumber
	movs r0, #4
	bl BG_EnableSyncByMask
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809C3E0: .4byte gUnknown_02023E10
_0809C3E4: .4byte 0xFFFFFEFE
_0809C3E8: .4byte 0xFFFFFF00

	THUMB_FUNC_END DrawPrepScreenItemUseStatValues

	THUMB_FUNC_START DrawPrepScreenItemUseItemUseDesc
DrawPrepScreenItemUseItemUseDesc: @ 0x0809C3EC
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r6, r0, #0
	adds r5, r1, #0
	ldr r4, _0809C46C  @ gUnknown_02013560
	adds r0, r4, #0
	bl Text_Clear
	adds r0, r4, #0
	adds r0, #8
	bl Text_Clear
	adds r4, #0x20
	adds r0, r4, #0
	bl Text_Clear
	movs r0, #1
	negs r0, r0
	cmp r5, r0
	beq _0809C4A2
	lsls r1, r5, #1
	adds r0, r6, #0
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r4, [r0]
	adds r0, r4, #0
	bl GetItemUseDescId
	adds r5, r0, #0
	mov r1, sp
	ldr r0, _0809C470  @ gUnknown_08205C64
	ldm r0!, {r2, r3, r7}
	stm r1!, {r2, r3, r7}
	cmp r5, #0
	beq _0809C4A2
	adds r0, r6, #0
	adds r1, r4, #0
	bl CanUnitUseItemPrepScreen
	cmp r0, #0
	beq _0809C478
	ldr r0, [sp]
	movs r1, #0
	bl Text_SetColorId
	ldr r0, [sp, #4]
	movs r1, #0
	bl Text_SetColorId
	ldr r0, [sp, #8]
	movs r1, #0
	bl Text_SetColorId
	adds r0, r5, #0
	bl GetStringFromIndex
	adds r1, r0, #0
	ldr r2, _0809C474  @ gUnknown_02022FC6
	mov r0, sp
	movs r3, #3
	bl PrintStringToTexts
	b _0809C4A2
	.align 2, 0
_0809C46C: .4byte gUnknown_02013560
_0809C470: .4byte gUnknown_08205C64
_0809C474: .4byte gUnknown_02022FC6
_0809C478:
	ldr r0, [sp]
	movs r1, #1
	bl Text_SetColorId
	ldr r0, [sp, #4]
	movs r1, #1
	bl Text_SetColorId
	ldr r0, [sp, #8]
	movs r1, #1
	bl Text_SetColorId
	adds r0, r5, #0
	bl GetStringFromIndex
	adds r1, r0, #0
	ldr r2, _0809C4B0  @ gUnknown_02022FC6
	mov r0, sp
	movs r3, #3
	bl PrintStringToTexts
_0809C4A2:
	movs r0, #1
	bl BG_EnableSyncByMask
	add sp, #0xc
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809C4B0: .4byte gUnknown_02022FC6

	THUMB_FUNC_END DrawPrepScreenItemUseItemUseDesc

	THUMB_FUNC_START sub_809C4B4
sub_809C4B4: @ 0x0809C4B4
	push {lr}
	sub sp, #4
	movs r3, #0xc8
	lsls r3, r3, #8
	ldr r0, [r0, #0x2c]
	ldr r0, [r0, #4]
	ldrb r0, [r0, #4]
	str r0, [sp]
	movs r0, #0
	movs r1, #0x78
	movs r2, #0xa
	bl PutUnitSpriteForClassId
	bl SyncUnitSpriteSheet
	add sp, #4
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_809C4B4

	THUMB_FUNC_START PrepItemUse_OnInit
PrepItemUse_OnInit: @ 0x0809C4D8
	movs r1, #0
	str r1, [r0, #0x30]
	movs r1, #0xff
	str r1, [r0, #0x38]
	bx lr

	THUMB_FUNC_END PrepItemUse_OnInit

	THUMB_FUNC_START PrepItemUse_InitDisplay
PrepItemUse_InitDisplay: @ 0x0809C4E4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x28
	adds r7, r0, #0
	add r1, sp, #8
	ldr r0, _0809C7E0  @ gUnknown_08205C70
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldm r0!, {r2, r3, r6}
	stm r1!, {r2, r3, r6}
	ldm r0!, {r4, r6}
	stm r1!, {r4, r6}
	ldr r4, _0809C7E4  @ gLCDControlBuffer
	ldrb r1, [r4]
	movs r0, #8
	negs r0, r0
	ands r0, r1
	strb r0, [r4]
	ldr r0, _0809C7E8  @ gUnknown_08A181E8
	bl SetupBackgrounds
	add r0, sp, #8
	bl SetupFaceGfxData
	movs r0, #0xff
	str r0, [r7, #0x34]
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
	bl Font_InitForUIDefault
	bl ResetIconGraphics_
	bl LoadUiFrameGraphics
	bl LoadObjUIGfx
	bl SetupMapSpritesPalettes
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
	ldr r0, _0809C7EC  @ 0x06014000
	movs r1, #1
	negs r1, r1
	bl LoadDialogueBoxGfx
	movs r0, #4
	bl LoadIconPalettes
	bl EndSlidingWallEffectMaybe
	ldr r5, _0809C7F0  @ gUnknown_02013510
	movs r4, #4
_0809C5B6:
	adds r0, r5, #0
	movs r1, #7
	bl Text_Allocate
	adds r5, #8
	subs r4, #1
	cmp r4, #0
	bge _0809C5B6
	ldr r5, _0809C7F4  @ gUnknown_02013498
	movs r4, #7
_0809C5CA:
	adds r0, r5, #0
	movs r1, #3
	bl Text_Init
	adds r5, #8
	subs r4, #1
	cmp r4, #0
	bge _0809C5CA
	ldr r0, _0809C7F4  @ gUnknown_02013498
	mov sl, r0
	adds r0, #0x40
	movs r1, #8
	bl Text_Init
	mov r0, sl
	adds r0, #0xc8
	movs r1, #0xf
	bl Text_Init
	mov r0, sl
	adds r0, #0xd0
	movs r1, #0xf
	bl Text_Init
	mov r0, sl
	adds r0, #0xe8
	movs r1, #0xf
	bl Text_Init
	mov r0, sl
	adds r0, #0xd8
	movs r1, #0xe
	bl Text_Init
	mov r0, sl
	adds r0, #0xe0
	movs r1, #8
	bl Text_Init
	ldr r0, [r7, #0x2c]
	bl DrawPrepScreenItemUseStatLabels
	ldr r0, [r7, #0x2c]
	bl DrawPrepScreenItemUseStatValues
	ldr r0, [r7, #0x2c]
	movs r1, #0
	bl DrawPrepScreenItemUseStatBars
	ldr r0, [r7, #0x2c]
	bl GetUnitPortraitId
	adds r1, r0, #0
	movs r3, #4
	negs r3, r3
	ldr r0, _0809C7F8  @ 0x00000203
	str r0, [sp]
	movs r0, #0
	movs r2, #0x40
	bl StartFace2
	movs r0, #0xc0
	lsls r0, r0, #7
	movs r1, #5
	bl sub_8098C3C
	movs r0, #0x80
	lsls r0, r0, #4
	movs r1, #0xa
	bl PutImg_PrepPopupWindow
	ldr r0, _0809C7FC  @ gUnknown_08A1BAB8
	ldr r1, _0809C800  @ 0x06000440
	bl Decompress
	ldr r0, _0809C804  @ gUnknown_08A1BAE4
	ldr r4, _0809C808  @ gGenericBuffer
	adds r1, r4, #0
	bl Decompress
	ldr r0, _0809C80C  @ gBG1TilemapBuffer
	movs r2, #0x80
	lsls r2, r2, #5
	adds r1, r4, #0
	bl CallARM_FillTileRect
	movs r0, #7
	bl BG_EnableSyncByMask
	movs r1, #0xe0
	lsls r1, r1, #4
	movs r3, #0xc0
	lsls r3, r3, #4
	movs r2, #0
	str r2, [sp]
	str r7, [sp, #4]
	movs r0, #0xd
	movs r2, #0xf
	bl StartSmallBrownNameBoxes
	movs r1, #0x28
	negs r1, r1
	movs r2, #1
	negs r2, r2
	movs r0, #0
	movs r3, #1
	bl sub_80ADBFC
	ldr r0, [r7, #0x2c]
	ldr r0, [r0]
	ldrh r0, [r0]
	bl GetStringFromIndex
	adds r4, r0, #0
	bl GetStringTextWidth
	movs r3, #0x30
	subs r3, r3, r0
	lsrs r0, r3, #0x1f
	adds r3, r3, r0
	asrs r3, r3, #1
	movs r0, #6
	str r0, [sp]
	str r4, [sp, #4]
	movs r0, #0
	ldr r1, _0809C810  @ gBG0TilemapBuffer
	movs r2, #0
	bl DrawTextInline
	adds r0, r7, #0
	bl sub_80AC9C0
	adds r0, r7, #0
	bl ResetPrepScreenHandCursor
	movs r0, #0xc0
	lsls r0, r0, #3
	movs r1, #1
	bl sub_80AD4A0
	ldr r0, _0809C814  @ sub_809C4B4
	adds r1, r7, #0
	bl StartParallelWorker
	ldr r6, _0809C7E4  @ gLCDControlBuffer
	ldrb r0, [r6, #1]
	movs r3, #0x20
	mov ip, r3
	mov r4, ip
	orrs r0, r4
	movs r1, #0x41
	negs r1, r1
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r6, #1]
	adds r1, r6, #0
	adds r1, #0x2d
	movs r0, #0x68
	strb r0, [r1]
	adds r1, #4
	movs r0, #0x5e
	strb r0, [r1]
	subs r1, #5
	movs r0, #0xf0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0x92
	strb r0, [r1]
	movs r0, #0x34
	adds r0, r0, r6
	mov r9, r0
	ldrb r1, [r0]
	movs r2, #1
	mov r8, r2
	mov r3, r8
	orrs r1, r3
	movs r5, #2
	orrs r1, r5
	movs r4, #4
	orrs r1, r4
	movs r3, #8
	orrs r1, r3
	movs r2, #0x10
	orrs r1, r2
	ldr r6, _0809C818  @ gUnknown_030030B6
	ldrb r0, [r6]
	mov r6, r8
	orrs r0, r6
	orrs r0, r5
	orrs r0, r4
	orrs r0, r3
	orrs r0, r2
	mov r2, ip
	orrs r1, r2
	mov r3, r9
	strb r1, [r3]
	movs r1, #0x21
	negs r1, r1
	ands r0, r1
	ldr r4, _0809C818  @ gUnknown_030030B6
	strb r0, [r4]
	movs r0, #3
	movs r1, #0
	movs r2, #0
	movs r3, #8
	bl SetSpecialColorEffectsParameters
	movs r6, #0
	str r6, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #1
	bl SetBlendTargetA
	adds r0, r7, #0
	bl NewGreenTextColorManager
	movs r0, #0xc0
	movs r1, #0x90
	movs r2, #9
	adds r3, r7, #0
	bl StartHelpPromptSprite
	ldr r0, [r7, #0x2c]
	ldr r1, [r7, #0x30]
	bl DrawPrepScreenItemUseItemUseDesc
	mov r1, sl
	adds r1, #0x78
	ldr r2, [r7, #0x2c]
	ldr r0, _0809C81C  @ gUnknown_02022EEC
	movs r3, #1
	bl sub_809B74C
	ldr r1, [r7, #0x30]
	asrs r2, r1, #3
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #4
	adds r0, #0x10
	movs r2, #7
	ands r1, r2
	lsls r1, r1, #4
	adds r1, #0x48
	movs r2, #0xb
	movs r3, #0x80
	lsls r3, r3, #4
	bl ShowPrepScreenHandCursor
	ldr r0, [r7, #0x2c]
	bl GetUnitSMSId
	bl UseUnitSprite
	bl ForceSyncUnitSpriteSheet
	add sp, #0x28
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809C7E0: .4byte gUnknown_08205C70
_0809C7E4: .4byte gLCDControlBuffer
_0809C7E8: .4byte gUnknown_08A181E8
_0809C7EC: .4byte 0x06014000
_0809C7F0: .4byte gUnknown_02013510
_0809C7F4: .4byte gUnknown_02013498
_0809C7F8: .4byte 0x00000203
_0809C7FC: .4byte gUnknown_08A1BAB8
_0809C800: .4byte 0x06000440
_0809C804: .4byte gUnknown_08A1BAE4
_0809C808: .4byte gGenericBuffer
_0809C80C: .4byte gBG1TilemapBuffer
_0809C810: .4byte gBG0TilemapBuffer
_0809C814: .4byte sub_809C4B4
_0809C818: .4byte gUnknown_030030B6
_0809C81C: .4byte gUnknown_02022EEC

	THUMB_FUNC_END PrepItemUse_InitDisplay

	THUMB_FUNC_START PrepItemUse_CtrlLoop
PrepItemUse_CtrlLoop: @ 0x0809C820
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x38]
	cmp r0, #0xff
	beq _0809C848
	ldr r0, _0809C844  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0x81
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0809C8F0
	bl CloseHelpBox
	movs r0, #0xff
	b _0809C938
	.align 2, 0
_0809C844: .4byte gKeyStatusPtr
_0809C848:
	ldr r0, _0809C8A8  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	bne _0809C91C
	movs r5, #1
	adds r0, r5, #0
	ands r0, r1
	cmp r0, #0
	beq _0809C8C8
	ldr r0, [r4, #0x2c]
	ldr r2, [r4, #0x30]
	lsls r2, r2, #1
	adds r1, r0, #0
	adds r1, #0x1e
	adds r1, r1, r2
	ldrh r1, [r1]
	bl CanUnitUseItemPrepScreen
	cmp r0, #0
	beq _0809C8B0
	ldr r2, [r4, #0x30]
	str r2, [r4, #0x34]
	lsls r2, r2, #4
	adds r2, #0x48
	movs r0, #0
	movs r1, #0x10
	movs r3, #0
	bl sub_80AC9D4
	str r5, [r4, #0x3c]
	ldr r0, _0809C8AC  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809C89E
	movs r0, #0x6a
	bl m4aSongNumStart
_0809C89E:
	adds r0, r4, #0
	movs r1, #2
	bl Proc_Goto
	b _0809C93A
	.align 2, 0
_0809C8A8: .4byte gKeyStatusPtr
_0809C8AC: .4byte gPlaySt
_0809C8B0:
	ldr r0, _0809C8C4  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809C93A
	movs r0, #0x6c
	bl m4aSongNumStart
	b _0809C93A
	.align 2, 0
_0809C8C4: .4byte gPlaySt
_0809C8C8:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0809C8F0
	adds r0, r4, #0
	movs r1, #6
	bl Proc_Goto
	ldr r0, _0809C8EC  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809C93A
	movs r0, #0x6b
	bl m4aSongNumStart
	b _0809C93A
	.align 2, 0
_0809C8EC: .4byte gPlaySt
_0809C8F0:
	adds r0, r4, #0
	bl sub_809BE80
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809C93A
	ldr r1, [r4, #0x30]
	lsls r1, r1, #4
	adds r1, #0x48
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x10
	movs r2, #0xb
	bl ShowPrepScreenHandCursor
	ldr r0, [r4, #0x2c]
	ldr r1, [r4, #0x30]
	bl DrawPrepScreenItemUseItemUseDesc
	ldr r0, [r4, #0x38]
	cmp r0, #0xff
	beq _0809C93A
_0809C91C:
	ldr r0, [r4, #0x2c]
	ldr r3, [r4, #0x30]
	lsls r1, r3, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r2, [r0]
	cmp r2, #0
	beq _0809C93A
	lsls r1, r3, #4
	adds r1, #0x48
	movs r0, #0x10
	bl StartItemHelpBox
	ldr r0, [r4, #0x30]
_0809C938:
	str r0, [r4, #0x38]
_0809C93A:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END PrepItemUse_CtrlLoop

	THUMB_FUNC_START ProcPrepItemUse_OnEnd
ProcPrepItemUse_OnEnd: @ 0x0809C940
	push {lr}
	bl EndBG3Slider_
	movs r0, #0
	bl EndFaceById
	movs r0, #1
	bl EndFaceById
	pop {r0}
	bx r0

	THUMB_FUNC_END ProcPrepItemUse_OnEnd

	THUMB_FUNC_START sub_809C958
sub_809C958: @ 0x0809C958
	push {r4, r5, r6, lr}
	sub sp, #8
	ldr r4, _0809C9C4  @ gUnknown_02013570
	adds r0, r4, #0
	bl Text_Clear
	ldr r0, _0809C9C8  @ 0x00000585
	bl GetStringFromIndex
	adds r1, r4, #0
	adds r4, #8
	ldr r5, _0809C9CC  @ gUnknown_0202400A
	movs r6, #0
	str r6, [sp]
	str r0, [sp, #4]
	adds r0, r1, #0
	adds r1, r5, #0
	movs r2, #0
	movs r3, #0
	bl DrawTextInline
	adds r0, r4, #0
	bl Text_Clear
	ldr r0, _0809C9D0  @ 0x00000843
	bl GetStringFromIndex
	adds r5, #0x84
	str r6, [sp]
	str r0, [sp, #4]
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0
	movs r3, #0
	bl DrawTextInline
	ldr r0, _0809C9D4  @ 0x00000844
	bl GetStringFromIndex
	str r6, [sp]
	str r0, [sp, #4]
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0
	movs r3, #0x20
	bl DrawTextInline
	movs r0, #4
	bl BG_EnableSyncByMask
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0809C9C4: .4byte gUnknown_02013570
_0809C9C8: .4byte 0x00000585
_0809C9CC: .4byte gUnknown_0202400A
_0809C9D0: .4byte 0x00000843
_0809C9D4: .4byte 0x00000844

	THUMB_FUNC_END sub_809C958

	THUMB_FUNC_START sub_809C9D8
sub_809C9D8: @ 0x0809C9D8
	push {lr}
	ldr r0, _0809C9F0  @ gUnknown_0202400A
	movs r1, #0xd
	movs r2, #4
	movs r3, #0
	bl TileMap_FillRect
	movs r0, #4
	bl BG_EnableSyncByMask
	pop {r0}
	bx r0
	.align 2, 0
_0809C9F0: .4byte gUnknown_0202400A

	THUMB_FUNC_END sub_809C9D8

	THUMB_FUNC_START PrepItemUse_AreUSureBoxInit
PrepItemUse_AreUSureBoxInit: @ 0x0809C9F4
	push {r4, lr}
	adds r4, r0, #0
	bl sub_809C958
	ldr r0, [r4, #0x3c]
	lsls r0, r0, #5
	adds r0, #0x94
	movs r3, #0x80
	lsls r3, r3, #4
	movs r1, #0x78
	movs r2, #0
	bl ShowPrepScreenHandCursor
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END PrepItemUse_AreUSureBoxInit

	THUMB_FUNC_START PrepItemUse_AreUSureBoxLoop
PrepItemUse_AreUSureBoxLoop: @ 0x0809CA14
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r7, [r4, #0x3c]
	ldr r0, _0809CA6C  @ 0x0000A440
	str r0, [sp]
	movs r0, #0x80
	movs r1, #0x64
	movs r2, #0xc
	movs r3, #4
	bl sub_809A31C
	ldr r5, _0809CA70  @ gKeyStatusPtr
	ldr r3, [r5]
	ldrh r1, [r3, #8]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0809CA78
	ldr r1, [r4, #0x30]
	lsls r1, r1, #4
	adds r1, #0x48
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x10
	movs r2, #0xb
	bl ShowPrepScreenHandCursor
	movs r0, #0
	bl sub_80ACA84
	bl sub_809C9D8
	ldr r0, _0809CA74  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809CADA
	movs r0, #0x6b
	bl m4aSongNumStart
	b _0809CADA
	.align 2, 0
_0809CA6C: .4byte 0x0000A440
_0809CA70: .4byte gKeyStatusPtr
_0809CA74: .4byte gPlaySt
_0809CA78:
	movs r6, #1
	adds r2, r6, #0
	ands r2, r1
	cmp r2, #0
	beq _0809CAE8
	bl sub_809C9D8
	ldr r0, [r4, #0x3c]
	cmp r0, #0
	bne _0809CAB0
	bl HidePrepScreenHandCursor
	ldr r0, _0809CAAC  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809CAA2
	movs r0, #0x6a
	bl m4aSongNumStart
_0809CAA2:
	adds r0, r4, #0
	movs r1, #3
	bl Proc_Goto
	b _0809CB2A
	.align 2, 0
_0809CAAC: .4byte gPlaySt
_0809CAB0:
	ldr r1, [r4, #0x30]
	lsls r1, r1, #4
	adds r1, #0x48
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x10
	movs r2, #0xb
	bl ShowPrepScreenHandCursor
	ldr r0, _0809CAE4  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809CAD4
	movs r0, #0x6b
	bl m4aSongNumStart
_0809CAD4:
	movs r0, #0
	bl sub_80ACA84
_0809CADA:
	adds r0, r4, #0
	bl Proc_Break
	b _0809CB2A
	.align 2, 0
_0809CAE4: .4byte gPlaySt
_0809CAE8:
	ldrh r1, [r3, #6]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _0809CAF4
	str r2, [r4, #0x3c]
_0809CAF4:
	ldr r0, [r5]
	ldrh r1, [r0, #6]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _0809CB02
	str r6, [r4, #0x3c]
_0809CB02:
	ldr r0, [r4, #0x3c]
	cmp r7, r0
	beq _0809CB2A
	lsls r0, r0, #5
	adds r0, #0x94
	movs r3, #0x80
	lsls r3, r3, #4
	movs r1, #0x78
	movs r2, #0
	bl ShowPrepScreenHandCursor
	ldr r0, _0809CB34  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809CB2A
	movs r0, #0x67
	bl m4aSongNumStart
_0809CB2A:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809CB34: .4byte gPlaySt

	THUMB_FUNC_END PrepItemUse_AreUSureBoxLoop

	THUMB_FUNC_START PrepItemUse_HandleItemEffect
PrepItemUse_HandleItemEffect: @ 0x0809CB38
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x2c]
	ldr r1, [r4, #0x30]
	lsls r1, r1, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r0, [r0]
	bl GetItemIndex
	cmp r0, #0x8a
	beq _0809CB78
	cmp r0, #0x8a
	bgt _0809CB62
	cmp r0, #0x64
	blt _0809CBA0
	cmp r0, #0x68
	ble _0809CB78
	cmp r0, #0x88
	beq _0809CB78
	b _0809CBA0
_0809CB62:
	cmp r0, #0xb7
	beq _0809CB98
	cmp r0, #0xb7
	bgt _0809CB74
	cmp r0, #0x99
	bgt _0809CBA0
	cmp r0, #0x97
	blt _0809CBA0
	b _0809CB78
_0809CB74:
	cmp r0, #0xc1
	bne _0809CBA0
_0809CB78:
	ldr r0, _0809CB94  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809CB8A
	movs r0, #0x6a
	bl m4aSongNumStart
_0809CB8A:
	adds r0, r4, #0
	movs r1, #5
	bl Proc_Goto
	b _0809CBA0
	.align 2, 0
_0809CB94: .4byte gPlaySt
_0809CB98:
	adds r0, r4, #0
	movs r1, #4
	bl Proc_Goto
_0809CBA0:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END PrepItemUse_HandleItemEffect

	THUMB_FUNC_START sub_809CBA8
sub_809CBA8: @ 0x0809CBA8
	push {r4, lr}
	adds r4, r0, #0
	bl EndBG3Slider_
	bl Font_InitForUIDefault
	movs r0, #0
	bl SetupBackgrounds
	bl EndGreenTextColorManager
	bl GetThread2SkipStack
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [r4, #0x40]
	bl ResetFaces
	bl EndHelpPromptSprite
	ldr r2, _0809CC38  @ gLCDControlBuffer
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
	adds r1, r2, #0
	adds r1, #0x34
	ldrb r0, [r1]
	movs r3, #0x20
	orrs r0, r3
	strb r0, [r1]
	adds r2, #0x36
	ldrb r0, [r2]
	orrs r0, r3
	strb r0, [r2]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #8
	bl SetSpecialColorEffectsParameters
	bl EndSmallBrownNameBoxes
	bl EndAllParallelWorkers
	movs r0, #0
	bl EndFaceById
	movs r0, #0
	bl sub_80ACA84
	ldr r0, [r4, #0x2c]
	ldr r2, [r4, #0x30]
	movs r1, #1
	movs r3, #0
	bl sub_802F664
	ldr r1, _0809CC3C  @ gBattleStats
	movs r0, #0x88
	lsls r0, r0, #1
	strh r0, [r1]
	bl BeginBattleAnimations
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809CC38: .4byte gLCDControlBuffer
_0809CC3C: .4byte gBattleStats

	THUMB_FUNC_END sub_809CBA8

	THUMB_FUNC_START sub_809CC40
sub_809CC40: @ 0x0809CC40
	push {r4, lr}
	adds r4, r0, #0
	bl GetThread2SkipStack
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, [r4, #0x40]
	cmp r1, r0
	bne _0809CC58
	adds r0, r4, #0
	bl Proc_Break
_0809CC58:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_809CC40

	THUMB_FUNC_START sub_809CC60
sub_809CC60: @ 0x0809CC60
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x2c]
	bl GetUnitItemCount
	adds r5, r0, #0
	ldr r0, [r4, #0x2c]
	ldr r0, [r0]
	ldrb r0, [r0, #4]
	bl PrepSetLatestCharId
	cmp r5, #0
	bne _0809CC84
	adds r0, r4, #0
	movs r1, #7
	bl Proc_Goto
	b _0809CC94
_0809CC84:
	ldr r0, [r4, #0x30]
	cmp r0, r5
	blt _0809CC8E
	subs r0, #1
	str r0, [r4, #0x30]
_0809CC8E:
	adds r0, r4, #0
	bl Proc_Break
_0809CC94:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_809CC60

	THUMB_FUNC_START sub_809CC9C
sub_809CC9C: @ 0x0809CC9C
	push {lr}
	movs r0, #0x80
	lsls r0, r0, #1
	bl Sound_SetSEVolume
	bl CheckSomethingSomewhere
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809CCB8
	movs r0, #0x38
	bl sub_8002620
	b _0809CCDA
_0809CCB8:
	ldr r0, _0809CCD0  @ gGMData
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0809CCD4
	bl sub_800270C
	bl sub_80B9FC0
	b _0809CCDA
	.align 2, 0
_0809CCD0: .4byte gGMData
_0809CCD4:
	movs r0, #0x34
	bl sub_8002620
_0809CCDA:
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_809CC9C

	THUMB_FUNC_START sub_809CCE0
sub_809CCE0: @ 0x0809CCE0
	push {lr}
	sub sp, #4
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #0
	str r0, [sp]
	movs r2, #0
	movs r3, #0x10
	bl sub_80029E8
	add sp, #4
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_809CCE0

	THUMB_FUNC_START StartPrepItemUseScreen
StartPrepItemUseScreen: @ 0x0809CCFC
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0809CD10  @ PrepScr_PrepItemUseScreen
	bl Proc_StartBlocking
	str r4, [r0, #0x2c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809CD10: .4byte PrepScr_PrepItemUseScreen

	THUMB_FUNC_END StartPrepItemUseScreen

	THUMB_FUNC_START PrepItemBooster_DrawPopup
PrepItemBooster_DrawPopup: @ 0x0809CD14
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r6, r0, #0
	adds r5, r1, #0
	adds r7, r2, #0
	adds r0, r3, #0
	bl GetStringFromIndex
	mov r9, r0
	ldr r0, [sp, #0x28]
	bl GetItemIconId
	mov r8, r0
	mov r0, r9
	bl GetStringTextWidth
	mov sl, r0
	mov r0, r8
	cmp r0, #0
	beq _0809CD60
	lsls r4, r7, #5
	adds r4, r4, r5
	lsls r4, r4, #1
	ldr r0, _0809CDCC  @ gBG2TilemapBuffer
	adds r4, r4, r0
	ldr r0, [sp, #0x28]
	bl GetItemIconId
	adds r1, r0, #0
	movs r2, #0x80
	lsls r2, r2, #7
	adds r0, r4, #0
	bl DrawIcon
_0809CD60:
	ldr r4, _0809CDD0  @ gUnknown_02013570
	adds r0, r4, #0
	bl Text_Clear
	lsls r0, r7, #5
	mov r1, r8
	cmp r1, #0
	beq _0809CD72
	adds r0, #2
_0809CD72:
	adds r0, r0, r5
	lsls r0, r0, #1
	ldr r1, _0809CDCC  @ gBG2TilemapBuffer
	adds r1, r0, r1
	movs r0, #0
	str r0, [sp]
	mov r0, r9
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r2, #0
	movs r3, #0
	bl DrawTextInline
	movs r0, #4
	bl BG_EnableSyncByMask
	lsls r0, r5, #3
	subs r0, #4
	str r0, [r6, #0x40]
	lsls r0, r7, #3
	subs r0, #4
	str r0, [r6, #0x44]
	mov r0, sl
	cmp r0, #0
	bge _0809CDA6
	adds r0, #7
_0809CDA6:
	asrs r1, r0, #3
	adds r0, r1, #1
	str r0, [r6, #0x48]
	mov r0, r8
	cmp r0, #0
	beq _0809CDB6
	adds r0, r1, #3
	str r0, [r6, #0x48]
_0809CDB6:
	movs r0, #2
	str r0, [r6, #0x4c]
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809CDCC: .4byte gBG2TilemapBuffer
_0809CDD0: .4byte gUnknown_02013570

	THUMB_FUNC_END PrepItemBooster_DrawPopup

	THUMB_FUNC_START PrepItemBooster_OnInit
PrepItemBooster_OnInit: @ 0x0809CDD4
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r7, r0, #0
	ldr r4, [r7, #0x14]
	movs r0, #0xe0
	lsls r0, r0, #1
	movs r1, #3
	movs r2, #0
	adds r3, r7, #0
	bl sub_807EDF8
	ldr r0, [r4, #0x2c]
	bl GetUnitCurrentHp
	adds r1, r7, #0
	adds r1, #0x30
	strb r0, [r1]
	ldr r0, [r4, #0x2c]
	bl GetUnitPower
	adds r1, r7, #0
	adds r1, #0x31
	strb r0, [r1]
	ldr r0, [r4, #0x2c]
	bl GetUnitSkill
	adds r1, r7, #0
	adds r1, #0x32
	strb r0, [r1]
	ldr r0, [r4, #0x2c]
	bl GetUnitSpeed
	adds r1, r7, #0
	adds r1, #0x33
	strb r0, [r1]
	ldr r0, [r4, #0x2c]
	bl GetUnitLuck
	adds r1, r7, #0
	adds r1, #0x34
	strb r0, [r1]
	ldr r0, [r4, #0x2c]
	bl GetUnitDefense
	adds r1, r7, #0
	adds r1, #0x35
	strb r0, [r1]
	ldr r0, [r4, #0x2c]
	bl GetUnitResistance
	adds r1, r7, #0
	adds r1, #0x36
	strb r0, [r1]
	ldr r1, [r4, #0x2c]
	ldr r2, [r1, #4]
	ldr r0, [r1]
	ldrb r0, [r0, #0x13]
	ldrb r2, [r2, #0x11]
	adds r0, r0, r2
	ldrb r1, [r1, #0x1a]
	adds r1, r1, r0
	adds r0, r7, #0
	adds r0, #0x37
	strb r1, [r0]
	ldr r0, [r4, #0x2c]
	ldr r1, [r4, #0x30]
	lsls r3, r1, #1
	adds r2, r0, #0
	adds r2, #0x1e
	adds r2, r2, r3
	ldrh r5, [r2]
	bl ApplyStatBoostItem
	adds r6, r0, #0
	ldr r0, [r4, #0x2c]
	movs r1, #0
	bl DrawPrepScreenItemUseStatBars
	ldr r0, [r4, #0x2c]
	bl DrawPrepScreenItemUseStatValues
	ldr r0, [r4, #0x2c]
	bl GetUnitCurrentHp
	adds r1, r7, #0
	adds r1, #0x38
	strb r0, [r1]
	ldr r0, [r4, #0x2c]
	bl GetUnitPower
	adds r1, r7, #0
	adds r1, #0x39
	strb r0, [r1]
	ldr r0, [r4, #0x2c]
	bl GetUnitSkill
	adds r1, r7, #0
	adds r1, #0x3a
	strb r0, [r1]
	ldr r0, [r4, #0x2c]
	bl GetUnitSpeed
	adds r1, r7, #0
	adds r1, #0x3b
	strb r0, [r1]
	ldr r0, [r4, #0x2c]
	bl GetUnitLuck
	adds r1, r7, #0
	adds r1, #0x3c
	strb r0, [r1]
	ldr r0, [r4, #0x2c]
	bl GetUnitDefense
	adds r1, r7, #0
	adds r1, #0x3d
	strb r0, [r1]
	ldr r0, [r4, #0x2c]
	bl GetUnitResistance
	adds r1, r7, #0
	adds r1, #0x3e
	strb r0, [r1]
	ldr r1, [r4, #0x2c]
	ldr r2, [r1, #4]
	ldr r0, [r1]
	ldrb r0, [r0, #0x13]
	ldrb r2, [r2, #0x11]
	adds r0, r0, r2
	ldrb r1, [r1, #0x1a]
	adds r1, r1, r0
	adds r0, r7, #0
	adds r0, #0x3f
	strb r1, [r0]
	str r5, [sp]
	adds r0, r7, #0
	movs r1, #0xe
	movs r2, #0xe
	adds r3, r6, #0
	bl PrepItemBooster_DrawPopup
	movs r4, #0
_0809CEF0:
	adds r0, r7, #0
	adds r0, #0x30
	adds r3, r0, r4
	adds r0, #8
	adds r2, r0, r4
	ldrb r0, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	beq _0809CF1E
	asrs r1, r4, #2
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #3
	adds r0, #0xb0
	movs r1, #3
	ands r1, r4
	lsls r1, r1, #4
	adds r1, #0x2a
	ldrb r2, [r2]
	ldrb r3, [r3]
	subs r2, r2, r3
	bl sub_807EFF0
_0809CF1E:
	adds r4, #1
	cmp r4, #7
	ble _0809CEF0
	movs r0, #0x78
	str r0, [r7, #0x2c]
	ldr r0, _0809CF44  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809CF3A
	movs r0, #0x5a
	bl m4aSongNumStart
_0809CF3A:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809CF44: .4byte gPlaySt

	THUMB_FUNC_END PrepItemBooster_OnInit

	THUMB_FUNC_START PrepItemBooster_Idle
PrepItemBooster_Idle: @ 0x0809CF48
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r0, [r5, #0x40]
	ldr r1, [r5, #0x44]
	ldr r2, [r5, #0x48]
	ldr r3, [r5, #0x4c]
	ldr r4, _0809CF84  @ 0x0000A440
	str r4, [sp]
	bl sub_809A31C
	ldr r0, [r5, #0x2c]
	subs r0, #1
	str r0, [r5, #0x2c]
	cmp r0, #0
	beq _0809CF76
	ldr r0, _0809CF88  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #3
	ands r0, r1
	cmp r0, #0
	beq _0809CF7C
_0809CF76:
	adds r0, r5, #0
	bl Proc_Break
_0809CF7C:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0809CF84: .4byte 0x0000A440
_0809CF88: .4byte gKeyStatusPtr

	THUMB_FUNC_END PrepItemBooster_Idle

	THUMB_FUNC_START PrepItemBooster_OnEnd
PrepItemBooster_OnEnd: @ 0x0809CF8C
	push {r4, r5, lr}
	ldr r4, [r0, #0x14]
	ldr r0, [r4, #0x2c]
	bl GetUnitItemCount
	adds r5, r0, #0
	ldr r0, _0809CFB4  @ gUnknown_02024044
	movs r1, #0xe
	movs r2, #1
	movs r3, #0
	bl TileMap_FillRect
	cmp r5, #0
	bne _0809CFB8
	adds r0, r4, #0
	movs r1, #6
	bl Proc_Goto
	b _0809CFD4
	.align 2, 0
_0809CFB4: .4byte gUnknown_02024044
_0809CFB8:
	ldr r0, [r4, #0x30]
	cmp r0, r5
	blt _0809CFC2
	subs r0, #1
	str r0, [r4, #0x30]
_0809CFC2:
	ldr r1, [r4, #0x30]
	lsls r1, r1, #4
	adds r1, #0x48
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x10
	movs r2, #0xb
	bl ShowPrepScreenHandCursor
_0809CFD4:
	ldr r0, _0809D008  @ gUnknown_02022EEC
	ldr r1, _0809D00C  @ gUnknown_02013510
	ldr r2, [r4, #0x2c]
	movs r3, #1
	bl sub_809B74C
	ldr r0, [r4, #0x2c]
	ldr r1, [r4, #0x30]
	bl DrawPrepScreenItemUseItemUseDesc
	movs r0, #0
	bl sub_80ACA84
	bl sub_807EE74
	movs r0, #5
	bl BG_EnableSyncByMask
	ldr r0, _0809D010  @ 0x06014000
	movs r1, #1
	negs r1, r1
	bl LoadDialogueBoxGfx
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0809D008: .4byte gUnknown_02022EEC
_0809D00C: .4byte gUnknown_02013510
_0809D010: .4byte 0x06014000

	THUMB_FUNC_END PrepItemBooster_OnEnd

	THUMB_FUNC_START sub_809D014
sub_809D014: @ 0x0809D014
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r6, r0, #0
	adds r5, r1, #0
	adds r7, r2, #0
	movs r0, #0x1f
	bl GetStringFromIndex
	mov r9, r0
	ldr r0, [sp, #0x28]
	bl GetItemIconId
	mov r8, r0
	mov r0, r9
	bl GetStringTextWidth
	mov sl, r0
	mov r0, r8
	cmp r0, #0
	beq _0809D060
	lsls r4, r7, #5
	adds r4, r4, r5
	lsls r4, r4, #1
	ldr r0, _0809D0CC  @ gBG2TilemapBuffer
	adds r4, r4, r0
	ldr r0, [sp, #0x28]
	bl GetItemIconId
	adds r1, r0, #0
	movs r2, #0x80
	lsls r2, r2, #7
	adds r0, r4, #0
	bl DrawIcon
_0809D060:
	ldr r4, _0809D0D0  @ gUnknown_02013570
	adds r0, r4, #0
	bl Text_Clear
	lsls r0, r7, #5
	mov r1, r8
	cmp r1, #0
	beq _0809D072
	adds r0, #2
_0809D072:
	adds r0, r0, r5
	lsls r0, r0, #1
	ldr r1, _0809D0CC  @ gBG2TilemapBuffer
	adds r1, r0, r1
	movs r0, #0
	str r0, [sp]
	mov r0, r9
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r2, #0
	movs r3, #0
	bl DrawTextInline
	movs r0, #4
	bl BG_EnableSyncByMask
	lsls r0, r5, #3
	subs r0, #4
	str r0, [r6, #0x34]
	lsls r0, r7, #3
	subs r0, #4
	str r0, [r6, #0x38]
	mov r0, sl
	cmp r0, #0
	bge _0809D0A6
	adds r0, #7
_0809D0A6:
	asrs r1, r0, #3
	adds r0, r1, #1
	str r0, [r6, #0x3c]
	mov r0, r8
	cmp r0, #0
	beq _0809D0B6
	adds r0, r1, #3
	str r0, [r6, #0x3c]
_0809D0B6:
	movs r0, #2
	str r0, [r6, #0x40]
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809D0CC: .4byte gBG2TilemapBuffer
_0809D0D0: .4byte gUnknown_02013570

	THUMB_FUNC_END sub_809D014

	THUMB_FUNC_START PrepJunaEffect_OnInit
PrepJunaEffect_OnInit: @ 0x0809D0D4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r7, r0, #0
	ldr r4, [r7, #0x14]
	movs r0, #0xe0
	lsls r0, r0, #1
	movs r1, #3
	movs r2, #0
	adds r3, r7, #0
	bl sub_807EDF8
	ldr r0, [r4, #0x2c]
	ldrb r0, [r0, #8]
	movs r1, #0x30
	adds r1, r1, r7
	mov r8, r1
	strb r0, [r1]
	ldr r0, [r4, #0x2c]
	ldr r1, [r4, #0x30]
	lsls r3, r1, #1
	adds r2, r0, #0
	adds r2, #0x1e
	adds r2, r2, r3
	ldrh r5, [r2]
	bl sub_802F978
	adds r6, r0, #0
	ldr r0, [r4, #0x2c]
	movs r1, #0
	bl DrawPrepScreenItemUseStatBars
	ldr r0, [r4, #0x2c]
	bl DrawPrepScreenItemUseStatValues
	ldr r0, [r4, #0x2c]
	ldrb r0, [r0, #8]
	adds r4, r7, #0
	adds r4, #0x31
	strb r0, [r4]
	str r5, [sp]
	adds r0, r7, #0
	movs r1, #0x11
	movs r2, #0xe
	adds r3, r6, #0
	bl sub_809D014
	mov r0, r8
	movs r1, #0
	ldrsb r1, [r0, r1]
	movs r0, #0
	ldrsb r0, [r4, r0]
	cmp r1, r0
	beq _0809D154
	adds r2, r0, #0
	mov r1, r8
	movs r0, #0
	ldrsb r0, [r1, r0]
	subs r2, r2, r0
	movs r0, #0xb0
	movs r1, #0x1a
	bl sub_807EFF0
_0809D154:
	movs r0, #0x78
	str r0, [r7, #0x2c]
	ldr r0, _0809D178  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809D16A
	movs r0, #0x5a
	bl m4aSongNumStart
_0809D16A:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809D178: .4byte gPlaySt

	THUMB_FUNC_END PrepJunaEffect_OnInit

	THUMB_FUNC_START sub_809D17C
sub_809D17C: @ 0x0809D17C
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r0, [r5, #0x34]
	ldr r1, [r5, #0x38]
	ldr r2, [r5, #0x3c]
	ldr r3, [r5, #0x40]
	ldr r4, _0809D1B8  @ 0x0000A440
	str r4, [sp]
	bl sub_809A31C
	ldr r0, [r5, #0x2c]
	subs r0, #1
	str r0, [r5, #0x2c]
	cmp r0, #0
	beq _0809D1AA
	ldr r0, _0809D1BC  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #3
	ands r0, r1
	cmp r0, #0
	beq _0809D1B0
_0809D1AA:
	adds r0, r5, #0
	bl Proc_Break
_0809D1B0:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0809D1B8: .4byte 0x0000A440
_0809D1BC: .4byte gKeyStatusPtr

	THUMB_FUNC_END sub_809D17C

	THUMB_FUNC_START PrepJunaEffect_OnEnd
PrepJunaEffect_OnEnd: @ 0x0809D1C0
	push {r4, r5, lr}
	ldr r4, [r0, #0x14]
	ldr r0, [r4, #0x2c]
	bl GetUnitItemCount
	adds r5, r0, #0
	ldr r0, _0809D1E8  @ gUnknown_0202404A
	movs r1, #0xc
	movs r2, #1
	movs r3, #0
	bl TileMap_FillRect
	cmp r5, #0
	bne _0809D1EC
	adds r0, r4, #0
	movs r1, #6
	bl Proc_Goto
	b _0809D208
	.align 2, 0
_0809D1E8: .4byte gUnknown_0202404A
_0809D1EC:
	ldr r0, [r4, #0x30]
	cmp r0, r5
	blt _0809D1F6
	subs r0, #1
	str r0, [r4, #0x30]
_0809D1F6:
	ldr r1, [r4, #0x30]
	lsls r1, r1, #4
	adds r1, #0x48
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x10
	movs r2, #0xb
	bl ShowPrepScreenHandCursor
_0809D208:
	ldr r0, _0809D238  @ gUnknown_02022EEC
	ldr r1, _0809D23C  @ gUnknown_02013510
	ldr r2, [r4, #0x2c]
	movs r3, #1
	bl sub_809B74C
	ldr r0, [r4, #0x2c]
	ldr r1, [r4, #0x30]
	bl DrawPrepScreenItemUseItemUseDesc
	movs r0, #0
	bl sub_80ACA84
	movs r0, #5
	bl BG_EnableSyncByMask
	ldr r0, _0809D240  @ 0x06014000
	movs r1, #1
	negs r1, r1
	bl LoadDialogueBoxGfx
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0809D238: .4byte gUnknown_02022EEC
_0809D23C: .4byte gUnknown_02013510
_0809D240: .4byte 0x06014000

	THUMB_FUNC_END PrepJunaEffect_OnEnd

.align 2, 0
