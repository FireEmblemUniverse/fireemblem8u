	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	@ Everything related to map battle animations
	@ Needs further splitting

	THUMB_FUNC_START sub_807A708
sub_807A708: @ 0x0807A708
	push {lr}
	adds r1, r0, #0
	ldr r2, _0807A728  @ gUnknown_0203E1F0
	adds r0, r2, #0
	adds r0, #0x62
	ldrb r0, [r0]
	cmp r0, #1
	bne _0807A722
	ldr r0, [r2, #0x18]
	adds r0, #0x48
	ldrh r0, [r0]
	bl sub_8011694
_0807A722:
	pop {r0}
	bx r0
	.align 2, 0
_0807A728: .4byte gUnknown_0203E1F0

	THUMB_FUNC_END sub_807A708

	THUMB_FUNC_START DisplayWpnBrokePopup
DisplayWpnBrokePopup: @ 0x0807A72C
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	movs r4, #0
	ldr r5, _0807A768  @ gBattleActor
	adds r0, r5, #0
	bl BattleUnit_ShouldDisplayWpnBroke
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0807A742
	adds r4, r5, #0
_0807A742:
	ldr r5, _0807A76C  @ gBattleTarget
	adds r0, r5, #0
	bl BattleUnit_ShouldDisplayWpnBroke
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0807A752
	adds r4, r5, #0
_0807A752:
	cmp r4, #0
	beq _0807A762
	adds r0, r4, #0
	adds r0, #0x4a
	ldrh r0, [r0]
	adds r1, r6, #0
	bl NewPopup_WeaponBroke
_0807A762:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807A768: .4byte gBattleActor
_0807A76C: .4byte gBattleTarget

	THUMB_FUNC_END DisplayWpnBrokePopup

	THUMB_FUNC_START BattleUnit_ShouldDisplayWpnBroke
BattleUnit_ShouldDisplayWpnBroke: @ 0x0807A770
	push {lr}
	adds r2, r0, #0
	movs r0, #0xb
	ldrsb r0, [r2, r0]
	movs r1, #0xc0
	ands r0, r1
	cmp r0, #0
	beq _0807A784
	movs r0, #0
	b _0807A78E
_0807A784:
	adds r0, r2, #0
	bl DidBattleUnitBreakWeapon
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
_0807A78E:
	pop {r1}
	bx r1

	THUMB_FUNC_END BattleUnit_ShouldDisplayWpnBroke

	THUMB_FUNC_START DisplayWRankUpPopup
DisplayWRankUpPopup: @ 0x0807A794
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	movs r4, #0
	ldr r5, _0807A7D0  @ gBattleActor
	adds r0, r5, #0
	bl BattleUnit_ShouldDisplayWRankUp
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0807A7AA
	adds r4, r5, #0
_0807A7AA:
	ldr r5, _0807A7D4  @ gBattleTarget
	adds r0, r5, #0
	bl BattleUnit_ShouldDisplayWRankUp
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0807A7BA
	adds r4, r5, #0
_0807A7BA:
	cmp r4, #0
	beq _0807A7CA
	adds r0, r4, #0
	adds r0, #0x50
	ldrb r0, [r0]
	adds r1, r6, #0
	bl NewPopup_WRankIncrease
_0807A7CA:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807A7D0: .4byte gBattleActor
_0807A7D4: .4byte gBattleTarget

	THUMB_FUNC_END DisplayWRankUpPopup

	THUMB_FUNC_START BattleUnit_ShouldDisplayWRankUp
BattleUnit_ShouldDisplayWRankUp: @ 0x0807A7D8
	push {lr}
	adds r2, r0, #0
	movs r0, #0xb
	ldrsb r0, [r2, r0]
	movs r1, #0xc0
	ands r0, r1
	cmp r0, #0
	bne _0807A7F8
	adds r0, r2, #0
	bl HasBattleUnitGainedWeaponLevel
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0807A7F8
	movs r0, #1
	b _0807A7FA
_0807A7F8:
	movs r0, #0
_0807A7FA:
	pop {r1}
	bx r1

	THUMB_FUNC_END BattleUnit_ShouldDisplayWRankUp

	THUMB_FUNC_START _InitFontForUIDefault
_InitFontForUIDefault: @ 0x0807A800
	push {lr}
	bl Font_InitForUIDefault
	pop {r0}
	bx r0

	THUMB_FUNC_END _InitFontForUIDefault

	THUMB_FUNC_START MapAnim_Cleanup
MapAnim_Cleanup: @ 0x0807A80C
	push {lr}
	bl MU_AllRestartAnimations
	bl sub_8003D20
	bl DeleteBattleAnimInfoThing
	bl SetupBackgroundForWeatherMaybe
	bl LoadUiFrameGraphics
	bl LoadObjUIGfx
	bl EventEngineExists
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0807A834
	bl MU_EndAll
_0807A834:
	pop {r0}
	bx r0

	THUMB_FUNC_END MapAnim_Cleanup

	THUMB_FUNC_START MapAnim_AdvanceBattleRound
MapAnim_AdvanceBattleRound: @ 0x0807A838
	push {r4, r5, lr}
	ldr r3, _0807A890  @ gUnknown_0203E1F0
	ldr r2, [r3, #0x50]
	ldr r0, [r2]
	lsls r0, r0, #8
	lsrs r0, r0, #0x1e
	movs r1, #1
	ands r0, r1
	adds r5, r3, #0
	adds r5, #0x58
	strb r0, [r5]
	subs r1, r1, r0
	movs r0, #0x59
	adds r0, r0, r3
	mov ip, r0
	strb r1, [r0]
	ldr r0, [r2]
	adds r1, r3, #0
	adds r1, #0x5a
	movs r4, #0
	strh r0, [r1]
	ldr r0, [r2]
	lsls r0, r0, #8
	lsrs r0, r0, #0x1b
	adds r1, #2
	strb r0, [r1]
	movs r0, #3
	ldrsb r0, [r2, r0]
	adds r1, #1
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x5e
	ldrb r0, [r0]
	cmp r0, #1
	bne _0807A884
	strb r4, [r5]
	mov r0, ip
	strb r4, [r0]
_0807A884:
	ldr r0, [r3, #0x50]
	adds r0, #4
	str r0, [r3, #0x50]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807A890: .4byte gUnknown_0203E1F0

	THUMB_FUNC_END MapAnim_AdvanceBattleRound

	THUMB_FUNC_START MapAnim_PrepareNextBattleRound
MapAnim_PrepareNextBattleRound: @ 0x0807A894
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r5, _0807A8BC  @ gUnknown_0203E1F0
	ldr r0, [r5, #0x50]
	ldr r0, [r0]
	lsls r0, r0, #8
	lsrs r0, r0, #0x1b
	movs r1, #0x10
	ands r0, r1
	cmp r0, #0
	beq _0807A8C4
	adds r0, r4, #0
	bl Proc_Break
	ldr r1, _0807A8C0  @ gUnknown_089A35B0
	adds r0, r4, #0
	bl Proc_GotoScript
	b _0807A8EA
	.align 2, 0
_0807A8BC: .4byte gUnknown_0203E1F0
_0807A8C0: .4byte gUnknown_089A35B0
_0807A8C4:
	bl MapAnim_AdvanceBattleRound
	adds r0, r5, #0
	adds r0, #0x58
	ldrb r1, [r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r1, r5, #4
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, #0x4a
	ldrh r0, [r0]
	bl GetSpellAssocAlt6CPointer
	str r0, [r5, #0x54]
	adds r0, r4, #0
	bl Proc_Break
_0807A8EA:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END MapAnim_PrepareNextBattleRound

	THUMB_FUNC_START MapAnim_DisplayRoundAnim
MapAnim_DisplayRoundAnim: @ 0x0807A8F0
	push {r4, lr}
	adds r4, r0, #0
	bl GetItemAnim6CCode
	adds r1, r4, #0
	bl Proc_StartBlocking
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END MapAnim_DisplayRoundAnim

	THUMB_FUNC_START MapAnim_ShowPoisonEffectIfAny
MapAnim_ShowPoisonEffectIfAny: @ 0x0807A904
	push {r4, lr}
	adds r4, r0, #0
	ldr r2, _0807A93C  @ gUnknown_0203E1F0
	adds r0, r2, #0
	adds r0, #0x5a
	ldrh r1, [r0]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0807A934
	adds r0, r2, #0
	adds r0, #0x59
	ldrb r0, [r0]
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	ldr r0, [r1]
	bl NewMapPoisonEffect
	adds r0, r4, #0
	movs r1, #0x64
	bl NewBlockingTimer
_0807A934:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807A93C: .4byte gUnknown_0203E1F0

	THUMB_FUNC_END MapAnim_ShowPoisonEffectIfAny

	THUMB_FUNC_START MapAnim_MoveCameraOntoSubject
MapAnim_MoveCameraOntoSubject: @ 0x0807A940
	push {lr}
	ldr r1, _0807A958  @ gUnknown_0203E1F0
	ldr r2, [r1]
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	ldrb r2, [r2, #0x11]
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	bl EnsureCameraOntoPosition
	pop {r0}
	bx r0
	.align 2, 0
_0807A958: .4byte gUnknown_0203E1F0

	THUMB_FUNC_END MapAnim_MoveCameraOntoSubject

	THUMB_FUNC_START MapAnim_MoveCameraOntoTarget
MapAnim_MoveCameraOntoTarget: @ 0x0807A95C
	push {lr}
	adds r3, r0, #0
	ldr r1, _0807A980  @ gUnknown_0203E1F0
	adds r0, r1, #0
	adds r0, #0x5e
	ldrb r0, [r0]
	cmp r0, #1
	beq _0807A97C
	ldr r0, [r1, #0x14]
	movs r1, #0x10
	ldrsb r1, [r0, r1]
	movs r2, #0x11
	ldrsb r2, [r0, r2]
	adds r0, r3, #0
	bl EnsureCameraOntoPosition
_0807A97C:
	pop {r0}
	bx r0
	.align 2, 0
_0807A980: .4byte gUnknown_0203E1F0

	THUMB_FUNC_END MapAnim_MoveCameraOntoTarget

	THUMB_FUNC_START sub_807A984
sub_807A984: @ 0x0807A984
	push {r4, lr}
	movs r2, #1
	negs r2, r2
	ldr r0, _0807A9FC  @ gUnknown_0203E1F0
	adds r1, r0, #0
	adds r1, #0x5e
	ldrb r1, [r1]
	adds r3, r0, #0
	cmp r1, #1
	beq _0807A9A6
	cmp r1, #2
	bne _0807A9AE
	adds r0, #0x21
	ldrb r0, [r0]
	cmp r0, #0
	bne _0807A9A6
	movs r2, #1
_0807A9A6:
	ldrb r0, [r3, #0xd]
	cmp r0, #0
	bne _0807A9AE
	movs r2, #0
_0807A9AE:
	movs r0, #1
	negs r0, r0
	cmp r2, r0
	beq _0807A9F4
	lsls r0, r2, #2
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r0, r0, r3
	ldr r0, [r0]
	ldr r0, [r0]
	ldrb r4, [r0, #4]
	cmp r4, #1
	beq _0807A9CC
	cmp r4, #0xf
	bne _0807A9DE
_0807A9CC:
	movs r0, #0x65
	bl CheckEventId
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0807A9DE
	movs r0, #0x65
	bl UnsetEventId
_0807A9DE:
	adds r0, r4, #0
	bl sub_80835A8
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0807A9F4
	bl DeleteBattleAnimInfoThing
	adds r0, r4, #0
	bl sub_80835DC
_0807A9F4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807A9FC: .4byte gUnknown_0203E1F0

	THUMB_FUNC_END sub_807A984

	THUMB_FUNC_START sub_807AA00
sub_807AA00: @ 0x0807AA00
	push {lr}
	movs r3, #1
	negs r3, r3
	ldr r0, _0807AA48  @ gUnknown_0203E1F0
	adds r2, r0, #0
	adds r2, #0x5e
	ldrb r2, [r2]
	adds r1, r0, #0
	cmp r2, #1
	beq _0807AA22
	cmp r2, #2
	bne _0807AA2A
	adds r0, #0x21
	ldrb r0, [r0]
	cmp r0, #0
	bne _0807AA22
	movs r3, #1
_0807AA22:
	ldrb r0, [r1, #0xd]
	cmp r0, #0
	bne _0807AA2A
	movs r3, #0
_0807AA2A:
	movs r0, #1
	negs r0, r0
	cmp r3, r0
	beq _0807AA42
	lsls r0, r3, #2
	adds r0, r0, r3
	lsls r0, r0, #2
	adds r1, #8
	adds r0, r0, r1
	ldr r0, [r0]
	bl MU_StartDeathFade
_0807AA42:
	pop {r0}
	bx r0
	.align 2, 0
_0807AA48: .4byte gUnknown_0203E1F0

	THUMB_FUNC_END sub_807AA00

	THUMB_FUNC_START sub_807AA4C
sub_807AA4C: @ 0x0807AA4C
	push {r4, lr}
	adds r1, r0, #0
	movs r4, #1
	negs r4, r4
	ldr r0, _0807AAD4  @ gUnknown_0203E1F0
	adds r2, r0, #0
	adds r2, #0x5e
	ldrb r2, [r2]
	adds r3, r0, #0
	cmp r2, #1
	beq _0807AA76
	cmp r2, #2
	bne _0807AA86
	ldr r0, [r3, #0x18]
	adds r0, #0x6e
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0807AA76
	movs r4, #1
_0807AA76:
	ldr r0, [r3, #4]
	adds r0, #0x6e
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0807AA86
	movs r4, #0
_0807AA86:
	cmp r4, #0
	blt _0807AACE
	ldr r0, _0807AAD8  @ gUnknown_089A36F8
	bl Proc_StartBlocking
	adds r3, r0, #0
	ldr r0, _0807AAD4  @ gUnknown_0203E1F0
	lsls r1, r4, #2
	adds r1, r1, r4
	lsls r1, r1, #2
	adds r0, #4
	adds r1, r1, r0
	ldr r0, [r1]
	adds r0, #0x71
	movs r2, #0
	ldrsb r2, [r0, r2]
	adds r0, r3, #0
	adds r0, #0x64
	strh r2, [r0]
	ldr r0, [r1]
	adds r1, r0, #0
	adds r1, #0x71
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, #0x6e
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r1, r1, r0
	adds r2, r3, #0
	adds r2, #0x66
	strh r1, [r2]
	adds r0, r3, #0
	adds r0, #0x68
	strh r4, [r0]
_0807AACE:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807AAD4: .4byte gUnknown_0203E1F0
_0807AAD8: .4byte gUnknown_089A36F8

	THUMB_FUNC_END sub_807AA4C

	THUMB_FUNC_START sub_807AADC
sub_807AADC: @ 0x0807AADC
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r6, r0, #0
	bl SetDefaultColorEffects
	ldr r5, _0807AB2C  @ gUnknown_0203E1F0
	adds r0, r5, #0
	adds r0, #0x62
	ldrb r0, [r0]
	cmp r0, #2
	bgt _0807AAF6
	cmp r0, #1
	bge _0807ABAE
_0807AAF6:
	ldr r0, [r5, #4]
	adds r0, #0x4a
	ldrh r0, [r0]
	bl GetSpellAssocReturnBool
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0807ABAE
	adds r1, r5, #0
	adds r1, #0x5e
	ldrb r0, [r1]
	cmp r0, #1
	bne _0807AB34
	ldr r0, [r5]
	ldrb r0, [r0, #0x11]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #4
	ldr r1, _0807AB30  @ gUnknown_0202BCB0
	movs r2, #0xe
	ldrsh r1, [r1, r2]
	subs r0, r0, r1
	cmp r0, #0x6f
	ble _0807AB9C
	subs r0, #0x28
	b _0807AB9E
	.align 2, 0
_0807AB2C: .4byte gUnknown_0203E1F0
_0807AB30: .4byte gUnknown_0202BCB0
_0807AB34:
	ldrb r1, [r1]
	cmp r1, #0
	beq _0807AB5A
	ldr r0, _0807AB6C  @ gUnknown_0202BCB0
	movs r2, #0xe
	ldrsh r4, [r0, r2]
	adds r2, r5, #0
	mov r3, sp
_0807AB44:
	ldr r0, [r2]
	ldrb r0, [r0, #0x11]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #4
	subs r0, r0, r4
	stm r3!, {r0}
	adds r2, #0x14
	subs r1, #1
	cmp r1, #0
	bne _0807AB44
_0807AB5A:
	ldr r0, [sp]
	ldr r2, [sp, #4]
	subs r1, r0, r2
	adds r3, r0, #0
	cmp r1, #0
	blt _0807AB70
	cmp r1, #0x4f
	bgt _0807AB76
	b _0807AB7A
	.align 2, 0
_0807AB6C: .4byte gUnknown_0202BCB0
_0807AB70:
	subs r0, r2, r3
	cmp r0, #0x4f
	ble _0807AB7A
_0807AB76:
	movs r0, #0x40
	b _0807AB9E
_0807AB7A:
	movs r1, #0
	ldr r0, [sp, #4]
	cmp r3, r0
	bgt _0807AB84
	movs r1, #1
_0807AB84:
	lsls r0, r1, #2
	add r0, sp
	ldr r0, [r0]
	cmp r0, #0x6f
	ble _0807AB9C
	movs r0, #1
	subs r0, r0, r1
	lsls r0, r0, #2
	add r0, sp
	ldr r0, [r0]
	subs r0, #0x28
	b _0807AB9E
_0807AB9C:
	adds r0, #0x18
_0807AB9E:
	cmp r0, #0
	bge _0807ABA4
	adds r0, #7
_0807ABA4:
	asrs r1, r0, #3
	movs r0, #0xf
	adds r2, r6, #0
	bl NewMapBattleInfoThing
_0807ABAE:
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_807AADC

	THUMB_FUNC_START MapAnim_CallBattleQuoteEvents
MapAnim_CallBattleQuoteEvents: @ 0x0807ABB8
	push {lr}
	ldr r1, _0807ABDC  @ gUnknown_0203E1F0
	adds r0, r1, #0
	adds r0, #0x5e
	ldrb r0, [r0]
	cmp r0, #2
	bne _0807ABD6
	ldr r0, [r1]
	ldr r0, [r0]
	ldrb r0, [r0, #4]
	ldr r1, [r1, #0x14]
	ldr r1, [r1]
	ldrb r1, [r1, #4]
	bl CallBattleQuoteEventsIfAny
_0807ABD6:
	pop {r0}
	bx r0
	.align 2, 0
_0807ABDC: .4byte gUnknown_0203E1F0

	THUMB_FUNC_END MapAnim_CallBattleQuoteEvents

	THUMB_FUNC_START sub_807ABE0
sub_807ABE0: @ 0x0807ABE0
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	ldr r2, _0807AC48  @ gUnknown_0203E1F0
	ldr r0, [r2]
	movs r1, #0xb
	ldrsb r1, [r0, r1]
	movs r3, #0xc0
	ands r1, r3
	ldr r0, [r2, #0x14]
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ands r0, r3
	adds r7, r2, #0
	cmp r1, r0
	bne _0807AC1C
	ldr r0, [r7, #4]
	adds r0, #0x55
	ldrb r0, [r0]
	cmp r0, #0x1b
	beq _0807AC1C
	cmp r0, #0x33
	beq _0807AC1C
	ldr r0, [r7, #0x18]
	adds r0, #0x55
	ldrb r0, [r0]
	cmp r0, #0x1b
	beq _0807AC1C
	cmp r0, #0x33
	bne _0807ACA2
_0807AC1C:
	lsls r1, r6, #2
	adds r0, r1, r6
	lsls r0, r0, #2
	adds r0, r0, r7
	ldr r2, [r0]
	ldr r0, [r2, #4]
	ldrb r0, [r0, #4]
	adds r5, r1, #0
	cmp r0, #0x3c
	bne _0807ACA2
	adds r0, r2, #0
	adds r0, #0x30
	ldrb r0, [r0]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1c
	cmp r0, #0xb
	beq _0807ACA2
	cmp r0, #0xb
	bgt _0807AC4C
	cmp r0, #2
	beq _0807ACA2
	b _0807AC50
	.align 2, 0
_0807AC48: .4byte gUnknown_0203E1F0
_0807AC4C:
	cmp r0, #0xd
	beq _0807ACA2
_0807AC50:
	movs r1, #1
	eors r1, r6
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r4, r7, #4
	adds r0, r0, r4
	ldr r0, [r0]
	adds r0, #0x4a
	ldrh r0, [r0]
	bl GetItemIndex
	cmp r0, #0x51
	blt _0807AC74
	cmp r0, #0x53
	ble _0807ACA2
	cmp r0, #0xb5
	beq _0807ACA2
_0807AC74:
	adds r0, r5, r6
	lsls r5, r0, #2
	adds r0, r5, r4
	ldr r0, [r0]
	adds r0, #0x4a
	ldrh r0, [r0]
	bl GetItemIndex
	cmp r0, #0xaa
	bne _0807ACA2
	adds r4, r7, #0
	adds r4, #8
	adds r4, r5, r4
	ldr r0, [r4]
	adds r1, r6, #0
	adds r1, #8
	bl MU_SetPaletteId
	ldr r0, [r4]
	ldr r2, _0807ACA8  @ gUnknown_089A8F74
	movs r1, #0xe
	bl MU_SetSpecialSprite
_0807ACA2:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807ACA8: .4byte gUnknown_089A8F74

	THUMB_FUNC_END sub_807ABE0

	THUMB_FUNC_START sub_807ACAC
sub_807ACAC: @ 0x0807ACAC
	push {lr}
	ldr r0, _0807ACCC  @ gUnknown_0203E1F0
	adds r0, #0x5e
	ldrb r0, [r0]
	cmp r0, #1
	beq _0807ACC2
	cmp r0, #2
	bne _0807ACC8
	movs r0, #1
	bl sub_807ABE0
_0807ACC2:
	movs r0, #0
	bl sub_807ABE0
_0807ACC8:
	pop {r0}
	bx r0
	.align 2, 0
_0807ACCC: .4byte gUnknown_0203E1F0

	THUMB_FUNC_END sub_807ACAC

	THUMB_FUNC_START PlaySoundIdA0
PlaySoundIdA0: @ 0x0807ACD0
	push {lr}
	ldr r0, _0807ACE8  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0807ACE4
	movs r0, #0xa0
	bl m4aSongNumStart
_0807ACE4:
	pop {r0}
	bx r0
	.align 2, 0
_0807ACE8: .4byte gRAMChapterData

	THUMB_FUNC_END PlaySoundIdA0

	THUMB_FUNC_START sub_807ACEC
sub_807ACEC: @ 0x0807ACEC
	push {lr}
	ldr r0, _0807AD04  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0807AD00
	movs r0, #0xa0
	bl m4aSongNumStart
_0807AD00:
	pop {r0}
	bx r0
	.align 2, 0
_0807AD04: .4byte gRAMChapterData

	THUMB_FUNC_END sub_807ACEC

	THUMB_FUNC_START New6C_SummonGfx_FromActionPos
New6C_SummonGfx_FromActionPos: @ 0x0807AD08
	push {lr}
	ldr r2, _0807AD18  @ gActionData
	ldrb r1, [r2, #0x13]
	ldrb r2, [r2, #0x14]
	bl New6C_SummonGfx
	pop {r0}
	bx r0
	.align 2, 0
_0807AD18: .4byte gActionData

	THUMB_FUNC_END New6C_SummonGfx_FromActionPos

	THUMB_FUNC_START sub_807AD1C
sub_807AD1C: @ 0x0807AD1C
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	sub sp, #0x80
	bl AdvanceGetLCGRNValue
	movs r1, #0x65
	bl DivRem
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldr r6, _0807AD4C  @ 0x0000FFFF
	movs r4, #0
	ldr r0, _0807AD50  @ gActiveUnit
	ldr r0, [r0]
	ldr r0, [r0]
	ldr r1, _0807AD54  @ gUnknown_0895F5A4
	ldrb r0, [r0, #4]
	ldrb r1, [r1]
	cmp r0, r1
	bne _0807AD58
	movs r6, #0
	b _0807AD80
	.align 2, 0
_0807AD4C: .4byte 0x0000FFFF
_0807AD50: .4byte gActiveUnit
_0807AD54: .4byte gUnknown_0895F5A4
_0807AD58:
	lsls r0, r4, #0x10
	movs r1, #0x80
	lsls r1, r1, #9
	adds r0, r0, r1
	lsrs r4, r0, #0x10
	lsls r5, r4, #0x10
	asrs r3, r5, #0x10
	cmp r3, #2
	bgt _0807AD80
	ldr r0, _0807ADFC  @ gActiveUnit
	ldr r0, [r0]
	ldr r2, [r0]
	ldr r1, _0807AE00  @ gUnknown_0895F5A4
	lsls r0, r3, #1
	adds r0, r0, r1
	ldrb r1, [r2, #4]
	ldrb r0, [r0]
	cmp r1, r0
	bne _0807AD58
	lsrs r6, r5, #0x10
_0807AD80:
	lsls r0, r6, #0x10
	asrs r2, r0, #0x10
	movs r1, #1
	negs r1, r1
	mov r8, r0
	cmp r2, r1
	bne _0807AD90
	b _0807AFC0
_0807AD90:
	movs r4, #1
	lsls r1, r2, #1
	ldr r0, _0807AE04  @ gUnknown_0895F5A5
	adds r5, r1, r0
_0807AD98:
	adds r0, r4, #0
	bl GetUnit
	adds r1, r0, #0
	cmp r1, #0
	beq _0807ADB8
	ldr r0, [r1]
	cmp r0, #0
	beq _0807ADB8
	ldrb r0, [r0, #4]
	ldrb r2, [r5]
	cmp r0, r2
	bne _0807ADB8
	adds r0, r1, #0
	bl ClearUnit
_0807ADB8:
	adds r4, #1
	cmp r4, #0x3f
	ble _0807AD98
	movs r5, #0
	ldr r2, _0807AE08  @ gUnknown_03001C38
	ldr r3, _0807AE00  @ gUnknown_0895F5A4
	mov r1, r8
	asrs r0, r1, #0xf
	adds r1, r3, #1
	adds r0, r0, r1
	ldrb r0, [r0]
	strb r0, [r2]
	movs r0, #0x51
	strb r0, [r2, #1]
	strb r5, [r2, #2]
	ldrb r1, [r2, #3]
	movs r0, #1
	adds r4, r1, #0
	orrs r4, r0
	strb r4, [r2, #3]
	ldr r1, _0807ADFC  @ gActiveUnit
	ldr r0, [r1]
	movs r5, #0xb
	ldrsb r5, [r0, r5]
	movs r0, #0xc0
	ands r5, r0
	mov ip, r1
	mov r9, r3
	adds r6, r2, #0
	cmp r5, #0
	bne _0807AE0C
	subs r0, #0xc7
	ands r4, r0
	b _0807AE28
	.align 2, 0
_0807ADFC: .4byte gActiveUnit
_0807AE00: .4byte gUnknown_0895F5A4
_0807AE04: .4byte gUnknown_0895F5A5
_0807AE08: .4byte gUnknown_03001C38
_0807AE0C:
	cmp r5, #0x80
	bne _0807AE1A
	movs r0, #7
	negs r0, r0
	ands r4, r0
	movs r0, #4
	b _0807AE26
_0807AE1A:
	cmp r5, #0x40
	bne _0807AE2A
	movs r0, #7
	negs r0, r0
	ands r4, r0
	movs r0, #2
_0807AE26:
	orrs r4, r0
_0807AE28:
	strb r4, [r6, #3]
_0807AE2A:
	mov r2, ip
	ldr r0, [r2]
	ldrb r1, [r0, #8]
	lsls r1, r1, #3
	ldrb r2, [r6, #3]
	movs r0, #7
	ands r0, r2
	orrs r0, r1
	strb r0, [r6, #3]
	ldr r3, _0807AEAC  @ gActionData
	movs r0, #0x3f
	ldrb r1, [r3, #0x13]
	ands r1, r0
	ldrb r2, [r6, #4]
	movs r0, #0x40
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r6, #4]
	ldrb r1, [r3, #0x14]
	movs r0, #0x3f
	ands r1, r0
	lsls r1, r1, #6
	ldrh r2, [r6, #4]
	ldr r0, _0807AEB0  @ 0xFFFFF03F
	ands r0, r2
	orrs r0, r1
	strh r0, [r6, #4]
	movs r0, #0
	strb r0, [r6, #7]
	str r0, [r6, #8]
	ldrb r1, [r6, #5]
	subs r0, #0x11
	ands r0, r1
	movs r1, #0x21
	negs r1, r1
	ands r0, r1
	strb r0, [r6, #5]
	movs r4, #0
	adds r3, r6, #0
	adds r3, #0xc
	movs r2, #0
_0807AE7E:
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	adds r1, r0, r3
	strb r2, [r1]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #3
	ble _0807AE7E
	mov r1, ip
	ldr r0, [r1]
	ldrb r0, [r0, #8]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #5
	ble _0807AEF8
	cmp r0, #0xa
	bgt _0807AEB4
	cmp r7, #5
	bhi _0807AEF8
	movs r0, #0x27
	b _0807AEFA
	.align 2, 0
_0807AEAC: .4byte gActionData
_0807AEB0: .4byte 0xFFFFF03F
_0807AEB4:
	cmp r0, #0xf
	bgt _0807AECE
	cmp r7, #5
	bhi _0807AEC0
	movs r0, #0x27
	b _0807AEFA
_0807AEC0:
	subs r0, r7, #6
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x13
	bhi _0807AEF8
	movs r0, #0x24
	b _0807AEFA
_0807AECE:
	cmp r0, #0x14
	bgt _0807AEFC
	cmp r7, #5
	bhi _0807AEDA
	movs r0, #0x27
	b _0807AEFA
_0807AEDA:
	subs r0, r7, #6
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x13
	bhi _0807AEE8
	movs r0, #0x24
	b _0807AEFA
_0807AEE8:
	adds r0, r7, #0
	subs r0, #0x1a
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xa
	bhi _0807AEF8
	movs r0, #0x29
	b _0807AEFA
_0807AEF8:
	movs r0, #0x1f
_0807AEFA:
	strb r0, [r6, #0xc]
_0807AEFC:
	movs r4, #0
	ldr r3, _0807AF8C  @ gUnknown_03001C48
	movs r2, #0
_0807AF02:
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	adds r1, r0, r3
	strb r2, [r1]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #3
	ble _0807AF02
	mov r2, r8
	asrs r0, r2, #0xf
	mov r1, r9
	adds r1, #1
	adds r6, r0, r1
	ldrb r0, [r6]
	bl GetUnitFromCharId
	adds r5, r0, #0
	cmp r5, #0
	bne _0807AF48
	ldr r4, _0807AF90  @ gBattleActor
	mov r0, sp
	adds r1, r4, #0
	movs r2, #0x80
	bl memcpy
	ldr r0, _0807AF94  @ gUnknown_03001C38
	bl LoadUnits
	adds r0, r4, #0
	mov r1, sp
	movs r2, #0x80
	bl memcpy
_0807AF48:
	ldrb r0, [r6]
	bl GetUnitFromCharId
	adds r5, r0, #0
	movs r4, #0
	adds r2, r5, #0
	adds r2, #0x28
	movs r3, #0
_0807AF58:
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	adds r1, r2, r0
	strb r3, [r1]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #3
	ble _0807AF58
	ldr r1, _0807AF98  @ gActiveUnit
	ldr r0, [r1]
	ldrb r0, [r0, #8]
	strb r0, [r5, #8]
	movs r0, #0xff
	strb r0, [r5, #9]
	ldr r0, [r1]
	ldrb r0, [r0, #8]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #5
	bgt _0807AF9C
	adds r1, r5, #0
	adds r1, #0x2a
	movs r0, #0x1f
	b _0807AFBE
	.align 2, 0
_0807AF8C: .4byte gUnknown_03001C48
_0807AF90: .4byte gBattleActor
_0807AF94: .4byte gUnknown_03001C38
_0807AF98: .4byte gActiveUnit
_0807AF9C:
	cmp r0, #0xa
	bgt _0807AFA8
	adds r1, r5, #0
	adds r1, #0x2a
	movs r0, #0x47
	b _0807AFBE
_0807AFA8:
	cmp r0, #0xf
	bgt _0807AFB4
	adds r1, r5, #0
	adds r1, #0x2a
	movs r0, #0x79
	b _0807AFBE
_0807AFB4:
	cmp r0, #0x14
	bgt _0807AFC0
	adds r1, r5, #0
	adds r1, #0x2a
	movs r0, #0xb5
_0807AFBE:
	strb r0, [r1]
_0807AFC0:
	add sp, #0x80
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_807AD1C

	THUMB_FUNC_START sub_807AFD0
sub_807AFD0: @ 0x0807AFD0
	adds r1, r0, #0
	adds r1, #0x64
	movs r2, #0
	strh r2, [r1]
	adds r0, #0x66
	strh r2, [r0]
	bx lr

	THUMB_FUNC_END sub_807AFD0

	THUMB_FUNC_START sub_807AFE0
sub_807AFE0: @ 0x0807AFE0
	push {lr}
	adds r1, r0, #0
	adds r0, #0x64
	movs r2, #0
	ldrsh r0, [r0, r2]
	cmp r0, #7
	bgt _0807AFF6
	adds r0, r1, #0
	movs r1, #0
	bl Proc_Goto
_0807AFF6:
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_807AFE0

	THUMB_FUNC_START sub_807AFFC
sub_807AFFC: @ 0x0807AFFC
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	movs r5, #0
	movs r4, #0x81
_0807B004:
	adds r0, r4, #0
	bl GetUnit
	cmp r0, #0
	beq _0807B022
	ldr r0, [r0]
	cmp r0, #0
	beq _0807B022
	lsls r0, r5, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x27
	bgt _0807B044
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
_0807B022:
	adds r4, #1
	cmp r4, #0xbf
	ble _0807B004
	adds r0, r6, #0
	adds r0, #0x64
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #7
	bgt _0807B044
	adds r0, r6, #0
	adds r0, #0x66
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #3
	bgt _0807B044
	movs r0, #0
	b _0807B04E
_0807B044:
	adds r0, r6, #0
	movs r1, #1
	bl Proc_Goto
	movs r0, #1
_0807B04E:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_807AFFC

	THUMB_FUNC_START sub_807B054
sub_807B054: @ 0x0807B054
	push {lr}
	ldr r0, _0807B06C  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0807B068
	movs r0, #0xa0
	bl m4aSongNumStart
_0807B068:
	pop {r0}
	bx r0
	.align 2, 0
_0807B06C: .4byte gRAMChapterData

	THUMB_FUNC_END sub_807B054

	THUMB_FUNC_START sub_807B070
sub_807B070: @ 0x0807B070
	push {lr}
	adds r2, r0, #0
	adds r2, #0x64
	ldrh r1, [r2]
	adds r1, #1
	movs r3, #0
	strh r1, [r2]
	adds r1, r0, #0
	adds r1, #0x66
	strh r3, [r1]
	ldr r1, [r0, #0x3c]
	ldr r2, [r0, #0x40]
	bl New6C_SummonGfx
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_807B070

	THUMB_FUNC_START sub_807B090
sub_807B090: @ 0x0807B090
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x74
	mov r9, r0
	mov r8, r1
	str r2, [sp, #0x6c]
	movs r6, #0
	mov r0, r8
	subs r0, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	lsls r2, r5, #0x10
	asrs r1, r2, #0x10
	mov r0, r8
	adds r0, #2
	cmp r1, r0
	bge _0807B172
_0807B0B8:
	asrs r1, r2, #0x10
	lsls r3, r5, #0x10
	movs r0, #2
	add r0, r8
	mov sl, r0
	cmp r1, #0
	blt _0807B162
	ldr r0, _0807B194  @ gBmMapSize
	movs r2, #2
	ldrsh r0, [r0, r2]
	cmp r0, r1
	ble _0807B162
	mov r0, r9
	subs r0, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	lsls r1, r4, #0x10
	asrs r0, r1, #0x10
	mov r7, r9
	adds r7, #2
	cmp r0, r7
	bge _0807B162
_0807B0E4:
	asrs r1, r1, #0x10
	cmp r1, #0
	blt _0807B150
	ldr r0, _0807B194  @ gBmMapSize
	movs r2, #0
	ldrsh r0, [r0, r2]
	cmp r0, r1
	ble _0807B150
	ldr r0, _0807B198  @ gBmMapUnit
	ldr r0, [r0]
	asrs r2, r3, #0xe
	adds r0, r2, r0
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0
	bne _0807B150
	ldr r0, _0807B19C  @ gRAMChapterData
	ldrb r0, [r0, #0xd]
	cmp r0, #0
	beq _0807B11E
	ldr r0, _0807B1A0  @ gBmMapFog
	ldr r0, [r0]
	adds r0, r2, r0
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _0807B150
_0807B11E:
	ldr r0, _0807B1A4  @ gBmMapTerrain
	ldr r0, [r0]
	adds r0, r2, r0
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r1, [r0]
	ldr r0, _0807B1A8  @ gBattleActor
	str r3, [sp, #0x70]
	bl CanUnitCrossTerrain
	ldr r3, [sp, #0x70]
	cmp r0, #0
	beq _0807B150
	lsls r0, r6, #1
	adds r0, r0, r6
	lsls r0, r0, #2
	mov r2, sp
	adds r1, r2, r0
	strb r4, [r1]
	strb r5, [r1, #1]
	movs r0, #1
	strb r0, [r1, #2]
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
_0807B150:
	lsls r0, r4, #0x10
	movs r4, #0x80
	lsls r4, r4, #9
	adds r0, r0, r4
	lsrs r4, r0, #0x10
	lsls r1, r4, #0x10
	asrs r0, r1, #0x10
	cmp r0, r7
	blt _0807B0E4
_0807B162:
	movs r1, #0x80
	lsls r1, r1, #9
	adds r0, r3, r1
	lsrs r5, r0, #0x10
	lsls r2, r5, #0x10
	asrs r0, r2, #0x10
	cmp r0, sl
	blt _0807B0B8
_0807B172:
	cmp r6, #0
	beq _0807B1AC
	adds r0, r6, #0
	bl NextRN_N
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r2, r0, #1
	adds r2, r2, r0
	lsls r2, r2, #2
	ldr r1, [sp, #0x6c]
	mov r3, sp
	adds r0, r3, r2
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	movs r0, #1
	b _0807B1B0
	.align 2, 0
_0807B194: .4byte gBmMapSize
_0807B198: .4byte gBmMapUnit
_0807B19C: .4byte gRAMChapterData
_0807B1A0: .4byte gBmMapFog
_0807B1A4: .4byte gBmMapTerrain
_0807B1A8: .4byte gBattleActor
_0807B1AC:
	movs r0, #1
	negs r0, r0
_0807B1B0:
	add sp, #0x74
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_807B090

	THUMB_FUNC_START sub_807B1C0
sub_807B1C0: @ 0x0807B1C0
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r4, r0, #0
	lsls r1, r1, #0x18
	lsrs r5, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r6, r2, #0x18
	lsls r3, r3, #0x10
	lsrs r7, r3, #0x10
	bl sub_807AFFC
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0807B22C
	lsls r0, r5, #0x18
	asrs r0, r0, #0x18
	lsls r1, r6, #0x18
	asrs r1, r1, #0x18
	mov r2, sp
	bl sub_807B090
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #1
	negs r1, r1
	cmp r0, r1
	beq _0807B202
	mov r0, sp
	ldrb r0, [r0, #2]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, r1
	bne _0807B218
_0807B202:
	adds r1, r4, #0
	adds r1, #0x66
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	lsls r1, r7, #0x10
	asrs r1, r1, #0x10
	adds r0, r4, #0
	bl Proc_Goto
	b _0807B22C
_0807B218:
	mov r0, sp
	movs r1, #0
	ldrsb r1, [r0, r1]
	str r1, [r4, #0x3c]
	movs r2, #1
	ldrsb r2, [r0, r2]
	str r2, [r4, #0x40]
	adds r0, r4, #0
	bl EnsureCameraOntoPosition
_0807B22C:
	add sp, #0xc
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_807B1C0

	THUMB_FUNC_START sub_807B234
sub_807B234: @ 0x0807B234
	push {lr}
	ldr r2, _0807B250  @ gBattleActor
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	ldrb r2, [r2, #0x11]
	adds r2, #4
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	movs r3, #3
	bl sub_807B1C0
	pop {r0}
	bx r0
	.align 2, 0
_0807B250: .4byte gBattleActor

	THUMB_FUNC_END sub_807B234

	THUMB_FUNC_START sub_807B254
sub_807B254: @ 0x0807B254
	push {lr}
	ldr r2, _0807B270  @ gBattleActor
	ldrb r1, [r2, #0x10]
	adds r1, #4
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	ldrb r2, [r2, #0x11]
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	movs r3, #4
	bl sub_807B1C0
	pop {r0}
	bx r0
	.align 2, 0
_0807B270: .4byte gBattleActor

	THUMB_FUNC_END sub_807B254

	THUMB_FUNC_START sub_807B274
sub_807B274: @ 0x0807B274
	push {lr}
	ldr r2, _0807B290  @ gBattleActor
	ldrb r1, [r2, #0x10]
	subs r1, #4
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	ldrb r2, [r2, #0x11]
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	movs r3, #5
	bl sub_807B1C0
	pop {r0}
	bx r0
	.align 2, 0
_0807B290: .4byte gBattleActor

	THUMB_FUNC_END sub_807B274

	THUMB_FUNC_START sub_807B294
sub_807B294: @ 0x0807B294
	push {lr}
	ldr r2, _0807B2B0  @ gBattleActor
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	ldrb r2, [r2, #0x11]
	subs r2, #4
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	movs r3, #6
	bl sub_807B1C0
	pop {r0}
	bx r0
	.align 2, 0
_0807B2B0: .4byte gBattleActor

	THUMB_FUNC_END sub_807B294

	THUMB_FUNC_START sub_807B2B4
sub_807B2B4: @ 0x0807B2B4
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	bl AdvanceGetLCGRNValue
	movs r1, #0xb
	bl DivRem
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r3, _0807B328  @ gUnknown_03001C50
	ldr r4, _0807B32C  @ gUnknown_088D1F54
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r2, r3, #0
	adds r1, r1, r4
	ldm r1!, {r4, r6, r7}
	stm r2!, {r4, r6, r7}
	ldm r1!, {r4, r6}
	stm r2!, {r4, r6}
	ldrb r1, [r3, #3]
	movs r2, #1
	orrs r1, r2
	movs r2, #7
	negs r2, r2
	ands r1, r2
	movs r2, #4
	orrs r1, r2
	adds r0, #5
	lsls r0, r0, #3
	movs r2, #7
	ands r1, r2
	orrs r1, r0
	strb r1, [r3, #3]
	movs r0, #0x3f
	ldrh r1, [r5, #0x3c]
	ands r1, r0
	ldrb r2, [r3, #4]
	movs r0, #0x40
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3, #4]
	ldr r1, [r5, #0x40]
	movs r0, #0x3f
	ands r1, r0
	lsls r1, r1, #6
	ldrh r2, [r3, #4]
	ldr r0, _0807B330  @ 0xFFFFF03F
	ands r0, r2
	orrs r0, r1
	strh r0, [r3, #4]
	adds r0, r3, #0
	bl LoadUnits
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807B328: .4byte gUnknown_03001C50
_0807B32C: .4byte gUnknown_088D1F54
_0807B330: .4byte 0xFFFFF03F

	THUMB_FUNC_END sub_807B2B4

	THUMB_FUNC_START MakeBattleMOVEUNIT
MakeBattleMOVEUNIT: @ 0x0807B334
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	mov r9, r0
	adds r7, r1, #0
	mov r8, r2
	cmp r7, #0
	beq _0807B3AA
	ldr r5, _0807B3B8  @ gUnknown_0203E1F0
	lsls r6, r0, #2
	adds r4, r6, r0
	lsls r4, r4, #2
	adds r0, r4, r5
	str r2, [r0]
	adds r0, r5, #4
	adds r0, r4, r0
	str r7, [r0]
	mov r0, r8
	bl MU_Create
	adds r5, #8
	adds r4, r4, r5
	str r0, [r4]
	ldr r0, [r0, #0x30]
	movs r1, #0
	strh r1, [r0, #0x18]
	ldr r0, [r4]
	ldr r0, [r0, #0x30]
	strh r1, [r0, #0x1a]
	adds r0, r7, #0
	adds r0, #0x55
	ldrb r0, [r0]
	cmp r0, #0x1b
	beq _0807B37E
	cmp r0, #0x33
	bne _0807B384
_0807B37E:
	ldr r0, [r4]
	bl MU_Hide
_0807B384:
	mov r0, r8
	adds r0, #0x30
	ldrb r0, [r0]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1c
	cmp r0, #0xb
	beq _0807B396
	cmp r0, #0xd
	bne _0807B3AA
_0807B396:
	ldr r0, _0807B3B8  @ gUnknown_0203E1F0
	mov r2, r9
	adds r1, r6, r2
	lsls r1, r1, #2
	adds r0, #8
	adds r1, r1, r0
	ldr r0, [r1]
	movs r1, #0xf
	bl MU_SetPaletteId
_0807B3AA:
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807B3B8: .4byte gUnknown_0203E1F0

	THUMB_FUNC_END MakeBattleMOVEUNIT

	THUMB_FUNC_START SetBattleAnimFacing
SetBattleAnimFacing: @ 0x0807B3BC
	push {r4, r5, r6, lr}
	adds r3, r0, #0
	adds r6, r1, #0
	cmp r2, #1
	beq _0807B418
	cmp r2, #1
	bgt _0807B3D0
	cmp r2, #0
	beq _0807B3D6
	b _0807B45A
_0807B3D0:
	cmp r2, #2
	beq _0807B430
	b _0807B45A
_0807B3D6:
	ldr r5, _0807B414  @ gUnknown_0203E1F0
	lsls r4, r3, #2
	adds r4, r4, r3
	lsls r4, r4, #2
	adds r0, r4, r5
	ldr r1, [r0]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	ldrb r1, [r1, #0x11]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	lsls r2, r6, #2
	adds r2, r2, r6
	lsls r2, r2, #2
	adds r2, r2, r5
	ldr r3, [r2]
	movs r2, #0x10
	ldrsb r2, [r3, r2]
	ldrb r3, [r3, #0x11]
	lsls r3, r3, #0x18
	asrs r3, r3, #0x18
	bl GetFacingDirection
	adds r1, r0, #0
	adds r5, #8
	adds r4, r4, r5
	ldr r0, [r4]
	bl MU_SetFacing
	b _0807B45A
	.align 2, 0
_0807B414: .4byte gUnknown_0203E1F0
_0807B418:
	ldr r0, _0807B42C  @ gUnknown_0203E1F0
	lsls r1, r3, #2
	adds r1, r1, r3
	lsls r1, r1, #2
	adds r0, #8
	adds r1, r1, r0
	ldr r0, [r1]
	bl MU_SetDefaultFacing
	b _0807B45A
	.align 2, 0
_0807B42C: .4byte gUnknown_0203E1F0
_0807B430:
	ldr r5, _0807B460  @ gUnknown_0203E1F0
	lsls r4, r3, #2
	adds r4, r4, r3
	lsls r4, r4, #2
	adds r0, r4, r5
	ldr r1, [r0]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	ldrb r1, [r1, #0x11]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	movs r2, #0
	movs r3, #0
	bl GetFacingDirection
	adds r1, r0, #0
	adds r5, #8
	adds r4, r4, r5
	ldr r0, [r4]
	bl MU_SetFacing
_0807B45A:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807B460: .4byte gUnknown_0203E1F0

	THUMB_FUNC_END SetBattleAnimFacing

	THUMB_FUNC_START SetupBattleMOVEUNITs
SetupBattleMOVEUNITs: @ 0x0807B464
	push {r4, r5, lr}
	ldr r4, _0807B4C8  @ gUnknown_0203E1F0
	ldr r0, [r4, #4]
	adds r0, #0x4a
	ldrh r0, [r0]
	bl GetSpellAssocFacing
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	bl sub_807B4D0
	adds r4, #0x5e
	ldrb r0, [r4]
	cmp r0, #1
	beq _0807B4B6
	cmp r0, #2
	bne _0807B4C0
	ldr r0, _0807B4CC  @ gBattleHitArray
	ldr r0, [r0]
	lsls r0, r0, #0xd
	lsrs r0, r0, #0xd
	movs r1, #0x80
	lsls r1, r1, #3
	ands r0, r1
	cmp r0, #0
	beq _0807B4AC
	movs r0, #2
	movs r1, #1
	adds r2, r5, #0
	bl SetBattleAnimFacing
	movs r0, #3
	movs r1, #1
	adds r2, r5, #0
	bl SetBattleAnimFacing
_0807B4AC:
	movs r0, #1
	movs r1, #0
	adds r2, r5, #0
	bl SetBattleAnimFacing
_0807B4B6:
	movs r0, #0
	movs r1, #1
	adds r2, r5, #0
	bl SetBattleAnimFacing
_0807B4C0:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807B4C8: .4byte gUnknown_0203E1F0
_0807B4CC: .4byte gBattleHitArray

	THUMB_FUNC_END SetupBattleMOVEUNITs

	THUMB_FUNC_START sub_807B4D0
sub_807B4D0: @ 0x0807B4D0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	ldr r0, _0807B570  @ gUnknown_0203E1F0
	adds r0, #0x5e
	ldrb r0, [r0]
	mov ip, r0
	cmp r0, #1
	beq _0807B502
	cmp r0, #2
	bne _0807B502
	ldr r0, _0807B574  @ gBattleHitArray
	ldr r0, [r0]
	lsls r0, r0, #0xd
	lsrs r0, r0, #0xd
	movs r1, #0x80
	lsls r1, r1, #3
	ands r0, r1
	cmp r0, #0
	beq _0807B502
	movs r0, #4
	mov ip, r0
_0807B502:
	movs r2, #0
	movs r1, #1
	negs r1, r1
	add r1, ip
	mov sl, r1
	cmp r2, ip
	bge _0807B51C
_0807B510:
	mov r1, sp
	adds r0, r1, r2
	strb r2, [r0]
	adds r2, #1
	cmp r2, ip
	blt _0807B510
_0807B51C:
	movs r2, #0
	cmp r2, sl
	bge _0807B59C
_0807B522:
	adds r7, r2, #1
	cmp r7, ip
	bge _0807B596
	ldr r0, _0807B570  @ gUnknown_0203E1F0
	mov r9, r0
	mov r1, sp
	adds r6, r1, r2
	adds r4, r7, r1
	mov r0, ip
	subs r5, r0, r7
_0807B536:
	movs r1, #0
	mov r8, r1
	ldrb r1, [r6]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	add r0, r9
	ldr r3, [r0]
	ldrb r1, [r4]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	add r0, r9
	ldr r0, [r0]
	movs r2, #0x11
	ldrsb r2, [r3, r2]
	movs r1, #0x11
	ldrsb r1, [r0, r1]
	cmp r2, r1
	bne _0807B578
	movs r1, #0x10
	ldrsb r1, [r3, r1]
	ldrb r0, [r0, #0x10]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r1, r0
	blt _0807B580
	b _0807B586
	.align 2, 0
_0807B570: .4byte gUnknown_0203E1F0
_0807B574: .4byte gBattleHitArray
_0807B578:
	cmp r2, r1
	blt _0807B580
	movs r0, #1
	mov r8, r0
_0807B580:
	mov r1, r8
	cmp r1, #0
	beq _0807B58E
_0807B586:
	ldrb r1, [r6]
	ldrb r0, [r4]
	strb r0, [r6]
	strb r1, [r4]
_0807B58E:
	adds r4, #1
	subs r5, #1
	cmp r5, #0
	bne _0807B536
_0807B596:
	adds r2, r7, #0
	cmp r2, sl
	blt _0807B522
_0807B59C:
	movs r2, #0
	cmp r2, ip
	bge _0807B5C4
	ldr r4, _0807B5D4  @ gUnknown_0203E1F8
	ldr r3, _0807B5D8  @ gUnknown_08205714
_0807B5A6:
	mov r1, sp
	adds r0, r1, r2
	ldrb r1, [r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r0, [r0]
	ldr r1, [r0, #0x30]
	adds r0, r2, r3
	ldrb r0, [r0]
	strh r0, [r1, #0x1e]
	adds r2, #1
	cmp r2, ip
	blt _0807B5A6
_0807B5C4:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807B5D4: .4byte gUnknown_0203E1F8
_0807B5D8: .4byte gUnknown_08205714

	THUMB_FUNC_END sub_807B4D0

	THUMB_FUNC_START sub_807B5DC
sub_807B5DC: @ 0x0807B5DC
	push {r4, r5, lr}
	ldr r5, _0807B620  @ gBattleActor
	adds r2, r5, #0
	adds r2, #0x4a
	movs r1, #0
	movs r0, #0x6c
	strh r0, [r2]
	ldr r2, _0807B624  @ gUnknown_0203E1F0
	adds r0, r2, #0
	adds r0, #0x5f
	strb r1, [r0]
	adds r0, #3
	strb r1, [r0]
	adds r1, r2, #0
	adds r1, #0x5e
	movs r0, #1
	strb r0, [r1]
	ldr r4, _0807B628  @ gBattleHitArray
	str r4, [r2, #0x50]
	bl MapAnim_AdvanceBattleRound
	ldr r1, _0807B62C  @ gBattleTarget
	adds r0, r5, #0
	adds r2, r4, #0
	bl SetupMapBattleAnim
	ldr r0, _0807B630  @ gUnknown_089A31F8
	movs r1, #3
	bl Proc_Start
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807B620: .4byte gBattleActor
_0807B624: .4byte gUnknown_0203E1F0
_0807B628: .4byte gBattleHitArray
_0807B62C: .4byte gBattleTarget
_0807B630: .4byte gUnknown_089A31F8

	THUMB_FUNC_END sub_807B5DC

	THUMB_FUNC_START sub_807B634
sub_807B634: @ 0x0807B634
	push {r4, r5, lr}
	ldr r5, _0807B678  @ gBattleActor
	adds r2, r5, #0
	adds r2, #0x4a
	movs r1, #0
	movs r0, #0x6c
	strh r0, [r2]
	ldr r2, _0807B67C  @ gUnknown_0203E1F0
	adds r0, r2, #0
	adds r0, #0x5f
	strb r1, [r0]
	adds r0, #3
	strb r1, [r0]
	adds r1, r2, #0
	adds r1, #0x5e
	movs r0, #1
	strb r0, [r1]
	ldr r4, _0807B680  @ gBattleHitArray
	str r4, [r2, #0x50]
	bl MapAnim_AdvanceBattleRound
	ldr r1, _0807B684  @ gBattleTarget
	adds r0, r5, #0
	adds r2, r4, #0
	bl SetupMapBattleAnim
	ldr r0, _0807B688  @ gUnknown_089A3238
	movs r1, #3
	bl Proc_Start
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807B678: .4byte gBattleActor
_0807B67C: .4byte gUnknown_0203E1F0
_0807B680: .4byte gBattleHitArray
_0807B684: .4byte gBattleTarget
_0807B688: .4byte gUnknown_089A3238

	THUMB_FUNC_END sub_807B634

	THUMB_FUNC_START sub_807B68C
sub_807B68C: @ 0x0807B68C
	push {r4, r5, lr}
	ldr r5, _0807B6D0  @ gBattleActor
	adds r2, r5, #0
	adds r2, #0x4a
	movs r1, #0
	movs r0, #0x6c
	strh r0, [r2]
	ldr r2, _0807B6D4  @ gUnknown_0203E1F0
	adds r0, r2, #0
	adds r0, #0x5f
	strb r1, [r0]
	adds r0, #3
	strb r1, [r0]
	adds r1, r2, #0
	adds r1, #0x5e
	movs r0, #1
	strb r0, [r1]
	ldr r4, _0807B6D8  @ gBattleHitArray
	str r4, [r2, #0x50]
	bl MapAnim_AdvanceBattleRound
	ldr r1, _0807B6DC  @ gBattleTarget
	adds r0, r5, #0
	adds r2, r4, #0
	bl SetupMapBattleAnim
	ldr r0, _0807B6E0  @ gUnknown_089A3288
	movs r1, #3
	bl Proc_Start
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807B6D0: .4byte gBattleActor
_0807B6D4: .4byte gUnknown_0203E1F0
_0807B6D8: .4byte gBattleHitArray
_0807B6DC: .4byte gBattleTarget
_0807B6E0: .4byte gUnknown_089A3288

	THUMB_FUNC_END sub_807B68C

	THUMB_FUNC_START BeginMapAnimForSteal
BeginMapAnimForSteal: @ 0x0807B6E4
	push {r4, lr}
	ldr r0, _0807B72C  @ gBattleActor
	adds r4, r0, #0
	adds r4, #0x4a
	movs r2, #0
	movs r3, #1
	movs r1, #1
	strh r1, [r4]
	ldr r1, _0807B730  @ gUnknown_0203E1F0
	mov ip, r1
	adds r1, #0x5f
	strb r2, [r1]
	mov r1, ip
	adds r1, #0x62
	strb r3, [r1]
	mov r4, ip
	adds r4, #0x5e
	movs r1, #2
	strb r1, [r4]
	mov r1, ip
	adds r1, #0x58
	strb r2, [r1]
	adds r1, #1
	strb r3, [r1]
	ldr r1, _0807B734  @ gBattleTarget
	ldr r2, _0807B738  @ gBattleHitArray
	bl SetupMapBattleAnim
	ldr r0, _0807B73C  @ gUnknown_089A32C8
	movs r1, #3
	bl Proc_Start
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807B72C: .4byte gBattleActor
_0807B730: .4byte gUnknown_0203E1F0
_0807B734: .4byte gBattleTarget
_0807B738: .4byte gBattleHitArray
_0807B73C: .4byte gUnknown_089A32C8

	THUMB_FUNC_END BeginMapAnimForSteal

	THUMB_FUNC_START BeginMapAnimForSummon
BeginMapAnimForSummon: @ 0x0807B740
	push {lr}
	ldr r0, _0807B784  @ gBattleActor
	adds r2, r0, #0
	adds r2, #0x4a
	movs r3, #0
	movs r1, #0x4f
	strh r1, [r2]
	ldr r1, _0807B788  @ gUnknown_0203E1F0
	mov ip, r1
	adds r1, #0x5f
	strb r3, [r1]
	mov r2, ip
	adds r2, #0x62
	movs r1, #2
	strb r1, [r2]
	mov r1, ip
	adds r1, #0x5e
	movs r2, #1
	strb r2, [r1]
	subs r1, #6
	strb r3, [r1]
	adds r1, #1
	strb r2, [r1]
	ldr r1, _0807B78C  @ gBattleTarget
	ldr r2, _0807B790  @ gBattleHitArray
	bl SetupMapBattleAnim
	ldr r0, _0807B794  @ gUnknown_089A3398
	movs r1, #3
	bl Proc_Start
	pop {r0}
	bx r0
	.align 2, 0
_0807B784: .4byte gBattleActor
_0807B788: .4byte gUnknown_0203E1F0
_0807B78C: .4byte gBattleTarget
_0807B790: .4byte gBattleHitArray
_0807B794: .4byte gUnknown_089A3398

	THUMB_FUNC_END BeginMapAnimForSummon

	THUMB_FUNC_START BeginMapAnimForSummonDK
BeginMapAnimForSummonDK: @ 0x0807B798
	push {lr}
	ldr r0, _0807B7DC  @ gBattleActor
	adds r2, r0, #0
	adds r2, #0x4a
	movs r3, #0
	movs r1, #0x4f
	strh r1, [r2]
	ldr r1, _0807B7E0  @ gUnknown_0203E1F0
	mov ip, r1
	adds r1, #0x5f
	strb r3, [r1]
	mov r2, ip
	adds r2, #0x62
	movs r1, #2
	strb r1, [r2]
	mov r1, ip
	adds r1, #0x5e
	movs r2, #1
	strb r2, [r1]
	subs r1, #6
	strb r3, [r1]
	adds r1, #1
	strb r2, [r1]
	ldr r1, _0807B7E4  @ gBattleTarget
	ldr r2, _0807B7E8  @ gBattleHitArray
	bl SetupMapBattleAnim
	ldr r0, _0807B7EC  @ gUnknown_089A33C0
	movs r1, #3
	bl Proc_Start
	pop {r0}
	bx r0
	.align 2, 0
_0807B7DC: .4byte gBattleActor
_0807B7E0: .4byte gUnknown_0203E1F0
_0807B7E4: .4byte gBattleTarget
_0807B7E8: .4byte gBattleHitArray
_0807B7EC: .4byte gUnknown_089A33C0

	THUMB_FUNC_END BeginMapAnimForSummonDK

	THUMB_FUNC_START sub_807B7F0
sub_807B7F0: @ 0x0807B7F0
	push {r4, lr}
	ldr r0, _0807B840  @ gBattleActor
	adds r3, r0, #0
	adds r3, #0x4a
	movs r2, #0
	movs r1, #0x4f
	strh r1, [r3]
	ldr r3, _0807B844  @ gUnknown_0203E1F0
	adds r1, r3, #0
	adds r1, #0x5f
	strb r2, [r1]
	movs r1, #0x62
	adds r1, r1, r3
	mov ip, r1
	movs r1, #2
	mov r4, ip
	strb r1, [r4]
	movs r1, #0x5e
	adds r1, r1, r3
	mov ip, r1
	movs r1, #1
	mov r4, ip
	strb r1, [r4]
	adds r1, r3, #0
	adds r1, #0x58
	strb r2, [r1]
	adds r1, #1
	strb r2, [r1]
	ldr r1, _0807B848  @ gBattleTarget
	ldr r2, _0807B84C  @ gBattleHitArray
	bl SetupMapBattleAnim
	ldr r0, _0807B850  @ gUnknown_089A34B0
	movs r1, #3
	bl Proc_Start
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807B840: .4byte gBattleActor
_0807B844: .4byte gUnknown_0203E1F0
_0807B848: .4byte gBattleTarget
_0807B84C: .4byte gBattleHitArray
_0807B850: .4byte gUnknown_089A34B0

	THUMB_FUNC_END sub_807B7F0

	THUMB_FUNC_START BeginBattleMapAnims
BeginBattleMapAnims: @ 0x0807B854
	push {r4, r5, r6, lr}
	ldr r0, _0807B86C  @ gBattleStats
	ldrh r0, [r0]
	movs r1, #0x90
	lsls r1, r1, #2
	ands r1, r0
	cmp r1, #0
	beq _0807B870
	bl sub_807B7F0
	b _0807B8C8
	.align 2, 0
_0807B86C: .4byte gBattleStats
_0807B870:
	ldr r0, _0807B8AC  @ gUnknown_0203E1F0
	adds r2, r0, #0
	adds r2, #0x5f
	strb r1, [r2]
	adds r0, #0x62
	strb r1, [r0]
	ldr r4, _0807B8B0  @ gBattleActor
	ldr r5, _0807B8B4  @ gBattleTarget
	ldr r6, _0807B8B8  @ gBattleHitArray
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r6, #0
	bl SetupMapAnimSpellData
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r6, #0
	bl SetupMapBattleAnim
	bl EventEngineExists
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0807B8C0
	ldr r0, _0807B8BC  @ gUnknown_089A3508
	movs r1, #3
	bl Proc_Start
	b _0807B8C8
	.align 2, 0
_0807B8AC: .4byte gUnknown_0203E1F0
_0807B8B0: .4byte gBattleActor
_0807B8B4: .4byte gBattleTarget
_0807B8B8: .4byte gBattleHitArray
_0807B8BC: .4byte gUnknown_089A3508
_0807B8C0:
	ldr r0, _0807B8D0  @ gUnknown_089A3874
	movs r1, #3
	bl Proc_Start
_0807B8C8:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807B8D0: .4byte gUnknown_089A3874

	THUMB_FUNC_END BeginBattleMapAnims

	THUMB_FUNC_START SetupMapAnimSpellData
SetupMapAnimSpellData: @ 0x0807B8D4
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r2, #0
	adds r5, #0x4a
	ldrh r0, [r5]
	bl GetSpellAssocCharCount
	ldr r4, _0807B8FC  @ gUnknown_0203E1F0
	adds r1, r4, #0
	adds r1, #0x5e
	strb r0, [r1]
	str r6, [r4, #0x50]
	ldrh r0, [r5]
	bl GetSpellAssocAlt6CPointer
	str r0, [r4, #0x54]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807B8FC: .4byte gUnknown_0203E1F0

	THUMB_FUNC_END SetupMapAnimSpellData

	THUMB_FUNC_START SetupMapBattleAnim
SetupMapBattleAnim: @ 0x0807B900
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	adds r4, r1, #0
	movs r0, #0
	adds r1, r5, #0
	adds r2, r5, #0
	bl MakeBattleMOVEUNIT
	ldr r7, _0807B9A8  @ gUnknown_0203E1F0
	adds r6, r7, #0
	adds r6, #0x5e
	ldrb r0, [r6]
	cmp r0, #1
	bls _0807B930
	ldr r0, _0807B9AC  @ gBattleTarget
	bl HideUnitSMS
	movs r0, #1
	adds r1, r4, #0
	adds r2, r4, #0
	bl MakeBattleMOVEUNIT
_0807B930:
	ldr r0, _0807B9B0  @ gBattleHitArray
	ldr r0, [r0]
	lsls r0, r0, #0xd
	lsrs r0, r0, #0xd
	movs r1, #0x80
	lsls r1, r1, #3
	ands r0, r1
	cmp r0, #0
	beq _0807B964
	ldr r4, _0807B9B4  @ gBattleStats
	ldr r2, [r4, #0x10]
	movs r0, #2
	adds r1, r5, #0
	bl MakeBattleMOVEUNIT
	ldr r2, [r4, #0x14]
	movs r0, #3
	adds r1, r5, #0
	bl MakeBattleMOVEUNIT
	ldr r0, [r4, #0x10]
	bl HideUnitSMS
	ldr r0, [r4, #0x14]
	bl HideUnitSMS
_0807B964:
	bl SetupBattleMOVEUNITs
	movs r5, #0
	ldrb r0, [r6]
	cmp r5, r0
	bge _0807B998
	mov r8, r6
	adds r4, r7, #0
	movs r6, #0
_0807B976:
	adds r0, r7, #4
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, #0x72
	ldrb r0, [r0]
	strb r0, [r4, #0xd]
	ldr r0, [r4]
	bl GetUnitMaxHp
	strb r0, [r4, #0xc]
	adds r4, #0x14
	adds r6, #0x14
	adds r5, #1
	mov r1, r8
	ldrb r1, [r1]
	cmp r5, r1
	blt _0807B976
_0807B998:
	bl SetDefaultColorEffects
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807B9A8: .4byte gUnknown_0203E1F0
_0807B9AC: .4byte gBattleTarget
_0807B9B0: .4byte gBattleHitArray
_0807B9B4: .4byte gBattleStats

	THUMB_FUNC_END SetupMapBattleAnim

	THUMB_FUNC_START GetFacingDirection
GetFacingDirection: @ 0x0807B9B8
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	subs r0, r2, r5
	cmp r0, #0
	bge _0807B9C6
	subs r0, r5, r2
_0807B9C6:
	lsls r1, r0, #1
	subs r0, r3, r4
	cmp r0, #0
	blt _0807B9D4
	cmp r1, r0
	blt _0807B9DA
	b _0807B9E6
_0807B9D4:
	subs r0, r4, r3
	cmp r1, r0
	bge _0807B9E6
_0807B9DA:
	cmp r4, r3
	bge _0807B9E2
	movs r0, #2
	b _0807B9F0
_0807B9E2:
	movs r0, #3
	b _0807B9F0
_0807B9E6:
	cmp r5, r2
	blt _0807B9EE
	movs r0, #0
	b _0807B9F0
_0807B9EE:
	movs r0, #1
_0807B9F0:
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END GetFacingDirection

	THUMB_FUNC_START sub_807B9F8
sub_807B9F8: @ 0x0807B9F8
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r5, _0807BA20  @ gUnknown_089AD868
	movs r0, #0
	bl GetBackgroundTileDataOffset
	adds r1, r0, #0
	ldr r0, _0807BA24  @ 0x000003FF
	ands r0, r4
	lsls r0, r0, #5
	movs r2, #0xc0
	lsls r2, r2, #0x13
	adds r0, r0, r2
	adds r1, r1, r0
	adds r0, r5, #0
	bl CopyDataWithPossibleUncomp
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807BA20: .4byte gUnknown_089AD868
_0807BA24: .4byte 0x000003FF

	THUMB_FUNC_END sub_807B9F8

	THUMB_FUNC_START sub_807BA28
sub_807BA28: @ 0x0807BA28
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	mov sl, r0
	adds r5, r1, #0
	mov r9, r2
	adds r7, r3, #0
	ldr r0, [sp, #0x30]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0xc]
	movs r6, #7
	movs r0, #0xb
	add r0, sp
	mov r8, r0
_0807BA4C:
	mov r4, sp
	adds r4, r4, r6
	adds r4, #4
	adds r0, r5, #0
	movs r1, #0xa
	bl __modsi3
	adds r0, #0x30
	strb r0, [r4]
	adds r0, r5, #0
	movs r1, #0xa
	bl __divsi3
	adds r5, r0, #0
	cmp r5, #0
	bne _0807BA86
	subs r1, r6, #1
	subs r4, r7, #1
	cmp r1, #0
	blt _0807BA8E
	movs r2, #0x20
_0807BA76:
	mov r0, sp
	adds r0, r0, r1
	adds r0, #4
	strb r2, [r0]
	subs r1, #1
	cmp r1, #0
	bge _0807BA76
	b _0807BA8E
_0807BA86:
	subs r6, #1
	subs r4, r7, #1
	cmp r6, #0
	bge _0807BA4C
_0807BA8E:
	ldr r0, [sp, #0x34]
	str r0, [sp]
	mov r0, sl
	mov r1, r8
	mov r2, r9
	adds r3, r7, #0
	bl sub_8013168
	adds r6, r4, #0
	cmp r6, #0
	ble _0807BAD4
	movs r0, #7
	subs r0, r0, r6
	add r0, sp
	adds r0, #4
	ldrb r0, [r0]
	cmp r0, #0x20
	bne _0807BAD4
	mov r0, sp
	adds r0, #0xb
	subs r2, r0, r6
	lsls r0, r6, #1
	mov r3, sl
	subs r1, r3, r0
_0807BABE:
	mov r0, sp
	ldrh r0, [r0, #0xc]
	strh r0, [r1]
	adds r2, #1
	adds r1, #2
	subs r6, #1
	cmp r6, #0
	ble _0807BAD4
	ldrb r0, [r2]
	cmp r0, #0x20
	beq _0807BABE
_0807BAD4:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_807BA28

	THUMB_FUNC_START sub_807BAE4
sub_807BAE4: @ 0x0807BAE4
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x20
	bl sub_807B9F8
	ldr r1, _0807BB08  @ 0x06000560
	adds r0, r4, #0
	bl CopyDataWithPossibleUncomp
	ldr r0, _0807BB0C  @ gUnknown_08A1D79C
	movs r1, #0xa0
	movs r2, #0x20
	bl CopyToPaletteBuffer
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807BB08: .4byte 0x06000560
_0807BB0C: .4byte gUnknown_08A1D79C

	THUMB_FUNC_END sub_807BAE4

	THUMB_FUNC_START sub_807BB10
sub_807BB10: @ 0x0807BB10
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	ldr r2, [r4]
	adds r1, r3, #0
	cmp r2, r3
	bgt _0807BB22
	adds r1, r2, #0
_0807BB22:
	ldr r0, [sp, #0x10]
	adds r0, r0, r1
	lsls r1, r5, #0xc
	adds r0, r0, r1
	strh r0, [r6]
	adds r0, r2, #1
	subs r0, r0, r3
	str r0, [r4]
	cmp r0, #0
	bge _0807BB3A
	movs r0, #0
	str r0, [r4]
_0807BB3A:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_807BB10

	THUMB_FUNC_START sub_807BB40
sub_807BB40: @ 0x0807BB40
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r6, r0, #0
	adds r5, r2, #0
	adds r7, r3, #0
	movs r2, #0
	ldr r4, [sp, #0x1c]
	b _0807BB58
_0807BB50:
	subs r0, r2, #1
	ldrh r3, [r4]
	adds r2, r0, r3
	adds r4, #4
_0807BB58:
	ldrh r0, [r4]
	cmp r0, #0
	bne _0807BB50
	adds r2, #1
	cmp r1, r5
	bne _0807BB68
	str r2, [sp, #4]
	b _0807BB74
_0807BB68:
	lsls r0, r2, #8
	bl __divsi3
	muls r0, r5, r0
	asrs r0, r0, #8
	str r0, [sp, #4]
_0807BB74:
	ldr r0, [sp, #4]
	cmp r0, #0
	bne _0807BB82
	cmp r5, #0
	ble _0807BB82
	movs r0, #1
	str r0, [sp, #4]
_0807BB82:
	ldr r4, [sp, #0x1c]
	ldrh r0, [r4]
	cmp r0, #0
	beq _0807BBAA
	ldr r1, _0807BBB4  @ gUnknown_089A3668
	lsls r0, r7, #2
	adds r5, r0, r1
_0807BB90:
	ldr r2, [r5]
	ldrh r3, [r4]
	ldrh r0, [r4, #2]
	str r0, [sp]
	adds r0, r6, #0
	add r1, sp, #4
	bl sub_807BB10
	adds r6, #2
	adds r4, #4
	ldrh r0, [r4]
	cmp r0, #0
	bne _0807BB90
_0807BBAA:
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807BBB4: .4byte gUnknown_089A3668

	THUMB_FUNC_END sub_807BB40

	THUMB_FUNC_START DeleteBattleAnimInfoThing
DeleteBattleAnimInfoThing: @ 0x0807BBB8
	push {lr}
	ldr r0, _0807BBC4  @ gUnknown_089A3688
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
_0807BBC4: .4byte gUnknown_089A3688

	THUMB_FUNC_END DeleteBattleAnimInfoThing

	THUMB_FUNC_START NewMapBattleInfoThing
NewMapBattleInfoThing: @ 0x0807BBC8
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	ldr r0, _0807BBEC  @ gUnknown_089A3688
	movs r1, #3
	bl Proc_Start
	adds r1, r0, #0
	adds r1, #0x2e
	strb r4, [r1]
	adds r1, #1
	strb r5, [r1]
	str r6, [r0, #0x30]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807BBEC: .4byte gUnknown_089A3688

	THUMB_FUNC_END NewMapBattleInfoThing

	THUMB_FUNC_START sub_807BBF0
sub_807BBF0: @ 0x0807BBF0
	push {lr}
	movs r0, #0
	bl SetPrimaryHBlankHandler
	bl ClearBg0Bg1
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_807BBF0

	THUMB_FUNC_START sub_807BC00
sub_807BC00: @ 0x0807BC00
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	ldr r4, _0807BC44  @ gUnknown_089AD500
	movs r0, #1
	bl GetBackgroundTileDataOffset
	adds r1, r0, #0
	ldr r0, _0807BC48  @ 0x06000020
	adds r1, r1, r0
	adds r0, r4, #0
	bl CopyDataWithPossibleUncomp
	ldr r0, _0807BC4C  @ gUnknown_089AD78C
	bl sub_807BAE4
	ldr r0, _0807BC50  @ gUnknown_0203E1F0
	adds r0, #0x5e
	ldrb r0, [r0]
	cmp r0, #1
	beq _0807BC54
	cmp r0, #2
	beq _0807BC62
	b _0807BC7A
	.align 2, 0
_0807BC44: .4byte gUnknown_089AD500
_0807BC48: .4byte 0x06000020
_0807BC4C: .4byte gUnknown_089AD78C
_0807BC50: .4byte gUnknown_0203E1F0
_0807BC54:
	movs r2, #5
	negs r2, r2
	adds r0, r5, #0
	movs r1, #0
	bl sub_807BE1C
	b _0807BC7A
_0807BC62:
	movs r2, #1
	negs r2, r2
	adds r0, r5, #0
	movs r1, #0
	bl sub_807BE1C
	movs r2, #0xb
	negs r2, r2
	adds r0, r5, #0
	movs r1, #1
	bl sub_807BE1C
_0807BC7A:
	bl sub_8081E78
	ldr r0, _0807BCA0  @ gUnknown_0203E1F0
	ldrb r1, [r0, #0x11]
	lsls r0, r1, #3
	lsls r1, r1, #0x13
	movs r2, #0x80
	lsls r2, r2, #0xe
	adds r1, r1, r2
	lsrs r1, r1, #0x10
	ldr r3, _0807BCA4  @ gPaletteBuffer
	ldrh r2, [r3, #0x22]
	adds r3, #0x42
	ldrh r3, [r3]
	bl sub_80820D8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807BCA0: .4byte gUnknown_0203E1F0
_0807BCA4: .4byte gPaletteBuffer

	THUMB_FUNC_END sub_807BC00

	THUMB_FUNC_START sub_807BCA8
sub_807BCA8: @ 0x0807BCA8
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	mov r8, r0
	movs r2, #0
	movs r7, #0
	ldr r0, _0807BD4C  @ gUnknown_0203E1F0
	adds r0, #0x5e
	ldrb r0, [r0]
	cmp r2, r0
	bge _0807BD28
	movs r6, #0
	ldr r0, _0807BD50  @ gUnknown_0202BD31
	mov r9, r0
_0807BCC8:
	ldr r0, _0807BD4C  @ gUnknown_0203E1F0
	adds r0, r6, r0
	ldrh r4, [r0, #0xe]
	ldrb r0, [r0, #0xd]
	lsls r1, r0, #4
	cmp r4, r1
	ble _0807BCDE
	adds r0, r4, #0
	subs r0, #0x10
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
_0807BCDE:
	cmp r4, r1
	bge _0807BD04
	adds r0, r4, #4
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	movs r0, #0xf
	ands r0, r4
	cmp r0, #0
	bne _0807BD04
	mov r1, r9
	ldrb r0, [r1]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0807BD04
	movs r0, #0x75
	str r2, [sp]
	bl m4aSongNumStart
	ldr r2, [sp]
_0807BD04:
	ldr r5, _0807BD4C  @ gUnknown_0203E1F0
	adds r0, r6, r5
	ldrh r1, [r0, #0xe]
	cmp r4, r1
	beq _0807BD1A
	strh r4, [r0, #0xe]
	mov r0, r8
	adds r1, r7, #0
	bl sub_807BD54
	movs r2, #1
_0807BD1A:
	adds r6, #0x14
	adds r7, #1
	adds r0, r5, #0
	adds r0, #0x5e
	ldrb r0, [r0]
	cmp r7, r0
	blt _0807BCC8
_0807BD28:
	adds r1, r2, #0
	cmp r1, #0
	bne _0807BD3C
	ldr r0, _0807BD4C  @ gUnknown_0203E1F0
	adds r2, r0, #0
	adds r2, #0x5f
	ldrb r0, [r2]
	cmp r0, #0
	beq _0807BD3C
	strb r1, [r2]
_0807BD3C:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807BD4C: .4byte gUnknown_0203E1F0
_0807BD50: .4byte gUnknown_0202BD31

	THUMB_FUNC_END sub_807BCA8

	THUMB_FUNC_START sub_807BD54
sub_807BD54: @ 0x0807BD54
	push {r4, r5, r6, lr}
	sub sp, #8
	ldr r2, _0807BDC0  @ gUnknown_0203E1F0
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r5, r0, r2
	ldrh r0, [r5, #0xe]
	lsrs r3, r0, #4
	movs r6, #0
	cmp r3, #0x63
	ble _0807BD6E
	movs r6, #1
_0807BD6E:
	ldrb r0, [r5, #0x11]
	adds r0, #3
	lsls r0, r0, #5
	adds r0, #3
	ldrb r1, [r5, #0x10]
	adds r0, r0, r1
	lsls r0, r0, #1
	ldr r4, _0807BDC4  @ gBG0TilemapBuffer
	adds r0, r0, r4
	ldr r2, _0807BDC8  @ 0x00005020
	movs r1, #0
	str r1, [sp]
	str r6, [sp, #4]
	adds r1, r3, #0
	movs r3, #3
	bl sub_807BA28
	ldrb r0, [r5, #0x11]
	adds r0, #3
	lsls r0, r0, #5
	adds r0, #4
	ldrb r1, [r5, #0x10]
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r4
	ldrb r1, [r5, #0xc]
	ldrh r2, [r5, #0xe]
	lsrs r2, r2, #4
	ldr r3, _0807BDCC  @ gUnknown_089A3648
	str r3, [sp]
	movs r3, #0
	bl sub_807BB40
	movs r0, #1
	bl BG_EnableSyncByMask
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807BDC0: .4byte gUnknown_0203E1F0
_0807BDC4: .4byte gBG0TilemapBuffer
_0807BDC8: .4byte 0x00005020
_0807BDCC: .4byte gUnknown_089A3648

	THUMB_FUNC_END sub_807BD54

	THUMB_FUNC_START sub_807BDD0
sub_807BDD0: @ 0x0807BDD0
	push {lr}
	movs r1, #0xb
	ldrsb r1, [r0, r1]
	movs r0, #0xc0
	ands r1, r0
	cmp r1, #0x40
	beq _0807BE04
	cmp r1, #0x40
	bgt _0807BDE8
	cmp r1, #0
	beq _0807BDF2
	b _0807BE14
_0807BDE8:
	cmp r1, #0x80
	beq _0807BDFC
	cmp r1, #0xc0
	beq _0807BE0C
	b _0807BE14
_0807BDF2:
	ldr r0, _0807BDF8  @ gUnknown_089AD648
	b _0807BE16
	.align 2, 0
_0807BDF8: .4byte gUnknown_089AD648
_0807BDFC:
	ldr r0, _0807BE00  @ gUnknown_089AD668
	b _0807BE16
	.align 2, 0
_0807BE00: .4byte gUnknown_089AD668
_0807BE04:
	ldr r0, _0807BE08  @ gUnknown_089AD688
	b _0807BE16
	.align 2, 0
_0807BE08: .4byte gUnknown_089AD688
_0807BE0C:
	ldr r0, _0807BE10  @ gUnknown_089AD6A8
	b _0807BE16
	.align 2, 0
_0807BE10: .4byte gUnknown_089AD6A8
_0807BE14:
	movs r0, #0
_0807BE16:
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_807BDD0

	THUMB_FUNC_START sub_807BE1C
sub_807BE1C: @ 0x0807BE1C
	push {r4, r5, r6, lr}
	mov r6, sl
	mov r5, r9
	mov r4, r8
	push {r4, r5, r6}
	mov sl, r0
	mov r9, r1
	ldr r0, _0807BEE4  @ gUnknown_0203E1F0
	mov r8, r0
	lsls r6, r1, #2
	adds r5, r6, r1
	lsls r5, r5, #2
	add r5, r8
	mov r0, sl
	adds r0, #0x2e
	ldrb r0, [r0]
	adds r0, r0, r2
	strb r0, [r5, #0x10]
	mov r0, sl
	adds r0, #0x2f
	ldrb r0, [r0]
	strb r0, [r5, #0x11]
	ldr r0, [r5]
	bl sub_807BDD0
	mov r4, r9
	adds r4, #1
	lsls r1, r4, #5
	movs r2, #0x20
	bl CopyToPaletteBuffer
	ldr r1, _0807BEE8  @ gUnknown_089A3670
	movs r2, #0x5e
	add r8, r2
	mov r2, r8
	ldrb r0, [r2]
	lsls r0, r0, #3
	adds r6, r6, r0
	adds r6, r6, r1
	ldr r0, [r6]
	ldr r6, _0807BEEC  @ gUnknown_02020188
	adds r1, r6, #0
	bl CopyDataWithPossibleUncomp
	ldrb r0, [r5, #0x11]
	lsls r0, r0, #5
	ldrb r1, [r5, #0x10]
	adds r0, r0, r1
	lsls r0, r0, #1
	ldr r1, _0807BEF0  @ gBG1TilemapBuffer
	adds r0, r0, r1
	lsls r4, r4, #0xc
	movs r1, #1
	orrs r4, r1
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	adds r1, r6, #0
	adds r2, r4, #0
	bl CallARM_FillTileRect
	movs r0, #2
	bl BG_EnableSyncByMask
	ldrb r4, [r5, #0x11]
	adds r4, #1
	lsls r4, r4, #5
	adds r4, #2
	ldrb r0, [r5, #0x10]
	adds r4, r4, r0
	lsls r4, r4, #1
	ldr r0, _0807BEF4  @ gBG0TilemapBuffer
	adds r4, r4, r0
	ldr r0, [r5]
	ldr r0, [r0]
	ldrh r0, [r0]
	bl GetStringFromIndex
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0
	movs r2, #9
	bl sub_80143D8
	movs r0, #1
	bl BG_EnableSyncByMask
	ldrb r0, [r5, #0xd]
	lsls r0, r0, #4
	strh r0, [r5, #0xe]
	mov r0, sl
	mov r1, r9
	bl sub_807BD54
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807BEE4: .4byte gUnknown_0203E1F0
_0807BEE8: .4byte gUnknown_089A3670
_0807BEEC: .4byte gUnknown_02020188
_0807BEF0: .4byte gBG1TilemapBuffer
_0807BEF4: .4byte gBG0TilemapBuffer

	THUMB_FUNC_END sub_807BE1C

	THUMB_FUNC_START sub_807BEF8
sub_807BEF8: @ 0x0807BEF8
	push {r4, r5, r6, lr}
	movs r1, #0
	strh r1, [r0, #0x2a]
	bl sub_807BF54
	ldr r2, _0807BF50  @ gLCDControlBuffer
	ldrb r0, [r2, #1]
	movs r1, #0x20
	orrs r0, r1
	movs r1, #0x41
	negs r1, r1
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r2, #1]
	adds r4, r2, #0
	adds r4, #0x34
	ldrb r0, [r4]
	movs r1, #1
	orrs r0, r1
	movs r1, #2
	orrs r0, r1
	movs r6, #4
	orrs r0, r6
	movs r5, #8
	orrs r0, r5
	movs r3, #0x10
	orrs r0, r3
	strb r0, [r4]
	adds r2, #0x36
	ldrb r1, [r2]
	movs r0, #2
	negs r0, r0
	ands r0, r1
	movs r1, #3
	negs r1, r1
	ands r0, r1
	orrs r0, r6
	orrs r0, r5
	orrs r0, r3
	strb r0, [r2]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807BF50: .4byte gLCDControlBuffer

	THUMB_FUNC_END sub_807BEF8

	THUMB_FUNC_START sub_807BF54
sub_807BF54: @ 0x0807BF54
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, _0807BFC0  @ gLCDControlBuffer
	mov ip, r0
	mov r1, ip
	adds r1, #0x2d
	movs r0, #0
	strb r0, [r1]
	adds r5, r4, #0
	adds r5, #0x2f
	ldrb r0, [r5]
	adds r0, #2
	lsls r0, r0, #3
	ldrh r1, [r4, #0x2a]
	adds r3, r1, #0
	subs r0, r0, r3
	mov r2, ip
	adds r2, #0x31
	strb r0, [r2]
	subs r2, #5
	movs r0, #0xf0
	strb r0, [r2]
	ldrb r0, [r5]
	adds r0, #2
	lsls r0, r0, #3
	adds r3, r3, r0
	mov r0, ip
	adds r0, #0x30
	strb r3, [r0]
	adds r1, #2
	strh r1, [r4, #0x2a]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	cmp r1, #0x10
	ble _0807BFB8
	mov r0, ip
	ldrb r1, [r0, #1]
	movs r0, #0x21
	negs r0, r0
	ands r0, r1
	movs r1, #0x41
	negs r1, r1
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	mov r1, ip
	strb r0, [r1, #1]
	adds r0, r4, #0
	bl Proc_Break
_0807BFB8:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807BFC0: .4byte gLCDControlBuffer

	THUMB_FUNC_END sub_807BF54

	THUMB_FUNC_START sub_807BFC4
sub_807BFC4: @ 0x0807BFC4
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #8
	adds r6, r0, #0
	adds r4, r1, #0
	mov r8, r2
	adds r4, #1
	lsls r4, r4, #5
	adds r0, r4, #2
	adds r0, r0, r6
	lsls r0, r0, #1
	ldr r5, _0807C01C  @ gBG0TilemapBuffer
	adds r0, r0, r5
	ldr r2, _0807C020  @ 0x00005225
	ldr r1, _0807C024  @ 0x0000522F
	str r1, [sp]
	movs r1, #0
	str r1, [sp, #4]
	mov r1, r8
	movs r3, #2
	bl sub_807BA28
	adds r4, #3
	adds r4, r4, r6
	lsls r4, r4, #1
	adds r4, r4, r5
	ldr r0, _0807C028  @ gUnknown_089A36C0
	str r0, [sp]
	adds r0, r4, #0
	movs r1, #0x63
	mov r2, r8
	movs r3, #0
	bl sub_807BB40
	movs r0, #1
	bl BG_EnableSyncByMask
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807C01C: .4byte gBG0TilemapBuffer
_0807C020: .4byte 0x00005225
_0807C024: .4byte 0x0000522F
_0807C028: .4byte gUnknown_089A36C0

	THUMB_FUNC_END sub_807BFC4

	THUMB_FUNC_START sub_807C02C
sub_807C02C: @ 0x0807C02C
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	ldr r4, _0807C0B8  @ gUnknown_08802D44
	movs r0, #0
	bl GetBackgroundTileDataOffset
	adds r1, r0, #0
	ldr r0, _0807C0BC  @ 0x06004000
	adds r1, r1, r0
	movs r2, #0xd0
	lsls r2, r2, #1
	adds r0, r4, #0
	bl RegisterTileGraphics
	ldr r4, _0807C0C0  @ gUnknown_088030C4
	movs r0, #0
	bl GetBackgroundTileDataOffset
	adds r1, r0, #0
	ldr r0, _0807C0C4  @ 0x060041A0
	adds r1, r1, r0
	movs r2, #0xc0
	lsls r2, r2, #2
	adds r0, r4, #0
	bl RegisterTileGraphics
	ldr r4, _0807C0C8  @ gUnknown_088033C4
	movs r0, #0
	bl GetBackgroundTileDataOffset
	adds r1, r0, #0
	ldr r0, _0807C0CC  @ 0x060044A0
	adds r1, r1, r0
	movs r2, #0xb0
	lsls r2, r2, #1
	adds r0, r4, #0
	bl RegisterTileGraphics
	ldr r0, _0807C0D0  @ gUnknown_08803590
	movs r1, #0xa0
	movs r2, #0x20
	bl CopyToPaletteBuffer
	ldr r0, _0807C0D4  @ gUnknown_02022EB4
	ldr r1, _0807C0D8  @ gUnknown_089AD498
	movs r2, #0xa4
	lsls r2, r2, #7
	bl CallARM_FillTileRect
	adds r5, #0x64
	movs r0, #0
	ldrsh r2, [r5, r0]
	movs r0, #6
	movs r1, #8
	bl sub_807BFC4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807C0B8: .4byte gUnknown_08802D44
_0807C0BC: .4byte 0x06004000
_0807C0C0: .4byte gUnknown_088030C4
_0807C0C4: .4byte 0x060041A0
_0807C0C8: .4byte gUnknown_088033C4
_0807C0CC: .4byte 0x060044A0
_0807C0D0: .4byte gUnknown_08803590
_0807C0D4: .4byte gUnknown_02022EB4
_0807C0D8: .4byte gUnknown_089AD498

	THUMB_FUNC_END sub_807C02C

	THUMB_FUNC_START sub_807C0DC
sub_807C0DC: @ 0x0807C0DC
	push {lr}
	ldr r0, _0807C0F4  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0807C0F0
	movs r0, #0x74
	bl m4aSongNumStart
_0807C0F0:
	pop {r0}
	bx r0
	.align 2, 0
_0807C0F4: .4byte gRAMChapterData

	THUMB_FUNC_END sub_807C0DC

	THUMB_FUNC_START sub_807C0F8
sub_807C0F8: @ 0x0807C0F8
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r5, #0
	adds r4, #0x64
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x63
	ble _0807C112
	movs r0, #0
	strh r0, [r4]
_0807C112:
	movs r0, #0
	ldrsh r2, [r4, r0]
	movs r0, #6
	movs r1, #8
	bl sub_807BFC4
	adds r0, r5, #0
	adds r0, #0x66
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r1, #0x64
	bl __modsi3
	movs r2, #0
	ldrsh r1, [r4, r2]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r1, r0
	bne _0807C144
	adds r0, r5, #0
	bl Proc_Break
	movs r0, #0x74
	bl m4aSongNumStop
_0807C144:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_807C0F8

	THUMB_FUNC_START sub_807C14C
sub_807C14C: @ 0x0807C14C
	push {r4, r5, r6, lr}
	adds r2, r0, #0
	adds r2, #0x6a
	movs r1, #0
	strh r1, [r2]
	bl sub_807C1AC
	ldr r2, _0807C1A8  @ gLCDControlBuffer
	ldrb r0, [r2, #1]
	movs r1, #0x20
	orrs r0, r1
	movs r1, #0x41
	negs r1, r1
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r2, #1]
	adds r4, r2, #0
	adds r4, #0x34
	ldrb r0, [r4]
	movs r1, #1
	orrs r0, r1
	movs r1, #2
	orrs r0, r1
	movs r6, #4
	orrs r0, r6
	movs r5, #8
	orrs r0, r5
	movs r3, #0x10
	orrs r0, r3
	strb r0, [r4]
	adds r2, #0x36
	ldrb r1, [r2]
	movs r0, #2
	negs r0, r0
	ands r0, r1
	movs r1, #3
	negs r1, r1
	ands r0, r1
	orrs r0, r6
	orrs r0, r5
	orrs r0, r3
	strb r0, [r2]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807C1A8: .4byte gLCDControlBuffer

	THUMB_FUNC_END sub_807C14C

	THUMB_FUNC_START sub_807C1AC
sub_807C1AC: @ 0x0807C1AC
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _0807C20C  @ gLCDControlBuffer
	mov ip, r0
	mov r1, ip
	adds r1, #0x2d
	movs r0, #0
	strb r0, [r1]
	adds r4, r5, #0
	adds r4, #0x6a
	ldrh r1, [r4]
	adds r2, r1, #0
	movs r0, #0x4c
	subs r0, r0, r2
	mov r3, ip
	adds r3, #0x31
	strb r0, [r3]
	subs r3, #5
	movs r0, #0xf0
	strb r0, [r3]
	adds r2, #0x4c
	mov r0, ip
	adds r0, #0x30
	strb r2, [r0]
	adds r1, #2
	strh r1, [r4]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	cmp r1, #0xc
	ble _0807C206
	mov r0, ip
	ldrb r1, [r0, #1]
	movs r0, #0x21
	negs r0, r0
	ands r0, r1
	movs r1, #0x41
	negs r1, r1
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	mov r1, ip
	strb r0, [r1, #1]
	adds r0, r5, #0
	bl Proc_Break
_0807C206:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807C20C: .4byte gLCDControlBuffer

	THUMB_FUNC_END sub_807C1AC

	THUMB_FUNC_START sub_807C210
sub_807C210: @ 0x0807C210
	push {lr}
	adds r1, r0, #0
	adds r0, #0x66
	movs r2, #0
	ldrsh r0, [r0, r2]
	cmp r0, #0x63
	ble _0807C22A
	adds r0, r1, #0
	adds r0, #0x68
	movs r2, #0
	ldrsh r0, [r0, r2]
	bl sub_807F10C
_0807C22A:
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_807C210

	THUMB_FUNC_START sub_807C230
sub_807C230: @ 0x0807C230
	push {lr}
	ldr r0, _0807C240  @ gUnknown_089A3814
	movs r1, #3
	bl Proc_Start
	pop {r0}
	bx r0
	.align 2, 0
_0807C240: .4byte gUnknown_089A3814

	THUMB_FUNC_END sub_807C230

	THUMB_FUNC_START sub_807C244
sub_807C244: @ 0x0807C244
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	adds r7, r0, #0
	mov sl, r1
	str r2, [sp, #8]
	ldr r5, _0807C2A0  @ gUnknown_089A3810
	ldr r0, [r5]
	movs r1, #0x64
	adds r4, r7, #0
	muls r4, r1, r4
	adds r0, r0, r4
	movs r1, #8
	ldrsh r0, [r0, r1]
	bl GetCharacterData
	str r0, [sp, #0xc]
	ldr r0, [r5]
	adds r0, r0, r4
	movs r2, #0xe
	ldrsh r0, [r0, r2]
	bl GetClassData
	str r0, [sp, #0x10]
	ldr r0, [r5]
	adds r0, r0, r4
	movs r1, #8
	ldrsh r4, [r0, r1]
	mov r9, r4
	movs r2, #0xe
	ldrsh r6, [r0, r2]
	movs r1, #0x10
	ldrsh r4, [r0, r1]
	mov r8, r4
	mov r2, sl
	cmp r2, #9
	bls _0807C296
	b _0807C4D4
_0807C296:
	lsls r0, r2, #2
	ldr r1, _0807C2A4  @ _0807C2A8
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0807C2A0: .4byte gUnknown_089A3810
_0807C2A4: .4byte _0807C2A8
_0807C2A8: @ jump table
	.4byte _0807C2D0 @ case 0
	.4byte _0807C318 @ case 1
	.4byte _0807C360 @ case 2
	.4byte _0807C3A8 @ case 3
	.4byte _0807C3F0 @ case 4
	.4byte _0807C454 @ case 5
	.4byte _0807C454 @ case 6
	.4byte _0807C454 @ case 7
	.4byte _0807C454 @ case 8
	.4byte _0807C454 @ case 9
_0807C2D0:
	ldr r5, _0807C310  @ gUnknown_089A3810
	movs r0, #0x64
	adds r4, r7, #0
	muls r4, r0, r4
	adds r4, #8
	ldr r0, [r5]
	adds r0, r0, r4
	adds r0, #0x14
	bl Text_Clear
	ldr r0, [r5]
	adds r0, r0, r4
	adds r0, #0x14
	movs r1, #0x10
	ldr r2, [sp, #8]
	mov r3, r9
	bl Text_InsertNumberOr2Dashes
	ldr r1, [sp, #0xc]
	ldrh r0, [r1]
	bl GetStringFromIndex
	adds r3, r0, #0
	ldr r0, [r5]
	adds r0, r0, r4
	adds r0, #0x14
	lsls r1, r7, #1
	adds r1, r1, r7
	lsls r1, r1, #3
	ldr r2, _0807C314  @ gUnknown_02022CB4
	b _0807C432
	.align 2, 0
_0807C310: .4byte gUnknown_089A3810
_0807C314: .4byte gUnknown_02022CB4
_0807C318:
	ldr r5, _0807C358  @ gUnknown_089A3810
	movs r0, #0x64
	adds r6, r7, #0
	muls r6, r0, r6
	adds r4, r6, #0
	adds r4, #8
	ldr r0, [r5]
	adds r0, r0, r4
	adds r0, #0x1c
	bl Text_Clear
	ldr r1, [r5]
	adds r0, r1, r4
	adds r0, #0x1c
	adds r1, r1, r6
	movs r2, #0xa
	ldrsh r3, [r1, r2]
	movs r1, #8
	ldr r2, [sp, #8]
	bl Text_InsertNumberOr2Dashes
	ldr r0, [r5]
	adds r0, r0, r4
	adds r0, #0x1c
	lsls r1, r7, #1
	adds r1, r1, r7
	lsls r1, r1, #3
	ldr r2, _0807C35C  @ gUnknown_02022D36
	adds r1, r1, r2
	bl Text_Draw
	b _0807C442
	.align 2, 0
_0807C358: .4byte gUnknown_089A3810
_0807C35C: .4byte gUnknown_02022D36
_0807C360:
	ldr r5, _0807C3A0  @ gUnknown_089A3810
	movs r0, #0x64
	adds r6, r7, #0
	muls r6, r0, r6
	adds r4, r6, #0
	adds r4, #8
	ldr r0, [r5]
	adds r0, r0, r4
	adds r0, #0x24
	bl Text_Clear
	ldr r1, [r5]
	adds r0, r1, r4
	adds r0, #0x24
	adds r1, r1, r6
	movs r2, #0xc
	ldrsh r3, [r1, r2]
	movs r1, #8
	ldr r2, [sp, #8]
	bl Text_InsertNumberOr2Dashes
	ldr r0, [r5]
	adds r0, r0, r4
	adds r0, #0x24
	lsls r1, r7, #1
	adds r1, r1, r7
	lsls r1, r1, #3
	ldr r2, _0807C3A4  @ gUnknown_02022D3C
	adds r1, r1, r2
	bl Text_Draw
	b _0807C442
	.align 2, 0
_0807C3A0: .4byte gUnknown_089A3810
_0807C3A4: .4byte gUnknown_02022D3C
_0807C3A8:
	ldr r5, _0807C3E8  @ gUnknown_089A3810
	movs r0, #0x64
	adds r4, r7, #0
	muls r4, r0, r4
	adds r4, #8
	ldr r0, [r5]
	adds r0, r0, r4
	adds r0, #0x2c
	bl Text_Clear
	ldr r0, [r5]
	adds r0, r0, r4
	adds r0, #0x2c
	movs r1, #0x10
	ldr r2, [sp, #8]
	adds r3, r6, #0
	bl Text_InsertNumberOr2Dashes
	ldr r1, [sp, #0x10]
	ldrh r0, [r1]
	bl GetStringFromIndex
	adds r3, r0, #0
	ldr r0, [r5]
	adds r0, r0, r4
	adds r0, #0x2c
	lsls r1, r7, #1
	adds r1, r1, r7
	lsls r1, r1, #3
	ldr r2, _0807C3EC  @ gUnknown_02022DB4
	b _0807C432
	.align 2, 0
_0807C3E8: .4byte gUnknown_089A3810
_0807C3EC: .4byte gUnknown_02022DB4
_0807C3F0:
	ldr r4, _0807C44C  @ gUnknown_089A3810
	movs r0, #0x64
	adds r6, r7, #0
	muls r6, r0, r6
	adds r5, r6, #0
	adds r5, #8
	ldr r0, [r4]
	adds r0, r0, r5
	adds r0, #0x34
	bl Text_Clear
	ldr r0, [r4]
	adds r0, r0, r5
	adds r0, #0x34
	movs r1, #0x10
	ldr r2, [sp, #8]
	mov r3, r8
	bl Text_InsertNumberOr2Dashes
	ldr r0, [r4]
	adds r0, r0, r6
	movs r2, #0x10
	ldrsh r0, [r0, r2]
	bl GetItemName
	adds r3, r0, #0
	ldr r0, [r4]
	adds r0, r0, r5
	adds r0, #0x34
	lsls r1, r7, #1
	adds r1, r1, r7
	lsls r1, r1, #3
	ldr r2, _0807C450  @ gUnknown_02022E34
_0807C432:
	adds r1, r1, r2
	movs r2, #0
	str r2, [sp]
	str r3, [sp, #4]
	ldr r2, [sp, #8]
	movs r3, #0x18
	bl DrawTextInline
_0807C442:
	movs r0, #1
	bl BG_EnableSyncByMask
	b _0807C4D4
	.align 2, 0
_0807C44C: .4byte gUnknown_089A3810
_0807C450: .4byte gUnknown_02022E34
_0807C454:
	ldr r4, _0807C4E4  @ gUnknown_089A3810
	mov r8, r4
	movs r0, #0x64
	adds r1, r7, #0
	muls r1, r0, r1
	mov r9, r1
	mov r5, r9
	adds r5, #8
	ldr r0, [r4]
	adds r0, r0, r5
	mov r2, sl
	lsls r4, r2, #3
	adds r4, #0x14
	adds r0, r0, r4
	bl Text_Clear
	mov r0, r8
	ldr r1, [r0]
	adds r0, r1, r5
	adds r0, r0, r4
	mov r2, sl
	lsls r6, r2, #1
	add r6, r9
	adds r1, #8
	adds r1, r1, r6
	movs r2, #0
	ldrsh r3, [r1, r2]
	movs r1, #8
	ldr r2, [sp, #8]
	bl Text_InsertNumberOr2Dashes
	mov r0, r8
	ldr r2, [r0]
	adds r5, r2, r5
	adds r5, r5, r4
	mov r4, sl
	lsls r1, r4, #6
	subs r1, #0x39
	lsls r0, r7, #1
	adds r0, r0, r7
	lsls r0, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #1
	ldr r0, _0807C4E8  @ gBG0TilemapBuffer
	adds r1, r1, r0
	movs r0, #0
	str r0, [sp]
	ldr r3, _0807C4EC  @ gUnknown_089A3770
	adds r2, #8
	adds r2, r2, r6
	movs r4, #0
	ldrsh r0, [r2, r4]
	lsls r0, r0, #2
	adds r0, r0, r3
	ldr r0, [r0]
	str r0, [sp, #4]
	adds r0, r5, #0
	ldr r2, [sp, #8]
	movs r3, #0x10
	bl DrawTextInline
	movs r0, #1
	bl BG_EnableSyncByMask
_0807C4D4:
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807C4E4: .4byte gUnknown_089A3810
_0807C4E8: .4byte gBG0TilemapBuffer
_0807C4EC: .4byte gUnknown_089A3770

	THUMB_FUNC_END sub_807C244

	THUMB_FUNC_START sub_807C4F0
sub_807C4F0: @ 0x0807C4F0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0807C560  @ gUnknown_0859AA5C
	bl Proc_EndEach
	adds r0, r4, #0
	adds r0, #0x64
	movs r2, #0
	strh r2, [r0]
	adds r4, #0x66
	strh r2, [r4]
	ldr r0, _0807C564  @ gUnknown_089A3810
	ldr r0, [r0]
	mov ip, r0
	movs r3, #1
	strh r3, [r0, #0xe]
	strh r3, [r0, #8]
	strh r3, [r0, #0x10]
	movs r0, #4
	mov r1, ip
	strh r0, [r1, #0xa]
	movs r4, #8
	strh r4, [r1, #0xc]
	mov r0, ip
	adds r0, #0x72
	strh r3, [r0]
	subs r0, #6
	movs r1, #2
	strh r1, [r0]
	adds r0, #8
	strh r1, [r0]
	subs r0, #6
	movs r1, #5
	strh r1, [r0]
	adds r0, #2
	strh r4, [r0]
	mov r0, ip
	strh r3, [r0, #0x12]
	strh r1, [r0, #0x14]
	strh r2, [r0, #0x16]
	strh r2, [r0, #0x18]
	strh r2, [r0, #0x1a]
	adds r0, #0x76
	strh r3, [r0]
	adds r0, #2
	strh r2, [r0]
	adds r0, #2
	strh r2, [r0]
	adds r0, #2
	strh r2, [r0]
	adds r0, #2
	strh r2, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807C560: .4byte gUnknown_0859AA5C
_0807C564: .4byte gUnknown_089A3810

	THUMB_FUNC_END sub_807C4F0

	THUMB_FUNC_START sub_807C568
sub_807C568: @ 0x0807C568
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov sl, r0
	bl MU_EndAll
	bl Font_InitForUIDefault
	movs r0, #2
	movs r1, #8
	movs r2, #8
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	movs r0, #0
	str r0, [sp]
	movs r1, #1
	movs r2, #0
	movs r3, #0
	bl sub_8001ED0
	movs r4, #1
	str r4, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #1
	movs r3, #1
	bl sub_8001F0C
	ldr r2, _0807C640  @ gLCDControlBuffer
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
	str r4, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0x1d
	movs r3, #0x13
	bl DrawUiFrame2
	movs r5, #0
	ldr r1, _0807C644  @ gUnknown_089A37E8
	ldr r0, [r1]
	cmp r0, #0
	beq _0807C5EE
	adds r4, r1, #0
_0807C5D8:
	lsls r0, r5, #7
	ldr r1, _0807C648  @ gUnknown_02022CAA
	adds r0, r0, r1
	ldm r4!, {r2}
	movs r1, #0
	bl sub_801443C
	adds r5, #1
	ldr r0, [r4]
	cmp r0, #0
	bne _0807C5D8
_0807C5EE:
	movs r5, #0
	movs r0, #0x64
	add r0, sl
	mov r9, r0
_0807C5F6:
	movs r4, #0
	adds r1, r5, #1
	mov r8, r1
	lsls r6, r5, #3
	ldr r2, _0807C64C  @ gUnknown_089A3798
	adds r7, r6, r2
_0807C602:
	movs r0, #0x64
	adds r1, r4, #0
	muls r1, r0, r1
	adds r1, #8
	ldr r2, _0807C650  @ gUnknown_089A3810
	ldr r0, [r2]
	adds r0, r0, r1
	adds r1, r6, #0
	adds r1, #0x14
	adds r0, r0, r1
	ldrb r1, [r7]
	bl Text_Allocate
	mov r1, r9
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r4, r0
	bne _0807C654
	mov r0, sl
	adds r0, #0x66
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r5, r0
	bne _0807C654
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0
	bl sub_807C244
	b _0807C65E
	.align 2, 0
_0807C640: .4byte gLCDControlBuffer
_0807C644: .4byte gUnknown_089A37E8
_0807C648: .4byte gUnknown_02022CAA
_0807C64C: .4byte gUnknown_089A3798
_0807C650: .4byte gUnknown_089A3810
_0807C654:
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #1
	bl sub_807C244
_0807C65E:
	adds r4, #1
	cmp r4, #1
	ble _0807C602
	mov r5, r8
	cmp r5, #9
	ble _0807C5F6
	movs r0, #1
	bl BG_EnableSyncByMask
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_807C568

	THUMB_FUNC_START sub_807C680
sub_807C680: @ 0x0807C680
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	adds r6, r0, #0
	adds r7, r6, #0
	adds r7, #0x64
	movs r1, #0
	ldrsh r0, [r7, r1]
	mov r9, r0
	adds r5, r6, #0
	adds r5, #0x66
	movs r4, #0
	ldrsh r2, [r5, r4]
	mov r8, r2
	ldr r4, _0807C728  @ gKeyStatusPtr
	ldr r0, [r4]
	ldrh r1, [r0, #8]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _0807C6C0
	bl sub_807C8FC
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0807C6BA
	b _0807C886
_0807C6BA:
	adds r0, r6, #0
	bl Proc_Break
_0807C6C0:
	ldr r2, [r4]
	ldrh r1, [r2, #4]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	movs r1, #1
	mov ip, r1
	cmp r0, #0
	beq _0807C6D6
	movs r4, #0xa
	mov ip, r4
_0807C6D6:
	ldrh r1, [r2, #6]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0807C738
	ldr r0, _0807C72C  @ gUnknown_089A3810
	ldr r3, [r0]
	movs r0, #0
	ldrsh r1, [r5, r0]
	lsls r1, r1, #1
	movs r2, #0
	ldrsh r0, [r7, r2]
	movs r4, #0x64
	muls r0, r4, r0
	adds r1, r1, r0
	adds r3, #8
	adds r1, r3, r1
	ldrh r0, [r1]
	add r0, ip
	strh r0, [r1]
	movs r0, #0
	ldrsh r2, [r5, r0]
	lsls r0, r2, #1
	movs r5, #0
	ldrsh r1, [r7, r5]
	muls r1, r4, r1
	adds r0, r0, r1
	adds r3, r3, r0
	movs r0, #0
	ldrsh r1, [r3, r0]
	ldr r0, _0807C730  @ gUnknown_089A3798
	lsls r2, r2, #3
	adds r2, r2, r0
	ldrb r0, [r2, #6]
	cmp r1, r0
	blt _0807C738
	mov r1, ip
	cmp r1, #1
	bne _0807C734
	ldrb r0, [r2, #5]
	b _0807C736
	.align 2, 0
_0807C728: .4byte gKeyStatusPtr
_0807C72C: .4byte gUnknown_089A3810
_0807C730: .4byte gUnknown_089A3798
_0807C734:
	subs r0, #1
_0807C736:
	strh r0, [r3]
_0807C738:
	ldr r2, _0807C894  @ gKeyStatusPtr
	ldr r0, [r2]
	ldrh r1, [r0, #6]
	movs r0, #2
	ands r0, r1
	adds r7, r2, #0
	cmp r0, #0
	beq _0807C7A4
	ldr r0, _0807C898  @ gUnknown_089A3810
	ldr r3, [r0]
	adds r2, r6, #0
	adds r2, #0x66
	movs r4, #0
	ldrsh r1, [r2, r4]
	lsls r1, r1, #1
	movs r5, #0x64
	adds r5, r5, r6
	mov sl, r5
	movs r4, #0
	ldrsh r0, [r5, r4]
	movs r4, #0x64
	muls r0, r4, r0
	adds r1, r1, r0
	adds r3, #8
	adds r1, r3, r1
	ldrh r0, [r1]
	mov r5, ip
	subs r0, r0, r5
	strh r0, [r1]
	movs r0, #0
	ldrsh r2, [r2, r0]
	lsls r0, r2, #1
	mov r1, sl
	movs r5, #0
	ldrsh r1, [r1, r5]
	mov sl, r1
	mov r1, sl
	muls r1, r4, r1
	adds r0, r0, r1
	adds r3, r3, r0
	movs r0, #0
	ldrsh r1, [r3, r0]
	ldr r0, _0807C89C  @ gUnknown_089A3798
	lsls r2, r2, #3
	adds r2, r2, r0
	ldrb r0, [r2, #5]
	cmp r1, r0
	bge _0807C7A4
	mov r1, ip
	cmp r1, #1
	bne _0807C7A2
	ldrb r0, [r2, #6]
	subs r0, #1
_0807C7A2:
	strh r0, [r3]
_0807C7A4:
	ldr r0, [r7]
	ldrh r1, [r0, #6]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _0807C7D8
	adds r3, r6, #0
	adds r3, #0x66
	movs r2, #0
	ldrsh r0, [r3, r2]
	cmp r0, #2
	beq _0807C7C8
	adds r2, r6, #0
	adds r2, #0x64
	ldrh r1, [r2]
	movs r0, #1
	subs r0, r0, r1
	strh r0, [r2]
_0807C7C8:
	ldr r0, _0807C89C  @ gUnknown_089A3798
	movs r4, #0
	ldrsh r1, [r3, r4]
	lsls r1, r1, #3
	adds r1, r1, r0
	movs r0, #3
	ldrsb r0, [r1, r0]
	strh r0, [r3]
_0807C7D8:
	ldr r0, [r7]
	ldrh r1, [r0, #6]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _0807C80C
	adds r3, r6, #0
	adds r3, #0x66
	movs r5, #0
	ldrsh r0, [r3, r5]
	cmp r0, #1
	beq _0807C7FC
	adds r2, r6, #0
	adds r2, #0x64
	ldrh r1, [r2]
	movs r0, #1
	subs r0, r0, r1
	strh r0, [r2]
_0807C7FC:
	ldr r0, _0807C89C  @ gUnknown_089A3798
	movs r2, #0
	ldrsh r1, [r3, r2]
	lsls r1, r1, #3
	adds r1, r1, r0
	movs r0, #4
	ldrsb r0, [r1, r0]
	strh r0, [r3]
_0807C80C:
	adds r3, r7, #0
	ldr r0, [r3]
	ldrh r1, [r0, #6]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0807C82E
	ldr r0, _0807C89C  @ gUnknown_089A3798
	adds r2, r6, #0
	adds r2, #0x66
	movs r4, #0
	ldrsh r1, [r2, r4]
	lsls r1, r1, #3
	adds r1, r1, r0
	movs r0, #1
	ldrsb r0, [r1, r0]
	strh r0, [r2]
_0807C82E:
	ldr r0, [r3]
	ldrh r1, [r0, #6]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0807C84E
	ldr r0, _0807C89C  @ gUnknown_089A3798
	adds r2, r6, #0
	adds r2, #0x66
	movs r5, #0
	ldrsh r1, [r2, r5]
	lsls r1, r1, #3
	adds r1, r1, r0
	movs r0, #2
	ldrsb r0, [r1, r0]
	strh r0, [r2]
_0807C84E:
	ldr r0, [r3]
	ldrh r1, [r0, #6]
	movs r0, #0xf0
	ands r0, r1
	cmp r0, #0
	beq _0807C864
	mov r0, r9
	mov r1, r8
	movs r2, #1
	bl sub_807C244
_0807C864:
	ldr r0, [r7]
	ldrh r1, [r0, #6]
	movs r0, #0xf3
	ands r0, r1
	cmp r0, #0
	beq _0807C886
	adds r0, r6, #0
	adds r0, #0x64
	movs r1, #0
	ldrsh r0, [r0, r1]
	adds r1, r6, #0
	adds r1, #0x66
	movs r2, #0
	ldrsh r1, [r1, r2]
	movs r2, #0
	bl sub_807C244
_0807C886:
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807C894: .4byte gKeyStatusPtr
_0807C898: .4byte gUnknown_089A3810
_0807C89C: .4byte gUnknown_089A3798

	THUMB_FUNC_END sub_807C680

	THUMB_FUNC_START sub_807C8A0
sub_807C8A0: @ 0x0807C8A0
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r2, r6, #0
	adds r2, #0x72
	movs r0, #0x1e
	strb r0, [r2]
	movs r0, #0x3c
	strb r0, [r6, #0x12]
	ldr r5, _0807C8F8  @ gUnknown_089A3810
	ldr r0, [r5]
	movs r2, #0x64
	adds r4, r1, #0
	muls r4, r2, r4
	adds r0, r0, r4
	movs r1, #8
	ldrsh r0, [r0, r1]
	bl GetCharacterData
	str r0, [r6]
	ldr r0, [r5]
	adds r0, r0, r4
	movs r1, #0xe
	ldrsh r0, [r0, r1]
	bl GetClassData
	str r0, [r6, #4]
	ldr r0, [r5]
	adds r0, r0, r4
	ldrh r1, [r0, #0xa]
	strb r1, [r6, #0x10]
	ldrh r1, [r0, #0xc]
	strb r1, [r6, #0x11]
	ldrh r0, [r0, #0x10]
	adds r2, r6, #0
	adds r2, #0x4a
	movs r1, #0
	strh r0, [r2]
	adds r0, r6, #0
	adds r0, #0x6e
	strb r1, [r0]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807C8F8: .4byte gUnknown_089A3810

	THUMB_FUNC_END sub_807C8A0

	THUMB_FUNC_START sub_807C8FC
sub_807C8FC: @ 0x0807C8FC
	push {r4, r5, r6, r7, lr}
	ldr r5, _0807C920  @ gBattleHitArray
	ldr r0, _0807C924  @ gBattleActor
	movs r1, #0
	bl sub_807C8A0
	ldr r0, _0807C928  @ gBattleTarget
	movs r1, #1
	bl sub_807C8A0
	bl ClearBattleHits
	movs r7, #0
	movs r6, #0
	ldr r3, _0807C92C  @ gUnknown_089A3810
	movs r2, #0xa
	b _0807C934
	.align 2, 0
_0807C920: .4byte gBattleHitArray
_0807C924: .4byte gBattleActor
_0807C928: .4byte gBattleTarget
_0807C92C: .4byte gUnknown_089A3810
_0807C930:
	adds r2, #2
	adds r6, #1
_0807C934:
	cmp r6, #4
	bgt _0807C968
	movs r4, #0
	ldr r0, [r3]
	adds r0, #8
	adds r0, r0, r2
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _0807C968
_0807C948:
	adds r4, #1
	cmp r4, #1
	bgt _0807C964
	ldr r0, [r3]
	movs r1, #0x64
	muls r1, r4, r1
	adds r1, r2, r1
	adds r0, #8
	adds r0, r0, r1
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _0807C948
	movs r7, #1
_0807C964:
	cmp r7, #0
	beq _0807C930
_0807C968:
	cmp r6, #5
	bne _0807C974
	cmp r4, #2
	bne _0807C974
	movs r0, #0
	b _0807CA9E
_0807C974:
	lsls r0, r6, #1
	adds r3, r0, r4
	cmp r3, #9
	ble _0807C97E
	b _0807CA86
_0807C97E:
	lsrs r0, r3, #0x1f
	adds r0, r3, r0
	asrs r6, r0, #1
	movs r4, #1
	ands r4, r3
	lsls r2, r4, #6
	ldrb r1, [r5, #2]
	movs r0, #7
	ands r0, r1
	orrs r0, r2
	strb r0, [r5, #2]
	ldr r0, _0807C9BC  @ gUnknown_089A3810
	ldr r2, [r0]
	adds r1, r6, #5
	lsls r1, r1, #1
	movs r0, #0x64
	muls r0, r4, r0
	adds r1, r1, r0
	adds r2, #8
	adds r2, r2, r1
	movs r0, #0
	ldrsh r7, [r2, r0]
	subs r0, r7, #1
	cmp r0, #8
	bhi _0807CA1C
	lsls r0, r0, #2
	ldr r1, _0807C9C0  @ _0807C9C4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0807C9BC: .4byte gUnknown_089A3810
_0807C9C0: .4byte _0807C9C4
_0807C9C4: @ jump table
	.4byte _0807CA04 @ case 0
	.4byte _0807CA04 @ case 1
	.4byte _0807CA04 @ case 2
	.4byte _0807CA04 @ case 3
	.4byte _0807C9E8 @ case 4
	.4byte _0807C9E8 @ case 5
	.4byte _0807C9E8 @ case 6
	.4byte _0807C9E8 @ case 7
	.4byte _0807CA0A @ case 8
_0807C9E8:
	ldr r2, [r5]
	lsls r1, r2, #0xd
	lsrs r1, r1, #0xd
	movs r0, #1
	orrs r1, r0
	ldr r0, _0807CA00  @ 0xFFF80000
	ands r0, r2
	orrs r0, r1
	str r0, [r5]
	movs r0, #0x14
	strb r0, [r5, #3]
	b _0807CA1C
	.align 2, 0
_0807CA00: .4byte 0xFFF80000
_0807CA04:
	movs r0, #0xa
	strb r0, [r5, #3]
	b _0807CA1C
_0807CA0A:
	ldr r2, [r5]
	lsls r1, r2, #0xd
	lsrs r1, r1, #0xd
	movs r0, #2
	orrs r1, r0
	ldr r0, _0807CA2C  @ 0xFFF80000
	ands r0, r2
	orrs r0, r1
	str r0, [r5]
_0807CA1C:
	subs r0, r7, #2
	cmp r0, #6
	bhi _0807CA78
	lsls r0, r0, #2
	ldr r1, _0807CA30  @ _0807CA34
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0807CA2C: .4byte 0xFFF80000
_0807CA30: .4byte _0807CA34
_0807CA34: @ jump table
	.4byte _0807CA50 @ case 0
	.4byte _0807CA5A @ case 1
	.4byte _0807CA66 @ case 2
	.4byte _0807CA78 @ case 3
	.4byte _0807CA50 @ case 4
	.4byte _0807CA5A @ case 5
	.4byte _0807CA66 @ case 6
_0807CA50:
	ldr r2, [r5]
	lsls r1, r2, #0xd
	lsrs r1, r1, #0xd
	movs r0, #0x80
	b _0807CA6E
_0807CA5A:
	ldr r2, [r5]
	lsls r1, r2, #0xd
	lsrs r1, r1, #0xd
	movs r0, #0x80
	lsls r0, r0, #1
	b _0807CA6E
_0807CA66:
	ldr r2, [r5]
	lsls r1, r2, #0xd
	lsrs r1, r1, #0xd
	movs r0, #0x40
_0807CA6E:
	orrs r1, r0
	ldr r0, _0807CAA4  @ 0xFFF80000
	ands r0, r2
	orrs r0, r1
	str r0, [r5]
_0807CA78:
	cmp r7, #0
	beq _0807CA7E
	adds r5, #4
_0807CA7E:
	adds r3, #1
	cmp r3, #9
	bgt _0807CA86
	b _0807C97E
_0807CA86:
	ldr r1, [r5]
	lsls r1, r1, #8
	lsrs r1, r1, #0x1b
	movs r0, #0x10
	orrs r1, r0
	lsls r1, r1, #3
	ldrb r2, [r5, #2]
	movs r0, #7
	ands r0, r2
	orrs r0, r1
	strb r0, [r5, #2]
	movs r0, #1
_0807CA9E:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0807CAA4: .4byte 0xFFF80000

	THUMB_FUNC_END sub_807C8FC

	THUMB_FUNC_START sub_807CAA8
sub_807CAA8: @ 0x0807CAA8
	push {lr}
	ldr r0, _0807CAC8  @ gBG0TilemapBuffer
	movs r1, #0
	bl BG_Fill
	ldr r0, _0807CACC  @ gBG1TilemapBuffer
	movs r1, #0
	bl BG_Fill
	movs r0, #3
	bl BG_EnableSyncByMask
	bl BeginBattleMapAnims
	pop {r0}
	bx r0
	.align 2, 0
_0807CAC8: .4byte gBG0TilemapBuffer
_0807CACC: .4byte gBG1TilemapBuffer

	THUMB_FUNC_END sub_807CAA8

	THUMB_FUNC_START sub_807CAD0
sub_807CAD0: @ 0x0807CAD0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0807CAF0  @ gUnknown_0203E1F0
	ldr r0, [r0, #0x50]
	ldr r0, [r0]
	lsls r0, r0, #8
	lsrs r0, r0, #0x1b
	movs r1, #0x10
	ands r0, r1
	cmp r0, #0
	beq _0807CAF4
	adds r0, r4, #0
	movs r1, #1
	bl Proc_Goto
	b _0807CAFE
	.align 2, 0
_0807CAF0: .4byte gUnknown_0203E1F0
_0807CAF4:
	bl MapAnim_AdvanceBattleRound
	adds r0, r4, #0
	bl Proc_Break
_0807CAFE:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_807CAD0

	THUMB_FUNC_START sub_807CB04
sub_807CB04: @ 0x0807CB04
	push {lr}
	bl MU_AllRestartAnimations
	bl sub_8003D20
	bl DeleteBattleAnimInfoThing
	bl SetupBackgroundForWeatherMaybe
	bl LoadLegacyUiFrameGraphics
	bl LoadObjUIGfx
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_807CB04

	THUMB_FUNC_START MapAnim_BeginMISSAnim
MapAnim_BeginMISSAnim: @ 0x0807CB24
	push {r4, lr}
	sub sp, #8
	adds r4, r0, #0
	ldr r0, _0807CB70  @ gUnknown_089AC0A4
	ldr r1, _0807CB74  @ 0x06013000
	bl CopyDataWithPossibleUncomp
	ldr r0, _0807CB78  @ gUnknown_089AC194
	movs r1, #0x10
	ldrsb r1, [r4, r1]
	ldr r3, _0807CB7C  @ gUnknown_0202BCB0
	ldrh r2, [r3, #0xc]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x14
	subs r1, r1, r2
	lsls r1, r1, #4
	adds r1, #8
	movs r2, #0x11
	ldrsb r2, [r4, r2]
	ldrh r3, [r3, #0xe]
	lsls r3, r3, #0x10
	asrs r3, r3, #0x14
	subs r2, r2, r3
	lsls r2, r2, #4
	adds r2, #0x10
	movs r3, #0xc0
	lsls r3, r3, #1
	movs r4, #0
	str r4, [sp]
	movs r4, #2
	str r4, [sp, #4]
	bl APProc_Create
	add sp, #8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807CB70: .4byte gUnknown_089AC0A4
_0807CB74: .4byte 0x06013000
_0807CB78: .4byte gUnknown_089AC194
_0807CB7C: .4byte gUnknown_0202BCB0

	THUMB_FUNC_END MapAnim_BeginMISSAnim

	THUMB_FUNC_START MapAnim_BeginNODAMAGEAnim
MapAnim_BeginNODAMAGEAnim: @ 0x0807CB80
	push {r4, lr}
	sub sp, #8
	adds r4, r0, #0
	ldr r0, _0807CBCC  @ gUnknown_089AC2FC
	ldr r1, _0807CBD0  @ 0x06013000
	bl CopyDataWithPossibleUncomp
	ldr r0, _0807CBD4  @ gUnknown_089AC440
	movs r1, #0x10
	ldrsb r1, [r4, r1]
	ldr r3, _0807CBD8  @ gUnknown_0202BCB0
	ldrh r2, [r3, #0xc]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x14
	subs r1, r1, r2
	lsls r1, r1, #4
	adds r1, #8
	movs r2, #0x11
	ldrsb r2, [r4, r2]
	ldrh r3, [r3, #0xe]
	lsls r3, r3, #0x10
	asrs r3, r3, #0x14
	subs r2, r2, r3
	lsls r2, r2, #4
	adds r2, #0x10
	movs r3, #0xc0
	lsls r3, r3, #1
	movs r4, #0
	str r4, [sp]
	movs r4, #2
	str r4, [sp, #4]
	bl APProc_Create
	add sp, #8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807CBCC: .4byte gUnknown_089AC2FC
_0807CBD0: .4byte 0x06013000
_0807CBD4: .4byte gUnknown_089AC440
_0807CBD8: .4byte gUnknown_0202BCB0

	THUMB_FUNC_END MapAnim_BeginNODAMAGEAnim

	THUMB_FUNC_START MapAnim_BeginWallBreakAnim
MapAnim_BeginWallBreakAnim: @ 0x0807CBDC
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _0807CC20  @ gUnknown_089A3924
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x2c]
	movs r2, #0x10
	ldrsb r2, [r4, r2]
	ldr r3, _0807CC24  @ gUnknown_0202BCB0
	ldrh r1, [r3, #0xc]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x14
	subs r2, r2, r1
	lsls r2, r2, #4
	adds r2, #8
	str r2, [r0, #0x30]
	movs r2, #0x11
	ldrsb r2, [r4, r2]
	ldrh r1, [r3, #0xe]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x14
	subs r2, r2, r1
	lsls r2, r2, #4
	subs r2, #8
	str r2, [r0, #0x34]
	movs r1, #1
	eors r5, r1
	adds r0, #0x48
	strh r5, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807CC20: .4byte gUnknown_089A3924
_0807CC24: .4byte gUnknown_0202BCB0

	THUMB_FUNC_END MapAnim_BeginWallBreakAnim

	THUMB_FUNC_START WallBreakAnim_Init
WallBreakAnim_Init: @ 0x0807CC28
	push {r4, r5, lr}
	sub sp, #8
	adds r4, r0, #0
	ldr r0, _0807CC68  @ gUnknown_089ADA80
	ldr r1, _0807CC6C  @ 0x06013000
	bl CopyDataWithPossibleUncomp
	ldr r0, _0807CC70  @ gUnknown_089ADD0C
	movs r1, #0x98
	lsls r1, r1, #2
	movs r2, #0x20
	bl CopyToPaletteBuffer
	ldr r0, _0807CC74  @ gUnknown_089A6FD8
	ldr r1, [r4, #0x30]
	ldr r2, [r4, #0x34]
	adds r2, #0x10
	movs r3, #0xc6
	lsls r3, r3, #6
	adds r4, #0x48
	movs r5, #0
	ldrsh r4, [r4, r5]
	str r4, [sp]
	movs r4, #2
	str r4, [sp, #4]
	bl APProc_Create
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807CC68: .4byte gUnknown_089ADA80
_0807CC6C: .4byte 0x06013000
_0807CC70: .4byte gUnknown_089ADD0C
_0807CC74: .4byte gUnknown_089A6FD8

	THUMB_FUNC_END WallBreakAnim_Init

	THUMB_FUNC_START NewMapPoisonEffect
NewMapPoisonEffect: @ 0x0807CC78
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0807CCB8  @ gUnknown_089A3944
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x2c]
	movs r2, #0x10
	ldrsb r2, [r4, r2]
	ldr r3, _0807CCBC  @ gUnknown_0202BCB0
	ldrh r1, [r3, #0xc]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x14
	subs r2, r2, r1
	lsls r2, r2, #1
	adds r2, #1
	lsls r2, r2, #3
	str r2, [r0, #0x30]
	movs r2, #0x11
	ldrsb r2, [r4, r2]
	ldrh r1, [r3, #0xe]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x14
	subs r2, r2, r1
	lsls r2, r2, #1
	adds r2, #1
	lsls r2, r2, #3
	str r2, [r0, #0x34]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807CCB8: .4byte gUnknown_089A3944
_0807CCBC: .4byte gUnknown_0202BCB0

	THUMB_FUNC_END NewMapPoisonEffect

	THUMB_FUNC_START MapAnim_BeginPoisonAnim
MapAnim_BeginPoisonAnim: @ 0x0807CCC0
	push {r4, lr}
	sub sp, #8
	adds r4, r0, #0
	ldr r1, [r4, #0x30]
	movs r0, #0xb7
	bl PlaySpacialSoundMaybe
	ldr r0, _0807CD04  @ gUnknown_089ADEB0
	ldr r1, _0807CD08  @ 0x06013800
	bl CopyDataWithPossibleUncomp
	ldr r0, _0807CD0C  @ gUnknown_089AE204
	movs r1, #0xa0
	lsls r1, r1, #2
	movs r2, #0x20
	bl CopyToPaletteBuffer
	ldr r0, _0807CD10  @ gUnknown_089A6F40
	ldr r1, [r4, #0x30]
	subs r1, #8
	ldr r2, [r4, #0x34]
	adds r2, #8
	ldr r3, _0807CD14  @ 0x000041C0
	movs r4, #0
	str r4, [sp]
	movs r4, #2
	str r4, [sp, #4]
	bl APProc_Create
	add sp, #8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807CD04: .4byte gUnknown_089ADEB0
_0807CD08: .4byte 0x06013800
_0807CD0C: .4byte gUnknown_089AE204
_0807CD10: .4byte gUnknown_089A6F40
_0807CD14: .4byte 0x000041C0

	THUMB_FUNC_END MapAnim_BeginPoisonAnim

	THUMB_FUNC_START sub_807CD18
sub_807CD18: @ 0x0807CD18
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0807CD58  @ gUnknown_089A3964
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x2c]
	movs r2, #0x10
	ldrsb r2, [r4, r2]
	ldr r3, _0807CD5C  @ gUnknown_0202BCB0
	ldrh r1, [r3, #0xc]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x14
	subs r2, r2, r1
	lsls r2, r2, #1
	adds r2, #1
	lsls r2, r2, #3
	str r2, [r0, #0x30]
	movs r2, #0x11
	ldrsb r2, [r4, r2]
	ldrh r1, [r3, #0xe]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x14
	subs r2, r2, r1
	lsls r2, r2, #1
	adds r2, #1
	lsls r2, r2, #3
	str r2, [r0, #0x34]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807CD58: .4byte gUnknown_089A3964
_0807CD5C: .4byte gUnknown_0202BCB0

	THUMB_FUNC_END sub_807CD18

	THUMB_FUNC_START sub_807CD60
sub_807CD60: @ 0x0807CD60
	push {r4, lr}
	sub sp, #8
	adds r4, r0, #0
	ldr r1, [r4, #0x30]
	movs r0, #0xb7
	bl PlaySpacialSoundMaybe
	ldr r0, _0807CDA4  @ gUnknown_089ADEB0
	ldr r1, _0807CDA8  @ 0x06013800
	bl CopyDataWithPossibleUncomp
	ldr r0, _0807CDAC  @ gUnknown_089AE204
	movs r1, #0xa0
	lsls r1, r1, #2
	movs r2, #0x20
	bl CopyToPaletteBuffer
	ldr r0, _0807CDB0  @ gUnknown_089A6F40
	ldr r1, [r4, #0x30]
	subs r1, #8
	ldr r2, [r4, #0x34]
	adds r2, #8
	ldr r3, _0807CDB4  @ 0x000041C0
	movs r4, #0
	str r4, [sp]
	movs r4, #2
	str r4, [sp, #4]
	bl APProc_Create
	add sp, #8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807CDA4: .4byte gUnknown_089ADEB0
_0807CDA8: .4byte 0x06013800
_0807CDAC: .4byte gUnknown_089AE204
_0807CDB0: .4byte gUnknown_089A6F40
_0807CDB4: .4byte 0x000041C0

	THUMB_FUNC_END sub_807CD60

	THUMB_FUNC_START sub_807CDB8
sub_807CDB8: @ 0x0807CDB8
	push {lr}
	bl RefreshEntityBmMaps
	bl RenderBmMap
	bl SMS_UpdateFromGameData
	bl MU_EndAll
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_807CDB8

	THUMB_FUNC_START sub_807CDD0
sub_807CDD0: @ 0x0807CDD0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0807CE10  @ gUnknown_089A398C
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x2c]
	movs r2, #0x10
	ldrsb r2, [r4, r2]
	ldr r3, _0807CE14  @ gUnknown_0202BCB0
	ldrh r1, [r3, #0xc]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x14
	subs r2, r2, r1
	lsls r2, r2, #1
	adds r2, #1
	lsls r2, r2, #3
	str r2, [r0, #0x30]
	movs r2, #0x11
	ldrsb r2, [r4, r2]
	ldrh r1, [r3, #0xe]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x14
	subs r2, r2, r1
	lsls r2, r2, #1
	adds r2, #1
	lsls r2, r2, #3
	str r2, [r0, #0x34]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807CE10: .4byte gUnknown_089A398C
_0807CE14: .4byte gUnknown_0202BCB0

	THUMB_FUNC_END sub_807CDD0

	THUMB_FUNC_START sub_807CE18
sub_807CE18: @ 0x0807CE18
	push {r4, r5, lr}
	adds r5, r0, #0
	bl sub_807E978
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	ldr r4, _0807CE6C  @ gUnknown_089B7610
	movs r0, #2
	bl GetBackgroundTileDataOffset
	adds r1, r0, #0
	ldr r0, _0807CE70  @ 0x06002C00
	adds r1, r1, r0
	adds r0, r4, #0
	bl CopyDataWithPossibleUncomp
	ldr r0, _0807CE74  @ gUnknown_089B80C4
	movs r1, #0x80
	movs r2, #0x20
	bl CopyToPaletteBuffer
	movs r0, #1
	movs r1, #0x10
	movs r2, #0x10
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	adds r0, r5, #0
	adds r0, #0x40
	movs r1, #0
	strh r1, [r0]
	adds r5, #0x42
	strh r1, [r5]
	bl EnablePaletteSync
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807CE6C: .4byte gUnknown_089B7610
_0807CE70: .4byte 0x06002C00
_0807CE74: .4byte gUnknown_089B80C4

	THUMB_FUNC_END sub_807CE18

	THUMB_FUNC_START sub_807CE78
sub_807CE78: @ 0x0807CE78
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r0, #0x42
	ldrh r0, [r0]
	cmp r0, #0
	bne _0807CF0C
	adds r0, r4, #0
	adds r0, #0x40
	ldrh r1, [r0]
	adds r5, r0, #0
	cmp r1, #0
	bne _0807CEA0
	ldr r0, _0807CE9C  @ 0x000003CA
	ldr r1, [r4, #0x30]
	bl PlaySpacialSoundMaybe
	b _0807CEB8
	.align 2, 0
_0807CE9C: .4byte 0x000003CA
_0807CEA0:
	cmp r1, #1
	bne _0807CEAC
	adds r0, r4, #0
	bl sub_807CF30
	b _0807CEB8
_0807CEAC:
	cmp r1, #6
	bls _0807CEB8
	adds r0, r4, #0
	bl Proc_Break
	b _0807CF16
_0807CEB8:
	ldr r0, _0807CF20  @ gUnknown_089A39C4
	ldrh r1, [r5]
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r0, [r1]
	ldr r6, _0807CF24  @ gUnknown_02020188
	adds r1, r6, #0
	bl CopyDataWithPossibleUncomp
	ldr r1, _0807CF28  @ gBG2TilemapBuffer
	ldr r0, [r4, #0x30]
	cmp r0, #0
	bge _0807CED4
	adds r0, #7
_0807CED4:
	asrs r0, r0, #3
	subs r0, #8
	lsls r0, r0, #0x10
	asrs r2, r0, #0x10
	ldr r3, [r4, #0x34]
	cmp r3, #0
	bge _0807CEE4
	adds r3, #7
_0807CEE4:
	asrs r3, r3, #3
	subs r3, #7
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	ldr r0, _0807CF2C  @ 0x00004160
	str r0, [sp]
	adds r0, r1, #0
	adds r1, r6, #0
	bl sub_800159C
	movs r0, #4
	bl BG_EnableSyncByMask
	ldrh r0, [r5]
	adds r0, #1
	strh r0, [r5]
	adds r1, r4, #0
	adds r1, #0x42
	movs r0, #5
	strh r0, [r1]
_0807CF0C:
	adds r1, r4, #0
	adds r1, #0x42
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
_0807CF16:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807CF20: .4byte gUnknown_089A39C4
_0807CF24: .4byte gUnknown_02020188
_0807CF28: .4byte gBG2TilemapBuffer
_0807CF2C: .4byte 0x00004160

	THUMB_FUNC_END sub_807CE78

	THUMB_FUNC_START sub_807CF30
sub_807CF30: @ 0x0807CF30
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	bl AdvanceGetLCGRNValue
	movs r1, #0x65
	bl DivRem
	ldr r1, [r7, #0x2c]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	ldrb r1, [r1, #0x11]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl GetTrapAt
	movs r1, #1
	mov ip, r1
	cmp r0, #0
	beq _0807CF5A
	ldrb r0, [r0, #7]
	mov ip, r0
_0807CF5A:
	ldr r2, _0807CF8C  @ gUnknown_03001C68
	movs r1, #0
	movs r0, #0xba
	strb r0, [r2]
	movs r0, #0x61
	strb r0, [r2, #1]
	strb r1, [r2, #2]
	ldrb r1, [r2, #3]
	movs r0, #1
	adds r3, r1, #0
	orrs r3, r0
	strb r3, [r2, #3]
	ldr r1, [r7, #0x2c]
	movs r4, #0xb
	ldrsb r4, [r1, r4]
	movs r0, #0xc0
	ands r4, r0
	adds r6, r1, #0
	adds r5, r2, #0
	cmp r4, #0
	bne _0807CF90
	subs r0, #0xc7
	ands r3, r0
	b _0807CFAC
	.align 2, 0
_0807CF8C: .4byte gUnknown_03001C68
_0807CF90:
	cmp r4, #0x80
	bne _0807CF9E
	movs r0, #7
	negs r0, r0
	ands r3, r0
	movs r0, #4
	b _0807CFAA
_0807CF9E:
	cmp r4, #0x40
	bne _0807CFAE
	movs r0, #7
	negs r0, r0
	ands r3, r0
	movs r0, #2
_0807CFAA:
	orrs r3, r0
_0807CFAC:
	strb r3, [r5, #3]
_0807CFAE:
	mov r0, ip
	lsls r2, r0, #3
	ldrb r1, [r5, #3]
	movs r0, #7
	ands r0, r1
	orrs r0, r2
	strb r0, [r5, #3]
	movs r0, #0x3f
	ldrb r1, [r6, #0x10]
	ands r1, r0
	ldrb r2, [r5, #4]
	movs r0, #0x40
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r5, #4]
	movs r1, #0x11
	ldrsb r1, [r6, r1]
	movs r0, #0x3f
	ands r1, r0
	lsls r1, r1, #6
	ldrh r2, [r5, #4]
	ldr r0, _0807D094  @ 0xFFFFF03F
	ands r0, r2
	orrs r0, r1
	strh r0, [r5, #4]
	movs r0, #0
	strb r0, [r5, #7]
	str r0, [r5, #8]
	ldrb r1, [r5, #5]
	subs r0, #0x11
	ands r0, r1
	movs r1, #0x21
	negs r1, r1
	ands r0, r1
	strb r0, [r5, #5]
	movs r2, #0
	adds r3, r5, #0
	adds r3, #0xc
	movs r1, #0
_0807CFFE:
	adds r0, r2, r3
	strb r1, [r0]
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #3
	bls _0807CFFE
	movs r2, #0
	ldr r4, _0807D098  @ gUnknown_03001C74
_0807D010:
	ldr r0, [r7, #0x2c]
	adds r3, r2, #1
	lsls r1, r3, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r1, [r0]
	cmp r1, #0
	beq _0807D024
	adds r0, r2, r4
	strb r1, [r0]
_0807D024:
	lsls r0, r3, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #3
	bls _0807D010
	ldr r0, [r7, #0x2c]
	ldr r1, [r0, #0xc]
	movs r2, #0x80
	lsls r2, r2, #5
	ands r1, r2
	adds r6, r0, #0
	cmp r1, #0
	beq _0807D044
	ldrb r0, [r5, #5]
	movs r1, #0x20
	orrs r0, r1
	strb r0, [r5, #5]
_0807D044:
	adds r0, r6, #0
	adds r0, #0x42
	ldrb r0, [r0]
	strb r0, [r5, #0x10]
	adds r0, r6, #0
	adds r0, #0x44
	ldrb r0, [r0]
	strb r0, [r5, #0x11]
	adds r0, r6, #0
	adds r0, #0x43
	ldrb r0, [r0]
	strb r0, [r5, #0x12]
	movs r0, #0
	strb r0, [r5, #0x13]
	adds r0, r5, #0
	bl LoadUnits
	movs r0, #0xba
	bl GetUnitFromCharId
	ldr r0, [r7, #0x2c]
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetUnit
	bl ClearUnit
	bl RefreshEntityBmMaps
	bl RenderBmMap
	bl SMS_UpdateFromGameData
	bl MU_EndAll
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807D094: .4byte 0xFFFFF03F
_0807D098: .4byte gUnknown_03001C74

	THUMB_FUNC_END sub_807CF30

	THUMB_FUNC_START sub_807D09C
sub_807D09C: @ 0x0807D09C
	push {lr}
	ldr r0, _0807D0B0  @ gBG2TilemapBuffer
	movs r1, #0
	bl BG_Fill
	movs r0, #4
	bl BG_EnableSyncByMask
	pop {r0}
	bx r0
	.align 2, 0
_0807D0B0: .4byte gBG2TilemapBuffer

	THUMB_FUNC_END sub_807D09C

	THUMB_FUNC_START sub_807D0B4
sub_807D0B4: @ 0x0807D0B4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0807D0F4  @ gUnknown_089A39E0
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x2c]
	movs r2, #0x10
	ldrsb r2, [r4, r2]
	ldr r3, _0807D0F8  @ gUnknown_0202BCB0
	ldrh r1, [r3, #0xc]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x14
	subs r2, r2, r1
	lsls r2, r2, #1
	adds r2, #1
	lsls r2, r2, #3
	str r2, [r0, #0x30]
	movs r2, #0x11
	ldrsb r2, [r4, r2]
	ldrh r1, [r3, #0xe]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x14
	subs r2, r2, r1
	lsls r2, r2, #1
	adds r2, #1
	lsls r2, r2, #3
	str r2, [r0, #0x34]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807D0F4: .4byte gUnknown_089A39E0
_0807D0F8: .4byte gUnknown_0202BCB0

	THUMB_FUNC_END sub_807D0B4

	THUMB_FUNC_START sub_807D0FC
sub_807D0FC: @ 0x0807D0FC
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	bl sub_807E978
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	ldr r4, _0807D188  @ gUnknown_089AF950
	movs r0, #2
	bl GetBackgroundTileDataOffset
	adds r1, r0, #0
	ldr r0, _0807D18C  @ 0x06002C00
	adds r1, r1, r0
	adds r0, r4, #0
	bl CopyDataWithPossibleUncomp
	movs r0, #1
	movs r1, #0x10
	movs r2, #0x10
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	movs r4, #0
	str r4, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #1
	movs r3, #0
	bl sub_8001ED0
	movs r0, #0
	bl sub_8001F48
	movs r0, #1
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #1
	bl sub_8001F0C
	movs r0, #1
	bl sub_8001F64
	adds r0, r5, #0
	adds r0, #0x40
	strh r4, [r0]
	adds r0, #2
	strh r4, [r0]
	ldr r0, _0807D190  @ gUnknown_0203E1F0
	ldr r0, [r0, #4]
	adds r0, #0x4a
	ldrh r0, [r0]
	bl GetItemIndex
	cmp r0, #0x8c
	bne _0807D198
	ldr r0, _0807D194  @ gUnknown_089AFFB8
	str r5, [sp]
	movs r1, #0x80
	movs r2, #0x20
	movs r3, #2
	bl sub_80144CC
	b _0807D1A6
	.align 2, 0
_0807D188: .4byte gUnknown_089AF950
_0807D18C: .4byte 0x06002C00
_0807D190: .4byte gUnknown_0203E1F0
_0807D194: .4byte gUnknown_089AFFB8
_0807D198:
	ldr r0, _0807D1B0  @ gUnknown_089AFF78
	str r5, [sp]
	movs r1, #0x80
	movs r2, #0x20
	movs r3, #2
	bl sub_80144CC
_0807D1A6:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807D1B0: .4byte gUnknown_089AFF78

	THUMB_FUNC_END sub_807D0FC

	THUMB_FUNC_START sub_807D1B4
sub_807D1B4: @ 0x0807D1B4
	push {r4, r5, lr}
	sub sp, #8
	adds r5, r0, #0
	adds r4, r5, #0
	adds r4, #0x42
	ldrh r0, [r4]
	cmp r0, #2
	bls _0807D268
	bl DeleteAllPaletteAnimator
	ldr r4, _0807D1F8  @ gUnknown_089AFF78
	str r5, [sp]
	adds r0, r4, #0
	movs r1, #0x80
	movs r2, #0x20
	movs r3, #4
	bl NewPaletteAnimator_
	ldr r0, _0807D1FC  @ gUnknown_0203E1F0
	ldr r0, [r0, #4]
	adds r0, #0x4a
	ldrh r0, [r0]
	bl GetItemIndex
	cmp r0, #0x8c
	bne _0807D204
	ldr r0, _0807D200  @ gUnknown_089AFFB8
	str r5, [sp]
	movs r1, #0x80
	movs r2, #0x20
	movs r3, #4
	bl NewPaletteAnimator_
	b _0807D212
	.align 2, 0
_0807D1F8: .4byte gUnknown_089AFF78
_0807D1FC: .4byte gUnknown_0203E1F0
_0807D200: .4byte gUnknown_089AFFB8
_0807D204:
	str r5, [sp]
	adds r0, r4, #0
	movs r1, #0x80
	movs r2, #0x20
	movs r3, #4
	bl NewPaletteAnimator_
_0807D212:
	ldr r4, _0807D260  @ gUnknown_089AFFF8
	movs r0, #2
	bl GetBackgroundTileDataOffset
	adds r1, r0, #0
	ldr r0, _0807D264  @ 0x06002C00
	adds r1, r1, r0
	adds r0, r4, #0
	bl CopyDataWithPossibleUncomp
	ldr r0, [r5, #0x30]
	cmp r0, #0
	bge _0807D22E
	adds r0, #7
_0807D22E:
	asrs r0, r0, #3
	subs r2, r0, #4
	ldr r1, [r5, #0x34]
	cmp r1, #0
	bge _0807D23A
	adds r1, #7
_0807D23A:
	asrs r1, r1, #3
	subs r1, #4
	movs r0, #0
	str r0, [sp]
	str r5, [sp, #4]
	adds r0, r2, #0
	movs r2, #8
	movs r3, #0x3c
	bl sub_807D360
	adds r0, r5, #0
	bl Proc_Break
	ldr r1, [r5, #0x30]
	movs r0, #0x8c
	bl PlaySpacialSoundMaybe
	b _0807D2BA
	.align 2, 0
_0807D260: .4byte gUnknown_089AFFF8
_0807D264: .4byte 0x06002C00
_0807D268:
	ldr r0, _0807D2C4  @ gUnknown_089A3A18
	ldrh r1, [r4]
	lsls r2, r1, #2
	adds r2, r2, r0
	movs r3, #0
	ldrsh r2, [r2, r3]
	lsls r1, r1, #1
	adds r1, #1
	lsls r1, r1, #1
	adds r1, r1, r0
	movs r0, #0
	ldrsh r3, [r1, r0]
	ldr r0, [r5, #0x30]
	cmp r0, #0
	bge _0807D288
	adds r0, #7
_0807D288:
	asrs r0, r0, #3
	adds r0, r0, r2
	subs r2, r0, #3
	ldr r1, [r5, #0x34]
	cmp r1, #0
	bge _0807D296
	adds r1, #7
_0807D296:
	asrs r1, r1, #3
	adds r1, r1, r3
	subs r1, #3
	movs r0, #8
	str r0, [sp]
	str r5, [sp, #4]
	adds r0, r2, #0
	movs r2, #6
	movs r3, #0xa
	bl sub_807D360
	ldr r1, [r5, #0x30]
	movs r0, #0x89
	bl PlaySpacialSoundMaybe
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
_0807D2BA:
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807D2C4: .4byte gUnknown_089A3A18

	THUMB_FUNC_END sub_807D1B4

	THUMB_FUNC_START sub_807D2C8
sub_807D2C8: @ 0x0807D2C8
	push {lr}
	ldr r0, _0807D2DC  @ gBG2TilemapBuffer
	movs r1, #0
	bl BG_Fill
	movs r0, #4
	bl BG_EnableSyncByMask
	pop {r0}
	bx r0
	.align 2, 0
_0807D2DC: .4byte gBG2TilemapBuffer

	THUMB_FUNC_END sub_807D2C8

	THUMB_FUNC_START sub_807D2E0
sub_807D2E0: @ 0x0807D2E0
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	bl DeleteAllPaletteAnimator
	ldr r0, _0807D324  @ gBG2TilemapBuffer
	movs r1, #0
	bl BG_Fill
	movs r0, #4
	bl BG_EnableSyncByMask
	movs r0, #1
	str r0, [sp]
	movs r1, #1
	movs r2, #1
	movs r3, #1
	bl sub_8001ED0
	movs r0, #1
	bl sub_8001F48
	adds r1, r4, #0
	adds r1, #0x64
	movs r0, #0x40
	strh r0, [r1]
	adds r0, r4, #0
	bl sub_807D328
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807D324: .4byte gBG2TilemapBuffer

	THUMB_FUNC_END sub_807D2E0

	THUMB_FUNC_START sub_807D328
sub_807D328: @ 0x0807D328
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r5, #0
	adds r4, #0x64
	ldrh r3, [r4]
	subs r0, r3, #1
	strh r0, [r4]
	lsls r3, r3, #0x10
	asrs r3, r3, #0x12
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl SetSpecialColorEffectsParameters
	movs r1, #0
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _0807D35A
	bl SetDefaultColorEffects
	adds r0, r5, #0
	bl Proc_Break
_0807D35A:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_807D328

	THUMB_FUNC_START sub_807D360
sub_807D360: @ 0x0807D360
	push {r4, r5, r6, lr}
	mov r6, r9
	mov r5, r8
	push {r5, r6}
	adds r5, r0, #0
	adds r6, r1, #0
	mov r8, r2
	mov r9, r3
	ldr r4, [sp, #0x18]
	ldr r1, [sp, #0x1c]
	ldr r0, _0807D398  @ gUnknown_089A3A40
	bl Proc_StartBlocking
	str r5, [r0, #0x2c]
	str r6, [r0, #0x30]
	mov r1, r8
	str r1, [r0, #0x54]
	str r4, [r0, #0x58]
	adds r0, #0x44
	mov r1, r9
	strh r1, [r0]
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807D398: .4byte gUnknown_089A3A40

	THUMB_FUNC_END sub_807D360

	THUMB_FUNC_START sub_807D39C
sub_807D39C: @ 0x0807D39C
	push {lr}
	ldr r0, _0807D3B0  @ gBG2TilemapBuffer
	movs r1, #0
	bl BG_Fill
	movs r0, #4
	bl BG_EnableSyncByMask
	pop {r0}
	bx r0
	.align 2, 0
_0807D3B0: .4byte gBG2TilemapBuffer

	THUMB_FUNC_END sub_807D39C

	THUMB_FUNC_START sub_807D3B4
sub_807D3B4: @ 0x0807D3B4
	push {lr}
	ldr r0, _0807D3C8  @ gBG2TilemapBuffer
	movs r1, #0
	bl BG_Fill
	movs r0, #4
	bl BG_EnableSyncByMask
	pop {r0}
	bx r0
	.align 2, 0
_0807D3C8: .4byte gBG2TilemapBuffer

	THUMB_FUNC_END sub_807D3B4

	THUMB_FUNC_START sub_807D3CC
sub_807D3CC: @ 0x0807D3CC
	push {r4, r5, lr}
	sub sp, #8
	adds r5, r0, #0
	ldr r0, _0807D404  @ gBG2TilemapBuffer
	ldr r1, [r5, #0x2c]
	ldr r2, [r5, #0x30]
	ldr r3, _0807D408  @ 0x00004160
	ldr r4, [r5, #0x54]
	str r4, [sp]
	str r4, [sp, #4]
	bl sub_8014560
	movs r0, #4
	bl BG_EnableSyncByMask
	movs r0, #1
	movs r1, #0
	movs r2, #0x10
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	adds r5, #0x64
	movs r0, #0
	strh r0, [r5]
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807D404: .4byte gBG2TilemapBuffer
_0807D408: .4byte 0x00004160

	THUMB_FUNC_END sub_807D3CC

	THUMB_FUNC_START sub_807D40C
sub_807D40C: @ 0x0807D40C
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r5, #0
	adds r4, #0x64
	ldrh r1, [r4]
	adds r1, #2
	strh r1, [r4]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	movs r0, #1
	movs r2, #0x10
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	movs r1, #0
	ldrsh r0, [r4, r1]
	cmp r0, #7
	ble _0807D43A
	movs r0, #0
	strh r0, [r4]
	adds r0, r5, #0
	bl Proc_Break
_0807D43A:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_807D40C

	THUMB_FUNC_START sub_807D440
sub_807D440: @ 0x0807D440
	push {lr}
	adds r2, r0, #0
	adds r0, #0x44
	ldrh r1, [r0]
	subs r1, #1
	strh r1, [r0]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r0, #1
	negs r0, r0
	cmp r1, r0
	bne _0807D45E
	adds r0, r2, #0
	bl Proc_Break
_0807D45E:
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_807D440

	THUMB_FUNC_START sub_807D464
sub_807D464: @ 0x0807D464
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r0, [r5, #0x58]
	cmp r0, #0
	bne _0807D478
	adds r0, r5, #0
	bl Proc_Break
	b _0807D4C6
_0807D478:
	adds r4, r5, #0
	adds r4, #0x64
	ldrh r3, [r4]
	adds r0, r3, #1
	strh r0, [r4]
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	ldr r0, [r5, #0x58]
	str r0, [sp]
	movs r0, #0
	movs r1, #8
	movs r2, #0
	bl sub_8012DCC
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	movs r0, #1
	movs r2, #0x10
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	movs r0, #0
	ldrsh r1, [r4, r0]
	ldr r0, [r5, #0x58]
	cmp r1, r0
	blt _0807D4C6
	movs r0, #0
	strh r0, [r4]
	ldr r0, _0807D4D0  @ gBG2TilemapBuffer
	movs r1, #0
	bl BG_Fill
	movs r0, #4
	bl BG_EnableSyncByMask
	adds r0, r5, #0
	bl Proc_Break
_0807D4C6:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807D4D0: .4byte gBG2TilemapBuffer

	THUMB_FUNC_END sub_807D464

	THUMB_FUNC_START sub_807D4D4
sub_807D4D4: @ 0x0807D4D4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0807D514  @ gUnknown_089A3A80
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x2c]
	movs r2, #0x10
	ldrsb r2, [r4, r2]
	ldr r3, _0807D518  @ gUnknown_0202BCB0
	ldrh r1, [r3, #0xc]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x14
	subs r2, r2, r1
	lsls r2, r2, #1
	adds r2, #1
	lsls r2, r2, #3
	str r2, [r0, #0x30]
	movs r2, #0x11
	ldrsb r2, [r4, r2]
	ldrh r1, [r3, #0xe]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x14
	subs r2, r2, r1
	lsls r2, r2, #1
	adds r2, #1
	lsls r2, r2, #3
	str r2, [r0, #0x34]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807D514: .4byte gUnknown_089A3A80
_0807D518: .4byte gUnknown_0202BCB0

	THUMB_FUNC_END sub_807D4D4

	THUMB_FUNC_START sub_807D51C
sub_807D51C: @ 0x0807D51C
	push {r4, r5, lr}
	adds r5, r0, #0
	bl sub_807E978
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	ldr r4, _0807D570  @ gUnknown_089B35D0
	movs r0, #2
	bl GetBackgroundTileDataOffset
	adds r1, r0, #0
	ldr r0, _0807D574  @ 0x06002C00
	adds r1, r1, r0
	adds r0, r4, #0
	bl CopyDataWithPossibleUncomp
	ldr r0, _0807D578  @ gUnknown_089B4BFC
	movs r1, #0x80
	movs r2, #0x20
	bl CopyToPaletteBuffer
	movs r0, #1
	movs r1, #0x10
	movs r2, #0x10
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	adds r0, r5, #0
	adds r0, #0x40
	movs r1, #0
	strh r1, [r0]
	adds r5, #0x42
	strh r1, [r5]
	bl EnablePaletteSync
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807D570: .4byte gUnknown_089B35D0
_0807D574: .4byte 0x06002C00
_0807D578: .4byte gUnknown_089B4BFC

	THUMB_FUNC_END sub_807D51C

	THUMB_FUNC_START sub_807D57C
sub_807D57C: @ 0x0807D57C
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	adds r0, #0x42
	ldrh r0, [r0]
	cmp r0, #0
	bne _0807D64A
	adds r0, r5, #0
	adds r0, #0x40
	ldrh r1, [r0]
	adds r6, r0, #0
	cmp r1, #0
	bne _0807D5A2
	movs r0, #0xe1
	lsls r0, r0, #2
	ldr r1, [r5, #0x30]
	bl PlaySpacialSoundMaybe
	b _0807D5AE
_0807D5A2:
	cmp r1, #0x21
	bls _0807D5AE
	adds r0, r5, #0
	bl Proc_Break
	b _0807D654
_0807D5AE:
	ldr r0, _0807D5D0  @ gUnknown_0820579C
	ldrh r1, [r6]
	lsls r1, r1, #2
	adds r1, r1, r0
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bge _0807D5D8
	ldr r0, _0807D5D4  @ gBG2TilemapBuffer
	movs r1, #0
	bl BG_Fill
	movs r0, #4
	bl BG_EnableSyncByMask
	b _0807D622
	.align 2, 0
_0807D5D0: .4byte gUnknown_0820579C
_0807D5D4: .4byte gBG2TilemapBuffer
_0807D5D8:
	ldr r0, _0807D65C  @ gUnknown_089A3AB8
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r0, [r1]
	ldr r4, _0807D660  @ gUnknown_02020188
	adds r1, r4, #0
	bl CopyDataWithPossibleUncomp
	ldr r1, _0807D664  @ gBG2TilemapBuffer
	ldr r0, [r5, #0x30]
	cmp r0, #0
	bge _0807D5F8
	adds r0, #7
_0807D5F8:
	asrs r0, r0, #3
	subs r0, #9
	lsls r0, r0, #0x10
	asrs r2, r0, #0x10
	ldr r3, [r5, #0x34]
	cmp r3, #0
	bge _0807D608
	adds r3, #7
_0807D608:
	asrs r3, r3, #3
	subs r3, #9
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	ldr r0, _0807D668  @ 0x00004160
	str r0, [sp]
	adds r0, r1, #0
	adds r1, r4, #0
	bl sub_800159C
	movs r0, #4
	bl BG_EnableSyncByMask
_0807D622:
	ldr r4, _0807D66C  @ gUnknown_0820579C
	ldrh r0, [r6]
	lsls r0, r0, #2
	adds r0, r0, r4
	ldrb r1, [r0, #2]
	movs r0, #1
	movs r2, #0x10
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	ldrh r0, [r6]
	lsls r0, r0, #2
	adds r0, r0, r4
	ldrb r0, [r0, #1]
	adds r1, r5, #0
	adds r1, #0x42
	strh r0, [r1]
	ldrh r0, [r6]
	adds r0, #1
	strh r0, [r6]
_0807D64A:
	adds r1, r5, #0
	adds r1, #0x42
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
_0807D654:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807D65C: .4byte gUnknown_089A3AB8
_0807D660: .4byte gUnknown_02020188
_0807D664: .4byte gBG2TilemapBuffer
_0807D668: .4byte 0x00004160
_0807D66C: .4byte gUnknown_0820579C

	THUMB_FUNC_END sub_807D57C

	THUMB_FUNC_START sub_807D670
sub_807D670: @ 0x0807D670
	push {lr}
	ldr r0, _0807D684  @ gBG2TilemapBuffer
	movs r1, #0
	bl BG_Fill
	movs r0, #4
	bl BG_EnableSyncByMask
	pop {r0}
	bx r0
	.align 2, 0
_0807D684: .4byte gBG2TilemapBuffer

	THUMB_FUNC_END sub_807D670

	THUMB_FUNC_START sub_807D688
sub_807D688: @ 0x0807D688
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	ldr r0, _0807D6D0  @ gUnknown_089A3B3C
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x2c]
	movs r2, #0x10
	ldrsb r2, [r4, r2]
	ldr r3, _0807D6D4  @ gUnknown_0202BCB0
	ldrh r1, [r3, #0xc]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x14
	subs r2, r2, r1
	lsls r2, r2, #1
	adds r2, #1
	lsls r2, r2, #3
	str r2, [r0, #0x30]
	movs r2, #0x11
	ldrsb r2, [r4, r2]
	ldrh r1, [r3, #0xe]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x14
	subs r2, r2, r1
	lsls r2, r2, #1
	adds r2, #1
	lsls r2, r2, #3
	str r2, [r0, #0x34]
	str r5, [r0, #0x50]
	str r6, [r0, #0x54]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807D6D0: .4byte gUnknown_089A3B3C
_0807D6D4: .4byte gUnknown_0202BCB0

	THUMB_FUNC_END sub_807D688

	THUMB_FUNC_START sub_807D6D8
sub_807D6D8: @ 0x0807D6D8
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r1, [r5, #0x30]
	movs r0, #0xb6
	bl PlaySpacialSoundMaybe
	ldr r2, _0807D758  @ gLCDControlBuffer
	ldrb r3, [r2, #0xc]
	movs r1, #4
	negs r1, r1
	adds r0, r1, #0
	ands r0, r3
	strb r0, [r2, #0xc]
	ldrb r3, [r2, #0x10]
	adds r0, r1, #0
	ands r0, r3
	movs r4, #1
	orrs r0, r4
	strb r0, [r2, #0x10]
	ldrb r3, [r2, #0x14]
	adds r0, r1, #0
	ands r0, r3
	orrs r0, r4
	strb r0, [r2, #0x14]
	ldrb r0, [r2, #0x18]
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	strb r1, [r2, #0x18]
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	ldr r4, [r5, #0x50]
	movs r0, #2
	bl GetBackgroundTileDataOffset
	adds r1, r0, #0
	ldr r0, _0807D75C  @ 0x06002C00
	adds r1, r1, r0
	adds r0, r4, #0
	bl CopyDataWithPossibleUncomp
	ldr r0, [r5, #0x54]
	movs r1, #0x80
	movs r2, #0x20
	bl CopyToPaletteBuffer
	bl sub_807E978
	movs r0, #1
	movs r1, #0x10
	movs r2, #0x10
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	adds r5, #0x40
	movs r0, #0
	strh r0, [r5]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807D758: .4byte gLCDControlBuffer
_0807D75C: .4byte 0x06002C00

	THUMB_FUNC_END sub_807D6D8

	THUMB_FUNC_START sub_807D760
sub_807D760: @ 0x0807D760
	push {r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r6, r0, #0
	ldr r7, _0807D7C8  @ gBG2TilemapBuffer
	ldr r0, [r6, #0x30]
	cmp r0, #0
	bge _0807D770
	adds r0, #7
_0807D770:
	asrs r0, r0, #3
	subs r1, r0, #3
	ldr r2, [r6, #0x34]
	cmp r2, #0
	bge _0807D77C
	adds r2, #7
_0807D77C:
	asrs r2, r2, #3
	subs r2, #3
	ldr r3, _0807D7CC  @ 0x00004160
	movs r0, #6
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _0807D7D0  @ gUnknown_089AF310
	str r0, [sp, #8]
	ldr r5, _0807D7D4  @ gUnknown_089A3B6C
	adds r4, r6, #0
	adds r4, #0x40
	ldrh r0, [r4]
	lsrs r0, r0, #1
	adds r0, r0, r5
	ldrb r0, [r0]
	str r0, [sp, #0xc]
	adds r0, r7, #0
	bl sub_80146A0
	movs r0, #4
	bl BG_EnableSyncByMask
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
	ldrh r0, [r4]
	lsrs r0, r0, #1
	adds r0, r0, r5
	ldrb r0, [r0]
	cmp r0, #0xff
	bne _0807D7C0
	adds r0, r6, #0
	bl Proc_Break
_0807D7C0:
	add sp, #0x10
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807D7C8: .4byte gBG2TilemapBuffer
_0807D7CC: .4byte 0x00004160
_0807D7D0: .4byte gUnknown_089AF310
_0807D7D4: .4byte gUnknown_089A3B6C

	THUMB_FUNC_END sub_807D760

	THUMB_FUNC_START sub_807D7D8
sub_807D7D8: @ 0x0807D7D8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0807D810  @ gUnknown_089A3B84
	movs r1, #3
	bl Proc_Start
	movs r2, #0x10
	ldrsb r2, [r4, r2]
	ldr r3, _0807D814  @ gUnknown_0202BCB0
	ldrh r1, [r3, #0xc]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x14
	subs r2, r2, r1
	lsls r2, r2, #4
	adds r2, #8
	str r2, [r0, #0x30]
	movs r2, #0x11
	ldrsb r2, [r4, r2]
	ldrh r1, [r3, #0xe]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x14
	subs r2, r2, r1
	lsls r2, r2, #4
	adds r2, #8
	str r2, [r0, #0x34]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807D810: .4byte gUnknown_089A3B84
_0807D814: .4byte gUnknown_0202BCB0

	THUMB_FUNC_END sub_807D7D8

	THUMB_FUNC_START sub_807D818
sub_807D818: @ 0x0807D818
	push {lr}
	ldr r2, _0807D828  @ 0x0000010F
	ldr r1, [r0, #0x30]
	adds r0, r2, #0
	bl PlaySpacialSoundMaybe
	pop {r0}
	bx r0
	.align 2, 0
_0807D828: .4byte 0x0000010F

	THUMB_FUNC_END sub_807D818

	THUMB_FUNC_START NewMapAnimEffectAnimator
NewMapAnimEffectAnimator: @ 0x0807D82C
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r5, r0, #0
	adds r6, r1, #0
	mov r8, r2
	lsls r4, r3, #0x10
	lsrs r4, r4, #0x10
	ldr r0, _0807D85C  @ gUnknown_089A3BA4
	movs r1, #3
	bl Proc_Start
	str r5, [r0, #0x2c]
	str r6, [r0, #0x50]
	mov r1, r8
	str r1, [r0, #0x54]
	adds r0, #0x58
	strh r4, [r0]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807D85C: .4byte gUnknown_089A3BA4

	THUMB_FUNC_END NewMapAnimEffectAnimator

	THUMB_FUNC_START sub_807D860
sub_807D860: @ 0x0807D860
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r6, r0, #0
	ldr r2, _0807D930  @ gLCDControlBuffer
	ldrb r3, [r2, #0xc]
	movs r1, #4
	negs r1, r1
	adds r0, r1, #0
	ands r0, r3
	strb r0, [r2, #0xc]
	ldrb r3, [r2, #0x10]
	adds r0, r1, #0
	ands r0, r3
	movs r4, #1
	orrs r0, r4
	strb r0, [r2, #0x10]
	ldrb r3, [r2, #0x14]
	adds r0, r1, #0
	ands r0, r3
	orrs r0, r4
	strb r0, [r2, #0x14]
	ldrb r0, [r2, #0x18]
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	strb r1, [r2, #0x18]
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	ldr r4, [r6, #0x50]
	movs r0, #2
	bl GetBackgroundTileDataOffset
	adds r1, r0, #0
	ldr r0, _0807D934  @ 0x06002C00
	adds r1, r1, r0
	adds r0, r4, #0
	bl CopyDataWithPossibleUncomp
	ldr r0, _0807D938  @ gBG2TilemapBuffer
	ldr r3, [r6, #0x2c]
	movs r1, #0x10
	ldrsb r1, [r3, r1]
	ldr r5, _0807D93C  @ gUnknown_0202BCB0
	ldrh r2, [r5, #0xc]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x14
	subs r1, r1, r2
	lsls r1, r1, #1
	subs r1, #2
	movs r2, #0x11
	ldrsb r2, [r3, r2]
	ldrh r3, [r5, #0xe]
	lsls r3, r3, #0x10
	asrs r3, r3, #0x14
	subs r2, r2, r3
	lsls r2, r2, #1
	subs r2, #2
	ldr r3, _0807D940  @ 0x00004160
	movs r4, #6
	str r4, [sp]
	str r4, [sp, #4]
	bl sub_8014560
	movs r0, #4
	bl BG_EnableSyncByMask
	ldr r0, [r6, #0x54]
	str r6, [sp]
	movs r1, #0x80
	movs r2, #0x20
	movs r3, #4
	bl NewPaletteAnimator_
	adds r1, r6, #0
	adds r1, #0x40
	movs r0, #0
	strh r0, [r1]
	adds r1, #2
	movs r0, #0x10
	strh r0, [r1]
	adds r0, r6, #0
	adds r0, #0x58
	ldrh r0, [r0]
	ldr r1, [r6, #0x2c]
	ldrb r1, [r1, #0x10]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	ldrh r2, [r5, #0xc]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x14
	subs r1, r1, r2
	lsls r1, r1, #1
	adds r1, #1
	lsls r1, r1, #3
	bl PlaySpacialSoundMaybe
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807D930: .4byte gLCDControlBuffer
_0807D934: .4byte 0x06002C00
_0807D938: .4byte gBG2TilemapBuffer
_0807D93C: .4byte gUnknown_0202BCB0
_0807D940: .4byte 0x00004160

	THUMB_FUNC_END sub_807D860

	THUMB_FUNC_START sub_807D944
sub_807D944: @ 0x0807D944
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r4, #0
	adds r5, #0x40
	ldrh r0, [r5]
	adds r0, #1
	strh r0, [r5]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x10
	bne _0807D962
	adds r0, r4, #0
	bl Proc_Break
_0807D962:
	ldrh r1, [r5]
	movs r0, #0x16
	subs r0, r0, r1
	adds r2, r4, #0
	adds r2, #0x42
	strh r0, [r2]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x10
	bls _0807D97A
	movs r0, #0x10
	strh r0, [r2]
_0807D97A:
	ldrb r1, [r5]
	ldrb r2, [r2]
	movs r0, #1
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	movs r0, #0
	str r0, [sp]
	movs r1, #0
	movs r2, #1
	movs r3, #0
	bl sub_8001ED0
	movs r0, #0
	bl sub_8001F48
	movs r0, #1
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #1
	bl sub_8001F0C
	movs r0, #1
	bl sub_8001F64
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_807D944

	THUMB_FUNC_START sub_807D9B8
sub_807D9B8: @ 0x0807D9B8
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r4, #0
	adds r5, #0x40
	ldrh r0, [r5]
	subs r0, #1
	strh r0, [r5]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _0807D9D4
	adds r0, r4, #0
	bl Proc_Break
_0807D9D4:
	ldrh r1, [r5]
	movs r0, #0x16
	subs r0, r0, r1
	adds r2, r4, #0
	adds r2, #0x42
	strh r0, [r2]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x10
	bls _0807D9EC
	movs r0, #0x10
	strh r0, [r2]
_0807D9EC:
	ldrb r1, [r5]
	ldrb r2, [r2]
	movs r0, #1
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	movs r0, #0
	str r0, [sp]
	movs r1, #0
	movs r2, #1
	movs r3, #0
	bl sub_8001ED0
	movs r0, #0
	bl sub_8001F48
	movs r0, #1
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #1
	bl sub_8001F0C
	movs r0, #1
	bl sub_8001F64
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_807D9B8

	THUMB_FUNC_START sub_807DA2C
sub_807DA2C: @ 0x0807DA2C
	push {lr}
	bl DeleteAllPaletteAnimator
	ldr r0, _0807DA60  @ gBG2TilemapBuffer
	movs r1, #0
	bl BG_Fill
	movs r0, #4
	bl BG_EnableSyncByMask
	bl SetDefaultColorEffects
	ldr r2, _0807DA64  @ gLCDControlBuffer
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
	pop {r0}
	bx r0
	.align 2, 0
_0807DA60: .4byte gBG2TilemapBuffer
_0807DA64: .4byte gLCDControlBuffer

	THUMB_FUNC_END sub_807DA2C

	THUMB_FUNC_START sub_807DA68
sub_807DA68: @ 0x0807DA68
	push {lr}
	movs r0, #0
	bl SetPrimaryHBlankHandler
	bl DeleteAllPaletteAnimator
	ldr r0, _0807DAA0  @ gBG2TilemapBuffer
	movs r1, #0
	bl BG_Fill
	movs r0, #4
	bl BG_EnableSyncByMask
	bl SetDefaultColorEffects
	ldr r2, _0807DAA4  @ gLCDControlBuffer
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
	pop {r0}
	bx r0
	.align 2, 0
_0807DAA0: .4byte gBG2TilemapBuffer
_0807DAA4: .4byte gLCDControlBuffer

	THUMB_FUNC_END sub_807DA68

	THUMB_FUNC_START New6C_SomethingFlashy
New6C_SomethingFlashy: @ 0x0807DAA8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0807DAE0  @ gUnknown_089A3BDC
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x2c]
	movs r2, #0x10
	ldrsb r2, [r4, r2]
	ldr r3, _0807DAE4  @ gUnknown_0202BCB0
	ldrh r1, [r3, #0xc]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x14
	subs r2, r2, r1
	lsls r2, r2, #1
	str r2, [r0, #0x30]
	movs r2, #0x11
	ldrsb r2, [r4, r2]
	ldrh r1, [r3, #0xe]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x14
	subs r2, r2, r1
	lsls r2, r2, #1
	str r2, [r0, #0x34]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807DAE0: .4byte gUnknown_089A3BDC
_0807DAE4: .4byte gUnknown_0202BCB0

	THUMB_FUNC_END New6C_SomethingFlashy

	THUMB_FUNC_START sub_807DAE8
sub_807DAE8: @ 0x0807DAE8
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	ldr r4, _0807DB24  @ gUnknown_089AE224
	movs r0, #2
	bl GetBackgroundTileDataOffset
	adds r1, r0, #0
	ldr r0, _0807DB28  @ 0x06002C00
	adds r1, r1, r0
	adds r0, r4, #0
	bl CopyDataWithPossibleUncomp
	ldr r0, _0807DB2C  @ gUnknown_089AE484
	movs r1, #0x80
	movs r2, #0x20
	bl CopyToPaletteBuffer
	bl LoadSparkGfx
	adds r5, #0x40
	movs r0, #0
	strh r0, [r5]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807DB24: .4byte gUnknown_089AE224
_0807DB28: .4byte 0x06002C00
_0807DB2C: .4byte gUnknown_089AE484

	THUMB_FUNC_END sub_807DAE8

	THUMB_FUNC_START sub_807DB30
sub_807DB30: @ 0x0807DB30
	push {r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r7, r0, #0
	ldr r0, _0807DB98  @ gBG2TilemapBuffer
	ldr r1, [r7, #0x30]
	subs r1, #1
	ldr r2, [r7, #0x34]
	subs r2, #3
	ldr r3, _0807DB9C  @ 0x00004160
	movs r4, #4
	str r4, [sp]
	movs r4, #6
	str r4, [sp, #4]
	ldr r4, _0807DBA0  @ gUnknown_089AE4A4
	str r4, [sp, #8]
	ldr r6, _0807DBA4  @ gUnknown_089A3C0C
	adds r5, r7, #0
	adds r5, #0x40
	ldrh r4, [r5]
	lsrs r4, r4, #1
	adds r4, r4, r6
	ldrb r4, [r4]
	str r4, [sp, #0xc]
	bl sub_80146A0
	movs r0, #4
	bl BG_EnableSyncByMask
	ldrh r0, [r5]
	adds r0, #1
	strh r0, [r5]
	ldrh r0, [r5]
	lsrs r0, r0, #1
	adds r0, r0, r6
	ldrb r0, [r0]
	cmp r0, #0xff
	bne _0807DB80
	adds r0, r7, #0
	bl Proc_Break
_0807DB80:
	bl sub_807E978
	movs r0, #1
	movs r1, #0xc
	movs r2, #0xc
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	add sp, #0x10
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807DB98: .4byte gBG2TilemapBuffer
_0807DB9C: .4byte 0x00004160
_0807DBA0: .4byte gUnknown_089AE4A4
_0807DBA4: .4byte gUnknown_089A3C0C

	THUMB_FUNC_END sub_807DB30

	THUMB_FUNC_START sub_807DBA8
sub_807DBA8: @ 0x0807DBA8
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, _0807DBD8  @ gUnknown_089A3C24
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x2c]
	ldr r4, _0807DBDC  @ gActionData
	ldrb r1, [r4, #0x13]
	lsls r1, r1, #4
	ldr r3, _0807DBE0  @ gUnknown_0202BCB0
	movs r5, #0xc
	ldrsh r2, [r3, r5]
	subs r1, r1, r2
	str r1, [r0, #0x30]
	ldrb r1, [r4, #0x14]
	lsls r1, r1, #4
	movs r4, #0xe
	ldrsh r2, [r3, r4]
	subs r1, r1, r2
	str r1, [r0, #0x34]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807DBD8: .4byte gUnknown_089A3C24
_0807DBDC: .4byte gActionData
_0807DBE0: .4byte gUnknown_0202BCB0

	THUMB_FUNC_END sub_807DBA8

	THUMB_FUNC_START sub_807DBE4
sub_807DBE4: @ 0x0807DBE4
	push {r4, r5, lr}
	sub sp, #8
	adds r5, r0, #0
	ldr r0, _0807DC80  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0807DBFC
	movs r0, #0xb3
	bl m4aSongNumStart
_0807DBFC:
	ldr r0, _0807DC84  @ gUnknown_089B03D4
	ldr r1, _0807DC88  @ 0x06013800
	bl CopyDataWithPossibleUncomp
	ldr r0, _0807DC8C  @ gUnknown_089B068C
	movs r1, #0xa0
	lsls r1, r1, #2
	movs r2, #0x20
	bl CopyToPaletteBuffer
	movs r0, #4
	bl sub_8013AA4
	movs r0, #2
	bl GetBackgroundTileDataOffset
	ldr r1, _0807DC90  @ 0x06002C00
	adds r0, r0, r1
	ldr r2, _0807DC94  @ 0x0000FFFF
	movs r1, #0x10
	bl sub_8014930
	ldr r0, _0807DC98  @ gBG2TilemapBuffer
	movs r1, #0x80
	lsls r1, r1, #3
	ldr r2, _0807DC9C  @ 0x00004160
	bl sub_8014930
	movs r0, #4
	bl BG_EnableSyncByMask
	adds r0, r5, #0
	adds r0, #0x40
	movs r1, #0
	strh r1, [r0]
	adds r0, #2
	strh r1, [r0]
	ldr r0, [r5, #0x30]
	adds r4, r0, #4
	cmp r4, #0
	blt _0807DC60
	ldr r0, _0807DCA0  @ gUnknown_089A61F8
	ldr r2, [r5, #0x34]
	ldr r3, _0807DCA4  @ 0x000041C0
	str r1, [sp]
	movs r1, #2
	str r1, [sp, #4]
	adds r1, r4, #0
	bl APProc_Create
_0807DC60:
	bl sub_8081E78
	bl sub_8081EAC
	bl sub_807E978
	movs r0, #1
	movs r1, #0
	movs r2, #0x10
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807DC80: .4byte gRAMChapterData
_0807DC84: .4byte gUnknown_089B03D4
_0807DC88: .4byte 0x06013800
_0807DC8C: .4byte gUnknown_089B068C
_0807DC90: .4byte 0x06002C00
_0807DC94: .4byte 0x0000FFFF
_0807DC98: .4byte gBG2TilemapBuffer
_0807DC9C: .4byte 0x00004160
_0807DCA0: .4byte gUnknown_089A61F8
_0807DCA4: .4byte 0x000041C0

	THUMB_FUNC_END sub_807DBE4

	THUMB_FUNC_START sub_807DCA8
sub_807DCA8: @ 0x0807DCA8
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	adds r4, r5, #0
	adds r4, #0x40
	ldrh r3, [r4]
	movs r0, #0x50
	str r0, [sp]
	movs r0, #5
	movs r1, #1
	movs r2, #0xa0
	bl sub_8012DCC
	adds r2, r0, #0
	ldr r0, [r5, #0x30]
	adds r0, #8
	ldr r1, [r5, #0x34]
	adds r1, #8
	bl sub_8081F24
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
	ldrh r0, [r4]
	lsls r0, r0, #4
	movs r1, #0x28
	bl __divsi3
	cmp r0, #0xf
	ble _0807DCE6
	movs r0, #0x10
_0807DCE6:
	lsls r1, r0, #0x18
	lsrs r1, r1, #0x18
	movs r0, #1
	movs r2, #0x10
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	ldrh r0, [r4]
	cmp r0, #0x27
	bls _0807DD04
	adds r0, r5, #0
	bl Proc_Break
	bl APProc_DeleteAll
_0807DD04:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_807DCA8

	THUMB_FUNC_START sub_807DD0C
sub_807DD0C: @ 0x0807DD0C
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	adds r4, r5, #0
	adds r4, #0x40
	ldrh r3, [r4]
	movs r0, #0x50
	str r0, [sp]
	movs r0, #5
	movs r1, #1
	movs r2, #0xa0
	bl sub_8012DCC
	adds r2, r0, #0
	ldr r0, [r5, #0x30]
	adds r0, #8
	ldr r1, [r5, #0x34]
	adds r1, #8
	bl sub_8081F24
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
	ldrh r0, [r4]
	subs r0, #0x28
	lsls r0, r0, #4
	movs r1, #0x1e
	bl __divsi3
	movs r1, #0x10
	subs r1, r1, r0
	cmp r1, #0
	bgt _0807DD50
	movs r1, #0
_0807DD50:
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	movs r0, #1
	movs r2, #0x10
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	ldrh r0, [r4]
	cmp r0, #0x45
	bls _0807DD6A
	adds r0, r5, #0
	bl Proc_Break
_0807DD6A:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_807DD0C

	THUMB_FUNC_START sub_807DD74
sub_807DD74: @ 0x0807DD74
	push {lr}
	bl sub_8081F58
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_807DD74

	THUMB_FUNC_START sub_807DD80
sub_807DD80: @ 0x0807DD80
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0807DDC0  @ gUnknown_089A3C6C
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x2c]
	movs r2, #0x10
	ldrsb r2, [r4, r2]
	ldr r3, _0807DDC4  @ gUnknown_0202BCB0
	ldrh r1, [r3, #0xc]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x14
	subs r2, r2, r1
	lsls r2, r2, #1
	adds r2, #1
	lsls r2, r2, #3
	str r2, [r0, #0x30]
	movs r2, #0x11
	ldrsb r2, [r4, r2]
	ldrh r1, [r3, #0xe]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x14
	subs r2, r2, r1
	lsls r2, r2, #1
	adds r2, #1
	lsls r2, r2, #3
	str r2, [r0, #0x34]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807DDC0: .4byte gUnknown_089A3C6C
_0807DDC4: .4byte gUnknown_0202BCB0

	THUMB_FUNC_END sub_807DD80

	THUMB_FUNC_START sub_807DDC8
sub_807DDC8: @ 0x0807DDC8
	push {r4, r5, lr}
	sub sp, #8
	adds r5, r0, #0
	ldr r1, [r5, #0x30]
	movs r0, #0x87
	bl PlaySpacialSoundMaybe
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	bl sub_807E978
	ldr r0, _0807DE1C  @ gUnknown_089B1E10
	ldr r1, _0807DE20  @ 0x06013800
	bl CopyDataWithPossibleUncomp
	ldr r0, _0807DE24  @ gUnknown_089B20E8
	movs r1, #0xa0
	lsls r1, r1, #2
	movs r2, #0x20
	bl CopyToPaletteBuffer
	ldr r0, _0807DE28  @ gUnknown_089B2108
	ldr r1, [r5, #0x30]
	ldr r2, [r5, #0x34]
	ldr r3, _0807DE2C  @ 0x000041C0
	movs r4, #0
	str r4, [sp]
	movs r4, #2
	str r4, [sp, #4]
	bl APProc_Create
	adds r5, #0x48
	movs r0, #1
	strh r0, [r5]
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807DE1C: .4byte gUnknown_089B1E10
_0807DE20: .4byte 0x06013800
_0807DE24: .4byte gUnknown_089B20E8
_0807DE28: .4byte gUnknown_089B2108
_0807DE2C: .4byte 0x000041C0

	THUMB_FUNC_END sub_807DDC8

	THUMB_FUNC_START sub_807DE30
sub_807DE30: @ 0x0807DE30
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0807DE68  @ gUnknown_089A3C94
	movs r1, #3
	bl Proc_Start
	movs r2, #0x10
	ldrsb r2, [r4, r2]
	ldr r3, _0807DE6C  @ gUnknown_0202BCB0
	ldrh r1, [r3, #0xc]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x14
	subs r2, r2, r1
	lsls r2, r2, #4
	adds r2, #8
	str r2, [r0, #0x30]
	movs r2, #0x11
	ldrsb r2, [r4, r2]
	ldrh r1, [r3, #0xe]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x14
	subs r2, r2, r1
	lsls r2, r2, #4
	adds r2, #8
	str r2, [r0, #0x34]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807DE68: .4byte gUnknown_089A3C94
_0807DE6C: .4byte gUnknown_0202BCB0

	THUMB_FUNC_END sub_807DE30

	THUMB_FUNC_START sub_807DE70
sub_807DE70: @ 0x0807DE70
	push {lr}
	ldr r1, [r0, #0x30]
	movs r0, #0x86
	bl PlaySpacialSoundMaybe
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_807DE70

	THUMB_FUNC_START sub_807DE80
sub_807DE80: @ 0x0807DE80
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	bl sub_807E978
	movs r0, #1
	movs r1, #0x10
	movs r2, #0x10
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	ldr r4, _0807DED0  @ gUnknown_089B0AD0
	movs r0, #2
	bl GetBackgroundTileDataOffset
	adds r1, r0, #0
	ldr r0, _0807DED4  @ 0x06002C00
	adds r1, r1, r0
	adds r0, r4, #0
	bl CopyDataWithPossibleUncomp
	ldr r0, _0807DED8  @ gUnknown_086810B8
	movs r1, #0x80
	movs r2, #0x20
	bl CopyToPaletteBuffer
	adds r0, r5, #0
	adds r0, #0x48
	movs r1, #0
	strh r1, [r0]
	adds r5, #0x4a
	strh r1, [r5]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807DED0: .4byte gUnknown_089B0AD0
_0807DED4: .4byte 0x06002C00
_0807DED8: .4byte gUnknown_086810B8

	THUMB_FUNC_END sub_807DE80

	THUMB_FUNC_START sub_807DEDC
sub_807DEDC: @ 0x0807DEDC
	push {r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r6, r0, #0
	ldr r0, _0807DF4C  @ gBG2TilemapBuffer
	mov ip, r0
	ldr r0, [r6, #0x30]
	cmp r0, #0
	bge _0807DEEE
	adds r0, #7
_0807DEEE:
	asrs r0, r0, #3
	subs r7, r0, #2
	ldr r2, [r6, #0x34]
	cmp r2, #0
	bge _0807DEFA
	adds r2, #7
_0807DEFA:
	asrs r2, r2, #3
	subs r2, #9
	ldr r3, _0807DF50  @ 0x00004160
	movs r0, #4
	str r0, [sp]
	movs r0, #0xb
	str r0, [sp, #4]
	ldr r0, _0807DF54  @ gUnknown_089B17A4
	str r0, [sp, #8]
	ldr r5, _0807DF58  @ gUnknown_08205824
	adds r4, r6, #0
	adds r4, #0x48
	ldrh r0, [r4]
	adds r1, r0, #1
	strh r1, [r4]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	adds r0, r0, r5
	ldrb r0, [r0]
	str r0, [sp, #0xc]
	mov r0, ip
	adds r1, r7, #0
	bl sub_801474C
	movs r0, #4
	bl BG_EnableSyncByMask
	movs r1, #0
	ldrsh r0, [r4, r1]
	adds r0, r0, r5
	ldrb r0, [r0]
	cmp r0, #0xff
	bne _0807DF42
	adds r0, r6, #0
	bl Proc_Break
_0807DF42:
	add sp, #0x10
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807DF4C: .4byte gBG2TilemapBuffer
_0807DF50: .4byte 0x00004160
_0807DF54: .4byte gUnknown_089B17A4
_0807DF58: .4byte gUnknown_08205824

	THUMB_FUNC_END sub_807DEDC

	THUMB_FUNC_START sub_807DF5C
sub_807DF5C: @ 0x0807DF5C
	push {r4, r5, lr}
	sub sp, #0x14
	adds r5, r0, #0
	ldr r1, _0807DFA8  @ gUnknown_08205833
	mov r0, sp
	movs r2, #0x13
	bl memcpy
	adds r4, r5, #0
	adds r4, #0x4a
	ldrh r0, [r4]
	adds r1, r0, #1
	strh r1, [r4]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add r0, sp
	ldrb r1, [r0]
	movs r0, #1
	movs r2, #0x10
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	movs r1, #0
	ldrsh r0, [r4, r1]
	add r0, sp
	ldrb r0, [r0]
	cmp r0, #0xff
	bne _0807DF9E
	movs r0, #0
	strh r0, [r4]
	adds r0, r5, #0
	bl Proc_Break
_0807DF9E:
	add sp, #0x14
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807DFA8: .4byte gUnknown_08205833

	THUMB_FUNC_END sub_807DF5C

	THUMB_FUNC_START sub_807DFAC
sub_807DFAC: @ 0x0807DFAC
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	adds r4, r5, #0
	adds r4, #0x4a
	ldrh r3, [r4]
	adds r0, r3, #1
	strh r0, [r4]
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	movs r0, #0x1e
	str r0, [sp]
	movs r0, #0
	movs r1, #0x10
	movs r2, #0
	bl sub_8012DCC
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	movs r0, #1
	movs r2, #0x10
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	movs r1, #0
	ldrsh r0, [r4, r1]
	cmp r0, #0x1e
	ble _0807DFEC
	adds r0, r5, #0
	bl Proc_Break
_0807DFEC:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_807DFAC

	THUMB_FUNC_START sub_807DFF4
sub_807DFF4: @ 0x0807DFF4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0807E030  @ gUnknown_089A3CD4
	movs r1, #3
	bl Proc_Start
	movs r2, #0x10
	ldrsb r2, [r4, r2]
	ldr r3, _0807E034  @ gUnknown_0202BCB0
	ldrh r1, [r3, #0xc]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x14
	subs r2, r2, r1
	lsls r2, r2, #1
	adds r2, #1
	lsls r2, r2, #3
	str r2, [r0, #0x30]
	movs r2, #0x11
	ldrsb r2, [r4, r2]
	ldrh r1, [r3, #0xe]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x14
	subs r2, r2, r1
	lsls r2, r2, #1
	adds r2, #1
	lsls r2, r2, #3
	str r2, [r0, #0x34]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807E030: .4byte gUnknown_089A3CD4
_0807E034: .4byte gUnknown_0202BCB0

	THUMB_FUNC_END sub_807DFF4

	THUMB_FUNC_START sub_807E038
sub_807E038: @ 0x0807E038
	push {lr}
	ldr r1, [r0, #0x30]
	movs r0, #0x82
	bl PlaySpacialSoundMaybe
	ldr r0, _0807E050  @ gUnknown_0867B5A4
	movs r1, #0x80
	movs r2, #0x20
	bl CopyToPaletteBuffer
	pop {r0}
	bx r0
	.align 2, 0
_0807E050: .4byte gUnknown_0867B5A4

	THUMB_FUNC_END sub_807E038

	THUMB_FUNC_START sub_807E054
sub_807E054: @ 0x0807E054
	push {r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r6, r0, #0
	ldr r0, _0807E0C4  @ gBG2TilemapBuffer
	mov ip, r0
	ldr r0, [r6, #0x30]
	cmp r0, #0
	bge _0807E066
	adds r0, #7
_0807E066:
	asrs r0, r0, #3
	subs r7, r0, #2
	ldr r2, [r6, #0x34]
	cmp r2, #0
	bge _0807E072
	adds r2, #7
_0807E072:
	asrs r2, r2, #3
	subs r2, #9
	ldr r3, _0807E0C8  @ 0x00004160
	movs r0, #4
	str r0, [sp]
	movs r0, #0xb
	str r0, [sp, #4]
	ldr r0, _0807E0CC  @ gUnknown_089B0864
	str r0, [sp, #8]
	ldr r5, _0807E0D0  @ gUnknown_08205846
	adds r4, r6, #0
	adds r4, #0x48
	ldrh r0, [r4]
	adds r1, r0, #1
	strh r1, [r4]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	adds r0, r0, r5
	ldrb r0, [r0]
	str r0, [sp, #0xc]
	mov r0, ip
	adds r1, r7, #0
	bl sub_801474C
	movs r0, #4
	bl BG_EnableSyncByMask
	movs r1, #0
	ldrsh r0, [r4, r1]
	adds r0, r0, r5
	ldrb r0, [r0]
	cmp r0, #0xff
	bne _0807E0BA
	adds r0, r6, #0
	bl Proc_Break
_0807E0BA:
	add sp, #0x10
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807E0C4: .4byte gBG2TilemapBuffer
_0807E0C8: .4byte 0x00004160
_0807E0CC: .4byte gUnknown_089B0864
_0807E0D0: .4byte gUnknown_08205846

	THUMB_FUNC_END sub_807E054

	THUMB_FUNC_START sub_807E0D4
sub_807E0D4: @ 0x0807E0D4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0807E110  @ gUnknown_089A3D14
	movs r1, #3
	bl Proc_Start
	movs r2, #0x10
	ldrsb r2, [r4, r2]
	ldr r3, _0807E114  @ gUnknown_0202BCB0
	ldrh r1, [r3, #0xc]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x14
	subs r2, r2, r1
	lsls r2, r2, #1
	adds r2, #1
	lsls r2, r2, #3
	str r2, [r0, #0x30]
	movs r2, #0x11
	ldrsb r2, [r4, r2]
	ldrh r1, [r3, #0xe]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x14
	subs r2, r2, r1
	lsls r2, r2, #1
	adds r2, #1
	lsls r2, r2, #3
	str r2, [r0, #0x34]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807E110: .4byte gUnknown_089A3D14
_0807E114: .4byte gUnknown_0202BCB0

	THUMB_FUNC_END sub_807E0D4

	THUMB_FUNC_START sub_807E118
sub_807E118: @ 0x0807E118
	push {r4, lr}
	sub sp, #8
	adds r4, r0, #0
	ldr r1, [r4, #0x30]
	movs r0, #0x85
	bl PlaySpacialSoundMaybe
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	bl sub_807E978
	ldr r0, _0807E168  @ gUnknown_08686F84
	ldr r1, _0807E16C  @ 0x06013800
	bl CopyDataWithPossibleUncomp
	ldr r0, _0807E170  @ gUnknown_0868716C
	movs r1, #0xa0
	lsls r1, r1, #2
	movs r2, #0x20
	bl CopyToPaletteBuffer
	ldr r0, _0807E174  @ gUnknown_089B1A10
	ldr r1, [r4, #0x30]
	ldr r2, [r4, #0x34]
	subs r2, #0x10
	ldr r3, _0807E178  @ 0x000041C0
	movs r4, #0
	str r4, [sp]
	movs r4, #2
	str r4, [sp, #4]
	bl APProc_Create
	add sp, #8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807E168: .4byte gUnknown_08686F84
_0807E16C: .4byte 0x06013800
_0807E170: .4byte gUnknown_0868716C
_0807E174: .4byte gUnknown_089B1A10
_0807E178: .4byte 0x000041C0

	THUMB_FUNC_END sub_807E118

	THUMB_FUNC_START sub_807E17C
sub_807E17C: @ 0x0807E17C
	push {r4, lr}
	sub sp, #8
	adds r4, r0, #0
	ldr r1, [r4, #0x30]
	movs r0, #0x85
	bl PlaySpacialSoundMaybe
	ldr r0, _0807E1A8  @ gUnknown_089B1A10
	ldr r1, [r4, #0x30]
	ldr r2, [r4, #0x34]
	subs r2, #8
	ldr r3, _0807E1AC  @ 0x000041C0
	movs r4, #0
	str r4, [sp]
	movs r4, #2
	str r4, [sp, #4]
	bl APProc_Create
	add sp, #8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807E1A8: .4byte gUnknown_089B1A10
_0807E1AC: .4byte 0x000041C0

	THUMB_FUNC_END sub_807E17C

	THUMB_FUNC_START sub_807E1B0
sub_807E1B0: @ 0x0807E1B0
	push {r4, lr}
	sub sp, #8
	adds r4, r0, #0
	ldr r1, [r4, #0x30]
	movs r0, #0x85
	bl PlaySpacialSoundMaybe
	ldr r0, _0807E1DC  @ gUnknown_089B1A10
	ldr r1, [r4, #0x30]
	ldr r2, [r4, #0x34]
	ldr r3, _0807E1E0  @ 0x000041C0
	movs r4, #0
	str r4, [sp]
	movs r4, #2
	str r4, [sp, #4]
	bl APProc_Create
	add sp, #8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807E1DC: .4byte gUnknown_089B1A10
_0807E1E0: .4byte 0x000041C0

	THUMB_FUNC_END sub_807E1B0

	THUMB_FUNC_START sub_807E1E4
sub_807E1E4: @ 0x0807E1E4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0807E224  @ gUnknown_089A3D54
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x2c]
	movs r2, #0x10
	ldrsb r2, [r4, r2]
	ldr r3, _0807E228  @ gUnknown_0202BCB0
	ldrh r1, [r3, #0xc]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x14
	subs r2, r2, r1
	lsls r2, r2, #1
	adds r2, #1
	lsls r2, r2, #3
	str r2, [r0, #0x30]
	movs r2, #0x11
	ldrsb r2, [r4, r2]
	ldrh r1, [r3, #0xe]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x14
	subs r2, r2, r1
	lsls r2, r2, #1
	adds r2, #1
	lsls r2, r2, #3
	str r2, [r0, #0x34]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807E224: .4byte gUnknown_089A3D54
_0807E228: .4byte gUnknown_0202BCB0

	THUMB_FUNC_END sub_807E1E4

	THUMB_FUNC_START sub_807E22C
sub_807E22C: @ 0x0807E22C
	push {r4, r5, lr}
	adds r5, r0, #0
	bl sub_807E978
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	ldr r4, _0807E280  @ gUnknown_089B6AA0
	movs r0, #2
	bl GetBackgroundTileDataOffset
	adds r1, r0, #0
	ldr r0, _0807E284  @ 0x06002C00
	adds r1, r1, r0
	adds r0, r4, #0
	bl CopyDataWithPossibleUncomp
	ldr r0, _0807E288  @ gUnknown_089B73D4
	movs r1, #0x80
	movs r2, #0x20
	bl CopyToPaletteBuffer
	movs r0, #1
	movs r1, #0x10
	movs r2, #0x10
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	adds r0, r5, #0
	adds r0, #0x40
	movs r1, #0
	strh r1, [r0]
	adds r5, #0x42
	strh r1, [r5]
	bl EnablePaletteSync
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807E280: .4byte gUnknown_089B6AA0
_0807E284: .4byte 0x06002C00
_0807E288: .4byte gUnknown_089B73D4

	THUMB_FUNC_END sub_807E22C

	THUMB_FUNC_START sub_807E28C
sub_807E28C: @ 0x0807E28C
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r0, #0x42
	ldrh r0, [r0]
	cmp r0, #0
	bne _0807E312
	adds r0, r4, #0
	adds r0, #0x40
	ldrh r1, [r0]
	adds r5, r0, #0
	cmp r1, #0
	bne _0807E2B4
	ldr r0, _0807E2B0  @ 0x000003BA
	ldr r1, [r4, #0x30]
	bl PlaySpacialSoundMaybe
	b _0807E2BE
	.align 2, 0
_0807E2B0: .4byte 0x000003BA
_0807E2B4:
	cmp r1, #9
	bls _0807E2BE
	adds r0, r4, #0
	bl Proc_Break
_0807E2BE:
	ldr r0, _0807E324  @ gUnknown_089A3D8C
	ldrh r1, [r5]
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r0, [r1]
	ldr r6, _0807E328  @ gUnknown_02020188
	adds r1, r6, #0
	bl CopyDataWithPossibleUncomp
	ldr r1, _0807E32C  @ gBG2TilemapBuffer
	ldr r0, [r4, #0x30]
	cmp r0, #0
	bge _0807E2DA
	adds r0, #7
_0807E2DA:
	asrs r0, r0, #3
	subs r0, #4
	lsls r0, r0, #0x10
	asrs r2, r0, #0x10
	ldr r3, [r4, #0x34]
	cmp r3, #0
	bge _0807E2EA
	adds r3, #7
_0807E2EA:
	asrs r3, r3, #3
	subs r3, #4
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	ldr r0, _0807E330  @ 0x00004160
	str r0, [sp]
	adds r0, r1, #0
	adds r1, r6, #0
	bl sub_800159C
	movs r0, #4
	bl BG_EnableSyncByMask
	ldrh r0, [r5]
	adds r0, #1
	strh r0, [r5]
	adds r1, r4, #0
	adds r1, #0x42
	movs r0, #4
	strh r0, [r1]
_0807E312:
	adds r1, r4, #0
	adds r1, #0x42
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807E324: .4byte gUnknown_089A3D8C
_0807E328: .4byte gUnknown_02020188
_0807E32C: .4byte gBG2TilemapBuffer
_0807E330: .4byte 0x00004160

	THUMB_FUNC_END sub_807E28C

	THUMB_FUNC_START sub_807E334
sub_807E334: @ 0x0807E334
	push {lr}
	ldr r0, _0807E348  @ gBG2TilemapBuffer
	movs r1, #0
	bl BG_Fill
	movs r0, #4
	bl BG_EnableSyncByMask
	pop {r0}
	bx r0
	.align 2, 0
_0807E348: .4byte gBG2TilemapBuffer

	THUMB_FUNC_END sub_807E334

	THUMB_FUNC_START sub_807E34C
sub_807E34C: @ 0x0807E34C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0807E388  @ gUnknown_089A3DB4
	movs r1, #3
	bl Proc_Start
	movs r2, #0x10
	ldrsb r2, [r4, r2]
	ldr r3, _0807E38C  @ gUnknown_0202BCB0
	ldrh r1, [r3, #0xc]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x14
	subs r2, r2, r1
	lsls r2, r2, #1
	adds r2, #1
	lsls r2, r2, #3
	str r2, [r0, #0x30]
	movs r2, #0x11
	ldrsb r2, [r4, r2]
	ldrh r1, [r3, #0xe]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x14
	subs r2, r2, r1
	lsls r2, r2, #4
	adds r2, #0x12
	str r2, [r0, #0x34]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807E388: .4byte gUnknown_089A3DB4
_0807E38C: .4byte gUnknown_0202BCB0

	THUMB_FUNC_END sub_807E34C

	THUMB_FUNC_START sub_807E390
sub_807E390: @ 0x0807E390
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x30]
	movs r0, #0xfd
	bl PlaySpacialSoundMaybe
	bl sub_8081E78
	bl sub_8081EAC
	ldr r0, _0807E3F0  @ sub_8081FA8
	bl SetPrimaryHBlankHandler
	bl sub_807E978
	movs r0, #1
	movs r1, #0x10
	movs r2, #0x10
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	ldr r0, _0807E3F4  @ gBG2TilemapBuffer
	ldr r1, _0807E3F8  @ gUnknown_02020188
	ldr r2, _0807E3FC  @ 0x00004160
	bl CallARM_FillTileRect
	movs r0, #4
	bl BG_EnableSyncByMask
	movs r0, #2
	movs r1, #0
	movs r2, #1
	adds r3, r4, #0
	bl sub_807EA20
	ldr r0, _0807E400  @ gUnknown_089A52FC
	adds r1, r4, #0
	bl Proc_Start
	adds r0, r4, #0
	adds r0, #0x48
	movs r1, #0
	strh r1, [r0]
	adds r4, #0x4a
	strh r1, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807E3F0: .4byte sub_8081FA8
_0807E3F4: .4byte gBG2TilemapBuffer
_0807E3F8: .4byte gUnknown_02020188
_0807E3FC: .4byte 0x00004160
_0807E400: .4byte gUnknown_089A52FC

	THUMB_FUNC_END sub_807E390

	THUMB_FUNC_START sub_807E404
sub_807E404: @ 0x0807E404
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	adds r4, r5, #0
	adds r4, #0x48
	ldrh r1, [r4]
	movs r2, #0
	ldrsh r0, [r4, r2]
	cmp r0, #0xb
	ble _0807E422
	subs r0, r1, #1
	strh r0, [r4]
	adds r0, r5, #0
	bl Proc_Break
_0807E422:
	ldr r0, [r5, #0x30]
	ldr r1, [r5, #0x34]
	ldrh r2, [r4]
	adds r2, #1
	strh r2, [r4]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	ldr r3, _0807E444  @ gUnknown_089A3DFC
	str r3, [sp]
	movs r3, #0xc
	bl sub_808218C
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807E444: .4byte gUnknown_089A3DFC

	THUMB_FUNC_END sub_807E404

	THUMB_FUNC_START sub_807E448
sub_807E448: @ 0x0807E448
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	adds r4, r5, #0
	adds r4, #0x48
	ldrh r1, [r4]
	movs r2, #0
	ldrsh r0, [r4, r2]
	cmp r0, #0
	bgt _0807E466
	adds r0, r1, #1
	strh r0, [r4]
	adds r0, r5, #0
	bl Proc_Break
_0807E466:
	ldr r0, [r5, #0x30]
	ldr r1, [r5, #0x34]
	ldrh r2, [r4]
	subs r2, #1
	strh r2, [r4]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	ldr r3, _0807E488  @ gUnknown_089A3DFC
	str r3, [sp]
	movs r3, #0xc
	bl sub_808218C
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807E488: .4byte gUnknown_089A3DFC

	THUMB_FUNC_END sub_807E448

	THUMB_FUNC_START sub_807E48C
sub_807E48C: @ 0x0807E48C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0807E4C8  @ gUnknown_089A3E04
	movs r1, #3
	bl Proc_Start
	movs r2, #0x10
	ldrsb r2, [r4, r2]
	ldr r3, _0807E4CC  @ gUnknown_0202BCB0
	ldrh r1, [r3, #0xc]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x14
	subs r2, r2, r1
	lsls r2, r2, #1
	adds r2, #1
	lsls r2, r2, #3
	str r2, [r0, #0x30]
	movs r2, #0x11
	ldrsb r2, [r4, r2]
	ldrh r1, [r3, #0xe]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x14
	subs r2, r2, r1
	lsls r2, r2, #1
	adds r2, #1
	lsls r2, r2, #3
	str r2, [r0, #0x34]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807E4C8: .4byte gUnknown_089A3E04
_0807E4CC: .4byte gUnknown_0202BCB0

	THUMB_FUNC_END sub_807E48C

	THUMB_FUNC_START sub_807E4D0
sub_807E4D0: @ 0x0807E4D0
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r6, r0, #0
	ldr r1, [r6, #0x30]
	movs r0, #0x83
	bl PlaySpacialSoundMaybe
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	bl sub_807E978
	ldr r4, _0807E568  @ gUnknown_089B2618
	movs r0, #2
	bl GetBackgroundTileDataOffset
	adds r1, r0, #0
	ldr r0, _0807E56C  @ 0x06002C00
	adds r1, r1, r0
	adds r0, r4, #0
	bl CopyDataWithPossibleUncomp
	ldr r0, _0807E570  @ gUnknown_089B21D8
	ldr r1, _0807E574  @ 0x06013800
	bl CopyDataWithPossibleUncomp
	ldr r4, _0807E578  @ gUnknown_089B2728
	adds r0, r4, #0
	movs r1, #0x80
	movs r2, #0x20
	bl CopyToPaletteBuffer
	movs r1, #0xa0
	lsls r1, r1, #2
	adds r0, r4, #0
	movs r2, #0x20
	bl CopyToPaletteBuffer
	ldr r0, _0807E57C  @ gUnknown_089B2748
	ldr r1, [r6, #0x30]
	ldr r2, [r6, #0x34]
	movs r3, #0x80
	lsls r3, r3, #3
	orrs r2, r3
	ldr r3, _0807E580  @ 0x000041C0
	movs r5, #0
	str r5, [sp]
	movs r4, #2
	str r4, [sp, #4]
	bl APProc_Create
	adds r6, #0x48
	strh r5, [r6]
	movs r0, #1
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl sub_8001ED0
	movs r0, #0
	bl sub_8001F48
	movs r0, #0
	movs r1, #0x10
	movs r2, #0x10
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807E568: .4byte gUnknown_089B2618
_0807E56C: .4byte 0x06002C00
_0807E570: .4byte gUnknown_089B21D8
_0807E574: .4byte 0x06013800
_0807E578: .4byte gUnknown_089B2728
_0807E57C: .4byte gUnknown_089B2748
_0807E580: .4byte 0x000041C0

	THUMB_FUNC_END sub_807E4D0

	THUMB_FUNC_START sub_807E584
sub_807E584: @ 0x0807E584
	push {r4, r5, lr}
	sub sp, #8
	adds r4, r0, #0
	ldr r1, [r4, #0x30]
	movs r0, #0x84
	bl PlaySpacialSoundMaybe
	ldr r5, _0807E5E8  @ gBG2TilemapBuffer
	ldr r0, [r4, #0x30]
	cmp r0, #0
	bge _0807E59C
	adds r0, #7
_0807E59C:
	asrs r0, r0, #3
	subs r1, r0, #2
	ldr r0, [r4, #0x34]
	cmp r0, #0
	bge _0807E5A8
	adds r0, #7
_0807E5A8:
	asrs r2, r0, #3
	subs r2, #2
	ldr r3, _0807E5EC  @ 0x00004160
	movs r0, #4
	str r0, [sp]
	str r0, [sp, #4]
	adds r0, r5, #0
	bl sub_8014560
	movs r0, #4
	bl BG_EnableSyncByMask
	movs r0, #0
	str r0, [sp]
	movs r1, #0
	movs r2, #1
	movs r3, #0
	bl sub_8001ED0
	movs r0, #0
	bl sub_8001F48
	movs r0, #1
	movs r1, #0x10
	movs r2, #0x10
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807E5E8: .4byte gBG2TilemapBuffer
_0807E5EC: .4byte 0x00004160

	THUMB_FUNC_END sub_807E584

	THUMB_FUNC_START sub_807E5F0
sub_807E5F0: @ 0x0807E5F0
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	adds r4, r5, #0
	adds r4, #0x48
	ldrh r3, [r4]
	adds r0, r3, #1
	strh r0, [r4]
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	movs r0, #0x1e
	str r0, [sp]
	movs r0, #0
	movs r1, #0x10
	movs r2, #0
	bl sub_8012DCC
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	movs r0, #1
	movs r2, #0x10
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	movs r1, #0
	ldrsh r0, [r4, r1]
	cmp r0, #0x1d
	ble _0807E630
	adds r0, r5, #0
	bl Proc_Break
_0807E630:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_807E5F0

	THUMB_FUNC_START sub_807E638
sub_807E638: @ 0x0807E638
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0807E674  @ gUnknown_089A3E44
	movs r1, #3
	bl Proc_Start
	movs r2, #0x10
	ldrsb r2, [r4, r2]
	ldr r3, _0807E678  @ gUnknown_0202BCB0
	ldrh r1, [r3, #0xc]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x14
	subs r2, r2, r1
	lsls r2, r2, #1
	adds r2, #1
	lsls r2, r2, #3
	str r2, [r0, #0x30]
	movs r2, #0x11
	ldrsb r2, [r4, r2]
	ldrh r1, [r3, #0xe]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x14
	subs r2, r2, r1
	lsls r2, r2, #1
	adds r2, #1
	lsls r2, r2, #3
	str r2, [r0, #0x34]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807E674: .4byte gUnknown_089A3E44
_0807E678: .4byte gUnknown_0202BCB0

	THUMB_FUNC_END sub_807E638

	THUMB_FUNC_START sub_807E67C
sub_807E67C: @ 0x0807E67C
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r1, [r5, #0x30]
	movs r0, #0x88
	bl PlaySpacialSoundMaybe
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	bl sub_807E978
	movs r0, #1
	movs r1, #0x10
	movs r2, #0x10
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	ldr r4, _0807E6D4  @ gUnknown_089B2880
	movs r0, #2
	bl GetBackgroundTileDataOffset
	adds r1, r0, #0
	ldr r0, _0807E6D8  @ 0x06002C00
	adds r1, r1, r0
	adds r0, r4, #0
	bl CopyDataWithPossibleUncomp
	ldr r0, _0807E6DC  @ gUnknown_0868DF5C
	movs r1, #0x80
	movs r2, #0x20
	bl CopyToPaletteBuffer
	adds r0, r5, #0
	adds r0, #0x48
	movs r1, #0
	strh r1, [r0]
	adds r5, #0x4a
	strh r1, [r5]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807E6D4: .4byte gUnknown_089B2880
_0807E6D8: .4byte 0x06002C00
_0807E6DC: .4byte gUnknown_0868DF5C

	THUMB_FUNC_END sub_807E67C

	THUMB_FUNC_START sub_807E6E0
sub_807E6E0: @ 0x0807E6E0
	push {r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r6, r0, #0
	ldr r0, _0807E750  @ gBG2TilemapBuffer
	mov ip, r0
	ldr r0, [r6, #0x30]
	cmp r0, #0
	bge _0807E6F2
	adds r0, #7
_0807E6F2:
	asrs r0, r0, #3
	subs r7, r0, #2
	ldr r2, [r6, #0x34]
	cmp r2, #0
	bge _0807E6FE
	adds r2, #7
_0807E6FE:
	asrs r2, r2, #3
	subs r2, #8
	ldr r3, _0807E754  @ 0x00004160
	movs r0, #4
	str r0, [sp]
	movs r0, #0xa
	str r0, [sp, #4]
	ldr r0, _0807E758  @ gUnknown_089B343C
	str r0, [sp, #8]
	ldr r5, _0807E75C  @ gUnknown_08205855
	adds r4, r6, #0
	adds r4, #0x48
	ldrh r0, [r4]
	adds r1, r0, #1
	strh r1, [r4]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	adds r0, r0, r5
	ldrb r0, [r0]
	str r0, [sp, #0xc]
	mov r0, ip
	adds r1, r7, #0
	bl sub_801474C
	movs r0, #4
	bl BG_EnableSyncByMask
	movs r1, #0
	ldrsh r0, [r4, r1]
	adds r0, r0, r5
	ldrb r0, [r0]
	cmp r0, #0xff
	bne _0807E746
	adds r0, r6, #0
	bl Proc_Break
_0807E746:
	add sp, #0x10
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807E750: .4byte gBG2TilemapBuffer
_0807E754: .4byte 0x00004160
_0807E758: .4byte gUnknown_089B343C
_0807E75C: .4byte gUnknown_08205855

	THUMB_FUNC_END sub_807E6E0

	THUMB_FUNC_START sub_807E760
sub_807E760: @ 0x0807E760
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _0807E794  @ gUnknown_089A3E6C
	movs r1, #3
	bl Proc_Start
	ldr r2, _0807E798  @ gUnknown_0202BCB0
	ldrh r1, [r2, #0xc]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x14
	subs r4, r4, r1
	lsls r4, r4, #4
	adds r4, #8
	str r4, [r0, #0x30]
	ldrh r1, [r2, #0xe]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x14
	subs r5, r5, r1
	lsls r5, r5, #4
	adds r5, #8
	str r5, [r0, #0x34]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807E794: .4byte gUnknown_089A3E6C
_0807E798: .4byte gUnknown_0202BCB0

	THUMB_FUNC_END sub_807E760

	THUMB_FUNC_START sub_807E79C
sub_807E79C: @ 0x0807E79C
	push {r4, lr}
	ldr r4, _0807E7C0  @ gActionData
	ldrb r0, [r4, #0xc]
	bl GetUnit
	ldr r1, [r0, #0xc]
	movs r2, #1
	orrs r1, r2
	str r1, [r0, #0xc]
	movs r0, #0x13
	ldrsb r0, [r4, r0]
	movs r1, #0x14
	ldrsb r1, [r4, r1]
	bl sub_808320C
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807E7C0: .4byte gActionData

	THUMB_FUNC_END sub_807E79C

	THUMB_FUNC_START sub_807E7C4
sub_807E7C4: @ 0x0807E7C4
	push {lr}
	ldr r0, _0807E7DC  @ gActionData
	ldrb r0, [r0, #0xc]
	bl GetUnit
	ldr r1, [r0, #0xc]
	movs r2, #2
	negs r2, r2
	ands r1, r2
	str r1, [r0, #0xc]
	pop {r0}
	bx r0
	.align 2, 0
_0807E7DC: .4byte gActionData

	THUMB_FUNC_END sub_807E7C4

	THUMB_FUNC_START sub_807E7E0
sub_807E7E0: @ 0x0807E7E0
	push {r4, r5, lr}
	sub sp, #0x10
	adds r5, r0, #0
	ldr r1, [r5, #0x30]
	movs r0, #0x8d
	bl PlaySpacialSoundMaybe
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	ldr r4, _0807E88C  @ gUnknown_089B0720
	movs r0, #2
	bl GetBackgroundTileDataOffset
	adds r1, r0, #0
	ldr r0, _0807E890  @ 0x06002C00
	adds r1, r1, r0
	adds r0, r4, #0
	bl CopyDataWithPossibleUncomp
	ldr r4, _0807E894  @ gBG2TilemapBuffer
	ldr r0, [r5, #0x30]
	cmp r0, #0
	bge _0807E816
	adds r0, #7
_0807E816:
	asrs r0, r0, #3
	subs r1, r0, #2
	ldr r2, [r5, #0x34]
	cmp r2, #0
	bge _0807E822
	adds r2, #7
_0807E822:
	asrs r2, r2, #3
	subs r2, #2
	ldr r3, _0807E898  @ 0x00004160
	movs r0, #4
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _0807E89C  @ gUnknown_089B0840
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	adds r0, r4, #0
	bl sub_801474C
	movs r0, #4
	bl BG_EnableSyncByMask
	ldr r0, _0807E8A0  @ gUnknown_089B06AC
	ldr r1, _0807E8A4  @ 0x06013800
	bl CopyDataWithPossibleUncomp
	ldr r0, _0807E8A8  @ gUnknown_089B0700
	movs r1, #0xa0
	lsls r1, r1, #2
	movs r2, #0x20
	bl CopyToPaletteBuffer
	ldr r0, _0807E8AC  @ gUnknown_089B0820
	str r5, [sp]
	movs r1, #0x80
	movs r2, #0x20
	movs r3, #4
	bl sub_80144CC
	bl sub_8081E78
	bl sub_8081EAC
	bl sub_807E978
	movs r0, #1
	movs r1, #0x10
	movs r2, #0x10
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	adds r1, r5, #0
	adds r1, #0x48
	movs r0, #1
	strh r0, [r1]
	add sp, #0x10
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807E88C: .4byte gUnknown_089B0720
_0807E890: .4byte 0x06002C00
_0807E894: .4byte gBG2TilemapBuffer
_0807E898: .4byte 0x00004160
_0807E89C: .4byte gUnknown_089B0840
_0807E8A0: .4byte gUnknown_089B06AC
_0807E8A4: .4byte 0x06013800
_0807E8A8: .4byte gUnknown_089B0700
_0807E8AC: .4byte gUnknown_089B0820

	THUMB_FUNC_END sub_807E7E0

	THUMB_FUNC_START sub_807E8B0
sub_807E8B0: @ 0x0807E8B0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	adds r7, r0, #0
	adds r4, r7, #0
	adds r4, #0x48
	movs r0, #0
	ldrsh r3, [r4, r0]
	movs r0, #0x1e
	str r0, [sp]
	movs r0, #5
	movs r1, #1
	movs r2, #0x10
	bl sub_8012DCC
	adds r2, r0, #0
	ldrh r0, [r4]
	adds r0, #1
	movs r1, #0
	mov r8, r1
	strh r0, [r4]
	ldr r0, [r7, #0x30]
	ldr r1, [r7, #0x34]
	bl sub_8081F24
	movs r1, #0
	ldrsh r0, [r4, r1]
	cmp r0, #0x1d
	ble _0807E920
	mov r0, r8
	strh r0, [r4]
	adds r0, r7, #0
	bl Proc_Break
	ldr r5, _0807E92C  @ gUnknown_089A6254
	ldr r1, [r7, #0x30]
	ldr r2, [r7, #0x34]
	ldr r6, _0807E930  @ 0x000041C0
	mov r0, r8
	str r0, [sp]
	movs r4, #2
	str r4, [sp, #4]
	adds r0, r5, #0
	adds r3, r6, #0
	bl APProc_Create
	ldr r1, [r7, #0x30]
	ldr r2, [r7, #0x34]
	movs r0, #1
	str r0, [sp]
	str r4, [sp, #4]
	adds r0, r5, #0
	adds r3, r6, #0
	bl APProc_Create
_0807E920:
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807E92C: .4byte gUnknown_089A6254
_0807E930: .4byte 0x000041C0

	THUMB_FUNC_END sub_807E8B0

	THUMB_FUNC_START sub_807E934
sub_807E934: @ 0x0807E934
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	adds r4, r5, #0
	adds r4, #0x48
	movs r0, #0
	ldrsh r3, [r4, r0]
	movs r0, #0x1e
	str r0, [sp]
	movs r0, #5
	movs r1, #0x10
	movs r2, #0
	bl sub_8012DCC
	adds r2, r0, #0
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
	ldr r0, [r5, #0x30]
	ldr r1, [r5, #0x34]
	bl sub_8081F24
	movs r1, #0
	ldrsh r0, [r4, r1]
	cmp r0, #0x1d
	ble _0807E96E
	adds r0, r5, #0
	bl Proc_Break
_0807E96E:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_807E934

	THUMB_FUNC_START sub_807E978
sub_807E978: @ 0x0807E978
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	ldr r4, _0807EA1C  @ gLCDControlBuffer
	ldrb r2, [r4, #0xc]
	movs r1, #4
	negs r1, r1
	adds r0, r1, #0
	ands r0, r2
	strb r0, [r4, #0xc]
	ldrb r2, [r4, #0x10]
	adds r0, r1, #0
	ands r0, r2
	strb r0, [r4, #0x10]
	ldrb r2, [r4, #0x14]
	adds r0, r1, #0
	ands r0, r2
	strb r0, [r4, #0x14]
	ldrb r0, [r4, #0x18]
	ands r1, r0
	movs r6, #2
	orrs r1, r6
	strb r1, [r4, #0x18]
	movs r0, #0
	str r0, [sp]
	movs r1, #0
	movs r2, #1
	movs r3, #0
	bl sub_8001ED0
	movs r0, #0
	bl sub_8001F48
	movs r0, #1
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #1
	bl sub_8001F0C
	movs r0, #1
	bl sub_8001F64
	movs r0, #0x34
	adds r0, r0, r4
	mov r8, r0
	ldrb r0, [r0]
	movs r1, #0x20
	orrs r0, r1
	adds r4, #0x36
	ldrb r2, [r4]
	movs r1, #0x21
	negs r1, r1
	ands r1, r2
	movs r5, #1
	orrs r0, r5
	orrs r0, r6
	movs r2, #4
	orrs r0, r2
	movs r3, #8
	orrs r0, r3
	movs r2, #0x10
	orrs r0, r2
	mov r7, r8
	strb r0, [r7]
	orrs r1, r5
	orrs r1, r6
	movs r0, #5
	negs r0, r0
	ands r1, r0
	orrs r1, r3
	orrs r1, r2
	strb r1, [r4]
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807EA1C: .4byte gLCDControlBuffer

	THUMB_FUNC_END sub_807E978

	THUMB_FUNC_START sub_807EA20
sub_807EA20: @ 0x0807EA20
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	adds r1, r3, #0
	ldr r0, _0807EA4C  @ gUnknown_089A3EC4
	bl Proc_Start
	adds r2, r0, #0
	str r4, [r2, #0x58]
	adds r0, #0x64
	movs r1, #0
	strh r1, [r0]
	adds r0, #2
	strh r5, [r0]
	adds r0, #2
	strh r1, [r0]
	adds r0, #2
	strh r6, [r0]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807EA4C: .4byte gUnknown_089A3EC4

	THUMB_FUNC_END sub_807EA20

	THUMB_FUNC_START sub_807EA50
sub_807EA50: @ 0x0807EA50
	push {lr}
	ldr r0, _0807EA5C  @ gUnknown_089A3EC4
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
_0807EA5C: .4byte gUnknown_089A3EC4

	THUMB_FUNC_END sub_807EA50

	THUMB_FUNC_START sub_807EA60
sub_807EA60: @ 0x0807EA60
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r0, [r6, #0x58]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r4, r6, #0
	adds r4, #0x64
	ldrh r1, [r4]
	adds r5, r6, #0
	adds r5, #0x68
	ldrh r2, [r5]
	bl BG_SetPosition
	adds r0, r6, #0
	adds r0, #0x66
	ldrh r0, [r0]
	ldrh r1, [r4]
	adds r0, r0, r1
	strh r0, [r4]
	adds r0, r6, #0
	adds r0, #0x6a
	ldrh r0, [r0]
	ldrh r1, [r5]
	adds r0, r0, r1
	strh r0, [r5]
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_807EA60

	THUMB_FUNC_START sub_807EA98
sub_807EA98: @ 0x0807EA98
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	adds r6, r0, #0
	mov sl, r1
	mov r9, r2
	ldr r5, _0807EB80  @ gBG1TilemapBuffer
	adds r0, r5, #0
	movs r1, #0
	bl BG_Fill
	ldr r4, _0807EB84  @ gUnknown_088035B0
	movs r0, #1
	bl GetBackgroundTileDataOffset
	adds r1, r0, #0
	ldr r0, _0807EB88  @ 0x06004000
	adds r1, r1, r0
	adds r0, r4, #0
	bl CopyDataWithPossibleUncomp
	ldr r0, _0807EB8C  @ gUnknown_088039E8
	ldr r4, _0807EB90  @ gUnknown_02020188
	adds r1, r4, #0
	bl CopyDataWithPossibleUncomp
	movs r2, #0xe0
	lsls r2, r2, #2
	movs r3, #0xa4
	lsls r3, r3, #7
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_80149F0
	ldr r0, _0807EB94  @ gUnknown_08803B10
	movs r1, #0xa0
	movs r2, #0x20
	bl CopyToPaletteBuffer
	mov r0, r9
	lsls r4, r0, #5
	adds r4, #2
	add r4, sl
	lsls r4, r4, #1
	ldr r0, _0807EB98  @ gBG0TilemapBuffer
	adds r4, r4, r0
	ldr r1, _0807EB9C  @ gUnknown_0203E1F0
	lsls r0, r6, #2
	adds r0, r0, r6
	lsls r0, r0, #2
	adds r7, r0, r1
	ldr r0, [r7]
	ldr r0, [r0, #4]
	ldrh r0, [r0]
	bl GetStringFromIndex
	adds r2, r0, #0
	adds r0, r4, #0
	movs r1, #0
	bl sub_801443C
	ldr r1, _0807EBA0  @ gUnknown_089A3ED4
	ldrb r0, [r1]
	cmp r0, #0xff
	beq _0807EB6C
	mov r8, r1
	mov r5, r8
	movs r6, #0
_0807EB24:
	ldrb r1, [r5, #1]
	add r1, r9
	lsls r1, r1, #5
	ldrb r0, [r5]
	add r0, sl
	adds r1, r1, r0
	lsls r1, r1, #1
	ldr r0, _0807EB98  @ gBG0TilemapBuffer
	adds r4, r1, r0
	ldr r0, [r7]
	bl UnitHasMagicRank
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r1, r6, #0
	cmp r0, #1
	bne _0807EB48
	adds r1, r6, #4
_0807EB48:
	mov r0, r8
	adds r0, #4
	adds r0, r1, r0
	ldr r0, [r0]
	ldr r0, [r0]
	bl GetStringFromIndex
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #3
	movs r2, #3
	bl sub_80143D8
	adds r5, #0xc
	adds r6, #0xc
	ldrb r0, [r5]
	cmp r0, #0xff
	bne _0807EB24
_0807EB6C:
	movs r0, #3
	bl BG_EnableSyncByMask
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807EB80: .4byte gBG1TilemapBuffer
_0807EB84: .4byte gUnknown_088035B0
_0807EB88: .4byte 0x06004000
_0807EB8C: .4byte gUnknown_088039E8
_0807EB90: .4byte gUnknown_02020188
_0807EB94: .4byte gUnknown_08803B10
_0807EB98: .4byte gBG0TilemapBuffer
_0807EB9C: .4byte gUnknown_0203E1F0
_0807EBA0: .4byte gUnknown_089A3ED4

	THUMB_FUNC_END sub_807EA98

	THUMB_FUNC_START sub_807EBA4
sub_807EBA4: @ 0x0807EBA4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	adds r6, r3, #0
	ldr r4, [sp, #0x18]
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r3, _0807EC00  @ gUnknown_089A3ED4
	lsls r0, r6, #1
	adds r0, r0, r6
	lsls r0, r0, #2
	adds r0, r0, r3
	ldrb r3, [r0, #1]
	adds r2, r2, r3
	lsls r2, r2, #5
	adds r2, #4
	ldrb r0, [r0]
	adds r1, r1, r0
	adds r2, r2, r1
	lsls r2, r2, #1
	ldr r0, _0807EC04  @ gBG0TilemapBuffer
	adds r7, r2, r0
	mov r0, r8
	adds r1, r6, #0
	bl GetSomeStatBase
	adds r5, r0, #0
	cmp r4, #0
	beq _0807EBEA
	mov r0, r8
	adds r1, r6, #0
	bl GetSomeStatUp
	adds r5, r5, r0
_0807EBEA:
	adds r0, r7, #0
	movs r1, #2
	adds r2, r5, #0
	bl DrawDecNumber
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807EC00: .4byte gUnknown_089A3ED4
_0807EC04: .4byte gBG0TilemapBuffer

	THUMB_FUNC_END sub_807EBA4

	THUMB_FUNC_START GetSomeStatUp
GetSomeStatUp: @ 0x0807EC08
	push {lr}
	adds r2, r0, #0
	cmp r1, #8
	bls _0807EC12
	b _0807ED28
_0807EC12:
	lsls r0, r1, #2
	ldr r1, _0807EC1C  @ _0807EC20
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0807EC1C: .4byte _0807EC20
_0807EC20: @ jump table
	.4byte _0807EC44 @ case 0
	.4byte _0807EC48 @ case 1
	.4byte _0807EC64 @ case 2
	.4byte _0807EC80 @ case 3
	.4byte _0807EC9C @ case 4
	.4byte _0807ECB8 @ case 5
	.4byte _0807ECD4 @ case 6
	.4byte _0807ECF0 @ case 7
	.4byte _0807ED0C @ case 8
_0807EC44:
	movs r0, #1
	b _0807ED2A
_0807EC48:
	ldr r1, _0807EC60  @ gUnknown_0203E1F0
	lsls r0, r2, #2
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r1, #4
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, #0x73
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	b _0807ED2A
	.align 2, 0
_0807EC60: .4byte gUnknown_0203E1F0
_0807EC64:
	ldr r1, _0807EC7C  @ gUnknown_0203E1F0
	lsls r0, r2, #2
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r1, #4
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, #0x74
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	b _0807ED2A
	.align 2, 0
_0807EC7C: .4byte gUnknown_0203E1F0
_0807EC80:
	ldr r1, _0807EC98  @ gUnknown_0203E1F0
	lsls r0, r2, #2
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r1, #4
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, #0x75
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	b _0807ED2A
	.align 2, 0
_0807EC98: .4byte gUnknown_0203E1F0
_0807EC9C:
	ldr r1, _0807ECB4  @ gUnknown_0203E1F0
	lsls r0, r2, #2
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r1, #4
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, #0x76
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	b _0807ED2A
	.align 2, 0
_0807ECB4: .4byte gUnknown_0203E1F0
_0807ECB8:
	ldr r1, _0807ECD0  @ gUnknown_0203E1F0
	lsls r0, r2, #2
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r1, #4
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, #0x79
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	b _0807ED2A
	.align 2, 0
_0807ECD0: .4byte gUnknown_0203E1F0
_0807ECD4:
	ldr r1, _0807ECEC  @ gUnknown_0203E1F0
	lsls r0, r2, #2
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r1, #4
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, #0x77
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	b _0807ED2A
	.align 2, 0
_0807ECEC: .4byte gUnknown_0203E1F0
_0807ECF0:
	ldr r1, _0807ED08  @ gUnknown_0203E1F0
	lsls r0, r2, #2
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r1, #4
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, #0x78
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	b _0807ED2A
	.align 2, 0
_0807ED08: .4byte gUnknown_0203E1F0
_0807ED0C:
	ldr r1, _0807ED24  @ gUnknown_0203E1F0
	lsls r0, r2, #2
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r1, #4
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, #0x7a
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	b _0807ED2A
	.align 2, 0
_0807ED24: .4byte gUnknown_0203E1F0
_0807ED28:
	movs r0, #0
_0807ED2A:
	pop {r1}
	bx r1

	THUMB_FUNC_END GetSomeStatUp

	THUMB_FUNC_START GetSomeStatBase
GetSomeStatBase: @ 0x0807ED30
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, _0807ED5C  @ gUnknown_0203E1F0
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetUnit
	adds r2, r0, #0
	cmp r5, #8
	bhi _0807EDE2
	lsls r0, r5, #2
	ldr r1, _0807ED60  @ _0807ED64
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0807ED5C: .4byte gUnknown_0203E1F0
_0807ED60: .4byte _0807ED64
_0807ED64: @ jump table
	.4byte _0807ED88 @ case 0
	.4byte _0807EDA4 @ case 1
	.4byte _0807EDAA @ case 2
	.4byte _0807EDB0 @ case 3
	.4byte _0807EDB6 @ case 4
	.4byte _0807EDBC @ case 5
	.4byte _0807EDC2 @ case 6
	.4byte _0807EDC8 @ case 7
	.4byte _0807EDCE @ case 8
_0807ED88:
	ldr r1, _0807EDA0  @ gUnknown_0203E1F0
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #2
	adds r1, #4
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, #0x70
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	b _0807EDE4
	.align 2, 0
_0807EDA0: .4byte gUnknown_0203E1F0
_0807EDA4:
	movs r0, #0x12
	ldrsb r0, [r2, r0]
	b _0807EDE4
_0807EDAA:
	movs r0, #0x14
	ldrsb r0, [r2, r0]
	b _0807EDE4
_0807EDB0:
	movs r0, #0x15
	ldrsb r0, [r2, r0]
	b _0807EDE4
_0807EDB6:
	movs r0, #0x16
	ldrsb r0, [r2, r0]
	b _0807EDE4
_0807EDBC:
	movs r0, #0x19
	ldrsb r0, [r2, r0]
	b _0807EDE4
_0807EDC2:
	movs r0, #0x17
	ldrsb r0, [r2, r0]
	b _0807EDE4
_0807EDC8:
	movs r0, #0x18
	ldrsb r0, [r2, r0]
	b _0807EDE4
_0807EDCE:
	ldr r0, [r2, #4]
	ldrb r0, [r0, #0x11]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldr r1, [r2]
	ldrb r1, [r1, #0x13]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, r0, r1
	b _0807EDE4
_0807EDE2:
	movs r0, #0
_0807EDE4:
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END GetSomeStatBase

	THUMB_FUNC_START sub_807EDEC
sub_807EDEC: @ 0x0807EDEC
	push {lr}
	bl APProc_DeleteAll
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_807EDEC

	THUMB_FUNC_START sub_807EDF8
sub_807EDF8: @ 0x0807EDF8
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	mov r8, r0
	adds r6, r1, #0
	adds r5, r2, #0
	adds r1, r3, #0
	ldr r0, _0807EE5C  @ gUnknown_089A3F4C
	bl Proc_Start
	adds r4, r0, #0
	mov r0, r8
	strh r0, [r4, #0x2a]
	strh r6, [r4, #0x2c]
	strh r5, [r4, #0x2e]
	ldr r0, _0807EE60  @ gUnknown_089ACA08
	ldr r1, _0807EE64  @ 0x000003FF
	mov r2, r8
	ands r1, r2
	lsls r1, r1, #5
	ldr r2, _0807EE68  @ 0x06010000
	adds r1, r1, r2
	bl CopyDataWithPossibleUncomp
	ldr r5, _0807EE6C  @ gUnknown_089AC9A8
	adds r1, r6, #0
	adds r1, #0x10
	lsls r1, r1, #5
	adds r0, r5, #0
	movs r2, #0x20
	bl CopyToPaletteBuffer
	adds r1, r6, #0
	adds r1, #0x11
	lsls r1, r1, #5
	adds r0, r5, #0
	movs r2, #0x20
	bl CopyToPaletteBuffer
	ldr r0, _0807EE70  @ gUnknown_089A3F5C
	adds r1, r4, #0
	bl Proc_Start
	adds r0, #0x64
	strh r6, [r0]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807EE5C: .4byte gUnknown_089A3F4C
_0807EE60: .4byte gUnknown_089ACA08
_0807EE64: .4byte 0x000003FF
_0807EE68: .4byte 0x06010000
_0807EE6C: .4byte gUnknown_089AC9A8
_0807EE70: .4byte gUnknown_089A3F5C

	THUMB_FUNC_END sub_807EDF8

	THUMB_FUNC_START sub_807EE74
sub_807EE74: @ 0x0807EE74
	push {lr}
	ldr r0, _0807EE80  @ gUnknown_089A3F4C
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
_0807EE80: .4byte gUnknown_089A3F4C

	THUMB_FUNC_END sub_807EE74

	THUMB_FUNC_START sub_807EE84
sub_807EE84: @ 0x0807EE84
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r4, r0, #0
	mov r8, r1
	adds r6, r2, #0
	adds r7, r3, #0
	ldr r0, _0807EEDC  @ gUnknown_089A3F4C
	bl Proc_Find
	adds r5, r0, #0
	ldrh r0, [r5, #0x2a]
	mov r9, r0
	subs r0, r6, #1
	lsls r0, r0, #1
	add r0, r9
	mov sl, r0
	cmp r6, #0
	bne _0807EEE4
	ldr r0, _0807EEE0  @ gUnknown_089A5314
	adds r1, r4, #0
	subs r1, #0x12
	mov r2, r8
	subs r2, #4
	ldrh r4, [r5, #0x2c]
	movs r3, #0xf
	ands r3, r4
	lsls r3, r3, #0xc
	add r3, r9
	ldrh r5, [r5, #0x2e]
	movs r4, #3
	ands r4, r5
	lsls r4, r4, #0xa
	adds r3, r3, r4
	str r6, [sp]
	movs r4, #2
	str r4, [sp, #4]
	bl APProc_Create
	b _0807EFD0
	.align 2, 0
_0807EEDC: .4byte gUnknown_089A3F4C
_0807EEE0: .4byte gUnknown_089A5314
_0807EEE4:
	movs r6, #1
	cmp r7, #0
	ble _0807EEEC
	movs r6, #0
_0807EEEC:
	ldrh r3, [r5, #0x2c]
	adds r3, r3, r6
	movs r1, #0xf
	ands r3, r1
	lsls r3, r3, #0xc
	add r3, r9
	ldrh r1, [r5, #0x2e]
	movs r0, #3
	ands r0, r1
	lsls r0, r0, #0xa
	adds r3, r3, r0
	adds r0, r6, #1
	str r0, [sp]
	movs r2, #2
	str r2, [sp, #4]
	ldr r0, _0807EFE0  @ gUnknown_089A5314
	adds r1, r4, #0
	mov r2, r8
	bl APProc_Create
	subs r1, r4, #3
	ldrh r0, [r5, #0x2c]
	movs r3, #0xf
	ands r3, r0
	lsls r3, r3, #0xc
	add r3, sl
	ldrh r2, [r5, #0x2e]
	movs r0, #3
	ands r0, r2
	lsls r0, r0, #0xa
	adds r3, r3, r0
	adds r0, r6, #3
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	ldr r0, _0807EFE0  @ gUnknown_089A5314
	mov r2, r8
	bl APProc_Create
	cmp r7, #0
	ble _0807EF68
	adds r1, r4, #0
	subs r1, #0x12
	mov r2, r8
	subs r2, #4
	ldrh r0, [r5, #0x2c]
	movs r3, #0xf
	ands r3, r0
	lsls r3, r3, #0xc
	add r3, r9
	ldrh r4, [r5, #0x2e]
	movs r0, #3
	ands r0, r4
	lsls r0, r0, #0xa
	adds r3, r3, r0
	movs r0, #0
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	ldr r0, _0807EFE0  @ gUnknown_089A5314
	bl APProc_Create
_0807EF68:
	cmp r7, #0
	bge _0807EF88
	ldr r1, _0807EFE4  @ gUnknown_089ACC98
	movs r2, #0x80
	lsls r2, r2, #3
	adds r0, r1, r2
	mov r1, sl
	adds r1, #0x4c
	subs r2, #1
	ands r1, r2
	lsls r1, r1, #5
	ldr r2, _0807EFE8  @ 0x06010000
	adds r1, r1, r2
	movs r2, #0x20
	bl sub_801498C
_0807EF88:
	adds r0, r7, #0
	cmp r7, #0
	bge _0807EF90
	negs r0, r7
_0807EF90:
	ldr r4, _0807EFEC  @ 0x000003FF
	ands r0, r4
	lsls r0, r0, #5
	ldr r1, _0807EFE4  @ gUnknown_089ACC98
	adds r0, r0, r1
	mov r1, sl
	adds r1, #0x2d
	ands r1, r4
	lsls r1, r1, #5
	ldr r5, _0807EFE8  @ 0x06010000
	adds r1, r1, r5
	movs r2, #0x20
	bl sub_801498C
	adds r3, r7, #0
	cmp r3, #0
	bge _0807EFB4
	negs r3, r3
_0807EFB4:
	adds r0, r3, #0
	adds r0, #0x20
	ands r0, r4
	lsls r0, r0, #5
	ldr r2, _0807EFE4  @ gUnknown_089ACC98
	adds r0, r0, r2
	mov r1, sl
	adds r1, #0x4d
	ands r1, r4
	lsls r1, r1, #5
	adds r1, r1, r5
	movs r2, #0x20
	bl sub_801498C
_0807EFD0:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807EFE0: .4byte gUnknown_089A5314
_0807EFE4: .4byte gUnknown_089ACC98
_0807EFE8: .4byte 0x06010000
_0807EFEC: .4byte 0x000003FF

	THUMB_FUNC_END sub_807EE84

	THUMB_FUNC_START sub_807EFF0
sub_807EFF0: @ 0x0807EFF0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	mov sl, r0
	mov r8, r1
	adds r4, r2, #0
	mov r9, r4
	cmp r4, #0
	bge _0807F00E
	mov r0, r9
	negs r0, r0
	mov r9, r0
_0807F00E:
	ldr r0, _0807F02C  @ gUnknown_089A3F4C
	bl Proc_Find
	adds r7, r0, #0
	ldrh r6, [r7, #0x2a]
	cmp r4, #0
	blt _0807F030
	mov r0, r9
	subs r0, #1
	lsls r0, r0, #1
	adds r0, r6, r0
	str r0, [sp, #8]
	movs r2, #5
	b _0807F038
	.align 2, 0
_0807F02C: .4byte gUnknown_089A3F4C
_0807F030:
	adds r1, r6, #0
	adds r1, #0x10
	str r1, [sp, #8]
	movs r2, #6
_0807F038:
	ldrh r0, [r7, #0x2c]
	movs r5, #0xf
	adds r3, r5, #0
	ands r3, r0
	lsls r3, r3, #0xc
	adds r3, r6, r3
	ldrh r1, [r7, #0x2e]
	movs r4, #3
	adds r0, r4, #0
	ands r0, r1
	lsls r0, r0, #0xa
	adds r3, r3, r0
	str r2, [sp]
	movs r0, #2
	str r0, [sp, #4]
	ldr r0, _0807F0FC  @ gUnknown_089A5314
	mov r1, sl
	mov r2, r8
	bl APProc_Create
	mov r1, sl
	subs r1, #3
	ldrh r0, [r7, #0x2c]
	adds r3, r5, #0
	ands r3, r0
	lsls r3, r3, #0xc
	ldr r0, [sp, #8]
	adds r3, r0, r3
	ldrh r2, [r7, #0x2e]
	adds r0, r4, #0
	ands r0, r2
	lsls r0, r0, #0xa
	adds r3, r3, r0
	str r4, [sp]
	movs r0, #2
	str r0, [sp, #4]
	ldr r0, _0807F0FC  @ gUnknown_089A5314
	mov r2, r8
	bl APProc_Create
	mov r1, sl
	subs r1, #0x12
	mov r2, r8
	subs r2, #4
	ldrh r0, [r7, #0x2c]
	ands r5, r0
	lsls r5, r5, #0xc
	adds r5, r6, r5
	ldrh r0, [r7, #0x2e]
	ands r4, r0
	lsls r4, r4, #0xa
	adds r5, r5, r4
	movs r0, #0
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	ldr r0, _0807F0FC  @ gUnknown_089A5314
	adds r3, r5, #0
	bl APProc_Create
	ldr r4, _0807F100  @ 0x000003FF
	mov r0, r9
	ands r0, r4
	lsls r0, r0, #5
	ldr r1, _0807F104  @ gUnknown_089ACC98
	adds r0, r1, r0
	ldr r1, [sp, #8]
	adds r1, #0x2d
	ands r1, r4
	lsls r1, r1, #5
	ldr r5, _0807F108  @ 0x06010000
	adds r1, r1, r5
	movs r2, #0x20
	bl sub_801498C
	mov r0, r9
	adds r0, #0x20
	ands r0, r4
	lsls r0, r0, #5
	ldr r1, _0807F104  @ gUnknown_089ACC98
	adds r0, r1, r0
	ldr r1, [sp, #8]
	adds r1, #0x4d
	ands r1, r4
	lsls r1, r1, #5
	adds r1, r1, r5
	movs r2, #0x20
	bl sub_801498C
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807F0FC: .4byte gUnknown_089A5314
_0807F100: .4byte 0x000003FF
_0807F104: .4byte gUnknown_089ACC98
_0807F108: .4byte 0x06010000

	THUMB_FUNC_END sub_807EFF0

	THUMB_FUNC_START sub_807F10C
sub_807F10C: @ 0x0807F10C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0807F120  @ gUnknown_089A3F74
	bl Proc_StartBlocking
	strh r4, [r0, #0x2e]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807F120: .4byte gUnknown_089A3F74

	THUMB_FUNC_END sub_807F10C

	THUMB_FUNC_START sub_807F124
sub_807F124: @ 0x0807F124
	push {r4, r5, lr}
	ldr r0, _0807F18C  @ gLCDControlBuffer
	mov ip, r0
	ldrb r0, [r0, #1]
	movs r1, #0x20
	orrs r0, r1
	movs r1, #0x41
	negs r1, r1
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	mov r1, ip
	strb r0, [r1, #1]
	adds r1, #0x2d
	movs r0, #0
	strb r0, [r1]
	adds r1, #4
	strb r0, [r1]
	subs r1, #5
	movs r0, #0xf0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0x30
	strb r0, [r1]
	mov r2, ip
	adds r2, #0x34
	ldrb r1, [r2]
	subs r0, #0x32
	ands r0, r1
	movs r1, #3
	negs r1, r1
	ands r0, r1
	movs r5, #4
	orrs r0, r5
	movs r4, #8
	orrs r0, r4
	movs r3, #0x10
	orrs r0, r3
	strb r0, [r2]
	adds r2, #2
	ldrb r0, [r2]
	movs r1, #1
	orrs r0, r1
	movs r1, #2
	orrs r0, r1
	orrs r0, r5
	orrs r0, r4
	orrs r0, r3
	strb r0, [r2]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807F18C: .4byte gLCDControlBuffer

	THUMB_FUNC_END sub_807F124

	THUMB_FUNC_START sub_807F190
sub_807F190: @ 0x0807F190
	ldr r2, _0807F1A8  @ gLCDControlBuffer
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
	bx lr
	.align 2, 0
_0807F1A8: .4byte gLCDControlBuffer

	THUMB_FUNC_END sub_807F190

	THUMB_FUNC_START sub_807F1AC
sub_807F1AC: @ 0x0807F1AC
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	bl sub_8003D20
	ldr r0, _0807F29C  @ gBG0TilemapBuffer
	movs r1, #0
	bl BG_Fill
	movs r1, #0x2e
	ldrsh r0, [r5, r1]
	movs r1, #1
	movs r2, #1
	bl sub_807EA98
	movs r4, #0
	movs r6, #0
_0807F1CE:
	movs r2, #0x2e
	ldrsh r0, [r5, r2]
	str r6, [sp]
	movs r1, #1
	movs r2, #1
	adds r3, r4, #0
	bl sub_807EBA4
	adds r4, #1
	cmp r4, #8
	ble _0807F1CE
	movs r0, #1
	bl BG_EnableSyncByMask
	adds r0, r5, #0
	adds r0, #0x30
	movs r1, #0
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	ldr r0, _0807F2A0  @ 0x0000FF70
	strh r0, [r5, #0x32]
	ldr r4, _0807F2A4  @ gLCDControlBuffer
	ldrb r2, [r4, #0xc]
	subs r1, #4
	adds r0, r1, #0
	ands r0, r2
	strb r0, [r4, #0xc]
	ldrb r2, [r4, #0x10]
	adds r0, r1, #0
	ands r0, r2
	movs r3, #1
	orrs r0, r3
	strb r0, [r4, #0x10]
	ldrb r2, [r4, #0x14]
	adds r0, r1, #0
	ands r0, r2
	orrs r0, r3
	strb r0, [r4, #0x14]
	ldrb r0, [r4, #0x18]
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	strb r1, [r4, #0x18]
	bl SetDefaultColorEffects
	ldrb r1, [r4, #1]
	movs r0, #0x21
	negs r0, r0
	ands r0, r1
	movs r1, #0x41
	negs r1, r1
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r4, #1]
	ldrh r2, [r5, #0x32]
	movs r0, #0
	movs r1, #0
	bl BG_SetPosition
	ldrh r2, [r5, #0x32]
	movs r0, #1
	movs r1, #0
	bl BG_SetPosition
	ldr r2, _0807F2A8  @ gUnknown_0203E1F0
	movs r0, #0x2e
	ldrsh r1, [r5, r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r0, [r0]
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r2, #0x32
	ldrsh r0, [r5, r2]
	movs r3, #0x20
	subs r3, r3, r0
	ldr r0, _0807F2AC  @ 0x00001042
	str r0, [sp]
	movs r0, #0
	movs r2, #0xb8
	bl NewFace
	ldr r0, _0807F2B0  @ gUnknown_03004980
	ldr r2, [r0]
	ldrh r1, [r5, #0x32]
	movs r0, #0x20
	subs r0, r0, r1
	strh r0, [r2, #0x36]
	movs r0, #0x80
	lsls r0, r0, #2
	movs r1, #3
	movs r2, #1
	adds r3, r5, #0
	bl sub_807EDF8
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807F29C: .4byte gBG0TilemapBuffer
_0807F2A0: .4byte 0x0000FF70
_0807F2A4: .4byte gLCDControlBuffer
_0807F2A8: .4byte gUnknown_0203E1F0
_0807F2AC: .4byte 0x00001042
_0807F2B0: .4byte gUnknown_03004980

	THUMB_FUNC_END sub_807F1AC

	THUMB_FUNC_START sub_807F2B4
sub_807F2B4: @ 0x0807F2B4
	movs r1, #0
	str r1, [r0, #0x54]
	bx lr

	THUMB_FUNC_END sub_807F2B4

	THUMB_FUNC_START sub_807F2BC
sub_807F2BC: @ 0x0807F2BC
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r1, _0807F308  @ gUnknown_089AC5CC
	ldr r0, [r5, #0x54]
	adds r4, r0, #1
	str r4, [r5, #0x54]
	movs r0, #3
	ands r0, r4
	cmp r0, #0
	bne _0807F302
	asrs r4, r4, #2
	movs r0, #0xf
	ands r4, r0
	lsls r4, r4, #1
	adds r4, r4, r1
	adds r5, #0x64
	movs r0, #0
	ldrsh r1, [r5, r0]
	adds r1, #0x10
	lsls r1, r1, #5
	adds r1, #0x12
	adds r0, r4, #0
	movs r2, #0xe
	bl CopyToPaletteBuffer
	adds r4, #0x40
	movs r0, #0
	ldrsh r1, [r5, r0]
	adds r1, #0x11
	lsls r1, r1, #5
	adds r1, #0x12
	adds r0, r4, #0
	movs r2, #0xe
	bl CopyToPaletteBuffer
_0807F302:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807F308: .4byte gUnknown_089AC5CC

	THUMB_FUNC_END sub_807F2BC

	THUMB_FUNC_START sub_807F30C
sub_807F30C: @ 0x0807F30C
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x32]
	adds r0, #8
	strh r0, [r4, #0x32]
	ldrh r2, [r4, #0x32]
	movs r0, #0
	movs r1, #0
	bl BG_SetPosition
	ldrh r2, [r4, #0x32]
	movs r0, #1
	movs r1, #0
	bl BG_SetPosition
	ldr r0, _0807F350  @ gUnknown_03004980
	ldr r2, [r0]
	ldrh r1, [r4, #0x32]
	movs r0, #0x20
	subs r0, r0, r1
	strh r0, [r2, #0x36]
	movs r0, #0x32
	ldrsh r1, [r4, r0]
	movs r0, #0x30
	negs r0, r0
	cmp r1, r0
	blt _0807F348
	adds r0, r4, #0
	bl Proc_Break
_0807F348:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807F350: .4byte gUnknown_03004980

	THUMB_FUNC_END sub_807F30C

	THUMB_FUNC_START sub_807F354
sub_807F354: @ 0x0807F354
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x32]
	subs r0, #8
	strh r0, [r4, #0x32]
	ldrh r2, [r4, #0x32]
	movs r0, #0
	movs r1, #0
	bl BG_SetPosition
	ldrh r2, [r4, #0x32]
	movs r0, #1
	movs r1, #0
	bl BG_SetPosition
	ldr r0, _0807F398  @ gUnknown_03004980
	ldr r2, [r0]
	ldrh r1, [r4, #0x32]
	movs r0, #0x20
	subs r0, r0, r1
	strh r0, [r2, #0x36]
	movs r0, #0x32
	ldrsh r1, [r4, r0]
	movs r0, #0x90
	negs r0, r0
	cmp r1, r0
	bgt _0807F390
	adds r0, r4, #0
	bl Proc_Break
_0807F390:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807F398: .4byte gUnknown_03004980

	THUMB_FUNC_END sub_807F354

	THUMB_FUNC_START sub_807F39C
sub_807F39C: @ 0x0807F39C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r7, r0, #0
	adds r1, r7, #0
	adds r1, #0x31
	ldrb r0, [r1]
	cmp r0, #0
	beq _0807F3B4
	subs r0, #1
	b _0807F466
_0807F3B4:
	adds r0, r7, #0
	adds r0, #0x30
	ldrb r6, [r0]
	mov r8, r0
	b _0807F3C0
_0807F3BE:
	adds r6, #1
_0807F3C0:
	cmp r6, #8
	ble _0807F3CC
	adds r0, r7, #0
	bl Proc_Break
	b _0807F468
_0807F3CC:
	movs r1, #0x2e
	ldrsh r0, [r7, r1]
	adds r1, r6, #0
	bl GetSomeStatUp
	cmp r0, #0
	beq _0807F3BE
	movs r1, #0x2e
	ldrsh r0, [r7, r1]
	movs r1, #1
	str r1, [sp]
	movs r2, #1
	adds r3, r6, #0
	bl sub_807EBA4
	movs r0, #1
	bl BG_EnableSyncByMask
	ldr r1, _0807F43C  @ gUnknown_089A3ED4
	lsls r0, r6, #1
	adds r0, r0, r6
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r5, [r0]
	lsls r5, r5, #3
	adds r5, #0x3e
	ldrb r4, [r0, #1]
	lsls r4, r4, #3
	movs r1, #0x32
	ldrsh r0, [r7, r1]
	subs r0, #0x17
	subs r4, r4, r0
	movs r1, #0x2e
	ldrsh r0, [r7, r1]
	adds r1, r6, #0
	bl GetSomeStatUp
	adds r3, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	adds r2, r6, #0
	bl sub_807EE84
	cmp r6, #0
	bne _0807F448
	ldr r0, _0807F440  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0807F45A
	ldr r0, _0807F444  @ 0x000002CD
	bl m4aSongNumStart
	b _0807F45A
	.align 2, 0
_0807F43C: .4byte gUnknown_089A3ED4
_0807F440: .4byte gRAMChapterData
_0807F444: .4byte 0x000002CD
_0807F448:
	ldr r0, _0807F474  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0807F45A
	movs r0, #0x76
	bl m4aSongNumStart
_0807F45A:
	adds r0, r6, #1
	mov r1, r8
	strb r0, [r1]
	adds r1, r7, #0
	adds r1, #0x31
	movs r0, #0x14
_0807F466:
	strb r0, [r1]
_0807F468:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807F474: .4byte gRAMChapterData

	THUMB_FUNC_END sub_807F39C

	THUMB_FUNC_START sub_807F478
sub_807F478: @ 0x0807F478
	push {lr}
	adds r3, r0, #0
	movs r0, #0x80
	lsls r0, r0, #1
	movs r1, #0x80
	movs r2, #0x10
	bl ISuspectThisToBeMusicRelated_8002730
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_807F478

	THUMB_FUNC_START sub_807F48C
sub_807F48C: @ 0x0807F48C
	push {r4, r5, lr}
	sub sp, #8
	adds r4, r0, #0
	ldr r0, _0807F520  @ gUnknown_089AC794
	ldr r1, _0807F524  @ 0x06013800
	bl CopyDataWithPossibleUncomp
	ldr r0, _0807F528  @ gUnknown_089AC9A8
	movs r1, #0x98
	lsls r1, r1, #2
	movs r2, #0x60
	bl CopyToPaletteBuffer
	ldr r2, _0807F52C  @ gUnknown_0203E1F0
	movs r0, #0x2e
	ldrsh r1, [r4, r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r3, [r0]
	movs r1, #0x10
	ldrsb r1, [r3, r1]
	ldr r2, _0807F530  @ gUnknown_0202BCB0
	ldrh r0, [r2, #0xc]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x14
	subs r1, r1, r0
	lsls r5, r1, #1
	lsls r1, r1, #4
	adds r4, r1, #0
	adds r4, #0x10
	movs r1, #0x11
	ldrsb r1, [r3, r1]
	ldrh r0, [r2, #0xe]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x14
	subs r1, r1, r0
	lsls r0, r1, #1
	lsls r1, r1, #4
	adds r2, r1, #0
	subs r2, #8
	cmp r0, #3
	bgt _0807F4E6
	adds r2, #0x20
_0807F4E6:
	cmp r5, #3
	bgt _0807F4EC
	movs r4, #0x30
_0807F4EC:
	cmp r5, #0x19
	ble _0807F4F2
	movs r4, #0xd0
_0807F4F2:
	ldr r0, _0807F534  @ gUnknown_089A5A6C
	movs r3, #0xc7
	lsls r3, r3, #6
	movs r1, #0
	str r1, [sp]
	movs r1, #2
	str r1, [sp, #4]
	adds r1, r4, #0
	bl APProc_Create
	ldr r0, _0807F538  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0807F518
	movs r0, #0x5b
	bl m4aSongNumStart
_0807F518:
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807F520: .4byte gUnknown_089AC794
_0807F524: .4byte 0x06013800
_0807F528: .4byte gUnknown_089AC9A8
_0807F52C: .4byte gUnknown_0203E1F0
_0807F530: .4byte gUnknown_0202BCB0
_0807F534: .4byte gUnknown_089A5A6C
_0807F538: .4byte gRAMChapterData

	THUMB_FUNC_END sub_807F48C

	THUMB_FUNC_START sub_807F53C
sub_807F53C: @ 0x0807F53C
	push {lr}
	bl APProc_DeleteAll
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_807F53C

	THUMB_FUNC_START sub_807F548
sub_807F548: @ 0x0807F548
	push {lr}
	adds r3, r0, #0
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #0x80
	movs r2, #0x10
	bl ISuspectThisToBeMusicRelated_8002730
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_807F548

	THUMB_FUNC_START sub_807F55C
sub_807F55C: @ 0x0807F55C
	push {lr}
	bl sub_8010E50
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_807F55C

	THUMB_FUNC_START sub_807F568
sub_807F568: @ 0x0807F568
	push {lr}
	adds r1, r0, #0
	cmp r1, #0
	beq _0807F57C
	ldr r0, _0807F578  @ gUnknown_089A4034
	bl Proc_StartBlocking
	b _0807F584
	.align 2, 0
_0807F578: .4byte gUnknown_089A4034
_0807F57C:
	ldr r0, _0807F588  @ gUnknown_089A4034
	movs r1, #3
	bl Proc_Start
_0807F584:
	pop {r0}
	bx r0
	.align 2, 0
_0807F588: .4byte gUnknown_089A4034

	THUMB_FUNC_END sub_807F568

	THUMB_FUNC_START sub_807F58C
sub_807F58C: @ 0x0807F58C
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _0807F5BC  @ gUnknown_02022968
	ldr r1, _0807F5C0  @ gUnknown_03005110
	movs r2, #0x50
	bl CpuFastSet
	movs r4, #0
_0807F59C:
	adds r1, r4, #6
	ldr r0, _0807F5C4  @ gUnknown_0859A120
	movs r2, #0x3c
	adds r3, r5, #0
	bl sub_8013928
	movs r1, #0xf
	bl sub_8013998
	adds r4, #1
	cmp r4, #9
	ble _0807F59C
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807F5BC: .4byte gUnknown_02022968
_0807F5C0: .4byte gUnknown_03005110
_0807F5C4: .4byte gUnknown_0859A120

	THUMB_FUNC_END sub_807F58C

	THUMB_FUNC_START sub_807F5C8
sub_807F5C8: @ 0x0807F5C8
	push {lr}
	adds r1, r0, #0
	cmp r1, #0
	beq _0807F5DC
	ldr r0, _0807F5D8  @ gUnknown_089A404C
	bl Proc_StartBlocking
	b _0807F5E4
	.align 2, 0
_0807F5D8: .4byte gUnknown_089A404C
_0807F5DC:
	ldr r0, _0807F5E8  @ gUnknown_089A404C
	movs r1, #3
	bl Proc_Start
_0807F5E4:
	pop {r0}
	bx r0
	.align 2, 0
_0807F5E8: .4byte gUnknown_089A404C

	THUMB_FUNC_END sub_807F5C8

	THUMB_FUNC_START sub_807F5EC
sub_807F5EC: @ 0x0807F5EC
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	movs r4, #0
	ldr r5, _0807F610  @ gUnknown_03005110
_0807F5F4:
	adds r1, r4, #6
	adds r0, r5, #0
	movs r2, #0xf
	adds r3, r6, #0
	bl sub_8013928
	adds r5, #0x20
	adds r4, #1
	cmp r4, #9
	ble _0807F5F4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807F610: .4byte gUnknown_03005110

	THUMB_FUNC_END sub_807F5EC

	THUMB_FUNC_START NewBG0Shaker
NewBG0Shaker: @ 0x0807F614
	push {lr}
	ldr r0, _0807F624  @ gUnknown_089A4064
	movs r1, #3
	bl Proc_Start
	pop {r0}
	bx r0
	.align 2, 0
_0807F624: .4byte gUnknown_089A4064

	THUMB_FUNC_END NewBG0Shaker

	THUMB_FUNC_START BG0Shaker_Init
BG0Shaker_Init: @ 0x0807F628
	adds r0, #0x64
	movs r1, #0
	strh r1, [r0]
	bx lr

	THUMB_FUNC_END BG0Shaker_Init

	THUMB_FUNC_START BG0Shaker_Loop
BG0Shaker_Loop: @ 0x0807F630
	push {r4, r5, lr}
	adds r5, r0, #0
	bl AdvanceGetLCGRNValue
	movs r1, #9
	bl DivRem
	adds r4, r0, #0
	subs r4, #4
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	bl AdvanceGetLCGRNValue
	movs r1, #9
	bl DivRem
	adds r2, r0, #0
	subs r2, #4
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #0
	adds r1, r4, #0
	bl BG_SetPosition
	bl AdvanceGetLCGRNValue
	movs r1, #9
	bl DivRem
	adds r4, r0, #0
	subs r4, #4
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	bl AdvanceGetLCGRNValue
	movs r1, #9
	bl DivRem
	adds r2, r0, #0
	subs r2, #4
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #1
	adds r1, r4, #0
	bl BG_SetPosition
	adds r2, r5, #0
	adds r2, #0x64
	ldrh r0, [r2]
	adds r1, r0, #1
	strh r1, [r2]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xf
	ble _0807F6B8
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	adds r0, r5, #0
	bl Proc_Break
_0807F6B8:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END BG0Shaker_Loop

	THUMB_FUNC_START LoadSparkGfx
LoadSparkGfx: @ 0x0807F6C0
	push {lr}
	ldr r0, _0807F6DC  @ gUnknown_089AE7A4
	ldr r1, _0807F6E0  @ 0x06013800
	bl CopyDataWithPossibleUncomp
	ldr r0, _0807F6E4  @ gUnknown_089AE7C4
	movs r1, #0xa0
	lsls r1, r1, #2
	movs r2, #0x20
	bl CopyToPaletteBuffer
	pop {r0}
	bx r0
	.align 2, 0
_0807F6DC: .4byte gUnknown_089AE7A4
_0807F6E0: .4byte 0x06013800
_0807F6E4: .4byte gUnknown_089AE7C4

	THUMB_FUNC_END LoadSparkGfx

	THUMB_FUNC_START sub_807F6E8
sub_807F6E8: @ 0x0807F6E8
	push {lr}
	adds r2, r1, #0
	movs r1, #4
	negs r1, r1
	cmp r0, r1
	blt _0807F714
	cmp r0, #0xeb
	bgt _0807F714
	cmp r2, r1
	blt _0807F714
	cmp r2, #0x9b
	bgt _0807F714
	subs r0, #4
	ldr r1, _0807F718  @ 0x000001FF
	ands r0, r1
	subs r1, r2, #4
	movs r2, #0xff
	ands r1, r2
	ldr r2, _0807F71C  @ gObject_8x8
	ldr r3, _0807F720  @ 0x000041C0
	bl CallARM_PushToSecondaryOAM
_0807F714:
	pop {r0}
	bx r0
	.align 2, 0
_0807F718: .4byte 0x000001FF
_0807F71C: .4byte gObject_8x8
_0807F720: .4byte 0x000041C0

	THUMB_FUNC_END sub_807F6E8

	THUMB_FUNC_START sub_807F724
sub_807F724: @ 0x0807F724
	push {r4, r5, r6, lr}
	ldr r5, _0807F754  @ gSinLookup
	movs r4, #0xff
	ands r3, r4
	lsls r4, r3, #1
	adds r4, r4, r5
	movs r6, #0
	ldrsh r4, [r4, r6]
	muls r4, r2, r4
	asrs r4, r4, #0xc
	adds r0, r0, r4
	adds r3, #0x40
	lsls r3, r3, #1
	adds r3, r3, r5
	movs r4, #0
	ldrsh r3, [r3, r4]
	muls r2, r3, r2
	asrs r2, r2, #0xc
	adds r1, r1, r2
	bl sub_807F6E8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807F754: .4byte gSinLookup

	THUMB_FUNC_END sub_807F724

	THUMB_FUNC_START sub_807F758
sub_807F758: @ 0x0807F758
	push {r4, lr}
	adds r4, r0, #0
	bl LoadSparkGfx
	movs r2, #0
	movs r3, #0x10
	ldr r1, _0807F784  @ gUnknown_03005090
_0807F766:
	strh r3, [r1]
	lsls r0, r2, #8
	strh r0, [r1, #2]
	adds r1, #8
	adds r2, #1
	cmp r2, #0xf
	ble _0807F766
	movs r0, #0
	strh r0, [r4, #0x36]
	strh r0, [r4, #0x38]
	ldrh r0, [r4, #0x3c]
	strh r0, [r4, #0x3a]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807F784: .4byte gUnknown_03005090

	THUMB_FUNC_END sub_807F758

	THUMB_FUNC_START sub_807F788
sub_807F788: @ 0x0807F788
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r5, r0, #0
	movs r0, #0x2e
	ldrsh r1, [r5, r0]
	movs r0, #0x30
	ldrsh r2, [r5, r0]
	ldrh r3, [r5, #0x3a]
	ldrh r0, [r5, #0x3e]
	str r0, [sp]
	movs r0, #5
	bl sub_8012DCC
	lsls r0, r0, #4
	strh r0, [r5, #0x36]
	asrs r0, r0, #1
	strh r0, [r5, #0x38]
	ldr r6, _0807F7F4  @ gUnknown_03005090
	movs r7, #0xf
_0807F7AE:
	movs r1, #0x2a
	ldrsh r0, [r5, r1]
	movs r2, #0x2c
	ldrsh r1, [r5, r2]
	ldrh r2, [r5, #0x36]
	ldrh r3, [r6]
	adds r2, r2, r3
	asrs r2, r2, #4
	ldrh r3, [r5, #0x38]
	ldrh r4, [r6, #2]
	adds r3, r3, r4
	asrs r3, r3, #4
	bl sub_807F724
	adds r6, #8
	subs r7, #1
	cmp r7, #0
	bge _0807F7AE
	ldrh r0, [r5, #0x3a]
	adds r0, #1
	strh r0, [r5, #0x3a]
	adds r1, r5, #0
	adds r1, #0x40
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r1, [r1]
	cmp r0, r1
	bls _0807F7EC
	adds r0, r5, #0
	bl Proc_Break
_0807F7EC:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807F7F4: .4byte gUnknown_03005090

	THUMB_FUNC_END sub_807F788

	THUMB_FUNC_START StartStarRotationEffect
StartStarRotationEffect: @ 0x0807F7F8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	mov r8, r3
	ldr r7, [sp, #0x18]
	ldr r0, _0807F834  @ gUnknown_089A407C
	movs r1, #3
	bl Proc_Start
	strh r4, [r0, #0x2a]
	strh r5, [r0, #0x2c]
	strh r6, [r0, #0x2e]
	mov r1, r8
	strh r1, [r0, #0x30]
	strh r7, [r0, #0x3c]
	mov r2, sp
	ldrh r2, [r2, #0x1c]
	strh r2, [r0, #0x3e]
	adds r0, #0x40
	mov r1, sp
	ldrh r1, [r1, #0x20]
	strh r1, [r0]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807F834: .4byte gUnknown_089A407C

	THUMB_FUNC_END StartStarRotationEffect

	THUMB_FUNC_START StartStarExplosionEffect
StartStarExplosionEffect: @ 0x0807F838
	push {lr}
	sub sp, #0xc
	movs r2, #0
	str r2, [sp]
	movs r2, #0x50
	str r2, [sp, #4]
	movs r2, #0x28
	str r2, [sp, #8]
	movs r2, #1
	movs r3, #0xc8
	bl StartStarRotationEffect
	add sp, #0xc
	pop {r0}
	bx r0

	THUMB_FUNC_END StartStarExplosionEffect

	THUMB_FUNC_START StartStarImplosionEffect
StartStarImplosionEffect: @ 0x0807F858
	push {lr}
	sub sp, #0xc
	movs r2, #0
	str r2, [sp]
	movs r2, #0x3c
	str r2, [sp, #4]
	movs r2, #0x37
	str r2, [sp, #8]
	movs r2, #0xc8
	movs r3, #1
	bl StartStarRotationEffect
	add sp, #0xc
	pop {r0}
	bx r0

	THUMB_FUNC_END StartStarImplosionEffect

	THUMB_FUNC_START sub_807F878
sub_807F878: @ 0x0807F878
	push {lr}
	adds r1, r0, #0
	cmp r1, #0
	beq _0807F88C
	ldr r0, _0807F888  @ gUnknown_089A434C
	bl Proc_StartBlocking
	b _0807F894
	.align 2, 0
_0807F888: .4byte gUnknown_089A434C
_0807F88C:
	ldr r0, _0807F898  @ gUnknown_089A434C
	movs r1, #3
	bl Proc_Start
_0807F894:
	pop {r0}
	bx r0
	.align 2, 0
_0807F898: .4byte gUnknown_089A434C

	THUMB_FUNC_END sub_807F878

	THUMB_FUNC_START sub_807F89C
sub_807F89C: @ 0x0807F89C
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r2, _0807F960  @ gLCDControlBuffer
	ldrb r3, [r2, #0xc]
	movs r1, #4
	negs r1, r1
	adds r0, r1, #0
	ands r0, r3
	strb r0, [r2, #0xc]
	ldrb r3, [r2, #0x10]
	adds r0, r1, #0
	ands r0, r3
	strb r0, [r2, #0x10]
	ldrb r3, [r2, #0x14]
	adds r0, r1, #0
	ands r0, r3
	strb r0, [r2, #0x14]
	ldrb r0, [r2, #0x18]
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	strb r1, [r2, #0x18]
	ldrb r1, [r2, #1]
	movs r0, #2
	negs r0, r0
	ands r0, r1
	movs r1, #3
	negs r1, r1
	ands r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #9
	negs r1, r1
	ands r0, r1
	subs r1, #8
	ands r0, r1
	strb r0, [r2, #1]
	adds r4, r2, #0
	adds r4, #0x34
	ldrb r3, [r4]
	subs r1, #0x10
	adds r0, r1, #0
	ands r0, r3
	strb r0, [r4]
	adds r2, #0x35
	ldrb r0, [r2]
	ands r1, r0
	strb r1, [r2]
	movs r4, #0
	str r4, [sp]
	movs r0, #1
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl sub_8001ED0
	movs r0, #0
	bl sub_8001F48
	str r4, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #1
	movs r3, #0
	bl sub_8001F0C
	movs r0, #1
	bl sub_8001F64
	movs r0, #1
	movs r1, #0x10
	movs r2, #0x10
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	adds r0, r5, #0
	adds r0, #0x40
	strh r4, [r0]
	adds r0, #2
	strh r4, [r0]
	adds r0, #2
	strh r4, [r0]
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807F960: .4byte gLCDControlBuffer

	THUMB_FUNC_END sub_807F89C

	THUMB_FUNC_START sub_807F964
sub_807F964: @ 0x0807F964
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r7, r0, #0
	adds r3, r7, #0
	adds r3, #0x42
	ldrh r2, [r3]
	cmp r2, #0
	bne _0807FA6E
	adds r0, #0x40
	ldrh r1, [r0]
	adds r6, r0, #0
	cmp r1, #0
	bne _0807F990
	movs r0, #0xa0
	lsls r0, r0, #1
	ldr r1, [r7, #0x30]
	bl PlaySpacialSoundMaybe
	b _0807F9C8
_0807F990:
	cmp r1, #0x13
	bls _0807F9C8
	strh r2, [r6]
	strh r2, [r3]
	adds r1, r7, #0
	adds r1, #0x44
	movs r0, #1
	strh r0, [r1]
	ldr r2, _0807F9C4  @ gLCDControlBuffer
	ldrb r1, [r2, #1]
	subs r0, #3
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
	adds r0, r7, #0
	bl Proc_Break
	b _0807FA78
	.align 2, 0
_0807F9C4: .4byte gLCDControlBuffer
_0807F9C8:
	ldr r0, _0807FA88  @ gUnknown_089A40AC
	mov r9, r0
	ldrh r1, [r6]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	add r0, r9
	ldr r0, [r0]
	ldr r1, _0807FA8C  @ gUnknown_08205884
	mov r8, r1
	adds r5, r7, #0
	adds r5, #0x44
	ldrh r1, [r5]
	lsls r1, r1, #2
	add r1, r8
	ldr r1, [r1]
	lsls r1, r1, #5
	movs r2, #0xc0
	lsls r2, r2, #0x13
	adds r1, r1, r2
	bl CopyDataWithPossibleUncomp
	ldrh r1, [r6]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	mov r1, r9
	adds r1, #8
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r4, _0807FA90  @ gUnknown_02020188
	adds r1, r4, #0
	bl CopyDataWithPossibleUncomp
	ldr r0, _0807FA94  @ gBG2TilemapBuffer
	ldrh r3, [r5]
	lsls r1, r3, #2
	add r1, r8
	ldr r2, [r1]
	ldr r1, _0807FA98  @ gUnknown_0820588C
	mov r8, r1
	add r3, r8
	ldrb r1, [r3]
	lsls r1, r1, #0xc
	orrs r2, r1
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	str r2, [sp]
	adds r1, r4, #0
	movs r2, #0
	movs r3, #0
	bl sub_800159C
	movs r0, #4
	bl BG_EnableSyncByMask
	ldrh r1, [r6]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r2, _0807FA9C  @ gUnknown_089A40B0
	adds r0, r0, r2
	ldr r0, [r0]
	ldrh r1, [r5]
	add r1, r8
	ldrb r1, [r1]
	lsls r1, r1, #5
	movs r2, #0x20
	bl CopyToPaletteBuffer
	bl EnablePaletteSync
	ldrh r0, [r6]
	adds r0, #1
	strh r0, [r6]
	adds r1, r7, #0
	adds r1, #0x42
	movs r0, #3
	strh r0, [r1]
	ldrh r0, [r5]
	movs r1, #1
	eors r0, r1
	strh r0, [r5]
_0807FA6E:
	adds r1, r7, #0
	adds r1, #0x42
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
_0807FA78:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807FA88: .4byte gUnknown_089A40AC
_0807FA8C: .4byte gUnknown_08205884
_0807FA90: .4byte gUnknown_02020188
_0807FA94: .4byte gBG2TilemapBuffer
_0807FA98: .4byte gUnknown_0820588C
_0807FA9C: .4byte gUnknown_089A40B0

	THUMB_FUNC_END sub_807F964

	THUMB_FUNC_START sub_807FAA0
sub_807FAA0: @ 0x0807FAA0
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r7, r0, #0
	adds r0, #0x42
	ldrh r0, [r0]
	cmp r0, #0
	bne _0807FBAE
	ldr r4, _0807FB70  @ gUnknown_089A419C
	adds r5, r7, #0
	adds r5, #0x40
	ldrh r1, [r5]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r0, [r0]
	ldr r1, _0807FB74  @ gUnknown_08205884
	mov r9, r1
	adds r6, r7, #0
	adds r6, #0x44
	ldrh r1, [r6]
	lsls r1, r1, #2
	add r1, r9
	ldr r1, [r1]
	lsls r1, r1, #5
	movs r2, #0xc0
	lsls r2, r2, #0x13
	adds r1, r1, r2
	bl CopyDataWithPossibleUncomp
	ldrh r1, [r5]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r1, r4, #0
	adds r1, #8
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r1, _0807FB78  @ gUnknown_02020188
	mov r8, r1
	bl CopyDataWithPossibleUncomp
	ldr r0, _0807FB7C  @ gBG2TilemapBuffer
	ldrh r3, [r6]
	lsls r1, r3, #2
	add r1, r9
	ldr r2, [r1]
	ldr r1, _0807FB80  @ gUnknown_0820588C
	mov r9, r1
	add r3, r9
	ldrb r1, [r3]
	lsls r1, r1, #0xc
	orrs r2, r1
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	str r2, [sp]
	mov r1, r8
	movs r2, #0
	movs r3, #0
	bl sub_800159C
	movs r0, #4
	bl BG_EnableSyncByMask
	ldrh r1, [r5]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r4, #4
	adds r0, r0, r4
	ldr r0, [r0]
	ldrh r1, [r6]
	add r1, r9
	ldrb r1, [r1]
	lsls r1, r1, #5
	movs r2, #0x20
	bl CopyToPaletteBuffer
	bl EnablePaletteSync
	ldrh r0, [r5]
	cmp r0, #0
	bne _0807FB88
	ldr r2, _0807FB84  @ gLCDControlBuffer
	ldrb r1, [r2, #1]
	movs r0, #2
	negs r0, r0
	ands r0, r1
	movs r1, #3
	negs r1, r1
	ands r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #9
	negs r1, r1
	ands r0, r1
	subs r1, #8
	ands r0, r1
	strb r0, [r2, #1]
	b _0807FB92
	.align 2, 0
_0807FB70: .4byte gUnknown_089A419C
_0807FB74: .4byte gUnknown_08205884
_0807FB78: .4byte gUnknown_02020188
_0807FB7C: .4byte gBG2TilemapBuffer
_0807FB80: .4byte gUnknown_0820588C
_0807FB84: .4byte gLCDControlBuffer
_0807FB88:
	cmp r0, #0x16
	bls _0807FB92
	adds r0, r7, #0
	bl Proc_Break
_0807FB92:
	ldr r1, _0807FBC8  @ gUnknown_0820588E
	ldrh r0, [r5]
	adds r0, r0, r1
	ldrb r0, [r0]
	adds r1, r7, #0
	adds r1, #0x42
	strh r0, [r1]
	ldrh r0, [r5]
	adds r0, #1
	strh r0, [r5]
	ldrh r0, [r6]
	movs r1, #1
	eors r0, r1
	strh r0, [r6]
_0807FBAE:
	adds r1, r7, #0
	adds r1, #0x42
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807FBC8: .4byte gUnknown_0820588E

	THUMB_FUNC_END sub_807FAA0

	THUMB_FUNC_START sub_807FBCC
sub_807FBCC: @ 0x0807FBCC
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	adds r6, r5, #0
	adds r6, #0x42
	ldrh r4, [r6]
	cmp r4, #0
	bne _0807FC30
	adds r0, #0x40
	strh r4, [r0]
	movs r0, #1
	negs r0, r0
	str r0, [sp]
	ldr r1, _0807FC40  @ 0x06005FE0
	ldr r2, _0807FC44  @ 0x01000008
	mov r0, sp
	bl CpuFastSet
	ldr r0, _0807FC48  @ gBG0TilemapBuffer
	ldr r3, _0807FC4C  @ 0x000032FF
	movs r1, #0x1e
	movs r2, #0x14
	bl TileMap_FillRect
	movs r0, #1
	bl BG_EnableSyncByMask
	ldr r0, _0807FC50  @ gPaletteBuffer
	adds r0, #0x7e
	strh r4, [r0]
	bl EnablePaletteSync
	ldr r2, _0807FC54  @ gLCDControlBuffer
	ldrb r0, [r2, #1]
	movs r1, #1
	orrs r0, r1
	movs r1, #3
	negs r1, r1
	ands r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #9
	negs r1, r1
	ands r0, r1
	subs r1, #8
	ands r0, r1
	strb r0, [r2, #1]
	adds r0, r5, #0
	bl Proc_Break
_0807FC30:
	ldrh r0, [r6]
	subs r0, #1
	strh r0, [r6]
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807FC40: .4byte 0x06005FE0
_0807FC44: .4byte 0x01000008
_0807FC48: .4byte gBG0TilemapBuffer
_0807FC4C: .4byte 0x000032FF
_0807FC50: .4byte gPaletteBuffer
_0807FC54: .4byte gLCDControlBuffer

	THUMB_FUNC_END sub_807FBCC

	THUMB_FUNC_START sub_807FC58
sub_807FC58: @ 0x0807FC58
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x40
	ldrh r1, [r0]
	lsls r0, r1, #0x12
	lsrs r2, r0, #0x10
	cmp r1, #7
	bhi _0807FC7C
	ldr r0, _0807FC78  @ gPaletteBuffer
	lsls r1, r2, #5
	orrs r1, r2
	lsls r2, r2, #0xa
	orrs r1, r2
	adds r0, #0x7e
	strh r1, [r0]
	b _0807FC8A
	.align 2, 0
_0807FC78: .4byte gPaletteBuffer
_0807FC7C:
	ldr r0, _0807FCA0  @ gPaletteBuffer
	adds r0, #0x7e
	ldr r1, _0807FCA4  @ 0x00007FFF
	strh r1, [r0]
	adds r0, r4, #0
	bl Proc_Break
_0807FC8A:
	bl EnablePaletteSync
	adds r1, r4, #0
	adds r1, #0x40
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807FCA0: .4byte gPaletteBuffer
_0807FCA4: .4byte 0x00007FFF

	THUMB_FUNC_END sub_807FC58

	THUMB_FUNC_START sub_807FCA8
sub_807FCA8: @ 0x0807FCA8
	push {lr}
	ldr r0, _0807FCBC  @ gBG2TilemapBuffer
	movs r1, #0
	bl BG_Fill
	movs r0, #4
	bl BG_EnableSyncByMask
	pop {r0}
	bx r0
	.align 2, 0
_0807FCBC: .4byte gBG2TilemapBuffer

	THUMB_FUNC_END sub_807FCA8

	THUMB_FUNC_START sub_807FCC0
sub_807FCC0: @ 0x0807FCC0
	push {lr}
	adds r1, r0, #0
	cmp r1, #0
	beq _0807FCD4
	ldr r0, _0807FCD0  @ gUnknown_089A4394
	bl Proc_StartBlocking
	b _0807FCDC
	.align 2, 0
_0807FCD0: .4byte gUnknown_089A4394
_0807FCD4:
	ldr r0, _0807FCE0  @ gUnknown_089A4394
	movs r1, #3
	bl Proc_Start
_0807FCDC:
	pop {r0}
	bx r0
	.align 2, 0
_0807FCE0: .4byte gUnknown_089A4394

	THUMB_FUNC_END sub_807FCC0

	THUMB_FUNC_START sub_807FCE4
sub_807FCE4: @ 0x0807FCE4
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r2, _0807FDBC  @ gLCDControlBuffer
	ldrb r3, [r2, #0xc]
	movs r1, #4
	negs r1, r1
	adds r0, r1, #0
	ands r0, r3
	strb r0, [r2, #0xc]
	ldrb r3, [r2, #0x10]
	adds r0, r1, #0
	ands r0, r3
	strb r0, [r2, #0x10]
	ldrb r3, [r2, #0x14]
	adds r0, r1, #0
	ands r0, r3
	strb r0, [r2, #0x14]
	ldrb r0, [r2, #0x18]
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	strb r1, [r2, #0x18]
	ldrb r0, [r2, #1]
	movs r1, #1
	orrs r0, r1
	movs r1, #3
	negs r1, r1
	ands r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2, #1]
	adds r4, r2, #0
	adds r4, #0x34
	ldrb r3, [r4]
	movs r1, #0x21
	negs r1, r1
	adds r0, r1, #0
	ands r0, r3
	strb r0, [r4]
	adds r2, #0x35
	ldrb r0, [r2]
	ands r1, r0
	strb r1, [r2]
	movs r4, #0
	str r4, [sp]
	movs r0, #1
	movs r1, #0
	movs r2, #1
	movs r3, #0
	bl sub_8001ED0
	movs r0, #0
	bl sub_8001F48
	movs r0, #1
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #1
	bl sub_8001F0C
	movs r0, #1
	bl sub_8001F64
	movs r0, #1
	movs r1, #0x10
	movs r2, #0x10
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	ldr r0, _0807FDC0  @ gPaletteBuffer
	adds r0, #0x7e
	ldr r1, _0807FDC4  @ 0x00007FFF
	strh r1, [r0]
	bl EnablePaletteSync
	adds r0, r5, #0
	adds r0, #0x40
	strh r4, [r0]
	adds r0, #2
	strh r4, [r0]
	adds r0, #2
	strh r4, [r0]
	adds r1, r5, #0
	adds r1, #0x48
	movs r0, #0x77
	strh r0, [r1]
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807FDBC: .4byte gLCDControlBuffer
_0807FDC0: .4byte gPaletteBuffer
_0807FDC4: .4byte 0x00007FFF

	THUMB_FUNC_END sub_807FCE4

	THUMB_FUNC_START sub_807FDC8
sub_807FDC8: @ 0x0807FDC8
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r5, #0
	adds r4, #0x48
	movs r1, #0
	ldrsh r0, [r4, r1]
	lsls r0, r0, #5
	movs r1, #0x78
	bl __divsi3
	ldr r2, _0807FE08  @ gPaletteBuffer
	lsls r1, r0, #5
	orrs r1, r0
	lsls r0, r0, #0xa
	orrs r1, r0
	adds r2, #0x7e
	strh r1, [r2]
	bl EnablePaletteSync
	ldrh r0, [r4]
	subs r0, #1
	strh r0, [r4]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x1e
	bgt _0807FE02
	adds r0, r5, #0
	bl Proc_Break
_0807FE02:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807FE08: .4byte gPaletteBuffer

	THUMB_FUNC_END sub_807FDC8

	THUMB_FUNC_START sub_807FE0C
sub_807FE0C: @ 0x0807FE0C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r6, r0, #0
	adds r0, #0x42
	ldrh r2, [r0]
	cmp r2, #0
	bne _0807FF20
	subs r0, #2
	ldrh r1, [r0]
	mov r9, r0
	cmp r1, #0
	beq _0807FE3A
	cmp r1, #0xb
	bls _0807FE58
	strh r2, [r0]
	adds r0, r6, #0
	bl Proc_Break
	b _0807FFC4
_0807FE3A:
	ldr r2, _0807FFD4  @ gLCDControlBuffer
	ldrb r1, [r2, #1]
	movs r0, #2
	negs r0, r0
	ands r0, r1
	movs r1, #3
	negs r1, r1
	ands r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2, #1]
_0807FE58:
	ldr r0, _0807FFD8  @ gUnknown_089A42BC
	mov sl, r0
	mov r8, r9
	mov r2, r8
	ldrh r1, [r2]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	add r0, sl
	ldr r0, [r0]
	ldr r5, _0807FFDC  @ gUnknown_08205884
	adds r7, r6, #0
	adds r7, #0x44
	ldrh r1, [r7]
	lsls r1, r1, #2
	adds r1, r1, r5
	ldr r1, [r1]
	lsls r1, r1, #5
	movs r3, #0xc0
	lsls r3, r3, #0x13
	adds r1, r1, r3
	bl CopyDataWithPossibleUncomp
	mov r0, r8
	ldrh r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	mov r1, sl
	adds r1, #8
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r4, _0807FFE0  @ gUnknown_02020188
	adds r1, r4, #0
	bl CopyDataWithPossibleUncomp
	ldr r0, _0807FFE4  @ gBG2TilemapBuffer
	ldrh r3, [r7]
	lsls r1, r3, #2
	adds r1, r1, r5
	ldr r2, [r1]
	ldr r5, _0807FFE8  @ gUnknown_0820588C
	adds r3, r3, r5
	ldrb r1, [r3]
	lsls r1, r1, #0xc
	orrs r2, r1
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	str r2, [sp]
	adds r1, r4, #0
	movs r2, #0
	movs r3, #0
	bl sub_800159C
	movs r0, #4
	bl BG_EnableSyncByMask
	adds r0, r6, #0
	adds r0, #0x48
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bge _0807FEFA
	mov r2, r8
	ldrh r1, [r2]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	mov r1, sl
	adds r1, #4
	adds r0, r0, r1
	ldr r0, [r0]
	ldrh r1, [r7]
	adds r1, r1, r5
	ldrb r1, [r1]
	lsls r1, r1, #5
	movs r2, #0x20
	bl CopyToPaletteBuffer
	bl EnablePaletteSync
_0807FEFA:
	mov r3, r9
	ldrh r0, [r3]
	adds r1, r6, #0
	adds r1, #0x4a
	strh r0, [r1]
	ldrh r0, [r3]
	adds r0, #1
	strh r0, [r3]
	subs r1, #8
	movs r0, #4
	strh r0, [r1]
	ldrh r1, [r7]
	adds r0, r6, #0
	adds r0, #0x4c
	strh r1, [r0]
	ldrh r0, [r7]
	movs r1, #1
	eors r0, r1
	strh r0, [r7]
_0807FF20:
	adds r1, r6, #0
	adds r1, #0x42
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
	adds r0, r6, #0
	adds r0, #0x48
	movs r2, #0
	ldrsh r1, [r0, r2]
	mov r9, r0
	cmp r1, #0
	blt _0807FFC4
	adds r0, r1, #0
	lsls r0, r0, #5
	movs r1, #0xf0
	bl __divsi3
	adds r7, r0, #0
	ldr r2, _0807FFD8  @ gUnknown_089A42BC
	adds r0, r6, #0
	adds r0, #0x4a
	movs r3, #0
	ldrsh r1, [r0, r3]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r2, #4
	adds r0, r0, r2
	ldr r2, [r0]
	ldr r1, _0807FFE8  @ gUnknown_0820588C
	adds r0, r6, #0
	adds r0, #0x4c
	movs r3, #0
	ldrsh r0, [r0, r3]
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #5
	ldr r1, _0807FFEC  @ gPaletteBuffer
	adds r0, r0, r1
	movs r1, #0x1f
	mov r8, r1
	adds r5, r0, #2
	adds r2, #2
	movs r6, #0xe
_0807FF78:
	ldrh r0, [r2]
	movs r4, #0x1f
	ands r4, r0
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x15
	mov r1, r8
	ands r3, r1
	lsrs r1, r0, #0x1a
	mov r0, r8
	ands r1, r0
	adds r4, r4, r7
	cmp r4, #0x1f
	bls _0807FF94
	movs r4, #0x1f
_0807FF94:
	adds r3, r3, r7
	cmp r3, #0x1f
	bls _0807FF9C
	movs r3, #0x1f
_0807FF9C:
	adds r1, r1, r7
	cmp r1, #0x1f
	bls _0807FFA4
	movs r1, #0x1f
_0807FFA4:
	lsls r0, r3, #5
	orrs r4, r0
	lsls r0, r1, #0xa
	orrs r4, r0
	strh r4, [r5]
	adds r5, #2
	adds r2, #2
	subs r6, #1
	cmp r6, #0
	bge _0807FF78
	bl EnablePaletteSync
	mov r1, r9
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
_0807FFC4:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807FFD4: .4byte gLCDControlBuffer
_0807FFD8: .4byte gUnknown_089A42BC
_0807FFDC: .4byte gUnknown_08205884
_0807FFE0: .4byte gUnknown_02020188
_0807FFE4: .4byte gBG2TilemapBuffer
_0807FFE8: .4byte gUnknown_0820588C
_0807FFEC: .4byte gPaletteBuffer

	THUMB_FUNC_END sub_807FE0C

	THUMB_FUNC_START sub_807FFF0
sub_807FFF0: @ 0x0807FFF0
	push {lr}
	ldr r0, _0808000C  @ gBG0TilemapBuffer
	movs r1, #0
	bl BG_Fill
	ldr r0, _08080010  @ gBG2TilemapBuffer
	movs r1, #0
	bl BG_Fill
	movs r0, #5
	bl BG_EnableSyncByMask
	pop {r0}
	bx r0
	.align 2, 0
_0808000C: .4byte gBG0TilemapBuffer
_08080010: .4byte gBG2TilemapBuffer

	THUMB_FUNC_END sub_807FFF0

	THUMB_FUNC_START sub_8080014
sub_8080014: @ 0x08080014
	push {lr}
	adds r1, r0, #0
	cmp r1, #0
	beq _08080028
	ldr r0, _08080024  @ gUnknown_089A4434
	bl Proc_StartBlocking
	b _08080030
	.align 2, 0
_08080024: .4byte gUnknown_089A4434
_08080028:
	ldr r0, _08080034  @ gUnknown_089A4434
	movs r1, #3
	bl Proc_Start
_08080030:
	pop {r0}
	bx r0
	.align 2, 0
_08080034: .4byte gUnknown_089A4434

	THUMB_FUNC_END sub_8080014

	THUMB_FUNC_START sub_8080038
sub_8080038: @ 0x08080038
	push {lr}
	movs r0, #0
	bl SetSecondaryHBlankHandler
	ldr r0, _0808004C  @ gUnknown_089A448C
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
_0808004C: .4byte gUnknown_089A448C

	THUMB_FUNC_END sub_8080038

	THUMB_FUNC_START sub_8080050
sub_8080050: @ 0x08080050
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	ldr r2, _08080128  @ gLCDControlBuffer
	ldrb r3, [r2, #0xc]
	movs r1, #4
	negs r1, r1
	adds r0, r1, #0
	ands r0, r3
	strb r0, [r2, #0xc]
	ldrb r3, [r2, #0x10]
	adds r0, r1, #0
	ands r0, r3
	strb r0, [r2, #0x10]
	ldrb r3, [r2, #0x14]
	adds r0, r1, #0
	ands r0, r3
	strb r0, [r2, #0x14]
	ldrb r0, [r2, #0x18]
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	strb r1, [r2, #0x18]
	ldrb r1, [r2, #1]
	movs r0, #2
	negs r0, r0
	ands r0, r1
	movs r1, #3
	negs r1, r1
	ands r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2, #1]
	adds r4, r2, #0
	adds r4, #0x34
	ldrb r3, [r4]
	movs r1, #0x21
	negs r1, r1
	adds r0, r1, #0
	ands r0, r3
	strb r0, [r4]
	adds r2, #0x35
	ldrb r0, [r2]
	ands r1, r0
	strb r1, [r2]
	movs r5, #0
	str r5, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #1
	movs r3, #0
	bl sub_8001ED0
	movs r0, #0
	bl sub_8001F48
	movs r0, #1
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #1
	bl sub_8001F0C
	movs r0, #1
	bl sub_8001F64
	movs r0, #1
	movs r1, #0x10
	movs r2, #0x10
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	adds r0, r6, #0
	adds r0, #0x40
	movs r4, #0
	strh r5, [r0]
	adds r0, #2
	strh r5, [r0]
	adds r0, #2
	strh r5, [r0]
	ldr r0, _0808012C  @ gUnknown_03001C7C
	strb r4, [r0]
	ldr r0, _08080130  @ gUnknown_089A448C
	movs r1, #0
	bl Proc_Start
	adds r1, r0, #0
	adds r1, #0x29
	strb r4, [r1]
	adds r0, #0x2a
	strb r4, [r0]
	ldr r0, _08080134  @ sub_8080408
	bl SetSecondaryHBlankHandler
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08080128: .4byte gLCDControlBuffer
_0808012C: .4byte gUnknown_03001C7C
_08080130: .4byte gUnknown_089A448C
_08080134: .4byte sub_8080408

	THUMB_FUNC_END sub_8080050

	THUMB_FUNC_START sub_8080138
sub_8080138: @ 0x08080138
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	mov r9, r0
	adds r0, #0x42
	str r0, [sp, #4]
	ldrh r1, [r0]
	str r1, [sp, #8]
	cmp r1, #0
	beq _08080154
	b _0808026C
_08080154:
	mov r7, r9
	adds r7, #0x40
	ldrh r0, [r7]
	lsls r0, r0, #2
	ldr r2, _0808023C  @ gUnknown_082058B4
	adds r0, r0, r2
	ldrb r0, [r0]
	ldr r1, _08080240  @ gUnknown_089A43D4
	mov sl, r1
	lsls r4, r0, #1
	adds r4, r4, r0
	lsls r4, r4, #2
	adds r0, r4, r1
	ldr r0, [r0]
	ldr r2, _08080244  @ gUnknown_082058A8
	mov r8, r2
	mov r5, r9
	adds r5, #0x44
	ldrh r1, [r5]
	lsls r1, r1, #2
	add r1, r8
	ldr r1, [r1]
	lsls r1, r1, #5
	movs r2, #0xc0
	lsls r2, r2, #0x13
	adds r1, r1, r2
	bl CopyDataWithPossibleUncomp
	mov r0, sl
	adds r0, #8
	adds r0, r4, r0
	ldr r0, [r0]
	ldr r6, _08080248  @ gUnknown_02020188
	adds r1, r6, #0
	bl CopyDataWithPossibleUncomp
	ldr r0, _0808024C  @ gBG2TilemapBuffer
	ldrh r3, [r5]
	lsls r1, r3, #2
	add r1, r8
	ldr r2, [r1]
	ldr r1, _08080250  @ gUnknown_082058B0
	mov r8, r1
	add r3, r8
	ldrb r1, [r3]
	lsls r1, r1, #0xc
	orrs r2, r1
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	str r2, [sp]
	adds r1, r6, #0
	movs r2, #0
	movs r3, #0
	bl sub_800159C
	movs r0, #4
	bl BG_EnableSyncByMask
	ldr r2, _08080254  @ gUnknown_089A43D8
	adds r4, r4, r2
	ldr r0, [r4]
	ldrh r1, [r5]
	add r1, r8
	ldrb r1, [r1]
	lsls r1, r1, #5
	movs r2, #0x20
	bl CopyToPaletteBuffer
	bl EnablePaletteSync
	ldr r0, _08080258  @ gUnknown_089A448C
	bl Proc_Find
	adds r6, r0, #0
	adds r6, #0x29
	movs r1, #1
	mov r8, r1
	mov r2, r8
	strb r2, [r6]
	ldrh r1, [r7]
	lsls r1, r1, #2
	ldr r2, _0808023C  @ gUnknown_082058B4
	adds r1, r1, r2
	ldrb r1, [r1, #2]
	adds r4, r0, #0
	adds r4, #0x2a
	strb r1, [r4]
	ldrh r0, [r7]
	cmp r0, #0
	bne _08080212
	ldr r0, _0808025C  @ 0x0000013F
	mov r2, r9
	ldr r1, [r2, #0x30]
	bl PlaySpacialSoundMaybe
_08080212:
	ldrh r0, [r7]
	lsls r0, r0, #2
	ldr r1, _0808023C  @ gUnknown_082058B4
	adds r0, r0, r1
	ldrb r0, [r0, #1]
	ldr r2, [sp, #4]
	strh r0, [r2]
	ldrh r0, [r7]
	cmp r0, #6
	bls _08080260
	mov r0, r8
	strb r0, [r6]
	movs r0, #0
	strb r0, [r4]
	mov r1, sp
	ldrh r1, [r1, #8]
	strh r1, [r7]
	mov r0, r9
	bl Proc_Break
	b _0808026C
	.align 2, 0
_0808023C: .4byte gUnknown_082058B4
_08080240: .4byte gUnknown_089A43D4
_08080244: .4byte gUnknown_082058A8
_08080248: .4byte gUnknown_02020188
_0808024C: .4byte gBG2TilemapBuffer
_08080250: .4byte gUnknown_082058B0
_08080254: .4byte gUnknown_089A43D8
_08080258: .4byte gUnknown_089A448C
_0808025C: .4byte 0x0000013F
_08080260:
	adds r0, #1
	strh r0, [r7]
	ldrh r0, [r5]
	movs r1, #1
	eors r0, r1
	strh r0, [r5]
_0808026C:
	mov r1, r9
	adds r1, #0x42
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8080138

	THUMB_FUNC_START sub_8080288
sub_8080288: @ 0x08080288
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r5, r0, #0
	adds r1, r5, #0
	adds r1, #0x42
	ldrh r0, [r1]
	adds r6, r0, #0
	cmp r6, #0
	bne _08080378
	adds r4, r5, #0
	adds r4, #0x40
	ldrh r1, [r4]
	lsls r0, r1, #0x12
	lsrs r7, r0, #0x10
	mov r9, r4
	cmp r1, #7
	bhi _08080330
	movs r6, #1
	adds r5, #0x44
	mov r8, r5
	ldr r0, _08080328  @ gUnknown_082058B0
	mov sl, r0
	movs r1, #0x1f
	mov ip, r1
_080802C0:
	mov r1, r8
	ldrh r0, [r1]
	add r0, sl
	ldrb r0, [r0]
	lsls r0, r0, #4
	adds r0, r0, r6
	lsls r0, r0, #1
	ldr r1, _0808032C  @ gPaletteBuffer
	adds r5, r0, r1
	ldrh r1, [r5]
	adds r4, r1, #0
	movs r0, #0x1f
	ands r0, r1
	adds r0, r7, r0
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0x1f
	bls _080802E6
	movs r2, #0x1f
_080802E6:
	lsrs r0, r1, #5
	mov r1, ip
	ands r0, r1
	adds r0, r7, r0
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #0x1f
	bls _080802F8
	movs r3, #0x1f
_080802F8:
	lsrs r0, r4, #0xa
	mov r1, ip
	ands r0, r1
	adds r0, r7, r0
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #0x1f
	bls _0808030A
	movs r1, #0x1f
_0808030A:
	lsls r0, r3, #5
	orrs r2, r0
	lsls r0, r1, #0xa
	orrs r2, r0
	strh r2, [r5]
	adds r6, #1
	cmp r6, #0xf
	ble _080802C0
	bl EnablePaletteSync
	mov r1, r9
	ldrh r0, [r1]
	adds r0, #1
	b _0808037A
	.align 2, 0
_08080328: .4byte gUnknown_082058B0
_0808032C: .4byte gPaletteBuffer
_08080330:
	movs r0, #1
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #1
	bl sub_8001ED0
	movs r0, #2
	movs r1, #0x10
	movs r2, #0x10
	movs r3, #0x10
	bl SetSpecialColorEffectsParameters
	ldr r2, _08080374  @ gLCDControlBuffer
	ldrb r1, [r2, #1]
	movs r0, #2
	negs r0, r0
	ands r0, r1
	movs r1, #3
	negs r1, r1
	ands r0, r1
	subs r1, #2
	ands r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2, #1]
	strh r6, [r4]
	adds r0, r5, #0
	bl Proc_Break
	b _0808037C
	.align 2, 0
_08080374: .4byte gLCDControlBuffer
_08080378:
	subs r0, #1
_0808037A:
	strh r0, [r1]
_0808037C:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8080288

	THUMB_FUNC_START sub_808038C
sub_808038C: @ 0x0808038C
	push {r4, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x40
	ldrh r0, [r1]
	cmp r0, #0x81
	bhi _080803B6
	lsls r0, r0, #4
	movs r1, #0x82
	bl __divsi3
	movs r3, #0x10
	subs r3, r3, r0
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	movs r0, #2
	movs r1, #0x10
	movs r2, #0x10
	bl SetSpecialColorEffectsParameters
	b _080803C8
_080803B6:
	movs r0, #2
	movs r1, #0x10
	movs r2, #0x10
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	adds r0, r4, #0
	bl Proc_Break
_080803C8:
	adds r1, r4, #0
	adds r1, #0x40
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_808038C

	THUMB_FUNC_START sub_80803D8
sub_80803D8: @ 0x080803D8
	push {lr}
	ldr r0, _080803FC  @ gBG0TilemapBuffer
	movs r1, #0
	bl BG_Fill
	ldr r0, _08080400  @ gBG1TilemapBuffer
	movs r1, #0
	bl BG_Fill
	ldr r0, _08080404  @ gBG2TilemapBuffer
	movs r1, #0
	bl BG_Fill
	movs r0, #7
	bl BG_EnableSyncByMask
	pop {r0}
	bx r0
	.align 2, 0
_080803FC: .4byte gBG0TilemapBuffer
_08080400: .4byte gBG1TilemapBuffer
_08080404: .4byte gBG2TilemapBuffer

	THUMB_FUNC_END sub_80803D8

	THUMB_FUNC_START sub_8080408
sub_8080408: @ 0x08080408
	push {lr}
	ldr r0, _0808043C  @ gUnknown_03001C7C
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _08080438
	ldr r0, _08080440  @ 0x04000006
	ldrh r0, [r0]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0xe4
	bne _08080426
	movs r2, #0
_08080426:
	cmp r2, #0x9f
	bhi _08080438
	ldr r0, _08080444  @ 0x0400001A
	lsrs r1, r2, #1
	subs r1, r1, r2
	ldr r3, _08080448  @ 0x000001FF
	adds r2, r3, #0
	ands r1, r2
	strh r1, [r0]
_08080438:
	pop {r0}
	bx r0
	.align 2, 0
_0808043C: .4byte gUnknown_03001C7C
_08080440: .4byte 0x04000006
_08080444: .4byte 0x0400001A
_08080448: .4byte 0x000001FF

	THUMB_FUNC_END sub_8080408

	THUMB_FUNC_START sub_808044C
sub_808044C: @ 0x0808044C
	push {lr}
	adds r2, r0, #0
	adds r3, r2, #0
	adds r3, #0x29
	movs r0, #0
	ldrsb r0, [r3, r0]
	cmp r0, #0
	beq _0808046A
	ldr r1, _08080470  @ gUnknown_03001C7C
	adds r0, r2, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	strb r0, [r1]
	movs r0, #0
	strb r0, [r3]
_0808046A:
	pop {r0}
	bx r0
	.align 2, 0
_08080470: .4byte gUnknown_03001C7C

	THUMB_FUNC_END sub_808044C

	THUMB_FUNC_START sub_8080474
sub_8080474: @ 0x08080474
	push {lr}
	adds r1, r0, #0
	cmp r1, #0
	beq _08080488
	ldr r0, _08080484  @ gUnknown_089A45DC
	bl Proc_StartBlocking
	b _08080490
	.align 2, 0
_08080484: .4byte gUnknown_089A45DC
_08080488:
	ldr r0, _08080494  @ gUnknown_089A45DC
	movs r1, #3
	bl Proc_Start
_08080490:
	pop {r0}
	bx r0
	.align 2, 0
_08080494: .4byte gUnknown_089A45DC

	THUMB_FUNC_END sub_8080474

	THUMB_FUNC_START sub_8080498
sub_8080498: @ 0x08080498
	push {r4, r5, r6, lr}
	mov r6, r9
	mov r5, r8
	push {r5, r6}
	sub sp, #4
	adds r6, r1, #0
	ldr r1, _0808051C  @ gUnknown_089A44A4
	mov r8, r1
	lsls r5, r0, #1
	adds r5, r5, r0
	lsls r5, r5, #2
	adds r0, r5, r1
	ldr r0, [r0]
	ldr r2, _08080520  @ gUnknown_082058D4
	lsls r1, r6, #2
	adds r1, r1, r2
	ldr r4, [r1]
	lsls r1, r4, #5
	movs r2, #0xc0
	lsls r2, r2, #0x13
	adds r1, r1, r2
	bl CopyDataWithPossibleUncomp
	mov r0, r8
	adds r0, #8
	adds r0, r5, r0
	ldr r0, [r0]
	ldr r1, _08080524  @ gUnknown_02020188
	mov r9, r1
	bl CopyDataWithPossibleUncomp
	ldr r0, _08080528  @ gBG2TilemapBuffer
	ldr r1, _0808052C  @ gUnknown_082058DC
	adds r6, r6, r1
	ldrb r6, [r6]
	lsls r1, r6, #0xc
	orrs r4, r1
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	str r4, [sp]
	mov r1, r9
	movs r2, #0
	movs r3, #0
	bl sub_800159C
	movs r0, #4
	bl BG_EnableSyncByMask
	movs r2, #4
	add r8, r2
	add r5, r8
	ldr r0, [r5]
	lsls r6, r6, #5
	adds r1, r6, #0
	movs r2, #0x20
	bl CopyToPaletteBuffer
	bl EnablePaletteSync
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0808051C: .4byte gUnknown_089A44A4
_08080520: .4byte gUnknown_082058D4
_08080524: .4byte gUnknown_02020188
_08080528: .4byte gBG2TilemapBuffer
_0808052C: .4byte gUnknown_082058DC

	THUMB_FUNC_END sub_8080498

	THUMB_FUNC_START sub_8080530
sub_8080530: @ 0x08080530
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #4
	mov r8, r1
	ldr r6, _08080598  @ gUnknown_089A44A4
	lsls r4, r0, #1
	adds r4, r4, r0
	lsls r4, r4, #2
	adds r0, r4, r6
	ldr r0, [r0]
	ldr r2, _0808059C  @ gUnknown_082058D4
	lsls r1, r1, #2
	adds r1, r1, r2
	ldr r5, [r1]
	lsls r1, r5, #5
	movs r2, #0xc0
	lsls r2, r2, #0x13
	adds r1, r1, r2
	bl CopyDataWithPossibleUncomp
	adds r6, #8
	adds r4, r4, r6
	ldr r0, [r4]
	ldr r4, _080805A0  @ gUnknown_02020188
	adds r1, r4, #0
	bl CopyDataWithPossibleUncomp
	ldr r0, _080805A4  @ gBG2TilemapBuffer
	ldr r1, _080805A8  @ gUnknown_082058DC
	add r8, r1
	mov r3, r8
	ldrb r1, [r3]
	lsls r1, r1, #0xc
	orrs r5, r1
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	str r5, [sp]
	adds r1, r4, #0
	movs r2, #0
	movs r3, #0
	bl sub_800159C
	movs r0, #4
	bl BG_EnableSyncByMask
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08080598: .4byte gUnknown_089A44A4
_0808059C: .4byte gUnknown_082058D4
_080805A0: .4byte gUnknown_02020188
_080805A4: .4byte gBG2TilemapBuffer
_080805A8: .4byte gUnknown_082058DC

	THUMB_FUNC_END sub_8080530

	THUMB_FUNC_START sub_80805AC
sub_80805AC: @ 0x080805AC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r7, r2, #0
	ldr r3, _08080648  @ gUnknown_089A44A4
	lsls r2, r0, #1
	adds r2, r2, r0
	lsls r2, r2, #2
	adds r3, #4
	adds r2, r2, r3
	ldr r0, _0808064C  @ gUnknown_082058DC
	adds r1, r1, r0
	ldrb r0, [r1]
	lsls r0, r0, #5
	ldr r1, _08080650  @ gPaletteBuffer
	movs r3, #0x1f
	mov r8, r3
	movs r6, #0x1f
	adds r5, r0, r1
	ldr r4, [r2]
	movs r0, #0xf
	mov ip, r0
_080805D8:
	ldrh r1, [r4]
	adds r3, r1, #0
	adds r2, r1, #0
	ands r2, r6
	subs r0, r6, r2
	muls r0, r7, r0
	cmp r0, #0
	bge _080805EA
	adds r0, #0x1f
_080805EA:
	asrs r0, r0, #5
	adds r0, r2, r0
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	lsrs r1, r1, #5
	mov r0, r8
	ands r1, r0
	subs r0, r6, r1
	muls r0, r7, r0
	cmp r0, #0
	bge _08080602
	adds r0, #0x1f
_08080602:
	asrs r0, r0, #5
	adds r0, r1, r0
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	lsrs r3, r3, #0xa
	mov r0, r8
	ands r3, r0
	subs r0, r6, r3
	muls r0, r7, r0
	cmp r0, #0
	bge _0808061A
	adds r0, #0x1f
_0808061A:
	asrs r0, r0, #5
	adds r0, r3, r0
	lsls r0, r0, #0x10
	lsls r1, r1, #5
	orrs r2, r1
	lsrs r0, r0, #6
	orrs r2, r0
	strh r2, [r5]
	adds r5, #2
	adds r4, #2
	movs r3, #1
	negs r3, r3
	add ip, r3
	mov r0, ip
	cmp r0, #0
	bge _080805D8
	bl EnablePaletteSync
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08080648: .4byte gUnknown_089A44A4
_0808064C: .4byte gUnknown_082058DC
_08080650: .4byte gPaletteBuffer

	THUMB_FUNC_END sub_80805AC

	THUMB_FUNC_START sub_8080654
sub_8080654: @ 0x08080654
	push {lr}
	ldr r0, [r0, #0x50]
	bl Proc_End
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8080654

	THUMB_FUNC_START sub_8080660
sub_8080660: @ 0x08080660
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r2, _08080728  @ gLCDControlBuffer
	ldrb r3, [r2, #0xc]
	movs r1, #4
	negs r1, r1
	adds r0, r1, #0
	ands r0, r3
	strb r0, [r2, #0xc]
	ldrb r3, [r2, #0x10]
	adds r0, r1, #0
	ands r0, r3
	strb r0, [r2, #0x10]
	ldrb r3, [r2, #0x14]
	adds r0, r1, #0
	ands r0, r3
	strb r0, [r2, #0x14]
	ldrb r0, [r2, #0x18]
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	strb r1, [r2, #0x18]
	ldrb r1, [r2, #1]
	movs r0, #2
	negs r0, r0
	ands r0, r1
	movs r1, #3
	negs r1, r1
	ands r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2, #1]
	adds r4, r2, #0
	adds r4, #0x34
	ldrb r3, [r4]
	movs r1, #0x21
	negs r1, r1
	adds r0, r1, #0
	ands r0, r3
	strb r0, [r4]
	adds r2, #0x35
	ldrb r0, [r2]
	ands r1, r0
	strb r1, [r2]
	movs r4, #0
	str r4, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #1
	movs r3, #0
	bl sub_8001ED0
	movs r0, #0
	bl sub_8001F48
	movs r0, #1
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #1
	bl sub_8001F0C
	movs r0, #1
	bl sub_8001F64
	movs r0, #1
	movs r1, #0x10
	movs r2, #0x10
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	movs r0, #2
	movs r1, #8
	movs r2, #8
	bl BG_SetPosition
	ldr r0, _0808072C  @ gUnknown_089A4644
	adds r1, r5, #0
	bl Proc_Start
	str r0, [r5, #0x50]
	adds r0, r5, #0
	adds r0, #0x40
	strh r4, [r0]
	adds r0, #2
	strh r4, [r0]
	adds r0, #2
	strh r4, [r0]
	adds r0, #2
	strh r4, [r0]
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08080728: .4byte gLCDControlBuffer
_0808072C: .4byte gUnknown_089A4644

	THUMB_FUNC_END sub_8080660

	THUMB_FUNC_START sub_8080730
sub_8080730: @ 0x08080730
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	movs r0, #0x42
	adds r0, r0, r4
	mov r8, r0
	ldrh r6, [r0]
	cmp r6, #0
	bne _080807A6
	ldr r1, _080807BC  @ gUnknown_082058DE
	adds r5, r4, #0
	adds r5, #0x40
	ldrh r0, [r5]
	adds r0, r0, r1
	ldrb r0, [r0]
	adds r7, r4, #0
	adds r7, #0x44
	ldrh r1, [r7]
	bl sub_8080498
	ldrh r0, [r5]
	cmp r0, #0
	bne _08080768
	ldr r0, _080807C0  @ 0x00000141
	ldr r1, [r4, #0x30]
	bl PlaySpacialSoundMaybe
_08080768:
	ldrh r0, [r5]
	adds r0, #1
	strh r0, [r5]
	movs r0, #5
	mov r1, r8
	strh r0, [r1]
	ldrh r0, [r5]
	cmp r0, #3
	bls _0808079E
	strh r6, [r5]
	adds r0, r4, #0
	adds r0, #0x46
	strh r6, [r0]
	adds r0, #2
	strh r6, [r0]
	adds r0, #2
	strh r6, [r0]
	ldr r1, _080807C4  @ gUnknown_0202BCB0
	movs r2, #0xc
	ldrsh r0, [r1, r2]
	str r0, [r4, #0x30]
	movs r2, #0xe
	ldrsh r0, [r1, r2]
	str r0, [r4, #0x34]
	adds r0, r4, #0
	bl Proc_Break
_0808079E:
	ldrh r0, [r7]
	movs r1, #1
	eors r0, r1
	strh r0, [r7]
_080807A6:
	adds r1, r4, #0
	adds r1, #0x42
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080807BC: .4byte gUnknown_082058DE
_080807C0: .4byte 0x00000141
_080807C4: .4byte gUnknown_0202BCB0

	THUMB_FUNC_END sub_8080730

	THUMB_FUNC_START sub_80807C8
sub_80807C8: @ 0x080807C8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	adds r0, #0x46
	ldrh r0, [r0]
	cmp r0, #5
	bne _080807EC
	ldr r0, [r5, #0x50]
	adds r0, #0x29
	movs r2, #0
	movs r1, #1
	strb r1, [r0]
	ldr r0, [r5, #0x50]
	strh r2, [r0, #0x2a]
	ldr r1, [r5, #0x50]
	movs r0, #2
	b _08080818
_080807EC:
	cmp r0, #8
	bne _08080802
	ldr r0, [r5, #0x50]
	adds r0, #0x29
	movs r1, #1
	strb r1, [r0]
	ldr r0, [r5, #0x50]
	strh r1, [r0, #0x2a]
	ldr r1, [r5, #0x50]
	movs r0, #3
	b _08080818
_08080802:
	cmp r0, #0xb
	bne _0808081A
	ldr r0, [r5, #0x50]
	adds r0, #0x29
	movs r1, #1
	strb r1, [r0]
	ldr r1, [r5, #0x50]
	movs r0, #2
	strh r0, [r1, #0x2a]
	ldr r1, [r5, #0x50]
	movs r0, #4
_08080818:
	strh r0, [r1, #0x34]
_0808081A:
	adds r0, r5, #0
	adds r0, #0x42
	ldrh r7, [r0]
	mov r8, r0
	cmp r7, #0
	bne _0808087E
	ldr r1, _08080864  @ gUnknown_082058E2
	adds r6, r5, #0
	adds r6, #0x40
	ldrh r0, [r6]
	adds r0, r0, r1
	ldrb r0, [r0]
	adds r4, r5, #0
	adds r4, #0x44
	ldrh r1, [r4]
	bl sub_8080498
	ldrh r0, [r6]
	adds r0, #1
	strh r0, [r6]
	movs r0, #4
	mov r1, r8
	strh r0, [r1]
	adds r1, r5, #0
	adds r1, #0x46
	ldrh r0, [r1]
	cmp r0, #0x15
	bls _08080868
	ldrh r0, [r6]
	cmp r0, #1
	bls _08080876
	strh r7, [r6]
	strh r7, [r1]
	adds r0, r5, #0
	bl Proc_Break
	b _08080876
	.align 2, 0
_08080864: .4byte gUnknown_082058E2
_08080868:
	ldrh r0, [r6]
	cmp r0, #1
	bls _08080876
	strh r7, [r6]
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
_08080876:
	ldrh r0, [r4]
	movs r1, #1
	eors r0, r1
	strh r0, [r4]
_0808087E:
	mov r1, r8
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80807C8

	THUMB_FUNC_START sub_8080890
sub_8080890: @ 0x08080890
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	movs r0, #0x42
	adds r0, r0, r6
	mov r8, r0
	ldrh r7, [r0]
	cmp r7, #0
	bne _080808EC
	ldr r1, _080808DC  @ gUnknown_082058E4
	adds r4, r6, #0
	adds r4, #0x40
	ldrh r0, [r4]
	adds r0, r0, r1
	ldrb r0, [r0]
	adds r5, r6, #0
	adds r5, #0x44
	ldrh r1, [r5]
	bl sub_8080498
	movs r0, #3
	mov r1, r8
	strh r0, [r1]
	ldrh r0, [r4]
	cmp r0, #0xa
	bls _080808E0
	strh r7, [r4]
	adds r0, r6, #0
	adds r0, #0x46
	strh r7, [r0]
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
	adds r0, r6, #0
	bl Proc_Break
	b _080808F6
	.align 2, 0
_080808DC: .4byte gUnknown_082058E4
_080808E0:
	adds r0, #1
	strh r0, [r4]
	ldrh r0, [r5]
	movs r1, #1
	eors r0, r1
	strh r0, [r5]
_080808EC:
	adds r1, r6, #0
	adds r1, #0x42
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
_080808F6:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8080890

	THUMB_FUNC_START sub_8080900
sub_8080900: @ 0x08080900
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	adds r2, r0, #0
	adds r1, r2, #0
	adds r1, #0x42
	ldrh r0, [r1]
	adds r4, r0, #0
	cmp r4, #0
	bne _080809C4
	adds r3, r2, #0
	adds r3, #0x40
	ldrh r1, [r3]
	lsls r0, r1, #0x12
	lsrs r7, r0, #0x10
	mov r9, r3
	cmp r1, #7
	bhi _080809A4
	movs r6, #1
	adds r2, #0x44
	mov r8, r2
	ldr r0, _0808099C  @ gUnknown_082058DC
	mov sl, r0
	movs r1, #0x1f
	mov ip, r1
_08080936:
	mov r1, r8
	ldrh r0, [r1]
	add r0, sl
	ldrb r0, [r0]
	lsls r0, r0, #4
	adds r0, r0, r6
	lsls r0, r0, #1
	ldr r1, _080809A0  @ gPaletteBuffer
	adds r5, r0, r1
	ldrh r1, [r5]
	adds r4, r1, #0
	movs r0, #0x1f
	ands r0, r1
	adds r0, r7, r0
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0x1f
	bls _0808095C
	movs r2, #0x1f
_0808095C:
	lsrs r0, r1, #5
	mov r1, ip
	ands r0, r1
	adds r0, r7, r0
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #0x1f
	bls _0808096E
	movs r3, #0x1f
_0808096E:
	lsrs r0, r4, #0xa
	mov r1, ip
	ands r0, r1
	adds r0, r7, r0
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #0x1f
	bls _08080980
	movs r1, #0x1f
_08080980:
	lsls r0, r3, #5
	orrs r2, r0
	lsls r0, r1, #0xa
	orrs r2, r0
	strh r2, [r5]
	adds r6, #1
	cmp r6, #0xf
	ble _08080936
	bl EnablePaletteSync
	mov r1, r9
	ldrh r0, [r1]
	adds r0, #1
	b _080809C6
	.align 2, 0
_0808099C: .4byte gUnknown_082058DC
_080809A0: .4byte gPaletteBuffer
_080809A4:
	strh r4, [r3]
	adds r0, r2, #0
	adds r0, #0x46
	strh r4, [r0]
	adds r0, #2
	strh r4, [r0]
	adds r1, r2, #0
	adds r1, #0x4a
	ldr r0, _080809C0  @ 0x0000FFFF
	strh r0, [r1]
	adds r0, r2, #0
	bl Proc_Break
	b _080809C8
	.align 2, 0
_080809C0: .4byte 0x0000FFFF
_080809C4:
	subs r0, #1
_080809C6:
	strh r0, [r1]
_080809C8:
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8080900

	THUMB_FUNC_START sub_80809D8
sub_80809D8: @ 0x080809D8
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	adds r6, r0, #0
	adds r0, #0x46
	ldrh r0, [r0]
	cmp r0, #2
	bne _080809F8
	ldr r0, [r6, #0x50]
	adds r0, #0x29
	movs r1, #1
	strb r1, [r0]
	ldr r0, [r6, #0x50]
	strh r1, [r0, #0x2a]
	b _08080A1C
_080809F8:
	cmp r0, #3
	bne _08080A0A
	ldr r0, [r6, #0x50]
	adds r0, #0x29
	movs r1, #1
	strb r1, [r0]
	ldr r0, [r6, #0x50]
	strh r1, [r0, #0x2a]
	b _08080A36
_08080A0A:
	cmp r0, #4
	bne _08080A24
	ldr r0, [r6, #0x50]
	adds r0, #0x29
	movs r2, #0
	movs r1, #1
	strb r1, [r0]
	ldr r0, [r6, #0x50]
	strh r2, [r0, #0x2a]
_08080A1C:
	ldr r1, [r6, #0x50]
	movs r0, #3
	strh r0, [r1, #0x34]
	b _08080A4E
_08080A24:
	cmp r0, #5
	bne _08080A3E
	ldr r0, [r6, #0x50]
	adds r0, #0x29
	movs r2, #0
	movs r1, #1
	strb r1, [r0]
	ldr r0, [r6, #0x50]
	strh r2, [r0, #0x2a]
_08080A36:
	ldr r1, [r6, #0x50]
	movs r0, #4
	strh r0, [r1, #0x34]
	b _08080A4E
_08080A3E:
	cmp r0, #6
	bne _08080A4E
	ldr r0, [r6, #0x50]
	adds r0, #0x29
	movs r1, #0
	strb r1, [r0]
	ldr r0, [r6, #0x50]
	strh r1, [r0, #0x2a]
_08080A4E:
	adds r0, r6, #0
	adds r0, #0x42
	ldrh r7, [r0]
	mov r8, r0
	movs r0, #0x4a
	adds r0, r0, r6
	mov r9, r0
	cmp r7, #0
	bne _08080ABE
	ldr r1, _08080AA4  @ gUnknown_082058F0
	adds r5, r6, #0
	adds r5, #0x40
	ldrh r0, [r5]
	adds r0, r0, r1
	ldrb r0, [r0]
	adds r4, r6, #0
	adds r4, #0x44
	ldrh r1, [r4]
	bl sub_8080530
	ldrh r0, [r5]
	mov r1, r9
	strh r0, [r1]
	ldrh r0, [r5]
	adds r0, #1
	strh r0, [r5]
	movs r0, #4
	mov r3, r8
	strh r0, [r3]
	adds r1, r6, #0
	adds r1, #0x46
	ldrh r0, [r1]
	cmp r0, #0xa
	bls _08080AA8
	ldrh r0, [r5]
	cmp r0, #3
	bls _08080AB6
	strh r7, [r5]
	strh r7, [r1]
	adds r0, r6, #0
	bl Proc_Break
	b _08080AB6
	.align 2, 0
_08080AA4: .4byte gUnknown_082058F0
_08080AA8:
	ldrh r0, [r5]
	cmp r0, #3
	bls _08080AB6
	strh r7, [r5]
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
_08080AB6:
	ldrh r0, [r4]
	movs r1, #1
	eors r0, r1
	strh r0, [r4]
_08080ABE:
	mov r4, r8
	ldrh r0, [r4]
	subs r0, #1
	strh r0, [r4]
	adds r2, r6, #0
	adds r2, #0x48
	ldrh r1, [r2]
	movs r3, #0
	ldrsh r0, [r2, r3]
	cmp r0, #0x95
	bgt _08080AD8
	adds r0, r1, #1
	strh r0, [r2]
_08080AD8:
	mov r4, r9
	movs r1, #0
	ldrsh r0, [r4, r1]
	cmp r0, #0
	blt _08080B06
	ldr r1, _08080B14  @ gUnknown_082058F0
	adds r0, r0, r1
	ldrb r5, [r0]
	adds r0, r6, #0
	adds r0, #0x44
	ldrh r4, [r0]
	movs r1, #0
	ldrsh r0, [r2, r1]
	lsls r0, r0, #5
	movs r1, #0x96
	bl __divsi3
	movs r2, #0x20
	subs r2, r2, r0
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_80805AC
_08080B06:
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08080B14: .4byte gUnknown_082058F0

	THUMB_FUNC_END sub_80809D8

	THUMB_FUNC_START sub_8080B18
sub_8080B18: @ 0x08080B18
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	movs r0, #0x42
	adds r0, r0, r5
	mov r8, r0
	ldrh r7, [r0]
	cmp r7, #0
	bne _08080B6A
	ldr r1, _08080B80  @ gUnknown_082058F4
	adds r4, r5, #0
	adds r4, #0x40
	ldrh r0, [r4]
	adds r0, r0, r1
	ldrb r0, [r0]
	adds r6, r5, #0
	adds r6, #0x44
	ldrh r1, [r6]
	bl sub_8080498
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
	movs r0, #5
	mov r1, r8
	strh r0, [r1]
	ldrh r0, [r4]
	cmp r0, #3
	bls _08080B62
	strh r7, [r4]
	adds r0, r5, #0
	adds r0, #0x46
	strh r7, [r0]
	adds r0, r5, #0
	bl Proc_Break
_08080B62:
	ldrh r0, [r6]
	movs r1, #1
	eors r0, r1
	strh r0, [r6]
_08080B6A:
	adds r1, r5, #0
	adds r1, #0x42
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08080B80: .4byte gUnknown_082058F4

	THUMB_FUNC_END sub_8080B18

	THUMB_FUNC_START sub_8080B84
sub_8080B84: @ 0x08080B84
	push {lr}
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	ldr r0, _08080BA4  @ gBG2TilemapBuffer
	movs r1, #0
	bl BG_Fill
	movs r0, #7
	bl BG_EnableSyncByMask
	pop {r0}
	bx r0
	.align 2, 0
_08080BA4: .4byte gBG2TilemapBuffer

	THUMB_FUNC_END sub_8080B84

	THUMB_FUNC_START sub_8080BA8
sub_8080BA8: @ 0x08080BA8
	push {r4, lr}
	adds r1, r0, #0
	adds r1, #0x29
	movs r3, #0
	strb r3, [r1]
	movs r4, #0
	strh r3, [r0, #0x2a]
	ldr r2, _08080BD4  @ gUnknown_0202BCB0
	ldrh r1, [r2, #0xc]
	strh r1, [r0, #0x2c]
	ldrh r1, [r2, #0xe]
	strh r1, [r0, #0x2e]
	strh r3, [r0, #0x30]
	strh r3, [r0, #0x32]
	movs r1, #4
	strh r1, [r0, #0x34]
	strh r3, [r0, #0x36]
	adds r0, #0x38
	strb r4, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08080BD4: .4byte gUnknown_0202BCB0

	THUMB_FUNC_END sub_8080BA8

	THUMB_FUNC_START sub_8080BD8
sub_8080BD8: @ 0x08080BD8
	push {r4, r5, r6, lr}
	mov ip, r0
	adds r0, #0x29
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _08080C04
	ldr r0, _08080C00  @ gUnknown_0202BCB0
	mov r2, ip
	ldrh r1, [r2, #0x2c]
	strh r1, [r0, #0xc]
	ldrh r1, [r2, #0x2e]
	strh r1, [r0, #0xe]
	movs r0, #2
	movs r1, #8
	movs r2, #8
	bl BG_SetPosition
	b _08080D1C
	.align 2, 0
_08080C00: .4byte gUnknown_0202BCB0
_08080C04:
	mov r3, ip
	ldrh r1, [r3, #0x36]
	movs r4, #0x36
	ldrsh r0, [r3, r4]
	cmp r0, #0
	ble _08080C16
	subs r0, r1, #1
	strh r0, [r3, #0x36]
	b _08080D1C
_08080C16:
	mov r5, ip
	ldrh r0, [r5, #0x34]
	strh r0, [r5, #0x36]
	movs r6, #0x2a
	ldrsh r0, [r5, r6]
	cmp r0, #1
	beq _08080C60
	cmp r0, #1
	bgt _08080C2E
	cmp r0, #0
	beq _08080C34
	b _08080CB8
_08080C2E:
	cmp r0, #2
	beq _08080C8C
	b _08080CB8
_08080C34:
	ldr r2, _08080C5C  @ gUnknown_082058F8
	mov r1, ip
	adds r1, #0x38
	ldrb r0, [r1]
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	mov r3, ip
	strh r0, [r3, #0x30]
	ldrb r0, [r1]
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r0, [r0, #1]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	strh r0, [r3, #0x32]
	b _08080CE2
	.align 2, 0
_08080C5C: .4byte gUnknown_082058F8
_08080C60:
	ldr r2, _08080C88  @ gUnknown_08205918
	mov r1, ip
	adds r1, #0x38
	ldrb r0, [r1]
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	mov r4, ip
	strh r0, [r4, #0x30]
	ldrb r0, [r1]
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r0, [r0, #1]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	strh r0, [r4, #0x32]
	b _08080CE2
	.align 2, 0
_08080C88: .4byte gUnknown_08205918
_08080C8C:
	ldr r2, _08080CB4  @ gUnknown_08205938
	mov r1, ip
	adds r1, #0x38
	ldrb r0, [r1]
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	mov r5, ip
	strh r0, [r5, #0x30]
	ldrb r0, [r1]
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r0, [r0, #1]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	strh r0, [r5, #0x32]
	b _08080CE2
	.align 2, 0
_08080CB4: .4byte gUnknown_08205938
_08080CB8:
	ldr r3, _08080D24  @ gUnknown_08205918
	mov r1, ip
	adds r1, #0x38
	ldrb r0, [r1]
	lsls r0, r0, #2
	adds r0, r0, r3
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	mov r6, ip
	ldrh r2, [r6, #0x2a]
	muls r0, r2, r0
	strh r0, [r6, #0x30]
	ldrb r0, [r1]
	lsls r0, r0, #2
	adds r0, r0, r3
	ldrb r0, [r0, #1]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	muls r0, r2, r0
	strh r0, [r6, #0x32]
_08080CE2:
	adds r4, r1, #0
	ldr r3, _08080D28  @ gUnknown_0202BCB0
	mov r0, ip
	ldrh r1, [r0, #0x30]
	ldrh r2, [r0, #0x2c]
	adds r0, r1, r2
	strh r0, [r3, #0xc]
	mov r5, ip
	ldrh r2, [r5, #0x32]
	ldrh r6, [r5, #0x2e]
	adds r0, r2, r6
	strh r0, [r3, #0xe]
	adds r1, #8
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	adds r2, #8
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #2
	bl BG_SetPosition
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	ldrb r0, [r4]
	cmp r0, #8
	blt _08080D1C
	movs r0, #0
	strb r0, [r4]
_08080D1C:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08080D24: .4byte gUnknown_08205918
_08080D28: .4byte gUnknown_0202BCB0

	THUMB_FUNC_END sub_8080BD8

	THUMB_FUNC_START New6C_SummonGfx
New6C_SummonGfx: @ 0x08080D2C
	push {r4, r5, lr}
	adds r3, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	ldr r0, _08080D64  @ gUnknown_089A46AC
	adds r1, r3, #0
	bl Proc_StartBlocking
	ldr r2, _08080D68  @ gUnknown_0202BCB0
	ldrh r1, [r2, #0xc]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x14
	subs r4, r4, r1
	lsls r4, r4, #1
	adds r4, #1
	lsls r4, r4, #3
	str r4, [r0, #0x30]
	ldrh r1, [r2, #0xe]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x14
	subs r5, r5, r1
	lsls r5, r5, #1
	adds r5, #1
	lsls r5, r5, #3
	str r5, [r0, #0x34]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08080D64: .4byte gUnknown_089A46AC
_08080D68: .4byte gUnknown_0202BCB0

	THUMB_FUNC_END New6C_SummonGfx

	THUMB_FUNC_START sub_8080D6C
sub_8080D6C: @ 0x08080D6C
	push {r4, r5, lr}
	adds r5, r0, #0
	bl sub_807E978
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	ldr r4, _08080DC0  @ gUnknown_089E714C
	movs r0, #2
	bl GetBackgroundTileDataOffset
	adds r1, r0, #0
	ldr r0, _08080DC4  @ 0x06002C00
	adds r1, r1, r0
	adds r0, r4, #0
	bl CopyDataWithPossibleUncomp
	ldr r0, _08080DC8  @ gUnknown_089E7DEC
	movs r1, #0x80
	movs r2, #0x20
	bl CopyToPaletteBuffer
	movs r0, #1
	movs r1, #0x10
	movs r2, #0x10
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	adds r0, r5, #0
	adds r0, #0x40
	movs r1, #0
	strh r1, [r0]
	adds r5, #0x42
	strh r1, [r5]
	bl EnablePaletteSync
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08080DC0: .4byte gUnknown_089E714C
_08080DC4: .4byte 0x06002C00
_08080DC8: .4byte gUnknown_089E7DEC

	THUMB_FUNC_END sub_8080D6C

	THUMB_FUNC_START sub_8080DCC
sub_8080DCC: @ 0x08080DCC
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r0, #0x42
	ldrh r0, [r0]
	cmp r0, #0
	bne _08080E62
	adds r0, r4, #0
	adds r0, #0x40
	ldrh r1, [r0]
	adds r5, r0, #0
	cmp r1, #0
	bne _08080DF4
	ldr r0, _08080DF0  @ 0x000003BF
	ldr r1, [r4, #0x30]
	bl PlaySpacialSoundMaybe
	b _08080E0E
	.align 2, 0
_08080DF0: .4byte 0x000003BF
_08080DF4:
	cmp r1, #0xc
	bne _08080E02
	bl RefreshEntityBmMaps
	bl SMS_UpdateFromGameData
	b _08080E0E
_08080E02:
	cmp r1, #0x11
	bls _08080E0E
	adds r0, r4, #0
	bl Proc_Break
	b _08080E6C
_08080E0E:
	ldr r0, _08080E74  @ gUnknown_089A4664
	ldrh r1, [r5]
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r0, [r1]
	ldr r6, _08080E78  @ gUnknown_02020188
	adds r1, r6, #0
	bl CopyDataWithPossibleUncomp
	ldr r1, _08080E7C  @ gBG2TilemapBuffer
	ldr r0, [r4, #0x30]
	cmp r0, #0
	bge _08080E2A
	adds r0, #7
_08080E2A:
	asrs r0, r0, #3
	subs r0, #4
	lsls r0, r0, #0x10
	asrs r2, r0, #0x10
	ldr r3, [r4, #0x34]
	cmp r3, #0
	bge _08080E3A
	adds r3, #7
_08080E3A:
	asrs r3, r3, #3
	subs r3, #6
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	ldr r0, _08080E80  @ 0x00004160
	str r0, [sp]
	adds r0, r1, #0
	adds r1, r6, #0
	bl sub_800159C
	movs r0, #4
	bl BG_EnableSyncByMask
	ldrh r0, [r5]
	adds r0, #1
	strh r0, [r5]
	adds r1, r4, #0
	adds r1, #0x42
	movs r0, #4
	strh r0, [r1]
_08080E62:
	adds r1, r4, #0
	adds r1, #0x42
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
_08080E6C:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08080E74: .4byte gUnknown_089A4664
_08080E78: .4byte gUnknown_02020188
_08080E7C: .4byte gBG2TilemapBuffer
_08080E80: .4byte 0x00004160

	THUMB_FUNC_END sub_8080DCC

	THUMB_FUNC_START sub_8080E84
sub_8080E84: @ 0x08080E84
	push {lr}
	ldr r0, _08080E98  @ gBG2TilemapBuffer
	movs r1, #0
	bl BG_Fill
	movs r0, #4
	bl BG_EnableSyncByMask
	pop {r0}
	bx r0
	.align 2, 0
_08080E98: .4byte gBG2TilemapBuffer

	THUMB_FUNC_END sub_8080E84

	THUMB_FUNC_START sub_8080E9C
sub_8080E9C: @ 0x08080E9C
	push {r4, lr}
	adds r2, r0, #0
	adds r4, r1, #0
	ldr r0, _08080EDC  @ gUnknown_089A46DC
	adds r1, r2, #0
	bl Proc_StartBlocking
	str r4, [r0, #0x2c]
	movs r2, #0x10
	ldrsb r2, [r4, r2]
	ldr r3, _08080EE0  @ gUnknown_0202BCB0
	ldrh r1, [r3, #0xc]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x14
	subs r2, r2, r1
	lsls r2, r2, #1
	adds r2, #1
	lsls r2, r2, #3
	str r2, [r0, #0x30]
	movs r2, #0x11
	ldrsb r2, [r4, r2]
	ldrh r1, [r3, #0xe]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x14
	subs r2, r2, r1
	lsls r2, r2, #1
	adds r2, #1
	lsls r2, r2, #3
	str r2, [r0, #0x34]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08080EDC: .4byte gUnknown_089A46DC
_08080EE0: .4byte gUnknown_0202BCB0

	THUMB_FUNC_END sub_8080E9C

	THUMB_FUNC_START sub_8080EE4
sub_8080EE4: @ 0x08080EE4
	push {r4, r5, lr}
	adds r5, r0, #0
	bl sub_807E978
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	ldr r4, _08080F38  @ gUnknown_089E714C
	movs r0, #2
	bl GetBackgroundTileDataOffset
	adds r1, r0, #0
	ldr r0, _08080F3C  @ 0x06002C00
	adds r1, r1, r0
	adds r0, r4, #0
	bl CopyDataWithPossibleUncomp
	ldr r0, _08080F40  @ gUnknown_089E7DEC
	movs r1, #0x80
	movs r2, #0x20
	bl CopyToPaletteBuffer
	movs r0, #1
	movs r1, #0x10
	movs r2, #0x10
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	adds r0, r5, #0
	adds r0, #0x40
	movs r1, #0
	strh r1, [r0]
	adds r5, #0x42
	strh r1, [r5]
	bl EnablePaletteSync
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08080F38: .4byte gUnknown_089E714C
_08080F3C: .4byte 0x06002C00
_08080F40: .4byte gUnknown_089E7DEC

	THUMB_FUNC_END sub_8080EE4

	THUMB_FUNC_START sub_8080F44
sub_8080F44: @ 0x08080F44
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r0, #0x42
	ldrh r0, [r0]
	cmp r0, #0
	bne _08080FE6
	adds r0, r4, #0
	adds r0, #0x40
	ldrh r1, [r0]
	adds r5, r0, #0
	cmp r1, #0
	bne _08080F6C
	ldr r0, _08080F68  @ 0x000003BF
	ldr r1, [r4, #0x30]
	bl PlaySpacialSoundMaybe
	b _08080F92
	.align 2, 0
_08080F68: .4byte 0x000003BF
_08080F6C:
	cmp r1, #0xc
	bne _08080F86
	ldr r0, [r4, #0x2c]
	ldr r1, [r0, #0xc]
	movs r2, #2
	negs r2, r2
	ands r1, r2
	str r1, [r0, #0xc]
	bl RefreshEntityBmMaps
	bl SMS_UpdateFromGameData
	b _08080F92
_08080F86:
	cmp r1, #0x11
	bls _08080F92
	adds r0, r4, #0
	bl Proc_Break
	b _08080FF0
_08080F92:
	ldr r0, _08080FF8  @ gUnknown_089A4664
	ldrh r1, [r5]
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r0, [r1]
	ldr r6, _08080FFC  @ gUnknown_02020188
	adds r1, r6, #0
	bl CopyDataWithPossibleUncomp
	ldr r1, _08081000  @ gBG2TilemapBuffer
	ldr r0, [r4, #0x30]
	cmp r0, #0
	bge _08080FAE
	adds r0, #7
_08080FAE:
	asrs r0, r0, #3
	subs r0, #4
	lsls r0, r0, #0x10
	asrs r2, r0, #0x10
	ldr r3, [r4, #0x34]
	cmp r3, #0
	bge _08080FBE
	adds r3, #7
_08080FBE:
	asrs r3, r3, #3
	subs r3, #6
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	ldr r0, _08081004  @ 0x00004160
	str r0, [sp]
	adds r0, r1, #0
	adds r1, r6, #0
	bl sub_800159C
	movs r0, #4
	bl BG_EnableSyncByMask
	ldrh r0, [r5]
	adds r0, #1
	strh r0, [r5]
	adds r1, r4, #0
	adds r1, #0x42
	movs r0, #4
	strh r0, [r1]
_08080FE6:
	adds r1, r4, #0
	adds r1, #0x42
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
_08080FF0:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08080FF8: .4byte gUnknown_089A4664
_08080FFC: .4byte gUnknown_02020188
_08081000: .4byte gBG2TilemapBuffer
_08081004: .4byte 0x00004160

	THUMB_FUNC_END sub_8080F44

	THUMB_FUNC_START sub_8081008
sub_8081008: @ 0x08081008
	push {lr}
	ldr r0, _0808101C  @ gBG2TilemapBuffer
	movs r1, #0
	bl BG_Fill
	movs r0, #4
	bl BG_EnableSyncByMask
	pop {r0}
	bx r0
	.align 2, 0
_0808101C: .4byte gBG2TilemapBuffer

	THUMB_FUNC_END sub_8081008

	THUMB_FUNC_START sub_8081020
sub_8081020: @ 0x08081020
	push {r4, lr}
	adds r2, r0, #0
	adds r4, r1, #0
	ldr r0, _08081060  @ gUnknown_089A470C
	adds r1, r2, #0
	bl Proc_Start
	str r4, [r0, #0x2c]
	movs r2, #0x10
	ldrsb r2, [r4, r2]
	ldr r3, _08081064  @ gUnknown_0202BCB0
	ldrh r1, [r3, #0xc]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x14
	subs r2, r2, r1
	lsls r2, r2, #1
	adds r2, #1
	lsls r2, r2, #3
	str r2, [r0, #0x30]
	movs r2, #0x11
	ldrsb r2, [r4, r2]
	ldrh r1, [r3, #0xe]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x14
	subs r2, r2, r1
	lsls r2, r2, #1
	adds r2, #1
	lsls r2, r2, #3
	str r2, [r0, #0x34]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08081060: .4byte gUnknown_089A470C
_08081064: .4byte gUnknown_0202BCB0

	THUMB_FUNC_END sub_8081020

	THUMB_FUNC_START sub_8081068
sub_8081068: @ 0x08081068
	push {lr}
	ldr r0, _08081074  @ gUnknown_089A470C
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
_08081074: .4byte gUnknown_089A470C

	THUMB_FUNC_END sub_8081068

	THUMB_FUNC_START sub_8081078
sub_8081078: @ 0x08081078
	push {r4, r5, lr}
	adds r5, r0, #0
	bl sub_807E978
	ldr r2, _080810F0  @ gLCDControlBuffer
	ldrb r3, [r2, #0xc]
	movs r1, #4
	negs r1, r1
	adds r0, r1, #0
	ands r0, r3
	strb r0, [r2, #0xc]
	ldrb r0, [r2, #0x10]
	ands r1, r0
	movs r0, #1
	orrs r1, r0
	strb r1, [r2, #0x10]
	ldrb r0, [r2, #0x14]
	movs r1, #3
	orrs r0, r1
	strb r0, [r2, #0x14]
	ldrb r0, [r2, #0x18]
	orrs r0, r1
	strb r0, [r2, #0x18]
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	ldr r4, _080810F4  @ gUnknown_089E714C
	movs r0, #2
	bl GetBackgroundTileDataOffset
	adds r1, r0, #0
	ldr r0, _080810F8  @ 0x06002C00
	adds r1, r1, r0
	adds r0, r4, #0
	bl CopyDataWithPossibleUncomp
	ldr r0, _080810FC  @ gUnknown_089E7DEC
	movs r1, #0x80
	movs r2, #0x20
	bl CopyToPaletteBuffer
	movs r0, #1
	movs r1, #0x10
	movs r2, #0x10
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	adds r0, r5, #0
	adds r0, #0x40
	movs r1, #0
	strh r1, [r0]
	adds r5, #0x42
	strh r1, [r5]
	bl EnablePaletteSync
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080810F0: .4byte gLCDControlBuffer
_080810F4: .4byte gUnknown_089E714C
_080810F8: .4byte 0x06002C00
_080810FC: .4byte gUnknown_089E7DEC

	THUMB_FUNC_END sub_8081078

	THUMB_FUNC_START sub_8081100
sub_8081100: @ 0x08081100
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r0, #0x42
	ldrh r0, [r0]
	cmp r0, #0
	bne _08081188
	adds r0, r4, #0
	adds r0, #0x40
	ldrh r1, [r0]
	adds r5, r0, #0
	cmp r1, #0
	bne _08081128
	ldr r0, _08081124  @ 0x000003BF
	ldr r1, [r4, #0x30]
	bl PlaySpacialSoundMaybe
	b _08081134
	.align 2, 0
_08081124: .4byte 0x000003BF
_08081128:
	cmp r1, #9
	bls _08081134
	adds r0, r4, #0
	bl Proc_Break
	b _08081192
_08081134:
	ldr r0, _0808119C  @ gUnknown_089A4664
	ldrh r1, [r5]
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r0, [r1]
	ldr r6, _080811A0  @ gUnknown_02020188
	adds r1, r6, #0
	bl CopyDataWithPossibleUncomp
	ldr r1, _080811A4  @ gBG2TilemapBuffer
	ldr r0, [r4, #0x30]
	cmp r0, #0
	bge _08081150
	adds r0, #7
_08081150:
	asrs r0, r0, #3
	subs r0, #4
	lsls r0, r0, #0x10
	asrs r2, r0, #0x10
	ldr r3, [r4, #0x34]
	cmp r3, #0
	bge _08081160
	adds r3, #7
_08081160:
	asrs r3, r3, #3
	subs r3, #6
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	ldr r0, _080811A8  @ 0x00004160
	str r0, [sp]
	adds r0, r1, #0
	adds r1, r6, #0
	bl sub_800159C
	movs r0, #4
	bl BG_EnableSyncByMask
	ldrh r0, [r5]
	adds r0, #1
	strh r0, [r5]
	adds r1, r4, #0
	adds r1, #0x42
	movs r0, #4
	strh r0, [r1]
_08081188:
	adds r1, r4, #0
	adds r1, #0x42
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
_08081192:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0808119C: .4byte gUnknown_089A4664
_080811A0: .4byte gUnknown_02020188
_080811A4: .4byte gBG2TilemapBuffer
_080811A8: .4byte 0x00004160

	THUMB_FUNC_END sub_8081100

	THUMB_FUNC_START sub_80811AC
sub_80811AC: @ 0x080811AC
	push {lr}
	bl DeleteAllPaletteAnimator
	ldr r2, _080811CC  @ gLCDControlBuffer
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
	pop {r0}
	bx r0
	.align 2, 0
_080811CC: .4byte gLCDControlBuffer

	THUMB_FUNC_END sub_80811AC

	THUMB_FUNC_START sub_80811D0
sub_80811D0: @ 0x080811D0
	push {r4, lr}
	adds r2, r0, #0
	adds r4, r1, #0
	ldr r0, _080811E8  @ gUnknown_089A4734
	adds r1, r2, #0
	bl Proc_StartBlocking
	adds r0, #0x42
	strh r4, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080811E8: .4byte gUnknown_089A4734

	THUMB_FUNC_END sub_80811D0

	THUMB_FUNC_START sub_80811EC
sub_80811EC: @ 0x080811EC
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #1
	movs r1, #0x10
	movs r2, #0x10
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	adds r4, #0x40
	movs r0, #0
	strh r0, [r4]
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80811EC

	THUMB_FUNC_START sub_8081208
sub_8081208: @ 0x08081208
	push {r4, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x40
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	adds r2, r4, #0
	adds r2, #0x42
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r3, [r2]
	cmp r0, r3
	bcs _08081242
	ldrh r0, [r1]
	lsls r0, r0, #4
	ldrh r1, [r2]
	bl __divsi3
	movs r1, #0x10
	subs r1, r1, r0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	movs r0, #1
	movs r2, #0x10
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	b _08081254
_08081242:
	movs r0, #1
	movs r1, #0
	movs r2, #0x10
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	adds r0, r4, #0
	bl Proc_Break
_08081254:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8081208

	THUMB_FUNC_START nullsub_58
nullsub_58: @ 0x0808125C
	bx lr

	THUMB_FUNC_END nullsub_58

	THUMB_FUNC_START GetItemAnim6CCode
GetItemAnim6CCode: @ 0x08081260
	push {lr}
	ldr r0, _08081270  @ gUnknown_0203E1F0
	ldr r0, [r0, #0x54]
	cmp r0, #0
	bne _0808126C
	ldr r0, _08081274  @ gUnknown_089A4764
_0808126C:
	pop {r1}
	bx r1
	.align 2, 0
_08081270: .4byte gUnknown_0203E1F0
_08081274: .4byte gUnknown_089A4764

	THUMB_FUNC_END GetItemAnim6CCode

	THUMB_FUNC_START MapAnim_AnimateSubjectIdle
MapAnim_AnimateSubjectIdle: @ 0x08081278
	push {lr}
	ldr r2, _08081298  @ gUnknown_0203E1F0
	adds r0, r2, #0
	adds r0, #0x58
	ldrb r1, [r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r2, #8
	adds r0, r0, r2
	ldr r0, [r0]
	bl MU_StartActionAnim
	pop {r0}
	bx r0
	.align 2, 0
_08081298: .4byte gUnknown_0203E1F0

	THUMB_FUNC_END MapAnim_AnimateSubjectIdle

	THUMB_FUNC_START MapAnim_SubjectResetAnim
MapAnim_SubjectResetAnim: @ 0x0808129C
	push {lr}
	ldr r2, _080812BC  @ gUnknown_0203E1F0
	adds r0, r2, #0
	adds r0, #0x58
	ldrb r1, [r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r2, #8
	adds r0, r0, r2
	ldr r0, [r0]
	bl MU_StartDelayedFaceTarget
	pop {r0}
	bx r0
	.align 2, 0
_080812BC: .4byte gUnknown_0203E1F0

	THUMB_FUNC_END MapAnim_SubjectResetAnim

	THUMB_FUNC_START sub_80812C0
sub_80812C0: @ 0x080812C0
	push {lr}
	ldr r2, _080812E8  @ gUnknown_0203E1F0
	adds r0, r2, #0
	adds r0, #0x58
	ldrb r1, [r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r0, [r0]
	ldr r0, [r0, #4]
	ldrb r0, [r0, #4]
	cmp r0, #0x4d
	bne _080812F0
	ldr r0, _080812EC  @ sub_8081348
	movs r1, #9
	bl SetupFutureCall2
	b _080812F8
	.align 2, 0
_080812E8: .4byte gUnknown_0203E1F0
_080812EC: .4byte sub_8081348
_080812F0:
	ldr r0, _08081340  @ sub_8081384
	movs r1, #0xc
	bl SetupFutureCall2
_080812F8:
	ldr r2, _08081344  @ gUnknown_0203E1F0
	adds r3, r2, #0
	adds r3, #0x58
	ldrb r1, [r3]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r2, #8
	adds r0, r0, r2
	ldr r0, [r0]
	ldr r1, [r0, #0x30]
	movs r0, #0
	strh r0, [r1, #0x18]
	ldrb r1, [r3]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r0, [r0]
	ldr r1, [r0, #0x30]
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r1, #0x1a]
	ldrb r1, [r3]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r0, [r0]
	ldr r0, [r0, #0x30]
	movs r1, #5
	bl AP_SwitchAnimation
	pop {r0}
	bx r0
	.align 2, 0
_08081340: .4byte sub_8081384
_08081344: .4byte gUnknown_0203E1F0

	THUMB_FUNC_END sub_80812C0

	THUMB_FUNC_START sub_8081348
sub_8081348: @ 0x08081348
	push {lr}
	ldr r0, _08081378  @ 0x000002D5
	ldr r3, _0808137C  @ gUnknown_0203E1F0
	adds r1, r3, #0
	adds r1, #0x58
	ldrb r2, [r1]
	lsls r1, r2, #2
	adds r1, r1, r2
	lsls r1, r1, #2
	adds r1, r1, r3
	ldr r1, [r1]
	ldrb r1, [r1, #0x10]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	lsls r1, r1, #4
	ldr r2, _08081380  @ gUnknown_0202BCB0
	movs r3, #0xc
	ldrsh r2, [r2, r3]
	subs r1, r1, r2
	bl PlaySpacialSoundMaybe
	pop {r0}
	bx r0
	.align 2, 0
_08081378: .4byte 0x000002D5
_0808137C: .4byte gUnknown_0203E1F0
_08081380: .4byte gUnknown_0202BCB0

	THUMB_FUNC_END sub_8081348

	THUMB_FUNC_START sub_8081384
sub_8081384: @ 0x08081384
	push {lr}
	ldr r0, _080813B4  @ 0x000002D6
	ldr r3, _080813B8  @ gUnknown_0203E1F0
	adds r1, r3, #0
	adds r1, #0x58
	ldrb r2, [r1]
	lsls r1, r2, #2
	adds r1, r1, r2
	lsls r1, r1, #2
	adds r1, r1, r3
	ldr r1, [r1]
	ldrb r1, [r1, #0x10]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	lsls r1, r1, #4
	ldr r2, _080813BC  @ gUnknown_0202BCB0
	movs r3, #0xc
	ldrsh r2, [r2, r3]
	subs r1, r1, r2
	bl PlaySpacialSoundMaybe
	pop {r0}
	bx r0
	.align 2, 0
_080813B4: .4byte 0x000002D6
_080813B8: .4byte gUnknown_0203E1F0
_080813BC: .4byte gUnknown_0202BCB0

	THUMB_FUNC_END sub_8081384

	THUMB_FUNC_START sub_80813C0
sub_80813C0: @ 0x080813C0
	push {r4, lr}
	ldr r2, _080813F4  @ gUnknown_0203E1F0
	adds r4, r2, #0
	adds r4, #0x58
	ldrb r1, [r4]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r2, #8
	adds r0, r0, r2
	ldr r0, [r0]
	ldr r0, [r0, #0x30]
	movs r3, #0
	strh r3, [r0, #0x18]
	ldrb r1, [r4]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r0, [r0]
	ldr r0, [r0, #0x30]
	strh r3, [r0, #0x1a]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080813F4: .4byte gUnknown_0203E1F0

	THUMB_FUNC_END sub_80813C0

	THUMB_FUNC_START MapAnim_BeginSubjectFastAnim
MapAnim_BeginSubjectFastAnim: @ 0x080813F8
	push {lr}
	ldr r2, _08081418  @ gUnknown_0203E1F0
	adds r0, r2, #0
	adds r0, #0x58
	ldrb r1, [r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r2, #8
	adds r0, r0, r2
	ldr r0, [r0]
	bl MU_StartFastMoveAnim
	pop {r0}
	bx r0
	.align 2, 0
_08081418: .4byte gUnknown_0203E1F0

	THUMB_FUNC_END MapAnim_BeginSubjectFastAnim

	THUMB_FUNC_START sub_808141C
sub_808141C: @ 0x0808141C
	push {r4, lr}
	adds r3, r0, #0
	adds r4, r1, #0
	adds r0, #0x4c
	movs r2, #0
	ldrsh r1, [r0, r2]
	adds r0, r4, #0
	adds r0, #0x4c
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r0, r0, r1
	cmp r0, #0
	bgt _08081442
	adds r2, r1, #0
	cmp r0, #0
	bge _0808143E
	subs r2, #0x10
_0808143E:
	adds r1, r2, #0
	b _08081444
_08081442:
	adds r1, #0x10
_08081444:
	adds r0, r3, #0
	adds r0, #0x4c
	strh r1, [r0]
	adds r1, r3, #0
	adds r1, #0x4e
	movs r3, #0
	ldrsh r2, [r1, r3]
	adds r0, r4, #0
	adds r0, #0x4e
	movs r3, #0
	ldrsh r0, [r0, r3]
	subs r0, r0, r2
	cmp r0, #0
	bgt _0808146C
	adds r3, r2, #0
	cmp r0, #0
	bge _08081468
	subs r3, #0x10
_08081468:
	adds r2, r3, #0
	b _0808146E
_0808146C:
	adds r2, #0x10
_0808146E:
	strh r2, [r1]
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_808141C

	THUMB_FUNC_START sub_8081478
sub_8081478: @ 0x08081478
	push {r4, lr}
	adds r3, r0, #0
	adds r4, r1, #0
	adds r0, #0x4c
	movs r2, #0
	ldrsh r1, [r0, r2]
	adds r0, r4, #0
	adds r0, #0x4c
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r0, r1, r0
	cmp r0, #0
	bgt _0808149E
	adds r2, r1, #0
	cmp r0, #0
	bge _0808149A
	subs r2, #0x10
_0808149A:
	adds r1, r2, #0
	b _080814A0
_0808149E:
	adds r1, #0x10
_080814A0:
	adds r0, r3, #0
	adds r0, #0x4c
	strh r1, [r0]
	adds r1, r3, #0
	adds r1, #0x4e
	movs r3, #0
	ldrsh r2, [r1, r3]
	adds r0, r4, #0
	adds r0, #0x4e
	movs r3, #0
	ldrsh r0, [r0, r3]
	subs r0, r2, r0
	cmp r0, #0
	bgt _080814C8
	adds r3, r2, #0
	cmp r0, #0
	bge _080814C4
	subs r3, #0x10
_080814C4:
	adds r2, r3, #0
	b _080814CA
_080814C8:
	adds r2, #0x10
_080814CA:
	strh r2, [r1]
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8081478

	THUMB_FUNC_START MapAnim_MoveSubjectsTowardsTarget
MapAnim_MoveSubjectsTowardsTarget: @ 0x080814D4
	push {r4, r5, lr}
	ldr r4, _08081530  @ gUnknown_0203E1F0
	adds r0, r4, #0
	adds r0, #0x58
	ldrb r1, [r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r2, r4, #0
	adds r2, #8
	adds r0, r0, r2
	ldr r3, [r0]
	adds r0, r4, #0
	adds r0, #0x59
	ldrb r1, [r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r5, [r0]
	adds r0, r3, #0
	adds r1, r5, #0
	bl sub_808141C
	adds r0, r4, #0
	adds r0, #0x5a
	ldrh r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #3
	ands r0, r1
	cmp r0, #0
	beq _08081528
	ldr r3, [r4, #0x30]
	adds r0, r3, #0
	adds r1, r5, #0
	bl sub_808141C
	ldr r3, [r4, #0x44]
	adds r0, r3, #0
	adds r1, r5, #0
	bl sub_808141C
_08081528:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08081530: .4byte gUnknown_0203E1F0

	THUMB_FUNC_END MapAnim_MoveSubjectsTowardsTarget

	THUMB_FUNC_START MapAnim_MoveSubjectsAwayFromTarget
MapAnim_MoveSubjectsAwayFromTarget: @ 0x08081534
	push {r4, r5, lr}
	ldr r4, _08081590  @ gUnknown_0203E1F0
	adds r0, r4, #0
	adds r0, #0x58
	ldrb r1, [r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r2, r4, #0
	adds r2, #8
	adds r0, r0, r2
	ldr r3, [r0]
	adds r0, r4, #0
	adds r0, #0x59
	ldrb r1, [r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r5, [r0]
	adds r0, r3, #0
	adds r1, r5, #0
	bl sub_8081478
	adds r0, r4, #0
	adds r0, #0x5a
	ldrh r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #3
	ands r0, r1
	cmp r0, #0
	beq _08081588
	ldr r3, [r4, #0x30]
	adds r0, r3, #0
	adds r1, r5, #0
	bl sub_8081478
	ldr r3, [r4, #0x44]
	adds r0, r3, #0
	adds r1, r5, #0
	bl sub_8081478
_08081588:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08081590: .4byte gUnknown_0203E1F0

	THUMB_FUNC_END MapAnim_MoveSubjectsAwayFromTarget

	THUMB_FUNC_START MapAnim_MoveCameraOnSubject
MapAnim_MoveCameraOnSubject: @ 0x08081594
	push {lr}
	ldr r3, _080815BC  @ gUnknown_0203E1F0
	adds r1, r3, #0
	adds r1, #0x58
	ldrb r2, [r1]
	lsls r1, r2, #2
	adds r1, r1, r2
	lsls r1, r1, #2
	adds r1, r1, r3
	ldr r2, [r1]
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	ldrb r2, [r2, #0x11]
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	bl EnsureCameraOntoPosition
	pop {r0}
	bx r0
	.align 2, 0
_080815BC: .4byte gUnknown_0203E1F0

	THUMB_FUNC_END MapAnim_MoveCameraOnSubject

	THUMB_FUNC_START MapAnim_MoveCameraOnTarget
MapAnim_MoveCameraOnTarget: @ 0x080815C0
	push {lr}
	ldr r3, _080815E8  @ gUnknown_0203E1F0
	adds r1, r3, #0
	adds r1, #0x59
	ldrb r2, [r1]
	lsls r1, r2, #2
	adds r1, r1, r2
	lsls r1, r1, #2
	adds r1, r1, r3
	ldr r2, [r1]
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	ldrb r2, [r2, #0x11]
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	bl EnsureCameraOntoPosition
	pop {r0}
	bx r0
	.align 2, 0
_080815E8: .4byte gUnknown_0203E1F0

	THUMB_FUNC_END MapAnim_MoveCameraOnTarget

	THUMB_FUNC_START sub_80815EC
sub_80815EC: @ 0x080815EC
	push {r4, lr}
	ldr r2, _08081614  @ gUnknown_0203E1F0
	ldr r1, _08081618  @ gBattleTarget
	adds r3, r1, #0
	adds r3, #0x73
	ldrb r3, [r3]
	adds r4, r2, #0
	adds r4, #0x60
	strb r3, [r4]
	adds r1, #0x74
	ldrb r1, [r1]
	adds r2, #0x61
	strb r1, [r2]
	ldrb r1, [r4]
	ldrb r2, [r2]
	bl EnsureCameraOntoPosition
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08081614: .4byte gUnknown_0203E1F0
_08081618: .4byte gBattleTarget

	THUMB_FUNC_END sub_80815EC

	THUMB_FUNC_START MapAnim_BeginRoundSpecificAnims
MapAnim_BeginRoundSpecificAnims: @ 0x0808161C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	ldr r1, _08081648  @ gUnknown_0203E1F0
	adds r0, r1, #0
	adds r0, #0x58
	ldrb r0, [r0]
	mov sl, r0
	adds r0, r1, #0
	adds r0, #0x5a
	ldrh r2, [r0]
	movs r0, #0x80
	ands r0, r2
	adds r7, r1, #0
	cmp r0, #0
	beq _0808164C
	mov r5, sl
	b _08081652
	.align 2, 0
_08081648: .4byte gUnknown_0203E1F0
_0808164C:
	adds r0, r7, #0
	adds r0, #0x59
	ldrb r5, [r0]
_08081652:
	adds r6, r7, #0
	mov r0, sl
	lsls r4, r0, #2
	adds r0, r4, r0
	lsls r0, r0, #2
	adds r1, r6, #4
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, #0x4a
	ldrh r0, [r0]
	bl GetSpellAssocReturnBool
	lsls r0, r0, #0x18
	str r4, [sp]
	cmp r0, #0
	bne _08081692
	adds r0, r6, #0
	adds r0, #0x5a
	ldrh r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _08081682
	b _080818C4
_08081682:
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #2
	adds r0, r0, r6
	ldr r0, [r0]
	bl MapAnim_BeginMISSAnim
	b _080818C4
_08081692:
	adds r1, r6, #0
	adds r1, #0x5f
	movs r0, #1
	strb r0, [r1]
	ldr r0, [r6]
	adds r0, #0x30
	ldrb r1, [r0]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #0xa
	bne _080816BA
	adds r0, r6, #0
	adds r0, #0x5d
	movs r1, #0
	ldrsb r1, [r0, r1]
	negs r1, r1
	mov r0, sl
	bl sub_80818D8
	b _080816C8
_080816BA:
	adds r0, r7, #0
	adds r0, #0x5d
	movs r1, #0
	ldrsb r1, [r0, r1]
	adds r0, r5, #0
	bl sub_80818D8
_080816C8:
	ldr r6, _08081728  @ gUnknown_0203E1F0
	adds r4, r6, #0
	adds r4, #0x5a
	ldrh r1, [r4]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080816EA
	adds r0, r6, #0
	adds r0, #0x5d
	movs r1, #0
	ldrsb r1, [r0, r1]
	negs r1, r1
	mov r0, sl
	bl sub_80818D8
_080816EA:
	adds r0, r6, #0
	adds r0, #0x5d
	movs r2, #0
	ldrsb r2, [r0, r2]
	cmp r2, #0
	bge _080816F8
	b _080818C4
_080816F8:
	ldrh r1, [r4]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08081730
	lsls r4, r5, #2
	adds r4, r4, r5
	lsls r4, r4, #2
	adds r4, r4, r6
	ldr r0, [r4]
	movs r1, #0x10
	ldrsb r1, [r0, r1]
	lsls r1, r1, #4
	ldr r0, _0808172C  @ gUnknown_0202BCB0
	movs r2, #0xc
	ldrsh r0, [r0, r2]
	subs r1, r1, r0
	movs r0, #0xc8
	bl PlaySpacialSoundMaybe
	ldr r0, [r4]
	bl MapAnim_BeginMISSAnim
	b _080818C4
	.align 2, 0
_08081728: .4byte gUnknown_0203E1F0
_0808172C: .4byte gUnknown_0202BCB0
_08081730:
	cmp r2, #0
	bne _08081770
	movs r0, #0x80
	lsls r0, r0, #6
	ands r0, r1
	cmp r0, #0
	beq _08081740
	b _080818C4
_08081740:
	ldr r0, _08081768  @ 0x000002CE
	lsls r4, r5, #2
	adds r4, r4, r5
	lsls r4, r4, #2
	adds r4, r4, r6
	ldr r1, [r4]
	ldrb r1, [r1, #0x10]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	lsls r1, r1, #4
	ldr r2, _0808176C  @ gUnknown_0202BCB0
	movs r3, #0xc
	ldrsh r2, [r2, r3]
	subs r1, r1, r2
	bl PlaySpacialSoundMaybe
	ldr r0, [r4]
	bl MapAnim_BeginNODAMAGEAnim
	b _080818C4
	.align 2, 0
_08081768: .4byte 0x000002CE
_0808176C: .4byte gUnknown_0202BCB0
_08081770:
	movs r3, #0
	lsls r2, r5, #2
	adds r0, r2, r5
	lsls r0, r0, #2
	adds r1, r6, #4
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, #0x55
	ldrb r0, [r0]
	adds r4, r2, #0
	cmp r0, #0x1b
	beq _0808178C
	cmp r0, #0x33
	bne _0808178E
_0808178C:
	movs r3, #1
_0808178E:
	cmp r3, #0
	beq _080817CA
	ldr r2, _080817B4  @ gUnknown_0203E1F0
	adds r0, r2, #0
	adds r0, #0x5c
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080817B8
	movs r6, #0xaf
	adds r0, r4, r5
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r0, [r0]
	movs r1, #1
	bl MapAnim_BeginWallBreakAnim
	b _080817FA
	.align 2, 0
_080817B4: .4byte gUnknown_0203E1F0
_080817B8:
	movs r6, #0xb0
	adds r0, r4, r5
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r0, [r0]
	movs r1, #0
	bl MapAnim_BeginWallBreakAnim
	b _080817FA
_080817CA:
	ldr r2, _080817E0  @ gUnknown_0203E1F0
	ldr r0, [r2]
	adds r0, #0x30
	ldrb r1, [r0]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #0xa
	bne _080817E8
	ldr r6, _080817E4  @ 0x000003C9
	b _080817FA
	.align 2, 0
_080817E0: .4byte gUnknown_0203E1F0
_080817E4: .4byte 0x000003C9
_080817E8:
	adds r0, r2, #0
	adds r0, #0x5c
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	movs r6, #0xd2
	cmp r0, #0
	beq _080817FA
	movs r6, #0xd5
_080817FA:
	ldr r7, _08081878  @ gUnknown_0203E1F0
	adds r0, r7, #0
	adds r0, #0x5a
	ldrh r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08081880
	adds r4, r4, r5
	lsls r4, r4, #2
	adds r0, r4, r7
	mov r9, r0
	ldr r0, [r0]
	movs r1, #0x10
	ldrsb r1, [r0, r1]
	lsls r1, r1, #4
	ldr r2, _0808187C  @ gUnknown_0202BCB0
	mov r8, r2
	movs r3, #0xc
	ldrsh r0, [r2, r3]
	subs r1, r1, r0
	adds r0, r6, #0
	bl PlaySpacialSoundMaybe
	adds r6, r7, #0
	adds r6, #8
	adds r4, r4, r6
	ldr r5, [r4]
	ldr r4, [sp]
	add r4, sl
	lsls r4, r4, #2
	adds r0, r7, #4
	adds r0, r4, r0
	ldr r0, [r0]
	adds r0, #0x4a
	ldrh r0, [r0]
	bl GetSpellAssocFlashColor
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r5, #0
	bl MU_StartCritFlash
	bl NewBG0Shaker
	mov r1, r9
	ldr r0, [r1]
	movs r1, #0x10
	ldrsb r1, [r0, r1]
	lsls r1, r1, #4
	mov r2, r8
	movs r3, #0xc
	ldrsh r0, [r2, r3]
	subs r1, r1, r0
	movs r0, #0xd8
	bl PlaySpacialSoundMaybe
	adds r4, r4, r6
	ldr r0, [r4]
	bl MU_StartFastMoveAnim
	b _080818C4
	.align 2, 0
_08081878: .4byte gUnknown_0203E1F0
_0808187C: .4byte gUnknown_0202BCB0
_08081880:
	adds r4, r4, r5
	lsls r4, r4, #2
	adds r0, r4, r7
	ldr r0, [r0]
	movs r1, #0x10
	ldrsb r1, [r0, r1]
	lsls r1, r1, #4
	ldr r0, _080818D4  @ gUnknown_0202BCB0
	movs r2, #0xc
	ldrsh r0, [r0, r2]
	subs r1, r1, r0
	adds r0, r6, #0
	bl PlaySpacialSoundMaybe
	adds r0, r7, #0
	adds r0, #8
	adds r4, r4, r0
	ldr r4, [r4]
	ldr r0, [sp]
	add r0, sl
	lsls r0, r0, #2
	adds r1, r7, #4
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, #0x4a
	ldrh r0, [r0]
	bl GetSpellAssocFlashColor
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r4, #0
	bl MU_StartHitFlash
_080818C4:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080818D4: .4byte gUnknown_0202BCB0

	THUMB_FUNC_END MapAnim_BeginRoundSpecificAnims

	THUMB_FUNC_START sub_80818D8
sub_80818D8: @ 0x080818D8
	push {r4, lr}
	adds r3, r0, #0
	adds r4, r1, #0
	ldr r1, _080818F4  @ gUnknown_0203E1F0
	lsls r0, r3, #2
	adds r0, r0, r3
	lsls r0, r0, #2
	adds r2, r0, r1
	ldrb r0, [r2, #0xd]
	cmp r0, r4
	bgt _080818F8
	movs r0, #0
	b _080818FA
	.align 2, 0
_080818F4: .4byte gUnknown_0203E1F0
_080818F8:
	subs r0, r0, r4
_080818FA:
	strb r0, [r2, #0xd]
	lsls r0, r3, #2
	adds r0, r0, r3
	lsls r0, r0, #2
	adds r1, r0, r1
	ldrb r2, [r1, #0xc]
	ldrb r0, [r1, #0xd]
	cmp r0, r2
	bls _0808190E
	strb r2, [r1, #0xd]
_0808190E:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80818D8

	THUMB_FUNC_START MapAnim_WaitForHPToEndChangingMaybe
MapAnim_WaitForHPToEndChangingMaybe: @ 0x08081914
	push {lr}
	adds r1, r0, #0
	ldr r0, _0808192C  @ gUnknown_0203E1F0
	adds r0, #0x5f
	ldrb r0, [r0]
	cmp r0, #0
	bne _08081928
	adds r0, r1, #0
	bl Proc_Break
_08081928:
	pop {r0}
	bx r0
	.align 2, 0
_0808192C: .4byte gUnknown_0203E1F0

	THUMB_FUNC_END MapAnim_WaitForHPToEndChangingMaybe

	THUMB_FUNC_START MapAnim_PoisonEffectOnTarget
MapAnim_PoisonEffectOnTarget: @ 0x08081930
	push {lr}
	ldr r2, _0808194C  @ gUnknown_0203E1F0
	adds r0, r2, #0
	adds r0, #0x59
	ldrb r1, [r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r0, [r0]
	bl NewMapPoisonEffect
	pop {r0}
	bx r0
	.align 2, 0
_0808194C: .4byte gUnknown_0203E1F0

	THUMB_FUNC_END MapAnim_PoisonEffectOnTarget

	THUMB_FUNC_START sub_8081950
sub_8081950: @ 0x08081950
	push {lr}
	ldr r2, _0808196C  @ gUnknown_0203E1F0
	adds r0, r2, #0
	adds r0, #0x59
	ldrb r1, [r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r0, [r0]
	bl sub_807CD18
	pop {r0}
	bx r0
	.align 2, 0
_0808196C: .4byte gUnknown_0203E1F0

	THUMB_FUNC_END sub_8081950

	THUMB_FUNC_START sub_8081970
sub_8081970: @ 0x08081970
	push {lr}
	ldr r2, _08081994  @ gUnknown_0203E1F0
	ldrb r0, [r2, #0xd]
	ldrb r1, [r2, #0xc]
	cmp r0, r1
	bcc _08081998
	adds r0, r2, #0
	adds r0, #0x59
	ldrb r0, [r0]
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	ldr r0, [r1]
	bl sub_807CDD0
	b _0808199E
	.align 2, 0
_08081994: .4byte gUnknown_0203E1F0
_08081998:
	ldr r0, _080819A4  @ gUnknown_089A5124
	bl Proc_EndEach
_0808199E:
	pop {r0}
	bx r0
	.align 2, 0
_080819A4: .4byte gUnknown_089A5124

	THUMB_FUNC_END sub_8081970

	THUMB_FUNC_START sub_80819A8
sub_80819A8: @ 0x080819A8
	push {lr}
	ldr r2, _080819C4  @ gUnknown_0203E1F0
	adds r0, r2, #0
	adds r0, #0x59
	ldrb r1, [r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r0, [r0]
	bl sub_807E48C
	pop {r0}
	bx r0
	.align 2, 0
_080819C4: .4byte gUnknown_0203E1F0

	THUMB_FUNC_END sub_80819A8

	THUMB_FUNC_START sub_80819C8
sub_80819C8: @ 0x080819C8
	push {lr}
	ldr r2, _080819E4  @ gUnknown_0203E1F0
	adds r0, r2, #0
	adds r0, #0x59
	ldrb r1, [r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r0, [r0]
	bl sub_807E638
	pop {r0}
	bx r0
	.align 2, 0
_080819E4: .4byte gUnknown_0203E1F0

	THUMB_FUNC_END sub_80819C8

	THUMB_FUNC_START sub_80819E8
sub_80819E8: @ 0x080819E8
	push {lr}
	ldr r2, _08081A04  @ gUnknown_0203E1F0
	adds r0, r2, #0
	adds r0, #0x58
	ldrb r1, [r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r0, [r0]
	bl sub_807D0B4
	pop {r0}
	bx r0
	.align 2, 0
_08081A04: .4byte gUnknown_0203E1F0

	THUMB_FUNC_END sub_80819E8

	THUMB_FUNC_START sub_8081A08
sub_8081A08: @ 0x08081A08
	push {lr}
	ldr r2, _08081A24  @ gUnknown_0203E1F0
	adds r0, r2, #0
	adds r0, #0x58
	ldrb r1, [r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r0, [r0]
	bl sub_807D4D4
	pop {r0}
	bx r0
	.align 2, 0
_08081A24: .4byte gUnknown_0203E1F0

	THUMB_FUNC_END sub_8081A08

	THUMB_FUNC_START sub_8081A28
sub_8081A28: @ 0x08081A28
	push {lr}
	ldr r2, _08081A48  @ gUnknown_0203E1F0
	adds r0, r2, #0
	adds r0, #0x58
	ldrb r1, [r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r0, [r0]
	ldr r1, _08081A4C  @ gUnknown_089AE804
	ldr r2, _08081A50  @ gUnknown_089AF930
	bl sub_807D688
	pop {r0}
	bx r0
	.align 2, 0
_08081A48: .4byte gUnknown_0203E1F0
_08081A4C: .4byte gUnknown_089AE804
_08081A50: .4byte gUnknown_089AF930

	THUMB_FUNC_END sub_8081A28

	THUMB_FUNC_START sub_8081A54
sub_8081A54: @ 0x08081A54
	push {lr}
	ldr r2, _08081A74  @ gUnknown_0203E1F0
	adds r0, r2, #0
	adds r0, #0x58
	ldrb r1, [r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r0, [r0]
	ldr r1, _08081A78  @ gUnknown_089AE804
	ldr r2, _08081A7C  @ gUnknown_089AF910
	bl sub_807D688
	pop {r0}
	bx r0
	.align 2, 0
_08081A74: .4byte gUnknown_0203E1F0
_08081A78: .4byte gUnknown_089AE804
_08081A7C: .4byte gUnknown_089AF910

	THUMB_FUNC_END sub_8081A54

	THUMB_FUNC_START sub_8081A80
sub_8081A80: @ 0x08081A80
	push {lr}
	ldr r2, _08081AA4  @ gUnknown_0203E1F0
	adds r0, r2, #0
	adds r0, #0x59
	ldrb r1, [r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r0, [r0]
	ldr r1, _08081AA8  @ gUnknown_089AFCBC
	ldr r2, _08081AAC  @ gUnknown_089AFF78
	movs r3, #0x8b
	bl NewMapAnimEffectAnimator
	pop {r0}
	bx r0
	.align 2, 0
_08081AA4: .4byte gUnknown_0203E1F0
_08081AA8: .4byte gUnknown_089AFCBC
_08081AAC: .4byte gUnknown_089AFF78

	THUMB_FUNC_END sub_8081A80

	THUMB_FUNC_START sub_8081AB0
sub_8081AB0: @ 0x08081AB0
	push {lr}
	ldr r2, _08081AD4  @ gUnknown_0203E1F0
	adds r0, r2, #0
	adds r0, #0x59
	ldrb r1, [r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r0, [r0]
	ldr r1, _08081AD8  @ gUnknown_089AF950
	ldr r2, _08081ADC  @ gUnknown_089AFF78
	movs r3, #0x89
	bl NewMapAnimEffectAnimator
	pop {r0}
	bx r0
	.align 2, 0
_08081AD4: .4byte gUnknown_0203E1F0
_08081AD8: .4byte gUnknown_089AF950
_08081ADC: .4byte gUnknown_089AFF78

	THUMB_FUNC_END sub_8081AB0

	THUMB_FUNC_START sub_8081AE0
sub_8081AE0: @ 0x08081AE0
	push {lr}
	ldr r2, _08081B04  @ gUnknown_0203E1F0
	adds r0, r2, #0
	adds r0, #0x59
	ldrb r1, [r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r0, [r0]
	ldr r1, _08081B08  @ gUnknown_089AFAC4
	ldr r2, _08081B0C  @ gUnknown_089AFF78
	movs r3, #0x8a
	bl NewMapAnimEffectAnimator
	pop {r0}
	bx r0
	.align 2, 0
_08081B04: .4byte gUnknown_0203E1F0
_08081B08: .4byte gUnknown_089AFAC4
_08081B0C: .4byte gUnknown_089AFF78

	THUMB_FUNC_END sub_8081AE0

	THUMB_FUNC_START sub_8081B10
sub_8081B10: @ 0x08081B10
	push {lr}
	ldr r2, _08081B34  @ gUnknown_0203E1F0
	adds r0, r2, #0
	adds r0, #0x59
	ldrb r1, [r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r0, [r0]
	ldr r1, _08081B38  @ gUnknown_089AFCBC
	ldr r2, _08081B3C  @ gUnknown_089AFF78
	movs r3, #0x8b
	bl NewMapAnimEffectAnimator
	pop {r0}
	bx r0
	.align 2, 0
_08081B34: .4byte gUnknown_0203E1F0
_08081B38: .4byte gUnknown_089AFCBC
_08081B3C: .4byte gUnknown_089AFF78

	THUMB_FUNC_END sub_8081B10

	THUMB_FUNC_START sub_8081B40
sub_8081B40: @ 0x08081B40
	push {lr}
	ldr r2, _08081B64  @ gUnknown_0203E1F0
	adds r0, r2, #0
	adds r0, #0x59
	ldrb r1, [r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r0, [r0]
	ldr r1, _08081B68  @ gUnknown_089AF950
	ldr r2, _08081B6C  @ gUnknown_089AFF78
	movs r3, #0x89
	bl NewMapAnimEffectAnimator
	pop {r0}
	bx r0
	.align 2, 0
_08081B64: .4byte gUnknown_0203E1F0
_08081B68: .4byte gUnknown_089AF950
_08081B6C: .4byte gUnknown_089AFF78

	THUMB_FUNC_END sub_8081B40

	THUMB_FUNC_START sub_8081B70
sub_8081B70: @ 0x08081B70
	push {lr}
	ldr r0, _08081BC0  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08081B84
	movs r0, #0xb4
	bl m4aSongNumStart
_08081B84:
	ldr r3, _08081BC4  @ gUnknown_0203E1F0
	ldr r1, _08081BC8  @ gBattleTarget
	adds r0, r1, #0
	adds r0, #0x73
	ldrb r2, [r0]
	adds r0, r3, #0
	adds r0, #0x60
	strb r2, [r0]
	adds r1, #0x74
	ldrb r0, [r1]
	adds r1, r3, #0
	adds r1, #0x61
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x59
	ldrb r1, [r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	ldr r0, [r0]
	movs r1, #0x10
	ldrsb r1, [r0, r1]
	movs r2, #0x11
	ldrsb r2, [r0, r2]
	bl New6C_SomethingFlashy
	pop {r0}
	bx r0
	.align 2, 0
_08081BC0: .4byte gRAMChapterData
_08081BC4: .4byte gUnknown_0203E1F0
_08081BC8: .4byte gBattleTarget

	THUMB_FUNC_END sub_8081B70

	THUMB_FUNC_START sub_8081BCC
sub_8081BCC: @ 0x08081BCC
	push {lr}
	ldr r2, _08081BF4  @ gUnknown_0203E1F0
	adds r0, r2, #0
	adds r0, #0x59
	ldrb r1, [r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r0, [r0]
	adds r1, r2, #0
	adds r1, #0x60
	ldrb r1, [r1]
	adds r2, #0x61
	ldrb r2, [r2]
	bl New6C_SomethingFlashy
	pop {r0}
	bx r0
	.align 2, 0
_08081BF4: .4byte gUnknown_0203E1F0

	THUMB_FUNC_END sub_8081BCC

	THUMB_FUNC_START sub_8081BF8
sub_8081BF8: @ 0x08081BF8
	push {lr}
	ldr r2, _08081C14  @ gUnknown_0203E1F0
	adds r0, r2, #0
	adds r0, #0x58
	ldrb r1, [r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r0, [r0]
	bl sub_807DBA8
	pop {r0}
	bx r0
	.align 2, 0
_08081C14: .4byte gUnknown_0203E1F0

	THUMB_FUNC_END sub_8081BF8

	THUMB_FUNC_START sub_8081C18
sub_8081C18: @ 0x08081C18
	push {lr}
	ldr r1, _08081C30  @ gUnknown_0203E1F0
	adds r0, r1, #0
	adds r0, #0x60
	ldrb r0, [r0]
	adds r1, #0x61
	ldrb r1, [r1]
	bl sub_807E760
	pop {r0}
	bx r0
	.align 2, 0
_08081C30: .4byte gUnknown_0203E1F0

	THUMB_FUNC_END sub_8081C18

	THUMB_FUNC_START sub_8081C34
sub_8081C34: @ 0x08081C34
	push {lr}
	ldr r2, _08081C50  @ gUnknown_0203E1F0
	adds r0, r2, #0
	adds r0, #0x59
	ldrb r1, [r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r0, [r0]
	bl sub_807DD80
	pop {r0}
	bx r0
	.align 2, 0
_08081C50: .4byte gUnknown_0203E1F0

	THUMB_FUNC_END sub_8081C34

	THUMB_FUNC_START sub_8081C54
sub_8081C54: @ 0x08081C54
	push {lr}
	ldr r2, _08081C70  @ gUnknown_0203E1F0
	adds r0, r2, #0
	adds r0, #0x59
	ldrb r1, [r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r0, [r0]
	bl sub_807DFF4
	pop {r0}
	bx r0
	.align 2, 0
_08081C70: .4byte gUnknown_0203E1F0

	THUMB_FUNC_END sub_8081C54

	THUMB_FUNC_START sub_8081C74
sub_8081C74: @ 0x08081C74
	push {lr}
	ldr r2, _08081C90  @ gUnknown_0203E1F0
	adds r0, r2, #0
	adds r0, #0x59
	ldrb r1, [r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r0, [r0]
	bl sub_807E0D4
	pop {r0}
	bx r0
	.align 2, 0
_08081C90: .4byte gUnknown_0203E1F0

	THUMB_FUNC_END sub_8081C74

	THUMB_FUNC_START sub_8081C94
sub_8081C94: @ 0x08081C94
	push {lr}
	ldr r2, _08081CB0  @ gUnknown_0203E1F0
	adds r0, r2, #0
	adds r0, #0x59
	ldrb r1, [r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r0, [r0]
	bl sub_807E1E4
	pop {r0}
	bx r0
	.align 2, 0
_08081CB0: .4byte gUnknown_0203E1F0

	THUMB_FUNC_END sub_8081C94

	THUMB_FUNC_START sub_8081CB4
sub_8081CB4: @ 0x08081CB4
	push {lr}
	ldr r2, _08081CD0  @ gUnknown_0203E1F0
	adds r0, r2, #0
	adds r0, #0x59
	ldrb r1, [r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r0, [r0]
	bl sub_807DE30
	pop {r0}
	bx r0
	.align 2, 0
_08081CD0: .4byte gUnknown_0203E1F0

	THUMB_FUNC_END sub_8081CB4

	THUMB_FUNC_START sub_8081CD4
sub_8081CD4: @ 0x08081CD4
	push {lr}
	ldr r2, _08081CF4  @ gUnknown_0203E1F0
	adds r0, r2, #0
	adds r0, #0x59
	ldrb r1, [r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r2, #8
	adds r0, r0, r2
	ldr r0, [r0]
	movs r1, #0
	bl MU_StartFlashFade
	pop {r0}
	bx r0
	.align 2, 0
_08081CF4: .4byte gUnknown_0203E1F0

	THUMB_FUNC_END sub_8081CD4

	THUMB_FUNC_START sub_8081CF8
sub_8081CF8: @ 0x08081CF8
	push {lr}
	ldr r2, _08081D18  @ gUnknown_0203E1F0
	adds r0, r2, #0
	adds r0, #0x59
	ldrb r1, [r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r2, #8
	adds r0, r0, r2
	ldr r0, [r0]
	bl MU_8079858
	pop {r0}
	bx r0
	.align 2, 0
_08081D18: .4byte gUnknown_0203E1F0

	THUMB_FUNC_END sub_8081CF8

	THUMB_FUNC_START sub_8081D1C
sub_8081D1C: @ 0x08081D1C
	push {lr}
	ldr r2, _08081D3C  @ gUnknown_0203E1F0
	adds r0, r2, #0
	adds r0, #0x59
	ldrb r1, [r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r2, #8
	adds r0, r0, r2
	ldr r0, [r0]
	bl MU_Hide
	pop {r0}
	bx r0
	.align 2, 0
_08081D3C: .4byte gUnknown_0203E1F0

	THUMB_FUNC_END sub_8081D1C

	THUMB_FUNC_START sub_8081D40
sub_8081D40: @ 0x08081D40
	push {r4, lr}
	ldr r2, _08081D7C  @ gUnknown_0203E1F0
	adds r0, r2, #0
	adds r0, #0x59
	ldrb r1, [r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r3, [r0]
	movs r0, #0x10
	ldrsb r0, [r3, r0]
	lsls r0, r0, #4
	ldr r2, _08081D80  @ gUnknown_0202BCB0
	movs r4, #0xc
	ldrsh r1, [r2, r4]
	subs r0, r0, r1
	adds r0, #8
	movs r1, #0x11
	ldrsb r1, [r3, r1]
	lsls r1, r1, #4
	movs r3, #0xe
	ldrsh r2, [r2, r3]
	subs r1, r1, r2
	adds r1, #8
	bl StartStarExplosionEffect
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08081D7C: .4byte gUnknown_0203E1F0
_08081D80: .4byte gUnknown_0202BCB0

	THUMB_FUNC_END sub_8081D40

	THUMB_FUNC_START sub_8081D84
sub_8081D84: @ 0x08081D84
	push {r4, lr}
	ldr r0, _08081DD4  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08081D98
	movs r0, #0xb5
	bl m4aSongNumStart
_08081D98:
	ldr r2, _08081DD8  @ gUnknown_0203E1F0
	adds r0, r2, #0
	adds r0, #0x59
	ldrb r1, [r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r3, [r0]
	movs r0, #0x10
	ldrsb r0, [r3, r0]
	lsls r0, r0, #4
	ldr r2, _08081DDC  @ gUnknown_0202BCB0
	movs r4, #0xc
	ldrsh r1, [r2, r4]
	subs r0, r0, r1
	adds r0, #8
	movs r1, #0x11
	ldrsb r1, [r3, r1]
	lsls r1, r1, #4
	movs r3, #0xe
	ldrsh r2, [r2, r3]
	subs r1, r1, r2
	adds r1, #8
	bl StartStarImplosionEffect
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08081DD4: .4byte gRAMChapterData
_08081DD8: .4byte gUnknown_0203E1F0
_08081DDC: .4byte gUnknown_0202BCB0

	THUMB_FUNC_END sub_8081D84

	THUMB_FUNC_START sub_8081DE0
sub_8081DE0: @ 0x08081DE0
	push {lr}
	ldr r2, _08081E00  @ gUnknown_0203E1F0
	adds r0, r2, #0
	adds r0, #0x59
	ldrb r1, [r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r2, #8
	adds r0, r0, r2
	ldr r0, [r0]
	bl MU_Show
	pop {r0}
	bx r0
	.align 2, 0
_08081E00: .4byte gUnknown_0203E1F0

	THUMB_FUNC_END sub_8081DE0

	THUMB_FUNC_START sub_8081E04
sub_8081E04: @ 0x08081E04
	push {r4, r5, r6, lr}
	ldr r2, _08081E44  @ gUnknown_0203E1F0
	adds r0, r2, #0
	adds r0, #0x59
	ldrb r1, [r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r1, r0, r2
	ldr r6, [r1]
	adds r1, r2, #0
	adds r1, #8
	adds r0, r0, r1
	ldr r0, [r0]
	adds r5, r2, #0
	adds r5, #0x60
	ldrb r1, [r5]
	lsls r1, r1, #4
	adds r4, r2, #0
	adds r4, #0x61
	ldrb r2, [r4]
	lsls r2, r2, #4
	bl MU_SetDisplayPosition
	ldrb r0, [r5]
	strb r0, [r6, #0x10]
	ldrb r0, [r4]
	strb r0, [r6, #0x11]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08081E44: .4byte gUnknown_0203E1F0

	THUMB_FUNC_END sub_8081E04

	THUMB_FUNC_START sub_8081E48
sub_8081E48: @ 0x08081E48
	push {lr}
	bl sub_807F568
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8081E48

	THUMB_FUNC_START sub_8081E54
sub_8081E54: @ 0x08081E54
	push {lr}
	bl sub_807F5C8
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8081E54

	THUMB_FUNC_START sub_8081E60
sub_8081E60: @ 0x08081E60
	push {lr}
	bl RefreshEntityBmMaps
	bl RenderBmMap
	bl SMS_UpdateFromGameData
	bl MU_EndAll
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8081E60

	THUMB_FUNC_START sub_8081E78
sub_8081E78: @ 0x08081E78
	push {r4, r5, lr}
	ldr r4, _08081EA0  @ gUnknown_0203E254
	adds r0, r4, #0
	bl sub_80823A0
	movs r0, #0xa0
	lsls r0, r0, #2
	adds r5, r4, r0
	adds r0, r5, #0
	bl sub_80823A0
	ldr r0, _08081EA4  @ gUnknown_0203E754
	str r4, [r0]
	str r5, [r0, #4]
	ldr r0, _08081EA8  @ gUnknown_0203E75C
	str r4, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08081EA0: .4byte gUnknown_0203E254
_08081EA4: .4byte gUnknown_0203E754
_08081EA8: .4byte gUnknown_0203E75C

	THUMB_FUNC_END sub_8081E78

	THUMB_FUNC_START sub_8081EAC
sub_8081EAC: @ 0x08081EAC
	push {lr}
	ldr r3, _08081F1C  @ gLCDControlBuffer
	ldrb r0, [r3, #1]
	movs r1, #0x20
	orrs r0, r1
	movs r1, #0x41
	negs r1, r1
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r3, #1]
	adds r1, r3, #0
	adds r1, #0x2d
	movs r0, #0
	strb r0, [r1]
	adds r1, #4
	strb r0, [r1]
	subs r1, #5
	movs r0, #0xf0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0xa0
	strb r0, [r1]
	adds r2, r3, #0
	adds r2, #0x34
	ldrb r1, [r2]
	subs r0, #0xa2
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
	strb r0, [r2]
	adds r2, #2
	ldrb r0, [r2]
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
	strb r0, [r2]
	ldr r0, _08081F20  @ sub_8081F64
	bl SetPrimaryHBlankHandler
	pop {r0}
	bx r0
	.align 2, 0
_08081F1C: .4byte gLCDControlBuffer
_08081F20: .4byte sub_8081F64

	THUMB_FUNC_END sub_8081EAC

	THUMB_FUNC_START sub_8081F24
sub_8081F24: @ 0x08081F24
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r5, r0, #0
	adds r6, r1, #0
	mov r8, r2
	ldr r4, _08081F54  @ gUnknown_0203E754
	ldr r0, [r4, #4]
	bl sub_80823A0
	ldr r0, [r4, #4]
	adds r1, r5, #0
	adds r2, r6, #0
	mov r3, r8
	bl sub_80823FC
	bl sub_8082390
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08081F54: .4byte gUnknown_0203E754

	THUMB_FUNC_END sub_8081F24

	THUMB_FUNC_START sub_8081F58
sub_8081F58: @ 0x08081F58
	push {lr}
	movs r0, #0
	bl SetPrimaryHBlankHandler
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8081F58

	THUMB_FUNC_START sub_8081F64
sub_8081F64: @ 0x08081F64
	push {lr}
	ldr r0, _08081F7C  @ 0x04000006
	ldrh r0, [r0]
	adds r3, r0, #0
	cmp r3, #0x9f
	bls _08081F88
	ldr r0, _08081F80  @ gUnknown_0203E75C
	ldr r1, _08081F84  @ gUnknown_0203E754
	ldr r1, [r1]
	str r1, [r0]
	movs r3, #0
	b _08081F90
	.align 2, 0
_08081F7C: .4byte 0x04000006
_08081F80: .4byte gUnknown_0203E75C
_08081F84: .4byte gUnknown_0203E754
_08081F88:
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	ldr r0, _08081FA0  @ gUnknown_0203E75C
_08081F90:
	ldr r2, _08081FA4  @ 0x04000040
	ldr r1, [r0]
	lsls r0, r3, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r2]
	pop {r0}
	bx r0
	.align 2, 0
_08081FA0: .4byte gUnknown_0203E75C
_08081FA4: .4byte 0x04000040

	THUMB_FUNC_END sub_8081F64

	THUMB_FUNC_START sub_8081FA8
sub_8081FA8: @ 0x08081FA8
	push {lr}
	ldr r0, _08081FC0  @ 0x04000006
	ldrh r0, [r0]
	adds r3, r0, #0
	cmp r3, #0x9f
	bls _08081FCC
	ldr r0, _08081FC4  @ gUnknown_0203E75C
	ldr r1, _08081FC8  @ gUnknown_0203E754
	ldr r1, [r1]
	str r1, [r0]
	movs r3, #0
	b _08081FD4
	.align 2, 0
_08081FC0: .4byte 0x04000006
_08081FC4: .4byte gUnknown_0203E75C
_08081FC8: .4byte gUnknown_0203E754
_08081FCC:
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	ldr r0, _08081FF0  @ gUnknown_0203E75C
_08081FD4:
	ldr r2, _08081FF4  @ 0x04000040
	ldr r1, [r0]
	lsls r0, r3, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	strh r1, [r2]
	ldr r1, _08081FF8  @ 0x04000018
	movs r2, #0xa0
	lsls r2, r2, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_08081FF0: .4byte gUnknown_0203E75C
_08081FF4: .4byte 0x04000040
_08081FF8: .4byte 0x04000018

	THUMB_FUNC_END sub_8081FA8

	THUMB_FUNC_START sub_8081FFC
sub_8081FFC: @ 0x08081FFC
	push {lr}
	ldr r0, _08082014  @ 0x04000006
	ldrh r0, [r0]
	adds r3, r0, #0
	cmp r3, #0x9f
	bls _08082020
	ldr r0, _08082018  @ gUnknown_0203E75C
	ldr r1, _0808201C  @ gUnknown_0203E754
	ldr r1, [r1]
	str r1, [r0]
	movs r3, #0
	b _08082028
	.align 2, 0
_08082014: .4byte 0x04000006
_08082018: .4byte gUnknown_0203E75C
_0808201C: .4byte gUnknown_0203E754
_08082020:
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	ldr r0, _08082044  @ gUnknown_0203E75C
_08082028:
	ldr r2, _08082048  @ 0x05000022
	ldr r1, [r0]
	lsls r0, r3, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	strh r1, [r2]
	ldr r1, _0808204C  @ 0x05000042
	movs r2, #0xa0
	lsls r2, r2, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_08082044: .4byte gUnknown_0203E75C
_08082048: .4byte 0x05000022
_0808204C: .4byte 0x05000042

	THUMB_FUNC_END sub_8081FFC

	THUMB_FUNC_START sub_8082050
sub_8082050: @ 0x08082050
	push {lr}
	ldr r0, _08082068  @ 0x04000006
	ldrh r0, [r0]
	adds r3, r0, #0
	cmp r3, #0x9f
	bls _08082074
	ldr r0, _0808206C  @ gUnknown_0203E75C
	ldr r1, _08082070  @ gUnknown_0203E754
	ldr r1, [r1]
	str r1, [r0]
	movs r3, #0
	b _0808207C
	.align 2, 0
_08082068: .4byte 0x04000006
_0808206C: .4byte gUnknown_0203E75C
_08082070: .4byte gUnknown_0203E754
_08082074:
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	ldr r0, _0808208C  @ gUnknown_0203E75C
_0808207C:
	ldr r2, _08082090  @ 0x04000052
	ldr r1, [r0]
	lsls r0, r3, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r2]
	pop {r0}
	bx r0
	.align 2, 0
_0808208C: .4byte gUnknown_0203E75C
_08082090: .4byte 0x04000052

	THUMB_FUNC_END sub_8082050

	THUMB_FUNC_START sub_8082094
sub_8082094: @ 0x08082094
	push {lr}
	ldr r0, _080820AC  @ 0x04000006
	ldrh r0, [r0]
	adds r3, r0, #0
	cmp r3, #0x9f
	bls _080820B8
	ldr r0, _080820B0  @ gUnknown_0203E75C
	ldr r1, _080820B4  @ gUnknown_0203E754
	ldr r1, [r1]
	str r1, [r0]
	movs r3, #0
	b _080820C0
	.align 2, 0
_080820AC: .4byte 0x04000006
_080820B0: .4byte gUnknown_0203E75C
_080820B4: .4byte gUnknown_0203E754
_080820B8:
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	ldr r0, _080820D0  @ gUnknown_0203E75C
_080820C0:
	ldr r2, _080820D4  @ 0x04000054
	ldr r1, [r0]
	lsls r0, r3, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r2]
	pop {r0}
	bx r0
	.align 2, 0
_080820D0: .4byte gUnknown_0203E75C
_080820D4: .4byte 0x04000054

	THUMB_FUNC_END sub_8082094

	THUMB_FUNC_START sub_80820D8
sub_80820D8: @ 0x080820D8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov r9, r0
	mov sl, r1
	adds r4, r2, #0
	adds r5, r3, #0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r9, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov sl, r1
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	ldr r7, _08082184  @ gUnknown_0203E754
	ldr r0, [r7, #4]
	adds r2, r4, #0
	movs r3, #0x1f
	ands r2, r3
	lsrs r2, r2, #1
	movs r1, #0xf8
	lsls r1, r1, #2
	mov r8, r1
	adds r1, r4, #0
	mov r3, r8
	ands r1, r3
	lsrs r1, r1, #1
	ands r1, r3
	orrs r2, r1
	movs r6, #0xf8
	lsls r6, r6, #7
	adds r1, r4, #0
	ands r1, r6
	lsrs r1, r1, #1
	ands r1, r6
	orrs r2, r1
	str r2, [sp]
	mov r1, r9
	mov r2, sl
	adds r3, r4, #0
	bl sub_80824C4
	ldr r0, [r7, #4]
	movs r1, #0xa0
	lsls r1, r1, #1
	adds r0, r0, r1
	adds r2, r5, #0
	movs r3, #0x1f
	ands r2, r3
	lsrs r2, r2, #1
	adds r1, r5, #0
	mov r3, r8
	ands r1, r3
	lsrs r1, r1, #1
	ands r1, r3
	orrs r2, r1
	adds r1, r5, #0
	ands r1, r6
	lsrs r1, r1, #1
	ands r1, r6
	orrs r2, r1
	str r2, [sp]
	mov r1, r9
	mov r2, sl
	adds r3, r5, #0
	bl sub_80824C4
	bl sub_8082390
	ldr r0, _08082188  @ sub_8081FFC
	bl SetPrimaryHBlankHandler
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08082184: .4byte gUnknown_0203E754
_08082188: .4byte sub_8081FFC

	THUMB_FUNC_END sub_80820D8

	THUMB_FUNC_START sub_808218C
sub_808218C: @ 0x0808218C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	adds r7, r0, #0
	adds r4, r1, #0
	mov sl, r2
	mov r9, r3
	ldr r5, [sp, #0x20]
	ldr r0, _080821AC  @ gUnknown_0203E754
	mov r8, r0
	ldr r0, [r0, #4]
	bl sub_80823A0
	b _080821E2
	.align 2, 0
_080821AC: .4byte gUnknown_0203E754
_080821B0:
	ldrb r0, [r5]
	mov r1, sl
	muls r1, r0, r1
	adds r0, r1, #0
	mov r1, r9
	bl Div
	adds r6, r0, #0
	adds r5, #1
	cmp r6, #0
	ble _080821E0
	mov r1, r8
	ldr r0, [r1, #4]
	adds r1, r7, r6
	subs r1, #1
	adds r2, r4, #0
	bl sub_80823DC
	mov r1, r8
	ldr r0, [r1, #4]
	subs r1, r7, r6
	adds r2, r4, #0
	bl sub_80823BC
_080821E0:
	subs r4, #1
_080821E2:
	ldrb r0, [r5]
	cmp r0, #0xff
	beq _080821EC
	cmp r4, #0
	bge _080821B0
_080821EC:
	cmp r6, #0
	ble _08082216
	cmp r4, #0
	blt _08082216
	ldr r5, _08082224  @ gUnknown_0203E754
	adds r0, r7, r6
	mov r8, r0
_080821FA:
	ldr r0, [r5, #4]
	mov r1, r8
	subs r1, #1
	adds r2, r4, #0
	bl sub_80823DC
	ldr r0, [r5, #4]
	subs r1, r7, r6
	adds r2, r4, #0
	bl sub_80823BC
	subs r4, #1
	cmp r4, #0
	bge _080821FA
_08082216:
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08082224: .4byte gUnknown_0203E754

	THUMB_FUNC_END sub_808218C

	THUMB_FUNC_START sub_8082228
sub_8082228: @ 0x08082228
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	ldr r0, _08082264  @ gSinLookup
	mov ip, r0
	lsls r3, r3, #0x10
	asrs r5, r3, #0x10
	lsls r1, r1, #0x10
	lsls r2, r2, #0x10
	asrs r3, r2, #0x10
	asrs r1, r1, #0x10
	movs r6, #0xff
	movs r2, #0x9f
_08082240:
	adds r0, r1, #0
	ands r0, r6
	lsls r0, r0, #1
	add r0, ip
	movs r7, #0
	ldrsh r0, [r0, r7]
	muls r0, r3, r0
	asrs r0, r0, #0xc
	strh r0, [r4]
	adds r4, #2
	adds r1, r1, r5
	subs r2, #1
	cmp r2, #0
	bge _08082240
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08082264: .4byte gSinLookup

	THUMB_FUNC_END sub_8082228

	THUMB_FUNC_START sub_8082268
sub_8082268: @ 0x08082268
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	ldr r0, _080822A8  @ gSinLookup
	mov ip, r0
	lsls r3, r3, #0x10
	asrs r5, r3, #0x10
	lsls r1, r1, #0x10
	lsls r2, r2, #0x10
	asrs r3, r2, #0x10
	asrs r1, r1, #0x10
	movs r6, #0xff
	movs r2, #0x9f
_08082280:
	adds r0, r1, #0
	ands r0, r6
	lsls r0, r0, #1
	add r0, ip
	movs r7, #0
	ldrsh r0, [r0, r7]
	muls r0, r3, r0
	asrs r0, r0, #0xc
	ldr r7, [sp, #0x14]
	adds r0, r0, r7
	strh r0, [r4]
	adds r4, #2
	adds r1, r1, r5
	subs r2, #1
	cmp r2, #0
	bge _08082280
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080822A8: .4byte gSinLookup

	THUMB_FUNC_END sub_8082268

	THUMB_FUNC_START sub_80822AC
sub_80822AC: @ 0x080822AC
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r4, #2
	ldr r0, _080822EC  @ gSinLookup
	mov ip, r0
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	lsls r2, r2, #0x10
	asrs r5, r2, #0x10
	adds r1, r3, r1
	movs r6, #0xff
	lsls r3, r3, #1
	movs r2, #0x9e
_080822CA:
	adds r0, r1, #0
	ands r0, r6
	lsls r0, r0, #1
	add r0, ip
	movs r7, #0
	ldrsh r0, [r0, r7]
	muls r0, r5, r0
	asrs r0, r0, #0xc
	strh r0, [r4]
	adds r4, #4
	adds r1, r1, r3
	subs r2, #2
	cmp r2, #0
	bge _080822CA
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080822EC: .4byte gSinLookup

	THUMB_FUNC_END sub_80822AC

	THUMB_FUNC_START sub_80822F0
sub_80822F0: @ 0x080822F0
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r4, #2
	ldr r0, _08082334  @ gSinLookup
	mov ip, r0
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	lsls r2, r2, #0x10
	asrs r5, r2, #0x10
	adds r1, r3, r1
	movs r6, #0xff
	lsls r3, r3, #1
	movs r2, #0x9e
_0808230E:
	adds r0, r1, #0
	ands r0, r6
	lsls r0, r0, #1
	add r0, ip
	movs r7, #0
	ldrsh r0, [r0, r7]
	muls r0, r5, r0
	asrs r0, r0, #0xc
	ldr r7, [sp, #0x14]
	adds r0, r0, r7
	strh r0, [r4]
	adds r4, #4
	adds r1, r1, r3
	subs r2, #2
	cmp r2, #0
	bge _0808230E
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08082334: .4byte gSinLookup

	THUMB_FUNC_END sub_80822F0

	THUMB_FUNC_START sub_8082338
sub_8082338: @ 0x08082338
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	ldr r7, [sp, #0x18]
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r5, r2, #0x10
	lsls r3, r3, #0x10
	lsrs r0, r3, #0x10
	ldr r2, [sp, #0x14]
	cmp r2, r7
	bge _08082386
	ldr r3, _0808238C  @ gSinLookup
	mov ip, r3
	lsls r0, r0, #0x10
	asrs r3, r0, #0x10
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	lsls r0, r5, #0x10
	asrs r5, r0, #0x10
	adds r0, r2, #0
	muls r0, r3, r0
	adds r1, r0, r1
	movs r6, #0xff
	subs r2, r7, r2
_0808236A:
	adds r0, r1, #0
	ands r0, r6
	lsls r0, r0, #1
	add r0, ip
	movs r7, #0
	ldrsh r0, [r0, r7]
	muls r0, r5, r0
	asrs r0, r0, #0xc
	strh r0, [r4]
	adds r4, #2
	adds r1, r1, r3
	subs r2, #1
	cmp r2, #0
	bne _0808236A
_08082386:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808238C: .4byte gSinLookup

	THUMB_FUNC_END sub_8082338

	THUMB_FUNC_START sub_8082390
sub_8082390: @ 0x08082390
	ldr r0, _0808239C  @ gUnknown_0203E754
	ldr r2, [r0]
	ldr r1, [r0, #4]
	str r1, [r0]
	str r2, [r0, #4]
	bx lr
	.align 2, 0
_0808239C: .4byte gUnknown_0203E754

	THUMB_FUNC_END sub_8082390

	THUMB_FUNC_START sub_80823A0
sub_80823A0: @ 0x080823A0
	push {lr}
	ldr r1, _080823B8  @ 0x0000F0F0
	adds r2, r1, #0
	movs r1, #0x9f
_080823A8:
	strh r2, [r0]
	adds r0, #2
	subs r1, #1
	cmp r1, #0
	bge _080823A8
	pop {r0}
	bx r0
	.align 2, 0
_080823B8: .4byte 0x0000F0F0

	THUMB_FUNC_END sub_80823A0

	THUMB_FUNC_START sub_80823BC
sub_80823BC: @ 0x080823BC
	push {lr}
	adds r3, r0, #0
	cmp r2, #0x9f
	bhi _080823D6
	cmp r1, #0
	bge _080823CA
	movs r1, #0
_080823CA:
	cmp r1, #0xf0
	ble _080823D0
	movs r1, #0xf0
_080823D0:
	lsls r0, r2, #1
	adds r0, r3, r0
	strb r1, [r0, #1]
_080823D6:
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80823BC

	THUMB_FUNC_START sub_80823DC
sub_80823DC: @ 0x080823DC
	push {lr}
	adds r3, r0, #0
	cmp r2, #0x9f
	bhi _080823F6
	cmp r1, #0
	bge _080823EA
	movs r1, #0
_080823EA:
	cmp r1, #0xf0
	ble _080823F0
	movs r1, #0xf0
_080823F0:
	lsls r0, r2, #1
	adds r0, r3, r0
	strb r1, [r0]
_080823F6:
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80823DC

	THUMB_FUNC_START sub_80823FC
sub_80823FC: @ 0x080823FC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	adds r6, r0, #0
	str r1, [sp]
	str r2, [sp, #4]
	adds r7, r3, #0
	str r7, [sp, #8]
	movs r0, #0
	mov sl, r0
	cmp r7, #0
	blt _080824B4
_0808241A:
	ldr r1, [sp]
	adds r4, r1, r7
	ldr r2, [sp, #4]
	add r2, sl
	str r2, [sp, #0xc]
	adds r0, r6, #0
	adds r1, r4, #0
	bl sub_80823DC
	ldr r0, [sp, #4]
	mov r1, sl
	subs r0, r0, r1
	mov r8, r0
	adds r0, r6, #0
	adds r1, r4, #0
	mov r2, r8
	bl sub_80823DC
	ldr r4, [sp]
	add r4, sl
	ldr r2, [sp, #4]
	adds r2, r2, r7
	mov r9, r2
	adds r0, r6, #0
	adds r1, r4, #0
	bl sub_80823DC
	ldr r0, [sp, #4]
	subs r5, r0, r7
	adds r0, r6, #0
	adds r1, r4, #0
	adds r2, r5, #0
	bl sub_80823DC
	ldr r1, [sp]
	subs r4, r1, r7
	adds r0, r6, #0
	adds r1, r4, #0
	ldr r2, [sp, #0xc]
	bl sub_80823BC
	adds r0, r6, #0
	adds r1, r4, #0
	mov r2, r8
	bl sub_80823BC
	ldr r2, [sp]
	mov r0, sl
	subs r4, r2, r0
	adds r0, r6, #0
	adds r1, r4, #0
	mov r2, r9
	bl sub_80823BC
	adds r0, r6, #0
	adds r1, r4, #0
	adds r2, r5, #0
	bl sub_80823BC
	ldr r1, [sp, #8]
	adds r1, #1
	mov r2, sl
	lsls r0, r2, #1
	subs r1, r1, r0
	str r1, [sp, #8]
	cmp r1, #0
	bge _080824AC
	subs r1, r7, #1
	lsls r0, r1, #1
	ldr r2, [sp, #8]
	adds r2, r2, r0
	str r2, [sp, #8]
	adds r7, r1, #0
_080824AC:
	movs r0, #1
	add sl, r0
	cmp r7, sl
	bge _0808241A
_080824B4:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80823FC

	THUMB_FUNC_START sub_80824C4
sub_80824C4: @ 0x080824C4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x1c
	adds r7, r0, #0
	ldr r0, [sp, #0x3c]
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	str r1, [sp, #4]
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	str r2, [sp, #8]
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	mov r9, r3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	subs r0, r2, r1
	str r0, [sp, #0x10]
	movs r1, #0
	str r1, [sp, #0xc]
	mov sl, r1
	movs r1, #0x1f
	mov r0, r8
	ands r0, r1
	lsls r0, r0, #0x10
	str r0, [sp, #0x18]
	mov r0, r9
	ands r0, r1
	lsls r0, r0, #0x10
	str r0, [sp, #0x14]
_08082508:
	ldr r2, [sp, #4]
	cmp sl, r2
	bge _08082516
	mov r3, r9
	strh r3, [r7]
	adds r7, #2
	b _08082596
_08082516:
	ldr r0, [sp, #8]
	cmp sl, r0
	ble _08082524
	mov r1, r8
	strh r1, [r7]
	adds r7, #2
	b _08082596
_08082524:
	ldr r2, [sp, #0x10]
	str r2, [sp]
	movs r0, #0
	ldr r3, [sp, #0x14]
	lsrs r1, r3, #0x10
	ldr r3, [sp, #0x18]
	lsrs r2, r3, #0x10
	ldr r3, [sp, #0xc]
	bl sub_8012DCC
	adds r4, r0, #0
	mov r1, r9
	movs r0, #0xf8
	lsls r0, r0, #2
	ands r1, r0
	lsls r1, r1, #0x10
	mov r2, r8
	ands r2, r0
	lsls r2, r2, #0x10
	ldr r3, [sp, #0x10]
	str r3, [sp]
	movs r0, #0
	lsrs r1, r1, #0x10
	lsrs r2, r2, #0x10
	ldr r3, [sp, #0xc]
	bl sub_8012DCC
	adds r5, r0, #0
	movs r6, #0xf8
	lsls r6, r6, #7
	mov r1, r9
	ands r1, r6
	lsls r1, r1, #0x10
	mov r2, r8
	ands r2, r6
	lsls r2, r2, #0x10
	ldr r0, [sp, #0x10]
	str r0, [sp]
	movs r0, #0
	lsrs r1, r1, #0x10
	lsrs r2, r2, #0x10
	ldr r3, [sp, #0xc]
	bl sub_8012DCC
	movs r1, #0x1f
	ands r4, r1
	movs r2, #0xf8
	lsls r2, r2, #2
	ands r5, r2
	orrs r4, r5
	ands r0, r6
	orrs r4, r0
	strh r4, [r7]
	adds r7, #2
	ldr r3, [sp, #0xc]
	adds r3, #1
	str r3, [sp, #0xc]
_08082596:
	movs r0, #1
	add sl, r0
	mov r1, sl
	cmp r1, #0x9f
	ble _08082508
	add sp, #0x1c
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80824C4

	THUMB_FUNC_START sub_80825B0
sub_80825B0: @ 0x080825B0
	adds r0, #0x64
	movs r1, #0
	strh r1, [r0]
	bx lr

	THUMB_FUNC_END sub_80825B0

	THUMB_FUNC_START sub_80825B8
sub_80825B8: @ 0x080825B8
	push {lr}
	ldr r1, _080825E4  @ gUnknown_0203E754
	ldr r3, [r1, #4]
	movs r1, #0xa0
	lsls r1, r1, #1
	adds r3, r3, r1
	adds r0, #0x64
	ldrh r1, [r0]
	adds r2, r1, #1
	strh r2, [r0]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	adds r0, r3, #0
	movs r2, #0x10
	movs r3, #8
	bl sub_8082228
	bl sub_8082390
	pop {r0}
	bx r0
	.align 2, 0
_080825E4: .4byte gUnknown_0203E754

	THUMB_FUNC_END sub_80825B8

	THUMB_FUNC_START sub_80825E8
sub_80825E8: @ 0x080825E8
	push {r4, r5, lr}
	ldr r0, _08082640  @ gUnknown_0203E754
	movs r2, #0x80
	lsls r2, r2, #5
	adds r1, r2, #0
	ldr r0, [r0]
	movs r2, #0x9f
_080825F6:
	strh r1, [r0]
	adds r0, #2
	subs r2, #1
	cmp r2, #0
	bge _080825F6
	ldr r0, _08082640  @ gUnknown_0203E754
	ldr r0, [r0]
	movs r1, #0x10
	adds r0, #0x10
	movs r2, #0x8f
_0808260A:
	strh r1, [r0]
	adds r0, #2
	subs r2, #1
	cmp r2, #0
	bge _0808260A
	movs r2, #0
	ldr r0, _08082640  @ gUnknown_0203E754
	ldr r0, [r0]
	movs r5, #0x10
	movs r1, #0x98
	lsls r1, r1, #1
	adds r4, r0, r1
	adds r3, r0, #0
_08082624:
	asrs r1, r2, #1
	subs r0, r5, r1
	lsls r0, r0, #8
	orrs r0, r1
	strh r0, [r3, #0x10]
	strh r0, [r4]
	subs r4, #2
	adds r3, #2
	adds r2, #1
	cmp r2, #0x20
	ble _08082624
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08082640: .4byte gUnknown_0203E754

	THUMB_FUNC_END sub_80825E8

	THUMB_FUNC_START sub_8082644
sub_8082644: @ 0x08082644
	ldr r2, _08082654  @ gUnknown_0203E754
	lsls r0, r0, #2
	adds r0, r0, r2
	lsls r1, r1, #1
	ldr r0, [r0]
	adds r0, r0, r1
	bx lr
	.align 2, 0
_08082654: .4byte gUnknown_0203E754

	THUMB_FUNC_END sub_8082644

	THUMB_FUNC_START sub_8082658
sub_8082658: @ 0x08082658
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	mov r8, r0
	str r1, [sp]
	str r2, [sp, #4]
	adds r7, r3, #0
	mov sl, r7
	movs r0, #0
	mov r9, r0
	cmp r7, #0
	blt _0808271E
_08082676:
	ldr r6, [sp, #4]
	add r6, r9
	adds r0, r6, #0
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _080826BA
	ldr r2, [sp]
	adds r4, r2, r7
	mov r0, r8
	adds r1, r4, #0
	adds r2, r6, #0
	bl sub_80823DC
	ldr r0, [sp, #4]
	mov r1, r9
	subs r5, r0, r1
	mov r0, r8
	adds r1, r4, #0
	adds r2, r5, #0
	bl sub_80823DC
	ldr r2, [sp]
	subs r4, r2, r7
	mov r0, r8
	adds r1, r4, #0
	adds r2, r6, #0
	bl sub_80823BC
	mov r0, r8
	adds r1, r4, #0
	adds r2, r5, #0
	bl sub_80823BC
_080826BA:
	ldr r0, [sp, #4]
	adds r6, r0, r7
	adds r0, r6, #0
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _080826FE
	ldr r4, [sp]
	add r4, r9
	mov r0, r8
	adds r1, r4, #0
	adds r2, r6, #0
	bl sub_80823DC
	ldr r2, [sp, #4]
	subs r5, r2, r7
	mov r0, r8
	adds r1, r4, #0
	adds r2, r5, #0
	bl sub_80823DC
	ldr r0, [sp]
	mov r1, r9
	subs r4, r0, r1
	mov r0, r8
	adds r1, r4, #0
	adds r2, r6, #0
	bl sub_80823BC
	mov r0, r8
	adds r1, r4, #0
	adds r2, r5, #0
	bl sub_80823BC
_080826FE:
	mov r1, sl
	adds r1, #1
	mov r2, r9
	lsls r0, r2, #1
	subs r1, r1, r0
	mov sl, r1
	cmp r1, #0
	bge _08082716
	subs r1, r7, #1
	lsls r0, r1, #1
	add sl, r0
	adds r7, r1, #0
_08082716:
	movs r0, #1
	add r9, r0
	cmp r7, r9
	bge _08082676
_0808271E:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8082658

	THUMB_FUNC_START sub_8082730
sub_8082730: @ 0x08082730
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r5, r0, #0
	adds r6, r1, #0
	mov r8, r2
	ldr r4, _08082760  @ gUnknown_0203E754
	ldr r0, [r4, #4]
	bl sub_80823A0
	ldr r0, [r4, #4]
	adds r1, r5, #0
	adds r2, r6, #0
	mov r3, r8
	bl sub_8082658
	bl sub_8082390
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08082760: .4byte gUnknown_0203E754

	THUMB_FUNC_END sub_8082730

	THUMB_FUNC_START sub_8082764
sub_8082764: @ 0x08082764
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	adds r1, r0, #0
	cmp r1, #0x70
	ble _08082776
	movs r1, #0x70
_08082776:
	movs r0, #0x50
	subs r4, r0, r1
	adds r1, #0x50
	mov ip, r1
	cmp r4, #0
	ble _08082798
	ldr r0, _08082858  @ gUnknown_0203E754
	movs r2, #0x80
	lsls r2, r2, #5
	adds r1, r2, #0
	ldr r0, [r0, #4]
	adds r2, r4, #0
_0808278E:
	strh r1, [r0]
	adds r0, #2
	subs r2, #1
	cmp r2, #0
	bne _0808278E
_08082798:
	mov r2, ip
	movs r7, #0x20
	adds r7, r7, r4
	mov sl, r7
	subs r0, r2, #1
	mov r9, r0
	adds r6, r2, #0
	subs r6, #0x20
	cmp r2, #0x9f
	bgt _080827C4
	ldr r0, _08082858  @ gUnknown_0203E754
	ldr r1, [r0, #4]
	movs r7, #0x80
	lsls r7, r7, #5
	adds r3, r7, #0
	lsls r0, r2, #1
	adds r0, r0, r1
_080827BA:
	strh r3, [r0]
	adds r0, #2
	adds r2, #1
	cmp r2, #0x9f
	ble _080827BA
_080827C4:
	adds r2, r4, #0
	cmp r2, #0x4f
	bgt _080827F6
	cmp r2, sl
	bge _080827F6
	ldr r0, _08082858  @ gUnknown_0203E754
	ldr r1, [r0, #4]
	movs r0, #0x10
	mov r8, r0
	mov r5, sl
	lsls r0, r2, #1
	adds r3, r0, r1
_080827DC:
	subs r1, r2, r4
	asrs r1, r1, #1
	mov r7, r8
	subs r0, r7, r1
	lsls r0, r0, #8
	orrs r0, r1
	strh r0, [r3]
	adds r3, #2
	adds r2, #1
	cmp r2, #0x4f
	bgt _080827F6
	cmp r2, r5
	blt _080827DC
_080827F6:
	mov r2, r9
	cmp r2, #0x4f
	ble _08082826
	adds r4, r6, #0
	cmp r2, r6
	blt _08082826
	ldr r0, _08082858  @ gUnknown_0203E754
	ldr r1, [r0, #4]
	movs r5, #0x10
	lsls r0, r2, #1
	adds r3, r0, r1
_0808280C:
	mov r0, ip
	subs r1, r0, r2
	asrs r1, r1, #1
	subs r0, r5, r1
	lsls r0, r0, #8
	orrs r0, r1
	strh r0, [r3]
	subs r3, #2
	subs r2, #1
	cmp r2, #0x4f
	ble _08082826
	cmp r2, r4
	bge _0808280C
_08082826:
	mov r2, sl
	adds r3, r6, #0
	cmp r2, r3
	bge _08082844
	ldr r0, _08082858  @ gUnknown_0203E754
	ldr r1, [r0, #4]
	movs r4, #0x10
	lsls r0, r2, #1
	adds r0, r0, r1
	subs r2, r3, r2
_0808283A:
	strh r4, [r0]
	adds r0, #2
	subs r2, #1
	cmp r2, #0
	bne _0808283A
_08082844:
	bl sub_8082390
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08082858: .4byte gUnknown_0203E754

	THUMB_FUNC_END sub_8082764

	THUMB_FUNC_START sub_808285C
sub_808285C: @ 0x0808285C
	push {lr}
	ldr r0, _08082874  @ 0x04000006
	ldrh r0, [r0]
	adds r3, r0, #0
	cmp r3, #0x9e
	bls _08082880
	ldr r0, _08082878  @ gUnknown_0203E75C
	ldr r1, _0808287C  @ gUnknown_0203E754
	ldr r1, [r1]
	str r1, [r0]
	movs r3, #0
	b _08082886
	.align 2, 0
_08082874: .4byte 0x04000006
_08082878: .4byte gUnknown_0203E75C
_0808287C: .4byte gUnknown_0203E754
_08082880:
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
_08082886:
	movs r0, #1
	ands r0, r3
	cmp r0, #0
	bne _0808289C
	ldr r2, _080828A0  @ 0x04000040
	ldr r0, _080828A4  @ gUnknown_0203E75C
	ldr r1, [r0]
	lsls r0, r3, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r2]
_0808289C:
	pop {r0}
	bx r0
	.align 2, 0
_080828A0: .4byte 0x04000040
_080828A4: .4byte gUnknown_0203E75C

	THUMB_FUNC_END sub_808285C

	THUMB_FUNC_START sub_80828A8
sub_80828A8: @ 0x080828A8
	push {lr}
	ldr r0, _080828C0  @ 0x04000006
	ldrh r0, [r0]
	adds r3, r0, #0
	cmp r3, #0x9e
	bls _080828CC
	ldr r0, _080828C4  @ gUnknown_0203E75C
	ldr r1, _080828C8  @ gUnknown_0203E754
	ldr r1, [r1]
	str r1, [r0]
	movs r3, #0
	b _080828D4
	.align 2, 0
_080828C0: .4byte 0x04000006
_080828C4: .4byte gUnknown_0203E75C
_080828C8: .4byte gUnknown_0203E754
_080828CC:
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	ldr r0, _080828E4  @ gUnknown_0203E75C
_080828D4:
	ldr r2, _080828E8  @ 0x04000052
	ldr r1, [r0]
	lsls r0, r3, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r2]
	pop {r0}
	bx r0
	.align 2, 0
_080828E4: .4byte gUnknown_0203E75C
_080828E8: .4byte 0x04000052

	THUMB_FUNC_END sub_80828A8

	THUMB_FUNC_START sub_80828EC
sub_80828EC: @ 0x080828EC
	push {lr}
	ldr r0, _08082910  @ 0x04000006
	ldrh r0, [r0]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #0x9f
	bls _080828FE
	movs r3, #0
_080828FE:
	ldr r2, _08082914  @ 0x0400001A
	ldr r0, _08082918  @ gUnknown_0203E75C
	ldr r1, [r0]
	lsls r0, r3, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r2]
	pop {r0}
	bx r0
	.align 2, 0
_08082910: .4byte 0x04000006
_08082914: .4byte 0x0400001A
_08082918: .4byte gUnknown_0203E75C

	THUMB_FUNC_END sub_80828EC

	THUMB_FUNC_START sub_808291C
sub_808291C: @ 0x0808291C
	push {r4, r5, lr}
	movs r3, #0
	ldr r5, _08082948  @ gUnknown_0203E75C
	movs r4, #1
_08082924:
	ldr r0, [r5]
	lsls r2, r3, #1
	adds r2, r2, r0
	adds r0, r3, #0
	ands r0, r4
	asrs r1, r3, #1
	adds r0, r0, r1
	negs r0, r0
	strh r0, [r2]
	adds r3, #1
	cmp r3, #0x9f
	ble _08082924
	bl sub_8082390
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08082948: .4byte gUnknown_0203E75C

	THUMB_FUNC_END sub_808291C

	THUMB_FUNC_START sub_808294C
sub_808294C: @ 0x0808294C
	push {lr}
	ldr r0, _08082964  @ 0x04000006
	ldrh r0, [r0]
	adds r1, r0, #0
	cmp r1, #0x9f
	bls _08082970
	ldr r0, _08082968  @ gUnknown_0203E75C
	ldr r1, _0808296C  @ gUnknown_0203E754
	ldr r1, [r1]
	str r1, [r0]
	movs r1, #0
	b _08082976
	.align 2, 0
_08082964: .4byte 0x04000006
_08082968: .4byte gUnknown_0203E75C
_0808296C: .4byte gUnknown_0203E754
_08082970:
	adds r0, r1, #1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
_08082976:
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08082998
	ldr r2, _0808299C  @ 0x04000014
	ldr r0, _080829A0  @ gUnknown_0203E75C
	ldr r0, [r0]
	lsls r1, r1, #1
	adds r1, r1, r0
	movs r3, #0xa0
	lsls r3, r3, #1
	adds r0, r1, r3
	ldrh r0, [r0]
	strh r0, [r2]
	adds r2, #2
	ldrh r0, [r1]
	strh r0, [r2]
_08082998:
	pop {r0}
	bx r0
	.align 2, 0
_0808299C: .4byte 0x04000014
_080829A0: .4byte gUnknown_0203E75C

	THUMB_FUNC_END sub_808294C

	THUMB_FUNC_START sub_80829A4
sub_80829A4: @ 0x080829A4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	adds r6, r0, #0
	ldr r0, [sp, #0x20]
	mov sl, r0
	ldr r4, [sp, #0x24]
	ldr r0, [sp, #0x28]
	adds r6, #2
	movs r7, #1
	ldr r5, _08082A20  @ gSinLookup
	mov r9, r5
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	mov r8, r2
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	mov ip, r0
	adds r2, r3, r1
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	mov r0, sl
	lsls r5, r0, #0x10
	asrs r5, r5, #0x10
	lsls r3, r3, #1
_080829E2:
	movs r0, #0xff
	ands r0, r2
	lsls r0, r0, #1
	add r0, r9
	movs r1, #0
	ldrsh r0, [r0, r1]
	mov r1, r8
	muls r1, r0, r1
	subs r0, r7, r4
	cmp r0, #0
	bge _080829FA
	subs r0, r4, r7
_080829FA:
	muls r0, r1, r0
	mov r1, ip
	muls r1, r0, r1
	asrs r0, r1, #0x14
	adds r0, r5, r0
	strh r0, [r6]
	adds r6, #4
	adds r2, r2, r3
	adds r7, #2
	cmp r7, #0x9f
	ble _080829E2
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08082A20: .4byte gSinLookup

	THUMB_FUNC_END sub_80829A4

	THUMB_FUNC_START sub_8082A24
sub_8082A24: @ 0x08082A24
	push {lr}
	ldr r0, _08082A3C  @ 0x04000006
	ldrh r0, [r0]
	adds r1, r0, #0
	cmp r1, #0x9f
	bls _08082A48
	ldr r0, _08082A40  @ gUnknown_0203E75C
	ldr r1, _08082A44  @ gUnknown_0203E754
	ldr r1, [r1]
	str r1, [r0]
	movs r1, #0
	b _08082A4E
	.align 2, 0
_08082A3C: .4byte 0x04000006
_08082A40: .4byte gUnknown_0203E75C
_08082A44: .4byte gUnknown_0203E754
_08082A48:
	adds r0, r1, #1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
_08082A4E:
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08082A70
	ldr r2, _08082A74  @ 0x04000010
	ldr r0, _08082A78  @ gUnknown_0203E75C
	ldr r0, [r0]
	lsls r1, r1, #1
	adds r1, r1, r0
	movs r3, #0xa0
	lsls r3, r3, #1
	adds r0, r1, r3
	ldrh r0, [r0]
	strh r0, [r2]
	adds r2, #2
	ldrh r0, [r1]
	strh r0, [r2]
_08082A70:
	pop {r0}
	bx r0
	.align 2, 0
_08082A74: .4byte 0x04000010
_08082A78: .4byte gUnknown_0203E75C

	THUMB_FUNC_END sub_8082A24

	THUMB_FUNC_START sub_8082A7C
sub_8082A7C: @ 0x08082A7C
	push {lr}
	ldr r0, _08082A94  @ 0x04000006
	ldrh r0, [r0]
	adds r1, r0, #0
	cmp r1, #0x9f
	bls _08082AA0
	ldr r0, _08082A98  @ gUnknown_0203E75C
	ldr r1, _08082A9C  @ gUnknown_0203E754
	ldr r1, [r1]
	str r1, [r0]
	movs r1, #0
	b _08082AA6
	.align 2, 0
_08082A94: .4byte 0x04000006
_08082A98: .4byte gUnknown_0203E75C
_08082A9C: .4byte gUnknown_0203E754
_08082AA0:
	adds r0, r1, #1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
_08082AA6:
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08082AC8
	ldr r2, _08082ACC  @ 0x04000014
	ldr r0, _08082AD0  @ gUnknown_0203E75C
	ldr r0, [r0]
	lsls r1, r1, #1
	adds r1, r1, r0
	movs r3, #0xa0
	lsls r3, r3, #1
	adds r0, r1, r3
	ldrh r0, [r0]
	strh r0, [r2]
	adds r2, #2
	ldrh r0, [r1]
	strh r0, [r2]
_08082AC8:
	pop {r0}
	bx r0
	.align 2, 0
_08082ACC: .4byte 0x04000014
_08082AD0: .4byte gUnknown_0203E75C

	THUMB_FUNC_END sub_8082A7C

	THUMB_FUNC_START sub_8082AD4
sub_8082AD4: @ 0x08082AD4
	push {lr}
	ldr r0, _08082AEC  @ 0x04000006
	ldrh r0, [r0]
	adds r1, r0, #0
	cmp r1, #0x9f
	bls _08082AF8
	ldr r0, _08082AF0  @ gUnknown_0203E75C
	ldr r1, _08082AF4  @ gUnknown_0203E754
	ldr r1, [r1]
	str r1, [r0]
	movs r1, #0
	b _08082AFE
	.align 2, 0
_08082AEC: .4byte 0x04000006
_08082AF0: .4byte gUnknown_0203E75C
_08082AF4: .4byte gUnknown_0203E754
_08082AF8:
	adds r0, r1, #1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
_08082AFE:
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08082B20
	ldr r2, _08082B24  @ 0x04000018
	ldr r0, _08082B28  @ gUnknown_0203E75C
	ldr r0, [r0]
	lsls r1, r1, #1
	adds r1, r1, r0
	movs r3, #0xa0
	lsls r3, r3, #1
	adds r0, r1, r3
	ldrh r0, [r0]
	strh r0, [r2]
	adds r2, #2
	ldrh r0, [r1]
	strh r0, [r2]
_08082B20:
	pop {r0}
	bx r0
	.align 2, 0
_08082B24: .4byte 0x04000018
_08082B28: .4byte gUnknown_0203E75C

	THUMB_FUNC_END sub_8082AD4

	THUMB_FUNC_START sub_8082B2C
sub_8082B2C: @ 0x08082B2C
	push {lr}
	ldr r0, _08082B44  @ 0x04000006
	ldrh r0, [r0]
	adds r1, r0, #0
	cmp r1, #0x9f
	bls _08082B50
	ldr r0, _08082B48  @ gUnknown_0203E75C
	ldr r1, _08082B4C  @ gUnknown_0203E754
	ldr r1, [r1]
	str r1, [r0]
	movs r1, #0
	b _08082B56
	.align 2, 0
_08082B44: .4byte 0x04000006
_08082B48: .4byte gUnknown_0203E75C
_08082B4C: .4byte gUnknown_0203E754
_08082B50:
	adds r0, r1, #1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
_08082B56:
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08082B78
	ldr r2, _08082B7C  @ 0x0400001C
	ldr r0, _08082B80  @ gUnknown_0203E75C
	ldr r0, [r0]
	lsls r1, r1, #1
	adds r1, r1, r0
	movs r3, #0xa0
	lsls r3, r3, #1
	adds r0, r1, r3
	ldrh r0, [r0]
	strh r0, [r2]
	adds r2, #2
	ldrh r0, [r1]
	strh r0, [r2]
_08082B78:
	pop {r0}
	bx r0
	.align 2, 0
_08082B7C: .4byte 0x0400001C
_08082B80: .4byte gUnknown_0203E75C

	THUMB_FUNC_END sub_8082B2C

	THUMB_FUNC_START sub_8082B84
sub_8082B84: @ 0x08082B84
	push {r4, lr}
	ldr r0, _08082B9C  @ 0x04000006
	ldrh r0, [r0]
	adds r2, r0, #0
	cmp r2, #0x9f
	bls _08082BA8
	ldr r0, _08082BA0  @ gUnknown_0203E75C
	ldr r1, _08082BA4  @ gUnknown_0203E754
	ldr r1, [r1]
	str r1, [r0]
	movs r2, #0
	b _08082BAE
	.align 2, 0
_08082B9C: .4byte 0x04000006
_08082BA0: .4byte gUnknown_0203E75C
_08082BA4: .4byte gUnknown_0203E754
_08082BA8:
	adds r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
_08082BAE:
	movs r0, #1
	ands r0, r2
	cmp r0, #0
	beq _08082BDA
	ldr r3, _08082BE0  @ 0x04000018
	ldr r0, _08082BE4  @ gUnknown_0203E75C
	ldr r0, [r0]
	lsls r2, r2, #1
	adds r2, r2, r0
	movs r1, #0xa0
	lsls r1, r1, #1
	adds r0, r2, r1
	ldr r4, _08082BE8  @ gLCDControlBuffer
	ldrh r0, [r0]
	ldrh r1, [r4, #0x24]
	adds r0, r0, r1
	strh r0, [r3]
	adds r3, #2
	ldrh r0, [r2]
	ldrh r1, [r4, #0x26]
	adds r0, r0, r1
	strh r0, [r3]
_08082BDA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08082BE0: .4byte 0x04000018
_08082BE4: .4byte gUnknown_0203E75C
_08082BE8: .4byte gLCDControlBuffer

	THUMB_FUNC_END sub_8082B84

	THUMB_FUNC_START sub_8082BEC
sub_8082BEC: @ 0x08082BEC
	push {lr}
	ldr r0, _08082C04  @ 0x04000006
	ldrh r0, [r0]
	adds r1, r0, #0
	cmp r1, #0x9f
	bls _08082C10
	ldr r0, _08082C08  @ gUnknown_0203E75C
	ldr r1, _08082C0C  @ gUnknown_0203E754
	ldr r1, [r1]
	str r1, [r0]
	movs r1, #0
	b _08082C16
	.align 2, 0
_08082C04: .4byte 0x04000006
_08082C08: .4byte gUnknown_0203E75C
_08082C0C: .4byte gUnknown_0203E754
_08082C10:
	adds r0, r1, #1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
_08082C16:
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08082C44
	ldr r2, _08082C48  @ 0x04000014
	ldr r0, _08082C4C  @ gUnknown_0203E75C
	ldr r0, [r0]
	lsls r1, r1, #1
	adds r1, r1, r0
	movs r0, #0xa0
	lsls r0, r0, #1
	adds r3, r1, r0
	ldrh r0, [r3]
	strh r0, [r2]
	adds r2, #2
	ldrh r0, [r1]
	strh r0, [r2]
	adds r2, #2
	ldrh r0, [r3]
	strh r0, [r2]
	adds r2, #2
	ldrh r0, [r1]
	strh r0, [r2]
_08082C44:
	pop {r0}
	bx r0
	.align 2, 0
_08082C48: .4byte 0x04000014
_08082C4C: .4byte gUnknown_0203E75C

	THUMB_FUNC_END sub_8082BEC

	THUMB_FUNC_START sub_8082C50
sub_8082C50: @ 0x08082C50
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x24
	adds r7, r0, #0
	str r1, [sp]
	str r2, [sp, #4]
	str r3, [sp, #8]
	ldr r0, [sp, #0x44]
	cmp r3, r0
	ble _08082D4E
	mov r9, r3
	mov r1, r9
	str r1, [sp, #0x10]
	movs r2, #0
	str r2, [sp, #0xc]
	cmp r1, #0
	bge _08082C7A
	b _08082E30
_08082C7A:
	movs r0, #0
	str r0, [sp, #0x1c]
	ldr r2, [sp, #0x44]
	mov r1, r9
	muls r1, r2, r1
	str r1, [sp, #0x20]
_08082C86:
	ldr r0, [sp, #0x20]
	ldr r1, [sp, #8]
	bl __divsi3
	mov sl, r0
	ldr r0, [sp, #0x1c]
	ldr r1, [sp, #8]
	bl __divsi3
	mov r8, r0
	ldr r4, [sp]
	add r4, r9
	ldr r6, [sp, #4]
	add r6, r8
	adds r0, r7, #0
	adds r1, r4, #0
	adds r2, r6, #0
	bl sub_80823DC
	ldr r0, [sp, #4]
	mov r1, r8
	subs r5, r0, r1
	adds r0, r7, #0
	adds r1, r4, #0
	adds r2, r5, #0
	bl sub_80823DC
	ldr r2, [sp]
	mov r0, r9
	subs r4, r2, r0
	adds r0, r7, #0
	adds r1, r4, #0
	adds r2, r6, #0
	bl sub_80823BC
	adds r0, r7, #0
	adds r1, r4, #0
	adds r2, r5, #0
	bl sub_80823BC
	ldr r1, [sp]
	ldr r2, [sp, #0xc]
	adds r4, r1, r2
	ldr r6, [sp, #4]
	add r6, sl
	adds r0, r7, #0
	adds r1, r4, #0
	adds r2, r6, #0
	bl sub_80823DC
	ldr r0, [sp, #4]
	mov r1, sl
	subs r5, r0, r1
	adds r0, r7, #0
	adds r1, r4, #0
	adds r2, r5, #0
	bl sub_80823DC
	ldr r2, [sp]
	ldr r0, [sp, #0xc]
	subs r4, r2, r0
	adds r0, r7, #0
	adds r1, r4, #0
	adds r2, r6, #0
	bl sub_80823BC
	adds r0, r7, #0
	adds r1, r4, #0
	adds r2, r5, #0
	bl sub_80823BC
	ldr r1, [sp, #0x10]
	adds r1, #1
	ldr r2, [sp, #0xc]
	lsls r0, r2, #1
	subs r1, r1, r0
	str r1, [sp, #0x10]
	cmp r1, #0
	bge _08082D3A
	mov r1, r9
	subs r1, #1
	lsls r0, r1, #1
	ldr r2, [sp, #0x10]
	adds r2, r2, r0
	str r2, [sp, #0x10]
	ldr r0, [sp, #0x20]
	ldr r2, [sp, #0x44]
	subs r0, r0, r2
	str r0, [sp, #0x20]
	mov r9, r1
_08082D3A:
	ldr r0, [sp, #0x1c]
	ldr r1, [sp, #0x44]
	adds r0, r0, r1
	str r0, [sp, #0x1c]
	ldr r2, [sp, #0xc]
	adds r2, #1
	str r2, [sp, #0xc]
	cmp r9, r2
	bge _08082C86
	b _08082E30
_08082D4E:
	ldr r0, [sp, #0x44]
	mov r9, r0
	mov r1, r9
	str r1, [sp, #0x10]
	movs r2, #0
	str r2, [sp, #0xc]
	cmp r1, #0
	blt _08082E30
	movs r0, #0
	str r0, [sp, #0x14]
	ldr r2, [sp, #8]
	mov r1, r9
	muls r1, r2, r1
	str r1, [sp, #0x18]
_08082D6A:
	ldr r0, [sp, #0x18]
	ldr r1, [sp, #0x44]
	bl __divsi3
	mov sl, r0
	ldr r0, [sp, #0x14]
	ldr r1, [sp, #0x44]
	bl __divsi3
	mov r8, r0
	ldr r4, [sp]
	add r4, sl
	ldr r0, [sp, #4]
	ldr r1, [sp, #0xc]
	adds r6, r0, r1
	adds r0, r7, #0
	adds r1, r4, #0
	adds r2, r6, #0
	bl sub_80823DC
	ldr r2, [sp, #4]
	ldr r0, [sp, #0xc]
	subs r5, r2, r0
	adds r0, r7, #0
	adds r1, r4, #0
	adds r2, r5, #0
	bl sub_80823DC
	ldr r1, [sp]
	mov r2, sl
	subs r4, r1, r2
	adds r0, r7, #0
	adds r1, r4, #0
	adds r2, r6, #0
	bl sub_80823BC
	adds r0, r7, #0
	adds r1, r4, #0
	adds r2, r5, #0
	bl sub_80823BC
	ldr r4, [sp]
	add r4, r8
	ldr r6, [sp, #4]
	add r6, r9
	adds r0, r7, #0
	adds r1, r4, #0
	adds r2, r6, #0
	bl sub_80823DC
	ldr r0, [sp, #4]
	mov r1, r9
	subs r5, r0, r1
	adds r0, r7, #0
	adds r1, r4, #0
	adds r2, r5, #0
	bl sub_80823DC
	ldr r2, [sp]
	mov r0, r8
	subs r4, r2, r0
	adds r0, r7, #0
	adds r1, r4, #0
	adds r2, r6, #0
	bl sub_80823BC
	adds r0, r7, #0
	adds r1, r4, #0
	adds r2, r5, #0
	bl sub_80823BC
	ldr r1, [sp, #0x10]
	adds r1, #1
	ldr r2, [sp, #0xc]
	lsls r0, r2, #1
	subs r1, r1, r0
	str r1, [sp, #0x10]
	cmp r1, #0
	bge _08082E1E
	mov r1, r9
	subs r1, #1
	lsls r0, r1, #1
	ldr r2, [sp, #0x10]
	adds r2, r2, r0
	str r2, [sp, #0x10]
	ldr r0, [sp, #0x18]
	ldr r2, [sp, #8]
	subs r0, r0, r2
	str r0, [sp, #0x18]
	mov r9, r1
_08082E1E:
	ldr r0, [sp, #0x14]
	ldr r1, [sp, #8]
	adds r0, r0, r1
	str r0, [sp, #0x14]
	ldr r2, [sp, #0xc]
	adds r2, #1
	str r2, [sp, #0xc]
	cmp r9, r2
	bge _08082D6A
_08082E30:
	add sp, #0x24
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8082C50

	THUMB_FUNC_START sub_8082E40
sub_8082E40: @ 0x08082E40
	push {r4, r5, r6, lr}
	mov r6, r9
	mov r5, r8
	push {r5, r6}
	sub sp, #4
	adds r6, r0, #0
	mov r8, r1
	mov r9, r2
	adds r5, r3, #0
	ldr r4, _08082E7C  @ gUnknown_0203E754
	ldr r0, [r4, #4]
	bl sub_80823A0
	ldr r0, [r4, #4]
	str r5, [sp]
	adds r1, r6, #0
	mov r2, r8
	mov r3, r9
	bl sub_8082C50
	bl sub_8082390
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08082E7C: .4byte gUnknown_0203E754

	THUMB_FUNC_END sub_8082E40

.align 2, 0
