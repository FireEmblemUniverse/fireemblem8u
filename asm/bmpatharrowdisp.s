	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	@ Logic for displaying the movement path/arrow thing

	THUMB_FUNC_START sub_803306C
sub_803306C: @ 0x0803306C
	push {r4, r5, lr}
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r3, r1, #0x18
	cmp r3, #0
	bne _0803307C
	movs r0, #0
	b _080330CE
_0803307C:
	ldr r1, _080330A0  @ gUnknown_0859DBA0
	ldr r4, [r1]
	subs r5, r3, #1
	adds r1, r4, #0
	adds r1, #0x2d
	adds r2, r1, r5
	adds r1, r1, r3
	ldrb r2, [r2]
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	cmp r2, r1
	bge _080330A4
	movs r0, #3
	b _080330CE
	.align 2, 0
_080330A0: .4byte gUnknown_0859DBA0
_080330A4:
	cmp r2, r1
	ble _080330AC
	movs r0, #1
	b _080330CE
_080330AC:
	adds r1, r4, #0
	adds r1, #0x41
	adds r2, r1, r5
	adds r1, r1, r3
	ldrb r2, [r2]
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	cmp r2, r1
	bge _080330C8
	movs r0, #4
	b _080330CE
_080330C8:
	cmp r2, r1
	ble _080330CE
	movs r0, #2
_080330CE:
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_803306C

	THUMB_FUNC_START sub_80330D4
sub_80330D4: @ 0x080330D4
	push {r4, r5, lr}
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r3, r1, #0x18
	ldr r1, _080330F4  @ gUnknown_0859DBA0
	ldr r4, [r1]
	adds r1, r4, #0
	adds r1, #0x2c
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	cmp r3, r1
	bne _080330F8
	movs r0, #0
	b _08033140
	.align 2, 0
_080330F4: .4byte gUnknown_0859DBA0
_080330F8:
	adds r1, r4, #0
	adds r1, #0x2d
	adds r2, r1, r3
	adds r5, r3, #1
	adds r1, r1, r5
	ldrb r2, [r2]
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	cmp r2, r1
	bge _08033116
	movs r0, #1
	b _08033140
_08033116:
	cmp r2, r1
	ble _0803311E
	movs r0, #3
	b _08033140
_0803311E:
	adds r1, r4, #0
	adds r1, #0x41
	adds r2, r1, r3
	adds r1, r1, r5
	ldrb r2, [r2]
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	cmp r2, r1
	bge _0803313A
	movs r0, #2
	b _08033140
_0803313A:
	cmp r2, r1
	ble _08033140
	movs r0, #4
_08033140:
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80330D4

	THUMB_FUNC_START sub_8033148
sub_8033148: @ 0x08033148
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	lsls r2, r2, #0x18
	lsrs r5, r2, #0x18
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	ldr r2, _08033180  @ gUnknown_0202BCB0
	movs r6, #0xe
	ldrsh r0, [r2, r6]
	subs r1, r1, r0
	cmn r1, r3
	ble _08033184
	cmp r1, #0x9f
	bgt _08033184
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	movs r3, #0xc
	ldrsh r1, [r2, r3]
	subs r0, r0, r1
	cmn r0, r5
	ble _08033184
	cmp r0, #0xef
	bgt _08033184
	movs r0, #1
	b _08033186
	.align 2, 0
_08033180: .4byte gUnknown_0202BCB0
_08033184:
	movs r0, #0
_08033186:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8033148

	THUMB_FUNC_START sub_803318C
sub_803318C: @ 0x0803318C
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	ldr r0, _08033238  @ gUnknown_0859DBA0
	ldr r0, [r0]
	adds r1, r0, #0
	adds r1, #0x2c
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	beq _08033228
	ldrb r0, [r1]
	lsls r5, r0, #0x18
	cmp r5, #0
	blt _08033228
	ldr r0, _0803323C  @ gUnknown_0859DB6C
	mov r9, r0
_080331B2:
	ldr r0, _08033238  @ gUnknown_0859DBA0
	ldr r1, [r0]
	asrs r6, r5, #0x18
	adds r0, r1, #0
	adds r0, #0x2d
	adds r0, r0, r6
	movs r2, #0
	ldrsb r2, [r0, r2]
	adds r1, #0x41
	adds r1, r1, r6
	movs r0, #0
	ldrsb r0, [r1, r0]
	lsls r7, r2, #4
	lsls r0, r0, #4
	mov r8, r0
	adds r0, r7, #0
	mov r1, r8
	movs r2, #0x10
	movs r3, #0x10
	bl sub_8033148
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08033220
	lsrs r5, r5, #0x18
	adds r0, r5, #0
	bl sub_803306C
	adds r4, r0, #0
	adds r0, r5, #0
	bl sub_80330D4
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x17
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #1
	adds r4, r4, r1
	add r4, r9
	ldrh r3, [r4]
	ldr r0, _08033240  @ gUnknown_0202BCB0
	movs r2, #0xc
	ldrsh r1, [r0, r2]
	subs r1, r7, r1
	movs r4, #0xe
	ldrsh r2, [r0, r4]
	mov r0, r8
	subs r2, r0, r2
	str r3, [sp]
	movs r0, #0xb
	ldr r3, _08033244  @ gObject_16x16
	bl PutSprite
_08033220:
	subs r0, r6, #1
	lsls r5, r0, #0x18
	cmp r5, #0
	bge _080331B2
_08033228:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08033238: .4byte gUnknown_0859DBA0
_0803323C: .4byte gUnknown_0859DB6C
_08033240: .4byte gUnknown_0202BCB0
_08033244: .4byte gObject_16x16

	THUMB_FUNC_END sub_803318C

	THUMB_FUNC_START sub_8033248
sub_8033248: @ 0x08033248
	push {lr}
	bl sub_8032EB4
	bl sub_803318C
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8033248

.align 2, 0
