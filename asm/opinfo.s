	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	THUMB_FUNC_START sub_80B2818
sub_80B2818: @ 0x080B2818
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r4, _080B289C  @ gLCDControlBuffer
	ldrb r1, [r4]
	movs r0, #8
	negs r0, r0
	ands r0, r1
	strb r0, [r4]
	movs r0, #0
	bl SetupBackgrounds
	bl NewEfxAnimeDrvProc
	bl sub_806E8F0
	movs r5, #0
	str r5, [r6, #0x38]
	str r5, [r6, #0x3c]
	ldrb r1, [r4, #1]
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
	strb r0, [r4, #1]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	movs r0, #3
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	adds r0, r6, #0
	adds r0, #0x34
	strb r5, [r0]
	adds r1, r6, #0
	adds r1, #0x2c
	movs r0, #2
	strb r0, [r1]
	adds r0, r6, #0
	adds r0, #0x32
	strb r5, [r0]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B289C: .4byte gLCDControlBuffer

	THUMB_FUNC_END sub_80B2818

	THUMB_FUNC_START sub_80B28A0
sub_80B28A0: @ 0x080B28A0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080B28F8  @ gUnknown_08A20DA4
	bl Proc_Find
	bl Proc_End
	ldr r0, _080B28FC  @ gUnknown_08A20DCC
	bl Proc_Find
	bl Proc_End
	adds r0, r4, #0
	bl sub_80ADDD4
	movs r0, #1
	bl Sound_FadeOutBGM
	ldr r2, _080B2900  @ gLCDControlBuffer
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
	movs r0, #0
	bl SetNextGameActionId
	adds r0, r4, #0
	movs r1, #5
	bl Proc_Goto
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B28F8: .4byte gUnknown_08A20DA4
_080B28FC: .4byte gUnknown_08A20DCC
_080B2900: .4byte gLCDControlBuffer

	THUMB_FUNC_END sub_80B28A0

	THUMB_FUNC_START sub_80B2904
sub_80B2904: @ 0x080B2904
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r6, r4, #0
	adds r6, #0x2c
	ldrb r0, [r6]
	cmp r0, #2
	beq _080B2922
	cmp r0, #2
	bgt _080B291C
	cmp r0, #1
	beq _080B296A
	b _080B297E
_080B291C:
	cmp r0, #3
	beq _080B295C
	b _080B297E
_080B2922:
	adds r0, r4, #0
	adds r0, #0x33
	ldrb r0, [r0]
	adds r5, r4, #0
	adds r5, #0x34
	ldrb r1, [r5]
	bl sub_80B40EC
	str r0, [r4, #0x4c]
	cmp r0, #0
	bne _080B2948
	movs r0, #1
	bl SetNextGameActionId
	adds r0, r4, #0
	movs r1, #4
	bl Proc_Goto
	b _080B297E
_080B2948:
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
	movs r0, #1
	strb r0, [r6]
	ldr r1, [r4, #0x4c]
	adds r0, r4, #0
	bl sub_80B2F3C
	b _080B297E
_080B295C:
	ldr r1, [r4, #0x4c]
	adds r0, r4, #0
	bl sub_80B3EDC
	movs r0, #1
	strb r0, [r6]
	b _080B297E
_080B296A:
	ldr r0, _080B2984  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #4]
	movs r0, #0xb
	ands r0, r1
	cmp r0, #0
	beq _080B297E
	adds r0, r4, #0
	bl sub_80B28A0
_080B297E:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B2984: .4byte gKeyStatusPtr

	THUMB_FUNC_END sub_80B2904

	THUMB_FUNC_START sub_80B2988
sub_80B2988: @ 0x080B2988
	push {lr}
	ldr r0, _080B29AC  @ gUnknown_08A2EEF0
	bl Proc_Find
	adds r1, r0, #0
	cmp r1, #0
	beq _080B29B0
	adds r0, #0x33
	ldrb r0, [r0]
	adds r1, #0x34
	ldrb r1, [r1]
	bl sub_80B40EC
	cmp r0, #0
	bne _080B29B0
	movs r0, #1
	b _080B29B2
	.align 2, 0
_080B29AC: .4byte gUnknown_08A2EEF0
_080B29B0:
	movs r0, #0
_080B29B2:
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80B2988

	THUMB_FUNC_START sub_80B29B8
sub_80B29B8: @ 0x080B29B8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080B29D0  @ gUnknown_08A2EEF0
	bl Proc_Find
	cmp r0, #0
	beq _080B29CA
	adds r0, #0x2c
	strb r4, [r0]
_080B29CA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B29D0: .4byte gUnknown_08A2EEF0

	THUMB_FUNC_END sub_80B29B8

	THUMB_FUNC_START sub_80B29D4
sub_80B29D4: @ 0x080B29D4
	push {lr}
	movs r0, #3
	bl Sound_FadeOutBGM
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80B29D4

	THUMB_FUNC_START sub_80B29E0
sub_80B29E0: @ 0x080B29E0
	push {lr}
	bl sub_80ADDD4
	bl sub_805A9E0
	movs r0, #0
	bl sub_8009A84
	bl sub_806E920
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80B29E0

	THUMB_FUNC_START Make6C_opinfo
Make6C_opinfo: @ 0x080B29F8
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _080B2A10  @ gUnknown_08A2EEF0
	bl Proc_StartBlocking
	adds r0, #0x33
	strb r4, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B2A10: .4byte gUnknown_08A2EEF0

	THUMB_FUNC_END Make6C_opinfo

	THUMB_FUNC_START sub_80B2A14
sub_80B2A14: @ 0x080B2A14
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	mov r8, r1
	str r2, [sp, #4]
	ldr r1, [sp, #0x30]
	ldr r2, [sp, #0x34]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r9, r0
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	mov sl, r3
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	str r1, [sp, #8]
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	str r2, [sp, #0xc]
	movs r4, #1
	ldr r2, _080B2A6C  @ gPaletteBuffer
	movs r0, #0x80
	lsls r0, r0, #1
	ldr r1, _080B2A70  @ 0x0000021E
	adds r5, r2, r1
	ldr r3, [sp, #0xc]
	adds r0, r3, r0
	mov r3, r9
	lsls r1, r3, #5
	lsls r0, r0, #1
	adds r0, r0, r2
	adds r3, r0, #2
	ldr r0, _080B2A74  @ 0x00000222
	adds r1, r1, r0
	adds r1, r1, r2
_080B2A60:
	ldr r2, [sp, #0xc]
	adds r0, r4, r2
	cmp r0, #0xf
	ble _080B2A78
	ldrh r0, [r5]
	b _080B2A7A
	.align 2, 0
_080B2A6C: .4byte gPaletteBuffer
_080B2A70: .4byte 0x0000021E
_080B2A74: .4byte 0x00000222
_080B2A78:
	ldrh r0, [r3]
_080B2A7A:
	strh r0, [r1]
	mov r7, r9
	adds r7, #1
	adds r1, #2
	adds r3, #2
	adds r4, #1
	cmp r4, #0xf
	ble _080B2A60
	bl EnablePaletteSync
	ldr r3, [sp, #8]
	cmp r3, #8
	bls _080B2B74
	mov r0, sl
	cmp r0, #7
	bhi _080B2A9E
	movs r1, #8
	mov sl, r1
_080B2A9E:
	ldr r4, _080B2B34  @ gSinLookup
	ldr r2, _080B2B38  @ gCosLookup
	movs r3, #0
	ldrsh r0, [r2, r3]
	lsls r0, r0, #4
	mov r1, sl
	bl Div
	adds r6, r0, #0
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	movs r1, #0
	ldrsh r0, [r4, r1]
	negs r0, r0
	lsls r0, r0, #4
	ldr r1, [sp, #8]
	bl Div
	adds r5, r0, #0
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	movs r2, #0
	ldrsh r0, [r4, r2]
	lsls r0, r0, #4
	mov r1, sl
	bl Div
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	ldr r3, _080B2B38  @ gCosLookup
	movs r1, #0
	ldrsh r0, [r3, r1]
	lsls r0, r0, #4
	ldr r1, [sp, #8]
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	mov r0, r9
	adds r1, r6, #0
	adds r2, r5, #0
	adds r3, r4, #0
	bl WriteOAMRotScaleData
	ldr r2, [sp, #0xc]
	cmp r2, #0
	beq _080B2B44
	ldr r0, _080B2B3C  @ 0x000001FF
	mov r3, r8
	ands r3, r0
	mov r8, r3
	mov r2, r9
	lsls r1, r2, #9
	add r1, r8
	ldr r3, [sp, #4]
	ands r3, r0
	str r3, [sp, #4]
	ldr r3, _080B2B40  @ gUnknown_08A2EF48
	lsls r0, r2, #1
	movs r2, #0xf
	ands r7, r2
	lsls r2, r7, #0xc
	adds r0, r0, r2
	movs r2, #0x80
	lsls r2, r2, #4
	adds r0, r0, r2
	str r0, [sp]
	movs r0, #4
	ldr r2, [sp, #4]
	bl PutSpriteExt
	b _080B2B74
	.align 2, 0
_080B2B34: .4byte gSinLookup
_080B2B38: .4byte gCosLookup
_080B2B3C: .4byte 0x000001FF
_080B2B40: .4byte gUnknown_08A2EF48
_080B2B44:
	ldr r0, _080B2B84  @ 0x000001FF
	mov r3, r8
	ands r3, r0
	mov r8, r3
	mov r2, r9
	lsls r1, r2, #9
	add r1, r8
	ldr r3, [sp, #4]
	ands r3, r0
	str r3, [sp, #4]
	ldr r3, _080B2B88  @ gUnknown_08A2EF48
	lsls r0, r2, #1
	movs r2, #0xf
	ands r7, r2
	lsls r2, r7, #0xc
	adds r0, r0, r2
	movs r2, #0x80
	lsls r2, r2, #3
	adds r0, r0, r2
	str r0, [sp]
	movs r0, #4
	ldr r2, [sp, #4]
	bl PutSpriteExt
_080B2B74:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B2B84: .4byte 0x000001FF
_080B2B88: .4byte gUnknown_08A2EF48

	THUMB_FUNC_END sub_80B2A14

	THUMB_FUNC_START sub_80B2B8C
sub_80B2B8C: @ 0x080B2B8C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x1c
	adds r7, r0, #0
	ldr r1, _080B2D8C  @ gUnknown_08205E94
	add r0, sp, #4
	movs r2, #0x18
	bl memcpy
	add r0, sp, #4
	bl SetupBackgrounds
	ldr r3, _080B2D90  @ gLCDControlBuffer
	ldrb r1, [r3]
	movs r0, #8
	negs r0, r0
	ands r0, r1
	movs r1, #1
	orrs r0, r1
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
	ldrb r0, [r3, #1]
	movs r1, #2
	negs r1, r1
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	movs r0, #4
	orrs r1, r0
	movs r0, #9
	negs r0, r0
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
	movs r4, #0
	str r4, [sp]
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
	strh r4, [r7, #0x2a]
	ldr r0, _080B2D94  @ gUnknown_03001D50
	str r0, [r7, #0x34]
	movs r2, #0
	movs r1, #0x13
	adds r0, #0x4c
_080B2C48:
	str r2, [r0]
	subs r0, #4
	subs r1, #1
	cmp r1, #0
	bge _080B2C48
	movs r0, #0
	str r0, [r7, #0x38]
	ldr r0, _080B2D98  @ gBG0TilemapBuffer
	movs r1, #0
	bl BG_Fill
	ldr r0, _080B2D9C  @ gUnknown_08A37300
	movs r1, #0x80
	lsls r1, r1, #2
	movs r2, #0x20
	bl CopyToPaletteBuffer
	ldr r0, [r7, #0x40]
	ldrb r0, [r0, #5]
	movs r1, #0
	bl sub_80B369C
	adds r4, r0, #0
	movs r6, #0
	bl strlen
	adds r1, r7, #0
	adds r1, #0x2e
	strb r0, [r1]
	movs r0, #0
	ldrsb r0, [r4, r0]
	mov sl, r1
	cmp r0, #0
	beq _080B2CD2
	ldr r0, _080B2DA0  @ gUnknown_08A2F2C0
	mov r8, r0
	movs r1, #0xb0
	lsls r1, r1, #1
	add r1, r8
	mov r9, r1
	ldr r5, _080B2DA4  @ gUnknown_02020188
_080B2C9A:
	movs r0, #0
	ldrsb r0, [r4, r0]
	lsls r0, r0, #2
	add r0, r8
	ldr r0, [r0]
	cmp r0, #0
	bne _080B2CAC
	mov r1, r9
	ldr r0, [r1]
_080B2CAC:
	adds r1, r5, #0
	bl CopyDataWithPossibleUncomp
	ldr r0, _080B2DA8  @ 0x06010000
	adds r1, r6, r0
	adds r0, r5, #0
	movs r2, #2
	movs r3, #4
	bl CopyTileGfxForObj
	adds r4, #1
	adds r0, r6, #0
	adds r0, #0x40
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	movs r0, #0
	ldrsb r0, [r4, r0]
	cmp r0, #0
	bne _080B2C9A
_080B2CD2:
	ldr r4, _080B2DAC  @ gUnknown_08A30780
	movs r1, #0xf0
	lsls r1, r1, #2
	adds r0, r4, #0
	movs r2, #0x20
	bl CopyToPaletteBuffer
	movs r1, #0xf8
	lsls r1, r1, #2
	adds r0, r4, #0
	movs r2, #0x20
	bl CopyToPaletteBuffer
	ldr r0, _080B2DB0  @ gUnknown_08A301B0
	ldr r1, _080B2DB4  @ 0x06016000
	bl CopyDataWithPossibleUncomp
	mov r1, sl
	ldrb r0, [r1]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	movs r0, #0xf0
	subs r0, r0, r1
	asrs r0, r0, #1
	subs r0, #8
	strh r0, [r7, #0x2c]
	adds r0, r7, #0
	movs r1, #0
	bl sub_80B305C
	ldr r1, [r7, #0x34]
	str r0, [r1]
	ldr r0, _080B2DB8  @ gUnknown_08A360E8
	movs r1, #0xc0
	lsls r1, r1, #0x13
	bl CopyDataWithPossibleUncomp
	ldr r0, _080B2DBC  @ gUnknown_08A36284
	ldr r4, _080B2DA4  @ gUnknown_02020188
	adds r1, r4, #0
	bl CopyDataWithPossibleUncomp
	ldr r0, _080B2DC0  @ gUnknown_02022E68
	movs r2, #0x80
	lsls r2, r2, #7
	adds r1, r4, #0
	bl CallARM_FillTileRect
	ldr r0, _080B2DC4  @ gUnknown_08A35A3C
	ldr r1, _080B2DC8  @ 0x06000800
	bl CopyDataWithPossibleUncomp
	ldr r0, _080B2DCC  @ gUnknown_08A35FD0
	adds r1, r4, #0
	bl CopyDataWithPossibleUncomp
	ldr r0, _080B2DD0  @ gBG1TilemapBuffer
	ldr r2, _080B2DD4  @ 0x00005040
	adds r1, r4, #0
	bl CallARM_FillTileRect
	ldr r0, _080B2DD8  @ gUnknown_08A360C8
	movs r1, #0xa0
	movs r2, #0x20
	bl CopyToPaletteBuffer
	ldr r0, _080B2DDC  @ gUnknown_08B17B64
	ldr r1, _080B2DE0  @ 0x06008000
	bl CopyDataWithPossibleUncomp
	ldr r0, _080B2DE4  @ gBG2TilemapBuffer
	ldr r1, _080B2DE8  @ gUnknown_08B18D68
	movs r2, #0
	movs r3, #5
	bl sub_800154C
	ldr r0, _080B2DEC  @ gUnknown_08B18ED4
	movs r1, #0
	movs r2, #0x60
	bl CopyToPaletteBuffer
	movs r0, #4
	bl BG_EnableSyncByMask
	add sp, #0x1c
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B2D8C: .4byte gUnknown_08205E94
_080B2D90: .4byte gLCDControlBuffer
_080B2D94: .4byte gUnknown_03001D50
_080B2D98: .4byte gBG0TilemapBuffer
_080B2D9C: .4byte gUnknown_08A37300
_080B2DA0: .4byte gUnknown_08A2F2C0
_080B2DA4: .4byte gUnknown_02020188
_080B2DA8: .4byte 0x06010000
_080B2DAC: .4byte gUnknown_08A30780
_080B2DB0: .4byte gUnknown_08A301B0
_080B2DB4: .4byte 0x06016000
_080B2DB8: .4byte gUnknown_08A360E8
_080B2DBC: .4byte gUnknown_08A36284
_080B2DC0: .4byte gUnknown_02022E68
_080B2DC4: .4byte gUnknown_08A35A3C
_080B2DC8: .4byte 0x06000800
_080B2DCC: .4byte gUnknown_08A35FD0
_080B2DD0: .4byte gBG1TilemapBuffer
_080B2DD4: .4byte 0x00005040
_080B2DD8: .4byte gUnknown_08A360C8
_080B2DDC: .4byte gUnknown_08B17B64
_080B2DE0: .4byte 0x06008000
_080B2DE4: .4byte gBG2TilemapBuffer
_080B2DE8: .4byte gUnknown_08B18D68
_080B2DEC: .4byte gUnknown_08B18ED4

	THUMB_FUNC_END sub_80B2B8C

	THUMB_FUNC_START sub_80B2DF0
sub_80B2DF0: @ 0x080B2DF0
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2a]
	asrs r0, r0, #1
	movs r3, #0x10
	subs r3, r3, r0
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl SetSpecialColorEffectsParameters
	movs r0, #1
	bl sub_8001F48
	ldrh r0, [r4, #0x2a]
	adds r0, #1
	strh r0, [r4, #0x2a]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x20
	bne _080B2E28
	movs r0, #0
	strh r0, [r4, #0x2a]
	adds r0, r4, #0
	bl Proc_Break
_080B2E28:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80B2DF0

	THUMB_FUNC_START sub_80B2E30
sub_80B2E30: @ 0x080B2E30
	push {r4, r5, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2a]
	cmp r0, #0x3c
	bne _080B2E4E
	ldr r0, [r4, #0x40]
	ldrb r1, [r0, #5]
	adds r0, r4, #0
	bl sub_80B325C
	str r0, [r4, #0x38]
	ldr r0, _080B2E60  @ gUnknown_08A2F038
	adds r1, r4, #0
	bl Proc_Start
_080B2E4E:
	ldrh r0, [r4, #0x2a]
	cmp r0, #0x5f
	bls _080B2E64
	adds r0, r4, #0
	bl Proc_Break
	movs r0, #0
	b _080B2E9E
	.align 2, 0
_080B2E60: .4byte gUnknown_08A2F038
_080B2E64:
	cmp r0, #0xf
	bls _080B2E9A
	ldrh r0, [r4, #0x2a]
	adds r1, r0, #0
	subs r1, #0x10
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _080B2E9A
	lsrs r0, r1, #0x1f
	adds r0, r1, r0
	asrs r5, r0, #1
	adds r1, r5, #1
	adds r0, r4, #0
	adds r0, #0x2e
	ldrb r0, [r0]
	cmp r1, r0
	bge _080B2E9A
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r4, #0
	bl sub_80B305C
	ldr r2, [r4, #0x34]
	lsls r1, r5, #2
	adds r1, r1, r2
	str r0, [r1, #4]
_080B2E9A:
	ldrh r0, [r4, #0x2a]
	adds r0, #1
_080B2E9E:
	strh r0, [r4, #0x2a]
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80B2E30

	THUMB_FUNC_START sub_80B2EA8
sub_80B2EA8: @ 0x080B2EA8
	push {r4, r5, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2a]
	cmp r0, #0x14
	bne _080B2EBA
	ldr r0, [r4, #0x38]
	movs r1, #4
	bl Proc_Goto
_080B2EBA:
	ldrh r0, [r4, #0x2a]
	cmp r0, #0x4f
	bls _080B2ECA
	adds r0, r4, #0
	bl Proc_Break
	movs r0, #0
	b _080B2F00
_080B2ECA:
	ldrh r5, [r4, #0x2a]
	adds r0, r5, #0
	movs r1, #3
	bl __umodsi3
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _080B2EFC
	adds r0, r5, #0
	movs r1, #3
	bl __udivsi3
	adds r2, r4, #0
	adds r2, #0x2e
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	ldrb r2, [r2]
	cmp r1, r2
	bcs _080B2EFC
	ldr r0, [r4, #0x34]
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r0, [r1]
	bl Proc_Break
_080B2EFC:
	ldrh r0, [r4, #0x2a]
	adds r0, #1
_080B2F00:
	strh r0, [r4, #0x2a]
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80B2EA8

	THUMB_FUNC_START sub_80B2F08
sub_80B2F08: @ 0x080B2F08
	ldr r2, _080B2F28  @ gLCDControlBuffer
	ldrb r1, [r2, #1]
	movs r0, #2
	negs r0, r0
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	movs r1, #5
	negs r1, r1
	ands r0, r1
	subs r1, #4
	ands r0, r1
	subs r1, #8
	ands r0, r1
	strb r0, [r2, #1]
	bx lr
	.align 2, 0
_080B2F28: .4byte gLCDControlBuffer

	THUMB_FUNC_END sub_80B2F08

	THUMB_FUNC_START sub_80B2F2C
sub_80B2F2C: @ 0x080B2F2C
	push {lr}
	bl sub_80ADDD4
	movs r0, #3
	bl sub_80B29B8
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80B2F2C

	THUMB_FUNC_START sub_80B2F3C
sub_80B2F3C: @ 0x080B2F3C
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _080B2F54  @ gUnknown_08A2EF50
	adds r1, r4, #0
	bl Proc_Start
	str r4, [r0, #0x3c]
	str r5, [r0, #0x40]
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080B2F54: .4byte gUnknown_08A2EF50

	THUMB_FUNC_END sub_80B2F3C

	THUMB_FUNC_START sub_80B2F58
sub_80B2F58: @ 0x080B2F58
	movs r1, #0
	strh r1, [r0, #0x2a]
	ldr r3, [r0, #0x14]
	adds r1, r0, #0
	adds r1, #0x2c
	ldrb r2, [r1]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #2
	ldrh r3, [r3, #0x2c]
	adds r1, r1, r3
	strh r1, [r0, #0x2e]
	bx lr

	THUMB_FUNC_END sub_80B2F58

	THUMB_FUNC_START sub_80B2F74
sub_80B2F74: @ 0x080B2F74
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r4, r0, #0
	ldrh r3, [r4, #0x2a]
	adds r1, r3, #0
	asrs r1, r1, #4
	movs r0, #0x10
	subs r0, r0, r1
	lsls r0, r0, #1
	adds r1, r4, #0
	adds r1, #0x2c
	ldrb r5, [r1]
	movs r2, #0x2e
	ldrsh r1, [r4, r2]
	subs r2, r1, r0
	movs r6, #0x80
	lsls r6, r6, #1
	str r6, [sp]
	ldrh r0, [r4, #0x2a]
	asrs r0, r0, #4
	movs r1, #0x10
	subs r1, r1, r0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	str r1, [sp, #4]
	adds r0, r5, #0
	adds r1, r2, #0
	movs r2, #0x18
	bl sub_80B2A14
	ldrh r0, [r4, #0x2a]
	adds r0, #0x10
	strh r0, [r4, #0x2a]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, r6
	bne _080B2FC8
	movs r0, #0
	strh r0, [r4, #0x2a]
	adds r0, r4, #0
	bl Proc_Break
_080B2FC8:
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80B2F74

	THUMB_FUNC_START sub_80B2FD0
sub_80B2FD0: @ 0x080B2FD0
	push {r4, r5, lr}
	sub sp, #8
	adds r4, r0, #0
	adds r0, #0x2c
	ldrb r0, [r0]
	movs r2, #0x2e
	ldrsh r1, [r4, r2]
	movs r3, #0x80
	lsls r3, r3, #1
	str r3, [sp]
	movs r5, #0
	str r5, [sp, #4]
	movs r2, #0x18
	bl sub_80B2A14
	strh r5, [r4, #0x2a]
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80B2FD0

	THUMB_FUNC_START sub_80B2FF8
sub_80B2FF8: @ 0x080B2FF8
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r4, r0, #0
	ldrh r0, [r4, #0x2a]
	movs r5, #0x80
	lsls r5, r5, #1
	adds r1, r0, r5
	subs r0, r5, r0
	adds r7, r4, #0
	adds r7, #0x2c
	ldrb r2, [r7]
	movs r6, #0x2e
	ldrsh r3, [r4, r6]
	lsls r1, r1, #0x10
	lsrs r6, r1, #0x10
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp]
	ldrh r0, [r4, #0x2a]
	asrs r0, r0, #4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #4]
	adds r0, r2, #0
	adds r1, r3, #0
	movs r2, #0x18
	adds r3, r6, #0
	bl sub_80B2A14
	ldrh r0, [r4, #0x2a]
	cmp r0, r5
	bne _080B304C
	ldr r1, [r4, #0x14]
	ldrb r0, [r7]
	ldr r1, [r1, #0x34]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r1, #0
	str r1, [r0]
	adds r0, r4, #0
	bl Proc_Break
_080B304C:
	ldrh r0, [r4, #0x2a]
	adds r0, #8
	strh r0, [r4, #0x2a]
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80B2FF8

	THUMB_FUNC_START sub_80B305C
sub_80B305C: @ 0x080B305C
	push {r4, lr}
	adds r2, r0, #0
	lsls r4, r1, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _080B3078  @ gUnknown_08A2EFC0
	adds r1, r2, #0
	bl Proc_Start
	adds r1, r0, #0
	adds r1, #0x2c
	strb r4, [r1]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080B3078: .4byte gUnknown_08A2EFC0

	THUMB_FUNC_END sub_80B305C

	THUMB_FUNC_START sub_80B307C
sub_80B307C: @ 0x080B307C
	push {lr}
	bl EnablePaletteSync
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80B307C

	THUMB_FUNC_START sub_80B3088
sub_80B3088: @ 0x080B3088
	push {r4, r5, r6, r7, lr}
	adds r3, r0, #0
	movs r0, #0
	strh r0, [r3, #0x2a]
	ldr r0, _080B30F8  @ gPaletteBuffer
	movs r2, #0
	adds r1, r0, #0
	adds r1, #0x80
	movs r4, #0xf8
	lsls r4, r4, #2
	adds r0, r0, r4
	movs r4, #0xf
_080B30A0:
	strh r2, [r0]
	strh r2, [r1]
	adds r1, #2
	adds r0, #2
	subs r4, #1
	cmp r4, #0
	bge _080B30A0
	adds r0, r3, #0
	adds r0, #0x2e
	movs r1, #0
	strb r1, [r0]
	adds r2, r3, #0
	adds r2, #0x2d
	strb r1, [r2]
	movs r4, #0
	adds r7, r3, #0
	adds r7, #0x2c
	adds r6, r0, #0
	adds r5, r2, #0
_080B30C6:
	ldrb r0, [r7]
	bl GetClassData
	adds r0, #0x2c
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0
	beq _080B30E6
	movs r0, #1
	lsls r0, r4
	ldrb r1, [r6]
	orrs r0, r1
	strb r0, [r6]
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
_080B30E6:
	adds r4, #1
	cmp r4, #7
	ble _080B30C6
	bl EnablePaletteSync
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B30F8: .4byte gPaletteBuffer

	THUMB_FUNC_END sub_80B3088

	THUMB_FUNC_START sub_80B30FC
sub_80B30FC: @ 0x080B30FC
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov ip, r0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov r8, r1
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	mov r9, r2
	movs r4, #0
	ldr r7, _080B31A4  @ gPaletteBuffer
	adds r5, r7, #0
	adds r5, #0x80
	lsls r2, r0, #0x10
	movs r0, #0xf8
	lsls r0, r0, #2
	adds r3, r7, r0
_080B3128:
	mov r1, ip
	adds r0, r1, r4
	movs r1, #0xf
	cmp r0, #0xf
	bgt _080B3134
	lsrs r1, r2, #0x10
_080B3134:
	movs r6, #0xf0
	lsls r6, r6, #1
	adds r0, r1, r6
	lsls r0, r0, #1
	adds r0, r0, r7
	ldrh r1, [r0]
	strh r1, [r3]
	ldrh r0, [r0]
	strh r0, [r5]
	adds r5, #2
	movs r0, #0x80
	lsls r0, r0, #9
	adds r2, r2, r0
	adds r3, #2
	adds r4, #1
	cmp r4, #0xf
	ble _080B3128
	bl EnablePaletteSync
	movs r0, #8
	mov r1, r8
	subs r0, r0, r1
	lsls r0, r0, #4
	movs r4, #0
	ldr r6, _080B31A8  @ gUnknown_08A2F1D0
	adds r5, r0, #0
	subs r5, #8
_080B316A:
	mov r0, r9
	asrs r0, r4
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _080B318C
	ldr r1, _080B31AC  @ 0x000001FF
	ands r1, r5
	ldr r3, [r6]
	movs r0, #0xf0
	lsls r0, r0, #8
	str r0, [sp]
	movs r0, #4
	movs r2, #0x50
	bl PutSpriteExt
	adds r5, #0x20
_080B318C:
	adds r6, #4
	adds r4, #1
	cmp r4, #7
	ble _080B316A
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B31A4: .4byte gPaletteBuffer
_080B31A8: .4byte gUnknown_08A2F1D0
_080B31AC: .4byte 0x000001FF

	THUMB_FUNC_END sub_80B30FC

	THUMB_FUNC_START sub_80B31B0
sub_80B31B0: @ 0x080B31B0
	push {r4, r5, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2a]
	adds r0, #1
	strh r0, [r4, #0x2a]
	lsls r1, r0, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0x20
	bls _080B31CC
	movs r5, #0
	adds r0, r4, #0
	bl Proc_Break
	b _080B31D6
_080B31CC:
	lsrs r1, r1, #0x11
	movs r0, #0x10
	subs r0, r0, r1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
_080B31D6:
	adds r0, r4, #0
	adds r0, #0x2d
	ldrb r1, [r0]
	adds r0, #1
	ldrb r2, [r0]
	adds r0, r5, #0
	bl sub_80B30FC
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80B31B0

	THUMB_FUNC_START sub_80B31EC
sub_80B31EC: @ 0x080B31EC
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2d
	ldrb r1, [r0]
	adds r0, #1
	ldrb r2, [r0]
	movs r0, #0
	bl sub_80B30FC
	movs r0, #0
	strh r0, [r4, #0x2a]
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80B31EC

	THUMB_FUNC_START sub_80B3208
sub_80B3208: @ 0x080B3208
	push {lr}
	adds r3, r0, #0
	ldrh r0, [r3, #0x2a]
	adds r0, #1
	strh r0, [r3, #0x2a]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x11
	cmp r0, #0x10
	bls _080B3244
	ldr r2, _080B3240  @ gLCDControlBuffer
	ldrb r1, [r2, #1]
	movs r0, #2
	negs r0, r0
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	movs r1, #5
	negs r1, r1
	ands r0, r1
	subs r1, #4
	ands r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2, #1]
	adds r0, r3, #0
	bl Proc_Break
	b _080B3258
	.align 2, 0
_080B3240: .4byte gLCDControlBuffer
_080B3244:
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r1, r3, #0
	adds r1, #0x2d
	ldrb r1, [r1]
	adds r2, r3, #0
	adds r2, #0x2e
	ldrb r2, [r2]
	bl sub_80B30FC
_080B3258:
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80B3208

	THUMB_FUNC_START sub_80B325C
sub_80B325C: @ 0x080B325C
	push {r4, lr}
	adds r2, r0, #0
	lsls r4, r1, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _080B3278  @ gUnknown_08A2EFF8
	adds r1, r2, #0
	bl Proc_Start
	adds r1, r0, #0
	adds r1, #0x2c
	strb r4, [r1]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080B3278: .4byte gUnknown_08A2EFF8

	THUMB_FUNC_END sub_80B325C

	THUMB_FUNC_START sub_80B327C
sub_80B327C: @ 0x080B327C
	adds r1, r0, #0
	adds r1, #0x4c
	movs r2, #0
	strh r2, [r1]
	adds r0, #0x4e
	strh r2, [r0]
	ldr r2, _080B32A8  @ gLCDControlBuffer
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
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2, #1]
	bx lr
	.align 2, 0
_080B32A8: .4byte gLCDControlBuffer

	THUMB_FUNC_END sub_80B327C

	THUMB_FUNC_START sub_80B32AC
sub_80B32AC: @ 0x080B32AC
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
	bgt _080B32E6
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
	b _080B330A
_080B32E6:
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
_080B330A:
	bl Interpolate
	mov sl, r0
	cmp r7, #0x31
	ble _080B3318
	movs r0, #0x64
	subs r7, r0, r7
_080B3318:
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
	ble _080B33D0
	mov r0, r9
	bl Proc_Break
	ldr r2, _080B33E0  @ gLCDControlBuffer
	ldrb r0, [r2, #1]
	movs r1, #1
	orrs r0, r1
	movs r1, #2
	orrs r0, r1
	movs r1, #5
	negs r1, r1
	ands r0, r1
	subs r1, #4
	ands r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2, #1]
_080B33D0:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B33E0: .4byte gLCDControlBuffer

	THUMB_FUNC_END sub_80B32AC

	THUMB_FUNC_START sub_80B33E4
sub_80B33E4: @ 0x080B33E4
	adds r2, r0, #0
	adds r0, #0x4c
	movs r1, #0
	strh r1, [r0]
	adds r0, #0x18
	strh r1, [r0]
	adds r0, #2
	strh r1, [r0]
	adds r0, #2
	strh r1, [r0]
	bx lr

	THUMB_FUNC_END sub_80B33E4

	THUMB_FUNC_START sub_80B33FC
sub_80B33FC: @ 0x080B33FC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r4, r0, #0
	adds r6, r1, #0
	mov r8, r3
	adds r4, #0x4c
	movs r0, #0
	ldrsh r3, [r4, r0]
	movs r5, #0x46
	str r5, [sp]
	movs r0, #5
	movs r1, #0x78
	bl Interpolate
	adds r7, r0, #0
	movs r0, #0
	ldrsh r3, [r4, r0]
	str r5, [sp]
	movs r0, #5
	movs r1, #0x50
	mov r2, r8
	bl Interpolate
	mov sl, r0
	adds r1, r7, #0
	subs r1, #8
	ldr r4, _080B3490  @ 0x000001FF
	ands r1, r4
	lsls r6, r6, #9
	orrs r1, r6
	mov r2, sl
	subs r2, #8
	ands r2, r4
	movs r0, #0x80
	lsls r0, r0, #1
	mov r8, r0
	orrs r2, r0
	ldr r0, _080B3494  @ gUnknown_08A2F1F0
	mov r9, r0
	movs r5, #0xf0
	lsls r5, r5, #8
	str r5, [sp]
	movs r0, #4
	mov r3, r9
	bl PutSpriteExt
	movs r1, #0xe8
	subs r1, r1, r7
	ands r1, r4
	orrs r1, r6
	movs r2, #0x98
	mov r0, sl
	subs r2, r2, r0
	ands r2, r4
	mov r0, r8
	orrs r2, r0
	str r5, [sp]
	movs r0, #4
	mov r3, r9
	bl PutSpriteExt
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B3490: .4byte 0x000001FF
_080B3494: .4byte gUnknown_08A2F1F0

	THUMB_FUNC_END sub_80B33FC

	THUMB_FUNC_START sub_80B3498
sub_80B3498: @ 0x080B3498
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov sl, r0
	movs r0, #0x64
	add r0, sl
	mov r9, r0
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0x46
	bgt _080B3534
	movs r1, #0x90
	lsls r1, r1, #1
	mov r2, r9
	movs r0, #0
	ldrsh r3, [r2, r0]
	movs r0, #0x46
	str r0, [sp]
	movs r0, #4
	movs r2, #0x10
	bl Interpolate
	adds r7, r0, #0
	ldr r4, _080B3698  @ gSinLookup
	movs r1, #0x80
	adds r1, r1, r4
	mov r8, r1
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #4
	adds r1, r7, #0
	bl Div
	adds r6, r0, #0
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	movs r1, #0
	ldrsh r0, [r4, r1]
	negs r0, r0
	lsls r0, r0, #4
	adds r1, r7, #0
	bl Div
	adds r5, r0, #0
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	movs r2, #0
	ldrsh r0, [r4, r2]
	lsls r0, r0, #4
	adds r1, r7, #0
	bl Div
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	mov r1, r8
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #4
	adds r1, r7, #0
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	movs r0, #0x15
	adds r1, r6, #0
	adds r2, r5, #0
	adds r3, r4, #0
	bl WriteOAMRotScaleData
	mov r1, r9
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
_080B3534:
	mov r0, sl
	movs r1, #0x15
	movs r2, #0xd7
	movs r3, #0x11
	bl sub_80B33FC
	movs r2, #0x66
	add r2, sl
	mov r9, r2
	movs r1, #0
	ldrsh r0, [r2, r1]
	cmp r0, #0x46
	bgt _080B35CA
	movs r1, #0x90
	lsls r1, r1, #1
	adds r3, r0, #0
	movs r0, #0x46
	str r0, [sp]
	movs r0, #0
	movs r2, #0x10
	bl Interpolate
	adds r7, r0, #0
	ldr r4, _080B3698  @ gSinLookup
	movs r1, #0x80
	adds r1, r1, r4
	mov r8, r1
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #4
	adds r1, r7, #0
	bl Div
	adds r6, r0, #0
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	movs r1, #0
	ldrsh r0, [r4, r1]
	negs r0, r0
	lsls r0, r0, #4
	adds r1, r7, #0
	bl Div
	adds r5, r0, #0
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	movs r2, #0
	ldrsh r0, [r4, r2]
	lsls r0, r0, #4
	adds r1, r7, #0
	bl Div
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	mov r1, r8
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #4
	adds r1, r7, #0
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	movs r0, #0x16
	adds r1, r6, #0
	adds r2, r5, #0
	adds r3, r4, #0
	bl WriteOAMRotScaleData
	mov r1, r9
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
_080B35CA:
	mov r0, sl
	movs r1, #0x16
	movs r2, #0xc0
	movs r3, #0x20
	bl sub_80B33FC
	movs r2, #0x68
	add r2, sl
	mov r9, r2
	movs r1, #0
	ldrsh r0, [r2, r1]
	cmp r0, #0x46
	bgt _080B3660
	movs r1, #0x90
	lsls r1, r1, #1
	adds r3, r0, #0
	movs r0, #0x46
	str r0, [sp]
	movs r0, #1
	movs r2, #0x10
	bl Interpolate
	adds r7, r0, #0
	ldr r4, _080B3698  @ gSinLookup
	movs r1, #0x80
	adds r1, r1, r4
	mov r8, r1
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #4
	adds r1, r7, #0
	bl Div
	adds r6, r0, #0
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	movs r1, #0
	ldrsh r0, [r4, r1]
	negs r0, r0
	lsls r0, r0, #4
	adds r1, r7, #0
	bl Div
	adds r5, r0, #0
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	movs r2, #0
	ldrsh r0, [r4, r2]
	lsls r0, r0, #4
	adds r1, r7, #0
	bl Div
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	mov r1, r8
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #4
	adds r1, r7, #0
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	movs r0, #0x17
	adds r1, r6, #0
	adds r2, r5, #0
	adds r3, r4, #0
	bl WriteOAMRotScaleData
	mov r1, r9
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
_080B3660:
	mov r0, sl
	movs r1, #0x17
	movs r2, #0xa9
	movs r3, #0x2f
	bl sub_80B33FC
	mov r0, sl
	adds r0, #0x4c
	ldrh r1, [r0]
	adds r1, #1
	strh r1, [r0]
	mov r2, r9
	movs r1, #0
	ldrsh r0, [r2, r1]
	cmp r0, #0x46
	ble _080B3686
	mov r0, sl
	bl Proc_Break
_080B3686:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B3698: .4byte gSinLookup

	THUMB_FUNC_END sub_80B3498

	THUMB_FUNC_START sub_80B369C
sub_80B369C: @ 0x080B369C
	push {r4, lr}
	adds r4, r1, #0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl GetClassData
	cmp r4, #0
	bne _080B36B6
	ldrh r0, [r0]
	bl GetStringFromIndex
	adds r4, r0, #0
	b _080B36BE
_080B36B6:
	ldrh r0, [r0]
	adds r1, r4, #0
	bl GetStringFromIndexInBuffer
_080B36BE:
	ldr r1, _080B36D8  @ gUnknown_08205ED0
	adds r0, r4, #0
	bl strstr
	cmp r0, #0
	beq _080B36D0
	ldr r1, _080B36DC  @ gUnknown_08205ED4
	bl sprintf
_080B36D0:
	adds r0, r4, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080B36D8: .4byte gUnknown_08205ED0
_080B36DC: .4byte gUnknown_08205ED4

	THUMB_FUNC_END sub_80B369C

	THUMB_FUNC_START sub_80B36E0
sub_80B36E0: @ 0x080B36E0
	push {lr}
	ldr r0, _080B3708  @ 0x04000006
	ldrh r0, [r0]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x6d
	bhi _080B3718
	ldr r3, _080B370C  @ 0x04000008
	ldrh r2, [r3]
	ldr r1, _080B3710  @ 0x0000FFFC
	adds r0, r1, #0
	ands r0, r2
	adds r0, #2
	strh r0, [r3]
	ldr r2, _080B3714  @ 0x0400000C
	ldrh r0, [r2]
	ands r1, r0
	adds r1, #2
	b _080B372E
	.align 2, 0
_080B3708: .4byte 0x04000006
_080B370C: .4byte 0x04000008
_080B3710: .4byte 0x0000FFFC
_080B3714: .4byte 0x0400000C
_080B3718:
	ldr r3, _080B3734  @ 0x04000008
	ldrh r2, [r3]
	ldr r1, _080B3738  @ 0x0000FFFC
	adds r0, r1, #0
	ands r0, r2
	adds r0, #1
	strh r0, [r3]
	ldr r2, _080B373C  @ 0x0400000C
	ldrh r0, [r2]
	ands r1, r0
	adds r1, #1
_080B372E:
	strh r1, [r2]
	pop {r0}
	bx r0
	.align 2, 0
_080B3734: .4byte 0x04000008
_080B3738: .4byte 0x0000FFFC
_080B373C: .4byte 0x0400000C

	THUMB_FUNC_END sub_80B36E0

	THUMB_FUNC_START sub_80B3740
sub_80B3740: @ 0x080B3740
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	movs r0, #1
	movs r1, #0x10
	movs r2, #0x10
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	movs r4, #0
	str r4, [sp]
	movs r0, #0
	movs r1, #1
	movs r2, #0
	movs r3, #0
	bl SetBlendTargetA
	movs r0, #1
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #1
	movs r3, #1
	bl SetBlendTargetB
	ldr r0, _080B37F8  @ gLCDControlBuffer
	mov ip, r0
	ldrb r0, [r0, #1]
	movs r6, #0x20
	orrs r0, r6
	movs r1, #0x41
	negs r1, r1
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	mov r1, ip
	strb r0, [r1, #1]
	mov r0, ip
	adds r0, #0x2d
	strb r4, [r0]
	adds r0, #4
	strb r4, [r0]
	adds r1, #0x2c
	movs r0, #0xf0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0xa0
	strb r0, [r1]
	movs r2, #0x34
	add r2, ip
	mov r8, r2
	ldrb r1, [r2]
	movs r2, #1
	orrs r1, r2
	movs r0, #2
	orrs r1, r0
	movs r5, #4
	orrs r1, r5
	movs r4, #8
	orrs r1, r4
	movs r3, #0x10
	orrs r1, r3
	mov r7, ip
	adds r7, #0x36
	ldrb r0, [r7]
	orrs r0, r2
	movs r2, #3
	negs r2, r2
	ands r0, r2
	orrs r0, r5
	orrs r0, r4
	orrs r0, r3
	orrs r1, r6
	mov r2, r8
	strb r1, [r2]
	movs r1, #0x21
	negs r1, r1
	ands r0, r1
	strb r0, [r7]
	mov r1, ip
	adds r1, #0x3d
	ldrb r0, [r1]
	orrs r0, r6
	strb r0, [r1]
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B37F8: .4byte gLCDControlBuffer

	THUMB_FUNC_END sub_80B3740

	THUMB_FUNC_START sub_80B37FC
sub_80B37FC: @ 0x080B37FC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x3c
	mov r9, r0
	movs r0, #0
	str r0, [sp, #0x34]
	add r1, sp, #4
	ldr r0, _080B3830  @ gUnknown_08205EDC
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	mov r1, r9
	ldr r0, [r1, #0x34]
	ldr r0, [r0, #0x10]
	str r0, [r1, #0x38]
	movs r7, #4
	b _080B3836
	.align 2, 0
_080B3830: .4byte gUnknown_08205EDC
_080B3834:
	adds r7, #1
_080B3836:
	cmp r7, #7
	bgt _080B3852
	mov r2, r9
	ldr r0, [r2, #0x34]
	ldrb r0, [r0, #5]
	bl GetClassData
	adds r0, #0x2c
	adds r0, r0, r7
	ldrb r0, [r0]
	cmp r0, #0
	beq _080B3834
	movs r3, #1
	str r3, [sp, #0x34]
_080B3852:
	movs r0, #0
	bl SetupBackgrounds
	movs r0, #0
	mov r4, r9
	strh r0, [r4, #0x2a]
	strh r0, [r4, #0x2c]
	mov r1, r9
	adds r1, #0x46
	movs r0, #0xfa
	strb r0, [r1]
	ldr r6, _080B3A28  @ gBG0TilemapBuffer
	adds r0, r6, #0
	movs r1, #0
	bl BG_Fill
	ldr r0, _080B3A2C  @ gBG1TilemapBuffer
	movs r1, #0
	bl BG_Fill
	ldr r0, _080B3A30  @ gBG2TilemapBuffer
	mov r8, r0
	movs r1, #0
	bl BG_Fill
	ldr r4, _080B3A34  @ gLCDControlBuffer
	ldrb r1, [r4, #1]
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
	strb r0, [r4, #1]
	ldrb r1, [r4]
	movs r0, #8
	negs r0, r0
	ands r0, r1
	strb r0, [r4]
	bl SetDefaultColorEffects
	bl Font_ResetAllocation
	bl Font_InitForUIDefault
	ldrb r2, [r4, #0xc]
	movs r1, #4
	negs r1, r1
	adds r0, r1, #0
	ands r0, r2
	movs r3, #2
	orrs r0, r3
	strb r0, [r4, #0xc]
	ldrb r2, [r4, #0x10]
	adds r0, r1, #0
	ands r0, r2
	orrs r0, r3
	strb r0, [r4, #0x10]
	ldrb r0, [r4, #0x14]
	ands r1, r0
	orrs r1, r3
	strb r1, [r4, #0x14]
	ldrb r0, [r4, #0x18]
	movs r1, #3
	orrs r0, r1
	strb r0, [r4, #0x18]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	movs r0, #3
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	ldr r4, _080B3A38  @ gUnknown_08A30E2C
	movs r0, #3
	bl GetBackgroundTileDataOffset
	adds r1, r0, #0
	movs r5, #0xc0
	lsls r5, r5, #0x13
	adds r1, r1, r5
	adds r0, r4, #0
	bl CopyDataWithPossibleUncomp
	ldr r0, _080B3A3C  @ gUnknown_08A3593C
	movs r2, #0x80
	lsls r2, r2, #1
	movs r1, #0xe0
	bl CopyToPaletteBuffer
	ldr r0, _080B3A40  @ gBG3TilemapBuffer
	ldr r1, _080B3A44  @ gUnknown_08A35488
	movs r2, #0xe0
	lsls r2, r2, #7
	bl CallARM_FillTileRect
	ldr r4, _080B3A48  @ gUnknown_08A30800
	movs r0, #2
	bl GetBackgroundTileDataOffset
	adds r1, r0, #0
	adds r1, r1, r5
	adds r0, r4, #0
	bl CopyDataWithPossibleUncomp
	ldr r0, _080B3A4C  @ gUiFramePaletteA
	movs r1, #0xc0
	movs r2, #0x20
	bl CopyToPaletteBuffer
	ldr r1, _080B3A50  @ gUnknown_08A30978
	movs r2, #0xc0
	lsls r2, r2, #7
	mov r0, r8
	bl CallARM_FillTileRect
	movs r0, #0xf
	bl BG_EnableSyncByMask
	adds r0, r6, #0
	movs r1, #0
	bl BG_Fill
	mov r1, r9
	ldr r0, [r1, #0x34]
	ldrb r0, [r0, #5]
	bl GetClassData
	ldrb r0, [r0, #0xb]
	mov r4, r9
	adds r4, #0x40
	strb r0, [r4]
	mov r2, r9
	ldr r0, [r2, #0x34]
	ldrb r0, [r0, #5]
	bl GetClassData
	ldrb r0, [r0, #0xc]
	mov r1, r9
	adds r1, #0x41
	strb r0, [r1]
	mov r3, r9
	ldr r0, [r3, #0x34]
	ldrb r0, [r0, #5]
	bl GetClassData
	ldrb r0, [r0, #0xd]
	mov r1, r9
	adds r1, #0x42
	strb r0, [r1]
	mov r1, r9
	ldr r0, [r1, #0x34]
	ldrb r0, [r0, #5]
	bl GetClassData
	ldrb r0, [r0, #0xe]
	mov r1, r9
	adds r1, #0x43
	strb r0, [r1]
	mov r2, r9
	ldr r0, [r2, #0x34]
	ldrb r0, [r0, #5]
	bl GetClassData
	ldrb r1, [r0, #0xf]
	mov r0, r9
	adds r0, #0x44
	strb r1, [r0]
	mov r3, r9
	ldr r0, [r3, #0x34]
	ldrb r0, [r0, #5]
	bl GetClassData
	ldrb r0, [r0, #0x10]
	mov r1, r9
	adds r1, #0x45
	strb r0, [r1]
	movs r7, #0
	str r4, [sp, #0x38]
	movs r4, #0x4a
	adds r4, r4, r6
	mov sl, r4
	adds r6, #0x42
	mov r8, r6
	movs r6, #0
	movs r4, #0
_080B39EC:
	ldr r0, _080B3A54  @ gUnknown_0201FB28
	adds r5, r4, r0
	adds r0, r5, #0
	movs r1, #3
	bl Text_Init
	adds r0, r5, #0
	bl Text_Clear
	adds r0, r5, #0
	movs r1, #3
	bl Text_SetColorId
	adds r0, r5, #0
	movs r1, #0
	bl Text_SetXCursor
	ldr r0, [sp, #0x34]
	cmp r0, #0
	beq _080B3A58
	add r0, sp, #0x1c
	adds r0, r0, r6
	ldr r0, [r0]
	bl GetStringFromIndex
	adds r1, r0, #0
	adds r0, r5, #0
	bl Text_AppendString
	b _080B3A6C
	.align 2, 0
_080B3A28: .4byte gBG0TilemapBuffer
_080B3A2C: .4byte gBG1TilemapBuffer
_080B3A30: .4byte gBG2TilemapBuffer
_080B3A34: .4byte gLCDControlBuffer
_080B3A38: .4byte gUnknown_08A30E2C
_080B3A3C: .4byte gUnknown_08A3593C
_080B3A40: .4byte gBG3TilemapBuffer
_080B3A44: .4byte gUnknown_08A35488
_080B3A48: .4byte gUnknown_08A30800
_080B3A4C: .4byte gUiFramePaletteA
_080B3A50: .4byte gUnknown_08A30978
_080B3A54: .4byte gUnknown_0201FB28
_080B3A58:
	mov r0, sp
	adds r0, r0, r6
	adds r0, #4
	ldr r0, [r0]
	bl GetStringFromIndex
	adds r1, r0, #0
	adds r0, r5, #0
	bl Text_AppendString
_080B3A6C:
	ldr r0, _080B3BD0  @ gUnknown_0201FB28
	adds r0, r4, r0
	mov r1, r8
	bl Text_Draw
	ldr r1, [sp, #0x38]
	adds r0, r1, r7
	ldrb r2, [r0]
	mov r0, sl
	movs r1, #0
	bl sub_8004B88
	movs r2, #0x80
	add sl, r2
	add r8, r2
	adds r6, #4
	adds r4, #8
	adds r7, #1
	cmp r7, #5
	ble _080B39EC
	movs r5, #0
	mov r0, r9
	bl sub_80B40D0
	mov r3, r9
	str r0, [r3, #0x3c]
	movs r0, #0x80
	lsls r0, r0, #1
	movs r1, #2
	movs r2, #0
	bl sub_800680C
	bl sub_8006978
	bl sub_8008250
	bl sub_8006A7C
	mov r4, r9
	ldr r0, [r4, #0x34]
	ldr r2, [r0]
	movs r0, #2
	movs r1, #0xf
	bl sub_8006A30
	movs r0, #0
	bl sub_8006B10
	movs r0, #1
	bl sub_8006AA8
	movs r0, #2
	bl sub_8006AA8
	movs r0, #4
	bl sub_8006AA8
	movs r0, #8
	bl sub_8006AA8
	movs r0, #0x40
	bl sub_8006AA8
	movs r0, #4
	bl sub_8006AF0
	ldr r0, _080B3BD4  @ gUnknown_02000000
	ldr r3, [r4, #0x34]
	movs r1, #4
	ldrsb r1, [r3, r1]
	strh r1, [r0, #8]
	movs r1, #0x82
	lsls r1, r1, #1
	strh r1, [r0, #2]
	movs r1, #0x58
	strh r1, [r0, #4]
	ldrb r1, [r3, #7]
	strh r1, [r0, #6]
	movs r1, #6
	strh r1, [r0, #0xa]
	ldrb r1, [r3, #6]
	strb r1, [r0, #1]
	movs r4, #1
	strh r4, [r0, #0xc]
	movs r1, #0xc0
	lsls r1, r1, #1
	strh r1, [r0, #0xe]
	movs r1, #2
	strh r1, [r0, #0x10]
	ldr r1, _080B3BD8  @ gUnknown_02000038
	str r1, [r0, #0x1c]
	ldr r1, _080B3BDC  @ gUnknown_02002038
	str r1, [r0, #0x24]
	ldr r1, _080B3BE0  @ gUnknown_02007838
	str r1, [r0, #0x20]
	ldr r1, _080B3BE4  @ gUnknown_020078D8
	str r1, [r0, #0x28]
	ldr r1, _080B3BE8  @ gUnknown_0200A2D8
	str r1, [r0, #0x30]
	ldrb r2, [r3, #8]
	strh r2, [r1]
	ldrb r2, [r3, #9]
	strh r2, [r1, #2]
	ldrb r2, [r3, #0xa]
	strh r2, [r1, #4]
	ldrb r2, [r3, #0xb]
	strh r2, [r1, #6]
	ldrb r2, [r3, #0xc]
	strh r2, [r1, #8]
	movs r2, #0xa0
	lsls r2, r2, #2
	strh r2, [r1, #0xe]
	movs r3, #0xf
	strh r3, [r1, #0x10]
	subs r2, #0x80
	strh r2, [r1, #0xa]
	strh r3, [r1, #0xc]
	strh r4, [r1, #0x12]
	ldr r2, _080B3BEC  @ gBG1TilemapBuffer
	str r2, [r1, #0x14]
	ldr r2, _080B3BF0  @ gUnknown_0200A300
	str r2, [r1, #0x18]
	ldr r2, _080B3BF4  @ gUnknown_0200C300
	str r2, [r1, #0x1c]
	ldr r2, _080B3BF8  @ gUnknown_0200CB00
	str r2, [r1, #0x20]
	ldr r2, _080B3BFC  @ sub_80B3740
	str r2, [r1, #0x24]
	bl sub_805AA00
	ldr r4, _080B3C00  @ gUnknown_0201DB00
	mov r0, r9
	ldr r1, [r0, #0x34]
	ldrb r0, [r1, #0xd]
	strh r0, [r4]
	movs r0, #0xa
	strh r0, [r4, #2]
	movs r0, #0xe0
	lsls r0, r0, #2
	strh r0, [r4, #4]
	ldrb r0, [r1, #0xe]
	strh r0, [r4, #6]
	movs r0, #0xb
	strh r0, [r4, #8]
	movs r0, #0xf0
	lsls r0, r0, #2
	strh r0, [r4, #0xa]
	strh r5, [r4, #0xc]
	ldr r0, _080B3C04  @ 0x0000FFFF
	strh r0, [r4, #0xe]
	ldr r0, _080B3C08  @ 0x06010000
	str r0, [r4, #0x1c]
	ldr r0, _080B3C0C  @ gUnknown_0201DB28
	str r0, [r4, #0x20]
	adds r0, r4, #0
	bl sub_805AA68
	movs r3, #0x98
	lsls r3, r3, #1
	movs r0, #0x68
	str r0, [sp]
	adds r0, r4, #0
	movs r1, #0xd0
	movs r2, #0x68
	bl sub_805AE40
	ldr r0, _080B3C10  @ sub_80B36E0
	bl SetPrimaryHBlankHandler
	add sp, #0x3c
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B3BD0: .4byte gUnknown_0201FB28
_080B3BD4: .4byte gUnknown_02000000
_080B3BD8: .4byte gUnknown_02000038
_080B3BDC: .4byte gUnknown_02002038
_080B3BE0: .4byte gUnknown_02007838
_080B3BE4: .4byte gUnknown_020078D8
_080B3BE8: .4byte gUnknown_0200A2D8
_080B3BEC: .4byte gBG1TilemapBuffer
_080B3BF0: .4byte gUnknown_0200A300
_080B3BF4: .4byte gUnknown_0200C300
_080B3BF8: .4byte gUnknown_0200CB00
_080B3BFC: .4byte sub_80B3740
_080B3C00: .4byte gUnknown_0201DB00
_080B3C04: .4byte 0x0000FFFF
_080B3C08: .4byte 0x06010000
_080B3C0C: .4byte gUnknown_0201DB28
_080B3C10: .4byte sub_80B36E0

	THUMB_FUNC_END sub_80B37FC

	THUMB_FUNC_START sub_80B3C14
sub_80B3C14: @ 0x080B3C14
	push {r4, lr}
	adds r4, r0, #0
	ldrh r1, [r4, #0x2c]
	movs r0, #0xc8
	lsls r0, r0, #1
	cmp r1, r0
	bne _080B3C44
	bl sub_80B2988
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080B3C3C
	movs r0, #0x3c
	bl Sound_FadeOutBGM
	adds r0, r4, #0
	movs r1, #7
	bl Proc_Goto
	b _080B3C44
_080B3C3C:
	adds r0, r4, #0
	movs r1, #4
	bl Proc_Goto
_080B3C44:
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80B3C14

	THUMB_FUNC_START sub_80B3C50
sub_80B3C50: @ 0x080B3C50
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r7, r0, #0
	movs r0, #0x46
	adds r0, r0, r7
	mov r9, r0
	ldrh r1, [r7, #0x2a]
	movs r0, #0x50
	subs r0, r0, r1
	movs r1, #0xe
	bl __divsi3
	mvns r0, r0
	mov r1, r9
	ldrb r1, [r1]
	adds r0, r0, r1
	mov r2, r9
	strb r0, [r2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xb3
	bhi _080B3C88
	movs r0, #0xb4
	strb r0, [r2]
_080B3C88:
	ldr r0, _080B3D38  @ gLCDControlBuffer
	mov ip, r0
	ldrb r0, [r0, #1]
	movs r1, #1
	mov r8, r1
	mov r2, r8
	orrs r0, r2
	movs r1, #2
	mov sl, r1
	mov r2, sl
	orrs r0, r2
	movs r5, #4
	orrs r0, r5
	movs r4, #8
	orrs r0, r4
	movs r3, #0x10
	orrs r0, r3
	movs r1, #0x20
	orrs r0, r1
	movs r1, #0x41
	negs r1, r1
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	mov r1, ip
	strb r0, [r1, #1]
	mov r0, ip
	adds r0, #0x2d
	movs r2, #0
	strb r2, [r0]
	ldrh r6, [r7, #0x2a]
	adds r1, r6, #0
	movs r0, #0x50
	subs r0, r0, r1
	mov r2, ip
	adds r2, #0x31
	strb r0, [r2]
	subs r2, #5
	movs r0, #0xf0
	strb r0, [r2]
	adds r1, #0x50
	mov r0, ip
	adds r0, #0x30
	strb r1, [r0]
	mov r1, ip
	adds r1, #0x34
	ldrb r0, [r1]
	mov r2, r8
	orrs r0, r2
	mov r2, sl
	orrs r0, r2
	orrs r0, r5
	orrs r0, r4
	orrs r0, r3
	strb r0, [r1]
	mov r2, ip
	adds r2, #0x36
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
	lsls r0, r6, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x50
	bne _080B3D40
	movs r0, #0xb4
	mov r1, r9
	strb r0, [r1]
	movs r2, #0
	strh r2, [r7, #0x2a]
	adds r0, r7, #0
	bl Proc_Break
	ldr r0, _080B3D3C  @ sub_80B3C14
	adds r1, r7, #0
	bl Get6CDifferedLoop6C
	b _080B3D44
	.align 2, 0
_080B3D38: .4byte gLCDControlBuffer
_080B3D3C: .4byte sub_80B3C14
_080B3D40:
	adds r0, r6, #4
	strh r0, [r7, #0x2a]
_080B3D44:
	ldr r0, _080B3D7C  @ gUnknown_02000000
	adds r4, r7, #0
	adds r4, #0x46
	ldrb r1, [r4]
	movs r2, #0x58
	bl sub_805A940
	ldr r0, _080B3D80  @ gUnknown_0201DB00
	ldrb r3, [r4]
	adds r1, r3, #0
	subs r1, #0x30
	adds r3, #0x30
	movs r2, #0x68
	str r2, [sp]
	bl sub_805AE40
	ldr r0, [r7, #0x3c]
	movs r1, #0x64
	bl sub_80B40E4
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B3D7C: .4byte gUnknown_02000000
_080B3D80: .4byte gUnknown_0201DB00

	THUMB_FUNC_END sub_80B3C50

	THUMB_FUNC_START sub_80B3D84
sub_80B3D84: @ 0x080B3D84
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x38]
	ldrb r0, [r0]
	cmp r0, #8
	bhi _080B3E0A
	lsls r0, r0, #2
	ldr r1, _080B3D9C  @ _080B3DA0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080B3D9C: .4byte _080B3DA0
_080B3DA0: @ jump table
	.4byte _080B3DC4 @ case 0
	.4byte _080B3DCE @ case 1
	.4byte _080B3DD8 @ case 2
	.4byte _080B3DE4 @ case 3
	.4byte _080B3DF0 @ case 4
	.4byte _080B3E0A @ case 5
	.4byte _080B3E00 @ case 6
	.4byte _080B3DE4 @ case 7
	.4byte _080B3E0A @ case 8
_080B3DC4:
	adds r0, r4, #0
	movs r1, #0xa
	bl Proc_Goto
	b _080B3E0A
_080B3DCE:
	ldr r0, _080B3DD4  @ gUnknown_02000000
	movs r1, #0
	b _080B3DF4
	.align 2, 0
_080B3DD4: .4byte gUnknown_02000000
_080B3DD8:
	ldr r0, _080B3DE0  @ gUnknown_02000000
	movs r1, #1
	b _080B3DF4
	.align 2, 0
_080B3DE0: .4byte gUnknown_02000000
_080B3DE4:
	ldr r0, _080B3DEC  @ gUnknown_02000000
	bl sub_805A990
	b _080B3E0A
	.align 2, 0
_080B3DEC: .4byte gUnknown_02000000
_080B3DF0:
	ldr r0, _080B3DFC  @ gUnknown_02000000
	movs r1, #2
_080B3DF4:
	strh r1, [r0, #0xa]
	bl sub_805A7B4
	b _080B3E0A
	.align 2, 0
_080B3DFC: .4byte gUnknown_02000000
_080B3E00:
	ldr r0, _080B3E14  @ gUnknown_02000000
	movs r1, #4
	strh r1, [r0, #0xa]
	bl sub_805A7B4
_080B3E0A:
	movs r0, #0
	strh r0, [r4, #0x2a]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B3E14: .4byte gUnknown_02000000

	THUMB_FUNC_END sub_80B3D84

	THUMB_FUNC_START sub_80B3E18
sub_80B3E18: @ 0x080B3E18
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x38]
	ldrb r0, [r0]
	subs r0, #1
	cmp r0, #7
	bhi _080B3E90
	lsls r0, r0, #2
	ldr r1, _080B3E30  @ _080B3E34
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080B3E30: .4byte _080B3E34
_080B3E34: @ jump table
	.4byte _080B3E54 @ case 0
	.4byte _080B3E54 @ case 1
	.4byte _080B3E54 @ case 2
	.4byte _080B3E54 @ case 3
	.4byte _080B3E5A @ case 4
	.4byte _080B3E54 @ case 5
	.4byte _080B3E54 @ case 6
	.4byte _080B3E78 @ case 7
_080B3E54:
	ldr r0, [r4, #0x38]
	adds r0, #2
	b _080B3E6E
_080B3E5A:
	ldrh r0, [r4, #0x2a]
	adds r0, #1
	strh r0, [r4, #0x2a]
	ldr r1, [r4, #0x38]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrb r2, [r1, #1]
	cmp r0, r2
	bcc _080B3E90
	adds r0, r1, #2
_080B3E6E:
	str r0, [r4, #0x38]
	adds r0, r4, #0
	bl Proc_Break
	b _080B3E90
_080B3E78:
	ldr r0, _080B3E98  @ gUnknown_02000000
	bl sub_805A96C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080B3E90
	ldr r0, [r4, #0x38]
	adds r0, #2
	str r0, [r4, #0x38]
	adds r0, r4, #0
	bl Proc_Break
_080B3E90:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B3E98: .4byte gUnknown_02000000

	THUMB_FUNC_END sub_80B3E18

	THUMB_FUNC_START sub_80B3E9C
sub_80B3E9C: @ 0x080B3E9C
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0
	bl SetPrimaryHBlankHandler
	bl sub_8006A7C
	bl sub_806E920
	ldr r0, _080B3ED4  @ gUnknown_0201DB00
	bl sub_805AE14
	bl sub_806E904
	ldr r0, _080B3ED8  @ gUnknown_02000000
	bl sub_805AA28
	ldr r0, [r4, #0x3c]
	cmp r0, #0
	beq _080B3EC8
	bl Proc_End
_080B3EC8:
	movs r0, #2
	bl sub_80B29B8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B3ED4: .4byte gUnknown_0201DB00
_080B3ED8: .4byte gUnknown_02000000

	THUMB_FUNC_END sub_80B3E9C

	THUMB_FUNC_START sub_80B3EDC
sub_80B3EDC: @ 0x080B3EDC
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _080B3EF8  @ gUnknown_08A2F088
	adds r1, r4, #0
	bl Proc_Start
	str r4, [r0, #0x30]
	str r5, [r0, #0x34]
	movs r1, #0
	str r1, [r0, #0x3c]
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080B3EF8: .4byte gUnknown_08A2F088

	THUMB_FUNC_END sub_80B3EDC

	THUMB_FUNC_START sub_80B3EFC
sub_80B3EFC: @ 0x080B3EFC
	push {r4, r5, lr}
	sub sp, #0x20
	adds r2, r0, #0
	ldr r0, [r2, #0x14]
	str r0, [r2, #0x30]
	movs r1, #0
	movs r0, #0
	strh r0, [r2, #0x2a]
	adds r4, r2, #0
	adds r4, #0x34
	strb r1, [r4]
	adds r1, r2, #0
	adds r1, #0x35
	movs r0, #0x64
	strb r0, [r1]
	ldr r0, [r2, #0x30]
	ldr r0, [r0, #0x34]
	ldrb r0, [r0, #5]
	mov r1, sp
	bl sub_80B369C
	mov r0, sp
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _080B3F66
	adds r5, r4, #0
	mov r4, sp
_080B3F36:
	ldrb r0, [r4]
	bl sub_80B4108
	adds r1, r0, #0
	cmp r1, #0
	beq _080B3F4E
	ldrb r0, [r1, #5]
	ldrb r1, [r1, #4]
	subs r0, r0, r1
	ldrb r1, [r5]
	adds r0, r0, r1
	b _080B3F52
_080B3F4E:
	ldrb r0, [r5]
	adds r0, #4
_080B3F52:
	strb r0, [r5]
	adds r4, #1
	mov r0, sp
	adds r0, #0xd
	cmp r4, r0
	bgt _080B3F66
	movs r0, #0
	ldrsb r0, [r4, r0]
	cmp r0, #0
	bne _080B3F36
_080B3F66:
	ldr r0, _080B3F84  @ gUnknown_08A36338
	ldr r1, _080B3F88  @ 0x06010000
	bl CopyDataWithPossibleUncomp
	ldr r0, _080B3F8C  @ gUnknown_08A372C0
	movs r1, #0xa0
	lsls r1, r1, #2
	movs r2, #0x40
	bl CopyToPaletteBuffer
	add sp, #0x20
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B3F84: .4byte gUnknown_08A36338
_080B3F88: .4byte 0x06010000
_080B3F8C: .4byte gUnknown_08A372C0

	THUMB_FUNC_END sub_80B3EFC

	THUMB_FUNC_START sub_80B3F90
sub_80B3F90: @ 0x080B3F90
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x30
	mov sl, r0
	movs r0, #0
	mov r9, r0
_080B3FA2:
	mov r1, sl
	ldr r0, [r1, #0x30]
	adds r0, #0x40
	add r0, r9
	ldrb r5, [r0]
	cmp r5, #0x1d
	bls _080B3FB2
	movs r5, #0x1e
_080B3FB2:
	movs r7, #0
	lsrs r0, r5, #2
	mov r2, r9
	adds r2, #1
	str r2, [sp, #0x2c]
	mov r3, sl
	adds r3, #0x34
	str r3, [sp, #0x24]
	mov r1, sl
	adds r1, #0x35
	str r1, [sp, #0x28]
	cmp r7, r0
	bge _080B3FF6
	mov r8, r0
	movs r4, #0x30
	mov r2, r9
	lsls r6, r2, #4
	mov r7, r8
_080B3FD6:
	ldr r0, _080B4098  @ gUnknown_08A2F180
	ldr r3, [r0, #0xc]
	movs r0, #0x80
	lsls r0, r0, #7
	str r0, [sp]
	movs r0, #0xd
	adds r1, r4, #0
	adds r2, r6, #0
	adds r2, #0x10
	bl PutSpriteExt
	adds r4, #8
	subs r7, #1
	cmp r7, #0
	bne _080B3FD6
	mov r7, r8
_080B3FF6:
	movs r0, #3
	ands r0, r5
	cmp r0, #0
	beq _080B401E
	lsls r1, r7, #3
	adds r1, #0x30
	mov r3, r9
	lsls r2, r3, #4
	adds r2, #0x10
	subs r0, #1
	lsls r0, r0, #2
	ldr r3, _080B4098  @ gUnknown_08A2F180
	adds r0, r0, r3
	ldr r3, [r0]
	movs r0, #0x80
	lsls r0, r0, #7
	str r0, [sp]
	movs r0, #0xd
	bl PutSpriteExt
_080B401E:
	ldr r0, [sp, #0x2c]
	mov r9, r0
	cmp r0, #5
	ble _080B3FA2
	ldr r2, [sp, #0x24]
	ldrb r1, [r2]
	movs r0, #0x78
	subs r0, r0, r1
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	ldr r3, [sp, #0x28]
	ldrb r3, [r3]
	adds r7, r0, r3
	mov r1, sl
	ldr r0, [r1, #0x30]
	ldr r0, [r0, #0x34]
	ldrb r0, [r0, #5]
	add r1, sp, #4
	bl sub_80B369C
	movs r2, #0
	mov r9, r2
	add r0, sp, #4
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _080B40B2
	add r5, sp, #4
_080B405A:
	ldrb r0, [r5]
	bl sub_80B4108
	adds r4, r0, #0
	cmp r4, #0
	beq _080B409C
	ldr r3, [r4]
	cmp r3, #0
	beq _080B409E
	movs r1, #4
	ldrsb r1, [r4, r1]
	subs r1, r7, r1
	subs r1, #2
	movs r0, #6
	ldrsb r0, [r4, r0]
	movs r2, #5
	subs r2, r2, r0
	movs r0, #0x80
	lsls r0, r0, #7
	str r0, [sp]
	movs r0, #4
	bl PutSpriteExt
	movs r0, #5
	ldrsb r0, [r4, r0]
	movs r1, #4
	ldrsb r1, [r4, r1]
	subs r0, r0, r1
	adds r7, r7, r0
	b _080B409E
	.align 2, 0
_080B4098: .4byte gUnknown_08A2F180
_080B409C:
	adds r7, #4
_080B409E:
	adds r5, #1
	movs r3, #1
	add r9, r3
	mov r0, r9
	cmp r0, #0xd
	bgt _080B40B2
	movs r0, #0
	ldrsb r0, [r5, r0]
	cmp r0, #0
	bne _080B405A
_080B40B2:
	mov r1, sl
	ldrh r0, [r1, #0x2a]
	cmp r0, #0xfe
	bhi _080B40BE
	adds r0, #1
	strh r0, [r1, #0x2a]
_080B40BE:
	add sp, #0x30
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80B3F90

	THUMB_FUNC_START sub_80B40D0
sub_80B40D0: @ 0x080B40D0
	push {lr}
	adds r1, r0, #0
	ldr r0, _080B40E0  @ gUnknown_08A2F138
	bl Proc_Start
	pop {r1}
	bx r1
	.align 2, 0
_080B40E0: .4byte gUnknown_08A2F138

	THUMB_FUNC_END sub_80B40D0

	THUMB_FUNC_START sub_80B40E4
sub_80B40E4: @ 0x080B40E4
	adds r0, #0x35
	strb r1, [r0]
	bx lr

	THUMB_FUNC_END sub_80B40E4

	THUMB_FUNC_START sub_80B40EC
sub_80B40EC: @ 0x080B40EC
	ldr r3, _080B4100  @ gUnknown_08A2FBE0
	ldr r2, _080B4104  @ gUnknown_08A2FBD4
	adds r0, r0, r2
	ldrb r0, [r0]
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	ldr r0, [r0]
	bx lr
	.align 2, 0
_080B4100: .4byte gUnknown_08A2FBE0
_080B4104: .4byte gUnknown_08A2FBD4

	THUMB_FUNC_END sub_80B40EC

	THUMB_FUNC_START sub_80B4108
sub_80B4108: @ 0x080B4108
	push {lr}
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	adds r2, r1, #0
	adds r0, r1, #0
	subs r0, #0x61
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x19
	bhi _080B4128
	lsls r0, r1, #3
	ldr r1, _080B4124  @ gUnknown_08A2FDD0
	adds r0, r0, r1
	b _080B414A
	.align 2, 0
_080B4124: .4byte gUnknown_08A2FDD0
_080B4128:
	adds r0, r1, #0
	subs r0, #0x41
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x19
	bhi _080B4140
	lsls r0, r1, #3
	ldr r1, _080B413C  @ gUnknown_08A2FE00
	adds r0, r0, r1
	b _080B414A
	.align 2, 0
_080B413C: .4byte gUnknown_08A2FE00
_080B4140:
	cmp r2, #0x2e
	beq _080B4148
	movs r0, #0
	b _080B414A
_080B4148:
	ldr r0, _080B4150  @ gUnknown_08A301A8
_080B414A:
	pop {r1}
	bx r1
	.align 2, 0
_080B4150: .4byte gUnknown_08A301A8

	THUMB_FUNC_END sub_80B4108

.align 2, 0
