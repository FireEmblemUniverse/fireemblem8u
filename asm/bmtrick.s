	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	@ Trap/"Active Tile" System

	THUMB_FUNC_START ResetTraps
ResetTraps: @ 0x0802E1C8
	push {r4, lr}
	ldr r3, _0802E1E8  @ gUnknown_0203A814
	ldr r1, _0802E1EC  @ gUnknown_0203A614
	movs r2, #0
	movs r4, #0xfc
	lsls r4, r4, #1
	adds r0, r1, r4
_0802E1D6:
	strb r2, [r0, #2]
	subs r0, #8
	cmp r0, r1
	bge _0802E1D6
	movs r0, #0
	strb r0, [r3, #2]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802E1E8: .4byte gUnknown_0203A814
_0802E1EC: .4byte gUnknown_0203A614

	THUMB_FUNC_START GetTrapAt
GetTrapAt: @ 0x0802E1F0
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r2, r1, #0
	ldr r5, _0802E1FC  @ gUnknown_0203A614
_0802E1F8:
	adds r3, r5, #0
	b _0802E23E
	.align 2, 0
_0802E1FC: .4byte gUnknown_0203A614
_0802E200:
	ldrb r0, [r3]
	cmp r4, r0
	bne _0802E210
	ldrb r0, [r3, #1]
	cmp r2, r0
	bne _0802E210
	adds r0, r3, #0
	b _0802E246
_0802E210:
	ldr r0, _0802E238  @ gBmMapTerrain
	ldr r1, [r0]
	lsls r0, r2, #2
	adds r1, r0, r1
	ldr r0, [r1]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0x1b
	bne _0802E23C
	cmp r2, #0
	ble _0802E23C
	subs r0, r1, #4
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0x1b
	bne _0802E23C
	subs r2, #1
	b _0802E1F8
	.align 2, 0
_0802E238: .4byte gBmMapTerrain
_0802E23C:
	adds r3, #8
_0802E23E:
	ldrb r0, [r3, #2]
	cmp r0, #0
	bne _0802E200
	movs r0, #0
_0802E246:
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_START GetSpecificTrapAt
GetSpecificTrapAt: @ 0x0802E24C
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r3, _0802E258  @ gUnknown_0203A614
	b _0802E2AA
	.align 2, 0
_0802E258: .4byte gUnknown_0203A614
_0802E25C:
	ldrb r0, [r3]
	cmp r0, r4
	bne _0802E272
	ldrb r0, [r3, #1]
	cmp r0, r5
	bne _0802E272
	ldrb r0, [r3, #2]
	cmp r0, r2
	bne _0802E272
	adds r0, r3, #0
	b _0802E2B2
_0802E272:
	cmp r2, #0x1b
	bne _0802E2A8
	ldr r0, _0802E2A4  @ gBmMapTerrain
	ldr r1, [r0]
	lsls r0, r5, #2
	adds r1, r0, r1
	ldr r0, [r1]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0x1b
	bne _0802E2A8
	cmp r5, #0
	ble _0802E2A8
	subs r0, r1, #4
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0x1b
	bne _0802E2A8
	adds r0, r4, #0
	subs r1, r5, #1
	bl GetTrapAt
	b _0802E2B2
	.align 2, 0
_0802E2A4: .4byte gBmMapTerrain
_0802E2A8:
	adds r3, #8
_0802E2AA:
	ldrb r0, [r3, #2]
	cmp r0, #0
	bne _0802E25C
	movs r0, #0
_0802E2B2:
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_START AddTrap
AddTrap: @ 0x0802E2B8
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, _0802E2C4  @ gUnknown_0203A614
	b _0802E2CA
	.align 2, 0
_0802E2C4: .4byte gUnknown_0203A614
_0802E2C8:
	adds r1, #8
_0802E2CA:
	ldrb r0, [r1, #2]
	cmp r0, #0
	bne _0802E2C8
	strb r4, [r1]
	strb r5, [r1, #1]
	strb r2, [r1, #2]
	strb r3, [r1, #3]
	adds r0, r1, #0
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_START AddTrapExt
AddTrapExt: @ 0x0802E2E0
	push {r4, r5, r6, lr}
	ldr r4, [sp, #0x10]
	ldr r5, [sp, #0x14]
	ldr r6, [sp, #0x18]
	bl AddTrap
	strb r4, [r0, #4]
	strb r5, [r0, #5]
	strb r4, [r0, #6]
	strb r6, [r0, #7]
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	THUMB_FUNC_START RemoveTrap
RemoveTrap: @ 0x0802E2FC
	push {lr}
	adds r3, r0, #0
	b _0802E308
_0802E302:
	ldr r1, [r3, #8]
	ldr r2, [r3, #0xc]
	stm r3!, {r1, r2}
_0802E308:
	ldrb r1, [r3, #2]
	cmp r1, #0
	bne _0802E302
	pop {r1}
	bx r1

	THUMB_FUNC_START AddFireTrap
AddFireTrap: @ 0x0802E314
	push {lr}
	sub sp, #0xc
	str r2, [sp]
	str r3, [sp, #4]
	movs r2, #0xa
	str r2, [sp, #8]
	movs r2, #4
	movs r3, #0
	bl AddTrapExt
	add sp, #0xc
	pop {r0}
	bx r0

	THUMB_FUNC_START AddGasTrap
AddGasTrap: @ 0x0802E330
	push {r4, lr}
	sub sp, #0xc
	adds r4, r2, #0
	ldr r2, [sp, #0x14]
	str r3, [sp]
	str r2, [sp, #4]
	movs r2, #3
	str r2, [sp, #8]
	movs r2, #5
	adds r3, r4, #0
	bl AddTrapExt
	add sp, #0xc
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_START AddArrowTrap
AddArrowTrap: @ 0x0802E350
	push {lr}
	sub sp, #0xc
	str r1, [sp]
	str r2, [sp, #4]
	movs r1, #0xa
	str r1, [sp, #8]
	movs r1, #0
	movs r2, #7
	movs r3, #0
	bl AddTrapExt
	add sp, #0xc
	pop {r0}
	bx r0

	THUMB_FUNC_START sub_802E36C
sub_802E36C: @ 0x0802E36C
	push {lr}
	sub sp, #0xc
	str r2, [sp]
	str r3, [sp, #4]
	movs r2, #0
	str r2, [sp, #8]
	movs r2, #6
	movs r3, #0
	bl AddTrapExt
	add sp, #0xc
	pop {r0}
	bx r0

	THUMB_FUNC_START AddTrap8
AddTrap8: @ 0x0802E388
	push {lr}
	movs r2, #8
	movs r3, #0
	bl AddTrap
	pop {r0}
	bx r0

	THUMB_FUNC_START AddTrap9
AddTrap9: @ 0x0802E398
	push {lr}
	adds r3, r2, #0
	movs r2, #9
	bl AddTrap
	pop {r0}
	bx r0

	THUMB_FUNC_START AddSnagsAndWalls
AddSnagsAndWalls: @ 0x0802E3A8
	push {r4, r5, r6, lr}
	ldr r0, _0802E3DC  @ gBmMapSize
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r5, r0, #1
	cmp r5, #0
	blt _0802E428
_0802E3B6:
	ldr r0, _0802E3DC  @ gBmMapSize
	movs r1, #0
	ldrsh r0, [r0, r1]
	subs r4, r0, #1
	subs r6, r5, #1
	cmp r4, #0
	blt _0802E422
_0802E3C4:
	ldr r0, _0802E3E0  @ gBmMapTerrain
	ldr r1, [r0]
	lsls r0, r5, #2
	adds r1, r0, r1
	ldr r0, [r1]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0x1b
	beq _0802E3E4
	cmp r0, #0x33
	beq _0802E410
	b _0802E41C
	.align 2, 0
_0802E3DC: .4byte gBmMapSize
_0802E3E0: .4byte gBmMapTerrain
_0802E3E4:
	subs r0, r1, #4
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0x1b
	beq _0802E41C
	ldr r0, _0802E40C  @ gUnknown_0202BCF0
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetROMChapterStruct
	adds r0, #0x2c
	ldrb r3, [r0]
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #2
	bl AddTrap
	b _0802E41C
	.align 2, 0
_0802E40C: .4byte gUnknown_0202BCF0
_0802E410:
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #2
	movs r3, #0x14
	bl AddTrap
_0802E41C:
	subs r4, #1
	cmp r4, #0
	bge _0802E3C4
_0802E422:
	adds r5, r6, #0
	cmp r5, #0
	bge _0802E3B6
_0802E428:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_START ApplyTrapMapChanges
ApplyTrapMapChanges: @ 0x0802E430
	push {r4, lr}
	ldr r4, _0802E438  @ gUnknown_0203A614
	b _0802E462
	.align 2, 0
_0802E438: .4byte gUnknown_0203A614
_0802E43C:
	ldrb r0, [r4, #2]
	cmp r0, #3
	beq _0802E448
	cmp r0, #6
	beq _0802E450
	b _0802E460
_0802E448:
	ldrb r0, [r4, #3]
	bl ApplyMapChangesById
	b _0802E460
_0802E450:
	ldrb r0, [r4, #3]
	cmp r0, #0
	beq _0802E45A
	ldrb r0, [r4, #1]
	b _0802E45C
_0802E45A:
	ldrb r0, [r4]
_0802E45C:
	bl ApplyMapChangesById
_0802E460:
	adds r4, #8
_0802E462:
	ldrb r0, [r4, #2]
	cmp r0, #0
	bne _0802E43C
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_START UpdateAllLightRunes
UpdateAllLightRunes: @ 0x0802E470
	push {r4, lr}
	ldr r2, _0802E4A4  @ gUnknown_0203A614
	ldrb r0, [r2, #2]
	cmp r0, #0
	beq _0802E49C
	ldr r4, _0802E4A8  @ gBmMapTerrain
	movs r3, #0
_0802E47E:
	ldrb r0, [r2, #2]
	cmp r0, #0xd
	bne _0802E494
	ldrb r0, [r2, #1]
	ldr r1, [r4]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r1, [r2]
	ldr r0, [r0]
	adds r0, r0, r1
	strb r3, [r0]
_0802E494:
	adds r2, #8
	ldrb r0, [r2, #2]
	cmp r0, #0
	bne _0802E47E
_0802E49C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802E4A4: .4byte gUnknown_0203A614
_0802E4A8: .4byte gBmMapTerrain

	THUMB_FUNC_START GetTrapExt1At
GetTrapExt1At: @ 0x0802E4AC
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	bl GetTrapAt
	cmp r0, #0
	bne _0802E4E4
	ldr r0, _0802E4E8  @ gBmMapTerrain
	ldr r1, [r0]
	lsls r0, r5, #2
	adds r1, r0, r1
	ldr r0, [r1]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0x1b
	bne _0802E4EC
	subs r0, r1, #4
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0x1b
	bne _0802E4EC
	subs r1, r5, #1
	adds r0, r4, #0
	bl GetTrapAt
	cmp r0, #0
	beq _0802E4EC
_0802E4E4:
	ldrb r0, [r0, #3]
	b _0802E4EE
	.align 2, 0
_0802E4E8: .4byte gBmMapTerrain
_0802E4EC:
	movs r0, #0
_0802E4EE:
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_START GetMapChangesPointerById
GetMapChangesPointerById: @ 0x0802E4F4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0802E50C  @ gUnknown_0202BCF0
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetChapterMapChangesPointer
	adds r1, r0, #0
	cmp r1, #0
	bne _0802E51E
	b _0802E526
	.align 2, 0
_0802E50C: .4byte gUnknown_0202BCF0
_0802E510:
	adds r0, r1, #0
	b _0802E528
_0802E514:
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r4, r0
	beq _0802E510
	adds r1, #0xc
_0802E51E:
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bge _0802E514
_0802E526:
	movs r0, #0
_0802E528:
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_START GetMapChangesIdAt
GetMapChangesIdAt: @ 0x0802E530
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	movs r6, #1
	negs r6, r6
	ldr r0, _0802E550  @ gUnknown_0202BCF0
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetChapterMapChangesPointer
	adds r1, r0, #0
	cmp r1, #0
	beq _0802E582
	b _0802E57A
	.align 2, 0
_0802E550: .4byte gUnknown_0202BCF0
_0802E554:
	ldrb r2, [r1, #1]
	cmp r5, r2
	blt _0802E578
	ldrb r3, [r1, #2]
	cmp r4, r3
	blt _0802E578
	ldrb r0, [r1, #3]
	adds r0, r2, r0
	subs r0, #1
	cmp r0, r5
	blt _0802E578
	ldrb r0, [r1, #4]
	adds r0, r3, r0
	subs r0, #1
	cmp r0, r4
	blt _0802E578
	movs r6, #0
	ldrsb r6, [r1, r6]
_0802E578:
	adds r1, #0xc
_0802E57A:
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bge _0802E554
_0802E582:
	adds r0, r6, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	THUMB_FUNC_START ApplyMapChangesById
ApplyMapChangesById: @ 0x0802E58C
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	movs r6, #0
	bl GetMapChangesPointerById
	adds r3, r0, #0
	ldr r4, [r3, #8]
	ldrb r0, [r3, #4]
	cmp r6, r0
	bge _0802E5E6
	ldr r7, _0802E5F4  @ gUnknown_0859A9D4
	mov r8, r7
_0802E5A8:
	movs r5, #0
	adds r0, r6, #1
	mov r9, r0
	ldrb r7, [r3, #3]
	cmp r5, r7
	bge _0802E5DE
	mov ip, r8
_0802E5B6:
	ldrh r2, [r4]
	cmp r2, #0
	beq _0802E5D4
	ldrb r1, [r3, #2]
	adds r1, r1, r6
	mov r7, ip
	ldr r0, [r7]
	lsls r1, r1, #2
	adds r1, r1, r0
	ldrb r0, [r3, #1]
	adds r0, r0, r5
	ldr r1, [r1]
	lsls r0, r0, #1
	adds r0, r0, r1
	strh r2, [r0]
_0802E5D4:
	adds r4, #2
	adds r5, #1
	ldrb r0, [r3, #3]
	cmp r5, r0
	blt _0802E5B6
_0802E5DE:
	mov r6, r9
	ldrb r7, [r3, #4]
	cmp r6, r7
	blt _0802E5A8
_0802E5E6:
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802E5F4: .4byte gUnknown_0859A9D4

	THUMB_FUNC_START AddMapChange
AddMapChange: @ 0x0802E5F8
	push {lr}
	adds r3, r0, #0
	movs r0, #0
	movs r1, #0
	movs r2, #3
	bl AddTrap
	pop {r0}
	bx r0

	THUMB_FUNC_START UntriggerMapChange
UntriggerMapChange: @ 0x0802E60C
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _0802E614  @ gUnknown_0203A614
	b _0802E62A
	.align 2, 0
_0802E614: .4byte gUnknown_0203A614
_0802E618:
	cmp r0, #3
	bne _0802E628
	ldrb r0, [r4, #3]
	cmp r0, r5
	bne _0802E628
	adds r0, r4, #0
	bl RemoveTrap
_0802E628:
	adds r4, #8
_0802E62A:
	ldrb r0, [r4, #2]
	cmp r0, #0
	bne _0802E618
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_START AreMapChangeTriggered
AreMapChangeTriggered: @ 0x0802E638
	push {lr}
	adds r2, r0, #0
	ldr r1, _0802E640  @ gUnknown_0203A614
	b _0802E654
	.align 2, 0
_0802E640: .4byte gUnknown_0203A614
_0802E644:
	cmp r0, #3
	bne _0802E652
	ldrb r0, [r1, #3]
	cmp r0, r2
	bne _0802E652
	movs r0, #1
	b _0802E65C
_0802E652:
	adds r1, #8
_0802E654:
	ldrb r0, [r1, #2]
	cmp r0, #0
	bne _0802E644
	movs r0, #0
_0802E65C:
	pop {r1}
	bx r1

	THUMB_FUNC_START UnitHideIfUnderRoof
UnitHideIfUnderRoof: @ 0x0802E660
	push {lr}
	adds r2, r0, #0
	movs r0, #0x11
	ldrsb r0, [r2, r0]
	ldr r1, _0802E68C  @ gBmMapTerrain
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0x22
	bne _0802E686
	ldr r0, [r2, #0xc]
	movs r1, #0x81
	orrs r0, r1
	str r0, [r2, #0xc]
_0802E686:
	pop {r0}
	bx r0
	.align 2, 0
_0802E68C: .4byte gBmMapTerrain

	THUMB_FUNC_START sub_802E690
sub_802E690: @ 0x0802E690
	push {r4, r5, lr}
	movs r5, #1
_0802E694:
	adds r0, r5, #0
	bl GetUnit
	adds r4, r0, #0
	cmp r4, #0
	beq _0802E6D8
	ldr r0, [r4]
	cmp r0, #0
	beq _0802E6D8
	ldr r3, [r4, #0xc]
	movs r0, #0x80
	ands r0, r3
	cmp r0, #0
	beq _0802E6D8
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	ldr r0, _0802E6EC  @ gBmMapTerrain
	ldr r0, [r0]
	lsls r1, r1, #2
	adds r1, r1, r0
	movs r2, #0x10
	ldrsb r2, [r4, r2]
	ldr r0, [r1]
	adds r0, r0, r2
	ldrb r0, [r0]
	cmp r0, #0x22
	beq _0802E6D8
	movs r0, #0x82
	negs r0, r0
	ands r3, r0
	movs r0, #0x80
	lsls r0, r0, #1
	orrs r3, r0
	str r3, [r4, #0xc]
_0802E6D8:
	adds r5, #1
	cmp r5, #0xbf
	ble _0802E694
	bl RefreshFogAndUnitMaps
	bl SMS_UpdateFromGameData
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802E6EC: .4byte gBmMapTerrain

	THUMB_FUNC_START AddToTargetListFromPos
AddToTargetListFromPos: @ 0x0802E6F0
	push {r4, lr}
	adds r3, r2, #0
	ldr r2, _0802E70C  @ gBmMapUnit
	ldr r4, [r2]
	lsls r2, r1, #2
	adds r2, r2, r4
	ldr r2, [r2]
	adds r2, r2, r0
	ldrb r2, [r2]
	bl AddTarget
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802E70C: .4byte gBmMapUnit

	THUMB_FUNC_START AddArrowTrapTargetsToTargetList
AddArrowTrapTargetsToTargetList: @ 0x0802E710
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r2, #0
	movs r4, #0
	b _0802E73A
_0802E71A:
	ldr r0, _0802E74C  @ gBmMapUnit
	ldr r1, [r0]
	lsls r0, r4, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r1, r0, r5
	ldrb r0, [r1]
	cmp r0, #0
	beq _0802E738
	adds r2, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	adds r3, r6, #0
	bl AddTarget
_0802E738:
	adds r4, #1
_0802E73A:
	ldr r0, _0802E750  @ gBmMapSize
	movs r1, #2
	ldrsh r0, [r0, r1]
	cmp r4, r0
	blt _0802E71A
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802E74C: .4byte gBmMapUnit
_0802E750: .4byte gBmMapSize

	THUMB_FUNC_START sub_802E754
sub_802E754: @ 0x0802E754
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	adds r5, r0, #0
	adds r4, r1, #0
	mov r8, r2
	movs r0, #0
	mov r9, r0
	movs r7, #0
	cmp r3, #1
	beq _0802E796
	cmp r3, #1
	bgt _0802E776
	cmp r3, #0
	beq _0802E790
	b _0802E79A
_0802E776:
	cmp r3, #2
	beq _0802E788
	cmp r3, #3
	bne _0802E79A
	movs r0, #0
	mov r9, r0
	movs r7, #1
	negs r7, r7
	b _0802E79A
_0802E788:
	movs r0, #0
	mov r9, r0
	movs r7, #1
	b _0802E79A
_0802E790:
	movs r0, #1
	negs r0, r0
	b _0802E798
_0802E796:
	movs r0, #1
_0802E798:
	mov r9, r0
_0802E79A:
	movs r6, #2
_0802E79C:
	add r5, r9
	adds r4, r4, r7
	ldr r0, _0802E7D0  @ gBmMapUnit
	ldr r1, [r0]
	lsls r0, r4, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r1, r0, r5
	ldrb r0, [r1]
	cmp r0, #0
	beq _0802E7BE
	adds r2, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	mov r3, r8
	bl AddTarget
_0802E7BE:
	subs r6, #1
	cmp r6, #0
	bge _0802E79C
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802E7D0: .4byte gBmMapUnit

	THUMB_FUNC_START sub_802E7D4
sub_802E7D4: @ 0x0802E7D4
	push {r4, r5, r6, r7, lr}
	adds r3, r0, #0
	adds r6, r1, #0
	movs r7, #0
	movs r4, #0
	movs r5, #1
	cmp r2, #1
	beq _0802E80A
	cmp r2, #1
	bgt _0802E7EE
	cmp r2, #0
	beq _0802E804
	b _0802E80C
_0802E7EE:
	cmp r2, #2
	beq _0802E7FE
	cmp r2, #3
	bne _0802E80C
	movs r7, #0
	movs r4, #1
	negs r4, r4
	b _0802E80C
_0802E7FE:
	movs r7, #0
	movs r4, #1
	b _0802E80C
_0802E804:
	movs r7, #1
	negs r7, r7
	b _0802E80C
_0802E80A:
	movs r7, #1
_0802E80C:
	ldr r0, _0802E838  @ gBmMapUnit
	ldr r1, [r0]
	movs r2, #2
	lsls r0, r6, #2
	adds r1, r0, r1
	lsls r4, r4, #2
_0802E818:
	adds r3, r3, r7
	adds r1, r1, r4
	ldr r0, [r1]
	adds r0, r0, r3
	ldrb r0, [r0]
	cmp r0, #0
	beq _0802E828
	movs r5, #0
_0802E828:
	subs r2, #1
	cmp r2, #0
	bge _0802E818
	adds r0, r5, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0802E838: .4byte gBmMapUnit

	THUMB_FUNC_START MakeTargetListForTurnTrapDamage
MakeTargetListForTurnTrapDamage: @ 0x0802E83C
	push {r4, lr}
	movs r0, #0
	movs r1, #0
	bl InitTargets
	ldr r4, _0802E84C  @ gUnknown_0203A614
	b _0802E89A
	.align 2, 0
_0802E84C: .4byte gUnknown_0203A614
_0802E850:
	movs r0, #6
	ldrsb r0, [r4, r0]
	cmp r0, #0
	bne _0802E898
	ldrb r0, [r4, #2]
	cmp r0, #5
	beq _0802E88A
	cmp r0, #5
	bgt _0802E868
	cmp r0, #4
	beq _0802E86E
	b _0802E898
_0802E868:
	cmp r0, #7
	beq _0802E87C
	b _0802E898
_0802E86E:
	ldrb r0, [r4]
	ldrb r1, [r4, #1]
	movs r2, #7
	ldrsb r2, [r4, r2]
	bl AddToTargetListFromPos
	b _0802E898
_0802E87C:
	ldrb r0, [r4]
	ldrb r1, [r4, #1]
	movs r2, #7
	ldrsb r2, [r4, r2]
	bl AddArrowTrapTargetsToTargetList
	b _0802E898
_0802E88A:
	ldrb r0, [r4]
	ldrb r1, [r4, #1]
	movs r2, #7
	ldrsb r2, [r4, r2]
	ldrb r3, [r4, #3]
	bl sub_802E754
_0802E898:
	adds r4, #8
_0802E89A:
	ldrb r0, [r4, #2]
	cmp r0, #0
	bne _0802E850
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_START sub_802E8A8
sub_802E8A8: @ 0x0802E8A8
	push {r4, r5, lr}
	movs r5, #0
	movs r0, #0
	movs r1, #0
	bl InitTargets
	ldr r4, _0802E8B8  @ gUnknown_0203A614
	b _0802E998
	.align 2, 0
_0802E8B8: .4byte gUnknown_0203A614
_0802E8BC:
	movs r0, #6
	ldrsb r0, [r4, r0]
	cmp r0, #0
	bne _0802E996
	ldrb r3, [r4, #2]
	cmp r3, #5
	beq _0802E914
	cmp r3, #5
	bgt _0802E8D4
	cmp r3, #4
	beq _0802E8DE
	b _0802E996
_0802E8D4:
	cmp r3, #6
	beq _0802E97E
	cmp r3, #7
	beq _0802E964
	b _0802E996
_0802E8DE:
	ldrb r2, [r4, #1]
	ldr r0, _0802E910  @ gBmMapUnit
	ldr r1, [r0]
	lsls r0, r2, #2
	adds r0, r0, r1
	ldrb r1, [r4]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _0802E996
	adds r0, r1, #0
	adds r1, r2, #0
	movs r2, #0
	movs r3, #4
	bl AddTarget
	ldrb r0, [r4]
	ldrb r1, [r4, #1]
	movs r2, #7
	ldrsb r2, [r4, r2]
	bl AddToTargetListFromPos
	b _0802E996
	.align 2, 0
_0802E910: .4byte gBmMapUnit
_0802E914:
	ldrb r2, [r4, #3]
	cmp r2, #1
	beq _0802E938
	cmp r2, #1
	bgt _0802E924
	cmp r2, #0
	beq _0802E934
	b _0802E93A
_0802E924:
	cmp r2, #2
	beq _0802E930
	cmp r2, #3
	bne _0802E93A
	movs r5, #0x64
	b _0802E93A
_0802E930:
	movs r5, #0x65
	b _0802E93A
_0802E934:
	movs r5, #0x66
	b _0802E93A
_0802E938:
	movs r5, #0x67
_0802E93A:
	ldrb r0, [r4]
	ldrb r1, [r4, #1]
	bl sub_802E7D4
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0802E996
	ldrb r0, [r4]
	ldrb r1, [r4, #1]
	movs r2, #0
	adds r3, r5, #0
	bl AddTarget
	ldrb r0, [r4]
	ldrb r1, [r4, #1]
	movs r2, #7
	ldrsb r2, [r4, r2]
	ldrb r3, [r4, #3]
	bl sub_802E754
	b _0802E996
_0802E964:
	ldrb r0, [r4]
	ldrb r1, [r4, #1]
	movs r2, #0
	movs r3, #7
	bl AddTarget
	ldrb r0, [r4]
	ldrb r1, [r4, #1]
	movs r2, #7
	ldrsb r2, [r4, r2]
	bl AddArrowTrapTargetsToTargetList
	b _0802E996
_0802E97E:
	ldrb r0, [r4, #3]
	cmp r0, #0
	beq _0802E988
	ldrb r0, [r4]
	b _0802E98A
_0802E988:
	ldrb r0, [r4, #1]
_0802E98A:
	ldr r1, _0802E9A4  @ gUnknown_0203A614
	subs r1, r4, r1
	asrs r1, r1, #3
	movs r2, #0
	bl AddTarget
_0802E996:
	adds r4, #8
_0802E998:
	ldrb r0, [r4, #2]
	cmp r0, #0
	bne _0802E8BC
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802E9A4: .4byte gUnknown_0203A614

	THUMB_FUNC_START CountDownTraps
CountDownTraps: @ 0x0802E9A8
	push {lr}
	ldr r1, _0802E9B0  @ gUnknown_0203A614
	b _0802E9C6
	.align 2, 0
_0802E9B0: .4byte gUnknown_0203A614
_0802E9B4:
	ldrb r0, [r1, #2]
	cmp r0, #7
	bgt _0802E9C4
	cmp r0, #4
	blt _0802E9C4
	ldrb r0, [r1, #6]
	subs r0, #1
	strb r0, [r1, #6]
_0802E9C4:
	adds r1, #8
_0802E9C6:
	ldrb r0, [r1, #2]
	cmp r0, #0
	bne _0802E9B4
	pop {r0}
	bx r0

	THUMB_FUNC_START ResetCounterForCountedDownTraps
ResetCounterForCountedDownTraps: @ 0x0802E9D0
	push {lr}
	ldr r1, _0802E9D8  @ gUnknown_0203A614
	b _0802E9F4
	.align 2, 0
_0802E9D8: .4byte gUnknown_0203A614
_0802E9DC:
	ldrb r0, [r1, #2]
	cmp r0, #7
	bgt _0802E9F2
	cmp r0, #4
	blt _0802E9F2
	movs r0, #6
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bne _0802E9F2
	ldrb r0, [r1, #5]
	strb r0, [r1, #6]
_0802E9F2:
	adds r1, #8
_0802E9F4:
	ldrb r0, [r1, #2]
	cmp r0, #0
	bne _0802E9DC
	pop {r0}
	bx r0

	THUMB_FUNC_START sub_802EA00
sub_802EA00: @ 0x0802EA00
	push {r4, r5, lr}
	ldr r4, _0802EA18  @ gUnknown_0202BCF0
	ldrb r5, [r4, #0xf]
	movs r0, #0x80
	strb r0, [r4, #0xf]
	bl RefreshFogAndUnitMaps
	strb r5, [r4, #0xf]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802EA18: .4byte gUnknown_0202BCF0

	THUMB_FUNC_START sub_802EA1C
sub_802EA1C: @ 0x0802EA1C
	push {lr}
	movs r0, #3
	bl sub_8026414
	pop {r0}
	bx r0

	THUMB_FUNC_START sub_802EA28
sub_802EA28: @ 0x0802EA28
	push {lr}
	movs r0, #0x65
	bl CheckEventId
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0802EA40
	bl CountAvailableBlueUnits
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _0802EA44
_0802EA40:
	bl CallGameOverEvent
_0802EA44:
	bl AreAnyEnemyUnitDead
	cmp r0, #0
	bne _0802EA52
	movs r0, #6
	bl SetEventId
_0802EA52:
	pop {r0}
	bx r0

	THUMB_FUNC_START AddLightRune
AddLightRune: @ 0x0802EA58
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r6, _0802EA8C  @ gBmMapTerrain
	ldr r0, [r6]
	lsls r4, r1, #2
	adds r0, r4, r0
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r3, [r0]
	adds r0, r5, #0
	movs r2, #0xd
	bl AddTrap
	adds r2, r0, #0
	movs r3, #0
	movs r1, #3
	strb r1, [r2, #6]
	ldr r1, [r6]
	adds r4, r4, r1
	ldr r1, [r4]
	adds r1, r1, r5
	strb r3, [r1]
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0802EA8C: .4byte gBmMapTerrain

	THUMB_FUNC_START RemoveLightRune
RemoveLightRune: @ 0x0802EA90
	push {r4, lr}
	adds r4, r0, #0
	ldrb r0, [r4]
	ldrb r1, [r4, #1]
	bl GetSomeTerrainToChangeAtSomePosition
	ldrb r1, [r4, #1]
	ldr r2, _0802EABC  @ gBmMapTerrain
	ldr r2, [r2]
	lsls r1, r1, #2
	adds r1, r1, r2
	ldrb r2, [r4]
	ldr r1, [r1]
	adds r1, r1, r2
	strb r0, [r1]
	adds r0, r4, #0
	bl RemoveTrap
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0802EABC: .4byte gBmMapTerrain

	THUMB_FUNC_START HandleTrapDecay
HandleTrapDecay: @ 0x0802EAC0
	push {r4, lr}
	ldr r4, _0802EAC8  @ gUnknown_0203A614
	b _0802EB02
	.align 2, 0
_0802EAC8: .4byte gUnknown_0203A614
_0802EACC:
	ldrb r0, [r4, #2]
	cmp r0, #0xa
	beq _0802EAD8
	cmp r0, #0xd
	beq _0802EAEC
	b _0802EB00
_0802EAD8:
	ldrb r0, [r4, #3]
	subs r0, #1
	strb r0, [r4, #3]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0802EB00
	adds r0, r4, #0
	bl RemoveTrap
	b _0802EAFE
_0802EAEC:
	ldrb r0, [r4, #6]
	subs r0, #1
	strb r0, [r4, #6]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0802EB00
	adds r0, r4, #0
	bl RemoveLightRune
_0802EAFE:
	subs r4, #8
_0802EB00:
	adds r4, #8
_0802EB02:
	ldrb r0, [r4, #2]
	cmp r0, #0
	bne _0802EACC
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_START BattleSomethingTrapChangeTerrain
BattleSomethingTrapChangeTerrain: @ 0x0802EB10
	push {r4, lr}
	ldr r4, _0802EB18  @ gUnknown_0203A614
	b _0802EB3E
	.align 2, 0
_0802EB18: .4byte gUnknown_0203A614
_0802EB1C:
	ldrb r0, [r4, #2]
	cmp r0, #0xd
	bne _0802EB3C
	ldrb r0, [r4]
	ldrb r1, [r4, #1]
	bl GetSomeTerrainToChangeAtSomePosition
	ldrb r2, [r4, #1]
	ldr r1, _0802EB4C  @ gBmMapTerrain
	ldr r1, [r1]
	lsls r2, r2, #2
	adds r2, r2, r1
	ldrb r3, [r4]
	ldr r1, [r2]
	adds r1, r1, r3
	strb r0, [r1]
_0802EB3C:
	adds r4, #8
_0802EB3E:
	ldrb r0, [r4, #2]
	cmp r0, #0
	bne _0802EB1C
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802EB4C: .4byte gBmMapTerrain

	THUMB_FUNC_START NullAllLightRunesTerrain
NullAllLightRunesTerrain: @ 0x0802EB50
	push {r4, lr}
	ldr r2, _0802EB84  @ gUnknown_0203A614
	ldrb r0, [r2, #2]
	cmp r0, #0
	beq _0802EB7C
	ldr r4, _0802EB88  @ gBmMapTerrain
	movs r3, #0
_0802EB5E:
	ldrb r0, [r2, #2]
	cmp r0, #0xd
	bne _0802EB74
	ldrb r0, [r2, #1]
	ldr r1, [r4]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r1, [r2]
	ldr r0, [r0]
	adds r0, r0, r1
	strb r3, [r0]
_0802EB74:
	adds r2, #8
	ldrb r0, [r2, #2]
	cmp r0, #0
	bne _0802EB5E
_0802EB7C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802EB84: .4byte gUnknown_0203A614
_0802EB88: .4byte gBmMapTerrain

	THUMB_FUNC_START GetTrap
GetTrap: @ 0x0802EB8C
	lsls r0, r0, #3
	ldr r1, _0802EB94  @ gUnknown_0203A614
	adds r0, r0, r1
	bx lr
	.align 2, 0
_0802EB94: .4byte gUnknown_0203A614

.align 2, 0
