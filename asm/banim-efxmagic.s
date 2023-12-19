	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	/**
	 * Magic spell anim effects
	 */

	THUMB_FUNC_START StartSpellAnimAura
StartSpellAnimAura: @ 0x08064E74
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl NewEfxSpellCast
	bl SpellFx_ClearBG1Position
	ldr r0, _08064EAC  @ gUnknown_085D7490
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
_08064EAC: .4byte gUnknown_085D7490

	THUMB_FUNC_END StartSpellAnimAura

	THUMB_FUNC_START sub_8064EB0
sub_8064EB0: @ 0x08064EB0
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
	bne _08064EEC
	adds r0, r5, #0
	bl sub_8065008
	ldr r0, _08064EE8  @ 0x000002C1
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r2, [r4, #0x5c]
	movs r3, #2
	ldrsh r2, [r2, r3]
	b _08064F4E
	.align 2, 0
_08064EE8: .4byte 0x000002C1
_08064EEC:
	cmp r0, #0xe
	bne _08064EF8
	adds r0, r5, #0
	bl sub_806509C
	b _08064FFE
_08064EF8:
	cmp r0, #0x2c
	bne _08064F10
	ldr r0, _08064F0C  @ 0x000002C2
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r2, [r4, #0x5c]
	movs r3, #2
	ldrsh r2, [r2, r3]
	b _08064F4E
	.align 2, 0
_08064F0C: .4byte 0x000002C2
_08064F10:
	cmp r0, #0x53
	bne _08064F28
	ldr r0, [r4, #0x5c]
	movs r1, #1
	negs r1, r1
	bl NewEfxFarAttackWithDistance
	adds r0, r5, #0
	movs r1, #0xa
	bl NewEfxFlashBgWhite
	b _08064FFE
_08064F28:
	movs r0, #0x2c
	ldrsh r1, [r4, r0]
	adds r0, r2, #0
	adds r0, #0x5d
	cmp r1, r0
	bne _08064F3C
	adds r0, r5, #0
	bl sub_8065130
	b _08064FFE
_08064F3C:
	adds r0, r2, #0
	adds r0, #0x67
	cmp r1, r0
	bne _08064F5C
	ldr r0, _08064F58  @ 0x000002C3
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r5, r3]
_08064F4E:
	movs r3, #1
	bl PlaySFX
	b _08064FFE
	.align 2, 0
_08064F58: .4byte 0x000002C3
_08064F5C:
	adds r0, r2, #0
	adds r0, #0x7d
	cmp r1, r0
	bne _08064F70
	str r6, [sp]
	str r6, [sp, #4]
	adds r0, r5, #0
	movs r1, #0
	movs r2, #0xa
	b _08064FE0
_08064F70:
	adds r0, r2, #0
	adds r0, #0x89
	cmp r1, r0
	bne _08064F86
	adds r0, r5, #0
	bl sub_806521C
	adds r0, r5, #0
	bl sub_806533C
	b _08064FFE
_08064F86:
	adds r0, r2, #0
	adds r0, #0x90
	cmp r1, r0
	bne _08064FB6
	adds r0, r5, #0
	movs r1, #0xa
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
	bne _08064FFE
	adds r0, r5, #0
	bl EfxPlayHittedSFX
	b _08064FFE
_08064FB6:
	adds r0, r2, #0
	adds r0, #0x9a
	cmp r1, r0
	bne _08064FE8
	ldr r0, [r4, #0x5c]
	movs r1, #0x5f
	movs r2, #1
	bl NewEfxRestWINH_
	ldr r0, [r4, #0x5c]
	movs r1, #0x42
	bl NewEfxTwobaiRST
	adds r0, r5, #0
	bl sub_80653CC
	str r6, [sp]
	str r6, [sp, #4]
	adds r0, r5, #0
	movs r1, #0x2c
	movs r2, #0xc
_08064FE0:
	movs r3, #0x10
	bl NewEfxALPHA
	b _08064FFE
_08064FE8:
	adds r0, r2, #0
	adds r0, #0xf5
	cmp r1, r0
	bne _08064FFE
	bl SpellFx_Finish
	bl RegisterEfxSpellCastEnd
	adds r0, r4, #0
	bl Proc_Break
_08064FFE:
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8064EB0

	THUMB_FUNC_START sub_8065008
sub_8065008: @ 0x08065008
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r1, _0806506C  @ gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08065070  @ gUnknown_085D74A8
	movs r1, #3
	bl Proc_Start
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	str r0, [r5, #0x44]
	ldr r0, _08065074  @ gUnknown_080DE346
	str r0, [r5, #0x48]
	ldr r0, _08065078  @ gUnknown_085D74C0
	str r0, [r5, #0x4c]
	str r0, [r5, #0x50]
	ldr r0, _0806507C  @ gUnknown_087327C4
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	ldr r0, _08065080  @ gUnknown_0873313C
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	ldr r0, _08065084  @ gEkrDistanceType
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _08065092
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _08065088
	movs r0, #1
	movs r1, #0x18
	movs r2, #0
	bl BG_SetPosition
	b _08065092
	.align 2, 0
_0806506C: .4byte gEfxBgSemaphore
_08065070: .4byte gUnknown_085D74A8
_08065074: .4byte gUnknown_080DE346
_08065078: .4byte gUnknown_085D74C0
_0806507C: .4byte gUnknown_087327C4
_08065080: .4byte gUnknown_0873313C
_08065084: .4byte gEkrDistanceType
_08065088:
	movs r0, #1
	movs r1, #0xe8
	movs r2, #0
	bl BG_SetPosition
_08065092:
	bl SpellFx_SetSomeColorEffect
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8065008

	THUMB_FUNC_START sub_806509C
sub_806509C: @ 0x0806509C
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r1, _08065100  @ gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08065104  @ gUnknown_085D74A8
	movs r1, #3
	bl Proc_Start
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	str r0, [r5, #0x44]
	ldr r0, _08065108  @ gUnknown_080DE374
	str r0, [r5, #0x48]
	ldr r0, _0806510C  @ gUnknown_085D74C0
	str r0, [r5, #0x4c]
	str r0, [r5, #0x50]
	ldr r0, _08065110  @ gUnknown_087327C4
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	ldr r0, _08065114  @ gUnknown_0873313C
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	ldr r0, _08065118  @ gEkrDistanceType
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _08065126
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _0806511C
	movs r0, #1
	movs r1, #0xe8
	movs r2, #0
	bl BG_SetPosition
	b _08065126
	.align 2, 0
_08065100: .4byte gEfxBgSemaphore
_08065104: .4byte gUnknown_085D74A8
_08065108: .4byte gUnknown_080DE374
_0806510C: .4byte gUnknown_085D74C0
_08065110: .4byte gUnknown_087327C4
_08065114: .4byte gUnknown_0873313C
_08065118: .4byte gEkrDistanceType
_0806511C:
	movs r0, #1
	movs r1, #0x18
	movs r2, #0
	bl BG_SetPosition
_08065126:
	bl SpellFx_SetSomeColorEffect
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_806509C

	THUMB_FUNC_START sub_8065130
sub_8065130: @ 0x08065130
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r1, _08065194  @ gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08065198  @ gUnknown_085D74A8
	movs r1, #3
	bl Proc_Start
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	str r0, [r5, #0x44]
	ldr r0, _0806519C  @ gUnknown_080DE3A6
	str r0, [r5, #0x48]
	ldr r0, _080651A0  @ gUnknown_085D74C0
	str r0, [r5, #0x4c]
	str r0, [r5, #0x50]
	ldr r0, _080651A4  @ gUnknown_087327C4
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	ldr r0, _080651A8  @ gUnknown_0873313C
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	ldr r0, _080651AC  @ gEkrDistanceType
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _080651BA
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _080651B0
	movs r0, #1
	movs r1, #0x18
	movs r2, #0
	bl BG_SetPosition
	b _080651BA
	.align 2, 0
_08065194: .4byte gEfxBgSemaphore
_08065198: .4byte gUnknown_085D74A8
_0806519C: .4byte gUnknown_080DE3A6
_080651A0: .4byte gUnknown_085D74C0
_080651A4: .4byte gUnknown_087327C4
_080651A8: .4byte gUnknown_0873313C
_080651AC: .4byte gEkrDistanceType
_080651B0:
	movs r0, #1
	movs r1, #0xe8
	movs r2, #0
	bl BG_SetPosition
_080651BA:
	bl SpellFx_SetSomeColorEffect
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8065130

	THUMB_FUNC_START sub_80651C4
sub_80651C4: @ 0x080651C4
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
	blt _080651F2
	ldr r1, [r4, #0x4c]
	ldr r3, [r4, #0x50]
	ldr r0, [r4, #0x5c]
	lsls r2, r2, #2
	adds r1, r2, r1
	ldr r1, [r1]
	adds r2, r2, r3
	ldr r2, [r2]
	bl SpellFx_WriteBgMap
	b _08065210
_080651F2:
	movs r0, #1
	negs r0, r0
	cmp r2, r0
	bne _08065210
	bl SpellFx_ClearBG1
	ldr r1, _08065218  @ gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SetDefaultColorEffects_
	adds r0, r4, #0
	bl Proc_Break
_08065210:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08065218: .4byte gEfxBgSemaphore

	THUMB_FUNC_END sub_80651C4

	THUMB_FUNC_START sub_806521C
sub_806521C: @ 0x0806521C
	push {r4, r5, lr}
	sub sp, #8
	adds r4, r0, #0
	ldr r1, _08065260  @ gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08065264  @ gUnknown_085D7530
	movs r1, #3
	bl Proc_Start
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	movs r0, #5
	strh r0, [r5, #0x2e]
	ldr r0, _08065268  @ Img_ShineBg1
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	bl SpellFx_ClearBG1
	ldr r0, _0806526C  @ gEkrDistanceType
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _08065278
	ldr r0, _08065270  @ Tsa_ShineBg1_Left
	ldr r1, _08065274  @ gEkrTsaBuffer
	bl LZ77UnCompWram
	b _08065280
	.align 2, 0
_08065260: .4byte gEfxBgSemaphore
_08065264: .4byte gUnknown_085D7530
_08065268: .4byte Img_ShineBg1
_0806526C: .4byte gEkrDistanceType
_08065270: .4byte Tsa_ShineBg1_Left
_08065274: .4byte gEkrTsaBuffer
_08065278:
	ldr r0, _080652A0  @ Tsa_ShineBg1_Right
	ldr r1, _080652A4  @ gEkrTsaBuffer
	bl LZ77UnCompWram
_08065280:
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _080652AC
	ldr r0, _080652A4  @ gEkrTsaBuffer
	ldr r1, _080652A8  @ gBG1TilemapBuffer
	movs r2, #1
	str r2, [sp]
	adds r2, #0xff
	str r2, [sp, #4]
	movs r2, #0x1e
	movs r3, #0x14
	bl EfxTmCpyBgHFlip
	b _080652C0
	.align 2, 0
_080652A0: .4byte Tsa_ShineBg1_Right
_080652A4: .4byte gEkrTsaBuffer
_080652A8: .4byte gBG1TilemapBuffer
_080652AC:
	ldr r0, _080652F4  @ gEkrTsaBuffer
	ldr r1, _080652F8  @ gBG1TilemapBuffer
	movs r2, #1
	str r2, [sp]
	adds r2, #0xff
	str r2, [sp, #4]
	movs r2, #0x1e
	movs r3, #0x14
	bl EfxTmCpyBG
_080652C0:
	movs r0, #2
	bl BG_EnableSyncByMask
	bl SpellFx_SetSomeColorEffect
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	ldr r2, _080652FC  @ gLCDControlBuffer
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
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080652F4: .4byte gEkrTsaBuffer
_080652F8: .4byte gBG1TilemapBuffer
_080652FC: .4byte gLCDControlBuffer

	THUMB_FUNC_END sub_806521C

	THUMB_FUNC_START sub_8065300
sub_8065300: @ 0x08065300
	push {lr}
	bl SpellFx_ClearBG1
	ldr r1, _08065318  @ gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SetDefaultColorEffects_
	pop {r0}
	bx r0
	.align 2, 0
_08065318: .4byte gEfxBgSemaphore

	THUMB_FUNC_END sub_8065300

	THUMB_FUNC_START sub_806531C
sub_806531C: @ 0x0806531C
	push {lr}
	adds r2, r0, #0
	ldrh r0, [r2, #0x2c]
	adds r0, #1
	strh r0, [r2, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r3, #0x2e
	ldrsh r1, [r2, r3]
	cmp r0, r1
	ble _08065338
	adds r0, r2, #0
	bl Proc_Break
_08065338:
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_806531C

	THUMB_FUNC_START sub_806533C
sub_806533C: @ 0x0806533C
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _08065374  @ gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08065378  @ gUnknown_085D7550
	movs r1, #3
	bl Proc_Start
	adds r1, r0, #0
	str r4, [r1, #0x5c]
	movs r0, #0
	strh r0, [r1, #0x2c]
	strh r0, [r1, #0x2e]
	str r0, [r1, #0x44]
	ldr r0, _0806537C  @ gUnknown_080DE3DA
	str r0, [r1, #0x48]
	ldr r0, _08065380  @ Pal_ShineBg_08726FF4
	str r0, [r1, #0x4c]
	adds r0, #0x60
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08065374: .4byte gEfxBgSemaphore
_08065378: .4byte gUnknown_085D7550
_0806537C: .4byte gUnknown_080DE3DA
_08065380: .4byte Pal_ShineBg_08726FF4

	THUMB_FUNC_END sub_806533C

	THUMB_FUNC_START sub_8065384
sub_8065384: @ 0x08065384
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
	blt _080653AA
	ldr r0, [r4, #0x4c]
	lsls r1, r1, #5
	adds r0, r0, r1
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	b _080653C0
_080653AA:
	movs r0, #1
	negs r0, r0
	cmp r1, r0
	bne _080653C0
	ldr r1, _080653C8  @ gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
_080653C0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080653C8: .4byte gEfxBgSemaphore

	THUMB_FUNC_END sub_8065384

	THUMB_FUNC_START sub_80653CC
sub_80653CC: @ 0x080653CC
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _08065414  @ gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08065418  @ gUnknown_085D7570
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r1, [r0, #0x44]
	ldr r1, _0806541C  @ gUnknown_080DE3F8
	str r1, [r0, #0x48]
	ldr r1, _08065420  @ gUnknown_085D7588
	str r1, [r0, #0x4c]
	str r1, [r0, #0x50]
	ldr r1, _08065424  @ gUnknown_085D75B8
	str r1, [r0, #0x54]
	ldr r0, _08065428  @ gUnknown_0874394C
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
_08065414: .4byte gEfxBgSemaphore
_08065418: .4byte gUnknown_085D7570
_0806541C: .4byte gUnknown_080DE3F8
_08065420: .4byte gUnknown_085D7588
_08065424: .4byte gUnknown_085D75B8
_08065428: .4byte gUnknown_0874394C

	THUMB_FUNC_END sub_80653CC

	THUMB_FUNC_START sub_806542C
sub_806542C: @ 0x0806542C
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r0, #0x2c
	adds r1, r7, #0
	adds r1, #0x44
	ldr r2, [r7, #0x48]
	bl EfxAdvanceFrameLut
	lsls r0, r0, #0x10
	asrs r4, r0, #0x10
	cmp r4, #0
	blt _08065468
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
	b _08065486
_08065468:
	movs r0, #1
	negs r0, r0
	cmp r4, r0
	bne _08065486
	bl SpellFx_ClearBG1
	ldr r1, _0806548C  @ gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SetDefaultColorEffects_
	adds r0, r7, #0
	bl Proc_Break
_08065486:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806548C: .4byte gEfxBgSemaphore

	THUMB_FUNC_END sub_806542C

	THUMB_FUNC_START sub_8065490
sub_8065490: @ 0x08065490
	bx lr

	THUMB_FUNC_END sub_8065490

	THUMB_FUNC_START nullsub_53
nullsub_53: @ 0x08065494
	bx lr

	THUMB_FUNC_END nullsub_53

	THUMB_FUNC_START sub_8065498
sub_8065498: @ 0x08065498
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _080654E0  @ gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _080654E4  @ gUnknown_085D75E8
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r2, #0
	strh r2, [r0, #0x2c]
	str r2, [r0, #0x44]
	ldr r1, _080654E8  @ gUnknown_080DE47E
	str r1, [r0, #0x48]
	ldr r1, _080654EC  @ gUnknown_085D7628
	str r1, [r0, #0x4c]
	str r1, [r0, #0x50]
	ldr r1, _080654F0  @ gUnknown_085D7600
	str r1, [r0, #0x54]
	str r2, [r0, #0x58]
	ldr r0, _080654F4  @ gUnknown_08750268
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	bl SpellFx_SetSomeColorEffect
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080654E0: .4byte gEfxBgSemaphore
_080654E4: .4byte gUnknown_085D75E8
_080654E8: .4byte gUnknown_080DE47E
_080654EC: .4byte gUnknown_085D7628
_080654F0: .4byte gUnknown_085D7600
_080654F4: .4byte gUnknown_08750268

	THUMB_FUNC_END sub_8065498

	THUMB_FUNC_START sub_80654F8
sub_80654F8: @ 0x080654F8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl EfxAdvanceFrameLut
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	cmp r1, #0
	blt _08065594
	ldr r7, [r4, #0x4c]
	ldr r0, [r4, #0x50]
	mov r8, r0
	ldr r0, [r4, #0x54]
	lsls r5, r1, #2
	adds r6, r5, r0
	ldr r0, [r4, #0x58]
	ldr r2, [r6]
	cmp r0, r2
	beq _08065534
	movs r1, #0x80
	lsls r1, r1, #6
	adds r0, r2, #0
	bl SpellFx_RegisterBgGfx
_08065534:
	ldr r0, [r6]
	str r0, [r4, #0x58]
	ldr r0, [r4, #0x5c]
	adds r1, r5, r7
	ldr r1, [r1]
	mov r3, r8
	adds r2, r5, r3
	ldr r2, [r2]
	bl SpellFx_WriteBgMap
	ldr r0, _08065570  @ gEkrDistanceType
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #1
	bne _080655B2
	ldr r0, [r4, #0x5c]
	bl GetAnimPosition
	adds r1, r0, #0
	cmp r1, #0
	bne _08065578
	ldr r0, _08065574  @ gBG1TilemapBuffer
	str r1, [sp]
	movs r1, #3
	movs r2, #0x14
	movs r3, #0
	bl FillBGRect
	b _08065588
	.align 2, 0
_08065570: .4byte gEkrDistanceType
_08065574: .4byte gBG1TilemapBuffer
_08065578:
	ldr r0, _08065590  @ gBG1TilemapBuffer+0x03A
	movs r1, #0
	str r1, [sp]
	movs r1, #3
	movs r2, #0x14
	movs r3, #0
	bl FillBGRect
_08065588:
	movs r0, #2
	bl BG_EnableSyncByMask
	b _080655B2
	.align 2, 0
_08065590: .4byte gBG1TilemapBuffer+0x03A
_08065594:
	movs r0, #1
	negs r0, r0
	cmp r1, r0
	bne _080655B2
	bl SpellFx_ClearBG1
	ldr r1, _080655C0  @ gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SetDefaultColorEffects_
	adds r0, r4, #0
	bl Proc_Break
_080655B2:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080655C0: .4byte gEfxBgSemaphore

	THUMB_FUNC_END sub_80654F8

	THUMB_FUNC_START sub_80655C4
sub_80655C4: @ 0x080655C4
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r1, _08065610  @ gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08065614  @ gUnknown_085D7650
	movs r1, #3
	bl Proc_Start
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	ldr r3, _08065618  @ gUnknown_08752020
	str r3, [sp]
	adds r0, r4, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl EfxCreateFrontAnim
	str r0, [r5, #0x60]
	ldrh r1, [r4, #2]
	strh r1, [r0, #2]
	ldrh r1, [r4, #4]
	strh r1, [r0, #4]
	ldr r0, _0806561C  @ gUnknown_08751808
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	ldr r0, _08065620  @ gUnknown_08751DB4
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08065610: .4byte gEfxBgSemaphore
_08065614: .4byte gUnknown_085D7650
_08065618: .4byte gUnknown_08752020
_0806561C: .4byte gUnknown_08751808
_08065620: .4byte gUnknown_08751DB4

	THUMB_FUNC_END sub_80655C4

	THUMB_FUNC_START sub_8065624
sub_8065624: @ 0x08065624
	ldr r1, _08065630  @ gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bx lr
	.align 2, 0
_08065630: .4byte gEfxBgSemaphore

	THUMB_FUNC_END sub_8065624

	THUMB_FUNC_START sub_8065634
sub_8065634: @ 0x08065634
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl SpellFx_ClearBG1Position
	ldr r0, _0806566C  @ ProcScr_efxDancepara
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	movs r0, #1
	str r0, [r4, #0x44]
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
_0806566C: .4byte ProcScr_efxDancepara

	THUMB_FUNC_END sub_8065634

	THUMB_FUNC_START sub_8065670
sub_8065670: @ 0x08065670
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl SpellFx_ClearBG1Position
	ldr r0, _080656A8  @ ProcScr_efxDancepara
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	movs r0, #2
	str r0, [r4, #0x44]
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
_080656A8: .4byte ProcScr_efxDancepara

	THUMB_FUNC_END sub_8065670

	THUMB_FUNC_START sub_80656AC
sub_80656AC: @ 0x080656AC
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl SpellFx_ClearBG1Position
	ldr r0, _080656E4  @ ProcScr_efxDancepara
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	movs r0, #3
	str r0, [r4, #0x44]
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
_080656E4: .4byte ProcScr_efxDancepara

	THUMB_FUNC_END sub_80656AC

	THUMB_FUNC_START sub_80656E8
sub_80656E8: @ 0x080656E8
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl SpellFx_ClearBG1Position
	ldr r0, _08065720  @ ProcScr_efxDancepara
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	movs r0, #4
	str r0, [r4, #0x44]
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
_08065720: .4byte ProcScr_efxDancepara

	THUMB_FUNC_END sub_80656E8

	THUMB_FUNC_START sub_8065724
sub_8065724: @ 0x08065724
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
	bne _080657A4
	ldr r1, [r5, #0x44]
	adds r0, r4, #0
	bl sub_805CA64
	ldr r1, [r5, #0x44]
	adds r0, r4, #0
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
_080657A4:
	movs r1, #0x2c
	ldrsh r0, [r5, r1]
	cmp r0, #0x7d
	bne _080657B6
	ldrh r0, [r4, #0x10]
	movs r1, #9
	orrs r0, r1
	strh r0, [r4, #0x10]
	b _080657CC
_080657B6:
	cmp r0, #0xa5
	bne _080657CC
	ldrh r0, [r4, #0x10]
	movs r1, #2
	orrs r0, r1
	strh r0, [r4, #0x10]
	bl SpellFx_Finish
	adds r0, r5, #0
	bl Proc_Break
_080657CC:
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8065724
