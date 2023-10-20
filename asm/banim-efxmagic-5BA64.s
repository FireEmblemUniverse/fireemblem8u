	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	THUMB_FUNC_START EfxALPHAMain
EfxALPHAMain: @ 0x0805BA64
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x2e
	ldrsh r1, [r5, r2]
	cmp r0, r1
	blt _0805BB18
	ldr r1, [r5, #0x44]
	ldr r2, [r5, #0x48]
	movs r6, #0x2c
	ldrsh r3, [r5, r6]
	movs r0, #0x2e
	ldrsh r4, [r5, r0]
	subs r3, r3, r4
	movs r6, #0x30
	ldrsh r0, [r5, r6]
	subs r0, r0, r4
	str r0, [sp]
	movs r0, #0
	bl Interpolate
	adds r4, r0, #0
	ldr r0, [r5, #0x4c]
	cmp r0, #1
	beq _0805BAC0
	cmp r0, #1
	bgt _0805BAAA
	cmp r0, #0
	beq _0805BAB0
	b _0805BAFE
_0805BAAA:
	cmp r0, #2
	beq _0805BAD0
	b _0805BAFE
_0805BAB0:
	lsls r1, r4, #0x18
	lsrs r1, r1, #0x18
	movs r0, #1
	movs r2, #0x10
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	b _0805BAFE
_0805BAC0:
	lsls r3, r4, #0x18
	lsrs r3, r3, #0x18
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl SetSpecialColorEffectsParameters
	b _0805BAFE
_0805BAD0:
	movs r0, #0x2c
	ldrsh r3, [r5, r0]
	movs r2, #0x2e
	ldrsh r1, [r5, r2]
	subs r3, r3, r1
	movs r6, #0x30
	ldrsh r0, [r5, r6]
	subs r0, r0, r1
	str r0, [sp]
	movs r0, #0
	movs r1, #8
	movs r2, #0x10
	bl Interpolate
	adds r2, r0, #0
	lsls r1, r4, #0x18
	lsrs r1, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	movs r0, #1
	movs r3, #0
	bl SetSpecialColorEffectsParameters
_0805BAFE:
	movs r0, #0x2c
	ldrsh r1, [r5, r0]
	movs r2, #0x30
	ldrsh r0, [r5, r2]
	cmp r1, r0
	blt _0805BB18
	ldr r1, _0805BB20  @ gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r5, #0
	bl Proc_Break
_0805BB18:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0805BB20: .4byte gEfxBgSemaphore

	THUMB_FUNC_END EfxALPHAMain

	THUMB_FUNC_START sub_805BB24
sub_805BB24: @ 0x0805BB24
	push {r4, r5, r6, lr}
	mov r6, sl
	mov r5, r9
	mov r4, r8
	push {r4, r5, r6}
	mov r8, r0
	mov r9, r1
	mov sl, r2
	adds r5, r3, #0
	ldr r6, [sp, #0x1c]
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	lsls r6, r6, #0x10
	lsrs r6, r6, #0x10
	ldr r1, _0805BB7C  @ gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805BB80  @ ProcScr_efxCircleWIN
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	mov r0, r8
	str r0, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	strh r0, [r4, #0x2e]
	mov r0, r9
	str r0, [r4, #0x44]
	mov r0, sl
	str r0, [r4, #0x54]
	mov r0, r8
	bl GetAnimAnotherSide
	strh r5, [r4, #0x32]
	strh r6, [r4, #0x3a]
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0805BB7C: .4byte gEfxBgSemaphore
_0805BB80: .4byte ProcScr_efxCircleWIN

	THUMB_FUNC_END sub_805BB24

	THUMB_FUNC_START EfxCircleWINMain
EfxCircleWINMain: @ 0x0805BB84
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	adds r5, r0, #0
	ldr r0, _0805BC04  @ gUnknown_0201FB2C
	ldr r0, [r0]
	ldr r1, _0805BC08  @ gUnknown_0201FB38
	mov r8, r1
	cmp r0, #0
	bne _0805BB9E
	ldr r2, _0805BC0C  @ gUnknown_0201FC78
	mov r8, r2
_0805BB9E:
	ldr r4, [r5, #0x54]
	movs r7, #0x2e
	ldrsh r0, [r5, r7]
	lsls r0, r0, #1
	adds r0, r0, r4
	ldrh r7, [r0]
	adds r0, r7, #0
	bl sub_8013278
	adds r6, r0, #0
	movs r1, #0x2e
	ldrsh r0, [r5, r1]
	lsls r0, r0, #1
	adds r0, r0, r4
	ldrh r1, [r0, #2]
	ldr r0, _0805BC10  @ 0x0000FFFF
	cmp r1, r0
	beq _0805BBC8
	ldrh r0, [r5, #0x2e]
	adds r0, #1
	strh r0, [r5, #0x2e]
_0805BBC8:
	ldrh r1, [r5, #0x3a]
	subs r0, r1, r7
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r0, #0
	bge _0805BBD6
	movs r2, #0
_0805BBD6:
	adds r0, r7, r1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xa0
	ble _0805BBE4
	movs r1, #0xa0
_0805BBE4:
	movs r3, #0
	lsls r0, r2, #0x10
	ldr r2, [r5, #0x44]
	mov ip, r2
	asrs r0, r0, #0x10
	mov r9, r0
	lsls r0, r1, #0x10
	asrs r4, r0, #0x10
_0805BBF4:
	cmp r9, r3
	bhi _0805BBFC
	cmp r4, r3
	bcs _0805BC14
_0805BBFC:
	movs r0, #0
	mov r7, r8
	strh r0, [r7]
	b _0805BC44
	.align 2, 0
_0805BC04: .4byte gUnknown_0201FB2C
_0805BC08: .4byte gUnknown_0201FB38
_0805BC0C: .4byte gUnknown_0201FC78
_0805BC10: .4byte 0x0000FFFF
_0805BC14:
	ldrh r2, [r5, #0x32]
	ldrh r1, [r6]
	adds r0, r2, r1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r0, #0
	bge _0805BC24
	movs r1, #0
_0805BC24:
	ldrh r7, [r6, #2]
	adds r0, r2, r7
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xf0
	ble _0805BC34
	movs r2, #0xf0
_0805BC34:
	lsls r1, r1, #0x10
	asrs r1, r1, #8
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	orrs r0, r1
	mov r1, r8
	strh r0, [r1]
	adds r6, #4
_0805BC44:
	movs r2, #2
	add r8, r2
	adds r3, #1
	cmp r3, #0x9f
	bls _0805BBF4
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	strh r0, [r5, #0x2c]
	movs r7, #0x2c
	ldrsh r0, [r5, r7]
	cmp r0, ip
	bne _0805BC6E
	ldr r1, _0805BC7C  @ gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SetDefaultColorEffects
	adds r0, r5, #0
	bl Proc_Break
_0805BC6E:
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805BC7C: .4byte gEfxBgSemaphore

	THUMB_FUNC_END EfxCircleWINMain

	THUMB_FUNC_START StartSpellThing_MagicQuake
StartSpellThing_MagicQuake: @ 0x0805BC80
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r6, r0, #0
	mov r8, r1
	adds r5, r2, #0
	ldr r1, _0805BCBC  @ gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805BCC0  @ ProcScr_efxMagicQUAKE
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	str r6, [r4, #0x5c]
	adds r0, r5, #0
	movs r1, #0
	bl NewEfxQuakePure
	str r0, [r4, #0x60]
	movs r0, #0
	strh r0, [r4, #0x2c]
	mov r0, r8
	strh r0, [r4, #0x2e]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0805BCBC: .4byte gEfxBgSemaphore
_0805BCC0: .4byte ProcScr_efxMagicQUAKE

	THUMB_FUNC_END StartSpellThing_MagicQuake

	THUMB_FUNC_START Loop6C_efxMagicQUAKE
Loop6C_efxMagicQUAKE: @ 0x0805BCC4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	mov r8, r0
	ldr r5, _0805BD54  @ gEkrBg2QuakeVec
	ldrh r1, [r5]
	ldrh r2, [r5, #2]
	movs r0, #2
	bl BG_SetPosition
	ldr r4, _0805BD58  @ gEkrBg0QuakeVec
	ldrh r1, [r4]
	ldrh r0, [r5]
	adds r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldrh r2, [r4, #2]
	ldrh r3, [r5, #2]
	adds r2, r2, r3
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #0
	bl BG_SetPosition
	ldrh r0, [r4]
	ldrh r1, [r5]
	adds r0, r0, r1
	negs r0, r0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldrh r1, [r4, #2]
	ldrh r2, [r5, #2]
	adds r1, r1, r2
	negs r1, r1
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl EkrGauge_Setxy323A
	ldrh r0, [r4]
	ldrh r3, [r5]
	adds r0, r0, r3
	negs r0, r0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r1, [r4, #2]
	ldrh r2, [r5, #2]
	adds r1, r1, r2
	negs r1, r1
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	bl sub_8051B5C
	bl GetBanimDragonStatusType
	cmp r0, #0
	beq _0805BD42
	ldrh r1, [r5]
	ldrh r2, [r5, #2]
	movs r0, #3
	bl BG_SetPosition
_0805BD42:
	bl GetBanimDragonStatusType
	cmp r0, #0
	beq _0805BD60
	ldr r4, _0805BD5C  @ gEkrXPosReal
	ldrh r0, [r4]
	ldrh r1, [r5]
	subs r0, r0, r1
	b _0805BD68
	.align 2, 0
_0805BD54: .4byte gEkrBg2QuakeVec
_0805BD58: .4byte gEkrBg0QuakeVec
_0805BD5C: .4byte gEkrXPosReal
_0805BD60:
	ldr r4, _0805BE78  @ gEkrXPosReal
	ldrh r0, [r5]
	ldrh r3, [r4]
	adds r0, r0, r3
_0805BD68:
	ldr r3, _0805BE7C  @ gEkrBgXOffset
	ldr r1, [r3]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	ldr r2, _0805BE80  @ gEkrYPosReal
	ldrh r0, [r2]
	ldrh r1, [r5, #2]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	mov r9, r4
	mov sl, r2
	ldr r2, _0805BE84  @ gEkrBg2QuakeVec
	ldrh r0, [r2]
	mov r1, r9
	ldrh r1, [r1, #2]
	adds r0, r0, r1
	ldr r3, _0805BE7C  @ gEkrBgXOffset
	ldr r1, [r3]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	mov r1, sl
	ldrh r0, [r1, #2]
	ldrh r1, [r2, #2]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	lsls r1, r7, #0x10
	asrs r1, r1, #0x10
	lsls r2, r6, #0x10
	asrs r2, r2, #0x10
	movs r0, #0
	bl SetEkrFrontAnimPostion
	lsls r1, r5, #0x10
	asrs r1, r1, #0x10
	lsls r2, r4, #0x10
	asrs r2, r2, #0x10
	movs r0, #1
	bl SetEkrFrontAnimPostion
	mov r2, r8
	ldrh r0, [r2, #0x2c]
	adds r0, #1
	strh r0, [r2, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r3, #0x2e
	ldrsh r1, [r2, r3]
	cmp r0, r1
	ble _0805BE6A
	ldr r1, _0805BE88  @ gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	ldr r4, _0805BE8C  @ gEkrBg0QuakeVec
	ldrh r1, [r4]
	ldrh r2, [r4, #2]
	movs r0, #0
	bl BG_SetPosition
	ldrh r0, [r4]
	negs r0, r0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldrh r1, [r4, #2]
	negs r1, r1
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl EkrGauge_Setxy323A
	ldrh r0, [r4]
	negs r0, r0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r1, [r4, #2]
	negs r1, r1
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	bl sub_8051B5C
	bl GetBanimDragonStatusType
	cmp r0, #0
	beq _0805BE2A
	movs r0, #3
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
_0805BE2A:
	ldr r0, _0805BE7C  @ gEkrBgXOffset
	ldr r2, [r0]
	mov r3, r9
	ldrh r1, [r3]
	subs r1, r1, r2
	ldrh r0, [r3, #2]
	subs r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	mov r0, sl
	ldrh r4, [r0, #2]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r3, #0
	ldrsh r2, [r0, r3]
	movs r0, #0
	bl SetEkrFrontAnimPostion
	lsls r1, r5, #0x10
	asrs r1, r1, #0x10
	lsls r2, r4, #0x10
	asrs r2, r2, #0x10
	movs r0, #1
	bl SetEkrFrontAnimPostion
	mov r1, r8
	ldr r0, [r1, #0x60]
	bl Proc_End
	mov r0, r8
	bl Proc_Break
_0805BE6A:
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805BE78: .4byte gEkrXPosReal
_0805BE7C: .4byte gEkrBgXOffset
_0805BE80: .4byte gEkrYPosReal
_0805BE84: .4byte gEkrBg2QuakeVec
_0805BE88: .4byte gEfxBgSemaphore
_0805BE8C: .4byte gEkrBg0QuakeVec

	THUMB_FUNC_END Loop6C_efxMagicQUAKE

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

	THUMB_FUNC_START sub_805C44C
sub_805C44C: @ 0x0805C44C
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

	THUMB_FUNC_END sub_805C44C

	THUMB_FUNC_START sub_805C4A8
sub_805C4A8: @ 0x0805C4A8
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

	THUMB_FUNC_END sub_805C4A8

	THUMB_FUNC_START sub_805C504
sub_805C504: @ 0x0805C504
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

	THUMB_FUNC_END sub_805C504

	THUMB_FUNC_START sub_805C560
sub_805C560: @ 0x0805C560
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

	THUMB_FUNC_END sub_805C560

	THUMB_FUNC_START sub_805C5BC
sub_805C5BC: @ 0x0805C5BC
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

	THUMB_FUNC_END sub_805C5BC

	THUMB_FUNC_START sub_805C618
sub_805C618: @ 0x0805C618
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

	THUMB_FUNC_END sub_805C618

	THUMB_FUNC_START sub_805C674
sub_805C674: @ 0x0805C674
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

	THUMB_FUNC_END sub_805C674

	THUMB_FUNC_START sub_805C6D0
sub_805C6D0: @ 0x0805C6D0
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

	THUMB_FUNC_END sub_805C6D0

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

	THUMB_FUNC_START sub_805C788
sub_805C788: @ 0x0805C788
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

	THUMB_FUNC_END sub_805C788

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

	THUMB_FUNC_START StartSpellAnimSong
StartSpellAnimSong: @ 0x0805C934
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl SpellFx_ClearBG1Position
	ldr r0, _0805C968  @ ProcScr_efxSong
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
_0805C968: .4byte ProcScr_efxSong

	THUMB_FUNC_END StartSpellAnimSong

	THUMB_FUNC_START sub_805C96C
sub_805C96C: @ 0x0805C96C
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r5, r0, #0
	ldr r0, [r5, #0x5c]
	bl GetAnimAnotherSide
	adds r4, r0, #0
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	movs r7, #0
	movs r6, #0
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x27
	bne _0805C9EC
	adds r0, r4, #0
	movs r1, #0
	bl sub_805CA64
	adds r0, r4, #0
	movs r1, #0
	bl sub_805CB40
	adds r0, r4, #0
	movs r1, #0x82
	movs r2, #1
	bl NewEfxRestWINH_
	adds r0, r4, #0
	movs r1, #0x64
	bl NewEfxTwobaiRST
	movs r0, #1
	movs r1, #0
	movs r2, #0x10
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	movs r0, #0x10
	str r0, [sp]
	str r6, [sp, #4]
	adds r0, r4, #0
	movs r1, #0
	movs r2, #8
	movs r3, #0
	bl NewEfxALPHA
	str r6, [sp]
	str r6, [sp, #4]
	adds r0, r4, #0
	movs r1, #0x3c
	movs r2, #0x28
	movs r3, #0x10
	bl NewEfxALPHA
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #2
	ldrsh r2, [r4, r0]
	movs r0, #0xef
	movs r3, #1
	bl PlaySFX
_0805C9EC:
	movs r1, #0x2c
	ldrsh r0, [r5, r1]
	cmp r0, #0x8b
	bne _0805CA44
	ldrh r0, [r4, #0x10]
	movs r1, #9
	orrs r0, r1
	strh r0, [r4, #0x10]
	adds r0, r5, #0
	adds r0, #0x29
	ldrb r1, [r0]
	adds r0, r4, #0
	bl sub_8055518
	adds r0, r4, #0
	bl GetAnimPosition
	cmp r0, #0
	bne _0805CA28
	ldr r0, _0805CA20  @ gpEfxUnitPaletteBackup
	ldr r0, [r0]
	ldr r1, _0805CA24  @ gPaletteBuffer+0x2E0
	movs r2, #8
	bl CpuFastSet
	b _0805CA34
	.align 2, 0
_0805CA20: .4byte gpEfxUnitPaletteBackup
_0805CA24: .4byte gPaletteBuffer+0x2E0
_0805CA28:
	ldr r0, _0805CA3C  @ gpEfxUnitPaletteBackup
	ldr r0, [r0, #4]
	ldr r1, _0805CA40  @ gPaletteBuffer+0x320
	movs r2, #8
	bl CpuFastSet
_0805CA34:
	adds r0, r4, #0
	bl EnableEfxStatusUnits
	b _0805CA5A
	.align 2, 0
_0805CA3C: .4byte gpEfxUnitPaletteBackup
_0805CA40: .4byte gPaletteBuffer+0x320
_0805CA44:
	cmp r0, #0xb3
	bne _0805CA5A
	ldrh r0, [r4, #0x10]
	movs r1, #2
	orrs r0, r1
	strh r0, [r4, #0x10]
	bl SpellFx_Finish
	adds r0, r5, #0
	bl Proc_Break
_0805CA5A:
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_805C96C

	THUMB_FUNC_START sub_805CA64
sub_805CA64: @ 0x0805CA64
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	ldr r1, _0805CAAC  @ gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805CAB0  @ ProcScr_efxSongBG
	movs r1, #3
	bl Proc_Start
	str r5, [r0, #0x5c]
	movs r2, #0
	strh r2, [r0, #0x2c]
	str r2, [r0, #0x44]
	ldr r1, _0805CAB4  @ gUnknown_080DC956
	str r1, [r0, #0x48]
	ldr r1, _0805CAB8  @ gUnknown_085D5188
	str r1, [r0, #0x4c]
	str r1, [r0, #0x50]
	ldr r1, _0805CABC  @ gUnknown_085D51F4
	str r1, [r0, #0x54]
	str r2, [r0, #0x58]
	lsls r4, r4, #5
	ldr r0, _0805CAC0  @ gUnknown_08754870
	adds r4, r4, r0
	adds r0, r4, #0
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	bl SpellFx_SetSomeColorEffect
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805CAAC: .4byte gEfxBgSemaphore
_0805CAB0: .4byte ProcScr_efxSongBG
_0805CAB4: .4byte gUnknown_080DC956
_0805CAB8: .4byte gUnknown_085D5188
_0805CABC: .4byte gUnknown_085D51F4
_0805CAC0: .4byte gUnknown_08754870

	THUMB_FUNC_END sub_805CA64

	THUMB_FUNC_START sub_805CAC4
sub_805CAC4: @ 0x0805CAC4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl EfxAdvanceFrameLut
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	cmp r1, #0
	blt _0805CB14
	ldr r7, [r4, #0x4c]
	ldr r0, [r4, #0x50]
	mov r8, r0
	ldr r0, [r4, #0x54]
	lsls r5, r1, #2
	adds r6, r5, r0
	ldr r0, [r4, #0x58]
	ldr r2, [r6]
	cmp r0, r2
	beq _0805CAFE
	movs r1, #0x80
	lsls r1, r1, #6
	adds r0, r2, #0
	bl SpellFx_RegisterBgGfx
_0805CAFE:
	ldr r0, [r6]
	str r0, [r4, #0x58]
	ldr r0, [r4, #0x5c]
	adds r1, r5, r7
	ldr r1, [r1]
	mov r3, r8
	adds r2, r5, r3
	ldr r2, [r2]
	bl SpellFx_WriteBgMap
	b _0805CB32
_0805CB14:
	movs r0, #1
	negs r0, r0
	cmp r1, r0
	bne _0805CB32
	bl SpellFx_ClearBG1
	ldr r1, _0805CB3C  @ gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SetDefaultColorEffects_
	adds r0, r4, #0
	bl Proc_Break
_0805CB32:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805CB3C: .4byte gEfxBgSemaphore

	THUMB_FUNC_END sub_805CAC4

	THUMB_FUNC_START sub_805CB40
sub_805CB40: @ 0x0805CB40
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	adds r5, r1, #0
	ldr r1, _0805CB94  @ gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805CB98  @ ProcScr_efxSongOBJ
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	str r6, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	movs r0, #0x38
	strh r0, [r4, #0x2e]
	ldr r3, _0805CB9C  @ gUnknown_08758134
	str r3, [sp]
	adds r0, r6, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl EfxCreateFrontAnim
	str r0, [r4, #0x60]
	lsls r5, r5, #5
	ldr r0, _0805CBA0  @ gUnknown_08754870
	adds r5, r5, r0
	adds r0, r5, #0
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _0805CBA4  @ gUnknown_08755FD4
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0805CB94: .4byte gEfxBgSemaphore
_0805CB98: .4byte ProcScr_efxSongOBJ
_0805CB9C: .4byte gUnknown_08758134
_0805CBA0: .4byte gUnknown_08754870
_0805CBA4: .4byte gUnknown_08755FD4

	THUMB_FUNC_END sub_805CB40

	THUMB_FUNC_START sub_805CBA8
sub_805CBA8: @ 0x0805CBA8
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
	ble _0805CBD2
	ldr r0, [r4, #0x60]
	bl AnimDelete
	ldr r1, _0805CBD8  @ gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
_0805CBD2:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805CBD8: .4byte gEfxBgSemaphore

	THUMB_FUNC_END sub_805CBA8

	THUMB_FUNC_START StartSpellAnimDance
StartSpellAnimDance: @ 0x0805CBDC
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl SpellFx_ClearBG1Position
	ldr r0, _0805CC10  @ ProcScr_efxDance
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
_0805CC10: .4byte ProcScr_efxDance

	THUMB_FUNC_END StartSpellAnimDance

	THUMB_FUNC_START sub_805CC14
sub_805CC14: @ 0x0805CC14
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r5, r0, #0
	ldr r0, [r5, #0x5c]
	bl GetAnimAnotherSide
	adds r4, r0, #0
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	movs r7, #0
	movs r6, #0
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x19
	bne _0805CC94
	adds r0, r4, #0
	movs r1, #0
	bl sub_805CA64
	adds r0, r4, #0
	movs r1, #0
	bl sub_805CB40
	adds r0, r4, #0
	movs r1, #0x82
	movs r2, #1
	bl NewEfxRestWINH_
	adds r0, r4, #0
	movs r1, #0x64
	bl NewEfxTwobaiRST
	movs r0, #1
	movs r1, #0
	movs r2, #0x10
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	movs r0, #0x10
	str r0, [sp]
	str r6, [sp, #4]
	adds r0, r4, #0
	movs r1, #0
	movs r2, #8
	movs r3, #0
	bl NewEfxALPHA
	str r6, [sp]
	str r6, [sp, #4]
	adds r0, r4, #0
	movs r1, #0x3c
	movs r2, #0x28
	movs r3, #0x10
	bl NewEfxALPHA
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #2
	ldrsh r2, [r4, r0]
	movs r0, #0xef
	movs r3, #1
	bl PlaySFX
_0805CC94:
	movs r1, #0x2c
	ldrsh r0, [r5, r1]
	cmp r0, #0x7d
	bne _0805CCEC
	ldrh r0, [r4, #0x10]
	movs r1, #9
	orrs r0, r1
	strh r0, [r4, #0x10]
	adds r0, r5, #0
	adds r0, #0x29
	ldrb r1, [r0]
	adds r0, r4, #0
	bl sub_8055518
	adds r0, r4, #0
	bl GetAnimPosition
	cmp r0, #0
	bne _0805CCD0
	ldr r0, _0805CCC8  @ gpEfxUnitPaletteBackup
	ldr r0, [r0]
	ldr r1, _0805CCCC  @ gPaletteBuffer+0x2E0
	movs r2, #8
	bl CpuFastSet
	b _0805CCDC
	.align 2, 0
_0805CCC8: .4byte gpEfxUnitPaletteBackup
_0805CCCC: .4byte gPaletteBuffer+0x2E0
_0805CCD0:
	ldr r0, _0805CCE4  @ gpEfxUnitPaletteBackup
	ldr r0, [r0, #4]
	ldr r1, _0805CCE8  @ gPaletteBuffer+0x320
	movs r2, #8
	bl CpuFastSet
_0805CCDC:
	adds r0, r4, #0
	bl EnableEfxStatusUnits
	b _0805CD02
	.align 2, 0
_0805CCE4: .4byte gpEfxUnitPaletteBackup
_0805CCE8: .4byte gPaletteBuffer+0x320
_0805CCEC:
	cmp r0, #0xa5
	bne _0805CD02
	ldrh r0, [r4, #0x10]
	movs r1, #2
	orrs r0, r1
	strh r0, [r4, #0x10]
	bl SpellFx_Finish
	adds r0, r5, #0
	bl Proc_Break
_0805CD02:
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_805CC14

	THUMB_FUNC_START sub_805CD0C
sub_805CD0C: @ 0x0805CD0C
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl SpellFx_ClearBG1Position
	ldr r0, _0805CD58  @ ProcScr_efxShooter
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
	adds r1, r4, #0
	adds r1, #0x29
	strb r0, [r1]
	movs r0, #0x9b
	lsls r0, r0, #1
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r2, [r4, #0x5c]
	movs r3, #2
	ldrsh r2, [r2, r3]
	movs r3, #1
	bl PlaySFX
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805CD58: .4byte ProcScr_efxShooter

	THUMB_FUNC_END sub_805CD0C

	THUMB_FUNC_START sub_805CD5C
sub_805CD5C: @ 0x0805CD5C
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
	cmp r0, #2
	bne _0805CD82
	ldr r0, [r5, #0x5c]
	movs r1, #1
	negs r1, r1
	bl NewEfxFarAttackWithDistance
	b _0805CE14
_0805CD82:
	movs r1, #0x2c
	ldrsh r0, [r5, r1]
	cmp r0, #0x22
	bne _0805CDA4
	ldr r0, _0805CDA0  @ 0x00000137
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r2, [r5, #0x5c]
	movs r3, #2
	ldrsh r2, [r2, r3]
	movs r3, #1
	bl PlaySFX
	b _0805CE14
	.align 2, 0
_0805CDA0: .4byte 0x00000137
_0805CDA4:
	cmp r0, #0x2a
	bne _0805CDB0
	adds r0, r6, #0
	bl sub_805CE1C
	b _0805CE14
_0805CDB0:
	cmp r0, #0x2d
	bne _0805CE02
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
	beq _0805CDF4
	ldr r0, [r5, #0x5c]
	bl CheckRoundCrit
	cmp r0, #1
	bne _0805CDE8
	adds r0, r6, #0
	bl NewEfxPierceCritical
	b _0805CDF4
_0805CDE8:
	ldrb r0, [r4]
	cmp r0, #0
	bne _0805CE14
	ldr r0, [r5, #0x5c]
	bl NewEfxNormalEffect
_0805CDF4:
	ldrb r0, [r4]
	cmp r0, #0
	bne _0805CE14
	adds r0, r6, #0
	bl EfxPlayHittedSFX
	b _0805CE14
_0805CE02:
	cmp r0, #0x3e
	beq _0805CE14
	cmp r0, #0x40
	bne _0805CE14
	bl SpellFx_Finish
	adds r0, r5, #0
	bl Proc_Break
_0805CE14:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_805CD5C

	THUMB_FUNC_START sub_805CE1C
sub_805CE1C: @ 0x0805CE1C
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r1, _0805CE70  @ gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805CE74  @ ProcScr_efxShooterOBJ
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r7, #0
	movs r0, #0
	strh r0, [r4, #0x2c]
	ldr r3, _0805CE78  @ gUnknown_085DCA5C
	ldr r2, _0805CE7C  @ gUnknown_085DCAF8
	str r2, [sp]
	adds r0, r5, #0
	adds r1, r3, #0
	bl EfxCreateFrontAnim
	adds r6, r0, #0
	str r6, [r4, #0x60]
	ldrh r0, [r6, #4]
	adds r0, #0x10
	strh r0, [r6, #4]
	ldrh r1, [r6, #8]
	movs r0, #0xc0
	lsls r0, r0, #4
	ands r0, r1
	strh r0, [r6, #8]
	adds r0, r5, #0
	bl GetAnimPosition
	cmp r0, #1
	bne _0805CE80
	ldrh r0, [r6, #8]
	movs r2, #0xe4
	lsls r2, r2, #7
	b _0805CE86
	.align 2, 0
_0805CE70: .4byte gEfxBgSemaphore
_0805CE74: .4byte ProcScr_efxShooterOBJ
_0805CE78: .4byte gUnknown_085DCA5C
_0805CE7C: .4byte gUnknown_085DCAF8
_0805CE80:
	ldrh r0, [r6, #8]
	movs r2, #0x93
	lsls r2, r2, #8
_0805CE86:
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r6, #8]
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_805CE1C

	THUMB_FUNC_START sub_805CE94
sub_805CE94: @ 0x0805CE94
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xa
	ble _0805CEBA
	ldr r0, [r4, #0x60]
	bl AnimDelete
	ldr r1, _0805CEC0  @ gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
_0805CEBA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805CEC0: .4byte gEfxBgSemaphore

	THUMB_FUNC_END sub_805CE94

	THUMB_FUNC_START nullsub_42
nullsub_42: @ 0x0805CEC4
	bx lr

	THUMB_FUNC_END nullsub_42

	THUMB_FUNC_START sub_805CEC8
sub_805CEC8: @ 0x0805CEC8
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl NewEfxSpellCast
	bl SpellFx_ClearBG1Position
	ldr r0, _0805CF00  @ ProcScr_efxHurtmut
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
_0805CF00: .4byte ProcScr_efxHurtmut

	THUMB_FUNC_END sub_805CEC8

	THUMB_FUNC_START sub_805CF04
sub_805CF04: @ 0x0805CF04
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetAnimAnotherSide
	adds r5, r0, #0
	bl EfxGetCamMovDuration
	adds r6, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	movs r7, #0
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _0805CF32
	ldr r0, [r4, #0x5c]
	movs r1, #1
	negs r1, r1
	bl NewEfxFarAttackWithDistance
_0805CF32:
	movs r0, #0x2c
	ldrsh r1, [r4, r0]
	adds r0, r6, #1
	cmp r1, r0
	bne _0805CF80
	ldr r0, _0805CF7C  @ 0x0000010D
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r5, r3]
	movs r3, #1
	bl PlaySFX
	adds r0, r5, #0
	bl sub_805CFC0
	ldr r0, [r4, #0x5c]
	movs r1, #6
	bl NewEfxFlashBgWhite
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
	bne _0805CFB6
	adds r0, r5, #0
	bl EfxPlayHittedSFX
	b _0805CFB6
	.align 2, 0
_0805CF7C: .4byte 0x0000010D
_0805CF80:
	adds r0, r6, #0
	adds r0, #0x1c
	cmp r1, r0
	bne _0805CF9A
	str r7, [sp]
	str r7, [sp, #4]
	adds r0, r5, #0
	movs r1, #0
	movs r2, #0xe
	movs r3, #0x10
	bl NewEfxALPHA
	b _0805CFB6
_0805CF9A:
	adds r0, r6, #0
	adds r0, #0x32
	cmp r1, r0
	beq _0805CFB6
	adds r0, #5
	cmp r1, r0
	bne _0805CFB6
	bl SpellFx_Finish
	bl RegisterEfxSpellCastEnd
	adds r0, r4, #0
	bl Proc_Break
_0805CFB6:
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_805CF04

	THUMB_FUNC_START sub_805CFC0
sub_805CFC0: @ 0x0805CFC0
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r1, _0805D018  @ gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805D01C  @ ProcScr_efxHurtmutOBJ
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	movs r0, #0x34
	strh r0, [r4, #0x2e]
	adds r0, r5, #0
	bl GetAnimPosition
	ldr r3, _0805D020  @ gUnknown_085E12DC
	cmp r0, #0
	bne _0805CFF0
	ldr r3, _0805D024  @ gUnknown_085E067C
_0805CFF0:
	str r3, [sp]
	adds r0, r5, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl EfxCreateFrontAnim
	str r0, [r4, #0x60]
	ldr r0, _0805D028  @ gUnknown_085DE964
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _0805D02C  @ gUnknown_085DDC64
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805D018: .4byte gEfxBgSemaphore
_0805D01C: .4byte ProcScr_efxHurtmutOBJ
_0805D020: .4byte gUnknown_085E12DC
_0805D024: .4byte gUnknown_085E067C
_0805D028: .4byte gUnknown_085DE964
_0805D02C: .4byte gUnknown_085DDC64

	THUMB_FUNC_END sub_805CFC0

	THUMB_FUNC_START sub_805D030
sub_805D030: @ 0x0805D030
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
	ble _0805D05A
	ldr r0, [r4, #0x60]
	bl AnimDelete
	ldr r1, _0805D060  @ gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
_0805D05A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805D060: .4byte gEfxBgSemaphore

	THUMB_FUNC_END sub_805D030

	THUMB_FUNC_START StartSpellAnimFireBreath
StartSpellAnimFireBreath: @ 0x0805D064
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl SpellFx_ClearBG1Position
	ldr r0, _0805D098  @ ProcScr_efxFirebreath
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
_0805D098: .4byte ProcScr_efxFirebreath

	THUMB_FUNC_END StartSpellAnimFireBreath

	THUMB_FUNC_START sub_805D09C
sub_805D09C: @ 0x0805D09C
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetAnimAnotherSide
	adds r5, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	movs r6, #0
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _0805D0C4
	ldr r0, [r4, #0x5c]
	movs r1, #1
	negs r1, r1
	bl NewEfxFarAttackWithDistance
_0805D0C4:
	movs r1, #0x2c
	ldrsh r0, [r4, r1]
	cmp r0, #1
	bne _0805D110
	ldr r0, [r4, #0x5c]
	movs r1, #0x5a
	movs r2, #0xa
	bl StartSpellThing_MagicQuake
	adds r0, r5, #0
	bl sub_805D14C
	adds r0, r5, #0
	bl sub_805D260
	adds r0, r5, #0
	bl sub_805D2EC
	str r6, [sp]
	str r6, [sp, #4]
	adds r0, r5, #0
	movs r1, #0x28
	movs r2, #0xf
	movs r3, #0x10
	bl NewEfxALPHA
	ldr r0, _0805D10C  @ 0x0000011D
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r5, r3]
	movs r3, #1
	bl PlaySFX
	b _0805D142
	.align 2, 0
_0805D10C: .4byte 0x0000011D
_0805D110:
	cmp r0, #0xf
	bne _0805D134
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
	bne _0805D142
	adds r0, r5, #0
	bl EfxPlayHittedSFX
	b _0805D142
_0805D134:
	cmp r0, #0x82
	bne _0805D142
	bl SpellFx_Finish
	adds r0, r4, #0
	bl Proc_Break
_0805D142:
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_805D09C

	THUMB_FUNC_START sub_805D14C
sub_805D14C: @ 0x0805D14C
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	ldr r1, _0805D1A8  @ gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805D1AC  @ ProcScr_efxFirebreathOBJ
	movs r1, #3
	bl Proc_Start
	adds r5, r0, #0
	str r6, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	movs r0, #0x34
	strh r0, [r5, #0x2e]
	adds r0, r6, #0
	bl GetAnimPosition
	ldr r3, _0805D1B0  @ gUnknown_085E35DC
	cmp r0, #0
	bne _0805D17C
	ldr r3, _0805D1B4  @ gUnknown_085E2A24
_0805D17C:
	str r3, [sp]
	adds r0, r6, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl EfxCreateFrontAnim
	adds r4, r0, #0
	str r4, [r5, #0x60]
	ldr r0, _0805D1B8  @ gEkrDistanceType
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _0805D1C2
	adds r0, r6, #0
	bl GetAnimPosition
	cmp r0, #0
	bne _0805D1BC
	ldrh r0, [r4, #2]
	adds r0, #0x10
	b _0805D1D6
	.align 2, 0
_0805D1A8: .4byte gEfxBgSemaphore
_0805D1AC: .4byte ProcScr_efxFirebreathOBJ
_0805D1B0: .4byte gUnknown_085E35DC
_0805D1B4: .4byte gUnknown_085E2A24
_0805D1B8: .4byte gEkrDistanceType
_0805D1BC:
	ldrh r0, [r4, #2]
	subs r0, #0x10
	b _0805D1D6
_0805D1C2:
	adds r0, r6, #0
	bl GetAnimPosition
	cmp r0, #0
	bne _0805D1D2
	ldrh r0, [r4, #2]
	adds r0, #0x48
	b _0805D1D6
_0805D1D2:
	ldrh r0, [r4, #2]
	subs r0, #0x48
_0805D1D6:
	strh r0, [r4, #2]
	ldr r0, _0805D1F4  @ gUnknown_085DE964
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _0805D1F8  @ gUnknown_085DDC64
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0805D1F4: .4byte gUnknown_085DE964
_0805D1F8: .4byte gUnknown_085DDC64

	THUMB_FUNC_END sub_805D14C

	THUMB_FUNC_START sub_805D1FC
sub_805D1FC: @ 0x0805D1FC
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0805D220  @ gEkrDistanceType
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _0805D22E
	ldr r0, [r4, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _0805D224
	ldr r1, [r4, #0x60]
	ldr r0, [r4, #0x5c]
	ldrh r0, [r0, #2]
	adds r0, #0x48
	b _0805D22C
	.align 2, 0
_0805D220: .4byte gEkrDistanceType
_0805D224:
	ldr r1, [r4, #0x60]
	ldr r0, [r4, #0x5c]
	ldrh r0, [r0, #2]
	subs r0, #0x48
_0805D22C:
	strh r0, [r1, #2]
_0805D22E:
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x2e
	ldrsh r1, [r4, r2]
	cmp r0, r1
	ble _0805D254
	ldr r0, [r4, #0x60]
	bl AnimDelete
	ldr r1, _0805D25C  @ gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
_0805D254:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805D25C: .4byte gEfxBgSemaphore

	THUMB_FUNC_END sub_805D1FC

	THUMB_FUNC_START sub_805D260
sub_805D260: @ 0x0805D260
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r1, _0805D2A4  @ gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805D2A8  @ ProcScr_efxFirebreathBG
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	movs r0, #0x70
	strh r0, [r4, #0x2e]
	ldr r0, _0805D2AC  @ gUnknown_087246D8
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	ldr r2, _0805D2B0  @ gUnknown_08725AF0
	ldr r0, [r4, #0x5c]
	adds r1, r2, #0
	bl SpellFx_WriteBgMap
	bl SpellFx_ClearBG1Position
	bl SpellFx_SetSomeColorEffect
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805D2A4: .4byte gEfxBgSemaphore
_0805D2A8: .4byte ProcScr_efxFirebreathBG
_0805D2AC: .4byte gUnknown_087246D8
_0805D2B0: .4byte gUnknown_08725AF0

	THUMB_FUNC_END sub_805D260

	THUMB_FUNC_START sub_805D2B4
sub_805D2B4: @ 0x0805D2B4
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
	bne _0805D2E0
	bl SpellFx_ClearBG1
	bl SetDefaultColorEffects_
	ldr r1, _0805D2E8  @ gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
_0805D2E0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805D2E8: .4byte gEfxBgSemaphore

	THUMB_FUNC_END sub_805D2B4

	THUMB_FUNC_START sub_805D2EC
sub_805D2EC: @ 0x0805D2EC
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _0805D318  @ gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805D31C  @ ProcScr_efxFirebreathBGCOL
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r1, [r0, #0x44]
	ldr r1, _0805D320  @ gUnknown_080DCA5C
	str r1, [r0, #0x48]
	ldr r1, _0805D324  @ gUnknown_08725AD0
	str r1, [r0, #0x4c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805D318: .4byte gEfxBgSemaphore
_0805D31C: .4byte ProcScr_efxFirebreathBGCOL
_0805D320: .4byte gUnknown_080DCA5C
_0805D324: .4byte gUnknown_08725AD0

	THUMB_FUNC_END sub_805D2EC

	THUMB_FUNC_START sub_805D328
sub_805D328: @ 0x0805D328
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl EfxAdvanceFrameLut
	lsls r0, r0, #0x10
	asrs r5, r0, #0x10
	cmp r5, #0
	blt _0805D368
	ldr r0, [r4, #0x4c]
	ldr r4, _0805D364  @ gEfxPal
	adds r1, r4, #0
	movs r2, #8
	bl CpuFastSet
	adds r0, r4, #0
	movs r1, #0
	movs r2, #1
	adds r3, r5, #0
	bl EfxPalWhiteInOut
	adds r0, r4, #0
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	b _0805D37E
	.align 2, 0
_0805D364: .4byte gEfxPal
_0805D368:
	movs r0, #1
	negs r0, r0
	cmp r5, r0
	bne _0805D37E
	ldr r1, _0805D384  @ gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
_0805D37E:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805D384: .4byte gEfxBgSemaphore

	THUMB_FUNC_END sub_805D328

	THUMB_FUNC_START StartSpellAnimIceBreath
StartSpellAnimIceBreath: @ 0x0805D388
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl NewEfxSpellCast
	bl SpellFx_ClearBG1Position
	ldr r0, _0805D3C0  @ gUnknown_085D5358
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
_0805D3C0: .4byte gUnknown_085D5358

	THUMB_FUNC_END StartSpellAnimIceBreath

	THUMB_FUNC_START sub_805D3C4
sub_805D3C4: @ 0x0805D3C4
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetAnimAnotherSide
	adds r5, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _0805D400
	ldr r0, [r4, #0x5c]
	movs r1, #0x5a
	movs r2, #0xa
	bl StartSpellThing_MagicQuake
	ldr r0, [r4, #0x5c]
	bl sub_805D444
	movs r0, #0x8f
	lsls r0, r0, #1
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r5, r3]
	movs r3, #1
	bl PlaySFX
_0805D400:
	movs r1, #0x2c
	ldrsh r0, [r4, r1]
	cmp r0, #4
	bne _0805D428
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
	bne _0805D43E
	adds r0, r5, #0
	bl EfxPlayHittedSFX
	b _0805D43E
_0805D428:
	cmp r0, #0x32
	beq _0805D43E
	cmp r0, #0x3c
	bne _0805D43E
	bl SpellFx_Finish
	bl RegisterEfxSpellCastEnd
	adds r0, r4, #0
	bl Proc_Break
_0805D43E:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_805D3C4

	THUMB_FUNC_START sub_805D444
sub_805D444: @ 0x0805D444
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r1, _0805D480  @ gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805D484  @ gUnknown_085D5370
	movs r1, #3
	bl Proc_Start
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	ldr r2, _0805D488  @ gUnknown_085E420C
	ldr r3, _0805D48C  @ gUnknown_085E4E3C
	str r2, [sp]
	adds r0, r4, #0
	adds r1, r3, #0
	bl EfxCreateFrontAnim
	adds r6, r0, #0
	str r6, [r5, #0x60]
	adds r0, r4, #0
	bl GetAnimPosition
	cmp r0, #0
	bne _0805D490
	ldrh r0, [r6, #2]
	adds r0, #0x20
	b _0805D494
	.align 2, 0
_0805D480: .4byte gEfxBgSemaphore
_0805D484: .4byte gUnknown_085D5370
_0805D488: .4byte gUnknown_085E420C
_0805D48C: .4byte gUnknown_085E4E3C
_0805D490:
	ldrh r0, [r6, #2]
	subs r0, #0x20
_0805D494:
	strh r0, [r6, #2]
	ldr r0, _0805D4B0  @ gUnknown_085DFA28
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _0805D4B4  @ gUnknown_085DDC64
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0805D4B0: .4byte gUnknown_085DFA28
_0805D4B4: .4byte gUnknown_085DDC64

	THUMB_FUNC_END sub_805D444

	THUMB_FUNC_START sub_805D4B8
sub_805D4B8: @ 0x0805D4B8
	push {lr}
	ldr r2, _0805D4CC  @ gEfxBgSemaphore
	ldr r1, [r2]
	subs r1, #1
	str r1, [r2]
	ldr r0, [r0, #0x60]
	bl AnimDelete
	pop {r0}
	bx r0
	.align 2, 0
_0805D4CC: .4byte gEfxBgSemaphore

	THUMB_FUNC_END sub_805D4B8

	THUMB_FUNC_START StartSpellAnimDarkBreath
StartSpellAnimDarkBreath: @ 0x0805D4D0
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl SpellFx_ClearBG1Position
	ldr r0, _0805D504  @ gUnknown_085D5390
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
_0805D504: .4byte gUnknown_085D5390

	THUMB_FUNC_END StartSpellAnimDarkBreath

	THUMB_FUNC_START Loop6C_efxDarkbreath
Loop6C_efxDarkbreath: @ 0x0805D508
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetAnimAnotherSide
	adds r5, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _0805D558
	ldr r0, [r4, #0x5c]
	movs r1, #1
	negs r1, r1
	bl NewEfxFarAttackWithDistance
	ldr r0, [r4, #0x5c]
	movs r1, #0x5a
	movs r2, #0xa
	bl StartSpellThing_MagicQuake
	ldr r0, [r4, #0x5c]
	bl sub_805D59C
	ldr r0, [r4, #0x5c]
	bl sub_805D644
	ldr r0, [r4, #0x5c]
	bl sub_805D6CC
	ldr r0, _0805D580  @ 0x0000011F
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r5, r3]
	movs r3, #1
	bl PlaySFX
_0805D558:
	movs r1, #0x2c
	ldrsh r0, [r4, r1]
	cmp r0, #4
	bne _0805D584
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
	bne _0805D596
	adds r0, r5, #0
	bl EfxPlayHittedSFX
	b _0805D596
	.align 2, 0
_0805D580: .4byte 0x0000011F
_0805D584:
	cmp r0, #0x20
	beq _0805D596
	cmp r0, #0x30
	bne _0805D596
	bl SpellFx_Finish
	adds r0, r4, #0
	bl Proc_Break
_0805D596:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END Loop6C_efxDarkbreath

	THUMB_FUNC_START sub_805D59C
sub_805D59C: @ 0x0805D59C
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _0805D5D8  @ gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805D5DC  @ gUnknown_085D53A8
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r1, [r0, #0x44]
	ldr r1, _0805D5E0  @ gUnknown_080DCB78
	str r1, [r0, #0x48]
	ldr r1, _0805D5E4  @ gUnknown_085D53C0
	str r1, [r0, #0x4c]
	str r1, [r0, #0x50]
	ldr r0, _0805D5E8  @ gUnknown_085E5AE4
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	bl SpellFx_SetSomeColorEffect
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805D5D8: .4byte gEfxBgSemaphore
_0805D5DC: .4byte gUnknown_085D53A8
_0805D5E0: .4byte gUnknown_080DCB78
_0805D5E4: .4byte gUnknown_085D53C0
_0805D5E8: .4byte gUnknown_085E5AE4

	THUMB_FUNC_END sub_805D59C

	THUMB_FUNC_START sub_805D5EC
sub_805D5EC: @ 0x0805D5EC
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl EfxAdvanceFrameLut
	lsls r0, r0, #0x10
	asrs r2, r0, #0x10
	cmp r2, #0
	blt _0805D61A
	ldr r1, [r4, #0x4c]
	ldr r3, [r4, #0x50]
	ldr r0, [r4, #0x5c]
	lsls r2, r2, #2
	adds r1, r2, r1
	ldr r1, [r1]
	adds r2, r2, r3
	ldr r2, [r2]
	bl SpellFx_WriteBgMap
	b _0805D638
_0805D61A:
	movs r0, #1
	negs r0, r0
	cmp r2, r0
	bne _0805D638
	bl SpellFx_ClearBG1
	ldr r1, _0805D640  @ gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SetDefaultColorEffects_
	adds r0, r4, #0
	bl Proc_Break
_0805D638:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805D640: .4byte gEfxBgSemaphore

	THUMB_FUNC_END sub_805D5EC

	THUMB_FUNC_START sub_805D644
sub_805D644: @ 0x0805D644
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _0805D670  @ gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805D674  @ gUnknown_085D53F0
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r1, [r0, #0x44]
	ldr r1, _0805D678  @ gUnknown_080DCBD4
	str r1, [r0, #0x48]
	ldr r1, _0805D67C  @ gUnknown_08608838
	str r1, [r0, #0x4c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805D670: .4byte gEfxBgSemaphore
_0805D674: .4byte gUnknown_085D53F0
_0805D678: .4byte gUnknown_080DCBD4
_0805D67C: .4byte gUnknown_08608838

	THUMB_FUNC_END sub_805D644

	THUMB_FUNC_START sub_805D680
sub_805D680: @ 0x0805D680
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl EfxAdvanceFrameLut
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	cmp r1, #0
	blt _0805D6A6
	ldr r0, [r4, #0x4c]
	lsls r1, r1, #5
	adds r0, r0, r1
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	b _0805D6C0
_0805D6A6:
	movs r0, #1
	negs r0, r0
	cmp r1, r0
	bne _0805D6C0
	bl SetDefaultColorEffects_
	ldr r1, _0805D6C8  @ gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
_0805D6C0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805D6C8: .4byte gEfxBgSemaphore

	THUMB_FUNC_END sub_805D680

	THUMB_FUNC_START sub_805D6CC
sub_805D6CC: @ 0x0805D6CC
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	ldr r1, _0805D728  @ gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805D72C  @ ProcScr_efxDarkbreathOBJ
	movs r1, #3
	bl Proc_Start
	adds r5, r0, #0
	str r6, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	movs r0, #0x37
	strh r0, [r5, #0x2e]
	ldr r2, _0805D730  @ gUnknown_085E5A78
	ldr r3, _0805D734  @ gUnknown_08723208
	str r3, [sp]
	adds r0, r6, #0
	adds r1, r2, #0
	bl EfxCreateFrontAnim
	adds r4, r0, #0
	str r4, [r5, #0x60]
	movs r0, #0x14
	strh r0, [r5, #0x32]
	ldr r0, _0805D738  @ 0x0000FFFC
	strh r0, [r5, #0x3a]
	ldr r0, _0805D73C  @ gEkrDistanceType
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _0805D716
	movs r0, #0x2c
	strh r0, [r5, #0x32]
_0805D716:
	adds r0, r6, #0
	bl GetAnimPosition
	cmp r0, #0
	bne _0805D740
	ldrh r0, [r5, #0x32]
	ldrh r1, [r4, #2]
	adds r0, r0, r1
	b _0805D746
	.align 2, 0
_0805D728: .4byte gEfxBgSemaphore
_0805D72C: .4byte ProcScr_efxDarkbreathOBJ
_0805D730: .4byte gUnknown_085E5A78
_0805D734: .4byte gUnknown_08723208
_0805D738: .4byte 0x0000FFFC
_0805D73C: .4byte gEkrDistanceType
_0805D740:
	ldrh r0, [r4, #2]
	ldrh r1, [r5, #0x32]
	subs r0, r0, r1
_0805D746:
	strh r0, [r4, #2]
	ldrh r0, [r5, #0x3a]
	ldrh r1, [r4, #4]
	adds r0, r0, r1
	strh r0, [r4, #4]
	ldr r0, _0805D76C  @ gUnknown_085DFA48
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _0805D770  @ gUnknown_085DDC64
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0805D76C: .4byte gUnknown_085DFA48
_0805D770: .4byte gUnknown_085DDC64

	THUMB_FUNC_END sub_805D6CC

	THUMB_FUNC_START sub_805D774
sub_805D774: @ 0x0805D774
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0805D798  @ gEkrDistanceType
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _0805D7A8
	ldr r0, [r4, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _0805D79C
	ldr r2, [r4, #0x60]
	ldr r1, [r4, #0x5c]
	ldrh r0, [r4, #0x32]
	ldrh r1, [r1, #2]
	adds r0, r0, r1
	b _0805D7A6
	.align 2, 0
_0805D798: .4byte gEkrDistanceType
_0805D79C:
	ldr r2, [r4, #0x60]
	ldr r0, [r4, #0x5c]
	ldrh r0, [r0, #2]
	ldrh r1, [r4, #0x32]
	subs r0, r0, r1
_0805D7A6:
	strh r0, [r2, #2]
_0805D7A8:
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x2e
	ldrsh r1, [r4, r2]
	cmp r0, r1
	bne _0805D7CE
	ldr r0, _0805D7D4  @ gEfxBgSemaphore
	ldr r1, [r0]
	subs r1, #1
	str r1, [r0]
	ldr r0, [r4, #0x60]
	bl AnimDelete
	adds r0, r4, #0
	bl Proc_Break
_0805D7CE:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805D7D4: .4byte gEfxBgSemaphore

	THUMB_FUNC_END sub_805D774

.align 2, 0
