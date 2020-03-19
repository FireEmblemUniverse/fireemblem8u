	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	@ Make list of valid targets for everything

	THUMB_FUNC_START sub_8024E40
sub_8024E40: @ 0x08024E40
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	ldr r0, _08024EA0  @ gBmMapSize
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r1, r0, #1
	cmp r1, #0
	blt _08024E98
_08024E50:
	ldr r0, _08024EA0  @ gBmMapSize
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r4, r0, #1
	subs r6, r1, #1
	cmp r4, #0
	blt _08024E92
	lsls r5, r1, #2
_08024E60:
	ldr r0, _08024EA4  @ gBmMapMovement
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _08024E8C
	ldr r0, _08024EA8  @ gBmMapUnit
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r1, r0, r4
	ldrb r0, [r1]
	cmp r0, #0
	beq _08024E8C
	bl GetUnit
	bl _call_via_r7
_08024E8C:
	subs r4, #1
	cmp r4, #0
	bge _08024E60
_08024E92:
	adds r1, r6, #0
	cmp r1, #0
	bge _08024E50
_08024E98:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08024EA0: .4byte gBmMapSize
_08024EA4: .4byte gBmMapMovement
_08024EA8: .4byte gBmMapUnit

	THUMB_FUNC_END sub_8024E40

	THUMB_FUNC_START ForEachUnitInRange
ForEachUnitInRange: @ 0x08024EAC
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	ldr r0, _08024F0C  @ gBmMapSize
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r1, r0, #1
	cmp r1, #0
	blt _08024F04
_08024EBC:
	ldr r0, _08024F0C  @ gBmMapSize
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r4, r0, #1
	subs r6, r1, #1
	cmp r4, #0
	blt _08024EFE
	lsls r5, r1, #2
_08024ECC:
	ldr r0, _08024F10  @ gBmMapRange
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _08024EF8
	ldr r0, _08024F14  @ gBmMapUnit
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r1, r0, r4
	ldrb r0, [r1]
	cmp r0, #0
	beq _08024EF8
	bl GetUnit
	bl _call_via_r7
_08024EF8:
	subs r4, #1
	cmp r4, #0
	bge _08024ECC
_08024EFE:
	adds r1, r6, #0
	cmp r1, #0
	bge _08024EBC
_08024F04:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08024F0C: .4byte gBmMapSize
_08024F10: .4byte gBmMapRange
_08024F14: .4byte gBmMapUnit

	THUMB_FUNC_END ForEachUnitInRange

	THUMB_FUNC_START ForEachPosInRange
ForEachPosInRange: @ 0x08024F18
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	ldr r0, _08024F68  @ gBmMapSize
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r5, r0, #1
	cmp r5, #0
	blt _08024F60
_08024F28:
	ldr r0, _08024F68  @ gBmMapSize
	movs r1, #0
	ldrsh r0, [r0, r1]
	subs r4, r0, #1
	subs r6, r5, #1
	cmp r4, #0
	blt _08024F5A
_08024F36:
	ldr r0, _08024F6C  @ gBmMapRange
	ldr r1, [r0]
	lsls r0, r5, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _08024F54
	adds r0, r4, #0
	adds r1, r5, #0
	bl _call_via_r7
_08024F54:
	subs r4, #1
	cmp r4, #0
	bge _08024F36
_08024F5A:
	adds r5, r6, #0
	cmp r5, #0
	bge _08024F28
_08024F60:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08024F68: .4byte gBmMapSize
_08024F6C: .4byte gBmMapRange

	THUMB_FUNC_END ForEachPosInRange

	THUMB_FUNC_START ForEachAdjacentUnit
ForEachAdjacentUnit: @ 0x08024F70
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	bl InitTargets
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #1
	movs r3, #1
	bl MapAddInRange
	movs r3, #1
	negs r3, r3
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0
	bl MapAddInRange
	adds r0, r6, #0
	bl ForEachUnitInRange
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END ForEachAdjacentUnit

	THUMB_FUNC_START ForEachAdjacentPosition
ForEachAdjacentPosition: @ 0x08024FA4
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	bl InitTargets
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #1
	movs r3, #1
	bl MapAddInRange
	movs r3, #1
	negs r3, r3
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0
	bl MapAddInRange
	adds r0, r6, #0
	bl ForEachPosInRange
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END ForEachAdjacentPosition

	THUMB_FUNC_START sub_8024FD8
sub_8024FD8: @ 0x08024FD8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	adds r5, r1, #0
	mov r8, r2
	bl InitTargets
	movs r1, #0xff
	ldr r7, _08025034  @ gWorkingBmMap
	lsls r6, r5, #2
_08024FEE:
	movs r2, #0xff
	lsls r3, r1, #0x18
_08024FF2:
	cmp r4, #0
	blt _08025008
	cmp r5, #0
	blt _08025008
	ldr r0, [r7]
	adds r0, r6, r0
	ldr r1, [r0]
	adds r1, r1, r4
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
_08025008:
	lsls r0, r2, #0x18
	movs r1, #0x80
	lsls r1, r1, #0x11
	adds r0, r0, r1
	lsrs r2, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	ble _08024FF2
	adds r0, r3, r1
	lsrs r1, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	ble _08024FEE
	mov r0, r8
	bl ForEachPosInRange
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08025034: .4byte gWorkingBmMap

	THUMB_FUNC_END sub_8024FD8

	THUMB_FUNC_START ForEachPosIn12Range
ForEachPosIn12Range: @ 0x08025038
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	bl InitTargets
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #2
	movs r3, #1
	bl MapAddInRange
	movs r3, #1
	negs r3, r3
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0
	bl MapAddInRange
	adds r0, r6, #0
	bl ForEachPosInRange
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END ForEachPosIn12Range

	THUMB_FUNC_START ForEachUnitInMagBy2Range
ForEachUnitInMagBy2Range: @ 0x0802506C
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	mov r8, r0
	ldr r6, _080250B8  @ gUnknown_02033F3C
	ldr r0, [r6]
	movs r4, #0x10
	ldrsb r4, [r0, r4]
	movs r5, #0x11
	ldrsb r5, [r0, r5]
	adds r0, r4, #0
	adds r1, r5, #0
	bl InitTargets
	ldr r0, [r6]
	bl GetUnitMagBy2Range
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	movs r3, #1
	bl MapAddInRange
	movs r3, #1
	negs r3, r3
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0
	bl MapAddInRange
	mov r0, r8
	bl ForEachUnitInRange
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080250B8: .4byte gUnknown_02033F3C

	THUMB_FUNC_END ForEachUnitInMagBy2Range

	THUMB_FUNC_START TryAddTrapsToTargetList
TryAddTrapsToTargetList: @ 0x080250BC
	push {r4, r5, r6, lr}
	movs r0, #0
	bl GetTrap
	adds r4, r0, #0
	ldrb r0, [r4, #2]
	cmp r0, #0
	beq _0802516E
	ldr r6, _08025174  @ gBmMapTerrain
	ldr r5, _08025178  @ gBmMapRange
_080250D0:
	cmp r0, #2
	bne _08025166
	ldrb r1, [r4, #1]
	ldr r0, [r6]
	lsls r3, r1, #2
	adds r0, r3, r0
	ldrb r2, [r4]
	ldr r0, [r0]
	adds r0, r0, r2
	ldrb r0, [r0]
	cmp r0, #0x1b
	bne _08025104
	ldr r0, [r5]
	adds r0, r3, r0
	ldr r0, [r0]
	adds r0, r0, r2
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _08025104
	ldrb r3, [r4, #3]
	adds r0, r2, #0
	movs r2, #0
	bl AddTarget
_08025104:
	ldrb r1, [r4, #1]
	ldr r0, [r6]
	lsls r3, r1, #2
	adds r0, r3, r0
	ldrb r2, [r4]
	ldr r0, [r0, #4]
	adds r0, r0, r2
	ldrb r0, [r0]
	cmp r0, #0x1b
	bne _08025136
	ldr r0, [r5]
	adds r0, r3, r0
	ldr r0, [r0, #4]
	adds r0, r0, r2
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _08025136
	adds r1, #1
	ldrb r3, [r4, #3]
	adds r0, r2, #0
	movs r2, #0
	bl AddTarget
_08025136:
	ldrb r1, [r4, #1]
	ldr r0, [r6]
	lsls r3, r1, #2
	adds r0, r3, r0
	ldrb r2, [r4]
	ldr r0, [r0]
	adds r0, r0, r2
	ldrb r0, [r0]
	cmp r0, #0x33
	bne _08025166
	ldr r0, [r5]
	adds r0, r3, r0
	ldr r0, [r0]
	adds r0, r0, r2
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _08025166
	ldrb r3, [r4, #3]
	adds r0, r2, #0
	movs r2, #0
	bl AddTarget
_08025166:
	adds r4, #8
	ldrb r0, [r4, #2]
	cmp r0, #0
	bne _080250D0
_0802516E:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08025174: .4byte gBmMapTerrain
_08025178: .4byte gBmMapRange

	THUMB_FUNC_END TryAddTrapsToTargetList

	THUMB_FUNC_START AddUnitToTargetListIfNotAllied
AddUnitToTargetListIfNotAllied: @ 0x0802517C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080251B0  @ gUnknown_02033F3C
	ldr r0, [r0]
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #0xb
	ldrsb r1, [r4, r1]
	bl AreUnitsAllied
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080251AA
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	movs r2, #0xb
	ldrsb r2, [r4, r2]
	movs r3, #0
	bl AddTarget
_080251AA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080251B0: .4byte gUnknown_02033F3C

	THUMB_FUNC_END AddUnitToTargetListIfNotAllied

	THUMB_FUNC_START MakeTargetListForWeapon
MakeTargetListForWeapon: @ 0x080251B4
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	mov r8, r1
	movs r5, #0x10
	ldrsb r5, [r0, r5]
	movs r6, #0x11
	ldrsb r6, [r0, r6]
	ldr r1, _08025210  @ gUnknown_02033F3C
	str r0, [r1]
	adds r0, r5, #0
	adds r1, r6, #0
	bl InitTargets
	ldr r0, _08025214  @ gBmMapRange
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFill
	mov r0, r8
	bl GetItemMinRange
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	mov r0, r8
	bl GetItemMaxRange
	adds r3, r0, #0
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	adds r0, r5, #0
	adds r1, r6, #0
	adds r2, r4, #0
	bl MapAddInBoundedRange
	ldr r0, _08025218  @ AddUnitToTargetListIfNotAllied
	bl ForEachUnitInRange
	bl TryAddTrapsToTargetList
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08025210: .4byte gUnknown_02033F3C
_08025214: .4byte gBmMapRange
_08025218: .4byte AddUnitToTargetListIfNotAllied

	THUMB_FUNC_END MakeTargetListForWeapon

	THUMB_FUNC_START TryAddUnitToTradeTargetList
TryAddUnitToTradeTargetList: @ 0x0802521C
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r5, _080252CC  @ gUnknown_02033F3C
	ldr r0, [r5]
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #0xb
	ldrsb r1, [r4, r1]
	bl IsSameAllegience
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080252C4
	ldr r2, [r5]
	ldr r0, [r2, #4]
	ldrb r0, [r0, #4]
	cmp r0, #0x51
	beq _080252C4
	ldr r3, [r4, #4]
	ldrb r0, [r3, #4]
	cmp r0, #0x51
	beq _080252C4
	adds r0, r4, #0
	adds r0, #0x30
	ldrb r1, [r0]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #4
	beq _08025288
	ldrh r0, [r2, #0x1e]
	cmp r0, #0
	bne _08025264
	ldrh r0, [r4, #0x1e]
	cmp r0, #0
	beq _08025288
_08025264:
	ldr r0, [r4]
	ldr r0, [r0, #0x28]
	ldr r1, [r3, #0x28]
	orrs r0, r1
	movs r1, #0x80
	lsls r1, r1, #2
	ands r0, r1
	cmp r0, #0
	bne _08025288
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	movs r2, #0xb
	ldrsb r2, [r4, r2]
	movs r3, #0
	bl AddTarget
_08025288:
	ldr r0, [r4, #0xc]
	movs r1, #0x10
	ands r0, r1
	cmp r0, #0
	beq _080252C4
	ldrb r0, [r4, #0x1b]
	bl GetUnit
	adds r1, r0, #0
	movs r2, #0xb
	ldrsb r2, [r1, r2]
	movs r0, #0xc0
	ands r0, r2
	cmp r0, #0
	bne _080252C4
	ldr r0, _080252CC  @ gUnknown_02033F3C
	ldr r0, [r0]
	ldrh r0, [r0, #0x1e]
	cmp r0, #0
	bne _080252B6
	ldrh r0, [r1, #0x1e]
	cmp r0, #0
	beq _080252C4
_080252B6:
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	movs r3, #0
	bl AddTarget
_080252C4:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080252CC: .4byte gUnknown_02033F3C

	THUMB_FUNC_END TryAddUnitToTradeTargetList

	THUMB_FUNC_START MakeTradeTargetList
MakeTradeTargetList: @ 0x080252D0
	push {r4, r5, r6, r7, lr}
	movs r4, #0x10
	ldrsb r4, [r0, r4]
	movs r5, #0x11
	ldrsb r5, [r0, r5]
	ldr r6, _08025338  @ gUnknown_02033F3C
	str r0, [r6]
	ldr r0, _0802533C  @ gBmMapRange
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFill
	ldr r7, _08025340  @ TryAddUnitToTradeTargetList
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r7, #0
	bl ForEachAdjacentUnit
	ldr r0, [r6]
	ldr r0, [r0, #0xc]
	movs r1, #0x10
	ands r0, r1
	cmp r0, #0
	beq _08025332
	bl sub_804FD28
	adds r4, r0, #0
	ldr r0, [r6]
	ldrb r0, [r0, #0x1b]
	bl GetUnit
	bl _call_via_r7
	bl sub_804FD28
	cmp r4, r0
	beq _08025332
	adds r0, r4, #0
	bl GetTarget
	ldr r1, [r6]
	ldrb r1, [r1, #0x10]
	strb r1, [r0]
	adds r0, r4, #0
	bl GetTarget
	ldr r1, [r6]
	ldrb r1, [r1, #0x11]
	strb r1, [r0, #1]
_08025332:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08025338: .4byte gUnknown_02033F3C
_0802533C: .4byte gBmMapRange
_08025340: .4byte TryAddUnitToTradeTargetList

	THUMB_FUNC_END MakeTradeTargetList

	THUMB_FUNC_START TryAddUnitToRescueTargetList
TryAddUnitToRescueTargetList: @ 0x08025344
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r5, _080253B0  @ gUnknown_02033F3C
	ldr r0, [r5]
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #0xb
	ldrsb r1, [r4, r1]
	bl AreUnitsAllied
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080253AA
	ldr r2, [r5]
	ldr r0, [r2, #4]
	ldrb r0, [r0, #4]
	cmp r0, #0x51
	beq _080253AA
	ldr r0, [r4, #4]
	ldrb r0, [r0, #4]
	cmp r0, #0x51
	beq _080253AA
	adds r0, r4, #0
	adds r0, #0x30
	ldrb r1, [r0]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #4
	beq _080253AA
	ldr r0, [r4, #0xc]
	movs r1, #0x30
	ands r0, r1
	cmp r0, #0
	bne _080253AA
	adds r0, r2, #0
	adds r1, r4, #0
	bl CanUnitRescue
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080253AA
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	movs r2, #0xb
	ldrsb r2, [r4, r2]
	movs r3, #0
	bl AddTarget
_080253AA:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080253B0: .4byte gUnknown_02033F3C

	THUMB_FUNC_END TryAddUnitToRescueTargetList

	THUMB_FUNC_START MakeRescueTargetList
MakeRescueTargetList: @ 0x080253B4
	push {r4, r5, lr}
	movs r4, #0x10
	ldrsb r4, [r0, r4]
	movs r5, #0x11
	ldrsb r5, [r0, r5]
	ldr r1, _080253DC  @ gUnknown_02033F3C
	str r0, [r1]
	ldr r0, _080253E0  @ gBmMapRange
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFill
	ldr r2, _080253E4  @ TryAddUnitToRescueTargetList
	adds r0, r4, #0
	adds r1, r5, #0
	bl ForEachAdjacentUnit
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080253DC: .4byte gUnknown_02033F3C
_080253E0: .4byte gBmMapRange
_080253E4: .4byte TryAddUnitToRescueTargetList

	THUMB_FUNC_END MakeRescueTargetList

	THUMB_FUNC_START TryAddToDropTargetList
TryAddToDropTargetList: @ 0x080253E8
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r6, r1, #0
	ldr r0, _08025434  @ gBmMapUnit
	ldr r0, [r0]
	lsls r5, r6, #2
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0
	bne _0802542C
	ldr r0, _08025438  @ gUnknown_02033F3C
	ldr r0, [r0]
	ldrb r0, [r0, #0x1b]
	bl GetUnit
	ldr r1, _0802543C  @ gBmMapTerrain
	ldr r1, [r1]
	adds r1, r5, r1
	ldr r1, [r1]
	adds r1, r1, r4
	ldrb r1, [r1]
	bl CanUnitCrossTerrain
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0802542C
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #0
	movs r3, #0
	bl AddTarget
_0802542C:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08025434: .4byte gBmMapUnit
_08025438: .4byte gUnknown_02033F3C
_0802543C: .4byte gBmMapTerrain

	THUMB_FUNC_END TryAddToDropTargetList

	THUMB_FUNC_START MakeDropTargetList
MakeDropTargetList: @ 0x08025440
	push {r4, r5, lr}
	movs r4, #0x10
	ldrsb r4, [r0, r4]
	movs r5, #0x11
	ldrsb r5, [r0, r5]
	ldr r1, _08025468  @ gUnknown_02033F3C
	str r0, [r1]
	ldr r0, _0802546C  @ gBmMapRange
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFill
	ldr r2, _08025470  @ TryAddToDropTargetList
	adds r0, r4, #0
	adds r1, r5, #0
	bl ForEachAdjacentPosition
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08025468: .4byte gUnknown_02033F3C
_0802546C: .4byte gBmMapRange
_08025470: .4byte TryAddToDropTargetList

	THUMB_FUNC_END MakeDropTargetList

	THUMB_FUNC_START TryAddRescuedUnitToTakeTargetList
TryAddRescuedUnitToTakeTargetList: @ 0x08025474
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _080254DC  @ gUnknown_02033F3C
	ldr r0, [r4]
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #0xb
	ldrsb r1, [r5, r1]
	bl IsSameAllegience
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080254D6
	ldr r0, [r5, #0xc]
	movs r1, #0x10
	ands r0, r1
	cmp r0, #0
	beq _080254D6
	ldr r0, [r5]
	ldr r1, [r5, #4]
	ldr r0, [r0, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	movs r1, #0x80
	lsls r1, r1, #2
	ands r0, r1
	cmp r0, #0
	bne _080254D6
	ldr r4, [r4]
	ldrb r0, [r5, #0x1b]
	bl GetUnit
	adds r1, r0, #0
	adds r0, r4, #0
	bl CanUnitRescue
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080254D6
	movs r0, #0x10
	ldrsb r0, [r5, r0]
	movs r1, #0x11
	ldrsb r1, [r5, r1]
	movs r2, #0xb
	ldrsb r2, [r5, r2]
	movs r3, #0
	bl AddTarget
_080254D6:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080254DC: .4byte gUnknown_02033F3C

	THUMB_FUNC_END TryAddRescuedUnitToTakeTargetList

	THUMB_FUNC_START MakeTakeTargetList
MakeTakeTargetList: @ 0x080254E0
	push {r4, r5, lr}
	movs r4, #0x10
	ldrsb r4, [r0, r4]
	movs r5, #0x11
	ldrsb r5, [r0, r5]
	ldr r1, _08025508  @ gUnknown_02033F3C
	str r0, [r1]
	ldr r0, _0802550C  @ gBmMapRange
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFill
	ldr r2, _08025510  @ TryAddRescuedUnitToTakeTargetList
	adds r0, r4, #0
	adds r1, r5, #0
	bl ForEachAdjacentUnit
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08025508: .4byte gUnknown_02033F3C
_0802550C: .4byte gBmMapRange
_08025510: .4byte TryAddRescuedUnitToTakeTargetList

	THUMB_FUNC_END MakeTakeTargetList

	THUMB_FUNC_START sub_8025514
sub_8025514: @ 0x08025514
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r5, _08025590  @ gUnknown_02033F3C
	ldr r0, [r5]
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #0xb
	ldrsb r1, [r4, r1]
	bl IsSameAllegience
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08025588
	ldr r0, [r4, #0xc]
	movs r1, #0x10
	ands r0, r1
	cmp r0, #0
	bne _08025588
	adds r0, r4, #0
	adds r0, #0x30
	ldrb r0, [r0]
	movs r1, #0xf
	ands r1, r0
	cmp r1, #4
	beq _08025588
	cmp r1, #2
	beq _08025588
	ldr r0, [r4]
	ldr r1, [r4, #4]
	ldr r0, [r0, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	movs r1, #0x80
	lsls r1, r1, #2
	ands r0, r1
	cmp r0, #0
	bne _08025588
	ldr r0, [r5]
	ldrb r0, [r0, #0x1b]
	bl GetUnit
	adds r1, r0, #0
	adds r0, r4, #0
	bl CanUnitRescue
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08025588
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	movs r2, #0xb
	ldrsb r2, [r4, r2]
	movs r3, #0
	bl AddTarget
_08025588:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08025590: .4byte gUnknown_02033F3C

	THUMB_FUNC_END sub_8025514

	THUMB_FUNC_START sub_8025594
sub_8025594: @ 0x08025594
	push {r4, r5, lr}
	movs r4, #0x10
	ldrsb r4, [r0, r4]
	movs r5, #0x11
	ldrsb r5, [r0, r5]
	ldr r1, _080255BC  @ gUnknown_02033F3C
	str r0, [r1]
	ldr r0, _080255C0  @ gBmMapRange
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFill
	ldr r2, _080255C4  @ sub_8025514
	adds r0, r4, #0
	adds r1, r5, #0
	bl ForEachAdjacentUnit
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080255BC: .4byte gUnknown_02033F3C
_080255C0: .4byte gBmMapRange
_080255C4: .4byte sub_8025514

	THUMB_FUNC_END sub_8025594

	THUMB_FUNC_START sub_80255C8
sub_80255C8: @ 0x080255C8
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x30
	ldrb r0, [r0]
	movs r1, #0xf
	ands r1, r0
	cmp r1, #4
	beq _08025606
	cmp r1, #2
	beq _08025606
	ldr r0, _0802560C  @ gUnknown_02033F3C
	ldr r0, [r0]
	ldr r0, [r0]
	ldrb r0, [r0, #4]
	ldr r1, [r4]
	ldrb r1, [r1, #4]
	bl sub_8083F68
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08025606
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	movs r2, #0xb
	ldrsb r2, [r4, r2]
	ldr r3, [r4]
	ldrb r3, [r3, #4]
	bl AddTarget
_08025606:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802560C: .4byte gUnknown_02033F3C

	THUMB_FUNC_END sub_80255C8

	THUMB_FUNC_START sub_8025610
sub_8025610: @ 0x08025610
	push {r4, r5, lr}
	movs r4, #0x10
	ldrsb r4, [r0, r4]
	movs r5, #0x11
	ldrsb r5, [r0, r5]
	ldr r1, _08025638  @ gUnknown_02033F3C
	str r0, [r1]
	ldr r0, _0802563C  @ gBmMapRange
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFill
	ldr r2, _08025640  @ sub_80255C8
	adds r0, r4, #0
	adds r1, r5, #0
	bl ForEachAdjacentUnit
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08025638: .4byte gUnknown_02033F3C
_0802563C: .4byte gBmMapRange
_08025640: .4byte sub_80255C8

	THUMB_FUNC_END sub_8025610

	THUMB_FUNC_START MakeTargetListForSupport
MakeTargetListForSupport: @ 0x08025644
	push {r4, r5, r6, r7, lr}
	ldr r4, _080256E8  @ gUnknown_02033F3C
	str r0, [r4]
	movs r2, #0x10
	ldrsb r2, [r0, r2]
	movs r1, #0x11
	ldrsb r1, [r0, r1]
	adds r0, r2, #0
	bl InitTargets
	ldr r0, [r4]
	bl GetUnitSupporterCount
	adds r6, r0, #0
	movs r5, #0
	cmp r5, r6
	bge _080256E2
	adds r7, r4, #0
_08025668:
	ldr r0, [r7]
	adds r1, r5, #0
	bl GetUnitSupporterUnit
	adds r4, r0, #0
	cmp r4, #0
	beq _080256DC
	ldr r3, [r7]
	movs r2, #0x10
	ldrsb r2, [r3, r2]
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	subs r1, r2, r0
	cmp r1, #0
	bge _08025688
	subs r1, r0, r2
_08025688:
	ldrb r3, [r3, #0x11]
	lsls r3, r3, #0x18
	asrs r3, r3, #0x18
	movs r2, #0x11
	ldrsb r2, [r4, r2]
	subs r0, r3, r2
	cmp r0, #0
	bge _0802569A
	subs r0, r2, r3
_0802569A:
	adds r0, r1, r0
	cmp r0, #1
	bne _080256DC
	ldr r0, [r7]
	adds r1, r5, #0
	bl CanUnitSupportNow
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080256DC
	ldr r0, [r4, #0xc]
	ldr r1, _080256EC  @ 0x0001002C
	ands r0, r1
	cmp r0, #0
	bne _080256DC
	adds r0, r4, #0
	adds r0, #0x30
	ldrb r0, [r0]
	movs r1, #0xf
	ands r1, r0
	cmp r1, #4
	beq _080256DC
	cmp r1, #2
	beq _080256DC
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	movs r2, #0xb
	ldrsb r2, [r4, r2]
	adds r3, r5, #0
	bl AddTarget
_080256DC:
	adds r5, #1
	cmp r5, r6
	blt _08025668
_080256E2:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080256E8: .4byte gUnknown_02033F3C
_080256EC: .4byte 0x0001002C

	THUMB_FUNC_END MakeTargetListForSupport

	THUMB_FUNC_START AddUnitToTargetListIfAllied
AddUnitToTargetListIfAllied: @ 0x080256F0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08025724  @ gUnknown_02033F3C
	ldr r0, [r0]
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #0xb
	ldrsb r1, [r4, r1]
	bl AreUnitsAllied
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0802571E
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	movs r2, #0xb
	ldrsb r2, [r4, r2]
	movs r3, #1
	bl AddTarget
_0802571E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08025724: .4byte gUnknown_02033F3C

	THUMB_FUNC_END AddUnitToTargetListIfAllied

	THUMB_FUNC_START FillBallistaRangeMaybe
FillBallistaRangeMaybe: @ 0x08025728
	push {r4, r5, r6, r7, lr}
	movs r5, #0x10
	ldrsb r5, [r0, r5]
	movs r6, #0x11
	ldrsb r6, [r0, r6]
	ldr r1, _08025788  @ gUnknown_02033F3C
	str r0, [r1]
	adds r0, r5, #0
	adds r1, r6, #0
	bl InitTargets
	adds r0, r5, #0
	adds r1, r6, #0
	bl GetSomeBallistaItemAt
	adds r7, r0, #0
	cmp r7, #0
	beq _08025782
	ldr r0, _0802578C  @ gBmMapRange
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFill
	adds r0, r7, #0
	bl GetItemMinRange
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	adds r0, r7, #0
	bl GetItemMaxRange
	adds r3, r0, #0
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	adds r0, r5, #0
	adds r1, r6, #0
	adds r2, r4, #0
	bl MapAddInBoundedRange
	ldr r0, _08025790  @ AddUnitToTargetListIfAllied
	bl ForEachUnitInRange
	bl TryAddTrapsToTargetList
_08025782:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08025788: .4byte gUnknown_02033F3C
_0802578C: .4byte gBmMapRange
_08025790: .4byte AddUnitToTargetListIfAllied

	THUMB_FUNC_END FillBallistaRangeMaybe

	THUMB_FUNC_START TryAddClosedDoorToTargetList
TryAddClosedDoorToTargetList: @ 0x08025794
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _080257D0  @ gBmMapTerrain
	ldr r1, [r0]
	lsls r0, r5, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0x1e
	bne _080257CA
	lsls r0, r4, #0x18
	asrs r0, r0, #0x18
	lsls r1, r5, #0x18
	asrs r1, r1, #0x18
	bl IsThereClosedDoorAt
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080257CA
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0x1e
	movs r3, #0
	bl AddTarget
_080257CA:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080257D0: .4byte gBmMapTerrain

	THUMB_FUNC_END TryAddClosedDoorToTargetList

	THUMB_FUNC_START TryAddBridgeToTargetList
TryAddBridgeToTargetList: @ 0x080257D4
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _08025810  @ gBmMapTerrain
	ldr r1, [r0]
	lsls r0, r5, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0x14
	bne _0802580A
	lsls r0, r4, #0x18
	asrs r0, r0, #0x18
	lsls r1, r5, #0x18
	asrs r1, r1, #0x18
	bl IsThereClosedDoorAt
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0802580A
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0x14
	movs r3, #0
	bl AddTarget
_0802580A:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08025810: .4byte gBmMapTerrain

	THUMB_FUNC_END TryAddBridgeToTargetList

	THUMB_FUNC_START MakeTargetListForDoorAndBridges
MakeTargetListForDoorAndBridges: @ 0x08025814
	push {r4, r5, r6, lr}
	adds r4, r1, #0
	movs r5, #0x10
	ldrsb r5, [r0, r5]
	movs r6, #0x11
	ldrsb r6, [r0, r6]
	ldr r1, _08025844  @ gUnknown_02033F3C
	str r0, [r1]
	ldr r0, _08025848  @ gBmMapRange
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFill
	cmp r4, #0x14
	beq _08025850
	cmp r4, #0x1e
	bne _0802585A
	ldr r2, _0802584C  @ TryAddClosedDoorToTargetList
	adds r0, r5, #0
	adds r1, r6, #0
	bl ForEachAdjacentPosition
	b _0802585A
	.align 2, 0
_08025844: .4byte gUnknown_02033F3C
_08025848: .4byte gBmMapRange
_0802584C: .4byte TryAddClosedDoorToTargetList
_08025850:
	ldr r2, _08025860  @ TryAddBridgeToTargetList
	adds r0, r5, #0
	adds r1, r6, #0
	bl ForEachAdjacentPosition
_0802585A:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08025860: .4byte TryAddBridgeToTargetList

	THUMB_FUNC_END MakeTargetListForDoorAndBridges

	THUMB_FUNC_START sub_8025864
sub_8025864: @ 0x08025864
	push {lr}
	adds r2, r0, #0
	adds r3, r1, #0
	ldr r0, _08025890  @ gBmMapTerrain
	ldr r1, [r0]
	lsls r0, r3, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, r0, r2
	ldrb r0, [r0]
	cmp r0, #0x14
	beq _08025894
	cmp r0, #0x1e
	bne _080258A0
	adds r0, r2, #0
	adds r1, r3, #0
	movs r2, #0x1e
	movs r3, #0
	bl AddTarget
	b _080258A0
	.align 2, 0
_08025890: .4byte gBmMapTerrain
_08025894:
	adds r0, r2, #0
	adds r1, r3, #0
	movs r2, #0x14
	movs r3, #0
	bl AddTarget
_080258A0:
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8025864

	THUMB_FUNC_START sub_80258A4
sub_80258A4: @ 0x080258A4
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	movs r5, #0x10
	ldrsb r5, [r4, r5]
	movs r6, #0x11
	ldrsb r6, [r4, r6]
	ldr r0, _080258F4  @ gUnknown_02033F3C
	str r4, [r0]
	ldr r0, _080258F8  @ gBmMapRange
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFill
	ldr r2, _080258FC  @ sub_8025864
	adds r0, r5, #0
	adds r1, r6, #0
	bl ForEachAdjacentPosition
	movs r0, #0x11
	ldrsb r0, [r4, r0]
	ldr r1, _08025900  @ gBmMapTerrain
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r1, #0x10
	ldrsb r1, [r4, r1]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0x21
	bne _080258EE
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #0x21
	movs r3, #0
	bl AddTarget
_080258EE:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080258F4: .4byte gUnknown_02033F3C
_080258F8: .4byte gBmMapRange
_080258FC: .4byte sub_8025864
_08025900: .4byte gBmMapTerrain

	THUMB_FUNC_END sub_80258A4

	THUMB_FUNC_START sub_8025904
sub_8025904: @ 0x08025904
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	movs r0, #0
	movs r1, #0
	bl InitTargets
	mov r7, r8
	b _080259CE
_08025918:
	adds r0, r7, #0
	bl GetUnit
	adds r5, r0, #0
	cmp r5, #0
	beq _080259CE
	ldr r0, [r5]
	cmp r0, #0
	beq _080259CE
	ldr r0, [r5, #0xc]
	ldr r1, _080259E4  @ 0x0001002C
	ands r0, r1
	cmp r0, #0
	bne _080259CE
	movs r1, #0x11
	ldrsb r1, [r5, r1]
	ldr r0, _080259E8  @ gBmMapTerrain
	ldr r0, [r0]
	lsls r1, r1, #2
	adds r1, r1, r0
	movs r2, #0x10
	ldrsb r2, [r5, r2]
	ldr r0, [r1]
	adds r0, r0, r2
	ldrb r6, [r0]
	adds r0, r6, #0
	bl GetTerrainHealAmount
	cmp r0, #0
	beq _0802598E
	adds r0, r5, #0
	bl GetUnitCurrentHp
	adds r4, r0, #0
	adds r0, r5, #0
	bl GetUnitMaxHp
	cmp r4, r0
	beq _0802598E
	adds r0, r6, #0
	bl GetTerrainHealAmount
	adds r4, r0, #0
	adds r0, r5, #0
	bl GetUnitMaxHp
	muls r0, r4, r0
	movs r1, #0x64
	bl __divsi3
	adds r3, r0, #0
	movs r0, #0x10
	ldrsb r0, [r5, r0]
	movs r1, #0x11
	ldrsb r1, [r5, r1]
	movs r2, #0xb
	ldrsb r2, [r5, r2]
	bl AddTarget
_0802598E:
	adds r0, r6, #0
	bl GetTerrainUnk
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080259CE
	adds r2, r5, #0
	adds r2, #0x30
	ldrb r1, [r2]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #0
	beq _080259CE
	cmp r0, #0xd
	bne _080259BA
	movs r3, #0x10
	negs r3, r3
	adds r0, r3, #0
	ands r0, r1
	movs r1, #0xb
	orrs r0, r1
	strb r0, [r2]
_080259BA:
	movs r0, #0x10
	ldrsb r0, [r5, r0]
	movs r1, #0x11
	ldrsb r1, [r5, r1]
	movs r2, #0xb
	ldrsb r2, [r5, r2]
	movs r3, #1
	negs r3, r3
	bl AddTarget
_080259CE:
	adds r7, #1
	mov r0, r8
	adds r0, #0x40
	cmp r7, r0
	blt _08025918
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080259E4: .4byte 0x0001002C
_080259E8: .4byte gBmMapTerrain

	THUMB_FUNC_END sub_8025904

	THUMB_FUNC_START sub_80259EC
sub_80259EC: @ 0x080259EC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	movs r0, #0
	movs r1, #0
	bl InitTargets
	mov r7, r8
	b _08025A4A
_08025A00:
	adds r0, r7, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq _08025A4A
	ldr r0, [r2]
	cmp r0, #0
	beq _08025A4A
	ldr r0, [r2, #0xc]
	ldr r1, _08025A60  @ 0x0001002C
	ands r0, r1
	cmp r0, #0
	bne _08025A4A
	adds r0, r2, #0
	adds r0, #0x30
	ldrb r1, [r0]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #1
	bne _08025A4A
	movs r4, #0x10
	ldrsb r4, [r2, r4]
	movs r5, #0x11
	ldrsb r5, [r2, r5]
	movs r6, #0xb
	ldrsb r6, [r2, r6]
	movs r0, #3
	bl NextRN_N
	adds r3, r0, #0
	adds r3, #1
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r6, #0
	bl AddTarget
_08025A4A:
	adds r7, #1
	mov r0, r8
	adds r0, #0x40
	cmp r7, r0
	blt _08025A00
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08025A60: .4byte 0x0001002C

	THUMB_FUNC_END sub_80259EC

	THUMB_FUNC_START sub_8025A64
sub_8025A64: @ 0x08025A64
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r7, r0, #0
	movs r0, #0
	movs r1, #0
	bl InitTargets
	adds r6, r7, #1
	adds r0, r7, #0
	adds r0, #0x40
	cmp r6, r0
	bge _08025B0C
	movs r0, #5
	lsls r0, r0, #0x18
	mov r8, r0
_08025A84:
	adds r0, r6, #0
	bl GetUnit
	adds r4, r0, #0
	cmp r4, #0
	beq _08025B02
	ldr r0, [r4]
	cmp r0, #0
	beq _08025B02
	ldr r5, [r4, #0xc]
	ldr r0, _08025AD4  @ 0x0001002C
	ands r5, r0
	cmp r5, #0
	bne _08025B02
	adds r0, r4, #0
	adds r0, #0x30
	ldrb r1, [r0]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #0xa
	bne _08025B02
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	movs r2, #0xc
	bl GetTypedTrapAt
	adds r2, r0, #0
	cmp r2, #0
	beq _08025B02
	ldrb r0, [r2, #4]
	subs r0, #1
	cmp r0, #0
	ble _08025AD8
	strb r0, [r2, #4]
	ldrb r0, [r2, #5]
	strb r0, [r2, #6]
	b _08025B02
	.align 2, 0
_08025AD4: .4byte 0x0001002C
_08025AD8:
	strb r5, [r2, #4]
	ldrb r0, [r2, #6]
	adds r0, #1
	strb r0, [r2, #6]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #5
	ldrsb r1, [r2, r1]
	cmp r0, r1
	blt _08025B02
	strb r5, [r2, #6]
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	movs r2, #0xb
	ldrsb r2, [r4, r2]
	mov r4, r8
	asrs r3, r4, #0x18
	bl AddTarget
_08025B02:
	adds r6, #1
	adds r0, r7, #0
	adds r0, #0x40
	cmp r6, r0
	blt _08025A84
_08025B0C:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8025A64

	THUMB_FUNC_START sub_8025B18
sub_8025B18: @ 0x08025B18
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08025B68  @ gUnknown_02033F3C
	ldr r0, [r0]
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #0xb
	ldrsb r1, [r4, r1]
	bl IsSameAllegience
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08025B62
	ldr r0, [r4, #0xc]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	beq _08025B62
	adds r0, r4, #0
	adds r0, #0x30
	ldrb r0, [r0]
	movs r1, #0xf
	ands r1, r0
	cmp r1, #0xb
	beq _08025B62
	cmp r1, #0xd
	beq _08025B62
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	movs r2, #0xb
	ldrsb r2, [r4, r2]
	movs r3, #0
	bl AddTarget
_08025B62:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08025B68: .4byte gUnknown_02033F3C

	THUMB_FUNC_END sub_8025B18

	THUMB_FUNC_START sub_8025B6C
sub_8025B6C: @ 0x08025B6C
	push {r4, r5, lr}
	movs r4, #0x10
	ldrsb r4, [r0, r4]
	movs r5, #0x11
	ldrsb r5, [r0, r5]
	ldr r1, _08025B94  @ gUnknown_02033F3C
	str r0, [r1]
	ldr r0, _08025B98  @ gBmMapRange
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFill
	ldr r2, _08025B9C  @ sub_8025B18
	adds r0, r4, #0
	adds r1, r5, #0
	bl ForEachAdjacentUnit
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08025B94: .4byte gUnknown_02033F3C
_08025B98: .4byte gBmMapRange
_08025B9C: .4byte sub_8025B18

	THUMB_FUNC_END sub_8025B6C

	THUMB_FUNC_START AddAsTarget_IfCanStealFrom
AddAsTarget_IfCanStealFrom: @ 0x08025BA0
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	movs r0, #0xb
	ldrsb r0, [r5, r0]
	movs r1, #0xc0
	ands r0, r1
	cmp r0, #0x80
	bne _08025BF8
	ldr r0, _08025BEC  @ gActiveUnit
	ldr r0, [r0]
	movs r1, #0x16
	ldrsb r1, [r0, r1]
	movs r0, #0x16
	ldrsb r0, [r5, r0]
	cmp r1, r0
	blt _08025BF8
	movs r6, #0
	adds r4, r5, #0
	adds r4, #0x1e
_08025BC6:
	ldrh r0, [r4]
	cmp r0, #0
	beq _08025BF8
	bl IsItemStealable
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08025BF0
	movs r0, #0x10
	ldrsb r0, [r5, r0]
	movs r1, #0x11
	ldrsb r1, [r5, r1]
	movs r2, #0xb
	ldrsb r2, [r5, r2]
	movs r3, #0
	bl AddTarget
	b _08025BF8
	.align 2, 0
_08025BEC: .4byte gActiveUnit
_08025BF0:
	adds r4, #2
	adds r6, #1
	cmp r6, #4
	ble _08025BC6
_08025BF8:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END AddAsTarget_IfCanStealFrom

	THUMB_FUNC_START MakeTargetListForSteal
MakeTargetListForSteal: @ 0x08025C00
	push {r4, r5, lr}
	movs r4, #0x10
	ldrsb r4, [r0, r4]
	movs r5, #0x11
	ldrsb r5, [r0, r5]
	ldr r1, _08025C28  @ gUnknown_02033F3C
	str r0, [r1]
	ldr r0, _08025C2C  @ gBmMapRange
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFill
	ldr r2, _08025C30  @ AddAsTarget_IfCanStealFrom
	adds r0, r4, #0
	adds r1, r5, #0
	bl ForEachAdjacentUnit
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08025C28: .4byte gUnknown_02033F3C
_08025C2C: .4byte gBmMapRange
_08025C30: .4byte AddAsTarget_IfCanStealFrom

	THUMB_FUNC_END MakeTargetListForSteal

	THUMB_FUNC_START sub_8025C34
sub_8025C34: @ 0x08025C34
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _08025C90  @ gBmMapUnit
	ldr r0, [r0]
	lsls r2, r5, #2
	adds r0, r2, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0
	bne _08025C8A
	ldr r0, _08025C94  @ gRAMChapterData
	ldrb r0, [r0, #0xd]
	cmp r0, #0
	beq _08025C64
	ldr r0, _08025C98  @ gBmMapFog
	ldr r0, [r0]
	adds r0, r2, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0
	beq _08025C8A
_08025C64:
	ldr r0, _08025C9C  @ gUnknown_02033F3C
	ldr r0, [r0]
	ldr r1, _08025CA0  @ gBmMapTerrain
	ldr r1, [r1]
	adds r1, r2, r1
	ldr r1, [r1]
	adds r1, r1, r4
	ldrb r1, [r1]
	bl CanUnitCrossTerrain
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08025C8A
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0
	movs r3, #0
	bl AddTarget
_08025C8A:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08025C90: .4byte gBmMapUnit
_08025C94: .4byte gRAMChapterData
_08025C98: .4byte gBmMapFog
_08025C9C: .4byte gUnknown_02033F3C
_08025CA0: .4byte gBmMapTerrain

	THUMB_FUNC_END sub_8025C34

	THUMB_FUNC_START sub_8025CA4
sub_8025CA4: @ 0x08025CA4
	push {r4, r5, lr}
	movs r4, #0x10
	ldrsb r4, [r0, r4]
	movs r5, #0x11
	ldrsb r5, [r0, r5]
	ldr r1, _08025CCC  @ gUnknown_02033F3C
	str r0, [r1]
	ldr r0, _08025CD0  @ gBmMapRange
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFill
	ldr r2, _08025CD4  @ sub_8025C34
	adds r0, r4, #0
	adds r1, r5, #0
	bl ForEachAdjacentPosition
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08025CCC: .4byte gUnknown_02033F3C
_08025CD0: .4byte gBmMapRange
_08025CD4: .4byte sub_8025C34

	THUMB_FUNC_END sub_8025CA4

	THUMB_FUNC_START sub_8025CD8
sub_8025CD8: @ 0x08025CD8
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _08025D34  @ gBmMapUnit
	ldr r0, [r0]
	lsls r2, r5, #2
	adds r0, r2, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0
	bne _08025D2E
	ldr r0, _08025D38  @ gRAMChapterData
	ldrb r0, [r0, #0xd]
	cmp r0, #0
	beq _08025D08
	ldr r0, _08025D3C  @ gBmMapFog
	ldr r0, [r0]
	adds r0, r2, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0
	beq _08025D2E
_08025D08:
	ldr r0, _08025D40  @ gUnknown_02033F3C
	ldr r0, [r0]
	ldr r1, _08025D44  @ gBmMapTerrain
	ldr r1, [r1]
	adds r1, r2, r1
	ldr r1, [r1]
	adds r1, r1, r4
	ldrb r1, [r1]
	bl CanUnitCrossTerrain
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08025D2E
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0
	movs r3, #0
	bl AddTarget
_08025D2E:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08025D34: .4byte gBmMapUnit
_08025D38: .4byte gRAMChapterData
_08025D3C: .4byte gBmMapFog
_08025D40: .4byte gUnknown_02033F3C
_08025D44: .4byte gBmMapTerrain

	THUMB_FUNC_END sub_8025CD8

	THUMB_FUNC_START sub_8025D48
sub_8025D48: @ 0x08025D48
	push {r4, r5, lr}
	movs r5, #0x10
	ldrsb r5, [r0, r5]
	movs r4, #0x11
	ldrsb r4, [r0, r4]
	ldr r1, _08025D74  @ gUnknown_02033F3C
	str r0, [r1]
	ldr r0, _08025D78  @ gBmMapRange
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFill
	adds r4, #4
	ldr r2, _08025D7C  @ sub_8025CD8
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_8024FD8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08025D74: .4byte gUnknown_02033F3C
_08025D78: .4byte gBmMapRange
_08025D7C: .4byte sub_8025CD8

	THUMB_FUNC_END sub_8025D48

	THUMB_FUNC_START sub_8025D80
sub_8025D80: @ 0x08025D80
	push {r4, r5, lr}
	movs r4, #0x10
	ldrsb r4, [r0, r4]
	movs r5, #0x11
	ldrsb r5, [r0, r5]
	ldr r1, _08025DAC  @ gUnknown_02033F3C
	str r0, [r1]
	ldr r0, _08025DB0  @ gBmMapRange
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFill
	subs r4, #4
	ldr r2, _08025DB4  @ sub_8025CD8
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_8024FD8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08025DAC: .4byte gUnknown_02033F3C
_08025DB0: .4byte gBmMapRange
_08025DB4: .4byte sub_8025CD8

	THUMB_FUNC_END sub_8025D80

	THUMB_FUNC_START sub_8025DB8
sub_8025DB8: @ 0x08025DB8
	push {r4, r5, lr}
	movs r4, #0x10
	ldrsb r4, [r0, r4]
	movs r5, #0x11
	ldrsb r5, [r0, r5]
	ldr r1, _08025DE4  @ gUnknown_02033F3C
	str r0, [r1]
	ldr r0, _08025DE8  @ gBmMapRange
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFill
	adds r4, #4
	ldr r2, _08025DEC  @ sub_8025CD8
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_8024FD8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08025DE4: .4byte gUnknown_02033F3C
_08025DE8: .4byte gBmMapRange
_08025DEC: .4byte sub_8025CD8

	THUMB_FUNC_END sub_8025DB8

	THUMB_FUNC_START sub_8025DF0
sub_8025DF0: @ 0x08025DF0
	push {r4, r5, lr}
	movs r5, #0x10
	ldrsb r5, [r0, r5]
	movs r4, #0x11
	ldrsb r4, [r0, r4]
	ldr r1, _08025E1C  @ gUnknown_02033F3C
	str r0, [r1]
	ldr r0, _08025E20  @ gBmMapRange
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFill
	subs r4, #4
	ldr r2, _08025E24  @ sub_8025CD8
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_8024FD8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08025E1C: .4byte gUnknown_02033F3C
_08025E20: .4byte gBmMapRange
_08025E24: .4byte sub_8025CD8

	THUMB_FUNC_END sub_8025DF0

	THUMB_FUNC_START TryAddUnitToHealTargetList
TryAddUnitToHealTargetList: @ 0x08025E28
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _08025E78  @ gUnknown_02033F3C
	ldr r0, [r0]
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #0xb
	ldrsb r1, [r5, r1]
	bl AreUnitsAllied
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08025E72
	ldr r0, [r5, #0xc]
	movs r1, #0x20
	ands r0, r1
	cmp r0, #0
	bne _08025E72
	adds r0, r5, #0
	bl GetUnitCurrentHp
	adds r4, r0, #0
	adds r0, r5, #0
	bl GetUnitMaxHp
	cmp r4, r0
	beq _08025E72
	movs r0, #0x10
	ldrsb r0, [r5, r0]
	movs r1, #0x11
	ldrsb r1, [r5, r1]
	movs r2, #0xb
	ldrsb r2, [r5, r2]
	movs r3, #0
	bl AddTarget
_08025E72:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08025E78: .4byte gUnknown_02033F3C

	THUMB_FUNC_END TryAddUnitToHealTargetList

	THUMB_FUNC_START MakeTargetListForAdjacentHeal
MakeTargetListForAdjacentHeal: @ 0x08025E7C
	push {r4, r5, lr}
	movs r4, #0x10
	ldrsb r4, [r0, r4]
	movs r5, #0x11
	ldrsb r5, [r0, r5]
	ldr r1, _08025EA4  @ gUnknown_02033F3C
	str r0, [r1]
	ldr r0, _08025EA8  @ gBmMapRange
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFill
	ldr r2, _08025EAC  @ TryAddUnitToHealTargetList
	adds r0, r4, #0
	adds r1, r5, #0
	bl ForEachAdjacentUnit
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08025EA4: .4byte gUnknown_02033F3C
_08025EA8: .4byte gBmMapRange
_08025EAC: .4byte TryAddUnitToHealTargetList

	THUMB_FUNC_END MakeTargetListForAdjacentHeal

	THUMB_FUNC_START MakeTargetListForRangedHeal
MakeTargetListForRangedHeal: @ 0x08025EB0
	push {r4, r5, r6, lr}
	movs r5, #0x10
	ldrsb r5, [r0, r5]
	movs r6, #0x11
	ldrsb r6, [r0, r6]
	ldr r4, _08025EF0  @ gUnknown_02033F3C
	str r0, [r4]
	adds r0, r5, #0
	adds r1, r6, #0
	bl InitTargets
	ldr r0, _08025EF4  @ gBmMapRange
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFill
	ldr r0, [r4]
	bl GetUnitMagBy2Range
	adds r2, r0, #0
	adds r0, r5, #0
	adds r1, r6, #0
	movs r3, #1
	bl MapAddInRange
	ldr r0, _08025EF8  @ TryAddUnitToHealTargetList
	bl ForEachUnitInRange
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08025EF0: .4byte gUnknown_02033F3C
_08025EF4: .4byte gBmMapRange
_08025EF8: .4byte TryAddUnitToHealTargetList

	THUMB_FUNC_END MakeTargetListForRangedHeal

	THUMB_FUNC_START AddToTargetListIfNotAllied
AddToTargetListIfNotAllied: @ 0x08025EFC
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08025F40  @ gUnknown_02033F3C
	ldr r0, [r0]
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #0xb
	ldrsb r1, [r4, r1]
	bl AreUnitsAllied
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq _08025F3A
	adds r0, r4, #0
	adds r0, #0x30
	ldrb r1, [r0]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #0
	bne _08025F3A
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	movs r2, #0xb
	ldrsb r2, [r4, r2]
	movs r3, #0
	bl AddTarget
_08025F3A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08025F40: .4byte gUnknown_02033F3C

	THUMB_FUNC_END AddToTargetListIfNotAllied

	THUMB_FUNC_START MakeTargetListForFuckingNightmare
MakeTargetListForFuckingNightmare: @ 0x08025F44
	push {r4, r5, lr}
	movs r4, #0x10
	ldrsb r4, [r0, r4]
	movs r5, #0x11
	ldrsb r5, [r0, r5]
	ldr r1, _08025F8C  @ gUnknown_02033F3C
	str r0, [r1]
	adds r0, r4, #0
	adds r1, r5, #0
	bl InitTargets
	ldr r0, _08025F90  @ gBmMapRange
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFill
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #3
	movs r3, #1
	bl MapAddInRange
	movs r3, #1
	negs r3, r3
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0
	bl MapAddInRange
	ldr r0, _08025F94  @ AddToTargetListIfNotAllied
	bl ForEachUnitInRange
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08025F8C: .4byte gUnknown_02033F3C
_08025F90: .4byte gBmMapRange
_08025F94: .4byte AddToTargetListIfNotAllied

	THUMB_FUNC_END MakeTargetListForFuckingNightmare

	THUMB_FUNC_START TryAddUnitToRestoreTargetList
TryAddUnitToRestoreTargetList: @ 0x08025F98
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08025FE4  @ gUnknown_02033F3C
	ldr r0, [r0]
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #0xb
	ldrsb r1, [r4, r1]
	bl AreUnitsAllied
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08025FDE
	ldr r0, [r4, #0xc]
	movs r1, #0x20
	ands r0, r1
	cmp r0, #0
	bne _08025FDE
	adds r0, r4, #0
	adds r0, #0x30
	ldrb r1, [r0]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #0
	beq _08025FDE
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	movs r2, #0xb
	ldrsb r2, [r4, r2]
	movs r3, #0
	bl AddTarget
_08025FDE:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08025FE4: .4byte gUnknown_02033F3C

	THUMB_FUNC_END TryAddUnitToRestoreTargetList

	THUMB_FUNC_START MakeTargetListForRestore
MakeTargetListForRestore: @ 0x08025FE8
	push {r4, r5, lr}
	movs r4, #0x10
	ldrsb r4, [r0, r4]
	movs r5, #0x11
	ldrsb r5, [r0, r5]
	ldr r1, _08026010  @ gUnknown_02033F3C
	str r0, [r1]
	ldr r0, _08026014  @ gBmMapRange
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFill
	ldr r2, _08026018  @ TryAddUnitToRestoreTargetList
	adds r0, r4, #0
	adds r1, r5, #0
	bl ForEachAdjacentUnit
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08026010: .4byte gUnknown_02033F3C
_08026014: .4byte gBmMapRange
_08026018: .4byte TryAddUnitToRestoreTargetList

	THUMB_FUNC_END MakeTargetListForRestore

	THUMB_FUNC_START TryAddUnitToBarrierTargetList
TryAddUnitToBarrierTargetList: @ 0x0802601C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08026068  @ gUnknown_02033F3C
	ldr r0, [r0]
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #0xb
	ldrsb r1, [r4, r1]
	bl AreUnitsAllied
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08026060
	ldr r0, [r4, #0xc]
	movs r1, #0x20
	ands r0, r1
	cmp r0, #0
	bne _08026060
	adds r0, r4, #0
	adds r0, #0x31
	ldrb r0, [r0]
	lsrs r0, r0, #4
	cmp r0, #6
	bhi _08026060
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	movs r2, #0xb
	ldrsb r2, [r4, r2]
	movs r3, #0
	bl AddTarget
_08026060:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08026068: .4byte gUnknown_02033F3C

	THUMB_FUNC_END TryAddUnitToBarrierTargetList

	THUMB_FUNC_START MakeTargetListForBarrier
MakeTargetListForBarrier: @ 0x0802606C
	push {r4, r5, lr}
	movs r4, #0x10
	ldrsb r4, [r0, r4]
	movs r5, #0x11
	ldrsb r5, [r0, r5]
	ldr r1, _08026094  @ gUnknown_02033F3C
	str r0, [r1]
	ldr r0, _08026098  @ gBmMapRange
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFill
	ldr r2, _0802609C  @ TryAddUnitToBarrierTargetList
	adds r0, r4, #0
	adds r1, r5, #0
	bl ForEachAdjacentUnit
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08026094: .4byte gUnknown_02033F3C
_08026098: .4byte gBmMapRange
_0802609C: .4byte TryAddUnitToBarrierTargetList

	THUMB_FUNC_END MakeTargetListForBarrier

	THUMB_FUNC_START TryAddUnitToRescueStaffTargetList
TryAddUnitToRescueStaffTargetList: @ 0x080260A0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080260D4  @ gUnknown_02033F3C
	ldr r0, [r0]
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #0xb
	ldrsb r1, [r4, r1]
	bl AreUnitsAllied
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080260CE
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	movs r2, #0xb
	ldrsb r2, [r4, r2]
	movs r3, #0
	bl AddTarget
_080260CE:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080260D4: .4byte gUnknown_02033F3C

	THUMB_FUNC_END TryAddUnitToRescueStaffTargetList

	THUMB_FUNC_START MakeTargetListForRescueStaff
MakeTargetListForRescueStaff: @ 0x080260D8
	push {lr}
	ldr r1, _080260F4  @ gUnknown_02033F3C
	str r0, [r1]
	ldr r0, _080260F8  @ gBmMapRange
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFill
	ldr r0, _080260FC  @ TryAddUnitToRescueStaffTargetList
	bl ForEachUnitInMagBy2Range
	pop {r0}
	bx r0
	.align 2, 0
_080260F4: .4byte gUnknown_02033F3C
_080260F8: .4byte gBmMapRange
_080260FC: .4byte TryAddUnitToRescueStaffTargetList

	THUMB_FUNC_END MakeTargetListForRescueStaff

	THUMB_FUNC_START TryAddUnitToSilenceTargetList
TryAddUnitToSilenceTargetList: @ 0x08026100
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08026148  @ gUnknown_02033F3C
	ldr r0, [r0]
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #0xb
	ldrsb r1, [r4, r1]
	bl AreUnitsAllied
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08026140
	adds r0, r4, #0
	adds r0, #0x30
	ldrb r0, [r0]
	movs r1, #0xf
	ands r1, r0
	cmp r1, #0
	beq _0802612E
	cmp r1, #3
	bne _08026140
_0802612E:
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	movs r2, #0xb
	ldrsb r2, [r4, r2]
	movs r3, #0
	bl AddTarget
_08026140:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08026148: .4byte gUnknown_02033F3C

	THUMB_FUNC_END TryAddUnitToSilenceTargetList

	THUMB_FUNC_START TryAddUnitToSleepTargetList
TryAddUnitToSleepTargetList: @ 0x0802614C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08026194  @ gUnknown_02033F3C
	ldr r0, [r0]
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #0xb
	ldrsb r1, [r4, r1]
	bl AreUnitsAllied
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0802618C
	adds r0, r4, #0
	adds r0, #0x30
	ldrb r0, [r0]
	movs r1, #0xf
	ands r1, r0
	cmp r1, #0
	beq _0802617A
	cmp r1, #2
	bne _0802618C
_0802617A:
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	movs r2, #0xb
	ldrsb r2, [r4, r2]
	movs r3, #0
	bl AddTarget
_0802618C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08026194: .4byte gUnknown_02033F3C

	THUMB_FUNC_END TryAddUnitToSleepTargetList

	THUMB_FUNC_START TryAddUnitToBerzerkTargetList
TryAddUnitToBerzerkTargetList: @ 0x08026198
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080261E0  @ gUnknown_02033F3C
	ldr r0, [r0]
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #0xb
	ldrsb r1, [r4, r1]
	bl AreUnitsAllied
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080261D8
	adds r0, r4, #0
	adds r0, #0x30
	ldrb r0, [r0]
	movs r1, #0xf
	ands r1, r0
	cmp r1, #0
	beq _080261C6
	cmp r1, #4
	bne _080261D8
_080261C6:
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	movs r2, #0xb
	ldrsb r2, [r4, r2]
	movs r3, #0
	bl AddTarget
_080261D8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080261E0: .4byte gUnknown_02033F3C

	THUMB_FUNC_END TryAddUnitToBerzerkTargetList

	THUMB_FUNC_START MakeTargetListForSilence
MakeTargetListForSilence: @ 0x080261E4
	push {lr}
	ldr r1, _08026200  @ gUnknown_02033F3C
	str r0, [r1]
	ldr r0, _08026204  @ gBmMapRange
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFill
	ldr r0, _08026208  @ TryAddUnitToSilenceTargetList
	bl ForEachUnitInMagBy2Range
	pop {r0}
	bx r0
	.align 2, 0
_08026200: .4byte gUnknown_02033F3C
_08026204: .4byte gBmMapRange
_08026208: .4byte TryAddUnitToSilenceTargetList

	THUMB_FUNC_END MakeTargetListForSilence

	THUMB_FUNC_START MakeTargetListForSleep
MakeTargetListForSleep: @ 0x0802620C
	push {lr}
	ldr r1, _08026228  @ gUnknown_02033F3C
	str r0, [r1]
	ldr r0, _0802622C  @ gBmMapRange
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFill
	ldr r0, _08026230  @ TryAddUnitToSleepTargetList
	bl ForEachUnitInMagBy2Range
	pop {r0}
	bx r0
	.align 2, 0
_08026228: .4byte gUnknown_02033F3C
_0802622C: .4byte gBmMapRange
_08026230: .4byte TryAddUnitToSleepTargetList

	THUMB_FUNC_END MakeTargetListForSleep

	THUMB_FUNC_START MakeTargetListForBerserk
MakeTargetListForBerserk: @ 0x08026234
	push {lr}
	ldr r1, _08026250  @ gUnknown_02033F3C
	str r0, [r1]
	ldr r0, _08026254  @ gBmMapRange
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFill
	ldr r0, _08026258  @ TryAddUnitToBerzerkTargetList
	bl ForEachUnitInMagBy2Range
	pop {r0}
	bx r0
	.align 2, 0
_08026250: .4byte gUnknown_02033F3C
_08026254: .4byte gBmMapRange
_08026258: .4byte TryAddUnitToBerzerkTargetList

	THUMB_FUNC_END MakeTargetListForBerserk

	THUMB_FUNC_START TryAddUnitToWarpTargetList
TryAddUnitToWarpTargetList: @ 0x0802625C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08026290  @ gUnknown_02033F3C
	ldr r0, [r0]
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #0xb
	ldrsb r1, [r4, r1]
	bl AreUnitsAllied
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0802628A
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	movs r2, #0xb
	ldrsb r2, [r4, r2]
	movs r3, #0
	bl AddTarget
_0802628A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08026290: .4byte gUnknown_02033F3C

	THUMB_FUNC_END TryAddUnitToWarpTargetList

	THUMB_FUNC_START MakeTargetListForWarp
MakeTargetListForWarp: @ 0x08026294
	push {r4, r5, lr}
	movs r4, #0x10
	ldrsb r4, [r0, r4]
	movs r5, #0x11
	ldrsb r5, [r0, r5]
	ldr r1, _080262BC  @ gUnknown_02033F3C
	str r0, [r1]
	ldr r0, _080262C0  @ gBmMapRange
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFill
	ldr r2, _080262C4  @ TryAddUnitToWarpTargetList
	adds r0, r4, #0
	adds r1, r5, #0
	bl ForEachAdjacentUnit
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080262BC: .4byte gUnknown_02033F3C
_080262C0: .4byte gBmMapRange
_080262C4: .4byte TryAddUnitToWarpTargetList

	THUMB_FUNC_END MakeTargetListForWarp

	THUMB_FUNC_START MakeTargetListForUnlock
MakeTargetListForUnlock: @ 0x080262C8
	push {r4, r5, lr}
	movs r4, #0x10
	ldrsb r4, [r0, r4]
	movs r5, #0x11
	ldrsb r5, [r0, r5]
	ldr r1, _080262F0  @ gUnknown_02033F3C
	str r0, [r1]
	ldr r0, _080262F4  @ gBmMapRange
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFill
	ldr r2, _080262F8  @ TryAddClosedDoorToTargetList
	adds r0, r4, #0
	adds r1, r5, #0
	bl ForEachPosIn12Range
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080262F0: .4byte gUnknown_02033F3C
_080262F4: .4byte gBmMapRange
_080262F8: .4byte TryAddClosedDoorToTargetList

	THUMB_FUNC_END MakeTargetListForUnlock

	THUMB_FUNC_START TryAddUnitToHammerneTargetList
TryAddUnitToHammerneTargetList: @ 0x080262FC
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, _0802631C  @ gUnknown_02033F3C
	ldr r0, [r0]
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #0xb
	ldrsb r1, [r4, r1]
	bl IsSameAllegience
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0802634C
	movs r5, #0
	b _08026322
	.align 2, 0
_0802631C: .4byte gUnknown_02033F3C
_08026320:
	adds r5, #1
_08026322:
	cmp r5, #4
	bgt _0802634C
	lsls r1, r5, #1
	adds r0, r4, #0
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r0, [r0]
	bl IsItemHammernable
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08026320
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	movs r2, #0xb
	ldrsb r2, [r4, r2]
	movs r3, #0
	bl AddTarget
_0802634C:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END TryAddUnitToHammerneTargetList

	THUMB_FUNC_START MakeTargetListForHammerne
MakeTargetListForHammerne: @ 0x08026354
	push {r4, r5, lr}
	movs r4, #0x10
	ldrsb r4, [r0, r4]
	movs r5, #0x11
	ldrsb r5, [r0, r5]
	ldr r1, _0802637C  @ gUnknown_02033F3C
	str r0, [r1]
	ldr r0, _08026380  @ gBmMapRange
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFill
	ldr r2, _08026384  @ TryAddUnitToHammerneTargetList
	adds r0, r4, #0
	adds r1, r5, #0
	bl ForEachAdjacentUnit
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802637C: .4byte gUnknown_02033F3C
_08026380: .4byte gBmMapRange
_08026384: .4byte TryAddUnitToHammerneTargetList

	THUMB_FUNC_END MakeTargetListForHammerne

	THUMB_FUNC_START MakeTargetListForLatona
MakeTargetListForLatona: @ 0x08026388
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	ldrb r0, [r0, #0x10]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	mov r2, r8
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	bl InitTargets
	bl GetCurrentPhase
	adds r7, r0, #0
	adds r6, r7, #1
	b _08026400
_080263AA:
	adds r0, r6, #0
	bl GetUnit
	adds r5, r0, #0
	cmp r5, #0
	beq _080263FC
	ldr r0, [r5]
	cmp r0, #0
	beq _080263FC
	ldr r0, [r5, #0xc]
	ldr r1, _08026410  @ 0x0001000C
	ands r0, r1
	cmp r0, #0
	bne _080263FC
	adds r0, r5, #0
	bl GetUnitCurrentHp
	adds r4, r0, #0
	adds r0, r5, #0
	bl GetUnitMaxHp
	cmp r4, r0
	bne _080263E6
	adds r0, r5, #0
	adds r0, #0x30
	ldrb r1, [r0]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #0
	beq _080263FC
_080263E6:
	cmp r5, r8
	beq _080263FC
	movs r0, #0x10
	ldrsb r0, [r5, r0]
	movs r1, #0x11
	ldrsb r1, [r5, r1]
	movs r2, #0xb
	ldrsb r2, [r5, r2]
	movs r3, #0
	bl AddTarget
_080263FC:
	adds r6, #1
	adds r0, r7, #0
_08026400:
	adds r0, #0x80
	cmp r6, r0
	blt _080263AA
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08026410: .4byte 0x0001000C

	THUMB_FUNC_END MakeTargetListForLatona

	THUMB_FUNC_START sub_8026414
sub_8026414: @ 0x08026414
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	bl sub_804FD28
	adds r7, r0, #0
	movs r6, #0
	cmp r6, r7
	bge _08026460
_08026428:
	adds r0, r6, #0
	bl GetTarget
	adds r4, r0, #0
	movs r0, #2
	ldrsb r0, [r4, r0]
	bl GetUnit
	adds r5, r0, #0
	bl GetUnitCurrentHp
	movs r1, #3
	ldrsb r1, [r4, r1]
	cmp r0, r1
	bgt _0802645A
	ldr r0, [r5]
	ldrb r0, [r0, #4]
	movs r1, #0
	mov r2, r8
	bl BWL_AddWinOrLossIdk
	ldr r0, [r5]
	ldrb r0, [r0, #4]
	bl sub_80A4594
_0802645A:
	adds r6, #1
	cmp r6, r7
	blt _08026428
_08026460:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8026414

	THUMB_FUNC_START sub_802646C
sub_802646C: @ 0x0802646C
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _080264DC  @ gBmMapUnit
	ldr r0, [r0]
	lsls r2, r5, #2
	adds r0, r2, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0
	bne _080264D4
	ldr r0, _080264E0  @ gRAMChapterData
	ldrb r0, [r0, #0xd]
	cmp r0, #0
	beq _0802649C
	ldr r0, _080264E4  @ gBmMapFog
	ldr r0, [r0]
	adds r0, r2, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0
	beq _080264D4
_0802649C:
	ldr r0, _080264E8  @ gUnknown_02033F3C
	ldr r0, [r0]
	ldr r1, _080264EC  @ gBmMapTerrain
	ldr r1, [r1]
	adds r1, r2, r1
	ldr r1, [r1]
	adds r1, r1, r4
	ldrb r1, [r1]
	bl CanUnitCrossTerrain
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080264D4
	adds r0, r4, #0
	adds r1, r5, #0
	bl GetTrapAt
	cmp r0, #0
	beq _080264C8
	ldrb r0, [r0, #2]
	cmp r0, #0xa
	bne _080264D4
_080264C8:
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0
	movs r3, #0
	bl AddTarget
_080264D4:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080264DC: .4byte gBmMapUnit
_080264E0: .4byte gRAMChapterData
_080264E4: .4byte gBmMapFog
_080264E8: .4byte gUnknown_02033F3C
_080264EC: .4byte gBmMapTerrain

	THUMB_FUNC_END sub_802646C

	THUMB_FUNC_START MakeTargetListForMine
MakeTargetListForMine: @ 0x080264F0
	push {r4, r5, lr}
	movs r4, #0x10
	ldrsb r4, [r0, r4]
	movs r5, #0x11
	ldrsb r5, [r0, r5]
	ldr r1, _08026518  @ gUnknown_02033F3C
	str r0, [r1]
	ldr r0, _0802651C  @ gBmMapRange
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFill
	ldr r2, _08026520  @ sub_802646C
	adds r0, r4, #0
	adds r1, r5, #0
	bl ForEachAdjacentPosition
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08026518: .4byte gUnknown_02033F3C
_0802651C: .4byte gBmMapRange
_08026520: .4byte sub_802646C

	THUMB_FUNC_END MakeTargetListForMine

	THUMB_FUNC_START sub_8026524
sub_8026524: @ 0x08026524
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _08026574  @ gBmMapUnit
	ldr r0, [r0]
	lsls r6, r5, #2
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0
	bne _0802656C
	adds r0, r4, #0
	bl GetTrapAt
	cmp r0, #0
	bne _0802656C
	ldr r1, _08026578  @ gUnknown_0880BB96
	ldr r0, _0802657C  @ gBmMapTerrain
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	ble _0802656C
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0
	movs r3, #0
	bl AddTarget
_0802656C:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08026574: .4byte gBmMapUnit
_08026578: .4byte gUnknown_0880BB96
_0802657C: .4byte gBmMapTerrain

	THUMB_FUNC_END sub_8026524

	THUMB_FUNC_START MakeTargetListForLightRune
MakeTargetListForLightRune: @ 0x08026580
	push {r4, r5, lr}
	movs r4, #0x10
	ldrsb r4, [r0, r4]
	movs r5, #0x11
	ldrsb r5, [r0, r5]
	ldr r1, _080265A8  @ gUnknown_02033F3C
	str r0, [r1]
	ldr r0, _080265AC  @ gBmMapRange
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFill
	ldr r2, _080265B0  @ sub_8026524
	adds r0, r4, #0
	adds r1, r5, #0
	bl ForEachAdjacentPosition
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080265A8: .4byte gUnknown_02033F3C
_080265AC: .4byte gBmMapRange
_080265B0: .4byte sub_8026524

	THUMB_FUNC_END MakeTargetListForLightRune

	THUMB_FUNC_START TryAddUnitToDanceRingTargetList
TryAddUnitToDanceRingTargetList: @ 0x080265B4
	push {lr}
	adds r3, r0, #0
	movs r2, #0xb
	ldrsb r2, [r3, r2]
	movs r0, #0xc0
	ands r0, r2
	cmp r0, #0
	bne _080265E0
	adds r0, r3, #0
	adds r0, #0x30
	ldrb r1, [r0]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #0
	bne _080265E0
	movs r0, #0x10
	ldrsb r0, [r3, r0]
	movs r1, #0x11
	ldrsb r1, [r3, r1]
	movs r3, #0
	bl AddTarget
_080265E0:
	pop {r0}
	bx r0

	THUMB_FUNC_END TryAddUnitToDanceRingTargetList

	THUMB_FUNC_START MakeTargetListForDanceRing
MakeTargetListForDanceRing: @ 0x080265E4
	push {r4, r5, lr}
	movs r4, #0x10
	ldrsb r4, [r0, r4]
	movs r5, #0x11
	ldrsb r5, [r0, r5]
	ldr r1, _0802660C  @ gUnknown_02033F3C
	str r0, [r1]
	ldr r0, _08026610  @ gBmMapRange
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFill
	ldr r2, _08026614  @ TryAddUnitToDanceRingTargetList
	adds r0, r4, #0
	adds r1, r5, #0
	bl ForEachAdjacentUnit
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802660C: .4byte gUnknown_02033F3C
_08026610: .4byte gBmMapRange
_08026614: .4byte TryAddUnitToDanceRingTargetList

	THUMB_FUNC_END MakeTargetListForDanceRing

.align 2, 0
