	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	THUMB_FUNC_START sub_80973B0
sub_80973B0: @ 0x080973B0
	adds r3, r0, #0
	movs r2, #0
	movs r1, #0
	strh r1, [r3, #0x2a]
	adds r0, #0x2c
	strb r2, [r0]
	adds r0, #1
	strb r2, [r0]
	strh r1, [r3, #0x2e]
	strh r1, [r3, #0x32]
	adds r0, #7
	strb r2, [r0]
	ldrh r0, [r3, #0x2e]
	strh r0, [r3, #0x30]
	movs r0, #0xe4
	lsls r0, r0, #2
	strh r0, [r3, #0x36]
	movs r0, #0x80
	lsls r0, r0, #5
	strh r0, [r3, #0x38]
	adds r0, r3, #0
	adds r0, #0x3a
	strb r2, [r0]
	adds r0, #1
	strb r2, [r0]
	bx lr

	THUMB_FUNC_END sub_80973B0

	THUMB_FUNC_START sub_80973E4
sub_80973E4: @ 0x080973E4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x1c
	adds r4, r0, #0
	ldrh r1, [r4, #0x36]
	ldrh r0, [r4, #0x38]
	adds r1, r1, r0
	mov r9, r1
	adds r1, r4, #0
	adds r1, #0x34
	ldrh r0, [r4, #0x32]
	ldrb r1, [r1]
	cmp r0, r1
	bhi _08097408
	b _0809762A
_08097408:
	movs r6, #0
	adds r0, r4, #0
	adds r0, #0x2d
	mov sl, r0
	adds r0, #0xd
	str r0, [sp, #0x14]
	adds r1, r4, #0
	adds r1, #0x3b
	str r1, [sp, #0x18]
	mov r2, sl
	ldrb r2, [r2]
	cmp r6, r2
	bge _08097448
	movs r5, #1
_08097424:
	ldrh r1, [r4, #0x2a]
	adds r1, #1
	adds r0, r4, #0
	adds r0, #0x2c
	ldrb r2, [r0]
	adds r2, r2, r5
	mov r3, r9
	str r3, [sp]
	movs r0, #4
	ldr r3, _08097534  @ gUnknown_08A18744
	bl PutSpriteExt
	adds r5, #8
	adds r6, #1
	mov r0, sl
	ldrb r0, [r0]
	cmp r6, r0
	blt _08097424
_08097448:
	cmp r6, #0
	bne _0809744E
	b _080975D8
_0809744E:
	mov r1, sl
	ldrb r0, [r1]
	lsls r7, r0, #0x13
	ldrh r2, [r4, #0x2e]
	str r2, [sp, #0xc]
	ldrh r5, [r4, #0x32]
	adds r0, r4, #0
	adds r0, #0x34
	ldrb r6, [r0]
	str r0, [sp, #0x10]
	movs r3, #0x2c
	adds r3, r3, r4
	mov r8, r3
	cmp r5, r6
	bhi _0809746E
	b _080975A6
_0809746E:
	adds r0, r7, #0
	adds r1, r5, #0
	bl __udivsi3
	str r0, [sp, #4]
	adds r0, r7, #0
	muls r0, r6, r0
	adds r1, r5, #0
	bl __udivsi3
	str r0, [sp, #8]
	ldr r5, [sp, #0xc]
	cmp r5, #0
	beq _080974AE
	ldrh r1, [r4, #0x2a]
	ldr r6, _08097538  @ 0x00002001
	adds r1, r1, r6
	mov r0, r8
	ldrb r2, [r0]
	subs r2, #8
	ldr r3, _0809753C  @ gUnknown_08A187F0
	ldr r5, [sp, #0x14]
	ldrb r0, [r5]
	lsrs r0, r0, #3
	lsls r0, r0, #2
	adds r0, r0, r3
	ldr r3, [r0]
	mov r6, r9
	str r6, [sp]
	movs r0, #4
	bl PutSpriteExt
_080974AE:
	movs r6, #0
	ldr r0, [sp, #8]
	lsrs r5, r0, #0x13
	cmp r6, r5
	bcs _080974E6
	ldr r1, [sp, #4]
	ldr r2, [sp, #0xc]
	adds r0, r1, #0
	muls r0, r2, r0
	lsrs r0, r0, #0x14
	adds r7, r0, #1
_080974C4:
	ldrh r1, [r4, #0x2a]
	adds r1, #1
	mov r3, r8
	ldrb r2, [r3]
	adds r2, r2, r7
	lsls r0, r6, #3
	adds r2, r2, r0
	ldr r0, _08097540  @ gUnknown_08A1879C
	ldr r3, [r0, #0x20]
	mov r0, r9
	str r0, [sp]
	movs r0, #4
	bl PutSpriteExt
	adds r6, #1
	cmp r6, r5
	bcc _080974C4
_080974E6:
	ldrh r0, [r4, #0x2e]
	lsrs r0, r0, #4
	ldr r1, [sp, #0x10]
	ldrb r1, [r1]
	adds r0, r0, r1
	ldrh r2, [r4, #0x32]
	cmp r0, r2
	bne _08097544
	mov r3, sl
	ldrb r0, [r3]
	lsls r0, r0, #3
	ldr r5, [sp, #4]
	ldr r2, [sp, #0xc]
	adds r1, r5, #0
	muls r1, r2, r1
	lsrs r2, r1, #0x14
	lsls r3, r6, #3
	adds r1, r2, r3
	subs r0, r0, r1
	cmp r0, #0
	beq _080975A6
	ldrh r1, [r4, #0x2a]
	adds r1, #1
	adds r2, #1
	mov r5, r8
	ldrb r5, [r5]
	adds r2, r2, r5
	adds r2, r2, r3
	ldr r3, _08097540  @ gUnknown_08A1879C
	lsls r0, r0, #2
	adds r0, r0, r3
	ldr r3, [r0]
	mov r6, r9
	str r6, [sp]
	movs r0, #4
	bl PutSpriteExt
	b _080975A6
	.align 2, 0
_08097534: .4byte gUnknown_08A18744
_08097538: .4byte 0x00002001
_0809753C: .4byte gUnknown_08A187F0
_08097540: .4byte gUnknown_08A1879C
_08097544:
	ldr r0, [sp, #8]
	lsrs r5, r0, #0x10
	movs r0, #7
	ands r5, r0
	cmp r5, #0
	beq _0809757C
	ldrh r1, [r4, #0x2a]
	adds r1, #1
	ldr r3, [sp, #4]
	ldr r0, [sp, #0xc]
	adds r2, r3, #0
	muls r2, r0, r2
	lsrs r2, r2, #0x14
	adds r2, #1
	mov r3, r8
	ldrb r3, [r3]
	adds r2, r2, r3
	lsls r0, r6, #3
	adds r2, r2, r0
	ldr r3, _0809763C  @ gUnknown_08A1879C
	lsls r0, r5, #2
	adds r0, r0, r3
	ldr r3, [r0]
	mov r5, r9
	str r5, [sp]
	movs r0, #4
	bl PutSpriteExt
_0809757C:
	ldrh r1, [r4, #0x2a]
	adds r1, #1
	mov r6, sl
	ldrb r2, [r6]
	lsls r2, r2, #3
	mov r0, r8
	ldrb r0, [r0]
	adds r2, r2, r0
	adds r2, #2
	ldr r3, _08097640  @ gUnknown_08A187F0
	ldr r5, [sp, #0x18]
	ldrb r0, [r5]
	lsrs r0, r0, #3
	lsls r0, r0, #2
	adds r0, r0, r3
	ldr r3, [r0]
	mov r6, r9
	str r6, [sp]
	movs r0, #4
	bl PutSpriteExt
_080975A6:
	ldrh r1, [r4, #0x2a]
	adds r1, #1
	mov r0, r8
	ldrb r2, [r0]
	subs r2, #7
	ldr r3, _08097644  @ gUnknown_08A1874C
	mov r5, r9
	str r5, [sp]
	movs r0, #4
	bl PutSpriteExt
	ldrh r1, [r4, #0x2a]
	adds r1, #1
	mov r6, r8
	ldrb r2, [r6]
	mov r3, sl
	ldrb r0, [r3]
	lsls r0, r0, #3
	adds r0, #1
	adds r2, r2, r0
	ldr r3, _08097648  @ gUnknown_08A18754
	str r5, [sp]
	movs r0, #4
	bl PutSpriteExt
_080975D8:
	ldrh r1, [r4, #0x30]
	ldrh r0, [r4, #0x2e]
	cmp r1, r0
	beq _08097600
	cmp r1, r0
	bls _080975EC
	ldr r5, [sp, #0x14]
	ldrb r0, [r5]
	adds r0, #3
	strb r0, [r5]
_080975EC:
	ldrh r0, [r4, #0x30]
	ldrh r6, [r4, #0x2e]
	cmp r0, r6
	bcs _080975FC
	ldr r1, [sp, #0x18]
	ldrb r0, [r1]
	adds r0, #3
	strb r0, [r1]
_080975FC:
	ldrh r0, [r4, #0x2e]
	strh r0, [r4, #0x30]
_08097600:
	ldr r2, [sp, #0x14]
	ldrb r0, [r2]
	adds r0, #1
	movs r2, #0
	ldr r3, [sp, #0x14]
	strb r0, [r3]
	ldr r1, [sp, #0x18]
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldrb r0, [r3]
	lsrs r0, r0, #3
	cmp r0, #5
	bls _0809761E
	strb r2, [r3]
_0809761E:
	ldr r5, [sp, #0x18]
	ldrb r0, [r5]
	lsrs r0, r0, #3
	cmp r0, #5
	bls _0809762A
	strb r2, [r5]
_0809762A:
	add sp, #0x1c
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809763C: .4byte gUnknown_08A1879C
_08097640: .4byte gUnknown_08A187F0
_08097644: .4byte gUnknown_08A1874C
_08097648: .4byte gUnknown_08A18754

	THUMB_FUNC_END sub_80973E4

	THUMB_FUNC_START sub_809764C
sub_809764C: @ 0x0809764C
	push {lr}
	ldr r0, _08097664  @ ProcScr_PrepSideBarHandler
	bl Proc_Find
	cmp r0, #0
	beq _0809765E
	movs r1, #1
	bl Proc_Goto
_0809765E:
	pop {r0}
	bx r0
	.align 2, 0
_08097664: .4byte ProcScr_PrepSideBarHandler

	THUMB_FUNC_END sub_809764C

	THUMB_FUNC_START sub_8097668
sub_8097668: @ 0x08097668
	push {lr}
	ldr r0, _08097680  @ ProcScr_PrepSideBarHandler
	bl Proc_Find
	cmp r0, #0
	beq _0809767A
	movs r1, #0
	bl Proc_Goto
_0809767A:
	pop {r0}
	bx r0
	.align 2, 0
_08097680: .4byte ProcScr_PrepSideBarHandler

	THUMB_FUNC_END sub_8097668

	THUMB_FUNC_START Delete6CMenuScroll
Delete6CMenuScroll: @ 0x08097684
	push {lr}
	ldr r0, _08097694  @ ProcScr_PrepSideBarHandler
	bl Proc_Find
	bl Proc_End
	pop {r0}
	bx r0
	.align 2, 0
_08097694: .4byte ProcScr_PrepSideBarHandler

	THUMB_FUNC_END Delete6CMenuScroll

	THUMB_FUNC_START Make6CMenuScroll
Make6CMenuScroll: @ 0x08097698
	push {lr}
	adds r1, r0, #0
	ldr r0, _080976A8  @ ProcScr_PrepSideBarHandler
	bl Proc_Start
	pop {r1}
	bx r1
	.align 2, 0
_080976A8: .4byte ProcScr_PrepSideBarHandler

	THUMB_FUNC_END Make6CMenuScroll

	THUMB_FUNC_START sub_80976AC
sub_80976AC: @ 0x080976AC
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _080976C8  @ ProcScr_PrepSideBarHandler
	bl Proc_Find
	cmp r0, #0
	beq _080976C2
	strh r4, [r0, #0x2a]
	adds r0, #0x2c
	strb r5, [r0]
_080976C2:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080976C8: .4byte ProcScr_PrepSideBarHandler

	THUMB_FUNC_END sub_80976AC

	THUMB_FUNC_START sub_80976CC
sub_80976CC: @ 0x080976CC
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	lsls r1, r1, #0x10
	lsrs r6, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r4, r2, #0x10
	lsls r3, r3, #0x18
	lsrs r5, r3, #0x18
	ldr r0, _080976FC  @ ProcScr_PrepSideBarHandler
	bl Proc_Find
	cmp r0, #0
	beq _080976F6
	adds r1, r0, #0
	adds r1, #0x2d
	strb r7, [r1]
	strh r6, [r0, #0x2e]
	strh r4, [r0, #0x32]
	adds r0, #0x34
	strb r5, [r0]
_080976F6:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080976FC: .4byte ProcScr_PrepSideBarHandler

	THUMB_FUNC_END sub_80976CC

	THUMB_FUNC_START InitPrepSideBarImg
InitPrepSideBarImg: @ 0x08097700
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _08097738  @ Pal_PrepWindowSideBar
	adds r1, #0x10
	lsls r1, r1, #5
	movs r2, #0x20
	bl CopyToPaletteBuffer
	ldr r0, _0809773C  @ Img_PrepWindowSideBar
	ldr r2, _08097740  @ 0x06010000
	adds r1, r4, r2
	bl Decompress
	ldr r0, _08097744  @ ProcScr_PrepSideBarHandler
	bl Proc_Find
	adds r2, r0, #0
	cmp r2, #0
	beq _08097730
	asrs r0, r4, #5
	strh r0, [r2, #0x36]
	lsls r0, r5, #0xc
	strh r0, [r2, #0x38]
_08097730:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08097738: .4byte Pal_PrepWindowSideBar
_0809773C: .4byte Img_PrepWindowSideBar
_08097740: .4byte 0x06010000
_08097744: .4byte ProcScr_PrepSideBarHandler

	THUMB_FUNC_END InitPrepSideBarImg

	THUMB_FUNC_START PrepStartSideBarScroll
PrepStartSideBarScroll: @ 0x08097748
	push {r4, r5, r6, lr}
	mov r6, r9
	mov r5, r8
	push {r5, r6}
	adds r4, r0, #0
	mov r8, r1
	mov r9, r2
	adds r5, r3, #0
	ldr r6, [sp, #0x18]
	ldr r0, _0809779C  @ ProcScr_PrepSideBarHandler
	adds r1, r4, #0
	bl Proc_Start
	adds r4, r0, #0
	mov r0, r8
	strh r0, [r4, #0x2a]
	adds r0, r4, #0
	adds r0, #0x2c
	mov r1, r9
	strb r1, [r0]
	ldr r0, _080977A0  @ Pal_PrepWindowSideBar
	adds r1, r6, #0
	adds r1, #0x10
	lsls r1, r1, #5
	movs r2, #0x20
	bl CopyToPaletteBuffer
	ldr r0, _080977A4  @ Img_PrepWindowSideBar
	ldr r2, _080977A8  @ 0x06010000
	adds r1, r5, r2
	bl Decompress
	asrs r5, r5, #5
	strh r5, [r4, #0x36]
	lsls r6, r6, #0xc
	strh r6, [r4, #0x38]
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0809779C: .4byte ProcScr_PrepSideBarHandler
_080977A0: .4byte Pal_PrepWindowSideBar
_080977A4: .4byte Img_PrepWindowSideBar
_080977A8: .4byte 0x06010000

	THUMB_FUNC_END PrepStartSideBarScroll

.align 2, 0
