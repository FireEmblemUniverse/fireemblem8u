	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	THUMB_FUNC_START StartSpellAnimDummy
StartSpellAnimDummy: @ 0x0805BE90
	push {r4, lr}
	adds r4, r0, #0
	bl SpellFx_Begin
	bl SpellFx_ClearBG1Position
	ldr r0, _0805BEB0  @ ProcScr_efxDummymagic
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805BEB0: .4byte ProcScr_efxDummymagic

	THUMB_FUNC_END StartSpellAnimDummy

	THUMB_FUNC_START Loop6C_efxDummymagic
Loop6C_efxDummymagic: @ 0x0805BEB4
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x5c]
	bl GetAnimAnotherSide
	adds r4, r0, #0
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	movs r6, #0
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _0805BEDA
	ldrh r0, [r4, #0x10]
	movs r1, #9
	orrs r0, r1
	strh r0, [r4, #0x10]
	b _0805BF02
_0805BEDA:
	cmp r0, #0xa
	bne _0805BF02
	adds r0, r4, #0
	bl GetAnimNextRoundType
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #1
	negs r1, r1
	cmp r0, r1
	beq _0805BEF8
	ldrh r0, [r4, #0x10]
	movs r1, #2
	orrs r0, r1
	strh r0, [r4, #0x10]
_0805BEF8:
	bl SpellFx_Finish
	adds r0, r5, #0
	bl Proc_Break
_0805BF02:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END Loop6C_efxDummymagic

	THUMB_FUNC_START StartSpellAnimHandAxe
StartSpellAnimHandAxe: @ 0x0805BF08
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl SpellFx_ClearBG1Position
	ldr r0, _0805BF3C  @ ProcScr_efxTeono
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
_0805BF3C: .4byte ProcScr_efxTeono

	THUMB_FUNC_END StartSpellAnimHandAxe

	THUMB_FUNC_START sub_805BF40
sub_805BF40: @ 0x0805BF40
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x5c]
	bl GetAnimAnotherSide
	adds r6, r0, #0
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _0805BFC0
	ldr r0, [r5, #0x5c]
	movs r1, #1
	negs r1, r1
	bl NewEfxFarAttackWithDistance
	ldr r0, [r5, #0x5c]
	bl sub_805BFDC
	movs r1, #0x2c
	ldrsh r0, [r5, r1]
	cmp r0, #1
	bne _0805BFC0
	ldrh r0, [r6, #0x10]
	movs r1, #9
	orrs r0, r1
	strh r0, [r6, #0x10]
	adds r4, r5, #0
	adds r4, #0x29
	ldrb r1, [r4]
	adds r0, r6, #0
	bl StartBattleAnimHitEffectsDefault
	adds r0, r6, #0
	bl GetEfxHpChangeType
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #2
	beq _0805BFB2
	ldr r0, [r5, #0x5c]
	bl CheckRoundCrit
	cmp r0, #1
	bne _0805BFA6
	adds r0, r6, #0
	bl NewEfxPierceCritical
	b _0805BFB2
_0805BFA6:
	ldrb r0, [r4]
	cmp r0, #0
	bne _0805BFD6
	ldr r0, [r5, #0x5c]
	bl NewEfxNormalEffect
_0805BFB2:
	ldrb r0, [r4]
	cmp r0, #0
	bne _0805BFD6
	adds r0, r6, #0
	bl EfxPlayHittedSFX
	b _0805BFD6
_0805BFC0:
	movs r1, #0x2c
	ldrsh r0, [r5, r1]
	cmp r0, #0x46
	beq _0805BFD6
	cmp r0, #0x50
	bne _0805BFD6
	bl SpellFx_Finish
	adds r0, r5, #0
	bl Proc_Break
_0805BFD6:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_805BF40

	THUMB_FUNC_START sub_805BFDC
sub_805BFDC: @ 0x0805BFDC
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r1, _0805C020  @ gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805C024  @ ProcScr_efxTeonoOBJ
	movs r1, #3
	bl Proc_Start
	adds r6, r0, #0
	str r4, [r6, #0x5c]
	movs r0, #0
	strh r0, [r6, #0x2c]
	ldr r1, _0805C028  @ gUnknown_085DA6FC
	ldr r2, _0805C02C  @ gUnknown_085DA364
	ldr r3, _0805C030  @ gUnknown_085DA758
	ldr r0, _0805C034  @ gUnknown_085DA3C0
	str r0, [sp]
	adds r0, r4, #0
	bl EfxCreateFrontAnim
	adds r5, r0, #0
	str r5, [r6, #0x60]
	adds r0, r4, #0
	bl GetAnimPosition
	cmp r0, #0
	bne _0805C038
	ldrh r0, [r5, #2]
	adds r0, #0x48
	b _0805C03C
	.align 2, 0
_0805C020: .4byte gEfxBgSemaphore
_0805C024: .4byte ProcScr_efxTeonoOBJ
_0805C028: .4byte gUnknown_085DA6FC
_0805C02C: .4byte gUnknown_085DA364
_0805C030: .4byte gUnknown_085DA758
_0805C034: .4byte gUnknown_085DA3C0
_0805C038:
	ldrh r0, [r5, #2]
	subs r0, #0x48
_0805C03C:
	strh r0, [r5, #2]
	ldr r0, _0805C04C  @ gEkrDistanceType
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _0805C050
	movs r0, #0x23
	b _0805C052
	.align 2, 0
_0805C04C: .4byte gEkrDistanceType
_0805C050:
	movs r0, #0xa
_0805C052:
	strh r0, [r6, #0x2e]
	ldr r0, [r6, #0x5c]
	ldr r1, [r6, #0x60]
	bl sub_805C1C8
	str r0, [r6, #0x64]
	ldr r0, _0805C078  @ gUnknown_085DA05C
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _0805C07C  @ gUnknown_085D9C5C
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0805C078: .4byte gUnknown_085DA05C
_0805C07C: .4byte gUnknown_085D9C5C

	THUMB_FUNC_END sub_805BFDC

	THUMB_FUNC_START sub_805C080
sub_805C080: @ 0x0805C080
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
	bne _0805C0D6
	ldr r1, _0805C0C4  @ gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	ldr r0, [r4, #0x60]
	bl AnimDelete
	ldr r0, _0805C0C8  @ gEkrDistanceType
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _0805C0D0
	ldr r0, _0805C0CC  @ gUnknown_02017758
	movs r1, #1
	str r1, [r0]
	ldr r0, [r4, #0x64]
	bl Proc_End
	adds r0, r4, #0
	bl Proc_End
	b _0805C0D6
	.align 2, 0
_0805C0C4: .4byte gEfxBgSemaphore
_0805C0C8: .4byte gEkrDistanceType
_0805C0CC: .4byte gUnknown_02017758
_0805C0D0:
	adds r0, r4, #0
	bl Proc_Break
_0805C0D6:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_805C080

	THUMB_FUNC_START sub_805C0DC
sub_805C0DC: @ 0x0805C0DC
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _0805C100  @ gUnknown_02017754
	movs r0, #0
	str r0, [r1]
	ldr r0, [r4, #0x64]
	bl Proc_End
	ldr r0, [r4, #0x5c]
	bl sub_805C104
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805C100: .4byte gUnknown_02017754

	THUMB_FUNC_END sub_805C0DC

	THUMB_FUNC_START sub_805C104
sub_805C104: @ 0x0805C104
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r1, _0805C144  @ gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805C148  @ ProcScr_efxTeonoOBJ2
	movs r1, #3
	bl Proc_Start
	adds r6, r0, #0
	str r4, [r6, #0x5c]
	movs r0, #0
	strh r0, [r6, #0x2c]
	ldr r3, _0805C14C  @ gUnknown_085DA778
	ldr r2, _0805C150  @ gUnknown_085DA3E0
	str r2, [sp]
	adds r0, r4, #0
	adds r1, r3, #0
	bl EfxCreateFrontAnim
	adds r5, r0, #0
	str r5, [r6, #0x60]
	adds r0, r4, #0
	bl GetAnimPosition
	cmp r0, #0
	bne _0805C154
	ldrh r0, [r5, #2]
	adds r0, #0x48
	b _0805C158
	.align 2, 0
_0805C144: .4byte gEfxBgSemaphore
_0805C148: .4byte ProcScr_efxTeonoOBJ2
_0805C14C: .4byte gUnknown_085DA778
_0805C150: .4byte gUnknown_085DA3E0
_0805C154:
	ldrh r0, [r5, #2]
	subs r0, #0x48
_0805C158:
	strh r0, [r5, #2]
	ldr r0, _0805C180  @ gUnknown_085DA05C
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _0805C184  @ gUnknown_085D9C5C
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	ldr r0, [r6, #0x5c]
	ldr r1, [r6, #0x60]
	bl sub_805C1C8
	str r0, [r6, #0x64]
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0805C180: .4byte gUnknown_085DA05C
_0805C184: .4byte gUnknown_085D9C5C

	THUMB_FUNC_END sub_805C104

	THUMB_FUNC_START sub_805C188
sub_805C188: @ 0x0805C188
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x11
	bne _0805C1BA
	ldr r1, _0805C1C0  @ gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	ldr r1, _0805C1C4  @ gUnknown_02017758
	movs r0, #1
	str r0, [r1]
	ldr r0, [r4, #0x64]
	bl Proc_End
	ldr r0, [r4, #0x60]
	bl AnimDelete
	adds r0, r4, #0
	bl Proc_Break
_0805C1BA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805C1C0: .4byte gEfxBgSemaphore
_0805C1C4: .4byte gUnknown_02017758

	THUMB_FUNC_END sub_805C188

	THUMB_FUNC_START sub_805C1C8
sub_805C1C8: @ 0x0805C1C8
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r5, r1, #0
	ldr r1, _0805C204  @ gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805C208  @ ProcScr_efxTeonoSE
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	str r6, [r4, #0x5c]
	str r5, [r4, #0x60]
	movs r0, #0
	strh r0, [r4, #0x2c]
	movs r0, #1
	strh r0, [r4, #0x2e]
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #2
	ldrsh r2, [r6, r0]
	movs r0, #0xcd
	movs r3, #1
	bl PlaySFX
	adds r0, r4, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0805C204: .4byte gEfxBgSemaphore
_0805C208: .4byte ProcScr_efxTeonoSE

	THUMB_FUNC_END sub_805C1C8

	THUMB_FUNC_START sub_805C20C
sub_805C20C: @ 0x0805C20C
	ldr r1, _0805C218  @ gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bx lr
	.align 2, 0
_0805C218: .4byte gEfxBgSemaphore

	THUMB_FUNC_END sub_805C20C

	THUMB_FUNC_START sub_805C21C
sub_805C21C: @ 0x0805C21C
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #8
	bne _0805C25C
	ldr r0, [r4, #0x60]
	bl GetProperAnimSoundLocation
	ldr r1, [r4, #0x60]
	ldrh r2, [r1, #2]
	adds r2, r2, r0
	movs r1, #0x80
	lsls r1, r1, #1
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	movs r0, #0xcd
	movs r3, #1
	bl PlaySFX
	movs r0, #0
	strh r0, [r4, #0x2c]
	ldrh r1, [r4, #0x2e]
	movs r2, #0x2e
	ldrsh r0, [r4, r2]
	cmp r0, #8
	bgt _0805C25C
	adds r0, r1, #1
	strh r0, [r4, #0x2e]
_0805C25C:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_805C21C

	THUMB_FUNC_START StartSpellAnimArrow
StartSpellAnimArrow: @ 0x0805C264
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl SpellFx_ClearBG1Position
	ldr r0, _0805C298  @ ProcScr_efxArrow
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
_0805C298: .4byte ProcScr_efxArrow

	THUMB_FUNC_END StartSpellAnimArrow

	THUMB_FUNC_START sub_805C29C
sub_805C29C: @ 0x0805C29C
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x5c]
	bl GetAnimAnotherSide
	adds r6, r0, #0
	bl EfxGetCamMovDuration
	adds r4, r0, #0
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _0805C334
	ldr r0, [r5, #0x5c]
	movs r1, #1
	negs r1, r1
	bl NewEfxFarAttackWithDistance
	ldr r0, [r5, #0x5c]
	bl sub_805C358
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r0, [r5, #0x5c]
	movs r3, #2
	ldrsh r2, [r0, r3]
	movs r0, #0xcc
	movs r3, #1
	bl PlaySFX
	movs r1, #0x2c
	ldrsh r0, [r5, r1]
	cmp r0, #1
	bne _0805C334
	ldrh r0, [r6, #0x10]
	movs r1, #9
	orrs r0, r1
	strh r0, [r6, #0x10]
	adds r4, r5, #0
	adds r4, #0x29
	ldrb r1, [r4]
	adds r0, r6, #0
	bl StartBattleAnimHitEffectsDefault
	adds r0, r6, #0
	bl GetEfxHpChangeType
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #2
	beq _0805C326
	ldr r0, [r5, #0x5c]
	bl CheckRoundCrit
	cmp r0, #1
	bne _0805C31A
	adds r0, r6, #0
	bl NewEfxPierceCritical
	b _0805C326
_0805C31A:
	ldrb r0, [r4]
	cmp r0, #0
	bne _0805C350
	ldr r0, [r5, #0x5c]
	bl NewEfxNormalEffect
_0805C326:
	ldrb r0, [r4]
	cmp r0, #0
	bne _0805C350
	adds r0, r6, #0
	bl EfxPlayHittedSFX
	b _0805C350
_0805C334:
	movs r3, #0x2c
	ldrsh r1, [r5, r3]
	adds r0, r4, #0
	adds r0, #9
	cmp r1, r0
	beq _0805C350
	adds r0, #1
	cmp r1, r0
	bne _0805C350
	bl SpellFx_Finish
	adds r0, r5, #0
	bl Proc_Break
_0805C350:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_805C29C

	THUMB_FUNC_START sub_805C358
sub_805C358: @ 0x0805C358
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r1, _0805C3A0  @ gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805C3A4  @ ProcScr_efxArrowOBJ
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	ldr r1, _0805C3A8  @ gUnknown_085DA8E0
	ldr r2, _0805C3AC  @ gUnknown_085DA854
	ldr r3, _0805C3B0  @ gUnknown_085DA8F0
	ldr r0, _0805C3B4  @ gUnknown_085DA864
	str r0, [sp]
	adds r0, r5, #0
	bl EfxCreateFrontAnim
	str r0, [r4, #0x60]
	ldr r0, _0805C3B8  @ gUnknown_085DA05C
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _0805C3BC  @ gUnknown_085DA7AC
	movs r1, #0x60
	bl SpellFx_RegisterObjGfx
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805C3A0: .4byte gEfxBgSemaphore
_0805C3A4: .4byte ProcScr_efxArrowOBJ
_0805C3A8: .4byte gUnknown_085DA8E0
_0805C3AC: .4byte gUnknown_085DA854
_0805C3B0: .4byte gUnknown_085DA8F0
_0805C3B4: .4byte gUnknown_085DA864
_0805C3B8: .4byte gUnknown_085DA05C
_0805C3BC: .4byte gUnknown_085DA7AC

	THUMB_FUNC_END sub_805C358

	THUMB_FUNC_START sub_805C3C0
sub_805C3C0: @ 0x0805C3C0
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #4
	bne _0805C3E6
	ldr r0, _0805C3EC  @ gEfxBgSemaphore
	ldr r1, [r0]
	subs r1, #1
	str r1, [r0]
	ldr r0, [r4, #0x60]
	bl AnimDelete
	adds r0, r4, #0
	bl Proc_Break
_0805C3E6:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805C3EC: .4byte gEfxBgSemaphore

	THUMB_FUNC_END sub_805C3C0

	THUMB_FUNC_START StartSpellAnimJavelin
StartSpellAnimJavelin: @ 0x0805C3F0
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl SpellFx_ClearBG1Position
	ldr r0, _0805C440  @ ProcScr_efxTeyari
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
	adds r0, r5, #0
	movs r1, #0
	bl sub_805C88C
	ldr r0, _0805C444  @ gUnknown_085DAB30
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _0805C448  @ gUnknown_085DA900
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805C440: .4byte ProcScr_efxTeyari
_0805C444: .4byte gUnknown_085DAB30
_0805C448: .4byte gUnknown_085DA900

	THUMB_FUNC_END StartSpellAnimJavelin

	THUMB_FUNC_START StartSpellAnimJavelinCavalier
StartSpellAnimJavelinCavalier: @ 0x0805C44C
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl SpellFx_ClearBG1Position
	ldr r0, _0805C49C  @ ProcScr_efxTeyari
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
	adds r0, r5, #0
	movs r1, #1
	bl sub_805C88C
	ldr r0, _0805C4A0  @ gUnknown_085DAD6C
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _0805C4A4  @ gUnknown_085DAB50
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805C49C: .4byte ProcScr_efxTeyari
_0805C4A0: .4byte gUnknown_085DAD6C
_0805C4A4: .4byte gUnknown_085DAB50

	THUMB_FUNC_END StartSpellAnimJavelinCavalier

	THUMB_FUNC_START StartSpellAnimJavelinSoldier
StartSpellAnimJavelinSoldier: @ 0x0805C4A8
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl SpellFx_ClearBG1Position
	ldr r0, _0805C4F8  @ ProcScr_efxTeyari
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
	adds r0, r5, #0
	movs r1, #0
	bl sub_805C88C
	ldr r0, _0805C4FC  @ gUnknown_085DAFA4
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _0805C500  @ gUnknown_085DAD8C
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805C4F8: .4byte ProcScr_efxTeyari
_0805C4FC: .4byte gUnknown_085DAFA4
_0805C500: .4byte gUnknown_085DAD8C

	THUMB_FUNC_END StartSpellAnimJavelinSoldier

	THUMB_FUNC_START StartSpellAnimJavelinPaladin
StartSpellAnimJavelinPaladin: @ 0x0805C504
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl SpellFx_ClearBG1Position
	ldr r0, _0805C554  @ ProcScr_efxTeyari
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
	adds r0, r5, #0
	movs r1, #1
	bl sub_805C88C
	ldr r0, _0805C558  @ gUnknown_085DB1E0
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _0805C55C  @ gUnknown_085DAFC4
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805C554: .4byte ProcScr_efxTeyari
_0805C558: .4byte gUnknown_085DB1E0
_0805C55C: .4byte gUnknown_085DAFC4

	THUMB_FUNC_END StartSpellAnimJavelinPaladin

	THUMB_FUNC_START StartSpellAnimJavelinPrgasusKnight
StartSpellAnimJavelinPrgasusKnight: @ 0x0805C560
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl SpellFx_ClearBG1Position
	ldr r0, _0805C5B0  @ ProcScr_efxTeyari
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
	adds r0, r5, #0
	movs r1, #1
	bl sub_805C88C
	ldr r0, _0805C5B4  @ gUnknown_085DB42C
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _0805C5B8  @ gUnknown_085DB200
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805C5B0: .4byte ProcScr_efxTeyari
_0805C5B4: .4byte gUnknown_085DB42C
_0805C5B8: .4byte gUnknown_085DB200

	THUMB_FUNC_END StartSpellAnimJavelinPrgasusKnight

	THUMB_FUNC_START StartSpellAnimJavelinFalcon
StartSpellAnimJavelinFalcon: @ 0x0805C5BC
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl SpellFx_ClearBG1Position
	ldr r0, _0805C60C  @ ProcScr_efxTeyari
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
	adds r0, r5, #0
	movs r1, #1
	bl sub_805C88C
	ldr r0, _0805C610  @ gUnknown_085DB694
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _0805C614  @ gUnknown_085DB44C
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805C60C: .4byte ProcScr_efxTeyari
_0805C610: .4byte gUnknown_085DB694
_0805C614: .4byte gUnknown_085DB44C

	THUMB_FUNC_END StartSpellAnimJavelinFalcon

	THUMB_FUNC_START StartSpellAnimJavelinWyvernRider
StartSpellAnimJavelinWyvernRider: @ 0x0805C618
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl SpellFx_ClearBG1Position
	ldr r0, _0805C668  @ ProcScr_efxTeyari
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
	adds r0, r5, #0
	movs r1, #1
	bl sub_805C88C
	ldr r0, _0805C66C  @ gUnknown_085DB8EC
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _0805C670  @ gUnknown_085DB6B4
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805C668: .4byte ProcScr_efxTeyari
_0805C66C: .4byte gUnknown_085DB8EC
_0805C670: .4byte gUnknown_085DB6B4

	THUMB_FUNC_END StartSpellAnimJavelinWyvernRider

	THUMB_FUNC_START StartSpellAnimJavelinWyvernLord
StartSpellAnimJavelinWyvernLord: @ 0x0805C674
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl SpellFx_ClearBG1Position
	ldr r0, _0805C6C4  @ ProcScr_efxTeyari
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
	adds r0, r5, #0
	movs r1, #1
	bl sub_805C88C
	ldr r0, _0805C6C8  @ gUnknown_085DBB70
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _0805C6CC  @ gUnknown_085DB90C
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805C6C4: .4byte ProcScr_efxTeyari
_0805C6C8: .4byte gUnknown_085DBB70
_0805C6CC: .4byte gUnknown_085DB90C

	THUMB_FUNC_END StartSpellAnimJavelinWyvernLord

	THUMB_FUNC_START StartSpellAnimJavelinGenerial
StartSpellAnimJavelinGenerial: @ 0x0805C6D0
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl SpellFx_ClearBG1Position
	ldr r0, _0805C720  @ ProcScr_efxTeyari
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
	adds r0, r5, #0
	movs r1, #1
	bl sub_805C88C
	ldr r0, _0805C724  @ gUnknown_085DBE00
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _0805C728  @ gUnknown_085DBB90
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805C720: .4byte ProcScr_efxTeyari
_0805C724: .4byte gUnknown_085DBE00
_0805C728: .4byte gUnknown_085DBB90

	THUMB_FUNC_END StartSpellAnimJavelinGenerial

	THUMB_FUNC_START sub_805C72C
sub_805C72C: @ 0x0805C72C
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl SpellFx_ClearBG1Position
	ldr r0, _0805C77C  @ ProcScr_efxTeyari
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
	adds r0, r5, #0
	movs r1, #1
	bl sub_805C88C
	ldr r0, _0805C780  @ gUnknown_085DC050
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _0805C784  @ gUnknown_085DBE20
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805C77C: .4byte ProcScr_efxTeyari
_0805C780: .4byte gUnknown_085DC050
_0805C784: .4byte gUnknown_085DBE20

	THUMB_FUNC_END sub_805C72C

	THUMB_FUNC_START StartSpellAnimJavelinPaladinF
StartSpellAnimJavelinPaladinF: @ 0x0805C788
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl SpellFx_ClearBG1Position
	ldr r0, _0805C7D8  @ ProcScr_efxTeyari
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
	adds r0, r5, #0
	movs r1, #1
	bl sub_805C88C
	ldr r0, _0805C7DC  @ gUnknown_085DB1E0
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _0805C7E0  @ gUnknown_085DAFC4
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805C7D8: .4byte ProcScr_efxTeyari
_0805C7DC: .4byte gUnknown_085DB1E0
_0805C7E0: .4byte gUnknown_085DAFC4

	THUMB_FUNC_END StartSpellAnimJavelinPaladinF

	THUMB_FUNC_START sub_805C7E4
sub_805C7E4: @ 0x0805C7E4
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _0805C870
	ldr r0, [r5, #0x5c]
	movs r1, #1
	negs r1, r1
	bl NewEfxFarAttackWithDistance
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r0, [r5, #0x5c]
	movs r3, #2
	ldrsh r2, [r0, r3]
	movs r0, #0xca
	movs r3, #1
	bl PlaySFX
	movs r1, #0x2c
	ldrsh r0, [r5, r1]
	cmp r0, #1
	bne _0805C870
	ldr r0, [r5, #0x5c]
	bl GetAnimAnotherSide
	adds r6, r0, #0
	ldrh r0, [r6, #0x10]
	movs r1, #9
	orrs r0, r1
	strh r0, [r6, #0x10]
	adds r4, r5, #0
	adds r4, #0x29
	ldrb r1, [r4]
	adds r0, r6, #0
	bl StartBattleAnimHitEffectsDefault
	adds r0, r6, #0
	bl GetEfxHpChangeType
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #2
	beq _0805C862
	ldr r0, [r5, #0x5c]
	bl CheckRoundCrit
	cmp r0, #1
	bne _0805C856
	adds r0, r6, #0
	bl NewEfxPierceCritical
	b _0805C862
_0805C856:
	ldrb r0, [r4]
	cmp r0, #0
	bne _0805C886
	ldr r0, [r5, #0x5c]
	bl NewEfxNormalEffect
_0805C862:
	ldrb r0, [r4]
	cmp r0, #0
	bne _0805C886
	adds r0, r6, #0
	bl EfxPlayHittedSFX
	b _0805C886
_0805C870:
	movs r3, #0x2c
	ldrsh r0, [r5, r3]
	cmp r0, #0xe
	beq _0805C886
	cmp r0, #0x10
	bne _0805C886
	bl SpellFx_Finish
	adds r0, r5, #0
	bl Proc_Break
_0805C886:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_805C7E4

	THUMB_FUNC_START sub_805C88C
sub_805C88C: @ 0x0805C88C
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	adds r4, r1, #0
	ldr r1, _0805C8B8  @ gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805C8BC  @ ProcScr_efxTeyariOBJ
	movs r1, #3
	bl Proc_Start
	adds r5, r0, #0
	str r6, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	cmp r4, #0
	bne _0805C8C8
	ldr r2, _0805C8C0  @ gUnknown_085DC244
	ldr r3, _0805C8C4  @ gUnknown_085DC498
	b _0805C8CC
	.align 2, 0
_0805C8B8: .4byte gEfxBgSemaphore
_0805C8BC: .4byte ProcScr_efxTeyariOBJ
_0805C8C0: .4byte gUnknown_085DC244
_0805C8C4: .4byte gUnknown_085DC498
_0805C8C8:
	ldr r2, _0805C8EC  @ gUnknown_085DC6F8
	ldr r3, _0805C8F0  @ gUnknown_085DC958
_0805C8CC:
	str r2, [sp]
	adds r0, r6, #0
	adds r1, r3, #0
	bl EfxCreateFrontAnim
	adds r4, r0, #0
	str r4, [r5, #0x60]
	adds r0, r6, #0
	bl GetAnimPosition
	cmp r0, #0
	bne _0805C8F4
	ldrh r0, [r4, #2]
	adds r0, #0x38
	b _0805C8F8
	.align 2, 0
_0805C8EC: .4byte gUnknown_085DC6F8
_0805C8F0: .4byte gUnknown_085DC958
_0805C8F4:
	ldrh r0, [r4, #2]
	subs r0, #0x38
_0805C8F8:
	strh r0, [r4, #2]
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_805C88C

	THUMB_FUNC_START sub_805C904
sub_805C904: @ 0x0805C904
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xc
	bne _0805C92A
	ldr r0, _0805C930  @ gEfxBgSemaphore
	ldr r1, [r0]
	subs r1, #1
	str r1, [r0]
	ldr r0, [r4, #0x60]
	bl AnimDelete
	adds r0, r4, #0
	bl Proc_Break
_0805C92A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805C930: .4byte gEfxBgSemaphore

	THUMB_FUNC_END sub_805C904
