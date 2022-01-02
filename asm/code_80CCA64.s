	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	THUMB_FUNC_START sub_80CDDF0
sub_80CDDF0: @ 0x080CDDF0
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	ldr r5, [r4, #0x14]
	ldr r7, [r5, #0x14]
	adds r0, r5, #0
	adds r0, #0x38
	ldrb r0, [r0]
	bl GetUnitFromCharId
	adds r6, r0, #0
	cmp r6, #0
	bne _080CDE10
	adds r0, r4, #0
	bl Proc_End
	b _080CDE6A
_080CDE10:
	bl GetThread2SkipStack
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r1, r4, #0
	adds r1, #0x4c
	strh r0, [r1]
	ldr r2, _080CDE58  @ gLCDControlBuffer
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
	adds r0, r5, #0
	adds r0, #0x3b
	ldrb r1, [r0]
	movs r2, #1
	negs r2, r2
	adds r0, r6, #0
	movs r3, #0
	bl sub_802F664
	adds r0, r7, #0
	adds r0, #0x31
	ldrb r0, [r0]
	cmp r0, #2
	beq _080CDE60
	ldr r1, _080CDE5C  @ gBattleStats
	movs r0, #0x88
	lsls r0, r0, #1
	b _080CDE64
	.align 2, 0
_080CDE58: .4byte gLCDControlBuffer
_080CDE5C: .4byte gBattleStats
_080CDE60:
	ldr r1, _080CDE70  @ gBattleStats
	movs r0, #0x10
_080CDE64:
	strh r0, [r1]
	bl BeginBattleAnimations
_080CDE6A:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080CDE70: .4byte gBattleStats

	THUMB_FUNC_END sub_80CDDF0

	THUMB_FUNC_START sub_80CDE74
sub_80CDE74: @ 0x080CDE74
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r0, #0x4c
	movs r1, #0
	ldrsh r4, [r0, r1]
	bl GetThread2SkipStack
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r4, r0
	bne _080CDE90
	adds r0, r5, #0
	bl Proc_Break
_080CDE90:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80CDE74

	THUMB_FUNC_START sub_80CDE98
sub_80CDE98: @ 0x080CDE98
	push {lr}
	ldr r0, [r0, #0x14]
	adds r0, #0x38
	ldrb r0, [r0]
	bl GetUnitFromCharId
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80CDE98

	THUMB_FUNC_START sub_80CDEA8
sub_80CDEA8: @ 0x080CDEA8
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r5, [r4, #0x14]
	ldr r1, _080CDF40  @ gUnknown_03005398
	movs r2, #1
	negs r2, r2
	adds r0, r2, #0
	strb r0, [r1]
	bl sub_808F270
	bl sub_8010E50
	bl APProc_DeleteAll
	bl EndBG3Slider_
	ldr r3, _080CDF44  @ gLCDControlBuffer
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
	movs r0, #3
	movs r1, #0
	movs r2, #0
	movs r3, #0x10
	bl SetSpecialColorEffectsParameters
	movs r0, #1
	str r0, [sp]
	movs r1, #1
	movs r2, #1
	movs r3, #1
	bl sub_8001ED0
	adds r0, r4, #0
	bl sub_80ADDD4
	ldr r0, _080CDF48  @ gUnknown_08B12A64
	adds r1, r4, #0
	bl Proc_StartBlocking
	adds r0, r5, #0
	adds r0, #0x31
	ldrb r0, [r0]
	cmp r0, #0
	beq _080CDF38
	ldr r1, [r5, #0x3c]
	movs r0, #1
	negs r0, r0
	cmp r1, r0
	beq _080CDF38
	ldr r0, [r5, #0x38]
	bl UnitUpdateUsedItem
_080CDF38:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080CDF40: .4byte gUnknown_03005398
_080CDF44: .4byte gLCDControlBuffer
_080CDF48: .4byte gUnknown_08B12A64

	THUMB_FUNC_END sub_80CDEA8

	THUMB_FUNC_START sub_80CDF4C
sub_80CDF4C: @ 0x080CDF4C
	push {r4, lr}
	ldr r4, _080CDF5C  @ gUnknown_08B19E0C
_080CDF50:
	ldrb r0, [r4]
	cmp r0, #0xc
	bne _080CDF60
	movs r0, #1
	b _080CDF72
	.align 2, 0
_080CDF5C: .4byte gUnknown_08B19E0C
_080CDF60:
	ldrh r0, [r4, #6]
	bl CheckEventId
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080CDF70
	adds r4, #0xc
	b _080CDF50
_080CDF70:
	movs r0, #0
_080CDF72:
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80CDF4C

	THUMB_FUNC_START sub_80CDF78
sub_80CDF78: @ 0x080CDF78
	push {lr}
	movs r0, #0xe0
	movs r1, #3
	bl sub_80B53BC
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80CDF78

	THUMB_FUNC_START sub_80CDF88
sub_80CDF88: @ 0x080CDF88
	push {r4, r5, lr}
	sub sp, #4
	bl GetGameClock
	ldr r3, _080CE014  @ gUnknown_08B12AA8
	movs r4, #0x80
	lsls r4, r4, #6
	str r4, [sp]
	movs r0, #3
	movs r1, #0x10
	movs r2, #8
	bl PutSprite
	ldr r5, _080CE018  @ gUnknown_08B12AA4
	ldr r0, [r5]
	adds r0, #0x2f
	ldrb r0, [r0]
	cmp r0, #0
	bne _080CDFBC
	ldr r3, _080CE01C  @ gUnknown_08B12AC2
	str r4, [sp]
	movs r0, #3
	movs r1, #0xb0
	movs r2, #3
	bl PutSprite
_080CDFBC:
	ldr r3, _080CE020  @ gUnknown_08B12AD0
	str r4, [sp]
	movs r0, #3
	movs r1, #0xb0
	movs r2, #0xf
	bl PutSprite
	ldr r2, [r5]
	adds r0, r2, #0
	adds r0, #0x29
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r1, r2, #0
	adds r1, #0x2a
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	subs r0, r0, r1
	lsls r0, r0, #1
	adds r3, r0, #5
	adds r0, r2, #0
	adds r0, #0x2b
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r1, r2, #0
	adds r1, #0x2c
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	subs r0, r0, r1
	lsls r0, r0, #1
	adds r4, r0, #5
	adds r0, r2, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	cmp r0, #1
	beq _080CE0B8
	cmp r0, #1
	bgt _080CE024
	cmp r0, #0
	beq _080CE02A
	b _080CE11A
	.align 2, 0
_080CE014: .4byte gUnknown_08B12AA8
_080CE018: .4byte gUnknown_08B12AA4
_080CE01C: .4byte gUnknown_08B12AC2
_080CE020: .4byte gUnknown_08B12AD0
_080CE024:
	cmp r0, #2
	beq _080CE0CA
	b _080CE11A
_080CE02A:
	lsls r1, r3, #3
	movs r0, #0xc
	bl DisplayUiHand
	ldr r1, [r5]
	adds r0, r1, #0
	adds r0, #0x30
	ldrb r0, [r0]
	cmp r0, #0
	beq _080CE04A
	adds r0, r1, #0
	adds r0, #0x3c
	ldrb r0, [r0]
	cmp r0, #6
	bgt _080CE054
	b _080CE11A
_080CE04A:
	adds r0, r1, #0
	adds r0, #0x3d
	ldrb r0, [r0]
	cmp r0, #6
	ble _080CE11A
_080CE054:
	ldr r4, _080CE090  @ gUnknown_08B12AA4
	ldr r0, [r4]
	adds r0, #0x2a
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _080CE070
	ldr r2, _080CE094  @ 0x000030E0
	movs r0, #0x20
	movs r1, #0x20
	movs r3, #1
	bl sub_80B53F8
_080CE070:
	ldr r1, [r4]
	adds r0, r1, #0
	adds r0, #0x2a
	movs r2, #0
	ldrsb r2, [r0, r2]
	adds r0, #6
	ldrb r0, [r0]
	cmp r0, #0
	beq _080CE098
	adds r0, r1, #0
	adds r0, #0x3c
	ldrb r0, [r0]
	subs r0, #6
	cmp r2, r0
	blt _080CE0A4
	b _080CE11A
	.align 2, 0
_080CE090: .4byte gUnknown_08B12AA4
_080CE094: .4byte 0x000030E0
_080CE098:
	adds r0, r1, #0
	adds r0, #0x3d
	ldrb r0, [r0]
	subs r0, #6
	cmp r2, r0
	bge _080CE11A
_080CE0A4:
	ldr r2, _080CE0B4  @ 0x000030E0
	movs r0, #0x20
	movs r1, #0x88
	movs r3, #0
	bl sub_80B53F8
	b _080CE11A
	.align 2, 0
_080CE0B4: .4byte 0x000030E0
_080CE0B8:
	lsls r1, r3, #3
	movs r0, #0xc
	bl DisplayFrozenUiHand
	lsls r1, r4, #3
	movs r0, #0x50
	bl DisplayUiHand
	b _080CE11A
_080CE0CA:
	lsls r1, r3, #3
	movs r0, #0xc
	bl DisplayFrozenUiHand
	ldr r1, [r5]
	adds r0, r1, #0
	adds r0, #0x3f
	ldrb r0, [r0]
	cmp r0, #4
	bls _080CE11A
	adds r0, r1, #0
	adds r0, #0x2e
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _080CE0F8
	ldr r2, _080CE140  @ 0x000030E0
	movs r0, #0x90
	movs r1, #0x38
	movs r3, #1
	bl sub_80B53F8
_080CE0F8:
	ldr r0, [r5]
	adds r1, r0, #0
	adds r1, #0x2e
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, #0x3f
	ldrb r0, [r0]
	subs r0, #4
	cmp r1, r0
	bge _080CE11A
	ldr r2, _080CE140  @ 0x000030E0
	movs r0, #0x90
	movs r1, #0x80
	movs r3, #0
	bl sub_80B53F8
_080CE11A:
	ldr r0, _080CE144  @ gUnknown_08B12AA4
	ldr r0, [r0]
	adds r1, r0, #0
	adds r1, #0x2c
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	lsls r1, r1, #4
	adds r0, #0x3e
	ldrb r2, [r0]
	movs r0, #0xa
	movs r3, #6
	bl sub_80976CC
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080CE140: .4byte 0x000030E0
_080CE144: .4byte gUnknown_08B12AA4

	THUMB_FUNC_END sub_80CDF88

	THUMB_FUNC_START sub_80CE148
sub_80CE148: @ 0x080CE148
	push {r4, lr}
	sub sp, #8
	ldr r4, _080CE1B0  @ gUnknown_08B12AA4
	ldr r1, [r4]
	adds r0, r1, #0
	adds r0, #0x30
	ldrb r0, [r0]
	cmp r0, #0
	bne _080CE1A8
	adds r0, r1, #0
	adds r0, #0xec
	bl Text_Clear
	ldr r0, _080CE1B4  @ 0x000005D4
	bl GetStringFromIndex
	adds r3, r0, #0
	ldr r0, [r4]
	adds r0, #0xec
	ldr r1, _080CE1B8  @ gUnknown_02023130
	movs r2, #0x16
	str r2, [sp]
	str r3, [sp, #4]
	movs r2, #0
	movs r3, #0
	bl DrawTextInline
	ldr r0, [r4]
	adds r4, r0, #0
	adds r4, #0xec
	ldr r2, _080CE1BC  @ gUnknown_08B12B04
	adds r1, r0, #0
	adds r1, #0x29
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, #0x54
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	bl GetStringFromIndex
	adds r1, r0, #0
	adds r0, r4, #0
	bl Text_AppendString
_080CE1A8:
	add sp, #8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080CE1B0: .4byte gUnknown_08B12AA4
_080CE1B4: .4byte 0x000005D4
_080CE1B8: .4byte gUnknown_02023130
_080CE1BC: .4byte gUnknown_08B12B04

	THUMB_FUNC_END sub_80CE148

	THUMB_FUNC_START sub_80CE1C0
sub_80CE1C0: @ 0x080CE1C0
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r5, r0, #0
	adds r6, r1, #0
	adds r7, r2, #0
	ldr r4, _080CE1F8  @ gUnknown_08B12AA4
	lsls r1, r6, #3
	adds r1, #0x7c
	ldr r0, [r4]
	adds r0, r0, r1
	bl Text_Clear
	ldr r4, [r4]
	adds r0, r4, #0
	adds r0, #0x30
	ldrb r0, [r0]
	cmp r0, #0
	beq _080CE200
	ldr r1, _080CE1FC  @ gUnknown_08B12AE0
	adds r0, r4, #0
	adds r0, #0x40
	adds r0, r0, r5
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	b _080CE210
	.align 2, 0
_080CE1F8: .4byte gUnknown_08B12AA4
_080CE1FC: .4byte gUnknown_08B12AE0
_080CE200:
	ldr r1, _080CE23C  @ gUnknown_08B12B04
	adds r0, r4, #0
	adds r0, #0x54
	adds r0, r0, r5
	ldrb r0, [r0]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
_080CE210:
	bl GetStringFromIndex
	adds r3, r0, #0
	ldr r0, _080CE240  @ gUnknown_08B12AA4
	lsls r1, r6, #3
	adds r1, #0x7c
	ldr r0, [r0]
	adds r0, r0, r1
	lsls r1, r7, #6
	ldr r2, _080CE244  @ gUnknown_020234AC
	adds r1, r1, r2
	movs r2, #9
	str r2, [sp]
	str r3, [sp, #4]
	movs r2, #0
	movs r3, #0
	bl DrawTextInline
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080CE23C: .4byte gUnknown_08B12B04
_080CE240: .4byte gUnknown_08B12AA4
_080CE244: .4byte gUnknown_020234AC

	THUMB_FUNC_END sub_80CE1C0

	THUMB_FUNC_START sub_80CE248
sub_80CE248: @ 0x080CE248
	push {r4, r5, r6, lr}
	ldr r0, _080CE260  @ gUnknown_08B12AA4
	ldr r1, [r0]
	adds r0, r1, #0
	adds r0, #0x30
	ldrb r0, [r0]
	cmp r0, #0
	beq _080CE264
	adds r0, r1, #0
	adds r0, #0x3c
	b _080CE268
	.align 2, 0
_080CE260: .4byte gUnknown_08B12AA4
_080CE264:
	adds r0, r1, #0
	adds r0, #0x3d
_080CE268:
	ldrb r6, [r0]
	movs r4, #0
	movs r5, #5
_080CE26E:
	cmp r4, r6
	bge _080CE27C
	adds r0, r4, #0
	adds r1, r4, #0
	adds r2, r5, #0
	bl sub_80CE1C0
_080CE27C:
	adds r5, #2
	adds r4, #1
	cmp r4, #5
	ble _080CE26E
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80CE248

	THUMB_FUNC_START sub_80CE28C
sub_80CE28C: @ 0x080CE28C
	push {r4, r5, lr}
	movs r0, #0xa0
	movs r2, #0
	ldr r5, _080CE2D8  @ gBG1TilemapBuffer
	movs r4, #0
_080CE296:
	movs r1, #0
	adds r3, r0, #0
	adds r3, #0x20
	adds r2, #1
	adds r0, #1
	lsls r0, r0, #1
	adds r0, r0, r5
_080CE2A4:
	strh r4, [r0]
	adds r0, #2
	adds r1, #1
	cmp r1, #0x1b
	ble _080CE2A4
	adds r0, r3, #0
	cmp r2, #0xb
	ble _080CE296
	ldr r0, _080CE2DC  @ gBG0TilemapBuffer
	movs r3, #0
	ldr r1, _080CE2E0  @ 0x000004C2
	adds r2, r0, r1
	subs r1, #0x40
	adds r0, r0, r1
	movs r1, #0x1b
_080CE2C2:
	strh r3, [r0]
	strh r3, [r2]
	adds r2, #2
	adds r0, #2
	subs r1, #1
	cmp r1, #0
	bge _080CE2C2
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080CE2D8: .4byte gBG1TilemapBuffer
_080CE2DC: .4byte gBG0TilemapBuffer
_080CE2E0: .4byte 0x000004C2

	THUMB_FUNC_END sub_80CE28C

	THUMB_FUNC_START sub_80CE2E4
sub_80CE2E4: @ 0x080CE2E4
	push {lr}
	movs r0, #2
	bl BG_EnableSyncByMask
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80CE2E4

	THUMB_FUNC_START sub_80CE2F0
sub_80CE2F0: @ 0x080CE2F0
	push {lr}
	movs r0, #3
	bl BG_EnableSyncByMask
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80CE2F0

	THUMB_FUNC_START sub_80CE2FC
sub_80CE2FC: @ 0x080CE2FC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	ldr r4, [r0, #0x34]
	adds r0, r4, #0
	movs r1, #6
	bl __modsi3
	ldr r5, _080CE37C  @ gUnknown_08B12AA4
	lsls r0, r0, #3
	adds r6, r0, #0
	adds r6, #0xb4
	ldr r0, [r5]
	adds r0, r0, r6
	bl Text_Clear
	ldr r0, _080CE380  @ gUnknown_08B19E0C
	mov r8, r0
	ldr r0, [r5]
	adds r0, #0x68
	adds r0, r0, r4
	ldrb r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	add r0, r8
	ldrh r0, [r0, #8]
	bl CheckEventId
	lsls r0, r0, #0x18
	movs r7, #0
	cmp r0, #0
	bne _080CE342
	movs r7, #4
_080CE342:
	ldr r0, [r5]
	adds r0, #0x68
	adds r0, r0, r4
	ldrb r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	add r0, r8
	ldrh r0, [r0, #2]
	bl GetStringFromIndex
	adds r3, r0, #0
	ldr r0, [r5]
	adds r0, r0, r6
	ldr r1, _080CE384  @ gUnknown_020235FE
	movs r2, #0x12
	str r2, [sp]
	str r3, [sp, #4]
	adds r2, r7, #0
	movs r3, #0
	bl DrawTextInline
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080CE37C: .4byte gUnknown_08B12AA4
_080CE380: .4byte gUnknown_08B19E0C
_080CE384: .4byte gUnknown_020235FE

	THUMB_FUNC_END sub_80CE2FC

	THUMB_FUNC_START sub_80CE388
sub_80CE388: @ 0x080CE388
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	ldr r4, [r0, #0x34]
	adds r0, r4, #0
	movs r1, #6
	bl __modsi3
	ldr r5, _080CE408  @ gUnknown_08B12AA4
	lsls r0, r0, #3
	adds r6, r0, #0
	adds r6, #0xb4
	ldr r0, [r5]
	adds r0, r0, r6
	bl Text_Clear
	ldr r0, _080CE40C  @ gUnknown_08B19E0C
	mov r8, r0
	ldr r0, [r5]
	adds r0, #0x68
	adds r0, r0, r4
	ldrb r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	add r0, r8
	ldrh r0, [r0, #8]
	bl CheckEventId
	lsls r0, r0, #0x18
	movs r7, #0
	cmp r0, #0
	bne _080CE3CE
	movs r7, #4
_080CE3CE:
	ldr r0, [r5]
	adds r0, #0x68
	adds r0, r0, r4
	ldrb r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	add r0, r8
	ldrh r0, [r0, #2]
	bl GetStringFromIndex
	adds r3, r0, #0
	ldr r0, [r5]
	adds r0, r0, r6
	ldr r1, _080CE410  @ gUnknown_0202387E
	movs r2, #0x12
	str r2, [sp]
	str r3, [sp, #4]
	adds r2, r7, #0
	movs r3, #0
	bl DrawTextInline
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080CE408: .4byte gUnknown_08B12AA4
_080CE40C: .4byte gUnknown_08B19E0C
_080CE410: .4byte gUnknown_0202387E

	THUMB_FUNC_END sub_80CE388

	THUMB_FUNC_START sub_80CE414
sub_80CE414: @ 0x080CE414
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	movs r0, #5
	str r0, [sp, #8]
	movs r5, #0
	mov r8, r5
	ldr r0, _080CE47C  @ gUnknown_08B12AA4
	ldr r0, [r0]
	adds r0, #0x3e
	mov r1, r8
	strb r1, [r0]
	ldr r1, _080CE480  @ gUnknown_08B19E0C
	ldrb r0, [r1]
	cmp r0, #0xc
	beq _080CE4B8
	movs r6, #0
_080CE43C:
	adds r4, r6, r1
	ldrh r0, [r4, #6]
	bl CheckEventId
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080CE4A8
	ldr r0, _080CE47C  @ gUnknown_08B12AA4
	ldr r2, [r0]
	adds r0, r2, #0
	adds r0, #0x30
	ldrb r0, [r0]
	cmp r0, #0
	beq _080CE484
	adds r0, r2, #0
	adds r0, #0x29
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r1, r2, #0
	adds r1, #0x40
	adds r1, r1, r0
	ldrb r0, [r4, #1]
	ldrb r1, [r1]
	cmp r0, r1
	bne _080CE4A8
	adds r0, r2, #0
	adds r0, #0x68
	adds r0, r0, r5
	mov r2, r8
	strb r2, [r0]
	b _080CE4A6
	.align 2, 0
_080CE47C: .4byte gUnknown_08B12AA4
_080CE480: .4byte gUnknown_08B19E0C
_080CE484:
	adds r0, r2, #0
	adds r0, #0x29
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r1, r2, #0
	adds r1, #0x54
	adds r1, r1, r0
	ldrb r0, [r4]
	ldrb r1, [r1]
	cmp r0, r1
	bne _080CE4A8
	adds r0, r2, #0
	adds r0, #0x68
	adds r0, r0, r5
	mov r1, r8
	strb r1, [r0]
_080CE4A6:
	adds r5, #1
_080CE4A8:
	adds r6, #0xc
	movs r2, #1
	add r8, r2
	ldr r1, _080CE57C  @ gUnknown_08B19E0C
	adds r0, r6, r1
	ldrb r0, [r0]
	cmp r0, #0xc
	bne _080CE43C
_080CE4B8:
	ldr r1, _080CE580  @ gUnknown_08B12AA4
	ldr r0, [r1]
	adds r0, #0x3e
	strb r5, [r0]
	lsls r0, r5, #0x18
	lsrs r6, r0, #0x18
	ldr r0, [r1]
	adds r0, #0x2c
	movs r4, #0
	ldrsb r4, [r0, r4]
	adds r5, r4, #0
	movs r0, #0
	mov r8, r0
	cmp r6, #0
	beq _080CE56C
	mov sl, r1
_080CE4D8:
	adds r0, r5, #0
	movs r1, #6
	bl __modsi3
	adds r5, r0, #0
	lsls r0, r5, #3
	adds r7, r0, #0
	adds r7, #0xb4
	mov r1, sl
	ldr r0, [r1]
	adds r0, r0, r7
	bl Text_Clear
	mov r2, sl
	ldr r0, [r2]
	adds r0, #0x68
	adds r0, r0, r4
	ldrb r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _080CE57C  @ gUnknown_08B19E0C
	adds r0, r0, r1
	ldrh r0, [r0, #8]
	bl CheckEventId
	lsls r0, r0, #0x18
	movs r2, #0
	mov r9, r2
	cmp r0, #0
	bne _080CE51A
	movs r0, #4
	mov r9, r0
_080CE51A:
	mov r1, sl
	ldr r0, [r1]
	adds r0, #0x68
	adds r0, r0, r4
	ldrb r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r2, _080CE57C  @ gUnknown_08B19E0C
	adds r0, r0, r2
	ldrh r0, [r0, #2]
	bl GetStringFromIndex
	adds r3, r0, #0
	mov r1, sl
	ldr r0, [r1]
	adds r0, r0, r7
	ldr r2, [sp, #8]
	lsls r1, r2, #6
	ldr r2, _080CE584  @ gUnknown_020234BE
	adds r1, r1, r2
	movs r2, #0x12
	str r2, [sp]
	str r3, [sp, #4]
	mov r2, r9
	movs r3, #0
	bl DrawTextInline
	ldr r0, [sp, #8]
	adds r0, #2
	str r0, [sp, #8]
	adds r5, #1
	subs r6, #1
	adds r4, #1
	movs r1, #1
	add r8, r1
	mov r2, r8
	cmp r2, #5
	bgt _080CE56C
	cmp r6, #0
	bne _080CE4D8
_080CE56C:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080CE57C: .4byte gUnknown_08B19E0C
_080CE580: .4byte gUnknown_08B12AA4
_080CE584: .4byte gUnknown_020234BE

	THUMB_FUNC_END sub_80CE414

	THUMB_FUNC_START sub_80CE588
sub_80CE588: @ 0x080CE588
	push {r4, r5, lr}
	movs r0, #0xa0
	movs r1, #0
	ldr r5, _080CE5B8  @ gBG1TilemapBuffer
	movs r4, #0
_080CE592:
	adds r2, r0, #0
	adds r2, #0x20
	adds r3, r1, #1
	adds r0, #0xa
	movs r1, #0x12
	lsls r0, r0, #1
	adds r0, r0, r5
_080CE5A0:
	strh r4, [r0]
	adds r0, #2
	subs r1, #1
	cmp r1, #0
	bge _080CE5A0
	adds r0, r2, #0
	adds r1, r3, #0
	cmp r1, #0xb
	ble _080CE592
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080CE5B8: .4byte gBG1TilemapBuffer

	THUMB_FUNC_END sub_80CE588

	THUMB_FUNC_START sub_80CE5BC
sub_80CE5BC: @ 0x080CE5BC
	push {lr}
	sub sp, #4
	adds r1, r0, #0
	cmp r1, #0
	beq _080CE5DA
	ldrb r0, [r1]
	cmp r0, #0
	beq _080CE5DA
_080CE5CC:
	ldrb r0, [r1]
	cmp r0, #0
	beq _080CE5DA
	cmp r0, #1
	bne _080CE5DE
	adds r0, r1, #1
	b _080CE5EA
_080CE5DA:
	movs r0, #0
	b _080CE5EA
_080CE5DE:
	adds r0, r1, #0
	mov r1, sp
	bl GetCharTextWidth
	adds r1, r0, #0
	b _080CE5CC
_080CE5EA:
	add sp, #4
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80CE5BC

	THUMB_FUNC_START sub_80CE5F0
sub_80CE5F0: @ 0x080CE5F0
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	sub sp, #8
	mov r8, r0
	adds r5, r1, #0
	movs r4, #1
	ldr r0, _080CE618  @ gUnknown_08B19E0C
	mov r2, r8
	lsls r1, r2, #1
	add r1, r8
	lsls r1, r1, #2
	adds r1, r1, r0
	ldrh r0, [r1, #4]
	bl GetStringFromIndex
	adds r6, r0, #0
	b _080CE61E
	.align 2, 0
_080CE618: .4byte gUnknown_08B19E0C
_080CE61C:
	adds r4, #1
_080CE61E:
	adds r0, r6, #0
	bl sub_80CE5BC
	adds r6, r0, #0
	cmp r6, #0
	bne _080CE61C
	ldr r0, _080CE654  @ gUnknown_08B12AA4
	ldr r1, [r0]
	adds r1, #0x3f
	strb r4, [r1]
	ldr r1, [r0]
	adds r1, #0x2e
	movs r7, #0
	ldrsb r7, [r1, r7]
	cmp r5, #0
	beq _080CE672
	cmp r4, #4
	ble _080CE660
	cmp r5, #1
	bne _080CE658
	subs r1, r4, #4
	adds r7, #4
	cmp r7, r1
	ble _080CE660
	adds r7, r1, #0
	b _080CE660
	.align 2, 0
_080CE654: .4byte gUnknown_08B12AA4
_080CE658:
	subs r7, #4
	cmp r7, #0
	bge _080CE660
	movs r7, #0
_080CE660:
	cmp r5, #0
	beq _080CE672
	ldr r0, [r0]
	adds r0, #0x2e
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, r7
	beq _080CE73A
_080CE672:
	bl sub_80CE588
	ldr r5, _080CE6C0  @ gUnknown_08B12AA4
	ldr r0, [r5]
	adds r0, #0x2e
	strb r7, [r0]
	ldr r0, [r5]
	adds r0, #0xb4
	bl Text_Clear
	ldr r0, _080CE6C4  @ gUnknown_08B19E0C
	mov r1, r8
	lsls r4, r1, #1
	add r4, r8
	lsls r4, r4, #2
	adds r4, r4, r0
	ldrh r0, [r4, #2]
	bl GetStringFromIndex
	adds r3, r0, #0
	ldr r0, [r5]
	adds r0, #0xb4
	ldr r1, _080CE6C8  @ gUnknown_020235FC
	movs r2, #0x12
	str r2, [sp]
	str r3, [sp, #4]
	movs r2, #3
	movs r3, #2
	bl DrawTextInline
	ldrh r0, [r4, #4]
	bl GetStringFromIndex
	adds r6, r0, #0
	movs r2, #0
	mov r8, r2
	adds r0, r7, #4
	mov r9, r0
	b _080CE71E
	.align 2, 0
_080CE6C0: .4byte gUnknown_08B12AA4
_080CE6C4: .4byte gUnknown_08B19E0C
_080CE6C8: .4byte gUnknown_020235FC
_080CE6CC:
	cmp r8, r7
	blt _080CE71A
	mov r0, r8
	movs r1, #5
	bl __modsi3
	adds r4, r0, #0
	ldr r5, _080CE748  @ gUnknown_08B12AA4
	lsls r4, r4, #3
	adds r4, #0xbc
	ldr r0, [r5]
	adds r0, r0, r4
	bl Text_Clear
	ldr r0, [r5]
	adds r2, r0, r4
	mov r1, r8
	subs r0, r1, r7
	adds r1, r0, #0
	cmp r0, #0
	bge _080CE6F8
	adds r1, r0, #3
_080CE6F8:
	asrs r1, r1, #2
	lsls r1, r1, #2
	subs r1, r0, r1
	lsls r1, r1, #7
	movs r0, #0x80
	lsls r0, r0, #2
	adds r1, r1, r0
	ldr r0, _080CE74C  @ gUnknown_020234BE
	adds r1, r1, r0
	movs r0, #0x11
	str r0, [sp]
	str r6, [sp, #4]
	adds r0, r2, #0
	movs r2, #0
	movs r3, #0
	bl DrawTextInline
_080CE71A:
	movs r1, #1
	add r8, r1
_080CE71E:
	cmp r8, r9
	bge _080CE734
	mov r2, r8
	cmp r2, #0
	beq _080CE6CC
	adds r0, r6, #0
	bl sub_80CE5BC
	adds r6, r0, #0
	cmp r6, #0
	bne _080CE6CC
_080CE734:
	movs r0, #2
	bl BG_EnableSyncByMask
_080CE73A:
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080CE748: .4byte gUnknown_08B12AA4
_080CE74C: .4byte gUnknown_020234BE

	THUMB_FUNC_END sub_80CE5F0

	THUMB_FUNC_START sub_80CE750
sub_80CE750: @ 0x080CE750
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	mov r8, r0
	mov r9, r1
	movs r4, #0xd0
	lsls r4, r4, #1
	ldr r0, _080CE774  @ gUnknown_08B12AA4
	ldr r0, [r0]
	adds r0, #0x2f
	ldrb r0, [r0]
	cmp r0, #0
	beq _080CE778
	cmp r0, #1
	beq _080CE7DC
	b _080CE83A
	.align 2, 0
_080CE774: .4byte gUnknown_08B12AA4
_080CE778:
	movs r0, #0
	ldr r7, _080CE7D8  @ gBG1TilemapBuffer
_080CE77C:
	movs r1, #0x40
	negs r1, r1
	adds r1, r1, r4
	mov ip, r1
	adds r6, r0, #1
	adds r3, r4, #0
	adds r3, #0x22
	adds r2, r4, #0
	adds r2, #0x62
	adds r1, r4, #2
	adds r0, r4, #0
	adds r0, #0x42
	movs r5, #7
	lsls r0, r0, #1
	adds r4, r0, r7
	lsls r1, r1, #1
	adds r1, r1, r7
	lsls r2, r2, #1
	adds r2, r2, r7
	lsls r3, r3, #1
	adds r3, r3, r7
_080CE7A6:
	ldrh r0, [r1]
	strh r0, [r4]
	ldrh r0, [r3]
	strh r0, [r2]
	adds r3, #2
	adds r2, #2
	adds r1, #2
	adds r4, #2
	subs r5, #1
	cmp r5, #0
	bge _080CE7A6
	mov r4, ip
	adds r0, r6, #0
	cmp r0, #4
	ble _080CE77C
	mov r0, r9
	movs r1, #6
	bl __modsi3
	adds r1, r0, #0
	mov r0, r9
	movs r2, #5
	bl sub_80CE1C0
	b _080CE83A
	.align 2, 0
_080CE7D8: .4byte gBG1TilemapBuffer
_080CE7DC:
	movs r0, #0
	ldr r1, _080CE850  @ gUnknown_08B12BEC
	mov sl, r1
	ldr r7, _080CE854  @ gBG1TilemapBuffer
_080CE7E4:
	movs r1, #0x40
	negs r1, r1
	adds r1, r1, r4
	mov ip, r1
	adds r6, r0, #1
	adds r3, r4, #0
	adds r3, #0x2a
	adds r2, r4, #0
	adds r2, #0x6a
	adds r1, r4, #0
	adds r1, #0xa
	adds r0, r4, #0
	adds r0, #0x4a
	movs r5, #0x12
	lsls r0, r0, #1
	adds r4, r0, r7
	lsls r1, r1, #1
	adds r1, r1, r7
	lsls r2, r2, #1
	adds r2, r2, r7
	lsls r3, r3, #1
	adds r3, r3, r7
_080CE810:
	ldrh r0, [r1]
	strh r0, [r4]
	ldrh r0, [r3]
	strh r0, [r2]
	adds r3, #2
	adds r2, #2
	adds r1, #2
	adds r4, #2
	subs r5, #1
	cmp r5, #0
	bge _080CE810
	mov r4, ip
	adds r0, r6, #0
	cmp r0, #4
	ble _080CE7E4
	mov r0, sl
	mov r1, r8
	bl Proc_Start
	mov r1, r9
	str r1, [r0, #0x34]
_080CE83A:
	movs r0, #2
	bl BG_EnableSyncByMask
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080CE850: .4byte gUnknown_08B12BEC
_080CE854: .4byte gBG1TilemapBuffer

	THUMB_FUNC_END sub_80CE750

	THUMB_FUNC_START sub_80CE858
sub_80CE858: @ 0x080CE858
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	mov r8, r0
	mov r9, r1
	movs r4, #0xa0
	ldr r0, _080CE87C  @ gUnknown_08B12AA4
	ldr r0, [r0]
	adds r0, #0x2f
	ldrb r0, [r0]
	cmp r0, #0
	beq _080CE880
	cmp r0, #1
	beq _080CE8E4
	b _080CE940
	.align 2, 0
_080CE87C: .4byte gUnknown_08B12AA4
_080CE880:
	movs r0, #0
	ldr r7, _080CE8E0  @ gBG1TilemapBuffer
_080CE884:
	movs r1, #0x40
	adds r1, r1, r4
	mov ip, r1
	adds r6, r0, #1
	adds r3, r4, #0
	adds r3, #0x62
	adds r2, r4, #0
	adds r2, #0x22
	adds r1, r4, #0
	adds r1, #0x42
	adds r0, r4, #2
	movs r5, #7
	lsls r0, r0, #1
	adds r4, r0, r7
	lsls r1, r1, #1
	adds r1, r1, r7
	lsls r2, r2, #1
	adds r2, r2, r7
	lsls r3, r3, #1
	adds r3, r3, r7
_080CE8AC:
	ldrh r0, [r1]
	strh r0, [r4]
	ldrh r0, [r3]
	strh r0, [r2]
	adds r3, #2
	adds r2, #2
	adds r1, #2
	adds r4, #2
	subs r5, #1
	cmp r5, #0
	bge _080CE8AC
	mov r4, ip
	adds r0, r6, #0
	cmp r0, #4
	ble _080CE884
	mov r0, r9
	movs r1, #6
	bl __modsi3
	adds r1, r0, #0
	mov r0, r9
	movs r2, #0xf
	bl sub_80CE1C0
	b _080CE940
	.align 2, 0
_080CE8E0: .4byte gBG1TilemapBuffer
_080CE8E4:
	movs r0, #0
	ldr r1, _080CE954  @ gUnknown_08B12C14
	mov sl, r1
	ldr r7, _080CE958  @ gBG1TilemapBuffer
_080CE8EC:
	movs r1, #0x40
	adds r1, r1, r4
	mov ip, r1
	adds r6, r0, #1
	adds r3, r4, #0
	adds r3, #0x6a
	adds r2, r4, #0
	adds r2, #0x2a
	adds r1, r4, #0
	adds r1, #0x4a
	adds r0, r4, #0
	adds r0, #0xa
	movs r5, #0x12
	lsls r0, r0, #1
	adds r4, r0, r7
	lsls r1, r1, #1
	adds r1, r1, r7
	lsls r2, r2, #1
	adds r2, r2, r7
	lsls r3, r3, #1
	adds r3, r3, r7
_080CE916:
	ldrh r0, [r1]
	strh r0, [r4]
	ldrh r0, [r3]
	strh r0, [r2]
	adds r3, #2
	adds r2, #2
	adds r1, #2
	adds r4, #2
	subs r5, #1
	cmp r5, #0
	bge _080CE916
	mov r4, ip
	adds r0, r6, #0
	cmp r0, #4
	ble _080CE8EC
	mov r0, sl
	mov r1, r8
	bl Proc_Start
	mov r1, r9
	str r1, [r0, #0x34]
_080CE940:
	movs r0, #2
	bl BG_EnableSyncByMask
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080CE954: .4byte gUnknown_08B12C14
_080CE958: .4byte gBG1TilemapBuffer

	THUMB_FUNC_END sub_80CE858

	THUMB_FUNC_START sub_80CE95C
sub_80CE95C: @ 0x080CE95C
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r7, r0, #0
	ldr r5, [r7, #0x34]
	adds r0, r5, #0
	movs r1, #5
	bl __modsi3
	adds r4, r0, #0
	ldr r2, _080CE998  @ gUnknown_08B19E0C
	ldr r0, _080CE99C  @ gUnknown_08B12AA4
	ldr r0, [r0]
	adds r1, r0, #0
	adds r1, #0x2b
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, #0x68
	adds r0, r0, r1
	ldrb r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrh r0, [r0, #4]
	bl GetStringFromIndex
	adds r6, r0, #0
	b _080CE9A2
	.align 2, 0
_080CE998: .4byte gUnknown_08B19E0C
_080CE99C: .4byte gUnknown_08B12AA4
_080CE9A0:
	subs r5, #1
_080CE9A2:
	cmp r5, #0
	beq _080CE9B2
	adds r0, r6, #0
	bl sub_80CE5BC
	adds r6, r0, #0
	cmp r6, #0
	bne _080CE9A0
_080CE9B2:
	ldr r5, _080CE9E0  @ gUnknown_08B12AA4
	lsls r4, r4, #3
	adds r4, #0xbc
	ldr r0, [r5]
	adds r0, r0, r4
	bl Text_Clear
	ldr r0, [r5]
	adds r0, r0, r4
	ldr r1, _080CE9E4  @ gUnknown_0202393E
	movs r2, #0x11
	str r2, [sp]
	str r6, [sp, #4]
	movs r2, #0
	movs r3, #0
	bl DrawTextInline
	movs r0, #0
	str r0, [r7, #0x34]
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080CE9E0: .4byte gUnknown_08B12AA4
_080CE9E4: .4byte gUnknown_0202393E

	THUMB_FUNC_END sub_80CE95C

	THUMB_FUNC_START sub_80CE9E8
sub_80CE9E8: @ 0x080CE9E8
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	ldr r0, [r7, #0x38]
	cmp r0, #0
	bne _080CEA60
	movs r3, #0xe0
	lsls r3, r3, #1
	movs r6, #0x98
	lsls r6, r6, #2
	movs r0, #0
	ldr r5, _080CEA5C  @ gBG1TilemapBuffer
_080CE9FE:
	movs r1, #0x20
	negs r1, r1
	adds r1, r1, r3
	mov ip, r1
	adds r4, r0, #1
	adds r1, r3, #0
	adds r1, #0xa
	adds r0, r3, #0
	adds r0, #0x2a
	movs r3, #0x12
	lsls r0, r0, #1
	adds r2, r0, r5
	lsls r1, r1, #1
	adds r1, r1, r5
_080CEA1A:
	ldrh r0, [r1]
	strh r0, [r2]
	adds r1, #2
	adds r2, #2
	subs r3, #1
	cmp r3, #0
	bge _080CEA1A
	mov r3, ip
	adds r0, r4, #0
	cmp r0, #6
	ble _080CE9FE
	ldr r0, [r7, #0x34]
	cmp r0, #0
	beq _080CEA38
	subs r6, #0x20
_080CEA38:
	ldr r2, _080CEA5C  @ gBG1TilemapBuffer
	adds r1, r6, #0
	adds r1, #0xa
	adds r0, r3, #0
	adds r0, #0x2a
	movs r3, #0x12
	lsls r0, r0, #1
	adds r4, r0, r2
	lsls r1, r1, #1
	adds r1, r1, r2
_080CEA4C:
	ldrh r0, [r1]
	strh r0, [r4]
	adds r1, #2
	adds r4, #2
	subs r3, #1
	cmp r3, #0
	bge _080CEA4C
	b _080CEAC6
	.align 2, 0
_080CEA5C: .4byte gBG1TilemapBuffer
_080CEA60:
	movs r3, #0x80
	lsls r3, r3, #1
	movs r6, #0x88
	lsls r6, r6, #2
	movs r0, #0
	ldr r5, _080CEAD8  @ gBG1TilemapBuffer
_080CEA6C:
	adds r4, r0, #1
	movs r0, #0x20
	adds r0, r0, r3
	mov ip, r0
	adds r1, r3, #0
	adds r1, #0x2a
	adds r0, r3, #0
	adds r0, #0xa
	movs r3, #0x12
	lsls r0, r0, #1
	adds r2, r0, r5
	lsls r1, r1, #1
	adds r1, r1, r5
_080CEA86:
	ldrh r0, [r1]
	strh r0, [r2]
	adds r1, #2
	adds r2, #2
	subs r3, #1
	cmp r3, #0
	bge _080CEA86
	mov r3, ip
	adds r0, r4, #0
	cmp r0, #6
	ble _080CEA6C
	ldr r0, [r7, #0x34]
	cmp r0, #0
	beq _080CEAA4
	adds r6, #0x20
_080CEAA4:
	ldr r2, _080CEAD8  @ gBG1TilemapBuffer
	adds r1, r6, #0
	adds r1, #0x2a
	adds r0, r3, #0
	adds r0, #0xa
	movs r3, #0x12
	lsls r0, r0, #1
	adds r4, r0, r2
	lsls r1, r1, #1
	adds r1, r1, r2
_080CEAB8:
	ldrh r0, [r1]
	strh r0, [r4]
	adds r1, #2
	adds r4, #2
	subs r3, #1
	cmp r3, #0
	bge _080CEAB8
_080CEAC6:
	movs r0, #2
	bl BG_EnableSyncByMask
	ldr r0, [r7, #0x34]
	cmp r0, #0
	bne _080CEADC
	movs r0, #1
	str r0, [r7, #0x34]
	b _080CEAE2
	.align 2, 0
_080CEAD8: .4byte gBG1TilemapBuffer
_080CEADC:
	adds r0, r7, #0
	bl Proc_Break
_080CEAE2:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80CE9E8

	THUMB_FUNC_START sub_80CEAE8
sub_80CEAE8: @ 0x080CEAE8
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	movs r5, #0
	ldr r3, _080CEB5C  @ gUnknown_08B19E0C
	movs r1, #0
	ldr r2, _080CEB60  @ gUnknown_08B12AA4
_080CEAF4:
	mov r4, sp
	adds r0, r4, r5
	strb r1, [r0]
	ldr r0, [r2]
	adds r0, #0x54
	adds r0, r0, r5
	strb r1, [r0]
	adds r5, #1
	cmp r5, #0x13
	ble _080CEAF4
	ldrb r4, [r3]
	cmp r4, #0xc
	beq _080CEB2A
	adds r5, r3, #0
_080CEB10:
	ldrh r0, [r5, #6]
	bl CheckEventId
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080CEB22
	mov r1, sp
	adds r0, r1, r4
	strb r4, [r0]
_080CEB22:
	adds r5, #0xc
	ldrb r4, [r5]
	cmp r4, #0xc
	bne _080CEB10
_080CEB2A:
	ldr r0, _080CEB60  @ gUnknown_08B12AA4
	ldr r1, [r0]
	adds r1, #0x3d
	movs r2, #0
	strb r2, [r1]
	movs r5, #0
	adds r6, r0, #0
	adds r7, r6, #0
_080CEB3A:
	mov r4, sp
	adds r0, r4, r5
	ldrb r4, [r0]
	cmp r4, #0
	beq _080CEB94
	ldr r1, [r6]
	adds r2, r1, #0
	adds r2, #0x3d
	ldrb r0, [r2]
	cmp r0, #0
	bne _080CEB64
	adds r0, r1, #0
	adds r0, #0x54
	strb r4, [r0]
	ldr r1, [r7]
	b _080CEB8C
	.align 2, 0
_080CEB5C: .4byte gUnknown_08B19E0C
_080CEB60: .4byte gUnknown_08B12AA4
_080CEB64:
	movs r3, #0
	ldrb r2, [r2]
	cmp r3, r2
	bge _080CEB78
	adds r0, r1, #0
	adds r0, #0x54
	ldrb r0, [r0]
	cmp r0, r4
	bne _080CEB78
	movs r3, #1
_080CEB78:
	cmp r3, #0
	bne _080CEB94
	ldr r0, [r6]
	adds r1, r0, #0
	adds r1, #0x3d
	adds r0, #0x54
	ldrb r1, [r1]
	adds r0, r0, r1
	strb r4, [r0]
	ldr r1, [r6]
_080CEB8C:
	adds r1, #0x3d
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
_080CEB94:
	adds r5, #1
	cmp r5, #0xb
	ble _080CEB3A
	add sp, #0x14
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80CEAE8

	THUMB_FUNC_START sub_80CEBA4
sub_80CEBA4: @ 0x080CEBA4
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	movs r5, #0
	ldr r6, _080CEC20  @ gUnknown_08B19E0C
	movs r4, #0xff
	ldr r3, _080CEC24  @ gUnknown_08B12AA4
	movs r2, #0
_080CEBB2:
	mov r1, sp
	adds r0, r1, r5
	ldrb r1, [r0]
	orrs r1, r4
	strb r1, [r0]
	ldr r0, [r3]
	adds r0, #0x40
	adds r0, r0, r5
	strb r2, [r0]
	adds r5, #1
	cmp r5, #0x13
	ble _080CEBB2
	ldrb r2, [r6]
	cmp r2, #0xc
	beq _080CEBEE
	adds r4, r6, #0
_080CEBD2:
	ldrh r0, [r4, #6]
	bl CheckEventId
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080CEBE6
	ldrb r2, [r4, #1]
	mov r1, sp
	adds r0, r1, r2
	strb r2, [r0]
_080CEBE6:
	adds r4, #0xc
	ldrb r2, [r4]
	cmp r2, #0xc
	bne _080CEBD2
_080CEBEE:
	ldr r0, _080CEC24  @ gUnknown_08B12AA4
	ldr r1, [r0]
	adds r1, #0x3c
	movs r2, #0
	strb r2, [r1]
	movs r5, #0
	adds r6, r0, #0
	adds r7, r6, #0
_080CEBFE:
	mov r0, sp
	adds r1, r0, r5
	ldrb r0, [r1]
	cmp r0, #0xff
	beq _080CEC58
	adds r2, r0, #0
	ldr r1, [r6]
	adds r3, r1, #0
	adds r3, #0x3c
	ldrb r0, [r3]
	cmp r0, #0
	bne _080CEC28
	adds r0, r1, #0
	adds r0, #0x40
	strb r2, [r0]
	ldr r1, [r7]
	b _080CEC50
	.align 2, 0
_080CEC20: .4byte gUnknown_08B19E0C
_080CEC24: .4byte gUnknown_08B12AA4
_080CEC28:
	movs r4, #0
	ldrb r3, [r3]
	cmp r4, r3
	bge _080CEC3C
	adds r0, r1, #0
	adds r0, #0x40
	ldrb r0, [r0]
	cmp r0, r2
	bne _080CEC3C
	movs r4, #1
_080CEC3C:
	cmp r4, #0
	bne _080CEC58
	ldr r0, [r6]
	adds r1, r0, #0
	adds r1, #0x3c
	adds r0, #0x40
	ldrb r1, [r1]
	adds r0, r0, r1
	strb r2, [r0]
	ldr r1, [r6]
_080CEC50:
	adds r1, #0x3c
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
_080CEC58:
	adds r5, #1
	cmp r5, #0xb
	ble _080CEBFE
	add sp, #0x14
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80CEBA4

	THUMB_FUNC_START sub_80CEC68
sub_80CEC68: @ 0x080CEC68
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	movs r0, #0xa0
	movs r1, #0
	ldr r2, _080CECA8  @ gBG2TilemapBuffer
	mov ip, r2
	ldr r7, _080CECAC  @ 0x00000FFF
_080CEC78:
	adds r4, r0, #0
	adds r4, #0x20
	adds r5, r1, #1
	lsls r0, r0, #1
	mov r1, ip
	adds r2, r0, r1
	movs r3, #8
_080CEC86:
	ldrh r1, [r2]
	adds r0, r7, #0
	ands r0, r1
	adds r0, r6, r0
	strh r0, [r2]
	adds r2, #2
	subs r3, #1
	cmp r3, #0
	bge _080CEC86
	adds r0, r4, #0
	adds r1, r5, #0
	cmp r1, #0xb
	ble _080CEC78
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080CECA8: .4byte gBG2TilemapBuffer
_080CECAC: .4byte 0x00000FFF

	THUMB_FUNC_END sub_80CEC68

	THUMB_FUNC_START sub_80CECB0
sub_80CECB0: @ 0x080CECB0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	str r0, [sp, #4]
	movs r0, #0
	mov sl, r0
	bl SetupBackgrounds
	ldr r5, _080CEED0  @ gUnknown_08B12AA4
	ldr r0, [r5]
	adds r0, #0x2f
	mov r1, sl
	strb r1, [r0]
	movs r0, #0xb3
	bl CheckEventId
	ldr r1, [r5]
	adds r1, #0x30
	strb r0, [r1]
	ldr r0, [r5]
	adds r0, #0x29
	mov r2, sl
	strb r2, [r0]
	ldr r0, [r5]
	adds r0, #0x2a
	strb r2, [r0]
	ldr r0, [r5]
	adds r0, #0x2b
	strb r2, [r0]
	ldr r0, [r5]
	adds r0, #0x2c
	strb r2, [r0]
	bl sub_80CEAE8
	bl sub_80CEBA4
	bl LoadUiFrameGraphics
	ldr r7, _080CEED4  @ gLCDControlBuffer
	ldrb r0, [r7, #1]
	movs r1, #1
	mov r9, r1
	mov r2, r9
	orrs r0, r2
	movs r1, #2
	orrs r0, r1
	movs r2, #4
	mov r8, r2
	mov r1, r8
	orrs r0, r1
	movs r6, #8
	orrs r0, r6
	movs r4, #0x10
	orrs r0, r4
	strb r0, [r7, #1]
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
	movs r0, #3
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	ldr r0, _080CEED8  @ gBG0TilemapBuffer
	movs r1, #0
	bl BG_Fill
	ldr r0, _080CEEDC  @ gBG1TilemapBuffer
	movs r1, #0
	bl BG_Fill
	ldr r0, _080CEEE0  @ gBG2TilemapBuffer
	movs r1, #0
	bl BG_Fill
	ldr r0, _080CEEE4  @ gBG3TilemapBuffer
	movs r1, #0
	bl BG_Fill
	ldrb r0, [r7, #1]
	movs r1, #0x20
	orrs r0, r1
	movs r1, #0x41
	negs r1, r1
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r7, #1]
	adds r0, r7, #0
	adds r0, #0x2d
	mov r2, sl
	strb r2, [r0]
	adds r1, r7, #0
	adds r1, #0x31
	movs r0, #0x28
	strb r0, [r1]
	subs r1, #5
	movs r0, #0xf0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0x88
	strb r0, [r1]
	adds r1, #4
	ldrb r0, [r1]
	mov r2, r9
	orrs r0, r2
	movs r2, #2
	orrs r0, r2
	mov r2, r8
	orrs r0, r2
	orrs r0, r6
	orrs r0, r4
	strb r0, [r1]
	adds r2, r7, #0
	adds r2, #0x36
	ldrb r0, [r2]
	mov r1, r9
	orrs r0, r1
	movs r1, #3
	negs r1, r1
	ands r0, r1
	mov r1, r8
	orrs r0, r1
	orrs r0, r6
	orrs r0, r4
	strb r0, [r2]
	ldr r0, _080CEEE8  @ gUnknown_08B17B44
	movs r1, #0x90
	lsls r1, r1, #2
	movs r2, #0x20
	bl CopyToPaletteBuffer
	ldr r0, _080CEEEC  @ gUnknown_08B17864
	ldr r1, _080CEEF0  @ 0x06011000
	bl CopyDataWithPossibleUncomp
	ldr r0, _080CEEF4  @ gUnknown_08B177C0
	ldr r1, _080CEEF8  @ 0x06011800
	bl CopyDataWithPossibleUncomp
	ldr r0, _080CEEFC  @ gUnknown_08B176CC
	ldr r4, _080CEF00  @ gUnknown_02020288
	adds r1, r4, #0
	bl CopyDataWithPossibleUncomp
	movs r2, #0x80
	lsls r2, r2, #5
	ldr r0, _080CEEE0  @ gBG2TilemapBuffer
	adds r1, r4, #0
	bl CallARM_FillTileRect
	ldr r0, _080CEF04  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1e
	adds r0, #4
	lsls r0, r0, #5
	ldr r1, _080CEF08  @ gUiFramePaletteA
	adds r0, r0, r1
	movs r1, #0x40
	movs r2, #0x20
	bl CopyToPaletteBuffer
	bl sub_8003D20
	ldr r0, [r5]
	adds r0, #0xec
	movs r1, #0x16
	bl Text_Init
	bl sub_80CE148
	ldr r0, [r5]
	adds r0, #0xac
	movs r1, #9
	bl Text_Init
	ldr r0, [r5]
	adds r0, #0xe4
	movs r1, #0x12
	bl Text_Init
	movs r6, #0xb4
	movs r4, #0x7c
	movs r2, #5
	mov sl, r2
_080CEE44:
	ldr r0, [r5]
	adds r0, r0, r4
	movs r1, #9
	bl Text_Init
	ldr r0, [r5]
	adds r0, r0, r6
	movs r1, #0x12
	bl Text_Init
	adds r6, #8
	adds r4, #8
	movs r0, #1
	negs r0, r0
	add sl, r0
	mov r1, sl
	cmp r1, #0
	bge _080CEE44
	bl sub_80CE248
	bl sub_80CE414
	movs r0, #0
	str r0, [sp]
	ldr r0, [sp, #4]
	movs r1, #0
	movs r2, #0x12
	movs r3, #2
	bl sub_8086CE8
	ldr r0, _080CEF0C  @ gUnknown_08B12B1C
	ldr r1, [sp, #4]
	bl Proc_Start
	movs r0, #0xf
	bl BG_EnableSyncByMask
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #4
	str r0, [sp]
	ldr r0, [sp, #4]
	movs r1, #0xe0
	movs r2, #0x2f
	bl sub_8097748
	ldr r0, _080CEED0  @ gUnknown_08B12AA4
	ldr r0, [r0]
	adds r1, r0, #0
	adds r1, #0x2c
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	lsls r1, r1, #4
	adds r0, #0x3e
	ldrb r2, [r0]
	movs r0, #0xa
	movs r3, #6
	bl sub_80976CC
	bl sub_8097668
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080CEED0: .4byte gUnknown_08B12AA4
_080CEED4: .4byte gLCDControlBuffer
_080CEED8: .4byte gBG0TilemapBuffer
_080CEEDC: .4byte gBG1TilemapBuffer
_080CEEE0: .4byte gBG2TilemapBuffer
_080CEEE4: .4byte gBG3TilemapBuffer
_080CEEE8: .4byte gUnknown_08B17B44
_080CEEEC: .4byte gUnknown_08B17864
_080CEEF0: .4byte 0x06011000
_080CEEF4: .4byte gUnknown_08B177C0
_080CEEF8: .4byte 0x06011800
_080CEEFC: .4byte gUnknown_08B176CC
_080CEF00: .4byte gUnknown_02020288
_080CEF04: .4byte gRAMChapterData
_080CEF08: .4byte gUiFramePaletteA
_080CEF0C: .4byte gUnknown_08B12B1C

	THUMB_FUNC_END sub_80CECB0

	THUMB_FUNC_START sub_80CEF10
sub_80CEF10: @ 0x080CEF10
	push {r4, lr}
	sub sp, #4
	movs r0, #1
	movs r1, #0xf
	movs r2, #4
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	movs r4, #0
	str r4, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #1
	movs r3, #0
	bl sub_8001ED0
	str r4, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #1
	bl sub_8001F0C
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80CEF10

	THUMB_FUNC_START sub_80CEF48
sub_80CEF48: @ 0x080CEF48
	push {r4, lr}
	ldr r1, _080CEF64  @ gUnknown_08B12AA4
	ldr r1, [r1]
	adds r1, #0x2f
	ldrb r2, [r1]
	ldr r4, _080CEF68  @ gKeyStatusPtr
	cmp r2, #1
	beq _080CEF82
	cmp r2, #1
	bgt _080CEF6C
	cmp r2, #0
	beq _080CEF72
	b _080CEFC0
	.align 2, 0
_080CEF64: .4byte gUnknown_08B12AA4
_080CEF68: .4byte gKeyStatusPtr
_080CEF6C:
	cmp r2, #2
	beq _080CEF9E
	b _080CEFC0
_080CEF72:
	ldr r1, [r4]
	ldrh r2, [r1, #8]
	movs r1, #4
	ands r1, r2
	cmp r1, #0
	beq _080CEF82
	movs r0, #4
	b _080CEFCE
_080CEF82:
	ldr r1, [r4]
	ldrh r2, [r1, #8]
	movs r1, #1
	ands r1, r2
	cmp r1, #0
	beq _080CEF92
	movs r0, #2
	b _080CEFCE
_080CEF92:
	movs r1, #2
	ands r1, r2
	cmp r1, #0
	beq _080CEFC0
_080CEF9A:
	movs r0, #3
	b _080CEFCE
_080CEF9E:
	ldr r1, [r4]
	ldrh r3, [r1, #8]
	ands r2, r3
	cmp r2, #0
	bne _080CEF9A
	movs r1, #0x11
	ands r1, r3
	cmp r1, #0
	beq _080CEFB4
	movs r0, #5
	b _080CEFCE
_080CEFB4:
	movs r1, #0x20
	ands r1, r3
	cmp r1, #0
	beq _080CEFC0
	movs r0, #6
	b _080CEFCE
_080CEFC0:
	ldr r1, [r4]
	ldrh r2, [r1, #6]
	movs r1, #0xc0
	ands r1, r2
	cmp r1, #0
	beq _080CEFCE
	movs r0, #1
_080CEFCE:
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80CEF48

	THUMB_FUNC_START sub_80CEFD4
sub_80CEFD4: @ 0x080CEFD4
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	movs r4, #0
	bl sub_80CEF48
	subs r0, #1
	cmp r0, #5
	bls _080CEFE6
	b _080CF43A
_080CEFE6:
	lsls r0, r0, #2
	ldr r1, _080CEFF0  @ _080CEFF4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080CEFF0: .4byte _080CEFF4
_080CEFF4: @ jump table
	.4byte _080CF1AC @ case 0
	.4byte _080CF00C @ case 1
	.4byte _080CF0D4 @ case 2
	.4byte _080CF13C @ case 3
	.4byte _080CF094 @ case 4
	.4byte _080CF0B4 @ case 5
_080CF00C:
	ldr r0, _080CF03C  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080CF01E
	movs r0, #0x6a
	bl m4aSongNumStart
_080CF01E:
	ldr r4, _080CF040  @ gUnknown_08B12AA4
	ldr r1, [r4]
	adds r1, #0x2f
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldr r1, [r4]
	adds r0, r1, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	cmp r0, #1
	beq _080CF044
	cmp r0, #2
	beq _080CF04A
	b _080CF43A
	.align 2, 0
_080CF03C: .4byte gRAMChapterData
_080CF040: .4byte gUnknown_08B12AA4
_080CF044:
	movs r0, #0x80
	lsls r0, r0, #6
	b _080CF114
_080CF04A:
	adds r1, #0x2e
	movs r0, #0
	strb r0, [r1]
	ldr r2, _080CF090  @ gUnknown_08B19E0C
	ldr r0, [r4]
	adds r1, r0, #0
	adds r1, #0x2b
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, #0x68
	adds r0, r0, r1
	ldrb r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrh r0, [r0, #8]
	bl SetEventId
	ldr r0, [r4]
	adds r1, r0, #0
	adds r1, #0x2b
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, #0x68
	adds r0, r0, r1
	ldrb r0, [r0]
	movs r1, #0
	bl sub_80CE5F0
	bl sub_809764C
	b _080CF43A
	.align 2, 0
_080CF090: .4byte gUnknown_08B19E0C
_080CF094:
	ldr r0, _080CF0B0  @ gUnknown_08B12AA4
	ldr r0, [r0]
	adds r1, r0, #0
	adds r1, #0x2b
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, #0x68
	adds r0, r0, r1
	ldrb r0, [r0]
	movs r1, #1
	bl sub_80CE5F0
	b _080CF43A
	.align 2, 0
_080CF0B0: .4byte gUnknown_08B12AA4
_080CF0B4:
	ldr r0, _080CF0D0  @ gUnknown_08B12AA4
	ldr r0, [r0]
	adds r1, r0, #0
	adds r1, #0x2b
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, #0x68
	adds r0, r0, r1
	ldrb r0, [r0]
	movs r1, #2
	bl sub_80CE5F0
	b _080CF43A
	.align 2, 0
_080CF0D0: .4byte gUnknown_08B12AA4
_080CF0D4:
	ldr r0, _080CF108  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080CF0E6
	movs r0, #0x6b
	bl m4aSongNumStart
_080CF0E6:
	ldr r2, _080CF10C  @ gUnknown_08B12AA4
	ldr r0, [r2]
	adds r1, r0, #0
	adds r1, #0x2f
	ldrb r0, [r1]
	cmp r0, #0
	beq _080CF134
	subs r0, #1
	strb r0, [r1]
	ldr r0, [r2]
	adds r0, #0x2f
	ldrb r0, [r0]
	cmp r0, #0
	beq _080CF110
	cmp r0, #1
	beq _080CF120
	b _080CF43A
	.align 2, 0
_080CF108: .4byte gRAMChapterData
_080CF10C: .4byte gUnknown_08B12AA4
_080CF110:
	movs r0, #0x80
	lsls r0, r0, #5
_080CF114:
	bl sub_80CEC68
	movs r0, #4
	bl BG_EnableSyncByMask
	b _080CF43A
_080CF120:
	ldr r0, _080CF130  @ gUnknown_08B12B9C
	adds r1, r5, #0
	bl Proc_StartBlocking
	bl sub_8097668
	b _080CF43A
	.align 2, 0
_080CF130: .4byte gUnknown_08B12B9C
_080CF134:
	adds r0, r5, #0
	bl Proc_Break
	b _080CF43A
_080CF13C:
	ldr r0, _080CF170  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080CF14E
	movs r0, #0x6a
	bl m4aSongNumStart
_080CF14E:
	ldr r3, _080CF174  @ gUnknown_08B12AA4
	ldr r2, [r3]
	adds r2, #0x30
	ldrb r0, [r2]
	adds r0, #1
	movs r1, #1
	ands r0, r1
	strb r0, [r2]
	ldr r0, [r3]
	adds r0, #0x30
	ldrb r0, [r0]
	cmp r0, #0
	beq _080CF178
	movs r0, #0xb3
	bl SetEventId
	b _080CF17E
	.align 2, 0
_080CF170: .4byte gRAMChapterData
_080CF174: .4byte gUnknown_08B12AA4
_080CF178:
	movs r0, #0xb3
	bl UnsetEventId
_080CF17E:
	ldr r2, _080CF1A4  @ gUnknown_08B12AA4
	ldr r0, [r2]
	adds r0, #0x29
	movs r1, #0
	strb r1, [r0]
	ldr r0, [r2]
	adds r0, #0x2a
	strb r1, [r0]
	ldr r0, [r2]
	adds r0, #0x2b
	strb r1, [r0]
	ldr r0, [r2]
	adds r0, #0x2c
	strb r1, [r0]
	ldr r0, _080CF1A8  @ gUnknown_08B12B3C
	adds r1, r5, #0
	bl Proc_StartBlocking
	b _080CF43A
	.align 2, 0
_080CF1A4: .4byte gUnknown_08B12AA4
_080CF1A8: .4byte gUnknown_08B12B3C
_080CF1AC:
	ldr r6, _080CF1C8  @ gUnknown_08B12AA4
	ldr r3, [r6]
	adds r0, r3, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	adds r7, r6, #0
	cmp r0, #1
	bne _080CF1BE
	b _080CF2E8
_080CF1BE:
	cmp r0, #1
	bgt _080CF1CC
	cmp r0, #0
	beq _080CF1D4
	b _080CF424
	.align 2, 0
_080CF1C8: .4byte gUnknown_08B12AA4
_080CF1CC:
	cmp r0, #2
	bne _080CF1D2
	b _080CF3A4
_080CF1D2:
	b _080CF424
_080CF1D4:
	ldr r0, _080CF230  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _080CF234
	adds r1, r3, #0
	adds r1, #0x29
	ldrb r2, [r1]
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	beq _080CF2C0
	subs r0, r2, #1
	strb r0, [r1]
	ldr r1, [r6]
	adds r0, r1, #0
	adds r0, #0x29
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r2, r1, #0
	adds r2, #0x2a
	movs r1, #0
	ldrsb r1, [r2, r1]
	subs r0, r0, r1
	cmp r0, #0
	bgt _080CF22C
	ldrb r1, [r2]
	movs r0, #0
	ldrsb r0, [r2, r0]
	cmp r0, #0
	beq _080CF22C
	subs r0, r1, #1
	strb r0, [r2]
	ldr r0, [r6]
	adds r0, #0x29
	movs r1, #0
	ldrsb r1, [r0, r1]
	subs r1, #1
	adds r0, r5, #0
	bl sub_80CE750
_080CF22C:
	movs r4, #1
	b _080CF2C6
	.align 2, 0
_080CF230: .4byte gKeyStatusPtr
_080CF234:
	adds r0, r3, #0
	adds r0, #0x29
	movs r1, #0
	ldrsb r1, [r0, r1]
	adds r0, #7
	ldrb r0, [r0]
	cmp r0, #0
	beq _080CF252
	adds r0, r3, #0
	adds r0, #0x3c
	ldrb r0, [r0]
	subs r0, #1
	cmp r1, r0
	blt _080CF25E
	b _080CF2C0
_080CF252:
	adds r0, r3, #0
	adds r0, #0x3d
	ldrb r0, [r0]
	subs r0, #1
	cmp r1, r0
	bge _080CF2C0
_080CF25E:
	ldr r0, [r7]
	adds r0, #0x29
	ldrb r1, [r0]
	adds r1, #1
	strb r1, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r0, #0x29
	movs r2, #0
	ldrsb r2, [r0, r2]
	adds r0, #1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r2, r0
	cmp r0, #4
	ble _080CF2BE
	adds r0, r1, #0
	adds r0, #0x30
	ldrb r0, [r0]
	cmp r0, #0
	beq _080CF298
	adds r0, r1, #0
	adds r0, #0x3c
	ldrb r0, [r0]
	subs r0, #1
	cmp r2, r0
	blt _080CF2A4
	b _080CF2BE
_080CF298:
	adds r0, r1, #0
	adds r0, #0x3d
	ldrb r0, [r0]
	subs r0, #1
	cmp r2, r0
	bge _080CF2BE
_080CF2A4:
	ldr r1, [r7]
	adds r1, #0x2a
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldr r0, [r7]
	adds r0, #0x29
	movs r1, #0
	ldrsb r1, [r0, r1]
	adds r1, #1
	adds r0, r5, #0
	bl sub_80CE858
_080CF2BE:
	movs r4, #1
_080CF2C0:
	cmp r4, #0
	bne _080CF2C6
	b _080CF43A
_080CF2C6:
	ldr r0, _080CF2E0  @ gUnknown_08B12B9C
	adds r1, r5, #0
	bl Proc_Start
	ldr r2, _080CF2E4  @ gUnknown_08B12AA4
	ldr r0, [r2]
	adds r0, #0x2b
	movs r1, #0
	strb r1, [r0]
	ldr r0, [r2]
	adds r0, #0x2c
	strb r1, [r0]
	b _080CF424
	.align 2, 0
_080CF2E0: .4byte gUnknown_08B12B9C
_080CF2E4: .4byte gUnknown_08B12AA4
_080CF2E8:
	ldr r0, _080CF348  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _080CF34C
	adds r1, r3, #0
	adds r1, #0x2b
	ldrb r2, [r1]
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bne _080CF306
	b _080CF424
_080CF306:
	subs r0, r2, #1
	strb r0, [r1]
	ldr r1, [r6]
	adds r0, r1, #0
	adds r0, #0x2b
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r2, r1, #0
	adds r2, #0x2c
	movs r1, #0
	ldrsb r1, [r2, r1]
	subs r0, r0, r1
	cmp r0, #0
	bgt _080CF342
	ldrb r1, [r2]
	movs r0, #0
	ldrsb r0, [r2, r0]
	cmp r0, #0
	beq _080CF342
	subs r0, r1, #1
	strb r0, [r2]
	ldr r0, [r6]
	adds r0, #0x2b
	movs r1, #0
	ldrsb r1, [r0, r1]
	subs r1, #1
	adds r0, r5, #0
	bl sub_80CE750
_080CF342:
	movs r4, #1
	b _080CF428
	.align 2, 0
_080CF348: .4byte gKeyStatusPtr
_080CF34C:
	adds r2, r3, #0
	adds r2, #0x2b
	movs r1, #0
	ldrsb r1, [r2, r1]
	adds r0, r3, #0
	adds r0, #0x3e
	ldrb r0, [r0]
	subs r0, #1
	cmp r1, r0
	bge _080CF424
	ldrb r0, [r2]
	adds r0, #1
	strb r0, [r2]
	ldr r1, [r6]
	adds r0, r1, #0
	adds r0, #0x2b
	movs r3, #0
	ldrsb r3, [r0, r3]
	adds r2, r1, #0
	adds r2, #0x2c
	movs r0, #0
	ldrsb r0, [r2, r0]
	subs r0, r3, r0
	cmp r0, #4
	ble _080CF3A0
	adds r0, r1, #0
	adds r0, #0x3e
	ldrb r0, [r0]
	subs r0, #1
	cmp r3, r0
	bge _080CF3A0
	ldrb r0, [r2]
	adds r0, #1
	strb r0, [r2]
	ldr r0, [r6]
	adds r0, #0x2b
	movs r1, #0
	ldrsb r1, [r0, r1]
	adds r1, #1
	adds r0, r5, #0
	bl sub_80CE858
_080CF3A0:
	movs r4, #1
	b _080CF428
_080CF3A4:
	ldr r0, _080CF3E4  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _080CF3EC
	adds r1, r3, #0
	adds r1, #0x2e
	ldrb r2, [r1]
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	beq _080CF424
	subs r0, r2, #1
	movs r4, #0
	strb r0, [r1]
	ldr r0, _080CF3E8  @ gUnknown_08B12C3C
	adds r1, r5, #0
	bl Proc_StartBlocking
	adds r5, r0, #0
	ldr r0, [r6]
	adds r0, #0x2e
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	str r0, [r5, #0x34]
	str r4, [r5, #0x38]
	movs r4, #1
	b _080CF428
	.align 2, 0
_080CF3E4: .4byte gKeyStatusPtr
_080CF3E8: .4byte gUnknown_08B12C3C
_080CF3EC:
	adds r2, r3, #0
	adds r2, #0x2e
	movs r1, #0
	ldrsb r1, [r2, r1]
	adds r0, r3, #0
	adds r0, #0x3f
	ldrb r0, [r0]
	subs r0, #4
	cmp r1, r0
	bge _080CF424
	ldrb r0, [r2]
	adds r0, #1
	strb r0, [r2]
	ldr r0, _080CF440  @ gUnknown_08B12C3C
	adds r1, r5, #0
	bl Proc_StartBlocking
	adds r5, r0, #0
	ldr r0, [r6]
	adds r0, #0x2e
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r0, #3
	str r0, [r5, #0x34]
	movs r0, #1
	str r0, [r5, #0x38]
	movs r4, #1
_080CF424:
	cmp r4, #0
	beq _080CF43A
_080CF428:
	ldr r0, _080CF444  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080CF43A
	movs r0, #0x66
	bl m4aSongNumStart
_080CF43A:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080CF440: .4byte gUnknown_08B12C3C
_080CF444: .4byte gRAMChapterData

	THUMB_FUNC_END sub_80CEFD4

	THUMB_FUNC_START sub_80CF448
sub_80CF448: @ 0x080CF448
	push {lr}
	bl EndBG3Slider
	ldr r0, _080CF45C  @ gUnknown_08B12B1C
	bl Proc_EndEach
	bl Delete6CMenuScroll
	pop {r0}
	bx r0
	.align 2, 0
_080CF45C: .4byte gUnknown_08B12B1C

	THUMB_FUNC_END sub_80CF448

	THUMB_FUNC_START sub_80CF460
sub_80CF460: @ 0x080CF460
	push {r4, lr}
	ldr r4, _080CF468  @ gUnknown_08B19E0C
	b _080CF474
	.align 2, 0
_080CF468: .4byte gUnknown_08B19E0C
_080CF46C:
	ldrh r0, [r4, #6]
	bl SetEventId
	adds r4, #0xc
_080CF474:
	ldrb r0, [r4]
	cmp r0, #0xc
	bne _080CF46C
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80CF460

	THUMB_FUNC_START sub_80CF480
sub_80CF480: @ 0x080CF480
	push {r4, lr}
	ldr r4, _080CF488  @ gUnknown_08B19E0C
	b _080CF4AA
	.align 2, 0
_080CF488: .4byte gUnknown_08B19E0C
_080CF48C:
	ldrh r0, [r4, #6]
	bl CheckEventId
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080CF4A8
	ldrh r0, [r4, #8]
	bl CheckEventId
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080CF4A8
	movs r0, #0
	b _080CF4B2
_080CF4A8:
	adds r4, #0xc
_080CF4AA:
	ldrb r0, [r4]
	cmp r0, #0xc
	bne _080CF48C
	movs r0, #1
_080CF4B2:
	pop {r4}
	pop {r1}
	bx r1
	THUMB_FUNC_END sub_80CF480
