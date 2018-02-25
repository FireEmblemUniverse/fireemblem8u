	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

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
