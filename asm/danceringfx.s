	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	@ Some sparkle effect that's apparenly calling on dance

	THUMB_FUNC_START sub_80219F8
sub_80219F8: @ 0x080219F8
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	ldr r0, _08021A7C  @ gUnknown_085A6C80
	ldr r1, _08021A80  @ 0x06002000
	bl CopyDataWithPossibleUncomp
	ldr r0, _08021A84  @ gUnknown_085A7CA0
	movs r1, #0x40
	movs r2, #0x20
	bl CopyToPaletteBuffer
	ldr r0, _08021A88  @ gUnknown_085A7A64
	ldr r4, _08021A8C  @ gBmFrameTmap0
	adds r1, r4, #0
	bl CopyDataWithPossibleUncomp
	movs r0, #0x84
	lsls r0, r0, #6
	adds r1, r0, #0
	movs r5, #0x90
	lsls r5, r5, #2
_08021A24:
	ldrh r2, [r4]
	adds r0, r1, r2
	strh r0, [r4]
	adds r4, #2
	subs r5, #1
	cmp r5, #0
	bne _08021A24
	ldr r0, _08021A90  @ gBG0TilemapBuffer
	movs r1, #0x80
	lsls r1, r1, #1
	bl BG_Fill
	movs r0, #1
	bl BG_EnableSyncByMask
	movs r0, #1
	movs r1, #0x10
	movs r2, #0x10
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	str r5, [sp]
	movs r0, #1
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl sub_8001ED0
	movs r0, #1
	str r0, [sp]
	movs r0, #0
	movs r1, #1
	movs r2, #1
	movs r3, #1
	bl sub_8001F0C
	adds r0, r6, #0
	adds r0, #0x4c
	strh r5, [r0]
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08021A7C: .4byte gUnknown_085A6C80
_08021A80: .4byte 0x06002000
_08021A84: .4byte gUnknown_085A7CA0
_08021A88: .4byte gUnknown_085A7A64
_08021A8C: .4byte gBmFrameTmap0
_08021A90: .4byte gBG0TilemapBuffer

	THUMB_FUNC_END sub_80219F8

	THUMB_FUNC_START sub_8021A94
sub_8021A94: @ 0x08021A94
	push {r4, lr}
	sub sp, #0x38
	adds r4, r0, #0
	ldr r1, _08021ACC  @ gUnknown_080D7BCC
	mov r0, sp
	movs r2, #0x38
	bl memcpy
	adds r1, r4, #0
	adds r1, #0x4c
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	lsls r0, r0, #2
	add r0, sp
	ldrb r1, [r0]
	ldrb r0, [r0, #1]
	cmp r1, #0xff
	bne _08021AD0
	adds r0, r4, #0
	bl Proc_Break
	b _08021AEA
	.align 2, 0
_08021ACC: .4byte gUnknown_080D7BCC
_08021AD0:
	lsls r0, r0, #5
	adds r0, r0, r1
	lsls r0, r0, #1
	ldr r1, _08021AF4  @ gBmFrameTmap0
	adds r0, r0, r1
	ldr r1, _08021AF8  @ gBG0TilemapBuffer
	movs r2, #6
	movs r3, #6
	bl TileMap_CopyRect
	movs r0, #1
	bl BG_EnableSyncByMask
_08021AEA:
	add sp, #0x38
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08021AF4: .4byte gBmFrameTmap0
_08021AF8: .4byte gBG0TilemapBuffer

	THUMB_FUNC_END sub_8021A94

	THUMB_FUNC_START sub_8021AFC
sub_8021AFC: @ 0x08021AFC
	adds r0, #0x4c
	movs r1, #0x10
	strh r1, [r0]
	bx lr

	THUMB_FUNC_END sub_8021AFC

	THUMB_FUNC_START sub_8021B04
sub_8021B04: @ 0x08021B04
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r5, #0
	adds r4, #0x4c
	ldrb r1, [r4]
	movs r0, #1
	movs r2, #0x10
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	ldrh r0, [r4]
	subs r0, #1
	strh r0, [r4]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _08021B2A
	adds r0, r5, #0
	bl Proc_Break
_08021B2A:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8021B04

	THUMB_FUNC_START sub_8021B30
sub_8021B30: @ 0x08021B30
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r0, _08021B8C  @ gBattleStats
	ldrh r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08021B86
	ldr r0, _08021B90  @ gActionData
	ldrb r0, [r0, #0xd]
	bl GetUnit
	movs r4, #0x10
	ldrsb r4, [r0, r4]
	movs r5, #0x11
	ldrsb r5, [r0, r5]
	ldr r0, _08021B94  @ gUnknown_0859B410
	adds r1, r6, #0
	bl Proc_StartBlocking
	lsls r0, r4, #4
	ldr r2, _08021B98  @ gUnknown_0202BCB0
	movs r3, #0xc
	ldrsh r1, [r2, r3]
	subs r0, r0, r1
	adds r4, r0, #0
	subs r4, #0x10
	lsls r0, r5, #4
	movs r3, #0xe
	ldrsh r1, [r2, r3]
	subs r0, r0, r1
	adds r5, r0, #0
	subs r5, #0x10
	negs r1, r4
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	negs r2, r5
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #0
	bl BG_SetPosition
_08021B86:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08021B8C: .4byte gBattleStats
_08021B90: .4byte gActionData
_08021B94: .4byte gUnknown_0859B410
_08021B98: .4byte gUnknown_0202BCB0

	THUMB_FUNC_END sub_8021B30

.align 2, 0 @ align with 0
