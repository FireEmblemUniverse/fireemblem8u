	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	@ Battle logic
	@ Huge

	THUMB_FUNC_START sub_802A13C
sub_802A13C: @ 0x0802A13C
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	mov r8, r0
	mov r9, r1
	adds r4, r2, #0
	adds r5, r3, #0
	ldr r6, _0802A188  @ gUnknown_0203A4EC
	adds r0, r6, #0
	mov r1, r8
	bl CopyUnitToBattleStruct
	ldr r7, _0802A18C  @ gUnknown_0203A56C
	adds r0, r7, #0
	mov r1, r9
	bl CopyUnitToBattleStruct
	strb r4, [r6, #0x10]
	strb r5, [r6, #0x11]
	ldr r4, _0802A190  @ gUnknown_0203A4D4
	movs r2, #0x10
	ldrsb r2, [r6, r2]
	movs r0, #0x10
	ldrsb r0, [r7, r0]
	subs r1, r2, r0
	cmp r1, #0
	bge _0802A176
	subs r1, r0, r2
_0802A176:
	movs r3, #0x11
	ldrsb r3, [r6, r3]
	movs r0, #0x11
	ldrsb r0, [r7, r0]
	subs r2, r3, r0
	cmp r2, #0
	blt _0802A194
	adds r0, r1, r2
	b _0802A198
	.align 2, 0
_0802A188: .4byte gUnknown_0203A4EC
_0802A18C: .4byte gUnknown_0203A56C
_0802A190: .4byte gUnknown_0203A4D4
_0802A194:
	subs r0, r0, r3
	adds r0, r1, r0
_0802A198:
	strb r0, [r4, #2]
	ldr r0, _0802A1B0  @ gUnknown_0203A4D4
	ldrh r1, [r0]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _0802A1B8
	ldr r0, _0802A1B4  @ gUnknown_0203A4EC
	bl SetupBattleBallistaWeaponData
	b _0802A1C0
	.align 2, 0
_0802A1B0: .4byte gUnknown_0203A4D4
_0802A1B4: .4byte gUnknown_0203A4EC
_0802A1B8:
	ldr r0, _0802A204  @ gUnknown_0203A4EC
	ldr r1, [sp, #0x1c]
	bl SetupBattleWeaponData
_0802A1C0:
	ldr r4, _0802A208  @ gUnknown_0203A56C
	movs r1, #1
	negs r1, r1
	adds r0, r4, #0
	bl SetupBattleWeaponData
	bl DoSomeBattleWeaponStuff
	ldr r5, _0802A204  @ gUnknown_0203A4EC
	adds r0, r5, #0
	adds r1, r4, #0
	bl BattleApplyWeaponTriangle
	bl BattleSomethingTrapChangeTerrain
	adds r0, r5, #0
	bl BattleSetupTerrainData
	adds r0, r4, #0
	bl BattleSetupTerrainData
	mov r0, r8
	mov r1, r9
	bl sub_802A398
	bl NullAllLightRunesTerrain
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802A204: .4byte gUnknown_0203A4EC
_0802A208: .4byte gUnknown_0203A56C

	THUMB_FUNC_START sub_802A20C
sub_802A20C: @ 0x0802A20C
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r7, r1, #0
	ldr r5, _0802A24C  @ gUnknown_0203A4EC
	adds r0, r5, #0
	adds r1, r6, #0
	bl CopyUnitToBattleStruct
	ldr r4, _0802A250  @ gUnknown_0203A56C
	adds r0, r4, #0
	adds r1, r7, #0
	bl CopyUnitToBattleStruct
	ldr r0, _0802A254  @ gUnknown_0203A4D4
	mov ip, r0
	movs r2, #0x10
	ldrsb r2, [r5, r2]
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	subs r1, r2, r0
	cmp r1, #0
	bge _0802A23A
	subs r1, r0, r2
_0802A23A:
	movs r3, #0x11
	ldrsb r3, [r5, r3]
	movs r0, #0x11
	ldrsb r0, [r4, r0]
	subs r2, r3, r0
	cmp r2, #0
	blt _0802A258
	adds r0, r1, r2
	b _0802A25C
	.align 2, 0
_0802A24C: .4byte gUnknown_0203A4EC
_0802A250: .4byte gUnknown_0203A56C
_0802A254: .4byte gUnknown_0203A4D4
_0802A258:
	subs r0, r0, r3
	adds r0, r1, r0
_0802A25C:
	mov r1, ip
	strb r0, [r1, #2]
	ldr r0, _0802A274  @ gUnknown_0203A4D4
	ldrh r1, [r0]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _0802A27C
	ldr r0, _0802A278  @ gUnknown_0203A4EC
	bl SetupBattleBallistaWeaponData
	b _0802A286
	.align 2, 0
_0802A274: .4byte gUnknown_0203A4D4
_0802A278: .4byte gUnknown_0203A4EC
_0802A27C:
	ldr r0, _0802A2EC  @ gUnknown_0203A4EC
	movs r1, #1
	negs r1, r1
	bl SetupBattleWeaponData
_0802A286:
	ldr r4, _0802A2F0  @ gUnknown_0203A56C
	movs r1, #1
	negs r1, r1
	adds r0, r4, #0
	bl SetupBattleWeaponData
	bl DoSomeBattleWeaponStuff
	ldr r5, _0802A2EC  @ gUnknown_0203A4EC
	adds r0, r5, #0
	adds r1, r4, #0
	bl BattleApplyWeaponTriangle
	bl BattleSomethingTrapChangeTerrain
	adds r0, r5, #0
	bl BattleSetupTerrainData
	adds r0, r4, #0
	bl BattleSetupTerrainData
	adds r0, r6, #0
	adds r1, r7, #0
	bl sub_802A398
	bl NullAllLightRunesTerrain
	adds r0, r4, #0
	bl sub_802C740
	adds r0, r4, #0
	bl sub_802C6EC
	movs r0, #0xb
	ldrsb r0, [r4, r0]
	cmp r0, #0
	beq _0802A2E4
	bl sub_802B92C
	bl sub_80A4AA4
	adds r0, r6, #0
	bl sub_80A44C8
	adds r0, r7, #0
	bl sub_80A44C8
_0802A2E4:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802A2EC: .4byte gUnknown_0203A4EC
_0802A2F0: .4byte gUnknown_0203A56C

	THUMB_FUNC_START BATTLE_SaveFromBattle
BATTLE_SaveFromBattle: @ 0x0802A2F4
	push {lr}
	bl SaveUnitsFromBattle
	bl UpdateBallistaUsesFromBattle
	ldr r0, _0802A310  @ gUnknown_0203A4EC
	ldr r1, _0802A314  @ gUnknown_0203A56C
	bl nullsub_11
	bl sub_802CAFC
	pop {r0}
	bx r0
	.align 2, 0
_0802A310: .4byte gUnknown_0203A4EC
_0802A314: .4byte gUnknown_0203A56C

	THUMB_FUNC_START sub_802A318
sub_802A318: @ 0x0802A318
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	cmp r2, #0
	bge _0802A330
	cmp r3, #0
	bge _0802A330
	movs r2, #0x10
	ldrsb r2, [r4, r2]
	movs r3, #0x11
	ldrsb r3, [r4, r3]
_0802A330:
	ldr r0, _0802A34C  @ gUnknown_0203A4D4
	movs r1, #2
	strh r1, [r0]
	ldr r0, [sp, #0x10]
	str r0, [sp]
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_802A13C
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802A34C: .4byte gUnknown_0203A4D4

	THUMB_FUNC_START sub_802A350
sub_802A350: @ 0x0802A350
	push {lr}
	ldr r3, _0802A360  @ gUnknown_0203A4D4
	movs r2, #1
	strh r2, [r3]
	bl sub_802A20C
	pop {r0}
	bx r0
	.align 2, 0
_0802A360: .4byte gUnknown_0203A4D4

	THUMB_FUNC_START sub_802A364
sub_802A364: @ 0x0802A364
	push {r4, r5, r6, lr}
	sub sp, #4
	ldr r5, _0802A380  @ gUnknown_0203A4D4
	movs r6, #0
	movs r4, #0xa
	strh r4, [r5]
	str r6, [sp]
	bl sub_802A13C
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802A380: .4byte gUnknown_0203A4D4

	THUMB_FUNC_START sub_802A384
sub_802A384: @ 0x0802A384
	push {lr}
	ldr r3, _0802A394  @ gUnknown_0203A4D4
	movs r2, #9
	strh r2, [r3]
	bl sub_802A20C
	pop {r0}
	bx r0
	.align 2, 0
_0802A394: .4byte gUnknown_0203A4D4

	THUMB_FUNC_START sub_802A398
sub_802A398: @ 0x0802A398
	push {r4, r5, r6, lr}
	adds r6, r1, #0
	ldr r5, _0802A3E4  @ gUnknown_0203A4EC
	ldr r4, _0802A3E8  @ gUnknown_0203A56C
	adds r0, r5, #0
	adds r1, r4, #0
	bl FillPreBattleStats
	adds r0, r4, #0
	adds r1, r5, #0
	bl FillPreBattleStats
	adds r0, r5, #0
	adds r1, r4, #0
	bl FillBattleStats
	adds r0, r4, #0
	adds r1, r5, #0
	bl FillBattleStats
	cmp r6, #0
	bne _0802A3C8
	bl FillSnagBattleStats
_0802A3C8:
	ldr r0, _0802A3EC  @ gUnknown_0203A4D4
	ldrh r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0802A3F4
	ldr r0, _0802A3F0  @ gUnknown_0203A958
	ldr r0, [r0, #0x18]
	cmp r0, #0
	beq _0802A3F4
	bl sub_802CF4C
	b _0802A3F8
	.align 2, 0
_0802A3E4: .4byte gUnknown_0203A4EC
_0802A3E8: .4byte gUnknown_0203A56C
_0802A3EC: .4byte gUnknown_0203A4D4
_0802A3F0: .4byte gUnknown_0203A958
_0802A3F4:
	bl MakeBattle
_0802A3F8:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_START SetupBattleStructFromUnitAndWeapon
SetupBattleStructFromUnitAndWeapon: @ 0x0802A400
	push {r4, r5, r6, r7, lr}
	sub sp, #0x48
	adds r7, r0, #0
	lsls r1, r1, #0x18
	lsrs r6, r1, #0x18
	ldr r1, _0802A460  @ gUnknown_0203A4D4
	movs r3, #0
	movs r2, #0
	movs r0, #4
	strh r0, [r1]
	ldr r0, _0802A464  @ gUnknown_0203A56C
	mov ip, r0
	adds r0, #0x48
	strh r2, [r0]
	mov r0, ip
	str r2, [r0, #0x4c]
	mov r1, ip
	adds r1, #0x50
	movs r0, #0xff
	strb r0, [r1]
	mov r0, ip
	str r2, [r0, #4]
	ldr r5, _0802A468  @ gUnknown_0203A4EC
	adds r0, r5, #0
	adds r0, #0x53
	strb r3, [r0]
	adds r0, #1
	strb r3, [r0]
	lsls r4, r6, #0x18
	lsrs r0, r4, #0x18
	cmp r0, #4
	bhi _0802A46C
	mov r0, sp
	adds r1, r7, #0
	movs r2, #0x48
	bl memcpy
	asrs r1, r4, #0x18
	mov r0, sp
	bl EquipUnitItemSlot
	movs r6, #0
	adds r0, r5, #0
	mov r1, sp
	bl CopyUnitToBattleStruct
	b _0802A474
	.align 2, 0
_0802A460: .4byte gUnknown_0203A4D4
_0802A464: .4byte gUnknown_0203A56C
_0802A468: .4byte gUnknown_0203A4EC
_0802A46C:
	adds r0, r5, #0
	adds r1, r7, #0
	bl CopyUnitToBattleStruct
_0802A474:
	ldr r0, _0802A48C  @ gUnknown_03005280
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0802A494
	ldr r0, _0802A490  @ gUnknown_0203A4EC
	movs r1, #0
	bl WriteBattleStructTerrainBonuses
	b _0802A49A
	.align 2, 0
_0802A48C: .4byte gUnknown_03005280
_0802A490: .4byte gUnknown_0203A4EC
_0802A494:
	ldr r0, _0802A524  @ gUnknown_0203A4EC
	bl BattleSetupTerrainData
_0802A49A:
	ldr r4, _0802A524  @ gUnknown_0203A4EC
	lsls r1, r6, #0x18
	asrs r1, r1, #0x18
	adds r0, r4, #0
	bl SetupBattleWeaponData
	ldr r1, _0802A528  @ gUnknown_0203A56C
	adds r0, r4, #0
	bl FillPreBattleStats
	adds r5, r4, #0
	adds r5, #0x48
	ldrh r0, [r5]
	bl GetItemIndex
	cmp r0, #0x11
	bne _0802A4DC
	adds r2, r4, #0
	adds r2, #0x5a
	movs r0, #0x14
	ldrsb r0, [r4, r0]
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	ldrh r1, [r2]
	subs r1, r1, r0
	movs r0, #0
	strh r1, [r2]
	adds r1, r4, #0
	adds r1, #0x66
	strh r0, [r1]
	adds r1, #4
	strh r0, [r1]
_0802A4DC:
	ldrh r0, [r5]
	cmp r0, #0
	bne _0802A4F2
	adds r0, r4, #0
	adds r0, #0x5a
	movs r1, #0xff
	strh r1, [r0]
	adds r0, #6
	strh r1, [r0]
	adds r0, #6
	strh r1, [r0]
_0802A4F2:
	ldrh r0, [r5]
	bl GetItemWeaponEffect
	cmp r0, #3
	bne _0802A504
	adds r1, r4, #0
	adds r1, #0x5a
	movs r0, #0xff
	strh r0, [r1]
_0802A504:
	ldrh r0, [r5]
	bl GetItemIndex
	cmp r0, #0xb5
	bne _0802A51A
	adds r0, r4, #0
	adds r0, #0x5a
	movs r1, #0xff
	strh r1, [r0]
	adds r0, #0xc
	strh r1, [r0]
_0802A51A:
	add sp, #0x48
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802A524: .4byte gUnknown_0203A4EC
_0802A528: .4byte gUnknown_0203A56C

	THUMB_FUNC_START RollRNIfBattleStarted
RollRNIfBattleStarted: @ 0x0802A52C
	push {lr}
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	lsls r1, r1, #0x18
	lsrs r2, r1, #0x18
	ldr r0, _0802A54C  @ gUnknown_0203A4D4
	ldrh r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _0802A550
	adds r0, r3, #0
	bl Roll1RN
	lsls r0, r0, #0x18
	b _0802A552
	.align 2, 0
_0802A54C: .4byte gUnknown_0203A4D4
_0802A550:
	lsls r0, r2, #0x18
_0802A552:
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	THUMB_FUNC_START Roll2RNIfBattleStarted
Roll2RNIfBattleStarted: @ 0x0802A558
	push {lr}
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	lsls r1, r1, #0x18
	lsrs r2, r1, #0x18
	ldr r0, _0802A578  @ gUnknown_0203A4D4
	ldrh r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _0802A57C
	adds r0, r3, #0
	bl Roll2RN
	lsls r0, r0, #0x18
	b _0802A57E
	.align 2, 0
_0802A578: .4byte gUnknown_0203A4D4
_0802A57C:
	lsls r0, r2, #0x18
_0802A57E:
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	THUMB_FUNC_START CopyUnitToBattleStruct
CopyUnitToBattleStruct: @ 0x0802A584
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	cmp r6, #0
	beq _0802A65A
	movs r2, #0x48
	bl memcpy
	adds r0, r6, #0
	bl GetUnitMaxHP
	movs r4, #0
	strb r0, [r5, #0x12]
	adds r0, r6, #0
	bl GetUnitPower
	strb r0, [r5, #0x14]
	adds r0, r6, #0
	bl GetUnitSkill
	strb r0, [r5, #0x15]
	adds r0, r6, #0
	bl GetUnitSpeed
	strb r0, [r5, #0x16]
	adds r0, r6, #0
	bl GetUnitDefense
	strb r0, [r5, #0x17]
	adds r0, r6, #0
	bl GetUnitLuck
	strb r0, [r5, #0x19]
	adds r0, r6, #0
	bl GetUnitResistance
	strb r0, [r5, #0x18]
	ldr r2, [r6, #4]
	ldr r0, [r6]
	ldrb r1, [r0, #0x13]
	ldrb r0, [r2, #0x11]
	adds r1, r1, r0
	ldrb r0, [r6, #0x1a]
	adds r0, r0, r1
	strb r0, [r5, #0x1a]
	ldrb r0, [r2, #0x12]
	ldrb r6, [r6, #0x1d]
	adds r0, r0, r6
	strb r0, [r5, #0x1d]
	ldrb r1, [r5, #8]
	adds r0, r5, #0
	adds r0, #0x70
	strb r1, [r0]
	ldrb r0, [r5, #9]
	adds r1, r5, #0
	adds r1, #0x71
	strb r0, [r1]
	ldrb r0, [r5, #0x13]
	adds r1, #1
	strb r0, [r1]
	subs r1, #3
	movs r0, #0xff
	strb r0, [r1]
	adds r0, r5, #0
	adds r0, #0x73
	strb r4, [r0]
	adds r0, #1
	strb r4, [r0]
	adds r0, #1
	strb r4, [r0]
	adds r0, #1
	strb r4, [r0]
	adds r0, #1
	strb r4, [r0]
	adds r0, #1
	strb r4, [r0]
	adds r0, #1
	strb r4, [r0]
	adds r0, #1
	strb r4, [r0]
	ldr r2, _0802A660  @ gUnknown_0203A4EC
	adds r0, r2, #0
	adds r0, #0x7b
	strb r4, [r0]
	ldr r1, _0802A664  @ gUnknown_0203A56C
	adds r0, r1, #0
	adds r0, #0x7b
	strb r4, [r0]
	adds r0, r5, #0
	adds r0, #0x53
	strb r4, [r0]
	adds r0, #1
	strb r4, [r0]
	adds r0, #0x28
	strb r4, [r0]
	adds r0, r2, #0
	adds r0, #0x7d
	strb r4, [r0]
	adds r0, r1, #0
	adds r0, #0x7d
	strb r4, [r0]
	adds r0, r2, #0
	adds r0, #0x6e
	strb r4, [r0]
	adds r0, r1, #0
	adds r0, #0x6e
	strb r4, [r0]
_0802A65A:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802A660: .4byte gUnknown_0203A4EC
_0802A664: .4byte gUnknown_0203A56C

	THUMB_FUNC_START CopyUnitToBattleStructRawStats
CopyUnitToBattleStructRawStats: @ 0x0802A668
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	bl CopyUnitToBattleStruct
	ldrb r0, [r4, #0x12]
	strb r0, [r5, #0x12]
	ldrb r0, [r4, #0x14]
	strb r0, [r5, #0x14]
	ldrb r0, [r4, #0x15]
	strb r0, [r5, #0x15]
	ldrb r0, [r4, #0x16]
	strb r0, [r5, #0x16]
	ldrb r0, [r4, #0x17]
	strb r0, [r5, #0x17]
	ldrb r0, [r4, #0x19]
	strb r0, [r5, #0x19]
	ldrb r0, [r4, #0x18]
	strb r0, [r5, #0x18]
	ldr r1, [r4, #4]
	ldr r0, [r4]
	ldrb r0, [r0, #0x13]
	ldrb r1, [r1, #0x11]
	adds r0, r0, r1
	strb r0, [r5, #0x1a]
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_START WriteBattleStructTerrainBonuses
WriteBattleStructTerrainBonuses: @ 0x0802A6A0
	adds r2, r0, #0
	adds r3, r2, #0
	adds r3, #0x55
	strb r1, [r3]
	ldr r0, [r2, #4]
	ldrb r1, [r3]
	ldr r0, [r0, #0x44]
	adds r0, r0, r1
	ldrb r0, [r0]
	adds r1, r2, #0
	adds r1, #0x57
	strb r0, [r1]
	ldr r0, [r2, #4]
	ldrb r1, [r3]
	ldr r0, [r0, #0x48]
	adds r0, r0, r1
	ldrb r0, [r0]
	adds r1, r2, #0
	adds r1, #0x56
	strb r0, [r1]
	ldr r0, [r2, #4]
	ldrb r1, [r3]
	ldr r0, [r0, #0x4c]
	adds r0, r0, r1
	ldrb r1, [r0]
	adds r0, r2, #0
	adds r0, #0x58
	strb r1, [r0]
	bx lr

	THUMB_FUNC_START BattleSetupTerrainData
BattleSetupTerrainData: @ 0x0802A6DC
	adds r2, r0, #0
	movs r0, #0x11
	ldrsb r0, [r2, r0]
	ldr r1, _0802A72C  @ gUnknown_0202E4DC
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	adds r3, r2, #0
	adds r3, #0x55
	strb r0, [r3]
	ldr r0, [r2, #4]
	ldrb r1, [r3]
	ldr r0, [r0, #0x44]
	adds r0, r0, r1
	ldrb r0, [r0]
	adds r1, r2, #0
	adds r1, #0x57
	strb r0, [r1]
	ldr r0, [r2, #4]
	ldrb r1, [r3]
	ldr r0, [r0, #0x48]
	adds r0, r0, r1
	ldrb r0, [r0]
	adds r1, r2, #0
	adds r1, #0x56
	strb r0, [r1]
	ldr r0, [r2, #4]
	ldrb r1, [r3]
	ldr r0, [r0, #0x4c]
	adds r0, r0, r1
	ldrb r1, [r0]
	adds r0, r2, #0
	adds r0, #0x58
	strb r1, [r0]
	bx lr
	.align 2, 0
_0802A72C: .4byte gUnknown_0202E4DC

	THUMB_FUNC_START SetupBattleWeaponData
SetupBattleWeaponData: @ 0x0802A730
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	adds r5, r0, #0
	adds r3, r1, #0
	movs r0, #1
	negs r0, r0
	cmp r3, r0
	bne _0802A74C
	adds r0, r5, #0
	bl GetUnitEquippedWeaponSlot
	adds r3, r0, #0
_0802A74C:
	ldr r0, [r5, #0xc]
	movs r1, #0x80
	lsls r1, r1, #4
	ands r0, r1
	cmp r0, #0
	beq _0802A75A
	movs r3, #8
_0802A75A:
	adds r1, r5, #0
	adds r1, #0x52
	movs r0, #1
	strb r0, [r1]
	mov r9, r1
	cmp r3, #8
	bhi _0802A830
	lsls r0, r3, #2
	ldr r1, _0802A774  @ _0802A778
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0802A774: .4byte _0802A778
_0802A778: @ jump table
	.4byte _0802A79C @ case 0
	.4byte _0802A79C @ case 1
	.4byte _0802A79C @ case 2
	.4byte _0802A79C @ case 3
	.4byte _0802A79C @ case 4
	.4byte _0802A7B0 @ case 5
	.4byte _0802A7CC @ case 6
	.4byte _0802A7EC @ case 7
	.4byte _0802A80C @ case 8
_0802A79C:
	adds r2, r5, #0
	adds r2, #0x51
	strb r3, [r2]
	ldrb r1, [r2]
	lsls r1, r1, #1
	adds r0, r5, #0
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r0, [r0]
	b _0802A7BC
_0802A7B0:
	adds r2, r5, #0
	adds r2, #0x51
	movs r0, #0xff
	strb r0, [r2]
	ldr r0, _0802A7C8  @ gUnknown_0202BCB0
	ldrh r0, [r0, #0x2c]
_0802A7BC:
	adds r1, r5, #0
	adds r1, #0x48
	strh r0, [r1]
	mov r8, r2
	adds r4, r1, #0
	b _0802A84A
	.align 2, 0
_0802A7C8: .4byte gUnknown_0202BCB0
_0802A7CC:
	adds r3, r5, #0
	adds r3, #0x51
	movs r0, #0
	strb r0, [r3]
	ldr r0, _0802A7E8  @ gUnknown_0203A8F0
	ldrh r1, [r0, #0x1a]
	adds r2, r5, #0
	adds r2, #0x48
	movs r0, #0
	strh r1, [r2]
	mov r1, r9
	strb r0, [r1]
	b _0802A846
	.align 2, 0
_0802A7E8: .4byte gUnknown_0203A8F0
_0802A7EC:
	adds r3, r5, #0
	adds r3, #0x51
	movs r0, #0
	strb r0, [r3]
	ldr r0, _0802A808  @ gUnknown_0203A8F0
	ldrh r1, [r0, #0x1c]
	adds r2, r5, #0
	adds r2, #0x48
	movs r0, #0
	strh r1, [r2]
	mov r1, r9
	strb r0, [r1]
	b _0802A846
	.align 2, 0
_0802A808: .4byte gUnknown_0203A8F0
_0802A80C:
	adds r4, r5, #0
	adds r4, #0x51
	movs r0, #0xff
	strb r0, [r4]
	movs r0, #0x10
	ldrsb r0, [r5, r0]
	movs r1, #0x11
	ldrsb r1, [r5, r1]
	bl GetBallistaItemAt
	adds r2, r5, #0
	adds r2, #0x48
	movs r1, #0
	strh r0, [r2]
	mov r0, r9
	strb r1, [r0]
	mov r8, r4
	b _0802A848
_0802A830:
	adds r3, r5, #0
	adds r3, #0x51
	movs r0, #0xff
	strb r0, [r3]
	adds r2, r5, #0
	adds r2, #0x48
	movs r1, #0
	movs r0, #0
	strh r0, [r2]
	mov r0, r9
	strb r1, [r0]
_0802A846:
	mov r8, r3
_0802A848:
	adds r4, r2, #0
_0802A84A:
	ldrh r0, [r4]
	adds r1, r5, #0
	adds r1, #0x4a
	strh r0, [r1]
	ldrh r0, [r4]
	bl GetItemAttributes
	str r0, [r5, #0x4c]
	ldrh r0, [r4]
	bl GetItemType
	adds r6, r5, #0
	adds r6, #0x50
	strb r0, [r6]
	ldr r7, _0802A890  @ gUnknown_0203A4D4
	ldrh r1, [r7]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	bne _0802A90A
	ldr r0, [r5, #0x4c]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0802A8BC
	ldrh r0, [r4]
	bl GetItemIndex
	cmp r0, #0x11
	beq _0802A8B8
	cmp r0, #0x11
	bgt _0802A894
	cmp r0, #0x10
	beq _0802A8A2
	b _0802A8BC
	.align 2, 0
_0802A890: .4byte gUnknown_0203A4D4
_0802A894:
	cmp r0, #0xa1
	bne _0802A8BC
	ldrb r0, [r7, #2]
	cmp r0, #2
	bne _0802A8AC
	movs r0, #5
	b _0802A8BA
_0802A8A2:
	ldrb r0, [r7, #2]
	cmp r0, #2
	bne _0802A8AC
	movs r0, #6
	b _0802A8BA
_0802A8AC:
	ldr r0, [r5, #0x4c]
	movs r1, #0x41
	negs r1, r1
	ands r0, r1
	str r0, [r5, #0x4c]
	b _0802A8BC
_0802A8B8:
	movs r0, #7
_0802A8BA:
	strb r0, [r6]
_0802A8BC:
	ldrh r0, [r4]
	ldr r1, _0802A8F8  @ gUnknown_0203A4D4
	ldrb r1, [r1, #2]
	bl IsItemCoveringRange
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0802A8D4
	mov r1, r8
	ldrb r0, [r1]
	cmp r0, #0xff
	bne _0802A8DE
_0802A8D4:
	movs r1, #0
	movs r0, #0
	strh r0, [r4]
	mov r0, r9
	strb r1, [r0]
_0802A8DE:
	adds r0, r5, #0
	adds r0, #0x30
	ldrb r0, [r0]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1c
	cmp r0, #0xb
	beq _0802A900
	cmp r0, #0xb
	bgt _0802A8FC
	cmp r0, #2
	beq _0802A900
	b _0802A90A
	.align 2, 0
_0802A8F8: .4byte gUnknown_0203A4D4
_0802A8FC:
	cmp r0, #0xd
	bne _0802A90A
_0802A900:
	movs r1, #0
	movs r0, #0
	strh r0, [r4]
	mov r0, r9
	strb r1, [r0]
_0802A90A:
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_START SetupBattleBallistaWeaponData
SetupBattleBallistaWeaponData: @ 0x0802A918
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	movs r0, #0x10
	ldrsb r0, [r6, r0]
	movs r1, #0x11
	ldrsb r1, [r6, r1]
	bl GetBallistaItemAt
	adds r4, r6, #0
	adds r4, #0x48
	movs r5, #0
	strh r0, [r4]
	adds r1, r6, #0
	adds r1, #0x4a
	strh r0, [r1]
	ldrh r0, [r4]
	bl GetItemAttributes
	str r0, [r6, #0x4c]
	ldrh r0, [r4]
	bl GetItemType
	adds r1, r6, #0
	adds r1, #0x50
	strb r0, [r1]
	adds r0, r6, #0
	adds r0, #0x52
	strb r5, [r0]
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_START sub_802A958
sub_802A958: @ 0x0802A958
	bx lr

	THUMB_FUNC_START FillPreBattleStats
FillPreBattleStats: @ 0x0802A95C
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	bl BattleLoadDefense
	adds r0, r4, #0
	adds r1, r5, #0
	bl BattleLoadAttack
	adds r0, r4, #0
	bl BattleLoadAS
	adds r0, r4, #0
	bl BattleLoadHit
	adds r0, r4, #0
	bl BattleLoadAvoid
	adds r0, r4, #0
	bl BattleLoadCrit
	adds r0, r4, #0
	bl BattleLoadDodge
	adds r0, r4, #0
	adds r1, r5, #0
	bl BattleApplyMiscBonuses
	adds r0, r4, #0
	bl BattleApplySRankBonuses
	adds r0, r4, #0
	bl BattleComputeBuffStatus
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_START FillBattleStats
FillBattleStats: @ 0x0802A9A8
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	bl ComputeHit
	adds r0, r4, #0
	adds r1, r5, #0
	bl ComputeCrit
	adds r0, r4, #0
	adds r1, r5, #0
	bl ComputeLethalityChance
	adds r0, r4, #0
	adds r1, r5, #0
	bl ComputeSpecialWeapons
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_START BattleApplyMiscBonuses
BattleApplyMiscBonuses: @ 0x0802A9D0
	push {r4, r5, lr}
	sub sp, #8
	adds r5, r0, #0
	ldr r0, _0802AA3C  @ gUnknown_0203A4D4
	ldrh r1, [r0]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _0802A9EA
	ldr r0, _0802AA40  @ gUnknown_0202BCF0
	ldrb r0, [r0, #0x15]
	cmp r0, #0
	beq _0802AA34
_0802A9EA:
	mov r4, sp
	adds r0, r5, #0
	mov r1, sp
	bl GetUnitSupportBonuses
	adds r2, r5, #0
	adds r2, #0x5a
	ldrb r1, [r4, #1]
	ldrh r0, [r2]
	adds r0, r0, r1
	strh r0, [r2]
	adds r2, #2
	ldrb r1, [r4, #2]
	ldrh r0, [r2]
	adds r0, r0, r1
	strh r0, [r2]
	adds r2, #4
	ldrb r1, [r4, #3]
	ldrh r0, [r2]
	adds r0, r0, r1
	strh r0, [r2]
	adds r1, r5, #0
	adds r1, #0x62
	ldrh r0, [r1]
	ldrb r2, [r4, #4]
	adds r0, r0, r2
	strh r0, [r1]
	adds r1, #4
	ldrh r0, [r1]
	ldrb r2, [r4, #5]
	adds r0, r0, r2
	strh r0, [r1]
	adds r1, #2
	ldrh r0, [r1]
	ldrb r4, [r4, #6]
	adds r0, r0, r4
	strh r0, [r1]
_0802AA34:
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802AA3C: .4byte gUnknown_0203A4D4
_0802AA40: .4byte gUnknown_0202BCF0

	THUMB_FUNC_START BattleLoadDefense
BattleLoadDefense: @ 0x0802AA44
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r5, #0x48
	ldrh r0, [r5]
	bl GetItemAttributes
	movs r1, #0x40
	ands r1, r0
	cmp r1, #0
	beq _0802AA6A
	adds r0, r4, #0
	adds r0, #0x58
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #0x18
	ldrsb r1, [r4, r1]
	b _0802AA96
_0802AA6A:
	ldrh r0, [r5]
	bl GetItemAttributes
	movs r1, #2
	ands r1, r0
	cmp r1, #0
	beq _0802AA88
	adds r0, r4, #0
	adds r0, #0x58
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #0x18
	ldrsb r1, [r4, r1]
	b _0802AA96
_0802AA88:
	adds r0, r4, #0
	adds r0, #0x56
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #0x17
	ldrsb r1, [r4, r1]
_0802AA96:
	adds r0, r0, r1
	adds r1, r4, #0
	adds r1, #0x5c
	strh r0, [r1]
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_START LoadRawDefense
LoadRawDefense: @ 0x0802AAA4
	adds r1, r0, #0
	adds r1, #0x56
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	movs r2, #0x17
	ldrsb r2, [r0, r2]
	adds r1, r1, r2
	adds r0, #0x5c
	strh r1, [r0]
	bx lr

	THUMB_FUNC_START BattleLoadAttack
BattleLoadAttack: @ 0x0802AABC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	mov r8, r1
	adds r7, r6, #0
	adds r7, #0x48
	ldrh r0, [r7]
	bl GetItemMight
	adds r1, r6, #0
	adds r1, #0x54
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r1, r1, r0
	adds r4, r6, #0
	adds r4, #0x5a
	strh r1, [r4]
	ldrh r5, [r4]
	adds r0, r6, #0
	mov r1, r8
	bl IsUnitEffectiveAgainst
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _0802AB00
	movs r0, #0
	ldrsh r1, [r4, r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
_0802AB00:
	ldrh r0, [r7]
	mov r1, r8
	bl IsItemEffectiveAgainst
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _0802AB4A
	ldrh r5, [r4]
	ldrh r0, [r7]
	bl GetItemIndex
	cmp r0, #0x87
	beq _0802AB3A
	cmp r0, #0x87
	bgt _0802AB2A
	cmp r0, #0x3e
	beq _0802AB3A
	cmp r0, #0x85
	beq _0802AB3A
	b _0802AB3E
_0802AB2A:
	cmp r0, #0x8e
	beq _0802AB3A
	cmp r0, #0x8e
	blt _0802AB3E
	cmp r0, #0x94
	bgt _0802AB3E
	cmp r0, #0x91
	blt _0802AB3E
_0802AB3A:
	lsls r0, r5, #0x11
	b _0802AB48
_0802AB3E:
	lsls r1, r5, #0x10
	asrs r1, r1, #0x10
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #0x10
_0802AB48:
	lsrs r5, r0, #0x10
_0802AB4A:
	adds r4, r6, #0
	adds r4, #0x5a
	strh r5, [r4]
	movs r0, #0x14
	ldrsb r0, [r6, r0]
	adds r0, r5, r0
	strh r0, [r4]
	adds r0, r6, #0
	adds r0, #0x48
	ldrh r0, [r0]
	bl GetItemIndex
	cmp r0, #0xb5
	bne _0802AB6A
	movs r0, #0
	strh r0, [r4]
_0802AB6A:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_START BattleLoadAS
BattleLoadAS: @ 0x0802AB74
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x4a
	ldrh r0, [r0]
	bl GetItemWeight
	adds r1, r0, #0
	movs r0, #0x1a
	ldrsb r0, [r4, r0]
	subs r1, r1, r0
	cmp r1, #0
	bge _0802AB8E
	movs r1, #0
_0802AB8E:
	movs r0, #0x16
	ldrsb r0, [r4, r0]
	subs r0, r0, r1
	adds r1, r4, #0
	adds r1, #0x5e
	strh r0, [r1]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _0802ABA4
	movs r0, #0
	strh r0, [r1]
_0802ABA4:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_START BattleLoadHit
BattleLoadHit: @ 0x0802ABAC
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x48
	ldrh r0, [r0]
	bl GetItemHit
	movs r2, #0x15
	ldrsb r2, [r4, r2]
	lsls r2, r2, #1
	adds r2, r2, r0
	movs r0, #0x19
	ldrsb r0, [r4, r0]
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	adds r0, r0, r2
	adds r1, r4, #0
	adds r1, #0x53
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r1, r1, r0
	adds r0, r4, #0
	adds r0, #0x60
	strh r1, [r0]
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_START BattleLoadAvoid
BattleLoadAvoid: @ 0x0802ABE4
	push {lr}
	adds r2, r0, #0
	adds r0, #0x5e
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r0, r0, #1
	adds r1, r2, #0
	adds r1, #0x57
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r1, r1, r0
	movs r0, #0x19
	ldrsb r0, [r2, r0]
	adds r0, r0, r1
	adds r1, r2, #0
	adds r1, #0x62
	strh r0, [r1]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _0802AC12
	movs r0, #0
	strh r0, [r1]
_0802AC12:
	pop {r0}
	bx r0

	THUMB_FUNC_START BattleLoadCrit
BattleLoadCrit: @ 0x0802AC18
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x48
	ldrh r0, [r0]
	bl GetItemCrit
	movs r1, #0x15
	ldrsb r1, [r4, r1]
	lsrs r2, r1, #0x1f
	adds r1, r1, r2
	asrs r1, r1, #1
	adds r2, r1, r0
	adds r3, r4, #0
	adds r3, #0x66
	strh r2, [r3]
	ldr r0, [r4]
	ldr r1, [r4, #4]
	ldr r0, [r0, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0802AC4E
	adds r0, r2, #0
	adds r0, #0xf
	strh r0, [r3]
_0802AC4E:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_START BattleLoadDodge
BattleLoadDodge: @ 0x0802AC54
	movs r1, #0x19
	ldrsb r1, [r0, r1]
	adds r0, #0x68
	strh r1, [r0]
	bx lr

	THUMB_FUNC_START ComputeHit
ComputeHit: @ 0x0802AC60
	push {lr}
	adds r2, r0, #0
	adds r2, #0x60
	adds r1, #0x62
	ldrh r2, [r2]
	ldrh r1, [r1]
	subs r2, r2, r1
	adds r1, r0, #0
	adds r1, #0x64
	strh r2, [r1]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	cmp r2, #0x64
	ble _0802AC80
	movs r0, #0x64
	strh r0, [r1]
_0802AC80:
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, #0
	bge _0802AC8C
	movs r0, #0
	strh r0, [r1]
_0802AC8C:
	pop {r0}
	bx r0

	THUMB_FUNC_START ComputeCrit
ComputeCrit: @ 0x0802AC90
	push {r4, r5, r6, lr}
	adds r2, r0, #0
	adds r6, r1, #0
	adds r1, r2, #0
	adds r1, #0x66
	adds r0, r6, #0
	adds r0, #0x68
	ldrh r1, [r1]
	ldrh r0, [r0]
	subs r1, r1, r0
	adds r5, r2, #0
	adds r5, #0x6a
	movs r4, #0
	strh r1, [r5]
	adds r0, r2, #0
	adds r0, #0x48
	ldrh r0, [r0]
	bl GetItemIndex
	cmp r0, #0xb5
	bne _0802ACBC
	strh r4, [r5]
_0802ACBC:
	movs r1, #0
	ldrsh r0, [r5, r1]
	cmp r0, #0
	bge _0802ACC6
	strh r4, [r5]
_0802ACC6:
	movs r4, #0
	b _0802ACCC
_0802ACCA:
	adds r4, #1
_0802ACCC:
	cmp r4, #4
	bgt _0802ACF0
	lsls r1, r4, #1
	adds r0, r6, #0
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r0, [r0]
	cmp r0, #0
	beq _0802ACF0
	bl GetItemAttributes
	movs r1, #0x80
	lsls r1, r1, #8
	ands r1, r0
	cmp r1, #0
	beq _0802ACCA
	movs r0, #0
	strh r0, [r5]
_0802ACF0:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_START ComputeLethalityChance
ComputeLethalityChance: @ 0x0802ACF8
	push {r4, lr}
	adds r3, r0, #0
	adds r4, r1, #0
	ldr r0, [r3]
	ldr r1, [r3, #4]
	ldr r2, [r0, #0x28]
	ldr r0, [r1, #0x28]
	orrs r2, r0
	movs r0, #0x80
	lsls r0, r0, #0x12
	ands r2, r0
	cmp r2, #0
	bne _0802AD1A
	adds r0, r3, #0
	adds r0, #0x6c
	strh r2, [r0]
	b _0802AD4E
_0802AD1A:
	adds r2, r3, #0
	adds r2, #0x6c
	movs r0, #0x32
	strh r0, [r2]
	ldr r3, [r4]
	ldr r4, [r4, #4]
	ldr r0, [r3, #0x28]
	ldr r1, [r4, #0x28]
	orrs r0, r1
	movs r1, #0x80
	lsls r1, r1, #8
	ands r0, r1
	cmp r0, #0
	beq _0802AD3A
	movs r0, #0x19
	strh r0, [r2]
_0802AD3A:
	ldr r0, [r3, #0x28]
	ldr r1, [r4, #0x28]
	orrs r0, r1
	movs r1, #0x80
	lsls r1, r1, #0x11
	ands r0, r1
	cmp r0, #0
	beq _0802AD4E
	movs r0, #0
	strh r0, [r2]
_0802AD4E:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_START BattleApplySRankBonuses
BattleApplySRankBonuses: @ 0x0802AD54
	push {r4, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x48
	ldrh r0, [r1]
	cmp r0, #0
	beq _0802AD8A
	bl GetItemType
	adds r1, r0, #0
	cmp r1, #7
	bgt _0802AD8A
	adds r0, r4, #0
	adds r0, #0x28
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0xfa
	bls _0802AD8A
	adds r1, r4, #0
	adds r1, #0x60
	ldrh r0, [r1]
	adds r0, #5
	strh r0, [r1]
	adds r1, #6
	ldrh r0, [r1]
	adds r0, #5
	strh r0, [r1]
_0802AD8A:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_START BattleComputeBuffStatus
BattleComputeBuffStatus: @ 0x0802AD90
	push {lr}
	adds r1, r0, #0
	adds r0, #0x30
	ldrb r0, [r0]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1c
	cmp r0, #6
	beq _0802ADB8
	cmp r0, #6
	bgt _0802ADAA
	cmp r0, #5
	beq _0802ADB4
	b _0802ADC8
_0802ADAA:
	cmp r0, #7
	beq _0802ADBC
	cmp r0, #8
	beq _0802ADC0
	b _0802ADC8
_0802ADB4:
	adds r1, #0x5a
	b _0802ADC2
_0802ADB8:
	adds r1, #0x5c
	b _0802ADC2
_0802ADBC:
	adds r1, #0x66
	b _0802ADC2
_0802ADC0:
	adds r1, #0x62
_0802ADC2:
	ldrh r0, [r1]
	adds r0, #0xa
	strh r0, [r1]
_0802ADC8:
	pop {r0}
	bx r0

	THUMB_FUNC_START ComputeSpecialWeapons
ComputeSpecialWeapons: @ 0x0802ADCC
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r6, r1, #0
	ldr r5, [r4, #0x4c]
	movs r0, #0x40
	ands r5, r0
	cmp r5, #0
	beq _0802AE14
	adds r0, r4, #0
	adds r0, #0x48
	ldrh r0, [r0]
	bl GetItemIndex
	cmp r0, #0x10
	blt _0802AE8A
	cmp r0, #0x11
	ble _0802ADF2
	cmp r0, #0xa1
	bne _0802AE8A
_0802ADF2:
	adds r3, r4, #0
	adds r3, #0x5a
	movs r0, #0x14
	ldrsb r0, [r4, r0]
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	ldrh r1, [r3]
	subs r1, r1, r0
	movs r2, #0
	strh r1, [r3]
	adds r0, r4, #0
	adds r0, #0x66
	strh r2, [r0]
	adds r0, #4
	strh r2, [r0]
	b _0802AE8A
_0802AE14:
	adds r0, r4, #0
	adds r0, #0x4a
	ldrh r0, [r0]
	bl GetItemWeaponEffect
	cmp r0, #3
	bne _0802AE48
	movs r0, #0x13
	ldrsb r0, [r6, r0]
	adds r0, #1
	asrs r0, r0, #1
	adds r1, r4, #0
	adds r1, #0x5a
	strh r0, [r1]
	cmp r0, #0
	bne _0802AE38
	movs r0, #1
	strh r0, [r1]
_0802AE38:
	adds r0, r6, #0
	adds r0, #0x5c
	strh r5, [r0]
	adds r0, r4, #0
	adds r0, #0x66
	strh r5, [r0]
	adds r0, #4
	strh r5, [r0]
_0802AE48:
	ldr r0, [r4, #0x4c]
	movs r1, #0x80
	lsls r1, r1, #0xa
	ands r0, r1
	cmp r0, #0
	beq _0802AE5C
	adds r1, r6, #0
	adds r1, #0x5c
	movs r0, #0
	strh r0, [r1]
_0802AE5C:
	adds r0, r6, #0
	adds r0, #0x30
	ldrb r0, [r0]
	movs r2, #0xf
	ands r2, r0
	cmp r2, #0xb
	beq _0802AE6E
	cmp r2, #0xd
	bne _0802AE8A
_0802AE6E:
	adds r0, r4, #0
	adds r0, #0x64
	movs r2, #0x64
	strh r2, [r0]
	adds r1, r4, #0
	adds r1, #0x6a
	ldrh r0, [r1]
	adds r0, #0x1e
	strh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x64
	ble _0802AE8A
	strh r2, [r1]
_0802AE8A:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_START ClearRounds
ClearRounds: @ 0x0802AE90
	push {r4, r5, r6, r7, lr}
	ldr r7, _0802AEC4  @ gUnknown_0203A5EC
	ldr r0, _0802AEC8  @ gUnknown_0203A608
	mov ip, r0
	ldr r5, _0802AECC  @ 0xFFF80000
	movs r6, #7
	movs r4, #0
	adds r2, r7, #0
	movs r3, #6
_0802AEA2:
	ldr r0, [r2]
	ands r0, r5
	str r0, [r2]
	ldrb r1, [r2, #2]
	adds r0, r6, #0
	ands r0, r1
	strb r0, [r2, #2]
	strb r4, [r2, #3]
	adds r2, #4
	subs r3, #1
	cmp r3, #0
	bge _0802AEA2
	mov r0, ip
	str r7, [r0]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802AEC4: .4byte gUnknown_0203A5EC
_0802AEC8: .4byte gUnknown_0203A608
_0802AECC: .4byte 0xFFF80000

	THUMB_FUNC_START MakeBattle
MakeBattle: @ 0x0802AED0
	push {r4, r5, r6, lr}
	sub sp, #8
	bl ClearRounds
	add r4, sp, #4
	mov r0, sp
	adds r1, r4, #0
	bl GetBattleUnitPointers
	ldr r6, _0802AF74  @ gUnknown_0203A608
	ldr r3, [r6]
	ldr r1, [r3]
	lsls r1, r1, #8
	lsrs r1, r1, #0x1b
	movs r0, #1
	orrs r1, r0
	lsls r1, r1, #3
	ldrb r2, [r3, #2]
	movs r0, #7
	ands r0, r2
	orrs r0, r1
	strb r0, [r3, #2]
	ldr r0, [sp]
	ldr r1, [sp, #4]
	bl MakeBattleRound
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0802AF50
	ldr r3, [r6]
	ldr r2, [r3]
	lsls r1, r2, #0xd
	lsrs r1, r1, #0xd
	movs r0, #8
	orrs r1, r0
	ldr r5, _0802AF78  @ 0xFFF80000
	adds r0, r5, #0
	ands r0, r2
	orrs r0, r1
	str r0, [r3]
	ldr r0, [sp, #4]
	ldr r1, [sp]
	bl MakeBattleRound
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0802AF50
	mov r0, sp
	adds r1, r4, #0
	bl BattleCheckDoubling
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0802AF50
	ldr r2, [r6]
	ldr r0, [r2]
	ands r0, r5
	movs r1, #4
	orrs r0, r1
	str r0, [r2]
	ldr r0, [sp]
	ldr r1, [sp, #4]
	bl MakeBattleRound
_0802AF50:
	ldr r0, _0802AF74  @ gUnknown_0203A608
	ldr r3, [r0]
	ldr r1, [r3]
	lsls r1, r1, #8
	lsrs r1, r1, #0x1b
	movs r0, #0x10
	orrs r1, r0
	lsls r1, r1, #3
	ldrb r2, [r3, #2]
	movs r0, #7
	ands r0, r2
	orrs r0, r1
	strb r0, [r3, #2]
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802AF74: .4byte gUnknown_0203A608
_0802AF78: .4byte 0xFFF80000

	THUMB_FUNC_START GetBattleUnitPointers
GetBattleUnitPointers: @ 0x0802AF7C
	ldr r2, _0802AF88  @ gUnknown_0203A4EC
	str r2, [r0]
	ldr r0, _0802AF8C  @ gUnknown_0203A56C
	str r0, [r1]
	bx lr
	.align 2, 0
_0802AF88: .4byte gUnknown_0203A4EC
_0802AF8C: .4byte gUnknown_0203A56C

	THUMB_FUNC_START BattleCheckDoubling
BattleCheckDoubling: @ 0x0802AF90
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r7, r1, #0
	ldr r0, _0802AFC4  @ gUnknown_0203A56C
	adds r2, r0, #0
	adds r2, #0x5e
	movs r3, #0
	ldrsh r1, [r2, r3]
	adds r6, r0, #0
	cmp r1, #0xfa
	bgt _0802B010
	ldr r0, _0802AFC8  @ gUnknown_0203A4EC
	adds r1, r0, #0
	adds r1, #0x5e
	movs r5, #0
	ldrsh r3, [r1, r5]
	movs r1, #0
	ldrsh r2, [r2, r1]
	subs r1, r3, r2
	adds r5, r0, #0
	cmp r1, #0
	blt _0802AFCC
	cmp r1, #3
	ble _0802B010
	b _0802AFD2
	.align 2, 0
_0802AFC4: .4byte gUnknown_0203A56C
_0802AFC8: .4byte gUnknown_0203A4EC
_0802AFCC:
	subs r0, r2, r3
	cmp r0, #3
	ble _0802B010
_0802AFD2:
	adds r0, r5, #0
	adds r0, #0x5e
	adds r2, r6, #0
	adds r2, #0x5e
	movs r3, #0
	ldrsh r1, [r0, r3]
	movs r3, #0
	ldrsh r0, [r2, r3]
	cmp r1, r0
	ble _0802AFEC
	str r5, [r4]
	str r6, [r7]
	b _0802AFF0
_0802AFEC:
	str r6, [r4]
	str r5, [r7]
_0802AFF0:
	ldr r0, [r4]
	adds r0, #0x4a
	ldrh r0, [r0]
	bl GetItemWeaponEffect
	cmp r0, #3
	beq _0802B010
	ldr r0, [r4]
	adds r0, #0x48
	ldrh r0, [r0]
	bl GetItemIndex
	cmp r0, #0xb5
	beq _0802B010
	movs r0, #1
	b _0802B012
_0802B010:
	movs r0, #0
_0802B012:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_START MakeBattleRound
MakeBattleRound: @ 0x0802B018
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	mov r8, r1
	adds r0, #0x48
	ldrh r0, [r0]
	cmp r0, #0
	bne _0802B030
	b _0802B06C
_0802B02C:
	movs r0, #1
	b _0802B06E
_0802B030:
	ldr r0, _0802B078  @ gUnknown_0203A608
	ldr r0, [r0]
	ldrh r7, [r0]
	adds r0, r6, #0
	bl GetBattleHitCount
	adds r5, r0, #0
	movs r4, #0
	cmp r4, r5
	bge _0802B06C
_0802B044:
	ldr r0, _0802B078  @ gUnknown_0203A608
	ldr r3, [r0]
	ldr r2, [r3]
	lsls r1, r2, #0xd
	lsrs r1, r1, #0xd
	orrs r1, r7
	ldr r0, _0802B07C  @ 0xFFF80000
	ands r0, r2
	orrs r0, r1
	str r0, [r3]
	adds r0, r6, #0
	mov r1, r8
	bl MakeNextBattleHitRound
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0802B02C
	adds r4, #1
	cmp r4, r5
	blt _0802B044
_0802B06C:
	movs r0, #0
_0802B06E:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0802B078: .4byte gUnknown_0203A608
_0802B07C: .4byte 0xFFF80000

	THUMB_FUNC_START GetBattleHitCount
GetBattleHitCount: @ 0x0802B080
	push {r4, lr}
	movs r4, #1
	bl BattleCheckBrave
	lsls r4, r0
	adds r0, r4, #0
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_START BattleCheckBrave
BattleCheckBrave: @ 0x0802B094
	push {lr}
	ldr r0, [r0, #0x4c]
	movs r1, #0x20
	ands r0, r1
	cmp r0, #0
	beq _0802B0C4
	ldr r0, _0802B0BC  @ gUnknown_0203A608
	ldr r3, [r0]
	ldr r2, [r3]
	lsls r1, r2, #0xd
	lsrs r1, r1, #0xd
	movs r0, #0x10
	orrs r1, r0
	ldr r0, _0802B0C0  @ 0xFFF80000
	ands r0, r2
	orrs r0, r1
	str r0, [r3]
	movs r0, #1
	b _0802B0C6
	.align 2, 0
_0802B0BC: .4byte gUnknown_0203A608
_0802B0C0: .4byte 0xFFF80000
_0802B0C4:
	movs r0, #0
_0802B0C6:
	pop {r1}
	bx r1

	THUMB_FUNC_START CheckForTriangleAttack
CheckForTriangleAttack: @ 0x0802B0CC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, _0802B188  @ gUnknown_080D7C38
	mov r0, sp
	movs r2, #8
	bl memcpy
	movs r7, #0
	ldr r0, [r4]
	ldr r1, [r4, #4]
	ldr r6, [r0, #0x28]
	ldr r0, [r1, #0x28]
	orrs r6, r0
	movs r0, #0xc0
	lsls r0, r0, #0xf
	ands r6, r0
	movs r0, #0x10
	ldrsb r0, [r5, r0]
	mov sl, r0
	ldrb r5, [r5, #0x11]
	lsls r5, r5, #0x18
	asrs r5, r5, #0x18
	mov r9, r5
	movs r3, #0xb
	ldrsb r3, [r4, r3]
	movs r0, #0xc0
	ands r3, r0
	ldr r0, _0802B18C  @ gUnknown_0203A4D4
	str r7, [r0, #0x10]
	str r7, [r0, #0x14]
	mov r5, sp
	movs r0, #3
	mov r8, r0
_0802B11A:
	movs r0, #1
	ldrsb r0, [r5, r0]
	add r0, r9
	ldr r1, _0802B190  @ gUnknown_0202E4D8
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r1, #0
	ldrsb r1, [r5, r1]
	ldr r0, [r0]
	add r1, sl
	adds r0, r0, r1
	ldrb r4, [r0]
	cmp r4, #0
	beq _0802B19C
	adds r0, r4, #0
	str r3, [sp, #8]
	bl GetUnitStruct
	adds r2, r0, #0
	movs r0, #0xc0
	ands r4, r0
	ldr r3, [sp, #8]
	cmp r4, r3
	bne _0802B19C
	adds r0, r2, #0
	adds r0, #0x30
	ldrb r0, [r0]
	movs r1, #0xf
	ands r1, r0
	cmp r1, #2
	beq _0802B19C
	cmp r1, #0xb
	beq _0802B19C
	cmp r1, #0xd
	beq _0802B19C
	ldr r1, [r2, #4]
	ldrb r0, [r1, #4]
	cmp r0, #0x24
	beq _0802B19C
	ldr r0, [r2]
	ldr r0, [r0, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	ands r0, r6
	cmp r0, #0
	beq _0802B19C
	adds r7, #1
	ldr r1, _0802B18C  @ gUnknown_0203A4D4
	ldr r0, [r1, #0x10]
	cmp r0, #0
	bne _0802B194
	str r2, [r1, #0x10]
	b _0802B19C
	.align 2, 0
_0802B188: .4byte gUnknown_080D7C38
_0802B18C: .4byte gUnknown_0203A4D4
_0802B190: .4byte gUnknown_0202E4D8
_0802B194:
	ldr r0, [r1, #0x14]
	cmp r0, #0
	bne _0802B19C
	str r2, [r1, #0x14]
_0802B19C:
	adds r5, #2
	movs r0, #1
	negs r0, r0
	add r8, r0
	mov r0, r8
	cmp r0, #0
	bge _0802B11A
	movs r0, #0
	cmp r7, #1
	ble _0802B1B2
	movs r0, #1
_0802B1B2:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_START UpdateBattleStats
UpdateBattleStats: @ 0x0802B1C4
	adds r3, r0, #0
	ldr r2, _0802B1F0  @ gUnknown_0203A4D4
	adds r0, #0x5a
	ldrh r0, [r0]
	strh r0, [r2, #6]
	adds r1, #0x5c
	ldrh r0, [r1]
	strh r0, [r2, #8]
	adds r0, r3, #0
	adds r0, #0x64
	ldrh r0, [r0]
	strh r0, [r2, #0xa]
	adds r0, r3, #0
	adds r0, #0x6a
	ldrh r0, [r0]
	strh r0, [r2, #0xc]
	adds r0, r3, #0
	adds r0, #0x6c
	ldrh r0, [r0]
	strh r0, [r2, #0xe]
	bx lr
	.align 2, 0
_0802B1F0: .4byte gUnknown_0203A4D4

	THUMB_FUNC_START RollForSureShot
RollForSureShot: @ 0x0802B1F4
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r6, _0802B270  @ gUnknown_0203A608
	ldr r0, [r6]
	ldr r0, [r0]
	lsls r0, r0, #0xd
	lsrs r1, r0, #0xd
	movs r5, #0x80
	lsls r5, r5, #7
	adds r0, r1, #0
	ands r0, r5
	cmp r0, #0
	bne _0802B268
	movs r0, #0x80
	lsls r0, r0, #9
	ands r0, r1
	cmp r0, #0
	bne _0802B268
	movs r0, #0x80
	lsls r0, r0, #8
	ands r1, r0
	cmp r1, #0
	bne _0802B268
	ldr r0, [r4, #4]
	ldrb r0, [r0, #4]
	cmp r0, #0x1c
	bgt _0802B268
	cmp r0, #0x1b
	blt _0802B268
	adds r0, r4, #0
	adds r0, #0x48
	ldrh r0, [r0]
	bl GetItemIndex
	cmp r0, #0x37
	bgt _0802B240
	cmp r0, #0x35
	bge _0802B268
_0802B240:
	movs r0, #8
	ldrsb r0, [r4, r0]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #0
	bl RollRNIfBattleStarted
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _0802B268
	ldr r3, [r6]
	ldr r2, [r3]
	lsls r1, r2, #0xd
	lsrs r1, r1, #0xd
	orrs r1, r5
	ldr r0, _0802B274  @ 0xFFF80000
	ands r0, r2
	orrs r0, r1
	str r0, [r3]
_0802B268:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802B270: .4byte gUnknown_0203A608
_0802B274: .4byte 0xFFF80000

	THUMB_FUNC_START RollForPierce
RollForPierce: @ 0x0802B278
	push {r4, r5, lr}
	adds r2, r0, #0
	ldr r5, _0802B2E0  @ gUnknown_0203A608
	ldr r0, [r5]
	ldr r0, [r0]
	lsls r0, r0, #0xd
	lsrs r1, r0, #0xd
	movs r0, #0x80
	lsls r0, r0, #7
	ands r0, r1
	cmp r0, #0
	bne _0802B2DA
	movs r4, #0x80
	lsls r4, r4, #9
	adds r0, r1, #0
	ands r0, r4
	cmp r0, #0
	bne _0802B2DA
	movs r0, #0x80
	lsls r0, r0, #8
	ands r1, r0
	cmp r1, #0
	bne _0802B2DA
	ldr r0, [r2, #4]
	ldrb r0, [r0, #4]
	cmp r0, #0x24
	bgt _0802B2DA
	cmp r0, #0x23
	blt _0802B2DA
	movs r0, #8
	ldrsb r0, [r2, r0]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #0
	bl RollRNIfBattleStarted
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _0802B2DA
	ldr r3, [r5]
	ldr r2, [r3]
	lsls r1, r2, #0xd
	lsrs r1, r1, #0xd
	orrs r1, r4
	ldr r0, _0802B2E4  @ 0xFFF80000
	ands r0, r2
	orrs r0, r1
	str r0, [r3]
_0802B2DA:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802B2E0: .4byte gUnknown_0203A608
_0802B2E4: .4byte 0xFFF80000

	THUMB_FUNC_START RollForGreatShield
RollForGreatShield: @ 0x0802B2E8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	adds r6, r1, #0
	ldr r4, _0802B384  @ gUnknown_0203A608
	ldr r0, [r4]
	ldr r0, [r0]
	lsls r0, r0, #0xd
	lsrs r1, r0, #0xd
	movs r7, #2
	adds r0, r1, #0
	ands r0, r7
	cmp r0, #0
	bne _0802B378
	movs r0, #0x80
	lsls r0, r0, #7
	ands r0, r1
	cmp r0, #0
	bne _0802B378
	movs r0, #0x80
	lsls r0, r0, #9
	ands r0, r1
	cmp r0, #0
	bne _0802B378
	movs r0, #0x80
	lsls r0, r0, #8
	mov r8, r0
	ands r1, r0
	cmp r1, #0
	bne _0802B378
	adds r0, r5, #0
	adds r0, #0x48
	ldrh r0, [r0]
	bl GetItemWeaponEffect
	cmp r0, #1
	beq _0802B378
	ldr r0, [r4]
	ldr r0, [r0]
	lsls r0, r0, #0xd
	lsrs r0, r0, #0xd
	ands r0, r7
	cmp r0, #0
	bne _0802B378
	ldr r0, [r6, #4]
	ldrb r1, [r0, #4]
	cmp r1, #0xc
	bgt _0802B378
	cmp r1, #0xb
	blt _0802B378
	movs r0, #8
	ldrsb r0, [r5, r0]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #0
	bl RollRNIfBattleStarted
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _0802B378
	ldr r3, [r4]
	ldr r2, [r3]
	lsls r1, r2, #0xd
	lsrs r1, r1, #0xd
	mov r0, r8
	orrs r1, r0
	ldr r0, _0802B388  @ 0xFFF80000
	ands r0, r2
	orrs r0, r1
	str r0, [r3]
_0802B378:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802B384: .4byte gUnknown_0203A608
_0802B388: .4byte 0xFFF80000

	THUMB_FUNC_START RollForLethality
RollForLethality: @ 0x0802B38C
	push {lr}
	ldr r0, [r1, #4]
	ldrb r0, [r0, #4]
	cmp r0, #0x4f
	beq _0802B39E
	cmp r0, #0x66
	bne _0802B3AE
_0802B39A:
	movs r0, #0
	b _0802B3C2
_0802B39E:
	ldr r0, _0802B3C8  @ gUnknown_0202BCF0
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x15
	beq _0802B39A
	cmp r0, #0x22
	beq _0802B39A
_0802B3AE:
	ldr r0, _0802B3CC  @ gUnknown_0203A4D4
	ldrh r0, [r0, #0xe]
	movs r1, #0
	bl RollRNIfBattleStarted
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _0802B39A
	movs r0, #1
_0802B3C2:
	pop {r1}
	bx r1
	.align 2, 0
_0802B3C8: .4byte gUnknown_0202BCF0
_0802B3CC: .4byte gUnknown_0203A4D4

	THUMB_FUNC_START NullifyBattleDamageIfUsingStone
NullifyBattleDamageIfUsingStone: @ 0x0802B3D0
	push {lr}
	adds r0, #0x48
	ldrh r0, [r0]
	bl GetItemIndex
	cmp r0, #0xb5
	bne _0802B3E4
	ldr r1, _0802B3E8  @ gUnknown_0203A4D4
	movs r0, #0
	strh r0, [r1, #4]
_0802B3E4:
	pop {r0}
	bx r0
	.align 2, 0
_0802B3E8: .4byte gUnknown_0203A4D4

	THUMB_FUNC_START GenerateCurrentRoundData
GenerateCurrentRoundData: @ 0x0802B3EC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	adds r6, r0, #0
	mov r8, r1
	ldr r4, _0802B440  @ gUnknown_0203A4D4
	movs r0, #0
	strh r0, [r4, #4]
	adds r0, r6, #0
	bl RollForSureShot
	ldr r5, _0802B444  @ gUnknown_0203A608
	ldr r0, [r5]
	ldr r0, [r0]
	lsls r0, r0, #0xd
	lsrs r0, r0, #0xd
	movs r1, #0x80
	lsls r1, r1, #7
	ands r0, r1
	cmp r0, #0
	bne _0802B44C
	ldrh r0, [r4, #0xa]
	movs r1, #1
	bl Roll2RNIfBattleStarted
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0802B44C
	ldr r3, [r5]
	ldr r2, [r3]
	lsls r1, r2, #0xd
	lsrs r1, r1, #0xd
	movs r0, #2
	orrs r1, r0
	ldr r0, _0802B448  @ 0xFFF80000
	ands r0, r2
	orrs r0, r1
	str r0, [r3]
	b _0802B55E
	.align 2, 0
_0802B440: .4byte gUnknown_0203A4D4
_0802B444: .4byte gUnknown_0203A608
_0802B448: .4byte 0xFFF80000
_0802B44C:
	ldr r5, _0802B4FC  @ gUnknown_0203A4D4
	ldrh r0, [r5, #6]
	mov r9, r0
	ldrh r4, [r5, #8]
	adds r0, r6, #0
	mov r1, r8
	bl RollForGreatShield
	ldr r7, _0802B500  @ gUnknown_0203A608
	ldr r0, [r7]
	ldr r0, [r0]
	lsls r0, r0, #0xd
	lsrs r0, r0, #0xd
	movs r1, #0x80
	lsls r1, r1, #8
	mov sl, r1
	ands r0, r1
	cmp r0, #0
	bne _0802B47A
	adds r0, r6, #0
	mov r1, r8
	bl RollForPierce
_0802B47A:
	ldr r2, [r7]
	ldr r0, [r2]
	lsls r0, r0, #0xd
	lsrs r0, r0, #0xd
	movs r1, #0x80
	lsls r1, r1, #9
	ands r0, r1
	cmp r0, #0
	beq _0802B48E
	movs r4, #0
_0802B48E:
	mov r0, r9
	lsls r1, r0, #0x10
	asrs r1, r1, #0x10
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	subs r1, r1, r0
	strh r1, [r5, #4]
	ldr r0, [r2]
	lsls r0, r0, #0xd
	lsrs r0, r0, #0xd
	mov r1, sl
	ands r0, r1
	cmp r0, #0
	beq _0802B4AE
	movs r0, #0
	strh r0, [r5, #4]
_0802B4AE:
	ldrh r0, [r5, #0xc]
	movs r1, #0
	bl RollRNIfBattleStarted
	lsls r0, r0, #0x18
	asrs r4, r0, #0x18
	cmp r4, #1
	bne _0802B52C
	adds r0, r6, #0
	mov r1, r8
	bl RollForLethality
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0802B50C
	ldr r4, [r7]
	ldr r3, [r4]
	lsls r1, r3, #0xd
	lsrs r1, r1, #0xd
	movs r0, #0x80
	lsls r0, r0, #4
	orrs r1, r0
	ldr r2, _0802B504  @ 0xFFF80000
	adds r0, r2, #0
	ands r0, r3
	orrs r0, r1
	str r0, [r4]
	movs r0, #0x7f
	strh r0, [r5, #4]
	ldr r3, [r4]
	lsls r0, r3, #0xd
	lsrs r0, r0, #0xd
	ldr r1, _0802B508  @ 0xFFFF7FFF
	ands r0, r1
	ands r2, r3
	orrs r2, r0
	str r2, [r4]
	b _0802B52C
	.align 2, 0
_0802B4FC: .4byte gUnknown_0203A4D4
_0802B500: .4byte gUnknown_0203A608
_0802B504: .4byte 0xFFF80000
_0802B508: .4byte 0xFFFF7FFF
_0802B50C:
	ldr r3, [r7]
	ldr r2, [r3]
	lsls r1, r2, #0xd
	lsrs r1, r1, #0xd
	orrs r1, r4
	ldr r0, _0802B56C  @ 0x0007FFFF
	ands r1, r0
	ldr r0, _0802B570  @ 0xFFF80000
	ands r0, r2
	orrs r0, r1
	str r0, [r3]
	movs r0, #4
	ldrsh r1, [r5, r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	strh r0, [r5, #4]
_0802B52C:
	ldr r4, _0802B574  @ gUnknown_0203A4D4
	movs r1, #4
	ldrsh r0, [r4, r1]
	cmp r0, #0x7f
	ble _0802B53A
	movs r0, #0x7f
	strh r0, [r4, #4]
_0802B53A:
	movs r1, #4
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bge _0802B546
	movs r0, #0
	strh r0, [r4, #4]
_0802B546:
	adds r0, r6, #0
	mov r1, r8
	bl NullifyBattleDamageIfUsingStone
	movs r1, #4
	ldrsh r0, [r4, r1]
	cmp r0, #0
	beq _0802B55E
	adds r1, r6, #0
	adds r1, #0x7c
	movs r0, #1
	strb r0, [r1]
_0802B55E:
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802B56C: .4byte 0x0007FFFF
_0802B570: .4byte 0xFFF80000
_0802B574: .4byte gUnknown_0203A4D4

	THUMB_FUNC_START UpdateBattleTriangleAttackData
UpdateBattleTriangleAttackData: @ 0x0802B578
	push {r4, r5, lr}
	adds r2, r0, #0
	adds r3, r1, #0
	ldr r0, [r2]
	ldr r1, [r2, #4]
	ldr r0, [r0, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	movs r1, #0xc0
	lsls r1, r1, #0xf
	ands r0, r1
	cmp r0, #0
	beq _0802B5EC
	ldr r4, _0802B5F4  @ gUnknown_0203A4D4
	ldrb r1, [r4, #2]
	cmp r1, #1
	bne _0802B5EC
	ldr r5, _0802B5F8  @ gUnknown_0203A608
	ldr r0, [r5]
	ldr r0, [r0]
	lsls r0, r0, #8
	lsrs r0, r0, #0x1b
	ands r0, r1
	cmp r0, #0
	beq _0802B5EC
	adds r0, r2, #0
	adds r0, #0x30
	ldrb r1, [r0]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #4
	beq _0802B5EC
	ldrh r1, [r4]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	bne _0802B5EC
	adds r0, r2, #0
	adds r1, r3, #0
	bl CheckForTriangleAttack
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0802B5EC
	ldr r3, [r5]
	ldr r2, [r3]
	lsls r1, r2, #0xd
	lsrs r1, r1, #0xd
	movs r0, #0x80
	lsls r0, r0, #3
	orrs r1, r0
	ldr r0, _0802B5FC  @ 0xFFF80000
	ands r0, r2
	orrs r0, r1
	str r0, [r3]
	movs r0, #0x64
	strh r0, [r4, #0xc]
	strh r0, [r4, #0xa]
_0802B5EC:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802B5F4: .4byte gUnknown_0203A4D4
_0802B5F8: .4byte gUnknown_0203A608
_0802B5FC: .4byte 0xFFF80000

	THUMB_FUNC_START CurrentRound_ComputeWeaponEffects
CurrentRound_ComputeWeaponEffects: @ 0x0802B600
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	adds r1, r5, #0
	adds r1, #0x7b
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldr r6, _0802B640  @ gUnknown_0203A608
	ldr r0, [r6]
	ldr r0, [r0]
	lsls r0, r0, #0xd
	lsrs r0, r0, #0xd
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	beq _0802B624
	b _0802B7EA
_0802B624:
	ldr r0, [r4, #4]
	ldrb r0, [r0, #4]
	adds r7, r5, #0
	adds r7, #0x48
	cmp r0, #0x66
	beq _0802B696
	ldrh r0, [r7]
	bl GetItemWeaponEffect
	cmp r0, #1
	beq _0802B644
	cmp r0, #3
	beq _0802B680
	b _0802B696
	.align 2, 0
_0802B640: .4byte gUnknown_0203A608
_0802B644:
	adds r1, r4, #0
	adds r1, #0x6f
	strb r0, [r1]
	ldr r3, [r6]
	ldr r2, [r3]
	lsls r1, r2, #0xd
	lsrs r1, r1, #0xd
	movs r0, #0x40
	orrs r1, r0
	ldr r0, _0802B67C  @ 0xFFF80000
	ands r0, r2
	orrs r0, r1
	str r0, [r3]
	adds r0, r4, #0
	adds r0, #0x30
	ldrb r0, [r0]
	movs r1, #0xf
	ands r1, r0
	cmp r1, #0xb
	beq _0802B670
	cmp r1, #0xd
	bne _0802B696
_0802B670:
	ldr r0, [r4, #0xc]
	movs r1, #3
	negs r1, r1
	ands r0, r1
	str r0, [r4, #0xc]
	b _0802B696
	.align 2, 0
_0802B67C: .4byte 0xFFF80000
_0802B680:
	ldr r3, [r6]
	ldr r2, [r3]
	lsls r1, r2, #0xd
	lsrs r1, r1, #0xd
	movs r0, #0x80
	lsls r0, r0, #2
	orrs r1, r0
	ldr r0, _0802B6E4  @ 0xFFF80000
	ands r0, r2
	orrs r0, r1
	str r0, [r3]
_0802B696:
	ldrh r0, [r7]
	bl GetItemWeaponEffect
	cmp r0, #4
	bne _0802B6F0
	movs r1, #0x19
	ldrsb r1, [r5, r1]
	movs r0, #0x1f
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #0
	bl RollRNIfBattleStarted
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0802B6F0
	ldr r0, _0802B6E8  @ gUnknown_0203A608
	ldr r3, [r0]
	ldr r2, [r3]
	lsls r1, r2, #0xd
	lsrs r1, r1, #0xd
	movs r0, #0x80
	orrs r1, r0
	ldr r0, _0802B6E4  @ 0xFFF80000
	ands r0, r2
	orrs r0, r1
	str r0, [r3]
	ldr r0, _0802B6EC  @ gUnknown_0203A4D4
	ldrb r1, [r0, #4]
	ldrb r0, [r5, #0x13]
	subs r0, r0, r1
	strb r0, [r5, #0x13]
	lsls r0, r0, #0x18
	cmp r0, #0
	bge _0802B712
	movs r0, #0
	strb r0, [r5, #0x13]
	b _0802B712
	.align 2, 0
_0802B6E4: .4byte 0xFFF80000
_0802B6E8: .4byte gUnknown_0203A608
_0802B6EC: .4byte gUnknown_0203A4D4
_0802B6F0:
	ldr r1, _0802B734  @ gUnknown_0203A4D4
	movs r2, #0x13
	ldrsb r2, [r4, r2]
	movs r3, #4
	ldrsh r0, [r1, r3]
	cmp r0, r2
	ble _0802B700
	strh r2, [r1, #4]
_0802B700:
	ldrb r1, [r1, #4]
	ldrb r0, [r4, #0x13]
	subs r0, r0, r1
	strb r0, [r4, #0x13]
	lsls r0, r0, #0x18
	cmp r0, #0
	bge _0802B712
	movs r0, #0
	strb r0, [r4, #0x13]
_0802B712:
	ldrh r0, [r7]
	bl GetItemWeaponEffect
	cmp r0, #2
	bne _0802B758
	movs r0, #0x12
	ldrsb r0, [r5, r0]
	movs r1, #0x13
	ldrsb r1, [r5, r1]
	ldr r3, _0802B734  @ gUnknown_0203A4D4
	movs r6, #4
	ldrsh r2, [r3, r6]
	adds r1, r1, r2
	cmp r0, r1
	bge _0802B738
	ldrb r0, [r5, #0x12]
	b _0802B73E
	.align 2, 0
_0802B734: .4byte gUnknown_0203A4D4
_0802B738:
	ldrb r0, [r3, #4]
	ldrb r1, [r5, #0x13]
	adds r0, r0, r1
_0802B73E:
	strb r0, [r5, #0x13]
	ldr r0, _0802B77C  @ gUnknown_0203A608
	ldr r3, [r0]
	ldr r2, [r3]
	lsls r1, r2, #0xd
	lsrs r1, r1, #0xd
	movs r0, #0x80
	lsls r0, r0, #1
	orrs r1, r0
	ldr r0, _0802B780  @ 0xFFF80000
	ands r0, r2
	orrs r0, r1
	str r0, [r3]
_0802B758:
	ldr r0, [r4, #4]
	ldrb r0, [r0, #4]
	cmp r0, #0x66
	beq _0802B7EA
	ldrh r0, [r7]
	bl GetItemWeaponEffect
	cmp r0, #5
	bne _0802B7EA
	ldr r0, _0802B784  @ gUnknown_0202BCF0
	ldrb r0, [r0, #0xf]
	cmp r0, #0x40
	beq _0802B7B6
	cmp r0, #0x40
	bgt _0802B788
	cmp r0, #0
	beq _0802B78E
	b _0802B7D2
	.align 2, 0
_0802B77C: .4byte gUnknown_0203A608
_0802B780: .4byte 0xFFF80000
_0802B784: .4byte gUnknown_0202BCF0
_0802B788:
	cmp r0, #0x80
	beq _0802B7A2
	b _0802B7D2
_0802B78E:
	movs r0, #0xb
	ldrsb r0, [r4, r0]
	movs r1, #0xc0
	ands r0, r1
	cmp r0, #0
	bne _0802B7CA
	adds r1, r4, #0
	adds r1, #0x6f
	movs r0, #0xd
	b _0802B7D0
_0802B7A2:
	movs r0, #0xb
	ldrsb r0, [r4, r0]
	movs r1, #0xc0
	ands r0, r1
	cmp r0, #0x80
	bne _0802B7CA
	adds r1, r4, #0
	adds r1, #0x6f
	movs r0, #0xd
	b _0802B7D0
_0802B7B6:
	movs r0, #0xb
	ldrsb r0, [r4, r0]
	movs r1, #0xc0
	ands r0, r1
	cmp r0, #0x40
	bne _0802B7CA
	adds r1, r4, #0
	adds r1, #0x6f
	movs r0, #0xd
	b _0802B7D0
_0802B7CA:
	adds r1, r4, #0
	adds r1, #0x6f
	movs r0, #0xb
_0802B7D0:
	strb r0, [r1]
_0802B7D2:
	ldr r0, _0802B830  @ gUnknown_0203A608
	ldr r3, [r0]
	ldr r2, [r3]
	lsls r1, r2, #0xd
	lsrs r1, r1, #0xd
	movs r0, #0x80
	lsls r0, r0, #6
	orrs r1, r0
	ldr r0, _0802B834  @ 0xFFF80000
	ands r0, r2
	orrs r0, r1
	str r0, [r3]
_0802B7EA:
	ldr r2, _0802B830  @ gUnknown_0203A608
	ldr r1, [r2]
	ldr r0, _0802B838  @ gUnknown_0203A4D4
	ldrh r0, [r0, #4]
	strb r0, [r1, #3]
	ldr r0, [r2]
	ldr r0, [r0]
	lsls r0, r0, #0xd
	lsrs r0, r0, #0xd
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	beq _0802B80E
	ldr r0, [r5, #0x4c]
	movs r1, #0x82
	ands r0, r1
	cmp r0, #0
	beq _0802B828
_0802B80E:
	adds r4, r5, #0
	adds r4, #0x48
	ldrh r0, [r4]
	bl GetItemAfterUse
	strh r0, [r4]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _0802B828
	adds r1, r5, #0
	adds r1, #0x7d
	movs r0, #1
	strb r0, [r1]
_0802B828:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802B830: .4byte gUnknown_0203A608
_0802B834: .4byte 0xFFF80000
_0802B838: .4byte gUnknown_0203A4D4

	THUMB_FUNC_START MakeNextBattleHitRound
MakeNextBattleHitRound: @ 0x0802B83C
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r6, _0802B8D4  @ gUnknown_0203A56C
	cmp r4, r6
	bne _0802B862
	ldr r0, _0802B8D8  @ gUnknown_0203A608
	ldr r3, [r0]
	ldr r1, [r3]
	lsls r1, r1, #8
	lsrs r1, r1, #0x1b
	movs r0, #8
	orrs r1, r0
	lsls r1, r1, #3
	ldrb r2, [r3, #2]
	movs r0, #7
	ands r0, r2
	orrs r0, r1
	strb r0, [r3, #2]
_0802B862:
	adds r0, r4, #0
	adds r1, r5, #0
	bl UpdateBattleStats
	adds r0, r4, #0
	adds r1, r5, #0
	bl UpdateBattleTriangleAttackData
	adds r0, r4, #0
	adds r1, r5, #0
	bl GenerateCurrentRoundData
	adds r0, r4, #0
	adds r1, r5, #0
	bl CurrentRound_ComputeWeaponEffects
	movs r0, #0x13
	ldrsb r0, [r4, r0]
	cmp r0, #0
	beq _0802B892
	movs r0, #0x13
	ldrsb r0, [r5, r0]
	cmp r0, #0
	bne _0802B8DC
_0802B892:
	adds r1, r4, #0
	adds r1, #0x7b
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldr r4, _0802B8D8  @ gUnknown_0203A608
	ldr r2, [r4]
	ldr r1, [r2]
	lsls r1, r1, #8
	lsrs r1, r1, #0x1b
	movs r0, #2
	orrs r1, r0
	lsls r1, r1, #3
	ldrb r3, [r2, #2]
	movs r5, #7
	adds r0, r5, #0
	ands r0, r3
	orrs r0, r1
	strb r0, [r2, #2]
	movs r0, #0x13
	ldrsb r0, [r6, r0]
	cmp r0, #0
	bne _0802B908
	ldr r3, [r4]
	ldr r1, [r3]
	lsls r1, r1, #8
	lsrs r1, r1, #0x1b
	movs r0, #4
	orrs r1, r0
	lsls r1, r1, #3
	ldrb r2, [r3, #2]
	adds r0, r5, #0
	b _0802B902
	.align 2, 0
_0802B8D4: .4byte gUnknown_0203A56C
_0802B8D8: .4byte gUnknown_0203A608
_0802B8DC:
	adds r0, r5, #0
	adds r0, #0x6f
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0xb
	beq _0802B8EE
	cmp r0, #0xd
	bne _0802B918
_0802B8EE:
	ldr r4, _0802B914  @ gUnknown_0203A608
	ldr r3, [r4]
	ldr r1, [r3]
	lsls r1, r1, #8
	lsrs r1, r1, #0x1b
	movs r0, #2
	orrs r1, r0
	lsls r1, r1, #3
	ldrb r2, [r3, #2]
	movs r0, #7
_0802B902:
	ands r0, r2
	orrs r0, r1
	strb r0, [r3, #2]
_0802B908:
	ldr r0, [r4]
	adds r0, #4
	str r0, [r4]
	movs r0, #1
	b _0802B922
	.align 2, 0
_0802B914: .4byte gUnknown_0203A608
_0802B918:
	ldr r1, _0802B928  @ gUnknown_0203A608
	ldr r0, [r1]
	adds r0, #4
	str r0, [r1]
	movs r0, #0
_0802B922:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0802B928: .4byte gUnknown_0203A608

	THUMB_FUNC_START sub_802B92C
sub_802B92C: @ 0x0802B92C
	push {r4, r5, r6, lr}
	ldr r5, _0802B994  @ gUnknown_0203A4EC
	movs r0, #0xb
	ldrsb r0, [r5, r0]
	movs r1, #0xc0
	ands r0, r1
	cmp r0, #0
	bne _0802B94A
	ldr r0, _0802B998  @ gUnknown_0203A56C
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ands r0, r1
	cmp r0, #0
	beq _0802B98E
_0802B94A:
	ldr r0, _0802B99C  @ gUnknown_0202BCF0
	ldrb r1, [r0, #0x14]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0802B98E
	ldr r4, _0802B998  @ gUnknown_0203A56C
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_802C534
	adds r6, r5, #0
	adds r6, #0x6e
	strb r0, [r6]
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_802C534
	adds r1, r4, #0
	adds r1, #0x6e
	strb r0, [r1]
	ldrb r1, [r6]
	ldrb r2, [r5, #9]
	adds r1, r1, r2
	strb r1, [r5, #9]
	ldrb r1, [r4, #9]
	adds r1, r1, r0
	strb r1, [r4, #9]
	adds r0, r5, #0
	bl CheckForLevelUp
	adds r0, r4, #0
	bl CheckForLevelUp
_0802B98E:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802B994: .4byte gUnknown_0203A4EC
_0802B998: .4byte gUnknown_0203A56C
_0802B99C: .4byte gUnknown_0202BCF0

	THUMB_FUNC_START GetStatIncrease
GetStatIncrease: @ 0x0802B9A0
	push {r4, lr}
	movs r4, #0
	cmp r0, #0x64
	ble _0802B9B0
_0802B9A8:
	adds r4, #1
	subs r0, #0x64
	cmp r0, #0x64
	bgt _0802B9A8
_0802B9B0:
	bl Roll1RN
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0802B9BC
	adds r4, #1
_0802B9BC:
	adds r0, r4, #0
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_START GetAutoleveledStat
GetAutoleveledStat: @ 0x0802B9C4
	push {r4, lr}
	adds r4, r0, #0
	muls r4, r1, r4
	adds r0, r4, #0
	cmp r4, #0
	bge _0802B9D2
	adds r0, r4, #3
_0802B9D2:
	asrs r0, r0, #2
	bl NextRN_N
	adds r1, r0, #0
	adds r0, r4, #0
	cmp r4, #0
	bge _0802B9E2
	adds r0, r4, #7
_0802B9E2:
	asrs r0, r0, #3
	subs r0, r1, r0
	adds r0, r4, r0
	bl GetStatIncrease
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_START CanUnitNotLevelUp
CanUnitNotLevelUp: @ 0x0802B9F4
	push {lr}
	adds r2, r0, #0
	ldr r0, _0802BA1C  @ gUnknown_0202BCB0
	ldrb r1, [r0, #4]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	bne _0802BA16
	ldrb r0, [r2, #9]
	cmp r0, #0xff
	beq _0802BA20
	movs r0, #0xb
	ldrsb r0, [r2, r0]
	movs r1, #0xc0
	ands r0, r1
	cmp r0, #0
	bne _0802BA20
_0802BA16:
	movs r0, #1
	b _0802BA22
	.align 2, 0
_0802BA1C: .4byte gUnknown_0202BCB0
_0802BA20:
	movs r0, #0
_0802BA22:
	pop {r1}
	bx r1

	THUMB_FUNC_START CheckForLevelUp
CheckForLevelUp: @ 0x0802BA28
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	adds r7, r0, #0
	bl CanUnitNotLevelUp
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0802BA42
	b _0802BBEE
_0802BA42:
	ldrb r0, [r7, #9]
	cmp r0, #0x63
	bhi _0802BA4A
	b _0802BBEE
_0802BA4A:
	adds r3, r0, #0
	subs r3, #0x64
	strb r3, [r7, #9]
	ldrb r0, [r7, #8]
	adds r2, r0, #1
	strb r2, [r7, #8]
	ldr r0, [r7]
	ldr r1, [r7, #4]
	ldr r0, [r0, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	movs r1, #0x80
	lsls r1, r1, #0xc
	ands r0, r1
	cmp r0, #0
	beq _0802BA74
	lsls r0, r2, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0xa
	bne _0802BA8A
	b _0802BA7C
_0802BA74:
	lsls r0, r2, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x14
	bne _0802BA8A
_0802BA7C:
	adds r1, r7, #0
	adds r1, #0x6e
	ldrb r0, [r1]
	subs r0, r0, r3
	strb r0, [r1]
	movs r0, #0xff
	strb r0, [r7, #9]
_0802BA8A:
	ldr r0, [r7, #0xc]
	movs r1, #0x80
	lsls r1, r1, #6
	ands r0, r1
	movs r1, #0
	mov sl, r1
	cmp r0, #0
	beq _0802BA9E
	movs r0, #5
	mov sl, r0
_0802BA9E:
	ldr r0, [r7]
	ldrb r0, [r0, #0x1c]
	add r0, sl
	bl GetStatIncrease
	adds r1, r7, #0
	adds r1, #0x73
	str r1, [sp]
	strb r0, [r1]
	movs r6, #0
	ldrsb r6, [r1, r6]
	ldr r0, [r7]
	ldrb r0, [r0, #0x1d]
	add r0, sl
	bl GetStatIncrease
	adds r1, r7, #0
	adds r1, #0x74
	str r1, [sp, #4]
	strb r0, [r1]
	movs r0, #0
	ldrsb r0, [r1, r0]
	adds r6, r6, r0
	ldr r0, [r7]
	ldrb r0, [r0, #0x1e]
	add r0, sl
	bl GetStatIncrease
	movs r1, #0x75
	adds r1, r1, r7
	mov r8, r1
	strb r0, [r1]
	movs r0, #0
	ldrsb r0, [r1, r0]
	adds r6, r6, r0
	ldr r0, [r7]
	ldrb r0, [r0, #0x1f]
	add r0, sl
	bl GetStatIncrease
	movs r1, #0x76
	adds r1, r1, r7
	mov r9, r1
	strb r0, [r1]
	movs r0, #0
	ldrsb r0, [r1, r0]
	adds r6, r6, r0
	ldr r0, [r7]
	adds r0, #0x20
	ldrb r0, [r0]
	add r0, sl
	bl GetStatIncrease
	adds r5, r7, #0
	adds r5, #0x77
	strb r0, [r5]
	movs r0, #0
	ldrsb r0, [r5, r0]
	adds r6, r6, r0
	ldr r0, [r7]
	adds r0, #0x21
	ldrb r0, [r0]
	add r0, sl
	bl GetStatIncrease
	adds r4, r7, #0
	adds r4, #0x78
	strb r0, [r4]
	movs r0, #0
	ldrsb r0, [r4, r0]
	adds r6, r6, r0
	ldr r0, [r7]
	adds r0, #0x22
	ldrb r0, [r0]
	add r0, sl
	bl GetStatIncrease
	adds r1, r7, #0
	adds r1, #0x79
	strb r0, [r1]
	movs r0, #0
	ldrsb r0, [r1, r0]
	adds r6, r6, r0
	ldr r0, [sp]
	str r0, [sp, #8]
	ldr r0, [sp, #4]
	str r0, [sp, #0xc]
	mov sl, r8
	mov r8, r5
	adds r5, r4, #0
	adds r4, r1, #0
	cmp r6, #0
	bne _0802BBE0
	b _0802BBCA
_0802BB5A:
	ldr r0, [r7]
	ldrb r0, [r0, #0x1d]
	bl GetStatIncrease
	ldr r1, [sp, #0xc]
	strb r0, [r1]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0802BBE0
	ldr r0, [r7]
	ldrb r0, [r0, #0x1e]
	bl GetStatIncrease
	mov r1, sl
	strb r0, [r1]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0802BBE0
	ldr r0, [r7]
	ldrb r0, [r0, #0x1f]
	bl GetStatIncrease
	mov r1, r9
	strb r0, [r1]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0802BBE0
	ldr r0, [r7]
	adds r0, #0x20
	ldrb r0, [r0]
	bl GetStatIncrease
	mov r1, r8
	strb r0, [r1]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0802BBE0
	ldr r0, [r7]
	adds r0, #0x21
	ldrb r0, [r0]
	bl GetStatIncrease
	strb r0, [r5]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0802BBE0
	ldr r0, [r7]
	adds r0, #0x22
	ldrb r0, [r0]
	bl GetStatIncrease
	strb r0, [r4]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0802BBE0
	adds r6, #1
_0802BBCA:
	cmp r6, #1
	bgt _0802BBE0
	ldr r0, [r7]
	ldrb r0, [r0, #0x1c]
	bl GetStatIncrease
	ldr r1, [sp, #8]
	strb r0, [r1]
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0802BB5A
_0802BBE0:
	movs r0, #0xb
	ldrsb r0, [r7, r0]
	bl GetUnitStruct
	adds r1, r7, #0
	bl CheckForLevelUpCaps
_0802BBEE:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_START sub_802BC00
sub_802BC00: @ 0x0802BC00
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	adds r5, r0, #0
	ldr r0, [r5, #4]
	ldrb r0, [r0, #5]
	bl GetROMClassStruct
	adds r4, r0, #0
	ldr r0, [r5, #4]
	ldrb r0, [r0, #4]
	mov r8, r0
	ldrb r0, [r4, #4]
	mov r9, r0
	adds r6, r4, #0
	adds r6, #0x22
	ldrb r0, [r6]
	ldrb r1, [r5, #0x12]
	adds r0, r0, r1
	strb r0, [r5, #0x12]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldrb r2, [r4, #0x13]
	movs r1, #0x13
	ldrsb r1, [r4, r1]
	cmp r0, r1
	ble _0802BC3A
	strb r2, [r5, #0x12]
_0802BC3A:
	adds r0, r4, #0
	adds r0, #0x23
	ldrb r0, [r0]
	ldrb r1, [r5, #0x14]
	adds r0, r0, r1
	strb r0, [r5, #0x14]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldrb r2, [r4, #0x14]
	movs r1, #0x14
	ldrsb r1, [r4, r1]
	cmp r0, r1
	ble _0802BC56
	strb r2, [r5, #0x14]
_0802BC56:
	adds r0, r4, #0
	adds r0, #0x24
	ldrb r0, [r0]
	ldrb r1, [r5, #0x15]
	adds r0, r0, r1
	strb r0, [r5, #0x15]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldrb r2, [r4, #0x15]
	movs r1, #0x15
	ldrsb r1, [r4, r1]
	cmp r0, r1
	ble _0802BC72
	strb r2, [r5, #0x15]
_0802BC72:
	adds r0, r4, #0
	adds r0, #0x25
	ldrb r0, [r0]
	ldrb r1, [r5, #0x16]
	adds r0, r0, r1
	strb r0, [r5, #0x16]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldrb r2, [r4, #0x16]
	movs r1, #0x16
	ldrsb r1, [r4, r1]
	cmp r0, r1
	ble _0802BC8E
	strb r2, [r5, #0x16]
_0802BC8E:
	adds r0, r4, #0
	adds r0, #0x26
	ldrb r0, [r0]
	ldrb r1, [r5, #0x17]
	adds r0, r0, r1
	strb r0, [r5, #0x17]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldrb r2, [r4, #0x17]
	movs r1, #0x17
	ldrsb r1, [r4, r1]
	cmp r0, r1
	ble _0802BCAA
	strb r2, [r5, #0x17]
_0802BCAA:
	adds r0, r4, #0
	adds r0, #0x27
	ldrb r0, [r0]
	ldrb r1, [r5, #0x18]
	adds r0, r0, r1
	strb r0, [r5, #0x18]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldrb r2, [r4, #0x18]
	movs r1, #0x18
	ldrsb r1, [r4, r1]
	cmp r0, r1
	ble _0802BCC6
	strb r2, [r5, #0x18]
_0802BCC6:
	movs r3, #0
	mov ip, r6
	adds r7, r5, #0
	adds r7, #0x28
	adds r6, r7, #0
_0802BCD0:
	adds r2, r6, r3
	ldr r0, [r5, #4]
	adds r0, #0x2c
	adds r0, r0, r3
	ldrb r1, [r2]
	ldrb r0, [r0]
	subs r1, r1, r0
	strb r1, [r2]
	adds r3, #1
	cmp r3, #7
	ble _0802BCD0
	str r4, [r5, #4]
	movs r3, #0
	adds r4, r7, #0
_0802BCEC:
	adds r2, r4, r3
	ldrb r1, [r2]
	ldr r0, [r5, #4]
	adds r0, #0x2c
	adds r0, r0, r3
	ldrb r0, [r0]
	adds r1, r1, r0
	cmp r1, #0xfb
	ble _0802BD00
	movs r1, #0xfb
_0802BD00:
	strb r1, [r2]
	adds r3, #1
	cmp r3, #7
	ble _0802BCEC
	mov r0, r8
	cmp r0, #0x3e
	bne _0802BD1C
	mov r1, r9
	cmp r1, #0x2d
	bne _0802BD1C
	adds r1, r5, #0
	adds r1, #0x2d
	movs r0, #0
	strb r0, [r1]
_0802BD1C:
	movs r1, #0
	movs r0, #1
	strb r0, [r5, #8]
	strb r1, [r5, #9]
	mov r1, ip
	ldrb r0, [r1]
	ldrb r1, [r5, #0x13]
	adds r0, r0, r1
	strb r0, [r5, #0x13]
	movs r4, #0x13
	ldrsb r4, [r5, r4]
	adds r0, r5, #0
	bl GetUnitMaxHP
	cmp r4, r0
	ble _0802BD44
	adds r0, r5, #0
	bl GetUnitMaxHP
	strb r0, [r5, #0x13]
_0802BD44:
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_START sub_802BD50
sub_802BD50: @ 0x0802BD50
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	adds r5, r0, #0
	lsls r0, r1, #0x18
	lsrs r0, r0, #0x18
	bl GetROMClassStruct
	adds r4, r0, #0
	ldr r0, [r5, #4]
	ldrb r0, [r0, #4]
	mov r8, r0
	ldrb r0, [r4, #4]
	mov r9, r0
	adds r6, r4, #0
	adds r6, #0x22
	ldrb r0, [r6]
	ldrb r1, [r5, #0x12]
	adds r0, r0, r1
	strb r0, [r5, #0x12]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldrb r2, [r4, #0x13]
	movs r1, #0x13
	ldrsb r1, [r4, r1]
	cmp r0, r1
	ble _0802BD8A
	strb r2, [r5, #0x12]
_0802BD8A:
	adds r0, r4, #0
	adds r0, #0x23
	ldrb r0, [r0]
	ldrb r1, [r5, #0x14]
	adds r0, r0, r1
	strb r0, [r5, #0x14]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldrb r2, [r4, #0x14]
	movs r1, #0x14
	ldrsb r1, [r4, r1]
	cmp r0, r1
	ble _0802BDA6
	strb r2, [r5, #0x14]
_0802BDA6:
	adds r0, r4, #0
	adds r0, #0x24
	ldrb r0, [r0]
	ldrb r1, [r5, #0x15]
	adds r0, r0, r1
	strb r0, [r5, #0x15]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldrb r2, [r4, #0x15]
	movs r1, #0x15
	ldrsb r1, [r4, r1]
	cmp r0, r1
	ble _0802BDC2
	strb r2, [r5, #0x15]
_0802BDC2:
	adds r0, r4, #0
	adds r0, #0x25
	ldrb r0, [r0]
	ldrb r1, [r5, #0x16]
	adds r0, r0, r1
	strb r0, [r5, #0x16]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldrb r2, [r4, #0x16]
	movs r1, #0x16
	ldrsb r1, [r4, r1]
	cmp r0, r1
	ble _0802BDDE
	strb r2, [r5, #0x16]
_0802BDDE:
	adds r0, r4, #0
	adds r0, #0x26
	ldrb r0, [r0]
	ldrb r1, [r5, #0x17]
	adds r0, r0, r1
	strb r0, [r5, #0x17]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldrb r2, [r4, #0x17]
	movs r1, #0x17
	ldrsb r1, [r4, r1]
	cmp r0, r1
	ble _0802BDFA
	strb r2, [r5, #0x17]
_0802BDFA:
	adds r0, r4, #0
	adds r0, #0x27
	ldrb r0, [r0]
	ldrb r1, [r5, #0x18]
	adds r0, r0, r1
	strb r0, [r5, #0x18]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldrb r2, [r4, #0x18]
	movs r1, #0x18
	ldrsb r1, [r4, r1]
	cmp r0, r1
	ble _0802BE16
	strb r2, [r5, #0x18]
_0802BE16:
	movs r3, #0
	mov ip, r6
	adds r7, r5, #0
	adds r7, #0x28
	adds r6, r7, #0
_0802BE20:
	adds r2, r6, r3
	ldr r0, [r5, #4]
	adds r0, #0x2c
	adds r0, r0, r3
	ldrb r1, [r2]
	ldrb r0, [r0]
	subs r1, r1, r0
	strb r1, [r2]
	adds r3, #1
	cmp r3, #7
	ble _0802BE20
	str r4, [r5, #4]
	movs r3, #0
	adds r4, r7, #0
_0802BE3C:
	adds r2, r4, r3
	ldrb r1, [r2]
	ldr r0, [r5, #4]
	adds r0, #0x2c
	adds r0, r0, r3
	ldrb r0, [r0]
	adds r1, r1, r0
	cmp r1, #0xfb
	ble _0802BE50
	movs r1, #0xfb
_0802BE50:
	strb r1, [r2]
	adds r3, #1
	cmp r3, #7
	ble _0802BE3C
	mov r0, r8
	cmp r0, #0x3e
	bne _0802BE6C
	mov r1, r9
	cmp r1, #0x2d
	bne _0802BE6C
	adds r1, r5, #0
	adds r1, #0x2d
	movs r0, #0
	strb r0, [r1]
_0802BE6C:
	movs r1, #0
	movs r0, #1
	strb r0, [r5, #8]
	strb r1, [r5, #9]
	mov r1, ip
	ldrb r0, [r1]
	ldrb r1, [r5, #0x13]
	adds r0, r0, r1
	strb r0, [r5, #0x13]
	movs r4, #0x13
	ldrsb r4, [r5, r4]
	adds r0, r5, #0
	bl GetUnitMaxHP
	cmp r4, r0
	ble _0802BE94
	adds r0, r5, #0
	bl GetUnitMaxHP
	strb r0, [r5, #0x13]
_0802BE94:
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_START sub_802BEA0
sub_802BEA0: @ 0x0802BEA0
	push {r4, r5, lr}
	adds r3, r0, #0
	ldrb r0, [r3, #0x12]
	ldrb r2, [r1, #0x12]
	subs r0, r0, r2
	adds r2, r3, #0
	adds r2, #0x73
	strb r0, [r2]
	ldrb r0, [r3, #0x14]
	ldrb r2, [r1, #0x14]
	subs r0, r0, r2
	adds r2, r3, #0
	adds r2, #0x74
	strb r0, [r2]
	ldrb r0, [r3, #0x15]
	ldrb r2, [r1, #0x15]
	subs r0, r0, r2
	adds r2, r3, #0
	adds r2, #0x75
	strb r0, [r2]
	ldrb r0, [r3, #0x16]
	ldrb r2, [r1, #0x16]
	subs r0, r0, r2
	adds r2, r3, #0
	adds r2, #0x76
	strb r0, [r2]
	ldrb r0, [r3, #0x17]
	ldrb r2, [r1, #0x17]
	subs r0, r0, r2
	adds r2, r3, #0
	adds r2, #0x77
	strb r0, [r2]
	ldrb r0, [r3, #0x18]
	ldrb r2, [r1, #0x18]
	subs r0, r0, r2
	adds r2, r3, #0
	adds r2, #0x78
	strb r0, [r2]
	ldrb r0, [r3, #0x19]
	ldrb r2, [r1, #0x19]
	subs r0, r0, r2
	adds r2, r3, #0
	adds r2, #0x79
	strb r0, [r2]
	ldrb r5, [r3, #0x1a]
	movs r2, #0x1a
	ldrsb r2, [r3, r2]
	ldrb r4, [r1, #0x1a]
	movs r0, #0x1a
	ldrsb r0, [r1, r0]
	cmp r2, r0
	beq _0802BF12
	subs r1, r5, r4
	adds r0, r3, #0
	adds r0, #0x7a
	strb r1, [r0]
	b _0802BF1C
_0802BF12:
	adds r1, r3, #0
	adds r1, #0x7a
	movs r0, #0
	strb r0, [r1]
	strb r4, [r3, #0x1a]
_0802BF1C:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_START CheckForLevelUpCaps
CheckForLevelUpCaps: @ 0x0802BF24
	push {r4, r5, lr}
	adds r2, r0, #0
	mov ip, r1
	movs r1, #0x12
	ldrsb r1, [r2, r1]
	mov r0, ip
	adds r0, #0x73
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r3, r1, r0
	movs r0, #0xb
	ldrsb r0, [r2, r0]
	movs r1, #0xc0
	ands r0, r1
	cmp r0, #0x80
	bne _0802BF4C
	cmp r3, #0x78
	bgt _0802BF50
	b _0802BF6E
_0802BF4C:
	cmp r3, #0x3c
	ble _0802BF6E
_0802BF50:
	movs r3, #0x12
	ldrsb r3, [r2, r3]
	movs r0, #0xb
	ldrsb r0, [r2, r0]
	movs r1, #0xc0
	ands r0, r1
	cmp r0, #0x80
	bne _0802BF64
	movs r0, #0x78
	b _0802BF66
_0802BF64:
	movs r0, #0x3c
_0802BF66:
	subs r0, r0, r3
	mov r1, ip
	adds r1, #0x73
	strb r0, [r1]
_0802BF6E:
	movs r0, #0x14
	ldrsb r0, [r2, r0]
	mov r4, ip
	adds r4, #0x74
	movs r1, #0
	ldrsb r1, [r4, r1]
	adds r0, r0, r1
	ldr r5, [r2, #4]
	movs r1, #0x14
	ldrsb r1, [r5, r1]
	adds r3, r5, #0
	cmp r0, r1
	ble _0802BF90
	ldrb r0, [r3, #0x14]
	ldrb r1, [r2, #0x14]
	subs r0, r0, r1
	strb r0, [r4]
_0802BF90:
	movs r0, #0x15
	ldrsb r0, [r2, r0]
	mov r4, ip
	adds r4, #0x75
	movs r1, #0
	ldrsb r1, [r4, r1]
	adds r0, r0, r1
	movs r1, #0x15
	ldrsb r1, [r3, r1]
	cmp r0, r1
	ble _0802BFAE
	ldrb r0, [r3, #0x15]
	ldrb r1, [r2, #0x15]
	subs r0, r0, r1
	strb r0, [r4]
_0802BFAE:
	movs r0, #0x16
	ldrsb r0, [r2, r0]
	mov r4, ip
	adds r4, #0x76
	movs r1, #0
	ldrsb r1, [r4, r1]
	adds r0, r0, r1
	movs r1, #0x16
	ldrsb r1, [r3, r1]
	cmp r0, r1
	ble _0802BFCC
	ldrb r0, [r3, #0x16]
	ldrb r1, [r2, #0x16]
	subs r0, r0, r1
	strb r0, [r4]
_0802BFCC:
	movs r0, #0x17
	ldrsb r0, [r2, r0]
	mov r4, ip
	adds r4, #0x77
	movs r1, #0
	ldrsb r1, [r4, r1]
	adds r0, r0, r1
	movs r1, #0x17
	ldrsb r1, [r3, r1]
	cmp r0, r1
	ble _0802BFEA
	ldrb r0, [r3, #0x17]
	ldrb r1, [r2, #0x17]
	subs r0, r0, r1
	strb r0, [r4]
_0802BFEA:
	movs r0, #0x18
	ldrsb r0, [r2, r0]
	mov r3, ip
	adds r3, #0x78
	movs r1, #0
	ldrsb r1, [r3, r1]
	adds r0, r0, r1
	movs r1, #0x18
	ldrsb r1, [r5, r1]
	cmp r0, r1
	ble _0802C008
	ldrb r0, [r5, #0x18]
	ldrb r1, [r2, #0x18]
	subs r0, r0, r1
	strb r0, [r3]
_0802C008:
	movs r0, #0x19
	ldrsb r0, [r2, r0]
	mov r3, ip
	adds r3, #0x79
	movs r1, #0
	ldrsb r1, [r3, r1]
	adds r0, r0, r1
	cmp r0, #0x1e
	ble _0802C022
	ldrb r1, [r2, #0x19]
	movs r0, #0x1e
	subs r0, r0, r1
	strb r0, [r3]
_0802C022:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_START SaveUnitsFromBattle
SaveUnitsFromBattle: @ 0x0802C028
	push {r4, r5, r6, r7, lr}
	ldr r5, _0802C09C  @ gUnknown_0203A4EC
	movs r0, #0xb
	ldrsb r0, [r5, r0]
	bl GetUnitStruct
	adds r7, r0, #0
	ldr r4, _0802C0A0  @ gUnknown_0203A56C
	movs r0, #0xb
	ldrsb r0, [r4, r0]
	bl GetUnitStruct
	adds r6, r0, #0
	adds r0, r5, #0
	adds r0, #0x52
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0802C064
	adds r0, r5, #0
	adds r0, #0x51
	ldrb r0, [r0]
	lsls r0, r0, #1
	adds r1, r5, #0
	adds r1, #0x1e
	adds r0, r0, r1
	adds r1, #0x2a
	ldrh r1, [r1]
	strh r1, [r0]
_0802C064:
	adds r0, r4, #0
	adds r0, #0x52
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0802C086
	adds r0, r4, #0
	adds r0, #0x51
	ldrb r0, [r0]
	lsls r0, r0, #1
	adds r1, r4, #0
	adds r1, #0x1e
	adds r0, r0, r1
	adds r1, #0x2a
	ldrh r1, [r1]
	strh r1, [r0]
_0802C086:
	adds r0, r7, #0
	adds r1, r5, #0
	bl SaveUnitFromBattle
	cmp r6, #0
	beq _0802C0A4
	adds r0, r6, #0
	adds r1, r4, #0
	bl SaveUnitFromBattle
	b _0802C0AA
	.align 2, 0
_0802C09C: .4byte gUnknown_0203A4EC
_0802C0A0: .4byte gUnknown_0203A56C
_0802C0A4:
	adds r0, r4, #0
	bl SaveSnagWallFromBattle
_0802C0AA:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_START sub_802C0B0
sub_802C0B0: @ 0x0802C0B0
	movs r0, #1
	bx lr

	THUMB_FUNC_START GetBattleNewWExp
GetBattleNewWExp: @ 0x0802C0B4
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	movs r0, #0xb
	ldrsb r0, [r7, r0]
	movs r1, #0xc0
	ands r0, r1
	cmp r0, #0
	bne _0802C112
	movs r0, #0x13
	ldrsb r0, [r7, r0]
	cmp r0, #0
	beq _0802C112
	ldr r0, _0802C118  @ gUnknown_0202BCF0
	ldrb r1, [r0, #0x14]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0802C112
	ldr r0, _0802C11C  @ gUnknown_0202BCB0
	ldrb r1, [r0, #4]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	bne _0802C112
	ldr r0, _0802C120  @ gUnknown_0203A4D4
	ldrh r1, [r0]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	bne _0802C124
	adds r0, r7, #0
	adds r0, #0x52
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0802C112
	ldr r1, [r7, #0x4c]
	movs r0, #5
	ands r0, r1
	cmp r0, #0
	beq _0802C112
	movs r0, #0x88
	lsls r0, r0, #3
	ands r1, r0
	cmp r1, #0
	beq _0802C124
_0802C112:
	movs r0, #1
	negs r0, r0
	b _0802C1AA
	.align 2, 0
_0802C118: .4byte gUnknown_0202BCF0
_0802C11C: .4byte gUnknown_0202BCB0
_0802C120: .4byte gUnknown_0203A4D4
_0802C124:
	adds r5, r7, #0
	adds r5, #0x50
	ldrb r0, [r5]
	adds r4, r7, #0
	adds r4, #0x28
	adds r0, r4, r0
	ldrb r6, [r0]
	adds r0, r7, #0
	adds r0, #0x48
	ldrh r0, [r0]
	bl GetItemAwardedExp
	adds r1, r7, #0
	adds r1, #0x7b
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	muls r0, r1, r0
	adds r6, r6, r0
	movs r1, #0
	ldrb r3, [r5]
_0802C14E:
	ldr r2, [r7, #4]
	cmp r1, r3
	beq _0802C170
	adds r0, r2, #0
	adds r0, #0x2c
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0xfb
	beq _0802C170
	adds r0, r4, r1
	ldrb r0, [r0]
	cmp r0, #0xfa
	bls _0802C170
	cmp r6, #0xfa
	ble _0802C176
	movs r6, #0xfa
	b _0802C176
_0802C170:
	adds r1, #1
	cmp r1, #7
	ble _0802C14E
_0802C176:
	ldr r0, [r7]
	ldr r4, [r0, #0x28]
	ldr r0, [r2, #0x28]
	orrs r4, r0
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r4
	cmp r0, #0
	beq _0802C190
	cmp r6, #0xfb
	ble _0802C1A8
	movs r6, #0xfb
	b _0802C1A8
_0802C190:
	movs r0, #0x80
	lsls r0, r0, #0xc
	ands r4, r0
	cmp r4, #0
	beq _0802C1A2
	cmp r6, #0x47
	ble _0802C1A8
	movs r6, #0x47
	b _0802C1A8
_0802C1A2:
	cmp r6, #0xb5
	ble _0802C1A8
	movs r6, #0xb5
_0802C1A8:
	adds r0, r6, #0
_0802C1AA:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_START BattleUnit_DidWRankGoUp
BattleUnit_DidWRankGoUp: @ 0x0802C1B0
	push {r4, r5, lr}
	adds r2, r0, #0
	adds r2, #0x50
	adds r1, r0, #0
	adds r1, #0x28
	ldrb r2, [r2]
	adds r1, r1, r2
	ldrb r4, [r1]
	bl GetBattleNewWExp
	adds r5, r0, #0
	cmp r5, #0
	blt _0802C1E4
	adds r0, r4, #0
	bl GetWeaponLevelFromExp
	adds r4, r0, #0
	adds r0, r5, #0
	bl GetWeaponLevelFromExp
	adds r1, r0, #0
	eors r1, r4
	negs r0, r1
	orrs r0, r1
	lsrs r0, r0, #0x1f
	b _0802C1E6
_0802C1E4:
	movs r0, #0
_0802C1E6:
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_START SaveUnitFromBattle
SaveUnitFromBattle: @ 0x0802C1EC
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldrb r0, [r5, #8]
	strb r0, [r4, #8]
	ldrb r0, [r5, #9]
	strb r0, [r4, #9]
	ldrb r0, [r5, #0x13]
	strb r0, [r4, #0x13]
	ldr r0, [r5, #0xc]
	str r0, [r4, #0xc]
	ldr r2, _0802C2D0  @ gUnknown_03003060
	lsrs r0, r0, #0x11
	movs r1, #7
	ands r0, r1
	strb r0, [r2]
	adds r1, r5, #0
	adds r1, #0x6f
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	blt _0802C220
	adds r1, r0, #0
	adds r0, r4, #0
	bl SetUnitNewStatus
_0802C220:
	adds r0, r5, #0
	adds r0, #0x73
	ldrb r0, [r0]
	ldrb r1, [r4, #0x12]
	adds r0, r0, r1
	strb r0, [r4, #0x12]
	adds r0, r5, #0
	adds r0, #0x74
	ldrb r0, [r0]
	ldrb r1, [r4, #0x14]
	adds r0, r0, r1
	strb r0, [r4, #0x14]
	adds r0, r5, #0
	adds r0, #0x75
	ldrb r0, [r0]
	ldrb r1, [r4, #0x15]
	adds r0, r0, r1
	strb r0, [r4, #0x15]
	adds r0, r5, #0
	adds r0, #0x76
	ldrb r0, [r0]
	ldrb r1, [r4, #0x16]
	adds r0, r0, r1
	strb r0, [r4, #0x16]
	adds r0, r5, #0
	adds r0, #0x77
	ldrb r0, [r0]
	ldrb r1, [r4, #0x17]
	adds r0, r0, r1
	strb r0, [r4, #0x17]
	adds r0, r5, #0
	adds r0, #0x78
	ldrb r0, [r0]
	ldrb r1, [r4, #0x18]
	adds r0, r0, r1
	strb r0, [r4, #0x18]
	adds r0, r5, #0
	adds r0, #0x79
	ldrb r0, [r0]
	ldrb r1, [r4, #0x19]
	adds r0, r0, r1
	strb r0, [r4, #0x19]
	adds r0, r4, #0
	bl CheckForStatCaps
	adds r0, r5, #0
	bl GetBattleNewWExp
	adds r2, r0, #0
	cmp r2, #0
	ble _0802C294
	adds r1, r5, #0
	adds r1, #0x50
	adds r0, r4, #0
	adds r0, #0x28
	ldrb r1, [r1]
	adds r0, r0, r1
	strb r2, [r0]
_0802C294:
	adds r6, r5, #0
	adds r6, #0x6e
	adds r1, r5, #0
	adds r1, #0x1e
	adds r3, r4, #0
	adds r3, #0x1e
	movs r2, #4
_0802C2A2:
	ldrh r0, [r1]
	strh r0, [r3]
	adds r1, #2
	adds r3, #2
	subs r2, #1
	cmp r2, #0
	bge _0802C2A2
	adds r0, r4, #0
	bl RemoveUnitBlankItems
	movs r0, #0
	ldrsb r0, [r6, r0]
	cmp r0, #0
	beq _0802C2CA
	ldr r0, [r4]
	ldrb r0, [r0, #4]
	movs r1, #0
	ldrsb r1, [r6, r1]
	bl BWL_AddExpGained
_0802C2CA:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802C2D0: .4byte gUnknown_03003060

	THUMB_FUNC_START sub_802C2D4
sub_802C2D4: @ 0x0802C2D4
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	ldrb r0, [r4, #0x13]
	strb r0, [r5, #0x13]
	adds r0, r4, #0
	bl GetBattleNewWExp
	adds r2, r0, #0
	cmp r2, #0
	ble _0802C2F8
	adds r1, r4, #0
	adds r1, #0x50
	adds r0, r5, #0
	adds r0, #0x28
	ldrb r1, [r1]
	adds r0, r0, r1
	strb r2, [r0]
_0802C2F8:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_START UpdateBallistaUsesFromBattle
UpdateBallistaUsesFromBattle: @ 0x0802C300
	push {r4, r5, lr}
	ldr r0, _0802C32C  @ gUnknown_0203A4D4
	ldrh r1, [r0]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _0802C324
	ldr r4, _0802C330  @ gUnknown_0203A4EC
	adds r0, r4, #0
	adds r0, #0x48
	ldrh r0, [r0]
	bl GetItemUses
	adds r5, r0, #0
	ldrb r0, [r4, #0x1c]
	bl GetTrap
	strb r5, [r0, #6]
_0802C324:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802C32C: .4byte gUnknown_0203A4D4
_0802C330: .4byte gUnknown_0203A4EC

	THUMB_FUNC_START NullSomeStuff
NullSomeStuff: @ 0x0802C334
	ldr r1, _0802C340  @ gUnknown_0203A60C
	movs r0, #0
	strb r0, [r1]
	strb r0, [r1, #1]
	strb r0, [r1, #2]
	bx lr
	.align 2, 0
_0802C340: .4byte gUnknown_0203A60C

	THUMB_FUNC_START sub_802C344
sub_802C344: @ 0x0802C344
	push {lr}
	movs r3, #8
	ldrsb r3, [r0, r3]
	ldr r1, [r0]
	ldr r2, [r0, #4]
	ldr r0, [r1, #0x28]
	ldr r1, [r2, #0x28]
	orrs r0, r1
	movs r1, #0x80
	lsls r1, r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0802C360
	adds r3, #0x14
_0802C360:
	adds r0, r3, #0
	pop {r1}
	bx r1

	THUMB_FUNC_START sub_802C368
sub_802C368: @ 0x0802C368
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r4, r1, #0
	bl sub_802C344
	adds r5, r0, #0
	adds r0, r4, #0
	bl sub_802C344
	subs r5, r5, r0
	movs r0, #0x1f
	subs r5, r0, r5
	cmp r5, #0
	bge _0802C386
	movs r5, #0
_0802C386:
	ldr r0, [r6, #4]
	movs r1, #0x1a
	ldrsb r1, [r0, r1]
	adds r0, r5, #0
	bl __divsi3
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	THUMB_FUNC_START sub_802C398
sub_802C398: @ 0x0802C398
	push {r4, lr}
	movs r2, #8
	ldrsb r2, [r0, r2]
	ldr r3, [r0, #4]
	movs r1, #0x1a
	ldrsb r1, [r3, r1]
	adds r4, r2, #0
	muls r4, r1, r4
	ldr r0, [r0]
	ldr r0, [r0, #0x28]
	ldr r1, [r3, #0x28]
	orrs r0, r1
	movs r1, #0x80
	lsls r1, r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0802C3D0
	ldrb r0, [r3, #5]
	cmp r0, #0
	beq _0802C3D0
	bl GetROMClassStruct
	movs r1, #0x1a
	ldrsb r1, [r0, r1]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r4, r4, r0
_0802C3D0:
	adds r0, r4, #0
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_START sub_802C3D8
sub_802C3D8: @ 0x0802C3D8
	push {lr}
	movs r2, #0
	ldr r0, [r1]
	ldr r3, [r1, #4]
	ldr r1, [r0, #0x28]
	ldr r0, [r3, #0x28]
	orrs r1, r0
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _0802C3F0
	movs r2, #0x14
_0802C3F0:
	movs r0, #0x80
	lsls r0, r0, #8
	ands r1, r0
	cmp r1, #0
	beq _0802C3FC
	adds r2, #0x28
_0802C3FC:
	ldrb r0, [r3, #4]
	cmp r0, #0x53
	bne _0802C404
	adds r2, #0x28
_0802C404:
	adds r0, r2, #0
	pop {r1}
	bx r1

	THUMB_FUNC_START sub_802C40C
sub_802C40C: @ 0x0802C40C
	push {lr}
	ldr r1, [r0]
	ldr r2, [r0, #4]
	ldr r0, [r1, #0x28]
	ldr r1, [r2, #0x28]
	orrs r0, r1
	movs r1, #0x80
	lsls r1, r1, #0x12
	ands r0, r1
	cmp r0, #0
	bne _0802C428
	b _0802C444
_0802C424:
	movs r0, #2
	b _0802C446
_0802C428:
	movs r2, #0
	movs r3, #0x80
	lsls r3, r3, #4
	ldr r1, _0802C44C  @ gUnknown_0203A5EC
_0802C430:
	ldr r0, [r1]
	lsls r0, r0, #0xd
	lsrs r0, r0, #0xd
	ands r0, r3
	cmp r0, #0
	bne _0802C424
	adds r1, #4
	adds r2, #1
	cmp r2, #6
	ble _0802C430
_0802C444:
	movs r0, #1
_0802C446:
	pop {r1}
	bx r1
	.align 2, 0
_0802C44C: .4byte gUnknown_0203A5EC

	THUMB_FUNC_START sub_802C450
sub_802C450: @ 0x0802C450
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r5, r1, #0
	movs r0, #0x13
	ldrsb r0, [r5, r0]
	cmp r0, #0
	beq _0802C462
	movs r0, #0
	b _0802C4EA
_0802C462:
	movs r6, #0x14
	ldr r0, _0802C48C  @ gUnknown_0202BCB0
	ldrb r1, [r0, #4]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	bne _0802C478
	ldr r0, _0802C490  @ gUnknown_0202BCF0
	ldrb r0, [r0, #0x1b]
	cmp r0, #1
	beq _0802C494
_0802C478:
	adds r0, r5, #0
	bl sub_802C398
	adds r6, r0, #0
	adds r6, #0x14
	adds r0, r7, #0
	bl sub_802C398
	subs r6, r6, r0
	b _0802C4CE
	.align 2, 0
_0802C48C: .4byte gUnknown_0202BCB0
_0802C490: .4byte gUnknown_0202BCF0
_0802C494:
	adds r0, r5, #0
	bl sub_802C398
	adds r4, r0, #0
	adds r0, r7, #0
	bl sub_802C398
	cmp r4, r0
	bgt _0802C4BC
	adds r0, r5, #0
	bl sub_802C398
	adds r4, r0, #0
	adds r0, r7, #0
	bl sub_802C398
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	b _0802C4CA
_0802C4BC:
	adds r0, r5, #0
	bl sub_802C398
	adds r4, r0, #0
	adds r0, r7, #0
	bl sub_802C398
_0802C4CA:
	subs r4, r4, r0
	adds r6, r6, r4
_0802C4CE:
	adds r0, r7, #0
	adds r1, r5, #0
	bl sub_802C3D8
	adds r6, r6, r0
	adds r0, r7, #0
	adds r1, r5, #0
	bl sub_802C40C
	muls r6, r0, r6
	cmp r6, #0
	bge _0802C4E8
	movs r6, #0
_0802C4E8:
	adds r0, r6, #0
_0802C4EA:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_START sub_802C4F0
sub_802C4F0: @ 0x0802C4F0
	push {lr}
	adds r3, r0, #0
	ldr r0, [r1, #4]
	ldrb r0, [r0, #4]
	cmp r0, #0x62
	beq _0802C500
	cmp r0, #0x34
	bne _0802C510
_0802C500:
	movs r0, #0x13
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bne _0802C50C
	movs r0, #0x32
	b _0802C50E
_0802C50C:
	movs r0, #0
_0802C50E:
	str r0, [r2]
_0802C510:
	ldr r0, [r1, #4]
	ldrb r0, [r0, #4]
	cmp r0, #0x66
	bne _0802C524
	ldrb r1, [r1, #0x13]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	cmp r1, #0
	bne _0802C524
	str r1, [r2]
_0802C524:
	ldr r0, [r3, #4]
	ldrb r0, [r0, #4]
	cmp r0, #0x51
	bne _0802C530
	movs r0, #0
	str r0, [r2]
_0802C530:
	pop {r0}
	bx r0

	THUMB_FUNC_START sub_802C534
sub_802C534: @ 0x0802C534
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	bl CanUnitNotLevelUp
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0802C562
	movs r0, #0x13
	ldrsb r0, [r4, r0]
	cmp r0, #0
	beq _0802C562
	ldr r0, [r5]
	ldr r1, [r5, #4]
	ldr r0, [r0, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	movs r1, #0x80
	lsls r1, r1, #0x11
	ands r0, r1
	cmp r0, #0
	beq _0802C566
_0802C562:
	movs r0, #0
	b _0802C5AE
_0802C566:
	adds r0, r4, #0
	adds r0, #0x7c
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _0802C578
	movs r0, #1
	b _0802C5AE
_0802C578:
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_802C368
	str r0, [sp]
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_802C450
	ldr r1, [sp]
	adds r1, r1, r0
	str r1, [sp]
	cmp r1, #0x64
	ble _0802C598
	movs r0, #0x64
	str r0, [sp]
_0802C598:
	ldr r0, [sp]
	cmp r0, #0
	bgt _0802C5A2
	movs r0, #1
	str r0, [sp]
_0802C5A2:
	adds r0, r4, #0
	adds r1, r5, #0
	mov r2, sp
	bl sub_802C4F0
	ldr r0, [sp]
_0802C5AE:
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_START HandleSomeExp
HandleSomeExp: @ 0x0802C5B8
	push {r4, lr}
	ldr r0, _0802C604  @ gUnknown_0202BCF0
	ldrb r1, [r0, #0x14]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0802C632
	ldr r4, _0802C608  @ gUnknown_0203A4EC
	ldr r0, [r4, #0x4c]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	beq _0802C60C
	movs r0, #0xb
	ldrsb r0, [r4, r0]
	movs r1, #0xc0
	ands r0, r1
	cmp r0, #0
	bne _0802C5E8
	adds r1, r4, #0
	adds r1, #0x7b
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
_0802C5E8:
	adds r0, r4, #0
	bl GetBattleUnitStaffExp
	adds r1, r4, #0
	adds r1, #0x6e
	strb r0, [r1]
	ldrb r1, [r4, #9]
	adds r1, r1, r0
	strb r1, [r4, #9]
	adds r0, r4, #0
	bl CheckForLevelUp
	b _0802C632
	.align 2, 0
_0802C604: .4byte gUnknown_0202BCF0
_0802C608: .4byte gUnknown_0203A4EC
_0802C60C:
	adds r0, r4, #0
	adds r0, #0x50
	ldrb r0, [r0]
	cmp r0, #0xc
	bne _0802C632
	ldrb r1, [r4, #9]
	adds r0, r1, #0
	cmp r0, #0xff
	beq _0802C632
	adds r2, r4, #0
	adds r2, #0x6e
	movs r0, #0x14
	strb r0, [r2]
	adds r0, r1, #0
	adds r0, #0x14
	strb r0, [r4, #9]
	adds r0, r4, #0
	bl CheckForLevelUp
_0802C632:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_START GetBattleUnitStaffExp
GetBattleUnitStaffExp: @ 0x0802C638
	push {r4, lr}
	adds r4, r0, #0
	bl CanUnitNotLevelUp
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0802C64A
	movs r0, #0
	b _0802C69A
_0802C64A:
	ldr r0, _0802C660  @ gUnknown_0203A5EC
	ldr r0, [r0]
	lsls r0, r0, #0xd
	lsrs r0, r0, #0xd
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	beq _0802C664
	movs r0, #1
	b _0802C69A
	.align 2, 0
_0802C660: .4byte gUnknown_0203A5EC
_0802C664:
	adds r0, r4, #0
	adds r0, #0x48
	ldrh r0, [r0]
	bl GetItemCostPerUse
	movs r1, #0x14
	bl __divsi3
	adds r2, r0, #0
	adds r2, #0xa
	ldr r0, [r4]
	ldr r1, [r4, #4]
	ldr r0, [r0, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	movs r1, #0x80
	lsls r1, r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0802C692
	lsrs r0, r2, #0x1f
	adds r0, r2, r0
	asrs r2, r0, #1
_0802C692:
	cmp r2, #0x64
	ble _0802C698
	movs r2, #0x64
_0802C698:
	adds r0, r2, #0
_0802C69A:
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_START InstigatorAdd10Exp
InstigatorAdd10Exp: @ 0x0802C6A0
	push {r4, lr}
	ldr r4, _0802C6E4  @ gUnknown_0203A4EC
	movs r0, #0xb
	ldrsb r0, [r4, r0]
	movs r1, #0xc0
	ands r0, r1
	cmp r0, #0
	bne _0802C6DC
	adds r0, r4, #0
	bl CanUnitNotLevelUp
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0802C6DC
	ldr r0, _0802C6E8  @ gUnknown_0202BCF0
	ldrb r1, [r0, #0x14]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0802C6DC
	adds r1, r4, #0
	adds r1, #0x6e
	movs r0, #0xa
	strb r0, [r1]
	ldrb r0, [r4, #9]
	adds r0, #0xa
	strb r0, [r4, #9]
	adds r0, r4, #0
	bl CheckForLevelUp
_0802C6DC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802C6E4: .4byte gUnknown_0203A4EC
_0802C6E8: .4byte gUnknown_0202BCF0

	THUMB_FUNC_START sub_802C6EC
sub_802C6EC: @ 0x0802C6EC
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r4, r5, #0
	adds r4, #0x4a
	ldrh r0, [r4]
	cmp r0, #0
	bne _0802C73A
	adds r0, r5, #0
	bl GetUnitEquippedWeapon
	strh r0, [r4]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _0802C73A
	adds r0, r5, #0
	bl UnitHasMagicRank
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0802C73A
	movs r6, #0
	subs r4, #0x2c
_0802C718:
	ldrh r1, [r4]
	adds r0, r5, #0
	bl CanUnitUseStaff
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _0802C732
	ldrh r1, [r4]
	adds r0, r5, #0
	adds r0, #0x4a
	strh r1, [r0]
	b _0802C73A
_0802C732:
	adds r4, #2
	adds r6, #1
	cmp r6, #4
	ble _0802C718
_0802C73A:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_START sub_802C740
sub_802C740: @ 0x0802C740
	push {lr}
	adds r2, r0, #0
	adds r0, #0x52
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _0802C768
	adds r0, r2, #0
	adds r0, #0x5a
	movs r1, #0xff
	strh r1, [r0]
	adds r0, #6
	strh r1, [r0]
	adds r0, #4
	strh r1, [r0]
	adds r0, #2
	strh r1, [r0]
	adds r0, #4
	strh r1, [r0]
_0802C768:
	pop {r0}
	bx r0

	THUMB_FUNC_START BattleReverseWTriangeEffect
BattleReverseWTriangeEffect: @ 0x0802C76C
	push {lr}
	adds r2, r0, #0
	adds r3, r1, #0
	ldr r0, [r2, #0x4c]
	movs r1, #0x80
	lsls r1, r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0802C786
	ldr r0, [r3, #0x4c]
	ands r0, r1
	cmp r0, #0
	bne _0802C7BA
_0802C786:
	adds r1, r2, #0
	adds r1, #0x53
	movs r0, #0
	ldrsb r0, [r1, r0]
	lsls r0, r0, #1
	negs r0, r0
	strb r0, [r1]
	adds r1, #1
	movs r0, #0
	ldrsb r0, [r1, r0]
	lsls r0, r0, #1
	negs r0, r0
	strb r0, [r1]
	adds r1, r3, #0
	adds r1, #0x53
	movs r0, #0
	ldrsb r0, [r1, r0]
	lsls r0, r0, #1
	negs r0, r0
	strb r0, [r1]
	adds r1, #1
	movs r0, #0
	ldrsb r0, [r1, r0]
	lsls r0, r0, #1
	negs r0, r0
	strb r0, [r1]
_0802C7BA:
	pop {r0}
	bx r0

	THUMB_FUNC_START BattleApplyWeaponTriangle
BattleApplyWeaponTriangle: @ 0x0802C7C0
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r2, _0802C7CC  @ gUnknown_0859BA90
	b _0802C812
	.align 2, 0
_0802C7CC: .4byte gUnknown_0859BA90
_0802C7D0:
	adds r0, r4, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r0, #0
	ldrsb r0, [r2, r0]
	cmp r1, r0
	bne _0802C810
	adds r0, r5, #0
	adds r0, #0x50
	ldrb r1, [r0]
	movs r0, #1
	ldrsb r0, [r2, r0]
	cmp r1, r0
	bne _0802C810
	ldrb r0, [r2, #2]
	adds r1, r4, #0
	adds r1, #0x53
	strb r0, [r1]
	ldrb r1, [r2, #3]
	adds r0, r4, #0
	adds r0, #0x54
	strb r1, [r0]
	ldrb r0, [r2, #2]
	negs r0, r0
	adds r1, r5, #0
	adds r1, #0x53
	strb r0, [r1]
	ldrb r0, [r2, #3]
	negs r0, r0
	adds r1, #1
	strb r0, [r1]
	b _0802C81A
_0802C810:
	adds r2, #4
_0802C812:
	movs r0, #0
	ldrsb r0, [r2, r0]
	cmp r0, #0
	bge _0802C7D0
_0802C81A:
	ldr r0, [r4, #0x4c]
	movs r6, #0x80
	lsls r6, r6, #1
	ands r0, r6
	cmp r0, #0
	beq _0802C82E
	adds r0, r4, #0
	adds r1, r5, #0
	bl BattleReverseWTriangeEffect
_0802C82E:
	ldr r0, [r5, #0x4c]
	ands r0, r6
	cmp r0, #0
	beq _0802C83E
	adds r0, r4, #0
	adds r1, r5, #0
	bl BattleReverseWTriangeEffect
_0802C83E:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_START DoSomeBattleWeaponStuff
DoSomeBattleWeaponStuff: @ 0x0802C844
	push {r4, lr}
	ldr r1, _0802C8BC  @ gUnknown_0203A56C
	ldr r0, [r1, #4]
	ldrb r0, [r0, #4]
	mov ip, r1
	cmp r0, #0x62
	beq _0802C856
	cmp r0, #0x34
	bne _0802C864
_0802C856:
	mov r0, ip
	adds r0, #0x48
	movs r2, #0
	movs r1, #0
	strh r1, [r0]
	adds r0, #0xa
	strb r2, [r0]
_0802C864:
	ldr r4, _0802C8C0  @ gUnknown_0203A4EC
	mov r3, ip
	ldr r0, [r4, #0x4c]
	ldr r1, [r3, #0x4c]
	orrs r0, r1
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0802C886
	adds r1, r3, #0
	adds r1, #0x48
	movs r2, #0
	movs r0, #0
	strh r0, [r1]
	adds r0, r3, #0
	adds r0, #0x52
	strb r2, [r0]
_0802C886:
	adds r0, r4, #0
	adds r0, #0x30
	ldrb r1, [r0]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #4
	bne _0802C8B6
	movs r0, #0xb
	ldrsb r0, [r4, r0]
	movs r1, #0xc0
	ands r0, r1
	cmp r0, #0
	bne _0802C8B6
	mov r0, ip
	movs r2, #0xb
	ldrsb r2, [r0, r2]
	ands r2, r1
	cmp r2, #0
	bne _0802C8B6
	adds r0, #0x48
	movs r1, #0
	strh r2, [r0]
	adds r0, #0xa
	strb r1, [r0]
_0802C8B6:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802C8BC: .4byte gUnknown_0203A56C
_0802C8C0: .4byte gUnknown_0203A4EC

	THUMB_FUNC_START MakeSnagBattleTarget
MakeSnagBattleTarget: @ 0x0802C8C4
	push {r4, lr}
	ldr r4, _0802C91C  @ gUnknown_0203A56C
	adds r0, r4, #0
	bl ClearUnitStruct
	movs r0, #0
	strb r0, [r4, #0xb]
	movs r0, #1
	bl GetROMClassStruct
	str r0, [r4, #4]
	ldr r0, _0802C920  @ gUnknown_0202BCF0
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetROMChapterStruct
	adds r0, #0x2c
	ldrb r0, [r0]
	strb r0, [r4, #0x12]
	ldr r1, _0802C924  @ gUnknown_0203A958
	ldrb r0, [r1, #0x15]
	strb r0, [r4, #0x13]
	ldrb r0, [r1, #0x13]
	strb r0, [r4, #0x10]
	ldrb r0, [r1, #0x14]
	strb r0, [r4, #0x11]
	movs r0, #0x11
	ldrsb r0, [r4, r0]
	ldr r1, _0802C928  @ gUnknown_0202E4DC
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r1, #0x10
	ldrsb r1, [r4, r1]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0x1b
	beq _0802C92C
	cmp r0, #0x33
	beq _0802C936
	b _0802C942
	.align 2, 0
_0802C91C: .4byte gUnknown_0203A56C
_0802C920: .4byte gUnknown_0202BCF0
_0802C924: .4byte gUnknown_0203A958
_0802C928: .4byte gUnknown_0202E4DC
_0802C92C:
	movs r0, #0xfe
	bl GetROMCharStruct
	str r0, [r4]
	b _0802C942
_0802C936:
	movs r0, #0xff
	bl GetROMCharStruct
	str r0, [r4]
	movs r0, #0x14
	strb r0, [r4, #0x12]
_0802C942:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_START FillSnagBattleStats
FillSnagBattleStats: @ 0x0802C948
	push {r4, lr}
	ldr r1, _0802C97C  @ gUnknown_0203A4EC
	adds r2, r1, #0
	adds r2, #0x64
	movs r4, #0
	movs r3, #0
	movs r0, #0x64
	strh r0, [r2]
	adds r1, #0x6a
	strh r3, [r1]
	ldr r1, _0802C980  @ gUnknown_0203A56C
	adds r2, r1, #0
	adds r2, #0x5e
	movs r0, #0xff
	strh r0, [r2]
	ldrb r0, [r1, #0x13]
	adds r2, #0x14
	strb r0, [r2]
	adds r0, r1, #0
	adds r0, #0x53
	strb r4, [r0]
	adds r0, #1
	strb r4, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802C97C: .4byte gUnknown_0203A4EC
_0802C980: .4byte gUnknown_0203A56C

	THUMB_FUNC_START SaveSnagWallFromBattle
SaveSnagWallFromBattle: @ 0x0802C984
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	bl GetTrapAt
	adds r6, r0, #0
	ldrb r0, [r4, #0x13]
	strb r0, [r6, #3]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0802CA00
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	bl GetMapChangesIdAt
	adds r5, r0, #0
	movs r0, #0x11
	ldrsb r0, [r4, r0]
	ldr r1, _0802CA08  @ gUnknown_0202E4DC
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r1, #0x10
	ldrsb r1, [r4, r1]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0x33
	bne _0802C9DA
	ldr r0, _0802CA0C  @ gUnknown_0202BCF0
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0802C9DA
	ldr r0, _0802CA10  @ 0x000002D7
	bl m4aSongNumStart
_0802C9DA:
	bl sub_8019CBC
	adds r0, r5, #0
	bl ApplyMapChangesById
	movs r0, #0
	strb r0, [r6, #2]
	adds r0, r5, #0
	bl AddMapChange
	bl FlushTerrainData
	bl sub_802E690
	bl UpdateGameTilesGraphics
	movs r0, #0
	bl NewBMXFADE
_0802CA00:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802CA08: .4byte gUnknown_0202E4DC
_0802CA0C: .4byte gUnknown_0202BCF0
_0802CA10: .4byte 0x000002D7

	THUMB_FUNC_START BeginBattleAnimations
BeginBattleAnimations: @ 0x0802CA14
	push {lr}
	ldr r0, _0802CA48  @ gBG2TilemapBuffer
	movs r1, #0
	bl BG_Fill
	movs r0, #4
	bl BG_EnableSyncByMask
	ldr r1, _0802CA4C  @ gPaletteBuffer
	movs r0, #0
	strh r0, [r1]
	bl EnablePaletteSync
	bl UpdateGameTilesGraphics
	bl sub_8055BC4
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0802CA50
	movs r0, #0
	bl sub_804FD48
	bl BeginAnimsOnBattleAnimations
	b _0802CA66
	.align 2, 0
_0802CA48: .4byte gBG2TilemapBuffer
_0802CA4C: .4byte gPaletteBuffer
_0802CA50:
	bl MU_EndAll
	bl UpdateGameTilesGraphics
	bl BeginBattleMapAnims
	ldr r0, _0802CA6C  @ gUnknown_0203A4D4
	ldrh r1, [r0]
	movs r2, #0x80
	orrs r1, r2
	strh r1, [r0]
_0802CA66:
	pop {r0}
	bx r0
	.align 2, 0
_0802CA6C: .4byte gUnknown_0203A4D4

	THUMB_FUNC_START sub_802CA70
sub_802CA70: @ 0x0802CA70
	push {lr}
	ldr r1, [r0, #0xc]
	movs r0, #0x80
	lsls r0, r0, #7
	ands r0, r1
	cmp r0, #0
	beq _0802CA82
	movs r0, #0
	b _0802CA92
_0802CA82:
	movs r0, #0x80
	lsls r0, r0, #8
	ands r1, r0
	cmp r1, #0
	bne _0802CA90
	movs r0, #1
	b _0802CA92
_0802CA90:
	movs r0, #3
_0802CA92:
	pop {r1}
	bx r1

	THUMB_FUNC_START sub_802CA98
sub_802CA98: @ 0x0802CA98
	push {lr}
	ldr r0, _0802CACC  @ gUnknown_0202BCF0
	adds r0, #0x42
	ldrb r0, [r0]
	lsls r0, r0, #0x1d
	lsrs r0, r0, #0x1e
	cmp r0, #2
	bne _0802CAF2
	ldr r2, _0802CAD0  @ gUnknown_0203A4EC
	movs r0, #0xb
	ldrsb r0, [r2, r0]
	movs r1, #0xc0
	ands r0, r1
	adds r3, r2, #0
	cmp r0, #0
	bne _0802CAD8
	ldr r0, _0802CAD4  @ gUnknown_0203A56C
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ands r0, r1
	cmp r0, #0
	bne _0802CAEC
	adds r0, r3, #0
	b _0802CAEE
	.align 2, 0
_0802CACC: .4byte gUnknown_0202BCF0
_0802CAD0: .4byte gUnknown_0203A4EC
_0802CAD4: .4byte gUnknown_0203A56C
_0802CAD8:
	ldr r2, _0802CAE8  @ gUnknown_0203A56C
	movs r0, #0xb
	ldrsb r0, [r2, r0]
	ands r0, r1
	cmp r0, #0
	beq _0802CAEC
	movs r0, #1
	b _0802CAF2
	.align 2, 0
_0802CAE8: .4byte gUnknown_0203A56C
_0802CAEC:
	adds r0, r2, #0
_0802CAEE:
	bl sub_802CA70
_0802CAF2:
	pop {r1}
	bx r1

	THUMB_FUNC_START nullsub_11
nullsub_11: @ 0x0802CAF8
	bx lr

	THUMB_FUNC_START sub_802CAFC
sub_802CAFC: @ 0x0802CAFC
	push {lr}
	ldr r2, _0802CB0C  @ gUnknown_0203A5EC
	ldr r0, [r2]
	lsls r0, r0, #8
	lsrs r0, r0, #0x1b
	movs r1, #0x10
	b _0802CB18
	.align 2, 0
_0802CB0C: .4byte gUnknown_0203A5EC
_0802CB10:
	adds r2, #4
	ldr r0, [r2]
	lsls r0, r0, #8
	lsrs r0, r0, #0x1b
_0802CB18:
	ands r0, r1
	cmp r0, #0
	beq _0802CB10
	pop {r0}
	bx r0

	THUMB_FUNC_START sub_802CB24
sub_802CB24: @ 0x0802CB24
	push {r4, r5, r6, r7, lr}
	adds r2, r0, #0
	adds r7, r1, #0
	lsls r1, r7, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r6, [r0]
	cmp r7, #0
	bge _0802CB38
	movs r6, #0
_0802CB38:
	ldr r1, _0802CBBC  @ gUnknown_0203A4D4
	movs r4, #0
	movs r0, #0
	strh r0, [r1]
	ldr r5, _0802CBC0  @ gUnknown_0203A4EC
	adds r0, r5, #0
	adds r1, r2, #0
	bl CopyUnitToBattleStruct
	adds r0, r5, #0
	bl BattleSetupTerrainData
	adds r0, r5, #0
	bl LoadRawDefense
	adds r0, r5, #0
	movs r1, #0
	bl BattleApplyMiscBonuses
	adds r0, r5, #0
	adds r0, #0x5a
	movs r2, #0xff
	strh r2, [r0]
	adds r1, r5, #0
	adds r1, #0x64
	movs r0, #0x64
	strh r0, [r1]
	adds r0, r5, #0
	adds r0, #0x6a
	strh r2, [r0]
	subs r0, #0x22
	strh r6, [r0]
	adds r0, #2
	strh r6, [r0]
	adds r0, #7
	strb r7, [r0]
	adds r0, r6, #0
	bl GetItemType
	adds r1, r5, #0
	adds r1, #0x50
	strb r0, [r1]
	adds r0, r6, #0
	bl GetItemAttributes
	str r0, [r5, #0x4c]
	adds r1, r5, #0
	adds r1, #0x52
	movs r0, #1
	strb r0, [r1]
	adds r0, r5, #0
	adds r0, #0x7e
	strb r4, [r0]
	adds r1, #0x1d
	movs r0, #0xff
	strb r0, [r1]
	ldr r0, _0802CBC4  @ gUnknown_0203A56C
	adds r0, #0x6f
	movs r1, #1
	negs r1, r1
	strb r1, [r0]
	bl ClearRounds
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802CBBC: .4byte gUnknown_0203A4D4
_0802CBC0: .4byte gUnknown_0203A4EC
_0802CBC4: .4byte gUnknown_0203A56C

	THUMB_FUNC_START sub_802CBC8
sub_802CBC8: @ 0x0802CBC8
	push {r4, lr}
	adds r1, r0, #0
	ldr r4, _0802CC14  @ gUnknown_0203A56C
	adds r0, r4, #0
	bl CopyUnitToBattleStruct
	adds r0, r4, #0
	bl BattleSetupTerrainData
	adds r0, r4, #0
	bl LoadRawDefense
	adds r0, r4, #0
	movs r1, #0
	bl BattleApplyMiscBonuses
	adds r0, r4, #0
	adds r0, #0x5a
	movs r2, #0
	movs r1, #0xff
	strh r1, [r0]
	adds r0, #0xa
	strh r1, [r0]
	adds r0, #6
	strh r1, [r0]
	subs r0, #0x20
	strh r2, [r0]
	adds r0, r4, #0
	bl sub_802C6EC
	ldr r0, _0802CC18  @ gUnknown_0203A4EC
	adds r0, #0x7e
	movs r1, #1
	strb r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802CC14: .4byte gUnknown_0203A56C
_0802CC18: .4byte gUnknown_0203A4EC

	THUMB_FUNC_START SaveInstigatorFromBattle
SaveInstigatorFromBattle: @ 0x0802CC1C
	push {r4, lr}
	ldr r4, _0802CC34  @ gUnknown_0203A4EC
	movs r0, #0xb
	ldrsb r0, [r4, r0]
	bl GetUnitStruct
	adds r1, r4, #0
	bl SaveUnitFromBattle
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802CC34: .4byte gUnknown_0203A4EC

	THUMB_FUNC_START SaveInstigatorWith10ExtraExp
SaveInstigatorWith10ExtraExp: @ 0x0802CC38
	push {r4, lr}
	adds r4, r0, #0
	bl InstigatorAdd10Exp
	ldr r0, _0802CC50  @ gUnknown_0859BAC4
	adds r1, r4, #0
	bl Proc_CreateBlockingChild
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802CC50: .4byte gUnknown_0859BAC4

	THUMB_FUNC_START sub_802CC54
sub_802CC54: @ 0x0802CC54
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r0, _0802CCD0  @ gUnknown_0203A608
	ldr r2, [r0]
	adds r2, #4
	str r2, [r0]
	ldrb r1, [r2, #2]
	movs r0, #7
	ands r0, r1
	movs r1, #0x80
	orrs r0, r1
	strb r0, [r2, #2]
	bl HandleSomeExp
	ldr r4, _0802CCD4  @ gUnknown_0203A4EC
	adds r0, r4, #0
	adds r0, #0x52
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0802CCC0
	adds r5, r4, #0
	adds r5, #0x48
	ldrh r0, [r5]
	bl GetItemAttributes
	movs r1, #4
	ands r1, r0
	cmp r1, #0
	beq _0802CC9A
	adds r1, r4, #0
	adds r1, #0x7d
	movs r0, #1
	strb r0, [r1]
_0802CC9A:
	ldrh r0, [r5]
	bl GetItemAfterUse
	strh r0, [r5]
	adds r1, r4, #0
	adds r1, #0x51
	ldrb r1, [r1]
	lsls r1, r1, #1
	adds r2, r4, #0
	adds r2, #0x1e
	adds r1, r1, r2
	strh r0, [r1]
	ldrh r0, [r5]
	cmp r0, #0
	beq _0802CCC0
	adds r1, r4, #0
	adds r1, #0x7d
	movs r0, #0
	strb r0, [r1]
_0802CCC0:
	ldr r0, _0802CCD8  @ gUnknown_0859BAC4
	adds r1, r6, #0
	bl Proc_CreateBlockingChild
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802CCD0: .4byte gUnknown_0203A608
_0802CCD4: .4byte gUnknown_0203A4EC
_0802CCD8: .4byte gUnknown_0859BAC4

	THUMB_FUNC_START GetStaffAccuracy
GetStaffAccuracy: @ 0x0802CCDC
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	bl GetUnitPower
	adds r4, r0, #0
	adds r0, r6, #0
	bl GetUnitResistance
	subs r4, r4, r0
	lsls r0, r4, #2
	adds r7, r0, r4
	adds r0, r5, #0
	bl GetUnitSkill
	adds r4, r0, #0
	movs r2, #0x10
	ldrsb r2, [r5, r2]
	movs r0, #0x10
	ldrsb r0, [r6, r0]
	subs r1, r2, r0
	cmp r1, #0
	bge _0802CD0C
	subs r1, r0, r2
_0802CD0C:
	movs r3, #0x11
	ldrsb r3, [r5, r3]
	movs r2, #0x11
	ldrsb r2, [r6, r2]
	subs r0, r3, r2
	cmp r0, #0
	bge _0802CD1C
	subs r0, r2, r3
_0802CD1C:
	adds r2, r1, r0
	ldr r0, [r5, #4]
	ldrb r0, [r0, #4]
	cmp r0, #0x66
	bne _0802CD2E
	adds r1, r7, r4
	lsls r0, r2, #1
	subs r1, r1, r0
	b _0802CD38
_0802CD2E:
	adds r0, r4, #0
	adds r0, #0x1e
	adds r0, r7, r0
	lsls r1, r2, #1
	subs r1, r0, r1
_0802CD38:
	ldr r0, [r6, #4]
	ldrb r0, [r0, #4]
	cmp r0, #0x66
	beq _0802CD4C
	ldr r0, [r6]
	ldrb r0, [r0, #4]
	cmp r0, #0x40
	beq _0802CD4C
	cmp r0, #0x6c
	bne _0802CD50
_0802CD4C:
	movs r0, #0
	b _0802CD5E
_0802CD50:
	cmp r1, #0
	bge _0802CD56
	movs r1, #0
_0802CD56:
	cmp r1, #0x64
	ble _0802CD5C
	movs r1, #0x64
_0802CD5C:
	adds r0, r1, #0
_0802CD5E:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_START sub_802CD64
sub_802CD64: @ 0x0802CD64
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r6, r0, #0
	ldr r0, _0802CE34  @ gUnknown_0203A8F0
	mov r9, r0
	ldr r1, [r0, #4]
	mov r8, r1
	ldr r0, _0802CE38  @ gUnknown_0202BCB0
	adds r0, #0x3c
	ldrb r0, [r0]
	str r0, [sp]
	ldr r7, _0802CE3C  @ gUnknown_0203A4D4
	movs r0, #0x21
	strh r0, [r7]
	ldr r5, _0802CE40  @ gUnknown_0203A4EC
	adds r0, r5, #0
	adds r1, r6, #0
	bl CopyUnitToBattleStruct
	ldr r4, _0802CE44  @ gUnknown_0203A56C
	adds r0, r4, #0
	mov r1, r8
	bl CopyUnitToBattleStruct
	ldr r0, _0802CE48  @ gUnknown_0203A958
	mov sl, r0
	ldrb r0, [r0, #0x15]
	cmp r0, #0
	beq _0802CDAE
	strb r0, [r4, #0x13]
	adds r1, r4, #0
	adds r1, #0x72
	strb r0, [r1]
_0802CDAE:
	mov r1, r9
	ldrb r0, [r1, #0xc]
	strb r0, [r7, #2]
	ldrb r1, [r5, #0x10]
	adds r0, r0, r1
	strb r0, [r4, #0x10]
	ldrb r0, [r5, #0x11]
	strb r0, [r4, #0x11]
	adds r0, r5, #0
	movs r1, #6
	bl SetupBattleWeaponData
	adds r0, r4, #0
	movs r1, #7
	bl SetupBattleWeaponData
	adds r0, r5, #0
	adds r1, r4, #0
	bl BattleApplyWeaponTriangle
	movs r0, #4
	mov r1, sl
	strb r0, [r1, #0x16]
	movs r0, #3
	bl SaveSuspendedGame
	adds r0, r5, #0
	bl BattleSetupTerrainData
	adds r0, r4, #0
	movs r1, #8
	bl WriteBattleStructTerrainBonuses
	adds r0, r6, #0
	mov r1, r8
	bl sub_802A398
	movs r0, #0x13
	ldrsb r0, [r4, r0]
	cmp r0, #0
	bne _0802CE04
	bl sub_802B92C
_0802CE04:
	adds r0, r6, #0
	adds r1, r5, #0
	bl sub_802C2D4
	ldr r0, [sp]
	cmp r0, #0
	beq _0802CE1A
	movs r0, #0x13
	ldrsb r0, [r4, r0]
	cmp r0, #0
	bne _0802CE62
_0802CE1A:
	bl sub_80A4AA4
	ldr r0, [r6, #0xc]
	ldr r2, _0802CE4C  @ 0xFFF1FFFF
	ands r2, r0
	lsrs r0, r0, #0x11
	movs r1, #7
	ands r0, r1
	adds r0, #1
	cmp r0, #7
	bhi _0802CE50
	lsls r0, r0, #0x11
	b _0802CE54
	.align 2, 0
_0802CE34: .4byte gUnknown_0203A8F0
_0802CE38: .4byte gUnknown_0202BCB0
_0802CE3C: .4byte gUnknown_0203A4D4
_0802CE40: .4byte gUnknown_0203A4EC
_0802CE44: .4byte gUnknown_0203A56C
_0802CE48: .4byte gUnknown_0203A958
_0802CE4C: .4byte 0xFFF1FFFF
_0802CE50:
	movs r0, #0xe0
	lsls r0, r0, #0xc
_0802CE54:
	adds r1, r2, r0
	str r1, [r6, #0xc]
	ldr r0, _0802CE7C  @ gUnknown_03003060
	lsrs r1, r1, #0x11
	movs r2, #7
	ands r1, r2
	strb r1, [r0]
_0802CE62:
	ldr r0, _0802CE80  @ gUnknown_0203A4EC
	ldr r1, _0802CE84  @ gUnknown_0203A56C
	bl nullsub_11
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802CE7C: .4byte gUnknown_03003060
_0802CE80: .4byte gUnknown_0203A4EC
_0802CE84: .4byte gUnknown_0203A56C

	THUMB_FUNC_START IsCurrentBattleTriangleAttack
IsCurrentBattleTriangleAttack: @ 0x0802CE88
	ldr r0, _0802CE98  @ gUnknown_0203A5EC
	ldr r0, [r0]
	lsls r0, r0, #0xd
	lsrs r0, r0, #0x17
	movs r1, #1
	ands r0, r1
	bx lr
	.align 2, 0
_0802CE98: .4byte gUnknown_0203A5EC

	THUMB_FUNC_START DidWeaponBreak
DidWeaponBreak: @ 0x0802CE9C
	push {lr}
	adds r1, r0, #0
	movs r0, #0x13
	ldrsb r0, [r1, r0]
	cmp r0, #0
	beq _0802CEB4
	adds r0, r1, #0
	adds r0, #0x7d
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	b _0802CEB6
_0802CEB4:
	movs r0, #0
_0802CEB6:
	pop {r1}
	bx r1

	THUMB_FUNC_START sub_802CEBC
sub_802CEBC: @ 0x0802CEBC
	ldr r1, _0802CEC4  @ gUnknown_0203A958
	str r0, [r1, #0x18]
	bx lr
	.align 2, 0
_0802CEC4: .4byte gUnknown_0203A958

	THUMB_FUNC_START CurrentRound_ComputeDamage
CurrentRound_ComputeDamage: @ 0x0802CEC8
	push {r4, lr}
	adds r4, r0, #0
	ldr r2, _0802CF0C  @ gUnknown_0203A4D4
	movs r0, #0
	strh r0, [r2, #4]
	ldr r0, _0802CF10  @ gUnknown_0203A608
	ldr r3, [r0]
	ldr r0, [r3]
	lsls r0, r0, #0xd
	lsrs r0, r0, #0xd
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	bne _0802CF44
	movs r0, #3
	ldrsb r0, [r3, r0]
	cmp r0, #0
	bne _0802CF14
	ldrh r0, [r2, #6]
	ldrh r1, [r2, #8]
	subs r0, r0, r1
	strh r0, [r2, #4]
	ldr r0, [r3]
	lsls r0, r0, #0xd
	lsrs r0, r0, #0xd
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0802CF1A
	movs r0, #4
	ldrsh r1, [r2, r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	b _0802CF18
	.align 2, 0
_0802CF0C: .4byte gUnknown_0203A4D4
_0802CF10: .4byte gUnknown_0203A608
_0802CF14:
	movs r0, #3
	ldrsb r0, [r3, r0]
_0802CF18:
	strh r0, [r2, #4]
_0802CF1A:
	adds r1, r2, #0
	movs r3, #4
	ldrsh r0, [r1, r3]
	cmp r0, #0x7f
	ble _0802CF28
	movs r0, #0x7f
	strh r0, [r1, #4]
_0802CF28:
	movs r3, #4
	ldrsh r0, [r1, r3]
	cmp r0, #0
	bge _0802CF34
	movs r0, #0
	strh r0, [r1, #4]
_0802CF34:
	movs r1, #4
	ldrsh r0, [r2, r1]
	cmp r0, #0
	beq _0802CF44
	adds r1, r4, #0
	adds r1, #0x7c
	movs r0, #1
	strb r0, [r1]
_0802CF44:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_START sub_802CF4C
sub_802CF4C: @ 0x0802CF4C
	push {r4, r5, r6, r7, lr}
	ldr r0, _0802CFA4  @ gUnknown_0203A958
	ldr r3, [r0, #0x18]
	ldr r4, _0802CFA8  @ gUnknown_0203A5EC
	ldr r2, [r3]
	lsls r0, r2, #8
	lsrs r0, r0, #0x1b
	movs r1, #0x10
	ands r0, r1
	adds r5, r4, #0
	ldr r6, _0802CFAC  @ gUnknown_0203A608
	cmp r0, #0
	bne _0802CF76
_0802CF66:
	stm r4!, {r2}
	adds r3, #4
	ldr r2, [r3]
	lsls r0, r2, #8
	lsrs r0, r0, #0x1b
	ands r0, r1
	cmp r0, #0
	beq _0802CF66
_0802CF76:
	ldr r0, [r3]
	str r0, [r4]
	str r5, [r6]
	ldr r0, [r5]
	lsls r0, r0, #8
	lsrs r0, r0, #0x1b
	movs r1, #0x10
	ands r0, r1
	cmp r0, #0
	beq _0802CF8C
	b _0802D0AC
_0802CF8C:
	movs r7, #7
_0802CF8E:
	ldr r0, [r6]
	ldr r0, [r0]
	lsls r0, r0, #8
	lsrs r0, r0, #0x1b
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	beq _0802CFB8
	ldr r4, _0802CFB0  @ gUnknown_0203A56C
	ldr r5, _0802CFB4  @ gUnknown_0203A4EC
	b _0802CFBC
	.align 2, 0
_0802CFA4: .4byte gUnknown_0203A958
_0802CFA8: .4byte gUnknown_0203A5EC
_0802CFAC: .4byte gUnknown_0203A608
_0802CFB0: .4byte gUnknown_0203A56C
_0802CFB4: .4byte gUnknown_0203A4EC
_0802CFB8:
	ldr r4, _0802D034  @ gUnknown_0203A4EC
	ldr r5, _0802D038  @ gUnknown_0203A56C
_0802CFBC:
	adds r0, r4, #0
	adds r1, r5, #0
	bl UpdateBattleStats
	adds r0, r4, #0
	bl CurrentRound_ComputeDamage
	adds r0, r4, #0
	adds r1, r5, #0
	bl CurrentRound_ComputeWeaponEffects
	movs r0, #0x13
	ldrsb r0, [r4, r0]
	cmp r0, #0
	beq _0802CFE2
	movs r0, #0x13
	ldrsb r0, [r5, r0]
	cmp r0, #0
	bne _0802D040
_0802CFE2:
	adds r1, r4, #0
	adds r1, #0x7b
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldr r5, _0802D03C  @ gUnknown_0203A608
	ldr r3, [r5]
	ldr r1, [r3]
	lsls r1, r1, #8
	lsrs r1, r1, #0x1b
	movs r0, #2
	orrs r1, r0
	lsls r1, r1, #3
	ldrb r2, [r3, #2]
	movs r4, #7
	adds r0, r4, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3, #2]
	ldr r0, _0802D038  @ gUnknown_0203A56C
	ldrb r0, [r0, #0x13]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _0802D02C
	ldr r3, [r5]
	ldr r1, [r3]
	lsls r1, r1, #8
	lsrs r1, r1, #0x1b
	movs r0, #4
	orrs r1, r0
	lsls r1, r1, #3
	ldrb r2, [r3, #2]
	adds r0, r4, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3, #2]
_0802D02C:
	ldr r2, [r5]
	ldrb r1, [r2, #6]
	adds r0, r4, #0
	b _0802D08C
	.align 2, 0
_0802D034: .4byte gUnknown_0203A4EC
_0802D038: .4byte gUnknown_0203A56C
_0802D03C: .4byte gUnknown_0203A608
_0802D040:
	adds r0, r5, #0
	adds r0, #0x30
	ldrb r0, [r0]
	movs r1, #0xf
	ands r1, r0
	cmp r1, #0xb
	beq _0802D064
	cmp r1, #0xd
	beq _0802D064
	adds r0, r5, #0
	adds r0, #0x6f
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0xb
	beq _0802D064
	cmp r0, #0xd
	bne _0802D096
_0802D064:
	adds r1, r4, #0
	adds r1, #0x7b
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldr r3, [r6]
	ldr r1, [r3]
	lsls r1, r1, #8
	lsrs r1, r1, #0x1b
	movs r0, #2
	orrs r1, r0
	lsls r1, r1, #3
	ldrb r2, [r3, #2]
	adds r0, r7, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3, #2]
	ldr r2, [r6]
	ldrb r1, [r2, #6]
	adds r0, r7, #0
_0802D08C:
	ands r0, r1
	movs r1, #0x80
	orrs r0, r1
	strb r0, [r2, #6]
	b _0802D0AC
_0802D096:
	ldr r1, [r6]
	adds r0, r1, #4
	str r0, [r6]
	ldr r0, [r1, #4]
	lsls r0, r0, #8
	lsrs r0, r0, #0x1b
	movs r1, #0x10
	ands r0, r1
	cmp r0, #0
	bne _0802D0AC
	b _0802CF8E
_0802D0AC:
	ldr r1, _0802D0B8  @ gUnknown_0203A958
	movs r0, #0
	str r0, [r1, #0x18]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802D0B8: .4byte gUnknown_0203A958

	THUMB_FUNC_START sub_802D0BC
sub_802D0BC: @ 0x0802D0BC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r4, r0, #0
	ldrb r1, [r4, #8]
	movs r0, #8
	ldrsb r0, [r4, r0]
	cmp r0, #0x14
	bne _0802D0D6
	b _0802D2A4
_0802D0D6:
	movs r0, #0
	strb r0, [r4, #9]
	adds r0, r1, #1
	strb r0, [r4, #8]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x14
	bne _0802D0EA
	movs r0, #0xff
	strb r0, [r4, #9]
_0802D0EA:
	ldr r0, [r4, #0xc]
	movs r1, #0x80
	lsls r1, r1, #6
	ands r0, r1
	movs r6, #0
	cmp r0, #0
	beq _0802D0FA
	movs r6, #5
_0802D0FA:
	ldr r0, [r4]
	ldrb r0, [r0, #0x1c]
	adds r0, r6, r0
	bl GetStatIncrease
	mov r8, r0
	ldr r0, [r4]
	ldrb r0, [r0, #0x1d]
	adds r0, r6, r0
	bl GetStatIncrease
	str r0, [sp]
	adds r5, r0, #0
	add r5, r8
	ldr r0, [r4]
	ldrb r0, [r0, #0x1e]
	adds r0, r6, r0
	bl GetStatIncrease
	str r0, [sp, #4]
	adds r5, r5, r0
	ldr r0, [r4]
	ldrb r0, [r0, #0x1f]
	adds r0, r6, r0
	bl GetStatIncrease
	mov sl, r0
	add r5, sl
	ldr r0, [r4]
	adds r0, #0x20
	ldrb r0, [r0]
	adds r0, r6, r0
	bl GetStatIncrease
	mov r9, r0
	add r5, r9
	ldr r0, [r4]
	adds r0, #0x21
	ldrb r0, [r0]
	adds r0, r6, r0
	bl GetStatIncrease
	adds r7, r0, #0
	adds r5, r5, r7
	ldr r0, [r4]
	adds r0, #0x22
	ldrb r0, [r0]
	adds r0, r6, r0
	bl GetStatIncrease
	adds r6, r0, #0
	adds r5, r5, r6
	cmp r5, #0
	bne _0802D1D6
	b _0802D1A8
_0802D168:
	ldr r0, [r4]
	ldrb r0, [r0, #0x1f]
	bl GetStatIncrease
	mov sl, r0
	cmp r0, #0
	bne _0802D1D6
	ldr r0, [r4]
	adds r0, #0x20
	ldrb r0, [r0]
	bl GetStatIncrease
	mov r9, r0
	cmp r0, #0
	bne _0802D1D6
	ldr r0, [r4]
	adds r0, #0x21
	ldrb r0, [r0]
	bl GetStatIncrease
	adds r7, r0, #0
	cmp r7, #0
	bne _0802D1D6
	ldr r0, [r4]
	adds r0, #0x22
	ldrb r0, [r0]
	bl GetStatIncrease
	adds r6, r0, #0
	cmp r6, #0
	bne _0802D1D6
	adds r5, #1
_0802D1A8:
	cmp r5, #1
	bgt _0802D1D6
	ldr r0, [r4]
	ldrb r0, [r0, #0x1c]
	bl GetStatIncrease
	mov r8, r0
	cmp r0, #0
	bne _0802D1D6
	ldr r0, [r4]
	ldrb r0, [r0, #0x1d]
	bl GetStatIncrease
	str r0, [sp]
	cmp r0, #0
	bne _0802D1D6
	ldr r0, [r4]
	ldrb r0, [r0, #0x1e]
	bl GetStatIncrease
	str r0, [sp, #4]
	cmp r0, #0
	beq _0802D168
_0802D1D6:
	movs r2, #0x12
	ldrsb r2, [r4, r2]
	mov r0, r8
	adds r3, r2, r0
	movs r1, #0xb
	ldrsb r1, [r4, r1]
	movs r0, #0xc0
	ands r0, r1
	cmp r0, #0x80
	bne _0802D1F0
	cmp r3, #0x78
	bgt _0802D1F4
	b _0802D206
_0802D1F0:
	cmp r3, #0x3c
	ble _0802D206
_0802D1F4:
	movs r0, #0xc0
	ands r0, r1
	cmp r0, #0x80
	bne _0802D200
	movs r0, #0x78
	b _0802D202
_0802D200:
	movs r0, #0x3c
_0802D202:
	subs r0, r0, r2
	mov r8, r0
_0802D206:
	movs r2, #0x14
	ldrsb r2, [r4, r2]
	ldr r1, [sp]
	adds r0, r2, r1
	ldr r3, [r4, #4]
	movs r1, #0x14
	ldrsb r1, [r3, r1]
	cmp r0, r1
	ble _0802D21C
	subs r1, r1, r2
	str r1, [sp]
_0802D21C:
	movs r2, #0x15
	ldrsb r2, [r4, r2]
	ldr r1, [sp, #4]
	adds r0, r2, r1
	movs r1, #0x15
	ldrsb r1, [r3, r1]
	cmp r0, r1
	ble _0802D230
	subs r1, r1, r2
	str r1, [sp, #4]
_0802D230:
	movs r2, #0x16
	ldrsb r2, [r4, r2]
	mov r1, sl
	adds r0, r2, r1
	movs r1, #0x16
	ldrsb r1, [r3, r1]
	cmp r0, r1
	ble _0802D244
	subs r1, r1, r2
	mov sl, r1
_0802D244:
	movs r2, #0x17
	ldrsb r2, [r4, r2]
	mov r1, r9
	adds r0, r2, r1
	movs r1, #0x17
	ldrsb r1, [r3, r1]
	cmp r0, r1
	ble _0802D258
	subs r1, r1, r2
	mov r9, r1
_0802D258:
	movs r2, #0x18
	ldrsb r2, [r4, r2]
	adds r0, r2, r7
	movs r1, #0x18
	ldrsb r1, [r3, r1]
	cmp r0, r1
	ble _0802D268
	subs r7, r1, r2
_0802D268:
	movs r1, #0x19
	ldrsb r1, [r4, r1]
	adds r0, r1, r6
	cmp r0, #0x1e
	ble _0802D276
	movs r0, #0x1e
	subs r6, r0, r1
_0802D276:
	ldrb r0, [r4, #0x12]
	add r0, r8
	strb r0, [r4, #0x12]
	ldrb r0, [r4, #0x14]
	ldr r1, [sp]
	adds r0, r0, r1
	strb r0, [r4, #0x14]
	ldrb r0, [r4, #0x15]
	ldr r1, [sp, #4]
	adds r0, r0, r1
	strb r0, [r4, #0x15]
	ldrb r0, [r4, #0x16]
	add r0, sl
	strb r0, [r4, #0x16]
	ldrb r0, [r4, #0x17]
	add r0, r9
	strb r0, [r4, #0x17]
	ldrb r0, [r4, #0x18]
	adds r0, r0, r7
	strb r0, [r4, #0x18]
	ldrb r0, [r4, #0x19]
	adds r0, r0, r6
	strb r0, [r4, #0x19]
_0802D2A4:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_START sub_802D2B4
sub_802D2B4: @ 0x0802D2B4
	ldr r1, _0802D2C0  @ gUnknown_0203A608
	ldr r0, [r1]
	adds r0, #4
	str r0, [r1]
	bx lr
	.align 2, 0
_0802D2C0: .4byte gUnknown_0203A608

	THUMB_FUNC_START sub_802D2C4
sub_802D2C4: @ 0x0802D2C4
	ldr r0, _0802D2DC  @ gUnknown_0203A608
	ldr r2, [r0]
	adds r2, #4
	str r2, [r0]
	ldrb r1, [r2, #2]
	movs r0, #7
	ands r0, r1
	movs r1, #0x80
	orrs r0, r1
	strb r0, [r2, #2]
	bx lr
	.align 2, 0
_0802D2DC: .4byte gUnknown_0203A608

.align 2, 0
