	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	THUMB_FUNC_START Shop6C_GetPortraitIndex
Shop6C_GetPortraitIndex: @ 0x080B4154
	ldr r1, _080B4164  @ gUnknown_08A3918C
	adds r0, #0x61
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	bx lr
	.align 2, 0
_080B4164: .4byte gUnknown_08A3918C

	THUMB_FUNC_END Shop6C_GetPortraitIndex

	THUMB_FUNC_START sub_80B4168
sub_80B4168: @ 0x080B4168
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, _080B41BC  @ gUnknown_08A39180
	adds r0, r5, #0
	adds r0, #0x61
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r4, r4, r0
	bl sub_8006978
	bl sub_8008250
	adds r0, r4, #0
	bl GetStringFromIndex
	adds r2, r0, #0
	movs r0, #8
	movs r1, #2
	adds r3, r5, #0
	bl sub_800698C
	movs r0, #0
	bl sub_8006B10
	movs r0, #1
	bl sub_8006AA8
	movs r0, #2
	bl sub_8006AA8
	movs r0, #4
	bl sub_8006AA8
	movs r0, #1
	bl sub_8007838
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B41BC: .4byte gUnknown_08A39180

	THUMB_FUNC_END sub_80B4168

	THUMB_FUNC_START sub_80B41C0
sub_80B41C0: @ 0x080B41C0
	push {lr}
	adds r3, r1, #0
	movs r1, #0
	movs r2, #0
	bl MakeShop
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80B41C0

	THUMB_FUNC_START sub_80B41D0
sub_80B41D0: @ 0x080B41D0
	push {lr}
	movs r2, #0
	movs r3, #0
	bl MakeShop
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80B41D0

	THUMB_FUNC_START MakeShopArmory
MakeShopArmory: @ 0x080B41E0
	push {lr}
	adds r3, r2, #0
	movs r2, #0
	bl MakeShop
	pop {r0}
	bx r0

	THUMB_FUNC_END MakeShopArmory

	THUMB_FUNC_START sub_80B41F0
sub_80B41F0: @ 0x080B41F0
	push {lr}
	movs r2, #1
	movs r3, #0
	bl MakeShop
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80B41F0

	THUMB_FUNC_START MakeShopVendor
MakeShopVendor: @ 0x080B4200
	push {lr}
	adds r3, r2, #0
	movs r2, #1
	bl MakeShop
	pop {r0}
	bx r0

	THUMB_FUNC_END MakeShopVendor

	THUMB_FUNC_START sub_80B4210
sub_80B4210: @ 0x080B4210
	push {lr}
	movs r2, #2
	movs r3, #0
	bl MakeShop
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80B4210

	THUMB_FUNC_START sub_80B4220
sub_80B4220: @ 0x080B4220
	push {lr}
	adds r3, r2, #0
	movs r2, #2
	bl MakeShop
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80B4220

	THUMB_FUNC_START sub_80B4230
sub_80B4230: @ 0x080B4230
	push {lr}
	movs r2, #0
	movs r3, #0
	bl MakeShop
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80B4230

	THUMB_FUNC_START MakeShop
MakeShop: @ 0x080B4240
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	adds r6, r1, #0
	adds r4, r3, #0
	lsls r2, r2, #0x18
	lsrs r5, r2, #0x18
	bl EndPlayerPhaseSideWindows
	cmp r4, #0
	beq _080B4268
	ldr r0, _080B4264  @ gUnknown_08A39210
	adds r1, r4, #0
	bl Proc_StartBlocking
	b _080B4270
	.align 2, 0
_080B4264: .4byte gUnknown_08A39210
_080B4268:
	ldr r0, _080B42AC  @ gUnknown_08A39210
	movs r1, #3
	bl Proc_Start
_080B4270:
	adds r7, r0, #0
	adds r0, r7, #0
	adds r0, #0x61
	strb r5, [r0]
	mov r0, r8
	str r0, [r7, #0x2c]
	ldr r5, _080B42B0  @ gUnknown_08A39170
	cmp r6, #0
	beq _080B4284
	adds r5, r6, #0
_080B4284:
	adds r4, r7, #0
	adds r4, #0x30
	movs r6, #0x14
_080B428A:
	ldrh r0, [r5]
	adds r5, #2
	bl MakeNewItem
	strh r0, [r4]
	adds r4, #2
	subs r6, #1
	cmp r6, #0
	bge _080B428A
	adds r0, r7, #0
	bl sub_80B42B4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B42AC: .4byte gUnknown_08A39210
_080B42B0: .4byte gUnknown_08A39170

	THUMB_FUNC_END MakeShop

	THUMB_FUNC_START sub_80B42B4
sub_80B42B4: @ 0x080B42B4
	push {r4, lr}
	adds r4, r0, #0
	movs r2, #0
	ldrh r0, [r4, #0x30]
	cmp r0, #0
	beq _080B42CE
	adds r1, r4, #0
	adds r1, #0x30
_080B42C4:
	adds r1, #2
	adds r2, #1
	ldrh r0, [r1]
	cmp r0, #0
	bne _080B42C4
_080B42CE:
	adds r0, r4, #0
	adds r0, #0x5a
	strb r2, [r0]
	ldr r0, [r4, #0x2c]
	bl GetUnitItemCount
	adds r1, r4, #0
	adds r1, #0x5b
	strb r0, [r1]
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80B42B4

	THUMB_FUNC_START sub_80B42E8
sub_80B42E8: @ 0x080B42E8
	push {lr}
	ldr r0, _080B4304  @ gUnknown_08A39210
	bl Proc_Find
	adds r1, r0, #0
	adds r0, #0x60
	ldrb r0, [r0]
	cmp r0, #0
	beq _080B4300
	adds r0, r1, #0
	bl sub_80B4F04
_080B4300:
	pop {r0}
	bx r0
	.align 2, 0
_080B4304: .4byte gUnknown_08A39210

	THUMB_FUNC_END sub_80B42E8

	THUMB_FUNC_START sub_80B4308
sub_80B4308: @ 0x080B4308
	push {lr}
	ldr r0, _080B4324  @ gUnknown_08A39210
	bl Proc_Find
	adds r1, r0, #0
	adds r0, #0x60
	ldrb r0, [r0]
	cmp r0, #1
	beq _080B4320
	adds r0, r1, #0
	bl sub_80B505C
_080B4320:
	pop {r0}
	bx r0
	.align 2, 0
_080B4324: .4byte gUnknown_08A39210

	THUMB_FUNC_END sub_80B4308

	THUMB_FUNC_START sub_80B4328
sub_80B4328: @ 0x080B4328
	bx lr

	THUMB_FUNC_END sub_80B4328

	THUMB_FUNC_START sub_80B432C
sub_80B432C: @ 0x080B432C
	push {lr}
	adds r1, r0, #0
	ldr r0, [r1, #0x2c]
	cmp r0, #0
	bne _080B4340
	adds r0, r1, #0
	movs r1, #0xd
	bl Proc_Goto
	b _080B4346
_080B4340:
	ldr r0, _080B434C  @ 0x0000089A
	bl sub_80B4168
_080B4346:
	pop {r0}
	bx r0
	.align 2, 0
_080B434C: .4byte 0x0000089A

	THUMB_FUNC_END sub_80B432C

	THUMB_FUNC_START sub_80B4350
sub_80B4350: @ 0x080B4350
	push {r4, lr}
	adds r4, r0, #0
	bl sub_8008A00
	cmp r0, #1
	beq _080B436E
	cmp r0, #1
	ble _080B4364
	cmp r0, #2
	beq _080B4378
_080B4364:
	adds r0, r4, #0
	movs r1, #0xc
	bl Proc_Goto
	b _080B43A0
_080B436E:
	adds r0, r4, #0
	movs r1, #1
	bl Proc_Goto
	b _080B43A0
_080B4378:
	ldr r0, [r4, #0x2c]
	bl GetUnitItemCount
	cmp r0, #0
	bne _080B4398
	ldr r0, _080B4394  @ 0x000008AC
	adds r1, r4, #0
	bl sub_80B4168
	adds r0, r4, #0
	movs r1, #7
	bl Proc_Goto
	b _080B43A0
	.align 2, 0
_080B4394: .4byte 0x000008AC
_080B4398:
	adds r0, r4, #0
	movs r1, #4
	bl Proc_Goto
_080B43A0:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80B4350

	THUMB_FUNC_START sub_80B43A8
sub_80B43A8: @ 0x080B43A8
	push {lr}
	adds r1, r0, #0
	ldr r0, _080B43B8  @ 0x000008A3
	bl sub_80B4168
	pop {r0}
	bx r0
	.align 2, 0
_080B43B8: .4byte 0x000008A3

	THUMB_FUNC_END sub_80B43A8

	THUMB_FUNC_START sub_80B43BC
sub_80B43BC: @ 0x080B43BC
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r5, r1, #0
	adds r0, r5, #0
	movs r1, #6
	bl DivRem
	adds r4, r0, #0
	movs r0, #0
	bl SetFont
	bl Font_LoadForUI
	movs r0, #4
	bl BG_EnableSyncByMask
	lsls r4, r4, #3
	ldr r0, _080B4410  @ gUnknown_0203EF68
	adds r4, r4, r0
	adds r0, r4, #0
	bl Text_Clear
	lsls r5, r5, #1
	adds r0, r6, #0
	adds r0, #0x30
	adds r0, r0, r5
	ldrh r1, [r0]
	cmp r1, #0
	beq _080B4408
	ldr r2, [r6, #0x2c]
	movs r3, #0x1f
	ands r3, r5
	lsls r3, r3, #6
	ldr r0, _080B4414  @ gUnknown_02023CB6
	adds r3, r3, r0
	adds r0, r4, #0
	bl sub_80B5164
_080B4408:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B4410: .4byte gUnknown_0203EF68
_080B4414: .4byte gUnknown_02023CB6

	THUMB_FUNC_END sub_80B43BC

	THUMB_FUNC_START sub_80B4418
sub_80B4418: @ 0x080B4418
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r5, r1, #0
	adds r0, r5, #0
	movs r1, #6
	bl DivRem
	adds r4, r0, #0
	movs r0, #0
	bl SetFont
	bl Font_LoadForUI
	movs r0, #4
	bl BG_EnableSyncByMask
	lsls r4, r4, #3
	ldr r0, _080B446C  @ gUnknown_0203EF68
	adds r4, r4, r0
	adds r0, r4, #0
	bl Text_Clear
	lsls r5, r5, #1
	adds r0, r6, #0
	adds r0, #0x30
	adds r0, r0, r5
	ldrh r1, [r0]
	cmp r1, #0
	beq _080B4464
	ldr r2, [r6, #0x2c]
	movs r3, #0x1f
	ands r3, r5
	lsls r3, r3, #6
	ldr r0, _080B4470  @ gUnknown_02023CB6
	adds r3, r3, r0
	adds r0, r4, #0
	bl sub_80B51C0
_080B4464:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B446C: .4byte gUnknown_0203EF68
_080B4470: .4byte gUnknown_02023CB6

	THUMB_FUNC_END sub_80B4418

	THUMB_FUNC_START sub_80B4474
sub_80B4474: @ 0x080B4474
	push {lr}
	sub sp, #0xc
	mov ip, r0
	adds r0, #0x5e
	ldrb r0, [r0]
	mov r1, ip
	adds r1, #0x5a
	ldrb r1, [r1]
	mov r2, ip
	adds r2, #0x5f
	ldrb r3, [r2]
	movs r2, #0x48
	str r2, [sp]
	ldr r2, _080B44A4  @ sub_80B43BC
	str r2, [sp, #4]
	mov r2, ip
	str r2, [sp, #8]
	movs r2, #5
	bl sub_80B55AC
	add sp, #0xc
	pop {r0}
	bx r0
	.align 2, 0
_080B44A4: .4byte sub_80B43BC

	THUMB_FUNC_END sub_80B4474

	THUMB_FUNC_START sub_80B44A8
sub_80B44A8: @ 0x080B44A8
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	bl sub_80B5604
	bl sub_80B5698
	adds r2, r0, #0
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #2
	movs r1, #0
	bl BG_SetPosition
	adds r6, r5, #0
	adds r6, #0x5c
	ldrb r4, [r6]
	bl sub_80B568C
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	eors r0, r4
	negs r1, r0
	orrs r1, r0
	lsrs r7, r1, #0x1f
	bl sub_80B568C
	strb r0, [r6]
	bl sub_80B56A8
	adds r4, r5, #0
	adds r4, #0x5d
	strb r0, [r4]
	ldrb r0, [r6]
	adds r1, r5, #0
	adds r1, #0x5e
	strb r0, [r1]
	ldrb r0, [r4]
	adds r1, #1
	strb r0, [r1]
	ldrb r1, [r6]
	lsls r1, r1, #4
	ldrb r0, [r4]
	lsls r0, r0, #4
	subs r0, #0x48
	subs r1, r1, r0
	movs r0, #0x38
	bl DisplayUiHand
	adds r0, r5, #0
	adds r0, #0x62
	ldrb r0, [r0]
	cmp r0, #0
	beq _080B4532
	cmp r7, #0
	beq _080B4532
	ldrb r2, [r6]
	lsls r1, r2, #4
	ldrb r0, [r4]
	lsls r0, r0, #4
	subs r0, #0x48
	subs r1, r1, r0
	lsls r2, r2, #1
	adds r0, r5, #0
	adds r0, #0x30
	adds r0, r0, r2
	ldrh r2, [r0]
	movs r0, #0x38
	bl StartItemHelpBox
_080B4532:
	bl sub_80B5384
	bl sub_80B56CC
	lsls r0, r0, #0x18
	asrs r3, r0, #0x18
	cmp r3, #0
	bne _080B4626
	adds r2, r5, #0
	adds r2, #0x62
	ldrb r0, [r2]
	cmp r0, #0
	beq _080B4568
	ldr r0, _080B4564  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0x81
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080B4626
	strb r3, [r2]
	bl CloseHelpBox
	b _080B4626
	.align 2, 0
_080B4564: .4byte gKeyStatusPtr
_080B4568:
	ldr r6, _080B45A0  @ gKeyStatusPtr
	ldr r0, [r6]
	ldrh r1, [r0, #8]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080B45A4
	movs r0, #1
	strb r0, [r2]
	adds r0, r5, #0
	adds r0, #0x5c
	ldrb r2, [r0]
	lsls r1, r2, #4
	adds r0, #1
	ldrb r0, [r0]
	lsls r0, r0, #4
	subs r0, #0x48
	subs r1, r1, r0
	lsls r2, r2, #1
	adds r0, r5, #0
	adds r0, #0x30
	adds r0, r0, r2
	ldrh r2, [r0]
	movs r0, #0x38
	bl StartItemHelpBox
	b _080B4626
	.align 2, 0
_080B45A0: .4byte gKeyStatusPtr
_080B45A4:
	ldr r0, [r5, #0x2c]
	adds r1, r5, #0
	adds r1, #0x5c
	ldrb r2, [r1]
	lsls r2, r2, #1
	subs r1, #0x2c
	adds r1, r1, r2
	ldrh r1, [r1]
	bl sub_80B5220
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	ldr r0, [r6]
	ldrh r1, [r0, #8]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080B4604
	bl GetPartyGoldAmount
	cmp r4, r0
	ble _080B45E8
	ldr r0, _080B45E4  @ 0x000008B2
	adds r1, r5, #0
	bl sub_80B4168
	adds r0, r5, #0
	movs r1, #1
	bl Proc_Goto
	b _080B4626
	.align 2, 0
_080B45E4: .4byte 0x000008B2
_080B45E8:
	adds r0, r4, #0
	bl sub_8008A18
	ldr r0, _080B4600  @ 0x000008B5
	adds r1, r5, #0
	bl sub_80B4168
	adds r0, r5, #0
	bl Proc_Break
	b _080B4626
	.align 2, 0
_080B4600: .4byte 0x000008B5
_080B4604:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080B4626
	ldr r0, _080B462C  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080B461E
	movs r0, #0x6b
	bl m4aSongNumStart
_080B461E:
	adds r0, r5, #0
	movs r1, #7
	bl Proc_Goto
_080B4626:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B462C: .4byte gRAMChapterData

	THUMB_FUNC_END sub_80B44A8

	THUMB_FUNC_START sub_80B4630
sub_80B4630: @ 0x080B4630
	push {r4, lr}
	adds r4, r0, #0
	bl sub_8008A00
	cmp r0, #1
	beq _080B4644
	adds r0, r4, #0
	movs r1, #1
	bl Proc_Goto
_080B4644:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80B4630

	THUMB_FUNC_START sub_80B464C
sub_80B464C: @ 0x080B464C
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x5b
	ldrb r0, [r0]
	cmp r0, #4
	bls _080B4688
	bl HasConvoyAccess
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080B4670
	ldr r0, _080B466C  @ 0x000008BE
	adds r1, r4, #0
	bl sub_80B4168
	b _080B46AA
	.align 2, 0
_080B466C: .4byte 0x000008BE
_080B4670:
	ldr r0, _080B4684  @ 0x000008C1
	adds r1, r4, #0
	bl sub_80B4168
	adds r0, r4, #0
	movs r1, #0xb
	bl Proc_Goto
	b _080B46AA
	.align 2, 0
_080B4684: .4byte 0x000008C1
_080B4688:
	ldr r0, [r4, #0x2c]
	adds r1, r4, #0
	adds r1, #0x5c
	ldrb r2, [r1]
	lsls r2, r2, #1
	subs r1, #0x2c
	adds r1, r1, r2
	ldrh r1, [r1]
	bl UnitAddItem
	adds r0, r4, #0
	bl sub_80B5440
	adds r0, r4, #0
	movs r1, #3
	bl Proc_Goto
_080B46AA:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80B464C

	THUMB_FUNC_START sub_80B46B0
sub_80B46B0: @ 0x080B46B0
	push {r4, lr}
	adds r4, r0, #0
	bl sub_8008A00
	cmp r0, #1
	beq _080B46C4
	adds r0, r4, #0
	movs r1, #0xb
	bl Proc_Goto
_080B46C4:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80B46B0

	THUMB_FUNC_START sub_80B46CC
sub_80B46CC: @ 0x080B46CC
	push {r4, lr}
	adds r4, r0, #0
	bl HasConvoyAccess
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080B46E8
	ldr r0, _080B46E4  @ 0x000008C7
	adds r1, r4, #0
	bl sub_80B4168
	b _080B46F0
	.align 2, 0
_080B46E4: .4byte 0x000008C7
_080B46E8:
	ldr r0, _080B46F8  @ 0x000008CA
	adds r1, r4, #0
	bl sub_80B4168
_080B46F0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B46F8: .4byte 0x000008CA

	THUMB_FUNC_END sub_80B46CC

	THUMB_FUNC_START sub_80B46FC
sub_80B46FC: @ 0x080B46FC
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x5c
	ldrb r1, [r0]
	lsls r1, r1, #1
	subs r0, #0x2c
	adds r0, r0, r1
	ldrh r0, [r0]
	bl AddItemToConvoy
	adds r0, r4, #0
	bl sub_80B5440
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80B46FC

	THUMB_FUNC_START sub_80B471C
sub_80B471C: @ 0x080B471C
	push {lr}
	adds r1, r0, #0
	ldr r0, _080B472C  @ 0x000008C4
	bl sub_80B4168
	pop {r0}
	bx r0
	.align 2, 0
_080B472C: .4byte 0x000008C4

	THUMB_FUNC_END sub_80B471C

	THUMB_FUNC_START sub_80B4730
sub_80B4730: @ 0x080B4730
	push {r4, lr}
	adds r4, r0, #0
	bl GetConvoyItemCount
	cmp r0, #0x63
	bgt _080B4744
	adds r0, r4, #0
	movs r1, #0xa
	bl Proc_Goto
_080B4744:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80B4730

	THUMB_FUNC_START sub_80B474C
sub_80B474C: @ 0x080B474C
	push {lr}
	adds r1, r0, #0
	ldr r0, _080B475C  @ 0x000008CD
	bl sub_80B4168
	pop {r0}
	bx r0
	.align 2, 0
_080B475C: .4byte 0x000008CD

	THUMB_FUNC_END sub_80B474C

	THUMB_FUNC_START sub_80B4760
sub_80B4760: @ 0x080B4760
	push {lr}
	adds r1, r0, #0
	ldr r0, _080B4770  @ 0x000008A6
	bl sub_80B4168
	pop {r0}
	bx r0
	.align 2, 0
_080B4770: .4byte 0x000008A6

	THUMB_FUNC_END sub_80B4760

	THUMB_FUNC_START sub_80B4774
sub_80B4774: @ 0x080B4774
	push {lr}
	adds r1, r0, #0
	ldr r0, _080B4784  @ 0x000008A9
	bl sub_80B4168
	pop {r0}
	bx r0
	.align 2, 0
_080B4784: .4byte 0x000008A9

	THUMB_FUNC_END sub_80B4774

	THUMB_FUNC_START sub_80B4788
sub_80B4788: @ 0x080B4788
	push {lr}
	sub sp, #0xc
	adds r1, r0, #0
	adds r1, #0x5c
	ldrb r3, [r1]
	subs r1, #1
	ldrb r1, [r1]
	movs r2, #0x48
	str r2, [sp]
	ldr r2, _080B47B0  @ sub_80B4418
	str r2, [sp, #4]
	str r0, [sp, #8]
	adds r0, r3, #0
	movs r2, #5
	movs r3, #0
	bl sub_80B55AC
	add sp, #0xc
	pop {r0}
	bx r0
	.align 2, 0
_080B47B0: .4byte sub_80B4418

	THUMB_FUNC_END sub_80B4788

	THUMB_FUNC_START sub_80B47B4
sub_80B47B4: @ 0x080B47B4
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	bl sub_80B5604
	bl sub_80B5698
	adds r2, r0, #0
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #2
	movs r1, #0
	bl BG_SetPosition
	adds r6, r5, #0
	adds r6, #0x5c
	ldrb r4, [r6]
	bl sub_80B568C
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	eors r0, r4
	negs r1, r0
	orrs r1, r0
	lsrs r7, r1, #0x1f
	bl sub_80B568C
	strb r0, [r6]
	bl sub_80B56A8
	adds r4, r5, #0
	adds r4, #0x5d
	strb r0, [r4]
	ldrb r1, [r6]
	lsls r1, r1, #4
	ldrb r0, [r4]
	lsls r0, r0, #4
	subs r0, #0x48
	subs r1, r1, r0
	movs r0, #0x38
	bl DisplayUiHand
	adds r0, r5, #0
	adds r0, #0x62
	ldrb r0, [r0]
	cmp r0, #0
	beq _080B4830
	cmp r7, #0
	beq _080B4830
	ldrb r2, [r6]
	lsls r1, r2, #4
	ldrb r0, [r4]
	lsls r0, r0, #4
	subs r0, #0x48
	subs r1, r1, r0
	ldr r0, [r5, #0x2c]
	lsls r2, r2, #1
	adds r0, #0x1e
	adds r0, r0, r2
	ldrh r2, [r0]
	movs r0, #0x38
	bl StartItemHelpBox
_080B4830:
	bl sub_80B56CC
	lsls r0, r0, #0x18
	asrs r3, r0, #0x18
	cmp r3, #0
	bne _080B4926
	adds r2, r5, #0
	adds r2, #0x62
	ldrb r0, [r2]
	cmp r0, #0
	beq _080B4864
	ldr r0, _080B4860  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0x81
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080B4926
	strb r3, [r2]
	bl CloseHelpBox
	b _080B4926
	.align 2, 0
_080B4860: .4byte gKeyStatusPtr
_080B4864:
	ldr r0, _080B489C  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080B48A0
	movs r0, #1
	strb r0, [r2]
	adds r0, r5, #0
	adds r0, #0x5c
	ldrb r2, [r0]
	lsls r1, r2, #4
	adds r0, #1
	ldrb r0, [r0]
	lsls r0, r0, #4
	subs r0, #0x48
	subs r1, r1, r0
	ldr r0, [r5, #0x2c]
	lsls r2, r2, #1
	adds r0, #0x1e
	adds r0, r0, r2
	ldrh r2, [r0]
	movs r0, #0x38
	bl StartItemHelpBox
	b _080B4926
	.align 2, 0
_080B489C: .4byte gKeyStatusPtr
_080B48A0:
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080B4904
	ldr r1, [r5, #0x2c]
	adds r4, r5, #0
	adds r4, #0x5c
	ldrb r0, [r4]
	lsls r0, r0, #1
	adds r1, #0x1e
	adds r1, r1, r0
	ldrh r0, [r1]
	bl sub_80B527C
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080B48D8
	ldr r0, _080B48D4  @ 0x000008BB
	adds r1, r5, #0
	bl sub_80B4168
	adds r0, r5, #0
	movs r1, #4
	bl Proc_Goto
	b _080B4926
	.align 2, 0
_080B48D4: .4byte 0x000008BB
_080B48D8:
	ldr r1, [r5, #0x2c]
	ldrb r0, [r4]
	lsls r0, r0, #1
	adds r1, #0x1e
	adds r1, r1, r0
	ldrh r0, [r1]
	bl sub_80B5268
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl sub_8008A18
	ldr r0, _080B4900  @ 0x000008B5
	adds r1, r5, #0
	bl sub_80B4168
	adds r0, r5, #0
	bl Proc_Break
	b _080B4926
	.align 2, 0
_080B4900: .4byte 0x000008B5
_080B4904:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080B4926
	ldr r0, _080B492C  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080B491E
	movs r0, #0x6b
	bl m4aSongNumStart
_080B491E:
	adds r0, r5, #0
	movs r1, #8
	bl Proc_Goto
_080B4926:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B492C: .4byte gRAMChapterData

	THUMB_FUNC_END sub_80B47B4

	THUMB_FUNC_START sub_80B4930
sub_80B4930: @ 0x080B4930
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	bl sub_8008A00
	cmp r0, #1
	bne _080B49A8
	movs r0, #0xb9
	movs r1, #8
	bl sub_8014B88
	ldr r1, _080B49A0  @ gActionData
	movs r0, #0x17
	strb r0, [r1, #0x11]
	bl GetPartyGoldAmount
	adds r4, r0, #0
	ldr r1, [r6, #0x2c]
	adds r5, r6, #0
	adds r5, #0x5c
	ldrb r0, [r5]
	lsls r0, r0, #1
	adds r1, #0x1e
	adds r1, r1, r0
	ldrh r0, [r1]
	bl sub_80B5268
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r4, r4, r0
	adds r0, r4, #0
	bl SetPartyGoldAmount
	ldr r0, [r6, #0x2c]
	ldrb r1, [r5]
	bl UnitRemoveItem
	adds r0, r6, #0
	bl sub_80B42B4
	adds r0, r6, #0
	bl sub_80B505C
	ldr r0, _080B49A4  @ gUnknown_02022E5E
	bl sub_80B4ED4
	adds r0, r6, #0
	adds r0, #0x5b
	ldrb r0, [r0]
	cmp r0, #0
	bne _080B49B0
	adds r0, r6, #0
	movs r1, #7
	bl Proc_Goto
	b _080B49B0
	.align 2, 0
_080B49A0: .4byte gActionData
_080B49A4: .4byte gUnknown_02022E5E
_080B49A8:
	adds r0, r6, #0
	movs r1, #4
	bl Proc_Goto
_080B49B0:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80B4930

	THUMB_FUNC_START sub_80B49B8
sub_80B49B8: @ 0x080B49B8
	push {lr}
	adds r1, r0, #0
	ldr r0, _080B49C8  @ 0x000008AF
	bl sub_80B4168
	pop {r0}
	bx r0
	.align 2, 0
_080B49C8: .4byte 0x000008AF

	THUMB_FUNC_END sub_80B49B8

	THUMB_FUNC_START sub_80B49CC
sub_80B49CC: @ 0x080B49CC
	push {lr}
	adds r1, r0, #0
	adds r2, r1, #0
	adds r2, #0x5c
	movs r0, #0
	strb r0, [r2]
	ldr r0, _080B49E4  @ 0x0000089D
	bl sub_80B4168
	pop {r0}
	bx r0
	.align 2, 0
_080B49E4: .4byte 0x0000089D

	THUMB_FUNC_END sub_80B49CC

	THUMB_FUNC_START sub_80B49E8
sub_80B49E8: @ 0x080B49E8
	push {lr}
	adds r1, r0, #0
	movs r0, #0x8a
	lsls r0, r0, #4
	bl sub_80B4168
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80B49E8

	THUMB_FUNC_START sub_80B49F8
sub_80B49F8: @ 0x080B49F8
	push {lr}
	adds r1, r0, #0
	ldr r0, [r1, #0x2c]
	cmp r0, #0
	bne _080B4A10
	ldr r0, _080B4A0C  @ 0x00000898
	bl sub_80B4168
	b _080B4A16
	.align 2, 0
_080B4A0C: .4byte 0x00000898
_080B4A10:
	ldr r0, _080B4A1C  @ 0x000008B8
	bl sub_80B4168
_080B4A16:
	pop {r0}
	bx r0
	.align 2, 0
_080B4A1C: .4byte 0x000008B8

	THUMB_FUNC_END sub_80B49F8

	THUMB_FUNC_START sub_80B4A20
sub_80B4A20: @ 0x080B4A20
	push {lr}
	ldr r0, _080B4A34  @ gUnknown_08A394C0
	bl Proc_EndEach
	ldr r0, _080B4A38  @ gProcScr_MoveUnit
	ldr r1, _080B4A3C  @ MU_Show
	bl Proc_ForEach
	pop {r0}
	bx r0
	.align 2, 0
_080B4A34: .4byte gUnknown_08A394C0
_080B4A38: .4byte gProcScr_MoveUnit
_080B4A3C: .4byte MU_Show

	THUMB_FUNC_END sub_80B4A20

	THUMB_FUNC_START sub_80B4A40
sub_80B4A40: @ 0x080B4A40
	push {lr}
	adds r1, r0, #0
	ldr r0, _080B4A50  @ 0x00000896
	bl sub_80B4168
	pop {r0}
	bx r0
	.align 2, 0
_080B4A50: .4byte 0x00000896

	THUMB_FUNC_END sub_80B4A40

	THUMB_FUNC_START sub_80B4A54
sub_80B4A54: @ 0x080B4A54
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	bl sub_80B5604
	bl sub_80B5698
	adds r2, r0, #0
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #2
	movs r1, #0
	bl BG_SetPosition
	adds r6, r5, #0
	adds r6, #0x5c
	ldrb r4, [r6]
	bl sub_80B568C
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	eors r0, r4
	negs r1, r0
	orrs r1, r0
	lsrs r7, r1, #0x1f
	bl sub_80B568C
	strb r0, [r6]
	bl sub_80B56A8
	adds r4, r5, #0
	adds r4, #0x5d
	strb r0, [r4]
	ldrb r0, [r6]
	adds r1, r5, #0
	adds r1, #0x5e
	strb r0, [r1]
	ldrb r0, [r4]
	adds r1, #1
	strb r0, [r1]
	ldrb r1, [r6]
	lsls r1, r1, #4
	ldrb r0, [r4]
	lsls r0, r0, #4
	subs r0, #0x48
	subs r1, r1, r0
	movs r0, #0x38
	bl DisplayUiHand
	adds r0, r5, #0
	adds r0, #0x62
	ldrb r0, [r0]
	cmp r0, #0
	beq _080B4ADE
	cmp r7, #0
	beq _080B4ADE
	ldrb r2, [r6]
	lsls r1, r2, #4
	ldrb r0, [r4]
	lsls r0, r0, #4
	subs r0, #0x48
	subs r1, r1, r0
	lsls r2, r2, #1
	adds r0, r5, #0
	adds r0, #0x30
	adds r0, r0, r2
	ldrh r2, [r0]
	movs r0, #0x38
	bl StartItemHelpBox
_080B4ADE:
	bl sub_80B5384
	bl sub_80B56CC
	lsls r0, r0, #0x18
	asrs r3, r0, #0x18
	cmp r3, #0
	bne _080B4B72
	adds r2, r5, #0
	adds r2, #0x62
	ldrb r0, [r2]
	cmp r0, #0
	beq _080B4B14
	ldr r0, _080B4B10  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0x81
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080B4B72
	strb r3, [r2]
	bl CloseHelpBox
	b _080B4B72
	.align 2, 0
_080B4B10: .4byte gKeyStatusPtr
_080B4B14:
	ldr r0, _080B4B4C  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080B4B50
	movs r0, #1
	strb r0, [r2]
	adds r0, r5, #0
	adds r0, #0x5c
	ldrb r2, [r0]
	lsls r1, r2, #4
	adds r0, #1
	ldrb r0, [r0]
	lsls r0, r0, #4
	subs r0, #0x48
	subs r1, r1, r0
	lsls r2, r2, #1
	adds r0, r5, #0
	adds r0, #0x30
	adds r0, r0, r2
	ldrh r2, [r0]
	movs r0, #0x38
	bl StartItemHelpBox
	b _080B4B72
	.align 2, 0
_080B4B4C: .4byte gKeyStatusPtr
_080B4B50:
	movs r0, #3
	ands r0, r1
	cmp r0, #0
	beq _080B4B72
	ldr r0, _080B4B78  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080B4B6A
	movs r0, #0x6b
	bl m4aSongNumStart
_080B4B6A:
	adds r0, r5, #0
	movs r1, #0xc
	bl Proc_Goto
_080B4B72:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B4B78: .4byte gRAMChapterData

	THUMB_FUNC_END sub_80B4A54

	THUMB_FUNC_START sub_80B4B7C
sub_80B4B7C: @ 0x080B4B7C
	push {lr}
	adds r2, r0, #0
	ldr r0, _080B4BA4  @ gGameState
	ldrb r1, [r0, #4]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	bne _080B4BA0
	ldr r0, _080B4BA8  @ gUnknown_03005280
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _080B4BA0
	ldr r0, _080B4BAC  @ gUnknown_08A39198
	adds r1, r2, #0
	bl Proc_StartBlocking
_080B4BA0:
	pop {r0}
	bx r0
	.align 2, 0
_080B4BA4: .4byte gGameState
_080B4BA8: .4byte gUnknown_03005280
_080B4BAC: .4byte gUnknown_08A39198

	THUMB_FUNC_END sub_80B4B7C

	THUMB_FUNC_START sub_80B4BB0
sub_80B4BB0: @ 0x080B4BB0
	push {lr}
	adds r2, r0, #0
	ldr r0, _080B4BD8  @ gGameState
	ldrb r1, [r0, #4]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	bne _080B4BE4
	ldr r0, _080B4BDC  @ gUnknown_03005280
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _080B4BE4
	ldr r0, _080B4BE0  @ gUnknown_08A391D0
	adds r1, r2, #0
	bl Proc_StartBlocking
	b _080B4BE8
	.align 2, 0
_080B4BD8: .4byte gGameState
_080B4BDC: .4byte gUnknown_03005280
_080B4BE0: .4byte gUnknown_08A391D0
_080B4BE4:
	bl ResetDialogueScreen
_080B4BE8:
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80B4BB0

	THUMB_FUNC_START sub_80B4BEC
sub_80B4BEC: @ 0x080B4BEC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r6, r0, #0
	adds r0, #0x61
	ldrb r0, [r0]
	cmp r0, #0
	bne _080B4C0C
	movs r0, #0x36
	movs r1, #0
	bl Sound_PlaySong80024D4
	b _080B4C14
_080B4C0C:
	movs r0, #0x35
	movs r1, #0
	bl Sound_PlaySong80024D4
_080B4C14:
	ldr r0, _080B4DF8  @ gProcScr_MoveUnit
	ldr r1, _080B4DFC  @ MU_Hide
	bl Proc_ForEach
	bl sub_80B52CC
	ldr r3, _080B4E00  @ gLCDControlBuffer
	ldrb r1, [r3, #0xc]
	movs r2, #4
	negs r2, r2
	adds r0, r2, #0
	ands r0, r1
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
	movs r0, #0x80
	lsls r0, r0, #2
	movs r1, #2
	movs r2, #0
	bl sub_800680C
	bl ResetFaces
	adds r0, r6, #0
	adds r0, #0x5c
	movs r4, #0
	strb r4, [r0]
	adds r0, #2
	strb r4, [r0]
	adds r0, #1
	strb r4, [r0]
	subs r0, #2
	strb r4, [r0]
	adds r0, #3
	strb r4, [r0]
	adds r0, #2
	strb r4, [r0]
	movs r0, #0x90
	lsls r0, r0, #2
	movs r1, #3
	bl sub_80B53BC
	adds r0, r6, #0
	bl Shop6C_GetPortraitIndex
	movs r1, #1
	str r1, [sp]
	movs r1, #0x20
	movs r2, #8
	movs r3, #3
	bl sub_8007938
	ldr r0, _080B4E04  @ gUnknown_089AD934
	ldr r5, _080B4E08  @ gUnknown_02020188
	adds r1, r5, #0
	bl CopyDataWithPossibleUncomp
	ldr r0, _080B4E0C  @ gBG1TilemapBuffer
	movs r2, #0x80
	lsls r2, r2, #5
	adds r1, r5, #0
	bl CallARM_FillTileRect
	str r4, [sp]
	movs r0, #6
	movs r1, #8
	movs r2, #0x14
	movs r3, #0xc
	bl DrawUiFrame2
	movs r0, #2
	bl BG_EnableSyncByMask
	adds r0, r6, #0
	bl sub_80B4E24
	ldr r5, _080B4E10  @ gUnknown_0203EF68
	movs r4, #5
_080B4CC6:
	adds r0, r5, #0
	movs r1, #0x14
	bl Text_Init
	adds r5, #8
	subs r4, #1
	cmp r4, #0
	bge _080B4CC6
	adds r0, r6, #0
	bl sub_80B4F90
	ldr r0, _080B4E00  @ gLCDControlBuffer
	mov ip, r0
	ldrb r0, [r0, #1]
	movs r1, #0x20
	orrs r0, r1
	movs r1, #0x40
	orrs r0, r1
	movs r1, #0x7f
	ands r0, r1
	mov r3, ip
	strb r0, [r3, #1]
	movs r5, #0x34
	add r5, ip
	mov r9, r5
	ldrb r4, [r5]
	movs r6, #1
	orrs r4, r6
	movs r5, #2
	orrs r4, r5
	movs r0, #4
	orrs r4, r0
	movs r3, #8
	orrs r4, r3
	movs r0, #0x10
	orrs r4, r0
	movs r1, #0x35
	add r1, ip
	mov sl, r1
	ldrb r2, [r1]
	orrs r2, r6
	orrs r2, r5
	movs r1, #5
	negs r1, r1
	mov r8, r1
	ands r2, r1
	orrs r2, r3
	orrs r2, r0
	mov r7, ip
	adds r7, #0x36
	ldrb r1, [r7]
	orrs r1, r6
	orrs r1, r5
	mov r5, r8
	ands r1, r5
	orrs r1, r3
	orrs r1, r0
	mov r0, ip
	adds r0, #0x2d
	movs r6, #0
	movs r3, #0x38
	mov r8, r3
	mov r5, r8
	strb r5, [r0]
	mov r3, ip
	adds r3, #0x31
	movs r0, #0x48
	strb r0, [r3]
	mov r0, ip
	adds r0, #0x2c
	movs r5, #0xf0
	strb r5, [r0]
	subs r3, #1
	movs r0, #0x98
	strb r0, [r3]
	mov r0, ip
	adds r0, #0x2f
	strb r6, [r0]
	adds r3, #3
	movs r0, #8
	strb r0, [r3]
	mov r0, ip
	adds r0, #0x2e
	strb r5, [r0]
	adds r0, #4
	mov r3, r8
	strb r3, [r0]
	movs r0, #0x21
	negs r0, r0
	ands r4, r0
	mov r5, r9
	strb r4, [r5]
	movs r3, #0x20
	orrs r2, r3
	mov r5, sl
	strb r2, [r5]
	ands r1, r0
	strb r1, [r7]
	movs r0, #3
	movs r1, #0
	movs r2, #0
	movs r3, #8
	bl SetSpecialColorEffectsParameters
	str r6, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #1
	bl SetBlendTargetA
	str r6, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl SetBlendTargetB
	ldr r0, _080B4E14  @ gUnknown_08B1754C
	movs r1, #0xe0
	lsls r1, r1, #1
	movs r2, #0x20
	bl CopyToPaletteBuffer
	ldr r4, _080B4E18  @ gUnknown_08B12DB4
	movs r0, #3
	bl GetBackgroundTileDataOffset
	adds r1, r0, #0
	movs r0, #0xc0
	lsls r0, r0, #0x13
	adds r1, r1, r0
	adds r0, r4, #0
	bl CopyDataWithPossibleUncomp
	ldr r0, _080B4E1C  @ gBG3TilemapBuffer
	ldr r1, _080B4E20  @ gUnknown_08A295D4
	movs r2, #0xe0
	lsls r2, r2, #8
	bl CallARM_FillTileRect
	movs r0, #8
	bl BG_EnableSyncByMask
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B4DF8: .4byte gProcScr_MoveUnit
_080B4DFC: .4byte MU_Hide
_080B4E00: .4byte gLCDControlBuffer
_080B4E04: .4byte gUnknown_089AD934
_080B4E08: .4byte gUnknown_02020188
_080B4E0C: .4byte gBG1TilemapBuffer
_080B4E10: .4byte gUnknown_0203EF68
_080B4E14: .4byte gUnknown_08B1754C
_080B4E18: .4byte gUnknown_08B12DB4
_080B4E1C: .4byte gBG3TilemapBuffer
_080B4E20: .4byte gUnknown_08A295D4

	THUMB_FUNC_END sub_80B4BEC

	THUMB_FUNC_START sub_80B4E24
sub_80B4E24: @ 0x080B4E24
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080B4E70  @ gUnknown_089AD9F8
	ldr r1, _080B4E74  @ 0x06014C00
	bl CopyDataWithPossibleUncomp
	ldr r0, _080B4E78  @ gUnknown_08A394C0
	adds r1, r4, #0
	bl Proc_Start
	adds r2, r0, #0
	adds r1, r2, #0
	adds r1, #0x64
	movs r0, #0xac
	strh r0, [r1]
	adds r1, #2
	movs r0, #0x2d
	strh r0, [r1]
	adds r1, #2
	ldr r0, _080B4E7C  @ 0x00004260
	strh r0, [r1]
	ldr r0, _080B4E80  @ gUiFramePaletteA
	movs r1, #0xa0
	lsls r1, r1, #2
	movs r2, #0x20
	bl CopyToPaletteBuffer
	ldr r4, _080B4E84  @ gUnknown_02022E60
	adds r0, r4, #0
	bl sub_80B4E88
	subs r4, #2
	adds r0, r4, #0
	bl sub_80B4ED4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B4E70: .4byte gUnknown_089AD9F8
_080B4E74: .4byte 0x06014C00
_080B4E78: .4byte gUnknown_08A394C0
_080B4E7C: .4byte 0x00004260
_080B4E80: .4byte gUiFramePaletteA
_080B4E84: .4byte gUnknown_02022E60

	THUMB_FUNC_END sub_80B4E24

	THUMB_FUNC_START sub_80B4E88
sub_80B4E88: @ 0x080B4E88
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0
	bl SetFont
	bl Font_LoadForUI
	ldr r0, _080B4EB0  @ gUnknown_03001DA0
	movs r1, #1
	bl Text_Init
	adds r0, r4, #0
	movs r1, #3
	movs r2, #0x1e
	bl sub_8004B0C
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B4EB0: .4byte gUnknown_03001DA0

	THUMB_FUNC_END sub_80B4E88

	THUMB_FUNC_START sub_80B4EB4
sub_80B4EB4: @ 0x080B4EB4
	push {lr}
	adds r2, r0, #0
	cmp r1, #0
	ble _080B4ECE
	movs r3, #0
_080B4EBE:
	strh r3, [r2]
	adds r0, r2, #0
	adds r0, #0x40
	strh r3, [r0]
	subs r2, #2
	subs r1, #1
	cmp r1, #0
	bgt _080B4EBE
_080B4ECE:
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80B4EB4

	THUMB_FUNC_START sub_80B4ED4
sub_80B4ED4: @ 0x080B4ED4
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0
	bl SetFont
	bl Font_LoadForUI
	adds r0, r4, #0
	movs r1, #6
	bl sub_80B4EB4
	bl GetPartyGoldAmount
	adds r2, r0, #0
	adds r0, r4, #0
	movs r1, #2
	bl sub_8004B88
	movs r0, #1
	bl BG_EnableSyncByMask
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80B4ED4

	THUMB_FUNC_START sub_80B4F04
sub_80B4F04: @ 0x080B4F04
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r1, r5, #0
	adds r1, #0x60
	movs r0, #0
	strb r0, [r1]
	ldr r0, _080B4F80  @ gUnknown_08A39478
	movs r1, #3
	bl Proc_Start
	str r5, [r0, #0x54]
	movs r0, #0
	bl SetFont
	bl Font_LoadForUI
	adds r0, r5, #0
	adds r0, #0x5f
	ldrb r4, [r0]
	adds r0, r4, #5
	cmp r4, r0
	bge _080B4F5C
_080B4F30:
	adds r0, r4, #0
	movs r1, #6
	bl DivRem
	lsls r0, r0, #3
	ldr r1, _080B4F84  @ gUnknown_0203EF68
	adds r0, r0, r1
	lsls r1, r4, #1
	movs r2, #0x1f
	ands r1, r2
	lsls r1, r1, #6
	ldr r2, _080B4F88  @ gUnknown_02023CB6
	adds r1, r1, r2
	bl Text_DrawBlank
	adds r4, #1
	adds r0, r5, #0
	adds r0, #0x5f
	ldrb r0, [r0]
	adds r0, #5
	cmp r4, r0
	blt _080B4F30
_080B4F5C:
	adds r0, r5, #0
	adds r0, #0x5f
	ldrb r2, [r0]
	lsls r2, r2, #0x14
	ldr r0, _080B4F8C  @ 0xFFB80000
	adds r2, r2, r0
	lsrs r2, r2, #0x10
	movs r0, #2
	movs r1, #0
	bl BG_SetPosition
	movs r0, #4
	bl BG_EnableSyncByMask
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B4F80: .4byte gUnknown_08A39478
_080B4F84: .4byte gUnknown_0203EF68
_080B4F88: .4byte gUnknown_02023CB6
_080B4F8C: .4byte 0xFFB80000

	THUMB_FUNC_END sub_80B4F04

	THUMB_FUNC_START sub_80B4F90
sub_80B4F90: @ 0x080B4F90
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	movs r0, #0
	bl SetFont
	bl Font_LoadForUI
	adds r0, r6, #0
	adds r0, #0x5f
	ldrb r4, [r0]
	adds r0, r4, #5
	cmp r4, r0
	bge _080B4FCC
_080B4FAA:
	adds r0, r4, #0
	movs r1, #6
	bl DivRem
	adds r1, r0, #0
	lsls r0, r1, #3
	ldr r1, _080B4FD8  @ gUnknown_0203EF68
	adds r0, r0, r1
	bl Text_Clear
	adds r4, #1
	adds r0, r6, #0
	adds r0, #0x5f
	ldrb r0, [r0]
	adds r0, #5
	cmp r4, r0
	blt _080B4FAA
_080B4FCC:
	adds r0, r6, #0
	adds r0, #0x5f
	ldrb r4, [r0]
	adds r7, r0, #0
	b _080B4FF6
	.align 2, 0
_080B4FD8: .4byte gUnknown_0203EF68
_080B4FDC:
	lsls r0, r1, #3
	ldr r1, _080B5034  @ gUnknown_0203EF68
	adds r0, r0, r1
	ldr r2, [r6, #0x2c]
	movs r1, #0x1f
	ands r3, r1
	lsls r3, r3, #6
	ldr r1, _080B5038  @ gUnknown_02023CB6
	adds r3, r3, r1
	adds r1, r5, #0
	bl sub_80B5164
	adds r4, #1
_080B4FF6:
	ldrb r0, [r7]
	adds r0, #5
	cmp r4, r0
	bge _080B5016
	adds r0, r4, #0
	movs r1, #6
	bl DivRem
	adds r1, r0, #0
	lsls r3, r4, #1
	adds r0, r6, #0
	adds r0, #0x30
	adds r0, r0, r3
	ldrh r5, [r0]
	cmp r5, #0
	bne _080B4FDC
_080B5016:
	ldrb r2, [r7]
	lsls r2, r2, #0x14
	ldr r0, _080B503C  @ 0xFFB80000
	adds r2, r2, r0
	lsrs r2, r2, #0x10
	movs r0, #2
	movs r1, #0
	bl BG_SetPosition
	movs r0, #4
	bl BG_EnableSyncByMask
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B5034: .4byte gUnknown_0203EF68
_080B5038: .4byte gUnknown_02023CB6
_080B503C: .4byte 0xFFB80000

	THUMB_FUNC_END sub_80B4F90

	THUMB_FUNC_START sub_80B5040
sub_80B5040: @ 0x080B5040
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x54]
	bl sub_80B4474
	ldr r0, [r4, #0x54]
	bl sub_80B4F90
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80B5040

	THUMB_FUNC_START sub_80B505C
sub_80B505C: @ 0x080B505C
	push {r4, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x60
	movs r0, #1
	strb r0, [r1]
	ldr r0, _080B50B8  @ gUnknown_08A39488
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x54]
	movs r0, #0
	bl SetFont
	bl Font_LoadForUI
	movs r4, #0
_080B507E:
	adds r0, r4, #0
	movs r1, #6
	bl DivRem
	lsls r0, r0, #3
	ldr r1, _080B50BC  @ gUnknown_0203EF68
	adds r0, r0, r1
	lsls r1, r4, #1
	movs r2, #0x1f
	ands r1, r2
	lsls r1, r1, #6
	ldr r2, _080B50C0  @ gUnknown_02023CB6
	adds r1, r1, r2
	bl Text_DrawBlank
	adds r4, #1
	cmp r4, #4
	ble _080B507E
	ldr r2, _080B50C4  @ 0x0000FFB8
	movs r0, #2
	movs r1, #0
	bl BG_SetPosition
	movs r0, #4
	bl BG_EnableSyncByMask
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B50B8: .4byte gUnknown_08A39488
_080B50BC: .4byte gUnknown_0203EF68
_080B50C0: .4byte gUnknown_02023CB6
_080B50C4: .4byte 0x0000FFB8

	THUMB_FUNC_END sub_80B505C

	THUMB_FUNC_START sub_80B50C8
sub_80B50C8: @ 0x080B50C8
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	movs r0, #0
	bl SetFont
	bl Font_LoadForUI
	movs r4, #0
	ldr r5, _080B50F8  @ gUnknown_0203EF68
_080B50DA:
	adds r0, r4, #0
	movs r1, #6
	bl DivRem
	adds r1, r0, #0
	lsls r0, r1, #3
	adds r0, r0, r5
	bl Text_Clear
	adds r4, #1
	cmp r4, #4
	ble _080B50DA
	movs r4, #0
	b _080B5116
	.align 2, 0
_080B50F8: .4byte gUnknown_0203EF68
_080B50FC:
	lsls r0, r1, #3
	ldr r1, _080B5140  @ gUnknown_0203EF68
	adds r0, r0, r1
	movs r1, #0x1f
	ands r3, r1
	lsls r3, r3, #6
	ldr r1, _080B5144  @ gUnknown_02023CB6
	adds r3, r3, r1
	adds r1, r2, #0
	adds r2, r5, #0
	bl sub_80B51C0
	adds r4, #1
_080B5116:
	cmp r4, #4
	bgt _080B5134
	adds r0, r4, #0
	movs r1, #6
	bl DivRem
	adds r1, r0, #0
	ldr r5, [r6, #0x2c]
	lsls r3, r4, #1
	adds r0, r5, #0
	adds r0, #0x1e
	adds r0, r0, r3
	ldrh r2, [r0]
	cmp r2, #0
	bne _080B50FC
_080B5134:
	movs r0, #4
	bl BG_EnableSyncByMask
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B5140: .4byte gUnknown_0203EF68
_080B5144: .4byte gUnknown_02023CB6

	THUMB_FUNC_END sub_80B50C8

	THUMB_FUNC_START sub_80B5148
sub_80B5148: @ 0x080B5148
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x54]
	bl sub_80B4788
	ldr r0, [r4, #0x54]
	bl sub_80B50C8
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80B5148

	THUMB_FUNC_START sub_80B5164
sub_80B5164: @ 0x080B5164
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	adds r5, r1, #0
	adds r4, r2, #0
	adds r6, r3, #0
	adds r0, r4, #0
	bl sub_80B5220
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	cmp r4, #0
	bne _080B5184
	movs r0, #1
	b _080B5190
_080B5184:
	adds r0, r4, #0
	adds r1, r5, #0
	bl IsItemDisplayUsable
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
_080B5190:
	lsls r2, r0, #0x18
	asrs r2, r2, #0x18
	mov r0, r8
	adds r1, r5, #0
	adds r3, r6, #0
	bl DrawItemMenuLine
	adds r4, r6, #0
	adds r4, #0x22
	bl GetPartyGoldAmount
	movs r1, #1
	cmp r0, r7
	blt _080B51AE
	movs r1, #2
_080B51AE:
	adds r0, r4, #0
	adds r2, r7, #0
	bl sub_8004B88
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80B5164

	THUMB_FUNC_START sub_80B51C0
sub_80B51C0: @ 0x080B51C0
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r5, r1, #0
	adds r0, r2, #0
	adds r4, r3, #0
	bl IsItemDisplayUsable
	adds r2, r0, #0
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	adds r0, r6, #0
	adds r1, r5, #0
	adds r3, r4, #0
	bl DrawItemMenuLine
	adds r0, r5, #0
	bl sub_80B527C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080B5202
	adds r4, #0x22
	adds r0, r5, #0
	bl sub_80B5268
	adds r2, r0, #0
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	adds r0, r4, #0
	movs r1, #2
	bl sub_8004B88
	b _080B5214
_080B5202:
	ldr r0, _080B521C  @ 0x00000537
	bl GetStringFromIndex
	adds r3, r0, #0
	adds r0, r6, #0
	movs r1, #0x5c
	movs r2, #2
	bl Text_InsertString
_080B5214:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B521C: .4byte 0x00000537

	THUMB_FUNC_END sub_80B51C0

	THUMB_FUNC_START sub_80B5220
sub_80B5220: @ 0x080B5220
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r0, r1, #0
	bl GetItemCost
	adds r4, r0, #0
	ldr r0, _080B5254  @ gGameState
	ldrb r1, [r0, #4]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _080B5240
	lsrs r0, r4, #0x1f
	adds r0, r4, r0
	asrs r0, r0, #1
	adds r4, r4, r0
_080B5240:
	adds r0, r5, #0
	movs r1, #0x73
	bl UnitHasItem
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080B5258
	lsls r0, r4, #0x10
	b _080B525E
	.align 2, 0
_080B5254: .4byte gGameState
_080B5258:
	lsrs r0, r4, #0x1f
	adds r0, r4, r0
	lsls r0, r0, #0xf
_080B525E:
	lsrs r0, r0, #0x10
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80B5220

	THUMB_FUNC_START sub_80B5268
sub_80B5268: @ 0x080B5268
	push {lr}
	bl GetItemCost
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	lsls r0, r0, #0xf
	lsrs r0, r0, #0x10
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80B5268

	THUMB_FUNC_START sub_80B527C
sub_80B527C: @ 0x080B527C
	push {r4, lr}
	adds r4, r0, #0
	bl GetItemAttributes
	movs r1, #0x10
	ands r1, r0
	cmp r1, #0
	bne _080B529C
	adds r0, r4, #0
	bl sub_80B5268
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _080B529C
	movs r0, #1
	b _080B529E
_080B529C:
	movs r0, #0
_080B529E:
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80B527C

	THUMB_FUNC_START sub_80B52A4
sub_80B52A4: @ 0x080B52A4
	push {r4, lr}
	adds r3, r0, #0
	adds r0, #0x64
	movs r1, #0
	ldrsh r0, [r0, r1]
	adds r1, r3, #0
	adds r1, #0x66
	movs r2, #0
	ldrsh r1, [r1, r2]
	ldr r2, _080B52C8  @ gUnknown_08A39498
	adds r3, #0x68
	movs r4, #0
	ldrsh r3, [r3, r4]
	bl CallARM_PushToSecondaryOAM
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B52C8: .4byte gUnknown_08A39498

	THUMB_FUNC_END sub_80B52A4

	THUMB_FUNC_START sub_80B52CC
sub_80B52CC: @ 0x080B52CC
	push {lr}
	ldr r2, _080B5364  @ gLCDControlBuffer
	ldrb r0, [r2, #1]
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
	movs r1, #0x21
	negs r1, r1
	ands r0, r1
	subs r1, #0x20
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r2, #1]
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
	ldr r0, _080B5368  @ gBG0TilemapBuffer
	movs r1, #0
	bl BG_Fill
	ldr r0, _080B536C  @ gBG1TilemapBuffer
	movs r1, #0
	bl BG_Fill
	ldr r0, _080B5370  @ gBG2TilemapBuffer
	movs r1, #0
	bl BG_Fill
	ldr r0, _080B5374  @ gBG3TilemapBuffer
	movs r1, #0
	bl BG_Fill
	movs r0, #0xf
	bl BG_EnableSyncByMask
	bl Font_InitForUIDefault
	bl LoadUiFrameGraphics
	bl ResetIconGraphics_
	movs r0, #4
	bl LoadIconPalettes
	movs r1, #1
	negs r1, r1
	movs r0, #0
	bl LoadDialogueBoxGfx
	pop {r0}
	bx r0
	.align 2, 0
_080B5364: .4byte gLCDControlBuffer
_080B5368: .4byte gBG0TilemapBuffer
_080B536C: .4byte gBG1TilemapBuffer
_080B5370: .4byte gBG2TilemapBuffer
_080B5374: .4byte gBG3TilemapBuffer

	THUMB_FUNC_END sub_80B52CC

	THUMB_FUNC_START sub_80B5378
sub_80B5378: @ 0x080B5378
	push {lr}
	bl sub_80B5384
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80B5378

	THUMB_FUNC_START sub_80B5384
sub_80B5384: @ 0x080B5384
	push {lr}
	bl sub_80B56F0
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080B539E
	movs r2, #0xc9
	lsls r2, r2, #6
	movs r0, #0x78
	movs r1, #0x40
	movs r3, #1
	bl sub_80B53F8
_080B539E:
	bl sub_80B570C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080B53B6
	movs r2, #0xc9
	lsls r2, r2, #6
	movs r0, #0x78
	movs r1, #0x98
	movs r3, #0
	bl sub_80B53F8
_080B53B6:
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80B5384

	THUMB_FUNC_START sub_80B53BC
sub_80B53BC: @ 0x080B53BC
	push {r4, lr}
	adds r4, r1, #0
	ldr r2, _080B53E8  @ gUnknown_08A1C704
	ldr r1, _080B53EC  @ 0x000003FF
	ands r1, r0
	lsls r1, r1, #5
	ldr r0, _080B53F0  @ 0x06010000
	adds r1, r1, r0
	adds r0, r2, #0
	bl CopyDataWithPossibleUncomp
	ldr r0, _080B53F4  @ gUnknown_08A1A084
	adds r4, #0x10
	lsls r4, r4, #5
	adds r1, r4, #0
	movs r2, #0x20
	bl CopyToPaletteBuffer
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B53E8: .4byte gUnknown_08A1C704
_080B53EC: .4byte 0x000003FF
_080B53F0: .4byte 0x06010000
_080B53F4: .4byte gUnknown_08A1A084

	THUMB_FUNC_END sub_80B53BC

	THUMB_FUNC_START sub_80B53F8
sub_80B53F8: @ 0x080B53F8
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r6, r0, #0
	adds r7, r1, #0
	adds r4, r3, #0
	lsls r2, r2, #0x10
	lsrs r5, r2, #0x10
	bl GetGameClock
	movs r1, #0x28
	bl DivRem
	movs r1, #8
	bl Div
	lsls r0, r0, #1
	movs r1, #0
	cmp r4, #0
	bne _080B5422
	movs r1, #0x80
	lsls r1, r1, #6
_080B5422:
	orrs r1, r6
	ldr r3, _080B543C  @ gObject_16x8
	adds r0, r5, r0
	str r0, [sp]
	movs r0, #2
	adds r2, r7, #0
	bl PutSpriteExt
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B543C: .4byte gObject_16x8

	THUMB_FUNC_END sub_80B53F8

	THUMB_FUNC_START sub_80B5440
sub_80B5440: @ 0x080B5440
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r0, #0xb9
	movs r1, #8
	bl sub_8014B88
	ldr r1, _080B5490  @ gActionData
	movs r0, #0x17
	strb r0, [r1, #0x11]
	bl GetPartyGoldAmount
	adds r4, r0, #0
	ldr r0, [r5, #0x2c]
	adds r1, r5, #0
	adds r1, #0x5c
	ldrb r2, [r1]
	lsls r2, r2, #1
	subs r1, #0x2c
	adds r1, r1, r2
	ldrh r1, [r1]
	bl sub_80B5220
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	subs r4, r4, r0
	adds r0, r4, #0
	bl SetPartyGoldAmount
	adds r0, r5, #0
	bl sub_80B42B4
	adds r0, r5, #0
	bl sub_80B4F90
	ldr r0, _080B5494  @ gUnknown_02022E5E
	bl sub_80B4ED4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B5490: .4byte gActionData
_080B5494: .4byte gUnknown_02022E5E

	THUMB_FUNC_END sub_80B5440

	THUMB_FUNC_START sub_80B5498
sub_80B5498: @ 0x080B5498
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	adds r7, r2, #0
	cmp r4, #0
	bge _080B54AA
	movs r4, #0
_080B54AA:
	cmp r4, r5
	blt _080B54B0
	subs r4, r5, #1
_080B54B0:
	mov ip, r4
	ldr r0, _080B54D8  @ gKeyStatusPtr
	ldr r3, [r0]
	ldrh r1, [r3, #6]
	movs r6, #0x40
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	beq _080B54E0
	cmp r4, #0
	bne _080B54DC
	cmp r2, #0
	beq _080B5504
	ldrh r1, [r3, #8]
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	beq _080B5504
	subs r4, r5, #1
	b _080B5504
	.align 2, 0
_080B54D8: .4byte gKeyStatusPtr
_080B54DC:
	subs r4, #1
	b _080B5504
_080B54E0:
	movs r2, #0x80
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	beq _080B5504
	subs r0, r5, #1
	cmp r4, r0
	bne _080B5502
	cmp r7, #0
	beq _080B5504
	ldrh r1, [r3, #8]
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	beq _080B5504
	movs r4, #0
	b _080B5504
_080B5502:
	adds r4, #1
_080B5504:
	cmp ip, r4
	beq _080B551A
	ldr r0, _080B5524  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080B551A
	movs r0, #0x66
	bl m4aSongNumStart
_080B551A:
	adds r0, r4, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080B5524: .4byte gRAMChapterData

	THUMB_FUNC_END sub_80B5498

	THUMB_FUNC_START sub_80B5528
sub_80B5528: @ 0x080B5528
	ldr r1, _080B5530  @ gUnknown_0203EFB4
	str r0, [r1]
	bx lr
	.align 2, 0
_080B5530: .4byte gUnknown_0203EFB4

	THUMB_FUNC_END sub_80B5528

	THUMB_FUNC_START sub_80B5534
sub_80B5534: @ 0x080B5534
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _080B555C  @ gUnknown_0203EFB4
	ldr r1, [r0]
	str r4, [r0]
	cmp r4, r1
	beq _080B5572
	cmp r2, r5
	bgt _080B5572
	cmp r4, r1
	bge _080B5560
	cmp r3, #0
	beq _080B5572
	subs r0, r4, r3
	cmp r0, #0
	bgt _080B5572
	movs r0, #1
	negs r0, r0
	b _080B5574
	.align 2, 0
_080B555C: .4byte gUnknown_0203EFB4
_080B5560:
	adds r0, r2, r3
	cmp r0, r5
	beq _080B5572
	subs r1, r4, r3
	subs r0, r2, #1
	cmp r1, r0
	blt _080B5572
	movs r0, #1
	b _080B5574
_080B5572:
	movs r0, #0
_080B5574:
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80B5534

	THUMB_FUNC_START sub_80B557C
sub_80B557C: @ 0x080B557C
	push {lr}
	subs r3, r0, r1
	cmp r3, #0
	blt _080B558C
	cmp r3, r2
	blt _080B5592
	subs r3, r1, r0
	b _080B5596
_080B558C:
	subs r3, r1, r0
	cmp r3, r2
	bge _080B5596
_080B5592:
	adds r0, r1, #0
	b _080B55A8
_080B5596:
	cmp r3, #0
	bgt _080B55A4
	adds r1, r0, #0
	cmp r3, #0
	bge _080B55A6
	subs r1, r0, r2
	b _080B55A6
_080B55A4:
	adds r1, r0, r2
_080B55A6:
	adds r0, r1, #0
_080B55A8:
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80B557C

	THUMB_FUNC_START sub_80B55AC
sub_80B55AC: @ 0x080B55AC
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r5, r0, #0
	adds r6, r1, #0
	adds r1, r2, #0
	adds r4, r3, #0
	ldr r7, [sp, #0x1c]
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	lsls r6, r6, #0x10
	lsrs r6, r6, #0x10
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	adds r0, r5, #0
	str r1, [sp]
	bl sub_80B5528
	ldr r0, _080B5600  @ gUnknown_08A394D8
	ldr r0, [r0]
	strh r5, [r0]
	strh r6, [r0, #2]
	ldr r1, [sp]
	strh r1, [r0, #4]
	strh r4, [r0, #6]
	movs r1, #0x10
	strh r1, [r0, #8]
	movs r1, #4
	strh r1, [r0, #0xa]
	str r7, [r0, #0x14]
	ldr r1, [sp, #0x20]
	str r1, [r0, #0x18]
	ldr r2, [sp, #0x18]
	negs r1, r2
	str r1, [r0, #0x10]
	lsls r4, r4, #4
	strh r4, [r0, #0xc]
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B5600: .4byte gUnknown_08A394D8

	THUMB_FUNC_END sub_80B55AC

	THUMB_FUNC_START sub_80B5604
sub_80B5604: @ 0x080B5604
	push {r4, lr}
	ldr r4, _080B5638  @ gUnknown_08A394D8
	ldr r1, [r4]
	ldrh r0, [r1]
	ldrh r1, [r1, #2]
	movs r2, #0
	bl sub_80B5498
	ldr r3, [r4]
	strh r0, [r3]
	ldrh r0, [r3]
	ldrh r1, [r3, #2]
	ldrh r2, [r3, #4]
	ldrh r3, [r3, #6]
	bl sub_80B5534
	adds r1, r0, #0
	cmp r1, #0
	beq _080B566C
	cmp r1, #0
	bgt _080B563C
	movs r0, #1
	negs r0, r0
	cmp r1, r0
	beq _080B565A
	b _080B566C
	.align 2, 0
_080B5638: .4byte gUnknown_08A394D8
_080B563C:
	cmp r1, #1
	bne _080B566C
	ldr r3, [r4]
	ldrh r0, [r3, #6]
	adds r0, #1
	strh r0, [r3, #6]
	ldr r0, [r3, #0x18]
	ldrh r1, [r3, #6]
	ldrh r2, [r3, #4]
	adds r1, r1, r2
	subs r1, #1
	ldr r2, [r3, #0x14]
	bl _call_via_r2
	b _080B566C
_080B565A:
	ldr r2, [r4]
	ldrh r0, [r2, #6]
	subs r0, #1
	strh r0, [r2, #6]
	ldr r0, [r2, #0x18]
	ldrh r1, [r2, #6]
	ldr r2, [r2, #0x14]
	bl _call_via_r2
_080B566C:
	ldr r4, _080B5688  @ gUnknown_08A394D8
	ldr r2, [r4]
	ldrh r0, [r2, #0xc]
	ldrh r3, [r2, #6]
	ldrh r1, [r2, #8]
	muls r1, r3, r1
	ldrh r2, [r2, #0xa]
	bl sub_80B557C
	ldr r1, [r4]
	strh r0, [r1, #0xc]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B5688: .4byte gUnknown_08A394D8

	THUMB_FUNC_END sub_80B5604

	THUMB_FUNC_START sub_80B568C
sub_80B568C: @ 0x080B568C
	ldr r0, _080B5694  @ gUnknown_08A394D8
	ldr r0, [r0]
	ldrh r0, [r0]
	bx lr
	.align 2, 0
_080B5694: .4byte gUnknown_08A394D8

	THUMB_FUNC_END sub_80B568C

	THUMB_FUNC_START sub_80B5698
sub_80B5698: @ 0x080B5698
	ldr r0, _080B56A4  @ gUnknown_08A394D8
	ldr r0, [r0]
	ldrh r1, [r0, #0xc]
	ldr r0, [r0, #0x10]
	adds r0, r0, r1
	bx lr
	.align 2, 0
_080B56A4: .4byte gUnknown_08A394D8

	THUMB_FUNC_END sub_80B5698

	THUMB_FUNC_START sub_80B56A8
sub_80B56A8: @ 0x080B56A8
	ldr r0, _080B56B0  @ gUnknown_08A394D8
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	bx lr
	.align 2, 0
_080B56B0: .4byte gUnknown_08A394D8

	THUMB_FUNC_END sub_80B56A8

	THUMB_FUNC_START sub_80B56B4
sub_80B56B4: @ 0x080B56B4
	ldr r1, _080B56BC  @ gUnknown_08A394D8
	ldr r1, [r1]
	strh r0, [r1, #8]
	bx lr
	.align 2, 0
_080B56BC: .4byte gUnknown_08A394D8

	THUMB_FUNC_END sub_80B56B4

	THUMB_FUNC_START sub_80B56C0
sub_80B56C0: @ 0x080B56C0
	ldr r1, _080B56C8  @ gUnknown_08A394D8
	ldr r1, [r1]
	strh r0, [r1, #0xa]
	bx lr
	.align 2, 0
_080B56C8: .4byte gUnknown_08A394D8

	THUMB_FUNC_END sub_80B56C0

	THUMB_FUNC_START sub_80B56CC
sub_80B56CC: @ 0x080B56CC
	push {lr}
	ldr r0, _080B56E4  @ gUnknown_08A394D8
	ldr r0, [r0]
	ldrh r2, [r0, #0xc]
	ldrh r1, [r0, #6]
	ldrh r0, [r0, #8]
	muls r0, r1, r0
	cmp r2, r0
	bne _080B56E8
	movs r0, #0
	b _080B56EA
	.align 2, 0
_080B56E4: .4byte gUnknown_08A394D8
_080B56E8:
	movs r0, #1
_080B56EA:
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80B56CC

	THUMB_FUNC_START sub_80B56F0
sub_80B56F0: @ 0x080B56F0
	push {lr}
	ldr r0, _080B5700  @ gUnknown_08A394D8
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	cmp r0, #0
	bne _080B5704
	movs r0, #0
	b _080B5706
	.align 2, 0
_080B5700: .4byte gUnknown_08A394D8
_080B5704:
	movs r0, #1
_080B5706:
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80B56F0

	THUMB_FUNC_START sub_80B570C
sub_80B570C: @ 0x080B570C
	push {lr}
	ldr r0, _080B5724  @ gUnknown_08A394D8
	ldr r1, [r0]
	ldrh r0, [r1, #6]
	ldrh r2, [r1, #4]
	adds r0, r0, r2
	ldrh r1, [r1, #2]
	cmp r0, r1
	blt _080B5728
	movs r0, #0
	b _080B572A
	.align 2, 0
_080B5724: .4byte gUnknown_08A394D8
_080B5728:
	movs r0, #1
_080B572A:
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80B570C

.align 2, 0
