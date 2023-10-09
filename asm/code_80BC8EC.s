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

.align 2, 0
