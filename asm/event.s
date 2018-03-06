	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	THUMB_FUNC_START sub_800D3A4
sub_800D3A4: @ 0x0800D3A4
	push {lr}
	ldrh r2, [r0, #0x3c]
	movs r0, #2
	ands r0, r2
	cmp r0, #0
	beq _0800D3DC
	lsrs r0, r2, #2
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _0800D3DC
	movs r0, #0x10
	ands r0, r2
	cmp r0, #0
	bne _0800D3DC
	bl IsBattleDeamonActive
	cmp r0, #0
	bne _0800D3DC
	ldr r0, _0800D3D8  @ gUnknown_089A2C80
	bl Proc_Find
	cmp r0, #0
	bne _0800D3DC
	movs r0, #1
	b _0800D3DE
	.align 2, 0
_0800D3D8: .4byte gUnknown_089A2C80
_0800D3DC:
	movs r0, #0
_0800D3DE:
	pop {r1}
	bx r1

	THUMB_FUNC_START sub_800D3E4
sub_800D3E4: @ 0x0800D3E4
	push {lr}
	ldr r0, _0800D40C  @ gUnknown_08591AC0
	bl Proc_Find
	adds r2, r0, #0
	cmp r2, #0
	bne _0800D3FE
	ldr r0, _0800D410  @ gUnknown_08591AF8
	bl Proc_Find
	adds r2, r0, #0
	cmp r2, #0
	beq _0800D406
_0800D3FE:
	ldrh r1, [r2, #0x3c]
	movs r0, #8
	orrs r0, r1
	strh r0, [r2, #0x3c]
_0800D406:
	pop {r0}
	bx r0
	.align 2, 0
_0800D40C: .4byte gUnknown_08591AC0
_0800D410: .4byte gUnknown_08591AF8

	THUMB_FUNC_START sub_800D414
sub_800D414: @ 0x0800D414
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x3c]
	movs r1, #4
	orrs r1, r0
	strh r1, [r4, #0x3c]
	bl GetZero
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0800D46E
	bl sub_80BA054
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _0800D43E
	adds r0, r4, #0
	bl sub_800D488
	b _0800D46E
_0800D43E:
	ldrh r1, [r4, #0x3c]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0800D46E
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0800D45A
	adds r0, r4, #0
	bl sub_800D488
	b _0800D462
_0800D45A:
	movs r0, #0x40
	adds r1, r4, #0
	bl sub_8013D08
_0800D462:
	ldrh r1, [r4, #0x3c]
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r2, #0
	orrs r0, r1
	strh r0, [r4, #0x3c]
_0800D46E:
	adds r0, r4, #0
	adds r0, #0x41
	ldrb r0, [r0]
	cmp r0, #0
	bne _0800D47C
	bl sub_80BA424
_0800D47C:
	movs r0, #5
	bl Proc_BlockEachWithMark
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_START sub_800D488
sub_800D488: @ 0x0800D488
	push {lr}
	bl sub_80141B0
	ldr r0, _0800D498  @ gUnknown_08591540
	bl Proc_DeleteAllWithScript
	pop {r0}
	bx r0
	.align 2, 0
_0800D498: .4byte gUnknown_08591540

	THUMB_FUNC_START sub_800D49C
sub_800D49C: @ 0x0800D49C
	push {lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r1, r1, #0x18
	cmp r1, #0
	bne _0800D4AE
	bl UnsetEventId
	b _0800D4B2
_0800D4AE:
	bl SetEventId
_0800D4B2:
	pop {r0}
	bx r0

	THUMB_FUNC_START CheckEventId_
CheckEventId_: @ 0x0800D4B8
	push {lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl CheckEventId
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0800D4CC
	movs r0, #1
	b _0800D4CE
_0800D4CC:
	movs r0, #0
_0800D4CE:
	pop {r1}
	bx r1

	THUMB_FUNC_START sub_800D4D4
sub_800D4D4: @ 0x0800D4D4
	push {r4, r5, r6, lr}
	sub sp, #0x20
	adds r6, r0, #0
	mov r4, sp
	movs r5, #0
	movs r0, #4
	strh r0, [r4]
	strh r5, [r4, #2]
	str r3, [sp, #4]
	movs r0, #2
	strh r0, [r4, #8]
	strh r5, [r4, #0xa]
	str r1, [sp, #0xc]
	movs r0, #3
	strh r0, [r4, #0x10]
	strh r5, [r4, #0x12]
	str r2, [sp, #0x14]
	add r0, sp, #0x18
	movs r1, #0
	movs r2, #8
	bl memset
	ldr r0, _0800D520  @ gUnknown_030005B0
	adds r2, r0, #0
	mov r1, sp
	ldm r1!, {r3, r4, r5}
	stm r2!, {r3, r4, r5}
	ldm r1!, {r3, r4, r5}
	stm r2!, {r3, r4, r5}
	ldm r1!, {r3, r4}
	stm r2!, {r3, r4}
	adds r1, r6, #0
	bl Proc_Create
	add sp, #0x20
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0800D520: .4byte gUnknown_030005B0

	THUMB_FUNC_START sub_800D524
sub_800D524: @ 0x0800D524
	bx lr

	THUMB_FUNC_START SlotQueuePush
SlotQueuePush: @ 0x0800D528
	ldr r3, _0800D53C  @ gUnknown_030004F0
	ldr r2, _0800D540  @ gUnknown_030004B8
	ldr r1, [r2, #0x34]
	lsls r1, r1, #2
	adds r1, r1, r3
	str r0, [r1]
	ldr r0, [r2, #0x34]
	adds r0, #1
	str r0, [r2, #0x34]
	bx lr
	.align 2, 0
_0800D53C: .4byte gUnknown_030004F0
_0800D540: .4byte gUnknown_030004B8

	THUMB_FUNC_START SlotQueuePop
SlotQueuePop: @ 0x0800D544
	push {r4, r5, lr}
	ldr r3, _0800D580  @ gUnknown_030004F0
	ldr r5, [r3]
	ldr r1, _0800D584  @ gUnknown_030004B8
	ldr r0, [r1, #0x34]
	subs r0, #1
	str r0, [r1, #0x34]
	movs r2, #0
	cmp r2, r0
	bcs _0800D578
	adds r4, r1, #0
_0800D55A:
	lsls r1, r2, #0x10
	asrs r1, r1, #0x10
	lsls r2, r1, #2
	adds r2, r2, r3
	adds r1, #1
	lsls r0, r1, #2
	adds r0, r0, r3
	ldr r0, [r0]
	str r0, [r2]
	lsls r1, r1, #0x10
	lsrs r2, r1, #0x10
	asrs r1, r1, #0x10
	ldr r0, [r4, #0x34]
	cmp r1, r0
	bcc _0800D55A
_0800D578:
	adds r0, r5, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0800D580: .4byte gUnknown_030004F0
_0800D584: .4byte gUnknown_030004B8

	THUMB_FUNC_START SetEventCounter
SetEventCounter: @ 0x0800D588
	ldr r1, _0800D590  @ gUnknown_03000568
	str r0, [r1]
	bx lr
	.align 2, 0
_0800D590: .4byte gUnknown_03000568

	THUMB_FUNC_START sub_800D594
sub_800D594: @ 0x0800D594
	ldr r0, _0800D59C  @ gUnknown_03000568
	ldr r0, [r0]
	bx lr
	.align 2, 0
_0800D59C: .4byte gUnknown_03000568
