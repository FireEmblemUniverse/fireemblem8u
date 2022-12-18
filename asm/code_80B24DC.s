	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	THUMB_FUNC_START sub_80B24DC
sub_80B24DC: @ 0x080B24DC
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r3, [r5, #0x5c]
	ldr r0, [r5, #0x60]
	adds r0, r3, r0
	cmp r3, r0
	bge _080B2508
	ldr r2, _080B2510  @ gUnknown_02014EF4
	ldr r1, _080B2514  @ gPaletteBuffer
	lsls r0, r3, #1
	adds r4, r0, r1
	adds r2, r0, r2
_080B24F4:
	ldrh r0, [r4]
	strh r0, [r2]
	adds r4, #2
	adds r2, #2
	adds r3, #1
	ldr r0, [r5, #0x5c]
	ldr r1, [r5, #0x60]
	adds r0, r0, r1
	cmp r3, r0
	blt _080B24F4
_080B2508:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B2510: .4byte gUnknown_02014EF4
_080B2514: .4byte gPaletteBuffer

	THUMB_FUNC_END sub_80B24DC

	THUMB_FUNC_START nullsub_67
nullsub_67: @ 0x080B2518
	bx lr

	THUMB_FUNC_END nullsub_67

	THUMB_FUNC_START sub_80B251C
sub_80B251C: @ 0x080B251C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	mov r8, r0
	adds r0, #0x4e
	ldrh r0, [r0]
	movs r2, #0x80
	lsls r2, r2, #1
	adds r1, r2, #0
	subs r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov r9, r1
	mov r0, r8
	ldr r7, [r0, #0x5c]
	ldr r0, [r0, #0x60]
	adds r0, r7, r0
	cmp r7, r0
	bge _080B25D0
	movs r1, #0xf8
	lsls r1, r1, #7
	mov sl, r1
_080B254C:
	lsls r2, r7, #1
	mov ip, r2
	ldr r0, _080B2600  @ gUnknown_02014EF4
	add r0, ip
	ldrh r6, [r0]
	mov r1, sl
	ands r1, r6
	mov r0, r8
	ldr r4, [r0, #0x58]
	adds r0, r4, #0
	mov r2, sl
	ands r0, r2
	subs r0, r1, r0
	mov r1, r9
	muls r1, r0, r1
	adds r0, r1, #0
	cmp r0, #0
	bge _080B2572
	adds r0, #0xff
_080B2572:
	asrs r0, r0, #8
	adds r2, r0, r4
	mov r0, sl
	ands r2, r0
	movs r5, #0xf8
	lsls r5, r5, #2
	adds r1, r5, #0
	ands r1, r6
	adds r0, r4, #0
	ands r0, r5
	subs r0, r1, r0
	mov r1, r9
	muls r1, r0, r1
	adds r0, r1, #0
	cmp r0, #0
	bge _080B2594
	adds r0, #0xff
_080B2594:
	asrs r0, r0, #8
	adds r3, r0, r4
	ands r3, r5
	movs r5, #0x1f
	adds r1, r5, #0
	ands r1, r6
	adds r0, r4, #0
	ands r0, r5
	subs r0, r1, r0
	mov r1, r9
	muls r1, r0, r1
	adds r0, r1, #0
	cmp r0, #0
	bge _080B25B2
	adds r0, #0xff
_080B25B2:
	asrs r0, r0, #8
	adds r0, r0, r4
	ands r0, r5
	ldr r1, _080B2604  @ gPaletteBuffer
	add r1, ip
	orrs r2, r3
	orrs r2, r0
	strh r2, [r1]
	adds r7, #1
	mov r2, r8
	ldr r0, [r2, #0x5c]
	ldr r1, [r2, #0x60]
	adds r0, r0, r1
	cmp r7, r0
	blt _080B254C
_080B25D0:
	bl EnablePaletteSync
	mov r1, r8
	adds r1, #0x4e
	mov r0, r8
	adds r0, #0x64
	ldrh r0, [r0]
	ldrh r2, [r1]
	adds r0, r0, r2
	strh r0, [r1]
	mov r0, r9
	cmp r0, #0
	bne _080B25F0
	mov r0, r8
	bl Proc_Break
_080B25F0:
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B2600: .4byte gUnknown_02014EF4
_080B2604: .4byte gPaletteBuffer

	THUMB_FUNC_END sub_80B251C

	THUMB_FUNC_START sub_80B2608
sub_80B2608: @ 0x080B2608
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	mov r8, r0
	adds r0, #0x4e
	ldrh r1, [r0]
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r2, #0
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r9, r0
	cmp r0, #0
	beq _080B26C0
	mov r4, r8
	ldr r6, [r4, #0x5c]
	ldr r0, [r4, #0x60]
	adds r0, r6, r0
	cmp r6, r0
	bge _080B26C0
	movs r5, #0xf8
	lsls r5, r5, #7
	mov sl, r5
_080B263C:
	mov r0, r8
	ldr r5, [r0, #0x58]
	adds r2, r5, #0
	mov r1, sl
	ands r2, r1
	lsls r4, r6, #1
	mov ip, r4
	ldr r3, _080B2724  @ gUnknown_02014EF4
	add r3, ip
	ldrh r1, [r3]
	mov r0, sl
	ands r0, r1
	subs r0, r2, r0
	mov r1, r9
	muls r1, r0, r1
	adds r0, r1, #0
	cmp r0, #0
	bge _080B2662
	adds r0, #0xff
_080B2662:
	asrs r0, r0, #8
	ldrh r4, [r3]
	adds r2, r0, r4
	mov r0, sl
	ands r2, r0
	movs r7, #0xf8
	lsls r7, r7, #2
	adds r1, r5, #0
	ands r1, r7
	adds r0, r4, #0
	ands r0, r7
	subs r0, r1, r0
	mov r1, r9
	muls r1, r0, r1
	adds r0, r1, #0
	cmp r0, #0
	bge _080B2686
	adds r0, #0xff
_080B2686:
	asrs r0, r0, #8
	adds r3, r0, r4
	ands r3, r7
	movs r1, #0x1f
	ands r5, r1
	adds r0, r4, #0
	ands r0, r1
	subs r0, r5, r0
	mov r5, r9
	muls r5, r0, r5
	adds r0, r5, #0
	cmp r0, #0
	bge _080B26A2
	adds r0, #0xff
_080B26A2:
	asrs r0, r0, #8
	adds r0, r0, r4
	ands r0, r1
	ldr r1, _080B2728  @ gPaletteBuffer
	add r1, ip
	orrs r2, r3
	orrs r2, r0
	strh r2, [r1]
	adds r6, #1
	mov r1, r8
	ldr r0, [r1, #0x5c]
	ldr r1, [r1, #0x60]
	adds r0, r0, r1
	cmp r6, r0
	blt _080B263C
_080B26C0:
	bl EnablePaletteSync
	mov r1, r8
	adds r1, #0x4e
	mov r0, r8
	adds r0, #0x64
	ldrh r0, [r0]
	ldrh r2, [r1]
	adds r0, r0, r2
	strh r0, [r1]
	mov r4, r9
	cmp r4, #0
	bne _080B2714
	mov r5, r8
	ldr r6, [r5, #0x5c]
	ldr r0, [r5, #0x60]
	adds r0, r6, r0
	cmp r6, r0
	bge _080B270E
	ldr r0, _080B2728  @ gPaletteBuffer
	ldr r2, _080B2724  @ gUnknown_02014EF4
	lsls r1, r6, #1
	adds r3, r1, r0
	adds r2, r1, r2
_080B26F0:
	ldrh r0, [r2]
	strh r0, [r3]
	ldrh r0, [r2]
	strh r0, [r3]
	ldrh r0, [r2]
	strh r0, [r3]
	adds r3, #2
	adds r2, #2
	adds r6, #1
	mov r1, r8
	ldr r0, [r1, #0x5c]
	ldr r1, [r1, #0x60]
	adds r0, r0, r1
	cmp r6, r0
	blt _080B26F0
_080B270E:
	mov r0, r8
	bl Proc_Break
_080B2714:
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B2724: .4byte gUnknown_02014EF4
_080B2728: .4byte gPaletteBuffer

	THUMB_FUNC_END sub_80B2608

	THUMB_FUNC_START sub_80B272C
sub_80B272C: @ 0x080B272C
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	adds r4, r2, #0
	adds r1, r3, #0
	ldr r0, _080B2758  @ gUnknown_08A2EE90
	bl Proc_StartBlocking
	adds r1, r0, #0
	adds r0, #0x64
	movs r2, #0
	strh r5, [r0]
	str r4, [r1, #0x58]
	subs r0, #0x16
	strh r2, [r0]
	cmp r6, #1
	beq _080B2768
	cmp r6, #1
	bgt _080B275C
	cmp r6, #0
	beq _080B2762
	b _080B2778
	.align 2, 0
_080B2758: .4byte gUnknown_08A2EE90
_080B275C:
	cmp r6, #2
	beq _080B2770
	b _080B2778
_080B2762:
	movs r0, #0x80
	str r0, [r1, #0x5c]
	b _080B2776
_080B2768:
	str r2, [r1, #0x5c]
	movs r0, #0x80
	lsls r0, r0, #2
	b _080B2776
_080B2770:
	str r2, [r1, #0x5c]
	movs r0, #0x80
	lsls r0, r0, #3
_080B2776:
	str r0, [r1, #0x60]
_080B2778:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80B272C

	THUMB_FUNC_START sub_80B2780
sub_80B2780: @ 0x080B2780
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	adds r4, r2, #0
	adds r1, r3, #0
	ldr r0, _080B27B0  @ gUnknown_08A2EEC0
	bl Proc_StartBlocking
	mov ip, r0
	adds r0, #0x64
	movs r1, #0
	strh r5, [r0]
	mov r0, ip
	str r4, [r0, #0x58]
	adds r0, #0x4e
	strh r1, [r0]
	cmp r6, #1
	beq _080B27C2
	cmp r6, #1
	bgt _080B27B4
	cmp r6, #0
	beq _080B27BA
	b _080B27DA
	.align 2, 0
_080B27B0: .4byte gUnknown_08A2EEC0
_080B27B4:
	cmp r6, #2
	beq _080B27CE
	b _080B27DA
_080B27BA:
	movs r0, #0x80
	mov r1, ip
	str r0, [r1, #0x5c]
	b _080B27D8
_080B27C2:
	mov r6, ip
	str r1, [r6, #0x5c]
	movs r0, #0x80
	lsls r0, r0, #2
	str r0, [r6, #0x60]
	b _080B27DA
_080B27CE:
	mov r0, ip
	str r1, [r0, #0x5c]
	movs r0, #0x80
	lsls r0, r0, #3
	mov r1, ip
_080B27D8:
	str r0, [r1, #0x60]
_080B27DA:
	mov r6, ip
	ldr r4, [r6, #0x5c]
	ldr r0, [r6, #0x60]
	adds r0, r4, r0
	cmp r4, r0
	bge _080B280A
	ldr r2, _080B2810  @ gUnknown_02014EF4
	ldr r1, _080B2814  @ gPaletteBuffer
	movs r5, #0
	lsls r0, r4, #1
	adds r3, r0, r1
	adds r2, r0, r2
_080B27F2:
	ldrh r0, [r3]
	strh r0, [r2]
	strh r5, [r3]
	adds r3, #2
	adds r2, #2
	adds r4, #1
	mov r1, ip
	ldr r0, [r1, #0x5c]
	ldr r1, [r1, #0x60]
	adds r0, r0, r1
	cmp r4, r0
	blt _080B27F2
_080B280A:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B2810: .4byte gUnknown_02014EF4
_080B2814: .4byte gPaletteBuffer

	THUMB_FUNC_END sub_80B2780

.align 2, 0
