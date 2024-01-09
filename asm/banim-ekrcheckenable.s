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
	ldr r1, _080570B8  @ gEkrInitialPosition
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
_080570B8: .4byte gEkrInitialPosition
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
	ldr r0, _08057194  @ gEkrInitialPosition
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
_08057194: .4byte gEkrInitialPosition
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
	ldr r1, _08057294  @ gEkrInitialPosition
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
_08057294: .4byte gEkrInitialPosition
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
	ldr r0, _08057390  @ gAnimCharaPalIndex
	ldr r1, _08057394  @ gAnimCharaPalIt
	adds r1, r2, r1
	ldrb r1, [r1]
	subs r1, #1
	strh r1, [r0]
	b _08057448
	.align 2, 0
_08057390: .4byte gAnimCharaPalIndex
_08057394: .4byte gAnimCharaPalIt
_08057398:
	ldr r0, _080573A8  @ gAnimCharaPalIndex
	ldr r1, _080573AC  @ gAnimCharaPalIt
	adds r1, r2, r1
	ldrb r1, [r1]
	subs r1, #1
	strh r1, [r0, #2]
	b _08057486
	.align 2, 0
_080573A8: .4byte gAnimCharaPalIndex
_080573AC: .4byte gAnimCharaPalIt
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
	ldr r1, _080575AC  @ gAnimCharaPalIndex
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
	ldr r7, _080575B4  @ gAnimCharaPalConfig
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
	ldr r1, _080575AC  @ gAnimCharaPalIndex
	ldr r0, _080575B0  @ 0x0000FFFF
	strh r0, [r1, #2]
_08057466:
	movs r1, #0
	lsls r0, r2, #3
	ldr r7, _080575B4  @ gAnimCharaPalConfig
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
	bl FilterBattleAnimCharacterPalette
	ldr r1, _080575B8  @ gBanimTriAtkPalettes
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
	bl FilterBattleAnimCharacterPalette
	ldr r1, _080575B8  @ gBanimTriAtkPalettes
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
	bl GetBanimTerrainGround
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
	bl GetBanimTerrainGround
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
	bl GetBanimTerrainGround
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
	bl GetBanimTerrainGround
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
_080575AC: .4byte gAnimCharaPalIndex
_080575B0: .4byte 0x0000FFFF
_080575B4: .4byte gAnimCharaPalConfig
_080575B8: .4byte gBanimTriAtkPalettes
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
	ldr r1, _08057660  @ gEkrGaugeHp
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
	ldr r1, _08057660  @ gEkrGaugeHp
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
	bl ParseBattleHitToBanimCmd
	ldr r0, _08057668  @ gEkrDistanceType
	movs r7, #0
	ldrsh r0, [r0, r7]
	cmp r0, #4
	bne _08057670
	ldr r1, _0805766C  @ gEkrSpellAnimIndex
	movs r0, #1
	strh r0, [r1, #2]
	strh r0, [r1]
	b _080576CC
	.align 2, 0
_08057658: .4byte gEkrSnowWeather
_0805765C: .4byte gEkrPairBaseCon
_08057660: .4byte gEkrGaugeHp
_08057664: .4byte gEkrPairMaxHP
_08057668: .4byte gEkrDistanceType
_0805766C: .4byte gEkrSpellAnimIndex
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
	ldr r1, _08057714  @ gEkrSpellAnimIndex
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
	ldr r1, _08057714  @ gEkrSpellAnimIndex
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
	ldr r1, _08057714  @ gEkrSpellAnimIndex
	movs r0, #0xf
	strh r0, [r1, #2]
_080576CC:
	ldr r4, [sp, #0x24]
	cmp r4, #0
	beq _080576E0
	ldr r0, _08057714  @ gEkrSpellAnimIndex
	ldr r1, [sp, #8]
	adds r1, #0x4a
	ldrh r2, [r1]
	movs r1, #0
	bl UnsetMapStaffAnim
_080576E0:
	ldr r5, [sp, #0x28]
	cmp r5, #0
	beq _080576F4
	ldr r0, _0805771C  @ gUnknown_0203E11A
	ldr r1, [sp, #0xc]
	adds r1, #0x4a
	ldrh r2, [r1]
	movs r1, #1
	bl UnsetMapStaffAnim
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
_08057714: .4byte gEkrSpellAnimIndex
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
	ldr r1, _080579E0  @ gPalIndexEfxHpBarUnk
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
	ldr r1, _080579E0  @ gPalIndexEfxHpBarUnk
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
_080579E0: .4byte gPalIndexEfxHpBarUnk
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
	ldr r5, _08057A40  @ gBanimBackgroundIndex
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
_08057A40: .4byte gBanimBackgroundIndex
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
	bl GetBanimBackgroundIndex
	strh r0, [r5]
_08057A66:
	bl CheckBanimHensei
	cmp r0, #1
	bne _08057A74
	ldr r1, _08057C80  @ gBanimBackgroundIndex
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
	bl CheckBattleScriptted
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _08057AB6
	movs r4, #1
_08057AB6:
	bl SetBattleUnscriptted
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
	ldr r0, _08057C90  @ gEkrSpellAnimIndex
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
	ldr r0, _08057C90  @ gEkrSpellAnimIndex
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
_08057C80: .4byte gBanimBackgroundIndex
_08057C84: .4byte gEkrDistanceType
_08057C88: .4byte gEkrPairSideVaild
_08057C8C: .4byte gEkrPairBanimID2
_08057C90: .4byte gEkrSpellAnimIndex
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

.align 2, 0
