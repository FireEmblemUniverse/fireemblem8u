	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	@ get/set party gold amount

	THUMB_FUNC_START GetPartyGoldAmount
GetPartyGoldAmount: @ 0x08024DE8
	push {lr}
	ldr r1, _08024DF8  @ gUnknown_0202BCF0
	movs r0, #0xe
	ldrsb r0, [r1, r0]
	cmp r0, #5
	beq _08024DFC
	ldr r0, [r1, #8]
	b _08024DFE
	.align 2, 0
_08024DF8: .4byte gUnknown_0202BCF0
_08024DFC:
	movs r0, #0
_08024DFE:
	pop {r1}
	bx r1

	THUMB_FUNC_START SetPartyGoldAmount
SetPartyGoldAmount: @ 0x08024E04
	push {lr}
	ldr r2, _08024E18  @ gUnknown_0202BCF0
	str r0, [r2, #8]
	ldr r1, _08024E1C  @ 0x000F423F
	cmp r0, r1
	ble _08024E12
	str r1, [r2, #8]
_08024E12:
	pop {r0}
	bx r0
	.align 2, 0
_08024E18: .4byte gUnknown_0202BCF0
_08024E1C: .4byte 0x000F423F

	THUMB_FUNC_START sub_8024E20
sub_8024E20: @ 0x08024E20
	push {lr}
	ldr r2, _08024E38  @ gUnknown_0202BCF0
	ldr r1, [r2, #8]
	adds r1, r1, r0
	str r1, [r2, #8]
	ldr r0, _08024E3C  @ 0x000F423F
	cmp r1, r0
	ble _08024E32
	str r0, [r2, #8]
_08024E32:
	pop {r0}
	bx r0
	.align 2, 0
_08024E38: .4byte gUnknown_0202BCF0
_08024E3C: .4byte 0x000F423F

.align 2, 0
