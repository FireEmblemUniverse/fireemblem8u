	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	THUMB_FUNC_START sub_80C9A94
sub_80C9A94: @ 0x080C9A94
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r2, _080C9AEC  @ gLCDControlBuffer
	ldrb r1, [r2, #1]
	movs r0, #2
	negs r0, r0
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #9
	negs r1, r1
	ands r0, r1
	subs r1, #8
	ands r0, r1
	strb r0, [r2, #1]
	ldrh r3, [r4, #0x2a]
	movs r0, #0x30
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0xd
	bl Interpolate
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	movs r0, #1
	movs r2, #0x10
	movs r3, #8
	bl SetBlendConfig
	ldrh r0, [r4, #0x2a]
	cmp r0, #0x30
	bne _080C9AF0
	movs r0, #0
	strh r0, [r4, #0x2a]
	adds r0, r4, #0
	bl Proc_Break
	b _080C9AF4
	.align 2, 0
_080C9AEC: .4byte gLCDControlBuffer
_080C9AF0:
	adds r0, #1
	strh r0, [r4, #0x2a]
_080C9AF4:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80C9A94

	THUMB_FUNC_START sub_80C9AFC
sub_80C9AFC: @ 0x080C9AFC
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r7, r0, #0
	ldrh r3, [r7, #0x2a]
	movs r0, #0x30
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0x10
	bl Interpolate
	adds r4, r0, #0
	ldr r0, _080C9B50  @ pal_08B103D8
	movs r2, #0x80
	lsls r2, r2, #1
	movs r1, #0
	bl CopyToPalOpAnim
	ldr r5, _080C9B54  @ gPaletteBuffer
	lsls r6, r4, #0x10
	movs r4, #7
_080C9B26:
	adds r0, r5, #0
	ldr r1, _080C9B58  @ 0x00007FFF
	lsrs r2, r6, #0x10
	bl sub_80C69B0
	adds r5, #0x20
	subs r4, #1
	cmp r4, #0
	bge _080C9B26
	ldrh r0, [r7, #0x2a]
	cmp r0, #0x30
	bne _080C9B60
	ldr r0, _080C9B5C  @ gOpAnimSt
	movs r2, #0
	ldr r1, _080C9B58  @ 0x00007FFF
	strh r1, [r0, #0xc]
	strh r2, [r7, #0x2a]
	adds r0, r7, #0
	bl Proc_Break
	b _080C9B64
	.align 2, 0
_080C9B50: .4byte pal_08B103D8
_080C9B54: .4byte gPaletteBuffer
_080C9B58: .4byte 0x00007FFF
_080C9B5C: .4byte gOpAnimSt
_080C9B60:
	adds r0, #1
	strh r0, [r7, #0x2a]
_080C9B64:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80C9AFC

	THUMB_FUNC_START sub_80C9B6C
sub_80C9B6C: @ 0x080C9B6C
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #4
	ldr r4, _080C9C04  @ gLCDControlBuffer
	ldrb r2, [r4, #0xc]
	movs r1, #4
	negs r1, r1
	adds r0, r1, #0
	ands r0, r2
	strb r0, [r4, #0xc]
	ldrb r2, [r4, #0x10]
	adds r0, r1, #0
	ands r0, r2
	movs r2, #1
	mov r8, r2
	mov r2, r8
	orrs r0, r2
	strb r0, [r4, #0x10]
	ldrb r0, [r4, #0x14]
	ands r1, r0
	movs r6, #2
	orrs r1, r6
	strb r1, [r4, #0x14]
	ldrb r0, [r4, #0x18]
	movs r1, #3
	orrs r0, r1
	strb r0, [r4, #0x18]
	movs r0, #1
	movs r1, #0x10
	movs r2, #0
	movs r3, #8
	bl SetBlendConfig
	movs r5, #0
	str r5, [sp]
	movs r0, #0
	movs r1, #1
	movs r2, #0
	movs r3, #0
	bl SetBlendTargetA
	str r5, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #1
	bl SetBlendTargetB
	ldrb r0, [r4, #1]
	mov r1, r8
	orrs r0, r1
	orrs r0, r6
	movs r1, #5
	negs r1, r1
	ands r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r4, #1]
	movs r0, #1
	movs r1, #0
	bl SetBackgroundTileDataOffset
	movs r1, #0xe0
	lsls r1, r1, #8
	movs r0, #1
	bl SetBackgroundMapDataOffset
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080C9C04: .4byte gLCDControlBuffer

	THUMB_FUNC_END sub_80C9B6C

	THUMB_FUNC_START sub_80C9C08
sub_80C9C08: @ 0x080C9C08
	push {r4, lr}
	adds r4, r0, #0
	bl sub_80C9B6C
	ldr r0, _080C9C54  @ Pal_OpAnimJoshua
	movs r2, #0xb0
	lsls r2, r2, #1
	movs r1, #0
	bl CopyToPalOpAnim
	adds r1, r4, #0
	adds r1, #0x47
	movs r2, #0
	movs r0, #1
	strb r0, [r1]
	ldr r0, _080C9C58  @ gGenericBuffer
	str r0, [r4, #0x48]
	movs r1, #0x80
	lsls r1, r1, #4
	adds r0, r0, r1
	str r0, [r4, #0x4c]
	adds r1, r4, #0
	adds r1, #0x44
	movs r0, #0x8c
	lsls r0, r0, #1
	strh r0, [r1]
	adds r0, r4, #0
	adds r0, #0x42
	movs r1, #0xe8
	strh r1, [r0]
	subs r0, #2
	strh r1, [r0]
	strh r2, [r4, #0x30]
	strh r2, [r4, #0x32]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C9C54: .4byte Pal_OpAnimJoshua
_080C9C58: .4byte gGenericBuffer

	THUMB_FUNC_END sub_80C9C08

	THUMB_FUNC_START sub_80C9C5C
sub_80C9C5C: @ 0x080C9C5C
	push {r4, lr}
	adds r4, r0, #0
	bl sub_80C9B6C
	ldr r0, _080C9CA4  @ Pal_OpAnimLArachel
	movs r2, #0xb0
	lsls r2, r2, #1
	movs r1, #0
	bl CopyToPalOpAnim
	adds r0, r4, #0
	adds r0, #0x47
	movs r2, #0
	strb r2, [r0]
	ldr r0, _080C9CA8  @ gGenericBuffer
	str r0, [r4, #0x48]
	movs r1, #0x80
	lsls r1, r1, #4
	adds r0, r0, r1
	str r0, [r4, #0x4c]
	adds r1, r4, #0
	adds r1, #0x44
	movs r0, #0xc0
	strh r0, [r1]
	subs r1, #2
	adds r0, #0x80
	strh r0, [r1]
	subs r1, #2
	subs r0, #0x38
	strh r0, [r1]
	strh r2, [r4, #0x30]
	strh r2, [r4, #0x32]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C9CA4: .4byte Pal_OpAnimLArachel
_080C9CA8: .4byte gGenericBuffer

	THUMB_FUNC_END sub_80C9C5C

	THUMB_FUNC_START sub_80C9CAC
sub_80C9CAC: @ 0x080C9CAC
	push {r4, lr}
	adds r4, r0, #0
	bl sub_80C9B6C
	ldr r0, _080C9CF4  @ Pal_OpAnimCharacterSeth
	movs r2, #0xb0
	lsls r2, r2, #1
	movs r1, #0
	bl CopyToPalOpAnim
	adds r1, r4, #0
	adds r1, #0x47
	movs r2, #0
	movs r0, #1
	strb r0, [r1]
	ldr r0, _080C9CF8  @ gGenericBuffer
	str r0, [r4, #0x48]
	movs r1, #0x80
	lsls r1, r1, #4
	adds r0, r0, r1
	str r0, [r4, #0x4c]
	adds r1, r4, #0
	adds r1, #0x44
	movs r0, #0xc0
	strh r0, [r1]
	subs r1, #2
	adds r0, #0x80
	strh r0, [r1]
	subs r1, #2
	subs r0, #0x28
	strh r0, [r1]
	strh r2, [r4, #0x30]
	strh r2, [r4, #0x32]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C9CF4: .4byte Pal_OpAnimCharacterSeth
_080C9CF8: .4byte gGenericBuffer

	THUMB_FUNC_END sub_80C9CAC

	THUMB_FUNC_START sub_80C9CFC
sub_80C9CFC: @ 0x080C9CFC
	push {r4, lr}
	adds r4, r0, #0
	bl sub_80C9B6C
	ldr r0, _080C9D44  @ Pal_OpAnimMyrrh2
	movs r2, #0xb0
	lsls r2, r2, #1
	movs r1, #0
	bl CopyToPalOpAnim
	adds r0, r4, #0
	adds r0, #0x47
	movs r2, #0
	strb r2, [r0]
	ldr r0, _080C9D48  @ gGenericBuffer
	str r0, [r4, #0x48]
	movs r1, #0x80
	lsls r1, r1, #4
	adds r0, r0, r1
	str r0, [r4, #0x4c]
	adds r1, r4, #0
	adds r1, #0x44
	movs r0, #0x88
	lsls r0, r0, #1
	strh r0, [r1]
	subs r1, #2
	movs r0, #0xf0
	strh r0, [r1]
	subs r1, #2
	adds r0, #0x18
	strh r0, [r1]
	strh r2, [r4, #0x30]
	strh r2, [r4, #0x32]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C9D44: .4byte Pal_OpAnimMyrrh2
_080C9D48: .4byte gGenericBuffer

	THUMB_FUNC_END sub_80C9CFC

	THUMB_FUNC_START sub_80C9D4C
sub_80C9D4C: @ 0x080C9D4C
	push {r4, lr}
	adds r4, r0, #0
	bl sub_80C9B6C
	ldr r0, _080C9D98  @ Pal_OpAnimSaleh2
	movs r2, #0xb0
	lsls r2, r2, #1
	movs r1, #0
	bl CopyToPalOpAnim
	adds r1, r4, #0
	adds r1, #0x47
	movs r2, #0
	movs r0, #1
	strb r0, [r1]
	ldr r0, _080C9D9C  @ gGenericBuffer
	str r0, [r4, #0x48]
	movs r1, #0x80
	lsls r1, r1, #4
	adds r0, r0, r1
	str r0, [r4, #0x4c]
	adds r0, r4, #0
	adds r0, #0x44
	movs r1, #0xe8
	strh r1, [r0]
	adds r3, r4, #0
	adds r3, #0x42
	movs r0, #0x8c
	lsls r0, r0, #1
	strh r0, [r3]
	adds r0, r4, #0
	adds r0, #0x40
	strh r1, [r0]
	strh r2, [r4, #0x30]
	strh r2, [r4, #0x32]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C9D98: .4byte Pal_OpAnimSaleh2
_080C9D9C: .4byte gGenericBuffer

	THUMB_FUNC_END sub_80C9D4C

	THUMB_FUNC_START sub_80C9DA0
sub_80C9DA0: @ 0x080C9DA0
	push {r4, lr}
	adds r4, r0, #0
	bl sub_80C9B6C
	ldr r0, _080C9DE8  @ Pal_OpAnimTethys
	movs r2, #0xb0
	lsls r2, r2, #1
	movs r1, #0
	bl CopyToPalOpAnim
	adds r0, r4, #0
	adds r0, #0x47
	movs r2, #0
	strb r2, [r0]
	ldr r0, _080C9DEC  @ gGenericBuffer
	str r0, [r4, #0x48]
	movs r1, #0x80
	lsls r1, r1, #4
	adds r0, r0, r1
	str r0, [r4, #0x4c]
	adds r1, r4, #0
	adds r1, #0x44
	movs r0, #0xc8
	strh r0, [r1]
	subs r1, #2
	adds r0, #0x70
	strh r0, [r1]
	subs r1, #2
	subs r0, #0x10
	strh r0, [r1]
	strh r2, [r4, #0x30]
	strh r2, [r4, #0x32]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C9DE8: .4byte Pal_OpAnimTethys
_080C9DEC: .4byte gGenericBuffer

	THUMB_FUNC_END sub_80C9DA0

	THUMB_FUNC_START sub_80C9DF0
sub_80C9DF0: @ 0x080C9DF0
	push {r4, r5, lr}
	sub sp, #4
	movs r0, #1
	movs r1, #0x10
	movs r2, #0
	movs r3, #8
	bl SetBlendConfig
	movs r4, #0
	str r4, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #1
	movs r3, #0
	bl SetBlendTargetA
	str r4, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #1
	bl SetBlendTargetB
	ldr r2, _080C9E68  @ gLCDControlBuffer
	ldrb r0, [r2, #1]
	movs r4, #1
	orrs r0, r4
	movs r5, #2
	orrs r0, r5
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2, #1]
	ldrb r3, [r2, #0xc]
	movs r1, #4
	negs r1, r1
	adds r0, r1, #0
	ands r0, r3
	orrs r0, r4
	strb r0, [r2, #0xc]
	ldrb r3, [r2, #0x10]
	adds r0, r1, #0
	ands r0, r3
	orrs r0, r5
	strb r0, [r2, #0x10]
	ldrb r0, [r2, #0x14]
	ands r1, r0
	strb r1, [r2, #0x14]
	ldrb r0, [r2, #0x18]
	movs r1, #3
	orrs r0, r1
	strb r0, [r2, #0x18]
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C9E68: .4byte gLCDControlBuffer

	THUMB_FUNC_END sub_80C9DF0

	THUMB_FUNC_START sub_80C9E6C
sub_80C9E6C: @ 0x080C9E6C
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldrh r0, [r4, #0x38]
	ldrh r1, [r4, #0x3a]
	bl OpAnim1_UpdateScroll
	ldrh r0, [r4, #0x38]
	strh r0, [r4, #0x3a]
	movs r2, #0x9c
	lsls r2, r2, #2
	ldrh r3, [r4, #0x3c]
	movs r0, #0x86
	lsls r0, r0, #3
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	bl Interpolate
	strh r0, [r4, #0x38]
	ldrh r0, [r4, #0x3c]
	adds r0, #1
	strh r0, [r4, #0x3c]
	ldrh r0, [r4, #0x2a]
	cmp r0, #0x10
	bhi _080C9ED8
	adds r3, r0, #0
	movs r0, #0x10
	str r0, [sp]
	movs r0, #0
	movs r1, #0x10
	movs r2, #0
	bl Interpolate
	ldr r2, _080C9ED4  @ gLCDControlBuffer
	adds r1, r2, #0
	adds r1, #0x44
	strb r0, [r1]
	movs r1, #0x10
	subs r1, r1, r0
	adds r2, #0x45
	strb r1, [r2]
	ldrh r0, [r4, #0x2a]
	cmp r0, #0x10
	bne _080C9ED8
	movs r0, #0
	strh r0, [r4, #0x2a]
	adds r0, r4, #0
	bl Proc_Break
	b _080C9EDE
	.align 2, 0
_080C9ED4: .4byte gLCDControlBuffer
_080C9ED8:
	ldrh r0, [r4, #0x2a]
	adds r0, #1
	strh r0, [r4, #0x2a]
_080C9EDE:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80C9E6C

	THUMB_FUNC_START sub_80C9EE8
sub_80C9EE8: @ 0x080C9EE8
	push {r4, lr}
	sub sp, #4
	ldr r0, _080C9F74  @ pal_08B103D8
	movs r2, #0x80
	lsls r2, r2, #1
	movs r1, #0
	bl CopyToPalOpAnim
	movs r0, #1
	movs r1, #0
	movs r2, #0x10
	movs r3, #8
	bl SetBlendConfig
	movs r4, #0
	str r4, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #1
	movs r3, #0
	bl SetBlendTargetA
	str r4, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #1
	bl SetBlendTargetB
	ldr r3, _080C9F78  @ gLCDControlBuffer
	ldrb r1, [r3, #1]
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
	strb r0, [r3, #1]
	ldrb r1, [r3, #0xc]
	movs r2, #4
	negs r2, r2
	adds r0, r2, #0
	ands r0, r1
	movs r1, #1
	orrs r0, r1
	strb r0, [r3, #0xc]
	ldrb r1, [r3, #0x10]
	adds r0, r2, #0
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	strb r0, [r3, #0x10]
	ldrb r0, [r3, #0x14]
	ands r2, r0
	strb r2, [r3, #0x14]
	ldrb r0, [r3, #0x18]
	movs r1, #3
	orrs r0, r1
	strb r0, [r3, #0x18]
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C9F74: .4byte pal_08B103D8
_080C9F78: .4byte gLCDControlBuffer

	THUMB_FUNC_END sub_80C9EE8

	THUMB_FUNC_START sub_80C9F7C
sub_80C9F7C: @ 0x080C9F7C
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldrh r0, [r4, #0x38]
	ldrh r1, [r4, #0x3a]
	bl OpAnim1_UpdateScroll
	ldrh r0, [r4, #0x38]
	strh r0, [r4, #0x3a]
	movs r2, #0x9c
	lsls r2, r2, #2
	ldrh r3, [r4, #0x3c]
	movs r0, #0x86
	lsls r0, r0, #3
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	bl Interpolate
	strh r0, [r4, #0x38]
	ldrh r0, [r4, #0x3c]
	adds r0, #1
	strh r0, [r4, #0x3c]
	ldrh r0, [r4, #0x2a]
	cmp r0, #0x10
	bhi _080C9FE8
	adds r3, r0, #0
	movs r0, #0x10
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0x10
	bl Interpolate
	ldr r2, _080C9FE4  @ gLCDControlBuffer
	adds r1, r2, #0
	adds r1, #0x44
	strb r0, [r1]
	movs r1, #0x10
	subs r1, r1, r0
	adds r2, #0x45
	strb r1, [r2]
	ldrh r0, [r4, #0x2a]
	cmp r0, #0x10
	bne _080C9FE8
	movs r0, #0
	strh r0, [r4, #0x2a]
	adds r0, r4, #0
	bl Proc_Break
	b _080C9FEE
	.align 2, 0
_080C9FE4: .4byte gLCDControlBuffer
_080C9FE8:
	ldrh r0, [r4, #0x2a]
	adds r0, #1
	strh r0, [r4, #0x2a]
_080C9FEE:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80C9F7C

	THUMB_FUNC_START sub_80C9FF8
sub_80C9FF8: @ 0x080C9FF8
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r5, r0, #0
	ldrh r0, [r5, #0x38]
	ldrh r1, [r5, #0x3a]
	bl OpAnim1_UpdateScroll
	ldrh r0, [r5, #0x38]
	strh r0, [r5, #0x3a]
	movs r2, #0x9c
	lsls r2, r2, #2
	ldrh r3, [r5, #0x3c]
	movs r0, #0x86
	lsls r0, r0, #3
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	bl Interpolate
	strh r0, [r5, #0x38]
	ldrh r0, [r5, #0x3c]
	adds r0, #1
	strh r0, [r5, #0x3c]
	movs r0, #1
	bl BG_EnableSyncByMask
	adds r0, r5, #0
	adds r0, #0x40
	ldrh r2, [r0]
	ldrh r3, [r5, #0x2a]
	movs r0, #0x1e
	str r0, [sp]
	movs r0, #4
	movs r1, #0
	bl Interpolate
	adds r7, r0, #0
	adds r0, r5, #0
	adds r0, #0x47
	ldrb r6, [r0]
	cmp r6, #0
	beq _080CA06E
	lsls r0, r7, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x30
	ldrsh r1, [r5, r2]
	adds r4, r5, #0
	adds r4, #0x44
	movs r3, #0
	ldrsh r2, [r4, r3]
	ldr r3, [r5, #0x48]
	str r3, [sp]
	ldr r3, [r5, #0x4c]
	str r3, [sp, #4]
	movs r3, #0
	str r3, [sp, #8]
	bl TsaModifyFirstPalMaybe
	b _080CA08E
_080CA06E:
	lsls r0, r7, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x30
	ldrsh r1, [r5, r2]
	adds r4, r5, #0
	adds r4, #0x44
	movs r3, #0
	ldrsh r2, [r4, r3]
	ldr r3, [r5, #0x48]
	str r3, [sp]
	ldr r3, [r5, #0x4c]
	str r3, [sp, #4]
	str r6, [sp, #8]
	movs r3, #0
	bl sub_80C689C
_080CA08E:
	strh r7, [r5, #0x30]
	ldrh r0, [r5, #0x2a]
	cmp r0, #0x1e
	bne _080CA0FE
	movs r0, #2
	bl BG_EnableSyncByMask
	adds r0, r5, #0
	adds r0, #0x42
	ldrh r0, [r0]
	adds r0, #0xf0
	adds r1, r5, #0
	adds r1, #0x40
	ldrh r1, [r1]
	subs r0, r0, r1
	strh r0, [r5, #0x32]
	adds r0, r5, #0
	adds r0, #0x47
	ldrb r0, [r0]
	cmp r0, #0
	beq _080CA0D6
	movs r1, #0x32
	ldrsh r0, [r5, r1]
	movs r3, #0
	ldrsh r2, [r4, r3]
	ldr r1, [r5, #0x48]
	str r1, [sp]
	ldr r1, [r5, #0x4c]
	str r1, [sp, #4]
	movs r1, #1
	str r1, [sp, #8]
	movs r1, #0
	movs r3, #1
	bl sub_80C689C
	b _080CA0F2
_080CA0D6:
	movs r1, #0x32
	ldrsh r0, [r5, r1]
	movs r3, #0
	ldrsh r2, [r4, r3]
	ldr r1, [r5, #0x48]
	str r1, [sp]
	ldr r1, [r5, #0x4c]
	str r1, [sp, #4]
	movs r1, #1
	str r1, [sp, #8]
	movs r1, #0
	movs r3, #1
	bl TsaModifyFirstPalMaybe
_080CA0F2:
	movs r0, #0
	strh r0, [r5, #0x2a]
	adds r0, r5, #0
	bl Proc_Break
	b _080CA102
_080CA0FE:
	adds r0, #1
	strh r0, [r5, #0x2a]
_080CA102:
	add sp, #0xc
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80C9FF8

	THUMB_FUNC_START sub_80CA10C
sub_80CA10C: @ 0x080CA10C
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r6, r0, #0
	ldrh r0, [r6, #0x38]
	ldrh r1, [r6, #0x3a]
	bl OpAnim1_UpdateScroll
	ldrh r0, [r6, #0x38]
	strh r0, [r6, #0x3a]
	movs r2, #0x9c
	lsls r2, r2, #2
	ldrh r3, [r6, #0x3c]
	movs r0, #0x86
	lsls r0, r0, #3
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	bl Interpolate
	strh r0, [r6, #0x38]
	ldrh r0, [r6, #0x3c]
	adds r0, #1
	strh r0, [r6, #0x3c]
	ldrh r3, [r6, #0x2a]
	movs r0, #0x28
	str r0, [sp]
	movs r0, #1
	movs r1, #8
	movs r2, #0
	bl Interpolate
	adds r5, r0, #0
	lsls r1, r5, #0x18
	lsrs r1, r1, #0x18
	movs r2, #0x10
	subs r2, r2, r5
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	movs r0, #1
	movs r3, #8
	bl SetBlendConfig
	movs r0, #1
	bl BG_EnableSyncByMask
	adds r0, r6, #0
	adds r0, #0x40
	ldrh r1, [r0]
	adds r2, r1, #0
	adds r2, #0x10
	ldrh r3, [r6, #0x2a]
	movs r0, #0x1e
	str r0, [sp]
	movs r0, #0
	bl Interpolate
	adds r5, r0, #0
	adds r0, r6, #0
	adds r0, #0x47
	ldrb r7, [r0]
	cmp r7, #0
	beq _080CA1AA
	lsls r0, r5, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x30
	ldrsh r1, [r6, r2]
	adds r4, r6, #0
	adds r4, #0x44
	movs r3, #0
	ldrsh r2, [r4, r3]
	ldr r3, [r6, #0x48]
	str r3, [sp]
	ldr r3, [r6, #0x4c]
	str r3, [sp, #4]
	movs r3, #0
	str r3, [sp, #8]
	bl TsaModifyFirstPalMaybe
	b _080CA1CA
_080CA1AA:
	lsls r0, r5, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x30
	ldrsh r1, [r6, r2]
	adds r4, r6, #0
	adds r4, #0x44
	movs r3, #0
	ldrsh r2, [r4, r3]
	ldr r3, [r6, #0x48]
	str r3, [sp]
	ldr r3, [r6, #0x4c]
	str r3, [sp, #4]
	str r7, [sp, #8]
	movs r3, #0
	bl sub_80C689C
_080CA1CA:
	adds r7, r4, #0
	strh r5, [r6, #0x30]
	movs r0, #2
	bl BG_EnableSyncByMask
	ldrh r3, [r6, #0x2a]
	movs r4, #0x3c
	str r4, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0x60
	bl Interpolate
	adds r5, r0, #0
	ldrh r3, [r6, #0x2a]
	str r4, [sp]
	movs r0, #1
	movs r1, #0
	movs r2, #0x60
	bl Interpolate
	adds r1, r6, #0
	adds r1, #0x42
	ldrh r1, [r1]
	adds r1, #0xf0
	adds r2, r6, #0
	adds r2, #0x40
	ldrh r2, [r2]
	subs r1, r1, r2
	adds r1, r1, r5
	adds r5, r1, r0
	adds r0, r6, #0
	adds r0, #0x47
	ldrb r0, [r0]
	cmp r0, #0
	beq _080CA230
	lsls r0, r5, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x32
	ldrsh r1, [r6, r2]
	movs r3, #0
	ldrsh r2, [r7, r3]
	ldr r3, [r6, #0x48]
	str r3, [sp]
	ldr r3, [r6, #0x4c]
	str r3, [sp, #4]
	movs r3, #1
	str r3, [sp, #8]
	bl sub_80C689C
	b _080CA24C
_080CA230:
	lsls r0, r5, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x32
	ldrsh r1, [r6, r2]
	movs r3, #0
	ldrsh r2, [r7, r3]
	ldr r3, [r6, #0x48]
	str r3, [sp]
	ldr r3, [r6, #0x4c]
	str r3, [sp, #4]
	movs r3, #1
	str r3, [sp, #8]
	bl TsaModifyFirstPalMaybe
_080CA24C:
	strh r5, [r6, #0x32]
	ldrh r0, [r6, #0x2a]
	cmp r0, #0x1e
	bne _080CA260
	movs r0, #0
	strh r0, [r6, #0x2a]
	adds r0, r6, #0
	bl Proc_Break
	b _080CA264
_080CA260:
	adds r0, #1
	strh r0, [r6, #0x2a]
_080CA264:
	add sp, #0xc
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80CA10C

	THUMB_FUNC_START sub_80CA26C
sub_80CA26C: @ 0x080CA26C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	adds r7, r0, #0
	ldrh r0, [r7, #0x2a]
	cmp r0, #0xb
	bne _080CA2E6
	ldr r5, _080CA380  @ gLCDControlBuffer
	ldrb r0, [r5, #1]
	movs r1, #1
	orrs r0, r1
	movs r2, #3
	negs r2, r2
	mov sl, r2
	ands r0, r2
	movs r3, #5
	negs r3, r3
	mov r9, r3
	ands r0, r3
	movs r1, #8
	mov r8, r1
	mov r2, r8
	orrs r0, r2
	movs r6, #0x10
	orrs r0, r6
	strb r0, [r5, #1]
	movs r4, #0
	str r4, [sp]
	movs r0, #1
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl SetBlendTargetA
	str r4, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #1
	bl SetBlendTargetB
	movs r0, #1
	movs r1, #0x10
	movs r2, #0
	movs r3, #8
	bl SetBlendConfig
	ldrb r0, [r5, #1]
	movs r3, #1
	orrs r0, r3
	mov r1, sl
	ands r0, r1
	mov r2, r9
	ands r0, r2
	mov r3, r8
	orrs r0, r3
	orrs r0, r6
	strb r0, [r5, #1]
_080CA2E6:
	ldrh r0, [r7, #0x2a]
	cmp r0, #0xa
	bhi _080CA3A6
	adds r3, r0, #0
	adds r3, #0x1e
	movs r0, #0x28
	str r0, [sp]
	movs r0, #1
	movs r1, #8
	movs r2, #0
	bl Interpolate
	adds r4, r0, #0
	lsls r1, r4, #0x18
	lsrs r1, r1, #0x18
	movs r2, #0x10
	subs r2, r2, r4
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	movs r0, #1
	movs r3, #8
	bl SetBlendConfig
	movs r0, #2
	bl BG_EnableSyncByMask
	ldrh r3, [r7, #0x2a]
	adds r3, #0x1e
	movs r4, #0x3c
	str r4, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0x60
	bl Interpolate
	adds r5, r0, #0
	ldrh r3, [r7, #0x2a]
	adds r3, #0x1e
	str r4, [sp]
	movs r0, #1
	movs r1, #0
	movs r2, #0x60
	bl Interpolate
	adds r1, r7, #0
	adds r1, #0x42
	ldrh r1, [r1]
	adds r1, #0xf0
	adds r2, r7, #0
	adds r2, #0x40
	ldrh r2, [r2]
	subs r1, r1, r2
	adds r1, r1, r5
	adds r4, r1, r0
	adds r0, r7, #0
	adds r0, #0x47
	ldrb r0, [r0]
	cmp r0, #0
	beq _080CA384
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x32
	ldrsh r1, [r7, r2]
	adds r2, r7, #0
	adds r2, #0x44
	movs r3, #0
	ldrsh r2, [r2, r3]
	ldr r3, [r7, #0x48]
	str r3, [sp]
	ldr r3, [r7, #0x4c]
	str r3, [sp, #4]
	movs r3, #1
	str r3, [sp, #8]
	bl sub_80C689C
	b _080CA3A4
	.align 2, 0
_080CA380: .4byte gLCDControlBuffer
_080CA384:
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x32
	ldrsh r1, [r7, r2]
	adds r2, r7, #0
	adds r2, #0x44
	movs r3, #0
	ldrsh r2, [r2, r3]
	ldr r3, [r7, #0x48]
	str r3, [sp]
	ldr r3, [r7, #0x4c]
	str r3, [sp, #4]
	movs r3, #1
	str r3, [sp, #8]
	bl TsaModifyFirstPalMaybe
_080CA3A4:
	strh r4, [r7, #0x32]
_080CA3A6:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80CA26C

	THUMB_FUNC_START sub_80CA3B8
sub_80CA3B8: @ 0x080CA3B8
	push {r4, r5, r6, lr}
	sub sp, #0xc
	adds r4, r0, #0
	bl sub_80CA26C
	ldrh r0, [r4, #0x38]
	ldrh r1, [r4, #0x3a]
	bl OpAnim1_UpdateScroll
	ldrh r0, [r4, #0x38]
	strh r0, [r4, #0x3a]
	movs r2, #0x9c
	lsls r2, r2, #2
	ldrh r3, [r4, #0x3c]
	movs r0, #0x86
	lsls r0, r0, #3
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	bl Interpolate
	strh r0, [r4, #0x38]
	ldrh r0, [r4, #0x3c]
	adds r0, #1
	strh r0, [r4, #0x3c]
	ldrh r0, [r4, #0x2a]
	adds r3, r0, #0
	subs r3, #0xf
	cmp r3, #0
	blt _080CA412
	movs r0, #0xf
	str r0, [sp]
	movs r0, #0
	movs r1, #0x10
	movs r2, #0
	bl Interpolate
	ldr r2, _080CA460  @ gLCDControlBuffer
	adds r1, r2, #0
	adds r1, #0x44
	strb r0, [r1]
	movs r1, #0x10
	subs r1, r1, r0
	adds r2, #0x45
	strb r1, [r2]
_080CA412:
	movs r0, #1
	bl BG_EnableSyncByMask
	adds r0, r4, #0
	adds r0, #0x40
	ldrh r2, [r0]
	adds r1, r2, #0
	adds r1, #0x10
	lsls r2, r2, #1
	adds r2, #0x10
	ldrh r3, [r4, #0x2a]
	movs r0, #0x1e
	str r0, [sp]
	movs r0, #1
	bl Interpolate
	adds r6, r0, #0
	adds r0, r4, #0
	adds r0, #0x47
	ldrb r5, [r0]
	cmp r5, #0
	beq _080CA464
	lsls r0, r6, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x30
	ldrsh r1, [r4, r2]
	adds r2, r4, #0
	adds r2, #0x44
	movs r3, #0
	ldrsh r2, [r2, r3]
	ldr r3, [r4, #0x48]
	str r3, [sp]
	ldr r3, [r4, #0x4c]
	str r3, [sp, #4]
	movs r3, #0
	str r3, [sp, #8]
	bl TsaModifyFirstPalMaybe
	b _080CA484
	.align 2, 0
_080CA460: .4byte gLCDControlBuffer
_080CA464:
	lsls r0, r6, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x30
	ldrsh r1, [r4, r2]
	adds r2, r4, #0
	adds r2, #0x44
	movs r3, #0
	ldrsh r2, [r2, r3]
	ldr r3, [r4, #0x48]
	str r3, [sp]
	ldr r3, [r4, #0x4c]
	str r3, [sp, #4]
	str r5, [sp, #8]
	movs r3, #0
	bl sub_80C689C
_080CA484:
	strh r6, [r4, #0x30]
	ldrh r0, [r4, #0x2a]
	cmp r0, #0x1e
	bne _080CA498
	movs r0, #0
	strh r0, [r4, #0x2a]
	adds r0, r4, #0
	bl Proc_Break
	b _080CA49C
_080CA498:
	adds r0, #1
	strh r0, [r4, #0x2a]
_080CA49C:
	add sp, #0xc
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80CA3B8

	THUMB_FUNC_START sub_80CA4A4
sub_80CA4A4: @ 0x080CA4A4
	push {lr}
	ldr r0, _080CA4D4  @ gUnknown_08AA707C
	bl Proc_EndEach
	ldr r2, _080CA4D8  @ gLCDControlBuffer
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
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2, #1]
	bl SetDefaultColorEffects
	pop {r0}
	bx r0
	.align 2, 0
_080CA4D4: .4byte gUnknown_08AA707C
_080CA4D8: .4byte gLCDControlBuffer

	THUMB_FUNC_END sub_80CA4A4

	THUMB_FUNC_START sub_80CA4DC
sub_80CA4DC: @ 0x080CA4DC
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r6, r0, #0
	ldrh r0, [r6, #0x2a]
	cmp r0, #4
	bhi _080CA53E
	lsls r0, r0, #2
	ldr r1, _080CA4F4  @ _080CA4F8
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080CA4F4: .4byte _080CA4F8
_080CA4F8: @ jump table
	.4byte _080CA53E @ case 0
	.4byte _080CA50C @ case 1
	.4byte _080CA51A @ case 2
	.4byte _080CA528 @ case 3
	.4byte _080CA536 @ case 4
_080CA50C:
	movs r0, #0xd8
	lsls r0, r0, #1
	movs r1, #0xc4
	lsls r1, r1, #1
	bl OpAnim1_UpdateScroll
	b _080CA53E
_080CA51A:
	movs r0, #0xf8
	lsls r0, r0, #1
	movs r1, #0xd8
	lsls r1, r1, #1
	bl OpAnim1_UpdateScroll
	b _080CA53E
_080CA528:
	movs r0, #0x8c
	lsls r0, r0, #2
	movs r1, #0xf8
	lsls r1, r1, #1
	bl OpAnim1_UpdateScroll
	b _080CA53E
_080CA536:
	movs r0, #0x8c
	lsls r0, r0, #2
	strh r0, [r6, #0x3a]
	strh r0, [r6, #0x38]
_080CA53E:
	ldrh r0, [r6, #0x2a]
	cmp r0, #0x8e
	bls _080CA550
	movs r0, #0xae
	movs r1, #0xa
	movs r2, #4
	movs r3, #9
	bl OpAnimPutObjCommon
_080CA550:
	ldrh r0, [r6, #0x2a]
	cmp r0, #0x8d
	bls _080CA562
	movs r0, #0x38
	movs r1, #0x28
	movs r2, #4
	movs r3, #7
	bl OpAnimPutObjCommon
_080CA562:
	ldrh r0, [r6, #0x2a]
	cmp r0, #0x8c
	bls _080CA574
	movs r0, #0x9c
	movs r1, #0x3a
	movs r2, #3
	movs r3, #3
	bl OpAnimPutObjCommon
_080CA574:
	ldrh r0, [r6, #0x2a]
	cmp r0, #0x8b
	bls _080CA586
	movs r0, #0x22
	movs r1, #0
	movs r2, #4
	movs r3, #1
	bl OpAnimPutObjCommon
_080CA586:
	ldrh r0, [r6, #0x2a]
	cmp r0, #0x8a
	bls _080CA598
	movs r0, #0xd2
	movs r1, #0x10
	movs r2, #4
	movs r3, #5
	bl OpAnimPutObjCommon
_080CA598:
	ldrh r0, [r6, #0x2a]
	cmp r0, #0x89
	bls _080CA5AA
	movs r0, #0xc
	movs r1, #0x1a
	movs r2, #3
	movs r3, #1
	bl OpAnimPutObjCommon
_080CA5AA:
	ldrh r0, [r6, #0x2a]
	cmp r0, #0x88
	bls _080CA5BC
	movs r0, #0xcc
	movs r1, #0x2a
	movs r2, #3
	movs r3, #4
	bl OpAnimPutObjCommon
_080CA5BC:
	ldrh r0, [r6, #0x2a]
	cmp r0, #0x87
	bls _080CA5CE
	movs r0, #0x60
	movs r1, #0
	movs r2, #4
	movs r3, #0
	bl OpAnimPutObjCommon
_080CA5CE:
	ldrh r0, [r6, #0x2a]
	cmp r0, #0x86
	bls _080CA5E0
	movs r0, #0xe4
	movs r1, #0x10
	movs r2, #4
	movs r3, #0xb
	bl OpAnimPutObjCommon
_080CA5E0:
	ldrh r0, [r6, #0x2a]
	cmp r0, #0x85
	bls _080CA5F2
	movs r0, #0x58
	movs r1, #0x1e
	movs r2, #3
	movs r3, #3
	bl OpAnimPutObjCommon
_080CA5F2:
	ldrh r0, [r6, #0x2a]
	cmp r0, #0x84
	bls _080CA604
	movs r0, #0x54
	movs r1, #0x2e
	movs r2, #2
	movs r3, #1
	bl OpAnimPutObjCommon
_080CA604:
	ldrh r0, [r6, #0x2a]
	cmp r0, #0x83
	bls _080CA616
	movs r0, #0
	movs r1, #2
	movs r2, #4
	movs r3, #2
	bl OpAnimPutObjCommon
_080CA616:
	ldrh r0, [r6, #0x2a]
	cmp r0, #0x82
	bls _080CA628
	movs r0, #0xc6
	movs r1, #0x18
	movs r2, #4
	movs r3, #9
	bl OpAnimPutObjCommon
_080CA628:
	ldrh r0, [r6, #0x2a]
	cmp r0, #0x81
	bls _080CA63A
	movs r0, #0x90
	movs r1, #0x22
	movs r2, #3
	movs r3, #5
	bl OpAnimPutObjCommon
_080CA63A:
	ldrh r0, [r6, #0x2a]
	cmp r0, #0x80
	bls _080CA64C
	movs r0, #0xa8
	movs r1, #0x44
	movs r2, #2
	movs r3, #0
	bl OpAnimPutObjCommon
_080CA64C:
	ldrh r0, [r6, #0x2a]
	cmp r0, #0x7f
	bls _080CA65E
	movs r0, #0xca
	movs r1, #2
	movs r2, #4
	movs r3, #7
	bl OpAnimPutObjCommon
_080CA65E:
	ldrh r0, [r6, #0x2a]
	cmp r0, #0x7e
	bls _080CA670
	movs r0, #0x26
	movs r1, #0x18
	movs r2, #4
	movs r3, #2
	bl OpAnimPutObjCommon
_080CA670:
	ldrh r0, [r6, #0x2a]
	cmp r0, #0x7d
	bls _080CA682
	movs r0, #0x80
	movs r1, #0x26
	movs r2, #3
	movs r3, #0
	bl OpAnimPutObjCommon
_080CA682:
	ldrh r0, [r6, #0x2a]
	cmp r0, #0x7b
	bls _080CA694
	movs r0, #0x80
	movs r1, #0x32
	movs r2, #2
	movs r3, #5
	bl OpAnimPutObjCommon
_080CA694:
	ldrh r0, [r6, #0x2a]
	cmp r0, #0x79
	bls _080CA6A6
	movs r0, #0x86
	movs r1, #6
	movs r2, #4
	movs r3, #0
	bl OpAnimPutObjCommon
_080CA6A6:
	ldrh r0, [r6, #0x2a]
	cmp r0, #0x77
	bls _080CA6B8
	movs r0, #0x98
	movs r1, #0x16
	movs r2, #4
	movs r3, #1
	bl OpAnimPutObjCommon
_080CA6B8:
	ldrh r0, [r6, #0x2a]
	cmp r0, #0x75
	bls _080CA6CA
	movs r0, #0xe8
	movs r1, #0x16
	movs r2, #3
	movs r3, #3
	bl OpAnimPutObjCommon
_080CA6CA:
	ldrh r0, [r6, #0x2a]
	cmp r0, #0x73
	bls _080CA6DC
	movs r0, #0x64
	movs r1, #0x48
	movs r2, #2
	movs r3, #1
	bl OpAnimPutObjCommon
_080CA6DC:
	ldrh r0, [r6, #0x2a]
	cmp r0, #0x71
	bls _080CA6EE
	movs r0, #0x70
	movs r1, #6
	movs r2, #4
	movs r3, #0xa
	bl OpAnimPutObjCommon
_080CA6EE:
	ldrh r0, [r6, #0x2a]
	cmp r0, #0x6f
	bls _080CA700
	movs r0, #0x40
	movs r1, #0x14
	movs r2, #4
	movs r3, #8
	bl OpAnimPutObjCommon
_080CA700:
	ldrh r0, [r6, #0x2a]
	cmp r0, #0x6d
	bls _080CA712
	movs r0, #0
	movs r1, #0x2e
	movs r2, #3
	movs r3, #4
	bl OpAnimPutObjCommon
_080CA712:
	ldrh r0, [r6, #0x2a]
	cmp r0, #0x6b
	bls _080CA724
	movs r0, #0x2c
	movs r1, #0x4a
	movs r2, #2
	movs r3, #4
	bl OpAnimPutObjCommon
_080CA724:
	ldrh r0, [r6, #0x2a]
	cmp r0, #0x69
	bls _080CA736
	movs r0, #0x40
	movs r1, #8
	movs r2, #4
	movs r3, #6
	bl OpAnimPutObjCommon
_080CA736:
	ldrh r0, [r6, #0x2a]
	cmp r0, #0x67
	bls _080CA748
	movs r0, #0x78
	movs r1, #0x1a
	movs r2, #4
	movs r3, #2
	bl OpAnimPutObjCommon
_080CA748:
	ldrh r0, [r6, #0x2a]
	cmp r0, #0x65
	bls _080CA75A
	movs r0, #0x24
	movs r1, #0x32
	movs r2, #3
	movs r3, #2
	bl OpAnimPutObjCommon
_080CA75A:
	ldrh r0, [r6, #0x2a]
	cmp r0, #0x62
	bls _080CA76C
	movs r0, #0xe
	movs r1, #0x4e
	movs r2, #2
	movs r3, #0
	bl OpAnimPutObjCommon
_080CA76C:
	ldrh r0, [r6, #0x2a]
	cmp r0, #0x5f
	bls _080CA77E
	movs r0, #0x16
	movs r1, #0xa
	movs r2, #4
	movs r3, #4
	bl OpAnimPutObjCommon
_080CA77E:
	ldrh r0, [r6, #0x2a]
	cmp r0, #0x5c
	bls _080CA790
	movs r0, #0xb4
	movs r1, #0x28
	movs r2, #4
	movs r3, #1
	bl OpAnimPutObjCommon
_080CA790:
	ldrh r0, [r6, #0x2a]
	cmp r0, #0x59
	bls _080CA7A2
	movs r0, #0x42
	movs r1, #0x36
	movs r2, #3
	movs r3, #1
	bl OpAnimPutObjCommon
_080CA7A2:
	ldrh r0, [r6, #0x2a]
	cmp r0, #0x55
	bls _080CA7B4
	movs r0, #0xdc
	movs r1, #0x32
	movs r2, #2
	movs r3, #2
	bl OpAnimPutObjCommon
_080CA7B4:
	ldrh r0, [r6, #0x2a]
	cmp r0, #0x51
	bls _080CA7C6
	movs r0, #0xc8
	movs r1, #0x48
	movs r2, #1
	movs r3, #0
	bl OpAnimPutObjCommon
_080CA7C6:
	ldrh r0, [r6, #0x2a]
	cmp r0, #0x4c
	bls _080CA7D8
	movs r0, #0x38
	movs r1, #0x28
	movs r2, #4
	movs r3, #0
	bl OpAnimPutObjCommon
_080CA7D8:
	ldrh r0, [r6, #0x2a]
	cmp r0, #0x47
	bls _080CA7EA
	movs r0, #0x8c
	movs r1, #0x54
	movs r2, #1
	movs r3, #2
	bl OpAnimPutObjCommon
_080CA7EA:
	ldrh r0, [r6, #0x2a]
	cmp r0, #0x41
	bls _080CA7FC
	movs r0, #0x10
	movs r1, #0x64
	movs r2, #1
	movs r3, #1
	bl OpAnimPutObjCommon
_080CA7FC:
	ldrh r0, [r6, #0x2a]
	cmp r0, #0x37
	bls _080CA80E
	movs r0, #0
	movs r1, #0x7e
	movs r2, #0
	movs r3, #1
	bl OpAnimPutObjCommon
_080CA80E:
	ldrh r0, [r6, #0x2a]
	cmp r0, #0x31
	bls _080CA820
	movs r0, #0xa0
	movs r1, #0x78
	movs r2, #0
	movs r3, #2
	bl OpAnimPutObjCommon
_080CA820:
	ldrh r0, [r6, #0x2a]
	cmp r0, #0x1d
	bls _080CA832
	movs r0, #0x58
	movs r1, #0x70
	movs r2, #0
	movs r3, #0
	bl OpAnimPutObjCommon
_080CA832:
	ldrh r0, [r6, #0x2a]
	adds r4, r0, #0
	subs r4, #0x52
	cmp r4, #0
	bne _080CA870
	ldr r2, _080CA914  @ gLCDControlBuffer
	ldrb r1, [r2, #1]
	movs r0, #2
	negs r0, r0
	ands r0, r1
	movs r1, #3
	negs r1, r1
	ands r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #9
	negs r1, r1
	ands r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2, #1]
	movs r1, #0x80
	lsls r1, r1, #8
	movs r0, #2
	bl SetBackgroundTileDataOffset
	movs r1, #0xe8
	lsls r1, r1, #8
	movs r0, #2
	bl SetBackgroundMapDataOffset
_080CA870:
	cmp r4, #0x5f
	bhi _080CA8A8
	ldr r0, _080CA918  @ pal_08B103D8
	movs r2, #0x80
	lsls r2, r2, #1
	movs r1, #0
	bl CopyToPalOpAnim
	movs r0, #0x5f
	str r0, [sp]
	movs r0, #4
	movs r1, #0x10
	movs r2, #0xc
	adds r3, r4, #0
	bl Interpolate
	ldr r5, _080CA91C  @ gPaletteBuffer
	lsls r7, r0, #0x10
	movs r4, #7
_080CA896:
	adds r0, r5, #0
	movs r1, #0
	lsrs r2, r7, #0x10
	bl sub_80C69B0
	adds r5, #0x20
	subs r4, #1
	cmp r4, #0
	bge _080CA896
_080CA8A8:
	ldrh r0, [r6, #0x2a]
	adds r4, r0, #0
	subs r4, #0xb1
	cmp r4, #0
	bne _080CA8DC
	movs r0, #1
	movs r1, #0x10
	movs r2, #0
	movs r3, #0
	bl SetBlendConfig
	movs r0, #1
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl SetBlendTargetA
	str r4, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #1
	movs r3, #0
	bl SetBlendTargetB
_080CA8DC:
	cmp r4, #0x20
	bhi _080CA900
	movs r0, #0x20
	str r0, [sp]
	movs r0, #0
	movs r1, #0x10
	movs r2, #0
	adds r3, r4, #0
	bl Interpolate
	ldr r2, _080CA914  @ gLCDControlBuffer
	adds r1, r2, #0
	adds r1, #0x44
	strb r0, [r1]
	movs r1, #0x10
	subs r1, r1, r0
	adds r2, #0x45
	strb r1, [r2]
_080CA900:
	ldrh r0, [r6, #0x2a]
	cmp r0, #0xd1
	bne _080CA920
	movs r0, #0
	strh r0, [r6, #0x2a]
	adds r0, r6, #0
	bl Proc_Break
	b _080CA924
	.align 2, 0
_080CA914: .4byte gLCDControlBuffer
_080CA918: .4byte pal_08B103D8
_080CA91C: .4byte gPaletteBuffer
_080CA920:
	adds r0, #1
	strh r0, [r6, #0x2a]
_080CA924:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80CA4DC

	THUMB_FUNC_START sub_80CA92C
sub_80CA92C: @ 0x080CA92C
	push {r4, lr}
	adds r4, r0, #0
	bl SetDefaultColorEffects
	adds r4, #0x46
	movs r0, #1
	strb r0, [r4]
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80CA92C

	THUMB_FUNC_START sub_80CA940
sub_80CA940: @ 0x080CA940
	push {r4, r5, r6, lr}
	mov r6, r9
	mov r5, r8
	push {r5, r6}
	sub sp, #4
	ldr r0, _080CA9F0  @ gUnknown_08AA707C
	bl Proc_EndEach
	movs r0, #3
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	ldr r3, _080CA9F4  @ gLCDControlBuffer
	ldrb r1, [r3, #1]
	movs r2, #2
	negs r2, r2
	adds r0, r2, #0
	ands r0, r1
	movs r5, #3
	negs r5, r5
	ands r0, r5
	movs r1, #4
	mov r8, r1
	mov r1, r8
	orrs r0, r1
	movs r4, #9
	negs r4, r4
	ands r0, r4
	movs r6, #0x10
	orrs r0, r6
	movs r1, #0x21
	negs r1, r1
	mov r9, r1
	ands r0, r1
	subs r1, #0x20
	ands r0, r1
	movs r1, #0x80
	orrs r0, r1
	strb r0, [r3, #1]
	movs r0, #0x37
	adds r0, r0, r3
	mov ip, r0
	ldrb r1, [r0]
	adds r0, r2, #0
	ands r0, r1
	ands r0, r5
	mov r1, r8
	orrs r0, r1
	ands r0, r4
	orrs r0, r6
	adds r3, #0x36
	ldrb r1, [r3]
	ands r2, r1
	ands r2, r5
	movs r1, #5
	negs r1, r1
	ands r2, r1
	ands r2, r4
	subs r1, #0xc
	ands r2, r1
	movs r1, #0x20
	orrs r0, r1
	mov r1, ip
	strb r0, [r1]
	mov r0, r9
	ands r2, r0
	strb r2, [r3]
	movs r0, #1
	movs r1, #4
	movs r2, #8
	movs r3, #8
	bl SetBlendConfig
	movs r0, #0
	str r0, [sp]
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl SetBlendTargetA
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080CA9F0: .4byte gUnknown_08AA707C
_080CA9F4: .4byte gLCDControlBuffer

	THUMB_FUNC_END sub_80CA940

	THUMB_FUNC_START sub_80CA9F8
sub_80CA9F8: @ 0x080CA9F8
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r0, r1, #0
	subs r2, r3, r2
	movs r5, #0x10
	subs r3, r5, r2
	cmp r3, #0
	bge _080CAA14
	ldr r0, _080CAA10  @ 0x0000FFFF
	b _080CAA2E
	.align 2, 0
_080CAA10: .4byte 0x0000FFFF
_080CAA14:
	cmp r3, #0xf
	bgt _080CAA2C
	lsls r1, r0, #4
	subs r1, r1, r0
	lsls r1, r1, #4
	adds r1, r4, r1
	str r5, [sp]
	movs r0, #4
	adds r2, r4, #0
	bl Interpolate
	b _080CAA2E
_080CAA2C:
	adds r0, r4, #0
_080CAA2E:
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80CA9F8

	THUMB_FUNC_START sub_80CAA38
sub_80CAA38: @ 0x080CAA38
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov r9, r0
	ldrh r0, [r0, #0x2a]
	adds r2, r0, #0
	adds r2, #0xa
	movs r0, #0x78
	movs r1, #1
	negs r1, r1
	movs r3, #0x14
	bl sub_80CA9F8
	adds r7, r0, #0
	ldr r0, _080CAB60  @ 0x0000FFFF
	mov sl, r0
	cmp r7, sl
	beq _080CAAA2
	adds r4, r7, #0
	subs r4, #0x30
	ldr r5, _080CAB64  @ 0x000001FF
	ands r4, r5
	ldr r6, _080CAB68  @ gUnknown_08AA709C
	movs r1, #0
	mov r8, r1
	str r1, [sp]
	movs r0, #1
	adds r1, r4, #0
	movs r2, #0xec
	adds r3, r6, #0
	bl PutSpriteExt
	adds r1, r7, #0
	subs r1, #0x2c
	ands r1, r5
	ldr r2, _080CAB6C  @ 0x000004EC
	ldr r0, _080CAB70  @ 0x00001078
	str r0, [sp]
	movs r0, #2
	adds r3, r6, #0
	bl PutSpriteExt
	ldr r2, _080CAB74  @ 0x00000804
	ldr r3, _080CAB78  @ gUnknown_08AA70BC
	mov r0, r8
	str r0, [sp]
	movs r0, #0
	adds r1, r4, #0
	bl PutSpriteExt
_080CAAA2:
	mov r1, r9
	ldrh r0, [r1, #0x2a]
	adds r2, r0, #6
	movs r0, #0x78
	movs r1, #1
	negs r1, r1
	movs r3, #0x14
	bl sub_80CA9F8
	adds r7, r0, #0
	cmp r7, sl
	beq _080CAAF8
	adds r4, r7, #0
	subs r4, #0x30
	ldr r5, _080CAB64  @ 0x000001FF
	ands r4, r5
	ldr r6, _080CAB68  @ gUnknown_08AA709C
	ldr r0, _080CAB7C  @ 0x000020F0
	str r0, [sp]
	movs r0, #1
	adds r1, r4, #0
	movs r2, #0x20
	adds r3, r6, #0
	bl PutSpriteExt
	adds r1, r7, #0
	subs r1, #0x2c
	ands r1, r5
	movs r2, #0x84
	lsls r2, r2, #3
	ldr r0, _080CAB80  @ 0x00003168
	str r0, [sp]
	movs r0, #2
	adds r3, r6, #0
	bl PutSpriteExt
	ldr r2, _080CAB84  @ 0x00000838
	ldr r3, _080CAB78  @ gUnknown_08AA70BC
	movs r0, #0
	str r0, [sp]
	adds r1, r4, #0
	bl PutSpriteExt
_080CAAF8:
	mov r1, r9
	ldrh r0, [r1, #0x2a]
	adds r2, r0, #2
	movs r0, #0x78
	movs r1, #1
	negs r1, r1
	movs r3, #0x14
	bl sub_80CA9F8
	adds r7, r0, #0
	cmp r7, sl
	beq _080CAB4C
	adds r4, r7, #0
	subs r4, #0x30
	ldr r5, _080CAB64  @ 0x000001FF
	ands r4, r5
	ldr r6, _080CAB68  @ gUnknown_08AA709C
	ldr r0, _080CAB88  @ 0x000041E0
	str r0, [sp]
	movs r0, #1
	adds r1, r4, #0
	movs r2, #0x54
	adds r3, r6, #0
	bl PutSpriteExt
	adds r1, r7, #0
	subs r1, #0x2c
	ands r1, r5
	ldr r2, _080CAB8C  @ 0x00000454
	ldr r0, _080CAB90  @ 0x00005258
	str r0, [sp]
	movs r0, #2
	adds r3, r6, #0
	bl PutSpriteExt
	ldr r2, _080CAB94  @ 0x0000086C
	ldr r3, _080CAB78  @ gUnknown_08AA70BC
	movs r0, #0
	str r0, [sp]
	adds r1, r4, #0
	bl PutSpriteExt
_080CAB4C:
	mov r1, r9
	ldrh r0, [r1, #0x2a]
	cmp r0, #0x14
	bne _080CAB98
	movs r0, #0
	strh r0, [r1, #0x2a]
	mov r0, r9
	bl Proc_Break
	b _080CAB9E
	.align 2, 0
_080CAB60: .4byte 0x0000FFFF
_080CAB64: .4byte 0x000001FF
_080CAB68: .4byte gUnknown_08AA709C
_080CAB6C: .4byte 0x000004EC
_080CAB70: .4byte 0x00001078
_080CAB74: .4byte 0x00000804
_080CAB78: .4byte gUnknown_08AA70BC
_080CAB7C: .4byte 0x000020F0
_080CAB80: .4byte 0x00003168
_080CAB84: .4byte 0x00000838
_080CAB88: .4byte 0x000041E0
_080CAB8C: .4byte 0x00000454
_080CAB90: .4byte 0x00005258
_080CAB94: .4byte 0x0000086C
_080CAB98:
	adds r0, #1
	mov r1, r9
	strh r0, [r1, #0x2a]
_080CAB9E:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80CAA38

	THUMB_FUNC_START sub_80CABB0
sub_80CABB0: @ 0x080CABB0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	str r0, [sp, #4]
	ldrh r4, [r0, #0x2a]
	adds r4, #2
	movs r5, #1
	negs r5, r5
	movs r0, #0x42
	adds r1, r5, #0
	adds r2, r4, #0
	movs r3, #0x12
	bl sub_80CA9F8
	mov sl, r0
	movs r0, #0x2a
	adds r1, r5, #0
	adds r2, r4, #0
	movs r3, #0x12
	bl sub_80CA9F8
	adds r7, r0, #0
	movs r0, #0xae
	movs r1, #1
	adds r2, r4, #0
	movs r3, #0x12
	bl sub_80CA9F8
	str r0, [sp, #8]
	movs r0, #0x76
	movs r1, #1
	adds r2, r4, #0
	movs r3, #0x12
	bl sub_80CA9F8
	str r0, [sp, #0xc]
	ldr r0, _080CADDC  @ 0x0000FFFF
	cmp sl, r0
	beq _080CACE0
	cmp r7, r0
	beq _080CAC6E
	movs r0, #0x28
	negs r0, r0
	cmp r7, r0
	blt _080CAC6E
	cmp r7, #0xc8
	bgt _080CAC6E
	mov r5, sl
	subs r5, #0x30
	ldr r6, _080CADE0  @ 0x000001FF
	ands r5, r6
	adds r4, r7, #0
	subs r4, #0x28
	movs r0, #0xff
	mov r9, r0
	ands r4, r0
	ldr r1, _080CADE4  @ gUnknown_08AA709C
	mov r8, r1
	movs r0, #0
	str r0, [sp]
	movs r0, #1
	adds r1, r5, #0
	adds r2, r4, #0
	mov r3, r8
	bl PutSpriteExt
	mov r1, sl
	subs r1, #0x2c
	ands r1, r6
	movs r0, #0x80
	lsls r0, r0, #3
	orrs r4, r0
	ldr r0, _080CADE8  @ 0x00001078
	str r0, [sp]
	movs r0, #2
	adds r2, r4, #0
	mov r3, r8
	bl PutSpriteExt
	adds r2, r7, #0
	subs r2, #0x20
	mov r1, r9
	ands r2, r1
	movs r0, #0x80
	lsls r0, r0, #4
	orrs r2, r0
	ldr r3, _080CADEC  @ gUnknown_08AA70DC
	movs r0, #0
	str r0, [sp]
	adds r1, r5, #0
	bl PutSpriteExt
_080CAC6E:
	ldr r0, _080CADDC  @ 0x0000FFFF
	cmp sl, r0
	beq _080CACE0
	ldr r1, [sp, #0xc]
	cmp r1, r0
	beq _080CACE0
	movs r0, #0x28
	negs r0, r0
	cmp r1, r0
	blt _080CACE0
	cmp r1, #0xc8
	bgt _080CACE0
	mov r5, sl
	subs r5, #0x30
	ldr r6, _080CADE0  @ 0x000001FF
	ands r5, r6
	adds r4, r1, #0
	subs r4, #0x28
	movs r0, #0xff
	mov r9, r0
	ands r4, r0
	ldr r1, _080CADE4  @ gUnknown_08AA709C
	mov r8, r1
	ldr r0, _080CADF0  @ 0x000020F0
	str r0, [sp]
	movs r0, #1
	adds r1, r5, #0
	adds r2, r4, #0
	mov r3, r8
	bl PutSpriteExt
	mov r1, sl
	subs r1, #0x2c
	ands r1, r6
	movs r0, #0x80
	lsls r0, r0, #3
	orrs r4, r0
	ldr r0, _080CADF4  @ 0x00003168
	str r0, [sp]
	movs r0, #2
	adds r2, r4, #0
	mov r3, r8
	bl PutSpriteExt
	ldr r2, [sp, #0xc]
	subs r2, #0x20
	mov r0, r9
	ands r2, r0
	movs r0, #0x80
	lsls r0, r0, #4
	orrs r2, r0
	ldr r3, _080CADEC  @ gUnknown_08AA70DC
	movs r0, #0
	str r0, [sp]
	adds r1, r5, #0
	bl PutSpriteExt
_080CACE0:
	ldr r0, _080CADDC  @ 0x0000FFFF
	ldr r1, [sp, #8]
	cmp r1, r0
	beq _080CADC6
	cmp r7, r0
	beq _080CAD52
	movs r0, #0x28
	negs r0, r0
	cmp r7, r0
	blt _080CAD52
	cmp r7, #0xc8
	bgt _080CAD52
	adds r5, r1, #0
	subs r5, #0x30
	ldr r6, _080CADE0  @ 0x000001FF
	ands r5, r6
	adds r4, r7, #0
	subs r4, #0x28
	movs r0, #0xff
	mov r9, r0
	ands r4, r0
	ldr r1, _080CADE4  @ gUnknown_08AA709C
	mov r8, r1
	ldr r0, _080CADF8  @ 0x000041E0
	str r0, [sp]
	movs r0, #1
	adds r1, r5, #0
	adds r2, r4, #0
	mov r3, r8
	bl PutSpriteExt
	ldr r1, [sp, #8]
	subs r1, #0x2c
	ands r1, r6
	movs r0, #0x80
	lsls r0, r0, #3
	orrs r4, r0
	ldr r0, _080CADFC  @ 0x00005258
	str r0, [sp]
	movs r0, #2
	adds r2, r4, #0
	mov r3, r8
	bl PutSpriteExt
	adds r2, r7, #0
	subs r2, #0x20
	mov r0, r9
	ands r2, r0
	movs r0, #0x80
	lsls r0, r0, #4
	orrs r2, r0
	ldr r3, _080CADEC  @ gUnknown_08AA70DC
	movs r0, #0
	str r0, [sp]
	adds r1, r5, #0
	bl PutSpriteExt
_080CAD52:
	ldr r0, _080CADDC  @ 0x0000FFFF
	ldr r1, [sp, #8]
	cmp r1, r0
	beq _080CADC6
	ldr r1, [sp, #0xc]
	cmp r1, r0
	beq _080CADC6
	movs r0, #0x28
	negs r0, r0
	cmp r1, r0
	blt _080CADC6
	cmp r1, #0xc8
	bgt _080CADC6
	ldr r5, [sp, #8]
	subs r5, #0x30
	ldr r6, _080CADE0  @ 0x000001FF
	ands r5, r6
	adds r4, r1, #0
	subs r4, #0x28
	movs r0, #0xff
	mov r9, r0
	ands r4, r0
	ldr r1, _080CADE4  @ gUnknown_08AA709C
	mov r8, r1
	ldr r0, _080CAE00  @ 0x000062D0
	str r0, [sp]
	movs r0, #1
	adds r1, r5, #0
	adds r2, r4, #0
	mov r3, r8
	bl PutSpriteExt
	ldr r1, [sp, #8]
	subs r1, #0x2c
	ands r1, r6
	movs r0, #0x80
	lsls r0, r0, #3
	orrs r4, r0
	ldr r0, _080CAE04  @ 0x00007348
	str r0, [sp]
	movs r0, #2
	adds r2, r4, #0
	mov r3, r8
	bl PutSpriteExt
	ldr r2, [sp, #0xc]
	subs r2, #0x20
	mov r0, r9
	ands r2, r0
	movs r0, #0x80
	lsls r0, r0, #4
	orrs r2, r0
	ldr r3, _080CADEC  @ gUnknown_08AA70DC
	movs r0, #0
	str r0, [sp]
	adds r1, r5, #0
	bl PutSpriteExt
_080CADC6:
	ldr r1, [sp, #4]
	ldrh r0, [r1, #0x2a]
	cmp r0, #0x12
	bne _080CAE08
	movs r0, #0
	strh r0, [r1, #0x2a]
	ldr r0, [sp, #4]
	bl Proc_Break
	b _080CAE0E
	.align 2, 0
_080CADDC: .4byte 0x0000FFFF
_080CADE0: .4byte 0x000001FF
_080CADE4: .4byte gUnknown_08AA709C
_080CADE8: .4byte 0x00001078
_080CADEC: .4byte gUnknown_08AA70DC
_080CADF0: .4byte 0x000020F0
_080CADF4: .4byte 0x00003168
_080CADF8: .4byte 0x000041E0
_080CADFC: .4byte 0x00005258
_080CAE00: .4byte 0x000062D0
_080CAE04: .4byte 0x00007348
_080CAE08:
	adds r0, #1
	ldr r1, [sp, #4]
	strh r0, [r1, #0x2a]
_080CAE0E:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80CABB0

	THUMB_FUNC_START sub_80CAE20
sub_80CAE20: @ 0x080CAE20
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov r8, r0
	ldrh r0, [r0, #0x2a]
	adds r0, #2
	mov r9, r0
	movs r1, #1
	negs r1, r1
	movs r0, #0x3e
	mov r2, r9
	movs r3, #0x10
	bl sub_80CA9F8
	adds r7, r0, #0
	ldr r0, _080CAEF4  @ 0x0000FFFF
	mov sl, r0
	cmp r7, sl
	beq _080CAE8C
	adds r1, r7, #0
	subs r1, #0x20
	ldr r4, _080CAEF8  @ 0x000001FF
	ands r1, r4
	ldr r5, _080CAEFC  @ gUnknown_08AA709C
	movs r6, #0
	str r6, [sp]
	movs r0, #1
	movs r2, #0x20
	adds r3, r5, #0
	bl PutSpriteExt
	adds r1, r7, #0
	subs r1, #0x1c
	ands r1, r4
	movs r2, #0x84
	lsls r2, r2, #3
	ldr r0, _080CAF00  @ 0x00001078
	str r0, [sp]
	movs r0, #2
	adds r3, r5, #0
	bl PutSpriteExt
	adds r1, r7, #0
	subs r1, #0x38
	ands r1, r4
	ldr r2, _080CAF04  @ 0x00000838
	ldr r3, _080CAF08  @ gUnknown_08AA70EA
	str r6, [sp]
	movs r0, #0
	bl PutSpriteExt
_080CAE8C:
	movs r0, #0xb2
	movs r1, #1
	mov r2, r9
	movs r3, #0x10
	bl sub_80CA9F8
	adds r7, r0, #0
	cmp r7, sl
	beq _080CAEDE
	adds r1, r7, #0
	subs r1, #0x40
	ldr r4, _080CAEF8  @ 0x000001FF
	ands r1, r4
	ldr r5, _080CAEFC  @ gUnknown_08AA709C
	ldr r0, _080CAF0C  @ 0x000020F0
	str r0, [sp]
	movs r0, #1
	movs r2, #0x20
	adds r3, r5, #0
	bl PutSpriteExt
	adds r1, r7, #0
	subs r1, #0x3c
	ands r1, r4
	movs r2, #0x84
	lsls r2, r2, #3
	ldr r0, _080CAF10  @ 0x00003168
	str r0, [sp]
	movs r0, #2
	adds r3, r5, #0
	bl PutSpriteExt
	adds r1, r7, #0
	subs r1, #0x38
	ands r1, r4
	ldr r2, _080CAF04  @ 0x00000838
	ldr r3, _080CAF08  @ gUnknown_08AA70EA
	movs r0, #0
	str r0, [sp]
	bl PutSpriteExt
_080CAEDE:
	mov r1, r8
	ldrh r0, [r1, #0x2a]
	cmp r0, #0x10
	bne _080CAF14
	movs r0, #0
	strh r0, [r1, #0x2a]
	mov r0, r8
	bl Proc_Break
	b _080CAF1A
	.align 2, 0
_080CAEF4: .4byte 0x0000FFFF
_080CAEF8: .4byte 0x000001FF
_080CAEFC: .4byte gUnknown_08AA709C
_080CAF00: .4byte 0x00001078
_080CAF04: .4byte 0x00000838
_080CAF08: .4byte gUnknown_08AA70EA
_080CAF0C: .4byte 0x000020F0
_080CAF10: .4byte 0x00003168
_080CAF14:
	adds r0, #1
	mov r1, r8
	strh r0, [r1, #0x2a]
_080CAF1A:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80CAE20

	THUMB_FUNC_START sub_80CAF2C
sub_80CAF2C: @ 0x080CAF2C
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r7, r0, #0
	ldrh r0, [r7, #0x2a]
	adds r2, r0, #0
	adds r2, #0xa
	movs r1, #1
	negs r1, r1
	movs r0, #0x50
	movs r3, #0xf
	bl sub_80CA9F8
	adds r4, r0, #0
	ldr r0, _080CB074  @ 0x0000FFFF
	cmp r4, r0
	beq _080CAF98
	movs r0, #0x28
	negs r0, r0
	cmp r4, r0
	blt _080CAF98
	cmp r4, #0xc8
	bgt _080CAF98
	movs r6, #0
	subs r4, #0x28
	movs r0, #0xff
	ands r4, r0
	ldr r5, _080CB078  @ gUnknown_08AA709C
	str r6, [sp]
	movs r0, #1
	movs r1, #0
	adds r2, r4, #0
	adds r3, r5, #0
	bl PutSpriteExt
	movs r2, #0x80
	lsls r2, r2, #3
	orrs r2, r4
	ldr r0, _080CB07C  @ 0x00001078
	str r0, [sp]
	movs r0, #2
	movs r1, #4
	adds r3, r5, #0
	bl PutSpriteExt
	movs r0, #0x80
	lsls r0, r0, #4
	orrs r4, r0
	ldr r3, _080CB080  @ gUnknown_08AA7116
	str r6, [sp]
	movs r0, #0
	movs r1, #0x10
	adds r2, r4, #0
	bl PutSpriteExt
_080CAF98:
	ldrh r0, [r7, #0x2a]
	adds r2, r0, #6
	movs r1, #1
	negs r1, r1
	movs r0, #0x50
	movs r3, #0xf
	bl sub_80CA9F8
	adds r4, r0, #0
	ldr r0, _080CB074  @ 0x0000FFFF
	cmp r4, r0
	beq _080CAFFC
	movs r0, #0x28
	negs r0, r0
	cmp r4, r0
	blt _080CAFFC
	cmp r4, #0xc8
	bgt _080CAFFC
	subs r4, #0x28
	movs r0, #0xff
	ands r4, r0
	ldr r5, _080CB078  @ gUnknown_08AA709C
	ldr r0, _080CB084  @ 0x000020F0
	str r0, [sp]
	movs r0, #1
	movs r1, #0x48
	adds r2, r4, #0
	adds r3, r5, #0
	bl PutSpriteExt
	movs r2, #0x80
	lsls r2, r2, #3
	orrs r2, r4
	ldr r0, _080CB088  @ 0x00003168
	str r0, [sp]
	movs r0, #2
	movs r1, #0x4c
	adds r3, r5, #0
	bl PutSpriteExt
	movs r0, #0x80
	lsls r0, r0, #4
	orrs r4, r0
	ldr r3, _080CB080  @ gUnknown_08AA7116
	movs r0, #0
	str r0, [sp]
	movs r1, #0x58
	adds r2, r4, #0
	bl PutSpriteExt
_080CAFFC:
	ldrh r0, [r7, #0x2a]
	adds r2, r0, #2
	movs r1, #1
	negs r1, r1
	movs r0, #0x50
	movs r3, #0xf
	bl sub_80CA9F8
	adds r4, r0, #0
	ldr r0, _080CB074  @ 0x0000FFFF
	cmp r4, r0
	beq _080CB060
	movs r0, #0x28
	negs r0, r0
	cmp r4, r0
	blt _080CB060
	cmp r4, #0xc8
	bgt _080CB060
	subs r4, #0x28
	movs r0, #0xff
	ands r4, r0
	ldr r5, _080CB078  @ gUnknown_08AA709C
	ldr r0, _080CB08C  @ 0x000041E0
	str r0, [sp]
	movs r0, #1
	movs r1, #0x90
	adds r2, r4, #0
	adds r3, r5, #0
	bl PutSpriteExt
	movs r2, #0x80
	lsls r2, r2, #3
	orrs r2, r4
	ldr r0, _080CB090  @ 0x00005258
	str r0, [sp]
	movs r0, #2
	movs r1, #0x94
	adds r3, r5, #0
	bl PutSpriteExt
	movs r0, #0x80
	lsls r0, r0, #4
	orrs r4, r0
	ldr r3, _080CB080  @ gUnknown_08AA7116
	movs r0, #0
	str r0, [sp]
	movs r1, #0xa0
	adds r2, r4, #0
	bl PutSpriteExt
_080CB060:
	ldrh r0, [r7, #0x2a]
	cmp r0, #0xf
	bne _080CB094
	movs r0, #0
	strh r0, [r7, #0x2a]
	adds r0, r7, #0
	bl Proc_Break
	b _080CB098
	.align 2, 0
_080CB074: .4byte 0x0000FFFF
_080CB078: .4byte gUnknown_08AA709C
_080CB07C: .4byte 0x00001078
_080CB080: .4byte gUnknown_08AA7116
_080CB084: .4byte 0x000020F0
_080CB088: .4byte 0x00003168
_080CB08C: .4byte 0x000041E0
_080CB090: .4byte 0x00005258
_080CB094:
	adds r0, #1
	strh r0, [r7, #0x2a]
_080CB098:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80CAF2C

	THUMB_FUNC_START sub_80CB0A0
sub_80CB0A0: @ 0x080CB0A0
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r7, r0, #0
	ldrh r0, [r7, #0x2a]
	adds r2, r0, #0
	adds r2, #0xa
	movs r0, #0x50
	movs r1, #1
	movs r3, #0xd
	bl sub_80CA9F8
	adds r4, r0, #0
	ldr r0, _080CB1E0  @ 0x0000FFFF
	cmp r4, r0
	beq _080CB10A
	movs r0, #0x28
	negs r0, r0
	cmp r4, r0
	blt _080CB10A
	cmp r4, #0xc8
	bgt _080CB10A
	movs r6, #0
	subs r4, #0x28
	movs r0, #0xff
	ands r4, r0
	ldr r5, _080CB1E4  @ gUnknown_08AA709C
	str r6, [sp]
	movs r0, #1
	movs r1, #0
	adds r2, r4, #0
	adds r3, r5, #0
	bl PutSpriteExt
	movs r2, #0x80
	lsls r2, r2, #3
	orrs r2, r4
	ldr r0, _080CB1E8  @ 0x00001078
	str r0, [sp]
	movs r0, #2
	movs r1, #4
	adds r3, r5, #0
	bl PutSpriteExt
	movs r0, #0x80
	lsls r0, r0, #4
	orrs r4, r0
	ldr r3, _080CB1EC  @ gUnknown_08AA7116
	str r6, [sp]
	movs r0, #0
	movs r1, #0x10
	adds r2, r4, #0
	bl PutSpriteExt
_080CB10A:
	ldrh r0, [r7, #0x2a]
	adds r2, r0, #6
	movs r0, #0x50
	movs r1, #1
	movs r3, #0xd
	bl sub_80CA9F8
	adds r4, r0, #0
	ldr r0, _080CB1E0  @ 0x0000FFFF
	cmp r4, r0
	beq _080CB16C
	movs r0, #0x28
	negs r0, r0
	cmp r4, r0
	blt _080CB16C
	cmp r4, #0xc8
	bgt _080CB16C
	subs r4, #0x28
	movs r0, #0xff
	ands r4, r0
	ldr r5, _080CB1E4  @ gUnknown_08AA709C
	ldr r0, _080CB1F0  @ 0x000020F0
	str r0, [sp]
	movs r0, #1
	movs r1, #0x48
	adds r2, r4, #0
	adds r3, r5, #0
	bl PutSpriteExt
	movs r2, #0x80
	lsls r2, r2, #3
	orrs r2, r4
	ldr r0, _080CB1F4  @ 0x00003168
	str r0, [sp]
	movs r0, #2
	movs r1, #0x4c
	adds r3, r5, #0
	bl PutSpriteExt
	movs r0, #0x80
	lsls r0, r0, #4
	orrs r4, r0
	ldr r3, _080CB1EC  @ gUnknown_08AA7116
	movs r0, #0
	str r0, [sp]
	movs r1, #0x58
	adds r2, r4, #0
	bl PutSpriteExt
_080CB16C:
	ldrh r0, [r7, #0x2a]
	adds r2, r0, #2
	movs r0, #0x50
	movs r1, #1
	movs r3, #0xd
	bl sub_80CA9F8
	adds r4, r0, #0
	ldr r0, _080CB1E0  @ 0x0000FFFF
	cmp r4, r0
	beq _080CB1CE
	movs r0, #0x28
	negs r0, r0
	cmp r4, r0
	blt _080CB1CE
	cmp r4, #0xc8
	bgt _080CB1CE
	subs r4, #0x28
	movs r0, #0xff
	ands r4, r0
	ldr r5, _080CB1E4  @ gUnknown_08AA709C
	ldr r0, _080CB1F8  @ 0x000041E0
	str r0, [sp]
	movs r0, #1
	movs r1, #0x90
	adds r2, r4, #0
	adds r3, r5, #0
	bl PutSpriteExt
	movs r2, #0x80
	lsls r2, r2, #3
	orrs r2, r4
	ldr r0, _080CB1FC  @ 0x00005258
	str r0, [sp]
	movs r0, #2
	movs r1, #0x94
	adds r3, r5, #0
	bl PutSpriteExt
	movs r0, #0x80
	lsls r0, r0, #4
	orrs r4, r0
	ldr r3, _080CB1EC  @ gUnknown_08AA7116
	movs r0, #0
	str r0, [sp]
	movs r1, #0xa0
	adds r2, r4, #0
	bl PutSpriteExt
_080CB1CE:
	ldrh r0, [r7, #0x2a]
	cmp r0, #0xd
	bne _080CB200
	movs r0, #0
	strh r0, [r7, #0x2a]
	adds r0, r7, #0
	bl Proc_Break
	b _080CB204
	.align 2, 0
_080CB1E0: .4byte 0x0000FFFF
_080CB1E4: .4byte gUnknown_08AA709C
_080CB1E8: .4byte 0x00001078
_080CB1EC: .4byte gUnknown_08AA7116
_080CB1F0: .4byte 0x000020F0
_080CB1F4: .4byte 0x00003168
_080CB1F8: .4byte 0x000041E0
_080CB1FC: .4byte 0x00005258
_080CB200:
	adds r0, #1
	strh r0, [r7, #0x2a]
_080CB204:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80CB0A0

	THUMB_FUNC_START sub_80CB20C
sub_80CB20C: @ 0x080CB20C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r6, r0, #0
	ldrh r0, [r6, #0x2a]
	adds r2, r0, #6
	movs r0, #1
	negs r0, r0
	mov sl, r0
	movs r0, #0x3c
	mov r1, sl
	movs r3, #0xb
	bl sub_80CA9F8
	adds r7, r0, #0
	ldr r0, _080CB2E0  @ 0x0000FFFF
	mov r9, r0
	cmp r7, r9
	beq _080CB27A
	adds r1, r7, #0
	subs r1, #0x20
	ldr r4, _080CB2E4  @ 0x000001FF
	ands r1, r4
	ldr r5, _080CB2E8  @ gUnknown_08AA709C
	movs r0, #0
	mov r8, r0
	str r0, [sp]
	movs r0, #1
	movs r2, #6
	adds r3, r5, #0
	bl PutSpriteExt
	adds r1, r7, #0
	subs r1, #0x1c
	ands r1, r4
	ldr r2, _080CB2EC  @ 0x00000406
	ldr r0, _080CB2F0  @ 0x00001078
	str r0, [sp]
	movs r0, #2
	adds r3, r5, #0
	bl PutSpriteExt
	adds r1, r7, #0
	subs r1, #0x38
	ands r1, r4
	ldr r2, _080CB2F4  @ 0x0000081E
	ldr r3, _080CB2F8  @ gUnknown_08AA70EA
	mov r0, r8
	str r0, [sp]
	movs r0, #0
	bl PutSpriteExt
_080CB27A:
	ldrh r0, [r6, #0x2a]
	adds r2, r0, #2
	movs r0, #0x3c
	mov r1, sl
	movs r3, #0xb
	bl sub_80CA9F8
	adds r7, r0, #0
	cmp r7, r9
	beq _080CB2CC
	adds r1, r7, #0
	subs r1, #0x40
	ldr r4, _080CB2E4  @ 0x000001FF
	ands r1, r4
	ldr r5, _080CB2E8  @ gUnknown_08AA709C
	ldr r0, _080CB2FC  @ 0x000020F0
	str r0, [sp]
	movs r0, #1
	movs r2, #0x3a
	adds r3, r5, #0
	bl PutSpriteExt
	adds r1, r7, #0
	subs r1, #0x3c
	ands r1, r4
	ldr r2, _080CB300  @ 0x0000043A
	ldr r0, _080CB304  @ 0x00003168
	str r0, [sp]
	movs r0, #2
	adds r3, r5, #0
	bl PutSpriteExt
	adds r1, r7, #0
	subs r1, #0x38
	ands r1, r4
	ldr r2, _080CB308  @ 0x00000852
	ldr r3, _080CB2F8  @ gUnknown_08AA70EA
	movs r0, #0
	str r0, [sp]
	bl PutSpriteExt
_080CB2CC:
	ldrh r0, [r6, #0x2a]
	cmp r0, #0xb
	bne _080CB30C
	movs r0, #0
	strh r0, [r6, #0x2a]
	adds r0, r6, #0
	bl Proc_Break
	b _080CB310
	.align 2, 0
_080CB2E0: .4byte 0x0000FFFF
_080CB2E4: .4byte 0x000001FF
_080CB2E8: .4byte gUnknown_08AA709C
_080CB2EC: .4byte 0x00000406
_080CB2F0: .4byte 0x00001078
_080CB2F4: .4byte 0x0000081E
_080CB2F8: .4byte gUnknown_08AA70EA
_080CB2FC: .4byte 0x000020F0
_080CB300: .4byte 0x0000043A
_080CB304: .4byte 0x00003168
_080CB308: .4byte 0x00000852
_080CB30C:
	adds r0, #1
	strh r0, [r6, #0x2a]
_080CB310:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80CB20C

	THUMB_FUNC_START sub_80CB320
sub_80CB320: @ 0x080CB320
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov sl, r0
	ldrh r7, [r0, #0x2a]
	cmp r7, #0
	bne _080CB3A6
	ldr r0, _080CB54C  @ gLCDControlBuffer
	mov ip, r0
	ldrb r0, [r0, #1]
	movs r2, #0x20
	orrs r0, r2
	movs r1, #0x40
	orrs r0, r1
	movs r1, #0x80
	orrs r0, r1
	mov r1, ip
	strb r0, [r1, #1]
	mov r5, ip
	adds r5, #0x34
	ldrb r0, [r5]
	orrs r0, r2
	movs r1, #2
	negs r1, r1
	mov r8, r1
	ands r0, r1
	movs r6, #3
	negs r6, r6
	ands r0, r6
	movs r4, #4
	orrs r0, r4
	movs r3, #9
	negs r3, r3
	ands r0, r3
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r5]
	adds r5, #1
	ldrb r0, [r5]
	orrs r0, r2
	mov r2, r8
	ands r0, r2
	ands r0, r6
	orrs r0, r4
	ands r0, r3
	orrs r0, r1
	strb r0, [r5]
	mov r0, ip
	adds r0, #0x2d
	strb r7, [r0]
	adds r0, #4
	strb r7, [r0]
	subs r0, #5
	strb r7, [r0]
	adds r0, #4
	strb r7, [r0]
	subs r0, #1
	strb r7, [r0]
	adds r0, #4
	strb r7, [r0]
	subs r0, #5
	strb r7, [r0]
	adds r0, #4
	strb r7, [r0]
_080CB3A6:
	mov r1, sl
	ldrh r0, [r1, #0x2a]
	adds r0, #2
	mov r9, r0
	movs r1, #1
	negs r1, r1
	movs r0, #0x1c
	mov r2, r9
	movs r3, #0xa
	bl sub_80CA9F8
	adds r7, r0, #0
	ldr r0, _080CB550  @ 0x0000FFFF
	cmp r7, r0
	beq _080CB41C
	movs r0, #0x28
	negs r0, r0
	cmp r7, r0
	blt _080CB41C
	cmp r7, #0xc8
	bgt _080CB41C
	adds r4, r7, #0
	subs r4, #0x30
	movs r6, #0xff
	ands r4, r6
	ldr r5, _080CB554  @ gUnknown_08AA709C
	movs r2, #0
	mov r8, r2
	str r2, [sp]
	movs r0, #1
	movs r1, #0x48
	adds r2, r4, #0
	adds r3, r5, #0
	bl PutSpriteExt
	movs r0, #0x80
	lsls r0, r0, #3
	orrs r4, r0
	ldr r0, _080CB558  @ 0x00001078
	str r0, [sp]
	movs r0, #2
	movs r1, #0x4c
	adds r2, r4, #0
	adds r3, r5, #0
	bl PutSpriteExt
	adds r2, r7, #0
	subs r2, #0x18
	ands r2, r6
	movs r0, #0x80
	lsls r0, r0, #4
	orrs r2, r0
	ldr r3, _080CB55C  @ gUnknown_08AA70EA
	mov r0, r8
	str r0, [sp]
	movs r0, #0
	movs r1, #0x40
	bl PutSpriteExt
_080CB41C:
	movs r0, #0x84
	movs r1, #1
	mov r2, r9
	movs r3, #0xa
	bl sub_80CA9F8
	adds r7, r0, #0
	ldr r0, _080CB550  @ 0x0000FFFF
	movs r1, #0x78
	cmp r1, r0
	beq _080CB49A
	cmp r7, r0
	beq _080CB49A
	movs r0, #0x28
	negs r0, r0
	cmp r7, r0
	blt _080CB49A
	cmp r7, #0xc8
	bgt _080CB49A
	subs r1, #0x30
	ldr r5, _080CB560  @ 0x000001FF
	ands r1, r5
	adds r4, r7, #0
	subs r4, #0x30
	movs r2, #0xff
	mov r8, r2
	ands r4, r2
	ldr r6, _080CB554  @ gUnknown_08AA709C
	ldr r0, _080CB564  @ 0x000020F0
	str r0, [sp]
	movs r0, #1
	adds r2, r4, #0
	adds r3, r6, #0
	bl PutSpriteExt
	movs r1, #0x78
	subs r1, #0x2c
	ands r1, r5
	movs r0, #0x80
	lsls r0, r0, #3
	orrs r4, r0
	ldr r0, _080CB568  @ 0x00003168
	str r0, [sp]
	movs r0, #2
	adds r2, r4, #0
	adds r3, r6, #0
	bl PutSpriteExt
	movs r1, #0x78
	subs r1, #0x38
	ands r1, r5
	adds r2, r7, #0
	subs r2, #0x18
	mov r0, r8
	ands r2, r0
	movs r0, #0x80
	lsls r0, r0, #4
	orrs r2, r0
	ldr r3, _080CB55C  @ gUnknown_08AA70EA
	movs r0, #0
	str r0, [sp]
	bl PutSpriteExt
_080CB49A:
	mov r3, r9
	subs r3, #2
	cmp r3, #7
	bhi _080CB4F2
	movs r0, #8
	str r0, [sp]
	movs r0, #4
	movs r1, #0
	movs r2, #0x18
	bl Interpolate
	adds r7, r0, #0
	ldr r3, _080CB54C  @ gLCDControlBuffer
	adds r1, r3, #0
	adds r1, #0x2d
	movs r0, #6
	strb r0, [r1]
	movs r2, #0x50
	subs r2, r2, r7
	adds r0, r3, #0
	adds r0, #0x31
	strb r2, [r0]
	subs r1, #1
	movs r0, #0x76
	strb r0, [r1]
	adds r1, r7, #0
	adds r1, #0x50
	adds r0, r3, #0
	adds r0, #0x30
	strb r1, [r0]
	adds r5, r3, #0
	adds r5, #0x2f
	movs r0, #0x7a
	strb r0, [r5]
	adds r0, r3, #0
	adds r0, #0x33
	strb r2, [r0]
	adds r2, r3, #0
	adds r2, #0x2e
	movs r0, #0xea
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x32
	strb r1, [r0]
_080CB4F2:
	ldr r4, _080CB554  @ gUnknown_08AA709C
	ldr r0, _080CB56C  @ 0x000041E0
	str r0, [sp]
	movs r0, #1
	movs r1, #0xe
	movs r2, #0x20
	adds r3, r4, #0
	bl PutSpriteExt
	movs r5, #0x84
	lsls r5, r5, #3
	ldr r0, _080CB570  @ 0x00005258
	str r0, [sp]
	movs r0, #2
	movs r1, #0x12
	adds r2, r5, #0
	adds r3, r4, #0
	bl PutSpriteExt
	ldr r0, _080CB574  @ 0x000062D0
	str r0, [sp]
	movs r0, #1
	movs r1, #0x82
	movs r2, #0x20
	adds r3, r4, #0
	bl PutSpriteExt
	ldr r0, _080CB578  @ 0x00007348
	str r0, [sp]
	movs r0, #2
	movs r1, #0x86
	adds r2, r5, #0
	adds r3, r4, #0
	bl PutSpriteExt
	mov r1, sl
	ldrh r0, [r1, #0x2a]
	cmp r0, #0xa
	bne _080CB57C
	movs r0, #0
	strh r0, [r1, #0x2a]
	mov r0, sl
	bl Proc_Break
	b _080CB582
	.align 2, 0
_080CB54C: .4byte gLCDControlBuffer
_080CB550: .4byte 0x0000FFFF
_080CB554: .4byte gUnknown_08AA709C
_080CB558: .4byte 0x00001078
_080CB55C: .4byte gUnknown_08AA70EA
_080CB560: .4byte 0x000001FF
_080CB564: .4byte 0x000020F0
_080CB568: .4byte 0x00003168
_080CB56C: .4byte 0x000041E0
_080CB570: .4byte 0x00005258
_080CB574: .4byte 0x000062D0
_080CB578: .4byte 0x00007348
_080CB57C:
	adds r0, #1
	mov r2, sl
	strh r0, [r2, #0x2a]
_080CB582:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80CB320

	THUMB_FUNC_START sub_80CB594
sub_80CB594: @ 0x080CB594
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r6, r0, #0
	ldrh r0, [r6, #0x2a]
	adds r2, r0, #6
	movs r0, #0xb4
	movs r1, #1
	movs r3, #9
	bl sub_80CA9F8
	adds r7, r0, #0
	ldr r0, _080CB660  @ 0x0000FFFF
	mov r9, r0
	cmp r7, r9
	beq _080CB5FA
	adds r1, r7, #0
	subs r1, #0x20
	ldr r4, _080CB664  @ 0x000001FF
	ands r1, r4
	ldr r5, _080CB668  @ gUnknown_08AA709C
	movs r0, #0
	mov r8, r0
	str r0, [sp]
	movs r0, #1
	movs r2, #6
	adds r3, r5, #0
	bl PutSpriteExt
	adds r1, r7, #0
	subs r1, #0x1c
	ands r1, r4
	ldr r2, _080CB66C  @ 0x00000406
	ldr r0, _080CB670  @ 0x00001078
	str r0, [sp]
	movs r0, #2
	adds r3, r5, #0
	bl PutSpriteExt
	adds r1, r7, #0
	subs r1, #0x38
	ands r1, r4
	ldr r2, _080CB674  @ 0x0000081E
	ldr r3, _080CB678  @ gUnknown_08AA70EA
	mov r0, r8
	str r0, [sp]
	movs r0, #0
	bl PutSpriteExt
_080CB5FA:
	ldrh r0, [r6, #0x2a]
	adds r2, r0, #2
	movs r0, #0xb4
	movs r1, #1
	movs r3, #9
	bl sub_80CA9F8
	adds r7, r0, #0
	cmp r7, r9
	beq _080CB64C
	adds r1, r7, #0
	subs r1, #0x40
	ldr r4, _080CB664  @ 0x000001FF
	ands r1, r4
	ldr r5, _080CB668  @ gUnknown_08AA709C
	ldr r0, _080CB67C  @ 0x000020F0
	str r0, [sp]
	movs r0, #1
	movs r2, #0x3a
	adds r3, r5, #0
	bl PutSpriteExt
	adds r1, r7, #0
	subs r1, #0x3c
	ands r1, r4
	ldr r2, _080CB680  @ 0x0000043A
	ldr r0, _080CB684  @ 0x00003168
	str r0, [sp]
	movs r0, #2
	adds r3, r5, #0
	bl PutSpriteExt
	adds r1, r7, #0
	subs r1, #0x38
	ands r1, r4
	ldr r2, _080CB688  @ 0x00000852
	ldr r3, _080CB678  @ gUnknown_08AA70EA
	movs r0, #0
	str r0, [sp]
	bl PutSpriteExt
_080CB64C:
	ldrh r0, [r6, #0x2a]
	cmp r0, #9
	bne _080CB68C
	movs r0, #0
	strh r0, [r6, #0x2a]
	adds r0, r6, #0
	bl Proc_Break
	b _080CB690
	.align 2, 0
_080CB660: .4byte 0x0000FFFF
_080CB664: .4byte 0x000001FF
_080CB668: .4byte gUnknown_08AA709C
_080CB66C: .4byte 0x00000406
_080CB670: .4byte 0x00001078
_080CB674: .4byte 0x0000081E
_080CB678: .4byte gUnknown_08AA70EA
_080CB67C: .4byte 0x000020F0
_080CB680: .4byte 0x0000043A
_080CB684: .4byte 0x00003168
_080CB688: .4byte 0x00000852
_080CB68C:
	adds r0, #1
	strh r0, [r6, #0x2a]
_080CB690:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80CB594

	THUMB_FUNC_START sub_80CB6A0
sub_80CB6A0: @ 0x080CB6A0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov r9, r0
	ldrh r0, [r0, #0x2a]
	adds r2, r0, #0
	adds r2, #0xa
	movs r0, #0x78
	mov sl, r0
	movs r0, #0x1c
	movs r1, #1
	movs r3, #8
	bl sub_80CA9F8
	adds r7, r0, #0
	ldr r0, _080CB83C  @ 0x0000FFFF
	cmp r7, r0
	beq _080CB722
	movs r0, #0x28
	negs r0, r0
	cmp r7, r0
	blt _080CB722
	cmp r7, #0xc8
	bgt _080CB722
	adds r4, r7, #0
	subs r4, #0x30
	movs r6, #0xff
	ands r4, r6
	ldr r5, _080CB840  @ gUnknown_08AA709C
	movs r1, #0
	mov r8, r1
	str r1, [sp]
	movs r0, #1
	movs r1, #0x48
	adds r2, r4, #0
	adds r3, r5, #0
	bl PutSpriteExt
	movs r0, #0x80
	lsls r0, r0, #3
	orrs r4, r0
	ldr r0, _080CB844  @ 0x00001078
	str r0, [sp]
	movs r0, #2
	movs r1, #0x4c
	adds r2, r4, #0
	adds r3, r5, #0
	bl PutSpriteExt
	adds r2, r7, #0
	subs r2, #0x18
	ands r2, r6
	movs r0, #0x80
	lsls r0, r0, #4
	orrs r2, r0
	ldr r3, _080CB848  @ gUnknown_08AA715C
	mov r0, r8
	str r0, [sp]
	movs r0, #0
	movs r1, #0x18
	bl PutSpriteExt
_080CB722:
	mov r1, r9
	ldrh r0, [r1, #0x2a]
	adds r2, r0, #6
	movs r0, #0x50
	movs r1, #1
	movs r3, #8
	bl sub_80CA9F8
	adds r7, r0, #0
	ldr r0, _080CB83C  @ 0x0000FFFF
	cmp sl, r0
	beq _080CB7A4
	cmp r7, r0
	beq _080CB7A4
	movs r0, #0x28
	negs r0, r0
	cmp r7, r0
	blt _080CB7A4
	cmp r7, #0xc8
	bgt _080CB7A4
	mov r1, sl
	subs r1, #0x30
	ldr r5, _080CB84C  @ 0x000001FF
	ands r1, r5
	adds r4, r7, #0
	subs r4, #0x30
	movs r0, #0xff
	mov r8, r0
	ands r4, r0
	ldr r6, _080CB840  @ gUnknown_08AA709C
	ldr r0, _080CB850  @ 0x000020F0
	str r0, [sp]
	movs r0, #1
	adds r2, r4, #0
	adds r3, r6, #0
	bl PutSpriteExt
	mov r1, sl
	subs r1, #0x2c
	ands r1, r5
	movs r0, #0x80
	lsls r0, r0, #3
	orrs r4, r0
	ldr r0, _080CB854  @ 0x00003168
	str r0, [sp]
	movs r0, #2
	adds r2, r4, #0
	adds r3, r6, #0
	bl PutSpriteExt
	mov r1, sl
	subs r1, #0x60
	ands r1, r5
	adds r2, r7, #0
	subs r2, #0x18
	mov r0, r8
	ands r2, r0
	movs r0, #0x80
	lsls r0, r0, #4
	orrs r2, r0
	ldr r3, _080CB848  @ gUnknown_08AA715C
	movs r0, #0
	str r0, [sp]
	bl PutSpriteExt
_080CB7A4:
	mov r1, r9
	ldrh r0, [r1, #0x2a]
	adds r2, r0, #2
	movs r0, #0x84
	movs r1, #1
	movs r3, #8
	bl sub_80CA9F8
	adds r7, r0, #0
	ldr r0, _080CB83C  @ 0x0000FFFF
	cmp sl, r0
	beq _080CB826
	cmp r7, r0
	beq _080CB826
	movs r0, #0x28
	negs r0, r0
	cmp r7, r0
	blt _080CB826
	cmp r7, #0xc8
	bgt _080CB826
	mov r1, sl
	subs r1, #0x30
	ldr r5, _080CB84C  @ 0x000001FF
	ands r1, r5
	adds r4, r7, #0
	subs r4, #0x30
	movs r0, #0xff
	mov r8, r0
	ands r4, r0
	ldr r6, _080CB840  @ gUnknown_08AA709C
	ldr r0, _080CB858  @ 0x000041E0
	str r0, [sp]
	movs r0, #1
	adds r2, r4, #0
	adds r3, r6, #0
	bl PutSpriteExt
	mov r1, sl
	subs r1, #0x2c
	ands r1, r5
	movs r0, #0x80
	lsls r0, r0, #3
	orrs r4, r0
	ldr r0, _080CB85C  @ 0x00005258
	str r0, [sp]
	movs r0, #2
	adds r2, r4, #0
	adds r3, r6, #0
	bl PutSpriteExt
	mov r1, sl
	subs r1, #0x60
	ands r1, r5
	adds r2, r7, #0
	subs r2, #0x18
	mov r0, r8
	ands r2, r0
	movs r0, #0x80
	lsls r0, r0, #4
	orrs r2, r0
	ldr r3, _080CB848  @ gUnknown_08AA715C
	movs r0, #0
	str r0, [sp]
	bl PutSpriteExt
_080CB826:
	mov r1, r9
	ldrh r0, [r1, #0x2a]
	cmp r0, #8
	bne _080CB860
	movs r0, #0
	strh r0, [r1, #0x2a]
	mov r0, r9
	bl Proc_Break
	b _080CB866
	.align 2, 0
_080CB83C: .4byte 0x0000FFFF
_080CB840: .4byte gUnknown_08AA709C
_080CB844: .4byte 0x00001078
_080CB848: .4byte gUnknown_08AA715C
_080CB84C: .4byte 0x000001FF
_080CB850: .4byte 0x000020F0
_080CB854: .4byte 0x00003168
_080CB858: .4byte 0x000041E0
_080CB85C: .4byte 0x00005258
_080CB860:
	adds r0, #1
	mov r1, r9
	strh r0, [r1, #0x2a]
_080CB866:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80CB6A0

	THUMB_FUNC_START sub_80CB878
sub_80CB878: @ 0x080CB878
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	mov r9, r0
	ldrh r0, [r0, #0x2a]
	adds r0, #2
	str r0, [sp, #4]
	movs r0, #0x1e
	mov sl, r0
	movs r1, #1
	negs r1, r1
	movs r0, #0x50
	ldr r2, [sp, #4]
	movs r3, #7
	bl sub_80CA9F8
	adds r7, r0, #0
	ldr r0, _080CBA20  @ 0x0000FFFF
	cmp r7, r0
	beq _080CB902
	movs r0, #0x28
	negs r0, r0
	cmp r7, r0
	blt _080CB902
	cmp r7, #0xc8
	bgt _080CB902
	mov r1, sl
	subs r1, #0x30
	ldr r5, _080CBA24  @ 0x000001FF
	ands r1, r5
	adds r4, r7, #0
	subs r4, #0x28
	movs r0, #0xff
	ands r4, r0
	ldr r6, _080CBA28  @ gUnknown_08AA709C
	movs r0, #0
	mov r8, r0
	str r0, [sp]
	movs r0, #1
	adds r2, r4, #0
	adds r3, r6, #0
	bl PutSpriteExt
	mov r1, sl
	subs r1, #0x2c
	ands r1, r5
	movs r2, #0x80
	lsls r2, r2, #3
	orrs r2, r4
	ldr r0, _080CBA2C  @ 0x00001078
	str r0, [sp]
	movs r0, #2
	adds r3, r6, #0
	bl PutSpriteExt
	movs r0, #0x80
	lsls r0, r0, #4
	orrs r4, r0
	ldr r3, _080CBA30  @ gUnknown_08AA712A
	mov r1, r8
	str r1, [sp]
	movs r0, #0
	movs r1, #2
	adds r2, r4, #0
	bl PutSpriteExt
_080CB902:
	ldr r0, _080CBA20  @ 0x0000FFFF
	cmp r7, r0
	beq _080CB956
	movs r0, #0x28
	negs r0, r0
	cmp r7, r0
	blt _080CB956
	cmp r7, #0xc8
	bgt _080CB956
	adds r4, r7, #0
	subs r4, #0x28
	movs r0, #0xff
	ands r4, r0
	ldr r5, _080CBA28  @ gUnknown_08AA709C
	ldr r0, _080CBA34  @ 0x000041E0
	str r0, [sp]
	movs r0, #1
	movs r1, #0x66
	adds r2, r4, #0
	adds r3, r5, #0
	bl PutSpriteExt
	movs r2, #0x80
	lsls r2, r2, #3
	orrs r2, r4
	ldr r0, _080CBA38  @ 0x00005258
	str r0, [sp]
	movs r0, #2
	movs r1, #0x6a
	adds r3, r5, #0
	bl PutSpriteExt
	movs r0, #0x80
	lsls r0, r0, #4
	orrs r4, r0
	ldr r3, _080CBA30  @ gUnknown_08AA712A
	movs r0, #0
	str r0, [sp]
	movs r1, #0x7a
	adds r2, r4, #0
	bl PutSpriteExt
_080CB956:
	movs r0, #0x50
	movs r1, #1
	ldr r2, [sp, #4]
	movs r3, #7
	bl sub_80CA9F8
	adds r7, r0, #0
	ldr r0, _080CBA20  @ 0x0000FFFF
	cmp r7, r0
	beq _080CB9B8
	movs r0, #0x28
	negs r0, r0
	cmp r7, r0
	blt _080CB9B8
	cmp r7, #0xc8
	bgt _080CB9B8
	adds r4, r7, #0
	subs r4, #0x28
	movs r0, #0xff
	ands r4, r0
	ldr r5, _080CBA28  @ gUnknown_08AA709C
	ldr r0, _080CBA3C  @ 0x000020F0
	str r0, [sp]
	movs r0, #1
	movs r1, #0x2a
	adds r2, r4, #0
	adds r3, r5, #0
	bl PutSpriteExt
	movs r2, #0x80
	lsls r2, r2, #3
	orrs r2, r4
	ldr r0, _080CBA40  @ 0x00003168
	str r0, [sp]
	movs r0, #2
	movs r1, #0x2e
	adds r3, r5, #0
	bl PutSpriteExt
	movs r0, #0x80
	lsls r0, r0, #4
	orrs r4, r0
	ldr r3, _080CBA30  @ gUnknown_08AA712A
	movs r0, #0
	str r0, [sp]
	movs r1, #0x3e
	adds r2, r4, #0
	bl PutSpriteExt
_080CB9B8:
	ldr r0, _080CBA20  @ 0x0000FFFF
	cmp r7, r0
	beq _080CBA0C
	movs r0, #0x28
	negs r0, r0
	cmp r7, r0
	blt _080CBA0C
	cmp r7, #0xc8
	bgt _080CBA0C
	adds r4, r7, #0
	subs r4, #0x28
	movs r0, #0xff
	ands r4, r0
	ldr r5, _080CBA28  @ gUnknown_08AA709C
	ldr r0, _080CBA44  @ 0x000062D0
	str r0, [sp]
	movs r0, #1
	movs r1, #0xa2
	adds r2, r4, #0
	adds r3, r5, #0
	bl PutSpriteExt
	movs r2, #0x80
	lsls r2, r2, #3
	orrs r2, r4
	ldr r0, _080CBA48  @ 0x00007348
	str r0, [sp]
	movs r0, #2
	movs r1, #0xa6
	adds r3, r5, #0
	bl PutSpriteExt
	movs r0, #0x80
	lsls r0, r0, #4
	orrs r4, r0
	ldr r3, _080CBA30  @ gUnknown_08AA712A
	movs r0, #0
	str r0, [sp]
	movs r1, #0xb6
	adds r2, r4, #0
	bl PutSpriteExt
_080CBA0C:
	mov r1, r9
	ldrh r0, [r1, #0x2a]
	cmp r0, #7
	bne _080CBA4C
	movs r0, #0
	strh r0, [r1, #0x2a]
	mov r0, r9
	bl Proc_Break
	b _080CBA52
	.align 2, 0
_080CBA20: .4byte 0x0000FFFF
_080CBA24: .4byte 0x000001FF
_080CBA28: .4byte gUnknown_08AA709C
_080CBA2C: .4byte 0x00001078
_080CBA30: .4byte gUnknown_08AA712A
_080CBA34: .4byte 0x000041E0
_080CBA38: .4byte 0x00005258
_080CBA3C: .4byte 0x000020F0
_080CBA40: .4byte 0x00003168
_080CBA44: .4byte 0x000062D0
_080CBA48: .4byte 0x00007348
_080CBA4C:
	adds r0, #1
	mov r1, r9
	strh r0, [r1, #0x2a]
_080CBA52:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80CB878

	THUMB_FUNC_START sub_80CBA64
sub_80CBA64: @ 0x080CBA64
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov r9, r0
	ldrh r0, [r0, #0x2a]
	adds r2, r0, #2
	movs r0, #0x78
	mov sl, r0
	movs r1, #1
	negs r1, r1
	movs r0, #0x1c
	movs r3, #6
	bl sub_80CA9F8
	adds r7, r0, #0
	ldr r0, _080CBC04  @ 0x0000FFFF
	cmp r7, r0
	beq _080CBAE6
	movs r0, #0x28
	negs r0, r0
	cmp r7, r0
	blt _080CBAE6
	cmp r7, #0xc8
	bgt _080CBAE6
	adds r4, r7, #0
	subs r4, #0x30
	movs r6, #0xff
	ands r4, r6
	ldr r5, _080CBC08  @ gUnknown_08AA709C
	movs r1, #0
	mov r8, r1
	str r1, [sp]
	movs r0, #1
	movs r1, #0x48
	adds r2, r4, #0
	adds r3, r5, #0
	bl PutSpriteExt
	movs r0, #0x80
	lsls r0, r0, #3
	orrs r4, r0
	ldr r0, _080CBC0C  @ 0x00001078
	str r0, [sp]
	movs r0, #2
	movs r1, #0x4c
	adds r2, r4, #0
	adds r3, r5, #0
	bl PutSpriteExt
	adds r2, r7, #0
	subs r2, #0x18
	ands r2, r6
	movs r0, #0x80
	lsls r0, r0, #4
	orrs r2, r0
	ldr r3, _080CBC10  @ gUnknown_08AA715C
	mov r0, r8
	str r0, [sp]
	movs r0, #0
	movs r1, #0x18
	bl PutSpriteExt
_080CBAE6:
	mov r1, r9
	ldrh r0, [r1, #0x2a]
	adds r2, r0, #6
	movs r1, #1
	negs r1, r1
	movs r0, #0x50
	movs r3, #6
	bl sub_80CA9F8
	adds r7, r0, #0
	ldr r0, _080CBC04  @ 0x0000FFFF
	cmp sl, r0
	beq _080CBB6A
	cmp r7, r0
	beq _080CBB6A
	movs r0, #0x28
	negs r0, r0
	cmp r7, r0
	blt _080CBB6A
	cmp r7, #0xc8
	bgt _080CBB6A
	mov r1, sl
	subs r1, #0x30
	ldr r5, _080CBC14  @ 0x000001FF
	ands r1, r5
	adds r4, r7, #0
	subs r4, #0x30
	movs r0, #0xff
	mov r8, r0
	ands r4, r0
	ldr r6, _080CBC08  @ gUnknown_08AA709C
	ldr r0, _080CBC18  @ 0x000020F0
	str r0, [sp]
	movs r0, #1
	adds r2, r4, #0
	adds r3, r6, #0
	bl PutSpriteExt
	mov r1, sl
	subs r1, #0x2c
	ands r1, r5
	movs r0, #0x80
	lsls r0, r0, #3
	orrs r4, r0
	ldr r0, _080CBC1C  @ 0x00003168
	str r0, [sp]
	movs r0, #2
	adds r2, r4, #0
	adds r3, r6, #0
	bl PutSpriteExt
	mov r1, sl
	subs r1, #0x60
	ands r1, r5
	adds r2, r7, #0
	subs r2, #0x18
	mov r0, r8
	ands r2, r0
	movs r0, #0x80
	lsls r0, r0, #4
	orrs r2, r0
	ldr r3, _080CBC10  @ gUnknown_08AA715C
	movs r0, #0
	str r0, [sp]
	bl PutSpriteExt
_080CBB6A:
	mov r1, r9
	ldrh r0, [r1, #0x2a]
	adds r2, r0, #0
	adds r2, #0xa
	movs r1, #1
	negs r1, r1
	movs r0, #0x84
	movs r3, #6
	bl sub_80CA9F8
	adds r7, r0, #0
	ldr r0, _080CBC04  @ 0x0000FFFF
	cmp sl, r0
	beq _080CBBF0
	cmp r7, r0
	beq _080CBBF0
	movs r0, #0x28
	negs r0, r0
	cmp r7, r0
	blt _080CBBF0
	cmp r7, #0xc8
	bgt _080CBBF0
	mov r1, sl
	subs r1, #0x30
	ldr r5, _080CBC14  @ 0x000001FF
	ands r1, r5
	adds r4, r7, #0
	subs r4, #0x30
	movs r0, #0xff
	mov r8, r0
	ands r4, r0
	ldr r6, _080CBC08  @ gUnknown_08AA709C
	ldr r0, _080CBC20  @ 0x000041E0
	str r0, [sp]
	movs r0, #1
	adds r2, r4, #0
	adds r3, r6, #0
	bl PutSpriteExt
	mov r1, sl
	subs r1, #0x2c
	ands r1, r5
	movs r0, #0x80
	lsls r0, r0, #3
	orrs r4, r0
	ldr r0, _080CBC24  @ 0x00005258
	str r0, [sp]
	movs r0, #2
	adds r2, r4, #0
	adds r3, r6, #0
	bl PutSpriteExt
	mov r1, sl
	subs r1, #0x60
	ands r1, r5
	adds r2, r7, #0
	subs r2, #0x18
	mov r0, r8
	ands r2, r0
	movs r0, #0x80
	lsls r0, r0, #4
	orrs r2, r0
	ldr r3, _080CBC10  @ gUnknown_08AA715C
	movs r0, #0
	str r0, [sp]
	bl PutSpriteExt
_080CBBF0:
	mov r1, r9
	ldrh r0, [r1, #0x2a]
	cmp r0, #6
	bne _080CBC28
	movs r0, #0
	strh r0, [r1, #0x2a]
	mov r0, r9
	bl Proc_Break
	b _080CBC2E
	.align 2, 0
_080CBC04: .4byte 0x0000FFFF
_080CBC08: .4byte gUnknown_08AA709C
_080CBC0C: .4byte 0x00001078
_080CBC10: .4byte gUnknown_08AA715C
_080CBC14: .4byte 0x000001FF
_080CBC18: .4byte 0x000020F0
_080CBC1C: .4byte 0x00003168
_080CBC20: .4byte 0x000041E0
_080CBC24: .4byte 0x00005258
_080CBC28:
	adds r0, #1
	mov r1, r9
	strh r0, [r1, #0x2a]
_080CBC2E:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80CBA64

	THUMB_FUNC_START sub_80CBC40
sub_80CBC40: @ 0x080CBC40
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov r8, r0
	ldrh r0, [r0, #0x2a]
	adds r0, #2
	mov r9, r0
	movs r1, #1
	negs r1, r1
	movs r0, #0x3e
	mov r2, r9
	movs r3, #5
	bl sub_80CA9F8
	adds r7, r0, #0
	ldr r0, _080CBD3C  @ 0x0000FFFF
	mov sl, r0
	cmp r7, sl
	beq _080CBCAC
	adds r1, r7, #0
	subs r1, #0x30
	ldr r4, _080CBD40  @ 0x000001FF
	ands r1, r4
	ldr r5, _080CBD44  @ gUnknown_08AA709C
	movs r6, #0
	str r6, [sp]
	movs r0, #1
	movs r2, #0x28
	adds r3, r5, #0
	bl PutSpriteExt
	adds r1, r7, #0
	subs r1, #0x2c
	ands r1, r4
	movs r2, #0x85
	lsls r2, r2, #3
	ldr r0, _080CBD48  @ 0x00001078
	str r0, [sp]
	movs r0, #2
	adds r3, r5, #0
	bl PutSpriteExt
	adds r1, r7, #0
	subs r1, #0x38
	ands r1, r4
	ldr r2, _080CBD4C  @ 0x00000828
	ldr r3, _080CBD50  @ gUnknown_08AA7194
	str r6, [sp]
	movs r0, #0
	bl PutSpriteExt
_080CBCAC:
	movs r0, #0xb2
	movs r1, #1
	mov r2, r9
	movs r3, #5
	bl sub_80CA9F8
	adds r7, r0, #0
	cmp r7, sl
	beq _080CBCFE
	adds r1, r7, #0
	subs r1, #0x30
	ldr r4, _080CBD40  @ 0x000001FF
	ands r1, r4
	ldr r5, _080CBD44  @ gUnknown_08AA709C
	ldr r0, _080CBD54  @ 0x000020F0
	str r0, [sp]
	movs r0, #1
	movs r2, #0x28
	adds r3, r5, #0
	bl PutSpriteExt
	adds r1, r7, #0
	subs r1, #0x2c
	ands r1, r4
	movs r2, #0x85
	lsls r2, r2, #3
	ldr r0, _080CBD58  @ 0x00003168
	str r0, [sp]
	movs r0, #2
	adds r3, r5, #0
	bl PutSpriteExt
	adds r1, r7, #0
	subs r1, #0x38
	ands r1, r4
	ldr r2, _080CBD4C  @ 0x00000828
	ldr r3, _080CBD50  @ gUnknown_08AA7194
	movs r0, #0
	str r0, [sp]
	bl PutSpriteExt
_080CBCFE:
	mov r1, r8
	ldrh r0, [r1, #0x2a]
	cmp r0, #1
	bne _080CBD28
	ldr r0, _080CBD5C  @ Tsa_OpAnimShinningRingBlinking
	ldr r4, _080CBD60  @ 0x0600F000
	adds r1, r4, #0
	bl Decompress
	movs r3, #0x80
	lsls r3, r3, #8
	adds r2, r3, #0
	movs r1, #0xa0
	lsls r1, r1, #2
_080CBD1A:
	ldrh r3, [r4]
	adds r0, r2, r3
	strh r0, [r4]
	subs r1, #1
	adds r4, #2
	cmp r1, #0
	bne _080CBD1A
_080CBD28:
	mov r1, r8
	ldrh r0, [r1, #0x2a]
	cmp r0, #5
	bne _080CBD64
	movs r0, #0
	strh r0, [r1, #0x2a]
	mov r0, r8
	bl Proc_Break
	b _080CBD6A
	.align 2, 0
_080CBD3C: .4byte 0x0000FFFF
_080CBD40: .4byte 0x000001FF
_080CBD44: .4byte gUnknown_08AA709C
_080CBD48: .4byte 0x00001078
_080CBD4C: .4byte 0x00000828
_080CBD50: .4byte gUnknown_08AA7194
_080CBD54: .4byte 0x000020F0
_080CBD58: .4byte 0x00003168
_080CBD5C: .4byte Tsa_OpAnimShinningRingBlinking
_080CBD60: .4byte 0x0600F000
_080CBD64:
	adds r0, #1
	mov r3, r8
	strh r0, [r3, #0x2a]
_080CBD6A:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80CBC40

	THUMB_FUNC_START sub_80CBD7C
sub_80CBD7C: @ 0x080CBD7C
	push {r4, lr}
	bl EndAllProcChildren
	bl EndProc08AA6D04
	movs r0, #0
	bl SetPrimaryHBlankHandler
	bl EndOpAnimfxTerminator
	ldr r4, _080CBDCC  @ gLCDControlBuffer
	ldrb r1, [r4]
	movs r0, #0x41
	negs r0, r0
	ands r0, r1
	strb r0, [r4]
	ldr r1, _080CBDD0  @ gPaletteBuffer
	ldr r0, _080CBDD4  @ gOpAnimSt
	ldrh r0, [r0, #0xc]
	strh r0, [r1]
	bl EnablePaletteSync
	ldrb r1, [r4, #1]
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
	strb r0, [r4, #1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080CBDCC: .4byte gLCDControlBuffer
_080CBDD0: .4byte gPaletteBuffer
_080CBDD4: .4byte gOpAnimSt

	THUMB_FUNC_END sub_80CBD7C
