
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
	ldr r0, _08097664  @ gUnknown_08A18808
	bl Proc_Find
	cmp r0, #0
	beq _0809765E
	movs r1, #1
	bl Proc_Goto
_0809765E:
	pop {r0}
	bx r0
	.align 2, 0
_08097664: .4byte gUnknown_08A18808

	THUMB_FUNC_END sub_809764C

	THUMB_FUNC_START sub_8097668
sub_8097668: @ 0x08097668
	push {lr}
	ldr r0, _08097680  @ gUnknown_08A18808
	bl Proc_Find
	cmp r0, #0
	beq _0809767A
	movs r1, #0
	bl Proc_Goto
_0809767A:
	pop {r0}
	bx r0
	.align 2, 0
_08097680: .4byte gUnknown_08A18808

	THUMB_FUNC_END sub_8097668

	THUMB_FUNC_START Delete6CMenuScroll
Delete6CMenuScroll: @ 0x08097684
	push {lr}
	ldr r0, _08097694  @ gUnknown_08A18808
	bl Proc_Find
	bl Proc_End
	pop {r0}
	bx r0
	.align 2, 0
_08097694: .4byte gUnknown_08A18808

	THUMB_FUNC_END Delete6CMenuScroll

	THUMB_FUNC_START Make6CMenuScroll
Make6CMenuScroll: @ 0x08097698
	push {lr}
	adds r1, r0, #0
	ldr r0, _080976A8  @ gUnknown_08A18808
	bl Proc_Start
	pop {r1}
	bx r1
	.align 2, 0
_080976A8: .4byte gUnknown_08A18808

	THUMB_FUNC_END Make6CMenuScroll

	THUMB_FUNC_START sub_80976AC
sub_80976AC: @ 0x080976AC
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _080976C8  @ gUnknown_08A18808
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
_080976C8: .4byte gUnknown_08A18808

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
	ldr r0, _080976FC  @ gUnknown_08A18808
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
_080976FC: .4byte gUnknown_08A18808

	THUMB_FUNC_END sub_80976CC

	THUMB_FUNC_START sub_8097700
sub_8097700: @ 0x08097700
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _08097738  @ gUnknown_08A19CAC
	adds r1, #0x10
	lsls r1, r1, #5
	movs r2, #0x20
	bl CopyToPaletteBuffer
	ldr r0, _0809773C  @ gUnknown_08A19C0C
	ldr r2, _08097740  @ 0x06010000
	adds r1, r4, r2
	bl CopyDataWithPossibleUncomp
	ldr r0, _08097744  @ gUnknown_08A18808
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
_08097738: .4byte gUnknown_08A19CAC
_0809773C: .4byte gUnknown_08A19C0C
_08097740: .4byte 0x06010000
_08097744: .4byte gUnknown_08A18808

	THUMB_FUNC_END sub_8097700

	THUMB_FUNC_START sub_8097748
sub_8097748: @ 0x08097748
	push {r4, r5, r6, lr}
	mov r6, r9
	mov r5, r8
	push {r5, r6}
	adds r4, r0, #0
	mov r8, r1
	mov r9, r2
	adds r5, r3, #0
	ldr r6, [sp, #0x18]
	ldr r0, _0809779C  @ gUnknown_08A18808
	adds r1, r4, #0
	bl Proc_Start
	adds r4, r0, #0
	mov r0, r8
	strh r0, [r4, #0x2a]
	adds r0, r4, #0
	adds r0, #0x2c
	mov r1, r9
	strb r1, [r0]
	ldr r0, _080977A0  @ gUnknown_08A19CAC
	adds r1, r6, #0
	adds r1, #0x10
	lsls r1, r1, #5
	movs r2, #0x20
	bl CopyToPaletteBuffer
	ldr r0, _080977A4  @ gUnknown_08A19C0C
	ldr r2, _080977A8  @ 0x06010000
	adds r1, r5, r2
	bl CopyDataWithPossibleUncomp
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
_0809779C: .4byte gUnknown_08A18808
_080977A0: .4byte gUnknown_08A19CAC
_080977A4: .4byte gUnknown_08A19C0C
_080977A8: .4byte 0x06010000

	THUMB_FUNC_END sub_8097748

	THUMB_FUNC_START sub_80977AC
sub_80977AC: @ 0x080977AC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	mov r8, r1
	adds r5, r2, #0
	adds r6, r3, #0
	ldr r7, [sp, #0x18]
	bl Text_Clear
	adds r0, r4, #0
	adds r1, r5, #0
	bl Text_SetColorId
	adds r0, r4, #0
	adds r1, r6, #0
	bl Text_SetXCursor
	adds r0, r4, #0
	adds r1, r7, #0
	bl Text_AppendString
	adds r0, r4, #0
	mov r1, r8
	bl Text_Draw
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80977AC

	THUMB_FUNC_START sub_80977EC
sub_80977EC: @ 0x080977EC
	push {r4, r5, lr}
	adds r3, r0, #0
	ldr r5, _08097800  @ gUnknown_02012F56
	ldrh r4, [r5]
	adds r2, r4, #0
	cmp r2, #0
	bne _08097804
	strb r2, [r3]
	strh r2, [r1]
	b _08097838
	.align 2, 0
_08097800: .4byte gUnknown_02012F56
_08097804:
	cmp r2, #7
	bhi _08097816
	ldrb r0, [r3]
	cmp r0, r2
	bcc _08097812
	subs r0, r4, #1
	strb r0, [r3]
_08097812:
	movs r0, #0
	b _08097836
_08097816:
	ldrh r0, [r1]
	lsrs r0, r0, #4
	adds r2, r0, #7
	ldrh r0, [r5]
	cmp r2, r0
	bge _0809782E
	ldrb r0, [r3]
	cmp r0, #6
	bne _08097838
	movs r0, #5
	strb r0, [r3]
	b _08097838
_0809782E:
	cmp r2, r0
	ble _08097838
	subs r0, #7
	lsls r0, r0, #4
_08097836:
	strh r0, [r1]
_08097838:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80977EC

	THUMB_FUNC_START sub_8097840
sub_8097840: @ 0x08097840
	push {lr}
	ldr r0, _0809785C  @ 0x04000006
	ldrh r0, [r0]
	adds r3, r0, #0
	cmp r3, #0xa0
	bne _08097864
	movs r3, #0
	ldr r0, _08097860  @ gUnknown_02013458
	ldr r2, [r0]
	ldr r1, [r0, #4]
	str r1, [r0]
	str r2, [r0, #4]
	b _0809786C
	.align 2, 0
_0809785C: .4byte 0x04000006
_08097860: .4byte gUnknown_02013458
_08097864:
	ldr r0, _08097884  @ gUnknown_02013458
	cmp r3, #0xa0
	bls _0809786C
	movs r3, #0
_0809786C:
	ldr r2, _08097888  @ 0x04000042
	ldr r1, [r0]
	lsls r0, r3, #2
	adds r0, r0, r1
	ldrb r1, [r0]
	lsls r1, r1, #8
	ldrb r0, [r0, #1]
	orrs r0, r1
	strh r0, [r2]
	pop {r0}
	bx r0
	.align 2, 0
_08097884: .4byte gUnknown_02013458
_08097888: .4byte 0x04000042

	THUMB_FUNC_END sub_8097840

	THUMB_FUNC_START sub_809788C
sub_809788C: @ 0x0809788C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	adds r4, r0, #0
	ldr r2, _08097908  @ gLCDControlBuffer
	ldrb r1, [r2, #1]
	movs r0, #0x21
	negs r0, r0
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r2, #1]
	adds r0, r4, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	mov ip, r2
	cmp r0, #0
	bge _08097918
	movs r0, #0x96
	str r0, [r4, #0x2c]
	movs r3, #0
	ldr r0, _0809790C  @ gUnknown_02012F58
	mov r9, r0
	adds r4, #0x29
	mov r8, r4
	ldr r1, _08097910  @ gUnknown_02013458
	mov sl, r1
	mov r7, r9
	movs r4, #0
	movs r2, #0xf0
	movs r6, #0xa0
	lsls r6, r6, #2
	ldr r5, _08097914  @ 0x00000281
_080978DA:
	lsls r0, r3, #2
	adds r0, r0, r7
	strb r4, [r0]
	strb r2, [r0, #1]
	adds r1, r0, r6
	strb r4, [r1]
	adds r0, r0, r5
	strb r2, [r0]
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #0x9f
	bls _080978DA
	mov r1, ip
	adds r1, #0x2f
	movs r0, #0
	strb r0, [r1]
	adds r1, #4
	strb r0, [r1]
	subs r1, #5
	movs r0, #0xf0
	b _08097960
	.align 2, 0
_08097908: .4byte gLCDControlBuffer
_0809790C: .4byte gUnknown_02012F58
_08097910: .4byte gUnknown_02013458
_08097914: .4byte 0x00000281
_08097918:
	movs r0, #0
	str r0, [r4, #0x2c]
	movs r3, #0
	ldr r0, _080979CC  @ gUnknown_02012F58
	mov r9, r0
	adds r4, #0x29
	mov r8, r4
	ldr r1, _080979D0  @ gUnknown_02013458
	mov sl, r1
	mov r6, r9
	movs r2, #0x78
	movs r5, #0xa0
	lsls r5, r5, #2
	ldr r4, _080979D4  @ 0x00000281
_08097934:
	lsls r0, r3, #2
	adds r0, r0, r6
	strb r2, [r0]
	strb r2, [r0, #1]
	adds r1, r0, r5
	strb r2, [r1]
	adds r0, r0, r4
	strb r2, [r0]
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #0x9f
	bls _08097934
	mov r2, ip
	adds r2, #0x2f
	movs r1, #0
	movs r0, #0x78
	strb r0, [r2]
	adds r2, #4
	strb r1, [r2]
	mov r1, ip
	adds r1, #0x2e
_08097960:
	strb r0, [r1]
	adds r1, #4
	movs r0, #0xa0
	strb r0, [r1]
	mov r2, ip
	adds r2, #0x35
	ldrb r0, [r2]
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
	strb r0, [r2]
	adds r2, #1
	ldrb r1, [r2]
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
	strb r0, [r2]
	movs r0, #0
	mov r1, r8
	strb r0, [r1]
	mov r0, r9
	mov r1, sl
	str r0, [r1]
	movs r0, #0xa0
	lsls r0, r0, #2
	add r0, r9
	str r0, [r1, #4]
	ldr r0, _080979D8  @ sub_8097840
	bl SetPrimaryHBlankHandler
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080979CC: .4byte gUnknown_02012F58
_080979D0: .4byte gUnknown_02013458
_080979D4: .4byte 0x00000281
_080979D8: .4byte sub_8097840

	THUMB_FUNC_END sub_809788C

	THUMB_FUNC_START sub_80979DC
sub_80979DC: @ 0x080979DC
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	adds r6, r0, #0
	adds r0, #0x2a
	movs r1, #0
	ldrsb r1, [r0, r1]
	ldr r0, [r6, #0x2c]
	adds r0, r0, r1
	str r0, [r6, #0x2c]
	cmp r0, #0x96
	ble _080979FA
	movs r0, #0x96
	str r0, [r6, #0x2c]
_080979FA:
	ldr r0, [r6, #0x2c]
	cmp r0, #0
	bge _08097A04
	movs r0, #0
	str r0, [r6, #0x2c]
_08097A04:
	movs r1, #0
	movs r0, #0x29
	adds r0, r0, r6
	mov r9, r0
	ldr r7, _08097A44  @ gUnknown_02013458
	movs r2, #0x78
	mov r8, r2
_08097A12:
	ldr r0, [r6, #0x2c]
	lsls r5, r1, #0x10
	cmp r0, #0
	ble _08097A32
	adds r4, r0, #0
	muls r4, r0, r4
	adds r0, r4, #0
	asrs r4, r5, #0x10
	adds r1, r4, #0
	subs r1, #0x50
	adds r2, r1, #0
	muls r2, r1, r2
	adds r1, r2, #0
	subs r0, r0, r1
	cmp r0, #0
	bge _08097A48
_08097A32:
	ldr r0, [r7, #4]
	asrs r1, r5, #0xe
	adds r0, r1, r0
	mov r4, r8
	strb r4, [r0]
	ldr r0, [r7, #4]
	adds r1, r1, r0
	strb r4, [r1, #1]
	b _08097A6E
	.align 2, 0
_08097A44: .4byte gUnknown_02013458
_08097A48:
	bl Sqrt
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x78
	ble _08097A58
	movs r3, #0x78
_08097A58:
	ldr r1, [r7, #4]
	lsls r2, r4, #2
	adds r1, r2, r1
	mov r4, r8
	subs r0, r4, r3
	strb r0, [r1]
	ldr r0, [r7, #4]
	adds r2, r2, r0
	adds r0, r3, #0
	adds r0, #0x78
	strb r0, [r2, #1]
_08097A6E:
	movs r1, #0x80
	lsls r1, r1, #9
	adds r0, r5, r1
	lsrs r1, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x9f
	ble _08097A12
	mov r2, r9
	ldrb r0, [r2]
	adds r0, #1
	strb r0, [r2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x28
	bne _08097A92
	adds r0, r6, #0
	bl Proc_Break
_08097A92:
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80979DC

	THUMB_FUNC_START sub_8097AA0
sub_8097AA0: @ 0x08097AA0
	push {lr}
	movs r0, #0
	bl SetPrimaryHBlankHandler
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8097AA0

	THUMB_FUNC_START sub_8097AAC
sub_8097AAC: @ 0x08097AAC
	push {r4, lr}
	adds r2, r0, #0
	lsls r4, r1, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _08097AC8  @ gUnknown_08A18840
	adds r1, r2, #0
	bl Proc_StartBlocking
	adds r1, r0, #0
	adds r1, #0x2a
	strb r4, [r1]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08097AC8: .4byte gUnknown_08A18840

	THUMB_FUNC_END sub_8097AAC

	THUMB_FUNC_START sub_8097ACC
sub_8097ACC: @ 0x08097ACC
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	adds r1, r0, #0
	adds r1, #0x29
	movs r7, #0
	strb r7, [r1]
	ldr r1, _08097B6C  @ gLCDControlBuffer
	mov ip, r1
	ldrb r1, [r1, #1]
	movs r2, #1
	mov r8, r2
	mov r6, r8
	orrs r1, r6
	movs r2, #2
	mov r9, r2
	mov r6, r9
	orrs r1, r6
	movs r5, #4
	orrs r1, r5
	movs r4, #8
	orrs r1, r4
	movs r3, #0x10
	orrs r1, r3
	movs r2, #0x21
	negs r2, r2
	ands r1, r2
	movs r2, #0x40
	orrs r1, r2
	movs r2, #0x7f
	ands r1, r2
	mov r2, ip
	strb r1, [r2, #1]
	adds r2, #0x35
	ldrb r1, [r2]
	mov r6, r8
	orrs r1, r6
	mov r6, r9
	orrs r1, r6
	orrs r1, r5
	orrs r1, r4
	orrs r1, r3
	strb r1, [r2]
	mov r3, ip
	adds r3, #0x36
	ldrb r2, [r3]
	movs r1, #2
	negs r1, r1
	ands r1, r2
	movs r2, #3
	negs r2, r2
	ands r1, r2
	subs r2, #2
	ands r1, r2
	subs r2, #4
	ands r1, r2
	subs r2, #8
	ands r1, r2
	strb r1, [r3]
	adds r0, #0x2a
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	ble _08097B70
	mov r0, ip
	adds r0, #0x2f
	strb r7, [r0]
	adds r0, #4
	strb r7, [r0]
	mov r1, ip
	adds r1, #0x2e
	movs r0, #0xf0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0xa0
	strb r0, [r1]
	b _08097B8A
	.align 2, 0
_08097B6C: .4byte gLCDControlBuffer
_08097B70:
	mov r1, ip
	adds r1, #0x2f
	movs r0, #0x78
	strb r0, [r1]
	mov r2, ip
	adds r2, #0x33
	movs r1, #0x50
	strb r1, [r2]
	subs r2, #5
	strb r0, [r2]
	mov r0, ip
	adds r0, #0x32
	strb r1, [r0]
_08097B8A:
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8097ACC

	THUMB_FUNC_START sub_8097B98
sub_8097B98: @ 0x08097B98
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	adds r6, r0, #0
	adds r2, r6, #0
	adds r2, #0x29
	ldrb r0, [r2]
	adds r0, #1
	strb r0, [r2]
	ldr r4, _08097C18  @ gLCDControlBuffer
	ldrb r1, [r4, #1]
	movs r0, #0x21
	negs r0, r0
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r4, #1]
	ldrb r0, [r2]
	movs r1, #0xf
	subs r1, r1, r0
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #7
	muls r0, r1, r0
	movs r1, #0xe1
	bl __divsi3
	movs r1, #0xa0
	lsls r1, r1, #2
	subs r1, r1, r0
	asrs r5, r1, #4
	adds r0, r6, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	ble _08097C1C
	lsls r1, r5, #1
	adds r2, r1, r5
	adds r0, r4, #0
	adds r0, #0x2f
	strb r2, [r0]
	adds r0, #4
	strb r1, [r0]
	movs r3, #0x10
	negs r3, r3
	adds r0, r3, #0
	subs r0, r0, r2
	adds r2, r4, #0
	adds r2, #0x2e
	strb r0, [r2]
	movs r2, #0x60
	negs r2, r2
	adds r0, r2, #0
	subs r0, r0, r1
	adds r1, r4, #0
	adds r1, #0x32
	strb r0, [r1]
	b _08097C40
	.align 2, 0
_08097C18: .4byte gLCDControlBuffer
_08097C1C:
	lsls r2, r5, #1
	adds r1, r2, r5
	movs r0, #0x78
	subs r0, r0, r1
	adds r3, r4, #0
	adds r3, #0x2f
	strb r0, [r3]
	movs r0, #0x50
	subs r0, r0, r2
	adds r3, #4
	strb r0, [r3]
	adds r1, #0x78
	adds r0, r4, #0
	adds r0, #0x2e
	strb r1, [r0]
	adds r2, #0x50
	adds r0, #4
	strb r2, [r0]
_08097C40:
	adds r2, r4, #0
	adds r2, #0x35
	ldrb r0, [r2]
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
	strb r0, [r2]
	adds r2, #1
	ldrb r1, [r2]
	movs r0, #2
	negs r0, r0
	ands r0, r1
	movs r3, #3
	negs r3, r3
	mov sl, r3
	ands r0, r3
	movs r1, #5
	negs r1, r1
	mov r9, r1
	ands r0, r1
	subs r3, #6
	mov r8, r3
	ands r0, r3
	movs r7, #0x11
	negs r7, r7
	ands r0, r7
	strb r0, [r2]
	cmp r5, #0x27
	ble _08097CB4
	adds r0, r6, #0
	bl Proc_Break
	adds r0, r6, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	ble _08097CB4
	ldrb r1, [r4, #1]
	movs r0, #2
	negs r0, r0
	ands r0, r1
	mov r1, sl
	ands r0, r1
	mov r2, r9
	ands r0, r2
	mov r3, r8
	ands r0, r3
	ands r0, r7
	strb r0, [r4, #1]
_08097CB4:
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8097B98

	THUMB_FUNC_START sub_8097CC4
sub_8097CC4: @ 0x08097CC4
	movs r0, #0
	bx lr

	THUMB_FUNC_END sub_8097CC4

	THUMB_FUNC_START sub_8097CC8
sub_8097CC8: @ 0x08097CC8
	push {lr}
	bl GetConvoyItemCount
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8097CC8

	THUMB_FUNC_START sub_8097CD8
sub_8097CD8: @ 0x08097CD8
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2a]
	ldrh r1, [r4, #0x2c]
	cmp r0, r1
	bne _08097D04
	ldr r2, _08097D10  @ gLCDControlBuffer
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
	adds r0, r4, #0
	bl Proc_Break
_08097D04:
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08097D10: .4byte gLCDControlBuffer

	THUMB_FUNC_END sub_8097CD8

	THUMB_FUNC_START sub_8097D14
sub_8097D14: @ 0x08097D14
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	ldr r0, _08097D4C  @ gUnknown_08A18888
	bl Proc_Start
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r4, [r0, #0x2a]
	ldr r2, _08097D50  @ gLCDControlBuffer
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
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08097D4C: .4byte gUnknown_08A18888
_08097D50: .4byte gLCDControlBuffer

	THUMB_FUNC_END sub_8097D14

	THUMB_FUNC_START sub_8097D54
sub_8097D54: @ 0x08097D54
	push {lr}
	cmp r0, #0
	beq _08097D64
	adds r1, r0, #0
	adds r1, #0x28
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
_08097D64:
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8097D54

	THUMB_FUNC_START sub_8097D68
sub_8097D68: @ 0x08097D68
	push {lr}
	cmp r0, #0
	beq _08097D7C
	adds r1, r0, #0
	adds r1, #0x28
	ldrb r0, [r1]
	cmp r0, #0
	beq _08097D7C
	subs r0, #1
	strb r0, [r1]
_08097D7C:
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8097D68

	THUMB_FUNC_START sub_8097D80
sub_8097D80: @ 0x08097D80
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08097DA4  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0xf3
	ands r0, r1
	cmp r0, #0
	beq _08097D9C
	bl CloseHelpBox
	adds r0, r4, #0
	bl Proc_Break
_08097D9C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08097DA4: .4byte gKeyStatusPtr

	THUMB_FUNC_END sub_8097D80

	THUMB_FUNC_START sub_8097DA8
sub_8097DA8: @ 0x08097DA8
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r2, #0
	adds r6, r3, #0
	cmp r4, #0
	bge _08097DC4
	cmp r1, #0
	bge _08097DC4
	bl GetUiHandPrevDisplayX
	adds r4, r0, #0
	bl GetUiHandPrevDisplayY
	adds r1, r0, #0
_08097DC4:
	adds r0, r4, #0
	adds r2, r5, #0
	bl StartHelpBox
	ldr r0, _08097DDC  @ gUnknown_08A188A8
	adds r1, r6, #0
	bl Proc_StartBlocking
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08097DDC: .4byte gUnknown_08A188A8

	THUMB_FUNC_END sub_8097DA8

	THUMB_FUNC_START sub_8097DE0
sub_8097DE0: @ 0x08097DE0
	push {r4, lr}
	adds r4, r1, #0
	bl CanUnitUseWeapon
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08097E00
	adds r0, r4, #0
	bl GetItemAttributes
	movs r1, #0x80
	ands r1, r0
	cmp r1, #0
	bne _08097E00
	movs r0, #1
	b _08097E02
_08097E00:
	movs r0, #0
_08097E02:
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8097DE0

	THUMB_FUNC_START sub_8097E08
sub_8097E08: @ 0x08097E08
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	movs r6, #0
	movs r4, #0
_08097E10:
	lsls r1, r4, #1
	adds r0, r5, #0
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r1, [r0]
	adds r0, r5, #0
	bl sub_8097DE0
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _08097E2A
	adds r6, #1
_08097E2A:
	adds r4, #1
	cmp r4, #4
	ble _08097E10
	adds r0, r6, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8097E08

	THUMB_FUNC_START sub_8097E38
sub_8097E38: @ 0x08097E38
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4]
	ldr r1, [r4, #4]
	ldr r0, [r0, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	movs r1, #0x80
	lsls r1, r1, #2
	ands r0, r1
	cmp r0, #0
	bne _08097E6A
	adds r0, r4, #0
	bl ArenaIsUnitAllowed
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08097E6A
	adds r0, r4, #0
	bl sub_8097E08
	cmp r0, #0
	beq _08097E6A
	movs r0, #1
	b _08097E6C
_08097E6A:
	movs r0, #0
_08097E6C:
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8097E38

	THUMB_FUNC_START sub_8097E74
sub_8097E74: @ 0x08097E74
	push {r4, lr}
	movs r2, #0
	ldr r0, [r0]
	ldrb r3, [r0, #4]
	ldr r1, _08097E8C  @ gUnknown_08205BFC
_08097E7E:
	movs r4, #0
	ldrsh r0, [r1, r4]
	cmp r3, r0
	bne _08097E90
	movs r0, #0
	b _08097E9A
	.align 2, 0
_08097E8C: .4byte gUnknown_08205BFC
_08097E90:
	adds r1, #2
	adds r2, #1
	cmp r2, #0xa
	bls _08097E7E
	movs r0, #1
_08097E9A:
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8097E74

	THUMB_FUNC_START sub_8097EA0
sub_8097EA0: @ 0x08097EA0
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r7, r1, #0
	adds r5, r2, #0
	adds r6, r3, #0
	cmp r4, r5
	beq _08097F3A
	bl CheckSomethingSomewhere
	cmp r0, #0
	beq _08097F3A
	ldr r0, [r4, #0xc]
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	bne _08097EF6
	lsls r1, r7, #1
	adds r0, r4, #0
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r1, [r0]
	adds r0, r4, #0
	bl sub_8097DE0
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08097EF6
	adds r0, r4, #0
	bl sub_8097E08
	cmp r0, #1
	bgt _08097EF6
	lsls r1, r6, #1
	adds r0, r5, #0
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r1, [r0]
	adds r0, r4, #0
	bl sub_8097DE0
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08097F36
_08097EF6:
	ldr r0, [r5, #0xc]
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	bne _08097F3A
	lsls r1, r6, #1
	adds r0, r5, #0
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r1, [r0]
	adds r0, r5, #0
	bl sub_8097DE0
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08097F3A
	adds r0, r5, #0
	bl sub_8097E08
	cmp r0, #1
	bgt _08097F3A
	lsls r1, r7, #1
	adds r0, r4, #0
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r1, [r0]
	adds r0, r5, #0
	bl sub_8097DE0
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08097F3A
_08097F36:
	movs r0, #0
	b _08097F3C
_08097F3A:
	movs r0, #1
_08097F3C:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8097EA0

	THUMB_FUNC_START sub_8097F44
sub_8097F44: @ 0x08097F44
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	bl CheckSomethingSomewhere
	cmp r0, #0
	beq _08097F90
	ldr r0, [r4, #0xc]
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	bne _08097F90
	lsls r1, r5, #1
	adds r0, r4, #0
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r1, [r0]
	adds r0, r4, #0
	bl sub_8097DE0
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08097F90
	adds r0, r4, #0
	bl sub_8097E08
	cmp r0, #1
	bne _08097F90
	adds r0, r4, #0
	adds r1, r6, #0
	bl sub_8097DE0
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08097F90
	movs r0, #0
	b _08097F92
_08097F90:
	movs r0, #1
_08097F92:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8097F44

	THUMB_FUNC_START sub_8097F98
sub_8097F98: @ 0x08097F98
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	bl CheckSomethingSomewhere
	cmp r0, #0
	beq _08097FD4
	ldr r0, [r4, #0xc]
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	bne _08097FD4
	lsls r1, r5, #1
	adds r0, r4, #0
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r1, [r0]
	adds r0, r4, #0
	bl sub_8097DE0
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08097FD4
	adds r0, r4, #0
	bl sub_8097E08
	cmp r0, #1
	bne _08097FD4
	movs r0, #0
	b _08097FD6
_08097FD4:
	movs r0, #1
_08097FD6:
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8097F98

	THUMB_FUNC_START sub_8097FDC
sub_8097FDC: @ 0x08097FDC
	push {r4, lr}
	movs r1, #0
	ldr r4, _08098008  @ gUnknown_0202BD31
	ldr r2, _0809800C  @ gUnknown_02013460
	ldr r3, _08098010  @ gUnknown_08A1D448
_08097FE6:
	ldrb r0, [r4]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1e
	lsls r0, r0, #4
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r3
	ldrh r0, [r0]
	strh r0, [r2]
	adds r2, #2
	adds r1, #1
	cmp r1, #0xf
	ble _08097FE6
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08098008: .4byte gUnknown_0202BD31
_0809800C: .4byte gUnknown_02013460
_08098010: .4byte gUnknown_08A1D448

	THUMB_FUNC_END sub_8097FDC

	THUMB_FUNC_START sub_8098014
sub_8098014: @ 0x08098014
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	movs r5, #0
	ldr r4, _08098034  @ gUnknown_08A188C0
_0809801C:
	adds r0, r6, #0
	bl GetItemType
	ldrb r1, [r4]
	cmp r0, r1
	blt _08098038
	ldrb r1, [r4, #1]
	cmp r0, r1
	bgt _08098038
	adds r0, r5, #0
	b _08098042
	.align 2, 0
_08098034: .4byte gUnknown_08A188C0
_08098038:
	adds r4, #4
	adds r5, #1
	cmp r5, #8
	ble _0809801C
	movs r0, #8
_08098042:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8098014

	THUMB_FUNC_START sub_8098048
sub_8098048: @ 0x08098048
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov r9, r0
	ldr r0, _08098100  @ gUnknown_02012914
	mov r8, r0
	ldr r0, _08098104  @ gUnknown_02012F56
	movs r1, #0
	strh r1, [r0]
	movs r4, #0
	ldr r1, _08098108  @ gUnknown_02012F54
	mov sl, r0
	adds r2, r1, #0
	ldrh r1, [r2]
	cmp r4, r1
	bge _080980B4
	ldr r1, _0809810C  @ gUnknown_08A188C0
	mov r3, r9
	lsls r0, r3, #2
	adds r6, r0, r1
	mov r7, sl
_08098078:
	ldr r1, _08098110  @ gUnknown_020122D4
	lsls r0, r4, #2
	adds r5, r0, r1
	ldrh r0, [r5, #2]
	str r2, [sp]
	bl GetItemType
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, [sp]
	ldrb r1, [r6]
	cmp r0, r1
	bcc _080980AA
	ldrb r3, [r6, #1]
	cmp r0, r3
	bhi _080980AA
	ldr r0, [r5]
	mov r1, r8
	adds r1, #4
	mov r8, r1
	subs r1, #4
	stm r1!, {r0}
	ldrh r0, [r7]
	adds r0, #1
	strh r0, [r7]
_080980AA:
	adds r4, #1
	ldr r0, _08098108  @ gUnknown_02012F54
	ldrh r0, [r0]
	cmp r4, r0
	blt _08098078
_080980B4:
	movs r4, #0
	ldrh r2, [r2]
	cmp r4, r2
	bge _080980F6
	ldr r1, _0809810C  @ gUnknown_08A188C0
	mov r2, r9
	lsls r0, r2, #2
	adds r6, r0, r1
_080980C4:
	ldr r1, _08098110  @ gUnknown_020122D4
	lsls r0, r4, #2
	adds r5, r0, r1
	ldrh r0, [r5, #2]
	bl GetItemType
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrb r3, [r6]
	cmp r0, r3
	bcc _080980E0
	ldrb r1, [r6, #1]
	cmp r0, r1
	bls _080980EC
_080980E0:
	ldr r0, [r5]
	mov r2, r8
	adds r2, #4
	mov r8, r2
	subs r2, #4
	stm r2!, {r0}
_080980EC:
	adds r4, #1
	ldr r0, _08098108  @ gUnknown_02012F54
	ldrh r0, [r0]
	cmp r4, r0
	blt _080980C4
_080980F6:
	movs r2, #1
	ldr r5, _08098100  @ gUnknown_02012914
	ldr r3, _08098104  @ gUnknown_02012F56
	mov sl, r3
	b _0809811A
	.align 2, 0
_08098100: .4byte gUnknown_02012914
_08098104: .4byte gUnknown_02012F56
_08098108: .4byte gUnknown_02012F54
_0809810C: .4byte gUnknown_08A188C0
_08098110: .4byte gUnknown_020122D4
_08098114:
	lsls r0, r2, #1
	adds r0, r0, r2
	adds r2, r0, #1
_0809811A:
	mov r1, sl
	ldrh r0, [r1]
	movs r1, #3
	str r2, [sp]
	bl __udivsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r2, [sp]
	cmp r2, r0
	blt _08098114
	cmp r2, #0
	ble _080981BC
_08098134:
	adds r4, r2, #0
	mov r3, sl
	ldrh r3, [r3]
	cmp r2, r3
	bge _080981AE
	ldr r0, _080981D8  @ gUnknown_02012F56
	mov sl, r0
_08098142:
	subs r7, r4, r2
	adds r4, #1
	mov r9, r4
	cmp r7, #0
	blt _080981A2
	ldr r1, _080981DC  @ gUnknown_02012914
	mov r8, r1
_08098150:
	lsls r0, r7, #2
	mov r3, r8
	adds r6, r0, r3
	ldrh r0, [r6, #2]
	str r2, [sp]
	bl GetItemIndex
	adds r4, r0, #0
	ldr r2, [sp]
	adds r0, r7, r2
	lsls r0, r0, #2
	mov r1, r8
	adds r5, r0, r1
	ldrh r0, [r5, #2]
	bl GetItemIndex
	ldr r2, [sp]
	cmp r4, r0
	bgt _08098194
	ldrh r0, [r6, #2]
	str r2, [sp]
	bl GetItemIndex
	adds r4, r0, #0
	ldrh r0, [r5, #2]
	bl GetItemIndex
	ldr r2, [sp]
	cmp r4, r0
	bne _080981A2
	ldrh r0, [r6, #2]
	ldrh r3, [r5, #2]
	cmp r0, r3
	bls _0809819C
_08098194:
	ldr r1, [r6]
	ldr r0, [r5]
	str r0, [r6]
	str r1, [r5]
_0809819C:
	subs r7, r7, r2
	cmp r7, #0
	bge _08098150
_080981A2:
	mov r4, r9
	ldr r0, _080981D8  @ gUnknown_02012F56
	ldr r5, _080981DC  @ gUnknown_02012914
	ldrh r0, [r0]
	cmp r4, r0
	blt _08098142
_080981AE:
	adds r0, r2, #0
	movs r1, #3
	bl __divsi3
	adds r2, r0, #0
	cmp r2, #0
	bgt _08098134
_080981BC:
	ldr r1, _080981E0  @ gUnknown_020122D4
	movs r2, #0xc8
	lsls r2, r2, #1
	adds r0, r5, #0
	bl CpuFastSet
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080981D8: .4byte gUnknown_02012F56
_080981DC: .4byte gUnknown_02012914
_080981E0: .4byte gUnknown_020122D4

	THUMB_FUNC_END sub_8098048

	THUMB_FUNC_START SomethingPrepListRelated
SomethingPrepListRelated: @ 0x080981E4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	mov r8, r0
	mov sl, r1
	mov r9, r2
	ldr r6, _080982AC  @ gUnknown_020122D4
	ldr r1, _080982B0  @ gUnknown_02012F54
	movs r0, #0
	strh r0, [r1]
	movs r0, #2
	ands r0, r2
	cmp r0, #0
	beq _0809825E
	movs r5, #1
_08098206:
	adds r0, r5, #0
	bl GetUnit
	adds r4, r0, #0
	adds r7, r5, #1
	cmp r4, #0
	beq _08098258
	ldr r0, [r4]
	cmp r0, #0
	beq _08098258
	ldr r0, [r4, #0xc]
	ldr r1, _080982B4  @ 0x00010004
	ands r0, r1
	cmp r0, #0
	bne _08098258
	cmp r4, r8
	beq _08098258
	adds r0, r4, #0
	bl GetUnitItemCount
	adds r5, r0, #0
	movs r2, #0
	cmp r2, r5
	bge _08098258
	ldr r3, _080982B0  @ gUnknown_02012F54
	adds r1, r4, #0
	adds r1, #0x1e
_0809823C:
	ldr r0, [r4]
	ldrb r0, [r0, #4]
	strb r0, [r6]
	ldrh r0, [r1]
	strh r0, [r6, #2]
	strb r2, [r6, #1]
	adds r6, #4
	ldrh r0, [r3]
	adds r0, #1
	strh r0, [r3]
	adds r1, #2
	adds r2, #1
	cmp r2, r5
	blt _0809823C
_08098258:
	adds r5, r7, #0
	cmp r5, #0x3f
	ble _08098206
_0809825E:
	movs r0, #1
	mov r1, r9
	ands r0, r1
	cmp r0, #0
	beq _08098298
	bl GetConvoyItemArray
	adds r1, r0, #0
	movs r2, #0
	ldrh r0, [r1]
	cmp r0, #0
	beq _08098298
	movs r4, #0
	ldr r3, _080982B0  @ gUnknown_02012F54
_0809827A:
	ldrh r0, [r1]
	strh r0, [r6, #2]
	strb r4, [r6]
	strb r2, [r6, #1]
	adds r6, #4
	ldrh r0, [r3]
	adds r0, #1
	strh r0, [r3]
	adds r1, #2
	adds r2, #1
	cmp r2, #0x63
	bgt _08098298
	ldrh r0, [r1]
	cmp r0, #0
	bne _0809827A
_08098298:
	mov r0, sl
	bl sub_8098048
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080982AC: .4byte gUnknown_020122D4
_080982B0: .4byte gUnknown_02012F54
_080982B4: .4byte 0x00010004

	THUMB_FUNC_END SomethingPrepListRelated

	THUMB_FUNC_START sub_80982B8
sub_80982B8: @ 0x080982B8
	push {r4, r5, lr}
	bl ClearConvoyItems
	movs r4, #0
	ldr r0, _080982F4  @ gUnknown_02012F54
	ldrh r0, [r0]
	cmp r4, r0
	bcs _080982EC
	ldr r5, _080982F8  @ gUnknown_020122D4
_080982CA:
	lsls r0, r4, #2
	adds r1, r0, r5
	ldrb r0, [r1]
	cmp r0, #0
	bne _080982DE
	ldrh r0, [r1, #2]
	cmp r0, #0
	beq _080982DE
	bl AddItemToConvoy
_080982DE:
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	ldr r0, _080982F4  @ gUnknown_02012F54
	ldrh r0, [r0]
	cmp r4, r0
	bcc _080982CA
_080982EC:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080982F4: .4byte gUnknown_02012F54
_080982F8: .4byte gUnknown_020122D4

	THUMB_FUNC_END sub_80982B8

	THUMB_FUNC_START sub_80982FC
sub_80982FC: @ 0x080982FC
	push {r4, r5, lr}
	bl ClearConvoyItems
	movs r4, #0
	movs r5, #0x88
_08098306:
	subs r0, r5, r4
	bl AddItemToConvoy
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0x63
	bls _08098306
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80982FC

	THUMB_FUNC_START sub_809831C
sub_809831C: @ 0x0809831C
	push {r4, lr}
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	movs r2, #0
	movs r1, #0
	movs r4, #1
_08098328:
	adds r0, r3, #0
	asrs r0, r1
	ands r0, r4
	cmp r0, #0
	beq _08098334
	adds r2, #1
_08098334:
	adds r1, #1
	cmp r1, #0xf
	ble _08098328
	adds r0, r2, #0
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_809831C

	THUMB_FUNC_START sub_8098344
sub_8098344: @ 0x08098344
	push {r4, r5, lr}
	adds r5, r1, #0
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	movs r3, #0
	movs r2, #0
	movs r1, #1
_08098352:
	adds r0, r4, #0
	asrs r0, r2
	ands r0, r1
	cmp r0, #0
	beq _08098368
	cmp r3, r5
	bne _08098366
	adds r0, r1, #0
	lsls r0, r2
	b _08098370
_08098366:
	adds r3, #1
_08098368:
	adds r2, #1
	cmp r2, #0xf
	ble _08098352
	movs r0, #0
_08098370:
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8098344

	THUMB_FUNC_START sub_8098378
sub_8098378: @ 0x08098378
	push {lr}
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	movs r1, #0
	movs r3, #1
_08098382:
	adds r0, r2, #0
	asrs r0, r1
	ands r0, r3
	cmp r0, #0
	beq _08098390
	adds r0, r1, #0
	b _08098398
_08098390:
	adds r1, #1
	cmp r1, #0xf
	ble _08098382
	movs r0, #0
_08098398:
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8098378

	THUMB_FUNC_START CanUnitPrepScreenUse
CanUnitPrepScreenUse: @ 0x0809839C
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	bl GetUnitItemCount
	adds r6, r0, #0
	movs r4, #0
	cmp r4, r6
	bge _080983CA
_080983AC:
	lsls r1, r4, #1
	adds r0, r5, #0
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r1, [r0]
	adds r0, r5, #0
	bl CanUnitUseItemPrepScreen
	cmp r0, #0
	beq _080983C4
	movs r0, #1
	b _080983CC
_080983C4:
	adds r4, #1
	cmp r4, r6
	blt _080983AC
_080983CA:
	movs r0, #0
_080983CC:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	THUMB_FUNC_END CanUnitPrepScreenUse

	THUMB_FUNC_START sub_80983D4
sub_80983D4: @ 0x080983D4
	push {lr}
	ldr r0, _08098400  @ 0x04000006
	ldrh r0, [r0]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0xa0
	bls _080983E6
	movs r2, #0
_080983E6:
	cmp r2, #0
	bne _080983F0
	ldr r1, _08098404  @ 0x04000012
	movs r0, #0xf8
	strh r0, [r1]
_080983F0:
	cmp r2, #0x48
	bne _080983FA
	ldr r1, _08098404  @ 0x04000012
	movs r0, #0xfc
	strh r0, [r1]
_080983FA:
	pop {r0}
	bx r0
	.align 2, 0
_08098400: .4byte 0x04000006
_08098404: .4byte 0x04000012

	THUMB_FUNC_END sub_80983D4

	THUMB_FUNC_START sub_8098408
sub_8098408: @ 0x08098408
	push {r4, lr}
	adds r4, r0, #0
	adds r2, r4, #0
	adds r2, #0x29
	ldrb r1, [r2]
	movs r0, #2
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	adds r1, r4, #0
	adds r1, #0x2b
	movs r0, #0xff
	strb r0, [r1]
	adds r1, #2
	movs r0, #1
	negs r0, r0
	strb r0, [r1]
	adds r1, #1
	movs r0, #0
	strb r0, [r1]
	strh r0, [r4, #0x34]
	str r0, [r4, #0x48]
	str r0, [r4, #0x44]
	bl sub_8096484
	adds r1, r4, #0
	adds r1, #0x2c
	strb r0, [r1]
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8098408

	THUMB_FUNC_START sub_8098448
sub_8098448: @ 0x08098448
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08098468  @ gUnknown_08A1B1FC
	ldr r1, _0809846C  @ 0x06013000
	bl CopyDataWithPossibleUncomp
	ldr r0, _08098470  @ gUnknown_08A1B638
	ldr r1, [r4, #0x34]
	adds r1, #0x10
	lsls r1, r1, #5
	movs r2, #0x20
	bl CopyToPaletteBuffer
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08098468: .4byte gUnknown_08A1B1FC
_0809846C: .4byte 0x06013000
_08098470: .4byte gUnknown_08A1B638

	THUMB_FUNC_END sub_8098448

	THUMB_FUNC_START sub_8098474
sub_8098474: @ 0x08098474
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, [r4, #0x38]
	cmp r0, #0
	beq _0809849C
	ldr r1, [r4, #0x2c]
	ldr r2, [r4, #0x30]
	ldr r3, _080984A4  @ gUnknown_08A18928
	ldr r0, [r4, #0x34]
	movs r4, #0xf
	ands r0, r4
	lsls r0, r0, #0xc
	movs r4, #0xb0
	lsls r4, r4, #3
	adds r0, r0, r4
	str r0, [sp]
	movs r0, #4
	bl PutSpriteExt
_0809849C:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080984A4: .4byte gUnknown_08A18928

	THUMB_FUNC_END sub_8098474

	THUMB_FUNC_START sub_80984A8
sub_80984A8: @ 0x080984A8
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	adds r1, r3, #0
	ldr r0, _080984C8  @ gUnknown_08A18944
	bl Proc_Start
	movs r1, #0
	str r1, [r0, #0x38]
	str r4, [r0, #0x2c]
	str r5, [r0, #0x30]
	str r6, [r0, #0x34]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080984C8: .4byte gUnknown_08A18944

	THUMB_FUNC_END sub_80984A8

	THUMB_FUNC_START sub_80984CC
sub_80984CC: @ 0x080984CC
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _080984E8  @ gUnknown_08A18944
	bl Proc_Find
	movs r1, #1
	str r1, [r0, #0x38]
	str r4, [r0, #0x2c]
	str r5, [r0, #0x30]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080984E8: .4byte gUnknown_08A18944

	THUMB_FUNC_END sub_80984CC

	THUMB_FUNC_START sub_80984EC
sub_80984EC: @ 0x080984EC
	push {lr}
	ldr r0, _080984FC  @ gUnknown_08A18944
	bl Proc_Find
	movs r1, #0
	str r1, [r0, #0x38]
	pop {r0}
	bx r0
	.align 2, 0
_080984FC: .4byte gUnknown_08A18944

	THUMB_FUNC_END sub_80984EC

	THUMB_FUNC_START sub_8098500
sub_8098500: @ 0x08098500
	push {lr}
	ldr r0, _08098510  @ gUnknown_08A18944
	bl Proc_Find
	bl Proc_End
	pop {r0}
	bx r0
	.align 2, 0
_08098510: .4byte gUnknown_08A18944

	THUMB_FUNC_END sub_8098500

	THUMB_FUNC_START sub_8098514
sub_8098514: @ 0x08098514
	push {lr}
	ldr r0, _08098528  @ gUiFramePaletteA
	movs r1, #0x90
	lsls r1, r1, #2
	movs r2, #0x20
	bl CopyToPaletteBuffer
	pop {r0}
	bx r0
	.align 2, 0
_08098528: .4byte gUiFramePaletteA

	THUMB_FUNC_END sub_8098514

	THUMB_FUNC_START sub_809852C
sub_809852C: @ 0x0809852C
	push {lr}
	sub sp, #4
	adds r2, r0, #0
	ldr r0, [r2, #0x34]
	cmp r0, #0
	beq _0809854A
	ldr r1, [r2, #0x2c]
	ldr r2, [r2, #0x30]
	ldr r3, _08098550  @ gUnknown_08A18964
	movs r0, #0x96
	lsls r0, r0, #6
	str r0, [sp]
	movs r0, #4
	bl PutSpriteExt
_0809854A:
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_08098550: .4byte gUnknown_08A18964

	THUMB_FUNC_END sub_809852C

	THUMB_FUNC_START sub_8098554
sub_8098554: @ 0x08098554
	push {lr}
	adds r1, r0, #0
	ldr r0, _0809856C  @ gUnknown_08A1898C
	bl Proc_Start
	movs r1, #0
	str r1, [r0, #0x34]
	str r1, [r0, #0x2c]
	str r1, [r0, #0x30]
	pop {r0}
	bx r0
	.align 2, 0
_0809856C: .4byte gUnknown_08A1898C

	THUMB_FUNC_END sub_8098554

	THUMB_FUNC_START sub_8098570
sub_8098570: @ 0x08098570
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _0809858C  @ gUnknown_08A1898C
	bl Proc_Find
	movs r1, #1
	str r1, [r0, #0x34]
	str r4, [r0, #0x2c]
	str r5, [r0, #0x30]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0809858C: .4byte gUnknown_08A1898C

	THUMB_FUNC_END sub_8098570

	THUMB_FUNC_START sub_8098590
sub_8098590: @ 0x08098590
	push {lr}
	ldr r0, _080985A0  @ gUnknown_08A1898C
	bl Proc_Find
	movs r1, #0
	str r1, [r0, #0x34]
	pop {r0}
	bx r0
	.align 2, 0
_080985A0: .4byte gUnknown_08A1898C

	THUMB_FUNC_END sub_8098590

	THUMB_FUNC_START sub_80985A4
sub_80985A4: @ 0x080985A4
	push {lr}
	ldr r0, _080985B4  @ gUnknown_08A1898C
	bl Proc_Find
	bl Proc_End
	pop {r0}
	bx r0
	.align 2, 0
_080985B4: .4byte gUnknown_08A1898C

	THUMB_FUNC_END sub_80985A4

	THUMB_FUNC_START sub_80985B8
sub_80985B8: @ 0x080985B8
	push {r4, r5, lr}
	ldr r0, _080985F8  @ gUnknown_02013588
	ldr r4, _080985FC  @ gUnknown_0202310E
	adds r1, r4, #0
	bl Text_Draw
	adds r5, r4, #0
	adds r5, #0x10
	bl GetPartyGoldAmount
	adds r2, r0, #0
	adds r0, r5, #0
	movs r1, #2
	bl sub_8004B88
	adds r4, #0x12
	adds r0, r4, #0
	movs r1, #3
	movs r2, #0x1e
	bl sub_8004B0C
	movs r0, #0xa8
	movs r1, #0x85
	bl sub_80984CC
	movs r0, #1
	bl BG_EnableSyncByMask
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080985F8: .4byte gUnknown_02013588
_080985FC: .4byte gUnknown_0202310E

	THUMB_FUNC_END sub_80985B8

	THUMB_FUNC_START sub_8098600
sub_8098600: @ 0x08098600
	push {lr}
	ldr r0, _0809861C  @ gUnknown_0202310E
	movs r1, #0xa
	movs r2, #1
	movs r3, #0
	bl TileMap_FillRect
	bl sub_80984EC
	movs r0, #1
	bl BG_EnableSyncByMask
	pop {r0}
	bx r0
	.align 2, 0
_0809861C: .4byte gUnknown_0202310E

	THUMB_FUNC_END sub_8098600

	THUMB_FUNC_START sub_8098620
sub_8098620: @ 0x08098620
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x28
	adds r7, r0, #0
	add r1, sp, #4
	ldr r0, _08098970  @ gUnknown_08205C14
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldm r0!, {r2, r3}
	stm r1!, {r2, r3}
	ldr r0, _08098974  @ gUnknown_08A181E8
	bl SetupBackgrounds
	ldr r4, _08098978  @ gLCDControlBuffer
	ldrb r1, [r4]
	movs r0, #8
	negs r0, r0
	ands r0, r1
	strb r0, [r4]
	add r0, sp, #4
	bl SetupFaceGfxData
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
	ldr r0, _0809897C  @ 0x06017800
	movs r1, #0
	bl SetupDebugFontForOBJ
	ldrb r2, [r4, #0xc]
	movs r1, #4
	negs r1, r1
	adds r0, r1, #0
	ands r0, r2
	strb r0, [r4, #0xc]
	ldrb r2, [r4, #0x10]
	adds r0, r1, #0
	ands r0, r2
	movs r2, #2
	orrs r0, r2
	strb r0, [r4, #0x10]
	ldrb r0, [r4, #0x14]
	ands r1, r0
	movs r0, #1
	orrs r1, r0
	strb r1, [r4, #0x14]
	ldrb r0, [r4, #0x18]
	movs r1, #3
	orrs r0, r1
	strb r0, [r4, #0x18]
	bl Font_InitForUIDefault
	bl ResetIconGraphics_
	movs r0, #4
	bl LoadIconPalettes
	bl LoadUiFrameGraphics
	ldr r0, _08098980  @ gUiFramePaletteD
	movs r1, #0x40
	movs r2, #0x20
	bl CopyToPaletteBuffer
	bl LoadObjUIGfx
	bl MakePrepUnitList
	bl PrepGetLatestCharId
	bl UnitGetIndexInPrepList
	adds r1, r7, #0
	adds r1, #0x2a
	movs r4, #0
	strb r0, [r1]
	adds r0, r7, #0
	bl ResetPrepScreenHandCursor
	ldr r0, _08098984  @ sub_809A274
	adds r1, r7, #0
	bl StartParallelWorker
	adds r0, r7, #0
	bl sub_80AC9C0
	movs r0, #0
	bl SetPrimaryHBlankHandler
	movs r0, #0
	bl BG_GetMapBuffer
	movs r1, #0
	bl BG_Fill
	movs r0, #1
	bl BG_GetMapBuffer
	movs r1, #0
	bl BG_Fill
	movs r0, #2
	bl BG_GetMapBuffer
	movs r1, #0
	bl BG_Fill
	ldr r0, _08098988  @ gPaletteBuffer
	strh r4, [r0]
	bl EnablePaletteSync
	add r4, sp, #0x24
	mov sl, r4
	ldr r5, _0809898C  @ gUnknown_02013498
	movs r4, #0xe
_08098726:
	adds r0, r5, #0
	movs r1, #5
	bl Text_Init
	adds r5, #8
	subs r4, #1
	cmp r4, #0
	bge _08098726
	movs r0, #0x2b
	adds r0, r0, r7
	mov r8, r0
	ldr r0, _08098990  @ gUnknown_02013510
	adds r6, r0, #0
	adds r6, #0x28
	adds r5, r0, #0
	movs r4, #4
_08098746:
	adds r0, r5, #0
	movs r1, #7
	bl Text_Init
	adds r0, r6, #0
	movs r1, #7
	bl Text_Init
	adds r6, #8
	adds r5, #8
	subs r4, #1
	cmp r4, #0
	bge _08098746
	ldr r4, _08098994  @ gUnknown_02013560
	adds r0, r4, #0
	movs r1, #8
	bl Text_Allocate
	adds r0, r4, #0
	adds r0, #8
	movs r1, #8
	bl Text_Allocate
	adds r0, r4, #0
	adds r0, #0x10
	movs r1, #8
	bl Text_Init
	adds r0, r4, #0
	adds r0, #0x28
	movs r1, #7
	bl Text_Init
	adds r0, r4, #0
	adds r0, #0x30
	movs r1, #5
	bl Text_Init
	ldr r0, _08098998  @ 0x06014000
	movs r1, #1
	negs r1, r1
	bl LoadDialogueBoxGfx
	movs r0, #0
	bl sub_8001F48
	movs r0, #0
	bl sub_8001F64
	movs r1, #0
	mov r9, r1
	str r1, [sp]
	movs r0, #0
	movs r2, #0
	movs r3, #0
	bl SetBlendTargetA
	mov r2, r9
	str r2, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl SetBlendTargetB
	ldr r3, _08098978  @ gLCDControlBuffer
	movs r4, #0x36
	adds r4, r4, r3
	mov ip, r4
	ldrb r2, [r4]
	movs r1, #0x20
	orrs r2, r1
	ldrb r0, [r3, #1]
	orrs r0, r1
	movs r1, #0x41
	negs r1, r1
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r3, #1]
	adds r0, r3, #0
	adds r0, #0x2d
	mov r1, r9
	strb r1, [r0]
	adds r0, #4
	movs r4, #4
	strb r4, [r0]
	adds r1, r3, #0
	adds r1, #0x2c
	movs r0, #0xf0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0x44
	strb r0, [r1]
	adds r6, r3, #0
	adds r6, #0x34
	ldrb r0, [r6]
	movs r5, #1
	orrs r0, r5
	movs r3, #2
	orrs r0, r3
	orrs r0, r4
	movs r4, #8
	orrs r0, r4
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r6]
	orrs r2, r5
	orrs r2, r3
	movs r0, #5
	negs r0, r0
	ands r2, r0
	orrs r2, r4
	orrs r2, r1
	mov r3, ip
	strb r2, [r3]
	ldr r2, _0809899C  @ 0x0000FFFC
	movs r0, #0
	movs r1, #4
	bl BG_SetPosition
	movs r0, #1
	movs r1, #0
	movs r2, #4
	bl BG_SetPosition
	ldr r1, _080989A0  @ 0x0000FFD8
	ldrh r2, [r7, #0x34]
	subs r2, #4
	movs r0, #0xff
	ands r2, r0
	movs r0, #2
	bl BG_SetPosition
	movs r0, #7
	bl BG_EnableSyncByMask
	bl SetupMapSpritesPalettes
	mov r4, r9
	str r4, [sp, #0x24]
	ldr r1, _080989A4  @ gUnknown_02022C08
	ldr r2, _080989A8  @ 0x01000008
	mov r0, sl
	bl CpuFastSet
	bl SMS_FlushIndirect
	ldr r0, _080989AC  @ gUnknown_08A1D4E8
	ldr r1, _080989B0  @ 0x06013E00
	bl CopyDataWithPossibleUncomp
	movs r0, #0x3c
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #0xd0
	bl sub_80ACA4C
	movs r0, #0xc0
	lsls r0, r0, #3
	movs r1, #1
	bl sub_80AD4A0
	bl EndSlidingWallEffectMaybe
	mov r1, r8
	ldrb r0, [r1]
	cmp r0, #0xff
	beq _080988E2
	adds r5, r0, #0
	movs r1, #3
	bl __umodsi3
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x12
	adds r4, #0x18
	adds r0, r5, #0
	movs r1, #3
	bl __udivsi3
	adds r2, r0, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x14
	ldrh r0, [r7, #0x34]
	subs r0, #4
	subs r2, r2, r0
	movs r0, #0
	adds r1, r4, #0
	movs r3, #2
	bl sub_80AC9D4
	mov r2, r8
	ldrb r0, [r2]
	bl GetUnitFromPrepList
	adds r1, r0, #0
	ldr r0, _080989B4  @ 0x00000503
	str r0, [sp]
	movs r0, #0
	movs r2, #0x3c
	movs r3, #0x4c
	bl sub_8099E98
_080988E2:
	movs r3, #0x80
	lsls r3, r3, #2
	movs r4, #4
	str r4, [sp]
	adds r0, r7, #0
	movs r1, #0xe0
	movs r2, #0xb
	bl sub_8097748
	ldrh r4, [r7, #0x34]
	bl PrepGetUnitAmount
	subs r0, #1
	movs r1, #3
	bl __divsi3
	adds r2, r0, #0
	adds r2, #1
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #6
	adds r1, r4, #0
	movs r3, #4
	bl sub_80976CC
	bl sub_8097668
	bl PrepUpdateSMS
	movs r0, #1
	movs r1, #8
	movs r2, #8
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	mov r0, r9
	str r0, [sp]
	movs r0, #0
	movs r1, #1
	movs r2, #0
	movs r3, #0
	bl SetBlendTargetA
	mov r1, r9
	str r1, [sp]
	movs r0, #0
	movs r1, #1
	movs r2, #0
	movs r3, #0
	bl SetBlendTargetB
	ldr r0, _080989B8  @ sub_80983D4
	bl SetPrimaryHBlankHandler
	movs r0, #0xa8
	movs r1, #0x85
	movs r2, #0xb
	adds r3, r7, #0
	bl sub_80984A8
	adds r0, r7, #0
	bl sub_8098554
	add sp, #0x28
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08098970: .4byte gUnknown_08205C14
_08098974: .4byte gUnknown_08A181E8
_08098978: .4byte gLCDControlBuffer
_0809897C: .4byte 0x06017800
_08098980: .4byte gUiFramePaletteD
_08098984: .4byte sub_809A274
_08098988: .4byte gPaletteBuffer
_0809898C: .4byte gUnknown_02013498
_08098990: .4byte gUnknown_02013510
_08098994: .4byte gUnknown_02013560
_08098998: .4byte 0x06014000
_0809899C: .4byte 0x0000FFFC
_080989A0: .4byte 0x0000FFD8
_080989A4: .4byte gUnknown_02022C08
_080989A8: .4byte 0x01000008
_080989AC: .4byte gUnknown_08A1D4E8
_080989B0: .4byte 0x06013E00
_080989B4: .4byte 0x00000503
_080989B8: .4byte sub_80983D4

	THUMB_FUNC_END sub_8098620

	THUMB_FUNC_START sub_80989BC
sub_80989BC: @ 0x080989BC
	push {lr}
	adds r0, #0x2a
	ldrb r0, [r0]
	bl GetUnitFromPrepList
	ldr r0, [r0]
	ldrb r0, [r0, #4]
	bl PrepSetLatestCharId
	bl EndAllParallelWorkers
	bl EndPrepScreenHandCursor
	bl sub_80ACB00
	movs r0, #0
	bl sub_8099F50
	movs r0, #1
	bl sub_8099F50
	bl EndBG3Slider_
	bl EndHelpPromptSprite
	bl Delete6CMenuScroll
	bl sub_8098500
	bl sub_80985A4
	movs r0, #0
	bl SetPrimaryHBlankHandler
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80989BC

	THUMB_FUNC_START sub_8098A04
sub_8098A04: @ 0x08098A04
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #8
	adds r5, r0, #0
	movs r1, #0xa
	movs r2, #6
	movs r3, #0
	bl TileMap_FillRect
	ldr r4, _08098A68  @ gUnknown_02013560
	adds r0, r4, #0
	bl Text_Clear
	movs r0, #8
	adds r0, r0, r4
	mov r8, r0
	bl Text_Clear
	ldr r0, _08098A6C  @ 0x00000583
	bl GetStringFromIndex
	adds r1, r5, #0
	adds r1, #0x42
	movs r6, #0
	str r6, [sp]
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r2, #0
	movs r3, #0
	bl DrawTextInline
	ldr r0, _08098A70  @ 0x00000584
	bl GetStringFromIndex
	adds r5, #0xc2
	str r6, [sp]
	str r0, [sp, #4]
	mov r0, r8
	adds r1, r5, #0
	movs r2, #0
	movs r3, #0
	bl DrawTextInline
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08098A68: .4byte gUnknown_02013560
_08098A6C: .4byte 0x00000583
_08098A70: .4byte 0x00000584

	THUMB_FUNC_END sub_8098A04

	THUMB_FUNC_START sub_8098A74
sub_8098A74: @ 0x08098A74
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r6, r0, #0
	movs r1, #0xa
	movs r2, #8
	movs r3, #0
	bl TileMap_FillRect
	ldr r4, _08098AB0  @ gUnknown_02013560
	adds r0, r4, #0
	bl Text_Clear
	adds r0, r4, #0
	adds r0, #8
	bl Text_Clear
	adds r4, #0x10
	adds r0, r4, #0
	bl Text_Clear
	bl sub_80C4070
	cmp r0, #1
	beq _08098AC8
	cmp r0, #1
	bgt _08098AB4
	cmp r0, #0
	beq _08098ABE
	b _08098ADA
	.align 2, 0
_08098AB0: .4byte gUnknown_02013560
_08098AB4:
	cmp r0, #2
	beq _08098AD0
	cmp r0, #3
	beq _08098AD8
	b _08098ADA
_08098ABE:
	ldr r5, _08098AC4  @ 0x00000672
	b _08098ADA
	.align 2, 0
_08098AC4: .4byte 0x00000672
_08098AC8:
	ldr r5, _08098ACC  @ 0x00000673
	b _08098ADA
	.align 2, 0
_08098ACC: .4byte 0x00000673
_08098AD0:
	ldr r5, _08098AD4  @ 0x00000674
	b _08098ADA
	.align 2, 0
_08098AD4: .4byte 0x00000674
_08098AD8:
	ldr r5, _08098B38  @ 0x00000675
_08098ADA:
	adds r0, r5, #0
	bl GetStringFromIndex
	ldr r4, _08098B3C  @ gUnknown_02013560
	adds r1, r6, #0
	adds r1, #0x80
	movs r5, #0
	str r5, [sp]
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r2, #0
	movs r3, #4
	bl DrawTextInline
	ldr r0, _08098B40  @ 0x00000583
	bl GetStringFromIndex
	adds r2, r4, #0
	adds r2, #8
	movs r3, #0x80
	lsls r3, r3, #1
	adds r1, r6, r3
	str r5, [sp]
	str r0, [sp, #4]
	adds r0, r2, #0
	movs r2, #0
	movs r3, #4
	bl DrawTextInline
	ldr r0, _08098B44  @ 0x00000584
	bl GetStringFromIndex
	adds r4, #0x10
	movs r2, #0xc0
	lsls r2, r2, #1
	adds r1, r6, r2
	str r5, [sp]
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r2, #0
	movs r3, #4
	bl DrawTextInline
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08098B38: .4byte 0x00000675
_08098B3C: .4byte gUnknown_02013560
_08098B40: .4byte 0x00000583
_08098B44: .4byte 0x00000584

	THUMB_FUNC_END sub_8098A74

	THUMB_FUNC_START sub_8098B48
sub_8098B48: @ 0x08098B48
	push {lr}
	sub sp, #4
	ldr r0, _08098B64  @ 0x0000A440
	str r0, [sp]
	movs r0, #0x88
	movs r1, #0x59
	movs r2, #9
	movs r3, #4
	bl sub_809A31C
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_08098B64: .4byte 0x0000A440

	THUMB_FUNC_END sub_8098B48

	THUMB_FUNC_START sub_8098B68
sub_8098B68: @ 0x08098B68
	push {lr}
	sub sp, #4
	bl sub_80C4070
	cmp r0, #3
	bne _08098B8C
	ldr r0, _08098B88  @ 0x0000A440
	str r0, [sp]
	movs r0, #0x88
	movs r1, #0x51
	movs r2, #9
	movs r3, #6
	bl sub_809A31C
	b _08098B9C
	.align 2, 0
_08098B88: .4byte 0x0000A440
_08098B8C:
	ldr r0, _08098BA4  @ 0x0000A440
	str r0, [sp]
	movs r0, #0x88
	movs r1, #0x51
	movs r2, #9
	movs r3, #6
	bl sub_809A31C
_08098B9C:
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_08098BA4: .4byte 0x0000A440

	THUMB_FUNC_END sub_8098B68

	THUMB_FUNC_START sub_8098BA8
sub_8098BA8: @ 0x08098BA8
	push {lr}
	sub sp, #4
	ldr r0, _08098BC4  @ 0x0000A440
	str r0, [sp]
	movs r0, #8
	movs r1, #0x5c
	movs r2, #0xa
	movs r3, #5
	bl sub_809A31C
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_08098BC4: .4byte 0x0000A440

	THUMB_FUNC_END sub_8098BA8

	THUMB_FUNC_START sub_8098BC8
sub_8098BC8: @ 0x08098BC8
	push {lr}
	sub sp, #4
	ldr r0, _08098BE4  @ 0x0000A840
	str r0, [sp]
	movs r0, #0x88
	movs r1, #0x51
	movs r2, #9
	movs r3, #6
	bl sub_809A31C
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_08098BE4: .4byte 0x0000A840

	THUMB_FUNC_END sub_8098BC8

	THUMB_FUNC_START sub_8098BE8
sub_8098BE8: @ 0x08098BE8
	push {lr}
	ldr r0, _08098C04  @ gGMData
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08098C0C
	ldr r0, _08098C08  @ sub_8098B68
	bl GetParallelWorker
	bl Proc_End
	b _08098C16
	.align 2, 0
_08098C04: .4byte gGMData
_08098C08: .4byte sub_8098B68
_08098C0C:
	ldr r0, _08098C30  @ sub_8098B48
	bl GetParallelWorker
	bl Proc_End
_08098C16:
	ldr r0, _08098C34  @ sub_8098BA8
	bl GetParallelWorker
	bl Proc_End
	ldr r0, _08098C38  @ sub_8098BC8
	bl GetParallelWorker
	bl Proc_End
	pop {r0}
	bx r0
	.align 2, 0
_08098C30: .4byte sub_8098B48
_08098C34: .4byte sub_8098BA8
_08098C38: .4byte sub_8098BC8

	THUMB_FUNC_END sub_8098BE8

	THUMB_FUNC_START sub_8098C3C
sub_8098C3C: @ 0x08098C3C
	push {r4, r5, r6, lr}
	sub sp, #0x10
	adds r2, r0, #0
	adds r4, r1, #0
	mov r1, sp
	ldr r0, _08098C80  @ gUnknown_08205C34
	ldm r0!, {r3, r5, r6}
	stm r1!, {r3, r5, r6}
	ldr r0, [r0]
	str r0, [r1]
	ldr r0, _08098C84  @ gUnknown_08A1D8D0
	movs r1, #0xc0
	lsls r1, r1, #0x13
	adds r2, r2, r1
	adds r1, r2, #0
	bl CopyDataWithPossibleUncomp
	ldr r0, _08098C88  @ gRAMChapterData
	adds r0, #0x41
	ldrb r1, [r0]
	movs r0, #0xc
	ands r0, r1
	add r0, sp
	ldr r0, [r0]
	lsls r4, r4, #5
	adds r1, r4, #0
	movs r2, #0x20
	bl CopyToPaletteBuffer
	add sp, #0x10
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08098C80: .4byte gUnknown_08205C34
_08098C84: .4byte gUnknown_08A1D8D0
_08098C88: .4byte gRAMChapterData

	THUMB_FUNC_END sub_8098C3C

	THUMB_FUNC_START sub_8098C8C
sub_8098C8C: @ 0x08098C8C
	push {r4, lr}
	adds r2, r0, #0
	adds r4, r1, #0
	ldr r0, _08098CB4  @ gUnknown_08A1D7DC
	ldr r1, _08098CB8  @ 0x06010000
	adds r2, r2, r1
	adds r1, r2, #0
	bl CopyDataWithPossibleUncomp
	ldr r0, _08098CBC  @ gUiFramePaletteD
	adds r4, #0x10
	lsls r4, r4, #5
	adds r1, r4, #0
	movs r2, #0x20
	bl CopyToPaletteBuffer
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08098CB4: .4byte gUnknown_08A1D7DC
_08098CB8: .4byte 0x06010000
_08098CBC: .4byte gUiFramePaletteD

	THUMB_FUNC_END sub_8098C8C

	THUMB_FUNC_START sub_8098CC0
sub_8098CC0: @ 0x08098CC0
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r6, r0, #0
	bl LoadUiFrameGraphics
	movs r0, #1
	movs r1, #0
	movs r2, #4
	bl BG_SetPosition
	adds r0, r6, #0
	bl sub_809A08C
	movs r0, #0
	bl BG_GetMapBuffer
	movs r1, #0
	bl BG_Fill
	movs r0, #1
	bl BG_GetMapBuffer
	movs r1, #0
	bl BG_Fill
	movs r0, #2
	bl BG_GetMapBuffer
	movs r1, #0
	bl BG_Fill
	movs r0, #0xc0
	lsls r0, r0, #7
	movs r1, #5
	bl sub_8098C3C
	movs r0, #0x80
	lsls r0, r0, #4
	movs r1, #0xa
	bl sub_8098C8C
	ldr r0, _08098D78  @ gUnknown_08A1B8B8
	ldr r4, _08098D7C  @ gGenericBuffer
	adds r1, r4, #0
	bl CopyDataWithPossibleUncomp
	ldr r0, _08098D80  @ gBG1TilemapBuffer
	movs r2, #0x80
	lsls r2, r2, #5
	adds r1, r4, #0
	bl CallARM_FillTileRect
	ldr r0, _08098D84  @ gUiFramePaletteD
	movs r1, #0x40
	movs r2, #0x20
	bl CopyToPaletteBuffer
	adds r5, r6, #0
	adds r5, #0x2a
	ldrb r0, [r5]
	bl GetUnitFromPrepList
	adds r1, r0, #0
	ldr r0, _08098D88  @ 0x00000503
	str r0, [sp]
	movs r0, #0
	movs r2, #0x3c
	movs r3, #0x4c
	bl sub_8099E98
	ldr r4, _08098D8C  @ gUnknown_02013510
	ldr r7, _08098D90  @ gUnknown_02022EEC
	ldrb r0, [r5]
	bl GetUnitFromPrepList
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r7, #0
	movs r3, #2
	bl sub_8099F7C
	ldr r0, _08098D94  @ gGMData
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08098D98
	adds r0, r7, #0
	subs r0, #0x20
	bl sub_8098A74
	b _08098DA0
	.align 2, 0
_08098D78: .4byte gUnknown_08A1B8B8
_08098D7C: .4byte gGenericBuffer
_08098D80: .4byte gBG1TilemapBuffer
_08098D84: .4byte gUiFramePaletteD
_08098D88: .4byte 0x00000503
_08098D8C: .4byte gUnknown_02013510
_08098D90: .4byte gUnknown_02022EEC
_08098D94: .4byte gGMData
_08098D98:
	adds r0, r7, #0
	adds r0, #0x60
	bl sub_8098A04
_08098DA0:
	adds r1, r6, #0
	adds r1, #0x32
	movs r0, #0
	strb r0, [r1]
	adds r0, r6, #0
	adds r0, #0x2a
	ldrb r5, [r0]
	adds r0, r5, #0
	movs r1, #3
	bl __umodsi3
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x12
	adds r4, #0x18
	adds r0, r5, #0
	movs r1, #3
	bl __udivsi3
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x14
	ldrh r0, [r6, #0x34]
	subs r0, #4
	subs r1, r1, r0
	movs r3, #0x80
	lsls r3, r3, #4
	adds r0, r4, #0
	movs r2, #7
	bl sub_80AD51C
	adds r0, r6, #0
	movs r1, #0
	bl sub_809A504
	bl sub_80ACAE4
	bl sub_80ACAA4
	movs r0, #0x78
	movs r1, #0x8c
	movs r2, #9
	adds r3, r6, #0
	bl StartHelpPromptSprite
	bl sub_8098BE8
	ldr r0, _08098E14  @ gGMData
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08098E1C
	ldr r0, _08098E18  @ sub_8098B68
	adds r1, r6, #0
	bl StartParallelWorker
	b _08098E24
	.align 2, 0
_08098E14: .4byte gGMData
_08098E18: .4byte sub_8098B68
_08098E1C:
	ldr r0, _08098E3C  @ sub_8098B48
	adds r1, r6, #0
	bl StartParallelWorker
_08098E24:
	bl sub_80985B8
	bl sub_8098590
	movs r0, #7
	bl BG_EnableSyncByMask
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08098E3C: .4byte sub_8098B48

	THUMB_FUNC_END sub_8098CC0

	THUMB_FUNC_START sub_8098E40
sub_8098E40: @ 0x08098E40
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	mov r3, r8
	adds r3, #0x2a
	ldrb r7, [r3]
	ldr r0, _08098F1C  @ gKeyStatusPtr
	ldr r2, [r0]
	ldrh r5, [r2, #6]
	mov r4, r8
	adds r4, #0x31
	movs r0, #4
	strb r0, [r4]
	ldrh r1, [r2, #4]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08098E6E
	ldrh r5, [r2, #4]
	movs r0, #8
	strb r0, [r4]
_08098E6E:
	movs r0, #0x40
	ands r0, r5
	cmp r0, #0
	beq _08098E80
	ldrb r0, [r3]
	subs r0, #3
	cmp r0, #0
	blt _08098E80
	strb r0, [r3]
_08098E80:
	movs r0, #0x80
	ands r0, r5
	mov r6, r8
	adds r6, #0x2a
	cmp r0, #0
	beq _08098E9E
	ldrb r4, [r6]
	adds r4, #3
	bl PrepGetUnitAmount
	cmp r4, r0
	bge _08098E9E
	ldrb r0, [r6]
	adds r0, #3
	strb r0, [r6]
_08098E9E:
	movs r0, #0x20
	ands r0, r5
	cmp r0, #0
	beq _08098EBA
	ldrb r4, [r6]
	adds r0, r4, #0
	movs r1, #3
	bl __umodsi3
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08098EBA
	subs r0, r4, #1
	strb r0, [r6]
_08098EBA:
	movs r0, #0x10
	ands r5, r0
	cmp r5, #0
	beq _08098EE4
	ldrb r4, [r6]
	adds r0, r4, #0
	movs r1, #3
	bl __umodsi3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bhi _08098EE4
	adds r4, #1
	bl PrepGetUnitAmount
	cmp r4, r0
	bge _08098EE4
	ldrb r0, [r6]
	adds r0, #1
	strb r0, [r6]
_08098EE4:
	ldrb r0, [r6]
	cmp r0, r7
	beq _08098FA0
	movs r1, #3
	bl __udivsi3
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x14
	bl PrepGetUnitAmount
	subs r0, #1
	movs r1, #3
	bl __divsi3
	lsls r2, r0, #4
	mov r0, r8
	ldrh r1, [r0, #0x34]
	subs r0, r4, r1
	cmp r0, #0x20
	ble _08098F20
	adds r0, r1, #0
	adds r0, #0x30
	cmp r0, r2
	bge _08098F20
	lsrs r1, r1, #4
	adds r1, #4
	b _08098F34
	.align 2, 0
_08098F1C: .4byte gKeyStatusPtr
_08098F20:
	mov r1, r8
	ldrh r0, [r1, #0x34]
	subs r1, r4, r0
	adds r7, r0, #0
	cmp r1, #0xf
	bgt _08098F54
	cmp r7, #0
	beq _08098F54
	lsrs r1, r7, #4
	subs r1, #1
_08098F34:
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov r0, r8
	movs r2, #0
	bl sub_809A114
	ldrb r0, [r6]
	movs r1, #3
	bl __umodsi3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x12
	adds r0, #0x18
	bl sub_80AD4E4
	b _08098F84
_08098F54:
	ldrb r5, [r6]
	adds r0, r5, #0
	movs r1, #3
	bl __umodsi3
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x12
	adds r4, #0x18
	adds r0, r5, #0
	movs r1, #3
	bl __udivsi3
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x14
	subs r0, r7, #4
	subs r1, r1, r0
	movs r3, #0x80
	lsls r3, r3, #4
	adds r0, r4, #0
	movs r2, #7
	bl sub_80AD51C
_08098F84:
	ldr r0, _08098F9C  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08098F96
	movs r0, #0x65
	bl m4aSongNumStart
_08098F96:
	movs r0, #1
	b _08098FA2
	.align 2, 0
_08098F9C: .4byte gRAMChapterData
_08098FA0:
	movs r0, #0
_08098FA2:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8098E40

	THUMB_FUNC_START sub_8098FAC
sub_8098FAC: @ 0x08098FAC
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	movs r1, #3
	bl __udivsi3
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x14
	bl PrepGetUnitAmount
	subs r0, #1
	movs r1, #3
	bl __divsi3
	lsls r2, r0, #4
	ldrh r1, [r6, #0x34]
	subs r0, r7, r1
	cmp r0, #0x20
	ble _0809904C
	adds r0, r1, #0
	adds r0, #0x30
	cmp r0, r2
	bge _0809904C
	adds r0, r6, #0
	adds r0, #0x31
	ldrb r2, [r0]
	adds r2, r1, r2
	strh r2, [r6, #0x34]
	ldr r1, _080990D0  @ 0x0000FFD8
	subs r2, #4
	movs r0, #0xff
	ands r2, r0
	movs r0, #2
	bl BG_SetPosition
	adds r1, r6, #0
	adds r1, #0x2b
	ldrb r0, [r1]
	cmp r0, #0xff
	beq _0809902C
	adds r5, r0, #0
	movs r1, #3
	bl __umodsi3
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x12
	adds r4, #0x18
	adds r0, r5, #0
	movs r1, #3
	bl __udivsi3
	adds r2, r0, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x14
	ldrh r0, [r6, #0x34]
	subs r0, #4
	subs r2, r2, r0
	movs r0, #0
	adds r1, r4, #0
	movs r3, #2
	bl sub_80AC9D4
_0809902C:
	ldrh r4, [r6, #0x34]
	bl PrepGetUnitAmount
	subs r0, #1
	movs r1, #3
	bl __divsi3
	adds r2, r0, #0
	adds r2, #1
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #6
	adds r1, r4, #0
	movs r3, #4
	bl sub_80976CC
_0809904C:
	ldrh r1, [r6, #0x34]
	subs r0, r7, r1
	cmp r0, #0xf
	bgt _080990C8
	cmp r1, #0
	beq _080990C8
	adds r0, r6, #0
	adds r0, #0x31
	ldrb r2, [r0]
	subs r2, r1, r2
	strh r2, [r6, #0x34]
	ldr r1, _080990D0  @ 0x0000FFD8
	subs r2, #4
	movs r0, #0xff
	ands r2, r0
	movs r0, #2
	bl BG_SetPosition
	adds r1, r6, #0
	adds r1, #0x2b
	ldrb r0, [r1]
	cmp r0, #0xff
	beq _080990A8
	adds r5, r0, #0
	movs r1, #3
	bl __umodsi3
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x12
	adds r4, #0x18
	adds r0, r5, #0
	movs r1, #3
	bl __udivsi3
	adds r2, r0, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x14
	ldrh r0, [r6, #0x34]
	subs r0, #4
	subs r2, r2, r0
	movs r0, #0
	adds r1, r4, #0
	movs r3, #2
	bl sub_80AC9D4
_080990A8:
	ldrh r4, [r6, #0x34]
	bl PrepGetUnitAmount
	subs r0, #1
	movs r1, #3
	bl __divsi3
	adds r2, r0, #0
	adds r2, #1
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #6
	adds r1, r4, #0
	movs r3, #4
	bl sub_80976CC
_080990C8:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080990D0: .4byte 0x0000FFD8

	THUMB_FUNC_END sub_8098FAC

	THUMB_FUNC_START sub_80990D4
sub_80990D4: @ 0x080990D4
	push {r4, lr}
	adds r4, r0, #0
	bl sub_80989BC
	movs r0, #0x31
	bl SetStatScreenConfig
	adds r0, r4, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	bl GetUnitFromPrepList
	adds r1, r4, #0
	bl StartStatScreen
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80990D4

	THUMB_FUNC_START sub_8099100
sub_8099100: @ 0x08099100
	push {r4, lr}
	adds r4, r0, #0
	bl sub_8098620
	bl GetLatestUnitIndexInPrepListByUId
	adds r1, r4, #0
	adds r1, #0x2a
	strb r0, [r1]
	adds r0, r4, #0
	bl sub_809A08C
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8099100

	THUMB_FUNC_START sub_8099120
sub_8099120: @ 0x08099120
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r6, r0, #0
	ldrh r0, [r6, #0x34]
	movs r1, #0xf
	ands r0, r1
	cmp r0, #0
	beq _08099132
	b _0809930E
_08099132:
	ldr r0, _0809914C  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08099150
	adds r0, r6, #0
	bl Proc_Break
	b _08099314
	.align 2, 0
_0809914C: .4byte gKeyStatusPtr
_08099150:
	movs r2, #1
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	bne _0809915C
	b _08099288
_0809915C:
	ldr r0, _080991A4  @ gGMData
	ldrb r1, [r0]
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	beq _08099202
	bl sub_80C4070
	cmp r0, #2
	beq _080991A8
	cmp r0, #3
	bne _080991FC
	adds r4, r6, #0
	adds r4, #0x2a
	ldrb r0, [r4]
	adds r5, r6, #0
	adds r5, #0x2b
	strb r0, [r5]
	ldrb r7, [r4]
	adds r0, r7, #0
	movs r1, #3
	bl __umodsi3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bhi _08099230
	bl PrepGetUnitAmount
	subs r0, #1
	cmp r7, r0
	bge _08099230
	ldrb r0, [r4]
	adds r0, #1
	b _08099234
	.align 2, 0
_080991A4: .4byte gGMData
_080991A8:
	adds r0, r6, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	bl GetUnitFromPrepList
	movs r1, #0x72
	bl UnitHasItem
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080991E0
	ldr r0, _080991DC  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080991D0
	movs r0, #0x6a
	bl m4aSongNumStart
_080991D0:
	adds r0, r6, #0
	movs r1, #0xd
	bl Proc_Goto
	b _08099314
	.align 2, 0
_080991DC: .4byte gRAMChapterData
_080991E0:
	ldr r0, _080991F8  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	bge _080991EE
	b _08099314
_080991EE:
	movs r0, #0x6c
	bl m4aSongNumStart
	b _08099314
	.align 2, 0
_080991F8: .4byte gRAMChapterData
_080991FC:
	adds r0, r6, #0
	movs r1, #0xd
	b _0809926A
_08099202:
	adds r4, r6, #0
	adds r4, #0x2a
	ldrb r0, [r4]
	adds r5, r6, #0
	adds r5, #0x2b
	strb r0, [r5]
	ldrb r7, [r4]
	adds r0, r7, #0
	movs r1, #3
	bl __umodsi3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bhi _08099230
	bl PrepGetUnitAmount
	subs r0, #1
	cmp r7, r0
	bge _08099230
	ldrb r0, [r4]
	adds r0, #1
	b _08099234
_08099230:
	ldrb r0, [r4]
	subs r0, #1
_08099234:
	strb r0, [r4]
	ldrb r5, [r5]
	adds r0, r5, #0
	movs r1, #3
	bl __umodsi3
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x12
	adds r4, #0x18
	adds r0, r5, #0
	movs r1, #3
	bl __udivsi3
	adds r2, r0, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x14
	ldrh r0, [r6, #0x34]
	subs r0, #4
	subs r2, r2, r0
	movs r0, #0
	adds r1, r4, #0
	movs r3, #2
	bl sub_80AC9D4
	adds r0, r6, #0
	movs r1, #2
_0809926A:
	bl Proc_Goto
	ldr r0, _08099284  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08099314
	movs r0, #0x6a
	bl m4aSongNumStart
	b _08099314
	.align 2, 0
_08099284: .4byte gRAMChapterData
_08099288:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080992CC
	ldr r0, _080992C4  @ gGMData
	ldrb r1, [r0]
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	beq _080992A8
	adds r2, r6, #0
	adds r2, #0x29
	ldrb r0, [r2]
	movs r1, #1
	orrs r0, r1
	strb r0, [r2]
_080992A8:
	adds r0, r6, #0
	movs r1, #0xd
	bl Proc_Goto
	ldr r0, _080992C8  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08099314
	movs r0, #0x6b
	bl m4aSongNumStart
	b _08099314
	.align 2, 0
_080992C4: .4byte gGMData
_080992C8: .4byte gRAMChapterData
_080992CC:
	adds r0, r6, #0
	bl sub_8098E40
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809930E
	adds r7, r6, #0
	adds r7, #0x2a
	ldrb r0, [r7]
	bl GetUnitFromPrepList
	adds r1, r0, #0
	ldr r0, _0809931C  @ 0x00000503
	str r0, [sp]
	movs r0, #0
	movs r2, #0x3c
	movs r3, #0x4c
	bl sub_8099E98
	ldr r4, _08099320  @ gUnknown_02013510
	ldr r5, _08099324  @ gUnknown_02022EEC
	ldrb r0, [r7]
	bl GetUnitFromPrepList
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	movs r3, #2
	bl sub_8099F7C
	movs r0, #1
	bl BG_EnableSyncByMask
_0809930E:
	adds r0, r6, #0
	bl sub_8098FAC
_08099314:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809931C: .4byte 0x00000503
_08099320: .4byte gUnknown_02013510
_08099324: .4byte gUnknown_02022EEC

	THUMB_FUNC_END sub_8099120

	THUMB_FUNC_START sub_8099328
sub_8099328: @ 0x08099328
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	mov r9, r0
	mov r8, r1
	mov sl, r2
	mov r0, r8
	movs r1, #0xa
	movs r2, #6
	movs r3, #0
	bl TileMap_FillRect
	ldr r7, _08099454  @ gUnknown_02013560
	adds r0, r7, #0
	bl Text_Clear
	bl PrepGetUnitAmount
	movs r4, #0
	cmp r0, #1
	bgt _08099358
	movs r4, #1
_08099358:
	ldr r0, _08099458  @ 0x00000594
	bl GetStringFromIndex
	adds r3, r0, #0
	adds r0, r7, #0
	movs r1, #0
	adds r2, r4, #0
	bl Text_InsertString
	bl PrepGetUnitAmount
	movs r4, #0
	cmp r0, #1
	bgt _08099376
	movs r4, #1
_08099376:
	ldr r0, _0809945C  @ 0x00000595
	bl GetStringFromIndex
	adds r3, r0, #0
	adds r0, r7, #0
	movs r1, #0x20
	adds r2, r4, #0
	bl Text_InsertString
	mov r1, r8
	adds r1, #0x40
	adds r0, r7, #0
	bl Text_Draw
	adds r5, r7, #0
	adds r5, #8
	adds r0, r5, #0
	bl Text_Clear
	mov r0, sl
	bl CanUnitPrepScreenUse
	movs r4, #0
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080993AC
	movs r4, #1
_080993AC:
	ldr r0, _08099460  @ 0x00000596
	bl GetStringFromIndex
	adds r3, r0, #0
	adds r0, r5, #0
	movs r1, #0
	adds r2, r4, #0
	bl Text_InsertString
	movs r6, #0
	mov r4, r9
	adds r4, #0x2c
	movs r0, #0
	ldrsb r0, [r4, r0]
	cmp r0, #0
	bne _080993CE
	movs r6, #1
_080993CE:
	ldr r0, _08099464  @ 0x0000059A
	bl GetStringFromIndex
	adds r3, r0, #0
	adds r0, r5, #0
	movs r1, #0x20
	adds r2, r6, #0
	bl Text_InsertString
	mov r1, r8
	adds r1, #0xc0
	adds r0, r5, #0
	bl Text_Draw
	adds r5, r7, #0
	adds r5, #0x10
	adds r0, r5, #0
	bl Text_Clear
	movs r6, #0
	movs r0, #0
	ldrsb r0, [r4, r0]
	cmp r0, #0
	bne _08099400
	movs r6, #1
_08099400:
	movs r0, #0xb3
	lsls r0, r0, #3
	bl GetStringFromIndex
	adds r3, r0, #0
	adds r0, r5, #0
	movs r1, #0
	adds r2, r6, #0
	bl Text_InsertString
	ldr r0, _08099468  @ gGMData
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08099470
	adds r6, r5, #0
	movs r5, #0
	movs r0, #0
	ldrsb r0, [r4, r0]
	cmp r0, #0
	beq _0809943E
	mov r0, sl
	bl GetUnitItemCount
	cmp r0, #0
	ble _0809943E
	bl CheckSomethingSomewhere
	cmp r0, #0
	beq _08099440
_0809943E:
	movs r5, #1
_08099440:
	ldr r0, _0809946C  @ 0x00000597
	bl GetStringFromIndex
	adds r3, r0, #0
	adds r0, r6, #0
	movs r1, #0x20
	adds r2, r5, #0
	bl Text_InsertString
	b _080994A2
	.align 2, 0
_08099454: .4byte gUnknown_02013560
_08099458: .4byte 0x00000594
_0809945C: .4byte 0x00000595
_08099460: .4byte 0x00000596
_08099464: .4byte 0x0000059A
_08099468: .4byte gGMData
_0809946C: .4byte 0x00000597
_08099470:
	bl CheckSomethingSomewhere
	cmp r0, #0
	beq _08099490
	ldr r0, _0809948C  @ 0x00000599
	bl GetStringFromIndex
	adds r3, r0, #0
	adds r0, r5, #0
	movs r1, #0x20
	movs r2, #1
	bl Text_InsertString
	b _080994A2
	.align 2, 0
_0809948C: .4byte 0x00000599
_08099490:
	ldr r0, _080994BC  @ 0x00000599
	bl GetStringFromIndex
	adds r3, r0, #0
	adds r0, r5, #0
	movs r1, #0x20
	movs r2, #0
	bl Text_InsertString
_080994A2:
	ldr r0, _080994C0  @ gUnknown_02013570
	movs r1, #0xa0
	lsls r1, r1, #1
	add r1, r8
	bl Text_Draw
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080994BC: .4byte 0x00000599
_080994C0: .4byte gUnknown_02013570

	THUMB_FUNC_END sub_8099328

	THUMB_FUNC_START sub_80994C4
sub_80994C4: @ 0x080994C4
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	sub sp, #8
	adds r4, r0, #0
	movs r0, #0x2b
	adds r0, r0, r4
	mov r9, r0
	ldrb r0, [r0]
	bl GetUnitFromPrepList
	adds r6, r0, #0
	adds r4, #0x32
	movs r1, #0
	mov r8, r1
	movs r0, #1
	strb r0, [r4]
	movs r0, #0
	bl BG_GetMapBuffer
	movs r1, #0
	bl BG_Fill
	ldr r5, _080995B8  @ gUnknown_02013510
	ldr r7, _080995BC  @ gUnknown_02022EEC
	mov r2, r9
	ldrb r0, [r2]
	bl GetUnitFromPrepList
	adds r2, r0, #0
	adds r0, r5, #0
	adds r1, r7, #0
	movs r3, #0
	bl sub_8099F7C
	ldr r0, _080995C0  @ gUnknown_08A1B8B8
	ldr r4, _080995C4  @ gGenericBuffer
	adds r1, r4, #0
	bl CopyDataWithPossibleUncomp
	ldr r0, _080995C8  @ gBG1TilemapBuffer
	movs r2, #0x80
	lsls r2, r2, #5
	adds r1, r4, #0
	bl CallARM_FillTileRect
	movs r0, #0
	movs r1, #0x1f
	bl sub_8098570
	adds r0, r6, #0
	bl GetUnitPortraitId
	ldr r3, _080995CC  @ 0xFFFFFEC0
	adds r1, r7, r3
	movs r2, #0x9c
	lsls r2, r2, #2
	mov r3, r8
	str r3, [sp]
	movs r3, #3
	bl PutFaceChibi
	adds r5, #0x80
	adds r0, r5, #0
	bl Text_Clear
	ldr r0, [r6]
	ldrh r0, [r0]
	bl GetStringFromIndex
	adds r4, r0, #0
	movs r0, #0x28
	adds r1, r4, #0
	bl GetStringTextCenteredPos
	adds r3, r0, #0
	ldr r0, _080995D0  @ 0xFFFFFECC
	adds r1, r7, r0
	mov r2, r8
	str r2, [sp]
	str r4, [sp, #4]
	adds r0, r5, #0
	movs r2, #0
	bl DrawTextInline
	adds r0, r7, #0
	subs r0, #0xb6
	movs r1, #3
	movs r2, #0x24
	movs r3, #0x25
	bl sub_8004D5C
	adds r0, r7, #0
	subs r0, #0xae
	movs r1, #3
	movs r2, #0x1d
	bl sub_8004B0C
	adds r0, r7, #0
	subs r0, #0xb0
	movs r2, #8
	ldrsb r2, [r6, r2]
	movs r1, #2
	bl DrawDecNumber
	adds r0, r7, #0
	subs r0, #0xaa
	ldrb r2, [r6, #9]
	movs r1, #2
	bl DrawDecNumber
	movs r0, #7
	bl BG_EnableSyncByMask
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080995B8: .4byte gUnknown_02013510
_080995BC: .4byte gUnknown_02022EEC
_080995C0: .4byte gUnknown_08A1B8B8
_080995C4: .4byte gGenericBuffer
_080995C8: .4byte gBG1TilemapBuffer
_080995CC: .4byte 0xFFFFFEC0
_080995D0: .4byte 0xFFFFFECC

	THUMB_FUNC_END sub_80994C4

	THUMB_FUNC_START sub_80995D4
sub_80995D4: @ 0x080995D4
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r0, _0809963C  @ gUnknown_02022F06
	movs r1, #0xc
	movs r2, #0x14
	movs r3, #0
	bl TileMap_FillRect
	movs r0, #0xc0
	lsls r0, r0, #7
	movs r1, #5
	bl sub_8098C3C
	movs r0, #0x80
	lsls r0, r0, #4
	movs r1, #0xa
	bl sub_8098C8C
	adds r0, r6, #0
	bl sub_80994C4
	adds r0, r6, #0
	adds r0, #0x2b
	ldrb r5, [r0]
	adds r0, r5, #0
	movs r1, #3
	bl __umodsi3
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x12
	adds r4, #0x14
	adds r0, r5, #0
	movs r1, #3
	bl __udivsi3
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x14
	ldrh r0, [r6, #0x34]
	subs r0, #4
	subs r1, r1, r0
	adds r0, r4, #0
	bl sub_809A21C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08099640
	bl sub_80ACAC8
	b _08099644
	.align 2, 0
_0809963C: .4byte gUnknown_02022F06
_08099640:
	bl sub_80ACAE4
_08099644:
	bl sub_8098BE8
	movs r0, #1
	bl BG_EnableSyncByMask
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80995D4

	THUMB_FUNC_START sub_8099654
sub_8099654: @ 0x08099654
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r5, _080996A8  @ gUnknown_02022F0E
	adds r0, #0x2b
	ldrb r0, [r0]
	bl GetUnitFromPrepList
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_8099328
	ldr r0, _080996AC  @ sub_8098BC8
	adds r1, r4, #0
	bl StartParallelWorker
	movs r0, #0x78
	movs r1, #0x8c
	movs r2, #9
	adds r3, r4, #0
	bl StartHelpPromptSprite
	adds r4, #0x2e
	ldrb r1, [r4]
	movs r0, #1
	ands r0, r1
	lsls r0, r0, #5
	adds r0, #0x90
	lsrs r1, r1, #1
	lsls r1, r1, #4
	adds r1, #0x54
	movs r3, #0x80
	lsls r3, r3, #3
	movs r2, #3
	bl sub_80AD51C
	movs r0, #1
	bl BG_EnableSyncByMask
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080996A8: .4byte gUnknown_02022F0E
_080996AC: .4byte sub_8098BC8

	THUMB_FUNC_END sub_8099654

	THUMB_FUNC_START sub_80996B0
sub_80996B0: @ 0x080996B0
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r0, #0x2b
	ldrb r0, [r0]
	bl GetUnitFromPrepList
	adds r5, r0, #0
	adds r0, r4, #0
	movs r1, #0
	bl sub_809A504
	ldr r0, _080996E0  @ gUnknown_02013510
	ldr r1, _080996E4  @ gUnknown_02022EEC
	adds r2, r5, #0
	movs r3, #0
	bl sub_8099F7C
	movs r0, #4
	bl BG_EnableSyncByMask
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080996E0: .4byte gUnknown_02013510
_080996E4: .4byte gUnknown_02022EEC

	THUMB_FUNC_END sub_80996B0

	THUMB_FUNC_START sub_80996E8
sub_80996E8: @ 0x080996E8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	adds r6, r5, #0
	adds r6, #0x2e
	ldrb r0, [r6]
	mov r8, r0
	adds r4, r5, #0
	adds r4, #0x2d
	ldrb r0, [r4]
	cmp r0, #0xff
	beq _08099704
	b _08099930
_08099704:
	ldr r0, _08099734  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08099754
	mov r1, r8
	strb r1, [r4]
	ldr r0, _08099738  @ gGMData
	ldrb r1, [r0]
	movs r2, #1
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	beq _0809973C
	ldrb r1, [r6]
	adds r0, r2, #0
	ands r0, r1
	lsls r0, r0, #5
	adds r0, #0x88
	b _08099A4C
	.align 2, 0
_08099734: .4byte gKeyStatusPtr
_08099738: .4byte gGMData
_0809973C:
	ldrb r1, [r6]
	adds r0, r2, #0
	ands r0, r1
	lsls r0, r0, #5
	adds r0, #0x88
	lsrs r1, r1, #1
	lsls r1, r1, #4
	adds r1, #0x54
	ldr r3, _08099750  @ gUnknown_08A188F8
	b _08099A54
	.align 2, 0
_08099750: .4byte gUnknown_08A188F8
_08099754:
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _0809975E
	b _080998F0
_0809975E:
	mov r0, r8
	cmp r0, #5
	bls _08099766
	b _080998D4
_08099766:
	lsls r0, r0, #2
	ldr r1, _08099770  @ _08099774
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08099770: .4byte _08099774
_08099774: @ jump table
	.4byte _0809978C @ case 0
	.4byte _0809979C @ case 1
	.4byte _080997AC @ case 2
	.4byte _080997C8 @ case 3
	.4byte _08099854 @ case 4
	.4byte _08099868 @ case 5
_0809978C:
	bl PrepGetUnitAmount
	cmp r0, #1
	bgt _08099796
	b _080998D4
_08099796:
	adds r0, r5, #0
	movs r1, #4
	b _080998B4
_0809979C:
	bl PrepGetUnitAmount
	cmp r0, #1
	bgt _080997A6
	b _080998D4
_080997A6:
	adds r0, r5, #0
	movs r1, #8
	b _080998B4
_080997AC:
	adds r0, r5, #0
	adds r0, #0x2b
	ldrb r0, [r0]
	bl GetUnitFromPrepList
	bl CanUnitPrepScreenUse
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080997C2
	b _080998D4
_080997C2:
	adds r0, r5, #0
	movs r1, #9
	b _080998B4
_080997C8:
	bl CheckSomethingSomewhere
	cmp r0, #0
	beq _080997F8
	adds r0, r5, #0
	adds r0, #0x2b
	ldrb r0, [r0]
	bl GetUnitFromPrepList
	ldr r0, [r0, #0xc]
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	bne _080997F8
	subs r1, #9
	ldr r2, _080997F4  @ 0x0000088B
	adds r0, r1, #0
	adds r3, r5, #0
	bl sub_8097DA8
	b _08099A90
	.align 2, 0
_080997F4: .4byte 0x0000088B
_080997F8:
	adds r0, r5, #0
	adds r0, #0x2c
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _080998D4
	adds r6, r5, #0
	adds r6, #0x2b
	ldrb r0, [r6]
	bl GetUnitFromPrepList
	bl sub_809A538
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080998D4
	ldr r4, _0809984C  @ gUnknown_02022F0E
	ldrb r0, [r6]
	bl GetUnitFromPrepList
	adds r2, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_8099328
	ldr r5, _08099850  @ gUnknown_02013510
	subs r4, #0x22
	ldrb r0, [r6]
	bl GetUnitFromPrepList
	adds r2, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	movs r3, #0
	bl sub_8099F7C
	movs r0, #1
	bl BG_EnableSyncByMask
	b _080998B8
	.align 2, 0
_0809984C: .4byte gUnknown_02022F0E
_08099850: .4byte gUnknown_02013510
_08099854:
	adds r0, r5, #0
	adds r0, #0x2c
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _080998D4
	adds r0, r5, #0
	movs r1, #0xa
	b _080998B4
_08099868:
	ldr r0, _080998A4  @ gGMData
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080998A8
	adds r0, r5, #0
	adds r0, #0x2c
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _080998D4
	adds r0, r5, #0
	adds r0, #0x2b
	ldrb r0, [r0]
	bl GetUnitFromPrepList
	bl GetUnitItemCount
	cmp r0, #0
	ble _080998D4
	bl CheckSomethingSomewhere
	cmp r0, #0
	bne _080998D4
	adds r0, r5, #0
	movs r1, #0xb
	b _080998B4
	.align 2, 0
_080998A4: .4byte gGMData
_080998A8:
	bl CheckSomethingSomewhere
	cmp r0, #0
	bne _080998D4
	adds r0, r5, #0
	movs r1, #0xc
_080998B4:
	bl Proc_Goto
_080998B8:
	ldr r0, _080998D0  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	bge _080998C6
	b _08099A90
_080998C6:
	movs r0, #0x6a
	bl m4aSongNumStart
	b _08099A90
	.align 2, 0
_080998D0: .4byte gRAMChapterData
_080998D4:
	ldr r0, _080998EC  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	bge _080998E2
	b _08099A90
_080998E2:
	movs r0, #0x6c
	bl m4aSongNumStart
	b _08099A90
	.align 2, 0
_080998EC: .4byte gRAMChapterData
_080998F0:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08099948
	adds r2, r5, #0
	adds r2, #0x2b
	ldrb r0, [r2]
	adds r1, r5, #0
	adds r1, #0x2a
	strb r0, [r1]
	movs r0, #0xff
	strb r0, [r2]
	movs r0, #0
	bl sub_80ACA84
	ldr r0, _0809992C  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08099920
	movs r0, #0x6b
	bl m4aSongNumStart
_08099920:
	adds r0, r5, #0
	movs r1, #0
	bl Proc_Goto
	b _08099A90
	.align 2, 0
_0809992C: .4byte gRAMChapterData
_08099930:
	ldr r0, _0809996C  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0x81
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08099948
	bl CloseHelpBox
	movs r0, #0xff
	strb r0, [r4]
_08099948:
	ldr r2, _0809996C  @ gKeyStatusPtr
	ldr r6, [r2]
	ldrh r1, [r6, #6]
	movs r7, #0x20
	adds r0, r7, #0
	ands r0, r1
	adds r4, r5, #0
	adds r4, #0x2e
	cmp r0, #0
	beq _0809997E
	ldrb r3, [r4]
	movs r0, #1
	ands r0, r3
	cmp r0, #0
	beq _08099970
	subs r0, r3, #1
	b _0809997C
	.align 2, 0
_0809996C: .4byte gKeyStatusPtr
_08099970:
	ldrh r1, [r6, #8]
	adds r0, r7, #0
	ands r0, r1
	cmp r0, #0
	beq _0809997E
	adds r0, r3, #1
_0809997C:
	strb r0, [r4]
_0809997E:
	ldr r6, [r2]
	ldrh r1, [r6, #6]
	movs r7, #0x10
	adds r0, r7, #0
	ands r0, r1
	cmp r0, #0
	beq _080999A8
	ldrb r3, [r4]
	movs r0, #1
	ands r0, r3
	cmp r0, #0
	bne _0809999A
	adds r0, r3, #1
	b _080999A6
_0809999A:
	ldrh r1, [r6, #8]
	adds r0, r7, #0
	ands r0, r1
	cmp r0, #0
	beq _080999A8
	subs r0, r3, #1
_080999A6:
	strb r0, [r4]
_080999A8:
	ldr r6, [r2]
	ldrh r1, [r6, #6]
	movs r7, #0x40
	adds r0, r7, #0
	ands r0, r1
	cmp r0, #0
	beq _080999CE
	ldrb r3, [r4]
	cmp r3, #1
	bls _080999C0
	subs r0, r3, #2
	b _080999CC
_080999C0:
	ldrh r1, [r6, #8]
	adds r0, r7, #0
	ands r0, r1
	cmp r0, #0
	beq _080999CE
	adds r0, r3, #4
_080999CC:
	strb r0, [r4]
_080999CE:
	ldr r2, [r2]
	ldrh r1, [r2, #6]
	movs r6, #0x80
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	beq _080999F4
	ldrb r3, [r4]
	cmp r3, #3
	bhi _080999E6
	adds r0, r3, #2
	b _080999F2
_080999E6:
	ldrh r1, [r2, #8]
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	beq _080999F4
	subs r0, r3, #4
_080999F2:
	strb r0, [r4]
_080999F4:
	adds r6, r4, #0
	ldrb r1, [r6]
	cmp r8, r1
	beq _08099A90
	ldr r0, _08099A64  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08099A0E
	movs r0, #0x65
	bl m4aSongNumStart
_08099A0E:
	ldrb r1, [r6]
	movs r7, #1
	adds r0, r7, #0
	ands r0, r1
	lsls r0, r0, #5
	adds r0, #0x90
	lsrs r1, r1, #1
	lsls r1, r1, #4
	adds r1, #0x54
	movs r3, #0x80
	lsls r3, r3, #3
	movs r2, #3
	bl sub_80AD51C
	adds r0, r5, #0
	adds r0, #0x2d
	ldrb r0, [r0]
	cmp r0, #0xff
	beq _08099A90
	ldr r0, _08099A68  @ gGMData
	ldrb r1, [r0]
	adds r0, r7, #0
	ands r0, r1
	cmp r0, #0
	beq _08099A70
	ldrb r1, [r6]
	adds r0, r7, #0
	ands r0, r1
	movs r2, #0x26
	muls r0, r2, r0
	adds r0, #0x90
_08099A4C:
	lsrs r1, r1, #1
	lsls r1, r1, #4
	adds r1, #0x54
	ldr r3, _08099A6C  @ gUnknown_08A18910
_08099A54:
	ldrb r2, [r6]
	lsls r2, r2, #2
	adds r2, r2, r3
	ldr r2, [r2]
	bl StartHelpBox
	b _08099A90
	.align 2, 0
_08099A64: .4byte gRAMChapterData
_08099A68: .4byte gGMData
_08099A6C: .4byte gUnknown_08A18910
_08099A70:
	ldrb r1, [r4]
	adds r0, r7, #0
	ands r0, r1
	movs r2, #0x26
	muls r0, r2, r0
	adds r0, #0x90
	lsrs r1, r1, #1
	lsls r1, r1, #4
	adds r1, #0x54
	ldr r3, _08099A9C  @ gUnknown_08A188F8
	ldrb r2, [r4]
	lsls r2, r2, #2
	adds r2, r2, r3
	ldr r2, [r2]
	bl StartHelpBox
_08099A90:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08099A9C: .4byte gUnknown_08A188F8

	THUMB_FUNC_END sub_80996E8

	THUMB_FUNC_START sub_8099AA0
sub_8099AA0: @ 0x08099AA0
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	movs r0, #0
	bl BG_GetMapBuffer
	movs r1, #0
	bl BG_Fill
	ldr r4, _08099AF0  @ gUnknown_02013510
	ldr r5, _08099AF4  @ gUnknown_02022EEC
	adds r0, r6, #0
	adds r0, #0x2b
	ldrb r0, [r0]
	bl GetUnitFromPrepList
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	movs r3, #0
	bl sub_8099F7C
	adds r4, #0x28
	adds r5, #0x1e
	adds r6, #0x2a
	ldrb r0, [r6]
	bl GetUnitFromPrepList
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	movs r3, #0
	bl sub_8099F7C
	movs r0, #1
	bl BG_EnableSyncByMask
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08099AF0: .4byte gUnknown_02013510
_08099AF4: .4byte gUnknown_02022EEC

	THUMB_FUNC_END sub_8099AA0

	THUMB_FUNC_START sub_8099AF8
sub_8099AF8: @ 0x08099AF8
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #4
	mov r8, r0
	movs r0, #1
	movs r1, #0
	movs r2, #4
	bl BG_SetPosition
	movs r0, #1
	bl BG_GetMapBuffer
	movs r1, #0
	bl BG_Fill
	movs r0, #2
	bl BG_GetMapBuffer
	movs r1, #0
	bl BG_Fill
	ldr r0, _08099C3C  @ gBG0TilemapBuffer
	movs r1, #0x1f
	movs r2, #8
	movs r3, #0
	bl TileMap_FillRect
	movs r0, #0xc0
	lsls r0, r0, #7
	movs r1, #5
	bl sub_8098C3C
	ldr r0, _08099C40  @ gUnknown_08A1B8B8
	ldr r5, _08099C44  @ gGenericBuffer
	adds r1, r5, #0
	bl CopyDataWithPossibleUncomp
	ldr r4, _08099C48  @ gBG1TilemapBuffer
	movs r6, #0x80
	lsls r6, r6, #5
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r6, #0
	bl CallARM_FillTileRect
	ldr r0, _08099C4C  @ gUnknown_08A1B990
	adds r1, r5, #0
	bl CopyDataWithPossibleUncomp
	ldr r0, _08099C50  @ 0x0000025E
	adds r4, r4, r0
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r6, #0
	bl CallARM_FillTileRect
	mov r1, r8
	adds r1, #0x32
	movs r0, #0
	strb r0, [r1]
	mov r6, r8
	adds r6, #0x2a
	ldrb r5, [r6]
	adds r0, r5, #0
	movs r1, #3
	bl __umodsi3
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x12
	adds r4, #0x18
	adds r0, r5, #0
	movs r1, #3
	bl __udivsi3
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x14
	mov r2, r8
	ldrh r0, [r2, #0x34]
	subs r0, #4
	subs r1, r1, r0
	movs r3, #0x80
	lsls r3, r3, #4
	adds r0, r4, #0
	movs r2, #7
	bl sub_80AD51C
	mov r0, r8
	movs r1, #0
	bl sub_809A504
	movs r0, #7
	bl BG_EnableSyncByMask
	mov r4, r8
	adds r4, #0x2b
	ldrb r0, [r4]
	bl GetUnitFromPrepList
	adds r1, r0, #0
	ldr r0, _08099C54  @ 0x00000503
	str r0, [sp]
	movs r0, #0
	movs r2, #0x3c
	movs r3, #0x4c
	bl sub_8099E98
	ldrb r0, [r6]
	bl GetUnitFromPrepList
	adds r1, r0, #0
	ldr r0, _08099C58  @ 0x00000502
	str r0, [sp]
	movs r0, #1
	movs r2, #0xb4
	movs r3, #0x4c
	bl sub_8099E98
	ldrb r5, [r4]
	adds r0, r5, #0
	movs r1, #3
	bl __umodsi3
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x12
	adds r4, #0x18
	adds r0, r5, #0
	movs r1, #3
	bl __udivsi3
	adds r2, r0, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x14
	mov r1, r8
	ldrh r0, [r1, #0x34]
	subs r0, #4
	subs r2, r2, r0
	movs r0, #0
	adds r1, r4, #0
	movs r3, #2
	bl sub_80AC9D4
	ldr r0, _08099C5C  @ sub_8099AA0
	movs r1, #1
	mov r2, r8
	bl sub_80ACE20
	bl sub_80ACAE4
	bl sub_8098590
	bl EndHelpPromptSprite
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08099C3C: .4byte gBG0TilemapBuffer
_08099C40: .4byte gUnknown_08A1B8B8
_08099C44: .4byte gGenericBuffer
_08099C48: .4byte gBG1TilemapBuffer
_08099C4C: .4byte gUnknown_08A1B990
_08099C50: .4byte 0x0000025E
_08099C54: .4byte 0x00000503
_08099C58: .4byte 0x00000502
_08099C5C: .4byte sub_8099AA0

	THUMB_FUNC_END sub_8099AF8

	THUMB_FUNC_START sub_8099C60
sub_8099C60: @ 0x08099C60
	push {lr}
	bl sub_8098BE8
	movs r0, #1
	bl BG_EnableSyncByMask
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8099C60

	THUMB_FUNC_START sub_8099C70
sub_8099C70: @ 0x08099C70
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r6, r0, #0
	ldrh r0, [r6, #0x34]
	movs r1, #0xf
	ands r0, r1
	cmp r0, #0
	beq _08099C82
	b _08099D9C
_08099C82:
	ldr r0, _08099C9C  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08099CA0
	adds r0, r6, #0
	bl Proc_Break
	b _08099DA2
	.align 2, 0
_08099C9C: .4byte gKeyStatusPtr
_08099CA0:
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08099D10
	adds r5, r6, #0
	adds r5, #0x2a
	ldrb r0, [r5]
	bl GetUnitFromPrepList
	bl GetUnitItemCount
	adds r7, r0, #0
	adds r4, r6, #0
	adds r4, #0x2b
	ldrb r0, [r4]
	bl GetUnitFromPrepList
	bl GetUnitItemCount
	adds r1, r0, #0
	ldrb r0, [r5]
	ldrb r4, [r4]
	cmp r0, r4
	beq _08099CF8
	cmp r7, #0
	bgt _08099CD8
	cmp r1, #0
	ble _08099CF8
_08099CD8:
	adds r0, r6, #0
	movs r1, #6
	bl Proc_Goto
	ldr r0, _08099CF4  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08099DA2
	movs r0, #0x6a
	bl m4aSongNumStart
	b _08099DA2
	.align 2, 0
_08099CF4: .4byte gRAMChapterData
_08099CF8:
	ldr r0, _08099D0C  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08099DA2
	movs r0, #0x6c
	bl m4aSongNumStart
	b _08099DA2
	.align 2, 0
_08099D0C: .4byte gRAMChapterData
_08099D10:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08099D40
	movs r0, #1
	bl sub_8099F50
	adds r0, r6, #0
	movs r1, #2
	bl Proc_Goto
	ldr r0, _08099D3C  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08099DA2
	movs r0, #0x6b
	bl m4aSongNumStart
	b _08099DA2
	.align 2, 0
_08099D3C: .4byte gRAMChapterData
_08099D40:
	adds r0, r6, #0
	bl sub_8098E40
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08099D9C
	adds r7, r6, #0
	adds r7, #0x2a
	ldrb r0, [r7]
	bl GetUnitFromPrepList
	adds r1, r0, #0
	ldr r0, _08099DAC  @ 0x00000502
	str r0, [sp]
	movs r0, #1
	movs r2, #0xb4
	movs r3, #0x4c
	bl sub_8099E98
	ldr r4, _08099DB0  @ gUnknown_02013538
	ldr r5, _08099DB4  @ gUnknown_02022F0A
	ldrb r0, [r7]
	bl GetUnitFromPrepList
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	movs r3, #2
	bl sub_8099F7C
	subs r4, #0x28
	subs r5, #0x1e
	adds r0, r6, #0
	adds r0, #0x2b
	ldrb r0, [r0]
	bl GetUnitFromPrepList
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	movs r3, #1
	bl sub_8099F7C
	movs r0, #1
	bl BG_EnableSyncByMask
_08099D9C:
	adds r0, r6, #0
	bl sub_8098FAC
_08099DA2:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08099DAC: .4byte 0x00000502
_08099DB0: .4byte gUnknown_02013538
_08099DB4: .4byte gUnknown_02022F0A

	THUMB_FUNC_END sub_8099C70

	THUMB_FUNC_START sub_8099DB8
sub_8099DB8: @ 0x08099DB8
	push {r4, r5, lr}
	adds r4, r0, #0
	bl sub_80989BC
	adds r0, r4, #0
	adds r0, #0x2b
	ldrb r0, [r0]
	bl GetUnitFromPrepList
	adds r5, r0, #0
	adds r0, r4, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	bl GetUnitFromPrepList
	adds r1, r0, #0
	adds r0, r5, #0
	adds r2, r4, #0
	bl sub_809BE3C
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8099DB8

	THUMB_FUNC_START sub_8099DE8
sub_8099DE8: @ 0x08099DE8
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2b
	ldrb r0, [r0]
	bl GetUnitFromPrepList
	adds r1, r4, #0
	bl StartPrepItemUseScreen
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8099DE8

	THUMB_FUNC_START sub_8099E00
sub_8099E00: @ 0x08099E00
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2b
	ldrb r0, [r0]
	bl GetUnitFromPrepList
	adds r1, r4, #0
	bl sub_809EAD8
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8099E00

	THUMB_FUNC_START sub_8099E18
sub_8099E18: @ 0x08099E18
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2b
	ldrb r0, [r0]
	bl GetUnitFromPrepList
	adds r1, r4, #0
	bl sub_80A070C
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8099E18

	THUMB_FUNC_START sub_8099E30
sub_8099E30: @ 0x08099E30
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2b
	ldrb r0, [r0]
	bl GetUnitFromPrepList
	adds r1, r4, #0
	bl sub_809FD88
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8099E30

	THUMB_FUNC_START sub_8099E48
sub_8099E48: @ 0x08099E48
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2b
	ldrb r0, [r0]
	bl GetUnitFromPrepList
	ldr r1, _08099E64  @ gUnknown_08A188E4
	adds r2, r4, #0
	bl StartArmoryScreen
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08099E64: .4byte gUnknown_08A188E4

	THUMB_FUNC_END sub_8099E48

	THUMB_FUNC_START sub_8099E68
sub_8099E68: @ 0x08099E68
	push {lr}
	adds r2, r0, #0
	ldr r0, _08099E94  @ gGMData
	ldrb r1, [r0]
	movs r3, #1
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	beq _08099E8E
	adds r0, r2, #0
	adds r0, #0x29
	ldrb r1, [r0]
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	beq _08099E8E
	movs r0, #0
	bl sub_80C409C
_08099E8E:
	pop {r0}
	bx r0
	.align 2, 0
_08099E94: .4byte gGMData

	THUMB_FUNC_END sub_8099E68

	THUMB_FUNC_START sub_8099E98
sub_8099E98: @ 0x08099E98
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r4, r0, #0
	adds r6, r1, #0
	ldr r0, [sp, #0x20]
	lsls r2, r2, #0x10
	lsrs r7, r2, #0x10
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	mov r8, r3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r9, r0
	ldr r0, _08099EF8  @ gUnknown_08A189A4
	bl Proc_Find
	adds r5, r0, #0
	lsls r1, r4, #2
	adds r0, #0x44
	adds r0, r0, r1
	ldr r0, [r0]
	cmp r0, r6
	beq _08099EFC
	cmp r0, #0
	beq _08099ED6
	adds r0, r4, #0
	bl EndFaceById
_08099ED6:
	cmp r6, #0
	beq _08099F18
	adds r0, r6, #0
	bl GetUnitPortraitId
	adds r1, r0, #0
	lsls r2, r7, #0x10
	asrs r2, r2, #0x10
	mov r0, r8
	lsls r3, r0, #0x10
	asrs r3, r3, #0x10
	mov r0, r9
	str r0, [sp]
	adds r0, r4, #0
	bl StartFace2
	b _08099F18
	.align 2, 0
_08099EF8: .4byte gUnknown_08A189A4
_08099EFC:
	cmp r6, #0
	beq _08099F18
	lsls r1, r7, #0x10
	asrs r1, r1, #0x10
	mov r0, r8
	lsls r2, r0, #0x10
	asrs r2, r2, #0x10
	adds r0, r4, #0
	bl sub_8006618
	adds r0, r4, #0
	mov r1, r9
	bl SetFaceDisplayBitsById
_08099F18:
	lsls r1, r4, #2
	adds r0, r5, #0
	adds r0, #0x44
	adds r0, r0, r1
	str r6, [r0]
	lsls r1, r4, #1
	adds r0, r5, #0
	adds r0, #0x38
	adds r0, r0, r1
	strh r7, [r0]
	adds r0, r5, #0
	adds r0, #0x3c
	adds r0, r0, r1
	mov r2, r8
	strh r2, [r0]
	adds r0, r5, #0
	adds r0, #0x40
	adds r0, r0, r1
	mov r1, r9
	strh r1, [r0]
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8099E98

	THUMB_FUNC_START sub_8099F50
sub_8099F50: @ 0x08099F50
	push {lr}
	sub sp, #4
	movs r1, #0
	str r1, [sp]
	movs r2, #0
	movs r3, #0
	bl sub_8099E98
	add sp, #4
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8099F50

	THUMB_FUNC_START sub_8099F68
sub_8099F68: @ 0x08099F68
	push {lr}
	adds r1, r0, #0
	ldr r0, _08099F78  @ gUnknown_08A189A4
	bl Proc_StartBlocking
	pop {r1}
	bx r1
	.align 2, 0
_08099F78: .4byte gUnknown_08A189A4

	THUMB_FUNC_END sub_8099F68

	THUMB_FUNC_START sub_8099F7C
sub_8099F7C: @ 0x08099F7C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	adds r6, r0, #0
	adds r4, r1, #0
	mov r8, r2
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	str r3, [sp]
	adds r0, r4, #0
	movs r1, #0xc
	movs r2, #0x14
	movs r3, #0
	bl TileMap_FillRect
	movs r0, #2
	ldr r1, [sp]
	ands r0, r1
	cmp r0, #0
	beq _08099FAE
	bl ResetIconGraphics
_08099FAE:
	mov r0, r8
	cmp r0, #0
	beq _0809A07C
	bl GetUnitItemCount
	str r0, [sp, #4]
	movs r1, #0
	mov r9, r1
	cmp r9, r0
	bge _0809A07C
	adds r0, r4, #0
	adds r0, #0x16
	str r0, [sp, #8]
	adds r1, r4, #4
	str r1, [sp, #0xc]
	mov sl, r4
_08099FCE:
	mov r1, r9
	lsls r0, r1, #1
	mov r1, r8
	adds r1, #0x1e
	adds r1, r1, r0
	ldrh r5, [r1]
	movs r0, #4
	ldr r1, [sp]
	ands r0, r1
	cmp r0, #0
	beq _08099FEE
	mov r0, r8
	adds r1, r5, #0
	bl CanUnitUseItemPrepScreen
	b _08099FF6
_08099FEE:
	mov r0, r8
	adds r1, r5, #0
	bl IsItemDisplayUsable
_08099FF6:
	movs r7, #0
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0809A000
	movs r7, #1
_0809A000:
	movs r0, #1
	ldr r1, [sp]
	ands r0, r1
	cmp r0, #0
	bne _0809A02E
	adds r0, r6, #0
	bl Text_Clear
	adds r0, r6, #0
	adds r1, r7, #0
	bl Text_SetColorId
	adds r0, r6, #0
	movs r1, #0
	bl Text_SetXCursor
	adds r0, r5, #0
	bl GetItemName
	adds r1, r0, #0
	adds r0, r6, #0
	bl Text_AppendString
_0809A02E:
	adds r0, r5, #0
	bl GetItemIconId
	adds r1, r0, #0
	mov r0, sl
	movs r2, #0x80
	lsls r2, r2, #7
	bl DrawIcon
	adds r0, r6, #0
	ldr r1, [sp, #0xc]
	bl Text_Draw
	movs r4, #1
	cmp r7, #0
	bne _0809A050
	movs r4, #2
_0809A050:
	adds r0, r5, #0
	bl GetItemUses
	adds r2, r0, #0
	ldr r0, [sp, #8]
	adds r1, r4, #0
	bl DrawDecNumber
	adds r6, #8
	ldr r0, [sp, #8]
	adds r0, #0x80
	str r0, [sp, #8]
	ldr r1, [sp, #0xc]
	adds r1, #0x80
	str r1, [sp, #0xc]
	movs r0, #0x80
	add sl, r0
	movs r1, #1
	add r9, r1
	ldr r0, [sp, #4]
	cmp r9, r0
	blt _08099FCE
_0809A07C:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8099F7C

	THUMB_FUNC_START sub_809A08C
sub_809A08C: @ 0x0809A08C
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	movs r1, #3
	bl __udivsi3
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x14
	adds r6, r4, #0
	bl PrepGetUnitAmount
	subs r0, #1
	movs r1, #3
	bl __divsi3
	lsls r1, r0, #4
	ldrh r0, [r5, #0x34]
	subs r0, r4, r0
	cmp r0, #0x20
	ble _0809A0C6
	cmp r4, r1
	bne _0809A0C0
	adds r0, r4, #0
	subs r0, #0x30
	b _0809A0D6
_0809A0C0:
	adds r0, r4, #0
	subs r0, #0x20
	b _0809A0D6
_0809A0C6:
	cmp r0, #0xf
	bgt _0809A0D8
	cmp r4, #0
	bne _0809A0D2
	strh r4, [r5, #0x34]
	b _0809A0D8
_0809A0D2:
	adds r0, r6, #0
	subs r0, #0x10
_0809A0D6:
	strh r0, [r5, #0x34]
_0809A0D8:
	ldr r1, _0809A110  @ 0x0000FFD8
	ldrh r2, [r5, #0x34]
	subs r2, #4
	movs r0, #0xff
	ands r2, r0
	movs r0, #2
	bl BG_SetPosition
	ldrh r4, [r5, #0x34]
	bl PrepGetUnitAmount
	subs r0, #1
	movs r1, #3
	bl __divsi3
	adds r2, r0, #0
	adds r2, #1
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #6
	adds r1, r4, #0
	movs r3, #4
	bl sub_80976CC
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0809A110: .4byte 0x0000FFD8

	THUMB_FUNC_END sub_809A08C

	THUMB_FUNC_START sub_809A114
sub_809A114: @ 0x0809A114
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov sl, r1
	lsls r2, r2, #0x18
	lsrs r5, r2, #0x18
	lsls r0, r1, #1
	add r0, sl
	str r0, [sp]
	movs r1, #0xf
	bl __modsi3
	lsls r0, r0, #3
	ldr r1, _0809A1C0  @ gUnknown_02013498
	adds r4, r0, r1
	ldr r0, _0809A1C4  @ gGMData
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0809A154
	bl sub_80C4070
	movs r1, #1
	str r1, [sp, #4]
	cmp r0, #2
	beq _0809A158
_0809A154:
	movs r0, #0
	str r0, [sp, #4]
_0809A158:
	movs r7, #0
	lsls r0, r5, #0x18
	asrs r0, r0, #0x18
	mov r9, r0
_0809A160:
	mov r1, r9
	cmp r1, #0
	bne _0809A16C
	adds r0, r4, #0
	bl Text_Clear
_0809A16C:
	ldr r0, [sp]
	adds r5, r0, r7
	bl PrepGetUnitAmount
	cmp r5, r0
	bge _0809A1FA
	adds r0, r7, #0
	movs r1, #3
	bl __modsi3
	lsls r0, r0, #3
	mov r8, r0
	mov r1, sl
	lsls r6, r1, #1
	movs r0, #0x1f
	ands r6, r0
	mov r0, r9
	cmp r0, #0
	bne _0809A1EA
	adds r0, r5, #0
	bl GetUnitFromPrepList
	adds r5, r0, #0
	adds r0, r4, #0
	movs r1, #0
	bl Text_SetXCursor
	ldr r1, [sp, #4]
	cmp r1, #0
	beq _0809A1D2
	adds r0, r5, #0
	movs r1, #0x72
	bl UnitHasItem
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809A1C8
	adds r0, r4, #0
	movs r1, #0
	bl Text_SetColorId
	b _0809A1DA
	.align 2, 0
_0809A1C0: .4byte gUnknown_02013498
_0809A1C4: .4byte gGMData
_0809A1C8:
	adds r0, r4, #0
	movs r1, #1
	bl Text_SetColorId
	b _0809A1DA
_0809A1D2:
	adds r0, r4, #0
	movs r1, #0
	bl Text_SetColorId
_0809A1DA:
	ldr r0, [r5]
	ldrh r0, [r0]
	bl GetStringFromIndex
	adds r1, r0, #0
	adds r0, r4, #0
	bl Text_AppendString
_0809A1EA:
	lsls r1, r6, #5
	add r1, r8
	lsls r1, r1, #1
	ldr r0, _0809A218  @ gBG2TilemapBuffer
	adds r1, r1, r0
	adds r0, r4, #0
	bl Text_Draw
_0809A1FA:
	adds r4, #8
	adds r7, #1
	cmp r7, #2
	ble _0809A160
	movs r0, #4
	bl BG_EnableSyncByMask
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809A218: .4byte gBG2TilemapBuffer

	THUMB_FUNC_END sub_809A114

	THUMB_FUNC_START sub_809A21C
sub_809A21C: @ 0x0809A21C
	push {lr}
	cmp r0, #0x60
	bhi _0809A22A
	cmp r1, #0x1f
	ble _0809A22A
	movs r0, #1
	b _0809A22C
_0809A22A:
	movs r0, #0
_0809A22C:
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_809A21C

	THUMB_FUNC_START sub_809A230
sub_809A230: @ 0x0809A230
	push {r4, r5, r6, lr}
	sub sp, #4
	lsls r1, r1, #0x10
	lsrs r6, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r5, r2, #0x10
	ldr r1, [r0, #4]
	ldrb r4, [r1, #4]
	movs r1, #0x72
	bl UnitHasItem
	lsls r0, r0, #0x18
	movs r1, #0xf0
	lsls r1, r1, #8
	cmp r0, #0
	beq _0809A254
	movs r1, #0xc0
	lsls r1, r1, #8
_0809A254:
	movs r0, #0x80
	lsls r0, r0, #4
	adds r3, r0, #0
	adds r3, r1, r3
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	str r4, [sp]
	movs r0, #0
	adds r1, r6, #0
	adds r2, r5, #0
	bl sub_8027C48
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_809A230

	THUMB_FUNC_START sub_809A274
sub_809A274: @ 0x0809A274
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	movs r6, #0
	b _0809A308
_0809A27C:
	adds r0, r6, #0
	movs r1, #3
	bl __modsi3
	lsls r5, r0, #6
	adds r0, r6, #0
	movs r1, #3
	bl __divsi3
	lsls r0, r0, #4
	ldrh r1, [r7, #0x34]
	subs r4, r0, r1
	adds r0, r4, #0
	adds r0, #0x14
	cmp r0, #0x44
	bhi _0809A306
	adds r0, r7, #0
	adds r0, #0x32
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0809A2B8
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_809A21C
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0809A306
_0809A2B8:
	ldr r0, _0809A2E8  @ gGMData
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0809A2EC
	bl sub_80C4070
	cmp r0, #2
	bne _0809A2EC
	adds r0, r6, #0
	bl GetUnitFromPrepList
	adds r1, r5, #0
	adds r1, #0x18
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	adds r2, r4, #4
	movs r3, #0xff
	ands r2, r3
	bl sub_809A230
	b _0809A306
	.align 2, 0
_0809A2E8: .4byte gGMData
_0809A2EC:
	adds r5, #0x18
	adds r4, #4
	movs r0, #0xff
	ands r4, r0
	adds r0, r6, #0
	bl GetUnitFromPrepList
	adds r3, r0, #0
	movs r0, #0
	adds r1, r5, #0
	adds r2, r4, #0
	bl PutUnitSprite
_0809A306:
	adds r6, #1
_0809A308:
	bl PrepGetUnitAmount
	cmp r6, r0
	blt _0809A27C
	bl SMS_FlushDirect
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_809A274

	THUMB_FUNC_START sub_809A31C
sub_809A31C: @ 0x0809A31C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x18
	str r0, [sp, #4]
	mov sl, r1
	str r2, [sp, #8]
	str r3, [sp, #0xc]
	ldr r7, [sp, #0x38]
	cmp r2, #0
	bgt _0809A338
	b _0809A4E6
_0809A338:
	cmp r3, #0
	bgt _0809A33E
	b _0809A4E6
_0809A33E:
	ldr r4, _0809A4F8  @ gObject_8x8
	str r7, [sp]
	movs r0, #4
	ldr r1, [sp, #4]
	mov r2, sl
	adds r3, r4, #0
	bl PutSpriteExt
	ldr r0, [sp, #8]
	lsls r0, r0, #3
	mov r9, r0
	ldr r6, [sp, #4]
	add r6, r9
	adds r0, r7, #3
	str r0, [sp]
	movs r0, #4
	adds r1, r6, #0
	mov r2, sl
	adds r3, r4, #0
	bl PutSpriteExt
	ldr r1, [sp, #0xc]
	lsls r1, r1, #3
	mov r8, r1
	mov r5, sl
	add r5, r8
	adds r0, r7, #0
	adds r0, #0xd
	str r0, [sp]
	movs r0, #4
	adds r1, r6, #0
	adds r2, r5, #0
	adds r3, r4, #0
	bl PutSpriteExt
	adds r0, r7, #0
	adds r0, #0xa
	str r0, [sp]
	movs r0, #4
	ldr r1, [sp, #4]
	adds r2, r5, #0
	adds r3, r4, #0
	bl PutSpriteExt
	movs r5, #1
	ldr r3, [sp, #8]
	subs r3, #1
	str r3, [sp, #0x10]
	cmp r5, r3
	bge _0809A3D6
	ldr r6, _0809A4FC  @ gObject_16x8
	ldr r4, [sp, #4]
	adds r4, #8
_0809A3A8:
	adds r0, r7, #1
	str r0, [sp]
	movs r0, #4
	adds r1, r4, #0
	mov r2, sl
	adds r3, r6, #0
	bl PutSpriteExt
	adds r0, r7, #0
	adds r0, #0xb
	str r0, [sp]
	movs r0, #4
	adds r1, r4, #0
	mov r2, sl
	add r2, r8
	adds r3, r6, #0
	bl PutSpriteExt
	adds r4, #0x10
	adds r5, #2
	ldr r0, [sp, #0x10]
	cmp r5, r0
	blt _0809A3A8
_0809A3D6:
	ldr r1, [sp, #8]
	cmp r5, r1
	bge _0809A412
	ldr r6, _0809A4F8  @ gObject_8x8
	lsls r0, r5, #3
	ldr r3, [sp, #4]
	adds r4, r0, r3
	subs r5, r1, r5
_0809A3E6:
	adds r0, r7, #1
	str r0, [sp]
	movs r0, #4
	adds r1, r4, #0
	mov r2, sl
	adds r3, r6, #0
	bl PutSpriteExt
	adds r0, r7, #0
	adds r0, #0xb
	str r0, [sp]
	movs r0, #4
	adds r1, r4, #0
	mov r2, sl
	add r2, r8
	adds r3, r6, #0
	bl PutSpriteExt
	adds r4, #8
	subs r5, #1
	cmp r5, #0
	bne _0809A3E6
_0809A412:
	ldr r0, [sp, #0xc]
	cmp r0, #1
	ble _0809A44E
	ldr r5, _0809A4F8  @ gObject_8x8
	mov r4, sl
	adds r4, #8
	adds r6, r0, #0
	subs r6, #1
_0809A422:
	adds r0, r7, #4
	str r0, [sp]
	movs r0, #4
	ldr r1, [sp, #4]
	adds r2, r4, #0
	adds r3, r5, #0
	bl PutSpriteExt
	adds r0, r7, #0
	adds r0, #9
	str r0, [sp]
	movs r0, #4
	ldr r1, [sp, #4]
	add r1, r9
	adds r2, r4, #0
	adds r3, r5, #0
	bl PutSpriteExt
	adds r4, #8
	subs r6, #1
	cmp r6, #0
	bne _0809A422
_0809A44E:
	movs r6, #1
	ldr r1, [sp, #0xc]
	cmp r6, r1
	bge _0809A4E6
	ldr r3, [sp, #8]
	subs r3, #3
	mov r9, r3
	adds r7, #5
	mov r8, r7
_0809A460:
	movs r5, #1
	adds r0, r6, #1
	str r0, [sp, #0x14]
	cmp r5, r9
	bge _0809A48A
	ldr r4, [sp, #4]
	adds r4, #8
	lsls r7, r6, #3
_0809A470:
	mov r1, r8
	str r1, [sp]
	movs r0, #4
	adds r1, r4, #0
	mov r3, sl
	adds r2, r3, r7
	ldr r3, _0809A500  @ gObject_32x8
	bl PutSpriteExt
	adds r4, #0x20
	adds r5, #4
	cmp r5, r9
	blt _0809A470
_0809A48A:
	ldr r0, [sp, #0x10]
	cmp r5, r0
	bge _0809A4B4
	lsls r0, r5, #3
	ldr r1, [sp, #4]
	adds r4, r0, r1
	lsls r7, r6, #3
_0809A498:
	mov r3, r8
	str r3, [sp]
	movs r0, #4
	adds r1, r4, #0
	mov r3, sl
	adds r2, r3, r7
	ldr r3, _0809A4FC  @ gObject_16x8
	bl PutSpriteExt
	adds r4, #0x10
	adds r5, #2
	ldr r0, [sp, #0x10]
	cmp r5, r0
	blt _0809A498
_0809A4B4:
	ldr r1, [sp, #8]
	cmp r5, r1
	bge _0809A4DE
	lsls r0, r5, #3
	ldr r3, [sp, #4]
	adds r4, r0, r3
	lsls r6, r6, #3
	subs r5, r1, r5
_0809A4C4:
	mov r0, r8
	str r0, [sp]
	movs r0, #4
	adds r1, r4, #0
	mov r3, sl
	adds r2, r3, r6
	ldr r3, _0809A4F8  @ gObject_8x8
	bl PutSpriteExt
	adds r4, #8
	subs r5, #1
	cmp r5, #0
	bne _0809A4C4
_0809A4DE:
	ldr r6, [sp, #0x14]
	ldr r0, [sp, #0xc]
	cmp r6, r0
	blt _0809A460
_0809A4E6:
	add sp, #0x18
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809A4F8: .4byte gObject_8x8
_0809A4FC: .4byte gObject_16x8
_0809A500: .4byte gObject_32x8

	THUMB_FUNC_END sub_809A31C

	THUMB_FUNC_START sub_809A504
sub_809A504: @ 0x0809A504
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldrh r0, [r5, #0x34]
	lsrs r4, r0, #4
	adds r0, r4, #4
	cmp r4, r0
	bge _0809A530
	lsls r6, r1, #0x18
_0809A518:
	lsls r1, r4, #0x18
	lsrs r1, r1, #0x18
	adds r0, r5, #0
	asrs r2, r6, #0x18
	bl sub_809A114
	adds r4, #1
	ldrh r0, [r5, #0x34]
	lsrs r0, r0, #4
	adds r0, #4
	cmp r4, r0
	blt _0809A518
_0809A530:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_809A504

	THUMB_FUNC_START sub_809A538
sub_809A538: @ 0x0809A538
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	bl GetUnitItemCount
	adds r7, r0, #0
	bl sub_8097CC8
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	movs r4, #0
	cmp r4, r7
	bge _0809A56E
	cmp r6, #0x63
	bgt _0809A56E
_0809A554:
	ldrh r0, [r5, #0x1e]
	bl AddItemToConvoy
	adds r0, r5, #0
	movs r1, #0
	bl UnitRemoveItem
	adds r4, #1
	cmp r4, r7
	bge _0809A56E
	adds r0, r4, r6
	cmp r0, #0x63
	ble _0809A554
_0809A56E:
	cmp r4, #0
	bgt _0809A576
	movs r0, #0
	b _0809A578
_0809A576:
	movs r0, #1
_0809A578:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_809A538

	THUMB_FUNC_START PrepUnit_DrawUnitListNames
PrepUnit_DrawUnitListNames: @ 0x0809A580
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r0, r1, #0
	movs r7, #0
	lsls r1, r0, #1
	mov r8, r1
	movs r1, #7
	bl __modsi3
	mov sl, r0
	movs r2, #0
	mov r9, r2
_0809A5A0:
	mov r0, r8
	adds r4, r0, r7
	bl PrepGetUnitAmount
	cmp r4, r0
	bge _0809A61A
	adds r0, r4, #0
	bl GetUnitFromPrepList
	adds r5, r0, #0
	movs r6, #0
	bl CheckSomethingSomewhere
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0809A5D2
	ldr r0, [r5]
	ldrb r0, [r0, #4]
	bl IsCharacterForceDeployed
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809A5D2
	movs r6, #4
	b _0809A5DE
_0809A5D2:
	ldr r0, [r5, #0xc]
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	beq _0809A5DE
	movs r6, #1
_0809A5DE:
	mov r1, sl
	lsls r4, r1, #1
	adds r4, r4, r7
	lsls r4, r4, #3
	ldr r0, _0809A63C  @ gUnknown_02013598
	adds r4, r4, r0
	adds r0, r4, #0
	bl Text_Clear
	ldr r0, [r5]
	ldrh r0, [r0]
	bl GetStringFromIndex
	movs r1, #0x1f
	mov r2, r8
	ands r1, r2
	lsls r1, r1, #5
	adds r1, #0x10
	add r1, r9
	lsls r1, r1, #1
	ldr r2, _0809A640  @ gBG2TilemapBuffer
	adds r1, r1, r2
	movs r2, #0
	str r2, [sp]
	str r0, [sp, #4]
	adds r0, r4, #0
	adds r2, r6, #0
	movs r3, #0
	bl DrawTextInline
_0809A61A:
	movs r0, #7
	add r9, r0
	adds r7, #1
	cmp r7, #1
	ble _0809A5A0
	movs r0, #4
	bl BG_EnableSyncByMask
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809A63C: .4byte gUnknown_02013598
_0809A640: .4byte gBG2TilemapBuffer

	THUMB_FUNC_END PrepUnit_DrawUnitListNames

	THUMB_FUNC_START sub_809A644
sub_809A644: @ 0x0809A644
	push {lr}
	lsls r0, r0, #1
	movs r1, #0x1f
	ands r0, r1
	lsls r0, r0, #6
	ldr r1, _0809A668  @ gUnknown_02023CC8
	adds r0, r0, r1
	movs r1, #0xd
	movs r2, #1
	movs r3, #0
	bl TileMap_FillRect
	movs r0, #4
	bl BG_EnableSyncByMask
	pop {r0}
	bx r0
	.align 2, 0
_0809A668: .4byte gUnknown_02023CC8

	THUMB_FUNC_END sub_809A644

	THUMB_FUNC_START PrepUnit_DrawSMSAndObjs
PrepUnit_DrawSMSAndObjs: @ 0x0809A66C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	mov r8, r0
	movs r6, #0
	b _0809A6AE
_0809A67A:
	asrs r0, r6, #1
	lsls r0, r0, #4
	mov r2, r8
	ldrh r1, [r2, #0x30]
	subs r5, r0, r1
	adds r0, r5, #0
	adds r0, #0xf
	cmp r0, #0x5f
	bhi _0809A6AC
	movs r0, #1
	ands r0, r6
	lsls r4, r0, #3
	subs r4, r4, r0
	lsls r4, r4, #3
	adds r4, #0x70
	adds r5, #0x18
	adds r0, r6, #0
	bl GetUnitFromPrepList
	adds r3, r0, #0
	movs r0, #0
	adds r1, r4, #0
	adds r2, r5, #0
	bl PutUnitSprite
_0809A6AC:
	adds r6, #1
_0809A6AE:
	bl PrepGetUnitAmount
	cmp r6, r0
	blt _0809A67A
	mov r0, r8
	ldrh r1, [r0, #0x30]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #0
	beq _0809A758
	ldr r1, _0809A754  @ gLCDControlBuffer
	mov ip, r1
	ldrb r0, [r1, #1]
	movs r1, #0x20
	orrs r0, r1
	movs r1, #0x40
	orrs r0, r1
	movs r1, #0x7f
	ands r0, r1
	mov r2, ip
	strb r0, [r2, #1]
	mov r0, ip
	adds r0, #0x2d
	movs r2, #0
	strb r2, [r0]
	adds r0, #4
	strb r2, [r0]
	subs r0, #5
	movs r3, #0xf0
	strb r3, [r0]
	mov r1, ip
	adds r1, #0x30
	movs r0, #0x1a
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x2f
	strb r2, [r0]
	adds r1, #3
	movs r0, #0x78
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x2e
	strb r3, [r0]
	subs r1, #1
	movs r0, #0xa0
	strb r0, [r1]
	mov r6, ip
	adds r6, #0x34
	ldrb r0, [r6]
	movs r5, #1
	orrs r0, r5
	movs r3, #2
	orrs r0, r3
	movs r4, #5
	negs r4, r4
	ands r0, r4
	movs r2, #8
	orrs r0, r2
	movs r1, #0x11
	negs r1, r1
	ands r0, r1
	strb r0, [r6]
	mov r1, ip
	adds r1, #0x35
	ldrb r0, [r1]
	orrs r0, r5
	orrs r0, r3
	ands r0, r4
	orrs r0, r2
	movs r6, #0x10
	orrs r0, r6
	strb r0, [r1]
	mov r4, ip
	adds r4, #0x36
	ldrb r0, [r4]
	orrs r0, r5
	orrs r0, r3
	movs r1, #4
	orrs r0, r1
	orrs r0, r2
	orrs r0, r6
	strb r0, [r4]
	b _0809A76E
	.align 2, 0
_0809A754: .4byte gLCDControlBuffer
_0809A758:
	ldr r2, _0809A7D0  @ gLCDControlBuffer
	ldrb r1, [r2, #1]
	movs r0, #0x21
	negs r0, r0
	ands r0, r1
	movs r1, #0x41
	negs r1, r1
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r2, #1]
_0809A76E:
	mov r0, r8
	adds r0, #0x37
	ldrb r1, [r0]
	adds r7, r0, #0
	cmp r1, #0
	beq _0809A77E
	adds r0, r1, #1
	strb r0, [r7]
_0809A77E:
	movs r5, #0x87
	lsls r5, r5, #8
	movs r4, #4
	movs r6, #2
_0809A786:
	str r5, [sp]
	movs r0, #4
	adds r1, r4, #0
	movs r2, #0x81
	ldr r3, _0809A7D4  @ gObject_32x16
	bl PutSpriteExt
	adds r5, #4
	adds r4, #0x20
	subs r6, #1
	cmp r6, #0
	bge _0809A786
	ldrb r0, [r7]
	lsrs r0, r0, #2
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _0809A7EC
	mov r0, r8
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #0
	beq _0809A7EC
	bl CheckSomethingSomewhere
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809A7DC
	ldr r3, _0809A7D8  @ gUnknown_08A18E62
	movs r0, #0x40
	str r0, [sp]
	movs r0, #4
	movs r1, #0x80
	movs r2, #0x82
	bl PutSpriteExt
	b _0809A7EC
	.align 2, 0
_0809A7D0: .4byte gLCDControlBuffer
_0809A7D4: .4byte gObject_32x16
_0809A7D8: .4byte gUnknown_08A18E62
_0809A7DC:
	ldr r3, _0809A80C  @ gUnknown_08A18E4E
	movs r0, #0x40
	str r0, [sp]
	movs r0, #4
	movs r1, #0x80
	movs r2, #0x82
	bl PutSpriteExt
_0809A7EC:
	ldr r3, _0809A810  @ gUnknown_08A18E34
	movs r0, #0x40
	str r0, [sp]
	movs r0, #4
	movs r1, #0x80
	movs r2, #0x8f
	bl PutSpriteExt
	bl SMS_FlushDirect
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809A80C: .4byte gUnknown_08A18E4E
_0809A810: .4byte gUnknown_08A18E34

	THUMB_FUNC_END PrepUnit_DrawSMSAndObjs

	THUMB_FUNC_START PrepUnit_InitTexts
PrepUnit_InitTexts: @ 0x0809A814
	push {r4, r5, lr}
	bl Font_InitForUIDefault
	ldr r5, _0809A868  @ gUnknown_02013598
	movs r4, #0xd
_0809A81E:
	adds r0, r5, #0
	movs r1, #5
	bl Text_Init
	adds r5, #8
	subs r4, #1
	cmp r4, #0
	bge _0809A81E
	ldr r5, _0809A86C  @ gUnknown_02013608
	movs r4, #4
_0809A832:
	adds r0, r5, #0
	movs r1, #7
	bl Text_Init
	adds r5, #8
	subs r4, #1
	cmp r4, #0
	bge _0809A832
	ldr r4, _0809A870  @ gUnknown_02013630
	adds r0, r4, #0
	movs r1, #7
	bl Text_Init
	adds r0, r4, #0
	adds r0, #8
	movs r1, #0xa
	bl Text_Init
	adds r4, #0x10
	adds r0, r4, #0
	movs r1, #0xc
	bl Text_Init
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0809A868: .4byte gUnknown_02013598
_0809A86C: .4byte gUnknown_02013608
_0809A870: .4byte gUnknown_02013630

	THUMB_FUNC_END PrepUnit_InitTexts

	THUMB_FUNC_START PrepUnit_InitGfx
PrepUnit_InitGfx: @ 0x0809A874
	push {r4, lr}
	bl ResetIconGraphics_
	bl LoadUiFrameGraphics
	bl LoadObjUIGfx
	movs r0, #4
	bl LoadIconPalettes
	movs r4, #0xc0
	lsls r4, r4, #7
	adds r0, r4, #0
	movs r1, #8
	bl Prep_DrawChapterGoal
	adds r0, r4, #0
	movs r1, #0xf
	bl sub_80950E8
	ldr r0, _0809A8D8  @ gUnknown_08A1B730
	ldr r1, _0809A8DC  @ 0x06000440
	bl CopyDataWithPossibleUncomp
	ldr r0, _0809A8E0  @ gUnknown_08A1B7C8
	ldr r4, _0809A8E4  @ gGenericBuffer
	adds r1, r4, #0
	bl CopyDataWithPossibleUncomp
	ldr r0, _0809A8E8  @ gBG1TilemapBuffer
	movs r2, #0x80
	lsls r2, r2, #5
	adds r1, r4, #0
	bl CallARM_FillTileRect
	ldr r0, _0809A8EC  @ gUnknown_08A1D510
	ldr r1, _0809A8F0  @ 0x06010800
	bl CopyDataWithPossibleUncomp
	ldr r0, _0809A8F4  @ Pal_MapBattleInfoNum
	movs r1, #0xc8
	lsls r1, r1, #2
	movs r2, #0x20
	bl CopyToPaletteBuffer
	bl EnablePaletteSync
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809A8D8: .4byte gUnknown_08A1B730
_0809A8DC: .4byte 0x06000440
_0809A8E0: .4byte gUnknown_08A1B7C8
_0809A8E4: .4byte gGenericBuffer
_0809A8E8: .4byte gBG1TilemapBuffer
_0809A8EC: .4byte gUnknown_08A1D510
_0809A8F0: .4byte 0x06010800
_0809A8F4: .4byte Pal_MapBattleInfoNum

	THUMB_FUNC_END PrepUnit_InitGfx

	THUMB_FUNC_START sub_809A8F8
sub_809A8F8: @ 0x0809A8F8
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	bl SetupMapSpritesPalettes
	movs r0, #0
	str r0, [sp]
	ldr r1, _0809A928  @ gUnknown_02022C08
	ldr r2, _0809A92C  @ 0x01000008
	mov r0, sp
	bl CpuFastSet
	bl MakePrepUnitList
	ldr r0, [r4, #0x14]
	bl PrepAutoCapDeployUnits
	bl PrepUpdateSMS
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809A928: .4byte gUnknown_02022C08
_0809A92C: .4byte 0x01000008

	THUMB_FUNC_END sub_809A8F8

	THUMB_FUNC_START sub_809A930
sub_809A930: @ 0x0809A930
	push {r4, r5, r6, lr}
	mov r6, r9
	mov r5, r8
	push {r5, r6}
	sub sp, #8
	adds r5, r0, #0
	ldr r4, _0809A9E0  @ gUnknown_02022D72
	adds r0, r4, #0
	movs r1, #6
	movs r2, #1
	movs r3, #0
	bl TileMap_FillRect
	adds r0, r5, #0
	bl GetUnitPortraitId
	adds r1, r4, #0
	subs r1, #0x88
	movs r2, #0x9c
	lsls r2, r2, #2
	movs r3, #0
	mov r9, r3
	str r3, [sp]
	movs r3, #2
	bl PutFaceChibi
	ldr r0, _0809A9E4  @ gUnknown_02013630
	mov r8, r0
	bl Text_Clear
	ldr r0, [r5]
	ldrh r0, [r0]
	bl GetStringFromIndex
	adds r1, r0, #0
	movs r0, #0x38
	bl GetStringTextCenteredPos
	adds r6, r0, #0
	ldr r0, [r5]
	ldrh r0, [r0]
	bl GetStringFromIndex
	adds r1, r4, #0
	subs r1, #0x80
	mov r2, r9
	str r2, [sp]
	str r0, [sp, #4]
	mov r0, r8
	movs r2, #0
	adds r3, r6, #0
	bl DrawTextInline
	adds r0, r4, #0
	movs r1, #3
	movs r2, #0x24
	movs r3, #0x25
	bl sub_8004D5C
	adds r0, r4, #0
	adds r0, #8
	movs r1, #3
	movs r2, #0x1d
	bl sub_8004B0C
	adds r0, r4, #6
	movs r2, #8
	ldrsb r2, [r5, r2]
	movs r1, #2
	bl DrawDecNumber
	adds r4, #0xc
	ldrb r2, [r5, #9]
	adds r0, r4, #0
	movs r1, #2
	bl DrawDecNumber
	movs r0, #1
	bl BG_EnableSyncByMask
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0809A9E0: .4byte gUnknown_02022D72
_0809A9E4: .4byte gUnknown_02013630

	THUMB_FUNC_END sub_809A930

	THUMB_FUNC_START sub_809A9E8
sub_809A9E8: @ 0x0809A9E8
	push {lr}
	ldrh r0, [r0, #0x2e]
	bl GetUnitFromPrepList
	bl sub_809A930
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_809A9E8

	THUMB_FUNC_START PrepUnit_DrawUnitItems
PrepUnit_DrawUnitItems: @ 0x0809A9F8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	adds r7, r0, #0
	bl ResetIconGraphics_
	ldr r4, _0809AAE4  @ gUnknown_02022DEA
	adds r0, r4, #0
	movs r1, #0xb
	movs r2, #0xa
	movs r3, #0
	bl TileMap_FillRect
	adds r0, r7, #0
	bl GetUnitItemCount
	str r0, [sp, #8]
	movs r0, #0
	mov r8, r0
	ldr r2, [sp, #8]
	cmp r8, r2
	bge _0809AACC
	movs r0, #0x14
	adds r0, r0, r4
	mov sl, r0
	mov r9, r4
	movs r2, #0xa0
	lsls r2, r2, #1
	str r2, [sp, #0xc]
_0809AA38:
	mov r0, r8
	lsls r1, r0, #1
	adds r0, r7, #0
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r4, [r0]
	adds r0, r4, #0
	bl GetItemIconId
	adds r1, r0, #0
	mov r0, r9
	movs r2, #0x80
	lsls r2, r2, #7
	bl DrawIcon
	mov r2, r8
	lsls r1, r2, #3
	ldr r0, _0809AAE8  @ gUnknown_02013608
	adds r5, r1, r0
	adds r0, r5, #0
	bl Text_Clear
	adds r0, r7, #0
	adds r1, r4, #0
	bl IsItemDisplayUsable
	movs r6, #0
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0809AA76
	movs r6, #1
_0809AA76:
	adds r0, r4, #0
	bl GetItemName
	ldr r1, _0809AAEC  @ gUnknown_02022CAA
	adds r1, #4
	ldr r2, [sp, #0xc]
	adds r1, r2, r1
	movs r2, #0
	str r2, [sp]
	str r0, [sp, #4]
	adds r0, r5, #0
	adds r2, r6, #0
	movs r3, #0
	bl DrawTextInline
	adds r0, r7, #0
	adds r1, r4, #0
	bl IsItemDisplayUsable
	lsls r0, r0, #0x18
	movs r5, #1
	cmp r0, #0
	beq _0809AAA6
	movs r5, #2
_0809AAA6:
	adds r0, r4, #0
	bl GetItemUses
	adds r2, r0, #0
	mov r0, sl
	adds r1, r5, #0
	bl DrawDecNumber
	movs r0, #0x80
	add sl, r0
	add r9, r0
	ldr r2, [sp, #0xc]
	adds r2, #0x80
	str r2, [sp, #0xc]
	movs r0, #1
	add r8, r0
	ldr r2, [sp, #8]
	cmp r8, r2
	blt _0809AA38
_0809AACC:
	movs r0, #1
	bl BG_EnableSyncByMask
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809AAE4: .4byte gUnknown_02022DEA
_0809AAE8: .4byte gUnknown_02013608
_0809AAEC: .4byte gUnknown_02022CAA

	THUMB_FUNC_END PrepUnit_DrawUnitItems

	THUMB_FUNC_START sub_809AAF0
sub_809AAF0: @ 0x0809AAF0
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r7, r0, #0
	lsls r1, r1, #0x18
	asrs r6, r1, #0x18
	cmp r6, #0
	bne _0809AB34
	ldr r4, _0809ABBC  @ gUnknown_02013640
	adds r0, r4, #0
	bl Text_Clear
	ldr r0, _0809ABC0  @ 0x000005A1
	bl GetStringFromIndex
	ldr r5, _0809ABC4  @ gUnknown_02022D02
	str r6, [sp]
	str r0, [sp, #4]
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0
	movs r3, #6
	bl DrawTextInline
	ldr r0, _0809ABC8  @ 0x000005A2
	bl GetStringFromIndex
	str r6, [sp]
	str r0, [sp, #4]
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0
	movs r3, #0x29
	bl DrawTextInline
_0809AB34:
	ldr r4, _0809ABCC  @ gUnknown_02022D08
	adds r0, r4, #0
	movs r1, #1
	movs r2, #1
	movs r3, #0
	bl TileMap_FillRect
	adds r3, r4, #2
	adds r5, r7, #0
	adds r5, #0x29
	adds r6, r7, #0
	adds r6, #0x2a
	ldrb r0, [r5]
	movs r1, #2
	ldrb r2, [r6]
	cmp r0, r2
	bne _0809AB58
	movs r1, #1
_0809AB58:
	ldrb r2, [r6]
	ldrb r0, [r5]
	subs r2, r2, r0
	adds r0, r3, #0
	bl DrawDecNumber
	adds r0, r4, #0
	adds r0, #0x10
	movs r1, #4
	movs r2, #1
	movs r3, #0
	bl TileMap_FillRect
	adds r3, r4, #0
	adds r3, #0x12
	ldrb r0, [r5]
	movs r1, #2
	ldrb r2, [r6]
	cmp r0, r2
	bne _0809AB82
	movs r1, #4
_0809AB82:
	ldrb r2, [r5]
	adds r0, r3, #0
	bl DrawDecNumber
	adds r0, r4, #0
	adds r0, #0x14
	movs r1, #0
	movs r2, #0x16
	bl sub_8004B0C
	adds r3, r4, #0
	adds r3, #0x18
	ldrb r0, [r5]
	movs r1, #2
	ldrb r2, [r6]
	cmp r0, r2
	bne _0809ABA6
	movs r1, #4
_0809ABA6:
	ldrb r2, [r6]
	adds r0, r3, #0
	bl DrawDecNumber
	movs r0, #1
	bl BG_EnableSyncByMask
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809ABBC: .4byte gUnknown_02013640
_0809ABC0: .4byte 0x000005A1
_0809ABC4: .4byte gUnknown_02022D02
_0809ABC8: .4byte 0x000005A2
_0809ABCC: .4byte gUnknown_02022D08

	THUMB_FUNC_END sub_809AAF0

	THUMB_FUNC_START sub_809ABD0
sub_809ABD0: @ 0x0809ABD0
	push {r4, lr}
	adds r4, r0, #0
	adds r2, r1, #0
	adds r0, #0x2a
	adds r3, r4, #0
	adds r3, #0x29
	ldrb r1, [r3]
	ldrb r0, [r0]
	cmp r0, r1
	bls _0809AC20
	adds r0, r1, #1
	strb r0, [r3]
	ldr r0, [r2, #0xc]
	movs r1, #0xb
	negs r1, r1
	ands r0, r1
	str r0, [r2, #0xc]
	ldr r0, [r2]
	ldrb r0, [r0, #4]
	bl Reset203E87C_WithVal
	ldr r0, _0809AC1C  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809AC0C
	movs r0, #0x6a
	bl m4aSongNumStart
_0809AC0C:
	ldrh r1, [r4, #0x2e]
	lsrs r1, r1, #1
	adds r0, r4, #0
	bl PrepUnit_DrawUnitListNames
	movs r0, #1
	b _0809AC34
	.align 2, 0
_0809AC1C: .4byte gRAMChapterData
_0809AC20:
	ldr r0, _0809AC3C  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809AC32
	movs r0, #0x6c
	bl m4aSongNumStart
_0809AC32:
	movs r0, #0
_0809AC34:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0809AC3C: .4byte gRAMChapterData

	THUMB_FUNC_END sub_809ABD0

	THUMB_FUNC_START sub_809AC40
sub_809AC40: @ 0x0809AC40
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	ldr r0, [r4]
	ldrb r0, [r0, #4]
	bl IsCharacterForceDeployed
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0809AC94
	adds r1, r5, #0
	adds r1, #0x29
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	ldr r0, [r4, #0xc]
	movs r1, #0xa
	orrs r0, r1
	str r0, [r4, #0xc]
	ldr r0, [r4]
	ldrb r0, [r0, #4]
	bl Modify203E87C
	ldr r0, _0809AC90  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809AC80
	movs r0, #0x6b
	bl m4aSongNumStart
_0809AC80:
	ldrh r1, [r5, #0x2e]
	lsrs r1, r1, #1
	adds r0, r5, #0
	bl PrepUnit_DrawUnitListNames
	movs r0, #1
	b _0809ACA8
	.align 2, 0
_0809AC90: .4byte gRAMChapterData
_0809AC94:
	ldr r0, _0809ACB0  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809ACA6
	movs r0, #0x6c
	bl m4aSongNumStart
_0809ACA6:
	movs r0, #0
_0809ACA8:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0809ACB0: .4byte gRAMChapterData

	THUMB_FUNC_END sub_809AC40

	THUMB_FUNC_START sub_809ACB4
sub_809ACB4: @ 0x0809ACB4
	push {r4, r5, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2e]
	bl GetUnitFromPrepList
	adds r5, r0, #0
	ldr r1, [r5, #0xc]
	movs r0, #0x80
	lsls r0, r0, #0x12
	ands r0, r1
	cmp r0, #0
	beq _0809ACF4
	ldrh r1, [r4, #0x2e]
	movs r2, #1
	ands r2, r1
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #3
	adds r0, #0x70
	lsrs r1, r1, #1
	lsls r1, r1, #4
	ldrh r2, [r4, #0x30]
	subs r1, r1, r2
	adds r1, #0x18
	ldr r2, _0809ACF0  @ 0x00000C52
_0809ACE6:
	adds r3, r4, #0
	bl sub_8097DA8
	b _0809AD88
	.align 2, 0
_0809ACF0: .4byte 0x00000C52
_0809ACF4:
	movs r0, #8
	ands r1, r0
	cmp r1, #0
	beq _0809AD76
	bl CheckSomethingSomewhere
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809AD34
	adds r0, r5, #0
	bl sub_8097E74
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0809AD34
	ldrh r1, [r4, #0x2e]
	movs r2, #1
	ands r2, r1
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #3
	adds r0, #0x70
	lsrs r1, r1, #1
	lsls r1, r1, #4
	ldrh r2, [r4, #0x30]
	subs r1, r1, r2
	adds r1, #0x18
	ldr r2, _0809AD30  @ 0x0000088A
	b _0809ACE6
	.align 2, 0
_0809AD30: .4byte 0x0000088A
_0809AD34:
	bl CheckSomethingSomewhere
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809AD6C
	adds r0, r5, #0
	bl sub_8097E38
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0809AD6C
	ldrh r1, [r4, #0x2e]
	movs r2, #1
	ands r2, r1
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #3
	adds r0, #0x70
	lsrs r1, r1, #1
	lsls r1, r1, #4
	ldrh r2, [r4, #0x30]
	subs r1, r1, r2
	adds r1, #0x18
	ldr r2, _0809AD68  @ 0x00000889
	b _0809ACE6
	.align 2, 0
_0809AD68: .4byte 0x00000889
_0809AD6C:
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_809ABD0
	b _0809AD7E
_0809AD76:
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_809AC40
_0809AD7E:
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809AD88
	movs r0, #1
	b _0809AD8A
_0809AD88:
	movs r0, #0
_0809AD8A:
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_809ACB4

	THUMB_FUNC_START ShouldPrepUnitMenuScroll
ShouldPrepUnitMenuScroll: @ 0x0809AD90
	push {r4, r5, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x30]
	lsrs r1, r0, #4
	cmp r1, #0
	ble _0809ADA4
	ldrh r0, [r4, #0x2e]
	lsrs r0, r0, #1
	cmp r0, r1
	ble _0809ADBA
_0809ADA4:
	adds r5, r1, #5
	bl PrepGetUnitAmount
	subs r0, #1
	asrs r0, r0, #1
	cmp r5, r0
	bge _0809ADBE
	ldrh r0, [r4, #0x2e]
	lsrs r0, r0, #1
	cmp r0, r5
	blt _0809ADBE
_0809ADBA:
	movs r0, #1
	b _0809ADC0
_0809ADBE:
	movs r0, #0
_0809ADC0:
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END ShouldPrepUnitMenuScroll

	THUMB_FUNC_START sub_809ADC8
sub_809ADC8: @ 0x0809ADC8
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	bl ShouldPrepUnitMenuScroll
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809AE0A
	ldrh r0, [r5, #0x2e]
	lsrs r4, r0, #1
	ldrh r0, [r5, #0x30]
	lsrs r6, r0, #4
	bl PrepGetUnitAmount
	subs r0, #1
	asrs r1, r0, #1
	cmp r4, r6
	bgt _0809ADFC
	cmp r4, #0
	bne _0809ADF2
	strh r4, [r5, #0x30]
	b _0809ADF8
_0809ADF2:
	subs r0, r4, #1
	lsls r0, r0, #4
	strh r0, [r5, #0x30]
_0809ADF8:
	cmp r4, r6
	ble _0809AE0A
_0809ADFC:
	cmp r4, r1
	bne _0809AE04
	subs r0, r4, #5
	b _0809AE06
_0809AE04:
	subs r0, r4, #4
_0809AE06:
	lsls r0, r0, #4
	strh r0, [r5, #0x30]
_0809AE0A:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_809ADC8

	THUMB_FUNC_START sub_809AE10
sub_809AE10: @ 0x0809AE10
	push {r4, r5, lr}
	movs r5, #0
	ldrh r0, [r0, #0x30]
	lsrs r4, r0, #4
	bl PrepGetUnitAmount
	subs r0, #1
	asrs r1, r0, #1
	cmp r4, #0
	ble _0809AE26
	movs r5, #1
_0809AE26:
	adds r0, r4, #5
	cmp r0, r1
	bge _0809AE30
	movs r0, #2
	orrs r5, r0
_0809AE30:
	adds r0, r5, #0
	bl sub_80ACD60
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_809AE10

	THUMB_FUNC_START ProcPrepUnit_OnInit
ProcPrepUnit_OnInit: @ 0x0809AE3C
	push {r4, lr}
	adds r4, r0, #0
	bl MakePrepUnitList
	bl PrepGetLatestCharId
	bl UnitGetIndexInPrepList
	movs r1, #0
	strh r0, [r4, #0x2e]
	ldr r0, [r4, #0x14]
	adds r0, #0x2a
	ldrb r0, [r0]
	adds r2, r4, #0
	adds r2, #0x2a
	strb r0, [r2]
	ldr r0, [r4, #0x14]
	adds r0, #0x2b
	ldrb r0, [r0]
	subs r2, #1
	strb r0, [r2]
	ldr r0, [r4, #0x14]
	ldrh r0, [r0, #0x3c]
	strh r0, [r4, #0x30]
	ldrh r0, [r4, #0x2e]
	strh r0, [r4, #0x2c]
	adds r0, r4, #0
	adds r0, #0x37
	strb r1, [r0]
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END ProcPrepUnit_OnInit

	THUMB_FUNC_START ProcPrepUnit_InitScreen
ProcPrepUnit_InitScreen: @ 0x0809AE7C
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r0, _0809AFF8  @ gUnknown_08A181E8
	bl SetupBackgrounds
	ldr r4, _0809AFFC  @ gLCDControlBuffer
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
	adds r0, r5, #0
	bl sub_809ADC8
	ldr r0, _0809B000  @ gBG0TilemapBuffer
	movs r1, #0
	bl BG_Fill
	ldr r0, _0809B004  @ gBG1TilemapBuffer
	movs r1, #0
	bl BG_Fill
	ldr r0, _0809B008  @ gBG2TilemapBuffer
	movs r1, #0
	bl BG_Fill
	ldrb r2, [r4, #0xc]
	movs r1, #4
	negs r1, r1
	adds r0, r1, #0
	ands r0, r2
	movs r3, #2
	orrs r0, r3
	strb r0, [r4, #0xc]
	ldrb r2, [r4, #0x10]
	adds r0, r1, #0
	ands r0, r2
	orrs r0, r3
	strb r0, [r4, #0x10]
	ldrb r0, [r4, #0x14]
	ands r1, r0
	movs r0, #1
	orrs r1, r0
	strb r1, [r4, #0x14]
	ldrb r0, [r4, #0x18]
	movs r1, #3
	orrs r0, r1
	strb r0, [r4, #0x18]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	ldrh r2, [r5, #0x30]
	subs r2, #0x18
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #2
	movs r1, #0
	bl BG_SetPosition
	movs r0, #3
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	bl PrepUnit_InitTexts
	bl PrepUnit_InitGfx
	movs r0, #7
	bl BG_EnableSyncByMask
	bl SetDefaultColorEffects
	adds r0, r5, #0
	bl sub_809A8F8
	ldr r0, _0809B00C  @ PrepUnit_DrawSMSAndObjs
	adds r1, r5, #0
	bl StartParallelWorker
	adds r0, r5, #0
	bl ResetPrepScreenHandCursor
	movs r0, #0xc0
	lsls r0, r0, #3
	movs r1, #1
	bl sub_80AD4A0
	ldrh r1, [r5, #0x2e]
	movs r2, #1
	ands r2, r1
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #3
	adds r0, #0x70
	lsrs r1, r1, #1
	lsls r1, r1, #4
	ldrh r2, [r5, #0x30]
	subs r2, #0x18
	subs r1, r1, r2
	movs r3, #0x80
	lsls r3, r3, #4
	movs r2, #7
	bl sub_80AD51C
	movs r3, #0x80
	lsls r3, r3, #2
	movs r0, #2
	str r0, [sp]
	adds r0, r5, #0
	movs r1, #0xe0
	movs r2, #0x20
	bl sub_8097748
	ldrh r4, [r5, #0x30]
	bl PrepGetUnitAmount
	adds r2, r0, #0
	subs r2, #1
	lsrs r0, r2, #0x1f
	adds r2, r2, r0
	asrs r2, r2, #1
	adds r2, #1
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #0xa
	adds r1, r4, #0
	movs r3, #6
	bl sub_80976CC
	movs r0, #0x20
	movs r1, #0x8f
	movs r2, #9
	adds r3, r5, #0
	bl StartHelpPromptSprite
	ldrh r0, [r5, #0x2e]
	bl GetUnitFromPrepList
	bl PrepUnit_DrawUnitItems
	ldrh r0, [r5, #0x2e]
	bl GetUnitFromPrepList
	bl sub_809A930
	movs r4, #0
_0809AFC4:
	ldrh r1, [r5, #0x30]
	lsrs r1, r1, #4
	adds r1, r1, r4
	adds r0, r5, #0
	bl PrepUnit_DrawUnitListNames
	adds r4, #1
	cmp r4, #5
	ble _0809AFC4
	adds r0, r5, #0
	movs r1, #0
	bl sub_809AAF0
	adds r0, r5, #0
	bl NewGreenTextColorManager
	ldr r0, _0809B010  @ 0x06014800
	movs r1, #5
	bl LoadDialogueBoxGfx
	bl EndSlidingWallEffectMaybe
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0809AFF8: .4byte gUnknown_08A181E8
_0809AFFC: .4byte gLCDControlBuffer
_0809B000: .4byte gBG0TilemapBuffer
_0809B004: .4byte gBG1TilemapBuffer
_0809B008: .4byte gBG2TilemapBuffer
_0809B00C: .4byte PrepUnit_DrawSMSAndObjs
_0809B010: .4byte 0x06014800

	THUMB_FUNC_END ProcPrepUnit_InitScreen

	THUMB_FUNC_START sub_809B014
sub_809B014: @ 0x0809B014
	push {lr}
	bl Delete6CMenuScroll
	bl EndAllParallelWorkers
	bl sub_80AD2D4
	bl EndPrepScreenHandCursor
	bl EndHelpPromptSprite
	bl sub_80ACDDC
	bl EndBG3Slider_
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_809B014

	THUMB_FUNC_START ProcPrepUnit_Idle
ProcPrepUnit_Idle: @ 0x0809B038
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldrh r0, [r5, #0x2c]
	ldrh r1, [r5, #0x2e]
	cmp r0, r1
	beq _0809B046
	b _0809B25A
_0809B046:
	ldr r4, _0809B094  @ gKeyStatusPtr
	ldr r2, [r4]
	ldrh r6, [r2, #6]
	adds r3, r5, #0
	adds r3, #0x36
	movs r7, #4
	strb r7, [r3]
	ldrh r1, [r2, #4]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0809B066
	ldrh r6, [r2, #4]
	movs r0, #8
	strb r0, [r3]
_0809B066:
	ldr r0, [r4]
	ldrh r1, [r0, #8]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _0809B0BC
	adds r0, r5, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #0
	bne _0809B09C
	ldr r0, _0809B098  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	bge _0809B08A
	b _0809B2D4
_0809B08A:
	movs r0, #0x6c
	bl m4aSongNumStart
	b _0809B2D4
	.align 2, 0
_0809B094: .4byte gKeyStatusPtr
_0809B098: .4byte gRAMChapterData
_0809B09C:
	ldr r0, _0809B0B8  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809B0AE
	movs r0, #0x6a
	bl m4aSongNumStart
_0809B0AE:
	adds r0, r5, #0
	movs r1, #0x63
	bl Proc_Goto
	b _0809B2D4
	.align 2, 0
_0809B0B8: .4byte gRAMChapterData
_0809B0BC:
	adds r0, r7, #0
	ands r0, r1
	cmp r0, #0
	beq _0809B0E4
	ldr r0, _0809B0E0  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809B0D6
	movs r0, #0x6a
	bl m4aSongNumStart
_0809B0D6:
	adds r0, r5, #0
	movs r1, #3
	bl Proc_Goto
	b _0809B2D4
	.align 2, 0
_0809B0E0: .4byte gRAMChapterData
_0809B0E4:
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0809B0F8
	adds r0, r5, #0
	movs r1, #4
	bl Proc_Goto
	b _0809B2D4
_0809B0F8:
	movs r2, #1
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	beq _0809B11A
	adds r0, r5, #0
	bl sub_809ACB4
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0809B110
	b _0809B2D4
_0809B110:
	adds r0, r5, #0
	movs r1, #1
	bl sub_809AAF0
	b _0809B2D4
_0809B11A:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0809B144
	ldr r0, _0809B140  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809B134
	movs r0, #0x6b
	bl m4aSongNumStart
_0809B134:
	adds r0, r5, #0
	movs r1, #0xa
	bl Proc_Goto
	b _0809B2D4
	.align 2, 0
_0809B140: .4byte gRAMChapterData
_0809B144:
	movs r0, #0x20
	ands r0, r6
	cmp r0, #0
	beq _0809B15A
	ldrh r1, [r5, #0x2e]
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	beq _0809B15A
	subs r0, r1, #1
	strh r0, [r5, #0x2e]
_0809B15A:
	movs r0, #0x10
	ands r0, r6
	cmp r0, #0
	beq _0809B17E
	ldrh r1, [r5, #0x2e]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _0809B17E
	ldrh r4, [r5, #0x2e]
	bl PrepGetUnitAmount
	subs r0, #1
	cmp r4, r0
	bge _0809B17E
	ldrh r0, [r5, #0x2e]
	adds r0, #1
	strh r0, [r5, #0x2e]
_0809B17E:
	movs r0, #0x40
	ands r0, r6
	cmp r0, #0
	beq _0809B190
	ldrh r0, [r5, #0x2e]
	subs r0, #2
	cmp r0, #0
	blt _0809B190
	strh r0, [r5, #0x2e]
_0809B190:
	movs r0, #0x80
	ands r6, r0
	cmp r6, #0
	beq _0809B1AC
	ldrh r4, [r5, #0x2e]
	adds r4, #2
	bl PrepGetUnitAmount
	subs r0, #1
	cmp r4, r0
	bgt _0809B1AC
	ldrh r0, [r5, #0x2e]
	adds r0, #2
	strh r0, [r5, #0x2e]
_0809B1AC:
	ldrh r0, [r5, #0x2c]
	ldrh r1, [r5, #0x2e]
	cmp r0, r1
	bne _0809B1B6
	b _0809B2D4
_0809B1B6:
	ldrh r0, [r5, #0x2e]
	bl GetUnitFromPrepList
	bl PrepUnit_DrawUnitItems
	ldr r0, _0809B224  @ sub_809A9E8
	movs r1, #1
	adds r2, r5, #0
	bl sub_80ACE20
	ldr r0, _0809B228  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809B1DC
	movs r0, #0x65
	bl m4aSongNumStart
_0809B1DC:
	adds r0, r5, #0
	bl ShouldPrepUnitMenuScroll
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809B22C
	ldrh r0, [r5, #0x2e]
	ldrh r1, [r5, #0x2c]
	cmp r0, r1
	bcs _0809B1FC
	ldrh r1, [r5, #0x30]
	lsrs r1, r1, #4
	subs r1, #1
	adds r0, r5, #0
	bl PrepUnit_DrawUnitListNames
_0809B1FC:
	ldrh r0, [r5, #0x2e]
	ldrh r1, [r5, #0x2c]
	cmp r0, r1
	bls _0809B210
	ldrh r1, [r5, #0x30]
	lsrs r1, r1, #4
	adds r1, #6
	adds r0, r5, #0
	bl PrepUnit_DrawUnitListNames
_0809B210:
	ldrh r0, [r5, #0x2e]
	movs r1, #1
	ands r1, r0
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #3
	adds r0, #0x70
	bl sub_80AD4E4
	b _0809B252
	.align 2, 0
_0809B224: .4byte sub_809A9E8
_0809B228: .4byte gRAMChapterData
_0809B22C:
	ldrh r1, [r5, #0x2e]
	strh r1, [r5, #0x2c]
	movs r2, #1
	ands r2, r1
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #3
	adds r0, #0x70
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x11
	lsls r1, r1, #4
	ldrh r2, [r5, #0x30]
	subs r2, #0x18
	subs r1, r1, r2
	movs r3, #0x80
	lsls r3, r3, #4
	movs r2, #7
	bl sub_80AD51C
_0809B252:
	ldrh r0, [r5, #0x2c]
	ldrh r1, [r5, #0x2e]
	cmp r0, r1
	beq _0809B2D4
_0809B25A:
	ldrh r3, [r5, #0x2e]
	ldrh r2, [r5, #0x2c]
	cmp r3, r2
	bcs _0809B26E
	adds r0, r5, #0
	adds r0, #0x36
	ldrb r1, [r0]
	ldrh r0, [r5, #0x30]
	subs r0, r0, r1
	strh r0, [r5, #0x30]
_0809B26E:
	cmp r3, r2
	bls _0809B27E
	adds r1, r5, #0
	adds r1, #0x36
	ldrh r0, [r5, #0x30]
	ldrb r1, [r1]
	adds r0, r0, r1
	strh r0, [r5, #0x30]
_0809B27E:
	ldrh r1, [r5, #0x30]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #0
	bne _0809B2A4
	lsrs r0, r1, #4
	subs r0, #1
	bl sub_809A644
	ldrh r0, [r5, #0x30]
	lsrs r0, r0, #4
	adds r0, #6
	bl sub_809A644
	adds r0, r5, #0
	bl sub_809AE10
	ldrh r0, [r5, #0x2e]
	strh r0, [r5, #0x2c]
_0809B2A4:
	ldrh r2, [r5, #0x30]
	subs r2, #0x18
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #2
	movs r1, #0
	bl BG_SetPosition
	ldrh r4, [r5, #0x30]
	bl PrepGetUnitAmount
	adds r2, r0, #0
	subs r2, #1
	lsrs r0, r2, #0x1f
	adds r2, r2, r0
	asrs r2, r2, #1
	adds r2, #1
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #0xa
	adds r1, r4, #0
	movs r3, #6
	bl sub_80976CC
_0809B2D4:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END ProcPrepUnit_Idle

	THUMB_FUNC_START sub_809B2DC
sub_809B2DC: @ 0x0809B2DC
	push {r4, lr}
	adds r4, r0, #0
	ldrh r1, [r4, #0x34]
	adds r1, #4
	strh r1, [r4, #0x34]
	ldrh r0, [r4, #0x30]
	adds r0, #4
	strh r0, [r4, #0x30]
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	cmp r1, #0x20
	bne _0809B2FA
	adds r0, r4, #0
	bl Proc_Break
_0809B2FA:
	ldrh r2, [r4, #0x30]
	subs r2, #0x18
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #2
	movs r1, #0
	bl BG_SetPosition
	ldrh r1, [r4, #0x30]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #0
	bne _0809B31C
	lsrs r0, r1, #4
	subs r0, #1
	bl sub_809A644
_0809B31C:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_809B2DC

	THUMB_FUNC_START sub_809B324
sub_809B324: @ 0x0809B324
	push {r4, lr}
	adds r4, r0, #0
	ldrh r1, [r4, #0x30]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #0
	bne _0809B33C
	lsrs r1, r1, #4
	subs r1, #1
	adds r0, r4, #0
	bl PrepUnit_DrawUnitListNames
_0809B33C:
	ldrh r1, [r4, #0x34]
	subs r1, #4
	strh r1, [r4, #0x34]
	ldrh r0, [r4, #0x30]
	subs r0, #4
	strh r0, [r4, #0x30]
	lsls r1, r1, #0x10
	cmp r1, #0
	bne _0809B354
	adds r0, r4, #0
	bl Proc_Break
_0809B354:
	ldrh r2, [r4, #0x30]
	subs r2, #0x18
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #2
	movs r1, #0
	bl BG_SetPosition
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_809B324

	THUMB_FUNC_START nullsub_21
nullsub_21: @ 0x0809B36C
	bx lr

	THUMB_FUNC_END nullsub_21

	THUMB_FUNC_START sub_809B370
sub_809B370: @ 0x0809B370
	push {lr}
	bl nullsub_21
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0xd0
	movs r1, #0x68
	movs r2, #0
	bl sub_80AD51C
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_809B370

	THUMB_FUNC_START sub_809B388
sub_809B388: @ 0x0809B388
	push {lr}
	adds r3, r0, #0
	ldrh r1, [r3, #0x2e]
	movs r2, #1
	ands r2, r1
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #3
	adds r0, #0x70
	lsrs r1, r1, #1
	lsls r1, r1, #4
	ldrh r2, [r3, #0x30]
	subs r2, #0x18
	subs r1, r1, r2
	movs r3, #0x80
	lsls r3, r3, #4
	movs r2, #7
	bl sub_80AD51C
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_809B388

	THUMB_FUNC_START sub_809B3B4
sub_809B3B4: @ 0x0809B3B4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0809B404  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0809B3D8
	ldr r0, _0809B408  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809B3D8
	movs r0, #0x6c
	bl m4aSongNumStart
_0809B3D8:
	ldr r0, _0809B404  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0809B3FE
	ldr r0, _0809B408  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809B3F8
	movs r0, #0x65
	bl m4aSongNumStart
_0809B3F8:
	adds r0, r4, #0
	bl Proc_Break
_0809B3FE:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809B404: .4byte gKeyStatusPtr
_0809B408: .4byte gRAMChapterData

	THUMB_FUNC_END sub_809B3B4

	THUMB_FUNC_START ProcPrepUnit_OnEnd
ProcPrepUnit_OnEnd: @ 0x0809B40C
	push {lr}
	ldr r2, [r0, #0x14]
	ldrh r1, [r0, #0x30]
	strh r1, [r2, #0x3c]
	ldr r1, [r0, #0x14]
	adds r2, r0, #0
	adds r2, #0x29
	ldrb r2, [r2]
	adds r1, #0x2b
	strb r2, [r1]
	ldrh r0, [r0, #0x2e]
	bl GetUnitFromPrepList
	ldr r0, [r0]
	ldrb r0, [r0, #4]
	bl PrepSetLatestCharId
	bl EndBG3Slider_
	pop {r0}
	bx r0

	THUMB_FUNC_END ProcPrepUnit_OnEnd

	THUMB_FUNC_START ProcPrepUnit_OnGameStart
ProcPrepUnit_OnGameStart: @ 0x0809B438
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x14]
	adds r0, #0x36
	movs r5, #1
	strb r5, [r0]
	ldr r0, [r4, #0x14]
	movs r1, #6
	bl Proc_Goto
	adds r4, #0x37
	strb r5, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END ProcPrepUnit_OnGameStart

	THUMB_FUNC_START sub_809B458
sub_809B458: @ 0x0809B458
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2e]
	bl GetUnitFromPrepList
	ldr r0, [r0]
	ldrb r0, [r0, #4]
	bl PrepSetLatestCharId
	adds r0, r4, #0
	bl sub_80920DC
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_809B458

	THUMB_FUNC_START sub_809B478
sub_809B478: @ 0x0809B478
	push {r4, r5, lr}
	adds r4, r0, #0
	bl GetLatestUnitIndexInPrepListByCharId
	movs r1, #0
	strh r0, [r4, #0x2c]
	strh r0, [r4, #0x2e]
	adds r4, #0x29
	strb r1, [r4]
	movs r5, #1
_0809B48C:
	adds r0, r5, #0
	bl GetUnit
	adds r1, r0, #0
	cmp r1, #0
	beq _0809B4AE
	ldr r0, [r1]
	cmp r0, #0
	beq _0809B4AE
	ldr r0, [r1, #0xc]
	ldr r1, _0809B4BC  @ 0x0001000C
	ands r0, r1
	cmp r0, #0
	bne _0809B4AE
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
_0809B4AE:
	adds r5, #1
	cmp r5, #0x3f
	ble _0809B48C
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0809B4BC: .4byte 0x0001000C

	THUMB_FUNC_END sub_809B478

	THUMB_FUNC_START sub_809B4C0
sub_809B4C0: @ 0x0809B4C0
	ldr r2, _0809B4E0  @ gLCDControlBuffer
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
_0809B4E0: .4byte gLCDControlBuffer

	THUMB_FUNC_END sub_809B4C0

	THUMB_FUNC_START sub_809B4E4
sub_809B4E4: @ 0x0809B4E4
	ldr r2, _0809B500  @ gLCDControlBuffer
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
_0809B500: .4byte gLCDControlBuffer

	THUMB_FUNC_END sub_809B4E4

	THUMB_FUNC_START sub_809B504
sub_809B504: @ 0x0809B504
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x11
	bl SetStatScreenConfig
	ldrh r0, [r4, #0x2e]
	bl GetUnitFromPrepList
	adds r1, r4, #0
	bl StartStatScreen
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_809B504

	THUMB_FUNC_START sub_809B520
sub_809B520: @ 0x0809B520
	push {r4, lr}
	adds r4, r0, #0
	bl MakePrepUnitList
	bl GetLatestUnitIndexInPrepListByUId
	strh r0, [r4, #0x2c]
	strh r0, [r4, #0x2e]
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_809B520

	THUMB_FUNC_START sub_809B538
sub_809B538: @ 0x0809B538
	push {r4, r5, r6, lr}
	adds r6, r2, #0
	lsls r1, r1, #1
	adds r4, r0, #0
	adds r4, #0x1e
	adds r4, r4, r1
	ldrh r5, [r4]
	lsls r3, r3, #1
	adds r1, r6, #0
	adds r1, #0x1e
	adds r1, r1, r3
	ldrh r2, [r1]
	strh r2, [r4]
	strh r5, [r1]
	bl UnitRemoveInvalidItems
	adds r0, r6, #0
	bl UnitRemoveInvalidItems
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_809B538

	THUMB_FUNC_START sub_809B564
sub_809B564: @ 0x0809B564
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0809B5C8  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _0809B5E8
	ldr r0, [r4, #0x34]
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	bne _0809B582
	b _0809B744
_0809B582:
	ldr r0, [r4, #0x2c]
	bl GetUnitItemCount
	adds r2, r0, #0
	ldr r3, [r4, #0x38]
	cmp r3, #0xff
	beq _0809B5B0
	ldr r0, [r4, #0x3c]
	cmp r0, #0xff
	bne _0809B5B0
	ldr r0, [r4, #0x34]
	adds r0, #8
	asrs r0, r0, #3
	movs r1, #1
	ands r0, r1
	asrs r1, r3, #3
	cmp r0, r1
	beq _0809B5B0
	movs r0, #5
	cmp r2, #5
	beq _0809B5AE
	adds r0, r2, #1
_0809B5AE:
	adds r2, r0, #0
_0809B5B0:
	cmp r2, #0
	bgt _0809B5B6
	b _0809B744
_0809B5B6:
	ldr r1, [r4, #0x34]
	movs r0, #7
	ands r0, r1
	cmp r2, r0
	ble _0809B5CC
	adds r0, r1, #0
	subs r0, #8
	b _0809B5CE
	.align 2, 0
_0809B5C8: .4byte gKeyStatusPtr
_0809B5CC:
	subs r0, r2, #1
_0809B5CE:
	str r0, [r4, #0x34]
	ldr r0, _0809B5E4  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	bge _0809B5DE
	b _0809B738
_0809B5DE:
	movs r0, #0x67
	b _0809B734
	.align 2, 0
_0809B5E4: .4byte gRAMChapterData
_0809B5E8:
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _0809B658
	ldr r0, [r4, #0x34]
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	beq _0809B5FC
	b _0809B744
_0809B5FC:
	ldr r0, [r4, #0x30]
	bl GetUnitItemCount
	adds r2, r0, #0
	ldr r3, [r4, #0x38]
	cmp r3, #0xff
	beq _0809B62A
	ldr r0, [r4, #0x3c]
	cmp r0, #0xff
	bne _0809B62A
	ldr r0, [r4, #0x34]
	adds r0, #8
	asrs r0, r0, #3
	movs r1, #1
	ands r0, r1
	asrs r1, r3, #3
	cmp r0, r1
	beq _0809B62A
	movs r0, #5
	cmp r2, #5
	beq _0809B628
	adds r0, r2, #1
_0809B628:
	adds r2, r0, #0
_0809B62A:
	cmp r2, #0
	bgt _0809B630
	b _0809B744
_0809B630:
	ldr r1, [r4, #0x34]
	movs r0, #7
	ands r0, r1
	cmp r2, r0
	ble _0809B640
	adds r0, r1, #0
	adds r0, #8
	b _0809B642
_0809B640:
	adds r0, r2, #7
_0809B642:
	str r0, [r4, #0x34]
	ldr r0, _0809B654  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809B738
	movs r0, #0x67
	b _0809B734
	.align 2, 0
_0809B654: .4byte gRAMChapterData
_0809B658:
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0809B6C4
	ldr r0, [r4, #0x34]
	asrs r0, r0, #3
	lsls r0, r0, #2
	adds r1, r4, #0
	adds r1, #0x2c
	adds r1, r1, r0
	ldr r0, [r1]
	bl GetUnitItemCount
	adds r3, r0, #0
	ldr r1, [r4, #0x38]
	cmp r1, #0xff
	beq _0809B694
	ldr r0, [r4, #0x3c]
	cmp r0, #0xff
	bne _0809B694
	ldr r0, [r4, #0x34]
	asrs r0, r0, #3
	asrs r1, r1, #3
	cmp r0, r1
	beq _0809B694
	movs r0, #5
	cmp r3, #5
	beq _0809B692
	adds r0, r3, #1
_0809B692:
	adds r3, r0, #0
_0809B694:
	ldr r2, [r4, #0x34]
	movs r0, #7
	ands r0, r2
	cmp r0, #0
	ble _0809B6A4
	subs r0, r2, #1
	str r0, [r4, #0x34]
	b _0809B726
_0809B6A4:
	ldr r0, _0809B6C0  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0809B744
	movs r0, #8
	ands r2, r0
	adds r0, r2, r3
	subs r0, #1
	str r0, [r4, #0x34]
	b _0809B726
	.align 2, 0
_0809B6C0: .4byte gKeyStatusPtr
_0809B6C4:
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0809B744
	ldr r0, [r4, #0x34]
	asrs r0, r0, #3
	lsls r0, r0, #2
	adds r1, r4, #0
	adds r1, #0x2c
	adds r1, r1, r0
	ldr r0, [r1]
	bl GetUnitItemCount
	adds r3, r0, #0
	ldr r1, [r4, #0x38]
	cmp r1, #0xff
	beq _0809B700
	ldr r0, [r4, #0x3c]
	cmp r0, #0xff
	bne _0809B700
	ldr r0, [r4, #0x34]
	asrs r0, r0, #3
	asrs r1, r1, #3
	cmp r0, r1
	beq _0809B700
	movs r0, #5
	cmp r3, #5
	beq _0809B6FE
	adds r0, r3, #1
_0809B6FE:
	adds r3, r0, #0
_0809B700:
	ldr r2, [r4, #0x34]
	movs r0, #7
	ands r0, r2
	subs r1, r3, #1
	cmp r0, r1
	bge _0809B712
	adds r0, r2, #1
	str r0, [r4, #0x34]
	b _0809B726
_0809B712:
	ldr r0, _0809B73C  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0809B744
	movs r0, #8
	ands r2, r0
	str r2, [r4, #0x34]
_0809B726:
	ldr r0, _0809B740  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809B738
	movs r0, #0x66
_0809B734:
	bl m4aSongNumStart
_0809B738:
	movs r0, #1
	b _0809B746
	.align 2, 0
_0809B73C: .4byte gKeyStatusPtr
_0809B740: .4byte gRAMChapterData
_0809B744:
	movs r0, #0
_0809B746:
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_809B564

	THUMB_FUNC_START sub_809B74C
sub_809B74C: @ 0x0809B74C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x18
	adds r4, r0, #0
	mov r9, r1
	mov sl, r2
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	str r3, [sp, #8]
	movs r1, #0xb
	movs r2, #9
	movs r3, #0
	bl TileMap_FillRect
	mov r0, sl
	bl GetUnitItemCount
	str r0, [sp, #0x10]
	movs r0, #0
	str r0, [sp, #0xc]
	ldr r1, [sp, #0x10]
	cmp r0, r1
	bge _0809B820
	adds r0, r4, #4
	str r0, [sp, #0x14]
	mov r8, r4
_0809B786:
	ldr r0, [sp, #0xc]
	lsls r1, r0, #1
	mov r0, sl
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r6, [r0]
	ldr r1, [sp, #8]
	cmp r1, #0
	beq _0809B7A2
	mov r0, sl
	adds r1, r6, #0
	bl CanUnitUseItemPrepScreen
	b _0809B7AA
_0809B7A2:
	mov r0, sl
	adds r1, r6, #0
	bl IsItemDisplayUsable
_0809B7AA:
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	mov r0, r9
	bl Text_Clear
	adds r0, r6, #0
	bl GetItemName
	adds r1, r0, #0
	movs r2, #0
	lsls r0, r4, #0x18
	asrs r5, r0, #0x18
	cmp r5, #0
	bne _0809B7C8
	movs r2, #1
_0809B7C8:
	movs r0, #0
	str r0, [sp]
	str r1, [sp, #4]
	mov r0, r9
	ldr r1, [sp, #0x14]
	movs r3, #0
	bl DrawTextInline
	mov r4, r8
	adds r4, #0x16
	movs r7, #1
	cmp r5, #0
	beq _0809B7E4
	movs r7, #2
_0809B7E4:
	adds r0, r6, #0
	bl GetItemUses
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r7, #0
	bl DrawDecNumber
	adds r0, r6, #0
	bl GetItemIconId
	adds r1, r0, #0
	mov r0, r8
	movs r2, #0x80
	lsls r2, r2, #7
	bl DrawIcon
	movs r0, #8
	add r9, r0
	ldr r1, [sp, #0x14]
	adds r1, #0x80
	str r1, [sp, #0x14]
	movs r0, #0x80
	add r8, r0
	ldr r1, [sp, #0xc]
	adds r1, #1
	str r1, [sp, #0xc]
	ldr r0, [sp, #0x10]
	cmp r1, r0
	blt _0809B786
_0809B820:
	add sp, #0x18
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_809B74C

	THUMB_FUNC_START sub_809B830
sub_809B830: @ 0x0809B830
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r7, r1, #0
	adds r0, r7, #0
	bl GetUnitItemCount
	adds r6, r0, #0
	movs r5, #0
	cmp r5, r6
	bge _0809B866
_0809B844:
	lsls r1, r5, #1
	adds r0, r7, #0
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r0, [r0]
	bl GetItemIconId
	adds r1, r0, #0
	adds r0, r4, #0
	movs r2, #0x80
	lsls r2, r2, #7
	bl DrawIcon
	adds r4, #0x80
	adds r5, #1
	cmp r5, r6
	blt _0809B844
_0809B866:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_809B830

	THUMB_FUNC_START sub_809B86C
sub_809B86C: @ 0x0809B86C
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	sub sp, #0x28
	mov r8, r0
	add r1, sp, #8
	ldr r0, _0809B964  @ gUnknown_08205C44
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldm r0!, {r2, r3}
	stm r1!, {r2, r3}
	ldr r0, _0809B968  @ gUnknown_08A181E8
	ldrh r0, [r0]
	bl SetupBackgrounds
	add r0, sp, #8
	bl SetupFaceGfxData
	ldr r3, _0809B96C  @ gLCDControlBuffer
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
	movs r0, #0
	bl BG_GetMapBuffer
	movs r1, #0
	bl BG_Fill
	movs r0, #1
	bl BG_GetMapBuffer
	movs r1, #0
	bl BG_Fill
	movs r0, #2
	bl BG_GetMapBuffer
	movs r1, #0
	bl BG_Fill
	bl Font_InitForUIDefault
	bl ResetIconGraphics_
	bl LoadUiFrameGraphics
	bl LoadObjUIGfx
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	ldr r0, _0809B970  @ 0x06014000
	movs r1, #1
	negs r1, r1
	bl LoadDialogueBoxGfx
	movs r0, #4
	bl LoadIconPalettes
	bl EndSlidingWallEffectMaybe
	ldr r0, _0809B974  @ gUnknown_02013510
	adds r6, r0, #0
	adds r6, #0x28
	adds r5, r0, #0
	movs r4, #4
_0809B932:
	adds r0, r5, #0
	movs r1, #7
	bl Text_Allocate
	adds r0, r6, #0
	movs r1, #7
	bl Text_Allocate
	adds r6, #8
	adds r5, #8
	subs r4, #1
	cmp r4, #0
	bge _0809B932
	movs r0, #0xff
	mov r4, r8
	str r0, [r4, #0x38]
	ldr r1, [r4, #0x40]
	movs r0, #1
	negs r0, r0
	cmp r1, r0
	beq _0809B978
	adds r0, r1, #0
	adds r0, #8
	str r0, [r4, #0x34]
	b _0809B992
	.align 2, 0
_0809B964: .4byte gUnknown_08205C44
_0809B968: .4byte gUnknown_08A181E8
_0809B96C: .4byte gLCDControlBuffer
_0809B970: .4byte 0x06014000
_0809B974: .4byte gUnknown_02013510
_0809B978:
	mov r1, r8
	ldr r0, [r1, #0x2c]
	bl GetUnitItemCount
	cmp r0, #0
	bne _0809B98C
	movs r0, #8
	mov r2, r8
	str r0, [r2, #0x34]
	b _0809B992
_0809B98C:
	movs r0, #0
	mov r3, r8
	str r0, [r3, #0x34]
_0809B992:
	movs r0, #0xff
	mov r4, r8
	str r0, [r4, #0x3c]
	ldr r0, [r4, #0x2c]
	bl GetUnitPortraitId
	adds r1, r0, #0
	movs r4, #4
	negs r4, r4
	ldr r0, _0809BB24  @ 0x00000203
	str r0, [sp]
	movs r0, #0
	movs r2, #0x40
	adds r3, r4, #0
	bl StartFace2
	mov r1, r8
	ldr r0, [r1, #0x30]
	bl GetUnitPortraitId
	adds r1, r0, #0
	ldr r0, _0809BB28  @ 0x00000202
	str r0, [sp]
	movs r0, #1
	movs r2, #0xae
	adds r3, r4, #0
	bl StartFace2
	movs r6, #0
	str r6, [sp]
	movs r0, #1
	movs r1, #8
	movs r2, #0xe
	movs r3, #0xc
	bl DrawUiFrame2
	str r6, [sp]
	movs r0, #0xf
	movs r1, #8
	movs r2, #0xe
	movs r3, #0xc
	bl DrawUiFrame2
	movs r0, #7
	bl BG_EnableSyncByMask
	mov r2, r8
	ldr r0, [r2, #0x2c]
	ldr r0, [r0]
	ldrh r0, [r0]
	bl GetStringFromIndex
	adds r7, r0, #0
	bl GetStringTextWidth
	adds r3, r0, #0
	movs r4, #0x30
	subs r3, r4, r3
	lsrs r0, r3, #0x1f
	adds r3, r3, r0
	asrs r3, r3, #1
	ldr r0, _0809BB2C  @ gBG0TilemapBuffer
	mov r9, r0
	movs r5, #6
	str r5, [sp]
	str r7, [sp, #4]
	movs r0, #0
	mov r1, r9
	movs r2, #0
	bl DrawTextInline
	mov r1, r8
	ldr r0, [r1, #0x30]
	ldr r0, [r0]
	ldrh r0, [r0]
	bl GetStringFromIndex
	adds r7, r0, #0
	bl GetStringTextWidth
	subs r4, r4, r0
	lsrs r0, r4, #0x1f
	adds r4, r4, r0
	asrs r4, r4, #1
	mov r1, r9
	adds r1, #0x30
	str r5, [sp]
	str r7, [sp, #4]
	movs r0, #0
	movs r2, #0
	adds r3, r4, #0
	bl DrawTextInline
	movs r0, #0x91
	lsls r0, r0, #2
	add r0, r9
	ldr r4, _0809BB30  @ gUnknown_02013510
	mov r3, r8
	ldr r2, [r3, #0x2c]
	adds r1, r4, #0
	movs r3, #0
	bl sub_809B74C
	movs r0, #0x98
	lsls r0, r0, #2
	add r0, r9
	adds r4, #0x28
	mov r1, r8
	ldr r2, [r1, #0x30]
	adds r1, r4, #0
	movs r3, #0
	bl sub_809B74C
	mov r0, r8
	bl sub_80AC9C0
	mov r0, r8
	bl ResetPrepScreenHandCursor
	movs r0, #0xc0
	lsls r0, r0, #3
	movs r1, #1
	bl sub_80AD4A0
	mov r2, r8
	ldr r1, [r2, #0x34]
	asrs r2, r1, #3
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #4
	adds r0, #0x10
	movs r2, #7
	ands r1, r2
	lsls r1, r1, #4
	adds r1, #0x48
	movs r3, #0x80
	lsls r3, r3, #4
	movs r2, #0xb
	bl sub_80AD51C
	movs r0, #0xc8
	movs r1, #0x93
	movs r2, #2
	mov r3, r8
	bl StartHelpPromptSprite
	movs r1, #0xe0
	lsls r1, r1, #4
	movs r3, #0xc0
	lsls r3, r3, #4
	movs r0, #0x80
	lsls r0, r0, #3
	str r0, [sp]
	mov r4, r8
	str r4, [sp, #4]
	movs r0, #0xd
	movs r2, #0xf
	bl StartSmallBrownNameBoxes
	movs r1, #0x28
	negs r1, r1
	movs r4, #1
	negs r4, r4
	movs r0, #0
	adds r2, r4, #0
	movs r3, #1
	bl sub_80ADBFC
	movs r0, #1
	movs r1, #0xb8
	adds r2, r4, #0
	movs r3, #0
	bl sub_80ADBFC
	movs r0, #1
	movs r1, #0xe
	movs r2, #4
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	str r6, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl SetBlendTargetA
	str r6, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #1
	bl SetBlendTargetB
	add sp, #0x28
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809BB24: .4byte 0x00000203
_0809BB28: .4byte 0x00000202
_0809BB2C: .4byte gBG0TilemapBuffer
_0809BB30: .4byte gUnknown_02013510

	THUMB_FUNC_END sub_809B86C

	THUMB_FUNC_START sub_809BB34
sub_809BB34: @ 0x0809BB34
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	ldr r2, [r6, #0x3c]
	cmp r2, #0xff
	beq _0809BB60
	ldr r0, _0809BB5C  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0x81
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	bne _0809BB54
	b _0809BDB8
_0809BB54:
	bl CloseHelpBox
	movs r0, #0xff
	b _0809BE18
	.align 2, 0
_0809BB5C: .4byte gKeyStatusPtr
_0809BB60:
	ldr r0, _0809BB9C  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0809BBA0
	ldr r2, [r6, #0x34]
	asrs r3, r2, #3
	lsls r1, r3, #2
	adds r0, r6, #0
	adds r0, #0x2c
	adds r0, r0, r1
	ldr r0, [r0]
	movs r4, #7
	ands r4, r2
	lsls r1, r4, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r2, [r0]
	cmp r2, #0
	bne _0809BB90
	b _0809BE1A
_0809BB90:
	lsls r0, r3, #3
	subs r0, r0, r3
	lsls r0, r0, #4
	adds r0, #0x10
	lsls r1, r4, #4
	b _0809BE10
	.align 2, 0
_0809BB9C: .4byte gKeyStatusPtr
_0809BBA0:
	ldr r4, [r6, #0x38]
	cmp r4, #0xff
	bne _0809BBA8
	b _0809BD00
_0809BBA8:
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _0809BBB2
	b _0809BCB8
_0809BBB2:
	asrs r0, r4, #3
	lsls r0, r0, #2
	adds r7, r6, #0
	adds r7, #0x2c
	adds r0, r7, r0
	ldr r0, [r0]
	movs r1, #7
	mov r8, r1
	ands r4, r1
	ldr r3, [r6, #0x34]
	asrs r1, r3, #3
	lsls r1, r1, #2
	adds r1, r7, r1
	ldr r2, [r1]
	mov r1, r8
	ands r3, r1
	adds r1, r4, #0
	bl sub_8097EA0
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0809BBF4
	movs r1, #1
	negs r1, r1
	ldr r2, _0809BBF0  @ 0x0000088B
	adds r0, r1, #0
	adds r3, r6, #0
	bl sub_8097DA8
	b _0809BE1A
	.align 2, 0
_0809BBF0: .4byte 0x0000088B
_0809BBF4:
	ldr r1, [r6, #0x38]
	asrs r0, r1, #3
	lsls r0, r0, #2
	adds r0, r7, r0
	ldr r0, [r0]
	mov r2, r8
	ands r1, r2
	ldr r3, [r6, #0x34]
	asrs r2, r3, #3
	lsls r2, r2, #2
	adds r2, r7, r2
	ldr r2, [r2]
	mov r4, r8
	ands r3, r4
	bl sub_809B538
	ldr r4, _0809BC58  @ gUnknown_02022EEC
	ldr r5, _0809BC5C  @ gUnknown_02013510
	ldr r2, [r6, #0x2c]
	adds r0, r4, #0
	adds r1, r5, #0
	movs r3, #0
	bl sub_809B74C
	adds r4, #0x1c
	adds r5, #0x28
	ldr r2, [r6, #0x30]
	adds r0, r4, #0
	adds r1, r5, #0
	movs r3, #0
	bl sub_809B74C
	movs r0, #1
	bl BG_EnableSyncByMask
	ldr r0, [r6, #0x38]
	asrs r0, r0, #3
	lsls r0, r0, #2
	adds r0, r7, r0
	ldr r0, [r0]
	bl GetUnitItemCount
	adds r2, r0, #0
	cmp r2, #0
	bne _0809BC60
	ldr r0, [r6, #0x38]
	adds r0, #8
	movs r1, #8
	ands r0, r1
	b _0809BC74
	.align 2, 0
_0809BC58: .4byte gUnknown_02022EEC
_0809BC5C: .4byte gUnknown_02013510
_0809BC60:
	ldr r1, [r6, #0x38]
	adds r0, r1, #0
	mov r3, r8
	ands r0, r3
	cmp r2, r0
	bgt _0809BC76
	movs r0, #8
	ands r1, r0
	adds r0, r1, r2
	subs r0, #1
_0809BC74:
	str r0, [r6, #0x38]
_0809BC76:
	ldr r0, _0809BCB4  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809BC88
	movs r0, #0x6a
	bl m4aSongNumStart
_0809BC88:
	movs r0, #0
	bl sub_80ACA84
	ldr r1, [r6, #0x38]
	str r1, [r6, #0x34]
	movs r0, #0xff
	str r0, [r6, #0x38]
	asrs r2, r1, #3
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #4
	adds r0, #0x10
	movs r2, #7
	ands r1, r2
	lsls r1, r1, #4
	adds r1, #0x48
	movs r3, #0x80
	lsls r3, r3, #4
	movs r2, #0xb
	bl sub_80AD51C
	b _0809BE1A
	.align 2, 0
_0809BCB4: .4byte gRAMChapterData
_0809BCB8:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _0809BCC2
	b _0809BDB8
_0809BCC2:
	str r4, [r6, #0x34]
	str r2, [r6, #0x38]
	asrs r1, r4, #3
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #4
	adds r0, #0x10
	movs r1, #7
	ands r4, r1
	lsls r1, r4, #4
	adds r1, #0x48
	movs r3, #0x80
	lsls r3, r3, #4
	movs r2, #0xb
	bl sub_80AD51C
	ldr r0, _0809BCFC  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809BCF4
	movs r0, #0x6b
	bl m4aSongNumStart
_0809BCF4:
	movs r0, #0
	bl sub_80ACA84
	b _0809BE1A
	.align 2, 0
_0809BCFC: .4byte gRAMChapterData
_0809BD00:
	movs r2, #1
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	beq _0809BD90
	ldr r0, [r6, #0x34]
	asrs r0, r0, #3
	adds r0, #1
	ands r0, r2
	lsls r0, r0, #2
	adds r1, r6, #0
	adds r1, #0x2c
	adds r1, r1, r0
	ldr r0, [r1]
	bl GetUnitItemCount
	adds r4, r0, #0
	ldr r2, [r6, #0x34]
	str r2, [r6, #0x38]
	asrs r0, r2, #3
	lsls r1, r0, #3
	subs r1, r1, r0
	lsls r1, r1, #4
	adds r1, #0x10
	movs r0, #7
	ands r2, r0
	lsls r2, r2, #4
	adds r2, #0x48
	movs r0, #0
	movs r3, #0
	bl sub_80AC9D4
	cmp r4, #4
	bgt _0809BD50
	ldr r0, [r6, #0x34]
	adds r0, #8
	movs r1, #8
	ands r0, r1
	adds r0, r0, r4
	b _0809BD58
_0809BD50:
	ldr r0, [r6, #0x34]
	adds r0, #8
	movs r1, #0xf
	ands r0, r1
_0809BD58:
	str r0, [r6, #0x34]
	ldr r1, [r6, #0x34]
	asrs r2, r1, #3
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #4
	adds r0, #0x10
	movs r2, #7
	ands r1, r2
	lsls r1, r1, #4
	adds r1, #0x48
	movs r3, #0x80
	lsls r3, r3, #4
	movs r2, #0xb
	bl sub_80AD51C
	ldr r0, _0809BD8C  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809BE1A
	movs r0, #0x6a
	bl m4aSongNumStart
	b _0809BE1A
	.align 2, 0
_0809BD8C: .4byte gRAMChapterData
_0809BD90:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0809BDB8
	adds r0, r6, #0
	bl Proc_Break
	ldr r0, _0809BDB4  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809BE1A
	movs r0, #0x6b
	bl m4aSongNumStart
	b _0809BE1A
	.align 2, 0
_0809BDB4: .4byte gRAMChapterData
_0809BDB8:
	adds r0, r6, #0
	bl sub_809B564
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809BE1A
	ldr r1, [r6, #0x34]
	asrs r2, r1, #3
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #4
	adds r0, #0x10
	movs r5, #7
	ands r1, r5
	lsls r1, r1, #4
	adds r1, #0x48
	movs r3, #0x80
	lsls r3, r3, #4
	movs r2, #0xb
	bl sub_80AD51C
	ldr r0, [r6, #0x3c]
	cmp r0, #0xff
	beq _0809BE1A
	ldr r2, [r6, #0x34]
	asrs r4, r2, #3
	lsls r1, r4, #2
	adds r0, r6, #0
	adds r0, #0x2c
	adds r0, r0, r1
	ldr r0, [r0]
	adds r3, r5, #0
	ands r3, r2
	lsls r1, r3, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r2, [r0]
	cmp r2, #0
	beq _0809BE1A
	lsls r0, r4, #3
	subs r0, r0, r4
	lsls r0, r0, #4
	adds r0, #0x10
	lsls r1, r3, #4
_0809BE10:
	adds r1, #0x48
	bl StartItemHelpBox
	ldr r0, [r6, #0x34]
_0809BE18:
	str r0, [r6, #0x3c]
_0809BE1A:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_809BB34

	THUMB_FUNC_START sub_809BE24
sub_809BE24: @ 0x0809BE24
	push {lr}
	bl EndBG3Slider_
	movs r0, #0
	bl EndFaceById
	movs r0, #1
	bl EndFaceById
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_809BE24

	THUMB_FUNC_START sub_809BE3C
sub_809BE3C: @ 0x0809BE3C
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r1, r2, #0
	ldr r0, _0809BE5C  @ gUnknown_08A1901C
	bl Proc_StartBlocking
	str r4, [r0, #0x2c]
	str r5, [r0, #0x30]
	movs r1, #1
	negs r1, r1
	str r1, [r0, #0x40]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0809BE5C: .4byte gUnknown_08A1901C

	THUMB_FUNC_END sub_809BE3C

	THUMB_FUNC_START sub_809BE60
sub_809BE60: @ 0x0809BE60
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	adds r1, r3, #0
	ldr r0, _0809BE7C  @ gUnknown_08A1901C
	bl Proc_StartBlocking
	str r4, [r0, #0x2c]
	str r5, [r0, #0x30]
	str r6, [r0, #0x40]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0809BE7C: .4byte gUnknown_08A1901C

	THUMB_FUNC_END sub_809BE60

	THUMB_FUNC_START sub_809BE80
sub_809BE80: @ 0x0809BE80
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	ldr r5, _0809BEAC  @ gKeyStatusPtr
	ldr r0, [r5]
	ldrh r1, [r0, #6]
	movs r7, #0x40
	adds r0, r7, #0
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	cmp r6, #0
	beq _0809BEC2
	ldr r0, [r4, #0x2c]
	bl GetUnitItemCount
	adds r2, r0, #0
	ldr r0, [r4, #0x30]
	cmp r0, #0
	ble _0809BEB0
	subs r0, #1
	str r0, [r4, #0x30]
	b _0809BEEE
	.align 2, 0
_0809BEAC: .4byte gKeyStatusPtr
_0809BEB0:
	ldr r0, [r5]
	ldrh r1, [r0, #8]
	adds r0, r7, #0
	ands r0, r1
	cmp r0, #0
	beq _0809BF08
	subs r0, r2, #1
	str r0, [r4, #0x30]
	b _0809BEEE
_0809BEC2:
	movs r7, #0x80
	adds r0, r7, #0
	ands r0, r1
	cmp r0, #0
	beq _0809BF08
	ldr r0, [r4, #0x2c]
	bl GetUnitItemCount
	subs r0, #1
	ldr r1, [r4, #0x30]
	cmp r1, r0
	bge _0809BEE0
	adds r0, r1, #1
	str r0, [r4, #0x30]
	b _0809BEEE
_0809BEE0:
	ldr r0, [r5]
	ldrh r1, [r0, #8]
	adds r0, r7, #0
	ands r0, r1
	cmp r0, #0
	beq _0809BF08
	str r6, [r4, #0x30]
_0809BEEE:
	ldr r0, _0809BF04  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809BF00
	movs r0, #0x66
	bl m4aSongNumStart
_0809BF00:
	movs r0, #1
	b _0809BF0A
	.align 2, 0
_0809BF04: .4byte gRAMChapterData
_0809BF08:
	movs r0, #0
_0809BF0A:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_809BE80

	THUMB_FUNC_START DrawPrepScreenItemUseStatLabels
DrawPrepScreenItemUseStatLabels: @ 0x0809BF10
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	mov r8, r0
	ldr r6, _0809BF78  @ gUnknown_02013498
	adds r5, r6, #0
	movs r4, #7
_0809BF20:
	adds r0, r5, #0
	bl Text_Clear
	adds r5, #8
	subs r4, #1
	cmp r4, #0
	bge _0809BF20
	ldr r0, _0809BF7C  @ 0x000004E9
	bl GetStringFromIndex
	adds r1, r6, #0
	adds r6, #8
	ldr r5, _0809BF80  @ gUnknown_02023D88
	movs r7, #0
	str r7, [sp]
	str r0, [sp, #4]
	adds r0, r1, #0
	adds r1, r5, #0
	movs r2, #3
	movs r3, #0
	bl DrawTextInline
	mov r0, r8
	bl UnitHasMagicRank
	lsls r0, r0, #0x18
	asrs r4, r0, #0x18
	cmp r4, #0
	beq _0809BF88
	ldr r0, _0809BF84  @ 0x000004FF
	bl GetStringFromIndex
	adds r2, r6, #0
	adds r6, #8
	adds r1, r5, #0
	adds r1, #0x80
	str r7, [sp]
	str r0, [sp, #4]
	adds r0, r2, #0
	movs r2, #3
	movs r3, #0
	bl DrawTextInline
	b _0809BFA4
	.align 2, 0
_0809BF78: .4byte gUnknown_02013498
_0809BF7C: .4byte 0x000004E9
_0809BF80: .4byte gUnknown_02023D88
_0809BF84: .4byte 0x000004FF
_0809BF88:
	ldr r0, _0809C090  @ 0x000004FE
	bl GetStringFromIndex
	adds r2, r6, #0
	adds r6, #8
	adds r1, r5, #0
	adds r1, #0x80
	str r4, [sp]
	str r0, [sp, #4]
	adds r0, r2, #0
	movs r2, #3
	movs r3, #0
	bl DrawTextInline
_0809BFA4:
	ldr r0, _0809C094  @ 0x000004EC
	bl GetStringFromIndex
	adds r1, r6, #0
	adds r6, #8
	ldr r7, _0809C098  @ gUnknown_02023E88
	movs r5, #0
	str r5, [sp]
	str r0, [sp, #4]
	adds r0, r1, #0
	adds r1, r7, #0
	movs r2, #3
	movs r3, #0
	bl DrawTextInline
	ldr r0, _0809C09C  @ 0x000004ED
	bl GetStringFromIndex
	adds r2, r6, #0
	adds r6, #8
	adds r1, r7, #0
	adds r1, #0x80
	str r5, [sp]
	str r0, [sp, #4]
	adds r0, r2, #0
	movs r2, #3
	movs r3, #0
	bl DrawTextInline
	ldr r0, _0809C0A0  @ 0x000004EE
	bl GetStringFromIndex
	adds r2, r6, #0
	adds r6, #8
	adds r1, r7, #0
	subs r1, #0xf2
	str r5, [sp]
	str r0, [sp, #4]
	adds r0, r2, #0
	movs r2, #3
	movs r3, #0
	bl DrawTextInline
	ldr r0, _0809C0A4  @ 0x000004EF
	bl GetStringFromIndex
	adds r2, r6, #0
	adds r6, #8
	adds r1, r7, #0
	subs r1, #0x72
	str r5, [sp]
	str r0, [sp, #4]
	adds r0, r2, #0
	movs r2, #3
	movs r3, #0
	bl DrawTextInline
	movs r0, #0x9e
	lsls r0, r0, #3
	bl GetStringFromIndex
	adds r2, r6, #0
	adds r6, #8
	adds r1, r7, #0
	adds r1, #0xe
	str r5, [sp]
	str r0, [sp, #4]
	adds r0, r2, #0
	movs r2, #3
	movs r3, #0
	bl DrawTextInline
	ldr r0, _0809C0A8  @ 0x000004F7
	bl GetStringFromIndex
	adds r2, r6, #0
	adds r6, #8
	adds r1, r7, #0
	adds r1, #0x8e
	str r5, [sp]
	str r0, [sp, #4]
	adds r0, r2, #0
	movs r2, #3
	movs r3, #0
	bl DrawTextInline
	mov r1, r8
	ldr r0, [r1, #4]
	ldrh r0, [r0]
	bl GetStringFromIndex
	adds r4, r0, #0
	movs r0, #0x40
	adds r1, r4, #0
	bl GetStringTextCenteredPos
	adds r3, r0, #0
	adds r0, r6, #0
	ldr r2, _0809C0AC  @ 0xFFFFFE8A
	adds r1, r7, r2
	str r5, [sp]
	str r4, [sp, #4]
	movs r2, #0
	bl DrawTextInline
	ldr r1, _0809C0B0  @ 0xFFFFFE82
	adds r0, r7, r1
	movs r1, #3
	movs r2, #0x24
	movs r3, #0x25
	bl sub_8004D5C
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809C090: .4byte 0x000004FE
_0809C094: .4byte 0x000004EC
_0809C098: .4byte gUnknown_02023E88
_0809C09C: .4byte 0x000004ED
_0809C0A0: .4byte 0x000004EE
_0809C0A4: .4byte 0x000004EF
_0809C0A8: .4byte 0x000004F7
_0809C0AC: .4byte 0xFFFFFE8A
_0809C0B0: .4byte 0xFFFFFE82

	THUMB_FUNC_END DrawPrepScreenItemUseStatLabels

	THUMB_FUNC_START DrawPrepScreenItemUseStatBars
DrawPrepScreenItemUseStatBars: @ 0x0809C0B4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x2c
	adds r5, r0, #0
	mov r8, r1
	movs r0, #2
	bl UnpackUiBarPalette
	add r4, sp, #0xc
	adds r0, r5, #0
	bl GetUnitCurrentHp
	adds r2, r0, #0
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r3, r0, #3
	movs r0, #0xb
	ldrsb r0, [r5, r0]
	movs r1, #0xc0
	ands r0, r1
	cmp r0, #0x80
	beq _0809C0E8
	adds r0, r3, #0
	movs r1, #0x3c
	b _0809C0EC
_0809C0E8:
	adds r0, r2, #0
	movs r1, #5
_0809C0EC:
	bl __divsi3
	str r0, [r4]
	adds r0, r5, #0
	bl GetUnitPower
	adds r1, r0, #0
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	ldr r1, [r5, #4]
	ldrb r1, [r1, #0x14]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl __divsi3
	str r0, [sp, #0x10]
	adds r0, r5, #0
	bl GetUnitSkill
	adds r1, r0, #0
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	ldr r1, [r5, #4]
	ldrb r1, [r1, #0x15]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl __divsi3
	str r0, [sp, #0x14]
	adds r0, r5, #0
	bl GetUnitSpeed
	adds r1, r0, #0
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	ldr r1, [r5, #4]
	ldrb r1, [r1, #0x16]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl __divsi3
	str r0, [sp, #0x18]
	adds r0, r5, #0
	bl GetUnitLuck
	adds r1, r0, #0
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	movs r1, #0x1e
	bl __divsi3
	str r0, [sp, #0x1c]
	adds r0, r5, #0
	bl GetUnitDefense
	adds r1, r0, #0
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	ldr r1, [r5, #4]
	ldrb r1, [r1, #0x17]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl __divsi3
	str r0, [sp, #0x20]
	adds r0, r5, #0
	bl GetUnitResistance
	adds r1, r0, #0
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	ldr r4, [r5, #4]
	movs r1, #0x18
	ldrsb r1, [r4, r1]
	bl __divsi3
	str r0, [sp, #0x24]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	ldr r0, [r5]
	ldrb r0, [r0, #0x13]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r1, r1, r0
	movs r0, #0x1a
	ldrsb r0, [r5, r0]
	adds r1, r1, r0
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	movs r1, #0x19
	ldrsb r1, [r4, r1]
	bl __divsi3
	str r0, [sp, #0x28]
	movs r5, #0
	add r6, sp, #0xc
	movs r7, #0xe0
	lsls r7, r7, #7
_0809C1BE:
	mov r4, r8
	asrs r4, r5
	movs r0, #1
	ands r4, r0
	cmp r4, #0
	beq _0809C200
	lsls r0, r7, #0xf
	lsrs r0, r0, #0x14
	movs r2, #3
	ands r2, r5
	lsls r2, r2, #6
	adds r2, #0x92
	asrs r3, r5, #2
	lsls r1, r3, #3
	subs r1, r1, r3
	adds r2, r2, r1
	lsls r2, r2, #1
	ldr r1, _0809C1FC  @ gBG0TilemapBuffer
	adds r2, r2, r1
	movs r1, #0x18
	str r1, [sp]
	ldr r1, [r6]
	str r1, [sp, #4]
	movs r1, #0
	str r1, [sp, #8]
	movs r1, #4
	movs r3, #0xc0
	lsls r3, r3, #6
	bl DrawStatBarGfx
	b _0809C22E
	.align 2, 0
_0809C1FC: .4byte gBG0TilemapBuffer
_0809C200:
	lsls r0, r7, #0xf
	lsrs r0, r0, #0x14
	movs r2, #3
	ands r2, r5
	lsls r2, r2, #6
	adds r2, #0x92
	asrs r3, r5, #2
	lsls r1, r3, #3
	subs r1, r1, r3
	adds r2, r2, r1
	lsls r2, r2, #1
	ldr r1, _0809C250  @ gBG0TilemapBuffer
	adds r2, r2, r1
	movs r1, #0x18
	str r1, [sp]
	ldr r1, [r6]
	str r1, [sp, #4]
	str r4, [sp, #8]
	movs r1, #4
	movs r3, #0x80
	lsls r3, r3, #6
	bl DrawStatBarGfx
_0809C22E:
	adds r6, #4
	movs r0, #0x80
	lsls r0, r0, #1
	adds r7, r7, r0
	adds r5, #1
	cmp r5, #7
	ble _0809C1BE
	movs r0, #1
	bl BG_EnableSyncByMask
	add sp, #0x2c
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809C250: .4byte gBG0TilemapBuffer

	THUMB_FUNC_END DrawPrepScreenItemUseStatBars

	THUMB_FUNC_START DrawPrepScreenItemUseStatValues
DrawPrepScreenItemUseStatValues: @ 0x0809C254
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	ldr r6, _0809C274  @ gUnknown_02023D90
	bl GetUnitCurrentHp
	adds r2, r0, #0
	movs r0, #0xb
	ldrsb r0, [r4, r0]
	movs r1, #0xc0
	ands r0, r1
	cmp r0, #0x80
	bne _0809C278
	cmp r2, #0x78
	beq _0809C27C
	b _0809C280
	.align 2, 0
_0809C274: .4byte gUnknown_02023D90
_0809C278:
	cmp r2, #0x3c
	bne _0809C280
_0809C27C:
	movs r5, #4
	b _0809C282
_0809C280:
	movs r5, #2
_0809C282:
	adds r0, r4, #0
	bl GetUnitCurrentHp
	adds r2, r0, #0
	adds r0, r6, #0
	adds r1, r5, #0
	bl DrawDecNumber
	ldr r5, _0809C3E0  @ gUnknown_02023E10
	adds r0, r4, #0
	bl GetUnitPower
	ldr r1, [r4, #4]
	ldrb r1, [r1, #0x14]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	movs r6, #2
	cmp r0, r1
	bne _0809C2AA
	movs r6, #4
_0809C2AA:
	adds r0, r4, #0
	bl GetUnitPower
	adds r2, r0, #0
	adds r0, r5, #0
	adds r1, r6, #0
	bl DrawDecNumber
	adds r7, r5, #0
	adds r7, #0x80
	adds r0, r4, #0
	bl GetUnitSkill
	ldr r1, [r4, #4]
	ldrb r1, [r1, #0x15]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	movs r6, #2
	cmp r0, r1
	bne _0809C2D4
	movs r6, #4
_0809C2D4:
	adds r0, r4, #0
	bl GetUnitSkill
	adds r2, r0, #0
	adds r0, r7, #0
	adds r1, r6, #0
	bl DrawDecNumber
	movs r0, #0x80
	lsls r0, r0, #1
	adds r7, r5, r0
	adds r0, r4, #0
	bl GetUnitSpeed
	ldr r1, [r4, #4]
	ldrb r1, [r1, #0x16]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	movs r6, #2
	cmp r0, r1
	bne _0809C300
	movs r6, #4
_0809C300:
	adds r0, r4, #0
	bl GetUnitSpeed
	adds r2, r0, #0
	adds r0, r7, #0
	adds r1, r6, #0
	bl DrawDecNumber
	adds r7, r5, #0
	subs r7, #0x72
	adds r0, r4, #0
	bl GetUnitLuck
	movs r6, #2
	cmp r0, #0x1e
	bne _0809C322
	movs r6, #4
_0809C322:
	adds r0, r4, #0
	bl GetUnitLuck
	adds r2, r0, #0
	adds r0, r7, #0
	adds r1, r6, #0
	bl DrawDecNumber
	adds r7, r5, #0
	adds r7, #0xe
	adds r0, r4, #0
	bl GetUnitDefense
	ldr r1, [r4, #4]
	ldrb r1, [r1, #0x17]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	movs r6, #2
	cmp r0, r1
	bne _0809C34C
	movs r6, #4
_0809C34C:
	adds r0, r4, #0
	bl GetUnitDefense
	adds r2, r0, #0
	adds r0, r7, #0
	adds r1, r6, #0
	bl DrawDecNumber
	adds r7, r5, #0
	adds r7, #0x8e
	adds r0, r4, #0
	bl GetUnitResistance
	ldr r1, [r4, #4]
	ldrb r1, [r1, #0x18]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	movs r6, #2
	cmp r0, r1
	bne _0809C376
	movs r6, #4
_0809C376:
	adds r0, r4, #0
	bl GetUnitResistance
	adds r2, r0, #0
	adds r0, r7, #0
	adds r1, r6, #0
	bl DrawDecNumber
	movs r1, #0x87
	lsls r1, r1, #1
	adds r6, r5, r1
	ldr r2, [r4, #4]
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	ldr r0, [r4]
	ldrb r0, [r0, #0x13]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r1, r1, r0
	movs r0, #0x1a
	ldrsb r0, [r4, r0]
	adds r3, r1, r0
	movs r0, #0x19
	ldrsb r0, [r2, r0]
	movs r1, #2
	cmp r3, r0
	bne _0809C3AE
	movs r1, #4
_0809C3AE:
	adds r0, r6, #0
	adds r2, r3, #0
	bl DrawDecNumber
	ldr r1, _0809C3E4  @ 0xFFFFFEFE
	adds r0, r5, r1
	movs r1, #1
	movs r2, #1
	movs r3, #0
	bl TileMap_FillRect
	ldr r1, _0809C3E8  @ 0xFFFFFF00
	adds r0, r5, r1
	movs r2, #8
	ldrsb r2, [r4, r2]
	movs r1, #2
	bl DrawDecNumber
	movs r0, #4
	bl BG_EnableSyncByMask
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809C3E0: .4byte gUnknown_02023E10
_0809C3E4: .4byte 0xFFFFFEFE
_0809C3E8: .4byte 0xFFFFFF00

	THUMB_FUNC_END DrawPrepScreenItemUseStatValues

	THUMB_FUNC_START DrawPrepScreenItemUseItemUseDesc
DrawPrepScreenItemUseItemUseDesc: @ 0x0809C3EC
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r6, r0, #0
	adds r5, r1, #0
	ldr r4, _0809C46C  @ gUnknown_02013560
	adds r0, r4, #0
	bl Text_Clear
	adds r0, r4, #0
	adds r0, #8
	bl Text_Clear
	adds r4, #0x20
	adds r0, r4, #0
	bl Text_Clear
	movs r0, #1
	negs r0, r0
	cmp r5, r0
	beq _0809C4A2
	lsls r1, r5, #1
	adds r0, r6, #0
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r4, [r0]
	adds r0, r4, #0
	bl GetItemUseDescId
	adds r5, r0, #0
	mov r1, sp
	ldr r0, _0809C470  @ gUnknown_08205C64
	ldm r0!, {r2, r3, r7}
	stm r1!, {r2, r3, r7}
	cmp r5, #0
	beq _0809C4A2
	adds r0, r6, #0
	adds r1, r4, #0
	bl CanUnitUseItemPrepScreen
	cmp r0, #0
	beq _0809C478
	ldr r0, [sp]
	movs r1, #0
	bl Text_SetColorId
	ldr r0, [sp, #4]
	movs r1, #0
	bl Text_SetColorId
	ldr r0, [sp, #8]
	movs r1, #0
	bl Text_SetColorId
	adds r0, r5, #0
	bl GetStringFromIndex
	adds r1, r0, #0
	ldr r2, _0809C474  @ gUnknown_02022FC6
	mov r0, sp
	movs r3, #3
	bl sub_8008A3C
	b _0809C4A2
	.align 2, 0
_0809C46C: .4byte gUnknown_02013560
_0809C470: .4byte gUnknown_08205C64
_0809C474: .4byte gUnknown_02022FC6
_0809C478:
	ldr r0, [sp]
	movs r1, #1
	bl Text_SetColorId
	ldr r0, [sp, #4]
	movs r1, #1
	bl Text_SetColorId
	ldr r0, [sp, #8]
	movs r1, #1
	bl Text_SetColorId
	adds r0, r5, #0
	bl GetStringFromIndex
	adds r1, r0, #0
	ldr r2, _0809C4B0  @ gUnknown_02022FC6
	mov r0, sp
	movs r3, #3
	bl sub_8008A3C
_0809C4A2:
	movs r0, #1
	bl BG_EnableSyncByMask
	add sp, #0xc
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809C4B0: .4byte gUnknown_02022FC6

	THUMB_FUNC_END DrawPrepScreenItemUseItemUseDesc

	THUMB_FUNC_START sub_809C4B4
sub_809C4B4: @ 0x0809C4B4
	push {lr}
	sub sp, #4
	movs r3, #0xc8
	lsls r3, r3, #8
	ldr r0, [r0, #0x2c]
	ldr r0, [r0, #4]
	ldrb r0, [r0, #4]
	str r0, [sp]
	movs r0, #0
	movs r1, #0x78
	movs r2, #0xa
	bl sub_8027C48
	bl SMS_FlushDirect
	add sp, #4
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_809C4B4

	THUMB_FUNC_START sub_809C4D8
sub_809C4D8: @ 0x0809C4D8
	movs r1, #0
	str r1, [r0, #0x30]
	movs r1, #0xff
	str r1, [r0, #0x38]
	bx lr

	THUMB_FUNC_END sub_809C4D8

	THUMB_FUNC_START PrepItemUse_InitDisplay
PrepItemUse_InitDisplay: @ 0x0809C4E4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x28
	adds r7, r0, #0
	add r1, sp, #8
	ldr r0, _0809C7E0  @ gUnknown_08205C70
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldm r0!, {r2, r3, r6}
	stm r1!, {r2, r3, r6}
	ldm r0!, {r4, r6}
	stm r1!, {r4, r6}
	ldr r4, _0809C7E4  @ gLCDControlBuffer
	ldrb r1, [r4]
	movs r0, #8
	negs r0, r0
	ands r0, r1
	strb r0, [r4]
	ldr r0, _0809C7E8  @ gUnknown_08A181E8
	bl SetupBackgrounds
	add r0, sp, #8
	bl SetupFaceGfxData
	movs r0, #0xff
	str r0, [r7, #0x34]
	movs r0, #0
	bl BG_GetMapBuffer
	movs r1, #0
	bl BG_Fill
	movs r0, #1
	bl BG_GetMapBuffer
	movs r1, #0
	bl BG_Fill
	movs r0, #2
	bl BG_GetMapBuffer
	movs r1, #0
	bl BG_Fill
	ldrb r1, [r4, #0xc]
	movs r2, #4
	negs r2, r2
	adds r0, r2, #0
	ands r0, r1
	movs r1, #1
	orrs r0, r1
	strb r0, [r4, #0xc]
	ldrb r1, [r4, #0x10]
	adds r0, r2, #0
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	strb r0, [r4, #0x10]
	ldrb r0, [r4, #0x14]
	ands r2, r0
	strb r2, [r4, #0x14]
	ldrb r0, [r4, #0x18]
	movs r1, #3
	orrs r0, r1
	strb r0, [r4, #0x18]
	bl Font_InitForUIDefault
	bl ResetIconGraphics_
	bl LoadUiFrameGraphics
	bl LoadObjUIGfx
	bl SetupMapSpritesPalettes
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	ldr r0, _0809C7EC  @ 0x06014000
	movs r1, #1
	negs r1, r1
	bl LoadDialogueBoxGfx
	movs r0, #4
	bl LoadIconPalettes
	bl EndSlidingWallEffectMaybe
	ldr r5, _0809C7F0  @ gUnknown_02013510
	movs r4, #4
_0809C5B6:
	adds r0, r5, #0
	movs r1, #7
	bl Text_Allocate
	adds r5, #8
	subs r4, #1
	cmp r4, #0
	bge _0809C5B6
	ldr r5, _0809C7F4  @ gUnknown_02013498
	movs r4, #7
_0809C5CA:
	adds r0, r5, #0
	movs r1, #3
	bl Text_Init
	adds r5, #8
	subs r4, #1
	cmp r4, #0
	bge _0809C5CA
	ldr r0, _0809C7F4  @ gUnknown_02013498
	mov sl, r0
	adds r0, #0x40
	movs r1, #8
	bl Text_Init
	mov r0, sl
	adds r0, #0xc8
	movs r1, #0xf
	bl Text_Init
	mov r0, sl
	adds r0, #0xd0
	movs r1, #0xf
	bl Text_Init
	mov r0, sl
	adds r0, #0xe8
	movs r1, #0xf
	bl Text_Init
	mov r0, sl
	adds r0, #0xd8
	movs r1, #0xe
	bl Text_Init
	mov r0, sl
	adds r0, #0xe0
	movs r1, #8
	bl Text_Init
	ldr r0, [r7, #0x2c]
	bl DrawPrepScreenItemUseStatLabels
	ldr r0, [r7, #0x2c]
	bl DrawPrepScreenItemUseStatValues
	ldr r0, [r7, #0x2c]
	movs r1, #0
	bl DrawPrepScreenItemUseStatBars
	ldr r0, [r7, #0x2c]
	bl GetUnitPortraitId
	adds r1, r0, #0
	movs r3, #4
	negs r3, r3
	ldr r0, _0809C7F8  @ 0x00000203
	str r0, [sp]
	movs r0, #0
	movs r2, #0x40
	bl StartFace2
	movs r0, #0xc0
	lsls r0, r0, #7
	movs r1, #5
	bl sub_8098C3C
	movs r0, #0x80
	lsls r0, r0, #4
	movs r1, #0xa
	bl sub_8098C8C
	ldr r0, _0809C7FC  @ gUnknown_08A1BAB8
	ldr r1, _0809C800  @ 0x06000440
	bl CopyDataWithPossibleUncomp
	ldr r0, _0809C804  @ gUnknown_08A1BAE4
	ldr r4, _0809C808  @ gGenericBuffer
	adds r1, r4, #0
	bl CopyDataWithPossibleUncomp
	ldr r0, _0809C80C  @ gBG1TilemapBuffer
	movs r2, #0x80
	lsls r2, r2, #5
	adds r1, r4, #0
	bl CallARM_FillTileRect
	movs r0, #7
	bl BG_EnableSyncByMask
	movs r1, #0xe0
	lsls r1, r1, #4
	movs r3, #0xc0
	lsls r3, r3, #4
	movs r2, #0
	str r2, [sp]
	str r7, [sp, #4]
	movs r0, #0xd
	movs r2, #0xf
	bl StartSmallBrownNameBoxes
	movs r1, #0x28
	negs r1, r1
	movs r2, #1
	negs r2, r2
	movs r0, #0
	movs r3, #1
	bl sub_80ADBFC
	ldr r0, [r7, #0x2c]
	ldr r0, [r0]
	ldrh r0, [r0]
	bl GetStringFromIndex
	adds r4, r0, #0
	bl GetStringTextWidth
	movs r3, #0x30
	subs r3, r3, r0
	lsrs r0, r3, #0x1f
	adds r3, r3, r0
	asrs r3, r3, #1
	movs r0, #6
	str r0, [sp]
	str r4, [sp, #4]
	movs r0, #0
	ldr r1, _0809C810  @ gBG0TilemapBuffer
	movs r2, #0
	bl DrawTextInline
	adds r0, r7, #0
	bl sub_80AC9C0
	adds r0, r7, #0
	bl ResetPrepScreenHandCursor
	movs r0, #0xc0
	lsls r0, r0, #3
	movs r1, #1
	bl sub_80AD4A0
	ldr r0, _0809C814  @ sub_809C4B4
	adds r1, r7, #0
	bl StartParallelWorker
	ldr r6, _0809C7E4  @ gLCDControlBuffer
	ldrb r0, [r6, #1]
	movs r3, #0x20
	mov ip, r3
	mov r4, ip
	orrs r0, r4
	movs r1, #0x41
	negs r1, r1
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r6, #1]
	adds r1, r6, #0
	adds r1, #0x2d
	movs r0, #0x68
	strb r0, [r1]
	adds r1, #4
	movs r0, #0x5e
	strb r0, [r1]
	subs r1, #5
	movs r0, #0xf0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0x92
	strb r0, [r1]
	movs r0, #0x34
	adds r0, r0, r6
	mov r9, r0
	ldrb r1, [r0]
	movs r2, #1
	mov r8, r2
	mov r3, r8
	orrs r1, r3
	movs r5, #2
	orrs r1, r5
	movs r4, #4
	orrs r1, r4
	movs r3, #8
	orrs r1, r3
	movs r2, #0x10
	orrs r1, r2
	ldr r6, _0809C818  @ gUnknown_030030B6
	ldrb r0, [r6]
	mov r6, r8
	orrs r0, r6
	orrs r0, r5
	orrs r0, r4
	orrs r0, r3
	orrs r0, r2
	mov r2, ip
	orrs r1, r2
	mov r3, r9
	strb r1, [r3]
	movs r1, #0x21
	negs r1, r1
	ands r0, r1
	ldr r4, _0809C818  @ gUnknown_030030B6
	strb r0, [r4]
	movs r0, #3
	movs r1, #0
	movs r2, #0
	movs r3, #8
	bl SetSpecialColorEffectsParameters
	movs r6, #0
	str r6, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #1
	bl SetBlendTargetA
	adds r0, r7, #0
	bl NewGreenTextColorManager
	movs r0, #0xc0
	movs r1, #0x90
	movs r2, #9
	adds r3, r7, #0
	bl StartHelpPromptSprite
	ldr r0, [r7, #0x2c]
	ldr r1, [r7, #0x30]
	bl DrawPrepScreenItemUseItemUseDesc
	mov r1, sl
	adds r1, #0x78
	ldr r2, [r7, #0x2c]
	ldr r0, _0809C81C  @ gUnknown_02022EEC
	movs r3, #1
	bl sub_809B74C
	ldr r1, [r7, #0x30]
	asrs r2, r1, #3
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #4
	adds r0, #0x10
	movs r2, #7
	ands r1, r2
	lsls r1, r1, #4
	adds r1, #0x48
	movs r2, #0xb
	movs r3, #0x80
	lsls r3, r3, #4
	bl sub_80AD51C
	ldr r0, [r7, #0x2c]
	bl GetUnitSMSId
	bl SMS_RegisterUsage
	bl SMS_FlushIndirect
	add sp, #0x28
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809C7E0: .4byte gUnknown_08205C70
_0809C7E4: .4byte gLCDControlBuffer
_0809C7E8: .4byte gUnknown_08A181E8
_0809C7EC: .4byte 0x06014000
_0809C7F0: .4byte gUnknown_02013510
_0809C7F4: .4byte gUnknown_02013498
_0809C7F8: .4byte 0x00000203
_0809C7FC: .4byte gUnknown_08A1BAB8
_0809C800: .4byte 0x06000440
_0809C804: .4byte gUnknown_08A1BAE4
_0809C808: .4byte gGenericBuffer
_0809C80C: .4byte gBG1TilemapBuffer
_0809C810: .4byte gBG0TilemapBuffer
_0809C814: .4byte sub_809C4B4
_0809C818: .4byte gUnknown_030030B6
_0809C81C: .4byte gUnknown_02022EEC

	THUMB_FUNC_END PrepItemUse_InitDisplay

	THUMB_FUNC_START sub_809C820
sub_809C820: @ 0x0809C820
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x38]
	cmp r0, #0xff
	beq _0809C848
	ldr r0, _0809C844  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0x81
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0809C8F0
	bl CloseHelpBox
	movs r0, #0xff
	b _0809C938
	.align 2, 0
_0809C844: .4byte gKeyStatusPtr
_0809C848:
	ldr r0, _0809C8A8  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	bne _0809C91C
	movs r5, #1
	adds r0, r5, #0
	ands r0, r1
	cmp r0, #0
	beq _0809C8C8
	ldr r0, [r4, #0x2c]
	ldr r2, [r4, #0x30]
	lsls r2, r2, #1
	adds r1, r0, #0
	adds r1, #0x1e
	adds r1, r1, r2
	ldrh r1, [r1]
	bl CanUnitUseItemPrepScreen
	cmp r0, #0
	beq _0809C8B0
	ldr r2, [r4, #0x30]
	str r2, [r4, #0x34]
	lsls r2, r2, #4
	adds r2, #0x48
	movs r0, #0
	movs r1, #0x10
	movs r3, #0
	bl sub_80AC9D4
	str r5, [r4, #0x3c]
	ldr r0, _0809C8AC  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809C89E
	movs r0, #0x6a
	bl m4aSongNumStart
_0809C89E:
	adds r0, r4, #0
	movs r1, #2
	bl Proc_Goto
	b _0809C93A
	.align 2, 0
_0809C8A8: .4byte gKeyStatusPtr
_0809C8AC: .4byte gRAMChapterData
_0809C8B0:
	ldr r0, _0809C8C4  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809C93A
	movs r0, #0x6c
	bl m4aSongNumStart
	b _0809C93A
	.align 2, 0
_0809C8C4: .4byte gRAMChapterData
_0809C8C8:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0809C8F0
	adds r0, r4, #0
	movs r1, #6
	bl Proc_Goto
	ldr r0, _0809C8EC  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809C93A
	movs r0, #0x6b
	bl m4aSongNumStart
	b _0809C93A
	.align 2, 0
_0809C8EC: .4byte gRAMChapterData
_0809C8F0:
	adds r0, r4, #0
	bl sub_809BE80
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809C93A
	ldr r1, [r4, #0x30]
	lsls r1, r1, #4
	adds r1, #0x48
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x10
	movs r2, #0xb
	bl sub_80AD51C
	ldr r0, [r4, #0x2c]
	ldr r1, [r4, #0x30]
	bl DrawPrepScreenItemUseItemUseDesc
	ldr r0, [r4, #0x38]
	cmp r0, #0xff
	beq _0809C93A
_0809C91C:
	ldr r0, [r4, #0x2c]
	ldr r3, [r4, #0x30]
	lsls r1, r3, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r2, [r0]
	cmp r2, #0
	beq _0809C93A
	lsls r1, r3, #4
	adds r1, #0x48
	movs r0, #0x10
	bl StartItemHelpBox
	ldr r0, [r4, #0x30]
_0809C938:
	str r0, [r4, #0x38]
_0809C93A:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_809C820

	THUMB_FUNC_START sub_809C940
sub_809C940: @ 0x0809C940
	push {lr}
	bl EndBG3Slider_
	movs r0, #0
	bl EndFaceById
	movs r0, #1
	bl EndFaceById
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_809C940

	THUMB_FUNC_START sub_809C958
sub_809C958: @ 0x0809C958
	push {r4, r5, r6, lr}
	sub sp, #8
	ldr r4, _0809C9C4  @ gUnknown_02013570
	adds r0, r4, #0
	bl Text_Clear
	ldr r0, _0809C9C8  @ 0x00000585
	bl GetStringFromIndex
	adds r1, r4, #0
	adds r4, #8
	ldr r5, _0809C9CC  @ gUnknown_0202400A
	movs r6, #0
	str r6, [sp]
	str r0, [sp, #4]
	adds r0, r1, #0
	adds r1, r5, #0
	movs r2, #0
	movs r3, #0
	bl DrawTextInline
	adds r0, r4, #0
	bl Text_Clear
	ldr r0, _0809C9D0  @ 0x00000843
	bl GetStringFromIndex
	adds r5, #0x84
	str r6, [sp]
	str r0, [sp, #4]
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0
	movs r3, #0
	bl DrawTextInline
	ldr r0, _0809C9D4  @ 0x00000844
	bl GetStringFromIndex
	str r6, [sp]
	str r0, [sp, #4]
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0
	movs r3, #0x20
	bl DrawTextInline
	movs r0, #4
	bl BG_EnableSyncByMask
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0809C9C4: .4byte gUnknown_02013570
_0809C9C8: .4byte 0x00000585
_0809C9CC: .4byte gUnknown_0202400A
_0809C9D0: .4byte 0x00000843
_0809C9D4: .4byte 0x00000844

	THUMB_FUNC_END sub_809C958

	THUMB_FUNC_START sub_809C9D8
sub_809C9D8: @ 0x0809C9D8
	push {lr}
	ldr r0, _0809C9F0  @ gUnknown_0202400A
	movs r1, #0xd
	movs r2, #4
	movs r3, #0
	bl TileMap_FillRect
	movs r0, #4
	bl BG_EnableSyncByMask
	pop {r0}
	bx r0
	.align 2, 0
_0809C9F0: .4byte gUnknown_0202400A

	THUMB_FUNC_END sub_809C9D8

	THUMB_FUNC_START sub_809C9F4
sub_809C9F4: @ 0x0809C9F4
	push {r4, lr}
	adds r4, r0, #0
	bl sub_809C958
	ldr r0, [r4, #0x3c]
	lsls r0, r0, #5
	adds r0, #0x94
	movs r3, #0x80
	lsls r3, r3, #4
	movs r1, #0x78
	movs r2, #0
	bl sub_80AD51C
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_809C9F4

	THUMB_FUNC_START sub_809CA14
sub_809CA14: @ 0x0809CA14
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r7, [r4, #0x3c]
	ldr r0, _0809CA6C  @ 0x0000A440
	str r0, [sp]
	movs r0, #0x80
	movs r1, #0x64
	movs r2, #0xc
	movs r3, #4
	bl sub_809A31C
	ldr r5, _0809CA70  @ gKeyStatusPtr
	ldr r3, [r5]
	ldrh r1, [r3, #8]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0809CA78
	ldr r1, [r4, #0x30]
	lsls r1, r1, #4
	adds r1, #0x48
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x10
	movs r2, #0xb
	bl sub_80AD51C
	movs r0, #0
	bl sub_80ACA84
	bl sub_809C9D8
	ldr r0, _0809CA74  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809CADA
	movs r0, #0x6b
	bl m4aSongNumStart
	b _0809CADA
	.align 2, 0
_0809CA6C: .4byte 0x0000A440
_0809CA70: .4byte gKeyStatusPtr
_0809CA74: .4byte gRAMChapterData
_0809CA78:
	movs r6, #1
	adds r2, r6, #0
	ands r2, r1
	cmp r2, #0
	beq _0809CAE8
	bl sub_809C9D8
	ldr r0, [r4, #0x3c]
	cmp r0, #0
	bne _0809CAB0
	bl HidePrepScreenHandCursor
	ldr r0, _0809CAAC  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809CAA2
	movs r0, #0x6a
	bl m4aSongNumStart
_0809CAA2:
	adds r0, r4, #0
	movs r1, #3
	bl Proc_Goto
	b _0809CB2A
	.align 2, 0
_0809CAAC: .4byte gRAMChapterData
_0809CAB0:
	ldr r1, [r4, #0x30]
	lsls r1, r1, #4
	adds r1, #0x48
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x10
	movs r2, #0xb
	bl sub_80AD51C
	ldr r0, _0809CAE4  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809CAD4
	movs r0, #0x6b
	bl m4aSongNumStart
_0809CAD4:
	movs r0, #0
	bl sub_80ACA84
_0809CADA:
	adds r0, r4, #0
	bl Proc_Break
	b _0809CB2A
	.align 2, 0
_0809CAE4: .4byte gRAMChapterData
_0809CAE8:
	ldrh r1, [r3, #6]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _0809CAF4
	str r2, [r4, #0x3c]
_0809CAF4:
	ldr r0, [r5]
	ldrh r1, [r0, #6]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _0809CB02
	str r6, [r4, #0x3c]
_0809CB02:
	ldr r0, [r4, #0x3c]
	cmp r7, r0
	beq _0809CB2A
	lsls r0, r0, #5
	adds r0, #0x94
	movs r3, #0x80
	lsls r3, r3, #4
	movs r1, #0x78
	movs r2, #0
	bl sub_80AD51C
	ldr r0, _0809CB34  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809CB2A
	movs r0, #0x67
	bl m4aSongNumStart
_0809CB2A:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809CB34: .4byte gRAMChapterData

	THUMB_FUNC_END sub_809CA14

	THUMB_FUNC_START PrepItemUse_HandleItemEffect
PrepItemUse_HandleItemEffect: @ 0x0809CB38
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x2c]
	ldr r1, [r4, #0x30]
	lsls r1, r1, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r0, [r0]
	bl GetItemIndex
	cmp r0, #0x8a
	beq _0809CB78
	cmp r0, #0x8a
	bgt _0809CB62
	cmp r0, #0x64
	blt _0809CBA0
	cmp r0, #0x68
	ble _0809CB78
	cmp r0, #0x88
	beq _0809CB78
	b _0809CBA0
_0809CB62:
	cmp r0, #0xb7
	beq _0809CB98
	cmp r0, #0xb7
	bgt _0809CB74
	cmp r0, #0x99
	bgt _0809CBA0
	cmp r0, #0x97
	blt _0809CBA0
	b _0809CB78
_0809CB74:
	cmp r0, #0xc1
	bne _0809CBA0
_0809CB78:
	ldr r0, _0809CB94  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809CB8A
	movs r0, #0x6a
	bl m4aSongNumStart
_0809CB8A:
	adds r0, r4, #0
	movs r1, #5
	bl Proc_Goto
	b _0809CBA0
	.align 2, 0
_0809CB94: .4byte gRAMChapterData
_0809CB98:
	adds r0, r4, #0
	movs r1, #4
	bl Proc_Goto
_0809CBA0:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END PrepItemUse_HandleItemEffect

	THUMB_FUNC_START sub_809CBA8
sub_809CBA8: @ 0x0809CBA8
	push {r4, lr}
	adds r4, r0, #0
	bl EndBG3Slider_
	bl Font_InitForUIDefault
	movs r0, #0
	bl SetupBackgrounds
	bl EndGreenTextColorManager
	bl GetThread2SkipStack
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [r4, #0x40]
	bl ResetFaces
	bl EndHelpPromptSprite
	ldr r2, _0809CC38  @ gLCDControlBuffer
	ldrb r1, [r2, #1]
	movs r0, #0x21
	negs r0, r0
	ands r0, r1
	movs r1, #0x41
	negs r1, r1
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r2, #1]
	adds r1, r2, #0
	adds r1, #0x34
	ldrb r0, [r1]
	movs r3, #0x20
	orrs r0, r3
	strb r0, [r1]
	adds r2, #0x36
	ldrb r0, [r2]
	orrs r0, r3
	strb r0, [r2]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #8
	bl SetSpecialColorEffectsParameters
	bl EndSmallBrownNameBoxes
	bl EndAllParallelWorkers
	movs r0, #0
	bl EndFaceById
	movs r0, #0
	bl sub_80ACA84
	ldr r0, [r4, #0x2c]
	ldr r2, [r4, #0x30]
	movs r1, #1
	movs r3, #0
	bl sub_802F664
	ldr r1, _0809CC3C  @ gBattleStats
	movs r0, #0x88
	lsls r0, r0, #1
	strh r0, [r1]
	bl BeginBattleAnimations
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809CC38: .4byte gLCDControlBuffer
_0809CC3C: .4byte gBattleStats

	THUMB_FUNC_END sub_809CBA8

	THUMB_FUNC_START sub_809CC40
sub_809CC40: @ 0x0809CC40
	push {r4, lr}
	adds r4, r0, #0
	bl GetThread2SkipStack
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, [r4, #0x40]
	cmp r1, r0
	bne _0809CC58
	adds r0, r4, #0
	bl Proc_Break
_0809CC58:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_809CC40

	THUMB_FUNC_START sub_809CC60
sub_809CC60: @ 0x0809CC60
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x2c]
	bl GetUnitItemCount
	adds r5, r0, #0
	ldr r0, [r4, #0x2c]
	ldr r0, [r0]
	ldrb r0, [r0, #4]
	bl PrepSetLatestCharId
	cmp r5, #0
	bne _0809CC84
	adds r0, r4, #0
	movs r1, #7
	bl Proc_Goto
	b _0809CC94
_0809CC84:
	ldr r0, [r4, #0x30]
	cmp r0, r5
	blt _0809CC8E
	subs r0, #1
	str r0, [r4, #0x30]
_0809CC8E:
	adds r0, r4, #0
	bl Proc_Break
_0809CC94:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_809CC60

	THUMB_FUNC_START sub_809CC9C
sub_809CC9C: @ 0x0809CC9C
	push {lr}
	movs r0, #0x80
	lsls r0, r0, #1
	bl Sound_SetSEVolume
	bl CheckSomethingSomewhere
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809CCB8
	movs r0, #0x38
	bl sub_8002620
	b _0809CCDA
_0809CCB8:
	ldr r0, _0809CCD0  @ gGMData
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0809CCD4
	bl sub_800270C
	bl sub_80B9FC0
	b _0809CCDA
	.align 2, 0
_0809CCD0: .4byte gGMData
_0809CCD4:
	movs r0, #0x34
	bl sub_8002620
_0809CCDA:
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_809CC9C

	THUMB_FUNC_START sub_809CCE0
sub_809CCE0: @ 0x0809CCE0
	push {lr}
	sub sp, #4
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #0
	str r0, [sp]
	movs r2, #0
	movs r3, #0x10
	bl sub_80029E8
	add sp, #4
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_809CCE0

	THUMB_FUNC_START StartPrepItemUseScreen
StartPrepItemUseScreen: @ 0x0809CCFC
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0809CD10  @ gUnknown_08A19064
	bl Proc_StartBlocking
	str r4, [r0, #0x2c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809CD10: .4byte gUnknown_08A19064

	THUMB_FUNC_END StartPrepItemUseScreen

	THUMB_FUNC_START PrepItemBooster_DrawPopup
PrepItemBooster_DrawPopup: @ 0x0809CD14
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r6, r0, #0
	adds r5, r1, #0
	adds r7, r2, #0
	adds r0, r3, #0
	bl GetStringFromIndex
	mov r9, r0
	ldr r0, [sp, #0x28]
	bl GetItemIconId
	mov r8, r0
	mov r0, r9
	bl GetStringTextWidth
	mov sl, r0
	mov r0, r8
	cmp r0, #0
	beq _0809CD60
	lsls r4, r7, #5
	adds r4, r4, r5
	lsls r4, r4, #1
	ldr r0, _0809CDCC  @ gBG2TilemapBuffer
	adds r4, r4, r0
	ldr r0, [sp, #0x28]
	bl GetItemIconId
	adds r1, r0, #0
	movs r2, #0x80
	lsls r2, r2, #7
	adds r0, r4, #0
	bl DrawIcon
_0809CD60:
	ldr r4, _0809CDD0  @ gUnknown_02013570
	adds r0, r4, #0
	bl Text_Clear
	lsls r0, r7, #5
	mov r1, r8
	cmp r1, #0
	beq _0809CD72
	adds r0, #2
_0809CD72:
	adds r0, r0, r5
	lsls r0, r0, #1
	ldr r1, _0809CDCC  @ gBG2TilemapBuffer
	adds r1, r0, r1
	movs r0, #0
	str r0, [sp]
	mov r0, r9
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r2, #0
	movs r3, #0
	bl DrawTextInline
	movs r0, #4
	bl BG_EnableSyncByMask
	lsls r0, r5, #3
	subs r0, #4
	str r0, [r6, #0x40]
	lsls r0, r7, #3
	subs r0, #4
	str r0, [r6, #0x44]
	mov r0, sl
	cmp r0, #0
	bge _0809CDA6
	adds r0, #7
_0809CDA6:
	asrs r1, r0, #3
	adds r0, r1, #1
	str r0, [r6, #0x48]
	mov r0, r8
	cmp r0, #0
	beq _0809CDB6
	adds r0, r1, #3
	str r0, [r6, #0x48]
_0809CDB6:
	movs r0, #2
	str r0, [r6, #0x4c]
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809CDCC: .4byte gBG2TilemapBuffer
_0809CDD0: .4byte gUnknown_02013570

	THUMB_FUNC_END PrepItemBooster_DrawPopup

	THUMB_FUNC_START PrepItemBooster_OnInit
PrepItemBooster_OnInit: @ 0x0809CDD4
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r7, r0, #0
	ldr r4, [r7, #0x14]
	movs r0, #0xe0
	lsls r0, r0, #1
	movs r1, #3
	movs r2, #0
	adds r3, r7, #0
	bl sub_807EDF8
	ldr r0, [r4, #0x2c]
	bl GetUnitCurrentHp
	adds r1, r7, #0
	adds r1, #0x30
	strb r0, [r1]
	ldr r0, [r4, #0x2c]
	bl GetUnitPower
	adds r1, r7, #0
	adds r1, #0x31
	strb r0, [r1]
	ldr r0, [r4, #0x2c]
	bl GetUnitSkill
	adds r1, r7, #0
	adds r1, #0x32
	strb r0, [r1]
	ldr r0, [r4, #0x2c]
	bl GetUnitSpeed
	adds r1, r7, #0
	adds r1, #0x33
	strb r0, [r1]
	ldr r0, [r4, #0x2c]
	bl GetUnitLuck
	adds r1, r7, #0
	adds r1, #0x34
	strb r0, [r1]
	ldr r0, [r4, #0x2c]
	bl GetUnitDefense
	adds r1, r7, #0
	adds r1, #0x35
	strb r0, [r1]
	ldr r0, [r4, #0x2c]
	bl GetUnitResistance
	adds r1, r7, #0
	adds r1, #0x36
	strb r0, [r1]
	ldr r1, [r4, #0x2c]
	ldr r2, [r1, #4]
	ldr r0, [r1]
	ldrb r0, [r0, #0x13]
	ldrb r2, [r2, #0x11]
	adds r0, r0, r2
	ldrb r1, [r1, #0x1a]
	adds r1, r1, r0
	adds r0, r7, #0
	adds r0, #0x37
	strb r1, [r0]
	ldr r0, [r4, #0x2c]
	ldr r1, [r4, #0x30]
	lsls r3, r1, #1
	adds r2, r0, #0
	adds r2, #0x1e
	adds r2, r2, r3
	ldrh r5, [r2]
	bl ApplyStatBoostItem
	adds r6, r0, #0
	ldr r0, [r4, #0x2c]
	movs r1, #0
	bl DrawPrepScreenItemUseStatBars
	ldr r0, [r4, #0x2c]
	bl DrawPrepScreenItemUseStatValues
	ldr r0, [r4, #0x2c]
	bl GetUnitCurrentHp
	adds r1, r7, #0
	adds r1, #0x38
	strb r0, [r1]
	ldr r0, [r4, #0x2c]
	bl GetUnitPower
	adds r1, r7, #0
	adds r1, #0x39
	strb r0, [r1]
	ldr r0, [r4, #0x2c]
	bl GetUnitSkill
	adds r1, r7, #0
	adds r1, #0x3a
	strb r0, [r1]
	ldr r0, [r4, #0x2c]
	bl GetUnitSpeed
	adds r1, r7, #0
	adds r1, #0x3b
	strb r0, [r1]
	ldr r0, [r4, #0x2c]
	bl GetUnitLuck
	adds r1, r7, #0
	adds r1, #0x3c
	strb r0, [r1]
	ldr r0, [r4, #0x2c]
	bl GetUnitDefense
	adds r1, r7, #0
	adds r1, #0x3d
	strb r0, [r1]
	ldr r0, [r4, #0x2c]
	bl GetUnitResistance
	adds r1, r7, #0
	adds r1, #0x3e
	strb r0, [r1]
	ldr r1, [r4, #0x2c]
	ldr r2, [r1, #4]
	ldr r0, [r1]
	ldrb r0, [r0, #0x13]
	ldrb r2, [r2, #0x11]
	adds r0, r0, r2
	ldrb r1, [r1, #0x1a]
	adds r1, r1, r0
	adds r0, r7, #0
	adds r0, #0x3f
	strb r1, [r0]
	str r5, [sp]
	adds r0, r7, #0
	movs r1, #0xe
	movs r2, #0xe
	adds r3, r6, #0
	bl PrepItemBooster_DrawPopup
	movs r4, #0
_0809CEF0:
	adds r0, r7, #0
	adds r0, #0x30
	adds r3, r0, r4
	adds r0, #8
	adds r2, r0, r4
	ldrb r0, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	beq _0809CF1E
	asrs r1, r4, #2
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #3
	adds r0, #0xb0
	movs r1, #3
	ands r1, r4
	lsls r1, r1, #4
	adds r1, #0x2a
	ldrb r2, [r2]
	ldrb r3, [r3]
	subs r2, r2, r3
	bl sub_807EFF0
_0809CF1E:
	adds r4, #1
	cmp r4, #7
	ble _0809CEF0
	movs r0, #0x78
	str r0, [r7, #0x2c]
	ldr r0, _0809CF44  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809CF3A
	movs r0, #0x5a
	bl m4aSongNumStart
_0809CF3A:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809CF44: .4byte gRAMChapterData

	THUMB_FUNC_END PrepItemBooster_OnInit

	THUMB_FUNC_START PrepItemBooster_Idle
PrepItemBooster_Idle: @ 0x0809CF48
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r0, [r5, #0x40]
	ldr r1, [r5, #0x44]
	ldr r2, [r5, #0x48]
	ldr r3, [r5, #0x4c]
	ldr r4, _0809CF84  @ 0x0000A440
	str r4, [sp]
	bl sub_809A31C
	ldr r0, [r5, #0x2c]
	subs r0, #1
	str r0, [r5, #0x2c]
	cmp r0, #0
	beq _0809CF76
	ldr r0, _0809CF88  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #3
	ands r0, r1
	cmp r0, #0
	beq _0809CF7C
_0809CF76:
	adds r0, r5, #0
	bl Proc_Break
_0809CF7C:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0809CF84: .4byte 0x0000A440
_0809CF88: .4byte gKeyStatusPtr

	THUMB_FUNC_END PrepItemBooster_Idle

	THUMB_FUNC_START PrepItemBooster_OnEnd
PrepItemBooster_OnEnd: @ 0x0809CF8C
	push {r4, r5, lr}
	ldr r4, [r0, #0x14]
	ldr r0, [r4, #0x2c]
	bl GetUnitItemCount
	adds r5, r0, #0
	ldr r0, _0809CFB4  @ gUnknown_02024044
	movs r1, #0xe
	movs r2, #1
	movs r3, #0
	bl TileMap_FillRect
	cmp r5, #0
	bne _0809CFB8
	adds r0, r4, #0
	movs r1, #6
	bl Proc_Goto
	b _0809CFD4
	.align 2, 0
_0809CFB4: .4byte gUnknown_02024044
_0809CFB8:
	ldr r0, [r4, #0x30]
	cmp r0, r5
	blt _0809CFC2
	subs r0, #1
	str r0, [r4, #0x30]
_0809CFC2:
	ldr r1, [r4, #0x30]
	lsls r1, r1, #4
	adds r1, #0x48
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x10
	movs r2, #0xb
	bl sub_80AD51C
_0809CFD4:
	ldr r0, _0809D008  @ gUnknown_02022EEC
	ldr r1, _0809D00C  @ gUnknown_02013510
	ldr r2, [r4, #0x2c]
	movs r3, #1
	bl sub_809B74C
	ldr r0, [r4, #0x2c]
	ldr r1, [r4, #0x30]
	bl DrawPrepScreenItemUseItemUseDesc
	movs r0, #0
	bl sub_80ACA84
	bl sub_807EE74
	movs r0, #5
	bl BG_EnableSyncByMask
	ldr r0, _0809D010  @ 0x06014000
	movs r1, #1
	negs r1, r1
	bl LoadDialogueBoxGfx
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0809D008: .4byte gUnknown_02022EEC
_0809D00C: .4byte gUnknown_02013510
_0809D010: .4byte 0x06014000

	THUMB_FUNC_END PrepItemBooster_OnEnd

	THUMB_FUNC_START sub_809D014
sub_809D014: @ 0x0809D014
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r6, r0, #0
	adds r5, r1, #0
	adds r7, r2, #0
	movs r0, #0x1f
	bl GetStringFromIndex
	mov r9, r0
	ldr r0, [sp, #0x28]
	bl GetItemIconId
	mov r8, r0
	mov r0, r9
	bl GetStringTextWidth
	mov sl, r0
	mov r0, r8
	cmp r0, #0
	beq _0809D060
	lsls r4, r7, #5
	adds r4, r4, r5
	lsls r4, r4, #1
	ldr r0, _0809D0CC  @ gBG2TilemapBuffer
	adds r4, r4, r0
	ldr r0, [sp, #0x28]
	bl GetItemIconId
	adds r1, r0, #0
	movs r2, #0x80
	lsls r2, r2, #7
	adds r0, r4, #0
	bl DrawIcon
_0809D060:
	ldr r4, _0809D0D0  @ gUnknown_02013570
	adds r0, r4, #0
	bl Text_Clear
	lsls r0, r7, #5
	mov r1, r8
	cmp r1, #0
	beq _0809D072
	adds r0, #2
_0809D072:
	adds r0, r0, r5
	lsls r0, r0, #1
	ldr r1, _0809D0CC  @ gBG2TilemapBuffer
	adds r1, r0, r1
	movs r0, #0
	str r0, [sp]
	mov r0, r9
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r2, #0
	movs r3, #0
	bl DrawTextInline
	movs r0, #4
	bl BG_EnableSyncByMask
	lsls r0, r5, #3
	subs r0, #4
	str r0, [r6, #0x34]
	lsls r0, r7, #3
	subs r0, #4
	str r0, [r6, #0x38]
	mov r0, sl
	cmp r0, #0
	bge _0809D0A6
	adds r0, #7
_0809D0A6:
	asrs r1, r0, #3
	adds r0, r1, #1
	str r0, [r6, #0x3c]
	mov r0, r8
	cmp r0, #0
	beq _0809D0B6
	adds r0, r1, #3
	str r0, [r6, #0x3c]
_0809D0B6:
	movs r0, #2
	str r0, [r6, #0x40]
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809D0CC: .4byte gBG2TilemapBuffer
_0809D0D0: .4byte gUnknown_02013570

	THUMB_FUNC_END sub_809D014

	THUMB_FUNC_START PrepJunaEffect_OnInit
PrepJunaEffect_OnInit: @ 0x0809D0D4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r7, r0, #0
	ldr r4, [r7, #0x14]
	movs r0, #0xe0
	lsls r0, r0, #1
	movs r1, #3
	movs r2, #0
	adds r3, r7, #0
	bl sub_807EDF8
	ldr r0, [r4, #0x2c]
	ldrb r0, [r0, #8]
	movs r1, #0x30
	adds r1, r1, r7
	mov r8, r1
	strb r0, [r1]
	ldr r0, [r4, #0x2c]
	ldr r1, [r4, #0x30]
	lsls r3, r1, #1
	adds r2, r0, #0
	adds r2, #0x1e
	adds r2, r2, r3
	ldrh r5, [r2]
	bl sub_802F978
	adds r6, r0, #0
	ldr r0, [r4, #0x2c]
	movs r1, #0
	bl DrawPrepScreenItemUseStatBars
	ldr r0, [r4, #0x2c]
	bl DrawPrepScreenItemUseStatValues
	ldr r0, [r4, #0x2c]
	ldrb r0, [r0, #8]
	adds r4, r7, #0
	adds r4, #0x31
	strb r0, [r4]
	str r5, [sp]
	adds r0, r7, #0
	movs r1, #0x11
	movs r2, #0xe
	adds r3, r6, #0
	bl sub_809D014
	mov r0, r8
	movs r1, #0
	ldrsb r1, [r0, r1]
	movs r0, #0
	ldrsb r0, [r4, r0]
	cmp r1, r0
	beq _0809D154
	adds r2, r0, #0
	mov r1, r8
	movs r0, #0
	ldrsb r0, [r1, r0]
	subs r2, r2, r0
	movs r0, #0xb0
	movs r1, #0x1a
	bl sub_807EFF0
_0809D154:
	movs r0, #0x78
	str r0, [r7, #0x2c]
	ldr r0, _0809D178  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809D16A
	movs r0, #0x5a
	bl m4aSongNumStart
_0809D16A:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809D178: .4byte gRAMChapterData

	THUMB_FUNC_END PrepJunaEffect_OnInit

	THUMB_FUNC_START sub_809D17C
sub_809D17C: @ 0x0809D17C
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r0, [r5, #0x34]
	ldr r1, [r5, #0x38]
	ldr r2, [r5, #0x3c]
	ldr r3, [r5, #0x40]
	ldr r4, _0809D1B8  @ 0x0000A440
	str r4, [sp]
	bl sub_809A31C
	ldr r0, [r5, #0x2c]
	subs r0, #1
	str r0, [r5, #0x2c]
	cmp r0, #0
	beq _0809D1AA
	ldr r0, _0809D1BC  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #3
	ands r0, r1
	cmp r0, #0
	beq _0809D1B0
_0809D1AA:
	adds r0, r5, #0
	bl Proc_Break
_0809D1B0:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0809D1B8: .4byte 0x0000A440
_0809D1BC: .4byte gKeyStatusPtr

	THUMB_FUNC_END sub_809D17C

	THUMB_FUNC_START PrepJunaEffect_OnEnd
PrepJunaEffect_OnEnd: @ 0x0809D1C0
	push {r4, r5, lr}
	ldr r4, [r0, #0x14]
	ldr r0, [r4, #0x2c]
	bl GetUnitItemCount
	adds r5, r0, #0
	ldr r0, _0809D1E8  @ gUnknown_0202404A
	movs r1, #0xc
	movs r2, #1
	movs r3, #0
	bl TileMap_FillRect
	cmp r5, #0
	bne _0809D1EC
	adds r0, r4, #0
	movs r1, #6
	bl Proc_Goto
	b _0809D208
	.align 2, 0
_0809D1E8: .4byte gUnknown_0202404A
_0809D1EC:
	ldr r0, [r4, #0x30]
	cmp r0, r5
	blt _0809D1F6
	subs r0, #1
	str r0, [r4, #0x30]
_0809D1F6:
	ldr r1, [r4, #0x30]
	lsls r1, r1, #4
	adds r1, #0x48
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x10
	movs r2, #0xb
	bl sub_80AD51C
_0809D208:
	ldr r0, _0809D238  @ gUnknown_02022EEC
	ldr r1, _0809D23C  @ gUnknown_02013510
	ldr r2, [r4, #0x2c]
	movs r3, #1
	bl sub_809B74C
	ldr r0, [r4, #0x2c]
	ldr r1, [r4, #0x30]
	bl DrawPrepScreenItemUseItemUseDesc
	movs r0, #0
	bl sub_80ACA84
	movs r0, #5
	bl BG_EnableSyncByMask
	ldr r0, _0809D240  @ 0x06014000
	movs r1, #1
	negs r1, r1
	bl LoadDialogueBoxGfx
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0809D238: .4byte gUnknown_02022EEC
_0809D23C: .4byte gUnknown_02013510
_0809D240: .4byte 0x06014000

	THUMB_FUNC_END PrepJunaEffect_OnEnd

	THUMB_FUNC_START sub_809D244
sub_809D244: @ 0x0809D244
	push {r4, r5, r6, lr}
	sub sp, #4
	ldr r6, _0809D270  @ 0x0000DFC0
	movs r5, #0x30
	movs r4, #3
_0809D24E:
	str r6, [sp]
	movs r0, #4
	adds r1, r5, #0
	movs r2, #0x10
	ldr r3, _0809D274  @ gObject_32x16
	bl PutSpriteExt
	adds r6, #4
	adds r5, #0x20
	subs r4, #1
	cmp r4, #0
	bge _0809D24E
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0809D270: .4byte 0x0000DFC0
_0809D274: .4byte gObject_32x16

	THUMB_FUNC_END sub_809D244

	THUMB_FUNC_START sub_809D278
sub_809D278: @ 0x0809D278
	push {r4, r5, lr}
	sub sp, #0xc
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _0809D2B8  @ sub_809D244
	bl StartParallelWorker
	ldr r0, _0809D2BC  @ gUnknown_08A191F4
	lsls r4, r4, #2
	adds r4, r4, r0
	ldr r0, [r4]
	ldr r1, _0809D2C0  @ gUnknown_08A19200
	ldr r1, [r1]
	bl GetStringFromIndexInBuffer
	adds r2, r0, #0
	movs r0, #0xf0
	lsls r0, r0, #7
	movs r1, #2
	str r1, [sp]
	movs r1, #3
	str r1, [sp, #4]
	str r5, [sp, #8]
	movs r1, #0xd
	movs r3, #1
	bl sub_80ADD24
	add sp, #0xc
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0809D2B8: .4byte sub_809D244
_0809D2BC: .4byte gUnknown_08A191F4
_0809D2C0: .4byte gUnknown_08A19200

	THUMB_FUNC_END sub_809D278

	THUMB_FUNC_START StoreConvoyWeaponIconGraphics
StoreConvoyWeaponIconGraphics: @ 0x0809D2C4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0809D2F0  @ gUnknown_08A1A3FC
	lsls r1, r1, #5
	movs r2, #0x20
	bl CopyToPaletteBuffer
	ldr r0, _0809D2F4  @ gUnknown_08A1A0A4
	movs r2, #0xc0
	lsls r2, r2, #0x13
	adds r1, r4, r2
	bl CopyDataWithPossibleUncomp
	ldr r0, _0809D2F8  @ gUnknown_08A1A23C
	ldr r1, _0809D2FC  @ 0x06000200
	adds r4, r4, r1
	adds r1, r4, #0
	bl CopyDataWithPossibleUncomp
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809D2F0: .4byte gUnknown_08A1A3FC
_0809D2F4: .4byte gUnknown_08A1A0A4
_0809D2F8: .4byte gUnknown_08A1A23C
_0809D2FC: .4byte 0x06000200

	THUMB_FUNC_END StoreConvoyWeaponIconGraphics

	THUMB_FUNC_START sub_809D300
sub_809D300: @ 0x0809D300
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	str r0, [sp]
	mov sl, r1
	str r2, [sp, #4]
	str r3, [sp, #8]
	mov r0, sl
	movs r1, #0xc
	movs r2, #0x1f
	movs r3, #0
	bl TileMap_FillRect
	ldr r1, _0809D350  @ gUnknown_02012F56
	ldrh r0, [r1]
	cmp r0, #0
	bne _0809D354
	ldr r0, [sp]
	bl Text_Clear
	movs r0, #0xb5
	lsls r0, r0, #3
	bl GetStringFromIndex
	adds r3, r0, #0
	ldr r0, [sp]
	movs r1, #0
	movs r2, #1
	bl Text_InsertString
	mov r1, sl
	adds r1, #6
	ldr r0, [sp]
	bl Text_Draw
	b _0809D3FE
	.align 2, 0
_0809D350: .4byte gUnknown_02012F56
_0809D354:
	ldr r6, [sp, #4]
	adds r0, r6, #7
	cmp r6, r0
	bge _0809D3FE
	ldrh r1, [r1]
	cmp r6, r1
	bge _0809D3FE
_0809D362:
	movs r0, #7
	ands r0, r6
	lsls r0, r0, #3
	ldr r1, [sp]
	adds r1, r1, r0
	mov r8, r1
	ldr r1, _0809D410  @ gUnknown_020122D4
	lsls r0, r6, #2
	adds r0, r0, r1
	ldrh r7, [r0, #2]
	ldr r0, [sp, #8]
	adds r1, r7, #0
	bl IsItemDisplayUsable
	movs r1, #0
	mov r9, r1
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0809D38C
	movs r0, #1
	mov r9, r0
_0809D38C:
	mov r0, r8
	bl Text_Clear
	adds r0, r7, #0
	bl GetItemName
	adds r3, r0, #0
	mov r0, r8
	movs r1, #0
	mov r2, r9
	bl Text_InsertString
	lsls r5, r6, #1
	movs r0, #0x1f
	ands r5, r0
	lsls r5, r5, #6
	adds r4, r5, #2
	add r4, sl
	adds r0, r7, #0
	bl GetItemIconId
	adds r1, r0, #0
	adds r0, r4, #0
	movs r2, #0x80
	lsls r2, r2, #7
	bl DrawIcon
	adds r1, r5, #6
	add r1, sl
	mov r0, r8
	bl Text_Draw
	adds r5, #0x18
	mov r1, sl
	adds r4, r1, r5
	movs r5, #1
	mov r0, r9
	cmp r0, #0
	bne _0809D3DC
	movs r5, #2
_0809D3DC:
	adds r0, r7, #0
	bl GetItemUses
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	bl DrawDecNumber
	adds r6, #1
	ldr r0, [sp, #4]
	adds r0, #7
	cmp r6, r0
	bge _0809D3FE
	ldr r0, _0809D414  @ gUnknown_02012F56
	ldrh r0, [r0]
	cmp r6, r0
	blt _0809D362
_0809D3FE:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809D410: .4byte gUnknown_020122D4
_0809D414: .4byte gUnknown_02012F56

	THUMB_FUNC_END sub_809D300

	THUMB_FUNC_START sub_809D418
sub_809D418: @ 0x0809D418
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	adds r5, r1, #0
	adds r7, r5, #0
	adds r0, r5, #7
	cmp r5, r0
	bge _0809D468
	ldr r0, _0809D474  @ gUnknown_02012F56
	ldrh r0, [r0]
	cmp r5, r0
	bge _0809D468
	ldr r1, _0809D478  @ gUnknown_020122D4
	lsls r0, r5, #2
	adds r6, r0, r1
_0809D438:
	ldrh r0, [r6, #2]
	lsls r4, r5, #1
	movs r1, #0x1f
	ands r4, r1
	lsls r4, r4, #6
	adds r4, #2
	add r4, r8
	bl GetItemIconId
	adds r1, r0, #0
	adds r0, r4, #0
	movs r2, #0x80
	lsls r2, r2, #7
	bl DrawIcon
	adds r6, #4
	adds r5, #1
	adds r0, r7, #7
	cmp r5, r0
	bge _0809D468
	ldr r0, _0809D474  @ gUnknown_02012F56
	ldrh r0, [r0]
	cmp r5, r0
	blt _0809D438
_0809D468:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809D474: .4byte gUnknown_02012F56
_0809D478: .4byte gUnknown_020122D4

	THUMB_FUNC_END sub_809D418

	THUMB_FUNC_START sub_809D47C
sub_809D47C: @ 0x0809D47C
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	adds r5, r0, #0
	mov r9, r1
	ldr r0, _0809D528  @ gUnknown_02012F56
	ldrh r0, [r0]
	cmp r0, r2
	ble _0809D51C
	lsls r4, r2, #1
	movs r0, #0x1f
	ands r4, r0
	movs r0, #7
	ands r0, r2
	lsls r0, r0, #3
	adds r7, r5, r0
	ldr r1, _0809D52C  @ gUnknown_020122D4
	lsls r0, r2, #2
	adds r0, r0, r1
	ldrh r6, [r0, #2]
	adds r0, r3, #0
	adds r1, r6, #0
	bl IsItemDisplayUsable
	movs r1, #0
	mov r8, r1
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0809D4BC
	movs r0, #1
	mov r8, r0
_0809D4BC:
	lsls r4, r4, #6
	add r4, r9
	adds r0, r4, #0
	movs r1, #0xc
	movs r2, #1
	movs r3, #0
	bl TileMap_FillRect
	adds r0, r7, #0
	bl Text_Clear
	adds r0, r6, #0
	bl GetItemName
	adds r3, r0, #0
	adds r0, r7, #0
	movs r1, #0
	mov r2, r8
	bl Text_InsertString
	adds r5, r4, #2
	adds r0, r6, #0
	bl GetItemIconId
	adds r1, r0, #0
	movs r2, #0x80
	lsls r2, r2, #7
	adds r0, r5, #0
	bl DrawIcon
	adds r1, r4, #6
	adds r0, r7, #0
	bl Text_Draw
	adds r4, #0x18
	movs r5, #1
	mov r1, r8
	cmp r1, #0
	bne _0809D50C
	movs r5, #2
_0809D50C:
	adds r0, r6, #0
	bl GetItemUses
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	bl DrawDecNumber
_0809D51C:
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809D528: .4byte gUnknown_02012F56
_0809D52C: .4byte gUnknown_020122D4

	THUMB_FUNC_END sub_809D47C

	THUMB_FUNC_START sub_809D530
sub_809D530: @ 0x0809D530
	push {lr}
	ldr r0, _0809D568  @ 0x04000006
	ldrh r0, [r0]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0xa0
	bls _0809D542
	movs r2, #0
_0809D542:
	cmp r2, #0xc
	bne _0809D552
	ldr r1, _0809D56C  @ 0x04000050
	movs r0, #0xc8
	strh r0, [r1]
	adds r1, #4
	movs r0, #8
	strh r0, [r1]
_0809D552:
	cmp r2, #0x34
	beq _0809D55A
	cmp r2, #0
	bne _0809D564
_0809D55A:
	ldr r0, _0809D56C  @ 0x04000050
	movs r1, #0
	strh r1, [r0]
	adds r0, #4
	strh r1, [r0]
_0809D564:
	pop {r0}
	bx r0
	.align 2, 0
_0809D568: .4byte 0x04000006
_0809D56C: .4byte 0x04000050

	THUMB_FUNC_END sub_809D530

	THUMB_FUNC_START sub_809D570
sub_809D570: @ 0x0809D570
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0
	strh r0, [r4, #0x38]
	movs r0, #0xff
	strh r0, [r4, #0x36]
	ldr r0, [r4, #0x2c]
	bl GetUnitItemCount
	cmp r0, #0
	bne _0809D58E
	adds r1, r4, #0
	adds r1, #0x33
	movs r0, #1
	b _0809D594
_0809D58E:
	adds r1, r4, #0
	adds r1, #0x33
	movs r0, #0
_0809D594:
	strb r0, [r1]
	ldr r0, _0809D5B0  @ gGMData
	ldrb r0, [r0]
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	beq _0809D5B4
	bl sub_80C4048
	cmp r0, #0
	beq _0809D5C8
	adds r0, #0x2b
	b _0809D5C6
	.align 2, 0
_0809D5B0: .4byte gGMData
_0809D5B4:
	adds r0, r4, #0
	adds r0, #0x30
	ldrb r0, [r0]
	cmp r0, #0
	bne _0809D5D4
	ldr r0, _0809D5D0  @ ProcScr_AtMenu
	bl Proc_Find
	adds r0, #0x32
_0809D5C6:
	ldrb r0, [r0]
_0809D5C8:
	adds r1, r4, #0
	adds r1, #0x35
	strb r0, [r1]
	b _0809D5DA
	.align 2, 0
_0809D5D0: .4byte ProcScr_AtMenu
_0809D5D4:
	adds r0, r4, #0
	adds r0, #0x35
	strb r1, [r0]
_0809D5DA:
	adds r2, r4, #0
	adds r2, #0x32
	movs r1, #0
	movs r0, #4
	strb r0, [r2]
	adds r0, r4, #0
	adds r0, #0x31
	strb r1, [r0]
	movs r3, #0
	adds r1, r4, #0
	adds r1, #0x4c
	adds r0, #9
	movs r2, #8
_0809D5F4:
	strh r3, [r0]
	strh r3, [r1]
	adds r1, #2
	adds r0, #2
	subs r2, #1
	cmp r2, #0
	bge _0809D5F4
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_809D570

	THUMB_FUNC_START sub_809D608
sub_809D608: @ 0x0809D608
	push {r4, lr}
	ldr r4, _0809D638  @ gUnknown_02013648
	ldr r1, _0809D63C  @ 0x06011000
	adds r0, r4, #0
	movs r2, #0xb
	bl InitSomeOtherGraphicsRelatedStruct
	ldr r0, _0809D640  @ Pal_UIFont
	movs r1, #0xd8
	lsls r1, r1, #2
	movs r2, #0x20
	bl CopyToPaletteBuffer
	adds r4, #0x90
	adds r0, r4, #0
	bl Text_Init3
	movs r0, #0
	bl SetFont
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809D638: .4byte gUnknown_02013648
_0809D63C: .4byte 0x06011000
_0809D640: .4byte Pal_UIFont

	THUMB_FUNC_END sub_809D608

	THUMB_FUNC_START sub_809D644
sub_809D644: @ 0x0809D644
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	bl sub_8097CC8
	adds r5, r0, #0
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	ldr r0, [r4, #0x2c]
	bl GetUnitItemCount
	adds r6, r0, #0
	ldr r4, _0809D6BC  @ gUnknown_02013648
	adds r0, r4, #0
	bl SetFont
	movs r0, #0
	bl SetFontGlyphSet
	adds r4, #0x90
	adds r0, r4, #0
	movs r1, #0
	bl Text_80046B4
	adds r7, r4, #0
	movs r4, #0
	cmp r5, #0x64
	beq _0809D67E
	cmp r6, #0
	bne _0809D680
_0809D67E:
	movs r4, #1
_0809D680:
	ldr r0, _0809D6C0  @ 0x0000059E
	bl GetStringFromIndex
	adds r3, r0, #0
	adds r0, r7, #0
	movs r1, #0
	adds r2, r4, #0
	bl Text_InsertString
	ldr r5, _0809D6C4  @ gUnknown_020136D8
	movs r4, #0
	cmp r6, #5
	bne _0809D69C
	movs r4, #1
_0809D69C:
	ldr r0, _0809D6C8  @ 0x0000059F
	bl GetStringFromIndex
	adds r3, r0, #0
	adds r0, r5, #0
	movs r1, #0x40
	adds r2, r4, #0
	bl Text_InsertString
	movs r0, #0
	bl SetFont
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809D6BC: .4byte gUnknown_02013648
_0809D6C0: .4byte 0x0000059E
_0809D6C4: .4byte gUnknown_020136D8
_0809D6C8: .4byte 0x0000059F

	THUMB_FUNC_END sub_809D644

	THUMB_FUNC_START sub_809D6CC
sub_809D6CC: @ 0x0809D6CC
	push {r4, r5, r6, lr}
	sub sp, #8
	movs r0, #0
	bl SetFont
	ldr r6, _0809D77C  @ gUnknown_02022D10
	adds r0, r6, #0
	movs r1, #0xc
	movs r2, #1
	movs r3, #0
	bl TileMap_FillRect
	movs r0, #0xb3
	lsls r0, r0, #3
	bl GetStringFromIndex
	ldr r4, _0809D780  @ gUnknown_02013660
	adds r1, r6, #0
	adds r1, #0xda
	movs r5, #0
	str r5, [sp]
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r2, #0
	movs r3, #2
	bl DrawTextInline
	adds r1, r6, #0
	subs r1, #0x26
	movs r2, #0x9c
	lsls r2, r2, #2
	movs r0, #1
	str r0, [sp]
	movs r0, #0xab
	movs r3, #2
	bl PutFaceChibi
	movs r0, #0xb4
	lsls r0, r0, #3
	bl GetStringFromIndex
	adds r4, #8
	subs r1, r6, #2
	str r5, [sp]
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r2, #0
	movs r3, #4
	bl DrawTextInline
	adds r5, r6, #0
	adds r5, #0xa
	bl sub_8097CC8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r4, #2
	cmp r0, #0x64
	bne _0809D744
	movs r4, #4
_0809D744:
	bl sub_8097CC8
	adds r2, r0, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_8004B88
	adds r0, r6, #0
	adds r0, #0xc
	movs r1, #0
	movs r2, #0x16
	bl sub_8004B0C
	adds r0, r6, #0
	adds r0, #0x12
	movs r1, #2
	movs r2, #0x64
	bl sub_8004B88
	movs r0, #1
	bl BG_EnableSyncByMask
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0809D77C: .4byte gUnknown_02022D10
_0809D780: .4byte gUnknown_02013660

	THUMB_FUNC_END sub_809D6CC

	THUMB_FUNC_START sub_809D784
sub_809D784: @ 0x0809D784
	push {r4, lr}
	sub sp, #4
	ldr r0, _0809D7C4  @ 0x0000A840
	str r0, [sp]
	movs r0, #0x40
	movs r1, #0x21
	movs r2, #5
	movs r3, #4
	bl sub_809A31C
	ldr r4, _0809D7C8  @ gObject_32x16
	ldr r0, _0809D7CC  @ 0x0000B080
	str r0, [sp]
	movs r0, #4
	movs r1, #0x48
	movs r2, #0x25
	adds r3, r4, #0
	bl PutSpriteExt
	ldr r0, _0809D7D0  @ 0x0000B088
	str r0, [sp]
	movs r0, #4
	movs r1, #0x48
	movs r2, #0x35
	adds r3, r4, #0
	bl PutSpriteExt
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809D7C4: .4byte 0x0000A840
_0809D7C8: .4byte gObject_32x16
_0809D7CC: .4byte 0x0000B080
_0809D7D0: .4byte 0x0000B088

	THUMB_FUNC_END sub_809D784

	THUMB_FUNC_START sub_809D7D4
sub_809D7D4: @ 0x0809D7D4
	push {lr}
	sub sp, #4
	ldr r0, _0809D800  @ 0x0000A840
	str r0, [sp]
	movs r0, #0x40
	movs r1, #0x21
	movs r2, #5
	movs r3, #2
	bl sub_809A31C
	ldr r3, _0809D804  @ gObject_32x16
	ldr r0, _0809D808  @ 0x0000B080
	str r0, [sp]
	movs r0, #4
	movs r1, #0x48
	movs r2, #0x25
	bl PutSpriteExt
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_0809D800: .4byte 0x0000A840
_0809D804: .4byte gObject_32x16
_0809D808: .4byte 0x0000B080

	THUMB_FUNC_END sub_809D7D4

	THUMB_FUNC_START sub_809D80C
sub_809D80C: @ 0x0809D80C
	push {lr}
	sub sp, #4
	ldr r0, _0809D838  @ 0x0000A840
	str r0, [sp]
	movs r0, #0x40
	movs r1, #0x31
	movs r2, #5
	movs r3, #2
	bl sub_809A31C
	ldr r3, _0809D83C  @ gObject_32x16
	ldr r0, _0809D840  @ 0x0000B088
	str r0, [sp]
	movs r0, #4
	movs r1, #0x48
	movs r2, #0x35
	bl PutSpriteExt
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_0809D838: .4byte 0x0000A840
_0809D83C: .4byte gObject_32x16
_0809D840: .4byte 0x0000B088

	THUMB_FUNC_END sub_809D80C

	THUMB_FUNC_START sub_809D844
sub_809D844: @ 0x0809D844
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r6, r0, #0
	adds r7, r6, #0
	adds r7, #0x35
	ldrb r0, [r7]
	lsls r4, r0, #1
	adds r4, r4, r0
	lsls r4, r4, #2
	adds r4, #0x7c
	bl GetGameClock
	ldr r2, _0809D8BC  @ gPaletteBuffer
	lsrs r0, r0, #2
	movs r1, #0xf
	ands r0, r1
	lsls r0, r0, #1
	ldr r1, _0809D8C0  @ gUnknown_08A1BD60
	adds r0, r0, r1
	ldrh r0, [r0]
	ldr r1, _0809D8C4  @ 0x0000029A
	adds r2, r2, r1
	strh r0, [r2]
	bl EnablePaletteSync
	ldr r1, _0809D8C8  @ gUnknown_08A19608
	ldrb r0, [r7]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r3, [r0]
	movs r5, #0x85
	lsls r5, r5, #7
	str r5, [sp]
	movs r0, #4
	adds r1, r4, #0
	movs r2, #0x18
	bl PutSprite
	ldr r3, _0809D8CC  @ gUnknown_08A195F8
	str r5, [sp]
	movs r0, #4
	adds r1, r4, #0
	movs r2, #0x18
	bl PutSprite
	ldrb r0, [r7]
	lsls r0, r0, #1
	adds r6, #0x4c
	adds r6, r6, r0
	ldrh r1, [r6]
	ldr r0, _0809D8D0  @ gUnknown_02012F56
	ldrh r2, [r0]
	movs r0, #0xc
	movs r3, #7
	bl sub_80976CC
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809D8BC: .4byte gPaletteBuffer
_0809D8C0: .4byte gUnknown_08A1BD60
_0809D8C4: .4byte 0x0000029A
_0809D8C8: .4byte gUnknown_08A19608
_0809D8CC: .4byte gUnknown_08A195F8
_0809D8D0: .4byte gUnknown_02012F56

	THUMB_FUNC_END sub_809D844

	THUMB_FUNC_START sub_809D8D4
sub_809D8D4: @ 0x0809D8D4
	push {r4, r5, r6, lr}
	movs r5, #0
	lsls r2, r2, #0xc
	ldr r4, _0809D910  @ 0x0001FFFF
	adds r3, r1, #0
	ands r3, r4
	lsrs r3, r3, #5
	adds r6, r2, r3
	movs r3, #0x80
	lsls r3, r3, #2
	adds r1, r1, r3
	ands r1, r4
	lsrs r1, r1, #5
	adds r2, r2, r1
	adds r3, r0, #0
	adds r3, #0x40
	adds r1, r0, #0
_0809D8F6:
	adds r0, r6, r5
	strh r0, [r1]
	adds r0, r2, r5
	strh r0, [r3]
	adds r3, #2
	adds r1, #2
	adds r5, #1
	cmp r5, #0xe
	ble _0809D8F6
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0809D910: .4byte 0x0001FFFF

	THUMB_FUNC_END sub_809D8D4

	THUMB_FUNC_START sub_809D914
sub_809D914: @ 0x0809D914
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _0809D9F8  @ gLCDControlBuffer
	ldrb r1, [r4]
	movs r0, #8
	negs r0, r0
	ands r0, r1
	strb r0, [r4]
	movs r0, #0
	bl SetupBackgrounds
	movs r0, #0
	bl BG_GetMapBuffer
	movs r1, #0
	bl BG_Fill
	movs r0, #1
	bl BG_GetMapBuffer
	movs r1, #0
	bl BG_Fill
	movs r0, #2
	bl BG_GetMapBuffer
	movs r1, #0
	bl BG_Fill
	ldrb r1, [r4, #0xc]
	movs r2, #4
	negs r2, r2
	adds r0, r2, #0
	ands r0, r1
	movs r1, #1
	orrs r0, r1
	strb r0, [r4, #0xc]
	ldrb r1, [r4, #0x10]
	adds r0, r2, #0
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	strb r0, [r4, #0x10]
	ldrb r0, [r4, #0x14]
	ands r2, r0
	strb r2, [r4, #0x14]
	ldrb r0, [r4, #0x18]
	movs r1, #3
	orrs r0, r1
	strb r0, [r4, #0x18]
	bl ResetFaces
	bl Font_InitForUIDefault
	bl ResetIconGraphics_
	bl LoadUiFrameGraphics
	bl LoadObjUIGfx
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	adds r0, r5, #0
	adds r0, #0x35
	ldrb r0, [r0]
	lsls r0, r0, #1
	adds r5, #0x4c
	adds r5, r5, r0
	ldrh r2, [r5]
	subs r2, #0x28
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #2
	movs r1, #0
	bl BG_SetPosition
	ldr r0, _0809D9FC  @ 0x06013000
	movs r1, #1
	negs r1, r1
	bl LoadDialogueBoxGfx
	movs r0, #4
	bl LoadIconPalettes
	bl EndSlidingWallEffectMaybe
	movs r0, #8
	bl BG_EnableSyncByMask
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
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0809D9F8: .4byte gLCDControlBuffer
_0809D9FC: .4byte 0x06013000

	THUMB_FUNC_END sub_809D914

	THUMB_FUNC_START sub_809DA00
sub_809DA00: @ 0x0809DA00
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	sub sp, #8
	adds r7, r0, #0
	movs r0, #0xa0
	lsls r0, r0, #7
	movs r1, #5
	bl sub_8098C3C
	movs r0, #0x80
	lsls r0, r0, #4
	movs r1, #0xa
	bl sub_8098C8C
	ldr r0, _0809DC38  @ gUnknown_08A1B9EC
	ldr r4, _0809DC3C  @ gGenericBuffer
	adds r1, r4, #0
	bl CopyDataWithPossibleUncomp
	ldr r5, _0809DC40  @ gBG1TilemapBuffer
	movs r6, #0x80
	lsls r6, r6, #5
	adds r0, r5, #0
	adds r1, r4, #0
	adds r2, r6, #0
	bl CallARM_FillTileRect
	ldr r0, _0809DC44  @ gUnknown_08A1BCC0
	adds r1, r4, #0
	bl CopyDataWithPossibleUncomp
	adds r0, r5, #0
	adds r1, r4, #0
	adds r2, r6, #0
	bl CallARM_FillTileRect
	movs r0, #7
	bl BG_EnableSyncByMask
	movs r1, #0xe0
	lsls r1, r1, #4
	movs r3, #0xc0
	lsls r3, r3, #4
	movs r0, #0
	str r0, [sp]
	str r7, [sp, #4]
	movs r0, #0xd
	movs r2, #0xf
	bl StartSmallBrownNameBoxes
	movs r0, #0
	movs r1, #0x90
	movs r2, #6
	movs r3, #2
	bl sub_80ADBFC
	ldr r0, [r7, #0x2c]
	ldr r0, [r0]
	ldrh r0, [r0]
	bl GetStringFromIndex
	adds r0, r7, #0
	bl sub_80AC9C0
	adds r0, r7, #0
	bl ResetPrepScreenHandCursor
	movs r0, #0xc0
	lsls r0, r0, #3
	movs r1, #1
	bl sub_80AD4A0
	ldr r5, _0809DC48  @ gLCDControlBuffer
	ldrb r0, [r5, #1]
	movs r1, #0x20
	mov r8, r1
	mov r2, r8
	orrs r0, r2
	movs r1, #0x41
	negs r1, r1
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r5, #1]
	adds r1, r5, #0
	adds r1, #0x2d
	movs r0, #0x80
	strb r0, [r1]
	adds r1, #4
	movs r0, #0x28
	strb r0, [r1]
	subs r1, #5
	movs r0, #0xe0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0x98
	strb r0, [r1]
	movs r0, #0x34
	adds r0, r0, r5
	mov r9, r0
	ldrb r1, [r0]
	movs r6, #1
	orrs r1, r6
	movs r2, #2
	orrs r1, r2
	movs r0, #4
	orrs r1, r0
	movs r4, #8
	orrs r1, r4
	movs r3, #0x10
	orrs r1, r3
	adds r5, #0x36
	ldrb r0, [r5]
	orrs r0, r6
	orrs r0, r2
	movs r2, #5
	negs r2, r2
	ands r0, r2
	orrs r0, r4
	orrs r0, r3
	mov r2, r8
	orrs r1, r2
	mov r2, r9
	strb r1, [r2]
	mov r1, r8
	orrs r0, r1
	strb r0, [r5]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #8
	bl SetSpecialColorEffectsParameters
	adds r0, r7, #0
	bl NewGreenTextColorManager
	movs r0, #0xc3
	movs r1, #0x93
	movs r2, #9
	adds r3, r7, #0
	bl StartHelpPromptSprite
	ldr r4, _0809DC4C  @ gUnknown_02013660
	adds r0, r4, #0
	movs r1, #4
	bl Text_Init
	adds r0, r4, #0
	adds r0, #8
	movs r1, #4
	bl Text_Init
	bl sub_809D608
	adds r4, #0x10
	movs r5, #4
_0809DB3C:
	adds r0, r4, #0
	movs r1, #7
	bl Text_Init
	adds r4, #8
	subs r5, #1
	cmp r5, #0
	bge _0809DB3C
	movs r2, #0x35
	adds r2, r2, r7
	mov r8, r2
	movs r0, #0x4c
	adds r0, r0, r7
	mov r9, r0
	ldr r4, _0809DC50  @ gUnknown_02013698
	movs r5, #7
_0809DB5C:
	adds r0, r4, #0
	movs r1, #7
	bl Text_Allocate
	adds r4, #8
	subs r5, #1
	cmp r5, #0
	bge _0809DB5C
	movs r0, #0
	bl SetPrimaryHBlankHandler
	ldr r0, _0809DC54  @ sub_809D530
	bl SetPrimaryHBlankHandler
	movs r4, #0x80
	lsls r4, r4, #7
	adds r0, r4, #0
	movs r1, #6
	bl StoreConvoyWeaponIconGraphics
	ldr r5, _0809DC58  @ gUnknown_02022D86
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #6
	bl sub_809D8D4
	ldr r0, _0809DC5C  @ gUnknown_08A19CCC
	ldr r1, _0809DC60  @ 0x06015000
	bl CopyDataWithPossibleUncomp
	ldr r0, _0809DC64  @ gUnknown_08A1A084
	movs r6, #0xa0
	lsls r6, r6, #2
	adds r1, r6, #0
	movs r2, #0x20
	bl CopyToPaletteBuffer
	movs r3, #0xb0
	lsls r3, r3, #7
	movs r0, #9
	str r0, [sp]
	adds r0, r7, #0
	movs r1, #0xe1
	movs r2, #0x2f
	bl sub_8097748
	bl sub_8097668
	ldr r0, [r7, #0x2c]
	mov r2, r8
	ldrb r1, [r2]
	movs r2, #1
	bl SomethingPrepListRelated
	ldr r4, _0809DC50  @ gUnknown_02013698
	ldr r1, _0809DC68  @ gUnknown_02023CC6
	mov r2, r8
	ldrb r0, [r2]
	lsls r0, r0, #1
	add r0, r9
	ldrh r2, [r0]
	lsrs r2, r2, #4
	ldr r3, [r7, #0x2c]
	adds r0, r4, #0
	bl sub_809D300
	movs r0, #4
	bl BG_EnableSyncByMask
	movs r0, #0xb3
	lsls r0, r0, #1
	adds r5, r5, r0
	subs r4, #0x28
	ldr r2, [r7, #0x2c]
	adds r0, r5, #0
	adds r1, r4, #0
	movs r3, #0
	bl sub_809B74C
	bl sub_809D6CC
	adds r0, r7, #0
	bl sub_80ACCE0
	movs r0, #0
	adds r1, r6, #0
	movs r2, #2
	bl sub_80ACCF4
	movs r0, #0x78
	movs r1, #0x18
	movs r2, #0xe9
	movs r3, #0x18
	bl sub_80ACD7C
	movs r0, #3
	bl sub_80ACD60
	ldr r0, _0809DC6C  @ sub_809D844
	adds r1, r7, #0
	bl StartParallelWorker
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809DC38: .4byte gUnknown_08A1B9EC
_0809DC3C: .4byte gGenericBuffer
_0809DC40: .4byte gBG1TilemapBuffer
_0809DC44: .4byte gUnknown_08A1BCC0
_0809DC48: .4byte gLCDControlBuffer
_0809DC4C: .4byte gUnknown_02013660
_0809DC50: .4byte gUnknown_02013698
_0809DC54: .4byte sub_809D530
_0809DC58: .4byte gUnknown_02022D86
_0809DC5C: .4byte gUnknown_08A19CCC
_0809DC60: .4byte 0x06015000
_0809DC64: .4byte gUnknown_08A1A084
_0809DC68: .4byte gUnknown_02023CC6
_0809DC6C: .4byte sub_809D844

	THUMB_FUNC_END sub_809DA00

	THUMB_FUNC_START sub_809DC70
sub_809DC70: @ 0x0809DC70
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0
	adds r1, r4, #0
	bl sub_809D278
	movs r0, #0
	bl sub_80ACA84
	adds r0, r4, #0
	bl sub_809D644
	adds r0, r4, #0
	adds r0, #0x33
	ldrb r1, [r0]
	lsls r1, r1, #4
	adds r1, #0x24
	movs r3, #0x80
	lsls r3, r3, #3
	movs r0, #0x44
	movs r2, #4
	bl sub_80AD51C
	ldr r0, _0809DCC8  @ sub_809D7D4
	bl GetParallelWorker
	bl Proc_End
	ldr r0, _0809DCCC  @ sub_809D80C
	bl GetParallelWorker
	bl Proc_End
	ldr r0, _0809DCD0  @ sub_809D784
	adds r1, r4, #0
	bl StartParallelWorker
	movs r0, #7
	bl BG_EnableSyncByMask
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809DCC8: .4byte sub_809D7D4
_0809DCCC: .4byte sub_809D80C
_0809DCD0: .4byte sub_809D784

	THUMB_FUNC_END sub_809DC70

	THUMB_FUNC_START sub_809DCD4
sub_809DCD4: @ 0x0809DCD4
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r4, r5, #0
	adds r4, #0x33
	ldrb r6, [r4]
	ldrh r0, [r5, #0x38]
	cmp r0, #0
	beq _0809DCE6
	b _0809DE34
_0809DCE6:
	ldr r1, _0809DD04  @ gKeyStatusPtr
	ldr r0, [r1]
	ldrh r3, [r0, #8]
	movs r7, #1
	adds r0, r7, #0
	ands r0, r3
	mov ip, r1
	cmp r0, #0
	beq _0809DDE8
	cmp r6, #0
	beq _0809DD08
	cmp r6, #1
	beq _0809DD70
	b _0809DEEC
	.align 2, 0
_0809DD04: .4byte gKeyStatusPtr
_0809DD08:
	bl sub_8097CC8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x63
	bhi _0809DDCC
	ldr r0, [r5, #0x2c]
	bl GetUnitItemCount
	cmp r0, #0
	ble _0809DDCC
	ldrb r2, [r4]
	lsls r2, r2, #4
	adds r2, #0x24
	movs r0, #0
	movs r1, #0x44
	movs r3, #2
	bl sub_80AC9D4
	ldr r0, _0809DD64  @ sub_809D784
	bl GetParallelWorker
	bl Proc_End
	ldr r0, _0809DD68  @ sub_809D7D4
	adds r1, r5, #0
	bl StartParallelWorker
	movs r0, #1
	adds r1, r5, #0
	bl sub_809D278
	ldr r0, _0809DD6C  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809DD5A
	movs r0, #0x6a
	bl m4aSongNumStart
_0809DD5A:
	adds r0, r5, #0
	movs r1, #3
	bl Proc_Goto
	b _0809DEEC
	.align 2, 0
_0809DD64: .4byte sub_809D784
_0809DD68: .4byte sub_809D7D4
_0809DD6C: .4byte gRAMChapterData
_0809DD70:
	ldr r0, [r5, #0x2c]
	bl GetUnitItemCount
	cmp r0, #4
	bgt _0809DDCC
	ldrb r2, [r4]
	lsls r2, r2, #4
	adds r2, #0x24
	movs r0, #0
	movs r1, #0x44
	movs r3, #2
	bl sub_80AC9D4
	ldr r0, _0809DDC0  @ sub_809D784
	bl GetParallelWorker
	bl Proc_End
	ldr r0, _0809DDC4  @ sub_809D80C
	adds r1, r5, #0
	bl StartParallelWorker
	movs r0, #2
	adds r1, r5, #0
	bl sub_809D278
	ldr r0, _0809DDC8  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809DDB6
	movs r0, #0x6a
	bl m4aSongNumStart
_0809DDB6:
	adds r0, r5, #0
	movs r1, #4
	bl Proc_Goto
	b _0809DEEC
	.align 2, 0
_0809DDC0: .4byte sub_809D784
_0809DDC4: .4byte sub_809D80C
_0809DDC8: .4byte gRAMChapterData
_0809DDCC:
	ldr r0, _0809DDE4  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	bge _0809DDDA
	b _0809DEEC
_0809DDDA:
	movs r0, #0x6c
	bl m4aSongNumStart
	b _0809DEEC
	.align 2, 0
_0809DDE4: .4byte gRAMChapterData
_0809DDE8:
	movs r0, #2
	ands r0, r3
	cmp r0, #0
	beq _0809DE10
	adds r0, r5, #0
	movs r1, #8
	bl Proc_Goto
	ldr r0, _0809DE0C  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809DEEC
	movs r0, #0x6b
	bl m4aSongNumStart
	b _0809DEEC
	.align 2, 0
_0809DE0C: .4byte gRAMChapterData
_0809DE10:
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r3
	cmp r0, #0
	beq _0809DE54
	lsls r1, r6, #4
	adds r1, #0x24
	ldr r2, _0809DE30  @ gUnknown_08A19204
	lsls r0, r6, #2
	adds r0, r0, r2
	ldr r2, [r0]
	movs r0, #0x44
	bl StartHelpBox
	strh r7, [r5, #0x38]
	b _0809DEEC
	.align 2, 0
_0809DE30: .4byte gUnknown_08A19204
_0809DE34:
	ldr r2, _0809DE50  @ gKeyStatusPtr
	ldr r0, [r2]
	ldrh r1, [r0, #8]
	movs r0, #0x81
	lsls r0, r0, #1
	ands r0, r1
	mov ip, r2
	cmp r0, #0
	beq _0809DE54
	bl CloseHelpBox
	movs r0, #0
	strh r0, [r5, #0x38]
	b _0809DEEC
	.align 2, 0
_0809DE50: .4byte gKeyStatusPtr
_0809DE54:
	mov r0, ip
	ldr r3, [r0]
	ldrh r1, [r3, #6]
	movs r2, #0x40
	adds r0, r2, #0
	ands r0, r1
	adds r4, r5, #0
	adds r4, #0x33
	cmp r0, #0
	beq _0809DE80
	ldrb r0, [r4]
	cmp r0, #0
	beq _0809DE72
	subs r0, #1
	b _0809DE7E
_0809DE72:
	ldrh r1, [r3, #8]
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	beq _0809DE80
	movs r0, #1
_0809DE7E:
	strb r0, [r4]
_0809DE80:
	mov r0, ip
	ldr r2, [r0]
	ldrh r1, [r2, #6]
	movs r3, #0x80
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	beq _0809DEA8
	ldrb r0, [r4]
	cmp r0, #0
	bne _0809DE9A
	adds r0, #1
	b _0809DEA6
_0809DE9A:
	ldrh r1, [r2, #8]
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	beq _0809DEA8
	movs r0, #0
_0809DEA6:
	strb r0, [r4]
_0809DEA8:
	ldrb r0, [r4]
	cmp r6, r0
	beq _0809DEEC
	ldr r0, _0809DEF4  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809DEC0
	movs r0, #0x66
	bl m4aSongNumStart
_0809DEC0:
	ldrb r1, [r4]
	lsls r1, r1, #4
	adds r1, #0x24
	movs r3, #0x80
	lsls r3, r3, #3
	movs r0, #0x44
	movs r2, #4
	bl sub_80AD51C
	ldrh r0, [r5, #0x38]
	cmp r0, #0
	beq _0809DEEC
	ldrb r0, [r4]
	lsls r1, r0, #4
	adds r1, #0x24
	ldr r2, _0809DEF8  @ gUnknown_08A19204
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r2, [r0]
	movs r0, #0x44
	bl StartHelpBox
_0809DEEC:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809DEF4: .4byte gRAMChapterData
_0809DEF8: .4byte gUnknown_08A19204

	THUMB_FUNC_END sub_809DCD4

	THUMB_FUNC_START sub_809DEFC
sub_809DEFC: @ 0x0809DEFC
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	bl ResetIconGraphics_
	ldr r0, [r4, #0x2c]
	adds r5, r4, #0
	adds r5, #0x35
	ldrb r1, [r5]
	movs r2, #1
	bl SomethingPrepListRelated
	ldr r0, _0809DF8C  @ gUnknown_02013698
	ldr r1, _0809DF90  @ gUnknown_02023CC6
	ldrb r2, [r5]
	lsls r2, r2, #1
	adds r6, r4, #0
	adds r6, #0x4c
	adds r2, r6, r2
	ldrh r2, [r2]
	lsrs r2, r2, #4
	ldr r3, [r4, #0x2c]
	bl sub_809D300
	ldr r0, _0809DF94  @ gUnknown_02022EEC
	ldr r1, [r4, #0x2c]
	bl sub_809B830
	ldrb r0, [r5]
	lsls r0, r0, #1
	adds r7, r4, #0
	adds r7, #0x3a
	adds r1, r7, r0
	ldrh r1, [r1]
	lsls r1, r1, #4
	adds r0, r6, r0
	ldrh r0, [r0]
	subs r0, #0x28
	subs r1, r1, r0
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x80
	movs r2, #0xb
	bl sub_80AD51C
	movs r0, #5
	bl BG_EnableSyncByMask
	ldrh r0, [r4, #0x38]
	cmp r0, #0
	beq _0809DFA8
	ldr r0, _0809DF98  @ gUnknown_02012F56
	ldrh r0, [r0]
	cmp r0, #0
	beq _0809DFA0
	ldr r2, _0809DF9C  @ gUnknown_020122D4
	ldrb r3, [r5]
	lsls r3, r3, #1
	adds r0, r7, r3
	ldrh r1, [r0]
	lsls r0, r1, #2
	adds r0, r0, r2
	ldrh r2, [r0, #2]
	lsls r1, r1, #4
	adds r3, r6, r3
	ldrh r0, [r3]
	subs r0, #0x28
	subs r1, r1, r0
	movs r0, #0x80
	bl StartItemHelpBox
	movs r0, #1
	b _0809DFA6
	.align 2, 0
_0809DF8C: .4byte gUnknown_02013698
_0809DF90: .4byte gUnknown_02023CC6
_0809DF94: .4byte gUnknown_02022EEC
_0809DF98: .4byte gUnknown_02012F56
_0809DF9C: .4byte gUnknown_020122D4
_0809DFA0:
	bl CloseHelpBox
	movs r0, #0xff
_0809DFA6:
	strh r0, [r4, #0x38]
_0809DFA8:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_809DEFC

	THUMB_FUNC_START sub_809DFB0
sub_809DFB0: @ 0x0809DFB0
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r6, r0, #0
	movs r3, #0
	movs r7, #4
	adds r1, r6, #0
	adds r1, #0x34
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldrb r4, [r1]
	cmp r4, #4
	bge _0809DFDE
	subs r1, r7, r4
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #5
	muls r0, r1, r0
	movs r1, #0x10
	bl __divsi3
	adds r3, r0, #0
	subs r3, #0x60
_0809DFDE:
	adds r5, r6, #0
	adds r5, #0x35
	cmp r4, #4
	bne _0809DFFE
	ldrb r0, [r5]
	cmp r0, #0
	bne _0809DFF0
	movs r0, #8
	b _0809DFF2
_0809DFF0:
	subs r0, #1
_0809DFF2:
	strb r0, [r5]
	adds r0, r6, #0
	str r3, [sp]
	bl sub_809DEFC
	ldr r3, [sp]
_0809DFFE:
	adds r4, r6, #0
	adds r4, #0x34
	ldrb r1, [r4]
	cmp r1, r7
	blt _0809E01E
	subs r1, r1, r7
	subs r1, r7, r1
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #5
	muls r0, r1, r0
	adds r1, r7, #0
	muls r1, r7, r1
	bl __divsi3
	adds r3, r0, #0
_0809E01E:
	movs r0, #0xff
	ands r3, r0
	ldrb r1, [r5]
	lsls r1, r1, #1
	adds r0, r6, #0
	adds r0, #0x4c
	adds r0, r0, r1
	ldrh r2, [r0]
	subs r2, #0x28
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #2
	adds r1, r3, #0
	bl BG_SetPosition
	ldrb r1, [r4]
	lsls r0, r7, #1
	cmp r1, r0
	bne _0809E04C
	adds r0, r6, #0
	movs r1, #4
	bl Proc_Goto
_0809E04C:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_809DFB0

	THUMB_FUNC_START sub_809E054
sub_809E054: @ 0x0809E054
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r7, r0, #0
	movs r0, #4
	mov r8, r0
	adds r1, r7, #0
	adds r1, #0x34
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldrb r4, [r1]
	cmp r4, #4
	bge _0809E086
	mov r2, r8
	subs r1, r2, r4
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #5
	muls r0, r1, r0
	movs r1, #0x10
	bl __divsi3
	movs r1, #0x60
	subs r6, r1, r0
_0809E086:
	adds r5, r7, #0
	adds r5, #0x35
	cmp r4, #4
	bne _0809E0A2
	ldrb r0, [r5]
	cmp r0, #8
	bne _0809E098
	movs r0, #0
	b _0809E09A
_0809E098:
	adds r0, #1
_0809E09A:
	strb r0, [r5]
	adds r0, r7, #0
	bl sub_809DEFC
_0809E0A2:
	adds r4, r7, #0
	adds r4, #0x34
	ldrb r1, [r4]
	cmp r1, r8
	blt _0809E0C6
	mov r0, r8
	subs r1, r1, r0
	subs r1, r0, r1
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #5
	muls r0, r1, r0
	mov r2, r8
	mov r1, r8
	muls r1, r2, r1
	bl __divsi3
	negs r6, r0
_0809E0C6:
	movs r0, #0xff
	ands r6, r0
	ldrb r1, [r5]
	lsls r1, r1, #1
	adds r0, r7, #0
	adds r0, #0x4c
	adds r0, r0, r1
	ldrh r2, [r0]
	subs r2, #0x28
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #2
	adds r1, r6, #0
	bl BG_SetPosition
	ldrb r1, [r4]
	mov r2, r8
	lsls r0, r2, #1
	cmp r1, r0
	bne _0809E0F6
	adds r0, r7, #0
	movs r1, #4
	bl Proc_Goto
_0809E0F6:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_809E054

	THUMB_FUNC_START sub_809E100
sub_809E100: @ 0x0809E100
	push {r4, r5, lr}
	mov ip, r0
	ldr r0, _0809E128  @ gUnknown_02012F56
	ldrh r4, [r0]
	adds r5, r0, #0
	cmp r4, #0
	bne _0809E12C
	mov r3, ip
	adds r3, #0x35
	ldrb r0, [r3]
	lsls r0, r0, #1
	mov r1, ip
	adds r1, #0x3a
	adds r1, r1, r0
	mov r2, ip
	adds r2, #0x4c
	adds r0, r2, r0
	strh r4, [r0]
	strh r4, [r1]
	b _0809E14A
	.align 2, 0
_0809E128: .4byte gUnknown_02012F56
_0809E12C:
	mov r2, ip
	adds r2, #0x35
	ldrb r0, [r2]
	lsls r0, r0, #1
	mov r1, ip
	adds r1, #0x3a
	adds r4, r1, r0
	ldrh r1, [r4]
	ldrh r0, [r5]
	subs r0, #1
	adds r3, r2, #0
	adds r2, #0x17
	cmp r1, r0
	ble _0809E14A
	strh r0, [r4]
_0809E14A:
	ldrh r0, [r5]
	cmp r0, #6
	bls _0809E168
	ldrb r0, [r3]
	lsls r0, r0, #1
	adds r4, r2, r0
	ldrh r0, [r4]
	lsrs r0, r0, #4
	adds r0, #7
	ldrh r1, [r5]
	cmp r0, r1
	ble _0809E168
	subs r0, r1, #7
	lsls r0, r0, #4
	strh r0, [r4]
_0809E168:
	ldrb r0, [r3]
	lsls r0, r0, #1
	adds r0, r2, r0
	ldrh r2, [r0]
	subs r2, #0x28
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #2
	movs r1, #0
	bl BG_SetPosition
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_809E100

	THUMB_FUNC_START sub_809E184
sub_809E184: @ 0x0809E184
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov ip, r0
	adds r0, #0x35
	ldrb r1, [r0]
	lsls r1, r1, #1
	adds r0, #5
	adds r4, r0, r1
	ldrh r3, [r4]
	lsls r2, r3, #4
	adds r0, #0x12
	adds r0, r0, r1
	ldrh r0, [r0]
	subs r0, #0x28
	subs r2, r2, r0
	cmp r2, #0x37
	bgt _0809E1B0
	cmp r3, #0
	beq _0809E1B0
	adds r0, r3, #1
	strh r0, [r4]
_0809E1B0:
	mov r4, ip
	adds r4, #0x35
	ldrb r0, [r4]
	lsls r0, r0, #1
	mov r3, ip
	adds r3, #0x3a
	adds r6, r3, r0
	ldrh r5, [r6]
	lsls r1, r5, #4
	mov r2, ip
	adds r2, #0x4c
	adds r0, r2, r0
	ldrh r0, [r0]
	subs r0, #0x28
	subs r1, r1, r0
	adds r7, r3, #0
	mov r8, r2
	cmp r1, #0x78
	ble _0809E1E4
	ldr r0, _0809E214  @ gUnknown_02012F56
	ldrh r0, [r0]
	subs r0, #1
	cmp r5, r0
	beq _0809E1E4
	subs r0, r5, #1
	strh r0, [r6]
_0809E1E4:
	mov r0, ip
	bl sub_809E100
	ldrb r0, [r4]
	lsls r0, r0, #1
	adds r1, r7, r0
	ldrh r1, [r1]
	lsls r1, r1, #4
	add r0, r8
	ldrh r0, [r0]
	subs r0, #0x28
	subs r1, r1, r0
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x80
	movs r2, #0xb
	bl sub_80AD51C
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809E214: .4byte gUnknown_02012F56

	THUMB_FUNC_END sub_809E184

	THUMB_FUNC_START sub_809E218
sub_809E218: @ 0x0809E218
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	adds r7, r1, #0
	bl ResetIconGraphics_
	ldr r0, _0809E2B0  @ gUnknown_02023CC6
	mov r8, r0
	adds r6, r4, #0
	adds r6, #0x35
	ldrb r0, [r6]
	lsls r0, r0, #1
	adds r5, r4, #0
	adds r5, #0x4c
	adds r0, r5, r0
	ldrh r1, [r0]
	lsrs r1, r1, #4
	mov r0, r8
	bl sub_809D418
	ldr r0, _0809E2B4  @ gUnknown_02022EEC
	ldr r1, [r4, #0x2c]
	bl sub_809B830
	movs r0, #5
	bl BG_EnableSyncByMask
	cmp r7, #0
	bge _0809E26A
	ldr r0, _0809E2B8  @ gUnknown_02013698
	ldrb r1, [r6]
	lsls r1, r1, #1
	adds r1, r5, r1
	ldrh r2, [r1]
	lsrs r2, r2, #4
	subs r2, #1
	ldr r3, [r4, #0x2c]
	mov r1, r8
	bl sub_809D47C
_0809E26A:
	cmp r7, #0
	ble _0809E284
	ldr r0, _0809E2B8  @ gUnknown_02013698
	ldrb r1, [r6]
	lsls r1, r1, #1
	adds r1, r5, r1
	ldrh r2, [r1]
	lsrs r2, r2, #4
	adds r2, #7
	ldr r3, [r4, #0x2c]
	mov r1, r8
	bl sub_809D47C
_0809E284:
	ldrb r1, [r6]
	lsls r1, r1, #1
	adds r1, r5, r1
	ldrh r0, [r1]
	adds r0, r0, r7
	strh r0, [r1]
	ldrb r0, [r6]
	lsls r0, r0, #1
	adds r0, r5, r0
	ldrh r2, [r0]
	subs r2, #0x28
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #2
	movs r1, #0
	bl BG_SetPosition
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809E2B0: .4byte gUnknown_02023CC6
_0809E2B4: .4byte gUnknown_02022EEC
_0809E2B8: .4byte gUnknown_02013698

	THUMB_FUNC_END sub_809E218

	THUMB_FUNC_START sub_809E2BC
sub_809E2BC: @ 0x0809E2BC
	push {lr}
	bl sub_809D6CC
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_809E2BC

	THUMB_FUNC_START sub_809E2C8
sub_809E2C8: @ 0x0809E2C8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r7, r0, #0
	ldr r0, [r7, #0x2c]
	bl GetUnitItemCount
	adds r2, r0, #0
	cmp r2, #5
	beq _0809E2E4
	ldr r0, _0809E2FC  @ gUnknown_02012F56
	ldrh r0, [r0]
	cmp r0, #0
	bne _0809E304
_0809E2E4:
	ldr r0, _0809E300  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	bge _0809E2F2
	b _0809E412
_0809E2F2:
	movs r0, #0x6c
	bl m4aSongNumStart
	b _0809E412
	.align 2, 0
_0809E2FC: .4byte gUnknown_02012F56
_0809E300: .4byte gRAMChapterData
_0809E304:
	movs r5, #0
	strh r5, [r7, #0x38]
	ldr r1, [r7, #0x2c]
	lsls r0, r2, #1
	adds r1, #0x1e
	adds r1, r1, r0
	ldr r4, _0809E3E4  @ gUnknown_020122D4
	movs r0, #0x35
	adds r0, r0, r7
	mov r8, r0
	ldrb r0, [r0]
	lsls r0, r0, #1
	adds r6, r7, #0
	adds r6, #0x3a
	adds r0, r6, r0
	ldrh r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r4
	ldrh r0, [r0, #2]
	strh r0, [r1]
	ldr r0, [r7, #0x2c]
	bl UnitRemoveInvalidItems
	mov r1, r8
	ldrb r0, [r1]
	lsls r0, r0, #1
	adds r0, r6, r0
	ldrh r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r4
	strh r5, [r0, #2]
	bl sub_80982B8
	ldr r0, [r7, #0x2c]
	mov r2, r8
	ldrb r1, [r2]
	movs r2, #1
	bl SomethingPrepListRelated
	adds r0, r7, #0
	bl sub_809E100
	bl ResetIconGraphics_
	ldr r0, _0809E3E8  @ gUnknown_02022EEC
	ldr r4, _0809E3EC  @ gUnknown_02013670
	ldr r2, [r7, #0x2c]
	adds r1, r4, #0
	movs r3, #0
	bl sub_809B74C
	adds r4, #0x28
	ldr r1, _0809E3F0  @ gUnknown_02023CC6
	mov r2, r8
	ldrb r0, [r2]
	lsls r0, r0, #1
	adds r5, r7, #0
	adds r5, #0x4c
	adds r0, r5, r0
	ldrh r2, [r0]
	lsrs r2, r2, #4
	ldr r3, [r7, #0x2c]
	adds r0, r4, #0
	bl sub_809D300
	ldr r0, _0809E3F4  @ sub_809E2BC
	movs r1, #1
	adds r2, r7, #0
	bl sub_80ACE20
	mov r1, r8
	ldrb r0, [r1]
	lsls r0, r0, #1
	adds r6, r6, r0
	ldrh r1, [r6]
	lsls r1, r1, #4
	adds r5, r5, r0
	ldrh r0, [r5]
	subs r0, #0x28
	subs r1, r1, r0
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x80
	movs r2, #0xb
	bl sub_80AD51C
	movs r0, #5
	bl BG_EnableSyncByMask
	ldr r1, _0809E3F8  @ gActionData
	movs r0, #0x1c
	strb r0, [r1, #0x11]
	ldr r0, [r7, #0x2c]
	bl GetUnitItemCount
	cmp r0, #5
	bne _0809E400
	adds r0, r7, #0
	movs r1, #1
	bl Proc_Goto
	ldr r0, _0809E3FC  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809E412
	movs r0, #0x6b
	bl m4aSongNumStart
	b _0809E412
	.align 2, 0
_0809E3E4: .4byte gUnknown_020122D4
_0809E3E8: .4byte gUnknown_02022EEC
_0809E3EC: .4byte gUnknown_02013670
_0809E3F0: .4byte gUnknown_02023CC6
_0809E3F4: .4byte sub_809E2BC
_0809E3F8: .4byte gActionData
_0809E3FC: .4byte gRAMChapterData
_0809E400:
	ldr r0, _0809E41C  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809E412
	movs r0, #0x6a
	bl m4aSongNumStart
_0809E412:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809E41C: .4byte gRAMChapterData

	THUMB_FUNC_END sub_809E2C8

	THUMB_FUNC_START sub_809E420
sub_809E420: @ 0x0809E420
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	adds r4, r0, #0
	adds r7, r4, #0
	adds r7, #0x35
	ldrb r0, [r7]
	lsls r0, r0, #1
	movs r1, #0x3a
	adds r1, r1, r4
	mov r8, r1
	adds r1, r1, r0
	ldrh r1, [r1]
	mov sl, r1
	adds r5, r4, #0
	adds r5, #0x4c
	adds r6, r5, r0
	ldrh r0, [r6]
	movs r2, #0xf
	mov r9, r2
	mov r1, r9
	ands r1, r0
	mov r9, r1
	cmp r1, #0
	beq _0809E458
	b _0809E648
_0809E458:
	ldrh r0, [r4, #0x38]
	cmp r0, #0
	beq _0809E462
	cmp r0, #0xff
	bne _0809E500
_0809E462:
	ldr r1, _0809E49C  @ gKeyStatusPtr
	ldr r0, [r1]
	ldrh r3, [r0, #8]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r3
	mov r8, r1
	cmp r0, #0
	beq _0809E4C4
	ldr r0, _0809E4A0  @ gUnknown_02012F56
	ldrh r0, [r0]
	cmp r0, #0
	beq _0809E4A8
	ldr r1, _0809E4A4  @ gUnknown_020122D4
	mov r2, sl
	lsls r0, r2, #2
	adds r0, r0, r1
	ldrh r2, [r0, #2]
	mov r0, sl
	lsls r1, r0, #4
	ldrh r0, [r6]
	subs r0, #0x28
	subs r1, r1, r0
	movs r0, #0x80
	bl StartItemHelpBox
	movs r0, #1
	strh r0, [r4, #0x38]
	b _0809E79A
	.align 2, 0
_0809E49C: .4byte gKeyStatusPtr
_0809E4A0: .4byte gUnknown_02012F56
_0809E4A4: .4byte gUnknown_020122D4
_0809E4A8:
	ldr r0, _0809E4C0  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	bge _0809E4B6
	b _0809E79A
_0809E4B6:
	movs r0, #0x6c
	bl m4aSongNumStart
	b _0809E79A
	.align 2, 0
_0809E4C0: .4byte gRAMChapterData
_0809E4C4:
	movs r0, #1
	ands r0, r3
	cmp r0, #0
	beq _0809E4D4
	adds r0, r4, #0
	bl sub_809E2C8
	b _0809E79A
_0809E4D4:
	movs r0, #2
	ands r0, r3
	cmp r0, #0
	beq _0809E520
	adds r0, r4, #0
	movs r1, #1
	bl Proc_Goto
	ldr r0, _0809E4FC  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809E4F6
	movs r0, #0x6b
	bl m4aSongNumStart
_0809E4F6:
	mov r1, r9
	strh r1, [r4, #0x38]
	b _0809E79A
	.align 2, 0
_0809E4FC: .4byte gRAMChapterData
_0809E500:
	ldr r2, _0809E51C  @ gKeyStatusPtr
	ldr r0, [r2]
	ldrh r1, [r0, #8]
	movs r0, #0x81
	lsls r0, r0, #1
	ands r0, r1
	mov r8, r2
	cmp r0, #0
	beq _0809E520
	bl CloseHelpBox
	mov r2, r9
	strh r2, [r4, #0x38]
	b _0809E79A
	.align 2, 0
_0809E51C: .4byte gKeyStatusPtr
_0809E520:
	mov r0, r8
	ldr r2, [r0]
	ldrh r1, [r2, #6]
	movs r0, #0x20
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0
	beq _0809E568
	movs r0, #0
	bl sub_80ACDA4
	ldr r0, _0809E564  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809E54A
	movs r0, #0x67
	bl m4aSongNumStart
_0809E54A:
	adds r0, r4, #0
	movs r1, #5
	bl Proc_Goto
	adds r1, r4, #0
	adds r1, #0x34
	movs r0, #0
	strb r0, [r1]
	adds r0, r4, #0
	bl sub_809DFB0
	b _0809E79A
	.align 2, 0
_0809E564: .4byte gRAMChapterData
_0809E568:
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _0809E5A4
	movs r0, #1
	bl sub_80ACDA4
	ldr r0, _0809E5A0  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809E588
	movs r0, #0x67
	bl m4aSongNumStart
_0809E588:
	adds r0, r4, #0
	movs r1, #6
	bl Proc_Goto
	adds r0, r4, #0
	adds r0, #0x34
	strb r5, [r0]
	adds r0, r4, #0
	bl sub_809E054
	b _0809E79A
	.align 2, 0
_0809E5A0: .4byte gRAMChapterData
_0809E5A4:
	ldrh r1, [r2, #4]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0809E5B8
	adds r1, r4, #0
	adds r1, #0x32
	movs r0, #8
	b _0809E5BE
_0809E5B8:
	adds r1, r4, #0
	adds r1, #0x32
	movs r0, #4
_0809E5BE:
	strb r0, [r1]
	adds r7, r1, #0
	mov r1, r8
	ldr r2, [r1]
	ldrh r1, [r2, #6]
	movs r3, #0x40
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	bne _0809E5EC
	ldrh r1, [r2, #4]
	adds r0, r3, #0
	ands r0, r1
	adds r6, r4, #0
	adds r6, #0x35
	adds r5, r4, #0
	adds r5, #0x3a
	cmp r0, #0
	beq _0809E608
	movs r0, #0
	ldrsb r0, [r7, r0]
	cmp r0, #8
	bne _0809E608
_0809E5EC:
	adds r0, r4, #0
	adds r0, #0x35
	ldrb r1, [r0]
	lsls r1, r1, #1
	adds r2, r4, #0
	adds r2, #0x3a
	adds r3, r2, r1
	ldrh r1, [r3]
	adds r6, r0, #0
	adds r5, r2, #0
	cmp r1, #0
	beq _0809E608
	subs r0, r1, #1
	strh r0, [r3]
_0809E608:
	mov r0, r8
	ldr r2, [r0]
	ldrh r1, [r2, #6]
	movs r3, #0x80
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	bne _0809E62A
	ldrh r1, [r2, #4]
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	beq _0809E6A8
	movs r0, #0
	ldrsb r0, [r7, r0]
	cmp r0, #8
	bne _0809E6A8
_0809E62A:
	ldrb r0, [r6]
	lsls r0, r0, #1
	adds r2, r5, r0
	ldrh r1, [r2]
	ldr r0, _0809E644  @ gUnknown_02012F56
	ldrh r0, [r0]
	subs r0, #1
	cmp r1, r0
	bge _0809E6A8
	adds r0, r1, #1
	strh r0, [r2]
	b _0809E6A8
	.align 2, 0
_0809E644: .4byte gUnknown_02012F56
_0809E648:
	mov r1, sl
	lsls r0, r1, #4
	ldrh r2, [r6]
	adds r1, r2, #0
	subs r1, #0x28
	subs r0, r0, r1
	cmp r0, #0x37
	bgt _0809E666
	adds r0, r4, #0
	adds r0, #0x32
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r2, r0
	strh r0, [r6]
_0809E666:
	ldrb r0, [r7]
	lsls r0, r0, #1
	mov r2, r8
	adds r1, r2, r0
	ldrh r1, [r1]
	lsls r1, r1, #4
	adds r3, r5, r0
	ldrh r2, [r3]
	adds r0, r2, #0
	subs r0, #0x28
	subs r1, r1, r0
	cmp r1, #0x78
	ble _0809E68E
	adds r0, r4, #0
	adds r0, #0x32
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r0, r2, r0
	strh r0, [r3]
_0809E68E:
	ldrb r0, [r7]
	lsls r0, r0, #1
	adds r0, r5, r0
	ldrh r2, [r0]
	subs r2, #0x28
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #2
	movs r1, #0
	bl BG_SetPosition
	adds r6, r7, #0
	mov r5, r8
_0809E6A8:
	ldrb r0, [r6]
	lsls r0, r0, #1
	adds r0, r5, r0
	ldrh r0, [r0]
	cmp sl, r0
	beq _0809E79A
	ldr r1, _0809E710  @ gUnknown_020122D4
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrh r0, [r0, #2]
	mov r8, r0
	ldr r0, _0809E714  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809E6D0
	movs r0, #0x66
	bl m4aSongNumStart
_0809E6D0:
	ldrb r0, [r6]
	lsls r0, r0, #1
	adds r1, r5, r0
	ldrh r3, [r1]
	lsls r2, r3, #4
	adds r1, r4, #0
	adds r1, #0x4c
	adds r0, r1, r0
	ldrh r0, [r0]
	subs r0, #0x28
	subs r2, r2, r0
	adds r7, r1, #0
	cmp r2, #0x37
	bgt _0809E718
	cmp r3, #0
	beq _0809E718
	ldrh r0, [r4, #0x38]
	cmp r0, #0
	beq _0809E702
	adds r1, r2, #0
	adds r1, #0x10
	movs r0, #0x80
	mov r2, r8
	bl StartItemHelpBox
_0809E702:
	adds r0, r4, #0
	adds r0, #0x32
	movs r1, #0
	ldrsb r1, [r0, r1]
	negs r1, r1
	b _0809E750
	.align 2, 0
_0809E710: .4byte gUnknown_020122D4
_0809E714: .4byte gRAMChapterData
_0809E718:
	ldrb r0, [r6]
	lsls r0, r0, #1
	adds r1, r5, r0
	ldrh r2, [r1]
	lsls r1, r2, #4
	adds r0, r7, r0
	ldrh r0, [r0]
	subs r0, #0x28
	subs r1, r1, r0
	cmp r1, #0x78
	ble _0809E75C
	ldr r0, _0809E758  @ gUnknown_02012F56
	ldrh r0, [r0]
	subs r0, #1
	cmp r2, r0
	beq _0809E75C
	ldrh r0, [r4, #0x38]
	cmp r0, #0
	beq _0809E748
	subs r1, #0x10
	movs r0, #0x80
	mov r2, r8
	bl StartItemHelpBox
_0809E748:
	adds r0, r4, #0
	adds r0, #0x32
	movs r1, #0
	ldrsb r1, [r0, r1]
_0809E750:
	adds r0, r4, #0
	bl sub_809E218
	b _0809E79A
	.align 2, 0
_0809E758: .4byte gUnknown_02012F56
_0809E75C:
	ldrh r0, [r4, #0x38]
	cmp r0, #0
	beq _0809E77C
	ldrb r0, [r6]
	lsls r0, r0, #1
	adds r1, r5, r0
	ldrh r1, [r1]
	lsls r1, r1, #4
	adds r0, r7, r0
	ldrh r0, [r0]
	subs r0, #0x28
	subs r1, r1, r0
	movs r0, #0x80
	mov r2, r8
	bl StartItemHelpBox
_0809E77C:
	ldrb r0, [r6]
	lsls r0, r0, #1
	adds r1, r5, r0
	ldrh r1, [r1]
	lsls r1, r1, #4
	adds r0, r7, r0
	ldrh r0, [r0]
	subs r0, #0x28
	subs r1, r1, r0
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x80
	movs r2, #0xb
	bl sub_80AD51C
_0809E79A:
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_809E420

	THUMB_FUNC_START sub_809E7A8
sub_809E7A8: @ 0x0809E7A8
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	ldr r6, _0809E7D8  @ gKeyStatusPtr
	ldr r0, [r6]
	ldrh r1, [r0, #6]
	movs r7, #0x40
	adds r0, r7, #0
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0
	beq _0809E7EE
	ldr r0, [r4, #0x2c]
	bl GetUnitItemCount
	adds r3, r0, #0
	adds r2, r4, #0
	adds r2, #0x31
	ldrb r0, [r2]
	cmp r0, #0
	beq _0809E7DC
	subs r0, #1
	strb r0, [r2]
	b _0809E81E
	.align 2, 0
_0809E7D8: .4byte gKeyStatusPtr
_0809E7DC:
	ldr r0, [r6]
	ldrh r1, [r0, #8]
	adds r0, r7, #0
	ands r0, r1
	cmp r0, #0
	beq _0809E838
	subs r0, r3, #1
	strb r0, [r2]
	b _0809E81E
_0809E7EE:
	movs r7, #0x80
	adds r0, r7, #0
	ands r0, r1
	cmp r0, #0
	beq _0809E838
	ldr r0, [r4, #0x2c]
	bl GetUnitItemCount
	adds r2, r4, #0
	adds r2, #0x31
	ldrb r1, [r2]
	subs r0, #1
	cmp r1, r0
	bge _0809E810
	adds r0, r1, #1
	strb r0, [r2]
	b _0809E81E
_0809E810:
	ldr r0, [r6]
	ldrh r1, [r0, #8]
	adds r0, r7, #0
	ands r0, r1
	cmp r0, #0
	beq _0809E838
	strb r5, [r2]
_0809E81E:
	ldr r0, _0809E834  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809E830
	movs r0, #0x66
	bl m4aSongNumStart
_0809E830:
	movs r0, #1
	b _0809E83A
	.align 2, 0
_0809E834: .4byte gRAMChapterData
_0809E838:
	movs r0, #0
_0809E83A:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_809E7A8

	THUMB_FUNC_START sub_809E840
sub_809E840: @ 0x0809E840
	push {lr}
	adds r0, #0x31
	ldrb r1, [r0]
	lsls r1, r1, #4
	adds r1, #0x48
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x10
	movs r2, #0xb
	bl sub_80AD51C
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_809E840

	THUMB_FUNC_START sub_809E85C
sub_809E85C: @ 0x0809E85C
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x2c]
	adds r7, r5, #0
	adds r7, #0x31
	ldrb r2, [r7]
	lsls r2, r2, #1
	adds r1, r0, #0
	adds r1, #0x1e
	adds r1, r1, r2
	ldrh r4, [r1]
	bl GetUnitItemCount
	ldr r1, [r5, #0x2c]
	ldrb r0, [r7]
	lsls r0, r0, #1
	adds r1, #0x1e
	adds r1, r1, r0
	movs r0, #0
	strh r0, [r1]
	ldr r0, [r5, #0x2c]
	bl UnitRemoveInvalidItems
	adds r0, r4, #0
	bl sub_8098014
	adds r6, r5, #0
	adds r6, #0x35
	strb r0, [r6]
	adds r0, r4, #0
	bl AddItemToConvoy
	ldr r0, [r5, #0x2c]
	ldrb r1, [r6]
	movs r2, #1
	bl SomethingPrepListRelated
	adds r0, r5, #0
	bl sub_809E100
	bl ResetIconGraphics_
	ldr r0, _0809E924  @ gUnknown_02022EEC
	ldr r4, _0809E928  @ gUnknown_02013670
	ldr r2, [r5, #0x2c]
	adds r1, r4, #0
	movs r3, #0
	bl sub_809B74C
	adds r4, #0x28
	ldr r1, _0809E92C  @ gUnknown_02023CC6
	ldrb r2, [r6]
	lsls r2, r2, #1
	adds r0, r5, #0
	adds r0, #0x4c
	adds r0, r0, r2
	ldrh r2, [r0]
	lsrs r2, r2, #4
	ldr r3, [r5, #0x2c]
	adds r0, r4, #0
	bl sub_809D300
	ldr r0, _0809E930  @ sub_809E2BC
	movs r1, #1
	adds r2, r5, #0
	bl sub_80ACE20
	movs r0, #4
	bl BG_EnableSyncByMask
	ldr r0, [r5, #0x2c]
	bl GetUnitItemCount
	adds r4, r0, #0
	ldr r1, _0809E934  @ gActionData
	movs r0, #0x1c
	strb r0, [r1, #0x11]
	cmp r4, #0
	beq _0809E906
	bl sub_8097CC8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x64
	bne _0809E93C
_0809E906:
	adds r0, r5, #0
	movs r1, #1
	bl Proc_Goto
	ldr r0, _0809E938  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809E96A
	movs r0, #0x6b
	bl m4aSongNumStart
	b _0809E96A
	.align 2, 0
_0809E924: .4byte gUnknown_02022EEC
_0809E928: .4byte gUnknown_02013670
_0809E92C: .4byte gUnknown_02023CC6
_0809E930: .4byte sub_809E2BC
_0809E934: .4byte gActionData
_0809E938: .4byte gRAMChapterData
_0809E93C:
	ldr r0, _0809E970  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809E94E
	movs r0, #0x6a
	bl m4aSongNumStart
_0809E94E:
	ldrb r0, [r7]
	cmp r4, r0
	bgt _0809E96A
	subs r0, r4, #1
	strb r0, [r7]
	ldrb r1, [r7]
	lsls r1, r1, #4
	adds r1, #0x48
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x10
	movs r2, #0xb
	bl sub_80AD51C
_0809E96A:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809E970: .4byte gRAMChapterData

	THUMB_FUNC_END sub_809E85C

	THUMB_FUNC_START sub_809E974
sub_809E974: @ 0x0809E974
	push {r4, r5, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x38]
	cmp r0, #1
	bne _0809E99C
	ldr r0, _0809E998  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0x81
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0809EA34
	bl CloseHelpBox
	movs r0, #0
	strh r0, [r4, #0x38]
	b _0809EA76
	.align 2, 0
_0809E998: .4byte gKeyStatusPtr
_0809E99C:
	ldr r0, _0809E9D0  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0809E9D4
	ldr r0, [r4, #0x2c]
	adds r1, r4, #0
	adds r1, #0x31
	ldrb r3, [r1]
	lsls r1, r3, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r2, [r0]
	cmp r2, #0
	beq _0809EA76
	lsls r1, r3, #4
	adds r1, #0x48
	movs r0, #0x10
	bl StartItemHelpBox
	movs r0, #1
	strh r0, [r4, #0x38]
	b _0809EA76
	.align 2, 0
_0809E9D0: .4byte gKeyStatusPtr
_0809E9D4:
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0809EA0C
	ldr r0, [r4, #0x2c]
	adds r1, r4, #0
	adds r1, #0x31
	ldrb r1, [r1]
	bl sub_8097F98
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0809EA04
	movs r1, #1
	negs r1, r1
	ldr r2, _0809EA00  @ 0x0000088B
	adds r0, r1, #0
	adds r3, r4, #0
	bl sub_8097DA8
	b _0809EA76
	.align 2, 0
_0809EA00: .4byte 0x0000088B
_0809EA04:
	adds r0, r4, #0
	bl sub_809E85C
	b _0809EA76
_0809EA0C:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0809EA34
	adds r0, r4, #0
	movs r1, #1
	bl Proc_Goto
	ldr r0, _0809EA30  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809EA76
	movs r0, #0x6b
	bl m4aSongNumStart
	b _0809EA76
	.align 2, 0
_0809EA30: .4byte gRAMChapterData
_0809EA34:
	adds r0, r4, #0
	bl sub_809E7A8
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809EA76
	adds r5, r4, #0
	adds r5, #0x31
	ldrb r1, [r5]
	lsls r1, r1, #4
	adds r1, #0x48
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x10
	movs r2, #0xb
	bl sub_80AD51C
	ldrh r0, [r4, #0x38]
	cmp r0, #1
	bne _0809EA76
	ldr r0, [r4, #0x2c]
	ldrb r3, [r5]
	lsls r1, r3, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r2, [r0]
	cmp r2, #0
	beq _0809EA76
	lsls r1, r3, #4
	adds r1, #0x48
	movs r0, #0x10
	bl StartItemHelpBox
_0809EA76:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_809E974

	THUMB_FUNC_START sub_809EA7C
sub_809EA7C: @ 0x0809EA7C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0809EAA0  @ gGMData
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0809EAA4
	bl sub_80C4048
	cmp r0, #0
	beq _0809EABE
	adds r1, r4, #0
	adds r1, #0x35
	ldrb r1, [r1]
	adds r0, #0x2b
	b _0809EABC
	.align 2, 0
_0809EAA0: .4byte gGMData
_0809EAA4:
	adds r0, r4, #0
	adds r0, #0x30
	ldrb r0, [r0]
	cmp r0, #0
	bne _0809EABE
	ldr r0, _0809EAD4  @ ProcScr_AtMenu
	bl Proc_Find
	adds r1, r4, #0
	adds r1, #0x35
	ldrb r1, [r1]
	adds r0, #0x32
_0809EABC:
	strb r1, [r0]
_0809EABE:
	adds r0, r4, #0
	bl EndAllProcChildren
	bl EndBG3Slider_
	movs r0, #0
	bl SetPrimaryHBlankHandler
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809EAD4: .4byte ProcScr_AtMenu

	THUMB_FUNC_END sub_809EA7C

	THUMB_FUNC_START sub_809EAD8
sub_809EAD8: @ 0x0809EAD8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0809EAF0  @ gUnknown_08A1920C
	bl Proc_StartBlocking
	str r4, [r0, #0x2c]
	adds r0, #0x30
	movs r1, #0
	strb r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809EAF0: .4byte gUnknown_08A1920C

	THUMB_FUNC_END sub_809EAD8

	THUMB_FUNC_START sub_809EAF4
sub_809EAF4: @ 0x0809EAF4
	push {r4, lr}
	ldr r4, _0809EB10  @ gActiveUnit
	ldr r0, [r4]
	cmp r0, #0
	beq _0809EB08
	bl MU_EndAll
	ldr r0, [r4]
	bl ShowUnitSMS
_0809EB08:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809EB10: .4byte gActiveUnit

	THUMB_FUNC_END sub_809EAF4

	THUMB_FUNC_START sub_809EB14
sub_809EB14: @ 0x0809EB14
	push {r4, lr}
	ldr r4, _0809EB34  @ gActiveUnit
	ldr r0, [r4]
	cmp r0, #0
	beq _0809EB2C
	bl HideUnitSMS
	ldr r0, [r4]
	bl MU_Create
	bl MU_SetDefaultFacing_Auto
_0809EB2C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809EB34: .4byte gActiveUnit

	THUMB_FUNC_END sub_809EB14

	THUMB_FUNC_START sub_809EB38
sub_809EB38: @ 0x0809EB38
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0809EB54  @ gUnknown_08A192EC
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x2c]
	adds r0, #0x30
	movs r1, #1
	strb r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809EB54: .4byte gUnknown_08A192EC

	THUMB_FUNC_END sub_809EB38

	THUMB_FUNC_START MaybeStartSelectConvoyItemProc
MaybeStartSelectConvoyItemProc: @ 0x0809EB58
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0809EB74  @ gUnknown_08A192EC
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x2c]
	adds r0, #0x30
	movs r1, #2
	strb r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809EB74: .4byte gUnknown_08A192EC

	THUMB_FUNC_END MaybeStartSelectConvoyItemProc

	THUMB_FUNC_START sub_809EB78
sub_809EB78: @ 0x0809EB78
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0809EBA4  @ ProcScr_AtMenu
	bl Proc_Find
	adds r2, r0, #0
	movs r0, #0
	strh r0, [r4, #0x36]
	movs r0, #0xff
	strh r0, [r4, #0x34]
	ldr r0, _0809EBA8  @ gGMData
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0809EBB4
	bl sub_80C4048
	cmp r0, #0
	beq _0809EBAC
	adds r0, #0x2a
	b _0809EBB8
	.align 2, 0
_0809EBA4: .4byte ProcScr_AtMenu
_0809EBA8: .4byte gGMData
_0809EBAC:
	adds r1, r4, #0
	adds r1, #0x33
	movs r0, #0
	b _0809EBBE
_0809EBB4:
	adds r0, r2, #0
	adds r0, #0x31
_0809EBB8:
	ldrb r0, [r0]
	adds r1, r4, #0
	adds r1, #0x33
_0809EBBE:
	strb r0, [r1]
	adds r2, r4, #0
	adds r2, #0x31
	movs r0, #0
	movs r1, #4
	strb r1, [r2]
	adds r1, r4, #0
	adds r1, #0x30
	strb r0, [r1]
	movs r3, #0
	adds r1, #0x1a
	adds r0, r4, #0
	adds r0, #0x38
	movs r2, #8
_0809EBDA:
	strh r3, [r0]
	strh r3, [r1]
	adds r1, #2
	adds r0, #2
	subs r2, #1
	cmp r2, #0
	bge _0809EBDA
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_809EB78

	THUMB_FUNC_START sub_809EBF0
sub_809EBF0: @ 0x0809EBF0
	push {r4, lr}
	sub sp, #8
	ldr r4, _0809EC2C  @ gUnknown_02022D10
	adds r0, r4, #0
	movs r1, #0xc
	movs r2, #1
	movs r3, #0
	bl TileMap_FillRect
	ldr r0, _0809EC30  @ 0x000005A9
	bl GetStringFromIndex
	ldr r2, _0809EC34  @ gUnknown_020136D8
	movs r1, #0
	str r1, [sp]
	str r0, [sp, #4]
	adds r0, r2, #0
	adds r1, r4, #0
	movs r2, #0
	movs r3, #0
	bl DrawTextInline
	movs r0, #1
	bl BG_EnableSyncByMask
	add sp, #8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809EC2C: .4byte gUnknown_02022D10
_0809EC30: .4byte 0x000005A9
_0809EC34: .4byte gUnknown_020136D8

	THUMB_FUNC_END sub_809EBF0

	THUMB_FUNC_START sub_809EC38
sub_809EC38: @ 0x0809EC38
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	adds r6, r0, #0
	adds r6, #0x33
	ldrb r1, [r6]
	lsls r1, r1, #1
	adds r5, r0, #0
	adds r5, #0x38
	adds r1, r5, r1
	ldrh r4, [r1]
	ldr r0, _0809EC84  @ gUnknown_02022D18
	mov r8, r0
	movs r1, #0xa
	movs r2, #1
	movs r3, #0
	bl TileMap_FillRect
	ldr r7, _0809EC88  @ gUnknown_02013668
	adds r0, r7, #0
	bl Text_Clear
	ldr r0, _0809EC8C  @ gUnknown_02012F56
	ldrh r0, [r0]
	cmp r0, r4
	bgt _0809EC94
	ldr r0, _0809EC90  @ 0x00000536
	bl GetStringFromIndex
	movs r1, #0
	str r1, [sp]
	str r0, [sp, #4]
	adds r0, r7, #0
	mov r1, r8
	movs r2, #1
	b _0809ECBA
	.align 2, 0
_0809EC84: .4byte gUnknown_02022D18
_0809EC88: .4byte gUnknown_02013668
_0809EC8C: .4byte gUnknown_02012F56
_0809EC90: .4byte 0x00000536
_0809EC94:
	ldr r0, _0809ECC4  @ gUnknown_020122D4
	ldrb r1, [r6]
	lsls r1, r1, #1
	adds r1, r5, r1
	ldrh r1, [r1]
	lsls r1, r1, #2
	adds r1, r1, r0
	ldrb r4, [r1]
	cmp r4, #0
	bne _0809ECC8
	movs r0, #0xb3
	lsls r0, r0, #3
	bl GetStringFromIndex
	str r4, [sp]
	str r0, [sp, #4]
	adds r0, r7, #0
	mov r1, r8
	movs r2, #3
_0809ECBA:
	movs r3, #0
	bl DrawTextInline
	b _0809ECE8
	.align 2, 0
_0809ECC4: .4byte gUnknown_020122D4
_0809ECC8:
	adds r0, r4, #0
	bl GetUnitFromCharId
	ldr r0, [r0]
	ldrh r0, [r0]
	bl GetStringFromIndex
	movs r1, #0
	str r1, [sp]
	str r0, [sp, #4]
	adds r0, r7, #0
	mov r1, r8
	movs r2, #0
	movs r3, #0
	bl DrawTextInline
_0809ECE8:
	movs r0, #1
	bl BG_EnableSyncByMask
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_809EC38

	THUMB_FUNC_START sub_809ECFC
sub_809ECFC: @ 0x0809ECFC
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r6, r0, #0
	adds r7, r6, #0
	adds r7, #0x33
	ldrb r0, [r7]
	lsls r4, r0, #1
	adds r4, r4, r0
	lsls r4, r4, #2
	adds r4, #0x7c
	bl GetGameClock
	ldr r2, _0809ED74  @ gPaletteBuffer
	lsrs r0, r0, #2
	movs r1, #0xf
	ands r0, r1
	lsls r0, r0, #1
	ldr r1, _0809ED78  @ gUnknown_08A1BD60
	adds r0, r0, r1
	ldrh r0, [r0]
	ldr r1, _0809ED7C  @ 0x0000029A
	adds r2, r2, r1
	strh r0, [r2]
	bl EnablePaletteSync
	ldr r1, _0809ED80  @ gUnknown_08A19608
	ldrb r0, [r7]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r3, [r0]
	movs r5, #0x85
	lsls r5, r5, #7
	str r5, [sp]
	movs r0, #4
	adds r1, r4, #0
	movs r2, #0x18
	bl PutSprite
	ldr r3, _0809ED84  @ gUnknown_08A195F8
	str r5, [sp]
	movs r0, #4
	adds r1, r4, #0
	movs r2, #0x18
	bl PutSprite
	ldrb r0, [r7]
	lsls r0, r0, #1
	adds r6, #0x4a
	adds r6, r6, r0
	ldrh r1, [r6]
	ldr r0, _0809ED88  @ gUnknown_02012F56
	ldrh r2, [r0]
	movs r0, #0xc
	movs r3, #7
	bl sub_80976CC
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809ED74: .4byte gPaletteBuffer
_0809ED78: .4byte gUnknown_08A1BD60
_0809ED7C: .4byte 0x0000029A
_0809ED80: .4byte gUnknown_08A19608
_0809ED84: .4byte gUnknown_08A195F8
_0809ED88: .4byte gUnknown_02012F56

	THUMB_FUNC_END sub_809ECFC

	THUMB_FUNC_START sub_809ED8C
sub_809ED8C: @ 0x0809ED8C
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	sub sp, #8
	adds r7, r0, #0
	ldr r0, _0809F0C0  @ gLCDControlBuffer
	mov r8, r0
	ldrb r1, [r0]
	movs r0, #8
	negs r0, r0
	ands r0, r1
	mov r1, r8
	strb r0, [r1]
	movs r0, #0
	bl SetupBackgrounds
	movs r0, #0
	bl BG_GetMapBuffer
	movs r1, #0
	bl BG_Fill
	movs r0, #1
	bl BG_GetMapBuffer
	movs r1, #0
	bl BG_Fill
	movs r0, #2
	bl BG_GetMapBuffer
	movs r1, #0
	bl BG_Fill
	mov r0, r8
	ldrb r2, [r0, #0xc]
	movs r1, #4
	negs r1, r1
	adds r0, r1, #0
	ands r0, r2
	movs r2, #1
	mov r9, r2
	mov r2, r9
	orrs r0, r2
	mov r2, r8
	strb r0, [r2, #0xc]
	ldrb r2, [r2, #0x10]
	adds r0, r1, #0
	ands r0, r2
	movs r5, #2
	orrs r0, r5
	mov r2, r8
	strb r0, [r2, #0x10]
	ldrb r0, [r2, #0x14]
	ands r1, r0
	strb r1, [r2, #0x14]
	ldrb r0, [r2, #0x18]
	movs r1, #3
	orrs r0, r1
	strb r0, [r2, #0x18]
	bl ResetFaces
	bl Font_InitForUIDefault
	bl ResetIconGraphics_
	bl LoadUiFrameGraphics
	bl LoadObjUIGfx
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	adds r0, r7, #0
	adds r0, #0x33
	ldrb r1, [r0]
	lsls r1, r1, #1
	adds r0, #0x17
	adds r0, r0, r1
	ldrh r2, [r0]
	subs r2, #0x28
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #2
	movs r1, #0
	bl BG_SetPosition
	ldr r0, _0809F0C4  @ 0x06012000
	movs r1, #1
	negs r1, r1
	bl LoadDialogueBoxGfx
	movs r0, #4
	bl LoadIconPalettes
	bl EndSlidingWallEffectMaybe
	movs r0, #0xa0
	lsls r0, r0, #7
	movs r1, #5
	bl sub_8098C3C
	ldr r0, _0809F0C8  @ gUnknown_08A1B9EC
	ldr r4, _0809F0CC  @ gGenericBuffer
	adds r1, r4, #0
	bl CopyDataWithPossibleUncomp
	ldr r0, _0809F0D0  @ gBG1TilemapBuffer
	movs r2, #0x80
	lsls r2, r2, #5
	adds r1, r4, #0
	bl CallARM_FillTileRect
	movs r0, #7
	bl BG_EnableSyncByMask
	adds r0, r7, #0
	bl sub_80AC9C0
	adds r0, r7, #0
	bl ResetPrepScreenHandCursor
	movs r0, #0xc0
	lsls r0, r0, #3
	movs r1, #1
	bl sub_80AD4A0
	mov r1, r8
	ldrb r0, [r1, #1]
	movs r1, #0x20
	orrs r0, r1
	movs r1, #0x41
	negs r1, r1
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	mov r2, r8
	strb r0, [r2, #1]
	mov r1, r8
	adds r1, #0x2d
	movs r0, #0x80
	strb r0, [r1]
	adds r1, #4
	movs r0, #0x28
	strb r0, [r1]
	subs r1, #5
	movs r0, #0xe0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0x98
	strb r0, [r1]
	adds r2, #0x34
	ldrb r0, [r2]
	mov r1, r9
	orrs r0, r1
	orrs r0, r5
	movs r1, #4
	orrs r0, r1
	movs r4, #8
	orrs r0, r4
	movs r3, #0x10
	orrs r0, r3
	strb r0, [r2]
	adds r2, #2
	ldrb r0, [r2]
	mov r1, r9
	orrs r0, r1
	orrs r0, r5
	movs r1, #5
	negs r1, r1
	ands r0, r1
	orrs r0, r4
	orrs r0, r3
	strb r0, [r2]
	adds r0, r7, #0
	bl NewGreenTextColorManager
	movs r0, #0xc3
	movs r1, #0x93
	movs r2, #9
	adds r3, r7, #0
	bl StartHelpPromptSprite
	ldr r4, _0809F0D4  @ gUnknown_02013660
	adds r0, r4, #0
	movs r1, #6
	bl Text_Init
	adds r0, r4, #0
	adds r0, #8
	movs r1, #5
	bl Text_Init
	adds r0, r4, #0
	adds r0, #0x78
	movs r1, #4
	bl Text_Init
	adds r4, #0x10
	movs r5, #4
_0809EF2C:
	adds r0, r4, #0
	movs r1, #7
	bl Text_Init
	adds r4, #8
	subs r5, #1
	cmp r5, #0
	bge _0809EF2C
	movs r2, #0x33
	adds r2, r2, r7
	mov r8, r2
	adds r6, r7, #0
	adds r6, #0x4a
	ldr r4, _0809F0D8  @ gUnknown_02013698
	movs r5, #7
_0809EF4A:
	adds r0, r4, #0
	movs r1, #7
	bl Text_Allocate
	adds r4, #8
	subs r5, #1
	cmp r5, #0
	bge _0809EF4A
	movs r4, #0x80
	lsls r4, r4, #7
	adds r0, r4, #0
	movs r1, #6
	bl StoreConvoyWeaponIconGraphics
	ldr r0, _0809F0DC  @ gUnknown_02022D86
	mov r9, r0
	adds r1, r4, #0
	movs r2, #6
	bl sub_809D8D4
	ldr r0, _0809F0E0  @ gUnknown_08A19CCC
	ldr r1, _0809F0E4  @ 0x06015000
	bl CopyDataWithPossibleUncomp
	ldr r0, _0809F0E8  @ gUnknown_08A1A084
	movs r4, #0xa0
	lsls r4, r4, #2
	adds r1, r4, #0
	movs r2, #0x20
	bl CopyToPaletteBuffer
	movs r3, #0xb0
	lsls r3, r3, #7
	movs r0, #9
	str r0, [sp]
	adds r0, r7, #0
	movs r1, #0xe1
	movs r2, #0x2f
	bl sub_8097748
	bl sub_8097668
	ldr r0, [r7, #0x2c]
	mov r2, r8
	ldrb r1, [r2]
	movs r2, #3
	bl SomethingPrepListRelated
	adds r0, r7, #0
	bl sub_809F5F4
	ldr r5, _0809F0D8  @ gUnknown_02013698
	ldr r1, _0809F0EC  @ gUnknown_02023CC6
	mov r2, r8
	ldrb r0, [r2]
	lsls r0, r0, #1
	adds r0, r6, r0
	ldrh r2, [r0]
	lsrs r2, r2, #4
	ldr r3, [r7, #0x2c]
	adds r0, r5, #0
	bl sub_809D300
	movs r0, #4
	bl BG_EnableSyncByMask
	movs r0, #0xb3
	lsls r0, r0, #1
	add r0, r9
	adds r1, r5, #0
	subs r1, #0x28
	ldr r2, [r7, #0x2c]
	movs r3, #0
	bl sub_809B74C
	bl sub_809EBF0
	adds r0, r7, #0
	bl sub_80ACCE0
	movs r0, #0
	adds r1, r4, #0
	movs r2, #2
	bl sub_80ACCF4
	movs r0, #0x78
	movs r1, #0x18
	movs r2, #0xe9
	movs r3, #0x18
	bl sub_80ACD7C
	movs r0, #3
	bl sub_80ACD60
	ldr r0, _0809F0F0  @ sub_809ECFC
	adds r1, r7, #0
	bl StartParallelWorker
	ldr r0, [r7, #0x2c]
	bl GetUnitPortraitId
	adds r1, r0, #0
	movs r3, #4
	negs r3, r3
	ldr r0, _0809F0F4  @ 0x00000203
	str r0, [sp]
	movs r0, #0
	movs r2, #0x40
	bl StartFace2
	ldr r0, [r7, #0x2c]
	ldr r0, [r0]
	ldrh r0, [r0]
	bl GetStringFromIndex
	mov r8, r0
	movs r1, #0xe0
	lsls r1, r1, #4
	movs r3, #0xc0
	lsls r3, r3, #4
	movs r0, #0x80
	lsls r0, r0, #3
	str r0, [sp]
	str r7, [sp, #4]
	movs r0, #0xd
	movs r2, #0xf
	bl StartSmallBrownNameBoxes
	movs r1, #0x28
	negs r1, r1
	movs r2, #1
	negs r2, r2
	movs r0, #0
	movs r3, #1
	bl sub_80ADBFC
	movs r0, #1
	movs r1, #0x98
	movs r2, #6
	movs r3, #2
	bl sub_80ADBFC
	movs r0, #1
	movs r1, #0xe
	movs r2, #4
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	movs r4, #0
	str r4, [sp]
	movs r0, #0
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
	movs r0, #0x30
	mov r1, r8
	bl GetStringTextCenteredPos
	adds r3, r0, #0
	subs r5, #0x38
	str r4, [sp]
	mov r0, r8
	str r0, [sp, #4]
	adds r0, r5, #0
	ldr r1, _0809F0F8  @ gBG0TilemapBuffer
	movs r2, #0
	bl DrawTextInline
	adds r0, r7, #0
	bl sub_809EC38
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809F0C0: .4byte gLCDControlBuffer
_0809F0C4: .4byte 0x06012000
_0809F0C8: .4byte gUnknown_08A1B9EC
_0809F0CC: .4byte gGenericBuffer
_0809F0D0: .4byte gBG1TilemapBuffer
_0809F0D4: .4byte gUnknown_02013660
_0809F0D8: .4byte gUnknown_02013698
_0809F0DC: .4byte gUnknown_02022D86
_0809F0E0: .4byte gUnknown_08A19CCC
_0809F0E4: .4byte 0x06015000
_0809F0E8: .4byte gUnknown_08A1A084
_0809F0EC: .4byte gUnknown_02023CC6
_0809F0F0: .4byte sub_809ECFC
_0809F0F4: .4byte 0x00000203
_0809F0F8: .4byte gBG0TilemapBuffer

	THUMB_FUNC_END sub_809ED8C

	THUMB_FUNC_START sub_809F0FC
sub_809F0FC: @ 0x0809F0FC
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0809F120  @ gGMData
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0809F124
	bl sub_80C4048
	cmp r0, #0
	beq _0809F134
	adds r1, r4, #0
	adds r1, #0x33
	ldrb r1, [r1]
	adds r0, #0x2a
	b _0809F132
	.align 2, 0
_0809F120: .4byte gGMData
_0809F124:
	ldr r0, _0809F14C  @ ProcScr_AtMenu
	bl Proc_Find
	adds r1, r4, #0
	adds r1, #0x33
	ldrb r1, [r1]
	adds r0, #0x31
_0809F132:
	strb r1, [r0]
_0809F134:
	adds r0, r4, #0
	bl EndAllProcChildren
	movs r0, #0
	bl EndFaceById
	bl EndBG3Slider_
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809F14C: .4byte ProcScr_AtMenu

	THUMB_FUNC_END sub_809F0FC

	THUMB_FUNC_START sub_809F150
sub_809F150: @ 0x0809F150
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	bl ResetIconGraphics_
	ldr r0, [r4, #0x2c]
	adds r5, r4, #0
	adds r5, #0x33
	ldrb r1, [r5]
	movs r2, #3
	bl SomethingPrepListRelated
	adds r0, r4, #0
	bl sub_809F370
	ldr r0, _0809F1F0  @ gUnknown_02013698
	ldr r1, _0809F1F4  @ gUnknown_02023CC6
	ldrb r2, [r5]
	lsls r2, r2, #1
	adds r6, r4, #0
	adds r6, #0x4a
	adds r2, r6, r2
	ldrh r2, [r2]
	lsrs r2, r2, #4
	ldr r3, [r4, #0x2c]
	bl sub_809D300
	ldr r0, _0809F1F8  @ gUnknown_02022EEC
	ldr r1, [r4, #0x2c]
	bl sub_809B830
	ldrb r0, [r5]
	lsls r0, r0, #1
	adds r7, r4, #0
	adds r7, #0x38
	adds r1, r7, r0
	ldrh r1, [r1]
	lsls r1, r1, #4
	adds r0, r6, r0
	ldrh r0, [r0]
	subs r0, #0x28
	subs r1, r1, r0
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x80
	movs r2, #0xb
	bl sub_80AD51C
	movs r0, #5
	bl BG_EnableSyncByMask
	ldr r0, _0809F1FC  @ sub_809EC38
	movs r1, #2
	adds r2, r4, #0
	bl sub_80ACE20
	ldrh r0, [r4, #0x36]
	cmp r0, #0
	beq _0809F210
	ldr r0, _0809F200  @ gUnknown_02012F56
	ldrh r0, [r0]
	cmp r0, #0
	beq _0809F208
	ldr r2, _0809F204  @ gUnknown_020122D4
	ldrb r3, [r5]
	lsls r3, r3, #1
	adds r0, r7, r3
	ldrh r1, [r0]
	lsls r0, r1, #2
	adds r0, r0, r2
	ldrh r2, [r0, #2]
	lsls r1, r1, #4
	adds r3, r6, r3
	ldrh r0, [r3]
	subs r0, #0x28
	subs r1, r1, r0
	movs r0, #0x80
	bl StartItemHelpBox
	movs r0, #1
	b _0809F20E
	.align 2, 0
_0809F1F0: .4byte gUnknown_02013698
_0809F1F4: .4byte gUnknown_02023CC6
_0809F1F8: .4byte gUnknown_02022EEC
_0809F1FC: .4byte sub_809EC38
_0809F200: .4byte gUnknown_02012F56
_0809F204: .4byte gUnknown_020122D4
_0809F208:
	bl CloseHelpBox
	movs r0, #0xff
_0809F20E:
	strh r0, [r4, #0x36]
_0809F210:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_809F150

	THUMB_FUNC_START sub_809F218
sub_809F218: @ 0x0809F218
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r7, r0, #0
	movs r0, #4
	mov r8, r0
	adds r1, r7, #0
	adds r1, #0x32
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldrb r4, [r1]
	cmp r4, #4
	bge _0809F24A
	mov r2, r8
	subs r1, r2, r4
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #5
	muls r0, r1, r0
	movs r1, #0x10
	bl __divsi3
	adds r6, r0, #0
	subs r6, #0x60
_0809F24A:
	adds r5, r7, #0
	adds r5, #0x33
	cmp r4, #4
	bne _0809F266
	ldrb r0, [r5]
	cmp r0, #0
	bne _0809F25C
	movs r0, #8
	b _0809F25E
_0809F25C:
	subs r0, #1
_0809F25E:
	strb r0, [r5]
	adds r0, r7, #0
	bl sub_809F150
_0809F266:
	adds r4, r7, #0
	adds r4, #0x32
	ldrb r1, [r4]
	cmp r1, r8
	blt _0809F28A
	mov r0, r8
	subs r1, r1, r0
	subs r1, r0, r1
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #5
	muls r0, r1, r0
	mov r2, r8
	mov r1, r8
	muls r1, r2, r1
	bl __divsi3
	adds r6, r0, #0
_0809F28A:
	movs r0, #0xff
	ands r6, r0
	ldrb r1, [r5]
	lsls r1, r1, #1
	adds r0, r7, #0
	adds r0, #0x4a
	adds r0, r0, r1
	ldrh r2, [r0]
	subs r2, #0x28
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #2
	adds r1, r6, #0
	bl BG_SetPosition
	ldrb r1, [r4]
	mov r2, r8
	lsls r0, r2, #1
	cmp r1, r0
	bne _0809F2BA
	adds r0, r7, #0
	movs r1, #1
	bl Proc_Goto
_0809F2BA:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_809F218

	THUMB_FUNC_START sub_809F2C4
sub_809F2C4: @ 0x0809F2C4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r7, r0, #0
	movs r0, #4
	mov r8, r0
	adds r1, r7, #0
	adds r1, #0x32
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldrb r4, [r1]
	cmp r4, #4
	bge _0809F2F6
	mov r2, r8
	subs r1, r2, r4
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #5
	muls r0, r1, r0
	movs r1, #0x10
	bl __divsi3
	movs r1, #0x60
	subs r6, r1, r0
_0809F2F6:
	adds r5, r7, #0
	adds r5, #0x33
	cmp r4, #4
	bne _0809F312
	ldrb r0, [r5]
	cmp r0, #8
	bne _0809F308
	movs r0, #0
	b _0809F30A
_0809F308:
	adds r0, #1
_0809F30A:
	strb r0, [r5]
	adds r0, r7, #0
	bl sub_809F150
_0809F312:
	adds r4, r7, #0
	adds r4, #0x32
	ldrb r1, [r4]
	cmp r1, r8
	blt _0809F336
	mov r0, r8
	subs r1, r1, r0
	subs r1, r0, r1
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #5
	muls r0, r1, r0
	mov r2, r8
	mov r1, r8
	muls r1, r2, r1
	bl __divsi3
	negs r6, r0
_0809F336:
	movs r0, #0xff
	ands r6, r0
	ldrb r1, [r5]
	lsls r1, r1, #1
	adds r0, r7, #0
	adds r0, #0x4a
	adds r0, r0, r1
	ldrh r2, [r0]
	subs r2, #0x28
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #2
	adds r1, r6, #0
	bl BG_SetPosition
	ldrb r1, [r4]
	mov r2, r8
	lsls r0, r2, #1
	cmp r1, r0
	bne _0809F366
	adds r0, r7, #0
	movs r1, #1
	bl Proc_Goto
_0809F366:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_809F2C4

	THUMB_FUNC_START sub_809F370
sub_809F370: @ 0x0809F370
	push {r4, r5, lr}
	mov ip, r0
	ldr r0, _0809F398  @ gUnknown_02012F56
	ldrh r4, [r0]
	adds r5, r0, #0
	cmp r4, #0
	bne _0809F39C
	mov r3, ip
	adds r3, #0x33
	ldrb r0, [r3]
	lsls r0, r0, #1
	mov r1, ip
	adds r1, #0x38
	adds r1, r1, r0
	mov r2, ip
	adds r2, #0x4a
	adds r0, r2, r0
	strh r4, [r0]
	strh r4, [r1]
	b _0809F3BA
	.align 2, 0
_0809F398: .4byte gUnknown_02012F56
_0809F39C:
	mov r2, ip
	adds r2, #0x33
	ldrb r0, [r2]
	lsls r0, r0, #1
	mov r1, ip
	adds r1, #0x38
	adds r4, r1, r0
	ldrh r1, [r4]
	ldrh r0, [r5]
	subs r0, #1
	adds r3, r2, #0
	adds r2, #0x17
	cmp r1, r0
	ble _0809F3BA
	strh r0, [r4]
_0809F3BA:
	ldrh r0, [r5]
	cmp r0, #6
	bls _0809F3D8
	ldrb r0, [r3]
	lsls r0, r0, #1
	adds r4, r2, r0
	ldrh r0, [r4]
	lsrs r0, r0, #4
	adds r0, #7
	ldrh r1, [r5]
	cmp r0, r1
	ble _0809F3D8
	subs r0, r1, #7
	lsls r0, r0, #4
	strh r0, [r4]
_0809F3D8:
	ldrb r0, [r3]
	lsls r0, r0, #1
	adds r0, r2, r0
	ldrh r2, [r0]
	subs r2, #0x28
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #2
	movs r1, #0
	bl BG_SetPosition
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_809F370

	THUMB_FUNC_START sub_809F3F4
sub_809F3F4: @ 0x0809F3F4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	adds r7, r1, #0
	bl ResetIconGraphics_
	ldr r0, _0809F48C  @ gUnknown_02023CC6
	mov r8, r0
	adds r6, r4, #0
	adds r6, #0x33
	ldrb r0, [r6]
	lsls r0, r0, #1
	adds r5, r4, #0
	adds r5, #0x4a
	adds r0, r5, r0
	ldrh r1, [r0]
	lsrs r1, r1, #4
	mov r0, r8
	bl sub_809D418
	ldr r0, _0809F490  @ gUnknown_02022EEC
	ldr r1, [r4, #0x2c]
	bl sub_809B830
	movs r0, #5
	bl BG_EnableSyncByMask
	cmp r7, #0
	bge _0809F446
	ldr r0, _0809F494  @ gUnknown_02013698
	ldrb r1, [r6]
	lsls r1, r1, #1
	adds r1, r5, r1
	ldrh r2, [r1]
	lsrs r2, r2, #4
	subs r2, #1
	ldr r3, [r4, #0x2c]
	mov r1, r8
	bl sub_809D47C
_0809F446:
	cmp r7, #0
	ble _0809F460
	ldr r0, _0809F494  @ gUnknown_02013698
	ldrb r1, [r6]
	lsls r1, r1, #1
	adds r1, r5, r1
	ldrh r2, [r1]
	lsrs r2, r2, #4
	adds r2, #7
	ldr r3, [r4, #0x2c]
	mov r1, r8
	bl sub_809D47C
_0809F460:
	ldrb r1, [r6]
	lsls r1, r1, #1
	adds r1, r5, r1
	ldrh r0, [r1]
	adds r0, r0, r7
	strh r0, [r1]
	ldrb r0, [r6]
	lsls r0, r0, #1
	adds r0, r5, r0
	ldrh r2, [r0]
	subs r2, #0x28
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #2
	movs r1, #0
	bl BG_SetPosition
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809F48C: .4byte gUnknown_02023CC6
_0809F490: .4byte gUnknown_02022EEC
_0809F494: .4byte gUnknown_02013698

	THUMB_FUNC_END sub_809F3F4

	THUMB_FUNC_START sub_809F498
sub_809F498: @ 0x0809F498
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	adds r6, r0, #0
	ldr r0, [r6, #0x2c]
	bl GetUnitItemCount
	adds r2, r0, #0
	cmp r2, #5
	beq _0809F4B6
	ldr r0, _0809F4CC  @ gUnknown_02012F56
	ldrh r0, [r0]
	cmp r0, #0
	bne _0809F4D4
_0809F4B6:
	ldr r0, _0809F4D0  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	bge _0809F4C4
	b _0809F5E2
_0809F4C4:
	movs r0, #0x6c
	bl m4aSongNumStart
	b _0809F5E2
	.align 2, 0
_0809F4CC: .4byte gUnknown_02012F56
_0809F4D0: .4byte gRAMChapterData
_0809F4D4:
	movs r4, #0
	strh r4, [r6, #0x36]
	ldr r1, [r6, #0x2c]
	lsls r0, r2, #1
	adds r1, #0x1e
	adds r1, r1, r0
	ldr r0, _0809F5B8  @ gUnknown_020122D4
	mov r9, r0
	adds r7, r6, #0
	adds r7, #0x33
	ldrb r0, [r7]
	lsls r0, r0, #1
	adds r5, r6, #0
	adds r5, #0x38
	adds r0, r5, r0
	ldrh r0, [r0]
	lsls r0, r0, #2
	add r0, r9
	ldrh r0, [r0, #2]
	strh r0, [r1]
	ldr r0, [r6, #0x2c]
	bl UnitRemoveInvalidItems
	ldrb r0, [r7]
	lsls r0, r0, #1
	adds r0, r5, r0
	ldrh r0, [r0]
	lsls r0, r0, #2
	add r0, r9
	strh r4, [r0, #2]
	bl sub_80982B8
	ldr r0, [r6, #0x2c]
	ldrb r1, [r7]
	movs r2, #3
	bl SomethingPrepListRelated
	adds r0, r6, #0
	bl sub_809F370
	bl ResetIconGraphics_
	ldr r0, _0809F5BC  @ gUnknown_02022EEC
	ldr r4, _0809F5C0  @ gUnknown_02013670
	ldr r2, [r6, #0x2c]
	adds r1, r4, #0
	movs r3, #0
	bl sub_809B74C
	adds r4, #0x28
	ldr r1, _0809F5C4  @ gUnknown_02023CC6
	ldrb r0, [r7]
	lsls r0, r0, #1
	movs r2, #0x4a
	adds r2, r2, r6
	mov r8, r2
	add r0, r8
	ldrh r2, [r0]
	lsrs r2, r2, #4
	ldr r3, [r6, #0x2c]
	adds r0, r4, #0
	bl sub_809D300
	ldrb r0, [r7]
	lsls r0, r0, #1
	adds r0, r5, r0
	ldrh r0, [r0]
	lsls r0, r0, #2
	add r0, r9
	ldrb r0, [r0]
	cmp r0, #0
	beq _0809F56E
	ldr r0, _0809F5C8  @ sub_809EC38
	movs r1, #1
	adds r2, r6, #0
	bl sub_80ACE20
_0809F56E:
	ldrb r0, [r7]
	lsls r0, r0, #1
	adds r1, r5, r0
	ldrh r1, [r1]
	lsls r1, r1, #4
	add r0, r8
	ldrh r0, [r0]
	subs r0, #0x28
	subs r1, r1, r0
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x80
	movs r2, #0xb
	bl sub_80AD51C
	movs r0, #5
	bl BG_EnableSyncByMask
	ldr r0, [r6, #0x2c]
	bl GetUnitItemCount
	cmp r0, #5
	bne _0809F5D0
	adds r0, r6, #0
	movs r1, #1
	bl Proc_Goto
	ldr r0, _0809F5CC  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809F5E2
	movs r0, #0x6b
	bl m4aSongNumStart
	b _0809F5E2
	.align 2, 0
_0809F5B8: .4byte gUnknown_020122D4
_0809F5BC: .4byte gUnknown_02022EEC
_0809F5C0: .4byte gUnknown_02013670
_0809F5C4: .4byte gUnknown_02023CC6
_0809F5C8: .4byte sub_809EC38
_0809F5CC: .4byte gRAMChapterData
_0809F5D0:
	ldr r0, _0809F5F0  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809F5E2
	movs r0, #0x6a
	bl m4aSongNumStart
_0809F5E2:
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809F5F0: .4byte gRAMChapterData

	THUMB_FUNC_END sub_809F498

	THUMB_FUNC_START sub_809F5F4
sub_809F5F4: @ 0x0809F5F4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov ip, r0
	adds r0, #0x33
	ldrb r1, [r0]
	lsls r1, r1, #1
	adds r0, #5
	adds r4, r0, r1
	ldrh r3, [r4]
	lsls r2, r3, #4
	adds r0, #0x12
	adds r0, r0, r1
	ldrh r0, [r0]
	subs r0, #0x28
	subs r2, r2, r0
	cmp r2, #0x37
	bgt _0809F620
	cmp r3, #0
	beq _0809F620
	adds r0, r3, #1
	strh r0, [r4]
_0809F620:
	mov r4, ip
	adds r4, #0x33
	ldrb r0, [r4]
	lsls r0, r0, #1
	mov r3, ip
	adds r3, #0x38
	adds r6, r3, r0
	ldrh r5, [r6]
	lsls r1, r5, #4
	mov r2, ip
	adds r2, #0x4a
	adds r0, r2, r0
	ldrh r0, [r0]
	subs r0, #0x28
	subs r1, r1, r0
	adds r7, r3, #0
	mov r8, r2
	cmp r1, #0x78
	ble _0809F654
	ldr r0, _0809F684  @ gUnknown_02012F56
	ldrh r0, [r0]
	subs r0, #1
	cmp r5, r0
	beq _0809F654
	subs r0, r5, #1
	strh r0, [r6]
_0809F654:
	mov r0, ip
	bl sub_809F370
	ldrb r0, [r4]
	lsls r0, r0, #1
	adds r1, r7, r0
	ldrh r1, [r1]
	lsls r1, r1, #4
	add r0, r8
	ldrh r0, [r0]
	subs r0, #0x28
	subs r1, r1, r0
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x80
	movs r2, #0xb
	bl sub_80AD51C
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809F684: .4byte gUnknown_02012F56

	THUMB_FUNC_END sub_809F5F4

	THUMB_FUNC_START sub_809F688
sub_809F688: @ 0x0809F688
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	adds r4, r0, #0
	adds r6, r4, #0
	adds r6, #0x33
	ldrb r0, [r6]
	lsls r0, r0, #1
	movs r1, #0x38
	adds r1, r1, r4
	mov r8, r1
	adds r1, r1, r0
	ldrh r1, [r1]
	mov r9, r1
	adds r5, r4, #0
	adds r5, #0x4a
	adds r7, r5, r0
	ldrh r0, [r7]
	movs r2, #0xf
	mov sl, r2
	mov r1, sl
	ands r1, r0
	mov sl, r1
	cmp r1, #0
	beq _0809F6C0
	b _0809F908
_0809F6C0:
	ldrh r0, [r4, #0x36]
	cmp r0, #0
	beq _0809F6CC
	cmp r0, #0xff
	beq _0809F6CC
	b _0809F7C0
_0809F6CC:
	ldr r1, _0809F708  @ gKeyStatusPtr
	ldr r0, [r1]
	ldrh r3, [r0, #8]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r3
	mov r8, r1
	cmp r0, #0
	beq _0809F714
	ldr r0, _0809F70C  @ gUnknown_02012F56
	ldrh r0, [r0]
	cmp r0, #0
	beq _0809F724
	ldr r1, _0809F710  @ gUnknown_020122D4
	mov r2, r9
	lsls r0, r2, #2
	adds r0, r0, r1
	ldrh r2, [r0, #2]
	mov r0, r9
	lsls r1, r0, #4
	ldrh r0, [r7]
	subs r0, #0x28
	subs r1, r1, r0
	movs r0, #0x80
	bl StartItemHelpBox
	movs r0, #1
	strh r0, [r4, #0x36]
	b _0809FA7A
	.align 2, 0
_0809F708: .4byte gKeyStatusPtr
_0809F70C: .4byte gUnknown_02012F56
_0809F710: .4byte gUnknown_020122D4
_0809F714:
	movs r0, #1
	ands r0, r3
	cmp r0, #0
	beq _0809F794
	ldr r0, _0809F73C  @ gUnknown_02012F56
	ldrh r0, [r0]
	cmp r0, #0
	bne _0809F744
_0809F724:
	ldr r0, _0809F740  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	bge _0809F732
	b _0809FA7A
_0809F732:
	movs r0, #0x6c
	bl m4aSongNumStart
	b _0809FA7A
	.align 2, 0
_0809F73C: .4byte gUnknown_02012F56
_0809F740: .4byte gRAMChapterData
_0809F744:
	ldr r0, _0809F76C  @ gUnknown_020122D4
	mov r2, r9
	lsls r1, r2, #2
	adds r1, r1, r0
	ldrb r0, [r1]
	cmp r0, #0
	bne _0809F770
	lsls r2, r2, #4
	ldrh r0, [r7]
	subs r0, #0x28
	subs r2, r2, r0
	movs r0, #0
	movs r1, #0x80
	movs r3, #2
	bl sub_80AC9D4
	adds r0, r4, #0
	movs r1, #7
	b _0809F774
	.align 2, 0
_0809F76C: .4byte gUnknown_020122D4
_0809F770:
	adds r0, r4, #0
	movs r1, #6
_0809F774:
	bl Proc_Goto
	ldr r0, _0809F790  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	bge _0809F786
	b _0809FA7A
_0809F786:
	movs r0, #0x6a
	bl m4aSongNumStart
	b _0809FA7A
	.align 2, 0
_0809F790: .4byte gRAMChapterData
_0809F794:
	movs r0, #2
	ands r0, r3
	cmp r0, #0
	beq _0809F7E0
	adds r0, r4, #0
	movs r1, #8
	bl Proc_Goto
	ldr r0, _0809F7BC  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809F7B6
	movs r0, #0x6b
	bl m4aSongNumStart
_0809F7B6:
	mov r0, sl
	strh r0, [r4, #0x36]
	b _0809FA7A
	.align 2, 0
_0809F7BC: .4byte gRAMChapterData
_0809F7C0:
	ldr r2, _0809F7DC  @ gKeyStatusPtr
	ldr r0, [r2]
	ldrh r1, [r0, #8]
	movs r0, #0x81
	lsls r0, r0, #1
	ands r0, r1
	mov r8, r2
	cmp r0, #0
	beq _0809F7E0
	bl CloseHelpBox
	mov r1, sl
	strh r1, [r4, #0x36]
	b _0809FA7A
	.align 2, 0
_0809F7DC: .4byte gKeyStatusPtr
_0809F7E0:
	mov r0, r8
	ldr r2, [r0]
	ldrh r1, [r2, #6]
	movs r0, #0x20
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0
	beq _0809F828
	movs r0, #0
	bl sub_80ACDA4
	ldr r0, _0809F824  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809F80A
	movs r0, #0x67
	bl m4aSongNumStart
_0809F80A:
	adds r0, r4, #0
	movs r1, #3
	bl Proc_Goto
	adds r1, r4, #0
	adds r1, #0x32
	movs r0, #0
	strb r0, [r1]
	adds r0, r4, #0
	bl sub_809F218
	b _0809FA7A
	.align 2, 0
_0809F824: .4byte gRAMChapterData
_0809F828:
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _0809F864
	movs r0, #1
	bl sub_80ACDA4
	ldr r0, _0809F860  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809F848
	movs r0, #0x67
	bl m4aSongNumStart
_0809F848:
	adds r0, r4, #0
	movs r1, #4
	bl Proc_Goto
	adds r0, r4, #0
	adds r0, #0x32
	strb r5, [r0]
	adds r0, r4, #0
	bl sub_809F2C4
	b _0809FA7A
	.align 2, 0
_0809F860: .4byte gRAMChapterData
_0809F864:
	ldrh r1, [r2, #4]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0809F878
	adds r1, r4, #0
	adds r1, #0x31
	movs r0, #8
	b _0809F87E
_0809F878:
	adds r1, r4, #0
	adds r1, #0x31
	movs r0, #4
_0809F87E:
	strb r0, [r1]
	adds r7, r1, #0
	mov r1, r8
	ldr r2, [r1]
	ldrh r1, [r2, #6]
	movs r3, #0x40
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	bne _0809F8AC
	ldrh r1, [r2, #4]
	adds r0, r3, #0
	ands r0, r1
	adds r6, r4, #0
	adds r6, #0x33
	adds r5, r4, #0
	adds r5, #0x38
	cmp r0, #0
	beq _0809F8C8
	movs r0, #0
	ldrsb r0, [r7, r0]
	cmp r0, #8
	bne _0809F8C8
_0809F8AC:
	adds r0, r4, #0
	adds r0, #0x33
	ldrb r1, [r0]
	lsls r1, r1, #1
	adds r2, r4, #0
	adds r2, #0x38
	adds r3, r2, r1
	ldrh r1, [r3]
	adds r6, r0, #0
	adds r5, r2, #0
	cmp r1, #0
	beq _0809F8C8
	subs r0, r1, #1
	strh r0, [r3]
_0809F8C8:
	mov r0, r8
	ldr r2, [r0]
	ldrh r1, [r2, #6]
	movs r3, #0x80
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	bne _0809F8EA
	ldrh r1, [r2, #4]
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	beq _0809F966
	movs r0, #0
	ldrsb r0, [r7, r0]
	cmp r0, #8
	bne _0809F966
_0809F8EA:
	ldrb r0, [r6]
	lsls r0, r0, #1
	adds r2, r5, r0
	ldrh r1, [r2]
	ldr r0, _0809F904  @ gUnknown_02012F56
	ldrh r0, [r0]
	subs r0, #1
	cmp r1, r0
	bge _0809F966
	adds r0, r1, #1
	strh r0, [r2]
	b _0809F966
	.align 2, 0
_0809F904: .4byte gUnknown_02012F56
_0809F908:
	mov r1, r9
	lsls r0, r1, #4
	ldrh r2, [r7]
	adds r1, r2, #0
	subs r1, #0x28
	subs r0, r0, r1
	cmp r0, #0x37
	bgt _0809F926
	adds r0, r4, #0
	adds r0, #0x31
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r2, r0
	strh r0, [r7]
_0809F926:
	ldrb r0, [r6]
	lsls r0, r0, #1
	mov r2, r8
	adds r1, r2, r0
	ldrh r1, [r1]
	lsls r1, r1, #4
	adds r3, r5, r0
	ldrh r2, [r3]
	adds r0, r2, #0
	subs r0, #0x28
	subs r1, r1, r0
	cmp r1, #0x78
	ble _0809F94E
	adds r0, r4, #0
	adds r0, #0x31
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r0, r2, r0
	strh r0, [r3]
_0809F94E:
	ldrb r0, [r6]
	lsls r0, r0, #1
	adds r0, r5, r0
	ldrh r2, [r0]
	subs r2, #0x28
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #2
	movs r1, #0
	bl BG_SetPosition
	mov r5, r8
_0809F966:
	ldrb r0, [r6]
	lsls r0, r0, #1
	adds r0, r5, r0
	ldrh r0, [r0]
	cmp r9, r0
	bne _0809F974
	b _0809FA7A
_0809F974:
	ldr r7, _0809F9F0  @ gUnknown_020122D4
	lsls r0, r0, #2
	adds r0, r0, r7
	ldrh r0, [r0, #2]
	mov r8, r0
	ldr r0, _0809F9F4  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809F990
	movs r0, #0x66
	bl m4aSongNumStart
_0809F990:
	ldrb r0, [r6]
	lsls r0, r0, #1
	adds r0, r5, r0
	ldrh r1, [r0]
	lsls r1, r1, #2
	adds r1, r1, r7
	mov r2, r9
	lsls r0, r2, #2
	adds r0, r0, r7
	ldrb r1, [r1]
	ldrb r0, [r0]
	cmp r1, r0
	beq _0809F9B0
	adds r0, r4, #0
	bl sub_809EC38
_0809F9B0:
	ldrb r0, [r6]
	lsls r0, r0, #1
	adds r1, r5, r0
	ldrh r3, [r1]
	lsls r2, r3, #4
	adds r1, r4, #0
	adds r1, #0x4a
	adds r0, r1, r0
	ldrh r0, [r0]
	subs r0, #0x28
	subs r2, r2, r0
	adds r7, r1, #0
	cmp r2, #0x37
	bgt _0809F9F8
	cmp r3, #0
	beq _0809F9F8
	ldrh r0, [r4, #0x36]
	cmp r0, #0
	beq _0809F9E2
	adds r1, r2, #0
	adds r1, #0x10
	movs r0, #0x80
	mov r2, r8
	bl StartItemHelpBox
_0809F9E2:
	adds r0, r4, #0
	adds r0, #0x31
	movs r1, #0
	ldrsb r1, [r0, r1]
	negs r1, r1
	b _0809FA30
	.align 2, 0
_0809F9F0: .4byte gUnknown_020122D4
_0809F9F4: .4byte gRAMChapterData
_0809F9F8:
	ldrb r0, [r6]
	lsls r0, r0, #1
	adds r1, r5, r0
	ldrh r2, [r1]
	lsls r1, r2, #4
	adds r0, r7, r0
	ldrh r0, [r0]
	subs r0, #0x28
	subs r1, r1, r0
	cmp r1, #0x78
	ble _0809FA3C
	ldr r0, _0809FA38  @ gUnknown_02012F56
	ldrh r0, [r0]
	subs r0, #1
	cmp r2, r0
	beq _0809FA3C
	ldrh r0, [r4, #0x36]
	cmp r0, #0
	beq _0809FA28
	subs r1, #0x10
	movs r0, #0x80
	mov r2, r8
	bl StartItemHelpBox
_0809FA28:
	adds r0, r4, #0
	adds r0, #0x31
	movs r1, #0
	ldrsb r1, [r0, r1]
_0809FA30:
	adds r0, r4, #0
	bl sub_809F3F4
	b _0809FA7A
	.align 2, 0
_0809FA38: .4byte gUnknown_02012F56
_0809FA3C:
	ldrh r0, [r4, #0x36]
	cmp r0, #0
	beq _0809FA5C
	ldrb r0, [r6]
	lsls r0, r0, #1
	adds r1, r5, r0
	ldrh r1, [r1]
	lsls r1, r1, #4
	adds r0, r7, r0
	ldrh r0, [r0]
	subs r0, #0x28
	subs r1, r1, r0
	movs r0, #0x80
	mov r2, r8
	bl StartItemHelpBox
_0809FA5C:
	ldrb r0, [r6]
	lsls r0, r0, #1
	adds r1, r5, r0
	ldrh r1, [r1]
	lsls r1, r1, #4
	adds r0, r7, r0
	ldrh r0, [r0]
	subs r0, #0x28
	subs r1, r1, r0
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x80
	movs r2, #0xb
	bl sub_80AD51C
_0809FA7A:
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_809F688

	THUMB_FUNC_START sub_809FA88
sub_809FA88: @ 0x0809FA88
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x2c]
	bl GetUnitItemCount
	adds r1, r0, #0
	adds r0, r4, #0
	adds r0, #0x30
	ldrb r0, [r0]
	mov ip, r0
	adds r5, r1, #0
	cmp r5, #5
	bne _0809FAA6
	movs r5, #4
	b _0809FAAE
_0809FAA6:
	ldrh r0, [r4, #0x36]
	cmp r0, #0
	beq _0809FAAE
	subs r5, #1
_0809FAAE:
	cmp r1, #0
	beq _0809FB2C
	ldr r2, _0809FAD4  @ gKeyStatusPtr
	ldr r6, [r2]
	ldrh r1, [r6, #6]
	movs r7, #0x40
	adds r0, r7, #0
	ands r0, r1
	adds r3, r4, #0
	adds r3, #0x30
	cmp r0, #0
	beq _0809FAE4
	ldrb r0, [r3]
	cmp r0, #0
	beq _0809FAD8
	subs r0, #1
	strb r0, [r3]
	b _0809FAE4
	.align 2, 0
_0809FAD4: .4byte gKeyStatusPtr
_0809FAD8:
	ldrh r1, [r6, #8]
	adds r0, r7, #0
	ands r0, r1
	cmp r0, #0
	beq _0809FAE4
	strb r5, [r3]
_0809FAE4:
	ldr r2, [r2]
	ldrh r1, [r2, #6]
	movs r4, #0x80
	adds r0, r4, #0
	ands r0, r1
	cmp r0, #0
	beq _0809FB0A
	ldrb r0, [r3]
	cmp r0, r5
	bge _0809FAFC
	adds r0, #1
	b _0809FB08
_0809FAFC:
	ldrh r1, [r2, #8]
	adds r0, r4, #0
	ands r0, r1
	cmp r0, #0
	beq _0809FB0A
	movs r0, #0
_0809FB08:
	strb r0, [r3]
_0809FB0A:
	ldrb r3, [r3]
	cmp ip, r3
	beq _0809FB2C
	ldr r0, _0809FB28  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809FB22
	movs r0, #0x66
	bl m4aSongNumStart
_0809FB22:
	movs r0, #1
	b _0809FB2E
	.align 2, 0
_0809FB28: .4byte gRAMChapterData
_0809FB2C:
	movs r0, #0
_0809FB2E:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_809FA88

	THUMB_FUNC_START sub_809FB34
sub_809FB34: @ 0x0809FB34
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x2c]
	bl GetUnitItemCount
	adds r1, r0, #0
	cmp r1, #5
	bne _0809FB50
	adds r1, r4, #0
	adds r1, #0x30
	movs r0, #4
	strb r0, [r1]
	adds r0, r1, #0
	b _0809FB56
_0809FB50:
	adds r0, r4, #0
	adds r0, #0x30
	strb r1, [r0]
_0809FB56:
	ldrb r1, [r0]
	lsls r1, r1, #4
	adds r1, #0x48
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x10
	movs r2, #0xb
	bl sub_80AD51C
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_809FB34

	THUMB_FUNC_START sub_809FB70
sub_809FB70: @ 0x0809FB70
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r7, r6, #0
	adds r7, #0x33
	ldrb r1, [r7]
	lsls r1, r1, #1
	adds r0, #0x38
	adds r0, r0, r1
	ldrh r4, [r0]
	ldr r1, [r6, #0x2c]
	adds r0, r6, #0
	adds r0, #0x30
	ldrb r0, [r0]
	lsls r0, r0, #1
	adds r1, #0x1e
	adds r1, r1, r0
	ldrh r5, [r1]
	ldr r0, _0809FC0C  @ gUnknown_020122D4
	lsls r4, r4, #2
	adds r4, r4, r0
	ldrh r0, [r4, #2]
	strh r0, [r1]
	ldr r0, [r6, #0x2c]
	bl UnitRemoveInvalidItems
	strh r5, [r4, #2]
	bl sub_80982B8
	cmp r5, #0
	bne _0809FBB6
	ldr r0, [r6, #0x2c]
	ldrb r1, [r7]
	movs r2, #3
	bl SomethingPrepListRelated
_0809FBB6:
	adds r0, r6, #0
	bl sub_809F370
	ldr r0, _0809FC10  @ gUnknown_02022EEC
	ldr r4, _0809FC14  @ gUnknown_02013670
	ldr r2, [r6, #0x2c]
	adds r1, r4, #0
	movs r3, #0
	bl sub_809B74C
	adds r4, #0x28
	ldr r1, _0809FC18  @ gUnknown_02023CC6
	ldrb r2, [r7]
	lsls r2, r2, #1
	adds r0, r6, #0
	adds r0, #0x4a
	adds r0, r0, r2
	ldrh r2, [r0]
	lsrs r2, r2, #4
	ldr r3, [r6, #0x2c]
	adds r0, r4, #0
	bl sub_809D300
	ldr r0, _0809FC1C  @ sub_809EC38
	movs r1, #1
	adds r2, r6, #0
	bl sub_80ACE20
	movs r0, #4
	bl BG_EnableSyncByMask
	ldr r0, _0809FC20  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809FC06
	movs r0, #0x6a
	bl m4aSongNumStart
_0809FC06:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809FC0C: .4byte gUnknown_020122D4
_0809FC10: .4byte gUnknown_02022EEC
_0809FC14: .4byte gUnknown_02013670
_0809FC18: .4byte gUnknown_02023CC6
_0809FC1C: .4byte sub_809EC38
_0809FC20: .4byte gRAMChapterData

	THUMB_FUNC_END sub_809FB70

	THUMB_FUNC_START sub_809FC24
sub_809FC24: @ 0x0809FC24
	push {r4, r5, lr}
	adds r5, r0, #0
	ldrh r0, [r5, #0x36]
	cmp r0, #1
	bne _0809FC4C
	ldr r0, _0809FC48  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0x81
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0809FD0C
	bl CloseHelpBox
	movs r0, #0
	strh r0, [r5, #0x36]
	b _0809FD4E
	.align 2, 0
_0809FC48: .4byte gKeyStatusPtr
_0809FC4C:
	ldr r0, _0809FC80  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0809FC84
	ldr r0, [r5, #0x2c]
	adds r1, r5, #0
	adds r1, #0x30
	ldrb r3, [r1]
	lsls r1, r3, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r2, [r0]
	cmp r2, #0
	beq _0809FD4E
	lsls r1, r3, #4
	adds r1, #0x48
	movs r0, #0x10
	bl StartItemHelpBox
	movs r0, #1
	strh r0, [r5, #0x36]
	b _0809FD4E
	.align 2, 0
_0809FC80: .4byte gKeyStatusPtr
_0809FC84:
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0809FCE0
	ldr r0, [r5, #0x2c]
	adds r1, r5, #0
	adds r1, #0x30
	ldrb r1, [r1]
	ldr r4, _0809FCC4  @ gUnknown_020122D4
	adds r2, r5, #0
	adds r2, #0x33
	ldrb r3, [r2]
	lsls r3, r3, #1
	adds r2, #5
	adds r2, r2, r3
	ldrh r2, [r2]
	lsls r2, r2, #2
	adds r2, r2, r4
	ldrh r2, [r2, #2]
	bl sub_8097F44
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0809FCCC
	movs r1, #1
	negs r1, r1
	ldr r2, _0809FCC8  @ 0x0000088B
	adds r0, r1, #0
	adds r3, r5, #0
	bl sub_8097DA8
	b _0809FD4E
	.align 2, 0
_0809FCC4: .4byte gUnknown_020122D4
_0809FCC8: .4byte 0x0000088B
_0809FCCC:
	movs r0, #0
	bl sub_80ACA84
	adds r0, r5, #0
	bl Proc_Break
	adds r0, r5, #0
	bl sub_809FB70
	b _0809FD4E
_0809FCE0:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0809FD0C
	movs r0, #0
	bl sub_80ACA84
	adds r0, r5, #0
	bl Proc_Break
	ldr r0, _0809FD08  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809FD4E
	movs r0, #0x6b
	bl m4aSongNumStart
	b _0809FD4E
	.align 2, 0
_0809FD08: .4byte gRAMChapterData
_0809FD0C:
	adds r0, r5, #0
	bl sub_809FA88
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809FD4E
	adds r4, r5, #0
	adds r4, #0x30
	ldrb r1, [r4]
	lsls r1, r1, #4
	adds r1, #0x48
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x10
	movs r2, #0xb
	bl sub_80AD51C
	ldrh r0, [r5, #0x36]
	cmp r0, #1
	bne _0809FD4E
	ldr r0, [r5, #0x2c]
	ldrb r3, [r4]
	lsls r1, r3, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r2, [r0]
	cmp r2, #0
	beq _0809FD4E
	lsls r1, r3, #4
	adds r1, #0x48
	movs r0, #0x10
	bl StartItemHelpBox
_0809FD4E:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_809FC24

	THUMB_FUNC_START sub_809FD54
sub_809FD54: @ 0x0809FD54
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r0, #0x33
	ldrb r1, [r0]
	lsls r1, r1, #1
	adds r0, #5
	adds r0, r0, r1
	ldrh r4, [r0]
	lsls r4, r4, #2
	ldr r0, _0809FD84  @ gUnknown_020122D4
	adds r4, r4, r0
	ldr r6, [r5, #0x2c]
	ldrb r0, [r4]
	bl GetUnitFromCharId
	adds r1, r0, #0
	ldrb r2, [r4, #1]
	adds r0, r6, #0
	adds r3, r5, #0
	bl sub_809BE60
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0809FD84: .4byte gUnknown_020122D4

	THUMB_FUNC_END sub_809FD54

	THUMB_FUNC_START sub_809FD88
sub_809FD88: @ 0x0809FD88
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0809FD9C  @ gUnknown_08A19424
	bl Proc_StartBlocking
	str r4, [r0, #0x2c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809FD9C: .4byte gUnknown_08A19424

	THUMB_FUNC_END sub_809FD88

	THUMB_FUNC_START sub_809FDA0
sub_809FDA0: @ 0x0809FDA0
	push {r4, r5, r6, lr}
	sub sp, #4
	ldr r6, _0809FDCC  @ 0x0000DF80
	movs r5, #0x30
	movs r4, #3
_0809FDAA:
	str r6, [sp]
	movs r0, #4
	adds r1, r5, #0
	movs r2, #0x10
	ldr r3, _0809FDD0  @ gObject_32x16
	bl PutSpriteExt
	adds r6, #4
	adds r5, #0x20
	subs r4, #1
	cmp r4, #0
	bge _0809FDAA
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0809FDCC: .4byte 0x0000DF80
_0809FDD0: .4byte gObject_32x16

	THUMB_FUNC_END sub_809FDA0

	THUMB_FUNC_START sub_809FDD4
sub_809FDD4: @ 0x0809FDD4
	push {r4, r5, lr}
	sub sp, #0xc
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _0809FE10  @ sub_809FDA0
	bl StartParallelWorker
	ldr r0, _0809FE14  @ gUnknown_08A1951C
	lsls r4, r4, #2
	adds r4, r4, r0
	ldr r0, [r4]
	ldr r1, _0809FE18  @ gUnknown_08A19524
	ldr r1, [r1]
	bl GetStringFromIndexInBuffer
	adds r2, r0, #0
	movs r0, #0xe0
	lsls r0, r0, #7
	movs r1, #1
	str r1, [sp]
	str r1, [sp, #4]
	str r5, [sp, #8]
	movs r1, #0xd
	movs r3, #1
	bl sub_80ADD24
	add sp, #0xc
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0809FE10: .4byte sub_809FDA0
_0809FE14: .4byte gUnknown_08A1951C
_0809FE18: .4byte gUnknown_08A19524

	THUMB_FUNC_END sub_809FDD4

	THUMB_FUNC_START sub_809FE1C
sub_809FE1C: @ 0x0809FE1C
	push {lr}
	ldr r0, _0809FE4C  @ 0x04000006
	ldrh r0, [r0]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0xa0
	bls _0809FE2E
	movs r2, #0
_0809FE2E:
	cmp r2, #0xc
	bne _0809FE38
	ldr r1, _0809FE50  @ 0x04000050
	movs r0, #0xc8
	strh r0, [r1]
_0809FE38:
	cmp r2, #0x34
	beq _0809FE40
	cmp r2, #0
	bne _0809FE48
_0809FE40:
	ldr r1, _0809FE50  @ 0x04000050
	ldr r2, _0809FE54  @ 0x00000242
	adds r0, r2, #0
	strh r0, [r1]
_0809FE48:
	pop {r0}
	bx r0
	.align 2, 0
_0809FE4C: .4byte 0x04000006
_0809FE50: .4byte 0x04000050
_0809FE54: .4byte 0x00000242

	THUMB_FUNC_END sub_809FE1C

	THUMB_FUNC_START sub_809FE58
sub_809FE58: @ 0x0809FE58
	movs r2, #0
	movs r1, #0
	strh r1, [r0, #0x34]
	movs r1, #0xff
	strh r1, [r0, #0x32]
	adds r0, #0x30
	strb r2, [r0]
	bx lr

	THUMB_FUNC_END sub_809FE58

	THUMB_FUNC_START sub_809FE68
sub_809FE68: @ 0x0809FE68
	push {r4, r5, lr}
	ldr r4, _0809FEE4  @ gUnknown_02013648
	ldr r1, _0809FEE8  @ 0x06011000
	adds r0, r4, #0
	movs r2, #0xb
	bl InitSomeOtherGraphicsRelatedStruct
	ldr r0, _0809FEEC  @ Pal_UIFont
	movs r1, #0xd8
	lsls r1, r1, #2
	movs r2, #0x20
	bl CopyToPaletteBuffer
	adds r5, r4, #0
	adds r5, #0x90
	adds r0, r5, #0
	bl Text_Init3
	adds r0, r4, #0
	bl SetFont
	movs r0, #0
	bl SetFontGlyphSet
	adds r0, r5, #0
	movs r1, #0
	bl Text_80046B4
	ldr r0, _0809FEF0  @ 0x0000059C
	bl GetStringFromIndex
	adds r3, r0, #0
	adds r0, r5, #0
	movs r1, #0
	movs r2, #0
	bl Text_InsertString
	ldr r0, _0809FEF4  @ 0x0000059B
	bl GetStringFromIndex
	adds r3, r0, #0
	adds r0, r5, #0
	movs r1, #0x40
	movs r2, #0
	bl Text_InsertString
	ldr r0, _0809FEF8  @ 0x0000059D
	bl GetStringFromIndex
	adds r3, r0, #0
	adds r0, r5, #0
	movs r1, #0x80
	movs r2, #3
	bl Text_InsertString
	movs r0, #0
	bl SetFont
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0809FEE4: .4byte gUnknown_02013648
_0809FEE8: .4byte 0x06011000
_0809FEEC: .4byte Pal_UIFont
_0809FEF0: .4byte 0x0000059C
_0809FEF4: .4byte 0x0000059B
_0809FEF8: .4byte 0x0000059D

	THUMB_FUNC_END sub_809FE68

	THUMB_FUNC_START sub_809FEFC
sub_809FEFC: @ 0x0809FEFC
	push {r4, lr}
	sub sp, #4
	ldr r0, _0809FF5C  @ 0x00008840
	str r0, [sp]
	movs r0, #0xa0
	movs r1, #0x5b
	movs r2, #8
	movs r3, #4
	bl sub_809A31C
	ldr r4, _0809FF60  @ gObject_32x16
	ldr r0, _0809FF64  @ 0x0000B088
	str r0, [sp]
	movs r0, #4
	movs r1, #0xb0
	movs r2, #0x5e
	adds r3, r4, #0
	bl PutSpriteExt
	ldr r0, _0809FF68  @ 0x0000B08C
	str r0, [sp]
	movs r0, #4
	movs r1, #0xd0
	movs r2, #0x5e
	adds r3, r4, #0
	bl PutSpriteExt
	ldr r0, _0809FF6C  @ 0x0000B080
	str r0, [sp]
	movs r0, #4
	movs r1, #0xa8
	movs r2, #0x6e
	adds r3, r4, #0
	bl PutSpriteExt
	ldr r0, _0809FF70  @ 0x0000B084
	str r0, [sp]
	movs r0, #4
	movs r1, #0xc8
	movs r2, #0x6e
	adds r3, r4, #0
	bl PutSpriteExt
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809FF5C: .4byte 0x00008840
_0809FF60: .4byte gObject_32x16
_0809FF64: .4byte 0x0000B088
_0809FF68: .4byte 0x0000B08C
_0809FF6C: .4byte 0x0000B080
_0809FF70: .4byte 0x0000B084

	THUMB_FUNC_END sub_809FEFC

	THUMB_FUNC_START sub_809FF74
sub_809FF74: @ 0x0809FF74
	push {lr}
	sub sp, #4
	ldr r3, _0809FFA0  @ gObject_32x16
	ldr r0, _0809FFA4  @ 0x0000B090
	str r0, [sp]
	movs r0, #4
	movs r1, #0x88
	movs r2, #0x48
	bl PutSpriteExt
	ldr r3, _0809FFA8  @ gObject_8x16
	ldr r0, _0809FFAC  @ 0x0000B094
	str r0, [sp]
	movs r0, #4
	movs r1, #0xa8
	movs r2, #0x48
	bl PutSpriteExt
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_0809FFA0: .4byte gObject_32x16
_0809FFA4: .4byte 0x0000B090
_0809FFA8: .4byte gObject_8x16
_0809FFAC: .4byte 0x0000B094

	THUMB_FUNC_END sub_809FF74

	THUMB_FUNC_START sub_809FFB0
sub_809FFB0: @ 0x0809FFB0
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r6, _080A0008  @ gUnknown_02022F10
	adds r0, r6, #0
	movs r1, #0xa
	movs r2, #1
	movs r3, #0
	bl TileMap_FillRect
	cmp r4, #0
	beq _080A0022
	adds r0, r4, #0
	bl GetItemSellPrice
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0
	beq _0809FFE2
	adds r0, r4, #0
	bl GetItemAttributes
	movs r1, #0x10
	ands r1, r0
	cmp r1, #0
	beq _080A000C
_0809FFE2:
	adds r0, r6, #0
	adds r0, #0xa
	movs r1, #1
	movs r2, #0x14
	bl sub_8004B0C
	adds r0, r6, #0
	adds r0, #0xc
	movs r1, #1
	movs r2, #0x14
	bl sub_8004B0C
	adds r0, r6, #0
	adds r0, #0xe
	movs r1, #1
	movs r2, #0x14
	bl sub_8004B0C
	b _080A0018
	.align 2, 0
_080A0008: .4byte gUnknown_02022F10
_080A000C:
	adds r0, r6, #0
	adds r0, #0xc
	movs r1, #2
	adds r2, r5, #0
	bl sub_8004B88
_080A0018:
	ldr r0, _080A0030  @ gUnknown_02022F1E
	movs r1, #3
	movs r2, #0x1e
	bl sub_8004B0C
_080A0022:
	movs r0, #1
	bl BG_EnableSyncByMask
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A0030: .4byte gUnknown_02022F1E

	THUMB_FUNC_END sub_809FFB0

	THUMB_FUNC_START sub_80A0034
sub_80A0034: @ 0x080A0034
	push {r4, r5, lr}
	ldr r4, _080A0074  @ gUnknown_02022E90
	adds r0, r4, #0
	movs r1, #0xa
	movs r2, #1
	movs r3, #0
	bl TileMap_FillRect
	movs r0, #0xa3
	lsls r0, r0, #2
	adds r5, r4, r0
	bl GetPartyGoldAmount
	adds r2, r0, #0
	adds r0, r5, #0
	movs r1, #2
	bl sub_8004B88
	ldr r0, _080A0078  @ 0x0000028E
	adds r4, r4, r0
	adds r0, r4, #0
	movs r1, #3
	movs r2, #0x1e
	bl sub_8004B0C
	movs r0, #1
	bl BG_EnableSyncByMask
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A0074: .4byte gUnknown_02022E90
_080A0078: .4byte 0x0000028E

	THUMB_FUNC_END sub_80A0034

	THUMB_FUNC_START sub_80A007C
sub_80A007C: @ 0x080A007C
	push {r4, lr}
	sub sp, #8
	movs r0, #0
	bl SetFont
	ldr r4, _080A00D4  @ gUnknown_02022D10
	adds r0, r4, #0
	movs r1, #0xc
	movs r2, #1
	movs r3, #0
	bl TileMap_FillRect
	movs r0, #0xb3
	lsls r0, r0, #3
	bl GetStringFromIndex
	ldr r3, _080A00D8  @ gUnknown_02013660
	adds r1, r4, #0
	adds r1, #0xda
	movs r2, #0
	str r2, [sp]
	str r0, [sp, #4]
	adds r0, r3, #0
	movs r3, #2
	bl DrawTextInline
	subs r4, #0x26
	movs r2, #0x9c
	lsls r2, r2, #2
	movs r0, #1
	str r0, [sp]
	movs r0, #0xab
	adds r1, r4, #0
	movs r3, #2
	bl PutFaceChibi
	movs r0, #1
	bl BG_EnableSyncByMask
	add sp, #8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A00D4: .4byte gUnknown_02022D10
_080A00D8: .4byte gUnknown_02013660

	THUMB_FUNC_END sub_80A007C

	THUMB_FUNC_START sub_80A00DC
sub_80A00DC: @ 0x080A00DC
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r7, r0, #0
	ldr r5, _080A0300  @ gLCDControlBuffer
	ldrb r1, [r5]
	movs r0, #8
	negs r0, r0
	ands r0, r1
	strb r0, [r5]
	movs r0, #0
	bl SetupBackgrounds
	movs r0, #0
	bl BG_GetMapBuffer
	movs r1, #0
	bl BG_Fill
	movs r0, #1
	bl BG_GetMapBuffer
	movs r1, #0
	bl BG_Fill
	movs r0, #2
	bl BG_GetMapBuffer
	movs r1, #0
	bl BG_Fill
	ldrb r2, [r5, #0xc]
	movs r1, #4
	negs r1, r1
	adds r0, r1, #0
	ands r0, r2
	strb r0, [r5, #0xc]
	ldrb r2, [r5, #0x10]
	adds r0, r1, #0
	ands r0, r2
	movs r2, #2
	mov r9, r2
	mov r2, r9
	orrs r0, r2
	strb r0, [r5, #0x10]
	ldrb r0, [r5, #0x14]
	ands r1, r0
	strb r1, [r5, #0x14]
	ldrb r0, [r5, #0x18]
	movs r1, #3
	orrs r0, r1
	strb r0, [r5, #0x18]
	bl ResetFaces
	bl Font_InitForUIDefault
	bl ResetIconGraphics_
	bl LoadUiFrameGraphics
	bl LoadObjUIGfx
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	ldr r0, _080A0304  @ 0x06014000
	movs r1, #1
	negs r1, r1
	bl LoadDialogueBoxGfx
	movs r0, #4
	bl LoadIconPalettes
	bl EndSlidingWallEffectMaybe
	movs r0, #0xa0
	lsls r0, r0, #7
	movs r1, #5
	bl sub_8098C3C
	movs r0, #0x80
	lsls r0, r0, #4
	movs r1, #8
	bl sub_8098C8C
	ldr r0, _080A0308  @ gUnknown_08A1BBD0
	ldr r4, _080A030C  @ gGenericBuffer
	adds r1, r4, #0
	bl CopyDataWithPossibleUncomp
	ldr r0, _080A0310  @ gBG1TilemapBuffer
	movs r2, #0x80
	lsls r2, r2, #5
	adds r1, r4, #0
	bl CallARM_FillTileRect
	movs r0, #7
	bl BG_EnableSyncByMask
	ldr r0, [r7, #0x2c]
	bl GetUnitPortraitId
	adds r1, r0, #0
	ldr r0, _080A0314  @ 0x00000503
	str r0, [sp]
	movs r0, #0
	movs r2, #0x44
	movs r3, #0x48
	bl StartFace2
	adds r0, r7, #0
	bl sub_80AC9C0
	adds r0, r7, #0
	bl ResetPrepScreenHandCursor
	movs r0, #0xc0
	lsls r0, r0, #3
	movs r1, #1
	bl sub_80AD4A0
	ldrb r0, [r5, #1]
	movs r6, #0x20
	orrs r0, r6
	movs r1, #0x41
	negs r1, r1
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r5, #1]
	adds r1, r5, #0
	adds r1, #0x2d
	movs r0, #0x80
	strb r0, [r1]
	adds r1, #4
	movs r0, #0x28
	strb r0, [r1]
	subs r1, #5
	movs r0, #0xe0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0x98
	strb r0, [r1]
	movs r0, #0x34
	adds r0, r0, r5
	mov r8, r0
	ldrb r1, [r0]
	movs r2, #1
	orrs r1, r2
	mov r0, r9
	orrs r1, r0
	movs r0, #4
	orrs r1, r0
	movs r4, #8
	orrs r1, r4
	movs r3, #0x10
	orrs r1, r3
	adds r5, #0x36
	ldrb r0, [r5]
	orrs r0, r2
	mov r2, r9
	orrs r0, r2
	movs r2, #5
	negs r2, r2
	ands r0, r2
	orrs r0, r4
	orrs r0, r3
	orrs r1, r6
	mov r2, r8
	strb r1, [r2]
	orrs r0, r6
	strb r0, [r5]
	movs r0, #0
	movs r1, #8
	movs r2, #8
	movs r3, #8
	bl SetSpecialColorEffectsParameters
	adds r0, r7, #0
	bl NewGreenTextColorManager
	movs r0, #0x78
	movs r1, #0x8c
	movs r2, #2
	adds r3, r7, #0
	bl StartHelpPromptSprite
	movs r0, #0xa5
	movs r1, #0x80
	movs r2, #0xa
	adds r3, r7, #0
	bl sub_80984A8
	movs r0, #0xa5
	movs r1, #0x80
	bl sub_80984CC
	ldr r4, _080A0318  @ gUnknown_02013660
	adds r0, r4, #0
	movs r1, #4
	bl Text_Init
	adds r0, r4, #0
	adds r0, #8
	movs r1, #2
	bl Text_Init
	bl sub_809FE68
	adds r4, #0x10
	movs r5, #4
_080A029E:
	adds r0, r4, #0
	movs r1, #7
	bl Text_Init
	adds r4, #8
	subs r5, #1
	cmp r5, #0
	bge _080A029E
	movs r0, #0
	bl SetPrimaryHBlankHandler
	ldr r0, _080A031C  @ sub_809FE1C
	bl SetPrimaryHBlankHandler
	movs r0, #4
	bl BG_EnableSyncByMask
	ldr r0, _080A0320  @ gUnknown_02022EEC
	ldr r1, _080A0324  @ gUnknown_02013670
	ldr r2, [r7, #0x2c]
	movs r3, #0
	bl sub_809B74C
	bl sub_80A007C
	ldr r0, _080A0328  @ sub_809FF74
	adds r1, r7, #0
	bl StartParallelWorker
	ldr r1, [r7, #0x2c]
	adds r0, r7, #0
	adds r0, #0x30
	ldrb r0, [r0]
	lsls r0, r0, #1
	adds r1, #0x1e
	adds r1, r1, r0
	ldrh r0, [r1]
	bl sub_809FFB0
	bl sub_80A0034
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A0300: .4byte gLCDControlBuffer
_080A0304: .4byte 0x06014000
_080A0308: .4byte gUnknown_08A1BBD0
_080A030C: .4byte gGenericBuffer
_080A0310: .4byte gBG1TilemapBuffer
_080A0314: .4byte 0x00000503
_080A0318: .4byte gUnknown_02013660
_080A031C: .4byte sub_809FE1C
_080A0320: .4byte gUnknown_02022EEC
_080A0324: .4byte gUnknown_02013670
_080A0328: .4byte sub_809FF74

	THUMB_FUNC_END sub_80A00DC

	THUMB_FUNC_START sub_80A032C
sub_80A032C: @ 0x080A032C
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	ldr r6, _080A035C  @ gKeyStatusPtr
	ldr r0, [r6]
	ldrh r1, [r0, #6]
	movs r7, #0x40
	adds r0, r7, #0
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0
	beq _080A0372
	ldr r0, [r4, #0x2c]
	bl GetUnitItemCount
	adds r3, r0, #0
	adds r2, r4, #0
	adds r2, #0x30
	ldrb r0, [r2]
	cmp r0, #0
	beq _080A0360
	subs r0, #1
	strb r0, [r2]
	b _080A03A2
	.align 2, 0
_080A035C: .4byte gKeyStatusPtr
_080A0360:
	ldr r0, [r6]
	ldrh r1, [r0, #8]
	adds r0, r7, #0
	ands r0, r1
	cmp r0, #0
	beq _080A03BC
	subs r0, r3, #1
	strb r0, [r2]
	b _080A03A2
_080A0372:
	movs r7, #0x80
	adds r0, r7, #0
	ands r0, r1
	cmp r0, #0
	beq _080A03BC
	ldr r0, [r4, #0x2c]
	bl GetUnitItemCount
	adds r2, r4, #0
	adds r2, #0x30
	ldrb r1, [r2]
	subs r0, #1
	cmp r1, r0
	bge _080A0394
	adds r0, r1, #1
	strb r0, [r2]
	b _080A03A2
_080A0394:
	ldr r0, [r6]
	ldrh r1, [r0, #8]
	adds r0, r7, #0
	ands r0, r1
	cmp r0, #0
	beq _080A03BC
	strb r5, [r2]
_080A03A2:
	ldr r0, _080A03B8  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A03B4
	movs r0, #0x66
	bl m4aSongNumStart
_080A03B4:
	movs r0, #1
	b _080A03BE
	.align 2, 0
_080A03B8: .4byte gRAMChapterData
_080A03BC:
	movs r0, #0
_080A03BE:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80A032C

	THUMB_FUNC_START sub_80A03C4
sub_80A03C4: @ 0x080A03C4
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, _080A0418  @ gUnknown_02022EEC
	ldr r1, _080A041C  @ gUnknown_02013670
	ldr r2, [r4, #0x2c]
	movs r3, #0
	bl sub_809B74C
	ldr r1, [r4, #0x2c]
	adds r5, r4, #0
	adds r5, #0x30
	ldrb r0, [r5]
	lsls r0, r0, #1
	adds r1, #0x1e
	adds r1, r1, r0
	ldrh r0, [r1]
	bl sub_809FFB0
	movs r0, #0
	bl sub_80ACA84
	ldr r0, _080A0420  @ sub_809FEFC
	bl GetParallelWorker
	bl Proc_End
	ldrb r1, [r5]
	lsls r1, r1, #4
	adds r1, #0x48
	movs r3, #0x80
	lsls r3, r3, #3
	movs r0, #0x10
	movs r2, #0xb
	bl sub_80AD51C
	movs r0, #0
	adds r1, r4, #0
	bl sub_809FDD4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A0418: .4byte gUnknown_02022EEC
_080A041C: .4byte gUnknown_02013670
_080A0420: .4byte sub_809FEFC

	THUMB_FUNC_END sub_80A03C4

	THUMB_FUNC_START sub_80A0424
sub_80A0424: @ 0x080A0424
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x34]
	cmp r0, #1
	bne _080A044C
	ldr r0, _080A0448  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0x81
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080A0518
	bl CloseHelpBox
	movs r0, #0
	strh r0, [r4, #0x34]
	b _080A056A
	.align 2, 0
_080A0448: .4byte gKeyStatusPtr
_080A044C:
	ldr r0, _080A0484  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080A0488
	ldr r0, [r4, #0x2c]
	adds r1, r4, #0
	adds r1, #0x30
	ldrb r3, [r1]
	lsls r1, r3, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r2, [r0]
	cmp r2, #0
	bne _080A0472
	b _080A056A
_080A0472:
	lsls r1, r3, #4
	adds r1, #0x48
	movs r0, #0x10
	bl StartItemHelpBox
	movs r0, #1
	strh r0, [r4, #0x34]
	b _080A056A
	.align 2, 0
_080A0484: .4byte gKeyStatusPtr
_080A0488:
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080A04F0
	ldr r1, [r4, #0x2c]
	adds r6, r4, #0
	adds r6, #0x30
	ldrb r0, [r6]
	lsls r0, r0, #1
	adds r1, #0x1e
	adds r1, r1, r0
	ldrh r5, [r1]
	adds r0, r5, #0
	bl GetItemSellPrice
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _080A04BA
	adds r0, r5, #0
	bl GetItemAttributes
	movs r1, #0x10
	ands r1, r0
	cmp r1, #0
	beq _080A04CE
_080A04BA:
	ldrb r1, [r6]
	lsls r1, r1, #4
	adds r1, #0x48
	movs r2, #0x85
	lsls r2, r2, #4
	movs r0, #0x10
	adds r3, r4, #0
	bl sub_8097DA8
	b _080A056A
_080A04CE:
	adds r0, r4, #0
	movs r1, #2
	bl Proc_Goto
	ldr r0, _080A04EC  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A056A
	movs r0, #0x6a
	bl m4aSongNumStart
	b _080A056A
	.align 2, 0
_080A04EC: .4byte gRAMChapterData
_080A04F0:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080A0518
	adds r0, r4, #0
	movs r1, #3
	bl Proc_Goto
	ldr r0, _080A0514  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A056A
	movs r0, #0x6b
	bl m4aSongNumStart
	b _080A056A
	.align 2, 0
_080A0514: .4byte gRAMChapterData
_080A0518:
	adds r0, r4, #0
	bl sub_80A032C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A056A
	adds r5, r4, #0
	adds r5, #0x30
	ldrb r1, [r5]
	lsls r1, r1, #4
	adds r1, #0x48
	movs r3, #0x80
	lsls r3, r3, #3
	movs r0, #0x10
	movs r2, #0xb
	bl sub_80AD51C
	ldr r1, [r4, #0x2c]
	ldrb r0, [r5]
	lsls r0, r0, #1
	adds r1, #0x1e
	adds r1, r1, r0
	ldrh r0, [r1]
	bl sub_809FFB0
	ldrh r0, [r4, #0x34]
	cmp r0, #1
	bne _080A056A
	ldr r0, [r4, #0x2c]
	ldrb r3, [r5]
	lsls r1, r3, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r2, [r0]
	cmp r2, #0
	beq _080A056A
	lsls r1, r3, #4
	adds r1, #0x48
	movs r0, #0x10
	bl StartItemHelpBox
_080A056A:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80A0424

	THUMB_FUNC_START sub_80A0570
sub_80A0570: @ 0x080A0570
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r4, #0
	adds r5, #0x31
	movs r0, #1
	strb r0, [r5]
	ldr r0, _080A05B8  @ sub_809FEFC
	adds r1, r4, #0
	bl StartParallelWorker
	adds r0, r4, #0
	adds r0, #0x30
	ldrb r2, [r0]
	lsls r2, r2, #4
	adds r2, #0x48
	movs r0, #0
	movs r1, #0x10
	movs r3, #2
	bl sub_80AC9D4
	ldrb r0, [r5]
	lsls r0, r0, #5
	adds r0, #0xa4
	movs r3, #0x80
	lsls r3, r3, #3
	movs r1, #0x6f
	movs r2, #0
	bl sub_80AD51C
	movs r0, #1
	adds r1, r4, #0
	bl sub_809FDD4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A05B8: .4byte sub_809FEFC

	THUMB_FUNC_END sub_80A0570

	THUMB_FUNC_START sub_80A05BC
sub_80A05BC: @ 0x080A05BC
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x2c]
	adds r5, r4, #0
	adds r5, #0x30
	ldrb r0, [r5]
	lsls r0, r0, #1
	adds r1, #0x1e
	adds r1, r1, r0
	ldrh r0, [r1]
	bl GetItemSellPrice
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl sub_8024E20
	ldr r1, [r4, #0x2c]
	ldrb r0, [r5]
	lsls r0, r0, #1
	adds r1, #0x1e
	adds r1, r1, r0
	movs r0, #0
	strh r0, [r1]
	ldr r0, [r4, #0x2c]
	bl UnitRemoveInvalidItems
	ldr r0, _080A0628  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A0602
	movs r0, #0xb9
	bl m4aSongNumStart
_080A0602:
	bl sub_80A0034
	ldr r0, [r4, #0x2c]
	bl GetUnitItemCount
	cmp r0, #0
	bne _080A0634
	ldr r0, _080A062C  @ gUnknown_02022EEC
	ldr r1, _080A0630  @ gUnknown_02013670
	ldr r2, [r4, #0x2c]
	movs r3, #0
	bl sub_809B74C
	adds r0, r4, #0
	movs r1, #3
	bl Proc_Goto
	b _080A0646
	.align 2, 0
_080A0628: .4byte gRAMChapterData
_080A062C: .4byte gUnknown_02022EEC
_080A0630: .4byte gUnknown_02013670
_080A0634:
	ldrb r1, [r5]
	cmp r0, r1
	bne _080A063E
	subs r0, #1
	strb r0, [r5]
_080A063E:
	adds r0, r4, #0
	movs r1, #1
	bl Proc_Goto
_080A0646:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80A05BC

	THUMB_FUNC_START sub_80A064C
sub_80A064C: @ 0x080A064C
	push {r4, r5, r6, lr}
	adds r1, r0, #0
	adds r4, r1, #0
	adds r4, #0x31
	ldrb r5, [r4]
	ldr r6, _080A0670  @ gKeyStatusPtr
	ldr r3, [r6]
	ldrh r2, [r3, #8]
	movs r0, #1
	ands r0, r2
	cmp r0, #0
	beq _080A0674
	cmp r5, #0
	bne _080A0680
	adds r0, r1, #0
	bl sub_80A05BC
	b _080A06E6
	.align 2, 0
_080A0670: .4byte gKeyStatusPtr
_080A0674:
	movs r0, #2
	ands r0, r2
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0
	beq _080A06A0
_080A0680:
	adds r0, r1, #0
	movs r1, #1
	bl Proc_Goto
	ldr r0, _080A069C  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A06E6
	movs r0, #0x6b
	bl m4aSongNumStart
	b _080A06E6
	.align 2, 0
_080A069C: .4byte gRAMChapterData
_080A06A0:
	ldrh r1, [r3, #6]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _080A06AC
	strb r2, [r4]
_080A06AC:
	ldr r0, [r6]
	ldrh r1, [r0, #6]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _080A06BC
	movs r0, #1
	strb r0, [r4]
_080A06BC:
	ldrb r0, [r4]
	cmp r5, r0
	beq _080A06E6
	ldr r0, _080A06EC  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A06D4
	movs r0, #0x67
	bl m4aSongNumStart
_080A06D4:
	ldrb r0, [r4]
	lsls r0, r0, #5
	adds r0, #0xa4
	movs r3, #0x80
	lsls r3, r3, #3
	movs r1, #0x6f
	movs r2, #0
	bl sub_80AD51C
_080A06E6:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A06EC: .4byte gRAMChapterData

	THUMB_FUNC_END sub_80A064C

	THUMB_FUNC_START sub_80A06F0
sub_80A06F0: @ 0x080A06F0
	push {lr}
	bl EndBG3Slider_
	movs r0, #0
	bl EndFaceById
	movs r0, #0
	bl SetPrimaryHBlankHandler
	bl sub_8098500
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80A06F0

	THUMB_FUNC_START sub_80A070C
sub_80A070C: @ 0x080A070C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080A0720  @ gUnknown_08A19528
	bl Proc_StartBlocking
	str r4, [r0, #0x2c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A0720: .4byte gUnknown_08A19528

	THUMB_FUNC_END sub_80A070C

	THUMB_FUNC_START sub_80A0724
sub_80A0724: @ 0x080A0724
	push {lr}
	sub sp, #0x10
	ldr r0, [r0, #0x2c]
	str r0, [sp]
	ldr r0, _080A0754  @ 0x06011000
	str r0, [sp, #4]
	movs r0, #1
	negs r0, r0
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	movs r0, #0xa
	movs r1, #7
	movs r2, #0x11
	movs r3, #4
	bl sub_808F128
	movs r0, #0x7c
	bl sub_808E9D8
	add sp, #0x10
	pop {r0}
	bx r0
	.align 2, 0
_080A0754: .4byte 0x06011000

	THUMB_FUNC_END sub_80A0724

	THUMB_FUNC_START sub_80A0758
sub_80A0758: @ 0x080A0758
	bx lr

	THUMB_FUNC_END sub_80A0758

	THUMB_FUNC_START __malloc_unlock_2
__malloc_unlock_2: @ 0x080A075C
	bx lr

	THUMB_FUNC_END __malloc_unlock_2

	THUMB_FUNC_START sub_80A0760
sub_80A0760: @ 0x080A0760
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r0, #0x30
	movs r4, #1
	strb r4, [r0]
	bl sub_80A0A34
	adds r1, r5, #0
	adds r1, #0x31
	strb r0, [r1]
	bl sub_80A0A70
	adds r1, r5, #0
	adds r1, #0x32
	strb r0, [r1]
	adds r0, r5, #0
	adds r0, #0x33
	strb r4, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80A0760

	THUMB_FUNC_START sub_80A078C
sub_80A078C: @ 0x080A078C
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	sub sp, #8
	mov r9, r0
	ldr r6, _080A084C  @ gUnknown_02013498
	movs r0, #0
	bl SetFontGlyphSet
	movs r0, #0
	bl SetFont
	ldr r0, _080A0850  @ gUnknown_02022F28
	movs r1, #0x1f
	movs r2, #0xa
	movs r3, #0
	bl TileMap_FillRect
	movs r4, #0
_080A07B4:
	adds r0, r6, #0
	bl Text_Clear
	ldr r1, _080A0854  @ gUnknown_08A196D0
	lsls r0, r4, #2
	adds r0, r0, r1
	ldr r0, [r0]
	bl GetStringFromIndex
	adds r3, r0, #0
	adds r5, r6, #0
	adds r6, #8
	asrs r2, r4, #1
	lsls r2, r2, #6
	movs r0, #0xa2
	lsls r0, r0, #1
	adds r2, r2, r0
	movs r1, #1
	ands r1, r4
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #1
	adds r2, r2, r0
	lsls r2, r2, #1
	ldr r0, _080A0858  @ gBG0TilemapBuffer
	mov r8, r0
	adds r1, r2, r0
	movs r2, #0
	mov r0, r9
	adds r0, #0x30
	adds r0, r0, r4
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _080A07FE
	movs r2, #1
_080A07FE:
	movs r7, #0
	str r7, [sp]
	str r3, [sp, #4]
	adds r0, r5, #0
	movs r3, #0
	bl DrawTextInline
	adds r4, #1
	cmp r4, #3
	ble _080A07B4
	ldr r0, _080A084C  @ gUnknown_02013498
	adds r6, r0, #0
	adds r6, #0xf0
	adds r0, r6, #0
	bl Text_Clear
	ldr r0, _080A085C  @ gUnknown_08A196BC
	ldr r0, [r0, #0xc]
	bl GetStringFromIndex
	mov r1, r8
	adds r1, #0x2c
	str r7, [sp]
	str r0, [sp, #4]
	adds r0, r6, #0
	movs r2, #0
	movs r3, #0
	bl DrawTextInline
	movs r0, #1
	bl BG_EnableSyncByMask
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A084C: .4byte gUnknown_02013498
_080A0850: .4byte gUnknown_02022F28
_080A0854: .4byte gUnknown_08A196D0
_080A0858: .4byte gBG0TilemapBuffer
_080A085C: .4byte gUnknown_08A196BC

	THUMB_FUNC_END sub_80A078C

	THUMB_FUNC_START sub_80A0860
sub_80A0860: @ 0x080A0860
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r3, r5, #0
	adds r3, #0x29
	ldrb r4, [r3]
	ldr r2, _080A08F0  @ gKeyStatusPtr
	ldr r0, [r2]
	ldrh r1, [r0, #6]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _080A0884
	movs r0, #1
	ands r0, r4
	cmp r0, #0
	beq _080A0884
	subs r0, r4, #1
	strb r0, [r3]
_080A0884:
	ldr r0, [r2]
	ldrh r1, [r0, #6]
	movs r0, #0x10
	ands r0, r1
	adds r3, r5, #0
	adds r3, #0x29
	cmp r0, #0
	beq _080A08A2
	ldrb r1, [r3]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _080A08A2
	adds r0, r1, #1
	strb r0, [r3]
_080A08A2:
	ldr r0, [r2]
	ldrh r1, [r0, #6]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _080A08BA
	ldrb r1, [r3]
	lsrs r0, r1, #1
	cmp r0, #0
	bne _080A08BA
	adds r0, r1, #2
	strb r0, [r3]
_080A08BA:
	ldr r0, [r2]
	ldrh r1, [r0, #6]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _080A08D2
	ldrb r1, [r3]
	lsrs r0, r1, #1
	cmp r0, #0
	beq _080A08D2
	subs r0, r1, #2
	strb r0, [r3]
_080A08D2:
	ldrb r3, [r3]
	cmp r4, r3
	beq _080A08F8
	ldr r0, _080A08F4  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A08EA
	movs r0, #0x65
	bl m4aSongNumStart
_080A08EA:
	movs r0, #1
	b _080A08FA
	.align 2, 0
_080A08F0: .4byte gKeyStatusPtr
_080A08F4: .4byte gRAMChapterData
_080A08F8:
	movs r0, #0
_080A08FA:
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80A0860

	THUMB_FUNC_START sub_80A0900
sub_80A0900: @ 0x080A0900
	push {r4, lr}
	adds r4, r0, #0
	bl sub_808F270
	adds r0, r4, #0
	bl EndAllProcChildren
	bl EndBG3Slider_
	movs r0, #0
	bl EndFaceById
	movs r0, #0
	bl SetPrimaryHBlankHandler
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80A0900

	THUMB_FUNC_START sub_80A0924
sub_80A0924: @ 0x080A0924
	push {lr}
	adds r1, r0, #0
	adds r1, #0x29
	ldrb r1, [r1]
	cmp r1, #0
	blt _080A093E
	cmp r1, #1
	ble _080A093E
	cmp r1, #2
	bne _080A093E
	movs r1, #4
	bl Proc_Goto
_080A093E:
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80A0924

	THUMB_FUNC_START sub_80A0944
sub_80A0944: @ 0x080A0944
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080A0958  @ gUnknown_08A1962C
	bl Proc_StartBlocking
	adds r0, #0x29
	strb r4, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A0958: .4byte gUnknown_08A1962C

	THUMB_FUNC_END sub_80A0944

	THUMB_FUNC_START sub_80A095C
sub_80A095C: @ 0x080A095C
	push {lr}
	cmp r0, #1
	beq _080A0976
	cmp r0, #1
	bgt _080A096C
	cmp r0, #0
	beq _080A0972
	b _080A0986
_080A096C:
	cmp r0, #2
	beq _080A097C
	b _080A0986
_080A0972:
	movs r0, #1
	b _080A0988
_080A0976:
	bl sub_80A0A34
	b _080A0980
_080A097C:
	bl sub_80A0A70
_080A0980:
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	b _080A0988
_080A0986:
	movs r0, #0
_080A0988:
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80A095C

	THUMB_FUNC_START sub_80A098C
sub_80A098C: @ 0x080A098C
	push {lr}
	ldr r0, _080A09A4  @ gRAMChapterData
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetROMChapterStruct
	adds r0, #0x7a
	ldrh r0, [r0]
	pop {r1}
	bx r1
	.align 2, 0
_080A09A4: .4byte gRAMChapterData

	THUMB_FUNC_END sub_80A098C

	THUMB_FUNC_START sub_80A09A8
sub_80A09A8: @ 0x080A09A8
	push {lr}
	ldr r0, _080A09C0  @ gRAMChapterData
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetROMChapterStruct
	adds r0, #0x76
	ldrh r0, [r0]
	pop {r1}
	bx r1
	.align 2, 0
_080A09C0: .4byte gRAMChapterData

	THUMB_FUNC_END sub_80A09A8

	THUMB_FUNC_START sub_80A09C4
sub_80A09C4: @ 0x080A09C4
	push {lr}
	ldr r0, _080A09DC  @ gRAMChapterData
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetROMChapterStruct
	adds r0, #0x7c
	ldrh r0, [r0]
	pop {r1}
	bx r1
	.align 2, 0
_080A09DC: .4byte gRAMChapterData

	THUMB_FUNC_END sub_80A09C4

	THUMB_FUNC_START sub_80A09E0
sub_80A09E0: @ 0x080A09E0
	push {lr}
	ldr r0, _080A09F8  @ gRAMChapterData
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetROMChapterStruct
	adds r0, #0x7f
	ldrb r0, [r0]
	pop {r1}
	bx r1
	.align 2, 0
_080A09F8: .4byte gRAMChapterData

	THUMB_FUNC_END sub_80A09E0

	THUMB_FUNC_START sub_80A09FC
sub_80A09FC: @ 0x080A09FC
	push {lr}
	ldr r0, _080A0A14  @ gRAMChapterData
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetROMChapterStruct
	adds r0, #0x7e
	ldrb r0, [r0]
	pop {r1}
	bx r1
	.align 2, 0
_080A0A14: .4byte gRAMChapterData

	THUMB_FUNC_END sub_80A09FC

	THUMB_FUNC_START sub_80A0A18
sub_80A0A18: @ 0x080A0A18
	push {lr}
	bl sub_80A098C
	cmp r0, #0
	beq _080A0A2E
	bl sub_80A09A8
	cmp r0, #0
	bne _080A0A2E
	movs r0, #1
	b _080A0A30
_080A0A2E:
	movs r0, #0
_080A0A30:
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80A0A18

	THUMB_FUNC_START sub_80A0A34
sub_80A0A34: @ 0x080A0A34
	push {lr}
	ldr r0, _080A0A50  @ gRAMChapterData
	ldrb r1, [r0, #0x14]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	bne _080A0A4A
	bl sub_80A098C
	cmp r0, #0
	bne _080A0A54
_080A0A4A:
	movs r0, #0
	b _080A0A56
	.align 2, 0
_080A0A50: .4byte gRAMChapterData
_080A0A54:
	movs r0, #1
_080A0A56:
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80A0A34

	THUMB_FUNC_START sub_80A0A5C
sub_80A0A5C: @ 0x080A0A5C
	push {lr}
	bl sub_80A09FC
	cmp r0, #1
	beq _080A0A6A
	movs r0, #0
	b _080A0A6C
_080A0A6A:
	movs r0, #1
_080A0A6C:
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80A0A5C

	THUMB_FUNC_START sub_80A0A70
sub_80A0A70: @ 0x080A0A70
	movs r0, #1
	bx lr

	THUMB_FUNC_END sub_80A0A70

	THUMB_FUNC_START sub_80A0A74
sub_80A0A74: @ 0x080A0A74
	push {lr}
	ldr r0, _080A0A88  @ gRAMChapterData
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x61
	bgt _080A0A8C
	movs r0, #0
	b _080A0A8E
	.align 2, 0
_080A0A88: .4byte gRAMChapterData
_080A0A8C:
	movs r0, #1
_080A0A8E:
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80A0A74

	THUMB_FUNC_START sub_80A0A94
sub_80A0A94: @ 0x080A0A94
	ldr r0, _080A0A9C  @ gUnknown_020136F0
	ldr r0, [r0]
	bx lr
	.align 2, 0
_080A0A9C: .4byte gUnknown_020136F0

	THUMB_FUNC_END sub_80A0A94

	THUMB_FUNC_START sub_80A0AA0
sub_80A0AA0: @ 0x080A0AA0
	push {lr}
	adds r1, r0, #0
	ldr r0, _080A0AB4  @ gUnknown_020136F0
	ldr r0, [r0]
	subs r0, #1
	cmp r1, r0
	bge _080A0AB8
	adds r0, r1, #1
	b _080A0ABA
	.align 2, 0
_080A0AB4: .4byte gUnknown_020136F0
_080A0AB8:
	movs r0, #0
_080A0ABA:
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80A0AA0

	THUMB_FUNC_START sub_80A0AC0
sub_80A0AC0: @ 0x080A0AC0
	push {lr}
	cmp r0, #0
	bne _080A0ACA
	ldr r0, _080A0AD0  @ gUnknown_020136F0
	ldr r0, [r0]
_080A0ACA:
	subs r0, #1
	pop {r1}
	bx r1
	.align 2, 0
_080A0AD0: .4byte gUnknown_020136F0

	THUMB_FUNC_END sub_80A0AC0

	THUMB_FUNC_START sub_80A0AD4
sub_80A0AD4: @ 0x080A0AD4
	ldr r2, _080A0AE8  @ gUnknown_08A196FC
	ldr r3, [r2]
	lsls r2, r0, #1
	adds r2, r2, r0
	lsls r2, r2, #3
	adds r2, r2, r3
	adds r2, #2
	adds r2, r2, r1
	ldrb r0, [r2]
	bx lr
	.align 2, 0
_080A0AE8: .4byte gUnknown_08A196FC

	THUMB_FUNC_END sub_80A0AD4

	THUMB_FUNC_START sub_80A0AEC
sub_80A0AEC: @ 0x080A0AEC
	ldr r2, _080A0B00  @ gUnknown_08A196FC
	ldr r3, [r2]
	lsls r2, r0, #1
	adds r2, r2, r0
	lsls r2, r2, #3
	adds r2, r2, r3
	adds r2, #9
	adds r2, r2, r1
	ldrb r0, [r2]
	bx lr
	.align 2, 0
_080A0B00: .4byte gUnknown_08A196FC

	THUMB_FUNC_END sub_80A0AEC

	THUMB_FUNC_START sub_80A0B04
sub_80A0B04: @ 0x080A0B04
	ldr r2, _080A0B1C  @ gUnknown_08A196FC
	ldr r3, [r2]
	lsls r2, r0, #1
	adds r2, r2, r0
	lsls r2, r2, #3
	adds r2, r2, r3
	adds r2, #0x10
	adds r2, r2, r1
	movs r0, #0
	ldrsb r0, [r2, r0]
	bx lr
	.align 2, 0
_080A0B1C: .4byte gUnknown_08A196FC

	THUMB_FUNC_END sub_80A0B04

	THUMB_FUNC_START sub_80A0B20
sub_80A0B20: @ 0x080A0B20
	push {r4, r5, lr}
	adds r5, r1, #0
	ldr r4, _080A0B40  @ gCharacterData
	bl sub_80A0B44
	subs r0, #1
	movs r1, #0x34
	muls r0, r1, r0
	adds r4, #0x2c
	adds r0, r0, r4
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r0, [r0]
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080A0B40: .4byte gCharacterData

	THUMB_FUNC_END sub_80A0B20

	THUMB_FUNC_START sub_80A0B44
sub_80A0B44: @ 0x080A0B44
	ldr r1, _080A0B54  @ gUnknown_08A196FC
	ldr r2, [r1]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	ldrb r0, [r1]
	bx lr
	.align 2, 0
_080A0B54: .4byte gUnknown_08A196FC

	THUMB_FUNC_END sub_80A0B44

	THUMB_FUNC_START sub_80A0B58
sub_80A0B58: @ 0x080A0B58
	ldr r1, _080A0B68  @ gUnknown_08A196FC
	ldr r2, [r1]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	ldrb r0, [r1, #1]
	bx lr
	.align 2, 0
_080A0B68: .4byte gUnknown_08A196FC

	THUMB_FUNC_END sub_80A0B58

	THUMB_FUNC_START sub_80A0B6C
sub_80A0B6C: @ 0x080A0B6C
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r4, #1
_080A0B72:
	adds r0, r4, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq _080A0BA0
	ldr r3, [r2]
	cmp r3, #0
	beq _080A0BA0
	ldr r0, [r2, #0xc]
	ldr r1, _080A0B9C  @ 0x00010004
	ands r0, r1
	cmp r0, #0
	bne _080A0BA0
	ldrb r0, [r3, #4]
	cmp r0, r5
	bne _080A0BA0
	ldr r0, [r2, #4]
	ldrb r0, [r0, #4]
	b _080A0BB2
	.align 2, 0
_080A0B9C: .4byte 0x00010004
_080A0BA0:
	adds r4, #1
	cmp r4, #0x3f
	ble _080A0B72
	ldr r2, _080A0BB8  @ gCharacterData
	subs r1, r5, #1
	movs r0, #0x34
	muls r0, r1, r0
	adds r0, r0, r2
	ldrb r0, [r0, #5]
_080A0BB2:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080A0BB8: .4byte gCharacterData

	THUMB_FUNC_END sub_80A0B6C

	THUMB_FUNC_START sub_80A0BBC
sub_80A0BBC: @ 0x080A0BBC
	push {r4, lr}
	adds r4, r0, #0
	bl sub_80847F8
	adds r1, r0, #0
	ldrh r0, [r1]
	ldr r2, _080A0BE0  @ 0x0000FFFF
	cmp r0, r2
	beq _080A0BEC
_080A0BCE:
	ldrh r0, [r1]
	cmp r0, r4
	beq _080A0BDA
	ldrh r0, [r1, #2]
	cmp r0, r4
	bne _080A0BE4
_080A0BDA:
	movs r0, #1
	b _080A0BEE
	.align 2, 0
_080A0BE0: .4byte 0x0000FFFF
_080A0BE4:
	adds r1, #0x10
	ldrh r0, [r1]
	cmp r0, r2
	bne _080A0BCE
_080A0BEC:
	movs r0, #0
_080A0BEE:
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80A0BBC

	THUMB_FUNC_START sub_80A0BF4
sub_80A0BF4: @ 0x080A0BF4
	push {r4, r5, r6, r7, lr}
	bl sub_80847F8
	adds r6, r0, #0
	ldrh r0, [r6]
	ldr r1, _080A0C3C  @ 0x0000FFFF
	cmp r0, r1
	beq _080A0C34
	adds r7, r1, #0
_080A0C06:
	ldrh r0, [r6]
	movs r1, #0
	bl SGM_SetCharacterKnown
	ldrh r0, [r6, #2]
	movs r1, #0
	bl SGM_SetCharacterKnown
	ldrh r4, [r6]
	ldrh r5, [r6, #2]
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_80A3468
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_80A3724
	adds r6, #0x10
	ldrh r0, [r6]
	cmp r0, r7
	bne _080A0C06
_080A0C34:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A0C3C: .4byte 0x0000FFFF

	THUMB_FUNC_END sub_80A0BF4

	THUMB_FUNC_START sub_80A0C40
sub_80A0C40: @ 0x080A0C40
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x90
	adds r4, r0, #0
	mov r1, sp
	movs r0, #0
	strh r0, [r1]
	ldr r7, _080A0DC0  @ gUnknown_08A196FC
	ldr r1, [r7]
	ldr r2, _080A0DC4  @ 0x01000600
	mov r0, sp
	bl CpuSet
	ldr r5, _080A0DC8  @ gUnknown_020136F0
	movs r1, #0
	str r1, [r5]
	adds r4, #0x42
	movs r0, #0
	ldrsb r0, [r4, r0]
	cmp r0, #0
	bne _080A0C72
	b _080A0DD8
_080A0C72:
	add r0, sp, #0x24
	strh r1, [r0]
	add r1, sp, #4
	ldr r2, _080A0DCC  @ 0x01000010
	bl CpuSet
	movs r4, #1
_080A0C80:
	adds r0, r4, #0
	bl GetUnit
	cmp r0, #0
	beq _080A0CB0
	ldr r2, [r0]
	cmp r2, #0
	beq _080A0CB0
	ldr r0, [r0, #0xc]
	ldr r1, _080A0DD0  @ 0x00010004
	ands r0, r1
	cmp r0, #0
	bne _080A0CB0
	ldrb r1, [r2, #4]
	lsrs r2, r1, #5
	lsls r2, r2, #2
	add r2, sp
	movs r0, #0x1f
	ands r0, r1
	movs r1, #1
	lsls r1, r0
	ldr r0, [r2, #4]
	orrs r0, r1
	str r0, [r2, #4]
_080A0CB0:
	adds r4, #1
	cmp r4, #0x3f
	ble _080A0C80
	movs r4, #1
	ldr r0, _080A0DC8  @ gUnknown_020136F0
	mov sl, r0
_080A0CBC:
	adds r0, r4, #0
	bl GetUnit
	adds r5, r0, #0
	adds r4, #1
	str r4, [sp, #0x8c]
	cmp r5, #0
	beq _080A0DB6
	ldr r2, [r5]
	cmp r2, #0
	beq _080A0DB6
	ldr r0, [r5, #0xc]
	ldr r1, _080A0DD0  @ 0x00010004
	ands r0, r1
	cmp r0, #0
	bne _080A0DB6
	ldrb r0, [r2, #4]
	bl sub_80A1B6C
	cmp r0, #0
	beq _080A0DB6
	mov r0, sl
	ldr r1, [r0]
	ldr r0, _080A0DC0  @ gUnknown_08A196FC
	ldr r2, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	ldr r1, [r5]
	ldrb r1, [r1, #4]
	strb r1, [r0]
	mov r0, sl
	ldr r1, [r0]
	ldr r0, _080A0DC0  @ gUnknown_08A196FC
	ldr r2, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	ldr r1, [r5, #4]
	ldrb r1, [r1, #4]
	strb r1, [r0, #1]
	movs r6, #0
	ldr r0, [r5]
	ldrb r0, [r0, #4]
	subs r0, #1
	movs r1, #0x34
	muls r0, r1, r0
	ldr r1, _080A0DD4  @ gCharacterData+0x2C
	adds r0, r0, r1
	ldr r0, [r0]
	ldrb r0, [r0, #0x15]
	cmp r6, r0
	bge _080A0DAE
	ldr r7, _080A0DC8  @ gUnknown_020136F0
	ldr r0, _080A0DC0  @ gUnknown_08A196FC
	mov r8, r0
_080A0D30:
	ldr r0, [r7]
	adds r1, r6, #0
	bl sub_80A0B20
	adds r4, r0, #0
	adds r0, r5, #0
	adds r1, r6, #0
	bl GetUnitSupportLevel
	ldr r2, [r7]
	mov r1, r8
	ldr r3, [r1]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #3
	adds r1, r1, r3
	adds r1, #2
	adds r1, r1, r6
	strb r0, [r1]
	adds r0, r4, #0
	bl sub_80A0B6C
	ldr r2, [r7]
	mov r1, r8
	ldr r3, [r1]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #3
	adds r1, r1, r3
	adds r1, #9
	adds r1, r1, r6
	strb r0, [r1]
	ldr r0, [r7]
	mov r1, r8
	ldr r2, [r1]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	adds r1, #0x10
	add r1, r9
	asrs r0, r4, #5
	lsls r0, r0, #2
	add r0, sp
	movs r2, #0x1f
	ands r2, r4
	ldr r0, [r0, #4]
	lsrs r0, r2
	movs r2, #1
	ands r0, r2
	strb r0, [r1]
	adds r6, #1
	ldr r0, [r5]
	ldrb r0, [r0, #4]
	subs r0, #1
	movs r1, #0x34
	muls r0, r1, r0
	ldr r1, _080A0DD4  @ gCharacterData+0x2C
	adds r0, r0, r1
	ldr r0, [r0]
	ldrb r0, [r0, #0x15]
	cmp r6, r0
	blt _080A0D30
_080A0DAE:
	mov r1, sl
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
_080A0DB6:
	ldr r4, [sp, #0x8c]
	cmp r4, #0x3f
	bgt _080A0DBE
	b _080A0CBC
_080A0DBE:
	b _080A0EAE
	.align 2, 0
_080A0DC0: .4byte gUnknown_08A196FC
_080A0DC4: .4byte 0x01000600
_080A0DC8: .4byte gUnknown_020136F0
_080A0DCC: .4byte 0x01000010
_080A0DD0: .4byte 0x00010004
_080A0DD4: .4byte gCharacterData+0x2C
_080A0DD8:
	add r4, sp, #0x28
	adds r0, r4, #0
	bl LoadGeneralGameMetadata
	ldr r0, _080A0E50  @ 0x0000026A
	bl GetStringFromIndex
	bl SetTacticianName
	movs r6, #0
	add r0, sp, #0x28
	mov sl, r0
	ldr r1, _080A0E54  @ gCharacterData
	mov r8, r1
_080A0DF4:
	adds r0, r6, #0
	mov r1, sl
	bl GGM_IsCharacterKnown
	lsls r0, r0, #0x18
	adds r4, r6, #1
	cmp r0, #0
	beq _080A0EA8
	adds r0, r6, #0
	bl sub_80A1B6C
	cmp r0, #0
	beq _080A0EA8
	ldr r1, [r5]
	ldr r2, [r7]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	strb r6, [r0]
	ldr r0, [r5]
	ldr r2, [r7]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	subs r2, r6, #1
	movs r0, #0x34
	muls r0, r2, r0
	add r0, r8
	ldrb r0, [r0, #5]
	strb r0, [r1, #1]
	ldr r1, [r5]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	ldr r1, [r7]
	adds r1, r1, r0
	adds r1, #2
	adds r0, r6, #0
	mov r2, sl
	bl sub_80A35EC
	movs r0, #0
	mov r9, r0
	b _080A0E98
	.align 2, 0
_080A0E50: .4byte 0x0000026A
_080A0E54: .4byte gCharacterData
_080A0E58:
	ldr r0, [r5]
	mov r1, r9
	bl sub_80A0B20
	ldr r1, [r5]
	ldr r3, [r7]
	lsls r2, r1, #1
	adds r2, r2, r1
	lsls r2, r2, #3
	adds r2, r2, r3
	adds r2, #9
	add r2, r9
	subs r3, r0, #1
	movs r1, #0x34
	muls r1, r3, r1
	add r1, r8
	ldrb r1, [r1, #5]
	strb r1, [r2]
	add r1, sp, #0x28
	bl GGM_IsCharacterKnown
	ldr r2, [r5]
	ldr r3, [r7]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #3
	adds r1, r1, r3
	adds r1, #0x10
	add r1, r9
	strb r0, [r1]
	movs r1, #1
	add r9, r1
_080A0E98:
	adds r0, r6, #0
	bl sub_80A1B6C
	cmp r9, r0
	blt _080A0E58
	ldr r0, [r5]
	adds r0, #1
	str r0, [r5]
_080A0EA8:
	adds r6, r4, #0
	cmp r6, #0xff
	ble _080A0DF4
_080A0EAE:
	add sp, #0x90
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80A0C40

	THUMB_FUNC_START sub_80A0EC0
sub_80A0EC0: @ 0x080A0EC0
	push {r4, r5, lr}
	adds r0, #0x42
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _080A0EF4
	movs r4, #1
_080A0ED0:
	adds r0, r4, #0
	bl GetUnit
	adds r1, r0, #0
	cmp r1, #0
	beq _080A0EEC
	ldr r0, [r1]
	cmp r0, #0
	beq _080A0EEC
	adds r0, r1, #0
	bl GetUnitSMSId
	bl SMS_RegisterUsage
_080A0EEC:
	adds r4, #1
	cmp r4, #0x3f
	ble _080A0ED0
	b _080A0F1C
_080A0EF4:
	movs r4, #0
	ldr r0, _080A0F28  @ gUnknown_020136F0
	ldr r0, [r0]
	cmp r4, r0
	bge _080A0F1C
	movs r5, #0
_080A0F00:
	ldr r0, _080A0F2C  @ gUnknown_08A196FC
	ldr r0, [r0]
	adds r0, r5, r0
	ldrb r0, [r0, #1]
	bl GetClassSMSId
	bl SMS_RegisterUsage
	adds r5, #0x18
	adds r4, #1
	ldr r0, _080A0F28  @ gUnknown_020136F0
	ldr r0, [r0]
	cmp r4, r0
	blt _080A0F00
_080A0F1C:
	bl SMS_FlushIndirect
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A0F28: .4byte gUnknown_020136F0
_080A0F2C: .4byte gUnknown_08A196FC

	THUMB_FUNC_END sub_80A0EC0

	THUMB_FUNC_START sub_80A0F30
sub_80A0F30: @ 0x080A0F30
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	movs r6, #0
	movs r4, #0
	ldr r7, _080A0F3C  @ gCharacterData+0x2C
	b _080A0F4C
	.align 2, 0
_080A0F3C: .4byte gCharacterData+0x2C
_080A0F40:
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_80A0AD4
	adds r6, r6, r0
	adds r4, #1
_080A0F4C:
	adds r0, r5, #0
	bl sub_80A0B44
	subs r0, #1
	movs r1, #0x34
	muls r0, r1, r0
	adds r0, r0, r7
	ldr r0, [r0]
	ldrb r0, [r0, #0x15]
	cmp r4, r0
	blt _080A0F40
	adds r0, r6, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80A0F30

	THUMB_FUNC_START sub_80A0F6C
sub_80A0F6C: @ 0x080A0F6C
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	adds r6, r1, #0
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A0F88
	adds r0, r6, #0
	bl sub_80A0F30
	cmp r0, #5
	beq _080A0FCA
	b _080A0FD0
_080A0F88:
	movs r0, #0
	mov r8, r0
	adds r0, r6, #0
	bl sub_80A0F30
	mov r9, r0
	adds r0, r6, #0
	bl sub_80A0B44
	bl sub_80A1B6C
	adds r7, r0, #0
	movs r5, #0
	cmp r8, r7
	bge _080A0FC6
_080A0FA6:
	adds r0, r6, #0
	bl sub_80A0B44
	adds r4, r0, #0
	adds r0, r6, #0
	adds r1, r5, #0
	bl sub_80A0B20
	adds r1, r0, #0
	adds r0, r4, #0
	bl sub_80A3468
	add r8, r0
	adds r5, #1
	cmp r5, r7
	blt _080A0FA6
_080A0FC6:
	cmp r8, r9
	bne _080A0FCE
_080A0FCA:
	movs r0, #2
	b _080A0FDA
_080A0FCE:
	mov r0, r9
_080A0FD0:
	cmp r0, #0
	beq _080A0FD8
	movs r0, #1
	b _080A0FDA
_080A0FD8:
	movs r0, #0
_080A0FDA:
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80A0F6C

	THUMB_FUNC_START sub_80A0FE8
sub_80A0FE8: @ 0x080A0FE8
	push {r4, r5, r6, r7, lr}
	ldr r6, _080A10A4  @ gUnknown_02013590
	bl sub_80A3544
	adds r7, r0, #0
	adds r4, r6, #0
	subs r4, #8
	adds r0, r4, #0
	movs r1, #0x10
	bl Text_Init
	adds r0, r6, #0
	movs r1, #9
	bl Text_Init
	adds r0, r4, #0
	bl Text_Clear
	ldr r0, _080A10A8  @ 0x000005AD
	bl GetStringFromIndex
	adds r5, r0, #0
	movs r0, #0x80
	adds r1, r5, #0
	bl GetStringTextCenteredPos
	adds r1, r0, #0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	adds r0, r4, #0
	movs r2, #0
	adds r3, r5, #0
	bl Text_InsertString
	ldr r5, _080A10AC  @ gUnknown_02023136
	adds r0, r4, #0
	adds r1, r5, #0
	bl Text_Draw
	adds r0, r6, #0
	bl Text_Clear
	movs r4, #0
	cmp r7, #0x64
	bne _080A1044
	movs r4, #4
_080A1044:
	ldr r0, _080A10B0  @ 0x000005AA
	bl GetStringFromIndex
	adds r3, r0, #0
	adds r0, r6, #0
	movs r1, #0
	adds r2, r4, #0
	bl Text_InsertString
	adds r0, r6, #0
	movs r1, #0x34
	bl Text_SetXCursor
	movs r1, #2
	cmp r7, #0x64
	bne _080A1066
	movs r1, #4
_080A1066:
	adds r0, r6, #0
	bl Text_SetColorId
	adds r0, r6, #0
	adds r1, r7, #0
	bl Text_AppendNumberOr2Dashes
	movs r4, #0
	cmp r7, #0x64
	bne _080A107C
	movs r4, #4
_080A107C:
	ldr r0, _080A10B4  @ 0x000005AE
	bl GetStringFromIndex
	adds r3, r0, #0
	adds r0, r6, #0
	movs r1, #0x3c
	adds r2, r4, #0
	bl Text_InsertString
	ldr r0, _080A10B8  @ 0xFFFFFC18
	adds r1, r5, r0
	adds r0, r6, #0
	bl Text_Draw
	movs r0, #1
	bl BG_EnableSyncByMask
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A10A4: .4byte gUnknown_02013590
_080A10A8: .4byte 0x000005AD
_080A10AC: .4byte gUnknown_02023136
_080A10B0: .4byte 0x000005AA
_080A10B4: .4byte 0x000005AE
_080A10B8: .4byte 0xFFFFFC18

	THUMB_FUNC_END sub_80A0FE8

	THUMB_FUNC_START sub_80A10BC
sub_80A10BC: @ 0x080A10BC
	movs r1, #0
	str r1, [r0, #0x2c]
	adds r2, r0, #0
	adds r2, #0x40
	strb r1, [r2]
	str r1, [r0, #0x34]
	str r1, [r0, #0x38]
	subs r1, #1
	str r1, [r0, #0x3c]
	bx lr

	THUMB_FUNC_END sub_80A10BC

	THUMB_FUNC_START sub_80A10D0
sub_80A10D0: @ 0x080A10D0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080A10F0  @ gUnknown_08A1DD0C
	ldr r1, _080A10F4  @ 0x06017800
	bl CopyDataWithPossibleUncomp
	ldr r0, _080A10F8  @ gUnknown_08A1E0D8
	ldr r1, [r4, #0x34]
	adds r1, #0x10
	lsls r1, r1, #5
	movs r2, #0x20
	bl CopyToPaletteBuffer
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A10F0: .4byte gUnknown_08A1DD0C
_080A10F4: .4byte 0x06017800
_080A10F8: .4byte gUnknown_08A1E0D8

	THUMB_FUNC_END sub_80A10D0

	THUMB_FUNC_START sub_80A10FC
sub_80A10FC: @ 0x080A10FC
	push {r4, lr}
	sub sp, #4
	ldr r1, [r0, #0x2c]
	ldr r2, [r0, #0x30]
	ldr r3, _080A1138  @ gUnknown_08A19700
	ldr r0, [r0, #0x34]
	movs r4, #0xf
	ands r0, r4
	lsls r0, r0, #0xc
	movs r4, #0xfc
	lsls r4, r4, #4
	adds r0, r0, r4
	str r0, [sp]
	movs r0, #4
	bl PutSpriteExt
	ldr r3, _080A113C  @ gUnknown_08A19726
	movs r0, #0x87
	lsls r0, r0, #6
	str r0, [sp]
	movs r0, #4
	movs r1, #4
	movs r2, #0
	bl PutSpriteExt
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A1138: .4byte gUnknown_08A19700
_080A113C: .4byte gUnknown_08A19726

	THUMB_FUNC_END sub_80A10FC

	THUMB_FUNC_START sub_80A1140
sub_80A1140: @ 0x080A1140
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	adds r1, r3, #0
	ldr r0, _080A115C  @ gUnknown_08A1973C
	bl Proc_Start
	str r4, [r0, #0x2c]
	str r5, [r0, #0x30]
	str r6, [r0, #0x34]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A115C: .4byte gUnknown_08A1973C

	THUMB_FUNC_END sub_80A1140

	THUMB_FUNC_START sub_80A1160
sub_80A1160: @ 0x080A1160
	push {lr}
	ldr r0, _080A1170  @ gUnknown_08A1973C
	bl Proc_Find
	bl Proc_End
	pop {r0}
	bx r0
	.align 2, 0
_080A1170: .4byte gUnknown_08A1973C

	THUMB_FUNC_END sub_80A1160

	THUMB_FUNC_START sub_80A1174
sub_80A1174: @ 0x080A1174
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	mov r8, r0
	bl sub_80A0A94
	adds r7, r0, #0
	movs r6, #0
	cmp r6, r7
	bge _080A11CE
_080A118A:
	adds r0, r6, #0
	movs r1, #3
	bl __divsi3
	lsls r0, r0, #4
	mov r2, r8
	ldr r1, [r2, #0x34]
	subs r1, #0x24
	subs r5, r0, r1
	adds r0, r6, #0
	movs r1, #3
	bl __modsi3
	lsls r0, r0, #6
	adds r4, r0, #0
	adds r4, #0x18
	adds r0, r5, #0
	subs r0, #0x24
	cmp r0, #0x52
	bhi _080A11C8
	adds r0, r6, #0
	bl sub_80A0B58
	str r0, [sp]
	movs r0, #0
	adds r1, r4, #0
	adds r2, r5, #0
	movs r3, #0xc8
	lsls r3, r3, #8
	bl sub_8027C48
_080A11C8:
	adds r6, #1
	cmp r6, r7
	blt _080A118A
_080A11CE:
	bl SMS_FlushDirect
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80A1174

	THUMB_FUNC_START sub_80A11E0
sub_80A11E0: @ 0x080A11E0
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x3c]
	movs r1, #1
	negs r1, r1
	cmp r0, r1
	beq _080A1268
	str r0, [r4, #0x38]
	str r1, [r4, #0x3c]
	movs r1, #3
	bl __divsi3
	adds r1, r0, #0
	ldr r0, [r4, #0x34]
	cmp r0, #0
	bge _080A1202
	adds r0, #0xf
_080A1202:
	asrs r0, r0, #4
	subs r0, r1, r0
	lsls r0, r0, #4
	adds r0, #0x24
	cmp r0, #0x24
	bgt _080A121C
	cmp r1, #0
	bne _080A1216
	str r1, [r4, #0x34]
	b _080A121C
_080A1216:
	subs r0, r1, #1
	lsls r0, r0, #4
	str r0, [r4, #0x34]
_080A121C:
	ldr r0, [r4, #0x38]
	movs r1, #3
	bl __divsi3
	adds r5, r0, #0
	ldr r0, [r4, #0x34]
	cmp r0, #0
	bge _080A122E
	adds r0, #0xf
_080A122E:
	asrs r0, r0, #4
	subs r0, r5, r0
	lsls r0, r0, #4
	adds r0, #0x24
	cmp r0, #0x73
	ble _080A1268
	bl sub_80A0A94
	subs r0, #1
	movs r1, #3
	bl __divsi3
	cmp r5, r0
	bne _080A125A
	bl sub_80A0A94
	subs r0, #1
	movs r1, #3
	bl __divsi3
	subs r0, #5
	b _080A1264
_080A125A:
	ldr r0, [r4, #0x38]
	movs r1, #3
	bl __divsi3
	subs r0, #4
_080A1264:
	lsls r0, r0, #4
	str r0, [r4, #0x34]
_080A1268:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80A11E0

	THUMB_FUNC_START sub_80A1270
sub_80A1270: @ 0x080A1270
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r6, r0, #0
	ldr r7, _080A14D0  @ gLCDControlBuffer
	ldrb r1, [r7]
	movs r0, #8
	negs r0, r0
	ands r0, r1
	strb r0, [r7]
	movs r0, #0
	bl SetupBackgrounds
	movs r0, #0
	bl BG_GetMapBuffer
	movs r1, #0
	bl BG_Fill
	movs r0, #1
	bl BG_GetMapBuffer
	movs r1, #0
	bl BG_Fill
	movs r0, #2
	bl BG_GetMapBuffer
	movs r1, #0
	bl BG_Fill
	ldrb r2, [r7, #0xc]
	movs r1, #4
	negs r1, r1
	adds r0, r1, #0
	ands r0, r2
	strb r0, [r7, #0xc]
	ldrb r0, [r7, #0x10]
	movs r2, #3
	orrs r0, r2
	strb r0, [r7, #0x10]
	ldrb r0, [r7, #0x14]
	ands r1, r0
	movs r0, #1
	mov r9, r0
	mov r0, r9
	orrs r1, r0
	strb r1, [r7, #0x14]
	ldrb r0, [r7, #0x18]
	orrs r0, r2
	strb r0, [r7, #0x18]
	bl ResetFaces
	bl Font_InitForUIDefault
	bl ResetIconGraphics_
	movs r0, #0x80
	lsls r0, r0, #7
	movs r1, #1
	negs r1, r1
	bl LoadUiFrameGraphicsTo
	bl LoadObjUIGfx
	movs r0, #0xe
	bl LoadIconPalettes
	adds r0, r6, #0
	bl sub_80A11E0
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	movs r0, #1
	movs r1, #0
	movs r2, #2
	bl BG_SetPosition
	ldr r1, _080A14D4  @ 0x0000FFD8
	ldr r2, [r6, #0x34]
	subs r2, #0x24
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #2
	bl BG_SetPosition
	movs r5, #0
	str r5, [sp]
	adds r0, r6, #0
	movs r1, #0
	movs r2, #0x12
	movs r3, #2
	bl sub_8086CE8
	bl SetupMapSpritesPalettes
	bl SMS_ClearUsageTable
	adds r0, r6, #0
	bl sub_80A0EC0
	movs r0, #0xa0
	lsls r0, r0, #7
	movs r1, #5
	bl sub_8098C3C
	ldr r0, _080A14D8  @ gUnknown_08A1DB80
	ldr r4, _080A14DC  @ gGenericBuffer
	adds r1, r4, #0
	bl CopyDataWithPossibleUncomp
	ldr r0, _080A14E0  @ gUnknown_020235AA
	movs r2, #0x90
	lsls r2, r2, #5
	adds r1, r4, #0
	bl CallARM_FillTileRect
	ldr r0, _080A14E4  @ gUnknown_08A1A8E4
	ldr r1, _080A14E8  @ 0x06013800
	bl CopyDataWithPossibleUncomp
	ldr r0, _080A14EC  @ gUnknown_08A1B174
	movs r1, #0x90
	lsls r1, r1, #2
	movs r2, #0x20
	bl CopyToPaletteBuffer
	movs r0, #7
	bl BG_EnableSyncByMask
	ldrb r0, [r7, #1]
	movs r1, #0x20
	mov ip, r1
	mov r2, ip
	orrs r0, r2
	movs r1, #0x41
	negs r1, r1
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r7, #1]
	adds r0, r7, #0
	adds r0, #0x2d
	strb r5, [r0]
	adds r1, r7, #0
	adds r1, #0x31
	movs r0, #0x26
	strb r0, [r1]
	subs r1, #5
	movs r0, #0xf0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0x86
	strb r0, [r1]
	movs r0, #0x34
	adds r0, r0, r7
	mov r8, r0
	ldrb r1, [r0]
	mov r2, r9
	orrs r1, r2
	movs r2, #2
	orrs r1, r2
	movs r0, #4
	orrs r1, r0
	movs r4, #8
	orrs r1, r4
	movs r3, #0x10
	orrs r1, r3
	adds r5, r7, #0
	adds r5, #0x36
	ldrb r0, [r5]
	mov r7, r9
	orrs r0, r7
	orrs r0, r2
	movs r2, #5
	negs r2, r2
	ands r0, r2
	orrs r0, r4
	orrs r0, r3
	mov r2, ip
	orrs r1, r2
	mov r7, r8
	strb r1, [r7]
	orrs r0, r2
	strb r0, [r5]
	movs r0, #3
	movs r1, #0
	movs r2, #0
	movs r3, #0x10
	bl SetSpecialColorEffectsParameters
	movs r0, #1
	str r0, [sp]
	movs r1, #1
	movs r2, #1
	movs r3, #1
	bl SetBlendTargetA
	ldr r5, _080A14F0  @ gUnknown_02013498
	movs r4, #0x14
_080A140A:
	adds r0, r5, #0
	movs r1, #5
	bl Text_Init
	adds r5, #8
	subs r4, #1
	cmp r4, #0
	bge _080A140A
	bl sub_80A0FE8
	bl sub_80A0A94
	cmp r0, #0
	beq _080A1476
	adds r0, r6, #0
	bl ResetPrepScreenHandCursor
	movs r0, #0xc0
	lsls r0, r0, #3
	movs r1, #1
	bl sub_80AD4A0
	ldr r4, [r6, #0x38]
	adds r0, r4, #0
	movs r1, #3
	bl __modsi3
	lsls r0, r0, #6
	adds r5, r0, #0
	adds r5, #0x14
	adds r0, r4, #0
	movs r1, #3
	bl __divsi3
	ldr r1, [r6, #0x34]
	cmp r1, #0
	bge _080A1456
	adds r1, #0xf
_080A1456:
	asrs r1, r1, #4
	subs r1, r0, r1
	lsls r1, r1, #4
	adds r1, #0x24
	movs r3, #0x80
	lsls r3, r3, #4
	adds r0, r5, #0
	movs r2, #7
	bl sub_80AD51C
	movs r0, #0xc0
	movs r1, #1
	movs r2, #9
	adds r3, r6, #0
	bl StartHelpPromptSprite
_080A1476:
	movs r0, #0x88
	movs r1, #9
	movs r2, #0xb
	adds r3, r6, #0
	bl sub_80A1140
	ldr r0, _080A14F4  @ sub_80A1174
	adds r1, r6, #0
	bl StartParallelWorker
	movs r3, #0x80
	lsls r3, r3, #2
	movs r0, #4
	str r0, [sp]
	adds r0, r6, #0
	movs r1, #0xd8
	movs r2, #0x2d
	bl sub_8097748
	ldrh r4, [r6, #0x34]
	bl sub_80A0A94
	subs r0, #1
	movs r1, #3
	bl __divsi3
	adds r2, r0, #0
	adds r2, #1
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #0xa
	adds r1, r4, #0
	movs r3, #6
	bl sub_80976CC
	bl sub_8097668
	ldr r1, [r6, #0x34]
	cmp r1, #0
	bge _080A14C8
	adds r1, #0xf
_080A14C8:
	asrs r4, r1, #4
	adds r5, r6, #0
	adds r5, #0x43
	b _080A1502
	.align 2, 0
_080A14D0: .4byte gLCDControlBuffer
_080A14D4: .4byte 0x0000FFD8
_080A14D8: .4byte gUnknown_08A1DB80
_080A14DC: .4byte gGenericBuffer
_080A14E0: .4byte gUnknown_020235AA
_080A14E4: .4byte gUnknown_08A1A8E4
_080A14E8: .4byte 0x06013800
_080A14EC: .4byte gUnknown_08A1B174
_080A14F0: .4byte gUnknown_02013498
_080A14F4: .4byte sub_80A1174
_080A14F8:
	adds r0, r6, #0
	adds r1, r4, #0
	bl sub_80A199C
	adds r4, #1
_080A1502:
	ldr r0, [r6, #0x34]
	cmp r0, #0
	bge _080A150A
	adds r0, #0xf
_080A150A:
	asrs r0, r0, #4
	adds r0, #6
	cmp r4, r0
	blt _080A14F8
	adds r0, r6, #0
	bl NewGreenTextColorManager
	movs r0, #0
	strb r0, [r5]
	ldr r0, _080A154C  @ 0x06014800
	movs r1, #0xa
	bl LoadDialogueBoxGfx
	ldr r2, _080A1550  @ gLCDControlBuffer
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
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A154C: .4byte 0x06014800
_080A1550: .4byte gLCDControlBuffer

	THUMB_FUNC_END sub_80A1270

	THUMB_FUNC_START sub_80A1554
sub_80A1554: @ 0x080A1554
	push {r4, lr}
	adds r4, r0, #0
	bl sub_808F270
	adds r0, r4, #0
	bl EndAllProcChildren
	bl EndBG3Slider_
	movs r0, #0
	bl EndFaceById
	movs r0, #0
	bl SetPrimaryHBlankHandler
	bl sub_80A1160
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80A1554

	THUMB_FUNC_START sub_80A157C
sub_80A157C: @ 0x080A157C
	push {lr}
	sub sp, #4
	movs r0, #1
	movs r1, #0xe
	movs r2, #3
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	movs r0, #1
	str r0, [sp]
	movs r0, #0
	movs r1, #1
	movs r2, #0
	movs r3, #0
	bl SetBlendTargetA
	movs r0, #0
	str r0, [sp]
	movs r1, #0
	movs r2, #0
	movs r3, #1
	bl SetBlendTargetB
	add sp, #4
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80A157C

	THUMB_FUNC_START sub_80A15B0
sub_80A15B0: @ 0x080A15B0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	adds r6, r0, #0
	bl sub_80A0A94
	cmp r0, #0
	bne _080A15C6
	b _080A18D8
_080A15C6:
	adds r0, r6, #0
	adds r0, #0x40
	movs r7, #0
	ldrsb r7, [r0, r7]
	mov r8, r0
	cmp r7, #0
	beq _080A15D6
	b _080A1864
_080A15D6:
	ldr r0, [r6, #0x38]
	mov sl, r0
	ldr r4, _080A1620  @ gKeyStatusPtr
	ldr r2, [r4]
	ldrh r5, [r2, #6]
	adds r3, r6, #0
	adds r3, #0x41
	movs r0, #4
	strb r0, [r3]
	ldrh r1, [r2, #4]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080A15FA
	ldrh r5, [r2, #4]
	movs r0, #8
	strb r0, [r3]
_080A15FA:
	adds r0, r6, #0
	adds r0, #0x43
	movs r1, #0
	ldrsb r1, [r0, r1]
	mov r9, r0
	cmp r1, #0
	beq _080A1624
	ldr r0, [r4]
	ldrh r1, [r0, #8]
	movs r0, #0x81
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080A16DC
	bl CloseHelpBox
	mov r1, r9
	strb r7, [r1]
	b _080A1900
	.align 2, 0
_080A1620: .4byte gKeyStatusPtr
_080A1624:
	ldr r0, [r4]
	ldrh r1, [r0, #8]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080A1684
	ldr r7, [r6, #0x38]
	adds r0, r7, #0
	movs r1, #3
	bl __modsi3
	lsls r0, r0, #6
	adds r0, #0x14
	mov r8, r0
	adds r0, r7, #0
	movs r1, #3
	bl __divsi3
	adds r1, r0, #0
	ldr r0, [r6, #0x34]
	cmp r0, #0
	bge _080A1654
	adds r0, #0xf
_080A1654:
	asrs r4, r0, #4
	subs r4, r1, r4
	lsls r4, r4, #4
	adds r4, #0x24
	ldr r5, _080A1680  @ gCharacterData
	adds r0, r7, #0
	bl sub_80A0B44
	subs r0, #1
	movs r1, #0x34
	muls r0, r1, r0
	adds r0, r0, r5
	ldrh r2, [r0, #2]
	mov r0, r8
	adds r1, r4, #0
	bl StartHelpBox
	movs r0, #1
	mov r1, r9
	strb r0, [r1]
	b _080A1900
	.align 2, 0
_080A1680: .4byte gCharacterData
_080A1684:
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080A16B0
	adds r0, r6, #0
	movs r1, #2
	bl Proc_Goto
	ldr r0, _080A16AC  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	bge _080A16A2
	b _080A1900
_080A16A2:
	movs r0, #0x6a
	bl m4aSongNumStart
	b _080A1900
	.align 2, 0
_080A16AC: .4byte gRAMChapterData
_080A16B0:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080A16DC
	adds r0, r6, #0
	movs r1, #3
	bl Proc_Goto
	ldr r0, _080A16D8  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	bge _080A16CE
	b _080A1900
_080A16CE:
	movs r0, #0x6b
	bl m4aSongNumStart
	b _080A1900
	.align 2, 0
_080A16D8: .4byte gRAMChapterData
_080A16DC:
	movs r0, #0x20
	ands r0, r5
	cmp r0, #0
	beq _080A16F6
	ldr r4, [r6, #0x38]
	adds r0, r4, #0
	movs r1, #3
	bl __modsi3
	cmp r0, #0
	beq _080A16F6
	subs r0, r4, #1
	str r0, [r6, #0x38]
_080A16F6:
	movs r0, #0x10
	ands r0, r5
	cmp r0, #0
	beq _080A1722
	ldr r4, [r6, #0x38]
	adds r0, r4, #0
	movs r1, #3
	bl __modsi3
	cmp r0, #2
	beq _080A1722
	adds r0, r4, #1
	str r0, [r6, #0x38]
	bl sub_80A0A94
	ldr r1, [r6, #0x38]
	cmp r1, r0
	blt _080A1722
	bl sub_80A0A94
	subs r0, #1
	str r0, [r6, #0x38]
_080A1722:
	movs r0, #0x40
	ands r0, r5
	cmp r0, #0
	beq _080A1734
	ldr r0, [r6, #0x38]
	cmp r0, #2
	ble _080A1734
	subs r0, #3
	str r0, [r6, #0x38]
_080A1734:
	movs r0, #0x80
	ands r5, r0
	cmp r5, #0
	beq _080A174E
	ldr r4, [r6, #0x38]
	adds r4, #3
	bl sub_80A0A94
	cmp r4, r0
	bge _080A174E
	ldr r0, [r6, #0x38]
	adds r0, #3
	str r0, [r6, #0x38]
_080A174E:
	ldr r0, [r6, #0x38]
	cmp sl, r0
	bne _080A1756
	b _080A185A
_080A1756:
	movs r1, #3
	bl __divsi3
	adds r1, r0, #0
	ldr r0, [r6, #0x34]
	cmp r0, #0
	bge _080A1766
	adds r0, #0xf
_080A1766:
	asrs r0, r0, #4
	subs r0, r1, r0
	lsls r4, r0, #4
	movs r0, #0
	mov r1, r8
	strb r0, [r1]
	ldr r0, _080A17A4  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A1784
	movs r0, #0x65
	bl m4aSongNumStart
_080A1784:
	cmp r4, #0xf
	bgt _080A17A8
	ldr r1, [r6, #0x34]
	cmp r1, #0
	beq _080A17A8
	cmp r1, #0
	bge _080A1794
	adds r1, #0xf
_080A1794:
	asrs r1, r1, #4
	subs r1, #1
	adds r0, r6, #0
	bl sub_80A199C
	movs r0, #0xff
	b _080A17D4
	.align 2, 0
_080A17A4: .4byte gRAMChapterData
_080A17A8:
	cmp r4, #0x4f
	ble _080A17EA
	bl sub_80A0A94
	subs r0, #1
	movs r1, #3
	bl __divsi3
	subs r0, #5
	lsls r0, r0, #4
	ldr r1, [r6, #0x34]
	cmp r1, r0
	beq _080A17EA
	cmp r1, #0
	bge _080A17C8
	adds r1, #0xf
_080A17C8:
	asrs r1, r1, #4
	adds r1, #6
	adds r0, r6, #0
	bl sub_80A199C
	movs r0, #1
_080A17D4:
	mov r1, r8
	strb r0, [r1]
	ldr r0, [r6, #0x38]
	movs r1, #3
	bl __modsi3
	lsls r0, r0, #6
	adds r0, #0x14
	bl sub_80AD4E4
	b _080A1804
_080A17EA:
	ldr r0, [r6, #0x38]
	movs r1, #3
	bl __modsi3
	lsls r0, r0, #6
	adds r0, #0x14
	adds r1, r4, #0
	adds r1, #0x24
	movs r3, #0x80
	lsls r3, r3, #4
	movs r2, #7
	bl sub_80AD51C
_080A1804:
	mov r1, r9
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	beq _080A185A
	ldr r7, [r6, #0x38]
	adds r0, r7, #0
	movs r1, #3
	bl __modsi3
	lsls r0, r0, #6
	adds r0, #0x14
	mov r9, r0
	adds r0, r7, #0
	movs r1, #3
	bl __divsi3
	ldr r4, [r6, #0x34]
	cmp r4, #0
	bge _080A182E
	adds r4, #0xf
_080A182E:
	asrs r4, r4, #4
	subs r4, r0, r4
	lsls r4, r4, #4
	mov r1, r8
	movs r0, #0
	ldrsb r0, [r1, r0]
	lsls r0, r0, #4
	subs r0, #0x24
	subs r4, r4, r0
	ldr r5, _080A18D0  @ gCharacterData
	adds r0, r7, #0
	bl sub_80A0B44
	subs r0, #1
	movs r1, #0x34
	muls r0, r1, r0
	adds r0, r0, r5
	ldrh r2, [r0, #2]
	mov r0, r9
	adds r1, r4, #0
	bl StartHelpBox
_080A185A:
	mov r1, r8
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	beq _080A1900
_080A1864:
	mov r2, r8
	movs r0, #0
	ldrsb r0, [r2, r0]
	cmp r0, #0
	bge _080A187A
	adds r0, r6, #0
	adds r0, #0x41
	ldrb r1, [r0]
	ldr r0, [r6, #0x34]
	subs r0, r0, r1
	str r0, [r6, #0x34]
_080A187A:
	movs r0, #0
	ldrsb r0, [r2, r0]
	cmp r0, #0
	ble _080A188E
	adds r0, r6, #0
	adds r0, #0x41
	ldrb r1, [r0]
	ldr r0, [r6, #0x34]
	adds r0, r0, r1
	str r0, [r6, #0x34]
_080A188E:
	ldr r1, [r6, #0x34]
	movs r0, #0xf
	ands r1, r0
	cmp r1, #0
	bne _080A189C
	mov r0, r8
	strb r1, [r0]
_080A189C:
	ldrh r4, [r6, #0x34]
	bl sub_80A0A94
	subs r0, #1
	movs r1, #3
	bl __divsi3
	adds r2, r0, #0
	adds r2, #1
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #0xa
	adds r1, r4, #0
	movs r3, #6
	bl sub_80976CC
	ldr r1, _080A18D4  @ 0x0000FFD8
	ldr r2, [r6, #0x34]
	subs r2, #0x24
	movs r0, #0xff
	ands r2, r0
	movs r0, #2
	bl BG_SetPosition
	b _080A1900
	.align 2, 0
_080A18D0: .4byte gCharacterData
_080A18D4: .4byte 0x0000FFD8
_080A18D8:
	ldr r0, _080A1910  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080A1900
	adds r0, r6, #0
	movs r1, #3
	bl Proc_Goto
	ldr r0, _080A1914  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A1900
	movs r0, #0x6b
	bl m4aSongNumStart
_080A1900:
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A1910: .4byte gKeyStatusPtr
_080A1914: .4byte gRAMChapterData

	THUMB_FUNC_END sub_80A15B0

	THUMB_FUNC_START sub_80A1918
sub_80A1918: @ 0x080A1918
	push {lr}
	adds r2, r0, #0
	adds r0, #0x42
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldr r1, [r2, #0x38]
	bl sub_80A2C08
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80A1918

	THUMB_FUNC_START sub_80A1930
sub_80A1930: @ 0x080A1930
	push {lr}
	sub sp, #4
	adds r0, #0x42
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _080A1952
	movs r1, #0x80
	lsls r1, r1, #1
	str r0, [sp]
	movs r0, #0x43
	movs r2, #0xc0
	movs r3, #0x18
	bl sub_80029E8
	b _080A1964
_080A1952:
	movs r2, #0x80
	lsls r2, r2, #1
	movs r0, #0
	str r0, [sp]
	movs r0, #0x34
	adds r1, r2, #0
	movs r3, #0x18
	bl sub_80029E8
_080A1964:
	add sp, #4
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80A1930

	THUMB_FUNC_START sub_80A196C
sub_80A196C: @ 0x080A196C
	push {lr}
	adds r1, r0, #0
	ldr r0, _080A1980  @ gUnknown_08A1975C
	bl Proc_StartBlocking
	adds r0, #0x42
	movs r1, #1
	strb r1, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_080A1980: .4byte gUnknown_08A1975C

	THUMB_FUNC_END sub_80A196C

	THUMB_FUNC_START sub_80A1984
sub_80A1984: @ 0x080A1984
	push {lr}
	adds r1, r0, #0
	ldr r0, _080A1998  @ gUnknown_08A1975C
	bl Proc_StartBlocking
	adds r0, #0x42
	movs r1, #0
	strb r1, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_080A1998: .4byte gUnknown_08A1975C

	THUMB_FUNC_END sub_80A1984

	THUMB_FUNC_START sub_80A199C
sub_80A199C: @ 0x080A199C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	str r0, [sp]
	mov sl, r1
	movs r0, #0
	bl SetFontGlyphSet
	movs r0, #0
	bl SetFont
	mov r0, sl
	lsls r4, r0, #1
	add r4, sl
	adds r0, r4, #0
	movs r1, #0x15
	bl __modsi3
	lsls r0, r0, #3
	ldr r1, _080A1A10  @ gUnknown_02013498
	adds r5, r0, r1
	movs r7, #0
	adds r6, r4, #0
_080A19D0:
	adds r0, r5, #0
	bl Text_Clear
	bl sub_80A0A94
	cmp r6, r0
	bge _080A1A66
	adds r0, r7, #0
	movs r1, #3
	bl __modsi3
	lsls r0, r0, #3
	mov r8, r0
	mov r1, sl
	lsls r4, r1, #1
	movs r0, #0x1f
	ands r4, r0
	ldr r0, [sp]
	adds r0, #0x42
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r1, r6, #0
	bl sub_80A0F6C
	cmp r0, #1
	beq _080A1A1E
	cmp r0, #1
	bgt _080A1A14
	cmp r0, #0
	beq _080A1A1A
	b _080A1A28
	.align 2, 0
_080A1A10: .4byte gUnknown_02013498
_080A1A14:
	cmp r0, #2
	beq _080A1A24
	b _080A1A28
_080A1A1A:
	movs r0, #1
	b _080A1A26
_080A1A1E:
	movs r1, #0
	mov r9, r1
	b _080A1A28
_080A1A24:
	movs r0, #4
_080A1A26:
	mov r9, r0
_080A1A28:
	adds r0, r5, #0
	movs r1, #0
	bl Text_SetXCursor
	adds r0, r5, #0
	mov r1, r9
	bl Text_SetColorId
	adds r0, r6, #0
	bl sub_80A0B44
	subs r0, #1
	movs r1, #0x34
	muls r0, r1, r0
	ldr r1, _080A1A88  @ gCharacterData
	adds r0, r0, r1
	ldrh r0, [r0]
	bl GetStringFromIndex
	adds r1, r0, #0
	adds r0, r5, #0
	bl Text_AppendString
	lsls r1, r4, #5
	add r1, r8
	lsls r1, r1, #1
	ldr r0, _080A1A8C  @ gBG2TilemapBuffer
	adds r1, r1, r0
	adds r0, r5, #0
	bl Text_Draw
_080A1A66:
	adds r5, #8
	adds r6, #1
	adds r7, #1
	cmp r7, #2
	ble _080A19D0
	movs r0, #4
	bl BG_EnableSyncByMask
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A1A88: .4byte gCharacterData
_080A1A8C: .4byte gBG2TilemapBuffer

	THUMB_FUNC_END sub_80A199C

	THUMB_FUNC_START sub_80A1A90
sub_80A1A90: @ 0x080A1A90
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080A1AA8  @ gUnknown_08A1975C
	bl Proc_Find
	cmp r0, #0
	beq _080A1AA0
	str r4, [r0, #0x3c]
_080A1AA0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A1AA8: .4byte gUnknown_08A1975C

	THUMB_FUNC_END sub_80A1A90

	THUMB_FUNC_START sub_80A1AAC
sub_80A1AAC: @ 0x080A1AAC
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r5, r0, #0
	adds r6, r1, #0
	mov r8, r2
	bl sub_80A0B44
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_80A0B20
	adds r2, r0, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	movs r0, #0
	adds r1, r4, #0
	mov r3, r8
	bl sub_8083790
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80A1AAC

	THUMB_FUNC_START sub_80A1AE4
sub_80A1AE4: @ 0x080A1AE4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	movs r0, #0
	ldr r1, _080A1B58  @ gBG1TilemapBuffer
	mov sl, r1
	ldr r6, _080A1B5C  @ gBG2TilemapBuffer
	mov r9, r6
	ldr r7, _080A1B60  @ gUnknown_020136F4
	ldr r1, _080A1B64  @ gBG0TilemapBuffer
	mov r8, r1
	movs r6, #0x80
	lsls r6, r6, #4
	adds r6, r6, r7
	mov ip, r6
_080A1B08:
	adds r1, r0, #1
	str r1, [sp]
	lsls r0, r0, #1
	ldr r6, _080A1B68  @ gUnknown_020146F4
	adds r4, r0, r6
	adds r3, r0, r7
	adds r2, r0, #0
	movs r5, #0x13
_080A1B18:
	mov r1, r8
	adds r0, r2, r1
	ldrh r0, [r0]
	strh r0, [r3]
	mov r6, ip
	adds r1, r2, r6
	mov r6, sl
	adds r0, r2, r6
	ldrh r0, [r0]
	strh r0, [r1]
	mov r1, r9
	adds r0, r2, r1
	ldrh r0, [r0]
	strh r0, [r4]
	adds r4, #0x40
	adds r3, #0x40
	adds r2, #0x40
	subs r5, #1
	cmp r5, #0
	bge _080A1B18
	ldr r0, [sp]
	cmp r0, #0x1d
	ble _080A1B08
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A1B58: .4byte gBG1TilemapBuffer
_080A1B5C: .4byte gBG2TilemapBuffer
_080A1B60: .4byte gUnknown_020136F4
_080A1B64: .4byte gBG0TilemapBuffer
_080A1B68: .4byte gUnknown_020146F4

	THUMB_FUNC_END sub_80A1AE4

	THUMB_FUNC_START sub_80A1B6C
sub_80A1B6C: @ 0x080A1B6C
	push {lr}
	ldr r2, _080A1B84  @ gCharacterData
	subs r0, #1
	movs r1, #0x34
	muls r0, r1, r0
	adds r2, #0x2c
	adds r0, r0, r2
	ldr r0, [r0]
	cmp r0, #0
	beq _080A1B88
	ldrb r0, [r0, #0x15]
	b _080A1B8A
	.align 2, 0
_080A1B84: .4byte gCharacterData
_080A1B88:
	movs r0, #0
_080A1B8A:
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80A1B6C

	THUMB_FUNC_START sub_80A1B90
sub_80A1B90: @ 0x080A1B90
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r6, r0, #0
	ldr r1, [r6, #0x30]
	adds r1, #0x80
	ldr r4, _080A1C6C  @ 0x000001FF
	ands r1, r4
	ldr r3, _080A1C70  @ gUnknown_08A1983C
	movs r0, #0x8f
	lsls r0, r0, #6
	str r0, [sp]
	movs r0, #4
	movs r2, #8
	bl PutSpriteExt
	ldr r1, [r6, #0x30]
	adds r1, #0x20
	ands r1, r4
	ldr r3, _080A1C74  @ gUnknown_08A19850
	ldr r5, _080A1C78  @ 0x0000E280
	str r5, [sp]
	movs r0, #4
	movs r2, #0x50
	bl PutSpriteExt
	ldr r1, [r6, #0x30]
	adds r1, #5
	ands r1, r4
	ldr r3, _080A1C7C  @ gUnknown_08A19700
	ldr r0, _080A1C80  @ 0x0000ABC0
	str r0, [sp]
	movs r0, #4
	movs r2, #0x67
	bl PutSpriteExt
	ldr r1, [r6, #0x30]
	adds r1, #0x14
	ands r1, r4
	ldr r3, _080A1C84  @ gUnknown_08A1985E
	str r5, [sp]
	movs r0, #4
	movs r2, #0x6f
	bl PutSpriteExt
	ldr r1, [r6, #0x30]
	adds r1, #0xc
	ands r1, r4
	ldr r3, _080A1C88  @ gUnknown_08A19872
	movs r0, #0xaf
	lsls r0, r0, #6
	str r0, [sp]
	movs r0, #4
	movs r2, #0x90
	bl PutSpriteExt
	ldr r0, [r6, #0x30]
	adds r7, r0, #0
	adds r7, #0x70
	ands r7, r4
	ldr r0, [r6, #0x34]
	adds r2, r0, #0
	adds r2, #0x16
	movs r4, #0
	adds r0, r6, #0
	adds r0, #0x3c
	ldrb r0, [r0]
	cmp r4, r0
	bge _080A1C60
	adds r5, r2, #0
_080A1C1A:
	movs r3, #0xc0
	lsls r3, r3, #8
	adds r0, r6, #0
	adds r0, #0x3f
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0
	bne _080A1C2E
	movs r3, #0xd0
	lsls r3, r3, #8
_080A1C2E:
	cmp r0, #2
	bne _080A1C36
	movs r3, #0xf0
	lsls r3, r3, #8
_080A1C36:
	movs r1, #0xc0
	lsls r1, r1, #4
	adds r0, r1, #0
	orrs r3, r0
	adds r0, r6, #0
	adds r0, #0x4d
	adds r0, r0, r4
	ldrb r0, [r0]
	str r0, [sp]
	movs r0, #0
	adds r1, r7, #0
	adds r2, r5, #0
	bl sub_8027C48
	adds r5, #0x10
	adds r4, #1
	adds r0, r6, #0
	adds r0, #0x3c
	ldrb r0, [r0]
	cmp r4, r0
	blt _080A1C1A
_080A1C60:
	bl SMS_FlushDirect
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A1C6C: .4byte 0x000001FF
_080A1C70: .4byte gUnknown_08A1983C
_080A1C74: .4byte gUnknown_08A19850
_080A1C78: .4byte 0x0000E280
_080A1C7C: .4byte gUnknown_08A19700
_080A1C80: .4byte 0x0000ABC0
_080A1C84: .4byte gUnknown_08A1985E
_080A1C88: .4byte gUnknown_08A19872

	THUMB_FUNC_END sub_80A1B90

	THUMB_FUNC_START sub_80A1C8C
sub_80A1C8C: @ 0x080A1C8C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x24
	mov r9, r0
	mov sl, r1
	add r1, sp, #8
	ldr r0, _080A1D20  @ gUnknown_08205C90
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	mov r0, r9
	adds r0, #0x3f
	mov r1, sl
	adds r4, r0, r1
	ldrb r0, [r4]
	cmp r0, #0
	bne _080A1D28
	movs r5, #0
	lsls r1, r1, #1
	mov r8, r1
	mov r0, r8
	adds r0, #3
	lsls r0, r0, #5
	adds r0, #0x10
	ldr r1, _080A1D24  @ gBG2TilemapBuffer
	lsls r0, r0, #1
	adds r4, r0, r1
_080A1CC6:
	adds r0, r4, #0
	movs r1, #1
	movs r2, #0x14
	bl sub_8004B0C
	adds r4, #2
	adds r5, #1
	cmp r5, #4
	ble _080A1CC6
	movs r5, #0
	mov r0, r8
	adds r0, #3
	lsls r0, r0, #5
	adds r0, #0x16
	ldr r1, _080A1D24  @ gBG2TilemapBuffer
	lsls r0, r0, #1
	adds r4, r0, r1
_080A1CE8:
	adds r0, r4, #0
	movs r1, #1
	movs r2, #0x14
	bl sub_8004B0C
	adds r4, #2
	adds r5, #1
	cmp r5, #1
	ble _080A1CE8
	movs r5, #0
	mov r0, r8
	adds r0, #3
	lsls r0, r0, #5
	adds r0, #0x19
	ldr r1, _080A1D24  @ gBG2TilemapBuffer
	lsls r0, r0, #1
	adds r4, r0, r1
_080A1D0A:
	adds r0, r4, #0
	movs r1, #1
	movs r2, #0x14
	bl sub_8004B0C
	adds r4, #2
	adds r5, #1
	cmp r5, #2
	ble _080A1D0A
	b _080A1E68
	.align 2, 0
_080A1D20: .4byte gUnknown_08205C90
_080A1D24: .4byte gBG2TilemapBuffer
_080A1D28:
	movs r7, #0
	mov r2, r9
	ldr r0, [r2, #0x2c]
	bl sub_80A0B44
	str r0, [sp, #0x14]
	mov r3, r9
	ldr r0, [r3, #0x2c]
	mov r1, sl
	bl sub_80A0B20
	str r0, [sp, #0x18]
	ldrb r0, [r4]
	cmp r0, #2
	bne _080A1D48
	movs r7, #1
_080A1D48:
	mov r4, r9
	ldr r0, [r4, #0x2c]
	mov r1, sl
	bl sub_80A0B20
	subs r0, #1
	movs r6, #0x34
	muls r0, r6, r0
	ldr r1, _080A1DD8  @ gCharacterData
	adds r0, r0, r1
	ldrh r0, [r0]
	bl GetStringFromIndex
	mov r2, sl
	lsls r2, r2, #1
	mov r8, r2
	mov r4, r8
	adds r4, #3
	lsls r3, r4, #5
	str r3, [sp, #0x1c]
	lsls r4, r4, #6
	ldr r5, _080A1DDC  @ gUnknown_02023CC8
	adds r1, r4, r5
	movs r2, #5
	str r2, [sp]
	str r0, [sp, #4]
	movs r0, #0
	adds r2, r7, #0
	movs r3, #0
	bl DrawTextInline
	adds r5, #0xc
	adds r4, r4, r5
	mov r1, r9
	ldr r0, [r1, #0x2c]
	mov r1, sl
	bl sub_80A0B20
	subs r0, #1
	muls r0, r6, r0
	ldr r2, _080A1DD8  @ gCharacterData
	adds r0, r0, r2
	ldrb r1, [r0, #9]
	adds r1, #0x79
	movs r2, #0xe0
	lsls r2, r2, #8
	adds r0, r4, #0
	bl DrawIcon
	ldr r0, [sp, #0x14]
	ldr r1, [sp, #0x18]
	bl sub_80A3468
	cmp r0, #2
	bne _080A1E24
	movs r5, #0
	mov r0, r9
	adds r0, #0x46
	mov r3, sl
	adds r6, r0, r3
	ldr r0, [sp, #0x1c]
	adds r0, #0x19
	add r4, sp, #8
	mov r9, r4
	lsls r4, r0, #1
_080A1DCA:
	movs r7, #1
	ldrb r0, [r6]
	cmp r0, #2
	bne _080A1DE0
	movs r7, #4
	b _080A1DE8
	.align 2, 0
_080A1DD8: .4byte gCharacterData
_080A1DDC: .4byte gUnknown_02023CC8
_080A1DE0:
	ldrb r0, [r6]
	cmp r0, r5
	ble _080A1DE8
	movs r7, #0
_080A1DE8:
	ldr r3, _080A1E20  @ gBG2TilemapBuffer
	adds r0, r4, r3
	mov r1, r9
	adds r1, #4
	mov r9, r1
	subs r1, #4
	ldm r1!, {r2}
	adds r1, r7, #0
	str r3, [sp, #0x20]
	bl sub_8004B0C
	adds r4, #2
	adds r5, #1
	ldr r3, [sp, #0x20]
	cmp r5, #1
	ble _080A1DCA
	mov r0, r8
	adds r0, #3
	lsls r0, r0, #6
	adds r1, r3, #0
	adds r1, #0x36
	adds r0, r0, r1
	movs r1, #1
	movs r2, #0x14
	bl sub_8004B0C
	b _080A1E68
	.align 2, 0
_080A1E20: .4byte gBG2TilemapBuffer
_080A1E24:
	movs r5, #0
	mov r0, r9
	adds r0, #0x46
	mov r2, sl
	adds r6, r0, r2
	ldr r0, [sp, #0x1c]
	adds r0, #0x19
	add r3, sp, #8
	mov r8, r3
	lsls r4, r0, #1
_080A1E38:
	movs r7, #1
	ldrb r0, [r6]
	cmp r0, #3
	bne _080A1E44
	movs r7, #4
	b _080A1E4C
_080A1E44:
	ldrb r0, [r6]
	cmp r0, r5
	ble _080A1E4C
	movs r7, #0
_080A1E4C:
	ldr r0, _080A1E78  @ gBG2TilemapBuffer
	adds r0, r4, r0
	mov r1, r8
	adds r1, #4
	mov r8, r1
	subs r1, #4
	ldm r1!, {r2}
	adds r1, r7, #0
	bl sub_8004B0C
	adds r4, #2
	adds r5, #1
	cmp r5, #2
	ble _080A1E38
_080A1E68:
	add sp, #0x24
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A1E78: .4byte gBG2TilemapBuffer

	THUMB_FUNC_END sub_80A1C8C

	THUMB_FUNC_START sub_80A1E7C
sub_80A1E7C: @ 0x080A1E7C
	push {r4, r5, r6, lr}
	sub sp, #0x20
	adds r5, r0, #0
	ldr r1, _080A1F54  @ 0x06015000
	mov r0, sp
	movs r2, #0xe
	bl InitSomeOtherGraphicsRelatedStruct
	ldr r0, _080A1F58  @ Pal_UIFont
	movs r1, #0xf0
	lsls r1, r1, #2
	movs r2, #0x20
	bl CopyToPaletteBuffer
	add r6, sp, #0x18
	adds r0, r6, #0
	bl Text_Init3
	mov r0, sp
	bl SetFont
	movs r0, #0
	bl SetFontGlyphSet
	adds r0, r6, #0
	movs r1, #0
	bl Text_80046B4
	ldr r4, _080A1F5C  @ gCharacterData
	ldr r0, [r5, #0x2c]
	bl sub_80A0B44
	subs r0, #1
	movs r1, #0x34
	muls r0, r1, r0
	adds r0, r0, r4
	ldrh r0, [r0]
	bl GetStringFromIndex
	adds r4, r0, #0
	movs r0, #0x28
	adds r1, r4, #0
	bl GetStringTextCenteredPos
	adds r1, r0, #0
	adds r0, r6, #0
	movs r2, #0
	adds r3, r4, #0
	bl Text_InsertString
	movs r4, #0
	adds r5, #0x3d
	ldrb r0, [r5]
	cmp r0, #0
	bne _080A1EEC
	movs r4, #1
_080A1EEC:
	ldr r0, _080A1F60  @ 0x000005AB
	bl GetStringFromIndex
	adds r3, r0, #0
	adds r0, r6, #0
	movs r1, #0x30
	adds r2, r4, #0
	bl Text_InsertString
	movs r4, #0
	ldrb r0, [r5]
	cmp r0, #0
	bne _080A1F08
	movs r4, #1
_080A1F08:
	ldr r0, _080A1F64  @ 0x000005AC
	bl GetStringFromIndex
	adds r3, r0, #0
	adds r0, r6, #0
	movs r1, #0x60
	adds r2, r4, #0
	bl Text_InsertString
	ldrb r0, [r5]
	bl sub_80AEBEC
	adds r1, r0, #0
	lsls r1, r1, #3
	adds r1, #0x60
	adds r0, r6, #0
	bl Text_SetXCursor
	ldrb r0, [r5]
	movs r1, #2
	cmp r0, #0
	bne _080A1F36
	movs r1, #1
_080A1F36:
	adds r0, r6, #0
	bl Text_SetColorId
	ldrb r1, [r5]
	adds r0, r6, #0
	bl Text_AppendNumberOr2Dashes
	movs r0, #0
	bl SetFont
	add sp, #0x20
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A1F54: .4byte 0x06015000
_080A1F58: .4byte Pal_UIFont
_080A1F5C: .4byte gCharacterData
_080A1F60: .4byte 0x000005AB
_080A1F64: .4byte 0x000005AC

	THUMB_FUNC_END sub_80A1E7C

	THUMB_FUNC_START sub_80A1F68
sub_80A1F68: @ 0x080A1F68
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	adds r6, r0, #0
	adds r0, #0x38
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _080A1FF4
	movs r4, #0
	adds r0, r6, #0
	adds r0, #0x3c
	mov r8, r0
	ldrb r0, [r0]
	cmp r4, r0
	bge _080A203E
	movs r1, #0x3f
	adds r1, r1, r6
	mov sl, r1
_080A1F94:
	ldr r0, [r6, #0x2c]
	adds r1, r4, #0
	bl sub_80A0B20
	adds r7, r0, #0
	mov r2, sl
	adds r1, r2, r4
	movs r0, #0
	strb r0, [r1]
	movs r5, #1
	adds r4, #1
	mov r9, r4
	adds r4, r1, #0
_080A1FAE:
	adds r0, r5, #0
	bl GetUnit
	adds r1, r0, #0
	cmp r1, #0
	beq _080A1FE2
	ldr r0, [r1]
	cmp r0, #0
	beq _080A1FE2
	ldrb r0, [r0, #4]
	cmp r0, r7
	bne _080A1FE2
	ldr r1, [r1, #0xc]
	movs r0, #0x80
	lsls r0, r0, #9
	ands r0, r1
	cmp r0, #0
	bne _080A1FE2
	movs r0, #4
	ands r1, r0
	cmp r1, #0
	beq _080A1FDE
	movs r0, #2
	b _080A1FE0
_080A1FDE:
	movs r0, #1
_080A1FE0:
	strb r0, [r4]
_080A1FE2:
	adds r5, #1
	cmp r5, #0x3f
	ble _080A1FAE
	mov r4, r9
	mov r0, r8
	ldrb r0, [r0]
	cmp r4, r0
	blt _080A1F94
	b _080A203E
_080A1FF4:
	adds r1, r6, #0
	adds r1, #0x3b
	strb r0, [r1]
	movs r4, #0
	adds r0, r6, #0
	adds r0, #0x3c
	mov r8, r0
	ldrb r2, [r0]
	cmp r4, r2
	bge _080A203E
	adds r7, r1, #0
_080A200A:
	adds r0, r6, #0
	adds r0, #0x3f
	adds r5, r0, r4
	movs r0, #0
	strb r0, [r5]
	ldr r0, [r6, #0x2c]
	adds r1, r4, #0
	bl sub_80A0B04
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A2034
	movs r0, #1
	strb r0, [r5]
	ldr r0, [r6, #0x2c]
	adds r1, r4, #0
	bl sub_80A0AD4
	ldrb r1, [r7]
	adds r1, r1, r0
	strb r1, [r7]
_080A2034:
	adds r4, #1
	mov r0, r8
	ldrb r0, [r0]
	cmp r4, r0
	blt _080A200A
_080A203E:
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80A1F68

	THUMB_FUNC_START sub_80A204C
sub_80A204C: @ 0x080A204C
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	movs r4, #0
	adds r0, #0x3c
	ldrb r1, [r0]
	cmp r4, r1
	bge _080A2074
	adds r7, r5, #0
	adds r7, #0x46
	adds r6, r0, #0
_080A2060:
	ldr r0, [r5, #0x2c]
	adds r1, r4, #0
	bl sub_80A0AD4
	adds r1, r7, r4
	strb r0, [r1]
	adds r4, #1
	ldrb r0, [r6]
	cmp r4, r0
	blt _080A2060
_080A2074:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80A204C

	THUMB_FUNC_START sub_80A207C
sub_80A207C: @ 0x080A207C
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	adds r4, r0, #0
	adds r0, #0x38
	movs r5, #0
	ldrsb r5, [r0, r5]
	cmp r5, #0
	beq _080A20A2
	ldr r0, [r4, #0x2c]
	bl sub_80A0F30
	movs r1, #5
	subs r1, r1, r0
	adds r0, r4, #0
	adds r0, #0x3d
	strb r1, [r0]
	b _080A20EE
_080A20A2:
	ldr r0, [r4, #0x2c]
	bl sub_80A0B44
	mov r9, r0
	adds r1, r4, #0
	adds r1, #0x3d
	strb r5, [r1]
	movs r5, #0
	adds r0, r4, #0
	adds r0, #0x3c
	mov r8, r1
	adds r7, r0, #0
	ldrb r0, [r7]
	cmp r5, r0
	bge _080A20E0
	mov r6, r8
_080A20C2:
	ldr r0, [r4, #0x2c]
	adds r1, r5, #0
	bl sub_80A0B20
	adds r1, r0, #0
	mov r0, r9
	bl sub_80A3468
	ldrb r1, [r6]
	adds r1, r1, r0
	strb r1, [r6]
	adds r5, #1
	ldrb r2, [r7]
	cmp r5, r2
	blt _080A20C2
_080A20E0:
	ldr r0, [r4, #0x2c]
	bl sub_80A0F30
	mov r2, r8
	ldrb r1, [r2]
	subs r1, r1, r0
	strb r1, [r2]
_080A20EE:
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80A207C

	THUMB_FUNC_START sub_80A20FC
sub_80A20FC: @ 0x080A20FC
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	bl SMS_ClearUsageTable
	movs r4, #0
	b _080A2124
_080A2108:
	ldr r0, [r5, #0x2c]
	adds r1, r4, #0
	bl sub_80A0AEC
	adds r1, r5, #0
	adds r1, #0x4d
	adds r1, r1, r4
	strb r0, [r1]
	ldrb r0, [r1]
	bl GetClassSMSId
	bl SMS_RegisterUsage
	adds r4, #1
_080A2124:
	adds r0, r5, #0
	adds r0, #0x3c
	ldrb r0, [r0]
	cmp r4, r0
	blt _080A2108
	bl SMS_FlushIndirect
	movs r4, #0
	adds r0, r5, #0
	adds r0, #0x3c
	adds r6, r0, #0
	b _080A2146
_080A213C:
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_80A1C8C
	adds r4, #1
_080A2146:
	ldrb r0, [r6]
	cmp r4, r0
	blt _080A213C
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80A20FC

	THUMB_FUNC_START sub_80A2154
sub_80A2154: @ 0x080A2154
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r5, r1, #0
	adds r4, r2, #0
_080A215C:
	cmp r5, #0
	blt _080A21C8
	adds r0, r7, #0
	adds r0, #0x3c
	ldrb r0, [r0]
	subs r0, #1
	cmp r5, r0
	bgt _080A21C8
	adds r0, r7, #0
	adds r0, #0x3f
	adds r0, r0, r5
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080A21C4
	ldr r0, [r7, #0x2c]
	adds r1, r5, #0
	bl sub_80A0AD4
	cmp r0, #0
	ble _080A21C4
	adds r6, r7, #0
	adds r6, #0x39
	ldrb r0, [r6]
	movs r1, #0xe3
	ands r1, r0
	movs r2, #7
	adds r0, r5, #0
	ands r0, r2
	lsls r0, r0, #2
	adds r1, r1, r0
	strb r1, [r6]
	movs r4, #3
	ands r4, r1
	ldr r0, [r7, #0x2c]
	adds r1, r5, #0
	bl sub_80A0AD4
	cmp r4, r0
	blt _080A21C8
	ldr r0, [r7, #0x2c]
	adds r1, r5, #0
	bl sub_80A0AD4
	ldrb r2, [r6]
	movs r1, #0xfc
	ands r1, r2
	subs r0, #1
	adds r1, r1, r0
	strb r1, [r6]
	b _080A21C8
_080A21C4:
	adds r5, r5, r4
	b _080A215C
_080A21C8:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80A2154

	THUMB_FUNC_START sub_80A21D0
sub_80A21D0: @ 0x080A21D0
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0
	str r0, [r4, #0x30]
	str r0, [r4, #0x34]
	adds r2, r4, #0
	adds r2, #0x39
	ldrb r1, [r2]
	movs r0, #0xfc
	ands r0, r1
	movs r1, #0xe3
	ands r0, r1
	strb r0, [r2]
	ldr r0, [r4, #0x2c]
	bl sub_80A0B44
	bl sub_80A1B6C
	adds r1, r4, #0
	adds r1, #0x3c
	strb r0, [r1]
	adds r0, r4, #0
	bl sub_80A1F68
	adds r0, r4, #0
	bl sub_80A204C
	adds r0, r4, #0
	bl sub_80A207C
	adds r0, r4, #0
	movs r1, #0
	movs r2, #1
	bl sub_80A2154
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80A21D0

	THUMB_FUNC_START sub_80A221C
sub_80A221C: @ 0x080A221C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r3, _080A2270  @ gUnknown_02022C28
	adds r5, r3, #0
	adds r5, #0x20
	movs r0, #0x1f
	mov r8, r0
	movs r7, #0xf8
	lsls r7, r7, #2
	movs r6, #0xf8
	lsls r6, r6, #7
	movs r4, #0xf
	movs r0, #0x1f
	mov ip, r0
_080A223A:
	ldrh r2, [r3]
	mov r1, ip
	ands r1, r2
	lsrs r1, r1, #1
	mov r0, r8
	ands r1, r0
	adds r0, r7, #0
	ands r0, r2
	lsrs r0, r0, #1
	ands r0, r7
	adds r1, r1, r0
	adds r0, r6, #0
	ands r0, r2
	lsrs r0, r0, #1
	ands r0, r6
	adds r1, r1, r0
	strh r1, [r5]
	adds r5, #2
	adds r3, #2
	subs r4, #1
	cmp r4, #0
	bge _080A223A
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A2270: .4byte gUnknown_02022C28

	THUMB_FUNC_END sub_80A221C

	THUMB_FUNC_START sub_80A2274
sub_80A2274: @ 0x080A2274
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r4, _080A2418  @ gLCDControlBuffer
	ldrb r1, [r4]
	movs r0, #8
	negs r0, r0
	ands r0, r1
	strb r0, [r4]
	movs r0, #0
	bl SetupBackgrounds
	ldrb r2, [r4, #0xc]
	movs r1, #4
	negs r1, r1
	adds r0, r1, #0
	ands r0, r2
	movs r3, #1
	orrs r0, r3
	strb r0, [r4, #0xc]
	ldrb r0, [r4, #0x10]
	movs r2, #3
	orrs r0, r2
	strb r0, [r4, #0x10]
	ldrb r0, [r4, #0x14]
	ands r1, r0
	orrs r1, r3
	strb r1, [r4, #0x14]
	ldrb r0, [r4, #0x18]
	orrs r0, r2
	strb r0, [r4, #0x18]
	bl Font_InitForUIDefault
	bl ResetIconGraphics_
	bl LoadUiFrameGraphics
	bl LoadObjUIGfx
	bl SetupMapSpritesPalettes
	bl sub_80A221C
	movs r0, #0xd
	bl LoadIconPalettes
	adds r0, r5, #0
	bl NewGreenTextColorManager
	adds r0, r5, #0
	adds r0, #0x38
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _080A2340
	ldr r2, _080A241C  @ gRAMChapterData
	adds r2, #0x40
	ldrb r1, [r2]
	movs r0, #0x61
	negs r0, r0
	ands r0, r1
	movs r1, #0x20
	orrs r0, r1
	strb r0, [r2]
	adds r0, r5, #0
	bl ResetPrepScreenHandCursor
	movs r0, #0xc0
	lsls r0, r0, #3
	movs r1, #1
	bl sub_80AD4A0
	movs r0, #1
	bl sub_80AD594
	adds r1, r5, #0
	adds r1, #0x3a
	movs r0, #0xff
	strb r0, [r1]
	adds r0, r5, #0
	adds r0, #0x3b
	ldrb r0, [r0]
	cmp r0, #0
	beq _080A2340
	adds r0, r5, #0
	adds r0, #0x39
	ldrb r1, [r0]
	movs r0, #3
	ands r0, r1
	lsls r0, r0, #3
	adds r0, #0xc4
	lsrs r1, r1, #2
	movs r2, #7
	ands r1, r2
	lsls r1, r1, #4
	adds r1, #0x18
	movs r3, #0x80
	lsls r3, r3, #4
	movs r2, #1
	bl sub_80AD51C
_080A2340:
	movs r0, #0
	movs r1, #4
	movs r2, #0
	bl BG_SetPosition
	movs r0, #1
	movs r1, #4
	movs r2, #0
	bl BG_SetPosition
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	movs r0, #1
	movs r1, #0xd
	movs r2, #3
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	movs r4, #0
	str r4, [sp]
	movs r0, #0
	movs r1, #1
	movs r2, #0
	movs r3, #0
	bl SetBlendTargetA
	str r4, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #1
	bl SetBlendTargetB
	movs r0, #0
	bl sub_8001F48
	movs r0, #0
	bl sub_8001F64
	bl EndSlidingWallEffectMaybe
	movs r0, #0x80
	lsls r0, r0, #7
	movs r1, #5
	bl sub_8098C3C
	ldr r0, _080A2420  @ gUnknown_08A1DC1C
	ldr r4, _080A2424  @ gGenericBuffer
	adds r1, r4, #0
	bl CopyDataWithPossibleUncomp
	ldr r0, _080A2428  @ gBG1TilemapBuffer
	movs r2, #0x80
	lsls r2, r2, #5
	adds r1, r4, #0
	bl CallARM_FillTileRect
	ldr r4, _080A242C  @ gCharacterData
	ldr r0, [r5, #0x2c]
	bl sub_80A0B44
	subs r0, #1
	movs r1, #0x34
	muls r0, r1, r0
	adds r0, r0, r4
	ldrh r2, [r0, #6]
	ldr r1, _080A2430  @ gUnknown_02022CEC
	movs r3, #0x80
	lsls r3, r3, #2
	movs r0, #2
	str r0, [sp]
	adds r0, r5, #0
	bl PutFace80x72
	adds r0, r5, #0
	bl sub_80A20FC
	adds r0, r5, #0
	bl sub_80A1E7C
	ldr r0, _080A2434  @ gUnknown_08A1DD0C
	ldr r1, _080A2438  @ 0x06017800
	bl CopyDataWithPossibleUncomp
	ldr r0, _080A243C  @ gUnknown_08A1E0D8
	movs r1, #0xd0
	lsls r1, r1, #2
	movs r2, #0x20
	bl CopyToPaletteBuffer
	ldr r0, _080A2440  @ Pal_MapBattleInfoNum
	movs r1, #0x90
	lsls r1, r1, #2
	movs r2, #0x20
	bl CopyToPaletteBuffer
	ldr r0, _080A2444  @ sub_80A1B90
	adds r1, r5, #0
	bl StartParallelWorker
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A2418: .4byte gLCDControlBuffer
_080A241C: .4byte gRAMChapterData
_080A2420: .4byte gUnknown_08A1DC1C
_080A2424: .4byte gGenericBuffer
_080A2428: .4byte gBG1TilemapBuffer
_080A242C: .4byte gCharacterData
_080A2430: .4byte gUnknown_02022CEC
_080A2434: .4byte gUnknown_08A1DD0C
_080A2438: .4byte 0x06017800
_080A243C: .4byte gUnknown_08A1E0D8
_080A2440: .4byte Pal_MapBattleInfoNum
_080A2444: .4byte sub_80A1B90

	THUMB_FUNC_END sub_80A2274

	THUMB_FUNC_START sub_80A2448
sub_80A2448: @ 0x080A2448
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	ldr r0, _080A247C  @ gKeyStatusPtr
	ldr r1, [r0]
	ldrh r3, [r1, #8]
	movs r0, #2
	ands r0, r3
	cmp r0, #0
	beq _080A2484
	ldr r0, _080A2480  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A2470
	movs r0, #0x6b
	bl m4aSongNumStart
_080A2470:
	adds r0, r6, #0
	movs r1, #3
	bl Proc_Goto
	b _080A25EA
	.align 2, 0
_080A247C: .4byte gKeyStatusPtr
_080A2480: .4byte gRAMChapterData
_080A2484:
	ldrh r2, [r1, #6]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r2
	cmp r0, #0
	beq _080A249A
	adds r0, r6, #0
	movs r1, #4
	bl Proc_Goto
	b _080A25EA
_080A249A:
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r2
	cmp r0, #0
	beq _080A24AE
	adds r0, r6, #0
	movs r1, #5
	bl Proc_Goto
	b _080A25EA
_080A24AE:
	adds r0, r6, #0
	adds r0, #0x38
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _080A24BE
	b _080A25EA
_080A24BE:
	adds r0, r6, #0
	adds r0, #0x3b
	ldrb r0, [r0]
	cmp r0, #0
	bne _080A24CA
	b _080A25D0
_080A24CA:
	adds r1, r6, #0
	adds r1, #0x39
	ldrb r7, [r1]
	movs r0, #1
	ands r0, r3
	adds r5, r1, #0
	cmp r0, #0
	beq _080A24FC
	ldr r0, _080A24F8  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A24EC
	movs r0, #0x6a
	bl m4aSongNumStart
_080A24EC:
	adds r0, r6, #0
	movs r1, #2
	bl Proc_Goto
	b _080A25EA
	.align 2, 0
_080A24F8: .4byte gRAMChapterData
_080A24FC:
	movs r0, #0x20
	ands r0, r2
	cmp r0, #0
	beq _080A2516
	movs r1, #3
	ands r1, r7
	cmp r1, #0
	beq _080A2516
	movs r0, #0xfc
	ands r0, r7
	adds r0, #0xff
	adds r0, r0, r1
	strb r0, [r5]
_080A2516:
	ldr r0, _080A25C8  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _080A2550
	ldrb r1, [r5]
	movs r0, #3
	mov r8, r0
	mov r4, r8
	ands r4, r1
	ldr r0, [r6, #0x2c]
	lsrs r1, r1, #2
	movs r2, #7
	ands r1, r2
	bl sub_80A0AD4
	subs r0, #1
	cmp r4, r0
	bge _080A2550
	ldrb r0, [r5]
	movs r1, #0xfc
	ands r1, r0
	adds r1, #1
	mov r2, r8
	ands r2, r0
	adds r1, r1, r2
	strb r1, [r5]
_080A2550:
	ldr r4, _080A25C8  @ gKeyStatusPtr
	ldr r0, [r4]
	ldrh r1, [r0, #6]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _080A2572
	ldrb r1, [r5]
	lsrs r1, r1, #2
	movs r0, #7
	ands r1, r0
	subs r1, #1
	movs r2, #1
	negs r2, r2
	adds r0, r6, #0
	bl sub_80A2154
_080A2572:
	ldr r0, [r4]
	ldrh r1, [r0, #6]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _080A2590
	ldrb r1, [r5]
	lsrs r1, r1, #2
	movs r0, #7
	ands r1, r0
	adds r1, #1
	adds r0, r6, #0
	movs r2, #1
	bl sub_80A2154
_080A2590:
	ldrb r1, [r5]
	cmp r7, r1
	beq _080A25EA
	movs r0, #3
	ands r0, r1
	lsls r0, r0, #3
	adds r0, #0xc4
	lsrs r1, r1, #2
	movs r2, #7
	ands r1, r2
	lsls r1, r1, #4
	adds r1, #0x18
	movs r3, #0x80
	lsls r3, r3, #4
	movs r2, #1
	bl sub_80AD51C
	ldr r0, _080A25CC  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A25EA
	movs r0, #0x65
	bl m4aSongNumStart
	b _080A25EA
	.align 2, 0
_080A25C8: .4byte gKeyStatusPtr
_080A25CC: .4byte gRAMChapterData
_080A25D0:
	movs r0, #1
	ands r0, r3
	cmp r0, #0
	beq _080A25EA
	ldr r0, _080A25F4  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A25EA
	movs r0, #0x6c
	bl m4aSongNumStart
_080A25EA:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A25F4: .4byte gRAMChapterData

	THUMB_FUNC_END sub_80A2448

	THUMB_FUNC_START sub_80A25F8
sub_80A25F8: @ 0x080A25F8
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	movs r0, #0
	bl SetupBackgrounds
	ldr r3, _080A26A4  @ gLCDControlBuffer
	ldrb r2, [r3, #0xc]
	movs r1, #4
	negs r1, r1
	adds r0, r1, #0
	ands r0, r2
	strb r0, [r3, #0xc]
	ldrb r2, [r3, #0x10]
	adds r0, r1, #0
	ands r0, r2
	movs r2, #1
	orrs r0, r2
	strb r0, [r3, #0x10]
	ldrb r0, [r3, #0x14]
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	strb r1, [r3, #0x14]
	ldrb r0, [r3, #0x18]
	movs r1, #3
	orrs r0, r1
	strb r0, [r3, #0x18]
	movs r0, #3
	movs r1, #0
	movs r2, #0
	movs r3, #0x10
	bl SetSpecialColorEffectsParameters
	movs r0, #1
	str r0, [sp]
	movs r1, #1
	movs r2, #1
	movs r3, #1
	bl SetBlendTargetA
	movs r0, #0
	str r0, [sp]
	movs r1, #1
	movs r2, #0
	movs r3, #0
	bl SetBlendTargetB
	bl ResetFaces
	bl Font_InitForUIDefault
	bl ResetIconGraphics_
	bl LoadLegacyUiFrameGraphics
	bl LoadObjUIGfx
	ldr r0, [r5, #0x2c]
	bl sub_80A0B44
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, [r5, #0x2c]
	adds r5, #0x39
	ldrb r1, [r5]
	lsrs r1, r1, #2
	movs r2, #7
	ands r1, r2
	bl sub_80A0B20
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldrb r0, [r5]
	movs r2, #3
	ands r2, r0
	adds r2, #1
	adds r0, r4, #0
	bl sub_8083764
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A26A4: .4byte gLCDControlBuffer

	THUMB_FUNC_END sub_80A25F8

	THUMB_FUNC_START sub_80A26A8
sub_80A26A8: @ 0x080A26A8
	push {r4, r5, lr}
	sub sp, #4
	adds r0, #0x3a
	movs r5, #0
	strb r5, [r0]
	bl HidePrepScreenHandCursor
	ldr r2, _080A2728  @ gLCDControlBuffer
	ldrb r1, [r2, #0xc]
	movs r3, #4
	negs r3, r3
	adds r0, r3, #0
	ands r0, r1
	movs r4, #1
	orrs r0, r4
	strb r0, [r2, #0xc]
	ldrb r0, [r2, #0x10]
	movs r1, #3
	orrs r0, r1
	strb r0, [r2, #0x10]
	ldrb r1, [r2, #0x14]
	adds r0, r3, #0
	ands r0, r1
	orrs r0, r4
	strb r0, [r2, #0x14]
	ldrb r0, [r2, #0x18]
	ands r3, r0
	strb r3, [r2, #0x18]
	movs r0, #1
	movs r1, #0
	movs r2, #0x10
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	str r5, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #1
	bl SetBlendTargetA
	movs r0, #1
	str r0, [sp]
	movs r1, #1
	movs r2, #1
	movs r3, #0
	bl SetBlendTargetB
	bl sub_80A1AE4
	ldr r0, _080A272C  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A271E
	movs r0, #0xc8
	bl m4aSongNumStart
_080A271E:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A2728: .4byte gLCDControlBuffer
_080A272C: .4byte gRAMChapterData

	THUMB_FUNC_END sub_80A26A8

	THUMB_FUNC_START sub_80A2730
sub_80A2730: @ 0x080A2730
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	str r0, [sp]
	movs r4, #0
	ldr r0, _080A27A0  @ gBG2TilemapBuffer
	mov sl, r0
_080A2744:
	ldr r2, [sp]
	adds r1, r4, r2
	cmp r1, #0x1d
	bhi _080A27B4
	adds r3, r4, #1
	mov r9, r3
	ldr r2, _080A27A4  @ gUnknown_020136F4
	lsls r1, r1, #1
	movs r3, #0x80
	lsls r3, r3, #5
	adds r0, r2, r3
	adds r0, r0, r1
	mov ip, r0
	adds r7, r1, r2
	adds r6, r1, #0
	lsls r0, r4, #1
	ldr r4, _080A27A8  @ gBG0TilemapBuffer
	adds r5, r0, r4
	adds r3, r0, #0
	ldr r0, _080A27AC  @ gBG1TilemapBuffer
	mov r8, r0
	movs r4, #0x13
_080A2770:
	ldrh r0, [r7]
	strh r0, [r5]
	mov r2, r8
	adds r1, r3, r2
	ldr r2, _080A27B0  @ gUnknown_02013EF4
	adds r0, r6, r2
	ldrh r0, [r0]
	strh r0, [r1]
	mov r0, sl
	adds r1, r3, r0
	mov r2, ip
	ldrh r0, [r2]
	strh r0, [r1]
	movs r0, #0x40
	add ip, r0
	adds r7, #0x40
	adds r6, #0x40
	adds r5, #0x40
	adds r3, #0x40
	subs r4, #1
	cmp r4, #0
	bge _080A2770
	b _080A27DC
	.align 2, 0
_080A27A0: .4byte gBG2TilemapBuffer
_080A27A4: .4byte gUnknown_020136F4
_080A27A8: .4byte gBG0TilemapBuffer
_080A27AC: .4byte gBG1TilemapBuffer
_080A27B0: .4byte gUnknown_02013EF4
_080A27B4:
	adds r1, r4, #1
	mov r9, r1
	movs r3, #0
	lsls r0, r4, #1
	mov r4, sl
	adds r2, r0, r4
	ldr r4, _080A27F8  @ gBG1TilemapBuffer
	adds r1, r0, r4
	ldr r4, _080A27FC  @ gBG0TilemapBuffer
	adds r0, r0, r4
	movs r4, #0x13
_080A27CA:
	strh r3, [r0]
	strh r3, [r1]
	strh r3, [r2]
	adds r2, #0x40
	adds r1, #0x40
	adds r0, #0x40
	subs r4, #1
	cmp r4, #0
	bge _080A27CA
_080A27DC:
	mov r4, r9
	cmp r4, #0x1d
	ble _080A2744
	movs r0, #7
	bl BG_EnableSyncByMask
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A27F8: .4byte gBG1TilemapBuffer
_080A27FC: .4byte gBG0TilemapBuffer

	THUMB_FUNC_END sub_80A2730

	THUMB_FUNC_START sub_80A2800
sub_80A2800: @ 0x080A2800
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r6, r7, #0
	adds r6, #0x3a
	ldrb r0, [r6]
	adds r0, #1
	strb r0, [r6]
	ldrb r0, [r6]
	movs r4, #0xa
	subs r4, r4, r0
	lsls r0, r4, #3
	muls r0, r4, r0
	movs r1, #0x64
	bl __divsi3
	movs r5, #8
	subs r5, r5, r0
	lsls r0, r4, #4
	muls r0, r4, r0
	movs r1, #0x64
	bl __divsi3
	movs r4, #0x10
	subs r4, r4, r0
	negs r0, r5
	lsls r0, r0, #3
	str r0, [r7, #0x30]
	adds r0, r5, #0
	bl sub_80A2730
	lsls r1, r4, #0x18
	lsrs r1, r1, #0x18
	movs r2, #0x10
	subs r2, r2, r4
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	movs r0, #1
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	ldrb r0, [r6]
	cmp r0, #0xa
	bne _080A2864
	adds r0, r7, #0
	bl Proc_Break
	ldr r0, [r7, #0x2c]
	bl sub_80A0AA0
	str r0, [r7, #0x2c]
_080A2864:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80A2800

	THUMB_FUNC_START sub_80A286C
sub_80A286C: @ 0x080A286C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	mov r7, r8
	adds r7, #0x3a
	ldrb r0, [r7]
	adds r0, #1
	strb r0, [r7]
	ldrb r0, [r7]
	movs r4, #0xa
	subs r4, r4, r0
	lsls r0, r4, #3
	muls r0, r4, r0
	movs r1, #0x64
	bl __divsi3
	adds r6, r0, #0
	movs r5, #8
	subs r6, r5, r6
	lsls r0, r4, #4
	muls r0, r4, r0
	movs r1, #0x64
	bl __divsi3
	movs r4, #0x10
	subs r4, r4, r0
	subs r5, r5, r6
	lsls r5, r5, #3
	mov r0, r8
	str r5, [r0, #0x30]
	subs r6, #8
	adds r0, r6, #0
	bl sub_80A2730
	movs r1, #0x10
	subs r1, r1, r4
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	movs r0, #1
	adds r2, r4, #0
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	ldrb r0, [r7]
	cmp r0, #0xa
	bne _080A28D4
	mov r0, r8
	bl Proc_Break
_080A28D4:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80A286C

	THUMB_FUNC_START sub_80A28E0
sub_80A28E0: @ 0x080A28E0
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r6, r7, #0
	adds r6, #0x3a
	ldrb r0, [r6]
	adds r0, #1
	strb r0, [r6]
	ldrb r0, [r6]
	movs r4, #0xa
	subs r4, r4, r0
	lsls r0, r4, #3
	muls r0, r4, r0
	movs r1, #0x64
	bl __divsi3
	movs r5, #8
	subs r5, r5, r0
	lsls r0, r4, #4
	muls r0, r4, r0
	movs r1, #0x64
	bl __divsi3
	movs r4, #0x10
	subs r4, r4, r0
	lsls r0, r5, #3
	str r0, [r7, #0x30]
	negs r5, r5
	adds r0, r5, #0
	bl sub_80A2730
	lsls r1, r4, #0x18
	lsrs r1, r1, #0x18
	movs r2, #0x10
	subs r2, r2, r4
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	movs r0, #1
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	ldrb r0, [r6]
	cmp r0, #0xa
	bne _080A2944
	adds r0, r7, #0
	bl Proc_Break
	ldr r0, [r7, #0x2c]
	bl sub_80A0AC0
	str r0, [r7, #0x2c]
_080A2944:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80A28E0

	THUMB_FUNC_START sub_80A294C
sub_80A294C: @ 0x080A294C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	mov r7, r8
	adds r7, #0x3a
	ldrb r0, [r7]
	adds r0, #1
	strb r0, [r7]
	ldrb r0, [r7]
	movs r4, #0xa
	subs r4, r4, r0
	lsls r0, r4, #3
	muls r0, r4, r0
	movs r1, #0x64
	bl __divsi3
	adds r5, r0, #0
	movs r6, #8
	subs r5, r6, r5
	lsls r0, r4, #4
	muls r0, r4, r0
	movs r1, #0x64
	bl __divsi3
	movs r4, #0x10
	subs r4, r4, r0
	adds r0, r5, #0
	subs r0, #8
	lsls r0, r0, #3
	mov r1, r8
	str r0, [r1, #0x30]
	subs r6, r6, r5
	adds r0, r6, #0
	bl sub_80A2730
	movs r1, #0x10
	subs r1, r1, r4
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	movs r0, #1
	adds r2, r4, #0
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	ldrb r0, [r7]
	cmp r0, #0xa
	bne _080A29B6
	mov r0, r8
	bl Proc_Break
_080A29B6:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80A294C

	THUMB_FUNC_START sub_80A29C0
sub_80A29C0: @ 0x080A29C0
	push {r4, r5, r6, lr}
	mov r6, r9
	mov r5, r8
	push {r5, r6}
	sub sp, #4
	adds r4, r0, #0
	bl ResetFaces
	bl Font_InitForUIDefault
	bl ResetIconGraphics_
	ldr r6, _080A2A94  @ gBG0TilemapBuffer
	adds r0, r6, #0
	movs r1, #0
	bl BG_Fill
	ldr r0, _080A2A98  @ gBG1TilemapBuffer
	mov r8, r0
	movs r1, #0
	bl BG_Fill
	ldr r0, _080A2A9C  @ gBG2TilemapBuffer
	movs r1, #0
	bl BG_Fill
	adds r2, r4, #0
	adds r2, #0x39
	ldrb r1, [r2]
	movs r0, #0xfc
	ands r0, r1
	movs r1, #0
	mov r9, r1
	movs r1, #0xe3
	ands r0, r1
	strb r0, [r2]
	ldr r0, [r4, #0x2c]
	bl sub_80A0B44
	bl sub_80A1B6C
	adds r1, r4, #0
	adds r1, #0x3c
	strb r0, [r1]
	adds r0, r4, #0
	bl sub_80A1F68
	adds r0, r4, #0
	bl sub_80A204C
	adds r0, r4, #0
	bl sub_80A207C
	adds r0, r4, #0
	movs r1, #0
	movs r2, #1
	bl sub_80A2154
	ldr r0, _080A2AA0  @ gUnknown_08A1DC1C
	ldr r5, _080A2AA4  @ gGenericBuffer
	adds r1, r5, #0
	bl CopyDataWithPossibleUncomp
	movs r2, #0x80
	lsls r2, r2, #5
	mov r0, r8
	adds r1, r5, #0
	bl CallARM_FillTileRect
	ldr r5, _080A2AA8  @ gCharacterData
	ldr r0, [r4, #0x2c]
	bl sub_80A0B44
	subs r0, #1
	movs r1, #0x34
	muls r0, r1, r0
	adds r0, r0, r5
	ldrh r2, [r0, #6]
	adds r6, #0x44
	movs r3, #0x80
	lsls r3, r3, #2
	movs r0, #2
	str r0, [sp]
	adds r0, r4, #0
	adds r1, r6, #0
	bl PutFace80x72
	adds r0, r4, #0
	bl sub_80A20FC
	adds r0, r4, #0
	bl sub_80A1E7C
	bl sub_80A1AE4
	adds r4, #0x3a
	mov r0, r9
	strb r0, [r4]
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A2A94: .4byte gBG0TilemapBuffer
_080A2A98: .4byte gBG1TilemapBuffer
_080A2A9C: .4byte gBG2TilemapBuffer
_080A2AA0: .4byte gUnknown_08A1DC1C
_080A2AA4: .4byte gGenericBuffer
_080A2AA8: .4byte gCharacterData

	THUMB_FUNC_END sub_80A29C0

	THUMB_FUNC_START sub_80A2AAC
sub_80A2AAC: @ 0x080A2AAC
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r2, _080A2B58  @ gLCDControlBuffer
	ldrb r3, [r2, #0xc]
	movs r1, #4
	negs r1, r1
	adds r0, r1, #0
	ands r0, r3
	movs r4, #1
	orrs r0, r4
	strb r0, [r2, #0xc]
	ldrb r0, [r2, #0x10]
	movs r3, #3
	orrs r0, r3
	strb r0, [r2, #0x10]
	ldrb r0, [r2, #0x14]
	ands r1, r0
	orrs r1, r4
	strb r1, [r2, #0x14]
	ldrb r0, [r2, #0x18]
	orrs r0, r3
	strb r0, [r2, #0x18]
	movs r0, #1
	movs r1, #0
	movs r2, #0xc
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	movs r0, #0
	str r0, [sp]
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl SetBlendTargetA
	movs r0, #1
	str r0, [sp]
	movs r1, #1
	movs r2, #1
	movs r3, #1
	bl SetBlendTargetB
	movs r0, #0
	bl sub_8001F48
	movs r0, #0
	bl sub_8001F64
	adds r0, r5, #0
	adds r0, #0x38
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _080A2B50
	adds r0, r5, #0
	adds r0, #0x3b
	ldrb r0, [r0]
	cmp r0, #0
	beq _080A2B50
	adds r0, r5, #0
	adds r0, #0x39
	ldrb r1, [r0]
	movs r0, #3
	ands r0, r1
	lsls r0, r0, #3
	adds r0, #0xc4
	lsrs r1, r1, #2
	movs r2, #7
	ands r1, r2
	lsls r1, r1, #4
	adds r1, #0x18
	movs r3, #0x80
	lsls r3, r3, #4
	movs r2, #1
	bl sub_80AD51C
	adds r1, r5, #0
	adds r1, #0x3a
	movs r0, #0xff
	strb r0, [r1]
_080A2B50:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A2B58: .4byte gLCDControlBuffer

	THUMB_FUNC_END sub_80A2AAC

	THUMB_FUNC_START sub_80A2B5C
sub_80A2B5C: @ 0x080A2B5C
	push {r4, lr}
	adds r4, r0, #0
	bl EndAllProcChildren
	bl EndBG3Slider_
	movs r0, #0
	bl EndFaceById
	ldr r0, [r4, #0x2c]
	bl sub_80A1A90
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80A2B5C

	THUMB_FUNC_START sub_80A2B7C
sub_80A2B7C: @ 0x080A2B7C
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, [r4, #0x2c]
	adds r1, r4, #0
	adds r1, #0x39
	ldrb r3, [r1]
	lsrs r1, r3, #2
	movs r2, #7
	ands r1, r2
	movs r2, #3
	ands r2, r3
	adds r2, #1
	bl sub_80A1AAC
	adds r4, #0x3e
	movs r3, #0
	strb r0, [r4]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080A2BB8
	movs r1, #0x80
	lsls r1, r1, #1
	str r3, [sp]
	movs r0, #9
	movs r2, #0x80
	movs r3, #0x10
	bl sub_80029E8
	b _080A2BC8
_080A2BB8:
	ldrb r0, [r4]
	movs r2, #0x80
	lsls r2, r2, #1
	str r3, [sp]
	adds r1, r2, #0
	movs r3, #0x10
	bl sub_80029E8
_080A2BC8:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80A2B7C

	THUMB_FUNC_START sub_80A2BD0
sub_80A2BD0: @ 0x080A2BD0
	push {lr}
	sub sp, #4
	adds r0, #0x3e
	ldrb r0, [r0]
	cmp r0, #0
	bne _080A2BEE
	movs r2, #0x80
	lsls r2, r2, #1
	str r0, [sp]
	movs r0, #9
	movs r1, #0x80
	movs r3, #0x10
	bl sub_80029E8
	b _080A2C00
_080A2BEE:
	movs r2, #0x80
	lsls r2, r2, #1
	movs r0, #0
	str r0, [sp]
	movs r0, #9
	adds r1, r2, #0
	movs r3, #0x10
	bl sub_80029E8
_080A2C00:
	add sp, #4
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80A2BD0

	THUMB_FUNC_START sub_80A2C08
sub_80A2C08: @ 0x080A2C08
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r1, r2, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _080A2C28  @ gUnknown_08A19880
	bl Proc_StartBlocking
	adds r1, r0, #0
	adds r1, #0x38
	strb r4, [r1]
	str r5, [r0, #0x2c]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A2C28: .4byte gUnknown_08A19880

	THUMB_FUNC_END sub_80A2C08

	THUMB_FUNC_START sub_80A2C2C
sub_80A2C2C: @ 0x080A2C2C
	ldr r0, _080A2C34  @ gUnknown_0203E884
	movs r1, #0
	strb r1, [r0]
	bx lr
	.align 2, 0
_080A2C34: .4byte gUnknown_0203E884

	THUMB_FUNC_END sub_80A2C2C

	THUMB_FUNC_START sub_80A2C38
sub_80A2C38: @ 0x080A2C38
	bx lr

	THUMB_FUNC_END sub_80A2C38

.align 2, 0
