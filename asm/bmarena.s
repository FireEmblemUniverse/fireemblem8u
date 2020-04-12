	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	@ General Arena Logic

	THUMB_FUNC_START PrepareArenaStruct
PrepareArenaStruct: @ 0x08031794
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r5, _080317F8  @ gUnknown_0203A8F0
	str r4, [r5]
	ldr r0, _080317FC  @ gUnknown_0203A910
	str r0, [r5, #4]
	ldr r2, _08031800  @ gUnknown_03003060
	ldr r0, [r4, #0xc]
	lsrs r0, r0, #0x11
	movs r1, #7
	ands r0, r1
	strb r0, [r2]
	ldr r0, [r4, #4]
	ldrb r0, [r0, #4]
	strb r0, [r5, #0xf]
	adds r0, r4, #0
	bl GetUnitBestWRankType
	strb r0, [r5, #0xd]
	ldrb r0, [r5, #0xd]
	bl sub_803190C
	strb r0, [r5, #0x10]
	ldrb r0, [r5, #0x10]
	bl GetClassData
	bl GetClassBestWRankType
	strb r0, [r5, #0xe]
	ldrb r0, [r5, #0xd]
	bl IsWeaponMagic
	strb r0, [r5, #0x13]
	ldrb r0, [r5, #0xe]
	bl IsWeaponMagic
	strb r0, [r5, #0x14]
	ldrb r0, [r4, #8]
	strb r0, [r5, #0x11]
	ldr r0, [r4, #0xc]
	lsrs r0, r0, #0x11
	movs r1, #7
	ands r0, r1
	cmp r0, #4
	bhi _08031804
	ldrb r0, [r5, #0x11]
	bl GetNearLevel
	b _0803180C
	.align 2, 0
_080317F8: .4byte gUnknown_0203A8F0
_080317FC: .4byte gUnknown_0203A910
_08031800: .4byte gUnknown_03003060
_08031804:
	ldrb r0, [r5, #0x11]
	bl GetNearLevel
	adds r0, #7
_0803180C:
	strb r0, [r5, #0x12]
	bl LoadArenaOpponentStruct
	bl LoadArenaWeapons
	movs r4, #0
	b _0803181C
_0803181A:
	adds r4, #1
_0803181C:
	cmp r4, #9
	bgt _0803182A
	bl AdjustArenaOpponentPower
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0803181A
_0803182A:
	movs r4, #0
	b _08031830
_0803182E:
	adds r4, #1
_08031830:
	cmp r4, #4
	bgt _0803183E
	bl PrepareBalancedArenaFight
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0803182E
_0803183E:
	ldr r4, _08031870  @ gUnknown_0203A8F0
	ldr r0, [r4]
	movs r1, #0x14
	ldrsb r1, [r4, r1]
	bl GetUnitArenaWeight
	strh r0, [r4, #0x16]
	ldr r0, [r4, #4]
	movs r1, #0x13
	ldrsb r1, [r4, r1]
	bl GetUnitArenaWeight
	strh r0, [r4, #0x18]
	bl sub_8031EA0
	movs r0, #1
	strb r0, [r4, #0xb]
	movs r0, #0
	bl sub_8031EE4
	bl sub_8031FC8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08031870: .4byte gUnknown_0203A8F0

	THUMB_FUNC_END PrepareArenaStruct

	THUMB_FUNC_START PrepareArena
PrepareArena: @ 0x08031874
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0803188C  @ gUnknown_0203A95E
	bl StoreRNState
	adds r0, r4, #0
	bl PrepareArenaStruct
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0803188C: .4byte gUnknown_0203A95E

	THUMB_FUNC_END PrepareArena

	THUMB_FUNC_START PrepareArena2
PrepareArena2: @ 0x08031890
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _080318B0  @ gUnknown_0203A95E
	adds r0, r4, #0
	bl LoadRNState
	adds r0, r5, #0
	bl PrepareArenaStruct
	subs r4, #6
	adds r0, r4, #0
	bl LoadRNState
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080318B0: .4byte gUnknown_0203A95E

	THUMB_FUNC_END PrepareArena2

	THUMB_FUNC_START GetUnitBestWRankType
GetUnitBestWRankType: @ 0x080318B4
	push {r4, lr}
	movs r2, #0
	movs r3, #1
	negs r3, r3
	movs r1, #0
	adds r4, r0, #0
	adds r4, #0x28
_080318C2:
	cmp r1, #4
	beq _080318D2
	adds r0, r4, r1
	ldrb r0, [r0]
	cmp r2, r0
	bge _080318D2
	adds r2, r0, #0
	adds r3, r1, #0
_080318D2:
	adds r1, #1
	cmp r1, #7
	ble _080318C2
	adds r0, r3, #0
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END GetUnitBestWRankType

	THUMB_FUNC_START GetClassBestWRankType
GetClassBestWRankType: @ 0x080318E0
	push {r4, lr}
	movs r2, #0
	movs r3, #1
	negs r3, r3
	movs r1, #0
	adds r4, r0, #0
	adds r4, #0x2c
_080318EE:
	cmp r1, #4
	beq _080318FE
	adds r0, r4, r1
	ldrb r0, [r0]
	cmp r2, r0
	bge _080318FE
	adds r2, r0, #0
	adds r3, r1, #0
_080318FE:
	adds r1, #1
	cmp r1, #7
	ble _080318EE
	adds r0, r3, #0
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END GetClassBestWRankType

	THUMB_FUNC_START sub_803190C
sub_803190C: @ 0x0803190C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	movs r6, #0
	mov r8, r6
	cmp r0, #7
	bhi _08031960
	lsls r0, r0, #2
	ldr r1, _08031924  @ _08031928
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08031924: .4byte _08031928
_08031928: @ jump table
	.4byte _08031948 @ case 0
	.4byte _08031948 @ case 1
	.4byte _08031948 @ case 2
	.4byte _08031950 @ case 3
	.4byte _08031960 @ case 4
	.4byte _0803195C @ case 5
	.4byte _0803195C @ case 6
	.4byte _0803195C @ case 7
_08031948:
	ldr r0, _0803194C  @ gUnknown_0859D9FC
	b _0803195E
	.align 2, 0
_0803194C: .4byte gUnknown_0859D9FC
_08031950:
	ldr r1, _08031958  @ gUnknown_0859DA4A
	mov r8, r1
	b _08031960
	.align 2, 0
_08031958: .4byte gUnknown_0859DA4A
_0803195C:
	ldr r0, _080319A8  @ gUnknown_0859DA22
_0803195E:
	mov r8, r0
_08031960:
	ldr r0, _080319AC  @ gUnknown_0203A8F0
	ldr r0, [r0]
	ldr r1, [r0]
	ldr r0, [r0, #4]
	ldr r5, [r1, #0x28]
	ldr r0, [r0, #0x28]
	orrs r5, r0
	movs r0, #0x80
	lsls r0, r0, #1
	ands r5, r0
	mov r1, r8
	ldrb r0, [r1]
	cmp r0, #0
	beq _0803199A
	mov r4, r8
_0803197E:
	ldrb r0, [r4]
	bl GetClassData
	ldr r0, [r0, #0x28]
	movs r1, #0x80
	lsls r1, r1, #1
	ands r0, r1
	cmp r0, r5
	bne _08031992
	adds r6, #1
_08031992:
	adds r4, #1
	ldrb r0, [r4]
	cmp r0, #0
	bne _0803197E
_0803199A:
	adds r0, r6, #0
	bl NextRN_N
	adds r7, r0, #0
	movs r6, #0
	mov r4, r8
	b _080319B4
	.align 2, 0
_080319A8: .4byte gUnknown_0859DA22
_080319AC: .4byte gUnknown_0203A8F0
_080319B0:
	adds r6, #1
_080319B2:
	adds r4, #1
_080319B4:
	ldrb r0, [r4]
	bl GetClassData
	ldr r0, [r0, #0x28]
	movs r1, #0x80
	lsls r1, r1, #1
	ands r0, r1
	cmp r0, r5
	bne _080319B2
	cmp r6, r7
	bne _080319B0
	ldrb r0, [r4]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_803190C

	THUMB_FUNC_START IsWeaponMagic
IsWeaponMagic: @ 0x080319D8
	push {lr}
	adds r1, r0, #0
	cmp r1, #0
	blt _080319F2
	cmp r1, #3
	bgt _080319E8
	movs r0, #0
	b _080319F2
_080319E8:
	cmp r1, #7
	bgt _080319F2
	cmp r1, #5
	blt _080319F2
	movs r0, #1
_080319F2:
	pop {r1}
	bx r1

	THUMB_FUNC_END IsWeaponMagic

	THUMB_FUNC_START GetNearLevel
GetNearLevel: @ 0x080319F8
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #9
	bl NextRN_N
	adds r4, r4, r0
	subs r0, r4, #4
	cmp r0, #0
	bgt _08031A0C
	movs r0, #1
_08031A0C:
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END GetNearLevel

	THUMB_FUNC_START GetUnitArenaWeight
GetUnitArenaWeight: @ 0x08031A14
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r5, #0x12
	ldrsb r5, [r4, r5]
	movs r0, #0x14
	ldrsb r0, [r4, r0]
	adds r0, r0, r5
	movs r2, #0x15
	ldrsb r2, [r4, r2]
	adds r2, r2, r0
	movs r0, #0x16
	ldrsb r0, [r4, r0]
	adds r0, r0, r2
	lsls r5, r0, #1
	movs r0, #0x19
	ldrsb r0, [r4, r0]
	adds r5, r5, r0
	ldr r0, [r4, #4]
	ldrb r0, [r0, #0x11]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldr r2, [r4]
	ldrb r2, [r2, #0x13]
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	adds r0, r0, r2
	adds r5, r5, r0
	lsls r1, r1, #0x18
	cmp r1, #0
	beq _08031A58
	adds r0, r4, #0
	bl GetUnitResistance
	b _08031A5E
_08031A58:
	adds r0, r4, #0
	bl GetUnitDefense
_08031A5E:
	lsls r0, r0, #1
	adds r5, r5, r0
	ldr r0, [r4]
	ldr r1, [r4, #4]
	ldr r0, [r0, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08031A7C
	adds r0, r4, #0
	bl GetUnitPower
	adds r5, r5, r0
_08031A7C:
	adds r0, r5, #0
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END GetUnitArenaWeight

	THUMB_FUNC_START LoadArenaOpponentStruct
LoadArenaOpponentStruct: @ 0x08031A84
	push {r4, r5, r6, lr}
	sub sp, #0x14
	ldr r6, _08031B00  @ gUnknown_0203A910
	mov r1, sp
	movs r3, #0
	movs r0, #0xfd
	strb r0, [r1]
	ldr r4, _08031B04  @ gUnknown_0203A8F0
	ldrb r0, [r4, #0x10]
	strb r0, [r1, #1]
	ldrb r0, [r1, #3]
	movs r2, #7
	negs r2, r2
	ands r2, r0
	strb r2, [r1, #3]
	mov r5, sp
	ldrb r1, [r4, #0x12]
	lsls r1, r1, #3
	movs r0, #7
	ands r0, r2
	orrs r0, r1
	strb r0, [r5, #3]
	mov r2, sp
	movs r1, #1
	orrs r0, r1
	strb r0, [r2, #3]
	mov r0, sp
	strb r3, [r0, #0xc]
	strb r3, [r0, #0xd]
	strb r3, [r0, #0xe]
	strb r3, [r0, #0xf]
	strb r3, [r0, #0x10]
	strb r3, [r0, #0x10]
	strb r3, [r0, #0x11]
	strb r3, [r0, #0x12]
	strb r3, [r0, #0x13]
	adds r0, r6, #0
	bl ClearUnit
	movs r0, #0x80
	strb r0, [r6, #0xb]
	adds r0, r6, #0
	mov r1, sp
	bl UnitInitFromDefinition
	ldr r1, [r6]
	adds r0, r6, #0
	bl UnitLoadStatsFromChracter
	movs r4, #8
	ldrsb r4, [r6, r4]
	ldr r0, _08031B08  @ gRAMChapterData
	ldrb r1, [r0, #0x14]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08031B0C
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #3
	b _08031B12
	.align 2, 0
_08031B00: .4byte gUnknown_0203A910
_08031B04: .4byte gUnknown_0203A8F0
_08031B08: .4byte gRAMChapterData
_08031B0C:
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #2
_08031B12:
	movs r1, #0xa
	bl __divsi3
	strb r0, [r6, #8]
	adds r0, r6, #0
	bl UnitAutolevel
	strb r4, [r6, #8]
	movs r2, #0
	adds r3, r6, #0
	adds r3, #0x28
	movs r4, #0xb5
_08031B2A:
	adds r1, r3, r2
	ldrb r0, [r1]
	cmp r0, #0
	beq _08031B34
	strb r4, [r1]
_08031B34:
	adds r2, #1
	cmp r2, #7
	ble _08031B2A
	movs r0, #8
	ldrsb r0, [r6, r0]
	cmp r0, #0
	bgt _08031B46
	movs r0, #1
	strb r0, [r6, #8]
_08031B46:
	movs r0, #8
	ldrsb r0, [r6, r0]
	cmp r0, #0x14
	ble _08031B52
	movs r0, #0x14
	strb r0, [r6, #8]
_08031B52:
	adds r0, r6, #0
	bl UnitCheckStatCaps
	adds r0, r6, #0
	bl GetUnitMaxHp
	adds r1, r0, #0
	adds r0, r6, #0
	bl SetUnitHp
	add sp, #0x14
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END LoadArenaOpponentStruct

	THUMB_FUNC_START LoadArenaWeapons
LoadArenaWeapons: @ 0x08031B70
	push {r4, lr}
	sub sp, #8
	ldr r1, _08031BB8  @ gUnknown_080D7F5C
	mov r0, sp
	movs r2, #8
	bl memcpy
	ldr r4, _08031BBC  @ gUnknown_0203A8F0
	ldrb r0, [r4, #0xd]
	add r0, sp
	ldrb r0, [r0]
	bl MakeNewItem
	strh r0, [r4, #0x1a]
	ldrb r0, [r4, #0xe]
	add r0, sp
	ldrb r0, [r0]
	bl MakeNewItem
	strh r0, [r4, #0x1c]
	movs r0, #1
	strb r0, [r4, #0xc]
	ldrb r0, [r4, #0xd]
	cmp r0, #3
	bne _08031BA6
	movs r0, #2
	strb r0, [r4, #0xc]
_08031BA6:
	ldrb r0, [r4, #0xe]
	cmp r0, #3
	bne _08031BB0
	movs r0, #2
	strb r0, [r4, #0xc]
_08031BB0:
	add sp, #8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08031BB8: .4byte gUnknown_080D7F5C
_08031BBC: .4byte gUnknown_0203A8F0

	THUMB_FUNC_END LoadArenaWeapons

	THUMB_FUNC_START GetArenaBetterItem
GetArenaBetterItem: @ 0x08031BC0
	push {r4, r5, lr}
	sub sp, #0x1c
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	ldr r1, _08031BD8  @ gUnknown_080D7F64
	mov r0, sp
	movs r2, #0x1a
	bl memcpy
	mov r4, sp
	b _08031C02
	.align 2, 0
_08031BD8: .4byte gUnknown_080D7F64
_08031BDC:
	adds r0, r5, #0
	bl GetItemIndex
	adds r1, r0, #0
	ldrb r2, [r4]
	cmp r1, r2
	bne _08031C00
	adds r4, #1
	ldrb r0, [r4]
	cmp r0, #0
	beq _08031BFC
	bl MakeNewItem
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	b _08031C08
_08031BFC:
	adds r0, r5, #0
	b _08031C08
_08031C00:
	adds r4, #1
_08031C02:
	ldrb r1, [r4]
	cmp r1, #0xff
	bne _08031BDC
_08031C08:
	add sp, #0x1c
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END GetArenaBetterItem

	THUMB_FUNC_START PrepareBalancedArenaFight
PrepareBalancedArenaFight: @ 0x08031C10
	push {r4, r5, r6, lr}
	movs r6, #0
	ldr r4, _08031C38  @ gUnknown_0203A8F0
	ldr r0, [r4]
	bl GetUnitPower
	ldr r5, _08031C3C  @ gBattleActor
	adds r0, #5
	adds r1, r5, #0
	adds r1, #0x5a
	strh r0, [r1]
	movs r0, #0x14
	ldrsb r0, [r4, r0]
	cmp r0, #0
	beq _08031C40
	ldr r0, [r4]
	bl GetUnitResistance
	b _08031C46
	.align 2, 0
_08031C38: .4byte gUnknown_0203A8F0
_08031C3C: .4byte gBattleActor
_08031C40:
	ldr r0, [r4]
	bl GetUnitDefense
_08031C46:
	adds r1, r5, #0
	adds r1, #0x5c
	strh r0, [r1]
	ldr r4, _08031C70  @ gUnknown_0203A8F0
	ldr r0, [r4, #4]
	bl GetUnitPower
	ldr r5, _08031C74  @ gBattleTarget
	adds r0, #5
	adds r1, r5, #0
	adds r1, #0x5a
	strh r0, [r1]
	movs r0, #0x13
	ldrsb r0, [r4, r0]
	cmp r0, #0
	beq _08031C78
	ldr r0, [r4, #4]
	bl GetUnitResistance
	b _08031C7E
	.align 2, 0
_08031C70: .4byte gUnknown_0203A8F0
_08031C74: .4byte gBattleTarget
_08031C78:
	ldr r0, [r4, #4]
	bl GetUnitDefense
_08031C7E:
	adds r1, r5, #0
	adds r1, #0x5c
	strh r0, [r1]
	ldr r0, _08031CCC  @ gBattleActor
	adds r0, #0x5a
	movs r1, #0
	ldrsh r4, [r0, r1]
	ldr r0, _08031CD0  @ gBattleTarget
	adds r0, #0x5c
	movs r1, #0
	ldrsh r0, [r0, r1]
	subs r4, r4, r0
	ldr r5, _08031CD4  @ gUnknown_0203A8F0
	ldr r0, [r5, #4]
	bl GetUnitMaxHp
	movs r1, #6
	bl __divsi3
	cmp r4, r0
	bge _08031CFE
	movs r6, #1
	movs r2, #0x13
	ldrsb r2, [r5, r2]
	cmp r2, #0
	beq _08031CD8
	ldr r0, [r5, #4]
	ldrb r1, [r0, #0x18]
	subs r1, #4
	strb r1, [r0, #0x18]
	ldr r1, [r5, #4]
	movs r0, #0x18
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bge _08031CEC
	movs r0, #0
	strb r0, [r1, #0x18]
	b _08031CEC
	.align 2, 0
_08031CCC: .4byte gBattleActor
_08031CD0: .4byte gBattleTarget
_08031CD4: .4byte gUnknown_0203A8F0
_08031CD8:
	ldr r0, [r5, #4]
	ldrb r1, [r0, #0x17]
	subs r1, #4
	strb r1, [r0, #0x17]
	ldr r1, [r5, #4]
	movs r0, #0x17
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bge _08031CEC
	strb r2, [r1, #0x17]
_08031CEC:
	ldr r2, _08031D4C  @ gUnknown_0203A8F0
	ldr r1, [r2, #4]
	ldrb r0, [r1, #0x16]
	adds r0, #1
	strb r0, [r1, #0x16]
	ldr r1, [r2, #4]
	ldrb r0, [r1, #0x15]
	adds r0, #1
	strb r0, [r1, #0x15]
_08031CFE:
	ldr r0, _08031D50  @ gBattleTarget
	adds r0, #0x5a
	movs r1, #0
	ldrsh r4, [r0, r1]
	ldr r0, _08031D54  @ gBattleActor
	adds r0, #0x5c
	movs r1, #0
	ldrsh r0, [r0, r1]
	subs r4, r4, r0
	ldr r5, _08031D4C  @ gUnknown_0203A8F0
	ldr r0, [r5]
	bl GetUnitMaxHp
	movs r1, #6
	bl __divsi3
	cmp r4, r0
	bge _08031D44
	movs r6, #1
	ldr r1, [r5, #4]
	ldrb r0, [r1, #0x14]
	adds r0, #3
	strb r0, [r1, #0x14]
	ldr r1, [r5, #4]
	ldrb r0, [r1, #0x16]
	adds r0, #2
	strb r0, [r1, #0x16]
	ldr r1, [r5, #4]
	ldrb r0, [r1, #0x15]
	adds r0, #2
	strb r0, [r1, #0x15]
	ldrh r0, [r5, #0x1c]
	bl GetArenaBetterItem
	strh r0, [r5, #0x1c]
_08031D44:
	adds r0, r6, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08031D4C: .4byte gUnknown_0203A8F0
_08031D50: .4byte gBattleTarget
_08031D54: .4byte gBattleActor

	THUMB_FUNC_END PrepareBalancedArenaFight

	THUMB_FUNC_START AdjustArenaOpponentPower
AdjustArenaOpponentPower: @ 0x08031D58
	push {r4, r5, r6, lr}
	ldr r4, _08031DA0  @ gUnknown_0203A8F0
	ldr r0, [r4]
	movs r1, #0x14
	ldrsb r1, [r4, r1]
	bl GetUnitArenaWeight
	strh r0, [r4, #0x16]
	ldr r0, [r4, #4]
	movs r1, #0x13
	ldrsb r1, [r4, r1]
	bl GetUnitArenaWeight
	strh r0, [r4, #0x18]
	ldrh r1, [r4, #0x16]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r1, r0
	bhi _08031D80
	ldrh r1, [r4, #0x18]
_08031D80:
	ldr r6, _08031DA0  @ gUnknown_0203A8F0
	ldrh r4, [r6, #0x16]
	ldrh r5, [r6, #0x18]
	subs r2, r4, r5
	cmp r2, #0
	bge _08031D8E
	subs r2, r5, r4
_08031D8E:
	movs r0, #0x64
	muls r0, r2, r0
	bl __divsi3
	cmp r0, #0x14
	bgt _08031DA4
	movs r0, #0
	b _08031E9A
	.align 2, 0
_08031DA0: .4byte gUnknown_0203A8F0
_08031DA4:
	cmp r4, r5
	bcs _08031E20
	ldr r1, [r6, #4]
	ldrb r2, [r1, #0x12]
	movs r0, #0x12
	ldrsb r0, [r1, r0]
	cmp r0, #0
	beq _08031DC0
	subs r0, r2, #1
	strb r0, [r1, #0x12]
	ldr r1, [r6, #4]
	ldrb r0, [r1, #0x13]
	subs r0, #1
	strb r0, [r1, #0x13]
_08031DC0:
	ldr r1, [r6, #4]
	ldrb r2, [r1, #0x14]
	movs r0, #0x14
	ldrsb r0, [r1, r0]
	cmp r0, #0
	beq _08031DD0
	subs r0, r2, #1
	strb r0, [r1, #0x14]
_08031DD0:
	ldr r1, [r6, #4]
	ldrb r2, [r1, #0x15]
	movs r0, #0x15
	ldrsb r0, [r1, r0]
	cmp r0, #0
	beq _08031DE0
	subs r0, r2, #1
	strb r0, [r1, #0x15]
_08031DE0:
	ldr r1, [r6, #4]
	ldrb r2, [r1, #0x16]
	movs r0, #0x16
	ldrsb r0, [r1, r0]
	cmp r0, #0
	beq _08031DF0
	subs r0, r2, #1
	strb r0, [r1, #0x16]
_08031DF0:
	ldr r1, [r6, #4]
	ldrb r2, [r1, #0x17]
	movs r0, #0x17
	ldrsb r0, [r1, r0]
	cmp r0, #0
	beq _08031E00
	subs r0, r2, #1
	strb r0, [r1, #0x17]
_08031E00:
	ldr r1, [r6, #4]
	ldrb r2, [r1, #0x18]
	movs r0, #0x18
	ldrsb r0, [r1, r0]
	cmp r0, #0
	beq _08031E10
	subs r0, r2, #1
	strb r0, [r1, #0x18]
_08031E10:
	ldr r1, [r6, #4]
	ldrb r2, [r1, #0x19]
	movs r0, #0x19
	ldrsb r0, [r1, r0]
	cmp r0, #0
	beq _08031E98
	subs r0, r2, #1
	b _08031E96
_08031E20:
	ldr r1, [r6, #4]
	ldrb r2, [r1, #0x12]
	movs r0, #0x12
	ldrsb r0, [r1, r0]
	cmp r0, #0x4f
	bgt _08031E38
	adds r0, r2, #2
	strb r0, [r1, #0x12]
	ldr r1, [r6, #4]
	ldrb r0, [r1, #0x13]
	adds r0, #2
	strb r0, [r1, #0x13]
_08031E38:
	ldr r1, [r6, #4]
	ldrb r2, [r1, #0x14]
	movs r0, #0x14
	ldrsb r0, [r1, r0]
	cmp r0, #0x1d
	bgt _08031E48
	adds r0, r2, #1
	strb r0, [r1, #0x14]
_08031E48:
	ldr r1, [r6, #4]
	ldrb r2, [r1, #0x15]
	movs r0, #0x15
	ldrsb r0, [r1, r0]
	cmp r0, #0x1d
	bgt _08031E58
	adds r0, r2, #1
	strb r0, [r1, #0x15]
_08031E58:
	ldr r1, [r6, #4]
	ldrb r2, [r1, #0x16]
	movs r0, #0x16
	ldrsb r0, [r1, r0]
	cmp r0, #0x1d
	bgt _08031E68
	adds r0, r2, #1
	strb r0, [r1, #0x16]
_08031E68:
	ldr r1, [r6, #4]
	ldrb r2, [r1, #0x17]
	movs r0, #0x17
	ldrsb r0, [r1, r0]
	cmp r0, #0x1d
	bgt _08031E78
	adds r0, r2, #1
	strb r0, [r1, #0x17]
_08031E78:
	ldr r1, [r6, #4]
	ldrb r2, [r1, #0x18]
	movs r0, #0x18
	ldrsb r0, [r1, r0]
	cmp r0, #0x1d
	bgt _08031E88
	adds r0, r2, #1
	strb r0, [r1, #0x18]
_08031E88:
	ldr r1, [r6, #4]
	ldrb r2, [r1, #0x19]
	movs r0, #0x19
	ldrsb r0, [r1, r0]
	cmp r0, #0x1d
	bgt _08031E98
	adds r0, r2, #1
_08031E96:
	strb r0, [r1, #0x19]
_08031E98:
	movs r0, #1
_08031E9A:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	THUMB_FUNC_END AdjustArenaOpponentPower

	THUMB_FUNC_START sub_8031EA0
sub_8031EA0: @ 0x08031EA0
	push {lr}
	ldr r2, _08031EC8  @ gUnknown_0203A8F0
	ldrh r1, [r2, #0x18]
	ldrh r0, [r2, #0x16]
	subs r0, r1, r0
	lsrs r1, r0, #0x1f
	adds r1, r0, r1
	asrs r1, r1, #1
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #1
	movs r1, #0xc8
	lsls r1, r1, #2
	adds r0, r0, r1
	cmp r0, #0
	bgt _08031EC2
	movs r0, #1
_08031EC2:
	strh r0, [r2, #8]
	pop {r0}
	bx r0
	.align 2, 0
_08031EC8: .4byte gUnknown_0203A8F0

	THUMB_FUNC_END sub_8031EA0

	THUMB_FUNC_START sub_8031ECC
sub_8031ECC: @ 0x08031ECC
	ldr r0, _08031ED4  @ gUnknown_0203A8F0
	movs r1, #8
	ldrsh r0, [r0, r1]
	bx lr
	.align 2, 0
_08031ED4: .4byte gUnknown_0203A8F0

	THUMB_FUNC_END sub_8031ECC

	THUMB_FUNC_START sub_8031ED8
sub_8031ED8: @ 0x08031ED8
	ldr r0, _08031EE0  @ gUnknown_0203A8F0
	ldrb r0, [r0, #0xa]
	bx lr
	.align 2, 0
_08031EE0: .4byte gUnknown_0203A8F0

	THUMB_FUNC_END sub_8031ED8

	THUMB_FUNC_START sub_8031EE4
sub_8031EE4: @ 0x08031EE4
	ldr r1, _08031EEC  @ gUnknown_0203A8F0
	strb r0, [r1, #0xa]
	bx lr
	.align 2, 0
_08031EEC: .4byte gUnknown_0203A8F0

	THUMB_FUNC_END sub_8031EE4

	THUMB_FUNC_START sub_8031EF0
sub_8031EF0: @ 0x08031EF0
	push {r4, r5, lr}
	ldr r0, _08031F3C  @ gUnknown_0202BCB0
	adds r0, #0x3c
	ldrb r5, [r0]
	ldr r1, _08031F40  @ gActionData
	ldr r4, _08031F44  @ gBattleTarget
	ldrb r0, [r4, #0x13]
	strb r0, [r1, #0x15]
	movs r0, #4
	strb r0, [r1, #0x16]
	movs r0, #3
	bl SaveSuspendedGame
	bl BattleUnwind
	movs r0, #0x13
	ldrsb r0, [r4, r0]
	cmp r0, #0
	bne _08031F1A
	bl BattleApplyExpGains
_08031F1A:
	ldr r0, _08031F48  @ gUnknown_0203A8F0
	ldr r0, [r0]
	ldr r1, _08031F4C  @ gBattleActor
	bl UpdateUnitDuringBattle
	cmp r5, #0
	beq _08031F30
	movs r0, #0x13
	ldrsb r0, [r4, r0]
	cmp r0, #0
	bne _08031F34
_08031F30:
	bl sub_80A4AA4
_08031F34:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08031F3C: .4byte gUnknown_0202BCB0
_08031F40: .4byte gActionData
_08031F44: .4byte gBattleTarget
_08031F48: .4byte gUnknown_0203A8F0
_08031F4C: .4byte gBattleActor

	THUMB_FUNC_END sub_8031EF0

	THUMB_FUNC_START sub_8031F50
sub_8031F50: @ 0x08031F50
	push {lr}
	adds r2, r0, #0
	adds r0, #0x30
	ldrb r1, [r0]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #3
	beq _08031F6E
	adds r0, r2, #0
	bl GetUnitBestWRankType
	cmp r0, #0
	blt _08031F6E
	movs r0, #1
	b _08031F70
_08031F6E:
	movs r0, #0
_08031F70:
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8031F50

	THUMB_FUNC_START sub_8031F74
sub_8031F74: @ 0x08031F74
	push {r4, r5, lr}
	sub sp, #8
	adds r5, r0, #0
	adds r4, r1, #0
	ldr r1, _08031FB4  @ gUnknown_080D7F5C
	mov r0, sp
	movs r2, #8
	bl memcpy
	ldrh r1, [r4]
	adds r0, r5, #0
	bl CanUnitUseWeapon
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08031FBE
	movs r1, #0
	ldr r2, [r5, #4]
_08031F98:
	adds r0, r2, #0
	adds r0, #0x2c
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _08031FB8
	mov r2, sp
	adds r0, r2, r1
	ldrb r0, [r0]
	bl MakeNewItem
	strh r0, [r4]
	b _08031FBE
	.align 2, 0
_08031FB4: .4byte gUnknown_080D7F5C
_08031FB8:
	adds r1, #1
	cmp r1, #7
	ble _08031F98
_08031FBE:
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8031F74

	THUMB_FUNC_START sub_8031FC8
sub_8031FC8: @ 0x08031FC8
	push {r4, lr}
	ldr r4, _08031FE8  @ gUnknown_0203A8F0
	ldr r0, [r4]
	adds r1, r4, #0
	adds r1, #0x1a
	bl sub_8031F74
	ldr r0, [r4, #4]
	adds r4, #0x1c
	adds r1, r4, #0
	bl sub_8031F74
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08031FE8: .4byte gUnknown_0203A8F0

	THUMB_FUNC_END sub_8031FC8

.align 2, 0
