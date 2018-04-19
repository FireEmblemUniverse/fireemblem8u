	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	@ Unit supports

	THUMB_FUNC_START GetROMUnitSupportCount
GetROMUnitSupportCount: @ 0x080281C8
	push {lr}
	ldr r0, [r0]
	ldr r0, [r0, #0x2c]
	cmp r0, #0
	beq _080281D6
	ldrb r0, [r0, #0x15]
	b _080281D8
_080281D6:
	movs r0, #0
_080281D8:
	pop {r1}
	bx r1

	THUMB_FUNC_START GetROMUnitSupportingId
GetROMUnitSupportingId: @ 0x080281DC
	push {lr}
	ldr r0, [r0]
	ldr r0, [r0, #0x2c]
	cmp r0, #0
	beq _080281EC
	adds r0, r0, r1
	ldrb r0, [r0]
	b _080281EE
_080281EC:
	movs r0, #0
_080281EE:
	pop {r1}
	bx r1

	THUMB_FUNC_START GetUnitSupportingUnit
GetUnitSupportingUnit: @ 0x080281F4
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	bl GetROMUnitSupportingId
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	movs r0, #0xb
	ldrsb r0, [r4, r0]
	movs r1, #0xc0
	ands r0, r1
	adds r5, r0, #1
	adds r6, r0, #0
	adds r6, #0x40
	cmp r5, r6
	bge _08028234
_08028212:
	adds r0, r5, #0
	bl GetUnitStruct
	adds r4, r0, #0
	cmp r4, #0
	beq _0802822E
	ldr r0, [r4]
	cmp r0, #0
	beq _0802822E
	ldrb r0, [r0, #4]
	cmp r0, r7
	bne _0802822E
	adds r0, r4, #0
	b _08028236
_0802822E:
	adds r5, #1
	cmp r5, r6
	blt _08028212
_08028234:
	movs r0, #0
_08028236:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_START GetSupportLevelBySupportIndex
GetSupportLevelBySupportIndex: @ 0x0802823C
	push {lr}
	adds r0, #0x32
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0xf0
	ble _0802824C
	movs r0, #3
	b _0802825E
_0802824C:
	cmp r0, #0xa0
	ble _08028254
	movs r0, #2
	b _0802825E
_08028254:
	cmp r0, #0x50
	bgt _0802825C
	movs r0, #0
	b _0802825E
_0802825C:
	movs r0, #1
_0802825E:
	pop {r1}
	bx r1

	THUMB_FUNC_START GetUnitTotalSupportLevels
GetUnitTotalSupportLevels: @ 0x08028264
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	bl GetROMUnitSupportCount
	adds r5, r0, #0
	movs r4, #0
	movs r6, #0
	cmp r6, r5
	bge _08028286
_08028276:
	adds r0, r7, #0
	adds r1, r4, #0
	bl GetSupportLevelBySupportIndex
	adds r6, r6, r0
	adds r4, #1
	cmp r4, r5
	blt _08028276
_08028286:
	adds r0, r6, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_START AddSupportPoints
AddSupportPoints: @ 0x08028290
	push {r4, r5, r6, r7, lr}
	adds r2, r0, #0
	ldr r0, [r2]
	ldr r0, [r0, #0x2c]
	cmp r0, #0
	beq _080282CC
	adds r0, #0xe
	adds r0, r0, r1
	ldrb r6, [r0]
	adds r0, r2, #0
	adds r0, #0x32
	adds r7, r0, r1
	ldrb r5, [r7]
	ldr r4, _080282D4  @ gUnknown_0859B9A8
	adds r0, r2, #0
	bl GetSupportLevelBySupportIndex
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r1, [r0]
	adds r0, r5, r6
	cmp r0, r1
	ble _080282C0
	subs r6, r1, r5
_080282C0:
	adds r0, r5, r6
	strb r0, [r7]
	ldr r1, _080282D8  @ gUnknown_0202BCF0
	ldrh r0, [r1, #0x16]
	adds r0, r0, r6
	strh r0, [r1, #0x16]
_080282CC:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080282D4: .4byte gUnknown_0859B9A8
_080282D8: .4byte gUnknown_0202BCF0

	THUMB_FUNC_START sub_80282DC
sub_80282DC: @ 0x080282DC
	push {r4, lr}
	adds r3, r0, #0
	adds r3, #0x32
	adds r3, r3, r1
	ldrb r2, [r3]
	adds r2, #1
	strb r2, [r3]
	ldr r3, _0802830C  @ gUnknown_0202BCF0
	ldrh r2, [r3, #0x16]
	adds r2, #1
	strh r2, [r3, #0x16]
	ldr r2, [r0]
	ldrb r4, [r2, #4]
	bl GetROMUnitSupportingId
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r4, #0
	bl sub_802873C
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802830C: .4byte gUnknown_0202BCF0

	THUMB_FUNC_START CanUnitSupportCommandWith
CanUnitSupportCommandWith: @ 0x08028310
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	ldr r0, _08028374  @ gUnknown_0202BCF0
	ldrb r1, [r0, #0x14]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0802836E
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	bne _0802836E
	adds r0, r5, #0
	adds r1, r6, #0
	bl CanUnitsStillSupportThisChapter
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0802836E
	adds r0, r5, #0
	bl GetUnitTotalSupportLevels
	cmp r0, #4
	bgt _0802836E
	adds r0, r5, #0
	adds r1, r6, #0
	bl GetUnitSupportingUnit
	bl GetUnitTotalSupportLevels
	cmp r0, #4
	bgt _0802836E
	adds r0, r5, #0
	adds r0, #0x32
	adds r0, r0, r6
	ldrb r7, [r0]
	ldr r4, _08028378  @ gUnknown_0859B9A8
	adds r0, r5, #0
	adds r1, r6, #0
	bl GetSupportLevelBySupportIndex
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r0, [r0]
	cmp r7, #0xf1
	bne _0802837C
_0802836E:
	movs r0, #0
	b _08028386
	.align 2, 0
_08028374: .4byte gUnknown_0202BCF0
_08028378: .4byte gUnknown_0859B9A8
_0802837C:
	movs r1, #0
	cmp r7, r0
	bne _08028384
	movs r1, #1
_08028384:
	adds r0, r1, #0
_08028386:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_START GetUnitStartingSupportValue
GetUnitStartingSupportValue: @ 0x0802838C
	push {lr}
	ldr r0, [r0]
	ldr r0, [r0, #0x2c]
	cmp r0, #0
	beq _0802839E
	adds r0, #7
	adds r0, r0, r1
	ldrb r0, [r0]
	b _080283A2
_0802839E:
	movs r0, #1
	negs r0, r0
_080283A2:
	pop {r1}
	bx r1

	THUMB_FUNC_START GetSupportDataIdForOtherUnit
GetSupportDataIdForOtherUnit: @ 0x080283A8
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	lsls r1, r1, #0x18
	lsrs r7, r1, #0x18
	bl GetROMUnitSupportCount
	adds r5, r0, #0
	movs r4, #0
	cmp r4, r5
	bge _080283D6
_080283BC:
	adds r0, r6, #0
	adds r1, r4, #0
	bl GetROMUnitSupportingId
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, r7
	bne _080283D0
	adds r0, r4, #0
	b _080283DA
_080283D0:
	adds r4, #1
	cmp r4, r5
	blt _080283BC
_080283D6:
	movs r0, #1
	negs r0, r0
_080283DA:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_START sub_80283E0
sub_80283E0: @ 0x080283E0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	bl GetROMUnitSupportCount
	adds r7, r0, #0
	movs r6, #0
	cmp r6, r7
	bge _08028428
	mov r8, r6
_080283F6:
	adds r0, r5, #0
	adds r1, r6, #0
	bl GetUnitSupportingUnit
	adds r4, r0, #0
	cmp r4, #0
	beq _08028422
	ldr r0, [r5]
	ldrb r1, [r0, #4]
	adds r0, r4, #0
	bl GetSupportDataIdForOtherUnit
	adds r1, r4, #0
	adds r1, #0x32
	adds r1, r1, r0
	mov r0, r8
	strb r0, [r1]
	adds r0, r5, #0
	adds r0, #0x32
	adds r0, r0, r6
	mov r1, r8
	strb r1, [r0]
_08028422:
	adds r6, #1
	cmp r6, r7
	blt _080283F6
_08028428:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_START HandleSupportGains
HandleSupportGains: @ 0x08028434
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	ldr r1, _080284D4  @ gUnknown_0202BCF0
	ldrh r0, [r1, #0x10]
	cmp r0, #1
	beq _08028520
	ldrb r1, [r1, #0x14]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _08028520
	movs r4, #1
_08028450:
	adds r0, r4, #0
	bl GetUnitStruct
	adds r5, r0, #0
	adds r4, #1
	mov r9, r4
	cmp r5, #0
	beq _0802851A
	ldr r0, [r5]
	cmp r0, #0
	beq _0802851A
	ldr r0, [r5, #0xc]
	ldr r1, _080284D8  @ 0x0001000C
	ands r0, r1
	cmp r0, #0
	bne _0802851A
	adds r0, r5, #0
	bl GetUnitTotalSupportLevels
	cmp r0, #4
	bgt _0802851A
	adds r0, r5, #0
	bl GetROMUnitSupportCount
	mov r8, r0
	movs r7, #0
	cmp r7, r8
	bge _0802851A
_08028488:
	adds r0, r5, #0
	adds r1, r7, #0
	bl GetUnitSupportingUnit
	adds r4, r0, #0
	cmp r4, #0
	beq _08028514
	ldr r1, [r4, #0xc]
	ldr r0, _080284D8  @ 0x0001000C
	ands r0, r1
	adds r6, r1, #0
	cmp r0, #0
	bne _08028514
	movs r1, #0xb
	ldrsb r1, [r4, r1]
	movs r0, #0xc0
	ands r0, r1
	mov ip, r1
	cmp r0, #0
	bne _08028514
	movs r2, #0x10
	ldrsb r2, [r5, r2]
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	subs r1, r2, r0
	cmp r1, #0
	bge _080284C0
	subs r1, r0, r2
_080284C0:
	movs r3, #0x11
	ldrsb r3, [r5, r3]
	movs r0, #0x11
	ldrsb r0, [r4, r0]
	subs r2, r3, r0
	cmp r2, #0
	blt _080284DC
	adds r0, r1, r2
	b _080284E0
	.align 2, 0
_080284D4: .4byte gUnknown_0202BCF0
_080284D8: .4byte 0x0001000C
_080284DC:
	subs r0, r0, r3
	adds r0, r1, r0
_080284E0:
	cmp r0, #0
	beq _080284EA
	cmp r0, #1
	beq _080284F2
	b _08028514
_080284EA:
	ldrb r0, [r5, #0x1b]
	cmp r0, ip
	bne _08028514
	b _08028502
_080284F2:
	ldr r0, [r5, #0xc]
	movs r1, #0x20
	ands r0, r1
	cmp r0, #0
	bne _08028514
	ands r6, r1
	cmp r6, #0
	bne _08028514
_08028502:
	adds r0, r4, #0
	bl GetUnitTotalSupportLevels
	cmp r0, #4
	bgt _08028514
	adds r0, r5, #0
	adds r1, r7, #0
	bl AddSupportPoints
_08028514:
	adds r7, #1
	cmp r7, r8
	blt _08028488
_0802851A:
	mov r4, r9
	cmp r4, #0x3f
	ble _08028450
_08028520:
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_START GetSupportBonusEntryPtr
GetSupportBonusEntryPtr: @ 0x0802852C
	push {lr}
	adds r3, r0, #0
	ldr r2, _08028534  @ gUnknown_088B05F8
	b _08028544
	.align 2, 0
_08028534: .4byte gUnknown_088B05F8
_08028538:
	ldrb r1, [r2]
	cmp r1, r3
	bne _08028542
	adds r0, r2, #0
	b _0802854A
_08028542:
	adds r2, #8
_08028544:
	ldrb r1, [r2]
	cmp r1, #0
	bne _08028538
_0802854A:
	pop {r1}
	bx r1

	THUMB_FUNC_START StoreAddedAffinityBonusesForSupportLevel
StoreAddedAffinityBonusesForSupportLevel: @ 0x08028550
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r0, r1, #0
	adds r5, r2, #0
	bl GetSupportBonusEntryPtr
	ldrb r1, [r0, #1]
	muls r1, r5, r1
	ldrb r2, [r4, #1]
	adds r1, r1, r2
	strb r1, [r4, #1]
	ldrb r1, [r0, #2]
	muls r1, r5, r1
	ldrb r2, [r4, #2]
	adds r1, r1, r2
	strb r1, [r4, #2]
	ldrb r1, [r0, #3]
	muls r1, r5, r1
	ldrb r2, [r4, #3]
	adds r1, r1, r2
	strb r1, [r4, #3]
	ldrb r1, [r0, #4]
	muls r1, r5, r1
	ldrb r2, [r4, #4]
	adds r1, r1, r2
	strb r1, [r4, #4]
	ldrb r1, [r0, #5]
	muls r1, r5, r1
	ldrb r2, [r4, #5]
	adds r1, r1, r2
	strb r1, [r4, #5]
	ldrb r0, [r0, #6]
	muls r0, r5, r0
	ldrb r1, [r4, #6]
	adds r0, r0, r1
	strb r0, [r4, #6]
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_START sub_80285A0
sub_80285A0: @ 0x080285A0
	movs r1, #0
	strb r1, [r0, #1]
	strb r1, [r0, #2]
	strb r1, [r0, #3]
	strb r1, [r0, #4]
	strb r1, [r0, #5]
	strb r1, [r0, #6]
	bx lr

	THUMB_FUNC_START GetUnitSupportBonuses
GetUnitSupportBonuses: @ 0x080285B0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r7, r0, #0
	adds r6, r1, #0
	movs r0, #0
	mov r9, r0
	adds r0, r6, #0
	bl sub_80285A0
	adds r0, r7, #0
	bl GetROMUnitSupportCount
	mov sl, r0
	movs r1, #0
	mov r8, r1
	cmp r9, sl
	bge _0802867C
	subs r0, #1
	str r0, [sp]
_080285DE:
	mov r1, r9
	asrs r1, r1, #1
	mov r9, r1
	adds r0, r7, #0
	mov r1, r8
	bl GetUnitSupportingUnit
	adds r5, r0, #0
	cmp r5, #0
	beq _08028674
	ldr r0, _080286B4  @ gUnknown_0202BCB0
	ldrb r1, [r0, #4]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	bne _08028624
	movs r2, #0x10
	ldrsb r2, [r7, r2]
	movs r0, #0x10
	ldrsb r0, [r5, r0]
	subs r1, r2, r0
	cmp r1, #0
	bge _0802860E
	subs r1, r0, r2
_0802860E:
	movs r3, #0x11
	ldrsb r3, [r7, r3]
	movs r2, #0x11
	ldrsb r2, [r5, r2]
	subs r0, r3, r2
	cmp r0, #0
	bge _0802861E
	subs r0, r2, r3
_0802861E:
	adds r0, r1, r0
	cmp r0, #3
	bgt _08028674
_08028624:
	ldr r0, [r5, #0xc]
	ldr r1, _080286B8  @ 0x0001002C
	ands r0, r1
	cmp r0, #0
	bne _08028674
	ldr r0, [r7]
	ldrb r1, [r0, #4]
	adds r0, r5, #0
	bl GetSupportDataIdForOtherUnit
	adds r1, r0, #0
	adds r0, r5, #0
	bl GetSupportLevelBySupportIndex
	adds r4, r0, #0
	ldr r0, [r5]
	ldrb r1, [r0, #9]
	adds r0, r6, #0
	adds r2, r4, #0
	bl StoreAddedAffinityBonusesForSupportLevel
	adds r0, r7, #0
	mov r1, r8
	bl GetSupportLevelBySupportIndex
	adds r5, r0, #0
	ldr r0, [r7]
	ldrb r1, [r0, #9]
	adds r0, r6, #0
	adds r2, r5, #0
	bl StoreAddedAffinityBonusesForSupportLevel
	cmp r4, #0
	beq _08028674
	cmp r5, #0
	beq _08028674
	movs r0, #1
	ldr r1, [sp]
	lsls r0, r1
	add r9, r0
_08028674:
	movs r0, #1
	add r8, r0
	cmp r8, sl
	blt _080285DE
_0802867C:
	ldrb r0, [r6, #1]
	lsrs r0, r0, #1
	strb r0, [r6, #1]
	ldrb r0, [r6, #2]
	lsrs r0, r0, #1
	strb r0, [r6, #2]
	ldrb r0, [r6, #3]
	lsrs r0, r0, #1
	strb r0, [r6, #3]
	ldrb r0, [r6, #4]
	lsrs r0, r0, #1
	strb r0, [r6, #4]
	ldrb r0, [r6, #5]
	lsrs r0, r0, #1
	strb r0, [r6, #5]
	ldrb r0, [r6, #6]
	lsrs r0, r0, #1
	strb r0, [r6, #6]
	mov r0, r9
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080286B4: .4byte gUnknown_0202BCB0
_080286B8: .4byte 0x0001002C

	THUMB_FUNC_START sub_80286BC
sub_80286BC: @ 0x080286BC
	push {lr}
	ldr r0, [r0]
	ldrb r0, [r0, #9]
	cmp r0, #0
	beq _080286CA
	adds r0, #0x79
	b _080286CE
_080286CA:
	movs r0, #1
	negs r0, r0
_080286CE:
	pop {r1}
	bx r1

	THUMB_FUNC_START sub_80286D4
sub_80286D4: @ 0x080286D4
	push {lr}
	bl GetROMCharStruct
	ldrb r0, [r0, #9]
	cmp r0, #0
	beq _080286E4
	adds r0, #0x79
	b _080286E8
_080286E4:
	movs r0, #1
	negs r0, r0
_080286E8:
	pop {r1}
	bx r1

	THUMB_FUNC_START sub_80286EC
sub_80286EC: @ 0x080286EC
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r1, _0802870C  @ gUnknown_080D7C14
	mov r0, sp
	movs r2, #4
	bl memcpy
	mov r1, sp
	adds r0, r1, r4
	ldrb r0, [r0]
	add sp, #4
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0802870C: .4byte gUnknown_080D7C14

	THUMB_FUNC_START sub_8028710
sub_8028710: @ 0x08028710
	push {r4, r5, lr}
	sub sp, #0x20
	mov r2, sp
	ldr r1, _08028738  @ gUnknown_080D7C18
	ldm r1!, {r3, r4, r5}
	stm r2!, {r3, r4, r5}
	ldm r1!, {r3, r4, r5}
	stm r2!, {r3, r4, r5}
	ldm r1!, {r3, r4}
	stm r2!, {r3, r4}
	lsls r0, r0, #2
	add r0, sp
	ldr r0, [r0]
	bl GetStringFromIndex
	add sp, #0x20
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08028738: .4byte gUnknown_080D7C18

	THUMB_FUNC_START sub_802873C
sub_802873C: @ 0x0802873C
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r5, r1, #0
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	adds r0, r6, #0
	bl GetUnitByCharId
	adds r7, r0, #0
	adds r1, r5, #0
	bl GetSupportDataIdForOtherUnit
	adds r3, r0, #0
	adds r2, r7, #0
	adds r2, #0x39
	movs r4, #1
	adds r0, r4, #0
	lsls r0, r3
	ldrb r1, [r2]
	orrs r0, r1
	strb r0, [r2]
	adds r0, r5, #0
	bl GetUnitByCharId
	adds r7, r0, #0
	adds r1, r6, #0
	bl GetSupportDataIdForOtherUnit
	adds r3, r0, #0
	adds r1, r7, #0
	adds r1, #0x39
	lsls r4, r3
	ldrb r0, [r1]
	orrs r4, r0
	strb r4, [r1]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_START CanUnitsStillSupportThisChapter
CanUnitsStillSupportThisChapter: @ 0x0802878C
	adds r0, #0x39
	movs r2, #1
	lsls r2, r1
	ldrb r0, [r0]
	ands r2, r0
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	negs r0, r2
	orrs r0, r2
	lsrs r0, r0, #0x1f
	bx lr

	THUMB_FUNC_START sub_80287A4
sub_80287A4: @ 0x080287A4
	push {r4, r5, lr}
	adds r4, r1, #0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	bl GetUnitByCharId
	adds r5, r0, #0
	adds r1, r4, #0
	bl GetSupportDataIdForOtherUnit
	adds r1, r0, #0
	adds r0, r5, #0
	bl GetSupportLevelBySupportIndex
	cmp r0, #2
	bgt _080287CC
	movs r0, #0
	b _080287CE
_080287CC:
	movs r0, #1
_080287CE:
	pop {r4, r5}
	pop {r1}
	bx r1

.align 2, 0
