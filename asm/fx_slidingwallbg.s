	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	@ The sliding wall sculpture things that you get on various screens
	@ You know, the one Kirb likes to reuse a lot /s

	THUMB_FUNC_START sub_8086B74
sub_8086B74: @ 0x08086B74
	adds r0, #0x4c
	movs r1, #0
	strh r1, [r0]
	bx lr

	THUMB_FUNC_END sub_8086B74

	THUMB_FUNC_START sub_8086B7C
sub_8086B7C: @ 0x08086B7C
	push {r4, lr}
	adds r4, r0, #0
	adds r4, #0x4c
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
	movs r0, #0
	ldrsh r1, [r4, r0]
	cmp r1, #0
	bge _08086B92
	adds r1, #3
_08086B92:
	lsls r1, r1, #0xe
	lsrs r1, r1, #0x10
	movs r0, #3
	movs r2, #0
	bl BG_SetPosition
	movs r1, #0
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bge _08086BA8
	adds r0, #3
_08086BA8:
	asrs r1, r0, #2
	ldr r0, _08086BB4  @ 0x0400001C
	strh r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08086BB4: .4byte 0x0400001C

	THUMB_FUNC_END sub_8086B7C

	THUMB_FUNC_START sub_8086BB8
sub_8086BB8: @ 0x08086BB8
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	ldr r6, _08086BF0  @ gBG3TilemapBuffer
	cmp r4, #0
	bne _08086BD2
	movs r0, #3
	bl GetBackgroundTileDataOffset
	movs r1, #0xc0
	lsls r1, r1, #0x13
	adds r4, r0, r1
_08086BD2:
	cmp r5, #0
	bge _08086BD8
	movs r5, #0xe
_08086BD8:
	ldr r0, _08086BF4  @ gUnknown_0202BCB0
	ldrb r1, [r0, #4]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08086BFC
	ldr r0, _08086BF8  @ gUnknown_08B1754C
	lsls r1, r5, #5
	movs r2, #0x40
	bl CopyToPaletteBuffer
	b _08086C06
	.align 2, 0
_08086BF0: .4byte gBG3TilemapBuffer
_08086BF4: .4byte gUnknown_0202BCB0
_08086BF8: .4byte gUnknown_08B1754C
_08086BFC:
	ldr r0, _08086C40  @ gUnknown_08B1754C
	lsls r1, r5, #5
	movs r2, #0x40
	bl CopyToPaletteBuffer
_08086C06:
	ldr r0, _08086C44  @ gUnknown_08B12DB4
	adds r1, r4, #0
	bl CopyDataWithPossibleUncomp
	movs r0, #3
	bl GetBackgroundTileDataOffset
	subs r0, r4, r0
	lsls r0, r0, #0xf
	lsrs r0, r0, #0x14
	movs r1, #0xf
	ands r1, r5
	lsls r1, r1, #0xc
	adds r1, r0, r1
	movs r2, #0
	ldr r3, _08086C48  @ 0x0000027F
_08086C26:
	adds r0, r2, r1
	strh r0, [r6]
	adds r6, #2
	adds r2, #1
	cmp r2, r3
	ble _08086C26
	ldr r0, _08086C4C  @ gUnknown_08A006E4
	adds r1, r7, #0
	bl Proc_Start
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08086C40: .4byte gUnknown_08B1754C
_08086C44: .4byte gUnknown_08B12DB4
_08086C48: .4byte 0x0000027F
_08086C4C: .4byte gUnknown_08A006E4

	THUMB_FUNC_END sub_8086BB8

	THUMB_FUNC_START sub_8086C50
sub_8086C50: @ 0x08086C50
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	adds r4, r1, #0
	adds r5, r2, #0
	lsls r3, r3, #0x18
	lsrs r6, r3, #0x18
	ldr r7, _08086C88  @ gBG3TilemapBuffer
	cmp r4, #0
	bne _08086C72
	movs r0, #3
	bl GetBackgroundTileDataOffset
	movs r1, #0xc0
	lsls r1, r1, #0x13
	adds r4, r0, r1
_08086C72:
	cmp r5, #0
	bge _08086C78
	movs r5, #0xe
_08086C78:
	cmp r6, #0
	beq _08086C90
	ldr r0, _08086C8C  @ gUnknown_08B1754C
	lsls r1, r5, #5
	movs r2, #0x40
	bl CopyToPaletteBuffer
	b _08086C9A
	.align 2, 0
_08086C88: .4byte gBG3TilemapBuffer
_08086C8C: .4byte gUnknown_08B1754C
_08086C90:
	ldr r0, _08086CD8  @ gUnknown_08B1754C
	lsls r1, r5, #5
	movs r2, #0x40
	bl CopyToPaletteBuffer
_08086C9A:
	ldr r0, _08086CDC  @ gUnknown_08B12DB4
	adds r1, r4, #0
	bl CopyDataWithPossibleUncomp
	movs r0, #3
	bl GetBackgroundTileDataOffset
	subs r0, r4, r0
	lsls r0, r0, #0xf
	lsrs r0, r0, #0x14
	movs r1, #0xf
	ands r1, r5
	lsls r1, r1, #0xc
	adds r1, r0, r1
	movs r2, #0
	ldr r3, _08086CE0  @ 0x0000027F
_08086CBA:
	adds r0, r2, r1
	strh r0, [r7]
	adds r7, #2
	adds r2, #1
	cmp r2, r3
	ble _08086CBA
	ldr r0, _08086CE4  @ gUnknown_08A006E4
	mov r1, r8
	bl Proc_Start
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08086CD8: .4byte gUnknown_08B1754C
_08086CDC: .4byte gUnknown_08B12DB4
_08086CE0: .4byte 0x0000027F
_08086CE4: .4byte gUnknown_08A006E4

	THUMB_FUNC_END sub_8086C50

	THUMB_FUNC_START sub_8086CE8
sub_8086CE8: @ 0x08086CE8
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	mov r9, r0
	adds r6, r1, #0
	adds r7, r2, #0
	mov r8, r3
	ldr r5, _08086DA8  @ gBG3TilemapBuffer
	cmp r6, #0
	bne _08086D0A
	movs r0, #3
	bl GetBackgroundTileDataOffset
	movs r1, #0xc0
	lsls r1, r1, #0x13
	adds r6, r0, r1
_08086D0A:
	ldr r0, [sp, #0x1c]
	lsls r0, r0, #5
	ldr r1, _08086DAC  @ gUnknown_08B1754C
	adds r0, r0, r1
	movs r1, #0xe0
	lsls r1, r1, #1
	movs r2, #0x40
	bl CopyToPaletteBuffer
	ldr r0, _08086DB0  @ gUnknown_08B12DB4
	adds r1, r6, #0
	bl CopyDataWithPossibleUncomp
	movs r0, #3
	bl GetBackgroundTileDataOffset
	subs r0, r6, r0
	lsls r0, r0, #0xf
	lsrs r0, r0, #0x14
	movs r1, #0xe0
	lsls r1, r1, #8
	adds r1, r0, r1
	movs r4, #0
	lsls r2, r7, #5
	add r7, r8
	cmp r4, r2
	bge _08086D4C
_08086D40:
	adds r0, r4, r1
	strh r0, [r5]
	adds r5, #2
	adds r4, #1
	cmp r4, r2
	blt _08086D40
_08086D4C:
	movs r0, #3
	bl GetBackgroundTileDataOffset
	subs r0, r6, r0
	lsls r0, r0, #0xf
	lsrs r0, r0, #0x14
	movs r1, #0xf0
	lsls r1, r1, #8
	adds r1, r0, r1
	lsls r2, r7, #5
	cmp r4, r2
	bge _08086D70
_08086D64:
	adds r0, r4, r1
	strh r0, [r5]
	adds r5, #2
	adds r4, #1
	cmp r4, r2
	blt _08086D64
_08086D70:
	movs r0, #3
	bl GetBackgroundTileDataOffset
	subs r0, r6, r0
	lsls r0, r0, #0xf
	lsrs r0, r0, #0x14
	movs r1, #0xe0
	lsls r1, r1, #8
	adds r1, r0, r1
	ldr r2, _08086DB4  @ 0x0000027F
	cmp r4, r2
	bgt _08086D94
_08086D88:
	adds r0, r4, r1
	strh r0, [r5]
	adds r5, #2
	adds r4, #1
	cmp r4, r2
	ble _08086D88
_08086D94:
	ldr r0, _08086DB8  @ gUnknown_08A006E4
	mov r1, r9
	bl Proc_Start
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08086DA8: .4byte gBG3TilemapBuffer
_08086DAC: .4byte gUnknown_08B1754C
_08086DB0: .4byte gUnknown_08B12DB4
_08086DB4: .4byte 0x0000027F
_08086DB8: .4byte gUnknown_08A006E4

	THUMB_FUNC_END sub_8086CE8

	THUMB_FUNC_START EndBG3Slider
EndBG3Slider: @ 0x08086DBC
	push {lr}
	ldr r0, _08086DC8  @ gUnknown_08A006E4
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
_08086DC8: .4byte gUnknown_08A006E4

	THUMB_FUNC_END EndBG3Slider

.align 2, 0
