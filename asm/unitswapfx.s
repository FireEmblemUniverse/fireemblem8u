	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	@ Unit Swapping Animation/Effect (When you swap unit places in the prep screen)

	THUMB_FUNC_START sub_801EA64
sub_801EA64: @ 0x0801EA64
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #4
	adds r4, r0, #0
	ldr r1, [r4, #0x2c]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	lsls r0, r0, #4
	movs r2, #0
	mov r8, r2
	strh r0, [r4, #0x30]
	movs r0, #0x11
	ldrsb r0, [r1, r0]
	lsls r0, r0, #4
	strh r0, [r4, #0x32]
	movs r3, #0x34
	ldrsh r2, [r4, r3]
	movs r1, #0x30
	ldrsh r0, [r4, r1]
	subs r2, r2, r0
	movs r3, #0x36
	ldrsh r1, [r4, r3]
	movs r3, #0x32
	ldrsh r0, [r4, r3]
	subs r1, r1, r0
	adds r0, r2, #0
	muls r0, r2, r0
	adds r2, r1, #0
	muls r2, r1, r2
	adds r1, r2, #0
	adds r0, r0, r1
	bl Sqrt
	adds r5, r0, #0
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	movs r1, #0x80
	lsls r1, r1, #5
	movs r2, #0x80
	lsls r2, r2, #0xa
	movs r6, #0x80
	lsls r6, r6, #2
	str r6, [sp]
	movs r0, #0
	adds r3, r5, #0
	bl sub_8012DCC
	str r0, [r4, #0x44]
	str r6, [sp]
	movs r0, #0
	movs r1, #0xc
	movs r2, #0x30
	adds r3, r5, #0
	bl sub_8012DCC
	strh r0, [r4, #0x3e]
	mov r3, r8
	strh r3, [r4, #0x3c]
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_801EA64

	THUMB_FUNC_START sub_801EAE8
sub_801EAE8: @ 0x0801EAE8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	adds r7, r0, #0
	movs r2, #0x80
	lsls r2, r2, #9
	movs r0, #0x3c
	ldrsh r3, [r7, r0]
	movs r1, #0x3e
	ldrsh r0, [r7, r1]
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	bl sub_8012DCC
	str r0, [sp, #4]
	movs r2, #0x34
	ldrsh r6, [r7, r2]
	movs r1, #0x30
	ldrsh r0, [r7, r1]
	mov r9, r0
	subs r6, r6, r0
	movs r0, #0x36
	ldrsh r2, [r7, r0]
	mov r8, r2
	movs r2, #0x32
	ldrsh r1, [r7, r2]
	str r1, [sp, #8]
	mov r0, r8
	subs r0, r0, r1
	mov r8, r0
	ldr r2, _0801EBDC  @ gSinLookup
	ldr r1, [sp, #4]
	asrs r0, r1, #9
	movs r1, #0xff
	ands r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	movs r2, #0
	ldrsh r4, [r0, r2]
	adds r0, r6, #0
	muls r0, r4, r0
	ldr r5, [r7, #0x44]
	adds r1, r5, #0
	bl __divsi3
	mov sl, r0
	mov r0, r8
	muls r0, r4, r0
	adds r1, r5, #0
	bl __divsi3
	ldr r2, [sp, #4]
	adds r1, r6, #0
	muls r1, r2, r1
	asrs r1, r1, #0x10
	adds r5, r1, r0
	mov r0, r8
	muls r0, r2, r0
	asrs r0, r0, #0x10
	mov r1, sl
	subs r4, r0, r1
	add r9, r5
	ldr r1, _0801EBE0  @ gUnknown_0202BCB0
	movs r2, #0xc
	ldrsh r0, [r1, r2]
	mov r2, r9
	subs r5, r2, r0
	ldr r0, [sp, #8]
	adds r4, r4, r0
	movs r2, #0xe
	ldrsh r0, [r1, r2]
	subs r4, r4, r0
	adds r1, r5, #0
	adds r1, #0x10
	movs r0, #0x80
	lsls r0, r0, #1
	cmp r1, r0
	bhi _0801EBB2
	adds r0, r4, #0
	adds r0, #0x20
	cmp r0, #0xc0
	bhi _0801EBB2
	adds r2, r4, #0
	subs r2, #0xc
	ldr r3, _0801EBE4  @ gObject_16x16
	movs r0, #6
	str r0, [sp]
	movs r0, #4
	adds r1, r5, #0
	bl PutSprite
	ldr r3, [r7, #0x2c]
	movs r0, #4
	adds r1, r5, #0
	adds r2, r4, #0
	bl sub_8027B60
_0801EBB2:
	ldrh r0, [r7, #0x3c]
	adds r0, #1
	strh r0, [r7, #0x3c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x3e
	ldrsh r1, [r7, r2]
	cmp r0, r1
	ble _0801EBCA
	adds r0, r7, #0
	bl Proc_Break
_0801EBCA:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801EBDC: .4byte gSinLookup
_0801EBE0: .4byte gUnknown_0202BCB0
_0801EBE4: .4byte gObject_16x16

	THUMB_FUNC_END sub_801EAE8

	THUMB_FUNC_START sub_801EBE8
sub_801EBE8: @ 0x0801EBE8
	push {lr}
	adds r1, r0, #0
	ldr r2, [r1, #0x2c]
	movs r3, #0x34
	ldrsh r0, [r1, r3]
	cmp r0, #0
	bge _0801EBF8
	adds r0, #0xf
_0801EBF8:
	asrs r0, r0, #4
	strb r0, [r2, #0x10]
	ldr r2, [r1, #0x2c]
	movs r3, #0x36
	ldrsh r0, [r1, r3]
	cmp r0, #0
	bge _0801EC08
	adds r0, #0xf
_0801EC08:
	asrs r0, r0, #4
	strb r0, [r2, #0x11]
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_801EBE8

	THUMB_FUNC_START sub_801EC10
sub_801EC10: @ 0x0801EC10
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r6, r0, #0
	mov r8, r1
	adds r4, r2, #0
	adds r5, r3, #0
	ldr r0, _0801EC44  @ gUnknown_0859AEA0
	adds r1, r6, #0
	bl Proc_Start
	mov r1, r8
	str r1, [r0, #0x2c]
	lsls r4, r4, #4
	strh r4, [r0, #0x34]
	lsls r5, r5, #4
	strh r5, [r0, #0x36]
	mov r0, r8
	bl HideUnitSMS
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0801EC44: .4byte gUnknown_0859AEA0

	THUMB_FUNC_END sub_801EC10

	THUMB_FUNC_START sub_801EC48
sub_801EC48: @ 0x0801EC48
	push {lr}
	ldr r0, _0801EC58  @ gUnknown_0859AEA0
	bl Proc_Find
	cmp r0, #0
	bne _0801EC5C
	movs r0, #0
	b _0801EC5E
	.align 2, 0
_0801EC58: .4byte gUnknown_0859AEA0
_0801EC5C:
	movs r0, #1
_0801EC5E:
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_801EC48

.align 2, 0 @ align with 0
