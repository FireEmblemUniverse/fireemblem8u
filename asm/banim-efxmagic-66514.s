	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	THUMB_FUNC_START sub_8068B80
sub_8068B80: @ 0x08068B80
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl SpellFx_ClearBG1Position
	ldr r0, _08068BB4  @ gUnknown_085D8318
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
_08068BB4: .4byte gUnknown_085D8318

	THUMB_FUNC_END sub_8068B80

	THUMB_FUNC_START sub_8068BB8
sub_8068BB8: @ 0x08068BB8
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
	bne _08068BE4
	ldr r0, [r4, #0x5c]
	movs r1, #1
	negs r1, r1
	bl NewEfxFarAttackWithDistance
	b _08068D14
_08068BE4:
	movs r0, #0x2c
	ldrsh r1, [r4, r0]
	adds r0, r2, #2
	cmp r1, r0
	bne _08068C08
	bl GetBanimDragonStatusType
	cmp r0, #1
	bne _08068BF8
	b _08068D14
_08068BF8:
	bl GetBanimDragonStatusType
	cmp r0, #2
	bne _08068C02
	b _08068D14
_08068C02:
	bl sub_8068D78
	b _08068D14
_08068C08:
	adds r0, r2, #0
	adds r0, #0x22
	cmp r1, r0
	bne _08068C1C
	adds r0, r5, #0
	bl sub_80692B0
	movs r0, #0xeb
	lsls r0, r0, #2
	b _08068CD4
_08068C1C:
	adds r0, r2, #0
	adds r0, #0x60
	cmp r1, r0
	bne _08068C32
	adds r0, r5, #0
	bl sub_8069488
	adds r0, r5, #0
	bl sub_8069AC4
	b _08068D14
_08068C32:
	adds r0, r2, #0
	adds r0, #0xce
	cmp r1, r0
	bne _08068C42
	adds r0, r5, #0
	bl sub_8069E88
	b _08068D14
_08068C42:
	movs r3, #0x97
	lsls r3, r3, #1
	adds r0, r2, r3
	cmp r1, r0
	bne _08068C8C
	adds r0, r5, #0
	movs r1, #0xa
	bl NewEfxFlashBgWhite
	bl GetBanimDragonStatusType
	cmp r0, #1
	beq _08068C68
	bl GetBanimDragonStatusType
	cmp r0, #2
	beq _08068C68
	bl sub_8068D9C
_08068C68:
	bl NewEfxSpellCast
	ldrh r1, [r5, #0x10]
	movs r0, #9
	orrs r0, r1
	strh r0, [r5, #0x10]
	adds r4, #0x29
	ldrb r1, [r4]
	adds r0, r5, #0
	bl StartBattleAnimHitEffectsDefault
	ldrb r0, [r4]
	cmp r0, #0
	bne _08068D14
	adds r0, r5, #0
	bl EfxPlayHittedSFX
	b _08068D14
_08068C8C:
	movs r3, #0x9a
	lsls r3, r3, #1
	adds r0, r2, r3
	cmp r1, r0
	bne _08068CB0
	adds r0, r4, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #0
	beq _08068D14
	bl SpellFx_Finish
	bl RegisterEfxSpellCastEnd
	adds r0, r4, #0
	bl Proc_Break
	b _08068D14
_08068CB0:
	movs r3, #0x9c
	lsls r3, r3, #1
	adds r0, r2, r3
	cmp r1, r0
	bne _08068CE8
	ldr r0, [r4, #0x5c]
	movs r1, #0xf
	movs r2, #9
	bl StartSpellThing_MagicQuake
	adds r0, r5, #0
	movs r1, #0x1e
	bl StartSubSpell_efxGespenstBG4
	adds r0, r5, #0
	bl StartSubSpell_efxGespenstBGCOL2
	ldr r0, _08068CE4  @ 0x000003AD
_08068CD4:
	movs r1, #0x80
	lsls r1, r1, #1
	movs r2, #0x78
	movs r3, #1
	bl PlaySFX
	b _08068D14
	.align 2, 0
_08068CE4: .4byte 0x000003AD
_08068CE8:
	movs r3, #0xa4
	lsls r3, r3, #1
	adds r0, r2, r3
	cmp r1, r0
	bne _08068CFE
	ldr r0, [r4, #0x5c]
	movs r1, #0xf
	movs r2, #8
	bl StartSpellThing_MagicQuake
	b _08068D14
_08068CFE:
	ldr r3, _08068D1C  @ 0x00000161
	adds r0, r2, r3
	cmp r1, r0
	bne _08068D14
	bl SpellFx_Finish
	bl RegisterEfxSpellCastEnd
	adds r0, r4, #0
	bl Proc_Break
_08068D14:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08068D1C: .4byte 0x00000161

	THUMB_FUNC_END sub_8068BB8

	THUMB_FUNC_START sub_8068D20
sub_8068D20: @ 0x08068D20
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	movs r0, #0x2c
	ldrsh r3, [r4, r0]
	movs r0, #0x10
	str r0, [sp]
	movs r0, #1
	movs r1, #4
	movs r2, #0x10
	bl Interpolate
	adds r3, r0, #0
	ldr r0, _08068D70  @ gPaletteBuffer
	movs r1, #6
	movs r2, #0xa
	bl EfxPalBlackInOut
	bl EnablePaletteSync
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x11
	bne _08068D68
	movs r0, #0
	strh r0, [r4, #0x2c]
	ldr r1, _08068D74  @ gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
_08068D68:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08068D70: .4byte gPaletteBuffer
_08068D74: .4byte gEfxBgSemaphore

	THUMB_FUNC_END sub_8068D20

	THUMB_FUNC_START sub_8068D78
sub_8068D78: @ 0x08068D78
	push {lr}
	ldr r1, _08068D94  @ gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08068D98  @ gUnknown_085D8330
	movs r1, #3
	bl Proc_Start
	movs r1, #0
	strh r1, [r0, #0x2c]
	pop {r0}
	bx r0
	.align 2, 0
_08068D94: .4byte gEfxBgSemaphore
_08068D98: .4byte gUnknown_085D8330

	THUMB_FUNC_END sub_8068D78

	THUMB_FUNC_START sub_8068D9C
sub_8068D9C: @ 0x08068D9C
	push {lr}
	ldr r1, _08068DB0  @ gBanimGackgroundIndex
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, #0
	bne _08068DB4
	movs r0, #4
	bl EfxChapterMapFadeOUT
	b _08068DCE
	.align 2, 0
_08068DB0: .4byte gBanimGackgroundIndex
_08068DB4:
	movs r2, #0
	ldrsh r0, [r1, r2]
	subs r0, #1
	bl PutBanimBgPAL
	ldr r0, _08068DD4  @ gPaletteBuffer
	movs r1, #6
	movs r2, #0xa
	movs r3, #0
	bl EfxPalBlackInOut
	bl EnablePaletteSync
_08068DCE:
	pop {r0}
	bx r0
	.align 2, 0
_08068DD4: .4byte gPaletteBuffer

	THUMB_FUNC_END sub_8068D9C

	THUMB_FUNC_START sub_8068DD8
sub_8068DD8: @ 0x08068DD8
	push {r4, lr}
	ldr r0, _08068E08  @ 0x04000006
	ldrh r0, [r0]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x9f
	bhi _08068E02
	ldr r4, _08068E0C  @ gUnknown_0201FB28
	adds r1, r0, #0
	subs r1, #0x3f
	ldr r0, [r4]
	subs r0, r0, r1
	movs r1, #0xd
	bl Div
	ldr r2, _08068E10  @ 0x04000016
	ldr r1, [r4]
	negs r1, r1
	subs r1, r1, r0
	strh r1, [r2]
_08068E02:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08068E08: .4byte 0x04000006
_08068E0C: .4byte gUnknown_0201FB28
_08068E10: .4byte 0x04000016

	THUMB_FUNC_END sub_8068DD8

	THUMB_FUNC_START sub_8068E14
sub_8068E14: @ 0x08068E14
	push {r4, lr}
	ldr r0, _08068E44  @ 0x04000006
	ldrh r0, [r0]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x9f
	bhi _08068E3E
	ldr r4, _08068E48  @ gUnknown_0201FB28
	adds r1, r0, #0
	subs r1, #0x3f
	ldr r0, [r4]
	subs r0, r0, r1
	movs r1, #0xc
	bl Div
	ldr r2, _08068E4C  @ 0x04000016
	ldr r1, [r4]
	negs r1, r1
	subs r1, r1, r0
	strh r1, [r2]
_08068E3E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08068E44: .4byte 0x04000006
_08068E48: .4byte gUnknown_0201FB28
_08068E4C: .4byte 0x04000016

	THUMB_FUNC_END sub_8068E14

	THUMB_FUNC_START sub_8068E50
sub_8068E50: @ 0x08068E50
	push {r4, lr}
	ldr r0, _08068E80  @ 0x04000006
	ldrh r0, [r0]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x9f
	bhi _08068E7A
	ldr r4, _08068E84  @ gUnknown_0201FB28
	adds r1, r0, #0
	subs r1, #0x3f
	ldr r0, [r4]
	subs r0, r0, r1
	movs r1, #0xb
	bl Div
	ldr r2, _08068E88  @ 0x04000016
	ldr r1, [r4]
	negs r1, r1
	subs r1, r1, r0
	strh r1, [r2]
_08068E7A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08068E80: .4byte 0x04000006
_08068E84: .4byte gUnknown_0201FB28
_08068E88: .4byte 0x04000016

	THUMB_FUNC_END sub_8068E50

	THUMB_FUNC_START sub_8068E8C
sub_8068E8C: @ 0x08068E8C
	push {r4, lr}
	ldr r0, _08068EBC  @ 0x04000006
	ldrh r0, [r0]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x9f
	bhi _08068EB6
	ldr r4, _08068EC0  @ gUnknown_0201FB28
	adds r1, r0, #0
	subs r1, #0x3f
	ldr r0, [r4]
	subs r0, r0, r1
	movs r1, #0xa
	bl Div
	ldr r2, _08068EC4  @ 0x04000016
	ldr r1, [r4]
	negs r1, r1
	subs r1, r1, r0
	strh r1, [r2]
_08068EB6:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08068EBC: .4byte 0x04000006
_08068EC0: .4byte gUnknown_0201FB28
_08068EC4: .4byte 0x04000016

	THUMB_FUNC_END sub_8068E8C

	THUMB_FUNC_START sub_8068EC8
sub_8068EC8: @ 0x08068EC8
	push {r4, lr}
	ldr r0, _08068EF8  @ 0x04000006
	ldrh r0, [r0]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x9f
	bhi _08068EF2
	ldr r4, _08068EFC  @ gUnknown_0201FB28
	adds r1, r0, #0
	subs r1, #0x3f
	ldr r0, [r4]
	subs r0, r0, r1
	movs r1, #9
	bl Div
	ldr r2, _08068F00  @ 0x04000016
	ldr r1, [r4]
	negs r1, r1
	subs r1, r1, r0
	strh r1, [r2]
_08068EF2:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08068EF8: .4byte 0x04000006
_08068EFC: .4byte gUnknown_0201FB28
_08068F00: .4byte 0x04000016

	THUMB_FUNC_END sub_8068EC8

	THUMB_FUNC_START sub_8068F04
sub_8068F04: @ 0x08068F04
	push {r4, lr}
	ldr r0, _08068F34  @ 0x04000006
	ldrh r0, [r0]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x9f
	bhi _08068F2E
	ldr r4, _08068F38  @ gUnknown_0201FB28
	adds r1, r0, #0
	subs r1, #0x3f
	ldr r0, [r4]
	subs r0, r0, r1
	movs r1, #8
	bl Div
	ldr r2, _08068F3C  @ 0x04000016
	ldr r1, [r4]
	negs r1, r1
	subs r1, r1, r0
	strh r1, [r2]
_08068F2E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08068F34: .4byte 0x04000006
_08068F38: .4byte gUnknown_0201FB28
_08068F3C: .4byte 0x04000016

	THUMB_FUNC_END sub_8068F04

	THUMB_FUNC_START sub_8068F40
sub_8068F40: @ 0x08068F40
	push {r4, lr}
	ldr r0, _08068F70  @ 0x04000006
	ldrh r0, [r0]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x9f
	bhi _08068F6A
	ldr r4, _08068F74  @ gUnknown_0201FB28
	adds r1, r0, #0
	subs r1, #0x3f
	ldr r0, [r4]
	subs r0, r0, r1
	movs r1, #7
	bl Div
	ldr r2, _08068F78  @ 0x04000016
	ldr r1, [r4]
	negs r1, r1
	subs r1, r1, r0
	strh r1, [r2]
_08068F6A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08068F70: .4byte 0x04000006
_08068F74: .4byte gUnknown_0201FB28
_08068F78: .4byte 0x04000016

	THUMB_FUNC_END sub_8068F40

	THUMB_FUNC_START sub_8068F7C
sub_8068F7C: @ 0x08068F7C
	push {r4, lr}
	ldr r0, _08068FAC  @ 0x04000006
	ldrh r0, [r0]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x9f
	bhi _08068FA6
	ldr r4, _08068FB0  @ gUnknown_0201FB28
	adds r1, r0, #0
	subs r1, #0x3f
	ldr r0, [r4]
	subs r0, r0, r1
	movs r1, #6
	bl Div
	ldr r2, _08068FB4  @ 0x04000016
	ldr r1, [r4]
	negs r1, r1
	subs r1, r1, r0
	strh r1, [r2]
_08068FA6:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08068FAC: .4byte 0x04000006
_08068FB0: .4byte gUnknown_0201FB28
_08068FB4: .4byte 0x04000016

	THUMB_FUNC_END sub_8068F7C

	THUMB_FUNC_START sub_8068FB8
sub_8068FB8: @ 0x08068FB8
	push {r4, lr}
	ldr r0, _08068FE8  @ 0x04000006
	ldrh r0, [r0]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x9f
	bhi _08068FE2
	ldr r4, _08068FEC  @ gUnknown_0201FB28
	adds r1, r0, #0
	subs r1, #0x3f
	ldr r0, [r4]
	subs r0, r0, r1
	movs r1, #5
	bl Div
	ldr r2, _08068FF0  @ 0x04000016
	ldr r1, [r4]
	negs r1, r1
	subs r1, r1, r0
	strh r1, [r2]
_08068FE2:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08068FE8: .4byte 0x04000006
_08068FEC: .4byte gUnknown_0201FB28
_08068FF0: .4byte 0x04000016

	THUMB_FUNC_END sub_8068FB8

	THUMB_FUNC_START sub_8068FF4
sub_8068FF4: @ 0x08068FF4
	push {r4, lr}
	ldr r0, _08069024  @ 0x04000006
	ldrh r0, [r0]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x9f
	bhi _0806901E
	ldr r4, _08069028  @ gUnknown_0201FB28
	adds r1, r0, #0
	subs r1, #0x3f
	ldr r0, [r4]
	subs r0, r0, r1
	movs r1, #4
	bl Div
	ldr r2, _0806902C  @ 0x04000016
	ldr r1, [r4]
	negs r1, r1
	subs r1, r1, r0
	strh r1, [r2]
_0806901E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08069024: .4byte 0x04000006
_08069028: .4byte gUnknown_0201FB28
_0806902C: .4byte 0x04000016

	THUMB_FUNC_END sub_8068FF4

	THUMB_FUNC_START sub_8069030
sub_8069030: @ 0x08069030
	push {r4, lr}
	ldr r0, _08069060  @ 0x04000006
	ldrh r0, [r0]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x9f
	bhi _0806905A
	ldr r4, _08069064  @ gUnknown_0201FB28
	adds r1, r0, #0
	subs r1, #0x3f
	ldr r0, [r4]
	subs r0, r0, r1
	movs r1, #3
	bl Div
	ldr r2, _08069068  @ 0x04000016
	ldr r1, [r4]
	negs r1, r1
	subs r1, r1, r0
	strh r1, [r2]
_0806905A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08069060: .4byte 0x04000006
_08069064: .4byte gUnknown_0201FB28
_08069068: .4byte 0x04000016

	THUMB_FUNC_END sub_8069030

	THUMB_FUNC_START sub_806906C
sub_806906C: @ 0x0806906C
	push {r4, lr}
	ldr r0, _0806909C  @ 0x04000006
	ldrh r0, [r0]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x9f
	bhi _08069096
	ldr r4, _080690A0  @ gUnknown_0201FB28
	adds r1, r0, #0
	subs r1, #0x3f
	ldr r0, [r4]
	subs r0, r0, r1
	movs r1, #2
	bl Div
	ldr r2, _080690A4  @ 0x04000016
	ldr r1, [r4]
	negs r1, r1
	subs r1, r1, r0
	strh r1, [r2]
_08069096:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806909C: .4byte 0x04000006
_080690A0: .4byte gUnknown_0201FB28
_080690A4: .4byte 0x04000016

	THUMB_FUNC_END sub_806906C

	THUMB_FUNC_START sub_80690A8
sub_80690A8: @ 0x080690A8
	push {r4, lr}
	ldr r0, _080690D8  @ 0x04000006
	ldrh r0, [r0]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x9f
	bhi _080690D2
	ldr r4, _080690DC  @ gUnknown_0201FB28
	adds r1, r0, #0
	subs r1, #0x3f
	ldr r0, [r4]
	subs r0, r0, r1
	movs r1, #1
	bl Div
	ldr r2, _080690E0  @ 0x04000016
	ldr r1, [r4]
	negs r1, r1
	subs r1, r1, r0
	strh r1, [r2]
_080690D2:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080690D8: .4byte 0x04000006
_080690DC: .4byte gUnknown_0201FB28
_080690E0: .4byte 0x04000016

	THUMB_FUNC_END sub_80690A8

	THUMB_FUNC_START sub_80690E4
sub_80690E4: @ 0x080690E4
	ldr r0, _080690F4  @ 0x04000006
	ldrh r0, [r0]
	ldr r1, _080690F8  @ 0x04000016
	ldr r0, _080690FC  @ gUnknown_0201FB28
	ldr r0, [r0]
	negs r0, r0
	strh r0, [r1]
	bx lr
	.align 2, 0
_080690F4: .4byte 0x04000006
_080690F8: .4byte 0x04000016
_080690FC: .4byte gUnknown_0201FB28

	THUMB_FUNC_END sub_80690E4

	THUMB_FUNC_START sub_8069100
sub_8069100: @ 0x08069100
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r7, r0, #0
	adds r0, #0x2c
	adds r1, r7, #0
	adds r1, #0x44
	ldr r2, [r7, #0x48]
	bl EfxAdvanceFrameLut
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	ldr r0, [r7, #0x44]
	subs r0, #1
	cmp r0, #4
	bls _08069124
	b _08069240
_08069124:
	lsls r0, r0, #2
	ldr r1, _08069130  @ _08069134
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08069130: .4byte _08069134
_08069134: @ jump table
	.4byte _08069148 @ case 0
	.4byte _08069164 @ case 1
	.4byte _08069198 @ case 2
	.4byte _080691CC @ case 3
	.4byte _08069200 @ case 4
_08069148:
	movs r1, #0x2c
	ldrsh r0, [r7, r1]
	cmp r0, #0
	beq _0806918C
	cmp r0, #1
	beq _08069156
	b _08069246
_08069156:
	ldr r0, _08069160  @ sub_8068DD8
	bl SetPrimaryHBlankHandler
	b _08069246
	.align 2, 0
_08069160: .4byte sub_8068DD8
_08069164:
	movs r1, #0x2c
	ldrsh r0, [r7, r1]
	cmp r0, #1
	beq _0806918C
	cmp r0, #1
	bgt _08069176
	cmp r0, #0
	beq _080691B4
	b _08069246
_08069176:
	cmp r0, #2
	beq _0806921C
	cmp r0, #3
	bne _08069246
	ldr r0, _08069188  @ sub_8068F40
	bl SetPrimaryHBlankHandler
	b _08069246
	.align 2, 0
_08069188: .4byte sub_8068F40
_0806918C:
	ldr r0, _08069194  @ sub_8068E8C
	bl SetPrimaryHBlankHandler
	b _08069246
	.align 2, 0
_08069194: .4byte sub_8068E8C
_08069198:
	movs r1, #0x2c
	ldrsh r0, [r7, r1]
	cmp r0, #1
	beq _080691B4
	cmp r0, #1
	bgt _080691AA
	cmp r0, #0
	beq _080691C0
	b _08069246
_080691AA:
	cmp r0, #2
	beq _0806921C
	cmp r0, #3
	bne _08069246
	b _080691C0
_080691B4:
	ldr r0, _080691BC  @ sub_8068F04
	bl SetPrimaryHBlankHandler
	b _08069246
	.align 2, 0
_080691BC: .4byte sub_8068F04
_080691C0:
	ldr r0, _080691C8  @ sub_8068F7C
	bl SetPrimaryHBlankHandler
	b _08069246
	.align 2, 0
_080691C8: .4byte sub_8068F7C
_080691CC:
	movs r1, #0x2c
	ldrsh r0, [r7, r1]
	cmp r0, #1
	beq _080691E8
	cmp r0, #1
	bgt _080691DE
	cmp r0, #0
	beq _080691F4
	b _08069246
_080691DE:
	cmp r0, #2
	beq _0806921C
	cmp r0, #3
	bne _08069246
	b _080691F4
_080691E8:
	ldr r0, _080691F0  @ sub_8068FB8
	bl SetPrimaryHBlankHandler
	b _08069246
	.align 2, 0
_080691F0: .4byte sub_8068FB8
_080691F4:
	ldr r0, _080691FC  @ sub_8068FF4
	bl SetPrimaryHBlankHandler
	b _08069246
	.align 2, 0
_080691FC: .4byte sub_8068FF4
_08069200:
	movs r1, #0x2c
	ldrsh r0, [r7, r1]
	cmp r0, #1
	beq _08069228
	cmp r0, #1
	bgt _08069212
	cmp r0, #0
	beq _08069234
	b _08069246
_08069212:
	cmp r0, #2
	beq _0806921C
	cmp r0, #3
	bne _08069246
	b _08069228
_0806921C:
	ldr r0, _08069224  @ sub_80690E4
	bl SetPrimaryHBlankHandler
	b _08069246
	.align 2, 0
_08069224: .4byte sub_80690E4
_08069228:
	ldr r0, _08069230  @ sub_8069030
	bl SetPrimaryHBlankHandler
	b _08069246
	.align 2, 0
_08069230: .4byte sub_8069030
_08069234:
	ldr r0, _0806923C  @ sub_806906C
	bl SetPrimaryHBlankHandler
	b _08069246
	.align 2, 0
_0806923C: .4byte sub_806906C
_08069240:
	ldr r0, _08069278  @ sub_80690E4
	bl SetPrimaryHBlankHandler
_08069246:
	mov r1, r8
	lsls r0, r1, #0x10
	asrs r4, r0, #0x10
	cmp r4, #0
	blt _0806927C
	ldr r5, [r7, #0x4c]
	ldr r6, [r7, #0x50]
	ldr r0, [r7, #0x54]
	lsls r4, r4, #2
	adds r0, r4, r0
	ldr r0, [r0]
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	ldr r0, [r7, #0x5c]
	adds r5, r4, r5
	ldr r1, [r5]
	adds r4, r4, r6
	ldr r2, [r4]
	bl SpellFx_WriteBgMap
	mov r0, r8
	strh r0, [r7, #0x2e]
	b _080692A0
	.align 2, 0
_08069278: .4byte sub_80690E4
_0806927C:
	movs r0, #1
	negs r0, r0
	cmp r4, r0
	bne _080692A0
	bl SpellFx_ClearBG1
	movs r0, #0
	bl SetPrimaryHBlankHandler
	ldr r1, _080692AC  @ gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SetDefaultColorEffects_
	adds r0, r7, #0
	bl Proc_Break
_080692A0:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080692AC: .4byte gEfxBgSemaphore

	THUMB_FUNC_END sub_8069100

	THUMB_FUNC_START sub_80692B0
sub_80692B0: @ 0x080692B0
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r1, _0806930C  @ gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r1, _08069310  @ gUnknown_0201FB28
	movs r0, #0x10
	str r0, [r1]
	ldr r0, _08069314  @ ProcScr_efxDarkGradoBG01
	movs r1, #3
	bl Proc_Start
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	str r0, [r5, #0x44]
	ldr r0, _08069318  @ gUnknown_080DEDBC
	str r0, [r5, #0x48]
	ldr r0, _0806931C  @ gUnknown_085D8348
	str r0, [r5, #0x4c]
	str r0, [r5, #0x50]
	ldr r0, _08069320  @ gUnknown_085D8374
	str r0, [r5, #0x54]
	ldr r0, _08069324  @ gUnknown_086A66D8
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	ldr r0, _08069328  @ gEkrDistanceType
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #1
	bne _08069344
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _08069330
	ldr r2, _0806932C  @ 0x0000FFF0
	movs r0, #1
	movs r1, #0x18
	bl BG_SetPosition
	b _0806934E
	.align 2, 0
_0806930C: .4byte gEfxBgSemaphore
_08069310: .4byte gUnknown_0201FB28
_08069314: .4byte ProcScr_efxDarkGradoBG01
_08069318: .4byte gUnknown_080DEDBC
_0806931C: .4byte gUnknown_085D8348
_08069320: .4byte gUnknown_085D8374
_08069324: .4byte gUnknown_086A66D8
_08069328: .4byte gEkrDistanceType
_0806932C: .4byte 0x0000FFF0
_08069330:
	ldr r1, _0806933C  @ 0x0000FFE8
	ldr r2, _08069340  @ 0x0000FFF0
	movs r0, #1
	bl BG_SetPosition
	b _0806934E
	.align 2, 0
_0806933C: .4byte 0x0000FFE8
_08069340: .4byte 0x0000FFF0
_08069344:
	ldr r2, _08069358  @ 0x0000FFF0
	movs r0, #1
	movs r1, #0
	bl BG_SetPosition
_0806934E:
	bl SpellFx_SetSomeColorEffect
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08069358: .4byte 0x0000FFF0

	THUMB_FUNC_END sub_80692B0

	THUMB_FUNC_START sub_806935C
sub_806935C: @ 0x0806935C
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
	blt _080693A2
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
	b _080693C4
_080693A2:
	movs r0, #6
	negs r0, r0
	cmp r5, r0
	bne _080693B6
	bl sub_80696F0
	ldr r0, [r7, #0x44]
	adds r0, #1
	str r0, [r7, #0x44]
	b _080693C4
_080693B6:
	movs r0, #1
	negs r0, r0
	cmp r5, r0
	bne _080693C4
	adds r0, r7, #0
	bl Proc_Break
_080693C4:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_806935C

	THUMB_FUNC_START sub_80693CC
sub_80693CC: @ 0x080693CC
	push {lr}
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r1, [r0, #0x2e]
	str r1, [r0, #0x44]
	ldr r1, _080693F0  @ gUnknown_080DEE40
	str r1, [r0, #0x48]
	ldr r1, _080693F4  @ gUnknown_085D8478
	str r1, [r0, #0x4c]
	ldr r1, _080693F8  @ gUnknown_085D847C
	str r1, [r0, #0x54]
	ldr r0, _080693FC  @ gUnknown_086B52CC
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	pop {r0}
	bx r0
	.align 2, 0
_080693F0: .4byte gUnknown_080DEE40
_080693F4: .4byte gUnknown_085D8478
_080693F8: .4byte gUnknown_085D847C
_080693FC: .4byte gUnknown_086B52CC

	THUMB_FUNC_END sub_80693CC

	THUMB_FUNC_START sub_8069400
sub_8069400: @ 0x08069400
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldrh r0, [r6, #0x2e]
	lsls r0, r0, #0x10
	asrs r4, r0, #0x11
	ldr r0, [r6, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	beq _08069416
	negs r4, r4
_08069416:
	lsls r1, r4, #0x10
	lsrs r1, r1, #0x10
	movs r0, #1
	movs r2, #0
	bl BG_SetPosition
	ldrh r0, [r6, #0x2e]
	adds r0, #1
	strh r0, [r6, #0x2e]
	adds r0, r6, #0
	adds r0, #0x2c
	adds r1, r6, #0
	adds r1, #0x44
	ldr r2, [r6, #0x48]
	bl EfxAdvanceFrameLut
	lsls r0, r0, #0x10
	asrs r4, r0, #0x10
	cmp r4, #0
	blt _08069460
	ldr r5, [r6, #0x4c]
	ldr r0, [r6, #0x54]
	lsls r4, r4, #2
	adds r0, r4, r0
	ldr r0, [r0]
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	ldr r0, [r6, #0x5c]
	adds r4, r4, r5
	ldr r1, [r4]
	movs r2, #0x20
	movs r3, #0x14
	bl SpellFx_WriteBgMapExt
	b _0806947E
_08069460:
	movs r0, #1
	negs r0, r0
	cmp r4, r0
	bne _0806947E
	bl SpellFx_ClearBG1
	ldr r1, _08069484  @ gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SetDefaultColorEffects_
	adds r0, r6, #0
	bl Proc_Break
_0806947E:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08069484: .4byte gEfxBgSemaphore

	THUMB_FUNC_END sub_8069400

	THUMB_FUNC_START sub_8069488
sub_8069488: @ 0x08069488
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _080694D0  @ gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _080694D4  @ ProcScr_efxDarkGradoBG02
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r1, [r0, #0x44]
	ldr r1, _080694D8  @ gUnknown_080DEDFA
	str r1, [r0, #0x48]
	ldr r1, _080694DC  @ gUnknown_085D83B8
	str r1, [r0, #0x4c]
	ldr r1, _080694E0  @ gUnknown_085D83F8
	str r1, [r0, #0x54]
	ldr r1, _080694E4  @ gUnknown_085D8438
	str r1, [r0, #0x58]
	ldr r0, _080694E8  @ gEkrDistanceType
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #1
	bne _080694F8
	adds r0, r4, #0
	bl GetAnimPosition
	cmp r0, #0
	bne _080694EC
	movs r0, #1
	movs r1, #0x28
	b _08069506
	.align 2, 0
_080694D0: .4byte gEfxBgSemaphore
_080694D4: .4byte ProcScr_efxDarkGradoBG02
_080694D8: .4byte gUnknown_080DEDFA
_080694DC: .4byte gUnknown_085D83B8
_080694E0: .4byte gUnknown_085D83F8
_080694E4: .4byte gUnknown_085D8438
_080694E8: .4byte gEkrDistanceType
_080694EC:
	ldr r1, _080694F4  @ 0x0000FFE8
	movs r0, #1
	b _08069506
	.align 2, 0
_080694F4: .4byte 0x0000FFE8
_080694F8:
	adds r0, r4, #0
	bl GetAnimPosition
	cmp r0, #0
	bne _0806950E
	movs r0, #1
	movs r1, #0x10
_08069506:
	movs r2, #0
	bl BG_SetPosition
	b _08069518
_0806950E:
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
_08069518:
	bl SpellFx_SetSomeColorEffect
	movs r0, #0
	bl SetBlendBackdropB
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8069488

	THUMB_FUNC_START sub_8069528
sub_8069528: @ 0x08069528
	adds r0, #0x4c
	movs r1, #0
	strh r1, [r0]
	bx lr

	THUMB_FUNC_END sub_8069528

	THUMB_FUNC_START sub_8069530
sub_8069530: @ 0x08069530
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x1c
	str r0, [sp, #4]
	ldr r0, _08069564  @ gPaletteBuffer
	mov r9, r0
	ldr r1, _08069568  @ gEfxPal
	mov r8, r1
	ldr r0, [sp, #4]
	adds r0, #0x4c
	movs r2, #0
	ldrsh r1, [r0, r2]
	cmp r1, #0x28
	ble _0806956C
	adds r3, r1, #0
	subs r3, #0x28
	movs r0, #0x18
	str r0, [sp]
	movs r0, #0
	movs r1, #0x10
	movs r2, #0
	b _08069582
	.align 2, 0
_08069564: .4byte gPaletteBuffer
_08069568: .4byte gEfxPal
_0806956C:
	cmp r1, #0x18
	ble _08069574
	movs r6, #0x10
	b _08069588
_08069574:
	movs r1, #0
	ldrsh r3, [r0, r1]
	movs r0, #0x18
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0x10
_08069582:
	bl Interpolate
	adds r6, r0, #0
_08069588:
	mov r2, r9
	ldrh r0, [r2]
	mov r7, r8
	strh r0, [r7]
	movs r2, #0
	ldr r0, [sp, #4]
	adds r0, #0x4c
	str r0, [sp, #8]
_08069598:
	subs r0, r2, #1
	cmp r0, #0x1d
	bhi _0806962C
	lsls r0, r0, #2
	ldr r1, _080695A8  @ _080695AC
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080695A8: .4byte _080695AC
_080695AC: @ jump table
	.4byte _08069624 @ case 0
	.4byte _08069624 @ case 1
	.4byte _08069624 @ case 2
	.4byte _0806962C @ case 3
	.4byte _0806962C @ case 4
	.4byte _0806962C @ case 5
	.4byte _0806962C @ case 6
	.4byte _0806962C @ case 7
	.4byte _0806962C @ case 8
	.4byte _0806962C @ case 9
	.4byte _0806962C @ case 10
	.4byte _0806962C @ case 11
	.4byte _0806962C @ case 12
	.4byte _0806962C @ case 13
	.4byte _0806962C @ case 14
	.4byte _08069624 @ case 15
	.4byte _0806962C @ case 16
	.4byte _0806962C @ case 17
	.4byte _0806962C @ case 18
	.4byte _0806962C @ case 19
	.4byte _08069624 @ case 20
	.4byte _08069624 @ case 21
	.4byte _0806962C @ case 22
	.4byte _0806962C @ case 23
	.4byte _0806962C @ case 24
	.4byte _0806962C @ case 25
	.4byte _08069624 @ case 26
	.4byte _08069624 @ case 27
	.4byte _08069624 @ case 28
	.4byte _08069624 @ case 29
_08069624:
	ldr r1, _08069628  @ 0x00007C1F
	b _0806962E
	.align 2, 0
_08069628: .4byte 0x00007C1F
_0806962C:
	movs r1, #0
_0806962E:
	movs r7, #2
	add r9, r7
	movs r0, #2
	add r8, r0
	lsrs r7, r1, #5
	str r7, [sp, #0x10]
	lsrs r0, r1, #0xa
	str r0, [sp, #0x14]
	adds r2, #1
	str r2, [sp, #0xc]
	movs r2, #0x1f
	mov ip, r2
	movs r5, #0x1f
	movs r0, #0x10
	subs r4, r0, r6
	movs r7, #0xe
	str r7, [sp, #0x18]
	ands r1, r5
	adds r0, r1, #0
	muls r0, r6, r0
	mov sl, r0
_08069658:
	mov r2, r9
	ldrh r1, [r2]
	adds r0, r5, #0
	ands r0, r1
	adds r3, r0, #0
	muls r3, r4, r3
	add r3, sl
	asrs r3, r3, #4
	lsls r1, r1, #0x10
	lsrs r0, r1, #0x15
	mov r7, ip
	ands r0, r7
	adds r2, r0, #0
	muls r2, r4, r2
	asrs r2, r2, #4
	lsrs r1, r1, #0x1a
	mov r0, ip
	ands r1, r0
	muls r1, r4, r1
	ldr r0, [sp, #0x14]
	ands r0, r7
	muls r0, r6, r0
	adds r1, r1, r0
	asrs r1, r1, #4
	ands r1, r5
	lsls r1, r1, #0xa
	ands r2, r5
	lsls r2, r2, #5
	orrs r1, r2
	ands r3, r5
	orrs r3, r1
	mov r0, r8
	strh r3, [r0]
	movs r1, #2
	add r9, r1
	add r8, r1
	ldr r2, [sp, #0x18]
	subs r2, #1
	str r2, [sp, #0x18]
	cmp r2, #0
	bge _08069658
	ldr r2, [sp, #0xc]
	cmp r2, #0x1f
	bgt _080696B2
	b _08069598
_080696B2:
	movs r1, #0xa0
	lsls r1, r1, #0x13
	movs r2, #0x80
	lsls r2, r2, #1
	ldr r0, _080696EC  @ gEfxPal
	bl CpuFastSet
	bl DisablePaletteSync
	ldr r7, [sp, #8]
	movs r1, #0
	ldrsh r0, [r7, r1]
	cmp r0, #0x40
	bne _080696D4
	ldr r0, [sp, #4]
	bl Proc_Break
_080696D4:
	ldr r2, [sp, #8]
	ldrh r0, [r2]
	adds r0, #1
	strh r0, [r2]
	add sp, #0x1c
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080696EC: .4byte gEfxPal

	THUMB_FUNC_END sub_8069530

	THUMB_FUNC_START sub_80696F0
sub_80696F0: @ 0x080696F0
	push {lr}
	ldr r0, _08069700  @ gUnknown_085D84B4
	movs r1, #0
	bl Proc_Start
	pop {r0}
	bx r0
	.align 2, 0
_08069700: .4byte gUnknown_085D84B4

	THUMB_FUNC_END sub_80696F0

	THUMB_FUNC_START sub_8069704
sub_8069704: @ 0x08069704
	push {lr}
	adds r3, r0, #0
	cmp r1, #5
	bhi _08069764
	lsls r0, r1, #2
	ldr r1, _08069718  @ _0806971C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08069718: .4byte _0806971C
_0806971C: @ jump table
	.4byte _08069734 @ case 0
	.4byte _0806973C @ case 1
	.4byte _08069744 @ case 2
	.4byte _0806974C @ case 3
	.4byte _08069754 @ case 4
	.4byte _0806975C @ case 5
_08069734:
	ldr r1, _08069738  @ gUnknown_085D84D4
	b _08069766
	.align 2, 0
_08069738: .4byte gUnknown_085D84D4
_0806973C:
	ldr r1, _08069740  @ gUnknown_085D8524
	b _08069766
	.align 2, 0
_08069740: .4byte gUnknown_085D8524
_08069744:
	ldr r1, _08069748  @ gUnknown_085D8574
	b _08069766
	.align 2, 0
_08069748: .4byte gUnknown_085D8574
_0806974C:
	ldr r1, _08069750  @ gUnknown_085D85C4
	b _08069766
	.align 2, 0
_08069750: .4byte gUnknown_085D85C4
_08069754:
	ldr r1, _08069758  @ gUnknown_085D8614
	b _08069766
	.align 2, 0
_08069758: .4byte gUnknown_085D8614
_0806975C:
	ldr r1, _08069760  @ gUnknown_085D8664
	b _08069766
	.align 2, 0
_08069760: .4byte gUnknown_085D8664
_08069764:
	ldr r1, _08069778  @ gUnknown_085D86B4
_08069766:
	lsls r0, r3, #2
	adds r0, r0, r1
	movs r1, #0
	ldrsh r0, [r0, r1]
	muls r0, r2, r0
	asrs r0, r0, #8
	pop {r1}
	bx r1
	.align 2, 0
_08069778: .4byte gUnknown_085D86B4

	THUMB_FUNC_END sub_8069704

	THUMB_FUNC_START sub_806977C
sub_806977C: @ 0x0806977C
	push {lr}
	adds r3, r0, #0
	cmp r1, #5
	bhi _080697DC
	lsls r0, r1, #2
	ldr r1, _08069790  @ _08069794
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08069790: .4byte _08069794
_08069794: @ jump table
	.4byte _080697AC @ case 0
	.4byte _080697B4 @ case 1
	.4byte _080697BC @ case 2
	.4byte _080697C4 @ case 3
	.4byte _080697CC @ case 4
	.4byte _080697D4 @ case 5
_080697AC:
	ldr r1, _080697B0  @ gUnknown_085D84D4
	b _080697DE
	.align 2, 0
_080697B0: .4byte gUnknown_085D84D4
_080697B4:
	ldr r1, _080697B8  @ gUnknown_085D8524
	b _080697DE
	.align 2, 0
_080697B8: .4byte gUnknown_085D8524
_080697BC:
	ldr r1, _080697C0  @ gUnknown_085D8574
	b _080697DE
	.align 2, 0
_080697C0: .4byte gUnknown_085D8574
_080697C4:
	ldr r1, _080697C8  @ gUnknown_085D85C4
	b _080697DE
	.align 2, 0
_080697C8: .4byte gUnknown_085D85C4
_080697CC:
	ldr r1, _080697D0  @ gUnknown_085D8614
	b _080697DE
	.align 2, 0
_080697D0: .4byte gUnknown_085D8614
_080697D4:
	ldr r1, _080697D8  @ gUnknown_085D8664
	b _080697DE
	.align 2, 0
_080697D8: .4byte gUnknown_085D8664
_080697DC:
	ldr r1, _080697F0  @ gUnknown_085D86B4
_080697DE:
	lsls r0, r3, #2
	adds r0, r0, r1
	movs r1, #2
	ldrsh r0, [r0, r1]
	muls r0, r2, r0
	asrs r0, r0, #8
	pop {r1}
	bx r1
	.align 2, 0
_080697F0: .4byte gUnknown_085D86B4

	THUMB_FUNC_END sub_806977C

	THUMB_FUNC_START sub_80697F4
sub_80697F4: @ 0x080697F4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _08069816
	movs r1, #0x2c
	ldrsh r0, [r4, r1]
	ldr r1, [r4, #0x44]
	ldr r2, [r4, #0x48]
	bl sub_8069704
	ldr r2, [r4, #0x60]
	ldrh r1, [r4, #0x32]
	adds r1, r1, r0
	b _08069828
_08069816:
	movs r2, #0x2c
	ldrsh r0, [r4, r2]
	ldr r1, [r4, #0x44]
	ldr r2, [r4, #0x48]
	bl sub_8069704
	ldr r2, [r4, #0x60]
	ldrh r1, [r4, #0x32]
	subs r1, r1, r0
_08069828:
	strh r1, [r2, #2]
	movs r1, #0x2c
	ldrsh r0, [r4, r1]
	ldr r1, [r4, #0x44]
	ldr r2, [r4, #0x48]
	bl sub_806977C
	ldr r2, [r4, #0x60]
	ldrh r1, [r4, #0x3a]
	adds r1, r1, r0
	strh r1, [r2, #4]
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x2e
	ldrsh r1, [r4, r2]
	cmp r0, r1
	beq _0806985A
	movs r0, #0x2c
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #0x4c]
	cmp r1, r0
	bne _0806986E
_0806985A:
	ldr r0, _08069874  @ gEfxBgSemaphore
	ldr r1, [r0]
	subs r1, #1
	str r1, [r0]
	ldr r0, [r4, #0x60]
	bl AnimDelete
	adds r0, r4, #0
	bl Proc_Break
_0806986E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08069874: .4byte gEfxBgSemaphore

	THUMB_FUNC_END sub_80697F4

	THUMB_FUNC_START sub_8069878
sub_8069878: @ 0x08069878
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r6, r0, #0
	adds r4, r1, #0
	ldr r0, [sp, #0x20]
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r2, r2, #0x10
	lsrs r7, r2, #0x10
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	mov r8, r3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r9, r0
	ldr r1, _080698CC  @ gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _080698D0  @ gUnknown_085D8704
	movs r1, #3
	bl Proc_Start
	adds r5, r0, #0
	str r6, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	movs r0, #0x14
	strh r0, [r5, #0x2e]
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	cmp r4, #1
	beq _080698E4
	cmp r4, #1
	bgt _080698D4
	cmp r4, #0
	beq _080698DA
	b _080698F4
	.align 2, 0
_080698CC: .4byte gEfxBgSemaphore
_080698D0: .4byte gUnknown_085D8704
_080698D4:
	cmp r4, #2
	beq _080698EC
	b _080698F4
_080698DA:
	ldr r3, _080698E0  @ gUnknown_086A2724
	b _080698F6
	.align 2, 0
_080698E0: .4byte gUnknown_086A2724
_080698E4:
	ldr r3, _080698E8  @ gUnknown_086A2844
	b _080698F6
	.align 2, 0
_080698E8: .4byte gUnknown_086A2844
_080698EC:
	ldr r3, _080698F0  @ gUnknown_086A273C
	b _080698F6
	.align 2, 0
_080698F0: .4byte gUnknown_086A273C
_080698F4:
	ldr r3, _08069928  @ gUnknown_086A285C
_080698F6:
	lsls r0, r7, #0x10
	asrs r0, r0, #0x10
	str r0, [r5, #0x44]
	mov r1, r8
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	str r0, [r5, #0x48]
	mov r0, r9
	str r0, [r5, #0x4c]
	str r3, [sp]
	adds r0, r6, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl EfxCreateFrontAnim
	adds r4, r0, #0
	str r4, [r5, #0x60]
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _0806992C
	movs r0, #0x58
	b _0806992E
	.align 2, 0
_08069928: .4byte gUnknown_086A285C
_0806992C:
	movs r0, #0x98
_0806992E:
	strh r0, [r5, #0x32]
	movs r0, #0x50
	strh r0, [r5, #0x3a]
	ldr r0, _08069950  @ gEkrDistanceType
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #1
	bne _0806995A
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _08069954
	ldrh r0, [r5, #0x32]
	subs r0, #0x18
	b _08069958
	.align 2, 0
_08069950: .4byte gEkrDistanceType
_08069954:
	ldrh r0, [r5, #0x32]
	adds r0, #0x18
_08069958:
	strh r0, [r5, #0x32]
_0806995A:
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _08069976
	movs r1, #0x2c
	ldrsh r0, [r5, r1]
	ldr r1, [r5, #0x44]
	ldr r2, [r5, #0x48]
	bl sub_8069704
	ldrh r1, [r5, #0x32]
	adds r1, r1, r0
	b _08069986
_08069976:
	movs r1, #0x2c
	ldrsh r0, [r5, r1]
	ldr r1, [r5, #0x44]
	ldr r2, [r5, #0x48]
	bl sub_8069704
	ldrh r1, [r5, #0x32]
	subs r1, r1, r0
_08069986:
	strh r1, [r4, #2]
	movs r1, #0x2c
	ldrsh r0, [r5, r1]
	ldr r1, [r5, #0x44]
	ldr r2, [r5, #0x48]
	bl sub_806977C
	ldrh r1, [r5, #0x3a]
	adds r1, r1, r0
	strh r1, [r4, #4]
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8069878

	THUMB_FUNC_START sub_80699A8
sub_80699A8: @ 0x080699A8
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r7, r0, #0
	ldrh r0, [r7, #0x2c]
	adds r0, #1
	strh r0, [r7, #0x2c]
	movs r1, #0x2c
	ldrsh r0, [r7, r1]
	movs r1, #0xc
	bl DivRem
	cmp r0, #0
	bne _08069AAE
	ldrh r1, [r7, #0x2e]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _08069A2C
	ldr r0, [r7, #0x5c]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x11
	movs r5, #3
	ands r1, r5
	movs r6, #0x80
	lsls r6, r6, #1
	ldrh r2, [r7, #0x2c]
	movs r4, #0x62
	subs r2, r4, r2
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	str r2, [sp]
	movs r2, #0
	adds r3, r6, #0
	bl sub_8069878
	ldr r0, [r7, #0x5c]
	ldrh r1, [r7, #0x2e]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x11
	adds r1, #2
	ands r1, r5
	ldrh r2, [r7, #0x2c]
	subs r2, r4, r2
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	str r2, [sp]
	movs r2, #1
	adds r3, r6, #0
	bl sub_8069878
	ldr r0, [r7, #0x5c]
	ldrh r1, [r7, #0x2e]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x11
	adds r1, #1
	ands r1, r5
	ldrh r2, [r7, #0x2c]
	subs r4, r4, r2
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	str r4, [sp]
	movs r2, #2
	adds r3, r6, #0
	bl sub_8069878
	b _08069AA8
_08069A2C:
	ldr r0, [r7, #0x5c]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x11
	movs r5, #3
	ands r1, r5
	movs r6, #0x80
	lsls r6, r6, #1
	ldrh r2, [r7, #0x2c]
	movs r4, #0x62
	subs r2, r4, r2
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	str r2, [sp]
	movs r2, #3
	adds r3, r6, #0
	bl sub_8069878
	ldr r0, [r7, #0x5c]
	ldrh r1, [r7, #0x2e]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x11
	adds r1, #2
	ands r1, r5
	ldrh r2, [r7, #0x2c]
	subs r2, r4, r2
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	str r2, [sp]
	movs r2, #4
	adds r3, r6, #0
	bl sub_8069878
	ldr r0, [r7, #0x5c]
	ldrh r1, [r7, #0x2e]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x11
	adds r1, #1
	ands r1, r5
	ldrh r2, [r7, #0x2c]
	subs r2, r4, r2
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	str r2, [sp]
	movs r2, #5
	adds r3, r6, #0
	bl sub_8069878
	ldr r0, [r7, #0x5c]
	ldrh r1, [r7, #0x2e]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x11
	adds r1, #3
	ands r1, r5
	ldrh r2, [r7, #0x2c]
	subs r4, r4, r2
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	str r4, [sp]
	movs r2, #6
	adds r3, r6, #0
	bl sub_8069878
_08069AA8:
	ldrh r0, [r7, #0x2e]
	adds r0, #1
	strh r0, [r7, #0x2e]
_08069AAE:
	movs r1, #0x2c
	ldrsh r0, [r7, r1]
	cmp r0, #0x61
	bne _08069ABC
	adds r0, r7, #0
	bl Proc_Break
_08069ABC:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80699A8

	THUMB_FUNC_START sub_8069AC4
sub_8069AC4: @ 0x08069AC4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08069AF0  @ ProcScr_efxDarkGradoOBJ01
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r1, [r0, #0x2e]
	ldr r0, _08069AF4  @ gUnknown_086A2614
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _08069AF8  @ gUnknown_086A21F4
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08069AF0: .4byte ProcScr_efxDarkGradoOBJ01
_08069AF4: .4byte gUnknown_086A2614
_08069AF8: .4byte gUnknown_086A21F4

	THUMB_FUNC_END sub_8069AC4

	THUMB_FUNC_START sub_8069AFC
sub_8069AFC: @ 0x08069AFC
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x48]
	ldr r1, [r4, #0x44]
	adds r0, r0, r1
	str r0, [r4, #0x48]
	ldr r0, [r4, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _08069B20
	ldr r2, [r4, #0x60]
	ldr r1, [r4, #0x48]
	asrs r1, r1, #8
	ldrh r0, [r4, #0x32]
	subs r0, r0, r1
	strh r0, [r2, #2]
	b _08069B2C
_08069B20:
	ldr r1, [r4, #0x60]
	ldr r0, [r4, #0x48]
	asrs r0, r0, #8
	ldrh r2, [r4, #0x32]
	adds r0, r0, r2
	strh r0, [r1, #2]
_08069B2C:
	ldr r1, [r4, #0x60]
	ldr r0, [r4, #0x48]
	asrs r0, r0, #8
	ldrh r2, [r4, #0x3a]
	adds r0, r0, r2
	strh r0, [r1, #4]
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x2e
	ldrsh r1, [r4, r2]
	cmp r0, r1
	bne _08069B5E
	ldr r0, _08069B64  @ gEfxBgSemaphore
	ldr r1, [r0]
	subs r1, #1
	str r1, [r0]
	ldr r0, [r4, #0x60]
	bl AnimDelete
	adds r0, r4, #0
	bl Proc_Break
_08069B5E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08069B64: .4byte gEfxBgSemaphore

	THUMB_FUNC_END sub_8069AFC

	THUMB_FUNC_START sub_8069B68
sub_8069B68: @ 0x08069B68
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r6, r0, #0
	mov r9, r1
	mov r8, r2
	adds r5, r3, #0
	ldr r4, [sp, #0x20]
	ldr r1, _08069BC8  @ gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08069BCC  @ ProcScr_efxDarkGradoOBJ02piece
	movs r1, #3
	bl Proc_Start
	adds r7, r0, #0
	str r6, [r7, #0x5c]
	movs r0, #0
	strh r0, [r7, #0x2c]
	strh r4, [r7, #0x2e]
	str r5, [r7, #0x44]
	str r0, [r7, #0x48]
	ldr r3, _08069BD0  @ gUnknown_086A2E98
	ldr r2, _08069BD4  @ gUnknown_086A2DBC
	str r2, [sp]
	adds r0, r6, #0
	adds r1, r3, #0
	bl EfxCreateFrontAnim
	adds r4, r0, #0
	str r4, [r7, #0x60]
	movs r0, #0x68
	strh r0, [r4, #2]
	mov r0, r8
	strh r0, [r4, #4]
	ldr r0, [r7, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _08069BD8
	ldrh r0, [r4, #2]
	mov r1, r9
	subs r0, r0, r1
	b _08069BDC
	.align 2, 0
_08069BC8: .4byte gEfxBgSemaphore
_08069BCC: .4byte ProcScr_efxDarkGradoOBJ02piece
_08069BD0: .4byte gUnknown_086A2E98
_08069BD4: .4byte gUnknown_086A2DBC
_08069BD8:
	ldrh r0, [r4, #2]
	add r0, r9
_08069BDC:
	strh r0, [r4, #2]
	ldr r0, _08069BF8  @ gEkrDistanceType
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #1
	bne _08069C02
	ldr r0, [r7, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _08069BFC
	ldrh r0, [r4, #2]
	subs r0, #0x18
	b _08069C00
	.align 2, 0
_08069BF8: .4byte gEkrDistanceType
_08069BFC:
	ldrh r0, [r4, #2]
	adds r0, #0x18
_08069C00:
	strh r0, [r4, #2]
_08069C02:
	ldrh r0, [r4, #2]
	strh r0, [r7, #0x32]
	ldrh r0, [r4, #4]
	strh r0, [r7, #0x3a]
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8069B68

	THUMB_FUNC_START sub_8069C18
sub_8069C18: @ 0x08069C18
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r6, r0, #0
	mov r9, r1
	mov r8, r2
	adds r5, r3, #0
	ldr r4, [sp, #0x20]
	ldr r1, _08069C78  @ gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08069C7C  @ ProcScr_efxDarkGradoOBJ02piece
	movs r1, #3
	bl Proc_Start
	adds r7, r0, #0
	str r6, [r7, #0x5c]
	movs r0, #0
	strh r0, [r7, #0x2c]
	strh r4, [r7, #0x2e]
	str r5, [r7, #0x44]
	str r0, [r7, #0x48]
	ldr r3, _08069C80  @ gUnknown_086A2EAC
	ldr r2, _08069C84  @ gUnknown_086A2DD0
	str r2, [sp]
	adds r0, r6, #0
	adds r1, r3, #0
	bl EfxCreateFrontAnim
	adds r4, r0, #0
	str r4, [r7, #0x60]
	movs r0, #0x78
	strh r0, [r4, #2]
	mov r0, r8
	strh r0, [r4, #4]
	ldr r0, [r7, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _08069C88
	ldrh r0, [r4, #2]
	mov r1, r9
	subs r0, r0, r1
	b _08069C8C
	.align 2, 0
_08069C78: .4byte gEfxBgSemaphore
_08069C7C: .4byte ProcScr_efxDarkGradoOBJ02piece
_08069C80: .4byte gUnknown_086A2EAC
_08069C84: .4byte gUnknown_086A2DD0
_08069C88:
	ldrh r0, [r4, #2]
	add r0, r9
_08069C8C:
	strh r0, [r4, #2]
	ldr r0, _08069CA8  @ gEkrDistanceType
	movs r2, #0
	ldrsh r0, [r0, r2]
	cmp r0, #1
	bne _08069CB2
	ldr r0, [r7, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _08069CAC
	ldrh r0, [r4, #2]
	subs r0, #0x18
	b _08069CB0
	.align 2, 0
_08069CA8: .4byte gEkrDistanceType
_08069CAC:
	ldrh r0, [r4, #2]
	adds r0, #0x18
_08069CB0:
	strh r0, [r4, #2]
_08069CB2:
	ldrh r0, [r4, #2]
	strh r0, [r7, #0x32]
	ldrh r0, [r4, #4]
	strh r0, [r7, #0x3a]
	movs r0, #0x14
	strh r0, [r4, #0xa]
	ldrh r1, [r4, #8]
	movs r2, #0xc0
	lsls r2, r2, #4
	adds r0, r2, #0
	orrs r0, r1
	strh r0, [r4, #8]
	bl AnimSort
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8069C18

	THUMB_FUNC_START sub_8069CDC
sub_8069CDC: @ 0x08069CDC
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	ldrh r0, [r6, #0x2c]
	adds r0, #1
	strh r0, [r6, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x57
	ble _08069CF2
	b _08069E70
_08069CF2:
	movs r1, #0x2c
	ldrsh r0, [r6, r1]
	subs r0, #3
	cmp r0, #0
	ble _08069DBE
	movs r1, #6
	bl DivRem
	cmp r0, #0
	bne _08069DBE
	ldr r0, [r6, #0x44]
	cmp r0, #5
	bhi _08069DB0
	lsls r0, r0, #2
	ldr r1, _08069D18  @ _08069D1C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08069D18: .4byte _08069D1C
_08069D1C: @ jump table
	.4byte _08069D34 @ case 0
	.4byte _08069D3C @ case 1
	.4byte _08069D4C @ case 2
	.4byte _08069D68 @ case 3
	.4byte _08069D78 @ case 4
	.4byte _08069D96 @ case 5
_08069D34:
	ldr r0, [r6, #0x5c]
	movs r1, #0x40
	negs r1, r1
	b _08069D7E
_08069D3C:
	ldr r0, [r6, #0x5c]
	movs r1, #0x80
	negs r1, r1
	movs r2, #0x10
	negs r2, r2
	movs r3, #0xf0
	lsls r3, r3, #3
	b _08069D86
_08069D4C:
	ldr r0, [r6, #0x5c]
	movs r2, #0x10
	negs r2, r2
	movs r3, #0x90
	lsls r3, r3, #4
	movs r1, #0x2c
	ldrsh r4, [r6, r1]
	movs r1, #0x62
	subs r1, r1, r4
	str r1, [sp]
	movs r1, #0
	bl sub_8069B68
	b _08069DB0
_08069D68:
	ldr r0, [r6, #0x5c]
	movs r1, #0x40
	negs r1, r1
	movs r2, #0x10
	negs r2, r2
	movs r3, #0x90
	lsls r3, r3, #4
	b _08069D86
_08069D78:
	ldr r0, [r6, #0x5c]
	movs r1, #0x80
	negs r1, r1
_08069D7E:
	movs r2, #0x10
	negs r2, r2
	movs r3, #0xa8
	lsls r3, r3, #4
_08069D86:
	movs r4, #0x2c
	ldrsh r5, [r6, r4]
	movs r4, #0x62
	subs r4, r4, r5
	str r4, [sp]
	bl sub_8069B68
	b _08069DB0
_08069D96:
	ldr r0, [r6, #0x5c]
	movs r2, #0x10
	negs r2, r2
	movs r3, #0xf0
	lsls r3, r3, #3
	movs r1, #0x2c
	ldrsh r4, [r6, r1]
	movs r1, #0x62
	subs r1, r1, r4
	str r1, [sp]
	movs r1, #0
	bl sub_8069B68
_08069DB0:
	ldr r0, [r6, #0x44]
	adds r0, #1
	str r0, [r6, #0x44]
	cmp r0, #6
	bne _08069DBE
	movs r0, #0
	str r0, [r6, #0x44]
_08069DBE:
	movs r2, #0x2c
	ldrsh r0, [r6, r2]
	subs r0, #1
	cmp r0, #0
	ble _08069E70
	movs r1, #6
	bl DivRem
	cmp r0, #0
	bne _08069E70
	ldr r0, [r6, #0x48]
	cmp r0, #5
	bhi _08069E62
	lsls r0, r0, #2
	ldr r1, _08069DE4  @ _08069DE8
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08069DE4: .4byte _08069DE8
_08069DE8: @ jump table
	.4byte _08069E00 @ case 0
	.4byte _08069E08 @ case 1
	.4byte _08069E14 @ case 2
	.4byte _08069E20 @ case 3
	.4byte _08069E2C @ case 4
	.4byte _08069E48 @ case 5
_08069E00:
	ldr r0, [r6, #0x5c]
	movs r1, #0x18
	negs r1, r1
	b _08069E32
_08069E08:
	ldr r0, [r6, #0x5c]
	movs r1, #0x38
	negs r1, r1
	movs r3, #0xf0
	lsls r3, r3, #2
	b _08069E36
_08069E14:
	ldr r0, [r6, #0x5c]
	movs r1, #0x58
	negs r1, r1
	movs r3, #0x90
	lsls r3, r3, #3
	b _08069E36
_08069E20:
	ldr r0, [r6, #0x5c]
	movs r1, #0x18
	negs r1, r1
	movs r3, #0x90
	lsls r3, r3, #3
	b _08069E36
_08069E2C:
	ldr r0, [r6, #0x5c]
	movs r1, #0x38
	negs r1, r1
_08069E32:
	movs r3, #0xa8
	lsls r3, r3, #3
_08069E36:
	movs r2, #0x2c
	ldrsh r4, [r6, r2]
	movs r2, #0x62
	subs r2, r2, r4
	str r2, [sp]
	movs r2, #0
	bl sub_8069C18
	b _08069E62
_08069E48:
	ldr r0, [r6, #0x5c]
	movs r1, #0x58
	negs r1, r1
	movs r3, #0xf0
	lsls r3, r3, #2
	movs r2, #0x2c
	ldrsh r4, [r6, r2]
	movs r2, #0x62
	subs r2, r2, r4
	str r2, [sp]
	movs r2, #0
	bl sub_8069C18
_08069E62:
	ldr r0, [r6, #0x48]
	adds r0, #1
	str r0, [r6, #0x48]
	cmp r0, #6
	bne _08069E70
	movs r0, #0
	str r0, [r6, #0x48]
_08069E70:
	movs r4, #0x2c
	ldrsh r0, [r6, r4]
	cmp r0, #0x60
	bne _08069E7E
	adds r0, r6, #0
	bl Proc_Break
_08069E7E:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8069CDC

	THUMB_FUNC_START sub_8069E88
sub_8069E88: @ 0x08069E88
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08069EB8  @ ProcScr_efxDarkGradoOBJ02
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r1, [r0, #0x44]
	str r1, [r0, #0x48]
	ldr r0, _08069EBC  @ gUnknown_086A2CE8
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _08069EC0  @ gUnknown_086A2874
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08069EB8: .4byte ProcScr_efxDarkGradoOBJ02
_08069EBC: .4byte gUnknown_086A2CE8
_08069EC0: .4byte gUnknown_086A2874

	THUMB_FUNC_END sub_8069E88

	THUMB_FUNC_START StartSpellAnimCrimsonEye
StartSpellAnimCrimsonEye: @ 0x08069EC4
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl NewEfxSpellCast
	bl SpellFx_ClearBG1Position
	ldr r0, _08069EFC  @ ProcScr_efxCrimsonEye
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
_08069EFC: .4byte ProcScr_efxCrimsonEye

	THUMB_FUNC_END StartSpellAnimCrimsonEye

	THUMB_FUNC_START sub_8069F00
sub_8069F00: @ 0x08069F00
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
	bne _08069F2C
	ldr r0, [r4, #0x5c]
	movs r1, #1
	negs r1, r1
	bl NewEfxFarAttackWithDistance
	b _08069FFE
_08069F2C:
	movs r0, #0x2c
	ldrsh r1, [r4, r0]
	adds r0, r2, #0
	adds r0, #0xb
	cmp r1, r0
	bne _08069F54
	adds r0, r5, #0
	bl sub_806ABCC
	ldr r0, _08069F50  @ 0x000003C7
	movs r1, #0x80
	lsls r1, r1, #1
	movs r2, #0xc0
	movs r3, #1
	bl PlaySFX
	b _08069FFE
	.align 2, 0
_08069F50: .4byte 0x000003C7
_08069F54:
	adds r0, r2, #0
	adds r0, #0x91
	cmp r1, r0
	bne _08069F64
	adds r0, r5, #0
	bl sub_806A4CC
	b _08069FFE
_08069F64:
	adds r0, r2, #0
	adds r0, #0xd1
	cmp r1, r0
	bne _08069F76
	adds r0, r5, #0
	movs r1, #0xa
	bl NewEfxFlashBgWhite
	b _08069FFE
_08069F76:
	adds r0, r2, #0
	adds r0, #0xd9
	cmp r1, r0
	bne _08069F96
	adds r0, r5, #0
	bl sub_806A068
	adds r0, r5, #0
	bl sub_806A3CC
	ldr r0, [r4, #0x5c]
	movs r1, #0x4a
	movs r2, #2
	bl StartSpellThing_MagicQuake
	b _08069FFE
_08069F96:
	ldr r3, _08069FA4  @ 0x00000101
	adds r0, r2, r3
	cmp r1, r0
	bne _08069FA8
	bl sub_806C608
	b _08069FFE
	.align 2, 0
_08069FA4: .4byte 0x00000101
_08069FA8:
	ldr r3, _08069FB8  @ 0x00000109
	adds r0, r2, r3
	cmp r1, r0
	bne _08069FBC
	adds r0, r5, #0
	bl sub_806A3F4
	b _08069FFE
	.align 2, 0
_08069FB8: .4byte 0x00000109
_08069FBC:
	ldr r3, _08069FE4  @ 0x00000123
	adds r0, r2, r3
	cmp r1, r0
	bne _08069FE8
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
	bne _08069FFE
	adds r0, r5, #0
	bl EfxPlayHittedSFX
	b _08069FFE
	.align 2, 0
_08069FE4: .4byte 0x00000123
_08069FE8:
	ldr r3, _0806A004  @ 0x00000137
	adds r0, r2, r3
	cmp r1, r0
	bne _08069FFE
	bl SpellFx_Finish
	bl RegisterEfxSpellCastEnd
	adds r0, r4, #0
	bl Proc_Break
_08069FFE:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806A004: .4byte 0x00000137

	THUMB_FUNC_END sub_8069F00

	THUMB_FUNC_START sub_806A008
sub_806A008: @ 0x0806A008
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
	blt _0806A03E
	ldr r1, [r6, #0x4c]
	ldr r5, [r6, #0x54]
	ldr r0, [r6, #0x5c]
	lsls r4, r4, #2
	adds r1, r4, r1
	ldr r2, [r1]
	adds r1, r2, #0
	bl SpellFx_WriteBgMap
	adds r4, r4, r5
	ldr r0, [r4]
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
_0806A03E:
	ldrh r0, [r6, #0x2e]
	adds r0, #1
	strh r0, [r6, #0x2e]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x30
	bne _0806A05E
	bl SpellFx_ClearBG1
	ldr r1, _0806A064  @ gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r6, #0
	bl Proc_Break
_0806A05E:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806A064: .4byte gEfxBgSemaphore

	THUMB_FUNC_END sub_806A008

	THUMB_FUNC_START sub_806A068
sub_806A068: @ 0x0806A068
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _0806A0B0  @ gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0806A0B4  @ ProcScr_efxCrimsonEyeBGFinish1
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r1, [r0, #0x2e]
	str r1, [r0, #0x44]
	ldr r1, _0806A0B8  @ gUnknown_080DEEC2
	str r1, [r0, #0x48]
	ldr r1, _0806A0BC  @ gUnknown_085D877C
	str r1, [r0, #0x4c]
	ldr r1, _0806A0C0  @ gUnknown_085D878C
	str r1, [r0, #0x54]
	ldr r0, _0806A0C4  @ gUnknown_086BC824
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	ldr r0, _0806A0C8  @ sub_806B088
	bl SetPrimaryHBlankHandler
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806A0B0: .4byte gEfxBgSemaphore
_0806A0B4: .4byte ProcScr_efxCrimsonEyeBGFinish1
_0806A0B8: .4byte gUnknown_080DEEC2
_0806A0BC: .4byte gUnknown_085D877C
_0806A0C0: .4byte gUnknown_085D878C
_0806A0C4: .4byte gUnknown_086BC824
_0806A0C8: .4byte sub_806B088

	THUMB_FUNC_END sub_806A068

	THUMB_FUNC_START sub_806A0CC
sub_806A0CC: @ 0x0806A0CC
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	movs r0, #0x32
	ldrsh r2, [r4, r0]
	movs r1, #0x2c
	ldrsh r3, [r4, r1]
	movs r1, #0x2e
	ldrsh r0, [r4, r1]
	str r0, [sp]
	movs r0, #0
	movs r1, #0x78
	bl Interpolate
	ldr r1, [r4, #0x60]
	strh r0, [r1, #2]
	movs r0, #0x3a
	ldrsh r2, [r4, r0]
	movs r1, #0x2c
	ldrsh r3, [r4, r1]
	movs r1, #0x2e
	ldrsh r0, [r4, r1]
	str r0, [sp]
	movs r0, #0
	movs r1, #0x40
	bl Interpolate
	ldr r1, [r4, #0x60]
	strh r0, [r1, #4]
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x2e
	ldrsh r1, [r4, r2]
	cmp r0, r1
	bne _0806A12C
	ldr r0, _0806A134  @ gEfxBgSemaphore
	ldr r1, [r0]
	subs r1, #1
	str r1, [r0]
	ldr r0, [r4, #0x60]
	bl AnimDelete
	adds r0, r4, #0
	bl Proc_Break
_0806A12C:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806A134: .4byte gEfxBgSemaphore

	THUMB_FUNC_END sub_806A0CC

	THUMB_FUNC_START sub_806A138
sub_806A138: @ 0x0806A138
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r7, r0, #0
	adds r5, r1, #0
	adds r4, r3, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	mov r8, r2
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r1, _0806A1D8  @ gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0806A1DC  @ ProcScr_efxCrimsonEyeOBJFinishPiece
	movs r1, #3
	bl Proc_Start
	adds r6, r0, #0
	str r7, [r6, #0x5c]
	movs r0, #1
	strh r0, [r6, #0x2c]
	adds r5, #1
	strh r5, [r6, #0x2e]
	ldr r3, _0806A1E0  @ gUnknown_086B598C
	cmp r4, #0
	beq _0806A174
	ldr r3, _0806A1E4  @ gUnknown_086B5984
_0806A174:
	str r3, [sp]
	adds r0, r7, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl EfxCreateFrontAnim
	adds r4, r0, #0
	str r4, [r6, #0x60]
	ldr r1, _0806A1E8  @ gUnknown_085D87DC
	mov r2, r8
	lsls r0, r2, #2
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r6, #0x32]
	lsls r0, r2, #1
	adds r0, #1
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r6, #0x3a]
	movs r0, #0x32
	ldrsh r2, [r6, r0]
	movs r1, #0x2c
	ldrsh r3, [r6, r1]
	movs r1, #0x2e
	ldrsh r0, [r6, r1]
	str r0, [sp]
	movs r0, #0
	movs r1, #0x78
	bl Interpolate
	strh r0, [r4, #2]
	movs r0, #0x3a
	ldrsh r2, [r6, r0]
	movs r1, #0x2c
	ldrsh r3, [r6, r1]
	movs r1, #0x2e
	ldrsh r0, [r6, r1]
	str r0, [sp]
	movs r0, #0
	movs r1, #0x40
	bl Interpolate
	strh r0, [r4, #4]
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806A1D8: .4byte gEfxBgSemaphore
_0806A1DC: .4byte ProcScr_efxCrimsonEyeOBJFinishPiece
_0806A1E0: .4byte gUnknown_086B598C
_0806A1E4: .4byte gUnknown_086B5984
_0806A1E8: .4byte gUnknown_085D87DC

	THUMB_FUNC_END sub_806A138

	THUMB_FUNC_START sub_806A1EC
sub_806A1EC: @ 0x0806A1EC
	push {r4, lr}
	adds r4, r0, #0
	ldrh r1, [r4, #0x2c]
	movs r2, #0x2c
	ldrsh r0, [r4, r2]
	cmp r0, #0x2b
	ble _0806A1FC
	b _0806A3A4
_0806A1FC:
	movs r0, #0x1f
	ands r0, r1
	cmp r0, #0x1f
	bls _0806A206
	b _0806A3A4
_0806A206:
	lsls r0, r0, #2
	ldr r1, _0806A210  @ _0806A214
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0806A210: .4byte _0806A214
_0806A214: @ jump table
	.4byte _0806A294 @ case 0
	.4byte _0806A314 @ case 1
	.4byte _0806A2D4 @ case 2
	.4byte _0806A354 @ case 3
	.4byte _0806A29C @ case 4
	.4byte _0806A31C @ case 5
	.4byte _0806A2DC @ case 6
	.4byte _0806A35C @ case 7
	.4byte _0806A2A4 @ case 8
	.4byte _0806A324 @ case 9
	.4byte _0806A2E4 @ case 10
	.4byte _0806A364 @ case 11
	.4byte _0806A2AC @ case 12
	.4byte _0806A32C @ case 13
	.4byte _0806A2EC @ case 14
	.4byte _0806A36C @ case 15
	.4byte _0806A2B4 @ case 16
	.4byte _0806A334 @ case 17
	.4byte _0806A2F4 @ case 18
	.4byte _0806A374 @ case 19
	.4byte _0806A2BC @ case 20
	.4byte _0806A33C @ case 21
	.4byte _0806A2FC @ case 22
	.4byte _0806A37C @ case 23
	.4byte _0806A2C4 @ case 24
	.4byte _0806A344 @ case 25
	.4byte _0806A304 @ case 26
	.4byte _0806A38A @ case 27
	.4byte _0806A2CC @ case 28
	.4byte _0806A34C @ case 29
	.4byte _0806A30C @ case 30
	.4byte _0806A398 @ case 31
_0806A294:
	ldr r0, [r4, #0x5c]
	movs r1, #6
	movs r2, #0
	b _0806A390
_0806A29C:
	ldr r0, [r4, #0x5c]
	movs r1, #6
	movs r2, #4
	b _0806A382
_0806A2A4:
	ldr r0, [r4, #0x5c]
	movs r1, #6
	movs r2, #1
	b _0806A390
_0806A2AC:
	ldr r0, [r4, #0x5c]
	movs r1, #6
	movs r2, #5
	b _0806A382
_0806A2B4:
	ldr r0, [r4, #0x5c]
	movs r1, #6
	movs r2, #2
	b _0806A390
_0806A2BC:
	ldr r0, [r4, #0x5c]
	movs r1, #6
	movs r2, #6
	b _0806A382
_0806A2C4:
	ldr r0, [r4, #0x5c]
	movs r1, #6
	movs r2, #3
	b _0806A390
_0806A2CC:
	ldr r0, [r4, #0x5c]
	movs r1, #6
	movs r2, #7
	b _0806A382
_0806A2D4:
	ldr r0, [r4, #0x5c]
	movs r1, #6
	movs r2, #8
	b _0806A390
_0806A2DC:
	ldr r0, [r4, #0x5c]
	movs r1, #6
	movs r2, #0xc
	b _0806A382
_0806A2E4:
	ldr r0, [r4, #0x5c]
	movs r1, #6
	movs r2, #9
	b _0806A390
_0806A2EC:
	ldr r0, [r4, #0x5c]
	movs r1, #6
	movs r2, #0xd
	b _0806A382
_0806A2F4:
	ldr r0, [r4, #0x5c]
	movs r1, #6
	movs r2, #0xa
	b _0806A390
_0806A2FC:
	ldr r0, [r4, #0x5c]
	movs r1, #6
	movs r2, #0xe
	b _0806A382
_0806A304:
	ldr r0, [r4, #0x5c]
	movs r1, #6
	movs r2, #0xb
	b _0806A390
_0806A30C:
	ldr r0, [r4, #0x5c]
	movs r1, #6
	movs r2, #0xf
	b _0806A382
_0806A314:
	ldr r0, [r4, #0x5c]
	movs r1, #6
	movs r2, #0x10
	b _0806A390
_0806A31C:
	ldr r0, [r4, #0x5c]
	movs r1, #6
	movs r2, #0x14
	b _0806A382
_0806A324:
	ldr r0, [r4, #0x5c]
	movs r1, #6
	movs r2, #0x11
	b _0806A390
_0806A32C:
	ldr r0, [r4, #0x5c]
	movs r1, #6
	movs r2, #0x15
	b _0806A382
_0806A334:
	ldr r0, [r4, #0x5c]
	movs r1, #6
	movs r2, #0x12
	b _0806A390
_0806A33C:
	ldr r0, [r4, #0x5c]
	movs r1, #6
	movs r2, #0x16
	b _0806A382
_0806A344:
	ldr r0, [r4, #0x5c]
	movs r1, #6
	movs r2, #0x13
	b _0806A390
_0806A34C:
	ldr r0, [r4, #0x5c]
	movs r1, #6
	movs r2, #0x17
	b _0806A382
_0806A354:
	ldr r0, [r4, #0x5c]
	movs r1, #6
	movs r2, #0x18
	b _0806A390
_0806A35C:
	ldr r0, [r4, #0x5c]
	movs r1, #6
	movs r2, #0x1c
	b _0806A382
_0806A364:
	ldr r0, [r4, #0x5c]
	movs r1, #6
	movs r2, #0x19
	b _0806A390
_0806A36C:
	ldr r0, [r4, #0x5c]
	movs r1, #6
	movs r2, #0x1d
	b _0806A382
_0806A374:
	ldr r0, [r4, #0x5c]
	movs r1, #6
	movs r2, #0x1a
	b _0806A390
_0806A37C:
	ldr r0, [r4, #0x5c]
	movs r1, #6
	movs r2, #0x1e
_0806A382:
	movs r3, #1
	bl sub_806A138
	b _0806A3A4
_0806A38A:
	ldr r0, [r4, #0x5c]
	movs r1, #6
	movs r2, #0x1b
_0806A390:
	movs r3, #0
	bl sub_806A138
	b _0806A3A4
_0806A398:
	ldr r0, [r4, #0x5c]
	movs r1, #6
	movs r2, #0x1f
	movs r3, #1
	bl sub_806A138
_0806A3A4:
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x30
	bne _0806A3C0
	ldr r1, _0806A3C8  @ gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
_0806A3C0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806A3C8: .4byte gEfxBgSemaphore

	THUMB_FUNC_END sub_806A1EC

	THUMB_FUNC_START sub_806A3CC
sub_806A3CC: @ 0x0806A3CC
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _0806A3EC  @ gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0806A3F0  @ ProcScr_efxCrimsonEyeOBJFinish
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806A3EC: .4byte gEfxBgSemaphore
_0806A3F0: .4byte ProcScr_efxCrimsonEyeOBJFinish

	THUMB_FUNC_END sub_806A3CC

	THUMB_FUNC_START sub_806A3F4
sub_806A3F4: @ 0x0806A3F4
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _0806A438  @ gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0806A43C  @ ProcScr_efxGorgonBGFinish
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r1, [r0, #0x44]
	ldr r1, _0806A440  @ gUnknown_080DF0E0
	str r1, [r0, #0x48]
	ldr r1, _0806A444  @ gUnknown_085D8C7C
	str r1, [r0, #0x4c]
	ldr r1, _0806A448  @ gUnknown_085D8CA0
	str r1, [r0, #0x54]
	ldr r0, _0806A44C  @ gEkrDistanceType
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #1
	bne _0806A460
	adds r0, r4, #0
	bl GetAnimPosition
	cmp r0, #0
	bne _0806A450
	movs r0, #1
	movs r1, #0x18
	b _0806A454
	.align 2, 0
_0806A438: .4byte gEfxBgSemaphore
_0806A43C: .4byte ProcScr_efxGorgonBGFinish
_0806A440: .4byte gUnknown_080DF0E0
_0806A444: .4byte gUnknown_085D8C7C
_0806A448: .4byte gUnknown_085D8CA0
_0806A44C: .4byte gEkrDistanceType
_0806A450:
	ldr r1, _0806A45C  @ 0x0000FFE8
	movs r0, #1
_0806A454:
	movs r2, #0
	bl BG_SetPosition
	b _0806A46A
	.align 2, 0
_0806A45C: .4byte 0x0000FFE8
_0806A460:
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
_0806A46A:
	ldr r0, _0806A478  @ gUnknown_086B5A2C
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806A478: .4byte gUnknown_086B5A2C

	THUMB_FUNC_END sub_806A3F4

	THUMB_FUNC_START sub_806A47C
sub_806A47C: @ 0x0806A47C
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
	blt _0806A4A6
	ldr r2, [r4, #0x4c]
	ldr r0, [r4, #0x5c]
	lsls r1, r1, #2
	adds r1, r1, r2
	ldr r2, [r1]
	adds r1, r2, #0
	bl SpellFx_WriteBgMap
	b _0806A4C0
_0806A4A6:
	movs r0, #1
	negs r0, r0
	cmp r1, r0
	bne _0806A4C0
	bl SpellFx_ClearBG1
	ldr r1, _0806A4C8  @ gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
_0806A4C0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806A4C8: .4byte gEfxBgSemaphore

	THUMB_FUNC_END sub_806A47C

	THUMB_FUNC_START sub_806A4CC
sub_806A4CC: @ 0x0806A4CC
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r1, _0806A520  @ gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0806A524  @ ProcScr_efxCrimsonEyeBG
	movs r1, #3
	bl Proc_Start
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	str r0, [r5, #0x44]
	ldr r0, _0806A528  @ gUnknown_080DEF20
	str r0, [r5, #0x48]
	ldr r0, _0806A52C  @ gUnknown_085D8874
	str r0, [r5, #0x4c]
	ldr r0, _0806A530  @ gUnknown_086B5A4C
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	ldr r0, _0806A534  @ gUnknown_086B5EAC
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	ldr r0, _0806A538  @ gEkrDistanceType
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #1
	bne _0806A54C
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _0806A53C
	movs r0, #1
	movs r1, #0x18
	b _0806A540
	.align 2, 0
_0806A520: .4byte gEfxBgSemaphore
_0806A524: .4byte ProcScr_efxCrimsonEyeBG
_0806A528: .4byte gUnknown_080DEF20
_0806A52C: .4byte gUnknown_085D8874
_0806A530: .4byte gUnknown_086B5A4C
_0806A534: .4byte gUnknown_086B5EAC
_0806A538: .4byte gEkrDistanceType
_0806A53C:
	ldr r1, _0806A548  @ 0x0000FFE8
	movs r0, #1
_0806A540:
	movs r2, #0
	bl BG_SetPosition
	b _0806A556
	.align 2, 0
_0806A548: .4byte 0x0000FFE8
_0806A54C:
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
_0806A556:
	bl SpellFx_SetSomeColorEffect
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_806A4CC

	THUMB_FUNC_START sub_806A560
sub_806A560: @ 0x0806A560
	push {lr}
	cmp r0, #0
	bge _0806A570
_0806A566:
	adds r0, #0x5a
	cmp r0, #0
	blt _0806A566
	b _0806A570
_0806A56E:
	subs r0, #0x5a
_0806A570:
	cmp r0, #0x59
	bgt _0806A56E
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_806A560

	THUMB_FUNC_START sub_806A578
sub_806A578: @ 0x0806A578
	push {lr}
	adds r2, r0, #0
	subs r1, #0x16
	cmp r1, #0x2c
	bls _0806A586
	movs r0, #0x78
	b _0806A588
_0806A586:
	movs r0, #0x14
_0806A588:
	strh r0, [r2, #0xa]
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_806A578

	THUMB_FUNC_START sub_806A590
sub_806A590: @ 0x0806A590
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	mov r9, r0
	adds r7, r1, #0
	adds r3, r2, #0
	cmp r3, #0x2d
	ble _0806A5A8
	movs r0, #0x5a
	subs r3, r0, r3
_0806A5A8:
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #0x2d
	str r0, [sp]
	movs r0, #0
	movs r2, #0x80
	bl Interpolate
	muls r0, r7, r0
	asrs r7, r0, #8
	cmp r7, #1
	bgt _0806A5C2
	movs r7, #2
_0806A5C2:
	ldr r4, _0806A630  @ gSinLookup
	movs r0, #0x80
	adds r0, r0, r4
	mov r8, r0
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r0, r0, #4
	adds r1, r7, #0
	bl Div
	adds r6, r0, #0
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	movs r2, #0
	ldrsh r0, [r4, r2]
	negs r0, r0
	lsls r0, r0, #4
	adds r1, r7, #0
	bl Div
	adds r5, r0, #0
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	movs r1, #0
	ldrsh r0, [r4, r1]
	lsls r0, r0, #4
	adds r1, r7, #0
	bl Div
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	mov r2, r8
	movs r1, #0
	ldrsh r0, [r2, r1]
	lsls r0, r0, #4
	adds r1, r7, #0
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	mov r0, r9
	adds r1, r6, #0
	adds r2, r5, #0
	adds r3, r4, #0
	bl SetObjAffine
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806A630: .4byte gSinLookup

	THUMB_FUNC_END sub_806A590

	THUMB_FUNC_START sub_806A634
sub_806A634: @ 0x0806A634
	ldr r2, _0806A648  @ gUnknown_085D88AC
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	muls r0, r1, r0
	asrs r0, r0, #8
	bx lr
	.align 2, 0
_0806A648: .4byte gUnknown_085D88AC

	THUMB_FUNC_END sub_806A634

	THUMB_FUNC_START sub_806A64C
sub_806A64C: @ 0x0806A64C
	ldr r2, _0806A660  @ gUnknown_085D88AC
	lsls r0, r0, #1
	adds r0, #1
	adds r0, r0, r2
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	muls r0, r1, r0
	asrs r0, r0, #0xa
	bx lr
	.align 2, 0
_0806A660: .4byte gUnknown_085D88AC

	THUMB_FUNC_END sub_806A64C

	THUMB_FUNC_START sub_806A664
sub_806A664: @ 0x0806A664
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	adds r4, r1, #0
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r4, #0
	bl sub_806A634
	adds r6, r0, #0
	cmp r4, #0
	beq _0806A680
	cmp r4, #0x2d
	bne _0806A684
_0806A680:
	adds r0, r6, #0
	b _0806A6BC
_0806A684:
	cmp r4, #0x15
	bgt _0806A68C
	adds r3, r4, #0
	b _0806A6A2
_0806A68C:
	cmp r4, #0x2c
	bgt _0806A694
	movs r0, #0x2d
	b _0806A6A0
_0806A694:
	cmp r4, #0x41
	bgt _0806A69E
	adds r3, r4, #0
	subs r3, #0x2d
	b _0806A6A2
_0806A69E:
	movs r0, #0x5a
_0806A6A0:
	subs r3, r0, r4
_0806A6A2:
	asrs r1, r5, #1
	movs r0, #0x16
	str r0, [sp]
	movs r0, #0
	adds r2, r5, #0
	bl Interpolate
	adds r5, r0, #0
	cmp r4, #0x2c
	ble _0806A6BA
	adds r0, r6, r5
	b _0806A6BC
_0806A6BA:
	subs r0, r6, r5
_0806A6BC:
	add sp, #4
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_806A664

	THUMB_FUNC_START sub_806A6C4
sub_806A6C4: @ 0x0806A6C4
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	adds r4, r1, #0
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r4, #0
	bl sub_806A64C
	adds r6, r0, #0
	cmp r4, #0x2d
	ble _0806A6E0
	movs r0, #0x5a
	subs r4, r0, r4
_0806A6E0:
	asrs r2, r5, #1
	movs r0, #0x2d
	str r0, [sp]
	movs r0, #0
	adds r1, r5, #0
	adds r3, r4, #0
	bl Interpolate
	adds r5, r0, #0
	subs r0, r6, r5
	add sp, #4
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_806A6C4

	THUMB_FUNC_START sub_806A6FC
sub_806A6FC: @ 0x0806A6FC
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	mov r9, r0
	adds r7, r1, #0
	adds r6, r2, #0
	cmp r6, #0x2d
	ble _0806A714
	movs r0, #0x5a
	subs r6, r0, r6
_0806A714:
	movs r4, #0x18
	str r4, [sp]
	movs r0, #0
	movs r1, #0x80
	movs r2, #0x20
	adds r3, r7, #0
	bl Interpolate
	adds r5, r0, #0
	movs r1, #0x80
	lsls r1, r1, #1
	movs r2, #0xc0
	lsls r2, r2, #1
	str r4, [sp]
	movs r0, #0
	adds r3, r7, #0
	bl Interpolate
	adds r1, r0, #0
	movs r0, #0x2d
	str r0, [sp]
	movs r0, #0
	adds r2, r5, #0
	adds r3, r6, #0
	bl Interpolate
	adds r7, r0, #0
	cmp r7, #1
	bgt _0806A750
	movs r7, #2
_0806A750:
	ldr r4, _0806A7C0  @ gSinLookup
	movs r0, #0x80
	adds r0, r0, r4
	mov r8, r0
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r0, r0, #4
	adds r1, r7, #0
	bl Div
	adds r6, r0, #0
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	movs r2, #0
	ldrsh r0, [r4, r2]
	negs r0, r0
	lsls r0, r0, #4
	adds r1, r7, #0
	bl Div
	adds r5, r0, #0
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	movs r1, #0
	ldrsh r0, [r4, r1]
	lsls r0, r0, #4
	adds r1, r7, #0
	bl Div
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	mov r2, r8
	movs r1, #0
	ldrsh r0, [r2, r1]
	lsls r0, r0, #4
	adds r1, r7, #0
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	mov r0, r9
	adds r1, r6, #0
	adds r2, r5, #0
	adds r3, r4, #0
	bl SetObjAffine
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806A7C0: .4byte gSinLookup

	THUMB_FUNC_END sub_806A6FC

	THUMB_FUNC_START sub_806A7C4
sub_806A7C4: @ 0x0806A7C4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r7, r0, #0
	movs r0, #0
	mov sl, r0
_0806A7D6:
	mov r1, sl
	cmp r1, #4
	bhi _0806A822
	lsls r0, r1, #2
	ldr r1, _0806A7E8  @ _0806A7EC
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0806A7E8: .4byte _0806A7EC
_0806A7EC: @ jump table
	.4byte _0806A800 @ case 0
	.4byte _0806A806 @ case 1
	.4byte _0806A80E @ case 2
	.4byte _0806A814 @ case 3
	.4byte _0806A81C @ case 4
_0806A800:
	ldr r6, [r7, #0x60]
	movs r0, #0x1f
	b _0806A820
_0806A806:
	ldr r6, [r7, #0x64]
	movs r1, #0x1e
	str r1, [sp, #4]
	b _0806A822
_0806A80E:
	ldr r6, [r7, #0x68]
	movs r0, #0x1d
	b _0806A820
_0806A814:
	ldr r6, [r7, #0x44]
	movs r1, #0x1c
	str r1, [sp, #4]
	b _0806A822
_0806A81C:
	ldr r6, [r7, #0x48]
	movs r0, #0x1b
_0806A820:
	str r0, [sp, #4]
_0806A822:
	mov r1, sl
	lsls r0, r1, #3
	add r0, sl
	lsls r0, r0, #1
	bl sub_806A560
	adds r5, r0, #0
	adds r0, r6, #0
	adds r1, r5, #0
	bl sub_806A578
	adds r0, r5, #0
	movs r1, #0
	bl sub_806A634
	adds r4, r0, #0
	movs r0, #0x80
	lsls r0, r0, #1
	mov r8, r0
	adds r0, r5, #0
	mov r1, r8
	bl sub_806A634
	adds r2, r0, #0
	movs r1, #0x2c
	ldrsh r3, [r7, r1]
	movs r0, #0x10
	mov r9, r0
	str r0, [sp]
	movs r0, #4
	adds r1, r4, #0
	bl Interpolate
	ldrh r1, [r7, #0x32]
	adds r1, r1, r0
	strh r1, [r6, #2]
	adds r0, r5, #0
	movs r1, #0
	bl sub_806A64C
	adds r4, r0, #0
	adds r0, r5, #0
	mov r1, r8
	bl sub_806A64C
	adds r2, r0, #0
	movs r1, #0x2c
	ldrsh r3, [r7, r1]
	mov r0, r9
	str r0, [sp]
	movs r0, #4
	adds r1, r4, #0
	bl Interpolate
	ldrh r1, [r7, #0x3a]
	adds r1, r1, r0
	strh r1, [r6, #4]
	movs r1, #0x2c
	ldrsh r3, [r7, r1]
	mov r0, r9
	str r0, [sp]
	movs r0, #4
	movs r1, #2
	mov r2, r8
	bl Interpolate
	adds r1, r0, #0
	ldr r0, [sp, #4]
	adds r2, r5, #0
	bl sub_806A590
	movs r1, #1
	add sl, r1
	mov r0, sl
	cmp r0, #4
	ble _0806A7D6
	bl AnimSort
	ldrh r0, [r7, #0x2c]
	adds r0, #1
	strh r0, [r7, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x10
	bne _0806A8D6
	movs r0, #0
	strh r0, [r7, #0x2c]
	adds r0, r7, #0
	bl Proc_Break
_0806A8D6:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_806A7C4

	THUMB_FUNC_START sub_806A8E8
sub_806A8E8: @ 0x0806A8E8
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	adds r6, r0, #0
	movs r0, #0
	mov r8, r0
_0806A8F6:
	mov r1, r8
	cmp r1, #4
	bhi _0806A944
	lsls r0, r1, #2
	ldr r1, _0806A908  @ _0806A90C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0806A908: .4byte _0806A90C
_0806A90C: @ jump table
	.4byte _0806A920 @ case 0
	.4byte _0806A928 @ case 1
	.4byte _0806A92E @ case 2
	.4byte _0806A936 @ case 3
	.4byte _0806A93E @ case 4
_0806A920:
	ldr r7, [r6, #0x60]
	movs r2, #0x1f
	mov r9, r2
	b _0806A944
_0806A928:
	ldr r7, [r6, #0x64]
	movs r0, #0x1e
	b _0806A942
_0806A92E:
	ldr r7, [r6, #0x68]
	movs r1, #0x1d
	mov r9, r1
	b _0806A944
_0806A936:
	ldr r7, [r6, #0x44]
	movs r2, #0x1c
	mov r9, r2
	b _0806A944
_0806A93E:
	ldr r7, [r6, #0x48]
	movs r0, #0x1b
_0806A942:
	mov r9, r0
_0806A944:
	mov r1, r8
	lsls r0, r1, #3
	add r0, r8
	lsls r0, r0, #1
	movs r2, #0x2e
	ldrsh r1, [r6, r2]
	adds r5, r0, r1
	adds r0, r5, #0
	bl sub_806A560
	adds r5, r0, #0
	adds r0, r7, #0
	adds r1, r5, #0
	bl sub_806A578
	movs r4, #0x80
	lsls r4, r4, #1
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_806A634
	ldrh r1, [r6, #0x32]
	adds r1, r1, r0
	strh r1, [r7, #2]
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_806A64C
	ldrh r1, [r6, #0x3a]
	adds r1, r1, r0
	strh r1, [r7, #4]
	mov r0, r9
	adds r1, r4, #0
	adds r2, r5, #0
	bl sub_806A590
	movs r0, #1
	add r8, r0
	mov r1, r8
	cmp r1, #4
	ble _0806A8F6
	bl AnimSort
	ldrh r0, [r6, #0x2e]
	adds r0, #1
	strh r0, [r6, #0x2e]
	ldrh r0, [r6, #0x2c]
	adds r0, #1
	strh r0, [r6, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x7e
	bne _0806A9B8
	movs r0, #0
	strh r0, [r6, #0x2c]
	adds r0, r6, #0
	bl Proc_Break
_0806A9B8:
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_806A8E8

	THUMB_FUNC_START sub_806A9C4
sub_806A9C4: @ 0x0806A9C4
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r5, r0, #0
	movs r0, #0x2c
	ldrsh r3, [r5, r0]
	movs r0, #0x10
	str r0, [sp]
	movs r0, #4
	movs r1, #0
	movs r2, #0x18
	bl Interpolate
	mov r9, r0
	movs r7, #0
_0806A9E6:
	cmp r7, #4
	bhi _0806AA2E
	lsls r0, r7, #2
	ldr r1, _0806A9F4  @ _0806A9F8
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0806A9F4: .4byte _0806A9F8
_0806A9F8: @ jump table
	.4byte _0806AA0C @ case 0
	.4byte _0806AA12 @ case 1
	.4byte _0806AA1A @ case 2
	.4byte _0806AA20 @ case 3
	.4byte _0806AA28 @ case 4
_0806AA0C:
	ldr r6, [r5, #0x60]
	movs r2, #0x1f
	b _0806AA2C
_0806AA12:
	ldr r6, [r5, #0x64]
	movs r0, #0x1e
	mov r8, r0
	b _0806AA2E
_0806AA1A:
	ldr r6, [r5, #0x68]
	movs r2, #0x1d
	b _0806AA2C
_0806AA20:
	ldr r6, [r5, #0x44]
	movs r0, #0x1c
	mov r8, r0
	b _0806AA2E
_0806AA28:
	ldr r6, [r5, #0x48]
	movs r2, #0x1b
_0806AA2C:
	mov r8, r2
_0806AA2E:
	lsls r0, r7, #3
	adds r0, r0, r7
	lsls r0, r0, #1
	movs r2, #0x2e
	ldrsh r1, [r5, r2]
	adds r4, r0, r1
	adds r0, r4, #0
	bl sub_806A560
	adds r4, r0, #0
	adds r0, r6, #0
	adds r1, r4, #0
	bl sub_806A578
	mov r0, r9
	adds r1, r4, #0
	bl sub_806A664
	ldrh r1, [r5, #0x32]
	adds r1, r1, r0
	strh r1, [r6, #2]
	mov r0, r9
	adds r1, r4, #0
	bl sub_806A6C4
	ldrh r1, [r5, #0x3a]
	adds r1, r1, r0
	strh r1, [r6, #4]
	mov r0, r8
	mov r1, r9
	adds r2, r4, #0
	bl sub_806A6FC
	adds r7, #1
	cmp r7, #4
	ble _0806A9E6
	bl AnimSort
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x10
	bne _0806AA92
	movs r0, #0
	strh r0, [r5, #0x2c]
	adds r0, r5, #0
	bl Proc_Break
_0806AA92:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_806A9C4

	THUMB_FUNC_START sub_806AAA0
sub_806AAA0: @ 0x0806AAA0
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r5, r0, #0
	movs r0, #0
	mov r8, r0
_0806AAB0:
	mov r1, r8
	cmp r1, #4
	bhi _0806AAFC
	lsls r0, r1, #2
	ldr r1, _0806AAC0  @ _0806AAC4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0806AAC0: .4byte _0806AAC4
_0806AAC4: @ jump table
	.4byte _0806AAD8 @ case 0
	.4byte _0806AAE0 @ case 1
	.4byte _0806AAE6 @ case 2
	.4byte _0806AAEE @ case 3
	.4byte _0806AAF6 @ case 4
_0806AAD8:
	ldr r7, [r5, #0x60]
	movs r2, #0x1f
	mov r9, r2
	b _0806AAFC
_0806AAE0:
	ldr r7, [r5, #0x64]
	movs r0, #0x1e
	b _0806AAFA
_0806AAE6:
	ldr r7, [r5, #0x68]
	movs r1, #0x1d
	mov r9, r1
	b _0806AAFC
_0806AAEE:
	ldr r7, [r5, #0x44]
	movs r2, #0x1c
	mov r9, r2
	b _0806AAFC
_0806AAF6:
	ldr r7, [r5, #0x48]
	movs r0, #0x1b
_0806AAFA:
	mov r9, r0
_0806AAFC:
	mov r1, r8
	lsls r0, r1, #3
	add r0, r8
	lsls r0, r0, #1
	movs r2, #0x2e
	ldrsh r1, [r5, r2]
	adds r6, r0, r1
	adds r0, r6, #0
	bl sub_806A560
	adds r6, r0, #0
	adds r0, r7, #0
	adds r1, r6, #0
	bl sub_806A578
	movs r0, #0x18
	adds r1, r6, #0
	bl sub_806A664
	adds r1, r0, #0
	movs r0, #0x2c
	ldrsh r3, [r5, r0]
	movs r4, #8
	str r4, [sp]
	movs r0, #1
	movs r2, #0
	bl Interpolate
	ldrh r1, [r5, #0x32]
	adds r1, r1, r0
	strh r1, [r7, #2]
	movs r0, #0x18
	adds r1, r6, #0
	bl sub_806A6C4
	adds r1, r0, #0
	movs r2, #0x2c
	ldrsh r3, [r5, r2]
	str r4, [sp]
	movs r0, #1
	movs r2, #0
	bl Interpolate
	ldrh r1, [r5, #0x3a]
	adds r1, r1, r0
	strh r1, [r7, #4]
	movs r0, #0x2c
	ldrsh r3, [r5, r0]
	str r4, [sp]
	movs r0, #1
	movs r1, #0x18
	movs r2, #0
	bl Interpolate
	adds r1, r0, #0
	mov r0, r9
	adds r2, r6, #0
	bl sub_806A6FC
	movs r1, #1
	add r8, r1
	mov r2, r8
	cmp r2, #4
	ble _0806AAB0
	bl AnimSort
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #8
	bne _0806ABBA
	ldr r1, _0806ABC8  @ gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	ldr r0, [r5, #0x60]
	bl AnimDelete
	ldr r0, [r5, #0x64]
	bl AnimDelete
	ldr r0, [r5, #0x68]
	bl AnimDelete
	ldr r0, [r5, #0x44]
	bl AnimDelete
	ldr r0, [r5, #0x48]
	bl AnimDelete
	adds r0, r5, #0
	bl Proc_Break
_0806ABBA:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806ABC8: .4byte gEfxBgSemaphore

	THUMB_FUNC_END sub_806AAA0

	THUMB_FUNC_START sub_806ABCC
sub_806ABCC: @ 0x0806ABCC
	push {r4, r5, r6, lr}
	mov r6, r9
	mov r5, r8
	push {r5, r6}
	sub sp, #4
	adds r6, r0, #0
	ldr r1, _0806AC00  @ gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0806AC04  @ ProcScr_efxCrimsonEyeOBJ
	movs r1, #3
	bl Proc_Start
	adds r5, r0, #0
	str r6, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	strh r0, [r5, #0x2e]
	adds r0, r6, #0
	bl GetAnimPosition
	cmp r0, #0
	bne _0806AC08
	movs r0, #0x58
	b _0806AC0A
	.align 2, 0
_0806AC00: .4byte gEfxBgSemaphore
_0806AC04: .4byte ProcScr_efxCrimsonEyeOBJ
_0806AC08:
	movs r0, #0x98
_0806AC0A:
	strh r0, [r5, #0x32]
	movs r0, #0x48
	strh r0, [r5, #0x3a]
	ldr r0, _0806AC2C  @ gEkrDistanceType
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #1
	bne _0806AC36
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _0806AC30
	ldrh r0, [r5, #0x32]
	subs r0, #0x18
	b _0806AC34
	.align 2, 0
_0806AC2C: .4byte gEkrDistanceType
_0806AC30:
	ldrh r0, [r5, #0x32]
	adds r0, #0x18
_0806AC34:
	strh r0, [r5, #0x32]
_0806AC36:
	ldrh r0, [r5, #0x32]
	subs r0, #0x10
	strh r0, [r5, #0x32]
	ldrh r0, [r5, #0x3a]
	subs r0, #0x10
	strh r0, [r5, #0x3a]
	ldr r4, _0806AED0  @ gUnknown_086B5974
	str r4, [sp]
	adds r0, r6, #0
	adds r1, r4, #0
	adds r2, r4, #0
	adds r3, r4, #0
	bl EfxCreateFrontAnim
	str r0, [r5, #0x60]
	ldrh r1, [r5, #0x32]
	strh r1, [r0, #2]
	ldrh r1, [r5, #0x3a]
	strh r1, [r0, #4]
	ldr r1, _0806AED4  @ 0x3E000300
	str r1, [r0, #0x1c]
	str r4, [sp]
	adds r0, r6, #0
	adds r1, r4, #0
	adds r2, r4, #0
	adds r3, r4, #0
	bl EfxCreateFrontAnim
	str r0, [r5, #0x64]
	ldrh r1, [r5, #0x32]
	strh r1, [r0, #2]
	ldrh r1, [r5, #0x3a]
	strh r1, [r0, #4]
	ldr r1, _0806AED8  @ 0x3C000300
	str r1, [r0, #0x1c]
	str r4, [sp]
	adds r0, r6, #0
	adds r1, r4, #0
	adds r2, r4, #0
	adds r3, r4, #0
	bl EfxCreateFrontAnim
	str r0, [r5, #0x68]
	ldrh r1, [r5, #0x32]
	strh r1, [r0, #2]
	ldrh r1, [r5, #0x3a]
	strh r1, [r0, #4]
	ldr r1, _0806AEDC  @ 0x3A000300
	str r1, [r0, #0x1c]
	str r4, [sp]
	adds r0, r6, #0
	adds r1, r4, #0
	adds r2, r4, #0
	adds r3, r4, #0
	bl EfxCreateFrontAnim
	str r0, [r5, #0x44]
	ldrh r1, [r5, #0x32]
	strh r1, [r0, #2]
	ldrh r1, [r5, #0x3a]
	strh r1, [r0, #4]
	ldr r1, _0806AEE0  @ 0x38000300
	str r1, [r0, #0x1c]
	str r4, [sp]
	adds r0, r6, #0
	adds r1, r4, #0
	adds r2, r4, #0
	adds r3, r4, #0
	bl EfxCreateFrontAnim
	str r0, [r5, #0x48]
	ldrh r1, [r5, #0x32]
	strh r1, [r0, #2]
	ldrh r1, [r5, #0x3a]
	strh r1, [r0, #4]
	ldr r1, _0806AEE4  @ 0x36000300
	str r1, [r0, #0x1c]
	ldr r2, _0806AEE8  @ gSinLookup
	mov r8, r2
	movs r0, #0x80
	add r0, r8
	mov r9, r0
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r0, r0, #4
	movs r1, #2
	bl Div
	adds r6, r0, #0
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	mov r2, r8
	movs r1, #0
	ldrsh r0, [r2, r1]
	negs r0, r0
	lsls r0, r0, #4
	movs r1, #2
	bl Div
	adds r5, r0, #0
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	mov r2, r8
	movs r1, #0
	ldrsh r0, [r2, r1]
	lsls r0, r0, #4
	movs r1, #2
	bl Div
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	mov r2, r9
	movs r1, #0
	ldrsh r0, [r2, r1]
	lsls r0, r0, #4
	movs r1, #2
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	movs r0, #0x1f
	adds r1, r6, #0
	adds r2, r5, #0
	adds r3, r4, #0
	bl SetObjAffine
	mov r2, r9
	movs r1, #0
	ldrsh r0, [r2, r1]
	lsls r0, r0, #4
	movs r1, #2
	bl Div
	adds r6, r0, #0
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	mov r2, r8
	movs r1, #0
	ldrsh r0, [r2, r1]
	negs r0, r0
	lsls r0, r0, #4
	movs r1, #2
	bl Div
	adds r5, r0, #0
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	mov r2, r8
	movs r1, #0
	ldrsh r0, [r2, r1]
	lsls r0, r0, #4
	movs r1, #2
	bl Div
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	mov r2, r9
	movs r1, #0
	ldrsh r0, [r2, r1]
	lsls r0, r0, #4
	movs r1, #2
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	movs r0, #0x1e
	adds r1, r6, #0
	adds r2, r5, #0
	adds r3, r4, #0
	bl SetObjAffine
	mov r2, r9
	movs r1, #0
	ldrsh r0, [r2, r1]
	lsls r0, r0, #4
	movs r1, #2
	bl Div
	adds r6, r0, #0
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	mov r2, r8
	movs r1, #0
	ldrsh r0, [r2, r1]
	negs r0, r0
	lsls r0, r0, #4
	movs r1, #2
	bl Div
	adds r5, r0, #0
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	mov r2, r8
	movs r1, #0
	ldrsh r0, [r2, r1]
	lsls r0, r0, #4
	movs r1, #2
	bl Div
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	mov r2, r9
	movs r1, #0
	ldrsh r0, [r2, r1]
	lsls r0, r0, #4
	movs r1, #2
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	movs r0, #0x1d
	adds r1, r6, #0
	adds r2, r5, #0
	adds r3, r4, #0
	bl SetObjAffine
	mov r2, r9
	movs r1, #0
	ldrsh r0, [r2, r1]
	lsls r0, r0, #4
	movs r1, #2
	bl Div
	adds r6, r0, #0
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	mov r2, r8
	movs r1, #0
	ldrsh r0, [r2, r1]
	negs r0, r0
	lsls r0, r0, #4
	movs r1, #2
	bl Div
	adds r5, r0, #0
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	mov r2, r8
	movs r1, #0
	ldrsh r0, [r2, r1]
	lsls r0, r0, #4
	movs r1, #2
	bl Div
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	mov r2, r9
	movs r1, #0
	ldrsh r0, [r2, r1]
	lsls r0, r0, #4
	movs r1, #2
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	movs r0, #0x1c
	adds r1, r6, #0
	adds r2, r5, #0
	adds r3, r4, #0
	bl SetObjAffine
	mov r2, r9
	movs r1, #0
	ldrsh r0, [r2, r1]
	lsls r0, r0, #4
	movs r1, #2
	bl Div
	adds r6, r0, #0
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	mov r2, r8
	movs r1, #0
	ldrsh r0, [r2, r1]
	negs r0, r0
	lsls r0, r0, #4
	movs r1, #2
	bl Div
	adds r5, r0, #0
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	mov r2, r8
	movs r1, #0
	ldrsh r0, [r2, r1]
	lsls r0, r0, #4
	movs r1, #2
	bl Div
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	mov r2, r9
	movs r1, #0
	ldrsh r0, [r2, r1]
	lsls r0, r0, #4
	movs r1, #2
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	movs r0, #0x1b
	adds r1, r6, #0
	adds r2, r5, #0
	adds r3, r4, #0
	bl SetObjAffine
	ldr r0, _0806AEEC  @ gUnknown_086B58DC
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _0806AEF0  @ gUnknown_086B5580
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806AED0: .4byte gUnknown_086B5974
_0806AED4: .4byte 0x3E000300
_0806AED8: .4byte 0x3C000300
_0806AEDC: .4byte 0x3A000300
_0806AEE0: .4byte 0x38000300
_0806AEE4: .4byte 0x36000300
_0806AEE8: .4byte gSinLookup
_0806AEEC: .4byte gUnknown_086B58DC
_0806AEF0: .4byte gUnknown_086B5580

	THUMB_FUNC_END sub_806ABCC

	THUMB_FUNC_START sub_806AEF4
sub_806AEF4: @ 0x0806AEF4
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl NewEfxSpellCast
	bl SpellFx_ClearBG1Position
	ldr r0, _0806AF2C  @ ProcScr_efxDarkLongMons
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
_0806AF2C: .4byte ProcScr_efxDarkLongMons

	THUMB_FUNC_END sub_806AEF4

	THUMB_FUNC_START sub_806AF30
sub_806AF30: @ 0x0806AF30
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetAnimAnotherSide
	adds r5, r0, #0
	bl EfxGetCamMovDuration
	adds r2, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	movs r6, #0
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _0806AF60
	ldr r0, [r4, #0x5c]
	movs r1, #1
	negs r1, r1
	bl NewEfxFarAttackWithDistance
	b _0806B07A
_0806AF60:
	movs r0, #0x2c
	ldrsh r1, [r4, r0]
	adds r0, r2, #0
	adds r0, #0xb
	cmp r1, r0
	bne _0806AF80
	adds r0, r5, #0
	bl sub_806B2C0
	ldr r0, _0806AF7C  @ 0x000003D5
	movs r1, #0x80
	lsls r1, r1, #1
	movs r2, #0x10
	b _0806B04C
	.align 2, 0
_0806AF7C: .4byte 0x000003D5
_0806AF80:
	adds r0, r2, #0
	adds r0, #0x2b
	cmp r1, r0
	bne _0806AF90
	adds r0, r5, #0
	bl sub_806B1E8
	b _0806B07A
_0806AF90:
	adds r0, r2, #0
	adds r0, #0x97
	cmp r1, r0
	bne _0806AF9E
	bl sub_806B4E4
	b _0806B07A
_0806AF9E:
	adds r0, r2, #0
	adds r0, #0xa7
	cmp r1, r0
	bne _0806AFAE
	adds r0, r5, #0
	bl sub_806B134
	b _0806B07A
_0806AFAE:
	adds r0, r2, #0
	adds r0, #0xeb
	cmp r1, r0
	bne _0806AFD6
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
	bne _0806B07A
	adds r0, r5, #0
	bl EfxPlayHittedSFX
	b _0806B07A
_0806AFD6:
	adds r0, r2, #0
	adds r0, #0xec
	cmp r1, r0
	bne _0806AFF8
	adds r0, r4, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #0
	beq _0806B07A
	bl SpellFx_Finish
	bl RegisterEfxSpellCastEnd
	adds r0, r4, #0
	bl Proc_Break
	b _0806B07A
_0806AFF8:
	adds r0, r2, #0
	adds r0, #0xed
	cmp r1, r0
	bne _0806B014
	ldr r0, [r4, #0x5c]
	movs r1, #0x3e
	movs r2, #9
	bl StartSpellThing_MagicQuake
	ldr r0, [r4, #0x5c]
	movs r1, #0xa
	bl NewEfxFlashBgWhite
	b _0806B07A
_0806B014:
	adds r0, r2, #0
	adds r0, #0xf7
	cmp r1, r0
	bne _0806B058
	ldr r0, [r4, #0x5c]
	movs r1, #0x46
	movs r2, #1
	bl NewEfxRestWINH_
	ldr r0, [r4, #0x5c]
	movs r1, #0x32
	bl NewEfxTwobaiRST
	ldr r0, [r4, #0x5c]
	bl StartSubSpell_efxSuperdruidBG3
	str r6, [sp]
	str r6, [sp, #4]
	adds r0, r5, #0
	movs r1, #0x10
	movs r2, #0xa
	movs r3, #0x10
	bl NewEfxALPHA
	ldr r0, _0806B054  @ 0x000003D6
	movs r1, #0x80
	lsls r1, r1, #1
	movs r2, #0xc0
_0806B04C:
	movs r3, #1
	bl PlaySFX
	b _0806B07A
	.align 2, 0
_0806B054: .4byte 0x000003D6
_0806B058:
	movs r3, #0x88
	lsls r3, r3, #1
	adds r0, r2, r3
	cmp r1, r0
	bne _0806B068
	bl RegisterEfxSpellCastEnd
	b _0806B07A
_0806B068:
	ldr r3, _0806B084  @ 0x0000012B
	adds r0, r2, r3
	cmp r1, r0
	bne _0806B07A
	bl SpellFx_Finish
	adds r0, r4, #0
	bl Proc_Break
_0806B07A:
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806B084: .4byte 0x0000012B

	THUMB_FUNC_END sub_806AF30

	THUMB_FUNC_START sub_806B088
sub_806B088: @ 0x0806B088
	push {lr}
	ldr r0, _0806B0A4  @ 0x04000006
	ldrh r0, [r0]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0x9f
	bhi _0806B0A0
	ldr r1, _0806B0A8  @ 0x04000016
	lsrs r0, r0, #0x11
	subs r0, r0, r2
	strh r0, [r1]
_0806B0A0:
	pop {r0}
	bx r0
	.align 2, 0
_0806B0A4: .4byte 0x04000006
_0806B0A8: .4byte 0x04000016

	THUMB_FUNC_END sub_806B088

	THUMB_FUNC_START sub_806B0AC
sub_806B0AC: @ 0x0806B0AC
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
	blt _0806B0F4
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
	bl GetAnimAnotherSide
	adds r5, r5, r6
	ldr r2, [r5]
	adds r1, r2, #0
	bl SpellFx_WriteBgMap
	b _0806B112
_0806B0F4:
	movs r0, #1
	negs r0, r0
	cmp r5, r0
	bne _0806B112
	bl SpellFx_ClearBG1
	ldr r1, _0806B118  @ gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SetDefaultColorEffects_
	adds r0, r7, #0
	bl Proc_Break
_0806B112:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806B118: .4byte gEfxBgSemaphore

	THUMB_FUNC_END sub_806B0AC

	THUMB_FUNC_START sub_806B11C
sub_806B11C: @ 0x0806B11C
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0
	bl SetPrimaryHBlankHandler
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_806B11C

	THUMB_FUNC_START sub_806B134
sub_806B134: @ 0x0806B134
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _0806B178  @ gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0806B17C  @ ProcScr_efxDarkLongMonsBG01
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r1, [r0, #0x44]
	ldr r1, _0806B180  @ gUnknown_080DEF78
	str r1, [r0, #0x48]
	ldr r1, _0806B184  @ gUnknown_085D89B8
	str r1, [r0, #0x4c]
	ldr r1, _0806B188  @ gUnknown_085D89F8
	str r1, [r0, #0x54]
	ldr r1, _0806B18C  @ gUnknown_085D8A38
	str r1, [r0, #0x58]
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	ldr r0, _0806B190  @ sub_806B088
	bl SetPrimaryHBlankHandler
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806B178: .4byte gEfxBgSemaphore
_0806B17C: .4byte ProcScr_efxDarkLongMonsBG01
_0806B180: .4byte gUnknown_080DEF78
_0806B184: .4byte gUnknown_085D89B8
_0806B188: .4byte gUnknown_085D89F8
_0806B18C: .4byte gUnknown_085D8A38
_0806B190: .4byte sub_806B088

	THUMB_FUNC_END sub_806B134

	THUMB_FUNC_START sub_806B194
sub_806B194: @ 0x0806B194
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r0, #0x2c
	adds r1, r6, #0
	adds r1, #0x44
	ldr r2, [r6, #0x48]
	bl EfxAdvanceFrameLut
	lsls r0, r0, #0x10
	asrs r5, r0, #0x10
	cmp r5, #0
	blt _0806B1C2
	ldr r4, [r6, #0x4c]
	ldr r0, [r6, #0x5c]
	bl GetAnimAnotherSide
	lsls r1, r5, #2
	adds r1, r1, r4
	ldr r2, [r1]
	adds r1, r2, #0
	bl SpellFx_WriteBgMap
	b _0806B1DC
_0806B1C2:
	movs r0, #1
	negs r0, r0
	cmp r5, r0
	bne _0806B1DC
	bl SpellFx_ClearBG1
	ldr r1, _0806B1E4  @ gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r6, #0
	bl Proc_Break
_0806B1DC:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806B1E4: .4byte gEfxBgSemaphore

	THUMB_FUNC_END sub_806B194

	THUMB_FUNC_START sub_806B1E8
sub_806B1E8: @ 0x0806B1E8
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _0806B234  @ gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0806B238  @ ProcScr_efxDarkLongMonsBG02
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r1, [r0, #0x44]
	ldr r1, _0806B23C  @ gUnknown_080DEFD0
	str r1, [r0, #0x48]
	ldr r1, _0806B240  @ gUnknown_085D8A98
	str r1, [r0, #0x4c]
	ldr r0, _0806B244  @ gUnknown_086E7EB0
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	ldr r0, _0806B248  @ gUnknown_086E91B8
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	bl SpellFx_SetSomeColorEffect
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806B234: .4byte gEfxBgSemaphore
_0806B238: .4byte ProcScr_efxDarkLongMonsBG02
_0806B23C: .4byte gUnknown_080DEFD0
_0806B240: .4byte gUnknown_085D8A98
_0806B244: .4byte gUnknown_086E7EB0
_0806B248: .4byte gUnknown_086E91B8

	THUMB_FUNC_END sub_806B1E8

	THUMB_FUNC_START sub_806B24C
sub_806B24C: @ 0x0806B24C
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	movs r2, #0x2e
	ldrsh r0, [r4, r2]
	cmp r1, r0
	bne _0806B27C
	ldr r0, _0806B278  @ gEfxBgSemaphore
	ldr r1, [r0]
	subs r1, #1
	str r1, [r0]
	ldr r0, [r4, #0x60]
	bl AnimDelete
	adds r0, r4, #0
	bl Proc_Break
	b _0806B2B8
	.align 2, 0
_0806B278: .4byte gEfxBgSemaphore
_0806B27C:
	cmp r1, #0xf
	bgt _0806B286
	movs r0, #0x2c
	ldrsh r1, [r4, r0]
	b _0806B29A
_0806B286:
	movs r2, #0x2c
	ldrsh r3, [r4, r2]
	movs r0, #0x2e
	ldrsh r2, [r4, r0]
	adds r0, r2, #0
	subs r0, #0x10
	movs r1, #0
	cmp r3, r0
	blt _0806B29A
	subs r1, r2, r3
_0806B29A:
	movs r2, #1
	adds r0, r1, #0
	ands r0, r2
	cmp r0, #0
	bne _0806B2B8
	asrs r0, r1, #1
	ands r0, r2
	cmp r0, #0
	beq _0806B2B2
	ldr r1, [r4, #0x60]
	movs r0, #0xe0
	b _0806B2B6
_0806B2B2:
	ldr r1, [r4, #0x60]
	movs r0, #0x20
_0806B2B6:
	strh r0, [r1, #4]
_0806B2B8:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_806B24C

	THUMB_FUNC_START sub_806B2C0
sub_806B2C0: @ 0x0806B2C0
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r1, _0806B304  @ gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0806B308  @ ProcScr_efxDarkLongMonsOBJ
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	movs r0, #0xbc
	strh r0, [r4, #0x2e]
	ldr r3, _0806B30C  @ gUnknown_086DA920
	str r3, [sp]
	adds r0, r5, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl EfxCreateFrontAnim
	adds r5, r0, #0
	str r5, [r4, #0x60]
	ldr r0, [r4, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _0806B310
	movs r0, #0xc8
	b _0806B312
	.align 2, 0
_0806B304: .4byte gEfxBgSemaphore
_0806B308: .4byte ProcScr_efxDarkLongMonsOBJ
_0806B30C: .4byte gUnknown_086DA920
_0806B310:
	movs r0, #0x28
_0806B312:
	strh r0, [r5, #2]
	movs r0, #0x20
	strh r0, [r5, #4]
	ldr r0, _0806B334  @ gUnknown_086DA33C
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _0806B338  @ gUnknown_086D9C40
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806B334: .4byte gUnknown_086DA33C
_0806B338: .4byte gUnknown_086D9C40

	THUMB_FUNC_END sub_806B2C0

	THUMB_FUNC_START sub_806B33C
sub_806B33C: @ 0x0806B33C
	adds r0, #0x4c
	movs r1, #0
	strh r1, [r0]
	bx lr

	THUMB_FUNC_END sub_806B33C

	THUMB_FUNC_START sub_806B344
sub_806B344: @ 0x0806B344
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	str r0, [sp, #4]
	ldr r7, _0806B370  @ gPaletteBuffer
	ldr r6, _0806B374  @ gEfxPal
	adds r0, #0x4c
	movs r2, #0
	ldrsh r1, [r0, r2]
	cmp r1, #0x14
	ble _0806B378
	adds r3, r1, #0
	subs r3, #0x14
	movs r0, #0xc
	str r0, [sp]
	movs r0, #0
	movs r1, #0x10
	movs r2, #0
	b _0806B390
	.align 2, 0
_0806B370: .4byte gPaletteBuffer
_0806B374: .4byte gEfxPal
_0806B378:
	cmp r1, #0xc
	ble _0806B382
	movs r2, #0x10
	mov sl, r2
	b _0806B396
_0806B382:
	movs r1, #0
	ldrsh r3, [r0, r1]
	movs r0, #0xc
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0x10
_0806B390:
	bl Interpolate
	mov sl, r0
_0806B396:
	ldrh r0, [r7]
	strh r0, [r6]
	movs r4, #0
	ldr r2, [sp, #4]
	adds r2, #0x4c
	str r2, [sp, #8]
_0806B3A2:
	subs r0, r4, #2
	cmp r0, #0x1c
	bhi _0806B440
	lsls r0, r0, #2
	ldr r1, _0806B3B4  @ _0806B3B8
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0806B3B4: .4byte _0806B3B8
_0806B3B8: @ jump table
	.4byte _0806B42C @ case 0
	.4byte _0806B42C @ case 1
	.4byte _0806B440 @ case 2
	.4byte _0806B440 @ case 3
	.4byte _0806B440 @ case 4
	.4byte _0806B440 @ case 5
	.4byte _0806B440 @ case 6
	.4byte _0806B440 @ case 7
	.4byte _0806B440 @ case 8
	.4byte _0806B440 @ case 9
	.4byte _0806B440 @ case 10
	.4byte _0806B440 @ case 11
	.4byte _0806B440 @ case 12
	.4byte _0806B440 @ case 13
	.4byte _0806B42C @ case 14
	.4byte _0806B440 @ case 15
	.4byte _0806B440 @ case 16
	.4byte _0806B440 @ case 17
	.4byte _0806B440 @ case 18
	.4byte _0806B42C @ case 19
	.4byte _0806B42C @ case 20
	.4byte _0806B440 @ case 21
	.4byte _0806B440 @ case 22
	.4byte _0806B440 @ case 23
	.4byte _0806B440 @ case 24
	.4byte _0806B42C @ case 25
	.4byte _0806B42C @ case 26
	.4byte _0806B42C @ case 27
	.4byte _0806B42C @ case 28
_0806B42C:
	adds r0, r7, #0
	adds r1, r6, #0
	movs r2, #8
	bl CpuFastSet
	adds r7, #0x20
	adds r6, #0x20
	adds r4, #1
	mov r9, r4
	b _0806B49E
_0806B440:
	adds r7, #2
	adds r6, #2
	adds r4, #1
	mov r9, r4
	movs r0, #0x1f
	mov r8, r0
	movs r5, #0x1f
	movs r0, #0x10
	mov r1, sl
	subs r4, r0, r1
	movs r2, #0xe
	mov ip, r2
_0806B458:
	ldrh r1, [r7]
	adds r0, r5, #0
	ands r0, r1
	adds r3, r0, #0
	muls r3, r4, r3
	asrs r3, r3, #4
	lsls r1, r1, #0x10
	lsrs r0, r1, #0x15
	mov r2, r8
	ands r0, r2
	adds r2, r0, #0
	muls r2, r4, r2
	asrs r2, r2, #4
	lsrs r1, r1, #0x1a
	mov r0, r8
	ands r1, r0
	adds r0, r1, #0
	muls r0, r4, r0
	asrs r0, r0, #4
	ands r0, r5
	lsls r0, r0, #0xa
	ands r2, r5
	lsls r2, r2, #5
	orrs r0, r2
	ands r3, r5
	orrs r3, r0
	strh r3, [r6]
	adds r7, #2
	adds r6, #2
	movs r1, #1
	negs r1, r1
	add ip, r1
	mov r2, ip
	cmp r2, #0
	bge _0806B458
_0806B49E:
	mov r4, r9
	cmp r4, #0x1f
	bgt _0806B4A6
	b _0806B3A2
_0806B4A6:
	ldr r0, _0806B4E0  @ gEfxPal
	movs r1, #0xa0
	lsls r1, r1, #0x13
	movs r2, #0x80
	lsls r2, r2, #1
	bl CpuFastSet
	bl DisablePaletteSync
	ldr r1, [sp, #8]
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, #0x20
	bne _0806B4C8
	ldr r0, [sp, #4]
	bl Proc_Break
_0806B4C8:
	ldr r1, [sp, #8]
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806B4E0: .4byte gEfxPal

	THUMB_FUNC_END sub_806B344

	THUMB_FUNC_START sub_806B4E4
sub_806B4E4: @ 0x0806B4E4
	push {lr}
	ldr r0, _0806B4F4  @ gUnknown_085D8AEC
	movs r1, #0
	bl Proc_Start
	pop {r0}
	bx r0
	.align 2, 0
_0806B4F4: .4byte gUnknown_085D8AEC

	THUMB_FUNC_END sub_806B4E4

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
	ldr r0, _0806C048  @ gUnknown_086B58DC
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _0806C04C  @ gUnknown_086B5580
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
_0806C048: .4byte gUnknown_086B58DC
_0806C04C: .4byte gUnknown_086B5580

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
	ldr r1, _0806C104  @ gUnknown_080DF0E0
	str r1, [r0, #0x48]
	ldr r1, _0806C108  @ gUnknown_085D8C7C
	str r1, [r0, #0x4c]
	ldr r1, _0806C10C  @ gUnknown_085D8CA0
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
_0806C104: .4byte gUnknown_080DF0E0
_0806C108: .4byte gUnknown_085D8C7C
_0806C10C: .4byte gUnknown_085D8CA0
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
