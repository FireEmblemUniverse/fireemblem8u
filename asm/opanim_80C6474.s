	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	THUMB_FUNC_START OpAnimPreparefxEirika
OpAnimPreparefxEirika: @ 0x080C7CF8
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r6, r0, #0
	ldrh r0, [r6, #0x2a]
	cmp r0, #6
	bls _080C7D06
	b _080C7F80
_080C7D06:
	lsls r0, r0, #2
	ldr r1, _080C7D10  @ _080C7D14
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080C7D10: .4byte _080C7D14
_080C7D14: @ jump table
	.4byte _080C7D30 @ case 0
	.4byte _080C7DEC @ case 1
	.4byte _080C7E18 @ case 2
	.4byte _080C7E48 @ case 3
	.4byte _080C7E84 @ case 4
	.4byte _080C7EA8 @ case 5
	.4byte _080C7EE4 @ case 6
_080C7D30:
	ldr r2, _080C7DDC  @ gLCDControlBuffer
	ldrb r1, [r2, #1]
	movs r0, #2
	negs r0, r0
	ands r0, r1
	movs r1, #3
	negs r1, r1
	ands r0, r1
	subs r1, #2
	ands r0, r1
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
	movs r1, #0xe8
	lsls r1, r1, #8
	movs r0, #2
	bl SetBackgroundMapDataOffset
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
	ldr r0, _080C7DE0  @ gBG0TilemapBuffer
	movs r1, #0
	bl BG_Fill
	ldr r0, _080C7DE4  @ gBG1TilemapBuffer
	movs r1, #0
	bl BG_Fill
	ldr r0, _080C7DE8  @ gBG2TilemapBuffer
	movs r1, #0
	bl BG_Fill
	movs r0, #7
	bl BG_EnableSyncByMask
	movs r0, #0
	bl SetBlendBackdropA
	movs r0, #0
	bl SetBlendBackdropB
	movs r0, #1
	movs r1, #8
	movs r2, #8
	movs r3, #8
	bl SetSpecialColorEffectsParameters
	movs r4, #0
	str r4, [sp]
	movs r0, #0
	movs r1, #1
	movs r2, #0
	movs r3, #0
	bl SetBlendTargetA
	str r4, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #1
	movs r3, #1
	bl SetBlendTargetB
	b _080C7F80
	.align 2, 0
_080C7DDC: .4byte gLCDControlBuffer
_080C7DE0: .4byte gBG0TilemapBuffer
_080C7DE4: .4byte gBG1TilemapBuffer
_080C7DE8: .4byte gBG2TilemapBuffer
_080C7DEC:
	ldr r4, _080C7E0C  @ Img_OpAnimEirikaClose1
	movs r0, #0
	bl GetBackgroundTileDataOffset
	adds r1, r0, #0
	movs r0, #0xc0
	lsls r0, r0, #0x13
	adds r1, r1, r0
	adds r0, r4, #0
	bl Decompress
	ldr r0, _080C7E10  @ Tsa_OpAnimEirikaClose
	ldr r1, _080C7E14  @ gGenericBuffer
	bl Decompress
	b _080C7F80
	.align 2, 0
_080C7E0C: .4byte Img_OpAnimEirikaClose1
_080C7E10: .4byte Tsa_OpAnimEirikaClose
_080C7E14: .4byte gGenericBuffer
_080C7E18:
	ldr r4, _080C7E38  @ Img_OpAnimEirikaClose2
	movs r0, #0
	bl GetBackgroundTileDataOffset
	adds r1, r0, #0
	ldr r2, _080C7E3C  @ 0x06002000
	adds r1, r1, r2
	adds r0, r4, #0
	bl Decompress
	ldr r0, _080C7E40  @ Tsa_OpAnimEirikaClose2
	ldr r1, _080C7E44  @ gGenericBuffer+0x800
	bl Decompress
	b _080C7F80
	.align 2, 0
_080C7E38: .4byte Img_OpAnimEirikaClose2
_080C7E3C: .4byte 0x06002000
_080C7E40: .4byte Tsa_OpAnimEirikaClose2
_080C7E44: .4byte gGenericBuffer+0x800
_080C7E48:
	ldr r4, _080C7E74  @ Img_OpAnimEirika
	movs r0, #2
	bl GetBackgroundTileDataOffset
	adds r1, r0, #0
	movs r0, #0xc0
	lsls r0, r0, #0x13
	adds r1, r1, r0
	adds r0, r4, #0
	bl Decompress
	ldr r0, _080C7E78  @ Tsa_OpAnimEirika
	ldr r1, _080C7E7C  @ gGenericBuffer+0x1000
	bl Decompress
	ldr r0, _080C7E80  @ Pal_OpAnimEirikaBlur
	movs r2, #0xb0
	lsls r2, r2, #1
	movs r1, #0
	bl CopyToPalOpAnim
	b _080C7F80
	.align 2, 0
_080C7E74: .4byte Img_OpAnimEirika
_080C7E78: .4byte Tsa_OpAnimEirika
_080C7E7C: .4byte gGenericBuffer+0x1000
_080C7E80: .4byte Pal_OpAnimEirikaBlur
_080C7E84:
	ldr r0, _080C7E98  @ Img_OpAnimEirikaBlur3
	ldr r1, _080C7E9C  @ 0x06008000
	bl Decompress
	ldr r0, _080C7EA0  @ Tsa_OpAnimEirikaBlur3
	ldr r1, _080C7EA4  @ 0x0600C000
	bl Decompress
	b _080C7F80
	.align 2, 0
_080C7E98: .4byte Img_OpAnimEirikaBlur3
_080C7E9C: .4byte 0x06008000
_080C7EA0: .4byte Tsa_OpAnimEirikaBlur3
_080C7EA4: .4byte 0x0600C000
_080C7EA8:
	ldr r0, _080C7ED4  @ Img_OpAnimEirikaBlur2
	ldr r1, _080C7ED8  @ 0x0600A000
	bl Decompress
	ldr r0, _080C7EDC  @ Tsa_OpAnimEirikaBlur2
	ldr r4, _080C7EE0  @ 0x0600C800
	adds r1, r4, #0
	bl Decompress
	movs r2, #0x80
	lsls r2, r2, #1
	adds r1, r2, #0
	movs r3, #0xa0
	lsls r3, r3, #2
_080C7EC4:
	ldrh r2, [r4]
	adds r0, r1, r2
	strh r0, [r4]
	adds r4, #2
	subs r3, #1
	cmp r3, #0
	bne _080C7EC4
	b _080C7F80
	.align 2, 0
_080C7ED4: .4byte Img_OpAnimEirikaBlur2
_080C7ED8: .4byte 0x0600A000
_080C7EDC: .4byte Tsa_OpAnimEirikaBlur2
_080C7EE0: .4byte 0x0600C800
_080C7EE4:
	ldr r0, _080C7F6C  @ gGenericBuffer+0x1000
	movs r1, #0x80
	lsls r1, r1, #4
	adds r4, r0, r1
	movs r2, #0x80
	lsls r2, r2, #2
	adds r1, r4, #0
	bl CpuFastSet
	adds r7, r4, #0
	ldr r5, _080C7F70  @ 0x00000FFF
	movs r2, #0xf0
	lsls r2, r2, #8
	adds r4, r2, #0
	adds r2, r7, #0
	movs r3, #0xa0
	lsls r3, r3, #2
_080C7F06:
	ldrh r1, [r2]
	adds r0, r5, #0
	ands r0, r1
	orrs r0, r4
	strh r0, [r2]
	adds r2, #2
	subs r3, #1
	cmp r3, #0
	bne _080C7F06
	ldr r1, _080C7F74  @ 0x0600F000
	movs r2, #0xa0
	lsls r2, r2, #1
	adds r0, r7, #0
	bl CpuFastSet
	bl EnablePaletteSync
	ldr r2, _080C7F78  @ gLCDControlBuffer
	ldrb r1, [r2, #1]
	movs r0, #2
	negs r0, r0
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2, #1]
	movs r2, #0
	strh r2, [r6, #0x2a]
	strh r2, [r6, #0x30]
	strh r2, [r6, #0x32]
	ldr r1, _080C7F7C  @ gOpAnimSt
	movs r0, #0xf0
	strh r0, [r1]
	strh r2, [r1, #2]
	strh r2, [r1, #4]
	movs r0, #0xa0
	strh r0, [r1, #6]
	movs r1, #0x80
	lsls r1, r1, #8
	movs r0, #2
	bl SetBackgroundTileDataOffset
	adds r0, r6, #0
	bl Proc_Break
	b _080C7F86
	.align 2, 0
_080C7F6C: .4byte gGenericBuffer+0x1000
_080C7F70: .4byte 0x00000FFF
_080C7F74: .4byte 0x0600F000
_080C7F78: .4byte gLCDControlBuffer
_080C7F7C: .4byte gOpAnimSt
_080C7F80:
	ldrh r0, [r6, #0x2a]
	adds r0, #1
	strh r0, [r6, #0x2a]
_080C7F86:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END OpAnimPreparefxEirika

	THUMB_FUNC_START sub_80C7F90
sub_80C7F90: @ 0x080C7F90
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	sub sp, #0xc
	adds r5, r0, #0
	movs r0, #7
	bl BG_EnableSyncByMask
	ldrh r0, [r5, #0x2a]
	cmp r0, #0x10
	bhi _080C807A
	adds r3, r0, #0
	movs r0, #0x10
	str r0, [sp]
	movs r0, #4
	movs r1, #0
	movs r2, #0x68
	bl Interpolate
	adds r6, r0, #0
	ldrh r0, [r5, #0x2a]
	subs r0, #0xc
	cmp r0, #4
	bhi _080C8038
	lsls r0, r0, #2
	ldr r1, _080C7FCC  @ _080C7FD0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080C7FCC: .4byte _080C7FD0
_080C7FD0: @ jump table
	.4byte _080C7FE4 @ case 0
	.4byte _080C7FF8 @ case 1
	.4byte _080C8018 @ case 2
	.4byte _080C8038 @ case 3
	.4byte _080C8058 @ case 4
_080C7FE4:
	lsls r0, r6, #0x10
	asrs r0, r0, #0x10
	ldr r1, _080C7FF4  @ 0x0600C800
	str r1, [sp]
	movs r1, #0
	str r1, [sp, #4]
	str r1, [sp, #8]
	b _080C804A
	.align 2, 0
_080C7FF4: .4byte 0x0600C800
_080C7FF8:
	ldr r0, _080C800C  @ Img_OpAnimEirikaBlur1
	ldr r1, _080C8010  @ 0x06008000
	bl Decompress
	lsls r0, r6, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x30
	ldrsh r1, [r5, r2]
	ldr r2, _080C8014  @ 0x0600C800
	b _080C8042
	.align 2, 0
_080C800C: .4byte Img_OpAnimEirikaBlur1
_080C8010: .4byte 0x06008000
_080C8014: .4byte 0x0600C800
_080C8018:
	ldr r0, _080C8030  @ Tsa_OpAnimEirikaBlur1
	ldr r4, _080C8034  @ 0x0600C000
	adds r1, r4, #0
	bl Decompress
	lsls r0, r6, #0x10
	asrs r0, r0, #0x10
	str r4, [sp]
	movs r1, #0
	str r1, [sp, #4]
	str r1, [sp, #8]
	b _080C804A
	.align 2, 0
_080C8030: .4byte Tsa_OpAnimEirikaBlur1
_080C8034: .4byte 0x0600C000
_080C8038:
	lsls r0, r6, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x30
	ldrsh r1, [r5, r2]
	ldr r2, _080C8054  @ 0x0600C000
_080C8042:
	str r2, [sp]
	movs r2, #0
	str r2, [sp, #4]
	str r2, [sp, #8]
_080C804A:
	movs r2, #0x98
	movs r3, #2
	bl sub_80C689C
	b _080C8078
	.align 2, 0
_080C8054: .4byte 0x0600C000
_080C8058:
	lsls r0, r6, #0x10
	asrs r0, r0, #0x10
	ldr r1, _080C80E4  @ gGenericBuffer+0x1000
	str r1, [sp]
	movs r1, #0
	str r1, [sp, #4]
	str r1, [sp, #8]
	movs r2, #0x98
	movs r3, #2
	bl sub_80C689C
	movs r1, #0x80
	lsls r1, r1, #7
	movs r0, #2
	bl SetBackgroundTileDataOffset
_080C8078:
	strh r6, [r5, #0x30]
_080C807A:
	ldrh r0, [r5, #0x2a]
	subs r4, r0, #5
	cmp r4, #0
	blt _080C80EC
	movs r0, #0x10
	str r0, [sp]
	movs r0, #4
	movs r1, #0
	movs r2, #0xcc
	adds r3, r4, #0
	bl Interpolate
	adds r6, r0, #0
	lsls r0, r6, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x32
	ldrsh r1, [r5, r2]
	ldr r7, _080C80E8  @ gGenericBuffer
	str r7, [sp]
	movs r2, #0x80
	lsls r2, r2, #4
	adds r2, r2, r7
	mov r9, r2
	str r2, [sp, #4]
	movs r2, #1
	str r2, [sp, #8]
	movs r2, #0xc0
	movs r3, #1
	bl TsaModifyFirstPalMaybe
	movs r0, #0
	mov r8, r0
	strh r6, [r5, #0x32]
	cmp r4, #0x10
	bne _080C80EC
	movs r1, #0x32
	ldrsh r0, [r5, r1]
	str r7, [sp]
	mov r2, r9
	str r2, [sp, #4]
	mov r1, r8
	str r1, [sp, #8]
	movs r1, #0
	movs r2, #0xc0
	movs r3, #0
	bl TsaModifyFirstPalMaybe
	mov r2, r8
	strh r2, [r5, #0x2a]
	adds r0, r5, #0
	bl Proc_Break
	b _080C80F2
	.align 2, 0
_080C80E4: .4byte gGenericBuffer+0x1000
_080C80E8: .4byte gGenericBuffer
_080C80EC:
	ldrh r0, [r5, #0x2a]
	adds r0, #1
	strh r0, [r5, #0x2a]
_080C80F2:
	add sp, #0xc
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80C7F90

	THUMB_FUNC_START sub_80C8100
sub_80C8100: @ 0x080C8100
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r0, _080C8178  @ OpAnimHBlank1
	bl SetPrimaryHBlankHandler
	ldr r2, _080C817C  @ gLCDControlBuffer
	ldrb r0, [r2, #1]
	movs r1, #0x20
	orrs r0, r1
	movs r1, #0x41
	negs r1, r1
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
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
	strb r0, [r2, #1]
	ldr r0, _080C8180  @ gOpAnimSt
	ldrh r0, [r0]
	adds r1, r2, #0
	adds r1, #0x2d
	movs r4, #0
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x31
	strb r4, [r0]
	subs r1, #1
	movs r0, #0xf0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0xa0
	strb r0, [r1]
	movs r1, #0xf0
	lsls r1, r1, #8
	movs r0, #2
	bl SetBackgroundMapDataOffset
	str r4, [sp]
	movs r0, #0
	movs r1, #1
	movs r2, #1
	movs r3, #0
	bl SetBlendTargetA
	adds r0, r5, #0
	bl Proc_Break
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C8178: .4byte OpAnimHBlank1
_080C817C: .4byte gLCDControlBuffer
_080C8180: .4byte gOpAnimSt

	THUMB_FUNC_END sub_80C8100

	THUMB_FUNC_START sub_80C8184
sub_80C8184: @ 0x080C8184
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r7, r0, #0
	ldrh r3, [r7, #0x2a]
	movs r5, #0x10
	str r5, [sp]
	movs r0, #4
	movs r1, #0xf0
	movs r2, #0
	bl Interpolate
	ldr r4, _080C81FC  @ gOpAnimSt
	movs r6, #0
	strh r0, [r4]
	ldrh r3, [r7, #0x2a]
	str r5, [sp]
	movs r0, #4
	movs r1, #0
	movs r2, #0xa0
	bl Interpolate
	strh r0, [r4, #2]
	ldr r2, _080C8200  @ gLCDControlBuffer
	ldrh r0, [r4]
	adds r1, r2, #0
	adds r1, #0x2d
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x31
	strb r6, [r0]
	subs r1, #1
	movs r0, #0xf0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0xa0
	strb r0, [r1]
	movs r1, #0
	ldrsh r0, [r4, r1]
	movs r2, #2
	ldrsh r1, [r4, r2]
	cmp r0, #7
	bgt _080C81DA
	movs r0, #8
_080C81DA:
	cmp r1, #0x88
	ble _080C81E0
	movs r1, #0x88
_080C81E0:
	bl OpAnimDrawSplitLine
	ldrh r0, [r7, #0x2a]
	cmp r0, #0x10
	bne _080C8208
	ldr r0, _080C8204  @ OpAnimHBlank2
	bl SetPrimaryHBlankHandler
	movs r0, #0
	strh r0, [r7, #0x2a]
	adds r0, r7, #0
	bl Proc_Break
	b _080C820C
	.align 2, 0
_080C81FC: .4byte gOpAnimSt
_080C8200: .4byte gLCDControlBuffer
_080C8204: .4byte OpAnimHBlank2
_080C8208:
	adds r0, #1
	strh r0, [r7, #0x2a]
_080C820C:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80C8184

	THUMB_FUNC_START sub_80C8214
sub_80C8214: @ 0x080C8214
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldrh r3, [r4, #0x2a]
	movs r0, #0x10
	str r0, [sp]
	movs r0, #4
	movs r1, #0xa0
	movs r2, #0x78
	bl Interpolate
	ldr r1, _080C8260  @ gOpAnimSt
	strh r0, [r1, #6]
	movs r0, #8
	movs r1, #0x88
	bl OpAnimDrawSplitLine
	ldrh r0, [r4, #0x2a]
	cmp r0, #0xe
	bls _080C824C
	ldr r3, _080C8264  @ Obj_08AA6C0E
	ldr r0, _080C8268  @ 0x0000206E
	str r0, [sp]
	movs r0, #1
	movs r1, #8
	movs r2, #0x88
	bl PutSpriteExt
_080C824C:
	ldrh r0, [r4, #0x2a]
	cmp r0, #0x10
	bne _080C826C
	movs r0, #0
	strh r0, [r4, #0x2a]
	adds r0, r4, #0
	bl Proc_Break
	b _080C8270
	.align 2, 0
_080C8260: .4byte gOpAnimSt
_080C8264: .4byte Obj_08AA6C0E
_080C8268: .4byte 0x0000206E
_080C826C:
	adds r0, #1
	strh r0, [r4, #0x2a]
_080C8270:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80C8214

	THUMB_FUNC_START sub_80C8278
sub_80C8278: @ 0x080C8278
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r5, r0, #0
	movs r0, #8
	movs r1, #0x88
	bl OpAnimDrawSplitLine
	ldr r3, _080C82A8  @ Obj_08AA6C0E
	ldr r0, _080C82AC  @ 0x0000207C
	str r0, [sp]
	movs r0, #1
	movs r1, #8
	movs r2, #0x88
	bl PutSpriteExt
	ldrh r0, [r5, #0x2a]
	cmp r0, #1
	beq _080C82C8
	cmp r0, #1
	bgt _080C82B0
	cmp r0, #0
	beq _080C82B6
	b _080C82EA
	.align 2, 0
_080C82A8: .4byte Obj_08AA6C0E
_080C82AC: .4byte 0x0000207C
_080C82B0:
	cmp r0, #2
	beq _080C82DA
	b _080C82EA
_080C82B6:
	movs r4, #0
_080C82B8:
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	bl OpAnim1_UpdateScrollOneLine
	adds r4, #1
	cmp r4, #7
	ble _080C82B8
	b _080C82EA
_080C82C8:
	movs r4, #8
_080C82CA:
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	bl OpAnim1_UpdateScrollOneLine
	adds r4, #1
	cmp r4, #0xf
	ble _080C82CA
	b _080C82EA
_080C82DA:
	movs r4, #0x10
_080C82DC:
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	bl OpAnim1_UpdateScrollOneLine
	adds r4, #1
	cmp r4, #0x15
	ble _080C82DC
_080C82EA:
	ldrh r0, [r5, #0x2a]
	cmp r0, #0x38
	bne _080C8350
	movs r0, #0
	strh r0, [r5, #0x2a]
	ldrh r0, [r5, #0x30]
	strh r0, [r5, #0x34]
	ldrh r0, [r5, #0x32]
	strh r0, [r5, #0x36]
	ldr r2, _080C8344  @ gLCDControlBuffer
	ldrb r0, [r2, #1]
	movs r1, #1
	orrs r0, r1
	movs r1, #3
	negs r1, r1
	ands r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2, #1]
	ldr r6, _080C8348  @ 0x00007FFF
	movs r0, #0xf0
	lsls r0, r0, #8
	adds r3, r0, #0
	ldr r2, _080C834C  @ gBG2TilemapBuffer
	movs r7, #0
	movs r4, #0xa0
	lsls r4, r4, #2
_080C8328:
	ldrh r1, [r2]
	adds r0, r6, #0
	ands r0, r1
	orrs r0, r3
	strh r0, [r2]
	adds r2, #2
	subs r4, #1
	cmp r4, #0
	bne _080C8328
	adds r0, r5, #0
	bl Proc_Break
	b _080C8354
	.align 2, 0
_080C8344: .4byte gLCDControlBuffer
_080C8348: .4byte 0x00007FFF
_080C834C: .4byte gBG2TilemapBuffer
_080C8350:
	adds r0, #1
	strh r0, [r5, #0x2a]
_080C8354:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80C8278

	THUMB_FUNC_START sub_80C835C
sub_80C835C: @ 0x080C835C
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	sub sp, #0xc
	adds r6, r0, #0
	movs r0, #5
	bl BG_EnableSyncByMask
	ldrh r0, [r6, #0x2a]
	cmp r0, #1
	bhi _080C8384
	ldr r3, _080C84B0  @ Obj_08AA6C0E
	ldr r0, _080C84B4  @ 0x0000206E
	str r0, [sp]
	movs r0, #1
	movs r1, #8
	movs r2, #0x88
	bl PutSpriteExt
_080C8384:
	ldrh r0, [r6, #0x2a]
	cmp r0, #0x10
	bhi _080C83C6
	adds r3, r0, #0
	movs r5, #0x10
	str r5, [sp]
	movs r0, #1
	movs r1, #0x78
	movs r2, #0xa0
	bl Interpolate
	ldr r4, _080C84B8  @ gOpAnimSt
	strh r0, [r4, #6]
	ldrh r3, [r6, #0x2a]
	str r5, [sp]
	movs r0, #1
	movs r1, #8
	movs r2, #0
	bl Interpolate
	adds r5, r0, #0
	movs r0, #6
	ldrsh r1, [r4, r0]
	adds r1, #0x10
	adds r0, r5, #0
	bl OpAnimDrawSplitLine
	ldrh r0, [r6, #0x2a]
	cmp r0, #0x10
	bne _080C83C6
	movs r0, #0
	bl SetPrimaryHBlankHandler
_080C83C6:
	ldrh r2, [r6, #0x2a]
	mov r8, r2
	mov r7, r8
	subs r7, #4
	cmp r7, #0
	blt _080C84C4
	cmp r7, #0x18
	bgt _080C8408
	ldrh r1, [r6, #0x34]
	movs r2, #0xac
	lsls r2, r2, #1
	movs r0, #0x18
	str r0, [sp]
	movs r0, #1
	adds r3, r7, #0
	bl Interpolate
	adds r5, r0, #0
	lsls r0, r5, #0x10
	asrs r0, r0, #0x10
	movs r3, #0x30
	ldrsh r1, [r6, r3]
	ldr r2, _080C84BC  @ gGenericBuffer+0x1000
	str r2, [sp]
	movs r2, #0
	str r2, [sp, #4]
	movs r2, #1
	str r2, [sp, #8]
	movs r2, #0x98
	movs r3, #2
	bl sub_80C689C
	strh r5, [r6, #0x30]
_080C8408:
	movs r0, #0xb
	negs r0, r0
	add r0, r8
	mov r9, r0
	cmp r0, #0
	blt _080C84C4
	cmp r7, #0x18
	bne _080C8436
	movs r4, #0
	str r4, [sp]
	movs r0, #1
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl SetBlendTargetA
	str r4, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #1
	bl SetBlendTargetB
_080C8436:
	cmp r7, #0x17
	ble _080C8462
	mov r3, r8
	subs r3, #0x1b
	movs r0, #8
	str r0, [sp]
	movs r0, #0
	movs r1, #0x10
	movs r2, #0
	bl Interpolate
	adds r5, r0, #0
	lsls r1, r5, #0x18
	lsrs r1, r1, #0x18
	movs r2, #0x10
	subs r2, r2, r5
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	movs r0, #1
	movs r3, #8
	bl SetSpecialColorEffectsParameters
_080C8462:
	ldrh r1, [r6, #0x36]
	movs r2, #0xde
	lsls r2, r2, #1
	movs r0, #0x18
	str r0, [sp]
	movs r0, #1
	mov r3, r9
	bl Interpolate
	adds r5, r0, #0
	lsls r0, r5, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x32
	ldrsh r1, [r6, r2]
	ldr r2, _080C84C0  @ gGenericBuffer
	str r2, [sp]
	movs r3, #0x80
	lsls r3, r3, #4
	adds r2, r2, r3
	str r2, [sp, #4]
	movs r4, #0
	str r4, [sp, #8]
	movs r2, #0xc0
	movs r3, #0
	bl TsaModifyFirstPalMaybe
	strh r5, [r6, #0x32]
	mov r0, r9
	cmp r0, #0x18
	bne _080C84C4
	movs r0, #0
	bl SetPrimaryHBlankHandler
	strh r4, [r6, #0x2a]
	adds r0, r6, #0
	bl Proc_Break
	b _080C84CA
	.align 2, 0
_080C84B0: .4byte Obj_08AA6C0E
_080C84B4: .4byte 0x0000206E
_080C84B8: .4byte gOpAnimSt
_080C84BC: .4byte gGenericBuffer+0x1000
_080C84C0: .4byte gGenericBuffer
_080C84C4:
	ldrh r0, [r6, #0x2a]
	adds r0, #1
	strh r0, [r6, #0x2a]
_080C84CA:
	add sp, #0xc
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80C835C

	THUMB_FUNC_START sub_80C84D8
sub_80C84D8: @ 0x080C84D8
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldrh r0, [r4, #0x2a]
	cmp r0, #0
	bne _080C851C
	ldr r2, _080C8544  @ gLCDControlBuffer
	ldrb r1, [r2, #1]
	movs r0, #2
	negs r0, r0
	ands r0, r1
	movs r1, #3
	negs r1, r1
	ands r0, r1
	subs r1, #2
	ands r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2, #1]
	movs r0, #3
	movs r1, #8
	movs r2, #8
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	movs r0, #1
	str r0, [sp]
	movs r1, #1
	movs r2, #1
	movs r3, #1
	bl SetBlendTargetA
_080C851C:
	ldrh r3, [r4, #0x2a]
	movs r0, #8
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0x10
	bl Interpolate
	ldr r1, _080C8544  @ gLCDControlBuffer
	adds r1, #0x46
	strb r0, [r1]
	ldrh r0, [r4, #0x2a]
	cmp r0, #8
	bne _080C8548
	movs r0, #0
	strh r0, [r4, #0x2a]
	adds r0, r4, #0
	bl Proc_Break
	b _080C854C
	.align 2, 0
_080C8544: .4byte gLCDControlBuffer
_080C8548:
	adds r0, #1
	strh r0, [r4, #0x2a]
_080C854C:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80C84D8

	THUMB_FUNC_START sub_80C8554
sub_80C8554: @ 0x080C8554
	ldr r1, _080C8560  @ gLCDControlBuffer
	ldrh r0, [r1, #0x28]
	adds r0, #2
	strh r0, [r1, #0x28]
	bx lr
	.align 2, 0
_080C8560: .4byte gLCDControlBuffer

	THUMB_FUNC_END sub_80C8554

	THUMB_FUNC_START sub_80C8564
sub_80C8564: @ 0x080C8564
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x46
	ldrb r0, [r0]
	bl sub_80C72A4
	ldrh r0, [r4, #0x38]
	ldrh r1, [r4, #0x3a]
	bl OpAnim1_UpdateScroll
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80C8564

	THUMB_FUNC_START sub_80C8580
sub_80C8580: @ 0x080C8580
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	movs r0, #3
	movs r1, #8
	movs r2, #8
	movs r3, #0xe
	bl SetSpecialColorEffectsParameters
	movs r5, #0
	str r5, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #1
	movs r3, #0
	bl SetBlendTargetA
	adds r4, #0x4c
	strh r5, [r4]
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80C8580

	THUMB_FUNC_START sub_80C85B0
sub_80C85B0: @ 0x080C85B0
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	adds r4, r5, #0
	adds r4, #0x4c
	movs r0, #0
	ldrsh r3, [r4, r0]
	movs r0, #0x28
	str r0, [sp]
	movs r0, #0
	movs r1, #0xe
	movs r2, #0
	bl Interpolate
	adds r3, r0, #0
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	movs r0, #3
	movs r1, #8
	movs r2, #8
	bl SetSpecialColorEffectsParameters
	ldrh r1, [r4]
	movs r2, #0
	ldrsh r0, [r4, r2]
	cmp r0, #0x28
	bne _080C85EE
	adds r0, r5, #0
	bl Proc_Break
	b _080C85F2
_080C85EE:
	adds r0, r1, #1
	strh r0, [r4]
_080C85F2:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80C85B0

	THUMB_FUNC_START sub_80C85FC
sub_80C85FC: @ 0x080C85FC
	push {lr}
	bl SetDefaultColorEffects
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80C85FC

	THUMB_FUNC_START sub_80C8608
sub_80C8608: @ 0x080C8608
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	movs r0, #3
	movs r1, #8
	movs r2, #8
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	movs r5, #0
	str r5, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #1
	movs r3, #0
	bl SetBlendTargetA
	adds r4, #0x4c
	strh r5, [r4]
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80C8608

	THUMB_FUNC_START sub_80C8638
sub_80C8638: @ 0x080C8638
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	adds r4, r5, #0
	adds r4, #0x4c
	movs r0, #0
	ldrsh r3, [r4, r0]
	movs r0, #0x28
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0xc
	bl Interpolate
	adds r3, r0, #0
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	movs r0, #3
	movs r1, #8
	movs r2, #8
	bl SetSpecialColorEffectsParameters
	ldrh r1, [r4]
	movs r2, #0
	ldrsh r0, [r4, r2]
	cmp r0, #0x28
	bne _080C8676
	adds r0, r5, #0
	bl Proc_Break
	b _080C867A
_080C8676:
	adds r0, r1, #1
	strh r0, [r4]
_080C867A:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80C8638

	THUMB_FUNC_START sub_80C8684
sub_80C8684: @ 0x080C8684
	push {lr}
	bl SetDefaultColorEffects
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80C8684

	THUMB_FUNC_START sub_80C8690
sub_80C8690: @ 0x080C8690
	push {r4, r5, lr}
	sub sp, #8
	adds r5, r0, #0
	ldrh r0, [r5, #0x38]
	ldrh r1, [r5, #0x3a]
	bl OpAnim1_UpdateScroll
	ldrh r0, [r5, #0x38]
	strh r0, [r5, #0x3a]
	movs r2, #0x9c
	lsls r2, r2, #2
	ldrh r3, [r5, #0x3c]
	movs r0, #0x86
	lsls r0, r0, #3
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	bl Interpolate
	strh r0, [r5, #0x38]
	ldrh r0, [r5, #0x3c]
	adds r0, #1
	strh r0, [r5, #0x3c]
	ldrh r0, [r5, #0x2a]
	subs r0, #1
	cmp r0, #5
	bls _080C86C8
	b _080C8802
_080C86C8:
	lsls r0, r0, #2
	ldr r1, _080C86D4  @ _080C86D8
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080C86D4: .4byte _080C86D8
_080C86D8: @ jump table
	.4byte _080C86F0 @ case 0
	.4byte _080C8740 @ case 1
	.4byte _080C876C @ case 2
	.4byte _080C879C @ case 3
	.4byte _080C87CC @ case 4
	.4byte _080C87E0 @ case 5
_080C86F0:
	ldr r4, _080C8730  @ Img_OpAnimGenericCharacterBG
	movs r0, #3
	bl GetBackgroundTileDataOffset
	adds r1, r0, #0
	ldr r0, _080C8734  @ 0x06002000
	adds r1, r1, r0
	adds r0, r4, #0
	bl Decompress
	ldr r0, _080C8738  @ Tsa_OpAnimGenericCharacterBG
	ldr r4, _080C873C  @ gBG3TilemapBuffer
	adds r1, r4, #0
	bl Decompress
	movs r3, #0xe1
	lsls r3, r3, #8
	adds r2, r3, #0
	movs r1, #0xa0
	lsls r1, r1, #2
_080C8718:
	ldrh r3, [r4]
	adds r0, r2, r3
	strh r0, [r4]
	adds r4, #2
	subs r1, #1
	cmp r1, #0
	bne _080C8718
	movs r0, #8
	bl BG_EnableSyncByMask
	b _080C8802
	.align 2, 0
_080C8730: .4byte Img_OpAnimGenericCharacterBG
_080C8734: .4byte 0x06002000
_080C8738: .4byte Tsa_OpAnimGenericCharacterBG
_080C873C: .4byte gBG3TilemapBuffer
_080C8740:
	ldr r4, _080C8760  @ Img_OpAnimJoshua
	movs r0, #0
	bl GetBackgroundTileDataOffset
	adds r1, r0, #0
	movs r0, #0xc0
	lsls r0, r0, #0x13
	adds r1, r1, r0
	adds r0, r4, #0
	bl Decompress
	ldr r0, _080C8764  @ Tsa_OpAnimJoshua2
	ldr r1, _080C8768  @ gGenericBuffer
	bl Decompress
	b _080C8802
	.align 2, 0
_080C8760: .4byte Img_OpAnimJoshua
_080C8764: .4byte Tsa_OpAnimJoshua2
_080C8768: .4byte gGenericBuffer
_080C876C:
	ldr r4, _080C878C  @ Img_OpAnimJoshua2
	movs r0, #0
	bl GetBackgroundTileDataOffset
	adds r1, r0, #0
	ldr r3, _080C8790  @ 0x06002000
	adds r1, r1, r3
	adds r0, r4, #0
	bl Decompress
	ldr r0, _080C8794  @ gUnknown_08ACC340
	ldr r1, _080C8798  @ gGenericBuffer+0x800
	bl Decompress
	b _080C8802
	.align 2, 0
_080C878C: .4byte Img_OpAnimJoshua2
_080C8790: .4byte 0x06002000
_080C8794: .4byte gUnknown_08ACC340
_080C8798: .4byte gGenericBuffer+0x800
_080C879C:
	ldr r0, _080C87BC  @ gBG0TilemapBuffer
	movs r1, #0
	bl BG_Fill
	ldr r0, _080C87C0  @ gBG1TilemapBuffer
	movs r1, #0
	bl BG_Fill
	movs r0, #0
	str r0, [sp, #4]
	ldr r1, _080C87C4  @ 0x0600D800
	ldr r2, _080C87C8  @ 0x01000400
	add r0, sp, #4
	bl CpuFastSet
	b _080C8802
	.align 2, 0
_080C87BC: .4byte gBG0TilemapBuffer
_080C87C0: .4byte gBG1TilemapBuffer
_080C87C4: .4byte 0x0600D800
_080C87C8: .4byte 0x01000400
_080C87CC:
	ldr r0, _080C87D8  @ Img_OpAnimShinningRing
	ldr r1, _080C87DC  @ 0x06004000
	bl Decompress
	b _080C8802
	.align 2, 0
_080C87D8: .4byte Img_OpAnimShinningRing
_080C87DC: .4byte 0x06004000
_080C87E0:
	ldr r0, _080C8820  @ Tsa_OpAnimShinningRing
	ldr r4, _080C8824  @ 0x0600F000
	adds r1, r4, #0
	bl Decompress
	movs r0, #0x80
	lsls r0, r0, #8
	adds r2, r0, #0
	movs r1, #0xa0
	lsls r1, r1, #2
_080C87F4:
	ldrh r3, [r4]
	adds r0, r2, r3
	strh r0, [r4]
	subs r1, #1
	adds r4, #2
	cmp r1, #0
	bne _080C87F4
_080C8802:
	ldrh r0, [r5, #0x2a]
	cmp r0, #0x28
	bne _080C8830
	ldr r0, _080C8828  @ gUnknown_08AA705C
	bl Proc_EndEach
	ldr r0, _080C882C  @ gUnknown_08AA707C
	bl Proc_EndEach
	movs r0, #0
	strh r0, [r5, #0x2a]
	adds r0, r5, #0
	bl Proc_Break
	b _080C8834
	.align 2, 0
_080C8820: .4byte Tsa_OpAnimShinningRing
_080C8824: .4byte 0x0600F000
_080C8828: .4byte gUnknown_08AA705C
_080C882C: .4byte gUnknown_08AA707C
_080C8830:
	adds r0, #1
	strh r0, [r5, #0x2a]
_080C8834:
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80C8690

	THUMB_FUNC_START sub_80C883C
sub_80C883C: @ 0x080C883C
	push {r4, r5, lr}
	sub sp, #8
	adds r5, r0, #0
	ldrh r0, [r5, #0x38]
	ldrh r1, [r5, #0x3a]
	bl OpAnim1_UpdateScroll
	ldrh r0, [r5, #0x38]
	strh r0, [r5, #0x3a]
	movs r2, #0x9c
	lsls r2, r2, #2
	ldrh r3, [r5, #0x3c]
	movs r0, #0x86
	lsls r0, r0, #3
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	bl Interpolate
	strh r0, [r5, #0x38]
	ldrh r0, [r5, #0x3c]
	adds r0, #1
	strh r0, [r5, #0x3c]
	ldrh r0, [r5, #0x2a]
	cmp r0, #2
	beq _080C88AC
	cmp r0, #2
	bgt _080C887A
	cmp r0, #1
	beq _080C8880
	b _080C88FA
_080C887A:
	cmp r0, #3
	beq _080C88DC
	b _080C88FA
_080C8880:
	ldr r4, _080C88A0  @ Img_OpAnimLArachel
	movs r0, #0
	bl GetBackgroundTileDataOffset
	adds r1, r0, #0
	movs r0, #0xc0
	lsls r0, r0, #0x13
	adds r1, r1, r0
	adds r0, r4, #0
	bl Decompress
	ldr r0, _080C88A4  @ Tsa_OpAnimLArachel
	ldr r1, _080C88A8  @ gGenericBuffer
	bl Decompress
	b _080C88FA
	.align 2, 0
_080C88A0: .4byte Img_OpAnimLArachel
_080C88A4: .4byte Tsa_OpAnimLArachel
_080C88A8: .4byte gGenericBuffer
_080C88AC:
	ldr r4, _080C88CC  @ Img_OpAnimLArachel2
	movs r0, #0
	bl GetBackgroundTileDataOffset
	adds r1, r0, #0
	ldr r0, _080C88D0  @ 0x06002000
	adds r1, r1, r0
	adds r0, r4, #0
	bl Decompress
	ldr r0, _080C88D4  @ Tsa_OpAnimLArachelLeft
	ldr r1, _080C88D8  @ gGenericBuffer+0x800
	bl Decompress
	b _080C88FA
	.align 2, 0
_080C88CC: .4byte Img_OpAnimLArachel2
_080C88D0: .4byte 0x06002000
_080C88D4: .4byte Tsa_OpAnimLArachelLeft
_080C88D8: .4byte gGenericBuffer+0x800
_080C88DC:
	ldr r0, _080C8914  @ gBG0TilemapBuffer
	movs r1, #0
	bl BG_Fill
	ldr r0, _080C8918  @ gBG1TilemapBuffer
	movs r1, #0
	bl BG_Fill
	movs r0, #0
	str r0, [sp, #4]
	ldr r1, _080C891C  @ 0x0600D800
	ldr r2, _080C8920  @ 0x01000400
	add r0, sp, #4
	bl CpuFastSet
_080C88FA:
	ldrh r0, [r5, #0x2a]
	cmp r0, #0x28
	bne _080C8928
	ldr r0, _080C8924  @ gUnknown_08AA705C
	bl Proc_EndEach
	movs r0, #0
	strh r0, [r5, #0x2a]
	adds r0, r5, #0
	bl Proc_Break
	b _080C892C
	.align 2, 0
_080C8914: .4byte gBG0TilemapBuffer
_080C8918: .4byte gBG1TilemapBuffer
_080C891C: .4byte 0x0600D800
_080C8920: .4byte 0x01000400
_080C8924: .4byte gUnknown_08AA705C
_080C8928:
	adds r0, #1
	strh r0, [r5, #0x2a]
_080C892C:
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80C883C

	THUMB_FUNC_START sub_80C8934
sub_80C8934: @ 0x080C8934
	push {r4, r5, lr}
	sub sp, #8
	adds r5, r0, #0
	ldrh r0, [r5, #0x38]
	ldrh r1, [r5, #0x3a]
	bl OpAnim1_UpdateScroll
	ldrh r0, [r5, #0x38]
	strh r0, [r5, #0x3a]
	movs r2, #0x9c
	lsls r2, r2, #2
	ldrh r3, [r5, #0x3c]
	movs r0, #0x86
	lsls r0, r0, #3
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	bl Interpolate
	strh r0, [r5, #0x38]
	ldrh r0, [r5, #0x3c]
	adds r0, #1
	strh r0, [r5, #0x3c]
	ldrh r0, [r5, #0x2a]
	cmp r0, #2
	beq _080C89A4
	cmp r0, #2
	bgt _080C8972
	cmp r0, #1
	beq _080C8978
	b _080C89F2
_080C8972:
	cmp r0, #3
	beq _080C89D4
	b _080C89F2
_080C8978:
	ldr r4, _080C8998  @ Img_OpAnimCharacterSeth
	movs r0, #0
	bl GetBackgroundTileDataOffset
	adds r1, r0, #0
	movs r0, #0xc0
	lsls r0, r0, #0x13
	adds r1, r1, r0
	adds r0, r4, #0
	bl Decompress
	ldr r0, _080C899C  @ Tsa_OpAnimCharacterSeth
	ldr r1, _080C89A0  @ gGenericBuffer
	bl Decompress
	b _080C89F2
	.align 2, 0
_080C8998: .4byte Img_OpAnimCharacterSeth
_080C899C: .4byte Tsa_OpAnimCharacterSeth
_080C89A0: .4byte gGenericBuffer
_080C89A4:
	ldr r4, _080C89C4  @ Img_OpAnimCharacterSeth2
	movs r0, #0
	bl GetBackgroundTileDataOffset
	adds r1, r0, #0
	ldr r0, _080C89C8  @ 0x06002000
	adds r1, r1, r0
	adds r0, r4, #0
	bl Decompress
	ldr r0, _080C89CC  @ gUnknown_08AD236C
	ldr r1, _080C89D0  @ gGenericBuffer+0x800
	bl Decompress
	b _080C89F2
	.align 2, 0
_080C89C4: .4byte Img_OpAnimCharacterSeth2
_080C89C8: .4byte 0x06002000
_080C89CC: .4byte gUnknown_08AD236C
_080C89D0: .4byte gGenericBuffer+0x800
_080C89D4:
	ldr r0, _080C8A04  @ gBG0TilemapBuffer
	movs r1, #0
	bl BG_Fill
	ldr r0, _080C8A08  @ gBG1TilemapBuffer
	movs r1, #0
	bl BG_Fill
	movs r0, #0
	str r0, [sp, #4]
	ldr r1, _080C8A0C  @ 0x0600D800
	ldr r2, _080C8A10  @ 0x01000400
	add r0, sp, #4
	bl CpuFastSet
_080C89F2:
	ldrh r0, [r5, #0x2a]
	cmp r0, #0x28
	bne _080C8A14
	movs r0, #0
	strh r0, [r5, #0x2a]
	adds r0, r5, #0
	bl Proc_Break
	b _080C8A18
	.align 2, 0
_080C8A04: .4byte gBG0TilemapBuffer
_080C8A08: .4byte gBG1TilemapBuffer
_080C8A0C: .4byte 0x0600D800
_080C8A10: .4byte 0x01000400
_080C8A14:
	adds r0, #1
	strh r0, [r5, #0x2a]
_080C8A18:
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80C8934

	THUMB_FUNC_START sub_80C8A20
sub_80C8A20: @ 0x080C8A20
	push {r4, r5, lr}
	sub sp, #8
	adds r5, r0, #0
	ldrh r0, [r5, #0x38]
	ldrh r1, [r5, #0x3a]
	bl OpAnim1_UpdateScroll
	ldrh r0, [r5, #0x38]
	strh r0, [r5, #0x3a]
	movs r2, #0x9c
	lsls r2, r2, #2
	ldrh r3, [r5, #0x3c]
	movs r0, #0x86
	lsls r0, r0, #3
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	bl Interpolate
	strh r0, [r5, #0x38]
	ldrh r0, [r5, #0x3c]
	adds r0, #1
	strh r0, [r5, #0x3c]
	ldrh r0, [r5, #0x2a]
	cmp r0, #2
	beq _080C8A90
	cmp r0, #2
	bgt _080C8A5E
	cmp r0, #1
	beq _080C8A64
	b _080C8ADE
_080C8A5E:
	cmp r0, #3
	beq _080C8AC0
	b _080C8ADE
_080C8A64:
	ldr r4, _080C8A84  @ Img_OpAnimMyrrh
	movs r0, #0
	bl GetBackgroundTileDataOffset
	adds r1, r0, #0
	movs r0, #0xc0
	lsls r0, r0, #0x13
	adds r1, r1, r0
	adds r0, r4, #0
	bl Decompress
	ldr r0, _080C8A88  @ Tsa_OpAnimMyrrh2
	ldr r1, _080C8A8C  @ gGenericBuffer
	bl Decompress
	b _080C8ADE
	.align 2, 0
_080C8A84: .4byte Img_OpAnimMyrrh
_080C8A88: .4byte Tsa_OpAnimMyrrh2
_080C8A8C: .4byte gGenericBuffer
_080C8A90:
	ldr r4, _080C8AB0  @ Img_OpAnimMyrrh2
	movs r0, #0
	bl GetBackgroundTileDataOffset
	adds r1, r0, #0
	ldr r0, _080C8AB4  @ 0x06002000
	adds r1, r1, r0
	adds r0, r4, #0
	bl Decompress
	ldr r0, _080C8AB8  @ gUnknown_08AD543C
	ldr r1, _080C8ABC  @ gGenericBuffer+0x800
	bl Decompress
	b _080C8ADE
	.align 2, 0
_080C8AB0: .4byte Img_OpAnimMyrrh2
_080C8AB4: .4byte 0x06002000
_080C8AB8: .4byte gUnknown_08AD543C
_080C8ABC: .4byte gGenericBuffer+0x800
_080C8AC0:
	ldr r0, _080C8AF0  @ gBG0TilemapBuffer
	movs r1, #0
	bl BG_Fill
	ldr r0, _080C8AF4  @ gBG1TilemapBuffer
	movs r1, #0
	bl BG_Fill
	movs r0, #0
	str r0, [sp, #4]
	ldr r1, _080C8AF8  @ 0x0600D800
	ldr r2, _080C8AFC  @ 0x01000400
	add r0, sp, #4
	bl CpuFastSet
_080C8ADE:
	ldrh r0, [r5, #0x2a]
	cmp r0, #0x28
	bne _080C8B00
	movs r0, #0
	strh r0, [r5, #0x2a]
	adds r0, r5, #0
	bl Proc_Break
	b _080C8B04
	.align 2, 0
_080C8AF0: .4byte gBG0TilemapBuffer
_080C8AF4: .4byte gBG1TilemapBuffer
_080C8AF8: .4byte 0x0600D800
_080C8AFC: .4byte 0x01000400
_080C8B00:
	adds r0, #1
	strh r0, [r5, #0x2a]
_080C8B04:
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80C8A20

	THUMB_FUNC_START sub_80C8B0C
sub_80C8B0C: @ 0x080C8B0C
	push {r4, r5, lr}
	sub sp, #8
	adds r5, r0, #0
	ldrh r0, [r5, #0x38]
	ldrh r1, [r5, #0x3a]
	bl OpAnim1_UpdateScroll
	ldrh r0, [r5, #0x38]
	strh r0, [r5, #0x3a]
	movs r2, #0x9c
	lsls r2, r2, #2
	ldrh r3, [r5, #0x3c]
	movs r0, #0x86
	lsls r0, r0, #3
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	bl Interpolate
	strh r0, [r5, #0x38]
	ldrh r0, [r5, #0x3c]
	adds r0, #1
	strh r0, [r5, #0x3c]
	ldrh r0, [r5, #0x2a]
	cmp r0, #2
	beq _080C8B7C
	cmp r0, #2
	bgt _080C8B4A
	cmp r0, #1
	beq _080C8B50
	b _080C8BCA
_080C8B4A:
	cmp r0, #3
	beq _080C8BAC
	b _080C8BCA
_080C8B50:
	ldr r4, _080C8B70  @ Img_OpAnimSaleh
	movs r0, #0
	bl GetBackgroundTileDataOffset
	adds r1, r0, #0
	movs r0, #0xc0
	lsls r0, r0, #0x13
	adds r1, r1, r0
	adds r0, r4, #0
	bl Decompress
	ldr r0, _080C8B74  @ Tsa_OpAnimSaleh2
	ldr r1, _080C8B78  @ gGenericBuffer
	bl Decompress
	b _080C8BCA
	.align 2, 0
_080C8B70: .4byte Img_OpAnimSaleh
_080C8B74: .4byte Tsa_OpAnimSaleh2
_080C8B78: .4byte gGenericBuffer
_080C8B7C:
	ldr r4, _080C8B9C  @ Img_OpAnimSaleh2
	movs r0, #0
	bl GetBackgroundTileDataOffset
	adds r1, r0, #0
	ldr r0, _080C8BA0  @ 0x06002000
	adds r1, r1, r0
	adds r0, r4, #0
	bl Decompress
	ldr r0, _080C8BA4  @ gUnknown_08AD88D4
	ldr r1, _080C8BA8  @ gGenericBuffer+0x800
	bl Decompress
	b _080C8BCA
	.align 2, 0
_080C8B9C: .4byte Img_OpAnimSaleh2
_080C8BA0: .4byte 0x06002000
_080C8BA4: .4byte gUnknown_08AD88D4
_080C8BA8: .4byte gGenericBuffer+0x800
_080C8BAC:
	ldr r0, _080C8BDC  @ gBG0TilemapBuffer
	movs r1, #0
	bl BG_Fill
	ldr r0, _080C8BE0  @ gBG1TilemapBuffer
	movs r1, #0
	bl BG_Fill
	movs r0, #0
	str r0, [sp, #4]
	ldr r1, _080C8BE4  @ 0x0600D800
	ldr r2, _080C8BE8  @ 0x01000400
	add r0, sp, #4
	bl CpuFastSet
_080C8BCA:
	ldrh r0, [r5, #0x2a]
	cmp r0, #0x28
	bne _080C8BEC
	movs r0, #0
	strh r0, [r5, #0x2a]
	adds r0, r5, #0
	bl Proc_Break
	b _080C8BF0
	.align 2, 0
_080C8BDC: .4byte gBG0TilemapBuffer
_080C8BE0: .4byte gBG1TilemapBuffer
_080C8BE4: .4byte 0x0600D800
_080C8BE8: .4byte 0x01000400
_080C8BEC:
	adds r0, #1
	strh r0, [r5, #0x2a]
_080C8BF0:
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80C8B0C

	THUMB_FUNC_START sub_80C8BF8
sub_80C8BF8: @ 0x080C8BF8
	push {r4, r5, lr}
	sub sp, #8
	adds r5, r0, #0
	ldrh r0, [r5, #0x38]
	ldrh r1, [r5, #0x3a]
	bl OpAnim1_UpdateScroll
	ldrh r0, [r5, #0x38]
	strh r0, [r5, #0x3a]
	movs r2, #0x9c
	lsls r2, r2, #2
	ldrh r3, [r5, #0x3c]
	movs r0, #0x86
	lsls r0, r0, #3
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	bl Interpolate
	strh r0, [r5, #0x38]
	ldrh r0, [r5, #0x3c]
	adds r0, #1
	strh r0, [r5, #0x3c]
	ldrh r0, [r5, #0x2a]
	cmp r0, #2
	beq _080C8C68
	cmp r0, #2
	bgt _080C8C36
	cmp r0, #1
	beq _080C8C3C
	b _080C8CB6
_080C8C36:
	cmp r0, #3
	beq _080C8C98
	b _080C8CB6
_080C8C3C:
	ldr r4, _080C8C5C  @ Img_OpAnimTethys
	movs r0, #0
	bl GetBackgroundTileDataOffset
	adds r1, r0, #0
	movs r0, #0xc0
	lsls r0, r0, #0x13
	adds r1, r1, r0
	adds r0, r4, #0
	bl Decompress
	ldr r0, _080C8C60  @ Tsa_OpAnimTethys
	ldr r1, _080C8C64  @ gGenericBuffer
	bl Decompress
	b _080C8CB6
	.align 2, 0
_080C8C5C: .4byte Img_OpAnimTethys
_080C8C60: .4byte Tsa_OpAnimTethys
_080C8C64: .4byte gGenericBuffer
_080C8C68:
	ldr r4, _080C8C88  @ Img_OpAnimTethys2
	movs r0, #0
	bl GetBackgroundTileDataOffset
	adds r1, r0, #0
	ldr r0, _080C8C8C  @ 0x06002000
	adds r1, r1, r0
	adds r0, r4, #0
	bl Decompress
	ldr r0, _080C8C90  @ gUnknown_08ADBC0C
	ldr r1, _080C8C94  @ gGenericBuffer+0x800
	bl Decompress
	b _080C8CB6
	.align 2, 0
_080C8C88: .4byte Img_OpAnimTethys2
_080C8C8C: .4byte 0x06002000
_080C8C90: .4byte gUnknown_08ADBC0C
_080C8C94: .4byte gGenericBuffer+0x800
_080C8C98:
	ldr r0, _080C8CC8  @ gBG0TilemapBuffer
	movs r1, #0
	bl BG_Fill
	ldr r0, _080C8CCC  @ gBG1TilemapBuffer
	movs r1, #0
	bl BG_Fill
	movs r0, #0
	str r0, [sp, #4]
	ldr r1, _080C8CD0  @ 0x0600D800
	ldr r2, _080C8CD4  @ 0x01000400
	add r0, sp, #4
	bl CpuFastSet
_080C8CB6:
	ldrh r0, [r5, #0x2a]
	cmp r0, #0x28
	bne _080C8CD8
	movs r0, #0
	strh r0, [r5, #0x2a]
	adds r0, r5, #0
	bl Proc_Break
	b _080C8CDC
	.align 2, 0
_080C8CC8: .4byte gBG0TilemapBuffer
_080C8CCC: .4byte gBG1TilemapBuffer
_080C8CD0: .4byte 0x0600D800
_080C8CD4: .4byte 0x01000400
_080C8CD8:
	adds r0, #1
	strh r0, [r5, #0x2a]
_080C8CDC:
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80C8BF8

	THUMB_FUNC_START sub_80C8CE4
sub_80C8CE4: @ 0x080C8CE4
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldrh r0, [r4, #0x38]
	ldrh r1, [r4, #0x3a]
	bl OpAnim1_UpdateScroll
	ldrh r0, [r4, #0x38]
	strh r0, [r4, #0x3a]
	movs r2, #0x9c
	lsls r2, r2, #2
	ldrh r3, [r4, #0x3c]
	movs r0, #0x86
	lsls r0, r0, #3
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	bl Interpolate
	strh r0, [r4, #0x38]
	ldrh r0, [r4, #0x3c]
	adds r0, #1
	strh r0, [r4, #0x3c]
	ldrh r0, [r4, #0x2a]
	cmp r0, #0x28
	bne _080C8D24
	movs r0, #0
	strh r0, [r4, #0x2a]
	adds r0, r4, #0
	bl Proc_Break
	b _080C8D28
_080C8D24:
	adds r0, #1
	strh r0, [r4, #0x2a]
_080C8D28:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80C8CE4

	THUMB_FUNC_START sub_80C8D30
sub_80C8D30: @ 0x080C8D30
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r7, r0, #0
	ldrh r0, [r7, #0x3e]
	movs r1, #0x4c
	bl DivRem
	adds r4, r0, #0
	movs r0, #0x4c
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0x1a
	adds r3, r4, #0
	bl Interpolate
	adds r4, r0, #0
	cmp r4, #0xc
	bgt _080C8D66
	lsls r1, r4, #0x18
	lsrs r1, r1, #0x18
	movs r0, #1
	movs r2, #0x10
	movs r3, #8
	bl SetSpecialColorEffectsParameters
	b _080C8D78
_080C8D66:
	movs r1, #0x19
	subs r1, r1, r4
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	movs r0, #1
	movs r2, #0x10
	movs r3, #8
	bl SetSpecialColorEffectsParameters
_080C8D78:
	ldrh r0, [r7, #0x3e]
	adds r0, #1
	strh r0, [r7, #0x3e]
	ldr r0, _080C8DC4  @ pal_08B103D8
	movs r2, #0x80
	lsls r2, r2, #1
	movs r1, #0
	bl CopyToPalOpAnim
	ldrh r3, [r7, #0x2a]
	movs r0, #0x26
	str r0, [sp]
	movs r0, #0
	movs r1, #0xc
	movs r2, #0
	bl Interpolate
	ldr r5, _080C8DC8  @ gPaletteBuffer
	lsls r6, r0, #0x10
	movs r4, #7
_080C8DA0:
	adds r0, r5, #0
	movs r1, #0
	lsrs r2, r6, #0x10
	bl sub_80C69B0
	adds r5, #0x20
	subs r4, #1
	cmp r4, #0
	bge _080C8DA0
	ldrh r0, [r7, #0x2a]
	subs r0, #1
	cmp r0, #4
	bhi _080C8EA0
	lsls r0, r0, #2
	ldr r1, _080C8DCC  @ _080C8DD0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080C8DC4: .4byte pal_08B103D8
_080C8DC8: .4byte gPaletteBuffer
_080C8DCC: .4byte _080C8DD0
_080C8DD0: @ jump table
	.4byte _080C8EA0 @ case 0
	.4byte _080C8DE4 @ case 1
	.4byte _080C8E1C @ case 2
	.4byte _080C8E50 @ case 3
	.4byte _080C8E84 @ case 4
_080C8DE4:
	ldr r4, _080C8E18  @ gUnknown_08ADBE78
	movs r1, #0x88
	lsls r1, r1, #2
	adds r0, r4, #0
	movs r2, #0x20
	bl CopyToPalOpAnim
	movs r1, #0x98
	lsls r1, r1, #2
	adds r0, r4, #0
	movs r2, #0x20
	bl CopyToPalOpAnim
	movs r1, #0xa8
	lsls r1, r1, #2
	adds r0, r4, #0
	movs r2, #0x20
	bl CopyToPalOpAnim
	movs r1, #0xb8
	lsls r1, r1, #2
	adds r0, r4, #0
	movs r2, #0x20
	bl CopyToPalOpAnim
	b _080C8EA0
	.align 2, 0
_080C8E18: .4byte gUnknown_08ADBE78
_080C8E1C:
	ldr r0, _080C8E3C  @ gUnknown_08ADBE98
	ldr r1, _080C8E40  @ 0x06010000
	bl Decompress
	ldr r0, _080C8E44  @ gUnknown_08ADC708
	movs r1, #0x80
	lsls r1, r1, #2
	movs r2, #0x20
	bl CopyToPalOpAnim
	ldr r0, _080C8E48  @ gUnknown_08ADC3C0
	ldr r1, _080C8E4C  @ 0x06010F00
	bl Decompress
	b _080C8EA0
	.align 2, 0
_080C8E3C: .4byte gUnknown_08ADBE98
_080C8E40: .4byte 0x06010000
_080C8E44: .4byte gUnknown_08ADC708
_080C8E48: .4byte gUnknown_08ADC3C0
_080C8E4C: .4byte 0x06010F00
_080C8E50:
	ldr r0, _080C8E70  @ gUnknown_08ADC728
	ldr r1, _080C8E74  @ 0x06011E00
	bl Decompress
	ldr r0, _080C8E78  @ gUnknown_08ADD050
	movs r1, #0x90
	lsls r1, r1, #2
	movs r2, #0x20
	bl CopyToPalOpAnim
	ldr r0, _080C8E7C  @ gUnknown_08ADCCB8
	ldr r1, _080C8E80  @ 0x06012D00
	bl Decompress
	b _080C8EA0
	.align 2, 0
_080C8E70: .4byte gUnknown_08ADC728
_080C8E74: .4byte 0x06011E00
_080C8E78: .4byte gUnknown_08ADD050
_080C8E7C: .4byte gUnknown_08ADCCB8
_080C8E80: .4byte 0x06012D00
_080C8E84:
	ldr r0, _080C8EB4  @ gUnknown_08ADD070
	ldr r1, _080C8EB8  @ 0x06013C00
	bl Decompress
	ldr r0, _080C8EBC  @ gUnknown_08ADDA54
	movs r1, #0xa0
	lsls r1, r1, #2
	movs r2, #0x20
	bl CopyToPalOpAnim
	ldr r0, _080C8EC0  @ gUnknown_08ADD6EC
	ldr r1, _080C8EC4  @ 0x06014B00
	bl Decompress
_080C8EA0:
	ldrh r0, [r7, #0x2a]
	cmp r0, #0x26
	bne _080C8EC8
	movs r0, #0
	strh r0, [r7, #0x2a]
	adds r0, r7, #0
	bl Proc_Break
	b _080C8ECC
	.align 2, 0
_080C8EB4: .4byte gUnknown_08ADD070
_080C8EB8: .4byte 0x06013C00
_080C8EBC: .4byte gUnknown_08ADDA54
_080C8EC0: .4byte gUnknown_08ADD6EC
_080C8EC4: .4byte 0x06014B00
_080C8EC8:
	adds r0, #1
	strh r0, [r7, #0x2a]
_080C8ECC:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80C8D30

	THUMB_FUNC_START sub_80C8ED4
sub_80C8ED4: @ 0x080C8ED4
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldrh r0, [r4, #0x3e]
	movs r1, #0x12
	bl DivRem
	adds r3, r0, #0
	movs r0, #0x12
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0x1a
	bl Interpolate
	adds r3, r0, #0
	cmp r3, #0xc
	bgt _080C8F08
	lsls r1, r3, #0x18
	lsrs r1, r1, #0x18
	movs r0, #1
	movs r2, #0x10
	movs r3, #8
	bl SetSpecialColorEffectsParameters
	b _080C8F1A
_080C8F08:
	movs r1, #0x19
	subs r1, r1, r3
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	movs r0, #1
	movs r2, #0x10
	movs r3, #8
	bl SetSpecialColorEffectsParameters
_080C8F1A:
	ldrh r0, [r4, #0x3e]
	adds r0, #1
	strh r0, [r4, #0x3e]
	ldrh r0, [r4, #0x2a]
	cmp r0, #2
	beq _080C8F6C
	cmp r0, #2
	bgt _080C8F30
	cmp r0, #1
	beq _080C8F3A
	b _080C8FF0
_080C8F30:
	cmp r0, #3
	beq _080C8FA0
	cmp r0, #4
	beq _080C8FD4
	b _080C8FF0
_080C8F3A:
	ldr r0, _080C8F58  @ gUnknown_08ADDA74
	ldr r1, _080C8F5C  @ 0x06010000
	bl Decompress
	ldr r0, _080C8F60  @ gUnknown_08ADE47C
	movs r1, #0x80
	lsls r1, r1, #2
	movs r2, #0x20
	bl CopyToPalOpAnim
	ldr r0, _080C8F64  @ gUnknown_08ADE080
	ldr r1, _080C8F68  @ 0x06010F00
	bl Decompress
	b _080C8FF0
	.align 2, 0
_080C8F58: .4byte gUnknown_08ADDA74
_080C8F5C: .4byte 0x06010000
_080C8F60: .4byte gUnknown_08ADE47C
_080C8F64: .4byte gUnknown_08ADE080
_080C8F68: .4byte 0x06010F00
_080C8F6C:
	ldr r0, _080C8F8C  @ gUnknown_08ADEEF4
	ldr r1, _080C8F90  @ 0x06011E00
	bl Decompress
	ldr r0, _080C8F94  @ gUnknown_08ADFA08
	movs r1, #0x90
	lsls r1, r1, #2
	movs r2, #0x20
	bl CopyToPalOpAnim
	ldr r0, _080C8F98  @ gUnknown_08ADF58C
	ldr r1, _080C8F9C  @ 0x06012D00
	bl Decompress
	b _080C8FF0
	.align 2, 0
_080C8F8C: .4byte gUnknown_08ADEEF4
_080C8F90: .4byte 0x06011E00
_080C8F94: .4byte gUnknown_08ADFA08
_080C8F98: .4byte gUnknown_08ADF58C
_080C8F9C: .4byte 0x06012D00
_080C8FA0:
	ldr r0, _080C8FC0  @ gUnknown_08ADE49C
	ldr r1, _080C8FC4  @ 0x06013C00
	bl Decompress
	ldr r0, _080C8FC8  @ gUnknown_08ADEED4
	movs r1, #0xa0
	lsls r1, r1, #2
	movs r2, #0x20
	bl CopyToPalOpAnim
	ldr r0, _080C8FCC  @ gUnknown_08ADEB1C
	ldr r1, _080C8FD0  @ 0x06014B00
	bl Decompress
	b _080C8FF0
	.align 2, 0
_080C8FC0: .4byte gUnknown_08ADE49C
_080C8FC4: .4byte 0x06013C00
_080C8FC8: .4byte gUnknown_08ADEED4
_080C8FCC: .4byte gUnknown_08ADEB1C
_080C8FD0: .4byte 0x06014B00
_080C8FD4:
	ldr r0, _080C9004  @ gUnknown_08ADFA28
	ldr r1, _080C9008  @ 0x06015A00
	bl Decompress
	ldr r0, _080C900C  @ gUnknown_08AE04D4
	movs r1, #0xb0
	lsls r1, r1, #2
	movs r2, #0x20
	bl CopyToPalOpAnim
	ldr r0, _080C9010  @ gUnknown_08AE00E4
	ldr r1, _080C9014  @ 0x06016900
	bl Decompress
_080C8FF0:
	ldrh r0, [r4, #0x2a]
	cmp r0, #7
	bne _080C9018
	movs r0, #0
	strh r0, [r4, #0x2a]
	adds r0, r4, #0
	bl Proc_Break
	b _080C901C
	.align 2, 0
_080C9004: .4byte gUnknown_08ADFA28
_080C9008: .4byte 0x06015A00
_080C900C: .4byte gUnknown_08AE04D4
_080C9010: .4byte gUnknown_08AE00E4
_080C9014: .4byte 0x06016900
_080C9018:
	adds r0, #1
	strh r0, [r4, #0x2a]
_080C901C:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80C8ED4

	THUMB_FUNC_START sub_80C9024
sub_80C9024: @ 0x080C9024
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldrh r0, [r4, #0x3e]
	movs r1, #0xe
	bl DivRem
	adds r3, r0, #0
	movs r0, #0xe
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0x1a
	bl Interpolate
	adds r3, r0, #0
	cmp r3, #0xc
	bgt _080C9058
	lsls r1, r3, #0x18
	lsrs r1, r1, #0x18
	movs r0, #1
	movs r2, #0x10
	movs r3, #8
	bl SetSpecialColorEffectsParameters
	b _080C906A
_080C9058:
	movs r1, #0x19
	subs r1, r1, r3
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	movs r0, #1
	movs r2, #0x10
	movs r3, #8
	bl SetSpecialColorEffectsParameters
_080C906A:
	ldrh r0, [r4, #0x3e]
	adds r0, #1
	strh r0, [r4, #0x3e]
	ldrh r0, [r4, #0x2a]
	cmp r0, #1
	beq _080C907C
	cmp r0, #2
	beq _080C90B0
	b _080C90CC
_080C907C:
	ldr r0, _080C909C  @ gUnknown_08AE04F4
	ldr r1, _080C90A0  @ 0x06010000
	bl Decompress
	ldr r0, _080C90A4  @ Pal_OpAnimFaceVanessaShadow
	movs r1, #0x80
	lsls r1, r1, #2
	movs r2, #0x20
	bl CopyToPalOpAnim
	ldr r0, _080C90A8  @ gUnknown_08AE0A48
	ldr r1, _080C90AC  @ 0x06010F00
	bl Decompress
	b _080C90CC
	.align 2, 0
_080C909C: .4byte gUnknown_08AE04F4
_080C90A0: .4byte 0x06010000
_080C90A4: .4byte Pal_OpAnimFaceVanessaShadow
_080C90A8: .4byte gUnknown_08AE0A48
_080C90AC: .4byte 0x06010F00
_080C90B0:
	ldr r0, _080C90E0  @ gUnknown_08AE0D94
	ldr r1, _080C90E4  @ 0x06011E00
	bl Decompress
	ldr r0, _080C90E8  @ gUnknown_08AE1634
	movs r1, #0x90
	lsls r1, r1, #2
	movs r2, #0x20
	bl CopyToPalOpAnim
	ldr r0, _080C90EC  @ gUnknown_08AE12BC
	ldr r1, _080C90F0  @ 0x06012D00
	bl Decompress
_080C90CC:
	ldrh r0, [r4, #0x2a]
	cmp r0, #8
	bne _080C90F4
	movs r0, #0
	strh r0, [r4, #0x2a]
	adds r0, r4, #0
	bl Proc_Break
	b _080C90F8
	.align 2, 0
_080C90E0: .4byte gUnknown_08AE0D94
_080C90E4: .4byte 0x06011E00
_080C90E8: .4byte gUnknown_08AE1634
_080C90EC: .4byte gUnknown_08AE12BC
_080C90F0: .4byte 0x06012D00
_080C90F4:
	adds r0, #1
	strh r0, [r4, #0x2a]
_080C90F8:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80C9024

	THUMB_FUNC_START sub_80C9100
sub_80C9100: @ 0x080C9100
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldrh r0, [r4, #0x3e]
	movs r1, #0xc
	bl DivRem
	adds r3, r0, #0
	movs r0, #0xc
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0x1a
	bl Interpolate
	adds r3, r0, #0
	cmp r3, #0xc
	bgt _080C9134
	lsls r1, r3, #0x18
	lsrs r1, r1, #0x18
	movs r0, #1
	movs r2, #0x10
	movs r3, #8
	bl SetSpecialColorEffectsParameters
	b _080C9146
_080C9134:
	movs r1, #0x19
	subs r1, r1, r3
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	movs r0, #1
	movs r2, #0x10
	movs r3, #8
	bl SetSpecialColorEffectsParameters
_080C9146:
	ldrh r0, [r4, #0x3e]
	adds r0, #1
	strh r0, [r4, #0x3e]
	ldrh r0, [r4, #0x2a]
	cmp r0, #2
	beq _080C9194
	cmp r0, #2
	bgt _080C915C
	cmp r0, #1
	beq _080C9162
	b _080C91E4
_080C915C:
	cmp r0, #3
	beq _080C91C8
	b _080C91E4
_080C9162:
	ldr r0, _080C9180  @ Img_OpAnimFaceVanessa
	ldr r1, _080C9184  @ 0x06010000
	bl Decompress
	ldr r0, _080C9188  @ Pal_OpAnimFaceVanessa
	movs r1, #0x80
	lsls r1, r1, #2
	movs r2, #0x20
	bl CopyToPalOpAnim
	ldr r0, _080C918C  @ Img_OpAnimFaceVanessaShadow
	ldr r1, _080C9190  @ 0x06010F00
	bl Decompress
	b _080C91E4
	.align 2, 0
_080C9180: .4byte Img_OpAnimFaceVanessa
_080C9184: .4byte 0x06010000
_080C9188: .4byte Pal_OpAnimFaceVanessa
_080C918C: .4byte Img_OpAnimFaceVanessaShadow
_080C9190: .4byte 0x06010F00
_080C9194:
	ldr r0, _080C91B4  @ gUnknown_08AE20E4
	ldr r1, _080C91B8  @ 0x06011E00
	bl Decompress
	ldr r0, _080C91BC  @ gUnknown_08AE2BF4
	movs r1, #0x90
	lsls r1, r1, #2
	movs r2, #0x20
	bl CopyToPalOpAnim
	ldr r0, _080C91C0  @ gUnknown_08AE281C
	ldr r1, _080C91C4  @ 0x06012D00
	bl Decompress
	b _080C91E4
	.align 2, 0
_080C91B4: .4byte gUnknown_08AE20E4
_080C91B8: .4byte 0x06011E00
_080C91BC: .4byte gUnknown_08AE2BF4
_080C91C0: .4byte gUnknown_08AE281C
_080C91C4: .4byte 0x06012D00
_080C91C8:
	ldr r0, _080C91F8  @ gUnknown_08AE2C14
	ldr r1, _080C91FC  @ 0x06013C00
	bl Decompress
	ldr r0, _080C9200  @ gUnknown_08AE3734
	movs r1, #0xa0
	lsls r1, r1, #2
	movs r2, #0x20
	bl CopyToPalOpAnim
	ldr r0, _080C9204  @ gUnknown_08AE33D4
	ldr r1, _080C9208  @ 0x06014B00
	bl Decompress
_080C91E4:
	ldrh r0, [r4, #0x2a]
	cmp r0, #9
	bne _080C920C
	movs r0, #0
	strh r0, [r4, #0x2a]
	adds r0, r4, #0
	bl Proc_Break
	b _080C9210
	.align 2, 0
_080C91F8: .4byte gUnknown_08AE2C14
_080C91FC: .4byte 0x06013C00
_080C9200: .4byte gUnknown_08AE3734
_080C9204: .4byte gUnknown_08AE33D4
_080C9208: .4byte 0x06014B00
_080C920C:
	adds r0, #1
	strh r0, [r4, #0x2a]
_080C9210:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80C9100

	THUMB_FUNC_START sub_80C9218
sub_80C9218: @ 0x080C9218
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldrh r0, [r4, #0x3e]
	movs r1, #0xa
	bl DivRem
	adds r3, r0, #0
	movs r0, #0xa
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0x1a
	bl Interpolate
	adds r3, r0, #0
	cmp r3, #0xc
	bgt _080C924C
	lsls r1, r3, #0x18
	lsrs r1, r1, #0x18
	movs r0, #1
	movs r2, #0x10
	movs r3, #8
	bl SetSpecialColorEffectsParameters
	b _080C925E
_080C924C:
	movs r1, #0x19
	subs r1, r1, r3
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	movs r0, #1
	movs r2, #0x10
	movs r3, #8
	bl SetSpecialColorEffectsParameters
_080C925E:
	ldrh r0, [r4, #0x3e]
	adds r0, #1
	strh r0, [r4, #0x3e]
	ldrh r0, [r4, #0x2a]
	cmp r0, #2
	beq _080C92AC
	cmp r0, #2
	bgt _080C9274
	cmp r0, #1
	beq _080C927A
	b _080C92FC
_080C9274:
	cmp r0, #3
	beq _080C92E0
	b _080C92FC
_080C927A:
	ldr r0, _080C9298  @ gUnknown_08AE3754
	ldr r1, _080C929C  @ 0x06010000
	bl Decompress
	ldr r0, _080C92A0  @ gUnknown_08AE41E4
	movs r1, #0x80
	lsls r1, r1, #2
	movs r2, #0x20
	bl CopyToPalOpAnim
	ldr r0, _080C92A4  @ gUnknown_08AE3E54
	ldr r1, _080C92A8  @ 0x06010F00
	bl Decompress
	b _080C92FC
	.align 2, 0
_080C9298: .4byte gUnknown_08AE3754
_080C929C: .4byte 0x06010000
_080C92A0: .4byte gUnknown_08AE41E4
_080C92A4: .4byte gUnknown_08AE3E54
_080C92A8: .4byte 0x06010F00
_080C92AC:
	ldr r0, _080C92CC  @ gUnknown_08AE4204
	ldr r1, _080C92D0  @ 0x06011E00
	bl Decompress
	ldr r0, _080C92D4  @ gUnknown_08AE4CE8
	movs r1, #0x90
	lsls r1, r1, #2
	movs r2, #0x20
	bl CopyToPalOpAnim
	ldr r0, _080C92D8  @ gUnknown_08AE4940
	ldr r1, _080C92DC  @ 0x06012D00
	bl Decompress
	b _080C92FC
	.align 2, 0
_080C92CC: .4byte gUnknown_08AE4204
_080C92D0: .4byte 0x06011E00
_080C92D4: .4byte gUnknown_08AE4CE8
_080C92D8: .4byte gUnknown_08AE4940
_080C92DC: .4byte 0x06012D00
_080C92E0:
	ldr r0, _080C9310  @ gUnknown_08AE4D08
	ldr r1, _080C9314  @ 0x06013C00
	bl Decompress
	ldr r0, _080C9318  @ gUnknown_08AE5730
	movs r1, #0xa0
	lsls r1, r1, #2
	movs r2, #0x20
	bl CopyToPalOpAnim
	ldr r0, _080C931C  @ gUnknown_08AE53C8
	ldr r1, _080C9320  @ 0x06014B00
	bl Decompress
_080C92FC:
	ldrh r0, [r4, #0x2a]
	cmp r0, #0xa
	bne _080C9324
	movs r0, #0
	strh r0, [r4, #0x2a]
	adds r0, r4, #0
	bl Proc_Break
	b _080C9328
	.align 2, 0
_080C9310: .4byte gUnknown_08AE4D08
_080C9314: .4byte 0x06013C00
_080C9318: .4byte gUnknown_08AE5730
_080C931C: .4byte gUnknown_08AE53C8
_080C9320: .4byte 0x06014B00
_080C9324:
	adds r0, #1
	strh r0, [r4, #0x2a]
_080C9328:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80C9218

	THUMB_FUNC_START sub_80C9330
sub_80C9330: @ 0x080C9330
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldrh r0, [r4, #0x3e]
	movs r1, #9
	bl DivRem
	adds r3, r0, #0
	movs r0, #9
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0x1a
	bl Interpolate
	adds r3, r0, #0
	cmp r3, #0xc
	bgt _080C9364
	lsls r1, r3, #0x18
	lsrs r1, r1, #0x18
	movs r0, #1
	movs r2, #0x10
	movs r3, #8
	bl SetSpecialColorEffectsParameters
	b _080C9376
_080C9364:
	movs r1, #0x19
	subs r1, r1, r3
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	movs r0, #1
	movs r2, #0x10
	movs r3, #8
	bl SetSpecialColorEffectsParameters
_080C9376:
	ldrh r0, [r4, #0x3e]
	adds r0, #1
	strh r0, [r4, #0x3e]
	ldrh r0, [r4, #0x2a]
	cmp r0, #1
	beq _080C9388
	cmp r0, #2
	beq _080C93BC
	b _080C93D8
_080C9388:
	ldr r0, _080C93A8  @ gUnknown_08AE5750
	ldr r1, _080C93AC  @ 0x06010000
	bl Decompress
	ldr r0, _080C93B0  @ gUnknown_08AE60B0
	movs r1, #0x80
	lsls r1, r1, #2
	movs r2, #0x20
	bl CopyToPalOpAnim
	ldr r0, _080C93B4  @ gUnknown_08AE5D54
	ldr r1, _080C93B8  @ 0x06010F00
	bl Decompress
	b _080C93D8
	.align 2, 0
_080C93A8: .4byte gUnknown_08AE5750
_080C93AC: .4byte 0x06010000
_080C93B0: .4byte gUnknown_08AE60B0
_080C93B4: .4byte gUnknown_08AE5D54
_080C93B8: .4byte 0x06010F00
_080C93BC:
	ldr r0, _080C93EC  @ gUnknown_08AE60D0
	ldr r1, _080C93F0  @ 0x06011E00
	bl Decompress
	ldr r0, _080C93F4  @ gUnknown_08AE69EC
	movs r1, #0x90
	lsls r1, r1, #2
	movs r2, #0x20
	bl CopyToPalOpAnim
	ldr r0, _080C93F8  @ gUnknown_08AE6648
	ldr r1, _080C93FC  @ 0x06012D00
	bl Decompress
_080C93D8:
	ldrh r0, [r4, #0x2a]
	cmp r0, #0xb
	bne _080C9400
	movs r0, #0
	strh r0, [r4, #0x2a]
	adds r0, r4, #0
	bl Proc_Break
	b _080C9404
	.align 2, 0
_080C93EC: .4byte gUnknown_08AE60D0
_080C93F0: .4byte 0x06011E00
_080C93F4: .4byte gUnknown_08AE69EC
_080C93F8: .4byte gUnknown_08AE6648
_080C93FC: .4byte 0x06012D00
_080C9400:
	adds r0, #1
	strh r0, [r4, #0x2a]
_080C9404:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80C9330

	THUMB_FUNC_START sub_80C940C
sub_80C940C: @ 0x080C940C
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldrh r0, [r4, #0x3e]
	movs r1, #8
	bl DivRem
	adds r3, r0, #0
	movs r0, #8
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0x1a
	bl Interpolate
	adds r3, r0, #0
	cmp r3, #0xc
	bgt _080C9440
	lsls r1, r3, #0x18
	lsrs r1, r1, #0x18
	movs r0, #1
	movs r2, #0x10
	movs r3, #8
	bl SetSpecialColorEffectsParameters
	b _080C9452
_080C9440:
	movs r1, #0x19
	subs r1, r1, r3
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	movs r0, #1
	movs r2, #0x10
	movs r3, #8
	bl SetSpecialColorEffectsParameters
_080C9452:
	ldrh r0, [r4, #0x3e]
	adds r0, #1
	strh r0, [r4, #0x3e]
	ldrh r0, [r4, #0x2a]
	cmp r0, #2
	beq _080C94A4
	cmp r0, #2
	bgt _080C9468
	cmp r0, #1
	beq _080C9472
	b _080C9528
_080C9468:
	cmp r0, #3
	beq _080C94D8
	cmp r0, #4
	beq _080C950C
	b _080C9528
_080C9472:
	ldr r0, _080C9490  @ gUnknown_08AE6A0C
	ldr r1, _080C9494  @ 0x06010000
	bl Decompress
	ldr r0, _080C9498  @ gUnknown_08AE72C8
	movs r1, #0x80
	lsls r1, r1, #2
	movs r2, #0x20
	bl CopyToPalOpAnim
	ldr r0, _080C949C  @ gUnknown_08AE6FA8
	ldr r1, _080C94A0  @ 0x06010F00
	bl Decompress
	b _080C9528
	.align 2, 0
_080C9490: .4byte gUnknown_08AE6A0C
_080C9494: .4byte 0x06010000
_080C9498: .4byte gUnknown_08AE72C8
_080C949C: .4byte gUnknown_08AE6FA8
_080C94A0: .4byte 0x06010F00
_080C94A4:
	ldr r0, _080C94C4  @ gUnknown_08AE84DC
	ldr r1, _080C94C8  @ 0x06011E00
	bl Decompress
	ldr r0, _080C94CC  @ gUnknown_08AE8D84
	movs r1, #0x90
	lsls r1, r1, #2
	movs r2, #0x20
	bl CopyToPalOpAnim
	ldr r0, _080C94D0  @ gUnknown_08AE8AB8
	ldr r1, _080C94D4  @ 0x06012D00
	bl Decompress
	b _080C9528
	.align 2, 0
_080C94C4: .4byte gUnknown_08AE84DC
_080C94C8: .4byte 0x06011E00
_080C94CC: .4byte gUnknown_08AE8D84
_080C94D0: .4byte gUnknown_08AE8AB8
_080C94D4: .4byte 0x06012D00
_080C94D8:
	ldr r0, _080C94F8  @ gUnknown_08AE72E8
	ldr r1, _080C94FC  @ 0x06013C00
	bl Decompress
	ldr r0, _080C9500  @ gUnknown_08AE7C2C
	movs r1, #0xa0
	lsls r1, r1, #2
	movs r2, #0x20
	bl CopyToPalOpAnim
	ldr r0, _080C9504  @ gUnknown_08AE78B0
	ldr r1, _080C9508  @ 0x06014B00
	bl Decompress
	b _080C9528
	.align 2, 0
_080C94F8: .4byte gUnknown_08AE72E8
_080C94FC: .4byte 0x06013C00
_080C9500: .4byte gUnknown_08AE7C2C
_080C9504: .4byte gUnknown_08AE78B0
_080C9508: .4byte 0x06014B00
_080C950C:
	ldr r0, _080C953C  @ gUnknown_08AE7C4C
	ldr r1, _080C9540  @ 0x06015A00
	bl Decompress
	ldr r0, _080C9544  @ gUnknown_08AE84BC
	movs r1, #0xb0
	lsls r1, r1, #2
	movs r2, #0x20
	bl CopyToPalOpAnim
	ldr r0, _080C9548  @ gUnknown_08AE819C
	ldr r1, _080C954C  @ 0x06016900
	bl Decompress
_080C9528:
	ldrh r0, [r4, #0x2a]
	cmp r0, #0xc
	bne _080C9550
	movs r0, #0
	strh r0, [r4, #0x2a]
	adds r0, r4, #0
	bl Proc_Break
	b _080C9554
	.align 2, 0
_080C953C: .4byte gUnknown_08AE7C4C
_080C9540: .4byte 0x06015A00
_080C9544: .4byte gUnknown_08AE84BC
_080C9548: .4byte gUnknown_08AE819C
_080C954C: .4byte 0x06016900
_080C9550:
	adds r0, #1
	strh r0, [r4, #0x2a]
_080C9554:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80C940C

	THUMB_FUNC_START sub_80C955C
sub_80C955C: @ 0x080C955C
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldrh r0, [r4, #0x3e]
	movs r1, #7
	bl DivRem
	adds r3, r0, #0
	movs r0, #7
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0x1a
	bl Interpolate
	adds r3, r0, #0
	cmp r3, #0xc
	bgt _080C9590
	lsls r1, r3, #0x18
	lsrs r1, r1, #0x18
	movs r0, #1
	movs r2, #0x10
	movs r3, #8
	bl SetSpecialColorEffectsParameters
	b _080C95A2
_080C9590:
	movs r1, #0x19
	subs r1, r1, r3
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	movs r0, #1
	movs r2, #0x10
	movs r3, #8
	bl SetSpecialColorEffectsParameters
_080C95A2:
	ldrh r0, [r4, #0x3e]
	adds r0, #1
	strh r0, [r4, #0x3e]
	ldrh r0, [r4, #0x2a]
	cmp r0, #1
	beq _080C95B4
	cmp r0, #2
	beq _080C95E8
	b _080C9604
_080C95B4:
	ldr r0, _080C95D4  @ gUnknown_08AE8DA4
	ldr r1, _080C95D8  @ 0x06010000
	bl Decompress
	ldr r0, _080C95DC  @ gUnknown_08AE9720
	movs r1, #0x80
	lsls r1, r1, #2
	movs r2, #0x20
	bl CopyToPalOpAnim
	ldr r0, _080C95E0  @ gUnknown_08AE9364
	ldr r1, _080C95E4  @ 0x06010F00
	bl Decompress
	b _080C9604
	.align 2, 0
_080C95D4: .4byte gUnknown_08AE8DA4
_080C95D8: .4byte 0x06010000
_080C95DC: .4byte gUnknown_08AE9720
_080C95E0: .4byte gUnknown_08AE9364
_080C95E4: .4byte 0x06010F00
_080C95E8:
	ldr r0, _080C9618  @ gUnknown_08AE9740
	ldr r1, _080C961C  @ 0x06011E00
	bl Decompress
	ldr r0, _080C9620  @ gUnknown_08AEA02C
	movs r1, #0x90
	lsls r1, r1, #2
	movs r2, #0x20
	bl CopyToPalOpAnim
	ldr r0, _080C9624  @ gUnknown_08AE9CA4
	ldr r1, _080C9628  @ 0x06012D00
	bl Decompress
_080C9604:
	ldrh r0, [r4, #0x2a]
	cmp r0, #0xd
	bne _080C962C
	movs r0, #0
	strh r0, [r4, #0x2a]
	adds r0, r4, #0
	bl Proc_Break
	b _080C9630
	.align 2, 0
_080C9618: .4byte gUnknown_08AE9740
_080C961C: .4byte 0x06011E00
_080C9620: .4byte gUnknown_08AEA02C
_080C9624: .4byte gUnknown_08AE9CA4
_080C9628: .4byte 0x06012D00
_080C962C:
	adds r0, #1
	strh r0, [r4, #0x2a]
_080C9630:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80C955C

	THUMB_FUNC_START sub_80C9638
sub_80C9638: @ 0x080C9638
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldrh r0, [r4, #0x3e]
	movs r1, #6
	bl DivRem
	adds r3, r0, #0
	movs r0, #6
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0x1a
	bl Interpolate
	adds r3, r0, #0
	cmp r3, #0xc
	bgt _080C966C
	lsls r1, r3, #0x18
	lsrs r1, r1, #0x18
	movs r0, #1
	movs r2, #0x10
	movs r3, #8
	bl SetSpecialColorEffectsParameters
	b _080C967E
_080C966C:
	movs r1, #0x19
	subs r1, r1, r3
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	movs r0, #1
	movs r2, #0x10
	movs r3, #8
	bl SetSpecialColorEffectsParameters
_080C967E:
	ldrh r0, [r4, #0x3e]
	adds r0, #1
	strh r0, [r4, #0x3e]
	ldrh r0, [r4, #0x2a]
	cmp r0, #2
	beq _080C96CC
	cmp r0, #2
	bgt _080C9694
	cmp r0, #1
	beq _080C969A
	b _080C971C
_080C9694:
	cmp r0, #3
	beq _080C9700
	b _080C971C
_080C969A:
	ldr r0, _080C96B8  @ gUnknown_08AECAE0
	ldr r1, _080C96BC  @ 0x06010000
	bl Decompress
	ldr r0, _080C96C0  @ gUnknown_08AED3E8
	movs r1, #0x80
	lsls r1, r1, #2
	movs r2, #0x20
	bl CopyToPalOpAnim
	ldr r0, _080C96C4  @ gUnknown_08AED0A4
	ldr r1, _080C96C8  @ 0x06010F00
	bl Decompress
	b _080C971C
	.align 2, 0
_080C96B8: .4byte gUnknown_08AECAE0
_080C96BC: .4byte 0x06010000
_080C96C0: .4byte gUnknown_08AED3E8
_080C96C4: .4byte gUnknown_08AED0A4
_080C96C8: .4byte 0x06010F00
_080C96CC:
	ldr r0, _080C96EC  @ gUnknown_08AED408
	ldr r1, _080C96F0  @ 0x06011E00
	bl Decompress
	ldr r0, _080C96F4  @ gUnknown_08AEDC80
	movs r1, #0x90
	lsls r1, r1, #2
	movs r2, #0x20
	bl CopyToPalOpAnim
	ldr r0, _080C96F8  @ gUnknown_08AED95C
	ldr r1, _080C96FC  @ 0x06012D00
	bl Decompress
	b _080C971C
	.align 2, 0
_080C96EC: .4byte gUnknown_08AED408
_080C96F0: .4byte 0x06011E00
_080C96F4: .4byte gUnknown_08AEDC80
_080C96F8: .4byte gUnknown_08AED95C
_080C96FC: .4byte 0x06012D00
_080C9700:
	ldr r0, _080C9730  @ gUnknown_08AEDCA0
	ldr r1, _080C9734  @ 0x06013C00
	bl Decompress
	ldr r0, _080C9738  @ gUnknown_08AEE564
	movs r1, #0xa0
	lsls r1, r1, #2
	movs r2, #0x20
	bl CopyToPalOpAnim
	ldr r0, _080C973C  @ gUnknown_08AEE218
	ldr r1, _080C9740  @ 0x06014B00
	bl Decompress
_080C971C:
	ldrh r0, [r4, #0x2a]
	cmp r0, #0xe
	bne _080C9744
	movs r0, #0
	strh r0, [r4, #0x2a]
	adds r0, r4, #0
	bl Proc_Break
	b _080C9748
	.align 2, 0
_080C9730: .4byte gUnknown_08AEDCA0
_080C9734: .4byte 0x06013C00
_080C9738: .4byte gUnknown_08AEE564
_080C973C: .4byte gUnknown_08AEE218
_080C9740: .4byte 0x06014B00
_080C9744:
	adds r0, #1
	strh r0, [r4, #0x2a]
_080C9748:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80C9638

	THUMB_FUNC_START sub_80C9750
sub_80C9750: @ 0x080C9750
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldrh r0, [r4, #0x3e]
	movs r1, #5
	bl DivRem
	adds r3, r0, #0
	movs r0, #5
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0x1a
	bl Interpolate
	adds r3, r0, #0
	cmp r3, #0xc
	bgt _080C9784
	lsls r1, r3, #0x18
	lsrs r1, r1, #0x18
	movs r0, #1
	movs r2, #0x10
	movs r3, #8
	bl SetSpecialColorEffectsParameters
	b _080C9796
_080C9784:
	movs r1, #0x19
	subs r1, r1, r3
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	movs r0, #1
	movs r2, #0x10
	movs r3, #8
	bl SetSpecialColorEffectsParameters
_080C9796:
	ldrh r0, [r4, #0x3e]
	adds r0, #1
	strh r0, [r4, #0x3e]
	ldrh r0, [r4, #0x2a]
	cmp r0, #2
	beq _080C97E8
	cmp r0, #2
	bgt _080C97AC
	cmp r0, #1
	beq _080C97B6
	b _080C986C
_080C97AC:
	cmp r0, #3
	beq _080C981C
	cmp r0, #4
	beq _080C9850
	b _080C986C
_080C97B6:
	ldr r0, _080C97D4  @ gUnknown_08AEA04C
	ldr r1, _080C97D8  @ 0x06010000
	bl Decompress
	ldr r0, _080C97DC  @ gUnknown_08AEAB50
	movs r1, #0x80
	lsls r1, r1, #2
	movs r2, #0x20
	bl CopyToPalOpAnim
	ldr r0, _080C97E0  @ gUnknown_08AEA7A8
	ldr r1, _080C97E4  @ 0x06010F00
	bl Decompress
	b _080C986C
	.align 2, 0
_080C97D4: .4byte gUnknown_08AEA04C
_080C97D8: .4byte 0x06010000
_080C97DC: .4byte gUnknown_08AEAB50
_080C97E0: .4byte gUnknown_08AEA7A8
_080C97E4: .4byte 0x06010F00
_080C97E8:
	ldr r0, _080C9808  @ gUnknown_08AEAB70
	ldr r1, _080C980C  @ 0x06011E00
	bl Decompress
	ldr r0, _080C9810  @ gUnknown_08AEB56C
	movs r1, #0x90
	lsls r1, r1, #2
	movs r2, #0x20
	bl CopyToPalOpAnim
	ldr r0, _080C9814  @ gUnknown_08AEB1B8
	ldr r1, _080C9818  @ 0x06012D00
	bl Decompress
	b _080C986C
	.align 2, 0
_080C9808: .4byte gUnknown_08AEAB70
_080C980C: .4byte 0x06011E00
_080C9810: .4byte gUnknown_08AEB56C
_080C9814: .4byte gUnknown_08AEB1B8
_080C9818: .4byte 0x06012D00
_080C981C:
	ldr r0, _080C983C  @ gUnknown_08AEB58C
	ldr r1, _080C9840  @ 0x06013C00
	bl Decompress
	ldr r0, _080C9844  @ Pal_OpAnimFaceValterShadow
	movs r1, #0xa0
	lsls r1, r1, #2
	movs r2, #0x20
	bl CopyToPalOpAnim
	ldr r0, _080C9848  @ gUnknown_08AEBCEC
	ldr r1, _080C984C  @ 0x06014B00
	bl Decompress
	b _080C986C
	.align 2, 0
_080C983C: .4byte gUnknown_08AEB58C
_080C9840: .4byte 0x06013C00
_080C9844: .4byte Pal_OpAnimFaceValterShadow
_080C9848: .4byte gUnknown_08AEBCEC
_080C984C: .4byte 0x06014B00
_080C9850:
	ldr r0, _080C9880  @ gUnknown_08AEC068
	ldr r1, _080C9884  @ 0x06015A00
	bl Decompress
	ldr r0, _080C9888  @ gUnknown_08AECAC0
	movs r1, #0xb0
	lsls r1, r1, #2
	movs r2, #0x20
	bl CopyToPalOpAnim
	ldr r0, _080C988C  @ gUnknown_08AEC724
	ldr r1, _080C9890  @ 0x06016900
	bl Decompress
_080C986C:
	ldrh r0, [r4, #0x2a]
	cmp r0, #0xf
	bne _080C9894
	movs r0, #0
	strh r0, [r4, #0x2a]
	adds r0, r4, #0
	bl Proc_Break
	b _080C9898
	.align 2, 0
_080C9880: .4byte gUnknown_08AEC068
_080C9884: .4byte 0x06015A00
_080C9888: .4byte gUnknown_08AECAC0
_080C988C: .4byte gUnknown_08AEC724
_080C9890: .4byte 0x06016900
_080C9894:
	adds r0, #1
	strh r0, [r4, #0x2a]
_080C9898:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80C9750

	THUMB_FUNC_START sub_80C98A0
sub_80C98A0: @ 0x080C98A0
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldrh r0, [r4, #0x3e]
	movs r1, #4
	bl DivRem
	adds r3, r0, #0
	movs r0, #4
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0x1a
	bl Interpolate
	adds r3, r0, #0
	cmp r3, #0xc
	bgt _080C98D4
	lsls r1, r3, #0x18
	lsrs r1, r1, #0x18
	movs r0, #1
	movs r2, #0x10
	movs r3, #8
	bl SetSpecialColorEffectsParameters
	b _080C98E6
_080C98D4:
	movs r1, #0x19
	subs r1, r1, r3
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	movs r0, #1
	movs r2, #0x10
	movs r3, #8
	bl SetSpecialColorEffectsParameters
_080C98E6:
	ldrh r0, [r4, #0x3e]
	adds r0, #1
	strh r0, [r4, #0x3e]
	ldrh r0, [r4, #0x2a]
	cmp r0, #2
	beq _080C9934
	cmp r0, #2
	bgt _080C98FC
	cmp r0, #1
	beq _080C9902
	b _080C9984
_080C98FC:
	cmp r0, #3
	beq _080C9968
	b _080C9984
_080C9902:
	ldr r0, _080C9920  @ Img_OpAnimFaceValter
	ldr r1, _080C9924  @ 0x06010000
	bl Decompress
	ldr r0, _080C9928  @ Pal_OpAnimFaceValter
	movs r1, #0x80
	lsls r1, r1, #2
	movs r2, #0x20
	bl CopyToPalOpAnim
	ldr r0, _080C992C  @ Img_OpAnimFaceValterShadow
	ldr r1, _080C9930  @ 0x06010F00
	bl Decompress
	b _080C9984
	.align 2, 0
_080C9920: .4byte Img_OpAnimFaceValter
_080C9924: .4byte 0x06010000
_080C9928: .4byte Pal_OpAnimFaceValter
_080C992C: .4byte Img_OpAnimFaceValterShadow
_080C9930: .4byte 0x06010F00
_080C9934:
	ldr r0, _080C9954  @ gUnknown_08AEEEEC
	ldr r1, _080C9958  @ 0x06011E00
	bl Decompress
	ldr r0, _080C995C  @ gUnknown_08AEF880
	movs r1, #0x90
	lsls r1, r1, #2
	movs r2, #0x20
	bl CopyToPalOpAnim
	ldr r0, _080C9960  @ gUnknown_08AEF580
	ldr r1, _080C9964  @ 0x06012D00
	bl Decompress
	b _080C9984
	.align 2, 0
_080C9954: .4byte gUnknown_08AEEEEC
_080C9958: .4byte 0x06011E00
_080C995C: .4byte gUnknown_08AEF880
_080C9960: .4byte gUnknown_08AEF580
_080C9964: .4byte 0x06012D00
_080C9968:
	ldr r0, _080C9998  @ gUnknown_08AEF8A0
	ldr r1, _080C999C  @ 0x06013C00
	bl Decompress
	ldr r0, _080C99A0  @ Pal_OpAnimFaceVigardeShadow
	movs r1, #0xa0
	lsls r1, r1, #2
	movs r2, #0x20
	bl CopyToPalOpAnim
	ldr r0, _080C99A4  @ gUnknown_08AEFDC8
	ldr r1, _080C99A8  @ 0x06014B00
	bl Decompress
_080C9984:
	ldrh r0, [r4, #0x2a]
	cmp r0, #0x10
	bne _080C99AC
	movs r0, #0
	strh r0, [r4, #0x2a]
	adds r0, r4, #0
	bl Proc_Break
	b _080C99B0
	.align 2, 0
_080C9998: .4byte gUnknown_08AEF8A0
_080C999C: .4byte 0x06013C00
_080C99A0: .4byte Pal_OpAnimFaceVigardeShadow
_080C99A4: .4byte gUnknown_08AEFDC8
_080C99A8: .4byte 0x06014B00
_080C99AC:
	adds r0, #1
	strh r0, [r4, #0x2a]
_080C99B0:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80C98A0

	THUMB_FUNC_START sub_80C99B8
sub_80C99B8: @ 0x080C99B8
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldrh r0, [r4, #0x3e]
	movs r1, #3
	bl DivRem
	adds r3, r0, #0
	movs r0, #3
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0x1a
	bl Interpolate
	adds r3, r0, #0
	cmp r3, #0xc
	bgt _080C99EC
	lsls r1, r3, #0x18
	lsrs r1, r1, #0x18
	movs r0, #1
	movs r2, #0x10
	movs r3, #8
	bl SetSpecialColorEffectsParameters
	b _080C99FE
_080C99EC:
	movs r1, #0x19
	subs r1, r1, r3
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	movs r0, #1
	movs r2, #0x10
	movs r3, #8
	bl SetSpecialColorEffectsParameters
_080C99FE:
	ldrh r0, [r4, #0x3e]
	adds r0, #1
	strh r0, [r4, #0x3e]
	ldrh r0, [r4, #0x2a]
	cmp r0, #1
	beq _080C9A10
	cmp r0, #2
	beq _080C9A44
	b _080C9A60
_080C9A10:
	ldr r0, _080C9A30  @ gUnknown_08AF0150
	ldr r1, _080C9A34  @ 0x06010000
	bl Decompress
	ldr r0, _080C9A38  @ gUnknown_08AF0DE8
	movs r1, #0x80
	lsls r1, r1, #2
	movs r2, #0x20
	bl CopyToPalOpAnim
	ldr r0, _080C9A3C  @ gUnknown_08AF09E4
	ldr r1, _080C9A40  @ 0x06010F00
	bl Decompress
	b _080C9A60
	.align 2, 0
_080C9A30: .4byte gUnknown_08AF0150
_080C9A34: .4byte 0x06010000
_080C9A38: .4byte gUnknown_08AF0DE8
_080C9A3C: .4byte gUnknown_08AF09E4
_080C9A40: .4byte 0x06010F00
_080C9A44:
	ldr r0, _080C9A74  @ Img_OpAnimFaceVigarde
	ldr r1, _080C9A78  @ 0x06011E00
	bl Decompress
	ldr r0, _080C9A7C  @ Pal_OpAnimFaceVigarde
	movs r1, #0x90
	lsls r1, r1, #2
	movs r2, #0x20
	bl CopyToPalOpAnim
	ldr r0, _080C9A80  @ Img_OpAnimFaceVigardeShadow
	ldr r1, _080C9A84  @ 0x06012D00
	bl Decompress
_080C9A60:
	ldrh r0, [r4, #0x2a]
	cmp r0, #0x12
	bne _080C9A88
	movs r0, #0
	strh r0, [r4, #0x2a]
	adds r0, r4, #0
	bl Proc_Break
	b _080C9A8C
	.align 2, 0
_080C9A74: .4byte Img_OpAnimFaceVigarde
_080C9A78: .4byte 0x06011E00
_080C9A7C: .4byte Pal_OpAnimFaceVigarde
_080C9A80: .4byte Img_OpAnimFaceVigardeShadow
_080C9A84: .4byte 0x06012D00
_080C9A88:
	adds r0, #1
	strh r0, [r4, #0x2a]
_080C9A8C:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80C99B8

	THUMB_FUNC_START sub_80C9A94
sub_80C9A94: @ 0x080C9A94
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r2, _080C9AEC  @ gLCDControlBuffer
	ldrb r1, [r2, #1]
	movs r0, #2
	negs r0, r0
	ands r0, r1
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
	ldrh r3, [r4, #0x2a]
	movs r0, #0x30
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0xd
	bl Interpolate
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	movs r0, #1
	movs r2, #0x10
	movs r3, #8
	bl SetSpecialColorEffectsParameters
	ldrh r0, [r4, #0x2a]
	cmp r0, #0x30
	bne _080C9AF0
	movs r0, #0
	strh r0, [r4, #0x2a]
	adds r0, r4, #0
	bl Proc_Break
	b _080C9AF4
	.align 2, 0
_080C9AEC: .4byte gLCDControlBuffer
_080C9AF0:
	adds r0, #1
	strh r0, [r4, #0x2a]
_080C9AF4:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80C9A94

	THUMB_FUNC_START sub_80C9AFC
sub_80C9AFC: @ 0x080C9AFC
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r7, r0, #0
	ldrh r3, [r7, #0x2a]
	movs r0, #0x30
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0x10
	bl Interpolate
	adds r4, r0, #0
	ldr r0, _080C9B50  @ pal_08B103D8
	movs r2, #0x80
	lsls r2, r2, #1
	movs r1, #0
	bl CopyToPalOpAnim
	ldr r5, _080C9B54  @ gPaletteBuffer
	lsls r6, r4, #0x10
	movs r4, #7
_080C9B26:
	adds r0, r5, #0
	ldr r1, _080C9B58  @ 0x00007FFF
	lsrs r2, r6, #0x10
	bl sub_80C69B0
	adds r5, #0x20
	subs r4, #1
	cmp r4, #0
	bge _080C9B26
	ldrh r0, [r7, #0x2a]
	cmp r0, #0x30
	bne _080C9B60
	ldr r0, _080C9B5C  @ gOpAnimSt
	movs r2, #0
	ldr r1, _080C9B58  @ 0x00007FFF
	strh r1, [r0, #0xc]
	strh r2, [r7, #0x2a]
	adds r0, r7, #0
	bl Proc_Break
	b _080C9B64
	.align 2, 0
_080C9B50: .4byte pal_08B103D8
_080C9B54: .4byte gPaletteBuffer
_080C9B58: .4byte 0x00007FFF
_080C9B5C: .4byte gOpAnimSt
_080C9B60:
	adds r0, #1
	strh r0, [r7, #0x2a]
_080C9B64:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80C9AFC

	THUMB_FUNC_START sub_80C9B6C
sub_80C9B6C: @ 0x080C9B6C
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #4
	ldr r4, _080C9C04  @ gLCDControlBuffer
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
	mov r8, r2
	mov r2, r8
	orrs r0, r2
	strb r0, [r4, #0x10]
	ldrb r0, [r4, #0x14]
	ands r1, r0
	movs r6, #2
	orrs r1, r6
	strb r1, [r4, #0x14]
	ldrb r0, [r4, #0x18]
	movs r1, #3
	orrs r0, r1
	strb r0, [r4, #0x18]
	movs r0, #1
	movs r1, #0x10
	movs r2, #0
	movs r3, #8
	bl SetSpecialColorEffectsParameters
	movs r5, #0
	str r5, [sp]
	movs r0, #0
	movs r1, #1
	movs r2, #0
	movs r3, #0
	bl SetBlendTargetA
	str r5, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #1
	bl SetBlendTargetB
	ldrb r0, [r4, #1]
	mov r1, r8
	orrs r0, r1
	orrs r0, r6
	movs r1, #5
	negs r1, r1
	ands r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r4, #1]
	movs r0, #1
	movs r1, #0
	bl SetBackgroundTileDataOffset
	movs r1, #0xe0
	lsls r1, r1, #8
	movs r0, #1
	bl SetBackgroundMapDataOffset
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080C9C04: .4byte gLCDControlBuffer

	THUMB_FUNC_END sub_80C9B6C

	THUMB_FUNC_START sub_80C9C08
sub_80C9C08: @ 0x080C9C08
	push {r4, lr}
	adds r4, r0, #0
	bl sub_80C9B6C
	ldr r0, _080C9C54  @ Pal_OpAnimJoshua
	movs r2, #0xb0
	lsls r2, r2, #1
	movs r1, #0
	bl CopyToPalOpAnim
	adds r1, r4, #0
	adds r1, #0x47
	movs r2, #0
	movs r0, #1
	strb r0, [r1]
	ldr r0, _080C9C58  @ gGenericBuffer
	str r0, [r4, #0x48]
	movs r1, #0x80
	lsls r1, r1, #4
	adds r0, r0, r1
	str r0, [r4, #0x4c]
	adds r1, r4, #0
	adds r1, #0x44
	movs r0, #0x8c
	lsls r0, r0, #1
	strh r0, [r1]
	adds r0, r4, #0
	adds r0, #0x42
	movs r1, #0xe8
	strh r1, [r0]
	subs r0, #2
	strh r1, [r0]
	strh r2, [r4, #0x30]
	strh r2, [r4, #0x32]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C9C54: .4byte Pal_OpAnimJoshua
_080C9C58: .4byte gGenericBuffer

	THUMB_FUNC_END sub_80C9C08

	THUMB_FUNC_START sub_80C9C5C
sub_80C9C5C: @ 0x080C9C5C
	push {r4, lr}
	adds r4, r0, #0
	bl sub_80C9B6C
	ldr r0, _080C9CA4  @ Pal_OpAnimLArachel
	movs r2, #0xb0
	lsls r2, r2, #1
	movs r1, #0
	bl CopyToPalOpAnim
	adds r0, r4, #0
	adds r0, #0x47
	movs r2, #0
	strb r2, [r0]
	ldr r0, _080C9CA8  @ gGenericBuffer
	str r0, [r4, #0x48]
	movs r1, #0x80
	lsls r1, r1, #4
	adds r0, r0, r1
	str r0, [r4, #0x4c]
	adds r1, r4, #0
	adds r1, #0x44
	movs r0, #0xc0
	strh r0, [r1]
	subs r1, #2
	adds r0, #0x80
	strh r0, [r1]
	subs r1, #2
	subs r0, #0x38
	strh r0, [r1]
	strh r2, [r4, #0x30]
	strh r2, [r4, #0x32]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C9CA4: .4byte Pal_OpAnimLArachel
_080C9CA8: .4byte gGenericBuffer

	THUMB_FUNC_END sub_80C9C5C

	THUMB_FUNC_START sub_80C9CAC
sub_80C9CAC: @ 0x080C9CAC
	push {r4, lr}
	adds r4, r0, #0
	bl sub_80C9B6C
	ldr r0, _080C9CF4  @ Pal_OpAnimCharacterSeth
	movs r2, #0xb0
	lsls r2, r2, #1
	movs r1, #0
	bl CopyToPalOpAnim
	adds r1, r4, #0
	adds r1, #0x47
	movs r2, #0
	movs r0, #1
	strb r0, [r1]
	ldr r0, _080C9CF8  @ gGenericBuffer
	str r0, [r4, #0x48]
	movs r1, #0x80
	lsls r1, r1, #4
	adds r0, r0, r1
	str r0, [r4, #0x4c]
	adds r1, r4, #0
	adds r1, #0x44
	movs r0, #0xc0
	strh r0, [r1]
	subs r1, #2
	adds r0, #0x80
	strh r0, [r1]
	subs r1, #2
	subs r0, #0x28
	strh r0, [r1]
	strh r2, [r4, #0x30]
	strh r2, [r4, #0x32]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C9CF4: .4byte Pal_OpAnimCharacterSeth
_080C9CF8: .4byte gGenericBuffer

	THUMB_FUNC_END sub_80C9CAC

	THUMB_FUNC_START sub_80C9CFC
sub_80C9CFC: @ 0x080C9CFC
	push {r4, lr}
	adds r4, r0, #0
	bl sub_80C9B6C
	ldr r0, _080C9D44  @ Pal_OpAnimMyrrh2
	movs r2, #0xb0
	lsls r2, r2, #1
	movs r1, #0
	bl CopyToPalOpAnim
	adds r0, r4, #0
	adds r0, #0x47
	movs r2, #0
	strb r2, [r0]
	ldr r0, _080C9D48  @ gGenericBuffer
	str r0, [r4, #0x48]
	movs r1, #0x80
	lsls r1, r1, #4
	adds r0, r0, r1
	str r0, [r4, #0x4c]
	adds r1, r4, #0
	adds r1, #0x44
	movs r0, #0x88
	lsls r0, r0, #1
	strh r0, [r1]
	subs r1, #2
	movs r0, #0xf0
	strh r0, [r1]
	subs r1, #2
	adds r0, #0x18
	strh r0, [r1]
	strh r2, [r4, #0x30]
	strh r2, [r4, #0x32]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C9D44: .4byte Pal_OpAnimMyrrh2
_080C9D48: .4byte gGenericBuffer

	THUMB_FUNC_END sub_80C9CFC

	THUMB_FUNC_START sub_80C9D4C
sub_80C9D4C: @ 0x080C9D4C
	push {r4, lr}
	adds r4, r0, #0
	bl sub_80C9B6C
	ldr r0, _080C9D98  @ Pal_OpAnimSaleh2
	movs r2, #0xb0
	lsls r2, r2, #1
	movs r1, #0
	bl CopyToPalOpAnim
	adds r1, r4, #0
	adds r1, #0x47
	movs r2, #0
	movs r0, #1
	strb r0, [r1]
	ldr r0, _080C9D9C  @ gGenericBuffer
	str r0, [r4, #0x48]
	movs r1, #0x80
	lsls r1, r1, #4
	adds r0, r0, r1
	str r0, [r4, #0x4c]
	adds r0, r4, #0
	adds r0, #0x44
	movs r1, #0xe8
	strh r1, [r0]
	adds r3, r4, #0
	adds r3, #0x42
	movs r0, #0x8c
	lsls r0, r0, #1
	strh r0, [r3]
	adds r0, r4, #0
	adds r0, #0x40
	strh r1, [r0]
	strh r2, [r4, #0x30]
	strh r2, [r4, #0x32]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C9D98: .4byte Pal_OpAnimSaleh2
_080C9D9C: .4byte gGenericBuffer

	THUMB_FUNC_END sub_80C9D4C

	THUMB_FUNC_START sub_80C9DA0
sub_80C9DA0: @ 0x080C9DA0
	push {r4, lr}
	adds r4, r0, #0
	bl sub_80C9B6C
	ldr r0, _080C9DE8  @ Pal_OpAnimTethys
	movs r2, #0xb0
	lsls r2, r2, #1
	movs r1, #0
	bl CopyToPalOpAnim
	adds r0, r4, #0
	adds r0, #0x47
	movs r2, #0
	strb r2, [r0]
	ldr r0, _080C9DEC  @ gGenericBuffer
	str r0, [r4, #0x48]
	movs r1, #0x80
	lsls r1, r1, #4
	adds r0, r0, r1
	str r0, [r4, #0x4c]
	adds r1, r4, #0
	adds r1, #0x44
	movs r0, #0xc8
	strh r0, [r1]
	subs r1, #2
	adds r0, #0x70
	strh r0, [r1]
	subs r1, #2
	subs r0, #0x10
	strh r0, [r1]
	strh r2, [r4, #0x30]
	strh r2, [r4, #0x32]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C9DE8: .4byte Pal_OpAnimTethys
_080C9DEC: .4byte gGenericBuffer

	THUMB_FUNC_END sub_80C9DA0

	THUMB_FUNC_START sub_80C9DF0
sub_80C9DF0: @ 0x080C9DF0
	push {r4, r5, lr}
	sub sp, #4
	movs r0, #1
	movs r1, #0x10
	movs r2, #0
	movs r3, #8
	bl SetSpecialColorEffectsParameters
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
	ldr r2, _080C9E68  @ gLCDControlBuffer
	ldrb r0, [r2, #1]
	movs r4, #1
	orrs r0, r4
	movs r5, #2
	orrs r0, r5
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2, #1]
	ldrb r3, [r2, #0xc]
	movs r1, #4
	negs r1, r1
	adds r0, r1, #0
	ands r0, r3
	orrs r0, r4
	strb r0, [r2, #0xc]
	ldrb r3, [r2, #0x10]
	adds r0, r1, #0
	ands r0, r3
	orrs r0, r5
	strb r0, [r2, #0x10]
	ldrb r0, [r2, #0x14]
	ands r1, r0
	strb r1, [r2, #0x14]
	ldrb r0, [r2, #0x18]
	movs r1, #3
	orrs r0, r1
	strb r0, [r2, #0x18]
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C9E68: .4byte gLCDControlBuffer

	THUMB_FUNC_END sub_80C9DF0

	THUMB_FUNC_START sub_80C9E6C
sub_80C9E6C: @ 0x080C9E6C
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldrh r0, [r4, #0x38]
	ldrh r1, [r4, #0x3a]
	bl OpAnim1_UpdateScroll
	ldrh r0, [r4, #0x38]
	strh r0, [r4, #0x3a]
	movs r2, #0x9c
	lsls r2, r2, #2
	ldrh r3, [r4, #0x3c]
	movs r0, #0x86
	lsls r0, r0, #3
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	bl Interpolate
	strh r0, [r4, #0x38]
	ldrh r0, [r4, #0x3c]
	adds r0, #1
	strh r0, [r4, #0x3c]
	ldrh r0, [r4, #0x2a]
	cmp r0, #0x10
	bhi _080C9ED8
	adds r3, r0, #0
	movs r0, #0x10
	str r0, [sp]
	movs r0, #0
	movs r1, #0x10
	movs r2, #0
	bl Interpolate
	ldr r2, _080C9ED4  @ gLCDControlBuffer
	adds r1, r2, #0
	adds r1, #0x44
	strb r0, [r1]
	movs r1, #0x10
	subs r1, r1, r0
	adds r2, #0x45
	strb r1, [r2]
	ldrh r0, [r4, #0x2a]
	cmp r0, #0x10
	bne _080C9ED8
	movs r0, #0
	strh r0, [r4, #0x2a]
	adds r0, r4, #0
	bl Proc_Break
	b _080C9EDE
	.align 2, 0
_080C9ED4: .4byte gLCDControlBuffer
_080C9ED8:
	ldrh r0, [r4, #0x2a]
	adds r0, #1
	strh r0, [r4, #0x2a]
_080C9EDE:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80C9E6C

	THUMB_FUNC_START sub_80C9EE8
sub_80C9EE8: @ 0x080C9EE8
	push {r4, lr}
	sub sp, #4
	ldr r0, _080C9F74  @ pal_08B103D8
	movs r2, #0x80
	lsls r2, r2, #1
	movs r1, #0
	bl CopyToPalOpAnim
	movs r0, #1
	movs r1, #0
	movs r2, #0x10
	movs r3, #8
	bl SetSpecialColorEffectsParameters
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
	ldr r3, _080C9F78  @ gLCDControlBuffer
	ldrb r1, [r3, #1]
	movs r0, #2
	negs r0, r0
	ands r0, r1
	movs r1, #3
	negs r1, r1
	ands r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r3, #1]
	ldrb r1, [r3, #0xc]
	movs r2, #4
	negs r2, r2
	adds r0, r2, #0
	ands r0, r1
	movs r1, #1
	orrs r0, r1
	strb r0, [r3, #0xc]
	ldrb r1, [r3, #0x10]
	adds r0, r2, #0
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	strb r0, [r3, #0x10]
	ldrb r0, [r3, #0x14]
	ands r2, r0
	strb r2, [r3, #0x14]
	ldrb r0, [r3, #0x18]
	movs r1, #3
	orrs r0, r1
	strb r0, [r3, #0x18]
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C9F74: .4byte pal_08B103D8
_080C9F78: .4byte gLCDControlBuffer

	THUMB_FUNC_END sub_80C9EE8

	THUMB_FUNC_START sub_80C9F7C
sub_80C9F7C: @ 0x080C9F7C
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldrh r0, [r4, #0x38]
	ldrh r1, [r4, #0x3a]
	bl OpAnim1_UpdateScroll
	ldrh r0, [r4, #0x38]
	strh r0, [r4, #0x3a]
	movs r2, #0x9c
	lsls r2, r2, #2
	ldrh r3, [r4, #0x3c]
	movs r0, #0x86
	lsls r0, r0, #3
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	bl Interpolate
	strh r0, [r4, #0x38]
	ldrh r0, [r4, #0x3c]
	adds r0, #1
	strh r0, [r4, #0x3c]
	ldrh r0, [r4, #0x2a]
	cmp r0, #0x10
	bhi _080C9FE8
	adds r3, r0, #0
	movs r0, #0x10
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0x10
	bl Interpolate
	ldr r2, _080C9FE4  @ gLCDControlBuffer
	adds r1, r2, #0
	adds r1, #0x44
	strb r0, [r1]
	movs r1, #0x10
	subs r1, r1, r0
	adds r2, #0x45
	strb r1, [r2]
	ldrh r0, [r4, #0x2a]
	cmp r0, #0x10
	bne _080C9FE8
	movs r0, #0
	strh r0, [r4, #0x2a]
	adds r0, r4, #0
	bl Proc_Break
	b _080C9FEE
	.align 2, 0
_080C9FE4: .4byte gLCDControlBuffer
_080C9FE8:
	ldrh r0, [r4, #0x2a]
	adds r0, #1
	strh r0, [r4, #0x2a]
_080C9FEE:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80C9F7C

	THUMB_FUNC_START sub_80C9FF8
sub_80C9FF8: @ 0x080C9FF8
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r5, r0, #0
	ldrh r0, [r5, #0x38]
	ldrh r1, [r5, #0x3a]
	bl OpAnim1_UpdateScroll
	ldrh r0, [r5, #0x38]
	strh r0, [r5, #0x3a]
	movs r2, #0x9c
	lsls r2, r2, #2
	ldrh r3, [r5, #0x3c]
	movs r0, #0x86
	lsls r0, r0, #3
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	bl Interpolate
	strh r0, [r5, #0x38]
	ldrh r0, [r5, #0x3c]
	adds r0, #1
	strh r0, [r5, #0x3c]
	movs r0, #1
	bl BG_EnableSyncByMask
	adds r0, r5, #0
	adds r0, #0x40
	ldrh r2, [r0]
	ldrh r3, [r5, #0x2a]
	movs r0, #0x1e
	str r0, [sp]
	movs r0, #4
	movs r1, #0
	bl Interpolate
	adds r7, r0, #0
	adds r0, r5, #0
	adds r0, #0x47
	ldrb r6, [r0]
	cmp r6, #0
	beq _080CA06E
	lsls r0, r7, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x30
	ldrsh r1, [r5, r2]
	adds r4, r5, #0
	adds r4, #0x44
	movs r3, #0
	ldrsh r2, [r4, r3]
	ldr r3, [r5, #0x48]
	str r3, [sp]
	ldr r3, [r5, #0x4c]
	str r3, [sp, #4]
	movs r3, #0
	str r3, [sp, #8]
	bl TsaModifyFirstPalMaybe
	b _080CA08E
_080CA06E:
	lsls r0, r7, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x30
	ldrsh r1, [r5, r2]
	adds r4, r5, #0
	adds r4, #0x44
	movs r3, #0
	ldrsh r2, [r4, r3]
	ldr r3, [r5, #0x48]
	str r3, [sp]
	ldr r3, [r5, #0x4c]
	str r3, [sp, #4]
	str r6, [sp, #8]
	movs r3, #0
	bl sub_80C689C
_080CA08E:
	strh r7, [r5, #0x30]
	ldrh r0, [r5, #0x2a]
	cmp r0, #0x1e
	bne _080CA0FE
	movs r0, #2
	bl BG_EnableSyncByMask
	adds r0, r5, #0
	adds r0, #0x42
	ldrh r0, [r0]
	adds r0, #0xf0
	adds r1, r5, #0
	adds r1, #0x40
	ldrh r1, [r1]
	subs r0, r0, r1
	strh r0, [r5, #0x32]
	adds r0, r5, #0
	adds r0, #0x47
	ldrb r0, [r0]
	cmp r0, #0
	beq _080CA0D6
	movs r1, #0x32
	ldrsh r0, [r5, r1]
	movs r3, #0
	ldrsh r2, [r4, r3]
	ldr r1, [r5, #0x48]
	str r1, [sp]
	ldr r1, [r5, #0x4c]
	str r1, [sp, #4]
	movs r1, #1
	str r1, [sp, #8]
	movs r1, #0
	movs r3, #1
	bl sub_80C689C
	b _080CA0F2
_080CA0D6:
	movs r1, #0x32
	ldrsh r0, [r5, r1]
	movs r3, #0
	ldrsh r2, [r4, r3]
	ldr r1, [r5, #0x48]
	str r1, [sp]
	ldr r1, [r5, #0x4c]
	str r1, [sp, #4]
	movs r1, #1
	str r1, [sp, #8]
	movs r1, #0
	movs r3, #1
	bl TsaModifyFirstPalMaybe
_080CA0F2:
	movs r0, #0
	strh r0, [r5, #0x2a]
	adds r0, r5, #0
	bl Proc_Break
	b _080CA102
_080CA0FE:
	adds r0, #1
	strh r0, [r5, #0x2a]
_080CA102:
	add sp, #0xc
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80C9FF8

	THUMB_FUNC_START sub_80CA10C
sub_80CA10C: @ 0x080CA10C
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r6, r0, #0
	ldrh r0, [r6, #0x38]
	ldrh r1, [r6, #0x3a]
	bl OpAnim1_UpdateScroll
	ldrh r0, [r6, #0x38]
	strh r0, [r6, #0x3a]
	movs r2, #0x9c
	lsls r2, r2, #2
	ldrh r3, [r6, #0x3c]
	movs r0, #0x86
	lsls r0, r0, #3
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	bl Interpolate
	strh r0, [r6, #0x38]
	ldrh r0, [r6, #0x3c]
	adds r0, #1
	strh r0, [r6, #0x3c]
	ldrh r3, [r6, #0x2a]
	movs r0, #0x28
	str r0, [sp]
	movs r0, #1
	movs r1, #8
	movs r2, #0
	bl Interpolate
	adds r5, r0, #0
	lsls r1, r5, #0x18
	lsrs r1, r1, #0x18
	movs r2, #0x10
	subs r2, r2, r5
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	movs r0, #1
	movs r3, #8
	bl SetSpecialColorEffectsParameters
	movs r0, #1
	bl BG_EnableSyncByMask
	adds r0, r6, #0
	adds r0, #0x40
	ldrh r1, [r0]
	adds r2, r1, #0
	adds r2, #0x10
	ldrh r3, [r6, #0x2a]
	movs r0, #0x1e
	str r0, [sp]
	movs r0, #0
	bl Interpolate
	adds r5, r0, #0
	adds r0, r6, #0
	adds r0, #0x47
	ldrb r7, [r0]
	cmp r7, #0
	beq _080CA1AA
	lsls r0, r5, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x30
	ldrsh r1, [r6, r2]
	adds r4, r6, #0
	adds r4, #0x44
	movs r3, #0
	ldrsh r2, [r4, r3]
	ldr r3, [r6, #0x48]
	str r3, [sp]
	ldr r3, [r6, #0x4c]
	str r3, [sp, #4]
	movs r3, #0
	str r3, [sp, #8]
	bl TsaModifyFirstPalMaybe
	b _080CA1CA
_080CA1AA:
	lsls r0, r5, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x30
	ldrsh r1, [r6, r2]
	adds r4, r6, #0
	adds r4, #0x44
	movs r3, #0
	ldrsh r2, [r4, r3]
	ldr r3, [r6, #0x48]
	str r3, [sp]
	ldr r3, [r6, #0x4c]
	str r3, [sp, #4]
	str r7, [sp, #8]
	movs r3, #0
	bl sub_80C689C
_080CA1CA:
	adds r7, r4, #0
	strh r5, [r6, #0x30]
	movs r0, #2
	bl BG_EnableSyncByMask
	ldrh r3, [r6, #0x2a]
	movs r4, #0x3c
	str r4, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0x60
	bl Interpolate
	adds r5, r0, #0
	ldrh r3, [r6, #0x2a]
	str r4, [sp]
	movs r0, #1
	movs r1, #0
	movs r2, #0x60
	bl Interpolate
	adds r1, r6, #0
	adds r1, #0x42
	ldrh r1, [r1]
	adds r1, #0xf0
	adds r2, r6, #0
	adds r2, #0x40
	ldrh r2, [r2]
	subs r1, r1, r2
	adds r1, r1, r5
	adds r5, r1, r0
	adds r0, r6, #0
	adds r0, #0x47
	ldrb r0, [r0]
	cmp r0, #0
	beq _080CA230
	lsls r0, r5, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x32
	ldrsh r1, [r6, r2]
	movs r3, #0
	ldrsh r2, [r7, r3]
	ldr r3, [r6, #0x48]
	str r3, [sp]
	ldr r3, [r6, #0x4c]
	str r3, [sp, #4]
	movs r3, #1
	str r3, [sp, #8]
	bl sub_80C689C
	b _080CA24C
_080CA230:
	lsls r0, r5, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x32
	ldrsh r1, [r6, r2]
	movs r3, #0
	ldrsh r2, [r7, r3]
	ldr r3, [r6, #0x48]
	str r3, [sp]
	ldr r3, [r6, #0x4c]
	str r3, [sp, #4]
	movs r3, #1
	str r3, [sp, #8]
	bl TsaModifyFirstPalMaybe
_080CA24C:
	strh r5, [r6, #0x32]
	ldrh r0, [r6, #0x2a]
	cmp r0, #0x1e
	bne _080CA260
	movs r0, #0
	strh r0, [r6, #0x2a]
	adds r0, r6, #0
	bl Proc_Break
	b _080CA264
_080CA260:
	adds r0, #1
	strh r0, [r6, #0x2a]
_080CA264:
	add sp, #0xc
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80CA10C

	THUMB_FUNC_START sub_80CA26C
sub_80CA26C: @ 0x080CA26C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	adds r7, r0, #0
	ldrh r0, [r7, #0x2a]
	cmp r0, #0xb
	bne _080CA2E6
	ldr r5, _080CA380  @ gLCDControlBuffer
	ldrb r0, [r5, #1]
	movs r1, #1
	orrs r0, r1
	movs r2, #3
	negs r2, r2
	mov sl, r2
	ands r0, r2
	movs r3, #5
	negs r3, r3
	mov r9, r3
	ands r0, r3
	movs r1, #8
	mov r8, r1
	mov r2, r8
	orrs r0, r2
	movs r6, #0x10
	orrs r0, r6
	strb r0, [r5, #1]
	movs r4, #0
	str r4, [sp]
	movs r0, #1
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl SetBlendTargetA
	str r4, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #1
	bl SetBlendTargetB
	movs r0, #1
	movs r1, #0x10
	movs r2, #0
	movs r3, #8
	bl SetSpecialColorEffectsParameters
	ldrb r0, [r5, #1]
	movs r3, #1
	orrs r0, r3
	mov r1, sl
	ands r0, r1
	mov r2, r9
	ands r0, r2
	mov r3, r8
	orrs r0, r3
	orrs r0, r6
	strb r0, [r5, #1]
_080CA2E6:
	ldrh r0, [r7, #0x2a]
	cmp r0, #0xa
	bhi _080CA3A6
	adds r3, r0, #0
	adds r3, #0x1e
	movs r0, #0x28
	str r0, [sp]
	movs r0, #1
	movs r1, #8
	movs r2, #0
	bl Interpolate
	adds r4, r0, #0
	lsls r1, r4, #0x18
	lsrs r1, r1, #0x18
	movs r2, #0x10
	subs r2, r2, r4
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	movs r0, #1
	movs r3, #8
	bl SetSpecialColorEffectsParameters
	movs r0, #2
	bl BG_EnableSyncByMask
	ldrh r3, [r7, #0x2a]
	adds r3, #0x1e
	movs r4, #0x3c
	str r4, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0x60
	bl Interpolate
	adds r5, r0, #0
	ldrh r3, [r7, #0x2a]
	adds r3, #0x1e
	str r4, [sp]
	movs r0, #1
	movs r1, #0
	movs r2, #0x60
	bl Interpolate
	adds r1, r7, #0
	adds r1, #0x42
	ldrh r1, [r1]
	adds r1, #0xf0
	adds r2, r7, #0
	adds r2, #0x40
	ldrh r2, [r2]
	subs r1, r1, r2
	adds r1, r1, r5
	adds r4, r1, r0
	adds r0, r7, #0
	adds r0, #0x47
	ldrb r0, [r0]
	cmp r0, #0
	beq _080CA384
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x32
	ldrsh r1, [r7, r2]
	adds r2, r7, #0
	adds r2, #0x44
	movs r3, #0
	ldrsh r2, [r2, r3]
	ldr r3, [r7, #0x48]
	str r3, [sp]
	ldr r3, [r7, #0x4c]
	str r3, [sp, #4]
	movs r3, #1
	str r3, [sp, #8]
	bl sub_80C689C
	b _080CA3A4
	.align 2, 0
_080CA380: .4byte gLCDControlBuffer
_080CA384:
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x32
	ldrsh r1, [r7, r2]
	adds r2, r7, #0
	adds r2, #0x44
	movs r3, #0
	ldrsh r2, [r2, r3]
	ldr r3, [r7, #0x48]
	str r3, [sp]
	ldr r3, [r7, #0x4c]
	str r3, [sp, #4]
	movs r3, #1
	str r3, [sp, #8]
	bl TsaModifyFirstPalMaybe
_080CA3A4:
	strh r4, [r7, #0x32]
_080CA3A6:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80CA26C

	THUMB_FUNC_START sub_80CA3B8
sub_80CA3B8: @ 0x080CA3B8
	push {r4, r5, r6, lr}
	sub sp, #0xc
	adds r4, r0, #0
	bl sub_80CA26C
	ldrh r0, [r4, #0x38]
	ldrh r1, [r4, #0x3a]
	bl OpAnim1_UpdateScroll
	ldrh r0, [r4, #0x38]
	strh r0, [r4, #0x3a]
	movs r2, #0x9c
	lsls r2, r2, #2
	ldrh r3, [r4, #0x3c]
	movs r0, #0x86
	lsls r0, r0, #3
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	bl Interpolate
	strh r0, [r4, #0x38]
	ldrh r0, [r4, #0x3c]
	adds r0, #1
	strh r0, [r4, #0x3c]
	ldrh r0, [r4, #0x2a]
	adds r3, r0, #0
	subs r3, #0xf
	cmp r3, #0
	blt _080CA412
	movs r0, #0xf
	str r0, [sp]
	movs r0, #0
	movs r1, #0x10
	movs r2, #0
	bl Interpolate
	ldr r2, _080CA460  @ gLCDControlBuffer
	adds r1, r2, #0
	adds r1, #0x44
	strb r0, [r1]
	movs r1, #0x10
	subs r1, r1, r0
	adds r2, #0x45
	strb r1, [r2]
_080CA412:
	movs r0, #1
	bl BG_EnableSyncByMask
	adds r0, r4, #0
	adds r0, #0x40
	ldrh r2, [r0]
	adds r1, r2, #0
	adds r1, #0x10
	lsls r2, r2, #1
	adds r2, #0x10
	ldrh r3, [r4, #0x2a]
	movs r0, #0x1e
	str r0, [sp]
	movs r0, #1
	bl Interpolate
	adds r6, r0, #0
	adds r0, r4, #0
	adds r0, #0x47
	ldrb r5, [r0]
	cmp r5, #0
	beq _080CA464
	lsls r0, r6, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x30
	ldrsh r1, [r4, r2]
	adds r2, r4, #0
	adds r2, #0x44
	movs r3, #0
	ldrsh r2, [r2, r3]
	ldr r3, [r4, #0x48]
	str r3, [sp]
	ldr r3, [r4, #0x4c]
	str r3, [sp, #4]
	movs r3, #0
	str r3, [sp, #8]
	bl TsaModifyFirstPalMaybe
	b _080CA484
	.align 2, 0
_080CA460: .4byte gLCDControlBuffer
_080CA464:
	lsls r0, r6, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x30
	ldrsh r1, [r4, r2]
	adds r2, r4, #0
	adds r2, #0x44
	movs r3, #0
	ldrsh r2, [r2, r3]
	ldr r3, [r4, #0x48]
	str r3, [sp]
	ldr r3, [r4, #0x4c]
	str r3, [sp, #4]
	str r5, [sp, #8]
	movs r3, #0
	bl sub_80C689C
_080CA484:
	strh r6, [r4, #0x30]
	ldrh r0, [r4, #0x2a]
	cmp r0, #0x1e
	bne _080CA498
	movs r0, #0
	strh r0, [r4, #0x2a]
	adds r0, r4, #0
	bl Proc_Break
	b _080CA49C
_080CA498:
	adds r0, #1
	strh r0, [r4, #0x2a]
_080CA49C:
	add sp, #0xc
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80CA3B8

	THUMB_FUNC_START sub_80CA4A4
sub_80CA4A4: @ 0x080CA4A4
	push {lr}
	ldr r0, _080CA4D4  @ gUnknown_08AA707C
	bl Proc_EndEach
	ldr r2, _080CA4D8  @ gLCDControlBuffer
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
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2, #1]
	bl SetDefaultColorEffects
	pop {r0}
	bx r0
	.align 2, 0
_080CA4D4: .4byte gUnknown_08AA707C
_080CA4D8: .4byte gLCDControlBuffer

	THUMB_FUNC_END sub_80CA4A4

	THUMB_FUNC_START sub_80CA4DC
sub_80CA4DC: @ 0x080CA4DC
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r6, r0, #0
	ldrh r0, [r6, #0x2a]
	cmp r0, #4
	bhi _080CA53E
	lsls r0, r0, #2
	ldr r1, _080CA4F4  @ _080CA4F8
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080CA4F4: .4byte _080CA4F8
_080CA4F8: @ jump table
	.4byte _080CA53E @ case 0
	.4byte _080CA50C @ case 1
	.4byte _080CA51A @ case 2
	.4byte _080CA528 @ case 3
	.4byte _080CA536 @ case 4
_080CA50C:
	movs r0, #0xd8
	lsls r0, r0, #1
	movs r1, #0xc4
	lsls r1, r1, #1
	bl OpAnim1_UpdateScroll
	b _080CA53E
_080CA51A:
	movs r0, #0xf8
	lsls r0, r0, #1
	movs r1, #0xd8
	lsls r1, r1, #1
	bl OpAnim1_UpdateScroll
	b _080CA53E
_080CA528:
	movs r0, #0x8c
	lsls r0, r0, #2
	movs r1, #0xf8
	lsls r1, r1, #1
	bl OpAnim1_UpdateScroll
	b _080CA53E
_080CA536:
	movs r0, #0x8c
	lsls r0, r0, #2
	strh r0, [r6, #0x3a]
	strh r0, [r6, #0x38]
_080CA53E:
	ldrh r0, [r6, #0x2a]
	cmp r0, #0x8e
	bls _080CA550
	movs r0, #0xae
	movs r1, #0xa
	movs r2, #4
	movs r3, #9
	bl OpAnimPutObjCommon
_080CA550:
	ldrh r0, [r6, #0x2a]
	cmp r0, #0x8d
	bls _080CA562
	movs r0, #0x38
	movs r1, #0x28
	movs r2, #4
	movs r3, #7
	bl OpAnimPutObjCommon
_080CA562:
	ldrh r0, [r6, #0x2a]
	cmp r0, #0x8c
	bls _080CA574
	movs r0, #0x9c
	movs r1, #0x3a
	movs r2, #3
	movs r3, #3
	bl OpAnimPutObjCommon
_080CA574:
	ldrh r0, [r6, #0x2a]
	cmp r0, #0x8b
	bls _080CA586
	movs r0, #0x22
	movs r1, #0
	movs r2, #4
	movs r3, #1
	bl OpAnimPutObjCommon
_080CA586:
	ldrh r0, [r6, #0x2a]
	cmp r0, #0x8a
	bls _080CA598
	movs r0, #0xd2
	movs r1, #0x10
	movs r2, #4
	movs r3, #5
	bl OpAnimPutObjCommon
_080CA598:
	ldrh r0, [r6, #0x2a]
	cmp r0, #0x89
	bls _080CA5AA
	movs r0, #0xc
	movs r1, #0x1a
	movs r2, #3
	movs r3, #1
	bl OpAnimPutObjCommon
_080CA5AA:
	ldrh r0, [r6, #0x2a]
	cmp r0, #0x88
	bls _080CA5BC
	movs r0, #0xcc
	movs r1, #0x2a
	movs r2, #3
	movs r3, #4
	bl OpAnimPutObjCommon
_080CA5BC:
	ldrh r0, [r6, #0x2a]
	cmp r0, #0x87
	bls _080CA5CE
	movs r0, #0x60
	movs r1, #0
	movs r2, #4
	movs r3, #0
	bl OpAnimPutObjCommon
_080CA5CE:
	ldrh r0, [r6, #0x2a]
	cmp r0, #0x86
	bls _080CA5E0
	movs r0, #0xe4
	movs r1, #0x10
	movs r2, #4
	movs r3, #0xb
	bl OpAnimPutObjCommon
_080CA5E0:
	ldrh r0, [r6, #0x2a]
	cmp r0, #0x85
	bls _080CA5F2
	movs r0, #0x58
	movs r1, #0x1e
	movs r2, #3
	movs r3, #3
	bl OpAnimPutObjCommon
_080CA5F2:
	ldrh r0, [r6, #0x2a]
	cmp r0, #0x84
	bls _080CA604
	movs r0, #0x54
	movs r1, #0x2e
	movs r2, #2
	movs r3, #1
	bl OpAnimPutObjCommon
_080CA604:
	ldrh r0, [r6, #0x2a]
	cmp r0, #0x83
	bls _080CA616
	movs r0, #0
	movs r1, #2
	movs r2, #4
	movs r3, #2
	bl OpAnimPutObjCommon
_080CA616:
	ldrh r0, [r6, #0x2a]
	cmp r0, #0x82
	bls _080CA628
	movs r0, #0xc6
	movs r1, #0x18
	movs r2, #4
	movs r3, #9
	bl OpAnimPutObjCommon
_080CA628:
	ldrh r0, [r6, #0x2a]
	cmp r0, #0x81
	bls _080CA63A
	movs r0, #0x90
	movs r1, #0x22
	movs r2, #3
	movs r3, #5
	bl OpAnimPutObjCommon
_080CA63A:
	ldrh r0, [r6, #0x2a]
	cmp r0, #0x80
	bls _080CA64C
	movs r0, #0xa8
	movs r1, #0x44
	movs r2, #2
	movs r3, #0
	bl OpAnimPutObjCommon
_080CA64C:
	ldrh r0, [r6, #0x2a]
	cmp r0, #0x7f
	bls _080CA65E
	movs r0, #0xca
	movs r1, #2
	movs r2, #4
	movs r3, #7
	bl OpAnimPutObjCommon
_080CA65E:
	ldrh r0, [r6, #0x2a]
	cmp r0, #0x7e
	bls _080CA670
	movs r0, #0x26
	movs r1, #0x18
	movs r2, #4
	movs r3, #2
	bl OpAnimPutObjCommon
_080CA670:
	ldrh r0, [r6, #0x2a]
	cmp r0, #0x7d
	bls _080CA682
	movs r0, #0x80
	movs r1, #0x26
	movs r2, #3
	movs r3, #0
	bl OpAnimPutObjCommon
_080CA682:
	ldrh r0, [r6, #0x2a]
	cmp r0, #0x7b
	bls _080CA694
	movs r0, #0x80
	movs r1, #0x32
	movs r2, #2
	movs r3, #5
	bl OpAnimPutObjCommon
_080CA694:
	ldrh r0, [r6, #0x2a]
	cmp r0, #0x79
	bls _080CA6A6
	movs r0, #0x86
	movs r1, #6
	movs r2, #4
	movs r3, #0
	bl OpAnimPutObjCommon
_080CA6A6:
	ldrh r0, [r6, #0x2a]
	cmp r0, #0x77
	bls _080CA6B8
	movs r0, #0x98
	movs r1, #0x16
	movs r2, #4
	movs r3, #1
	bl OpAnimPutObjCommon
_080CA6B8:
	ldrh r0, [r6, #0x2a]
	cmp r0, #0x75
	bls _080CA6CA
	movs r0, #0xe8
	movs r1, #0x16
	movs r2, #3
	movs r3, #3
	bl OpAnimPutObjCommon
_080CA6CA:
	ldrh r0, [r6, #0x2a]
	cmp r0, #0x73
	bls _080CA6DC
	movs r0, #0x64
	movs r1, #0x48
	movs r2, #2
	movs r3, #1
	bl OpAnimPutObjCommon
_080CA6DC:
	ldrh r0, [r6, #0x2a]
	cmp r0, #0x71
	bls _080CA6EE
	movs r0, #0x70
	movs r1, #6
	movs r2, #4
	movs r3, #0xa
	bl OpAnimPutObjCommon
_080CA6EE:
	ldrh r0, [r6, #0x2a]
	cmp r0, #0x6f
	bls _080CA700
	movs r0, #0x40
	movs r1, #0x14
	movs r2, #4
	movs r3, #8
	bl OpAnimPutObjCommon
_080CA700:
	ldrh r0, [r6, #0x2a]
	cmp r0, #0x6d
	bls _080CA712
	movs r0, #0
	movs r1, #0x2e
	movs r2, #3
	movs r3, #4
	bl OpAnimPutObjCommon
_080CA712:
	ldrh r0, [r6, #0x2a]
	cmp r0, #0x6b
	bls _080CA724
	movs r0, #0x2c
	movs r1, #0x4a
	movs r2, #2
	movs r3, #4
	bl OpAnimPutObjCommon
_080CA724:
	ldrh r0, [r6, #0x2a]
	cmp r0, #0x69
	bls _080CA736
	movs r0, #0x40
	movs r1, #8
	movs r2, #4
	movs r3, #6
	bl OpAnimPutObjCommon
_080CA736:
	ldrh r0, [r6, #0x2a]
	cmp r0, #0x67
	bls _080CA748
	movs r0, #0x78
	movs r1, #0x1a
	movs r2, #4
	movs r3, #2
	bl OpAnimPutObjCommon
_080CA748:
	ldrh r0, [r6, #0x2a]
	cmp r0, #0x65
	bls _080CA75A
	movs r0, #0x24
	movs r1, #0x32
	movs r2, #3
	movs r3, #2
	bl OpAnimPutObjCommon
_080CA75A:
	ldrh r0, [r6, #0x2a]
	cmp r0, #0x62
	bls _080CA76C
	movs r0, #0xe
	movs r1, #0x4e
	movs r2, #2
	movs r3, #0
	bl OpAnimPutObjCommon
_080CA76C:
	ldrh r0, [r6, #0x2a]
	cmp r0, #0x5f
	bls _080CA77E
	movs r0, #0x16
	movs r1, #0xa
	movs r2, #4
	movs r3, #4
	bl OpAnimPutObjCommon
_080CA77E:
	ldrh r0, [r6, #0x2a]
	cmp r0, #0x5c
	bls _080CA790
	movs r0, #0xb4
	movs r1, #0x28
	movs r2, #4
	movs r3, #1
	bl OpAnimPutObjCommon
_080CA790:
	ldrh r0, [r6, #0x2a]
	cmp r0, #0x59
	bls _080CA7A2
	movs r0, #0x42
	movs r1, #0x36
	movs r2, #3
	movs r3, #1
	bl OpAnimPutObjCommon
_080CA7A2:
	ldrh r0, [r6, #0x2a]
	cmp r0, #0x55
	bls _080CA7B4
	movs r0, #0xdc
	movs r1, #0x32
	movs r2, #2
	movs r3, #2
	bl OpAnimPutObjCommon
_080CA7B4:
	ldrh r0, [r6, #0x2a]
	cmp r0, #0x51
	bls _080CA7C6
	movs r0, #0xc8
	movs r1, #0x48
	movs r2, #1
	movs r3, #0
	bl OpAnimPutObjCommon
_080CA7C6:
	ldrh r0, [r6, #0x2a]
	cmp r0, #0x4c
	bls _080CA7D8
	movs r0, #0x38
	movs r1, #0x28
	movs r2, #4
	movs r3, #0
	bl OpAnimPutObjCommon
_080CA7D8:
	ldrh r0, [r6, #0x2a]
	cmp r0, #0x47
	bls _080CA7EA
	movs r0, #0x8c
	movs r1, #0x54
	movs r2, #1
	movs r3, #2
	bl OpAnimPutObjCommon
_080CA7EA:
	ldrh r0, [r6, #0x2a]
	cmp r0, #0x41
	bls _080CA7FC
	movs r0, #0x10
	movs r1, #0x64
	movs r2, #1
	movs r3, #1
	bl OpAnimPutObjCommon
_080CA7FC:
	ldrh r0, [r6, #0x2a]
	cmp r0, #0x37
	bls _080CA80E
	movs r0, #0
	movs r1, #0x7e
	movs r2, #0
	movs r3, #1
	bl OpAnimPutObjCommon
_080CA80E:
	ldrh r0, [r6, #0x2a]
	cmp r0, #0x31
	bls _080CA820
	movs r0, #0xa0
	movs r1, #0x78
	movs r2, #0
	movs r3, #2
	bl OpAnimPutObjCommon
_080CA820:
	ldrh r0, [r6, #0x2a]
	cmp r0, #0x1d
	bls _080CA832
	movs r0, #0x58
	movs r1, #0x70
	movs r2, #0
	movs r3, #0
	bl OpAnimPutObjCommon
_080CA832:
	ldrh r0, [r6, #0x2a]
	adds r4, r0, #0
	subs r4, #0x52
	cmp r4, #0
	bne _080CA870
	ldr r2, _080CA914  @ gLCDControlBuffer
	ldrb r1, [r2, #1]
	movs r0, #2
	negs r0, r0
	ands r0, r1
	movs r1, #3
	negs r1, r1
	ands r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #9
	negs r1, r1
	ands r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2, #1]
	movs r1, #0x80
	lsls r1, r1, #8
	movs r0, #2
	bl SetBackgroundTileDataOffset
	movs r1, #0xe8
	lsls r1, r1, #8
	movs r0, #2
	bl SetBackgroundMapDataOffset
_080CA870:
	cmp r4, #0x5f
	bhi _080CA8A8
	ldr r0, _080CA918  @ pal_08B103D8
	movs r2, #0x80
	lsls r2, r2, #1
	movs r1, #0
	bl CopyToPalOpAnim
	movs r0, #0x5f
	str r0, [sp]
	movs r0, #4
	movs r1, #0x10
	movs r2, #0xc
	adds r3, r4, #0
	bl Interpolate
	ldr r5, _080CA91C  @ gPaletteBuffer
	lsls r7, r0, #0x10
	movs r4, #7
_080CA896:
	adds r0, r5, #0
	movs r1, #0
	lsrs r2, r7, #0x10
	bl sub_80C69B0
	adds r5, #0x20
	subs r4, #1
	cmp r4, #0
	bge _080CA896
_080CA8A8:
	ldrh r0, [r6, #0x2a]
	adds r4, r0, #0
	subs r4, #0xb1
	cmp r4, #0
	bne _080CA8DC
	movs r0, #1
	movs r1, #0x10
	movs r2, #0
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	movs r0, #1
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl SetBlendTargetA
	str r4, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #1
	movs r3, #0
	bl SetBlendTargetB
_080CA8DC:
	cmp r4, #0x20
	bhi _080CA900
	movs r0, #0x20
	str r0, [sp]
	movs r0, #0
	movs r1, #0x10
	movs r2, #0
	adds r3, r4, #0
	bl Interpolate
	ldr r2, _080CA914  @ gLCDControlBuffer
	adds r1, r2, #0
	adds r1, #0x44
	strb r0, [r1]
	movs r1, #0x10
	subs r1, r1, r0
	adds r2, #0x45
	strb r1, [r2]
_080CA900:
	ldrh r0, [r6, #0x2a]
	cmp r0, #0xd1
	bne _080CA920
	movs r0, #0
	strh r0, [r6, #0x2a]
	adds r0, r6, #0
	bl Proc_Break
	b _080CA924
	.align 2, 0
_080CA914: .4byte gLCDControlBuffer
_080CA918: .4byte pal_08B103D8
_080CA91C: .4byte gPaletteBuffer
_080CA920:
	adds r0, #1
	strh r0, [r6, #0x2a]
_080CA924:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80CA4DC

	THUMB_FUNC_START sub_80CA92C
sub_80CA92C: @ 0x080CA92C
	push {r4, lr}
	adds r4, r0, #0
	bl SetDefaultColorEffects
	adds r4, #0x46
	movs r0, #1
	strb r0, [r4]
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80CA92C

	THUMB_FUNC_START sub_80CA940
sub_80CA940: @ 0x080CA940
	push {r4, r5, r6, lr}
	mov r6, r9
	mov r5, r8
	push {r5, r6}
	sub sp, #4
	ldr r0, _080CA9F0  @ gUnknown_08AA707C
	bl Proc_EndEach
	movs r0, #3
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	ldr r3, _080CA9F4  @ gLCDControlBuffer
	ldrb r1, [r3, #1]
	movs r2, #2
	negs r2, r2
	adds r0, r2, #0
	ands r0, r1
	movs r5, #3
	negs r5, r5
	ands r0, r5
	movs r1, #4
	mov r8, r1
	mov r1, r8
	orrs r0, r1
	movs r4, #9
	negs r4, r4
	ands r0, r4
	movs r6, #0x10
	orrs r0, r6
	movs r1, #0x21
	negs r1, r1
	mov r9, r1
	ands r0, r1
	subs r1, #0x20
	ands r0, r1
	movs r1, #0x80
	orrs r0, r1
	strb r0, [r3, #1]
	movs r0, #0x37
	adds r0, r0, r3
	mov ip, r0
	ldrb r1, [r0]
	adds r0, r2, #0
	ands r0, r1
	ands r0, r5
	mov r1, r8
	orrs r0, r1
	ands r0, r4
	orrs r0, r6
	adds r3, #0x36
	ldrb r1, [r3]
	ands r2, r1
	ands r2, r5
	movs r1, #5
	negs r1, r1
	ands r2, r1
	ands r2, r4
	subs r1, #0xc
	ands r2, r1
	movs r1, #0x20
	orrs r0, r1
	mov r1, ip
	strb r0, [r1]
	mov r0, r9
	ands r2, r0
	strb r2, [r3]
	movs r0, #1
	movs r1, #4
	movs r2, #8
	movs r3, #8
	bl SetSpecialColorEffectsParameters
	movs r0, #0
	str r0, [sp]
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl SetBlendTargetA
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080CA9F0: .4byte gUnknown_08AA707C
_080CA9F4: .4byte gLCDControlBuffer

	THUMB_FUNC_END sub_80CA940

	THUMB_FUNC_START sub_80CA9F8
sub_80CA9F8: @ 0x080CA9F8
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r0, r1, #0
	subs r2, r3, r2
	movs r5, #0x10
	subs r3, r5, r2
	cmp r3, #0
	bge _080CAA14
	ldr r0, _080CAA10  @ 0x0000FFFF
	b _080CAA2E
	.align 2, 0
_080CAA10: .4byte 0x0000FFFF
_080CAA14:
	cmp r3, #0xf
	bgt _080CAA2C
	lsls r1, r0, #4
	subs r1, r1, r0
	lsls r1, r1, #4
	adds r1, r4, r1
	str r5, [sp]
	movs r0, #4
	adds r2, r4, #0
	bl Interpolate
	b _080CAA2E
_080CAA2C:
	adds r0, r4, #0
_080CAA2E:
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80CA9F8

	THUMB_FUNC_START sub_80CAA38
sub_80CAA38: @ 0x080CAA38
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov r9, r0
	ldrh r0, [r0, #0x2a]
	adds r2, r0, #0
	adds r2, #0xa
	movs r0, #0x78
	movs r1, #1
	negs r1, r1
	movs r3, #0x14
	bl sub_80CA9F8
	adds r7, r0, #0
	ldr r0, _080CAB60  @ 0x0000FFFF
	mov sl, r0
	cmp r7, sl
	beq _080CAAA2
	adds r4, r7, #0
	subs r4, #0x30
	ldr r5, _080CAB64  @ 0x000001FF
	ands r4, r5
	ldr r6, _080CAB68  @ gUnknown_08AA709C
	movs r1, #0
	mov r8, r1
	str r1, [sp]
	movs r0, #1
	adds r1, r4, #0
	movs r2, #0xec
	adds r3, r6, #0
	bl PutSpriteExt
	adds r1, r7, #0
	subs r1, #0x2c
	ands r1, r5
	ldr r2, _080CAB6C  @ 0x000004EC
	ldr r0, _080CAB70  @ 0x00001078
	str r0, [sp]
	movs r0, #2
	adds r3, r6, #0
	bl PutSpriteExt
	ldr r2, _080CAB74  @ 0x00000804
	ldr r3, _080CAB78  @ gUnknown_08AA70BC
	mov r0, r8
	str r0, [sp]
	movs r0, #0
	adds r1, r4, #0
	bl PutSpriteExt
_080CAAA2:
	mov r1, r9
	ldrh r0, [r1, #0x2a]
	adds r2, r0, #6
	movs r0, #0x78
	movs r1, #1
	negs r1, r1
	movs r3, #0x14
	bl sub_80CA9F8
	adds r7, r0, #0
	cmp r7, sl
	beq _080CAAF8
	adds r4, r7, #0
	subs r4, #0x30
	ldr r5, _080CAB64  @ 0x000001FF
	ands r4, r5
	ldr r6, _080CAB68  @ gUnknown_08AA709C
	ldr r0, _080CAB7C  @ 0x000020F0
	str r0, [sp]
	movs r0, #1
	adds r1, r4, #0
	movs r2, #0x20
	adds r3, r6, #0
	bl PutSpriteExt
	adds r1, r7, #0
	subs r1, #0x2c
	ands r1, r5
	movs r2, #0x84
	lsls r2, r2, #3
	ldr r0, _080CAB80  @ 0x00003168
	str r0, [sp]
	movs r0, #2
	adds r3, r6, #0
	bl PutSpriteExt
	ldr r2, _080CAB84  @ 0x00000838
	ldr r3, _080CAB78  @ gUnknown_08AA70BC
	movs r0, #0
	str r0, [sp]
	adds r1, r4, #0
	bl PutSpriteExt
_080CAAF8:
	mov r1, r9
	ldrh r0, [r1, #0x2a]
	adds r2, r0, #2
	movs r0, #0x78
	movs r1, #1
	negs r1, r1
	movs r3, #0x14
	bl sub_80CA9F8
	adds r7, r0, #0
	cmp r7, sl
	beq _080CAB4C
	adds r4, r7, #0
	subs r4, #0x30
	ldr r5, _080CAB64  @ 0x000001FF
	ands r4, r5
	ldr r6, _080CAB68  @ gUnknown_08AA709C
	ldr r0, _080CAB88  @ 0x000041E0
	str r0, [sp]
	movs r0, #1
	adds r1, r4, #0
	movs r2, #0x54
	adds r3, r6, #0
	bl PutSpriteExt
	adds r1, r7, #0
	subs r1, #0x2c
	ands r1, r5
	ldr r2, _080CAB8C  @ 0x00000454
	ldr r0, _080CAB90  @ 0x00005258
	str r0, [sp]
	movs r0, #2
	adds r3, r6, #0
	bl PutSpriteExt
	ldr r2, _080CAB94  @ 0x0000086C
	ldr r3, _080CAB78  @ gUnknown_08AA70BC
	movs r0, #0
	str r0, [sp]
	adds r1, r4, #0
	bl PutSpriteExt
_080CAB4C:
	mov r1, r9
	ldrh r0, [r1, #0x2a]
	cmp r0, #0x14
	bne _080CAB98
	movs r0, #0
	strh r0, [r1, #0x2a]
	mov r0, r9
	bl Proc_Break
	b _080CAB9E
	.align 2, 0
_080CAB60: .4byte 0x0000FFFF
_080CAB64: .4byte 0x000001FF
_080CAB68: .4byte gUnknown_08AA709C
_080CAB6C: .4byte 0x000004EC
_080CAB70: .4byte 0x00001078
_080CAB74: .4byte 0x00000804
_080CAB78: .4byte gUnknown_08AA70BC
_080CAB7C: .4byte 0x000020F0
_080CAB80: .4byte 0x00003168
_080CAB84: .4byte 0x00000838
_080CAB88: .4byte 0x000041E0
_080CAB8C: .4byte 0x00000454
_080CAB90: .4byte 0x00005258
_080CAB94: .4byte 0x0000086C
_080CAB98:
	adds r0, #1
	mov r1, r9
	strh r0, [r1, #0x2a]
_080CAB9E:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80CAA38

	THUMB_FUNC_START sub_80CABB0
sub_80CABB0: @ 0x080CABB0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	str r0, [sp, #4]
	ldrh r4, [r0, #0x2a]
	adds r4, #2
	movs r5, #1
	negs r5, r5
	movs r0, #0x42
	adds r1, r5, #0
	adds r2, r4, #0
	movs r3, #0x12
	bl sub_80CA9F8
	mov sl, r0
	movs r0, #0x2a
	adds r1, r5, #0
	adds r2, r4, #0
	movs r3, #0x12
	bl sub_80CA9F8
	adds r7, r0, #0
	movs r0, #0xae
	movs r1, #1
	adds r2, r4, #0
	movs r3, #0x12
	bl sub_80CA9F8
	str r0, [sp, #8]
	movs r0, #0x76
	movs r1, #1
	adds r2, r4, #0
	movs r3, #0x12
	bl sub_80CA9F8
	str r0, [sp, #0xc]
	ldr r0, _080CADDC  @ 0x0000FFFF
	cmp sl, r0
	beq _080CACE0
	cmp r7, r0
	beq _080CAC6E
	movs r0, #0x28
	negs r0, r0
	cmp r7, r0
	blt _080CAC6E
	cmp r7, #0xc8
	bgt _080CAC6E
	mov r5, sl
	subs r5, #0x30
	ldr r6, _080CADE0  @ 0x000001FF
	ands r5, r6
	adds r4, r7, #0
	subs r4, #0x28
	movs r0, #0xff
	mov r9, r0
	ands r4, r0
	ldr r1, _080CADE4  @ gUnknown_08AA709C
	mov r8, r1
	movs r0, #0
	str r0, [sp]
	movs r0, #1
	adds r1, r5, #0
	adds r2, r4, #0
	mov r3, r8
	bl PutSpriteExt
	mov r1, sl
	subs r1, #0x2c
	ands r1, r6
	movs r0, #0x80
	lsls r0, r0, #3
	orrs r4, r0
	ldr r0, _080CADE8  @ 0x00001078
	str r0, [sp]
	movs r0, #2
	adds r2, r4, #0
	mov r3, r8
	bl PutSpriteExt
	adds r2, r7, #0
	subs r2, #0x20
	mov r1, r9
	ands r2, r1
	movs r0, #0x80
	lsls r0, r0, #4
	orrs r2, r0
	ldr r3, _080CADEC  @ gUnknown_08AA70DC
	movs r0, #0
	str r0, [sp]
	adds r1, r5, #0
	bl PutSpriteExt
_080CAC6E:
	ldr r0, _080CADDC  @ 0x0000FFFF
	cmp sl, r0
	beq _080CACE0
	ldr r1, [sp, #0xc]
	cmp r1, r0
	beq _080CACE0
	movs r0, #0x28
	negs r0, r0
	cmp r1, r0
	blt _080CACE0
	cmp r1, #0xc8
	bgt _080CACE0
	mov r5, sl
	subs r5, #0x30
	ldr r6, _080CADE0  @ 0x000001FF
	ands r5, r6
	adds r4, r1, #0
	subs r4, #0x28
	movs r0, #0xff
	mov r9, r0
	ands r4, r0
	ldr r1, _080CADE4  @ gUnknown_08AA709C
	mov r8, r1
	ldr r0, _080CADF0  @ 0x000020F0
	str r0, [sp]
	movs r0, #1
	adds r1, r5, #0
	adds r2, r4, #0
	mov r3, r8
	bl PutSpriteExt
	mov r1, sl
	subs r1, #0x2c
	ands r1, r6
	movs r0, #0x80
	lsls r0, r0, #3
	orrs r4, r0
	ldr r0, _080CADF4  @ 0x00003168
	str r0, [sp]
	movs r0, #2
	adds r2, r4, #0
	mov r3, r8
	bl PutSpriteExt
	ldr r2, [sp, #0xc]
	subs r2, #0x20
	mov r0, r9
	ands r2, r0
	movs r0, #0x80
	lsls r0, r0, #4
	orrs r2, r0
	ldr r3, _080CADEC  @ gUnknown_08AA70DC
	movs r0, #0
	str r0, [sp]
	adds r1, r5, #0
	bl PutSpriteExt
_080CACE0:
	ldr r0, _080CADDC  @ 0x0000FFFF
	ldr r1, [sp, #8]
	cmp r1, r0
	beq _080CADC6
	cmp r7, r0
	beq _080CAD52
	movs r0, #0x28
	negs r0, r0
	cmp r7, r0
	blt _080CAD52
	cmp r7, #0xc8
	bgt _080CAD52
	adds r5, r1, #0
	subs r5, #0x30
	ldr r6, _080CADE0  @ 0x000001FF
	ands r5, r6
	adds r4, r7, #0
	subs r4, #0x28
	movs r0, #0xff
	mov r9, r0
	ands r4, r0
	ldr r1, _080CADE4  @ gUnknown_08AA709C
	mov r8, r1
	ldr r0, _080CADF8  @ 0x000041E0
	str r0, [sp]
	movs r0, #1
	adds r1, r5, #0
	adds r2, r4, #0
	mov r3, r8
	bl PutSpriteExt
	ldr r1, [sp, #8]
	subs r1, #0x2c
	ands r1, r6
	movs r0, #0x80
	lsls r0, r0, #3
	orrs r4, r0
	ldr r0, _080CADFC  @ 0x00005258
	str r0, [sp]
	movs r0, #2
	adds r2, r4, #0
	mov r3, r8
	bl PutSpriteExt
	adds r2, r7, #0
	subs r2, #0x20
	mov r0, r9
	ands r2, r0
	movs r0, #0x80
	lsls r0, r0, #4
	orrs r2, r0
	ldr r3, _080CADEC  @ gUnknown_08AA70DC
	movs r0, #0
	str r0, [sp]
	adds r1, r5, #0
	bl PutSpriteExt
_080CAD52:
	ldr r0, _080CADDC  @ 0x0000FFFF
	ldr r1, [sp, #8]
	cmp r1, r0
	beq _080CADC6
	ldr r1, [sp, #0xc]
	cmp r1, r0
	beq _080CADC6
	movs r0, #0x28
	negs r0, r0
	cmp r1, r0
	blt _080CADC6
	cmp r1, #0xc8
	bgt _080CADC6
	ldr r5, [sp, #8]
	subs r5, #0x30
	ldr r6, _080CADE0  @ 0x000001FF
	ands r5, r6
	adds r4, r1, #0
	subs r4, #0x28
	movs r0, #0xff
	mov r9, r0
	ands r4, r0
	ldr r1, _080CADE4  @ gUnknown_08AA709C
	mov r8, r1
	ldr r0, _080CAE00  @ 0x000062D0
	str r0, [sp]
	movs r0, #1
	adds r1, r5, #0
	adds r2, r4, #0
	mov r3, r8
	bl PutSpriteExt
	ldr r1, [sp, #8]
	subs r1, #0x2c
	ands r1, r6
	movs r0, #0x80
	lsls r0, r0, #3
	orrs r4, r0
	ldr r0, _080CAE04  @ 0x00007348
	str r0, [sp]
	movs r0, #2
	adds r2, r4, #0
	mov r3, r8
	bl PutSpriteExt
	ldr r2, [sp, #0xc]
	subs r2, #0x20
	mov r0, r9
	ands r2, r0
	movs r0, #0x80
	lsls r0, r0, #4
	orrs r2, r0
	ldr r3, _080CADEC  @ gUnknown_08AA70DC
	movs r0, #0
	str r0, [sp]
	adds r1, r5, #0
	bl PutSpriteExt
_080CADC6:
	ldr r1, [sp, #4]
	ldrh r0, [r1, #0x2a]
	cmp r0, #0x12
	bne _080CAE08
	movs r0, #0
	strh r0, [r1, #0x2a]
	ldr r0, [sp, #4]
	bl Proc_Break
	b _080CAE0E
	.align 2, 0
_080CADDC: .4byte 0x0000FFFF
_080CADE0: .4byte 0x000001FF
_080CADE4: .4byte gUnknown_08AA709C
_080CADE8: .4byte 0x00001078
_080CADEC: .4byte gUnknown_08AA70DC
_080CADF0: .4byte 0x000020F0
_080CADF4: .4byte 0x00003168
_080CADF8: .4byte 0x000041E0
_080CADFC: .4byte 0x00005258
_080CAE00: .4byte 0x000062D0
_080CAE04: .4byte 0x00007348
_080CAE08:
	adds r0, #1
	ldr r1, [sp, #4]
	strh r0, [r1, #0x2a]
_080CAE0E:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80CABB0

	THUMB_FUNC_START sub_80CAE20
sub_80CAE20: @ 0x080CAE20
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov r8, r0
	ldrh r0, [r0, #0x2a]
	adds r0, #2
	mov r9, r0
	movs r1, #1
	negs r1, r1
	movs r0, #0x3e
	mov r2, r9
	movs r3, #0x10
	bl sub_80CA9F8
	adds r7, r0, #0
	ldr r0, _080CAEF4  @ 0x0000FFFF
	mov sl, r0
	cmp r7, sl
	beq _080CAE8C
	adds r1, r7, #0
	subs r1, #0x20
	ldr r4, _080CAEF8  @ 0x000001FF
	ands r1, r4
	ldr r5, _080CAEFC  @ gUnknown_08AA709C
	movs r6, #0
	str r6, [sp]
	movs r0, #1
	movs r2, #0x20
	adds r3, r5, #0
	bl PutSpriteExt
	adds r1, r7, #0
	subs r1, #0x1c
	ands r1, r4
	movs r2, #0x84
	lsls r2, r2, #3
	ldr r0, _080CAF00  @ 0x00001078
	str r0, [sp]
	movs r0, #2
	adds r3, r5, #0
	bl PutSpriteExt
	adds r1, r7, #0
	subs r1, #0x38
	ands r1, r4
	ldr r2, _080CAF04  @ 0x00000838
	ldr r3, _080CAF08  @ gUnknown_08AA70EA
	str r6, [sp]
	movs r0, #0
	bl PutSpriteExt
_080CAE8C:
	movs r0, #0xb2
	movs r1, #1
	mov r2, r9
	movs r3, #0x10
	bl sub_80CA9F8
	adds r7, r0, #0
	cmp r7, sl
	beq _080CAEDE
	adds r1, r7, #0
	subs r1, #0x40
	ldr r4, _080CAEF8  @ 0x000001FF
	ands r1, r4
	ldr r5, _080CAEFC  @ gUnknown_08AA709C
	ldr r0, _080CAF0C  @ 0x000020F0
	str r0, [sp]
	movs r0, #1
	movs r2, #0x20
	adds r3, r5, #0
	bl PutSpriteExt
	adds r1, r7, #0
	subs r1, #0x3c
	ands r1, r4
	movs r2, #0x84
	lsls r2, r2, #3
	ldr r0, _080CAF10  @ 0x00003168
	str r0, [sp]
	movs r0, #2
	adds r3, r5, #0
	bl PutSpriteExt
	adds r1, r7, #0
	subs r1, #0x38
	ands r1, r4
	ldr r2, _080CAF04  @ 0x00000838
	ldr r3, _080CAF08  @ gUnknown_08AA70EA
	movs r0, #0
	str r0, [sp]
	bl PutSpriteExt
_080CAEDE:
	mov r1, r8
	ldrh r0, [r1, #0x2a]
	cmp r0, #0x10
	bne _080CAF14
	movs r0, #0
	strh r0, [r1, #0x2a]
	mov r0, r8
	bl Proc_Break
	b _080CAF1A
	.align 2, 0
_080CAEF4: .4byte 0x0000FFFF
_080CAEF8: .4byte 0x000001FF
_080CAEFC: .4byte gUnknown_08AA709C
_080CAF00: .4byte 0x00001078
_080CAF04: .4byte 0x00000838
_080CAF08: .4byte gUnknown_08AA70EA
_080CAF0C: .4byte 0x000020F0
_080CAF10: .4byte 0x00003168
_080CAF14:
	adds r0, #1
	mov r1, r8
	strh r0, [r1, #0x2a]
_080CAF1A:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80CAE20

	THUMB_FUNC_START sub_80CAF2C
sub_80CAF2C: @ 0x080CAF2C
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r7, r0, #0
	ldrh r0, [r7, #0x2a]
	adds r2, r0, #0
	adds r2, #0xa
	movs r1, #1
	negs r1, r1
	movs r0, #0x50
	movs r3, #0xf
	bl sub_80CA9F8
	adds r4, r0, #0
	ldr r0, _080CB074  @ 0x0000FFFF
	cmp r4, r0
	beq _080CAF98
	movs r0, #0x28
	negs r0, r0
	cmp r4, r0
	blt _080CAF98
	cmp r4, #0xc8
	bgt _080CAF98
	movs r6, #0
	subs r4, #0x28
	movs r0, #0xff
	ands r4, r0
	ldr r5, _080CB078  @ gUnknown_08AA709C
	str r6, [sp]
	movs r0, #1
	movs r1, #0
	adds r2, r4, #0
	adds r3, r5, #0
	bl PutSpriteExt
	movs r2, #0x80
	lsls r2, r2, #3
	orrs r2, r4
	ldr r0, _080CB07C  @ 0x00001078
	str r0, [sp]
	movs r0, #2
	movs r1, #4
	adds r3, r5, #0
	bl PutSpriteExt
	movs r0, #0x80
	lsls r0, r0, #4
	orrs r4, r0
	ldr r3, _080CB080  @ gUnknown_08AA7116
	str r6, [sp]
	movs r0, #0
	movs r1, #0x10
	adds r2, r4, #0
	bl PutSpriteExt
_080CAF98:
	ldrh r0, [r7, #0x2a]
	adds r2, r0, #6
	movs r1, #1
	negs r1, r1
	movs r0, #0x50
	movs r3, #0xf
	bl sub_80CA9F8
	adds r4, r0, #0
	ldr r0, _080CB074  @ 0x0000FFFF
	cmp r4, r0
	beq _080CAFFC
	movs r0, #0x28
	negs r0, r0
	cmp r4, r0
	blt _080CAFFC
	cmp r4, #0xc8
	bgt _080CAFFC
	subs r4, #0x28
	movs r0, #0xff
	ands r4, r0
	ldr r5, _080CB078  @ gUnknown_08AA709C
	ldr r0, _080CB084  @ 0x000020F0
	str r0, [sp]
	movs r0, #1
	movs r1, #0x48
	adds r2, r4, #0
	adds r3, r5, #0
	bl PutSpriteExt
	movs r2, #0x80
	lsls r2, r2, #3
	orrs r2, r4
	ldr r0, _080CB088  @ 0x00003168
	str r0, [sp]
	movs r0, #2
	movs r1, #0x4c
	adds r3, r5, #0
	bl PutSpriteExt
	movs r0, #0x80
	lsls r0, r0, #4
	orrs r4, r0
	ldr r3, _080CB080  @ gUnknown_08AA7116
	movs r0, #0
	str r0, [sp]
	movs r1, #0x58
	adds r2, r4, #0
	bl PutSpriteExt
_080CAFFC:
	ldrh r0, [r7, #0x2a]
	adds r2, r0, #2
	movs r1, #1
	negs r1, r1
	movs r0, #0x50
	movs r3, #0xf
	bl sub_80CA9F8
	adds r4, r0, #0
	ldr r0, _080CB074  @ 0x0000FFFF
	cmp r4, r0
	beq _080CB060
	movs r0, #0x28
	negs r0, r0
	cmp r4, r0
	blt _080CB060
	cmp r4, #0xc8
	bgt _080CB060
	subs r4, #0x28
	movs r0, #0xff
	ands r4, r0
	ldr r5, _080CB078  @ gUnknown_08AA709C
	ldr r0, _080CB08C  @ 0x000041E0
	str r0, [sp]
	movs r0, #1
	movs r1, #0x90
	adds r2, r4, #0
	adds r3, r5, #0
	bl PutSpriteExt
	movs r2, #0x80
	lsls r2, r2, #3
	orrs r2, r4
	ldr r0, _080CB090  @ 0x00005258
	str r0, [sp]
	movs r0, #2
	movs r1, #0x94
	adds r3, r5, #0
	bl PutSpriteExt
	movs r0, #0x80
	lsls r0, r0, #4
	orrs r4, r0
	ldr r3, _080CB080  @ gUnknown_08AA7116
	movs r0, #0
	str r0, [sp]
	movs r1, #0xa0
	adds r2, r4, #0
	bl PutSpriteExt
_080CB060:
	ldrh r0, [r7, #0x2a]
	cmp r0, #0xf
	bne _080CB094
	movs r0, #0
	strh r0, [r7, #0x2a]
	adds r0, r7, #0
	bl Proc_Break
	b _080CB098
	.align 2, 0
_080CB074: .4byte 0x0000FFFF
_080CB078: .4byte gUnknown_08AA709C
_080CB07C: .4byte 0x00001078
_080CB080: .4byte gUnknown_08AA7116
_080CB084: .4byte 0x000020F0
_080CB088: .4byte 0x00003168
_080CB08C: .4byte 0x000041E0
_080CB090: .4byte 0x00005258
_080CB094:
	adds r0, #1
	strh r0, [r7, #0x2a]
_080CB098:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80CAF2C

	THUMB_FUNC_START sub_80CB0A0
sub_80CB0A0: @ 0x080CB0A0
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r7, r0, #0
	ldrh r0, [r7, #0x2a]
	adds r2, r0, #0
	adds r2, #0xa
	movs r0, #0x50
	movs r1, #1
	movs r3, #0xd
	bl sub_80CA9F8
	adds r4, r0, #0
	ldr r0, _080CB1E0  @ 0x0000FFFF
	cmp r4, r0
	beq _080CB10A
	movs r0, #0x28
	negs r0, r0
	cmp r4, r0
	blt _080CB10A
	cmp r4, #0xc8
	bgt _080CB10A
	movs r6, #0
	subs r4, #0x28
	movs r0, #0xff
	ands r4, r0
	ldr r5, _080CB1E4  @ gUnknown_08AA709C
	str r6, [sp]
	movs r0, #1
	movs r1, #0
	adds r2, r4, #0
	adds r3, r5, #0
	bl PutSpriteExt
	movs r2, #0x80
	lsls r2, r2, #3
	orrs r2, r4
	ldr r0, _080CB1E8  @ 0x00001078
	str r0, [sp]
	movs r0, #2
	movs r1, #4
	adds r3, r5, #0
	bl PutSpriteExt
	movs r0, #0x80
	lsls r0, r0, #4
	orrs r4, r0
	ldr r3, _080CB1EC  @ gUnknown_08AA7116
	str r6, [sp]
	movs r0, #0
	movs r1, #0x10
	adds r2, r4, #0
	bl PutSpriteExt
_080CB10A:
	ldrh r0, [r7, #0x2a]
	adds r2, r0, #6
	movs r0, #0x50
	movs r1, #1
	movs r3, #0xd
	bl sub_80CA9F8
	adds r4, r0, #0
	ldr r0, _080CB1E0  @ 0x0000FFFF
	cmp r4, r0
	beq _080CB16C
	movs r0, #0x28
	negs r0, r0
	cmp r4, r0
	blt _080CB16C
	cmp r4, #0xc8
	bgt _080CB16C
	subs r4, #0x28
	movs r0, #0xff
	ands r4, r0
	ldr r5, _080CB1E4  @ gUnknown_08AA709C
	ldr r0, _080CB1F0  @ 0x000020F0
	str r0, [sp]
	movs r0, #1
	movs r1, #0x48
	adds r2, r4, #0
	adds r3, r5, #0
	bl PutSpriteExt
	movs r2, #0x80
	lsls r2, r2, #3
	orrs r2, r4
	ldr r0, _080CB1F4  @ 0x00003168
	str r0, [sp]
	movs r0, #2
	movs r1, #0x4c
	adds r3, r5, #0
	bl PutSpriteExt
	movs r0, #0x80
	lsls r0, r0, #4
	orrs r4, r0
	ldr r3, _080CB1EC  @ gUnknown_08AA7116
	movs r0, #0
	str r0, [sp]
	movs r1, #0x58
	adds r2, r4, #0
	bl PutSpriteExt
_080CB16C:
	ldrh r0, [r7, #0x2a]
	adds r2, r0, #2
	movs r0, #0x50
	movs r1, #1
	movs r3, #0xd
	bl sub_80CA9F8
	adds r4, r0, #0
	ldr r0, _080CB1E0  @ 0x0000FFFF
	cmp r4, r0
	beq _080CB1CE
	movs r0, #0x28
	negs r0, r0
	cmp r4, r0
	blt _080CB1CE
	cmp r4, #0xc8
	bgt _080CB1CE
	subs r4, #0x28
	movs r0, #0xff
	ands r4, r0
	ldr r5, _080CB1E4  @ gUnknown_08AA709C
	ldr r0, _080CB1F8  @ 0x000041E0
	str r0, [sp]
	movs r0, #1
	movs r1, #0x90
	adds r2, r4, #0
	adds r3, r5, #0
	bl PutSpriteExt
	movs r2, #0x80
	lsls r2, r2, #3
	orrs r2, r4
	ldr r0, _080CB1FC  @ 0x00005258
	str r0, [sp]
	movs r0, #2
	movs r1, #0x94
	adds r3, r5, #0
	bl PutSpriteExt
	movs r0, #0x80
	lsls r0, r0, #4
	orrs r4, r0
	ldr r3, _080CB1EC  @ gUnknown_08AA7116
	movs r0, #0
	str r0, [sp]
	movs r1, #0xa0
	adds r2, r4, #0
	bl PutSpriteExt
_080CB1CE:
	ldrh r0, [r7, #0x2a]
	cmp r0, #0xd
	bne _080CB200
	movs r0, #0
	strh r0, [r7, #0x2a]
	adds r0, r7, #0
	bl Proc_Break
	b _080CB204
	.align 2, 0
_080CB1E0: .4byte 0x0000FFFF
_080CB1E4: .4byte gUnknown_08AA709C
_080CB1E8: .4byte 0x00001078
_080CB1EC: .4byte gUnknown_08AA7116
_080CB1F0: .4byte 0x000020F0
_080CB1F4: .4byte 0x00003168
_080CB1F8: .4byte 0x000041E0
_080CB1FC: .4byte 0x00005258
_080CB200:
	adds r0, #1
	strh r0, [r7, #0x2a]
_080CB204:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80CB0A0

	THUMB_FUNC_START sub_80CB20C
sub_80CB20C: @ 0x080CB20C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r6, r0, #0
	ldrh r0, [r6, #0x2a]
	adds r2, r0, #6
	movs r0, #1
	negs r0, r0
	mov sl, r0
	movs r0, #0x3c
	mov r1, sl
	movs r3, #0xb
	bl sub_80CA9F8
	adds r7, r0, #0
	ldr r0, _080CB2E0  @ 0x0000FFFF
	mov r9, r0
	cmp r7, r9
	beq _080CB27A
	adds r1, r7, #0
	subs r1, #0x20
	ldr r4, _080CB2E4  @ 0x000001FF
	ands r1, r4
	ldr r5, _080CB2E8  @ gUnknown_08AA709C
	movs r0, #0
	mov r8, r0
	str r0, [sp]
	movs r0, #1
	movs r2, #6
	adds r3, r5, #0
	bl PutSpriteExt
	adds r1, r7, #0
	subs r1, #0x1c
	ands r1, r4
	ldr r2, _080CB2EC  @ 0x00000406
	ldr r0, _080CB2F0  @ 0x00001078
	str r0, [sp]
	movs r0, #2
	adds r3, r5, #0
	bl PutSpriteExt
	adds r1, r7, #0
	subs r1, #0x38
	ands r1, r4
	ldr r2, _080CB2F4  @ 0x0000081E
	ldr r3, _080CB2F8  @ gUnknown_08AA70EA
	mov r0, r8
	str r0, [sp]
	movs r0, #0
	bl PutSpriteExt
_080CB27A:
	ldrh r0, [r6, #0x2a]
	adds r2, r0, #2
	movs r0, #0x3c
	mov r1, sl
	movs r3, #0xb
	bl sub_80CA9F8
	adds r7, r0, #0
	cmp r7, r9
	beq _080CB2CC
	adds r1, r7, #0
	subs r1, #0x40
	ldr r4, _080CB2E4  @ 0x000001FF
	ands r1, r4
	ldr r5, _080CB2E8  @ gUnknown_08AA709C
	ldr r0, _080CB2FC  @ 0x000020F0
	str r0, [sp]
	movs r0, #1
	movs r2, #0x3a
	adds r3, r5, #0
	bl PutSpriteExt
	adds r1, r7, #0
	subs r1, #0x3c
	ands r1, r4
	ldr r2, _080CB300  @ 0x0000043A
	ldr r0, _080CB304  @ 0x00003168
	str r0, [sp]
	movs r0, #2
	adds r3, r5, #0
	bl PutSpriteExt
	adds r1, r7, #0
	subs r1, #0x38
	ands r1, r4
	ldr r2, _080CB308  @ 0x00000852
	ldr r3, _080CB2F8  @ gUnknown_08AA70EA
	movs r0, #0
	str r0, [sp]
	bl PutSpriteExt
_080CB2CC:
	ldrh r0, [r6, #0x2a]
	cmp r0, #0xb
	bne _080CB30C
	movs r0, #0
	strh r0, [r6, #0x2a]
	adds r0, r6, #0
	bl Proc_Break
	b _080CB310
	.align 2, 0
_080CB2E0: .4byte 0x0000FFFF
_080CB2E4: .4byte 0x000001FF
_080CB2E8: .4byte gUnknown_08AA709C
_080CB2EC: .4byte 0x00000406
_080CB2F0: .4byte 0x00001078
_080CB2F4: .4byte 0x0000081E
_080CB2F8: .4byte gUnknown_08AA70EA
_080CB2FC: .4byte 0x000020F0
_080CB300: .4byte 0x0000043A
_080CB304: .4byte 0x00003168
_080CB308: .4byte 0x00000852
_080CB30C:
	adds r0, #1
	strh r0, [r6, #0x2a]
_080CB310:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80CB20C

	THUMB_FUNC_START sub_80CB320
sub_80CB320: @ 0x080CB320
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov sl, r0
	ldrh r7, [r0, #0x2a]
	cmp r7, #0
	bne _080CB3A6
	ldr r0, _080CB54C  @ gLCDControlBuffer
	mov ip, r0
	ldrb r0, [r0, #1]
	movs r2, #0x20
	orrs r0, r2
	movs r1, #0x40
	orrs r0, r1
	movs r1, #0x80
	orrs r0, r1
	mov r1, ip
	strb r0, [r1, #1]
	mov r5, ip
	adds r5, #0x34
	ldrb r0, [r5]
	orrs r0, r2
	movs r1, #2
	negs r1, r1
	mov r8, r1
	ands r0, r1
	movs r6, #3
	negs r6, r6
	ands r0, r6
	movs r4, #4
	orrs r0, r4
	movs r3, #9
	negs r3, r3
	ands r0, r3
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r5]
	adds r5, #1
	ldrb r0, [r5]
	orrs r0, r2
	mov r2, r8
	ands r0, r2
	ands r0, r6
	orrs r0, r4
	ands r0, r3
	orrs r0, r1
	strb r0, [r5]
	mov r0, ip
	adds r0, #0x2d
	strb r7, [r0]
	adds r0, #4
	strb r7, [r0]
	subs r0, #5
	strb r7, [r0]
	adds r0, #4
	strb r7, [r0]
	subs r0, #1
	strb r7, [r0]
	adds r0, #4
	strb r7, [r0]
	subs r0, #5
	strb r7, [r0]
	adds r0, #4
	strb r7, [r0]
_080CB3A6:
	mov r1, sl
	ldrh r0, [r1, #0x2a]
	adds r0, #2
	mov r9, r0
	movs r1, #1
	negs r1, r1
	movs r0, #0x1c
	mov r2, r9
	movs r3, #0xa
	bl sub_80CA9F8
	adds r7, r0, #0
	ldr r0, _080CB550  @ 0x0000FFFF
	cmp r7, r0
	beq _080CB41C
	movs r0, #0x28
	negs r0, r0
	cmp r7, r0
	blt _080CB41C
	cmp r7, #0xc8
	bgt _080CB41C
	adds r4, r7, #0
	subs r4, #0x30
	movs r6, #0xff
	ands r4, r6
	ldr r5, _080CB554  @ gUnknown_08AA709C
	movs r2, #0
	mov r8, r2
	str r2, [sp]
	movs r0, #1
	movs r1, #0x48
	adds r2, r4, #0
	adds r3, r5, #0
	bl PutSpriteExt
	movs r0, #0x80
	lsls r0, r0, #3
	orrs r4, r0
	ldr r0, _080CB558  @ 0x00001078
	str r0, [sp]
	movs r0, #2
	movs r1, #0x4c
	adds r2, r4, #0
	adds r3, r5, #0
	bl PutSpriteExt
	adds r2, r7, #0
	subs r2, #0x18
	ands r2, r6
	movs r0, #0x80
	lsls r0, r0, #4
	orrs r2, r0
	ldr r3, _080CB55C  @ gUnknown_08AA70EA
	mov r0, r8
	str r0, [sp]
	movs r0, #0
	movs r1, #0x40
	bl PutSpriteExt
_080CB41C:
	movs r0, #0x84
	movs r1, #1
	mov r2, r9
	movs r3, #0xa
	bl sub_80CA9F8
	adds r7, r0, #0
	ldr r0, _080CB550  @ 0x0000FFFF
	movs r1, #0x78
	cmp r1, r0
	beq _080CB49A
	cmp r7, r0
	beq _080CB49A
	movs r0, #0x28
	negs r0, r0
	cmp r7, r0
	blt _080CB49A
	cmp r7, #0xc8
	bgt _080CB49A
	subs r1, #0x30
	ldr r5, _080CB560  @ 0x000001FF
	ands r1, r5
	adds r4, r7, #0
	subs r4, #0x30
	movs r2, #0xff
	mov r8, r2
	ands r4, r2
	ldr r6, _080CB554  @ gUnknown_08AA709C
	ldr r0, _080CB564  @ 0x000020F0
	str r0, [sp]
	movs r0, #1
	adds r2, r4, #0
	adds r3, r6, #0
	bl PutSpriteExt
	movs r1, #0x78
	subs r1, #0x2c
	ands r1, r5
	movs r0, #0x80
	lsls r0, r0, #3
	orrs r4, r0
	ldr r0, _080CB568  @ 0x00003168
	str r0, [sp]
	movs r0, #2
	adds r2, r4, #0
	adds r3, r6, #0
	bl PutSpriteExt
	movs r1, #0x78
	subs r1, #0x38
	ands r1, r5
	adds r2, r7, #0
	subs r2, #0x18
	mov r0, r8
	ands r2, r0
	movs r0, #0x80
	lsls r0, r0, #4
	orrs r2, r0
	ldr r3, _080CB55C  @ gUnknown_08AA70EA
	movs r0, #0
	str r0, [sp]
	bl PutSpriteExt
_080CB49A:
	mov r3, r9
	subs r3, #2
	cmp r3, #7
	bhi _080CB4F2
	movs r0, #8
	str r0, [sp]
	movs r0, #4
	movs r1, #0
	movs r2, #0x18
	bl Interpolate
	adds r7, r0, #0
	ldr r3, _080CB54C  @ gLCDControlBuffer
	adds r1, r3, #0
	adds r1, #0x2d
	movs r0, #6
	strb r0, [r1]
	movs r2, #0x50
	subs r2, r2, r7
	adds r0, r3, #0
	adds r0, #0x31
	strb r2, [r0]
	subs r1, #1
	movs r0, #0x76
	strb r0, [r1]
	adds r1, r7, #0
	adds r1, #0x50
	adds r0, r3, #0
	adds r0, #0x30
	strb r1, [r0]
	adds r5, r3, #0
	adds r5, #0x2f
	movs r0, #0x7a
	strb r0, [r5]
	adds r0, r3, #0
	adds r0, #0x33
	strb r2, [r0]
	adds r2, r3, #0
	adds r2, #0x2e
	movs r0, #0xea
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x32
	strb r1, [r0]
_080CB4F2:
	ldr r4, _080CB554  @ gUnknown_08AA709C
	ldr r0, _080CB56C  @ 0x000041E0
	str r0, [sp]
	movs r0, #1
	movs r1, #0xe
	movs r2, #0x20
	adds r3, r4, #0
	bl PutSpriteExt
	movs r5, #0x84
	lsls r5, r5, #3
	ldr r0, _080CB570  @ 0x00005258
	str r0, [sp]
	movs r0, #2
	movs r1, #0x12
	adds r2, r5, #0
	adds r3, r4, #0
	bl PutSpriteExt
	ldr r0, _080CB574  @ 0x000062D0
	str r0, [sp]
	movs r0, #1
	movs r1, #0x82
	movs r2, #0x20
	adds r3, r4, #0
	bl PutSpriteExt
	ldr r0, _080CB578  @ 0x00007348
	str r0, [sp]
	movs r0, #2
	movs r1, #0x86
	adds r2, r5, #0
	adds r3, r4, #0
	bl PutSpriteExt
	mov r1, sl
	ldrh r0, [r1, #0x2a]
	cmp r0, #0xa
	bne _080CB57C
	movs r0, #0
	strh r0, [r1, #0x2a]
	mov r0, sl
	bl Proc_Break
	b _080CB582
	.align 2, 0
_080CB54C: .4byte gLCDControlBuffer
_080CB550: .4byte 0x0000FFFF
_080CB554: .4byte gUnknown_08AA709C
_080CB558: .4byte 0x00001078
_080CB55C: .4byte gUnknown_08AA70EA
_080CB560: .4byte 0x000001FF
_080CB564: .4byte 0x000020F0
_080CB568: .4byte 0x00003168
_080CB56C: .4byte 0x000041E0
_080CB570: .4byte 0x00005258
_080CB574: .4byte 0x000062D0
_080CB578: .4byte 0x00007348
_080CB57C:
	adds r0, #1
	mov r2, sl
	strh r0, [r2, #0x2a]
_080CB582:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80CB320

	THUMB_FUNC_START sub_80CB594
sub_80CB594: @ 0x080CB594
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r6, r0, #0
	ldrh r0, [r6, #0x2a]
	adds r2, r0, #6
	movs r0, #0xb4
	movs r1, #1
	movs r3, #9
	bl sub_80CA9F8
	adds r7, r0, #0
	ldr r0, _080CB660  @ 0x0000FFFF
	mov r9, r0
	cmp r7, r9
	beq _080CB5FA
	adds r1, r7, #0
	subs r1, #0x20
	ldr r4, _080CB664  @ 0x000001FF
	ands r1, r4
	ldr r5, _080CB668  @ gUnknown_08AA709C
	movs r0, #0
	mov r8, r0
	str r0, [sp]
	movs r0, #1
	movs r2, #6
	adds r3, r5, #0
	bl PutSpriteExt
	adds r1, r7, #0
	subs r1, #0x1c
	ands r1, r4
	ldr r2, _080CB66C  @ 0x00000406
	ldr r0, _080CB670  @ 0x00001078
	str r0, [sp]
	movs r0, #2
	adds r3, r5, #0
	bl PutSpriteExt
	adds r1, r7, #0
	subs r1, #0x38
	ands r1, r4
	ldr r2, _080CB674  @ 0x0000081E
	ldr r3, _080CB678  @ gUnknown_08AA70EA
	mov r0, r8
	str r0, [sp]
	movs r0, #0
	bl PutSpriteExt
_080CB5FA:
	ldrh r0, [r6, #0x2a]
	adds r2, r0, #2
	movs r0, #0xb4
	movs r1, #1
	movs r3, #9
	bl sub_80CA9F8
	adds r7, r0, #0
	cmp r7, r9
	beq _080CB64C
	adds r1, r7, #0
	subs r1, #0x40
	ldr r4, _080CB664  @ 0x000001FF
	ands r1, r4
	ldr r5, _080CB668  @ gUnknown_08AA709C
	ldr r0, _080CB67C  @ 0x000020F0
	str r0, [sp]
	movs r0, #1
	movs r2, #0x3a
	adds r3, r5, #0
	bl PutSpriteExt
	adds r1, r7, #0
	subs r1, #0x3c
	ands r1, r4
	ldr r2, _080CB680  @ 0x0000043A
	ldr r0, _080CB684  @ 0x00003168
	str r0, [sp]
	movs r0, #2
	adds r3, r5, #0
	bl PutSpriteExt
	adds r1, r7, #0
	subs r1, #0x38
	ands r1, r4
	ldr r2, _080CB688  @ 0x00000852
	ldr r3, _080CB678  @ gUnknown_08AA70EA
	movs r0, #0
	str r0, [sp]
	bl PutSpriteExt
_080CB64C:
	ldrh r0, [r6, #0x2a]
	cmp r0, #9
	bne _080CB68C
	movs r0, #0
	strh r0, [r6, #0x2a]
	adds r0, r6, #0
	bl Proc_Break
	b _080CB690
	.align 2, 0
_080CB660: .4byte 0x0000FFFF
_080CB664: .4byte 0x000001FF
_080CB668: .4byte gUnknown_08AA709C
_080CB66C: .4byte 0x00000406
_080CB670: .4byte 0x00001078
_080CB674: .4byte 0x0000081E
_080CB678: .4byte gUnknown_08AA70EA
_080CB67C: .4byte 0x000020F0
_080CB680: .4byte 0x0000043A
_080CB684: .4byte 0x00003168
_080CB688: .4byte 0x00000852
_080CB68C:
	adds r0, #1
	strh r0, [r6, #0x2a]
_080CB690:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80CB594

	THUMB_FUNC_START sub_80CB6A0
sub_80CB6A0: @ 0x080CB6A0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov r9, r0
	ldrh r0, [r0, #0x2a]
	adds r2, r0, #0
	adds r2, #0xa
	movs r0, #0x78
	mov sl, r0
	movs r0, #0x1c
	movs r1, #1
	movs r3, #8
	bl sub_80CA9F8
	adds r7, r0, #0
	ldr r0, _080CB83C  @ 0x0000FFFF
	cmp r7, r0
	beq _080CB722
	movs r0, #0x28
	negs r0, r0
	cmp r7, r0
	blt _080CB722
	cmp r7, #0xc8
	bgt _080CB722
	adds r4, r7, #0
	subs r4, #0x30
	movs r6, #0xff
	ands r4, r6
	ldr r5, _080CB840  @ gUnknown_08AA709C
	movs r1, #0
	mov r8, r1
	str r1, [sp]
	movs r0, #1
	movs r1, #0x48
	adds r2, r4, #0
	adds r3, r5, #0
	bl PutSpriteExt
	movs r0, #0x80
	lsls r0, r0, #3
	orrs r4, r0
	ldr r0, _080CB844  @ 0x00001078
	str r0, [sp]
	movs r0, #2
	movs r1, #0x4c
	adds r2, r4, #0
	adds r3, r5, #0
	bl PutSpriteExt
	adds r2, r7, #0
	subs r2, #0x18
	ands r2, r6
	movs r0, #0x80
	lsls r0, r0, #4
	orrs r2, r0
	ldr r3, _080CB848  @ gUnknown_08AA715C
	mov r0, r8
	str r0, [sp]
	movs r0, #0
	movs r1, #0x18
	bl PutSpriteExt
_080CB722:
	mov r1, r9
	ldrh r0, [r1, #0x2a]
	adds r2, r0, #6
	movs r0, #0x50
	movs r1, #1
	movs r3, #8
	bl sub_80CA9F8
	adds r7, r0, #0
	ldr r0, _080CB83C  @ 0x0000FFFF
	cmp sl, r0
	beq _080CB7A4
	cmp r7, r0
	beq _080CB7A4
	movs r0, #0x28
	negs r0, r0
	cmp r7, r0
	blt _080CB7A4
	cmp r7, #0xc8
	bgt _080CB7A4
	mov r1, sl
	subs r1, #0x30
	ldr r5, _080CB84C  @ 0x000001FF
	ands r1, r5
	adds r4, r7, #0
	subs r4, #0x30
	movs r0, #0xff
	mov r8, r0
	ands r4, r0
	ldr r6, _080CB840  @ gUnknown_08AA709C
	ldr r0, _080CB850  @ 0x000020F0
	str r0, [sp]
	movs r0, #1
	adds r2, r4, #0
	adds r3, r6, #0
	bl PutSpriteExt
	mov r1, sl
	subs r1, #0x2c
	ands r1, r5
	movs r0, #0x80
	lsls r0, r0, #3
	orrs r4, r0
	ldr r0, _080CB854  @ 0x00003168
	str r0, [sp]
	movs r0, #2
	adds r2, r4, #0
	adds r3, r6, #0
	bl PutSpriteExt
	mov r1, sl
	subs r1, #0x60
	ands r1, r5
	adds r2, r7, #0
	subs r2, #0x18
	mov r0, r8
	ands r2, r0
	movs r0, #0x80
	lsls r0, r0, #4
	orrs r2, r0
	ldr r3, _080CB848  @ gUnknown_08AA715C
	movs r0, #0
	str r0, [sp]
	bl PutSpriteExt
_080CB7A4:
	mov r1, r9
	ldrh r0, [r1, #0x2a]
	adds r2, r0, #2
	movs r0, #0x84
	movs r1, #1
	movs r3, #8
	bl sub_80CA9F8
	adds r7, r0, #0
	ldr r0, _080CB83C  @ 0x0000FFFF
	cmp sl, r0
	beq _080CB826
	cmp r7, r0
	beq _080CB826
	movs r0, #0x28
	negs r0, r0
	cmp r7, r0
	blt _080CB826
	cmp r7, #0xc8
	bgt _080CB826
	mov r1, sl
	subs r1, #0x30
	ldr r5, _080CB84C  @ 0x000001FF
	ands r1, r5
	adds r4, r7, #0
	subs r4, #0x30
	movs r0, #0xff
	mov r8, r0
	ands r4, r0
	ldr r6, _080CB840  @ gUnknown_08AA709C
	ldr r0, _080CB858  @ 0x000041E0
	str r0, [sp]
	movs r0, #1
	adds r2, r4, #0
	adds r3, r6, #0
	bl PutSpriteExt
	mov r1, sl
	subs r1, #0x2c
	ands r1, r5
	movs r0, #0x80
	lsls r0, r0, #3
	orrs r4, r0
	ldr r0, _080CB85C  @ 0x00005258
	str r0, [sp]
	movs r0, #2
	adds r2, r4, #0
	adds r3, r6, #0
	bl PutSpriteExt
	mov r1, sl
	subs r1, #0x60
	ands r1, r5
	adds r2, r7, #0
	subs r2, #0x18
	mov r0, r8
	ands r2, r0
	movs r0, #0x80
	lsls r0, r0, #4
	orrs r2, r0
	ldr r3, _080CB848  @ gUnknown_08AA715C
	movs r0, #0
	str r0, [sp]
	bl PutSpriteExt
_080CB826:
	mov r1, r9
	ldrh r0, [r1, #0x2a]
	cmp r0, #8
	bne _080CB860
	movs r0, #0
	strh r0, [r1, #0x2a]
	mov r0, r9
	bl Proc_Break
	b _080CB866
	.align 2, 0
_080CB83C: .4byte 0x0000FFFF
_080CB840: .4byte gUnknown_08AA709C
_080CB844: .4byte 0x00001078
_080CB848: .4byte gUnknown_08AA715C
_080CB84C: .4byte 0x000001FF
_080CB850: .4byte 0x000020F0
_080CB854: .4byte 0x00003168
_080CB858: .4byte 0x000041E0
_080CB85C: .4byte 0x00005258
_080CB860:
	adds r0, #1
	mov r1, r9
	strh r0, [r1, #0x2a]
_080CB866:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80CB6A0

	THUMB_FUNC_START sub_80CB878
sub_80CB878: @ 0x080CB878
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	mov r9, r0
	ldrh r0, [r0, #0x2a]
	adds r0, #2
	str r0, [sp, #4]
	movs r0, #0x1e
	mov sl, r0
	movs r1, #1
	negs r1, r1
	movs r0, #0x50
	ldr r2, [sp, #4]
	movs r3, #7
	bl sub_80CA9F8
	adds r7, r0, #0
	ldr r0, _080CBA20  @ 0x0000FFFF
	cmp r7, r0
	beq _080CB902
	movs r0, #0x28
	negs r0, r0
	cmp r7, r0
	blt _080CB902
	cmp r7, #0xc8
	bgt _080CB902
	mov r1, sl
	subs r1, #0x30
	ldr r5, _080CBA24  @ 0x000001FF
	ands r1, r5
	adds r4, r7, #0
	subs r4, #0x28
	movs r0, #0xff
	ands r4, r0
	ldr r6, _080CBA28  @ gUnknown_08AA709C
	movs r0, #0
	mov r8, r0
	str r0, [sp]
	movs r0, #1
	adds r2, r4, #0
	adds r3, r6, #0
	bl PutSpriteExt
	mov r1, sl
	subs r1, #0x2c
	ands r1, r5
	movs r2, #0x80
	lsls r2, r2, #3
	orrs r2, r4
	ldr r0, _080CBA2C  @ 0x00001078
	str r0, [sp]
	movs r0, #2
	adds r3, r6, #0
	bl PutSpriteExt
	movs r0, #0x80
	lsls r0, r0, #4
	orrs r4, r0
	ldr r3, _080CBA30  @ gUnknown_08AA712A
	mov r1, r8
	str r1, [sp]
	movs r0, #0
	movs r1, #2
	adds r2, r4, #0
	bl PutSpriteExt
_080CB902:
	ldr r0, _080CBA20  @ 0x0000FFFF
	cmp r7, r0
	beq _080CB956
	movs r0, #0x28
	negs r0, r0
	cmp r7, r0
	blt _080CB956
	cmp r7, #0xc8
	bgt _080CB956
	adds r4, r7, #0
	subs r4, #0x28
	movs r0, #0xff
	ands r4, r0
	ldr r5, _080CBA28  @ gUnknown_08AA709C
	ldr r0, _080CBA34  @ 0x000041E0
	str r0, [sp]
	movs r0, #1
	movs r1, #0x66
	adds r2, r4, #0
	adds r3, r5, #0
	bl PutSpriteExt
	movs r2, #0x80
	lsls r2, r2, #3
	orrs r2, r4
	ldr r0, _080CBA38  @ 0x00005258
	str r0, [sp]
	movs r0, #2
	movs r1, #0x6a
	adds r3, r5, #0
	bl PutSpriteExt
	movs r0, #0x80
	lsls r0, r0, #4
	orrs r4, r0
	ldr r3, _080CBA30  @ gUnknown_08AA712A
	movs r0, #0
	str r0, [sp]
	movs r1, #0x7a
	adds r2, r4, #0
	bl PutSpriteExt
_080CB956:
	movs r0, #0x50
	movs r1, #1
	ldr r2, [sp, #4]
	movs r3, #7
	bl sub_80CA9F8
	adds r7, r0, #0
	ldr r0, _080CBA20  @ 0x0000FFFF
	cmp r7, r0
	beq _080CB9B8
	movs r0, #0x28
	negs r0, r0
	cmp r7, r0
	blt _080CB9B8
	cmp r7, #0xc8
	bgt _080CB9B8
	adds r4, r7, #0
	subs r4, #0x28
	movs r0, #0xff
	ands r4, r0
	ldr r5, _080CBA28  @ gUnknown_08AA709C
	ldr r0, _080CBA3C  @ 0x000020F0
	str r0, [sp]
	movs r0, #1
	movs r1, #0x2a
	adds r2, r4, #0
	adds r3, r5, #0
	bl PutSpriteExt
	movs r2, #0x80
	lsls r2, r2, #3
	orrs r2, r4
	ldr r0, _080CBA40  @ 0x00003168
	str r0, [sp]
	movs r0, #2
	movs r1, #0x2e
	adds r3, r5, #0
	bl PutSpriteExt
	movs r0, #0x80
	lsls r0, r0, #4
	orrs r4, r0
	ldr r3, _080CBA30  @ gUnknown_08AA712A
	movs r0, #0
	str r0, [sp]
	movs r1, #0x3e
	adds r2, r4, #0
	bl PutSpriteExt
_080CB9B8:
	ldr r0, _080CBA20  @ 0x0000FFFF
	cmp r7, r0
	beq _080CBA0C
	movs r0, #0x28
	negs r0, r0
	cmp r7, r0
	blt _080CBA0C
	cmp r7, #0xc8
	bgt _080CBA0C
	adds r4, r7, #0
	subs r4, #0x28
	movs r0, #0xff
	ands r4, r0
	ldr r5, _080CBA28  @ gUnknown_08AA709C
	ldr r0, _080CBA44  @ 0x000062D0
	str r0, [sp]
	movs r0, #1
	movs r1, #0xa2
	adds r2, r4, #0
	adds r3, r5, #0
	bl PutSpriteExt
	movs r2, #0x80
	lsls r2, r2, #3
	orrs r2, r4
	ldr r0, _080CBA48  @ 0x00007348
	str r0, [sp]
	movs r0, #2
	movs r1, #0xa6
	adds r3, r5, #0
	bl PutSpriteExt
	movs r0, #0x80
	lsls r0, r0, #4
	orrs r4, r0
	ldr r3, _080CBA30  @ gUnknown_08AA712A
	movs r0, #0
	str r0, [sp]
	movs r1, #0xb6
	adds r2, r4, #0
	bl PutSpriteExt
_080CBA0C:
	mov r1, r9
	ldrh r0, [r1, #0x2a]
	cmp r0, #7
	bne _080CBA4C
	movs r0, #0
	strh r0, [r1, #0x2a]
	mov r0, r9
	bl Proc_Break
	b _080CBA52
	.align 2, 0
_080CBA20: .4byte 0x0000FFFF
_080CBA24: .4byte 0x000001FF
_080CBA28: .4byte gUnknown_08AA709C
_080CBA2C: .4byte 0x00001078
_080CBA30: .4byte gUnknown_08AA712A
_080CBA34: .4byte 0x000041E0
_080CBA38: .4byte 0x00005258
_080CBA3C: .4byte 0x000020F0
_080CBA40: .4byte 0x00003168
_080CBA44: .4byte 0x000062D0
_080CBA48: .4byte 0x00007348
_080CBA4C:
	adds r0, #1
	mov r1, r9
	strh r0, [r1, #0x2a]
_080CBA52:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80CB878

	THUMB_FUNC_START sub_80CBA64
sub_80CBA64: @ 0x080CBA64
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov r9, r0
	ldrh r0, [r0, #0x2a]
	adds r2, r0, #2
	movs r0, #0x78
	mov sl, r0
	movs r1, #1
	negs r1, r1
	movs r0, #0x1c
	movs r3, #6
	bl sub_80CA9F8
	adds r7, r0, #0
	ldr r0, _080CBC04  @ 0x0000FFFF
	cmp r7, r0
	beq _080CBAE6
	movs r0, #0x28
	negs r0, r0
	cmp r7, r0
	blt _080CBAE6
	cmp r7, #0xc8
	bgt _080CBAE6
	adds r4, r7, #0
	subs r4, #0x30
	movs r6, #0xff
	ands r4, r6
	ldr r5, _080CBC08  @ gUnknown_08AA709C
	movs r1, #0
	mov r8, r1
	str r1, [sp]
	movs r0, #1
	movs r1, #0x48
	adds r2, r4, #0
	adds r3, r5, #0
	bl PutSpriteExt
	movs r0, #0x80
	lsls r0, r0, #3
	orrs r4, r0
	ldr r0, _080CBC0C  @ 0x00001078
	str r0, [sp]
	movs r0, #2
	movs r1, #0x4c
	adds r2, r4, #0
	adds r3, r5, #0
	bl PutSpriteExt
	adds r2, r7, #0
	subs r2, #0x18
	ands r2, r6
	movs r0, #0x80
	lsls r0, r0, #4
	orrs r2, r0
	ldr r3, _080CBC10  @ gUnknown_08AA715C
	mov r0, r8
	str r0, [sp]
	movs r0, #0
	movs r1, #0x18
	bl PutSpriteExt
_080CBAE6:
	mov r1, r9
	ldrh r0, [r1, #0x2a]
	adds r2, r0, #6
	movs r1, #1
	negs r1, r1
	movs r0, #0x50
	movs r3, #6
	bl sub_80CA9F8
	adds r7, r0, #0
	ldr r0, _080CBC04  @ 0x0000FFFF
	cmp sl, r0
	beq _080CBB6A
	cmp r7, r0
	beq _080CBB6A
	movs r0, #0x28
	negs r0, r0
	cmp r7, r0
	blt _080CBB6A
	cmp r7, #0xc8
	bgt _080CBB6A
	mov r1, sl
	subs r1, #0x30
	ldr r5, _080CBC14  @ 0x000001FF
	ands r1, r5
	adds r4, r7, #0
	subs r4, #0x30
	movs r0, #0xff
	mov r8, r0
	ands r4, r0
	ldr r6, _080CBC08  @ gUnknown_08AA709C
	ldr r0, _080CBC18  @ 0x000020F0
	str r0, [sp]
	movs r0, #1
	adds r2, r4, #0
	adds r3, r6, #0
	bl PutSpriteExt
	mov r1, sl
	subs r1, #0x2c
	ands r1, r5
	movs r0, #0x80
	lsls r0, r0, #3
	orrs r4, r0
	ldr r0, _080CBC1C  @ 0x00003168
	str r0, [sp]
	movs r0, #2
	adds r2, r4, #0
	adds r3, r6, #0
	bl PutSpriteExt
	mov r1, sl
	subs r1, #0x60
	ands r1, r5
	adds r2, r7, #0
	subs r2, #0x18
	mov r0, r8
	ands r2, r0
	movs r0, #0x80
	lsls r0, r0, #4
	orrs r2, r0
	ldr r3, _080CBC10  @ gUnknown_08AA715C
	movs r0, #0
	str r0, [sp]
	bl PutSpriteExt
_080CBB6A:
	mov r1, r9
	ldrh r0, [r1, #0x2a]
	adds r2, r0, #0
	adds r2, #0xa
	movs r1, #1
	negs r1, r1
	movs r0, #0x84
	movs r3, #6
	bl sub_80CA9F8
	adds r7, r0, #0
	ldr r0, _080CBC04  @ 0x0000FFFF
	cmp sl, r0
	beq _080CBBF0
	cmp r7, r0
	beq _080CBBF0
	movs r0, #0x28
	negs r0, r0
	cmp r7, r0
	blt _080CBBF0
	cmp r7, #0xc8
	bgt _080CBBF0
	mov r1, sl
	subs r1, #0x30
	ldr r5, _080CBC14  @ 0x000001FF
	ands r1, r5
	adds r4, r7, #0
	subs r4, #0x30
	movs r0, #0xff
	mov r8, r0
	ands r4, r0
	ldr r6, _080CBC08  @ gUnknown_08AA709C
	ldr r0, _080CBC20  @ 0x000041E0
	str r0, [sp]
	movs r0, #1
	adds r2, r4, #0
	adds r3, r6, #0
	bl PutSpriteExt
	mov r1, sl
	subs r1, #0x2c
	ands r1, r5
	movs r0, #0x80
	lsls r0, r0, #3
	orrs r4, r0
	ldr r0, _080CBC24  @ 0x00005258
	str r0, [sp]
	movs r0, #2
	adds r2, r4, #0
	adds r3, r6, #0
	bl PutSpriteExt
	mov r1, sl
	subs r1, #0x60
	ands r1, r5
	adds r2, r7, #0
	subs r2, #0x18
	mov r0, r8
	ands r2, r0
	movs r0, #0x80
	lsls r0, r0, #4
	orrs r2, r0
	ldr r3, _080CBC10  @ gUnknown_08AA715C
	movs r0, #0
	str r0, [sp]
	bl PutSpriteExt
_080CBBF0:
	mov r1, r9
	ldrh r0, [r1, #0x2a]
	cmp r0, #6
	bne _080CBC28
	movs r0, #0
	strh r0, [r1, #0x2a]
	mov r0, r9
	bl Proc_Break
	b _080CBC2E
	.align 2, 0
_080CBC04: .4byte 0x0000FFFF
_080CBC08: .4byte gUnknown_08AA709C
_080CBC0C: .4byte 0x00001078
_080CBC10: .4byte gUnknown_08AA715C
_080CBC14: .4byte 0x000001FF
_080CBC18: .4byte 0x000020F0
_080CBC1C: .4byte 0x00003168
_080CBC20: .4byte 0x000041E0
_080CBC24: .4byte 0x00005258
_080CBC28:
	adds r0, #1
	mov r1, r9
	strh r0, [r1, #0x2a]
_080CBC2E:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80CBA64

	THUMB_FUNC_START sub_80CBC40
sub_80CBC40: @ 0x080CBC40
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov r8, r0
	ldrh r0, [r0, #0x2a]
	adds r0, #2
	mov r9, r0
	movs r1, #1
	negs r1, r1
	movs r0, #0x3e
	mov r2, r9
	movs r3, #5
	bl sub_80CA9F8
	adds r7, r0, #0
	ldr r0, _080CBD3C  @ 0x0000FFFF
	mov sl, r0
	cmp r7, sl
	beq _080CBCAC
	adds r1, r7, #0
	subs r1, #0x30
	ldr r4, _080CBD40  @ 0x000001FF
	ands r1, r4
	ldr r5, _080CBD44  @ gUnknown_08AA709C
	movs r6, #0
	str r6, [sp]
	movs r0, #1
	movs r2, #0x28
	adds r3, r5, #0
	bl PutSpriteExt
	adds r1, r7, #0
	subs r1, #0x2c
	ands r1, r4
	movs r2, #0x85
	lsls r2, r2, #3
	ldr r0, _080CBD48  @ 0x00001078
	str r0, [sp]
	movs r0, #2
	adds r3, r5, #0
	bl PutSpriteExt
	adds r1, r7, #0
	subs r1, #0x38
	ands r1, r4
	ldr r2, _080CBD4C  @ 0x00000828
	ldr r3, _080CBD50  @ gUnknown_08AA7194
	str r6, [sp]
	movs r0, #0
	bl PutSpriteExt
_080CBCAC:
	movs r0, #0xb2
	movs r1, #1
	mov r2, r9
	movs r3, #5
	bl sub_80CA9F8
	adds r7, r0, #0
	cmp r7, sl
	beq _080CBCFE
	adds r1, r7, #0
	subs r1, #0x30
	ldr r4, _080CBD40  @ 0x000001FF
	ands r1, r4
	ldr r5, _080CBD44  @ gUnknown_08AA709C
	ldr r0, _080CBD54  @ 0x000020F0
	str r0, [sp]
	movs r0, #1
	movs r2, #0x28
	adds r3, r5, #0
	bl PutSpriteExt
	adds r1, r7, #0
	subs r1, #0x2c
	ands r1, r4
	movs r2, #0x85
	lsls r2, r2, #3
	ldr r0, _080CBD58  @ 0x00003168
	str r0, [sp]
	movs r0, #2
	adds r3, r5, #0
	bl PutSpriteExt
	adds r1, r7, #0
	subs r1, #0x38
	ands r1, r4
	ldr r2, _080CBD4C  @ 0x00000828
	ldr r3, _080CBD50  @ gUnknown_08AA7194
	movs r0, #0
	str r0, [sp]
	bl PutSpriteExt
_080CBCFE:
	mov r1, r8
	ldrh r0, [r1, #0x2a]
	cmp r0, #1
	bne _080CBD28
	ldr r0, _080CBD5C  @ Tsa_OpAnimShinningRingBlinking
	ldr r4, _080CBD60  @ 0x0600F000
	adds r1, r4, #0
	bl Decompress
	movs r3, #0x80
	lsls r3, r3, #8
	adds r2, r3, #0
	movs r1, #0xa0
	lsls r1, r1, #2
_080CBD1A:
	ldrh r3, [r4]
	adds r0, r2, r3
	strh r0, [r4]
	subs r1, #1
	adds r4, #2
	cmp r1, #0
	bne _080CBD1A
_080CBD28:
	mov r1, r8
	ldrh r0, [r1, #0x2a]
	cmp r0, #5
	bne _080CBD64
	movs r0, #0
	strh r0, [r1, #0x2a]
	mov r0, r8
	bl Proc_Break
	b _080CBD6A
	.align 2, 0
_080CBD3C: .4byte 0x0000FFFF
_080CBD40: .4byte 0x000001FF
_080CBD44: .4byte gUnknown_08AA709C
_080CBD48: .4byte 0x00001078
_080CBD4C: .4byte 0x00000828
_080CBD50: .4byte gUnknown_08AA7194
_080CBD54: .4byte 0x000020F0
_080CBD58: .4byte 0x00003168
_080CBD5C: .4byte Tsa_OpAnimShinningRingBlinking
_080CBD60: .4byte 0x0600F000
_080CBD64:
	adds r0, #1
	mov r3, r8
	strh r0, [r3, #0x2a]
_080CBD6A:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80CBC40

	THUMB_FUNC_START sub_80CBD7C
sub_80CBD7C: @ 0x080CBD7C
	push {r4, lr}
	bl EndAllProcChildren
	bl EndProc08AA6D04
	movs r0, #0
	bl SetPrimaryHBlankHandler
	bl EndOpAnimfxTerminator
	ldr r4, _080CBDCC  @ gLCDControlBuffer
	ldrb r1, [r4]
	movs r0, #0x41
	negs r0, r0
	ands r0, r1
	strb r0, [r4]
	ldr r1, _080CBDD0  @ gPaletteBuffer
	ldr r0, _080CBDD4  @ gOpAnimSt
	ldrh r0, [r0, #0xc]
	strh r0, [r1]
	bl EnablePaletteSync
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
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080CBDCC: .4byte gLCDControlBuffer
_080CBDD0: .4byte gPaletteBuffer
_080CBDD4: .4byte gOpAnimSt

	THUMB_FUNC_END sub_80CBD7C
