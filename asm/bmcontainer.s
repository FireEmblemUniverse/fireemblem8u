	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	@ "Container" (aka Convoy) related things

	THUMB_FUNC_START GetConvoyItemArray
GetConvoyItemArray: @ 0x08031500
	ldr r0, _08031504  @ gUnknown_0203A81C
	bx lr
	.align 2, 0
_08031504: .4byte gUnknown_0203A81C

	THUMB_FUNC_END GetConvoyItemArray

	THUMB_FUNC_START ClearConvoyItems
ClearConvoyItems: @ 0x08031508
	push {lr}
	sub sp, #4
	mov r1, sp
	movs r0, #0
	strh r0, [r1]
	ldr r1, _08031524  @ gUnknown_0203A81C
	ldr r2, _08031528  @ 0x01000064
	mov r0, sp
	bl CpuSet
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_08031524: .4byte gUnknown_0203A81C
_08031528: .4byte 0x01000064

	THUMB_FUNC_END ClearConvoyItems

	THUMB_FUNC_START ShrinkConvoyItemList
ShrinkConvoyItemList: @ 0x0803152C
	push {r4, r5, r6, lr}
	ldr r6, _0803156C  @ gUnknown_02020188
	adds r4, r6, #0
	bl GetConvoyItemArray
	adds r1, r0, #0
	movs r5, #0
_0803153A:
	ldrh r0, [r1]
	cmp r0, #0
	beq _08031544
	strh r0, [r4]
	adds r4, #2
_08031544:
	adds r1, #2
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0x63
	bls _0803153A
	movs r0, #0
	strh r0, [r4]
	bl ClearConvoyItems
	bl GetConvoyItemArray
	adds r1, r0, #0
	adds r0, r6, #0
	adds r2, r5, #0
	bl CpuSet
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0803156C: .4byte gUnknown_02020188

	THUMB_FUNC_END ShrinkConvoyItemList

	THUMB_FUNC_START GetConvoyItemCount
GetConvoyItemCount: @ 0x08031570
	push {lr}
	movs r3, #0
	ldr r2, _08031590  @ gUnknown_0203A81C
	movs r1, #0x63
_08031578:
	ldrh r0, [r2]
	cmp r0, #0
	beq _08031580
	adds r3, #1
_08031580:
	adds r2, #2
	subs r1, #1
	cmp r1, #0
	bge _08031578
	adds r0, r3, #0
	pop {r1}
	bx r1
	.align 2, 0
_08031590: .4byte gUnknown_0203A81C

	THUMB_FUNC_END GetConvoyItemCount

	THUMB_FUNC_START AddItemToConvoy
AddItemToConvoy: @ 0x08031594
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _080315B0  @ gUnknown_0202BCB0
	movs r0, #0
	strh r0, [r1, #0x2e]
	movs r3, #0
	ldr r2, _080315B4  @ gUnknown_0203A81C
_080315A2:
	ldrh r0, [r2]
	cmp r0, #0
	bne _080315B8
	strh r4, [r2]
	adds r0, r3, #0
	b _080315C6
	.align 2, 0
_080315B0: .4byte gUnknown_0202BCB0
_080315B4: .4byte gUnknown_0203A81C
_080315B8:
	adds r2, #2
	adds r3, #1
	cmp r3, #0x63
	ble _080315A2
	strh r4, [r1, #0x2e]
	movs r0, #1
	negs r0, r0
_080315C6:
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END AddItemToConvoy

	THUMB_FUNC_START sub_80315CC
sub_80315CC: @ 0x080315CC
	push {lr}
	ldr r1, _080315E0  @ gUnknown_0203A81C
	lsls r0, r0, #1
	adds r0, r0, r1
	movs r1, #0
	strh r1, [r0]
	bl ShrinkConvoyItemList
	pop {r0}
	bx r0
	.align 2, 0
_080315E0: .4byte gUnknown_0203A81C

	THUMB_FUNC_END sub_80315CC

	THUMB_FUNC_START GetConvoyItemSlot
GetConvoyItemSlot: @ 0x080315E4
	push {r4, r5, lr}
	adds r3, r0, #0
	bl GetItemIndex
	adds r3, r0, #0
	movs r2, #0
	movs r5, #0xff
	ldr r4, _08031604  @ gUnknown_0203A81C
_080315F4:
	ldrh r1, [r4]
	adds r0, r5, #0
	ands r0, r1
	cmp r3, r0
	bne _08031608
	adds r0, r2, #0
	b _08031614
	.align 2, 0
_08031604: .4byte gUnknown_0203A81C
_08031608:
	adds r4, #2
	adds r2, #1
	cmp r2, #0x63
	ble _080315F4
	movs r0, #1
	negs r0, r0
_08031614:
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END GetConvoyItemSlot

	THUMB_FUNC_START HasConvoyAccess
HasConvoyAccess: @ 0x0803161C
	push {lr}
	ldr r0, _08031638  @ gUnknown_03005280
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0803163C
	bl sub_80BD048
	cmp r0, #1
	bls _08031650
	cmp r0, #0x38
	beq _08031650
	b _08031658
	.align 2, 0
_08031638: .4byte gUnknown_03005280
_0803163C:
	ldr r0, _08031654  @ gRAMChapterData
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	ble _08031650
	cmp r0, #0x38
	beq _08031650
	cmp r0, #5
	bne _08031658
_08031650:
	movs r0, #0
	b _0803165A
	.align 2, 0
_08031654: .4byte gRAMChapterData
_08031658:
	movs r0, #1
_0803165A:
	pop {r1}
	bx r1

	THUMB_FUNC_END HasConvoyAccess

	THUMB_FUNC_START sub_8031660
sub_8031660: @ 0x08031660
	push {lr}
	ldr r0, _0803167C  @ gRAMChapterData
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetROMChapterStruct
	adds r0, #0x82
	ldrb r0, [r0]
	cmp r0, #0xff
	beq _08031680
	movs r0, #1
	b _08031682
	.align 2, 0
_0803167C: .4byte gRAMChapterData
_08031680:
	movs r0, #0
_08031682:
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8031660

	THUMB_FUNC_START sub_8031688
sub_8031688: @ 0x08031688
	push {r4, lr}
	movs r4, #1
_0803168C:
	adds r0, r4, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq _080316B4
	ldr r1, [r2]
	cmp r1, #0
	beq _080316B4
	ldr r0, [r2, #4]
	ldr r1, [r1, #0x28]
	ldr r0, [r0, #0x28]
	orrs r1, r0
	movs r0, #0x80
	lsls r0, r0, #2
	ands r1, r0
	cmp r1, #0
	beq _080316B4
	adds r0, r2, #0
	b _080316BC
_080316B4:
	adds r4, #1
	cmp r4, #0x3f
	ble _0803168C
	movs r0, #0
_080316BC:
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8031688

.align 2, 0
