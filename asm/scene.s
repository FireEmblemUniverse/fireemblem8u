	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	THUMB_FUNC_START sub_8008FB4
sub_8008FB4: @ 0x08008FB4
	push {r4, r5, r6, r7, lr}
	adds r3, r0, #0
	ldr r6, [r3, #0x4c]
	movs r1, #0
	b _08009010
_08008FBE:
	movs r2, #0
	lsls r0, r1, #2
	adds r5, r1, #0
	adds r5, #8
	adds r4, r0, r6
_08008FC8:
	lsls r0, r2, #2
	adds r1, r0, r4
	ldr r0, [r1, #4]
	str r0, [r1]
	ldr r0, [r1, #8]
	str r0, [r1, #4]
	ldr r0, [r1, #0xc]
	str r0, [r1, #8]
	ldr r0, [r1, #0x10]
	str r0, [r1, #0xc]
	ldr r0, [r1, #0x14]
	str r0, [r1, #0x10]
	ldr r0, [r1, #0x18]
	str r0, [r1, #0x14]
	ldr r0, [r1, #0x1c]
	str r0, [r1, #0x18]
	ldr r0, _08008FF8  @ 0x000002FF
	cmp r2, r0
	bgt _08008FFC
	movs r7, #0x80
	lsls r7, r7, #3
	adds r0, r1, r7
	ldr r0, [r0]
	b _08008FFE
	.align 2, 0
_08008FF8: .4byte 0x000002FF
_08008FFC:
	ldr r0, [r3, #0x58]
_08008FFE:
	str r0, [r1, #0x1c]
	movs r0, #0x80
	lsls r0, r0, #1
	adds r2, r2, r0
	movs r0, #0xc0
	lsls r0, r0, #2
	cmp r2, r0
	ble _08008FC8
	adds r1, r5, #0
_08009010:
	ldr r0, [r3, #0x54]
	lsls r0, r0, #3
	cmp r1, r0
	blt _08008FBE
	adds r1, r3, #0
	adds r1, #0x64
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xf
	ble _08009030
	adds r0, r3, #0
	bl Proc_Break
_08009030:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8008FB4

	THUMB_FUNC_START nullsub_15
nullsub_15: @ 0x08009038
	bx lr

	THUMB_FUNC_END nullsub_15

	THUMB_FUNC_START sub_800903C
sub_800903C: @ 0x0800903C
	push {lr}
	movs r1, #0
	str r1, [r0, #0x3c]
	bl ArchiveCurrentPalettes
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_800903C

	THUMB_FUNC_START sub_800904C
sub_800904C: @ 0x0800904C
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x3c]
	ldr r0, [r4, #0x34]
	adds r2, r1, r0
	str r2, [r4, #0x3c]
	cmp r2, #0xff
	bgt _08009088
	movs r0, #0x80
	lsls r0, r0, #1
	subs r0, r0, r2
	lsls r3, r0, #8
	ldr r0, [r4, #0x40]
	muls r0, r2, r0
	adds r0, r3, r0
	cmp r0, #0
	bge _08009070
	adds r0, #0xff
_08009070:
	asrs r5, r0, #8
	ldr r0, [r4, #0x48]
	muls r0, r2, r0
	adds r1, r3, r0
	cmp r1, #0
	bge _0800907E
	adds r1, #0xff
_0800907E:
	asrs r1, r1, #8
	ldr r0, [r4, #0x44]
	muls r0, r2, r0
	adds r0, r3, r0
	b _080090B8
_08009088:
	movs r0, #0x80
	lsls r0, r0, #2
	subs r3, r0, r2
	ldr r0, [r4, #0x40]
	adds r1, r0, #0
	muls r1, r3, r1
	ldr r5, _080090E8  @ 0xFFFFFF00
	adds r0, r2, r5
	lsls r2, r0, #8
	adds r0, r1, r2
	cmp r0, #0
	bge _080090A2
	adds r0, #0xff
_080090A2:
	asrs r5, r0, #8
	ldr r0, [r4, #0x48]
	muls r0, r3, r0
	adds r0, r0, r2
	cmp r0, #0
	bge _080090B0
	adds r0, #0xff
_080090B0:
	asrs r1, r0, #8
	ldr r0, [r4, #0x44]
	muls r0, r3, r0
	adds r0, r0, r2
_080090B8:
	cmp r0, #0
	bge _080090BE
	adds r0, #0xff
_080090BE:
	asrs r2, r0, #8
	ldr r3, [r4, #0x30]
	adds r0, r5, #0
	bl WriteFadedPaletteFromArchive
	ldr r1, [r4, #0x3c]
	movs r0, #0x80
	lsls r0, r0, #1
	cmp r1, r0
	bne _080090EC
	ldr r0, [r4, #0x2c]
	subs r0, #1
	str r0, [r4, #0x2c]
	cmp r0, #0
	bgt _080090F8
	movs r0, #0
	str r0, [r4, #0x3c]
	adds r0, r4, #0
	bl Proc_Break
	b _080090F8
	.align 2, 0
_080090E8: .4byte 0xFFFFFF00
_080090EC:
	movs r0, #0x80
	lsls r0, r0, #2
	cmp r1, r0
	bne _080090F8
	movs r0, #0
	str r0, [r4, #0x3c]
_080090F8:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_800904C

	THUMB_FUNC_START sub_8009100
sub_8009100: @ 0x08009100
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x3c]
	ldr r0, [r4, #0x38]
	adds r1, r1, r0
	str r1, [r4, #0x3c]
	movs r7, #0x80
	lsls r7, r7, #1
	subs r2, r7, r1
	ldr r0, [r4, #0x40]
	muls r0, r2, r0
	lsls r1, r1, #8
	adds r0, r0, r1
	cmp r0, #0
	bge _08009120
	adds r0, #0xff
_08009120:
	asrs r6, r0, #8
	ldr r0, [r4, #0x48]
	muls r0, r2, r0
	adds r0, r0, r1
	cmp r0, #0
	bge _0800912E
	adds r0, #0xff
_0800912E:
	asrs r5, r0, #8
	ldr r0, [r4, #0x44]
	muls r0, r2, r0
	adds r0, r0, r1
	cmp r0, #0
	bge _0800913C
	adds r0, #0xff
_0800913C:
	asrs r2, r0, #8
	ldr r3, [r4, #0x30]
	adds r0, r6, #0
	adds r1, r5, #0
	bl WriteFadedPaletteFromArchive
	ldr r0, [r4, #0x3c]
	cmp r0, r7
	bne _08009154
	adds r0, r4, #0
	bl Proc_Break
_08009154:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8009100

	THUMB_FUNC_START sub_800915C
sub_800915C: @ 0x0800915C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	adds r4, r1, #0
	adds r5, r2, #0
	adds r6, r3, #0
	ldr r7, [sp, #0x18]
	ldr r1, [sp, #0x24]
	ldr r0, _08009194  @ gUnknown_0859163C
	bl Proc_StartBlocking
	str r4, [r0, #0x2c]
	mov r1, r8
	str r1, [r0, #0x30]
	str r5, [r0, #0x34]
	str r6, [r0, #0x38]
	str r7, [r0, #0x40]
	ldr r1, [sp, #0x1c]
	str r1, [r0, #0x48]
	ldr r1, [sp, #0x20]
	str r1, [r0, #0x44]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08009194: .4byte gUnknown_0859163C

	THUMB_FUNC_END sub_800915C

	THUMB_FUNC_START sub_8009198
sub_8009198: @ 0x08009198
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #0x18
	mov r8, r0
	ldr r1, _080091F8  @ gBmSt
	movs r2, #0xc
	ldrsh r0, [r1, r2]
	mov r5, r8
	ldr r3, [r5, #0x2c]
	subs r3, r3, r0
	adds r3, #8
	movs r2, #0xe
	ldrsh r0, [r1, r2]
	ldr r4, [r5, #0x30]
	subs r4, r4, r0
	adds r4, #8
	ldr r6, [r5, #0x38]
	ldr r0, [r6, #4]
	ldr r1, [r6]
	ldr r2, [r6, #8]
	ldr r5, _080091FC  @ 0x000001FF
	ands r3, r5
	movs r5, #0xff
	ands r4, r5
	ldrh r5, [r6, #0xc]
	adds r4, r4, r5
	str r4, [sp]
	movs r4, #0
	str r4, [sp, #4]
	ldrb r4, [r6, #0x10]
	str r4, [sp, #8]
	ldrb r4, [r6, #0x11]
	str r4, [sp, #0xc]
	ldrh r4, [r6, #0xe]
	str r4, [sp, #0x10]
	movs r4, #4
	str r4, [sp, #0x14]
	bl sub_80AE9B0
	mov r1, r8
	str r0, [r1, #0x34]
	add sp, #0x18
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080091F8: .4byte gBmSt
_080091FC: .4byte 0x000001FF

	THUMB_FUNC_END sub_8009198

	THUMB_FUNC_START sub_8009200
sub_8009200: @ 0x08009200
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r6, [r4, #0x34]
	ldr r5, [r6]
	cmp r5, #0
	beq _08009240
	ldr r2, _08009238  @ gBmSt
	movs r1, #0xc
	ldrsh r0, [r2, r1]
	ldr r1, [r4, #0x2c]
	subs r1, r1, r0
	adds r1, #8
	movs r3, #0xe
	ldrsh r0, [r2, r3]
	ldr r2, [r4, #0x30]
	subs r2, r2, r0
	adds r2, #8
	ldr r0, _0800923C  @ 0x000001FF
	ands r1, r0
	movs r0, #0xff
	ands r2, r0
	movs r3, #1
	negs r3, r3
	adds r0, r6, #0
	bl APProc_SetParameters
	b _08009248
	.align 2, 0
_08009238: .4byte gBmSt
_0800923C: .4byte 0x000001FF
_08009240:
	adds r0, r4, #0
	bl Proc_Break
	str r5, [r4, #0x34]
_08009248:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8009200

	THUMB_FUNC_START sub_8009250
sub_8009250: @ 0x08009250
	push {lr}
	ldr r0, [r0, #0x34]
	cmp r0, #0
	beq _0800925C
	bl APProc_Delete
_0800925C:
	pop {r0}
	bx r0
	
	THUMB_FUNC_END sub_8009250
