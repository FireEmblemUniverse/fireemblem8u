	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	@ Random monster unit generation utility
	@ (for skirmishes and valni/lagdou)

	THUMB_FUNC_START sub_80782A8
sub_80782A8: @ 0x080782A8
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	lsls r1, r1, #0x18
	lsrs r6, r1, #0x18
	bl NextRN_100
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	movs r5, #0
	movs r2, #0
	cmp r2, r6
	bcs _080782E2
_080782C0:
	adds r1, r5, #0
	ldrb r0, [r4]
	adds r0, r1, r0
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r1, r3
	bhi _080782D6
	cmp r3, r5
	bcs _080782D6
	adds r0, r2, #0
	b _080782E4
_080782D6:
	adds r4, #1
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, r6
	bcc _080782C0
_080782E2:
	movs r0, #0xff
_080782E4:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80782A8

	THUMB_FUNC_START GenerateMonsterLevel
GenerateMonsterLevel: @ 0x080782EC
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r0, _08078320  @ gUnknown_088D2058
	movs r1, #7
	bl sub_80782A8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r0, #0xfe
	adds r0, r4, r0
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r0, #0
	bgt _0807830C
	movs r4, #1
_0807830C:
	lsls r0, r4, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x14
	ble _08078316
	movs r4, #0x14
_08078316:
	adds r0, r4, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08078320: .4byte gUnknown_088D2058

	THUMB_FUNC_END GenerateMonsterLevel

	THUMB_FUNC_START GenerateMonsterClass
GenerateMonsterClass: @ 0x08078324
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r4, r0, #1
	adds r4, r4, r0
	lsls r4, r4, #2
	ldr r0, _0807834C  @ gUnknown_088D2060
	adds r4, r4, r0
	adds r0, r4, #5
	movs r1, #5
	bl sub_80782A8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r4, r4, r0
	ldrb r0, [r4]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0807834C: .4byte gUnknown_088D2060

	THUMB_FUNC_END GenerateMonsterClass

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
	bl sub_80782A8
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
	bl sub_80782A8
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
	bl sub_80782A8
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
	bl sub_80782A8
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
