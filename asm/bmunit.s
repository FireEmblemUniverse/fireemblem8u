	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	THUMB_FUNC_START GetUnitCurrentHP
GetUnitCurrentHP: @ 0x08019150
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r4, #0x13
	ldrsb r4, [r5, r4]
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl GetItemHpBonus
	movs r1, #0x12
	ldrsb r1, [r5, r1]
	adds r1, r1, r0
	cmp r4, r1
	ble _08019184
	adds r0, r5, #0
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl GetItemHpBonus
	movs r1, #0x12
	ldrsb r1, [r5, r1]
	adds r1, r1, r0
	strb r1, [r5, #0x13]
_08019184:
	movs r0, #0x13
	ldrsb r0, [r5, r0]
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_START GetUnitMaxHP
GetUnitMaxHP: @ 0x08019190
	push {r4, lr}
	adds r4, r0, #0
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl GetItemHpBonus
	adds r1, r0, #0
	movs r0, #0x12
	ldrsb r0, [r4, r0]
	adds r0, r0, r1
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_START GetUnitPower
GetUnitPower: @ 0x080191B0
	push {r4, lr}
	adds r4, r0, #0
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl GetItemPowBonus
	adds r1, r0, #0
	movs r0, #0x14
	ldrsb r0, [r4, r0]
	adds r0, r0, r1
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_START GetUnitSkill
GetUnitSkill: @ 0x080191D0
	push {r4, lr}
	adds r4, r0, #0
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	ldr r0, [r4, #0xc]
	movs r1, #0x10
	ands r0, r1
	cmp r0, #0
	bne _080191F4
	adds r0, r2, #0
	bl GetItemSklBonus
	adds r1, r0, #0
	movs r0, #0x15
	ldrsb r0, [r4, r0]
	b _08019206
_080191F4:
	adds r0, r2, #0
	bl GetItemSklBonus
	adds r1, r0, #0
	movs r0, #0x15
	ldrsb r0, [r4, r0]
	lsrs r2, r0, #0x1f
	adds r0, r0, r2
	asrs r0, r0, #1
_08019206:
	adds r0, r0, r1
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_START GetUnitSpeed
GetUnitSpeed: @ 0x08019210
	push {r4, lr}
	adds r4, r0, #0
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	ldr r0, [r4, #0xc]
	movs r1, #0x10
	ands r0, r1
	cmp r0, #0
	bne _08019234
	adds r0, r2, #0
	bl GetItemSpdBonus
	adds r1, r0, #0
	movs r0, #0x16
	ldrsb r0, [r4, r0]
	b _08019246
_08019234:
	adds r0, r2, #0
	bl GetItemSpdBonus
	adds r1, r0, #0
	movs r0, #0x16
	ldrsb r0, [r4, r0]
	lsrs r2, r0, #0x1f
	adds r0, r0, r2
	asrs r0, r0, #1
_08019246:
	adds r0, r0, r1
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_START GetUnitDefense
GetUnitDefense: @ 0x08019250
	push {r4, lr}
	adds r4, r0, #0
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl GetItemDefBonus
	adds r1, r0, #0
	movs r0, #0x17
	ldrsb r0, [r4, r0]
	adds r0, r0, r1
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_START GetUnitResistance
GetUnitResistance: @ 0x08019270
	push {r4, lr}
	adds r4, r0, #0
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl GetItemResBonus
	adds r1, r0, #0
	movs r0, #0x18
	ldrsb r0, [r4, r0]
	adds r0, r0, r1
	adds r4, #0x31
	ldrb r1, [r4]
	lsrs r1, r1, #4
	adds r0, r0, r1
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_START GetUnitLuck
GetUnitLuck: @ 0x08019298
	push {r4, lr}
	adds r4, r0, #0
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl GetItemLckBonus
	adds r1, r0, #0
	movs r0, #0x19
	ldrsb r0, [r4, r0]
	adds r0, r0, r1
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_START GetUnitPortraitId
GetUnitPortraitId: @ 0x080192B8
	push {lr}
	adds r1, r0, #0
	ldr r0, [r1]
	ldrh r2, [r0, #6]
	cmp r2, #0
	beq _080192E2
	ldr r0, _080192D8  @ gUnknown_0202BCF0
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x22
	bne _080192DC
	cmp r2, #0x4a
	bne _080192DC
	movs r0, #0x46
	b _080192F0
	.align 2, 0
_080192D8: .4byte gUnknown_0202BCF0
_080192DC:
	ldr r0, [r1]
	ldrh r0, [r0, #6]
	b _080192F0
_080192E2:
	ldr r1, [r1, #4]
	ldrh r0, [r1, #8]
	cmp r0, #0
	bne _080192EE
	movs r0, #0
	b _080192F0
_080192EE:
	ldrh r0, [r1, #8]
_080192F0:
	pop {r1}
	bx r1

	THUMB_FUNC_START GetUnitMiniPortraitId
GetUnitMiniPortraitId: @ 0x080192F4
	push {lr}
	adds r2, r0, #0
	ldr r1, [r2]
	ldrb r0, [r1, #8]
	cmp r0, #0
	beq _08019308
	movs r1, #0xfe
	lsls r1, r1, #7
	adds r0, r0, r1
	b _0801933C
_08019308:
	ldrh r1, [r1, #6]
	cmp r1, #0
	beq _0801932E
	ldr r0, _08019324  @ gUnknown_0202BCF0
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x22
	bne _08019328
	cmp r1, #0x4a
	bne _08019328
	movs r1, #0x46
	b _0801933A
	.align 2, 0
_08019324: .4byte gUnknown_0202BCF0
_08019328:
	ldr r0, [r2]
	ldrh r1, [r0, #6]
	b _0801933A
_0801932E:
	ldr r2, [r2, #4]
	ldrh r0, [r2, #8]
	movs r1, #0
	cmp r0, #0
	beq _0801933A
	adds r1, r0, #0
_0801933A:
	adds r0, r1, #0
_0801933C:
	pop {r1}
	bx r1

	THUMB_FUNC_START GetUnitLeader
GetUnitLeader: @ 0x08019340
	push {lr}
	adds r2, r0, #0
	movs r0, #0xb
	ldrsb r0, [r2, r0]
	movs r1, #0xc0
	ands r0, r1
	cmp r0, #0
	beq _08019358
	adds r0, r2, #0
	adds r0, #0x38
	ldrb r0, [r0]
	b _0801935A
_08019358:
	movs r0, #0
_0801935A:
	pop {r1}
	bx r1

	THUMB_FUNC_START sub_8019360
sub_8019360: @ 0x08019360
	adds r0, #0x38
	strb r1, [r0]
	bx lr

	THUMB_FUNC_START SetUnitHP
SetUnitHP: @ 0x08019368
	push {r4, r5, lr}
	adds r5, r0, #0
	strb r1, [r5, #0x13]
	movs r4, #0x13
	ldrsb r4, [r5, r4]
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl GetItemHpBonus
	movs r1, #0x12
	ldrsb r1, [r5, r1]
	adds r1, r1, r0
	cmp r4, r1
	ble _0801939E
	adds r0, r5, #0
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl GetItemHpBonus
	movs r1, #0x12
	ldrsb r1, [r5, r1]
	adds r1, r1, r0
	strb r1, [r5, #0x13]
_0801939E:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_START UnitTryHeal
UnitTryHeal: @ 0x080193A4
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r4, #0x13
	ldrsb r4, [r5, r4]
	adds r4, r4, r1
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl GetItemHpBonus
	movs r1, #0x12
	ldrsb r1, [r5, r1]
	adds r1, r1, r0
	cmp r4, r1
	ble _080193D8
	adds r0, r5, #0
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl GetItemHpBonus
	movs r1, #0x12
	ldrsb r1, [r5, r1]
	adds r4, r1, r0
_080193D8:
	cmp r4, #0
	bge _080193DE
	movs r4, #0
_080193DE:
	strb r4, [r5, #0x13]
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_START GetRescuingUnitNameId
GetRescuingUnitNameId: @ 0x080193E8
	push {lr}
	adds r2, r0, #0
	ldrb r0, [r2, #0x1b]
	cmp r0, #0
	beq _08019404
	ldr r1, _08019400  @ gUnknown_0859A5D0
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r0, [r0]
	ldrh r0, [r0]
	b _08019408
	.align 2, 0
_08019400: .4byte gUnknown_0859A5D0
_08019404:
	ldr r0, _08019410  @ gUnknown_0859A598
	ldr r0, [r0]
_08019408:
	bl GetStringFromIndex
	pop {r1}
	bx r1
	.align 2, 0
_08019410: .4byte gUnknown_0859A598

	THUMB_FUNC_START WriteStatusTextToRAM
WriteStatusTextToRAM: @ 0x08019414
	push {lr}
	ldr r1, _0801942C  @ gUnknown_0859A598
	adds r0, #0x30
	ldrb r0, [r0]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1a
	adds r0, r0, r1
	ldr r0, [r0]
	bl GetStringFromIndex
	pop {r1}
	bx r1
	.align 2, 0
_0801942C: .4byte gUnknown_0859A598

	THUMB_FUNC_START GetUnitStruct
GetUnitStruct: @ 0x08019430
	ldr r2, _08019440  @ gUnknown_0859A5D0
	movs r1, #0xff
	ands r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	ldr r0, [r1]
	bx lr
	.align 2, 0
_08019440: .4byte gUnknown_0859A5D0

	THUMB_FUNC_START GetROMClassStruct
GetROMClassStruct: @ 0x08019444
	push {lr}
	adds r1, r0, #0
	cmp r1, #0
	ble _0801945C
	movs r0, #0x54
	muls r0, r1, r0
	ldr r1, _08019458  @ gUnknown_08807110
	adds r0, r0, r1
	b _0801945E
	.align 2, 0
_08019458: .4byte gUnknown_08807110
_0801945C:
	movs r0, #0
_0801945E:
	pop {r1}
	bx r1

	THUMB_FUNC_START GetROMCharStruct
GetROMCharStruct: @ 0x08019464
	push {lr}
	adds r1, r0, #0
	cmp r1, #0
	ble _0801947C
	movs r0, #0x34
	muls r0, r1, r0
	ldr r1, _08019478  @ gUnknown_08803D30
	adds r0, r0, r1
	b _0801947E
	.align 2, 0
_08019478: .4byte gUnknown_08803D30
_0801947C:
	movs r0, #0
_0801947E:
	pop {r1}
	bx r1

	THUMB_FUNC_START UnitRemoveItem
UnitRemoveItem: @ 0x08019484
	push {lr}
	lsls r1, r1, #1
	adds r2, r0, #0
	adds r2, #0x1e
	adds r2, r2, r1
	movs r1, #0
	strh r1, [r2]
	bl RemoveUnitBlankItems
	pop {r0}
	bx r0

	THUMB_FUNC_START CanUnitCrossTerrain
CanUnitCrossTerrain: @ 0x0801949C
	push {r4, lr}
	adds r4, r1, #0
	bl GetMovCostTablePtr
	movs r1, #0
	adds r0, r0, r4
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	ble _080194B4
	movs r1, #1
_080194B4:
	adds r0, r1, #0
	pop {r4}
	pop {r1}
	bx r1

	.align 2, 0 @ Don't pad with nop.
