	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	THUMB_FUNC_START sub_8072504
sub_8072504: @ 0x08072504
	push {r4, r5, lr}
	adds r4, r0, #0
	bl GetAnimAnotherSide
	adds r5, r0, #0
	adds r0, r4, #0
	bl GetEfxHpChangeType
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bgt _08072540
	cmp r0, #0
	blt _08072540
	adds r0, r5, #0
	bl CheckRoundCrit
	cmp r0, #1
	bne _08072540
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #0xd8
	bl EfxPlaySE
	movs r0, #2
	ldrsh r1, [r4, r0]
	movs r0, #0xd8
	movs r2, #1
	bl M4aPlayWithPostionCtrl
_08072540:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8072504

	THUMB_FUNC_START sub_8072548
sub_8072548: @ 0x08072548
	push {lr}
	ldr r1, _08072564  @ gBattleHitArray
	ldr r1, [r1]
	lsls r1, r1, #8
	lsrs r1, r1, #0x1b
	movs r2, #8
	ands r1, r2
	negs r1, r1
	lsrs r1, r1, #0x1f
	cmp r0, r1
	beq _08072568
	movs r0, #0
	b _0807256A
	.align 2, 0
_08072564: .4byte gBattleHitArray
_08072568:
	movs r0, #1
_0807256A:
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8072548

	THUMB_FUNC_START sub_8072570
sub_8072570: @ 0x08072570
	push {lr}
	cmp r0, #0
	bne _08072578
	b _080726A4
_08072578:
	bl GetItemIndex
	subs r0, #0x4b
	cmp r0, #0x41
	bls _08072584
	b _080726A4
_08072584:
	lsls r0, r0, #2
	ldr r1, _08072590  @ _08072594
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08072590: .4byte _08072594
_08072594: @ jump table
	.4byte _0807269C @ case 0
	.4byte _0807269C @ case 1
	.4byte _0807269C @ case 2
	.4byte _0807269C @ case 3
	.4byte _0807269C @ case 4
	.4byte _0807269C @ case 5
	.4byte _080726A0 @ case 6
	.4byte _080726A0 @ case 7
	.4byte _080726A0 @ case 8
	.4byte _080726A4 @ case 9
	.4byte _080726A4 @ case 10
	.4byte _080726A4 @ case 11
	.4byte _0807269C @ case 12
	.4byte _080726A4 @ case 13
	.4byte _0807269C @ case 14
	.4byte _080726A4 @ case 15
	.4byte _080726A4 @ case 16
	.4byte _080726A4 @ case 17
	.4byte _080726A4 @ case 18
	.4byte _080726A4 @ case 19
	.4byte _080726A4 @ case 20
	.4byte _080726A4 @ case 21
	.4byte _080726A4 @ case 22
	.4byte _080726A4 @ case 23
	.4byte _080726A4 @ case 24
	.4byte _080726A4 @ case 25
	.4byte _080726A4 @ case 26
	.4byte _080726A4 @ case 27
	.4byte _080726A4 @ case 28
	.4byte _080726A4 @ case 29
	.4byte _080726A4 @ case 30
	.4byte _080726A4 @ case 31
	.4byte _080726A4 @ case 32
	.4byte _080726A4 @ case 33
	.4byte _080726A4 @ case 34
	.4byte _080726A4 @ case 35
	.4byte _080726A4 @ case 36
	.4byte _080726A4 @ case 37
	.4byte _080726A4 @ case 38
	.4byte _080726A4 @ case 39
	.4byte _080726A4 @ case 40
	.4byte _080726A4 @ case 41
	.4byte _080726A4 @ case 42
	.4byte _080726A4 @ case 43
	.4byte _080726A4 @ case 44
	.4byte _080726A4 @ case 45
	.4byte _080726A4 @ case 46
	.4byte _080726A4 @ case 47
	.4byte _080726A4 @ case 48
	.4byte _080726A4 @ case 49
	.4byte _080726A4 @ case 50
	.4byte _080726A4 @ case 51
	.4byte _080726A4 @ case 52
	.4byte _080726A4 @ case 53
	.4byte _080726A4 @ case 54
	.4byte _080726A4 @ case 55
	.4byte _080726A4 @ case 56
	.4byte _080726A4 @ case 57
	.4byte _080726A4 @ case 58
	.4byte _080726A4 @ case 59
	.4byte _080726A4 @ case 60
	.4byte _080726A4 @ case 61
	.4byte _080726A4 @ case 62
	.4byte _080726A4 @ case 63
	.4byte _080726A4 @ case 64
	.4byte _0807269C @ case 65
_0807269C:
	movs r0, #2
	b _080726A6
_080726A0:
	movs r0, #1
	b _080726A6
_080726A4:
	movs r0, #0
_080726A6:
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8072570

	THUMB_FUNC_START sub_80726AC
sub_80726AC: @ 0x080726AC
	push {r4, r5, r6, r7, lr}
	ldr r0, _080726F0  @ gpEkrBattleUnitLeft
	ldr r1, _080726F4  @ gpEkrBattleUnitRight
	ldr r5, [r0]
	ldr r7, [r1]
	ldr r0, _080726F8  @ gBmSt
	ldrb r1, [r0, #4]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _080726C4
	b _0807288C
_080726C4:
	ldr r1, _080726FC  @ gUnknown_020200A8
	movs r0, #1
	str r0, [r1]
	ldr r1, _08072700  @ gPalIndexEfxHpBarUnk
	ldr r0, _08072704  @ gEkrInitialHitSide
	movs r2, #0
	ldrsh r0, [r0, r2]
	lsls r0, r0, #1
	adds r0, r0, r1
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r6, #0x1a
	cmp r0, #1
	beq _080726E2
	movs r6, #0x19
_080726E2:
	bl GetBattleAnimArenaFlag
	cmp r0, #1
	bne _08072708
	bl Sound_SetDefaultMaxNumChannels
	b _08072710
	.align 2, 0
_080726F0: .4byte gpEkrBattleUnitLeft
_080726F4: .4byte gpEkrBattleUnitRight
_080726F8: .4byte gBmSt
_080726FC: .4byte gUnknown_020200A8
_08072700: .4byte gPalIndexEfxHpBarUnk
_08072704: .4byte gEkrInitialHitSide
_08072708:
	bl GetBanimLinkArenaFlag
	cmp r0, #1
	bne _0807271C
_08072710:
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #0x39
	bl EfxOverrideBgm
	b _08072892
_0807271C:
	ldr r0, _08072734  @ gEkrDistanceType
	movs r2, #0
	ldrsh r0, [r0, r2]
	cmp r0, #4
	bne _08072738
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #0x23
	bl EfxOverrideBgm
	b _08072892
	.align 2, 0
_08072734: .4byte gEkrDistanceType
_08072738:
	movs r4, #0
	adds r0, r7, #0
	adds r0, #0x4a
	ldrh r0, [r0]
	bl sub_8058B08
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _0807274E
	movs r4, #1
_0807274E:
	movs r0, #1
	bl sub_8058B24
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0807275C
	movs r4, #0
_0807275C:
	ldr r0, _08072790  @ gEkrPairSideVaild
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _08072768
	movs r4, #0
_08072768:
	ldr r0, [r5]
	ldrb r0, [r0, #4]
	cmp r0, #0x40
	bne _08072772
	movs r4, #0
_08072772:
	cmp r0, #0x6c
	bne _08072778
	movs r4, #0
_08072778:
	cmp r0, #0xbe
	bne _0807277E
	movs r4, #0
_0807277E:
	cmp r4, #1
	bne _08072794
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #0x1f
	bl EfxOverrideBgm
	b _08072892
	.align 2, 0
_08072790: .4byte gEkrPairSideVaild
_08072794:
	cmp r0, #0xbe
	bne _080727B4
	bl CheckFlag82
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _080727B0
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #0x55
	bl EfxOverrideBgm
	b _08072892
_080727B0:
	bl SetFlag82
_080727B4:
	adds r0, r5, #0
	bl sub_80728D0
	adds r4, r0, #0
	ldr r0, [r5]
	ldrb r0, [r0, #4]
	bl GetUnitFromCharId
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #0xc0
	ands r0, r1
	cmp r0, #0
	bne _080727D6
	movs r4, #1
	negs r4, r4
_080727D6:
	ldr r0, _080727F8  @ gEkrPairSideVaild
	movs r2, #0
	ldrsh r0, [r0, r2]
	cmp r0, #0
	bne _080727E4
	movs r4, #1
	negs r4, r4
_080727E4:
	movs r0, #1
	negs r0, r0
	cmp r4, r0
	beq _080727FC
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r4, #0
	bl EfxOverrideBgm
	b _08072892
	.align 2, 0
_080727F8: .4byte gEkrPairSideVaild
_080727FC:
	movs r4, #0
	ldr r0, [r7, #4]
	ldrb r0, [r0, #4]
	cmp r0, #0x4d
	bne _08072822
	ldr r0, _08072834  @ gBattleStats
	ldrh r1, [r0]
	movs r0, #0x40
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	negs r0, r0
	lsrs r4, r0, #0x1f
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08072822
	movs r4, #1
_08072822:
	cmp r4, #1
	bne _08072838
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #0x20
	bl EfxOverrideBgm
	b _08072892
	.align 2, 0
_08072834: .4byte gBattleStats
_08072838:
	movs r0, #0
	bl sub_8072548
	cmp r0, #1
	bne _0807284C
	ldr r0, _08072848  @ gBattleActor
	b _08072858
	.align 2, 0
_08072848: .4byte gBattleActor
_0807284C:
	movs r0, #1
	bl sub_8072548
	cmp r0, #1
	bne _08072868
	ldr r0, _08072864  @ gBattleTarget
_08072858:
	adds r0, #0x4a
	ldrh r0, [r0]
	bl sub_8072570
	b _0807286A
	.align 2, 0
_08072864: .4byte gBattleTarget
_08072868:
	movs r0, #0
_0807286A:
	cmp r0, #1
	beq _08072876
	cmp r0, #2
	bne _08072878
	movs r6, #0x22
	b _08072878
_08072876:
	movs r6, #0x21
_08072878:
	movs r0, #1
	negs r0, r0
	cmp r6, r0
	beq _0807288C
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r6, #0
	bl EfxOverrideBgm
	b _08072892
_0807288C:
	ldr r1, _08072898  @ gUnknown_020200A8
	movs r0, #0
	str r0, [r1]
_08072892:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08072898: .4byte gUnknown_020200A8

	THUMB_FUNC_END sub_80726AC

	THUMB_FUNC_START sub_807289C
sub_807289C: @ 0x0807289C
	push {lr}
	bl CheckBanimHensei
	cmp r0, #1
	beq _080728BA
	ldr r0, _080728C0  @ gBmSt
	ldrb r1, [r0, #4]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	bne _080728BA
	ldr r0, _080728C4  @ gUnknown_020200A8
	ldr r0, [r0]
	cmp r0, #0
	bne _080728C8
_080728BA:
	bl MakeBgmOverridePersist
	b _080728CC
	.align 2, 0
_080728C0: .4byte gBmSt
_080728C4: .4byte gUnknown_020200A8
_080728C8:
	bl RestoreBgm
_080728CC:
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_807289C

	THUMB_FUNC_START sub_80728D0
sub_80728D0: @ 0x080728D0
	push {r4, r5, lr}
	ldr r0, [r0]
	ldrb r2, [r0, #4]
	movs r3, #0
	ldr r0, _08072908  @ gUnknown_08758A60
	ldr r1, [r0]
	movs r4, #1
	negs r4, r4
	adds r5, r0, #0
	cmp r1, r4
	beq _080728FA
	cmp r2, r1
	beq _080728FA
	adds r1, r5, #0
_080728EC:
	adds r1, #8
	adds r3, #2
	ldr r0, [r1]
	cmp r0, r4
	beq _080728FA
	cmp r2, r0
	bne _080728EC
_080728FA:
	adds r0, r3, #1
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r0, [r0]
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08072908: .4byte gUnknown_08758A60

	THUMB_FUNC_END sub_80728D0

	THUMB_FUNC_START sub_807290C
sub_807290C: @ 0x0807290C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r2, [r0, #0x3c]
	ldr r3, [r2]
	ldr r1, _0807293C  @ 0xFFFF0000
	adds r0, r3, #0
	ands r0, r1
	cmp r0, r1
	bne _08072930
	ldr r7, _08072940  @ 0x0000FFFF
	ands r7, r3
	cmp r7, #0
	beq _08072930
_08072928:
	subs r7, #1
	adds r2, #0xc
	cmp r7, #0
	bne _08072928
_08072930:
	adds r6, r2, #0
	movs r7, #0
	movs r0, #0
	mov r8, r0
	b _08072978
	.align 2, 0
_0807293C: .4byte 0xFFFF0000
_08072940: .4byte 0x0000FFFF
_08072944:
	movs r0, #6
	ldrsh r5, [r6, r0]
	ldr r0, [r6]
	bl GetAnimSpriteRotScaleX
	lsls r0, r0, #0x10
	asrs r0, r0, #0x11
	adds r5, r5, r0
	ldr r0, [r6]
	bl GetAnimSpriteRotScaleX
	adds r4, r0, #0
	ldr r0, [r6]
	bl GetAnimSpriteRotScaleY
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	adds r1, r4, #0
	muls r1, r0, r1
	adds r0, r1, #0
	muls r0, r5, r0
	add r8, r0
	adds r7, r7, r1
	adds r6, #0xc
_08072978:
	ldr r0, [r6]
	cmp r0, #1
	bne _08072944
	cmp r7, #0
	bne _0807298C
	ldr r0, _08072988  @ 0x7FFFFFFF
	b _08072994
	.align 2, 0
_08072988: .4byte 0x7FFFFFFF
_0807298C:
	mov r0, r8
	adds r1, r7, #0
	bl Div
_08072994:
	mov r8, r0
	mov r0, r8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_807290C

	THUMB_FUNC_START PlaySFX
PlaySFX: @ 0x080729A4
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r2, #0
	adds r6, r3, #0
	bl EfxPlaySE
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r6, #0
	bl M4aPlayWithPostionCtrl
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END PlaySFX

	THUMB_FUNC_START sub_80729C0
sub_80729C0: @ 0x080729C0
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r2, #0
	bl EfxPlaySE
	adds r0, r4, #0
	bl sub_807290C
	adds r1, r0, #0
	adds r0, r5, #0
	movs r2, #1
	bl M4aPlayWithPostionCtrl
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80729C0

.align 2, 0
