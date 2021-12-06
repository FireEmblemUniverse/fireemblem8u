	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	@ Random monster unit generation utility
	@ (for skirmishes and valni/lagdou)

	THUMB_FUNC_START GenerateMonsterItems
GenerateMonsterItems: @ 0x08078350
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	ldr r5, _08078360  @ gUnknown_088D2440
	b _080783F6
	.align 2, 0
_08078360: .4byte gUnknown_088D2440
_08078364:
	cmp r1, r2
	bne _080783F4
	adds r0, r5, #0
	adds r0, #0xb
	movs r1, #5
	bl SelectFromWeightedArray
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r1, r5, #1
	adds r1, r1, r0
	ldrb r4, [r1]
	adds r1, r5, #0
	adds r1, #0x15
	adds r1, r1, r0
	ldrb r1, [r1]
	lsls r0, r1, #2
	adds r0, r0, r1
	ldr r7, _080783EC  @ gUnknown_088D22C7
	adds r0, r0, r7
	movs r1, #5
	bl SelectFromWeightedArray
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _080783F0  @ gUnknown_088D21C8
	mov r8, r1
	lsls r1, r4, #2
	adds r1, r1, r4
	adds r0, r0, r1
	add r0, r8
	ldrb r0, [r0]
	lsls r6, r0, #0x10
	adds r0, r5, #0
	adds r0, #0x10
	movs r1, #5
	bl SelectFromWeightedArray
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0xff
	beq _080783E6
	adds r0, r5, #6
	adds r0, r0, r1
	ldrb r4, [r0]
	cmp r4, #0
	beq _080783E6
	adds r0, r5, #0
	adds r0, #0x1a
	adds r0, r0, r1
	ldrb r1, [r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	adds r0, r0, r7
	movs r1, #5
	bl SelectFromWeightedArray
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r4, #2
	adds r1, r1, r4
	adds r0, r0, r1
	add r0, r8
	ldrb r0, [r0]
	orrs r6, r0
_080783E6:
	adds r0, r6, #0
	b _08078400
	.align 2, 0
_080783EC: .4byte gUnknown_088D22C7
_080783F0: .4byte gUnknown_088D21C8
_080783F4:
	adds r5, #0x20
_080783F6:
	ldrb r1, [r5]
	adds r0, r1, #0
	cmp r0, #0xff
	bne _08078364
	movs r0, #0
_08078400:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END GenerateMonsterItems

.align 2, 0
