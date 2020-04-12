	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	@ map effect for when using the warp event codes
	@ *not* the effect used by the warp/rescue staves

	THUMB_FUNC_START sub_8021B9C
sub_8021B9C: @ 0x08021B9C
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	ldr r0, _08021C48  @ gUnknown_085A5A60
	ldr r1, _08021C4C  @ 0x06002000
	bl CopyDataWithPossibleUncomp
	ldr r0, _08021C50  @ gUnknown_085A61A8
	movs r1, #0xa0
	movs r2, #0x20
	bl CopyToPaletteBuffer
	ldr r0, _08021C54  @ gUnknown_085A61C8
	ldr r4, _08021C58  @ gBmFrameTmap0
	adds r1, r4, #0
	bl CopyDataWithPossibleUncomp
	movs r0, #0xa2
	lsls r0, r0, #7
	adds r1, r0, #0
	movs r5, #0xd8
	lsls r5, r5, #2
_08021BC8:
	ldrh r2, [r4]
	adds r0, r1, r2
	strh r0, [r4]
	adds r4, #2
	subs r5, #1
	cmp r5, #0
	bne _08021BC8
	ldr r0, _08021C5C  @ gBG0TilemapBuffer
	movs r1, #0x80
	lsls r1, r1, #1
	bl BG_Fill
	movs r0, #1
	bl BG_EnableSyncByMask
	ldr r0, _08021C60  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08021BF8
	movs r0, #0xb4
	bl m4aSongNumStart
_08021BF8:
	movs r0, #1
	movs r1, #0xa
	movs r2, #0xc
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	str r5, [sp]
	movs r0, #1
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl sub_8001ED0
	movs r0, #1
	str r0, [sp]
	movs r0, #0
	movs r1, #1
	movs r2, #1
	movs r3, #1
	bl sub_8001F0C
	ldr r2, _08021C64  @ gLCDControlBuffer
	ldrb r1, [r2, #1]
	movs r0, #0x21
	negs r0, r0
	ands r0, r1
	movs r1, #0x41
	negs r1, r1
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r2, #1]
	adds r0, r6, #0
	adds r0, #0x4c
	strh r5, [r0]
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08021C48: .4byte gUnknown_085A5A60
_08021C4C: .4byte 0x06002000
_08021C50: .4byte gUnknown_085A61A8
_08021C54: .4byte gUnknown_085A61C8
_08021C58: .4byte gBmFrameTmap0
_08021C5C: .4byte gBG0TilemapBuffer
_08021C60: .4byte gRAMChapterData
_08021C64: .4byte gLCDControlBuffer

	THUMB_FUNC_END sub_8021B9C

	THUMB_FUNC_START sub_8021C68
sub_8021C68: @ 0x08021C68
	push {r4, r5, r6, lr}
	adds r3, r0, #0
	adds r0, #0x64
	movs r1, #0
	ldrsh r0, [r0, r1]
	ldr r4, _08021CC4  @ gUnknown_0859B48C
	cmp r0, #0
	bne _08021C7A
	ldr r4, _08021CC8  @ gUnknown_0859B448
_08021C7A:
	adds r0, r3, #0
	adds r0, #0x66
	movs r1, #0
	ldrsh r0, [r0, r1]
	adds r2, r3, #0
	adds r2, #0x4c
	cmp r0, #0
	beq _08021C9E
	ldr r0, _08021CCC  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #4]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08021C9E
	ldrh r0, [r2]
	adds r0, #1
	strh r0, [r2]
_08021C9E:
	ldrh r0, [r2]
	adds r6, r0, #1
	strh r6, [r2]
	movs r1, #0
	ldrsh r0, [r2, r1]
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	lsls r0, r0, #2
	adds r0, r0, r4
	ldrb r4, [r0]
	ldrb r5, [r0, #1]
	cmp r4, #0xff
	bne _08021CD0
	adds r0, r3, #0
	bl Proc_Break
	b _08021CF6
	.align 2, 0
_08021CC4: .4byte gUnknown_0859B48C
_08021CC8: .4byte gUnknown_0859B448
_08021CCC: .4byte gKeyStatusPtr
_08021CD0:
	lsls r0, r6, #0x10
	asrs r0, r0, #0x10
	cmp r0, #8
	bne _08021CDC
	bl SMS_UpdateFromGameData
_08021CDC:
	lsls r0, r5, #5
	adds r0, r0, r4
	lsls r0, r0, #1
	ldr r1, _08021CFC  @ gBmFrameTmap0
	adds r0, r0, r1
	ldr r1, _08021D00  @ gBG0TilemapBuffer
	movs r2, #4
	movs r3, #7
	bl TileMap_CopyRect
	movs r0, #1
	bl BG_EnableSyncByMask
_08021CF6:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08021CFC: .4byte gBmFrameTmap0
_08021D00: .4byte gBG0TilemapBuffer

	THUMB_FUNC_END sub_8021C68

	THUMB_FUNC_START sub_8021D04
sub_8021D04: @ 0x08021D04
	push {lr}
	ldr r0, _08021D2C  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08021D18
	movs r0, #0xb5
	bl m4aSongNumStart
_08021D18:
	ldr r0, _08021D30  @ gBG0TilemapBuffer
	movs r1, #0
	bl BG_Fill
	movs r0, #1
	bl BG_EnableSyncByMask
	pop {r0}
	bx r0
	.align 2, 0
_08021D2C: .4byte gRAMChapterData
_08021D30: .4byte gBG0TilemapBuffer

	THUMB_FUNC_END sub_8021D04

	THUMB_FUNC_START sub_8021D34
sub_8021D34: @ 0x08021D34
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	adds r7, r1, #0
	mov r8, r2
	adds r4, r3, #0
	ldr r5, [sp, #0x18]
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	ldr r0, _08021D9C  @ gUnknown_0859B4D0
	adds r1, r6, #0
	bl Proc_Start
	lsls r4, r4, #0x18
	asrs r4, r4, #0x18
	adds r1, r0, #0
	adds r1, #0x64
	strh r4, [r1]
	lsls r5, r5, #0x18
	asrs r5, r5, #0x18
	adds r0, #0x66
	strh r5, [r0]
	lsls r0, r7, #4
	ldr r2, _08021DA0  @ gUnknown_0202BCB0
	movs r3, #0xc
	ldrsh r1, [r2, r3]
	subs r0, r0, r1
	adds r7, r0, #0
	subs r7, #8
	mov r1, r8
	lsls r0, r1, #4
	movs r3, #0xe
	ldrsh r1, [r2, r3]
	subs r0, r0, r1
	subs r0, #0x20
	negs r1, r7
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	negs r2, r0
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #0
	bl BG_SetPosition
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08021D9C: .4byte gUnknown_0859B4D0
_08021DA0: .4byte gUnknown_0202BCB0

	THUMB_FUNC_END sub_8021D34

	THUMB_FUNC_START sub_8021DA4
sub_8021DA4: @ 0x08021DA4
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #4
	mov r8, r0
	adds r5, r1, #0
	adds r6, r2, #0
	lsls r4, r3, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _08021DF4  @ gUnknown_0859B4D0
	mov r1, r8
	bl Proc_Start
	adds r3, r0, #0
	lsls r4, r4, #0x18
	asrs r4, r4, #0x18
	adds r0, #0x64
	strh r4, [r0]
	negs r5, r5
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	negs r6, r6
	lsls r6, r6, #0x10
	lsrs r6, r6, #0x10
	movs r0, #0
	adds r1, r5, #0
	adds r2, r6, #0
	str r3, [sp]
	bl BG_SetPosition
	ldr r3, [sp]
	adds r3, #0x66
	movs r0, #1
	strh r0, [r3]
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08021DF4: .4byte gUnknown_0859B4D0

	THUMB_FUNC_END sub_8021DA4

	THUMB_FUNC_START sub_8021DF8
sub_8021DF8: @ 0x08021DF8
	push {lr}
	ldr r0, _08021E0C  @ gUnknown_0859B4D0
	bl Proc_Find
	cmp r0, #0
	beq _08021E06
	movs r0, #1
_08021E06:
	pop {r1}
	bx r1
	.align 2, 0
_08021E0C: .4byte gUnknown_0859B4D0

	THUMB_FUNC_END sub_8021DF8

.align 2, 0 @ align with 0
