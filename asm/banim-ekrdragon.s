	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	THUMB_FUNC_START sub_8070710
sub_8070710: @ 0x08070710
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	str r0, [sp]
	adds r6, r1, #0
	ldr r0, [sp, #0x24]
	lsls r2, r2, #0x10
	lsrs r1, r2, #0x10
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	movs r4, #0x1f
	movs r0, #0x1f
	ands r1, r0
	adds r0, r1, #0
	muls r0, r3, r0
	mov sl, r0
	lsrs r0, r2, #0x15
	ands r0, r4
	adds r1, r0, #0
	muls r1, r3, r1
	mov r9, r1
	lsrs r2, r2, #0x1a
	ands r2, r4
	adds r4, r2, #0
	muls r4, r3, r4
	mov r8, r4
	movs r7, #0x1f
	mov ip, r7
	movs r2, #0xf
_08070754:
	ldr r0, [sp]
	ldrh r1, [r0]
	movs r0, #0x1f
	ands r0, r1
	adds r3, r0, #0
	muls r3, r5, r3
	lsls r1, r1, #0x10
	lsrs r0, r1, #0x15
	mov r4, ip
	ands r0, r4
	adds r4, r0, #0
	muls r4, r5, r4
	lsrs r1, r1, #0x1a
	mov r7, ip
	ands r1, r7
	muls r1, r5, r1
	mov r7, sl
	adds r0, r3, r7
	lsrs r3, r0, #4
	mov r7, r9
	adds r0, r4, r7
	lsrs r4, r0, #4
	mov r7, r8
	adds r0, r1, r7
	lsrs r1, r0, #4
	cmp r3, #0x1f
	bls _0807078C
	movs r3, #0x1f
_0807078C:
	cmp r4, #0x1f
	bls _08070792
	movs r4, #0x1f
_08070792:
	cmp r1, #0x1f
	bls _08070798
	movs r1, #0x1f
_08070798:
	lsls r0, r4, #5
	orrs r3, r0
	lsls r0, r1, #0xa
	orrs r3, r0
	strh r3, [r6]
	ldr r0, [sp]
	adds r0, #2
	str r0, [sp]
	adds r6, #2
	subs r2, #1
	cmp r2, #0
	bge _08070754
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8070710

	THUMB_FUNC_START sub_80707C0
sub_80707C0: @ 0x080707C0
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0
	str r0, [r4, #0x2c]
	str r0, [r4, #0x30]
	ldr r1, _080707F8  @ gLCDControlBuffer
	adds r0, r1, #0
	adds r0, #0x44
	ldrb r2, [r0]
	adds r0, r4, #0
	adds r0, #0x3c
	strb r2, [r0]
	adds r1, #0x45
	ldrb r0, [r1]
	adds r1, r4, #0
	adds r1, #0x3d
	strb r0, [r1]
	bl GetEkrDragonPalette
	str r0, [r4, #0x34]
	bl SetDefaultColorEffects_
	bl SpellFx_ClearBG1
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080707F8: .4byte gLCDControlBuffer

	THUMB_FUNC_END sub_80707C0

	THUMB_FUNC_START sub_80707FC
sub_80707FC: @ 0x080707FC
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r6, r0, #0
	ldr r0, [r6, #0x34]
	ldr r4, _08070870  @ gPaletteBuffer+0xC0
	ldr r1, [r6, #0x30]
	ldr r2, [r6, #0x38]
	lsls r1, r1, #1
	adds r1, r1, r2
	ldrh r2, [r1]
	adds r5, r6, #0
	adds r5, #0x3c
	ldrb r3, [r5]
	adds r7, r6, #0
	adds r7, #0x3d
	ldrb r1, [r7]
	str r1, [sp]
	adds r1, r4, #0
	bl sub_8070710
	ldr r0, [r6, #0x34]
	movs r1, #0x88
	lsls r1, r1, #2
	adds r4, r4, r1
	ldr r1, [r6, #0x30]
	ldr r2, [r6, #0x38]
	lsls r1, r1, #1
	adds r1, r1, r2
	ldrh r2, [r1]
	ldrb r3, [r5]
	ldrb r1, [r7]
	str r1, [sp]
	adds r1, r4, #0
	bl sub_8070710
	bl EnablePaletteSync
	ldr r0, [r6, #0x2c]
	adds r0, #1
	str r0, [r6, #0x2c]
	ldr r0, [r6, #0x30]
	adds r0, #1
	str r0, [r6, #0x30]
	ldr r1, [r6, #0x38]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #8
	cmp r1, r0
	bne _08070866
	movs r0, #0
	str r0, [r6, #0x30]
_08070866:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08070870: .4byte gPaletteBuffer+0xC0

	THUMB_FUNC_END sub_80707FC
