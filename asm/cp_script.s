	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	THUMB_FUNC_START AiTryExecScriptA
AiTryExecScriptA: @ 0x0803C4BC
	push {r4, lr}
	ldr r3, _0803C4FC  @ gUnknown_030017D0
	ldr r2, _0803C500  @ gUnknown_085A91E4
	ldr r0, _0803C504  @ gActiveUnit
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
_0803C504: .4byte gActiveUnit
_0803C508: .4byte gUnknown_030017C8
_0803C50C: .4byte gUnknown_030017CC

	THUMB_FUNC_END AiTryExecScriptA

	THUMB_FUNC_START AiExecFallbackScriptA
AiExecFallbackScriptA: @ 0x0803C510
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
	ldr r0, _0803C548  @ gActiveUnit
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
_0803C548: .4byte gActiveUnit

	THUMB_FUNC_END AiExecFallbackScriptA

	THUMB_FUNC_START AiTryExecScriptB
AiTryExecScriptB: @ 0x0803C54C
	push {r4, lr}
	ldr r3, _0803C58C  @ gUnknown_030017D0
	ldr r2, _0803C590  @ gUnknown_085A91D8
	ldr r0, _0803C594  @ gActiveUnit
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
_0803C594: .4byte gActiveUnit
_0803C598: .4byte gUnknown_030017C8
_0803C59C: .4byte gUnknown_030017CC

	THUMB_FUNC_END AiTryExecScriptB

	THUMB_FUNC_START AiExecFallbackScriptB
AiExecFallbackScriptB: @ 0x0803C5A0
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
	ldr r0, _0803C5D8  @ gActiveUnit
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
_0803C5D8: .4byte gActiveUnit

	THUMB_FUNC_END AiExecFallbackScriptB

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
	ldr r1, _0803C640  @ gAiState
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
_0803C640: .4byte gAiState
_0803C644: .4byte gUnknown_030017D0

	THUMB_FUNC_END sub_803C5DC

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
	bl AiCompare
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _0803C6D4
	ldr r0, _0803C67C  @ gUnknown_030017CC
	ldr r0, [r0]
	cmp r0, #0
	bne _0803C688
	ldr r1, _0803C680  @ gUnknown_085A91E4
	ldr r0, _0803C684  @ gActiveUnit
	ldr r0, [r0]
	adds r0, #0x42
	b _0803C690
	.align 2, 0
_0803C678: .4byte gUnknown_030017D0
_0803C67C: .4byte gUnknown_030017CC
_0803C680: .4byte gUnknown_085A91E4
_0803C684: .4byte gActiveUnit
_0803C688:
	ldr r1, _0803C6A8  @ gUnknown_085A91D8
	ldr r0, _0803C6AC  @ gActiveUnit
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
_0803C6AC: .4byte gActiveUnit
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

	THUMB_FUNC_END sub_803C648

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

	THUMB_FUNC_END sub_803C6EC

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
	ldr r1, _0803C780  @ gActiveUnit
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
	ldr r1, _0803C780  @ gActiveUnit
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
	ldr r0, _0803C788  @ gAiState
	adds r0, #0x79
	movs r1, #0
	strb r1, [r0]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803C77C: .4byte gUnknown_030017D0
_0803C780: .4byte gActiveUnit
_0803C784: .4byte gUnknown_030017CC
_0803C788: .4byte gAiState

	THUMB_FUNC_END sub_803C71C

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
	ldr r0, _0803C7B8  @ gActiveUnit
	ldr r0, [r0]
	adds r0, #0x42
	b _0803C7C4
	.align 2, 0
_0803C7AC: .4byte gUnknown_030017D0
_0803C7B0: .4byte gUnknown_030017CC
_0803C7B4: .4byte gUnknown_085A91E4
_0803C7B8: .4byte gActiveUnit
_0803C7BC:
	ldr r1, _0803C7DC  @ gUnknown_085A91D8
	ldr r0, _0803C7E0  @ gActiveUnit
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
_0803C7E0: .4byte gActiveUnit
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

	THUMB_FUNC_END sub_803C78C

	THUMB_FUNC_START sub_803C818
sub_803C818: @ 0x0803C818
	push {lr}
	adds r1, r0, #0
	ldr r0, _0803C83C  @ gActiveUnit
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
_0803C83C: .4byte gActiveUnit
_0803C840:
	movs r0, #0
_0803C842:
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_803C818

	THUMB_FUNC_START sub_803C848
sub_803C848: @ 0x0803C848
	push {lr}
	ldr r1, _0803C858  @ gActiveUnit
	ldr r1, [r1]
	cmp r0, r1
	beq _0803C85C
	movs r0, #1
	b _0803C85E
	.align 2, 0
_0803C858: .4byte gActiveUnit
_0803C85C:
	movs r0, #0
_0803C85E:
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_803C848

	THUMB_FUNC_START sub_803C864
sub_803C864: @ 0x0803C864
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0803C89C  @ gUnknown_030017D0
	ldr r0, [r0]
	ldr r0, [r0, #8]
	ldr r1, [r4]
	ldrb r1, [r1, #4]
	bl AiIsInShortList
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq _0803C8A4
	ldr r0, _0803C8A0  @ gActiveUnit
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
_0803C8A0: .4byte gActiveUnit
_0803C8A4:
	movs r0, #0
_0803C8A6:
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_803C864

	THUMB_FUNC_START sub_803C8AC
sub_803C8AC: @ 0x0803C8AC
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0803C8E4  @ gUnknown_030017D0
	ldr r0, [r0]
	ldr r0, [r0, #8]
	ldr r1, [r4]
	ldrb r1, [r1, #4]
	bl AiIsInShortList
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq _0803C8DE
	ldr r0, _0803C8E8  @ gActiveUnit
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
_0803C8E8: .4byte gActiveUnit
_0803C8EC:
	movs r0, #0
_0803C8EE:
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_803C8AC

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
	ldr r0, _0803C928  @ gActiveUnit
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
_0803C928: .4byte gActiveUnit
_0803C92C:
	movs r0, #0
_0803C92E:
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_803C8F4

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
	ldr r0, _0803C968  @ gActiveUnit
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
_0803C968: .4byte gActiveUnit
_0803C96C:
	movs r0, #0
_0803C96E:
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_803C934

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
	bl AiUnitWithCharIdExists
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _0803C9DC
	ldr r0, [r5]
	ldr r0, [r0, #4]
	bl GetUnitFromCharId
	ldr r0, [r0, #0xc]
	movs r1, #0x20
	ands r0, r1
	cmp r0, #0
	beq _0803C9D0
	ldr r0, _0803C9CC  @ gAiState
	adds r0, #0x86
	movs r1, #3
	b _0803C9E2
	.align 2, 0
_0803C9C4: .4byte gUnknown_030017D0
_0803C9C8: .4byte sub_803C818
_0803C9CC: .4byte gAiState
_0803C9D0:
	ldr r0, _0803C9D8  @ sub_803C8F4
	bl sub_803D450
	b _0803C9FC
	.align 2, 0
_0803C9D8: .4byte sub_803C8F4
_0803C9DC:
	ldr r0, _0803C9EC  @ gAiState
	adds r0, #0x86
	movs r1, #1
_0803C9E2:
	strb r1, [r0]
	ldr r0, _0803C9F0  @ gUnknown_030017C8
	strb r4, [r0]
	b _0803C9FC
	.align 2, 0
_0803C9EC: .4byte gAiState
_0803C9F0: .4byte gUnknown_030017C8
_0803C9F4:
	ldr r0, _0803CA08  @ gAiState
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
_0803CA08: .4byte gAiState

	THUMB_FUNC_END sub_803C974

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
	ldr r0, _0803CA78  @ gAiState
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
_0803CA78: .4byte gAiState

	THUMB_FUNC_END sub_803CA0C

	THUMB_FUNC_START sub_803CA7C
sub_803CA7C: @ 0x0803CA7C
	ldrb r1, [r0]
	adds r1, #1
	strb r1, [r0]
	bx lr

	THUMB_FUNC_END sub_803CA7C

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
	ldr r1, _0803CAC4  @ gAiState
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
_0803CAC4: .4byte gAiState
_0803CAC8: .4byte sub_803C818
_0803CACC:
	ldr r0, _0803CAE0  @ gAiState
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
_0803CAE0: .4byte gAiState

	THUMB_FUNC_END sub_803CA84

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
	ldr r0, _0803CB30  @ gAiState
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
_0803CB30: .4byte gAiState

	THUMB_FUNC_END sub_803CAE4

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

	THUMB_FUNC_END sub_803CB34

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

	THUMB_FUNC_END sub_803CB50

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

	THUMB_FUNC_END sub_803CB6C

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
	bl AiTryMoveTowards
	ldr r1, _0803CBD0  @ gAiDecision
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
_0803CBD0: .4byte gAiDecision

	THUMB_FUNC_END sub_803CB88

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
	bl AiFindTargetInReachByCharId
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
	bl AiTryMoveTowards
	add r0, sp, #4
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r2, #2
	ldrsh r1, [r5, r2]
	ldr r5, _0803CC48  @ gAiDecision
	ldrb r2, [r5, #2]
	ldrb r3, [r5, #3]
	str r4, [sp]
	bl AiIsWithinRectDistance
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _0803CC7E
	ldr r0, [r6]
	ldr r0, [r0, #4]
	bl GetUnitFromCharId
	adds r1, r0, #0
	ldr r4, [r1, #0xc]
	movs r0, #0x20
	ands r4, r0
	cmp r4, #0
	beq _0803CC50
	ldr r0, _0803CC4C  @ gAiState
	adds r0, #0x86
	movs r1, #3
	strb r1, [r0]
	b _0803CC7E
	.align 2, 0
_0803CC44: .4byte gUnknown_030017D0
_0803CC48: .4byte gAiDecision
_0803CC4C: .4byte gAiState
_0803CC50:
	ldrb r0, [r1, #0xb]
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl AiUpdateDecision
	ldr r0, _0803CC70  @ gAiState
	adds r0, #0x86
	movs r1, #2
	strb r1, [r0]
	strb r4, [r5, #0xa]
	ldr r0, _0803CC74  @ gUnknown_030017C8
	strb r4, [r0]
	b _0803CC7E
	.align 2, 0
_0803CC70: .4byte gAiState
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

	THUMB_FUNC_END sub_803CBD4

	THUMB_FUNC_START sub_803CC90
sub_803CC90: @ 0x0803CC90
	ldrb r1, [r0]
	adds r1, #1
	strb r1, [r0]
	bx lr

	THUMB_FUNC_END sub_803CC90

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
	bl AiFindTargetInReachByClassId
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
	bl AiTryMoveTowards
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

	THUMB_FUNC_END sub_803CC98

	THUMB_FUNC_START sub_803CCDC
sub_803CCDC: @ 0x0803CCDC
	push {r4, r5, lr}
	sub sp, #0x14
	adds r5, r0, #0
	bl AiTryDoSpecialItems
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _0803CD2C
	ldr r3, _0803CD20  @ gUnknown_030017D0
	ldr r0, [r3]
	ldrb r0, [r0, #3]
	cmp r0, #0
	beq _0803CDC8
	ldr r2, _0803CD24  @ gActiveUnit
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
_0803CD24: .4byte gActiveUnit
_0803CD28: .4byte gUnknown_030017C8
_0803CD2C:
	add r4, sp, #0x10
	adds r0, r4, #0
	add r1, sp, #0xc
	bl AiFindPillageLocation
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
	bl AiTryMoveTowards
	ldr r4, _0803CDAC  @ gAiDecision
	ldrb r0, [r4, #2]
	ldrb r1, [r4, #3]
	bl AiLocationIsPillageTarget
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
	bl AiSetDecision
	ldr r3, _0803CDB0  @ gUnknown_030017D0
	ldr r0, [r3]
	ldrb r0, [r0, #3]
	cmp r0, #0
	beq _0803CDC8
	ldr r2, _0803CDB4  @ gActiveUnit
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
_0803CDAC: .4byte gAiDecision
_0803CDB0: .4byte gUnknown_030017D0
_0803CDB4: .4byte gActiveUnit
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

	THUMB_FUNC_END sub_803CCDC

	THUMB_FUNC_START sub_803CDD4
sub_803CDD4: @ 0x0803CDD4
	push {r4, r5, lr}
	sub sp, #0x10
	adds r5, r0, #0
	ldr r0, _0803CE14  @ gActiveUnit
	ldr r0, [r0]
	add r4, sp, #0xc
	adds r1, r4, #0
	bl AiFindSafestReachableLocation
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
	bl AiSetDecision
_0803CE06:
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
	add sp, #0x10
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0803CE14: .4byte gActiveUnit

	THUMB_FUNC_END sub_803CDD4

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
	bl AiFindTargetInReachByFunc
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
	bl AiTryMoveTowards
	b _0803CE84
	.align 2, 0
_0803CE54: .4byte gUnknown_030017D0
_0803CE58: .4byte sub_803C818
_0803CE5C:
	ldr r0, _0803CE94  @ sub_803C864
	add r5, sp, #4
	adds r1, r5, #0
	bl AiFindTargetInReachByFunc
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
	bl AiTryMoveTowards
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

	THUMB_FUNC_END sub_803CE18

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

	THUMB_FUNC_END sub_803CE98

	THUMB_FUNC_START sub_803CF18
sub_803CF18: @ 0x0803CF18
	ldrb r1, [r0]
	adds r1, #1
	strb r1, [r0]
	bx lr

	THUMB_FUNC_END sub_803CF18

	THUMB_FUNC_START sub_803CF20
sub_803CF20: @ 0x0803CF20
	ldrb r1, [r0]
	adds r1, #1
	strb r1, [r0]
	bx lr

	THUMB_FUNC_END sub_803CF20

	THUMB_FUNC_START sub_803CF28
sub_803CF28: @ 0x0803CF28
	push {r4, lr}
	adds r4, r0, #0
	bl AiRandomMove
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_803CF28

	THUMB_FUNC_START sub_803CF3C
sub_803CF3C: @ 0x0803CF3C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0803CF5C  @ gActiveUnit
	ldr r2, [r0]
	ldrb r1, [r2, #0xa]
	movs r0, #8
	orrs r0, r1
	strb r0, [r2, #0xa]
	bl AiTryMoveTowardsEscape
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0803CF5C: .4byte gActiveUnit

	THUMB_FUNC_END sub_803CF3C

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
	ldr r0, _0803CFA8  @ gBmMapMovement
	ldr r0, [r0]
	lsls r5, r5, #2
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r6
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r4, r4, r0
	ldr r0, _0803CFAC  @ gBmMapOther
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
_0803CFA8: .4byte gBmMapMovement
_0803CFAC: .4byte gBmMapOther
_0803CFB0: .4byte 0x7FFFFFFF

	THUMB_FUNC_END sub_803CF60

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
	ldr r4, _0803D0F8  @ gActiveUnit
	ldr r0, [r4]
	bl GenerateUnitMovementMap
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
	ldr r0, _0803D0F8  @ gActiveUnit
	ldr r0, [r0]
	mov r1, r8
	bl CanUnitUseWeapon
	lsls r0, r0, #0x18
	ldr r1, [sp, #8]
	adds r1, #1
	mov r9, r1
	cmp r0, #0
	beq _0803D0C4
	ldr r0, _0803D0FC  @ gBmMapRange
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFill
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
	bl MapAddInBoundedRange
	ldr r0, _0803D100  @ gBmMapSize
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r6, r0, #1
	cmp r6, #0
	blt _0803D0C4
_0803D044:
	ldr r0, _0803D100  @ gBmMapSize
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r5, r0, #1
	subs r0, r6, #1
	mov sl, r0
	cmp r5, #0
	blt _0803D0BE
	lsls r7, r6, #2
_0803D056:
	ldr r0, _0803D104  @ gBmMapMovement
	ldr r0, [r0]
	adds r0, r7, r0
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _0803D0B8
	ldr r0, _0803D0FC  @ gBmMapRange
	ldr r0, [r0]
	adds r0, r7, r0
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0803D0B8
	ldr r0, _0803D108  @ gBmMapUnit
	ldr r0, [r0]
	adds r0, r7, r0
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r1, [r0]
	cmp r1, #0
	beq _0803D092
	ldr r0, _0803D10C  @ gActiveUnitId
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
	ldr r0, _0803D0F8  @ gActiveUnit
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
_0803D0F8: .4byte gActiveUnit
_0803D0FC: .4byte gBmMapRange
_0803D100: .4byte gBmMapSize
_0803D104: .4byte gBmMapMovement
_0803D108: .4byte gBmMapUnit
_0803D10C: .4byte gActiveUnitId
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

	THUMB_FUNC_END sub_803CFB4

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
	ldr r0, _0803D200  @ gBmMapSize
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r5, r0, #1
	cmp r5, #0
	blt _0803D1F6
_0803D146:
	ldr r0, _0803D200  @ gBmMapSize
	movs r1, #0
	ldrsh r0, [r0, r1]
	subs r4, r0, #1
	subs r0, r5, #1
	mov sl, r0
	cmp r4, #0
	blt _0803D1F0
	lsls r6, r5, #2
_0803D158:
	ldr r0, _0803D204  @ gBmMapRange
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _0803D1EA
	ldr r0, _0803D208  @ gBmMapTerrain
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r1, [r0]
	ldr r0, [sp]
	bl AiIsInByteList
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803D1EA
	movs r0, #1
	mov r1, r8
	ands r0, r1
	cmp r0, #0
	beq _0803D1B0
	ldr r0, _0803D20C  @ gBmMapUnit
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r1, r0, r4
	ldrb r0, [r1]
	cmp r0, #0
	beq _0803D1B0
	ldr r0, _0803D210  @ gActiveUnit
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
	bl AiCountNearbyEnemyUnits
	cmp r0, #0
	bne _0803D1EA
_0803D1CA:
	ldr r0, _0803D204  @ gBmMapRange
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
_0803D200: .4byte gBmMapSize
_0803D204: .4byte gBmMapRange
_0803D208: .4byte gBmMapTerrain
_0803D20C: .4byte gBmMapUnit
_0803D210: .4byte gActiveUnit
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

	THUMB_FUNC_END sub_803D124

	THUMB_FUNC_START sub_803D228
sub_803D228: @ 0x0803D228
	push {r4, r5, r6, r7, lr}
	sub sp, #0x18
	adds r7, r0, #0
	ldr r0, _0803D298  @ gActiveUnit
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
	bl AiSetDecision
	b _0803D2C2
	.align 2, 0
_0803D298: .4byte gActiveUnit
_0803D29C: .4byte gUnknown_085A814C
_0803D2A0:
	movs r1, #0
	ldrsh r0, [r4, r1]
	movs r2, #2
	ldrsh r1, [r4, r2]
	str r6, [sp]
	movs r2, #0
	movs r3, #0xff
	bl AiTryMoveTowards
	b _0803D2C2
_0803D2B4:
	ldr r0, _0803D2D0  @ gAiState
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
_0803D2D0: .4byte gAiState
_0803D2D4: .4byte gUnknown_030017C8

	THUMB_FUNC_END sub_803D228

	THUMB_FUNC_START sub_803D2D8
sub_803D2D8: @ 0x0803D2D8
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r7, r0, #0
	ldr r0, _0803D328  @ gActiveUnit
	ldr r0, [r0]
	movs r4, #0x10
	ldrsb r4, [r0, r4]
	movs r5, #0x11
	ldrsb r5, [r0, r5]
	bl GetUnitMovementCost
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	bl GenerateExtendedMovementMapOnRange
	ldr r6, _0803D32C  @ gUnknown_030017D0
	ldr r0, [r6]
	adds r0, #3
	add r5, sp, #4
	movs r1, #0
	adds r2, r5, #0
	bl AiFindClosestTerrainPosition
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
	bl AiTryMoveTowards
	b _0803D33E
	.align 2, 0
_0803D328: .4byte gActiveUnit
_0803D32C: .4byte gUnknown_030017D0
_0803D330:
	ldr r0, _0803D34C  @ gAiState
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
_0803D34C: .4byte gAiState
_0803D350: .4byte gUnknown_030017C8

	THUMB_FUNC_END sub_803D2D8

	THUMB_FUNC_START sub_803D354
sub_803D354: @ 0x0803D354
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r7, r0, #0
	ldr r0, _0803D3A4  @ gActiveUnit
	ldr r0, [r0]
	movs r4, #0x10
	ldrsb r4, [r0, r4]
	movs r5, #0x11
	ldrsb r5, [r0, r5]
	bl GetUnitMovementCost
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	bl GenerateExtendedMovementMapOnRange
	ldr r6, _0803D3A8  @ gUnknown_030017D0
	ldr r0, [r6]
	ldr r0, [r0, #8]
	add r5, sp, #4
	movs r1, #0
	adds r2, r5, #0
	bl AiFindClosestTerrainPosition
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
	bl AiTryMoveTowards
	b _0803D3BA
	.align 2, 0
_0803D3A4: .4byte gActiveUnit
_0803D3A8: .4byte gUnknown_030017D0
_0803D3AC:
	ldr r0, _0803D3C8  @ gAiState
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
_0803D3C8: .4byte gAiState
_0803D3CC: .4byte gUnknown_030017C8

	THUMB_FUNC_END sub_803D354

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

	THUMB_FUNC_END sub_803D3D0

	THUMB_FUNC_START AiDoBerserkAction
AiDoBerserkAction: @ 0x0803D3E4
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

	THUMB_FUNC_END AiDoBerserkAction

	THUMB_FUNC_START AiDoBerserkMove
AiDoBerserkMove: @ 0x0803D404
	push {r4, lr}
	sub sp, #8
	ldr r0, _0803D438  @ sub_803C848
	add r4, sp, #4
	adds r1, r4, #0
	bl AiFindTargetInReachByFunc
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
	bl AiTryMoveTowards
_0803D42E:
	add sp, #8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0803D438: .4byte sub_803C848

	THUMB_FUNC_END AiDoBerserkMove

	THUMB_FUNC_START sub_803D43C
sub_803D43C: @ 0x0803D43C
	movs r0, #1
	bx lr

	THUMB_FUNC_END sub_803D43C

	THUMB_FUNC_START sub_803D440
sub_803D440: @ 0x0803D440
	push {lr}
	ldrb r0, [r0]
	bl AiGetClassRank
	movs r0, #1
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_803D440

.align 2, 0
