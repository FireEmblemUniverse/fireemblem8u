	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	@ Ballistae stuff
	@ Up with Arch

	THUMB_FUNC_START GetRiddenBallistaAt
GetRiddenBallistaAt: @ 0x0803795C
	push {lr}
	bl GetTrapAt
	adds r1, r0, #0
	cmp r1, #0
	beq _0803796E
	ldrb r0, [r1, #2]
	cmp r0, #1
	beq _08037972
_0803796E:
	movs r0, #0
	b _08037974
_08037972:
	movs r0, #1
_08037974:
	cmp r0, #0
	beq _08037980
	movs r0, #6
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bne _08037984
_08037980:
	movs r0, #0
	b _08037986
_08037984:
	adds r0, r1, #0
_08037986:
	pop {r1}
	bx r1

	THUMB_FUNC_END GetRiddenBallistaAt

	THUMB_FUNC_START GetBallistaItemAt
GetBallistaItemAt: @ 0x0803798C
	push {lr}
	bl GetTrapAt
	adds r1, r0, #0
	cmp r1, #0
	beq _0803799E
	ldrb r0, [r1, #2]
	cmp r0, #1
	beq _080379A2
_0803799E:
	movs r0, #0
	b _080379A4
_080379A2:
	movs r0, #1
_080379A4:
	cmp r0, #0
	beq _080379C4
	movs r2, #6
	ldrsb r2, [r1, r2]
	cmp r2, #0
	beq _080379C4
	cmp r1, #0
	beq _080379BA
	ldrb r0, [r1, #2]
	cmp r0, #1
	beq _080379BE
_080379BA:
	movs r0, #0
	b _080379C0
_080379BE:
	movs r0, #1
_080379C0:
	cmp r0, #0
	bne _080379C8
_080379C4:
	movs r0, #0
	b _080379CE
_080379C8:
	ldrb r1, [r1, #3]
	lsls r0, r2, #8
	adds r0, r1, r0
_080379CE:
	pop {r1}
	bx r1

	THUMB_FUNC_END GetBallistaItemAt

	THUMB_FUNC_START GetSomeBallistaItemAt
GetSomeBallistaItemAt: @ 0x080379D4
	push {lr}
	bl GetTrapAt
	adds r1, r0, #0
	cmp r1, #0
	beq _080379E6
	ldrb r0, [r1, #2]
	cmp r0, #1
	beq _080379EA
_080379E6:
	movs r0, #0
	b _080379EC
_080379EA:
	movs r0, #1
_080379EC:
	cmp r0, #0
	beq _080379F6
	ldrb r1, [r1, #3]
	cmp r1, #0
	bne _080379FA
_080379F6:
	movs r0, #0
	b _08037A00
_080379FA:
	movs r0, #0x80
	lsls r0, r0, #1
	adds r0, r1, r0
_08037A00:
	pop {r1}
	bx r1

	THUMB_FUNC_END GetSomeBallistaItemAt

	THUMB_FUNC_START AddBallista
AddBallista: @ 0x08037A04
	push {r4, r5, r6, lr}
	adds r5, r2, #0
	movs r2, #1
	movs r3, #0
	bl AddTrap
	adds r4, r0, #0
	adds r0, r5, #0
	bl GetItemIndex
	movs r6, #0
	strb r0, [r4, #3]
	adds r0, r5, #0
	bl MakeNewItem
	bl GetItemUses
	strb r0, [r4, #6]
	strb r6, [r4, #5]
	adds r0, r4, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	THUMB_FUNC_END AddBallista

	THUMB_FUNC_START RideBallista
RideBallista: @ 0x08037A34
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r0, #0x10
	ldrsb r0, [r5, r0]
	movs r1, #0x11
	ldrsb r1, [r5, r1]
	bl GetTrapAt
	adds r4, r0, #0
	movs r0, #1
	strb r0, [r4, #5]
	bl SMS_UpdateFromGameData
	ldr r0, [r5, #0xc]
	movs r1, #0x80
	lsls r1, r1, #4
	orrs r0, r1
	str r0, [r5, #0xc]
	movs r0, #0
	bl GetTrap
	subs r4, r4, r0
	asrs r4, r4, #3
	strb r4, [r5, #0x1c]
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END RideBallista

	THUMB_FUNC_START TryRemoveUnitFromBallista
TryRemoveUnitFromBallista: @ 0x08037A6C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0xc]
	movs r1, #0x80
	lsls r1, r1, #4
	ands r0, r1
	cmp r0, #0
	beq _08037A9C
	ldrb r0, [r4, #0x1c]
	bl GetTrap
	ldr r1, [r4, #0xc]
	ldr r2, _08037AA4  @ 0xFFFFF7FF
	ands r1, r2
	str r1, [r4, #0xc]
	movs r1, #0
	strb r1, [r0, #5]
	strb r1, [r4, #0x1c]
	ldrb r1, [r4, #0x10]
	strb r1, [r0]
	ldrb r1, [r4, #0x11]
	strb r1, [r0, #1]
	bl SMS_UpdateFromGameData
_08037A9C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08037AA4: .4byte 0xFFFFF7FF

	THUMB_FUNC_END TryRemoveUnitFromBallista

	THUMB_FUNC_START IsBallista
IsBallista: @ 0x08037AA8
	push {lr}
	cmp r0, #0
	beq _08037AB8
	ldrb r0, [r0, #2]
	cmp r0, #1
	bne _08037AB8
	movs r0, #1
	b _08037ABA
_08037AB8:
	movs r0, #0
_08037ABA:
	pop {r1}
	bx r1

	THUMB_FUNC_END IsBallista

	THUMB_FUNC_START sub_8037AC0
sub_8037AC0: @ 0x08037AC0
	push {lr}
	adds r1, r0, #0
	cmp r1, #0
	beq _08037ACE
	ldrb r0, [r1, #2]
	cmp r0, #1
	beq _08037AD2
_08037ACE:
	movs r0, #0
	b _08037AD4
_08037AD2:
	movs r0, #1
_08037AD4:
	cmp r0, #0
	beq _08037AE6
	ldrb r0, [r1, #3]
	ldrb r1, [r1, #6]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	lsls r1, r1, #8
	adds r0, r0, r1
	b _08037AE8
_08037AE6:
	movs r0, #0
_08037AE8:
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8037AC0

	THUMB_FUNC_START sub_8037AEC
sub_8037AEC: @ 0x08037AEC
	push {lr}
	adds r1, r0, #0
	cmp r1, #0
	beq _08037AFA
	ldrb r0, [r1, #2]
	cmp r0, #1
	beq _08037AFE
_08037AFA:
	movs r0, #0
	b _08037B00
_08037AFE:
	movs r0, #1
_08037B00:
	cmp r0, #0
	beq _08037B08
	ldrb r0, [r1, #3]
	b _08037B0A
_08037B08:
	movs r0, #0
_08037B0A:
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8037AEC

	THUMB_FUNC_START GetBallistaItemUses
GetBallistaItemUses: @ 0x08037B10
	push {lr}
	adds r1, r0, #0
	cmp r1, #0
	beq _08037B1E
	ldrb r0, [r1, #2]
	cmp r0, #1
	beq _08037B22
_08037B1E:
	movs r0, #0
	b _08037B24
_08037B22:
	movs r0, #1
_08037B24:
	cmp r0, #0
	beq _08037B2E
	movs r0, #6
	ldrsb r0, [r1, r0]
	b _08037B30
_08037B2E:
	movs r0, #0
_08037B30:
	pop {r1}
	bx r1

	THUMB_FUNC_END GetBallistaItemUses

	THUMB_FUNC_START sub_8037B34
sub_8037B34: @ 0x08037B34
	movs r1, #0
	strb r1, [r0, #5]
	bx lr

	THUMB_FUNC_END sub_8037B34

	THUMB_FUNC_START sub_8037B3C
sub_8037B3C: @ 0x08037B3C
	movs r1, #1
	strb r1, [r0, #5]
	bx lr

	THUMB_FUNC_END sub_8037B3C

.align 2, 0
