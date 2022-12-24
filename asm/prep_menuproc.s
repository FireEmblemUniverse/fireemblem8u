
	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	THUMB_FUNC_START sub_8096484
sub_8096484: @ 0x08096484
	push {lr}
	bl HasConvoyAccess
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8096484

	THUMB_FUNC_START sub_8096494
sub_8096494: @ 0x08096494
	push {lr}
	sub sp, #4
	bl sub_808F270
	bl ResetDialogueScreen
	bl APProc_DeleteAll
	ldr r3, _080964F0  @ gLCDControlBuffer
	ldrb r2, [r3, #0xc]
	movs r1, #4
	negs r1, r1
	adds r0, r1, #0
	ands r0, r2
	strb r0, [r3, #0xc]
	ldrb r2, [r3, #0x10]
	adds r0, r1, #0
	ands r0, r2
	movs r2, #1
	orrs r0, r2
	strb r0, [r3, #0x10]
	ldrb r0, [r3, #0x14]
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	strb r1, [r3, #0x14]
	ldrb r0, [r3, #0x18]
	movs r1, #3
	orrs r0, r1
	strb r0, [r3, #0x18]
	movs r0, #3
	movs r1, #0
	movs r2, #0
	movs r3, #0x10
	bl SetSpecialColorEffectsParameters
	movs r0, #1
	str r0, [sp]
	movs r1, #1
	movs r2, #1
	movs r3, #1
	bl SetBlendTargetA
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_080964F0: .4byte gLCDControlBuffer

	THUMB_FUNC_END sub_8096494

	THUMB_FUNC_START sub_80964F4
sub_80964F4: @ 0x080964F4
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r0, #0x80
	lsls r0, r0, #1
	bl GetUnitFromCharId
	adds r5, r0, #0
	cmp r5, #0
	bne _0809650E
	adds r0, r4, #0
	bl Proc_End
	b _08096556
_0809650E:
	bl GetThread2SkipStack
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r1, r4, #0
	adds r1, #0x4c
	movs r4, #0
	strh r0, [r1]
	ldr r2, _0809655C  @ gLCDControlBuffer
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
	subs r1, #0x80
	adds r0, r5, #0
	movs r2, #0
	bl sub_802F598
	ldr r1, _08096560  @ gBattleStats
	movs r0, #0x88
	lsls r0, r0, #1
	strh r0, [r1]
	ldr r0, _08096564  @ gBattleActor
	adds r0, #0x4a
	strh r4, [r0]
	ldr r0, _08096568  @ gBattleTarget
	adds r0, #0x4a
	strh r4, [r0]
	bl BeginBattleAnimations
_08096556:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0809655C: .4byte gLCDControlBuffer
_08096560: .4byte gBattleStats
_08096564: .4byte gBattleActor
_08096568: .4byte gBattleTarget

	THUMB_FUNC_END sub_80964F4

	THUMB_FUNC_START sub_809656C
sub_809656C: @ 0x0809656C
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r0, #0x4c
	movs r1, #0
	ldrsh r4, [r0, r1]
	bl GetThread2SkipStack
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r4, r0
	bne _08096588
	adds r0, r5, #0
	bl Proc_Break
_08096588:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_809656C

	THUMB_FUNC_START sub_8096590
sub_8096590: @ 0x08096590
	push {r4, lr}
	sub sp, #4
	movs r4, #0x80
	lsls r4, r4, #1
	adds r0, r4, #0
	bl GetUnitFromCharId
	adds r1, r0, #0
	cmp r1, #0
	beq _080965A8
	movs r0, #0xff
	strb r0, [r1, #9]
_080965A8:
	movs r0, #3
	movs r1, #0
	movs r2, #0
	movs r3, #0x10
	bl SetSpecialColorEffectsParameters
	ldr r2, _080965EC  @ gLCDControlBuffer
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
	movs r0, #0
	str r0, [sp]
	movs r0, #0x34
	adds r1, r4, #0
	adds r2, r4, #0
	movs r3, #0x20
	bl sub_80029E8
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080965EC: .4byte gLCDControlBuffer

	THUMB_FUNC_END sub_8096590

	THUMB_FUNC_START sub_80965F0
sub_80965F0: @ 0x080965F0
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	bl sub_808F270
	bl ResetDialogueScreen
	bl APProc_DeleteAll
	ldr r3, _08096660  @ gLCDControlBuffer
	ldrb r2, [r3, #0xc]
	movs r1, #4
	negs r1, r1
	adds r0, r1, #0
	ands r0, r2
	strb r0, [r3, #0xc]
	ldrb r2, [r3, #0x10]
	adds r0, r1, #0
	ands r0, r2
	movs r2, #1
	orrs r0, r2
	strb r0, [r3, #0x10]
	ldrb r0, [r3, #0x14]
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	strb r1, [r3, #0x14]
	ldrb r0, [r3, #0x18]
	movs r1, #3
	orrs r0, r1
	strb r0, [r3, #0x18]
	movs r0, #3
	movs r1, #0
	movs r2, #0
	movs r3, #0x10
	bl SetSpecialColorEffectsParameters
	movs r0, #1
	str r0, [sp]
	movs r1, #1
	movs r2, #1
	movs r3, #1
	bl SetBlendTargetA
	adds r0, r4, #0
	bl EndAllProcChildren
	ldr r0, _08096664  @ gUnknown_08A184B4
	adds r1, r4, #0
	bl Proc_StartBlocking
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08096660: .4byte gLCDControlBuffer
_08096664: .4byte gUnknown_08A184B4

	THUMB_FUNC_END sub_80965F0

	THUMB_FUNC_START sub_8096668
sub_8096668: @ 0x08096668
	push {lr}
	sub sp, #4
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #0
	str r0, [sp]
	movs r2, #0
	movs r3, #0x20
	bl sub_80029E8
	add sp, #4
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8096668

	THUMB_FUNC_START NewPrepScreenTraineePromotionManager
NewPrepScreenTraineePromotionManager: @ 0x08096684
	push {lr}
	ldr r0, _08096694  @ gUnknown_08A184F4
	movs r1, #3
	bl Proc_Start
	pop {r0}
	bx r0
	.align 2, 0
_08096694: .4byte gUnknown_08A184F4

	THUMB_FUNC_END NewPrepScreenTraineePromotionManager

	THUMB_FUNC_START PrepScreenTraineePromotionManagerExists
PrepScreenTraineePromotionManagerExists: @ 0x08096698
	push {lr}
	ldr r0, _080966AC  @ gUnknown_08A184F4
	bl Proc_Find
	cmp r0, #0
	beq _080966A6
	movs r0, #1
_080966A6:
	pop {r1}
	bx r1
	.align 2, 0
_080966AC: .4byte gUnknown_08A184F4

	THUMB_FUNC_END PrepScreenTraineePromotionManagerExists

	THUMB_FUNC_START sub_80966B0
sub_80966B0: @ 0x080966B0
	push {lr}
	ldr r0, _080966C4  @ gUnknown_08A1829C
	bl Proc_Find
	cmp r0, #0
	beq _080966BE
	movs r0, #1
_080966BE:
	pop {r1}
	bx r1
	.align 2, 0
_080966C4: .4byte gUnknown_08A1829C

	THUMB_FUNC_END sub_80966B0

	THUMB_FUNC_START sub_80966C8
sub_80966C8: @ 0x080966C8
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	ldr r3, _080966EC  @ gUnknown_08A1856E
	str r2, [sp]
	movs r0, #4
	adds r1, r4, #0
	adds r2, r5, #0
	bl PutSpriteExt
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080966EC: .4byte gUnknown_08A1856E

	THUMB_FUNC_END sub_80966C8

	THUMB_FUNC_START sub_80966F0
sub_80966F0: @ 0x080966F0
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r6, r0, #0
	mov r9, r1
	adds r4, r2, #0
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	mov r8, r3
	movs r0, #1
	ands r0, r4
	cmp r0, #0
	beq _08096724
	subs r6, #4
	adds r1, r6, #0
	adds r1, #0x40
	ldr r0, _08096750  @ gUnknown_08A18614
	ldr r3, [r0, #0x28]
	mov r0, r8
	str r0, [sp]
	movs r0, #4
	mov r2, r9
	bl PutSpriteExt
_08096724:
	ldr r3, _08096754  @ gUnknown_08A18582
	mov r0, r8
	str r0, [sp]
	movs r0, #4
	adds r1, r6, #0
	mov r2, r9
	bl PutSpriteExt
	asrs r7, r4, #1
	cmp r7, #9
	bgt _08096758
	adds r1, r6, #0
	adds r1, #0x30
	ldr r0, _08096750  @ gUnknown_08A18614
	ldr r3, [r0, #0x2c]
	mov r0, r8
	str r0, [sp]
	movs r0, #4
	mov r2, r9
	bl PutSpriteExt
	b _0809677A
	.align 2, 0
_08096750: .4byte gUnknown_08A18614
_08096754: .4byte gUnknown_08A18582
_08096758:
	adds r5, r6, #0
	adds r5, #0x30
	ldr r4, _080967AC  @ gUnknown_08A18614
	adds r0, r7, #0
	movs r1, #0xa
	bl __divsi3
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r3, [r0]
	mov r0, r8
	str r0, [sp]
	movs r0, #4
	adds r1, r5, #0
	mov r2, r9
	bl PutSpriteExt
_0809677A:
	adds r5, r6, #0
	adds r5, #0x38
	ldr r4, _080967AC  @ gUnknown_08A18614
	adds r0, r7, #0
	movs r1, #0xa
	bl __modsi3
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r3, [r0]
	mov r0, r8
	str r0, [sp]
	movs r0, #4
	adds r1, r5, #0
	mov r2, r9
	bl PutSpriteExt
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080967AC: .4byte gUnknown_08A18614

	THUMB_FUNC_END sub_80966F0

	THUMB_FUNC_START sub_80967B0
sub_80967B0: @ 0x080967B0
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r6, r0, #0
	mov r9, r1
	adds r4, r2, #0
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	mov r8, r3
	movs r0, #1
	ands r0, r4
	cmp r0, #0
	beq _080967E4
	subs r6, #4
	adds r1, r6, #0
	adds r1, #0x40
	ldr r0, _08096810  @ gUnknown_08A18614
	ldr r3, [r0, #0x28]
	mov r0, r8
	str r0, [sp]
	movs r0, #4
	mov r2, r9
	bl PutSpriteExt
_080967E4:
	ldr r3, _08096814  @ gUnknown_08A18590
	mov r0, r8
	str r0, [sp]
	movs r0, #4
	adds r1, r6, #0
	mov r2, r9
	bl PutSpriteExt
	asrs r7, r4, #1
	cmp r7, #9
	bgt _08096818
	adds r1, r6, #0
	adds r1, #0x30
	ldr r0, _08096810  @ gUnknown_08A18614
	ldr r3, [r0, #0x2c]
	mov r0, r8
	str r0, [sp]
	movs r0, #4
	mov r2, r9
	bl PutSpriteExt
	b _0809683A
	.align 2, 0
_08096810: .4byte gUnknown_08A18614
_08096814: .4byte gUnknown_08A18590
_08096818:
	adds r5, r6, #0
	adds r5, #0x30
	ldr r4, _0809686C  @ gUnknown_08A18614
	adds r0, r7, #0
	movs r1, #0xa
	bl __divsi3
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r3, [r0]
	mov r0, r8
	str r0, [sp]
	movs r0, #4
	adds r1, r5, #0
	mov r2, r9
	bl PutSpriteExt
_0809683A:
	adds r5, r6, #0
	adds r5, #0x38
	ldr r4, _0809686C  @ gUnknown_08A18614
	adds r0, r7, #0
	movs r1, #0xa
	bl __modsi3
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r3, [r0]
	mov r0, r8
	str r0, [sp]
	movs r0, #4
	adds r1, r5, #0
	mov r2, r9
	bl PutSpriteExt
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809686C: .4byte gUnknown_08A18614

	THUMB_FUNC_END sub_80967B0

	THUMB_FUNC_START sub_8096870
sub_8096870: @ 0x08096870
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r6, r0, #0
	mov r9, r1
	adds r4, r2, #0
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	mov r8, r3
	movs r0, #1
	ands r0, r4
	cmp r0, #0
	beq _080968A4
	subs r6, #4
	adds r1, r6, #0
	adds r1, #0x3c
	ldr r0, _080968D0  @ gUnknown_08A18614
	ldr r3, [r0, #0x28]
	mov r0, r8
	str r0, [sp]
	movs r0, #4
	mov r2, r9
	bl PutSpriteExt
_080968A4:
	adds r1, r6, #4
	ldr r3, _080968D4  @ gUnknown_08A1859E
	mov r0, r8
	str r0, [sp]
	movs r0, #4
	mov r2, r9
	bl PutSpriteExt
	asrs r7, r4, #1
	cmp r7, #9
	bgt _080968D8
	adds r1, r6, #0
	adds r1, #0x2c
	ldr r0, _080968D0  @ gUnknown_08A18614
	ldr r3, [r0, #0x2c]
	mov r0, r8
	str r0, [sp]
	movs r0, #4
	mov r2, r9
	bl PutSpriteExt
	b _080968FA
	.align 2, 0
_080968D0: .4byte gUnknown_08A18614
_080968D4: .4byte gUnknown_08A1859E
_080968D8:
	adds r5, r6, #0
	adds r5, #0x2c
	ldr r4, _0809692C  @ gUnknown_08A18614
	adds r0, r7, #0
	movs r1, #0xa
	bl __divsi3
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r3, [r0]
	mov r0, r8
	str r0, [sp]
	movs r0, #4
	adds r1, r5, #0
	mov r2, r9
	bl PutSpriteExt
_080968FA:
	adds r5, r6, #0
	adds r5, #0x34
	ldr r4, _0809692C  @ gUnknown_08A18614
	adds r0, r7, #0
	movs r1, #0xa
	bl __modsi3
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r3, [r0]
	mov r0, r8
	str r0, [sp]
	movs r0, #4
	adds r1, r5, #0
	mov r2, r9
	bl PutSpriteExt
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809692C: .4byte gUnknown_08A18614

	THUMB_FUNC_END sub_8096870

	THUMB_FUNC_START sub_8096930
sub_8096930: @ 0x08096930
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	ldr r3, _08096954  @ gUnknown_08A185AC
	str r2, [sp]
	movs r0, #4
	adds r1, r4, #0
	adds r2, r5, #0
	bl PutSpriteExt
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08096954: .4byte gUnknown_08A185AC

	THUMB_FUNC_END sub_8096930

	THUMB_FUNC_START sub_8096958
sub_8096958: @ 0x08096958
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r7, r0, #0
	movs r4, #0xa0
	movs r5, #8
	bl CheckSomethingSomewhere
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08096974
	b _08096A80
_08096974:
	adds r0, r7, #0
	adds r0, #0x30
	ldrb r0, [r0]
	cmp r0, #4
	bhi _080969E8
	lsls r0, r0, #2
	ldr r1, _08096988  @ _0809698C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08096988: .4byte _0809698C
_0809698C: @ jump table
	.4byte _080969E8 @ case 0
	.4byte _080969A0 @ case 1
	.4byte _080969B4 @ case 2
	.4byte _080969C8 @ case 3
	.4byte _080969DC @ case 4
_080969A0:
	adds r0, r7, #0
	adds r0, #0x2f
	ldrb r2, [r0]
	movs r3, #0xc7
	lsls r3, r3, #7
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_80966F0
	b _080969E8
_080969B4:
	adds r0, r7, #0
	adds r0, #0x2f
	ldrb r2, [r0]
	movs r3, #0xc7
	lsls r3, r3, #7
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_80967B0
	b _080969E8
_080969C8:
	adds r0, r7, #0
	adds r0, #0x2f
	ldrb r2, [r0]
	movs r3, #0xc7
	lsls r3, r3, #7
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_8096870
	b _080969E8
_080969DC:
	movs r2, #0xc7
	lsls r2, r2, #7
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_8096930
_080969E8:
	movs r0, #0x33
	adds r0, r0, r7
	mov r8, r0
	movs r1, #0x34
	adds r1, r1, r7
	mov r9, r1
	ldr r6, _08096A6C  @ 0x0000B6C0
	movs r5, #0x80
	movs r4, #2
_080969FA:
	str r6, [sp]
	movs r0, #4
	adds r1, r5, #0
	movs r2, #0x18
	ldr r3, _08096A70  @ gObject_32x16
	bl PutSpriteExt
	adds r6, #4
	adds r5, #0x20
	subs r4, #1
	cmp r4, #0
	bge _080969FA
	mov r1, r8
	ldrb r0, [r1]
	cmp r0, #0
	bne _08096A26
	ldrh r0, [r7, #0x36]
	lsrs r0, r0, #2
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _08096A38
_08096A26:
	ldr r3, _08096A74  @ gUnknown_08A18E4E
	movs r0, #0xc0
	lsls r0, r0, #2
	str r0, [sp]
	movs r0, #4
	movs r1, #0x14
	movs r2, #0x8c
	bl PutSpriteExt
_08096A38:
	mov r1, r9
	ldrb r0, [r1]
	cmp r0, #0
	bne _08096A4C
	ldrh r0, [r7, #0x36]
	lsrs r0, r0, #2
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _08096A5E
_08096A4C:
	ldr r3, _08096A78  @ gUnknown_08A18E76
	movs r0, #0xc0
	lsls r0, r0, #2
	str r0, [sp]
	movs r0, #4
	movs r1, #0x64
	movs r2, #0x8c
	bl PutSpriteExt
_08096A5E:
	ldr r2, _08096A7C  @ 0x00009380
	movs r0, #0x74
	movs r1, #0x28
	bl sub_80966C8
	b _08096AA4
	.align 2, 0
_08096A6C: .4byte 0x0000B6C0
_08096A70: .4byte gObject_32x16
_08096A74: .4byte gUnknown_08A18E4E
_08096A78: .4byte gUnknown_08A18E76
_08096A7C: .4byte 0x00009380
_08096A80:
	bl sub_8095264
	cmp r0, #0
	beq _08096A9A
	ldr r3, _08096AB4  @ gUnknown_08A18E62
	movs r0, #0xc0
	lsls r0, r0, #2
	str r0, [sp]
	movs r0, #4
	movs r1, #0x14
	movs r2, #0x8c
	bl PutSpriteExt
_08096A9A:
	ldr r2, _08096AB8  @ 0x00009380
	movs r0, #0x74
	movs r1, #0x20
	bl sub_80966C8
_08096AA4:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08096AB4: .4byte gUnknown_08A18E62
_08096AB8: .4byte 0x00009380

	THUMB_FUNC_END sub_8096958

	THUMB_FUNC_START sub_8096ABC
sub_8096ABC: @ 0x08096ABC
	push {r4, r5, lr}
	sub sp, #8
	adds r5, r0, #0
	adds r1, r5, #0
	adds r1, #0x2a
	movs r0, #0
	strb r0, [r1]
	strh r0, [r5, #0x36]
	bl SMS_FlushIndirect
	bl CheckSomethingSomewhere
	lsls r0, r0, #0x18
	asrs r1, r0, #0x18
	cmp r1, #0
	beq _08096AFC
	ldr r0, _08096AF4  @ gUnknown_08A1B194
	ldr r3, _08096AF8  @ 0x00009E40
	movs r1, #1
	str r1, [sp]
	movs r1, #0xd
	str r1, [sp, #4]
	movs r1, #0x3c
	movs r2, #0x10
	bl APProc_Create
	str r0, [r5, #0x38]
	b _08096B86
	.align 2, 0
_08096AF4: .4byte gUnknown_08A1B194
_08096AF8: .4byte 0x00009E40
_08096AFC:
	ldr r0, _08096B28  @ gUnknown_08A1B194
	ldr r3, _08096B2C  @ 0x00009E40
	str r1, [sp]
	movs r1, #0xd
	str r1, [sp, #4]
	movs r1, #0x3c
	movs r2, #0x10
	bl APProc_Create
	str r0, [r5, #0x38]
	ldr r0, _08096B30  @ gRAMChapterData
	movs r4, #0xe
	ldrsb r4, [r0, r4]
	adds r0, r4, #0
	subs r0, #0x24
	cmp r0, #9
	bhi _08096B34
	adds r1, r5, #0
	adds r1, #0x30
	movs r0, #2
	b _08096B74
	.align 2, 0
_08096B28: .4byte gUnknown_08A1B194
_08096B2C: .4byte 0x00009E40
_08096B30: .4byte gRAMChapterData
_08096B34:
	adds r0, r4, #0
	subs r0, #0x2e
	cmp r0, #9
	bhi _08096B44
	adds r1, r5, #0
	adds r1, #0x30
	movs r0, #3
	b _08096B74
_08096B44:
	adds r0, r4, #0
	bl sub_80C0960
	cmp r0, #0
	beq _08096B56
	adds r1, r5, #0
	adds r1, #0x30
	movs r0, #4
	b _08096B74
_08096B56:
	adds r0, r4, #0
	subs r0, #0x15
	cmp r0, #1
	bls _08096B66
	cmp r4, #0x22
	beq _08096B66
	cmp r4, #0x23
	bne _08096B6E
_08096B66:
	adds r1, r5, #0
	adds r1, #0x30
	movs r0, #0
	b _08096B74
_08096B6E:
	adds r1, r5, #0
	adds r1, #0x30
	movs r0, #1
_08096B74:
	strb r0, [r1]
	adds r0, r4, #0
	bl GetROMChapterStruct
	adds r0, #0x80
	ldrb r0, [r0]
	adds r1, r5, #0
	adds r1, #0x2f
	strb r0, [r1]
_08096B86:
	adds r1, r5, #0
	adds r1, #0x2b
	movs r0, #0
	strb r0, [r1]
	adds r0, r5, #0
	adds r0, #0x33
	movs r1, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8096ABC

	THUMB_FUNC_START sub_8096BA4
sub_8096BA4: @ 0x08096BA4
	push {r4, lr}
	adds r4, r0, #0
	bl sub_8096958
	ldrh r0, [r4, #0x36]
	adds r0, #1
	strh r0, [r4, #0x36]
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8096BA4

	THUMB_FUNC_START sub_8096BB8
sub_8096BB8: @ 0x08096BB8
	push {lr}
	ldr r0, [r0, #0x38]
	bl APProc_Delete
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8096BB8

	THUMB_FUNC_START sub_8096BC4
sub_8096BC4: @ 0x08096BC4
	push {lr}
	ldr r0, _08096BDC  @ gUnknown_08A186B4
	bl Proc_Find
	cmp r0, #0
	beq _08096BD8
	adds r1, r0, #0
	adds r1, #0x33
	movs r0, #0
	strb r0, [r1]
_08096BD8:
	pop {r0}
	bx r0
	.align 2, 0
_08096BDC: .4byte gUnknown_08A186B4

	THUMB_FUNC_END sub_8096BC4

	THUMB_FUNC_START sub_8096BE0
sub_8096BE0: @ 0x08096BE0
	push {lr}
	ldr r0, _08096BF8  @ gUnknown_08A186B4
	bl Proc_Find
	cmp r0, #0
	beq _08096BF4
	adds r1, r0, #0
	adds r1, #0x34
	movs r0, #0
	strb r0, [r1]
_08096BF4:
	pop {r0}
	bx r0
	.align 2, 0
_08096BF8: .4byte gUnknown_08A186B4

	THUMB_FUNC_END sub_8096BE0

	THUMB_FUNC_START sub_8096BFC
sub_8096BFC: @ 0x08096BFC
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _08096C1C  @ gUnknown_08A186B4
	adds r0, r4, #0
	bl Proc_Find
	bl Proc_End
	adds r0, r4, #0
	adds r1, r5, #0
	bl Proc_Start
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08096C1C: .4byte gUnknown_08A186B4

	THUMB_FUNC_END sub_8096BFC

	THUMB_FUNC_START sub_8096C20
sub_8096C20: @ 0x08096C20
	push {lr}
	ldr r0, _08096C30  @ gUnknown_08A186B4
	bl Proc_Find
	bl Proc_End
	pop {r0}
	bx r0
	.align 2, 0
_08096C30: .4byte gUnknown_08A186B4

	THUMB_FUNC_END sub_8096C20

	THUMB_FUNC_START sub_8096C34
sub_8096C34: @ 0x08096C34
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r2, r0, #0
	adds r3, r2, #0
	subs r3, #0x38
	cmp r3, #0
	bge _08096C4A
	movs r7, #0
	adds r6, r2, #0
	b _08096C60
_08096C4A:
	adds r0, r2, #0
	adds r0, #0x38
	cmp r0, #0xf0
	ble _08096C5A
	movs r7, #0xf
	adds r6, r2, #0
	subs r6, #0x78
	b _08096C60
_08096C5A:
	asrs r7, r3, #3
	lsls r0, r7, #3
	subs r6, r2, r0
_08096C60:
	adds r3, r1, #0
	subs r3, #0x28
	adds r0, r1, #0
	adds r0, #0x30
	cmp r0, #0xa0
	ble _08096C72
	movs r5, #8
	subs r1, #0x40
	b _08096C82
_08096C72:
	adds r0, r3, #0
	cmp r0, #0
	bge _08096C7C
	adds r0, r1, #0
	subs r0, #0x21
_08096C7C:
	asrs r5, r0, #3
	lsls r0, r5, #3
	subs r1, r1, r0
_08096C82:
	mov r8, r1
	ldr r4, _08096CC8  @ gUnknown_02022CB0
	adds r0, r4, #0
	movs r1, #2
	adds r2, r7, #0
	bl DrawDecNumber
	adds r0, r4, #0
	adds r0, #0x80
	movs r1, #2
	adds r2, r5, #0
	bl DrawDecNumber
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r4, r1
	movs r1, #2
	adds r2, r6, #0
	bl DrawDecNumber
	movs r1, #0xc0
	lsls r1, r1, #1
	adds r0, r4, r1
	movs r1, #2
	mov r2, r8
	bl DrawDecNumber
	movs r0, #1
	bl BG_EnableSyncByMask
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08096CC8: .4byte gUnknown_02022CB0

	THUMB_FUNC_END sub_8096C34

	THUMB_FUNC_START PrepScreenMenu_OnInit
PrepScreenMenu_OnInit: @ 0x08096CCC
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r2, #0
	movs r1, #7
	adds r0, #0x54
_08096CD6:
	str r2, [r0]
	subs r0, #4
	subs r1, #1
	cmp r1, #0
	bge _08096CD6
	movs r4, #0
	adds r0, r5, #0
	adds r0, #0x2a
	strb r4, [r0]
	adds r0, #1
	strb r4, [r0]
	adds r0, r5, #0
	bl sub_80AD47C
	movs r0, #0xc0
	lsls r0, r0, #3
	movs r1, #1
	bl sub_80AD4A0
	str r4, [r5, #0x58]
	str r4, [r5, #0x5c]
	str r4, [r5, #0x60]
	adds r0, r5, #0
	adds r0, #0x29
	strb r4, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END PrepScreenMenu_OnInit

	THUMB_FUNC_START PrepScreenMenu_OnActiveLoop
PrepScreenMenu_OnActiveLoop: @ 0x08096D10
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	adds r4, r0, #0
	adds r5, r4, #0
	adds r5, #0x2a
	ldrb r0, [r5]
	mov r9, r0
	movs r1, #0x34
	ldrsh r0, [r4, r1]
	adds r0, #1
	lsls r0, r0, #3
	adds r0, #4
	mov r8, r0
	movs r2, #0x36
	ldrsh r0, [r4, r2]
	adds r0, #1
	lsls r0, r0, #3
	mov r2, r9
	lsls r1, r2, #4
	adds r7, r0, r1
	movs r3, #0x80
	lsls r3, r3, #3
	mov r0, r8
	adds r1, r7, #0
	movs r2, #6
	bl sub_80AD51C
	ldrb r1, [r5]
	lsls r1, r1, #2
	adds r0, r4, #0
	adds r0, #0x38
	adds r0, r0, r1
	ldr r5, [r0]
	adds r6, r4, #0
	adds r6, #0x29
	movs r0, #0
	ldrsb r0, [r6, r0]
	cmp r0, #0
	beq _08096D84
	ldr r2, _08096D80  @ gKeyStatusPtr
	ldr r0, [r2]
	ldrh r1, [r0, #8]
	movs r0, #0x81
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	bne _08096D74
	b _08096E8C
_08096D74:
	bl CloseHelpBox
	movs r0, #0
	strb r0, [r6]
	b _08096F34
	.align 2, 0
_08096D80: .4byte gKeyStatusPtr
_08096D84:
	ldr r1, _08096DAC  @ gKeyStatusPtr
	ldr r0, [r1]
	ldrh r3, [r0, #8]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r3
	adds r2, r1, #0
	cmp r0, #0
	beq _08096DB0
	ldr r2, [r5, #0x30]
	cmp r2, #0
	bne _08096D9E
	b _08096F34
_08096D9E:
	mov r0, r8
	adds r1, r7, #0
	bl StartHelpBox
	movs r0, #1
	strb r0, [r6]
	b _08096F34
	.align 2, 0
_08096DAC: .4byte gKeyStatusPtr
_08096DB0:
	movs r6, #1
	adds r0, r6, #0
	ands r0, r3
	cmp r0, #0
	beq _08096DF8
	adds r0, r5, #0
	adds r0, #0x38
	ldrb r1, [r0]
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	bne _08096E74
	ldr r0, [r5, #0x2c]
	cmp r0, #0
	beq _08096E74
	adds r0, r4, #0
	movs r1, #0
	bl Proc_Goto
	ldr r0, [r4, #0x14]
	ldr r1, [r5, #0x2c]
	bl _call_via_r1
	ldr r0, _08096DF4  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	bge _08096DEC
	b _08096F34
_08096DEC:
	movs r0, #0x6a
	bl m4aSongNumStart
	b _08096F34
	.align 2, 0
_08096DF4: .4byte gRAMChapterData
_08096DF8:
	movs r0, #2
	ands r0, r3
	cmp r0, #0
	beq _08096E38
	ldr r1, [r4, #0x58]
	cmp r1, #0
	bne _08096E08
	b _08096F34
_08096E08:
	ldr r0, [r4, #0x14]
	bl _call_via_r1
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08096E74
	adds r0, r4, #0
	movs r1, #0
	bl Proc_Goto
	ldr r0, _08096E34  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	bge _08096E2A
	b _08096F34
_08096E2A:
	movs r0, #0x6b
	bl m4aSongNumStart
	b _08096F34
	.align 2, 0
_08096E34: .4byte gRAMChapterData
_08096E38:
	movs r0, #8
	ands r0, r3
	cmp r0, #0
	beq _08096E8C
	ldr r1, [r4, #0x5c]
	cmp r1, #0
	beq _08096F34
	ldr r0, [r4, #0x14]
	bl _call_via_r1
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08096E74
	ldr r0, _08096E70  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08096E64
	movs r0, #0x6a
	bl m4aSongNumStart
_08096E64:
	adds r0, r4, #0
	movs r1, #0
	bl Proc_Goto
	b _08096F34
	.align 2, 0
_08096E70: .4byte gRAMChapterData
_08096E74:
	ldr r0, _08096E88  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08096F34
	movs r0, #0x6c
	bl m4aSongNumStart
	b _08096F34
	.align 2, 0
_08096E88: .4byte gRAMChapterData
_08096E8C:
	ldr r3, [r2]
	ldrh r1, [r3, #6]
	movs r6, #0x40
	adds r0, r6, #0
	ands r0, r1
	adds r5, r4, #0
	adds r5, #0x2a
	cmp r0, #0
	beq _08096EB8
	ldrb r0, [r5]
	cmp r0, #0
	bne _08096EB4
	ldrh r1, [r3, #8]
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	beq _08096EB8
	adds r0, r4, #0
	adds r0, #0x2b
	ldrb r0, [r0]
_08096EB4:
	subs r0, #1
	strb r0, [r5]
_08096EB8:
	ldr r2, [r2]
	ldrh r1, [r2, #6]
	movs r3, #0x80
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	beq _08096EE6
	ldrb r1, [r5]
	adds r0, r4, #0
	adds r0, #0x2b
	ldrb r0, [r0]
	subs r0, #1
	cmp r1, r0
	bge _08096ED8
	adds r0, r1, #1
	b _08096EE4
_08096ED8:
	ldrh r1, [r2, #8]
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	beq _08096EE6
	movs r0, #0
_08096EE4:
	strb r0, [r5]
_08096EE6:
	ldrb r0, [r5]
	cmp r9, r0
	beq _08096F34
	ldr r0, _08096F40  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08096EFE
	movs r0, #0x66
	bl m4aSongNumStart
_08096EFE:
	adds r0, r4, #0
	adds r0, #0x29
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _08096F34
	movs r1, #0x34
	ldrsh r0, [r4, r1]
	adds r0, #1
	lsls r0, r0, #3
	adds r0, #4
	movs r2, #0x36
	ldrsh r1, [r4, r2]
	adds r1, #1
	lsls r1, r1, #3
	ldrb r3, [r5]
	lsls r2, r3, #4
	adds r1, r1, r2
	lsls r3, r3, #2
	adds r2, r4, #0
	adds r2, #0x38
	adds r2, r2, r3
	ldr r5, [r2]
	ldr r2, [r5, #0x30]
	bl StartHelpBox
_08096F34:
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08096F40: .4byte gRAMChapterData

	THUMB_FUNC_END PrepScreenMenu_OnActiveLoop

	THUMB_FUNC_START PrepScreenMenu_OnLoop_2
PrepScreenMenu_OnLoop_2: @ 0x08096F44
	push {lr}
	adds r2, r0, #0
	movs r1, #0x34
	ldrsh r0, [r2, r1]
	adds r0, #1
	lsls r0, r0, #3
	adds r0, #4
	movs r3, #0x36
	ldrsh r1, [r2, r3]
	adds r1, #1
	lsls r1, r1, #3
	adds r2, #0x2a
	ldrb r2, [r2]
	lsls r2, r2, #4
	adds r1, r1, r2
	bl DisplayFrozenUiHand
	pop {r0}
	bx r0

	THUMB_FUNC_END PrepScreenMenu_OnLoop_2

	THUMB_FUNC_START PrepScreenMenu_OnLoop_0
PrepScreenMenu_OnLoop_0: @ 0x08096F6C
	push {lr}
	adds r2, r0, #0
	movs r1, #0x34
	ldrsh r0, [r2, r1]
	adds r0, #1
	lsls r0, r0, #3
	adds r0, #4
	movs r3, #0x36
	ldrsh r1, [r2, r3]
	adds r1, #1
	lsls r1, r1, #3
	adds r2, #0x2a
	ldrb r2, [r2]
	lsls r2, r2, #4
	adds r1, r1, r2
	movs r3, #0x80
	lsls r3, r3, #3
	movs r2, #6
	bl sub_80AD51C
	pop {r0}
	bx r0

	THUMB_FUNC_END PrepScreenMenu_OnLoop_0

	THUMB_FUNC_START PrepScreenMenu_OnEnd
PrepScreenMenu_OnEnd: @ 0x08096F98
	push {lr}
	ldr r1, [r0, #0x60]
	cmp r1, #0
	beq _08096FA6
	ldr r0, [r0, #0x14]
	bl _call_via_r1
_08096FA6:
	pop {r0}
	bx r0

	THUMB_FUNC_END PrepScreenMenu_OnEnd

	THUMB_FUNC_START StartPrepScreenMenu
StartPrepScreenMenu: @ 0x08096FAC
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _08096FCC  @ gUnknown_08A186EC
	adds r0, r4, #0
	bl Proc_Find
	bl Proc_End
	adds r0, r4, #0
	adds r1, r5, #0
	bl Proc_Start
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08096FCC: .4byte gUnknown_08A186EC

	THUMB_FUNC_END StartPrepScreenMenu

	THUMB_FUNC_START sub_8096FD0
sub_8096FD0: @ 0x08096FD0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08096FE8  @ gUnknown_08A186EC
	bl Proc_Find
	cmp r0, #0
	beq _08096FE0
	str r4, [r0, #0x58]
_08096FE0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08096FE8: .4byte gUnknown_08A186EC

	THUMB_FUNC_END sub_8096FD0

	THUMB_FUNC_START sub_8096FEC
sub_8096FEC: @ 0x08096FEC
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08097004  @ gUnknown_08A186EC
	bl Proc_Find
	cmp r0, #0
	beq _08096FFC
	str r4, [r0, #0x5c]
_08096FFC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08097004: .4byte gUnknown_08A186EC

	THUMB_FUNC_END sub_8096FEC

	THUMB_FUNC_START sub_8097008
sub_8097008: @ 0x08097008
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08097020  @ gUnknown_08A186EC
	bl Proc_Find
	cmp r0, #0
	beq _08097018
	str r4, [r0, #0x60]
_08097018:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08097020: .4byte gUnknown_08A186EC

	THUMB_FUNC_END sub_8097008

	THUMB_FUNC_START SetPrepScreenMenuItem
SetPrepScreenMenuItem: @ 0x08097024
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	adds r6, r0, #0
	adds r7, r1, #0
	mov r8, r2
	mov r9, r3
	ldr r0, _08097074  @ gUnknown_08A186EC
	bl Proc_Find
	adds r1, r0, #0
	cmp r1, #0
	beq _080970B8
	movs r4, #0
	movs r0, #0x38
	adds r0, r0, r1
	mov sl, r0
	mov r3, sl
_0809704C:
	ldr r2, [r3]
	cmp r2, #0
	beq _08097078
	adds r0, r2, #0
	adds r0, #0x39
	ldrb r0, [r0]
	cmp r0, r6
	bne _08097078
	str r7, [r2, #0x2c]
	adds r0, r2, #0
	adds r0, #0x38
	mov r1, r8
	strb r1, [r0]
	ldr r0, [r3]
	mov r2, r9
	str r2, [r0, #0x34]
	ldr r1, [sp, #0x20]
	str r1, [r0, #0x30]
	b _080970B8
	.align 2, 0
_08097074: .4byte gUnknown_08A186EC
_08097078:
	adds r3, #4
	adds r4, #1
	cmp r4, #7
	ble _0809704C
	adds r5, r1, #0
	adds r5, #0x2b
	ldrb r4, [r5]
	ldr r0, _080970C8  @ gUnknown_08A186DC
	bl Proc_Start
	lsls r1, r4, #2
	add r1, sl
	str r0, [r1]
	adds r0, #0x39
	strb r6, [r0]
	ldr r0, [r1]
	str r7, [r0, #0x2c]
	adds r0, #0x38
	mov r2, r8
	strb r2, [r0]
	ldr r0, [r1]
	mov r1, r9
	str r1, [r0, #0x34]
	ldr r2, [sp, #0x20]
	str r2, [r0, #0x30]
	adds r0, #0x3c
	movs r1, #7
	bl Text_Init
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
_080970B8:
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080970C8: .4byte gUnknown_08A186DC

	THUMB_FUNC_END SetPrepScreenMenuItem

	THUMB_FUNC_START sub_80970CC
sub_80970CC: @ 0x080970CC
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r4, #0
	ldr r0, _080970F8  @ gUnknown_08A186EC
	bl Proc_Find
	cmp r0, #0
	beq _08097106
	movs r2, #0
	adds r3, r0, #0
	adds r3, #0x2a
	adds r1, r0, #0
	adds r1, #0x38
_080970E6:
	ldr r0, [r1]
	cmp r0, #0
	beq _080970FE
	adds r0, #0x39
	ldrb r0, [r0]
	cmp r0, r5
	bne _080970FC
	strb r4, [r3]
	b _08097106
	.align 2, 0
_080970F8: .4byte gUnknown_08A186EC
_080970FC:
	adds r4, #1
_080970FE:
	adds r1, #4
	adds r2, #1
	cmp r2, #7
	ble _080970E6
_08097106:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80970CC

	THUMB_FUNC_START sub_809710C
sub_809710C: @ 0x0809710C
	push {r4, r5, lr}
	movs r4, #0
	ldr r0, _0809713C  @ gUnknown_08A186EC
	bl Proc_Find
	cmp r0, #0
	beq _0809714A
	movs r3, #0
	movs r1, #0x2a
	adds r1, r1, r0
	mov ip, r1
	adds r2, r0, #0
	adds r2, #0x38
_08097126:
	ldr r1, [r2]
	cmp r1, #0
	beq _08097142
	mov r5, ip
	ldrb r0, [r5]
	cmp r0, r4
	bne _08097140
	adds r0, r1, #0
	adds r0, #0x39
	ldrb r0, [r0]
	b _0809714C
	.align 2, 0
_0809713C: .4byte gUnknown_08A186EC
_08097140:
	adds r4, #1
_08097142:
	adds r2, #4
	adds r3, #1
	cmp r3, #7
	ble _08097126
_0809714A:
	movs r0, #0
_0809714C:
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_809710C

	THUMB_FUNC_START DrawPrepScreenMenuFrameAt
DrawPrepScreenMenuFrameAt: @ 0x08097154
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	sub sp, #8
	adds r6, r0, #0
	adds r5, r1, #0
	ldr r0, _080971F8  @ gUnknown_08A186EC
	bl Proc_Find
	mov r8, r0
	cmp r0, #0
	beq _080971EA
	movs r0, #0
	mov r1, r8
	strh r6, [r1, #0x34]
	strh r5, [r1, #0x36]
	mov r4, r8
	adds r4, #0x2b
	ldrb r3, [r4]
	lsls r3, r3, #1
	adds r3, #2
	str r0, [sp]
	adds r0, r6, #0
	adds r1, r5, #0
	movs r2, #0xa
	bl DrawUiFrame2
	ldrb r0, [r4]
	mov r9, r4
	cmp r0, #1
	bls _080971E4
	movs r7, #0
	ldrb r0, [r4]
	cmp r7, r0
	bge _080971E4
	adds r0, r5, #1
	lsls r0, r0, #5
	adds r0, #2
	adds r6, r0, r6
_080971A4:
	lsls r1, r7, #2
	mov r0, r8
	adds r0, #0x38
	adds r0, r0, r1
	ldr r4, [r0]
	adds r5, r4, #0
	adds r5, #0x3c
	adds r0, r5, #0
	bl Text_Clear
	ldr r0, [r4, #0x34]
	bl GetStringFromIndex
	lsls r1, r6, #1
	ldr r2, _080971FC  @ gBG0TilemapBuffer
	adds r1, r1, r2
	adds r4, #0x38
	ldrb r3, [r4]
	movs r2, #1
	ands r2, r3
	movs r3, #0
	str r3, [sp]
	str r0, [sp, #4]
	adds r0, r5, #0
	bl DrawTextInline
	adds r6, #0x40
	adds r7, #1
	mov r1, r9
	ldrb r1, [r1]
	cmp r7, r1
	blt _080971A4
_080971E4:
	movs r0, #3
	bl BG_EnableSyncByMask
_080971EA:
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080971F8: .4byte gUnknown_08A186EC
_080971FC: .4byte gBG0TilemapBuffer

	THUMB_FUNC_END DrawPrepScreenMenuFrameAt

	THUMB_FUNC_START sub_8097200
sub_8097200: @ 0x08097200
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	sub sp, #8
	adds r5, r0, #0
	adds r4, r1, #0
	ldr r0, _0809728C  @ gUnknown_08A186EC
	bl Proc_Find
	mov r8, r0
	cmp r0, #0
	beq _0809727E
	strh r5, [r0, #0x34]
	strh r4, [r0, #0x36]
	adds r0, #0x2b
	ldrb r1, [r0]
	mov r9, r0
	cmp r1, #1
	bls _08097278
	movs r7, #0
	ldrb r0, [r0]
	cmp r7, r0
	bge _08097278
	adds r0, r4, #1
	lsls r0, r0, #5
	adds r0, #2
	adds r6, r0, r5
_08097238:
	lsls r1, r7, #2
	mov r0, r8
	adds r0, #0x38
	adds r0, r0, r1
	ldr r4, [r0]
	adds r5, r4, #0
	adds r5, #0x3c
	adds r0, r5, #0
	bl Text_Clear
	ldr r0, [r4, #0x34]
	bl GetStringFromIndex
	lsls r1, r6, #1
	ldr r2, _08097290  @ gBG0TilemapBuffer
	adds r1, r1, r2
	adds r4, #0x38
	ldrb r3, [r4]
	movs r2, #1
	ands r2, r3
	movs r3, #0
	str r3, [sp]
	str r0, [sp, #4]
	adds r0, r5, #0
	bl DrawTextInline
	adds r6, #0x40
	adds r7, #1
	mov r1, r9
	ldrb r1, [r1]
	cmp r7, r1
	blt _08097238
_08097278:
	movs r0, #1
	bl BG_EnableSyncByMask
_0809727E:
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809728C: .4byte gUnknown_08A186EC
_08097290: .4byte gBG0TilemapBuffer

	THUMB_FUNC_END sub_8097200

	THUMB_FUNC_START sub_8097294
sub_8097294: @ 0x08097294
	push {lr}
	ldr r0, _080972A4  @ gUnknown_08A186EC
	bl Proc_Find
	cmp r0, #0
	bne _080972A8
	movs r0, #0
	b _080972AC
	.align 2, 0
_080972A4: .4byte gUnknown_08A186EC
_080972A8:
	adds r0, #0x2b
	ldrb r0, [r0]
_080972AC:
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8097294

	THUMB_FUNC_START EndPrepScreenMenu
EndPrepScreenMenu: @ 0x080972B0
	push {r4, lr}
	ldr r0, _080972D0  @ gUnknown_08A186EC
	bl Proc_Find
	adds r4, r0, #0
	cmp r4, #0
	beq _080972CA
	bl sub_80972D4
	adds r0, r4, #0
	movs r1, #0xa
	bl Proc_Goto
_080972CA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080972D0: .4byte gUnknown_08A186EC

	THUMB_FUNC_END EndPrepScreenMenu

	THUMB_FUNC_START sub_80972D4
sub_80972D4: @ 0x080972D4
	push {r4, r5, lr}
	ldr r0, _08097334  @ gUnknown_08A186EC
	bl Proc_Find
	adds r4, r0, #0
	cmp r4, #0
	beq _0809732C
	movs r1, #0x36
	ldrsh r0, [r4, r1]
	lsls r0, r0, #5
	movs r2, #0x34
	ldrsh r1, [r4, r2]
	adds r0, r0, r1
	lsls r0, r0, #1
	ldr r1, _08097338  @ gBG0TilemapBuffer
	adds r0, r0, r1
	adds r5, r4, #0
	adds r5, #0x2b
	ldrb r2, [r5]
	lsls r2, r2, #1
	adds r2, #2
	movs r1, #9
	movs r3, #0
	bl TileMap_FillRect
	movs r1, #0x36
	ldrsh r0, [r4, r1]
	lsls r0, r0, #5
	movs r2, #0x34
	ldrsh r1, [r4, r2]
	adds r0, r0, r1
	lsls r0, r0, #1
	ldr r1, _0809733C  @ gBG1TilemapBuffer
	adds r0, r0, r1
	ldrb r2, [r5]
	lsls r2, r2, #1
	adds r2, #2
	movs r1, #9
	movs r3, #0
	bl TileMap_FillRect
	movs r0, #3
	bl BG_EnableSyncByMask
_0809732C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08097334: .4byte gUnknown_08A186EC
_08097338: .4byte gBG0TilemapBuffer
_0809733C: .4byte gBG1TilemapBuffer

	THUMB_FUNC_END sub_80972D4

	THUMB_FUNC_START PrepScreenMenuExists
PrepScreenMenuExists: @ 0x08097340
	push {lr}
	ldr r0, _08097350  @ gUnknown_08A186EC
	bl Proc_Find
	cmp r0, #0
	bne _08097354
	movs r0, #0
	b _08097356
	.align 2, 0
_08097350: .4byte gUnknown_08A186EC
_08097354:
	movs r0, #1
_08097356:
	pop {r1}
	bx r1

	THUMB_FUNC_END PrepScreenMenuExists

	THUMB_FUNC_START sub_809735C
sub_809735C: @ 0x0809735C
	push {lr}
	ldr r0, _08097374  @ gUnknown_08A186EC
	bl Proc_Find
	cmp r0, #0
	beq _0809736E
	movs r1, #2
	bl Proc_Goto
_0809736E:
	pop {r0}
	bx r0
	.align 2, 0
_08097374: .4byte gUnknown_08A186EC

	THUMB_FUNC_END sub_809735C

	THUMB_FUNC_START sub_8097378
sub_8097378: @ 0x08097378
	push {lr}
	ldr r0, _08097390  @ gUnknown_08A186EC
	bl Proc_Find
	cmp r0, #0
	beq _0809738A
	movs r1, #0
	bl Proc_Goto
_0809738A:
	pop {r0}
	bx r0
	.align 2, 0
_08097390: .4byte gUnknown_08A186EC

	THUMB_FUNC_END sub_8097378

	THUMB_FUNC_START EnablePrepScreenMenu
EnablePrepScreenMenu: @ 0x08097394
	push {lr}
	ldr r0, _080973AC  @ gUnknown_08A186EC
	bl Proc_Find
	cmp r0, #0
	beq _080973A6
	movs r1, #1
	bl Proc_Goto
_080973A6:
	pop {r0}
	bx r0
	.align 2, 0
_080973AC: .4byte gUnknown_08A186EC

	THUMB_FUNC_END EnablePrepScreenMenu

.align 2, 0
