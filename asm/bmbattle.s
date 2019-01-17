	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	@ Battle logic

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
