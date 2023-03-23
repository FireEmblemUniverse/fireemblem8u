	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

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

	THUMB_FUNC_START GetConvoyItemCount_
GetConvoyItemCount_: @ 0x08097CC8
	push {lr}
	bl GetConvoyItemCount
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r1}
	bx r1

	THUMB_FUNC_END GetConvoyItemCount_

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
	bl ClearSupplyItems
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
	bl ClearSupplyItems
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

.align 2, 0
