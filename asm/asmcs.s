	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	@ Most "ASMCs" are here (functions called through chapter events)

	@ Exceptions include the Suspend effect function and probably other
	@ system (non-chapter) functions called through events

	THUMB_FUNC_START sub_8084880
sub_8084880: @ 0x08084880
	push {r4, r5, r6, lr}
	sub sp, #0x20
	movs r6, #0
	movs r5, #0
	ldr r1, _080848D0  @ gUnknown_089ED67C
	ldr r0, [r1, #0xc]
	cmp r0, #0
	beq _080848B4
	adds r4, r1, #0
	adds r4, #0xc
_08084894:
	ldr r0, [r4]
	bl _call_via_r0
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _080848AA
	mov r1, sp
	adds r0, r1, r5
	strb r6, [r0]
	adds r5, #1
_080848AA:
	adds r4, #0x18
	adds r6, #1
	ldr r0, [r4]
	cmp r0, #0
	bne _08084894
_080848B4:
	cmp r5, #0
	beq _080848D4
	bl GetGameClock
	adds r1, r0, #0
	movs r0, #0x3f
	ands r0, r1
	adds r1, r5, #0
	bl __umodsi3
	add r0, sp
	ldrb r0, [r0]
	b _080848D6
	.align 2, 0
_080848D0: .4byte gUnknown_089ED67C
_080848D4:
	movs r0, #0xff
_080848D6:
	add sp, #0x20
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8084880

	THUMB_FUNC_START sub_80848E0
sub_80848E0: @ 0x080848E0
	push {r4, r5, r6, lr}
	sub sp, #0x20
	movs r6, #0
	movs r5, #0
	ldr r1, _08084930  @ gUnknown_089ED694
	ldr r0, [r1, #0xc]
	cmp r0, #0
	beq _08084914
	adds r4, r1, #0
	adds r4, #0xc
_080848F4:
	ldr r0, [r4]
	bl _call_via_r0
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _0808490A
	mov r1, sp
	adds r0, r1, r5
	strb r6, [r0]
	adds r5, #1
_0808490A:
	adds r4, #0x18
	adds r6, #1
	ldr r0, [r4]
	cmp r0, #0
	bne _080848F4
_08084914:
	cmp r5, #0
	beq _08084934
	bl GetGameClock
	adds r1, r0, #0
	movs r0, #0x3f
	ands r0, r1
	adds r1, r5, #0
	bl __umodsi3
	add r0, sp
	ldrb r0, [r0]
	b _08084936
	.align 2, 0
_08084930: .4byte gUnknown_089ED694
_08084934:
	movs r0, #0xff
_08084936:
	add sp, #0x20
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80848E0

	THUMB_FUNC_START sub_8084940
sub_8084940: @ 0x08084940
	push {r4, r5, r6, lr}
	sub sp, #0x20
	movs r6, #0
	movs r5, #0
	ldr r1, _08084990  @ gUnknown_089ED6AC
	ldr r0, [r1, #0xc]
	cmp r0, #0
	beq _08084974
	adds r4, r1, #0
	adds r4, #0xc
_08084954:
	ldr r0, [r4]
	bl _call_via_r0
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _0808496A
	mov r1, sp
	adds r0, r1, r5
	strb r6, [r0]
	adds r5, #1
_0808496A:
	adds r4, #0x18
	adds r6, #1
	ldr r0, [r4]
	cmp r0, #0
	bne _08084954
_08084974:
	cmp r5, #0
	beq _08084994
	bl GetGameClock
	adds r1, r0, #0
	movs r0, #0x3f
	ands r0, r1
	adds r1, r5, #0
	bl __umodsi3
	add r0, sp
	ldrb r0, [r0]
	b _08084996
	.align 2, 0
_08084990: .4byte gUnknown_089ED6AC
_08084994:
	movs r0, #0xff
_08084996:
	add sp, #0x20
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8084940

	THUMB_FUNC_START sub_80849A0
sub_80849A0: @ 0x080849A0
	push {r4, lr}
	movs r4, #0
	ldr r1, _080849D4  @ gUnknown_089ED6AC
	ldr r0, [r1, #0xc]
	cmp r0, #0
	beq _080849B8
	adds r1, #0xc
_080849AE:
	adds r1, #0x18
	adds r4, #1
	ldr r0, [r1]
	cmp r0, #0
	bne _080849AE
_080849B8:
	bl GetGameClock
	movs r1, #0xf
	ands r1, r0
	adds r0, r1, #0
	adds r1, r4, #0
	bl __umodsi3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080849D4: .4byte gUnknown_089ED6AC

	THUMB_FUNC_END sub_80849A0

	THUMB_FUNC_START sub_80849D8
sub_80849D8: @ 0x080849D8
	push {r4, lr}
	movs r4, #0
	ldr r1, _08084A0C  @ gUnknown_089ED6AC
	ldr r0, [r1, #0xc]
	cmp r0, #0
	beq _080849F0
	adds r1, #0xc
_080849E6:
	adds r1, #0x18
	adds r4, #1
	ldr r0, [r1]
	cmp r0, #0
	bne _080849E6
_080849F0:
	bl GetGameClock
	lsrs r0, r0, #1
	movs r1, #0xf
	ands r0, r1
	adds r1, r4, #0
	bl __umodsi3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08084A0C: .4byte gUnknown_089ED6AC

	THUMB_FUNC_END sub_80849D8

	THUMB_FUNC_START sub_8084A10
sub_8084A10: @ 0x08084A10
	push {r4, lr}
	movs r4, #0
	ldr r1, _08084A44  @ gUnknown_089ED6AC
	ldr r0, [r1, #0xc]
	cmp r0, #0
	beq _08084A28
	adds r1, #0xc
_08084A1E:
	adds r1, #0x18
	adds r4, #1
	ldr r0, [r1]
	cmp r0, #0
	bne _08084A1E
_08084A28:
	bl GetGameClock
	lsrs r0, r0, #2
	movs r1, #0xf
	ands r0, r1
	adds r1, r4, #0
	bl __umodsi3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08084A44: .4byte gUnknown_089ED6AC

	THUMB_FUNC_END sub_8084A10

	THUMB_FUNC_START sub_8084A48
sub_8084A48: @ 0x08084A48
	push {r4, lr}
	movs r4, #1
_08084A4C:
	adds r0, r4, #0
	bl GetUnit
	adds r4, #1
	cmp r4, #0x3f
	ble _08084A4C
	movs r0, #0
	cmp r0, #2
	bne _08084A60
	movs r0, #1
_08084A60:
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8084A48

	THUMB_FUNC_START sub_8084A68
sub_8084A68: @ 0x08084A68
	push {r4, lr}
	movs r4, #1
_08084A6C:
	adds r0, r4, #0
	bl GetUnit
	adds r4, #1
	cmp r4, #0x3f
	ble _08084A6C
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8084A68

	THUMB_FUNC_START sub_8084A80
sub_8084A80: @ 0x08084A80
	movs r0, #1
	bx lr

	THUMB_FUNC_END sub_8084A80

	THUMB_FUNC_START sub_8084A84
sub_8084A84: @ 0x08084A84
	movs r0, #0
	bx lr

	THUMB_FUNC_END sub_8084A84

	THUMB_FUNC_START sub_8084A88
sub_8084A88: @ 0x08084A88
	movs r0, #0
	bx lr

	THUMB_FUNC_END sub_8084A88

	THUMB_FUNC_START sub_8084A8C
sub_8084A8C: @ 0x08084A8C
	movs r0, #0
	bx lr

	THUMB_FUNC_END sub_8084A8C

	THUMB_FUNC_START sub_8084A90
sub_8084A90: @ 0x08084A90
	movs r0, #0
	bx lr

	THUMB_FUNC_END sub_8084A90

	THUMB_FUNC_START sub_8084A94
sub_8084A94: @ 0x08084A94
	movs r0, #0
	bx lr

	THUMB_FUNC_END sub_8084A94

	THUMB_FUNC_START sub_8084A98
sub_8084A98: @ 0x08084A98
	movs r0, #0
	bx lr

	THUMB_FUNC_END sub_8084A98

	THUMB_FUNC_START sub_8084A9C
sub_8084A9C: @ 0x08084A9C
	movs r0, #0
	bx lr

	THUMB_FUNC_END sub_8084A9C

	THUMB_FUNC_START sub_8084AA0
sub_8084AA0: @ 0x08084AA0
	movs r0, #0
	bx lr

	THUMB_FUNC_END sub_8084AA0

	THUMB_FUNC_START sub_8084AA4
sub_8084AA4: @ 0x08084AA4
	movs r0, #0
	bx lr

	THUMB_FUNC_END sub_8084AA4

	THUMB_FUNC_START sub_8084AA8
sub_8084AA8: @ 0x08084AA8
	movs r0, #0
	bx lr

	THUMB_FUNC_END sub_8084AA8

	THUMB_FUNC_START sub_8084AAC
sub_8084AAC: @ 0x08084AAC
	movs r0, #0
	bx lr

	THUMB_FUNC_END sub_8084AAC

	THUMB_FUNC_START sub_8084AB0
sub_8084AB0: @ 0x08084AB0
	movs r0, #0
	bx lr

	THUMB_FUNC_END sub_8084AB0

	THUMB_FUNC_START sub_8084AB4
sub_8084AB4: @ 0x08084AB4
	movs r0, #0
	bx lr

	THUMB_FUNC_END sub_8084AB4

	THUMB_FUNC_START sub_8084AB8
sub_8084AB8: @ 0x08084AB8
	movs r0, #0
	bx lr

	THUMB_FUNC_END sub_8084AB8

	THUMB_FUNC_START sub_8084ABC
sub_8084ABC: @ 0x08084ABC
	movs r0, #0
	bx lr

	THUMB_FUNC_END sub_8084ABC

	THUMB_FUNC_START sub_8084AC0
sub_8084AC0: @ 0x08084AC0
	movs r0, #0
	bx lr

	THUMB_FUNC_END sub_8084AC0

	THUMB_FUNC_START sub_8084AC4
sub_8084AC4: @ 0x08084AC4
	movs r0, #0
	bx lr

	THUMB_FUNC_END sub_8084AC4

	THUMB_FUNC_START sub_8084AC8
sub_8084AC8: @ 0x08084AC8
	movs r0, #0
	bx lr

	THUMB_FUNC_END sub_8084AC8

	THUMB_FUNC_START sub_8084ACC
sub_8084ACC: @ 0x08084ACC
	movs r0, #0
	bx lr

	THUMB_FUNC_END sub_8084ACC

	THUMB_FUNC_START sub_8084AD0
sub_8084AD0: @ 0x08084AD0
	movs r0, #0
	bx lr

	THUMB_FUNC_END sub_8084AD0

	THUMB_FUNC_START sub_8084AD4
sub_8084AD4: @ 0x08084AD4
	movs r0, #0
	bx lr

	THUMB_FUNC_END sub_8084AD4

	THUMB_FUNC_START sub_8084AD8
sub_8084AD8: @ 0x08084AD8
	movs r0, #0
	bx lr

	THUMB_FUNC_END sub_8084AD8

	THUMB_FUNC_START sub_8084ADC
sub_8084ADC: @ 0x08084ADC
	push {lr}
	bl DeletePlayerPhaseInterface6Cs
	movs r0, #0x80
	lsls r0, r0, #1
	bl GetUnitFromCharId
	movs r1, #0
	bl sub_802F760
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8084ADC

	THUMB_FUNC_START sub_8084AF4
sub_8084AF4: @ 0x08084AF4
	push {r4, lr}
	movs r4, #1
_08084AF8:
	adds r0, r4, #0
	bl GetUnit
	adds r4, #1
	cmp r4, #0x3f
	ble _08084AF8
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8084AF4

	THUMB_FUNC_START sub_8084B0C
sub_8084B0C: @ 0x08084B0C
	push {r4, lr}
	movs r0, #0
	bl GetTrap
	adds r4, r0, #0
	b _08084B26
_08084B18:
	cmp r0, #0xd
	bne _08084B24
	adds r0, r4, #0
	bl RemoveLightRune
	subs r4, #8
_08084B24:
	adds r4, #8
_08084B26:
	ldrb r0, [r4, #2]
	cmp r0, #0
	bne _08084B18
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8084B0C

	THUMB_FUNC_START sub_8084B34
sub_8084B34: @ 0x08084B34
	push {lr}
	movs r0, #0xfe
	bl SoftReset
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8084B34

	THUMB_FUNC_START sub_8084B40
sub_8084B40: @ 0x08084B40
	push {lr}
	ldr r0, _08084B54  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _08084B58
	movs r0, #1
	b _08084B5A
	.align 2, 0
_08084B54: .4byte gKeyStatusPtr
_08084B58:
	movs r0, #0
_08084B5A:
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8084B40

	THUMB_FUNC_START sub_8084B60
sub_8084B60: @ 0x08084B60
	push {lr}
	movs r0, #0xfe
	bl SoftReset
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8084B60

	THUMB_FUNC_START sub_8084B6C
sub_8084B6C: @ 0x08084B6C
	push {lr}
	ldr r0, _08084B80  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _08084B84
	movs r0, #0
	b _08084B86
	.align 2, 0
_08084B80: .4byte gKeyStatusPtr
_08084B84:
	movs r0, #1
_08084B86:
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8084B6C

	THUMB_FUNC_START sub_8084B8C
sub_8084B8C: @ 0x08084B8C
	push {lr}
	movs r0, #0
	bl sub_801E2E0
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8084B8C

	THUMB_FUNC_START sub_8084B98
sub_8084B98: @ 0x08084B98
	push {lr}
	bl GetPartyGoldAmount
	ldr r1, _08084BAC  @ 0x00001388
	adds r0, r0, r1
	bl SetPartyGoldAmount
	pop {r0}
	bx r0
	.align 2, 0
_08084BAC: .4byte 0x00001388

	THUMB_FUNC_END sub_8084B98

	THUMB_FUNC_START sub_8084BB0
sub_8084BB0: @ 0x08084BB0
	push {r4, lr}
	adds r4, r0, #0
	bl GetPartyGoldAmount
	cmp r0, r4
	blt _08084BC6
	bl GetPartyGoldAmount
	subs r0, r0, r4
	bl SetPartyGoldAmount
_08084BC6:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8084BB0

	THUMB_FUNC_START sub_8084BCC
sub_8084BCC: @ 0x08084BCC
	push {lr}
	adds r1, r0, #0
	ldrb r2, [r1, #0x12]
	movs r0, #0x12
	ldrsb r0, [r1, r0]
	cmp r0, #0
	ble _08084BDE
	subs r0, r2, #1
	strb r0, [r1, #0x12]
_08084BDE:
	ldrb r2, [r1, #0x14]
	movs r0, #0x14
	ldrsb r0, [r1, r0]
	cmp r0, #0
	ble _08084BEC
	subs r0, r2, #1
	strb r0, [r1, #0x14]
_08084BEC:
	ldrb r2, [r1, #0x15]
	movs r0, #0x15
	ldrsb r0, [r1, r0]
	cmp r0, #0
	ble _08084BFA
	subs r0, r2, #1
	strb r0, [r1, #0x15]
_08084BFA:
	ldrb r2, [r1, #0x16]
	movs r0, #0x16
	ldrsb r0, [r1, r0]
	cmp r0, #0
	ble _08084C08
	subs r0, r2, #1
	strb r0, [r1, #0x16]
_08084C08:
	ldrb r2, [r1, #0x17]
	movs r0, #0x17
	ldrsb r0, [r1, r0]
	cmp r0, #0
	ble _08084C16
	subs r0, r2, #1
	strb r0, [r1, #0x17]
_08084C16:
	ldrb r2, [r1, #0x18]
	movs r0, #0x18
	ldrsb r0, [r1, r0]
	cmp r0, #0
	ble _08084C24
	subs r0, r2, #1
	strb r0, [r1, #0x18]
_08084C24:
	ldrb r2, [r1, #0x19]
	movs r0, #0x19
	ldrsb r0, [r1, r0]
	cmp r0, #0
	ble _08084C32
	subs r0, r2, #1
	strb r0, [r1, #0x19]
_08084C32:
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8084BCC

	THUMB_FUNC_START sub_8084C38
sub_8084C38: @ 0x08084C38
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl GetUnitFromCharId
	bl sub_8084BCC
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8084C38

	THUMB_FUNC_START sub_8084C4C
sub_8084C4C: @ 0x08084C4C
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	movs r4, #1
_08084C54:
	adds r0, r4, #0
	bl GetUnit
	cmp r0, #0
	beq _08084C7C
	ldr r2, [r0]
	cmp r2, #0
	beq _08084C7C
	ldr r0, [r0, #0xc]
	ldr r1, _08084C78  @ 0x0001000C
	ands r0, r1
	cmp r0, #0
	bne _08084C7C
	ldrb r0, [r2, #4]
	cmp r0, r5
	bne _08084C7C
	movs r0, #1
	b _08084C84
	.align 2, 0
_08084C78: .4byte 0x0001000C
_08084C7C:
	adds r4, #1
	cmp r4, #0x3f
	ble _08084C54
	movs r0, #0
_08084C84:
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8084C4C

	THUMB_FUNC_START sub_8084C8C
sub_8084C8C: @ 0x08084C8C
	push {lr}
	movs r0, #0
	bl sub_8084C4C
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8084C8C

	THUMB_FUNC_START sub_8084C9C
sub_8084C9C: @ 0x08084C9C
	push {lr}
	movs r0, #0
	bl sub_8084C4C
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8084C9C

	THUMB_FUNC_START sub_8084CAC
sub_8084CAC: @ 0x08084CAC
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	movs r4, #1
_08084CB4:
	adds r0, r4, #0
	bl GetUnit
	cmp r0, #0
	beq _08084CD8
	ldr r2, [r0]
	cmp r2, #0
	beq _08084CD8
	ldr r0, [r0, #0xc]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	bne _08084CD8
	ldrb r0, [r2, #4]
	cmp r0, r5
	bne _08084CD8
	movs r0, #1
	b _08084CE0
_08084CD8:
	adds r4, #1
	cmp r4, #0x3f
	ble _08084CB4
	movs r0, #0
_08084CE0:
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8084CAC

	THUMB_FUNC_START sub_8084CE8
sub_8084CE8: @ 0x08084CE8
	push {lr}
	movs r0, #0
	bl sub_8084CAC
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8084CE8

	THUMB_FUNC_START sub_8084CF8
sub_8084CF8: @ 0x08084CF8
	push {lr}
	movs r0, #0
	bl sub_8084CAC
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8084CF8

	THUMB_FUNC_START sub_8084D08
sub_8084D08: @ 0x08084D08
	push {lr}
	movs r0, #0
	bl sub_8084CAC
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8084D08

	THUMB_FUNC_START sub_8084D18
sub_8084D18: @ 0x08084D18
	push {lr}
	movs r0, #0
	bl sub_8084CAC
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8084D18

	THUMB_FUNC_START sub_8084D28
sub_8084D28: @ 0x08084D28
	push {lr}
	movs r0, #0
	bl sub_8084CAC
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8084D28

	THUMB_FUNC_START sub_8084D38
sub_8084D38: @ 0x08084D38
	push {lr}
	movs r0, #0
	bl sub_8084CAC
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8084D38

	THUMB_FUNC_START sub_8084D48
sub_8084D48: @ 0x08084D48
	push {lr}
	movs r0, #0
	bl sub_8084CAC
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8084D48

	THUMB_FUNC_START sub_8084D58
sub_8084D58: @ 0x08084D58
	push {lr}
	movs r0, #0
	bl sub_8084CAC
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8084D58

	THUMB_FUNC_START sub_8084D68
sub_8084D68: @ 0x08084D68
	push {lr}
	movs r0, #0
	bl sub_8084CAC
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8084D68

	THUMB_FUNC_START sub_8084D78
sub_8084D78: @ 0x08084D78
	push {lr}
	movs r0, #0
	bl sub_8084CAC
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8084D78

	THUMB_FUNC_START sub_8084D88
sub_8084D88: @ 0x08084D88
	push {lr}
	movs r0, #0
	bl sub_8084CAC
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8084D88

	THUMB_FUNC_START sub_8084D98
sub_8084D98: @ 0x08084D98
	push {lr}
	movs r0, #0
	bl sub_8084CAC
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8084D98

	THUMB_FUNC_START sub_8084DA8
sub_8084DA8: @ 0x08084DA8
	push {lr}
	movs r0, #0
	bl sub_8084CAC
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8084DA8

	THUMB_FUNC_START sub_8084DB8
sub_8084DB8: @ 0x08084DB8
	push {lr}
	movs r0, #0
	bl sub_8084CAC
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8084DB8

	THUMB_FUNC_START sub_8084DC8
sub_8084DC8: @ 0x08084DC8
	push {lr}
	movs r0, #0
	bl sub_8084CAC
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8084DC8

	THUMB_FUNC_START sub_8084DD8
sub_8084DD8: @ 0x08084DD8
	push {lr}
	movs r0, #0
	bl sub_8084CAC
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8084DD8

	THUMB_FUNC_START sub_8084DE8
sub_8084DE8: @ 0x08084DE8
	push {lr}
	movs r0, #0
	bl sub_8084CAC
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8084DE8

	THUMB_FUNC_START sub_8084DF8
sub_8084DF8: @ 0x08084DF8
	push {lr}
	movs r0, #0
	bl sub_8084CAC
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8084DF8

	THUMB_FUNC_START sub_8084E08
sub_8084E08: @ 0x08084E08
	push {lr}
	movs r0, #0
	bl sub_8084CAC
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8084E08

	THUMB_FUNC_START sub_8084E18
sub_8084E18: @ 0x08084E18
	push {lr}
	movs r0, #0
	bl sub_8084CAC
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8084E18

	THUMB_FUNC_START sub_8084E28
sub_8084E28: @ 0x08084E28
	push {lr}
	movs r0, #0
	bl sub_8084CAC
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8084E28

	THUMB_FUNC_START sub_8084E38
sub_8084E38: @ 0x08084E38
	push {lr}
	movs r0, #0
	bl sub_8084CAC
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8084E38

	THUMB_FUNC_START sub_8084E48
sub_8084E48: @ 0x08084E48
	push {lr}
	movs r0, #0
	bl sub_8084CAC
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8084E48

	THUMB_FUNC_START sub_8084E58
sub_8084E58: @ 0x08084E58
	push {lr}
	movs r0, #0
	bl sub_8084CAC
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8084E58

	THUMB_FUNC_START sub_8084E68
sub_8084E68: @ 0x08084E68
	push {lr}
	movs r0, #0
	bl sub_8084CAC
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8084E68

	THUMB_FUNC_START sub_8084E78
sub_8084E78: @ 0x08084E78
	push {lr}
	movs r0, #0
	bl sub_8084CAC
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8084E78

	THUMB_FUNC_START sub_8084E88
sub_8084E88: @ 0x08084E88
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	movs r4, #1
_08084E90:
	adds r0, r4, #0
	bl GetUnit
	cmp r0, #0
	beq _08084EAA
	ldr r0, [r0]
	cmp r0, #0
	beq _08084EAA
	ldrb r0, [r0, #4]
	cmp r0, r5
	bne _08084EAA
	movs r0, #1
	b _08084EB2
_08084EAA:
	adds r4, #1
	cmp r4, #0x3f
	ble _08084E90
	movs r0, #0
_08084EB2:
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8084E88

	THUMB_FUNC_START sub_8084EB8
sub_8084EB8: @ 0x08084EB8
	push {lr}
	movs r0, #0
	bl sub_8084E88
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8084EB8

	THUMB_FUNC_START sub_8084EC8
sub_8084EC8: @ 0x08084EC8
	push {lr}
	movs r0, #0
	bl sub_8084E88
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8084EC8

	THUMB_FUNC_START sub_8084ED8
sub_8084ED8: @ 0x08084ED8
	push {lr}
	movs r0, #0
	bl sub_8084E88
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8084ED8

	THUMB_FUNC_START AreAnyEnemyUnitDead
AreAnyEnemyUnitDead: @ 0x08084EE8
	push {r4, lr}
	movs r4, #0x81
_08084EEC:
	adds r0, r4, #0
	bl GetUnit
	adds r1, r0, #0
	cmp r1, #0
	beq _08084F0C
	ldr r0, [r1]
	cmp r0, #0
	beq _08084F0C
	ldr r0, [r1, #0xc]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	bne _08084F0C
	movs r0, #1
	b _08084F14
_08084F0C:
	adds r4, #1
	cmp r4, #0xbf
	ble _08084EEC
	movs r0, #0
_08084F14:
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END AreAnyEnemyUnitDead

	THUMB_FUNC_START GetDeadEnemyAmount
GetDeadEnemyAmount: @ 0x08084F1C
	push {r4, r5, lr}
	movs r5, #0
	movs r4, #0x81
_08084F22:
	adds r0, r4, #0
	bl GetUnit
	adds r1, r0, #0
	cmp r1, #0
	beq _08084F44
	ldr r0, [r1]
	cmp r0, #0
	beq _08084F44
	ldr r0, [r1, #0xc]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	bne _08084F44
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
_08084F44:
	adds r4, #1
	cmp r4, #0xbf
	ble _08084F22
	adds r0, r5, #0
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END GetDeadEnemyAmount

	THUMB_FUNC_START sub_8084F54
sub_8084F54: @ 0x08084F54
	push {lr}
	bl AreAnyEnemyUnitDead
	movs r1, #0
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08084F64
	movs r1, #1
_08084F64:
	adds r0, r1, #0
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8084F54

	THUMB_FUNC_START IsCharDeadAsNonPlayerUnit
IsCharDeadAsNonPlayerUnit: @ 0x08084F6C
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	movs r4, #0x41
_08084F74:
	adds r0, r4, #0
	bl GetUnit
	cmp r0, #0
	beq _08084F98
	ldr r2, [r0]
	cmp r2, #0
	beq _08084F98
	ldr r0, [r0, #0xc]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	bne _08084F98
	ldrb r0, [r2, #4]
	cmp r0, r5
	bne _08084F98
	movs r0, #1
	b _08084FA0
_08084F98:
	adds r4, #1
	cmp r4, #0xbf
	ble _08084F74
	movs r0, #0
_08084FA0:
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END IsCharDeadAsNonPlayerUnit

	THUMB_FUNC_START sub_8084FA8
sub_8084FA8: @ 0x08084FA8
	push {r4, r5, lr}
	movs r5, #0
	movs r4, #1
_08084FAE:
	adds r0, r4, #0
	bl GetUnit
	adds r1, r0, #0
	cmp r1, #0
	beq _08084FD4
	ldr r0, [r1]
	cmp r0, #0
	beq _08084FD4
	ldr r1, [r1, #0xc]
	movs r0, #0xc
	ands r0, r1
	cmp r0, #0
	bne _08084FD4
	movs r0, #2
	ands r1, r0
	cmp r1, #0
	bne _08084FD4
	adds r5, #1
_08084FD4:
	adds r4, #1
	cmp r4, #0x3f
	ble _08084FAE
	adds r0, r5, #0
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8084FA8

	THUMB_FUNC_START sub_8084FE4
sub_8084FE4: @ 0x08084FE4
	push {r4, lr}
	movs r4, #0x41
_08084FE8:
	adds r0, r4, #0
	bl GetUnit
	adds r1, r0, #0
	cmp r1, #0
	beq _08085008
	ldr r0, [r1]
	cmp r0, #0
	beq _08085008
	ldr r0, [r1, #0xc]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	bne _08085008
	movs r0, #0
	b _08085010
_08085008:
	adds r4, #1
	cmp r4, #0x7f
	ble _08084FE8
	movs r0, #1
_08085010:
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8084FE4

	THUMB_FUNC_START sub_8085018
sub_8085018: @ 0x08085018
	push {lr}
	movs r0, #0
	bl IsCharDeadAsNonPlayerUnit
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8085018

	THUMB_FUNC_START sub_8085028
sub_8085028: @ 0x08085028
	push {lr}
	movs r0, #0
	bl IsCharDeadAsNonPlayerUnit
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8085028

	THUMB_FUNC_START sub_8085038
sub_8085038: @ 0x08085038
	push {lr}
	movs r0, #0
	bl IsCharDeadAsNonPlayerUnit
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8085038

	THUMB_FUNC_START sub_8085048
sub_8085048: @ 0x08085048
	push {lr}
	movs r0, #0
	bl IsCharDeadAsNonPlayerUnit
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8085048

	THUMB_FUNC_START sub_8085058
sub_8085058: @ 0x08085058
	push {lr}
	movs r0, #0
	bl IsCharDeadAsNonPlayerUnit
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8085058

	THUMB_FUNC_START sub_8085068
sub_8085068: @ 0x08085068
	push {lr}
	movs r0, #0
	bl IsCharDeadAsNonPlayerUnit
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8085068

	THUMB_FUNC_START sub_8085078
sub_8085078: @ 0x08085078
	push {lr}
	movs r0, #0
	bl IsCharDeadAsNonPlayerUnit
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8085078

	THUMB_FUNC_START sub_8085088
sub_8085088: @ 0x08085088
	push {lr}
	movs r0, #0
	bl IsCharDeadAsNonPlayerUnit
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8085088

	THUMB_FUNC_START sub_8085098
sub_8085098: @ 0x08085098
	push {lr}
	movs r0, #0
	bl IsCharDeadAsNonPlayerUnit
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8085098

	THUMB_FUNC_START sub_80850A8
sub_80850A8: @ 0x080850A8
	push {lr}
	movs r0, #0
	bl IsCharDeadAsNonPlayerUnit
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80850A8

	THUMB_FUNC_START sub_80850B8
sub_80850B8: @ 0x080850B8
	push {lr}
	movs r0, #0
	bl IsCharDeadAsNonPlayerUnit
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80850B8

	THUMB_FUNC_START sub_80850C8
sub_80850C8: @ 0x080850C8
	push {lr}
	movs r0, #0
	bl IsCharDeadAsNonPlayerUnit
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80850C8

	THUMB_FUNC_START sub_80850D8
sub_80850D8: @ 0x080850D8
	push {lr}
	movs r0, #0
	bl IsCharDeadAsNonPlayerUnit
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80850D8

	THUMB_FUNC_START sub_80850E8
sub_80850E8: @ 0x080850E8
	push {lr}
	movs r0, #0
	bl IsCharDeadAsNonPlayerUnit
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80850E8

	THUMB_FUNC_START sub_80850F8
sub_80850F8: @ 0x080850F8
	push {lr}
	movs r0, #0
	bl IsCharDeadAsNonPlayerUnit
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80850F8

	THUMB_FUNC_START sub_8085108
sub_8085108: @ 0x08085108
	push {lr}
	movs r0, #0
	bl IsCharDeadAsNonPlayerUnit
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8085108

	THUMB_FUNC_START sub_8085118
sub_8085118: @ 0x08085118
	push {lr}
	movs r0, #0
	bl IsCharDeadAsNonPlayerUnit
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8085118

	THUMB_FUNC_START sub_8085128
sub_8085128: @ 0x08085128
	push {lr}
	movs r0, #0
	movs r1, #0
	bl HaveCharactersMaxSupport
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8085128

	THUMB_FUNC_START sub_808513C
sub_808513C: @ 0x0808513C
	push {lr}
	movs r0, #0
	movs r1, #0
	bl HaveCharactersMaxSupport
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_808513C

	THUMB_FUNC_START sub_8085150
sub_8085150: @ 0x08085150
	push {lr}
	movs r0, #0
	movs r1, #0
	bl HaveCharactersMaxSupport
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8085150

	THUMB_FUNC_START sub_8085164
sub_8085164: @ 0x08085164
	push {lr}
	movs r0, #0
	movs r1, #0
	bl HaveCharactersMaxSupport
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8085164

	THUMB_FUNC_START sub_8085178
sub_8085178: @ 0x08085178
	push {lr}
	movs r0, #0
	movs r1, #0
	bl HaveCharactersMaxSupport
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8085178

	THUMB_FUNC_START sub_808518C
sub_808518C: @ 0x0808518C
	push {lr}
	movs r0, #0
	movs r1, #0
	bl HaveCharactersMaxSupport
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_808518C

	THUMB_FUNC_START sub_80851A0
sub_80851A0: @ 0x080851A0
	push {r4, r5, r6, r7, lr}
	adds r5, r1, #0
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	movs r6, #0
	adds r4, r5, #1
	b _080851D2
_080851AE:
	adds r0, r4, #0
	bl GetUnit
	cmp r0, #0
	beq _080851D0
	ldr r2, [r0]
	cmp r2, #0
	beq _080851D0
	ldr r0, [r0, #0xc]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	bne _080851D0
	ldrb r0, [r2, #4]
	cmp r0, r7
	bne _080851D0
	adds r6, #1
_080851D0:
	adds r4, #1
_080851D2:
	adds r0, r5, #0
	adds r0, #0x40
	cmp r4, r0
	blt _080851AE
	adds r0, r6, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80851A0

	THUMB_FUNC_START sub_80851E4
sub_80851E4: @ 0x080851E4
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	movs r6, #0
	adds r4, r5, #1
	b _08085210
_080851EE:
	adds r0, r4, #0
	bl GetUnit
	adds r1, r0, #0
	cmp r1, #0
	beq _0808520C
	ldr r0, [r1]
	cmp r0, #0
	beq _0808520C
	ldr r0, [r1, #0xc]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	bne _0808520C
	adds r6, #1
_0808520C:
	adds r4, #1
	adds r0, r5, #0
_08085210:
	adds r0, #0x40
	cmp r4, r0
	blt _080851EE
	adds r0, r6, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80851E4

	THUMB_FUNC_START sub_8085220
sub_8085220: @ 0x08085220
	push {lr}
	movs r1, #0
	ldr r0, _08085234  @ gRAMChapterData
	ldrh r0, [r0, #0x10]
	cmp r0, #0x14
	bls _0808522E
	movs r1, #1
_0808522E:
	adds r0, r1, #0
	pop {r1}
	bx r1
	.align 2, 0
_08085234: .4byte gRAMChapterData

	THUMB_FUNC_END sub_8085220

	THUMB_FUNC_START sub_8085238
sub_8085238: @ 0x08085238
	push {lr}
	movs r1, #0
	ldr r0, _0808524C  @ gRAMChapterData
	ldrh r0, [r0, #0x10]
	cmp r0, #0x19
	bls _08085246
	movs r1, #1
_08085246:
	adds r0, r1, #0
	pop {r1}
	bx r1
	.align 2, 0
_0808524C: .4byte gRAMChapterData

	THUMB_FUNC_END sub_8085238

	THUMB_FUNC_START sub_8085250
sub_8085250: @ 0x08085250
	push {lr}
	movs r1, #0
	ldr r0, _08085264  @ gRAMChapterData
	ldrh r0, [r0, #0x10]
	cmp r0, #0x1e
	bls _0808525E
	movs r1, #1
_0808525E:
	adds r0, r1, #0
	pop {r1}
	bx r1
	.align 2, 0
_08085264: .4byte gRAMChapterData

	THUMB_FUNC_END sub_8085250

	THUMB_FUNC_START sub_8085268
sub_8085268: @ 0x08085268
	push {lr}
	movs r1, #0
	ldr r0, _0808527C  @ gRAMChapterData
	ldrb r0, [r0, #0xf]
	cmp r0, #0
	bne _08085276
	movs r1, #1
_08085276:
	adds r0, r1, #0
	pop {r1}
	bx r1
	.align 2, 0
_0808527C: .4byte gRAMChapterData

	THUMB_FUNC_END sub_8085268

	THUMB_FUNC_START sub_8085280
sub_8085280: @ 0x08085280
	push {lr}
	movs r1, #0
	ldr r0, _08085294  @ gRAMChapterData
	ldrb r0, [r0, #0xf]
	cmp r0, #0x80
	bne _0808528E
	movs r1, #1
_0808528E:
	adds r0, r1, #0
	pop {r1}
	bx r1
	.align 2, 0
_08085294: .4byte gRAMChapterData

	THUMB_FUNC_END sub_8085280

	THUMB_FUNC_START sub_8085298
sub_8085298: @ 0x08085298
	ldr r0, _080852B0  @ gActiveUnit
	ldr r0, [r0]
	ldr r1, [r0]
	ldr r0, [r0, #4]
	ldr r1, [r1, #0x28]
	ldr r0, [r0, #0x28]
	orrs r1, r0
	lsrs r1, r1, #0xe
	movs r0, #1
	bics r0, r1
	bx lr
	.align 2, 0
_080852B0: .4byte gActiveUnit

	THUMB_FUNC_END sub_8085298

	THUMB_FUNC_START sub_80852B4
sub_80852B4: @ 0x080852B4
	push {lr}
	bl GetPartyGoldAmount
	movs r2, #0
	ldr r1, _080852CC  @ 0x0000270F
	cmp r0, r1
	ble _080852C4
	movs r2, #1
_080852C4:
	adds r0, r2, #0
	pop {r1}
	bx r1
	.align 2, 0
_080852CC: .4byte 0x0000270F

	THUMB_FUNC_END sub_80852B4

	THUMB_FUNC_START sub_80852D0
sub_80852D0: @ 0x080852D0
	push {lr}
	bl GetPartyGoldAmount
	movs r2, #0
	ldr r1, _080852E8  @ 0x00001F3F
	cmp r0, r1
	ble _080852E0
	movs r2, #1
_080852E0:
	adds r0, r2, #0
	pop {r1}
	bx r1
	.align 2, 0
_080852E8: .4byte 0x00001F3F

	THUMB_FUNC_END sub_80852D0

	THUMB_FUNC_START sub_80852EC
sub_80852EC: @ 0x080852EC
	push {lr}
	bl GetPartyGoldAmount
	movs r2, #0
	ldr r1, _08085304  @ 0x0000176F
	cmp r0, r1
	ble _080852FC
	movs r2, #1
_080852FC:
	adds r0, r2, #0
	pop {r1}
	bx r1
	.align 2, 0
_08085304: .4byte 0x0000176F

	THUMB_FUNC_END sub_80852EC

	THUMB_FUNC_START sub_8085308
sub_8085308: @ 0x08085308
	push {lr}
	bl GetPartyGoldAmount
	movs r2, #0
	ldr r1, _08085320  @ 0x00001387
	cmp r0, r1
	ble _08085318
	movs r2, #1
_08085318:
	adds r0, r2, #0
	pop {r1}
	bx r1
	.align 2, 0
_08085320: .4byte 0x00001387

	THUMB_FUNC_END sub_8085308

	THUMB_FUNC_START sub_8085324
sub_8085324: @ 0x08085324
	push {lr}
	bl sub_8008A00
	movs r1, #0
	cmp r0, #1
	bne _08085332
	movs r1, #1
_08085332:
	adds r0, r1, #0
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8085324

	THUMB_FUNC_START sub_8085338
sub_8085338: @ 0x08085338
	push {lr}
	bl GetDeadEnemyAmount
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x31
	bhi _0808534A
	movs r0, #0
	b _0808534C
_0808534A:
	movs r0, #1
_0808534C:
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8085338

	THUMB_FUNC_START sub_8085350
sub_8085350: @ 0x08085350
	movs r0, #0
	bx lr

	THUMB_FUNC_END sub_8085350

	THUMB_FUNC_START sub_8085354
sub_8085354: @ 0x08085354
	push {lr}
	ldr r0, _0808536C  @ gActiveUnit
	ldr r0, [r0]
	bl GetUnitCurrentHp
	movs r1, #0
	cmp r0, #0
	bne _08085366
	movs r1, #1
_08085366:
	adds r0, r1, #0
	pop {r1}
	bx r1
	.align 2, 0
_0808536C: .4byte gActiveUnit

	THUMB_FUNC_END sub_8085354

	THUMB_FUNC_START sub_8085370
sub_8085370: @ 0x08085370
	movs r0, #0
	bx lr

	THUMB_FUNC_END sub_8085370

	THUMB_FUNC_START sub_8085374
sub_8085374: @ 0x08085374
	push {lr}
	adds r1, r0, #0
	ldr r0, _08085384  @ gUnknown_089EDF78
	bl Proc_StartBlocking
	pop {r0}
	bx r0
	.align 2, 0
_08085384: .4byte gUnknown_089EDF78

	THUMB_FUNC_END sub_8085374

	THUMB_FUNC_START sub_8085388
sub_8085388: @ 0x08085388
	push {lr}
	ldr r2, _080853AC  @ gRAMChapterData
	ldrb r1, [r2, #0x14]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	bne _080853A2
	adds r0, r2, #0
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1f
	cmp r0, #0
	bne _080853A8
_080853A2:
	movs r0, #4
	bl Sound_FadeOut800231C
_080853A8:
	pop {r0}
	bx r0
	.align 2, 0
_080853AC: .4byte gRAMChapterData

	THUMB_FUNC_END sub_8085388

	THUMB_FUNC_START sub_80853B0
sub_80853B0: @ 0x080853B0
	push {lr}
	adds r2, r0, #0
	ldr r0, _080853CC  @ gRAMChapterData
	ldrb r1, [r0, #0x14]
	movs r0, #0x88
	ands r0, r1
	cmp r0, #0
	beq _080853C8
	adds r0, r2, #0
	movs r1, #0
	bl Proc_Goto
_080853C8:
	pop {r0}
	bx r0
	.align 2, 0
_080853CC: .4byte gRAMChapterData

	THUMB_FUNC_END sub_80853B0

	THUMB_FUNC_START sub_80853D0
sub_80853D0: @ 0x080853D0
	push {lr}
	movs r0, #0
	bl SetNextGameActionId
	bl EndBMapMain
	bl DeleteEventEngines
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80853D0

	THUMB_FUNC_START sub_80853E4
sub_80853E4: @ 0x080853E4
	push {lr}
	movs r1, #0
	ldr r0, _080853F8  @ gActionData
	ldrb r0, [r0, #0x11]
	cmp r0, #1
	bne _080853F2
	movs r1, #1
_080853F2:
	adds r0, r1, #0
	pop {r1}
	bx r1
	.align 2, 0
_080853F8: .4byte gActionData

	THUMB_FUNC_END sub_80853E4

	THUMB_FUNC_START sub_80853FC
sub_80853FC: @ 0x080853FC
	push {lr}
	movs r0, #0
	bl SetKeyStatus_IgnoreMask
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80853FC

	THUMB_FUNC_START sub_8085408
sub_8085408: @ 0x08085408
	push {lr}
	movs r0, #2
	bl NewKeyStatusSetter
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8085408

	THUMB_FUNC_START sub_8085414
sub_8085414: @ 0x08085414
	push {lr}
	ldr r0, _08085424  @ gUnknown_089EDFD8
	movs r1, #4
	bl Proc_Start
	pop {r0}
	bx r0
	.align 2, 0
_08085424: .4byte gUnknown_089EDFD8

	THUMB_FUNC_END sub_8085414

	THUMB_FUNC_START sub_8085428
sub_8085428: @ 0x08085428
	push {r4, r5, r6, r7, lr}
	bl GetPlayerLeaderUnitId
	bl GetUnitFromCharId
	adds r5, r0, #0
	movs r7, #0x10
	ldrsb r7, [r5, r7]
	movs r6, #0x11
	ldrsb r6, [r5, r6]
	movs r4, #1
_0808543E:
	adds r0, r4, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq _08085474
	ldr r0, [r2]
	cmp r0, #0
	beq _08085474
	cmp r2, r5
	beq _08085474
	movs r0, #0x10
	ldrsb r0, [r2, r0]
	cmp r0, r7
	bne _08085474
	movs r0, #0x11
	ldrsb r0, [r2, r0]
	cmp r0, r6
	bne _08085474
	ldr r1, [r2, #0xc]
	movs r0, #0x30
	ands r0, r1
	cmp r0, #0
	bne _08085474
	movs r0, #9
	orrs r1, r0
	str r1, [r2, #0xc]
_08085474:
	adds r4, #1
	cmp r4, #0x3f
	ble _0808543E
	bl SMS_UpdateFromGameData
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8085428

	THUMB_FUNC_START ResetAllPlayerUnitState
ResetAllPlayerUnitState: @ 0x08085484
	push {r4, r5, r6, lr}
	movs r5, #1
	movs r6, #0
_0808548A:
	adds r0, r5, #0
	bl GetUnit
	adds r4, r0, #0
	cmp r4, #0
	beq _080854CA
	ldr r0, [r4]
	cmp r0, #0
	beq _080854CA
	adds r0, r4, #0
	bl GetUnitMaxHp
	adds r1, r0, #0
	adds r0, r4, #0
	bl SetUnitHp
	adds r0, r4, #0
	movs r1, #0
	bl SetUnitStatus
	adds r0, r4, #0
	adds r0, #0x31
	strb r6, [r0]
	ldr r1, [r4, #0xc]
	ldr r0, _080854E0  @ 0x0671E00C
	ands r1, r0
	movs r0, #0xff
	strb r0, [r4, #0x10]
	movs r0, #1
	orrs r1, r0
	str r1, [r4, #0xc]
	strb r6, [r4, #0x1b]
_080854CA:
	adds r5, #1
	cmp r5, #0x3f
	ble _0808548A
	bl RefreshEntityBmMaps
	bl MU_EndAll
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080854E0: .4byte 0x0671E00C

	THUMB_FUNC_END ResetAllPlayerUnitState

	THUMB_FUNC_START sub_80854E4
sub_80854E4: @ 0x080854E4
	push {lr}
	ldr r0, [r0, #0x14]
	bl sub_8097D54
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80854E4

	THUMB_FUNC_START sub_80854F0
sub_80854F0: @ 0x080854F0
	push {lr}
	ldr r0, [r0, #0x14]
	bl sub_8097D68
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80854F0

	THUMB_FUNC_START sub_80854FC
sub_80854FC: @ 0x080854FC
	push {lr}
	movs r0, #0
	bl SetupBackgrounds
	ldr r2, _08085528  @ gLCDControlBuffer
	ldrb r1, [r2, #1]
	movs r0, #2
	negs r0, r0
	ands r0, r1
	movs r1, #3
	negs r1, r1
	ands r0, r1
	subs r1, #2
	ands r0, r1
	subs r1, #4
	ands r0, r1
	subs r1, #8
	ands r0, r1
	strb r0, [r2, #1]
	pop {r0}
	bx r0
	.align 2, 0
_08085528: .4byte gLCDControlBuffer

	THUMB_FUNC_END sub_80854FC

	THUMB_FUNC_START sub_808552C
sub_808552C: @ 0x0808552C
	push {r4, r5, lr}
	movs r4, #0x80
	lsls r4, r4, #1
	adds r0, r4, #0
	bl GetUnitFromCharId
	adds r5, r0, #0
	adds r0, r4, #0
	bl GetUnitFromCharId
	adds r1, r0, #0
	adds r0, r5, #0
	bl SwapUnitStats
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_808552C

	THUMB_FUNC_START sub_8085550
sub_8085550: @ 0x08085550
	push {lr}
	sub sp, #0x10
	movs r2, #1
	negs r2, r2
	movs r1, #0xc0
	lsls r1, r1, #1
	str r1, [sp]
	str r1, [sp, #4]
	str r1, [sp, #8]
	str r0, [sp, #0xc]
	adds r0, r2, #0
	movs r1, #2
	movs r2, #0x20
	movs r3, #4
	bl sub_800915C
	add sp, #0x10
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8085550

	THUMB_FUNC_START sub_8085578
sub_8085578: @ 0x08085578
	push {lr}
	sub sp, #0x10
	movs r2, #1
	negs r2, r2
	movs r1, #0x80
	lsls r1, r1, #2
	str r1, [sp]
	subs r1, #0xc0
	str r1, [sp, #4]
	str r1, [sp, #8]
	str r0, [sp, #0xc]
	adds r0, r2, #0
	movs r1, #2
	movs r2, #0x20
	movs r3, #4
	bl sub_800915C
	add sp, #0x10
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8085578

	THUMB_FUNC_START sub_80855A0
sub_80855A0: @ 0x080855A0
	push {r4, lr}
	sub sp, #4
	adds r0, #0x4d
	movs r4, #1
	strb r4, [r0]
	movs r0, #3
	movs r1, #0
	movs r2, #0
	movs r3, #0x10
	bl SetSpecialColorEffectsParameters
	str r4, [sp]
	movs r0, #1
	movs r1, #1
	movs r2, #1
	movs r3, #1
	bl sub_8001ED0
	movs r0, #1
	bl sub_8001F48
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80855A0

	THUMB_FUNC_START sub_80855D4
sub_80855D4: @ 0x080855D4
	ldr r2, _080855F4  @ gLCDControlBuffer
	ldrb r1, [r2, #1]
	movs r0, #2
	negs r0, r0
	ands r0, r1
	movs r1, #3
	negs r1, r1
	ands r0, r1
	subs r1, #2
	ands r0, r1
	subs r1, #4
	ands r0, r1
	subs r1, #8
	ands r0, r1
	strb r0, [r2, #1]
	bx lr
	.align 2, 0
_080855F4: .4byte gLCDControlBuffer

	THUMB_FUNC_END sub_80855D4

	THUMB_FUNC_START sub_80855F8
sub_80855F8: @ 0x080855F8
	ldr r2, _08085614  @ gLCDControlBuffer
	ldrb r0, [r2, #1]
	movs r1, #1
	orrs r0, r1
	movs r1, #2
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2, #1]
	bx lr
	.align 2, 0
_08085614: .4byte gLCDControlBuffer

	THUMB_FUNC_END sub_80855F8

	THUMB_FUNC_START sub_8085618
sub_8085618: @ 0x08085618
	push {lr}
	ldr r0, [r0, #0x14]
	adds r0, #0x4c
	movs r1, #0
	ldrsb r1, [r0, r1]
	movs r0, #1
	negs r0, r0
	cmp r1, r0
	bne _08085648
	bl GetGameClock
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	beq _0808566A
	ldr r0, _08085644  @ gUnknown_0202BCB0
	ldrh r1, [r0, #0xc]
	movs r2, #2
	eors r1, r2
	strh r1, [r0, #0xc]
	b _0808566A
	.align 2, 0
_08085644: .4byte gUnknown_0202BCB0
_08085648:
	bl GetGameClock
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	beq _0808566A
	bl GetGameClock
	adds r1, r0, #0
	movs r0, #2
	ands r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r0, #3
	movs r2, #0
	bl BG_SetPosition
_0808566A:
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8085618

	THUMB_FUNC_START sub_8085670
sub_8085670: @ 0x08085670
	push {lr}
	ldr r0, [r0, #0x14]
	adds r0, #0x4c
	movs r1, #0
	ldrsb r1, [r0, r1]
	movs r0, #1
	negs r0, r0
	cmp r1, r0
	bne _080856A8
	bl GetGameClock
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	beq _080856CC
	ldr r2, _080856A0  @ gUnknown_0202BCB0
	ldrh r1, [r2, #0xc]
	ldr r0, _080856A4  @ 0x0000FFFD
	ands r0, r1
	movs r1, #1
	eors r0, r1
	strh r0, [r2, #0xc]
	b _080856CC
	.align 2, 0
_080856A0: .4byte gUnknown_0202BCB0
_080856A4: .4byte 0x0000FFFD
_080856A8:
	bl GetGameClock
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	beq _080856CC
	movs r0, #3
	bl sub_80AEA24
	adds r1, r0, #0
	movs r0, #1
	eors r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r0, #3
	movs r2, #0
	bl BG_SetPosition
_080856CC:
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8085670

	THUMB_FUNC_START sub_80856D0
sub_80856D0: @ 0x080856D0
	push {lr}
	ldr r0, [r0, #0x14]
	adds r0, #0x4c
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x36
	bne _08085700
	bl GetGameClock
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	beq _0808571A
	bl GetGameClock
	adds r1, r0, #0
	movs r0, #1
	ands r1, r0
	movs r0, #3
	movs r2, #0
	bl BG_SetPosition
	b _0808571A
_08085700:
	bl GetGameClock
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	beq _0808571A
	ldr r2, _08085720  @ gUnknown_0202BCB0
	ldrh r1, [r2, #0xe]
	ldr r0, _08085724  @ 0x0000FFFD
	ands r0, r1
	movs r1, #1
	eors r0, r1
	strh r0, [r2, #0xe]
_0808571A:
	pop {r0}
	bx r0
	.align 2, 0
_08085720: .4byte gUnknown_0202BCB0
_08085724: .4byte 0x0000FFFD

	THUMB_FUNC_END sub_80856D0

	THUMB_FUNC_START sub_8085728
sub_8085728: @ 0x08085728
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r5, _08085760  @ gUnknown_089EE030
	adds r0, r5, #0
	bl Proc_Find
	cmp r0, #0
	bne _08085740
	adds r0, r5, #0
	adds r1, r4, #0
	bl Proc_Start
_08085740:
	movs r1, #0
	bl Proc_Goto
	ldr r0, _08085764  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08085758
	ldr r0, _08085768  @ 0x0000026A
	bl m4aSongNumStart
_08085758:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08085760: .4byte gUnknown_089EE030
_08085764: .4byte gRAMChapterData
_08085768: .4byte 0x0000026A

	THUMB_FUNC_END sub_8085728

	THUMB_FUNC_START sub_808576C
sub_808576C: @ 0x0808576C
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r5, _080857A4  @ gUnknown_089EE000
	adds r0, r5, #0
	bl Proc_Find
	cmp r0, #0
	bne _08085796
	ldr r0, _080857A8  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0808578E
	ldr r0, _080857AC  @ 0x0000026A
	bl m4aSongNumStart
_0808578E:
	adds r0, r5, #0
	adds r1, r4, #0
	bl Proc_Start
_08085796:
	movs r1, #0
	bl Proc_Goto
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080857A4: .4byte gUnknown_089EE000
_080857A8: .4byte gRAMChapterData
_080857AC: .4byte 0x0000026A

	THUMB_FUNC_END sub_808576C

	THUMB_FUNC_START sub_80857B0
sub_80857B0: @ 0x080857B0
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r5, _080857E8  @ gUnknown_089EE000
	adds r0, r5, #0
	bl Proc_Find
	cmp r0, #0
	bne _080857DA
	ldr r0, _080857EC  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080857D2
	ldr r0, _080857F0  @ 0x0000026A
	bl m4aSongNumStart
_080857D2:
	adds r0, r5, #0
	adds r1, r4, #0
	bl Proc_Start
_080857DA:
	movs r1, #1
	bl Proc_Goto
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080857E8: .4byte gUnknown_089EE000
_080857EC: .4byte gRAMChapterData
_080857F0: .4byte 0x0000026A

	THUMB_FUNC_END sub_80857B0

	THUMB_FUNC_START sub_80857F4
sub_80857F4: @ 0x080857F4
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r5, _08085818  @ gUnknown_089EE000
	adds r0, r5, #0
	bl Proc_Find
	cmp r0, #0
	bne _0808580C
	adds r0, r5, #0
	adds r1, r4, #0
	bl Proc_Start
_0808580C:
	movs r1, #0
	bl Proc_Goto
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08085818: .4byte gUnknown_089EE000

	THUMB_FUNC_END sub_80857F4

	THUMB_FUNC_START sub_808581C
sub_808581C: @ 0x0808581C
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r5, _08085840  @ gUnknown_089EE000
	adds r0, r5, #0
	bl Proc_Find
	cmp r0, #0
	bne _08085834
	adds r0, r5, #0
	adds r1, r4, #0
	bl Proc_Start
_08085834:
	movs r1, #1
	bl Proc_Goto
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08085840: .4byte gUnknown_089EE000

	THUMB_FUNC_END sub_808581C

	THUMB_FUNC_START sub_8085844
sub_8085844: @ 0x08085844
	push {lr}
	ldr r2, _08085860  @ gUnknown_0202BCB0
	ldrh r1, [r2, #0xc]
	ldr r0, _08085864  @ 0x0000FFFC
	ands r0, r1
	strh r0, [r2, #0xc]
	ldr r0, _08085868  @ gUnknown_089EE000
	bl Proc_EndEach
	movs r0, #4
	bl SoundStuff_80023E0
	pop {r0}
	bx r0
	.align 2, 0
_08085860: .4byte gUnknown_0202BCB0
_08085864: .4byte 0x0000FFFC
_08085868: .4byte gUnknown_089EE000

	THUMB_FUNC_END sub_8085844

	THUMB_FUNC_START sub_808586C
sub_808586C: @ 0x0808586C
	push {lr}
	ldr r2, _08085888  @ gUnknown_0202BCB0
	ldrh r1, [r2, #0xe]
	ldr r0, _0808588C  @ 0x0000FFFC
	ands r0, r1
	strh r0, [r2, #0xe]
	ldr r0, _08085890  @ gUnknown_089EE030
	bl Proc_EndEach
	movs r0, #4
	bl SoundStuff_80023E0
	pop {r0}
	bx r0
	.align 2, 0
_08085888: .4byte gUnknown_0202BCB0
_0808588C: .4byte 0x0000FFFC
_08085890: .4byte gUnknown_089EE030

	THUMB_FUNC_END sub_808586C

	THUMB_FUNC_START sub_8085894
sub_8085894: @ 0x08085894
	adds r0, #0x4c
	movs r1, #0
	strh r1, [r0]
	bx lr

	THUMB_FUNC_END sub_8085894

	THUMB_FUNC_START sub_808589C
sub_808589C: @ 0x0808589C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x14]
	adds r0, #0x4c
	movs r1, #0
	ldrsb r1, [r0, r1]
	movs r0, #1
	negs r0, r0
	cmp r1, r0
	bne _080858D4
	bl GetGameClock
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	beq _080858F8
	ldr r2, _080858CC  @ gUnknown_0202BCB0
	ldrh r1, [r2, #0xc]
	ldr r0, _080858D0  @ 0x0000FFFD
	ands r0, r1
	movs r1, #1
	eors r0, r1
	strh r0, [r2, #0xc]
	b _080858F8
	.align 2, 0
_080858CC: .4byte gUnknown_0202BCB0
_080858D0: .4byte 0x0000FFFD
_080858D4:
	bl GetGameClock
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	beq _080858F8
	movs r0, #3
	bl sub_80AEA24
	adds r1, r0, #0
	movs r0, #1
	eors r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r0, #3
	movs r2, #0
	bl BG_SetPosition
_080858F8:
	adds r1, r4, #0
	adds r1, #0x4c
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x10
	bne _08085916
	adds r0, r4, #0
	bl Proc_Break
	movs r0, #4
	bl SoundStuff_80023E0
_08085916:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_808589C

	THUMB_FUNC_START sub_808591C
sub_808591C: @ 0x0808591C
	push {lr}
	adds r1, r0, #0
	ldr r0, _0808593C  @ gUnknown_089EE048
	bl Proc_Start
	ldr r0, _08085940  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08085938
	ldr r0, _08085944  @ 0x0000026A
	bl m4aSongNumStart
_08085938:
	pop {r0}
	bx r0
	.align 2, 0
_0808593C: .4byte gUnknown_089EE048
_08085940: .4byte gRAMChapterData
_08085944: .4byte 0x0000026A

	THUMB_FUNC_END sub_808591C

	THUMB_FUNC_START sub_8085948
sub_8085948: @ 0x08085948
	push {lr}
	ldr r2, _08085964  @ gUnknown_0202BCB0
	ldrh r1, [r2, #0xe]
	ldr r0, _08085968  @ 0x0000FFFC
	ands r0, r1
	strh r0, [r2, #0xe]
	movs r0, #4
	bl SoundStuff_80023E0
	ldr r0, _0808596C  @ gUnknown_089EE048
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
_08085964: .4byte gUnknown_0202BCB0
_08085968: .4byte 0x0000FFFC
_0808596C: .4byte gUnknown_089EE048

	THUMB_FUNC_END sub_8085948

	THUMB_FUNC_START SetEventId_0x84
SetEventId_0x84: @ 0x08085970
	push {lr}
	movs r0, #0x84
	bl SetEventId
	pop {r0}
	bx r0

	THUMB_FUNC_END SetEventId_0x84

	THUMB_FUNC_START UnsetEventId_0x84
UnsetEventId_0x84: @ 0x0808597C
	push {lr}
	movs r0, #0x84
	bl UnsetEventId
	pop {r0}
	bx r0

	THUMB_FUNC_END UnsetEventId_0x84

	THUMB_FUNC_START sub_8085988
sub_8085988: @ 0x08085988
	adds r0, #0x4c
	movs r1, #0
	strh r1, [r0]
	bx lr

	THUMB_FUNC_END sub_8085988

	THUMB_FUNC_START sub_8085990
sub_8085990: @ 0x08085990
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r5, [r6, #0x54]
	adds r4, r6, #0
	adds r4, #0x4c
	movs r0, #0
	ldrsh r1, [r4, r0]
	adds r0, r5, #0
	bl sub_8026C1C
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x40
	bne _080859C8
	ldr r0, [r5, #0xc]
	movs r1, #9
	orrs r0, r1
	str r0, [r5, #0xc]
	bl RefreshEntityBmMaps
	bl SMS_UpdateFromGameData
	adds r0, r6, #0
	bl Proc_Break
_080859C8:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8085990

	THUMB_FUNC_START sub_80859D0
sub_80859D0: @ 0x080859D0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080859E4  @ gUnknown_089EE068
	bl Proc_Start
	str r4, [r0, #0x54]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080859E4: .4byte gUnknown_089EE068

	THUMB_FUNC_END sub_80859D0

	THUMB_FUNC_START nullsub_20
nullsub_20: @ 0x080859E8
	bx lr

	THUMB_FUNC_END nullsub_20

	THUMB_FUNC_START sub_80859EC
sub_80859EC: @ 0x080859EC
	push {r4, r5, r6, lr}
	mov r6, sl
	mov r5, r9
	mov r4, r8
	push {r4, r5, r6}
	sub sp, #4
	movs r4, #0
	str r4, [r0, #0x2c]
	bl sub_8081E78
	movs r0, #1
	str r0, [sp]
	movs r1, #1
	movs r2, #1
	movs r3, #1
	bl sub_8001ED0
	ldr r2, _08085ABC  @ gLCDControlBuffer
	adds r0, r2, #0
	adds r0, #0x2d
	strb r4, [r0]
	adds r0, #4
	strb r4, [r0]
	adds r1, r2, #0
	adds r1, #0x2c
	movs r0, #0xf0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0xa0
	strb r0, [r1]
	ldrb r0, [r2, #1]
	movs r1, #0x20
	mov r8, r1
	mov r1, r8
	orrs r0, r1
	movs r1, #0x41
	negs r1, r1
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r2, #1]
	movs r0, #0x34
	adds r0, r0, r2
	mov ip, r0
	ldrb r1, [r0]
	mov r0, r8
	orrs r1, r0
	adds r2, #0x36
	mov sl, r2
	ldrb r2, [r2]
	movs r0, #0x21
	negs r0, r0
	mov r9, r0
	ands r0, r2
	movs r6, #1
	orrs r1, r6
	movs r5, #2
	orrs r1, r5
	movs r4, #4
	orrs r1, r4
	movs r3, #8
	orrs r1, r3
	movs r2, #0x10
	orrs r1, r2
	orrs r0, r6
	orrs r0, r5
	orrs r0, r4
	orrs r0, r3
	orrs r0, r2
	mov r2, r8
	orrs r1, r2
	mov r2, ip
	strb r1, [r2]
	mov r1, r9
	ands r0, r1
	mov r2, sl
	strb r0, [r2]
	movs r0, #2
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	ldr r0, _08085AC0  @ sub_808285C
	bl SetPrimaryHBlankHandler
	ldr r0, _08085AC4  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08085AAA
	ldr r0, _08085AC8  @ 0x00000269
	bl m4aSongNumStart
_08085AAA:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08085ABC: .4byte gLCDControlBuffer
_08085AC0: .4byte sub_808285C
_08085AC4: .4byte gRAMChapterData
_08085AC8: .4byte 0x00000269

	THUMB_FUNC_END sub_80859EC

	THUMB_FUNC_START sub_8085ACC
sub_8085ACC: @ 0x08085ACC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r7, r0, #0
	movs r5, #0x40
	movs r0, #0xf0
	ldr r4, [r7, #0x2c]
	adds r4, #1
	str r4, [r7, #0x2c]
	muls r0, r4, r0
	muls r0, r4, r0
	movs r6, #0x80
	lsls r6, r6, #5
	adds r1, r6, #0
	bl __divsi3
	mov r8, r0
	subs r5, r5, r4
	lsls r0, r5, #4
	muls r0, r5, r0
	adds r1, r6, #0
	bl __divsi3
	movs r4, #0x10
	subs r4, r4, r0
	movs r0, #0x78
	movs r1, #0x68
	mov r2, r8
	bl sub_8082730
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	movs r0, #2
	movs r1, #0
	movs r2, #0
	adds r3, r4, #0
	bl SetSpecialColorEffectsParameters
	ldr r0, [r7, #0x2c]
	cmp r0, #0x40
	blt _08085B24
	adds r0, r7, #0
	bl Proc_Break
_08085B24:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8085ACC

	THUMB_FUNC_START sub_8085B30
sub_8085B30: @ 0x08085B30
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #1
	bl ApplyMapChangesById
	movs r0, #1
	bl EnableMapChange
	bl RefreshTerrainBmMap
	bl UpdateRoofedUnits
	bl RenderBmMap
	movs r0, #0
	str r0, [r4, #0x2c]
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8085B30

	THUMB_FUNC_START sub_8085B58
sub_8085B58: @ 0x08085B58
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	movs r1, #0x80
	movs r5, #0xf0
	ldr r4, [r7, #0x2c]
	adds r4, #1
	str r4, [r7, #0x2c]
	subs r1, r1, r4
	adds r0, r1, #0
	muls r0, r5, r0
	muls r0, r1, r0
	movs r6, #0x80
	lsls r6, r6, #7
	adds r1, r6, #0
	bl __divsi3
	adds r5, r0, #0
	lsls r0, r4, #4
	muls r0, r4, r0
	adds r1, r6, #0
	bl __divsi3
	movs r4, #0x10
	subs r4, r4, r0
	movs r0, #0x78
	movs r1, #0x30
	adds r2, r5, #0
	bl sub_8082730
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	movs r0, #2
	movs r1, #0
	movs r2, #0
	adds r3, r4, #0
	bl SetSpecialColorEffectsParameters
	ldr r0, [r7, #0x2c]
	cmp r0, #0x80
	blt _08085BAE
	adds r0, r7, #0
	bl Proc_Break
_08085BAE:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8085B58

	THUMB_FUNC_START sub_8085BB4
sub_8085BB4: @ 0x08085BB4
	push {lr}
	movs r0, #0
	bl SetPrimaryHBlankHandler
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	ldr r2, _08085BF8  @ gLCDControlBuffer
	ldrb r1, [r2, #1]
	movs r0, #0x21
	negs r0, r0
	ands r0, r1
	movs r1, #0x41
	negs r1, r1
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r2, #1]
	adds r1, r2, #0
	adds r1, #0x34
	ldrb r0, [r1]
	movs r3, #0x20
	orrs r0, r3
	strb r0, [r1]
	adds r2, #0x36
	ldrb r0, [r2]
	orrs r0, r3
	strb r0, [r2]
	pop {r0}
	bx r0
	.align 2, 0
_08085BF8: .4byte gLCDControlBuffer

	THUMB_FUNC_END sub_8085BB4

	THUMB_FUNC_START sub_8085BFC
sub_8085BFC: @ 0x08085BFC
	push {lr}
	adds r1, r0, #0
	ldr r0, _08085C0C  @ gUnknown_089EE088
	bl Proc_StartBlocking
	pop {r0}
	bx r0
	.align 2, 0
_08085C0C: .4byte gUnknown_089EE088

	THUMB_FUNC_END sub_8085BFC

	THUMB_FUNC_START sub_8085C10
sub_8085C10: @ 0x08085C10
	push {lr}
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r1, #0
	movs r2, #1
	bl sub_80A3724
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8085C10

	THUMB_FUNC_START sub_8085C24
sub_8085C24: @ 0x08085C24
	push {lr}
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r1, #0
	movs r2, #2
	bl sub_80A3724
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8085C24

	THUMB_FUNC_START sub_8085C38
sub_8085C38: @ 0x08085C38
	push {lr}
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r1, #0
	movs r2, #3
	bl sub_80A3724
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8085C38

	THUMB_FUNC_START sub_8085C4C
sub_8085C4C: @ 0x08085C4C
	push {lr}
	movs r0, #0
	bl sub_8037C40
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8085C4C

	THUMB_FUNC_START sub_8085C58
sub_8085C58: @ 0x08085C58
	push {lr}
	movs r0, #1
	bl sub_8037C40
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8085C58

	THUMB_FUNC_START sub_8085C64
sub_8085C64: @ 0x08085C64
	push {lr}
	movs r1, #1
	bl sub_8085C7C
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8085C64

	THUMB_FUNC_START sub_8085C70
sub_8085C70: @ 0x08085C70
	push {lr}
	movs r1, #0
	bl sub_8085C7C
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8085C70

	THUMB_FUNC_START sub_8085C7C
sub_8085C7C: @ 0x08085C7C
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r2, r0, #0
	adds r6, r1, #0
	ldr r0, _08085D60  @ gUnknown_089EE9E0
	adds r1, r2, #0
	bl Proc_StartBlocking
	adds r2, r0, #0
	adds r0, #0x64
	movs r5, #0
	strh r6, [r0]
	ldr r4, _08085D64  @ gLCDControlBuffer
	ldrb r1, [r4, #1]
	movs r0, #2
	negs r0, r0
	ands r0, r1
	movs r1, #3
	negs r1, r1
	ands r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r4, #1]
	bl FlushLCDControl
	ldr r2, _08085D68  @ 0x0000FFD4
	movs r0, #0
	movs r1, #0
	bl BG_SetPosition
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	ldr r0, _08085D6C  @ gBG0TilemapBuffer
	movs r1, #0
	bl BG_Fill
	ldr r0, _08085D70  @ gBG1TilemapBuffer
	movs r1, #0
	bl BG_Fill
	ldrb r1, [r4, #1]
	movs r0, #0x21
	negs r0, r0
	ands r0, r1
	movs r1, #0x41
	negs r1, r1
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r4, #1]
	adds r4, #0x36
	ldrb r0, [r4]
	movs r1, #0x20
	orrs r0, r1
	strb r0, [r4]
	movs r0, #1
	movs r1, #4
	movs r2, #0xc
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	str r5, [sp]
	movs r0, #0
	movs r1, #1
	movs r2, #0
	movs r3, #0
	bl sub_8001ED0
	movs r0, #1
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #1
	movs r3, #1
	bl sub_8001F0C
	ldr r0, _08085D74  @ gUnknown_085A06D8
	ldr r1, _08085D78  @ 0x06002000
	bl CopyDataWithPossibleUncomp
	ldr r0, _08085D7C  @ gUnknown_0859FA2C
	movs r1, #0xa0
	movs r2, #0x20
	bl CopyToPaletteBuffer
	movs r0, #0
	movs r1, #0
	bl sub_8085DCC
	ldr r0, _08085D80  @ gUnknown_089A18D4
	movs r1, #0
	movs r2, #0x20
	bl CopyToPaletteBuffer
	cmp r6, #0
	bne _08085D90
	ldr r0, _08085D84  @ gUnknown_089A18F4
	ldr r1, _08085D88  @ 0x06014000
	bl CopyDataWithPossibleUncomp
	ldr r0, _08085D8C  @ gUnknown_089A230C
	movs r1, #0x90
	lsls r1, r1, #2
	movs r2, #0x20
	bl CopyToPaletteBuffer
	b _08085DA4
	.align 2, 0
_08085D60: .4byte gUnknown_089EE9E0
_08085D64: .4byte gLCDControlBuffer
_08085D68: .4byte 0x0000FFD4
_08085D6C: .4byte gBG0TilemapBuffer
_08085D70: .4byte gBG1TilemapBuffer
_08085D74: .4byte gUnknown_085A06D8
_08085D78: .4byte 0x06002000
_08085D7C: .4byte gUnknown_0859FA2C
_08085D80: .4byte gUnknown_089A18D4
_08085D84: .4byte gUnknown_089A18F4
_08085D88: .4byte 0x06014000
_08085D8C: .4byte gUnknown_089A230C
_08085D90:
	ldr r0, _08085DBC  @ gUnknown_089A1E70
	ldr r1, _08085DC0  @ 0x06014000
	bl CopyDataWithPossibleUncomp
	ldr r0, _08085DC4  @ gUnknown_089A232C
	movs r1, #0x90
	lsls r1, r1, #2
	movs r2, #0x20
	bl CopyToPaletteBuffer
_08085DA4:
	movs r0, #3
	bl BG_EnableSyncByMask
	ldr r1, _08085DC8  @ gPaletteBuffer
	movs r0, #0
	strh r0, [r1]
	bl EnablePaletteSync
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08085DBC: .4byte gUnknown_089A1E70
_08085DC0: .4byte 0x06014000
_08085DC4: .4byte gUnknown_089A232C
_08085DC8: .4byte gPaletteBuffer

	THUMB_FUNC_END sub_8085C7C

	THUMB_FUNC_START sub_8085DCC
sub_8085DCC: @ 0x08085DCC
	push {lr}
	cmp r1, #0
	bne _08085DEC
	ldr r1, _08085DE4  @ gUnknown_089EE9B0
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r1, _08085DE8  @ 0x06002800
	bl CopyDataWithPossibleUncomp
	b _08085DFA
	.align 2, 0
_08085DE4: .4byte gUnknown_089EE9B0
_08085DE8: .4byte 0x06002800
_08085DEC:
	ldr r1, _08085E00  @ gUnknown_089EE9B0
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r1, _08085E04  @ 0x06004000
	bl CopyDataWithPossibleUncomp
_08085DFA:
	pop {r0}
	bx r0
	.align 2, 0
_08085E00: .4byte gUnknown_089EE9B0
_08085E04: .4byte 0x06004000

	THUMB_FUNC_END sub_8085DCC

	THUMB_FUNC_START sub_8085E08
sub_8085E08: @ 0x08085E08
	push {r4, r5, lr}
	adds r2, r0, #0
	ldr r4, _08085E40  @ gBG0TilemapBuffer
	movs r5, #0x80
	lsls r5, r5, #2
	cmp r1, #0
	bne _08085E18
	subs r5, #0xc0
_08085E18:
	ldr r0, _08085E44  @ gUnknown_089EE9C8
	lsls r1, r2, #2
	adds r1, r1, r0
	ldr r0, [r1]
	adds r1, r4, #0
	bl CopyDataWithPossibleUncomp
	movs r1, #0xb0
	lsls r1, r1, #1
_08085E2A:
	ldrh r0, [r4]
	adds r0, r0, r5
	strh r0, [r4]
	subs r1, #1
	adds r4, #2
	cmp r1, #0
	bne _08085E2A
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08085E40: .4byte gBG0TilemapBuffer
_08085E44: .4byte gUnknown_089EE9C8

	THUMB_FUNC_END sub_8085E08

	THUMB_FUNC_START sub_8085E48
sub_8085E48: @ 0x08085E48
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x64
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _08085E60
	movs r0, #0x3d
	movs r1, #0
	bl Sound_PlaySong80024D4
	b _08085E68
_08085E60:
	movs r0, #0x3c
	movs r1, #0
	bl Sound_PlaySong80024D4
_08085E68:
	ldr r2, _08085E90  @ gLCDControlBuffer
	ldrb r0, [r2, #1]
	movs r1, #1
	orrs r0, r1
	movs r1, #2
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2, #1]
	adds r1, r4, #0
	adds r1, #0x4c
	movs r0, #0
	strh r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08085E90: .4byte gLCDControlBuffer

	THUMB_FUNC_END sub_8085E48

	THUMB_FUNC_START sub_8085E94
sub_8085E94: @ 0x08085E94
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov sl, r0
	movs r0, #2
	mov ip, r0
	mov r1, sl
	adds r1, #0x4c
	str r1, [sp]
	ldr r2, _08085F7C  @ gBG1TilemapBuffer
	mov r8, r2
_08085EB0:
	movs r6, #0xe
	mov r7, ip
	lsls r0, r7, #1
	movs r1, #1
	negs r1, r1
	add r1, ip
	mov r9, r1
	adds r1, r0, #7
	lsls r2, r1, #5
	adds r0, #8
	lsls r3, r0, #5
	adds r3, #0x1d
	lsls r0, r0, #6
	add r0, r8
	adds r5, r0, #0
	adds r5, #0x38
	adds r2, #0x1d
	lsls r1, r1, #6
	add r1, r8
	adds r4, r1, #0
	adds r4, #0x38
	lsls r2, r2, #1
	add r2, r8
	lsls r3, r3, #1
	add r3, r8
_08085EE2:
	ldr r7, [sp]
	movs r1, #0
	ldrsh r0, [r7, r1]
	subs r0, r6, r0
	adds r0, #0xe
	mov r7, ip
	subs r1, r0, r7
	cmp r1, #0x10
	ble _08085EF6
	movs r1, #0x10
_08085EF6:
	cmp r1, #0
	bge _08085EFC
	movs r1, #0
_08085EFC:
	movs r0, #0x10
	subs r1, r0, r1
	movs r0, #0xfe
	ands r1, r0
	movs r7, #0xa2
	lsls r7, r7, #7
	adds r0, r7, #0
	adds r0, r1, r0
	strh r0, [r4]
	adds r7, #1
	adds r0, r7, #0
	adds r0, r1, r0
	strh r0, [r2]
	adds r7, #0x1f
	adds r0, r1, r7
	strh r0, [r5]
	adds r7, #1
	adds r0, r1, r7
	strh r0, [r3]
	subs r3, #4
	subs r5, #4
	subs r2, #4
	subs r4, #4
	subs r6, #1
	cmp r6, #0
	bge _08085EE2
	mov ip, r9
	mov r0, ip
	cmp r0, #0
	bge _08085EB0
	ldr r1, [sp]
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	movs r0, #2
	bl BG_EnableSyncByMask
	ldr r2, [sp]
	movs r7, #0
	ldrsh r0, [r2, r7]
	cmp r0, #0x1c
	bne _08085F6C
	movs r0, #0
	strh r0, [r2]
	ldr r0, _08085F80  @ gUnknown_089EEA28
	mov r1, sl
	bl Proc_Start
	mov r1, sl
	adds r1, #0x64
	ldrh r1, [r1]
	adds r0, #0x64
	strh r1, [r0]
	mov r0, sl
	bl Proc_Break
_08085F6C:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08085F7C: .4byte gBG1TilemapBuffer
_08085F80: .4byte gUnknown_089EEA28

	THUMB_FUNC_END sub_8085E94

	THUMB_FUNC_START nullsub_30
nullsub_30: @ 0x08085F84
	bx lr

	THUMB_FUNC_END nullsub_30

	THUMB_FUNC_START sub_8085F88
sub_8085F88: @ 0x08085F88
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	mov sl, r0
	movs r0, #2
	mov ip, r0
	mov r1, sl
	adds r1, #0x4c
	str r1, [sp, #4]
	ldr r2, _08086090  @ gBG1TilemapBuffer
	mov r8, r2
_08085FA4:
	movs r6, #0xe
	mov r7, ip
	lsls r0, r7, #1
	movs r1, #1
	negs r1, r1
	add r1, ip
	mov r9, r1
	adds r1, r0, #7
	lsls r2, r1, #5
	adds r0, #8
	lsls r3, r0, #5
	adds r3, #0x1d
	lsls r0, r0, #6
	add r0, r8
	adds r5, r0, #0
	adds r5, #0x38
	adds r2, #0x1d
	lsls r1, r1, #6
	add r1, r8
	adds r4, r1, #0
	adds r4, #0x38
	lsls r2, r2, #1
	add r2, r8
	lsls r3, r3, #1
	add r3, r8
_08085FD6:
	ldr r7, [sp, #4]
	movs r1, #0
	ldrsh r0, [r7, r1]
	subs r0, r6, r0
	adds r0, #0xe
	mov r7, ip
	subs r1, r0, r7
	cmp r1, #0x10
	ble _08085FEA
	movs r1, #0x10
_08085FEA:
	cmp r1, #0
	bge _08085FF0
	movs r1, #0
_08085FF0:
	movs r0, #0xfe
	ands r1, r0
	ldr r7, _08086094  @ 0x00005501
	adds r0, r7, #0
	adds r0, r1, r0
	strh r0, [r4]
	subs r7, #1
	adds r0, r7, #0
	adds r0, r1, r0
	strh r0, [r2]
	adds r7, #0x21
	adds r0, r1, r7
	strh r0, [r5]
	subs r7, #1
	adds r0, r1, r7
	strh r0, [r3]
	subs r3, #4
	subs r5, #4
	subs r2, #4
	subs r4, #4
	subs r6, #1
	cmp r6, #0
	bge _08085FD6
	mov ip, r9
	mov r0, ip
	cmp r0, #0
	bge _08085FA4
	ldr r1, [sp, #4]
	ldrh r0, [r1]
	adds r0, #1
	movs r4, #0
	strh r0, [r1]
	movs r0, #2
	bl BG_EnableSyncByMask
	ldr r2, [sp, #4]
	movs r7, #0
	ldrsh r0, [r2, r7]
	cmp r0, #0x1c
	bne _08086080
	ldr r0, _08086098  @ gUnknown_089EEA28
	bl Proc_EndEach
	ldr r0, [sp, #4]
	strh r4, [r0]
	mov r0, sl
	adds r0, #0x52
	strh r4, [r0]
	movs r0, #1
	movs r1, #0x10
	movs r2, #0x10
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	str r4, [sp]
	movs r0, #1
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl sub_8001ED0
	movs r0, #1
	str r0, [sp]
	movs r0, #0
	movs r1, #1
	movs r2, #1
	movs r3, #1
	bl sub_8001F0C
	mov r0, sl
	bl Proc_Break
_08086080:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08086090: .4byte gBG1TilemapBuffer
_08086094: .4byte 0x00005501
_08086098: .4byte gUnknown_089EEA28

	THUMB_FUNC_END sub_8085F88

	THUMB_FUNC_START sub_808609C
sub_808609C: @ 0x0808609C
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r5, #0
	adds r4, #0x4c
	movs r0, #0
	ldrsh r1, [r4, r0]
	cmp r1, #0
	beq _080860B2
	cmp r1, #1
	beq _080860CC
	b _080860EA
_080860B2:
	adds r4, r5, #0
	adds r4, #0x52
	ldrh r0, [r4]
	movs r1, #1
	ands r1, r0
	bl sub_8085E08
	movs r0, #1
	bl BG_EnableSyncByMask
	ldrh r0, [r4]
	adds r0, #1
	b _080860E8
_080860CC:
	adds r2, r5, #0
	adds r2, #0x52
	ldrh r0, [r2]
	cmp r0, #6
	bne _080860DE
	adds r0, r5, #0
	bl Proc_Break
	b _080860F4
_080860DE:
	ldrh r0, [r2]
	ands r1, r0
	bl sub_8085DCC
	ldr r0, _080860FC  @ 0x0000FFFF
_080860E8:
	strh r0, [r4]
_080860EA:
	adds r1, r5, #0
	adds r1, #0x4c
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
_080860F4:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080860FC: .4byte 0x0000FFFF

	THUMB_FUNC_END sub_808609C

	THUMB_FUNC_START sub_8086100
sub_8086100: @ 0x08086100
	push {lr}
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	ldr r0, _0808612C  @ gBG0TilemapBuffer
	movs r1, #0
	bl BG_Fill
	ldr r0, _08086130  @ gBG1TilemapBuffer
	movs r1, #0
	bl BG_Fill
	movs r0, #3
	bl BG_EnableSyncByMask
	bl SetDefaultColorEffects
	pop {r0}
	bx r0
	.align 2, 0
_0808612C: .4byte gBG0TilemapBuffer
_08086130: .4byte gBG1TilemapBuffer

	THUMB_FUNC_END sub_8086100

	THUMB_FUNC_START sub_8086134
sub_8086134: @ 0x08086134
	adds r0, #0x4c
	movs r1, #0
	strh r1, [r0]
	bx lr

	THUMB_FUNC_END sub_8086134

	THUMB_FUNC_START sub_808613C
sub_808613C: @ 0x0808613C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	str r0, [sp, #4]
	movs r1, #0x18
	negs r1, r1
	adds r7, r0, #0
	adds r7, #0x4c
	movs r0, #0
	ldrsh r3, [r7, r0]
	movs r4, #0x10
	str r4, [sp]
	movs r0, #0
	movs r2, #0
	bl sub_8012DCC
	mov r9, r0
	movs r1, #0x80
	lsls r1, r1, #1
	mov r8, r1
	movs r2, #0
	ldrsh r3, [r7, r2]
	str r4, [sp]
	movs r0, #0
	movs r1, #2
	mov r2, r8
	bl sub_8012DCC
	mov sl, r0
	ldr r4, _08086208  @ gSinLookup
	ldr r1, _0808620C  @ gCosLookup
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #4
	mov r1, r8
	bl Div
	adds r6, r0, #0
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	movs r1, #0
	ldrsh r0, [r4, r1]
	negs r0, r0
	lsls r0, r0, #4
	mov r1, sl
	bl Div
	adds r5, r0, #0
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	movs r2, #0
	ldrsh r0, [r4, r2]
	lsls r0, r0, #4
	mov r1, r8
	bl Div
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	ldr r1, _0808620C  @ gCosLookup
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #4
	mov r1, sl
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	movs r0, #0
	adds r1, r6, #0
	adds r2, r5, #0
	adds r3, r4, #0
	bl WriteOAMRotScaleData
	movs r0, #0x18
	add r9, r0
	ldr r0, _08086210  @ 0x000001FF
	mov r1, r9
	ands r1, r0
	mov r9, r1
	ldr r3, _08086214  @ gUnknown_089EE99C
	movs r4, #0
	str r4, [sp]
	movs r0, #0
	movs r2, #0x40
	bl PutSprite
	ldrh r1, [r7]
	movs r2, #0
	ldrsh r0, [r7, r2]
	cmp r0, #0x10
	bne _08086218
	strh r4, [r7]
	ldr r0, [sp, #4]
	bl Proc_Break
	b _0808621C
	.align 2, 0
_08086208: .4byte gSinLookup
_0808620C: .4byte gCosLookup
_08086210: .4byte 0x000001FF
_08086214: .4byte gUnknown_089EE99C
_08086218:
	adds r0, r1, #1
	strh r0, [r7]
_0808621C:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_808613C

	THUMB_FUNC_START sub_808622C
sub_808622C: @ 0x0808622C
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r0, #0x4c
	movs r1, #0
	ldrsh r3, [r0, r1]
	movs r0, #8
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0x10
	bl sub_8012DCC
	adds r5, r0, #0
	adds r0, r4, #0
	adds r0, #0x64
	movs r3, #0
	ldrsh r0, [r0, r3]
	cmp r0, #0
	bne _08086268
	ldr r0, _08086264  @ gUnknown_089A230C
	movs r1, #0x90
	lsls r1, r1, #2
	movs r2, #0x20
	bl CopyToPaletteBuffer
	b _08086274
	.align 2, 0
_08086264: .4byte gUnknown_089A230C
_08086268:
	ldr r0, _080862AC  @ gUnknown_089A232C
	movs r1, #0x90
	lsls r1, r1, #2
	movs r2, #0x20
	bl CopyToPaletteBuffer
_08086274:
	ldr r0, _080862B0  @ gPaletteBuffer
	movs r1, #0x12
	movs r2, #1
	adds r3, r5, #0
	bl sub_807132C
	bl EnablePaletteSync
	ldr r3, _080862B4  @ gUnknown_089EE99C
	movs r5, #0
	str r5, [sp]
	movs r0, #0
	movs r1, #0x18
	movs r2, #0x40
	bl PutSprite
	adds r1, r4, #0
	adds r1, #0x4c
	ldrh r2, [r1]
	movs r3, #0
	ldrsh r0, [r1, r3]
	cmp r0, #8
	bne _080862B8
	strh r5, [r1]
	adds r0, r4, #0
	bl Proc_Break
	b _080862BC
	.align 2, 0
_080862AC: .4byte gUnknown_089A232C
_080862B0: .4byte gPaletteBuffer
_080862B4: .4byte gUnknown_089EE99C
_080862B8:
	adds r0, r2, #1
	strh r0, [r1]
_080862BC:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_808622C

	THUMB_FUNC_START sub_80862C4
sub_80862C4: @ 0x080862C4
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r0, #0x4c
	movs r1, #0
	ldrsh r3, [r0, r1]
	movs r0, #8
	str r0, [sp]
	movs r0, #0
	movs r1, #0x10
	movs r2, #0
	bl sub_8012DCC
	adds r5, r0, #0
	adds r0, r4, #0
	adds r0, #0x64
	movs r3, #0
	ldrsh r0, [r0, r3]
	cmp r0, #0
	bne _08086300
	ldr r0, _080862FC  @ gUnknown_089A230C
	movs r1, #0x90
	lsls r1, r1, #2
	movs r2, #0x20
	bl CopyToPaletteBuffer
	b _0808630C
	.align 2, 0
_080862FC: .4byte gUnknown_089A230C
_08086300:
	ldr r0, _08086344  @ gUnknown_089A232C
	movs r1, #0x90
	lsls r1, r1, #2
	movs r2, #0x20
	bl CopyToPaletteBuffer
_0808630C:
	ldr r0, _08086348  @ gPaletteBuffer
	movs r1, #0x12
	movs r2, #1
	adds r3, r5, #0
	bl sub_807132C
	bl EnablePaletteSync
	ldr r3, _0808634C  @ gUnknown_089EE99C
	movs r5, #0
	str r5, [sp]
	movs r0, #0
	movs r1, #0x18
	movs r2, #0x40
	bl PutSprite
	adds r1, r4, #0
	adds r1, #0x4c
	ldrh r2, [r1]
	movs r3, #0
	ldrsh r0, [r1, r3]
	cmp r0, #8
	bne _08086350
	strh r5, [r1]
	adds r0, r4, #0
	bl Proc_Break
	b _08086354
	.align 2, 0
_08086344: .4byte gUnknown_089A232C
_08086348: .4byte gPaletteBuffer
_0808634C: .4byte gUnknown_089EE99C
_08086350:
	adds r0, r2, #1
	strh r0, [r1]
_08086354:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80862C4

	THUMB_FUNC_START sub_808635C
sub_808635C: @ 0x0808635C
	push {r4, r5, r6, lr}
	mov r6, sl
	mov r5, r9
	mov r4, r8
	push {r4, r5, r6}
	sub sp, #4
	mov sl, r0
	ldr r4, _08086408  @ gSinLookup
	movs r0, #0x80
	adds r0, r0, r4
	mov r9, r0
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r0, r0, #4
	movs r2, #0x80
	lsls r2, r2, #1
	mov r8, r2
	mov r1, r8
	bl Div
	adds r6, r0, #0
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	movs r1, #0
	ldrsh r0, [r4, r1]
	negs r0, r0
	lsls r0, r0, #4
	mov r1, r8
	bl Div
	adds r5, r0, #0
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	movs r2, #0
	ldrsh r0, [r4, r2]
	lsls r0, r0, #4
	mov r1, r8
	bl Div
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	mov r1, r9
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #4
	mov r1, r8
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	movs r0, #0
	adds r1, r6, #0
	adds r2, r5, #0
	adds r3, r4, #0
	bl WriteOAMRotScaleData
	ldr r3, _0808640C  @ gUnknown_089EE99C
	movs r0, #0
	str r0, [sp]
	movs r1, #0x18
	movs r2, #0x40
	bl PutSprite
	mov r4, sl
	adds r4, #0x4c
	movs r1, #0
	ldrsh r0, [r4, r1]
	cmp r0, #0x20
	bne _080863F0
	ldr r0, _08086410  @ gUnknown_089EE9E0
	bl Proc_BreakEach
_080863F0:
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08086408: .4byte gSinLookup
_0808640C: .4byte gUnknown_089EE99C
_08086410: .4byte gUnknown_089EE9E0

	THUMB_FUNC_END sub_808635C

	THUMB_FUNC_START HandleCh5xUnits_Start
HandleCh5xUnits_Start: @ 0x08086414
	push {r4, lr}
	movs r4, #1
_08086418:
	adds r0, r4, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq _08086454
	ldr r0, [r2]
	cmp r0, #0
	beq _08086454
	ldrb r0, [r0, #4]
	cmp r0, #0xf
	blt _08086438
	cmp r0, #0x11
	ble _08086454
	cmp r0, #0x42
	beq _08086454
_08086438:
	ldr r1, [r2, #0xc]
	movs r0, #0x80
	lsls r0, r0, #9
	ands r0, r1
	cmp r0, #0
	beq _0808644C
	movs r0, #0x80
	lsls r0, r0, #0x13
	orrs r1, r0
	str r1, [r2, #0xc]
_0808644C:
	ldr r0, [r2, #0xc]
	ldr r1, _08086460  @ 0x00010001
	orrs r0, r1
	str r0, [r2, #0xc]
_08086454:
	adds r4, #1
	cmp r4, #0x3f
	ble _08086418
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08086460: .4byte 0x00010001

	THUMB_FUNC_END HandleCh5xUnits_Start

	THUMB_FUNC_START HandleCh5xUnits_End
HandleCh5xUnits_End: @ 0x08086464
	push {r4, lr}
	movs r4, #1
_08086468:
	adds r0, r4, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq _080864BA
	ldr r0, [r2]
	cmp r0, #0
	beq _080864BA
	ldrb r0, [r0, #4]
	cmp r0, #0xf
	blt _080864A8
	cmp r0, #0x11
	ble _0808648A
	cmp r0, #0x42
	beq _080864A0
	b _080864A8
_0808648A:
	ldr r0, [r2, #0xc]
	movs r1, #5
	negs r1, r1
	ands r0, r1
	ldr r1, _0808649C  @ 0x00010001
	orrs r0, r1
	str r0, [r2, #0xc]
	b _080864BA
	.align 2, 0
_0808649C: .4byte 0x00010001
_080864A0:
	adds r0, r2, #0
	bl ClearUnit
	b _080864BA
_080864A8:
	ldr r1, [r2, #0xc]
	movs r0, #0x80
	lsls r0, r0, #0x13
	ands r0, r1
	cmp r0, #0
	bne _080864BA
	ldr r0, _080864C8  @ 0xFFFEFFFE
	ands r1, r0
	str r1, [r2, #0xc]
_080864BA:
	adds r4, #1
	cmp r4, #0x3f
	ble _08086468
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080864C8: .4byte 0xFFFEFFFE

	THUMB_FUNC_END HandleCh5xUnits_End

	THUMB_FUNC_START CallRouteSplitMenu
CallRouteSplitMenu: @ 0x080864CC
	push {r4, lr}
	adds r4, r0, #0
	bl ClearBg0Bg1
	ldr r2, _0808650C  @ gLCDControlBuffer
	ldrb r0, [r2, #1]
	movs r1, #1
	orrs r0, r1
	movs r1, #2
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2, #1]
	movs r0, #0
	bl SetFont
	bl Font_LoadForUI
	bl LoadUiFrameGraphics
	ldr r0, _08086510  @ gUnknown_089F36A0
	adds r1, r4, #0
	bl StartMenu
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808650C: .4byte gLCDControlBuffer
_08086510: .4byte gUnknown_089F36A0

	THUMB_FUNC_END CallRouteSplitMenu

	THUMB_FUNC_START MenuCommand_DrawRouteSplit
MenuCommand_DrawRouteSplit: @ 0x08086514
	push {r4, r5, r6, lr}
	adds r4, r1, #0
	ldr r0, [r4, #0x30]
	ldrh r0, [r0, #4]
	bl GetStringFromIndex
	adds r6, r0, #0
	adds r5, r4, #0
	adds r5, #0x34
	adds r0, r5, #0
	movs r1, #0
	movs r2, #0
	bl Text_SetParameters
	adds r0, r5, #0
	adds r1, r6, #0
	bl Text_AppendString
	movs r0, #0x2c
	ldrsh r1, [r4, r0]
	lsls r1, r1, #5
	adds r1, #1
	movs r2, #0x2a
	ldrsh r0, [r4, r2]
	adds r1, r1, r0
	lsls r1, r1, #1
	ldr r0, _08086560  @ gBG0TilemapBuffer
	adds r1, r1, r0
	adds r0, r5, #0
	bl Text_Draw
	bl Font_InitForUIDefault
	movs r0, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08086560: .4byte gBG0TilemapBuffer

	THUMB_FUNC_END MenuCommand_DrawRouteSplit

	THUMB_FUNC_START Command_EirikaMode
Command_EirikaMode: @ 0x08086564
	push {lr}
	ldr r0, _08086578  @ gRAMChapterData
	movs r1, #2
	strb r1, [r0, #0x1b]
	ldr r0, _0808657C  @ 0x00000C17
	bl SetEventSlotC
	movs r0, #0x17
	pop {r1}
	bx r1
	.align 2, 0
_08086578: .4byte gRAMChapterData
_0808657C: .4byte 0x00000C17

	THUMB_FUNC_END Command_EirikaMode

	THUMB_FUNC_START Command_EphraimMode
Command_EphraimMode: @ 0x08086580
	push {lr}
	ldr r0, _08086594  @ gRAMChapterData
	movs r1, #3
	strb r1, [r0, #0x1b]
	ldr r0, _08086598  @ 0x00000C18
	bl SetEventSlotC
	movs r0, #0x17
	pop {r1}
	bx r1
	.align 2, 0
_08086594: .4byte gRAMChapterData
_08086598: .4byte 0x00000C18

	THUMB_FUNC_END Command_EphraimMode

	THUMB_FUNC_START sub_808659C
sub_808659C: @ 0x0808659C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x80
	ldr r0, _080865B4  @ gRAMChapterData
	ldrb r0, [r0, #0x1b]
	cmp r0, #2
	beq _080865B8
	cmp r0, #3
	beq _080865BC
	b _080865C4
	.align 2, 0
_080865B4: .4byte gRAMChapterData
_080865B8:
	movs r0, #0xf
	b _080865BE
_080865BC:
	movs r0, #1
_080865BE:
	bl GetUnitFromCharId
	adds r6, r0, #0
_080865C4:
	movs r0, #8
	ldrsb r0, [r6, r0]
	movs r1, #0x28
	adds r1, r1, r6
	mov r8, r1
	cmp r0, #0xe
	bgt _08086616
	ldrb r4, [r6, #8]
	adds r0, r4, #6
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #9
	bhi _080865E0
	movs r5, #0xa
_080865E0:
	cmp r5, #0xf
	bls _080865E6
	movs r5, #0xf
_080865E6:
	cmp r4, r5
	bcs _08086612
	mov r7, sp
_080865EC:
	mov r0, sp
	adds r1, r6, #0
	bl InitBattleUnit
	ldrb r0, [r7, #9]
	adds r0, #0x64
	strb r0, [r7, #9]
	mov r0, sp
	bl CheckBattleUnitLevelUp
	adds r0, r6, #0
	mov r1, sp
	bl UpdateUnitFromBattle
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, r5
	bcc _080865EC
_08086612:
	movs r0, #0
	strb r0, [r6, #9]
_08086616:
	movs r2, #0
	mov r3, r8
	movs r4, #0x47
_0808661C:
	adds r1, r3, r2
	ldrb r0, [r1]
	subs r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x45
	bhi _0808662C
	strb r4, [r1]
_0808662C:
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #7
	bls _0808661C
	movs r2, #0
	b _08086640
_0808663A:
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
_08086640:
	cmp r2, #4
	bhi _08086682
	lsls r0, r2, #1
	adds r1, r6, #0
	adds r1, #0x1e
	adds r1, r1, r0
	ldrh r0, [r1]
	cmp r0, #0
	bne _0808663A
	ldr r0, _08086660  @ gRAMChapterData
	ldrb r0, [r0, #0x1b]
	cmp r0, #2
	beq _08086664
	cmp r0, #3
	beq _08086674
	b _08086682
	.align 2, 0
_08086660: .4byte gRAMChapterData
_08086664:
	movs r0, #0x16
	bl MakeNewItem
	adds r1, r0, #0
	adds r0, r6, #0
	bl UnitAddItem
	b _08086682
_08086674:
	movs r0, #3
	bl MakeNewItem
	adds r1, r0, #0
	adds r0, r6, #0
	bl UnitAddItem
_08086682:
	add sp, #0x80
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_808659C

	THUMB_FUNC_START sub_8086690
sub_8086690: @ 0x08086690
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	ldr r5, [sp, #0x20]
	ldr r6, [sp, #0x24]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r4, _08086788  @ gUnknown_03001CC8
	lsls r7, r0, #3
	mov sl, r7
	add sl, r4
	lsls r5, r5, #0x18
	asrs r5, r5, #0x18
	movs r4, #0x3f
	ands r5, r4
	mov r7, sl
	ldrb r7, [r7]
	mov r8, r7
	subs r4, #0x7f
	mov r9, r4
	mov r7, r8
	ands r4, r7
	orrs r4, r5
	mov r5, sl
	strb r4, [r5]
	lsls r6, r6, #0x18
	asrs r6, r6, #0x18
	movs r4, #0x3f
	ands r6, r4
	lsls r6, r6, #6
	ldrh r5, [r5]
	ldr r7, _0808678C  @ 0xFFFFF03F
	mov r8, r7
	mov r4, r8
	ands r4, r5
	orrs r4, r6
	mov r5, sl
	strh r4, [r5]
	ldr r4, [r5]
	ldr r5, _08086790  @ 0xFFFC0FFF
	ands r4, r5
	mov r7, sl
	str r4, [r7]
	movs r4, #0
	strb r4, [r7, #3]
	ldr r4, _08086794  @ 0x0000FFFF
	strh r4, [r7, #4]
	movs r6, #0
	movs r4, #0x1e
	strh r4, [r7, #6]
	ldr r4, _08086798  @ gUnknown_03001CE8
	mov ip, r4
	lsls r5, r0, #2
	adds r5, r5, r0
	lsls r5, r5, #2
	adds r4, r5, r4
	movs r7, #1
	strb r7, [r4]
	strb r1, [r4, #1]
	strb r6, [r4, #2]
	ldrb r1, [r4, #3]
	movs r0, #2
	negs r0, r0
	ands r0, r1
	movs r1, #7
	negs r1, r1
	ands r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #7
	ands r0, r1
	movs r1, #8
	orrs r0, r1
	strb r0, [r4, #3]
	movs r0, #0x3f
	ands r2, r0
	ldrb r0, [r4, #4]
	mov r1, r9
	ands r1, r0
	orrs r1, r2
	strb r1, [r4, #4]
	lsls r3, r3, #0x18
	asrs r3, r3, #0x18
	movs r0, #0x3f
	ands r3, r0
	lsls r3, r3, #6
	ldrh r0, [r4, #4]
	mov r1, r8
	ands r1, r0
	orrs r1, r3
	strh r1, [r4, #4]
	ldrb r1, [r4, #5]
	movs r0, #0x11
	negs r0, r0
	ands r0, r1
	movs r1, #0x20
	orrs r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r4, #5]
	strb r6, [r4, #6]
	strb r7, [r4, #7]
	movs r7, #8
	add ip, r7
	add r5, ip
	mov r0, sl
	str r0, [r5]
	strb r6, [r4, #0xc]
	strb r6, [r4, #0xd]
	strb r6, [r4, #0xe]
	strb r6, [r4, #0xf]
	strb r6, [r4, #0x10]
	strb r6, [r4, #0x11]
	strb r6, [r4, #0x12]
	strb r6, [r4, #0x13]
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08086788: .4byte gUnknown_03001CC8
_0808678C: .4byte 0xFFFFF03F
_08086790: .4byte 0xFFFC0FFF
_08086794: .4byte 0x0000FFFF
_08086798: .4byte gUnknown_03001CE8

	THUMB_FUNC_END sub_8086690

	THUMB_FUNC_START sub_808679C
sub_808679C: @ 0x0808679C
	push {r4, r5, r6, lr}
	sub sp, #8
	ldr r5, _08086830  @ gUnknown_089FF480
	ldr r6, _08086834  @ gUnknown_03001CC0
	ldrb r0, [r6]
	lsls r0, r0, #2
	adds r0, r0, r5
	ldrb r1, [r0]
	movs r4, #0xe
	str r4, [sp]
	movs r0, #2
	str r0, [sp, #4]
	movs r0, #0
	movs r2, #0
	movs r3, #2
	bl sub_8086690
	ldrb r0, [r6]
	lsls r0, r0, #2
	adds r1, r5, #1
	adds r0, r0, r1
	ldrb r1, [r0]
	str r4, [sp]
	movs r0, #3
	str r0, [sp, #4]
	movs r0, #1
	movs r2, #0
	movs r3, #3
	bl sub_8086690
	ldrb r0, [r6]
	lsls r0, r0, #2
	adds r1, r5, #2
	adds r0, r0, r1
	ldrb r1, [r0]
	str r4, [sp]
	movs r0, #4
	str r0, [sp, #4]
	movs r0, #2
	movs r2, #0
	movs r3, #4
	bl sub_8086690
	ldrb r0, [r6]
	lsls r0, r0, #2
	adds r1, r5, #3
	adds r0, r0, r1
	ldrb r1, [r0]
	str r4, [sp]
	movs r0, #5
	str r0, [sp, #4]
	movs r0, #3
	movs r2, #0
	movs r3, #5
	bl sub_8086690
	ldr r0, _08086838  @ gUnknown_03001CE8
	adds r0, #0x50
	movs r1, #0
	strb r1, [r0]
	ldrb r0, [r6]
	adds r0, #1
	strb r0, [r6]
	ldrb r0, [r6]
	lsls r0, r0, #2
	adds r0, r0, r5
	ldrb r0, [r0]
	cmp r0, #0
	bne _08086828
	strb r0, [r6]
_08086828:
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08086830: .4byte gUnknown_089FF480
_08086834: .4byte gUnknown_03001CC0
_08086838: .4byte gUnknown_03001CE8

	THUMB_FUNC_END sub_808679C

	THUMB_FUNC_START sub_808683C
sub_808683C: @ 0x0808683C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	ldr r7, _08086914  @ gUnknown_02022968
	movs r0, #0
	mov r9, r0
	movs r1, #0x1f
	mov sl, r1
	movs r0, #0x80
	lsls r0, r0, #0xd
	mov r8, r0
_08086856:
	ldrh r3, [r7]
	movs r0, #0x1f
	lsrs r1, r3, #5
	lsrs r2, r3, #0xa
	ands r0, r3
	lsls r4, r0, #3
	adds r4, r4, r0
	lsls r0, r4, #4
	adds r4, r4, r0
	lsls r4, r4, #1
	mov r0, sl
	ands r1, r0
	ldr r0, _08086918  @ 0x00000259
	muls r0, r1, r0
	adds r4, r4, r0
	mov r1, sl
	ands r2, r1
	movs r0, #0x75
	muls r0, r2, r0
	adds r4, r4, r0
	lsls r4, r4, #0xa
	ldr r1, _0808691C  @ 0x0029BDDC
	adds r0, r4, r1
	mov r1, r8
	bl Div
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	ldr r1, _08086920  @ 0xFFFBEDED
	adds r0, r4, r1
	mov r1, r8
	bl Div
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	ldr r0, _08086924  @ 0xFFC71C6D
	adds r4, r4, r0
	adds r0, r4, #0
	mov r1, r8
	bl Div
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	lsls r0, r5, #0x10
	cmp r0, #0
	bge _080868B4
	movs r5, #0
_080868B4:
	lsls r0, r6, #0x10
	cmp r0, #0
	bge _080868BC
	movs r6, #0
_080868BC:
	lsls r0, r2, #0x10
	cmp r0, #0
	bge _080868C4
	movs r2, #0
_080868C4:
	lsls r0, r5, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x1f
	ble _080868CE
	movs r5, #0x1f
_080868CE:
	lsls r0, r6, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x1f
	ble _080868D8
	movs r6, #0x1f
_080868D8:
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x1f
	ble _080868E2
	movs r2, #0x1f
_080868E2:
	lsls r0, r6, #0x10
	asrs r0, r0, #0xb
	orrs r5, r0
	lsls r1, r5, #0x10
	lsls r0, r2, #0x1a
	orrs r0, r1
	lsrs r3, r0, #0x10
	strh r3, [r7]
	adds r7, #2
	mov r0, r9
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r9, r0
	cmp r0, #0x9f
	bls _08086856
	bl EnablePaletteSync
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08086914: .4byte gUnknown_02022968
_08086918: .4byte 0x00000259
_0808691C: .4byte 0x0029BDDC
_08086920: .4byte 0xFFFBEDED
_08086924: .4byte 0xFFC71C6D

	THUMB_FUNC_END sub_808683C

	THUMB_FUNC_START sub_8086928
sub_8086928: @ 0x08086928
	push {lr}
	bl Make6C_savemenu2
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8086928

.align 2, 0
