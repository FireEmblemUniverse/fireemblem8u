	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	@ Unit Action stuff (why "mind"?)

	THUMB_FUNC_START sub_80325AC
sub_80325AC: @ 0x080325AC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r6, r0, #0
	movs r0, #0x38
	ldrsh r1, [r6, r0]
	movs r3, #0x3c
	ldrsh r2, [r6, r3]
	adds r7, r6, #0
	adds r7, #0x46
	movs r4, #0
	ldrsh r3, [r7, r4]
	adds r5, r6, #0
	adds r5, #0x48
	movs r4, #0
	ldrsh r0, [r5, r4]
	str r0, [sp]
	movs r0, #0
	bl sub_8012DCC
	mov r8, r0
	movs r0, #0x3a
	ldrsh r1, [r6, r0]
	movs r3, #0x3e
	ldrsh r2, [r6, r3]
	movs r4, #0
	ldrsh r3, [r7, r4]
	movs r4, #0
	ldrsh r0, [r5, r4]
	str r0, [sp]
	movs r0, #0
	bl sub_8012DCC
	adds r2, r0, #0
	adds r1, r6, #0
	adds r1, #0x40
	movs r3, #0
	ldrsh r0, [r1, r3]
	adds r2, r2, r0
	adds r3, r6, #0
	adds r3, #0x42
	ldrh r0, [r3]
	ldrh r4, [r1]
	adds r0, r0, r4
	strh r0, [r1]
	adds r0, r6, #0
	adds r0, #0x44
	ldrh r0, [r0]
	ldrh r1, [r3]
	adds r0, r0, r1
	strh r0, [r3]
	ldr r1, _08032654  @ gUnknown_0202BCB0
	movs r3, #0xc
	ldrsh r0, [r1, r3]
	mov r3, r8
	subs r4, r3, r0
	movs r3, #0xe
	ldrsh r0, [r1, r3]
	subs r2, r2, r0
	ldr r3, [r6, #0x2c]
	movs r0, #7
	adds r1, r4, #0
	bl sub_8027B60
	ldrh r0, [r7]
	adds r0, #1
	strh r0, [r7]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r4, #0
	ldrsh r1, [r5, r4]
	cmp r0, r1
	bne _08032646
	adds r0, r6, #0
	bl Proc_Break
_08032646:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08032654: .4byte gUnknown_0202BCB0

	THUMB_FUNC_END sub_80325AC

	THUMB_FUNC_START sub_8032658
sub_8032658: @ 0x08032658
	push {lr}
	ldr r1, [r0, #0x2c]
	bl sub_8037830
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8032658

	THUMB_FUNC_START sub_8032664
sub_8032664: @ 0x08032664
	push {lr}
	bl RefreshEntityBmMaps
	bl SMS_UpdateFromGameData
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8032664

	THUMB_FUNC_START sub_8032674
sub_8032674: @ 0x08032674
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r0, r5, #0
	bl GetUnitCurrentHp
	adds r6, r0, #0
	cmp r6, #0
	bne _08032716
	ldr r0, [r5, #0xc]
	movs r1, #0x10
	ands r0, r1
	cmp r0, #0
	beq _08032716
	ldr r0, _0803271C  @ gUnknown_0859DA94
	adds r1, r4, #0
	bl Proc_StartBlocking
	adds r4, r0, #0
	ldrb r0, [r5, #0x1b]
	bl GetUnit
	str r0, [r4, #0x2c]
	adds r1, r4, #0
	adds r1, #0x30
	adds r2, r4, #0
	adds r2, #0x34
	adds r0, r5, #0
	bl UnitGetDeathDropLocation
	ldr r1, [r4, #0x30]
	ldr r2, [r4, #0x34]
	adds r0, r5, #0
	bl UnitDrop
	movs r0, #0x10
	ldrsb r0, [r5, r0]
	lsls r0, r0, #4
	strh r0, [r4, #0x38]
	movs r0, #0x11
	ldrsb r0, [r5, r0]
	lsls r0, r0, #4
	strh r0, [r4, #0x3a]
	ldr r0, [r4, #0x30]
	lsls r0, r0, #4
	strh r0, [r4, #0x3c]
	ldr r0, [r4, #0x34]
	lsls r0, r0, #4
	strh r0, [r4, #0x3e]
	adds r0, r4, #0
	adds r0, #0x40
	strh r6, [r0]
	adds r1, r4, #0
	adds r1, #0x42
	ldr r0, _08032720  @ 0x0000FFFB
	strh r0, [r1]
	adds r1, #2
	movs r0, #1
	strh r0, [r1]
	adds r0, r4, #0
	adds r0, #0x46
	strh r6, [r0]
	adds r1, #4
	movs r0, #0xb
	strh r0, [r1]
	ldr r0, [r4, #0x2c]
	bl GetUnitSMSId
	bl SMS_RegisterUsage
	bl SMS_FlushIndirect
	ldr r0, _08032724  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08032716
	movs r0, #0xac
	bl m4aSongNumStart
_08032716:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0803271C: .4byte gUnknown_0859DA94
_08032720: .4byte 0x0000FFFB
_08032724: .4byte gRAMChapterData

	THUMB_FUNC_END sub_8032674

	THUMB_FUNC_START sub_8032728
sub_8032728: @ 0x08032728
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	bl GetUnitCurrentHp
	cmp r0, #0
	bne _0803274A
	ldr r0, [r4]
	ldrb r0, [r0, #4]
	ldr r1, [r5]
	ldrb r1, [r1, #4]
	movs r2, #2
	bl BWL_AddWinOrLossIdk
	adds r0, r4, #0
	bl UnitKill
_0803274A:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8032728

	THUMB_FUNC_START sub_8032750
sub_8032750: @ 0x08032750
	push {r4, lr}
	adds r4, r0, #0
	bl GetUnitCurrentHp
	cmp r0, #0
	bne _0803276E
	adds r0, r4, #0
	bl UnitKill
	ldr r0, [r4]
	ldrb r0, [r0, #4]
	movs r1, #0
	movs r2, #6
	bl BWL_AddWinOrLossIdk
_0803276E:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8032750

	THUMB_FUNC_START BATTLE_GOTO1_IfNobodyIsDead
BATTLE_GOTO1_IfNobodyIsDead: @ 0x08032774
	push {lr}
	adds r2, r0, #0
	ldr r0, _080327A8  @ gBattleStats
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0803279C
	ldr r0, _080327AC  @ gBattleActor
	ldrb r0, [r0, #0x13]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _080327A4
	ldr r0, _080327B0  @ gBattleTarget
	ldrb r0, [r0, #0x13]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _080327A4
_0803279C:
	adds r0, r2, #0
	movs r1, #1
	bl Proc_Goto
_080327A4:
	pop {r0}
	bx r0
	.align 2, 0
_080327A8: .4byte gBattleStats
_080327AC: .4byte gBattleActor
_080327B0: .4byte gBattleTarget

	THUMB_FUNC_END BATTLE_GOTO1_IfNobodyIsDead

	THUMB_FUNC_START DidUnitDie
DidUnitDie: @ 0x080327B4
	push {lr}
	bl GetUnitCurrentHp
	cmp r0, #0
	bne _080327C2
	movs r0, #1
	b _080327C4
_080327C2:
	movs r0, #0
_080327C4:
	pop {r1}
	bx r1

	THUMB_FUNC_END DidUnitDie

	THUMB_FUNC_START BATTLE_ProbablyMakesTheDeadUnitDissapear
BATTLE_ProbablyMakesTheDeadUnitDissapear: @ 0x080327C8
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	movs r0, #0
	str r0, [r6, #0x54]
	ldr r7, _08032850  @ gBattleActor
	adds r0, r7, #0
	bl DidUnitDie
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080327F2
	ldr r0, _08032854  @ gProcScr_MoveUnit
	bl Proc_Find
	adds r4, r0, #0
	bl MU_StartDeathFade
	str r4, [r6, #0x54]
	adds r0, r7, #0
	bl TryRemoveUnitFromBallista
_080327F2:
	ldr r5, _08032858  @ gBattleTarget
	adds r0, r5, #0
	bl DidUnitDie
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803284A
	movs r0, #0xb
	ldrsb r0, [r5, r0]
	bl GetUnit
	ldr r1, [r0, #0xc]
	movs r2, #1
	orrs r1, r2
	str r1, [r0, #0xc]
	bl TryRemoveUnitFromBallista
	bl SMS_UpdateFromGameData
	adds r0, r5, #0
	bl MU_Create
	adds r4, r0, #0
	movs r0, #0x10
	ldrsb r0, [r7, r0]
	movs r1, #0x11
	ldrsb r1, [r7, r1]
	movs r2, #0x10
	ldrsb r2, [r5, r2]
	movs r3, #0x11
	ldrsb r3, [r5, r3]
	bl GetFacingDirection
	ldr r1, _0803285C  @ gWorkingMovementScript
	strb r0, [r1]
	movs r0, #4
	strb r0, [r1, #1]
	adds r0, r4, #0
	bl MU_StartMoveScript
	adds r0, r4, #0
	bl MU_StartDeathFade
	str r4, [r6, #0x54]
_0803284A:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08032850: .4byte gBattleActor
_08032854: .4byte gProcScr_MoveUnit
_08032858: .4byte gBattleTarget
_0803285C: .4byte gWorkingMovementScript

	THUMB_FUNC_END BATTLE_ProbablyMakesTheDeadUnitDissapear

	THUMB_FUNC_START BATTLE_DeleteLinkedMOVEUNIT
BATTLE_DeleteLinkedMOVEUNIT: @ 0x08032860
	push {lr}
	ldr r0, [r0, #0x54]
	bl MU_End
	pop {r0}
	bx r0

	THUMB_FUNC_END BATTLE_DeleteLinkedMOVEUNIT

	THUMB_FUNC_START sub_803286C
sub_803286C: @ 0x0803286C
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r0, #0x64
	movs r1, #0
	ldrsh r0, [r0, r1]
	bl GetUnit
	adds r6, r0, #0
	adds r0, r5, #0
	adds r0, #0x66
	movs r1, #0
	ldrsh r0, [r0, r1]
	bl GetUnit
	adds r4, r0, #0
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_8032674
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_8032674
	adds r0, r6, #0
	adds r1, r4, #0
	bl sub_8032728
	adds r0, r4, #0
	adds r1, r6, #0
	bl sub_8032728
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_803286C

	THUMB_FUNC_START sub_80328B0
sub_80328B0: @ 0x080328B0
	push {r4, lr}
	bl GetCurrentMapMusicIndex
	adds r4, r0, #0
	bl Sound_GetCurrentSong
	cmp r0, r4
	beq _080328CA
	adds r0, r4, #0
	movs r1, #6
	movs r2, #0
	bl Sound_PlaySong80024E4
_080328CA:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80328B0

	THUMB_FUNC_START BATTLE_HandleItemDrop
BATTLE_HandleItemDrop: @ 0x080328D0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	movs r7, #0
	ldr r6, _08032960  @ gBattleActor
	movs r1, #0xb
	ldrsb r1, [r6, r1]
	adds r0, #0x64
	strh r1, [r0]
	ldr r4, _08032964  @ gBattleTarget
	movs r0, #0xb
	ldrsb r0, [r4, r0]
	mov r1, r8
	adds r1, #0x66
	strh r0, [r1]
	movs r0, #0x13
	ldrsb r0, [r6, r0]
	cmp r0, #0
	bne _0803290C
	movs r0, #0xb
	ldrsb r0, [r6, r0]
	bl GetUnit
	adds r7, r0, #0
	movs r0, #0xb
	ldrsb r0, [r4, r0]
	bl GetUnit
	adds r5, r0, #0
_0803290C:
	movs r0, #0x13
	ldrsb r0, [r4, r0]
	cmp r0, #0
	bne _08032928
	movs r0, #0xb
	ldrsb r0, [r4, r0]
	bl GetUnit
	adds r7, r0, #0
	movs r0, #0xb
	ldrsb r0, [r6, r0]
	bl GetUnit
	adds r5, r0, #0
_08032928:
	cmp r7, #0
	beq _08032968
	ldr r0, [r7, #0xc]
	movs r1, #0x80
	lsls r1, r1, #5
	ands r0, r1
	cmp r0, #0
	beq _08032968
	ldrh r0, [r7, #0x1e]
	cmp r0, #0
	beq _08032968
	movs r0, #0xb
	ldrsb r0, [r5, r0]
	movs r1, #0xc0
	ands r0, r1
	cmp r0, #0
	bne _08032968
	adds r0, r7, #0
	bl GetUnitLastItem
	adds r1, r0, #0
	adds r0, r5, #0
	mov r2, r8
	bl NewGeneralItemGot
	movs r0, #0
	b _0803296A
	.align 2, 0
_08032960: .4byte gBattleActor
_08032964: .4byte gBattleTarget
_08032968:
	movs r0, #1
_0803296A:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END BATTLE_HandleItemDrop

	THUMB_FUNC_START sub_8032974
sub_8032974: @ 0x08032974
	push {lr}
	adds r2, r0, #0
	ldr r1, _08032998  @ gBattleTarget
	movs r0, #1
	strb r0, [r1, #0x12]
	strb r0, [r1, #0x13]
	ldr r0, _0803299C  @ gBattleActor
	ldrb r0, [r0, #0x13]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _08032994
	adds r0, r2, #0
	movs r1, #1
	bl Proc_Goto
_08032994:
	pop {r0}
	bx r0
	.align 2, 0
_08032998: .4byte gBattleTarget
_0803299C: .4byte gBattleActor

	THUMB_FUNC_END sub_8032974

	THUMB_FUNC_START sub_80329A0
sub_80329A0: @ 0x080329A0
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _080329BC  @ gActiveUnit
	ldr r0, [r4]
	bl sub_8032750
	ldr r1, [r4]
	adds r0, r5, #0
	bl sub_8032674
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080329BC: .4byte gActiveUnit

	THUMB_FUNC_END sub_80329A0

	THUMB_FUNC_START sub_80329C0
sub_80329C0: @ 0x080329C0
	push {r4, lr}
	ldr r4, _080329D4  @ gUnknown_0203A974
	adds r1, r4, #0
	movs r2, #7
	bl CpuFastSet
	adds r0, r4, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080329D4: .4byte gUnknown_0203A974

	THUMB_FUNC_END sub_80329C0

.align 2, 0
