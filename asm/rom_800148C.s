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
	ldr r0, _080014BC  @ 0x03003080
	strh r1, [r0, #0x1c]
	strh r2, [r0, #0x1e]
	b _080014DE
	.align 2, 0
_080014BC: .4byte 0x03003080
_080014C0:
	ldr r0, _080014C8  @ 0x03003080
	strh r1, [r0, #0x20]
	strh r2, [r0, #0x22]
	b _080014DE
	.align 2, 0
_080014C8: .4byte 0x03003080
_080014CC:
	ldr r0, _080014D4  @ 0x03003080
	strh r1, [r0, #0x24]
	strh r2, [r0, #0x26]
	b _080014DE
	.align 2, 0
_080014D4: .4byte 0x03003080
_080014D8:
	ldr r0, _080014E4  @ 0x03003080
	strh r1, [r0, #0x28]
	strh r2, [r0, #0x2a]
_080014DE:
	pop {r0}
	bx r0
	.align 2, 0
_080014E4: .4byte 0x03003080

	THUMB_FUNC_START sub_80014E8
sub_80014E8: @ 0x080014E8
	push {lr}
	ldr r2, _0800150C  @ 0x03000018
	ldr r1, _08001510  @ 0x03000019
	movs r0, #0
	strb r0, [r1]
	strb r0, [r2]
	ldr r0, _08001514  @ 0x02022CA8
	movs r1, #0
	bl BG_Fill
	ldr r2, _08001518  @ 0x0300000D
	ldrb r0, [r2]
	movs r1, #1
	orrs r0, r1
	strb r0, [r2]
	pop {r0}
	bx r0
	.align 2, 0
_0800150C: .4byte 0x03000018
_08001510: .4byte 0x03000019
_08001514: .4byte 0x02022CA8
_08001518: .4byte 0x0300000D

	THUMB_FUNC_START sub_800151C
sub_800151C: @ 0x0800151C
	ldr r2, _08001528  @ 0x03000018
	strb r0, [r2]
	ldr r0, _0800152C  @ 0x03000019
	strb r1, [r0]
	bx lr
	.align 2, 0
_08001528: .4byte 0x03000018
_0800152C: .4byte 0x03000019

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
	ldr r3, _08001728  @ 0x02022288
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
_08001728: .4byte 0x02022288

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
	ldr r2, _080017AC  @ 0x02022288
	adds r0, r0, r2
	mov r2, sb
	strb r2, [r0]
	adds r1, #1
	mov ip, r1
	movs r6, #0xf
	ldr r0, _080017B0  @ 0x020222A8
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
_080017AC: .4byte 0x02022288
_080017B0: .4byte 0x020222A8

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
	ldr r0, _08001830  @ 0x020228A8
	adds r3, r1, r0
	movs r1, #0
	cmp r1, sb
	bge _08001820
	movs r7, #0x1f
_080017D6:
	mov r2, r8
	adds r0, r2, r1
	ldr r2, _08001834  @ 0x02022288
	adds r0, r0, r2
	mov r2, sl
	strb r2, [r0]
	adds r1, #1
	mov ip, r1
	movs r6, #0xf
	ldr r0, _08001838  @ 0x020222A8
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
_08001830: .4byte 0x020228A8
_08001834: .4byte 0x02022288
_08001838: .4byte 0x020222A8

	THUMB_FUNC_START sub_800183C
sub_800183C: @ 0x0800183C
	push {r4, lr}
	adds r3, r0, #0
	adds r0, r3, r1
	cmp r3, r0
	bge _08001854
	ldr r4, _0800185C  @ 0x02022288
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
_0800185C: .4byte 0x02022288

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
	ldr r0, _080018D8  @ 0x020228A8
	mov sb, r0
	ldr r6, _080018DC  @ 0x020222A8
	movs r7, #0x1f
_0800187A:
	ldr r2, _080018E0  @ 0x02022288
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
_080018D8: .4byte 0x020228A8
_080018DC: .4byte 0x020222A8
_080018E0: .4byte 0x02022288

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
	ldr r0, _08001958  @ 0x020228A8
	mov sb, r0
	ldr r6, _0800195C  @ 0x020222A8
	movs r7, #0x1f
_080018FE:
	ldr r2, _08001960  @ 0x02022288
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
_08001958: .4byte 0x020228A8
_0800195C: .4byte 0x020222A8
_08001960: .4byte 0x02022288

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
	ldr r0, _080019DC  @ 0x020228A8
	mov sb, r0
	ldr r6, _080019E0  @ 0x020222A8
	movs r7, #0x1f
_0800197E:
	ldr r2, _080019E4  @ 0x02022288
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
_080019DC: .4byte 0x020228A8
_080019E0: .4byte 0x020222A8
_080019E4: .4byte 0x02022288

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
	ldr r0, _08001A60  @ 0x020228A8
	mov sb, r0
	ldr r6, _08001A64  @ 0x020222A8
	movs r7, #0x1f
_08001A02:
	ldr r2, _08001A68  @ 0x02022288
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
_08001A60: .4byte 0x020228A8
_08001A64: .4byte 0x020222A8
_08001A68: .4byte 0x02022288

	THUMB_FUNC_START sub_8001A6C
sub_8001A6C: @ 0x08001A6C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	movs r1, #0x1f
_08001A78:
	ldr r0, _08001B48  @ 0x02022288
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
	ldr r4, _08001B4C  @ 0x020228A8
	mov sl, r4
	ldr r0, _08001B50  @ 0x020222A8
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
	ldr r1, _08001B54  @ 0x0300000E
	strb r0, [r1]
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08001B48: .4byte 0x02022288
_08001B4C: .4byte 0x020228A8
_08001B50: .4byte 0x020222A8
_08001B54: .4byte 0x0300000E

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
	ldr r1, _08001C34  @ 0x0300308C
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
	ldr r2, _08001C3C  @ 0x0300000D
	ldrb r0, [r2]
	movs r1, #0xf
	orrs r0, r1
	strb r0, [r2]
	movs r0, #0
	bl SetupOAMBufferSplice
	ldr r0, _08001C40  @ 0x020228A8
	strh r6, [r0]
	ldr r0, _08001C44  @ 0x0300000E
	movs r4, #1
	strb r4, [r0]
	ldr r2, _08001C48  @ 0x03003080
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
_08001C34: .4byte 0x0300308C
_08001C38: .4byte 0x01000010
_08001C3C: .4byte 0x0300000D
_08001C40: .4byte 0x020228A8
_08001C44: .4byte 0x0300000E
_08001C48: .4byte 0x03003080

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
	ldr r1, _08001C64  @ 0x0300001A
	strb r0, [r1]
	bx lr
	.align 2, 0
_08001C64: .4byte 0x0300001A

	THUMB_FUNC_START ShouldSkipHSScreen
ShouldSkipHSScreen: @ 0x08001C68
	ldr r0, _08001C74  @ 0x0300001A
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bx lr
	.align 2, 0
_08001C74: .4byte 0x0300001A

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
	ldr r0, _08001D20  @ 0x03003134
	ldr r0, [r0]
	cmp r0, #0
	beq _08001D0E
	bl _call_via_r0
_08001D0E:
	ldr r0, _08001D24  @ 0x03003748
	ldr r0, [r0]
	cmp r0, #0
	beq _08001D1A
	bl _call_via_r0
_08001D1A:
	pop {r0}
	bx r0
	.align 2, 0
_08001D20: .4byte 0x03003134
_08001D24: .4byte 0x03003748

	THUMB_FUNC_START UpdateHBlankHandlerState
UpdateHBlankHandlerState: @ 0x08001D28
	push {r4, lr}
	ldr r0, _08001D4C  @ 0x03003134
	ldr r3, [r0]
	rsbs r0, r3, #0
	orrs r0, r3
	lsrs r2, r0, #0x1f
	ldr r0, _08001D50  @ 0x03003748
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
_08001D4C: .4byte 0x03003134
_08001D50: .4byte 0x03003748
_08001D54:
	cmp r2, #2
	beq _08001D94
	cmp r2, #3
	beq _08001DA8
	b _08001DC4
_08001D5E:
	ldr r2, _08001D74  @ 0x03003080
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
_08001D74: .4byte 0x03003080
_08001D78: .4byte 0x04000200
_08001D7C: .4byte 0x0000FFFD
_08001D80:
	ldr r2, _08001D90  @ 0x03003080
	ldrb r0, [r2, #4]
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2, #4]
	movs r0, #1
	adds r1, r3, #0
	b _08001DB6
	.align 2, 0
_08001D90: .4byte 0x03003080
_08001D94:
	ldr r2, _08001DA4  @ 0x03003080
	ldrb r0, [r2, #4]
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2, #4]
	movs r0, #1
	adds r1, r4, #0
	b _08001DB6
	.align 2, 0
_08001DA4: .4byte 0x03003080
_08001DA8:
	ldr r2, _08001DCC  @ 0x03003080
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
_08001DCC: .4byte 0x03003080
_08001DD0: .4byte sub_8001D00
_08001DD4: .4byte 0x04000200

	THUMB_FUNC_START SetPrimaryHBlankHandler
SetPrimaryHBlankHandler: @ 0x08001DD8
	push {lr}
	ldr r1, _08001DE8  @ 0x03003134
	str r0, [r1]
	bl UpdateHBlankHandlerState
	pop {r0}
	bx r0
	.align 2, 0
_08001DE8: .4byte 0x03003134

	THUMB_FUNC_START SetSecondaryHBlankHandler
SetSecondaryHBlankHandler: @ 0x08001DEC
	push {lr}
	ldr r1, _08001DFC  @ 0x03003748
	str r0, [r1]
	bl UpdateHBlankHandlerState
	pop {r0}
	bx r0
	.align 2, 0
_08001DFC: .4byte 0x03003748

	THUMB_FUNC_START GetBackgroundFromBufferPointer
GetBackgroundFromBufferPointer: @ 0x08001E00
	push {lr}
	adds r1, r0, #0
	ldr r0, _08001E18  @ 0x02022CA8
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
_08001E18: .4byte 0x02022CA8
_08001E1C:
	ldr r0, _08001E30  @ 0x020234A8
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
_08001E30: .4byte 0x020234A8
_08001E34:
	ldr r0, _08001E48  @ 0x02023CA8
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
_08001E48: .4byte 0x02023CA8
_08001E4C:
	ldr r0, _08001E60  @ 0x020244A8
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
_08001E60: .4byte 0x020244A8
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
	ldr r4, _08001ECC  @ 0x03003080
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
_08001ECC: .4byte 0x03003080

	THUMB_FUNC_START sub_8001ED0
sub_8001ED0: @ 0x08001ED0
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	ldr r6, [sp, #0x14]
	ldr r4, _08001F04  @ 0x030030BC
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
_08001F04: .4byte 0x030030BC
_08001F08: .4byte 0x0000FFE0

	THUMB_FUNC_START sub_8001F0C
sub_8001F0C: @ 0x08001F0C
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	ldr r6, [sp, #0x14]
	ldr r4, _08001F40  @ 0x030030BC
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
_08001F40: .4byte 0x030030BC
_08001F44: .4byte 0x0000E0FF

	THUMB_FUNC_START sub_8001F48
sub_8001F48: @ 0x08001F48
	ldr r2, _08001F60  @ 0x03003080
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
_08001F60: .4byte 0x03003080

	THUMB_FUNC_START sub_8001F64
sub_8001F64: @ 0x08001F64
	ldr r2, _08001F7C  @ 0x03003080
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
_08001F7C: .4byte 0x03003080

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
	ldr r1, _08001F9C  @ 0x0300000E
	movs r0, #1
	strb r0, [r1]
	bx lr
	.align 2, 0
_08001F9C: .4byte 0x0300000E

	THUMB_FUNC_START DisablePaletteSync
DisablePaletteSync: @ 0x08001FA0
	ldr r1, _08001FA8  @ 0x0300000E
	movs r0, #0
	strb r0, [r1]
	bx lr
	.align 2, 0
_08001FA8: .4byte 0x0300000E

	THUMB_FUNC_START BG_EnableSyncByMask
BG_EnableSyncByMask: @ 0x08001FAC
	ldr r2, _08001FB8  @ 0x0300000D
	ldrb r1, [r2]
	orrs r0, r1
	strb r0, [r2]
	bx lr
	.align 2, 0
_08001FB8: .4byte 0x0300000D

	THUMB_FUNC_START BG_EnableSync
BG_EnableSync: @ 0x08001FBC
	ldr r2, _08001FCC  @ 0x0300000D
	movs r1, #1
	lsls r1, r0
	ldrb r0, [r2]
	orrs r1, r0
	strb r1, [r2]
	bx lr
	.align 2, 0
_08001FCC: .4byte 0x0300000D

	THUMB_FUNC_START sub_8001FD0
sub_8001FD0: @ 0x08001FD0
	ldr r2, _08001FDC  @ 0x0300000D
	ldrb r1, [r2]
	bics r1, r0
	strb r1, [r2]
	bx lr
	.align 2, 0
_08001FDC: .4byte 0x0300000D

	THUMB_FUNC_START ClearTileRigistry
ClearTileRigistry: @ 0x08001FE0
	push {lr}
	ldr r1, _0800200C  @ 0x02024CD4
	movs r0, #0
	str r0, [r1]
	str r0, [r1, #4]
	ldr r3, _08002010  @ 0x02024CDC
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
_0800200C: .4byte 0x02024CD4
_08002010: .4byte 0x02024CDC

	THUMB_FUNC_START RegisterTileGraphics
RegisterTileGraphics: @ 0x08002014
	push {r4, r5, lr}
	adds r4, r2, #0
	ldr r5, _0800204C  @ 0x02024CD4
	ldr r3, [r5]
	lsls r2, r3, #1
	adds r2, r2, r3
	lsls r2, r2, #2
	ldr r3, _08002050  @ 0x02024CDC
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
_0800204C: .4byte 0x02024CD4
_08002050: .4byte 0x02024CDC

	THUMB_FUNC_START RegisterFillTile
RegisterFillTile: @ 0x08002054
	push {r4, r5, lr}
	ldr r5, _08002080  @ 0x02024CD4
	ldr r4, [r5]
	lsls r3, r4, #1
	adds r3, r3, r4
	lsls r3, r3, #2
	ldr r4, _08002084  @ 0x02024CDC
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
_08002080: .4byte 0x02024CD4
_08002084: .4byte 0x02024CDC

	THUMB_FUNC_START FlushTiles
FlushTiles: @ 0x08002088
	push {r4, r5, lr}
	sub sp, #4
	ldr r4, _08002094  @ 0x02024CDC
	movs r5, #0
	b _080020E4
	.align 2, 0
_08002094: .4byte 0x02024CDC
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
	ldr r0, _080020F8  @ 0x02024CD4
	ldr r0, [r0]
	cmp r5, r0
	blt _08002098
	bl ClearTileRigistry
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080020F8: .4byte 0x02024CD4

	THUMB_FUNC_START SetupOAMBufferSplice
SetupOAMBufferSplice: @ 0x080020FC
	push {r4, lr}
	ldr r2, _0800212C  @ 0x03000030
	ldr r3, _08002130  @ 0x03003140
	str r3, [r2]
	movs r4, #0xe0
	lsls r4, r4, #0x13
	str r4, [r2, #4]
	movs r1, #0
	strh r1, [r2, #8]
	strh r0, [r2, #0xa]
	ldr r2, _08002134  @ 0x03000020
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
_0800212C: .4byte 0x03000030
_08002130: .4byte 0x03003140
_08002134: .4byte 0x03000020

	THUMB_FUNC_START FlushSecondaryOAM
FlushSecondaryOAM: @ 0x08002138
	push {r4, lr}
	ldr r4, _08002168  @ 0x03000020
	ldr r0, [r4]
	ldr r1, [r4, #4]
	ldrh r2, [r4, #0xa]
	lsls r2, r2, #1
	bl CpuFastSet
	ldr r0, [r4]
	ldrh r1, [r4, #0xa]
	bl ClearOAMBuffer
	ldr r1, _0800216C  @ 0x03003744
	ldr r0, [r4]
	str r0, [r1]
	ldr r1, _08002170  @ 0x03004158
	ldr r0, _08002174  @ 0x03003140
	str r0, [r1]
	ldr r1, _08002178  @ 0x0300312C
	movs r0, #0
	strh r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08002168: .4byte 0x03000020
_0800216C: .4byte 0x03003744
_08002170: .4byte 0x03004158
_08002174: .4byte 0x03003140
_08002178: .4byte 0x0300312C

	THUMB_FUNC_START FlushPrimaryOAM
FlushPrimaryOAM: @ 0x0800217C
	push {r4, lr}
	ldr r4, _080021A8  @ 0x03000030
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
	ldr r1, _080021AC  @ 0x03003070
	ldr r0, [r4]
	str r0, [r1]
_080021A0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080021A8: .4byte 0x03000030
_080021AC: .4byte 0x03003070

	THUMB_FUNC_START WriteOAMRotScaleData
WriteOAMRotScaleData: @ 0x080021B0
	push {r4, r5, r6, lr}
	ldr r6, [sp, #0x10]
	ldr r5, _080021E0  @ 0x03003140
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
_080021E0: .4byte 0x03003140

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
	ldr r3, _08002240  @ 0x03003744
	ldr r0, [r3]
	ldr r7, _08002244  @ 0x03003240
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
_08002240: .4byte 0x03003744
_08002244: .4byte 0x03003240
_08002248: .4byte 0x000001FF

	THUMB_FUNC_START GetPrimaryOAMSize
GetPrimaryOAMSize: @ 0x0800224C
	ldr r0, _08002254  @ 0x03000030
	ldrh r0, [r0, #0xa]
	bx lr
	.align 2, 0
_08002254: .4byte 0x03000030

	THUMB_FUNC_START sub_8002258
sub_8002258: @ 0x08002258
	ldr r0, _08002260  @ 0x02024E5C
	ldrh r0, [r0, #4]
	bx lr
	.align 2, 0
_08002260: .4byte 0x02024E5C

	THUMB_FUNC_START sub_8002264
sub_8002264: @ 0x08002264
	ldr r0, _08002270  @ 0x02024E5C
	ldrb r0, [r0, #6]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bx lr
	.align 2, 0
_08002270: .4byte 0x02024E5C

	THUMB_FUNC_START SomethingSoundRelated_8002274
SomethingSoundRelated_8002274: @ 0x08002274
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, _080022CC  @ 0x03006690
	ldr r5, _080022D0  @ 0x0000FFFF
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	adds r1, r5, #0
	adds r2, r4, #0
	bl SomethingSoundRelated_80D11A4
	ldr r0, _080022D4  @ 0x03006760
	adds r1, r5, #0
	adds r2, r4, #0
	bl SomethingSoundRelated_80D11A4
	ldr r0, _080022D8  @ 0x030066D0
	adds r1, r5, #0
	adds r2, r4, #0
	bl SomethingSoundRelated_80D11A4
	ldr r0, _080022DC  @ 0x030063C0
	adds r1, r5, #0
	adds r2, r4, #0
	bl SomethingSoundRelated_80D11A4
	ldr r0, _080022E0  @ 0x03006400
	adds r1, r5, #0
	adds r2, r4, #0
	bl SomethingSoundRelated_80D11A4
	ldr r0, _080022E4  @ 0x03006610
	adds r1, r5, #0
	adds r2, r4, #0
	bl SomethingSoundRelated_80D11A4
	ldr r0, _080022E8  @ 0x03006720
	adds r1, r5, #0
	adds r2, r4, #0
	bl SomethingSoundRelated_80D11A4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080022CC: .4byte 0x03006690
_080022D0: .4byte 0x0000FFFF
_080022D4: .4byte 0x03006760
_080022D8: .4byte 0x030066D0
_080022DC: .4byte 0x030063C0
_080022E0: .4byte 0x03006400
_080022E4: .4byte 0x03006610
_080022E8: .4byte 0x03006720

	THUMB_FUNC_START SomethingSoundRelated_80022EC
SomethingSoundRelated_80022EC: @ 0x080022EC
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, _08002310  @ 0x03006440
	ldr r5, _08002314  @ 0x0000FFFF
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	adds r1, r5, #0
	adds r2, r4, #0
	bl SomethingSoundRelated_80D11A4
	ldr r0, _08002318  @ 0x03006650
	adds r1, r5, #0
	adds r2, r4, #0
	bl SomethingSoundRelated_80D11A4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08002310: .4byte 0x03006440
_08002314: .4byte 0x0000FFFF
_08002318: .4byte 0x03006650

	THUMB_FUNC_START SoundStuff_800231C
SoundStuff_800231C: @ 0x0800231C
	push {r4, r5, lr}
	adds r4, r0, #0
	cmp r4, #0
	bge _08002326
	movs r4, #6
_08002326:
	ldr r5, _08002368  @ 0x03000040
	ldr r0, [r5]
	cmp r0, #0
	beq _08002336
	bl Break6CLoop
	movs r0, #0
	str r0, [r5]
_08002336:
	ldr r5, _0800236C  @ 0x03000044
	ldr r0, [r5]
	cmp r0, #0
	beq _08002346
	bl Break6CLoop
	movs r0, #0
	str r0, [r5]
_08002346:
	ldr r0, _08002370  @ 0x03006440
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	adds r1, r4, #0
	bl SoundStuff_80D0394
	ldr r0, _08002374  @ 0x03006650
	adds r1, r4, #0
	bl SoundStuff_80D0394
	ldr r1, _08002378  @ 0x02024E5C
	movs r0, #0
	strb r0, [r1, #6]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08002368: .4byte 0x03000040
_0800236C: .4byte 0x03000044
_08002370: .4byte 0x03006440
_08002374: .4byte 0x03006650
_08002378: .4byte 0x02024E5C

	THUMB_FUNC_START sub_800237C
sub_800237C: @ 0x0800237C
	push {r4, r5, lr}
	adds r4, r0, #0
	cmp r4, #0
	bge _08002386
	movs r4, #6
_08002386:
	ldr r5, _080023CC  @ 0x03000040
	ldr r0, [r5]
	cmp r0, #0
	beq _08002396
	bl Break6CLoop
	movs r0, #0
	str r0, [r5]
_08002396:
	ldr r5, _080023D0  @ 0x03000044
	ldr r0, [r5]
	cmp r0, #0
	beq _080023A6
	bl Break6CLoop
	movs r0, #0
	str r0, [r5]
_080023A6:
	ldr r0, _080023D4  @ 0x03006440
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	adds r1, r4, #0
	bl SoundStuff_80D0394
	ldr r0, _080023D8  @ 0x03006650
	adds r1, r4, #0
	bl sub_80D03A4
	ldr r1, _080023DC  @ 0x02024E5C
	movs r0, #0
	strb r0, [r1, #6]
	movs r0, #1
	strb r0, [r1, #7]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080023CC: .4byte 0x03000040
_080023D0: .4byte 0x03000044
_080023D4: .4byte 0x03006440
_080023D8: .4byte 0x03006650
_080023DC: .4byte 0x02024E5C

	THUMB_FUNC_START SoundStuff_80023E0
SoundStuff_80023E0: @ 0x080023E0
	push {r4, lr}
	adds r4, r0, #0
	cmp r4, #0
	bne _080023EA
	movs r4, #6
_080023EA:
	ldr r0, _0800242C  @ 0x03006690
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	adds r1, r4, #0
	bl SoundStuff_80D0394
	ldr r0, _08002430  @ 0x03006760
	adds r1, r4, #0
	bl SoundStuff_80D0394
	ldr r0, _08002434  @ 0x030066D0
	adds r1, r4, #0
	bl SoundStuff_80D0394
	ldr r0, _08002438  @ 0x030063C0
	adds r1, r4, #0
	bl SoundStuff_80D0394
	ldr r0, _0800243C  @ 0x03006400
	adds r1, r4, #0
	bl SoundStuff_80D0394
	ldr r0, _08002440  @ 0x03006610
	adds r1, r4, #0
	bl SoundStuff_80D0394
	ldr r0, _08002444  @ 0x03006720
	adds r1, r4, #0
	bl SoundStuff_80D0394
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800242C: .4byte 0x03006690
_08002430: .4byte 0x03006760
_08002434: .4byte 0x030066D0
_08002438: .4byte 0x030063C0
_0800243C: .4byte 0x03006400
_08002440: .4byte 0x03006610
_08002444: .4byte 0x03006720

	THUMB_FUNC_START sub_8002448
sub_8002448: @ 0x08002448
	push {r4, lr}
	ldr r3, _0800246C  @ 0x02024E5C
	movs r4, #0
	movs r2, #1
	strb r2, [r3, #6]
	strb r4, [r3, #7]
	strh r0, [r3, #4]
	bl sub_8002890
	ldr r0, _08002470  @ 0x03006440
	bl sub_80D03EC
	ldr r0, _08002474  @ 0x03006650
	bl sub_80D03EC
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800246C: .4byte 0x02024E5C
_08002470: .4byte 0x03006440
_08002474: .4byte 0x03006650

	THUMB_FUNC_START sub_8002478
sub_8002478: @ 0x08002478
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	ldr r7, _080024BC  @ 0x02024E5C
	movs r0, #6
	ldrsb r0, [r7, r0]
	cmp r0, #0
	beq _08002492
	bl sub_8002258
	cmp r0, r4
	beq _080024CC
_08002492:
	ldr r0, _080024C0  @ 0x0202BCF0
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1f
	cmp r0, #0
	bne _080024CC
	bl DeleteAll6CWaitMusicRelated
	movs r0, #6
	ldrsb r0, [r7, r0]
	cmp r0, #0
	beq _080024C4
	adds r0, r5, #0
	bl SoundStuff_800231C
	lsls r1, r5, #4
	adds r0, r4, #0
	adds r2, r6, #0
	bl Exec6CSomeWaitIfMusicOn
	b _080024CC
	.align 2, 0
_080024BC: .4byte 0x02024E5C
_080024C0: .4byte 0x0202BCF0
_080024C4:
	adds r0, r4, #0
	adds r1, r6, #0
	bl sub_8002448
_080024CC:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_START sub_80024D4
sub_80024D4: @ 0x080024D4
	push {lr}
	adds r2, r1, #0
	movs r1, #3
	bl sub_8002478
	pop {r0}
	bx r0

	THUMB_FUNC_START sub_80024E4
sub_80024E4: @ 0x080024E4
	push {lr}
	bl sub_8002478
	pop {r0}
	bx r0

	THUMB_FUNC_START sub_80024F0
sub_80024F0: @ 0x080024F0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r7, r0, #0
	movs r2, #0x80
	lsls r2, r2, #1
	adds r6, r7, #0
	adds r6, #0x4c
	movs r0, #0
	ldrsh r3, [r6, r0]
	movs r1, #0x4e
	adds r1, r1, r7
	mov r8, r1
	movs r4, #0
	ldrsh r0, [r1, r4]
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	bl sub_8012DCC
	adds r4, r0, #0
	ldr r0, _08002564  @ 0x03006440
	ldr r5, _08002568  @ 0x0000FFFF
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	adds r1, r5, #0
	adds r2, r4, #0
	bl SomethingSoundRelated_80D11A4
	ldr r0, _0800256C  @ 0x03006650
	adds r1, r5, #0
	adds r2, r4, #0
	bl SomethingSoundRelated_80D11A4
	ldrh r0, [r6]
	adds r0, #1
	strh r0, [r6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	mov r2, r8
	movs r3, #0
	ldrsh r1, [r2, r3]
	cmp r0, r1
	blt _08002556
	adds r0, r7, #0
	bl Break6CLoop
	ldr r1, _08002570  @ 0x03000040
	movs r0, #0
	str r0, [r1]
_08002556:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08002564: .4byte 0x03006440
_08002568: .4byte 0x0000FFFF
_0800256C: .4byte 0x03006650
_08002570: .4byte 0x03000040

	THUMB_FUNC_START sub_8002574
sub_8002574: @ 0x08002574
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r6, r0, #0
	mov sl, r1
	mov sb, r2
	ldr r0, _08002604  @ 0x0202BCF0
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1f
	lsrs r7, r0, #0x1f
	cmp r7, #0
	bne _080025F6
	ldr r0, _08002608  @ 0x02024E5C
	movs r1, #1
	strb r1, [r0, #6]
	strb r7, [r0, #7]
	strh r6, [r0, #4]
	ldr r0, _0800260C  @ gUnknown_08587958
	movs r1, #3
	bl New6C
	mov r8, r0
	ldr r4, _08002610  @ 0x03006440
	adds r0, r4, #0
	bl sub_80D0A14
	ldr r5, _08002614  @ 0x03006650
	adds r0, r5, #0
	bl sub_80D0A14
	adds r0, r6, #0
	mov r1, sb
	bl sub_8002890
	adds r0, r4, #0
	bl sub_80D03EC
	adds r0, r5, #0
	bl sub_80D03EC
	ldr r6, _08002618  @ 0x0000FFFF
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #0
	bl SomethingSoundRelated_80D11A4
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #0
	bl SomethingSoundRelated_80D11A4
	mov r0, r8
	adds r0, #0x4c
	strh r7, [r0]
	mov r1, sl
	lsls r0, r1, #4
	mov r2, r8
	adds r2, #0x4e
	strh r0, [r2]
	ldr r0, _0800261C  @ 0x03000040
	mov r1, r8
	str r1, [r0]
_080025F6:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08002604: .4byte 0x0202BCF0
_08002608: .4byte 0x02024E5C
_0800260C: .4byte gUnknown_08587958
_08002610: .4byte 0x03006440
_08002614: .4byte 0x03006650
_08002618: .4byte 0x0000FFFF
_0800261C: .4byte 0x03000040

	THUMB_FUNC_START sub_8002620
sub_8002620: @ 0x08002620
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, _08002660  @ 0x0202BCF0
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1f
	cmp r0, #0
	bne _0800265A
	ldr r4, _08002664  @ 0x02024E5C
	ldrh r0, [r4, #4]
	movs r6, #0
	strh r0, [r4, #2]
	movs r0, #7
	ldrsb r0, [r4, r0]
	cmp r0, #0
	bne _08002648
	ldr r0, _08002668  @ 0x03006650
	movs r1, #3
	bl sub_80D03A4
_08002648:
	strb r6, [r4, #6]
	strb r6, [r4, #7]
	cmp r5, #0
	beq _0800265A
	ldr r2, _0800266C  @ 0x03006440
	adds r0, r5, #0
	movs r1, #0x20
	bl Exec6CSomeWaitIfMusicOn
_0800265A:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08002660: .4byte 0x0202BCF0
_08002664: .4byte 0x02024E5C
_08002668: .4byte 0x03006650
_0800266C: .4byte 0x03006440

	THUMB_FUNC_START sub_8002670
sub_8002670: @ 0x08002670
	push {r4, r5, lr}
	ldr r0, _080026AC  @ 0x0202BCF0
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1f
	lsrs r5, r0, #0x1f
	cmp r5, #0
	bne _080026A4
	ldr r4, _080026B0  @ 0x02024E5C
	ldrh r0, [r4, #2]
	cmp r0, #0
	beq _080026A4
	ldr r0, _080026B4  @ 0x03006440
	movs r1, #3
	bl SoundStuff_80D0394
	ldr r0, _080026B8  @ 0x03006650
	movs r1, #6
	bl sub_80D03C4
	movs r0, #1
	strb r0, [r4, #6]
	strb r5, [r4, #7]
	ldrh r0, [r4, #2]
	strh r0, [r4, #4]
	strh r5, [r4, #2]
_080026A4:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080026AC: .4byte 0x0202BCF0
_080026B0: .4byte 0x02024E5C
_080026B4: .4byte 0x03006440
_080026B8: .4byte 0x03006650

	THUMB_FUNC_START sub_80026BC
sub_80026BC: @ 0x080026BC
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	ldr r0, _080026FC  @ 0x0202BCF0
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1f
	lsrs r5, r0, #0x1f
	cmp r5, #0
	bne _080026F4
	ldr r4, _08002700  @ 0x02024E5C
	ldrh r0, [r4, #2]
	cmp r0, #0
	beq _080026F4
	ldr r0, _08002704  @ 0x03006440
	movs r1, #3
	bl SoundStuff_80D0394
	ldr r0, _08002708  @ 0x03006650
	adds r1, r6, #0
	bl sub_80D03C4
	movs r0, #1
	strb r0, [r4, #6]
	strb r5, [r4, #7]
	ldrh r0, [r4, #2]
	strh r0, [r4, #4]
	strh r5, [r4, #2]
_080026F4:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080026FC: .4byte 0x0202BCF0
_08002700: .4byte 0x02024E5C
_08002704: .4byte 0x03006440
_08002708: .4byte 0x03006650

	THUMB_FUNC_START sub_800270C
sub_800270C: @ 0x0800270C
	push {lr}
	ldr r0, _08002728  @ 0x0202BCF0
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1f
	lsrs r2, r0, #0x1f
	cmp r2, #0
	bne _08002724
	ldr r0, _0800272C  @ 0x02024E5C
	ldrh r1, [r0, #2]
	strh r1, [r0, #4]
	strh r2, [r0, #2]
_08002724:
	pop {r0}
	bx r0
	.align 2, 0
_08002728: .4byte 0x0202BCF0
_0800272C: .4byte 0x02024E5C

	THUMB_FUNC_START ISuspectThisToBeMusicRelated_8002730
ISuspectThisToBeMusicRelated_8002730: @ 0x08002730
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	adds r7, r2, #0
	adds r1, r3, #0
	cmp r1, #0
	beq _0800274C
	ldr r0, _08002748  @ gUnknown_08587970
	bl NewBlocking6C
	b _08002754
	.align 2, 0
_08002748: .4byte gUnknown_08587970
_0800274C:
	ldr r0, _08002780  @ gUnknown_08587970
	movs r1, #3
	bl New6C
_08002754:
	adds r4, r0, #0
	adds r0, r4, #0
	adds r0, #0x64
	movs r1, #0
	strh r5, [r0]
	adds r0, #2
	strh r6, [r0]
	adds r0, #2
	strh r1, [r0]
	adds r0, #2
	strh r7, [r0]
	cmp r5, #0
	bne _08002770
	movs r5, #1
_08002770:
	adds r0, r5, #0
	bl SomethingSoundRelated_80022EC
	ldr r0, _08002784  @ 0x03000044
	str r4, [r0]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08002780: .4byte gUnknown_08587970
_08002784: .4byte 0x03000044

	THUMB_FUNC_START sub_8002788
sub_8002788: @ 0x08002788
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r5, r0, #0
	adds r0, #0x64
	movs r2, #0
	ldrsh r1, [r0, r2]
	movs r3, #0x66
	adds r3, r3, r5
	mov r8, r3
	movs r7, #0
	ldrsh r2, [r3, r7]
	adds r4, r5, #0
	adds r4, #0x68
	ldrh r3, [r4]
	adds r0, r3, #1
	strh r0, [r4]
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	adds r6, r5, #0
	adds r6, #0x6a
	movs r7, #0
	ldrsh r0, [r6, r7]
	str r0, [sp]
	movs r0, #4
	bl sub_8012DCC
	bl SomethingSoundRelated_80022EC
	movs r0, #0
	ldrsh r1, [r4, r0]
	movs r2, #0
	ldrsh r0, [r6, r2]
	cmp r1, r0
	blt _08002806
	mov r3, r8
	movs r7, #0
	ldrsh r4, [r3, r7]
	cmp r4, #0
	bne _080027F4
	bl sub_8002258
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl sub_80D02C8
	ldr r0, _080027F0  @ 0x02024E5C
	strb r4, [r0, #6]
	strh r4, [r0, #2]
	strh r4, [r0, #4]
	b _080027FA
	.align 2, 0
_080027F0: .4byte 0x02024E5C
_080027F4:
	ldr r1, _08002814  @ 0x02024E5C
	movs r0, #1
	strb r0, [r1, #6]
_080027FA:
	adds r0, r5, #0
	bl Break6CLoop
	ldr r1, _08002818  @ 0x03000044
	movs r0, #0
	str r0, [r1]
_08002806:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08002814: .4byte 0x02024E5C
_08002818: .4byte 0x03000044

	THUMB_FUNC_START Some6CMusicRelatedWaitCallback
Some6CMusicRelatedWaitCallback: @ 0x0800281C
	push {r4, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x4c
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _0800284E
	ldr r1, _08002854  @ 0x02024E5C
	movs r0, #1
	strb r0, [r1, #6]
	adds r2, r4, #0
	adds r2, #0x4a
	ldrh r0, [r2]
	strh r0, [r1, #4]
	movs r1, #0
	ldrsh r0, [r2, r1]
	ldr r1, [r4, #0x54]
	bl sub_8002890
	adds r0, r4, #0
	bl Delete6C
_0800284E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08002854: .4byte 0x02024E5C

	THUMB_FUNC_START Exec6CSomeWaitIfMusicOn
Exec6CSomeWaitIfMusicOn: @ 0x08002858
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	ldr r0, _08002888  @ 0x0202BCF0
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1f
	cmp r0, #0
	bne _08002880
	ldr r0, _0800288C  @ gUnknown_08587988
	movs r1, #3
	bl New6C
	adds r1, r0, #0
	adds r0, #0x4c
	strh r4, [r0]
	subs r0, #2
	strh r6, [r0]
	str r5, [r1, #0x54]
_08002880:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08002888: .4byte 0x0202BCF0
_0800288C: .4byte gUnknown_08587988

	THUMB_FUNC_START sub_8002890
sub_8002890: @ 0x08002890
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	cmp r4, #0x7f
	bgt _080028A6
	bl sub_80028FC
	movs r0, #0
	adds r1, r4, #0
	bl sub_80A3F08
_080028A6:
	cmp r5, #0
	beq _080028C0
	ldr r0, _080028BC  @ gUnknown_08224470
	lsls r1, r4, #3
	adds r1, r1, r0
	ldr r1, [r1]
	adds r0, r5, #0
	bl sub_80D0930
	b _080028C8
	.align 2, 0
_080028BC: .4byte gUnknown_08224470
_080028C0:
	lsls r0, r4, #0x10
	lsrs r0, r0, #0x10
	bl PlaySound
_080028C8:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_START sub_80028D0
sub_80028D0: @ 0x080028D0
	push {lr}
	movs r0, #7
	bl sub_80028E8
	ldr r1, _080028E4  @ 0x02024E5C
	movs r0, #0xff
	strb r0, [r1, #8]
	pop {r0}
	bx r0
	.align 2, 0
_080028E4: .4byte 0x02024E5C

	THUMB_FUNC_START sub_80028E8
sub_80028E8: @ 0x080028E8
	push {lr}
	ldr r1, _080028F8  @ 0x02024E5C
	strb r0, [r1, #8]
	lsls r0, r0, #8
	bl sub_80D0714
	pop {r0}
	bx r0
	.align 2, 0
_080028F8: .4byte 0x02024E5C

	THUMB_FUNC_START sub_80028FC
sub_80028FC: @ 0x080028FC
	push {lr}
	cmp r0, #0x43
	bgt _08002914
	cmp r0, #0x42
	bge _0800291C
	cmp r0, #1
	blt _08002934
	cmp r0, #2
	ble _0800291C
	cmp r0, #0x40
	beq _0800291C
	b _08002934
_08002914:
	cmp r0, #0x56
	beq _0800291C
	cmp r0, #0x74
	bne _08002934
_0800291C:
	ldr r0, _08002930  @ 0x02024E5C
	ldrb r0, [r0, #8]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #8
	beq _08002946
	movs r0, #8
	bl sub_80028E8
	b _08002946
	.align 2, 0
_08002930: .4byte 0x02024E5C
_08002934:
	ldr r0, _0800294C  @ 0x02024E5C
	movs r1, #8
	ldrsb r1, [r0, r1]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _08002946
	bl sub_80028D0
_08002946:
	pop {r0}
	bx r0
	.align 2, 0
_0800294C: .4byte 0x02024E5C

	THUMB_FUNC_START sub_8002950
sub_8002950: @ 0x08002950
	push {lr}
	ldr r0, _08002960  @ gUnknown_08587970
	bl Find6C
	cmp r0, #0
	bne _08002964
	movs r0, #0
	b _08002966
	.align 2, 0
_08002960: .4byte gUnknown_08587970
_08002964:
	movs r0, #1
_08002966:
	pop {r1}
	bx r1

	THUMB_FUNC_START sub_800296C
sub_800296C: @ 0x0800296C
	push {r4, lr}
	adds r4, r0, #0
	bl sub_8002264
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080029B4
	adds r2, r4, #0
	adds r2, #0x64
	movs r1, #0
	ldrsh r0, [r2, r1]
	cmp r0, #0
	beq _080029B4
	ldr r1, [r4, #0x5c]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _080029A6
	movs r1, #0
	ldrsh r0, [r2, r1]
	adds r1, r4, #0
	adds r1, #0x66
	movs r2, #0
	ldrsh r1, [r1, r2]
	ldr r2, [r4, #0x58]
	adds r3, r4, #0
	bl ISuspectThisToBeMusicRelated_8002730
	b _080029B4
_080029A6:
	movs r1, #0
	ldrsh r0, [r2, r1]
	ldr r2, [r4, #0x58]
	movs r1, #0
	adds r3, r4, #0
	bl ISuspectThisToBeMusicRelated_8002730
_080029B4:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_START sub_80029BC
sub_80029BC: @ 0x080029BC
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	cmp r0, #0
	ble _080029DA
	movs r1, #0
	bl sub_80024D4
	adds r0, r4, #0
	adds r0, #0x66
	movs r1, #0
	ldrsh r0, [r0, r1]
	bl SomethingSoundRelated_80022EC
	b _080029E2
_080029DA:
	adds r0, r4, #0
	movs r1, #0
	bl Goto6CLabel
_080029E2:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_START sub_80029E8
sub_80029E8: @ 0x080029E8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	adds r7, r1, #0
	mov r8, r2
	adds r6, r3, #0
	ldr r4, [sp, #0x18]
	bl sub_8002264
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08002A0E
	ldr r0, _08002A1C  @ 0x02024E5C
	ldrh r0, [r0, #4]
	cmp r5, r0
	bne _08002A0E
	cmp r7, r8
	beq _08002A62
_08002A0E:
	cmp r4, #0
	beq _08002A24
	ldr r0, _08002A20  @ gUnknown_08587998
	adds r1, r4, #0
	bl NewBlocking6C
	b _08002A2C
	.align 2, 0
_08002A1C: .4byte 0x02024E5C
_08002A20: .4byte gUnknown_08587998
_08002A24:
	ldr r0, _08002A4C  @ gUnknown_08587998
	movs r1, #3
	bl New6C
_08002A2C:
	adds r4, r0, #0
	str r6, [r4, #0x58]
	bl sub_8002264
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08002A54
	ldr r0, _08002A50  @ 0x02024E5C
	ldrh r0, [r0, #4]
	cmp r5, r0
	bne _08002A54
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r4, #0x5c]
	b _08002A56
	.align 2, 0
_08002A4C: .4byte gUnknown_08587998
_08002A50: .4byte 0x02024E5C
_08002A54:
	str r5, [r4, #0x5c]
_08002A56:
	adds r0, r4, #0
	adds r0, #0x64
	strh r7, [r0]
	adds r0, #2
	mov r1, r8
	strh r1, [r0]
_08002A62:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_START sub_8002A6C
sub_8002A6C: @ 0x08002A6C
	push {lr}
	ldr r0, _08002A7C  @ gUnknown_08587998
	bl Find6C
	cmp r0, #0
	bne _08002A80
	movs r0, #0
	b _08002A82
	.align 2, 0
_08002A7C: .4byte gUnknown_08587998
_08002A80:
	movs r0, #1
_08002A82:
	pop {r1}
	bx r1

	THUMB_FUNC_START sub_8002A88
sub_8002A88: @ 0x08002A88
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08002AB4  @ 0x02024E5C
	ldrh r0, [r0, #4]
	cmp r4, r0
	beq _08002AAC
	bl sub_8002264
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08002AA4
	movs r0, #0
	bl SomethingSoundRelated_80022EC
_08002AA4:
	adds r0, r4, #0
	movs r1, #0
	bl sub_8002448
_08002AAC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08002AB4: .4byte 0x02024E5C

	THUMB_FUNC_START DeleteAll6CWaitMusicRelated
DeleteAll6CWaitMusicRelated: @ 0x08002AB8
	push {lr}
	ldr r0, _08002AC4  @ gUnknown_08587988
	bl DeleteEach6C
	pop {r0}
	bx r0
	.align 2, 0
_08002AC4: .4byte gUnknown_08587988

	THUMB_FUNC_START sub_8002AC8
sub_8002AC8: @ 0x08002AC8
	push {lr}
	bl DeleteAll6CWaitMusicRelated
	ldr r0, _08002AEC  @ 0x03006440
	movs r1, #1
	bl SoundStuff_80D0394
	ldr r0, _08002AF0  @ 0x03006650
	movs r1, #1
	bl SoundStuff_80D0394
	ldr r1, _08002AF4  @ 0x02024E5C
	movs r0, #0
	strh r0, [r1, #2]
	strh r0, [r1, #4]
	pop {r0}
	bx r0
	.align 2, 0
_08002AEC: .4byte 0x03006440
_08002AF0: .4byte 0x03006650
_08002AF4: .4byte 0x02024E5C

	THUMB_FUNC_START StoreRoutinesToIRAM
StoreRoutinesToIRAM: @ 0x08002AF8
	push {r4, r5, lr}
	ldr r2, _08002B54  @ ARMCodeToCopy_End
	ldr r4, _08002B58  @ ARMCodeToCopy_Start
	subs r2, r2, r4
	ldr r5, _08002B5C  @ 0x03003750
	lsrs r0, r2, #0x1f
	adds r2, r2, r0
	lsls r2, r2, #0xa
	lsrs r2, r2, #0xb
	adds r0, r4, #0
	adds r1, r5, #0
	bl CpuSet
	ldr r1, _08002B60  @ 0x03003740
	ldr r0, _08002B64  @ IRAMARM_Func3_DrawGlyph
	subs r0, r0, r4
	adds r0, r0, r5
	str r0, [r1]
	ldr r1, _08002B68  @ 0x03004150
	ldr r0, _08002B6C  @ IRAMARM_DecompText
	subs r0, r0, r4
	adds r0, r0, r5
	str r0, [r1]
	ldr r1, _08002B70  @ 0x03003130
	ldr r0, _08002B74  @ IRAMARM_CopyToSecondaryOAM
	subs r0, r0, r4
	adds r0, r0, r5
	str r0, [r1]
	ldr r1, _08002B78  @ 0x03004154
	ldr r0, _08002B7C  @ IRAMARM_CopyToPrimaryOAM
	subs r0, r0, r4
	adds r0, r0, r5
	str r0, [r1]
	ldr r1, _08002B80  @ 0x03004960
	ldr r0, _08002B84  @ IRAMARM_Func5
	subs r0, r0, r4
	adds r0, r0, r5
	str r0, [r1]
	ldr r1, _08002B88  @ 0x03003128
	ldr r0, _08002B8C  @ IRAMARM_FillMovementMap
	subs r0, r0, r4
	adds r0, r0, r5
	str r0, [r1]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08002B54: .4byte ARMCodeToCopy_End
_08002B58: .4byte ARMCodeToCopy_Start
_08002B5C: .4byte 0x03003750
_08002B60: .4byte 0x03003740
_08002B64: .4byte IRAMARM_Func3_DrawGlyph
_08002B68: .4byte 0x03004150
_08002B6C: .4byte IRAMARM_DecompText
_08002B70: .4byte 0x03003130
_08002B74: .4byte IRAMARM_CopyToSecondaryOAM
_08002B78: .4byte 0x03004154
_08002B7C: .4byte IRAMARM_CopyToPrimaryOAM
_08002B80: .4byte 0x03004960
_08002B84: .4byte IRAMARM_Func5
_08002B88: .4byte 0x03003128
_08002B8C: .4byte IRAMARM_FillMovementMap

	THUMB_FUNC_START CallARM_Func3
CallARM_Func3: @ 0x08002B90
	push {r4, lr}
	ldr r4, _08002BA0  @ 0x03003740
	ldr r4, [r4]
	bl _call_via_r4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08002BA0: .4byte 0x03003740

	THUMB_FUNC_START CallARM_DecompText
CallARM_DecompText: @ 0x08002BA4
	push {lr}
	ldr r2, _08002BB4  @ 0x03004150
	ldr r2, [r2]
	bl _call_via_r2
	pop {r0}
	bx r0
	.align 2, 0
_08002BB4: .4byte 0x03004150

	THUMB_FUNC_START CallARM_PushToSecondaryOAM
CallARM_PushToSecondaryOAM: @ 0x08002BB8
	push {r4, lr}
	ldr r4, _08002BC8  @ 0x03003130
	ldr r4, [r4]
	bl _call_via_r4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08002BC8: .4byte 0x03003130

	THUMB_FUNC_START CallARM_PushToPrimaryOAM
CallARM_PushToPrimaryOAM: @ 0x08002BCC
	push {r4, lr}
	ldr r4, _08002BDC  @ 0x03004154
	ldr r4, [r4]
	bl _call_via_r4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08002BDC: .4byte 0x03004154

	THUMB_FUNC_START CallARM_Func5
CallARM_Func5: @ 0x08002BE0
	push {lr}
	ldr r3, _08002BF0  @ 0x03004960
	ldr r3, [r3]
	bl _call_via_r3
	pop {r0}
	bx r0
	.align 2, 0
_08002BF0: .4byte 0x03004960

	THUMB_FUNC_START CallARM_FillMovementMap
CallARM_FillMovementMap: @ 0x08002BF4
	push {lr}
	ldr r0, _08002C04  @ 0x03003128
	ldr r0, [r0]
	bl _call_via_r0
	pop {r0}
	bx r0
	.align 2, 0
_08002C04: .4byte 0x03003128
