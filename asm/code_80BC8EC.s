	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	THUMB_FUNC_START sub_80BC970
sub_80BC970: @ 0x080BC970
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r4, r0, #0
	mov r8, r1
	movs r0, #0
	str r0, [sp]
	ldr r2, _080BCA04  @ 0x0500003A
	mov r0, sp
	bl CpuSet
	movs r2, #0
	adds r0, r4, #0
	adds r0, #0xa4
	adds r4, #0xc4
	movs r1, #0
	ldrsb r1, [r4, r1]
	cmp r2, r1
	bge _080BC9F4
	mov r9, r0
	ldr r3, _080BCA08  @ gWMPathData
	mov sl, r3
	mov ip, r1
_080BC9A4:
	adds r0, r0, r2
	movs r1, #0
	ldrsb r1, [r0, r1]
	movs r5, #0
	adds r7, r2, #1
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	add r0, sl
	adds r6, r0, #4
	adds r4, r0, #5
_080BC9BA:
	adds r0, r6, r5
	movs r2, #0
	ldrsb r2, [r0, r2]
	lsls r0, r2, #3
	mov r1, r8
	adds r3, r1, r0
	movs r0, #0
	ldrsb r0, [r3, r0]
	adds r0, r3, r0
	ldrb r1, [r4]
	strb r1, [r0, #1]
	ldrb r0, [r3]
	adds r0, #1
	strb r0, [r3]
	cmp r2, #0
	bne _080BC9E4
	movs r0, #0
	ldrsb r0, [r3, r0]
	adds r0, r3, r0
	ldrb r1, [r4]
	strb r1, [r0, #1]
_080BC9E4:
	subs r4, #1
	adds r5, #1
	cmp r5, #1
	ble _080BC9BA
	adds r2, r7, #0
	mov r0, r9
	cmp r2, ip
	blt _080BC9A4
_080BC9F4:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BCA04: .4byte 0x0500003A
_080BCA08: .4byte gWMPathData

	THUMB_FUNC_END sub_80BC970

	THUMB_FUNC_START sub_80BCA0C
sub_80BCA0C: @ 0x080BCA0C
	push {lr}
	ldr r1, _080BCA18  @ gUnknown_0201AFF0
	bl sub_80BC970
	pop {r0}
	bx r0
	.align 2, 0
_080BCA18: .4byte gUnknown_0201AFF0

	THUMB_FUNC_END sub_80BCA0C

	THUMB_FUNC_START sub_80BCA1C
sub_80BCA1C: @ 0x080BCA1C
	push {r4, lr}
	adds r3, r0, #0
	movs r2, #4
	ldr r0, _080BCA3C  @ gGMData
	adds r1, r0, #0
	adds r1, #0x10
_080BCA28:
	movs r4, #0x12
	ldrsh r0, [r1, r4]
	cmp r0, #0
	beq _080BCA40
	ldrb r0, [r1, #0x11]
	cmp r3, r0
	bne _080BCA40
	adds r0, r2, #0
	b _080BCA4C
	.align 2, 0
_080BCA3C: .4byte gGMData
_080BCA40:
	adds r1, #4
	adds r2, #1
	cmp r2, #6
	ble _080BCA28
	movs r0, #1
	negs r0, r0
_080BCA4C:
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80BCA1C

	THUMB_FUNC_START sub_80BCA54
sub_80BCA54: @ 0x080BCA54
	push {r4, r5, lr}
	adds r2, r0, #0
	movs r0, #0
	strb r0, [r2]
	ldr r0, _080BCA8C  @ gGMData
	adds r5, r2, #1
	adds r3, r0, #0
	adds r3, #0x10
	movs r4, #2
_080BCA66:
	movs r1, #0x12
	ldrsh r0, [r3, r1]
	cmp r0, #0
	beq _080BCA7C
	ldrb r0, [r2]
	adds r0, r5, r0
	ldrb r1, [r3, #0x11]
	strb r1, [r0]
	ldrb r0, [r2]
	adds r0, #1
	strb r0, [r2]
_080BCA7C:
	adds r3, #4
	subs r4, #1
	cmp r4, #0
	bge _080BCA66
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080BCA8C: .4byte gGMData

	THUMB_FUNC_END sub_80BCA54

	THUMB_FUNC_START sub_80BCA90
sub_80BCA90: @ 0x080BCA90
	push {r4, lr}
	adds r4, r1, #0
	movs r2, #0
	ldrb r3, [r0]
	cmp r2, r3
	bge _080BCAB0
	adds r1, r0, #1
_080BCA9E:
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, r4
	bne _080BCAAA
	movs r0, #1
	b _080BCAB2
_080BCAAA:
	adds r2, #1
	cmp r2, r3
	blt _080BCA9E
_080BCAB0:
	movs r0, #0
_080BCAB2:
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80BCA90

	THUMB_FUNC_START sub_80BCAB8
sub_80BCAB8: @ 0x080BCAB8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x1c
	adds r7, r0, #0
	str r1, [sp, #8]
	ldr r0, [sp, #0x3c]
	ldr r1, [sp, #0x40]
	mov r8, r1
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	str r2, [sp, #0xc]
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0x10]
	ldr r0, [r7, #0x20]
	cmp r8, r0
	bge _080BCB98
	lsls r0, r3, #0x18
	asrs r1, r0, #0x15
	ldr r2, [sp, #8]
	adds r2, r2, r1
	mov sl, r2
	movs r3, #0
	mov r9, r3
	movs r1, #0
	ldrsb r1, [r2, r1]
	str r0, [sp, #0x18]
	cmp r9, r1
	bge _080BCB98
	adds r0, r7, #0
	adds r0, #0x10
	add r0, r8
	str r0, [sp, #0x14]
	mov r4, sl
	adds r4, #1
_080BCB08:
	movs r1, #0
	ldrsb r1, [r4, r1]
	ldr r5, [sp, #0xc]
	lsls r0, r5, #0x18
	asrs r0, r0, #0x18
	cmp r1, r0
	beq _080BCB88
	movs r2, #0
	ldr r3, [sp, #0x10]
	lsls r0, r3, #0x18
	asrs r6, r0, #0x18
	cmp r1, r6
	bne _080BCB24
	movs r2, #1
_080BCB24:
	adds r5, r2, #0
	cmp r5, #0
	bne _080BCB3A
	movs r1, #0
	ldrsb r1, [r4, r1]
	ldr r0, _080BCB6C  @ gUnknown_0201B100
	bl sub_80BCA90
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080BCB88
_080BCB3A:
	ldrb r0, [r4]
	ldr r1, [sp, #0x14]
	strb r0, [r1]
	adds r1, r7, #0
	adds r1, #0x10
	cmp r5, #0
	beq _080BCB70
	ldr r0, [r7, #0x20]
	cmp r8, r0
	bge _080BCB68
	movs r2, #1
	cmp r2, r8
	bgt _080BCB64
	adds r3, r1, #0
_080BCB56:
	adds r0, r7, r2
	adds r1, r3, r2
	ldrb r1, [r1]
	strb r1, [r0]
	adds r2, #1
	cmp r2, r8
	ble _080BCB56
_080BCB64:
	mov r2, r8
	str r2, [r7, #0x20]
_080BCB68:
	movs r0, #1
	b _080BCB9A
	.align 2, 0
_080BCB6C: .4byte gUnknown_0201B100
_080BCB70:
	movs r3, #0
	ldrsb r3, [r4, r3]
	str r6, [sp]
	mov r0, r8
	adds r0, #1
	str r0, [sp, #4]
	adds r0, r7, #0
	ldr r1, [sp, #8]
	ldr r5, [sp, #0x18]
	asrs r2, r5, #0x18
	bl sub_80BCAB8
_080BCB88:
	adds r4, #1
	movs r0, #1
	add r9, r0
	mov r1, sl
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r9, r0
	blt _080BCB08
_080BCB98:
	movs r0, #0
_080BCB9A:
	add sp, #0x1c
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80BCAB8

	THUMB_FUNC_START sub_80BCBAC
sub_80BCBAC: @ 0x080BCBAC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x1c
	adds r6, r0, #0
	mov r8, r1
	ldr r0, [sp, #0x3c]
	ldr r7, [sp, #0x40]
	ldr r1, [sp, #0x44]
	mov r9, r1
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	str r2, [sp, #0xc]
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0x10]
	ldr r0, [r6, #0x20]
	cmp r7, r0
	blt _080BCBDC
	b _080BCCE8
_080BCBDC:
	lsls r0, r3, #0x18
	asrs r1, r0, #0x15
	add r1, r8
	str r1, [sp, #0x18]
	movs r2, #0
	str r2, [sp, #0x14]
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	mov sl, r0
	cmp r2, r1
	blt _080BCBF6
	b _080BCCE8
_080BCBF6:
	ldr r5, [sp, #0x18]
	adds r5, #1
_080BCBFA:
	ldrb r3, [r5]
	movs r1, #0
	ldrsb r1, [r5, r1]
	ldr r4, [sp, #0xc]
	lsls r0, r4, #0x18
	asrs r0, r0, #0x18
	cmp r1, r0
	beq _080BCCD4
	movs r2, #0
	ldr r4, [sp, #0x10]
	lsls r0, r4, #0x18
	asrs r4, r0, #0x18
	cmp r1, r4
	bne _080BCC18
	movs r2, #1
_080BCC18:
	adds r1, r6, #0
	adds r1, #0x10
	adds r0, r1, r7
	strb r3, [r0]
	adds r3, r1, #0
	mov r0, r9
	cmp r0, #0
	blt _080BCC62
	cmp r2, #0
	beq _080BCC76
	movs r2, #0
	ldr r0, [r6, #0x24]
	cmp r9, r0
	bge _080BCC3C
	mov r1, r9
	str r1, [r6, #0x24]
	movs r2, #1
	b _080BCC4C
_080BCC3C:
	cmp r9, r0
	bne _080BCC48
	ldr r0, [r6, #0x20]
	cmp r7, r0
	bge _080BCC48
	movs r2, #1
_080BCC48:
	cmp r2, #0
	beq _080BCCB6
_080BCC4C:
	movs r2, #1
	cmp r2, r7
	bgt _080BCCB4
_080BCC52:
	adds r0, r6, r2
	adds r1, r3, r2
	ldrb r1, [r1]
	strb r1, [r0]
	adds r2, #1
	cmp r2, r7
	ble _080BCC52
	b _080BCCB4
_080BCC62:
	cmp r2, #0
	bne _080BCC98
	movs r1, #0
	ldrsb r1, [r5, r1]
	ldr r0, _080BCC94  @ gUnknown_0201B100
	bl sub_80BCA90
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080BCCBA
_080BCC76:
	movs r3, #0
	ldrsb r3, [r5, r3]
	str r4, [sp]
	adds r0, r7, #1
	str r0, [sp, #4]
	mov r0, r9
	adds r0, #1
	str r0, [sp, #8]
	adds r0, r6, #0
	mov r1, r8
	mov r4, sl
	asrs r2, r4, #0x18
	bl sub_80BCBAC
	b _080BCCD4
	.align 2, 0
_080BCC94: .4byte gUnknown_0201B100
_080BCC98:
	ldr r0, [r6, #0x20]
	cmp r7, r0
	bge _080BCCB6
	movs r2, #1
	cmp r2, r7
	bgt _080BCCB4
	adds r3, r1, #0
_080BCCA6:
	adds r0, r6, r2
	adds r1, r3, r2
	ldrb r1, [r1]
	strb r1, [r0]
	adds r2, #1
	cmp r2, r7
	ble _080BCCA6
_080BCCB4:
	str r7, [r6, #0x20]
_080BCCB6:
	movs r0, #1
	b _080BCCEA
_080BCCBA:
	movs r3, #0
	ldrsb r3, [r5, r3]
	str r4, [sp]
	adds r0, r7, #1
	str r0, [sp, #4]
	mov r0, r9
	str r0, [sp, #8]
	adds r0, r6, #0
	mov r1, r8
	mov r4, sl
	asrs r2, r4, #0x18
	bl sub_80BCBAC
_080BCCD4:
	adds r5, #1
	ldr r0, [sp, #0x14]
	adds r0, #1
	str r0, [sp, #0x14]
	ldr r1, [sp, #0x18]
	movs r0, #0
	ldrsb r0, [r1, r0]
	ldr r2, [sp, #0x14]
	cmp r2, r0
	blt _080BCBFA
_080BCCE8:
	movs r0, #0
_080BCCEA:
	add sp, #0x1c
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80BCBAC

	THUMB_FUNC_START sub_80BCCFC
sub_80BCCFC: @ 0x080BCCFC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x18
	adds r4, r2, #0
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	str r7, [sp, #0x14]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov r9, r1
	mov sl, r9
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _080BCD80  @ gUnknown_0201B100
	bl sub_80BCA54
	lsls r4, r4, #0x18
	asrs r4, r4, #0x18
	mov r8, r4
	cmp r4, #0
	beq _080BCD32
	ldr r1, _080BCD84  @ gUnknown_0201B0D8
	movs r0, #0x10
	str r0, [r1, #0x24]
_080BCD32:
	ldr r6, _080BCD84  @ gUnknown_0201B0D8
	movs r0, #0x10
	str r0, [r6, #0x20]
	movs r4, #0
	str r4, [sp, #0xc]
	ldr r5, _080BCD88  @ 0x05000004
	add r0, sp, #0xc
	adds r1, r6, #0
	adds r2, r5, #0
	bl CpuSet
	str r4, [sp, #0x10]
	add r0, sp, #0x10
	adds r1, r6, #0
	adds r1, #0x10
	adds r2, r5, #0
	bl CpuSet
	strb r7, [r6]
	strb r7, [r6, #0x10]
	mov r0, r8
	cmp r0, #0
	beq _080BCD90
	ldr r1, _080BCD8C  @ gUnknown_0201AFF0
	movs r2, #1
	negs r2, r2
	lsls r3, r7, #0x18
	asrs r3, r3, #0x18
	mov r4, r9
	lsls r0, r4, #0x18
	asrs r0, r0, #0x18
	str r0, [sp]
	movs r4, #1
	str r4, [sp, #4]
	str r2, [sp, #8]
	adds r0, r6, #0
	bl sub_80BCBAC
	b _080BCDAE
	.align 2, 0
_080BCD80: .4byte gUnknown_0201B100
_080BCD84: .4byte gUnknown_0201B0D8
_080BCD88: .4byte 0x05000004
_080BCD8C: .4byte gUnknown_0201AFF0
_080BCD90:
	ldr r1, _080BCDBC  @ gUnknown_0201AFF0
	movs r2, #1
	negs r2, r2
	ldr r0, [sp, #0x14]
	lsls r3, r0, #0x18
	asrs r3, r3, #0x18
	mov r4, sl
	lsls r0, r4, #0x18
	asrs r0, r0, #0x18
	str r0, [sp]
	movs r4, #1
	str r4, [sp, #4]
	adds r0, r6, #0
	bl sub_80BCAB8
_080BCDAE:
	cmp r0, #0
	beq _080BCDC0
	ldrb r0, [r6, #0x11]
	strb r0, [r6, #1]
	str r4, [r6, #0x20]
	movs r0, #1
	b _080BCDCE
	.align 2, 0
_080BCDBC: .4byte gUnknown_0201AFF0
_080BCDC0:
	movs r1, #0
	ldr r0, _080BCDE0  @ gUnknown_0201B0D8
	ldr r0, [r0, #0x20]
	cmp r0, #0xf
	bgt _080BCDCC
	movs r1, #1
_080BCDCC:
	adds r0, r1, #0
_080BCDCE:
	add sp, #0x18
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080BCDE0: .4byte gUnknown_0201B0D8

	THUMB_FUNC_END sub_80BCCFC

	THUMB_FUNC_START sub_80BCDE4
sub_80BCDE4: @ 0x080BCDE4
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	movs r1, #0
	ldr r3, _080BCE04  @ gWMPathData
_080BCDEE:
	movs r0, #4
	ldrsb r0, [r3, r0]
	cmp r5, r0
	bne _080BCE08
	movs r0, #5
	ldrsb r0, [r3, r0]
	cmp r4, r0
	bne _080BCE08
	movs r0, #0
	b _080BCE1A
	.align 2, 0
_080BCE04: .4byte gWMPathData
_080BCE08:
	movs r0, #5
	ldrsb r0, [r3, r0]
	cmp r5, r0
	bne _080BCE20
	movs r0, #4
	ldrsb r0, [r3, r0]
	cmp r4, r0
	bne _080BCE20
	movs r0, #1
_080BCE1A:
	str r0, [r2]
	adds r0, r1, #0
	b _080BCE2C
_080BCE20:
	adds r3, #0xc
	adds r1, #1
	cmp r1, #0x1f
	bls _080BCDEE
	movs r0, #1
	negs r0, r0
_080BCE2C:
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80BCDE4

	THUMB_FUNC_START sub_80BCE34
sub_80BCE34: @ 0x080BCE34
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x1c
	adds r6, r3, #0
	ldr r5, [sp, #0x3c]
	ldr r3, [sp, #0x40]
	mov r9, r3
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	str r2, [sp, #4]
	mov r2, sp
	bl sub_80BCDE4
	mov sl, r0
	cmp r0, #0
	bge _080BCE5E
	movs r0, #0
	b _080BCF9A
_080BCE5E:
	movs r0, #0
	strh r0, [r6]
	mov r0, sl
	lsls r4, r0, #1
	adds r0, r4, r0
	lsls r0, r0, #2
	ldr r1, _080BCF00  @ gWMPathData
	adds r0, r0, r1
	mov r8, r0
	adds r0, #4
	ldr r1, [sp]
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r1, r0, #5
	ldr r0, _080BCF04  @ gWMNodeData
	adds r1, r1, r0
	movs r2, #0x18
	ldrsh r0, [r1, r2]
	mov r3, r9
	lsls r0, r3
	str r0, [r5]
	movs r2, #0x1a
	ldrsh r0, [r1, r2]
	lsls r0, r3
	str r0, [r5, #4]
	adds r6, #2
	adds r5, #8
	mov r0, sl
	bl sub_80BC3D4
	adds r3, r0, #0
	ldr r0, [sp]
	str r4, [sp, #0x10]
	cmp r0, #0
	bne _080BCF08
	movs r7, #0
	adds r0, r3, #2
	str r0, [sp, #0xc]
	cmp r7, r3
	bge _080BCF60
	mov r2, r8
	ldr r1, [sp, #4]
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	mov r8, r0
_080BCEBC:
	ldr r0, [r2, #8]
	lsls r4, r7, #3
	adds r0, r4, r0
	ldr r0, [r0]
	mov r1, r8
	muls r1, r0, r1
	movs r0, #0x80
	lsls r0, r0, #5
	str r2, [sp, #0x14]
	str r3, [sp, #0x18]
	bl DivArm
	strh r0, [r6]
	ldr r2, [sp, #0x14]
	ldr r0, [r2, #8]
	adds r4, r4, r0
	movs r1, #4
	ldrsh r0, [r4, r1]
	mov r1, r9
	lsls r0, r1
	str r0, [r5]
	movs r1, #6
	ldrsh r0, [r4, r1]
	mov r1, r9
	lsls r0, r1
	str r0, [r5, #4]
	adds r6, #2
	adds r5, #8
	adds r7, #1
	ldr r3, [sp, #0x18]
	cmp r7, r3
	blt _080BCEBC
	b _080BCF60
	.align 2, 0
_080BCF00: .4byte gWMPathData
_080BCF04: .4byte gWMNodeData
_080BCF08:
	subs r7, r3, #1
	adds r3, #2
	str r3, [sp, #0xc]
	cmp r7, #0
	blt _080BCF60
	ldr r2, [sp, #4]
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	str r0, [sp, #8]
	mov r2, r8
_080BCF1C:
	ldr r0, [r2, #8]
	lsls r4, r7, #3
	adds r0, r4, r0
	ldr r0, [r0]
	movs r3, #0x80
	lsls r3, r3, #5
	subs r0, r3, r0
	ldr r3, [sp, #8]
	adds r1, r3, #0
	muls r1, r0, r1
	mov r8, r1
	movs r0, #0x80
	lsls r0, r0, #5
	str r2, [sp, #0x14]
	bl DivArm
	strh r0, [r6]
	ldr r2, [sp, #0x14]
	ldr r0, [r2, #8]
	adds r4, r4, r0
	movs r1, #4
	ldrsh r0, [r4, r1]
	mov r3, r9
	lsls r0, r3
	str r0, [r5]
	movs r1, #6
	ldrsh r0, [r4, r1]
	lsls r0, r3
	str r0, [r5, #4]
	adds r6, #2
	adds r5, #8
	subs r7, #1
	cmp r7, #0
	bge _080BCF1C
_080BCF60:
	mov r2, sp
	ldrh r2, [r2, #4]
	strh r2, [r6]
	ldr r0, [sp, #0x10]
	add r0, sl
	lsls r0, r0, #2
	ldr r1, _080BCFAC  @ gWMPathData
	adds r0, r0, r1
	ldr r2, [sp]
	movs r1, #1
	subs r1, r1, r2
	adds r0, #4
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r1, r0, #5
	ldr r0, _080BCFB0  @ gWMNodeData
	adds r1, r1, r0
	movs r3, #0x18
	ldrsh r0, [r1, r3]
	mov r2, r9
	lsls r0, r2
	str r0, [r5]
	movs r3, #0x1a
	ldrsh r0, [r1, r3]
	lsls r0, r2
	str r0, [r5, #4]
	ldr r0, [sp, #0xc]
_080BCF9A:
	add sp, #0x1c
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080BCFAC: .4byte gWMPathData
_080BCFB0: .4byte gWMNodeData

	THUMB_FUNC_END sub_80BCE34

	THUMB_FUNC_START sub_80BCFB4
sub_80BCFB4: @ 0x080BCFB4
	push {r4, lr}
	ldr r0, _080BCFD8  @ gGMData
	movs r4, #0xfd
	adds r2, r0, #0
	adds r2, #0x30
	movs r3, #0x1c
_080BCFC0:
	ldrb r1, [r2]
	adds r0, r4, #0
	ands r0, r1
	strb r0, [r2]
	adds r2, #4
	subs r3, #1
	cmp r3, #0
	bge _080BCFC0
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BCFD8: .4byte gGMData

	THUMB_FUNC_END sub_80BCFB4

	THUMB_FUNC_START sub_80BCFDC
sub_80BCFDC: @ 0x080BCFDC
	push {r4, r5, lr}
	adds r5, r0, #0
	subs r0, #0x25
	cmp r0, #8
	bhi _080BCFEE
	movs r5, #0x24
	b _080BCFF8
_080BCFEA:
	adds r0, r4, #0
	b _080BD00E
_080BCFEE:
	adds r0, r5, #0
	subs r0, #0x2f
	cmp r0, #8
	bhi _080BCFF8
	movs r5, #0x2e
_080BCFF8:
	movs r4, #0
_080BCFFA:
	adds r0, r4, #0
	bl WMLoc_GetChapterId
	cmp r5, r0
	beq _080BCFEA
	adds r4, #1
	cmp r4, #0x1c
	ble _080BCFFA
	movs r0, #1
	negs r0, r0
_080BD00E:
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80BCFDC

	THUMB_FUNC_START sub_80BD014
sub_80BD014: @ 0x080BD014
	push {r4, r5, lr}
	movs r3, #0
	movs r5, #1
	movs r4, #2
	adds r2, r0, #0
	adds r2, #0x30
_080BD020:
	ldrb r1, [r2]
	adds r0, r5, #0
	ands r0, r1
	cmp r0, #0
	beq _080BD036
	adds r0, r4, #0
	ands r0, r1
	cmp r0, #0
	beq _080BD036
	adds r0, r3, #0
	b _080BD042
_080BD036:
	adds r2, #4
	adds r3, #1
	cmp r3, #0x1c
	ble _080BD020
	movs r0, #1
	negs r0, r0
_080BD042:
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80BD014

	THUMB_FUNC_START sub_80BD048
sub_80BD048: @ 0x080BD048
	push {lr}
	ldr r0, _080BD05C  @ gGMData
	bl sub_80BD014
	cmp r0, #0
	blt _080BD060
	bl WMLoc_GetChapterId
	b _080BD064
	.align 2, 0
_080BD05C: .4byte gGMData
_080BD060:
	movs r0, #1
	negs r0, r0
_080BD064:
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80BD048

	THUMB_FUNC_START GetChapterThing
GetChapterThing: @ 0x080BD068
	push {r4, r5, r6, lr}
	ldr r0, _080BD080  @ gPlaySt
	movs r5, #0xe
	ldrsb r5, [r0, r5]
	cmp r5, #0x47
	bls _080BD076
	b _080BD1A8
_080BD076:
	lsls r0, r5, #2
	ldr r1, _080BD084  @ _080BD088
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080BD080: .4byte gPlaySt
_080BD084: .4byte _080BD088
_080BD088: @ jump table
	.4byte _080BD1E4 @ case 0
	.4byte _080BD1E4 @ case 1
	.4byte _080BD1A8 @ case 2
	.4byte _080BD1A8 @ case 3
	.4byte _080BD1A8 @ case 4
	.4byte _080BD1E4 @ case 5
	.4byte _080BD1A8 @ case 6
	.4byte _080BD1A8 @ case 7
	.4byte _080BD1A8 @ case 8
	.4byte _080BD1A8 @ case 9
	.4byte _080BD1A8 @ case 10
	.4byte _080BD1A8 @ case 11
	.4byte _080BD1E4 @ case 12
	.4byte _080BD1A8 @ case 13
	.4byte _080BD1A8 @ case 14
	.4byte _080BD1A8 @ case 15
	.4byte _080BD1A8 @ case 16
	.4byte _080BD1A8 @ case 17
	.4byte _080BD1A8 @ case 18
	.4byte _080BD1A8 @ case 19
	.4byte _080BD1A8 @ case 20
	.4byte _080BD1E4 @ case 21
	.4byte _080BD1E4 @ case 22
	.4byte _080BD1A8 @ case 23
	.4byte _080BD1A8 @ case 24
	.4byte _080BD1E4 @ case 25
	.4byte _080BD1A8 @ case 26
	.4byte _080BD1A8 @ case 27
	.4byte _080BD1A8 @ case 28
	.4byte _080BD1A8 @ case 29
	.4byte _080BD1A8 @ case 30
	.4byte _080BD1A8 @ case 31
	.4byte _080BD1A8 @ case 32
	.4byte _080BD1A8 @ case 33
	.4byte _080BD1E4 @ case 34
	.4byte _080BD1E4 @ case 35
	.4byte _080BD1A8 @ case 36
	.4byte _080BD1A8 @ case 37
	.4byte _080BD1A8 @ case 38
	.4byte _080BD1A8 @ case 39
	.4byte _080BD1A8 @ case 40
	.4byte _080BD1A8 @ case 41
	.4byte _080BD1A8 @ case 42
	.4byte _080BD1A8 @ case 43
	.4byte _080BD1A8 @ case 44
	.4byte _080BD1A8 @ case 45
	.4byte _080BD1A8 @ case 46
	.4byte _080BD1A8 @ case 47
	.4byte _080BD1A8 @ case 48
	.4byte _080BD1A8 @ case 49
	.4byte _080BD1A8 @ case 50
	.4byte _080BD1A8 @ case 51
	.4byte _080BD1A8 @ case 52
	.4byte _080BD1A8 @ case 53
	.4byte _080BD1A8 @ case 54
	.4byte _080BD1A8 @ case 55
	.4byte _080BD1E4 @ case 56
	.4byte _080BD1A8 @ case 57
	.4byte _080BD1A8 @ case 58
	.4byte _080BD1E4 @ case 59
	.4byte _080BD1E4 @ case 60
	.4byte _080BD1A8 @ case 61
	.4byte _080BD1A8 @ case 62
	.4byte _080BD1E4 @ case 63
	.4byte _080BD1E4 @ case 64
	.4byte _080BD1E4 @ case 65
	.4byte _080BD1E4 @ case 66
	.4byte _080BD1E4 @ case 67
	.4byte _080BD1E4 @ case 68
	.4byte _080BD1E4 @ case 69
	.4byte _080BD1E4 @ case 70
	.4byte _080BD1E4 @ case 71
_080BD1A8:
	adds r0, r5, #0
	subs r0, #0x25
	cmp r0, #8
	bhi _080BD1B4
	movs r5, #0x24
	b _080BD1BE
_080BD1B4:
	adds r0, r5, #0
	subs r0, #0x2f
	cmp r0, #8
	bhi _080BD1BE
	movs r5, #0x2e
_080BD1BE:
	movs r4, #0
	ldr r6, _080BD1E8  @ gWMNodeData
_080BD1C2:
	adds r0, r4, #0
	bl WMLoc_GetChapterId
	cmp r5, r0
	bne _080BD1FA
	ldr r1, _080BD1EC  @ gGMData
	lsls r0, r4, #2
	adds r0, r0, r1
	adds r0, #0x30
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080BD1F0
	ldrb r0, [r6]
	cmp r0, #3
	beq _080BD1F6
_080BD1E4:
	movs r0, #0
	b _080BD204
	.align 2, 0
_080BD1E8: .4byte gWMNodeData
_080BD1EC: .4byte gGMData
_080BD1F0:
	ldrb r0, [r6, #1]
	cmp r0, #3
	bne _080BD202
_080BD1F6:
	movs r0, #1
	b _080BD204
_080BD1FA:
	adds r6, #0x20
	adds r4, #1
	cmp r4, #0x1c
	ble _080BD1C2
_080BD202:
	movs r0, #2
_080BD204:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	THUMB_FUNC_END GetChapterThing

	THUMB_FUNC_START sub_80BD20C
sub_80BD20C: @ 0x080BD20C
	push {lr}
	adds r1, r0, #0
	cmp r1, #6
	ble _080BD216
	movs r1, #0
_080BD216:
	ldr r0, _080BD220  @ gUnknown_08206868
	adds r0, r1, r0
	ldrb r0, [r0]
	pop {r1}
	bx r1
	.align 2, 0
_080BD220: .4byte gUnknown_08206868

	THUMB_FUNC_END sub_80BD20C

	THUMB_FUNC_START sub_80BD224
sub_80BD224: @ 0x080BD224
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r5, #0
	bl sub_80BD014
	adds r1, r0, #0
	ldrb r0, [r4, #0x11]
	cmp r0, r1
	bne _080BD242
	cmp r1, #0
	blt _080BD258
	adds r0, r1, #0
	bl WMLoc_GetNextLocId
	b _080BD252
_080BD242:
	adds r0, r4, #0
	bl sub_80BD014
	adds r1, r0, #0
	cmp r1, #0
	bge _080BD250
	movs r1, #0
_080BD250:
	adds r0, r1, #0
_080BD252:
	bl WMLoc_GetChapterId
	adds r5, r0, #0
_080BD258:
	adds r0, r5, #0
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80BD224

	THUMB_FUNC_START sub_80BD260
sub_80BD260: @ 0x080BD260
	push {lr}
	adds r0, #0xce
	movs r2, #3
	bl CpuSet
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80BD260

	THUMB_FUNC_START sub_80BD270
sub_80BD270: @ 0x080BD270
	push {lr}
	adds r2, r0, #0
	adds r0, r1, #0
	adds r2, #0xce
	adds r1, r2, #0
	movs r2, #3
	bl CpuSet
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80BD270

	THUMB_FUNC_START sub_80BD284
sub_80BD284: @ 0x080BD284
	ldr r0, _080BD288  @ gUnknown_0201B0D8
	bx lr
	.align 2, 0
_080BD288: .4byte gUnknown_0201B0D8

	THUMB_FUNC_END sub_80BD284

	THUMB_FUNC_START sub_80BD28C
sub_80BD28C: @ 0x080BD28C
	ldr r1, _080BD298  @ gUnknown_0201B0D8
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bx lr
	.align 2, 0
_080BD298: .4byte gUnknown_0201B0D8

	THUMB_FUNC_END sub_80BD28C

	THUMB_FUNC_START sub_80BD29C
sub_80BD29C: @ 0x080BD29C
	ldr r0, _080BD2A4  @ gUnknown_0201B0D8
	ldr r0, [r0, #0x20]
	adds r0, #1
	bx lr
	.align 2, 0
_080BD2A4: .4byte gUnknown_0201B0D8

	THUMB_FUNC_END sub_80BD29C

	THUMB_FUNC_START nullsub_37
nullsub_37: @ 0x080BD2A8
	bx lr

	THUMB_FUNC_END nullsub_37

	THUMB_FUNC_START GetCharacterClassId
GetCharacterClassId: @ 0x080BD2AC
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r4, #1
_080BD2B2:
	adds r0, r4, #0
	bl GetUnit
	adds r1, r0, #0
	cmp r1, #0
	beq _080BD2D0
	ldr r0, [r1]
	cmp r0, #0
	beq _080BD2D0
	ldrb r0, [r0, #4]
	cmp r0, r5
	bne _080BD2D0
	ldr r0, [r1, #4]
	ldrb r0, [r0, #4]
	b _080BD2E2
_080BD2D0:
	adds r4, #1
	cmp r4, #0xbf
	ble _080BD2B2
	ldr r2, _080BD2E8  @ gCharacterData
	subs r1, r5, #1
	movs r0, #0x34
	muls r0, r1, r0
	adds r0, r0, r2
	ldrb r0, [r0, #5]
_080BD2E2:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080BD2E8: .4byte gCharacterData

	THUMB_FUNC_END GetCharacterClassId

	THUMB_FUNC_START MapMUPrim_MakeUnitForChar
MapMUPrim_MakeUnitForChar: @ 0x080BD2EC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	adds r7, r1, #0
	mov r8, r2
	adds r5, r6, #0
	adds r5, #0x2b
	movs r0, #0
	ldrsb r0, [r5, r0]
	cmp r0, #0
	blt _080BD314
	ldr r0, [r6, #0x14]
	ldr r0, [r0, #0x4c]
	movs r1, #0
	ldrsb r1, [r5, r1]
	bl MapUnitC_DeleteGmapUnit
	movs r0, #0xff
	strb r0, [r5]
_080BD314:
	ldr r0, [r6, #0x14]
	ldr r4, [r0, #0x4c]
	adds r0, r7, #0
	bl GetCharacterClassId
	adds r1, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	adds r0, r4, #0
	movs r2, #0
	bl NewMapUnit
	strb r0, [r5]
	ldr r0, [r6, #0x14]
	ldr r0, [r0, #0x4c]
	movs r1, #0
	ldrsb r1, [r5, r1]
	mov r2, r8
	lsls r3, r2, #5
	ldr r2, _080BD370  @ gWMNodeData
	adds r3, r3, r2
	movs r4, #0x18
	ldrsh r2, [r3, r4]
	movs r4, #0x1a
	ldrsh r3, [r3, r4]
	adds r3, #6
	bl MapUnitC_SetPosition
	ldr r0, [r6, #0x14]
	ldr r0, [r0, #0x4c]
	movs r1, #0
	ldrsb r1, [r5, r1]
	movs r2, #4
	bl MapUnitC_SetAnimId
	ldr r0, [r6, #0x14]
	ldr r0, [r0, #0x4c]
	movs r1, #0
	ldrsb r1, [r5, r1]
	bl MapUnitC_SetGfxNeedsUpdate
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BD370: .4byte gWMNodeData

	THUMB_FUNC_END MapMUPrim_MakeUnitForChar

	THUMB_FUNC_START MapMUPrim_MakeUnitForClass
MapMUPrim_MakeUnitForClass: @ 0x080BD374
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	adds r7, r2, #0
	adds r4, r5, #0
	adds r4, #0x2b
	movs r0, #0
	ldrsb r0, [r4, r0]
	cmp r0, #0
	blt _080BD398
	ldr r0, [r5, #0x14]
	ldr r0, [r0, #0x4c]
	movs r1, #0
	ldrsb r1, [r4, r1]
	bl MapUnitC_DeleteGmapUnit
	movs r0, #0xff
	strb r0, [r4]
_080BD398:
	ldr r0, [r5, #0x14]
	ldr r0, [r0, #0x4c]
	lsls r1, r6, #0x10
	lsrs r1, r1, #0x10
	movs r2, #0
	bl NewMapUnit
	strb r0, [r4]
	ldr r0, [r5, #0x14]
	ldr r0, [r0, #0x4c]
	movs r1, #0
	ldrsb r1, [r4, r1]
	lsls r3, r7, #5
	ldr r2, _080BD3E4  @ gWMNodeData
	adds r3, r3, r2
	movs r6, #0x18
	ldrsh r2, [r3, r6]
	movs r6, #0x1a
	ldrsh r3, [r3, r6]
	adds r3, #6
	bl MapUnitC_SetPosition
	ldr r0, [r5, #0x14]
	ldr r0, [r0, #0x4c]
	movs r1, #0
	ldrsb r1, [r4, r1]
	movs r2, #4
	bl MapUnitC_SetAnimId
	ldr r0, [r5, #0x14]
	ldr r0, [r0, #0x4c]
	movs r1, #0
	ldrsb r1, [r4, r1]
	bl MapUnitC_SetGfxNeedsUpdate
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BD3E4: .4byte gWMNodeData

	THUMB_FUNC_END MapMUPrim_MakeUnitForClass

	THUMB_FUNC_START MapMUPrim_RemoveLinkedMapUnit
MapMUPrim_RemoveLinkedMapUnit: @ 0x080BD3E8
	push {r4, lr}
	adds r1, r0, #0
	adds r4, r1, #0
	adds r4, #0x2b
	movs r0, #0
	ldrsb r0, [r4, r0]
	cmp r0, #0
	blt _080BD408
	ldr r0, [r1, #0x14]
	ldr r0, [r0, #0x4c]
	movs r1, #0
	ldrsb r1, [r4, r1]
	bl MapUnitC_DeleteGmapUnit
	movs r0, #0xff
	strb r0, [r4]
_080BD408:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END MapMUPrim_RemoveLinkedMapUnit

	THUMB_FUNC_START sub_80BD410
sub_80BD410: @ 0x080BD410
	adds r0, #0x2b
	movs r1, #0xff
	strb r1, [r0]
	bx lr

	THUMB_FUNC_END sub_80BD410

	THUMB_FUNC_START nullsub_70
nullsub_70: @ 0x080BD418
	bx lr

	THUMB_FUNC_END nullsub_70

	THUMB_FUNC_START sub_80BD41C
sub_80BD41C: @ 0x080BD41C
	push {lr}
	adds r2, r0, #0
	muls r2, r0, r2
	adds r0, r2, #0
	adds r2, r1, #0
	muls r2, r1, r2
	adds r1, r2, #0
	adds r0, r0, r1
	lsls r0, r0, #4
	bl Sqrt
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #5
	bl __udivsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80BD41C

	THUMB_FUNC_START sub_80BD444
sub_80BD444: @ 0x080BD444
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r6, r0, #0
	ldr r0, [r6, #0x50]
	cmp r0, #0
	bge _080BD48E
	adds r0, r6, #0
	adds r0, #0x2e
	movs r3, #0
	ldrsb r3, [r0, r3]
	lsls r3, r3, #5
	ldr r1, _080BD5A0  @ gWMNodeData
	adds r3, r3, r1
	movs r2, #0x18
	ldrsh r0, [r3, r2]
	adds r2, r6, #0
	adds r2, #0x2d
	ldrb r2, [r2]
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	lsls r2, r2, #5
	adds r2, r2, r1
	movs r4, #0x18
	ldrsh r1, [r2, r4]
	subs r0, r0, r1
	movs r5, #0x1a
	ldrsh r1, [r3, r5]
	movs r3, #0x1a
	ldrsh r2, [r2, r3]
	subs r1, r1, r2
	bl sub_80BD41C
	str r0, [r6, #0x50]
_080BD48E:
	adds r2, r6, #0
	adds r2, #0x2d
	movs r0, #0
	ldrsb r0, [r2, r0]
	lsls r0, r0, #5
	ldr r3, _080BD5A0  @ gWMNodeData
	adds r0, r0, r3
	ldrb r1, [r0, #0x1e]
	movs r4, #1
	adds r0, r4, #0
	ands r0, r1
	movs r5, #0x2e
	adds r5, r5, r6
	mov r8, r5
	mov r9, r2
	adds r7, r6, #0
	adds r7, #0x2b
	cmp r0, #0
	beq _080BD4D4
	movs r0, #0
	ldrsb r0, [r5, r0]
	lsls r0, r0, #5
	adds r0, r0, r3
	ldrb r1, [r0, #0x1e]
	adds r0, r4, #0
	ands r0, r1
	cmp r0, #0
	beq _080BD4D4
	ldr r0, [r6, #0x14]
	ldr r0, [r0, #0x4c]
	movs r1, #0
	ldrsb r1, [r7, r1]
	movs r2, #0x50
	bl sub_80BB0E0
_080BD4D4:
	adds r1, r6, #0
	adds r1, #0x2a
	movs r0, #0
	ldrsb r0, [r1, r0]
	lsls r5, r0, #2
	adds r5, r5, r0
	lsls r5, r5, #2
	ldr r0, _080BD5A4  @ gUnknown_0201B3A4
	adds r5, r5, r0
	movs r0, #0
	mov sl, r0
	movs r0, #2
	strh r0, [r5]
	movs r3, #0
	ldrsb r3, [r1, r3]
	lsls r3, r3, #5
	ldr r0, _080BD5A8  @ gUnknown_0201B104
	adds r3, r3, r0
	str r3, [r5, #4]
	movs r4, #0
	ldrsb r4, [r1, r4]
	lsls r4, r4, #6
	ldr r0, _080BD5AC  @ gUnknown_0201B1E4
	adds r4, r4, r0
	str r4, [r5, #8]
	ldr r0, _080BD5B0  @ gUnknown_08A3E22C
	str r0, [r5, #0xc]
	ldr r0, _080BD5B4  @ gUnknown_08A3E23C
	str r0, [r5, #0x10]
	mov r1, r9
	movs r0, #0
	ldrsb r0, [r1, r0]
	mov r2, r8
	movs r1, #0
	ldrsb r1, [r2, r1]
	ldr r2, [r6, #0x50]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	str r4, [sp]
	movs r4, #4
	str r4, [sp, #4]
	bl sub_80BCE34
	strh r0, [r5, #2]
	ldr r0, [r6, #0x14]
	ldr r0, [r0, #0x4c]
	adds r4, r7, #0
	movs r1, #0
	ldrsb r1, [r4, r1]
	mov r5, r9
	movs r3, #0
	ldrsb r3, [r5, r3]
	lsls r3, r3, #5
	ldr r2, _080BD5A0  @ gWMNodeData
	adds r3, r3, r2
	movs r5, #0x18
	ldrsh r2, [r3, r5]
	movs r5, #0x1a
	ldrsh r3, [r3, r5]
	adds r3, #6
	bl MapUnitC_SetPosition
	adds r2, r6, #0
	adds r2, #0x31
	movs r0, #0
	ldrsb r0, [r2, r0]
	cmp r0, #0
	blt _080BD56E
	ldr r0, [r6, #0x14]
	ldr r0, [r0, #0x4c]
	movs r1, #0
	ldrsb r1, [r4, r1]
	ldrb r2, [r2]
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	bl MapUnitC_SetAnimId
_080BD56E:
	mov r0, sl
	str r0, [r6, #0x54]
	ldr r0, [r6, #0x14]
	ldr r0, [r0, #0x4c]
	movs r1, #0
	ldrsb r1, [r7, r1]
	adds r2, r6, #0
	adds r2, #0x44
	adds r3, r6, #0
	adds r3, #0x46
	bl MapUnitC_GetPosition
	adds r0, r6, #0
	adds r0, #0x40
	mov r1, sl
	strh r1, [r0]
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BD5A0: .4byte gWMNodeData
_080BD5A4: .4byte gUnknown_0201B3A4
_080BD5A8: .4byte gUnknown_0201B104
_080BD5AC: .4byte gUnknown_0201B1E4
_080BD5B0: .4byte gUnknown_08A3E22C
_080BD5B4: .4byte gUnknown_08A3E23C

	THUMB_FUNC_END sub_80BD444

	THUMB_FUNC_START sub_80BD5B8
sub_80BD5B8: @ 0x080BD5B8
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r0, [r5, #0x14]
	ldr r0, [r0, #0x4c]
	adds r1, r5, #0
	adds r1, #0x2b
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	mov r4, sp
	adds r4, #2
	mov r2, sp
	adds r3, r4, #0
	bl MapUnitC_GetPosition
	mov r0, sp
	adds r1, r5, #0
	adds r1, #0x44
	ldrh r0, [r0]
	ldrh r1, [r1]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r3, r0, #0
	adds r1, r5, #0
	adds r1, #0x46
	ldrh r0, [r4]
	ldrh r1, [r1]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r6, r0, #0
	cmp r3, #0
	bne _080BD602
	cmp r0, #0
	beq _080BD656
_080BD602:
	adds r1, r5, #0
	adds r1, #0x40
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, #2
	ble _080BD634
	movs r2, #0
	adds r4, r5, #0
	adds r4, #0x3c
	movs r0, #0x3d
	adds r0, r0, r5
	mov ip, r0
	subs r1, #0xc
_080BD61C:
	ldrb r0, [r1, #4]
	strb r0, [r1]
	ldrb r0, [r1, #5]
	strb r0, [r1, #1]
	adds r1, #4
	adds r2, #1
	cmp r2, #1
	ble _080BD61C
	strb r3, [r4]
	mov r2, ip
	strb r6, [r2]
	b _080BD652
_080BD634:
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #2
	adds r0, r5, r0
	adds r0, #0x34
	strb r3, [r0]
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #2
	adds r0, r5, r0
	adds r0, #0x35
	strb r6, [r0]
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
_080BD652:
	movs r0, #1
	b _080BD658
_080BD656:
	movs r0, #0
_080BD658:
	add sp, #4
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80BD5B8

	THUMB_FUNC_START sub_80BD660
sub_80BD660: @ 0x080BD660
	push {r4, lr}
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	adds r3, r1, #0
	movs r2, #0x9a
	lsls r2, r2, #7
	adds r0, r1, r2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r2, _080BD67C  @ 0x000019FF
	cmp r0, r2
	bhi _080BD680
	movs r0, #3
	b _080BD69C
	.align 2, 0
_080BD67C: .4byte 0x000019FF
_080BD680:
	ldr r4, _080BD690  @ 0xFFFFCD00
	adds r0, r1, r4
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, r2
	bhi _080BD694
	movs r0, #2
	b _080BD69C
	.align 2, 0
_080BD690: .4byte 0xFFFFCD00
_080BD694:
	ldr r1, _080BD6A4  @ 0xFFFFC000
	adds r0, r3, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x1f
_080BD69C:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080BD6A4: .4byte 0xFFFFC000

	THUMB_FUNC_END sub_80BD660

	THUMB_FUNC_START sub_80BD6A8
sub_80BD6A8: @ 0x080BD6A8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov r8, r0
	movs r0, #0
	mov sl, r0
	mov r9, r0
	movs r7, #0
	mov r0, r8
	adds r0, #0x40
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r7, r0
	bge _080BD72C
	mov r6, r8
	adds r6, #0x34
_080BD6CE:
	movs r0, #0
	ldrsb r0, [r6, r0]
	mov r2, r9
	lsls r1, r2, #0x10
	asrs r1, r1, #0x10
	adds r1, r1, r0
	lsls r1, r1, #0x10
	movs r2, #1
	ldrsb r2, [r6, r2]
	mov r3, sl
	lsls r0, r3, #0x10
	asrs r0, r0, #0x10
	adds r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r2, r1, #0x10
	mov r9, r2
	asrs r5, r1, #0x10
	lsrs r3, r0, #0x10
	mov sl, r3
	asrs r4, r0, #0x10
	movs r0, #8
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	adds r2, r5, #0
	adds r3, r4, #0
	bl sub_80C0834
	cmp r0, #0x23
	bls _080BD71C
	adds r0, r5, #0
	adds r1, r4, #0
	bl ArcTan2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl sub_80BD660
	b _080BD730
_080BD71C:
	adds r6, #4
	adds r7, #1
	mov r0, r8
	adds r0, #0x40
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r7, r0
	blt _080BD6CE
_080BD72C:
	movs r0, #1
	negs r0, r0
_080BD730:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80BD6A8

	THUMB_FUNC_START sub_80BD740
sub_80BD740: @ 0x080BD740
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r6, r0, #0
	bl sub_80BD5B8
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080BD81E
	adds r2, r6, #0
	adds r2, #0x29
	ldrb r1, [r2]
	movs r0, #0x20
	ands r0, r1
	adds r5, r2, #0
	cmp r0, #0
	beq _080BD784
	adds r0, r6, #0
	bl sub_80BE45C
	ldrb r1, [r5]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _080BD784
	ldr r0, _080BD828  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #4]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080BD784
	adds r0, r6, #0
	bl sub_80BE45C
_080BD784:
	adds r0, r6, #0
	bl sub_80BD6A8
	adds r4, r0, #0
	adds r7, r6, #0
	adds r7, #0x2b
	cmp r4, #0
	blt _080BD7C8
	ldr r0, [r6, #0x14]
	ldr r0, [r0, #0x4c]
	movs r1, #0
	ldrsb r1, [r7, r1]
	bl MapUnitC_GetAnimId
	cmp r0, r4
	beq _080BD7C8
	ldrb r1, [r5]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _080BD7C8
	ldr r0, [r6, #0x14]
	ldr r0, [r0, #0x4c]
	movs r1, #0
	ldrsb r1, [r7, r1]
	adds r2, r4, #0
	bl MapUnitC_SetAnimId
	ldr r0, [r6, #0x14]
	ldr r0, [r0, #0x4c]
	movs r1, #0
	ldrsb r1, [r7, r1]
	bl MapUnitC_SetGfxNeedsUpdate
_080BD7C8:
	ldrb r1, [r5]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _080BD80A
	ldr r0, [r6, #0x14]
	ldr r0, [r0, #0x4c]
	movs r1, #0
	ldrsb r1, [r7, r1]
	mov r4, sp
	adds r4, #2
	mov r2, sp
	adds r3, r4, #0
	bl MapUnitC_GetPosition
	mov r0, sp
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r2, #0
	ldrsh r1, [r4, r2]
	subs r1, #0xe
	add r4, sp, #4
	mov r5, sp
	adds r5, #6
	adds r2, r4, #0
	adds r3, r5, #0
	bl GetWMCenteredCameraPosition
	ldr r1, _080BD82C  @ gGMData
	ldrh r0, [r4]
	strh r0, [r1, #2]
	ldrh r0, [r5]
	strh r0, [r1, #4]
_080BD80A:
	ldr r0, [r6, #0x14]
	ldr r0, [r0, #0x4c]
	movs r1, #0
	ldrsb r1, [r7, r1]
	adds r2, r6, #0
	adds r2, #0x44
	adds r3, r6, #0
	adds r3, #0x46
	bl MapUnitC_GetPosition
_080BD81E:
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BD828: .4byte gKeyStatusPtr
_080BD82C: .4byte gGMData

	THUMB_FUNC_END sub_80BD740

	THUMB_FUNC_START sub_80BD830
sub_80BD830: @ 0x080BD830
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x10
	adds r6, r0, #0
	adds r0, #0x29
	ldrb r3, [r0]
	movs r0, #2
	ands r0, r3
	cmp r0, #0
	beq _080BD848
	b _080BD9C4
_080BD848:
	adds r1, r6, #0
	adds r1, #0x42
	ldrh r2, [r1]
	movs r4, #0
	ldrsh r0, [r1, r4]
	cmp r0, #0
	ble _080BD85C
	subs r0, r2, #1
	strh r0, [r1]
	b _080BD9C4
_080BD85C:
	movs r0, #4
	ands r0, r3
	cmp r0, #0
	beq _080BD878
	ldr r0, _080BD8C4  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #4]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080BD878
	ldr r0, [r6, #0x54]
	adds r0, #2
	str r0, [r6, #0x54]
_080BD878:
	ldr r0, [r6, #0x54]
	adds r2, r0, #1
	str r2, [r6, #0x54]
	ldr r0, [r6, #0x50]
	cmp r2, r0
	bge _080BD8CC
	adds r0, r6, #0
	adds r0, #0x2a
	movs r1, #0
	ldrsb r1, [r0, r1]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _080BD8C8  @ gUnknown_0201B3A4
	adds r0, r0, r1
	lsls r1, r2, #0xc
	add r4, sp, #8
	adds r2, r4, #0
	bl sub_800A950
	ldr r0, [r6, #0x14]
	ldr r0, [r0, #0x4c]
	adds r1, r6, #0
	adds r1, #0x2b
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	ldr r2, [sp, #8]
	asrs r2, r2, #4
	ldr r3, [r4, #4]
	asrs r3, r3, #4
	adds r3, #6
	bl MapUnitC_SetPosition
	adds r0, r6, #0
	bl sub_80BD740
	b _080BD9C4
	.align 2, 0
_080BD8C4: .4byte gKeyStatusPtr
_080BD8C8: .4byte gUnknown_0201B3A4
_080BD8CC:
	adds r0, r6, #0
	adds r0, #0x2d
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #5
	ldr r2, _080BD9D0  @ gWMNodeData
	adds r0, r0, r2
	ldrb r1, [r0, #0x1e]
	movs r3, #1
	adds r0, r3, #0
	ands r0, r1
	adds r4, r6, #0
	adds r4, #0x2b
	adds r5, r6, #0
	adds r5, #0x2e
	cmp r0, #0
	beq _080BD910
	movs r0, #0
	ldrsb r0, [r5, r0]
	lsls r0, r0, #5
	adds r0, r0, r2
	ldrb r1, [r0, #0x1e]
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	beq _080BD910
	ldr r0, [r6, #0x14]
	ldr r0, [r0, #0x4c]
	movs r1, #0
	ldrsb r1, [r4, r1]
	movs r2, #0
	bl sub_80BB0E0
_080BD910:
	ldr r0, [r6, #0x14]
	ldr r0, [r0, #0x4c]
	movs r1, #0
	ldrsb r1, [r4, r1]
	movs r3, #0
	ldrsb r3, [r5, r3]
	lsls r3, r3, #5
	ldr r2, _080BD9D0  @ gWMNodeData
	adds r3, r3, r2
	movs r7, #0x18
	ldrsh r2, [r3, r7]
	movs r7, #0x1a
	ldrsh r3, [r3, r7]
	adds r3, #6
	bl MapUnitC_SetPosition
	adds r2, r6, #0
	adds r2, #0x29
	ldrb r1, [r2]
	movs r0, #0x10
	ands r0, r1
	adds r7, r2, #0
	cmp r0, #0
	beq _080BD95C
	adds r2, #9
	movs r0, #0
	ldrsb r0, [r2, r0]
	cmp r0, #0
	blt _080BD95C
	ldr r0, [r6, #0x14]
	ldr r0, [r0, #0x4c]
	movs r1, #0
	ldrsb r1, [r4, r1]
	ldrb r2, [r2]
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	bl MapUnitC_SetAnimId
_080BD95C:
	ldr r0, _080BD9D4  @ gGMData
	mov r8, r0
	adds r0, r6, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #2
	add r0, r8
	ldrb r1, [r5]
	strb r1, [r0, #0x11]
	ldrb r1, [r7]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _080BD9B4
	ldr r0, [r6, #0x14]
	ldr r0, [r0, #0x4c]
	movs r1, #0
	ldrsb r1, [r4, r1]
	mov r4, sp
	adds r4, #2
	mov r2, sp
	adds r3, r4, #0
	bl MapUnitC_GetPosition
	mov r0, sp
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r2, #0
	ldrsh r1, [r4, r2]
	subs r1, #0xe
	add r4, sp, #4
	mov r5, sp
	adds r5, #6
	adds r2, r4, #0
	adds r3, r5, #0
	bl GetWMCenteredCameraPosition
	ldrh r0, [r4]
	mov r4, r8
	strh r0, [r4, #2]
	ldrh r0, [r5]
	strh r0, [r4, #4]
_080BD9B4:
	adds r0, r6, #0
	bl Proc_Break
	ldrb r1, [r7]
	movs r0, #2
	negs r0, r0
	ands r0, r1
	strb r0, [r7]
_080BD9C4:
	add sp, #0x10
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BD9D0: .4byte gWMNodeData
_080BD9D4: .4byte gGMData

	THUMB_FUNC_END sub_80BD830

	THUMB_FUNC_START sub_80BD9D8
sub_80BD9D8: @ 0x080BD9D8
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x50]
	cmp r0, #0
	bge _080BDA2E
	adds r0, r4, #0
	adds r0, #0x4c
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r0, r0, #5
	ldr r3, _080BDA74  @ gWMNodeData
	adds r0, r0, r3
	movs r2, #0x18
	ldrsh r0, [r0, r2]
	adds r1, r4, #0
	adds r1, #0x48
	movs r5, #0
	ldrsh r1, [r1, r5]
	lsls r1, r1, #5
	adds r1, r1, r3
	movs r2, #0x18
	ldrsh r1, [r1, r2]
	subs r0, r0, r1
	adds r1, r4, #0
	adds r1, #0x4e
	movs r5, #0
	ldrsh r1, [r1, r5]
	lsls r1, r1, #5
	adds r1, r1, r3
	movs r2, #0x1a
	ldrsh r1, [r1, r2]
	adds r2, r4, #0
	adds r2, #0x4a
	movs r5, #0
	ldrsh r2, [r2, r5]
	lsls r2, r2, #5
	adds r2, r2, r3
	movs r3, #0x1a
	ldrsh r2, [r2, r3]
	subs r1, r1, r2
	bl sub_80BD41C
	str r0, [r4, #0x50]
_080BDA2E:
	movs r6, #0
	str r6, [r4, #0x54]
	ldr r0, [r4, #0x14]
	ldr r0, [r0, #0x4c]
	adds r5, r4, #0
	adds r5, #0x2b
	movs r1, #0
	ldrsb r1, [r5, r1]
	adds r2, r4, #0
	adds r2, #0x44
	adds r3, r4, #0
	adds r3, #0x46
	bl MapUnitC_GetPosition
	adds r2, r4, #0
	adds r2, #0x31
	movs r0, #0
	ldrsb r0, [r2, r0]
	cmp r0, #0
	blt _080BDA68
	ldr r0, [r4, #0x14]
	ldr r0, [r0, #0x4c]
	movs r1, #0
	ldrsb r1, [r5, r1]
	ldrb r2, [r2]
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	bl MapUnitC_SetAnimId
_080BDA68:
	adds r0, r4, #0
	adds r0, #0x40
	strh r6, [r0]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080BDA74: .4byte gWMNodeData

	THUMB_FUNC_END sub_80BD9D8

	THUMB_FUNC_START sub_80BDA78
sub_80BDA78: @ 0x080BDA78
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r7, r0, #0
	adds r0, #0x29
	ldrb r3, [r0]
	movs r0, #2
	ands r0, r3
	cmp r0, #0
	beq _080BDA8C
	b _080BDBF4
_080BDA8C:
	adds r1, r7, #0
	adds r1, #0x42
	ldrh r2, [r1]
	movs r4, #0
	ldrsh r0, [r1, r4]
	cmp r0, #0
	ble _080BDAA0
	subs r0, r2, #1
	strh r0, [r1]
	b _080BDBF4
_080BDAA0:
	movs r0, #4
	ands r0, r3
	cmp r0, #0
	beq _080BDABC
	ldr r0, _080BDB50  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #4]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080BDABC
	ldr r0, [r7, #0x54]
	adds r0, #2
	str r0, [r7, #0x54]
_080BDABC:
	ldr r0, [r7, #0x54]
	adds r0, #1
	str r0, [r7, #0x54]
	ldr r1, [r7, #0x50]
	cmp r0, r1
	bge _080BDB54
	adds r2, r7, #0
	adds r2, #0x2f
	ldrb r2, [r2]
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	bl sub_800B84C
	adds r5, r0, #0
	movs r6, #0x80
	lsls r6, r6, #5
	adds r0, r7, #0
	adds r0, #0x4c
	movs r1, #0
	ldrsh r0, [r0, r1]
	adds r4, r7, #0
	adds r4, #0x48
	movs r2, #0
	ldrsh r1, [r4, r2]
	subs r0, r0, r1
	adds r1, r0, #0
	muls r1, r5, r1
	adds r0, r6, #0
	bl DivArm
	ldrh r1, [r4]
	adds r1, r1, r0
	mov r0, sp
	strh r1, [r0]
	adds r0, r7, #0
	adds r0, #0x4e
	movs r3, #0
	ldrsh r0, [r0, r3]
	adds r4, #2
	movs r2, #0
	ldrsh r1, [r4, r2]
	subs r0, r0, r1
	adds r1, r0, #0
	muls r1, r5, r1
	adds r0, r6, #0
	bl DivArm
	ldrh r3, [r4]
	adds r3, r3, r0
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	mov r0, sp
	adds r0, #2
	strh r3, [r0]
	ldr r0, [r7, #0x14]
	ldr r0, [r0, #0x4c]
	adds r1, r7, #0
	adds r1, #0x2b
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	mov r2, sp
	movs r4, #0
	ldrsh r2, [r2, r4]
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	adds r3, #6
	bl MapUnitC_SetPosition
	adds r0, r7, #0
	bl sub_80BD740
	b _080BDBF4
	.align 2, 0
_080BDB50: .4byte gKeyStatusPtr
_080BDB54:
	ldr r0, [r7, #0x14]
	ldr r0, [r0, #0x4c]
	adds r4, r7, #0
	adds r4, #0x2b
	movs r1, #0
	ldrsb r1, [r4, r1]
	adds r2, r7, #0
	adds r2, #0x4c
	movs r5, #0
	ldrsh r2, [r2, r5]
	adds r3, r7, #0
	adds r3, #0x4e
	movs r5, #0
	ldrsh r3, [r3, r5]
	adds r3, #6
	bl MapUnitC_SetPosition
	adds r2, r7, #0
	adds r2, #0x29
	ldrb r1, [r2]
	movs r0, #0x10
	ands r0, r1
	adds r6, r2, #0
	cmp r0, #0
	beq _080BDBA2
	adds r2, #9
	movs r0, #0
	ldrsb r0, [r2, r0]
	cmp r0, #0
	blt _080BDBA2
	ldr r0, [r7, #0x14]
	ldr r0, [r0, #0x4c]
	movs r1, #0
	ldrsb r1, [r4, r1]
	ldrb r2, [r2]
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	bl MapUnitC_SetAnimId
_080BDBA2:
	ldrb r1, [r6]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _080BDBE4
	ldr r0, [r7, #0x14]
	ldr r0, [r0, #0x4c]
	movs r1, #0
	ldrsb r1, [r4, r1]
	mov r4, sp
	adds r4, #2
	mov r2, sp
	adds r3, r4, #0
	bl MapUnitC_GetPosition
	mov r0, sp
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r2, #0
	ldrsh r1, [r4, r2]
	subs r1, #0xe
	add r4, sp, #4
	mov r5, sp
	adds r5, #6
	adds r2, r4, #0
	adds r3, r5, #0
	bl GetWMCenteredCameraPosition
	ldr r1, _080BDBFC  @ gGMData
	ldrh r0, [r4]
	strh r0, [r1, #2]
	ldrh r0, [r5]
	strh r0, [r1, #4]
_080BDBE4:
	adds r0, r7, #0
	bl Proc_Break
	ldrb r1, [r6]
	movs r0, #2
	negs r0, r0
	ands r0, r1
	strb r0, [r6]
_080BDBF4:
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BDBFC: .4byte gGMData

	THUMB_FUNC_END sub_80BDA78

	THUMB_FUNC_START nullsub_49
nullsub_49: @ 0x080BDC00
	bx lr

	THUMB_FUNC_END nullsub_49

	THUMB_FUNC_START MapMU_FillPrim
MapMU_FillPrim: @ 0x080BDC04
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r6, r4, #0
	adds r6, #0x2c
	movs r5, #6
_080BDC0E:
	ldr r1, [r4, #0x14]
	ldr r0, _080BDC24  @ gUnknown_08A3E248
	bl Proc_Start
	stm r6!, {r0}
	subs r5, #1
	cmp r5, #0
	bge _080BDC0E
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080BDC24: .4byte gUnknown_08A3E248

	THUMB_FUNC_END MapMU_FillPrim

	THUMB_FUNC_START NewMapMU
NewMapMU: @ 0x080BDC28
	push {lr}
	adds r1, r0, #0
	ldr r0, _080BDC38  @ gUnknown_08A3E2C0
	bl Proc_Start
	pop {r1}
	bx r1
	.align 2, 0
_080BDC38: .4byte gUnknown_08A3E2C0

	THUMB_FUNC_END NewMapMU

	THUMB_FUNC_START MapMU_SetUnit
MapMU_SetUnit: @ 0x080BDC3C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	mov sl, r0
	adds r5, r1, #0
	adds r6, r3, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	mov r9, r2
	lsls r7, r5, #2
	adds r0, #0x2c
	adds r0, r0, r7
	ldr r4, [r0]
	movs r0, #0x2a
	adds r0, r0, r4
	mov r8, r0
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	blt _080BDC70
	mov r0, sl
	bl MapMU_RemoveUnit
_080BDC70:
	mov r1, r8
	strb r5, [r1]
	mov r2, r9
	cmp r2, #0
	beq _080BDC98
	adds r0, r4, #0
	adds r1, r6, #0
	ldr r2, [sp, #0x24]
	bl MapMUPrim_MakeUnitForClass
	ldr r0, _080BDC94  @ gGMData
	adds r0, r7, r0
	strh r6, [r0, #0x12]
	ldrb r1, [r0, #0x10]
	movs r2, #2
	orrs r1, r2
	b _080BDCAE
	.align 2, 0
_080BDC94: .4byte gGMData
_080BDC98:
	adds r0, r4, #0
	adds r1, r6, #0
	ldr r2, [sp, #0x24]
	bl MapMUPrim_MakeUnitForChar
	ldr r0, _080BDD24  @ gGMData
	adds r0, r7, r0
	strh r6, [r0, #0x12]
	ldrb r2, [r0, #0x10]
	movs r1, #0xfd
	ands r1, r2
_080BDCAE:
	strb r1, [r0, #0x10]
	ldr r1, _080BDD24  @ gGMData
	lsls r0, r5, #2
	adds r0, r0, r1
	add r1, sp, #0x24
	ldrb r1, [r1]
	strb r1, [r0, #0x11]
	ldr r2, [sp, #0x20]
	cmp r2, #0
	bge _080BDCCA
	adds r0, r5, #0
	bl sub_80BD20C
	str r0, [sp, #0x20]
_080BDCCA:
	ldr r0, [r4, #0x14]
	ldr r0, [r0, #0x4c]
	adds r1, r4, #0
	adds r1, #0x2b
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	ldr r2, [sp, #0x20]
	bl MapUnitC_SetFaction
	adds r1, r4, #0
	adds r1, #0x40
	movs r2, #0
	movs r0, #0
	strh r0, [r1]
	adds r0, r4, #0
	adds r0, #0x2c
	strb r2, [r0]
	adds r2, r4, #0
	adds r2, #0x29
	ldrb r1, [r2]
	movs r0, #2
	negs r0, r0
	ands r0, r1
	movs r1, #5
	negs r1, r1
	ands r0, r1
	subs r1, #4
	ands r0, r1
	strb r0, [r2]
	ldr r0, _080BDD28  @ gUnknown_08A3E2F0
	adds r0, r5, r0
	ldrb r2, [r0]
	mov r0, sl
	adds r1, r5, #0
	bl MapMU_SetUnitTCSOAMIndex
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BDD24: .4byte gGMData
_080BDD28: .4byte gUnknown_08A3E2F0

	THUMB_FUNC_END MapMU_SetUnit

	THUMB_FUNC_START MapMU_RemoveUnit
MapMU_RemoveUnit: @ 0x080BDD2C
	push {r4, r5, lr}
	adds r5, r1, #0
	lsls r4, r5, #2
	adds r0, #0x2c
	adds r0, r0, r4
	ldr r1, [r0]
	adds r0, r1, #0
	adds r0, #0x2b
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	blt _080BDD8A
	adds r2, r1, #0
	adds r2, #0x2a
	movs r0, #0xff
	strb r0, [r2]
	adds r0, r1, #0
	bl MapMUPrim_RemoveLinkedMapUnit
	ldr r0, _080BDD70  @ gGMData
	adds r1, r4, r0
	ldrb r2, [r1, #0x10]
	movs r0, #2
	ands r0, r2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0
	beq _080BDD74
	movs r0, #0
	strh r0, [r1, #0x12]
	movs r0, #2
	orrs r0, r2
	b _080BDD7A
	.align 2, 0
_080BDD70: .4byte gGMData
_080BDD74:
	strh r0, [r1, #0x12]
	movs r0, #0xfd
	ands r0, r2
_080BDD7A:
	strb r0, [r1, #0x10]
	ldr r0, _080BDD90  @ gGMData
	lsls r1, r5, #2
	adds r1, r1, r0
	ldrb r2, [r1, #0x10]
	movs r0, #0xfe
	ands r0, r2
	strb r0, [r1, #0x10]
_080BDD8A:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080BDD90: .4byte gGMData

	THUMB_FUNC_END MapMU_RemoveUnit

	THUMB_FUNC_START sub_80BDD94
sub_80BDD94: @ 0x080BDD94
	push {r4, r5, lr}
	adds r2, r0, #0
	cmp r1, #0
	blt _080BDDAC
	lsls r0, r1, #2
	adds r1, r2, #0
	adds r1, #0x2c
	adds r1, r1, r0
	ldr r0, [r1]
	bl MapMUPrim_RemoveLinkedMapUnit
	b _080BDDBE
_080BDDAC:
	adds r5, r2, #0
	adds r5, #0x2c
	movs r4, #6
_080BDDB2:
	ldm r5!, {r0}
	bl MapMUPrim_RemoveLinkedMapUnit
	subs r4, #1
	cmp r4, #0
	bge _080BDDB2
_080BDDBE:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80BDD94

	THUMB_FUNC_START sub_80BDDC4
sub_80BDDC4: @ 0x080BDDC4
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	cmp r1, #0
	blt _080BDDF8
	lsls r4, r1, #2
	adds r0, #0x2c
	adds r0, r0, r4
	ldr r1, [r0]
	ldr r0, [r7, #0x14]
	ldr r0, [r0, #0x4c]
	adds r1, #0x2b
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	movs r2, #1
	bl MapUnitC_SetDisplayEnabled
	ldr r0, _080BDDF4  @ gGMData
	adds r4, r4, r0
	ldrb r1, [r4, #0x10]
	movs r0, #1
	orrs r0, r1
	strb r0, [r4, #0x10]
	b _080BDE30
	.align 2, 0
_080BDDF4: .4byte gGMData
_080BDDF8:
	movs r6, #0
	adds r4, r7, #0
	adds r4, #0x2c
_080BDDFE:
	lsls r5, r6, #2
	ldr r1, [r4]
	adds r1, #0x2b
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	blt _080BDE28
	ldr r0, [r7, #0x14]
	ldr r0, [r0, #0x4c]
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	movs r2, #1
	bl MapUnitC_SetDisplayEnabled
	ldr r1, _080BDE38  @ gGMData
	adds r1, r5, r1
	ldrb r2, [r1, #0x10]
	movs r0, #1
	orrs r0, r2
	strb r0, [r1, #0x10]
_080BDE28:
	adds r4, #4
	adds r6, #1
	cmp r6, #6
	ble _080BDDFE
_080BDE30:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BDE38: .4byte gGMData

	THUMB_FUNC_END sub_80BDDC4

	THUMB_FUNC_START sub_80BDE3C
sub_80BDE3C: @ 0x080BDE3C
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	cmp r1, #0
	blt _080BDE70
	lsls r4, r1, #2
	adds r0, #0x2c
	adds r0, r0, r4
	ldr r1, [r0]
	ldr r0, [r7, #0x14]
	ldr r0, [r0, #0x4c]
	adds r1, #0x2b
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	movs r2, #0
	bl MapUnitC_SetDisplayEnabled
	ldr r0, _080BDE6C  @ gGMData
	adds r4, r4, r0
	ldrb r1, [r4, #0x10]
	movs r0, #0xfe
	ands r0, r1
	strb r0, [r4, #0x10]
	b _080BDEA8
	.align 2, 0
_080BDE6C: .4byte gGMData
_080BDE70:
	movs r5, #0
	adds r4, r7, #0
	adds r4, #0x2c
_080BDE76:
	lsls r6, r5, #2
	ldr r1, [r4]
	adds r1, #0x2b
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	blt _080BDEA0
	ldr r0, [r7, #0x14]
	ldr r0, [r0, #0x4c]
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	movs r2, #0
	bl MapUnitC_SetDisplayEnabled
	ldr r1, _080BDEB0  @ gGMData
	adds r1, r6, r1
	ldrb r2, [r1, #0x10]
	movs r0, #0xfe
	ands r0, r2
	strb r0, [r1, #0x10]
_080BDEA0:
	adds r4, #4
	adds r5, #1
	cmp r5, #6
	ble _080BDE76
_080BDEA8:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BDEB0: .4byte gGMData

	THUMB_FUNC_END sub_80BDE3C

	THUMB_FUNC_START sub_80BDEB4
sub_80BDEB4: @ 0x080BDEB4
	push {r4, r5, r6, lr}
	adds r6, r1, #0
	ldrb r1, [r6]
	lsls r1, r1, #2
	adds r0, #0x2c
	adds r0, r0, r1
	ldr r5, [r0]
	ldrh r0, [r6, #6]
	adds r2, r5, #0
	adds r2, #0x2d
	strb r0, [r2]
	ldrh r0, [r6, #8]
	adds r1, r5, #0
	adds r1, #0x2e
	strb r0, [r1]
	ldr r0, [r6, #0xc]
	cmp r0, #0
	bge _080BDF1A
	movs r0, #0
	ldrsb r0, [r1, r0]
	lsls r0, r0, #5
	ldr r1, _080BDFA0  @ gWMNodeData
	adds r4, r0, r1
	movs r0, #0x18
	ldrsh r3, [r4, r0]
	movs r0, #0
	ldrsb r0, [r2, r0]
	lsls r0, r0, #5
	adds r2, r0, r1
	movs r0, #0x18
	ldrsh r1, [r2, r0]
	subs r0, r3, r1
	cmp r0, #0
	bge _080BDEFA
	subs r0, r1, r3
_080BDEFA:
	movs r1, #0x1a
	ldrsh r3, [r4, r1]
	movs r1, #0x1a
	ldrsh r2, [r2, r1]
	subs r1, r3, r2
	cmp r1, #0
	bge _080BDF0A
	subs r1, r2, r3
_080BDF0A:
	bl sub_80BD41C
	adds r1, r0, #0
	ldr r0, [r6, #0xc]
	cmp r0, #0
	bge _080BDF18
	negs r0, r0
_080BDF18:
	muls r0, r1, r0
_080BDF1A:
	str r0, [r5, #0x50]
	ldrb r0, [r6, #1]
	movs r1, #0x29
	adds r1, r1, r5
	mov ip, r1
	movs r4, #1
	movs r2, #1
	adds r1, r2, #0
	ands r1, r0
	lsls r1, r1, #2
	mov r0, ip
	ldrb r3, [r0]
	movs r0, #5
	negs r0, r0
	ands r0, r3
	orrs r0, r1
	mov r1, ip
	strb r0, [r1]
	ldrh r0, [r6, #0xa]
	adds r1, r5, #0
	adds r1, #0x42
	movs r3, #0
	strh r0, [r1]
	mov r1, ip
	ldrb r0, [r1]
	orrs r0, r4
	movs r1, #3
	negs r1, r1
	ands r0, r1
	mov r1, ip
	strb r0, [r1]
	adds r0, r5, #0
	adds r0, #0x2c
	strb r2, [r0]
	ldrb r0, [r1]
	movs r1, #0x10
	orrs r0, r1
	mov r1, ip
	strb r0, [r1]
	ldrb r1, [r6, #2]
	ands r2, r1
	lsls r2, r2, #5
	movs r1, #0x21
	negs r1, r1
	ands r0, r1
	orrs r0, r2
	mov r1, ip
	strb r0, [r1]
	adds r0, r5, #0
	adds r0, #0x30
	strb r3, [r0]
	ldrb r0, [r6, #3]
	adds r1, r5, #0
	adds r1, #0x31
	strb r0, [r1]
	ldrb r0, [r6, #4]
	adds r2, r5, #0
	adds r2, #0x32
	strb r0, [r2]
	adds r0, r5, #0
	movs r1, #1
	bl Proc_Goto
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080BDFA0: .4byte gWMNodeData

	THUMB_FUNC_END sub_80BDEB4

	THUMB_FUNC_START sub_80BDFA4
sub_80BDFA4: @ 0x080BDFA4
	push {r4, r5, r6, r7, lr}
	ldrb r2, [r1]
	lsls r2, r2, #2
	adds r0, #0x2c
	adds r0, r0, r2
	ldr r0, [r0]
	mov ip, r0
	ldrh r2, [r1, #6]
	adds r0, #0x48
	movs r6, #0
	strh r2, [r0]
	ldrh r0, [r1, #8]
	mov r2, ip
	adds r2, #0x4a
	strh r0, [r2]
	ldrh r2, [r1, #0xa]
	mov r0, ip
	adds r0, #0x4c
	strh r2, [r0]
	ldrh r0, [r1, #0xc]
	mov r2, ip
	adds r2, #0x4e
	strh r0, [r2]
	ldr r0, [r1, #0x10]
	mov r2, ip
	str r0, [r2, #0x50]
	ldrb r0, [r1, #2]
	mov r7, ip
	adds r7, #0x29
	movs r5, #1
	movs r4, #1
	adds r2, r4, #0
	ands r2, r0
	lsls r2, r2, #2
	ldrb r3, [r7]
	movs r0, #5
	negs r0, r0
	ands r0, r3
	orrs r0, r2
	strb r0, [r7]
	ldrb r0, [r1, #1]
	mov r2, ip
	adds r2, #0x2f
	strb r0, [r2]
	ldrh r0, [r1, #0xe]
	adds r2, #0x13
	strh r0, [r2]
	ldrb r0, [r7]
	orrs r0, r5
	movs r2, #3
	negs r2, r2
	ands r0, r2
	strb r0, [r7]
	mov r2, ip
	adds r2, #0x2c
	movs r0, #2
	strb r0, [r2]
	ldrb r0, [r7]
	movs r2, #0x10
	orrs r0, r2
	strb r0, [r7]
	ldrb r2, [r1, #3]
	ands r4, r2
	lsls r4, r4, #5
	movs r2, #0x21
	negs r2, r2
	ands r0, r2
	orrs r0, r4
	strb r0, [r7]
	mov r0, ip
	adds r0, #0x30
	strb r6, [r0]
	ldrb r0, [r1, #4]
	mov r2, ip
	adds r2, #0x31
	strb r0, [r2]
	ldrb r0, [r1, #5]
	mov r1, ip
	adds r1, #0x32
	strb r0, [r1]
	mov r0, ip
	movs r1, #2
	bl Proc_Goto
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80BDFA4

	THUMB_FUNC_START sub_80BE054
sub_80BE054: @ 0x080BE054
	lsls r1, r1, #2
	adds r0, #0x2c
	adds r0, r0, r1
	ldr r1, [r0]
	adds r1, #0x29
	ldrb r0, [r1]
	movs r2, #2
	orrs r0, r2
	strb r0, [r1]
	bx lr

	THUMB_FUNC_END sub_80BE054

	THUMB_FUNC_START sub_80BE068
sub_80BE068: @ 0x080BE068
	lsls r1, r1, #2
	adds r0, #0x2c
	adds r0, r0, r1
	ldr r1, [r0]
	adds r1, #0x29
	ldrb r2, [r1]
	movs r0, #3
	negs r0, r0
	ands r0, r2
	strb r0, [r1]
	bx lr

	THUMB_FUNC_END sub_80BE068

	THUMB_FUNC_START sub_80BE080
sub_80BE080: @ 0x080BE080
	push {lr}
	lsls r1, r1, #2
	adds r3, r0, #0
	adds r3, #0x2c
	adds r3, r3, r1
	ldr r1, [r3]
	ldr r0, [r0, #0x14]
	ldr r0, [r0, #0x4c]
	adds r1, #0x2b
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	bl MapUnitC_SetBlendEnabled
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80BE080

	THUMB_FUNC_START sub_80BE0A4
sub_80BE0A4: @ 0x080BE0A4
	push {r4, lr}
	lsls r1, r1, #2
	adds r4, r0, #0
	adds r4, #0x2c
	adds r4, r4, r1
	ldr r1, [r4]
	ldr r0, [r0, #0x14]
	ldr r0, [r0, #0x4c]
	adds r1, #0x2b
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl MapUnitC_GetPosition
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80BE0A4

	THUMB_FUNC_START sub_80BE0C8
sub_80BE0C8: @ 0x080BE0C8
	push {lr}
	lsls r1, r1, #2
	adds r2, r0, #0
	adds r2, #0x2c
	adds r2, r2, r1
	ldr r1, [r2]
	ldr r0, [r0, #0x14]
	ldr r0, [r0, #0x4c]
	adds r1, #0x2b
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl MapUnitC_GetLayer
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80BE0C8

	THUMB_FUNC_START MapMU_SetUnitTCSOAMIndex
MapMU_SetUnitTCSOAMIndex: @ 0x080BE0E8
	push {lr}
	lsls r1, r1, #2
	adds r3, r0, #0
	adds r3, #0x2c
	adds r3, r3, r1
	ldr r1, [r3]
	ldr r0, [r0, #0x14]
	ldr r0, [r0, #0x4c]
	adds r1, #0x2b
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl MapUnitC_SetLayer
	pop {r0}
	bx r0

	THUMB_FUNC_END MapMU_SetUnitTCSOAMIndex

	THUMB_FUNC_START MapMU_80BE108
MapMU_80BE108: @ 0x080BE108
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	lsls r1, r1, #2
	adds r0, #0x2c
	adds r0, r0, r1
	ldr r1, [r0]
	adds r1, #0x29
	movs r0, #1
	ands r2, r0
	lsls r2, r2, #3
	ldrb r3, [r1]
	movs r0, #9
	negs r0, r0
	ands r0, r3
	orrs r0, r2
	strb r0, [r1]
	bx lr

	THUMB_FUNC_END MapMU_80BE108

	THUMB_FUNC_START sub_80BE12C
sub_80BE12C: @ 0x080BE12C
	push {r4, lr}
	adds r2, r0, #0
	cmp r1, #0
	bge _080BE162
	movs r3, #0
	movs r4, #1
	adds r2, #0x2c
_080BE13A:
	ldr r1, [r2]
	adds r0, r1, #0
	adds r0, #0x2b
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	blt _080BE158
	adds r0, r1, #0
	adds r0, #0x29
	ldrb r1, [r0]
	adds r0, r4, #0
	ands r0, r1
	cmp r0, #0
	bne _080BE186
_080BE158:
	adds r2, #4
	adds r3, #1
	cmp r3, #6
	ble _080BE13A
	b _080BE18A
_080BE162:
	lsls r0, r1, #2
	adds r1, r2, #0
	adds r1, #0x2c
	adds r1, r1, r0
	ldr r1, [r1]
	adds r0, r1, #0
	adds r0, #0x2b
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	blt _080BE18A
	adds r0, r1, #0
	adds r0, #0x29
	ldrb r0, [r0]
	lsls r0, r0, #0x1f
	lsrs r0, r0, #0x1f
	b _080BE18C
_080BE186:
	movs r0, #1
	b _080BE18C
_080BE18A:
	movs r0, #0
_080BE18C:
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80BE12C

	THUMB_FUNC_START sub_80BE194
sub_80BE194: @ 0x080BE194
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	adds r6, r0, #0
	adds r5, r6, #0
	adds r5, #0x29
	ldrb r1, [r5]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _080BE1AE
	b _080BE31E
_080BE1AE:
	adds r0, r6, #0
	adds r0, #0x2c
	ldrb r2, [r0]
	cmp r2, #1
	beq _080BE1C0
	cmp r2, #2
	beq _080BE298
	adds r7, r5, #0
	b _080BE30C
_080BE1C0:
	adds r0, r6, #0
	adds r0, #0x2d
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #5
	ldr r3, _080BE290  @ gWMNodeData
	adds r0, r0, r3
	ldrb r1, [r0, #0x1e]
	adds r0, r2, #0
	ands r0, r1
	adds r5, r6, #0
	adds r5, #0x2e
	adds r4, r6, #0
	adds r4, #0x2b
	cmp r0, #0
	beq _080BE200
	movs r0, #0
	ldrsb r0, [r5, r0]
	lsls r0, r0, #5
	adds r0, r0, r3
	ldrb r0, [r0, #0x1e]
	ands r2, r0
	cmp r2, #0
	beq _080BE200
	ldr r0, [r6, #0x14]
	ldr r0, [r0, #0x4c]
	movs r1, #0
	ldrsb r1, [r4, r1]
	movs r2, #0
	bl sub_80BB0E0
_080BE200:
	ldr r0, [r6, #0x14]
	ldr r0, [r0, #0x4c]
	movs r1, #0
	ldrsb r1, [r4, r1]
	movs r3, #0
	ldrsb r3, [r5, r3]
	lsls r3, r3, #5
	ldr r2, _080BE290  @ gWMNodeData
	adds r3, r3, r2
	movs r7, #0x18
	ldrsh r2, [r3, r7]
	movs r7, #0x1a
	ldrsh r3, [r3, r7]
	adds r3, #6
	bl MapUnitC_SetPosition
	ldr r0, [r6, #0x14]
	ldr r0, [r0, #0x4c]
	movs r1, #0
	ldrsb r1, [r4, r1]
	movs r2, #4
	bl MapUnitC_SetAnimId
	ldr r0, _080BE294  @ gGMData
	mov r8, r0
	adds r0, r6, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #2
	add r0, r8
	ldrb r1, [r5]
	strb r1, [r0, #0x11]
	adds r2, r6, #0
	adds r2, #0x29
	ldrb r1, [r2]
	movs r0, #8
	ands r0, r1
	adds r7, r2, #0
	cmp r0, #0
	beq _080BE30C
	ldr r0, [r6, #0x14]
	ldr r0, [r0, #0x4c]
	movs r1, #0
	ldrsb r1, [r4, r1]
	mov r4, sp
	adds r4, #2
	mov r2, sp
	adds r3, r4, #0
	bl MapUnitC_GetPosition
	mov r0, sp
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r2, #0
	ldrsh r1, [r4, r2]
	subs r1, #0xe
	add r4, sp, #4
	mov r5, sp
	adds r5, #6
	adds r2, r4, #0
	adds r3, r5, #0
	bl GetWMCenteredCameraPosition
	ldrh r0, [r4]
	mov r3, r8
	strh r0, [r3, #2]
	ldrh r0, [r5]
	strh r0, [r3, #4]
	b _080BE30C
	.align 2, 0
_080BE290: .4byte gWMNodeData
_080BE294: .4byte gGMData
_080BE298:
	ldr r0, [r6, #0x14]
	ldr r0, [r0, #0x4c]
	adds r4, r6, #0
	adds r4, #0x2b
	movs r1, #0
	ldrsb r1, [r4, r1]
	adds r2, r6, #0
	adds r2, #0x4c
	movs r7, #0
	ldrsh r2, [r2, r7]
	adds r3, r6, #0
	adds r3, #0x4e
	movs r7, #0
	ldrsh r3, [r3, r7]
	adds r3, #6
	bl MapUnitC_SetPosition
	ldr r0, [r6, #0x14]
	ldr r0, [r0, #0x4c]
	movs r1, #0
	ldrsb r1, [r4, r1]
	movs r2, #4
	bl MapUnitC_SetAnimId
	ldrb r1, [r5]
	movs r0, #8
	ands r0, r1
	adds r7, r5, #0
	cmp r0, #0
	beq _080BE30C
	ldr r0, [r6, #0x14]
	ldr r0, [r0, #0x4c]
	movs r1, #0
	ldrsb r1, [r4, r1]
	mov r4, sp
	adds r4, #2
	mov r2, sp
	adds r3, r4, #0
	bl MapUnitC_GetPosition
	mov r0, sp
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r2, #0
	ldrsh r1, [r4, r2]
	subs r1, #0xe
	add r4, sp, #4
	mov r5, sp
	adds r5, #6
	adds r2, r4, #0
	adds r3, r5, #0
	bl GetWMCenteredCameraPosition
	ldr r1, _080BE32C  @ gGMData
	ldrh r0, [r4]
	strh r0, [r1, #2]
	ldrh r0, [r5]
	strh r0, [r1, #4]
_080BE30C:
	ldrb r1, [r7]
	movs r0, #2
	negs r0, r0
	ands r0, r1
	strb r0, [r7]
	adds r0, r6, #0
	movs r1, #0
	bl Proc_Goto
_080BE31E:
	movs r0, #0
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080BE32C: .4byte gGMData

	THUMB_FUNC_END sub_80BE194

	THUMB_FUNC_START sub_80BE330
sub_80BE330: @ 0x080BE330
	push {r4, r5, lr}
	cmp r1, #0
	bge _080BE34A
	adds r5, r0, #0
	adds r5, #0x2c
	movs r4, #6
_080BE33C:
	ldm r5!, {r0}
	bl sub_80BE194
	subs r4, #1
	cmp r4, #0
	bge _080BE33C
	b _080BE356
_080BE34A:
	lsls r1, r1, #2
	adds r0, #0x2c
	adds r0, r0, r1
	ldr r0, [r0]
	bl sub_80BE194
_080BE356:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80BE330

	THUMB_FUNC_START sub_80BE35C
sub_80BE35C: @ 0x080BE35C
	push {r4, r5, r6, lr}
	lsls r1, r1, #2
	adds r0, #0x2c
	adds r0, r0, r1
	ldr r6, [r0]
	lsls r2, r2, #0x10
	lsls r3, r3, #0x10
	movs r0, #0xc0
	lsls r0, r0, #0xb
	adds r3, r3, r0
	ldr r0, [r6, #0x14]
	ldr r0, [r0, #0x4c]
	adds r1, r6, #0
	adds r1, #0x2b
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	lsrs r4, r2, #0x10
	asrs r2, r2, #0x10
	lsrs r5, r3, #0x10
	asrs r3, r3, #0x10
	bl MapUnitC_SetPosition
	adds r0, r6, #0
	adds r0, #0x44
	movs r1, #0
	strh r4, [r0]
	adds r0, #2
	strh r5, [r0]
	subs r0, #6
	strh r1, [r0]
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80BE35C

	THUMB_FUNC_START sub_80BE3A0
sub_80BE3A0: @ 0x080BE3A0
	push {r4, lr}
	adds r4, r3, #0
	lsls r1, r1, #2
	adds r0, #0x2c
	adds r0, r0, r1
	ldr r1, [r0]
	ldr r0, [r1, #0x14]
	ldr r0, [r0, #0x4c]
	adds r1, #0x2b
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl MapUnitC_GetPosition
	ldrh r0, [r4]
	subs r0, #6
	strh r0, [r4]
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80BE3A0

	THUMB_FUNC_START sub_80BE3C8
sub_80BE3C8: @ 0x080BE3C8
	push {r4, lr}
	lsls r3, r2, #5
	ldr r2, _080BE3E4  @ gWMNodeData
	adds r3, r3, r2
	movs r4, #0x18
	ldrsh r2, [r3, r4]
	movs r4, #0x1a
	ldrsh r3, [r3, r4]
	bl sub_80BE35C
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BE3E4: .4byte gWMNodeData

	THUMB_FUNC_END sub_80BE3C8

	THUMB_FUNC_START sub_80BE3E8
sub_80BE3E8: @ 0x080BE3E8
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	lsls r1, r1, #2
	adds r0, #0x2c
	adds r0, r0, r1
	ldr r1, [r0]
	adds r1, #0x29
	movs r0, #1
	ands r2, r0
	lsls r2, r2, #2
	ldrb r3, [r1]
	movs r0, #5
	negs r0, r0
	ands r0, r3
	orrs r0, r2
	strb r0, [r1]
	bx lr

	THUMB_FUNC_END sub_80BE3E8

	THUMB_FUNC_START sub_80BE40C
sub_80BE40C: @ 0x080BE40C
	push {lr}
	lsls r1, r1, #2
	adds r0, #0x2c
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, #0x2b
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r1, r2, #0
	movs r2, #0
	bl sub_80BB4C0
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80BE40C

	THUMB_FUNC_START sub_80BE42C
sub_80BE42C: @ 0x080BE42C
	push {lr}
	lsls r1, r1, #2
	adds r0, #0x2c
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, #0x2b
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r1, r2, #0
	movs r2, #0
	bl sub_80BB538
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80BE42C

	THUMB_FUNC_START sub_80BE44C
sub_80BE44C: @ 0x080BE44C
	push {lr}
	bl GetGmapUnitFade
	cmp r0, #0
	beq _080BE458
	movs r0, #1
_080BE458:
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80BE44C

	THUMB_FUNC_START sub_80BE45C
sub_80BE45C: @ 0x080BE45C
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r0, [r6, #0x14]
	ldr r0, [r0, #0x4c]
	adds r1, r6, #0
	adds r1, #0x2b
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl sub_80BB194
	adds r4, r0, #0
	bl GetClassData
	ldr r0, [r0, #0x28]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _080BE4AC
	cmp r4, #0x1f
	blt _080BE4A4
	cmp r4, #0x24
	ble _080BE49C
	cmp r4, #0x49
	bgt _080BE4A4
	cmp r4, #0x48
	blt _080BE4A4
	ldr r4, _080BE498  @ gUnknown_08A3E3BA
	b _080BE4E6
	.align 2, 0
_080BE498: .4byte gUnknown_08A3E3BA
_080BE49C:
	ldr r4, _080BE4A0  @ gUnknown_08A3E38E
	b _080BE4E6
	.align 2, 0
_080BE4A0: .4byte gUnknown_08A3E38E
_080BE4A4:
	ldr r4, _080BE4A8  @ gUnknown_08A3E360
	b _080BE4E6
	.align 2, 0
_080BE4A8: .4byte gUnknown_08A3E360
_080BE4AC:
	cmp r4, #0x65
	beq _080BE4D4
	cmp r4, #0x65
	bgt _080BE4CC
	cmp r4, #0x3c
	bgt _080BE4C6
	cmp r4, #0x3b
	bge _080BE4D4
	cmp r4, #0xc
	bgt _080BE4E4
	cmp r4, #9
	blt _080BE4E4
	b _080BE4D4
_080BE4C6:
	cmp r4, #0x50
	beq _080BE4DC
	b _080BE4E4
_080BE4CC:
	cmp r4, #0x69
	bgt _080BE4E4
	cmp r4, #0x67
	blt _080BE4E4
_080BE4D4:
	ldr r4, _080BE4D8  @ gUnknown_08A3E31C
	b _080BE4E6
	.align 2, 0
_080BE4D8: .4byte gUnknown_08A3E31C
_080BE4DC:
	ldr r4, _080BE4E0  @ gUnknown_08A3E412
	b _080BE4E6
	.align 2, 0
_080BE4E0: .4byte gUnknown_08A3E412
_080BE4E4:
	ldr r4, _080BE528  @ gUnknown_08A3E2F8
_080BE4E6:
	adds r2, r6, #0
	adds r2, #0x30
	ldrb r0, [r2]
	adds r1, r0, #1
	strb r1, [r2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrh r1, [r4]
	bl DivRem
	ldr r1, _080BE52C  @ 0xFFFF0000
	ands r5, r1
	movs r1, #0x78
	orrs r5, r1
	ldr r1, _080BE530  @ 0x0000FFFF
	ands r5, r1
	movs r1, #0xa0
	lsls r1, r1, #0xf
	orrs r5, r1
	lsls r0, r0, #1
	adds r1, r0, r4
	ldrh r0, [r1, #4]
	cmp r0, #0
	beq _080BE520
	ldrh r1, [r4, #2]
	lsls r2, r5, #0x10
	asrs r2, r2, #0x10
	bl MU_StartStepSfx
_080BE520:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080BE528: .4byte gUnknown_08A3E2F8
_080BE52C: .4byte 0xFFFF0000
_080BE530: .4byte 0x0000FFFF

	THUMB_FUNC_END sub_80BE45C

	THUMB_FUNC_START MapMU_SetUnitClass
MapMU_SetUnitClass: @ 0x080BE534
	push {r4, lr}
	sub sp, #8
	adds r4, r2, #0
	ldr r2, [sp, #0x10]
	str r3, [sp]
	str r2, [sp, #4]
	movs r2, #1
	adds r3, r4, #0
	bl MapMU_SetUnit
	add sp, #8
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END MapMU_SetUnitClass

	THUMB_FUNC_START MapMU_SetUnitChar
MapMU_SetUnitChar: @ 0x080BE550
	push {r4, lr}
	sub sp, #8
	adds r4, r2, #0
	ldr r2, [sp, #0x10]
	str r3, [sp]
	str r2, [sp, #4]
	movs r2, #0
	adds r3, r4, #0
	bl MapMU_SetUnit
	add sp, #8
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END MapMU_SetUnitChar

	THUMB_FUNC_START sub_80BE56C
sub_80BE56C: @ 0x080BE56C
	push {r4, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x57
	movs r0, #0xff
	strb r0, [r1]
	adds r0, r4, #0
	adds r0, #0x2c
	movs r1, #6
	bl InitTextDb
	movs r1, #0
	str r1, [r4, #0x58]
	adds r0, r4, #0
	adds r0, #0x56
	strb r1, [r0]
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80BE56C

	THUMB_FUNC_START sub_80BE594
sub_80BE594: @ 0x080BE594
	push {lr}
	cmp r0, #0
	bge _080BE5A6
	cmp r1, #0
	bge _080BE5A2
	movs r0, #0
	b _080BE5B0
_080BE5A2:
	movs r0, #1
	b _080BE5B0
_080BE5A6:
	cmp r1, #0
	blt _080BE5AE
	movs r0, #3
	b _080BE5B0
_080BE5AE:
	movs r0, #2
_080BE5B0:
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80BE594

	THUMB_FUNC_START sub_80BE5B4
sub_80BE5B4: @ 0x080BE5B4
	push {lr}
	cmp r0, #0x40
	beq _080BE5DC
	cmp r0, #0x40
	bgt _080BE5C4
	cmp r0, #0
	beq _080BE5CA
	b _080BE5E4
_080BE5C4:
	cmp r0, #0x80
	beq _080BE5D4
	b _080BE5E4
_080BE5CA:
	ldr r0, _080BE5D0  @ gUnknown_08A98E2C
	b _080BE5E6
	.align 2, 0
_080BE5D0: .4byte gUnknown_08A98E2C
_080BE5D4:
	ldr r0, _080BE5D8  @ gUnknown_08A98E4C
	b _080BE5E6
	.align 2, 0
_080BE5D8: .4byte gUnknown_08A98E4C
_080BE5DC:
	ldr r0, _080BE5E0  @ gUnknown_08A98E6C
	b _080BE5E6
	.align 2, 0
_080BE5E0: .4byte gUnknown_08A98E6C
_080BE5E4:
	ldr r0, _080BE5F4  @ gUnknown_08A98E8C
_080BE5E6:
	lsls r1, r1, #5
	movs r2, #0x20
	bl CopyToPaletteBuffer
	pop {r0}
	bx r0
	.align 2, 0
_080BE5F4: .4byte gUnknown_08A98E8C

	THUMB_FUNC_END sub_80BE5B4

	THUMB_FUNC_START sub_80BE5F8
sub_80BE5F8: @ 0x080BE5F8
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r2, #0xc0
	lsls r2, r2, #1
	adds r0, r2, #0
	strh r0, [r5]
	adds r2, #1
	adds r0, r2, #0
	strh r0, [r5, #2]
	movs r4, #8
	ldrsb r4, [r1, r4]
	cmp r4, #9
	ble _080BE622
	adds r0, r4, #0
	movs r1, #0xa
	bl __divsi3
	movs r1, #0xc4
	lsls r1, r1, #1
	adds r0, r0, r1
	strh r0, [r5, #4]
_080BE622:
	adds r0, r4, #0
	movs r1, #0xa
	bl __modsi3
	movs r2, #0xc4
	lsls r2, r2, #1
	adds r0, r0, r2
	strh r0, [r5, #6]
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80BE5F8

	THUMB_FUNC_START sub_80BE638
sub_80BE638: @ 0x080BE638
	push {lr}
	adds r2, r0, #0
	adds r3, r1, #0
	adds r0, #0x44
	ldrh r1, [r0]
	movs r0, #0x3f
	ands r0, r1
	cmp r0, #0
	bne _080BE658
	ldr r0, [r2, #0x40]
	adds r1, r3, #0
	bl sub_80BE5F8
	movs r0, #1
	bl BG_EnableSyncByMask
_080BE658:
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80BE638

.align 2, 0
