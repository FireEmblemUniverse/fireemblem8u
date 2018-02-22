	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	THUMB_FUNC_START SetInterrupt_LCDVBlank
SetInterrupt_LCDVBlank: @ 0x08001258
	push {lr}
	adds r3, r0, #0
	cmp r3, #0
	beq _08001284
	ldr r2, _0800127C  @ 0x03003080
	ldrb r0, [r2, #4]
	movs r1, #8
	orrs r0, r1
	strb r0, [r2, #4]
	movs r0, #0
	adds r1, r3, #0
	bl SetIRQHandler
	ldr r2, _08001280  @ 0x04000200
	ldrh r0, [r2]
	movs r1, #1
	orrs r0, r1
	b _08001298
	.align 2, 0
_0800127C: .4byte 0x03003080
_08001280: .4byte 0x04000200
_08001284:
	ldr r2, _080012A0  @ 0x03003080
	ldrb r1, [r2, #4]
	movs r0, #9
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r2, #4]
	ldr r2, _080012A4  @ 0x04000200
	ldrh r1, [r2]
	ldr r0, _080012A8  @ 0x0000FFFE
	ands r0, r1
_08001298:
	strh r0, [r2]
	pop {r0}
	bx r0
	.align 2, 0
_080012A0: .4byte 0x03003080
_080012A4: .4byte 0x04000200
_080012A8: .4byte 0x0000FFFE

	THUMB_FUNC_START SetInterrupt_LCDVCountMatch
SetInterrupt_LCDVCountMatch: @ 0x080012AC
	push {r4, lr}
	adds r4, r0, #0
	cmp r4, #0
	beq _080012DC
	ldr r2, _080012D4  @ 0x03003080
	ldrb r0, [r2, #4]
	movs r1, #0x20
	orrs r0, r1
	strb r0, [r2, #4]
	movs r0, #2
	adds r1, r4, #0
	bl SetIRQHandler
	ldr r2, _080012D8  @ 0x04000200
	ldrh r0, [r2]
	movs r1, #4
	orrs r0, r1
	strh r0, [r2]
	b _080012F4
	.align 2, 0
_080012D4: .4byte 0x03003080
_080012D8: .4byte 0x04000200
_080012DC:
	ldr r2, _080012FC  @ 0x03003080
	ldrb r1, [r2, #4]
	movs r0, #0x21
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r2, #4]
	ldr r3, _08001300  @ 0x04000200
	ldrh r1, [r3]
	ldr r0, _08001304  @ 0x0000FFFB
	ands r0, r1
	strh r0, [r3]
	strb r4, [r2, #5]
_080012F4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080012FC: .4byte 0x03003080
_08001300: .4byte 0x04000200
_08001304: .4byte 0x0000FFFB

	THUMB_FUNC_START sub_8001308
sub_8001308: @ 0x08001308
	ldr r2, _08001318  @ 0x04000004
	ldrb r1, [r2]
	lsls r0, r0, #8
	orrs r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	strh r1, [r2]
	bx lr
	.align 2, 0
_08001318: .4byte 0x04000004

	THUMB_FUNC_START SetLCDVCountSetting
SetLCDVCountSetting: @ 0x0800131C
	ldr r1, _08001324  @ 0x03003080
	strb r0, [r1, #5]
	bx lr
	.align 2, 0
_08001324: .4byte 0x03003080

	THUMB_FUNC_START SetMainUpdateRoutine
SetMainUpdateRoutine: @ 0x08001328
	ldr r1, _08001330  @ 0x02024CB8
	str r0, [r1]
	bx lr
	.align 2, 0
_08001330: .4byte 0x02024CB8

	THUMB_FUNC_START ExecMainUpdate
ExecMainUpdate: @ 0x08001334
	push {lr}
	ldr r0, _08001348  @ 0x02024CB8
	ldr r0, [r0]
	cmp r0, #0
	beq _08001342
	bl _call_via_r0
_08001342:
	pop {r0}
	bx r0
	.align 2, 0
_08001348: .4byte 0x02024CB8

	THUMB_FUNC_START _UpdateKeyStatus
_UpdateKeyStatus: @ 0x0800134C
	push {r4, r5, lr}
	adds r2, r0, #0
	lsls r1, r1, #0x10
	lsrs r5, r1, #0x10
	ldrh r1, [r2, #4]
	strh r1, [r2, #0xa]
	strh r5, [r2, #4]
	adds r0, r5, #0
	bics r0, r1
	strh r0, [r2, #6]
	strh r0, [r2, #8]
	cmp r0, #0
	beq _08001368
	strh r5, [r2, #0xc]
_08001368:
	movs r0, #0
	strh r0, [r2, #0xe]
	ldrh r0, [r2, #4]
	adds r3, r0, #0
	cmp r3, #0
	bne _0800138C
	ldrh r4, [r2, #0xc]
	cmp r4, #0
	beq _08001386
	ldrh r1, [r2, #0xa]
	ldr r0, _080013A8  @ 0x00000303
	ands r0, r1
	cmp r4, r0
	bne _08001386
	strh r1, [r2, #0xe]
_08001386:
	lsls r0, r3, #0x10
	cmp r0, #0
	beq _080013AC
_0800138C:
	lsls r0, r3, #0x10
	lsrs r0, r0, #0x10
	ldrh r1, [r2, #0xa]
	cmp r0, r1
	bne _080013AC
	ldrb r0, [r2, #2]
	subs r0, #1
	strb r0, [r2, #2]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080013B0
	strh r3, [r2, #6]
	ldrb r0, [r2, #1]
	b _080013AE
	.align 2, 0
_080013A8: .4byte 0x00000303
_080013AC:
	ldrb r0, [r2]
_080013AE:
	strb r0, [r2, #2]
_080013B0:
	ldrh r0, [r2, #0x10]
	eors r0, r3
	ands r0, r3
	strh r0, [r2, #0x10]
	ldr r0, _080013C4  @ 0x000003F3
	ands r0, r5
	cmp r0, #0
	beq _080013C8
	movs r0, #0
	b _080013D2
	.align 2, 0
_080013C4: .4byte 0x000003F3
_080013C8:
	ldrh r1, [r2, #0x12]
	ldr r0, _080013DC  @ 0x0000FFFE
	cmp r1, r0
	bhi _080013D4
	adds r0, r1, #1
_080013D2:
	strh r0, [r2, #0x12]
_080013D4:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080013DC: .4byte 0x0000FFFE

	THUMB_FUNC_START UpdateKeyStatus
UpdateKeyStatus: @ 0x080013E0
	push {lr}
	adds r2, r0, #0
	ldr r0, _0800140C  @ 0x04000130
	ldrh r0, [r0]
	mvns r0, r0
	lsls r0, r0, #0x16
	lsrs r1, r0, #0x16
	movs r0, #0xf
	ands r0, r1
	cmp r0, #0xf
	beq _080013FC
	ldr r0, _08001410  @ 0x03000010
	ldrh r0, [r0]
	bics r1, r0
_080013FC:
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	adds r0, r2, #0
	bl _UpdateKeyStatus
	pop {r0}
	bx r0
	.align 2, 0
_0800140C: .4byte 0x04000130
_08001410: .4byte 0x03000010

	THUMB_FUNC_START sub_08001414
sub_08001414: @ 0x08001414
	movs r1, #0
	strh r1, [r0, #8]
	strh r1, [r0, #6]
	strh r1, [r0, #4]
	bx lr

	THUMB_FUNC_START ResetKeyStatus
ResetKeyStatus: @ 0x08001420
	movs r2, #0
	movs r1, #0xc
	strb r1, [r0]
	movs r1, #4
	strb r1, [r0, #1]
	movs r1, #0
	strh r2, [r0, #0xa]
	strh r2, [r0, #4]
	strh r2, [r0, #8]
	strb r1, [r0, #2]
	strh r2, [r0, #0x12]
	ldr r0, _0800143C  @ 0x03000010
	strh r2, [r0]
	bx lr
	.align 2, 0
_0800143C: .4byte 0x03000010

	THUMB_FUNC_START SetKeyStatus_IgnoreMask
SetKeyStatus_IgnoreMask: @ 0x08001440
	ldr r1, _08001448  @ 0x03000010
	strh r0, [r1]
	bx lr
	.align 2, 0
_08001448: .4byte 0x03000010

	THUMB_FUNC_START GetKeyStatus_IgnoreMask
GetKeyStatus_IgnoreMask: @ 0x0800144C
	ldr r0, _08001454  @ 0x03000010
	ldrh r0, [r0]
	bx lr
	.align 2, 0
_08001454: .4byte 0x03000010

	THUMB_FUNC_START KeyStatusSetter_Set
KeyStatusSetter_Set: @ 0x08001458
	ldr r1, _0800146C  @ 0x0858791C
	ldr r2, [r1]
	adds r0, #0x64
	ldrh r1, [r0]
	strh r1, [r2, #8]
	ldrh r1, [r0]
	strh r1, [r2, #6]
	ldrh r0, [r0]
	strh r0, [r2, #4]
	bx lr
	.align 2, 0
_0800146C: .4byte 0x0858791C

	THUMB_FUNC_START NewKeyStatusSetter
NewKeyStatusSetter: @ 0x08001470
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08001488  @ 0x08587920
	movs r1, #1
	bl New6C
	adds r0, #0x64
	strh r4, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08001488: .4byte 0x08587920
