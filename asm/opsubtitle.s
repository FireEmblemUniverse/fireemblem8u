	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	THUMB_FUNC_START sub_80C488C
sub_80C488C: @ 0x080C488C
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r6, r0, #0
	bl GetBackgroundTileDataOffset
	adds r4, r0, #0
	ldr r0, _080C48DC  @ gUnknown_08B12DB4
	movs r2, #0xc0
	lsls r2, r2, #0x13
	adds r1, r4, r2
	bl CopyDataWithPossibleUncomp
	movs r0, #0
	str r0, [sp]
	ldr r0, _080C48E0  @ 0x06005000
	adds r4, r4, r0
	ldr r5, _080C48E4  @ 0x01000008
	mov r0, sp
	adds r1, r4, #0
	adds r2, r5, #0
	bl CpuFastSet
	movs r0, #1
	lsls r0, r6
	bl BG_EnableSyncByMask
	ldr r0, _080C48E8  @ 0x08A708A7
	str r0, [sp, #4]
	add r0, sp, #4
	ldr r1, _080C48EC  @ gUnknown_02022A68
	adds r2, r5, #0
	bl CpuFastSet
	bl EnablePaletteSync
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080C48DC: .4byte gUnknown_08B12DB4
_080C48E0: .4byte 0x06005000
_080C48E4: .4byte 0x01000008
_080C48E8: .4byte 0x08A708A7 @ Not a pointer - this is a palette for text shadow in the intro scroll.
_080C48EC: .4byte gUnknown_02022A68

	THUMB_FUNC_END sub_80C488C

	THUMB_FUNC_START sub_80C48F0
sub_80C48F0: @ 0x080C48F0
	push {r4, lr}
	bl BG_GetMapBuffer
	adds r2, r0, #0
	movs r4, #0xf0
	lsls r4, r4, #8
	movs r1, #0
	ldr r3, _080C4914  @ 0x0000027F
_080C4900:
	adds r0, r4, r1
	strh r0, [r2]
	adds r2, #2
	adds r1, #1
	cmp r1, r3
	ble _080C4900
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C4914: .4byte 0x0000027F

	THUMB_FUNC_END sub_80C48F0

	THUMB_FUNC_START sub_80C4918
sub_80C4918: @ 0x080C4918
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080C4940  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _080C4938
	movs r0, #1
	bl Sound_FadeOutBGM
	adds r0, r4, #0
	movs r1, #6
	bl Proc_Goto
_080C4938:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C4940: .4byte gKeyStatusPtr

	THUMB_FUNC_END sub_80C4918

	THUMB_FUNC_START sub_80C4944
sub_80C4944: @ 0x080C4944
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	ldr r0, _080C4A28  @ gUnknown_08AA213C
	bl SetupBackgrounds
	ldr r3, _080C4A2C  @ gLCDControlBuffer
	ldrb r1, [r3]
	movs r0, #8
	negs r0, r0
	ands r0, r1
	movs r4, #1
	orrs r0, r4
	strb r0, [r3]
	ldrb r0, [r3, #0xc]
	movs r2, #3
	orrs r0, r2
	strb r0, [r3, #0xc]
	ldrb r0, [r3, #0x10]
	orrs r0, r2
	strb r0, [r3, #0x10]
	ldrb r1, [r3, #0x14]
	movs r0, #4
	negs r0, r0
	ands r0, r1
	strb r0, [r3, #0x14]
	ldrb r0, [r3, #0x18]
	orrs r0, r2
	strb r0, [r3, #0x18]
	ldrb r1, [r3, #1]
	orrs r1, r4
	movs r0, #3
	negs r0, r0
	ands r1, r0
	subs r0, #2
	ands r1, r0
	subs r0, #4
	ands r1, r0
	movs r0, #0x10
	orrs r1, r0
	ldrb r2, [r3, #0x15]
	movs r0, #0x3f
	ands r0, r2
	movs r2, #0x40
	orrs r0, r2
	movs r2, #0x21
	negs r2, r2
	ands r0, r2
	strb r0, [r3, #0x15]
	ands r1, r2
	movs r0, #0x41
	negs r0, r0
	ands r1, r0
	movs r0, #0x7f
	ands r1, r0
	strb r1, [r3, #1]
	movs r0, #1
	movs r1, #0
	movs r2, #0x10
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	movs r5, #0
	str r5, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #1
	movs r3, #0
	bl SetBlendTargetA
	movs r0, #1
	str r0, [sp]
	movs r1, #1
	movs r2, #0
	movs r3, #0
	bl SetBlendTargetB
	ldr r4, _080C4A30  @ gUnknown_08B17B64
	movs r0, #2
	bl GetBackgroundTileDataOffset
	adds r1, r0, #0
	movs r0, #0xc0
	lsls r0, r0, #0x13
	adds r1, r1, r0
	adds r0, r4, #0
	bl CopyDataWithPossibleUncomp
	ldr r0, _080C4A34  @ gUnknown_08B18ED4
	movs r1, #0
	movs r2, #0x60
	bl CopyToPaletteBuffer
	ldr r0, _080C4A38  @ gBG2TilemapBuffer
	movs r1, #0
	bl BG_Fill
	movs r0, #4
	bl BG_EnableSyncByMask
	movs r0, #3
	movs r1, #0
	bl Sound_PlaySong80024D4
	adds r0, r6, #0
	adds r0, #0x29
	strb r5, [r0]
	movs r0, #0x3c
	strh r0, [r6, #0x2a]
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080C4A28: .4byte gUnknown_08AA213C
_080C4A2C: .4byte gLCDControlBuffer
_080C4A30: .4byte gUnknown_08B17B64
_080C4A34: .4byte gUnknown_08B18ED4
_080C4A38: .4byte gBG2TilemapBuffer

	THUMB_FUNC_END sub_80C4944

	THUMB_FUNC_START sub_80C4A3C
sub_80C4A3C: @ 0x080C4A3C
	push {lr}
	adds r1, r0, #0
	adds r1, #0x4c
	movs r2, #0
	strh r2, [r1]
	adds r0, #0x4e
	strh r2, [r0]
	ldr r0, _080C4A7C  @ gBG2TilemapBuffer
	ldr r1, _080C4A80  @ gUnknown_08B18D68
	movs r3, #5
	bl sub_800154C
	movs r0, #4
	bl BG_EnableSyncByMask
	ldr r2, _080C4A84  @ gLCDControlBuffer
	ldrb r0, [r2, #1]
	movs r1, #1
	orrs r0, r1
	movs r1, #3
	negs r1, r1
	ands r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #9
	negs r1, r1
	ands r0, r1
	subs r1, #8
	ands r0, r1
	strb r0, [r2, #1]
	pop {r0}
	bx r0
	.align 2, 0
_080C4A7C: .4byte gBG2TilemapBuffer
_080C4A80: .4byte gUnknown_08B18D68
_080C4A84: .4byte gLCDControlBuffer

	THUMB_FUNC_END sub_80C4A3C

	THUMB_FUNC_START sub_80C4A88
sub_80C4A88: @ 0x080C4A88
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	mov r9, r0
	mov r5, r9
	adds r5, #0x4c
	movs r1, #0
	ldrsh r0, [r5, r1]
	cmp r0, #0x1d
	bgt _080C4AC2
	adds r3, r0, #0
	movs r4, #0x1e
	str r4, [sp]
	movs r0, #5
	movs r1, #4
	movs r2, #0x32
	bl Interpolate
	adds r7, r0, #0
	movs r0, #0
	ldrsh r3, [r5, r0]
	str r4, [sp]
	movs r0, #4
	movs r1, #0
	movs r2, #0x10
	b _080C4AE6
_080C4AC2:
	movs r1, #0
	ldrsh r3, [r5, r1]
	subs r3, #0x1e
	movs r4, #0x1e
	str r4, [sp]
	movs r0, #0
	movs r1, #0x32
	movs r2, #0x64
	bl Interpolate
	adds r7, r0, #0
	movs r2, #0
	ldrsh r3, [r5, r2]
	subs r3, #0x1e
	str r4, [sp]
	movs r0, #0
	movs r1, #0x10
	movs r2, #0
_080C4AE6:
	bl Interpolate
	mov sl, r0
	cmp r7, #0x31
	ble _080C4AF4
	movs r0, #0x64
	subs r7, r0, r7
_080C4AF4:
	mov r6, r9
	adds r6, #0x4c
	movs r0, #0
	ldrsh r3, [r6, r0]
	movs r4, #0x3c
	str r4, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0xd6
	bl Interpolate
	adds r5, r0, #0
	movs r1, #0
	ldrsh r3, [r6, r1]
	str r4, [sp]
	movs r0, #0
	movs r1, #0x10
	movs r2, #0x80
	bl Interpolate
	adds r4, r0, #0
	movs r2, #0x4e
	add r2, r9
	mov r8, r2
	movs r0, #0
	ldrsh r1, [r2, r0]
	lsls r0, r7, #2
	adds r0, r0, r7
	adds r0, #0x80
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #2
	movs r2, #0
	movs r3, #0
	bl sub_80ADDFC
	movs r2, #0x80
	lsls r2, r2, #1
	movs r0, #2
	adds r1, r2, #0
	bl sub_80ADE90
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	movs r0, #0x48
	str r0, [sp]
	movs r0, #2
	adds r1, r5, #0
	adds r2, r4, #0
	movs r3, #0x50
	bl sub_80ADEE0
	mov r1, r8
	ldrh r0, [r1]
	subs r0, #0x40
	strh r0, [r1]
	mov r2, sl
	lsls r1, r2, #0x18
	lsrs r1, r1, #0x18
	movs r0, #1
	movs r2, #0x10
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	ldrh r0, [r6]
	adds r0, #1
	strh r0, [r6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x3b
	ble _080C4B90
	mov r0, r9
	bl Proc_Break
_080C4B90:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80C4A88

	THUMB_FUNC_START sub_80C4BA0
sub_80C4BA0: @ 0x080C4BA0
	ldr r2, _080C4BB0  @ gLCDControlBuffer
	ldrb r1, [r2, #1]
	movs r0, #5
	negs r0, r0
	ands r0, r1
	strb r0, [r2, #1]
	bx lr
	.align 2, 0
_080C4BB0: .4byte gLCDControlBuffer

	THUMB_FUNC_END sub_80C4BA0

	THUMB_FUNC_START sub_80C4BB4
sub_80C4BB4: @ 0x080C4BB4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	mov sl, r3
	cmp r2, #0
	ble _080C4C2E
	mov r9, r1
	adds r7, r0, #0
	mov r8, r2
_080C4BCA:
	ldrh r6, [r7]
	adds r0, r6, #0
	movs r1, #0x1f
	ands r0, r1
	mov r1, sl
	muls r1, r0, r1
	movs r0, #0x80
	lsls r0, r0, #5
	bl DivArm
	adds r5, r0, #0
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	asrs r0, r6, #5
	movs r1, #0x1f
	ands r0, r1
	mov r1, sl
	muls r1, r0, r1
	movs r0, #0x80
	lsls r0, r0, #5
	bl DivArm
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	asrs r6, r6, #0xa
	movs r0, #0x1f
	ands r6, r0
	mov r1, sl
	muls r1, r6, r1
	movs r0, #0x80
	lsls r0, r0, #5
	bl DivArm
	lsls r0, r0, #0x10
	lsls r4, r4, #5
	adds r5, r5, r4
	lsrs r0, r0, #6
	adds r5, r5, r0
	mov r1, r9
	strh r5, [r1]
	movs r0, #2
	add r9, r0
	adds r7, #2
	movs r1, #1
	negs r1, r1
	add r8, r1
	mov r0, r8
	cmp r0, #0
	bne _080C4BCA
_080C4C2E:
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80C4BB4

	THUMB_FUNC_START sub_80C4C3C
sub_80C4C3C: @ 0x080C4C3C
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2a]
	subs r0, #1
	strh r0, [r4, #0x2a]
	lsls r0, r0, #0x10
	cmp r0, #0
	bgt _080C4C52
	adds r0, r4, #0
	bl Proc_Break
_080C4C52:
	adds r0, r4, #0
	bl sub_80C4918
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80C4C3C

	THUMB_FUNC_START sub_80C4C60
sub_80C4C60: @ 0x080C4C60
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r4, _080C4CBC  @ gUnknown_08206FE4
	adds r6, r5, #0
	adds r6, #0x29
	movs r1, #0
	ldrsb r1, [r6, r1]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r0, [r0]
	ldr r1, _080C4CC0  @ 0x06001000
	bl CopyDataWithPossibleUncomp
	movs r1, #0
	ldrsb r1, [r6, r1]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r4, #4
	adds r0, r0, r4
	ldr r0, [r0]
	ldr r4, _080C4CC4  @ gGenericBuffer
	adds r1, r4, #0
	bl CopyDataWithPossibleUncomp
	ldr r0, _080C4CC8  @ gBG0TilemapBuffer
	movs r2, #0xc2
	lsls r2, r2, #6
	adds r1, r4, #0
	bl CallARM_FillTileRect
	ldr r2, _080C4CCC  @ gLCDControlBuffer
	ldrb r0, [r2, #1]
	movs r1, #1
	orrs r0, r1
	strb r0, [r2, #1]
	movs r0, #1
	bl BG_EnableSyncByMask
	movs r0, #0
	strh r0, [r5, #0x2c]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080C4CBC: .4byte gUnknown_08206FE4
_080C4CC0: .4byte 0x06001000
_080C4CC4: .4byte gGenericBuffer
_080C4CC8: .4byte gBG0TilemapBuffer
_080C4CCC: .4byte gLCDControlBuffer

	THUMB_FUNC_END sub_80C4C60

	THUMB_FUNC_START sub_80C4CD0
sub_80C4CD0: @ 0x080C4CD0
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r4, _080C4D38  @ gUnknown_08206FE4
	adds r6, r5, #0
	adds r6, #0x29
	movs r1, #0
	ldrsb r1, [r6, r1]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r0, [r0]
	ldr r1, _080C4D3C  @ 0x06001000
	bl CopyDataWithPossibleUncomp
	movs r1, #0
	ldrsb r1, [r6, r1]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r4, #4
	adds r0, r0, r4
	ldr r0, [r0]
	ldr r4, _080C4D40  @ gGenericBuffer
	adds r1, r4, #0
	bl CopyDataWithPossibleUncomp
	ldr r0, _080C4D44  @ gBG0TilemapBuffer
	movs r2, #0xc2
	lsls r2, r2, #6
	adds r1, r4, #0
	bl CallARM_FillTileRect
	ldr r0, _080C4D48  @ gBG1TilemapBuffer
	ldr r2, _080C4D4C  @ 0x0000E080
	adds r1, r4, #0
	bl CallARM_FillTileRect
	ldr r2, _080C4D50  @ gLCDControlBuffer
	ldrb r0, [r2, #1]
	movs r1, #1
	orrs r0, r1
	strb r0, [r2, #1]
	movs r0, #3
	bl BG_EnableSyncByMask
	movs r0, #0
	strh r0, [r5, #0x2c]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080C4D38: .4byte gUnknown_08206FE4
_080C4D3C: .4byte 0x06001000
_080C4D40: .4byte gGenericBuffer
_080C4D44: .4byte gBG0TilemapBuffer
_080C4D48: .4byte gBG1TilemapBuffer
_080C4D4C: .4byte 0x0000E080
_080C4D50: .4byte gLCDControlBuffer

	THUMB_FUNC_END sub_80C4CD0

	THUMB_FUNC_START sub_80C4D54
sub_80C4D54: @ 0x080C4D54
	push {r4, r5, lr}
	ldr r5, _080C4D90  @ gUnknown_08206FE4
	lsls r4, r0, #1
	adds r4, r4, r0
	lsls r4, r4, #2
	adds r0, r4, r5
	ldr r0, [r0]
	ldr r1, _080C4D94  @ 0x06005000
	bl CopyDataWithPossibleUncomp
	adds r5, #4
	adds r4, r4, r5
	ldr r0, [r4]
	ldr r4, _080C4D98  @ gGenericBuffer
	adds r1, r4, #0
	bl CopyDataWithPossibleUncomp
	ldr r0, _080C4D9C  @ gBG0TilemapBuffer
	movs r2, #0xca
	lsls r2, r2, #6
	adds r1, r4, #0
	bl CallARM_FillTileRect
	movs r0, #1
	bl BG_EnableSyncByMask
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C4D90: .4byte gUnknown_08206FE4
_080C4D94: .4byte 0x06005000
_080C4D98: .4byte gGenericBuffer
_080C4D9C: .4byte gBG0TilemapBuffer

	THUMB_FUNC_END sub_80C4D54

	THUMB_FUNC_START sub_80C4DA0
sub_80C4DA0: @ 0x080C4DA0
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x4f
	bgt _080C4DD4
	movs r1, #0x2c
	ldrsh r0, [r4, r1]
	movs r1, #0x50
	movs r2, #0
	bl sub_800B7E0
	adds r3, r0, #0
	ldr r0, _080C4DCC  @ gUnknown_08AA239C
	ldr r1, _080C4DD0  @ gUnknown_02022908
	movs r2, #0x10
	bl sub_80C4BB4
	b _080C4E00
	.align 2, 0
_080C4DCC: .4byte gUnknown_08AA239C
_080C4DD0: .4byte gUnknown_02022908
_080C4DD4:
	ldr r0, _080C4E10  @ gUnknown_08AA239C
	movs r1, #0x60
	movs r2, #0x20
	bl CopyToPaletteBuffer
	adds r0, r4, #0
	bl Proc_Break
	ldr r2, _080C4E14  @ gUnknown_08206FE4
	adds r0, r4, #0
	adds r0, #0x29
	movs r1, #0
	ldrsb r1, [r0, r1]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r2, #8
	adds r0, r0, r2
	ldr r0, [r0]
	strh r0, [r4, #0x2a]
	movs r0, #0
	strh r0, [r4, #0x2c]
_080C4E00:
	bl EnablePaletteSync
	adds r0, r4, #0
	bl sub_80C4918
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C4E10: .4byte gUnknown_08AA239C
_080C4E14: .4byte gUnknown_08206FE4

	THUMB_FUNC_END sub_80C4DA0

	THUMB_FUNC_START sub_80C4E18
sub_80C4E18: @ 0x080C4E18
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	movs r5, #0
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x4f
	bgt _080C4E54
	movs r1, #0x2c
	ldrsh r0, [r4, r1]
	movs r1, #0x50
	movs r2, #0
	bl sub_800B7E0
	movs r3, #0x80
	lsls r3, r3, #5
	subs r3, r3, r0
	ldr r0, _080C4E4C  @ gUnknown_08AA239C
	ldr r1, _080C4E50  @ gUnknown_02022908
	movs r2, #0x10
	bl sub_80C4BB4
	b _080C4EAE
	.align 2, 0
_080C4E4C: .4byte gUnknown_08AA239C
_080C4E50: .4byte gUnknown_02022908
_080C4E54:
	str r5, [sp]
	ldr r1, _080C4E80  @ gUnknown_02022908
	ldr r2, _080C4E84  @ 0x01000008
	mov r0, sp
	bl CpuFastSet
	strh r5, [r4, #0x2c]
	adds r1, r4, #0
	adds r1, #0x29
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bgt _080C4E88
	movs r0, #0x50
	strh r0, [r4, #0x2a]
	adds r0, r4, #0
	bl Proc_Break
	b _080C4EAE
	.align 2, 0
_080C4E80: .4byte gUnknown_02022908
_080C4E84: .4byte 0x01000008
_080C4E88:
	ldr r2, _080C4EC0  @ gLCDControlBuffer
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
	adds r0, r4, #0
	movs r1, #1
	bl Proc_Goto
_080C4EAE:
	bl EnablePaletteSync
	adds r0, r4, #0
	bl sub_80C4918
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C4EC0: .4byte gLCDControlBuffer

	THUMB_FUNC_END sub_80C4E18

	THUMB_FUNC_START sub_80C4EC4
sub_80C4EC4: @ 0x080C4EC4
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	movs r5, #0
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x4f
	bgt _080C4F00
	movs r1, #0x2c
	ldrsh r0, [r4, r1]
	movs r1, #0x50
	movs r2, #0
	bl sub_800B7E0
	movs r3, #0x80
	lsls r3, r3, #5
	subs r3, r3, r0
	ldr r0, _080C4EF8  @ gUnknown_08AA239C
	ldr r1, _080C4EFC  @ gUnknown_02022908
	movs r2, #0x10
	bl sub_80C4BB4
	b _080C4F40
	.align 2, 0
_080C4EF8: .4byte gUnknown_08AA239C
_080C4EFC: .4byte gUnknown_02022908
_080C4F00:
	str r5, [sp]
	ldr r1, _080C4F54  @ gUnknown_02022908
	ldr r2, _080C4F58  @ 0x01000008
	mov r0, sp
	bl CpuFastSet
	strh r5, [r4, #0x2c]
	adds r1, r4, #0
	adds r1, #0x29
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	movs r0, #0x5a
	strh r0, [r4, #0x2a]
	ldr r2, _080C4F5C  @ gLCDControlBuffer
	ldrb r1, [r2, #1]
	subs r0, #0x5c
	ands r0, r1
	movs r1, #3
	negs r1, r1
	ands r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #9
	negs r1, r1
	ands r0, r1
	subs r1, #8
	ands r0, r1
	strb r0, [r2, #1]
	adds r0, r4, #0
	bl Proc_Break
_080C4F40:
	bl EnablePaletteSync
	adds r0, r4, #0
	bl sub_80C4918
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C4F54: .4byte gUnknown_02022908
_080C4F58: .4byte 0x01000008
_080C4F5C: .4byte gLCDControlBuffer

	THUMB_FUNC_END sub_80C4EC4

	THUMB_FUNC_START sub_80C4F60
sub_80C4F60: @ 0x080C4F60
	push {r4, r5, lr}
	adds r5, r0, #0
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x4f
	bgt _080C4FA6
	movs r1, #0x2c
	ldrsh r0, [r5, r1]
	movs r1, #0x50
	movs r2, #0
	bl sub_800B7E0
	adds r1, r0, #0
	movs r0, #0x80
	lsls r0, r0, #5
	lsls r1, r1, #4
	bl DivArm
	adds r2, r0, #0
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r1, #0x10
	subs r1, r1, r2
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	movs r0, #1
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	b _080C5006
_080C4FA6:
	movs r0, #1
	movs r1, #0
	movs r2, #0x10
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	adds r4, r5, #0
	adds r4, #0x29
	movs r0, #0
	ldrsb r0, [r4, r0]
	cmp r0, #4
	bgt _080C4FE4
	adds r0, r5, #0
	bl Proc_Break
	ldr r2, _080C4FE0  @ gUnknown_08206FE4
	movs r1, #0
	ldrsb r1, [r4, r1]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r2, #8
	adds r0, r0, r2
	ldr r0, [r0]
	strh r0, [r5, #0x2a]
	movs r0, #0
	strh r0, [r5, #0x2c]
	b _080C5006
	.align 2, 0
_080C4FE0: .4byte gUnknown_08206FE4
_080C4FE4:
	ldr r2, _080C5018  @ gUnknown_08206FE4
	movs r1, #0
	ldrsb r1, [r4, r1]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r2, #8
	adds r0, r0, r2
	ldr r0, [r0]
	strh r0, [r5, #0x2a]
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	adds r0, r5, #0
	movs r1, #4
	bl Proc_Goto
_080C5006:
	bl EnablePaletteSync
	adds r0, r5, #0
	bl sub_80C4918
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C5018: .4byte gUnknown_08206FE4

	THUMB_FUNC_END sub_80C4F60

	THUMB_FUNC_START sub_80C501C
sub_80C501C: @ 0x080C501C
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x4f
	bgt _080C5064
	movs r1, #0x2c
	ldrsh r0, [r4, r1]
	movs r1, #0x50
	movs r2, #0
	bl sub_800B7E0
	adds r1, r0, #0
	movs r0, #0x80
	lsls r0, r0, #5
	subs r1, r0, r1
	lsls r1, r1, #4
	bl DivArm
	adds r2, r0, #0
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r1, #0x10
	subs r1, r1, r2
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	movs r0, #1
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	b _080C508E
_080C5064:
	movs r0, #1
	movs r1, #0x10
	movs r2, #0
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r1, r4, #0
	adds r1, #0x29
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	movs r0, #0x50
	strh r0, [r4, #0x2a]
	adds r0, r4, #0
	bl Proc_Break
	adds r0, r4, #0
	bl sub_80C4918
_080C508E:
	bl EnablePaletteSync
	adds r0, r4, #0
	bl sub_80C4918
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80C501C

	THUMB_FUNC_START sub_80C50A0
sub_80C50A0: @ 0x080C50A0
	push {r4, r5, lr}
	sub sp, #8
	adds r5, r0, #0
	movs r0, #1
	bl sub_80C488C
	movs r4, #0
	str r4, [sp]
	ldr r1, _080C50F0  @ gUnknown_02022A88
	ldr r2, _080C50F4  @ 0x01000008
	mov r0, sp
	bl CpuFastSet
	movs r0, #1
	bl sub_80C48F0
	movs r0, #2
	bl BG_EnableSyncByMask
	str r4, [sp, #4]
	add r0, sp, #4
	ldr r1, _080C50F8  @ 0x06005000
	ldr r2, _080C50FC  @ 0x01000400
	bl CpuFastSet
	ldr r0, _080C5100  @ gBG0TilemapBuffer
	movs r1, #0xa0
	lsls r1, r1, #2
	bl BG_Fill
	movs r0, #1
	bl BG_EnableSyncByMask
	movs r0, #0x16
	strh r0, [r5, #0x2a]
	strh r4, [r5, #0x2c]
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C50F0: .4byte gUnknown_02022A88
_080C50F4: .4byte 0x01000008
_080C50F8: .4byte 0x06005000
_080C50FC: .4byte 0x01000400
_080C5100: .4byte gBG0TilemapBuffer

	THUMB_FUNC_END sub_80C50A0

	THUMB_FUNC_START sub_80C5104
sub_80C5104: @ 0x080C5104
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0x2c
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _080C512C
	ldr r2, _080C5154  @ gLCDControlBuffer
	ldrb r0, [r2, #1]
	movs r1, #1
	orrs r0, r1
	movs r1, #2
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #9
	negs r1, r1
	ands r0, r1
	subs r1, #8
	ands r0, r1
	strb r0, [r2, #1]
_080C512C:
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x2d
	bgt _080C5160
	movs r1, #0x2c
	ldrsh r0, [r4, r1]
	movs r1, #0x2e
	movs r2, #0
	bl sub_800B7E0
	adds r3, r0, #0
	ldr r0, _080C5158  @ gUnknown_08B1756C
	ldr r1, _080C515C  @ gUnknown_02022A88
	movs r2, #0x10
	bl sub_80C4BB4
	b _080C518E
	.align 2, 0
_080C5154: .4byte gLCDControlBuffer
_080C5158: .4byte gUnknown_08B1756C
_080C515C: .4byte gUnknown_02022A88
_080C5160:
	ldr r0, _080C51A0  @ gUnknown_08B1756C
	movs r1, #0xf0
	lsls r1, r1, #1
	movs r2, #0x20
	bl CopyToPaletteBuffer
	adds r0, r4, #0
	bl Proc_Break
	ldr r2, _080C51A4  @ gUnknown_08206FE4
	adds r0, r4, #0
	adds r0, #0x29
	movs r1, #0
	ldrsb r1, [r0, r1]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r2, #8
	adds r0, r0, r2
	ldr r0, [r0]
	strh r0, [r4, #0x2a]
	movs r0, #0
	strh r0, [r4, #0x2c]
_080C518E:
	bl EnablePaletteSync
	adds r0, r4, #0
	bl sub_80C4918
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C51A0: .4byte gUnknown_08B1756C
_080C51A4: .4byte gUnknown_08206FE4

	THUMB_FUNC_END sub_80C5104

	THUMB_FUNC_START sub_80C51A8
sub_80C51A8: @ 0x080C51A8
	push {lr}
	movs r0, #2
	bl sub_80C4D54
	ldr r0, _080C51C4  @ gUnknown_08AA239C
	movs r1, #0x60
	movs r2, #0x20
	bl CopyToPaletteBuffer
	bl EnablePaletteSync
	pop {r0}
	bx r0
	.align 2, 0
_080C51C4: .4byte gUnknown_08AA239C

	THUMB_FUNC_END sub_80C51A8

	THUMB_FUNC_START sub_80C51C8
sub_80C51C8: @ 0x080C51C8
	push {r4, r5, lr}
	ldr r1, _080C5210  @ gUnknown_0300308C
	movs r0, #0
	strh r0, [r1]
	strh r0, [r1, #4]
	strh r0, [r1, #8]
	strh r0, [r1, #0xc]
	ldr r4, _080C5214  @ gUnknown_08AA21A4
	movs r5, #0
_080C51DA:
	ldrh r1, [r4]
	adds r4, #2
	adds r0, r5, #0
	bl SetBackgroundTileDataOffset
	ldrh r1, [r4]
	adds r4, #2
	adds r0, r5, #0
	bl SetBackgroundMapDataOffset
	ldrh r1, [r4]
	adds r4, #2
	adds r0, r5, #0
	bl SetBackgroundScreenSize
	lsls r0, r5, #0x10
	lsrs r0, r0, #0x10
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	adds r5, #1
	cmp r5, #3
	ble _080C51DA
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C5210: .4byte gUnknown_0300308C
_080C5214: .4byte gUnknown_08AA21A4

	THUMB_FUNC_END sub_80C51C8

	THUMB_FUNC_START sub_80C5218
sub_80C5218: @ 0x080C5218
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #4
	mov r8, r0
	bl sub_80C51C8
	ldr r4, _080C5318  @ gLCDControlBuffer
	ldrb r1, [r4]
	movs r0, #8
	negs r0, r0
	ands r0, r1
	strb r0, [r4]
	ldrb r1, [r4, #0xc]
	movs r2, #4
	negs r2, r2
	adds r0, r2, #0
	ands r0, r1
	movs r6, #1
	orrs r0, r6
	strb r0, [r4, #0xc]
	ldrb r1, [r4, #0x10]
	adds r0, r2, #0
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	strb r0, [r4, #0x10]
	ldrb r0, [r4, #0x14]
	movs r1, #3
	orrs r0, r1
	strb r0, [r4, #0x14]
	ldrb r0, [r4, #0x18]
	ands r2, r0
	strb r2, [r4, #0x18]
	movs r0, #1
	movs r1, #0
	movs r2, #0x10
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	movs r5, #0
	str r5, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #1
	bl SetBlendTargetA
	str r5, [sp]
	movs r0, #1
	movs r1, #1
	movs r2, #0
	movs r3, #0
	bl SetBlendTargetB
	movs r0, #0
	bl sub_8001F48
	movs r0, #0
	bl sub_8001F64
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	ldr r2, _080C531C  @ 0x0000FFFD
	movs r0, #1
	adds r1, r2, #0
	bl BG_SetPosition
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	movs r0, #3
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	movs r0, #3
	bl sub_80C488C
	movs r0, #3
	bl sub_80C48F0
	ldr r0, _080C5320  @ gBG1TilemapBuffer
	movs r1, #0
	bl BG_Fill
	ldr r0, _080C5324  @ gBG2TilemapBuffer
	movs r1, #0
	bl BG_Fill
	movs r0, #0xe
	bl BG_EnableSyncByMask
	movs r0, #2
	bl sub_80C4D54
	ldrb r0, [r4, #1]
	orrs r0, r6
	movs r1, #3
	negs r1, r1
	ands r0, r1
	subs r1, #2
	ands r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x11
	negs r1, r1
	ands r0, r1
	strb r0, [r4, #1]
	mov r1, r8
	adds r1, #0x29
	movs r0, #2
	strb r0, [r1]
	movs r0, #0x78
	mov r1, r8
	strh r0, [r1, #0x2a]
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080C5318: .4byte gLCDControlBuffer
_080C531C: .4byte 0x0000FFFD
_080C5320: .4byte gBG1TilemapBuffer
_080C5324: .4byte gBG2TilemapBuffer

	THUMB_FUNC_END sub_80C5218

	THUMB_FUNC_START sub_80C5328
sub_80C5328: @ 0x080C5328
	push {lr}
	sub sp, #4
	movs r0, #0
	str r0, [sp]
	movs r1, #0xc0
	lsls r1, r1, #0x13
	ldr r2, _080C5368  @ 0x01000008
	mov r0, sp
	bl CpuFastSet
	movs r0, #2
	bl BG_EnableSyncByMask
	ldr r2, _080C536C  @ gLCDControlBuffer
	ldrb r0, [r2, #1]
	movs r1, #1
	orrs r0, r1
	movs r1, #2
	orrs r0, r1
	movs r1, #5
	negs r1, r1
	ands r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x11
	negs r1, r1
	ands r0, r1
	strb r0, [r2, #1]
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_080C5368: .4byte 0x01000008
_080C536C: .4byte gLCDControlBuffer

	THUMB_FUNC_END sub_80C5328

	THUMB_FUNC_START sub_80C5370
sub_80C5370: @ 0x080C5370
	push {lr}
	movs r1, #0
	strh r1, [r0, #0x2c]
	ldr r0, _080C5384  @ gPaletteBuffer
	ldr r1, _080C5388  @ gUnknown_0201CDD4
	movs r2, #0x80
	bl CpuFastSet
	pop {r0}
	bx r0
	.align 2, 0
_080C5384: .4byte gPaletteBuffer
_080C5388: .4byte gUnknown_0201CDD4

	THUMB_FUNC_END sub_80C5370

	THUMB_FUNC_START sub_80C538C
sub_80C538C: @ 0x080C538C
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	movs r5, #0
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x3b
	bgt _080C53CC
	movs r1, #0x2c
	ldrsh r0, [r4, r1]
	movs r1, #0x3c
	movs r2, #0
	bl sub_800B7E0
	movs r3, #0x80
	lsls r3, r3, #5
	subs r3, r3, r0
	ldr r0, _080C53C4  @ gUnknown_0201CDD4
	ldr r1, _080C53C8  @ gPaletteBuffer
	movs r2, #0x80
	lsls r2, r2, #2
	bl sub_80C4BB4
	b _080C53E4
	.align 2, 0
_080C53C4: .4byte gUnknown_0201CDD4
_080C53C8: .4byte gPaletteBuffer
_080C53CC:
	str r5, [sp]
	ldr r1, _080C53F8  @ gPaletteBuffer
	ldr r2, _080C53FC  @ 0x01000080
	mov r0, sp
	bl CpuFastSet
	strh r5, [r4, #0x2c]
	movs r0, #0x3c
	strh r0, [r4, #0x2a]
	adds r0, r4, #0
	bl Proc_Break
_080C53E4:
	bl EnablePaletteSync
	adds r0, r4, #0
	bl sub_80C4918
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C53F8: .4byte gPaletteBuffer
_080C53FC: .4byte 0x01000080

	THUMB_FUNC_END sub_80C538C

	THUMB_FUNC_START sub_80C5400
sub_80C5400: @ 0x080C5400
	push {lr}
	movs r0, #4
	bl Sound_FadeOutBGM
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80C5400

	THUMB_FUNC_START sub_80C540C
sub_80C540C: @ 0x080C540C
	push {lr}
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80C540C

	THUMB_FUNC_START sub_80C541C
sub_80C541C: @ 0x080C541C
	push {lr}
	adds r1, r0, #0
	ldr r0, _080C542C  @ gUnknown_08AA21BC
	bl Proc_StartBlocking
	pop {r0}
	bx r0
	.align 2, 0
_080C542C: .4byte gUnknown_08AA21BC

	THUMB_FUNC_END sub_80C541C

.align 2, 0
