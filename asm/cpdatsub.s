	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	@ Core stuff to AI scripts

	THUMB_FUNC_START sub_803C4BC
sub_803C4BC: @ 0x0803C4BC
	push {r4, lr}
	ldr r3, _0803C4FC  @ gUnknown_030017D0
	ldr r2, _0803C500  @ gUnknown_085A91E4
	ldr r0, _0803C504  @ gUnknown_03004E50
	ldr r0, [r0]
	adds r1, r0, #0
	adds r1, #0x42
	ldrb r1, [r1]
	ldr r2, [r2]
	lsls r1, r1, #2
	adds r1, r1, r2
	ldr r2, [r1]
	str r2, [r3]
	adds r0, #0x43
	ldrb r1, [r0]
	lsls r1, r1, #4
	adds r2, r2, r1
	str r2, [r3]
	ldr r4, _0803C508  @ gUnknown_030017C8
	movs r1, #1
	strb r1, [r4]
	ldr r2, _0803C50C  @ gUnknown_030017CC
	movs r1, #0
	str r1, [r2]
	bl sub_803C5DC
	movs r0, #0
	ldrsb r0, [r4, r0]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0803C4FC: .4byte gUnknown_030017D0
_0803C500: .4byte gUnknown_085A91E4
_0803C504: .4byte gUnknown_03004E50
_0803C508: .4byte gUnknown_030017C8
_0803C50C: .4byte gUnknown_030017CC

	THUMB_FUNC_START sub_803C510
sub_803C510: @ 0x0803C510
	push {r4, lr}
	ldr r1, _0803C538  @ gUnknown_030017D0
	ldr r0, _0803C53C  @ gUnknown_085A812C
	str r0, [r1]
	ldr r4, _0803C540  @ gUnknown_030017C8
	movs r0, #1
	strb r0, [r4]
	ldr r1, _0803C544  @ gUnknown_030017CC
	movs r0, #0
	str r0, [r1]
	ldr r0, _0803C548  @ gUnknown_03004E50
	ldr r0, [r0]
	adds r0, #0x43
	bl sub_803C5DC
	movs r0, #0
	ldrsb r0, [r4, r0]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0803C538: .4byte gUnknown_030017D0
_0803C53C: .4byte gUnknown_085A812C
_0803C540: .4byte gUnknown_030017C8
_0803C544: .4byte gUnknown_030017CC
_0803C548: .4byte gUnknown_03004E50

	THUMB_FUNC_START sub_803C54C
sub_803C54C: @ 0x0803C54C
	push {r4, lr}
	ldr r3, _0803C58C  @ gUnknown_030017D0
	ldr r2, _0803C590  @ gUnknown_085A91D8
	ldr r0, _0803C594  @ gUnknown_03004E50
	ldr r0, [r0]
	adds r1, r0, #0
	adds r1, #0x44
	ldrb r1, [r1]
	ldr r2, [r2]
	lsls r1, r1, #2
	adds r1, r1, r2
	ldr r2, [r1]
	str r2, [r3]
	adds r0, #0x45
	ldrb r1, [r0]
	lsls r1, r1, #4
	adds r2, r2, r1
	str r2, [r3]
	ldr r4, _0803C598  @ gUnknown_030017C8
	movs r1, #1
	strb r1, [r4]
	ldr r2, _0803C59C  @ gUnknown_030017CC
	movs r1, #1
	str r1, [r2]
	bl sub_803C5DC
	movs r0, #0
	ldrsb r0, [r4, r0]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0803C58C: .4byte gUnknown_030017D0
_0803C590: .4byte gUnknown_085A91D8
_0803C594: .4byte gUnknown_03004E50
_0803C598: .4byte gUnknown_030017C8
_0803C59C: .4byte gUnknown_030017CC

	THUMB_FUNC_START sub_803C5A0
sub_803C5A0: @ 0x0803C5A0
	push {r4, lr}
	ldr r1, _0803C5C8  @ gUnknown_030017D0
	ldr r0, _0803C5CC  @ gUnknown_085A813C
	str r0, [r1]
	ldr r4, _0803C5D0  @ gUnknown_030017C8
	movs r0, #1
	strb r0, [r4]
	ldr r1, _0803C5D4  @ gUnknown_030017CC
	movs r0, #1
	str r0, [r1]
	ldr r0, _0803C5D8  @ gUnknown_03004E50
	ldr r0, [r0]
	adds r0, #0x45
	bl sub_803C5DC
	movs r0, #0
	ldrsb r0, [r4, r0]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0803C5C8: .4byte gUnknown_030017D0
_0803C5CC: .4byte gUnknown_085A813C
_0803C5D0: .4byte gUnknown_030017C8
_0803C5D4: .4byte gUnknown_030017CC
_0803C5D8: .4byte gUnknown_03004E50

	THUMB_FUNC_START sub_803C5DC
sub_803C5DC: @ 0x0803C5DC
	push {r4, lr}
	sub sp, #0x70
	adds r4, r0, #0
	ldr r1, _0803C604  @ gUnknown_080D80FC
	mov r0, sp
	movs r2, #0x70
	bl memcpy
	ldr r1, _0803C608  @ gUnknown_030017D0
	ldr r0, [r1]
	ldrb r0, [r0]
	cmp r0, #0x1c
	bls _0803C618
	ldr r0, _0803C60C  @ gUnknown_030017CC
	ldr r0, [r0]
	cmp r0, #0
	bne _0803C614
	ldr r0, _0803C610  @ gUnknown_085A812C
	b _0803C616
	.align 2, 0
_0803C604: .4byte gUnknown_080D80FC
_0803C608: .4byte gUnknown_030017D0
_0803C60C: .4byte gUnknown_030017CC
_0803C610: .4byte gUnknown_085A812C
_0803C614:
	ldr r0, _0803C63C  @ gUnknown_085A813C
_0803C616:
	str r0, [r1]
_0803C618:
	ldr r1, _0803C640  @ gUnknown_0203AA04
	ldr r0, _0803C644  @ gUnknown_030017D0
	ldr r2, [r0]
	ldrb r0, [r2, #2]
	adds r1, #0x7e
	strb r0, [r1]
	ldrb r0, [r2]
	lsls r0, r0, #2
	add r0, sp
	ldr r1, [r0]
	adds r0, r4, #0
	bl _call_via_r1
	add sp, #0x70
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0803C63C: .4byte gUnknown_085A813C
_0803C640: .4byte gUnknown_0203AA04
_0803C644: .4byte gUnknown_030017D0

	THUMB_FUNC_START sub_803C648
sub_803C648: @ 0x0803C648
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r0, _0803C678  @ gUnknown_030017D0
	ldr r2, [r0]
	ldrb r5, [r2, #3]
	movs r4, #0
	ldr r0, [r2, #8]
	ldrb r1, [r2, #1]
	ldr r2, [r2, #4]
	bl sub_803A71C
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _0803C6D4
	ldr r0, _0803C67C  @ gUnknown_030017CC
	ldr r0, [r0]
	cmp r0, #0
	bne _0803C688
	ldr r1, _0803C680  @ gUnknown_085A91E4
	ldr r0, _0803C684  @ gUnknown_03004E50
	ldr r0, [r0]
	adds r0, #0x42
	b _0803C690
	.align 2, 0
_0803C678: .4byte gUnknown_030017D0
_0803C67C: .4byte gUnknown_030017CC
_0803C680: .4byte gUnknown_085A91E4
_0803C684: .4byte gUnknown_03004E50
_0803C688:
	ldr r1, _0803C6A8  @ gUnknown_085A91D8
	ldr r0, _0803C6AC  @ gUnknown_03004E50
	ldr r0, [r0]
	adds r0, #0x44
_0803C690:
	ldrb r0, [r0]
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r2, [r0]
	cmp r5, #0
	beq _0803C6D0
	lsls r0, r4, #4
	adds r1, r0, r2
	ldrb r0, [r1]
	ldr r3, _0803C6B0  @ gUnknown_030017C8
	b _0803C6C0
	.align 2, 0
_0803C6A8: .4byte gUnknown_085A91D8
_0803C6AC: .4byte gUnknown_03004E50
_0803C6B0: .4byte gUnknown_030017C8
_0803C6B4:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	lsls r0, r4, #4
	adds r1, r0, r2
	ldrb r0, [r1]
_0803C6C0:
	cmp r0, #0x1c
	bne _0803C6B4
	ldrb r0, [r1, #3]
	cmp r0, r5
	bne _0803C6B4
	adds r0, r4, #1
	strb r0, [r6]
	b _0803C6DC
_0803C6D0:
	strb r5, [r6]
	b _0803C6DA
_0803C6D4:
	ldrb r0, [r6]
	adds r0, #1
	strb r0, [r6]
_0803C6DA:
	ldr r3, _0803C6E8  @ gUnknown_030017C8
_0803C6DC:
	movs r0, #0
	strb r0, [r3]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0803C6E8: .4byte gUnknown_030017C8

	THUMB_FUNC_START sub_803C6EC
sub_803C6EC: @ 0x0803C6EC
	push {r4, lr}
	adds r4, r0, #0
	ldr r2, _0803C710  @ gUnknown_030017D4
	ldr r0, _0803C714  @ gUnknown_030017D0
	ldr r0, [r0]
	ldr r1, [r0, #8]
	str r1, [r2]
	ldr r0, [r0, #0xc]
	bl _call_via_r1
	ldr r1, _0803C718  @ gUnknown_030017C8
	strb r0, [r1]
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0803C710: .4byte gUnknown_030017D4
_0803C714: .4byte gUnknown_030017D0
_0803C718: .4byte gUnknown_030017C8

	THUMB_FUNC_START sub_803C71C
sub_803C71C: @ 0x0803C71C
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r0, _0803C77C  @ gUnknown_030017D0
	ldr r0, [r0]
	ldrb r3, [r0, #1]
	adds r6, r3, #0
	ldrb r4, [r0, #2]
	adds r7, r4, #0
	cmp r3, #0xff
	beq _0803C740
	ldr r1, _0803C780  @ gUnknown_03004E50
	ldr r0, [r1]
	adds r0, #0x42
	movs r2, #0
	strb r3, [r0]
	ldr r0, [r1]
	adds r0, #0x43
	strb r2, [r0]
_0803C740:
	cmp r4, #0xff
	beq _0803C754
	ldr r1, _0803C780  @ gUnknown_03004E50
	ldr r0, [r1]
	adds r0, #0x44
	movs r2, #0
	strb r4, [r0]
	ldr r0, [r1]
	adds r0, #0x45
	strb r2, [r0]
_0803C754:
	ldr r0, _0803C784  @ gUnknown_030017CC
	ldr r0, [r0]
	cmp r0, #0
	bne _0803C760
	cmp r6, #0xff
	beq _0803C768
_0803C760:
	cmp r0, #1
	bne _0803C76E
	cmp r7, #0xff
	bne _0803C76E
_0803C768:
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
_0803C76E:
	ldr r0, _0803C788  @ gUnknown_0203AA04
	adds r0, #0x79
	movs r1, #0
	strb r1, [r0]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803C77C: .4byte gUnknown_030017D0
_0803C780: .4byte gUnknown_03004E50
_0803C784: .4byte gUnknown_030017CC
_0803C788: .4byte gUnknown_0203AA04

	THUMB_FUNC_START sub_803C78C
sub_803C78C: @ 0x0803C78C
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, _0803C7AC  @ gUnknown_030017D0
	ldr r0, [r0]
	ldrb r4, [r0, #3]
	movs r3, #0
	ldr r0, _0803C7B0  @ gUnknown_030017CC
	ldr r0, [r0]
	cmp r0, #0
	bne _0803C7BC
	ldr r1, _0803C7B4  @ gUnknown_085A91E4
	ldr r0, _0803C7B8  @ gUnknown_03004E50
	ldr r0, [r0]
	adds r0, #0x42
	b _0803C7C4
	.align 2, 0
_0803C7AC: .4byte gUnknown_030017D0
_0803C7B0: .4byte gUnknown_030017CC
_0803C7B4: .4byte gUnknown_085A91E4
_0803C7B8: .4byte gUnknown_03004E50
_0803C7BC:
	ldr r1, _0803C7DC  @ gUnknown_085A91D8
	ldr r0, _0803C7E0  @ gUnknown_03004E50
	ldr r0, [r0]
	adds r0, #0x44
_0803C7C4:
	ldrb r0, [r0]
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r2, [r0]
	cmp r4, #0
	beq _0803C804
	lsls r0, r3, #4
	adds r1, r0, r2
	ldrb r0, [r1]
	ldr r6, _0803C7E4  @ gUnknown_030017C8
	b _0803C7F4
	.align 2, 0
_0803C7DC: .4byte gUnknown_085A91D8
_0803C7E0: .4byte gUnknown_03004E50
_0803C7E4: .4byte gUnknown_030017C8
_0803C7E8:
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	lsls r0, r3, #4
	adds r1, r0, r2
	ldrb r0, [r1]
_0803C7F4:
	cmp r0, #0x1c
	bne _0803C7E8
	ldrb r0, [r1, #3]
	cmp r0, r4
	bne _0803C7E8
	adds r0, r3, #1
	strb r0, [r5]
	b _0803C808
_0803C804:
	strb r4, [r5]
	ldr r6, _0803C814  @ gUnknown_030017C8
_0803C808:
	movs r0, #0
	strb r0, [r6]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0803C814: .4byte gUnknown_030017C8

	THUMB_FUNC_START sub_803C818
sub_803C818: @ 0x0803C818
	push {lr}
	adds r1, r0, #0
	ldr r0, _0803C83C  @ gUnknown_03004E50
	ldr r0, [r0]
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldrb r1, [r1, #0xb]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl AreUnitsAllied
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0803C840
	movs r0, #1
	b _0803C842
	.align 2, 0
_0803C83C: .4byte gUnknown_03004E50
_0803C840:
	movs r0, #0
_0803C842:
	pop {r1}
	bx r1

	THUMB_FUNC_START sub_803C848
sub_803C848: @ 0x0803C848
	push {lr}
	ldr r1, _0803C858  @ gUnknown_03004E50
	ldr r1, [r1]
	cmp r0, r1
	beq _0803C85C
	movs r0, #1
	b _0803C85E
	.align 2, 0
_0803C858: .4byte gUnknown_03004E50
_0803C85C:
	movs r0, #0
_0803C85E:
	pop {r1}
	bx r1

	THUMB_FUNC_START sub_803C864
sub_803C864: @ 0x0803C864
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0803C89C  @ gUnknown_030017D0
	ldr r0, [r0]
	ldr r0, [r0, #8]
	ldr r1, [r4]
	ldrb r1, [r1, #4]
	bl sub_803ACF8
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq _0803C8A4
	ldr r0, _0803C8A0  @ gUnknown_03004E50
	ldr r0, [r0]
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #0xb
	ldrsb r1, [r4, r1]
	bl AreUnitsAllied
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0803C8A4
	movs r0, #1
	b _0803C8A6
	.align 2, 0
_0803C89C: .4byte gUnknown_030017D0
_0803C8A0: .4byte gUnknown_03004E50
_0803C8A4:
	movs r0, #0
_0803C8A6:
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_START sub_803C8AC
sub_803C8AC: @ 0x0803C8AC
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0803C8E4  @ gUnknown_030017D0
	ldr r0, [r0]
	ldr r0, [r0, #8]
	ldr r1, [r4]
	ldrb r1, [r1, #4]
	bl sub_803ACF8
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq _0803C8DE
	ldr r0, _0803C8E8  @ gUnknown_03004E50
	ldr r0, [r0]
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #0xb
	ldrsb r1, [r4, r1]
	bl AreUnitsAllied
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0803C8EC
_0803C8DE:
	movs r0, #1
	b _0803C8EE
	.align 2, 0
_0803C8E4: .4byte gUnknown_030017D0
_0803C8E8: .4byte gUnknown_03004E50
_0803C8EC:
	movs r0, #0
_0803C8EE:
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_START sub_803C8F4
sub_803C8F4: @ 0x0803C8F4
	push {lr}
	adds r2, r0, #0
	ldr r0, [r2]
	ldrb r1, [r0, #4]
	ldr r0, _0803C924  @ gUnknown_030017D0
	ldr r0, [r0]
	ldr r0, [r0, #4]
	cmp r1, r0
	bne _0803C92C
	ldr r0, _0803C928  @ gUnknown_03004E50
	ldr r0, [r0]
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #0xb
	ldrsb r1, [r2, r1]
	bl AreUnitsAllied
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0803C92C
	movs r0, #1
	b _0803C92E
	.align 2, 0
_0803C924: .4byte gUnknown_030017D0
_0803C928: .4byte gUnknown_03004E50
_0803C92C:
	movs r0, #0
_0803C92E:
	pop {r1}
	bx r1

	THUMB_FUNC_START sub_803C934
sub_803C934: @ 0x0803C934
	push {lr}
	adds r2, r0, #0
	ldr r0, [r2, #4]
	ldrb r1, [r0, #4]
	ldr r0, _0803C964  @ gUnknown_030017D0
	ldr r0, [r0]
	ldr r0, [r0, #4]
	cmp r1, r0
	bne _0803C96C
	ldr r0, _0803C968  @ gUnknown_03004E50
	ldr r0, [r0]
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #0xb
	ldrsb r1, [r2, r1]
	bl AreUnitsAllied
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0803C96C
	movs r0, #1
	b _0803C96E
	.align 2, 0
_0803C964: .4byte gUnknown_030017D0
_0803C968: .4byte gUnknown_03004E50
_0803C96C:
	movs r0, #0
_0803C96E:
	pop {r1}
	bx r1

	THUMB_FUNC_START sub_803C974
sub_803C974: @ 0x0803C974
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	movs r0, #0x64
	bl NextRN_N
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r5, _0803C9C4  @ gUnknown_030017D0
	ldr r1, [r5]
	ldrb r1, [r1, #1]
	cmp r0, r1
	bhi _0803C9F4
	ldr r0, _0803C9C8  @ sub_803C818
	bl sub_803FA40
	lsls r0, r0, #0x18
	asrs r4, r0, #0x18
	cmp r4, #0
	bne _0803C9FC
	ldr r0, [r5]
	ldrh r0, [r0, #4]
	bl sub_803BF84
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _0803C9DC
	ldr r0, [r5]
	ldr r0, [r0, #4]
	bl GetUnitByCharId
	ldr r0, [r0, #0xc]
	movs r1, #0x20
	ands r0, r1
	cmp r0, #0
	beq _0803C9D0
	ldr r0, _0803C9CC  @ gUnknown_0203AA04
	adds r0, #0x86
	movs r1, #3
	b _0803C9E2
	.align 2, 0
_0803C9C4: .4byte gUnknown_030017D0
_0803C9C8: .4byte sub_803C818
_0803C9CC: .4byte gUnknown_0203AA04
_0803C9D0:
	ldr r0, _0803C9D8  @ sub_803C8F4
	bl sub_803D450
	b _0803C9FC
	.align 2, 0
_0803C9D8: .4byte sub_803C8F4
_0803C9DC:
	ldr r0, _0803C9EC  @ gUnknown_0203AA04
	adds r0, #0x86
	movs r1, #1
_0803C9E2:
	strb r1, [r0]
	ldr r0, _0803C9F0  @ gUnknown_030017C8
	strb r4, [r0]
	b _0803C9FC
	.align 2, 0
_0803C9EC: .4byte gUnknown_0203AA04
_0803C9F0: .4byte gUnknown_030017C8
_0803C9F4:
	ldr r0, _0803CA08  @ gUnknown_0203AA04
	adds r0, #0x79
	movs r1, #4
	strb r1, [r0]
_0803C9FC:
	ldrb r0, [r6]
	adds r0, #1
	strb r0, [r6]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0803CA08: .4byte gUnknown_0203AA04

	THUMB_FUNC_START sub_803CA0C
sub_803CA0C: @ 0x0803CA0C
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r0, #0x64
	bl NextRN_N
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _0803CA40  @ gUnknown_030017D0
	ldr r1, [r1]
	ldrb r2, [r1, #1]
	cmp r0, r2
	bhi _0803CA64
	ldr r0, [r1, #8]
	cmp r0, #0
	bne _0803CA48
	ldr r4, _0803CA44  @ sub_803C818
	adds r0, r4, #0
	bl sub_803FA40
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0803CA6C
	adds r0, r4, #0
	bl sub_803D450
	b _0803CA6C
	.align 2, 0
_0803CA40: .4byte gUnknown_030017D0
_0803CA44: .4byte sub_803C818
_0803CA48:
	ldr r0, _0803CA5C  @ sub_803C8AC
	bl sub_803FA40
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0803CA6C
	ldr r0, _0803CA60  @ sub_803C864
	bl sub_803D450
	b _0803CA6C
	.align 2, 0
_0803CA5C: .4byte sub_803C8AC
_0803CA60: .4byte sub_803C864
_0803CA64:
	ldr r0, _0803CA78  @ gUnknown_0203AA04
	adds r0, #0x79
	movs r1, #4
	strb r1, [r0]
_0803CA6C:
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0803CA78: .4byte gUnknown_0203AA04

	THUMB_FUNC_START sub_803CA7C
sub_803CA7C: @ 0x0803CA7C
	ldrb r1, [r0]
	adds r1, #1
	strb r1, [r0]
	bx lr

	THUMB_FUNC_START sub_803CA84
sub_803CA84: @ 0x0803CA84
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r0, #0x64
	bl NextRN_N
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _0803CAC0  @ gUnknown_030017D0
	ldr r1, [r1]
	ldrb r1, [r1, #1]
	cmp r0, r1
	bhi _0803CACC
	ldr r1, _0803CAC4  @ gUnknown_0203AA04
	adds r1, #0x7b
	ldrb r2, [r1]
	movs r0, #2
	orrs r0, r2
	strb r0, [r1]
	ldr r4, _0803CAC8  @ sub_803C818
	adds r0, r4, #0
	bl sub_803FA40
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0803CAD4
	adds r0, r4, #0
	bl sub_803D450
	b _0803CAD4
	.align 2, 0
_0803CAC0: .4byte gUnknown_030017D0
_0803CAC4: .4byte gUnknown_0203AA04
_0803CAC8: .4byte sub_803C818
_0803CACC:
	ldr r0, _0803CAE0  @ gUnknown_0203AA04
	adds r0, #0x79
	movs r1, #4
	strb r1, [r0]
_0803CAD4:
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0803CAE0: .4byte gUnknown_0203AA04

	THUMB_FUNC_START sub_803CAE4
sub_803CAE4: @ 0x0803CAE4
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r0, #0x64
	bl NextRN_N
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _0803CB14  @ gUnknown_030017D0
	ldr r1, [r1]
	ldrb r1, [r1, #1]
	cmp r0, r1
	bhi _0803CB1C
	ldr r4, _0803CB18  @ sub_803C934
	adds r0, r4, #0
	bl sub_803FA40
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0803CB24
	adds r0, r4, #0
	bl sub_803D450
	b _0803CB24
	.align 2, 0
_0803CB14: .4byte gUnknown_030017D0
_0803CB18: .4byte sub_803C934
_0803CB1C:
	ldr r0, _0803CB30  @ gUnknown_0203AA04
	adds r0, #0x79
	movs r1, #4
	strb r1, [r0]
_0803CB24:
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0803CB30: .4byte gUnknown_0203AA04

	THUMB_FUNC_START sub_803CB34
sub_803CB34: @ 0x0803CB34
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0803CB4C  @ sub_803C818
	bl sub_803FA40
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0803CB4C: .4byte sub_803C818

	THUMB_FUNC_START sub_803CB50
sub_803CB50: @ 0x0803CB50
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0803CB68  @ sub_803C818
	bl sub_803FA40
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0803CB68: .4byte sub_803C818

	THUMB_FUNC_START sub_803CB6C
sub_803CB6C: @ 0x0803CB6C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0803CB84  @ sub_803C818
	bl sub_803FA40
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0803CB84: .4byte sub_803C818

	THUMB_FUNC_START sub_803CB88
sub_803CB88: @ 0x0803CB88
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r4, _0803CBCC  @ gUnknown_030017D0
	ldr r2, [r4]
	ldrb r0, [r2, #1]
	ldrb r1, [r2, #3]
	ldrb r3, [r2, #2]
	movs r2, #1
	str r2, [sp]
	movs r2, #0
	bl sub_803BA08
	ldr r1, _0803CBD0  @ gUnknown_0203AA94
	movs r0, #0xa
	ldrsb r0, [r1, r0]
	cmp r0, #1
	bne _0803CBC4
	ldr r2, [r4]
	ldrb r0, [r1, #2]
	ldrb r3, [r2, #1]
	cmp r0, r3
	bne _0803CBC4
	ldrb r0, [r1, #3]
	ldrb r2, [r2, #3]
	cmp r0, r2
	bne _0803CBC4
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
_0803CBC4:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0803CBCC: .4byte gUnknown_030017D0
_0803CBD0: .4byte gUnknown_0203AA94

	THUMB_FUNC_START sub_803CBD4
sub_803CBD4: @ 0x0803CBD4
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r7, r0, #0
	ldr r6, _0803CC44  @ gUnknown_030017D0
	ldr r0, [r6]
	ldr r0, [r0, #4]
	add r5, sp, #4
	adds r1, r5, #0
	bl sub_803A788
	lsls r0, r0, #0x18
	asrs r4, r0, #0x18
	cmp r4, #1
	bne _0803CC78
	add r0, sp, #4
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r2, #2
	ldrsh r1, [r5, r2]
	ldr r2, [r6]
	ldrb r3, [r2, #2]
	str r4, [sp]
	movs r2, #0
	bl sub_803BA08
	add r0, sp, #4
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r2, #2
	ldrsh r1, [r5, r2]
	ldr r5, _0803CC48  @ gUnknown_0203AA94
	ldrb r2, [r5, #2]
	ldrb r3, [r5, #3]
	str r4, [sp]
	bl sub_803BFD0
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _0803CC7E
	ldr r0, [r6]
	ldr r0, [r0, #4]
	bl GetUnitByCharId
	adds r1, r0, #0
	ldr r4, [r1, #0xc]
	movs r0, #0x20
	ands r4, r0
	cmp r4, #0
	beq _0803CC50
	ldr r0, _0803CC4C  @ gUnknown_0203AA04
	adds r0, #0x86
	movs r1, #3
	strb r1, [r0]
	b _0803CC7E
	.align 2, 0
_0803CC44: .4byte gUnknown_030017D0
_0803CC48: .4byte gUnknown_0203AA94
_0803CC4C: .4byte gUnknown_0203AA04
_0803CC50:
	ldrb r0, [r1, #0xb]
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl sub_8039C64
	ldr r0, _0803CC70  @ gUnknown_0203AA04
	adds r0, #0x86
	movs r1, #2
	strb r1, [r0]
	strb r4, [r5, #0xa]
	ldr r0, _0803CC74  @ gUnknown_030017C8
	strb r4, [r0]
	b _0803CC7E
	.align 2, 0
_0803CC70: .4byte gUnknown_0203AA04
_0803CC74: .4byte gUnknown_030017C8
_0803CC78:
	ldr r1, _0803CC8C  @ gUnknown_030017C8
	movs r0, #0
	strb r0, [r1]
_0803CC7E:
	ldrb r0, [r7]
	adds r0, #1
	strb r0, [r7]
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803CC8C: .4byte gUnknown_030017C8

	THUMB_FUNC_START sub_803CC90
sub_803CC90: @ 0x0803CC90
	ldrb r1, [r0]
	adds r1, #1
	strb r1, [r0]
	bx lr

	THUMB_FUNC_START sub_803CC98
sub_803CC98: @ 0x0803CC98
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r6, r0, #0
	ldr r7, _0803CCD8  @ gUnknown_030017D0
	ldr r0, [r7]
	ldr r0, [r0, #4]
	add r5, sp, #4
	adds r1, r5, #0
	bl sub_803A878
	lsls r0, r0, #0x18
	asrs r4, r0, #0x18
	cmp r4, #1
	bne _0803CCCA
	add r0, sp, #4
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r2, #2
	ldrsh r1, [r5, r2]
	ldr r2, [r7]
	ldrb r3, [r2, #2]
	str r4, [sp]
	movs r2, #0
	bl sub_803BA08
_0803CCCA:
	ldrb r0, [r6]
	adds r0, #1
	strb r0, [r6]
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803CCD8: .4byte gUnknown_030017D0

	THUMB_FUNC_START sub_803CCDC
sub_803CCDC: @ 0x0803CCDC
	push {r4, r5, lr}
	sub sp, #0x14
	adds r5, r0, #0
	bl sub_8040844
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _0803CD2C
	ldr r3, _0803CD20  @ gUnknown_030017D0
	ldr r0, [r3]
	ldrb r0, [r0, #3]
	cmp r0, #0
	beq _0803CDC8
	ldr r2, _0803CD24  @ gUnknown_03004E50
	ldr r1, [r2]
	adds r1, #0x46
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldr r0, [r2]
	adds r0, #0x46
	ldr r1, [r3]
	ldrb r0, [r0]
	ldrb r1, [r1, #3]
	cmp r0, r1
	bne _0803CDC8
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
	ldr r1, _0803CD28  @ gUnknown_030017C8
	movs r0, #0
	b _0803CDC6
	.align 2, 0
_0803CD20: .4byte gUnknown_030017D0
_0803CD24: .4byte gUnknown_03004E50
_0803CD28: .4byte gUnknown_030017C8
_0803CD2C:
	add r4, sp, #0x10
	adds r0, r4, #0
	add r1, sp, #0xc
	bl sub_803B8FC
	lsls r0, r0, #0x18
	asrs r2, r0, #0x18
	cmp r2, #1
	bne _0803CDBC
	movs r1, #0
	ldrsh r0, [r4, r1]
	movs r3, #2
	ldrsh r1, [r4, r3]
	str r2, [sp]
	movs r2, #0
	movs r3, #0xff
	bl sub_803BA08
	ldr r4, _0803CDAC  @ gUnknown_0203AA94
	ldrb r0, [r4, #2]
	ldrb r1, [r4, #3]
	bl sub_803C014
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _0803CDC8
	ldrb r0, [r4, #2]
	ldrb r1, [r4, #3]
	add r2, sp, #0xc
	ldrb r2, [r2]
	str r2, [sp]
	movs r4, #0
	str r4, [sp, #4]
	str r4, [sp, #8]
	movs r2, #4
	movs r3, #0
	bl sub_8039C20
	ldr r3, _0803CDB0  @ gUnknown_030017D0
	ldr r0, [r3]
	ldrb r0, [r0, #3]
	cmp r0, #0
	beq _0803CDC8
	ldr r2, _0803CDB4  @ gUnknown_03004E50
	ldr r1, [r2]
	adds r1, #0x46
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldr r0, [r2]
	adds r0, #0x46
	ldr r1, [r3]
	ldrb r0, [r0]
	ldrb r1, [r1, #3]
	cmp r0, r1
	bne _0803CDC8
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
	ldr r0, _0803CDB8  @ gUnknown_030017C8
	strb r4, [r0]
	b _0803CDC8
	.align 2, 0
_0803CDAC: .4byte gUnknown_0203AA94
_0803CDB0: .4byte gUnknown_030017D0
_0803CDB4: .4byte gUnknown_03004E50
_0803CDB8: .4byte gUnknown_030017C8
_0803CDBC:
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
	ldr r1, _0803CDD0  @ gUnknown_030017C8
	movs r0, #0
_0803CDC6:
	strb r0, [r1]
_0803CDC8:
	add sp, #0x14
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0803CDD0: .4byte gUnknown_030017C8

	THUMB_FUNC_START sub_803CDD4
sub_803CDD4: @ 0x0803CDD4
	push {r4, r5, lr}
	sub sp, #0x10
	adds r5, r0, #0
	ldr r0, _0803CE14  @ gUnknown_03004E50
	ldr r0, [r0]
	add r4, sp, #0xc
	adds r1, r4, #0
	bl sub_803B808
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _0803CE06
	add r0, sp, #0xc
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r2, #2
	ldrsh r1, [r4, r2]
	movs r2, #0
	str r2, [sp]
	str r2, [sp, #4]
	str r2, [sp, #8]
	movs r3, #0
	bl sub_8039C20
_0803CE06:
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
	add sp, #0x10
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0803CE14: .4byte gUnknown_03004E50

	THUMB_FUNC_START sub_803CE18
sub_803CE18: @ 0x0803CE18
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r7, r0, #0
	ldr r6, _0803CE54  @ gUnknown_030017D0
	ldr r0, [r6]
	ldr r0, [r0, #8]
	cmp r0, #0
	bne _0803CE5C
	ldr r0, _0803CE58  @ sub_803C818
	add r5, sp, #4
	adds r1, r5, #0
	bl sub_803A924
	lsls r0, r0, #0x18
	asrs r4, r0, #0x18
	cmp r4, #1
	bne _0803CE84
	add r0, sp, #4
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r2, #2
	ldrsh r1, [r5, r2]
	ldr r2, [r6]
	ldrb r3, [r2, #2]
	str r4, [sp]
	movs r2, #0
	bl sub_803BA08
	b _0803CE84
	.align 2, 0
_0803CE54: .4byte gUnknown_030017D0
_0803CE58: .4byte sub_803C818
_0803CE5C:
	ldr r0, _0803CE94  @ sub_803C864
	add r5, sp, #4
	adds r1, r5, #0
	bl sub_803A924
	lsls r0, r0, #0x18
	asrs r4, r0, #0x18
	cmp r4, #1
	bne _0803CE84
	add r0, sp, #4
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r2, #2
	ldrsh r1, [r5, r2]
	ldr r2, [r6]
	ldrb r3, [r2, #2]
	str r4, [sp]
	movs r2, #0
	bl sub_803BA08
_0803CE84:
	ldrb r0, [r7]
	adds r0, #1
	strb r0, [r7]
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803CE94: .4byte sub_803C864

	THUMB_FUNC_START sub_803CE98
sub_803CE98: @ 0x0803CE98
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r7, r0, #0
	ldr r6, _0803CED4  @ gUnknown_030017D0
	ldr r0, [r6]
	ldr r0, [r0, #8]
	cmp r0, #0
	bne _0803CEDC
	ldr r0, _0803CED8  @ sub_803C818
	add r5, sp, #4
	adds r1, r5, #0
	bl sub_803AA40
	lsls r0, r0, #0x18
	asrs r4, r0, #0x18
	cmp r4, #1
	bne _0803CF04
	add r0, sp, #4
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r2, #2
	ldrsh r1, [r5, r2]
	ldr r2, [r6]
	ldrb r3, [r2, #2]
	str r4, [sp]
	movs r2, #0
	bl sub_803BBF4
	b _0803CF04
	.align 2, 0
_0803CED4: .4byte gUnknown_030017D0
_0803CED8: .4byte sub_803C818
_0803CEDC:
	ldr r0, _0803CF14  @ sub_803C864
	add r5, sp, #4
	adds r1, r5, #0
	bl sub_803AA40
	lsls r0, r0, #0x18
	asrs r4, r0, #0x18
	cmp r4, #1
	bne _0803CF04
	add r0, sp, #4
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r2, #2
	ldrsh r1, [r5, r2]
	ldr r2, [r6]
	ldrb r3, [r2, #2]
	str r4, [sp]
	movs r2, #0
	bl sub_803BBF4
_0803CF04:
	ldrb r0, [r7]
	adds r0, #1
	strb r0, [r7]
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803CF14: .4byte sub_803C864

	THUMB_FUNC_START sub_803CF18
sub_803CF18: @ 0x0803CF18
	ldrb r1, [r0]
	adds r1, #1
	strb r1, [r0]
	bx lr

	THUMB_FUNC_START sub_803CF20
sub_803CF20: @ 0x0803CF20
	ldrb r1, [r0]
	adds r1, #1
	strb r1, [r0]
	bx lr

	THUMB_FUNC_START sub_803CF28
sub_803CF28: @ 0x0803CF28
	push {r4, lr}
	adds r4, r0, #0
	bl sub_803AB5C
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_START sub_803CF3C
sub_803CF3C: @ 0x0803CF3C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0803CF5C  @ gUnknown_03004E50
	ldr r2, [r0]
	ldrb r1, [r2, #0xa]
	movs r0, #8
	orrs r0, r1
	strb r0, [r2, #0xa]
	bl sub_803E7D0
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0803CF5C: .4byte gUnknown_03004E50

	THUMB_FUNC_START sub_803CF60
sub_803CF60: @ 0x0803CF60
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r5, r1, #0
	bl sub_803E23C
	adds r4, r0, #0
	adds r0, r6, #0
	adds r1, r5, #0
	bl sub_803E27C
	adds r4, r4, r0
	ldr r0, _0803CFA8  @ gUnknown_0202E4E0
	ldr r0, [r0]
	lsls r5, r5, #2
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r6
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r4, r4, r0
	ldr r0, _0803CFAC  @ gUnknown_0202E4F0
	ldr r0, [r0]
	adds r5, r5, r0
	ldr r0, [r5]
	adds r0, r0, r6
	ldrb r0, [r0]
	lsrs r0, r0, #3
	subs r4, r4, r0
	ldr r0, _0803CFB0  @ 0x7FFFFFFF
	adds r4, r4, r0
	adds r0, r4, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0803CFA8: .4byte gUnknown_0202E4E0
_0803CFAC: .4byte gUnknown_0202E4F0
_0803CFB0: .4byte 0x7FFFFFFF

	THUMB_FUNC_START sub_803CFB4
sub_803CFB4: @ 0x0803CFB4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x20
	adds r5, r0, #0
	adds r6, r1, #0
	str r2, [sp]
	str r3, [sp, #4]
	movs r0, #1
	negs r0, r0
	str r0, [sp, #0x10]
	str r0, [sp, #0xc]
	movs r1, #0
	str r1, [sp, #0x14]
	ldr r4, _0803D0F8  @ gUnknown_03004E50
	ldr r0, [r4]
	bl FillMovementMapForUnit
	movs r2, #0
	str r2, [sp, #8]
	ldr r0, [r4]
	ldrh r0, [r0, #0x1e]
	mov r8, r0
	cmp r0, #0
	beq _0803D0DE
	lsls r5, r5, #0x10
	str r5, [sp, #0x18]
	lsls r6, r6, #0x10
	str r6, [sp, #0x1c]
_0803CFF2:
	ldr r0, _0803D0F8  @ gUnknown_03004E50
	ldr r0, [r0]
	mov r1, r8
	bl CanUnitUseAsWeapon
	lsls r0, r0, #0x18
	ldr r1, [sp, #8]
	adds r1, #1
	mov r9, r1
	cmp r0, #0
	beq _0803D0C4
	ldr r0, _0803D0FC  @ gUnknown_0202E4E4
	ldr r0, [r0]
	movs r1, #0
	bl ClearMapWith
	mov r0, r8
	bl GetItemMinRange
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	mov r0, r8
	bl GetItemMaxRange
	adds r3, r0, #0
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	ldr r2, [sp, #0x18]
	asrs r0, r2, #0x10
	ldr r2, [sp, #0x1c]
	asrs r1, r2, #0x10
	adds r2, r4, #0
	bl FillRangeMap
	ldr r0, _0803D100  @ gUnknown_0202E4D4
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r6, r0, #1
	cmp r6, #0
	blt _0803D0C4
_0803D044:
	ldr r0, _0803D100  @ gUnknown_0202E4D4
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r5, r0, #1
	subs r0, r6, #1
	mov sl, r0
	cmp r5, #0
	blt _0803D0BE
	lsls r7, r6, #2
_0803D056:
	ldr r0, _0803D104  @ gUnknown_0202E4E0
	ldr r0, [r0]
	adds r0, r7, r0
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _0803D0B8
	ldr r0, _0803D0FC  @ gUnknown_0202E4E4
	ldr r0, [r0]
	adds r0, r7, r0
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0803D0B8
	ldr r0, _0803D108  @ gUnknown_0202E4D8
	ldr r0, [r0]
	adds r0, r7, r0
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r1, [r0]
	cmp r1, #0
	beq _0803D092
	ldr r0, _0803D10C  @ gUnknown_0202BE44
	ldrb r0, [r0]
	cmp r1, r0
	bne _0803D0B8
_0803D092:
	mov r0, r8
	bl GetItemMight
	adds r4, r0, #0
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_803CF60
	adds r4, r4, r0
	ldr r1, [sp, #0x14]
	cmp r4, r1
	bls _0803D0B8
	str r5, [sp, #0xc]
	str r6, [sp, #0x10]
	str r4, [sp, #0x14]
	mov r2, sp
	ldrb r0, [r2, #8]
	ldr r2, [sp, #4]
	strb r0, [r2]
_0803D0B8:
	subs r5, #1
	cmp r5, #0
	bge _0803D056
_0803D0BE:
	mov r6, sl
	cmp r6, #0
	bge _0803D044
_0803D0C4:
	mov r1, r9
	str r1, [sp, #8]
	cmp r1, #4
	bgt _0803D0DE
	ldr r0, _0803D0F8  @ gUnknown_03004E50
	ldr r0, [r0]
	lsls r1, r1, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r0, [r0]
	mov r8, r0
	cmp r0, #0
	bne _0803CFF2
_0803D0DE:
	ldr r2, [sp, #0x14]
	cmp r2, #0
	beq _0803D110
	mov r0, sp
	ldrh r1, [r0, #0xc]
	ldr r0, [sp]
	strh r1, [r0]
	mov r2, sp
	ldrh r2, [r2, #0x10]
	strh r2, [r0, #2]
	movs r0, #1
	b _0803D112
	.align 2, 0
_0803D0F8: .4byte gUnknown_03004E50
_0803D0FC: .4byte gUnknown_0202E4E4
_0803D100: .4byte gUnknown_0202E4D4
_0803D104: .4byte gUnknown_0202E4E0
_0803D108: .4byte gUnknown_0202E4D8
_0803D10C: .4byte gUnknown_0202BE44
_0803D110:
	movs r0, #0
_0803D112:
	add sp, #0x20
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_START sub_803D124
sub_803D124: @ 0x0803D124
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	str r0, [sp]
	mov r8, r1
	adds r7, r2, #0
	movs r0, #0xff
	mov r9, r0
	ldr r0, _0803D200  @ gUnknown_0202E4D4
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r5, r0, #1
	cmp r5, #0
	blt _0803D1F6
_0803D146:
	ldr r0, _0803D200  @ gUnknown_0202E4D4
	movs r1, #0
	ldrsh r0, [r0, r1]
	subs r4, r0, #1
	subs r0, r5, #1
	mov sl, r0
	cmp r4, #0
	blt _0803D1F0
	lsls r6, r5, #2
_0803D158:
	ldr r0, _0803D204  @ gUnknown_0202E4E4
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _0803D1EA
	ldr r0, _0803D208  @ gUnknown_0202E4DC
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r1, [r0]
	ldr r0, [sp]
	bl sub_803AD18
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803D1EA
	movs r0, #1
	mov r1, r8
	ands r0, r1
	cmp r0, #0
	beq _0803D1B0
	ldr r0, _0803D20C  @ gUnknown_0202E4D8
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r1, r0, r4
	ldrb r0, [r1]
	cmp r0, #0
	beq _0803D1B0
	ldr r0, _0803D210  @ gUnknown_03004E50
	ldr r0, [r0]
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldrb r1, [r1]
	bl AreUnitsAllied
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803D1EA
_0803D1B0:
	movs r0, #2
	mov r1, r8
	ands r0, r1
	cmp r0, #0
	beq _0803D1CA
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	lsls r1, r5, #0x10
	asrs r1, r1, #0x10
	bl sub_803B41C
	cmp r0, #0
	bne _0803D1EA
_0803D1CA:
	ldr r0, _0803D204  @ gUnknown_0202E4E4
	ldr r0, [r0]
	adds r1, r6, r0
	ldr r0, [r1]
	adds r0, r0, r4
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r9, r0
	ble _0803D1EA
	strh r4, [r7]
	strh r5, [r7, #2]
	ldr r0, [r1]
	adds r0, r0, r4
	ldrb r0, [r0]
	mov r9, r0
_0803D1EA:
	subs r4, #1
	cmp r4, #0
	bge _0803D158
_0803D1F0:
	mov r5, sl
	cmp r5, #0
	bge _0803D146
_0803D1F6:
	mov r0, r9
	cmp r0, #0xff
	bne _0803D214
	movs r0, #0
	b _0803D216
	.align 2, 0
_0803D200: .4byte gUnknown_0202E4D4
_0803D204: .4byte gUnknown_0202E4E4
_0803D208: .4byte gUnknown_0202E4DC
_0803D20C: .4byte gUnknown_0202E4D8
_0803D210: .4byte gUnknown_03004E50
_0803D214:
	movs r0, #1
_0803D216:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_START sub_803D228
sub_803D228: @ 0x0803D228
	push {r4, r5, r6, r7, lr}
	sub sp, #0x18
	adds r7, r0, #0
	ldr r0, _0803D298  @ gUnknown_03004E50
	ldr r0, [r0]
	bl sub_8041020
	ldr r0, _0803D29C  @ gUnknown_085A814C
	add r4, sp, #0x10
	movs r1, #0
	adds r2, r4, #0
	bl sub_803D124
	lsls r0, r0, #0x18
	asrs r6, r0, #0x18
	cmp r6, #1
	bne _0803D2B4
	movs r1, #0
	ldrsh r0, [r4, r1]
	movs r2, #2
	ldrsh r1, [r4, r2]
	add r5, sp, #0x14
	adds r2, r5, #0
	add r3, sp, #0xc
	bl sub_803CFB4
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _0803D2A0
	movs r1, #0
	ldrsh r0, [r4, r1]
	movs r2, #2
	ldrsh r1, [r4, r2]
	bl GetTrapAt
	cmp r0, #0
	beq _0803D2C8
	movs r1, #0
	ldrsh r0, [r5, r1]
	movs r2, #2
	ldrsh r1, [r5, r2]
	add r2, sp, #0xc
	ldrb r2, [r2]
	str r2, [sp]
	ldrb r2, [r4]
	str r2, [sp, #4]
	ldrh r2, [r4, #2]
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	str r2, [sp, #8]
	movs r2, #1
	movs r3, #0
	bl sub_8039C20
	b _0803D2C2
	.align 2, 0
_0803D298: .4byte gUnknown_03004E50
_0803D29C: .4byte gUnknown_085A814C
_0803D2A0:
	movs r1, #0
	ldrsh r0, [r4, r1]
	movs r2, #2
	ldrsh r1, [r4, r2]
	str r6, [sp]
	movs r2, #0
	movs r3, #0xff
	bl sub_803BA08
	b _0803D2C2
_0803D2B4:
	ldr r0, _0803D2D0  @ gUnknown_0203AA04
	adds r0, #0x86
	movs r2, #0
	movs r1, #4
	strb r1, [r0]
	ldr r0, _0803D2D4  @ gUnknown_030017C8
	strb r2, [r0]
_0803D2C2:
	ldrb r0, [r7]
	adds r0, #1
	strb r0, [r7]
_0803D2C8:
	add sp, #0x18
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803D2D0: .4byte gUnknown_0203AA04
_0803D2D4: .4byte gUnknown_030017C8

	THUMB_FUNC_START sub_803D2D8
sub_803D2D8: @ 0x0803D2D8
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r7, r0, #0
	ldr r0, _0803D328  @ gUnknown_03004E50
	ldr r0, [r0]
	movs r4, #0x10
	ldrsb r4, [r0, r4]
	movs r5, #0x11
	ldrsb r5, [r0, r5]
	bl GetMovCostTablePtr
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	bl FillMovementRangeMapSomehow
	ldr r6, _0803D32C  @ gUnknown_030017D0
	ldr r0, [r6]
	adds r0, #3
	add r5, sp, #4
	movs r1, #0
	adds r2, r5, #0
	bl sub_803AD38
	lsls r0, r0, #0x18
	asrs r4, r0, #0x18
	cmp r4, #1
	bne _0803D330
	add r0, sp, #4
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r2, #2
	ldrsh r1, [r5, r2]
	ldr r2, [r6]
	ldrb r3, [r2, #2]
	str r4, [sp]
	movs r2, #0
	bl sub_803BA08
	b _0803D33E
	.align 2, 0
_0803D328: .4byte gUnknown_03004E50
_0803D32C: .4byte gUnknown_030017D0
_0803D330:
	ldr r0, _0803D34C  @ gUnknown_0203AA04
	adds r0, #0x86
	movs r2, #0
	movs r1, #4
	strb r1, [r0]
	ldr r0, _0803D350  @ gUnknown_030017C8
	strb r2, [r0]
_0803D33E:
	ldrb r0, [r7]
	adds r0, #1
	strb r0, [r7]
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803D34C: .4byte gUnknown_0203AA04
_0803D350: .4byte gUnknown_030017C8

	THUMB_FUNC_START sub_803D354
sub_803D354: @ 0x0803D354
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r7, r0, #0
	ldr r0, _0803D3A4  @ gUnknown_03004E50
	ldr r0, [r0]
	movs r4, #0x10
	ldrsb r4, [r0, r4]
	movs r5, #0x11
	ldrsb r5, [r0, r5]
	bl GetMovCostTablePtr
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	bl FillMovementRangeMapSomehow
	ldr r6, _0803D3A8  @ gUnknown_030017D0
	ldr r0, [r6]
	ldr r0, [r0, #8]
	add r5, sp, #4
	movs r1, #0
	adds r2, r5, #0
	bl sub_803AD38
	lsls r0, r0, #0x18
	asrs r4, r0, #0x18
	cmp r4, #1
	bne _0803D3AC
	add r0, sp, #4
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r2, #2
	ldrsh r1, [r5, r2]
	ldr r2, [r6]
	ldrb r3, [r2, #2]
	str r4, [sp]
	movs r2, #0
	bl sub_803BA08
	b _0803D3BA
	.align 2, 0
_0803D3A4: .4byte gUnknown_03004E50
_0803D3A8: .4byte gUnknown_030017D0
_0803D3AC:
	ldr r0, _0803D3C8  @ gUnknown_0203AA04
	adds r0, #0x86
	movs r2, #0
	movs r1, #4
	strb r1, [r0]
	ldr r0, _0803D3CC  @ gUnknown_030017C8
	strb r2, [r0]
_0803D3BA:
	ldrb r0, [r7]
	adds r0, #1
	strb r0, [r7]
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803D3C8: .4byte gUnknown_0203AA04
_0803D3CC: .4byte gUnknown_030017C8

	THUMB_FUNC_START sub_803D3D0
sub_803D3D0: @ 0x0803D3D0
	ldrb r1, [r0]
	adds r1, #1
	strb r1, [r0]
	ldr r1, _0803D3E0  @ gUnknown_030017C8
	movs r0, #0
	strb r0, [r1]
	bx lr
	.align 2, 0
_0803D3E0: .4byte gUnknown_030017C8

	THUMB_FUNC_START sub_803D3E4
sub_803D3E4: @ 0x0803D3E4
	push {lr}
	ldr r0, _0803D3FC  @ sub_803C818
	bl sub_803FA40
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0803D3F8
	ldr r0, _0803D400  @ sub_803C848
	bl sub_803D450
_0803D3F8:
	pop {r0}
	bx r0
	.align 2, 0
_0803D3FC: .4byte sub_803C818
_0803D400: .4byte sub_803C848

	THUMB_FUNC_START sub_803D404
sub_803D404: @ 0x0803D404
	push {r4, lr}
	sub sp, #8
	ldr r0, _0803D438  @ sub_803C848
	add r4, sp, #4
	adds r1, r4, #0
	bl sub_803A924
	lsls r0, r0, #0x18
	asrs r2, r0, #0x18
	cmp r2, #1
	bne _0803D42E
	add r0, sp, #4
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r3, #2
	ldrsh r1, [r4, r3]
	str r2, [sp]
	movs r2, #0
	movs r3, #0xff
	bl sub_803BA08
_0803D42E:
	add sp, #8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0803D438: .4byte sub_803C848

	THUMB_FUNC_START sub_803D43C
sub_803D43C: @ 0x0803D43C
	movs r0, #1
	bx lr

	THUMB_FUNC_START sub_803D440
sub_803D440: @ 0x0803D440
	push {lr}
	ldrb r0, [r0]
	bl sub_803BF4C
	movs r0, #1
	pop {r1}
	bx r1

	THUMB_FUNC_START sub_803D450
sub_803D450: @ 0x0803D450
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x2c
	str r0, [sp, #0x24]
	add r0, sp, #0x18
	movs r5, #0
	strb r5, [r0, #2]
	str r5, [r0, #8]
	ldr r6, _0803D4BC  @ gUnknown_03004E50
	ldr r3, [r6]
	ldr r1, [r3, #0xc]
	movs r2, #0x80
	lsls r2, r2, #4
	ands r1, r2
	mov sl, r0
	cmp r1, #0
	beq _0803D4C4
	ldr r4, _0803D4C0  @ gUnknown_0202E4E0
	ldr r0, [r4]
	movs r1, #1
	negs r1, r1
	bl ClearMapWith
	ldr r2, [r6]
	movs r0, #0x11
	ldrsb r0, [r2, r0]
	ldr r1, [r4]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	ldr r0, [r0]
	adds r0, r0, r1
	strb r5, [r0]
	ldr r1, [r6]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	ldrb r1, [r1, #0x11]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl sub_803795C
	adds r1, r0, #0
	cmp r1, #0
	beq _0803D4B2
	b _0803D628
_0803D4B2:
	ldr r0, [r6]
	bl TryRemoveUnitFromBallista
	b _0803D55A
	.align 2, 0
_0803D4BC: .4byte gUnknown_03004E50
_0803D4C0: .4byte gUnknown_0202E4E0
_0803D4C4:
	ldr r0, [r3]
	ldr r1, [r3, #4]
	ldr r0, [r0, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	beq _0803D4FA
	adds r0, r3, #0
	bl GetUnitItemCount
	cmp r0, #4
	bgt _0803D4FA
	ldr r0, [r6]
	bl FillMovementMapForUnit
	bl sub_801A8E4
	bl sub_803DB60
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _0803D4FA
	movs r0, #0
	b _0803D69C
_0803D4FA:
	ldr r0, _0803D530  @ gUnknown_0203AA04
	adds r0, #0x7b
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0803D53C
	ldr r4, _0803D534  @ gUnknown_0202E4E0
	ldr r0, [r4]
	movs r1, #1
	negs r1, r1
	bl ClearMapWith
	ldr r0, _0803D538  @ gUnknown_03004E50
	ldr r2, [r0]
	movs r0, #0x11
	ldrsb r0, [r2, r0]
	ldr r1, [r4]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	ldr r0, [r0]
	adds r0, r0, r1
	movs r1, #0
	strb r1, [r0]
	b _0803D544
	.align 2, 0
_0803D530: .4byte gUnknown_0203AA04
_0803D534: .4byte gUnknown_0202E4E0
_0803D538: .4byte gUnknown_03004E50
_0803D53C:
	ldr r0, _0803D6AC  @ gUnknown_03004E50
	ldr r0, [r0]
	bl FillMovementMapForUnit
_0803D544:
	ldr r0, _0803D6AC  @ gUnknown_03004E50
	ldr r0, [r0]
	bl UnitHasMagicRank
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803D55A
	movs r0, #1
	negs r0, r0
	bl sub_801B950
_0803D55A:
	ldr r0, _0803D6B0  @ gUnknown_0202E4E4
	ldr r0, [r0]
	bl SetSubjectMap
	movs r1, #0
	mov r8, r1
	ldr r2, _0803D6AC  @ gUnknown_03004E50
	ldr r1, [r2]
	ldrh r5, [r1, #0x1e]
	cmp r5, #0
	beq _0803D628
	mov r9, r2
_0803D572:
	mov r2, r8
	adds r2, #1
	str r2, [sp, #0x28]
	cmp r5, #0xa6
	beq _0803D60E
	mov r3, r9
	ldr r0, [r3]
	adds r1, r5, #0
	bl CanUnitUseAsWeapon
	adds r1, r0, #0
	lsls r1, r1, #0x18
	cmp r1, #0
	beq _0803D60E
	add r0, sp, #0xc
	mov r4, r8
	strh r4, [r0, #4]
	movs r6, #1
_0803D596:
	adds r0, r6, #0
	bl GetUnitStruct
	adds r4, r0, #0
	cmp r4, #0
	beq _0803D608
	ldr r1, [r4]
	cmp r1, #0
	beq _0803D608
	ldr r1, [r4, #0xc]
	ldr r2, _0803D6B4  @ 0x00010025
	ands r1, r2
	cmp r1, #0
	bne _0803D608
	ldr r7, [sp, #0x24]
	bl _call_via_r7
	adds r1, r0, #0
	lsls r1, r1, #0x18
	cmp r1, #0
	beq _0803D608
	mov r1, r9
	ldr r0, [r1]
	adds r1, r4, #0
	adds r2, r5, #0
	bl sub_803AC3C
	adds r1, r0, #0
	lsls r1, r1, #0x18
	cmp r1, #0
	beq _0803D608
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_803D880
	add r1, sp, #0xc
	ldrb r0, [r4, #0xb]
	strb r0, [r1, #2]
	adds r0, r1, #0
	bl sub_803DCC4
	adds r1, r0, #0
	lsls r1, r1, #0x18
	cmp r1, #0
	beq _0803D608
	ldr r2, [sp, #0x14]
	mov r3, sl
	ldr r1, [r3, #8]
	cmp r2, r1
	bcc _0803D608
	mov r2, sl
	add r1, sp, #0xc
	ldm r1!, {r3, r4, r7}
	stm r2!, {r3, r4, r7}
	mov r7, r8
	mov r4, sl
	strh r7, [r4, #4]
_0803D608:
	adds r6, #1
	cmp r6, #0xbf
	ble _0803D596
_0803D60E:
	ldr r1, [sp, #0x28]
	mov r8, r1
	cmp r1, #4
	bgt _0803D628
	mov r2, r9
	ldr r1, [r2]
	ldr r3, [sp, #0x28]
	lsls r2, r3, #1
	adds r1, #0x1e
	adds r1, r1, r2
	ldrh r5, [r1]
	cmp r5, #0
	bne _0803D572
_0803D628:
	ldr r1, _0803D6AC  @ gUnknown_03004E50
	ldr r1, [r1]
	ldr r2, [r1]
	ldr r3, [r1, #4]
	ldr r1, [r2, #0x28]
	ldr r2, [r3, #0x28]
	orrs r1, r2
	movs r2, #0x80
	ands r1, r2
	cmp r1, #0
	beq _0803D662
	ldr r0, [sp, #0x24]
	add r1, sp, #0xc
	bl sub_803D998
	adds r1, r0, #0
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	cmp r1, #1
	bne _0803D662
	ldr r2, [sp, #0x14]
	mov r4, sl
	ldr r1, [r4, #8]
	cmp r2, r1
	bcc _0803D662
	mov r2, sl
	add r1, sp, #0xc
	ldm r1!, {r3, r5, r7}
	stm r2!, {r3, r5, r7}
_0803D662:
	mov r2, sl
	ldr r1, [r2, #8]
	cmp r1, #0
	bne _0803D670
	ldrb r1, [r2, #2]
	cmp r1, #0
	beq _0803D69C
_0803D670:
	mov r4, sl
	ldrb r0, [r4]
	ldrb r1, [r4, #1]
	ldrb r3, [r4, #2]
	ldrb r2, [r4, #4]
	str r2, [sp]
	movs r2, #0
	str r2, [sp, #4]
	str r2, [sp, #8]
	movs r2, #1
	bl sub_8039C20
	movs r2, #4
	ldrsb r2, [r4, r2]
	movs r1, #1
	negs r1, r1
	cmp r2, r1
	beq _0803D69C
	ldr r0, _0803D6AC  @ gUnknown_03004E50
	ldr r0, [r0]
	bl TryRemoveUnitFromBallista
_0803D69C:
	add sp, #0x2c
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0803D6AC: .4byte gUnknown_03004E50
_0803D6B0: .4byte gUnknown_0202E4E4
_0803D6B4: .4byte 0x00010025

	THUMB_FUNC_START sub_803D6B8
sub_803D6B8: @ 0x0803D6B8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x2c
	str r0, [sp, #0x24]
	add r2, sp, #0x18
	movs r5, #0
	strb r5, [r2, #2]
	str r5, [r2, #8]
	ldr r6, _0803D870  @ gUnknown_03004E50
	ldr r0, [r6]
	ldr r0, [r0, #0xc]
	movs r1, #0x80
	lsls r1, r1, #4
	ands r0, r1
	mov r8, r2
	cmp r0, #0
	beq _0803D71E
	ldr r4, _0803D874  @ gUnknown_0202E4E0
	ldr r0, [r4]
	movs r1, #1
	negs r1, r1
	bl ClearMapWith
	ldr r2, [r6]
	movs r0, #0x11
	ldrsb r0, [r2, r0]
	ldr r1, [r4]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	ldr r0, [r0]
	adds r0, r0, r1
	strb r5, [r0]
	ldr r1, [r6]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	ldrb r1, [r1, #0x11]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl sub_803795C
	adds r1, r0, #0
	cmp r1, #0
	bne _0803D7EA
	ldr r0, [r6]
	bl TryRemoveUnitFromBallista
_0803D71E:
	ldr r0, _0803D878  @ gUnknown_0202E4E4
	ldr r0, [r0]
	bl SetSubjectMap
	movs r1, #0
	mov r9, r1
	ldr r1, [r6]
	ldrh r5, [r1, #0x1e]
	cmp r5, #0
	beq _0803D7EA
	mov sl, r6
_0803D734:
	mov r2, r9
	adds r2, #1
	str r2, [sp, #0x28]
	cmp r5, #0xa6
	beq _0803D7D0
	mov r3, sl
	ldr r0, [r3]
	adds r1, r5, #0
	bl CanUnitUseAsWeapon
	adds r1, r0, #0
	lsls r1, r1, #0x18
	cmp r1, #0
	beq _0803D7D0
	add r0, sp, #0xc
	mov r4, r9
	strh r4, [r0, #4]
	movs r6, #1
_0803D758:
	adds r0, r6, #0
	bl GetUnitStruct
	adds r4, r0, #0
	cmp r4, #0
	beq _0803D7CA
	ldr r1, [r4]
	cmp r1, #0
	beq _0803D7CA
	ldr r1, [r4, #0xc]
	ldr r2, _0803D87C  @ 0x00010025
	ands r1, r2
	cmp r1, #0
	bne _0803D7CA
	ldr r7, [sp, #0x24]
	bl _call_via_r7
	adds r1, r0, #0
	lsls r1, r1, #0x18
	cmp r1, #0
	beq _0803D7CA
	mov r1, sl
	ldr r0, [r1]
	adds r1, r4, #0
	adds r2, r5, #0
	bl sub_803AC3C
	adds r1, r0, #0
	lsls r1, r1, #0x18
	cmp r1, #0
	beq _0803D7CA
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_803D880
	add r1, sp, #0xc
	ldrb r0, [r4, #0xb]
	strb r0, [r1, #2]
	adds r0, r1, #0
	bl sub_803DCC4
	adds r1, r0, #0
	lsls r1, r1, #0x18
	cmp r1, #0
	beq _0803D7CA
	ldr r2, [sp, #0x14]
	mov r3, r8
	ldr r1, [r3, #8]
	cmp r2, r1
	bcc _0803D7CA
	mov r2, r8
	add r1, sp, #0xc
	ldm r1!, {r3, r4, r7}
	stm r2!, {r3, r4, r7}
	mov r7, r9
	mov r4, r8
	strh r7, [r4, #4]
_0803D7CA:
	adds r6, #1
	cmp r6, #0xbf
	ble _0803D758
_0803D7D0:
	ldr r1, [sp, #0x28]
	mov r9, r1
	cmp r1, #4
	bgt _0803D7EA
	mov r2, sl
	ldr r1, [r2]
	ldr r3, [sp, #0x28]
	lsls r2, r3, #1
	adds r1, #0x1e
	adds r1, r1, r2
	ldrh r5, [r1]
	cmp r5, #0
	bne _0803D734
_0803D7EA:
	ldr r1, _0803D870  @ gUnknown_03004E50
	ldr r1, [r1]
	ldr r2, [r1]
	ldr r3, [r1, #4]
	ldr r1, [r2, #0x28]
	ldr r2, [r3, #0x28]
	orrs r1, r2
	movs r2, #0x80
	ands r1, r2
	cmp r1, #0
	beq _0803D824
	ldr r0, [sp, #0x24]
	add r1, sp, #0xc
	bl sub_803D998
	adds r1, r0, #0
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	cmp r1, #1
	bne _0803D824
	ldr r2, [sp, #0x14]
	mov r4, r8
	ldr r1, [r4, #8]
	cmp r2, r1
	bcc _0803D824
	mov r2, r8
	add r1, sp, #0xc
	ldm r1!, {r3, r5, r7}
	stm r2!, {r3, r5, r7}
_0803D824:
	mov r2, r8
	ldr r1, [r2, #8]
	cmp r1, #0
	bne _0803D832
	ldrb r1, [r2, #2]
	cmp r1, #0
	beq _0803D85E
_0803D832:
	mov r4, r8
	ldrb r0, [r4]
	ldrb r1, [r4, #1]
	ldrb r3, [r4, #2]
	ldrb r2, [r4, #4]
	str r2, [sp]
	movs r2, #0
	str r2, [sp, #4]
	str r2, [sp, #8]
	movs r2, #1
	bl sub_8039C20
	movs r2, #4
	ldrsb r2, [r4, r2]
	movs r1, #1
	negs r1, r1
	cmp r2, r1
	beq _0803D85E
	ldr r0, _0803D870  @ gUnknown_03004E50
	ldr r0, [r0]
	bl TryRemoveUnitFromBallista
_0803D85E:
	add sp, #0x2c
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0803D870: .4byte gUnknown_03004E50
_0803D874: .4byte gUnknown_0202E4E0
_0803D878: .4byte gUnknown_0202E4E4
_0803D87C: .4byte 0x00010025

	THUMB_FUNC_START sub_803D880
sub_803D880: @ 0x0803D880
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r4, r0, #0
	lsls r5, r1, #0x10
	lsrs r5, r5, #0x10
	ldr r0, _0803D8D0  @ gUnknown_0202E4E4
	ldr r0, [r0]
	movs r1, #0
	bl ClearMapWith
	movs r6, #0x10
	ldrsb r6, [r4, r6]
	ldrb r4, [r4, #0x11]
	lsls r4, r4, #0x18
	asrs r4, r4, #0x18
	mov r8, r4
	adds r0, r5, #0
	bl GetItemMinRange
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	adds r0, r5, #0
	bl GetItemMaxRange
	adds r3, r0, #0
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	adds r0, r6, #0
	mov r1, r8
	adds r2, r4, #0
	bl FillRangeMap
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0803D8D0: .4byte gUnknown_0202E4E4

	THUMB_FUNC_START sub_803D8D4
sub_803D8D4: @ 0x0803D8D4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	adds r5, r0, #0
	adds r4, r1, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	mov sl, r2
	bl GetMovCostTablePtr
	bl StoreMovCostTable
	ldr r0, _0803D98C  @ gUnknown_0202E4E0
	ldr r0, [r0]
	bl SetSubjectMap
	movs r0, #0x10
	ldrsb r0, [r5, r0]
	movs r1, #0x11
	ldrsb r1, [r5, r1]
	movs r3, #0xb
	ldrsb r3, [r5, r3]
	adds r2, r4, #0
	bl FillMovementMap
	ldr r0, _0803D990  @ gUnknown_0202E4E4
	ldr r0, [r0]
	movs r1, #0
	bl ClearMapWith
	ldr r0, _0803D994  @ gUnknown_0202E4D4
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r7, r0, #1
	cmp r7, #0
	blt _0803D97E
_0803D924:
	ldr r0, _0803D994  @ gUnknown_0202E4D4
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r6, r0, #1
	subs r0, r7, #1
	mov r9, r0
	cmp r6, #0
	blt _0803D978
	lsls r1, r7, #0x10
	mov r8, r1
_0803D938:
	ldr r0, _0803D98C  @ gUnknown_0202E4E0
	ldr r1, [r0]
	lsls r0, r7, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, r0, r6
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _0803D972
	lsls r5, r6, #0x10
	asrs r5, r5, #0x10
	mov r0, sl
	bl GetItemMinRange
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	mov r0, sl
	bl GetItemMaxRange
	adds r3, r0, #0
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	adds r0, r5, #0
	mov r2, r8
	asrs r1, r2, #0x10
	adds r2, r4, #0
	bl FillRangeMap
_0803D972:
	subs r6, #1
	cmp r6, #0
	bge _0803D938
_0803D978:
	mov r7, r9
	cmp r7, #0
	bge _0803D924
_0803D97E:
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803D98C: .4byte gUnknown_0202E4E0
_0803D990: .4byte gUnknown_0202E4E4
_0803D994: .4byte gUnknown_0202E4D4

	THUMB_FUNC_START sub_803D998
sub_803D998: @ 0x0803D998
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x18
	str r0, [sp, #0x10]
	mov r8, r1
	movs r0, #0
	mov sl, r0
	add r4, sp, #0xc
	ldr r1, _0803DA0C  @ gUnknown_080D867C
	adds r0, r4, #0
	movs r2, #3
	bl memcpy
	ldr r0, _0803DA10  @ gUnknown_0202E4D4
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r7, r0, #1
	cmp r7, #0
	blt _0803DA34
_0803D9C4:
	ldr r0, _0803DA10  @ gUnknown_0202E4D4
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r4, r0, #1
	subs r3, r7, #1
	mov r9, r3
	cmp r4, #0
	blt _0803DA2E
	ldr r2, _0803DA14  @ gUnknown_0202E4E0
	lsls r6, r7, #2
_0803D9D8:
	ldr r0, [r2]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _0803DA28
	adds r0, r4, #0
	adds r1, r7, #0
	str r2, [sp, #0x14]
	bl GetBallistaItemAt
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	ldr r2, [sp, #0x14]
	cmp r5, #0
	beq _0803DA18
	movs r0, #1
	add sl, r0
	ldr r0, [r2]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r4
	strb r5, [r0]
	b _0803DA28
	.align 2, 0
_0803DA0C: .4byte gUnknown_080D867C
_0803DA10: .4byte gUnknown_0202E4D4
_0803DA14: .4byte gUnknown_0202E4E0
_0803DA18:
	ldr r0, [r2]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r4
	movs r3, #1
	negs r3, r3
	adds r1, r3, #0
	strb r1, [r0]
_0803DA28:
	subs r4, #1
	cmp r4, #0
	bge _0803D9D8
_0803DA2E:
	mov r7, r9
	cmp r7, #0
	bge _0803D9C4
_0803DA34:
	mov r0, sl
	cmp r0, #0
	beq _0803DAF4
	movs r0, #0
	mov r1, r8
	strb r0, [r1, #2]
	str r0, [r1, #8]
	movs r1, #0
	mov r6, sp
_0803DA46:
	mov r0, sp
	adds r0, r0, r1
	adds r0, #0xc
	ldrb r5, [r0]
	ldr r0, _0803DAE8  @ 0x0000FFFF
	mov r2, r8
	strh r0, [r2, #4]
	movs r7, #1
	adds r1, #1
	mov r9, r1
_0803DA5A:
	adds r0, r7, #0
	bl GetUnitStruct
	adds r4, r0, #0
	cmp r4, #0
	beq _0803DAC8
	ldr r0, [r4]
	cmp r0, #0
	beq _0803DAC8
	ldr r0, [r4, #0xc]
	ldr r1, _0803DAEC  @ 0x00010025
	ands r0, r1
	cmp r0, #0
	bne _0803DAC8
	adds r0, r4, #0
	ldr r3, [sp, #0x10]
	bl _call_via_r3
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803DAC8
	ldr r0, _0803DAF0  @ gUnknown_03004E50
	ldr r0, [r0]
	adds r1, r4, #0
	adds r2, r5, #0
	bl sub_803AC3C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803DAC8
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_803D880
	ldrb r0, [r4, #0xb]
	strb r0, [r6, #2]
	mov r0, sp
	adds r1, r5, #0
	bl sub_803DD84
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803DAC8
	ldr r1, [sp, #8]
	mov r2, r8
	ldr r0, [r2, #8]
	cmp r1, r0
	bcc _0803DAC8
	ldrb r0, [r6]
	strb r0, [r2]
	ldrb r0, [r6, #1]
	strb r0, [r2, #1]
	ldrb r0, [r6, #2]
	strb r0, [r2, #2]
	str r1, [r2, #8]
_0803DAC8:
	adds r7, #1
	cmp r7, #0xbf
	ble _0803DA5A
	mov r1, r9
	cmp r1, #2
	ble _0803DA46
	mov r3, r8
	ldr r0, [r3, #8]
	cmp r0, #0
	bne _0803DAE2
	ldrb r0, [r3, #2]
	cmp r0, #0
	beq _0803DAF4
_0803DAE2:
	movs r0, #1
	b _0803DAF6
	.align 2, 0
_0803DAE8: .4byte 0x0000FFFF
_0803DAEC: .4byte 0x00010025
_0803DAF0: .4byte gUnknown_03004E50
_0803DAF4:
	movs r0, #0
_0803DAF6:
	add sp, #0x18
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_START sub_803DB08
sub_803DB08: @ 0x0803DB08
	push {r4, lr}
	adds r3, r0, #0
	adds r4, r1, #0
	ldr r1, _0803DB40  @ gUnknown_0202E4E0
	ldr r0, [r1]
	lsls r2, r4, #2
	adds r0, r2, r0
	ldr r0, [r0]
	adds r0, r0, r3
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x77
	bgt _0803DB3C
	ldr r0, _0803DB44  @ gUnknown_0202E4D8
	ldr r0, [r0]
	adds r0, r2, r0
	ldr r0, [r0]
	adds r0, r0, r3
	ldrb r2, [r0]
	cmp r2, #0
	beq _0803DB4C
	ldr r0, _0803DB48  @ gUnknown_0202BE44
	ldrb r0, [r0]
	cmp r2, r0
	beq _0803DB4C
_0803DB3C:
	movs r0, #0xff
	b _0803DB58
	.align 2, 0
_0803DB40: .4byte gUnknown_0202E4E0
_0803DB44: .4byte gUnknown_0202E4D8
_0803DB48: .4byte gUnknown_0202BE44
_0803DB4C:
	ldr r1, [r1]
	lsls r0, r4, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, r0, r3
	ldrb r0, [r0]
_0803DB58:
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_START sub_803DB60
sub_803DB60: @ 0x0803DB60
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x24
	movs r0, #0
	str r0, [sp, #0x10]
	movs r1, #0xff
	str r1, [sp, #0x14]
	movs r2, #0
	str r2, [sp, #0x18]
	ldr r0, _0803DC70  @ gUnknown_0202E4D4
	movs r3, #2
	ldrsh r0, [r0, r3]
	subs r0, #1
	mov r8, r0
	cmp r0, #0
	blt _0803DC64
_0803DB86:
	ldr r0, _0803DC70  @ gUnknown_0202E4D4
	movs r1, #0
	ldrsh r0, [r0, r1]
	subs r5, r0, #1
	mov r2, r8
	subs r2, #1
	str r2, [sp, #0x20]
	cmp r5, #0
	blt _0803DC5C
	mov r3, r8
	lsls r7, r3, #2
_0803DB9C:
	ldr r0, _0803DC74  @ gUnknown_0202E4E0
	ldr r0, [r0]
	adds r0, r7, r0
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _0803DC56
	ldr r0, _0803DC78  @ gUnknown_0202E4D8
	mov sl, r0
	ldr r0, [r0]
	adds r0, r7, r0
	ldr r0, [r0]
	adds r1, r0, r5
	ldrb r0, [r1]
	cmp r0, #0
	beq _0803DC56
	ldr r0, _0803DC7C  @ gUnknown_0202BE44
	ldrb r0, [r0]
	ldrb r1, [r1]
	bl AreUnitsAllied
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq _0803DC56
	mov r1, sp
	adds r1, #0xc
	str r1, [sp, #0x1c]
	adds r0, r5, #0
	mov r1, r8
	ldr r2, _0803DC80  @ sub_803DB08
	add r3, sp, #0xc
	bl sub_803B718
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803DC56
	mov r2, sl
	ldr r0, [r2]
	adds r0, r7, r0
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r0, [r0]
	bl GetUnitStruct
	adds r4, r0, #0
	ldr r0, _0803DC84  @ gUnknown_03004E50
	ldr r0, [r0]
	movs r1, #0x16
	ldrsb r1, [r0, r1]
	movs r0, #0x16
	ldrsb r0, [r4, r0]
	cmp r1, r0
	blt _0803DC56
	adds r0, r4, #0
	bl sub_803B7C8
	lsls r6, r0, #0x18
	asrs r1, r6, #0x18
	cmp r1, #0
	blt _0803DC56
	lsls r1, r1, #1
	adds r0, r4, #0
	adds r0, #0x1e
	adds r0, r0, r1
	ldrb r0, [r0]
	bl sub_803B794
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r3, [sp, #0x14]
	cmp r3, r0
	bcc _0803DC56
	str r0, [sp, #0x14]
	add r1, sp, #0xc
	ldr r2, [sp, #0x1c]
	ldrh r0, [r2, #2]
	lsls r0, r0, #0x10
	ldrh r1, [r1]
	mov r9, r1
	mov r3, r9
	orrs r3, r0
	mov r9, r3
	mov r1, sl
	ldr r0, [r1]
	adds r0, r7, r0
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r0, [r0]
	str r0, [sp, #0x18]
	lsrs r6, r6, #0x18
	str r6, [sp, #0x10]
_0803DC56:
	subs r5, #1
	cmp r5, #0
	bge _0803DB9C
_0803DC5C:
	ldr r2, [sp, #0x20]
	mov r8, r2
	cmp r2, #0
	bge _0803DB86
_0803DC64:
	ldr r3, [sp, #0x14]
	cmp r3, #0xff
	bne _0803DC88
	movs r0, #0
	b _0803DCB0
	.align 2, 0
_0803DC70: .4byte gUnknown_0202E4D4
_0803DC74: .4byte gUnknown_0202E4E0
_0803DC78: .4byte gUnknown_0202E4D8
_0803DC7C: .4byte gUnknown_0202BE44
_0803DC80: .4byte sub_803DB08
_0803DC84: .4byte gUnknown_03004E50
_0803DC88:
	ldr r0, _0803DCC0  @ gUnknown_03004E50
	ldr r1, [r0]
	adds r1, #0x46
	ldrb r0, [r1]
	adds r0, #1
	movs r2, #0
	strb r0, [r1]
	mov r1, r9
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	asrs r1, r1, #0x10
	ldr r3, [sp, #0x10]
	str r3, [sp]
	str r2, [sp, #4]
	str r2, [sp, #8]
	movs r2, #3
	ldr r3, [sp, #0x18]
	bl sub_8039C20
	movs r0, #1
_0803DCB0:
	add sp, #0x24
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0803DCC0: .4byte gUnknown_03004E50

	THUMB_FUNC_START sub_803DCC4
sub_803DCC4: @ 0x0803DCC4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r7, r0, #0
	movs r3, #0
	ldr r0, _0803DD60  @ gUnknown_0202E4D4
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r5, r0, #1
	cmp r5, #0
	blt _0803DD4E
_0803DCDC:
	ldr r0, _0803DD60  @ gUnknown_0202E4D4
	movs r1, #0
	ldrsh r0, [r0, r1]
	subs r4, r0, #1
	subs r0, r5, #1
	mov r8, r0
	cmp r4, #0
	blt _0803DD48
	lsls r6, r5, #2
_0803DCEE:
	ldr r0, _0803DD64  @ gUnknown_0202E4E0
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _0803DD42
	ldr r0, _0803DD68  @ gUnknown_0202E4E4
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0803DD42
	ldr r0, _0803DD6C  @ gUnknown_0202E4D8
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r1, [r0]
	cmp r1, #0
	beq _0803DD2A
	ldr r0, _0803DD70  @ gUnknown_0202BE44
	ldrb r0, [r0]
	cmp r1, r0
	bne _0803DD42
_0803DD2A:
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r7, #0
	str r3, [sp]
	bl sub_803DE5C
	ldr r3, [sp]
	cmp r0, r3
	bls _0803DD42
	strb r4, [r7]
	strb r5, [r7, #1]
	adds r3, r0, #0
_0803DD42:
	subs r4, #1
	cmp r4, #0
	bge _0803DCEE
_0803DD48:
	mov r5, r8
	cmp r5, #0
	bge _0803DCDC
_0803DD4E:
	cmp r3, #0
	beq _0803DD74
	adds r0, r7, #0
	bl sub_803DEC8
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	b _0803DD76
	.align 2, 0
_0803DD60: .4byte gUnknown_0202E4D4
_0803DD64: .4byte gUnknown_0202E4E0
_0803DD68: .4byte gUnknown_0202E4E4
_0803DD6C: .4byte gUnknown_0202E4D8
_0803DD70: .4byte gUnknown_0202BE44
_0803DD74:
	movs r0, #0
_0803DD76:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_START sub_803DD84
sub_803DD84: @ 0x0803DD84
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r7, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov r9, r1
	movs r3, #0
	ldr r0, _0803DE38  @ gUnknown_0202E4D4
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r5, r0, #1
	cmp r5, #0
	blt _0803DE26
_0803DDA4:
	ldr r0, _0803DE38  @ gUnknown_0202E4D4
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r4, r0, #1
	subs r0, r5, #1
	mov r8, r0
	cmp r4, #0
	blt _0803DE20
	lsls r6, r5, #2
_0803DDB6:
	ldr r0, _0803DE3C  @ gUnknown_0202E4E0
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r1, r0, r4
	ldrb r0, [r1]
	cmp r0, #0x78
	bhi _0803DE1A
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	mov r2, r9
	lsls r0, r2, #0x18
	lsrs r0, r0, #0x18
	cmp r1, r0
	bne _0803DE1A
	ldr r0, _0803DE40  @ gUnknown_0202E4E4
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0803DE1A
	ldr r0, _0803DE44  @ gUnknown_0202E4D8
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r1, [r0]
	cmp r1, #0
	beq _0803DE02
	ldr r0, _0803DE48  @ gUnknown_0202BE44
	ldrb r0, [r0]
	cmp r1, r0
	bne _0803DE1A
_0803DE02:
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r7, #0
	str r3, [sp]
	bl sub_803DE5C
	ldr r3, [sp]
	cmp r0, r3
	bls _0803DE1A
	strb r4, [r7]
	strb r5, [r7, #1]
	adds r3, r0, #0
_0803DE1A:
	subs r4, #1
	cmp r4, #0
	bge _0803DDB6
_0803DE20:
	mov r5, r8
	cmp r5, #0
	bge _0803DDA4
_0803DE26:
	cmp r3, #0
	beq _0803DE4C
	adds r0, r7, #0
	bl sub_803DEC8
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	b _0803DE4E
	.align 2, 0
_0803DE38: .4byte gUnknown_0202E4D4
_0803DE3C: .4byte gUnknown_0202E4E0
_0803DE40: .4byte gUnknown_0202E4E4
_0803DE44: .4byte gUnknown_0202E4D8
_0803DE48: .4byte gUnknown_0202BE44
_0803DE4C:
	movs r0, #0
_0803DE4E:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_START sub_803DE5C
sub_803DE5C: @ 0x0803DE5C
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r5, r1, #0
	ldrb r0, [r2, #2]
	bl GetUnitStruct
	adds r2, r0, #0
	adds r0, r6, #0
	adds r1, r5, #0
	bl sub_803E1EC
	adds r4, r0, #0
	adds r0, r6, #0
	adds r1, r5, #0
	bl sub_803E23C
	adds r4, r4, r0
	adds r0, r6, #0
	adds r1, r5, #0
	bl sub_803E27C
	adds r4, r4, r0
	ldr r0, _0803DEB8  @ gUnknown_0202E4E0
	ldr r0, [r0]
	lsls r5, r5, #2
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r6
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r4, r4, r0
	ldr r0, _0803DEBC  @ gUnknown_0202E4F0
	ldr r0, [r0]
	adds r5, r5, r0
	ldr r0, [r5]
	adds r0, r0, r6
	ldrb r0, [r0]
	lsrs r0, r0, #3
	subs r4, r4, r0
	ldr r0, _0803DEC0  @ 0x7FFFFFFF
	adds r4, r4, r0
	adds r0, r4, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0803DEB8: .4byte gUnknown_0202E4E0
_0803DEBC: .4byte gUnknown_0202E4F0
_0803DEC0: .4byte 0x7FFFFFFF

	THUMB_FUNC_START sub_803DEC4
sub_803DEC4: @ 0x0803DEC4
	movs r0, #0
	bx lr

	THUMB_FUNC_START sub_803DEC8
sub_803DEC8: @ 0x0803DEC8
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldrh r1, [r5, #4]
	ldr r0, _0803DEF0  @ 0x0000FFFF
	cmp r1, r0
	beq _0803DEF8
	ldrb r0, [r5, #2]
	bl GetUnitStruct
	adds r1, r0, #0
	ldr r0, _0803DEF4  @ gUnknown_03004E50
	ldr r0, [r0]
	ldrb r2, [r5]
	ldrb r3, [r5, #1]
	ldrh r4, [r5, #4]
	str r4, [sp]
	bl sub_802A318
	b _0803DF0E
	.align 2, 0
_0803DEF0: .4byte 0x0000FFFF
_0803DEF4: .4byte gUnknown_03004E50
_0803DEF8:
	ldr r0, _0803DF20  @ gUnknown_03004E50
	ldr r4, [r0]
	ldrb r0, [r5, #2]
	bl GetUnitStruct
	adds r1, r0, #0
	ldrb r2, [r5]
	ldrb r3, [r5, #1]
	adds r0, r4, #0
	bl sub_802A364
_0803DF0E:
	adds r0, r5, #0
	bl sub_803DEC4
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803DF24
	movs r0, #0
	b _0803DF2C
	.align 2, 0
_0803DF20: .4byte gUnknown_03004E50
_0803DF24:
	adds r0, r5, #0
	bl sub_803E178
	movs r0, #1
_0803DF2C:
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_START sub_803DF34
sub_803DF34: @ 0x0803DF34
	push {r4, lr}
	ldr r3, _0803DF44  @ gUnknown_0203A56C
	movs r0, #0x13
	ldrsb r0, [r3, r0]
	cmp r0, #0
	bne _0803DF48
	movs r0, #0x32
	b _0803DF86
	.align 2, 0
_0803DF44: .4byte gUnknown_0203A56C
_0803DF48:
	ldr r1, _0803DF8C  @ gUnknown_0203A4EC
	adds r0, r1, #0
	adds r0, #0x5a
	movs r4, #0
	ldrsh r2, [r0, r4]
	adds r0, r3, #0
	adds r0, #0x5c
	movs r3, #0
	ldrsh r0, [r0, r3]
	subs r2, r2, r0
	adds r1, #0x64
	movs r4, #0
	ldrsh r0, [r1, r4]
	adds r1, r2, #0
	muls r1, r0, r1
	cmp r1, #0
	bge _0803DF6C
	movs r1, #0
_0803DF6C:
	adds r0, r1, #0
	movs r1, #0x64
	bl Div
	adds r1, r0, #0
	ldr r0, _0803DF90  @ gUnknown_030017D8
	ldr r0, [r0]
	ldrb r0, [r0]
	muls r1, r0, r1
	cmp r1, #0x28
	ble _0803DF84
	movs r1, #0x28
_0803DF84:
	adds r0, r1, #0
_0803DF86:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0803DF8C: .4byte gUnknown_0203A4EC
_0803DF90: .4byte gUnknown_030017D8

	THUMB_FUNC_START sub_803DF94
sub_803DF94: @ 0x0803DF94
	push {lr}
	ldr r0, _0803DFB4  @ gUnknown_0203A56C
	movs r1, #0x13
	ldrsb r1, [r0, r1]
	movs r0, #0x14
	subs r1, r0, r1
	ldr r0, _0803DFB8  @ gUnknown_030017D8
	ldr r0, [r0]
	ldrb r0, [r0, #1]
	muls r1, r0, r1
	cmp r1, #0
	bge _0803DFAE
	movs r1, #0
_0803DFAE:
	adds r0, r1, #0
	pop {r1}
	bx r1
	.align 2, 0
_0803DFB4: .4byte gUnknown_0203A56C
_0803DFB8: .4byte gUnknown_030017D8

	THUMB_FUNC_START sub_803DFBC
sub_803DFBC: @ 0x0803DFBC
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	movs r5, #0
	ldr r4, _0803E054  @ gUnknown_085A91F0
	ldrb r2, [r4]
	movs r0, #0
	ldrsb r0, [r4, r0]
	cmp r0, #0x7f
	beq _0803E038
	ldr r0, _0803E058  @ gUnknown_0203A4EC
	mov r9, r0
	ldr r1, _0803E05C  @ gUnknown_0202E4D4
	mov r8, r1
_0803DFDA:
	mov r3, r9
	ldrb r3, [r3, #0x10]
	adds r2, r2, r3
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	ldrb r0, [r4, #1]
	mov r6, r9
	ldrb r6, [r6, #0x11]
	adds r0, r0, r6
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	ldr r0, _0803E060  @ gUnknown_0202E4D8
	ldr r1, [r0]
	lsls r0, r3, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, r0, r2
	ldrb r1, [r0]
	mov r7, r8
	movs r6, #0
	ldrsh r0, [r7, r6]
	cmp r2, r0
	bge _0803E02C
	movs r2, #2
	ldrsh r0, [r7, r2]
	cmp r3, r0
	bge _0803E02C
	cmp r1, #0
	beq _0803E02C
	mov r3, r9
	movs r0, #0xb
	ldrsb r0, [r3, r0]
	bl AreUnitsAllied
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _0803E02C
	movs r0, #2
	ldrsb r0, [r4, r0]
	adds r5, r5, r0
_0803E02C:
	adds r4, #4
	ldrb r2, [r4]
	movs r0, #0
	ldrsb r0, [r4, r0]
	cmp r0, #0x7f
	bne _0803DFDA
_0803E038:
	ldr r0, _0803E064  @ gUnknown_030017D8
	ldr r0, [r0]
	ldrb r0, [r0, #2]
	muls r5, r0, r5
	cmp r5, #0xa
	ble _0803E046
	movs r5, #0xa
_0803E046:
	adds r0, r5, #0
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0803E054: .4byte gUnknown_085A91F0
_0803E058: .4byte gUnknown_0203A4EC
_0803E05C: .4byte gUnknown_0202E4D4
_0803E060: .4byte gUnknown_0202E4D8
_0803E064: .4byte gUnknown_030017D8

	THUMB_FUNC_START sub_803E068
sub_803E068: @ 0x0803E068
	push {lr}
	ldr r0, _0803E094  @ gUnknown_0203A56C
	ldr r0, [r0, #4]
	ldrb r0, [r0, #4]
	bl sub_803BF4C
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _0803E098  @ gUnknown_030017D8
	ldr r2, [r1]
	adds r1, r2, #0
	adds r1, #8
	adds r1, r1, r0
	ldrb r1, [r1]
	ldrb r0, [r2, #3]
	muls r1, r0, r1
	cmp r1, #0x14
	ble _0803E08E
	movs r1, #0x14
_0803E08E:
	adds r0, r1, #0
	pop {r1}
	bx r1
	.align 2, 0
_0803E094: .4byte gUnknown_0203A56C
_0803E098: .4byte gUnknown_030017D8

	THUMB_FUNC_START sub_803E09C
sub_803E09C: @ 0x0803E09C
	ldr r0, _0803E0AC  @ gUnknown_0202BCF0
	ldrh r0, [r0, #0x10]
	ldr r1, _0803E0B0  @ gUnknown_030017D8
	ldr r1, [r1]
	ldrb r1, [r1, #4]
	muls r0, r1, r0
	bx lr
	.align 2, 0
_0803E0AC: .4byte gUnknown_0202BCF0
_0803E0B0: .4byte gUnknown_030017D8

	THUMB_FUNC_START sub_803E0B4
sub_803E0B4: @ 0x0803E0B4
	push {lr}
	ldr r2, _0803E0C8  @ gUnknown_0203A56C
	adds r0, r2, #0
	adds r0, #0x48
	ldrh r0, [r0]
	cmp r0, #0
	bne _0803E0CC
	movs r0, #0xa
	negs r0, r0
	b _0803E108
	.align 2, 0
_0803E0C8: .4byte gUnknown_0203A56C
_0803E0CC:
	adds r0, r2, #0
	adds r0, #0x5a
	movs r3, #0
	ldrsh r1, [r0, r3]
	ldr r0, _0803E10C  @ gUnknown_0203A4EC
	adds r0, #0x5c
	movs r3, #0
	ldrsh r0, [r0, r3]
	subs r1, r1, r0
	adds r0, r2, #0
	adds r0, #0x64
	movs r2, #0
	ldrsh r0, [r0, r2]
	muls r1, r0, r1
	cmp r1, #0
	bge _0803E0EE
	movs r1, #0
_0803E0EE:
	adds r0, r1, #0
	movs r1, #0x64
	bl Div
	adds r1, r0, #0
	ldr r0, _0803E110  @ gUnknown_030017D8
	ldr r0, [r0]
	ldrb r0, [r0, #5]
	muls r1, r0, r1
	cmp r1, #0x28
	ble _0803E106
	movs r1, #0x28
_0803E106:
	adds r0, r1, #0
_0803E108:
	pop {r1}
	bx r1
	.align 2, 0
_0803E10C: .4byte gUnknown_0203A4EC
_0803E110: .4byte gUnknown_030017D8

	THUMB_FUNC_START sub_803E114
sub_803E114: @ 0x0803E114
	push {lr}
	ldr r2, _0803E144  @ gUnknown_0203A4EC
	movs r0, #0x11
	ldrsb r0, [r2, r0]
	ldr r1, _0803E148  @ gUnknown_0202E4F0
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	lsrs r1, r0, #3
	ldr r0, _0803E14C  @ gUnknown_030017D8
	ldr r0, [r0]
	ldrb r0, [r0, #6]
	muls r1, r0, r1
	cmp r1, #0x14
	ble _0803E13E
	movs r1, #0x14
_0803E13E:
	adds r0, r1, #0
	pop {r1}
	bx r1
	.align 2, 0
_0803E144: .4byte gUnknown_0203A4EC
_0803E148: .4byte gUnknown_0202E4F0
_0803E14C: .4byte gUnknown_030017D8

	THUMB_FUNC_START sub_803E150
sub_803E150: @ 0x0803E150
	push {lr}
	ldr r0, _0803E170  @ gUnknown_0203A4EC
	movs r1, #0x13
	ldrsb r1, [r0, r1]
	movs r0, #0x14
	subs r1, r0, r1
	ldr r0, _0803E174  @ gUnknown_030017D8
	ldr r0, [r0]
	ldrb r0, [r0, #7]
	muls r1, r0, r1
	cmp r1, #0
	bge _0803E16A
	movs r1, #0
_0803E16A:
	adds r0, r1, #0
	pop {r1}
	bx r1
	.align 2, 0
_0803E170: .4byte gUnknown_0203A4EC
_0803E174: .4byte gUnknown_030017D8

	THUMB_FUNC_START sub_803E178
sub_803E178: @ 0x0803E178
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r2, _0803E1D4  @ gUnknown_030017D8
	ldr r0, _0803E1D8  @ gUnknown_0203AA04
	adds r0, #0x7d
	ldrb r1, [r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _0803E1DC  @ gUnknown_080D8178
	adds r0, r0, r1
	str r0, [r2]
	bl sub_803DF34
	adds r4, r0, #0
	adds r5, r4, #0
	bl sub_803DF94
	adds r4, r4, r0
	bl sub_803DFBC
	adds r4, r4, r0
	bl sub_803E068
	adds r4, r4, r0
	bl sub_803E09C
	adds r4, r4, r0
	bl sub_803E0B4
	subs r4, r4, r0
	bl sub_803E114
	subs r4, r4, r0
	bl sub_803E150
	subs r4, r4, r0
	cmp r4, #0
	bge _0803E1C8
	movs r4, #0
_0803E1C8:
	cmp r4, #0
	beq _0803E1E0
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r4, r0, #3
	b _0803E1E2
	.align 2, 0
_0803E1D4: .4byte gUnknown_030017D8
_0803E1D8: .4byte gUnknown_0203AA04
_0803E1DC: .4byte gUnknown_080D8178
_0803E1E0:
	adds r4, r5, #0
_0803E1E2:
	str r4, [r6, #8]
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_START sub_803E1EC
sub_803E1EC: @ 0x0803E1EC
	push {r4, r5, lr}
	movs r4, #0x10
	ldrsb r4, [r2, r4]
	subs r3, r4, r0
	cmp r3, #0
	bge _0803E1FA
	subs r3, r0, r4
_0803E1FA:
	movs r0, #0x11
	ldrsb r0, [r2, r0]
	subs r4, r0, r1
	cmp r4, #0
	blt _0803E208
	adds r5, r3, r4
	b _0803E20C
_0803E208:
	subs r0, r1, r0
	adds r5, r3, r0
_0803E20C:
	adds r0, r2, #0
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0
	beq _0803E232
	adds r0, r4, #0
	bl GetItemMaxRange
	cmp r5, r0
	bgt _0803E22E
	adds r0, r4, #0
	bl GetItemMinRange
	cmp r5, r0
	bge _0803E232
_0803E22E:
	movs r0, #0x32
	b _0803E234
_0803E232:
	movs r0, #0
_0803E234:
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_START sub_803E23C
sub_803E23C: @ 0x0803E23C
	ldr r2, _0803E274  @ gUnknown_0202E4DC
	ldr r2, [r2]
	lsls r1, r1, #2
	adds r1, r1, r2
	ldr r1, [r1]
	adds r1, r1, r0
	ldrb r3, [r1]
	ldr r0, _0803E278  @ gUnknown_03004E50
	ldr r0, [r0]
	ldr r2, [r0, #4]
	ldr r0, [r2, #0x44]
	adds r0, r0, r3
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldr r1, [r2, #0x48]
	adds r1, r1, r3
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, r0, r1
	ldr r1, [r2, #0x4c]
	adds r1, r1, r3
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, r0, r1
	bx lr
	.align 2, 0
_0803E274: .4byte gUnknown_0202E4DC
_0803E278: .4byte gUnknown_03004E50

	THUMB_FUNC_START sub_803E27C
sub_803E27C: @ 0x0803E27C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r7, r0, #0
	adds r6, r1, #0
	movs r5, #0
	ldr r4, _0803E2CC  @ gUnknown_085A9254
	movs r1, #0
	ldrsh r0, [r4, r1]
	ldr r1, _0803E2D0  @ 0x0000270F
	cmp r0, r1
	beq _0803E2E8
	mov r8, r1
_0803E296:
	movs r2, #2
	ldrsh r0, [r4, r2]
	adds r0, r6, r0
	ldr r1, _0803E2D4  @ gUnknown_0202E4D8
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r2, #0
	ldrsh r1, [r4, r2]
	ldr r0, [r0]
	adds r1, r7, r1
	adds r1, r0, r1
	ldrb r0, [r1]
	cmp r0, #0
	beq _0803E2DE
	ldr r0, _0803E2D8  @ gUnknown_0202BE44
	ldrb r0, [r0]
	ldrb r1, [r1]
	bl AreUnitsAllied
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _0803E2DC
	adds r5, #5
	b _0803E2DE
	.align 2, 0
_0803E2CC: .4byte gUnknown_085A9254
_0803E2D0: .4byte 0x0000270F
_0803E2D4: .4byte gUnknown_0202E4D8
_0803E2D8: .4byte gUnknown_0202BE44
_0803E2DC:
	subs r5, #5
_0803E2DE:
	adds r4, #4
	movs r1, #0
	ldrsh r0, [r4, r1]
	cmp r0, r8
	bne _0803E296
_0803E2E8:
	adds r0, r5, #0
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_START sub_803E2F4
sub_803E2F4: @ 0x0803E2F4
	push {lr}
	ldr r0, _0803E318  @ gUnknown_0203AA04
	adds r1, r0, #0
	adds r1, #0x7a
	ldrb r0, [r1]
	cmp r0, #0
	bne _0803E314
	movs r0, #1
	strb r0, [r1]
	ldr r0, _0803E31C  @ gUnknown_0202E4F0
	ldr r0, [r0]
	movs r1, #0
	bl ClearMapWith
	bl sub_803E320
_0803E314:
	pop {r0}
	bx r0
	.align 2, 0
_0803E318: .4byte gUnknown_0203AA04
_0803E31C: .4byte gUnknown_0202E4F0

	THUMB_FUNC_START sub_803E320
sub_803E320: @ 0x0803E320
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	movs r0, #0
	mov r8, r0
	mov r9, r0
	movs r4, #1
_0803E332:
	adds r0, r4, #0
	bl GetUnitStruct
	adds r6, r0, #0
	adds r4, #1
	mov sl, r4
	cmp r6, #0
	beq _0803E41C
	ldr r0, [r6]
	cmp r0, #0
	beq _0803E41C
	ldr r0, [r6, #0xc]
	ldr r1, _0803E430  @ 0x0001000D
	ands r0, r1
	cmp r0, #0
	bne _0803E41C
	ldr r0, _0803E434  @ gUnknown_0202BE44
	ldrb r0, [r0]
	movs r1, #0xb
	ldrsb r1, [r6, r1]
	bl AreUnitsAllied
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0803E41C
	movs r5, #0
	ldrh r4, [r6, #0x1e]
	cmp r4, #0
	beq _0803E3A6
_0803E36C:
	adds r0, r6, #0
	adds r1, r4, #0
	bl CanUnitUseAsWeapon
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803E392
	adds r0, r4, #0
	bl GetItemMight
	cmp r0, r9
	ble _0803E392
	mov r8, r4
	mov r0, r8
	bl GetItemMight
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r9, r0
_0803E392:
	adds r5, #1
	cmp r5, #4
	bgt _0803E3A6
	lsls r1, r5, #1
	adds r0, r6, #0
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r4, [r0]
	cmp r4, #0
	bne _0803E36C
_0803E3A6:
	mov r1, r8
	cmp r1, #0
	beq _0803E41C
	ldr r0, _0803E438  @ gUnknown_03004E50
	ldr r0, [r0]
	adds r1, r6, #0
	mov r2, r8
	bl sub_803AC90
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803E41C
	adds r0, r6, #0
	mov r1, r8
	bl FillMovementAndRangeMapForItem
	ldr r0, _0803E43C  @ gUnknown_0202E4D4
	movs r2, #2
	ldrsh r0, [r0, r2]
	subs r1, r0, #1
	cmp r1, #0
	blt _0803E41C
_0803E3D2:
	ldr r0, _0803E43C  @ gUnknown_0202E4D4
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r4, r0, #1
	subs r7, r1, #1
	cmp r4, #0
	blt _0803E416
	lsls r5, r1, #2
_0803E3E2:
	ldr r0, _0803E440  @ gUnknown_0202E4E4
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0803E410
	adds r0, r6, #0
	bl GetUnitPower
	ldr r1, _0803E444  @ gUnknown_0202E4F0
	ldr r1, [r1]
	adds r1, r5, r1
	ldr r1, [r1]
	adds r1, r1, r4
	add r0, r9
	asrs r0, r0, #1
	ldrb r2, [r1]
	adds r0, r0, r2
	strb r0, [r1]
_0803E410:
	subs r4, #1
	cmp r4, #0
	bge _0803E3E2
_0803E416:
	adds r1, r7, #0
	cmp r1, #0
	bge _0803E3D2
_0803E41C:
	mov r4, sl
	cmp r4, #0xbf
	ble _0803E332
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803E430: .4byte 0x0001000D
_0803E434: .4byte gUnknown_0202BE44
_0803E438: .4byte gUnknown_03004E50
_0803E43C: .4byte gUnknown_0202E4D4
_0803E440: .4byte gUnknown_0202E4E4
_0803E444: .4byte gUnknown_0202E4F0

	THUMB_FUNC_START sub_803E448
sub_803E448: @ 0x0803E448
	push {lr}
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	ldr r3, _0803E464  @ gUnknown_0202E4F0
	ldr r3, [r3]
	lsls r1, r1, #2
	adds r1, r1, r3
	ldr r1, [r1]
	adds r1, r1, r0
	ldrb r0, [r1]
	cmp r0, r2
	bhi _0803E468
	movs r0, #1
	b _0803E46A
	.align 2, 0
_0803E464: .4byte gUnknown_0202E4F0
_0803E468:
	movs r0, #0
_0803E46A:
	pop {r1}
	bx r1

	THUMB_FUNC_START sub_803E470
sub_803E470: @ 0x0803E470
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov r8, r0
	ldr r0, _0803E534  @ 0x00002710
	str r0, [sp]
	movs r1, #0xff
	mov r9, r1
	ldr r0, _0803E538  @ gUnknown_03004E50
	ldr r2, [r0]
	adds r0, r2, #0
	adds r0, #0x40
	ldrh r1, [r0]
	movs r3, #0x80
	lsls r3, r3, #6
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	beq _0803E49E
	b _0803E62C
_0803E49E:
	ldr r0, [r2]
	ldr r1, [r2, #4]
	ldr r0, [r0, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	ands r0, r3
	cmp r0, #0
	beq _0803E4B0
	b _0803E62C
_0803E4B0:
	adds r0, r2, #0
	movs r1, #0x7c
	bl FillMovementMapForUnitAndMovement
	ldr r0, _0803E53C  @ gUnknown_0202E4D4
	movs r2, #2
	ldrsh r0, [r0, r2]
	subs r7, r0, #1
	cmp r7, #0
	bge _0803E4C6
	b _0803E5E0
_0803E4C6:
	ldr r0, _0803E53C  @ gUnknown_0202E4D4
	movs r3, #0
	ldrsh r0, [r0, r3]
	subs r4, r0, #1
	subs r0, r7, #1
	mov sl, r0
	cmp r4, #0
	bge _0803E4D8
	b _0803E5D8
_0803E4D8:
	lsls r5, r7, #2
_0803E4DA:
	ldr r0, _0803E540  @ gUnknown_0202E4E0
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _0803E5D0
	ldr r0, _0803E544  @ gUnknown_0202E4DC
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r1, [r0]
	ldr r0, _0803E548  @ gUnknown_085A92B8
	bl sub_803AD18
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0803E554
	ldr r6, _0803E54C  @ gUnknown_0202E4D8
	ldr r0, [r6]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r1, r0, r4
	ldrb r0, [r1]
	cmp r0, #0
	beq _0803E5D0
	ldr r0, _0803E550  @ gUnknown_0202BE44
	ldrb r0, [r0]
	ldrb r1, [r1]
	bl AreUnitsAllied
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803E5D0
	ldr r0, [r6]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	bl GetUnitStruct
	adds r2, r0, #0
	b _0803E594
	.align 2, 0
_0803E534: .4byte 0x00002710
_0803E538: .4byte gUnknown_03004E50
_0803E53C: .4byte gUnknown_0202E4D4
_0803E540: .4byte gUnknown_0202E4E0
_0803E544: .4byte gUnknown_0202E4DC
_0803E548: .4byte gUnknown_085A92B8
_0803E54C: .4byte gUnknown_0202E4D8
_0803E550: .4byte gUnknown_0202BE44
_0803E554:
	ldr r6, _0803E620  @ gUnknown_0202E4D8
	ldr r0, [r6]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r1, r0, r4
	ldrb r0, [r1]
	cmp r0, #0
	beq _0803E59E
	ldr r0, _0803E624  @ gUnknown_0202BE44
	ldrb r0, [r0]
	ldrb r1, [r1]
	bl AreUnitsAllied
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803E5D0
	ldr r0, [r6]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	bl GetUnitStruct
	adds r2, r0, #0
	adds r0, #0x40
	ldrh r0, [r0]
	movs r3, #0x80
	lsls r3, r3, #6
	adds r1, r3, #0
	ands r0, r1
	cmp r0, #0
	beq _0803E59E
_0803E594:
	ldrb r1, [r2, #0xa]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _0803E5D0
_0803E59E:
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	lsls r1, r7, #0x10
	asrs r1, r1, #0x10
	bl sub_803B41C
	adds r2, r0, #0
	ldr r0, [sp]
	cmp r2, r0
	bgt _0803E5D0
	ldr r0, _0803E628  @ gUnknown_0202E4E0
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r1, r0, r4
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, r9
	bgt _0803E5D0
	str r2, [sp]
	ldrb r1, [r1]
	mov r9, r1
	mov r1, r8
	strh r4, [r1]
	strh r7, [r1, #2]
_0803E5D0:
	subs r4, #1
	cmp r4, #0
	blt _0803E5D8
	b _0803E4DA
_0803E5D8:
	mov r7, sl
	cmp r7, #0
	blt _0803E5E0
	b _0803E4C6
_0803E5E0:
	mov r2, r9
	cmp r2, #0xff
	beq _0803E62C
	mov r3, r8
	movs r1, #2
	ldrsh r0, [r3, r1]
	ldr r1, _0803E620  @ gUnknown_0202E4D8
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r2, #0
	ldrsh r1, [r3, r2]
	ldr r0, [r0]
	adds r2, r0, r1
	ldrb r1, [r2]
	cmp r1, #0
	beq _0803E61A
	ldr r0, _0803E624  @ gUnknown_0202BE44
	ldrb r0, [r0]
	cmp r1, r0
	beq _0803E61A
	adds r0, r1, #0
	bl GetUnitStruct
	adds r2, r0, #0
	ldrb r1, [r2, #0xa]
	movs r0, #2
	orrs r0, r1
	strb r0, [r2, #0xa]
_0803E61A:
	movs r0, #1
	b _0803E62E
	.align 2, 0
_0803E620: .4byte gUnknown_0202E4D8
_0803E624: .4byte gUnknown_0202BE44
_0803E628: .4byte gUnknown_0202E4E0
_0803E62C:
	movs r0, #0
_0803E62E:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_START UpdateAllPhaseHealingAIStatus
UpdateAllPhaseHealingAIStatus: @ 0x0803E640
	push {r4, r5, r6, lr}
	sub sp, #0xc
	ldr r0, _0803E690  @ gUnknown_0202BCF0
	ldrb r2, [r0, #0xf]
	mov r1, sp
	ldr r0, _0803E694  @ gUnknown_080D8680
	ldm r0!, {r3, r4, r5}
	stm r1!, {r3, r4, r5}
	movs r5, #0
	lsrs r0, r2, #6
	lsls r0, r0, #2
	mov r3, sp
	adds r1, r3, r0
	ldr r0, [r1]
	cmp r5, r0
	bge _0803E686
	adds r6, r1, #0
	adds r4, r2, #1
_0803E664:
	adds r0, r4, #0
	bl GetUnitStruct
	adds r1, r0, #0
	cmp r1, #0
	beq _0803E67C
	ldr r0, [r1]
	cmp r0, #0
	beq _0803E67C
	adds r0, r1, #0
	bl UpdateUnitHealingAIStatus
_0803E67C:
	adds r4, #1
	adds r5, #1
	ldr r0, [r6]
	cmp r5, r0
	blt _0803E664
_0803E686:
	add sp, #0xc
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0803E690: .4byte gUnknown_0202BCF0
_0803E694: .4byte gUnknown_080D8680

	THUMB_FUNC_START UpdateUnitHealingAIStatus
UpdateUnitHealingAIStatus: @ 0x0803E698
	push {r4, r5, lr}
	adds r5, r0, #0
	bl GetUnitCurrentHP
	movs r1, #0x64
	adds r4, r0, #0
	muls r4, r1, r4
	adds r0, r5, #0
	bl GetUnitMaxHP
	adds r1, r0, #0
	adds r0, r4, #0
	bl Div
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	ldrb r3, [r5, #0xa]
	movs r0, #1
	ands r0, r3
	cmp r0, #0
	beq _0803E6E8
	ldr r2, _0803E6E4  @ gUnknown_085A8390
	adds r0, r5, #0
	adds r0, #0x40
	ldrh r1, [r0]
	movs r0, #7
	ands r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r0, [r0]
	cmp r0, r4
	bhi _0803E70E
	movs r0, #0xfe
	ands r0, r3
	strb r0, [r5, #0xa]
	movs r0, #0
	b _0803E710
	.align 2, 0
_0803E6E4: .4byte gUnknown_085A8390
_0803E6E8:
	ldr r2, _0803E704  @ gUnknown_085A8390
	adds r0, r5, #0
	adds r0, #0x40
	ldrh r1, [r0]
	movs r0, #7
	ands r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r0, [r0, #1]
	cmp r0, r4
	bhi _0803E708
	movs r0, #0
	b _0803E710
	.align 2, 0
_0803E704: .4byte gUnknown_085A8390
_0803E708:
	movs r0, #1
	orrs r0, r3
	strb r0, [r5, #0xa]
_0803E70E:
	movs r0, #1
_0803E710:
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_START sub_803E718
sub_803E718: @ 0x0803E718
	push {r4, r5, r6, r7, lr}
	sub sp, #0x10
	movs r6, #0
	ldr r7, _0803E794  @ gUnknown_03004E50
_0803E720:
	ldr r0, [r7]
	lsls r1, r6, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r0, [r0]
	adds r4, r0, #0
	cmp r4, #0
	beq _0803E7C6
	adds r0, r4, #0
	bl GetItemIndex
	cmp r0, #0x6c
	beq _0803E744
	adds r0, r4, #0
	bl GetItemIndex
	cmp r0, #0x6d
	bne _0803E7C0
_0803E744:
	ldr r0, _0803E798  @ gUnknown_0203AA04
	adds r0, #0x7b
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _0803E79C
	ldr r2, [r7]
	adds r0, r2, #0
	adds r0, #0x40
	ldrh r0, [r0]
	movs r3, #0x80
	lsls r3, r3, #6
	adds r1, r3, #0
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0
	bne _0803E79C
	add r5, sp, #0xc
	adds r0, r2, #0
	adds r1, r5, #0
	bl sub_803B808
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _0803E7C0
	add r0, sp, #0xc
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r2, #2
	ldrsh r1, [r5, r2]
	lsls r2, r6, #0x18
	lsrs r2, r2, #0x18
	str r2, [sp]
	str r4, [sp, #4]
	str r4, [sp, #8]
	b _0803E7B4
	.align 2, 0
_0803E794: .4byte gUnknown_03004E50
_0803E798: .4byte gUnknown_0203AA04
_0803E79C:
	ldr r1, [r7]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	ldrb r1, [r1, #0x11]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	lsls r2, r6, #0x18
	lsrs r2, r2, #0x18
	str r2, [sp]
	movs r2, #0
	str r2, [sp, #4]
	str r2, [sp, #8]
_0803E7B4:
	movs r2, #6
	movs r3, #0
	bl sub_8039C20
	movs r0, #1
	b _0803E7C8
_0803E7C0:
	adds r6, #1
	cmp r6, #4
	ble _0803E720
_0803E7C6:
	movs r0, #0
_0803E7C8:
	add sp, #0x10
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_START sub_803E7D0
sub_803E7D0: @ 0x0803E7D0
	push {r4, r5, r6, lr}
	sub sp, #0xc
	ldr r6, _0803E840  @ gUnknown_03004E50
	ldr r0, [r6]
	movs r1, #0x7c
	bl FillMovementMapForUnitAndMovement
	bl GetEscapePointStructThingMaybe
	adds r4, r0, #0
	cmp r4, #0
	beq _0803E86C
	ldrb r5, [r4, #1]
	ldr r0, _0803E844  @ gUnknown_0202E4E0
	ldr r1, [r0]
	lsls r0, r5, #2
	adds r0, r0, r1
	ldrb r3, [r4]
	ldr r0, [r0]
	adds r0, r0, r3
	movs r2, #0
	ldrsb r2, [r0, r2]
	ldr r1, [r6]
	movs r0, #0x1d
	ldrsb r0, [r1, r0]
	ldr r1, [r1, #4]
	ldrb r1, [r1, #0x12]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, r0, r1
	cmp r2, r0
	bgt _0803E84C
	movs r0, #1
	str r0, [sp]
	adds r0, r3, #0
	adds r1, r5, #0
	movs r2, #0
	movs r3, #0xff
	bl sub_803BA08
	ldr r1, _0803E848  @ gUnknown_0203AA94
	ldrb r0, [r1, #2]
	ldrb r1, [r1, #3]
	ldrb r3, [r4]
	ldrb r2, [r4, #1]
	str r2, [sp]
	ldrb r2, [r4, #2]
	str r2, [sp, #4]
	movs r2, #0
	str r2, [sp, #8]
	movs r2, #2
	bl sub_8039C20
	movs r0, #1
	b _0803E86E
	.align 2, 0
_0803E840: .4byte gUnknown_03004E50
_0803E844: .4byte gUnknown_0202E4E0
_0803E848: .4byte gUnknown_0203AA94
_0803E84C:
	movs r0, #0
	str r0, [sp]
	adds r0, r3, #0
	adds r1, r5, #0
	movs r2, #0
	movs r3, #0xff
	bl sub_803BA08
	ldr r0, _0803E868  @ gUnknown_0203AA94
	ldrb r0, [r0, #0xa]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	b _0803E86E
	.align 2, 0
_0803E868: .4byte gUnknown_0203AA94
_0803E86C:
	movs r0, #0
_0803E86E:
	add sp, #0xc
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	THUMB_FUNC_START GetEscapePointStructThingMaybe
GetEscapePointStructThingMaybe: @ 0x0803E878
	push {r4, r5, lr}
	movs r1, #0
	movs r5, #0
	ldr r0, _0803E898  @ gUnknown_0202BCF0
	movs r2, #0xe
	ldrsb r2, [r0, r2]
	movs r4, #0xff
	ldrb r0, [r0, #0xf]
	cmp r0, #0x40
	beq _0803E8B0
	cmp r0, #0x40
	bgt _0803E89C
	cmp r0, #0
	beq _0803E8A2
	b _0803E8B8
	.align 2, 0
_0803E898: .4byte gUnknown_0202BCF0
_0803E89C:
	cmp r0, #0x80
	beq _0803E8A6
	b _0803E8B8
_0803E8A2:
	movs r0, #0
	b _0803E8F2
_0803E8A6:
	ldr r1, _0803E8AC  @ gUnknown_085A8188
	b _0803E8B2
	.align 2, 0
_0803E8AC: .4byte gUnknown_085A8188
_0803E8B0:
	ldr r1, _0803E8F8  @ gUnknown_085A828C
_0803E8B2:
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r1, [r0]
_0803E8B8:
	movs r0, #0
	lsls r0, r0, #2
	adds r1, r0, r1
	ldrb r0, [r1]
	cmp r0, #0xff
	beq _0803E8F0
	ldr r0, _0803E8FC  @ gUnknown_0202E4E0
	ldr r3, [r0]
	adds r2, r1, #0
_0803E8CA:
	ldrb r0, [r2, #1]
	lsls r0, r0, #2
	adds r0, r0, r3
	ldrb r1, [r2]
	ldr r0, [r0]
	adds r1, r0, r1
	ldrb r0, [r1]
	cmp r0, #0x78
	bhi _0803E8E8
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r4, r0
	ble _0803E8E8
	ldrb r4, [r1]
	adds r5, r2, #0
_0803E8E8:
	adds r2, #4
	ldrb r0, [r2]
	cmp r0, #0xff
	bne _0803E8CA
_0803E8F0:
	adds r0, r5, #0
_0803E8F2:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0803E8F8: .4byte gUnknown_085A828C
_0803E8FC: .4byte gUnknown_0202E4E0

	THUMB_FUNC_START sub_803E900
sub_803E900: @ 0x0803E900
	push {lr}
	ldr r0, _0803E92C  @ gUnknown_03004E50
	ldr r2, [r0]
	ldr r0, [r2, #0xc]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	bne _0803E934
	ldr r0, _0803E930  @ gUnknown_0203AA94
	ldrb r0, [r0]
	cmp r0, #1
	beq _0803E934
	adds r0, r2, #0
	adds r0, #0x30
	ldrb r1, [r0]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #4
	beq _0803E934
	movs r0, #1
	b _0803E936
	.align 2, 0
_0803E92C: .4byte gUnknown_03004E50
_0803E930: .4byte gUnknown_0203AA94
_0803E934:
	movs r0, #0
_0803E936:
	pop {r1}
	bx r1

	THUMB_FUNC_START sub_803E93C
sub_803E93C: @ 0x0803E93C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	ldr r5, _0803E958  @ gUnknown_03004E50
	ldr r0, [r5]
	bl GetUnitItemCount
	adds r1, r0, #0
	cmp r1, #0
	bne _0803E95C
	movs r0, #0
	b _0803EA48
	.align 2, 0
_0803E958: .4byte gUnknown_03004E50
_0803E95C:
	movs r7, #0
	strh r7, [r4]
	ldr r1, [r5]
	ldrh r5, [r1, #0x1e]
	cmp r5, #0
	beq _0803EA48
	adds r6, r4, #0
	movs r0, #0
	mov r8, r0
_0803E96E:
	adds r0, r5, #0
	bl GetItemAttributes
	adds r1, r0, #0
	movs r2, #5
	ands r1, r2
	cmp r1, #0
	beq _0803EA2A
	adds r0, r5, #0
	bl GetItemAttributes
	adds r1, r0, #0
	movs r2, #0x80
	lsls r2, r2, #3
	ands r1, r2
	cmp r1, #0
	bne _0803EA2A
	ldr r4, _0803EA08  @ gUnknown_03004E50
	ldr r0, [r4]
	adds r1, r5, #0
	bl CanUnitUseAsWeapon
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0803E9B0
	ldr r0, [r4]
	adds r1, r5, #0
	bl CanUnitUseAsStaff
	adds r1, r0, #0
	lsls r1, r1, #0x18
	cmp r1, #0
	beq _0803EA2A
_0803E9B0:
	adds r0, r5, #0
	bl GetItemAttributes
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	beq _0803EA0C
	adds r0, r5, #0
	bl GetItemMinRange
	cmp r0, #1
	ble _0803E9D0
	ldrh r0, [r6]
	movs r1, #2
	orrs r0, r1
	strh r0, [r6]
_0803E9D0:
	adds r0, r5, #0
	bl GetItemMaxRange
	cmp r0, #1
	bne _0803E9E2
	ldrh r0, [r6]
	movs r1, #1
	orrs r0, r1
	strh r0, [r6]
_0803E9E2:
	adds r0, r5, #0
	bl GetItemUses
	movs r1, #0x64
	adds r4, r0, #0
	muls r4, r1, r4
	adds r0, r5, #0
	bl GetItemMaxUses
	adds r1, r0, #0
	adds r0, r4, #0
	bl Div
	adds r4, r0, #0
	cmp r4, #0xa
	bhi _0803EA1A
	ldrh r0, [r6]
	movs r1, #4
	b _0803EA16
	.align 2, 0
_0803EA08: .4byte gUnknown_03004E50
_0803EA0C:
	adds r0, r5, #0
	bl sub_803EC18
	ldrh r0, [r6]
	movs r1, #8
_0803EA16:
	orrs r0, r1
	strh r0, [r6]
_0803EA1A:
	adds r0, r5, #0
	bl GetItemMight
	adds r1, r0, #0
	lsls r1, r1, #8
	ldrh r2, [r6]
	orrs r1, r2
	strh r1, [r6]
_0803EA2A:
	adds r6, #2
	movs r1, #2
	add r8, r1
	adds r7, #1
	cmp r7, #4
	bgt _0803EA48
	movs r1, #0
	strh r1, [r6]
	ldr r1, _0803EA54  @ gUnknown_03004E50
	ldr r1, [r1]
	adds r1, #0x1e
	add r1, r8
	ldrh r5, [r1]
	cmp r5, #0
	bne _0803E96E
_0803EA48:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0803EA54: .4byte gUnknown_03004E50

	THUMB_FUNC_START sub_803EA58
sub_803EA58: @ 0x0803EA58
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x18
	str r0, [sp, #4]
	str r1, [sp, #8]
	str r2, [sp, #0xc]
	str r3, [sp, #0x10]
	movs r0, #0
	ldr r1, [sp, #0x38]
	strh r0, [r1]
	ldr r2, [sp, #0x10]
	strh r0, [r2]
	ldr r3, [sp, #0xc]
	strh r0, [r3]
	ldr r0, _0803EB94  @ gUnknown_0202E4F0
	ldr r0, [r0]
	movs r1, #0
	bl ClearMapWith
	movs r4, #1
_0803EA86:
	adds r0, r4, #0
	bl GetUnitStruct
	adds r5, r0, #0
	adds r4, #1
	str r4, [sp, #0x14]
	cmp r5, #0
	beq _0803EB70
	ldr r0, [r5]
	cmp r0, #0
	beq _0803EB70
	ldr r0, [r5, #0xc]
	movs r1, #0x21
	ands r0, r1
	cmp r0, #0
	bne _0803EB70
	ldr r0, _0803EB98  @ gUnknown_0202BE44
	ldrb r0, [r0]
	movs r1, #0xb
	ldrsb r1, [r5, r1]
	bl AreUnitsAllied
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0803EB70
	adds r0, r5, #0
	ldr r1, [sp, #4]
	ldr r2, [sp, #8]
	bl sub_803EC54
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803EB70
	adds r0, r5, #0
	bl FillMovementMapForUnit
	ldr r4, _0803EB9C  @ gUnknown_0202E4E0
	ldr r1, [r4]
	ldr r2, [sp, #8]
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r3, [sp, #4]
	adds r0, r0, r3
	ldrb r0, [r0]
	cmp r0, #0xff
	beq _0803EB70
	adds r0, r5, #0
	mov r1, sp
	bl StoreItemAndGetUnitAttack
	adds r6, r0, #0
	mov r0, sp
	ldrh r0, [r0]
	bl GetItemMinRange
	cmp r0, #1
	ble _0803EB02
	ldr r1, [sp, #0xc]
	ldrh r0, [r1]
	adds r0, r0, r6
	strh r0, [r1]
_0803EB02:
	mov r0, sp
	ldrh r0, [r0]
	bl GetItemMaxRange
	cmp r0, #1
	bne _0803EB16
	ldr r2, [sp, #0x10]
	ldrh r0, [r2]
	adds r0, r0, r6
	strh r0, [r2]
_0803EB16:
	ldr r1, _0803EBA0  @ gUnknown_0202E4D4
	movs r3, #2
	ldrsh r0, [r1, r3]
	subs r2, r0, #1
	mov sl, r1
	cmp r2, #0
	blt _0803EB70
	mov r9, r4
	ldr r0, _0803EB94  @ gUnknown_0202E4F0
	mov r8, r0
_0803EB2A:
	mov r1, sl
	movs r3, #0
	ldrsh r0, [r1, r3]
	subs r3, r0, #1
	subs r7, r2, #1
	cmp r3, #0
	blt _0803EB6A
	lsls r4, r2, #2
	mov r1, r9
	mov r5, r8
	movs r0, #0xff
	mov ip, r0
_0803EB42:
	ldr r0, [r1]
	adds r0, r4, r0
	ldr r0, [r0]
	adds r0, r0, r3
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _0803EB64
	ldr r0, [r5]
	adds r0, r4, r0
	ldr r0, [r0]
	adds r2, r0, r3
	ldrb r0, [r2]
	adds r0, r0, r6
	cmp r0, #0xff
	ble _0803EB62
	mov r0, ip
_0803EB62:
	strb r0, [r2]
_0803EB64:
	subs r3, #1
	cmp r3, #0
	bge _0803EB42
_0803EB6A:
	adds r2, r7, #0
	cmp r2, #0
	bge _0803EB2A
_0803EB70:
	ldr r4, [sp, #0x14]
	cmp r4, #0xbf
	ble _0803EA86
	ldr r1, [sp, #0x10]
	ldrh r0, [r1]
	ldr r2, [sp, #0xc]
	ldrh r2, [r2]
	adds r0, r0, r2
	ldr r3, [sp, #0x38]
	strh r0, [r3]
	add sp, #0x18
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803EB94: .4byte gUnknown_0202E4F0
_0803EB98: .4byte gUnknown_0202BE44
_0803EB9C: .4byte gUnknown_0202E4E0
_0803EBA0: .4byte gUnknown_0202E4D4

	THUMB_FUNC_START sub_803EBA4
sub_803EBA4: @ 0x0803EBA4
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	movs r5, #1
	negs r5, r5
	movs r4, #0
	movs r3, #0
	movs r7, #0xff
	lsls r7, r7, #8
_0803EBB4:
	ldrh r0, [r1]
	cmp r0, #0
	beq _0803EBCE
	adds r2, r0, #0
	ands r0, r6
	cmp r0, #0
	beq _0803EBCE
	adds r0, r7, #0
	ands r0, r2
	cmp r0, r4
	bls _0803EBCE
	adds r4, r0, #0
	adds r5, r3, #0
_0803EBCE:
	adds r1, #2
	adds r3, #1
	cmp r3, #4
	ble _0803EBB4
	cmp r5, #0
	ble _0803EBE4
	ldr r0, _0803EBEC  @ gUnknown_03004E50
	ldr r0, [r0]
	adds r1, r5, #0
	bl EquipUnitItemByIndex
_0803EBE4:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803EBEC: .4byte gUnknown_03004E50

	THUMB_FUNC_START sub_803EBF0
sub_803EBF0: @ 0x0803EBF0
	push {lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	cmn r1, r0
	beq _0803EC14
	cmp r1, r0
	bcc _0803EC0C
	movs r0, #1
	adds r1, r3, #0
	bl sub_803EBA4
	b _0803EC14
_0803EC0C:
	movs r0, #2
	adds r1, r3, #0
	bl sub_803EBA4
_0803EC14:
	pop {r0}
	bx r0

	THUMB_FUNC_START sub_803EC18
sub_803EC18: @ 0x0803EC18
	push {lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl GetItemIndex
	cmp r0, #0x4b
	blt _0803EC4C
	cmp r0, #0x4f
	ble _0803EC30
	cmp r0, #0x57
	beq _0803EC40
	b _0803EC4C
_0803EC30:
	ldr r0, _0803EC3C  @ gUnknown_03004E50
	ldr r2, [r0]
	ldrb r1, [r2, #0xa]
	movs r0, #4
	b _0803EC48
	.align 2, 0
_0803EC3C: .4byte gUnknown_03004E50
_0803EC40:
	ldr r0, _0803EC50  @ gUnknown_03004E50
	ldr r2, [r0]
	ldrb r1, [r2, #0xa]
	movs r0, #0x10
_0803EC48:
	orrs r0, r1
	strb r0, [r2, #0xa]
_0803EC4C:
	pop {r0}
	bx r0
	.align 2, 0
_0803EC50: .4byte gUnknown_03004E50

	THUMB_FUNC_START sub_803EC54
sub_803EC54: @ 0x0803EC54
	push {r4, r5, lr}
	adds r3, r0, #0
	adds r4, r1, #0
	movs r0, #0x1d
	ldrsb r0, [r3, r0]
	ldr r1, [r3, #4]
	ldrb r1, [r1, #0x12]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r5, r0, r1
	movs r0, #0x10
	ldrsb r0, [r3, r0]
	subs r1, r4, r0
	cmp r1, #0
	bge _0803EC74
	subs r1, r0, r4
_0803EC74:
	movs r0, #0x11
	ldrsb r0, [r3, r0]
	subs r3, r2, r0
	cmp r3, #0
	blt _0803EC82
	adds r0, r1, r3
	b _0803EC86
_0803EC82:
	subs r0, r0, r2
	adds r0, r1, r0
_0803EC86:
	cmp r5, r0
	bge _0803EC8E
	movs r0, #0
	b _0803EC90
_0803EC8E:
	movs r0, #1
_0803EC90:
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_START StoreItemAndGetUnitAttack
StoreItemAndGetUnitAttack: @ 0x0803EC98
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	bl GetUnitEquippedWeapon
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	strh r4, [r6]
	adds r0, r5, #0
	bl GetUnitPower
	adds r5, r0, #0
	adds r0, r4, #0
	bl GetItemMight
	adds r5, r5, r0
	adds r0, r5, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	THUMB_FUNC_START sub_803ECC4
sub_803ECC4: @ 0x0803ECC4
	push {r4, lr}
	ldr r4, _0803ECEC  @ gUnknown_0203AA94
	ldrb r0, [r4]
	cmp r0, #2
	beq _0803ECE6
	ldrb r0, [r4, #2]
	ldrb r1, [r4, #3]
	bl sub_803ED28
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq _0803ECE6
	ldrb r0, [r4, #2]
	ldrb r1, [r4, #3]
	bl sub_803EE4C
_0803ECE6:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0803ECEC: .4byte gUnknown_0203AA94

	THUMB_FUNC_START sub_803ECF0
sub_803ECF0: @ 0x0803ECF0
	push {r4, lr}
	ldr r4, _0803ED24  @ gUnknown_0203AA94
	ldrb r0, [r4, #2]
	ldrb r1, [r4, #3]
	bl sub_803ED28
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq _0803ED1C
	ldrb r0, [r4, #2]
	ldrb r1, [r4, #3]
	bl sub_803EE4C
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq _0803ED1C
	ldrb r0, [r4, #2]
	ldrb r1, [r4, #3]
	bl sub_803EEB0
_0803ED1C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0803ED24: .4byte gUnknown_0203AA94

	THUMB_FUNC_START sub_803ED28
sub_803ED28: @ 0x0803ED28
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	mov sl, r0
	str r1, [sp, #0xc]
	movs r0, #0
	mov r8, r0
	mov r9, r0
	ldr r0, _0803EE08  @ gUnknown_03004E50
	ldr r0, [r0]
	ldr r1, [r0]
	ldr r2, [r0, #4]
	ldr r0, [r1, #0x28]
	ldr r1, [r2, #0x28]
	orrs r0, r1
	movs r1, #0x30
	ands r0, r1
	cmp r0, #0
	beq _0803EE04
	ldr r0, _0803EE0C  @ gUnknown_0202E4E0
	ldr r0, [r0]
	movs r1, #1
	negs r1, r1
	bl ClearMapWith
	mov r0, sl
	ldr r1, [sp, #0xc]
	movs r2, #1
	movs r3, #1
	bl MapAddInRange
	ldr r0, _0803EE10  @ gUnknown_0202E4D4
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r1, r0, #1
	cmp r1, #0
	blt _0803EDFE
_0803ED78:
	ldr r0, _0803EE10  @ gUnknown_0202E4D4
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r4, r0, #1
	subs r7, r1, #1
	cmp r4, #0
	blt _0803EDF8
	lsls r5, r1, #2
_0803ED88:
	ldr r0, _0803EE0C  @ gUnknown_0202E4E0
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _0803EDF2
	ldr r6, _0803EE14  @ gUnknown_0202E4D8
	ldr r0, [r6]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r1, r0, r4
	ldrb r0, [r1]
	cmp r0, #0
	beq _0803EDF2
	ldr r0, _0803EE18  @ gUnknown_0202BE44
	ldrb r0, [r0]
	ldrb r1, [r1]
	bl AreUnitsAllied
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803EDF2
	ldr r0, [r6]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	bl GetUnitStruct
	adds r2, r0, #0
	ldr r0, [r2]
	ldr r1, [r2, #4]
	ldr r0, [r0, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	movs r1, #0x30
	ands r0, r1
	cmp r0, #0
	bne _0803EDF2
	movs r0, #8
	ldrsb r0, [r2, r0]
	cmp r8, r0
	bge _0803EDF2
	ldrb r2, [r2, #8]
	mov r8, r2
	ldr r0, [r6]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	mov r9, r0
_0803EDF2:
	subs r4, #1
	cmp r4, #0
	bge _0803ED88
_0803EDF8:
	adds r1, r7, #0
	cmp r1, #0
	bge _0803ED78
_0803EDFE:
	mov r0, r8
	cmp r0, #0
	bne _0803EE1C
_0803EE04:
	movs r0, #0
	b _0803EE3A
	.align 2, 0
_0803EE08: .4byte gUnknown_03004E50
_0803EE0C: .4byte gUnknown_0202E4E0
_0803EE10: .4byte gUnknown_0202E4D4
_0803EE14: .4byte gUnknown_0202E4D8
_0803EE18: .4byte gUnknown_0202BE44
_0803EE1C:
	mov r1, sl
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	ldr r2, [sp, #0xc]
	lsls r1, r2, #0x10
	asrs r1, r1, #0x10
	movs r2, #0
	str r2, [sp]
	str r2, [sp, #4]
	str r2, [sp, #8]
	movs r2, #7
	mov r3, r9
	bl sub_8039C20
	movs r0, #1
_0803EE3A:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_START sub_803EE4C
sub_803EE4C: @ 0x0803EE4C
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r7, r1, #0
	ldr r0, _0803EEA0  @ gUnknown_03004E50
	ldr r0, [r0]
	ldr r1, [r0]
	ldr r2, [r0, #4]
	ldr r0, [r1, #0x28]
	ldr r1, [r2, #0x28]
	orrs r0, r1
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	beq _0803EE9C
	ldr r4, _0803EEA4  @ gUnknown_0202E4E0
	ldr r0, [r4]
	movs r5, #1
	negs r5, r5
	adds r1, r5, #0
	bl ClearMapWith
	ldr r1, [r4]
	lsls r0, r7, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, r0, r6
	movs r1, #0
	strb r1, [r0]
	adds r0, r6, #0
	adds r1, r7, #0
	movs r2, #1
	movs r3, #0x78
	bl MapAddInRange
	bl sub_803DB60
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, r5
	bne _0803EEA8
_0803EE9C:
	movs r0, #0
	b _0803EEAA
	.align 2, 0
_0803EEA0: .4byte gUnknown_03004E50
_0803EEA4: .4byte gUnknown_0202E4E0
_0803EEA8:
	movs r0, #1
_0803EEAA:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_START sub_803EEB0
sub_803EEB0: @ 0x0803EEB0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	str r0, [sp, #0xc]
	mov sl, r1
	ldr r0, _0803EED4  @ gUnknown_03004E50
	ldr r0, [r0]
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	cmp r7, #0
	bne _0803EF08
	b _0803EFBE
	.align 2, 0
_0803EED4: .4byte gUnknown_03004E50
_0803EED8:
	ldr r0, _0803EF04  @ gUnknown_03004E50
	ldr r0, [r0]
	bl GetUnitEquippedWeaponSlot
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r1, r9
	asrs r2, r1, #0x10
	mov r3, r8
	asrs r1, r3, #0x10
	ldrb r3, [r5, #0xb]
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	str r0, [sp, #8]
	adds r0, r2, #0
	movs r2, #1
	bl sub_8039C20
	movs r0, #1
	b _0803EFC0
	.align 2, 0
_0803EF04: .4byte gUnknown_03004E50
_0803EF08:
	ldr r0, _0803EFD0  @ gUnknown_0202E4E0
	ldr r0, [r0]
	movs r1, #0
	bl ClearMapWith
	ldr r0, [sp, #0xc]
	lsls r0, r0, #0x10
	mov r9, r0
	asrs r6, r0, #0x10
	mov r1, sl
	lsls r1, r1, #0x10
	mov r8, r1
	asrs r5, r1, #0x10
	adds r0, r7, #0
	bl GetItemMinRange
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	adds r0, r7, #0
	bl GetItemMaxRange
	adds r3, r0, #0
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	adds r0, r6, #0
	adds r1, r5, #0
	adds r2, r4, #0
	bl FillRangeMap
	ldr r0, _0803EFD4  @ gUnknown_0202E4D4
	movs r3, #2
	ldrsh r0, [r0, r3]
	subs r7, r0, #1
	cmp r7, #0
	blt _0803EFBE
_0803EF50:
	ldr r0, _0803EFD4  @ gUnknown_0202E4D4
	movs r1, #0
	ldrsh r0, [r0, r1]
	subs r4, r0, #1
	cmp r4, #0
	blt _0803EFB8
	lsls r6, r7, #2
_0803EF5E:
	ldr r0, _0803EFD0  @ gUnknown_0202E4E0
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0803EFB2
	ldr r5, _0803EFD8  @ gUnknown_0202E4D8
	ldr r0, [r5]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r1, r0, r4
	ldrb r0, [r1]
	cmp r0, #0
	beq _0803EFB2
	ldr r0, _0803EFDC  @ gUnknown_0202BE44
	ldrb r0, [r0]
	ldrb r1, [r1]
	bl AreUnitsAllied
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq _0803EFB2
	ldr r0, [r5]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	bl GetUnitStruct
	adds r5, r0, #0
	ldr r0, [sp, #0xc]
	mov r1, sl
	adds r2, r5, #0
	bl sub_803E1EC
	cmp r0, #0
	bne _0803EED8
_0803EFB2:
	subs r4, #1
	cmp r4, #0
	bge _0803EF5E
_0803EFB8:
	subs r7, #1
	cmp r7, #0
	bge _0803EF50
_0803EFBE:
	movs r0, #0
_0803EFC0:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0803EFD0: .4byte gUnknown_0202E4E0
_0803EFD4: .4byte gUnknown_0202E4D4
_0803EFD8: .4byte gUnknown_0202E4D8
_0803EFDC: .4byte gUnknown_0202BE44

.align 2, 0
