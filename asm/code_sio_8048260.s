	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	THUMB_FUNC_START Set_0203DDDC
Set_0203DDDC: @ 0x0804B920
	ldr r1, _0804B928  @ gUnk_Sio_0203DDDC
	movs r0, #1
	strb r0, [r1]
	bx lr
	.align 2, 0
_0804B928: .4byte gUnk_Sio_0203DDDC

	THUMB_FUNC_END Set_0203DDDC

	THUMB_FUNC_START Clear_0203DDDC
Clear_0203DDDC: @ 0x0804B92C
	ldr r1, _0804B934  @ gUnk_Sio_0203DDDC
	movs r0, #0
	strb r0, [r1]
	bx lr
	.align 2, 0
_0804B934: .4byte gUnk_Sio_0203DDDC

	THUMB_FUNC_END Clear_0203DDDC

	THUMB_FUNC_START sub_804B938
sub_804B938: @ 0x0804B938
	push {lr}
	ldr r2, _0804B960  @ gLCDControlBuffer
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
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl SetBlendConfig
	pop {r0}
	bx r0
	.align 2, 0
_0804B960: .4byte gLCDControlBuffer

	THUMB_FUNC_END sub_804B938

	THUMB_FUNC_START sub_804B964
sub_804B964: @ 0x0804B964
	push {lr}
	ldr r0, _0804B994  @ 0x04000006
	ldrh r0, [r0]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	ldr r3, _0804B998  @ gUnk_Sio_02001188
	cmp r1, #0xa0
	bls _0804B97E
	ldr r0, _0804B99C  @ gUnk_Sio_02001180
	ldr r0, [r0]
	str r0, [r3]
	movs r1, #0
_0804B97E:
	ldr r2, _0804B9A0  @ 0x04000042
	ldr r0, [r3]
	lsls r1, r1, #2
	adds r1, r1, r0
	ldrh r0, [r1]
	lsls r0, r0, #8
	ldrh r1, [r1, #2]
	adds r0, r0, r1
	strh r0, [r2]
	pop {r0}
	bx r0
	.align 2, 0
_0804B994: .4byte 0x04000006
_0804B998: .4byte gUnk_Sio_02001188
_0804B99C: .4byte gUnk_Sio_02001180
_0804B9A0: .4byte 0x04000042

	THUMB_FUNC_END sub_804B964

	THUMB_FUNC_START sub_804B9A4
sub_804B9A4: @ 0x0804B9A4
	ldr r2, _0804B9B4  @ gUnk_Sio_02001180
	ldr r3, [r2]
	ldr r1, _0804B9B8  @ gUnk_Sio_02001184
	ldr r0, [r1]
	str r0, [r2]
	str r3, [r1]
	bx lr
	.align 2, 0
_0804B9B4: .4byte gUnk_Sio_02001180
_0804B9B8: .4byte gUnk_Sio_02001184

	THUMB_FUNC_END sub_804B9A4

	THUMB_FUNC_START sub_804B9BC
sub_804B9BC: @ 0x0804B9BC
	push {lr}
	ldr r2, _0804B9E0  @ gLCDControlBuffer
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
	movs r0, #0
	bl SetPrimaryHBlankHandler
	pop {r0}
	bx r0
	.align 2, 0
_0804B9E0: .4byte gLCDControlBuffer

	THUMB_FUNC_END sub_804B9BC

	THUMB_FUNC_START sub_804B9E4
sub_804B9E4: @ 0x0804B9E4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	str r0, [sp, #4]
	ldr r7, [sp, #0x34]
	ldr r0, [sp, #0x48]
	ldr r6, [sp, #0x4c]
	lsls r6, r6, #0x10
	lsrs r6, r6, #0x10
	subs r1, #0x78
	subs r2, #0x50
	subs r3, #0x78
	subs r7, #0x50
	ldr r4, [sp, #0x38]
	subs r4, #0x78
	str r4, [sp, #0x38]
	ldr r4, [sp, #0x3c]
	subs r4, #0x50
	str r4, [sp, #0x3c]
	ldr r4, [sp, #0x40]
	subs r4, #0x78
	str r4, [sp, #0x40]
	ldr r4, [sp, #0x44]
	subs r4, #0x50
	str r4, [sp, #0x44]
	ldr r4, _0804BB50  @ gSinLookup
	mov r9, r4
	lsls r0, r0, #0x10
	movs r4, #0xff
	lsls r4, r4, #0x10
	ands r4, r0
	asrs r4, r4, #0x10
	mov ip, r4
	lsls r0, r4, #1
	add r0, r9
	movs r4, #0
	ldrsh r5, [r0, r4]
	adds r0, r1, #0
	muls r0, r5, r0
	mov r8, r0
	mov r4, ip
	adds r4, #0x40
	lsls r4, r4, #1
	add r4, r9
	movs r0, #0
	ldrsh r4, [r4, r0]
	adds r0, r2, #0
	muls r0, r4, r0
	add r0, r8
	str r0, [sp, #8]
	muls r1, r4, r1
	adds r0, r2, #0
	muls r0, r5, r0
	subs r1, r1, r0
	str r1, [sp, #0xc]
	adds r1, r3, #0
	muls r1, r5, r1
	adds r0, r7, #0
	muls r0, r4, r0
	adds r1, r1, r0
	mov r9, r1
	adds r1, r3, #0
	muls r1, r4, r1
	adds r0, r7, #0
	muls r0, r5, r0
	subs r7, r1, r0
	ldr r2, [sp, #0x38]
	adds r1, r2, #0
	muls r1, r5, r1
	ldr r2, [sp, #0x3c]
	adds r0, r2, #0
	muls r0, r4, r0
	adds r1, r1, r0
	mov sl, r1
	ldr r0, [sp, #0x38]
	adds r1, r0, #0
	muls r1, r4, r1
	adds r0, r2, #0
	muls r0, r5, r0
	subs r1, r1, r0
	mov r8, r1
	ldr r2, [sp, #0x40]
	adds r1, r2, #0
	muls r1, r5, r1
	ldr r2, [sp, #0x44]
	adds r0, r2, #0
	muls r0, r4, r0
	adds r1, r1, r0
	str r1, [sp, #0x10]
	ldr r0, [sp, #0x40]
	adds r1, r0, #0
	muls r1, r4, r1
	adds r0, r2, #0
	muls r0, r5, r0
	subs r4, r1, r0
	ldr r1, [sp, #8]
	asrs r0, r1, #0xc
	muls r0, r6, r0
	asrs r0, r0, #8
	adds r0, #0x78
	str r0, [sp, #8]
	ldr r2, [sp, #0xc]
	asrs r0, r2, #0xc
	muls r0, r6, r0
	asrs r0, r0, #8
	adds r0, #0x50
	str r0, [sp, #0xc]
	mov r1, r9
	asrs r0, r1, #0xc
	muls r0, r6, r0
	asrs r0, r0, #8
	adds r0, #0x78
	mov r9, r0
	asrs r0, r7, #0xc
	muls r0, r6, r0
	asrs r0, r0, #8
	adds r7, r0, #0
	adds r7, #0x50
	mov r2, sl
	asrs r0, r2, #0xc
	muls r0, r6, r0
	asrs r0, r0, #8
	adds r0, #0x78
	mov sl, r0
	mov r1, r8
	asrs r0, r1, #0xc
	muls r0, r6, r0
	asrs r0, r0, #8
	adds r0, #0x50
	mov r8, r0
	ldr r2, [sp, #0x10]
	asrs r0, r2, #0xc
	muls r0, r6, r0
	asrs r0, r0, #8
	adds r0, #0x78
	str r0, [sp, #0x10]
	asrs r0, r4, #0xc
	muls r0, r6, r0
	asrs r0, r0, #8
	adds r4, r0, #0
	adds r4, #0x50
	str r7, [sp]
	ldr r0, [sp, #4]
	ldr r1, [sp, #8]
	ldr r2, [sp, #0xc]
	mov r3, r9
	bl sub_80131F0
	mov r0, r8
	str r0, [sp]
	ldr r0, [sp, #4]
	mov r1, r9
	adds r2, r7, #0
	mov r3, sl
	bl sub_80131F0
	str r4, [sp]
	ldr r0, [sp, #4]
	mov r1, sl
	mov r2, r8
	ldr r3, [sp, #0x10]
	bl sub_80131F0
	ldr r1, [sp, #0xc]
	str r1, [sp]
	ldr r0, [sp, #4]
	ldr r1, [sp, #0x10]
	adds r2, r4, #0
	ldr r3, [sp, #8]
	bl sub_80131F0
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804BB50: .4byte gSinLookup

	THUMB_FUNC_END sub_804B9E4

	THUMB_FUNC_START sub_804BB54
sub_804BB54: @ 0x0804BB54
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r1, _0804BB88  @ gUnk_Sio_02001180
	ldr r0, _0804BB8C  @ gUnk_Sio_02000F00
	str r0, [r1]
	ldr r5, _0804BB90  @ gUnk_Sio_02001184
	ldr r2, _0804BB94  @ 0xFFFFFD80
	adds r1, r0, r2
	str r1, [r5]
	ldr r1, _0804BB98  @ gUnk_Sio_02001188
	str r0, [r1]
	bl sub_80131D0
	ldr r0, [r5]
	bl sub_80131D0
	adds r4, #0x4c
	movs r0, #0
	strh r0, [r4]
	ldr r0, _0804BB9C  @ sub_804B964
	bl SetPrimaryHBlankHandler
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0804BB88: .4byte gUnk_Sio_02001180
_0804BB8C: .4byte gUnk_Sio_02000F00
_0804BB90: .4byte gUnk_Sio_02001184
_0804BB94: .4byte 0xFFFFFD80
_0804BB98: .4byte gUnk_Sio_02001188
_0804BB9C: .4byte sub_804B964

	THUMB_FUNC_END sub_804BB54

	THUMB_FUNC_START sub_804BBA0
sub_804BBA0: @ 0x0804BBA0
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	adds r4, r0, #0
	adds r7, r4, #0
	adds r7, #0x4c
	adds r5, r4, #0
	adds r5, #0x64
	movs r0, #0
	ldrsh r1, [r7, r0]
	movs r2, #0
	ldrsh r0, [r5, r2]
	cmp r1, r0
	bne _0804BBC8
	movs r0, #0
	bl SetPrimaryHBlankHandler
	adds r0, r4, #0
	bl Proc_Break
	b _0804BC2E
_0804BBC8:
	movs r0, #0
	ldrsh r3, [r7, r0]
	movs r1, #0
	ldrsh r0, [r5, r1]
	str r0, [sp]
	movs r0, #0
	movs r1, #0xa0
	movs r2, #0xc0
	bl Interpolate
	adds r6, r0, #0
	movs r2, #0x88
	lsls r2, r2, #1
	movs r0, #0
	ldrsh r3, [r7, r0]
	movs r1, #0
	ldrsh r0, [r5, r1]
	str r0, [sp]
	movs r0, #1
	movs r1, #0x10
	bl Interpolate
	adds r5, r0, #0
	ldr r4, _0804BC38  @ gUnk_Sio_02001184
	ldr r0, [r4]
	bl sub_80131D0
	ldr r0, [r4]
	movs r2, #0
	str r2, [sp]
	movs r1, #0xf0
	str r1, [sp, #4]
	movs r1, #0xa0
	str r1, [sp, #8]
	str r2, [sp, #0xc]
	str r1, [sp, #0x10]
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	str r6, [sp, #0x14]
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	str r5, [sp, #0x18]
	movs r1, #0
	movs r3, #0xf0
	bl sub_804B9E4
	bl sub_804B9A4
	ldrh r0, [r7]
	adds r0, #1
	strh r0, [r7]
_0804BC2E:
	add sp, #0x1c
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804BC38: .4byte gUnk_Sio_02001184

	THUMB_FUNC_END sub_804BBA0

	THUMB_FUNC_START sub_804BC3C
sub_804BC3C: @ 0x0804BC3C
	ldr r2, _0804BC80  @ gLCDControlBuffer
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
	movs r1, #0x21
	negs r1, r1
	ands r0, r1
	subs r1, #0x20
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r2, #1]
	adds r1, r2, #0
	adds r1, #0x2f
	movs r0, #0
	strb r0, [r1]
	adds r1, #4
	strb r0, [r1]
	subs r1, #5
	movs r0, #0xf0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0xa0
	strb r0, [r1]
	bx lr
	.align 2, 0
_0804BC80: .4byte gLCDControlBuffer

	THUMB_FUNC_END sub_804BC3C

	THUMB_FUNC_START sub_804BC84
sub_804BC84: @ 0x0804BC84
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	ldr r0, _0804BD24  @ gUnknown_085AA7B4
	bl Proc_StartBlocking
	adds r0, #0x64
	movs r2, #0
	strh r4, [r0]
	ldr r0, _0804BD28  @ gLCDControlBuffer
	mov ip, r0
	ldrb r0, [r0, #1]
	movs r1, #1
	mov r8, r1
	mov r1, r8
	orrs r0, r1
	movs r6, #2
	orrs r0, r6
	movs r5, #4
	orrs r0, r5
	movs r4, #8
	orrs r0, r4
	movs r3, #0x10
	orrs r0, r3
	movs r1, #0x21
	negs r1, r1
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	movs r1, #0x7f
	ands r0, r1
	mov r1, ip
	strb r0, [r1, #1]
	mov r0, ip
	adds r0, #0x2f
	strb r2, [r0]
	adds r0, #4
	strb r2, [r0]
	adds r1, #0x2e
	movs r0, #0xf0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0xa0
	strb r0, [r1]
	mov r7, ip
	adds r7, #0x35
	ldrb r1, [r7]
	mov r0, r8
	orrs r1, r0
	orrs r1, r6
	orrs r1, r5
	orrs r1, r4
	orrs r1, r3
	mov r3, ip
	adds r3, #0x36
	ldrb r2, [r3]
	movs r0, #2
	negs r0, r0
	ands r0, r2
	movs r2, #3
	negs r2, r2
	ands r0, r2
	subs r2, #2
	ands r0, r2
	subs r2, #4
	ands r0, r2
	subs r2, #8
	ands r0, r2
	strb r0, [r3]
	movs r0, #0x20
	orrs r1, r0
	strb r1, [r7]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804BD24: .4byte gUnknown_085AA7B4
_0804BD28: .4byte gLCDControlBuffer

	THUMB_FUNC_END sub_804BC84

	THUMB_FUNC_START sub_804BD2C
sub_804BD2C: @ 0x0804BD2C
	push {lr}
	adds r1, r0, #0
	movs r0, #0x40
	bl sub_804BC84
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_804BD2C

	THUMB_FUNC_START sub_804BD3C
sub_804BD3C: @ 0x0804BD3C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	adds r4, r0, #0
	adds r7, r4, #0
	adds r7, #0x4c
	adds r5, r4, #0
	adds r5, #0x64
	movs r0, #0
	ldrsh r1, [r7, r0]
	movs r2, #0
	ldrsh r0, [r5, r2]
	cmp r1, r0
	bne _0804BD64
	movs r0, #0
	bl SetPrimaryHBlankHandler
	adds r0, r4, #0
	bl Proc_Break
	b _0804BDCA
_0804BD64:
	movs r0, #0
	ldrsh r3, [r7, r0]
	movs r1, #0
	ldrsh r0, [r5, r1]
	str r0, [sp]
	movs r0, #4
	movs r1, #0xc0
	movs r2, #0xa0
	bl Interpolate
	adds r6, r0, #0
	movs r1, #0x88
	lsls r1, r1, #1
	movs r2, #0
	ldrsh r3, [r7, r2]
	movs r2, #0
	ldrsh r0, [r5, r2]
	str r0, [sp]
	movs r0, #5
	movs r2, #0x10
	bl Interpolate
	adds r5, r0, #0
	ldr r4, _0804BDD4  @ gUnk_Sio_02001184
	ldr r0, [r4]
	bl sub_80131D0
	ldr r0, [r4]
	movs r2, #0
	str r2, [sp]
	movs r1, #0xf0
	str r1, [sp, #4]
	movs r1, #0xa0
	str r1, [sp, #8]
	str r2, [sp, #0xc]
	str r1, [sp, #0x10]
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	str r6, [sp, #0x14]
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	str r5, [sp, #0x18]
	movs r1, #0
	movs r3, #0xf0
	bl sub_804B9E4
	bl sub_804B9A4
	ldrh r0, [r7]
	adds r0, #1
	strh r0, [r7]
_0804BDCA:
	add sp, #0x1c
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804BDD4: .4byte gUnk_Sio_02001184

	THUMB_FUNC_END sub_804BD3C

	THUMB_FUNC_START sub_804BDD8
sub_804BDD8: @ 0x0804BDD8
	ldr r2, _0804BDF8  @ gLCDControlBuffer
	movs r0, #0
	strb r0, [r2, #1]
	adds r1, r2, #0
	adds r1, #0x2f
	strb r0, [r1]
	adds r1, #4
	strb r0, [r1]
	subs r1, #5
	movs r0, #0xf0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0xa0
	strb r0, [r1]
	bx lr
	.align 2, 0
_0804BDF8: .4byte gLCDControlBuffer

	THUMB_FUNC_END sub_804BDD8

	THUMB_FUNC_START sub_804BDFC
sub_804BDFC: @ 0x0804BDFC
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	ldr r0, _0804BE80  @ gUnknown_085AA7EC
	bl Proc_StartBlocking
	adds r0, #0x64
	movs r2, #0
	strh r4, [r0]
	ldr r3, _0804BE84  @ gLCDControlBuffer
	ldrb r1, [r3, #1]
	movs r0, #0x21
	negs r0, r0
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r3, #1]
	adds r0, r3, #0
	adds r0, #0x2f
	strb r2, [r0]
	adds r0, #4
	strb r2, [r0]
	adds r1, r3, #0
	adds r1, #0x2e
	movs r0, #0xf0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0xa0
	strb r0, [r1]
	adds r4, r3, #0
	adds r4, #0x35
	ldrb r2, [r4]
	movs r0, #1
	orrs r2, r0
	movs r0, #2
	orrs r2, r0
	movs r0, #4
	orrs r2, r0
	movs r0, #8
	orrs r2, r0
	movs r0, #0x10
	orrs r2, r0
	adds r3, #0x36
	ldrb r1, [r3]
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
	strb r0, [r3]
	movs r0, #0x20
	orrs r2, r0
	strb r2, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804BE80: .4byte gUnknown_085AA7EC
_0804BE84: .4byte gLCDControlBuffer

	THUMB_FUNC_END sub_804BDFC

	THUMB_FUNC_START sub_804BE88
sub_804BE88: @ 0x0804BE88
	push {lr}
	adds r1, r0, #0
	movs r0, #0x40
	bl sub_804BDFC
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_804BE88

	THUMB_FUNC_START sub_804BE98
sub_804BE98: @ 0x0804BE98
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0804BEB4  @ gUnknown_085AA7B4
	bl Proc_Find
	cmp r0, #0
	bne _0804BEAC
	adds r0, r4, #0
	bl Proc_Break
_0804BEAC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804BEB4: .4byte gUnknown_085AA7B4

	THUMB_FUNC_END sub_804BE98

	THUMB_FUNC_START sub_804BEB8
sub_804BEB8: @ 0x0804BEB8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0804BED4  @ gUnknown_085AA7EC
	bl Proc_Find
	cmp r0, #0
	bne _0804BECC
	adds r0, r4, #0
	bl Proc_Break
_0804BECC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804BED4: .4byte gUnknown_085AA7EC

	THUMB_FUNC_END sub_804BEB8

	THUMB_FUNC_START sub_804BED8
sub_804BED8: @ 0x0804BED8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0804BF24  @ gUnknown_085AA824
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r0, [r1]
	movs r1, #0xb0
	lsls r1, r1, #2
	movs r2, #0x20
	bl CopyToPaletteBuffer
	ldr r2, [r4, #0x30]
	ldr r1, [r4, #0x34]
	movs r3, #0xd0
	lsls r3, r3, #7
	adds r0, r3, #0
	ldrh r1, [r1, #2]
	adds r0, r0, r1
	strh r0, [r2, #0x22]
	ldr r0, [r4, #0x34]
	ldrb r0, [r0, #1]
	adds r0, #0x10
	lsls r0, r0, #5
	ldr r1, _0804BF28  @ gPaletteBuffer
	adds r0, r0, r1
	movs r1, #0x16
	movs r2, #0x14
	adds r3, r4, #0
	bl StartPalFade
	ldr r0, _0804BF2C  @ gUnknown_085AA83C
	adds r1, r4, #0
	bl Proc_Start
	str r4, [r0, #0x2c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804BF24: .4byte gUnknown_085AA824
_0804BF28: .4byte gPaletteBuffer
_0804BF2C: .4byte gUnknown_085AA83C

	THUMB_FUNC_END sub_804BED8

	THUMB_FUNC_START sub_804BF30
sub_804BF30: @ 0x0804BF30
	ldr r0, [r0, #0x2c]
	ldr r3, [r0, #0x30]
	ldr r2, [r0, #0x34]
	ldrb r1, [r2, #1]
	movs r0, #0xf
	ands r0, r1
	lsls r0, r0, #0xc
	ldrh r2, [r2, #2]
	adds r0, r0, r2
	movs r1, #0x80
	lsls r1, r1, #4
	adds r0, r0, r1
	strh r0, [r3, #0x22]
	bx lr

	THUMB_FUNC_END sub_804BF30

	THUMB_FUNC_START sub_804BF4C
sub_804BF4C: @ 0x0804BF4C
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x3f
	movs r5, #0
	movs r0, #7
	strb r0, [r1]
	ldr r0, _0804BFA4  @ gProcScr_MUDeathFade
	adds r1, r4, #0
	bl Proc_Start
	str r4, [r0, #0x54]
	adds r0, #0x64
	movs r1, #0x20
	strh r1, [r0]
	movs r0, #0
	movs r1, #0x10
	movs r2, #0x10
	movs r3, #0
	bl SetBlendConfig
	ldr r0, [r4, #0x30]
	strh r5, [r0, #0x18]
	ldr r0, [r4, #0x30]
	strh r5, [r0, #0x1a]
	adds r0, r4, #0
	movs r1, #0
	bl sub_804BED8
	ldr r1, [r4, #0x30]
	movs r0, #0xd
	strh r0, [r1, #0x1e]
	ldr r0, _0804BFA8  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0804BF9E
	movs r0, #0xd6
	bl m4aSongNumStart
_0804BF9E:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0804BFA4: .4byte gProcScr_MUDeathFade
_0804BFA8: .4byte gPlaySt

	THUMB_FUNC_END sub_804BF4C

	THUMB_FUNC_START sub_804BFAC
sub_804BFAC: @ 0x0804BFAC
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	ldr r2, [r5, #0x30]
	ldr r1, [r5, #0x34]
	movs r3, #0xd0
	lsls r3, r3, #7
	adds r0, r3, #0
	ldrh r1, [r1, #2]
	adds r0, r0, r1
	strh r0, [r2, #0x22]
	ldr r0, [r5, #0x34]
	ldrb r0, [r0, #1]
	adds r0, #0x10
	lsls r0, r0, #5
	ldr r1, _0804BFF0  @ gPaletteBuffer
	adds r0, r0, r1
	movs r1, #0xb0
	lsls r1, r1, #2
	movs r2, #0x20
	bl CopyToPaletteBuffer
	ldr r0, _0804BFF4  @ gUnknown_085AA824
	lsls r4, r4, #2
	adds r4, r4, r0
	ldr r0, [r4]
	movs r1, #0x16
	movs r2, #8
	adds r3, r5, #0
	bl StartPalFade
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0804BFF0: .4byte gPaletteBuffer
_0804BFF4: .4byte gUnknown_085AA824

	THUMB_FUNC_END sub_804BFAC

	THUMB_FUNC_START sub_804BFF8
sub_804BFF8: @ 0x0804BFF8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x34]
	ldrb r0, [r0, #1]
	adds r0, #0x10
	lsls r0, r0, #5
	ldr r1, _0804C024  @ gPaletteBuffer
	adds r0, r0, r1
	movs r1, #0x16
	movs r2, #8
	adds r3, r4, #0
	bl StartPalFade
	ldr r0, _0804C028  @ gProcScr_MU_89A2CF8
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x54]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804C024: .4byte gPaletteBuffer
_0804C028: .4byte gProcScr_MU_89A2CF8

	THUMB_FUNC_END sub_804BFF8

	THUMB_FUNC_START sub_804C02C
sub_804C02C: @ 0x0804C02C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0804C06C  @ gUnknown_089AE224
	ldr r1, _0804C070  @ 0x06004400
	bl Decompress
	ldr r0, _0804C074  @ gUnknown_089AE484
	movs r1, #0x60
	movs r2, #0x20
	bl CopyToPaletteBuffer
	adds r1, r4, #0
	adds r1, #0x40
	movs r0, #0
	strb r0, [r1]
	adds r0, r4, #0
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0804C064
	ldr r2, [r4, #0x34]
	lsls r2, r2, #3
	movs r0, #0x7f
	movs r1, #2
	bl MU_StartStepSfx
_0804C064:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804C06C: .4byte gUnknown_089AE224
_0804C070: .4byte 0x06004400
_0804C074: .4byte gUnknown_089AE484

	THUMB_FUNC_END sub_804C02C

	THUMB_FUNC_START sub_804C078
sub_804C078: @ 0x0804C078
	push {r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r7, r0, #0
	ldr r0, _0804C118  @ gBG2TilemapBuffer
	ldr r1, [r7, #0x34]
	subs r1, #1
	ldr r2, [r7, #0x38]
	subs r2, #3
	ldr r3, _0804C11C  @ 0x00003220
	movs r4, #4
	str r4, [sp]
	movs r4, #6
	str r4, [sp, #4]
	ldr r4, _0804C120  @ gUnknown_089AE4A4
	str r4, [sp, #8]
	ldr r6, _0804C124  @ gUnknown_085AA854
	adds r5, r7, #0
	adds r5, #0x40
	ldrb r4, [r5]
	adds r4, r4, r6
	ldrb r4, [r4]
	str r4, [sp, #0xc]
	bl sub_80146A0
	movs r0, #4
	bl BG_EnableSyncByMask
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
	ldrb r0, [r5]
	adds r0, r0, r6
	ldrb r0, [r0]
	cmp r0, #0xff
	bne _0804C0C4
	adds r0, r7, #0
	bl Proc_Break
_0804C0C4:
	ldr r2, _0804C128  @ gLCDControlBuffer
	ldrb r3, [r2, #0xc]
	movs r1, #4
	negs r1, r1
	adds r0, r1, #0
	ands r0, r3
	strb r0, [r2, #0xc]
	ldrb r3, [r2, #0x10]
	adds r0, r1, #0
	ands r0, r3
	strb r0, [r2, #0x10]
	ldrb r0, [r2, #0x14]
	ands r1, r0
	strb r1, [r2, #0x14]
	ldrb r0, [r2, #0x18]
	movs r1, #3
	orrs r0, r1
	strb r0, [r2, #0x18]
	movs r0, #0
	str r0, [sp]
	movs r1, #0
	movs r2, #1
	movs r3, #0
	bl SetBlendTargetA
	movs r0, #1
	str r0, [sp]
	movs r1, #1
	movs r2, #0
	movs r3, #1
	bl SetBlendTargetB
	movs r0, #1
	movs r1, #0xc
	movs r2, #0xc
	movs r3, #0
	bl SetBlendConfig
	add sp, #0x10
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804C118: .4byte gBG2TilemapBuffer
_0804C11C: .4byte 0x00003220
_0804C120: .4byte gUnknown_089AE4A4
_0804C124: .4byte gUnknown_085AA854
_0804C128: .4byte gLCDControlBuffer

	THUMB_FUNC_END sub_804C078

	THUMB_FUNC_START sub_804C12C
sub_804C12C: @ 0x0804C12C
	push {lr}
	ldr r0, _0804C144  @ gBG2TilemapBuffer
	movs r1, #0
	bl BG_Fill
	movs r0, #4
	bl BG_EnableSyncByMask
	bl SetDefaultColorEffects
	pop {r0}
	bx r0
	.align 2, 0
_0804C144: .4byte gBG2TilemapBuffer

	THUMB_FUNC_END sub_804C12C

	THUMB_FUNC_START sub_804C148
sub_804C148: @ 0x0804C148
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0804C174  @ ProcScr_SIOWARP
	movs r1, #2
	bl Proc_Start
	ldr r2, [r4, #0x2c]
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	lsls r1, r1, #1
	str r1, [r0, #0x34]
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	lsls r1, r1, #1
	str r1, [r0, #0x38]
	adds r4, #0x41
	ldrb r1, [r4]
	adds r0, #0x41
	strb r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804C174: .4byte ProcScr_SIOWARP

	THUMB_FUNC_END sub_804C148

	THUMB_FUNC_START sub_804C178
sub_804C178: @ 0x0804C178
	push {lr}
	ldr r0, [r0, #0x30]
	movs r1, #0
	bl sub_804BFAC
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_804C178

	THUMB_FUNC_START sub_804C188
sub_804C188: @ 0x0804C188
	push {lr}
	ldr r0, [r0, #0x30]
	bl MU_Hide
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_804C188

	THUMB_FUNC_START sub_804C194
sub_804C194: @ 0x0804C194
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x30]
	ldr r1, [r4, #0x34]
	lsls r1, r1, #4
	ldr r2, [r4, #0x38]
	lsls r2, r2, #4
	bl MU_SetDisplayPosition
	ldr r1, [r4, #0x2c]
	ldr r0, [r4, #0x34]
	strb r0, [r1, #0x10]
	ldr r1, [r4, #0x2c]
	ldr r0, [r4, #0x38]
	strb r0, [r1, #0x11]
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_804C194

	THUMB_FUNC_START sub_804C1B8
sub_804C1B8: @ 0x0804C1B8
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x3c]
	movs r0, #1
	negs r0, r0
	cmp r1, r0
	beq _0804C1CC
	ldr r0, [r4, #0x30]
	bl MU_SetFacing
_0804C1CC:
	ldr r0, [r4, #0x30]
	bl MU_Show
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_804C1B8

	THUMB_FUNC_START sub_804C1D8
sub_804C1D8: @ 0x0804C1D8
	push {lr}
	ldr r0, [r0, #0x30]
	bl sub_804BFF8
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_804C1D8

	THUMB_FUNC_START sub_804C1E4
sub_804C1E4: @ 0x0804C1E4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0804C204  @ ProcScr_SIOWARP
	bl Proc_Find
	negs r1, r0
	orrs r1, r0
	cmp r1, #0
	blt _0804C1FC
	adds r0, r4, #0
	bl Proc_Break
_0804C1FC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804C204: .4byte ProcScr_SIOWARP

	THUMB_FUNC_END sub_804C1E4

	THUMB_FUNC_START sub_804C208
sub_804C208: @ 0x0804C208
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	adds r6, r1, #0
	adds r7, r2, #0
	mov r8, r3
	ldr r0, [sp, #0x1c]
	ldr r1, [sp, #0x20]
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r1, #0
	beq _0804C230
	ldr r0, _0804C22C  @ ProcScr_SIOWARPFX
	bl Proc_StartBlocking
	b _0804C238
	.align 2, 0
_0804C22C: .4byte ProcScr_SIOWARPFX
_0804C230:
	ldr r0, _0804C25C  @ ProcScr_SIOWARPFX
	movs r1, #2
	bl Proc_Start
_0804C238:
	adds r1, r0, #0
	str r5, [r1, #0x2c]
	str r6, [r1, #0x30]
	str r7, [r1, #0x34]
	mov r0, r8
	str r0, [r1, #0x38]
	ldr r0, [sp, #0x18]
	str r0, [r1, #0x3c]
	adds r0, r1, #0
	adds r0, #0x41
	strb r4, [r0]
	adds r0, r1, #0
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0804C25C: .4byte ProcScr_SIOWARPFX

	THUMB_FUNC_END sub_804C208

	THUMB_FUNC_START sub_804C260
sub_804C260: @ 0x0804C260
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	adds r6, r1, #0
	adds r7, r2, #0
	mov r8, r3
	ldr r0, [sp, #0x1c]
	ldr r1, [sp, #0x20]
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r1, #0
	beq _0804C288
	ldr r0, _0804C284  @ gUnknown_085AA914
	bl Proc_StartBlocking
	b _0804C290
	.align 2, 0
_0804C284: .4byte gUnknown_085AA914
_0804C288:
	ldr r0, _0804C2B4  @ gUnknown_085AA914
	movs r1, #2
	bl Proc_Start
_0804C290:
	adds r1, r0, #0
	str r5, [r1, #0x2c]
	str r6, [r1, #0x30]
	str r7, [r1, #0x34]
	mov r0, r8
	str r0, [r1, #0x38]
	ldr r0, [sp, #0x18]
	str r0, [r1, #0x3c]
	adds r0, r1, #0
	adds r0, #0x41
	strb r4, [r0]
	adds r0, r1, #0
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0804C2B4: .4byte gUnknown_085AA914

	THUMB_FUNC_END sub_804C260

	THUMB_FUNC_START sub_804C2B8
sub_804C2B8: @ 0x0804C2B8
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r2, r1, #0
	ldr r3, _0804C2D8  @ gUnknown_080D9FD6
	movs r0, #0
	str r0, [sp]
	movs r0, #4
	adds r1, r4, #0
	bl PutSprite
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804C2D8: .4byte gUnknown_080D9FD6

	THUMB_FUNC_END sub_804C2B8

	THUMB_FUNC_START sub_804C2DC
sub_804C2DC: @ 0x0804C2DC
	push {lr}
	ldr r2, [r0, #0x2c]
	ldr r1, [r0, #0x30]
	adds r0, r2, #0
	bl sub_804C2B8
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_804C2DC

	THUMB_FUNC_START sub_804C2EC
sub_804C2EC: @ 0x0804C2EC
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r6, r0, #0
	mov r8, r1
	adds r5, r2, #0
	ldr r4, _0804C318  @ gUnknown_085AA954
	adds r0, r4, #0
	bl Proc_EndEach
	adds r0, r4, #0
	adds r1, r5, #0
	bl Proc_Start
	str r6, [r0, #0x2c]
	mov r1, r8
	str r1, [r0, #0x30]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0804C318: .4byte gUnknown_085AA954

	THUMB_FUNC_END sub_804C2EC

	THUMB_FUNC_START sub_804C31C
sub_804C31C: @ 0x0804C31C
	push {r4, lr}
	ldr r4, _0804C338  @ gUnknown_085AA954
	adds r0, r4, #0
	bl Proc_Find
	cmp r0, #0
	beq _0804C330
	adds r0, r4, #0
	bl Proc_EndEach
_0804C330:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804C338: .4byte gUnknown_085AA954

	THUMB_FUNC_END sub_804C31C

	THUMB_FUNC_START InitSioBG
InitSioBG: @ 0x0804C33C
	push {lr}
	sub sp, #0x18
	ldr r1, _0804C394  @ SioDefaultBgConfig
	mov r0, sp
	movs r2, #0x18
	bl memcpy
	mov r0, sp
	bl SetupBackgrounds
	ldr r3, _0804C398  @ gLCDControlBuffer
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
	bl ReadGameSaveCoreGfx
	ldr r0, _0804C39C  @ Pal_LinkArenaRankIcons
	movs r1, #0xc0
	lsls r1, r1, #2
	movs r2, #0x40
	bl CopyToPaletteBuffer
	add sp, #0x18
	pop {r0}
	bx r0
	.align 2, 0
_0804C394: .4byte SioDefaultBgConfig
_0804C398: .4byte gLCDControlBuffer
_0804C39C: .4byte Pal_LinkArenaRankIcons

	THUMB_FUNC_END InitSioBG

	THUMB_FUNC_START sub_804C3A0
sub_804C3A0: @ 0x0804C3A0
	bx lr

	THUMB_FUNC_END sub_804C3A0

	THUMB_FUNC_START sub_804C3A4
sub_804C3A4: @ 0x0804C3A4
	bx lr

	THUMB_FUNC_END sub_804C3A4

	THUMB_FUNC_START nullsub_13
nullsub_13: @ 0x0804C3A8
	bx lr

	THUMB_FUNC_END nullsub_13

	THUMB_FUNC_START sub_804C3AC
sub_804C3AC: @ 0x0804C3AC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	adds r5, r1, #0
	lsls r2, r2, #5
	mov r8, r2
	cmp r3, #0
	ble _0804C3E2
	movs r7, #0x80
	lsls r7, r7, #3
	adds r4, r3, #0
_0804C3C4:
	mov r2, r8
	cmp r2, #0
	bge _0804C3CC
	adds r2, #3
_0804C3CC:
	lsls r2, r2, #9
	lsrs r2, r2, #0xb
	adds r0, r6, #0
	adds r1, r5, #0
	bl CpuFastSet
	adds r6, r6, r7
	adds r5, r5, r7
	subs r4, #1
	cmp r4, #0
	bne _0804C3C4
_0804C3E2:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_804C3AC

	THUMB_FUNC_START sub_804C3EC
sub_804C3EC: @ 0x0804C3EC
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	mov r8, r0
	ldr r5, [r0, #0x58]
	adds r0, r5, #0
	movs r1, #3
	bl __modsi3
	lsls r4, r0, #2
	adds r4, r4, r0
	lsls r4, r4, #6
	adds r0, r5, #0
	movs r1, #3
	bl __divsi3
	adds r5, r0, #0
	lsls r5, r5, #0xb
	ldr r0, _0804C464  @ gUnknown_085B0DE8
	mov r2, r8
	ldr r1, [r2, #0x5c]
	movs r3, #0xc0
	lsls r3, r3, #0x13
	adds r1, r1, r3
	bl Decompress
	ldr r0, _0804C468  @ gUnknown_085AAE0C
	ldr r6, _0804C46C  @ gGenericBuffer
	adds r1, r6, #0
	bl Decompress
	adds r4, r4, r5
	adds r4, r4, r6
	ldr r1, _0804C470  @ 0x06014000
	adds r0, r4, #0
	movs r2, #0xa
	movs r3, #2
	bl sub_804C3AC
	ldr r0, _0804C474  @ gBG2TilemapBuffer
	ldr r1, _0804C478  @ gUnknown_085B0F2C
	mov r4, r8
	ldr r2, [r4, #0x5c]
	lsls r2, r2, #0xf
	lsrs r2, r2, #0x14
	movs r4, #0x80
	lsls r4, r4, #5
	adds r3, r4, #0
	orrs r2, r3
	bl CallARM_FillTileRect
	movs r0, #4
	bl BG_EnableSyncByMask
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0804C464: .4byte gUnknown_085B0DE8
_0804C468: .4byte gUnknown_085AAE0C
_0804C46C: .4byte gGenericBuffer
_0804C470: .4byte 0x06014000
_0804C474: .4byte gBG2TilemapBuffer
_0804C478: .4byte gUnknown_085B0F2C

	THUMB_FUNC_END sub_804C3EC

	THUMB_FUNC_START sub_804C47C
sub_804C47C: @ 0x0804C47C
	push {lr}
	sub sp, #4
	ldr r3, _0804C498  @ gUnknown_085AA96C
	movs r0, #0
	str r0, [sp]
	movs r0, #4
	movs r1, #0x14
	movs r2, #8
	bl PutSpriteExt
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_0804C498: .4byte gUnknown_085AA96C

	THUMB_FUNC_END sub_804C47C

	THUMB_FUNC_START NewProc085AA980
NewProc085AA980: @ 0x0804C49C
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r6, r0, #0
	mov r8, r1
	adds r5, r2, #0
	ldr r4, _0804C4F4  @ ProcScr_085AA980
	adds r0, r4, #0
	bl Proc_EndEach
	adds r0, r4, #0
	adds r1, r6, #0
	bl Proc_Start
	adds r6, r0, #0
	mov r0, r8
	str r0, [r6, #0x58]
	str r5, [r6, #0x5c]
	cmp r5, #0
	bne _0804C4CA
	movs r0, #0xb8
	lsls r0, r0, #7
	str r0, [r6, #0x5c]
_0804C4CA:
	ldr r4, [r6, #0x58]
	adds r0, r4, #0
	movs r1, #3
	bl __modsi3
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #6
	str r1, [r6, #0x2c]
	adds r0, r4, #0
	movs r1, #3
	bl __divsi3
	lsls r0, r0, #0xb
	str r0, [r6, #0x30]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0804C4F4: .4byte ProcScr_085AA980

	THUMB_FUNC_END NewProc085AA980

	THUMB_FUNC_START sub_804C4F8
sub_804C4F8: @ 0x0804C4F8
	push {lr}
	ldr r0, _0804C504  @ ProcScr_085AA980
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
_0804C504: .4byte ProcScr_085AA980

	THUMB_FUNC_END sub_804C4F8

	THUMB_FUNC_START sub_804C508
sub_804C508: @ 0x0804C508
	push {r4, lr}
	sub sp, #4
	movs r0, #1
	movs r1, #0x10
	movs r2, #4
	movs r3, #0
	bl SetBlendConfig
	movs r4, #0
	str r4, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #1
	movs r3, #0
	bl SetBlendTargetA
	str r4, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #1
	bl SetBlendTargetB
	ldr r2, _0804C554  @ gLCDControlBuffer
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
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804C554: .4byte gLCDControlBuffer

	THUMB_FUNC_END sub_804C508

	THUMB_FUNC_START sub_804C558
sub_804C558: @ 0x0804C558
	push {r4, lr}
	sub sp, #4
	movs r0, #1
	movs r1, #0x10
	movs r2, #4
	movs r3, #0
	bl SetBlendConfig
	movs r4, #0
	str r4, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #1
	movs r3, #0
	bl SetBlendTargetA
	str r4, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #1
	bl SetBlendTargetB
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_804C558

	THUMB_FUNC_START sub_804C590
sub_804C590: @ 0x0804C590
	push {lr}
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl SetBlendConfig
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_804C590

	THUMB_FUNC_START sub_804C5A4
sub_804C5A4: @ 0x0804C5A4
	push {r4, lr}
	sub sp, #0x20
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r1, _0804C5E8  @ gUnknown_080DA0DA
	mov r0, sp
	movs r2, #0x20
	bl memcpy
	ldr r0, _0804C5EC  @ gUnk_Sio_0203DDDC
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _0804C5DE
	mov r1, sp
	adds r0, r1, r4
	ldrb r1, [r0]
	adds r1, #0x10
	ldr r3, _0804C5F0  @ gPaletteBuffer
	lsls r0, r1, #0xa
	lsls r2, r1, #5
	adds r0, r0, r2
	adds r0, r0, r1
	ldr r1, _0804C5F4  @ 0x00000262
	adds r3, r3, r1
	strh r0, [r3]
	bl EnablePaletteSync
_0804C5DE:
	add sp, #0x20
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804C5E8: .4byte gUnknown_080DA0DA
_0804C5EC: .4byte gUnk_Sio_0203DDDC
_0804C5F0: .4byte gPaletteBuffer
_0804C5F4: .4byte 0x00000262

	THUMB_FUNC_END sub_804C5A4

	THUMB_FUNC_START sub_804C5F8
sub_804C5F8: @ 0x0804C5F8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r7, r0, #0
	ldr r0, _0804C73C  @ 0x000082C8
	mov r8, r0
	movs r2, #0x2a
	ldrsh r1, [r7, r2]
	movs r3, #0x2c
	ldrsh r2, [r7, r3]
	ldr r3, _0804C740  @ gUnknown_085AA9A0
	adds r0, r7, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r3
	ldr r3, [r0]
	ldr r4, _0804C744  @ gUnknown_080DA09C
	adds r5, r7, #0
	adds r5, #0x2e
	ldrb r0, [r5]
	lsls r0, r0, #1
	adds r0, r0, r4
	ldrh r0, [r0]
	str r0, [sp]
	movs r0, #4
	bl PutSprite
	ldrb r0, [r5]
	cmp r0, #2
	bne _0804C642
	adds r0, r7, #0
	adds r0, #0x30
	ldrb r0, [r0]
	bl sub_804C5A4
_0804C642:
	adds r2, r7, #0
	adds r2, #0x30
	ldrb r0, [r2]
	adds r0, #1
	movs r1, #0x1f
	ands r0, r1
	strb r0, [r2]
	ldrh r1, [r7, #0x2e]
	movs r0, #0x81
	lsls r0, r0, #1
	cmp r1, r0
	bne _0804C72E
	ldrh r1, [r7, #0x3a]
	ldrh r2, [r7, #0x36]
	adds r0, r1, r2
	strh r0, [r7, #0x36]
	ldrh r2, [r7, #0x3c]
	ldrh r3, [r7, #0x38]
	adds r0, r2, r3
	strh r0, [r7, #0x38]
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	cmp r0, #4
	ble _0804C676
	subs r0, r1, #1
	strh r0, [r7, #0x3a]
_0804C676:
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	cmp r0, #4
	ble _0804C682
	subs r0, r2, #1
	strh r0, [r7, #0x3c]
_0804C682:
	bl GetGameClock
	movs r1, #3
	ands r1, r0
	cmp r1, #0
	bne _0804C6AA
	ldrh r1, [r7, #0x32]
	movs r2, #0x32
	ldrsh r0, [r7, r2]
	cmp r0, #0
	bge _0804C69C
	adds r0, r1, #1
	strh r0, [r7, #0x32]
_0804C69C:
	ldrh r1, [r7, #0x34]
	movs r3, #0x34
	ldrsh r0, [r7, r3]
	cmp r0, #0x34
	ble _0804C6AA
	subs r0, r1, #1
	strh r0, [r7, #0x34]
_0804C6AA:
	movs r0, #0x2a
	ldrsh r5, [r7, r0]
	movs r1, #0x32
	ldrsh r0, [r7, r1]
	adds r0, #0x4b
	adds r5, r5, r0
	movs r2, #0x2c
	ldrsh r4, [r7, r2]
	adds r4, #8
	ldr r6, _0804C748  @ gObject_8x16
	ldrh r0, [r7, #0x36]
	lsrs r0, r0, #5
	movs r1, #6
	bl __umodsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	add r0, r8
	str r0, [sp]
	movs r0, #0
	adds r1, r5, #0
	adds r2, r4, #0
	adds r3, r6, #0
	bl PutSprite
	movs r3, #0x2a
	ldrsh r5, [r7, r3]
	movs r1, #0x34
	ldrsh r0, [r7, r1]
	adds r0, #0x49
	adds r5, r5, r0
	movs r2, #0x2c
	ldrsh r4, [r7, r2]
	adds r4, #8
	ldr r6, _0804C74C  @ gObject_8x16_HFlipped
	ldrh r0, [r7, #0x38]
	lsrs r0, r0, #5
	movs r1, #6
	bl __umodsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	add r0, r8
	str r0, [sp]
	movs r0, #0
	adds r1, r5, #0
	adds r2, r4, #0
	adds r3, r6, #0
	bl PutSprite
	movs r3, #0x2a
	ldrsh r1, [r7, r3]
	adds r1, #0x50
	movs r0, #0x2c
	ldrsh r2, [r7, r0]
	adds r2, #9
	ldr r3, _0804C750  @ gUnknown_085AA9B4
	ldr r0, _0804C754  @ gLinkArenaSt
	ldrb r0, [r0, #5]
	lsls r0, r0, #2
	adds r0, r0, r3
	ldr r3, [r0]
	movs r0, #0
	str r0, [sp]
	bl PutSpriteExt
_0804C72E:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804C73C: .4byte 0x000082C8
_0804C740: .4byte gUnknown_085AA9A0
_0804C744: .4byte gUnknown_080DA09C
_0804C748: .4byte gObject_8x16
_0804C74C: .4byte gObject_8x16_HFlipped
_0804C750: .4byte gUnknown_085AA9B4
_0804C754: .4byte gLinkArenaSt

	THUMB_FUNC_END sub_804C5F8

	THUMB_FUNC_START sub_804C758
sub_804C758: @ 0x0804C758
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #4
	mov r8, r0
	adds r4, r1, #0
	adds r5, r2, #0
	adds r2, r3, #0
	ldr r6, [sp, #0x18]
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	ldr r0, _0804C7C4  @ gUnknown_085AA9C0
	mov r1, r8
	str r2, [sp]
	bl Proc_Start
	mov r8, r0
	movs r3, #0
	movs r1, #0
	strh r4, [r0, #0x2a]
	strh r5, [r0, #0x2c]
	adds r0, #0x2e
	strb r6, [r0]
	adds r0, #1
	ldr r2, [sp]
	strb r2, [r0]
	mov r0, r8
	strh r1, [r0, #0x32]
	movs r0, #0x34
	mov r2, r8
	strh r0, [r2, #0x34]
	strh r1, [r2, #0x38]
	strh r1, [r2, #0x36]
	movs r0, #4
	strh r0, [r2, #0x3c]
	strh r0, [r2, #0x3a]
	mov r0, r8
	adds r0, #0x3e
	strb r3, [r0]
	subs r0, #0xe
	strb r3, [r0]
	mov r0, r8
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0804C7C4: .4byte gUnknown_085AA9C0

	THUMB_FUNC_END sub_804C758

	THUMB_FUNC_START sub_804C7C8
sub_804C7C8: @ 0x0804C7C8
	push {r4, lr}
	ldr r4, [sp, #8]
	strh r1, [r0, #0x32]
	strh r2, [r0, #0x34]
	strh r3, [r0, #0x3a]
	strh r4, [r0, #0x3c]
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_804C7C8

	THUMB_FUNC_START sub_804C7DC
sub_804C7DC: @ 0x0804C7DC
	strh r1, [r0, #0x2a]
	strh r2, [r0, #0x2c]
	bx lr

	THUMB_FUNC_END sub_804C7DC

	THUMB_FUNC_START sub_804C7E4
sub_804C7E4: @ 0x0804C7E4
	push {r4, lr}
	sub sp, #0x20
	ldr r4, _0804C82C  @ gUnknown_085ADDE8
	ldr r1, _0804C830  @ gUnknown_080DA102
	mov r0, sp
	movs r2, #0x20
	bl memcpy
	ldr r0, _0804C834  @ gUnk_Sio_0203DDDC
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _0804C824
	bl GetGameClock
	movs r1, #0x3f
	ands r1, r0
	asrs r1, r1, #1
	mov r2, sp
	adds r0, r2, r1
	ldrb r0, [r0]
	ldr r1, _0804C838  @ gPaletteBuffer
	lsls r0, r0, #1
	adds r0, r0, r4
	ldrh r0, [r0]
	movs r2, #0xc7
	lsls r2, r2, #2
	adds r1, r1, r2
	strh r0, [r1]
	bl EnablePaletteSync
_0804C824:
	add sp, #0x20
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804C82C: .4byte gUnknown_085ADDE8
_0804C830: .4byte gUnknown_080DA102
_0804C834: .4byte gUnk_Sio_0203DDDC
_0804C838: .4byte gPaletteBuffer

	THUMB_FUNC_END sub_804C7E4

	THUMB_FUNC_START sub_804C83C
sub_804C83C: @ 0x0804C83C
	push {r4, lr}
	sub sp, #0x20
	ldr r4, _0804C884  @ gUnknown_085ADE48
	ldr r1, _0804C888  @ gUnknown_080DA0DA
	mov r0, sp
	movs r2, #0x20
	bl memcpy
	ldr r0, _0804C88C  @ gUnk_Sio_0203DDDC
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _0804C87C
	bl GetGameClock
	movs r1, #0x3f
	ands r1, r0
	asrs r1, r1, #1
	mov r2, sp
	adds r0, r2, r1
	ldrb r0, [r0]
	ldr r1, _0804C890  @ gPaletteBuffer
	lsls r0, r0, #1
	adds r0, r0, r4
	ldrh r0, [r0]
	movs r2, #0x9f
	lsls r2, r2, #2
	adds r1, r1, r2
	strh r0, [r1]
	bl EnablePaletteSync
_0804C87C:
	add sp, #0x20
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804C884: .4byte gUnknown_085ADE48
_0804C888: .4byte gUnknown_080DA0DA
_0804C88C: .4byte gUnk_Sio_0203DDDC
_0804C890: .4byte gPaletteBuffer

	THUMB_FUNC_END sub_804C83C

	THUMB_FUNC_START sub_804C894
sub_804C894: @ 0x0804C894
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r7, r0, #0
	ldr r0, _0804C9E4  @ gLinkArenaSt
	ldrb r0, [r0]
	cmp r0, #1
	beq _0804C8AC
	b _0804CA08
_0804C8AC:
	adds r0, r7, #0
	adds r0, #0x44
	movs r1, #0
	ldrsb r1, [r0, r1]
	movs r2, #0xc0
	lsls r2, r2, #4
	mov r8, r2
	str r0, [sp, #4]
	cmp r1, #0
	beq _0804C8C6
	movs r0, #0x80
	lsls r0, r0, #3
	mov r8, r0
_0804C8C6:
	ldr r3, _0804C9E8  @ gUnknown_085AA9D8
	movs r0, #0
	str r0, [sp]
	movs r1, #0x58
	movs r2, #0x20
	bl PutSprite
	movs r6, #0
	ldr r0, [r7, #0x2c]
	cmp r6, r0
	bge _0804C92A
	movs r5, #0x20
_0804C8DE:
	lsls r1, r6, #1
	adds r0, r7, #0
	adds r0, #0x30
	adds r4, r0, r1
	movs r2, #0
	ldrsh r1, [r4, r2]
	adds r1, #6
	movs r0, #0xf
	ands r0, r6
	lsls r0, r0, #0xc
	add r0, r8
	str r0, [sp]
	movs r0, #4
	adds r2, r5, #0
	ldr r3, _0804C9EC  @ Sprite_085AAA50
	bl PutSprite
	adds r0, r7, #0
	adds r0, #0x3a
	adds r0, r0, r6
	ldrb r0, [r0]
	cmp r0, #0
	beq _0804C920
	movs r0, #0
	ldrsh r1, [r4, r0]
	adds r1, #6
	mov r2, r8
	str r2, [sp]
	movs r0, #4
	adds r2, r5, #0
	ldr r3, _0804C9F0  @ gUnknown_085AAA5E
	bl PutSprite
_0804C920:
	adds r5, #0x18
	adds r6, #1
	ldr r0, [r7, #0x2c]
	cmp r6, r0
	blt _0804C8DE
_0804C92A:
	ldr r0, [r7, #0x40]
	cmp r0, #0
	beq _0804C9DE
	ldr r0, _0804C9F4  @ gUnk_Sio_0203DDDC
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _0804C95C
	bl GetGameClock
	ldr r2, _0804C9F8  @ gPaletteBuffer
	movs r1, #0x3f
	ands r1, r0
	lsrs r1, r1, #2
	lsls r1, r1, #1
	ldr r0, _0804C9FC  @ gUnknown_08A1BD40
	adds r1, r1, r0
	ldrh r0, [r1]
	movs r1, #0xc7
	lsls r1, r1, #2
	adds r2, r2, r1
	strh r0, [r2]
	bl EnablePaletteSync
_0804C95C:
	ldr r0, [r7, #0x40]
	cmp r0, #0xff
	bgt _0804C966
	adds r0, #0x10
	str r0, [r7, #0x40]
_0804C966:
	ldr r4, _0804CA00  @ gSinLookup
	movs r2, #0x80
	adds r2, r2, r4
	mov r9, r2
	movs r1, #0
	ldrsh r0, [r2, r1]
	lsls r0, r0, #4
	movs r2, #0x80
	lsls r2, r2, #1
	mov r8, r2
	mov r1, r8
	bl Div
	adds r6, r0, #0
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	movs r1, #0
	ldrsh r0, [r4, r1]
	negs r0, r0
	lsls r0, r0, #4
	ldr r1, [r7, #0x40]
	bl Div
	adds r5, r0, #0
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	movs r2, #0
	ldrsh r0, [r4, r2]
	lsls r0, r0, #4
	mov r1, r8
	bl Div
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	mov r1, r9
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #4
	ldr r1, [r7, #0x40]
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	movs r0, #0
	adds r1, r6, #0
	adds r2, r5, #0
	adds r3, r4, #0
	bl SetObjAffine
	ldr r3, _0804CA04  @ gUnknown_080DA0FA
	movs r0, #0x80
	lsls r0, r0, #8
	str r0, [sp]
	movs r0, #4
	movs r1, #0x78
	movs r2, #0
	bl PutSprite
_0804C9DE:
	bl sub_804C83C
	b _0804CA96
	.align 2, 0
_0804C9E4: .4byte gLinkArenaSt
_0804C9E8: .4byte gUnknown_085AA9D8
_0804C9EC: .4byte Sprite_085AAA50
_0804C9F0: .4byte gUnknown_085AAA5E
_0804C9F4: .4byte gUnk_Sio_0203DDDC
_0804C9F8: .4byte gPaletteBuffer
_0804C9FC: .4byte gUnknown_08A1BD40
_0804CA00: .4byte gSinLookup
_0804CA04: .4byte gUnknown_080DA0FA
_0804CA08:
	ldr r3, _0804CA70  @ gUnknown_085AA9D8
	movs r0, #0
	str r0, [sp]
	movs r0, #0xb
	movs r1, #0x58
	movs r2, #0x20
	bl PutSprite
	movs r6, #0
	ldr r0, [r7, #0x2c]
	adds r1, r7, #0
	adds r1, #0x44
	str r1, [sp, #4]
	cmp r6, r0
	bge _0804CA92
	ldr r2, _0804CA74  @ gUnknown_085AAA48
	mov sl, r2
	movs r0, #8
	negs r0, r0
	mov r9, r0
	movs r1, #0x30
	mov r8, r1
_0804CA34:
	lsls r1, r6, #1
	adds r0, r7, #0
	adds r0, #0x30
	adds r5, r0, r1
	movs r2, #0
	ldrsh r1, [r5, r2]
	adds r4, r7, #0
	adds r4, #0x3a
	adds r4, r4, r6
	ldrb r0, [r4]
	lsls r0, r0, #2
	add r0, sl
	ldr r3, [r0]
	movs r0, #0
	str r0, [sp]
	movs r0, #2
	mov r2, r8
	bl PutSprite
	ldrb r0, [r4]
	cmp r0, #0
	beq _0804CA78
	ldrh r1, [r5]
	movs r2, #0
	ldrsh r0, [r5, r2]
	cmp r0, #0
	bge _0804CA86
	adds r0, r1, #1
	b _0804CA84
	.align 2, 0
_0804CA70: .4byte gUnknown_085AA9D8
_0804CA74: .4byte gUnknown_085AAA48
_0804CA78:
	ldrh r1, [r5]
	movs r2, #0
	ldrsh r0, [r5, r2]
	cmp r0, r9
	ble _0804CA86
	subs r0, r1, #1
_0804CA84:
	strh r0, [r5]
_0804CA86:
	movs r0, #0x10
	add r8, r0
	adds r6, #1
	ldr r0, [r7, #0x2c]
	cmp r6, r0
	blt _0804CA34
_0804CA92:
	bl sub_804C7E4
_0804CA96:
	ldr r0, _0804CAE4  @ gLinkArenaSt
	ldrb r0, [r0]
	movs r1, #0x80
	lsls r1, r1, #4
	mov r8, r1
	cmp r0, #1
	bne _0804CAAA
	movs r2, #0x80
	lsls r2, r2, #3
	mov r8, r2
_0804CAAA:
	ldr r1, [sp, #4]
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	beq _0804CABC
	movs r0, #0xc0
	movs r1, #0x10
	bl sub_804C2B8
_0804CABC:
	ldr r0, [r7, #0x48]
	cmp r0, #0
	blt _0804CAD4
	adds r2, r0, #0
	adds r2, #8
	ldr r3, _0804CAE8  @ gUnknown_085AAA0E
	mov r0, r8
	str r0, [sp]
	movs r0, #4
	movs r1, #0x50
	bl PutSprite
_0804CAD4:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804CAE4: .4byte gLinkArenaSt
_0804CAE8: .4byte gUnknown_085AAA0E

	THUMB_FUNC_END sub_804C894

	THUMB_FUNC_START sub_804CAEC
sub_804CAEC: @ 0x0804CAEC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	adds r6, r0, #0
	adds r5, r1, #0
	mov r8, r2
	ldr r4, _0804CB8C  @ gUnknown_085AAA78
	adds r0, r4, #0
	bl Proc_EndEach
	adds r0, r4, #0
	adds r1, r6, #0
	bl Proc_Start
	adds r4, r0, #0
	str r5, [r4, #0x2c]
	adds r1, r4, #0
	adds r1, #0x44
	movs r2, #0
	movs r0, #1
	strb r0, [r1]
	str r2, [r4, #0x40]
	subs r0, #2
	str r0, [r4, #0x48]
	movs r3, #0
	adds r5, r4, #0
	adds r5, #0x3a
	ldr r0, _0804CB90  @ 0x0000FFF8
	mov ip, r0
	adds r2, r4, #0
	adds r2, #0x30
_0804CB2C:
	adds r0, r5, r3
	mov r7, r8
	adds r1, r7, r3
	ldrb r1, [r1]
	strb r1, [r0]
	mov r0, ip
	strh r0, [r2]
	adds r2, #2
	adds r3, #1
	cmp r3, #4
	ble _0804CB2C
	ldr r2, [r6, #0x38]
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	adds r0, r6, #0
	adds r0, #0x4a
	ldrb r0, [r0]
	adds r0, #0x28
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	str r4, [sp, #4]
	movs r0, #0xe1
	movs r1, #0x28
	movs r3, #6
	bl sub_804D1E0
	adds r0, r6, #0
	adds r0, #0x48
	ldrb r0, [r0]
	lsls r0, r0, #4
	movs r1, #0x28
	subs r1, r1, r0
	ldr r0, [r6, #0x38]
	str r0, [sp]
	str r4, [sp, #4]
	movs r0, #0x98
	movs r2, #0x88
	movs r3, #0x27
	bl sub_804CC14
	adds r0, r4, #0
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0804CB8C: .4byte gUnknown_085AAA78
_0804CB90: .4byte 0x0000FFF8

	THUMB_FUNC_END sub_804CAEC

	THUMB_FUNC_START sub_804CB94
sub_804CB94: @ 0x0804CB94
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r4, r0, #0
	movs r0, #0
	mov r8, r0
	b _0804CBFC
_0804CBA8:
	mov r1, r8
	lsls r0, r1, #4
	ldr r1, [r4, #0x30]
	adds r5, r1, r0
	ldr r0, [r4, #0x38]
	movs r1, #1
	add r1, r8
	mov sl, r1
	cmp r5, r0
	bge _0804CBFA
	ldr r0, [r4, #0x34]
	cmp r5, r0
	ble _0804CBFA
	movs r6, #0
	mov r0, r8
	lsls r0, r0, #2
	mov r9, r0
	movs r7, #0
_0804CBCC:
	mov r0, r9
	add r0, r8
	adds r0, r0, r6
	adds r0, #1
	bl GetUnit
	adds r2, r0, #0
	ldr r0, [r2]
	cmp r0, #0
	beq _0804CBF2
	ldr r1, [r4, #0x2c]
	adds r1, r1, r7
	str r2, [sp]
	movs r0, #4
	adds r2, r5, #0
	movs r3, #0x80
	lsls r3, r3, #3
	bl sub_8027E4C
_0804CBF2:
	adds r7, #0xe
	adds r6, #1
	cmp r6, #4
	ble _0804CBCC
_0804CBFA:
	mov r8, sl
_0804CBFC:
	ldr r0, [r4, #0x3c]
	cmp r8, r0
	blt _0804CBA8
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_804CB94

	THUMB_FUNC_START sub_804CC14
sub_804CC14: @ 0x0804CC14
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	mov r9, r0
	mov sl, r1
	adds r7, r2, #0
	mov r8, r3
	ldr r6, [sp, #0x20]
	ldr r5, [sp, #0x24]
	ldr r4, _0804CC58  @ gUnknown_085AAA90
	adds r0, r4, #0
	bl Proc_EndEach
	adds r0, r4, #0
	adds r1, r5, #0
	bl Proc_Start
	str r6, [r0, #0x3c]
	mov r1, r9
	str r1, [r0, #0x2c]
	mov r1, sl
	str r1, [r0, #0x30]
	mov r1, r8
	str r1, [r0, #0x34]
	str r7, [r0, #0x38]
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804CC58: .4byte gUnknown_085AAA90

	THUMB_FUNC_END sub_804CC14

	THUMB_FUNC_START sub_804CC5C
sub_804CC5C: @ 0x0804CC5C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0804CC74  @ gUnknown_085AAA90
	bl Proc_Find
	ldr r1, [r0, #0x30]
	adds r1, r1, r4
	str r1, [r0, #0x30]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804CC74: .4byte gUnknown_085AAA90

	THUMB_FUNC_END sub_804CC5C

	THUMB_FUNC_START sub_804CC78
sub_804CC78: @ 0x0804CC78
	push {r4, r5, r6, lr}
	ldr r5, _0804CCBC  @ gUnknown_085ADE28
	ldr r0, _0804CCC0  @ gUnk_Sio_0203DDDC
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _0804CCB6
	bl GetGameClock
	adds r2, r0, #0
	movs r0, #0x1f
	ands r2, r0
	asrs r2, r2, #1
	movs r1, #0
	ldr r0, _0804CCC4  @ gPaletteBuffer
	movs r4, #0xf
	ldr r6, _0804CCC8  @ 0x00000336
	adds r3, r0, r6
_0804CC9E:
	adds r0, r2, r1
	ands r0, r4
	lsls r0, r0, #1
	adds r0, r0, r5
	ldrh r0, [r0]
	strh r0, [r3]
	adds r3, #2
	adds r1, #1
	cmp r1, #4
	ble _0804CC9E
	bl EnablePaletteSync
_0804CCB6:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0804CCBC: .4byte gUnknown_085ADE28
_0804CCC0: .4byte gUnk_Sio_0203DDDC
_0804CCC4: .4byte gPaletteBuffer
_0804CCC8: .4byte 0x00000336

	THUMB_FUNC_END sub_804CC78

	THUMB_FUNC_START sub_804CCCC
sub_804CCCC: @ 0x0804CCCC
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r7, r0, #0
	ldr r1, [r7, #0x34]
	ldr r0, [r7, #0x2c]
	adds r1, r1, r0
	asrs r1, r1, #1
	ldr r2, [r7, #0x38]
	ldr r0, [r7, #0x30]
	adds r2, r2, r0
	asrs r2, r2, #1
	str r1, [r7, #0x2c]
	str r2, [r7, #0x30]
	ldr r3, _0804CD54  @ gUnknown_085AAAA8
	ldr r0, [r7, #0x3c]
	lsls r0, r0, #2
	adds r0, r0, r3
	ldr r3, [r0]
	movs r4, #0
	str r4, [sp]
	movs r0, #2
	bl PutSprite
	ldr r1, [r7, #0x40]
	adds r1, #0x60
	ldr r3, _0804CD58  @ gUnknown_080DA132
	str r4, [sp]
	movs r0, #2
	movs r2, #0x30
	bl PutSprite
	ldr r3, _0804CD5C  @ gUnknown_085AA9D8
	str r4, [sp]
	movs r0, #2
	movs r1, #0x60
	movs r2, #0x20
	bl PutSprite
	ldr r3, _0804CD60  @ Sprite_085AAA50
	movs r0, #0x80
	lsls r0, r0, #4
	str r0, [sp]
	movs r0, #4
	movs r1, #0x50
	movs r2, #0x20
	bl PutSprite
	movs r4, #3
	ldr r0, _0804CD64  @ gUnknown_085AAAB0
	adds r6, r0, #0
	adds r6, #0xc
	movs r5, #0x78
_0804CD34:
	ldr r0, [r7, #0x44]
	cmp r0, r4
	bne _0804CD68
	cmp r4, #2
	bgt _0804CD68
	ldr r3, [r6]
	movs r0, #0x80
	lsls r0, r0, #7
	str r0, [sp]
	movs r0, #4
	movs r1, #0xc4
	adds r2, r5, #0
	bl PutSprite
	b _0804CD7A
	.align 2, 0
_0804CD54: .4byte gUnknown_085AAAA8
_0804CD58: .4byte gUnknown_080DA132
_0804CD5C: .4byte gUnknown_085AA9D8
_0804CD60: .4byte Sprite_085AAA50
_0804CD64: .4byte gUnknown_085AAAB0
_0804CD68:
	ldr r3, [r6]
	movs r0, #0x80
	lsls r0, r0, #8
	str r0, [sp]
	movs r0, #4
	movs r1, #0xc4
	adds r2, r5, #0
	bl PutSprite
_0804CD7A:
	adds r6, #4
	adds r5, #0x10
	adds r4, #1
	cmp r4, #4
	ble _0804CD34
	bl sub_804CC78
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_804CCCC

	THUMB_FUNC_START NewProc_085AAAC4
NewProc_085AAAC4: @ 0x0804CD90
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r6, r0, #0
	adds r5, r1, #0
	mov r8, r2
	ldr r4, _0804CDCC  @ Proc_085AAAC4
	adds r0, r4, #0
	bl Proc_EndEach
	adds r0, r4, #0
	adds r1, r6, #0
	bl Proc_Start
	str r5, [r0, #0x34]
	str r5, [r0, #0x2c]
	mov r1, r8
	str r1, [r0, #0x38]
	str r1, [r0, #0x30]
	movs r1, #0
	str r1, [r0, #0x3c]
	str r1, [r0, #0x40]
	movs r1, #1
	str r1, [r0, #0x44]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0804CDCC: .4byte Proc_085AAAC4

	THUMB_FUNC_END NewProc_085AAAC4

	THUMB_FUNC_START sub_804CDD0
sub_804CDD0: @ 0x0804CDD0
	push {r4, r5, lr}
	ldr r4, [sp, #0xc]
	ldr r5, [sp, #0x10]
	str r1, [r0, #0x34]
	str r2, [r0, #0x38]
	str r4, [r0, #0x3c]
	str r3, [r0, #0x40]
	str r5, [r0, #0x44]
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_804CDD0

	THUMB_FUNC_START sub_804CDE8
sub_804CDE8: @ 0x0804CDE8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r5, r0, #0
	movs r0, #0x2c
	ldrsh r1, [r5, r0]
	movs r2, #0x2a
	ldrsh r0, [r5, r2]
	adds r1, r1, r0
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r7, r0, #2
	ldrh r0, [r5, #0x2c]
	strh r0, [r5, #0x2a]
	ldr r0, _0804CE58  @ gUnknown_085AAADC
	mov r8, r0
	movs r6, #0x30
	movs r4, #2
_0804CE0E:
	mov r1, r8
	adds r1, #4
	mov r8, r1
	subs r1, #4
	ldm r1!, {r3}
	movs r0, #0
	str r0, [sp]
	movs r0, #2
	movs r1, #0x20
	adds r2, r6, #0
	bl PutSprite
	adds r6, #0x18
	subs r4, #1
	cmp r4, #0
	bge _0804CE0E
	adds r1, r7, #0
	adds r1, #0x30
	movs r0, #0x20
	bl DisplayFrozenUiHand
	movs r2, #0x2e
	ldrsh r0, [r5, r2]
	movs r2, #0x30
	ldrsh r1, [r5, r2]
	bl DisplayUiHand
	movs r0, #0xc0
	movs r1, #0x10
	bl sub_804C2B8
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804CE58: .4byte gUnknown_085AAADC

	THUMB_FUNC_END sub_804CDE8

	THUMB_FUNC_START sub_804CE5C
sub_804CE5C: @ 0x0804CE5C
	push {r4, r5, r6, lr}
	sub sp, #4
	ldr r6, _0804CE88  @ gUnknown_085AAADC
	movs r5, #0x30
	movs r4, #2
_0804CE66:
	ldm r6!, {r3}
	movs r0, #0
	str r0, [sp]
	movs r0, #2
	movs r1, #0x20
	adds r2, r5, #0
	bl PutSprite
	adds r5, #0x18
	subs r4, #1
	cmp r4, #0
	bge _0804CE66
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0804CE88: .4byte gUnknown_085AAADC

	THUMB_FUNC_END sub_804CE5C

	THUMB_FUNC_START sub_804CE8C
sub_804CE8C: @ 0x0804CE8C
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _0804CEAC  @ gUnknown_085AAAE8
	adds r0, r4, #0
	bl Proc_EndEach
	adds r0, r4, #0
	adds r1, r5, #0
	bl Proc_Start
	movs r1, #0
	strh r1, [r0, #0x2a]
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0804CEAC: .4byte gUnknown_085AAAE8

	THUMB_FUNC_END sub_804CE8C

	THUMB_FUNC_START sub_804CEB0
sub_804CEB0: @ 0x0804CEB0
	push {lr}
	ldr r0, _0804CEC0  @ gUnknown_085AAB00
	movs r1, #3
	bl Proc_Start
	pop {r0}
	bx r0
	.align 2, 0
_0804CEC0: .4byte gUnknown_085AAB00

	THUMB_FUNC_END sub_804CEB0

	THUMB_FUNC_START sub_804CEC4
sub_804CEC4: @ 0x0804CEC4
	strh r1, [r0, #0x2c]
	strh r2, [r0, #0x2e]
	strh r3, [r0, #0x30]
	bx lr

	THUMB_FUNC_END sub_804CEC4

	THUMB_FUNC_START sub_804CECC
sub_804CECC: @ 0x0804CECC
	push {lr}
	adds r1, r0, #0
	ldr r2, _0804CEF8  @ gUnknown_085ADE28
	ldr r0, _0804CEFC  @ gUnk_Sio_0203DDDC
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _0804CEF2
	ldr r0, _0804CF00  @ gPaletteBuffer
	lsls r1, r1, #1
	adds r1, r1, r2
	ldrh r1, [r1]
	movs r2, #0xb7
	lsls r2, r2, #2
	adds r0, r0, r2
	strh r1, [r0]
	bl EnablePaletteSync
_0804CEF2:
	pop {r0}
	bx r0
	.align 2, 0
_0804CEF8: .4byte gUnknown_085ADE28
_0804CEFC: .4byte gUnk_Sio_0203DDDC
_0804CF00: .4byte gPaletteBuffer

	THUMB_FUNC_END sub_804CECC

	THUMB_FUNC_START sub_804CF04
sub_804CF04: @ 0x0804CF04
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r7, r0, #0
	movs r0, #0x4c
	adds r0, r0, r7
	mov r8, r0
	movs r1, #0
	ldrsh r5, [r0, r1]
	lsls r4, r5, #1
	adds r0, r5, #0
	bl sub_804CECC
	ldr r0, _0804CFA4  @ gUnknown_080DA1CA
	adds r4, #1
	lsls r4, r4, #1
	adds r4, r4, r0
	movs r1, #0
	ldrsh r6, [r4, r1]
	ldr r1, [r7, #0x2c]
	subs r1, r1, r6
	lsls r5, r5, #2
	adds r5, r5, r0
	movs r0, #0
	ldrsh r5, [r5, r0]
	ldr r2, [r7, #0x30]
	subs r2, r2, r5
	ldr r3, _0804CFA8  @ gUnknown_080DA17A
	movs r4, #0
	str r4, [sp]
	movs r0, #2
	bl PutSprite
	ldr r1, [r7, #0x2c]
	adds r1, r1, r6
	adds r1, #0x10
	ldr r2, [r7, #0x30]
	subs r2, r2, r5
	ldr r3, _0804CFAC  @ gUnknown_080DA18E
	str r4, [sp]
	movs r0, #2
	bl PutSprite
	ldr r1, [r7, #0x2c]
	subs r1, r1, r6
	ldr r2, [r7, #0x30]
	adds r2, r2, r5
	ldr r3, _0804CFB0  @ gUnknown_080DA1A2
	str r4, [sp]
	movs r0, #2
	bl PutSprite
	ldr r1, [r7, #0x2c]
	adds r1, r1, r6
	adds r1, #0x10
	ldr r2, [r7, #0x30]
	adds r2, r2, r5
	ldr r3, _0804CFB4  @ gUnknown_080DA1B6
	str r4, [sp]
	movs r0, #2
	bl PutSprite
	mov r1, r8
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xf
	bne _0804CF98
	adds r0, r7, #0
	bl Proc_Break
_0804CF98:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804CFA4: .4byte gUnknown_080DA1CA
_0804CFA8: .4byte gUnknown_080DA17A
_0804CFAC: .4byte gUnknown_080DA18E
_0804CFB0: .4byte gUnknown_080DA1A2
_0804CFB4: .4byte gUnknown_080DA1B6

	THUMB_FUNC_END sub_804CF04

	THUMB_FUNC_START sub_804CFB8
sub_804CFB8: @ 0x0804CFB8
	push {r4, r5, lr}
	adds r3, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	ldr r0, _0804CFDC  @ gUnknown_085AAB18
	adds r1, r3, #0
	bl Proc_Start
	adds r1, r0, #0
	str r4, [r1, #0x2c]
	str r5, [r1, #0x30]
	adds r1, #0x4c
	movs r2, #0
	strh r2, [r1]
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0804CFDC: .4byte gUnknown_085AAB18

	THUMB_FUNC_END sub_804CFB8

	THUMB_FUNC_START sub_804CFE0
sub_804CFE0: @ 0x0804CFE0
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r0, #0x45
	movs r1, #0
	strb r1, [r0]
	subs r0, #1
	strb r1, [r0]
	subs r0, #7
	ldrb r0, [r0]
	ldr r4, [r6, #0x34]
	muls r0, r4, r0
	lsls r0, r0, #3
	adds r5, r6, #0
	adds r5, #0x3c
	ldrb r1, [r5]
	bl __divsi3
	str r0, [r6, #0x38]
	lsls r4, r4, #0xb
	ldrb r1, [r5]
	lsls r1, r1, #4
	adds r0, r4, #0
	bl __divsi3
	adds r1, r6, #0
	adds r1, #0x42
	strh r0, [r1]
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_804CFE0

	THUMB_FUNC_START sub_804D01C
sub_804D01C: @ 0x0804D01C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x30
	adds r7, r0, #0
	ldr r0, [r7, #0x2c]
	mov r8, r0
	ldr r1, [r7, #0x30]
	str r1, [sp, #0xc]
	adds r1, #8
	mov sl, r1
	ldr r0, [r7, #0x38]
	asrs r2, r0, #3
	str r2, [sp, #0x10]
	movs r1, #7
	ands r0, r1
	movs r1, #8
	subs r0, r1, r0
	str r0, [sp, #0x14]
	movs r3, #0x3e
	ldrsh r1, [r7, r3]
	adds r0, r7, #0
	adds r0, #0x42
	ldrh r0, [r0]
	muls r0, r1, r0
	asrs r0, r0, #8
	str r0, [sp, #0x18]
	movs r0, #0x3c
	adds r0, r0, r7
	mov ip, r0
	movs r1, #0x3d
	adds r1, r1, r7
	mov r9, r1
	ldrb r0, [r0]
	ldrb r2, [r1]
	cmp r0, r2
	bhi _0804D06C
	b _0804D1C4
_0804D06C:
	adds r5, r7, #0
	adds r5, #0x44
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
	adds r4, r7, #0
	adds r4, #0x45
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	adds r0, r7, #0
	adds r0, #0x40
	movs r3, #0x3e
	ldrsh r2, [r7, r3]
	movs r3, #0
	ldrsh r1, [r0, r3]
	adds r3, r5, #0
	str r0, [sp, #0x2c]
	cmp r2, r1
	bge _0804D09A
	ldrb r0, [r3]
	adds r0, #2
	strb r0, [r3]
_0804D09A:
	movs r0, #0x3e
	ldrsh r1, [r7, r0]
	ldr r2, [sp, #0x2c]
	movs r3, #0
	ldrsh r0, [r2, r3]
	cmp r1, r0
	ble _0804D0AE
	ldrb r0, [r4]
	adds r0, #2
	strb r0, [r4]
_0804D0AE:
	movs r6, #0
	mov r0, ip
	str r0, [sp, #0x28]
	ldr r1, [sp, #0x18]
	add r1, sl
	str r1, [sp, #0x1c]
	ldr r2, [sp, #0x10]
	lsls r2, r2, #3
	str r2, [sp, #0x24]
	ldr r3, [sp, #0xc]
	str r3, [sp, #0x20]
_0804D0C4:
	ldrb r0, [r5]
	cmp r0, #0x30
	bls _0804D0CE
	movs r0, #0
	strb r0, [r5]
_0804D0CE:
	lsls r4, r6, #2
	add r4, sp
	adds r4, #4
	ldrb r0, [r5]
	lsrs r0, r0, #3
	movs r1, #6
	bl __umodsi3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [r4]
	adds r5, #1
	adds r6, #1
	cmp r6, #1
	ble _0804D0C4
	movs r1, #0x3e
	ldrsh r0, [r7, r1]
	cmp r0, #0
	beq _0804D106
	mov r2, sl
	subs r2, #9
	ldr r3, _0804D1D4  @ gUnknown_085AAB38
	ldr r0, [sp, #4]
	str r0, [sp]
	movs r0, #3
	mov r1, r8
	bl PutSprite
_0804D106:
	movs r2, #0x3e
	ldrsh r0, [r7, r2]
	cmp r0, #0
	bge _0804D110
	adds r0, #0xf
_0804D110:
	asrs r0, r0, #4
	mov r3, r9
	ldrb r3, [r3]
	adds r0, r0, r3
	ldr r1, [sp, #0x28]
	ldrb r1, [r1]
	cmp r0, r1
	bge _0804D136
	ldr r2, [r7, #0x34]
	lsls r2, r2, #3
	add r2, sl
	adds r2, #1
	ldr r3, _0804D1D8  @ gUnknown_085AAB30
	ldr r0, [sp, #8]
	str r0, [sp]
	movs r0, #3
	mov r1, r8
	bl PutSprite
_0804D136:
	movs r6, #0
	ldr r0, [r7, #0x34]
	cmp r6, r0
	bge _0804D15A
	mov r4, sl
	movs r5, #1
_0804D142:
	str r5, [sp]
	movs r0, #2
	mov r1, r8
	adds r2, r4, #0
	ldr r3, _0804D1DC  @ gUnknown_085AAB40
	bl PutSprite
	adds r4, #8
	adds r6, #1
	ldr r0, [r7, #0x34]
	cmp r6, r0
	blt _0804D142
_0804D15A:
	ldr r2, [sp, #0x10]
	cmp r2, #0
	ble _0804D17C
	ldr r4, [sp, #0x1c]
	movs r5, #0
	adds r6, r2, #0
_0804D166:
	str r5, [sp]
	movs r0, #2
	mov r1, r8
	adds r2, r4, #0
	ldr r3, _0804D1DC  @ gUnknown_085AAB40
	bl PutSprite
	adds r4, #8
	subs r6, #1
	cmp r6, #0
	bne _0804D166
_0804D17C:
	ldr r3, [sp, #0x1c]
	ldr r0, [sp, #0x24]
	adds r2, r3, r0
	ldr r1, [sp, #0x14]
	subs r2, r2, r1
	ldr r4, _0804D1DC  @ gUnknown_085AAB40
	movs r0, #0
	str r0, [sp]
	movs r0, #2
	mov r1, r8
	adds r3, r4, #0
	bl PutSprite
	movs r5, #2
	str r5, [sp]
	movs r0, #2
	mov r1, r8
	ldr r2, [sp, #0x20]
	adds r3, r4, #0
	bl PutSprite
	movs r1, #0x80
	lsls r1, r1, #6
	add r1, r8
	ldr r2, [r7, #0x34]
	lsls r2, r2, #3
	add r2, sl
	subs r2, #7
	str r5, [sp]
	movs r0, #2
	adds r3, r4, #0
	bl PutSprite
	ldrh r0, [r7, #0x3e]
	ldr r2, [sp, #0x2c]
	strh r0, [r2]
_0804D1C4:
	add sp, #0x30
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804D1D4: .4byte gUnknown_085AAB38
_0804D1D8: .4byte gUnknown_085AAB30
_0804D1DC: .4byte gUnknown_085AAB40

	THUMB_FUNC_END sub_804D01C

	THUMB_FUNC_START sub_804D1E0
sub_804D1E0: @ 0x0804D1E0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	mov r9, r0
	mov sl, r1
	mov r8, r2
	adds r5, r3, #0
	ldr r6, [sp, #0x20]
	ldr r7, [sp, #0x24]
	mov r0, r8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	ldr r4, _0804D248  @ gUnknown_085AAB48
	adds r0, r4, #0
	bl Proc_EndEach
	adds r0, r4, #0
	adds r1, r7, #0
	bl Proc_Start
	adds r1, r0, #0
	mov r2, r9
	str r2, [r1, #0x2c]
	mov r0, sl
	str r0, [r1, #0x30]
	lsls r0, r5, #1
	subs r0, #2
	str r0, [r1, #0x34]
	adds r0, r1, #0
	adds r0, #0x3c
	mov r2, r8
	strb r2, [r0]
	adds r0, #1
	strb r5, [r0]
	strh r6, [r1, #0x3e]
	adds r0, #3
	strh r6, [r0]
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804D248: .4byte gUnknown_085AAB48

	THUMB_FUNC_END sub_804D1E0

	THUMB_FUNC_START sub_804D24C
sub_804D24C: @ 0x0804D24C
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	lsls r1, r1, #0x10
	lsrs r4, r1, #0x10
	ldr r0, _0804D2A0  @ gUnknown_085AAB48
	bl Proc_Find
	adds r6, r0, #0
	cmp r6, #0
	beq _0804D298
	adds r5, r6, #0
	adds r5, #0x3c
	strb r7, [r5]
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	movs r1, #0xff
	ands r0, r1
	strh r0, [r6, #0x3e]
	adds r0, r6, #0
	adds r0, #0x3d
	ldrb r0, [r0]
	ldr r4, [r6, #0x34]
	muls r0, r4, r0
	lsls r0, r0, #3
	ldrb r1, [r5]
	bl __divsi3
	str r0, [r6, #0x38]
	lsls r4, r4, #0xb
	ldrb r1, [r5]
	lsls r1, r1, #4
	adds r0, r4, #0
	bl __divsi3
	adds r1, r6, #0
	adds r1, #0x42
	strh r0, [r1]
_0804D298:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804D2A0: .4byte gUnknown_085AAB48

	THUMB_FUNC_END sub_804D24C

	THUMB_FUNC_START sub_804D2A4
sub_804D2A4: @ 0x0804D2A4
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #0x30
	mov r1, sp
	ldr r0, _0804D348  @ gUnknown_080DA20C
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldr r0, [r0]
	str r0, [r1]
	add r6, sp, #0x10
	adds r1, r6, #0
	ldr r0, _0804D34C  @ gUnknown_080DA21C
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldr r0, [r0]
	str r0, [r1]
	add r0, sp, #0x20
	mov r8, r0
	mov r1, r8
	ldr r0, _0804D350  @ gUnknown_080DA22C
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldr r0, [r0]
	str r0, [r1]
	ldr r0, _0804D354  @ Img_PhaseChangeUnk
	ldr r1, _0804D358  @ 0x06014000
	bl Decompress
	ldr r0, _0804D35C  @ Img_PhaseChangeSquares
	ldr r1, _0804D360  @ 0x06002000
	bl Decompress
	ldr r0, _0804D364  @ gUnknown_085AE7EC
	ldr r1, _0804D368  @ 0x06002800
	bl Decompress
	ldr r5, _0804D36C  @ gPlaySt
	ldrb r0, [r5, #0xf]
	lsls r0, r0, #2
	add r0, sp
	ldr r0, [r0]
	ldr r4, _0804D370  @ gGenericBuffer
	adds r1, r4, #0
	bl Decompress
	ldr r1, _0804D374  @ 0x06002980
	adds r0, r4, #0
	movs r2, #3
	movs r3, #3
	bl Copy2dChr
	ldrb r0, [r5, #0xf]
	lsls r0, r0, #2
	adds r6, r6, r0
	ldr r0, [r6]
	movs r1, #0xa0
	movs r2, #0x20
	bl CopyToPaletteBuffer
	ldrb r0, [r5, #0xf]
	lsls r0, r0, #2
	add r8, r0
	mov r1, r8
	ldr r0, [r1]
	movs r1, #0x90
	lsls r1, r1, #2
	movs r2, #0x20
	bl CopyToPaletteBuffer
	ldr r1, _0804D378  @ gUnknown_03001860
	ldrb r0, [r5, #0xf]
	str r0, [r1]
	movs r0, #0
	strb r0, [r5, #0xf]
	add sp, #0x30
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0804D348: .4byte gUnknown_080DA20C
_0804D34C: .4byte gUnknown_080DA21C
_0804D350: .4byte gUnknown_080DA22C
_0804D354: .4byte Img_PhaseChangeUnk
_0804D358: .4byte 0x06014000
_0804D35C: .4byte Img_PhaseChangeSquares
_0804D360: .4byte 0x06002000
_0804D364: .4byte gUnknown_085AE7EC
_0804D368: .4byte 0x06002800
_0804D36C: .4byte gPlaySt
_0804D370: .4byte gGenericBuffer
_0804D374: .4byte 0x06002980
_0804D378: .4byte gUnknown_03001860

	THUMB_FUNC_END sub_804D2A4

	THUMB_FUNC_START sub_804D37C
sub_804D37C: @ 0x0804D37C
	push {r4, lr}
	ldr r1, _0804D3D0  @ gPlaySt
	ldr r0, _0804D3D4  @ gUnknown_03001860
	ldr r0, [r0]
	strb r0, [r1, #0xf]
	ldr r4, _0804D3D8  @ gLCDControlBuffer
	ldrb r1, [r4, #1]
	movs r0, #0x21
	negs r0, r0
	ands r0, r1
	movs r1, #0x41
	negs r1, r1
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r4, #1]
	bl SetDefaultColorEffects
	ldrb r2, [r4, #0xc]
	movs r1, #4
	negs r1, r1
	adds r0, r1, #0
	ands r0, r2
	strb r0, [r4, #0xc]
	ldrb r2, [r4, #0x10]
	adds r0, r1, #0
	ands r0, r2
	movs r2, #1
	orrs r0, r2
	strb r0, [r4, #0x10]
	ldrb r0, [r4, #0x14]
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	strb r1, [r4, #0x14]
	ldrb r0, [r4, #0x18]
	movs r1, #3
	orrs r0, r1
	strb r0, [r4, #0x18]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804D3D0: .4byte gPlaySt
_0804D3D4: .4byte gUnknown_03001860
_0804D3D8: .4byte gLCDControlBuffer

	THUMB_FUNC_END sub_804D37C

	THUMB_FUNC_START StopBGM2
StopBGM2: @ 0x0804D3DC
	push {lr}
	ldr r1, _0804D3EC  @ gMPlayInfo_BGM2
	movs r0, #0x34
	bl StartBgm
	pop {r0}
	bx r0
	.align 2, 0
_0804D3EC: .4byte gMPlayInfo_BGM2

	THUMB_FUNC_END StopBGM2

	THUMB_FUNC_START sub_804D3F0
sub_804D3F0: @ 0x0804D3F0
	push {lr}
	lsls r1, r1, #1
	adds r0, #0x1e
	adds r2, r0, r1
	ldrh r1, [r2]
	cmp r1, #0
	beq _0804D408
	movs r3, #0xff
	lsls r3, r3, #8
	adds r0, r3, #0
	orrs r1, r0
	strh r1, [r2]
_0804D408:
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_804D3F0

	THUMB_FUNC_START sub_804D40C
sub_804D40C: @ 0x0804D40C
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r4, #0
_0804D412:
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_804D3F0
	adds r4, #1
	cmp r4, #4
	ble _0804D412
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_804D40C

	THUMB_FUNC_START sub_804D428
sub_804D428: @ 0x0804D428
	push {r4, r5, r6, lr}
	ldr r5, _0804D46C  @ Pal_LinkArenaActiveBannerFx
	ldr r0, _0804D470  @ gUnk_Sio_0203DDDC
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _0804D466
	bl GetGameClock
	adds r2, r0, #0
	movs r0, #0x1f
	ands r2, r0
	asrs r2, r2, #1
	movs r1, #0
	ldr r0, _0804D474  @ gPaletteBuffer
	movs r4, #0xf
	ldr r6, _0804D478  @ 0x00000322
	adds r3, r0, r6
_0804D44E:
	adds r0, r2, r1
	ands r0, r4
	lsls r0, r0, #1
	adds r0, r0, r5
	ldrh r0, [r0]
	strh r0, [r3]
	adds r3, #2
	adds r1, #1
	cmp r1, #0xe
	ble _0804D44E
	bl EnablePaletteSync
_0804D466:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0804D46C: .4byte Pal_LinkArenaActiveBannerFx
_0804D470: .4byte gUnk_Sio_0203DDDC
_0804D474: .4byte gPaletteBuffer
_0804D478: .4byte 0x00000322

	THUMB_FUNC_END sub_804D428

	THUMB_FUNC_START sub_804D47C
sub_804D47C: @ 0x0804D47C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r7, r0, #0
	movs r0, #0
	mov r9, r0
	movs r1, #0
	str r1, [sp, #4]
	mov sl, r1
_0804D494:
	ldr r1, [r7, #0x2c]
	ldr r2, [r7, #0x30]
	ldr r3, [sp, #4]
	adds r2, r2, r3
	movs r0, #0xf
	mov r4, r9
	ands r0, r4
	lsls r0, r0, #0xc
	movs r3, #0x80
	lsls r3, r3, #4
	adds r0, r0, r3
	str r0, [sp]
	movs r0, #4
	ldr r3, _0804D648  @ Sprite_085AAA50
	bl PutSprite
	ldr r4, _0804D64C  @ gSinLookup+0x80
	movs r1, #0
	ldrsh r0, [r4, r1]
	lsls r0, r0, #4
	movs r1, #0x80
	lsls r1, r1, #1
	bl Div
	adds r6, r0, #0
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	ldr r2, _0804D650  @ gSinLookup
	movs r3, #0
	ldrsh r0, [r2, r3]
	negs r0, r0
	lsls r0, r0, #4
	movs r1, #0x80
	lsls r1, r1, #1
	bl Div
	adds r5, r0, #0
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	ldr r4, _0804D650  @ gSinLookup
	movs r1, #0
	ldrsh r0, [r4, r1]
	lsls r0, r0, #4
	movs r1, #0x80
	lsls r1, r1, #1
	bl Div
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	ldr r2, _0804D64C  @ gSinLookup+0x80
	movs r3, #0
	ldrsh r0, [r2, r3]
	lsls r0, r0, #4
	movs r1, #0x80
	lsls r1, r1, #1
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	mov r0, r9
	adds r1, r6, #0
	adds r2, r5, #0
	adds r3, r4, #0
	bl SetObjAffine
	ldr r1, [r7, #0x38]
	movs r0, #1
	negs r0, r0
	cmp r1, r0
	beq _0804D5BE
	adds r3, r7, #0
	adds r3, #0x3c
	cmp r1, r9
	beq _0804D544
	mov r4, sl
	adds r1, r3, r4
	ldrh r0, [r1]
	movs r2, #0x80
	lsls r2, r2, #1
	cmp r0, r2
	bls _0804D53E
	subs r0, #8
	strh r0, [r1]
_0804D53E:
	ldr r0, [r7, #0x38]
	cmp r0, r9
	bne _0804D556
_0804D544:
	mov r4, sl
	adds r2, r3, r4
	ldrh r1, [r2]
	ldr r0, _0804D654  @ 0x0000014F
	cmp r1, r0
	bhi _0804D556
	adds r0, r1, #0
	adds r0, #8
	strh r0, [r2]
_0804D556:
	ldr r1, _0804D64C  @ gSinLookup+0x80
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #4
	add r3, sl
	mov r8, r3
	ldrh r1, [r3]
	bl Div
	adds r6, r0, #0
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	ldr r3, _0804D650  @ gSinLookup
	movs r4, #0
	ldrsh r0, [r3, r4]
	negs r0, r0
	lsls r0, r0, #4
	mov r2, r8
	ldrh r1, [r2]
	bl Div
	adds r5, r0, #0
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	ldr r3, _0804D650  @ gSinLookup
	movs r4, #0
	ldrsh r0, [r3, r4]
	lsls r0, r0, #4
	mov r2, r8
	ldrh r1, [r2]
	bl Div
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	ldr r3, _0804D64C  @ gSinLookup+0x80
	movs r1, #0
	ldrsh r0, [r3, r1]
	lsls r0, r0, #4
	mov r2, r8
	ldrh r1, [r2]
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	mov r0, r9
	adds r1, r6, #0
	adds r2, r5, #0
	adds r3, r4, #0
	bl SetObjAffine
_0804D5BE:
	ldr r1, [r7, #0x2c]
	subs r1, #0x30
	ldr r2, [r7, #0x30]
	ldr r3, [sp, #4]
	adds r2, r2, r3
	ldr r3, _0804D658  @ gUnknown_085AABB8
	mov r4, r9
	lsls r0, r4, #2
	adds r0, r0, r3
	ldr r3, [r0]
	movs r4, #0
	str r4, [sp]
	movs r0, #4
	bl PutSprite
	ldr r0, [sp, #4]
	adds r0, #0x18
	str r0, [sp, #4]
	movs r1, #2
	add sl, r1
	movs r2, #1
	add r9, r2
	mov r3, r9
	cmp r3, #3
	bgt _0804D5F2
	b _0804D494
_0804D5F2:
	ldr r2, [r7, #0x34]
	movs r0, #1
	negs r0, r0
	cmp r2, r0
	beq _0804D636
	ldr r1, [r7, #0x2c]
	subs r1, #0x48
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #3
	ldr r2, [r7, #0x30]
	adds r2, r2, r0
	adds r2, #8
	ldr r3, _0804D65C  @ gUnknown_080DA25C
	str r4, [sp]
	movs r0, #4
	bl PutSprite
	ldr r1, [r7, #0x2c]
	subs r1, #0x48
	ldr r2, [r7, #0x34]
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #3
	ldr r2, [r7, #0x30]
	adds r2, r2, r0
	adds r2, #0x12
	ldr r3, _0804D660  @ gUnknown_080DA26A
	str r4, [sp]
	movs r0, #4
	bl PutSprite
	bl sub_804D428
_0804D636:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804D648: .4byte Sprite_085AAA50
_0804D64C: .4byte gSinLookup+0x80
_0804D650: .4byte gSinLookup
_0804D654: .4byte 0x0000014F
_0804D658: .4byte gUnknown_085AABB8
_0804D65C: .4byte gUnknown_080DA25C
_0804D660: .4byte gUnknown_080DA26A

	THUMB_FUNC_END sub_804D47C

	THUMB_FUNC_START sub_804D664
sub_804D664: @ 0x0804D664
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r6, r0, #0
	mov r8, r1
	adds r5, r2, #0
	ldr r4, _0804D6B0  @ gUnknown_085AABC8
	adds r0, r4, #0
	bl Proc_EndEach
	adds r0, r4, #0
	adds r1, r5, #0
	bl Proc_Start
	adds r1, r0, #0
	str r6, [r1, #0x2c]
	mov r0, r8
	str r0, [r1, #0x30]
	movs r0, #1
	negs r0, r0
	str r0, [r1, #0x34]
	str r0, [r1, #0x38]
	movs r3, #0x80
	lsls r3, r3, #1
	movs r2, #3
	adds r0, r1, #0
	adds r0, #0x42
_0804D69A:
	strh r3, [r0]
	subs r0, #2
	subs r2, #1
	cmp r2, #0
	bge _0804D69A
	adds r0, r1, #0
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0804D6B0: .4byte gUnknown_085AABC8

	THUMB_FUNC_END sub_804D664

	THUMB_FUNC_START sub_804D6B4
sub_804D6B4: @ 0x0804D6B4
	push {lr}
	ldr r0, _0804D6C0  @ gUnknown_085AABC8
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
_0804D6C0: .4byte gUnknown_085AABC8

	THUMB_FUNC_END sub_804D6B4

	THUMB_FUNC_START sub_804D6C4
sub_804D6C4: @ 0x0804D6C4
	push {lr}
	ldr r0, _0804D6D0  @ gUnknown_085AABC8
	bl Proc_Find
	pop {r1}
	bx r1
	.align 2, 0
_0804D6D0: .4byte gUnknown_085AABC8

	THUMB_FUNC_END sub_804D6C4

	THUMB_FUNC_START sub_804D6D4
sub_804D6D4: @ 0x0804D6D4
	push {r4, r5, lr}
	ldr r5, _0804D718  @ Pal_LinkArenaActiveBannerFx
	ldr r0, _0804D71C  @ gUnk_Sio_0203DDDC
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _0804D712
	bl GetGameClock
	adds r2, r0, #0
	movs r0, #0x1f
	ands r2, r0
	asrs r2, r2, #1
	movs r1, #0
	ldr r0, _0804D720  @ gPaletteBuffer
	movs r4, #0xf
	adds r3, r0, #0
	adds r3, #0x42
_0804D6FA:
	adds r0, r2, r1
	ands r0, r4
	lsls r0, r0, #1
	adds r0, r0, r5
	ldrh r0, [r0]
	strh r0, [r3]
	adds r3, #2
	adds r1, #1
	cmp r1, #0xe
	ble _0804D6FA
	bl EnablePaletteSync
_0804D712:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0804D718: .4byte Pal_LinkArenaActiveBannerFx
_0804D71C: .4byte gUnk_Sio_0203DDDC
_0804D720: .4byte gPaletteBuffer

	THUMB_FUNC_END sub_804D6D4

	THUMB_FUNC_START sub_804D724
sub_804D724: @ 0x0804D724
	push {r4, r5, r6, lr}
	ldr r5, _0804D768  @ Pal_LinkArenaActiveBannerFx
	ldr r0, _0804D76C  @ gUnk_Sio_0203DDDC
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _0804D762
	bl GetGameClock
	adds r2, r0, #0
	movs r0, #0x1f
	ands r2, r0
	asrs r2, r2, #1
	movs r1, #0
	ldr r0, _0804D770  @ gPaletteBuffer
	movs r4, #0xf
	ldr r6, _0804D774  @ 0x00000262
	adds r3, r0, r6
_0804D74A:
	adds r0, r2, r1
	ands r0, r4
	lsls r0, r0, #1
	adds r0, r0, r5
	ldrh r0, [r0]
	strh r0, [r3]
	adds r3, #2
	adds r1, #1
	cmp r1, #0xe
	ble _0804D74A
	bl EnablePaletteSync
_0804D762:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0804D768: .4byte Pal_LinkArenaActiveBannerFx
_0804D76C: .4byte gUnk_Sio_0203DDDC
_0804D770: .4byte gPaletteBuffer
_0804D774: .4byte 0x00000262

	THUMB_FUNC_END sub_804D724

	THUMB_FUNC_START sub_804D778
sub_804D778: @ 0x0804D778
	push {r4, lr}
	sub sp, #4
	movs r0, #1
	movs r1, #8
	movs r2, #0xc
	movs r3, #0
	bl SetBlendConfig
	movs r4, #0
	str r4, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl SetBlendTargetA
	str r4, [sp]
	movs r0, #0
	movs r1, #1
	movs r2, #1
	movs r3, #1
	bl SetBlendTargetB
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_804D778

	THUMB_FUNC_START sub_804D7B0
sub_804D7B0: @ 0x0804D7B0
	push {lr}
	sub sp, #4
	adds r1, r0, #0
	ldr r2, [r1, #0x30]
	adds r0, r2, #0
	subs r0, #0x1f
	cmp r0, #0x79
	bhi _0804D7D2
	ldr r1, [r1, #0x2c]
	ldr r3, _0804D7D8  @ gUnknown_080DA27E
	movs r0, #0
	str r0, [sp]
	movs r0, #4
	bl PutSprite
	bl sub_804D724
_0804D7D2:
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_0804D7D8: .4byte gUnknown_080DA27E

	THUMB_FUNC_END sub_804D7B0

	THUMB_FUNC_START sub_804D7DC
sub_804D7DC: @ 0x0804D7DC
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r6, r0, #0
	mov r8, r1
	adds r5, r2, #0
	ldr r4, _0804D808  @ gUnknown_085AABD8
	adds r0, r4, #0
	bl Proc_EndEach
	adds r0, r4, #0
	adds r1, r5, #0
	bl Proc_Start
	str r6, [r0, #0x2c]
	mov r1, r8
	str r1, [r0, #0x30]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0804D808: .4byte gUnknown_085AABD8

	THUMB_FUNC_END sub_804D7DC

	THUMB_FUNC_START sub_804D80C
sub_804D80C: @ 0x0804D80C
	push {lr}
	ldr r0, _0804D828  @ gGfx_SupportMenu
	ldr r1, _0804D82C  @ 0x06016800
	bl Decompress
	ldr r0, _0804D830  @ gPal_SupportMenu
	movs r1, #0x90
	lsls r1, r1, #2
	movs r2, #0x20
	bl CopyToPaletteBuffer
	pop {r0}
	bx r0
	.align 2, 0
_0804D828: .4byte gGfx_SupportMenu
_0804D82C: .4byte 0x06016800
_0804D830: .4byte gPal_SupportMenu

	THUMB_FUNC_END sub_804D80C

	THUMB_FUNC_START sub_804D834
sub_804D834: @ 0x0804D834
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r2, r1, #0
	ldr r3, _0804D854  @ gUnknown_080DA2B0
	movs r0, #0x9d
	lsls r0, r0, #6
	str r0, [sp]
	movs r0, #1
	adds r1, r4, #0
	bl PutSprite
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804D854: .4byte gUnknown_080DA2B0

	THUMB_FUNC_END sub_804D834

	THUMB_FUNC_START sub_804D858
sub_804D858: @ 0x0804D858
	push {r4, r5, lr}
	ldr r5, _0804D884  @ gActiveUnit
	ldr r0, [r5]
	lsls r1, r1, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r4, [r0]
	adds r0, r4, #0
	bl GetItemAttributes
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	beq _0804D89A
	adds r0, r4, #0
	bl GetItemMinRange
	cmp r0, #2
	ble _0804D888
	movs r0, #2
	b _0804D89C
	.align 2, 0
_0804D884: .4byte gActiveUnit
_0804D888:
	ldr r0, [r5]
	adds r1, r4, #0
	bl CanUnitUseWeapon
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0804D89A
	movs r0, #1
	b _0804D89C
_0804D89A:
	movs r0, #3
_0804D89C:
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_804D858

	THUMB_FUNC_START sub_804D8A4
sub_804D8A4: @ 0x0804D8A4
	push {lr}
	adds r0, r1, #0
	adds r0, #0x3d
	ldrb r0, [r0]
	cmp r0, #2
	beq _0804D8C0
	ldr r0, _0804D8BC  @ gUnk_Sio_0203DD90
	adds r1, #0x3c
	ldrb r1, [r1]
	strb r1, [r0, #7]
	movs r0, #0x84
	b _0804D8C2
	.align 2, 0
_0804D8BC: .4byte gUnk_Sio_0203DD90
_0804D8C0:
	movs r0, #8
_0804D8C2:
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_804D8A4

	THUMB_FUNC_START sub_804D8C8
sub_804D8C8: @ 0x0804D8C8
	ldr r2, _0804D8D8  @ gUnk_Sio_0203DD90
	adds r1, #0x3c
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r2, #6]
	movs r0, #0x17
	bx lr
	.align 2, 0
_0804D8D8: .4byte gUnk_Sio_0203DD90

	THUMB_FUNC_END sub_804D8C8

	THUMB_FUNC_START sub_804D8DC
sub_804D8DC: @ 0x0804D8DC
	push {r4, r5, r6, lr}
	adds r4, r1, #0
	ldr r0, _0804D938  @ gActiveUnit
	ldr r0, [r0]
	adds r1, #0x3c
	movs r2, #0
	ldrsb r2, [r1, r2]
	lsls r2, r2, #1
	adds r1, r0, #0
	adds r1, #0x1e
	adds r1, r1, r2
	ldrh r6, [r1]
	adds r1, r6, #0
	bl CanUnitUseWeapon
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	adds r0, r6, #0
	bl GetItemMinRange
	cmp r0, #2
	ble _0804D90A
	movs r5, #0
_0804D90A:
	adds r0, r4, #0
	adds r0, #0x34
	lsls r2, r5, #0x18
	asrs r2, r2, #0x18
	movs r1, #0x2c
	ldrsh r3, [r4, r1]
	lsls r3, r3, #5
	movs r5, #0x2a
	ldrsh r1, [r4, r5]
	adds r3, r3, r1
	lsls r3, r3, #1
	ldr r1, _0804D93C  @ gBG0TilemapBuffer
	adds r3, r3, r1
	adds r1, r6, #0
	bl DrawItemMenuLine
	movs r0, #1
	bl BG_EnableSyncByMask
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0804D938: .4byte gActiveUnit
_0804D93C: .4byte gBG0TilemapBuffer

	THUMB_FUNC_END sub_804D8DC

	THUMB_FUNC_START sub_804D940
sub_804D940: @ 0x0804D940
	ldr r1, _0804D94C  @ gUnk_Sio_0203DD90
	movs r0, #0
	strb r0, [r1, #6]
	movs r0, #0x1b
	bx lr
	.align 2, 0
_0804D94C: .4byte gUnk_Sio_0203DD90

	THUMB_FUNC_END sub_804D940

	THUMB_FUNC_START sub_804D950
sub_804D950: @ 0x0804D950
	push {r4, r5, r6, r7, lr}
	adds r2, r0, #0
	ldr r1, _0804D9B8  @ gUnk_Sio_0203DD90
	movs r0, #0
	strb r0, [r1, #6]
	adds r7, r2, #0
	adds r7, #0x2d
	movs r0, #0
	ldrsb r0, [r7, r0]
	lsls r0, r0, #5
	adds r5, r2, #0
	adds r5, #0x2c
	movs r1, #0
	ldrsb r1, [r5, r1]
	adds r0, r0, r1
	lsls r0, r0, #1
	ldr r1, _0804D9BC  @ gBG0TilemapBuffer
	adds r0, r0, r1
	adds r6, r2, #0
	adds r6, #0x2e
	movs r1, #0
	ldrsb r1, [r6, r1]
	adds r4, r2, #0
	adds r4, #0x2f
	movs r2, #0
	ldrsb r2, [r4, r2]
	movs r3, #0
	bl TileMap_FillRect
	movs r0, #0
	ldrsb r0, [r7, r0]
	lsls r0, r0, #5
	movs r1, #0
	ldrsb r1, [r5, r1]
	adds r0, r0, r1
	lsls r0, r0, #1
	ldr r1, _0804D9C0  @ gBG1TilemapBuffer
	adds r0, r0, r1
	movs r1, #0
	ldrsb r1, [r6, r1]
	movs r2, #0
	ldrsb r2, [r4, r2]
	movs r3, #0
	bl TileMap_FillRect
	movs r0, #3
	bl BG_EnableSyncByMask
	movs r0, #0xb
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0804D9B8: .4byte gUnk_Sio_0203DD90
_0804D9BC: .4byte gBG0TilemapBuffer
_0804D9C0: .4byte gBG1TilemapBuffer

	THUMB_FUNC_END sub_804D950

	THUMB_FUNC_START sub_804D9C4
sub_804D9C4: @ 0x0804D9C4
	adds r2, r0, #0
	movs r1, #0
	strb r1, [r2, #0x1e]
	strb r1, [r2, #0x18]
	strb r1, [r2, #0x1d]
	adds r3, r2, #0
	adds r3, #0x4a
	movs r0, #0xf
	strb r0, [r3]
	adds r0, r2, #0
	adds r0, #0x48
	strb r1, [r0]
	strh r1, [r2, #0x16]
	ldr r0, _0804D9F0  @ 0x04000134
	strh r1, [r0]
	ldr r2, _0804D9F4  @ 0x04000128
	ldr r3, _0804D9F8  @ 0x00002003
	adds r0, r3, #0
	strh r0, [r2]
	ldr r0, _0804D9FC  @ 0x0400012A
	strh r1, [r0]
	bx lr
	.align 2, 0
_0804D9F0: .4byte 0x04000134
_0804D9F4: .4byte 0x04000128
_0804D9F8: .4byte 0x00002003
_0804D9FC: .4byte 0x0400012A

	THUMB_FUNC_END sub_804D9C4

	THUMB_FUNC_START sub_804DA00
sub_804DA00: @ 0x0804DA00
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	adds r7, r0, #0
	bl sub_804DF24
	cmp r0, #0
	beq _0804DA16
	b _0804DDDE
_0804DA16:
	adds r0, r7, #0
	adds r0, #0x4a
	ldrb r1, [r0]
	mov sl, r0
	cmp r1, #0xf
	bls _0804DA2A
	subs r0, r1, #1
	mov r1, sl
	strb r0, [r1]
	b _0804DDDE
_0804DA2A:
	adds r1, r7, #0
	adds r1, #0x48
	ldrb r0, [r1]
	cmp r0, #0
	beq _0804DA54
	movs r0, #0
	strb r0, [r1]
	ldr r0, _0804DA50  @ 0x04000128
	ldrh r0, [r0]
	movs r5, #0xfc
	ands r5, r0
	cmp r5, #8
	beq _0804DA54
	adds r0, r7, #0
	bl sub_804D9C4
	movs r0, #8
	eors r0, r5
	b _0804DDE0
	.align 2, 0
_0804DA50: .4byte 0x04000128
_0804DA54:
	ldrb r0, [r7, #0x18]
	cmp r0, #0xdf
	bls _0804DAA6
	adds r0, r7, #0
	bl sub_804DF38
	adds r5, r0, #0
	cmp r5, #0
	beq _0804DA68
	b _0804DDE0
_0804DA68:
	adds r0, r7, #0
	adds r0, #0x4b
	ldrb r0, [r0]
	cmp r0, #1
	bne _0804DA84
	ldrb r0, [r7, #0x18]
	cmp r0, #0xe1
	bls _0804DA84
	adds r0, r7, #0
	bl sub_804DF24
	cmp r0, #0
	bne _0804DA84
	b _0804DDCE
_0804DA84:
	adds r0, r7, #0
	bl sub_804DF24
	cmp r0, #0
	beq _0804DA90
	b _0804DDDE
_0804DA90:
	ldrh r0, [r7, #0x16]
	cmp r0, #0
	bne _0804DAA0
	adds r0, r7, #0
	bl sub_804D9C4
	movs r0, #0x71
	b _0804DDE0
_0804DAA0:
	subs r0, #1
	strh r0, [r7, #0x16]
	b _0804DDDE
_0804DAA6:
	ldrb r0, [r7, #0x18]
	cmp r0, #2
	bne _0804DAAE
	b _0804DBE4
_0804DAAE:
	cmp r0, #2
	bgt _0804DABC
	cmp r0, #0
	beq _0804DACA
	cmp r0, #1
	beq _0804DB86
	b _0804DD1C
_0804DABC:
	cmp r0, #0xd0
	bne _0804DAC2
	b _0804DC30
_0804DAC2:
	cmp r0, #0xd1
	bne _0804DAC8
	b _0804DCCA
_0804DAC8:
	b _0804DD1C
_0804DACA:
	movs r3, #0xe
	movs r5, #3
	ldr r0, _0804DB10  @ 0x04000120
	ldrh r0, [r0, #6]
	adds r1, r0, #0
	ldr r0, _0804DB14  @ 0x0000FFFF
	ldrb r2, [r7, #0x1e]
	adds r6, r2, #0
	cmp r1, r0
	bne _0804DAF2
	adds r4, r1, #0
	ldr r1, _0804DB18  @ 0x04000126
_0804DAE2:
	asrs r3, r3, #1
	subs r1, #2
	subs r5, #1
	cmp r5, #0
	beq _0804DAF2
	ldrh r0, [r1]
	cmp r0, r4
	beq _0804DAE2
_0804DAF2:
	movs r0, #0xe
	ands r3, r0
	strb r3, [r7, #0x1d]
	movs r5, #3
	ldr r0, _0804DB10  @ 0x04000120
	ldrh r0, [r0, #6]
	adds r4, r0, #0
	asrs r0, r2, #3
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0804DB20
	ldr r0, _0804DB1C  @ 0x00007208
	b _0804DB46
	.align 2, 0
_0804DB10: .4byte 0x04000120
_0804DB14: .4byte 0x0000FFFF
_0804DB18: .4byte 0x04000126
_0804DB1C: .4byte 0x00007208
_0804DB20:
	subs r5, #1
	cmp r5, #0
	beq _0804DB4C
	lsls r0, r5, #1
	ldr r1, _0804DB74  @ 0x04000120
	adds r0, r0, r1
	ldrh r0, [r0]
	adds r4, r0, #0
	adds r0, r2, #0
	asrs r0, r5
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0804DB20
	adds r0, r1, #0
	lsls r0, r5
	movs r1, #0xe4
	lsls r1, r1, #7
	orrs r0, r1
_0804DB46:
	cmp r4, r0
	beq _0804DB20
	movs r3, #0
_0804DB4C:
	adds r0, r3, #0
	ands r0, r6
	strb r0, [r7, #0x1e]
	cmp r3, #0
	bne _0804DB5C
	movs r0, #0xf
	mov r2, sl
	strb r0, [r2]
_0804DB5C:
	mov r1, sl
	ldrb r0, [r1]
	cmp r0, #0
	bne _0804DB78
	ldrb r0, [r7, #0x1d]
	ldrb r2, [r7, #0x1e]
	cmp r0, r2
	beq _0804DB7E
	adds r0, r7, #0
	bl sub_804DE3C
	b _0804DB86
	.align 2, 0
_0804DB74: .4byte 0x04000120
_0804DB78:
	subs r0, #1
	mov r1, sl
	strb r0, [r1]
_0804DB7E:
	ldrb r1, [r7, #0x1e]
	movs r2, #0xc4
	lsls r2, r2, #7
	b _0804DC86
_0804DB86:
	adds r1, r7, #0
	adds r1, #0x49
	movs r0, #0
	strb r0, [r1]
	movs r5, #3
	mov ip, r1
	ldr r3, _0804DBDC  @ gUnknown_03001864
_0804DB94:
	lsls r0, r5, #1
	ldr r2, _0804DBE0  @ 0x04000120
	adds r0, r0, r2
	ldrh r0, [r0]
	adds r4, r0, #0
	asrs r0, r4, #8
	subs r2, r5, #1
	cmp r0, #0x72
	bne _0804DBBE
	lsls r0, r2, #1
	adds r0, r0, r3
	strh r4, [r0]
	movs r0, #0xff
	ands r4, r0
	movs r0, #1
	lsls r0, r5
	cmp r4, r0
	bne _0804DBBE
	ldrb r0, [r1]
	orrs r4, r0
	strb r4, [r1]
_0804DBBE:
	adds r5, r2, #0
	cmp r5, #0
	bne _0804DB94
	ldrb r0, [r7, #0x1d]
	mov r1, ip
	ldrb r1, [r1]
	cmp r0, r1
	bne _0804DB7E
	movs r0, #2
	strb r0, [r7, #0x18]
	mov r2, ip
	ldrb r1, [r2]
	movs r2, #0xc2
	lsls r2, r2, #7
	b _0804DC86
	.align 2, 0
_0804DBDC: .4byte gUnknown_03001864
_0804DBE0: .4byte 0x04000120
_0804DBE4:
	movs r5, #3
	movs r0, #0x49
	adds r0, r0, r7
	mov ip, r0
	mov r4, ip
	movs r6, #1
	ldr r1, _0804DC28  @ gUnknown_03001864
	mov r9, r1
	ldr r2, _0804DC2C  @ 0x04000120
	mov r8, r2
_0804DBF8:
	ldrb r3, [r4]
	adds r0, r3, #0
	asrs r0, r5
	ands r0, r6
	subs r2, r5, #1
	cmp r0, #0
	beq _0804DC1E
	lsls r0, r5, #1
	add r0, r8
	ldrh r1, [r0]
	lsls r0, r2, #1
	add r0, r9
	ldrh r0, [r0]
	cmp r1, r0
	beq _0804DC1E
	adds r0, r6, #0
	lsls r0, r5
	eors r3, r0
	strb r3, [r4]
_0804DC1E:
	adds r5, r2, #0
	cmp r5, #0
	bne _0804DBF8
	b _0804DD84
	.align 2, 0
_0804DC28: .4byte gUnknown_03001864
_0804DC2C: .4byte 0x04000120
_0804DC30:
	movs r3, #1
	movs r5, #3
	movs r0, #0x49
	adds r0, r0, r7
	mov ip, r0
	adds r6, r7, #0
	adds r6, #0x19
	ldr r1, _0804DC94  @ gUnknown_03001864
	mov r8, r1
_0804DC42:
	lsls r0, r5, #1
	ldr r2, _0804DC98  @ 0x04000120
	adds r0, r0, r2
	ldrh r0, [r0]
	adds r4, r0, #0
	subs r2, r5, #1
	adds r0, r6, r2
	strb r4, [r0]
	mov r0, ip
	ldrb r1, [r0]
	asrs r1, r5
	movs r0, #1
	ands r1, r0
	cmp r1, #0
	beq _0804DC76
	asrs r0, r4, #8
	subs r0, #0x72
	cmp r0, #1
	bls _0804DC6A
	b _0804DDD4
_0804DC6A:
	lsls r0, r2, #1
	add r0, r8
	ldrh r0, [r0]
	cmp r4, r0
	bne _0804DC76
	movs r3, #0
_0804DC76:
	adds r5, r2, #0
	cmp r5, #0
	bne _0804DC42
	cmp r3, #0
	bne _0804DC9C
	ldrb r1, [r7, #0x1c]
	movs r2, #0xc6
	lsls r2, r2, #7
_0804DC86:
	adds r0, r2, #0
	orrs r1, r0
	adds r0, r7, #0
	bl sub_804DDF0
	b _0804DDE0
	.align 2, 0
_0804DC94: .4byte gUnknown_03001864
_0804DC98: .4byte 0x04000120
_0804DC9C:
	movs r0, #0xd1
	strb r0, [r7, #0x18]
	movs r3, #0x11
	movs r5, #3
	adds r1, r6, #2
_0804DCA6:
	ldrb r0, [r1]
	adds r3, r3, r0
	subs r1, #1
	subs r5, #1
	cmp r5, #0
	bne _0804DCA6
	strb r3, [r7, #0x14]
	movs r0, #0xff
	ands r3, r0
	movs r1, #0xc8
	lsls r1, r1, #7
	adds r0, r1, #0
	orrs r3, r0
	adds r0, r7, #0
	adds r1, r3, #0
	bl sub_804DDF0
	b _0804DDE0
_0804DCCA:
	movs r5, #3
	movs r2, #0x49
	ldrb r1, [r2, r7]
	ldr r2, _0804DD08  @ 0x04000126
	movs r3, #1
_0804DCD4:
	ldrh r0, [r2]
	adds r4, r0, #0
	adds r0, r1, #0
	asrs r0, r5
	ands r0, r3
	cmp r0, #0
	beq _0804DCE8
	asrs r0, r4, #8
	cmp r0, #0x73
	bne _0804DDD4
_0804DCE8:
	subs r2, #2
	subs r5, #1
	cmp r5, #0
	bne _0804DCD4
	adds r0, r7, #0
	bl MultiBoot
	adds r5, r0, #0
	cmp r5, #0
	bne _0804DD0C
	movs r0, #0xe0
	strb r0, [r7, #0x18]
	adds r0, #0xb0
	strh r0, [r7, #0x16]
	b _0804DDDE
	.align 2, 0
_0804DD08: .4byte 0x04000126
_0804DD0C:
	adds r0, r7, #0
	bl sub_804D9C4
	movs r0, #0x1e
	mov r1, sl
	strb r0, [r1]
	movs r0, #0x70
	b _0804DDE0
_0804DD1C:
	movs r5, #3
	movs r2, #0x49
	adds r2, r2, r7
	mov ip, r2
	mov r8, ip
	movs r0, #1
	mov r9, r0
_0804DD2A:
	mov r1, r8
	ldrb r6, [r1]
	adds r0, r6, #0
	asrs r0, r5
	mov r2, r9
	ands r0, r2
	cmp r0, #0
	beq _0804DD64
	lsls r0, r5, #1
	ldr r1, _0804DD80  @ 0x04000120
	adds r0, r0, r1
	ldrh r0, [r0]
	adds r4, r0, #0
	asrs r2, r4, #8
	ldrb r0, [r7, #0x18]
	lsrs r0, r0, #1
	movs r1, #0x62
	subs r1, r1, r0
	mov r3, r9
	lsls r3, r5
	cmp r2, r1
	bne _0804DD5E
	movs r0, #0xff
	ands r4, r0
	cmp r4, r3
	beq _0804DD64
_0804DD5E:
	eors r6, r3
	mov r2, r8
	strb r6, [r2]
_0804DD64:
	subs r5, #1
	cmp r5, #0
	bne _0804DD2A
	ldrb r0, [r7, #0x18]
	cmp r0, #0xc4
	bne _0804DD84
	mov r0, ip
	ldrb r1, [r0]
	movs r0, #0xe
	ands r0, r1
	strb r0, [r7, #0x1e]
	strb r5, [r7, #0x18]
	b _0804DB7E
	.align 2, 0
_0804DD80: .4byte 0x04000120
_0804DD84:
	mov r1, ip
	ldrb r0, [r1]
	cmp r0, #0
	bne _0804DD96
	adds r0, r7, #0
	bl sub_804D9C4
	movs r0, #0x50
	b _0804DDE0
_0804DD96:
	ldrb r0, [r7, #0x18]
	adds r0, #2
	strb r0, [r7, #0x18]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xc4
	bne _0804DDA6
	b _0804DB7E
_0804DDA6:
	ldrb r0, [r7, #0x18]
	ldr r1, [r7, #0x28]
	adds r0, r0, r1
	subs r1, r0, #3
	ldrb r2, [r1]
	lsls r2, r2, #8
	subs r0, #4
	ldrb r1, [r0]
	orrs r1, r2
	adds r0, r7, #0
	bl sub_804DDF0
	adds r5, r0, #0
	cmp r5, #0
	bne _0804DDE0
	adds r0, r7, #0
	adds r0, #0x4b
	ldrb r0, [r0]
	cmp r0, #1
	bne _0804DDDE
_0804DDCE:
	bl sub_804E03C
	b _0804DA2A
_0804DDD4:
	adds r0, r7, #0
	bl sub_804D9C4
	movs r0, #0x60
	b _0804DDE0
_0804DDDE:
	movs r0, #0
_0804DDE0:
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_804DA00

	THUMB_FUNC_START sub_804DDF0
sub_804DDF0: @ 0x0804DDF0
	push {r4, lr}
	adds r2, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldr r3, _0804DE1C  @ 0x04000128
	ldrh r0, [r3]
	movs r4, #0x8c
	ands r4, r0
	cmp r4, #8
	bne _0804DE28
	ldr r0, _0804DE20  @ 0x0400012A
	strh r1, [r0]
	ldr r1, _0804DE24  @ 0x00002083
	adds r0, r1, #0
	strh r0, [r3]
	adds r1, r2, #0
	adds r1, #0x48
	movs r0, #1
	strb r0, [r1]
	movs r0, #0
	b _0804DE34
	.align 2, 0
_0804DE1C: .4byte 0x04000128
_0804DE20: .4byte 0x0400012A
_0804DE24: .4byte 0x00002083
_0804DE28:
	adds r0, r2, #0
	bl sub_804D9C4
	movs r0, #8
	eors r4, r0
	adds r0, r4, #0
_0804DE34:
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_804DDF0

	THUMB_FUNC_START sub_804DE3C
sub_804DE3C: @ 0x0804DE3C
	push {lr}
	adds r1, r0, #0
	ldrb r0, [r1, #0x18]
	cmp r0, #0
	beq _0804DE4E
	adds r0, r1, #0
	bl sub_804D9C4
	b _0804DE5A
_0804DE4E:
	adds r2, r1, #0
	adds r2, #0x4a
	strb r0, [r2]
	strb r0, [r1, #0x1e]
	movs r0, #1
	strb r0, [r1, #0x18]
_0804DE5A:
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_804DE3C

	THUMB_FUNC_START sub_804DE60
sub_804DE60: @ 0x0804DE60
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	ldr r0, [sp, #0x14]
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldrb r0, [r5, #0x18]
	cmp r0, #0
	bne _0804DE9A
	ldrb r0, [r5, #0x1e]
	cmp r0, #0
	beq _0804DE9A
	adds r0, r5, #0
	adds r0, #0x4a
	ldrb r0, [r0]
	cmp r0, #0
	bne _0804DE9A
	str r6, [r5, #0x20]
	adds r2, #0xf
	movs r0, #0x10
	negs r0, r0
	ands r2, r0
	subs r0, #0xf0
	adds r1, r2, r0
	ldr r0, _0804DEA4  @ 0x0003FF00
	cmp r1, r0
	bls _0804DEA8
_0804DE9A:
	adds r0, r5, #0
	bl sub_804D9C4
	b _0804DF1C
	.align 2, 0
_0804DEA4: .4byte 0x0003FF00
_0804DEA8:
	adds r0, r6, r2
	str r0, [r5, #0x24]
	lsls r1, r7, #0x18
	movs r2, #0x80
	lsls r2, r2, #0x13
	adds r0, r1, r2
	asrs r0, r0, #0x18
	adds r2, r1, #0
	cmp r0, #8
	bhi _0804DF08
	lsls r0, r0, #2
	ldr r1, _0804DEC8  @ _0804DECC
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0804DEC8: .4byte _0804DECC
_0804DECC: @ jump table
	.4byte _0804DEF0 @ case 0
	.4byte _0804DEF0 @ case 1
	.4byte _0804DEF0 @ case 2
	.4byte _0804DEF0 @ case 3
	.4byte _0804DEFA @ case 4
	.4byte _0804DF00 @ case 5
	.4byte _0804DF00 @ case 6
	.4byte _0804DF00 @ case 7
	.4byte _0804DF00 @ case 8
_0804DEF0:
	lsls r4, r3, #3
	asrs r1, r2, #0x18
	movs r0, #3
	subs r0, r0, r1
	b _0804DF06
_0804DEFA:
	movs r0, #0x38
	adds r4, r3, #0
	b _0804DF06
_0804DF00:
	lsls r4, r3, #3
	asrs r0, r2, #0x18
	subs r0, #1
_0804DF06:
	orrs r4, r0
_0804DF08:
	movs r0, #0x3f
	ands r4, r0
	lsls r0, r4, #1
	movs r2, #0x7f
	negs r2, r2
	adds r1, r2, #0
	orrs r0, r1
	strb r0, [r5, #0x1c]
	movs r0, #0xd0
	strb r0, [r5, #0x18]
_0804DF1C:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_804DE60

	THUMB_FUNC_START sub_804DF24
sub_804DF24: @ 0x0804DF24
	push {lr}
	ldrb r0, [r0, #0x18]
	cmp r0, #0xe9
	beq _0804DF30
	movs r0, #0
	b _0804DF32
_0804DF30:
	movs r0, #1
_0804DF32:
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_804DF24

	THUMB_FUNC_START sub_804DF38
sub_804DF38: @ 0x0804DF38
	push {r4, r5, r6, lr}
	adds r3, r0, #0
	ldrb r0, [r3, #0x18]
	cmp r0, #0xe0
	beq _0804DF54
	cmp r0, #0xe0
	blt _0804DF64
	cmp r0, #0xe8
	bgt _0804DF64
	cmp r0, #0xe7
	blt _0804DF64
	movs r4, #3
	ldrb r5, [r3, #0x1e]
	b _0804DFC4
_0804DF54:
	movs r1, #0
	movs r0, #0xe1
	strb r0, [r3, #0x18]
	str r1, [r3, #4]
	movs r0, #0x80
	lsls r0, r0, #0xd
	str r0, [r3]
	b _0804DFB6
_0804DF64:
	movs r4, #3
	ldrb r5, [r3, #0x1e]
	movs r6, #1
	ldr r1, _0804DFC0  @ 0x04000126
_0804DF6C:
	ldrh r0, [r1]
	adds r2, r0, #0
	adds r0, r5, #0
	asrs r0, r4
	ands r0, r6
	cmp r0, #0
	beq _0804DF80
	ldr r0, [r3, #4]
	cmp r2, r0
	bne _0804DF54
_0804DF80:
	subs r1, #2
	subs r4, #1
	cmp r4, #0
	bne _0804DF6C
	ldrb r0, [r3, #0x18]
	adds r0, #1
	strb r0, [r3, #0x18]
	ldr r1, [r3]
	ldrh r0, [r3]
	str r0, [r3, #4]
	cmp r1, #0
	bne _0804DFAE
	ldr r0, [r3, #0x28]
	adds r1, r0, #0
	adds r1, #0xac
	ldrb r1, [r1]
	adds r0, #0xad
	ldrb r0, [r0]
	lsls r0, r0, #8
	orrs r1, r0
	str r1, [r3, #4]
	lsls r1, r1, #5
	str r1, [r3]
_0804DFAE:
	ldr r0, [r3]
	lsrs r0, r0, #5
	str r0, [r3]
_0804DFB4:
	ldrh r1, [r3]
_0804DFB6:
	adds r0, r3, #0
	bl sub_804DDF0
	b _0804E01C
	.align 2, 0
_0804DFC0: .4byte 0x04000126
_0804DFC4:
	lsls r0, r4, #1
	ldr r1, _0804E00C  @ 0x04000120
	adds r0, r0, r1
	ldrh r0, [r0]
	adds r2, r0, #0
	adds r0, r5, #0
	asrs r0, r4
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0804DFE0
	ldr r0, [r3, #4]
	cmp r2, r0
	bne _0804E010
_0804DFE0:
	subs r4, #1
	cmp r4, #0
	bne _0804DFC4
	ldrb r0, [r3, #0x18]
	adds r0, #1
	strb r0, [r3, #0x18]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xe9
	beq _0804E01A
	ldr r0, [r3, #0x28]
	adds r1, r0, #0
	adds r1, #0xae
	ldrb r1, [r1]
	adds r0, #0xaf
	ldrb r0, [r0]
	lsls r0, r0, #8
	orrs r1, r0
	str r1, [r3]
	str r1, [r3, #4]
	b _0804DFB4
	.align 2, 0
_0804E00C: .4byte 0x04000120
_0804E010:
	adds r0, r3, #0
	bl sub_804D9C4
	movs r0, #0x71
	b _0804E01C
_0804E01A:
	movs r0, #0
_0804E01C:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_804DF38

	THUMB_FUNC_START sub_804E024
sub_804E024: @ 0x0804E024
	mov r2, pc
	lsrs r2, r2, #0x18
	movs r1, #0xc
	cmp r2, #2
	beq _0804E036
	movs r1, #0xd
	cmp r2, #8
	beq _0804E036
	movs r1, #4
_0804E036:
	subs r0, r0, r1
	bgt _0804E036
	bx lr

	THUMB_FUNC_END sub_804E024

	THUMB_FUNC_START sub_804E03C
sub_804E03C: @ 0x0804E03C
	push {r4, r5, lr}
	movs r2, #0
	ldr r3, _0804E070  @ 0x04000128
	ldrh r1, [r3]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0804E060
	ldr r5, _0804E074  @ 0x0000795C
	movs r4, #0x80
_0804E050:
	adds r2, #1
	cmp r2, r5
	bgt _0804E060
	ldrh r1, [r3]
	adds r0, r4, #0
	ands r0, r1
	cmp r0, #0
	bne _0804E050
_0804E060:
	movs r0, #0x96
	lsls r0, r0, #2
	bl sub_804E024
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0804E070: .4byte 0x04000128
_0804E074: .4byte 0x0000795C

	THUMB_FUNC_END sub_804E03C

.align 2, 0
