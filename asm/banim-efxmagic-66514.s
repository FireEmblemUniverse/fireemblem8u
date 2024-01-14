	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	THUMB_FUNC_START sub_806B4F8
sub_806B4F8: @ 0x0806B4F8
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl NewEfxSpellCast
	bl SpellFx_ClearBG1Position
	ldr r0, _0806B530  @ ProcScr_efxGorgon
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r5, #0
	bl GetAnimRoundTypeAnotherSide
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl CheckRoundMiss
	adds r4, #0x29
	strb r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806B530: .4byte ProcScr_efxGorgon

	THUMB_FUNC_END sub_806B4F8

	THUMB_FUNC_START sub_806B534
sub_806B534: @ 0x0806B534
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetAnimAnotherSide
	adds r5, r0, #0
	bl EfxGetCamMovDuration
	adds r2, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _0806B560
	ldr r0, [r4, #0x5c]
	movs r1, #1
	negs r1, r1
	bl NewEfxFarAttackWithDistance
	b _0806B646
_0806B560:
	movs r0, #0x2c
	ldrsh r1, [r4, r0]
	adds r0, r2, #0
	adds r0, #0xb
	cmp r1, r0
	bne _0806B588
	adds r0, r5, #0
	bl sub_806B680
	ldr r0, _0806B584  @ 0x000003B6
	movs r1, #0x80
	lsls r1, r1, #1
	movs r2, #0xc0
	movs r3, #1
	bl PlaySFX
	b _0806B646
	.align 2, 0
_0806B584: .4byte 0x000003B6
_0806B588:
	adds r0, r2, #0
	adds r0, #0x25
	cmp r1, r0
	bne _0806B598
	adds r0, r5, #0
	bl sub_806B7A8
	b _0806B646
_0806B598:
	adds r0, r2, #0
	adds r0, #0x54
	cmp r1, r0
	bne _0806B5A6
	bl sub_806BBDC
	b _0806B646
_0806B5A6:
	adds r0, r2, #0
	adds r0, #0x60
	cmp r1, r0
	bne _0806B5B6
	adds r0, r5, #0
	bl StartSubSpell_efxSuperdruidOBJ2
	b _0806B646
_0806B5B6:
	adds r0, r2, #0
	adds r0, #0x6f
	cmp r1, r0
	bne _0806B5D0
	ldr r0, [r4, #0x5c]
	movs r1, #0xc
	movs r2, #4
	bl StartSpellThing_MagicQuake
	adds r0, r5, #0
	bl sub_806B89C
	b _0806B646
_0806B5D0:
	adds r0, r2, #0
	adds r0, #0x70
	cmp r1, r0
	bne _0806B5E0
	adds r0, r5, #0
	bl sub_806BEEC
	b _0806B646
_0806B5E0:
	adds r0, r2, #0
	adds r0, #0x7a
	cmp r1, r0
	bne _0806B5EE
	bl sub_806C464
	b _0806B646
_0806B5EE:
	adds r0, r2, #0
	adds r0, #0x7b
	cmp r1, r0
	bne _0806B608
	adds r0, r5, #0
	bl sub_806C0B8
	ldr r0, [r4, #0x5c]
	movs r1, #0x1a
	movs r2, #2
	bl StartSpellThing_MagicQuake
	b _0806B646
_0806B608:
	adds r0, r2, #0
	adds r0, #0x95
	cmp r1, r0
	bne _0806B630
	ldrh r0, [r5, #0x10]
	movs r1, #9
	orrs r0, r1
	strh r0, [r5, #0x10]
	adds r4, #0x29
	ldrb r1, [r4]
	adds r0, r5, #0
	bl StartBattleAnimHitEffectsDefault
	ldrb r0, [r4]
	cmp r0, #0
	bne _0806B646
	adds r0, r5, #0
	bl EfxPlayHittedSFX
	b _0806B646
_0806B630:
	adds r0, r2, #0
	adds r0, #0xa9
	cmp r1, r0
	bne _0806B646
	bl SpellFx_Finish
	bl RegisterEfxSpellCastEnd
	adds r0, r4, #0
	bl Proc_Break
_0806B646:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_806B534

	THUMB_FUNC_START sub_806B64C
sub_806B64C: @ 0x0806B64C
	push {lr}
	ldr r0, [r0, #0x60]
	bl AnimDelete
	ldr r1, _0806B660  @ gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_0806B660: .4byte gEfxBgSemaphore

	THUMB_FUNC_END sub_806B64C

	THUMB_FUNC_START sub_806B664
sub_806B664: @ 0x0806B664
	push {lr}
	ldr r2, [r0, #0x60]
	ldr r1, _0806B67C  @ gUnknown_086EAE14
	str r1, [r2, #0x24]
	str r1, [r2, #0x20]
	movs r1, #0
	strh r1, [r2, #6]
	bl Proc_Break
	pop {r0}
	bx r0
	.align 2, 0
_0806B67C: .4byte gUnknown_086EAE14

	THUMB_FUNC_END sub_806B664

	THUMB_FUNC_START sub_806B680
sub_806B680: @ 0x0806B680
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r1, _0806B6BC  @ gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0806B6C0  @ gUnknown_085D8B24
	movs r1, #3
	bl Proc_Start
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	ldr r3, _0806B6C4  @ gUnknown_086EAE24
	str r3, [sp]
	adds r0, r4, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl EfxCreateFrontAnim
	adds r4, r0, #0
	str r4, [r5, #0x60]
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _0806B6C8
	movs r0, #0x58
	b _0806B6CA
	.align 2, 0
_0806B6BC: .4byte gEfxBgSemaphore
_0806B6C0: .4byte gUnknown_085D8B24
_0806B6C4: .4byte gUnknown_086EAE24
_0806B6C8:
	movs r0, #0x98
_0806B6CA:
	strh r0, [r4, #2]
	movs r0, #0x54
	strh r0, [r4, #4]
	ldr r0, _0806B6EC  @ gEkrDistanceType
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #1
	bne _0806B6F6
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _0806B6F0
	ldrh r0, [r4, #2]
	subs r0, #0x18
	b _0806B6F4
	.align 2, 0
_0806B6EC: .4byte gEkrDistanceType
_0806B6F0:
	ldrh r0, [r4, #2]
	adds r0, #0x18
_0806B6F4:
	strh r0, [r4, #2]
_0806B6F6:
	bl GetBanimDragonStatusType
	cmp r0, #1
	beq _0806B706
	bl GetBanimDragonStatusType
	cmp r0, #2
	bne _0806B712
_0806B706:
	ldrh r1, [r4, #8]
	movs r2, #0xc0
	lsls r2, r2, #4
	adds r0, r2, #0
	orrs r0, r1
	strh r0, [r4, #8]
_0806B712:
	movs r0, #0x14
	strh r0, [r4, #0xa]
	bl AnimSort
	ldr r0, _0806B734  @ gUnknown_086E9D40
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	ldr r0, _0806B738  @ gUnknown_086EA3EC
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806B734: .4byte gUnknown_086E9D40
_0806B738: .4byte gUnknown_086EA3EC

	THUMB_FUNC_END sub_806B680

	THUMB_FUNC_START sub_806B73C
sub_806B73C: @ 0x0806B73C
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r0, #0x2c
	adds r1, r7, #0
	adds r1, #0x44
	ldr r2, [r7, #0x48]
	bl EfxAdvanceFrameLut
	lsls r0, r0, #0x10
	asrs r5, r0, #0x10
	cmp r5, #0
	blt _0806B780
	ldr r6, [r7, #0x4c]
	ldr r0, [r7, #0x54]
	ldr r4, [r7, #0x58]
	lsls r5, r5, #2
	adds r0, r5, r0
	ldr r0, [r0]
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	adds r4, r5, r4
	ldr r0, [r4]
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	ldr r0, [r7, #0x5c]
	adds r5, r5, r6
	ldr r2, [r5]
	adds r1, r2, #0
	bl SpellFx_WriteBgMap
	b _0806B79E
_0806B780:
	movs r0, #1
	negs r0, r0
	cmp r5, r0
	bne _0806B79E
	bl SpellFx_ClearBG1
	ldr r1, _0806B7A4  @ gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SetDefaultColorEffects_
	adds r0, r7, #0
	bl Proc_Break
_0806B79E:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806B7A4: .4byte gEfxBgSemaphore

	THUMB_FUNC_END sub_806B73C

	THUMB_FUNC_START sub_806B7A8
sub_806B7A8: @ 0x0806B7A8
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _0806B7F0  @ gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0806B7F4  @ ProcScr_efxGorgonBGDirt
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r1, [r0, #0x44]
	ldr r1, _0806B7F8  @ gUnknown_080DF042
	str r1, [r0, #0x48]
	ldr r1, _0806B7FC  @ gUnknown_085D8B4C
	str r1, [r0, #0x4c]
	ldr r1, _0806B800  @ gUnknown_085D8B78
	str r1, [r0, #0x54]
	ldr r1, _0806B804  @ gUnknown_085D8BA4
	str r1, [r0, #0x58]
	ldr r0, _0806B808  @ gEkrDistanceType
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #1
	bne _0806B81C
	adds r0, r4, #0
	bl GetAnimPosition
	cmp r0, #0
	bne _0806B80C
	movs r0, #1
	movs r1, #0x18
	b _0806B810
	.align 2, 0
_0806B7F0: .4byte gEfxBgSemaphore
_0806B7F4: .4byte ProcScr_efxGorgonBGDirt
_0806B7F8: .4byte gUnknown_080DF042
_0806B7FC: .4byte gUnknown_085D8B4C
_0806B800: .4byte gUnknown_085D8B78
_0806B804: .4byte gUnknown_085D8BA4
_0806B808: .4byte gEkrDistanceType
_0806B80C:
	ldr r1, _0806B818  @ 0x0000FFE8
	movs r0, #1
_0806B810:
	movs r2, #0
	bl BG_SetPosition
	b _0806B826
	.align 2, 0
_0806B818: .4byte 0x0000FFE8
_0806B81C:
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
_0806B826:
	bl SpellFx_SetSomeColorEffect
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_806B7A8

	THUMB_FUNC_START sub_806B830
sub_806B830: @ 0x0806B830
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r0, #0x2c
	adds r1, r7, #0
	adds r1, #0x44
	ldr r2, [r7, #0x48]
	bl EfxAdvanceFrameLut
	lsls r0, r0, #0x10
	asrs r5, r0, #0x10
	cmp r5, #0
	blt _0806B876
	ldr r6, [r7, #0x4c]
	ldr r0, [r7, #0x54]
	ldr r4, [r7, #0x58]
	lsls r5, r5, #2
	adds r0, r5, r0
	ldr r0, [r0]
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	adds r4, r5, r4
	ldr r0, [r4]
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	ldr r0, [r7, #0x5c]
	adds r5, r5, r6
	ldr r1, [r5]
	movs r2, #0x20
	movs r3, #0x14
	bl SpellFx_WriteBgMapExt
	b _0806B890
_0806B876:
	movs r0, #1
	negs r0, r0
	cmp r5, r0
	bne _0806B890
	bl SpellFx_ClearBG1
	ldr r1, _0806B898  @ gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r7, #0
	bl Proc_Break
_0806B890:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806B898: .4byte gEfxBgSemaphore

	THUMB_FUNC_END sub_806B830

	THUMB_FUNC_START sub_806B89C
sub_806B89C: @ 0x0806B89C
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _0806B8E4  @ gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0806B8E8  @ ProcScr_efxGorgonBGTwister
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r1, [r0, #0x44]
	ldr r1, _0806B8EC  @ gUnknown_080DF080
	str r1, [r0, #0x48]
	ldr r1, _0806B8F0  @ gUnknown_085D8BE8
	str r1, [r0, #0x4c]
	ldr r1, _0806B8F4  @ gUnknown_085D8BF4
	str r1, [r0, #0x54]
	ldr r1, _0806B8F8  @ gUnknown_085D8C00
	str r1, [r0, #0x58]
	ldr r0, _0806B8FC  @ gEkrDistanceType
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #1
	bne _0806B90C
	adds r0, r4, #0
	bl GetAnimPosition
	cmp r0, #0
	bne _0806B900
	movs r0, #1
	movs r1, #0x28
	b _0806B91A
	.align 2, 0
_0806B8E4: .4byte gEfxBgSemaphore
_0806B8E8: .4byte ProcScr_efxGorgonBGTwister
_0806B8EC: .4byte gUnknown_080DF080
_0806B8F0: .4byte gUnknown_085D8BE8
_0806B8F4: .4byte gUnknown_085D8BF4
_0806B8F8: .4byte gUnknown_085D8C00
_0806B8FC: .4byte gEkrDistanceType
_0806B900:
	ldr r1, _0806B908  @ 0x0000FFE8
	movs r0, #1
	b _0806B91A
	.align 2, 0
_0806B908: .4byte 0x0000FFE8
_0806B90C:
	adds r0, r4, #0
	bl GetAnimPosition
	cmp r0, #0
	bne _0806B922
	movs r0, #1
	movs r1, #0x10
_0806B91A:
	movs r2, #0
	bl BG_SetPosition
	b _0806B92C
_0806B922:
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
_0806B92C:
	bl SpellFx_SetSomeColorEffect
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_806B89C

	THUMB_FUNC_START sub_806B938
sub_806B938: @ 0x0806B938
	adds r0, #0x4c
	movs r1, #0
	strh r1, [r0]
	bx lr

	THUMB_FUNC_END sub_806B938

	THUMB_FUNC_START sub_806B940
sub_806B940: @ 0x0806B940
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	str r0, [sp, #4]
	ldr r6, _0806B980  @ gPaletteBuffer
	ldr r5, _0806B984  @ gEfxPal
	adds r0, #0x4c
	movs r1, #0
	ldrsh r3, [r0, r1]
	movs r0, #0xc
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0x10
	bl Interpolate
	str r0, [sp, #8]
	ldrh r0, [r6]
	strh r0, [r5]
	movs r4, #0
_0806B96E:
	subs r0, r4, #2
	cmp r0, #0x1c
	bhi _0806BA1A
	lsls r0, r0, #2
	ldr r1, _0806B988  @ _0806B98C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0806B980: .4byte gPaletteBuffer
_0806B984: .4byte gEfxPal
_0806B988: .4byte _0806B98C
_0806B98C: @ jump table
	.4byte _0806BA00 @ case 0
	.4byte _0806BA00 @ case 1
	.4byte _0806BA1A @ case 2
	.4byte _0806BA1A @ case 3
	.4byte _0806BA1A @ case 4
	.4byte _0806BA1A @ case 5
	.4byte _0806BA1A @ case 6
	.4byte _0806BA1A @ case 7
	.4byte _0806BA1A @ case 8
	.4byte _0806BA1A @ case 9
	.4byte _0806BA1A @ case 10
	.4byte _0806BA1A @ case 11
	.4byte _0806BA1A @ case 12
	.4byte _0806BA1A @ case 13
	.4byte _0806BA00 @ case 14
	.4byte _0806BA1A @ case 15
	.4byte _0806BA1A @ case 16
	.4byte _0806BA1A @ case 17
	.4byte _0806BA1A @ case 18
	.4byte _0806BA00 @ case 19
	.4byte _0806BA00 @ case 20
	.4byte _0806BA1A @ case 21
	.4byte _0806BA1A @ case 22
	.4byte _0806BA1A @ case 23
	.4byte _0806BA1A @ case 24
	.4byte _0806BA00 @ case 25
	.4byte _0806BA00 @ case 26
	.4byte _0806BA00 @ case 27
	.4byte _0806BA00 @ case 28
_0806BA00:
	adds r0, r6, #0
	adds r1, r5, #0
	movs r2, #8
	bl CpuFastSet
	adds r6, #0x20
	adds r5, #0x20
	ldr r2, [sp, #4]
	adds r2, #0x4c
	mov r8, r2
	adds r4, #1
	mov sl, r4
	b _0806BA7E
_0806BA1A:
	adds r6, #2
	adds r5, #2
	ldr r3, [sp, #4]
	adds r3, #0x4c
	mov r8, r3
	adds r4, #1
	mov sl, r4
	movs r0, #0x1f
	mov r9, r0
	movs r7, #0x1f
	movs r0, #0x10
	ldr r1, [sp, #8]
	subs r4, r0, r1
	movs r2, #0xe
	mov ip, r2
_0806BA38:
	ldrh r1, [r6]
	adds r0, r7, #0
	ands r0, r1
	adds r3, r0, #0
	muls r3, r4, r3
	asrs r3, r3, #4
	lsls r1, r1, #0x10
	lsrs r0, r1, #0x15
	mov r2, r9
	ands r0, r2
	adds r2, r0, #0
	muls r2, r4, r2
	asrs r2, r2, #4
	lsrs r1, r1, #0x1a
	mov r0, r9
	ands r1, r0
	adds r0, r1, #0
	muls r0, r4, r0
	asrs r0, r0, #4
	ands r0, r7
	lsls r0, r0, #0xa
	ands r2, r7
	lsls r2, r2, #5
	orrs r0, r2
	ands r3, r7
	orrs r3, r0
	strh r3, [r5]
	adds r6, #2
	adds r5, #2
	movs r1, #1
	negs r1, r1
	add ip, r1
	mov r2, ip
	cmp r2, #0
	bge _0806BA38
_0806BA7E:
	mov r4, sl
	cmp r4, #0x1f
	bgt _0806BA86
	b _0806B96E
_0806BA86:
	ldr r0, _0806BAB0  @ gEfxPal
	movs r1, #0xa0
	lsls r1, r1, #0x13
	movs r2, #0x80
	lsls r2, r2, #1
	bl CpuFastSet
	bl DisablePaletteSync
	mov r3, r8
	ldrh r1, [r3]
	movs r2, #0
	ldrsh r0, [r3, r2]
	cmp r0, #0xc
	bne _0806BAB4
	movs r0, #0
	strh r0, [r3]
	ldr r0, [sp, #4]
	bl Proc_Break
	b _0806BABA
	.align 2, 0
_0806BAB0: .4byte gEfxPal
_0806BAB4:
	adds r0, r1, #1
	mov r3, r8
	strh r0, [r3]
_0806BABA:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_806B940

	THUMB_FUNC_START sub_806BACC
sub_806BACC: @ 0x0806BACC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	ldr r5, _0806BAF0  @ gPaletteBuffer
	ldr r4, _0806BAF4  @ gEfxPal
	ldrh r0, [r5]
	strh r0, [r4]
	movs r6, #0
_0806BADE:
	subs r0, r6, #2
	cmp r0, #0x1c
	bhi _0806BB86
	lsls r0, r0, #2
	ldr r1, _0806BAF8  @ _0806BAFC
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0806BAF0: .4byte gPaletteBuffer
_0806BAF4: .4byte gEfxPal
_0806BAF8: .4byte _0806BAFC
_0806BAFC: @ jump table
	.4byte _0806BB70 @ case 0
	.4byte _0806BB70 @ case 1
	.4byte _0806BB86 @ case 2
	.4byte _0806BB86 @ case 3
	.4byte _0806BB86 @ case 4
	.4byte _0806BB86 @ case 5
	.4byte _0806BB86 @ case 6
	.4byte _0806BB86 @ case 7
	.4byte _0806BB86 @ case 8
	.4byte _0806BB86 @ case 9
	.4byte _0806BB86 @ case 10
	.4byte _0806BB86 @ case 11
	.4byte _0806BB86 @ case 12
	.4byte _0806BB86 @ case 13
	.4byte _0806BB70 @ case 14
	.4byte _0806BB86 @ case 15
	.4byte _0806BB70 @ case 16
	.4byte _0806BB86 @ case 17
	.4byte _0806BB86 @ case 18
	.4byte _0806BB70 @ case 19
	.4byte _0806BB70 @ case 20
	.4byte _0806BB86 @ case 21
	.4byte _0806BB86 @ case 22
	.4byte _0806BB86 @ case 23
	.4byte _0806BB86 @ case 24
	.4byte _0806BB70 @ case 25
	.4byte _0806BB70 @ case 26
	.4byte _0806BB70 @ case 27
	.4byte _0806BB70 @ case 28
_0806BB70:
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #8
	bl CpuFastSet
	adds r5, #0x20
	adds r4, #0x20
	adds r1, r6, #1
	mov r7, r8
	adds r7, #0x4c
	b _0806BBA0
_0806BB86:
	adds r5, #2
	adds r4, #2
	adds r1, r6, #1
	mov r7, r8
	adds r7, #0x4c
	movs r2, #0
	movs r0, #0xe
_0806BB94:
	strh r2, [r4]
	adds r5, #2
	adds r4, #2
	subs r0, #1
	cmp r0, #0
	bge _0806BB94
_0806BBA0:
	adds r6, r1, #0
	cmp r6, #0x1f
	ble _0806BADE
	ldr r0, _0806BBD8  @ gEfxPal
	movs r1, #0xa0
	lsls r1, r1, #0x13
	movs r2, #0x80
	lsls r2, r2, #1
	bl CpuFastSet
	bl DisablePaletteSync
	movs r1, #0
	ldrsh r0, [r7, r1]
	cmp r0, #0x10
	bne _0806BBC6
	mov r0, r8
	bl Proc_Break
_0806BBC6:
	ldrh r0, [r7]
	adds r0, #1
	strh r0, [r7]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806BBD8: .4byte gEfxPal

	THUMB_FUNC_END sub_806BACC

	THUMB_FUNC_START sub_806BBDC
sub_806BBDC: @ 0x0806BBDC
	push {lr}
	ldr r0, _0806BBEC  @ gUnknown_085D8C24
	movs r1, #0
	bl Proc_Start
	pop {r0}
	bx r0
	.align 2, 0
_0806BBEC: .4byte gUnknown_085D8C24

	THUMB_FUNC_END sub_806BBDC

	THUMB_FUNC_START sub_806BBF0
sub_806BBF0: @ 0x0806BBF0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x44]
	cmp r0, #5
	bhi _0806BC50
	lsls r0, r0, #2
	ldr r1, _0806BC04  @ _0806BC08
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0806BC04: .4byte _0806BC08
_0806BC08: @ jump table
	.4byte _0806BC20 @ case 0
	.4byte _0806BC28 @ case 1
	.4byte _0806BC30 @ case 2
	.4byte _0806BC38 @ case 3
	.4byte _0806BC40 @ case 4
	.4byte _0806BC48 @ case 5
_0806BC20:
	ldr r1, [r4, #0x60]
	ldrh r0, [r1, #2]
	subs r0, #2
	b _0806BC4E
_0806BC28:
	ldr r1, [r4, #0x60]
	ldrh r0, [r1, #2]
	subs r0, #3
	b _0806BC4E
_0806BC30:
	ldr r1, [r4, #0x60]
	ldrh r0, [r1, #2]
	subs r0, #4
	b _0806BC4E
_0806BC38:
	ldr r1, [r4, #0x60]
	ldrh r0, [r1, #2]
	adds r0, #2
	b _0806BC4E
_0806BC40:
	ldr r1, [r4, #0x60]
	ldrh r0, [r1, #2]
	adds r0, #3
	b _0806BC4E
_0806BC48:
	ldr r1, [r4, #0x60]
	ldrh r0, [r1, #2]
	adds r0, #4
_0806BC4E:
	strh r0, [r1, #2]
_0806BC50:
	ldr r1, [r4, #0x60]
	ldrh r0, [r1, #4]
	subs r0, #6
	strh r0, [r1, #4]
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x2e
	ldrsh r1, [r4, r2]
	cmp r0, r1
	beq _0806BC78
	ldr r0, [r4, #0x60]
	movs r2, #2
	ldrsh r1, [r0, r2]
	movs r0, #0x10
	negs r0, r0
	cmp r1, r0
	bge _0806BC8C
_0806BC78:
	ldr r0, _0806BC94  @ gEfxBgSemaphore
	ldr r1, [r0]
	subs r1, #1
	str r1, [r0]
	ldr r0, [r4, #0x60]
	bl AnimDelete
	adds r0, r4, #0
	bl Proc_Break
_0806BC8C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806BC94: .4byte gEfxBgSemaphore

	THUMB_FUNC_END sub_806BBF0

	THUMB_FUNC_START sub_806BC98
sub_806BC98: @ 0x0806BC98
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r5, r0, #0
	mov r8, r1
	adds r6, r2, #0
	adds r4, r3, #0
	ldr r1, _0806BCE4  @ gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0806BCE8  @ ProcScr_efxGorgonOBJTwisterPiece
	movs r1, #3
	bl Proc_Start
	adds r7, r0, #0
	str r5, [r7, #0x5c]
	movs r0, #0
	strh r0, [r7, #0x2c]
	strh r4, [r7, #0x2e]
	str r6, [r7, #0x44]
	ldr r3, _0806BCEC  @ gUnknown_086B5974
	str r3, [sp]
	adds r0, r5, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl EfxCreateFrontAnim
	adds r4, r0, #0
	str r4, [r7, #0x60]
	ldr r0, [r7, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _0806BCF0
	movs r0, #0x58
	b _0806BCF2
	.align 2, 0
_0806BCE4: .4byte gEfxBgSemaphore
_0806BCE8: .4byte ProcScr_efxGorgonOBJTwisterPiece
_0806BCEC: .4byte gUnknown_086B5974
_0806BCF0:
	movs r0, #0x98
_0806BCF2:
	strh r0, [r4, #2]
	movs r0, #0x58
	strh r0, [r4, #4]
	ldr r0, _0806BD14  @ gEkrDistanceType
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #1
	bne _0806BD1E
	ldr r0, [r7, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _0806BD18
	ldrh r0, [r4, #2]
	subs r0, #0x18
	b _0806BD1C
	.align 2, 0
_0806BD14: .4byte gEkrDistanceType
_0806BD18:
	ldrh r0, [r4, #2]
	adds r0, #0x18
_0806BD1C:
	strh r0, [r4, #2]
_0806BD1E:
	ldr r0, [r7, #0x44]
	cmp r0, #5
	bhi _0806BD70
	lsls r0, r0, #2
	ldr r1, _0806BD30  @ _0806BD34
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0806BD30: .4byte _0806BD34
_0806BD34: @ jump table
	.4byte _0806BD4C @ case 0
	.4byte _0806BD52 @ case 1
	.4byte _0806BD58 @ case 2
	.4byte _0806BD5E @ case 3
	.4byte _0806BD64 @ case 4
	.4byte _0806BD6A @ case 5
_0806BD4C:
	ldrh r0, [r4, #2]
	subs r0, #0xc
	b _0806BD6E
_0806BD52:
	ldrh r0, [r4, #2]
	subs r0, #0x18
	b _0806BD6E
_0806BD58:
	ldrh r0, [r4, #2]
	subs r0, #0x24
	b _0806BD6E
_0806BD5E:
	ldrh r0, [r4, #2]
	adds r0, #0xc
	b _0806BD6E
_0806BD64:
	ldrh r0, [r4, #2]
	adds r0, #0x18
	b _0806BD6E
_0806BD6A:
	ldrh r0, [r4, #2]
	adds r0, #0x24
_0806BD6E:
	strh r0, [r4, #2]
_0806BD70:
	mov r0, r8
	cmp r0, #0
	bne _0806BD80
	ldr r0, _0806BD7C  @ 0x3E000100
	b _0806BD82
	.align 2, 0
_0806BD7C: .4byte 0x3E000100
_0806BD80:
	ldr r0, _0806BD90  @ 0x3C000100
_0806BD82:
	str r0, [r4, #0x1c]
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806BD90: .4byte 0x3C000100

	THUMB_FUNC_END sub_806BC98

	THUMB_FUNC_START sub_806BD94
sub_806BD94: @ 0x0806BD94
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	movs r1, #0x1f
	ands r1, r0
	cmp r1, #0x1c
	bls _0806BDA4
	b _0806BEC6
_0806BDA4:
	lsls r0, r1, #2
	ldr r1, _0806BDB0  @ _0806BDB4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0806BDB0: .4byte _0806BDB4
_0806BDB4: @ jump table
	.4byte _0806BE28 @ case 0
	.4byte _0806BEC6 @ case 1
	.4byte _0806BEC6 @ case 2
	.4byte _0806BEC6 @ case 3
	.4byte _0806BE3C @ case 4
	.4byte _0806BEC6 @ case 5
	.4byte _0806BEC6 @ case 6
	.4byte _0806BEC6 @ case 7
	.4byte _0806BE50 @ case 8
	.4byte _0806BEC6 @ case 9
	.4byte _0806BEC6 @ case 10
	.4byte _0806BEC6 @ case 11
	.4byte _0806BE64 @ case 12
	.4byte _0806BEC6 @ case 13
	.4byte _0806BEC6 @ case 14
	.4byte _0806BEC6 @ case 15
	.4byte _0806BE78 @ case 16
	.4byte _0806BEC6 @ case 17
	.4byte _0806BEC6 @ case 18
	.4byte _0806BEC6 @ case 19
	.4byte _0806BE8C @ case 20
	.4byte _0806BEC6 @ case 21
	.4byte _0806BEC6 @ case 22
	.4byte _0806BEC6 @ case 23
	.4byte _0806BEA0 @ case 24
	.4byte _0806BEC6 @ case 25
	.4byte _0806BEC6 @ case 26
	.4byte _0806BEC6 @ case 27
	.4byte _0806BEB4 @ case 28
_0806BE28:
	ldr r0, [r4, #0x5c]
	movs r2, #0x2c
	ldrsh r1, [r4, r2]
	movs r3, #0xc
	subs r3, r3, r1
	movs r1, #0
	movs r2, #0
	bl sub_806BC98
	b _0806BEC6
_0806BE3C:
	ldr r0, [r4, #0x5c]
	movs r2, #0x2c
	ldrsh r1, [r4, r2]
	movs r3, #0xc
	subs r3, r3, r1
	movs r1, #1
	movs r2, #5
	bl sub_806BC98
	b _0806BEC6
_0806BE50:
	ldr r0, [r4, #0x5c]
	movs r2, #0x2c
	ldrsh r1, [r4, r2]
	movs r3, #0xc
	subs r3, r3, r1
	movs r1, #0
	movs r2, #6
	bl sub_806BC98
	b _0806BEC6
_0806BE64:
	ldr r0, [r4, #0x5c]
	movs r2, #0x2c
	ldrsh r1, [r4, r2]
	movs r3, #0xc
	subs r3, r3, r1
	movs r1, #1
	movs r2, #4
	bl sub_806BC98
	b _0806BEC6
_0806BE78:
	ldr r0, [r4, #0x5c]
	movs r2, #0x2c
	ldrsh r1, [r4, r2]
	movs r3, #0xc
	subs r3, r3, r1
	movs r1, #0
	movs r2, #2
	bl sub_806BC98
	b _0806BEC6
_0806BE8C:
	ldr r0, [r4, #0x5c]
	movs r2, #0x2c
	ldrsh r1, [r4, r2]
	movs r3, #0xc
	subs r3, r3, r1
	movs r1, #1
	movs r2, #1
	bl sub_806BC98
	b _0806BEC6
_0806BEA0:
	ldr r0, [r4, #0x5c]
	movs r2, #0x2c
	ldrsh r1, [r4, r2]
	movs r3, #0xc
	subs r3, r3, r1
	movs r1, #0
	movs r2, #3
	bl sub_806BC98
	b _0806BEC6
_0806BEB4:
	ldr r0, [r4, #0x5c]
	movs r2, #0x2c
	ldrsh r1, [r4, r2]
	movs r3, #0xc
	subs r3, r3, r1
	movs r1, #1
	movs r2, #7
	bl sub_806BC98
_0806BEC6:
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xc
	bne _0806BEE2
	ldr r1, _0806BEE8  @ gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
_0806BEE2:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806BEE8: .4byte gEfxBgSemaphore

	THUMB_FUNC_END sub_806BD94

	THUMB_FUNC_START sub_806BEEC
sub_806BEEC: @ 0x0806BEEC
	push {r4, r5, r6, lr}
	mov r6, sl
	mov r5, r9
	mov r4, r8
	push {r4, r5, r6}
	sub sp, #4
	adds r4, r0, #0
	ldr r1, _0806BF20  @ gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0806BF24  @ ProcScr_efxGorgonOBJTwister
	movs r1, #3
	bl Proc_Start
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	adds r0, r4, #0
	bl GetAnimPosition
	cmp r0, #0
	bne _0806BF28
	movs r0, #0x58
	b _0806BF2A
	.align 2, 0
_0806BF20: .4byte gEfxBgSemaphore
_0806BF24: .4byte ProcScr_efxGorgonOBJTwister
_0806BF28:
	movs r0, #0x98
_0806BF2A:
	strh r0, [r5, #0x32]
	movs r0, #0x48
	strh r0, [r5, #0x3a]
	ldr r0, _0806BF4C  @ gEkrDistanceType
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #1
	bne _0806BF56
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _0806BF50
	ldrh r0, [r5, #0x32]
	subs r0, #0x18
	b _0806BF54
	.align 2, 0
_0806BF4C: .4byte gEkrDistanceType
_0806BF50:
	ldrh r0, [r5, #0x32]
	adds r0, #0x18
_0806BF54:
	strh r0, [r5, #0x32]
_0806BF56:
	ldr r2, _0806C044  @ gSinLookup
	mov r9, r2
	movs r0, #0x80
	add r0, r9
	mov sl, r0
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r0, r0, #4
	movs r1, #0x80
	bl Div
	adds r6, r0, #0
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	mov r2, r9
	movs r1, #0
	ldrsh r0, [r2, r1]
	negs r0, r0
	lsls r0, r0, #4
	movs r1, #0x80
	bl Div
	adds r5, r0, #0
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	mov r2, r9
	movs r1, #0
	ldrsh r0, [r2, r1]
	lsls r0, r0, #4
	movs r1, #0x80
	bl Div
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	mov r2, sl
	movs r1, #0
	ldrsh r0, [r2, r1]
	lsls r0, r0, #4
	movs r1, #0x80
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	movs r0, #0x1f
	adds r1, r6, #0
	adds r2, r5, #0
	adds r3, r4, #0
	bl SetObjAffine
	mov r2, sl
	movs r1, #0
	ldrsh r0, [r2, r1]
	lsls r0, r0, #4
	movs r2, #0x80
	lsls r2, r2, #1
	mov r8, r2
	mov r1, r8
	bl Div
	adds r6, r0, #0
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	mov r1, r9
	movs r2, #0
	ldrsh r0, [r1, r2]
	negs r0, r0
	lsls r0, r0, #4
	mov r1, r8
	bl Div
	adds r5, r0, #0
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	mov r1, r9
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #4
	mov r1, r8
	bl Div
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	mov r1, sl
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #4
	mov r1, r8
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	movs r0, #0x1e
	adds r1, r6, #0
	adds r2, r5, #0
	adds r3, r4, #0
	bl SetObjAffine
	ldr r0, _0806C048  @ Pal_CrimsonEyeSprites
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _0806C04C  @ Img_CrimsonEyeSprites
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806C044: .4byte gSinLookup
_0806C048: .4byte Pal_CrimsonEyeSprites
_0806C04C: .4byte Img_CrimsonEyeSprites

	THUMB_FUNC_END sub_806BEEC

	THUMB_FUNC_START sub_806C050
sub_806C050: @ 0x0806C050
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r0, #0x2c
	adds r1, r6, #0
	adds r1, #0x44
	ldr r2, [r6, #0x48]
	bl EfxAdvanceFrameLut
	lsls r0, r0, #0x10
	asrs r4, r0, #0x10
	cmp r4, #0
	blt _0806C08E
	ldr r5, [r6, #0x4c]
	ldr r0, [r6, #0x54]
	lsls r4, r4, #2
	adds r0, r4, r0
	ldr r0, [r0]
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	ldr r0, [r6, #0x5c]
	bl GetAnimAnotherSide
	adds r4, r4, r5
	ldr r2, [r4]
	adds r1, r2, #0
	movs r3, #1
	bl sub_8068AFC
	b _0806C0AC
_0806C08E:
	movs r0, #1
	negs r0, r0
	cmp r4, r0
	bne _0806C0AC
	bl SpellFx_ClearBG1
	ldr r1, _0806C0B4  @ gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SetDefaultColorEffects_
	adds r0, r6, #0
	bl Proc_Break
_0806C0AC:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806C0B4: .4byte gEfxBgSemaphore

	THUMB_FUNC_END sub_806C050

	THUMB_FUNC_START sub_806C0B8
sub_806C0B8: @ 0x0806C0B8
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _0806C0FC  @ gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0806C100  @ ProcScr_efxGorgonBGFinish
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r1, [r0, #0x44]
	ldr r1, _0806C104  @ gFrameConfig_efxGorgonBGFinish
	str r1, [r0, #0x48]
	ldr r1, _0806C108  @ TsaArray_efxGorgonBGFinish
	str r1, [r0, #0x4c]
	ldr r1, _0806C10C  @ ImgArray_efxGorgonBGFinish
	str r1, [r0, #0x54]
	ldr r0, _0806C110  @ gEkrDistanceType
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #1
	bne _0806C124
	adds r0, r4, #0
	bl GetAnimPosition
	cmp r0, #0
	bne _0806C114
	movs r0, #1
	movs r1, #0x18
	b _0806C118
	.align 2, 0
_0806C0FC: .4byte gEfxBgSemaphore
_0806C100: .4byte ProcScr_efxGorgonBGFinish
_0806C104: .4byte gFrameConfig_efxGorgonBGFinish
_0806C108: .4byte TsaArray_efxGorgonBGFinish
_0806C10C: .4byte ImgArray_efxGorgonBGFinish
_0806C110: .4byte gEkrDistanceType
_0806C114:
	ldr r1, _0806C120  @ 0x0000FFE8
	movs r0, #1
_0806C118:
	movs r2, #0
	bl BG_SetPosition
	b _0806C12E
	.align 2, 0
_0806C120: .4byte 0x0000FFE8
_0806C124:
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
_0806C12E:
	ldr r0, _0806C144  @ gUnknown_086FDA44
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	ldr r0, _0806C148  @ sub_806B088
	bl SetPrimaryHBlankHandler
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806C144: .4byte gUnknown_086FDA44
_0806C148: .4byte sub_806B088

	THUMB_FUNC_END sub_806C0B8

	THUMB_FUNC_START sub_806C14C
sub_806C14C: @ 0x0806C14C
	adds r0, #0x4c
	movs r1, #0
	strh r1, [r0]
	bx lr

	THUMB_FUNC_END sub_806C14C

	THUMB_FUNC_START sub_806C154
sub_806C154: @ 0x0806C154
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r2, _0806C1A4  @ gEfxPal
	movs r1, #0
	adds r6, r2, #0
	adds r4, r5, #0
	adds r4, #0x4c
	ldr r3, _0806C1A8  @ 0x00007FFF
	adds r0, r3, #0
_0806C166:
	adds r2, #2
	adds r3, r1, #1
	movs r1, #0xe
_0806C16C:
	strh r0, [r2]
	adds r2, #2
	subs r1, #1
	cmp r1, #0
	bge _0806C16C
	adds r1, r3, #0
	cmp r1, #0x1f
	ble _0806C166
	movs r1, #0xa0
	lsls r1, r1, #0x13
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r6, #0
	bl CpuFastSet
	bl DisablePaletteSync
	ldrh r1, [r4]
	movs r2, #0
	ldrsh r0, [r4, r2]
	cmp r0, #8
	bne _0806C1AC
	movs r0, #0
	strh r0, [r4]
	adds r0, r5, #0
	bl Proc_Break
	b _0806C1B0
	.align 2, 0
_0806C1A4: .4byte gEfxPal
_0806C1A8: .4byte 0x00007FFF
_0806C1AC:
	adds r0, r1, #1
	strh r0, [r4]
_0806C1B0:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_806C154

	THUMB_FUNC_START sub_806C1B8
sub_806C1B8: @ 0x0806C1B8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	ldr r5, _0806C1DC  @ gPaletteBuffer
	ldr r4, _0806C1E0  @ gEfxPal
	ldrh r0, [r5]
	strh r0, [r4]
	movs r7, #0
_0806C1CA:
	subs r0, r7, #1
	cmp r0, #0x1d
	bhi _0806C276
	lsls r0, r0, #2
	ldr r1, _0806C1E4  @ _0806C1E8
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0806C1DC: .4byte gPaletteBuffer
_0806C1E0: .4byte gEfxPal
_0806C1E4: .4byte _0806C1E8
_0806C1E8: @ jump table
	.4byte _0806C260 @ case 0
	.4byte _0806C260 @ case 1
	.4byte _0806C260 @ case 2
	.4byte _0806C276 @ case 3
	.4byte _0806C276 @ case 4
	.4byte _0806C276 @ case 5
	.4byte _0806C276 @ case 6
	.4byte _0806C276 @ case 7
	.4byte _0806C276 @ case 8
	.4byte _0806C276 @ case 9
	.4byte _0806C276 @ case 10
	.4byte _0806C276 @ case 11
	.4byte _0806C276 @ case 12
	.4byte _0806C276 @ case 13
	.4byte _0806C276 @ case 14
	.4byte _0806C260 @ case 15
	.4byte _0806C276 @ case 16
	.4byte _0806C276 @ case 17
	.4byte _0806C276 @ case 18
	.4byte _0806C276 @ case 19
	.4byte _0806C260 @ case 20
	.4byte _0806C260 @ case 21
	.4byte _0806C276 @ case 22
	.4byte _0806C276 @ case 23
	.4byte _0806C276 @ case 24
	.4byte _0806C276 @ case 25
	.4byte _0806C260 @ case 26
	.4byte _0806C260 @ case 27
	.4byte _0806C260 @ case 28
	.4byte _0806C260 @ case 29
_0806C260:
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #8
	bl CpuFastSet
	adds r5, #0x20
	adds r4, #0x20
	adds r1, r7, #1
	mov r6, r8
	adds r6, #0x4c
	b _0806C290
_0806C276:
	adds r5, #2
	adds r4, #2
	adds r1, r7, #1
	mov r6, r8
	adds r6, #0x4c
	movs r2, #0
	movs r0, #0xe
_0806C284:
	strh r2, [r4]
	adds r5, #2
	adds r4, #2
	subs r0, #1
	cmp r0, #0
	bge _0806C284
_0806C290:
	adds r7, r1, #0
	cmp r7, #0x1f
	ble _0806C1CA
	ldr r0, _0806C2C0  @ gEfxPal
	movs r1, #0xa0
	lsls r1, r1, #0x13
	movs r2, #0x80
	lsls r2, r2, #1
	bl CpuFastSet
	bl DisablePaletteSync
	ldrh r1, [r6]
	movs r2, #0
	ldrsh r0, [r6, r2]
	cmp r0, #0x12
	bne _0806C2C4
	movs r0, #0
	strh r0, [r6]
	mov r0, r8
	bl Proc_Break
	b _0806C2C8
	.align 2, 0
_0806C2C0: .4byte gEfxPal
_0806C2C4:
	adds r0, r1, #1
	strh r0, [r6]
_0806C2C8:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_806C1B8

	THUMB_FUNC_START sub_806C2D4
sub_806C2D4: @ 0x0806C2D4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	str r0, [sp, #4]
	ldr r6, _0806C314  @ gPaletteBuffer
	ldr r5, _0806C318  @ gEfxPal
	adds r0, #0x4c
	movs r1, #0
	ldrsh r3, [r0, r1]
	movs r0, #0x12
	str r0, [sp]
	movs r0, #0
	movs r1, #0x10
	movs r2, #0
	bl Interpolate
	str r0, [sp, #8]
	ldrh r0, [r6]
	strh r0, [r5]
	movs r4, #0
_0806C302:
	subs r0, r4, #1
	cmp r0, #0x1d
	bhi _0806C3B2
	lsls r0, r0, #2
	ldr r1, _0806C31C  @ _0806C320
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0806C314: .4byte gPaletteBuffer
_0806C318: .4byte gEfxPal
_0806C31C: .4byte _0806C320
_0806C320: @ jump table
	.4byte _0806C398 @ case 0
	.4byte _0806C398 @ case 1
	.4byte _0806C398 @ case 2
	.4byte _0806C3B2 @ case 3
	.4byte _0806C3B2 @ case 4
	.4byte _0806C3B2 @ case 5
	.4byte _0806C3B2 @ case 6
	.4byte _0806C3B2 @ case 7
	.4byte _0806C3B2 @ case 8
	.4byte _0806C3B2 @ case 9
	.4byte _0806C3B2 @ case 10
	.4byte _0806C3B2 @ case 11
	.4byte _0806C3B2 @ case 12
	.4byte _0806C3B2 @ case 13
	.4byte _0806C3B2 @ case 14
	.4byte _0806C398 @ case 15
	.4byte _0806C3B2 @ case 16
	.4byte _0806C3B2 @ case 17
	.4byte _0806C3B2 @ case 18
	.4byte _0806C3B2 @ case 19
	.4byte _0806C398 @ case 20
	.4byte _0806C398 @ case 21
	.4byte _0806C3B2 @ case 22
	.4byte _0806C3B2 @ case 23
	.4byte _0806C3B2 @ case 24
	.4byte _0806C3B2 @ case 25
	.4byte _0806C398 @ case 26
	.4byte _0806C398 @ case 27
	.4byte _0806C398 @ case 28
	.4byte _0806C398 @ case 29
_0806C398:
	adds r0, r6, #0
	adds r1, r5, #0
	movs r2, #8
	bl CpuFastSet
	adds r6, #0x20
	adds r5, #0x20
	ldr r2, [sp, #4]
	adds r2, #0x4c
	mov r8, r2
	adds r4, #1
	mov sl, r4
	b _0806C416
_0806C3B2:
	adds r6, #2
	adds r5, #2
	ldr r3, [sp, #4]
	adds r3, #0x4c
	mov r8, r3
	adds r4, #1
	mov sl, r4
	movs r0, #0x1f
	mov r9, r0
	movs r7, #0x1f
	movs r0, #0x10
	ldr r1, [sp, #8]
	subs r4, r0, r1
	movs r2, #0xe
	mov ip, r2
_0806C3D0:
	ldrh r1, [r6]
	adds r0, r7, #0
	ands r0, r1
	adds r3, r0, #0
	muls r3, r4, r3
	asrs r3, r3, #4
	lsls r1, r1, #0x10
	lsrs r0, r1, #0x15
	mov r2, r9
	ands r0, r2
	adds r2, r0, #0
	muls r2, r4, r2
	asrs r2, r2, #4
	lsrs r1, r1, #0x1a
	mov r0, r9
	ands r1, r0
	adds r0, r1, #0
	muls r0, r4, r0
	asrs r0, r0, #4
	ands r0, r7
	lsls r0, r0, #0xa
	ands r2, r7
	lsls r2, r2, #5
	orrs r0, r2
	ands r3, r7
	orrs r3, r0
	strh r3, [r5]
	adds r6, #2
	adds r5, #2
	movs r1, #1
	negs r1, r1
	add ip, r1
	mov r2, ip
	cmp r2, #0
	bge _0806C3D0
_0806C416:
	mov r4, sl
	cmp r4, #0x1f
	bgt _0806C41E
	b _0806C302
_0806C41E:
	ldr r0, _0806C448  @ gEfxPal
	movs r1, #0xa0
	lsls r1, r1, #0x13
	movs r2, #0x80
	lsls r2, r2, #1
	bl CpuFastSet
	bl DisablePaletteSync
	mov r3, r8
	ldrh r1, [r3]
	movs r2, #0
	ldrsh r0, [r3, r2]
	cmp r0, #0x12
	bne _0806C44C
	movs r0, #0
	strh r0, [r3]
	ldr r0, [sp, #4]
	bl Proc_Break
	b _0806C452
	.align 2, 0
_0806C448: .4byte gEfxPal
_0806C44C:
	adds r0, r1, #1
	mov r3, r8
	strh r0, [r3]
_0806C452:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_806C2D4

	THUMB_FUNC_START sub_806C464
sub_806C464: @ 0x0806C464
	push {lr}
	ldr r0, _0806C474  @ gUnknown_085D8CE4
	movs r1, #0
	bl Proc_Start
	pop {r0}
	bx r0
	.align 2, 0
_0806C474: .4byte gUnknown_085D8CE4

	THUMB_FUNC_END sub_806C464

	THUMB_FUNC_START sub_806C478
sub_806C478: @ 0x0806C478
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	str r0, [sp, #4]
	ldr r6, _0806C4B8  @ gPaletteBuffer
	ldr r5, _0806C4BC  @ gEfxPal
	adds r0, #0x4c
	movs r1, #0
	ldrsh r3, [r0, r1]
	movs r0, #8
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0x10
	bl Interpolate
	str r0, [sp, #8]
	ldrh r0, [r6]
	strh r0, [r5]
	movs r4, #0
_0806C4A6:
	subs r0, r4, #1
	cmp r0, #0x1d
	bhi _0806C556
	lsls r0, r0, #2
	ldr r1, _0806C4C0  @ _0806C4C4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0806C4B8: .4byte gPaletteBuffer
_0806C4BC: .4byte gEfxPal
_0806C4C0: .4byte _0806C4C4
_0806C4C4: @ jump table
	.4byte _0806C53C @ case 0
	.4byte _0806C53C @ case 1
	.4byte _0806C53C @ case 2
	.4byte _0806C556 @ case 3
	.4byte _0806C556 @ case 4
	.4byte _0806C556 @ case 5
	.4byte _0806C556 @ case 6
	.4byte _0806C556 @ case 7
	.4byte _0806C556 @ case 8
	.4byte _0806C556 @ case 9
	.4byte _0806C556 @ case 10
	.4byte _0806C556 @ case 11
	.4byte _0806C556 @ case 12
	.4byte _0806C556 @ case 13
	.4byte _0806C556 @ case 14
	.4byte _0806C53C @ case 15
	.4byte _0806C556 @ case 16
	.4byte _0806C556 @ case 17
	.4byte _0806C556 @ case 18
	.4byte _0806C556 @ case 19
	.4byte _0806C53C @ case 20
	.4byte _0806C53C @ case 21
	.4byte _0806C556 @ case 22
	.4byte _0806C556 @ case 23
	.4byte _0806C556 @ case 24
	.4byte _0806C556 @ case 25
	.4byte _0806C53C @ case 26
	.4byte _0806C53C @ case 27
	.4byte _0806C53C @ case 28
	.4byte _0806C53C @ case 29
_0806C53C:
	adds r0, r6, #0
	adds r1, r5, #0
	movs r2, #8
	bl CpuFastSet
	adds r6, #0x20
	adds r5, #0x20
	ldr r2, [sp, #4]
	adds r2, #0x4c
	mov r8, r2
	adds r4, #1
	mov sl, r4
	b _0806C5BA
_0806C556:
	adds r6, #2
	adds r5, #2
	ldr r3, [sp, #4]
	adds r3, #0x4c
	mov r8, r3
	adds r4, #1
	mov sl, r4
	movs r0, #0x1f
	mov r9, r0
	movs r7, #0x1f
	movs r0, #0x10
	ldr r1, [sp, #8]
	subs r4, r0, r1
	movs r2, #0xe
	mov ip, r2
_0806C574:
	ldrh r1, [r6]
	adds r0, r7, #0
	ands r0, r1
	adds r3, r0, #0
	muls r3, r4, r3
	asrs r3, r3, #4
	lsls r1, r1, #0x10
	lsrs r0, r1, #0x15
	mov r2, r9
	ands r0, r2
	adds r2, r0, #0
	muls r2, r4, r2
	asrs r2, r2, #4
	lsrs r1, r1, #0x1a
	mov r0, r9
	ands r1, r0
	adds r0, r1, #0
	muls r0, r4, r0
	asrs r0, r0, #4
	ands r0, r7
	lsls r0, r0, #0xa
	ands r2, r7
	lsls r2, r2, #5
	orrs r0, r2
	ands r3, r7
	orrs r3, r0
	strh r3, [r5]
	adds r6, #2
	adds r5, #2
	movs r1, #1
	negs r1, r1
	add ip, r1
	mov r2, ip
	cmp r2, #0
	bge _0806C574
_0806C5BA:
	mov r4, sl
	cmp r4, #0x1f
	bgt _0806C5C2
	b _0806C4A6
_0806C5C2:
	ldr r0, _0806C5EC  @ gEfxPal
	movs r1, #0xa0
	lsls r1, r1, #0x13
	movs r2, #0x80
	lsls r2, r2, #1
	bl CpuFastSet
	bl DisablePaletteSync
	mov r3, r8
	ldrh r1, [r3]
	movs r2, #0
	ldrsh r0, [r3, r2]
	cmp r0, #8
	bne _0806C5F0
	movs r0, #0
	strh r0, [r3]
	ldr r0, [sp, #4]
	bl Proc_Break
	b _0806C5F6
	.align 2, 0
_0806C5EC: .4byte gEfxPal
_0806C5F0:
	adds r0, r1, #1
	mov r3, r8
	strh r0, [r3]
_0806C5F6:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_806C478

	THUMB_FUNC_START sub_806C608
sub_806C608: @ 0x0806C608
	push {lr}
	ldr r0, _0806C618  @ gUnknown_085D8D14
	movs r1, #0
	bl Proc_Start
	pop {r0}
	bx r0
	.align 2, 0
_0806C618: .4byte gUnknown_085D8D14

	THUMB_FUNC_END sub_806C608
