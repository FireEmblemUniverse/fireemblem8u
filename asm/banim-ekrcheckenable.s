	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

/* https://decomp.me/scratch/CsYo6 */
	THUMB_FUNC_START PrepareBattleGraphicsMaybe
PrepareBattleGraphicsMaybe: @ 0x08056FF8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x40
	movs r0, #1
	str r0, [sp, #0x20]
	bl ResetEkrDragonStatus
	ldr r0, _08057020  @ gBattleStats
	ldrh r1, [r0]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	bne _08057024
	movs r0, #0
	bl SetBanimArenaFlag
	b _0805702A
	.align 2, 0
_08057020: .4byte gBattleStats
_08057024:
	movs r0, #1
	bl SetBanimArenaFlag
_0805702A:
	ldr r0, _08057040  @ gBmSt
	ldrb r1, [r0, #4]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	bne _08057044
	movs r0, #0
	bl SetBanimLinkArenaFlag
	b _0805704A
	.align 2, 0
_08057040: .4byte gBmSt
_08057044:
	movs r0, #1
	bl SetBanimLinkArenaFlag
_0805704A:
	ldr r0, _08057064  @ gBattleStats
	ldrh r1, [r0]
	movs r0, #0x10
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0
	beq _0805706C
	ldr r1, _08057068  @ gEkrDistanceType
	movs r0, #4
	strh r0, [r1]
	mov r8, r1
	b _08057072
	.align 2, 0
_08057064: .4byte gBattleStats
_08057068: .4byte gEkrDistanceType
_0805706C:
	ldr r0, _080570A4  @ gEkrDistanceType
	strh r2, [r0]
	mov r8, r0
_08057072:
	mov r1, r8
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, #4
	bne _080570C0
	ldr r1, _080570A8  @ gpEkrBattleUnitLeft
	ldr r0, _080570AC  @ gBattleActor
	str r0, [r1]
	str r0, [sp, #8]
	ldr r1, _080570B0  @ gpEkrBattleUnitRight
	ldr r0, _080570B4  @ gBattleTarget
	str r0, [r1]
	str r0, [sp, #0xc]
	ldr r1, _080570B8  @ gUnknown_0203E108
	movs r0, #0
	strh r0, [r1, #2]
	strh r0, [r1]
	ldr r0, _080570BC  @ gEkrPairSideVaild
	movs r1, #1
	strh r1, [r0]
	strh r1, [r0, #2]
	ldr r6, [sp, #8]
	adds r3, r0, #0
	b _080571C6
	.align 2, 0
_080570A4: .4byte gEkrDistanceType
_080570A8: .4byte gpEkrBattleUnitLeft
_080570AC: .4byte gBattleActor
_080570B0: .4byte gpEkrBattleUnitRight
_080570B4: .4byte gBattleTarget
_080570B8: .4byte gUnknown_0203E108
_080570BC: .4byte gEkrPairSideVaild
_080570C0:
	ldr r5, _080570F8  @ gBattleActor
	ldrb r1, [r5, #0xb]
	movs r4, #0x40
	negs r4, r4
	adds r0, r4, #0
	ands r0, r1
	bl GetAllegienceId
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	ldr r0, _080570FC  @ gBattleTarget
	ldrb r0, [r0, #0xb]
	ands r4, r0
	adds r0, r4, #0
	bl GetAllegienceId
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	ldr r0, _08057100  @ gBattleStats
	ldrh r1, [r0]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08057104
	movs r3, #2
	str r3, [sp, #0x20]
	b _08057128
	.align 2, 0
_080570F8: .4byte gBattleActor
_080570FC: .4byte gBattleTarget
_08057100: .4byte gBattleStats
_08057104:
	adds r1, r5, #0
	adds r1, #0x4a
	ldrh r0, [r1]
	cmp r0, #0
	bne _08057114
	movs r4, #2
	str r4, [sp, #0x20]
	b _08057128
_08057114:
	ldrh r0, [r1]
	bl GetItemIndex
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl GetSpellAssocCharCount
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0x20]
_08057128:
	ldr r1, _08057180  @ gEkrPairSideVaild
	movs r0, #1
	strh r0, [r1, #2]
	strh r0, [r1]
	movs r4, #0
	bl GetBanimLinkArenaFlag
	cmp r0, #1
	beq _08057150
	lsls r0, r7, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0
	beq _0805714E
	cmp r0, #2
	beq _0805714E
	cmp r0, #1
	bne _08057150
	cmp r6, #1
	bne _08057150
_0805714E:
	movs r4, #1
_08057150:
	adds r2, r4, #0
	cmp r2, #1
	bne _0805719C
	ldr r1, _08057184  @ gpEkrBattleUnitLeft
	ldr r0, _08057188  @ gBattleTarget
	str r0, [r1]
	str r0, [sp, #8]
	ldr r1, _0805718C  @ gpEkrBattleUnitRight
	ldr r0, _08057190  @ gBattleActor
	str r0, [r1]
	str r0, [sp, #0xc]
	ldr r0, _08057194  @ gUnknown_0203E108
	movs r1, #0
	strh r2, [r0]
	strh r1, [r0, #2]
	ldr r5, _08057198  @ gEkrDistanceType
	mov r8, r5
	ldr r6, [sp, #0xc]
	ldr r3, _08057180  @ gEkrPairSideVaild
	ldr r7, [sp, #0x20]
	cmp r7, #1
	bne _080571C6
	strh r1, [r3]
	b _080571C6
	.align 2, 0
_08057180: .4byte gEkrPairSideVaild
_08057184: .4byte gpEkrBattleUnitLeft
_08057188: .4byte gBattleTarget
_0805718C: .4byte gpEkrBattleUnitRight
_08057190: .4byte gBattleActor
_08057194: .4byte gUnknown_0203E108
_08057198: .4byte gEkrDistanceType
_0805719C:
	ldr r1, _08057284  @ gpEkrBattleUnitLeft
	ldr r0, _08057288  @ gBattleActor
	str r0, [r1]
	str r0, [sp, #8]
	ldr r1, _0805728C  @ gpEkrBattleUnitRight
	ldr r0, _08057290  @ gBattleTarget
	str r0, [r1]
	str r0, [sp, #0xc]
	ldr r1, _08057294  @ gUnknown_0203E108
	movs r2, #0
	strh r2, [r1]
	movs r0, #1
	strh r0, [r1, #2]
	ldr r0, _08057298  @ gEkrDistanceType
	mov r8, r0
	ldr r6, [sp, #8]
	ldr r3, _0805729C  @ gEkrPairSideVaild
	ldr r1, [sp, #0x20]
	cmp r1, #1
	bne _080571C6
	strh r2, [r3, #2]
_080571C6:
	ldr r2, [sp, #8]
	mov r9, r2
	ldr r4, [sp, #0xc]
	mov sl, r4
	ldr r5, [r2]
	str r5, [sp, #0x10]
	ldr r7, [r4]
	str r7, [sp, #0x14]
	movs r0, #0
	str r0, [sp, #0x18]
	movs r1, #0
	str r1, [sp, #0x3c]
	ldrh r1, [r3, #2]
	ldrh r2, [r3]
	str r2, [sp, #0x1c]
	movs r4, #0
	ldrsh r5, [r3, r4]
	cmp r5, #0
	beq _080571F4
	mov r7, r9
	ldr r0, [r7, #4]
	ldr r0, [r0, #0x34]
	str r0, [sp, #0x3c]
_080571F4:
	lsls r0, r1, #0x10
	asrs r4, r0, #0x10
	str r0, [sp, #0x28]
	cmp r4, #0
	beq _08057206
	mov r1, sl
	ldr r0, [r1, #4]
	ldr r0, [r0, #0x34]
	str r0, [sp, #0x18]
_08057206:
	cmp r5, #0
	beq _08057232
	ldr r3, _080572A0  @ gEkrPairBmLoc
	mov r2, r9
	movs r0, #0x10
	ldrsb r0, [r2, r0]
	lsls r0, r0, #4
	ldr r2, _080572A4  @ gBmSt
	movs r7, #0xc
	ldrsh r1, [r2, r7]
	subs r0, r0, r1
	asrs r0, r0, #4
	strh r0, [r3]
	mov r1, r9
	movs r0, #0x11
	ldrsb r0, [r1, r0]
	lsls r0, r0, #4
	movs r7, #0xe
	ldrsh r1, [r2, r7]
	subs r0, r0, r1
	asrs r0, r0, #4
	strh r0, [r3, #2]
_08057232:
	cmp r4, #0
	beq _0805725E
	ldr r3, _080572A0  @ gEkrPairBmLoc
	mov r1, sl
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	lsls r0, r0, #4
	ldr r2, _080572A4  @ gBmSt
	movs r7, #0xc
	ldrsh r1, [r2, r7]
	subs r0, r0, r1
	asrs r0, r0, #4
	strh r0, [r3, #4]
	mov r1, sl
	movs r0, #0x11
	ldrsb r0, [r1, r0]
	lsls r0, r0, #4
	movs r7, #0xe
	ldrsh r1, [r2, r7]
	subs r0, r0, r1
	asrs r0, r0, #4
	strh r0, [r3, #6]
_0805725E:
	mov r1, r8
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, #4
	beq _08057336
	adds r0, r6, #0
	adds r0, #0x4a
	ldrh r0, [r0]
	bl GetItemAttributes
	movs r1, #0x80
	ands r1, r0
	cmp r1, #0
	beq _080572A8
	movs r0, #2
	mov r3, r8
	strh r0, [r3]
	b _0805732C
	.align 2, 0
_08057284: .4byte gpEkrBattleUnitLeft
_08057288: .4byte gBattleActor
_0805728C: .4byte gpEkrBattleUnitRight
_08057290: .4byte gBattleTarget
_08057294: .4byte gUnknown_0203E108
_08057298: .4byte gEkrDistanceType
_0805729C: .4byte gEkrPairSideVaild
_080572A0: .4byte gEkrPairBmLoc
_080572A4: .4byte gBmSt
_080572A8:
	movs r0, #3
	mov r7, r8
	strh r0, [r7]
	adds r0, r5, r4
	cmp r0, #2
	bne _0805732C
	ldr r0, _080572CC  @ gEkrPairBmLoc
	movs r2, #0
	ldrsh r1, [r0, r2]
	movs r3, #4
	ldrsh r2, [r0, r3]
	subs r1, r1, r2
	adds r2, r0, #0
	cmp r1, #0
	blt _080572D0
	ldrh r0, [r2]
	ldrh r1, [r2, #4]
	b _080572D4
	.align 2, 0
_080572CC: .4byte gEkrPairBmLoc
_080572D0:
	ldrh r0, [r2, #4]
	ldrh r1, [r2]
_080572D4:
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r3, r0, #0
	movs r4, #2
	ldrsh r0, [r2, r4]
	movs r5, #6
	ldrsh r1, [r2, r5]
	subs r0, r0, r1
	cmp r0, #0
	blt _080572F0
	ldrh r0, [r2, #2]
	ldrh r1, [r2, #6]
	b _080572F4
_080572F0:
	ldrh r0, [r2, #6]
	ldrh r1, [r2, #2]
_080572F4:
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r1, r3, #0x10
	asrs r1, r1, #0x10
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	adds r0, r1, r0
	cmp r0, #1
	bgt _08057314
	ldr r1, _08057310  @ gEkrDistanceType
	movs r0, #0
	b _08057328
	.align 2, 0
_08057310: .4byte gEkrDistanceType
_08057314:
	cmp r0, #3
	bgt _08057324
	ldr r1, _08057320  @ gEkrDistanceType
	movs r0, #1
	b _08057328
	.align 2, 0
_08057320: .4byte gEkrDistanceType
_08057324:
	ldr r1, _08057374  @ gEkrDistanceType
	movs r0, #2
_08057328:
	strh r0, [r1]
	mov r8, r1
_0805732C:
	mov r7, r8
	movs r1, #0
	ldrsh r0, [r7, r1]
	cmp r0, #4
	bne _080573B0
_08057336:
	ldr r2, [sp, #8]
	adds r2, #0x48
	mov r8, r2
	ldrh r2, [r2]
	mov r0, r9
	ldr r1, [sp, #0x3c]
	mov r3, sp
	bl GetBattleAnimationId
	ldr r6, _08057378  @ gEkrPairBanimID2
	ldr r4, _0805737C  @ gEkrPairBanimID
	strh r0, [r4]
	strh r0, [r6]
	ldr r5, [sp, #0xc]
	adds r5, #0x48
	ldrh r2, [r5]
	add r3, sp, #4
	mov r0, sl
	ldr r1, [sp, #0x18]
	bl GetBattleAnimationId
	strh r0, [r4, #2]
	strh r0, [r6, #2]
	ldr r3, [sp, #0x1c]
	lsls r3, r3, #0x10
	str r3, [sp, #0x24]
	mov r4, r8
	str r4, [sp, #0x2c]
	str r5, [sp, #0x30]
	b _080573FC
	.align 2, 0
_08057374: .4byte gEkrDistanceType
_08057378: .4byte gEkrPairBanimID2
_0805737C: .4byte gEkrPairBanimID
_08057380:
	ldr r0, _08057390  @ gBattleInitSide
	ldr r1, _08057394  @ gUnknown_0895EEA4
	adds r1, r2, r1
	ldrb r1, [r1]
	subs r1, #1
	strh r1, [r0]
	b _08057448
	.align 2, 0
_08057390: .4byte gBattleInitSide
_08057394: .4byte gUnknown_0895EEA4
_08057398:
	ldr r0, _080573A8  @ gBattleInitSide
	ldr r1, _080573AC  @ gUnknown_0895EEA4
	adds r1, r2, r1
	ldrb r1, [r1]
	subs r1, #1
	strh r1, [r0, #2]
	b _08057486
	.align 2, 0
_080573A8: .4byte gBattleInitSide
_080573AC: .4byte gUnknown_0895EEA4
_080573B0:
	ldr r5, [sp, #0x1c]
	lsls r0, r5, #0x10
	str r0, [sp, #0x24]
	cmp r0, #0
	beq _080573D2
	ldr r0, [sp, #8]
	adds r0, #0x4a
	ldrh r2, [r0]
	mov r0, r9
	ldr r1, [sp, #0x3c]
	mov r3, sp
	bl GetBattleAnimationId
	ldr r2, _080575A4  @ gEkrPairBanimID2
	ldr r1, _080575A8  @ gEkrPairBanimID
	strh r0, [r1]
	strh r0, [r2]
_080573D2:
	ldr r7, [sp, #8]
	adds r7, #0x48
	str r7, [sp, #0x2c]
	ldr r0, [sp, #0xc]
	adds r0, #0x48
	str r0, [sp, #0x30]
	ldr r1, [sp, #0x28]
	cmp r1, #0
	beq _080573FC
	ldr r0, [sp, #0xc]
	adds r0, #0x4a
	ldrh r2, [r0]
	add r3, sp, #4
	mov r0, sl
	ldr r1, [sp, #0x18]
	bl GetBattleAnimationId
	ldr r2, _080575A4  @ gEkrPairBanimID2
	ldr r1, _080575A8  @ gEkrPairBanimID
	strh r0, [r1, #2]
	strh r0, [r2, #2]
_080573FC:
	mov r2, r9
	ldr r0, [r2]
	ldrb r0, [r0, #4]
	subs r0, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	mov r3, r9
	ldr r0, [r3, #4]
	ldrb r4, [r0, #4]
	ldr r5, [sp, #0x24]
	asrs r3, r5, #0x10
	cmp r3, #0
	beq _0805741C
	ldr r1, _080575AC  @ gBattleInitSide
	ldr r0, _080575B0  @ 0x0000FFFF
	strh r0, [r1]
_0805741C:
	movs r1, #0
	lsls r0, r2, #3
	ldr r7, [sp, #8]
	adds r7, #0x55
	str r7, [sp, #0x34]
	ldr r5, [sp, #0xc]
	adds r5, #0x55
	str r5, [sp, #0x38]
	ldr r7, _080575B4  @ gUnknown_0895E0A4
	subs r6, r0, r2
_08057430:
	adds r2, r1, r6
	adds r0, r2, r7
	ldrb r0, [r0]
	cmp r0, r4
	bne _0805743E
	cmp r3, #0
	bne _08057380
_0805743E:
	adds r0, r1, #1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #6
	bls _08057430
_08057448:
	mov r7, sl
	ldr r0, [r7]
	ldrb r0, [r0, #4]
	subs r0, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	ldr r0, [r7, #4]
	ldrb r4, [r0, #4]
	ldr r0, [sp, #0x28]
	asrs r3, r0, #0x10
	cmp r3, #0
	beq _08057466
	ldr r1, _080575AC  @ gBattleInitSide
	ldr r0, _080575B0  @ 0x0000FFFF
	strh r0, [r1, #2]
_08057466:
	movs r1, #0
	lsls r0, r2, #3
	ldr r7, _080575B4  @ gUnknown_0895E0A4
	subs r6, r0, r2
_0805746E:
	adds r2, r1, r6
	adds r0, r2, r7
	ldrb r0, [r0]
	cmp r0, r4
	bne _0805747C
	cmp r3, #0
	bne _08057398
_0805747C:
	adds r0, r1, #1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #6
	bls _0805746E
_08057486:
	ldr r1, [sp, #0x24]
	asrs r6, r1, #0x10
	cmp r6, #0
	beq _080574A2
	ldr r0, _080575A4  @ gEkrPairBanimID2
	movs r2, #0
	ldrsh r0, [r0, r2]
	ldr r1, [sp, #8]
	adds r1, #0x4a
	ldrh r1, [r1]
	bl SomethingFilterBattleAnimId
	ldr r1, _080575B8  @ gEkrPaiSomeBanimID
	str r0, [r1]
_080574A2:
	ldr r3, [sp, #0x28]
	asrs r5, r3, #0x10
	cmp r5, #0
	beq _080574BE
	ldr r0, _080575A4  @ gEkrPairBanimID2
	movs r4, #2
	ldrsh r0, [r0, r4]
	ldr r1, [sp, #0xc]
	adds r1, #0x4a
	ldrh r1, [r1]
	bl SomethingFilterBattleAnimId
	ldr r1, _080575B8  @ gEkrPaiSomeBanimID
	str r0, [r1, #4]
_080574BE:
	ldr r7, _080575BC  @ gEkrPairTerrainID
	mov r8, r7
	ldr r1, [sp, #0x34]
	ldrb r0, [r1]
	mov r2, r8
	strh r0, [r2]
	ldr r3, [sp, #0x38]
	ldrb r0, [r3]
	strh r0, [r2, #2]
	ldr r7, _080575C0  @ gBanimTerrainIndexMaybe
	ldr r0, _080575B0  @ 0x0000FFFF
	strh r0, [r7, #2]
	movs r0, #1
	negs r0, r0
	strh r0, [r7]
	cmp r6, #0
	beq _080574F8
	ldrb r4, [r1]
	ldr r0, _080575C4  @ gPlaySt
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetROMChapterStruct
	ldrb r1, [r0, #0x13]
	adds r0, r4, #0
	bl sub_8057DA8
	strh r0, [r7]
_080574F8:
	cmp r5, #0
	beq _08057516
	ldr r0, [sp, #0x38]
	ldrb r4, [r0]
	ldr r0, _080575C4  @ gPlaySt
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetROMChapterStruct
	ldrb r1, [r0, #0x13]
	adds r0, r4, #0
	bl sub_8057DA8
	strh r0, [r7, #2]
_08057516:
	ldr r0, _080575C8  @ gBmSt
	ldrb r1, [r0, #4]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08057562
	movs r0, #0x30
	mov r1, r8
	strh r0, [r1]
	strh r0, [r1, #2]
	cmp r6, #0
	beq _08057544
	ldr r0, _080575C4  @ gPlaySt
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetROMChapterStruct
	ldrb r1, [r0, #0x13]
	movs r0, #0x30
	bl sub_8057DA8
	strh r0, [r7]
_08057544:
	cmp r5, #0
	beq _08057562
	mov r2, r8
	ldrh r4, [r2, #2]
	ldr r0, _080575C4  @ gPlaySt
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetROMChapterStruct
	ldrb r1, [r0, #0x13]
	adds r0, r4, #0
	bl sub_8057DA8
	strh r0, [r7, #2]
_08057562:
	bl CheckBanimHensei
	cmp r0, #1
	bne _0805757A
	ldr r1, _080575C0  @ gBanimTerrainIndexMaybe
	movs r0, #0x14
	strh r0, [r1, #2]
	strh r0, [r1]
	ldr r1, _080575BC  @ gEkrPairTerrainID
	movs r0, #0x30
	strh r0, [r1, #2]
	strh r0, [r1]
_0805757A:
	ldr r0, _080575CC  @ gEkrDistanceType
	movs r3, #0
	ldrsh r0, [r0, r3]
	cmp r0, #0
	blt _08057592
	cmp r0, #3
	ble _08057592
	cmp r0, #4
	bne _08057592
	ldr r1, _080575C0  @ gBanimTerrainIndexMaybe
	ldrh r0, [r1, #2]
	strh r0, [r1]
_08057592:
	ldr r0, _080575C4  @ gPlaySt
	ldrb r0, [r0, #0x15]
	cmp r0, #2
	bgt _080575D4
	cmp r0, #1
	blt _080575D4
	ldr r1, _080575D0  @ gEkrSnowWeather
	movs r0, #1
	b _080575D8
	.align 2, 0
_080575A4: .4byte gEkrPairBanimID2
_080575A8: .4byte gEkrPairBanimID
_080575AC: .4byte gBattleInitSide
_080575B0: .4byte 0x0000FFFF
_080575B4: .4byte gUnknown_0895E0A4
_080575B8: .4byte gEkrPaiSomeBanimID
_080575BC: .4byte gEkrPairTerrainID
_080575C0: .4byte gBanimTerrainIndexMaybe
_080575C4: .4byte gPlaySt
_080575C8: .4byte gBmSt
_080575CC: .4byte gEkrDistanceType
_080575D0: .4byte gEkrSnowWeather
_080575D4:
	ldr r1, _08057658  @ gEkrSnowWeather
	movs r0, #0
_080575D8:
	strh r0, [r1]
	ldr r5, [sp, #0x24]
	asrs r4, r5, #0x10
	cmp r4, #0
	beq _080575F0
	ldr r0, _0805765C  @ gEkrPairBaseCon
	mov r7, r9
	ldr r1, [r7, #4]
	ldrb r1, [r1, #0x11]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	strh r1, [r0]
_080575F0:
	ldr r0, [sp, #0x28]
	asrs r6, r0, #0x10
	cmp r6, #0
	beq _08057606
	ldr r0, _0805765C  @ gEkrPairBaseCon
	mov r2, sl
	ldr r1, [r2, #4]
	ldrb r1, [r1, #0x11]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	strh r1, [r0, #2]
_08057606:
	cmp r4, #0
	beq _08057622
	ldr r1, _08057660  @ gEkrPairHpInitial
	ldr r0, [sp, #8]
	adds r0, #0x72
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	strh r0, [r1]
	ldr r1, _08057664  @ gEkrPairMaxHP
	mov r3, r9
	movs r0, #0x12
	ldrsb r0, [r3, r0]
	strh r0, [r1]
_08057622:
	cmp r6, #0
	beq _0805763E
	ldr r1, _08057660  @ gEkrPairHpInitial
	ldr r0, [sp, #0xc]
	adds r0, #0x72
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	strh r0, [r1, #2]
	ldr r1, _08057664  @ gEkrPairMaxHP
	mov r5, sl
	movs r0, #0x12
	ldrsb r0, [r5, r0]
	strh r0, [r1, #2]
_0805763E:
	bl sub_80581EC
	ldr r0, _08057668  @ gEkrDistanceType
	movs r7, #0
	ldrsh r0, [r0, r7]
	cmp r0, #4
	bne _08057670
	ldr r1, _0805766C  @ gEkrSpellAnimIndexLutMaybe
	movs r0, #1
	strh r0, [r1, #2]
	strh r0, [r1]
	b _080576CC
	.align 2, 0
_08057658: .4byte gEkrSnowWeather
_0805765C: .4byte gEkrPairBaseCon
_08057660: .4byte gEkrPairHpInitial
_08057664: .4byte gEkrPairMaxHP
_08057668: .4byte gEkrDistanceType
_0805766C: .4byte gEkrSpellAnimIndexLutMaybe
_08057670:
	cmp r4, #0
	beq _08057688
	mov r1, r9
	ldr r0, [r1, #4]
	ldrb r0, [r0, #4]
	ldr r1, [sp, #8]
	adds r1, #0x4a
	ldrh r1, [r1]
	bl GetSpellAnimId
	ldr r1, _08057714  @ gEkrSpellAnimIndexLutMaybe
	strh r0, [r1]
_08057688:
	cmp r6, #0
	beq _080576A0
	mov r2, sl
	ldr r0, [r2, #4]
	ldrb r0, [r0, #4]
	ldr r1, [sp, #0xc]
	adds r1, #0x4a
	ldrh r1, [r1]
	bl GetSpellAnimId
	ldr r1, _08057714  @ gEkrSpellAnimIndexLutMaybe
	strh r0, [r1, #2]
_080576A0:
	ldr r0, _08057718  @ gBattleStats
	ldrh r1, [r0]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _080576CC
	ldr r0, [sp, #0xc]
	adds r0, #0x4a
	ldrh r0, [r0]
	bl IsItemDisplayedInBattle
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _080576CC
	mov r3, sl
	ldr r0, [r3, #4]
	ldrb r0, [r0, #4]
	cmp r0, #0x4d
	bne _080576CC
	ldr r1, _08057714  @ gEkrSpellAnimIndexLutMaybe
	movs r0, #0xf
	strh r0, [r1, #2]
_080576CC:
	ldr r4, [sp, #0x24]
	cmp r4, #0
	beq _080576E0
	ldr r0, _08057714  @ gEkrSpellAnimIndexLutMaybe
	ldr r1, [sp, #8]
	adds r1, #0x4a
	ldrh r2, [r1]
	movs r1, #0
	bl sub_80581A0
_080576E0:
	ldr r5, [sp, #0x28]
	cmp r5, #0
	beq _080576F4
	ldr r0, _0805771C  @ gUnknown_0203E11A
	ldr r1, [sp, #0xc]
	adds r1, #0x4a
	ldrh r2, [r1]
	movs r1, #1
	bl sub_80581A0
_080576F4:
	ldr r0, _08057720  @ gEkrDistanceType
	movs r7, #0
	ldrsh r0, [r0, r7]
	cmp r0, #0
	blt _0805773E
	cmp r0, #2
	bgt _0805773E
	mov r1, r9
	ldr r0, [r1, #4]
	ldrb r0, [r0, #4]
	cmp r0, #0x65
	beq _08057724
	cmp r0, #0x66
	beq _08057734
	b _0805773E
	.align 2, 0
_08057714: .4byte gEkrSpellAnimIndexLutMaybe
_08057718: .4byte gBattleStats
_0805771C: .4byte gUnknown_0203E11A
_08057720: .4byte gEkrDistanceType
_08057724:
	ldr r0, _08057730  @ gAnims
	ldr r0, [r0]
	movs r1, #1
	bl SetEkrDragonStatusType
	b _0805773E
	.align 2, 0
_08057730: .4byte gAnims
_08057734:
	ldr r0, _080579DC  @ gAnims
	ldr r0, [r0]
	movs r1, #2
	bl SetEkrDragonStatusType
_0805773E:
	ldr r2, [sp, #0x24]
	asrs r6, r2, #0x10
	cmp r6, #0
	beq _08057758
	mov r3, r9
	ldrb r1, [r3, #0xb]
	movs r0, #0x40
	negs r0, r0
	ands r0, r1
	bl GetAllegienceId
	ldr r1, _080579E0  @ gBanimSomeObjPalIndex
	strh r0, [r1]
_08057758:
	ldr r5, [sp, #0x28]
	asrs r4, r5, #0x10
	cmp r4, #0
	beq _08057772
	mov r7, sl
	ldrb r1, [r7, #0xb]
	movs r0, #0x40
	negs r0, r0
	ands r0, r1
	bl GetAllegienceId
	ldr r1, _080579E0  @ gBanimSomeObjPalIndex
	strh r0, [r1, #2]
_08057772:
	ldr r1, _080579E4  @ gEkrPids
	movs r7, #0
	strb r7, [r1, #1]
	strb r7, [r1]
	cmp r6, #0
	beq _08057784
	ldr r2, [sp, #0x10]
	ldrb r0, [r2, #4]
	strb r0, [r1]
_08057784:
	cmp r4, #0
	beq _0805778E
	ldr r3, [sp, #0x14]
	ldrb r0, [r3, #4]
	strb r0, [r1, #1]
_0805778E:
	ldr r3, _080579E8  @ gEkrPairHit
	cmp r6, #0
	beq _0805779C
	ldr r0, [sp, #8]
	adds r0, #0x64
	ldrh r0, [r0]
	strh r0, [r3]
_0805779C:
	cmp r4, #0
	beq _080577A8
	ldr r0, [sp, #0xc]
	adds r0, #0x64
	ldrh r0, [r0]
	strh r0, [r3, #2]
_080577A8:
	adds r1, r3, #0
	ldrh r2, [r1]
	movs r4, #0
	ldrsh r0, [r1, r4]
	cmp r0, #0xff
	bne _080577B8
	ldr r0, _080579EC  @ 0x0000FFFF
	strh r0, [r1]
_080577B8:
	ldrh r1, [r3, #2]
	movs r5, #2
	ldrsh r0, [r3, r5]
	cmp r0, #0xff
	bne _080577C6
	ldr r0, _080579EC  @ 0x0000FFFF
	strh r0, [r3, #2]
_080577C6:
	cmp r6, #0
	beq _08057800
	ldr r4, _080579F0  @ gEkrPairDmgPair
	ldr r2, [sp, #8]
	adds r2, #0x5a
	ldr r0, [sp, #0xc]
	adds r0, #0x5c
	ldrh r1, [r2]
	ldrh r0, [r0]
	subs r1, r1, r0
	strh r1, [r4]
	lsls r1, r1, #0x10
	cmp r1, #0
	bge _080577E4
	strh r7, [r4]
_080577E4:
	movs r7, #0
	ldrsh r0, [r2, r7]
	cmp r0, #0xff
	bne _080577F0
	ldr r0, _080579EC  @ 0x0000FFFF
	strh r0, [r4]
_080577F0:
	ldr r1, [sp, #0x2c]
	ldrh r0, [r1]
	bl GetItemIndex
	cmp r0, #0xb5
	bne _08057800
	ldr r0, _080579EC  @ 0x0000FFFF
	strh r0, [r4]
_08057800:
	ldr r2, [sp, #0x28]
	cmp r2, #0
	beq _0805783E
	ldr r4, _080579F0  @ gEkrPairDmgPair
	ldr r2, [sp, #0xc]
	adds r2, #0x5a
	ldr r0, [sp, #8]
	adds r0, #0x5c
	ldrh r1, [r2]
	ldrh r0, [r0]
	subs r1, r1, r0
	strh r1, [r4, #2]
	lsls r1, r1, #0x10
	cmp r1, #0
	bge _08057822
	movs r0, #0
	strh r0, [r4, #2]
_08057822:
	movs r3, #0
	ldrsh r0, [r2, r3]
	cmp r0, #0xff
	bne _0805782E
	ldr r0, _080579EC  @ 0x0000FFFF
	strh r0, [r4, #2]
_0805782E:
	ldr r5, [sp, #0x30]
	ldrh r0, [r5]
	bl GetItemIndex
	cmp r0, #0xb5
	bne _0805783E
	ldr r0, _080579EC  @ 0x0000FFFF
	strh r0, [r4, #2]
_0805783E:
	ldr r7, [sp, #0x24]
	asrs r5, r7, #0x10
	ldr r7, _080579F4  @ gEkrPairCritPair
	cmp r5, #0
	beq _08057850
	ldr r0, [sp, #8]
	adds r0, #0x6a
	ldrh r0, [r0]
	strh r0, [r7]
_08057850:
	ldr r0, [sp, #0x28]
	asrs r6, r0, #0x10
	cmp r6, #0
	beq _08057860
	ldr r0, [sp, #0xc]
	adds r0, #0x6a
	ldrh r0, [r0]
	strh r0, [r7, #2]
_08057860:
	adds r4, r7, #0
	ldrh r1, [r4]
	movs r2, #0
	ldrsh r0, [r4, r2]
	cmp r0, #0xff
	bne _08057870
	ldr r0, _080579EC  @ 0x0000FFFF
	strh r0, [r4]
_08057870:
	ldrh r1, [r4, #2]
	movs r3, #2
	ldrsh r0, [r4, r3]
	cmp r0, #0xff
	bne _0805787E
	ldr r0, _080579EC  @ 0x0000FFFF
	strh r0, [r4, #2]
_0805787E:
	ldr r1, [sp, #0x2c]
	ldrh r0, [r1]
	bl GetItemIndex
	cmp r0, #0xb5
	bne _0805788E
	ldr r0, _080579EC  @ 0x0000FFFF
	strh r0, [r4]
_0805788E:
	ldr r2, [sp, #0x30]
	ldrh r0, [r2]
	bl GetItemIndex
	cmp r0, #0xb5
	bne _0805789E
	ldr r0, _080579EC  @ 0x0000FFFF
	strh r0, [r4, #2]
_0805789E:
	ldr r2, _080579F8  @ gEkrDistanceType
	movs r3, #0
	ldrsh r0, [r2, r3]
	cmp r0, #4
	bne _080578B8
	ldr r1, _080579E8  @ gEkrPairHit
	ldr r0, _080579EC  @ 0x0000FFFF
	strh r0, [r1, #2]
	ldr r1, _080579F0  @ gEkrPairDmgPair
	movs r0, #1
	negs r0, r0
	strh r0, [r1, #2]
	strh r0, [r7, #2]
_080578B8:
	cmp r5, #0
	beq _080578CA
	ldr r1, _080579FC  @ gEkrPairExpPrevious
	ldr r0, [sp, #8]
	adds r0, #0x71
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	strh r0, [r1]
_080578CA:
	cmp r6, #0
	beq _080578DC
	ldr r1, _080579FC  @ gEkrPairExpPrevious
	ldr r0, [sp, #0xc]
	adds r0, #0x71
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	strh r0, [r1, #2]
_080578DC:
	cmp r5, #0
	beq _080578EE
	ldr r1, _08057A00  @ gEkrPairExpGain
	ldr r0, [sp, #8]
	adds r0, #0x6e
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	strh r0, [r1]
_080578EE:
	cmp r6, #0
	beq _08057900
	ldr r1, _08057A00  @ gEkrPairExpGain
	ldr r0, [sp, #0xc]
	adds r0, #0x6e
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	strh r0, [r1, #2]
_08057900:
	ldr r1, _08057A04  @ gEkrPairWTABonus
	movs r0, #0
	strh r0, [r1, #2]
	strh r0, [r1]
	movs r4, #0
	ldrsh r0, [r2, r4]
	cmp r0, #4
	beq _08057996
	cmp r5, #0
	beq _08057920
	ldr r0, [sp, #8]
	adds r0, #0x53
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	strh r0, [r1]
_08057920:
	cmp r6, #0
	beq _08057930
	ldr r0, [sp, #0xc]
	adds r0, #0x53
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	strh r0, [r1, #2]
_08057930:
	cmp r5, #0
	beq _08057944
	mov r0, r9
	mov r1, sl
	bl IsUnitEffectiveAgainst
	ldr r1, _08057A08  @ gEkrPairEffectiveAgainst
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	strh r0, [r1]
_08057944:
	cmp r6, #0
	beq _08057958
	mov r0, sl
	mov r1, r9
	bl IsUnitEffectiveAgainst
	ldr r1, _08057A08  @ gEkrPairEffectiveAgainst
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	strh r0, [r1, #2]
_08057958:
	ldr r4, _08057A08  @ gEkrPairEffectiveAgainst
	movs r7, #0
	ldrsh r0, [r4, r7]
	cmp r0, #0
	bne _08057976
	cmp r5, #0
	beq _08057976
	ldr r1, [sp, #0x2c]
	ldrh r0, [r1]
	mov r1, sl
	bl IsItemEffectiveAgainst
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	strh r0, [r4]
_08057976:
	ldr r4, _08057A08  @ gEkrPairEffectiveAgainst
	movs r2, #2
	ldrsh r0, [r4, r2]
	cmp r0, #0
	bne _08057996
	ldr r3, [sp, #0x28]
	cmp r3, #0
	beq _08057996
	ldr r5, [sp, #0x30]
	ldrh r0, [r5]
	mov r1, r9
	bl IsItemEffectiveAgainst
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	strh r0, [r4, #2]
_08057996:
	ldr r0, _08057A0C  @ gUnknown_0203E1A4
	movs r4, #0
	str r4, [r0, #4]
	str r4, [r0]
	ldr r7, [sp, #0x24]
	cmp r7, #0
	beq _080579AE
	ldr r0, [sp, #8]
	adds r0, #0x4a
	ldrh r0, [r0]
	bl GetItemIndex
_080579AE:
	ldr r0, [sp, #0x28]
	cmp r0, #0
	beq _080579BE
	ldr r0, [sp, #0xc]
	adds r0, #0x4a
	ldrh r0, [r0]
	bl GetItemIndex
_080579BE:
	bl GetBanimLinkArenaFlag
	cmp r0, #1
	beq _080579D2
	ldr r0, _08057A10  @ gPlaySt
	adds r0, #0x40
	ldrb r0, [r0]
	lsls r0, r0, #0x1f
	cmp r0, #0
	beq _08057A18
_080579D2:
	ldr r1, _08057A14  @ gUnknown_0203E1DC
	movs r0, #1
	strh r0, [r1, #2]
	strh r0, [r1]
	b _08057A1E
	.align 2, 0
_080579DC: .4byte gAnims
_080579E0: .4byte gBanimSomeObjPalIndex
_080579E4: .4byte gEkrPids
_080579E8: .4byte gEkrPairHit
_080579EC: .4byte 0x0000FFFF
_080579F0: .4byte gEkrPairDmgPair
_080579F4: .4byte gEkrPairCritPair
_080579F8: .4byte gEkrDistanceType
_080579FC: .4byte gEkrPairExpPrevious
_08057A00: .4byte gEkrPairExpGain
_08057A04: .4byte gEkrPairWTABonus
_08057A08: .4byte gEkrPairEffectiveAgainst
_08057A0C: .4byte gUnknown_0203E1A4
_08057A10: .4byte gPlaySt
_08057A14: .4byte gUnknown_0203E1DC
_08057A18:
	ldr r0, _08057A3C  @ gUnknown_0203E1DC
	strh r4, [r0, #2]
	strh r4, [r0]
_08057A1E:
	ldr r5, _08057A40  @ gEkrPairSomeTile
	movs r0, #0
	strh r0, [r5]
	bl GetBattleAnimType
	cmp r0, #3
	bne _08057A66
	ldr r0, _08057A44  @ gEkrPairSideVaild
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _08057A4C
	ldr r0, _08057A48  @ gEkrPairTerrainID
	ldrh r4, [r0]
	b _08057A50
	.align 2, 0
_08057A3C: .4byte gUnknown_0203E1DC
_08057A40: .4byte gEkrPairSomeTile
_08057A44: .4byte gEkrPairSideVaild
_08057A48: .4byte gEkrPairTerrainID
_08057A4C:
	ldr r0, _08057C78  @ gEkrPairTerrainID
	ldrh r4, [r0, #2]
_08057A50:
	ldr r0, _08057C7C  @ gPlaySt
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetROMChapterStruct
	ldrb r1, [r0, #0x13]
	adds r0, r4, #0
	bl sub_8057ED0
	strh r0, [r5]
_08057A66:
	bl CheckBanimHensei
	cmp r0, #1
	bne _08057A74
	ldr r1, _08057C80  @ gEkrPairSomeTile
	movs r0, #0x3c
	strh r0, [r1]
_08057A74:
	movs r4, #0
	bl GetBattleAnimType
	cmp r0, #0
	bne _08057A80
	movs r4, #1
_08057A80:
	bl GetBattleAnimType
	cmp r0, #3
	bne _08057A8A
	movs r4, #1
_08057A8A:
	bl GetBattleAnimType
	cmp r0, #1
	bne _08057AB6
	ldr r0, _08057C84  @ gEkrDistanceType
	movs r2, #0
	ldrsh r0, [r0, r2]
	cmp r0, #4
	bne _08057A9E
	movs r4, #1
_08057A9E:
	bl GetBattleAnimArenaFlag
	cmp r0, #1
	bne _08057AA8
	movs r4, #1
_08057AA8:
	bl sub_8058B7C
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _08057AB6
	movs r4, #1
_08057AB6:
	bl sub_8058B70
	ldr r0, _08057C84  @ gEkrDistanceType
	movs r3, #0
	ldrsh r0, [r0, r3]
	cmp r0, #4
	beq _08057AE0
	mov r5, r9
	ldr r0, [r5, #0xc]
	movs r1, #0x80
	lsls r1, r1, #4
	ands r0, r1
	cmp r0, #0
	beq _08057AD4
	b _08057C72
_08057AD4:
	mov r7, sl
	ldr r0, [r7, #0xc]
	ands r0, r1
	cmp r0, #0
	beq _08057AE0
	b _08057C72
_08057AE0:
	mov r1, r9
	ldr r0, [r1, #4]
	ldrb r0, [r0, #4]
	cmp r0, #0x3c
	bne _08057AFA
	ldr r0, [sp, #0xc]
	adds r0, #0x4a
	ldrh r0, [r0]
	bl GetItemIndex
	cmp r0, #0x52
	bne _08057AFA
	b _08057C72
_08057AFA:
	mov r2, sl
	ldr r0, [r2, #4]
	ldrb r0, [r0, #4]
	cmp r0, #0x3c
	bne _08057B14
	ldr r0, [sp, #8]
	adds r0, #0x4a
	ldrh r0, [r0]
	bl GetItemIndex
	cmp r0, #0x52
	bne _08057B14
	b _08057C72
_08057B14:
	mov r3, r9
	ldr r0, [r3, #4]
	ldrb r0, [r0, #4]
	cmp r0, #0x3c
	bne _08057B2E
	ldr r0, [sp, #0xc]
	adds r0, #0x4a
	ldrh r0, [r0]
	bl GetItemIndex
	cmp r0, #0x53
	bne _08057B2E
	b _08057C72
_08057B2E:
	mov r5, sl
	ldr r0, [r5, #4]
	ldrb r0, [r0, #4]
	cmp r0, #0x3c
	bne _08057B48
	ldr r0, [sp, #8]
	adds r0, #0x4a
	ldrh r0, [r0]
	bl GetItemIndex
	cmp r0, #0x53
	bne _08057B48
	b _08057C72
_08057B48:
	mov r7, r9
	ldr r0, [r7, #4]
	ldrb r0, [r0, #4]
	cmp r0, #0x3c
	bne _08057B62
	ldr r0, [sp, #0xc]
	adds r0, #0x4a
	ldrh r0, [r0]
	bl GetItemIndex
	cmp r0, #0x51
	bne _08057B62
	b _08057C72
_08057B62:
	mov r1, sl
	ldr r0, [r1, #4]
	ldrb r0, [r0, #4]
	cmp r0, #0x3c
	bne _08057B7A
	ldr r0, [sp, #8]
	adds r0, #0x4a
	ldrh r0, [r0]
	bl GetItemIndex
	cmp r0, #0x51
	beq _08057C72
_08057B7A:
	mov r2, r9
	ldr r0, [r2, #4]
	ldrb r0, [r0, #4]
	cmp r0, #0x3c
	bne _08057B92
	ldr r0, [sp, #0xc]
	adds r0, #0x4a
	ldrh r0, [r0]
	bl GetItemIndex
	cmp r0, #0xb5
	beq _08057C72
_08057B92:
	mov r3, sl
	ldr r0, [r3, #4]
	ldrb r0, [r0, #4]
	cmp r0, #0x3c
	bne _08057BAA
	ldr r0, [sp, #8]
	adds r0, #0x4a
	ldrh r0, [r0]
	bl GetItemIndex
	cmp r0, #0xb5
	beq _08057C72
_08057BAA:
	ldr r5, [sp, #0x20]
	cmp r5, #1
	beq _08057BD6
	mov r7, r9
	ldr r0, [r7, #4]
	ldrb r0, [r0, #4]
	cmp r0, #0x66
	bne _08057BD6
	ldr r0, [sp, #8]
	adds r0, #0x4a
	ldrh r0, [r0]
	bl GetItemIndex
	cmp r0, #0xa6
	beq _08057BD6
	mov r1, sl
	ldr r0, [r1, #4]
	ldrb r0, [r0, #4]
	cmp r0, #0x51
	beq _08057BD6
	cmp r0, #0x65
	bne _08057C98
_08057BD6:
	cmp r4, #0
	beq _08057C72
	ldr r0, _08057C88  @ gEkrPairSideVaild
	movs r2, #0
	ldrsh r1, [r0, r2]
	adds r3, r0, #0
	cmp r1, #1
	bne _08057C28
	mov r0, r9
	adds r0, #0x30
	ldrb r1, [r0]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #4
	beq _08057C72
	ldr r0, _08057C8C  @ gEkrPairBanimID2
	movs r4, #0
	ldrsh r0, [r0, r4]
	movs r2, #1
	negs r2, r2
	cmp r0, r2
	beq _08057C72
	ldr r0, _08057C90  @ gEkrSpellAnimIndexLutMaybe
	movs r5, #0
	ldrsh r1, [r0, r5]
	movs r0, #2
	negs r0, r0
	cmp r1, r0
	beq _08057C72
	ldr r0, _08057C94  @ gBanimTerrainIndexMaybe
	movs r7, #0
	ldrsh r0, [r0, r7]
	cmp r0, r2
	beq _08057C72
	ldr r0, _08057C78  @ gEkrPairTerrainID
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0x1b
	beq _08057C72
	cmp r0, #0x33
	beq _08057C72
_08057C28:
	movs r2, #2
	ldrsh r0, [r3, r2]
	cmp r0, #1
	bne _08057C98
	mov r0, sl
	adds r0, #0x30
	ldrb r1, [r0]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #4
	beq _08057C72
	ldr r0, _08057C8C  @ gEkrPairBanimID2
	movs r3, #2
	ldrsh r0, [r0, r3]
	movs r2, #1
	negs r2, r2
	cmp r0, r2
	beq _08057C72
	ldr r0, _08057C90  @ gEkrSpellAnimIndexLutMaybe
	movs r4, #2
	ldrsh r1, [r0, r4]
	movs r0, #2
	negs r0, r0
	cmp r1, r0
	beq _08057C72
	ldr r0, _08057C94  @ gBanimTerrainIndexMaybe
	movs r5, #2
	ldrsh r0, [r0, r5]
	cmp r0, r2
	beq _08057C72
	ldr r0, _08057C78  @ gEkrPairTerrainID
	movs r7, #2
	ldrsh r0, [r0, r7]
	cmp r0, #0x1b
	beq _08057C72
	cmp r0, #0x33
	bne _08057C98
_08057C72:
	movs r0, #0
	b _08057C9A
	.align 2, 0
_08057C78: .4byte gEkrPairTerrainID
_08057C7C: .4byte gPlaySt
_08057C80: .4byte gEkrPairSomeTile
_08057C84: .4byte gEkrDistanceType
_08057C88: .4byte gEkrPairSideVaild
_08057C8C: .4byte gEkrPairBanimID2
_08057C90: .4byte gEkrSpellAnimIndexLutMaybe
_08057C94: .4byte gBanimTerrainIndexMaybe
_08057C98:
	movs r0, #1
_08057C9A:
	add sp, #0x40
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END PrepareBattleGraphicsMaybe

	THUMB_FUNC_START sub_8057CAC
sub_8057CAC: @ 0x08057CAC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	adds r5, r0, #0
	adds r4, r1, #0
	mov r9, r3
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	mov r8, r2
	movs r0, #0
	mov sl, r0
	cmp r4, #0
	beq _08057CE2
	mov r0, r8
	bl GetItemType
	cmp r0, #9
	bne _08057CEC
	mov r0, r8
	bl IsItemDisplayedInBattle
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _08057CEC
_08057CE2:
	ldr r0, _08057CE8  @ 0x0000FFFF
	b _08057D98
	.align 2, 0
_08057CE8: .4byte 0x0000FFFF
_08057CEC:
	mov r1, r8
	cmp r1, #0
	bne _08057CF6
	movs r3, #9
	b _08057D00
_08057CF6:
	mov r0, r8
	bl GetItemType
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
_08057D00:
	str r4, [sp]
	ldr r2, [r5]
	ldr r1, [r5, #4]
	ldr r0, [r2, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	lsrs r0, r0, #8
	movs r1, #1
	ands r0, r1
	adds r2, #0x25
	adds r2, r2, r0
	ldrb r0, [r2]
	cmp r0, #0
	beq _08057D26
	ldr r1, _08057D38  @ gUnknown_088AF834
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	str r0, [sp]
_08057D26:
	movs r0, #0
	mov r2, r9
	str r0, [r2]
	movs r7, #0
	movs r1, #0
_08057D30:
	ldr r5, [sp]
	movs r6, #0
	b _08057D80
	.align 2, 0
_08057D38: .4byte gUnknown_088AF834
_08057D3C:
	cmp r7, #0
	bne _08057D44
	cmp r0, #0xff
	bhi _08057D7C
_08057D44:
	cmp r7, #1
	bne _08057D4E
	ldrh r0, [r5]
	cmp r0, #0xff
	bls _08057D7C
_08057D4E:
	ldrh r4, [r5]
	mov r0, r8
	str r1, [sp, #4]
	str r3, [sp, #8]
	bl GetItemIndex
	ldr r1, [sp, #4]
	ldr r3, [sp, #8]
	cmp r4, r0
	beq _08057D6C
	ldrh r0, [r5]
	ldr r2, _08057D78  @ 0xFFFFFF00
	adds r0, r0, r2
	cmp r0, r3
	bne _08057D7C
_08057D6C:
	ldrh r5, [r5, #2]
	mov sl, r5
	mov r0, r9
	str r6, [r0]
	movs r1, #1
	b _08057D86
	.align 2, 0
_08057D78: .4byte 0xFFFFFF00
_08057D7C:
	adds r5, #4
	adds r6, #1
_08057D80:
	ldrh r0, [r5]
	cmp r0, #0
	bne _08057D3C
_08057D86:
	cmp r1, #1
	beq _08057D90
	adds r7, #1
	cmp r7, #1
	ble _08057D30
_08057D90:
	mov r0, sl
	subs r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
_08057D98:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8057CAC

	THUMB_FUNC_START sub_8057DA8
sub_8057DA8: @ 0x08057DA8
	push {lr}
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0x14
	bls _08057DB8
	b _08057EBC
_08057DB8:
	lsls r0, r0, #2
	ldr r1, _08057DC4  @ _08057DC8
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08057DC4: .4byte _08057DC8
_08057DC8: @ jump table
	.4byte _08057EBC @ case 0
	.4byte _08057E1C @ case 1
	.4byte _08057E24 @ case 2
	.4byte _08057E2C @ case 3
	.4byte _08057E34 @ case 4
	.4byte _08057E3C @ case 5
	.4byte _08057E44 @ case 6
	.4byte _08057E4C @ case 7
	.4byte _08057E54 @ case 8
	.4byte _08057E5C @ case 9
	.4byte _08057E64 @ case 10
	.4byte _08057E6C @ case 11
	.4byte _08057E74 @ case 12
	.4byte _08057E7C @ case 13
	.4byte _08057E84 @ case 14
	.4byte _08057E8C @ case 15
	.4byte _08057E94 @ case 16
	.4byte _08057E9C @ case 17
	.4byte _08057EA4 @ case 18
	.4byte _08057EAC @ case 19
	.4byte _08057EB4 @ case 20
_08057E1C:
	ldr r0, _08057E20  @ gUnknown_0880C807
	b _08057EBE
	.align 2, 0
_08057E20: .4byte gUnknown_0880C807
_08057E24:
	ldr r0, _08057E28  @ gUnknown_0880C848
	b _08057EBE
	.align 2, 0
_08057E28: .4byte gUnknown_0880C848
_08057E2C:
	ldr r0, _08057E30  @ gUnknown_0880C889
	b _08057EBE
	.align 2, 0
_08057E30: .4byte gUnknown_0880C889
_08057E34:
	ldr r0, _08057E38  @ gUnknown_0880C8CA
	b _08057EBE
	.align 2, 0
_08057E38: .4byte gUnknown_0880C8CA
_08057E3C:
	ldr r0, _08057E40  @ gUnknown_0880C90B
	b _08057EBE
	.align 2, 0
_08057E40: .4byte gUnknown_0880C90B
_08057E44:
	ldr r0, _08057E48  @ gUnknown_0880C94C
	b _08057EBE
	.align 2, 0
_08057E48: .4byte gUnknown_0880C94C
_08057E4C:
	ldr r0, _08057E50  @ gUnknown_0880C98D
	b _08057EBE
	.align 2, 0
_08057E50: .4byte gUnknown_0880C98D
_08057E54:
	ldr r0, _08057E58  @ gUnknown_0880C9CE
	b _08057EBE
	.align 2, 0
_08057E58: .4byte gUnknown_0880C9CE
_08057E5C:
	ldr r0, _08057E60  @ gUnknown_0880CA0F
	b _08057EBE
	.align 2, 0
_08057E60: .4byte gUnknown_0880CA0F
_08057E64:
	ldr r0, _08057E68  @ gUnknown_0880CA50
	b _08057EBE
	.align 2, 0
_08057E68: .4byte gUnknown_0880CA50
_08057E6C:
	ldr r0, _08057E70  @ gUnknown_0880CA91
	b _08057EBE
	.align 2, 0
_08057E70: .4byte gUnknown_0880CA91
_08057E74:
	ldr r0, _08057E78  @ gUnknown_0880CAD2
	b _08057EBE
	.align 2, 0
_08057E78: .4byte gUnknown_0880CAD2
_08057E7C:
	ldr r0, _08057E80  @ gUnknown_0880CB13
	b _08057EBE
	.align 2, 0
_08057E80: .4byte gUnknown_0880CB13
_08057E84:
	ldr r0, _08057E88  @ gUnknown_0880CB54
	b _08057EBE
	.align 2, 0
_08057E88: .4byte gUnknown_0880CB54
_08057E8C:
	ldr r0, _08057E90  @ gUnknown_0880CB95
	b _08057EBE
	.align 2, 0
_08057E90: .4byte gUnknown_0880CB95
_08057E94:
	ldr r0, _08057E98  @ gUnknown_0880CBD6
	b _08057EBE
	.align 2, 0
_08057E98: .4byte gUnknown_0880CBD6
_08057E9C:
	ldr r0, _08057EA0  @ gUnknown_0880CC17
	b _08057EBE
	.align 2, 0
_08057EA0: .4byte gUnknown_0880CC17
_08057EA4:
	ldr r0, _08057EA8  @ gUnknown_0880CC58
	b _08057EBE
	.align 2, 0
_08057EA8: .4byte gUnknown_0880CC58
_08057EAC:
	ldr r0, _08057EB0  @ gUnknown_0880CC99
	b _08057EBE
	.align 2, 0
_08057EB0: .4byte gUnknown_0880CC99
_08057EB4:
	ldr r0, _08057EB8  @ gUnknown_0880CCDA
	b _08057EBE
	.align 2, 0
_08057EB8: .4byte gUnknown_0880CCDA
_08057EBC:
	ldr r0, _08057ECC  @ gUnknown_0880C7C6
_08057EBE:
	adds r0, r2, r0
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, #1
	pop {r1}
	bx r1
	.align 2, 0
_08057ECC: .4byte gUnknown_0880C7C6

	THUMB_FUNC_END sub_8057DA8

	THUMB_FUNC_START sub_8057ED0
sub_8057ED0: @ 0x08057ED0
	push {lr}
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0x14
	bls _08057EE0
	b _08057FE4
_08057EE0:
	lsls r0, r0, #2
	ldr r1, _08057EEC  @ _08057EF0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08057EEC: .4byte _08057EF0
_08057EF0: @ jump table
	.4byte _08057FE4 @ case 0
	.4byte _08057F44 @ case 1
	.4byte _08057F4C @ case 2
	.4byte _08057F54 @ case 3
	.4byte _08057F5C @ case 4
	.4byte _08057F64 @ case 5
	.4byte _08057F6C @ case 6
	.4byte _08057F74 @ case 7
	.4byte _08057F7C @ case 8
	.4byte _08057F84 @ case 9
	.4byte _08057F8C @ case 10
	.4byte _08057F94 @ case 11
	.4byte _08057F9C @ case 12
	.4byte _08057FA4 @ case 13
	.4byte _08057FAC @ case 14
	.4byte _08057FB4 @ case 15
	.4byte _08057FBC @ case 16
	.4byte _08057FC4 @ case 17
	.4byte _08057FCC @ case 18
	.4byte _08057FD4 @ case 19
	.4byte _08057FDC @ case 20
_08057F44:
	ldr r0, _08057F48  @ gUnknown_0880CD5C
	b _08057FE6
	.align 2, 0
_08057F48: .4byte gUnknown_0880CD5C
_08057F4C:
	ldr r0, _08057F50  @ gUnknown_0880CD9D
	b _08057FE6
	.align 2, 0
_08057F50: .4byte gUnknown_0880CD9D
_08057F54:
	ldr r0, _08057F58  @ gUnknown_0880CDDE
	b _08057FE6
	.align 2, 0
_08057F58: .4byte gUnknown_0880CDDE
_08057F5C:
	ldr r0, _08057F60  @ gUnknown_0880CE1F
	b _08057FE6
	.align 2, 0
_08057F60: .4byte gUnknown_0880CE1F
_08057F64:
	ldr r0, _08057F68  @ gUnknown_0880CE60
	b _08057FE6
	.align 2, 0
_08057F68: .4byte gUnknown_0880CE60
_08057F6C:
	ldr r0, _08057F70  @ gUnknown_0880CEA1
	b _08057FE6
	.align 2, 0
_08057F70: .4byte gUnknown_0880CEA1
_08057F74:
	ldr r0, _08057F78  @ gUnknown_0880CEE2
	b _08057FE6
	.align 2, 0
_08057F78: .4byte gUnknown_0880CEE2
_08057F7C:
	ldr r0, _08057F80  @ gUnknown_0880CF23
	b _08057FE6
	.align 2, 0
_08057F80: .4byte gUnknown_0880CF23
_08057F84:
	ldr r0, _08057F88  @ gUnknown_0880CF64
	b _08057FE6
	.align 2, 0
_08057F88: .4byte gUnknown_0880CF64
_08057F8C:
	ldr r0, _08057F90  @ gUnknown_0880CFA5
	b _08057FE6
	.align 2, 0
_08057F90: .4byte gUnknown_0880CFA5
_08057F94:
	ldr r0, _08057F98  @ gUnknown_0880CFE6
	b _08057FE6
	.align 2, 0
_08057F98: .4byte gUnknown_0880CFE6
_08057F9C:
	ldr r0, _08057FA0  @ gUnknown_0880D027
	b _08057FE6
	.align 2, 0
_08057FA0: .4byte gUnknown_0880D027
_08057FA4:
	ldr r0, _08057FA8  @ gUnknown_0880D068
	b _08057FE6
	.align 2, 0
_08057FA8: .4byte gUnknown_0880D068
_08057FAC:
	ldr r0, _08057FB0  @ gUnknown_0880D0A9
	b _08057FE6
	.align 2, 0
_08057FB0: .4byte gUnknown_0880D0A9
_08057FB4:
	ldr r0, _08057FB8  @ gUnknown_0880D0EA
	b _08057FE6
	.align 2, 0
_08057FB8: .4byte gUnknown_0880D0EA
_08057FBC:
	ldr r0, _08057FC0  @ gUnknown_0880D12B
	b _08057FE6
	.align 2, 0
_08057FC0: .4byte gUnknown_0880D12B
_08057FC4:
	ldr r0, _08057FC8  @ gUnknown_0880D16C
	b _08057FE6
	.align 2, 0
_08057FC8: .4byte gUnknown_0880D16C
_08057FCC:
	ldr r0, _08057FD0  @ gUnknown_0880D1AD
	b _08057FE6
	.align 2, 0
_08057FD0: .4byte gUnknown_0880D1AD
_08057FD4:
	ldr r0, _08057FD8  @ gUnknown_0880D1EE
	b _08057FE6
	.align 2, 0
_08057FD8: .4byte gUnknown_0880D1EE
_08057FDC:
	ldr r0, _08057FE0  @ gUnknown_0880D22F
	b _08057FE6
	.align 2, 0
_08057FE0: .4byte gUnknown_0880D22F
_08057FE4:
	ldr r0, _08057FF4  @ gUnknown_0880CD1B
_08057FE6:
	adds r0, r2, r0
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1
	.align 2, 0
_08057FF4: .4byte gUnknown_0880CD1B

	THUMB_FUNC_END sub_8057ED0

	THUMB_FUNC_START GetSpellAnimId
GetSpellAnimId: @ 0x08057FF8
	push {r4, lr}
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	adds r0, r1, #0
	bl GetItemIndex
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r3, _08058014  @ gSpellAssocData
	ldrh r1, [r3]
	ldr r2, _08058018  @ 0x0000FFFF
	b _08058020
	.align 2, 0
_08058014: .4byte gSpellAssocData
_08058018: .4byte 0x0000FFFF
_0805801C:
	adds r3, #0x10
	ldrh r1, [r3]
_08058020:
	cmp r1, r2
	beq _08058028
	cmp r1, r0
	bne _0805801C
_08058028:
	ldrh r2, [r3, #4]
	movs r1, #4
	ldrsh r0, [r3, r1]
	cmp r0, #3
	beq _08058034
	b _08058196
_08058034:
	subs r0, r4, #5
	cmp r0, #0x49
	bls _0805803C
	b _08058196
_0805803C:
	lsls r0, r0, #2
	ldr r1, _08058048  @ _0805804C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08058048: .4byte _0805804C
_0805804C: @ jump table
	.4byte _08058174 @ case 0
	.4byte _08058174 @ case 1
	.4byte _0805817C @ case 2
	.4byte _08058180 @ case 3
	.4byte _08058196 @ case 4
	.4byte _08058196 @ case 5
	.4byte _08058194 @ case 6
	.4byte _08058194 @ case 7
	.4byte _08058196 @ case 8
	.4byte _08058196 @ case 9
	.4byte _08058196 @ case 10
	.4byte _08058196 @ case 11
	.4byte _08058196 @ case 12
	.4byte _08058196 @ case 13
	.4byte _08058196 @ case 14
	.4byte _08058196 @ case 15
	.4byte _08058196 @ case 16
	.4byte _08058196 @ case 17
	.4byte _08058196 @ case 18
	.4byte _08058196 @ case 19
	.4byte _08058196 @ case 20
	.4byte _08058196 @ case 21
	.4byte _08058196 @ case 22
	.4byte _08058196 @ case 23
	.4byte _08058196 @ case 24
	.4byte _08058196 @ case 25
	.4byte _0805818C @ case 26
	.4byte _0805818C @ case 27
	.4byte _08058190 @ case 28
	.4byte _08058190 @ case 29
	.4byte _08058196 @ case 30
	.4byte _08058196 @ case 31
	.4byte _08058196 @ case 32
	.4byte _08058196 @ case 33
	.4byte _08058196 @ case 34
	.4byte _08058196 @ case 35
	.4byte _08058196 @ case 36
	.4byte _08058196 @ case 37
	.4byte _08058196 @ case 38
	.4byte _08058196 @ case 39
	.4byte _08058196 @ case 40
	.4byte _08058196 @ case 41
	.4byte _08058196 @ case 42
	.4byte _08058196 @ case 43
	.4byte _08058196 @ case 44
	.4byte _08058196 @ case 45
	.4byte _08058196 @ case 46
	.4byte _08058196 @ case 47
	.4byte _08058196 @ case 48
	.4byte _08058196 @ case 49
	.4byte _08058196 @ case 50
	.4byte _08058196 @ case 51
	.4byte _08058196 @ case 52
	.4byte _08058196 @ case 53
	.4byte _08058196 @ case 54
	.4byte _08058196 @ case 55
	.4byte _08058196 @ case 56
	.4byte _08058196 @ case 57
	.4byte _08058196 @ case 58
	.4byte _08058196 @ case 59
	.4byte _08058196 @ case 60
	.4byte _08058196 @ case 61
	.4byte _08058196 @ case 62
	.4byte _08058196 @ case 63
	.4byte _08058196 @ case 64
	.4byte _08058196 @ case 65
	.4byte _08058196 @ case 66
	.4byte _08058184 @ case 67
	.4byte _08058188 @ case 68
	.4byte _08058196 @ case 69
	.4byte _08058196 @ case 70
	.4byte _08058196 @ case 71
	.4byte _08058196 @ case 72
	.4byte _08058178 @ case 73
_08058174:
	movs r2, #4
	b _08058196
_08058178:
	movs r2, #5
	b _08058196
_0805817C:
	movs r2, #6
	b _08058196
_08058180:
	movs r2, #0xd
	b _08058196
_08058184:
	movs r2, #7
	b _08058196
_08058188:
	movs r2, #8
	b _08058196
_0805818C:
	movs r2, #9
	b _08058196
_08058190:
	movs r2, #0xa
	b _08058196
_08058194:
	movs r2, #0xb
_08058196:
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END GetSpellAnimId

	THUMB_FUNC_START sub_80581A0
sub_80581A0: @ 0x080581A0
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r0, r2, #0
	lsls r1, r1, #0x10
	lsrs r5, r1, #0x10
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl GetItemIndex
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	movs r0, #0
	ldrsh r1, [r4, r0]
	movs r0, #1
	negs r0, r0
	cmp r1, r0
	bne _080581C6
	movs r0, #0
	strh r0, [r4]
_080581C6:
	ldr r0, _080581E8  @ gEkrInitialHitSide
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, r5
	beq _080581E0
	cmp r2, #0x54
	blt _080581E0
	cmp r2, #0x56
	ble _080581DC
	cmp r2, #0x58
	bne _080581E0
_080581DC:
	movs r0, #0
	strh r0, [r4]
_080581E0:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080581E8: .4byte gEkrInitialHitSide

	THUMB_FUNC_END sub_80581A0

	THUMB_FUNC_START sub_80581EC
sub_80581EC: @ 0x080581EC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x20
	ldr r7, _08058244  @ gBattleHitArray
	movs r2, #0
	ldr r4, _08058248  @ gAnimRoundData
	ldr r5, _0805824C  @ gUnknown_0203E194
	ldr r6, _08058250  @ gEkrDistanceType
	ldr r0, _08058254  @ 0x0000FFFF
	adds r3, r0, #0
	adds r1, r4, #0
_08058208:
	ldrh r0, [r1]
	orrs r0, r3
	strh r0, [r1]
	adds r1, #2
	adds r2, #1
	cmp r2, #0x13
	bls _08058208
	movs r2, #0
	ldr r0, _08058258  @ gEfxHpBarBuf
	ldr r1, _08058254  @ 0x0000FFFF
	adds r3, r1, #0
	adds r1, r0, #4
_08058220:
	ldrh r0, [r1]
	orrs r0, r3
	strh r0, [r1]
	adds r1, #2
	adds r2, #1
	cmp r2, #0x13
	bls _08058220
	movs r2, #0
	str r2, [r5, #4]
	str r2, [r5]
	movs r3, #0
	ldrsh r0, [r6, r3]
	cmp r0, #4
	bne _0805825C
	strh r0, [r4]
	strh r0, [r4, #2]
	b _08058834
	.align 2, 0
_08058244: .4byte gBattleHitArray
_08058248: .4byte gAnimRoundData
_0805824C: .4byte gUnknown_0203E194
_08058250: .4byte gEkrDistanceType
_08058254: .4byte 0x0000FFFF
_08058258: .4byte gEfxHpBarBuf
_0805825C:
	ldr r0, _08058270  @ gBattleStats
	ldrh r1, [r0]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08058274
	movs r0, #6
	strh r0, [r4]
	strh r2, [r4, #2]
	b _08058834
	.align 2, 0
_08058270: .4byte gBattleStats
_08058274:
	ldrh r6, [r6]
	str r6, [sp, #0x14]
	str r6, [sp, #0x18]
	ldr r0, _08058348  @ gpEkrBattleUnitLeft
	ldr r0, [r0]
	str r0, [sp, #4]
	ldr r0, _0805834C  @ gpEkrBattleUnitRight
	ldr r0, [r0]
	str r0, [sp, #8]
	ldr r0, [sp, #4]
	adds r0, #0x4a
	ldrh r0, [r0]
	bl GetItemIndex
	cmp r0, #0x11
	bne _0805829C
	cmp r6, #0
	bne _0805829C
	movs r5, #1
	str r5, [sp, #0x14]
_0805829C:
	ldr r4, [sp, #8]
	adds r4, #0x4a
	ldrh r0, [r4]
	bl GetItemIndex
	adds r5, r4, #0
	cmp r0, #0x11
	bne _080582B6
	ldr r0, [sp, #0x18]
	cmp r0, #0
	bne _080582B6
	movs r1, #1
	str r1, [sp, #0x18]
_080582B6:
	ldr r4, [sp, #4]
	adds r4, #0x4a
	ldrh r0, [r4]
	bl GetItemIndex
	cmp r0, #0x28
	bne _080582CE
	ldr r2, [sp, #0x14]
	cmp r2, #0
	bne _080582CE
	movs r3, #1
	str r3, [sp, #0x14]
_080582CE:
	ldrh r0, [r5]
	bl GetItemIndex
	cmp r0, #0x28
	bne _080582E2
	ldr r0, [sp, #0x18]
	cmp r0, #0
	bne _080582E2
	movs r1, #1
	str r1, [sp, #0x18]
_080582E2:
	ldrh r0, [r4]
	bl GetItemIndex
	cmp r0, #0x29
	bne _080582F6
	ldr r2, [sp, #0x14]
	cmp r2, #0
	bne _080582F6
	movs r3, #1
	str r3, [sp, #0x14]
_080582F6:
	ldrh r0, [r5]
	bl GetItemIndex
	cmp r0, #0x29
	bne _0805830A
	ldr r0, [sp, #0x18]
	cmp r0, #0
	bne _0805830A
	movs r1, #1
	str r1, [sp, #0x18]
_0805830A:
	ldrh r0, [r4]
	bl GetItemIndex
	cmp r0, #0x2c
	bne _0805831E
	ldr r2, [sp, #0x14]
	cmp r2, #0
	bne _0805831E
	movs r3, #1
	str r3, [sp, #0x14]
_0805831E:
	ldrh r0, [r5]
	bl GetItemIndex
	cmp r0, #0x2c
	bne _08058332
	ldr r5, [sp, #0x18]
	cmp r5, #0
	bne _08058332
	movs r0, #1
	str r0, [sp, #0x18]
_08058332:
	ldr r3, _08058350  @ gEfxHpBarBuf
	ldr r1, _08058354  @ gEkrPairHpInitial
	ldrh r0, [r1]
	strh r0, [r3]
	ldrh r0, [r1, #2]
	strh r0, [r3, #2]
	movs r1, #0
	str r1, [sp, #0xc]
	mov sl, r1
	mov r9, r1
	b _08058824
	.align 2, 0
_08058348: .4byte gpEkrBattleUnitLeft
_0805834C: .4byte gpEkrBattleUnitRight
_08058350: .4byte gEfxHpBarBuf
_08058354: .4byte gEkrPairHpInitial
_08058358:
	lsls r0, r2, #8
	lsrs r0, r0, #0x1b
	movs r1, #8
	ands r0, r1
	negs r0, r0
	lsrs r0, r0, #0x1f
	str r0, [sp, #0x10]
	ldr r0, _08058390  @ gUnknown_0203E108
	movs r2, #0
	ldrsh r0, [r0, r2]
	ldr r3, [sp, #0x10]
	cmp r0, r3
	bne _08058398
	mov r5, sp
	movs r0, #2
	add r0, sp
	mov r8, r0
	ldr r4, [sp, #0x14]
	ldr r1, [sp, #0x18]
	str r1, [sp, #0x1c]
	ldr r6, [sp, #4]
	movs r3, #0
	ldr r2, [sp, #0xc]
	cmp r2, #0
	bne _080583B4
	ldr r0, _08058394  @ gEkrInitialHitSide
	strh r2, [r0]
	b _080583B4
	.align 2, 0
_08058390: .4byte gUnknown_0203E108
_08058394: .4byte gEkrInitialHitSide
_08058398:
	mov r5, sp
	adds r5, #2
	mov r8, sp
	ldr r4, [sp, #0x18]
	ldr r3, [sp, #0x14]
	str r3, [sp, #0x1c]
	ldr r6, [sp, #8]
	movs r3, #0
	ldr r0, [sp, #0xc]
	cmp r0, #0
	bne _080583B4
	ldr r1, _080583F0  @ gEkrInitialHitSide
	movs r0, #1
	strh r0, [r1]
_080583B4:
	ldr r0, [r7]
	lsls r0, r0, #0xd
	lsrs r0, r0, #0xd
	movs r1, #0x80
	lsls r1, r1, #3
	ands r0, r1
	cmp r0, #0
	beq _080583D0
	ldr r2, _080583F4  @ gUnknown_0203E194
	ldr r1, _080583F8  @ gBattleStats
	ldr r0, [r1, #0x10]
	str r0, [r2]
	ldr r0, [r1, #0x14]
	str r0, [r2, #4]
_080583D0:
	ldr r0, [r7]
	lsls r0, r0, #0xd
	lsrs r1, r0, #0xd
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08058408
	adds r0, r6, #0
	bl UnitHasMagicRank
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08058400
	ldr r0, _080583FC  @ gUnknown_080DAEA0
	b _08058482
	.align 2, 0
_080583F0: .4byte gEkrInitialHitSide
_080583F4: .4byte gUnknown_0203E194
_080583F8: .4byte gBattleStats
_080583FC: .4byte gUnknown_080DAEA0
_08058400:
	ldr r0, _08058404  @ gUnknown_080DAEC8
	b _08058482
	.align 2, 0
_08058404: .4byte gUnknown_080DAEC8
_08058408:
	movs r0, #0x80
	lsls r0, r0, #4
	ands r1, r0
	cmp r1, #0
	beq _08058430
	adds r0, r6, #0
	bl UnitHasMagicRank
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08058428
	ldr r0, _08058424  @ gUnknown_080DAEA0
	b _08058482
	.align 2, 0
_08058424: .4byte gUnknown_080DAEA0
_08058428:
	ldr r0, _0805842C  @ gUnknown_080DAEC8
	b _08058482
	.align 2, 0
_0805842C: .4byte gUnknown_080DAEC8
_08058430:
	lsls r0, r3, #0x10
	cmp r0, #0
	blt _08058454
	adds r0, r6, #0
	bl UnitHasMagicRank
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0805844C
	ldr r0, _08058448  @ gUnknown_080DAE8C
	b _08058482
	.align 2, 0
_08058448: .4byte gUnknown_080DAE8C
_0805844C:
	ldr r0, _08058450  @ gUnknown_080DAEBE
	b _08058482
	.align 2, 0
_08058450: .4byte gUnknown_080DAEBE
_08058454:
	movs r0, #2
	bl sub_80716B0
	cmp r0, #1
	beq _08058478
	cmp r0, #1
	bgt _08058468
	cmp r0, #0
	beq _0805846E
	b _0805848C
_08058468:
	cmp r0, #2
	beq _08058480
	b _0805848C
_0805846E:
	ldr r0, _08058474  @ gUnknown_080DAED2
	b _08058482
	.align 2, 0
_08058474: .4byte gUnknown_080DAED2
_08058478:
	ldr r0, _0805847C  @ gUnknown_080DAEDC
	b _08058482
	.align 2, 0
_0805847C: .4byte gUnknown_080DAEDC
_08058480:
	ldr r0, _080584AC  @ gUnknown_080DAEE6
_08058482:
	lsls r1, r4, #0x10
	asrs r1, r1, #0xf
	adds r1, r1, r0
	ldrh r0, [r1]
	strh r0, [r5]
_0805848C:
	ldr r0, [r7]
	lsls r0, r0, #0xd
	lsrs r0, r0, #0xd
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	beq _080584DC
	adds r0, r6, #0
	bl UnitHasMagicRank
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080584B4
	ldr r0, _080584B0  @ gUnknown_080DAE96
	b _080584B6
	.align 2, 0
_080584AC: .4byte gUnknown_080DAEE6
_080584B0: .4byte gUnknown_080DAE96
_080584B4:
	ldr r0, _080584D4  @ gUnknown_080DAEBE
_080584B6:
	lsls r1, r4, #0x10
	asrs r1, r1, #0xf
	adds r1, r1, r0
	ldrh r0, [r1]
	strh r0, [r5]
	ldr r0, _080584D8  @ gUnknown_080DAEAA
	ldr r2, [sp, #0x1c]
	lsls r1, r2, #0x10
	asrs r1, r1, #0xf
	adds r1, r1, r0
	ldrh r0, [r1]
	mov r3, r8
	strh r0, [r3]
	b _080584EC
	.align 2, 0
_080584D4: .4byte gUnknown_080DAEBE
_080584D8: .4byte gUnknown_080DAEAA
_080584DC:
	ldr r0, _08058560  @ gUnknown_080DAEB4
	ldr r5, [sp, #0x1c]
	lsls r1, r5, #0x10
	asrs r1, r1, #0xf
	adds r1, r1, r0
	ldrh r0, [r1]
	mov r1, r8
	strh r0, [r1]
_080584EC:
	ldr r1, _08058564  @ gAnimRoundData
	ldr r2, [sp, #0xc]
	lsls r0, r2, #2
	adds r5, r0, r1
	mov r0, sp
	ldrh r0, [r0]
	movs r6, #0
	strh r0, [r5]
	lsls r0, r2, #1
	adds r0, #1
	lsls r0, r0, #1
	adds r4, r0, r1
	mov r3, sp
	ldrh r0, [r3, #2]
	strh r0, [r4]
	ldr r0, [r7]
	lsls r0, r0, #0xd
	lsrs r1, r0, #0xd
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0805851A
	b _0805881C
_0805851A:
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _080585B4
	ldr r0, _08058568  @ gUnknown_0203E108
	movs r1, #0
	ldrsh r0, [r0, r1]
	ldr r2, [sp, #0x10]
	cmp r0, r2
	bne _08058574
	mov r3, r9
	lsls r0, r3, #1
	bl GetEfxHp
	movs r1, #3
	ldrsb r1, [r7, r1]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r0, #0
	bge _08058546
	movs r2, #0
_08058546:
	mov r0, r9
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r9, r0
	lsls r0, r0, #2
	ldr r1, _0805856C  @ gEfxHpBarBuf
	adds r0, r0, r1
	strh r2, [r0]
	ldrh r0, [r5]
	ldr r2, _08058570  @ 0xFFFF8000
	adds r1, r2, #0
	b _0805875E
	.align 2, 0
_08058560: .4byte gUnknown_080DAEB4
_08058564: .4byte gAnimRoundData
_08058568: .4byte gUnknown_0203E108
_0805856C: .4byte gEfxHpBarBuf
_08058570: .4byte 0xFFFF8000
_08058574:
	mov r3, sl
	lsls r0, r3, #1
	adds r0, #1
	bl GetEfxHp
	movs r1, #3
	ldrsb r1, [r7, r1]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r0, #0
	bge _0805858E
	movs r2, #0
_0805858E:
	mov r0, sl
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sl, r0
	lsls r0, r0, #1
	adds r0, #1
	lsls r0, r0, #1
	ldr r5, _080585AC  @ gEfxHpBarBuf
	adds r0, r0, r5
	strh r2, [r0]
	ldrh r0, [r4]
	ldr r2, _080585B0  @ 0xFFFF8000
	b _08058816
	.align 2, 0
_080585AC: .4byte gEfxHpBarBuf
_080585B0: .4byte 0xFFFF8000
_080585B4:
	movs r0, #0x80
	lsls r0, r0, #1
	ands r1, r0
	cmp r1, #0
	beq _080586A0
	ldr r0, _08058628  @ gUnknown_0203E108
	movs r3, #0
	ldrsh r0, [r0, r3]
	ldr r5, [sp, #0x10]
	cmp r0, r5
	bne _08058634
	mov r1, sl
	lsls r0, r1, #1
	adds r0, #1
	bl GetEfxHp
	movs r1, #3
	ldrsb r1, [r7, r1]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r0, #0
	bge _080585E4
	movs r2, #0
_080585E4:
	mov r0, sl
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sl, r0
	ldr r4, _0805862C  @ gEfxHpBarBuf
	lsls r0, r0, #1
	adds r0, #1
	lsls r0, r0, #1
	adds r0, r0, r4
	strh r2, [r0]
	mov r2, r9
	lsls r0, r2, #1
	bl GetEfxHp
	movs r1, #3
	ldrsb r1, [r7, r1]
	adds r0, r0, r1
	lsls r0, r0, #0x10
	ldr r3, _08058630  @ gEkrPairMaxHP
	lsrs r2, r0, #0x10
	asrs r0, r0, #0x10
	movs r5, #0
	ldrsh r1, [r3, r5]
	cmp r0, r1
	ble _0805861A
	ldrh r2, [r3]
_0805861A:
	mov r0, r9
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r9, r0
	lsls r0, r0, #2
	b _08058690
	.align 2, 0
_08058628: .4byte gUnknown_0203E108
_0805862C: .4byte gEfxHpBarBuf
_08058630: .4byte gEkrPairMaxHP
_08058634:
	mov r1, r9
	lsls r0, r1, #1
	bl GetEfxHp
	movs r1, #3
	ldrsb r1, [r7, r1]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r0, #0
	bge _0805864C
	movs r2, #0
_0805864C:
	mov r0, r9
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r9, r0
	ldr r4, _08058698  @ gEfxHpBarBuf
	lsls r0, r0, #2
	adds r0, r0, r4
	strh r2, [r0]
	mov r2, sl
	lsls r0, r2, #1
	adds r0, #1
	bl GetEfxHp
	movs r1, #3
	ldrsb r1, [r7, r1]
	adds r0, r0, r1
	lsls r0, r0, #0x10
	ldr r3, _0805869C  @ gEkrPairMaxHP
	lsrs r2, r0, #0x10
	asrs r0, r0, #0x10
	movs r5, #2
	ldrsh r1, [r3, r5]
	cmp r0, r1
	ble _08058680
	ldrh r2, [r3, #2]
_08058680:
	mov r0, sl
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sl, r0
	lsls r0, r0, #1
	adds r0, #1
	lsls r0, r0, #1
_08058690:
	adds r0, r0, r4
	strh r2, [r0]
	b _0805881C
	.align 2, 0
_08058698: .4byte gEfxHpBarBuf
_0805869C: .4byte gEkrPairMaxHP
_080586A0:
	ldr r0, _08058764  @ gUnknown_0203E108
	movs r1, #0
	ldrsh r0, [r0, r1]
	ldr r2, [sp, #0x10]
	cmp r0, r2
	bne _0805876C
	mov r3, sl
	lsls r0, r3, #1
	adds r0, #1
	bl GetEfxHp
	movs r1, #3
	ldrsb r1, [r7, r1]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r0, #0
	bge _080586C6
	movs r2, #0
_080586C6:
	mov r0, sl
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sl, r0
	lsls r0, r0, #1
	adds r0, #1
	lsls r0, r0, #1
	ldr r1, _08058768  @ gEfxHpBarBuf
	adds r0, r0, r1
	strh r2, [r0]
	ldr r0, [r7]
	lsls r0, r0, #0xd
	lsrs r0, r0, #0xd
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	beq _080586F6
	ldrh r0, [r4]
	movs r2, #0x80
	lsls r2, r2, #6
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r4]
_080586F6:
	ldr r0, [r7]
	lsls r0, r0, #0xd
	lsrs r0, r0, #0xd
	movs r2, #0x80
	lsls r2, r2, #4
	ands r0, r2
	cmp r0, #0
	beq _08058712
	ldrh r0, [r5]
	movs r3, #0x80
	lsls r3, r3, #5
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r5]
_08058712:
	ldr r0, [r7]
	lsls r0, r0, #0xd
	lsrs r0, r0, #0xd
	movs r1, #0x80
	lsls r1, r1, #7
	ands r0, r1
	cmp r0, #0
	beq _0805872A
	ldrh r1, [r5]
	adds r0, r2, #0
	orrs r0, r1
	strh r0, [r5]
_0805872A:
	ldr r0, [r7]
	lsls r0, r0, #0xd
	lsrs r0, r0, #0xd
	movs r1, #0x80
	lsls r1, r1, #9
	ands r0, r1
	cmp r0, #0
	beq _08058746
	ldrh r0, [r5]
	movs r2, #0x80
	lsls r2, r2, #2
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r5]
_08058746:
	ldr r0, [r7]
	lsls r0, r0, #0xd
	lsrs r0, r0, #0xd
	movs r1, #0x80
	lsls r1, r1, #8
	ands r0, r1
	cmp r0, #0
	beq _0805881C
	ldrh r0, [r5]
	movs r3, #0x80
	lsls r3, r3, #3
	adds r1, r3, #0
_0805875E:
	orrs r0, r1
	strh r0, [r5]
	b _0805881C
	.align 2, 0
_08058764: .4byte gUnknown_0203E108
_08058768: .4byte gEfxHpBarBuf
_0805876C:
	mov r1, r9
	lsls r0, r1, #1
	bl GetEfxHp
	movs r1, #3
	ldrsb r1, [r7, r1]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r0, #0
	bge _08058784
	movs r2, #0
_08058784:
	mov r0, r9
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r9, r0
	lsls r0, r0, #2
	ldr r3, _08058844  @ gEfxHpBarBuf
	adds r0, r0, r3
	strh r2, [r0]
	ldr r0, [r7]
	lsls r0, r0, #0xd
	lsrs r0, r0, #0xd
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	beq _080587B0
	ldrh r0, [r5]
	movs r2, #0x80
	lsls r2, r2, #6
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r5]
_080587B0:
	ldr r0, [r7]
	lsls r0, r0, #0xd
	lsrs r0, r0, #0xd
	movs r2, #0x80
	lsls r2, r2, #4
	ands r0, r2
	cmp r0, #0
	beq _080587CC
	ldrh r0, [r4]
	movs r3, #0x80
	lsls r3, r3, #5
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r4]
_080587CC:
	ldr r0, [r7]
	lsls r0, r0, #0xd
	lsrs r0, r0, #0xd
	movs r1, #0x80
	lsls r1, r1, #7
	ands r0, r1
	cmp r0, #0
	beq _080587E4
	ldrh r1, [r4]
	adds r0, r2, #0
	orrs r0, r1
	strh r0, [r4]
_080587E4:
	ldr r0, [r7]
	lsls r0, r0, #0xd
	lsrs r0, r0, #0xd
	movs r1, #0x80
	lsls r1, r1, #9
	ands r0, r1
	cmp r0, #0
	beq _08058800
	ldrh r0, [r4]
	movs r5, #0x80
	lsls r5, r5, #2
	adds r1, r5, #0
	orrs r0, r1
	strh r0, [r4]
_08058800:
	ldr r0, [r7]
	lsls r0, r0, #0xd
	lsrs r0, r0, #0xd
	movs r1, #0x80
	lsls r1, r1, #8
	ands r0, r1
	cmp r0, #0
	beq _0805881C
	ldrh r0, [r4]
	movs r2, #0x80
	lsls r2, r2, #3
_08058816:
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r4]
_0805881C:
	adds r7, #4
	ldr r3, [sp, #0xc]
	adds r3, #1
	str r3, [sp, #0xc]
_08058824:
	ldr r2, [r7]
	lsls r0, r2, #8
	lsrs r0, r0, #0x1b
	movs r1, #0x10
	ands r0, r1
	cmp r0, #0
	bne _08058834
	b _08058358
_08058834:
	add sp, #0x20
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08058844: .4byte gEfxHpBarBuf

	THUMB_FUNC_END sub_80581EC

	THUMB_FUNC_START GetBattleAnimationId
GetBattleAnimationId: @ 0x08058848
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	adds r4, r1, #0
	mov r9, r3
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	mov r8, r2
	movs r0, #0
	mov sl, r0
	cmp r4, #0
	beq _0805887C
	mov r0, r8
	bl GetItemType
	cmp r0, #9
	bne _08058884
	mov r0, r8
	bl IsItemDisplayedInBattle
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _08058884
_0805887C:
	ldr r0, _08058880  @ 0x0000FFFF
	b _08058908
	.align 2, 0
_08058880: .4byte 0x0000FFFF
_08058884:
	mov r1, r8
	cmp r1, #0
	bne _0805888E
	movs r2, #9
	b _08058898
_0805888E:
	mov r0, r8
	bl GetItemType
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
_08058898:
	str r4, [sp]
	movs r0, #0
	mov r3, r9
	str r0, [r3]
	movs r7, #0
	movs r1, #0
_080588A4:
	ldr r5, [sp]
	movs r6, #0
	b _080588F0
_080588AA:
	cmp r7, #0
	bne _080588B2
	cmp r0, #0xff
	bhi _080588EC
_080588B2:
	cmp r7, #1
	bne _080588BC
	ldrh r0, [r5]
	cmp r0, #0xff
	bls _080588EC
_080588BC:
	ldrh r4, [r5]
	mov r0, r8
	str r1, [sp, #4]
	str r2, [sp, #8]
	bl GetItemIndex
	ldr r1, [sp, #4]
	ldr r2, [sp, #8]
	cmp r4, r0
	beq _080588DA
	ldrh r0, [r5]
	ldr r3, _080588E8  @ 0xFFFFFF00
	adds r0, r0, r3
	cmp r0, r2
	bne _080588EC
_080588DA:
	ldrh r5, [r5, #2]
	mov sl, r5
	mov r0, r9
	str r6, [r0]
	movs r1, #1
	b _080588F6
	.align 2, 0
_080588E8: .4byte 0xFFFFFF00
_080588EC:
	adds r5, #4
	adds r6, #1
_080588F0:
	ldrh r0, [r5]
	cmp r0, #0
	bne _080588AA
_080588F6:
	cmp r1, #1
	beq _08058900
	adds r7, #1
	cmp r7, #1
	ble _080588A4
_08058900:
	mov r0, sl
	subs r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
_08058908:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END GetBattleAnimationId

	THUMB_FUNC_START sub_8058918
sub_8058918: @ 0x08058918
	push {lr}
	ldr r0, _08058930  @ gBattleHitArray
	ldr r0, [r0]
	lsls r0, r0, #8
	lsrs r0, r0, #0x1b
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	bne _08058934
	movs r0, #0
	b _08058936
	.align 2, 0
_08058930: .4byte gBattleHitArray
_08058934:
	movs r0, #1
_08058936:
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8058918

	THUMB_FUNC_START sub_805893C
sub_805893C: @ 0x0805893C
	ldr r3, _0805895C  @ gUnknown_030018F0
	ldr r2, [r0]
	ldr r1, [r0, #4]
	ldr r0, [r2, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	lsrs r0, r0, #8
	movs r1, #1
	ands r0, r1
	adds r2, #0x23
	adds r2, r2, r0
	ldrb r0, [r2]
	strh r0, [r3]
	subs r0, #1
	bx lr
	.align 2, 0
_0805895C: .4byte gUnknown_030018F0

	THUMB_FUNC_END sub_805893C

	THUMB_FUNC_START SomethingFilterBattleAnimId
SomethingFilterBattleAnimId: @ 0x08058960
	push {lr}
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x9e
	beq _0805897A
	cmp r0, #0x9e
	blt _080589AC
	cmp r0, #0xcb
	bgt _080589AC
	cmp r0, #0xc9
	blt _080589AC
_0805897A:
	adds r0, r1, #0
	bl GetItemIndex
	cmp r0, #0x36
	beq _0805899C
	cmp r0, #0x36
	bgt _0805898E
	cmp r0, #0x35
	beq _08058994
	b _080589AC
_0805898E:
	cmp r0, #0x37
	beq _080589A4
	b _080589AC
_08058994:
	ldr r0, _08058998  @ gUnknown_085BA300
	b _080589AE
	.align 2, 0
_08058998: .4byte gUnknown_085BA300
_0805899C:
	ldr r0, _080589A0  @ gUnknown_085BA2E0
	b _080589AE
	.align 2, 0
_080589A0: .4byte gUnknown_085BA2E0
_080589A4:
	ldr r0, _080589A8  @ gUnknown_085BA320
	b _080589AE
	.align 2, 0
_080589A8: .4byte gUnknown_085BA320
_080589AC:
	movs r0, #0
_080589AE:
	pop {r1}
	bx r1

	THUMB_FUNC_END SomethingFilterBattleAnimId

	THUMB_FUNC_START GetAllegienceId
GetAllegienceId: @ 0x080589B4
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r1, r0, #0
	cmp r0, #0x40
	beq _080589D2
	cmp r0, #0x40
	ble _080589DA
	cmp r1, #0x80
	beq _080589CE
	cmp r1, #0xc0
	beq _080589D6
	b _080589DA
_080589CE:
	movs r0, #1
	b _080589DC
_080589D2:
	movs r0, #2
	b _080589DC
_080589D6:
	movs r0, #3
	b _080589DC
_080589DA:
	movs r0, #0
_080589DC:
	pop {r1}
	bx r1

	THUMB_FUNC_END GetAllegienceId

.align 2, 0
