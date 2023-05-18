	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	THUMB_FUNC_START StartSpellAnimIvaldi
StartSpellAnimIvaldi: @ 0x080657D4
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SetSomethingSpellFxToTrue
	bl NewEfxSpellCast
	bl ClearBG1Setup
	ldr r0, _0806580C  @ ProcScr_efxIvaldi
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r5, #0
	bl GetSomeAISRelatedIndexMaybe
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl EkrCheckHitOrMiss
	adds r4, #0x29
	strb r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806580C: .4byte ProcScr_efxIvaldi

	THUMB_FUNC_END StartSpellAnimIvaldi

	THUMB_FUNC_START Loop6C_efxIvaldi
Loop6C_efxIvaldi: @ 0x08065810
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r6, r0, #0
	ldr r0, [r6, #0x5c]
	bl GetCoreAIStruct
	adds r5, r0, #0
	bl GetAnimationStartFrameMaybe
	adds r4, r0, #0
	movs r7, #0x3e
	ldrh r0, [r6, #0x2c]
	adds r0, #1
	strh r0, [r6, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _0806583E
	ldr r0, [r6, #0x5c]
	movs r1, #1
	negs r1, r1
	bl NewEfxFarAttackWithDistance
_0806583E:
	movs r0, #0x2c
	ldrsh r1, [r6, r0]
	adds r0, r4, #1
	cmp r1, r0
	bne _0806584E
	bl PrepareSomeIvaldiParticleGraphics
	b _080659A4
_0806584E:
	adds r0, r4, #0
	adds r0, #0xb
	cmp r1, r0
	bne _08065860
	adds r0, r5, #0
	movs r1, #0x1a
	bl StartSpellOBJ_IvaldiSideWash
	b _080659A4
_08065860:
	adds r3, r4, #0
	adds r3, #0x14
	cmp r1, r3
	bne _08065888
	ldr r0, _08065884  @ 0x000003D3
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r2, [r6, #0x5c]
	movs r3, #2
	ldrsh r2, [r2, r3]
	movs r3, #1
	bl EkrSoundSomeBark
	adds r0, r5, #0
	bl StartSpellBG_IvaldiBG1
	b _080659A4
	.align 2, 0
_08065884: .4byte 0x000003D3
_08065888:
	adds r0, r4, #0
	adds r0, #0x49
	cmp r1, r0
	bne _080658AC
	movs r0, #0xf5
	lsls r0, r0, #2
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r2, [r6, #0x5c]
	movs r3, #2
	ldrsh r2, [r2, r3]
	movs r3, #1
	bl EkrSoundSomeBark
	adds r0, r5, #0
	bl StartSpellBG_IvaldiBG2
	b _080659A4
_080658AC:
	adds r0, r4, #0
	adds r0, #0x76
	cmp r1, r0
	bne _080658BC
	adds r0, r5, #0
	bl StartSpellBG_IvaldiBG3
	b _080659A4
_080658BC:
	adds r0, r4, #0
	adds r0, #0x7c
	cmp r1, r0
	bne _080658CE
	adds r0, r5, #0
	movs r1, #0x46
	bl StartSpellOBJ_IvaldiFall
	b _080659A4
_080658CE:
	adds r0, r4, #0
	adds r0, #0xc6
	cmp r1, r0
	bne _08065902
	movs r0, #0
	str r0, [sp]
	movs r0, #1
	movs r1, #1
	movs r2, #0
	movs r3, #0
	bl SetBlendTargetA
	movs r0, #1
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #1
	movs r3, #1
	bl SetBlendTargetB
	adds r0, r5, #0
	movs r1, #0x3c
	movs r2, #0x1e
	bl sub_8066470
	b _080659A4
_08065902:
	adds r0, r7, #0
	adds r0, #0xc4
	adds r0, r4, r0
	cmp r1, r0
	bne _0806592A
	adds r0, r5, #0
	movs r1, #0x78
	movs r2, #0xa
	bl StartSpellThing_MagicQuake
	movs r0, #1
	movs r1, #0
	movs r2, #0x10
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	adds r0, r5, #0
	bl StartSpellBG_IvaldiBG4
	b _080659A4
_0806592A:
	ldr r2, _0806595C  @ 0x00000107
	adds r0, r4, r2
	cmp r1, r0
	bne _08065960
	adds r0, r5, #0
	movs r1, #0x5c
	bl sub_8066060
	ldrh r0, [r5, #0x10]
	movs r1, #9
	orrs r0, r1
	strh r0, [r5, #0x10]
	adds r4, r6, #0
	adds r4, #0x29
	ldrb r1, [r4]
	adds r0, r5, #0
	bl ThisMakesTheHPInSpellAnimGoAway
	ldrb r0, [r4]
	cmp r0, #0
	bne _080659A4
	adds r0, r5, #0
	bl sub_8072450
	b _080659A4
	.align 2, 0
_0806595C: .4byte 0x00000107
_08065960:
	movs r0, #0xc4
	adds r2, r7, r0
	adds r0, r2, r3
	cmp r1, r0
	beq _08065982
	movs r3, #0x2c
	ldrsh r1, [r6, r3]
	adds r0, r4, #0
	adds r0, #0x52
	adds r0, r2, r0
	cmp r1, r0
	beq _08065982
	adds r0, r4, #0
	adds r0, #0x5e
	adds r0, r2, r0
	cmp r1, r0
	bne _0806598C
_08065982:
	adds r0, r5, #0
	movs r1, #2
	bl StartSpellBG_FLASH
	b _080659A4
_0806598C:
	adds r0, r4, #0
	adds r0, #0x64
	adds r0, r2, r0
	cmp r1, r0
	bne _080659A4
	bl SetSomethingSpellFxToFalse
	bl EfxSpellCastSet29
	adds r0, r6, #0
	bl Proc_Break
_080659A4:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END Loop6C_efxIvaldi

	THUMB_FUNC_START StartSpellBG_IvaldiBG1
StartSpellBG_IvaldiBG1: @ 0x080659AC
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _080659F8  @ gUnknown_0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _080659FC  @ gUnknown_085D76A0
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r1, [r0, #0x44]
	ldr r1, _08065A00  @ gUnknown_080DE4E6
	str r1, [r0, #0x48]
	ldr r1, _08065A04  @ gUnknown_085D76B8
	str r1, [r0, #0x4c]
	str r1, [r0, #0x50]
	ldr r0, _08065A08  @ gUnknown_086937C0
	movs r1, #0x80
	lsls r1, r1, #6
	bl SomeImageStoringRoutine_SpellAnim2
	ldr r0, _08065A0C  @ gUnknown_086945C4
	movs r1, #0x20
	bl SomePaletteStoringRoutine_SpellAnim2
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	bl sub_80551B0
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080659F8: .4byte gUnknown_0201774C
_080659FC: .4byte gUnknown_085D76A0
_08065A00: .4byte gUnknown_080DE4E6
_08065A04: .4byte gUnknown_085D76B8
_08065A08: .4byte gUnknown_086937C0
_08065A0C: .4byte gUnknown_086945C4

	THUMB_FUNC_END StartSpellBG_IvaldiBG1

	THUMB_FUNC_START Loop6C_efxIvaldiBG1
Loop6C_efxIvaldiBG1: @ 0x08065A10
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x5c]
	bl GetCoreAIStruct
	adds r0, r5, #0
	adds r0, #0x2c
	adds r1, r5, #0
	adds r1, #0x44
	ldr r2, [r5, #0x48]
	bl sub_80558F4
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	lsls r4, r4, #0x10
	asrs r2, r4, #0x10
	cmp r2, #0
	blt _08065A56
	ldr r1, [r5, #0x4c]
	ldr r3, [r5, #0x50]
	ldr r0, [r5, #0x5c]
	lsls r2, r2, #2
	adds r1, r2, r1
	ldr r1, [r1]
	adds r2, r2, r3
	ldr r2, [r2]
	bl sub_8055670
	b _08065A74
_08065A56:
	movs r0, #1
	negs r0, r0
	cmp r2, r0
	bne _08065A74
	bl ClearBG1
	ldr r1, _08065A7C  @ gUnknown_0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SetDefaultColorEffects_
	adds r0, r5, #0
	bl Proc_Break
_08065A74:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08065A7C: .4byte gUnknown_0201774C

	THUMB_FUNC_END Loop6C_efxIvaldiBG1

	THUMB_FUNC_START StartSpellBG_IvaldiBG2
StartSpellBG_IvaldiBG2: @ 0x08065A80
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r1, _08065AD4  @ gUnknown_0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08065AD8  @ gUnknown_085D76E8
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	adds r0, r5, #0
	bl GetCoreAIStruct
	str r0, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	str r0, [r4, #0x44]
	ldr r0, _08065ADC  @ gUnknown_080DE526
	str r0, [r4, #0x48]
	ldr r0, _08065AE0  @ gUnknown_085D7700
	str r0, [r4, #0x4c]
	str r0, [r4, #0x50]
	ldr r0, _08065AE4  @ gUnknown_08695B10
	movs r1, #0x80
	lsls r1, r1, #6
	bl SomeImageStoringRoutine_SpellAnim2
	ldr r0, _08065AE8  @ gUnknown_08696840
	movs r1, #0x20
	bl SomePaletteStoringRoutine_SpellAnim2
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	bl sub_80551B0
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08065AD4: .4byte gUnknown_0201774C
_08065AD8: .4byte gUnknown_085D76E8
_08065ADC: .4byte gUnknown_080DE526
_08065AE0: .4byte gUnknown_085D7700
_08065AE4: .4byte gUnknown_08695B10
_08065AE8: .4byte gUnknown_08696840

	THUMB_FUNC_END StartSpellBG_IvaldiBG2

	THUMB_FUNC_START Loop6C_efxIvaldiBG2
Loop6C_efxIvaldiBG2: @ 0x08065AEC
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r0, #0x2c
	adds r1, r5, #0
	adds r1, #0x44
	ldr r2, [r5, #0x48]
	bl sub_80558F4
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	lsls r4, r4, #0x10
	asrs r2, r4, #0x10
	cmp r2, #0
	blt _08065B2A
	ldr r1, [r5, #0x4c]
	ldr r3, [r5, #0x50]
	ldr r0, [r5, #0x5c]
	lsls r2, r2, #2
	adds r1, r2, r1
	ldr r1, [r1]
	adds r2, r2, r3
	ldr r2, [r2]
	bl sub_8055670
	b _08065B48
_08065B2A:
	movs r0, #1
	negs r0, r0
	cmp r2, r0
	bne _08065B48
	bl ClearBG1
	ldr r1, _08065B50  @ gUnknown_0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SetDefaultColorEffects_
	adds r0, r5, #0
	bl Proc_Break
_08065B48:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08065B50: .4byte gUnknown_0201774C

	THUMB_FUNC_END Loop6C_efxIvaldiBG2

	THUMB_FUNC_START StartSpellBG_IvaldiBG3
StartSpellBG_IvaldiBG3: @ 0x08065B54
	push {r4, lr}
	adds r4, r0, #0
	bl ClearBG1
	bl SetDefaultColorEffects_
	ldr r1, _08065BA0  @ gUnknown_0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08065BA4  @ ProcScr_efxDanceparaBG3
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r1, [r0, #0x44]
	ldr r1, _08065BA8  @ gUnknown_080DE552
	str r1, [r0, #0x48]
	ldr r1, _08065BAC  @ gUnknown_085D772C
	str r1, [r0, #0x4c]
	str r1, [r0, #0x50]
	ldr r1, _08065BB0  @ gUnknown_085D7758
	str r1, [r0, #0x54]
	ldr r1, _08065BB4  @ gUnknown_085D7784
	str r1, [r0, #0x58]
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	bl sub_80551B0
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08065BA0: .4byte gUnknown_0201774C
_08065BA4: .4byte ProcScr_efxDanceparaBG3
_08065BA8: .4byte gUnknown_080DE552
_08065BAC: .4byte gUnknown_085D772C
_08065BB0: .4byte gUnknown_085D7758
_08065BB4: .4byte gUnknown_085D7784

	THUMB_FUNC_END StartSpellBG_IvaldiBG3

	THUMB_FUNC_START Loop6C_efxIvaldiBG3
Loop6C_efxIvaldiBG3: @ 0x08065BB8
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r0, #0x2c
	adds r1, r7, #0
	adds r1, #0x44
	ldr r2, [r7, #0x48]
	bl sub_80558F4
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	cmp r4, #0
	blt _08065C10
	ldr r1, [r7, #0x4c]
	ldr r2, [r7, #0x50]
	ldr r5, [r7, #0x54]
	ldr r6, [r7, #0x58]
	ldr r0, [r7, #0x5c]
	lsls r4, r4, #2
	adds r1, r4, r1
	ldr r1, [r1]
	adds r2, r4, r2
	ldr r2, [r2]
	bl sub_8055670
	adds r5, r4, r5
	ldr r0, [r5]
	movs r1, #0x80
	lsls r1, r1, #6
	bl SomeImageStoringRoutine_SpellAnim2
	adds r4, r4, r6
	ldr r0, [r4]
	movs r1, #0x20
	bl SomePaletteStoringRoutine_SpellAnim2
	b _08065C2E
_08065C10:
	movs r0, #1
	negs r0, r0
	cmp r4, r0
	bne _08065C2E
	bl ClearBG1
	ldr r1, _08065C34  @ gUnknown_0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SetDefaultColorEffects_
	adds r0, r7, #0
	bl Proc_Break
_08065C2E:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08065C34: .4byte gUnknown_0201774C

	THUMB_FUNC_END Loop6C_efxIvaldiBG3

	THUMB_FUNC_START StartSpellBG_IvaldiBG4
StartSpellBG_IvaldiBG4: @ 0x08065C38
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _08065C88  @ gUnknown_0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08065C8C  @ ProcScr_efxDanceparaBG4
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r1, [r0, #0x34]
	strh r1, [r0, #0x3c]
	str r1, [r0, #0x44]
	ldr r1, _08065C90  @ gUnknown_080DE58E
	str r1, [r0, #0x48]
	ldr r1, _08065C94  @ gUnknown_085D77C8
	str r1, [r0, #0x4c]
	str r1, [r0, #0x50]
	ldr r0, _08065C98  @ gUnknown_086A06A8
	movs r1, #0x80
	lsls r1, r1, #6
	bl SomeImageStoringRoutine_SpellAnim2
	ldr r0, _08065C9C  @ gUnknown_086A1CE0
	movs r1, #0x20
	bl SomePaletteStoringRoutine_SpellAnim2
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	bl sub_80551B0
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08065C88: .4byte gUnknown_0201774C
_08065C8C: .4byte ProcScr_efxDanceparaBG4
_08065C90: .4byte gUnknown_080DE58E
_08065C94: .4byte gUnknown_085D77C8
_08065C98: .4byte gUnknown_086A06A8
_08065C9C: .4byte gUnknown_086A1CE0

	THUMB_FUNC_END StartSpellBG_IvaldiBG4

	THUMB_FUNC_START sub_8065CA0
sub_8065CA0: @ 0x08065CA0
	push {r4, r5, lr}
	sub sp, #8
	adds r5, r0, #0
	ldrh r0, [r5, #0x3c]
	adds r0, #0x18
	movs r1, #0xff
	ands r0, r1
	strh r0, [r5, #0x3c]
	adds r0, r5, #0
	adds r0, #0x2c
	adds r1, r5, #0
	adds r1, #0x44
	ldr r2, [r5, #0x48]
	bl sub_80558F4
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	ldrh r1, [r5, #0x34]
	ldrh r2, [r5, #0x3c]
	movs r0, #1
	bl BG_SetPosition
	movs r0, #2
	bl BG_EnableSyncByMask
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	cmp r4, #0
	blt _08065D58
	ldr r2, [r5, #0x4c]
	ldr r1, [r5, #0x50]
	ldr r0, _08065CF8  @ gEkrDistanceType
	movs r3, #0
	ldrsh r0, [r0, r3]
	cmp r0, #0
	bne _08065D00
	lsls r0, r4, #2
	adds r0, r0, r2
	ldr r0, [r0]
	ldr r1, _08065CFC  @ gEkrTsaBuffer
	bl LZ77UnCompWram
	b _08065D0C
	.align 2, 0
_08065CF8: .4byte gEkrDistanceType
_08065CFC: .4byte gEkrTsaBuffer
_08065D00:
	lsls r0, r4, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r1, _08065D30  @ gEkrTsaBuffer
	bl LZ77UnCompWram
_08065D0C:
	ldr r4, _08065D30  @ gEkrTsaBuffer
	ldr r0, [r5, #0x5c]
	bl GetAISSubjectId
	cmp r0, #0
	bne _08065D38
	ldr r1, _08065D34  @ gBG1TilemapBuffer
	movs r0, #1
	str r0, [sp]
	adds r0, #0xff
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r2, #0x1e
	movs r3, #0x20
	bl sub_8070EC4
	b _08065D4C
	.align 2, 0
_08065D30: .4byte gEkrTsaBuffer
_08065D34: .4byte gBG1TilemapBuffer
_08065D38:
	ldr r1, _08065D54  @ gBG1TilemapBuffer
	movs r0, #1
	str r0, [sp]
	adds r0, #0xff
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r2, #0x1e
	movs r3, #0x20
	bl sub_8070E94
_08065D4C:
	movs r0, #2
	bl BG_EnableSyncByMask
	b _08065D76
	.align 2, 0
_08065D54: .4byte gBG1TilemapBuffer
_08065D58:
	movs r0, #1
	negs r0, r0
	cmp r4, r0
	bne _08065D76
	bl ClearBG1
	ldr r1, _08065D80  @ gUnknown_0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SetDefaultColorEffects_
	adds r0, r5, #0
	bl Proc_Break
_08065D76:
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08065D80: .4byte gUnknown_0201774C

	THUMB_FUNC_END sub_8065CA0

	THUMB_FUNC_START PrepareSomeIvaldiParticleGraphics
PrepareSomeIvaldiParticleGraphics: @ 0x08065D84
	push {lr}
	ldr r0, _08065D9C  @ gUnknown_08692B10
	movs r1, #0x20
	bl SomePaletteStoringRoutine_SpellAnim
	ldr r0, _08065DA0  @ gUnknown_086926E0
	movs r1, #0x80
	lsls r1, r1, #5
	bl SomeImageStoringRoutine_SpellAnim
	pop {r0}
	bx r0
	.align 2, 0
_08065D9C: .4byte gUnknown_08692B10
_08065DA0: .4byte gUnknown_086926E0

	THUMB_FUNC_END PrepareSomeIvaldiParticleGraphics

	THUMB_FUNC_START StartSpellOBJ_IvaldiFall
StartSpellOBJ_IvaldiFall: @ 0x08065DA4
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	bl GetAISSubjectId
	ldr r0, _08065DE8  @ gUnknown_08692B10
	movs r1, #0x20
	bl SomePaletteStoringRoutine_SpellAnim
	ldr r0, _08065DEC  @ gUnknown_086926E0
	movs r1, #0x80
	lsls r1, r1, #5
	bl SomeImageStoringRoutine_SpellAnim
	ldr r1, _08065DF0  @ gUnknown_0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08065DF4  @ ProcScr_efxDanceparaOBJFall
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	adds r0, r5, #0
	bl GetCoreAIStruct
	str r0, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	strh r6, [r4, #0x2e]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08065DE8: .4byte gUnknown_08692B10
_08065DEC: .4byte gUnknown_086926E0
_08065DF0: .4byte gUnknown_0201774C
_08065DF4: .4byte ProcScr_efxDanceparaOBJFall

	THUMB_FUNC_END StartSpellOBJ_IvaldiFall

	THUMB_FUNC_START sub_8065DF8
sub_8065DF8: @ 0x08065DF8
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #7
	bne _08065E18
	ldr r0, [r4, #0x5c]
	movs r1, #3
	str r1, [sp]
	movs r1, #0x40
	movs r2, #0x98
	b _08065E26
_08065E18:
	cmp r0, #0xd
	bne _08065E2E
	ldr r0, [r4, #0x5c]
	movs r1, #3
	str r1, [sp]
	movs r1, #0x40
	movs r2, #0x30
_08065E26:
	movs r3, #0x54
	bl sub_8066258
	b _08065EEA
_08065E2E:
	cmp r0, #0x13
	bne _08065E44
	ldr r0, [r4, #0x5c]
	movs r1, #3
	str r1, [sp]
	movs r1, #0x40
	movs r2, #0xbc
	movs r3, #0x6a
	bl sub_8066258
	b _08065EEA
_08065E44:
	cmp r0, #0x19
	bne _08065E54
	ldr r0, [r4, #0x5c]
	movs r1, #2
	str r1, [sp]
	movs r1, #0x40
	movs r2, #0x68
	b _08065EA4
_08065E54:
	cmp r0, #0x1f
	bne _08065E6A
	ldr r0, [r4, #0x5c]
	movs r1, #2
	str r1, [sp]
	movs r1, #0x40
	movs r2, #0x24
	movs r3, #0x66
	bl sub_8066258
	b _08065EEA
_08065E6A:
	cmp r0, #0x25
	bne _08065E80
	ldr r0, [r4, #0x5c]
	movs r1, #3
	str r1, [sp]
	movs r1, #0x40
	movs r2, #0xb0
	movs r3, #0x61
	bl sub_8066258
	b _08065EEA
_08065E80:
	cmp r0, #0x2b
	bne _08065E96
	ldr r0, [r4, #0x5c]
	movs r1, #3
	str r1, [sp]
	movs r1, #0x40
	movs r2, #0x38
	movs r3, #0x64
	bl sub_8066258
	b _08065EEA
_08065E96:
	cmp r0, #0x31
	bne _08065EAC
	ldr r0, [r4, #0x5c]
	movs r1, #2
	str r1, [sp]
	movs r1, #0x40
	movs r2, #0x9e
_08065EA4:
	movs r3, #0x67
	bl sub_8066258
	b _08065EEA
_08065EAC:
	cmp r0, #0x37
	bne _08065EBC
	ldr r0, [r4, #0x5c]
	movs r1, #3
	str r1, [sp]
	movs r1, #0x40
	movs r2, #0x42
	b _08065ECA
_08065EBC:
	cmp r0, #0x3d
	bne _08065ED2
	ldr r0, [r4, #0x5c]
	movs r1, #3
	str r1, [sp]
	movs r1, #0x40
	movs r2, #0xe6
_08065ECA:
	movs r3, #0x5c
	bl sub_8066258
	b _08065EEA
_08065ED2:
	movs r1, #0x2c
	ldrsh r0, [r4, r1]
	cmp r0, #0x43
	bne _08065EEA
	ldr r0, [r4, #0x5c]
	movs r1, #3
	str r1, [sp]
	movs r1, #0x40
	movs r2, #0x68
	movs r3, #0x6c
	bl sub_8066258
_08065EEA:
	movs r2, #0x2c
	ldrsh r1, [r4, r2]
	movs r2, #0x2e
	ldrsh r0, [r4, r2]
	cmp r1, r0
	bne _08065F04
	ldr r1, _08065F0C  @ gUnknown_0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
_08065F04:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08065F0C: .4byte gUnknown_0201774C

	THUMB_FUNC_END sub_8065DF8

	THUMB_FUNC_START StartSpellOBJ_IvaldiSideWash
StartSpellOBJ_IvaldiSideWash: @ 0x08065F10
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	bl GetAISSubjectId
	ldr r0, _08065F54  @ gUnknown_08692B10
	movs r1, #0x20
	bl SomePaletteStoringRoutine_SpellAnim
	ldr r0, _08065F58  @ gUnknown_086926E0
	movs r1, #0x80
	lsls r1, r1, #5
	bl SomeImageStoringRoutine_SpellAnim
	ldr r1, _08065F5C  @ gUnknown_0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08065F60  @ efxIvaldiOBJSideWash
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	adds r0, r5, #0
	bl GetCoreAIStruct
	str r0, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	strh r6, [r4, #0x2e]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08065F54: .4byte gUnknown_08692B10
_08065F58: .4byte gUnknown_086926E0
_08065F5C: .4byte gUnknown_0201774C
_08065F60: .4byte efxIvaldiOBJSideWash

	THUMB_FUNC_END StartSpellOBJ_IvaldiSideWash

	THUMB_FUNC_START Loop6C_efxIvaldiOBJSideWash
Loop6C_efxIvaldiOBJSideWash: @ 0x08065F64
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetAISSubjectId
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	movs r2, #0
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	cmp r1, #0
	bne _08065F90
	ldr r0, [r4, #0x5c]
	str r1, [sp]
	movs r1, #0x1a
	movs r2, #0x68
	movs r3, #0xc
	bl sub_8066258
	b _08066052
_08065F90:
	cmp r1, #3
	bne _08065FA6
	ldr r0, [r4, #0x5c]
	movs r1, #1
	str r1, [sp]
	movs r1, #0x1a
	movs r2, #0x68
	movs r3, #0x5f
	bl sub_8066258
	b _08066052
_08065FA6:
	cmp r1, #6
	bne _08065FBC
	ldr r0, [r4, #0x5c]
	movs r1, #1
	str r1, [sp]
	movs r1, #0x1a
	movs r2, #0x78
	movs r3, #0x24
	bl sub_8066258
	b _08066052
_08065FBC:
	cmp r1, #9
	bne _08065FD2
	ldr r0, [r4, #0x5c]
	movs r1, #1
	str r1, [sp]
	movs r1, #0x1a
	movs r2, #0x64
	movs r3, #0xa
	bl sub_8066258
	b _08066052
_08065FD2:
	cmp r1, #0xc
	bne _08065FE6
	ldr r0, [r4, #0x5c]
	str r2, [sp]
	movs r1, #0x1a
	movs r2, #0x5e
	movs r3, #0x36
	bl sub_8066258
	b _08066052
_08065FE6:
	cmp r1, #0xf
	bne _08065FFC
	ldr r0, [r4, #0x5c]
	movs r1, #1
	str r1, [sp]
	movs r1, #0x1a
	movs r2, #0x64
	movs r3, #0x30
	bl sub_8066258
	b _08066052
_08065FFC:
	cmp r1, #0x12
	bne _08066010
	ldr r0, [r4, #0x5c]
	str r2, [sp]
	movs r1, #0x1a
	movs r2, #0x68
	movs r3, #0x66
	bl sub_8066258
	b _08066052
_08066010:
	cmp r1, #0x15
	bne _08066026
	ldr r0, [r4, #0x5c]
	movs r1, #1
	str r1, [sp]
	movs r1, #0x1a
	movs r2, #0x60
	movs r3, #0x10
	bl sub_8066258
	b _08066052
_08066026:
	cmp r1, #0x18
	bne _0806603C
	ldr r0, [r4, #0x5c]
	movs r1, #1
	str r1, [sp]
	movs r1, #0x1a
	movs r2, #0x80
	movs r3, #0x50
	bl sub_8066258
	b _08066052
_0806603C:
	movs r2, #0x2e
	ldrsh r0, [r4, r2]
	cmp r1, r0
	bne _08066052
	ldr r1, _0806605C  @ gUnknown_0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
_08066052:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806605C: .4byte gUnknown_0201774C

	THUMB_FUNC_END Loop6C_efxIvaldiOBJSideWash

	THUMB_FUNC_START sub_8066060
sub_8066060: @ 0x08066060
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	bl GetAISSubjectId
	ldr r0, _080660A4  @ gUnknown_08692B10
	movs r1, #0x20
	bl SomePaletteStoringRoutine_SpellAnim
	ldr r0, _080660A8  @ gUnknown_086926E0
	movs r1, #0x80
	lsls r1, r1, #5
	bl SomeImageStoringRoutine_SpellAnim
	ldr r1, _080660AC  @ gUnknown_0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _080660B0  @ ProcScr_efxDanceparaOBJUprise
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	adds r0, r5, #0
	bl GetCoreAIStruct
	str r0, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	strh r6, [r4, #0x2e]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080660A4: .4byte gUnknown_08692B10
_080660A8: .4byte gUnknown_086926E0
_080660AC: .4byte gUnknown_0201774C
_080660B0: .4byte ProcScr_efxDanceparaOBJUprise

	THUMB_FUNC_END sub_8066060

	THUMB_FUNC_START sub_80660B4
sub_80660B4: @ 0x080660B4
	push {lr}
	sub sp, #4
	adds r2, r0, #0
	ldrh r0, [r2, #0x2c]
	adds r0, #1
	movs r1, #0
	strh r0, [r2, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #5
	bne _080660D6
	ldr r0, [r2, #0x5c]
	movs r1, #1
	str r1, [sp]
	movs r1, #0x40
	movs r2, #0xc8
	b _08066218
_080660D6:
	cmp r0, #0xa
	bne _080660EC
	ldr r0, [r2, #0x5c]
	movs r1, #1
	str r1, [sp]
	movs r1, #0x40
	movs r2, #0x43
	movs r3, #0x5b
	bl sub_8066390
	b _0806624C
_080660EC:
	cmp r0, #0xf
	bne _08066102
	ldr r0, [r2, #0x5c]
	movs r1, #1
	str r1, [sp]
	movs r1, #0x40
	movs r2, #0xd
	movs r3, #0x59
	bl sub_8066390
	b _0806624C
_08066102:
	cmp r0, #0x14
	bne _08066118
	ldr r0, [r2, #0x5c]
	movs r1, #1
	str r1, [sp]
	movs r1, #0x40
	movs r2, #0xcb
	movs r3, #0x4c
	bl sub_8066390
	b _0806624C
_08066118:
	cmp r0, #0x19
	bne _0806612E
	ldr r0, [r2, #0x5c]
	movs r1, #1
	str r1, [sp]
	movs r1, #0x40
	movs r2, #0xdf
	movs r3, #2
	bl sub_8066390
	b _0806624C
_0806612E:
	cmp r0, #0x1e
	bne _08066144
	ldr r0, [r2, #0x5c]
	movs r1, #1
	str r1, [sp]
	movs r1, #0x40
	movs r2, #0xe
	movs r3, #0x6f
	bl sub_8066390
	b _0806624C
_08066144:
	cmp r0, #0x23
	bne _0806615A
	ldr r0, [r2, #0x5c]
	movs r1, #1
	str r1, [sp]
	movs r1, #0x40
	movs r2, #0xe0
	movs r3, #0x6c
	bl sub_8066390
	b _0806624C
_0806615A:
	cmp r0, #0x28
	bne _0806616C
	ldr r0, [r2, #0x5c]
	movs r2, #0xb8
	lsls r2, r2, #1
	movs r1, #1
	str r1, [sp]
	movs r1, #0x40
	b _08066218
_0806616C:
	cmp r0, #0x2d
	bne _08066180
	ldr r0, [r2, #0x5c]
	str r1, [sp]
	movs r1, #0x40
	movs r2, #0x3a
	movs r3, #0x2d
	bl sub_8066390
	b _0806624C
_08066180:
	cmp r0, #0x32
	bne _0806618E
	ldr r0, [r2, #0x5c]
	str r1, [sp]
	movs r1, #0x40
	movs r2, #0x7f
	b _080661E2
_0806618E:
	movs r0, #0x2c
	ldrsh r1, [r2, r0]
	cmp r1, #0x37
	bne _080661A8
	ldr r0, [r2, #0x5c]
	movs r1, #0
	str r1, [sp]
	movs r1, #0x40
	movs r2, #0xa3
	movs r3, #0x14
	bl sub_8066390
	b _0806624C
_080661A8:
	cmp r1, #0x3c
	bne _080661BE
	ldr r0, [r2, #0x5c]
	movs r1, #0
	str r1, [sp]
	movs r1, #0x40
	movs r2, #0xa7
	movs r3, #0x3e
	bl sub_8066390
	b _0806624C
_080661BE:
	cmp r1, #0x41
	bne _080661D4
	ldr r0, [r2, #0x5c]
	movs r1, #0
	str r1, [sp]
	movs r1, #0x40
	movs r2, #0x38
	movs r3, #0x60
	bl sub_8066390
	b _0806624C
_080661D4:
	cmp r1, #0x46
	bne _080661EA
	ldr r0, [r2, #0x5c]
	movs r1, #0
	str r1, [sp]
	movs r1, #0x40
	movs r2, #0x80
_080661E2:
	movs r3, #0x42
	bl sub_8066390
	b _0806624C
_080661EA:
	cmp r1, #0x4b
	bne _080661FA
	ldr r0, [r2, #0x5c]
	movs r1, #0
	str r1, [sp]
	movs r1, #0x40
	movs r2, #0x38
	b _08066218
_080661FA:
	cmp r1, #0x50
	bne _0806620A
	ldr r0, [r2, #0x5c]
	movs r1, #0
	str r1, [sp]
	movs r1, #0x40
	movs r2, #0xa8
	b _08066218
_0806620A:
	cmp r1, #0x55
	bne _08066220
	ldr r0, [r2, #0x5c]
	movs r1, #0
	str r1, [sp]
	movs r1, #0x40
	movs r2, #0xa4
_08066218:
	movs r3, #0x70
	bl sub_8066390
	b _0806624C
_08066220:
	cmp r1, #0x5a
	bne _08066236
	ldr r0, [r2, #0x5c]
	movs r1, #0
	str r1, [sp]
	movs r1, #0x40
	movs r2, #0x41
	movs r3, #0x78
	bl sub_8066390
	b _0806624C
_08066236:
	movs r3, #0x2e
	ldrsh r0, [r2, r3]
	cmp r1, r0
	bne _0806624C
	ldr r1, _08066254  @ gUnknown_0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r2, #0
	bl Proc_Break
_0806624C:
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_08066254: .4byte gUnknown_0201774C

	THUMB_FUNC_END sub_80660B4

	THUMB_FUNC_START sub_8066258
sub_8066258: @ 0x08066258
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x34
	adds r4, r0, #0
	mov r8, r1
	ldr r0, [sp, #0x54]
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	mov sl, r2
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	mov r9, r3
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	add r1, sp, #4
	ldr r0, _080662C8  @ gUnknown_080DE5E4
	ldm r0!, {r2, r3, r6}
	stm r1!, {r2, r3, r6}
	ldm r0!, {r2, r3, r6}
	stm r1!, {r2, r3, r6}
	ldm r0!, {r2, r3, r6}
	stm r1!, {r2, r3, r6}
	ldm r0!, {r2, r3, r6}
	stm r1!, {r2, r3, r6}
	adds r0, r4, #0
	bl GetAISSubjectId
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldr r1, _080662CC  @ gUnknown_0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _080662D0  @ ProcScr_efxDanceparaOBJ1
	movs r1, #3
	bl Proc_Start
	adds r7, r0, #0
	adds r0, r4, #0
	bl GetCoreAIStruct
	str r0, [r7, #0x5c]
	movs r0, #0
	strh r0, [r7, #0x2c]
	mov r0, r8
	strh r0, [r7, #0x2e]
	cmp r5, #5
	bhi _08066318
	lsls r0, r5, #2
	ldr r1, _080662D4  @ _080662D8
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080662C8: .4byte gUnknown_080DE5E4
_080662CC: .4byte gUnknown_0201774C
_080662D0: .4byte ProcScr_efxDanceparaOBJ1
_080662D4: .4byte _080662D8
_080662D8: @ jump table
	.4byte _08066318 @ case 0
	.4byte _080662F0 @ case 1
	.4byte _080662F8 @ case 2
	.4byte _08066300 @ case 3
	.4byte _08066308 @ case 4
	.4byte _08066310 @ case 5
_080662F0:
	lsls r1, r6, #2
	add r0, sp, #0xc
	adds r0, r0, r1
	b _0806631E
_080662F8:
	lsls r1, r6, #2
	add r0, sp, #0x14
	adds r0, r0, r1
	b _0806631E
_08066300:
	lsls r1, r6, #2
	add r0, sp, #0x1c
	adds r0, r0, r1
	b _0806631E
_08066308:
	lsls r1, r6, #2
	add r0, sp, #0x24
	adds r0, r0, r1
	b _0806631E
_08066310:
	lsls r1, r6, #2
	add r0, sp, #0x2c
	adds r0, r0, r1
	b _0806631E
_08066318:
	lsls r0, r6, #2
	add r0, sp
	adds r0, #4
_0806631E:
	ldr r3, [r0]
	ldr r0, [r7, #0x5c]
	str r3, [sp]
	adds r1, r3, #0
	adds r2, r3, #0
	bl EfxAnimCreate
	str r0, [r7, #0x60]
	mov r1, sl
	strh r1, [r0, #2]
	mov r2, r9
	strh r2, [r0, #4]
	ldrh r2, [r0, #8]
	ldr r1, _08066358  @ 0x0000F3FF
	ands r1, r2
	movs r3, #0x80
	lsls r3, r3, #3
	adds r2, r3, #0
	orrs r1, r2
	strh r1, [r0, #8]
	add sp, #0x34
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08066358: .4byte 0x0000F3FF

	THUMB_FUNC_END sub_8066258

	THUMB_FUNC_START sub_806635C
sub_806635C: @ 0x0806635C
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x2e
	ldrsh r1, [r4, r2]
	cmp r0, r1
	bne _08066386
	ldr r0, _0806638C  @ gUnknown_0201774C
	ldr r1, [r0]
	subs r1, #1
	str r1, [r0]
	ldr r0, [r4, #0x60]
	bl AnimDelete
	adds r0, r4, #0
	bl Proc_Break
_08066386:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806638C: .4byte gUnknown_0201774C

	THUMB_FUNC_END sub_806635C

	THUMB_FUNC_START sub_8066390
sub_8066390: @ 0x08066390
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	mov r8, r0
	mov r9, r1
	ldr r0, [sp, #0x28]
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	str r2, [sp, #4]
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	mov sl, r3
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r0, _080663E8  @ gUnknown_080DE624
	ldr r6, [r0]
	ldr r7, [r0, #4]
	ldr r1, _080663EC  @ gUnknown_0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _080663F0  @ ProcScr_efxDanceparaOBJ2
	movs r1, #3
	bl Proc_Start
	adds r5, r0, #0
	mov r0, r8
	bl GetCoreAIStruct
	str r0, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	mov r0, r9
	strh r0, [r5, #0x2e]
	cmp r4, #0
	beq _080663E2
	cmp r4, #1
	beq _080663F4
_080663E2:
	adds r3, r6, #0
	b _080663F6
	.align 2, 0
_080663E8: .4byte gUnknown_080DE624
_080663EC: .4byte gUnknown_0201774C
_080663F0: .4byte ProcScr_efxDanceparaOBJ2
_080663F4:
	adds r3, r7, #0
_080663F6:
	ldr r0, [r5, #0x5c]
	str r3, [sp]
	adds r1, r3, #0
	adds r2, r3, #0
	bl EfxAnimCreate
	str r0, [r5, #0x60]
	mov r1, sp
	ldrh r1, [r1, #4]
	strh r1, [r0, #2]
	mov r2, sl
	strh r2, [r0, #4]
	ldrh r2, [r0, #8]
	ldr r1, _08066430  @ 0x0000F3FF
	ands r1, r2
	movs r3, #0x80
	lsls r3, r3, #3
	adds r2, r3, #0
	orrs r1, r2
	strh r1, [r0, #8]
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08066430: .4byte 0x0000F3FF

	THUMB_FUNC_END sub_8066390

	THUMB_FUNC_START sub_8066434
sub_8066434: @ 0x08066434
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x60]
	ldrh r0, [r1, #4]
	subs r0, #0x10
	strh r0, [r1, #4]
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x2e
	ldrsh r1, [r4, r2]
	cmp r0, r1
	bne _08066466
	ldr r0, _0806646C  @ gUnknown_0201774C
	ldr r1, [r0]
	subs r1, #1
	str r1, [r0]
	ldr r0, [r4, #0x60]
	bl AnimDelete
	adds r0, r4, #0
	bl Proc_Break
_08066466:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806646C: .4byte gUnknown_0201774C

	THUMB_FUNC_END sub_8066434

	THUMB_FUNC_START sub_8066470
sub_8066470: @ 0x08066470
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r6, r1, #0
	adds r5, r2, #0
	ldr r1, _080664A0  @ gUnknown_0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _080664A4  @ ProcScr_efxDanceparaWOUT
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r5, [r0, #0x2e]
	adds r0, r4, #0
	adds r1, r6, #0
	bl StartSpellBG_FLASH
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080664A0: .4byte gUnknown_0201774C
_080664A4: .4byte ProcScr_efxDanceparaWOUT

	THUMB_FUNC_END sub_8066470

	THUMB_FUNC_START sub_80664A8
sub_80664A8: @ 0x080664A8
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	movs r0, #0x2c
	ldrsh r3, [r6, r0]
	movs r1, #0x2e
	ldrsh r0, [r6, r1]
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0x10
	bl Interpolate
	adds r5, r0, #0
	ldr r0, _08066508  @ gPaletteBuffer
	ldr r4, _0806650C  @ gEkrBgPalBackupMaybe
	movs r2, #0x80
	lsls r2, r2, #1
	adds r1, r4, #0
	bl CpuFastSet
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0x20
	adds r3, r5, #0
	bl sub_807132C
	ldrh r0, [r6, #0x2c]
	adds r0, #1
	strh r0, [r6, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x2e
	ldrsh r1, [r6, r2]
	cmp r0, r1
	ble _080664FE
	ldr r1, _08066510  @ gUnknown_0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r6, #0
	bl Proc_Break
_080664FE:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08066508: .4byte gPaletteBuffer
_0806650C: .4byte gEkrBgPalBackupMaybe
_08066510: .4byte gUnknown_0201774C

	THUMB_FUNC_END sub_80664A8
