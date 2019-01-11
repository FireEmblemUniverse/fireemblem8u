	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	@ Battle logic

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
	ldr r4, _0802C608  @ gBattleActor
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
_0802C608: .4byte gBattleActor
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
	ldr r4, _0802C6E4  @ gBattleActor
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
_0802C6E4: .4byte gBattleActor
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
	ldr r1, _0802C8BC  @ gBattleTarget
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
	ldr r4, _0802C8C0  @ gBattleActor
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
_0802C8BC: .4byte gBattleTarget
_0802C8C0: .4byte gBattleActor

	THUMB_FUNC_START MakeSnagBattleTarget
MakeSnagBattleTarget: @ 0x0802C8C4
	push {r4, lr}
	ldr r4, _0802C91C  @ gBattleTarget
	adds r0, r4, #0
	bl ClearUnit
	movs r0, #0
	strb r0, [r4, #0xb]
	movs r0, #1
	bl GetClassData
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
_0802C91C: .4byte gBattleTarget
_0802C920: .4byte gUnknown_0202BCF0
_0802C924: .4byte gUnknown_0203A958
_0802C928: .4byte gUnknown_0202E4DC
_0802C92C:
	movs r0, #0xfe
	bl GetCharacterData
	str r0, [r4]
	b _0802C942
_0802C936:
	movs r0, #0xff
	bl GetCharacterData
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
	ldr r1, _0802C97C  @ gBattleActor
	adds r2, r1, #0
	adds r2, #0x64
	movs r4, #0
	movs r3, #0
	movs r0, #0x64
	strh r0, [r2]
	adds r1, #0x6a
	strh r3, [r1]
	ldr r1, _0802C980  @ gBattleTarget
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
_0802C97C: .4byte gBattleActor
_0802C980: .4byte gBattleTarget

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
	ldr r2, _0802CAD0  @ gBattleActor
	movs r0, #0xb
	ldrsb r0, [r2, r0]
	movs r1, #0xc0
	ands r0, r1
	adds r3, r2, #0
	cmp r0, #0
	bne _0802CAD8
	ldr r0, _0802CAD4  @ gBattleTarget
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
_0802CAD0: .4byte gBattleActor
_0802CAD4: .4byte gBattleTarget
_0802CAD8:
	ldr r2, _0802CAE8  @ gBattleTarget
	movs r0, #0xb
	ldrsb r0, [r2, r0]
	ands r0, r1
	cmp r0, #0
	beq _0802CAEC
	movs r0, #1
	b _0802CAF2
	.align 2, 0
_0802CAE8: .4byte gBattleTarget
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
	ldr r5, _0802CBC0  @ gBattleActor
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
	ldr r0, _0802CBC4  @ gBattleTarget
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
_0802CBC0: .4byte gBattleActor
_0802CBC4: .4byte gBattleTarget

	THUMB_FUNC_START sub_802CBC8
sub_802CBC8: @ 0x0802CBC8
	push {r4, lr}
	adds r1, r0, #0
	ldr r4, _0802CC14  @ gBattleTarget
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
	ldr r0, _0802CC18  @ gBattleActor
	adds r0, #0x7e
	movs r1, #1
	strb r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802CC14: .4byte gBattleTarget
_0802CC18: .4byte gBattleActor

	THUMB_FUNC_START SaveInstigatorFromBattle
SaveInstigatorFromBattle: @ 0x0802CC1C
	push {r4, lr}
	ldr r4, _0802CC34  @ gBattleActor
	movs r0, #0xb
	ldrsb r0, [r4, r0]
	bl GetUnit
	adds r1, r4, #0
	bl SaveUnitFromBattle
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802CC34: .4byte gBattleActor

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
	ldr r4, _0802CCD4  @ gBattleActor
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
_0802CCD4: .4byte gBattleActor
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
	ldr r5, _0802CE40  @ gBattleActor
	adds r0, r5, #0
	adds r1, r6, #0
	bl CopyUnitToBattleStruct
	ldr r4, _0802CE44  @ gBattleTarget
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
_0802CE40: .4byte gBattleActor
_0802CE44: .4byte gBattleTarget
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
	ldr r0, _0802CE80  @ gBattleActor
	ldr r1, _0802CE84  @ gBattleTarget
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
_0802CE80: .4byte gBattleActor
_0802CE84: .4byte gBattleTarget

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
	ldr r4, _0802CFB0  @ gBattleTarget
	ldr r5, _0802CFB4  @ gBattleActor
	b _0802CFBC
	.align 2, 0
_0802CFA4: .4byte gUnknown_0203A958
_0802CFA8: .4byte gUnknown_0203A5EC
_0802CFAC: .4byte gUnknown_0203A608
_0802CFB0: .4byte gBattleTarget
_0802CFB4: .4byte gBattleActor
_0802CFB8:
	ldr r4, _0802D034  @ gBattleActor
	ldr r5, _0802D038  @ gBattleTarget
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
	ldr r0, _0802D038  @ gBattleTarget
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
_0802D034: .4byte gBattleActor
_0802D038: .4byte gBattleTarget
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
