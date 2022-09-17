	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	THUMB_FUNC_START LongPopup_Draw
LongPopup_Draw: @ 0x08011270
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	adds r5, r0, #0
	bl GetSomeLongPopupLength
	adds r2, r5, #0
	adds r2, #0x46
	strh r0, [r2]
	lsls r1, r0, #0x10
	lsrs r6, r1, #0x13
	movs r1, #7
	ands r1, r0
	cmp r1, #0
	beq _08011296
	adds r6, #1
_08011296:
	lsls r0, r6, #3
	ldrh r1, [r2]
	subs r0, r0, r1
	asrs r0, r0, #1
	mov r9, r0
	adds r2, r5, #0
	adds r2, #0x34
	movs r1, #0
	ldrsb r1, [r2, r1]
	movs r0, #1
	negs r0, r0
	cmp r1, r0
	bne _080112BA
	movs r0, #0x1e
	subs r0, r0, r6
	asrs r0, r0, #1
	subs r7, r0, #1
	b _080112BE
_080112BA:
	movs r7, #0
	ldrsb r7, [r2, r7]
_080112BE:
	adds r2, r5, #0
	adds r2, #0x35
	movs r1, #0
	ldrsb r1, [r2, r1]
	movs r0, #1
	negs r0, r0
	movs r3, #8
	mov r8, r3
	cmp r1, r0
	beq _080112D6
	adds r2, r1, #0
	mov r8, r2
_080112D6:
	adds r4, r6, #2
	adds r0, r5, #0
	adds r0, #0x36
	ldrb r0, [r0]
	str r0, [sp]
	adds r0, r7, #0
	mov r1, r8
	adds r2, r4, #0
	movs r3, #4
	bl DrawUiFrame2
	movs r0, #0x37
	adds r0, r0, r5
	mov sl, r0
	strb r7, [r0]
	adds r1, r5, #0
	adds r1, #0x38
	str r1, [sp, #0xc]
	mov r2, r8
	strb r2, [r1]
	adds r0, r5, #0
	adds r0, #0x39
	strb r4, [r0]
	adds r1, #2
	movs r0, #3
	strb r0, [r1]
	adds r4, r5, #0
	adds r4, #0x44
	ldrb r0, [r4]
	add r0, r9
	strb r0, [r4]
	add r0, sp, #4
	adds r1, r6, #0
	bl Text_Init
	adds r0, r5, #0
	adds r0, #0x3b
	ldrb r1, [r0]
	add r0, sp, #4
	bl Text_SetColorId
	add r0, sp, #4
	mov r1, r9
	bl Text_SetXCursor
	ldr r0, [r5, #0x2c]
	ldr r1, [sp, #4]
	ldr r2, [sp, #8]
	bl GenSomeLongPopupText
	ldrh r0, [r5, #0x3e]
	ldr r6, _080113B4  @ 0x0000FFFF
	cmp r0, r6
	beq _0801134C
	adds r1, r5, #0
	adds r1, #0x40
	ldrh r1, [r1]
	bl LoadIconObjectGraphics
_0801134C:
	mov r1, r8
	adds r1, #1
	lsls r1, r1, #5
	adds r1, #1
	adds r1, r1, r7
	lsls r1, r1, #1
	ldr r0, _080113B8  @ gBG0TilemapBuffer
	adds r1, r1, r0
	add r0, sp, #4
	bl Text_Draw
	bl Font_InitForUIDefault
	ldrh r0, [r5, #0x3e]
	cmp r0, r6
	beq _080113A4
	ldr r0, _080113BC  @ gUnknown_08592228
	adds r1, r5, #0
	bl Proc_Start
	mov r3, sl
	ldrb r1, [r3]
	adds r1, #1
	lsls r1, r1, #3
	ldrb r4, [r4]
	adds r1, r1, r4
	str r1, [r0, #0x2c]
	ldr r2, [sp, #0xc]
	ldrb r1, [r2]
	adds r1, #1
	lsls r1, r1, #3
	str r1, [r0, #0x30]
	adds r3, r5, #0
	adds r3, #0x40
	adds r1, r5, #0
	adds r1, #0x42
	ldrb r2, [r1]
	movs r1, #0xf
	ands r1, r2
	lsls r1, r1, #0xc
	ldrh r2, [r3]
	orrs r1, r2
	adds r0, #0x4a
	strh r1, [r0]
_080113A4:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080113B4: .4byte 0x0000FFFF
_080113B8: .4byte gBG0TilemapBuffer
_080113BC: .4byte gUnknown_08592228

	THUMB_FUNC_END LongPopup_Draw

	THUMB_FUNC_START LongPopup_WaitForPress
LongPopup_WaitForPress: @ 0x080113C0
	push {lr}
	adds r1, r0, #0
	ldr r0, [r1, #0x30]
	cmp r0, #0
	bge _080113E0
	ldr r0, _080113DC  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r0, [r0, #8]
	cmp r0, #0
	beq _080113F2
	adds r0, r1, #0
	bl Proc_Break
	b _080113F2
	.align 2, 0
_080113DC: .4byte gKeyStatusPtr
_080113E0:
	cmp r0, #0
	beq _080113F2
	subs r0, #1
	str r0, [r1, #0x30]
	cmp r0, #0
	bne _080113F2
	adds r0, r1, #0
	bl Proc_Break
_080113F2:
	pop {r0}
	bx r0

	THUMB_FUNC_END LongPopup_WaitForPress

	THUMB_FUNC_START LongPopup_Clear
LongPopup_Clear: @ 0x080113F8
	push {r4, r5, r6, r7, lr}
	adds r2, r0, #0
	adds r5, r2, #0
	adds r5, #0x38
	ldrb r0, [r5]
	adds r7, r2, #0
	adds r7, #0x37
	lsls r0, r0, #5
	ldrb r1, [r7]
	adds r0, r0, r1
	lsls r0, r0, #1
	ldr r1, _08011448  @ gBG0TilemapBuffer
	adds r0, r0, r1
	adds r6, r2, #0
	adds r6, #0x39
	ldrb r1, [r6]
	adds r4, r2, #0
	adds r4, #0x3a
	ldrb r2, [r4]
	movs r3, #0
	bl TileMap_FillRect
	ldrb r0, [r5]
	lsls r0, r0, #5
	ldrb r7, [r7]
	adds r0, r0, r7
	lsls r0, r0, #1
	ldr r1, _0801144C  @ gBG1TilemapBuffer
	adds r0, r0, r1
	ldrb r1, [r6]
	ldrb r2, [r4]
	movs r3, #0
	bl TileMap_FillRect
	movs r0, #3
	bl BG_EnableSyncByMask
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08011448: .4byte gBG0TilemapBuffer
_0801144C: .4byte gBG1TilemapBuffer

	THUMB_FUNC_END LongPopup_Clear

	THUMB_FUNC_START SetPopupUnit
SetPopupUnit: @ 0x08011450
	ldr r1, _08011458  @ gpPopupUnit
	str r0, [r1]
	bx lr
	.align 2, 0
_08011458: .4byte gpPopupUnit

	THUMB_FUNC_END SetPopupUnit

	THUMB_FUNC_START SetPopupItem
SetPopupItem: @ 0x0801145C
	ldr r1, _08011464  @ gPopupItem
	strh r0, [r1]
	bx lr
	.align 2, 0
_08011464: .4byte gPopupItem

	THUMB_FUNC_END SetPopupItem

	THUMB_FUNC_START SetPopupNumber
SetPopupNumber: @ 0x08011468
	ldr r1, _08011470  @ gPopupNumber
	str r0, [r1]
	bx lr
	.align 2, 0
_08011470: .4byte gPopupNumber

	THUMB_FUNC_END SetPopupNumber

	THUMB_FUNC_START NewPopupSimple
NewPopupSimple: @ 0x08011474
	push {r4, r5, lr}
	sub sp, #8
	movs r5, #0x90
	lsls r5, r5, #2
	movs r4, #4
	str r4, [sp]
	str r3, [sp, #4]
	adds r3, r5, #0
	bl NewPopup
	add sp, #8
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END NewPopupSimple

	THUMB_FUNC_START NewPopup
NewPopup: @ 0x08011490
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	adds r6, r2, #0
	adds r7, r3, #0
	ldr r1, [sp, #0x18]
	cmp r1, #0
	beq _080114AC
	ldr r0, _080114A8  @ gUnknown_085921C8
	bl Proc_StartBlocking
	b _080114B4
	.align 2, 0
_080114A8: .4byte gUnknown_085921C8
_080114AC:
	ldr r0, _080114D8  @ gUnknown_085921C8
	movs r1, #3
	bl Proc_Start
_080114B4:
	adds r1, r0, #0
	str r4, [r1, #0x30]
	str r5, [r1, #0x2c]
	adds r0, r1, #0
	adds r0, #0x36
	strb r6, [r0]
	adds r0, #0xa
	strh r7, [r0]
	ldr r0, [sp, #0x14]
	adds r0, #0x10
	adds r2, r1, #0
	adds r2, #0x42
	strb r0, [r2]
	adds r0, r1, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080114D8: .4byte gUnknown_085921C8

	THUMB_FUNC_END NewPopup

	THUMB_FUNC_START NewGotItemPopup
NewGotItemPopup: @ 0x080114DC
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r0, r1, #0
	adds r5, r2, #0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl SetPopupItem
	movs r0, #0xb
	ldrsb r0, [r4, r0]
	movs r1, #0xc0
	ands r0, r1
	cmp r0, #0
	bne _0801150C
	ldr r0, _08011508  @ gUnknown_08592230
	movs r1, #0x60
	movs r2, #0
	adds r3, r5, #0
	bl NewPopupSimple
	b _08011518
	.align 2, 0
_08011508: .4byte gUnknown_08592230
_0801150C:
	ldr r0, _08011520  @ gUnknown_08592288
	movs r1, #0x60
	movs r2, #0
	adds r3, r5, #0
	bl NewPopupSimple
_08011518:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08011520: .4byte gUnknown_08592288

	THUMB_FUNC_END NewGotItemPopup

	THUMB_FUNC_START ItemGot_DisplayLePopup
ItemGot_DisplayLePopup: @ 0x08011524
	push {lr}
	adds r2, r0, #0
	ldr r0, [r2, #0x54]
	ldr r1, [r2, #0x58]
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	bl NewGotItemPopup
	pop {r0}
	bx r0

	THUMB_FUNC_END ItemGot_DisplayLePopup

	THUMB_FUNC_START ItemGot_GotLeItem
ItemGot_GotLeItem: @ 0x08011538
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r5, [r4, #0x54]
	ldr r0, [r4, #0x58]
	bl MakeNewItem
	adds r1, r0, #0
	adds r0, r5, #0
	adds r2, r4, #0
	bl HandleNewItemGetFromDrop
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END ItemGot_GotLeItem

	THUMB_FUNC_START NewItemGot
NewItemGot: @ 0x08011554
	push {r4, r5, lr}
	adds r3, r0, #0
	adds r4, r1, #0
	lsls r2, r2, #0x10
	lsrs r5, r2, #0x10
	cmp r3, #7
	bhi _08011570
	ldr r0, _0801156C  @ gUnknown_085922D0
	adds r1, r3, #0
	bl Proc_Start
	b _08011578
	.align 2, 0
_0801156C: .4byte gUnknown_085922D0
_08011570:
	ldr r0, _08011598  @ gUnknown_085922D0
	adds r1, r3, #0
	bl Proc_StartBlocking
_08011578:
	str r5, [r0, #0x58]
	str r4, [r0, #0x54]
	movs r0, #0xb
	ldrsb r0, [r4, r0]
	movs r1, #0xc0
	ands r0, r1
	cmp r0, #0x80
	bne _08011592
	ldr r0, [r4, #0xc]
	movs r1, #0x80
	lsls r1, r1, #5
	orrs r0, r1
	str r0, [r4, #0xc]
_08011592:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08011598: .4byte gUnknown_085922D0

	THUMB_FUNC_END NewItemGot

	THUMB_FUNC_START NewGeneralItemGot
NewGeneralItemGot: @ 0x0801159C
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r2, #0
	lsls r1, r1, #0x10
	lsrs r2, r1, #0x10
	movs r0, #0xff
	ands r0, r2
	cmp r0, #0x9a
	blt _080115CC
	cmp r0, #0xa0
	ble _080115BA
	cmp r0, #0xb9
	bgt _080115CC
	cmp r0, #0xb8
	blt _080115CC
_080115BA:
	adds r0, r2, #0
	bl GetItemCost
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	bl NewGoldGotPopup
	b _080115D4
_080115CC:
	adds r0, r4, #0
	adds r1, r5, #0
	bl NewItemGot
_080115D4:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END NewGeneralItemGot

	THUMB_FUNC_START sub_80115DC
sub_80115DC: @ 0x080115DC
	push {r4, lr}
	adds r4, r1, #0
	bl SetPopupNumber
	ldr r0, _08011604  @ gActiveUnit
	ldr r0, [r0]
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #0xc0
	ands r0, r1
	cmp r0, #0
	bne _0801160C
	ldr r0, _08011608  @ gUnknown_08592300
	movs r1, #0x60
	movs r2, #0
	adds r3, r4, #0
	bl NewPopupSimple
	b _08011618
	.align 2, 0
_08011604: .4byte gActiveUnit
_08011608: .4byte gUnknown_08592300
_0801160C:
	ldr r0, _08011620  @ gUnknown_08592348
	movs r1, #0x60
	movs r2, #0
	adds r3, r4, #0
	bl NewPopupSimple
_08011618:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08011620: .4byte gUnknown_08592348

	THUMB_FUNC_END sub_80115DC

	THUMB_FUNC_START sub_8011624
sub_8011624: @ 0x08011624
	push {r4, lr}
	adds r4, r1, #0
	bl SetPopupNumber
	ldr r0, _08011640  @ gUnknown_08592300
	movs r1, #0x60
	movs r2, #0
	adds r3, r4, #0
	bl NewPopupSimple
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08011640: .4byte gUnknown_08592300

	THUMB_FUNC_END sub_8011624

	THUMB_FUNC_START NewGoldGotPopup
NewGoldGotPopup: @ 0x08011644
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	adds r0, r5, #0
	bl SetPopupNumber
	movs r0, #0xb
	ldrsb r0, [r4, r0]
	movs r1, #0xc0
	ands r0, r1
	cmp r0, #0
	bne _0801167C
	bl GetPartyGoldAmount
	adds r5, r5, r0
	adds r0, r5, #0
	bl SetPartyGoldAmount
	ldr r0, _08011678  @ gUnknown_08592300
	movs r1, #0x60
	movs r2, #0
	adds r3, r6, #0
	bl NewPopupSimple
	b _08011688
	.align 2, 0
_08011678: .4byte gUnknown_08592300
_0801167C:
	ldr r0, _08011690  @ gUnknown_08592348
	movs r1, #0x60
	movs r2, #0
	adds r3, r6, #0
	bl NewPopupSimple
_08011688:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08011690: .4byte gUnknown_08592348

	THUMB_FUNC_END NewGoldGotPopup

	THUMB_FUNC_START sub_8011694
sub_8011694: @ 0x08011694
	push {r4, lr}
	adds r4, r1, #0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl SetPopupItem
	ldr r0, _080116C0  @ gActiveUnit
	ldr r0, [r0]
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #0xc0
	ands r0, r1
	cmp r0, #0
	bne _080116C8
	ldr r0, _080116C4  @ gUnknown_08592380
	movs r1, #0x60
	movs r2, #0
	adds r3, r4, #0
	bl NewPopupSimple
	b _080116D4
	.align 2, 0
_080116C0: .4byte gActiveUnit
_080116C4: .4byte gUnknown_08592380
_080116C8:
	ldr r0, _080116DC  @ gUnknown_085923D8
	movs r1, #0x60
	movs r2, #0
	adds r3, r4, #0
	bl NewPopupSimple
_080116D4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080116DC: .4byte gUnknown_085923D8

	THUMB_FUNC_END sub_8011694

	THUMB_FUNC_START NewPopup_WeaponBroke
NewPopup_WeaponBroke: @ 0x080116E0
	push {r4, lr}
	adds r4, r1, #0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl SetPopupItem
	ldr r0, _08011700  @ gUnknown_08592420
	movs r1, #0x60
	movs r2, #0
	adds r3, r4, #0
	bl NewPopupSimple
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08011700: .4byte gUnknown_08592420

	THUMB_FUNC_END NewPopup_WeaponBroke

	THUMB_FUNC_START NewPopup_WRankIncrease
NewPopup_WRankIncrease: @ 0x08011704
	push {r4, lr}
	adds r4, r1, #0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl SetPopupItem
	ldr r0, _08011724  @ gUnknown_08592468
	movs r1, #0x60
	movs r2, #0
	adds r3, r4, #0
	bl NewPopupSimple
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08011724: .4byte gUnknown_08592468

	THUMB_FUNC_END NewPopup_WRankIncrease

	THUMB_FUNC_START sub_8011728
sub_8011728: @ 0x08011728
	push {r4, lr}
	adds r4, r0, #0
	lsls r0, r1, #0x18
	lsrs r0, r0, #0x18
	bl GetUnitFromCharId
	bl SetPopupUnit
	ldr r0, _0801174C  @ gUnknown_08592490
	movs r1, #0x60
	movs r2, #0
	adds r3, r4, #0
	bl NewPopupSimple
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0801174C: .4byte gUnknown_08592490

	THUMB_FUNC_END sub_8011728

	THUMB_FUNC_START sub_8011750
sub_8011750: @ 0x08011750
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r3, r2, #0
	ldr r0, _08011780  @ gUnknown_030005D0
	movs r4, #0
	movs r2, #0xc
	strb r2, [r0]
	str r1, [r0, #4]
	movs r1, #8
	strb r1, [r0, #8]
	str r4, [r0, #0xc]
	movs r1, #6
	strb r1, [r0, #0x10]
	str r5, [r0, #0x14]
	strb r4, [r0, #0x18]
	str r4, [r0, #0x1c]
	movs r1, #0x60
	movs r2, #0
	bl NewPopupSimple
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08011780: .4byte gUnknown_030005D0

	THUMB_FUNC_END sub_8011750

	.align 2, 0 @ Don't pad with nop.
