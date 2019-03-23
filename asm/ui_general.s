	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	@ General UI drawing utility functions.
	@ (Loading graphics, drawing window frames, etc)

	THUMB_FUNC_START MakeUIWindowTileMap_BG0BG1
MakeUIWindowTileMap_BG0BG1: @ 0x0804E368
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x4c
	str r0, [sp]
	adds r5, r1, #0
	ldr r4, [sp, #0x6c]
	ldr r1, _0804E5B0  @ gUnknown_085B6430
	lsls r0, r4, #2
	adds r0, r0, r1
	ldr r0, [r0]
	mov ip, r0
	ldr r0, [sp]
	adds r2, r0, r2
	subs r2, #1
	str r2, [sp, #4]
	adds r3, r5, r3
	subs r3, #1
	str r3, [sp, #8]
	cmp r4, #3
	bne _0804E398
	b _0804E5BC
_0804E398:
	adds r0, r5, #1
	str r0, [sp, #0x1c]
	ldr r1, [sp]
	adds r1, #1
	str r1, [sp, #0x18]
	lsls r5, r5, #5
	str r5, [sp, #0x24]
	lsls r2, r3, #5
	str r2, [sp, #0x30]
	cmp r0, r3
	bge _0804E48A
	movs r3, #0
	mov r9, r3
	ldr r4, _0804E5B4  @ gBG1TilemapBuffer
	mov r8, r4
_0804E3B6:
	ldr r7, [sp, #0x18]
	lsls r5, r0, #5
	adds r6, r0, #1
	mov sl, r6
	adds r0, #2
	str r0, [sp, #0x20]
	ldr r0, [sp, #4]
	cmp r7, r0
	bge _0804E432
	ldr r3, _0804E5B8  @ gBG0TilemapBuffer
	movs r2, #0
	ldr r6, _0804E5B4  @ gBG1TilemapBuffer
_0804E3CE:
	adds r0, r5, r7
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	lsls r1, r4, #1
	adds r0, r1, r3
	strh r2, [r0]
	adds r1, r1, r6
	str r1, [sp, #0x44]
	mov r1, ip
	ldrh r0, [r1, #0xc]
	ldr r1, [sp, #0x44]
	strh r0, [r1]
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	lsls r1, r4, #1
	adds r0, r1, r3
	strh r2, [r0]
	adds r1, r1, r6
	str r1, [sp, #0x44]
	mov r1, ip
	ldrh r0, [r1, #0xc]
	ldr r1, [sp, #0x44]
	strh r0, [r1]
	adds r0, r4, #0
	adds r0, #0x1f
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	lsls r1, r4, #1
	adds r0, r1, r3
	strh r2, [r0]
	adds r1, r1, r6
	str r1, [sp, #0x44]
	mov r1, ip
	ldrh r0, [r1, #0x12]
	ldr r1, [sp, #0x44]
	strh r0, [r1]
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0xf
	adds r1, r0, r3
	strh r2, [r1]
	adds r0, r0, r6
	mov r4, ip
	ldrh r1, [r4, #0x14]
	strh r1, [r0]
	adds r7, #2
	ldr r0, [sp, #4]
	cmp r7, r0
	blt _0804E3CE
_0804E432:
	ldr r2, [sp]
	adds r1, r5, r2
	lsls r1, r1, #1
	ldr r3, _0804E5B8  @ gBG0TilemapBuffer
	adds r0, r1, r3
	mov r4, r9
	strh r4, [r0]
	add r1, r8
	mov r6, ip
	ldrh r0, [r6, #0x10]
	strh r0, [r1]
	ldr r0, [sp, #4]
	adds r1, r5, r0
	lsls r1, r1, #1
	adds r0, r1, r3
	strh r4, [r0]
	add r1, r8
	ldrh r0, [r6, #0xe]
	strh r0, [r1]
	mov r1, sl
	lsls r2, r1, #5
	ldr r3, [sp]
	adds r1, r2, r3
	lsls r1, r1, #1
	ldr r4, _0804E5B8  @ gBG0TilemapBuffer
	adds r0, r1, r4
	mov r5, r9
	strh r5, [r0]
	add r1, r8
	ldrh r0, [r6, #0x10]
	strh r0, [r1]
	ldr r6, [sp, #4]
	adds r2, r2, r6
	lsls r2, r2, #1
	adds r0, r2, r4
	strh r5, [r0]
	add r2, r8
	mov r1, ip
	ldrh r0, [r1, #0x16]
	strh r0, [r2]
	ldr r0, [sp, #0x20]
	ldr r2, [sp, #8]
	cmp r0, r2
	blt _0804E3B6
_0804E48A:
	ldr r7, [sp, #0x18]
	ldr r3, [sp, #4]
	cmp r7, r3
	bge _0804E526
	ldr r6, _0804E5B8  @ gBG0TilemapBuffer
	ldr r4, _0804E5B4  @ gBG1TilemapBuffer
	ldr r5, [sp, #0x24]
	adds r5, #1
	str r5, [sp, #0xc]
	ldr r3, [sp, #0x30]
	adds r3, #1
	lsls r2, r7, #1
	ldr r1, [sp, #0x30]
	lsls r0, r1, #1
	adds r1, r0, r4
	adds r1, r2, r1
	str r1, [sp, #0x34]
	adds r0, r0, r6
	adds r0, r2, r0
	str r0, [sp, #0x38]
	ldr r5, [sp, #0x24]
	lsls r0, r5, #1
	adds r1, r0, r4
	adds r1, r1, r2
	mov sl, r1
	adds r0, r0, r6
	adds r0, r0, r2
	mov r9, r0
	lsls r3, r3, #1
	adds r0, r3, r4
	adds r0, r0, r2
	mov r8, r0
	adds r3, r3, r6
	adds r3, r2, r3
	ldr r0, [sp, #0xc]
	lsls r0, r0, #1
	str r0, [sp, #0x3c]
	adds r4, r0, r4
	adds r1, r2, r4
	adds r6, r0, r6
	adds r2, r2, r6
_0804E4DC:
	movs r5, #0
	mov r4, r9
	strh r5, [r4]
	mov r6, ip
	ldrh r0, [r6, #4]
	mov r4, sl
	strh r0, [r4]
	strh r5, [r2]
	ldrh r0, [r6, #4]
	strh r0, [r1]
	ldr r6, [sp, #0x38]
	strh r5, [r6]
	mov r4, ip
	ldrh r0, [r4, #0x1a]
	ldr r5, [sp, #0x34]
	strh r0, [r5]
	movs r6, #0
	strh r6, [r3]
	ldrh r0, [r4, #0x1c]
	mov r4, r8
	strh r0, [r4]
	adds r5, #4
	str r5, [sp, #0x34]
	ldr r5, [sp, #0x38]
	adds r5, #4
	str r5, [sp, #0x38]
	movs r6, #4
	add sl, r6
	add r9, r6
	add r8, r6
	adds r3, #4
	adds r1, #4
	adds r2, #4
	adds r7, #2
	ldr r0, [sp, #4]
	cmp r7, r0
	blt _0804E4DC
_0804E526:
	ldr r1, [sp, #0x24]
	ldr r3, [sp]
	adds r2, r1, r3
	lsls r2, r2, #1
	ldr r4, _0804E5B8  @ gBG0TilemapBuffer
	adds r0, r2, r4
	movs r1, #0
	strh r1, [r0]
	ldr r5, [sp, #0x24]
	ldr r6, [sp, #4]
	adds r5, r5, r6
	str r5, [sp, #0x10]
	lsls r6, r5, #1
	adds r0, r6, r4
	strh r1, [r0]
	ldr r0, [sp, #0x30]
	adds r4, r0, r3
	lsls r4, r4, #1
	ldr r3, _0804E5B8  @ gBG0TilemapBuffer
	adds r0, r4, r3
	strh r1, [r0]
	ldr r5, [sp, #0x30]
	ldr r0, [sp, #4]
	adds r3, r5, r0
	lsls r3, r3, #1
	ldr r5, _0804E5B8  @ gBG0TilemapBuffer
	adds r0, r3, r5
	strh r1, [r0]
	ldr r0, _0804E5B4  @ gBG1TilemapBuffer
	adds r2, r2, r0
	mov r1, ip
	ldrh r0, [r1]
	strh r0, [r2]
	ldr r0, [sp, #0x24]
	adds r0, #1
	ldr r2, [sp]
	adds r0, r0, r2
	lsls r0, r0, #1
	ldr r5, _0804E5B4  @ gBG1TilemapBuffer
	adds r0, r0, r5
	ldrh r1, [r1, #2]
	strh r1, [r0]
	ldr r1, [sp, #0x1c]
	lsls r0, r1, #5
	adds r1, r0, r2
	lsls r1, r1, #1
	adds r1, r1, r5
	mov r5, ip
	ldrh r2, [r5, #8]
	strh r2, [r1]
	adds r0, #1
	ldr r1, [sp]
	adds r0, r0, r1
	lsls r0, r0, #1
	ldr r2, _0804E5B4  @ gBG1TilemapBuffer
	adds r0, r0, r2
	ldrh r1, [r5, #0xa]
	strh r1, [r0]
	adds r6, r6, r2
	ldrh r0, [r5, #6]
	strh r0, [r6]
	adds r4, r4, r2
	ldrh r0, [r5, #0x18]
	strh r0, [r4]
	adds r3, r3, r2
	ldrh r0, [r5, #0x1e]
	strh r0, [r3]
	b _0804E76A
	.align 2, 0
_0804E5B0: .4byte gUnknown_085B6430
_0804E5B4: .4byte gBG1TilemapBuffer
_0804E5B8: .4byte gBG0TilemapBuffer
_0804E5BC:
	adds r0, r5, #1
	str r0, [sp, #0x1c]
	ldr r3, [sp]
	adds r3, #1
	str r3, [sp, #0x18]
	ldr r4, [sp, #8]
	lsls r4, r4, #5
	str r4, [sp, #0x30]
	ldr r5, [sp, #8]
	cmp r0, r5
	blt _0804E5D4
	b _0804E6F0
_0804E5D4:
	movs r1, #0
	ldr r6, [sp, #0x1c]
	cmp r0, r6
	bne _0804E5DE
	movs r1, #1
_0804E5DE:
	mov r9, r1
	ldr r7, [sp, #0x18]
	lsls r5, r0, #5
	adds r1, r0, #1
	mov sl, r1
	adds r0, #2
	str r0, [sp, #0x20]
	mov r2, ip
	adds r2, #0x10
	str r2, [sp, #0x28]
	mov r3, ip
	adds r3, #0x16
	str r3, [sp, #0x2c]
	ldr r4, [sp, #4]
	cmp r7, r4
	bge _0804E67C
	ldr r6, _0804E794  @ gBG0TilemapBuffer
	mov r8, r6
	movs r3, #0
	ldr r2, _0804E798  @ gBG1TilemapBuffer
	mov r0, r9
	str r0, [sp, #0x48]
_0804E60A:
	adds r0, r5, r7
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	lsls r1, r4, #1
	mov r6, r8
	adds r0, r1, r6
	strh r3, [r0]
	adds r1, r1, r2
	mov r0, ip
	adds r0, #0x12
	ldr r6, [sp, #0x48]
	cmp r6, #0
	beq _0804E626
	subs r0, #8
_0804E626:
	ldrh r0, [r0]
	strh r0, [r1]
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	lsls r1, r4, #1
	mov r6, r8
	adds r0, r1, r6
	strh r3, [r0]
	adds r1, r1, r2
	mov r0, ip
	adds r0, #0x14
	ldr r6, [sp, #0x48]
	cmp r6, #0
	beq _0804E646
	subs r0, #8
_0804E646:
	ldrh r0, [r0]
	strh r0, [r1]
	adds r0, r4, #0
	adds r0, #0x1f
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	lsls r1, r4, #1
	mov r6, r8
	adds r0, r1, r6
	strh r3, [r0]
	adds r1, r1, r2
	mov r6, ip
	ldrh r0, [r6, #0x12]
	strh r0, [r1]
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0xf
	mov r4, r8
	adds r1, r0, r4
	strh r3, [r1]
	adds r0, r0, r2
	ldrh r1, [r6, #0x14]
	strh r1, [r0]
	adds r7, #2
	ldr r6, [sp, #4]
	cmp r7, r6
	blt _0804E60A
_0804E67C:
	ldr r1, [sp]
	adds r0, r5, r1
	lsls r0, r0, #1
	ldr r2, _0804E794  @ gBG0TilemapBuffer
	adds r1, r0, r2
	movs r6, #0
	strh r6, [r1]
	ldr r3, _0804E798  @ gBG1TilemapBuffer
	adds r1, r0, r3
	mov r4, r9
	ldr r0, [sp, #0x28]
	cmp r4, #0
	beq _0804E69A
	mov r0, ip
	adds r0, #8
_0804E69A:
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r0, [sp, #4]
	adds r1, r5, r0
	lsls r1, r1, #1
	ldr r2, _0804E794  @ gBG0TilemapBuffer
	adds r0, r1, r2
	strh r6, [r0]
	ldr r3, _0804E798  @ gBG1TilemapBuffer
	adds r1, r1, r3
	ldr r0, [sp, #0x2c]
	cmp r4, #0
	beq _0804E6B8
	mov r0, ip
	adds r0, #0xe
_0804E6B8:
	ldrh r0, [r0]
	strh r0, [r1]
	mov r4, sl
	lsls r2, r4, #5
	ldr r5, [sp]
	adds r1, r2, r5
	lsls r1, r1, #1
	ldr r3, _0804E794  @ gBG0TilemapBuffer
	adds r0, r1, r3
	strh r6, [r0]
	ldr r4, _0804E798  @ gBG1TilemapBuffer
	adds r1, r1, r4
	mov r5, ip
	ldrh r0, [r5, #0x10]
	strh r0, [r1]
	ldr r0, [sp, #4]
	adds r2, r2, r0
	lsls r2, r2, #1
	adds r0, r2, r3
	strh r6, [r0]
	adds r2, r2, r4
	ldrh r0, [r5, #0x16]
	strh r0, [r2]
	ldr r0, [sp, #0x20]
	ldr r1, [sp, #8]
	cmp r0, r1
	bge _0804E6F0
	b _0804E5D4
_0804E6F0:
	ldr r7, [sp, #0x18]
	ldr r2, [sp, #4]
	cmp r7, r2
	bge _0804E740
	ldr r3, _0804E794  @ gBG0TilemapBuffer
	mov r9, r3
	movs r4, #0
	mov r8, r4
	ldr r3, _0804E798  @ gBG1TilemapBuffer
	ldr r2, [sp, #0x30]
	adds r2, #1
	lsls r4, r7, #1
	ldr r5, [sp, #0x30]
	lsls r0, r5, #1
	adds r1, r0, r3
	adds r5, r4, r1
	add r0, r9
	adds r6, r4, r0
	lsls r2, r2, #1
	adds r3, r2, r3
	adds r1, r4, r3
	add r2, r9
	adds r4, r4, r2
_0804E71E:
	mov r0, r8
	strh r0, [r6]
	mov r2, ip
	ldrh r0, [r2, #0x1a]
	strh r0, [r5]
	mov r3, r8
	strh r3, [r4]
	ldrh r0, [r2, #0x1c]
	strh r0, [r1]
	adds r5, #4
	adds r6, #4
	adds r1, #4
	adds r4, #4
	adds r7, #2
	ldr r0, [sp, #4]
	cmp r7, r0
	blt _0804E71E
_0804E740:
	ldr r1, [sp, #0x30]
	ldr r3, [sp]
	adds r2, r1, r3
	lsls r2, r2, #1
	ldr r4, _0804E794  @ gBG0TilemapBuffer
	adds r0, r2, r4
	movs r3, #0
	strh r3, [r0]
	ldr r5, [sp, #4]
	adds r1, r1, r5
	lsls r1, r1, #1
	adds r0, r1, r4
	strh r3, [r0]
	ldr r6, _0804E798  @ gBG1TilemapBuffer
	adds r2, r2, r6
	mov r3, ip
	ldrh r0, [r3, #0x18]
	strh r0, [r2]
	adds r1, r1, r6
	ldrh r0, [r3, #0x1e]
	strh r0, [r1]
_0804E76A:
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	movs r0, #3
	bl BG_EnableSyncByMask
	add sp, #0x4c
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804E794: .4byte gBG0TilemapBuffer
_0804E798: .4byte gBG1TilemapBuffer

	THUMB_FUNC_START sub_804E79C
sub_804E79C: @ 0x0804E79C
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r5, r0, #0
	adds r6, r1, #0
	bl GetGameClock
	subs r0, #1
	ldr r7, _0804E7FC  @ gUnknown_0203DDE4
	ldr r1, [r7]
	cmp r0, r1
	bne _0804E7C4
	ldr r0, _0804E800  @ gUnknown_0203DDE0
	movs r2, #0
	ldrsh r1, [r0, r2]
	adds r1, r5, r1
	asrs r5, r1, #1
	movs r1, #2
	ldrsh r0, [r0, r1]
	adds r0, r6, r0
	asrs r6, r0, #1
_0804E7C4:
	ldr r0, _0804E800  @ gUnknown_0203DDE0
	movs r4, #0
	strh r5, [r0]
	strh r6, [r0, #2]
	bl GetGameClock
	str r0, [r7]
	bl GetGameClock
	ldr r2, _0804E804  @ gUnknown_085B6498
	movs r1, #0x1f
	ands r1, r0
	adds r1, r1, r2
	adds r0, r5, #0
	subs r0, #0xe
	ldrb r1, [r1]
	adds r5, r0, r1
	ldr r3, _0804E808  @ gUnknown_085B6490
	str r4, [sp]
	movs r0, #2
	adds r1, r5, #0
	adds r2, r6, #0
	bl RegisterObjectAttributes_SafeMaybe
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804E7FC: .4byte gUnknown_0203DDE4
_0804E800: .4byte gUnknown_0203DDE0
_0804E804: .4byte gUnknown_085B6498
_0804E808: .4byte gUnknown_085B6490

	THUMB_FUNC_START sub_804E80C
sub_804E80C: @ 0x0804E80C
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	adds r4, r1, #0
	bl GetGameClock
	ldr r2, _0804E840  @ gUnknown_085B6498
	movs r1, #0x1f
	ands r1, r0
	adds r1, r1, r2
	adds r0, r5, #0
	subs r0, #0xe
	ldrb r1, [r1]
	adds r5, r0, r1
	ldr r3, _0804E844  @ gUnknown_085B6490
	movs r0, #0
	str r0, [sp]
	movs r0, #2
	adds r1, r5, #0
	adds r2, r4, #0
	bl RegisterObjectAttributes_SafeMaybe
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0804E840: .4byte gUnknown_085B6498
_0804E844: .4byte gUnknown_085B6490

	THUMB_FUNC_START sub_804E848
sub_804E848: @ 0x0804E848
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r2, r1, #0
	subs r4, #0xc
	ldr r3, _0804E868  @ gUnknown_085B6490
	movs r0, #0
	str r0, [sp]
	movs r0, #3
	adds r1, r4, #0
	bl RegisterObjectAttributes_SafeMaybe
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804E868: .4byte gUnknown_085B6490

	THUMB_FUNC_START sub_804E86C
sub_804E86C: @ 0x0804E86C
	ldr r0, _0804E874  @ gUnknown_0203DDE0
	movs r1, #0
	ldrsh r0, [r0, r1]
	bx lr
	.align 2, 0
_0804E874: .4byte gUnknown_0203DDE0

	THUMB_FUNC_START sub_804E878
sub_804E878: @ 0x0804E878
	ldr r0, _0804E880  @ gUnknown_0203DDE0
	movs r1, #2
	ldrsh r0, [r0, r1]
	bx lr
	.align 2, 0
_0804E880: .4byte gUnknown_0203DDE0

	THUMB_FUNC_START ClearBG0BG1
ClearBG0BG1: @ 0x0804E884
	push {lr}
	ldr r0, _0804E8A0  @ gBG0TilemapBuffer
	movs r1, #0
	bl BG_Fill
	ldr r0, _0804E8A4  @ gBG1TilemapBuffer
	movs r1, #0
	bl BG_Fill
	movs r0, #3
	bl BG_EnableSyncByMask
	pop {r0}
	bx r0
	.align 2, 0
_0804E8A0: .4byte gBG0TilemapBuffer
_0804E8A4: .4byte gBG1TilemapBuffer

	THUMB_FUNC_START sub_804E8A8
sub_804E8A8: @ 0x0804E8A8
	push {r4, r5, r6, lr}
	adds r3, r0, #0
	adds r4, r1, #0
	adds r2, r3, r2
	subs r5, r2, #1
	adds r4, #1
	ldr r2, _0804E8FC  @ gBG1TilemapBuffer
	lsls r0, r4, #5
	adds r0, r0, r3
	lsls r0, r0, #1
	adds r0, r0, r2
	ldr r1, _0804E900  @ 0x0000107A
	strh r1, [r0]
	adds r3, #1
	adds r6, r2, #0
	cmp r3, r5
	bge _0804E8E2
	ldr r2, _0804E904  @ 0x0000107B
	lsls r1, r3, #1
	lsls r0, r4, #6
	adds r0, r0, r6
	adds r1, r1, r0
	subs r3, r5, r3
_0804E8D6:
	strh r2, [r1]
	adds r1, #2
	subs r3, #1
	cmp r3, #0
	bne _0804E8D6
	adds r3, r5, #0
_0804E8E2:
	lsls r0, r4, #5
	adds r0, r0, r3
	lsls r0, r0, #1
	adds r0, r0, r6
	ldr r1, _0804E908  @ 0x0000107C
	strh r1, [r0]
	movs r0, #2
	bl BG_EnableSyncByMask
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0804E8FC: .4byte gBG1TilemapBuffer
_0804E900: .4byte 0x0000107A
_0804E904: .4byte 0x0000107B
_0804E908: .4byte 0x0000107C

	THUMB_FUNC_START sub_804E90C
sub_804E90C: @ 0x0804E90C
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	adds r3, r0, #0
	adds r4, r1, #0
	mov r9, r2
	adds r0, r3, r2
	subs r5, r0, #1
	adds r4, #1
	ldr r0, _0804E96C  @ gBG1TilemapBuffer
	mov r8, r0
	ldr r1, _0804E970  @ gUnknown_080DA374
	mov ip, r1
	cmp r3, r5
	bge _0804E950
	lsls r0, r4, #5
	ldrh r7, [r1, #0xc]
	adds r0, #1
	ldrh r6, [r1, #0xe]
	lsls r2, r3, #1
	lsls r1, r4, #6
	add r1, r8
	adds r1, r2, r1
	lsls r0, r0, #1
	add r0, r8
	adds r2, r2, r0
_0804E942:
	strh r7, [r1]
	strh r6, [r2]
	adds r1, #4
	adds r2, #4
	adds r3, #2
	cmp r3, r5
	blt _0804E942
_0804E950:
	lsls r0, r4, #5
	adds r0, r0, r5
	lsls r0, r0, #1
	mov r2, r8
	adds r1, r0, r2
	movs r0, #1
	mov r2, r9
	ands r0, r2
	cmp r0, #0
	beq _0804E974
	mov r2, ip
	ldrh r0, [r2, #0xc]
	b _0804E978
	.align 2, 0
_0804E96C: .4byte gBG1TilemapBuffer
_0804E970: .4byte gUnknown_080DA374
_0804E974:
	mov r2, ip
	ldrh r0, [r2, #0xe]
_0804E978:
	strh r0, [r1]
	movs r0, #2
	bl BG_EnableSyncByMask
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_START sub_804E98C
sub_804E98C: @ 0x0804E98C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	adds r7, r1, #0
	adds r4, r2, #0
	adds r5, r3, #0
	ldr r0, [sp, #0x18]
	adds r0, r4, r0
	subs r6, r0, #1
	adds r5, #1
	mov r0, r8
	bl BG_GetMapBuffer
	adds r2, r0, #0
	lsls r0, r5, #5
	adds r0, r0, r4
	lsls r0, r0, #1
	adds r0, r0, r2
	ldr r3, _0804E9FC  @ 0x0000107A
	adds r1, r7, r3
	strh r1, [r0]
	adds r4, #1
	cmp r4, r6
	bge _0804E9D8
	ldr r0, _0804EA00  @ 0x0000107B
	adds r3, r7, r0
	lsls r1, r4, #1
	lsls r0, r5, #6
	adds r0, r0, r2
	adds r1, r1, r0
	subs r4, r6, r4
_0804E9CC:
	strh r3, [r1]
	adds r1, #2
	subs r4, #1
	cmp r4, #0
	bne _0804E9CC
	adds r4, r6, #0
_0804E9D8:
	lsls r0, r5, #5
	adds r0, r0, r4
	lsls r0, r0, #1
	adds r0, r0, r2
	ldr r2, _0804EA04  @ 0x0000107C
	adds r1, r7, r2
	strh r1, [r0]
	movs r0, #1
	mov r3, r8
	lsls r0, r3
	bl BG_EnableSyncByMask
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804E9FC: .4byte 0x0000107A
_0804EA00: .4byte 0x0000107B
_0804EA04: .4byte 0x0000107C

	THUMB_FUNC_START sub_804EA08
sub_804EA08: @ 0x0804EA08
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	mov r9, r0
	mov r8, r1
	adds r4, r2, #0
	adds r6, r3, #0
	ldr r7, [sp, #0x1c]
	adds r0, r4, r7
	subs r5, r0, #1
	adds r6, #1
	mov r0, r9
	bl BG_GetMapBuffer
	mov ip, r0
	cmp r4, r5
	bge _0804EA4C
	ldr r1, _0804EA64  @ gUnknown_080DA374
	ldrh r0, [r1, #0xc]
	mov r2, r8
	adds r3, r0, r2
	ldrh r0, [r1, #0xe]
	adds r2, r0, r2
	lsls r1, r4, #1
	lsls r0, r6, #6
	add r0, ip
	adds r1, r1, r0
_0804EA40:
	strh r3, [r1]
	strh r2, [r1, #2]
	adds r1, #4
	adds r4, #2
	cmp r4, r5
	blt _0804EA40
_0804EA4C:
	lsls r0, r6, #5
	adds r0, r0, r5
	lsls r0, r0, #1
	mov r1, ip
	adds r3, r0, r1
	movs r0, #1
	ands r7, r0
	cmp r7, #0
	beq _0804EA68
	ldr r0, _0804EA64  @ gUnknown_080DA374
	ldrh r0, [r0, #0xc]
	b _0804EA6C
	.align 2, 0
_0804EA64: .4byte gUnknown_080DA374
_0804EA68:
	ldr r0, _0804EA88  @ gUnknown_080DA374
	ldrh r0, [r0, #0xe]
_0804EA6C:
	add r0, r8
	strh r0, [r3]
	movs r0, #1
	mov r2, r9
	lsls r0, r2
	bl BG_EnableSyncByMask
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804EA88: .4byte gUnknown_080DA374

	THUMB_FUNC_START sub_804EA8C
sub_804EA8C: @ 0x0804EA8C
	push {r4, r5, lr}
	adds r3, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	ldr r0, _0804EAB0  @ gUnknown_085B8FF0
	adds r1, r3, #0
	bl CopyDataWithPossibleUncomp
	ldr r0, _0804EAB4  @ gUnknown_085B9244
	lsls r4, r4, #5
	lsls r5, r5, #5
	adds r1, r4, #0
	adds r2, r5, #0
	bl CopyToPaletteBuffer
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0804EAB0: .4byte gUnknown_085B8FF0
_0804EAB4: .4byte gUnknown_085B9244

	THUMB_FUNC_START sub_804EAB8
sub_804EAB8: @ 0x0804EAB8
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	adds r7, r2, #0
	bl GetGameClock
	subs r0, #1
	ldr r6, _0804EB1C  @ gUnknown_0203DDE4
	ldr r1, [r6]
	cmp r0, r1
	bne _0804EAE2
	ldr r0, _0804EB20  @ gUnknown_0203DDE0
	movs r2, #0
	ldrsh r1, [r0, r2]
	adds r1, r4, r1
	asrs r4, r1, #1
	movs r1, #2
	ldrsh r0, [r0, r1]
	adds r0, r5, r0
	asrs r5, r0, #1
_0804EAE2:
	ldr r0, _0804EB20  @ gUnknown_0203DDE0
	strh r4, [r0]
	strh r5, [r0, #2]
	bl GetGameClock
	str r0, [r6]
	bl GetGameClock
	ldr r2, _0804EB24  @ gUnknown_085B6498
	movs r1, #0x1f
	ands r1, r0
	adds r1, r1, r2
	adds r0, r4, #0
	subs r0, #0xe
	ldrb r1, [r1]
	adds r4, r0, r1
	ldr r3, _0804EB28  @ gUnknown_085B6490
	lsls r0, r7, #0xf
	lsrs r0, r0, #0x14
	str r0, [sp]
	movs r0, #2
	adds r1, r4, #0
	adds r2, r5, #0
	bl RegisterObjectAttributes_SafeMaybe
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804EB1C: .4byte gUnknown_0203DDE4
_0804EB20: .4byte gUnknown_0203DDE0
_0804EB24: .4byte gUnknown_085B6498
_0804EB28: .4byte gUnknown_085B6490

	THUMB_FUNC_START sub_804EB2C
sub_804EB2C: @ 0x0804EB2C
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	subs r4, #0xc
	ldr r3, _0804EB50  @ gUnknown_085B6490
	lsls r2, r2, #0xf
	lsrs r2, r2, #0x14
	str r2, [sp]
	movs r0, #3
	adds r1, r4, #0
	adds r2, r5, #0
	bl RegisterObjectAttributes_SafeMaybe
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0804EB50: .4byte gUnknown_085B6490

	THUMB_FUNC_START LoadOldUIGfx
LoadOldUIGfx: @ 0x0804EB54
	push {lr}
	movs r0, #0
	bl LoadOldUIImage
	movs r0, #1
	negs r0, r0
	bl LoadOldUIPal
	pop {r0}
	bx r0

	THUMB_FUNC_START LoadNewUIGraphics
LoadNewUIGraphics: @ 0x0804EB68
	push {lr}
	movs r0, #0
	bl LoadNewUIImage
	movs r0, #1
	negs r0, r0
	bl LoadNewUIPal
	pop {r0}
	bx r0

	THUMB_FUNC_START sub_804EB7C
sub_804EB7C: @ 0x0804EB7C
	push {r4, lr}
	adds r4, r1, #0
	movs r1, #0xc0
	lsls r1, r1, #0x13
	adds r0, r0, r1
	bl LoadNewUIImage
	adds r0, r4, #0
	bl LoadNewUIPal
	pop {r4}
	pop {r0}
	bx r0

.align 2, 0
