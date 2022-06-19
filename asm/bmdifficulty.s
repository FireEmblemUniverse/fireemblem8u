	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	@ Difficulty mode stuff and also tower/ruins stuff
	@ May have been separate files

	THUMB_FUNC_START sub_8038EF0
sub_8038EF0: @ 0x08038EF0
	push {lr}
	sub sp, #4
	bl sub_80AB77C
	bl EndGreenTextColorManager
	ldr r0, _08038F5C  @ gBG0TilemapBuffer
	movs r1, #0
	bl BG_Fill
	ldr r0, _08038F60  @ gBG1TilemapBuffer
	movs r1, #0
	bl BG_Fill
	ldr r0, _08038F64  @ gBG2TilemapBuffer
	movs r1, #0
	bl BG_Fill
	ldr r0, _08038F68  @ gBG3TilemapBuffer
	movs r1, #0
	bl BG_Fill
	movs r0, #0xf
	bl BG_EnableSyncByMask
	ldr r2, _08038F6C  @ gLCDControlBuffer
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
	bl Font_InitForUIDefault
	movs r0, #0
	str r0, [sp]
	ldr r1, _08038F70  @ gPaletteBuffer
	ldr r2, _08038F74  @ 0x01000100
	mov r0, sp
	bl CpuFastSet
	bl EnablePaletteSync
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_08038F5C: .4byte gBG0TilemapBuffer
_08038F60: .4byte gBG1TilemapBuffer
_08038F64: .4byte gBG2TilemapBuffer
_08038F68: .4byte gBG3TilemapBuffer
_08038F6C: .4byte gLCDControlBuffer
_08038F70: .4byte gPaletteBuffer
_08038F74: .4byte 0x01000100

	THUMB_FUNC_END sub_8038EF0

	THUMB_FUNC_START sub_8038F78
sub_8038F78: @ 0x08038F78
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	adds r5, r0, #0
	movs r0, #0
	bl GetBackgroundTileDataOffset
	str r0, [sp, #8]
	ldr r0, _08038FC4  @ 0x01000008
	mov sl, r0
	ldr r7, _08038FC8  @ 0x06012400
	ldr r6, _08038FCC  @ 0x06012000
	movs r1, #0
	mov r9, r1
	movs r0, #7
	mov r8, r0
_08038F9E:
	ldrh r0, [r5]
	ldr r1, _08038FD0  @ 0x0000FFFF
	cmp r0, r1
	bne _08038FD4
	mov r0, r9
	str r0, [sp]
	mov r0, sp
	adds r1, r6, #0
	mov r2, sl
	bl CpuFastSet
	mov r1, r9
	str r1, [sp, #4]
	add r0, sp, #4
	adds r1, r7, #0
	mov r2, sl
	bl CpuFastSet
	b _08038FFA
	.align 2, 0
_08038FC4: .4byte 0x01000008
_08038FC8: .4byte 0x06012400
_08038FCC: .4byte 0x06012000
_08038FD0: .4byte 0x0000FFFF
_08038FD4:
	ldrh r4, [r5]
	lsls r4, r4, #6
	movs r0, #0xc0
	lsls r0, r0, #0x13
	adds r4, r4, r0
	ldr r1, [sp, #8]
	adds r4, r1, r4
	adds r4, #0x20
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #8
	bl CpuFastSet
	adds r4, #0x20
	adds r0, r4, #0
	adds r1, r7, #0
	movs r2, #8
	bl CpuFastSet
_08038FFA:
	adds r5, #8
	adds r7, #0x20
	adds r6, #0x20
	movs r0, #1
	negs r0, r0
	add r8, r0
	mov r1, r8
	cmp r1, #0
	bge _08038F9E
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8038F78

	THUMB_FUNC_START sub_803901C
sub_803901C: @ 0x0803901C
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	mov r9, r0
	ldr r0, [r0, #0x2c]
	lsls r0, r0, #6
	ldr r1, _080390B8  @ gUnknown_020038C8
	adds r0, r0, r1
	bl sub_8038F78
	ldr r1, _080390BC  @ gUnknown_02003BE8
	movs r2, #0
	movs r0, #2
	strh r0, [r1]
	ldr r0, _080390C0  @ gUnknown_02003B88
	str r0, [r1, #4]
	ldr r3, _080390C4  @ gUnknown_02003BA8
	str r3, [r1, #8]
	str r2, [r1, #0xc]
	str r2, [r1, #0x10]
	ldr r2, _080390C8  @ gUnknown_0859E7C8
	ldr r0, _080390CC  @ gUnknown_0859E7D4
	movs r4, #6
	mov r8, r4
	mov r4, r8
	strh r4, [r1, #2]
	movs r7, #0
	adds r6, r0, #0
	adds r5, r3, #0
_0803905A:
	lsls r4, r7, #1
	ldrh r1, [r2]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r1, r0, #4
	subs r1, r1, r0
	movs r0, #0x80
	lsls r0, r0, #5
	str r2, [sp]
	bl DivArm
	ldr r1, _080390C0  @ gUnknown_02003B88
	adds r4, r4, r1
	strh r0, [r4]
	ldr r0, [r6]
	lsls r0, r0, #4
	str r0, [r5]
	ldr r0, [r6, #4]
	lsls r0, r0, #4
	str r0, [r5, #4]
	adds r6, #8
	adds r5, #8
	ldr r2, [sp]
	adds r2, #2
	adds r7, #1
	cmp r7, r8
	blt _0803905A
	movs r0, #0
	mov r1, r9
	str r0, [r1, #0x34]
	ldr r0, _080390D0  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080390A8
	movs r0, #0x80
	bl m4aSongNumStart
_080390A8:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080390B8: .4byte gUnknown_020038C8
_080390BC: .4byte gUnknown_02003BE8
_080390C0: .4byte gUnknown_02003B88
_080390C4: .4byte gUnknown_02003BA8
_080390C8: .4byte gUnknown_0859E7C8
_080390CC: .4byte gUnknown_0859E7D4
_080390D0: .4byte gRAMChapterData

	THUMB_FUNC_END sub_803901C

	THUMB_FUNC_START sub_80390D4
sub_80390D4: @ 0x080390D4
	push {r4, r5, lr}
	sub sp, #0x10
	adds r5, r0, #0
	ldr r0, [r5, #0x34]
	adds r1, r0, #1
	str r1, [r5, #0x34]
	cmp r1, #0x2c
	bgt _08039130
	ldr r0, _08039120  @ gUnknown_02003BE8
	lsls r1, r1, #0xc
	add r2, sp, #8
	bl sub_800A950
	ldr r1, [sp, #8]
	asrs r1, r1, #4
	ldr r0, _08039124  @ gUnknown_080D7FD0
	ldr r3, [r5, #0x2c]
	lsls r3, r3, #3
	adds r3, r3, r0
	ldrb r0, [r3]
	lsls r0, r0, #3
	adds r1, r1, r0
	ldr r2, [sp, #0xc]
	asrs r2, r2, #4
	ldrb r0, [r3, #1]
	lsls r0, r0, #3
	adds r2, r2, r0
	ldr r0, _08039128  @ 0x000001FF
	ands r2, r0
	ldr r3, _0803912C  @ gUnknown_0859E79C
	movs r0, #0xa0
	lsls r0, r0, #7
	str r0, [sp]
	movs r0, #4
	bl PutSpriteExt
	b _080391BA
	.align 2, 0
_08039120: .4byte gUnknown_02003BE8
_08039124: .4byte gUnknown_080D7FD0
_08039128: .4byte 0x000001FF
_0803912C: .4byte gUnknown_0859E79C
_08039130:
	ldr r4, [r5, #0x2c]
	cmp r4, #4
	bne _08039164
	ldr r0, _0803915C  @ gUnknown_02003B08
	ldr r1, [r5, #0x30]
	ldr r3, _08039160  @ gUnknown_080D7FD0
	adds r2, r3, #0
	adds r2, #0x44
	ldrb r2, [r2]
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	adds r3, #0x45
	ldrb r3, [r3]
	lsls r3, r3, #0x18
	asrs r3, r3, #0x18
	str r4, [sp]
	movs r4, #1
	str r4, [sp, #4]
	bl sub_8038900
	b _0803919C
	.align 2, 0
_0803915C: .4byte gUnknown_02003B08
_08039160: .4byte gUnknown_080D7FD0
_08039164:
	lsls r0, r4, #6
	ldr r2, _080391C4  @ gUnknown_080D7FD0
	lsls r1, r4, #3
	adds r4, r1, r2
	adds r1, r4, #0
	adds r1, #0x28
	ldrb r2, [r1]
	movs r1, #8
	subs r1, r1, r2
	lsls r1, r1, #3
	ldr r3, _080391C8  @ gUnknown_02003A08
	adds r1, r1, r3
	adds r0, r0, r1
	ldrh r1, [r5, #0x30]
	adds r3, r4, #0
	adds r3, #0x24
	ldrb r3, [r3]
	lsls r3, r3, #0x18
	asrs r3, r3, #0x18
	adds r4, #0x25
	ldrb r4, [r4]
	lsls r4, r4, #0x18
	asrs r4, r4, #0x18
	str r4, [sp]
	movs r4, #4
	str r4, [sp, #4]
	bl sub_8038588
_0803919C:
	ldr r0, _080391CC  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080391AE
	movs r0, #0x76
	bl m4aSongNumStart
_080391AE:
	movs r0, #1
	bl BG_EnableSyncByMask
	adds r0, r5, #0
	bl Proc_Break
_080391BA:
	add sp, #0x10
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080391C4: .4byte gUnknown_080D7FD0
_080391C8: .4byte gUnknown_02003A08
_080391CC: .4byte gRAMChapterData

	THUMB_FUNC_END sub_80390D4

	THUMB_FUNC_START sub_80391D0
sub_80391D0: @ 0x080391D0
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r1, r2, #0
	cmp r1, #0
	beq _080391E8
	ldr r0, _080391E4  @ gUnknown_0859E804
	bl Proc_StartBlocking
	b _080391F0
	.align 2, 0
_080391E4: .4byte gUnknown_0859E804
_080391E8:
	ldr r0, _080391FC  @ gUnknown_0859E804
	movs r1, #3
	bl Proc_Start
_080391F0:
	str r4, [r0, #0x2c]
	str r5, [r0, #0x30]
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080391FC: .4byte gUnknown_0859E804

	THUMB_FUNC_END sub_80391D0

	THUMB_FUNC_START sub_8039200
sub_8039200: @ 0x08039200
	push {r4, r5, lr}
	sub sp, #0xc
	adds r5, r0, #0
	ldr r0, _08039238  @ gUnknown_030017A0
	ldr r2, _0803923C  @ 0x04000003
	mov r1, sp
	bl CpuSet
	bl GetGameClock
	adds r4, r0, #0
	ldr r0, _08039240  @ gUnknown_020038C4
	ldr r0, [r0]
	bl SetGameClock
	mov r0, sp
	bl sub_8037EB0
	adds r0, r4, #0
	bl SetGameClock
	cmp r5, #4
	bhi _08039292
	lsls r0, r5, #2
	ldr r1, _08039244  @ _08039248
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08039238: .4byte gUnknown_030017A0
_0803923C: .4byte 0x04000003
_08039240: .4byte gUnknown_020038C4
_08039244: .4byte _08039248
_08039248: @ jump table
	.4byte _0803925C @ case 0
	.4byte _0803926E @ case 1
	.4byte _08039274 @ case 2
	.4byte _0803927A @ case 3
	.4byte _0803928A @ case 4
_0803925C:
	mov r0, sp
	ldrh r2, [r0, #6]
	lsrs r2, r2, #3
	ldrb r0, [r0, #8]
	movs r1, #7
	ands r0, r1
	lsls r0, r0, #0xd
	orrs r0, r2
	b _08039294
_0803926E:
	mov r0, sp
	ldrh r0, [r0]
	b _08039294
_08039274:
	mov r0, sp
	ldrb r0, [r0, #2]
	b _08039294
_0803927A:
	mov r0, sp
	ldrb r2, [r0, #3]
	ldrb r0, [r0, #4]
	movs r1, #1
	ands r0, r1
	lsls r0, r0, #8
	orrs r0, r2
	b _08039294
_0803928A:
	ldr r0, [sp, #4]
	lsls r0, r0, #0xd
	lsrs r0, r0, #0xe
	b _08039294
_08039292:
	movs r0, #0
_08039294:
	add sp, #0xc
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8039200

	THUMB_FUNC_START sub_803929C
sub_803929C: @ 0x0803929C
	push {lr}
	cmp r0, #4
	bhi _08039358
	lsls r0, r0, #2
	ldr r1, _080392AC  @ _080392B0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080392AC: .4byte _080392B0
_080392B0: @ jump table
	.4byte _080392C4 @ case 0
	.4byte _080392E8 @ case 1
	.4byte _08039300 @ case 2
	.4byte _08039318 @ case 3
	.4byte _0803933C @ case 4
_080392C4:
	ldr r2, _080392E4  @ gUnknown_030017A0
	adds r0, r2, #0
	adds r0, #0x24
	ldrb r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrh r2, [r0, #0x12]
	lsrs r2, r2, #3
	ldrb r0, [r0, #0x14]
	movs r1, #7
	ands r0, r1
	lsls r0, r0, #0xd
	orrs r0, r2
	b _0803935A
	.align 2, 0
_080392E4: .4byte gUnknown_030017A0
_080392E8:
	ldr r2, _080392FC  @ gUnknown_030017A0
	adds r0, r2, #0
	adds r0, #0x24
	ldrb r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrh r0, [r0, #0xc]
	b _0803935A
	.align 2, 0
_080392FC: .4byte gUnknown_030017A0
_08039300:
	ldr r2, _08039314  @ gUnknown_030017A0
	adds r0, r2, #0
	adds r0, #0x24
	ldrb r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r0, [r0, #0xe]
	b _0803935A
	.align 2, 0
_08039314: .4byte gUnknown_030017A0
_08039318:
	ldr r2, _08039338  @ gUnknown_030017A0
	adds r0, r2, #0
	adds r0, #0x24
	ldrb r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r2, [r0, #0xf]
	ldrb r0, [r0, #0x10]
	movs r1, #1
	ands r0, r1
	lsls r0, r0, #8
	orrs r0, r2
	b _0803935A
	.align 2, 0
_08039338: .4byte gUnknown_030017A0
_0803933C:
	ldr r2, _08039354  @ gUnknown_030017A0
	adds r0, r2, #0
	adds r0, #0x24
	ldrb r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r0, [r0, #0x10]
	lsls r0, r0, #0xd
	lsrs r0, r0, #0xe
	b _0803935A
	.align 2, 0
_08039354: .4byte gUnknown_030017A0
_08039358:
	movs r0, #0
_0803935A:
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_803929C

	THUMB_FUNC_START sub_8039360
sub_8039360: @ 0x08039360
	push {r4, r5, r6, lr}
	sub sp, #0xc
	adds r6, r0, #0
	ldr r4, _080393AC  @ gUnknown_030017A0
	ldr r2, _080393B0  @ 0x04000003
	adds r0, r4, #0
	mov r1, sp
	bl CpuSet
	bl GetGameClock
	adds r5, r0, #0
	ldr r0, _080393B4  @ gUnknown_020038C4
	ldr r0, [r0]
	bl SetGameClock
	mov r0, sp
	bl sub_8037EB0
	adds r0, r5, #0
	bl SetGameClock
	adds r0, r4, #0
	adds r0, #0x24
	ldrb r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r4, #0xc
	adds r4, r0, r4
	cmp r6, #4
	bhi _08039432
	lsls r0, r6, #2
	ldr r1, _080393B8  @ _080393BC
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080393AC: .4byte gUnknown_030017A0
_080393B0: .4byte 0x04000003
_080393B4: .4byte gUnknown_020038C4
_080393B8: .4byte _080393BC
_080393BC: @ jump table
	.4byte _080393DA @ case 0
	.4byte _080393D0 @ case 1
	.4byte _080393DE @ case 2
	.4byte _080393F4 @ case 3
	.4byte _08039418 @ case 4
_080393D0:
	mov r0, sp
	ldrh r0, [r0]
	ldrh r4, [r4]
	cmp r0, r4
	bls _08039432
_080393DA:
	movs r0, #1
	b _08039434
_080393DE:
	ldrh r0, [r4, #8]
	lsls r0, r0, #0x16
	lsrs r0, r0, #0x19
	cmp r0, #0
	ble _080393DA
	mov r0, sp
	ldrb r0, [r0, #2]
	ldrb r4, [r4, #2]
	cmp r0, r4
	bcs _08039432
	b _080393DA
_080393F4:
	ldrh r0, [r4, #8]
	lsls r0, r0, #0x16
	lsrs r0, r0, #0x19
	cmp r0, #0
	ble _080393DA
	mov r0, sp
	ldrb r3, [r0, #3]
	ldrb r1, [r0, #4]
	movs r2, #1
	ands r1, r2
	lsls r1, r1, #8
	orrs r1, r3
	ldrb r3, [r4, #3]
	ldrb r0, [r4, #4]
	ands r0, r2
	lsls r0, r0, #8
	orrs r0, r3
	b _0803942E
_08039418:
	ldrh r0, [r4, #8]
	lsls r0, r0, #0x16
	lsrs r0, r0, #0x19
	cmp r0, #0
	ble _080393DA
	ldr r1, [sp, #4]
	lsls r1, r1, #0xd
	lsrs r1, r1, #0xe
	ldr r0, [r4, #4]
	lsls r0, r0, #0xd
	lsrs r0, r0, #0xe
_0803942E:
	cmp r1, r0
	blt _080393DA
_08039432:
	movs r0, #0
_08039434:
	add sp, #0xc
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8039360

	THUMB_FUNC_START sub_803943C
sub_803943C: @ 0x0803943C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08039478  @ gUnknown_02003B48
	bl sub_8038F78
	ldr r1, _0803947C  @ gUnknown_02003BE8
	movs r2, #0
	movs r0, #2
	strh r0, [r1]
	movs r0, #5
	strh r0, [r1, #2]
	ldr r0, _08039480  @ gUnknown_0859E82C
	str r0, [r1, #4]
	ldr r0, _08039484  @ gUnknown_0859E838
	str r0, [r1, #8]
	str r2, [r1, #0xc]
	str r2, [r1, #0x10]
	str r2, [r4, #0x38]
	ldr r0, _08039488  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08039472
	movs r0, #0x80
	bl m4aSongNumStart
_08039472:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08039478: .4byte gUnknown_02003B48
_0803947C: .4byte gUnknown_02003BE8
_08039480: .4byte gUnknown_0859E82C
_08039484: .4byte gUnknown_0859E838
_08039488: .4byte gRAMChapterData

	THUMB_FUNC_END sub_803943C

	THUMB_FUNC_START sub_803948C
sub_803948C: @ 0x0803948C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080394A4  @ gUnknown_02003B48
	movs r1, #8
	bl sub_8038668
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080394A4: .4byte gUnknown_02003B48

	THUMB_FUNC_END sub_803948C

	THUMB_FUNC_START sub_80394A8
sub_80394A8: @ 0x080394A8
	push {r4, r5, lr}
	sub sp, #0x1c
	adds r4, r0, #0
	ldr r0, [r4, #0x38]
	adds r1, r0, #1
	str r1, [r4, #0x38]
	cmp r1, #0x1d
	bgt _080394E8
	ldr r0, _080394E0  @ gUnknown_02003BE8
	lsls r1, r1, #0xc
	add r4, sp, #0x14
	adds r2, r4, #0
	bl sub_800A950
	ldr r1, [sp, #0x14]
	asrs r1, r1, #4
	ldr r2, [r4, #4]
	lsls r2, r2, #0x13
	lsrs r2, r2, #0x17
	ldr r3, _080394E4  @ gUnknown_0859E79C
	movs r0, #0xa0
	lsls r0, r0, #7
	str r0, [sp]
	movs r0, #4
	bl PutSpriteExt
	b _0803953E
	.align 2, 0
_080394E0: .4byte gUnknown_02003BE8
_080394E4: .4byte gUnknown_0859E79C
_080394E8:
	ldr r2, _08039548  @ gUnknown_030017A0
	adds r0, r2, #0
	adds r0, #0x24
	ldrb r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	add r1, sp, #8
	adds r0, #0xc
	ldm r0!, {r2, r3, r5}
	stm r1!, {r2, r3, r5}
	add r0, sp, #8
	ldrh r0, [r0, #8]
	lsls r0, r0, #0x16
	lsrs r1, r0, #0x19
	cmp r1, #0x63
	bgt _0803950E
	adds r1, #1
_0803950E:
	ldr r0, _0803954C  @ gUnknown_02003B70
	movs r2, #7
	str r2, [sp]
	movs r2, #2
	str r2, [sp, #4]
	movs r2, #3
	movs r3, #0x1a
	bl sub_8038588
	movs r0, #1
	bl BG_EnableSyncByMask
	ldr r0, _08039550  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08039538
	movs r0, #0x76
	bl m4aSongNumStart
_08039538:
	adds r0, r4, #0
	bl Proc_Break
_0803953E:
	add sp, #0x1c
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08039548: .4byte gUnknown_030017A0
_0803954C: .4byte gUnknown_02003B70
_08039550: .4byte gRAMChapterData

	THUMB_FUNC_END sub_80394A8

	THUMB_FUNC_START sub_8039554
sub_8039554: @ 0x08039554
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0
	bl sub_803929C
	str r0, [r4, #0x30]
	movs r0, #0
	bl sub_8039200
	ldr r1, [r4, #0x30]
	adds r0, r0, r1
	str r0, [r4, #0x34]
	movs r0, #2
	str r0, [r4, #0x3c]
	ldr r0, _08039588  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08039582
	movs r0, #0x74
	bl m4aSongNumStart
_08039582:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08039588: .4byte gRAMChapterData

	THUMB_FUNC_END sub_8039554

	THUMB_FUNC_START sub_803958C
sub_803958C: @ 0x0803958C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	adds r7, r0, #0
	ldr r0, [r7, #0x30]
	adds r1, r0, #1
	str r1, [r7, #0x30]
	ldr r0, [r7, #0x34]
	subs r0, r0, r1
	cmp r0, #0x64
	ble _080395A8
	adds r0, r1, #1
	str r0, [r7, #0x30]
_080395A8:
	ldr r0, _08039630  @ gUnknown_080D7FD0
	mov r8, r0
	adds r0, #0x28
	ldrb r2, [r0]
	movs r5, #8
	subs r0, r5, r2
	lsls r0, r0, #3
	ldr r6, _08039634  @ gUnknown_02003A08
	adds r0, r0, r6
	ldrh r1, [r7, #0x30]
	mov r3, r8
	adds r3, #0x24
	ldrb r3, [r3]
	lsls r3, r3, #0x18
	asrs r3, r3, #0x18
	mov r4, r8
	adds r4, #0x25
	ldrb r4, [r4]
	lsls r4, r4, #0x18
	asrs r4, r4, #0x18
	str r4, [sp]
	movs r4, #2
	str r4, [sp, #4]
	bl sub_8038588
	mov r0, r8
	ldrb r2, [r0, #4]
	subs r5, r5, r2
	lsls r5, r5, #3
	ldr r0, _08039638  @ 0xFFFFFEC0
	adds r6, r6, r0
	adds r5, r5, r6
	ldr r1, [r7, #0x34]
	ldr r0, [r7, #0x30]
	subs r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov r6, r8
	movs r3, #0
	ldrsb r3, [r6, r3]
	movs r0, #1
	ldrsb r0, [r6, r0]
	str r0, [sp]
	str r4, [sp, #4]
	adds r0, r5, #0
	bl sub_8038588
	movs r0, #1
	bl BG_EnableSyncByMask
	ldr r0, [r7, #0x3c]
	cmp r0, #0
	ble _08039616
	subs r0, #1
	str r0, [r7, #0x3c]
_08039616:
	ldr r1, [r7, #0x30]
	ldr r0, [r7, #0x34]
	cmp r1, r0
	blt _08039624
	adds r0, r7, #0
	bl Proc_Break
_08039624:
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08039630: .4byte gUnknown_080D7FD0
_08039634: .4byte gUnknown_02003A08
_08039638: .4byte 0xFFFFFEC0

	THUMB_FUNC_END sub_803958C

	THUMB_FUNC_START sub_803963C
sub_803963C: @ 0x0803963C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x3c]
	cmp r0, #0
	bgt _08039654
	movs r0, #0x74
	bl m4aSongNumStop
	adds r0, r4, #0
	bl Proc_Break
	b _08039658
_08039654:
	subs r0, #1
	str r0, [r4, #0x3c]
_08039658:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_803963C

	THUMB_FUNC_START sub_8039660
sub_8039660: @ 0x08039660
	movs r1, #1
	str r1, [r0, #0x2c]
	bx lr

	THUMB_FUNC_END sub_8039660

	THUMB_FUNC_START sub_8039668
sub_8039668: @ 0x08039668
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x2c]
	bl sub_8039360
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803968A
	ldr r4, [r5, #0x2c]
	adds r0, r4, #0
	bl sub_8039200
	adds r1, r0, #0
	adds r0, r4, #0
	adds r2, r5, #0
	bl sub_80391D0
_0803968A:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8039668

	THUMB_FUNC_START sub_8039690
sub_8039690: @ 0x08039690
	push {lr}
	adds r1, r0, #0
	ldr r0, [r1, #0x2c]
	adds r0, #1
	str r0, [r1, #0x2c]
	cmp r0, #4
	bgt _080396A6
	adds r0, r1, #0
	movs r1, #1
	bl Proc_Goto
_080396A6:
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8039690

.align 2, 0
