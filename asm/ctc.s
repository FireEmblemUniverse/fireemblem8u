	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	THUMB_FUNC_START ClearIntermediateOAMBuffers
ClearIntermediateOAMBuffers: @ 0x080053A4
	push {r4, r5, r6, lr}
	movs r3, #0xf
	ldr r2, _080053DC  @ gUnknown_0202A58C
	ldr r6, _080053E0  @ gUnknown_03004970
	ldr r5, _080053E4  @ gUnknown_02029D8C
	movs r4, #0
	movs r0, #0x80
	lsls r0, r0, #1
	adds r1, r2, r0
	adds r0, r2, #0
	adds r0, #0xf0
_080053BA:
	str r1, [r0]
	str r4, [r0, #0xc]
	subs r1, #0x10
	subs r0, #0x10
	subs r3, #1
	cmp r3, #0
	bge _080053BA
	adds r0, r2, #0
	adds r0, #0xf0
	movs r1, #0
	str r1, [r0]
	subs r0, #0x30
	str r1, [r0]
	str r5, [r6]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080053DC: .4byte gUnknown_0202A58C
_080053E0: .4byte gUnknown_03004970
_080053E4: .4byte gUnknown_02029D8C

	THUMB_FUNC_START RegisterObjectAttributes_SafeMaybe
RegisterObjectAttributes_SafeMaybe: @ 0x080053E8
	push {r4, r5, r6, r7, lr}
	ldr r6, _0800541C  @ gUnknown_03004970
	ldr r5, [r6]
	ldr r4, _08005420  @ gUnknown_0202A58C
	lsls r0, r0, #4
	adds r0, r0, r4
	ldr r4, [r0]
	str r4, [r5]
	ldr r7, _08005424  @ 0x000001FF
	adds r4, r7, #0
	ands r1, r4
	strh r1, [r5, #4]
	movs r1, #0xff
	ands r2, r1
	strh r2, [r5, #6]
	mov r1, sp
	ldrh r1, [r1, #0x14]
	strh r1, [r5, #8]
	str r3, [r5, #0xc]
	str r5, [r0]
	adds r5, #0x10
	str r5, [r6]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800541C: .4byte gUnknown_03004970
_08005420: .4byte gUnknown_0202A58C
_08005424: .4byte 0x000001FF

	THUMB_FUNC_START RegisterObjectAttributes
RegisterObjectAttributes: @ 0x08005428
	push {r4, r5, r6, r7, lr}
	ldr r7, [sp, #0x14]
	ldr r6, _08005450  @ gUnknown_03004970
	ldr r4, [r6]
	ldr r5, _08005454  @ gUnknown_0202A58C
	lsls r0, r0, #4
	adds r0, r0, r5
	ldr r5, [r0]
	str r5, [r4]
	strh r1, [r4, #4]
	strh r2, [r4, #6]
	strh r7, [r4, #8]
	str r3, [r4, #0xc]
	str r4, [r0]
	adds r4, #0x10
	str r4, [r6]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08005450: .4byte gUnknown_03004970
_08005454: .4byte gUnknown_0202A58C

	THUMB_FUNC_START FlushIntermediateOAMBuffer
FlushIntermediateOAMBuffer: @ 0x08005458
	push {r4, lr}
	lsls r0, r0, #4
	ldr r1, _08005484  @ gUnknown_0202A58C
	adds r4, r0, r1
	cmp r4, #0
	beq _0800547E
_08005464:
	ldr r2, [r4, #0xc]
	cmp r2, #0
	beq _08005478
	movs r1, #4
	ldrsh r0, [r4, r1]
	movs r3, #6
	ldrsh r1, [r4, r3]
	ldrh r3, [r4, #8]
	bl CallARM_PushToSecondaryOAM
_08005478:
	ldr r4, [r4]
	cmp r4, #0
	bne _08005464
_0800547E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08005484: .4byte gUnknown_0202A58C

	THUMB_FUNC_START sub_8005488
sub_8005488: @ 0x08005488
	push {r4, lr}
	sub sp, #4
	adds r1, r0, #0
	adds r1, #0x50
	movs r2, #0
	ldrsh r4, [r1, r2]
	ldr r1, [r0, #0x2c]
	ldr r2, [r0, #0x30]
	ldr r3, [r0, #0x54]
	adds r0, #0x52
	ldrh r0, [r0]
	str r0, [sp]
	adds r0, r4, #0
	bl RegisterObjectAttributes_SafeMaybe
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_START sub_80054B0
sub_80054B0: @ 0x080054B0
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r7, r1, #0
	adds r5, r2, #0
	adds r6, r3, #0
	cmp r4, #0
	beq _080054C8
	ldr r0, _080054C4  @ gUnknown_08590FDC
	adds r1, r4, #0
	b _080054CC
	.align 2, 0
_080054C4: .4byte gUnknown_08590FDC
_080054C8:
	ldr r0, _080054F0  @ gUnknown_08590FDC
	movs r1, #3
_080054CC:
	bl Proc_Create
	adds r1, r0, #0
	str r5, [r1, #0x2c]
	str r6, [r1, #0x30]
	adds r0, r1, #0
	adds r0, #0x50
	strh r7, [r0]
	ldr r0, [sp, #0x14]
	str r0, [r1, #0x54]
	adds r2, r1, #0
	adds r2, #0x52
	ldr r0, [sp, #0x18]
	strh r0, [r2]
	adds r0, r1, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080054F0: .4byte gUnknown_08590FDC

	THUMB_FUNC_START sub_80054F4
sub_80054F4: @ 0x080054F4
	push {r4, r5, lr}
	adds r4, r1, #0
	adds r5, r2, #0
	cmp r0, #0
	bne _08005504
	ldr r0, _08005510  @ gUnknown_08590FDC
	bl Proc_Find
_08005504:
	str r4, [r0, #0x2c]
	str r5, [r0, #0x30]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08005510: .4byte gUnknown_08590FDC
