	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	THUMB_FUNC_START sub_8005D64
sub_8005D64: @ 0x08005D64
	movs r2, #0
	str r2, [r0, #0x2c]
	movs r1, #0x78
	str r1, [r0, #0x38]
	strh r2, [r0, #0x32]
	bx lr

	THUMB_FUNC_END sub_8005D64

	THUMB_FUNC_START sub_8005D70
sub_8005D70: @ 0x08005D70
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x38]
	subs r0, #1
	str r0, [r4, #0x38]
	cmp r0, #0
	bge _08005D90
	adds r0, r4, #0
	bl sub_8006470
	str r0, [r4, #0x38]
	movs r0, #0
	strh r0, [r4, #0x34]
	adds r0, r4, #0
	bl Proc_Break
_08005D90:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8005D70

	THUMB_FUNC_START sub_8005D98
sub_8005D98: @ 0x08005D98
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r0, #0x42
	ldrh r1, [r0]
	lsls r1, r1, #0xc
	subs r0, #2
	ldrh r2, [r0]
	ldr r0, _08005DCC  @ 0x000003FF
	ands r0, r2
	adds r7, r1, r0
	adds r0, r4, #0
	adds r0, #0x44
	ldrh r0, [r0]
	bl GetPortraitStructPointer
	adds r5, r0, #0
	movs r6, #0
	movs r1, #0x34
	ldrsh r0, [r4, r1]
	cmp r0, #9
	bhi _08005E38
	lsls r0, r0, #2
	ldr r1, _08005DD0  @ _08005DD4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08005DCC: .4byte 0x000003FF
_08005DD0: .4byte _08005DD4
_08005DD4: @ jump table
	.4byte _08005E00 @ case 0
	.4byte _08005E8A @ case 1
	.4byte _08005E8A @ case 2
	.4byte _08005DFC @ case 3
	.4byte _08005E8A @ case 4
	.4byte _08005E8A @ case 5
	.4byte _08005E00 @ case 6
	.4byte _08005E8A @ case 7
	.4byte _08005E8A @ case 8
	.4byte _08005E04 @ case 9
_08005DFC:
	movs r6, #0x58
	b _08005E38
_08005E00:
	movs r6, #0x18
	b _08005E38
_08005E04:
	ldr r0, [r4, #0x3c]
	adds r1, r4, #0
	adds r1, #0x42
	ldrh r1, [r1]
	lsls r1, r1, #0xc
	adds r2, r4, #0
	adds r2, #0x40
	ldrh r3, [r2]
	ldr r2, _08005E34  @ 0x000003FF
	ands r2, r3
	adds r1, r1, r2
	adds r2, r5, #0
	bl sub_8005B78
	ldr r0, [r4, #0x3c]
	bl GetBackgroundFromBufferPointer
	bl BG_EnableSync
	adds r0, r4, #0
	bl Proc_Break
	b _08005E90
	.align 2, 0
_08005E34: .4byte 0x000003FF
_08005E38:
	adds r0, r4, #0
	adds r0, #0x44
	ldrh r0, [r0]
	bl GetPortraitStructPointer
	adds r5, r0, #0
	ldrb r0, [r5, #0x17]
	lsls r0, r0, #6
	ldr r1, [r4, #0x3c]
	adds r1, r1, r0
	ldrb r0, [r5, #0x16]
	lsls r0, r0, #1
	adds r1, r1, r0
	mov ip, r1
	mov r0, ip
	subs r0, #2
	adds r2, r7, r6
	strh r2, [r0]
	adds r1, r2, #1
	strh r1, [r0, #2]
	adds r1, r2, #2
	strh r1, [r0, #4]
	adds r1, r2, #3
	strh r1, [r0, #6]
	adds r1, #0x1d
	mov r3, ip
	strh r1, [r3, #0x3e]
	adds r3, #0x40
	adds r1, #1
	strh r1, [r3]
	adds r3, #2
	adds r1, #1
	strh r1, [r3]
	mov r1, ip
	adds r1, #0x44
	adds r2, #0x23
	strh r2, [r1]
	bl GetBackgroundFromBufferPointer
	bl BG_EnableSync
_08005E8A:
	ldrh r0, [r4, #0x34]
	adds r0, #1
	strh r0, [r4, #0x34]
_08005E90:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8005D98

	THUMB_FUNC_START sub_8005E98
sub_8005E98: @ 0x08005E98
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r4, r1, #0
	mov r8, r2
	adds r5, r3, #0
	ldr r6, [sp, #0x14]
	ldr r0, _08005EC8  @ gUnknown_08591204
	bl Proc_EndEach
	adds r0, r4, #0
	mov r1, r8
	adds r2, r5, #0
	adds r3, r6, #0
	bl sub_8005CA4
	mov r0, r8
	bl GetPortraitStructPointer
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08005EC8: .4byte gUnknown_08591204

	THUMB_FUNC_END sub_8005E98

	THUMB_FUNC_START sub_8005ECC
sub_8005ECC: @ 0x08005ECC
	push {lr}
	ldr r0, [r0, #0x54]
	bl DeleteE_FACEByPointer
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8005ECC

	THUMB_FUNC_START sub_8005ED8
sub_8005ED8: @ 0x08005ED8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08005EEC  @ gUnknown_08591234
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x54]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08005EEC: .4byte gUnknown_08591234

	THUMB_FUNC_END sub_8005ED8

	THUMB_FUNC_START sub_8005EF0
sub_8005EF0: @ 0x08005EF0
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r4, r0, #0
	ldrh r0, [r4, #0x3e]
	bl GetPortraitStructPointer
	mov r8, r0
	ldr r6, _08005F34  @ gUnknown_0202A68C
	adds r5, r4, #0
	adds r5, #0x40
	ldrb r0, [r5]
	lsls r0, r0, #3
	adds r0, r0, r6
	ldrh r0, [r0, #4]
	adds r0, #0x10
	bl sub_8013A84
	mov r1, r8
	ldr r0, [r1, #8]
	ldrb r1, [r5]
	lsls r1, r1, #3
	adds r1, r1, r6
	ldrh r1, [r1, #4]
	adds r1, #0x10
	movs r2, #0xc
	adds r3, r4, #0
	bl sub_8013928
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08005F34: .4byte gUnknown_0202A68C

	THUMB_FUNC_END sub_8005EF0

	THUMB_FUNC_START sub_8005F38
sub_8005F38: @ 0x08005F38
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x3e]
	bl GetPortraitStructPointer
	ldr r1, _08005F68  @ gUnknown_0202A68C
	adds r0, r4, #0
	adds r0, #0x40
	ldrb r0, [r0]
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r0, [r0, #4]
	adds r0, #0x10
	movs r1, #0xc
	adds r2, r4, #0
	bl sub_80138F0
	adds r0, r4, #0
	bl sub_8005ED8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08005F68: .4byte gUnknown_0202A68C

	THUMB_FUNC_END sub_8005F38

	THUMB_FUNC_START sub_8005F6C
sub_8005F6C: @ 0x08005F6C
	push {r4, r5, lr}
	sub sp, #0x20
	mov r2, sp
	ldr r1, _08005F94  @ gUnknown_080D77BC
	ldm r1!, {r3, r4, r5}
	stm r2!, {r3, r4, r5}
	ldm r1!, {r3, r4, r5}
	stm r2!, {r3, r4, r5}
	ldm r1!, {r3, r4}
	stm r2!, {r3, r4}
	ldr r5, _08005F98  @ 0xFFFF8100
	adds r0, r0, r5
	lsls r0, r0, #2
	add r0, sp
	ldr r0, [r0]
	add sp, #0x20
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08005F94: .4byte gUnknown_080D77BC
_08005F98: .4byte 0xFFFF8100

	THUMB_FUNC_END sub_8005F6C

	THUMB_FUNC_START sub_8005F9C
sub_8005F9C: @ 0x08005F9C
	push {r4, r5, r6, lr}
	sub sp, #0x20
	mov r3, sp
	ldr r2, _08005FCC  @ gUnknown_080D77DC
	ldm r2!, {r4, r5, r6}
	stm r3!, {r4, r5, r6}
	ldm r2!, {r4, r5, r6}
	stm r3!, {r4, r5, r6}
	ldm r2!, {r4, r5}
	stm r3!, {r4, r5}
	ldr r6, _08005FD0  @ 0xFFFF8100
	adds r0, r0, r6
	lsls r0, r0, #2
	add r0, sp
	ldr r0, [r0]
	lsls r1, r1, #5
	movs r2, #0x20
	bl CopyToPaletteBuffer
	add sp, #0x20
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08005FCC: .4byte gUnknown_080D77DC
_08005FD0: .4byte 0xFFFF8100

	THUMB_FUNC_END sub_8005F9C

	THUMB_FUNC_START sub_8005FD4
sub_8005FD4: @ 0x08005FD4
	ldr r1, [r0, #0x14]
	str r1, [r0, #0x2c]
	movs r1, #0
	strh r1, [r0, #0x32]
	bx lr

	THUMB_FUNC_END sub_8005FD4

	THUMB_FUNC_START sub_8005FE0
sub_8005FE0: @ 0x08005FE0
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, [r4, #0x2c]
	bl sub_80057A4
	movs r1, #0x30
	ands r1, r0
	cmp r1, #0
	bne _08006034
	ldr r0, [r4, #0x2c]
	bl sub_80057A4
	movs r1, #8
	ands r1, r0
	movs r3, #0
	cmp r1, #0
	bne _08006006
	movs r3, #0x18
_08006006:
	adds r3, #0x10
	ldr r2, [r4, #0x2c]
	ldr r0, [r2, #0x2c]
	lsls r1, r3, #5
	ldr r0, [r0, #0xc]
	adds r0, r0, r1
	ldrh r1, [r2, #0x3c]
	adds r1, #0x1c
	ldr r2, _0800602C  @ 0x000003FF
	ands r1, r2
	lsls r1, r1, #5
	ldr r2, _08006030  @ 0x06010000
	adds r1, r1, r2
	movs r2, #4
	movs r3, #2
	bl RegisterObjectTileGraphics
	b _080060A4
	.align 2, 0
_0800602C: .4byte 0x000003FF
_08006030: .4byte 0x06010000
_08006034:
	ldrh r0, [r4, #0x32]
	subs r0, #1
	strh r0, [r4, #0x32]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _080060A4
	ldr r0, [r4, #0x2c]
	bl sub_80057A4
	movs r1, #8
	ands r1, r0
	movs r5, #0
	cmp r1, #0
	bne _08006052
	movs r5, #0x18
_08006052:
	bl AdvanceGetLCGRNValue
	lsrs r0, r0, #0x10
	movs r1, #7
	ands r0, r1
	adds r0, #1
	strh r0, [r4, #0x32]
	ldrh r0, [r4, #0x30]
	adds r0, #1
	movs r1, #3
	ands r0, r1
	strh r0, [r4, #0x30]
	movs r1, #0x30
	ldrsh r0, [r4, r1]
	cmp r0, #1
	beq _0800607E
	cmp r0, #1
	ble _08006084
	cmp r0, #2
	beq _08006082
	cmp r0, #3
	bne _08006084
_0800607E:
	adds r5, #8
	b _08006084
_08006082:
	adds r5, #0x10
_08006084:
	ldr r2, [r4, #0x2c]
	ldr r0, [r2, #0x2c]
	lsls r1, r5, #5
	ldr r0, [r0, #0xc]
	adds r0, r0, r1
	ldrh r1, [r2, #0x3c]
	adds r1, #0x1c
	ldr r2, _08006124  @ 0x000003FF
	ands r1, r2
	lsls r1, r1, #5
	ldr r2, _08006128  @ 0x06010000
	adds r1, r1, r2
	movs r2, #4
	movs r3, #2
	bl RegisterObjectTileGraphics
_080060A4:
	ldr r0, [r4, #0x2c]
	ldr r1, [r0, #0x2c]
	ldrb r2, [r1, #0x14]
	movs r1, #4
	subs r5, r1, r2
	bl sub_80057A4
	movs r6, #1
	ands r0, r6
	cmp r0, #0
	bne _080060BC
	negs r5, r5
_080060BC:
	lsls r1, r5, #3
	ldr r0, [r4, #0x2c]
	movs r3, #0x34
	ldrsh r2, [r0, r3]
	adds r1, r1, r2
	adds r5, r1, #0
	subs r5, #0x10
	ldr r1, _0800612C  @ 0x000001FF
	ands r5, r1
	bl sub_80057A4
	ands r0, r6
	cmp r0, #0
	beq _080060DE
	movs r0, #0x80
	lsls r0, r0, #5
	adds r5, r5, r0
_080060DE:
	ldr r0, [r4, #0x2c]
	bl sub_80057A4
	adds r2, r0, #0
	movs r0, #0x80
	lsls r0, r0, #3
	ands r2, r0
	negs r2, r2
	asrs r2, r2, #0x1f
	ands r2, r0
	ldr r4, [r4, #0x2c]
	movs r0, #0x36
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #0x2c]
	ldrb r0, [r0, #0x15]
	lsls r0, r0, #3
	adds r1, r1, r0
	movs r0, #0xff
	ands r1, r0
	adds r2, r2, r1
	adds r0, r4, #0
	adds r0, #0x41
	ldrb r0, [r0]
	ldr r3, _08006130  @ gObject_32x16
	ldrh r1, [r4, #0x3c]
	adds r1, #0x1c
	str r1, [sp]
	adds r1, r5, #0
	bl PutSpriteExt
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08006124: .4byte 0x000003FF
_08006128: .4byte 0x06010000
_0800612C: .4byte 0x000001FF
_08006130: .4byte gObject_32x16

	THUMB_FUNC_END sub_8005FE0

	THUMB_FUNC_START sub_8006134
sub_8006134: @ 0x08006134
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r7, r0, #0
	adds r5, r1, #0
	movs r0, #0
	mov r9, r0
	cmp r5, #1
	beq _08006162
	cmp r5, #1
	bgt _08006154
	cmp r5, #0
	beq _0800615E
	b _0800622A
_08006154:
	cmp r5, #0x80
	beq _08006166
	cmp r5, #0x81
	beq _0800616E
	b _0800622A
_0800615E:
	movs r5, #0x58
	b _08006174
_08006162:
	movs r5, #0x18
	b _08006174
_08006166:
	movs r5, #0x58
	movs r1, #1
	mov r9, r1
	b _08006174
_0800616E:
	movs r5, #0x18
	movs r3, #1
	mov r9, r3
_08006174:
	ldr r0, [r7, #0x2c]
	ldr r1, [r0, #0x2c]
	ldrb r2, [r1, #0x16]
	movs r1, #4
	subs r4, r1, r2
	bl sub_80057A4
	movs r1, #1
	mov r8, r1
	ands r0, r1
	cmp r0, #0
	bne _0800618E
	negs r4, r4
_0800618E:
	lsls r1, r4, #3
	ldr r0, [r7, #0x2c]
	movs r3, #0x34
	ldrsh r2, [r0, r3]
	adds r1, r1, r2
	adds r4, r1, #0
	subs r4, #0x10
	ldr r1, _0800620C  @ 0x000001FF
	ands r4, r1
	bl sub_80057A4
	mov r1, r8
	ands r0, r1
	cmp r0, #0
	beq _080061B2
	movs r0, #0x80
	lsls r0, r0, #5
	adds r4, r4, r0
_080061B2:
	ldr r0, [r7, #0x2c]
	bl sub_80057A4
	movs r1, #0x80
	lsls r1, r1, #3
	ands r0, r1
	negs r0, r0
	asrs r6, r0, #0x1f
	ands r6, r1
	ldr r2, [r7, #0x2c]
	movs r3, #0x36
	ldrsh r1, [r2, r3]
	ldr r0, [r2, #0x2c]
	ldrb r0, [r0, #0x17]
	lsls r0, r0, #3
	adds r1, r1, r0
	movs r0, #0xff
	ands r1, r0
	adds r6, r6, r1
	mov r0, r9
	cmp r0, #0
	beq _08006214
	adds r0, r2, #0
	bl sub_80057A4
	mov r1, r8
	ands r0, r1
	cmp r0, #0
	bne _080061EE
	adds r4, #0x10
_080061EE:
	ldr r1, [r7, #0x2c]
	adds r0, r1, #0
	adds r0, #0x41
	ldrb r0, [r0]
	ldr r3, _08006210  @ gObject_16x16
	ldrh r1, [r1, #0x3c]
	adds r1, r1, r5
	adds r1, #2
	str r1, [sp]
	adds r1, r4, #0
	adds r2, r6, #0
	bl PutSpriteExt
	b _0800622A
	.align 2, 0
_0800620C: .4byte 0x000001FF
_08006210: .4byte gObject_16x16
_08006214:
	adds r0, r2, #0
	adds r0, #0x41
	ldrb r0, [r0]
	ldr r3, _08006238  @ gObject_32x16
	ldrh r1, [r2, #0x3c]
	adds r1, r1, r5
	str r1, [sp]
	adds r1, r4, #0
	adds r2, r6, #0
	bl PutSpriteExt
_0800622A:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08006238: .4byte gObject_32x16

	THUMB_FUNC_END sub_8006134

	THUMB_FUNC_START sub_800623C
sub_800623C: @ 0x0800623C
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x14]
	str r0, [r5, #0x2c]
	ldr r0, [r0, #0x2c]
	ldrb r0, [r0, #0x18]
	movs r4, #0
	strh r0, [r5, #0x30]
	adds r0, r5, #0
	bl sub_8006470
	str r0, [r5, #0x38]
	strh r4, [r5, #0x32]
	movs r0, #0x30
	ldrsh r1, [r5, r0]
	cmp r1, #6
	bne _08006274
	movs r0, #5
	strh r0, [r5, #0x30]
	ldr r0, _0800627C  @ 0x7FFFFFFF
	str r0, [r5, #0x38]
	movs r0, #2
	strh r0, [r5, #0x32]
	strh r1, [r5, #0x34]
	adds r0, r5, #0
	movs r1, #0x61
	bl Proc_Goto
_08006274:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0800627C: .4byte 0x7FFFFFFF

	THUMB_FUNC_END sub_800623C

	THUMB_FUNC_START sub_8006280
sub_8006280: @ 0x08006280
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x38]
	subs r0, #1
	str r0, [r4, #0x38]
	movs r1, #0x32
	ldrsh r5, [r4, r1]
	cmp r5, #0
	beq _0800629C
	adds r1, r5, #0
	adds r0, r4, #0
	bl Proc_Goto
	b _080062B2
_0800629C:
	cmp r0, #0
	bge _080062B2
	adds r0, r4, #0
	bl sub_8006470
	str r0, [r4, #0x38]
	strh r5, [r4, #0x34]
	adds r0, r4, #0
	movs r1, #1
	bl Proc_Goto
_080062B2:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8006280

	THUMB_FUNC_START sub_80062B8
sub_80062B8: @ 0x080062B8
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r5, #2
	movs r1, #0x34
	ldrsh r0, [r4, r1]
	cmp r0, #0xa
	bhi _08006310
	lsls r0, r0, #2
	ldr r1, _080062D0  @ _080062D4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080062D0: .4byte _080062D4
_080062D4: @ jump table
	.4byte _08006304 @ case 0
	.4byte _08006304 @ case 1
	.4byte _08006304 @ case 2
	.4byte _08006300 @ case 3
	.4byte _08006300 @ case 4
	.4byte _08006300 @ case 5
	.4byte _08006304 @ case 6
	.4byte _08006304 @ case 7
	.4byte _08006304 @ case 8
	.4byte _08006310 @ case 9
	.4byte _08006308 @ case 10
_08006300:
	movs r5, #0
	b _08006310
_08006304:
	movs r5, #1
	b _08006310
_08006308:
	adds r0, r4, #0
	movs r1, #0
	bl Proc_Goto
_08006310:
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_8006134
	ldrh r0, [r4, #0x34]
	adds r0, #1
	strh r0, [r4, #0x34]
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80062B8

	THUMB_FUNC_START sub_8006324
sub_8006324: @ 0x08006324
	movs r1, #0
	strh r1, [r0, #0x34]
	bx lr

	THUMB_FUNC_END sub_8006324

	THUMB_FUNC_START sub_800632C
sub_800632C: @ 0x0800632C
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0x34
	ldrsh r0, [r4, r1]
	cmp r0, #5
	bgt _08006340
	adds r0, r4, #0
	bl sub_80062B8
	b _08006368
_08006340:
	adds r0, r4, #0
	movs r1, #0
	bl sub_8006134
	movs r1, #0x32
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _08006358
	adds r0, r4, #0
	movs r1, #1
	bl Proc_Goto
_08006358:
	movs r1, #0x32
	ldrsh r0, [r4, r1]
	cmp r0, #3
	bne _08006368
	adds r0, r4, #0
	movs r1, #3
	bl Proc_Goto
_08006368:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_800632C

	THUMB_FUNC_START sub_8006370
sub_8006370: @ 0x08006370
	movs r1, #0
	strh r1, [r0, #0x34]
	bx lr

	THUMB_FUNC_END sub_8006370

	THUMB_FUNC_START sub_8006378
sub_8006378: @ 0x08006378
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0x34
	ldrsh r0, [r4, r1]
	cmp r0, #2
	bgt _0800638C
	adds r0, r4, #0
	bl sub_80062B8
	b _080063B4
_0800638C:
	adds r0, r4, #0
	movs r1, #1
	bl sub_8006134
	movs r1, #0x32
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _080063A4
	adds r0, r4, #0
	movs r1, #1
	bl Proc_Goto
_080063A4:
	movs r1, #0x32
	ldrsh r0, [r4, r1]
	cmp r0, #2
	bne _080063B4
	adds r0, r4, #0
	movs r1, #2
	bl Proc_Goto
_080063B4:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8006378

	THUMB_FUNC_START sub_80063BC
sub_80063BC: @ 0x080063BC
	movs r1, #0
	strh r1, [r0, #0x34]
	bx lr

	THUMB_FUNC_END sub_80063BC

	THUMB_FUNC_START sub_80063C4
sub_80063C4: @ 0x080063C4
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r5, #2
	movs r1, #0x34
	ldrsh r0, [r4, r1]
	cmp r0, #0xa
	bhi _08006420
	lsls r0, r0, #2
	ldr r1, _080063DC  @ _080063E0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080063DC: .4byte _080063E0
_080063E0: @ jump table
	.4byte _08006410 @ case 0
	.4byte _08006410 @ case 1
	.4byte _08006410 @ case 2
	.4byte _0800640C @ case 3
	.4byte _0800640C @ case 4
	.4byte _0800640C @ case 5
	.4byte _08006410 @ case 6
	.4byte _08006410 @ case 7
	.4byte _08006410 @ case 8
	.4byte _08006420 @ case 9
	.4byte _08006414 @ case 10
_0800640C:
	movs r5, #0
	b _08006420
_08006410:
	movs r5, #1
	b _08006420
_08006414:
	adds r0, r4, #0
	movs r1, #0
	bl Proc_Goto
	movs r0, #0
	strh r0, [r4, #0x32]
_08006420:
	adds r1, r5, #0
	adds r1, #0x80
	adds r0, r4, #0
	bl sub_8006134
	ldrh r0, [r4, #0x34]
	adds r0, #1
	strh r0, [r4, #0x34]
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80063C4

	THUMB_FUNC_START sub_8006438
sub_8006438: @ 0x08006438
	push {r4, lr}
	adds r2, r0, #0
	cmp r1, #0
	bne _08006444
	ldr r0, [r2, #0x2c]
	ldrb r1, [r0, #0x18]
_08006444:
	ldr r4, [r2, #0x48]
	strh r1, [r4, #0x30]
	adds r0, r4, #0
	bl sub_8006470
	str r0, [r4, #0x38]
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8006438

	THUMB_FUNC_START sub_8006458
sub_8006458: @ 0x08006458
	push {lr}
	ldr r2, _0800646C  @ gUnknown_03004980
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r0, [r0]
	bl sub_8006438
	pop {r0}
	bx r0
	.align 2, 0
_0800646C: .4byte gUnknown_03004980

	THUMB_FUNC_END sub_8006458

	THUMB_FUNC_START sub_8006470
sub_8006470: @ 0x08006470
	push {r4, lr}
	adds r4, r0, #0
	bl AdvanceGetLCGRNValue
	adds r1, r0, #0
	lsrs r2, r1, #0x10
	ldrh r1, [r4, #0x30]
	subs r1, #1
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	cmp r1, #4
	bhi _080064C8
	lsls r0, r1, #2
	ldr r1, _08006494  @ _08006498
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08006494: .4byte _08006498
_08006498: @ jump table
	.4byte _080064B6 @ case 0
	.4byte _080064BC @ case 1
	.4byte _080064AC @ case 2
	.4byte _080064C2 @ case 3
	.4byte _080064C6 @ case 4
_080064AC:
	asrs r0, r2, #7
	movs r1, #0x96
	lsls r1, r1, #1
	adds r0, r0, r1
	b _080064C8
_080064B6:
	asrs r0, r2, #7
	adds r0, #0x1e
	b _080064C8
_080064BC:
	asrs r0, r2, #9
	adds r0, #0x1e
	b _080064C8
_080064C2:
	movs r0, #1
	b _080064C8
_080064C6:
	ldr r0, _080064D0  @ 0x7FFFFFFF
_080064C8:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080064D0: .4byte 0x7FFFFFFF

	THUMB_FUNC_END sub_8006470

	THUMB_FUNC_START sub_80064D4
sub_80064D4: @ 0x080064D4
	ldr r0, [r0, #0x48]
	strh r1, [r0, #0x32]
	bx lr

	THUMB_FUNC_END sub_80064D4

	THUMB_FUNC_START sub_80064DC
sub_80064DC: @ 0x080064DC
	push {lr}
	ldr r2, _080064F0  @ gUnknown_03004980
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r0, [r0]
	bl sub_80064D4
	pop {r0}
	bx r0
	.align 2, 0
_080064F0: .4byte gUnknown_03004980

	THUMB_FUNC_END sub_80064DC

	THUMB_FUNC_START sub_80064F4
sub_80064F4: @ 0x080064F4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r7, r0, #0
	mov r9, r1
	mov sl, r2
	str r3, [sp, #4]
	ldr r1, _08006518  @ gUnknown_03004980
	lsls r0, r7, #2
	adds r4, r0, r1
	ldr r6, [r4]
	cmp r6, #0
	beq _0800651C
	movs r0, #0
	b _08006602
	.align 2, 0
_08006518: .4byte gUnknown_03004980
_0800651C:
	ldr r0, _0800655C  @ gUnknown_0859118C
	movs r1, #5
	bl Proc_Start
	adds r5, r0, #0
	str r5, [r4]
	mov r0, r9
	bl GetPortraitStructPointer
	mov r8, r0
	movs r0, #0x80
	lsls r0, r0, #6
	ldr r1, [sp, #0x28]
	ands r0, r1
	cmp r0, #0
	beq _0800656C
	str r6, [sp]
	ldr r0, _08006560  @ gUnknown_0202A68C
	lsls r4, r7, #3
	adds r0, r4, r0
	ldrh r1, [r0, #4]
	lsls r1, r1, #5
	ldr r0, _08006564  @ gUnknown_02022AA8
	adds r1, r1, r0
	ldr r2, _08006568  @ 0x01000008
	mov r0, sp
	bl CpuFastSet
	bl EnablePaletteSync
	b _08006582
	.align 2, 0
_0800655C: .4byte gUnknown_0859118C
_08006560: .4byte gUnknown_0202A68C
_08006564: .4byte gUnknown_02022AA8
_08006568: .4byte 0x01000008
_0800656C:
	mov r2, r8
	ldr r0, [r2, #8]
	ldr r1, _080065C8  @ gUnknown_0202A68C
	lsls r4, r7, #3
	adds r1, r4, r1
	ldrh r1, [r1, #4]
	adds r1, #0x10
	lsls r1, r1, #5
	movs r2, #0x20
	bl CopyToPaletteBuffer
_08006582:
	mov r0, r8
	str r0, [r5, #0x2c]
	adds r0, r5, #0
	adds r0, #0x40
	movs r1, #0
	strb r7, [r0]
	mov r2, r9
	strh r2, [r5, #0x3e]
	adds r2, r5, #0
	adds r2, #0x41
	movs r0, #5
	strb r0, [r2]
	mov r0, sl
	strh r0, [r5, #0x34]
	mov r2, sp
	ldrh r2, [r2, #4]
	strh r2, [r5, #0x36]
	str r1, [r5, #0x44]
	str r1, [r5, #0x48]
	ldr r0, [sp, #0x28]
	str r0, [r5, #0x30]
	adds r0, r5, #0
	bl sub_80057C0
	movs r1, #0xf0
	lsls r1, r1, #2
	ldr r2, [sp, #0x28]
	ands r1, r2
	cmp r1, #0x80
	beq _080065DA
	cmp r1, #0x80
	bgt _080065CC
	cmp r1, #0x40
	beq _080065D6
	b _080065E6
	.align 2, 0
_080065C8: .4byte gUnknown_0202A68C
_080065CC:
	movs r0, #0x80
	lsls r0, r0, #2
	cmp r1, r0
	beq _080065E0
	b _080065E6
_080065D6:
	movs r3, #0
	b _080065EA
_080065DA:
	movs r3, #0x80
	lsls r3, r3, #3
	b _080065EA
_080065E0:
	movs r3, #0xc0
	lsls r3, r3, #4
	b _080065EA
_080065E6:
	movs r3, #0x80
	lsls r3, r3, #4
_080065EA:
	ldr r0, _08006614  @ gUnknown_0202A68C
	adds r0, r4, r0
	ldr r1, [r0]
	lsrs r1, r1, #5
	ldrh r2, [r0, #4]
	movs r0, #0xf
	ands r0, r2
	lsls r0, r0, #0xc
	adds r1, r1, r0
	adds r1, r1, r3
	strh r1, [r5, #0x3c]
	adds r0, r5, #0
_08006602:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08006614: .4byte gUnknown_0202A68C

	THUMB_FUNC_END sub_80064F4

	THUMB_FUNC_START sub_8006618
sub_8006618: @ 0x08006618
	ldr r3, _08006628  @ gUnknown_03004980
	lsls r0, r0, #2
	adds r0, r0, r3
	ldr r3, [r0]
	strh r1, [r3, #0x34]
	ldr r0, [r0]
	strh r2, [r0, #0x36]
	bx lr
	.align 2, 0
_08006628: .4byte gUnknown_03004980

	THUMB_FUNC_END sub_8006618

	THUMB_FUNC_START sub_800662C
sub_800662C: @ 0x0800662C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x2c]
	ldr r0, [r0, #0x48]
	cmp r0, #0
	beq _0800663C
	bl sub_8097D54
_0800663C:
	ldr r0, [r4, #0x2c]
	ldr r0, [r0, #0x44]
	cmp r0, #0
	beq _08006648
	bl sub_8097D54
_08006648:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_800662C

	THUMB_FUNC_START sub_8006650
sub_8006650: @ 0x08006650
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x34]
	bl GetPortraitStructPointer
	str r0, [r4, #0x30]
	ldr r0, [r0]
	ldr r5, _080066A0  @ gUnknown_0202A68C
	ldr r1, [r4, #0x2c]
	adds r1, #0x40
	ldrb r1, [r1]
	lsls r1, r1, #3
	adds r1, r1, r5
	ldr r1, [r1]
	ldr r2, _080066A4  @ 0x06010000
	adds r1, r1, r2
	bl CopyDataWithPossibleUncomp
	ldr r0, [r4, #0x30]
	ldr r0, [r0, #8]
	ldr r1, [r4, #0x2c]
	adds r1, #0x40
	ldrb r1, [r1]
	lsls r1, r1, #3
	adds r1, r1, r5
	ldrh r1, [r1, #4]
	adds r1, #0x10
	lsls r1, r1, #5
	movs r2, #0x20
	bl CopyToPaletteBuffer
	ldr r1, [r4, #0x2c]
	ldr r0, [r4, #0x30]
	str r0, [r1, #0x2c]
	ldr r0, [r4, #0x34]
	strh r0, [r1, #0x3e]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080066A0: .4byte gUnknown_0202A68C
_080066A4: .4byte 0x06010000

	THUMB_FUNC_END sub_8006650

	THUMB_FUNC_START sub_80066A8
sub_80066A8: @ 0x080066A8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x2c]
	ldr r1, [r0, #0x48]
	cmp r1, #0
	beq _080066CC
	ldr r0, [r4, #0x30]
	ldrb r0, [r0, #0x18]
	strh r0, [r1, #0x30]
	ldr r0, [r4, #0x2c]
	ldr r0, [r0, #0x48]
	movs r1, #0
	bl Proc_Goto
	ldr r0, [r4, #0x2c]
	ldr r0, [r0, #0x48]
	bl sub_8097D68
_080066CC:
	ldr r0, [r4, #0x2c]
	ldr r0, [r0, #0x44]
	cmp r0, #0
	beq _080066D8
	bl sub_8097D68
_080066D8:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80066A8

	THUMB_FUNC_START sub_80066E0
sub_80066E0: @ 0x080066E0
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _080066F8  @ gUnknown_08591304
	adds r1, r4, #0
	bl Proc_Start
	str r4, [r0, #0x2c]
	str r5, [r0, #0x34]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080066F8: .4byte gUnknown_08591304

	THUMB_FUNC_END sub_80066E0

	THUMB_FUNC_START sub_80066FC
sub_80066FC: @ 0x080066FC
	push {r4, lr}
	adds r4, r0, #0
	adds r0, r1, #0
	bl GetPortraitStructPointer
	ldr r0, [r0]
	lsls r4, r4, #5
	movs r1, #0xc0
	lsls r1, r1, #0x13
	adds r4, r4, r1
	adds r1, r4, #0
	bl CopyDataWithPossibleUncomp
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80066FC

	THUMB_FUNC_START sub_800671C
sub_800671C: @ 0x0800671C
	push {r4, lr}
	adds r4, r0, #0
	adds r0, r1, #0
	bl GetPortraitStructPointer
	ldr r0, [r0, #8]
	lsls r4, r4, #5
	adds r1, r4, #0
	movs r2, #0x20
	bl CopyToPaletteBuffer
	pop {r4}
	pop {r0}
	bx r0
	
	THUMB_FUNC_END sub_800671C
