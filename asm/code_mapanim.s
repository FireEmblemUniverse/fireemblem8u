	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	THUMB_FUNC_START sub_8081E78
sub_8081E78: @ 0x08081E78
	push {r4, r5, lr}
	ldr r4, _08081EA0  @ gUnknown_0203E254
	adds r0, r4, #0
	bl sub_80823A0
	movs r0, #0xa0
	lsls r0, r0, #2
	adds r5, r4, r0
	adds r0, r5, #0
	bl sub_80823A0
	ldr r0, _08081EA4  @ gUnknown_0203E754
	str r4, [r0]
	str r5, [r0, #4]
	ldr r0, _08081EA8  @ gUnknown_0203E75C
	str r4, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08081EA0: .4byte gUnknown_0203E254
_08081EA4: .4byte gUnknown_0203E754
_08081EA8: .4byte gUnknown_0203E75C

	THUMB_FUNC_END sub_8081E78

	THUMB_FUNC_START sub_8081EAC
sub_8081EAC: @ 0x08081EAC
	push {lr}
	ldr r3, _08081F1C  @ gLCDControlBuffer
	ldrb r0, [r3, #1]
	movs r1, #0x20
	orrs r0, r1
	movs r1, #0x41
	negs r1, r1
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r3, #1]
	adds r1, r3, #0
	adds r1, #0x2d
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
	adds r2, r3, #0
	adds r2, #0x34
	ldrb r1, [r2]
	subs r0, #0xa2
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
	adds r2, #2
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
	ldr r0, _08081F20  @ sub_8081F64
	bl SetPrimaryHBlankHandler
	pop {r0}
	bx r0
	.align 2, 0
_08081F1C: .4byte gLCDControlBuffer
_08081F20: .4byte sub_8081F64

	THUMB_FUNC_END sub_8081EAC

	THUMB_FUNC_START sub_8081F24
sub_8081F24: @ 0x08081F24
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r5, r0, #0
	adds r6, r1, #0
	mov r8, r2
	ldr r4, _08081F54  @ gUnknown_0203E754
	ldr r0, [r4, #4]
	bl sub_80823A0
	ldr r0, [r4, #4]
	adds r1, r5, #0
	adds r2, r6, #0
	mov r3, r8
	bl sub_80823FC
	bl sub_8082390
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08081F54: .4byte gUnknown_0203E754

	THUMB_FUNC_END sub_8081F24

	THUMB_FUNC_START sub_8081F58
sub_8081F58: @ 0x08081F58
	push {lr}
	movs r0, #0
	bl SetPrimaryHBlankHandler
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8081F58

	THUMB_FUNC_START sub_8081F64
sub_8081F64: @ 0x08081F64
	push {lr}
	ldr r0, _08081F7C  @ 0x04000006
	ldrh r0, [r0]
	adds r3, r0, #0
	cmp r3, #0x9f
	bls _08081F88
	ldr r0, _08081F80  @ gUnknown_0203E75C
	ldr r1, _08081F84  @ gUnknown_0203E754
	ldr r1, [r1]
	str r1, [r0]
	movs r3, #0
	b _08081F90
	.align 2, 0
_08081F7C: .4byte 0x04000006
_08081F80: .4byte gUnknown_0203E75C
_08081F84: .4byte gUnknown_0203E754
_08081F88:
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	ldr r0, _08081FA0  @ gUnknown_0203E75C
_08081F90:
	ldr r2, _08081FA4  @ 0x04000040
	ldr r1, [r0]
	lsls r0, r3, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r2]
	pop {r0}
	bx r0
	.align 2, 0
_08081FA0: .4byte gUnknown_0203E75C
_08081FA4: .4byte 0x04000040

	THUMB_FUNC_END sub_8081F64

	THUMB_FUNC_START sub_8081FA8
sub_8081FA8: @ 0x08081FA8
	push {lr}
	ldr r0, _08081FC0  @ 0x04000006
	ldrh r0, [r0]
	adds r3, r0, #0
	cmp r3, #0x9f
	bls _08081FCC
	ldr r0, _08081FC4  @ gUnknown_0203E75C
	ldr r1, _08081FC8  @ gUnknown_0203E754
	ldr r1, [r1]
	str r1, [r0]
	movs r3, #0
	b _08081FD4
	.align 2, 0
_08081FC0: .4byte 0x04000006
_08081FC4: .4byte gUnknown_0203E75C
_08081FC8: .4byte gUnknown_0203E754
_08081FCC:
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	ldr r0, _08081FF0  @ gUnknown_0203E75C
_08081FD4:
	ldr r2, _08081FF4  @ 0x04000040
	ldr r1, [r0]
	lsls r0, r3, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	strh r1, [r2]
	ldr r1, _08081FF8  @ 0x04000018
	movs r2, #0xa0
	lsls r2, r2, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_08081FF0: .4byte gUnknown_0203E75C
_08081FF4: .4byte 0x04000040
_08081FF8: .4byte 0x04000018

	THUMB_FUNC_END sub_8081FA8

	THUMB_FUNC_START sub_8081FFC
sub_8081FFC: @ 0x08081FFC
	push {lr}
	ldr r0, _08082014  @ 0x04000006
	ldrh r0, [r0]
	adds r3, r0, #0
	cmp r3, #0x9f
	bls _08082020
	ldr r0, _08082018  @ gUnknown_0203E75C
	ldr r1, _0808201C  @ gUnknown_0203E754
	ldr r1, [r1]
	str r1, [r0]
	movs r3, #0
	b _08082028
	.align 2, 0
_08082014: .4byte 0x04000006
_08082018: .4byte gUnknown_0203E75C
_0808201C: .4byte gUnknown_0203E754
_08082020:
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	ldr r0, _08082044  @ gUnknown_0203E75C
_08082028:
	ldr r2, _08082048  @ 0x05000022
	ldr r1, [r0]
	lsls r0, r3, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	strh r1, [r2]
	ldr r1, _0808204C  @ 0x05000042
	movs r2, #0xa0
	lsls r2, r2, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_08082044: .4byte gUnknown_0203E75C
_08082048: .4byte 0x05000022
_0808204C: .4byte 0x05000042

	THUMB_FUNC_END sub_8081FFC

	THUMB_FUNC_START sub_8082050
sub_8082050: @ 0x08082050
	push {lr}
	ldr r0, _08082068  @ 0x04000006
	ldrh r0, [r0]
	adds r3, r0, #0
	cmp r3, #0x9f
	bls _08082074
	ldr r0, _0808206C  @ gUnknown_0203E75C
	ldr r1, _08082070  @ gUnknown_0203E754
	ldr r1, [r1]
	str r1, [r0]
	movs r3, #0
	b _0808207C
	.align 2, 0
_08082068: .4byte 0x04000006
_0808206C: .4byte gUnknown_0203E75C
_08082070: .4byte gUnknown_0203E754
_08082074:
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	ldr r0, _0808208C  @ gUnknown_0203E75C
_0808207C:
	ldr r2, _08082090  @ 0x04000052
	ldr r1, [r0]
	lsls r0, r3, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r2]
	pop {r0}
	bx r0
	.align 2, 0
_0808208C: .4byte gUnknown_0203E75C
_08082090: .4byte 0x04000052

	THUMB_FUNC_END sub_8082050

	THUMB_FUNC_START sub_8082094
sub_8082094: @ 0x08082094
	push {lr}
	ldr r0, _080820AC  @ 0x04000006
	ldrh r0, [r0]
	adds r3, r0, #0
	cmp r3, #0x9f
	bls _080820B8
	ldr r0, _080820B0  @ gUnknown_0203E75C
	ldr r1, _080820B4  @ gUnknown_0203E754
	ldr r1, [r1]
	str r1, [r0]
	movs r3, #0
	b _080820C0
	.align 2, 0
_080820AC: .4byte 0x04000006
_080820B0: .4byte gUnknown_0203E75C
_080820B4: .4byte gUnknown_0203E754
_080820B8:
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	ldr r0, _080820D0  @ gUnknown_0203E75C
_080820C0:
	ldr r2, _080820D4  @ 0x04000054
	ldr r1, [r0]
	lsls r0, r3, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r2]
	pop {r0}
	bx r0
	.align 2, 0
_080820D0: .4byte gUnknown_0203E75C
_080820D4: .4byte 0x04000054

	THUMB_FUNC_END sub_8082094

	THUMB_FUNC_START sub_80820D8
sub_80820D8: @ 0x080820D8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov r9, r0
	mov sl, r1
	adds r4, r2, #0
	adds r5, r3, #0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r9, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov sl, r1
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	ldr r7, _08082184  @ gUnknown_0203E754
	ldr r0, [r7, #4]
	adds r2, r4, #0
	movs r3, #0x1f
	ands r2, r3
	lsrs r2, r2, #1
	movs r1, #0xf8
	lsls r1, r1, #2
	mov r8, r1
	adds r1, r4, #0
	mov r3, r8
	ands r1, r3
	lsrs r1, r1, #1
	ands r1, r3
	orrs r2, r1
	movs r6, #0xf8
	lsls r6, r6, #7
	adds r1, r4, #0
	ands r1, r6
	lsrs r1, r1, #1
	ands r1, r6
	orrs r2, r1
	str r2, [sp]
	mov r1, r9
	mov r2, sl
	adds r3, r4, #0
	bl sub_80824C4
	ldr r0, [r7, #4]
	movs r1, #0xa0
	lsls r1, r1, #1
	adds r0, r0, r1
	adds r2, r5, #0
	movs r3, #0x1f
	ands r2, r3
	lsrs r2, r2, #1
	adds r1, r5, #0
	mov r3, r8
	ands r1, r3
	lsrs r1, r1, #1
	ands r1, r3
	orrs r2, r1
	adds r1, r5, #0
	ands r1, r6
	lsrs r1, r1, #1
	ands r1, r6
	orrs r2, r1
	str r2, [sp]
	mov r1, r9
	mov r2, sl
	adds r3, r5, #0
	bl sub_80824C4
	bl sub_8082390
	ldr r0, _08082188  @ sub_8081FFC
	bl SetPrimaryHBlankHandler
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08082184: .4byte gUnknown_0203E754
_08082188: .4byte sub_8081FFC

	THUMB_FUNC_END sub_80820D8

	THUMB_FUNC_START sub_808218C
sub_808218C: @ 0x0808218C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	adds r7, r0, #0
	adds r4, r1, #0
	mov sl, r2
	mov r9, r3
	ldr r5, [sp, #0x20]
	ldr r0, _080821AC  @ gUnknown_0203E754
	mov r8, r0
	ldr r0, [r0, #4]
	bl sub_80823A0
	b _080821E2
	.align 2, 0
_080821AC: .4byte gUnknown_0203E754
_080821B0:
	ldrb r0, [r5]
	mov r1, sl
	muls r1, r0, r1
	adds r0, r1, #0
	mov r1, r9
	bl Div
	adds r6, r0, #0
	adds r5, #1
	cmp r6, #0
	ble _080821E0
	mov r1, r8
	ldr r0, [r1, #4]
	adds r1, r7, r6
	subs r1, #1
	adds r2, r4, #0
	bl sub_80823DC
	mov r1, r8
	ldr r0, [r1, #4]
	subs r1, r7, r6
	adds r2, r4, #0
	bl sub_80823BC
_080821E0:
	subs r4, #1
_080821E2:
	ldrb r0, [r5]
	cmp r0, #0xff
	beq _080821EC
	cmp r4, #0
	bge _080821B0
_080821EC:
	cmp r6, #0
	ble _08082216
	cmp r4, #0
	blt _08082216
	ldr r5, _08082224  @ gUnknown_0203E754
	adds r0, r7, r6
	mov r8, r0
_080821FA:
	ldr r0, [r5, #4]
	mov r1, r8
	subs r1, #1
	adds r2, r4, #0
	bl sub_80823DC
	ldr r0, [r5, #4]
	subs r1, r7, r6
	adds r2, r4, #0
	bl sub_80823BC
	subs r4, #1
	cmp r4, #0
	bge _080821FA
_08082216:
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08082224: .4byte gUnknown_0203E754

	THUMB_FUNC_END sub_808218C

	THUMB_FUNC_START sub_8082228
sub_8082228: @ 0x08082228
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	ldr r0, _08082264  @ gSinLookup
	mov ip, r0
	lsls r3, r3, #0x10
	asrs r5, r3, #0x10
	lsls r1, r1, #0x10
	lsls r2, r2, #0x10
	asrs r3, r2, #0x10
	asrs r1, r1, #0x10
	movs r6, #0xff
	movs r2, #0x9f
_08082240:
	adds r0, r1, #0
	ands r0, r6
	lsls r0, r0, #1
	add r0, ip
	movs r7, #0
	ldrsh r0, [r0, r7]
	muls r0, r3, r0
	asrs r0, r0, #0xc
	strh r0, [r4]
	adds r4, #2
	adds r1, r1, r5
	subs r2, #1
	cmp r2, #0
	bge _08082240
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08082264: .4byte gSinLookup

	THUMB_FUNC_END sub_8082228

	THUMB_FUNC_START sub_8082268
sub_8082268: @ 0x08082268
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	ldr r0, _080822A8  @ gSinLookup
	mov ip, r0
	lsls r3, r3, #0x10
	asrs r5, r3, #0x10
	lsls r1, r1, #0x10
	lsls r2, r2, #0x10
	asrs r3, r2, #0x10
	asrs r1, r1, #0x10
	movs r6, #0xff
	movs r2, #0x9f
_08082280:
	adds r0, r1, #0
	ands r0, r6
	lsls r0, r0, #1
	add r0, ip
	movs r7, #0
	ldrsh r0, [r0, r7]
	muls r0, r3, r0
	asrs r0, r0, #0xc
	ldr r7, [sp, #0x14]
	adds r0, r0, r7
	strh r0, [r4]
	adds r4, #2
	adds r1, r1, r5
	subs r2, #1
	cmp r2, #0
	bge _08082280
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080822A8: .4byte gSinLookup

	THUMB_FUNC_END sub_8082268

	THUMB_FUNC_START sub_80822AC
sub_80822AC: @ 0x080822AC
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r4, #2
	ldr r0, _080822EC  @ gSinLookup
	mov ip, r0
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	lsls r2, r2, #0x10
	asrs r5, r2, #0x10
	adds r1, r3, r1
	movs r6, #0xff
	lsls r3, r3, #1
	movs r2, #0x9e
_080822CA:
	adds r0, r1, #0
	ands r0, r6
	lsls r0, r0, #1
	add r0, ip
	movs r7, #0
	ldrsh r0, [r0, r7]
	muls r0, r5, r0
	asrs r0, r0, #0xc
	strh r0, [r4]
	adds r4, #4
	adds r1, r1, r3
	subs r2, #2
	cmp r2, #0
	bge _080822CA
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080822EC: .4byte gSinLookup

	THUMB_FUNC_END sub_80822AC

	THUMB_FUNC_START sub_80822F0
sub_80822F0: @ 0x080822F0
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r4, #2
	ldr r0, _08082334  @ gSinLookup
	mov ip, r0
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	lsls r2, r2, #0x10
	asrs r5, r2, #0x10
	adds r1, r3, r1
	movs r6, #0xff
	lsls r3, r3, #1
	movs r2, #0x9e
_0808230E:
	adds r0, r1, #0
	ands r0, r6
	lsls r0, r0, #1
	add r0, ip
	movs r7, #0
	ldrsh r0, [r0, r7]
	muls r0, r5, r0
	asrs r0, r0, #0xc
	ldr r7, [sp, #0x14]
	adds r0, r0, r7
	strh r0, [r4]
	adds r4, #4
	adds r1, r1, r3
	subs r2, #2
	cmp r2, #0
	bge _0808230E
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08082334: .4byte gSinLookup

	THUMB_FUNC_END sub_80822F0

	THUMB_FUNC_START sub_8082338
sub_8082338: @ 0x08082338
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	ldr r7, [sp, #0x18]
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r5, r2, #0x10
	lsls r3, r3, #0x10
	lsrs r0, r3, #0x10
	ldr r2, [sp, #0x14]
	cmp r2, r7
	bge _08082386
	ldr r3, _0808238C  @ gSinLookup
	mov ip, r3
	lsls r0, r0, #0x10
	asrs r3, r0, #0x10
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	lsls r0, r5, #0x10
	asrs r5, r0, #0x10
	adds r0, r2, #0
	muls r0, r3, r0
	adds r1, r0, r1
	movs r6, #0xff
	subs r2, r7, r2
_0808236A:
	adds r0, r1, #0
	ands r0, r6
	lsls r0, r0, #1
	add r0, ip
	movs r7, #0
	ldrsh r0, [r0, r7]
	muls r0, r5, r0
	asrs r0, r0, #0xc
	strh r0, [r4]
	adds r4, #2
	adds r1, r1, r3
	subs r2, #1
	cmp r2, #0
	bne _0808236A
_08082386:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808238C: .4byte gSinLookup

	THUMB_FUNC_END sub_8082338

	THUMB_FUNC_START sub_8082390
sub_8082390: @ 0x08082390
	ldr r0, _0808239C  @ gUnknown_0203E754
	ldr r2, [r0]
	ldr r1, [r0, #4]
	str r1, [r0]
	str r2, [r0, #4]
	bx lr
	.align 2, 0
_0808239C: .4byte gUnknown_0203E754

	THUMB_FUNC_END sub_8082390

	THUMB_FUNC_START sub_80823A0
sub_80823A0: @ 0x080823A0
	push {lr}
	ldr r1, _080823B8  @ 0x0000F0F0
	adds r2, r1, #0
	movs r1, #0x9f
_080823A8:
	strh r2, [r0]
	adds r0, #2
	subs r1, #1
	cmp r1, #0
	bge _080823A8
	pop {r0}
	bx r0
	.align 2, 0
_080823B8: .4byte 0x0000F0F0

	THUMB_FUNC_END sub_80823A0

	THUMB_FUNC_START sub_80823BC
sub_80823BC: @ 0x080823BC
	push {lr}
	adds r3, r0, #0
	cmp r2, #0x9f
	bhi _080823D6
	cmp r1, #0
	bge _080823CA
	movs r1, #0
_080823CA:
	cmp r1, #0xf0
	ble _080823D0
	movs r1, #0xf0
_080823D0:
	lsls r0, r2, #1
	adds r0, r3, r0
	strb r1, [r0, #1]
_080823D6:
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80823BC

	THUMB_FUNC_START sub_80823DC
sub_80823DC: @ 0x080823DC
	push {lr}
	adds r3, r0, #0
	cmp r2, #0x9f
	bhi _080823F6
	cmp r1, #0
	bge _080823EA
	movs r1, #0
_080823EA:
	cmp r1, #0xf0
	ble _080823F0
	movs r1, #0xf0
_080823F0:
	lsls r0, r2, #1
	adds r0, r3, r0
	strb r1, [r0]
_080823F6:
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80823DC

	THUMB_FUNC_START sub_80823FC
sub_80823FC: @ 0x080823FC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	adds r6, r0, #0
	str r1, [sp]
	str r2, [sp, #4]
	adds r7, r3, #0
	str r7, [sp, #8]
	movs r0, #0
	mov sl, r0
	cmp r7, #0
	blt _080824B4
_0808241A:
	ldr r1, [sp]
	adds r4, r1, r7
	ldr r2, [sp, #4]
	add r2, sl
	str r2, [sp, #0xc]
	adds r0, r6, #0
	adds r1, r4, #0
	bl sub_80823DC
	ldr r0, [sp, #4]
	mov r1, sl
	subs r0, r0, r1
	mov r8, r0
	adds r0, r6, #0
	adds r1, r4, #0
	mov r2, r8
	bl sub_80823DC
	ldr r4, [sp]
	add r4, sl
	ldr r2, [sp, #4]
	adds r2, r2, r7
	mov r9, r2
	adds r0, r6, #0
	adds r1, r4, #0
	bl sub_80823DC
	ldr r0, [sp, #4]
	subs r5, r0, r7
	adds r0, r6, #0
	adds r1, r4, #0
	adds r2, r5, #0
	bl sub_80823DC
	ldr r1, [sp]
	subs r4, r1, r7
	adds r0, r6, #0
	adds r1, r4, #0
	ldr r2, [sp, #0xc]
	bl sub_80823BC
	adds r0, r6, #0
	adds r1, r4, #0
	mov r2, r8
	bl sub_80823BC
	ldr r2, [sp]
	mov r0, sl
	subs r4, r2, r0
	adds r0, r6, #0
	adds r1, r4, #0
	mov r2, r9
	bl sub_80823BC
	adds r0, r6, #0
	adds r1, r4, #0
	adds r2, r5, #0
	bl sub_80823BC
	ldr r1, [sp, #8]
	adds r1, #1
	mov r2, sl
	lsls r0, r2, #1
	subs r1, r1, r0
	str r1, [sp, #8]
	cmp r1, #0
	bge _080824AC
	subs r1, r7, #1
	lsls r0, r1, #1
	ldr r2, [sp, #8]
	adds r2, r2, r0
	str r2, [sp, #8]
	adds r7, r1, #0
_080824AC:
	movs r0, #1
	add sl, r0
	cmp r7, sl
	bge _0808241A
_080824B4:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80823FC

	THUMB_FUNC_START sub_80824C4
sub_80824C4: @ 0x080824C4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x1c
	adds r7, r0, #0
	ldr r0, [sp, #0x3c]
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	str r1, [sp, #4]
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	str r2, [sp, #8]
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	mov r9, r3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	subs r0, r2, r1
	str r0, [sp, #0x10]
	movs r1, #0
	str r1, [sp, #0xc]
	mov sl, r1
	movs r1, #0x1f
	mov r0, r8
	ands r0, r1
	lsls r0, r0, #0x10
	str r0, [sp, #0x18]
	mov r0, r9
	ands r0, r1
	lsls r0, r0, #0x10
	str r0, [sp, #0x14]
_08082508:
	ldr r2, [sp, #4]
	cmp sl, r2
	bge _08082516
	mov r3, r9
	strh r3, [r7]
	adds r7, #2
	b _08082596
_08082516:
	ldr r0, [sp, #8]
	cmp sl, r0
	ble _08082524
	mov r1, r8
	strh r1, [r7]
	adds r7, #2
	b _08082596
_08082524:
	ldr r2, [sp, #0x10]
	str r2, [sp]
	movs r0, #0
	ldr r3, [sp, #0x14]
	lsrs r1, r3, #0x10
	ldr r3, [sp, #0x18]
	lsrs r2, r3, #0x10
	ldr r3, [sp, #0xc]
	bl Interpolate
	adds r4, r0, #0
	mov r1, r9
	movs r0, #0xf8
	lsls r0, r0, #2
	ands r1, r0
	lsls r1, r1, #0x10
	mov r2, r8
	ands r2, r0
	lsls r2, r2, #0x10
	ldr r3, [sp, #0x10]
	str r3, [sp]
	movs r0, #0
	lsrs r1, r1, #0x10
	lsrs r2, r2, #0x10
	ldr r3, [sp, #0xc]
	bl Interpolate
	adds r5, r0, #0
	movs r6, #0xf8
	lsls r6, r6, #7
	mov r1, r9
	ands r1, r6
	lsls r1, r1, #0x10
	mov r2, r8
	ands r2, r6
	lsls r2, r2, #0x10
	ldr r0, [sp, #0x10]
	str r0, [sp]
	movs r0, #0
	lsrs r1, r1, #0x10
	lsrs r2, r2, #0x10
	ldr r3, [sp, #0xc]
	bl Interpolate
	movs r1, #0x1f
	ands r4, r1
	movs r2, #0xf8
	lsls r2, r2, #2
	ands r5, r2
	orrs r4, r5
	ands r0, r6
	orrs r4, r0
	strh r4, [r7]
	adds r7, #2
	ldr r3, [sp, #0xc]
	adds r3, #1
	str r3, [sp, #0xc]
_08082596:
	movs r0, #1
	add sl, r0
	mov r1, sl
	cmp r1, #0x9f
	ble _08082508
	add sp, #0x1c
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80824C4

	THUMB_FUNC_START sub_80825B0
sub_80825B0: @ 0x080825B0
	adds r0, #0x64
	movs r1, #0
	strh r1, [r0]
	bx lr

	THUMB_FUNC_END sub_80825B0

	THUMB_FUNC_START sub_80825B8
sub_80825B8: @ 0x080825B8
	push {lr}
	ldr r1, _080825E4  @ gUnknown_0203E754
	ldr r3, [r1, #4]
	movs r1, #0xa0
	lsls r1, r1, #1
	adds r3, r3, r1
	adds r0, #0x64
	ldrh r1, [r0]
	adds r2, r1, #1
	strh r2, [r0]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	adds r0, r3, #0
	movs r2, #0x10
	movs r3, #8
	bl sub_8082228
	bl sub_8082390
	pop {r0}
	bx r0
	.align 2, 0
_080825E4: .4byte gUnknown_0203E754

	THUMB_FUNC_END sub_80825B8

	THUMB_FUNC_START sub_80825E8
sub_80825E8: @ 0x080825E8
	push {r4, r5, lr}
	ldr r0, _08082640  @ gUnknown_0203E754
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
	ldr r0, _08082640  @ gUnknown_0203E754
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
	ldr r0, _08082640  @ gUnknown_0203E754
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
_08082640: .4byte gUnknown_0203E754

	THUMB_FUNC_END sub_80825E8

	THUMB_FUNC_START sub_8082644
sub_8082644: @ 0x08082644
	ldr r2, _08082654  @ gUnknown_0203E754
	lsls r0, r0, #2
	adds r0, r0, r2
	lsls r1, r1, #1
	ldr r0, [r0]
	adds r0, r0, r1
	bx lr
	.align 2, 0
_08082654: .4byte gUnknown_0203E754

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
	bl sub_80823DC
	ldr r0, [sp, #4]
	mov r1, r9
	subs r5, r0, r1
	mov r0, r8
	adds r1, r4, #0
	adds r2, r5, #0
	bl sub_80823DC
	ldr r2, [sp]
	subs r4, r2, r7
	mov r0, r8
	adds r1, r4, #0
	adds r2, r6, #0
	bl sub_80823BC
	mov r0, r8
	adds r1, r4, #0
	adds r2, r5, #0
	bl sub_80823BC
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
	bl sub_80823DC
	ldr r2, [sp, #4]
	subs r5, r2, r7
	mov r0, r8
	adds r1, r4, #0
	adds r2, r5, #0
	bl sub_80823DC
	ldr r0, [sp]
	mov r1, r9
	subs r4, r0, r1
	mov r0, r8
	adds r1, r4, #0
	adds r2, r6, #0
	bl sub_80823BC
	mov r0, r8
	adds r1, r4, #0
	adds r2, r5, #0
	bl sub_80823BC
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
	ldr r4, _08082760  @ gUnknown_0203E754
	ldr r0, [r4, #4]
	bl sub_80823A0
	ldr r0, [r4, #4]
	adds r1, r5, #0
	adds r2, r6, #0
	mov r3, r8
	bl sub_8082658
	bl sub_8082390
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08082760: .4byte gUnknown_0203E754

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
	ldr r0, _08082858  @ gUnknown_0203E754
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
	ldr r0, _08082858  @ gUnknown_0203E754
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
	ldr r0, _08082858  @ gUnknown_0203E754
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
	ldr r0, _08082858  @ gUnknown_0203E754
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
	ldr r0, _08082858  @ gUnknown_0203E754
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
	bl sub_8082390
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08082858: .4byte gUnknown_0203E754

	THUMB_FUNC_END sub_8082764

	THUMB_FUNC_START sub_808285C
sub_808285C: @ 0x0808285C
	push {lr}
	ldr r0, _08082874  @ 0x04000006
	ldrh r0, [r0]
	adds r3, r0, #0
	cmp r3, #0x9e
	bls _08082880
	ldr r0, _08082878  @ gUnknown_0203E75C
	ldr r1, _0808287C  @ gUnknown_0203E754
	ldr r1, [r1]
	str r1, [r0]
	movs r3, #0
	b _08082886
	.align 2, 0
_08082874: .4byte 0x04000006
_08082878: .4byte gUnknown_0203E75C
_0808287C: .4byte gUnknown_0203E754
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
	ldr r0, _080828A4  @ gUnknown_0203E75C
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
_080828A4: .4byte gUnknown_0203E75C

	THUMB_FUNC_END sub_808285C

	THUMB_FUNC_START sub_80828A8
sub_80828A8: @ 0x080828A8
	push {lr}
	ldr r0, _080828C0  @ 0x04000006
	ldrh r0, [r0]
	adds r3, r0, #0
	cmp r3, #0x9e
	bls _080828CC
	ldr r0, _080828C4  @ gUnknown_0203E75C
	ldr r1, _080828C8  @ gUnknown_0203E754
	ldr r1, [r1]
	str r1, [r0]
	movs r3, #0
	b _080828D4
	.align 2, 0
_080828C0: .4byte 0x04000006
_080828C4: .4byte gUnknown_0203E75C
_080828C8: .4byte gUnknown_0203E754
_080828CC:
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	ldr r0, _080828E4  @ gUnknown_0203E75C
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
_080828E4: .4byte gUnknown_0203E75C
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
	ldr r0, _08082918  @ gUnknown_0203E75C
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
_08082918: .4byte gUnknown_0203E75C

	THUMB_FUNC_END sub_80828EC

	THUMB_FUNC_START sub_808291C
sub_808291C: @ 0x0808291C
	push {r4, r5, lr}
	movs r3, #0
	ldr r5, _08082948  @ gUnknown_0203E75C
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
	bl sub_8082390
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08082948: .4byte gUnknown_0203E75C

	THUMB_FUNC_END sub_808291C

	THUMB_FUNC_START sub_808294C
sub_808294C: @ 0x0808294C
	push {lr}
	ldr r0, _08082964  @ 0x04000006
	ldrh r0, [r0]
	adds r1, r0, #0
	cmp r1, #0x9f
	bls _08082970
	ldr r0, _08082968  @ gUnknown_0203E75C
	ldr r1, _0808296C  @ gUnknown_0203E754
	ldr r1, [r1]
	str r1, [r0]
	movs r1, #0
	b _08082976
	.align 2, 0
_08082964: .4byte 0x04000006
_08082968: .4byte gUnknown_0203E75C
_0808296C: .4byte gUnknown_0203E754
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
	ldr r0, _080829A0  @ gUnknown_0203E75C
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
_080829A0: .4byte gUnknown_0203E75C

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
	ldr r0, _08082A40  @ gUnknown_0203E75C
	ldr r1, _08082A44  @ gUnknown_0203E754
	ldr r1, [r1]
	str r1, [r0]
	movs r1, #0
	b _08082A4E
	.align 2, 0
_08082A3C: .4byte 0x04000006
_08082A40: .4byte gUnknown_0203E75C
_08082A44: .4byte gUnknown_0203E754
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
	ldr r0, _08082A78  @ gUnknown_0203E75C
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
_08082A78: .4byte gUnknown_0203E75C

	THUMB_FUNC_END sub_8082A24

	THUMB_FUNC_START sub_8082A7C
sub_8082A7C: @ 0x08082A7C
	push {lr}
	ldr r0, _08082A94  @ 0x04000006
	ldrh r0, [r0]
	adds r1, r0, #0
	cmp r1, #0x9f
	bls _08082AA0
	ldr r0, _08082A98  @ gUnknown_0203E75C
	ldr r1, _08082A9C  @ gUnknown_0203E754
	ldr r1, [r1]
	str r1, [r0]
	movs r1, #0
	b _08082AA6
	.align 2, 0
_08082A94: .4byte 0x04000006
_08082A98: .4byte gUnknown_0203E75C
_08082A9C: .4byte gUnknown_0203E754
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
	ldr r0, _08082AD0  @ gUnknown_0203E75C
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
_08082AD0: .4byte gUnknown_0203E75C

	THUMB_FUNC_END sub_8082A7C

	THUMB_FUNC_START sub_8082AD4
sub_8082AD4: @ 0x08082AD4
	push {lr}
	ldr r0, _08082AEC  @ 0x04000006
	ldrh r0, [r0]
	adds r1, r0, #0
	cmp r1, #0x9f
	bls _08082AF8
	ldr r0, _08082AF0  @ gUnknown_0203E75C
	ldr r1, _08082AF4  @ gUnknown_0203E754
	ldr r1, [r1]
	str r1, [r0]
	movs r1, #0
	b _08082AFE
	.align 2, 0
_08082AEC: .4byte 0x04000006
_08082AF0: .4byte gUnknown_0203E75C
_08082AF4: .4byte gUnknown_0203E754
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
	ldr r0, _08082B28  @ gUnknown_0203E75C
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
_08082B28: .4byte gUnknown_0203E75C

	THUMB_FUNC_END sub_8082AD4

	THUMB_FUNC_START sub_8082B2C
sub_8082B2C: @ 0x08082B2C
	push {lr}
	ldr r0, _08082B44  @ 0x04000006
	ldrh r0, [r0]
	adds r1, r0, #0
	cmp r1, #0x9f
	bls _08082B50
	ldr r0, _08082B48  @ gUnknown_0203E75C
	ldr r1, _08082B4C  @ gUnknown_0203E754
	ldr r1, [r1]
	str r1, [r0]
	movs r1, #0
	b _08082B56
	.align 2, 0
_08082B44: .4byte 0x04000006
_08082B48: .4byte gUnknown_0203E75C
_08082B4C: .4byte gUnknown_0203E754
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
	ldr r0, _08082B80  @ gUnknown_0203E75C
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
_08082B80: .4byte gUnknown_0203E75C

	THUMB_FUNC_END sub_8082B2C

	THUMB_FUNC_START sub_8082B84
sub_8082B84: @ 0x08082B84
	push {r4, lr}
	ldr r0, _08082B9C  @ 0x04000006
	ldrh r0, [r0]
	adds r2, r0, #0
	cmp r2, #0x9f
	bls _08082BA8
	ldr r0, _08082BA0  @ gUnknown_0203E75C
	ldr r1, _08082BA4  @ gUnknown_0203E754
	ldr r1, [r1]
	str r1, [r0]
	movs r2, #0
	b _08082BAE
	.align 2, 0
_08082B9C: .4byte 0x04000006
_08082BA0: .4byte gUnknown_0203E75C
_08082BA4: .4byte gUnknown_0203E754
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
	ldr r0, _08082BE4  @ gUnknown_0203E75C
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
_08082BE4: .4byte gUnknown_0203E75C
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
	ldr r0, _08082C08  @ gUnknown_0203E75C
	ldr r1, _08082C0C  @ gUnknown_0203E754
	ldr r1, [r1]
	str r1, [r0]
	movs r1, #0
	b _08082C16
	.align 2, 0
_08082C04: .4byte 0x04000006
_08082C08: .4byte gUnknown_0203E75C
_08082C0C: .4byte gUnknown_0203E754
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
	ldr r0, _08082C4C  @ gUnknown_0203E75C
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
_08082C4C: .4byte gUnknown_0203E75C

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
	bl sub_80823DC
	ldr r0, [sp, #4]
	mov r1, r8
	subs r5, r0, r1
	adds r0, r7, #0
	adds r1, r4, #0
	adds r2, r5, #0
	bl sub_80823DC
	ldr r2, [sp]
	mov r0, r9
	subs r4, r2, r0
	adds r0, r7, #0
	adds r1, r4, #0
	adds r2, r6, #0
	bl sub_80823BC
	adds r0, r7, #0
	adds r1, r4, #0
	adds r2, r5, #0
	bl sub_80823BC
	ldr r1, [sp]
	ldr r2, [sp, #0xc]
	adds r4, r1, r2
	ldr r6, [sp, #4]
	add r6, sl
	adds r0, r7, #0
	adds r1, r4, #0
	adds r2, r6, #0
	bl sub_80823DC
	ldr r0, [sp, #4]
	mov r1, sl
	subs r5, r0, r1
	adds r0, r7, #0
	adds r1, r4, #0
	adds r2, r5, #0
	bl sub_80823DC
	ldr r2, [sp]
	ldr r0, [sp, #0xc]
	subs r4, r2, r0
	adds r0, r7, #0
	adds r1, r4, #0
	adds r2, r6, #0
	bl sub_80823BC
	adds r0, r7, #0
	adds r1, r4, #0
	adds r2, r5, #0
	bl sub_80823BC
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
	bl sub_80823DC
	ldr r2, [sp, #4]
	ldr r0, [sp, #0xc]
	subs r5, r2, r0
	adds r0, r7, #0
	adds r1, r4, #0
	adds r2, r5, #0
	bl sub_80823DC
	ldr r1, [sp]
	mov r2, sl
	subs r4, r1, r2
	adds r0, r7, #0
	adds r1, r4, #0
	adds r2, r6, #0
	bl sub_80823BC
	adds r0, r7, #0
	adds r1, r4, #0
	adds r2, r5, #0
	bl sub_80823BC
	ldr r4, [sp]
	add r4, r8
	ldr r6, [sp, #4]
	add r6, r9
	adds r0, r7, #0
	adds r1, r4, #0
	adds r2, r6, #0
	bl sub_80823DC
	ldr r0, [sp, #4]
	mov r1, r9
	subs r5, r0, r1
	adds r0, r7, #0
	adds r1, r4, #0
	adds r2, r5, #0
	bl sub_80823DC
	ldr r2, [sp]
	mov r0, r8
	subs r4, r2, r0
	adds r0, r7, #0
	adds r1, r4, #0
	adds r2, r6, #0
	bl sub_80823BC
	adds r0, r7, #0
	adds r1, r4, #0
	adds r2, r5, #0
	bl sub_80823BC
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
	ldr r4, _08082E7C  @ gUnknown_0203E754
	ldr r0, [r4, #4]
	bl sub_80823A0
	ldr r0, [r4, #4]
	str r5, [sp]
	adds r1, r6, #0
	mov r2, r8
	mov r3, r9
	bl sub_8082C50
	bl sub_8082390
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08082E7C: .4byte gUnknown_0203E754

	THUMB_FUNC_END sub_8082E40

.align 2, 0
