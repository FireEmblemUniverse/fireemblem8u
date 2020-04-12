	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	@ Trap effects and loading

	THUMB_FUNC_START sub_803746C
sub_803746C: @ 0x0803746C
	push {lr}
	lsls r1, r1, #0x18
	movs r2, #0
	cmp r1, #0
	beq _08037478
	movs r2, #3
_08037478:
	cmp r0, #0
	bge _0803747E
	adds r2, #2
_0803747E:
	cmp r0, #0
	ble _08037484
	adds r2, #1
_08037484:
	ldr r0, _08037490  @ gUnknown_0859E5A0
	lsls r1, r2, #1
	adds r1, r1, r0
	ldrh r0, [r1]
	pop {r1}
	bx r1
	.align 2, 0
_08037490: .4byte gUnknown_0859E5A0

	THUMB_FUNC_END sub_803746C

	THUMB_FUNC_START sub_8037494
sub_8037494: @ 0x08037494
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080374BC  @ gUnknown_0859E520
	bl Proc_Find
	ldr r1, _080374C0  @ gBattleActor
	adds r1, #0x53
	movs r2, #0
	ldrsb r2, [r1, r2]
	adds r0, #0x52
	movs r1, #0
	ldrsb r1, [r0, r1]
	adds r0, r2, #0
	bl sub_803746C
	adds r4, #0x4c
	strh r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080374BC: .4byte gUnknown_0859E520
_080374C0: .4byte gBattleActor

	THUMB_FUNC_END sub_8037494

	THUMB_FUNC_START sub_80374C4
sub_80374C4: @ 0x080374C4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080374EC  @ gUnknown_0859E520
	bl Proc_Find
	ldr r1, _080374F0  @ gBattleTarget
	adds r1, #0x53
	movs r2, #0
	ldrsb r2, [r1, r2]
	adds r0, #0x53
	movs r1, #0
	ldrsb r1, [r0, r1]
	adds r0, r2, #0
	bl sub_803746C
	adds r4, #0x4c
	strh r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080374EC: .4byte gUnknown_0859E520
_080374F0: .4byte gBattleTarget

	THUMB_FUNC_END sub_80374C4

	THUMB_FUNC_START sub_80374F4
sub_80374F4: @ 0x080374F4
	push {r4, lr}
	ldr r4, [r0, #0x54]
	adds r0, r4, #0
	bl GetUnitCurrentHp
	cmp r0, #0xa
	bgt _0803750A
	ldr r0, [r4]
	ldrb r0, [r0, #4]
	bl sub_80A4594
_0803750A:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80374F4

	THUMB_FUNC_START sub_8037510
sub_8037510: @ 0x08037510
	push {lr}
	ldr r2, [r0, #0x54]
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	ldrb r2, [r2, #0x11]
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	bl sub_801F68C
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8037510

	THUMB_FUNC_START sub_8037528
sub_8037528: @ 0x08037528
	push {lr}
	ldr r2, [r0, #0x54]
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	ldrb r2, [r2, #0x11]
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	bl sub_801F6BC
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8037528

	THUMB_FUNC_START sub_8037540
sub_8037540: @ 0x08037540
	push {r4, lr}
	ldr r4, [r0, #0x54]
	adds r0, #0x50
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #1
	beq _08037564
	cmp r0, #1
	bgt _08037558
	cmp r0, #0
	beq _0803755E
	b _08037586
_08037558:
	cmp r0, #2
	beq _0803757C
	b _08037586
_0803755E:
	bl MU_EndAll
	b _08037586
_08037564:
	bl MU_EndAll
	ldr r0, _08037578  @ gActiveUnit
	ldr r0, [r0]
	bl MU_Create
	bl MU_SetDefaultFacing_Auto
	b _08037586
	.align 2, 0
_08037578: .4byte gActiveUnit
_0803757C:
	adds r0, r4, #0
	bl MU_GetByUnit
	bl MU_End
_08037586:
	ldr r1, _0803759C  @ gActionData
	movs r0, #0xa
	strb r0, [r1, #0x15]
	adds r0, r4, #0
	movs r1, #0xa
	bl sub_803592C
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0803759C: .4byte gActionData

	THUMB_FUNC_END sub_8037540

	THUMB_FUNC_START sub_80375A0
sub_80375A0: @ 0x080375A0
	push {r4, r5, r6, lr}
	ldr r4, [r0, #0x54]
	movs r2, #0xa
	negs r2, r2
	movs r3, #1
	negs r3, r3
	adds r1, r4, #0
	bl sub_80357A8
	adds r0, r4, #0
	bl GetUnitCurrentHp
	cmp r0, #0
	bne _080375DE
	ldr r5, _080375E4  @ gActiveUnit
	ldr r6, [r5]
	str r4, [r5]
	ldr r0, [r4]
	ldrb r0, [r0, #4]
	movs r1, #0
	movs r2, #3
	bl BWL_AddWinOrLossIdk
	bl CheckForWaitEvents
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080375DC
	bl RunWaitEvents
_080375DC:
	str r6, [r5]
_080375DE:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080375E4: .4byte gActiveUnit

	THUMB_FUNC_END sub_80375A0

	THUMB_FUNC_START GetPickTrapType
GetPickTrapType: @ 0x080375E8
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	bl GetTrapAt
	cmp r0, #0
	beq _08037652
	ldrb r3, [r0, #2]
	cmp r3, #4
	beq _08037612
	cmp r3, #4
	bgt _0803760C
	cmp r3, #1
	beq _08037652
	b _08037656
_0803760C:
	cmp r3, #0xb
	beq _08037628
	b _08037656
_08037612:
	ldr r0, [r4]
	ldr r1, [r4, #4]
	ldr r0, [r0, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	beq _08037656
	movs r0, #0xf
	b _08037658
_08037628:
	ldr r0, [r4]
	ldr r1, [r4, #4]
	ldr r2, [r0, #0x28]
	ldr r0, [r1, #0x28]
	orrs r2, r0
	movs r0, #0x80
	lsls r0, r0, #0x12
	ands r0, r2
	cmp r0, #0
	beq _0803764A
	adds r0, r4, #0
	bl GetUnitItemCount
	cmp r0, #5
	beq _08037652
	movs r0, #0x10
	b _08037658
_0803764A:
	movs r0, #4
	ands r2, r0
	cmp r2, #0
	beq _08037656
_08037652:
	movs r0, #0
	b _08037658
_08037656:
	adds r0, r3, #0
_08037658:
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END GetPickTrapType

	THUMB_FUNC_START ExecTrap
ExecTrap: @ 0x08037660
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r5, r1, #0
	adds r4, r2, #0
	adds r0, r5, #0
	bl GetPickTrapType
	cmp r0, #0xb
	beq _08037690
	cmp r0, #0xb
	bgt _0803767C
	cmp r0, #8
	beq _08037686
	b _08037738
_0803767C:
	cmp r0, #0xf
	beq _080376B8
	cmp r0, #0x10
	beq _080376F4
	b _08037738
_08037686:
	ldr r0, _0803768C  @ gUnknown_0859E5AC
	b _080376A4
	.align 2, 0
_0803768C: .4byte gUnknown_0859E5AC
_08037690:
	movs r0, #0x10
	ldrsb r0, [r5, r0]
	movs r1, #0x11
	ldrsb r1, [r5, r1]
	movs r2, #0xb
	bl GetTypedTrapAt
	bl RemoveTrap
	ldr r0, _080376B4  @ gUnknown_0859E5FC
_080376A4:
	adds r1, r6, #0
	bl Proc_StartBlocking
	adds r1, r0, #0
	adds r0, #0x50
	strh r4, [r0]
	str r5, [r1, #0x54]
	b _08037738
	.align 2, 0
_080376B4: .4byte gUnknown_0859E5FC
_080376B8:
	movs r0, #0x10
	ldrsb r0, [r5, r0]
	movs r1, #0x11
	ldrsb r1, [r5, r1]
	bl GetTrapAt
	bl RemoveTrap
	ldr r0, _080376F0  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080376DA
	movs r0, #0xb1
	bl m4aSongNumStart
_080376DA:
	movs r4, #1
	negs r4, r4
	movs r0, #0x20
	bl GetStringFromIndex
	adds r2, r0, #0
	adds r0, r6, #0
	adds r1, r4, #0
	bl sub_801F9FC
	b _08037738
	.align 2, 0
_080376F0: .4byte gRAMChapterData
_080376F4:
	movs r0, #0x10
	ldrsb r0, [r5, r0]
	movs r1, #0x11
	ldrsb r1, [r5, r1]
	bl GetTrapAt
	bl RemoveTrap
	ldr r0, _08037740  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08037716
	movs r0, #0xb1
	bl m4aSongNumStart
_08037716:
	movs r4, #1
	negs r4, r4
	movs r0, #0x21
	bl GetStringFromIndex
	adds r2, r0, #0
	adds r0, r6, #0
	adds r1, r4, #0
	bl sub_801F9FC
	movs r0, #0x7a
	bl MakeNewItem
	adds r1, r0, #0
	adds r0, r5, #0
	bl UnitAddItem
_08037738:
	movs r0, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08037740: .4byte gRAMChapterData

	THUMB_FUNC_END ExecTrap

	THUMB_FUNC_START HandlePostActionTraps
HandlePostActionTraps: @ 0x08037744
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _08037790  @ gActiveUnit
	ldr r0, [r4]
	bl GetUnitCurrentHp
	cmp r0, #0
	ble _0803778A
	ldr r2, [r4]
	ldr r0, [r2]
	ldr r1, [r2, #4]
	ldr r0, [r0, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	beq _0803777E
	ldr r0, [r2, #0xc]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	bne _0803777E
	ldr r0, _08037794  @ gActionData
	ldrb r0, [r0, #0x11]
	cmp r0, #3
	bgt _0803778A
	cmp r0, #1
	blt _0803778A
_0803777E:
	ldr r4, _08037790  @ gActiveUnit
	ldr r0, [r4]
	bl GetPickTrapType
	cmp r0, #0
	bne _08037798
_0803778A:
	movs r0, #1
	b _080377C0
	.align 2, 0
_08037790: .4byte gActiveUnit
_08037794: .4byte gActionData
_08037798:
	ldr r1, _080377C8  @ gActionData
	movs r0, #1
	strb r0, [r1, #0x16]
	strb r0, [r1, #0x11]
	movs r0, #3
	bl SaveSuspendedGame
	bl GetBattleAnimType
	cmp r0, #1
	bne _080377B2
	bl SMS_UpdateFromGameData
_080377B2:
	ldr r1, [r4]
	adds r0, r5, #0
	movs r2, #0
	bl ExecTrap
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
_080377C0:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080377C8: .4byte gActionData

	THUMB_FUNC_END HandlePostActionTraps

	THUMB_FUNC_START sub_80377CC
sub_80377CC: @ 0x080377CC
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080377EC  @ gActionData
	ldrb r0, [r0, #0xd]
	bl GetUnit
	adds r1, r0, #0
	adds r0, r4, #0
	movs r2, #1
	bl ExecTrap
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080377EC: .4byte gActionData

	THUMB_FUNC_END sub_80377CC

	THUMB_FUNC_START sub_80377F0
sub_80377F0: @ 0x080377F0
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	adds r0, r4, #0
	bl GetPickTrapType
	cmp r0, #0
	beq _08037810
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #2
	bl ExecTrap
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	b _08037828
_08037810:
	adds r0, r4, #0
	bl MU_GetByUnit
	bl MU_End
	bl RenderBmMap
	bl RefreshEntityBmMaps
	bl SMS_FlushIndirect
	movs r0, #1
_08037828:
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80377F0

	THUMB_FUNC_START sub_8037830
sub_8037830: @ 0x08037830
	push {lr}
	movs r2, #3
	bl ExecTrap
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8037830

	THUMB_FUNC_START LoadTrapData
LoadTrapData: @ 0x08037840
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	cmp r5, #0
	beq _08037908
	b _08037902
_0803784C:
	ldrb r0, [r5]
	subs r1, r0, #1
	adds r2, r0, #0
	cmp r1, #0xb
	bhi _08037900
	lsls r0, r1, #2
	ldr r1, _08037860  @ _08037864
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08037860: .4byte _08037864
_08037864: @ jump table
	.4byte _08037894 @ case 0
	.4byte _08037900 @ case 1
	.4byte _08037900 @ case 2
	.4byte _080378A0 @ case 3
	.4byte _080378AE @ case 4
	.4byte _08037900 @ case 5
	.4byte _080378E2 @ case 6
	.4byte _080378C0 @ case 7
	.4byte _080378CA @ case 8
	.4byte _08037900 @ case 9
	.4byte _080378D6 @ case 10
	.4byte _080378EC @ case 11
_08037894:
	ldrb r0, [r5, #1]
	ldrb r1, [r5, #2]
	ldrb r2, [r5, #3]
	bl AddBallista
	b _08037900
_080378A0:
	ldrb r0, [r5, #1]
	ldrb r1, [r5, #2]
	ldrb r2, [r5, #4]
	ldrb r3, [r5, #5]
	bl AddFireTile
	b _08037900
_080378AE:
	ldrb r0, [r5, #1]
	ldrb r1, [r5, #2]
	ldrb r2, [r5, #3]
	ldrb r3, [r5, #4]
	ldrb r4, [r5, #5]
	str r4, [sp]
	bl AddGasTrap
	b _08037900
_080378C0:
	ldrb r0, [r5, #1]
	ldrb r1, [r5, #2]
	bl AddTrap8
	b _08037900
_080378CA:
	ldrb r0, [r5, #1]
	ldrb r1, [r5, #2]
	ldrb r2, [r5, #3]
	bl AddTrap9
	b _08037900
_080378D6:
	ldrb r0, [r5, #1]
	ldrb r1, [r5, #2]
	movs r3, #0
	bl AddTrap
	b _08037900
_080378E2:
	ldrb r0, [r5, #1]
	ldrb r1, [r5, #4]
	ldrb r2, [r5, #5]
	bl AddArrowTrap
_080378EC:
	movs r0, #1
	ldrsb r0, [r5, r0]
	movs r1, #2
	ldrsb r1, [r5, r1]
	ldrb r2, [r5, #3]
	ldrb r3, [r5, #4]
	ldrb r4, [r5, #5]
	str r4, [sp]
	bl AddGorgonEggTrap
_08037900:
	adds r5, #6
_08037902:
	ldrb r0, [r5]
	cmp r0, #0
	bne _0803784C
_08037908:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END LoadTrapData

	THUMB_FUNC_START LoadChapterBallistae
LoadChapterBallistae: @ 0x08037910
	push {lr}
	bl GetCurrentChapterBallistaePtr
	bl LoadTrapData
	bl GetCurrentChapterBallistae2Ptr
	bl LoadTrapData
	pop {r0}
	bx r0

	THUMB_FUNC_END LoadChapterBallistae

	THUMB_FUNC_START AddGorgonEggTrap
AddGorgonEggTrap: @ 0x08037928
	push {r4, r5, lr}
	sub sp, #0xc
	adds r5, r2, #0
	ldr r4, [sp, #0x18]
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	str r3, [sp]
	movs r2, #1
	str r2, [sp, #4]
	str r4, [sp, #8]
	movs r2, #0xc
	adds r3, r5, #0
	bl AddDamagingTrap
	add sp, #0xc
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END AddGorgonEggTrap

.align 2, 0
