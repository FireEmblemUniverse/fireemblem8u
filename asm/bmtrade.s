	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	@ Map Trade Menu Proc & Friends

	THUMB_FUNC_START sub_802D2E0
sub_802D2E0: @ 0x0802D2E0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	mov r8, r0
	movs r1, #0x90
	lsls r1, r1, #7
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x80
	lsls r0, r0, #3
	str r0, [sp]
	mov r0, r8
	str r0, [sp, #4]
	movs r0, #6
	movs r2, #8
	bl sub_80ADB7C
	movs r1, #0x28
	negs r1, r1
	movs r4, #1
	negs r4, r4
	movs r0, #0
	adds r2, r4, #0
	movs r3, #1
	bl sub_80ADBFC
	movs r0, #1
	movs r1, #0xb8
	adds r2, r4, #0
	movs r3, #0
	bl sub_80ADBFC
	movs r0, #1
	movs r1, #0xc
	movs r2, #6
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	movs r0, #0
	str r0, [sp]
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl sub_8001ED0
	movs r0, #1
	str r0, [sp]
	movs r1, #1
	movs r2, #1
	movs r3, #1
	bl sub_8001F0C
	mov r1, r8
	ldr r0, [r1, #0x2c]
	ldr r0, [r0]
	ldrh r0, [r0]
	bl GetStringFromIndex
	adds r7, r0, #0
	bl GetStringTextWidth
	movs r4, #0x30
	subs r0, r4, r0
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r3, r0, #1
	ldr r5, _0802D3B4  @ gBG0TilemapBuffer
	movs r6, #6
	str r6, [sp]
	str r7, [sp, #4]
	movs r0, #0
	adds r1, r5, #0
	movs r2, #0
	bl DrawTextInline
	mov r1, r8
	ldr r0, [r1, #0x30]
	ldr r0, [r0]
	ldrh r0, [r0]
	bl GetStringFromIndex
	adds r7, r0, #0
	bl GetStringTextWidth
	subs r4, r4, r0
	lsrs r0, r4, #0x1f
	adds r4, r4, r0
	asrs r3, r4, #1
	adds r5, #0x30
	str r6, [sp]
	str r7, [sp, #4]
	movs r0, #0
	adds r1, r5, #0
	movs r2, #0
	bl DrawTextInline
	movs r0, #1
	bl BG_EnableSyncByMask
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802D3B4: .4byte gBG0TilemapBuffer

	THUMB_FUNC_START sub_802D3B8
sub_802D3B8: @ 0x0802D3B8
	adds r0, #0x41
	movs r1, #0xff
	strb r1, [r0]
	bx lr

	THUMB_FUNC_START sub_802D3C0
sub_802D3C0: @ 0x0802D3C0
	push {r4, r5, r6, r7, lr}
	adds r3, r0, #0
	ldr r4, [r3, #0x14]
	ldr r0, [r3, #0x40]
	ldr r2, _0802D430  @ 0x00FFFF00
	ands r0, r2
	ldr r1, [r4, #0x40]
	ands r1, r2
	cmp r0, r1
	beq _0802D42A
	adds r5, r3, #0
	adds r5, #0x41
	ldrb r0, [r5]
	adds r7, r3, #0
	adds r7, #0x42
	cmp r0, #0xff
	beq _0802D3FE
	ldr r2, _0802D434  @ gUnknown_0859BADC
	lsls r1, r0, #2
	adds r1, r1, r0
	ldrb r0, [r7]
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	movs r2, #0
	ldrsh r0, [r1, r2]
	movs r2, #2
	ldrsh r1, [r1, r2]
	movs r2, #0xc
	bl sub_804E90C
_0802D3FE:
	ldr r2, _0802D434  @ gUnknown_0859BADC
	adds r6, r4, #0
	adds r6, #0x42
	adds r4, #0x41
	ldrb r0, [r4]
	lsls r1, r0, #2
	adds r1, r1, r0
	ldrb r0, [r6]
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	movs r2, #0
	ldrsh r0, [r1, r2]
	movs r2, #2
	ldrsh r1, [r1, r2]
	movs r2, #0xc
	bl sub_804E8A8
	ldrb r0, [r4]
	strb r0, [r5]
	ldrb r0, [r6]
	strb r0, [r7]
_0802D42A:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802D430: .4byte 0x00FFFF00
_0802D434: .4byte gUnknown_0859BADC

	THUMB_FUNC_START sub_802D438
sub_802D438: @ 0x0802D438
	push {r4, lr}
	adds r3, r2, #0
	lsls r2, r1, #1
	adds r2, r2, r1
	lsls r4, r2, #1
	adds r1, r3, r4
	adds r2, r0, #0
	adds r2, #0x34
	adds r1, r2, r1
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bne _0802D46A
	cmp r3, #0
	blt _0802D46A
	adds r0, r4, r2
	adds r1, r3, r0
_0802D45A:
	subs r1, #1
	subs r3, #1
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bne _0802D46A
	cmp r3, #0
	bge _0802D45A
_0802D46A:
	adds r0, r3, #0
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_START sub_802D474
sub_802D474: @ 0x0802D474
	push {r4, r5, r6, r7, lr}
	movs r1, #0
	ldr r7, _0802D4A4  @ gUnknown_0200278C
_0802D47A:
	movs r5, #0
	lsls r0, r1, #2
	adds r6, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r4, r7, r0
_0802D486:
	adds r0, r4, #0
	movs r1, #7
	bl Text_Allocate
	adds r4, #8
	adds r5, #1
	cmp r5, #4
	ble _0802D486
	adds r1, r6, #0
	cmp r1, #1
	ble _0802D47A
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802D4A4: .4byte gUnknown_0200278C

	THUMB_FUNC_START sub_802D4A8
sub_802D4A8: @ 0x0802D4A8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	adds r5, r0, #0
	ldr r1, _0802D574  @ gUnknown_080D7C40
	mov r0, sp
	movs r2, #2
	bl memcpy
	add r4, sp, #4
	ldr r1, _0802D578  @ gUnknown_080D7C42
	adds r0, r4, #0
	movs r2, #2
	bl memcpy
	movs r0, #0
	str r0, [sp, #8]
	add r0, sp, #8
	ldr r1, _0802D57C  @ gUnknown_02022EE8
	ldr r2, _0802D580  @ 0x010000B0
	bl CpuFastSet
	movs r0, #0
	mov r8, r0
	adds r5, #0x2c
	str r5, [sp, #0xc]
_0802D4E2:
	movs r7, #0
	mov r1, r8
	lsls r0, r1, #2
	adds r1, #1
	str r1, [sp, #0x10]
	ldr r1, [sp, #0xc]
	adds r1, r1, r0
	mov r9, r1
	add r0, r8
	lsls r0, r0, #3
	mov sl, r0
_0802D4F8:
	mov r1, r9
	ldr r0, [r1]
	lsls r4, r7, #1
	adds r0, #0x1e
	adds r0, r0, r4
	ldrh r5, [r0]
	lsls r0, r7, #3
	ldr r1, _0802D584  @ gUnknown_0200278C
	adds r0, r0, r1
	mov r1, sl
	adds r6, r1, r0
	adds r0, r6, #0
	bl Text_Clear
	cmp r5, #0
	beq _0802D54E
	mov r1, r9
	ldr r0, [r1]
	adds r1, r5, #0
	bl IsItemDisplayUsable
	adds r2, r0, #0
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	mov r0, sp
	add r0, r8
	adds r0, #4
	ldrb r3, [r0]
	adds r3, r3, r4
	adds r3, #1
	lsls r3, r3, #5
	adds r3, #1
	mov r0, sp
	add r0, r8
	ldrb r0, [r0]
	adds r3, r3, r0
	lsls r3, r3, #1
	ldr r0, _0802D588  @ gBG0TilemapBuffer
	adds r3, r3, r0
	adds r0, r6, #0
	adds r1, r5, #0
	bl DrawItemMenuLine
_0802D54E:
	adds r7, #1
	cmp r7, #4
	ble _0802D4F8
	ldr r0, [sp, #0x10]
	mov r8, r0
	cmp r0, #1
	ble _0802D4E2
	movs r0, #1
	bl BG_EnableSyncByMask
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802D574: .4byte gUnknown_080D7C40
_0802D578: .4byte gUnknown_080D7C42
_0802D57C: .4byte gUnknown_02022EE8
_0802D580: .4byte 0x010000B0
_0802D584: .4byte gUnknown_0200278C
_0802D588: .4byte gBG0TilemapBuffer

	THUMB_FUNC_START sub_802D58C
sub_802D58C: @ 0x0802D58C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	movs r2, #0
	adds r7, r0, #0
	adds r7, #0x2c
	adds r6, r0, #0
	adds r6, #0x34
	movs r1, #0x39
	adds r1, r1, r0
	mov r8, r1
	adds r0, #0x3f
	mov ip, r0
_0802D5A6:
	movs r3, #0
	lsls r1, r2, #2
	lsls r0, r2, #1
	adds r5, r2, #1
	adds r4, r7, r1
	adds r0, r0, r2
	lsls r0, r0, #1
	adds r2, r0, r6
_0802D5B6:
	ldr r0, [r4]
	lsls r1, r3, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r0, [r0]
	negs r0, r0
	lsrs r0, r0, #0x1f
	strb r0, [r2]
	adds r2, #1
	adds r3, #1
	cmp r3, #4
	ble _0802D5B6
	adds r2, r5, #0
	cmp r2, #1
	ble _0802D5A6
	movs r0, #0
	mov r1, r8
	strb r0, [r1]
	mov r1, ip
	strb r0, [r1]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_START sub_802D5E8
sub_802D5E8: @ 0x0802D5E8
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	movs r7, #0
	ldr r0, _0802D724  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _0802D634
	adds r6, r5, #0
	adds r6, #0x41
	ldrb r0, [r6]
	cmp r0, #1
	bne _0802D634
	adds r4, r5, #0
	adds r4, #0x42
	ldrb r2, [r4]
	adds r0, r5, #0
	movs r1, #0
	bl sub_802D438
	adds r1, r0, #0
	cmp r1, #0
	bge _0802D61C
	b _0802D71A
_0802D61C:
	strb r7, [r6]
	strb r1, [r4]
	movs r7, #1
	ldr r0, _0802D728  @ gUnknown_0202BCF0
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0802D634
	movs r0, #0x67
	bl m4aSongNumStart
_0802D634:
	ldr r0, _0802D724  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _0802D67A
	adds r6, r5, #0
	adds r6, #0x41
	ldrb r0, [r6]
	cmp r0, #0
	bne _0802D67A
	adds r4, r5, #0
	adds r4, #0x42
	ldrb r2, [r4]
	adds r0, r5, #0
	movs r1, #1
	bl sub_802D438
	adds r1, r0, #0
	cmp r1, #0
	blt _0802D71A
	movs r0, #1
	strb r0, [r6]
	strb r1, [r4]
	movs r7, #1
	ldr r0, _0802D728  @ gUnknown_0202BCF0
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0802D67A
	movs r0, #0x67
	bl m4aSongNumStart
_0802D67A:
	ldr r0, _0802D724  @ gKeyStatusPtr
	ldr r1, [r0]
	ldrh r2, [r1, #6]
	movs r0, #0x40
	ands r0, r2
	cmp r0, #0
	beq _0802D6C4
	adds r4, r5, #0
	adds r4, #0x42
	ldrb r0, [r4]
	cmp r0, #0
	bne _0802D6AA
	ldrh r1, [r1, #8]
	cmp r2, r1
	bne _0802D71A
	adds r0, r5, #0
	adds r0, #0x41
	ldrb r1, [r0]
	adds r0, r5, #0
	movs r2, #4
	bl sub_802D438
	adds r0, #1
	strb r0, [r4]
_0802D6AA:
	ldrb r0, [r4]
	subs r0, #1
	strb r0, [r4]
	movs r7, #1
	ldr r0, _0802D728  @ gUnknown_0202BCF0
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0802D6C4
	movs r0, #0x66
	bl m4aSongNumStart
_0802D6C4:
	ldr r0, _0802D724  @ gKeyStatusPtr
	ldr r4, [r0]
	ldrh r6, [r4, #6]
	movs r0, #0x80
	ands r0, r6
	cmp r0, #0
	beq _0802D71A
	adds r2, r5, #0
	adds r2, #0x42
	ldrb r3, [r2]
	adds r0, r5, #0
	adds r0, #0x41
	ldrb r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, #1
	adds r0, r3, r0
	adds r1, r5, #0
	adds r1, #0x34
	adds r1, r1, r0
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bne _0802D700
	ldrh r4, [r4, #8]
	cmp r6, r4
	bne _0802D71A
	movs r0, #0xff
	strb r0, [r2]
_0802D700:
	ldrb r0, [r2]
	adds r0, #1
	strb r0, [r2]
	movs r7, #1
	ldr r0, _0802D728  @ gUnknown_0202BCF0
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0802D71A
	movs r0, #0x66
	bl m4aSongNumStart
_0802D71A:
	adds r0, r7, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0802D724: .4byte gKeyStatusPtr
_0802D728: .4byte gUnknown_0202BCF0

	THUMB_FUNC_START sub_802D72C
sub_802D72C: @ 0x0802D72C
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x41
	ldrb r1, [r0]
	lsls r1, r1, #2
	adds r3, r4, #0
	adds r3, #0x2c
	adds r1, r3, r1
	adds r0, #1
	ldrb r0, [r0]
	lsls r0, r0, #1
	adds r0, #0x1e
	ldr r2, [r1]
	adds r2, r2, r0
	adds r0, r4, #0
	adds r0, #0x43
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r3, r3, r0
	adds r0, r4, #0
	adds r0, #0x44
	ldrb r0, [r0]
	lsls r0, r0, #1
	adds r0, #0x1e
	ldr r1, [r3]
	adds r1, r1, r0
	ldrh r3, [r2]
	ldrh r0, [r1]
	strh r0, [r2]
	strh r3, [r1]
	adds r1, r4, #0
	adds r1, #0x40
	movs r0, #1
	strb r0, [r1]
	ldr r1, _0802D790  @ gUnknown_0203A958
	movs r0, #0x1b
	strb r0, [r1, #0x11]
	ldr r0, [r4, #0x2c]
	bl RemoveUnitBlankItems
	ldr r0, [r4, #0x30]
	bl RemoveUnitBlankItems
	adds r0, r4, #0
	bl sub_802D4A8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802D790: .4byte gUnknown_0203A958

	THUMB_FUNC_START sub_802D794
sub_802D794: @ 0x0802D794
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	movs r4, #0
	str r4, [sp]
	movs r0, #1
	movs r1, #8
	movs r2, #0xe
	movs r3, #0xc
	bl MakeUIWindowTileMap_BG0BG1
	str r4, [sp]
	movs r0, #0xf
	movs r1, #8
	movs r2, #0xe
	movs r3, #0xc
	bl MakeUIWindowTileMap_BG0BG1
	bl sub_8003D20
	bl ResetIconGraphics
	movs r0, #4
	bl LoadIconPalettes
	adds r0, r5, #0
	bl sub_802D474
	adds r0, r5, #0
	bl sub_802D4A8
	ldr r0, [r5, #0x2c]
	bl GetUnitPortraitId
	adds r1, r0, #0
	subs r4, #4
	movs r0, #3
	str r0, [sp]
	movs r0, #0
	movs r2, #0x40
	adds r3, r4, #0
	bl NewFace
	ldr r0, [r5, #0x30]
	bl GetUnitPortraitId
	adds r1, r0, #0
	movs r0, #2
	str r0, [sp]
	movs r0, #1
	movs r2, #0xb0
	adds r3, r4, #0
	bl NewFace
	movs r0, #0
	movs r1, #5
	bl sub_8006458
	movs r0, #1
	movs r1, #5
	bl sub_8006458
	movs r0, #3
	bl BG_EnableSyncByMask
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_START sub_802D820
sub_802D820: @ 0x0802D820
	push {r4, lr}
	adds r4, r0, #0
	bl sub_802D58C
	adds r4, #0x45
	movs r0, #0
	strb r0, [r4]
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_START sub_802D834
sub_802D834: @ 0x0802D834
	push {r4, lr}
	adds r4, r0, #0
	bl sub_802DF08
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0802D870
	ldr r2, _0802D86C  @ gUnknown_0859BADC
	adds r3, r4, #0
	adds r3, #0x42
	adds r0, r4, #0
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r1, r0, #2
	adds r1, r1, r0
	ldrb r3, [r3]
	adds r1, r1, r3
	lsls r1, r1, #2
	adds r1, r1, r2
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #3
	movs r2, #2
	ldrsh r1, [r1, r2]
	lsls r1, r1, #3
	bl sub_804E79C
	b _0802D90E
	.align 2, 0
_0802D86C: .4byte gUnknown_0859BADC
_0802D870:
	adds r0, r4, #0
	bl sub_802D5E8
	ldr r2, _0802D8C8  @ gUnknown_0859BADC
	adds r3, r4, #0
	adds r3, #0x42
	adds r0, r4, #0
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r1, r0, #2
	adds r1, r1, r0
	ldrb r3, [r3]
	adds r1, r1, r3
	lsls r1, r1, #2
	adds r1, r1, r2
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #3
	movs r2, #2
	ldrsh r1, [r1, r2]
	lsls r1, r1, #3
	bl sub_804E79C
	ldr r0, _0802D8CC  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0802D8D4
	adds r0, r4, #0
	movs r1, #1
	bl Proc_GotoLabel
	ldr r0, _0802D8D0  @ gUnknown_0202BCF0
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0802D90E
	movs r0, #0x6a
	bl m4aSongNumStart
	b _0802D90E
	.align 2, 0
_0802D8C8: .4byte gUnknown_0859BADC
_0802D8CC: .4byte gKeyStatusPtr
_0802D8D0: .4byte gUnknown_0202BCF0
_0802D8D4:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0802D8FC
	adds r0, r4, #0
	movs r1, #2
	bl Proc_GotoLabel
	ldr r0, _0802D8F8  @ gUnknown_0202BCF0
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0802D90E
	movs r0, #0x6b
	bl m4aSongNumStart
	b _0802D90E
	.align 2, 0
_0802D8F8: .4byte gUnknown_0202BCF0
_0802D8FC:
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0802D90E
	ldr r0, _0802D914  @ gUnknown_0859BBD4
	adds r1, r4, #0
	bl Proc_CreateBlockingChild
_0802D90E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802D914: .4byte gUnknown_0859BBD4

	THUMB_FUNC_START sub_802D918
sub_802D918: @ 0x0802D918
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r4, #0
	adds r5, #0x41
	ldrb r0, [r5]
	adds r1, r4, #0
	adds r1, #0x43
	strb r0, [r1]
	adds r6, r4, #0
	adds r6, #0x42
	ldrb r1, [r6]
	adds r0, r4, #0
	adds r0, #0x44
	strb r1, [r0]
	ldrb r0, [r5]
	movs r1, #1
	eors r0, r1
	strb r0, [r5]
	ldrb r1, [r5]
	adds r0, r4, #0
	movs r2, #4
	bl sub_802D438
	cmp r0, #4
	beq _0802D978
	adds r0, #1
	strb r0, [r6]
	ldrb r1, [r5]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	ldrb r1, [r6]
	adds r0, r0, r1
	adds r1, r4, #0
	adds r1, #0x34
	adds r1, r1, r0
	movs r0, #1
	strb r0, [r1]
	adds r1, r4, #0
	adds r1, #0x45
	strb r0, [r1]
	ldrb r0, [r5]
	adds r1, #1
	strb r0, [r1]
	ldrb r1, [r6]
	adds r0, r4, #0
	adds r0, #0x47
	strb r1, [r0]
_0802D978:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_START sub_802D980
sub_802D980: @ 0x0802D980
	push {r4, r5, lr}
	adds r5, r0, #0
	bl sub_802DF08
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0802D9E4
	ldr r4, _0802D9E0  @ gUnknown_0859BADC
	adds r2, r5, #0
	adds r2, #0x42
	adds r0, r5, #0
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r1, r0, #2
	adds r1, r1, r0
	ldrb r2, [r2]
	adds r1, r1, r2
	lsls r1, r1, #2
	adds r1, r1, r4
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #3
	movs r2, #2
	ldrsh r1, [r1, r2]
	lsls r1, r1, #3
	bl sub_804E79C
	adds r2, r5, #0
	adds r2, #0x44
	adds r0, r5, #0
	adds r0, #0x43
	ldrb r0, [r0]
	lsls r1, r0, #2
	adds r1, r1, r0
	ldrb r2, [r2]
	adds r1, r1, r2
	lsls r1, r1, #2
	adds r1, r1, r4
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #3
	movs r2, #2
	ldrsh r1, [r1, r2]
	lsls r1, r1, #3
	bl sub_804E848
	b _0802DAA2
	.align 2, 0
_0802D9E0: .4byte gUnknown_0859BADC
_0802D9E4:
	adds r0, r5, #0
	bl sub_802D5E8
	ldr r4, _0802DA5C  @ gUnknown_0859BADC
	adds r2, r5, #0
	adds r2, #0x42
	adds r0, r5, #0
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r1, r0, #2
	adds r1, r1, r0
	ldrb r2, [r2]
	adds r1, r1, r2
	lsls r1, r1, #2
	adds r1, r1, r4
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #3
	movs r2, #2
	ldrsh r1, [r1, r2]
	lsls r1, r1, #3
	bl sub_804E79C
	adds r2, r5, #0
	adds r2, #0x44
	adds r0, r5, #0
	adds r0, #0x43
	ldrb r0, [r0]
	lsls r1, r0, #2
	adds r1, r1, r0
	ldrb r2, [r2]
	adds r1, r1, r2
	lsls r1, r1, #2
	adds r1, r1, r4
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #3
	movs r2, #2
	ldrsh r1, [r1, r2]
	lsls r1, r1, #3
	bl sub_804E848
	ldr r0, _0802DA60  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0802DA68
	adds r0, r5, #0
	bl sub_802D72C
	ldr r0, _0802DA64  @ gUnknown_0202BCF0
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0802DA82
	movs r0, #0x6a
	b _0802DA7E
	.align 2, 0
_0802DA5C: .4byte gUnknown_0859BADC
_0802DA60: .4byte gKeyStatusPtr
_0802DA64: .4byte gUnknown_0202BCF0
_0802DA68:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0802DA90
	ldr r0, _0802DA8C  @ gUnknown_0202BCF0
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0802DA82
	movs r0, #0x6b
_0802DA7E:
	bl m4aSongNumStart
_0802DA82:
	adds r0, r5, #0
	bl Proc_ClearNativeCallback
	b _0802DAA2
	.align 2, 0
_0802DA8C: .4byte gUnknown_0202BCF0
_0802DA90:
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0802DAA2
	ldr r0, _0802DAA8  @ gUnknown_0859BBD4
	adds r1, r5, #0
	bl Proc_CreateBlockingChild
_0802DAA2:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802DAA8: .4byte gUnknown_0859BBD4

	THUMB_FUNC_START sub_802DAAC
sub_802DAAC: @ 0x0802DAAC
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r0, #0x43
	ldrb r0, [r0]
	adds r5, r4, #0
	adds r5, #0x41
	strb r0, [r5]
	adds r0, r4, #0
	adds r0, #0x44
	ldrb r0, [r0]
	adds r6, r4, #0
	adds r6, #0x42
	strb r0, [r6]
	adds r0, r4, #0
	bl sub_802D58C
	ldrb r2, [r5]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #1
	adds r0, r4, #0
	adds r0, #0x34
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _0802DAEA
	movs r0, #1
	eors r2, r0
	strb r2, [r5]
_0802DAEA:
	ldrb r1, [r5]
	ldrb r2, [r6]
	adds r0, r4, #0
	bl sub_802D438
	strb r0, [r6]
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_START sub_802DAFC
sub_802DAFC: @ 0x0802DAFC
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, _0802DB3C  @ gUnknown_0202BCB0
	adds r5, r0, #0
	adds r5, #0x3f
	movs r0, #0
	ldrsb r0, [r5, r0]
	cmp r0, #0
	blt _0802DB40
	movs r1, #5
	bl __divsi3
	adds r1, r4, #0
	adds r1, #0x41
	strb r0, [r1]
	movs r0, #0
	ldrsb r0, [r5, r0]
	movs r1, #5
	bl __modsi3
	adds r1, r4, #0
	adds r1, #0x42
	strb r0, [r1]
	adds r0, r4, #0
	bl sub_802D58C
	adds r0, r4, #0
	movs r1, #1
	bl Proc_GotoLabel
	movs r0, #0
	b _0802DB42
	.align 2, 0
_0802DB3C: .4byte gUnknown_0202BCB0
_0802DB40:
	movs r0, #1
_0802DB42:
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_START sub_802DB48
sub_802DB48: @ 0x0802DB48
	push {lr}
	movs r0, #0
	bl DeleteFaceByIndex
	movs r0, #1
	bl DeleteFaceByIndex
	pop {r0}
	bx r0

	THUMB_FUNC_START sub_802DB5C
sub_802DB5C: @ 0x0802DB5C
	push {r4, r5, r6, lr}
	adds r2, r0, #0
	ldr r3, [r2, #0x14]
	adds r5, r3, #0
	adds r5, #0x41
	ldrb r1, [r5]
	lsls r1, r1, #2
	adds r0, r3, #0
	adds r0, #0x2c
	adds r0, r0, r1
	ldr r1, [r0]
	adds r4, r3, #0
	adds r4, #0x42
	ldrb r0, [r4]
	lsls r0, r0, #1
	adds r1, #0x1e
	adds r1, r1, r0
	ldrh r6, [r1]
	cmp r6, #0
	bne _0802DB8C
	adds r0, r2, #0
	bl Proc_Delete
	b _0802DBF0
_0802DB8C:
	adds r0, r3, #0
	adds r0, #0x45
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0802DBB8
	adds r2, r3, #0
	adds r2, #0x47
	adds r0, r3, #0
	adds r0, #0x46
	ldrb r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	ldrb r2, [r2]
	adds r0, r0, r2
	adds r1, r3, #0
	adds r1, #0x34
	adds r1, r1, r0
	movs r0, #0
	strb r0, [r1]
_0802DBB8:
	movs r1, #1
	negs r1, r1
	movs r0, #0
	bl LoadDialogueBoxGfx
	ldr r2, _0802DBF8  @ gUnknown_0859BADC
	ldrb r0, [r5]
	lsls r1, r0, #2
	adds r1, r1, r0
	ldrb r4, [r4]
	adds r1, r1, r4
	lsls r1, r1, #2
	adds r1, r1, r2
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #3
	movs r2, #2
	ldrsh r1, [r1, r2]
	lsls r1, r1, #3
	adds r2, r6, #0
	bl sub_8088E60
	ldr r0, _0802DBFC  @ gKeyStatusPtr
	ldr r2, [r0]
	ldrh r1, [r2, #8]
	ldr r0, _0802DC00  @ 0x0000FEFD
	ands r0, r1
	strh r0, [r2, #8]
_0802DBF0:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802DBF8: .4byte gUnknown_0859BADC
_0802DBFC: .4byte gKeyStatusPtr
_0802DC00: .4byte 0x0000FEFD

	THUMB_FUNC_START sub_802DC04
sub_802DC04: @ 0x0802DC04
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	mov r9, r0
	ldr r4, [r0, #0x14]
	adds r0, r4, #0
	bl sub_802D5E8
	movs r1, #0x41
	adds r1, r1, r4
	mov r8, r1
	ldrb r6, [r1]
	lsls r5, r6, #2
	adds r1, r4, #0
	adds r1, #0x2c
	adds r1, r1, r5
	ldr r1, [r1]
	adds r7, r4, #0
	adds r7, #0x42
	ldrb r3, [r7]
	lsls r2, r3, #1
	adds r1, #0x1e
	adds r1, r1, r2
	ldrh r2, [r1]
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0802DC56
	ldr r0, _0802DCD0  @ gUnknown_0859BADC
	adds r1, r5, r6
	adds r1, r1, r3
	lsls r1, r1, #2
	adds r1, r1, r0
	movs r3, #0
	ldrsh r0, [r1, r3]
	lsls r0, r0, #3
	movs r3, #2
	ldrsh r1, [r1, r3]
	lsls r1, r1, #3
	bl sub_8088E60
_0802DC56:
	ldr r0, _0802DCD4  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0x81
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0802DC6C
	mov r0, r9
	bl Proc_ClearNativeCallback
_0802DC6C:
	ldr r5, _0802DCD0  @ gUnknown_0859BADC
	mov r1, r8
	ldrb r0, [r1]
	lsls r1, r0, #2
	adds r1, r1, r0
	ldrb r7, [r7]
	adds r1, r1, r7
	lsls r1, r1, #2
	adds r1, r1, r5
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #3
	movs r3, #2
	ldrsh r1, [r1, r3]
	lsls r1, r1, #3
	bl sub_804E79C
	adds r0, r4, #0
	adds r0, #0x45
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0802DCC2
	adds r2, r4, #0
	adds r2, #0x44
	adds r0, r4, #0
	adds r0, #0x43
	ldrb r0, [r0]
	lsls r1, r0, #2
	adds r1, r1, r0
	ldrb r2, [r2]
	adds r1, r1, r2
	lsls r1, r1, #2
	adds r1, r1, r5
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #3
	movs r3, #2
	ldrsh r1, [r1, r3]
	lsls r1, r1, #3
	bl sub_804E848
_0802DCC2:
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802DCD0: .4byte gUnknown_0859BADC
_0802DCD4: .4byte gKeyStatusPtr

	THUMB_FUNC_START sub_802DCD8
sub_802DCD8: @ 0x0802DCD8
	push {r4, r5, r6, lr}
	ldr r4, [r0, #0x14]
	adds r5, r4, #0
	adds r5, #0x45
	movs r0, #0
	ldrsb r0, [r5, r0]
	cmp r0, #0
	beq _0802DD06
	adds r2, r4, #0
	adds r2, #0x47
	adds r0, r4, #0
	adds r0, #0x46
	ldrb r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	ldrb r2, [r2]
	adds r0, r0, r2
	adds r1, r4, #0
	adds r1, #0x34
	adds r1, r1, r0
	movs r0, #1
	strb r0, [r1]
_0802DD06:
	bl sub_8089018
	ldr r6, _0802DD68  @ gUnknown_0859BADC
	adds r2, r4, #0
	adds r2, #0x42
	adds r0, r4, #0
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r1, r0, #2
	adds r1, r1, r0
	ldrb r2, [r2]
	adds r1, r1, r2
	lsls r1, r1, #2
	adds r1, r1, r6
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #3
	movs r2, #2
	ldrsh r1, [r1, r2]
	lsls r1, r1, #3
	bl sub_804E79C
	movs r0, #0
	ldrsb r0, [r5, r0]
	cmp r0, #0
	beq _0802DD60
	adds r2, r4, #0
	adds r2, #0x44
	adds r0, r4, #0
	adds r0, #0x43
	ldrb r0, [r0]
	lsls r1, r0, #2
	adds r1, r1, r0
	ldrb r2, [r2]
	adds r1, r1, r2
	lsls r1, r1, #2
	adds r1, r1, r6
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #3
	movs r2, #2
	ldrsh r1, [r1, r2]
	lsls r1, r1, #3
	bl sub_804E848
_0802DD60:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802DD68: .4byte gUnknown_0859BADC

	THUMB_FUNC_START sub_802DD6C
sub_802DD6C: @ 0x0802DD6C
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r4, r1, #0
	ldr r0, _0802DDC8  @ gUnknown_0859BB1C
	movs r1, #3
	bl Proc_Create
	adds r2, r0, #0
	str r6, [r2, #0x2c]
	str r4, [r2, #0x30]
	adds r1, r2, #0
	adds r1, #0x40
	movs r0, #0
	strb r0, [r1]
	adds r5, r2, #0
	adds r5, #0x41
	strb r0, [r5]
	adds r1, #2
	strb r0, [r1]
	adds r4, r2, #0
	adds r4, #0x48
	strb r0, [r4]
	ldr r0, _0802DDCC  @ gUnknown_0203A610
	str r2, [r0]
	bl sub_80837F8
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0802DDB0
	movs r0, #0xc9
	bl SetKeyStatus_IgnoreMask
	movs r0, #1
	strb r0, [r4]
_0802DDB0:
	adds r0, r6, #0
	bl GetUnitItemCount
	adds r1, r0, #0
	cmp r1, #0
	bne _0802DDC0
	movs r1, #1
	strb r1, [r5]
_0802DDC0:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0802DDC8: .4byte gUnknown_0859BB1C
_0802DDCC: .4byte gUnknown_0203A610

	THUMB_FUNC_START sub_802DDD0
sub_802DDD0: @ 0x0802DDD0
	push {lr}
	ldr r0, _0802DE00  @ gUnknown_0203A610
	ldr r0, [r0]
	ldr r2, _0802DE04  @ gUnknown_0859BADC
	adds r3, r0, #0
	adds r3, #0x42
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r1, r0, #2
	adds r1, r1, r0
	ldrb r3, [r3]
	adds r1, r1, r3
	lsls r1, r1, #2
	adds r1, r1, r2
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #3
	movs r2, #2
	ldrsh r1, [r1, r2]
	lsls r1, r1, #3
	bl sub_804E848
	pop {r0}
	bx r0
	.align 2, 0
_0802DE00: .4byte gUnknown_0203A610
_0802DE04: .4byte gUnknown_0859BADC

	THUMB_FUNC_START sub_802DE08
sub_802DE08: @ 0x0802DE08
	push {r4, r5, lr}
	ldr r0, _0802DE64  @ gUnknown_0203A610
	ldr r5, [r0]
	ldr r4, _0802DE68  @ gUnknown_0859BADC
	adds r2, r5, #0
	adds r2, #0x42
	adds r0, r5, #0
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r1, r0, #2
	adds r1, r1, r0
	ldrb r2, [r2]
	adds r1, r1, r2
	lsls r1, r1, #2
	adds r1, r1, r4
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #3
	movs r2, #2
	ldrsh r1, [r1, r2]
	lsls r1, r1, #3
	bl sub_804E848
	adds r2, r5, #0
	adds r2, #0x44
	adds r0, r5, #0
	adds r0, #0x43
	ldrb r0, [r0]
	lsls r1, r0, #2
	adds r1, r1, r0
	ldrb r2, [r2]
	adds r1, r1, r2
	lsls r1, r1, #2
	adds r1, r1, r4
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #3
	movs r2, #2
	ldrsh r1, [r1, r2]
	lsls r1, r1, #3
	bl sub_804E848
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802DE64: .4byte gUnknown_0203A610
_0802DE68: .4byte gUnknown_0859BADC

	THUMB_FUNC_START sub_802DE6C
sub_802DE6C: @ 0x0802DE6C
	push {lr}
	ldr r0, _0802DE7C  @ gUnknown_0859BBF4
	movs r1, #3
	bl Proc_Create
	pop {r0}
	bx r0
	.align 2, 0
_0802DE7C: .4byte gUnknown_0859BBF4

	THUMB_FUNC_START sub_802DE80
sub_802DE80: @ 0x0802DE80
	push {lr}
	ldr r0, _0802DE90  @ gUnknown_0859BC0C
	movs r1, #3
	bl Proc_Create
	pop {r0}
	bx r0
	.align 2, 0
_0802DE90: .4byte gUnknown_0859BC0C

	THUMB_FUNC_START sub_802DE94
sub_802DE94: @ 0x0802DE94
	push {lr}
	ldr r0, _0802DEA0  @ gUnknown_0859BBF4
	bl Proc_DeleteAllWithScript
	pop {r0}
	bx r0
	.align 2, 0
_0802DEA0: .4byte gUnknown_0859BBF4

	THUMB_FUNC_START sub_802DEA4
sub_802DEA4: @ 0x0802DEA4
	push {lr}
	ldr r0, _0802DEB0  @ gUnknown_0859BC0C
	bl Proc_DeleteAllWithScript
	pop {r0}
	bx r0
	.align 2, 0
_0802DEB0: .4byte gUnknown_0859BC0C

	THUMB_FUNC_START sub_802DEB4
sub_802DEB4: @ 0x0802DEB4
	adds r0, #0x4c
	movs r1, #0x14
	strh r1, [r0]
	bx lr

	THUMB_FUNC_START sub_802DEBC
sub_802DEBC: @ 0x0802DEBC
	push {lr}
	adds r2, r0, #0
	adds r1, r2, #0
	adds r1, #0x4c
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _0802DED6
	adds r0, r2, #0
	bl Proc_ClearNativeCallback
_0802DED6:
	pop {r0}
	bx r0

	THUMB_FUNC_START sub_802DEDC
sub_802DEDC: @ 0x0802DEDC
	push {lr}
	adds r1, r0, #0
	ldr r0, _0802DF00  @ gUnknown_0203A610
	ldr r0, [r0]
	adds r0, #0x48
	ldrb r0, [r0]
	cmp r0, #3
	beq _0802DEFA
	cmp r0, #5
	beq _0802DEFA
	cmp r0, #8
	beq _0802DEFA
	ldr r0, _0802DF04  @ gUnknown_0859BC24
	bl Proc_CreateBlockingChild
_0802DEFA:
	pop {r0}
	bx r0
	.align 2, 0
_0802DF00: .4byte gUnknown_0203A610
_0802DF04: .4byte gUnknown_0859BC24

	THUMB_FUNC_START sub_802DF08
sub_802DF08: @ 0x0802DF08
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x48
	ldrb r0, [r0]
	cmp r0, #4
	beq _0802DF20
	ldr r0, _0802DF3C  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r0, [r0, #8]
	cmp r0, #0
	bne _0802DF20
	b _0802E098
_0802DF20:
	ldr r0, _0802DF40  @ gUnknown_0203A610
	ldr r0, [r0]
	adds r0, #0x48
	ldrb r0, [r0]
	subs r0, #2
	cmp r0, #6
	bls _0802DF30
	b _0802E098
_0802DF30:
	lsls r0, r0, #2
	ldr r1, _0802DF44  @ _0802DF48
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0802DF3C: .4byte gKeyStatusPtr
_0802DF40: .4byte gUnknown_0203A610
_0802DF44: .4byte _0802DF48
_0802DF48: @ jump table
	.4byte _0802DF64 @ case 0
	.4byte _0802DFA8 @ case 1
	.4byte _0802E04A @ case 2
	.4byte _0802E01C @ case 3
	.4byte _0802E098 @ case 4
	.4byte _0802E098 @ case 5
	.4byte _0802E058 @ case 6
_0802DF64:
	ldr r0, _0802DF80  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _0802DF84
	movs r0, #0xc8
	bl SetKeyStatus_IgnoreMask
	adds r0, r4, #0
	bl sub_802E168
	b _0802E098
	.align 2, 0
_0802DF80: .4byte gKeyStatusPtr
_0802DF84:
	ldr r0, _0802DFA4  @ gUnknown_0202BCF0
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0802DF96
	movs r0, #0x6c
	bl m4aSongNumStart
_0802DF96:
	adds r0, r4, #0
	movs r1, #0x65
	bl Proc_GotoLabel
	movs r0, #1
	b _0802E09A
	.align 2, 0
_0802DFA4: .4byte gUnknown_0202BCF0
_0802DFA8:
	ldr r0, _0802DFF8  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0x91
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	bne _0802DFFC
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0802E098
	movs r0, #0xc0
	ands r0, r1
	cmp r0, #0
	bne _0802DFFC
	adds r0, r4, #0
	adds r0, #0x41
	ldrb r1, [r0]
	lsls r1, r1, #2
	subs r0, #0x15
	adds r0, r0, r1
	ldr r1, [r0]
	adds r0, r4, #0
	adds r0, #0x42
	ldrb r0, [r0]
	lsls r0, r0, #1
	adds r1, #0x1e
	adds r1, r1, r0
	ldrh r0, [r1]
	bl GetItemIndex
	cmp r0, #0x6c
	bne _0802DFFC
	movs r0, #0xc8
	bl SetKeyStatus_IgnoreMask
	bl sub_802E0C0
	b _0802E098
	.align 2, 0
_0802DFF8: .4byte gKeyStatusPtr
_0802DFFC:
	ldr r0, _0802E018  @ gUnknown_0202BCF0
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0802E00E
	movs r0, #0x6c
	bl m4aSongNumStart
_0802E00E:
	adds r0, r4, #0
	bl sub_802E168
	movs r0, #1
	b _0802E09A
	.align 2, 0
_0802E018: .4byte gUnknown_0202BCF0
_0802E01C:
	ldr r0, _0802E034  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0802E038
	adds r0, r4, #0
	bl sub_802E1A8
	b _0802E098
	.align 2, 0
_0802E034: .4byte gKeyStatusPtr
_0802E038:
	ldr r0, _0802E054  @ gUnknown_0202BCF0
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0802E04A
	movs r0, #0x6c
	bl m4aSongNumStart
_0802E04A:
	adds r0, r4, #0
	bl sub_802E188
	movs r0, #1
	b _0802E09A
	.align 2, 0
_0802E054: .4byte gUnknown_0202BCF0
_0802E058:
	ldr r0, _0802E074  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0802E078
	movs r0, #0
	bl SetKeyStatus_IgnoreMask
	movs r0, #0x87
	bl UnsetEventId
	b _0802E098
	.align 2, 0
_0802E074: .4byte gKeyStatusPtr
_0802E078:
	ldr r0, _0802E094  @ gUnknown_0202BCF0
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0802E08A
	movs r0, #0x6c
	bl m4aSongNumStart
_0802E08A:
	adds r0, r4, #0
	bl sub_802E1A8
	movs r0, #1
	b _0802E09A
	.align 2, 0
_0802E094: .4byte gUnknown_0202BCF0
_0802E098:
	movs r0, #0
_0802E09A:
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_START sub_802E0A0
sub_802E0A0: @ 0x0802E0A0
	ldr r0, _0802E0AC  @ gUnknown_0203A610
	ldr r0, [r0]
	adds r0, #0x48
	movs r1, #2
	strb r1, [r0]
	bx lr
	.align 2, 0
_0802E0AC: .4byte gUnknown_0203A610

	THUMB_FUNC_START sub_802E0B0
sub_802E0B0: @ 0x0802E0B0
	ldr r0, _0802E0BC  @ gUnknown_0203A610
	ldr r0, [r0]
	adds r0, #0x48
	movs r1, #3
	strb r1, [r0]
	bx lr
	.align 2, 0
_0802E0BC: .4byte gUnknown_0203A610

	THUMB_FUNC_START sub_802E0C0
sub_802E0C0: @ 0x0802E0C0
	ldr r0, _0802E0CC  @ gUnknown_0203A610
	ldr r0, [r0]
	adds r0, #0x48
	movs r1, #4
	strb r1, [r0]
	bx lr
	.align 2, 0
_0802E0CC: .4byte gUnknown_0203A610

	THUMB_FUNC_START sub_802E0D0
sub_802E0D0: @ 0x0802E0D0
	ldr r0, _0802E0DC  @ gUnknown_0203A610
	ldr r0, [r0]
	adds r0, #0x48
	movs r1, #5
	strb r1, [r0]
	bx lr
	.align 2, 0
_0802E0DC: .4byte gUnknown_0203A610

	THUMB_FUNC_START sub_802E0E0
sub_802E0E0: @ 0x0802E0E0
	ldr r0, _0802E0EC  @ gUnknown_0203A610
	ldr r0, [r0]
	adds r0, #0x48
	movs r1, #6
	strb r1, [r0]
	bx lr
	.align 2, 0
_0802E0EC: .4byte gUnknown_0203A610

	THUMB_FUNC_START sub_802E0F0
sub_802E0F0: @ 0x0802E0F0
	ldr r0, _0802E0FC  @ gUnknown_0203A610
	ldr r0, [r0]
	adds r0, #0x48
	movs r1, #7
	strb r1, [r0]
	bx lr
	.align 2, 0
_0802E0FC: .4byte gUnknown_0203A610

	THUMB_FUNC_START sub_802E100
sub_802E100: @ 0x0802E100
	ldr r0, _0802E10C  @ gUnknown_0203A610
	ldr r0, [r0]
	adds r0, #0x48
	movs r1, #8
	strb r1, [r0]
	bx lr
	.align 2, 0
_0802E10C: .4byte gUnknown_0203A610

	THUMB_FUNC_START sub_802E110
sub_802E110: @ 0x0802E110
	push {lr}
	ldr r0, _0802E120  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r0, [r0, #4]
	cmp r0, #0
	beq _0802E124
	movs r0, #1
	b _0802E126
	.align 2, 0
_0802E120: .4byte gKeyStatusPtr
_0802E124:
	movs r0, #0
_0802E126:
	pop {r1}
	bx r1

	THUMB_FUNC_START sub_802E12C
sub_802E12C: @ 0x0802E12C
	push {lr}
	adds r1, r0, #0
	ldr r0, _0802E13C  @ gUnknown_0859BC3C
	bl Proc_CreateBlockingChild
	pop {r0}
	bx r0
	.align 2, 0
_0802E13C: .4byte gUnknown_0859BC3C

	THUMB_FUNC_START sub_802E140
sub_802E140: @ 0x0802E140
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x48
	ldrb r0, [r0]
	cmp r0, #0
	beq _0802E15E
	ldr r0, _0802E164  @ gUnknown_0859BC64
	movs r1, #3
	bl CallEvent
	adds r0, r4, #0
	bl sub_802E12C
	bl sub_802DE6C
_0802E15E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802E164: .4byte gUnknown_0859BC64

	THUMB_FUNC_START sub_802E168
sub_802E168: @ 0x0802E168
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0802E184  @ gUnknown_0859BCA8
	movs r1, #3
	bl CallEvent
	adds r0, r4, #0
	bl sub_802E12C
	bl sub_802DE6C
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802E184: .4byte gUnknown_0859BCA8

	THUMB_FUNC_START sub_802E188
sub_802E188: @ 0x0802E188
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0802E1A4  @ gUnknown_0859BCF4
	movs r1, #3
	bl CallEvent
	adds r0, r4, #0
	bl sub_802E12C
	bl sub_802DE80
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802E1A4: .4byte gUnknown_0859BCF4

	THUMB_FUNC_START sub_802E1A8
sub_802E1A8: @ 0x0802E1A8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0802E1C4  @ gUnknown_0859BD40
	movs r1, #3
	bl CallEvent
	adds r0, r4, #0
	bl sub_802E12C
	bl sub_802DE6C
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802E1C4: .4byte gUnknown_0859BD40

.align 2, 0
