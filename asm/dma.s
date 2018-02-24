	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	THUMB_FUNC_START BG_SetPosition
BG_SetPosition: @ 0x0800148C
	push {lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r3, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	cmp r0, #1
	beq _080014C0
	cmp r0, #1
	bgt _080014AA
	cmp r0, #0
	beq _080014B4
	b _080014DE
_080014AA:
	cmp r3, #2
	beq _080014CC
	cmp r3, #3
	beq _080014D8
	b _080014DE
_080014B4:
	ldr r0, _080014BC  @ gUnknown_03003080
	strh r1, [r0, #0x1c]
	strh r2, [r0, #0x1e]
	b _080014DE
	.align 2, 0
_080014BC: .4byte gUnknown_03003080
_080014C0:
	ldr r0, _080014C8  @ gUnknown_03003080
	strh r1, [r0, #0x20]
	strh r2, [r0, #0x22]
	b _080014DE
	.align 2, 0
_080014C8: .4byte gUnknown_03003080
_080014CC:
	ldr r0, _080014D4  @ gUnknown_03003080
	strh r1, [r0, #0x24]
	strh r2, [r0, #0x26]
	b _080014DE
	.align 2, 0
_080014D4: .4byte gUnknown_03003080
_080014D8:
	ldr r0, _080014E4  @ gUnknown_03003080
	strh r1, [r0, #0x28]
	strh r2, [r0, #0x2a]
_080014DE:
	pop {r0}
	bx r0
	.align 2, 0
_080014E4: .4byte gUnknown_03003080

	THUMB_FUNC_START sub_80014E8
sub_80014E8: @ 0x080014E8
	push {lr}
	ldr r2, _0800150C  @ gUnknown_03000018
	ldr r1, _08001510  @ gUnknown_03000019
	movs r0, #0
	strb r0, [r1]
	strb r0, [r2]
	ldr r0, _08001514  @ gUnknown_02022CA8
	movs r1, #0
	bl BG_Fill
	ldr r2, _08001518  @ gUnknown_0300000D
	ldrb r0, [r2]
	movs r1, #1
	orrs r0, r1
	strb r0, [r2]
	pop {r0}
	bx r0
	.align 2, 0
_0800150C: .4byte gUnknown_03000018
_08001510: .4byte gUnknown_03000019
_08001514: .4byte gUnknown_02022CA8
_08001518: .4byte gUnknown_0300000D

	THUMB_FUNC_START sub_800151C
sub_800151C: @ 0x0800151C
	ldr r2, _08001528  @ gUnknown_03000018
	strb r0, [r2]
	ldr r0, _0800152C  @ gUnknown_03000019
	strb r1, [r0]
	bx lr
	.align 2, 0
_08001528: .4byte gUnknown_03000018
_0800152C: .4byte gUnknown_03000019

	THUMB_FUNC_START sub_8001530
sub_8001530: @ 0x08001530
	push {lr}
	adds r2, r0, #0
	ldr r3, _08001548  @ 0x0000027F
_08001536:
	ldrh r0, [r1]
	strh r0, [r2]
	adds r1, #2
	adds r2, #2
	subs r3, #1
	cmp r3, #0
	bge _08001536
	pop {r0}
	bx r0
	.align 2, 0
_08001548: .4byte 0x0000027F

	THUMB_FUNC_START sub_800154C
sub_800154C: @ 0x0800154C
	push {r4, r5, r6, r7, lr}
	mov ip, r0
	lsls r2, r2, #0x18
	lsrs r5, r2, #0x18
	lsls r3, r3, #0x18
	lsrs r7, r3, #0x18
	adds r4, r1, #2
	ldr r0, [r1]
	ldrb r6, [r1]
	lsrs r0, r0, #8
	lsls r0, r0, #0x18
	b _0800158E
_08001564:
	asrs r0, r0, #0x18
	lsls r0, r7
	mov r1, ip
	adds r2, r1, r0
	lsls r1, r6, #0x18
	lsls r3, r3, #0x18
	cmp r1, #0
	blt _08001588
_08001574:
	ldrb r0, [r4]
	adds r0, r5, r0
	strb r0, [r2]
	adds r4, #1
	adds r2, #1
	movs r0, #0xff
	lsls r0, r0, #0x18
	adds r1, r1, r0
	cmp r1, #0
	bge _08001574
_08001588:
	movs r1, #0xff
	lsls r1, r1, #0x18
	adds r0, r3, r1
_0800158E:
	lsrs r3, r0, #0x18
	lsls r0, r3, #0x18
	cmp r0, #0
	bge _08001564
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_START sub_800159C
sub_800159C: @ 0x0800159C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	str r0, [sp]
	adds r7, r1, #0
	ldr r0, [sp, #0x30]
	lsls r2, r2, #0x10
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sl, r0
	ldrb r0, [r7]
	adds r4, r0, #1
	ldrb r0, [r7, #1]
	adds r5, r0, #1
	lsls r0, r4, #0x10
	lsrs r1, r0, #0x10
	mov ip, r1
	lsls r6, r5, #0x10
	lsrs r1, r6, #0x10
	str r1, [sp, #4]
	adds r7, #2
	movs r1, #0
	str r1, [sp, #0xc]
	str r1, [sp, #8]
	lsrs r1, r2, #0x10
	mov sb, r1
	asrs r1, r2, #0x10
	asrs r0, r0, #0x10
	adds r0, r1, r0
	cmp r0, #0x20
	ble _080015EC
	movs r0, #0x20
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
_080015EC:
	cmp r1, #0
	bge _08001608
	rsbs r1, r1, #0
	lsls r1, r1, #0x10
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	lsrs r2, r1, #0x10
	str r2, [sp, #8]
	asrs r1, r1, #0x10
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	movs r0, #0
	mov sb, r0
_08001608:
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	mov r8, r0
	cmp r0, #0
	ble _080016B2
	lsls r0, r3, #0x10
	asrs r1, r0, #0x10
	asrs r0, r6, #0x10
	adds r0, r1, r0
	cmp r0, #0x20
	ble _08001626
	movs r0, #0x20
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
_08001626:
	cmp r1, #0
	bge _08001640
	rsbs r1, r1, #0
	lsls r1, r1, #0x10
	lsls r0, r5, #0x10
	asrs r0, r0, #0x10
	lsrs r2, r1, #0x10
	str r2, [sp, #0xc]
	asrs r1, r1, #0x10
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	movs r3, #0
_08001640:
	lsls r0, r5, #0x10
	asrs r4, r0, #0x10
	cmp r4, #0
	ble _080016B2
	mov r5, ip
	ldr r1, [sp, #0xc]
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	adds r0, r0, r4
	ldr r2, [sp, #4]
	subs r0, r2, r0
	muls r0, r5, r0
	lsls r0, r0, #1
	adds r7, r7, r0
	lsls r0, r3, #0x10
	asrs r0, r0, #0x10
	adds r0, r0, r4
	subs r0, #1
	lsls r0, r0, #6
	ldr r3, [sp]
	adds r0, r3, r0
	mov r2, sb
	lsls r1, r2, #0x10
	asrs r1, r1, #0xf
	adds r2, r0, r1
	subs r1, r4, #1
	cmp r1, #0
	blt _080016B2
	ldr r3, [sp, #8]
	lsls r0, r3, #0x10
	asrs r0, r0, #0xf
	mov sb, r0
	mov r6, r8
	lsls r5, r5, #1
	mov r8, r5
	mov ip, r6
_08001688:
	mov r0, sb
	adds r3, r7, r0
	adds r5, r2, #0
	subs r5, #0x40
	subs r4, r1, #1
	cmp r6, #0
	ble _080016A8
	mov r1, ip
_08001698:
	ldrh r0, [r3]
	add r0, sl
	strh r0, [r2]
	adds r3, #2
	adds r2, #2
	subs r1, #1
	cmp r1, #0
	bne _08001698
_080016A8:
	add r7, r8
	adds r2, r5, #0
	adds r1, r4, #0
	cmp r1, #0
	bge _08001688
_080016B2:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_START sub_80016C4
sub_80016C4: @ 0x080016C4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov ip, r0
	ldrh r0, [r1]
	ldrb r6, [r1]
	lsrs r0, r0, #8
	mov r8, r0
	movs r4, #0
	adds r1, #2
	movs r2, #0
	cmp r2, r8
	bge _08001704
_080016DE:
	lsls r0, r2, #6
	mov r5, ip
	adds r3, r5, r0
	adds r5, r2, #1
	cmp r6, #0
	beq _080016FE
	adds r2, r6, #0
_080016EC:
	movs r7, #0
	ldrsh r0, [r1, r7]
	adds r4, r4, r0
	adds r1, #2
	strh r4, [r3]
	adds r3, #2
	subs r2, #1
	cmp r2, #0
	bne _080016EC
_080016FE:
	adds r2, r5, #0
	cmp r2, r8
	blt _080016DE
_08001704:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_START sub_8001710
sub_8001710: @ 0x08001710
	push {lr}
	movs r1, #0x1f
	ldr r3, _08001728  @ gUnknown_02022288
	movs r2, #0
_08001718:
	adds r0, r1, r3
	strb r2, [r0]
	subs r1, #1
	cmp r1, #0
	bge _08001718
	pop {r0}
	bx r0
	.align 2, 0
_08001728: .4byte gUnknown_02022288

	THUMB_FUNC_START sub_800172C
sub_800172C: @ 0x0800172C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r4, r0, #0
	mov r8, r1
	mov sl, r2
	mov sb, r3
	asrs r3, r3, #0x1f
	movs r0, #0x20
	ands r3, r0
	lsls r0, r1, #1
	add r0, r8
	lsls r5, r0, #4
	movs r1, #0
	cmp r1, sl
	bge _0800179C
	movs r7, #0x1f
_08001752:
	mov r2, r8
	adds r0, r2, r1
	ldr r2, _080017AC  @ gUnknown_02022288
	adds r0, r0, r2
	mov r2, sb
	strb r2, [r0]
	adds r1, #1
	mov ip, r1
	movs r6, #0xf
	ldr r0, _080017B0  @ gUnknown_020222A8
	adds r2, r5, r0
_08001768:
	ldrb r1, [r4]
	adds r0, r7, #0
	ands r0, r1
	adds r0, r0, r3
	strb r0, [r2]
	adds r2, #1
	ldrh r0, [r4]
	lsrs r0, r0, #5
	ands r0, r7
	adds r0, r0, r3
	strb r0, [r2]
	adds r2, #1
	ldrh r0, [r4]
	lsrs r0, r0, #0xa
	ands r0, r7
	adds r0, r0, r3
	strb r0, [r2]
	adds r2, #1
	adds r5, #3
	adds r4, #2
	subs r6, #1
	cmp r6, #0
	bge _08001768
	mov r1, ip
	cmp r1, sl
	blt _08001752
_0800179C:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080017AC: .4byte gUnknown_02022288
_080017B0: .4byte gUnknown_020222A8

	THUMB_FUNC_START sub_80017B4
sub_80017B4: @ 0x080017B4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	mov r8, r0
	mov sb, r1
	adds r4, r2, #0
	mov sl, r3
	lsls r5, r0, #4
	lsls r1, r0, #5
	ldr r0, _08001830  @ gUnknown_020228A8
	adds r3, r1, r0
	movs r1, #0
	cmp r1, sb
	bge _08001820
	movs r7, #0x1f
_080017D6:
	mov r2, r8
	adds r0, r2, r1
	ldr r2, _08001834  @ gUnknown_02022288
	adds r0, r0, r2
	mov r2, sl
	strb r2, [r0]
	adds r1, #1
	mov ip, r1
	movs r6, #0xf
	ldr r0, _08001838  @ gUnknown_020222A8
	adds r2, r5, r0
_080017EC:
	ldrb r1, [r3]
	adds r0, r7, #0
	ands r0, r1
	adds r0, r0, r4
	strb r0, [r2]
	adds r2, #1
	ldrh r0, [r3]
	lsrs r0, r0, #5
	ands r0, r7
	adds r0, r0, r4
	strb r0, [r2]
	adds r2, #1
	ldrh r0, [r3]
	lsrs r0, r0, #0xa
	ands r0, r7
	adds r0, r0, r4
	strb r0, [r2]
	adds r2, #1
	adds r5, #3
	adds r3, #2
	subs r6, #1
	cmp r6, #0
	bge _080017EC
	mov r1, ip
	cmp r1, sb
	blt _080017D6
_08001820:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08001830: .4byte gUnknown_020228A8
_08001834: .4byte gUnknown_02022288
_08001838: .4byte gUnknown_020222A8

	THUMB_FUNC_START sub_800183C
sub_800183C: @ 0x0800183C
	push {r4, lr}
	adds r3, r0, #0
	adds r0, r3, r1
	cmp r3, r0
	bge _08001854
	ldr r4, _0800185C  @ gUnknown_02022288
	adds r1, r0, #0
_0800184A:
	adds r0, r3, r4
	strb r2, [r0]
	adds r3, #1
	cmp r3, r1
	blt _0800184A
_08001854:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800185C: .4byte gUnknown_02022288

	THUMB_FUNC_START sub_8001860
sub_8001860: @ 0x08001860
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sl, r0
	movs r1, #0x1f
	ldr r0, _080018D8  @ gUnknown_020228A8
	mov sb, r0
	ldr r6, _080018DC  @ gUnknown_020222A8
	movs r7, #0x1f
_0800187A:
	ldr r2, _080018E0  @ gUnknown_02022288
	adds r0, r1, r2
	mov r2, sl
	strb r2, [r0]
	movs r5, #0
	lsls r0, r1, #4
	mov ip, r0
	subs r1, #1
	mov r8, r1
_0800188C:
	mov r2, ip
	adds r1, r2, r5
	lsls r3, r1, #1
	adds r1, r3, r1
	adds r4, r1, r6
	add r3, sb
	ldrb r2, [r3]
	adds r0, r7, #0
	ands r0, r2
	adds r0, #0x20
	strb r0, [r4]
	adds r2, r1, #1
	adds r2, r2, r6
	ldrh r0, [r3]
	lsrs r0, r0, #5
	ands r0, r7
	adds r0, #0x20
	strb r0, [r2]
	adds r1, #2
	adds r1, r1, r6
	ldrh r0, [r3]
	lsrs r0, r0, #0xa
	ands r0, r7
	adds r0, #0x20
	strb r0, [r1]
	adds r5, #1
	cmp r5, #0xf
	ble _0800188C
	mov r1, r8
	cmp r1, #0
	bge _0800187A
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080018D8: .4byte gUnknown_020228A8
_080018DC: .4byte gUnknown_020222A8
_080018E0: .4byte gUnknown_02022288

	THUMB_FUNC_START sub_80018E4
sub_80018E4: @ 0x080018E4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sl, r0
	movs r1, #0x1f
	ldr r0, _08001958  @ gUnknown_020228A8
	mov sb, r0
	ldr r6, _0800195C  @ gUnknown_020222A8
	movs r7, #0x1f
_080018FE:
	ldr r2, _08001960  @ gUnknown_02022288
	adds r0, r1, r2
	mov r2, sl
	strb r2, [r0]
	movs r5, #0
	lsls r0, r1, #4
	mov ip, r0
	subs r1, #1
	mov r8, r1
_08001910:
	mov r2, ip
	adds r1, r2, r5
	lsls r3, r1, #1
	adds r1, r3, r1
	adds r4, r1, r6
	add r3, sb
	ldrb r2, [r3]
	adds r0, r7, #0
	ands r0, r2
	strb r0, [r4]
	adds r2, r1, #1
	adds r2, r2, r6
	ldrh r0, [r3]
	lsrs r0, r0, #5
	ands r0, r7
	strb r0, [r2]
	adds r1, #2
	adds r1, r1, r6
	ldrh r0, [r3]
	lsrs r0, r0, #0xa
	ands r0, r7
	strb r0, [r1]
	adds r5, #1
	cmp r5, #0xf
	ble _08001910
	mov r1, r8
	cmp r1, #0
	bge _080018FE
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08001958: .4byte gUnknown_020228A8
_0800195C: .4byte gUnknown_020222A8
_08001960: .4byte gUnknown_02022288

	THUMB_FUNC_START sub_8001964
sub_8001964: @ 0x08001964
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sl, r0
	movs r1, #0x1f
	ldr r0, _080019DC  @ gUnknown_020228A8
	mov sb, r0
	ldr r6, _080019E0  @ gUnknown_020222A8
	movs r7, #0x1f
_0800197E:
	ldr r2, _080019E4  @ gUnknown_02022288
	adds r0, r1, r2
	mov r2, sl
	strb r2, [r0]
	movs r5, #0
	lsls r0, r1, #4
	mov ip, r0
	subs r1, #1
	mov r8, r1
_08001990:
	mov r2, ip
	adds r1, r2, r5
	lsls r3, r1, #1
	adds r1, r3, r1
	adds r4, r1, r6
	add r3, sb
	ldrb r2, [r3]
	adds r0, r7, #0
	ands r0, r2
	adds r0, #0x20
	strb r0, [r4]
	adds r2, r1, #1
	adds r2, r2, r6
	ldrh r0, [r3]
	lsrs r0, r0, #5
	ands r0, r7
	adds r0, #0x20
	strb r0, [r2]
	adds r1, #2
	adds r1, r1, r6
	ldrh r0, [r3]
	lsrs r0, r0, #0xa
	ands r0, r7
	adds r0, #0x20
	strb r0, [r1]
	adds r5, #1
	cmp r5, #0xf
	ble _08001990
	mov r1, r8
	cmp r1, #0
	bge _0800197E
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080019DC: .4byte gUnknown_020228A8
_080019E0: .4byte gUnknown_020222A8
_080019E4: .4byte gUnknown_02022288

	THUMB_FUNC_START sub_80019E8
sub_80019E8: @ 0x080019E8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sl, r0
	movs r1, #0x1f
	ldr r0, _08001A60  @ gUnknown_020228A8
	mov sb, r0
	ldr r6, _08001A64  @ gUnknown_020222A8
	movs r7, #0x1f
_08001A02:
	ldr r2, _08001A68  @ gUnknown_02022288
	adds r0, r1, r2
	mov r2, sl
	strb r2, [r0]
	movs r5, #0
	lsls r0, r1, #4
	mov ip, r0
	subs r1, #1
	mov r8, r1
_08001A14:
	mov r2, ip
	adds r1, r2, r5
	lsls r3, r1, #1
	adds r1, r3, r1
	adds r4, r1, r6
	add r3, sb
	ldrb r2, [r3]
	adds r0, r7, #0
	ands r0, r2
	adds r0, #0x40
	strb r0, [r4]
	adds r2, r1, #1
	adds r2, r2, r6
	ldrh r0, [r3]
	lsrs r0, r0, #5
	ands r0, r7
	adds r0, #0x40
	strb r0, [r2]
	adds r1, #2
	adds r1, r1, r6
	ldrh r0, [r3]
	lsrs r0, r0, #0xa
	ands r0, r7
	adds r0, #0x40
	strb r0, [r1]
	adds r5, #1
	cmp r5, #0xf
	ble _08001A14
	mov r1, r8
	cmp r1, #0
	bge _08001A02
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08001A60: .4byte gUnknown_020228A8
_08001A64: .4byte gUnknown_020222A8
_08001A68: .4byte gUnknown_02022288

	THUMB_FUNC_START sub_8001A6C
sub_8001A6C: @ 0x08001A6C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	movs r1, #0x1f
_08001A78:
	ldr r0, _08001B48  @ gUnknown_02022288
	adds r2, r1, r0
	movs r0, #0
	ldrsb r0, [r2, r0]
	subs r3, r1, #1
	mov sb, r3
	cmp r0, #0
	beq _08001B2E
	movs r7, #0xf
	lsls r1, r1, #4
	mov r8, r1
	ldr r4, _08001B4C  @ gUnknown_020228A8
	mov sl, r4
	ldr r0, _08001B50  @ gUnknown_020222A8
	mov ip, r0
	adds r6, r2, #0
_08001A98:
	mov r3, r8
	adds r1, r3, r7
	lsls r5, r1, #1
	adds r1, r5, r1
	mov r4, ip
	adds r2, r1, r4
	ldrb r0, [r6]
	ldrb r3, [r2]
	adds r0, r0, r3
	strb r0, [r2]
	adds r0, r1, #1
	adds r3, r0, r4
	ldrb r0, [r6]
	ldrb r4, [r3]
	adds r0, r0, r4
	strb r0, [r3]
	adds r1, #2
	add r1, ip
	ldrb r0, [r6]
	ldrb r4, [r1]
	adds r0, r0, r4
	strb r0, [r1]
	movs r0, #0
	ldrsb r0, [r2, r0]
	subs r0, #0x20
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x1f
	ble _08001AD6
	movs r4, #0x1f
_08001AD6:
	lsls r0, r4, #0x10
	cmp r0, #0
	bge _08001ADE
	movs r4, #0
_08001ADE:
	movs r0, #0
	ldrsb r0, [r3, r0]
	subs r0, #0x20
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x1f
	ble _08001AF0
	movs r3, #0x1f
_08001AF0:
	lsls r0, r3, #0x10
	cmp r0, #0
	bge _08001AF8
	movs r3, #0
_08001AF8:
	movs r0, #0
	ldrsb r0, [r1, r0]
	subs r0, #0x20
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x1f
	ble _08001B0A
	movs r1, #0x1f
_08001B0A:
	lsls r0, r1, #0x10
	cmp r0, #0
	bge _08001B12
	movs r1, #0
_08001B12:
	mov r0, sl
	adds r2, r5, r0
	lsls r1, r1, #0x10
	asrs r1, r1, #6
	lsls r0, r3, #0x10
	asrs r0, r0, #0xb
	adds r1, r1, r0
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	adds r0, r0, r1
	strh r0, [r2]
	subs r7, #1
	cmp r7, #0
	bge _08001A98
_08001B2E:
	mov r1, sb
	cmp r1, #0
	bge _08001A78
	movs r0, #1
	ldr r1, _08001B54  @ gUnknown_0300000E
	strb r0, [r1]
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08001B48: .4byte gUnknown_02022288
_08001B4C: .4byte gUnknown_020228A8
_08001B50: .4byte gUnknown_020222A8
_08001B54: .4byte gUnknown_0300000E

	THUMB_FUNC_START SetupBackgrounds
SetupBackgrounds: @ 0x08001B58
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	adds r4, r0, #0
	ldr r1, _08001C30  @ gUnknown_080D7504
	mov r0, sp
	movs r2, #0x18
	bl memcpy
	cmp r4, #0
	bne _08001B6E
	mov r4, sp
_08001B6E:
	ldr r1, _08001C34  @ gUnknown_0300308C
	movs r0, #0
	strh r0, [r1]
	strh r0, [r1, #4]
	strh r0, [r1, #8]
	strh r0, [r1, #0xc]
	movs r5, #0
	add r7, sp, #0x18
_08001B7E:
	ldrh r1, [r4]
	adds r4, #2
	adds r0, r5, #0
	bl SetBackgroundTileDataOffset
	ldrh r1, [r4]
	adds r4, #2
	adds r0, r5, #0
	bl SetBackgroundMapDataOffset
	ldrh r1, [r4]
	adds r4, #2
	adds r0, r5, #0
	bl SetBackgroundScreenSize
	lsls r0, r5, #0x10
	lsrs r0, r0, #0x10
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	adds r0, r5, #0
	bl BG_GetMapBuffer
	movs r1, #0
	bl BG_Fill
	movs r6, #0
	str r6, [sp, #0x18]
	adds r0, r5, #0
	bl GetBackgroundTileDataOffset
	adds r1, r0, #0
	movs r0, #0xc0
	lsls r0, r0, #0x13
	adds r1, r1, r0
	adds r0, r7, #0
	ldr r2, _08001C38  @ 0x01000010
	bl CpuFastSet
	adds r5, #1
	cmp r5, #3
	ble _08001B7E
	bl SetupBackgroundForWeatherMaybe
	ldr r2, _08001C3C  @ gUnknown_0300000D
	ldrb r0, [r2]
	movs r1, #0xf
	orrs r0, r1
	strb r0, [r2]
	movs r0, #0
	bl SetupOAMBufferSplice
	ldr r0, _08001C40  @ gUnknown_020228A8
	strh r6, [r0]
	ldr r0, _08001C44  @ gUnknown_0300000E
	movs r4, #1
	strb r4, [r0]
	ldr r2, _08001C48  @ gUnknown_03003080
	ldrb r1, [r2]
	movs r3, #0x7f
	adds r0, r3, #0
	ands r0, r1
	movs r1, #8
	rsbs r1, r1, #0
	ands r0, r1
	strb r0, [r2]
	ldrb r1, [r2, #1]
	movs r0, #0x21
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	ands r0, r3
	orrs r0, r4
	movs r1, #2
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2, #1]
	add sp, #0x1c
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08001C30: .4byte gUnknown_080D7504
_08001C34: .4byte gUnknown_0300308C
_08001C38: .4byte 0x01000010
_08001C3C: .4byte gUnknown_0300000D
_08001C40: .4byte gUnknown_020228A8
_08001C44: .4byte gUnknown_0300000E
_08001C48: .4byte gUnknown_03003080

	THUMB_FUNC_START BG_GetMapBuffer
BG_GetMapBuffer: @ 0x08001C4C
	ldr r1, _08001C58  @ gUnknown_08587938
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	bx lr
	.align 2, 0
_08001C58: .4byte gUnknown_08587938

	THUMB_FUNC_START sub_8001C5C
sub_8001C5C: @ 0x08001C5C
	ldr r1, _08001C64  @ gUnknown_0300001A
	strb r0, [r1]
	bx lr
	.align 2, 0
_08001C64: .4byte gUnknown_0300001A

	THUMB_FUNC_START ShouldSkipHSScreen
ShouldSkipHSScreen: @ 0x08001C68
	ldr r0, _08001C74  @ gUnknown_0300001A
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bx lr
	.align 2, 0
_08001C74: .4byte gUnknown_0300001A

	THUMB_FUNC_START sub_8001C78
sub_8001C78: @ 0x08001C78
	push {lr}
	bl sub_8000D18
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08001CAA
	ldr r0, _08001C98  @ gUnknown_0858791C
	ldr r0, [r0]
	ldrh r1, [r0, #4]
	ldr r0, _08001C9C  @ 0x00000303
	cmp r1, r0
	bne _08001CA0
	movs r0, #0
	bl sub_80D16B0
	b _08001CAA
	.align 2, 0
_08001C98: .4byte gUnknown_0858791C
_08001C9C: .4byte 0x00000303
_08001CA0:
	cmp r1, #0xf
	bne _08001CAA
	movs r0, #0
	bl sub_80D16B0
_08001CAA:
	pop {r0}
	bx r0

	THUMB_FUNC_START sub_8001CB0
sub_8001CB0: @ 0x08001CB0
	push {r4, r5, lr}
	ldr r4, _08001CF0  @ 0x04000200
	ldrh r5, [r4]
	ldr r1, _08001CF4  @ 0x04000132
	ldr r2, _08001CF8  @ 0xFFFFC000
	adds r0, r0, r2
	strh r0, [r1]
	ldrh r1, [r4]
	ldr r0, _08001CFC  @ 0x0000DF7F
	ands r0, r1
	strh r0, [r4]
	ldrh r0, [r4]
	movs r2, #0x80
	lsls r2, r2, #5
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r4]
	movs r2, #0x80
	lsls r2, r2, #0x13
	ldrh r0, [r2]
	movs r1, #0x80
	orrs r0, r1
	strh r0, [r2]
	bl SoundBiasReset
	svc #3
	bl SoundBiasSet
	strh r5, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08001CF0: .4byte 0x04000200
_08001CF4: .4byte 0x04000132
_08001CF8: .4byte 0xFFFFC000
_08001CFC: .4byte 0x0000DF7F

	THUMB_FUNC_START sub_8001D00
sub_8001D00: @ 0x08001D00
	push {lr}
	ldr r0, _08001D20  @ gUnknown_03003134
	ldr r0, [r0]
	cmp r0, #0
	beq _08001D0E
	bl _call_via_r0
_08001D0E:
	ldr r0, _08001D24  @ gUnknown_03003748
	ldr r0, [r0]
	cmp r0, #0
	beq _08001D1A
	bl _call_via_r0
_08001D1A:
	pop {r0}
	bx r0
	.align 2, 0
_08001D20: .4byte gUnknown_03003134
_08001D24: .4byte gUnknown_03003748

	THUMB_FUNC_START UpdateHBlankHandlerState
UpdateHBlankHandlerState: @ 0x08001D28
	push {r4, lr}
	ldr r0, _08001D4C  @ gUnknown_03003134
	ldr r3, [r0]
	rsbs r0, r3, #0
	orrs r0, r3
	lsrs r2, r0, #0x1f
	ldr r0, _08001D50  @ gUnknown_03003748
	ldr r4, [r0]
	cmp r4, #0
	beq _08001D3E
	adds r2, #2
_08001D3E:
	cmp r2, #1
	beq _08001D80
	cmp r2, #1
	bgt _08001D54
	cmp r2, #0
	beq _08001D5E
	b _08001DC4
	.align 2, 0
_08001D4C: .4byte gUnknown_03003134
_08001D50: .4byte gUnknown_03003748
_08001D54:
	cmp r2, #2
	beq _08001D94
	cmp r2, #3
	beq _08001DA8
	b _08001DC4
_08001D5E:
	ldr r2, _08001D74  @ gUnknown_03003080
	ldrb r1, [r2, #4]
	movs r0, #0x11
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r2, #4]
	ldr r2, _08001D78  @ 0x04000200
	ldrh r1, [r2]
	ldr r0, _08001D7C  @ 0x0000FFFD
	ands r0, r1
	b _08001DC2
	.align 2, 0
_08001D74: .4byte gUnknown_03003080
_08001D78: .4byte 0x04000200
_08001D7C: .4byte 0x0000FFFD
_08001D80:
	ldr r2, _08001D90  @ gUnknown_03003080
	ldrb r0, [r2, #4]
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2, #4]
	movs r0, #1
	adds r1, r3, #0
	b _08001DB6
	.align 2, 0
_08001D90: .4byte gUnknown_03003080
_08001D94:
	ldr r2, _08001DA4  @ gUnknown_03003080
	ldrb r0, [r2, #4]
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2, #4]
	movs r0, #1
	adds r1, r4, #0
	b _08001DB6
	.align 2, 0
_08001DA4: .4byte gUnknown_03003080
_08001DA8:
	ldr r2, _08001DCC  @ gUnknown_03003080
	ldrb r0, [r2, #4]
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2, #4]
	ldr r1, _08001DD0  @ sub_8001D00
	movs r0, #1
_08001DB6:
	bl SetIRQHandler
	ldr r2, _08001DD4  @ 0x04000200
	ldrh r0, [r2]
	movs r1, #2
	orrs r0, r1
_08001DC2:
	strh r0, [r2]
_08001DC4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08001DCC: .4byte gUnknown_03003080
_08001DD0: .4byte sub_8001D00
_08001DD4: .4byte 0x04000200

	THUMB_FUNC_START SetPrimaryHBlankHandler
SetPrimaryHBlankHandler: @ 0x08001DD8
	push {lr}
	ldr r1, _08001DE8  @ gUnknown_03003134
	str r0, [r1]
	bl UpdateHBlankHandlerState
	pop {r0}
	bx r0
	.align 2, 0
_08001DE8: .4byte gUnknown_03003134

	THUMB_FUNC_START SetSecondaryHBlankHandler
SetSecondaryHBlankHandler: @ 0x08001DEC
	push {lr}
	ldr r1, _08001DFC  @ gUnknown_03003748
	str r0, [r1]
	bl UpdateHBlankHandlerState
	pop {r0}
	bx r0
	.align 2, 0
_08001DFC: .4byte gUnknown_03003748

	THUMB_FUNC_START GetBackgroundFromBufferPointer
GetBackgroundFromBufferPointer: @ 0x08001E00
	push {lr}
	adds r1, r0, #0
	ldr r0, _08001E18  @ gUnknown_02022CA8
	cmp r1, r0
	blo _08001E1C
	movs r2, #0x80
	lsls r2, r2, #4
	adds r0, r0, r2
	cmp r1, r0
	bhs _08001E1C
	movs r0, #0
	b _08001E68
	.align 2, 0
_08001E18: .4byte gUnknown_02022CA8
_08001E1C:
	ldr r0, _08001E30  @ gUnknown_020234A8
	cmp r1, r0
	blo _08001E34
	movs r2, #0x80
	lsls r2, r2, #4
	adds r0, r0, r2
	cmp r1, r0
	bhs _08001E34
	movs r0, #1
	b _08001E68
	.align 2, 0
_08001E30: .4byte gUnknown_020234A8
_08001E34:
	ldr r0, _08001E48  @ gUnknown_02023CA8
	cmp r1, r0
	blo _08001E4C
	movs r2, #0x80
	lsls r2, r2, #4
	adds r0, r0, r2
	cmp r1, r0
	bhs _08001E4C
	movs r0, #2
	b _08001E68
	.align 2, 0
_08001E48: .4byte gUnknown_02023CA8
_08001E4C:
	ldr r0, _08001E60  @ gUnknown_020244A8
	cmp r1, r0
	blo _08001E64
	movs r2, #0x80
	lsls r2, r2, #4
	adds r0, r0, r2
	cmp r1, r0
	bhs _08001E64
	movs r0, #3
	b _08001E68
	.align 2, 0
_08001E60: .4byte gUnknown_020244A8
_08001E64:
	movs r0, #1
	rsbs r0, r0, #0
_08001E68:
	pop {r1}
	bx r1

	THUMB_FUNC_START BG_SetDepth
BG_SetDepth: @ 0x08001E6C
	ldr r2, _08001E88  @ gUnknown_08587948
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r3, [r0]
	movs r0, #3
	ands r1, r0
	ldrb r2, [r3]
	movs r0, #4
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	bx lr
	.align 2, 0
_08001E88: .4byte gUnknown_08587948

	THUMB_FUNC_START BG_GetDepth
BG_GetDepth: @ 0x08001E8C
	ldr r1, _08001E9C  @ gUnknown_08587948
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r0, [r0]
	lsls r0, r0, #0x1e
	lsrs r0, r0, #0x1e
	bx lr
	.align 2, 0
_08001E9C: .4byte gUnknown_08587948

	THUMB_FUNC_START SetSpecialColorEffectsParameters
SetSpecialColorEffectsParameters: @ 0x08001EA0
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x10
	ldr r4, _08001ECC  @ gUnknown_03003080
	mov ip, r4
	mov r6, ip
	adds r6, #0x3c
	lsrs r0, r0, #0xa
	ldrb r5, [r6]
	movs r4, #0x3f
	ands r4, r5
	orrs r4, r0
	strb r4, [r6]
	mov r0, ip
	adds r0, #0x44
	strb r1, [r0]
	adds r0, #1
	strb r2, [r0]
	adds r0, #1
	strb r3, [r0]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08001ECC: .4byte gUnknown_03003080

	THUMB_FUNC_START sub_8001ED0
sub_8001ED0: @ 0x08001ED0
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	ldr r6, [sp, #0x14]
	ldr r4, _08001F04  @ gUnknown_030030BC
	mov r8, r4
	ldrh r5, [r4]
	ldr r4, _08001F08  @ 0x0000FFE0
	ands r4, r5
	lsls r1, r1, #1
	orrs r1, r0
	lsls r2, r2, #2
	orrs r2, r1
	lsls r3, r3, #3
	orrs r3, r2
	lsls r6, r6, #4
	orrs r6, r3
	orrs r4, r6
	mov r0, r8
	strh r4, [r0]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08001F04: .4byte gUnknown_030030BC
_08001F08: .4byte 0x0000FFE0

	THUMB_FUNC_START sub_8001F0C
sub_8001F0C: @ 0x08001F0C
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	ldr r6, [sp, #0x14]
	ldr r4, _08001F40  @ gUnknown_030030BC
	mov r8, r4
	ldrh r4, [r4]
	ldr r5, _08001F44  @ 0x0000E0FF
	ands r5, r4
	lsls r0, r0, #8
	lsls r1, r1, #9
	orrs r0, r1
	lsls r2, r2, #0xa
	orrs r0, r2
	lsls r3, r3, #0xb
	orrs r0, r3
	lsls r6, r6, #0xc
	orrs r0, r6
	orrs r5, r0
	mov r0, r8
	strh r5, [r0]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08001F40: .4byte gUnknown_030030BC
_08001F44: .4byte 0x0000E0FF

	THUMB_FUNC_START sub_8001F48
sub_8001F48: @ 0x08001F48
	ldr r2, _08001F60  @ gUnknown_03003080
	adds r2, #0x3c
	movs r1, #1
	ands r0, r1
	lsls r0, r0, #5
	ldrb r3, [r2]
	movs r1, #0x21
	rsbs r1, r1, #0
	ands r1, r3
	orrs r1, r0
	strb r1, [r2]
	bx lr
	.align 2, 0
_08001F60: .4byte gUnknown_03003080

	THUMB_FUNC_START sub_8001F64
sub_8001F64: @ 0x08001F64
	ldr r2, _08001F7C  @ gUnknown_03003080
	adds r2, #0x3d
	movs r1, #1
	ands r0, r1
	lsls r0, r0, #5
	ldrb r3, [r2]
	movs r1, #0x21
	rsbs r1, r1, #0
	ands r1, r3
	orrs r1, r0
	strb r1, [r2]
	bx lr
	.align 2, 0
_08001F7C: .4byte gUnknown_03003080

	THUMB_FUNC_START SetDefaultColorEffects
SetDefaultColorEffects: @ 0x08001F80
	push {lr}
	movs r0, #0
	movs r1, #0x10
	movs r2, #0
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	pop {r0}
	bx r0

	THUMB_FUNC_START EnablePaletteSync
EnablePaletteSync: @ 0x08001F94
	ldr r1, _08001F9C  @ gUnknown_0300000E
	movs r0, #1
	strb r0, [r1]
	bx lr
	.align 2, 0
_08001F9C: .4byte gUnknown_0300000E

	THUMB_FUNC_START DisablePaletteSync
DisablePaletteSync: @ 0x08001FA0
	ldr r1, _08001FA8  @ gUnknown_0300000E
	movs r0, #0
	strb r0, [r1]
	bx lr
	.align 2, 0
_08001FA8: .4byte gUnknown_0300000E

	THUMB_FUNC_START BG_EnableSyncByMask
BG_EnableSyncByMask: @ 0x08001FAC
	ldr r2, _08001FB8  @ gUnknown_0300000D
	ldrb r1, [r2]
	orrs r0, r1
	strb r0, [r2]
	bx lr
	.align 2, 0
_08001FB8: .4byte gUnknown_0300000D

	THUMB_FUNC_START BG_EnableSync
BG_EnableSync: @ 0x08001FBC
	ldr r2, _08001FCC  @ gUnknown_0300000D
	movs r1, #1
	lsls r1, r0
	ldrb r0, [r2]
	orrs r1, r0
	strb r1, [r2]
	bx lr
	.align 2, 0
_08001FCC: .4byte gUnknown_0300000D

	THUMB_FUNC_START sub_8001FD0
sub_8001FD0: @ 0x08001FD0
	ldr r2, _08001FDC  @ gUnknown_0300000D
	ldrb r1, [r2]
	bics r1, r0
	strb r1, [r2]
	bx lr
	.align 2, 0
_08001FDC: .4byte gUnknown_0300000D

	THUMB_FUNC_START ClearTileRigistry
ClearTileRigistry: @ 0x08001FE0
	push {lr}
	ldr r1, _0800200C  @ gUnknown_02024CD4
	movs r0, #0
	str r0, [r1]
	str r0, [r1, #4]
	ldr r3, _08002010  @ gUnknown_02024CDC
	movs r1, #0
	adds r0, r3, #0
	movs r2, #0x1f
_08001FF2:
	str r1, [r0]
	str r1, [r0, #4]
	strh r1, [r0, #8]
	strh r1, [r0, #0xa]
	adds r0, #0xc
	subs r2, #1
	cmp r2, #0
	bge _08001FF2
	movs r0, #0
	str r0, [r3]
	pop {r0}
	bx r0
	.align 2, 0
_0800200C: .4byte gUnknown_02024CD4
_08002010: .4byte gUnknown_02024CDC

	THUMB_FUNC_START RegisterTileGraphics
RegisterTileGraphics: @ 0x08002014
	push {r4, r5, lr}
	adds r4, r2, #0
	ldr r5, _0800204C  @ gUnknown_02024CD4
	ldr r3, [r5]
	lsls r2, r3, #1
	adds r2, r2, r3
	lsls r2, r2, #2
	ldr r3, _08002050  @ gUnknown_02024CDC
	adds r2, r2, r3
	str r0, [r2]
	str r1, [r2, #4]
	strh r4, [r2, #8]
	movs r1, #0
	movs r0, #0x1f
	ands r0, r4
	cmp r0, #0
	bne _08002038
	movs r1, #1
_08002038:
	strh r1, [r2, #0xa]
	ldr r0, [r5, #4]
	adds r0, r0, r4
	str r0, [r5, #4]
	ldr r0, [r5]
	adds r0, #1
	str r0, [r5]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0800204C: .4byte gUnknown_02024CD4
_08002050: .4byte gUnknown_02024CDC

	THUMB_FUNC_START RegisterFillTile
RegisterFillTile: @ 0x08002054
	push {r4, r5, lr}
	ldr r5, _08002080  @ gUnknown_02024CD4
	ldr r4, [r5]
	lsls r3, r4, #1
	adds r3, r3, r4
	lsls r3, r3, #2
	ldr r4, _08002084  @ gUnknown_02024CDC
	adds r3, r3, r4
	str r0, [r3]
	str r1, [r3, #4]
	strh r2, [r3, #8]
	movs r0, #2
	strh r0, [r3, #0xa]
	ldr r0, [r5, #4]
	adds r0, r0, r2
	str r0, [r5, #4]
	ldr r0, [r5]
	adds r0, #1
	str r0, [r5]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08002080: .4byte gUnknown_02024CD4
_08002084: .4byte gUnknown_02024CDC

	THUMB_FUNC_START FlushTiles
FlushTiles: @ 0x08002088
	push {r4, r5, lr}
	sub sp, #4
	ldr r4, _08002094  @ gUnknown_02024CDC
	movs r5, #0
	b _080020E4
	.align 2, 0
_08002094: .4byte gUnknown_02024CDC
_08002098:
	ldrh r0, [r4, #0xa]
	cmp r0, #1
	beq _080020BC
	cmp r0, #1
	bgt _080020A8
	cmp r0, #0
	beq _080020AE
	b _080020E0
_080020A8:
	cmp r0, #2
	beq _080020CA
	b _080020E0
_080020AE:
	ldr r0, [r4]
	ldr r1, [r4, #4]
	ldrh r2, [r4, #8]
	lsrs r2, r2, #1
	bl CpuSet
	b _080020E0
_080020BC:
	ldr r0, [r4]
	ldr r1, [r4, #4]
	ldrh r2, [r4, #8]
	lsrs r2, r2, #2
	bl CpuFastSet
	b _080020E0
_080020CA:
	ldr r0, [r4]
	str r0, [sp]
	ldr r1, [r4, #4]
	ldrh r2, [r4, #8]
	lsrs r2, r2, #2
	movs r0, #0x80
	lsls r0, r0, #0x11
	orrs r2, r0
	mov r0, sp
	bl CpuFastSet
_080020E0:
	adds r4, #0xc
	adds r5, #1
_080020E4:
	ldr r0, _080020F8  @ gUnknown_02024CD4
	ldr r0, [r0]
	cmp r5, r0
	blt _08002098
	bl ClearTileRigistry
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080020F8: .4byte gUnknown_02024CD4

	THUMB_FUNC_START SetupOAMBufferSplice
SetupOAMBufferSplice: @ 0x080020FC
	push {r4, lr}
	ldr r2, _0800212C  @ gUnknown_03000030
	ldr r3, _08002130  @ gUnknown_03003140
	str r3, [r2]
	movs r4, #0xe0
	lsls r4, r4, #0x13
	str r4, [r2, #4]
	movs r1, #0
	strh r1, [r2, #8]
	strh r0, [r2, #0xa]
	ldr r2, _08002134  @ gUnknown_03000020
	lsls r1, r0, #3
	adds r3, r1, r3
	str r3, [r2]
	adds r4, r1, r4
	str r4, [r2, #4]
	strh r1, [r2, #8]
	movs r1, #0x80
	subs r1, r1, r0
	strh r1, [r2, #0xa]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800212C: .4byte gUnknown_03000030
_08002130: .4byte gUnknown_03003140
_08002134: .4byte gUnknown_03000020

	THUMB_FUNC_START FlushSecondaryOAM
FlushSecondaryOAM: @ 0x08002138
	push {r4, lr}
	ldr r4, _08002168  @ gUnknown_03000020
	ldr r0, [r4]
	ldr r1, [r4, #4]
	ldrh r2, [r4, #0xa]
	lsls r2, r2, #1
	bl CpuFastSet
	ldr r0, [r4]
	ldrh r1, [r4, #0xa]
	bl ClearOAMBuffer
	ldr r1, _0800216C  @ gUnknown_03003744
	ldr r0, [r4]
	str r0, [r1]
	ldr r1, _08002170  @ gUnknown_03004158
	ldr r0, _08002174  @ gUnknown_03003140
	str r0, [r1]
	ldr r1, _08002178  @ gUnknown_0300312C
	movs r0, #0
	strh r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08002168: .4byte gUnknown_03000020
_0800216C: .4byte gUnknown_03003744
_08002170: .4byte gUnknown_03004158
_08002174: .4byte gUnknown_03003140
_08002178: .4byte gUnknown_0300312C

	THUMB_FUNC_START FlushPrimaryOAM
FlushPrimaryOAM: @ 0x0800217C
	push {r4, lr}
	ldr r4, _080021A8  @ gUnknown_03000030
	ldrh r0, [r4, #0xa]
	cmp r0, #0
	beq _080021A0
	ldr r0, [r4]
	ldr r1, [r4, #4]
	ldrh r2, [r4, #0xa]
	lsls r2, r2, #1
	bl CpuFastSet
	ldr r0, [r4]
	ldrh r1, [r4, #0xa]
	bl ClearOAMBuffer
	ldr r1, _080021AC  @ gUnknown_03003070
	ldr r0, [r4]
	str r0, [r1]
_080021A0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080021A8: .4byte gUnknown_03000030
_080021AC: .4byte gUnknown_03003070

	THUMB_FUNC_START WriteOAMRotScaleData
WriteOAMRotScaleData: @ 0x080021B0
	push {r4, r5, r6, lr}
	ldr r6, [sp, #0x10]
	ldr r5, _080021E0  @ gUnknown_03003140
	lsls r0, r0, #4
	adds r4, r0, #3
	lsls r4, r4, #1
	adds r4, r4, r5
	strh r1, [r4]
	adds r1, r0, #7
	lsls r1, r1, #1
	adds r1, r1, r5
	strh r2, [r1]
	adds r1, r0, #0
	adds r1, #0xb
	lsls r1, r1, #1
	adds r1, r1, r5
	strh r3, [r1]
	adds r0, #0xf
	lsls r0, r0, #1
	adds r0, r0, r5
	strh r6, [r0]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080021E0: .4byte gUnknown_03003140

	THUMB_FUNC_START sub_80021E4
sub_80021E4: @ 0x080021E4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	mov r8, r1
	mov ip, r2
	ldr r4, [r5]
	cmp r4, #1
	beq _08002236
	ldr r3, _08002240  @ gUnknown_03003744
	ldr r0, [r3]
	ldr r7, _08002244  @ gUnknown_03003240
	cmp r0, r7
	bhs _08002236
	adds r6, r3, #0
_08002202:
	movs r0, #6
	ldrsh r1, [r5, r0]
	add r1, r8
	ldr r0, _08002248  @ 0x000001FF
	ands r1, r0
	movs r0, #8
	ldrsh r2, [r5, r0]
	add r2, ip
	movs r0, #0xff
	ands r2, r0
	ldr r3, [r6]
	lsls r1, r1, #0x10
	orrs r4, r1
	orrs r4, r2
	stm r3!, {r4}
	str r3, [r6]
	ldrh r0, [r5, #4]
	strh r0, [r3]
	adds r3, #4
	str r3, [r6]
	adds r5, #0xc
	ldr r4, [r5]
	cmp r4, #1
	beq _08002236
	cmp r3, r7
	blo _08002202
_08002236:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08002240: .4byte gUnknown_03003744
_08002244: .4byte gUnknown_03003240
_08002248: .4byte 0x000001FF

	THUMB_FUNC_START GetPrimaryOAMSize
GetPrimaryOAMSize: @ 0x0800224C
	ldr r0, _08002254  @ gUnknown_03000030
	ldrh r0, [r0, #0xa]
	bx lr
	.align 2, 0
_08002254: .4byte gUnknown_03000030

	THUMB_FUNC_START sub_8002258
sub_8002258: @ 0x08002258
	ldr r0, _08002260  @ gUnknown_02024E5C
	ldrh r0, [r0, #4]
	bx lr
	.align 2, 0
_08002260: .4byte gUnknown_02024E5C

	THUMB_FUNC_START sub_8002264
sub_8002264: @ 0x08002264
	ldr r0, _08002270  @ gUnknown_02024E5C
	ldrb r0, [r0, #6]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bx lr
	.align 2, 0
_08002270: .4byte gUnknown_02024E5C
