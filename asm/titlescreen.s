	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	THUMB_FUNC_START sub_80C5580
sub_80C5580: @ 0x080C5580
	push {lr}
	adds r2, r0, #0
	ldr r0, _080C55A0  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0xb
	ands r0, r1
	cmp r0, #0
	beq _080C559A
	ldr r0, [r2, #0x14]
	movs r1, #3
	bl Proc_Goto
_080C559A:
	pop {r0}
	bx r0
	.align 2, 0
_080C55A0: .4byte gKeyStatusPtr

	THUMB_FUNC_END sub_80C5580

	THUMB_FUNC_START sub_80C55A4
sub_80C55A4: @ 0x080C55A4
	push {lr}
	adds r1, r0, #0
	ldr r0, _080C55B4  @ gUnknown_08AA6814
	bl Proc_Start
	pop {r0}
	bx r0
	.align 2, 0
_080C55B4: .4byte gUnknown_08AA6814

	THUMB_FUNC_END sub_80C55A4

	THUMB_FUNC_START sub_80C55B8
sub_80C55B8: @ 0x080C55B8
	push {lr}
	ldr r0, _080C55C8  @ gUnknown_08AA6814
	bl Proc_Find
	bl Proc_End
	pop {r0}
	bx r0
	.align 2, 0
_080C55C8: .4byte gUnknown_08AA6814

	THUMB_FUNC_END sub_80C55B8

	THUMB_FUNC_START sub_80C55CC
sub_80C55CC: @ 0x080C55CC
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _080C56E0  @ gLCDControlBuffer
	ldrb r1, [r4]
	movs r0, #8
	negs r0, r0
	ands r0, r1
	strb r0, [r4]
	movs r0, #0
	strb r0, [r4, #1]
	movs r1, #0
	bl SetBackgroundTileDataOffset
	movs r0, #1
	movs r1, #0
	bl SetBackgroundTileDataOffset
	movs r1, #0x80
	lsls r1, r1, #8
	movs r0, #2
	bl SetBackgroundTileDataOffset
	movs r1, #0xc0
	lsls r1, r1, #8
	movs r0, #3
	bl SetBackgroundTileDataOffset
	movs r1, #0xd0
	lsls r1, r1, #7
	movs r0, #0
	bl SetBackgroundMapDataOffset
	movs r1, #0xe0
	lsls r1, r1, #7
	movs r0, #1
	bl SetBackgroundMapDataOffset
	movs r1, #0xb0
	lsls r1, r1, #8
	movs r0, #2
	bl SetBackgroundMapDataOffset
	movs r1, #0xf0
	lsls r1, r1, #7
	movs r0, #3
	bl SetBackgroundMapDataOffset
	movs r0, #0
	movs r1, #0
	bl SetBackgroundScreenSize
	movs r0, #1
	movs r1, #0
	bl SetBackgroundScreenSize
	movs r0, #2
	movs r1, #0
	bl SetBackgroundScreenSize
	movs r0, #3
	movs r1, #0
	bl SetBackgroundScreenSize
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
	ldr r0, _080C56E4  @ gBG0TilemapBuffer
	movs r1, #0
	bl BG_Fill
	ldr r0, _080C56E8  @ gBG1TilemapBuffer
	movs r1, #0
	bl BG_Fill
	ldr r0, _080C56EC  @ gBG2TilemapBuffer
	movs r1, #0
	bl BG_Fill
	ldr r0, _080C56F0  @ gBG3TilemapBuffer
	movs r1, #0
	bl BG_Fill
	movs r0, #0
	bl sub_8001F48
	movs r0, #0
	bl sub_8001F64
	bl SetDefaultColorEffects
	movs r0, #0xf
	bl BG_EnableSyncByMask
	movs r0, #0
	strh r0, [r5, #0x2a]
	str r0, [r5, #0x2c]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C56E0: .4byte gLCDControlBuffer
_080C56E4: .4byte gBG0TilemapBuffer
_080C56E8: .4byte gBG1TilemapBuffer
_080C56EC: .4byte gBG2TilemapBuffer
_080C56F0: .4byte gBG3TilemapBuffer

	THUMB_FUNC_END sub_80C55CC

	THUMB_FUNC_START sub_80C56F4
sub_80C56F4: @ 0x080C56F4
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldrh r0, [r5, #0x2a]
	cmp r0, #4
	bls _080C5700
	b _080C583C
_080C5700:
	lsls r0, r0, #2
	ldr r1, _080C570C  @ _080C5710
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080C570C: .4byte _080C5710
_080C5710: @ jump table
	.4byte _080C5724 @ case 0
	.4byte _080C5734 @ case 1
	.4byte _080C57A8 @ case 2
	.4byte _080C57FC @ case 3
	.4byte _080C5810 @ case 4
_080C5724:
	ldr r0, _080C5730  @ gUnknown_08AA7760
	movs r1, #0xc0
	lsls r1, r1, #0x13
	bl CopyDataWithPossibleUncomp
	b _080C583C
	.align 2, 0
_080C5730: .4byte gUnknown_08AA7760
_080C5734:
	ldr r0, _080C5780  @ gUnknown_08AA9708
	ldr r1, _080C5784  @ 0x06003000
	bl CopyDataWithPossibleUncomp
	ldr r0, _080C5788  @ gUnknown_08AAAE90
	ldr r4, _080C578C  @ gBG1TilemapBuffer
	adds r1, r4, #0
	bl CopyDataWithPossibleUncomp
	ldr r0, _080C5790  @ gUnknown_08AAB3F4
	movs r1, #0xe0
	lsls r1, r1, #1
	movs r2, #0x20
	bl CopyToPaletteBuffer
	adds r2, r5, #0
	adds r2, #0x29
	movs r0, #0xe0
	lsls r0, r0, #8
	adds r3, r0, #0
	movs r1, #0xa0
	lsls r1, r1, #2
_080C5760:
	ldrh r6, [r4]
	adds r0, r3, r6
	strh r0, [r4]
	adds r4, #2
	subs r1, #1
	cmp r1, #0
	bne _080C5760
	movs r1, #0
	ldrsb r1, [r2, r1]
	cmp r1, #0
	beq _080C579C
	ldr r1, _080C5794  @ gPaletteBuffer
	ldr r0, _080C5798  @ 0x00007FFF
	strh r0, [r1]
	b _080C583C
	.align 2, 0
_080C5780: .4byte gUnknown_08AA9708
_080C5784: .4byte 0x06003000
_080C5788: .4byte gUnknown_08AAAE90
_080C578C: .4byte gBG1TilemapBuffer
_080C5790: .4byte gUnknown_08AAB3F4
_080C5794: .4byte gPaletteBuffer
_080C5798: .4byte 0x00007FFF
_080C579C:
	ldr r0, _080C57A4  @ gPaletteBuffer
	strh r1, [r0]
	b _080C583C
	.align 2, 0
_080C57A4: .4byte gPaletteBuffer
_080C57A8:
	ldr r0, _080C57E4  @ gUnknown_08AAB414
	ldr r1, _080C57E8  @ 0x06005000
	bl CopyDataWithPossibleUncomp
	ldr r0, _080C57EC  @ gUnknown_08AAC2A4
	ldr r4, _080C57F0  @ gBG0TilemapBuffer
	adds r1, r4, #0
	bl CopyDataWithPossibleUncomp
	ldr r0, _080C57F4  @ gUnknown_08AAC58C
	movs r1, #0xf0
	lsls r1, r1, #1
	movs r2, #0x20
	bl CopyToPaletteBuffer
	ldr r0, _080C57F8  @ 0x0000F280
	adds r2, r0, #0
	movs r1, #0xa0
	lsls r1, r1, #2
_080C57CE:
	ldrh r3, [r4]
	adds r0, r2, r3
	strh r0, [r4]
	adds r4, #2
	subs r1, #1
	cmp r1, #0
	bne _080C57CE
	movs r0, #1
	bl BG_EnableSyncByMask
	b _080C583C
	.align 2, 0
_080C57E4: .4byte gUnknown_08AAB414
_080C57E8: .4byte 0x06005000
_080C57EC: .4byte gUnknown_08AAC2A4
_080C57F0: .4byte gBG0TilemapBuffer
_080C57F4: .4byte gUnknown_08AAC58C
_080C57F8: .4byte 0x0000F280
_080C57FC:
	ldr r0, _080C5808  @ gUnknown_08AAC5AC
	ldr r1, _080C580C  @ 0x06010000
	bl CopyDataWithPossibleUncomp
	b _080C583C
	.align 2, 0
_080C5808: .4byte gUnknown_08AAC5AC
_080C580C: .4byte 0x06010000
_080C5810:
	ldr r0, _080C5830  @ gUnknown_08AACEDC
	ldr r1, _080C5834  @ 0x06013000
	bl CopyDataWithPossibleUncomp
	ldr r0, _080C5838  @ gUnknown_08AADB68
	movs r1, #0x80
	lsls r1, r1, #2
	movs r2, #0x80
	bl CopyToPaletteBuffer
	movs r0, #0
	strh r0, [r5, #0x2a]
	adds r0, r5, #0
	bl Proc_Break
	b _080C5842
	.align 2, 0
_080C5830: .4byte gUnknown_08AACEDC
_080C5834: .4byte 0x06013000
_080C5838: .4byte gUnknown_08AADB68
_080C583C:
	ldrh r0, [r5, #0x2a]
	adds r0, #1
	strh r0, [r5, #0x2a]
_080C5842:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80C56F4

	THUMB_FUNC_START sub_80C5848
sub_80C5848: @ 0x080C5848
	push {lr}
	adds r1, r0, #0
	adds r0, #0x29
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _080C5862
	adds r0, r1, #0
	movs r1, #0
	bl Proc_Goto
	b _080C5868
_080C5862:
	ldr r0, _080C586C  @ gUnknown_08AA67FC
	bl Proc_Start
_080C5868:
	pop {r0}
	bx r0
	.align 2, 0
_080C586C: .4byte gUnknown_08AA67FC

	THUMB_FUNC_END sub_80C5848

	THUMB_FUNC_START sub_80C5870
sub_80C5870: @ 0x080C5870
	push {r4, lr}
	sub sp, #4
	movs r0, #0xf
	bl BG_EnableSyncByMask
	ldr r2, _080C58C8  @ gLCDControlBuffer
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
	movs r0, #1
	movs r1, #8
	movs r2, #8
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	movs r4, #0
	str r4, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl SetBlendTargetA
	str r4, [sp]
	movs r0, #1
	movs r1, #1
	movs r2, #0
	movs r3, #0
	bl SetBlendTargetB
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C58C8: .4byte gLCDControlBuffer

	THUMB_FUNC_END sub_80C5870

	THUMB_FUNC_START sub_80C58CC
sub_80C58CC: @ 0x080C58CC
	push {r4, r5, lr}
	adds r5, r0, #0
	ldrh r0, [r5, #0x2a]
	cmp r0, #4
	bls _080C58D8
	b _080C5A14
_080C58D8:
	lsls r0, r0, #2
	ldr r1, _080C58E4  @ _080C58E8
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080C58E4: .4byte _080C58E8
_080C58E8: @ jump table
	.4byte _080C58FC @ case 0
	.4byte _080C5950 @ case 1
	.4byte _080C59A0 @ case 2
	.4byte _080C59EC @ case 3
	.4byte _080C5A34 @ case 4
_080C58FC:
	movs r1, #0xc0
	lsls r1, r1, #8
	movs r0, #0
	bl SetBackgroundTileDataOffset
	movs r1, #0xf0
	lsls r1, r1, #7
	movs r0, #0
	bl SetBackgroundMapDataOffset
	ldr r0, _080C5934  @ gUnknown_08AAFD14
	ldr r1, _080C5938  @ 0x06008000
	bl CopyDataWithPossibleUncomp
	ldr r0, _080C593C  @ gUnknown_08AAFF10
	ldr r1, _080C5940  @ 0x0600B000
	bl CopyDataWithPossibleUncomp
	ldr r0, _080C5944  @ gUnknown_08AB0114
	movs r1, #0
	movs r2, #0x20
	bl CopyToPaletteBuffer
	ldr r1, _080C5948  @ gPaletteBuffer
	ldr r0, _080C594C  @ 0x00007FFF
	strh r0, [r1]
	b _080C5A14
	.align 2, 0
_080C5934: .4byte gUnknown_08AAFD14
_080C5938: .4byte 0x06008000
_080C593C: .4byte gUnknown_08AAFF10
_080C5940: .4byte 0x0600B000
_080C5944: .4byte gUnknown_08AB0114
_080C5948: .4byte gPaletteBuffer
_080C594C: .4byte 0x00007FFF
_080C5950:
	ldr r0, _080C598C  @ gUnknown_08AADC08
	ldr r1, _080C5990  @ 0x0600C000
	bl CopyDataWithPossibleUncomp
	ldr r0, _080C5994  @ gUnknown_08AAE61C
	ldr r4, _080C5998  @ gBG0TilemapBuffer
	adds r1, r4, #0
	bl CopyDataWithPossibleUncomp
	ldr r0, _080C599C  @ gUnknown_08AAE8CC
	movs r1, #0x20
	movs r2, #0x20
	bl CopyToPaletteBuffer
	movs r0, #0x80
	lsls r0, r0, #5
	adds r2, r0, #0
	movs r1, #0xa0
	lsls r1, r1, #2
_080C5976:
	ldrh r3, [r4]
	adds r0, r2, r3
	strh r0, [r4]
	adds r4, #2
	subs r1, #1
	cmp r1, #0
	bne _080C5976
	movs r0, #1
	bl BG_EnableSyncByMask
	b _080C5A14
	.align 2, 0
_080C598C: .4byte gUnknown_08AADC08
_080C5990: .4byte 0x0600C000
_080C5994: .4byte gUnknown_08AAE61C
_080C5998: .4byte gBG0TilemapBuffer
_080C599C: .4byte gUnknown_08AAE8CC
_080C59A0:
	ldr r0, _080C59D8  @ gUnknown_08AAE8EC
	ldr r1, _080C59DC  @ 0x0600D000
	bl CopyDataWithPossibleUncomp
	ldr r0, _080C59E0  @ gUnknown_08AAF928
	ldr r4, _080C59E4  @ gBG0TilemapBuffer
	adds r1, r4, #0
	bl CopyDataWithPossibleUncomp
	ldr r0, _080C59E8  @ gUnknown_08AAFCF4
	movs r1, #0x40
	movs r2, #0x20
	bl CopyToPaletteBuffer
	movs r0, #0x82
	lsls r0, r0, #6
	adds r2, r0, #0
	movs r1, #0xa0
	lsls r1, r1, #2
_080C59C6:
	ldrh r3, [r4]
	adds r0, r2, r3
	strh r0, [r4]
	adds r4, #2
	subs r1, #1
	cmp r1, #0
	bne _080C59C6
	b _080C5A14
	.align 2, 0
_080C59D8: .4byte gUnknown_08AAE8EC
_080C59DC: .4byte 0x0600D000
_080C59E0: .4byte gUnknown_08AAF928
_080C59E4: .4byte gBG0TilemapBuffer
_080C59E8: .4byte gUnknown_08AAFCF4
_080C59EC:
	ldr r0, _080C5A1C  @ gUnknown_08AB1C24
	ldr r1, _080C5A20  @ 0x06014400
	bl CopyDataWithPossibleUncomp
	ldr r0, _080C5A24  @ gUnknown_08AB210C
	movs r1, #0xa0
	lsls r1, r1, #2
	movs r2, #0x60
	bl CopyToPaletteBuffer
	ldr r0, _080C5A28  @ gUnknown_08AB216C
	ldr r1, _080C5A2C  @ 0x06015400
	bl CopyDataWithPossibleUncomp
	ldr r0, _080C5A30  @ gUnknown_08AB21B8
	movs r1, #0xb8
	lsls r1, r1, #2
	movs r2, #0x20
	bl CopyToPaletteBuffer
_080C5A14:
	ldrh r0, [r5, #0x2a]
	adds r0, #1
	strh r0, [r5, #0x2a]
	b _080C5A3E
	.align 2, 0
_080C5A1C: .4byte gUnknown_08AB1C24
_080C5A20: .4byte 0x06014400
_080C5A24: .4byte gUnknown_08AB210C
_080C5A28: .4byte gUnknown_08AB216C
_080C5A2C: .4byte 0x06015400
_080C5A30: .4byte gUnknown_08AB21B8
_080C5A34:
	movs r0, #0
	strh r0, [r5, #0x2a]
	adds r0, r5, #0
	bl Proc_Break
_080C5A3E:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80C58CC

	THUMB_FUNC_START sub_80C5A44
sub_80C5A44: @ 0x080C5A44
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	ldr r4, _080C5AE8  @ gLCDControlBuffer
	ldrb r1, [r4]
	movs r0, #8
	negs r0, r0
	ands r0, r1
	movs r5, #1
	orrs r0, r5
	strb r0, [r4]
	movs r0, #2
	movs r1, #2
	bl SetBackgroundScreenSize
	movs r0, #8
	movs r1, #0
	bl sub_80C6BF0
	ldrb r1, [r4, #0x15]
	movs r0, #0x21
	negs r0, r0
	ands r0, r1
	strb r0, [r4, #0x15]
	ldrb r1, [r4, #1]
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
	strb r0, [r4, #1]
	ldrb r1, [r4, #0xc]
	movs r2, #4
	negs r2, r2
	adds r0, r2, #0
	ands r0, r1
	orrs r0, r5
	strb r0, [r4, #0xc]
	ldrb r1, [r4, #0x10]
	adds r0, r2, #0
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	strb r0, [r4, #0x10]
	ldrb r0, [r4, #0x14]
	ands r2, r0
	strb r2, [r4, #0x14]
	ldrb r0, [r4, #0x18]
	movs r1, #3
	orrs r0, r1
	strb r0, [r4, #0x18]
	movs r0, #2
	movs r1, #8
	movs r2, #8
	movs r3, #0x10
	bl SetSpecialColorEffectsParameters
	movs r0, #1
	str r0, [sp]
	movs r1, #1
	movs r2, #1
	movs r3, #1
	bl SetBlendTargetA
	ldr r0, _080C5AEC  @ gPaletteBuffer
	movs r4, #0
	strh r4, [r0]
	bl EnablePaletteSync
	strh r4, [r6, #0x2a]
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080C5AE8: .4byte gLCDControlBuffer
_080C5AEC: .4byte gPaletteBuffer

	THUMB_FUNC_END sub_80C5A44

	THUMB_FUNC_START sub_80C5AF0
sub_80C5AF0: @ 0x080C5AF0
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldrh r0, [r5, #0x2a]
	cmp r0, #0x2c
	bhi _080C5B0C
	movs r2, #0x80
	lsls r2, r2, #1
	adds r3, r0, #0
	movs r0, #0x2d
	str r0, [sp]
	movs r0, #0
	movs r1, #0x40
	b _080C5B1E
_080C5B0C:
	movs r1, #0x80
	lsls r1, r1, #1
	movs r2, #0xe0
	lsls r2, r2, #1
	ldrh r3, [r5, #0x2a]
	subs r3, #0x2d
	movs r0, #0x2d
	str r0, [sp]
	movs r0, #0
_080C5B1E:
	bl Interpolate
	adds r4, r0, #0
	ldrh r3, [r5, #0x2a]
	movs r0, #0x5a
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0x40
	bl Interpolate
	adds r1, r0, #0
	adds r0, r4, #0
	bl sub_80C6BF0
	cmp r4, #0xff
	ble _080C5B50
	ldr r3, _080C5BBC  @ gObject_32x32
	ldr r0, _080C5BC0  @ 0x00004220
	str r0, [sp]
	movs r0, #0
	movs r1, #0x68
	movs r2, #0x40
	bl PutSpriteExt
_080C5B50:
	ldrh r0, [r5, #0x2a]
	cmp r0, #0x16
	bhi _080C5B6C
	adds r3, r0, #0
	movs r0, #0x16
	str r0, [sp]
	movs r0, #0
	movs r1, #0x10
	movs r2, #0
	bl Interpolate
	ldr r1, _080C5BC4  @ gLCDControlBuffer
	adds r1, #0x46
	strb r0, [r1]
_080C5B6C:
	ldrh r0, [r5, #0x2a]
	adds r4, r0, #0
	subs r4, #0x44
	cmp r4, #0
	blt _080C5BAA
	cmp r4, #0
	bne _080C5B94
	ldr r0, _080C5BC4  @ gLCDControlBuffer
	adds r0, #0x3c
	ldrb r1, [r0]
	movs r2, #0xc0
	orrs r1, r2
	strb r1, [r0]
	str r4, [sp]
	movs r0, #1
	movs r1, #1
	movs r2, #1
	movs r3, #1
	bl SetBlendTargetA
_080C5B94:
	movs r0, #0x16
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0x10
	adds r3, r4, #0
	bl Interpolate
	ldr r1, _080C5BC4  @ gLCDControlBuffer
	adds r1, #0x46
	strb r0, [r1]
_080C5BAA:
	ldrh r0, [r5, #0x2a]
	cmp r0, #0x5a
	bne _080C5BC8
	movs r0, #0
	strh r0, [r5, #0x2a]
	adds r0, r5, #0
	bl Proc_Break
	b _080C5BCC
	.align 2, 0
_080C5BBC: .4byte gObject_32x32
_080C5BC0: .4byte 0x00004220
_080C5BC4: .4byte gLCDControlBuffer
_080C5BC8:
	adds r0, #1
	strh r0, [r5, #0x2a]
_080C5BCC:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80C5AF0

	THUMB_FUNC_START sub_80C5BD4
sub_80C5BD4: @ 0x080C5BD4
	push {r4, r5, lr}
	sub sp, #8
	ldr r0, _080C5C54  @ gBG2TilemapBuffer
	movs r1, #0
	bl BG_Fill
	movs r0, #6
	bl BG_EnableSyncByMask
	ldr r4, _080C5C58  @ gLCDControlBuffer
	ldrb r1, [r4]
	movs r0, #8
	negs r0, r0
	ands r0, r1
	strb r0, [r4]
	movs r0, #1
	movs r1, #0x10
	movs r2, #0x10
	movs r3, #0x10
	bl SetSpecialColorEffectsParameters
	movs r0, #1
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl SetBlendTargetA
	movs r5, #0
	str r5, [sp]
	movs r0, #0
	movs r1, #1
	movs r2, #0
	movs r3, #0
	bl SetBlendTargetB
	ldrb r1, [r4, #1]
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
	strb r0, [r4, #1]
	str r5, [sp, #4]
	ldr r1, _080C5C5C  @ gUnknown_02022A68
	ldr r2, _080C5C60  @ 0x01000008
	add r0, sp, #4
	bl CpuFastSet
	bl EnablePaletteSync
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C5C54: .4byte gBG2TilemapBuffer
_080C5C58: .4byte gLCDControlBuffer
_080C5C5C: .4byte gUnknown_02022A68
_080C5C60: .4byte 0x01000008

	THUMB_FUNC_END sub_80C5BD4

	THUMB_FUNC_START sub_80C5C64
sub_80C5C64: @ 0x080C5C64
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r7, r0, #0
	ldr r0, _080C5CC0  @ gUnknown_08AAB3F4
	movs r1, #0xe0
	lsls r1, r1, #1
	movs r2, #0x20
	bl CopyToPaletteBuffer
	ldr r4, _080C5CC4  @ gUnknown_02022A68
	ldrh r3, [r7, #0x2a]
	movs r0, #0x30
	str r0, [sp]
	movs r0, #0
	movs r1, #0x10
	movs r2, #0
	bl Interpolate
	adds r2, r0, #0
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	adds r0, r4, #0
	movs r1, #0
	bl sub_80C69B0
	ldrh r0, [r7, #0x2a]
	cmp r0, #0x14
	bne _080C5CA6
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl Sound_PlaySong80024E4
_080C5CA6:
	ldrh r1, [r7, #0x2a]
	adds r0, r1, #0
	cmp r0, #0x13
	bhi _080C5CD0
	ldr r3, _080C5CC8  @ gObject_32x32
	ldr r0, _080C5CCC  @ 0x00004220
	str r0, [sp]
	movs r0, #0
	movs r1, #0x68
	movs r2, #0x40
	bl PutSpriteExt
	b _080C5DC0
	.align 2, 0
_080C5CC0: .4byte gUnknown_08AAB3F4
_080C5CC4: .4byte gUnknown_02022A68
_080C5CC8: .4byte gObject_32x32
_080C5CCC: .4byte 0x00004220
_080C5CD0:
	cmp r0, #0x17
	bhi _080C5D30
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080C5D00
	ldr r4, _080C5CF4  @ gObject_32x32
	ldr r0, _080C5CF8  @ 0x00006228
	str r0, [sp]
	movs r0, #0
	movs r1, #0x68
	movs r2, #0x40
	adds r3, r4, #0
	bl PutSpriteExt
	ldr r0, _080C5CFC  @ 0x00005224
	b _080C5D14
	.align 2, 0
_080C5CF4: .4byte gObject_32x32
_080C5CF8: .4byte 0x00006228
_080C5CFC: .4byte 0x00005224
_080C5D00:
	ldr r4, _080C5D24  @ gObject_32x32
	ldr r0, _080C5D28  @ 0x00005224
	str r0, [sp]
	movs r0, #0
	movs r1, #0x68
	movs r2, #0x40
	adds r3, r4, #0
	bl PutSpriteExt
	ldr r0, _080C5D2C  @ 0x00006228
_080C5D14:
	str r0, [sp]
	movs r0, #1
	movs r1, #0x68
	movs r2, #0x40
	adds r3, r4, #0
	bl PutSpriteExt
	b _080C5DC0
	.align 2, 0
_080C5D24: .4byte gObject_32x32
_080C5D28: .4byte 0x00005224
_080C5D2C: .4byte 0x00006228
_080C5D30:
	ldrh r0, [r7, #0x2a]
	adds r3, r0, #0
	subs r3, #0x18
	cmp r3, #8
	bgt _080C5DC0
	movs r0, #8
	str r0, [sp]
	movs r0, #1
	movs r1, #0
	movs r2, #0x80
	bl Interpolate
	adds r6, r0, #0
	ldrh r1, [r7, #0x2a]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080C5D94
	movs r1, #0x68
	subs r1, r1, r6
	ldr r4, _080C5D84  @ 0x000001FF
	ands r1, r4
	ldr r5, _080C5D88  @ gObject_32x32
	ldr r0, _080C5D8C  @ 0x00006228
	str r0, [sp]
	movs r0, #0
	movs r2, #0x40
	adds r3, r5, #0
	bl PutSpriteExt
	adds r1, r6, #0
	adds r1, #0x68
	ands r1, r4
	ldr r0, _080C5D90  @ 0x00005224
	str r0, [sp]
	movs r0, #1
	movs r2, #0x40
	adds r3, r5, #0
	bl PutSpriteExt
	b _080C5DC0
	.align 2, 0
_080C5D84: .4byte 0x000001FF
_080C5D88: .4byte gObject_32x32
_080C5D8C: .4byte 0x00006228
_080C5D90: .4byte 0x00005224
_080C5D94:
	adds r1, r6, #0
	adds r1, #0x68
	ldr r4, _080C5DD4  @ 0x000001FF
	ands r1, r4
	ldr r5, _080C5DD8  @ gObject_32x32
	ldr r0, _080C5DDC  @ 0x00005224
	str r0, [sp]
	movs r0, #0
	movs r2, #0x40
	adds r3, r5, #0
	bl PutSpriteExt
	movs r1, #0x68
	subs r1, r1, r6
	ands r1, r4
	ldr r0, _080C5DE0  @ 0x00006228
	str r0, [sp]
	movs r0, #1
	movs r2, #0x40
	adds r3, r5, #0
	bl PutSpriteExt
_080C5DC0:
	ldrh r0, [r7, #0x2a]
	cmp r0, #0x30
	bne _080C5DE4
	movs r0, #0
	strh r0, [r7, #0x2a]
	adds r0, r7, #0
	bl Proc_Break
	b _080C5DE8
	.align 2, 0
_080C5DD4: .4byte 0x000001FF
_080C5DD8: .4byte gObject_32x32
_080C5DDC: .4byte 0x00005224
_080C5DE0: .4byte 0x00006228
_080C5DE4:
	adds r0, #1
	strh r0, [r7, #0x2a]
_080C5DE8:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80C5C64

	THUMB_FUNC_START sub_80C5DF0
sub_80C5DF0: @ 0x080C5DF0
	push {r4, lr}
	sub sp, #4
	ldr r2, _080C5E54  @ gLCDControlBuffer
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
	movs r0, #1
	movs r1, #0
	movs r2, #0x10
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	movs r4, #0
	str r4, [sp]
	movs r0, #1
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl SetBlendTargetA
	str r4, [sp]
	movs r0, #0
	movs r1, #1
	movs r2, #0
	movs r3, #0
	bl SetBlendTargetB
	ldr r0, _080C5E58  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080C5E4C
	ldr r0, _080C5E5C  @ 0x00000317
	bl m4aSongNumStart
_080C5E4C:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C5E54: .4byte gLCDControlBuffer
_080C5E58: .4byte gRAMChapterData
_080C5E5C: .4byte 0x00000317

	THUMB_FUNC_END sub_80C5DF0

	THUMB_FUNC_START sub_80C5E60
sub_80C5E60: @ 0x080C5E60
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldrh r3, [r4, #0x2a]
	movs r0, #0xc
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0xd
	bl Interpolate
	ldr r1, _080C5E90  @ gLCDControlBuffer
	adds r1, #0x44
	strb r0, [r1]
	ldrh r0, [r4, #0x2a]
	cmp r0, #0xc
	bne _080C5E94
	movs r0, #0
	strh r0, [r4, #0x2a]
	adds r0, r4, #0
	bl Proc_Break
	b _080C5E98
	.align 2, 0
_080C5E90: .4byte gLCDControlBuffer
_080C5E94:
	adds r0, #1
	strh r0, [r4, #0x2a]
_080C5E98:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80C5E60

	THUMB_FUNC_START sub_80C5EA0
sub_80C5EA0: @ 0x080C5EA0
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r7, r0, #0
	ldrh r3, [r7, #0x2a]
	movs r0, #0xc
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0x10
	bl Interpolate
	adds r5, r0, #0
	ldrh r0, [r7, #0x2a]
	cmp r0, #0
	bne _080C5EC4
	movs r0, #1
	bl BG_EnableSyncByMask
_080C5EC4:
	ldr r0, _080C5F10  @ gUnknown_08AAFCF4
	movs r1, #0x40
	movs r2, #0x20
	bl CopyToPaletteBuffer
	ldr r4, _080C5F14  @ gUnknown_020228E8
	ldr r6, _080C5F18  @ 0x00007FFF
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	adds r0, r4, #0
	adds r1, r6, #0
	adds r2, r5, #0
	bl sub_80C69B0
	ldr r0, _080C5F1C  @ gUnknown_08AAB3F4
	movs r1, #0xe0
	lsls r1, r1, #1
	movs r2, #0x20
	bl CopyToPaletteBuffer
	movs r0, #0xc0
	lsls r0, r0, #1
	adds r4, r4, r0
	adds r0, r4, #0
	adds r1, r6, #0
	adds r2, r5, #0
	bl sub_80C69B0
	ldrh r0, [r7, #0x2a]
	cmp r0, #0xc
	bne _080C5F20
	movs r0, #0
	strh r0, [r7, #0x2a]
	adds r0, r7, #0
	bl Proc_Break
	b _080C5F24
	.align 2, 0
_080C5F10: .4byte gUnknown_08AAFCF4
_080C5F14: .4byte gUnknown_020228E8
_080C5F18: .4byte 0x00007FFF
_080C5F1C: .4byte gUnknown_08AAB3F4
_080C5F20:
	adds r0, #1
	strh r0, [r7, #0x2a]
_080C5F24:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80C5EA0

	THUMB_FUNC_START sub_80C5F2C
sub_80C5F2C: @ 0x080C5F2C
	push {r4, lr}
	ldr r0, _080C5F70  @ gUnknown_08AB0B44
	ldr r1, _080C5F74  @ 0x06008000
	bl CopyDataWithPossibleUncomp
	ldr r0, _080C5F78  @ gUnknown_08AB1890
	ldr r4, _080C5F7C  @ gBG2TilemapBuffer
	adds r1, r4, #0
	bl CopyDataWithPossibleUncomp
	ldr r0, _080C5F80  @ gUnknown_08AB1C04
	movs r1, #0x60
	movs r2, #0x20
	bl CopyToPaletteBuffer
	movs r0, #0xc0
	lsls r0, r0, #6
	adds r2, r0, #0
	movs r1, #0xa0
	lsls r1, r1, #2
_080C5F54:
	ldrh r3, [r4]
	adds r0, r2, r3
	strh r0, [r4]
	adds r4, #2
	subs r1, #1
	cmp r1, #0
	bne _080C5F54
	movs r0, #4
	bl BG_EnableSyncByMask
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C5F70: .4byte gUnknown_08AB0B44
_080C5F74: .4byte 0x06008000
_080C5F78: .4byte gUnknown_08AB1890
_080C5F7C: .4byte gBG2TilemapBuffer
_080C5F80: .4byte gUnknown_08AB1C04

	THUMB_FUNC_END sub_80C5F2C

	THUMB_FUNC_START sub_80C5F84
sub_80C5F84: @ 0x080C5F84
	ldr r2, _080C5FB0  @ gLCDControlBuffer
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
	subs r1, #8
	ands r0, r1
	strb r0, [r2, #1]
	adds r2, #0x3c
	ldrb r1, [r2]
	movs r0, #0x3f
	ands r0, r1
	strb r0, [r2]
	bx lr
	.align 2, 0
_080C5FB0: .4byte gLCDControlBuffer

	THUMB_FUNC_END sub_80C5F84

	THUMB_FUNC_START sub_80C5FB4
sub_80C5FB4: @ 0x080C5FB4
	ldr r2, _080C5FE4  @ gLCDControlBuffer
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
	adds r2, #0x3c
	ldrb r1, [r2]
	movs r0, #0x3f
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	bx lr
	.align 2, 0
_080C5FE4: .4byte gLCDControlBuffer

	THUMB_FUNC_END sub_80C5FB4

	THUMB_FUNC_START sub_80C5FE8
sub_80C5FE8: @ 0x080C5FE8
	push {r4, r5, lr}
	sub sp, #4
	ldr r4, _080C606C  @ gLCDControlBuffer
	ldrb r1, [r4]
	movs r0, #8
	negs r0, r0
	ands r0, r1
	movs r5, #1
	orrs r0, r5
	strb r0, [r4]
	movs r0, #2
	movs r1, #1
	bl SetBackgroundScreenSize
	movs r0, #0x40
	bl sub_80C5548
	ldr r0, _080C6070  @ gUnknown_08AB0134
	ldr r1, _080C6074  @ 0x06008000
	bl CopyDataWithPossibleUncomp
	ldr r0, _080C6078  @ gUnknown_08AB0A20
	ldr r1, _080C607C  @ gBG2TilemapBuffer
	bl CopyDataWithPossibleUncomp
	ldr r0, _080C6080  @ gUnknown_08AB0B24
	movs r1, #0
	movs r2, #0x20
	bl CopyToPaletteBuffer
	movs r0, #4
	bl BG_EnableSyncByMask
	ldr r0, _080C6084  @ 0x7FFF7FFF
	str r0, [sp]
	ldr r1, _080C6088  @ gUnknown_02022A68
	ldr r2, _080C608C  @ 0x01000010
	mov r0, sp
	bl CpuFastSet
	movs r0, #0
	movs r1, #0
	bl SetBackgroundTileDataOffset
	movs r1, #0xd0
	lsls r1, r1, #7
	movs r0, #0
	bl SetBackgroundMapDataOffset
	ldrb r0, [r4, #1]
	orrs r0, r5
	movs r1, #2
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #9
	negs r1, r1
	ands r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r4, #1]
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C606C: .4byte gLCDControlBuffer
_080C6070: .4byte gUnknown_08AB0134
_080C6074: .4byte 0x06008000
_080C6078: .4byte gUnknown_08AB0A20
_080C607C: .4byte gBG2TilemapBuffer
_080C6080: .4byte gUnknown_08AB0B24
_080C6084: .4byte 0x7FFF7FFF
_080C6088: .4byte gUnknown_02022A68
_080C608C: .4byte 0x01000010

	THUMB_FUNC_END sub_80C5FE8

	THUMB_FUNC_START sub_80C6090
sub_80C6090: @ 0x080C6090
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	movs r2, #0x80
	lsls r2, r2, #1
	ldrh r3, [r4, #0x2a]
	movs r0, #0x10
	str r0, [sp]
	movs r0, #1
	movs r1, #0x20
	bl Interpolate
	bl sub_80C5548
	ldrh r0, [r4, #0x2a]
	cmp r0, #0x10
	bne _080C60BE
	movs r0, #0
	strh r0, [r4, #0x2a]
	adds r0, r4, #0
	bl Proc_Break
	b _080C60C2
_080C60BE:
	adds r0, #1
	strh r0, [r4, #0x2a]
_080C60C2:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80C6090

	THUMB_FUNC_START sub_80C60CC
sub_80C60CC: @ 0x080C60CC
	push {r4, r5, r6, lr}
	sub sp, #4
	ldr r5, _080C60F8  @ gGenericBuffer
	movs r6, #0
	movs r4, #3
_080C60D6:
	str r6, [sp]
	mov r0, sp
	adds r1, r5, #0
	ldr r2, _080C60FC  @ 0x01000080
	bl CpuFastSet
	movs r0, #0x80
	lsls r0, r0, #3
	adds r5, r5, r0
	subs r4, #1
	cmp r4, #0
	bge _080C60D6
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080C60F8: .4byte gGenericBuffer
_080C60FC: .4byte 0x01000080

	THUMB_FUNC_END sub_80C60CC

	THUMB_FUNC_START nullsub_23
nullsub_23: @ 0x080C6100
	bx lr

	THUMB_FUNC_END nullsub_23

	THUMB_FUNC_START sub_80C6104
sub_80C6104: @ 0x080C6104
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	movs r0, #1
	movs r1, #0x10
	movs r2, #0x10
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	movs r4, #0
	str r4, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl SetBlendTargetA
	str r4, [sp]
	movs r0, #1
	movs r1, #1
	movs r2, #0
	movs r3, #0
	bl SetBlendTargetB
	str r4, [r5, #0x30]
	bl sub_80C60CC
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80C6104

	THUMB_FUNC_START sub_80C6144
sub_80C6144: @ 0x080C6144
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r6, r0, #0
	ldr r5, _080C61F4  @ gUnknown_08AA6858
	movs r1, #0
	ldrsh r0, [r5, r1]
	cmp r0, #0
	beq _080C61E6
	ldr r3, _080C61F8  @ gUnknown_08AA682C
	mov r8, r3
	movs r7, #0x18
_080C615E:
	ldrb r0, [r5, #4]
	lsls r0, r0, #1
	add r0, r8
	movs r2, #0
	ldrsb r2, [r0, r2]
	movs r1, #0
	ldrsh r0, [r5, r1]
	adds r1, r2, #0
	muls r1, r0, r1
	asrs r1, r1, #8
	movs r3, #2
	ldrsh r0, [r5, r3]
	muls r2, r0, r2
	asrs r2, r2, #8
	str r7, [sp]
	movs r0, #0
	adds r3, r6, #0
	bl Interpolate
	adds r4, r0, #0
	adds r4, #0x74
	ldrb r0, [r5, #4]
	lsls r0, r0, #1
	adds r0, #1
	add r0, r8
	movs r2, #0
	ldrsb r2, [r0, r2]
	movs r1, #0
	ldrsh r0, [r5, r1]
	adds r1, r2, #0
	muls r1, r0, r1
	asrs r1, r1, #8
	movs r3, #2
	ldrsh r0, [r5, r3]
	muls r2, r0, r2
	asrs r2, r2, #8
	str r7, [sp]
	movs r0, #0
	adds r3, r6, #0
	bl Interpolate
	adds r2, r0, #0
	adds r2, #0x38
	ldr r0, _080C61FC  @ 0x000001FF
	ands r4, r0
	movs r0, #0xff
	ands r2, r0
	movs r0, #0x80
	lsls r0, r0, #3
	orrs r2, r0
	ldrb r0, [r5, #5]
	movs r1, #0xa8
	lsls r1, r1, #2
	adds r0, r0, r1
	movs r1, #0xe8
	lsls r1, r1, #7
	orrs r0, r1
	str r0, [sp]
	movs r0, #4
	adds r1, r4, #0
	ldr r3, _080C6200  @ gObject_8x8
	bl PutSpriteExt
	adds r5, #8
	movs r3, #0
	ldrsh r0, [r5, r3]
	cmp r0, #0
	bne _080C615E
_080C61E6:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C61F4: .4byte gUnknown_08AA6858
_080C61F8: .4byte gUnknown_08AA682C
_080C61FC: .4byte 0x000001FF
_080C6200: .4byte gObject_8x8

	THUMB_FUNC_END sub_80C6144

	THUMB_FUNC_START sub_80C6204
sub_80C6204: @ 0x080C6204
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r7, r0, #0
	ldrh r3, [r7, #0x2a]
	movs r0, #0x18
	mov r8, r0
	str r0, [sp]
	movs r0, #0
	movs r1, #0x10
	movs r2, #0
	bl Interpolate
	ldr r1, _080C62B0  @ gLCDControlBuffer
	adds r1, #0x44
	strb r0, [r1]
	ldrh r3, [r7, #0x2a]
	mov r0, r8
	str r0, [sp]
	movs r0, #0
	movs r1, #0x10
	movs r2, #0
	bl Interpolate
	adds r5, r0, #0
	ldr r0, _080C62B4  @ gUnknown_08AAB3F4
	movs r1, #0xe0
	lsls r1, r1, #1
	movs r2, #0x20
	bl CopyToPaletteBuffer
	ldr r4, _080C62B8  @ gUnknown_02022A68
	ldr r6, _080C62BC  @ 0x00007FFF
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	adds r0, r4, #0
	adds r1, r6, #0
	adds r2, r5, #0
	bl sub_80C69B0
	ldr r0, _080C62C0  @ gUnknown_08AAC58C
	movs r1, #0xf0
	lsls r1, r1, #1
	movs r2, #0x20
	bl CopyToPaletteBuffer
	adds r4, #0x20
	adds r0, r4, #0
	adds r1, r6, #0
	adds r2, r5, #0
	bl sub_80C69B0
	ldrh r3, [r7, #0x2a]
	mov r0, r8
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0x3f
	bl Interpolate
	adds r5, r0, #0
	ldr r1, [r7, #0x30]
	bl nullsub_23
	str r5, [r7, #0x30]
	ldr r3, _080C62C4  @ gUnknown_08AA6794
	ldr r0, _080C62C8  @ 0x000031A0
	str r0, [sp]
	movs r0, #1
	movs r1, #0x10
	movs r2, #0x55
	bl PutSpriteExt
	ldrh r0, [r7, #0x2a]
	bl sub_80C6144
	ldrh r0, [r7, #0x2a]
	cmp r0, #0x18
	bne _080C62CC
	movs r0, #0
	strh r0, [r7, #0x2a]
	adds r0, r7, #0
	bl Proc_Break
	b _080C62D0
	.align 2, 0
_080C62B0: .4byte gLCDControlBuffer
_080C62B4: .4byte gUnknown_08AAB3F4
_080C62B8: .4byte gUnknown_02022A68
_080C62BC: .4byte 0x00007FFF
_080C62C0: .4byte gUnknown_08AAC58C
_080C62C4: .4byte gUnknown_08AA6794
_080C62C8: .4byte 0x000031A0
_080C62CC:
	adds r0, #1
	strh r0, [r7, #0x2a]
_080C62D0:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80C6204

	THUMB_FUNC_START sub_80C62DC
sub_80C62DC: @ 0x080C62DC
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r4, _080C634C  @ gLCDControlBuffer
	ldrb r1, [r4]
	movs r0, #8
	negs r0, r0
	ands r0, r1
	strb r0, [r4]
	movs r0, #2
	movs r1, #0
	bl SetBackgroundScreenSize
	ldrb r0, [r4, #1]
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
	strb r0, [r4, #1]
	ldr r0, _080C6350  @ gUnknown_08AA67FC
	adds r1, r5, #0
	bl Proc_Start
	movs r0, #1
	movs r1, #8
	movs r2, #8
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	movs r4, #0
	str r4, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl SetBlendTargetA
	str r4, [sp]
	movs r0, #1
	movs r1, #1
	movs r2, #0
	movs r3, #0
	bl SetBlendTargetB
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C634C: .4byte gLCDControlBuffer
_080C6350: .4byte gUnknown_08AA67FC

	THUMB_FUNC_END sub_80C62DC

	THUMB_FUNC_START sub_80C6354
sub_80C6354: @ 0x080C6354
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x2c]
	adds r2, r0, #1
	str r2, [r4, #0x2c]
	ldrh r0, [r4, #0x2a]
	adds r0, #1
	ldr r3, _080C639C  @ 0x0000FFFF
	adds r1, r3, #0
	ands r0, r1
	movs r1, #0x3f
	ands r0, r1
	strh r0, [r4, #0x2a]
	ldr r0, _080C63A0  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #9
	ands r0, r1
	cmp r0, #0
	beq _080C63A8
	ldr r0, _080C63A4  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080C638E
	movs r0, #0x6d
	bl m4aSongNumStart
_080C638E:
	movs r0, #0
	bl SetNextGameActionId
	adds r0, r4, #0
	bl Proc_Break
	b _080C63BA
	.align 2, 0
_080C639C: .4byte 0x0000FFFF
_080C63A0: .4byte gKeyStatusPtr
_080C63A4: .4byte gRAMChapterData
_080C63A8:
	ldr r0, _080C63C0  @ 0x0000032F
	cmp r2, r0
	bne _080C63BA
	movs r0, #1
	bl SetNextGameActionId
	adds r0, r4, #0
	bl Proc_Break
_080C63BA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C63C0: .4byte 0x0000032F

	THUMB_FUNC_END sub_80C6354

	THUMB_FUNC_START sub_80C63C4
sub_80C63C4: @ 0x080C63C4
	push {lr}
	bl EndAllProcChildren
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80C63C4

	THUMB_FUNC_START sub_80C63D0
sub_80C63D0: @ 0x080C63D0
	push {r4, r5, lr}
	adds r4, r0, #0
	bl EndAllProcChildren
	bl sub_80C55B8
	ldr r1, _080C641C  @ gPaletteBuffer
	movs r5, #0
	movs r0, #0
	strh r0, [r1]
	bl EnablePaletteSync
	adds r4, #0x29
	strb r5, [r4]
	ldr r2, _080C6420  @ gLCDControlBuffer
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
	movs r0, #0x43
	movs r1, #0
	movs r2, #0
	bl Sound_PlaySong80024E4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C641C: .4byte gPaletteBuffer
_080C6420: .4byte gLCDControlBuffer

	THUMB_FUNC_END sub_80C63D0

	THUMB_FUNC_START sub_80C6424
sub_80C6424: @ 0x080C6424
	push {lr}
	adds r1, r0, #0
	ldr r0, _080C6440  @ gUnknown_08AA6A50
	bl Proc_StartBlocking
	adds r0, #0x29
	movs r1, #0
	strb r1, [r0]
	movs r0, #0x43
	movs r2, #0
	bl Sound_PlaySong80024E4
	pop {r0}
	bx r0
	.align 2, 0
_080C6440: .4byte gUnknown_08AA6A50

	THUMB_FUNC_END sub_80C6424

	THUMB_FUNC_START sub_80C6444
sub_80C6444: @ 0x080C6444
	push {lr}
	adds r1, r0, #0
	ldr r0, _080C6458  @ gUnknown_08AA6A50
	bl Proc_StartBlocking
	adds r0, #0x29
	movs r1, #0
	strb r1, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_080C6458: .4byte gUnknown_08AA6A50

	THUMB_FUNC_END sub_80C6444

	THUMB_FUNC_START sub_80C645C
sub_80C645C: @ 0x080C645C
	push {lr}
	adds r1, r0, #0
	ldr r0, _080C6470  @ gUnknown_08AA6A50
	bl Proc_StartBlocking
	adds r0, #0x29
	movs r1, #1
	strb r1, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_080C6470: .4byte gUnknown_08AA6A50

	THUMB_FUNC_END sub_80C645C

.align 2, 0
