	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	THUMB_FUNC_START sub_80AD364
sub_80AD364: @ 0x080AD364
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	bl GetGameClock
	ldr r1, _080AD424  @ gPaletteBuffer
	ldrh r2, [r5, #0x3a]
	lsls r2, r2, #5
	movs r3, #0x87
	lsls r3, r3, #2
	adds r2, r2, r3
	adds r2, r2, r1
	ldr r1, _080AD428  @ gPlaySt
	adds r1, #0x41
	ldrb r1, [r1]
	lsls r1, r1, #0x1c
	lsrs r1, r1, #0x1e
	lsls r1, r1, #4
	lsrs r0, r0, #2
	movs r4, #0xf
	ands r0, r4
	adds r1, r1, r0
	lsls r1, r1, #1
	ldr r0, _080AD42C  @ gUnknown_08A1D448
	adds r1, r1, r0
	ldrh r0, [r1]
	strh r0, [r2]
	bl EnablePaletteSync
	ldr r1, [r5, #0x2c]
	ldr r2, [r5, #0x30]
	adds r2, #8
	ldr r3, _080AD430  @ gObject_8x8
	ldrh r0, [r5, #0x3a]
	ands r4, r0
	lsls r4, r4, #0xc
	ldrh r0, [r5, #0x3c]
	adds r4, r4, r0
	ldrh r0, [r5, #0x36]
	adds r4, r4, r0
	str r4, [sp]
	movs r0, #4
	bl PutSpriteExt
	movs r4, #1
	ldrh r3, [r5, #0x38]
	cmp r4, r3
	bge _080AD3F2
_080AD3C4:
	lsls r0, r4, #3
	ldr r1, [r5, #0x2c]
	adds r1, r1, r0
	ldr r2, [r5, #0x30]
	adds r2, #8
	ldrh r3, [r5, #0x3a]
	movs r0, #0xf
	ands r0, r3
	lsls r0, r0, #0xc
	ldrh r3, [r5, #0x3c]
	adds r0, r0, r3
	ldrh r3, [r5, #0x36]
	adds r0, r0, r3
	adds r0, #1
	str r0, [sp]
	movs r0, #4
	ldr r3, _080AD430  @ gObject_8x8
	bl PutSpriteExt
	adds r4, #1
	ldrh r0, [r5, #0x38]
	cmp r4, r0
	blt _080AD3C4
_080AD3F2:
	ldrh r0, [r5, #0x38]
	lsls r0, r0, #3
	ldr r1, [r5, #0x2c]
	adds r1, r1, r0
	ldr r2, [r5, #0x30]
	adds r2, #8
	ldr r3, _080AD430  @ gObject_8x8
	ldrh r4, [r5, #0x3a]
	movs r0, #0xf
	ands r0, r4
	lsls r0, r0, #0xc
	ldrh r4, [r5, #0x3c]
	adds r0, r0, r4
	ldrh r4, [r5, #0x36]
	adds r0, r0, r4
	adds r0, #2
	str r0, [sp]
	movs r0, #4
	bl PutSpriteExt
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080AD424: .4byte gPaletteBuffer
_080AD428: .4byte gPlaySt
_080AD42C: .4byte gUnknown_08A1D448
_080AD430: .4byte gObject_8x8

	THUMB_FUNC_END sub_80AD364

	THUMB_FUNC_START sub_80AD434
sub_80AD434: @ 0x080AD434
	adds r0, #0x35
	movs r1, #0
	strb r1, [r0]
	bx lr

	THUMB_FUNC_END sub_80AD434

	THUMB_FUNC_START sub_80AD43C
sub_80AD43C: @ 0x080AD43C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x2c]
	ldr r1, [r4, #0x30]
	bl DisplayUiHand
	adds r0, r4, #0
	adds r0, #0x35
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _080AD45C
	adds r0, r4, #0
	bl sub_80AD364
_080AD45C:
	adds r0, r4, #0
	adds r0, #0x34
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _080AD474
	ldr r0, [r4, #0x2c]
	ldr r1, [r4, #0x30]
	adds r1, #2
	bl sub_8015B88
_080AD474:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80AD43C

	THUMB_FUNC_START ResetPrepScreenHandCursor
ResetPrepScreenHandCursor: @ 0x080AD47C
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _080AD49C  @ ProcScr_SysHandCtrlMaybe
	adds r0, r4, #0
	bl Proc_Find
	bl Proc_End
	adds r0, r4, #0
	adds r1, r5, #0
	bl Proc_Start
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080AD49C: .4byte ProcScr_SysHandCtrlMaybe

	THUMB_FUNC_END ResetPrepScreenHandCursor

	THUMB_FUNC_START sub_80AD4A0
sub_80AD4A0: @ 0x080AD4A0
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	ldr r0, _080AD4D8  @ ProcScr_SysHandCtrlMaybe
	bl Proc_Find
	adds r2, r0, #0
	cmp r2, #0
	beq _080AD4D0
	adds r1, r2, #0
	adds r1, #0x34
	movs r0, #0
	strb r0, [r1]
	lsls r0, r5, #0xf
	lsrs r0, r0, #0x14
	strh r0, [r2, #0x36]
	movs r0, #0xf
	ands r4, r0
	strh r4, [r2, #0x3a]
	ldr r0, _080AD4DC  @ Img_PrepTextShadow
	ldr r2, _080AD4E0  @ 0x06010000
	adds r1, r5, r2
	bl Decompress
_080AD4D0:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080AD4D8: .4byte ProcScr_SysHandCtrlMaybe
_080AD4DC: .4byte Img_PrepTextShadow
_080AD4E0: .4byte 0x06010000

	THUMB_FUNC_END sub_80AD4A0

	THUMB_FUNC_START SetPrepScreenHandXPos
SetPrepScreenHandXPos: @ 0x080AD4E4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080AD4FC  @ ProcScr_SysHandCtrlMaybe
	bl Proc_Find
	cmp r0, #0
	beq _080AD4F4
	str r4, [r0, #0x2c]
_080AD4F4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080AD4FC: .4byte ProcScr_SysHandCtrlMaybe

	THUMB_FUNC_END SetPrepScreenHandXPos

	THUMB_FUNC_START SetPrepScreenHandYPos
SetPrepScreenHandYPos: @ 0x080AD500
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080AD518  @ ProcScr_SysHandCtrlMaybe
	bl Proc_Find
	cmp r0, #0
	beq _080AD510
	str r4, [r0, #0x30]
_080AD510:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080AD518: .4byte ProcScr_SysHandCtrlMaybe

	THUMB_FUNC_END SetPrepScreenHandYPos

	THUMB_FUNC_START ShowPrepScreenHandCursor
ShowPrepScreenHandCursor: @ 0x080AD51C
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	adds r4, r2, #0
	lsls r3, r3, #0x10
	lsrs r7, r3, #0x10
	ldr r0, _080AD544  @ ProcScr_SysHandCtrlMaybe
	bl Proc_Find
	adds r1, r0, #0
	cmp r1, #0
	beq _080AD55C
	str r5, [r1, #0x2c]
	str r6, [r1, #0x30]
	cmp r4, #0
	bne _080AD548
	adds r0, #0x35
	strb r4, [r0]
	b _080AD554
	.align 2, 0
_080AD544: .4byte ProcScr_SysHandCtrlMaybe
_080AD548:
	adds r2, r1, #0
	adds r2, #0x35
	movs r0, #1
	strb r0, [r2]
	strh r4, [r1, #0x38]
	strh r7, [r1, #0x3c]
_080AD554:
	adds r0, r1, #0
	movs r1, #1
	bl Proc_Goto
_080AD55C:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END ShowPrepScreenHandCursor

	THUMB_FUNC_START HidePrepScreenHandCursor
HidePrepScreenHandCursor: @ 0x080AD564
	push {lr}
	ldr r0, _080AD57C  @ ProcScr_SysHandCtrlMaybe
	bl Proc_Find
	cmp r0, #0
	beq _080AD576
	movs r1, #0
	bl Proc_Goto
_080AD576:
	pop {r0}
	bx r0
	.align 2, 0
_080AD57C: .4byte ProcScr_SysHandCtrlMaybe

	THUMB_FUNC_END HidePrepScreenHandCursor

	THUMB_FUNC_START EndPrepScreenHandCursor
EndPrepScreenHandCursor: @ 0x080AD580
	push {lr}
	ldr r0, _080AD590  @ ProcScr_SysHandCtrlMaybe
	bl Proc_Find
	bl Proc_End
	pop {r0}
	bx r0
	.align 2, 0
_080AD590: .4byte ProcScr_SysHandCtrlMaybe

	THUMB_FUNC_END EndPrepScreenHandCursor

	THUMB_FUNC_START sub_80AD594
sub_80AD594: @ 0x080AD594
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r0, _080AD5B0  @ ProcScr_SysHandCtrlMaybe
	bl Proc_Find
	cmp r0, #0
	beq _080AD5A8
	adds r0, #0x34
	strb r4, [r0]
_080AD5A8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080AD5B0: .4byte ProcScr_SysHandCtrlMaybe

	THUMB_FUNC_END sub_80AD594

	THUMB_FUNC_START sub_80AD5B4
sub_80AD5B4: @ 0x080AD5B4
	ldr r2, _080AD5D4  @ gLCDControlBuffer
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
	subs r1, #8
	ands r0, r1
	strb r0, [r2, #1]
	bx lr
	.align 2, 0
_080AD5D4: .4byte gLCDControlBuffer

	THUMB_FUNC_END sub_80AD5B4

	THUMB_FUNC_START EnableAllGfx
EnableAllGfx: @ 0x080AD5D8
	ldr r2, _080AD5F4  @ gLCDControlBuffer
	ldrb r0, [r2, #1]
	movs r1, #1
	orrs r0, r1
	movs r1, #2
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2, #1]
	bx lr
	.align 2, 0
_080AD5F4: .4byte gLCDControlBuffer

	THUMB_FUNC_END EnableAllGfx

	THUMB_FUNC_START sub_80AD5F8
sub_80AD5F8: @ 0x080AD5F8
	push {lr}
	movs r2, #0
	movs r1, #3
	adds r0, #0x50
_080AD600:
	strb r2, [r0]
	subs r0, #0xc
	subs r1, #1
	cmp r1, #0
	bge _080AD600
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80AD5F8

	THUMB_FUNC_START sub_80AD610
sub_80AD610: @ 0x080AD610
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	str r0, [sp, #4]
	movs r1, #0
_080AD620:
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, #0x2c
	ldr r2, [sp, #4]
	adds r5, r2, r0
	movs r0, #0
	ldrsb r0, [r5, r0]
	adds r1, #1
	str r1, [sp, #0xc]
	cmp r0, #0
	bne _080AD63A
	b _080AD934
_080AD63A:
	ldr r1, [r2, #0x60]
	movs r0, #0xf
	ands r1, r0
	lsls r1, r1, #0xc
	ldr r0, [r2, #0x5c]
	adds r0, r0, r1
	ldrh r3, [r5, #8]
	adds r0, r0, r3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	ldrb r0, [r5, #1]
	ldrh r2, [r5, #2]
	ldr r1, _080AD8B8  @ 0x000001FF
	ands r1, r2
	ldrh r3, [r5, #4]
	movs r2, #0xff
	ands r2, r3
	mov r3, r8
	str r3, [sp]
	ldr r3, _080AD8BC  @ gObject_8x8
	bl PutSpriteExt
	ldrb r0, [r5, #1]
	movs r2, #2
	ldrsh r1, [r5, r2]
	ldrb r2, [r5, #6]
	subs r2, #1
	lsls r2, r2, #3
	adds r1, r1, r2
	ldr r3, _080AD8B8  @ 0x000001FF
	ands r1, r3
	movs r2, #0x80
	lsls r2, r2, #5
	adds r1, r1, r2
	ldrh r3, [r5, #4]
	movs r2, #0xff
	ands r2, r3
	mov r3, r8
	str r3, [sp]
	ldr r3, _080AD8BC  @ gObject_8x8
	bl PutSpriteExt
	ldrb r0, [r5, #1]
	movs r2, #2
	ldrsh r1, [r5, r2]
	ldrb r2, [r5, #6]
	subs r2, #1
	lsls r2, r2, #3
	adds r1, r1, r2
	ldr r3, _080AD8B8  @ 0x000001FF
	ands r1, r3
	movs r2, #0xc0
	lsls r2, r2, #6
	adds r1, r1, r2
	movs r3, #4
	ldrsh r2, [r5, r3]
	ldrb r3, [r5, #7]
	subs r3, #1
	lsls r3, r3, #3
	adds r2, r2, r3
	movs r3, #0xff
	ands r2, r3
	mov r3, r8
	str r3, [sp]
	ldr r3, _080AD8BC  @ gObject_8x8
	bl PutSpriteExt
	ldrb r0, [r5, #1]
	ldrh r2, [r5, #2]
	ldr r1, _080AD8B8  @ 0x000001FF
	ands r1, r2
	movs r2, #0x80
	lsls r2, r2, #6
	adds r1, r1, r2
	movs r3, #4
	ldrsh r2, [r5, r3]
	ldrb r3, [r5, #7]
	subs r3, #1
	lsls r3, r3, #3
	adds r2, r2, r3
	movs r3, #0xff
	ands r2, r3
	mov r3, r8
	str r3, [sp]
	ldr r3, _080AD8BC  @ gObject_8x8
	bl PutSpriteExt
	movs r7, #1
	ldrb r0, [r5, #6]
	subs r0, #4
	cmp r7, r0
	bge _080AD750
	ldr r0, _080AD8B8  @ 0x000001FF
	mov sl, r0
	ldr r1, _080AD8C0  @ gObject_32x8
	mov r9, r1
	mov r6, r8
	adds r6, #1
_080AD700:
	ldrb r0, [r5, #1]
	movs r2, #2
	ldrsh r1, [r5, r2]
	lsls r4, r7, #3
	adds r1, r1, r4
	mov r3, sl
	ands r1, r3
	ldrh r3, [r5, #4]
	movs r2, #0xff
	ands r2, r3
	str r6, [sp]
	mov r3, r9
	bl PutSpriteExt
	ldrb r0, [r5, #1]
	movs r2, #2
	ldrsh r1, [r5, r2]
	adds r1, r1, r4
	mov r3, sl
	ands r1, r3
	movs r2, #0x80
	lsls r2, r2, #6
	adds r1, r1, r2
	movs r3, #4
	ldrsh r2, [r5, r3]
	ldrb r3, [r5, #7]
	subs r3, #1
	lsls r3, r3, #3
	adds r2, r2, r3
	movs r3, #0xff
	ands r2, r3
	str r6, [sp]
	mov r3, r9
	bl PutSpriteExt
	adds r7, #4
	ldrb r0, [r5, #6]
	subs r0, #4
	cmp r7, r0
	blt _080AD700
_080AD750:
	ldrb r0, [r5, #6]
	subs r0, #2
	cmp r7, r0
	bge _080AD7B4
	ldr r0, _080AD8B8  @ 0x000001FF
	mov sl, r0
	ldr r1, _080AD8C4  @ gObject_16x8
	mov r9, r1
	mov r6, r8
	adds r6, #1
_080AD764:
	ldrb r0, [r5, #1]
	movs r2, #2
	ldrsh r1, [r5, r2]
	lsls r4, r7, #3
	adds r1, r1, r4
	mov r3, sl
	ands r1, r3
	ldrh r3, [r5, #4]
	movs r2, #0xff
	ands r2, r3
	str r6, [sp]
	mov r3, r9
	bl PutSpriteExt
	ldrb r0, [r5, #1]
	movs r2, #2
	ldrsh r1, [r5, r2]
	adds r1, r1, r4
	mov r3, sl
	ands r1, r3
	movs r2, #0x80
	lsls r2, r2, #6
	adds r1, r1, r2
	movs r3, #4
	ldrsh r2, [r5, r3]
	ldrb r3, [r5, #7]
	subs r3, #1
	lsls r3, r3, #3
	adds r2, r2, r3
	movs r3, #0xff
	ands r2, r3
	str r6, [sp]
	mov r3, r9
	bl PutSpriteExt
	adds r7, #2
	ldrb r0, [r5, #6]
	subs r0, #2
	cmp r7, r0
	blt _080AD764
_080AD7B4:
	ldrb r0, [r5, #6]
	subs r0, #1
	cmp r7, r0
	bge _080AD818
	ldr r0, _080AD8B8  @ 0x000001FF
	mov sl, r0
	ldr r1, _080AD8BC  @ gObject_8x8
	mov r9, r1
	mov r6, r8
	adds r6, #1
_080AD7C8:
	ldrb r0, [r5, #1]
	movs r2, #2
	ldrsh r1, [r5, r2]
	lsls r4, r7, #3
	adds r1, r1, r4
	mov r3, sl
	ands r1, r3
	ldrh r3, [r5, #4]
	movs r2, #0xff
	ands r2, r3
	str r6, [sp]
	mov r3, r9
	bl PutSpriteExt
	ldrb r0, [r5, #1]
	movs r2, #2
	ldrsh r1, [r5, r2]
	adds r1, r1, r4
	mov r3, sl
	ands r1, r3
	movs r2, #0x80
	lsls r2, r2, #6
	adds r1, r1, r2
	movs r3, #4
	ldrsh r2, [r5, r3]
	ldrb r3, [r5, #7]
	subs r3, #1
	lsls r3, r3, #3
	adds r2, r2, r3
	movs r3, #0xff
	ands r2, r3
	str r6, [sp]
	mov r3, r9
	bl PutSpriteExt
	adds r7, #1
	ldrb r0, [r5, #6]
	subs r0, #1
	cmp r7, r0
	blt _080AD7C8
_080AD818:
	movs r7, #1
	ldrb r0, [r5, #7]
	subs r0, #1
	cmp r7, r0
	blt _080AD824
	b _080AD934
_080AD824:
	ldr r0, _080AD8B8  @ 0x000001FF
	mov sl, r0
	movs r1, #0xff
	mov r9, r1
	mov r2, r8
	adds r2, #9
	str r2, [sp, #8]
_080AD832:
	ldrb r0, [r5, #1]
	ldrh r2, [r5, #2]
	mov r1, sl
	ands r1, r2
	movs r3, #4
	ldrsh r2, [r5, r3]
	lsls r4, r7, #3
	adds r2, r2, r4
	mov r3, r9
	ands r2, r3
	ldr r3, [sp, #8]
	str r3, [sp]
	ldr r3, _080AD8BC  @ gObject_8x8
	bl PutSpriteExt
	ldrb r0, [r5, #1]
	movs r2, #2
	ldrsh r1, [r5, r2]
	ldrb r2, [r5, #6]
	subs r2, #1
	lsls r2, r2, #3
	adds r1, r1, r2
	mov r3, sl
	ands r1, r3
	movs r2, #0x80
	lsls r2, r2, #5
	adds r1, r1, r2
	movs r3, #4
	ldrsh r2, [r5, r3]
	adds r2, r2, r4
	mov r3, r9
	ands r2, r3
	ldr r3, [sp, #8]
	str r3, [sp]
	ldr r3, _080AD8BC  @ gObject_8x8
	bl PutSpriteExt
	movs r6, #1
	ldrb r0, [r5, #6]
	subs r0, #4
	adds r7, #1
	cmp r6, r0
	bge _080AD8EE
_080AD888:
	ldrb r0, [r5, #1]
	movs r2, #2
	ldrsh r1, [r5, r2]
	lsls r2, r6, #3
	adds r1, r1, r2
	mov r3, sl
	ands r1, r3
	movs r3, #4
	ldrsh r2, [r5, r3]
	adds r2, r2, r4
	mov r3, r9
	ands r2, r3
	mov r3, r8
	adds r3, #5
	str r3, [sp]
	ldr r3, _080AD8C0  @ gObject_32x8
	bl PutSpriteExt
	adds r6, #4
	ldrb r0, [r5, #6]
	subs r0, #4
	cmp r6, r0
	blt _080AD888
	b _080AD8EE
	.align 2, 0
_080AD8B8: .4byte 0x000001FF
_080AD8BC: .4byte gObject_8x8
_080AD8C0: .4byte gObject_32x8
_080AD8C4: .4byte gObject_16x8
_080AD8C8:
	ldrb r0, [r5, #1]
	movs r2, #2
	ldrsh r1, [r5, r2]
	lsls r2, r6, #3
	adds r1, r1, r2
	mov r3, sl
	ands r1, r3
	movs r3, #4
	ldrsh r2, [r5, r3]
	adds r2, r2, r4
	mov r3, r9
	ands r2, r3
	mov r3, r8
	adds r3, #5
	str r3, [sp]
	ldr r3, _080AD8F8  @ gObject_16x8
	bl PutSpriteExt
	adds r6, #2
_080AD8EE:
	ldrb r0, [r5, #6]
	subs r0, #2
	cmp r6, r0
	blt _080AD8C8
	b _080AD922
	.align 2, 0
_080AD8F8: .4byte gObject_16x8
_080AD8FC:
	ldrb r0, [r5, #1]
	movs r2, #2
	ldrsh r1, [r5, r2]
	lsls r2, r6, #3
	adds r1, r1, r2
	mov r3, sl
	ands r1, r3
	movs r3, #4
	ldrsh r2, [r5, r3]
	adds r2, r2, r4
	mov r3, r9
	ands r2, r3
	mov r3, r8
	adds r3, #5
	str r3, [sp]
	ldr r3, _080AD94C  @ gObject_8x8
	bl PutSpriteExt
	adds r6, #1
_080AD922:
	ldrb r0, [r5, #6]
	subs r0, #1
	cmp r6, r0
	blt _080AD8FC
	ldrb r0, [r5, #7]
	subs r0, #1
	cmp r7, r0
	bge _080AD934
	b _080AD832
_080AD934:
	ldr r1, [sp, #0xc]
	cmp r1, #3
	bgt _080AD93C
	b _080AD620
_080AD93C:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080AD94C: .4byte gObject_8x8

	THUMB_FUNC_END sub_80AD610

	THUMB_FUNC_START sub_80AD950
sub_80AD950: @ 0x080AD950
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r6, r1, #0
	adds r1, r2, #0
	ldr r0, _080AD988  @ gUnknown_08A20C4C
	bl Proc_Start
	adds r5, r0, #0
	ldr r0, _080AD98C  @ gUnknown_085B92C4
	ldr r2, _080AD990  @ 0x06010000
	adds r1, r4, r2
	bl Decompress
	ldr r0, _080AD994  @ gPaletteBuffer+0x20
	adds r1, r6, #0
	adds r1, #0x10
	lsls r1, r1, #5
	movs r2, #0x20
	bl CopyToPaletteBuffer
	lsls r4, r4, #0xf
	lsrs r4, r4, #0x14
	str r4, [r5, #0x5c]
	str r6, [r5, #0x60]
	adds r0, r5, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_080AD988: .4byte gUnknown_08A20C4C
_080AD98C: .4byte gUnknown_085B92C4
_080AD990: .4byte 0x06010000
_080AD994: .4byte gPaletteBuffer+0x20

	THUMB_FUNC_END sub_80AD950

	THUMB_FUNC_START sub_80AD998
sub_80AD998: @ 0x080AD998
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	adds r6, r1, #0
	adds r7, r2, #0
	mov r8, r3
	ldr r0, [sp, #0x20]
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	ldr r0, _080AD9E4  @ gUnknown_08A20C4C
	bl Proc_Find
	adds r1, r0, #0
	cmp r1, #0
	beq _080AD9D8
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #2
	adds r0, #0x2c
	adds r0, r1, r0
	movs r1, #1
	strb r1, [r0]
	strb r6, [r0, #1]
	strh r7, [r0, #2]
	mov r1, r8
	strh r1, [r0, #4]
	ldr r1, [sp, #0x18]
	strb r1, [r0, #6]
	ldr r1, [sp, #0x1c]
	strb r1, [r0, #7]
	strh r5, [r0, #8]
_080AD9D8:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080AD9E4: .4byte gUnknown_08A20C4C

	THUMB_FUNC_END sub_80AD998

	THUMB_FUNC_START sub_80AD9E8
sub_80AD9E8: @ 0x080AD9E8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080ADA0C  @ gUnknown_08A20C4C
	bl Proc_Find
	adds r1, r0, #0
	cmp r1, #0
	beq _080ADA06
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #2
	adds r0, #0x2c
	adds r0, r1, r0
	movs r1, #0
	strb r1, [r0]
_080ADA06:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080ADA0C: .4byte gUnknown_08A20C4C

	THUMB_FUNC_END sub_80AD9E8

	THUMB_FUNC_START sub_80ADA10
sub_80ADA10: @ 0x080ADA10
	push {lr}
	ldr r0, _080ADA20  @ gUnknown_08A20C4C
	bl Proc_Find
	bl Proc_End
	pop {r0}
	bx r0
	.align 2, 0
_080ADA20: .4byte gUnknown_08A20C4C

	THUMB_FUNC_END sub_80ADA10

	THUMB_FUNC_START sub_80ADA24
sub_80ADA24: @ 0x080ADA24
	push {lr}
	movs r2, #0
	adds r0, #0x2c
	movs r1, #3
_080ADA2C:
	strb r2, [r0]
	strb r2, [r0, #6]
	adds r0, #8
	subs r1, #1
	cmp r1, #0
	bge _080ADA2C
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80ADA24

	THUMB_FUNC_START sub_80ADA3C
sub_80ADA3C: @ 0x080ADA3C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x30
	mov sl, r0
	add r1, sp, #4
	ldr r0, _080ADB24  @ gUnknown_08205E18
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldr r0, [r0]
	str r0, [r1]
	add r2, sp, #0x14
	adds r1, r2, #0
	ldr r0, _080ADB28  @ gUnknown_08205E28
	ldm r0!, {r3, r5, r7}
	stm r1!, {r3, r5, r7}
	ldr r0, [r0]
	str r0, [r1]
	mov r4, sl
	adds r4, #0x2d
	str r4, [sp, #0x28]
	mov r5, sl
	adds r5, #0x2c
	movs r7, #3
	str r7, [sp, #0x24]
_080ADA72:
	movs r0, #0
	ldrsb r0, [r5, r0]
	cmp r0, #0
	beq _080ADB58
	movs r0, #2
	ldrsh r6, [r5, r0]
	movs r0, #6
	ldrsb r0, [r5, r0]
	cmp r0, #0
	beq _080ADB2C
	ldrb r4, [r5, #1]
	adds r0, r4, #0
	movs r1, #1
	ands r0, r1
	mov r7, sl
	adds r7, #0x50
	movs r2, #0x4e
	add r2, sl
	mov r8, r2
	movs r3, #0x4c
	add r3, sl
	mov r9, r3
	cmp r0, #0
	beq _080ADACA
	ldrb r0, [r7]
	adds r1, r6, #0
	adds r1, #0x60
	movs r3, #4
	ldrsh r2, [r5, r3]
	mov ip, r2
	mov r2, r8
	movs r3, #0
	ldrsh r2, [r2, r3]
	add r2, ip
	lsls r3, r4, #2
	add r3, sp
	adds r3, #0x14
	ldr r3, [r3]
	mov r4, r9
	ldrh r4, [r4]
	str r4, [sp]
	bl PutSpriteExt
	adds r6, #0x20
_080ADACA:
	ldrb r0, [r7]
	movs r1, #4
	ldrsh r2, [r5, r1]
	mov r3, r8
	movs r4, #0
	ldrsh r1, [r3, r4]
	adds r2, r2, r1
	ldr r3, [sp, #0x28]
	ldrb r1, [r3]
	lsls r1, r1, #2
	add r1, sp
	adds r1, #4
	ldr r3, [r1]
	mov r4, r9
	ldrh r1, [r4]
	str r1, [sp]
	adds r1, r6, #0
	bl PutSpriteExt
	ldr r0, [sp, #0x28]
	ldrb r3, [r0]
	adds r0, r3, #0
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _080ADB58
	adds r6, #0x60
	ldrb r0, [r7]
	movs r4, #4
	ldrsh r2, [r5, r4]
	mov r7, r8
	movs r4, #0
	ldrsh r1, [r7, r4]
	adds r2, r2, r1
	lsls r1, r3, #2
	add r1, sp
	adds r1, #0x14
	ldr r3, [r1]
	mov r7, r9
	ldrh r1, [r7]
	str r1, [sp]
	adds r1, r6, #0
	bl PutSpriteExt
	b _080ADB58
	.align 2, 0
_080ADB24: .4byte gUnknown_08205E18
_080ADB28: .4byte gUnknown_08205E28
_080ADB2C:
	mov r0, sl
	adds r0, #0x50
	ldrb r0, [r0]
	movs r1, #4
	ldrsh r2, [r5, r1]
	mov r1, sl
	adds r1, #0x4e
	movs r3, #0
	ldrsh r1, [r1, r3]
	adds r2, r2, r1
	ldrb r1, [r5, #1]
	lsls r1, r1, #2
	add r1, sp
	adds r1, #4
	ldr r3, [r1]
	mov r1, sl
	adds r1, #0x4c
	ldrh r1, [r1]
	str r1, [sp]
	adds r1, r6, #0
	bl PutSpriteExt
_080ADB58:
	ldr r4, [sp, #0x28]
	adds r4, #8
	str r4, [sp, #0x28]
	adds r5, #8
	ldr r7, [sp, #0x24]
	subs r7, #1
	str r7, [sp, #0x24]
	cmp r7, #0
	blt _080ADB6C
	b _080ADA72
_080ADB6C:
	add sp, #0x30
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80ADA3C

	THUMB_FUNC_START StartSmallBrownNameBoxes
StartSmallBrownNameBoxes: @ 0x080ADB7C
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	mov r9, r0
	adds r4, r1, #0
	mov r8, r2
	adds r5, r3, #0
	ldr r6, [sp, #0x1c]
	ldr r7, [sp, #0x20]
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	lsls r6, r6, #0x10
	lsrs r6, r6, #0x10
	bl EndSmallBrownNameBoxes
	ldr r0, _080ADBEC  @ gUnknown_08A20D6C
	adds r1, r7, #0
	bl Proc_Start
	adds r7, r0, #0
	ldr r0, _080ADBF0  @ gUnknown_08A1B0D8
	ldr r2, _080ADBF4  @ 0x06010000
	adds r1, r4, r2
	bl Decompress
	ldr r0, _080ADBF8  @ gUnknown_08A1B154
	mov r1, r8
	adds r1, #0x10
	lsls r1, r1, #5
	movs r2, #0x20
	bl CopyToPaletteBuffer
	lsls r4, r4, #0xf
	lsrs r4, r4, #0x14
	movs r0, #0xf
	mov r1, r8
	ands r0, r1
	lsls r0, r0, #0xc
	adds r4, r4, r0
	adds r5, r5, r4
	adds r0, r7, #0
	adds r0, #0x4c
	strh r5, [r0]
	adds r0, #2
	strh r6, [r0]
	adds r0, #2
	mov r2, r9
	strb r2, [r0]
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080ADBEC: .4byte gUnknown_08A20D6C
_080ADBF0: .4byte gUnknown_08A1B0D8
_080ADBF4: .4byte 0x06010000
_080ADBF8: .4byte gUnknown_08A1B154

	THUMB_FUNC_END StartSmallBrownNameBoxes

	THUMB_FUNC_START SmallBrownNameBoxDoSomeConfig
SmallBrownNameBoxDoSomeConfig: @ 0x080ADBFC
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	mov r8, r3
	ldr r0, _080ADC3C  @ gUnknown_08A20D6C
	bl Proc_Find
	lsls r4, r4, #3
	adds r0, r0, r4
	adds r2, r0, #0
	adds r2, #0x2c
	movs r1, #1
	strb r1, [r2]
	ldr r2, _080ADC40  @ 0x000001FF
	adds r1, r2, #0
	ands r5, r1
	strh r5, [r0, #0x2e]
	movs r1, #0xff
	ands r6, r1
	strh r6, [r0, #0x30]
	adds r0, #0x2d
	mov r1, r8
	strb r1, [r0]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080ADC3C: .4byte gUnknown_08A20D6C
_080ADC40: .4byte 0x000001FF

	THUMB_FUNC_END SmallBrownNameBoxDoSomeConfig

	THUMB_FUNC_START sub_80ADC44
sub_80ADC44: @ 0x080ADC44
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080ADC64  @ gUnknown_08A20D6C
	bl Proc_Find
	adds r1, r0, #0
	cmp r1, #0
	beq _080ADC5E
	lsls r0, r4, #3
	adds r0, r1, r0
	adds r0, #0x2c
	movs r1, #0
	strb r1, [r0]
_080ADC5E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080ADC64: .4byte gUnknown_08A20D6C

	THUMB_FUNC_END sub_80ADC44

	THUMB_FUNC_START sub_80ADC68
sub_80ADC68: @ 0x080ADC68
	push {r4, r5, lr}
	adds r4, r0, #0
	lsls r1, r1, #0x18
	lsrs r5, r1, #0x18
	ldr r0, _080ADC8C  @ gUnknown_08A20D6C
	bl Proc_Find
	adds r1, r0, #0
	cmp r1, #0
	beq _080ADC84
	lsls r0, r4, #3
	adds r0, r1, r0
	adds r0, #0x32
	strb r5, [r0]
_080ADC84:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080ADC8C: .4byte gUnknown_08A20D6C

	THUMB_FUNC_END sub_80ADC68

	THUMB_FUNC_START EndSmallBrownNameBoxes
EndSmallBrownNameBoxes: @ 0x080ADC90
	push {lr}
	ldr r0, _080ADCA0  @ gUnknown_08A20D6C
	bl Proc_Find
	bl Proc_End
	pop {r0}
	bx r0
	.align 2, 0
_080ADCA0: .4byte gUnknown_08A20D6C

	THUMB_FUNC_END EndSmallBrownNameBoxes

	THUMB_FUNC_START sub_80ADCA4
sub_80ADCA4: @ 0x080ADCA4
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	bl SetTextFont
	adds r2, r4, #0
	adds r2, #0x5a
	adds r1, r4, #0
	adds r1, #0x5c
	ldrh r0, [r2]
	ldrh r1, [r1]
	cmp r0, r1
	bne _080ADCC2
	movs r0, #0
	strh r0, [r2]
_080ADCC2:
	ldrh r0, [r2]
	adds r7, r2, #0
	cmp r0, #0
	bne _080ADD10
	movs r6, #0
	adds r5, r4, #0
	adds r5, #0x5e
	b _080ADCFC
_080ADCD2:
	ldrb r0, [r1]
	cmp r0, #1
	bne _080ADCE8
	adds r0, r4, #0
	adds r0, #0x58
	ldrb r1, [r0]
	adds r1, #1
	strb r1, [r0]
	ldr r0, [r4, #0x54]
	adds r0, #1
	b _080ADCF8
_080ADCE8:
	adds r0, r4, #0
	adds r0, #0x58
	ldrb r0, [r0]
	lsls r0, r0, #3
	adds r0, #0x44
	adds r0, r4, r0
	bl Text_DrawCharacter
_080ADCF8:
	str r0, [r4, #0x54]
	adds r6, #1
_080ADCFC:
	ldrh r0, [r5]
	cmp r6, r0
	bge _080ADD10
	ldr r1, [r4, #0x54]
	ldrb r0, [r1]
	cmp r0, #0
	bne _080ADCD2
	adds r0, r4, #0
	bl Proc_Break
_080ADD10:
	ldrh r0, [r7]
	adds r0, #1
	strh r0, [r7]
	movs r0, #0
	bl SetTextFont
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80ADCA4

	THUMB_FUNC_START sub_80ADD24
sub_80ADD24: @ 0x080ADD24
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	adds r7, r0, #0
	mov r9, r1
	mov r8, r2
	adds r5, r3, #0
	ldr r4, _080ADDC8  @ gUnknown_08A20D8C
	adds r0, r4, #0
	bl Proc_Find
	adds r6, r0, #0
	cmp r6, #0
	bne _080ADD4C
	adds r0, r4, #0
	ldr r1, [sp, #0x24]
	bl Proc_StartBlocking
	adds r6, r0, #0
_080ADD4C:
	adds r0, r6, #0
	adds r0, #0x2c
	ldr r2, _080ADDCC  @ 0x06010000
	adds r1, r7, r2
	mov r2, r9
	bl InitSpriteTextFont
	mov r0, r8
	str r0, [r6, #0x54]
	adds r0, r6, #0
	adds r0, #0x58
	movs r1, #0
	strb r1, [r0]
	adds r0, #1
	strb r5, [r0]
	adds r0, #1
	strh r1, [r0]
	adds r1, r6, #0
	adds r1, #0x5c
	ldr r0, [sp, #0x1c]
	strh r0, [r1]
	adds r1, #2
	ldr r0, [sp, #0x20]
	strh r0, [r1]
	mov r7, r9
	adds r7, #0x10
	cmp r5, #0
	ble _080ADD9E
	adds r4, r6, #0
	adds r4, #0x44
_080ADD88:
	adds r0, r4, #0
	bl InitSpriteText
	adds r0, r4, #0
	movs r1, #0
	bl SpriteText_DrawBackgroundExt
	adds r4, #8
	subs r5, #1
	cmp r5, #0
	bne _080ADD88
_080ADD9E:
	ldr r0, _080ADDD0  @ Pal_Text
	lsls r1, r7, #5
	movs r2, #0x20
	bl CopyToPaletteBuffer
	movs r0, #0
	bl SetTextFontGlyphs
	movs r0, #0
	bl SetTextFont
	adds r0, r6, #0
	movs r1, #0
	bl Proc_Goto
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080ADDC8: .4byte gUnknown_08A20D8C
_080ADDCC: .4byte 0x06010000
_080ADDD0: .4byte Pal_Text

	THUMB_FUNC_END sub_80ADD24

	THUMB_FUNC_START EndAllProcChildren
EndAllProcChildren: @ 0x080ADDD4
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r4, #0
	b _080ADDE2
_080ADDDC:
	adds r0, r4, #0
	bl Proc_End
_080ADDE2:
	adds r0, r4, #0
	adds r1, r5, #0
	bl Proc_FindAfterWithParent
	adds r4, r0, #0
	cmp r4, #0
	bne _080ADDDC
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END EndAllProcChildren

	THUMB_FUNC_START sub_80ADDF8
sub_80ADDF8: @ 0x080ADDF8
	bx lr

	THUMB_FUNC_END sub_80ADDF8

	THUMB_FUNC_START sub_80ADDFC
sub_80ADDFC: @ 0x080ADDFC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x14
	ldr r4, [sp, #0x2c]
	ldr r5, [sp, #0x30]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	lsls r1, r1, #0x10
	lsrs r7, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r1, r2, #0x10
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	lsls r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r6, r5, #0x10
	lsrs r2, r4, #0x10
	asrs r4, r4, #0x10
	cmp r4, #4
	bgt _080ADE2A
	movs r2, #4
_080ADE2A:
	lsls r0, r6, #0x10
	asrs r0, r0, #0x10
	cmp r0, #4
	bgt _080ADE34
	movs r6, #4
_080ADE34:
	lsls r0, r1, #0x10
	asrs r0, r0, #8
	str r0, [sp]
	lsls r0, r3, #0x10
	asrs r0, r0, #8
	str r0, [sp, #4]
	mov r0, sp
	movs r1, #0
	strh r1, [r0, #8]
	strh r1, [r0, #0xa]
	mov r5, sp
	lsls r1, r2, #0x10
	asrs r1, r1, #0x10
	movs r4, #0x80
	lsls r4, r4, #9
	adds r0, r4, #0
	bl __divsi3
	strh r0, [r5, #0xc]
	mov r5, sp
	lsls r1, r6, #0x10
	asrs r1, r1, #0x10
	adds r0, r4, #0
	bl __divsi3
	strh r0, [r5, #0xe]
	mov r1, sp
	lsls r0, r7, #4
	strh r0, [r1, #0x10]
	ldr r1, _080ADE8C  @ gUnknown_030030D8
	mov r0, r8
	cmp r0, #2
	bne _080ADE78
	subs r1, #0x10
_080ADE78:
	mov r0, sp
	movs r2, #1
	bl BgAffineSet
	add sp, #0x14
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080ADE8C: .4byte gUnknown_030030D8

	THUMB_FUNC_END sub_80ADDFC

	THUMB_FUNC_START sub_80ADE90
sub_80ADE90: @ 0x080ADE90
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r3, #0
	cmp r0, #2
	bne _080ADEA6
	ldr r3, _080ADEDC  @ gOpAnimBgAffineDstData
_080ADEA6:
	movs r4, #2
	ldrsh r0, [r3, r4]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	muls r0, r1, r0
	asrs r0, r0, #8
	strh r0, [r3, #2]
	movs r4, #6
	ldrsh r0, [r3, r4]
	muls r0, r1, r0
	asrs r0, r0, #8
	strh r0, [r3, #6]
	movs r1, #0
	ldrsh r0, [r3, r1]
	lsls r1, r2, #0x10
	asrs r1, r1, #0x10
	muls r0, r1, r0
	asrs r0, r0, #8
	strh r0, [r3]
	movs r2, #4
	ldrsh r0, [r3, r2]
	muls r0, r1, r0
	asrs r0, r0, #8
	strh r0, [r3, #4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080ADEDC: .4byte gOpAnimBgAffineDstData

	THUMB_FUNC_END sub_80ADE90

	THUMB_FUNC_START sub_80ADEE0
sub_80ADEE0: @ 0x080ADEE0
	push {r4, r5, r6, r7, lr}
	ldr r4, [sp, #0x14]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	lsls r3, r3, #0x10
	lsrs r5, r3, #0x10
	lsls r4, r4, #0x10
	lsrs r6, r4, #0x10
	movs r4, #0
	cmp r0, #2
	bne _080ADF00
	ldr r4, _080ADF44  @ gOpAnimBgAffineDstData
_080ADF00:
	movs r3, #0
	ldrsh r0, [r4, r3]
	lsls r3, r1, #0x10
	asrs r3, r3, #0x10
	negs r3, r3
	adds r1, r0, #0
	muls r1, r3, r1
	movs r7, #2
	ldrsh r0, [r4, r7]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	negs r2, r2
	muls r0, r2, r0
	adds r1, r1, r0
	lsls r0, r5, #0x10
	asrs r0, r0, #8
	adds r1, r1, r0
	str r1, [r4, #8]
	movs r1, #4
	ldrsh r0, [r4, r1]
	adds r1, r0, #0
	muls r1, r3, r1
	movs r3, #6
	ldrsh r0, [r4, r3]
	muls r0, r2, r0
	adds r1, r1, r0
	lsls r0, r6, #0x10
	asrs r0, r0, #8
	adds r1, r1, r0
	str r1, [r4, #0xc]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080ADF44: .4byte gOpAnimBgAffineDstData

	THUMB_FUNC_END sub_80ADEE0

	THUMB_FUNC_START sub_80ADF48
sub_80ADF48: @ 0x080ADF48
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x14
	mov r8, r1
	adds r1, r2, #0
	ldr r2, [sp, #0x2c]
	ldr r6, [sp, #0x30]
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	movs r0, #0x80
	lsls r0, r0, #3
	cmp r2, r0
	bgt _080ADF66
	adds r2, r0, #0
_080ADF66:
	cmp r6, r0
	bgt _080ADF6C
	adds r6, r0, #0
_080ADF6C:
	str r1, [sp]
	str r3, [sp, #4]
	mov r0, sp
	movs r1, #0
	strh r1, [r0, #8]
	strh r1, [r0, #0xa]
	mov r5, sp
	movs r4, #0x80
	lsls r4, r4, #0x11
	adds r0, r4, #0
	adds r1, r2, #0
	bl __divsi3
	strh r0, [r5, #0xc]
	mov r5, sp
	adds r0, r4, #0
	adds r1, r6, #0
	bl __divsi3
	strh r0, [r5, #0xe]
	mov r1, sp
	mov r2, r8
	asrs r0, r2, #4
	strh r0, [r1, #0x10]
	ldr r1, _080ADFB8  @ gUnknown_030030D8
	cmp r7, #2
	bne _080ADFA4
	subs r1, #0x10
_080ADFA4:
	mov r0, sp
	movs r2, #1
	bl BgAffineSet
	add sp, #0x14
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080ADFB8: .4byte gUnknown_030030D8

	THUMB_FUNC_END sub_80ADF48

	THUMB_FUNC_START sub_80ADFBC
sub_80ADFBC: @ 0x080ADFBC
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r3, #0
	cmp r0, #2
	bne _080ADFCA
	ldr r3, _080ADFF8  @ gOpAnimBgAffineDstData
_080ADFCA:
	movs r4, #2
	ldrsh r0, [r3, r4]
	muls r0, r1, r0
	asrs r0, r0, #0x10
	strh r0, [r3, #2]
	movs r4, #6
	ldrsh r0, [r3, r4]
	muls r0, r1, r0
	asrs r0, r0, #0x10
	strh r0, [r3, #6]
	movs r1, #0
	ldrsh r0, [r3, r1]
	muls r0, r2, r0
	asrs r0, r0, #0x10
	strh r0, [r3]
	movs r4, #4
	ldrsh r0, [r3, r4]
	muls r0, r2, r0
	asrs r0, r0, #0x10
	strh r0, [r3, #4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080ADFF8: .4byte gOpAnimBgAffineDstData

	THUMB_FUNC_END sub_80ADFBC

	THUMB_FUNC_START sub_80ADFFC
sub_80ADFFC: @ 0x080ADFFC
	push {r4, r5, r6, lr}
	adds r5, r3, #0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r4, #0
	cmp r0, #2
	bne _080AE00C
	ldr r4, _080AE040  @ gOpAnimBgAffineDstData
_080AE00C:
	movs r3, #0
	ldrsh r0, [r4, r3]
	negs r3, r1
	muls r0, r3, r0
	movs r6, #2
	ldrsh r1, [r4, r6]
	negs r2, r2
	muls r1, r2, r1
	adds r0, r0, r1
	asrs r0, r0, #8
	adds r0, r0, r5
	str r0, [r4, #8]
	movs r1, #4
	ldrsh r0, [r4, r1]
	muls r0, r3, r0
	movs r3, #6
	ldrsh r1, [r4, r3]
	muls r1, r2, r1
	adds r0, r0, r1
	asrs r0, r0, #8
	ldr r1, [sp, #0x10]
	adds r0, r0, r1
	str r0, [r4, #0xc]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080AE040: .4byte gOpAnimBgAffineDstData

	THUMB_FUNC_END sub_80ADFFC

	THUMB_FUNC_START sub_80AE044
sub_80AE044: @ 0x080AE044
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	adds r7, r1, #0
	mov ip, r2
	mov r9, r3
	ldr r2, [sp, #0x20]
	ldr r4, [sp, #0x28]
	ldr r3, [sp, #0x2c]
	ldrh r1, [r7]
	lsrs r1, r1, #1
	mov r8, r1
	movs r1, #0x78
	mov sl, r1
	adds r6, r7, #4
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #0xd
	movs r0, #0xc0
	lsls r0, r0, #0x13
	adds r5, r1, r0
	cmp r4, #0
	beq _080AE0DC
	cmp r3, #0
	beq _080AE0DC
	movs r0, #1
	negs r0, r0
	cmp r4, r0
	bne _080AE086
	ldrh r4, [r7]
	ldrh r3, [r7, #2]
_080AE086:
	mov r1, ip
	asrs r1, r1, #1
	mov ip, r1
	asrs r2, r2, #1
	asrs r4, r4, #1
	lsls r4, r4, #1
	ldr r0, [sp, #0x24]
	mov r1, r8
	muls r1, r0, r1
	adds r0, r1, #0
	lsls r0, r0, #1
	adds r0, r6, r0
	lsls r1, r2, #1
	adds r6, r0, r1
	mov r2, sl
	mov r0, r9
	muls r0, r2, r0
	lsls r0, r0, #1
	adds r0, r5, r0
	mov r2, ip
	lsls r1, r2, #1
	adds r5, r0, r1
	cmp r3, #0
	ble _080AE0DC
	asrs r7, r4, #1
	adds r4, r3, #0
	ldr r0, _080AE0EC  @ 0x001FFFFF
	mov r9, r0
_080AE0BE:
	adds r0, r6, #0
	adds r1, r5, #0
	mov r2, r9
	ands r2, r7
	bl CpuSet
	mov r1, r8
	lsls r0, r1, #1
	adds r6, r6, r0
	mov r2, sl
	lsls r0, r2, #1
	adds r5, r5, r0
	subs r4, #1
	cmp r4, #0
	bne _080AE0BE
_080AE0DC:
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080AE0EC: .4byte 0x001FFFFF

	THUMB_FUNC_END sub_80AE044

	THUMB_FUNC_START sub_80AE0F0
sub_80AE0F0: @ 0x080AE0F0
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r4, r1, #0
	ldr r6, [sp, #0x20]
	ldr r1, [sp, #0x24]
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov r9, r1
	movs r1, #0x78
	mov r8, r1
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #0xd
	movs r0, #0xc0
	lsls r0, r0, #0x13
	adds r5, r1, r0
	cmp r3, #0
	beq _080AE15A
	cmp r6, #0
	beq _080AE15A
	asrs r4, r4, #1
	asrs r3, r3, #1
	lsls r3, r3, #1
	mov r0, r8
	muls r0, r2, r0
	lsls r0, r0, #1
	adds r0, r5, r0
	lsls r1, r4, #1
	adds r5, r0, r1
	cmp r6, #0
	ble _080AE15A
	adds r4, r6, #0
	lsls r0, r3, #0xa
	lsrs r6, r0, #0xb
	movs r7, #0x80
	lsls r7, r7, #0x11
_080AE13E:
	mov r0, sp
	mov r1, r9
	strh r1, [r0]
	adds r1, r5, #0
	adds r2, r6, #0
	orrs r2, r7
	bl CpuSet
	mov r1, r8
	lsls r0, r1, #1
	adds r5, r5, r0
	subs r4, #1
	cmp r4, #0
	bne _080AE13E
_080AE15A:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80AE0F0

	THUMB_FUNC_START sub_80AE168
sub_80AE168: @ 0x080AE168
	push {r4, lr}
	movs r3, #0x1f
	ands r1, r3
	ands r2, r3
	ldr r4, _080AE188  @ gPaletteBuffer
	lsls r2, r2, #0xa
	lsls r1, r1, #5
	adds r2, r2, r1
	ands r3, r0
	adds r2, r2, r3
	strh r2, [r4]
	bl EnablePaletteSync
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080AE188: .4byte gPaletteBuffer

	THUMB_FUNC_END sub_80AE168

	THUMB_FUNC_START FadeInOut_Init
FadeInOut_Init: @ 0x080AE18C
	push {r4, lr}
	adds r4, r0, #0
	bl ArchiveCurrentPalettes
	movs r0, #0
	str r0, [r4, #0x2c]
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END FadeInOut_Init

	THUMB_FUNC_START FadeIn_Loop
FadeIn_Loop: @ 0x080AE1A0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x2c]
	ldr r1, [r4, #0x30]
	adds r1, r0, r1
	str r1, [r4, #0x2c]
	adds r0, r4, #0
	adds r0, #0x29
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _080AE1C4
	lsls r1, r1, #1
	movs r0, #0x80
	lsls r0, r0, #2
	subs r2, r0, r1
	b _080AE1C6
_080AE1C4:
	lsls r2, r1, #1
_080AE1C6:
	ldr r3, [r4, #0x34]
	adds r0, r2, #0
	adds r1, r2, #0
	bl WriteFadedPaletteFromArchive
	ldr r2, _080AE1FC  @ gLCDControlBuffer
	ldrb r0, [r2, #1]
	movs r1, #1
	orrs r0, r1
	movs r1, #2
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2, #1]
	ldr r0, [r4, #0x2c]
	cmp r0, #0x80
	bne _080AE1F6
	adds r0, r4, #0
	bl Proc_Break
_080AE1F6:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080AE1FC: .4byte gLCDControlBuffer

	THUMB_FUNC_END FadeIn_Loop

	THUMB_FUNC_START FadeOut_Loop
FadeOut_Loop: @ 0x080AE200
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x2c]
	ldr r1, [r4, #0x30]
	adds r1, r0, r1
	str r1, [r4, #0x2c]
	adds r0, r4, #0
	adds r0, #0x29
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _080AE224
	lsls r0, r1, #1
	movs r1, #0x80
	lsls r1, r1, #1
	adds r2, r0, r1
	b _080AE22C
_080AE224:
	lsls r1, r1, #1
	movs r0, #0x80
	lsls r0, r0, #1
	subs r2, r0, r1
_080AE22C:
	ldr r3, [r4, #0x34]
	adds r0, r2, #0
	adds r1, r2, #0
	bl WriteFadedPaletteFromArchive
	ldr r0, [r4, #0x2c]
	cmp r0, #0x80
	bne _080AE242
	adds r0, r4, #0
	bl Proc_Break
_080AE242:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END FadeOut_Loop

	THUMB_FUNC_START FadeInOut_DisableGfx
FadeInOut_DisableGfx: @ 0x080AE248
	push {lr}
	ldr r1, [r0, #0x34]
	ldr r0, _080AE270  @ 0x0000FFFF
	cmp r1, r0
	bne _080AE278
	ldr r2, _080AE274  @ gLCDControlBuffer
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
	b _080AE294
	.align 2, 0
_080AE270: .4byte 0x0000FFFF
_080AE274: .4byte gLCDControlBuffer
_080AE278:
	ldr r2, _080AE29C  @ gLCDControlBuffer
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
	subs r1, #8
	ands r0, r1
_080AE294:
	strb r0, [r2, #1]
	pop {r0}
	bx r0
	.align 2, 0
_080AE29C: .4byte gLCDControlBuffer

	THUMB_FUNC_END FadeInOut_DisableGfx

	THUMB_FUNC_START FadeInExists
FadeInExists: @ 0x080AE2A0
	push {lr}
	ldr r0, _080AE2B4  @ gUnknown_08A20DA4
	bl Proc_Find
	cmp r0, #0
	beq _080AE2AE
	movs r0, #1
_080AE2AE:
	pop {r1}
	bx r1
	.align 2, 0
_080AE2B4: .4byte gUnknown_08A20DA4

	THUMB_FUNC_END FadeInExists

	THUMB_FUNC_START FadeOutExists
FadeOutExists: @ 0x080AE2B8
	push {lr}
	ldr r0, _080AE2CC  @ gUnknown_08A20DCC
	bl Proc_Find
	cmp r0, #0
	beq _080AE2C6
	movs r0, #1
_080AE2C6:
	pop {r1}
	bx r1
	.align 2, 0
_080AE2CC: .4byte gUnknown_08A20DCC

	THUMB_FUNC_END FadeOutExists

	THUMB_FUNC_START NewFadeIn
NewFadeIn: @ 0x080AE2D0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080AE2F0  @ gUnknown_08A20DA4
	movs r1, #4
	bl Proc_Start
	adds r2, r0, #0
	adds r2, #0x29
	movs r1, #0
	strb r1, [r2]
	str r4, [r0, #0x30]
	subs r1, #1
	str r1, [r0, #0x34]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080AE2F0: .4byte gUnknown_08A20DA4

	THUMB_FUNC_END NewFadeIn

	THUMB_FUNC_START NewFadeOut
NewFadeOut: @ 0x080AE2F4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080AE314  @ gUnknown_08A20DCC
	movs r1, #4
	bl Proc_Start
	adds r2, r0, #0
	adds r2, #0x29
	movs r1, #0
	strb r1, [r2]
	str r4, [r0, #0x30]
	subs r1, #1
	str r1, [r0, #0x34]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080AE314: .4byte gUnknown_08A20DCC

	THUMB_FUNC_END NewFadeOut

	THUMB_FUNC_START sub_80AE318
sub_80AE318: @ 0x080AE318
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080AE338  @ gUnknown_08A20DA4
	bl Proc_StartBlocking
	adds r2, r0, #0
	adds r2, #0x29
	movs r1, #0
	strb r1, [r2]
	str r4, [r0, #0x30]
	subs r1, #1
	str r1, [r0, #0x34]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080AE338: .4byte gUnknown_08A20DA4

	THUMB_FUNC_END sub_80AE318

	THUMB_FUNC_START sub_80AE33C
sub_80AE33C: @ 0x080AE33C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080AE35C  @ gUnknown_08A20DCC
	bl Proc_StartBlocking
	adds r2, r0, #0
	adds r2, #0x29
	movs r1, #0
	strb r1, [r2]
	str r4, [r0, #0x30]
	subs r1, #1
	str r1, [r0, #0x34]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080AE35C: .4byte gUnknown_08A20DCC

	THUMB_FUNC_END sub_80AE33C

	THUMB_FUNC_START sub_80AE360
sub_80AE360: @ 0x080AE360
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080AE380  @ gUnknown_08A20DA4
	movs r1, #4
	bl Proc_Start
	adds r2, r0, #0
	adds r2, #0x29
	movs r1, #0
	strb r1, [r2]
	str r4, [r0, #0x30]
	ldr r1, _080AE384  @ 0x0000FFFF
	str r1, [r0, #0x34]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080AE380: .4byte gUnknown_08A20DA4
_080AE384: .4byte 0x0000FFFF

	THUMB_FUNC_END sub_80AE360

	THUMB_FUNC_START sub_80AE388
sub_80AE388: @ 0x080AE388
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080AE3A8  @ gUnknown_08A20DCC
	movs r1, #4
	bl Proc_Start
	adds r2, r0, #0
	adds r2, #0x29
	movs r1, #0
	strb r1, [r2]
	str r4, [r0, #0x30]
	ldr r1, _080AE3AC  @ 0x0000FFFF
	str r1, [r0, #0x34]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080AE3A8: .4byte gUnknown_08A20DCC
_080AE3AC: .4byte 0x0000FFFF

	THUMB_FUNC_END sub_80AE388

	THUMB_FUNC_START sub_80AE3B0
sub_80AE3B0: @ 0x080AE3B0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080AE3D0  @ gUnknown_08A20DA4
	movs r1, #4
	bl Proc_Start
	adds r2, r0, #0
	adds r2, #0x29
	movs r1, #1
	strb r1, [r2]
	str r4, [r0, #0x30]
	subs r1, #2
	str r1, [r0, #0x34]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080AE3D0: .4byte gUnknown_08A20DA4

	THUMB_FUNC_END sub_80AE3B0

	THUMB_FUNC_START sub_80AE3D4
sub_80AE3D4: @ 0x080AE3D4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080AE3F4  @ gUnknown_08A20DCC
	movs r1, #4
	bl Proc_Start
	adds r2, r0, #0
	adds r2, #0x29
	movs r1, #1
	strb r1, [r2]
	str r4, [r0, #0x30]
	subs r1, #2
	str r1, [r0, #0x34]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080AE3F4: .4byte gUnknown_08A20DCC

	THUMB_FUNC_END sub_80AE3D4

	THUMB_FUNC_START sub_80AE3F8
sub_80AE3F8: @ 0x080AE3F8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080AE418  @ gUnknown_08A20DA4
	bl Proc_StartBlocking
	adds r2, r0, #0
	adds r2, #0x29
	movs r1, #1
	strb r1, [r2]
	str r4, [r0, #0x30]
	subs r1, #2
	str r1, [r0, #0x34]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080AE418: .4byte gUnknown_08A20DA4

	THUMB_FUNC_END sub_80AE3F8

	THUMB_FUNC_START sub_80AE41C
sub_80AE41C: @ 0x080AE41C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080AE43C  @ gUnknown_08A20DCC
	bl Proc_StartBlocking
	adds r2, r0, #0
	adds r2, #0x29
	movs r1, #1
	strb r1, [r2]
	str r4, [r0, #0x30]
	subs r1, #2
	str r1, [r0, #0x34]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080AE43C: .4byte gUnknown_08A20DCC

	THUMB_FUNC_END sub_80AE41C

	THUMB_FUNC_START sub_80AE440
sub_80AE440: @ 0x080AE440
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080AE460  @ gUnknown_08A20DA4
	movs r1, #4
	bl Proc_Start
	adds r2, r0, #0
	adds r2, #0x29
	movs r1, #1
	strb r1, [r2]
	str r4, [r0, #0x30]
	ldr r1, _080AE464  @ 0x0000FFFF
	str r1, [r0, #0x34]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080AE460: .4byte gUnknown_08A20DA4
_080AE464: .4byte 0x0000FFFF

	THUMB_FUNC_END sub_80AE440

	THUMB_FUNC_START sub_80AE468
sub_80AE468: @ 0x080AE468
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080AE488  @ gUnknown_08A20DCC
	movs r1, #4
	bl Proc_Start
	adds r2, r0, #0
	adds r2, #0x29
	movs r1, #1
	strb r1, [r2]
	str r4, [r0, #0x30]
	ldr r1, _080AE48C  @ 0x0000FFFF
	str r1, [r0, #0x34]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080AE488: .4byte gUnknown_08A20DCC
_080AE48C: .4byte 0x0000FFFF

	THUMB_FUNC_END sub_80AE468

	THUMB_FUNC_START sub_80AE490
sub_80AE490: @ 0x080AE490
	push {lr}
	sub sp, #4
	movs r0, #0
	str r0, [sp]
	ldr r1, _080AE4AC  @ gPaletteBuffer
	ldr r2, _080AE4B0  @ 0x01000100
	mov r0, sp
	bl CpuFastSet
	bl EnablePaletteSync
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_080AE4AC: .4byte gPaletteBuffer
_080AE4B0: .4byte 0x01000100

	THUMB_FUNC_END sub_80AE490

	THUMB_FUNC_START sub_80AE4B4
sub_80AE4B4: @ 0x080AE4B4
	push {lr}
	ldr r0, _080AE4D0  @ gUnknown_08A20DA4
	bl Proc_Find
	bl Proc_End
	ldr r0, _080AE4D4  @ gUnknown_08A20DCC
	bl Proc_Find
	bl Proc_End
	pop {r0}
	bx r0
	.align 2, 0
_080AE4D0: .4byte gUnknown_08A20DA4
_080AE4D4: .4byte gUnknown_08A20DCC

	THUMB_FUNC_END sub_80AE4B4

	THUMB_FUNC_START sub_80AE4D8
sub_80AE4D8: @ 0x080AE4D8
	adds r2, r0, #0
	movs r0, #0
	str r0, [r2, #0x2c]
	adds r1, r2, #0
	adds r1, #0x34
	strb r0, [r1]
	str r0, [r2, #0x3c]
	str r0, [r2, #0x44]
	str r0, [r2, #0x40]
	str r0, [r2, #0x48]
	adds r1, #3
	strb r0, [r1]
	adds r1, #1
	strb r0, [r1]
	str r0, [r2, #0x4c]
	str r0, [r2, #0x50]
	str r0, [r2, #0x58]
	adds r1, #1
	strb r0, [r1]
	str r0, [r2, #0x54]
	movs r1, #0
	strh r0, [r2, #0x30]
	strh r0, [r2, #0x32]
	adds r3, r2, #0
	adds r3, #0x3a
	movs r0, #1
	strb r0, [r3]
	adds r0, r2, #0
	adds r0, #0x36
	strb r1, [r0]
	bx lr

	THUMB_FUNC_END sub_80AE4D8

.align 2, 0
