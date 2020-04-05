	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	@ Does checks related to whether a unit can do certain actions on certain tiles
	@ None of this is used, even in the debug version of the game
	@ However, in the debug version, GetUnitCommandUseFlags does some printing to debug console

	THUMB_FUNC_START CanUnitUseVisit
CanUnitUseVisit: @ 0x08034314
	push {r4, r5, r6, r7, lr}
	ldr r0, _08034328  @ gActiveUnit
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08034330
	b _08034392
	.align 2, 0
_08034328: .4byte gActiveUnit
_0803432C:
	movs r0, #1
	b _08034394
_08034330:
	ldr r0, _0803439C  @ gBmMapSize
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r5, r0, #1
	cmp r5, #0
	blt _08034392
_0803433C:
	ldr r0, _0803439C  @ gBmMapSize
	movs r1, #0
	ldrsh r0, [r0, r1]
	subs r4, r0, #1
	cmp r4, #0
	blt _0803438C
	lsls r6, r5, #2
	lsls r7, r5, #0x18
_0803434C:
	ldr r0, _080343A0  @ gBmMapMovement
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _08034386
	ldr r0, _080343A4  @ gBmMapTerrain
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #3
	beq _08034378
	cmp r0, #5
	beq _08034378
	cmp r0, #0x38
	beq _08034378
	cmp r0, #0x37
	bne _08034386
_08034378:
	lsls r0, r4, #0x18
	asrs r0, r0, #0x18
	asrs r1, r7, #0x18
	bl GetAvailableLocaCommandAt
	cmp r0, #0x10
	beq _0803432C
_08034386:
	subs r4, #1
	cmp r4, #0
	bge _0803434C
_0803438C:
	subs r5, #1
	cmp r5, #0
	bge _0803433C
_08034392:
	movs r0, #0
_08034394:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0803439C: .4byte gBmMapSize
_080343A0: .4byte gBmMapMovement
_080343A4: .4byte gBmMapTerrain

	THUMB_FUNC_END CanUnitUseVisit

	THUMB_FUNC_START CanUnitUseSeize
CanUnitUseSeize: @ 0x080343A8
	push {r4, r5, r6, lr}
	ldr r0, _080343C8  @ gActiveUnit
	ldr r2, [r0]
	ldr r0, [r2, #0xc]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	bne _08034416
	adds r0, r2, #0
	bl CanUnitSeize
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080343D0
	b _08034416
	.align 2, 0
_080343C8: .4byte gActiveUnit
_080343CC:
	movs r0, #1
	b _08034418
_080343D0:
	ldr r0, _08034420  @ gBmMapSize
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r5, r0, #1
	cmp r5, #0
	blt _08034416
_080343DC:
	ldr r0, _08034420  @ gBmMapSize
	movs r1, #0
	ldrsh r0, [r0, r1]
	subs r4, r0, #1
	cmp r4, #0
	blt _08034410
	lsls r6, r5, #0x18
_080343EA:
	ldr r0, _08034424  @ gBmMapMovement
	ldr r1, [r0]
	lsls r0, r5, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _0803440A
	lsls r0, r4, #0x18
	asrs r0, r0, #0x18
	asrs r1, r6, #0x18
	bl GetAvailableLocaCommandAt
	cmp r0, #0x11
	beq _080343CC
_0803440A:
	subs r4, #1
	cmp r4, #0
	bge _080343EA
_08034410:
	subs r5, #1
	cmp r5, #0
	bge _080343DC
_08034416:
	movs r0, #0
_08034418:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08034420: .4byte gBmMapSize
_08034424: .4byte gBmMapMovement

	THUMB_FUNC_END CanUnitUseSeize

	THUMB_FUNC_START CanUnitUseAttack
CanUnitUseAttack: @ 0x08034428
	push {r4, lr}
	movs r0, #0
	movs r1, #0
	bl InitTargets
	ldr r0, _08034460  @ gBmMapRange
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFill
	ldr r4, _08034464  @ gActiveUnit
	ldr r0, [r4]
	bl GenerateUnitCompleteAttackRange
	ldr r1, _08034468  @ gUnknown_02033F3C
	ldr r0, [r4]
	str r0, [r1]
	ldr r0, _0803446C  @ AddUnitToTargetListIfNotAllied
	bl ForEachUnitInRange
	bl sub_804FD28
	cmp r0, #0
	beq _0803445A
	movs r0, #1
_0803445A:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08034460: .4byte gBmMapRange
_08034464: .4byte gActiveUnit
_08034468: .4byte gUnknown_02033F3C
_0803446C: .4byte AddUnitToTargetListIfNotAllied

	THUMB_FUNC_END CanUnitUseAttack

	THUMB_FUNC_START CanActiveUnitUseRescue
CanActiveUnitUseRescue: @ 0x08034470
	push {lr}
	ldr r0, _08034488  @ gActiveUnit
	ldr r0, [r0]
	bl MakeRescueTargetList
	bl sub_804FD28
	cmp r0, #0
	beq _08034484
	movs r0, #1
_08034484:
	pop {r1}
	bx r1
	.align 2, 0
_08034488: .4byte gActiveUnit

	THUMB_FUNC_END CanActiveUnitUseRescue

	THUMB_FUNC_START CanActiveUnitUseTrade
CanActiveUnitUseTrade: @ 0x0803448C
	push {lr}
	ldr r0, _080344A4  @ gActiveUnit
	ldr r0, [r0]
	bl MakeTradeTargetList
	bl sub_804FD28
	cmp r0, #0
	beq _080344A0
	movs r0, #1
_080344A0:
	pop {r1}
	bx r1
	.align 2, 0
_080344A4: .4byte gActiveUnit

	THUMB_FUNC_END CanActiveUnitUseTrade

	THUMB_FUNC_START GetUnitCommandUseFlags
GetUnitCommandUseFlags: @ 0x080344A8
	push {r4, lr}
	bl GetGameClock
	bl CanUnitUseVisit
	adds r4, r0, #0
	lsls r4, r4, #0x18
	asrs r4, r4, #9
	bl CanUnitUseSeize
	lsls r0, r0, #0x18
	asrs r0, r0, #8
	orrs r4, r0
	bl CanUnitUseAttack
	lsls r0, r0, #0x18
	asrs r0, r0, #0x17
	orrs r4, r0
	bl CanActiveUnitUseRescue
	lsls r0, r0, #0x18
	asrs r0, r0, #0x10
	orrs r4, r0
	bl CanActiveUnitUseTrade
	lsls r0, r0, #0x18
	asrs r0, r0, #1
	orrs r4, r0
	adds r0, r4, #0
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END GetUnitCommandUseFlags

	THUMB_FUNC_START sub_80344E8
sub_80344E8: @ 0x080344E8
	push {lr}
	ldr r0, _0803450C  @ gActiveUnit
	ldr r0, [r0]
	ldr r1, [r0, #4]
	ldrb r1, [r1, #0x12]
	ldrb r2, [r0, #0x1d]
	adds r1, r1, r2
	ldr r2, _08034510  @ gActionData
	ldrb r2, [r2, #0x10]
	subs r1, r1, r2
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl GenerateUnitMovementMapExt
	bl GetUnitCommandUseFlags
	pop {r1}
	bx r1
	.align 2, 0
_0803450C: .4byte gActiveUnit
_08034510: .4byte gActionData

	THUMB_FUNC_END sub_80344E8

	THUMB_FUNC_START sub_8034514
sub_8034514: @ 0x08034514
	push {r4, lr}
	ldr r4, _08034548  @ gBmMapMovement
	ldr r0, [r4]
	movs r1, #1
	negs r1, r1
	bl BmMapFill
	ldr r0, _0803454C  @ gActiveUnit
	ldr r2, [r0]
	movs r0, #0x11
	ldrsb r0, [r2, r0]
	ldr r1, [r4]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	ldr r0, [r0]
	adds r0, r0, r1
	movs r1, #0
	strb r1, [r0]
	bl GetUnitCommandUseFlags
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08034548: .4byte gBmMapMovement
_0803454C: .4byte gActiveUnit

	THUMB_FUNC_END sub_8034514

	THUMB_FUNC_START sub_8034550
sub_8034550: @ 0x08034550
	push {r4, r5, r6, r7, lr}
	movs r1, #1
	negs r1, r1
	bl GetUnitWeaponReachBits
	adds r7, r0, #0
	ldr r0, _08034604  @ gBmMapUnk
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFill
	movs r5, #0x81
	ldr r6, _08034608  @ gActionData
_0803456A:
	adds r0, r5, #0
	bl GetUnit
	adds r4, r0, #0
	cmp r4, #0
	beq _0803458C
	ldr r0, [r4]
	cmp r0, #0
	beq _0803458C
	adds r0, r4, #0
	adds r1, r7, #0
	bl GenerateUnitStandingReachRange
	ldrb r0, [r4, #0x10]
	strb r0, [r6, #0x13]
	ldrb r0, [r4, #0x11]
	strb r0, [r6, #0x14]
_0803458C:
	adds r5, #1
	cmp r5, #0xbf
	ble _0803456A
	movs r0, #0
	movs r1, #0
	bl InitTargets
	ldr r0, _0803460C  @ gBmMapSize
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r6, r0, #1
	cmp r6, #0
	blt _080345FE
_080345A6:
	ldr r0, _0803460C  @ gBmMapSize
	movs r1, #0
	ldrsh r0, [r0, r1]
	subs r4, r0, #1
	subs r7, r6, #1
	cmp r4, #0
	blt _080345F8
	lsls r5, r6, #2
_080345B6:
	ldr r0, _08034610  @ gBmMapMovement
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _080345F2
	ldr r0, _08034614  @ gBmMapUnit
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0
	bne _080345F2
	ldr r0, _08034604  @ gBmMapUnk
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0
	beq _080345F2
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #1
	movs r3, #1
	bl AddTarget
_080345F2:
	subs r4, #1
	cmp r4, #0
	bge _080345B6
_080345F8:
	adds r6, r7, #0
	cmp r6, #0
	bge _080345A6
_080345FE:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08034604: .4byte gBmMapUnk
_08034608: .4byte gActionData
_0803460C: .4byte gBmMapSize
_08034610: .4byte gBmMapMovement
_08034614: .4byte gBmMapUnit

	THUMB_FUNC_END sub_8034550

.align 2, 0
