	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

    @ a shinning stone anime effect
    @ seems unused

	THUMB_FUNC_START sub_8012984
sub_8012984: @ 0x08012984
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	ldr r4, _08012A28  @ gLCDControlBuffer
	ldrb r2, [r4, #0xc]
	movs r1, #4
	negs r1, r1
	adds r0, r1, #0
	ands r0, r2
	strb r0, [r4, #0xc]
	ldrb r2, [r4, #0x10]
	adds r0, r1, #0
	ands r0, r2
	strb r0, [r4, #0x10]
	ldrb r2, [r4, #0x14]
	adds r0, r1, #0
	ands r0, r2
	strb r0, [r4, #0x14]
	ldrb r0, [r4, #0x18]
	ands r1, r0
	movs r6, #2
	orrs r1, r6
	strb r1, [r4, #0x18]
	movs r0, #0
	str r0, [sp]
	movs r1, #0
	movs r2, #1
	movs r3, #0
	bl SetBlendTargetA
	movs r0, #0
	bl sub_8001F48
	movs r0, #1
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #1
	bl SetBlendTargetB
	movs r0, #1
	bl sub_8001F64
	movs r0, #0x34
	adds r0, r0, r4
	mov r8, r0
	ldrb r0, [r0]
	movs r1, #0x20
	orrs r0, r1
	adds r4, #0x36
	ldrb r2, [r4]
	movs r1, #0x21
	negs r1, r1
	ands r1, r2
	movs r5, #1
	orrs r0, r5
	orrs r0, r6
	movs r2, #4
	orrs r0, r2
	movs r3, #8
	orrs r0, r3
	movs r2, #0x10
	orrs r0, r2
	mov r7, r8
	strb r0, [r7]
	orrs r1, r5
	orrs r1, r6
	movs r0, #5
	negs r0, r0
	ands r1, r0
	orrs r1, r3
	orrs r1, r2
	strb r1, [r4]
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08012A28: .4byte gLCDControlBuffer

	THUMB_FUNC_END sub_8012984

	THUMB_FUNC_START sub_8012A2C
sub_8012A2C: @ 0x08012A2C
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x30]
	movs r0, #0x8d
	bl PlaySpacialSoundMaybe
	ldr r0, _08012A58  @ gUnknown_089B06AC
	ldr r1, _08012A5C  @ 0x06013800
	bl CopyDataWithPossibleUncomp
	ldr r0, _08012A60  @ gUnknown_089B0700
	movs r1, #0xa0
	lsls r1, r1, #2
	movs r2, #0x20
	bl CopyToPaletteBuffer
	adds r4, #0x48
	movs r0, #1
	strh r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08012A58: .4byte gUnknown_089B06AC
_08012A5C: .4byte 0x06013800
_08012A60: .4byte gUnknown_089B0700

	THUMB_FUNC_END sub_8012A2C

	THUMB_FUNC_START sub_8012A64
sub_8012A64: @ 0x08012A64
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r7, r0, #0
	adds r1, r7, #0
	adds r1, #0x48
	ldrh r0, [r1]
	adds r0, #1
	movs r4, #0
	strh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x1d
	ble _08012AAE
	strh r4, [r1]
	adds r0, r7, #0
	bl Proc_Break
	ldr r5, _08012AB8  @ gUnknown_089A6254
	ldr r1, [r7, #0x30]
	ldr r2, [r7, #0x34]
	ldr r6, _08012ABC  @ 0x000041C0
	str r4, [sp]
	movs r4, #2
	str r4, [sp, #4]
	adds r0, r5, #0
	adds r3, r6, #0
	bl APProc_Create
	ldr r1, [r7, #0x30]
	ldr r2, [r7, #0x34]
	movs r0, #1
	str r0, [sp]
	str r4, [sp, #4]
	adds r0, r5, #0
	adds r3, r6, #0
	bl APProc_Create
_08012AAE:
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08012AB8: .4byte gUnknown_089A6254
_08012ABC: .4byte 0x000041C0

	THUMB_FUNC_END sub_8012A64

	THUMB_FUNC_START sub_8012AC0
sub_8012AC0: @ 0x08012AC0
	push {lr}
	adds r2, r0, #0
	adds r1, r2, #0
	adds r1, #0x48
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x1d
	ble _08012ADC
	adds r0, r2, #0
	bl Proc_Break
_08012ADC:
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8012AC0

	THUMB_FUNC_START sub_8012AE0
sub_8012AE0: @ 0x08012AE0
	push {r4, r5, lr}
	movs r4, #0x10
	ldrsb r4, [r0, r4]
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	movs r5, #0x11
	ldrsb r5, [r0, r5]
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	ldr r0, _08012B1C  @ gUnknown_08592580
	movs r1, #3
	bl Proc_Start
	lsls r4, r4, #0x10
	asrs r4, r4, #0xc
	ldr r2, _08012B20  @ gGameState
	movs r3, #0xc
	ldrsh r1, [r2, r3]
	subs r4, r4, r1
	adds r4, #8
	str r4, [r0, #0x30]
	lsls r5, r5, #0x10
	asrs r5, r5, #0xc
	movs r3, #0xe
	ldrsh r1, [r2, r3]
	subs r5, r5, r1
	str r5, [r0, #0x34]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08012B1C: .4byte gUnknown_08592580
_08012B20: .4byte gGameState

	THUMB_FUNC_END sub_8012AE0

	THUMB_FUNC_START sub_8012B24
sub_8012B24: @ 0x08012B24
	push {lr}
	ldr r0, _08012B38  @ gUnknown_08592580
	bl Proc_Find
	cmp r0, #0
	beq _08012B32
	movs r0, #1
_08012B32:
	pop {r1}
	bx r1
	.align 2, 0
_08012B38: .4byte gUnknown_08592580

	THUMB_FUNC_END sub_8012B24

    .align 2, 0 @ Don't pad with nop.
