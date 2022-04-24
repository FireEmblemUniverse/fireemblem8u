	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	@ Staff/Item Effect Handlers and whatnot

	THUMB_FUNC_START ActionStaffDoorChestUseItem
ActionStaffDoorChestUseItem: @ 0x0802FC48
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	ldr r4, _0802FC84  @ gActionData
	ldrb r0, [r4, #0xc]
	bl GetUnit
	ldrb r1, [r4, #0x12]
	lsls r1, r1, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r0, [r0]
	bl GetItemIndex
	mov r8, r0
	ldr r0, _0802FC88  @ gBattleActor
	adds r0, #0x7e
	movs r1, #0
	strb r1, [r0]
	mov r0, r8
	subs r0, #0x4b
	cmp r0, #0x76
	bls _0802FC7A
	b _0802FF76
_0802FC7A:
	lsls r0, r0, #2
	ldr r1, _0802FC8C  @ _0802FC90
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0802FC84: .4byte gActionData
_0802FC88: .4byte gBattleActor
_0802FC8C: .4byte _0802FC90
_0802FC90: @ jump table
	.4byte _0802FE6C @ case 0
	.4byte _0802FE6C @ case 1
	.4byte _0802FE6C @ case 2
	.4byte _0802FE6C @ case 3
	.4byte _0802FE84 @ case 4
	.4byte _0802FE8C @ case 5
	.4byte _0802FE74 @ case 6
	.4byte _0802FE74 @ case 7
	.4byte _0802FE74 @ case 8
	.4byte _0802FEA4 @ case 9
	.4byte _0802FE94 @ case 10
	.4byte _0802FF60 @ case 11
	.4byte _0802FEB4 @ case 12
	.4byte _0802FEAC @ case 13
	.4byte _0802FE9C @ case 14
	.4byte _0802FF76 @ case 15
	.4byte _0802FF40 @ case 16
	.4byte _0802FF40 @ case 17
	.4byte _0802FF40 @ case 18
	.4byte _0802FF40 @ case 19
	.4byte _0802FF40 @ case 20
	.4byte _0802FF40 @ case 21
	.4byte _0802FF40 @ case 22
	.4byte _0802FF40 @ case 23
	.4byte _0802FF40 @ case 24
	.4byte _0802FEEC @ case 25
	.4byte _0802FEEC @ case 26
	.4byte _0802FEEC @ case 27
	.4byte _0802FEEC @ case 28
	.4byte _0802FEEC @ case 29
	.4byte _0802FEE6 @ case 30
	.4byte _0802FEE6 @ case 31
	.4byte _0802FEE6 @ case 32
	.4byte _0802FEC4 @ case 33
	.4byte _0802FECE @ case 34
	.4byte _0802FED6 @ case 35
	.4byte _0802FEDE @ case 36
	.4byte _0802FEBC @ case 37
	.4byte _0802FF76 @ case 38
	.4byte _0802FF76 @ case 39
	.4byte _0802FF76 @ case 40
	.4byte _0802FF76 @ case 41
	.4byte _0802FF76 @ case 42
	.4byte _0802FF76 @ case 43
	.4byte _0802FF76 @ case 44
	.4byte _0802FF76 @ case 45
	.4byte _0802FEE6 @ case 46
	.4byte _0802FF50 @ case 47
	.4byte _0802FF58 @ case 48
	.4byte _0802FF76 @ case 49
	.4byte _0802FF68 @ case 50
	.4byte _0802FF68 @ case 51
	.4byte _0802FF68 @ case 52
	.4byte _0802FF68 @ case 53
	.4byte _0802FF76 @ case 54
	.4byte _0802FF76 @ case 55
	.4byte _0802FF76 @ case 56
	.4byte _0802FF76 @ case 57
	.4byte _0802FF76 @ case 58
	.4byte _0802FF76 @ case 59
	.4byte _0802FF76 @ case 60
	.4byte _0802FEEC @ case 61
	.4byte _0802FF40 @ case 62
	.4byte _0802FEEC @ case 63
	.4byte _0802FF76 @ case 64
	.4byte _0802FF48 @ case 65
	.4byte _0802FF76 @ case 66
	.4byte _0802FF76 @ case 67
	.4byte _0802FF76 @ case 68
	.4byte _0802FF76 @ case 69
	.4byte _0802FF76 @ case 70
	.4byte _0802FF76 @ case 71
	.4byte _0802FF76 @ case 72
	.4byte _0802FF76 @ case 73
	.4byte _0802FF76 @ case 74
	.4byte _0802FF76 @ case 75
	.4byte _0802FEEC @ case 76
	.4byte _0802FEEC @ case 77
	.4byte _0802FEEC @ case 78
	.4byte _0802FF76 @ case 79
	.4byte _0802FF76 @ case 80
	.4byte _0802FF76 @ case 81
	.4byte _0802FF76 @ case 82
	.4byte _0802FF76 @ case 83
	.4byte _0802FF76 @ case 84
	.4byte _0802FF76 @ case 85
	.4byte _0802FF76 @ case 86
	.4byte _0802FEC4 @ case 87
	.4byte _0802FF76 @ case 88
	.4byte _0802FF76 @ case 89
	.4byte _0802FF76 @ case 90
	.4byte _0802FE7C @ case 91
	.4byte _0802FF76 @ case 92
	.4byte _0802FF76 @ case 93
	.4byte _0802FF76 @ case 94
	.4byte _0802FF76 @ case 95
	.4byte _0802FF76 @ case 96
	.4byte _0802FF76 @ case 97
	.4byte _0802FF76 @ case 98
	.4byte _0802FF76 @ case 99
	.4byte _0802FF76 @ case 100
	.4byte _0802FF76 @ case 101
	.4byte _0802FF76 @ case 102
	.4byte _0802FF76 @ case 103
	.4byte _0802FF76 @ case 104
	.4byte _0802FF76 @ case 105
	.4byte _0802FF76 @ case 106
	.4byte _0802FF76 @ case 107
	.4byte _0802FF70 @ case 108
	.4byte _0802FF76 @ case 109
	.4byte _0802FF76 @ case 110
	.4byte _0802FF76 @ case 111
	.4byte _0802FF76 @ case 112
	.4byte _0802FF76 @ case 113
	.4byte _0802FF76 @ case 114
	.4byte _0802FF76 @ case 115
	.4byte _0802FF76 @ case 116
	.4byte _0802FF76 @ case 117
	.4byte _0802FEEC @ case 118
_0802FE6C:
	adds r0, r6, #0
	bl ExecStandardHeal
	b _0802FF76
_0802FE74:
	adds r0, r6, #0
	bl ExecStatusStaff
	b _0802FF76
_0802FE7C:
	adds r0, r6, #0
	bl sub_802F1D8
	b _0802FF76
_0802FE84:
	adds r0, r6, #0
	bl ExecFortify
	b _0802FF76
_0802FE8C:
	adds r0, r6, #0
	bl ExecRestore
	b _0802FF76
_0802FE94:
	adds r0, r6, #0
	bl ExecRescueStaff
	b _0802FF76
_0802FE9C:
	adds r0, r6, #0
	bl sub_802EC8C
	b _0802FF76
_0802FEA4:
	adds r0, r6, #0
	bl ExecWarpStaff
	b _0802FF76
_0802FEAC:
	adds r0, r6, #0
	bl sub_802F274
	b _0802FF76
_0802FEB4:
	adds r0, r6, #0
	bl ExecHammerne
	b _0802FF76
_0802FEBC:
	adds r0, r6, #0
	bl sub_802F48C
	b _0802FF76
_0802FEC4:
	adds r0, r6, #0
	movs r1, #0xa
	bl ExecSomeSelfHeal
	b _0802FF76
_0802FECE:
	adds r0, r6, #0
	bl sub_802F3E4
	b _0802FF76
_0802FED6:
	adds r0, r6, #0
	bl sub_802F450
	b _0802FF76
_0802FEDE:
	adds r0, r6, #0
	bl sub_802F4D0
	b _0802FF76
_0802FEE6:
	bl sub_802F510
	b _0802FF76
_0802FEEC:
	ldr r4, _0802FF34  @ gActionData
	ldrb r0, [r4, #0xc]
	bl GetUnit
	ldr r5, _0802FF38  @ gBattleActor
	ldr r7, _0802FF3C  @ gBattleTarget
	ldrb r1, [r4, #0x12]
	lsls r1, r1, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r1, [r0]
	adds r2, r7, #0
	adds r2, #0x4a
	strh r1, [r2]
	ldrh r0, [r0]
	adds r1, r5, #0
	adds r1, #0x4a
	strh r0, [r1]
	ldrb r0, [r4, #0xc]
	bl GetUnit
	bl GetUnitEquippedWeapon
	adds r1, r7, #0
	adds r1, #0x48
	strh r0, [r1]
	adds r5, #0x48
	strh r0, [r5]
	adds r1, #0x27
	movs r0, #0xff
	strb r0, [r1]
	adds r0, r6, #0
	bl sub_80CCA14
	b _0802FF76
	.align 2, 0
_0802FF34: .4byte gActionData
_0802FF38: .4byte gBattleActor
_0802FF3C: .4byte gBattleTarget
_0802FF40:
	adds r0, r6, #0
	bl sub_802F914
	b _0802FF76
_0802FF48:
	adds r0, r6, #0
	bl sub_802F30C
	b _0802FF76
_0802FF50:
	adds r0, r6, #0
	bl sub_802FA4C
	b _0802FF76
_0802FF58:
	adds r0, r6, #0
	bl sub_802FA90
	b _0802FF76
_0802FF60:
	adds r0, r6, #0
	bl ExecTorchStaff
	b _0802FF76
_0802FF68:
	adds r0, r6, #0
	bl sub_802FBBC
	b _0802FF76
_0802FF70:
	adds r0, r6, #0
	bl sub_802F9E0
_0802FF76:
	mov r0, r8
	cmp r0, #0xa6
	bne _0802FF8C
	ldr r0, _0802FF88  @ gUnknown_0859BE28
	adds r1, r6, #0
	bl Proc_StartBlocking
	b _0802FFA2
	.align 2, 0
_0802FF88: .4byte gUnknown_0859BE28
_0802FF8C:
	ldr r0, _0802FFAC  @ gBattleTarget
	adds r0, #0x6f
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	blt _0802FFA2
	ldr r0, _0802FFB0  @ gUnknown_0859BE10
	adds r1, r6, #0
	bl Proc_StartBlocking
_0802FFA2:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802FFAC: .4byte gBattleTarget
_0802FFB0: .4byte gUnknown_0859BE10

	THUMB_FUNC_END ActionStaffDoorChestUseItem

	THUMB_FUNC_START ActionPick
ActionPick: @ 0x0802FFB4
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r0, _08030008  @ gBattleActor
	adds r0, #0x7e
	movs r1, #0
	strb r1, [r0]
	ldr r0, _0803000C  @ gActionData
	movs r4, #0x13
	ldrsb r4, [r0, r4]
	movs r5, #0x14
	ldrsb r5, [r0, r5]
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_808320C
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_80831C8
	ldr r0, _08030010  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0802FFEC
	movs r0, #0xb1
	bl m4aSongNumStart
_0802FFEC:
	ldr r1, _08030014  @ gBattleTarget
	adds r1, #0x6f
	movs r0, #0xff
	strb r0, [r1]
	lsls r0, r0, #0x18
	cmp r0, #0
	blt _08030002
	ldr r0, _08030018  @ gUnknown_0859BE10
	adds r1, r6, #0
	bl Proc_StartBlocking
_08030002:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08030008: .4byte gBattleActor
_0803000C: .4byte gActionData
_08030010: .4byte gRAMChapterData
_08030014: .4byte gBattleTarget
_08030018: .4byte gUnknown_0859BE10

	THUMB_FUNC_END ActionPick

	THUMB_FUNC_START sub_803001C
sub_803001C: @ 0x0803001C
	push {r4, lr}
	ldr r0, _08030048  @ gBattleTarget
	adds r4, r0, #0
	adds r4, #0x6f
	movs r0, #0
	ldrsb r0, [r4, r0]
	cmp r0, #0
	blt _08030040
	ldr r0, _0803004C  @ gActionData
	ldrb r0, [r0, #0xd]
	bl GetUnit
	movs r1, #0
	ldrsb r1, [r4, r1]
	bl SetUnitStatus
	movs r0, #0xff
	strb r0, [r4]
_08030040:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08030048: .4byte gBattleTarget
_0803004C: .4byte gActionData

	THUMB_FUNC_END sub_803001C

	THUMB_FUNC_START sub_8030050
sub_8030050: @ 0x08030050
	push {lr}
	bl sub_802F208
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8030050

.align 2, 0
