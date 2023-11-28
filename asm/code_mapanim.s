	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	THUMB_FUNC_START sub_80825E8
sub_80825E8: @ 0x080825E8
	push {r4, r5, lr}
	ldr r0, _08082640  @ gManimScanlineBufs
	movs r2, #0x80
	lsls r2, r2, #5
	adds r1, r2, #0
	ldr r0, [r0]
	movs r2, #0x9f
_080825F6:
	strh r1, [r0]
	adds r0, #2
	subs r2, #1
	cmp r2, #0
	bge _080825F6
	ldr r0, _08082640  @ gManimScanlineBufs
	ldr r0, [r0]
	movs r1, #0x10
	adds r0, #0x10
	movs r2, #0x8f
_0808260A:
	strh r1, [r0]
	adds r0, #2
	subs r2, #1
	cmp r2, #0
	bge _0808260A
	movs r2, #0
	ldr r0, _08082640  @ gManimScanlineBufs
	ldr r0, [r0]
	movs r5, #0x10
	movs r1, #0x98
	lsls r1, r1, #1
	adds r4, r0, r1
	adds r3, r0, #0
_08082624:
	asrs r1, r2, #1
	subs r0, r5, r1
	lsls r0, r0, #8
	orrs r0, r1
	strh r0, [r3, #0x10]
	strh r0, [r4]
	subs r4, #2
	adds r3, #2
	adds r2, #1
	cmp r2, #0x20
	ble _08082624
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08082640: .4byte gManimScanlineBufs

	THUMB_FUNC_END sub_80825E8

	THUMB_FUNC_START sub_8082644
sub_8082644: @ 0x08082644
	ldr r2, _08082654  @ gManimScanlineBufs
	lsls r0, r0, #2
	adds r0, r0, r2
	lsls r1, r1, #1
	ldr r0, [r0]
	adds r0, r0, r1
	bx lr
	.align 2, 0
_08082654: .4byte gManimScanlineBufs

	THUMB_FUNC_END sub_8082644

	THUMB_FUNC_START sub_8082658
sub_8082658: @ 0x08082658
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	mov r8, r0
	str r1, [sp]
	str r2, [sp, #4]
	adds r7, r3, #0
	mov sl, r7
	movs r0, #0
	mov r9, r0
	cmp r7, #0
	blt _0808271E
_08082676:
	ldr r6, [sp, #4]
	add r6, r9
	adds r0, r6, #0
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _080826BA
	ldr r2, [sp]
	adds r4, r2, r7
	mov r0, r8
	adds r1, r4, #0
	adds r2, r6, #0
	bl SetScanlineBufWinR
	ldr r0, [sp, #4]
	mov r1, r9
	subs r5, r0, r1
	mov r0, r8
	adds r1, r4, #0
	adds r2, r5, #0
	bl SetScanlineBufWinR
	ldr r2, [sp]
	subs r4, r2, r7
	mov r0, r8
	adds r1, r4, #0
	adds r2, r6, #0
	bl SetScanlineBufWinL
	mov r0, r8
	adds r1, r4, #0
	adds r2, r5, #0
	bl SetScanlineBufWinL
_080826BA:
	ldr r0, [sp, #4]
	adds r6, r0, r7
	adds r0, r6, #0
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _080826FE
	ldr r4, [sp]
	add r4, r9
	mov r0, r8
	adds r1, r4, #0
	adds r2, r6, #0
	bl SetScanlineBufWinR
	ldr r2, [sp, #4]
	subs r5, r2, r7
	mov r0, r8
	adds r1, r4, #0
	adds r2, r5, #0
	bl SetScanlineBufWinR
	ldr r0, [sp]
	mov r1, r9
	subs r4, r0, r1
	mov r0, r8
	adds r1, r4, #0
	adds r2, r6, #0
	bl SetScanlineBufWinL
	mov r0, r8
	adds r1, r4, #0
	adds r2, r5, #0
	bl SetScanlineBufWinL
_080826FE:
	mov r1, sl
	adds r1, #1
	mov r2, r9
	lsls r0, r2, #1
	subs r1, r1, r0
	mov sl, r1
	cmp r1, #0
	bge _08082716
	subs r1, r7, #1
	lsls r0, r1, #1
	add sl, r0
	adds r7, r1, #0
_08082716:
	movs r0, #1
	add r9, r0
	cmp r7, r9
	bge _08082676
_0808271E:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8082658

	THUMB_FUNC_START sub_8082730
sub_8082730: @ 0x08082730
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r5, r0, #0
	adds r6, r1, #0
	mov r8, r2
	ldr r4, _08082760  @ gManimScanlineBufs
	ldr r0, [r4, #4]
	bl InitScanlineBuf
	ldr r0, [r4, #4]
	adds r1, r5, #0
	adds r2, r6, #0
	mov r3, r8
	bl sub_8082658
	bl SwapScanlineBufs
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08082760: .4byte gManimScanlineBufs

	THUMB_FUNC_END sub_8082730

	THUMB_FUNC_START sub_8082764
sub_8082764: @ 0x08082764
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	adds r1, r0, #0
	cmp r1, #0x70
	ble _08082776
	movs r1, #0x70
_08082776:
	movs r0, #0x50
	subs r4, r0, r1
	adds r1, #0x50
	mov ip, r1
	cmp r4, #0
	ble _08082798
	ldr r0, _08082858  @ gManimScanlineBufs
	movs r2, #0x80
	lsls r2, r2, #5
	adds r1, r2, #0
	ldr r0, [r0, #4]
	adds r2, r4, #0
_0808278E:
	strh r1, [r0]
	adds r0, #2
	subs r2, #1
	cmp r2, #0
	bne _0808278E
_08082798:
	mov r2, ip
	movs r7, #0x20
	adds r7, r7, r4
	mov sl, r7
	subs r0, r2, #1
	mov r9, r0
	adds r6, r2, #0
	subs r6, #0x20
	cmp r2, #0x9f
	bgt _080827C4
	ldr r0, _08082858  @ gManimScanlineBufs
	ldr r1, [r0, #4]
	movs r7, #0x80
	lsls r7, r7, #5
	adds r3, r7, #0
	lsls r0, r2, #1
	adds r0, r0, r1
_080827BA:
	strh r3, [r0]
	adds r0, #2
	adds r2, #1
	cmp r2, #0x9f
	ble _080827BA
_080827C4:
	adds r2, r4, #0
	cmp r2, #0x4f
	bgt _080827F6
	cmp r2, sl
	bge _080827F6
	ldr r0, _08082858  @ gManimScanlineBufs
	ldr r1, [r0, #4]
	movs r0, #0x10
	mov r8, r0
	mov r5, sl
	lsls r0, r2, #1
	adds r3, r0, r1
_080827DC:
	subs r1, r2, r4
	asrs r1, r1, #1
	mov r7, r8
	subs r0, r7, r1
	lsls r0, r0, #8
	orrs r0, r1
	strh r0, [r3]
	adds r3, #2
	adds r2, #1
	cmp r2, #0x4f
	bgt _080827F6
	cmp r2, r5
	blt _080827DC
_080827F6:
	mov r2, r9
	cmp r2, #0x4f
	ble _08082826
	adds r4, r6, #0
	cmp r2, r6
	blt _08082826
	ldr r0, _08082858  @ gManimScanlineBufs
	ldr r1, [r0, #4]
	movs r5, #0x10
	lsls r0, r2, #1
	adds r3, r0, r1
_0808280C:
	mov r0, ip
	subs r1, r0, r2
	asrs r1, r1, #1
	subs r0, r5, r1
	lsls r0, r0, #8
	orrs r0, r1
	strh r0, [r3]
	subs r3, #2
	subs r2, #1
	cmp r2, #0x4f
	ble _08082826
	cmp r2, r4
	bge _0808280C
_08082826:
	mov r2, sl
	adds r3, r6, #0
	cmp r2, r3
	bge _08082844
	ldr r0, _08082858  @ gManimScanlineBufs
	ldr r1, [r0, #4]
	movs r4, #0x10
	lsls r0, r2, #1
	adds r0, r0, r1
	subs r2, r3, r2
_0808283A:
	strh r4, [r0]
	adds r0, #2
	subs r2, #1
	cmp r2, #0
	bne _0808283A
_08082844:
	bl SwapScanlineBufs
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08082858: .4byte gManimScanlineBufs

	THUMB_FUNC_END sub_8082764

	THUMB_FUNC_START WorldFlushHBlank
WorldFlushHBlank: @ 0x0808285C
	push {lr}
	ldr r0, _08082874  @ 0x04000006
	ldrh r0, [r0]
	adds r3, r0, #0
	cmp r3, #0x9e
	bls _08082880
	ldr r0, _08082878  @ gManimActiveScanlineBuf
	ldr r1, _0808287C  @ gManimScanlineBufs
	ldr r1, [r1]
	str r1, [r0]
	movs r3, #0
	b _08082886
	.align 2, 0
_08082874: .4byte 0x04000006
_08082878: .4byte gManimActiveScanlineBuf
_0808287C: .4byte gManimScanlineBufs
_08082880:
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
_08082886:
	movs r0, #1
	ands r0, r3
	cmp r0, #0
	bne _0808289C
	ldr r2, _080828A0  @ 0x04000040
	ldr r0, _080828A4  @ gManimActiveScanlineBuf
	ldr r1, [r0]
	lsls r0, r3, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r2]
_0808289C:
	pop {r0}
	bx r0
	.align 2, 0
_080828A0: .4byte 0x04000040
_080828A4: .4byte gManimActiveScanlineBuf

	THUMB_FUNC_END WorldFlushHBlank

	THUMB_FUNC_START sub_80828A8
sub_80828A8: @ 0x080828A8
	push {lr}
	ldr r0, _080828C0  @ 0x04000006
	ldrh r0, [r0]
	adds r3, r0, #0
	cmp r3, #0x9e
	bls _080828CC
	ldr r0, _080828C4  @ gManimActiveScanlineBuf
	ldr r1, _080828C8  @ gManimScanlineBufs
	ldr r1, [r1]
	str r1, [r0]
	movs r3, #0
	b _080828D4
	.align 2, 0
_080828C0: .4byte 0x04000006
_080828C4: .4byte gManimActiveScanlineBuf
_080828C8: .4byte gManimScanlineBufs
_080828CC:
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	ldr r0, _080828E4  @ gManimActiveScanlineBuf
_080828D4:
	ldr r2, _080828E8  @ 0x04000052
	ldr r1, [r0]
	lsls r0, r3, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r2]
	pop {r0}
	bx r0
	.align 2, 0
_080828E4: .4byte gManimActiveScanlineBuf
_080828E8: .4byte 0x04000052

	THUMB_FUNC_END sub_80828A8

	THUMB_FUNC_START sub_80828EC
sub_80828EC: @ 0x080828EC
	push {lr}
	ldr r0, _08082910  @ 0x04000006
	ldrh r0, [r0]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #0x9f
	bls _080828FE
	movs r3, #0
_080828FE:
	ldr r2, _08082914  @ 0x0400001A
	ldr r0, _08082918  @ gManimActiveScanlineBuf
	ldr r1, [r0]
	lsls r0, r3, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r2]
	pop {r0}
	bx r0
	.align 2, 0
_08082910: .4byte 0x04000006
_08082914: .4byte 0x0400001A
_08082918: .4byte gManimActiveScanlineBuf

	THUMB_FUNC_END sub_80828EC

	THUMB_FUNC_START sub_808291C
sub_808291C: @ 0x0808291C
	push {r4, r5, lr}
	movs r3, #0
	ldr r5, _08082948  @ gManimActiveScanlineBuf
	movs r4, #1
_08082924:
	ldr r0, [r5]
	lsls r2, r3, #1
	adds r2, r2, r0
	adds r0, r3, #0
	ands r0, r4
	asrs r1, r3, #1
	adds r0, r0, r1
	negs r0, r0
	strh r0, [r2]
	adds r3, #1
	cmp r3, #0x9f
	ble _08082924
	bl SwapScanlineBufs
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08082948: .4byte gManimActiveScanlineBuf

	THUMB_FUNC_END sub_808291C

	THUMB_FUNC_START sub_808294C
sub_808294C: @ 0x0808294C
	push {lr}
	ldr r0, _08082964  @ 0x04000006
	ldrh r0, [r0]
	adds r1, r0, #0
	cmp r1, #0x9f
	bls _08082970
	ldr r0, _08082968  @ gManimActiveScanlineBuf
	ldr r1, _0808296C  @ gManimScanlineBufs
	ldr r1, [r1]
	str r1, [r0]
	movs r1, #0
	b _08082976
	.align 2, 0
_08082964: .4byte 0x04000006
_08082968: .4byte gManimActiveScanlineBuf
_0808296C: .4byte gManimScanlineBufs
_08082970:
	adds r0, r1, #1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
_08082976:
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08082998
	ldr r2, _0808299C  @ 0x04000014
	ldr r0, _080829A0  @ gManimActiveScanlineBuf
	ldr r0, [r0]
	lsls r1, r1, #1
	adds r1, r1, r0
	movs r3, #0xa0
	lsls r3, r3, #1
	adds r0, r1, r3
	ldrh r0, [r0]
	strh r0, [r2]
	adds r2, #2
	ldrh r0, [r1]
	strh r0, [r2]
_08082998:
	pop {r0}
	bx r0
	.align 2, 0
_0808299C: .4byte 0x04000014
_080829A0: .4byte gManimActiveScanlineBuf

	THUMB_FUNC_END sub_808294C

	THUMB_FUNC_START sub_80829A4
sub_80829A4: @ 0x080829A4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	adds r6, r0, #0
	ldr r0, [sp, #0x20]
	mov sl, r0
	ldr r4, [sp, #0x24]
	ldr r0, [sp, #0x28]
	adds r6, #2
	movs r7, #1
	ldr r5, _08082A20  @ gSinLookup
	mov r9, r5
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	mov r8, r2
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	mov ip, r0
	adds r2, r3, r1
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	mov r0, sl
	lsls r5, r0, #0x10
	asrs r5, r5, #0x10
	lsls r3, r3, #1
_080829E2:
	movs r0, #0xff
	ands r0, r2
	lsls r0, r0, #1
	add r0, r9
	movs r1, #0
	ldrsh r0, [r0, r1]
	mov r1, r8
	muls r1, r0, r1
	subs r0, r7, r4
	cmp r0, #0
	bge _080829FA
	subs r0, r4, r7
_080829FA:
	muls r0, r1, r0
	mov r1, ip
	muls r1, r0, r1
	asrs r0, r1, #0x14
	adds r0, r5, r0
	strh r0, [r6]
	adds r6, #4
	adds r2, r2, r3
	adds r7, #2
	cmp r7, #0x9f
	ble _080829E2
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08082A20: .4byte gSinLookup

	THUMB_FUNC_END sub_80829A4

	THUMB_FUNC_START sub_8082A24
sub_8082A24: @ 0x08082A24
	push {lr}
	ldr r0, _08082A3C  @ 0x04000006
	ldrh r0, [r0]
	adds r1, r0, #0
	cmp r1, #0x9f
	bls _08082A48
	ldr r0, _08082A40  @ gManimActiveScanlineBuf
	ldr r1, _08082A44  @ gManimScanlineBufs
	ldr r1, [r1]
	str r1, [r0]
	movs r1, #0
	b _08082A4E
	.align 2, 0
_08082A3C: .4byte 0x04000006
_08082A40: .4byte gManimActiveScanlineBuf
_08082A44: .4byte gManimScanlineBufs
_08082A48:
	adds r0, r1, #1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
_08082A4E:
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08082A70
	ldr r2, _08082A74  @ 0x04000010
	ldr r0, _08082A78  @ gManimActiveScanlineBuf
	ldr r0, [r0]
	lsls r1, r1, #1
	adds r1, r1, r0
	movs r3, #0xa0
	lsls r3, r3, #1
	adds r0, r1, r3
	ldrh r0, [r0]
	strh r0, [r2]
	adds r2, #2
	ldrh r0, [r1]
	strh r0, [r2]
_08082A70:
	pop {r0}
	bx r0
	.align 2, 0
_08082A74: .4byte 0x04000010
_08082A78: .4byte gManimActiveScanlineBuf

	THUMB_FUNC_END sub_8082A24

	THUMB_FUNC_START sub_8082A7C
sub_8082A7C: @ 0x08082A7C
	push {lr}
	ldr r0, _08082A94  @ 0x04000006
	ldrh r0, [r0]
	adds r1, r0, #0
	cmp r1, #0x9f
	bls _08082AA0
	ldr r0, _08082A98  @ gManimActiveScanlineBuf
	ldr r1, _08082A9C  @ gManimScanlineBufs
	ldr r1, [r1]
	str r1, [r0]
	movs r1, #0
	b _08082AA6
	.align 2, 0
_08082A94: .4byte 0x04000006
_08082A98: .4byte gManimActiveScanlineBuf
_08082A9C: .4byte gManimScanlineBufs
_08082AA0:
	adds r0, r1, #1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
_08082AA6:
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08082AC8
	ldr r2, _08082ACC  @ 0x04000014
	ldr r0, _08082AD0  @ gManimActiveScanlineBuf
	ldr r0, [r0]
	lsls r1, r1, #1
	adds r1, r1, r0
	movs r3, #0xa0
	lsls r3, r3, #1
	adds r0, r1, r3
	ldrh r0, [r0]
	strh r0, [r2]
	adds r2, #2
	ldrh r0, [r1]
	strh r0, [r2]
_08082AC8:
	pop {r0}
	bx r0
	.align 2, 0
_08082ACC: .4byte 0x04000014
_08082AD0: .4byte gManimActiveScanlineBuf

	THUMB_FUNC_END sub_8082A7C

	THUMB_FUNC_START sub_8082AD4
sub_8082AD4: @ 0x08082AD4
	push {lr}
	ldr r0, _08082AEC  @ 0x04000006
	ldrh r0, [r0]
	adds r1, r0, #0
	cmp r1, #0x9f
	bls _08082AF8
	ldr r0, _08082AF0  @ gManimActiveScanlineBuf
	ldr r1, _08082AF4  @ gManimScanlineBufs
	ldr r1, [r1]
	str r1, [r0]
	movs r1, #0
	b _08082AFE
	.align 2, 0
_08082AEC: .4byte 0x04000006
_08082AF0: .4byte gManimActiveScanlineBuf
_08082AF4: .4byte gManimScanlineBufs
_08082AF8:
	adds r0, r1, #1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
_08082AFE:
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08082B20
	ldr r2, _08082B24  @ 0x04000018
	ldr r0, _08082B28  @ gManimActiveScanlineBuf
	ldr r0, [r0]
	lsls r1, r1, #1
	adds r1, r1, r0
	movs r3, #0xa0
	lsls r3, r3, #1
	adds r0, r1, r3
	ldrh r0, [r0]
	strh r0, [r2]
	adds r2, #2
	ldrh r0, [r1]
	strh r0, [r2]
_08082B20:
	pop {r0}
	bx r0
	.align 2, 0
_08082B24: .4byte 0x04000018
_08082B28: .4byte gManimActiveScanlineBuf

	THUMB_FUNC_END sub_8082AD4

	THUMB_FUNC_START sub_8082B2C
sub_8082B2C: @ 0x08082B2C
	push {lr}
	ldr r0, _08082B44  @ 0x04000006
	ldrh r0, [r0]
	adds r1, r0, #0
	cmp r1, #0x9f
	bls _08082B50
	ldr r0, _08082B48  @ gManimActiveScanlineBuf
	ldr r1, _08082B4C  @ gManimScanlineBufs
	ldr r1, [r1]
	str r1, [r0]
	movs r1, #0
	b _08082B56
	.align 2, 0
_08082B44: .4byte 0x04000006
_08082B48: .4byte gManimActiveScanlineBuf
_08082B4C: .4byte gManimScanlineBufs
_08082B50:
	adds r0, r1, #1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
_08082B56:
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08082B78
	ldr r2, _08082B7C  @ 0x0400001C
	ldr r0, _08082B80  @ gManimActiveScanlineBuf
	ldr r0, [r0]
	lsls r1, r1, #1
	adds r1, r1, r0
	movs r3, #0xa0
	lsls r3, r3, #1
	adds r0, r1, r3
	ldrh r0, [r0]
	strh r0, [r2]
	adds r2, #2
	ldrh r0, [r1]
	strh r0, [r2]
_08082B78:
	pop {r0}
	bx r0
	.align 2, 0
_08082B7C: .4byte 0x0400001C
_08082B80: .4byte gManimActiveScanlineBuf

	THUMB_FUNC_END sub_8082B2C

	THUMB_FUNC_START sub_8082B84
sub_8082B84: @ 0x08082B84
	push {r4, lr}
	ldr r0, _08082B9C  @ 0x04000006
	ldrh r0, [r0]
	adds r2, r0, #0
	cmp r2, #0x9f
	bls _08082BA8
	ldr r0, _08082BA0  @ gManimActiveScanlineBuf
	ldr r1, _08082BA4  @ gManimScanlineBufs
	ldr r1, [r1]
	str r1, [r0]
	movs r2, #0
	b _08082BAE
	.align 2, 0
_08082B9C: .4byte 0x04000006
_08082BA0: .4byte gManimActiveScanlineBuf
_08082BA4: .4byte gManimScanlineBufs
_08082BA8:
	adds r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
_08082BAE:
	movs r0, #1
	ands r0, r2
	cmp r0, #0
	beq _08082BDA
	ldr r3, _08082BE0  @ 0x04000018
	ldr r0, _08082BE4  @ gManimActiveScanlineBuf
	ldr r0, [r0]
	lsls r2, r2, #1
	adds r2, r2, r0
	movs r1, #0xa0
	lsls r1, r1, #1
	adds r0, r2, r1
	ldr r4, _08082BE8  @ gLCDControlBuffer
	ldrh r0, [r0]
	ldrh r1, [r4, #0x24]
	adds r0, r0, r1
	strh r0, [r3]
	adds r3, #2
	ldrh r0, [r2]
	ldrh r1, [r4, #0x26]
	adds r0, r0, r1
	strh r0, [r3]
_08082BDA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08082BE0: .4byte 0x04000018
_08082BE4: .4byte gManimActiveScanlineBuf
_08082BE8: .4byte gLCDControlBuffer

	THUMB_FUNC_END sub_8082B84

	THUMB_FUNC_START sub_8082BEC
sub_8082BEC: @ 0x08082BEC
	push {lr}
	ldr r0, _08082C04  @ 0x04000006
	ldrh r0, [r0]
	adds r1, r0, #0
	cmp r1, #0x9f
	bls _08082C10
	ldr r0, _08082C08  @ gManimActiveScanlineBuf
	ldr r1, _08082C0C  @ gManimScanlineBufs
	ldr r1, [r1]
	str r1, [r0]
	movs r1, #0
	b _08082C16
	.align 2, 0
_08082C04: .4byte 0x04000006
_08082C08: .4byte gManimActiveScanlineBuf
_08082C0C: .4byte gManimScanlineBufs
_08082C10:
	adds r0, r1, #1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
_08082C16:
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08082C44
	ldr r2, _08082C48  @ 0x04000014
	ldr r0, _08082C4C  @ gManimActiveScanlineBuf
	ldr r0, [r0]
	lsls r1, r1, #1
	adds r1, r1, r0
	movs r0, #0xa0
	lsls r0, r0, #1
	adds r3, r1, r0
	ldrh r0, [r3]
	strh r0, [r2]
	adds r2, #2
	ldrh r0, [r1]
	strh r0, [r2]
	adds r2, #2
	ldrh r0, [r3]
	strh r0, [r2]
	adds r2, #2
	ldrh r0, [r1]
	strh r0, [r2]
_08082C44:
	pop {r0}
	bx r0
	.align 2, 0
_08082C48: .4byte 0x04000014
_08082C4C: .4byte gManimActiveScanlineBuf

	THUMB_FUNC_END sub_8082BEC

	THUMB_FUNC_START sub_8082C50
sub_8082C50: @ 0x08082C50
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x24
	adds r7, r0, #0
	str r1, [sp]
	str r2, [sp, #4]
	str r3, [sp, #8]
	ldr r0, [sp, #0x44]
	cmp r3, r0
	ble _08082D4E
	mov r9, r3
	mov r1, r9
	str r1, [sp, #0x10]
	movs r2, #0
	str r2, [sp, #0xc]
	cmp r1, #0
	bge _08082C7A
	b _08082E30
_08082C7A:
	movs r0, #0
	str r0, [sp, #0x1c]
	ldr r2, [sp, #0x44]
	mov r1, r9
	muls r1, r2, r1
	str r1, [sp, #0x20]
_08082C86:
	ldr r0, [sp, #0x20]
	ldr r1, [sp, #8]
	bl __divsi3
	mov sl, r0
	ldr r0, [sp, #0x1c]
	ldr r1, [sp, #8]
	bl __divsi3
	mov r8, r0
	ldr r4, [sp]
	add r4, r9
	ldr r6, [sp, #4]
	add r6, r8
	adds r0, r7, #0
	adds r1, r4, #0
	adds r2, r6, #0
	bl SetScanlineBufWinR
	ldr r0, [sp, #4]
	mov r1, r8
	subs r5, r0, r1
	adds r0, r7, #0
	adds r1, r4, #0
	adds r2, r5, #0
	bl SetScanlineBufWinR
	ldr r2, [sp]
	mov r0, r9
	subs r4, r2, r0
	adds r0, r7, #0
	adds r1, r4, #0
	adds r2, r6, #0
	bl SetScanlineBufWinL
	adds r0, r7, #0
	adds r1, r4, #0
	adds r2, r5, #0
	bl SetScanlineBufWinL
	ldr r1, [sp]
	ldr r2, [sp, #0xc]
	adds r4, r1, r2
	ldr r6, [sp, #4]
	add r6, sl
	adds r0, r7, #0
	adds r1, r4, #0
	adds r2, r6, #0
	bl SetScanlineBufWinR
	ldr r0, [sp, #4]
	mov r1, sl
	subs r5, r0, r1
	adds r0, r7, #0
	adds r1, r4, #0
	adds r2, r5, #0
	bl SetScanlineBufWinR
	ldr r2, [sp]
	ldr r0, [sp, #0xc]
	subs r4, r2, r0
	adds r0, r7, #0
	adds r1, r4, #0
	adds r2, r6, #0
	bl SetScanlineBufWinL
	adds r0, r7, #0
	adds r1, r4, #0
	adds r2, r5, #0
	bl SetScanlineBufWinL
	ldr r1, [sp, #0x10]
	adds r1, #1
	ldr r2, [sp, #0xc]
	lsls r0, r2, #1
	subs r1, r1, r0
	str r1, [sp, #0x10]
	cmp r1, #0
	bge _08082D3A
	mov r1, r9
	subs r1, #1
	lsls r0, r1, #1
	ldr r2, [sp, #0x10]
	adds r2, r2, r0
	str r2, [sp, #0x10]
	ldr r0, [sp, #0x20]
	ldr r2, [sp, #0x44]
	subs r0, r0, r2
	str r0, [sp, #0x20]
	mov r9, r1
_08082D3A:
	ldr r0, [sp, #0x1c]
	ldr r1, [sp, #0x44]
	adds r0, r0, r1
	str r0, [sp, #0x1c]
	ldr r2, [sp, #0xc]
	adds r2, #1
	str r2, [sp, #0xc]
	cmp r9, r2
	bge _08082C86
	b _08082E30
_08082D4E:
	ldr r0, [sp, #0x44]
	mov r9, r0
	mov r1, r9
	str r1, [sp, #0x10]
	movs r2, #0
	str r2, [sp, #0xc]
	cmp r1, #0
	blt _08082E30
	movs r0, #0
	str r0, [sp, #0x14]
	ldr r2, [sp, #8]
	mov r1, r9
	muls r1, r2, r1
	str r1, [sp, #0x18]
_08082D6A:
	ldr r0, [sp, #0x18]
	ldr r1, [sp, #0x44]
	bl __divsi3
	mov sl, r0
	ldr r0, [sp, #0x14]
	ldr r1, [sp, #0x44]
	bl __divsi3
	mov r8, r0
	ldr r4, [sp]
	add r4, sl
	ldr r0, [sp, #4]
	ldr r1, [sp, #0xc]
	adds r6, r0, r1
	adds r0, r7, #0
	adds r1, r4, #0
	adds r2, r6, #0
	bl SetScanlineBufWinR
	ldr r2, [sp, #4]
	ldr r0, [sp, #0xc]
	subs r5, r2, r0
	adds r0, r7, #0
	adds r1, r4, #0
	adds r2, r5, #0
	bl SetScanlineBufWinR
	ldr r1, [sp]
	mov r2, sl
	subs r4, r1, r2
	adds r0, r7, #0
	adds r1, r4, #0
	adds r2, r6, #0
	bl SetScanlineBufWinL
	adds r0, r7, #0
	adds r1, r4, #0
	adds r2, r5, #0
	bl SetScanlineBufWinL
	ldr r4, [sp]
	add r4, r8
	ldr r6, [sp, #4]
	add r6, r9
	adds r0, r7, #0
	adds r1, r4, #0
	adds r2, r6, #0
	bl SetScanlineBufWinR
	ldr r0, [sp, #4]
	mov r1, r9
	subs r5, r0, r1
	adds r0, r7, #0
	adds r1, r4, #0
	adds r2, r5, #0
	bl SetScanlineBufWinR
	ldr r2, [sp]
	mov r0, r8
	subs r4, r2, r0
	adds r0, r7, #0
	adds r1, r4, #0
	adds r2, r6, #0
	bl SetScanlineBufWinL
	adds r0, r7, #0
	adds r1, r4, #0
	adds r2, r5, #0
	bl SetScanlineBufWinL
	ldr r1, [sp, #0x10]
	adds r1, #1
	ldr r2, [sp, #0xc]
	lsls r0, r2, #1
	subs r1, r1, r0
	str r1, [sp, #0x10]
	cmp r1, #0
	bge _08082E1E
	mov r1, r9
	subs r1, #1
	lsls r0, r1, #1
	ldr r2, [sp, #0x10]
	adds r2, r2, r0
	str r2, [sp, #0x10]
	ldr r0, [sp, #0x18]
	ldr r2, [sp, #8]
	subs r0, r0, r2
	str r0, [sp, #0x18]
	mov r9, r1
_08082E1E:
	ldr r0, [sp, #0x14]
	ldr r1, [sp, #8]
	adds r0, r0, r1
	str r0, [sp, #0x14]
	ldr r2, [sp, #0xc]
	adds r2, #1
	str r2, [sp, #0xc]
	cmp r9, r2
	bge _08082D6A
_08082E30:
	add sp, #0x24
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8082C50

	THUMB_FUNC_START sub_8082E40
sub_8082E40: @ 0x08082E40
	push {r4, r5, r6, lr}
	mov r6, r9
	mov r5, r8
	push {r5, r6}
	sub sp, #4
	adds r6, r0, #0
	mov r8, r1
	mov r9, r2
	adds r5, r3, #0
	ldr r4, _08082E7C  @ gManimScanlineBufs
	ldr r0, [r4, #4]
	bl InitScanlineBuf
	ldr r0, [r4, #4]
	str r5, [sp]
	adds r1, r6, #0
	mov r2, r8
	mov r3, r9
	bl sub_8082C50
	bl SwapScanlineBufs
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08082E7C: .4byte gManimScanlineBufs

	THUMB_FUNC_END sub_8082E40

.align 2, 0
