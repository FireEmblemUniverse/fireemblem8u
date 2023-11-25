	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	THUMB_FUNC_START StartSpellAnimFimbulvetr
StartSpellAnimFimbulvetr: @ 0x0805E0E4
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl NewEfxSpellCast
	bl SpellFx_ClearBG1Position
	ldr r0, _0805E11C  @ ProcScr_efxFimbulvetr
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
_0805E11C: .4byte ProcScr_efxFimbulvetr

	THUMB_FUNC_END StartSpellAnimFimbulvetr

	THUMB_FUNC_START sub_805E120
sub_805E120: @ 0x0805E120
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
	bne _0805E14E
	ldr r0, [r4, #0x5c]
	movs r1, #1
	negs r1, r1
	bl NewEfxFarAttackWithDistance
_0805E14E:
	movs r0, #0x2c
	ldrsh r1, [r4, r0]
	adds r0, r6, #1
	cmp r1, r0
	bne _0805E194
	adds r0, r5, #0
	bl sub_805E230
	adds r0, r5, #0
	bl sub_805E4C4
	movs r0, #1
	movs r1, #0
	movs r2, #0x10
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	movs r0, #0x10
	str r0, [sp]
	str r7, [sp, #4]
	adds r0, r5, #0
	movs r1, #0
	movs r2, #0x10
	movs r3, #0
	bl NewEfxALPHA
	movs r0, #0x91
	lsls r0, r0, #1
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r5, r3]
	movs r3, #1
	bl PlaySFX
_0805E194:
	movs r0, #0x2c
	ldrsh r1, [r4, r0]
	adds r0, r6, #0
	adds r0, #0x52
	cmp r1, r0
	bne _0805E1AA
	ldr r0, [r4, #0x5c]
	movs r1, #4
	bl NewEfxFlashBgWhite
	b _0805E228
_0805E1AA:
	adds r0, r6, #0
	adds r0, #0x55
	cmp r1, r0
	bne _0805E1E4
	adds r0, r5, #0
	bl sub_805E318
	adds r0, r5, #0
	bl sub_805E430
	str r7, [sp]
	str r7, [sp, #4]
	adds r0, r5, #0
	movs r1, #0x18
	movs r2, #0x10
	movs r3, #0x10
	bl NewEfxALPHA
	ldr r0, _0805E1E0  @ 0x00000123
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r5, r3]
	movs r3, #1
	bl PlaySFX
	b _0805E228
	.align 2, 0
_0805E1E0: .4byte 0x00000123
_0805E1E4:
	adds r0, r6, #0
	adds r0, #0x58
	cmp r1, r0
	bne _0805E20C
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
	bne _0805E228
	adds r0, r5, #0
	bl EfxPlayHittedSFX
	b _0805E228
_0805E20C:
	adds r0, r6, #0
	adds r0, #0x88
	cmp r1, r0
	beq _0805E228
	adds r0, #0x19
	cmp r1, r0
	bne _0805E228
	bl SpellFx_Finish
	bl RegisterEfxSpellCastEnd
	adds r0, r4, #0
	bl Proc_Break
_0805E228:
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_805E120

	THUMB_FUNC_START sub_805E230
sub_805E230: @ 0x0805E230
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r1, _0805E284  @ gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805E288  @ ProcScr_efxFimbulvetrBGTR
	movs r1, #3
	bl Proc_Start
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	str r0, [r5, #0x44]
	ldr r0, _0805E28C  @ gUnknown_080DCE6E
	str r0, [r5, #0x48]
	ldr r0, _0805E290  @ gUnknown_085D5688
	str r0, [r5, #0x4c]
	str r0, [r5, #0x50]
	ldr r0, _0805E294  @ gUnknown_085D56A0
	str r0, [r5, #0x54]
	ldr r0, _0805E298  @ gUnknown_08617F04
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	ldr r0, _0805E29C  @ gEkrDistanceType
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _0805E2AA
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _0805E2A0
	movs r0, #1
	movs r1, #0x18
	movs r2, #0
	bl BG_SetPosition
	b _0805E2AA
	.align 2, 0
_0805E284: .4byte gEfxBgSemaphore
_0805E288: .4byte ProcScr_efxFimbulvetrBGTR
_0805E28C: .4byte gUnknown_080DCE6E
_0805E290: .4byte gUnknown_085D5688
_0805E294: .4byte gUnknown_085D56A0
_0805E298: .4byte gUnknown_08617F04
_0805E29C: .4byte gEkrDistanceType
_0805E2A0:
	movs r0, #1
	movs r1, #0xe8
	movs r2, #0
	bl BG_SetPosition
_0805E2AA:
	bl SpellFx_SetSomeColorEffect
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_805E230

	THUMB_FUNC_START sub_805E2B4
sub_805E2B4: @ 0x0805E2B4
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl EfxAdvanceFrameLut
	lsls r0, r0, #0x10
	asrs r3, r0, #0x10
	cmp r3, #0
	blt _0805E2F0
	ldr r1, [r4, #0x4c]
	ldr r2, [r4, #0x50]
	ldr r5, [r4, #0x54]
	ldr r0, [r4, #0x5c]
	lsls r4, r3, #2
	adds r1, r4, r1
	ldr r1, [r1]
	adds r2, r4, r2
	ldr r2, [r2]
	bl SpellFx_WriteBgMap
	adds r4, r4, r5
	ldr r0, [r4]
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	b _0805E30E
_0805E2F0:
	movs r0, #1
	negs r0, r0
	cmp r3, r0
	bne _0805E30E
	bl SpellFx_ClearBG1
	ldr r1, _0805E314  @ gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SetDefaultColorEffects_
	adds r0, r4, #0
	bl Proc_Break
_0805E30E:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805E314: .4byte gEfxBgSemaphore

	THUMB_FUNC_END sub_805E2B4

	THUMB_FUNC_START sub_805E318
sub_805E318: @ 0x0805E318
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r1, _0805E36C  @ gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805E370  @ gUnknown_085D56B8
	movs r1, #3
	bl Proc_Start
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	str r0, [r5, #0x44]
	ldr r0, _0805E374  @ gUnknown_080DCEEC
	str r0, [r5, #0x48]
	ldr r0, _0805E378  @ gUnknown_085D56D0
	str r0, [r5, #0x4c]
	str r0, [r5, #0x50]
	ldr r0, _0805E37C  @ gUnknown_085D56FC
	str r0, [r5, #0x54]
	ldr r0, _0805E380  @ gUnknown_086101DC
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	ldr r0, _0805E384  @ gEkrDistanceType
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _0805E392
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _0805E388
	movs r0, #1
	movs r1, #0xe8
	movs r2, #0
	bl BG_SetPosition
	b _0805E392
	.align 2, 0
_0805E36C: .4byte gEfxBgSemaphore
_0805E370: .4byte gUnknown_085D56B8
_0805E374: .4byte gUnknown_080DCEEC
_0805E378: .4byte gUnknown_085D56D0
_0805E37C: .4byte gUnknown_085D56FC
_0805E380: .4byte gUnknown_086101DC
_0805E384: .4byte gEkrDistanceType
_0805E388:
	movs r0, #1
	movs r1, #0x18
	movs r2, #0
	bl BG_SetPosition
_0805E392:
	bl SpellFx_SetSomeColorEffect
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_805E318

	THUMB_FUNC_START sub_805E39C
sub_805E39C: @ 0x0805E39C
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r0, _0805E3C0  @ gEkrDistanceType
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _0805E3CE
	ldr r0, [r6, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _0805E3C4
	movs r0, #1
	movs r1, #0x18
	movs r2, #0
	bl BG_SetPosition
	b _0805E3CE
	.align 2, 0
_0805E3C0: .4byte gEkrDistanceType
_0805E3C4:
	movs r0, #1
	movs r1, #0xe8
	movs r2, #0
	bl BG_SetPosition
_0805E3CE:
	adds r0, r6, #0
	adds r0, #0x2c
	adds r1, r6, #0
	adds r1, #0x44
	ldr r2, [r6, #0x48]
	bl EfxAdvanceFrameLut
	lsls r0, r0, #0x10
	asrs r4, r0, #0x10
	cmp r4, #0
	blt _0805E408
	ldr r1, [r6, #0x4c]
	ldr r2, [r6, #0x50]
	ldr r5, [r6, #0x54]
	ldr r0, [r6, #0x5c]
	lsls r4, r4, #2
	adds r1, r4, r1
	ldr r1, [r1]
	adds r2, r4, r2
	ldr r2, [r2]
	bl SpellFx_WriteBgMap
	adds r4, r4, r5
	ldr r0, [r4]
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	b _0805E426
_0805E408:
	movs r0, #1
	negs r0, r0
	cmp r4, r0
	bne _0805E426
	bl SpellFx_ClearBG1
	ldr r1, _0805E42C  @ gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SetDefaultColorEffects_
	adds r0, r6, #0
	bl Proc_Break
_0805E426:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0805E42C: .4byte gEfxBgSemaphore

	THUMB_FUNC_END sub_805E39C

	THUMB_FUNC_START sub_805E430
sub_805E430: @ 0x0805E430
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r1, _0805E480  @ gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805E484  @ gUnknown_085D5728
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	ldr r3, _0805E488  @ gUnknown_0861ACB8
	str r3, [sp]
	adds r0, r5, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl EfxCreateFrontAnim
	str r0, [r4, #0x60]
	ldrh r1, [r0, #2]
	adds r1, #0x18
	strh r1, [r0, #2]
	ldr r0, _0805E48C  @ gUnknown_08670528
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _0805E490  @ gUnknown_08618BBC
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805E480: .4byte gEfxBgSemaphore
_0805E484: .4byte gUnknown_085D5728
_0805E488: .4byte gUnknown_0861ACB8
_0805E48C: .4byte gUnknown_08670528
_0805E490: .4byte gUnknown_08618BBC

	THUMB_FUNC_END sub_805E430

	THUMB_FUNC_START sub_805E494
sub_805E494: @ 0x0805E494
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x33
	ble _0805E4BA
	ldr r0, [r4, #0x60]
	bl AnimDelete
	ldr r1, _0805E4C0  @ gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
_0805E4BA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805E4C0: .4byte gEfxBgSemaphore

	THUMB_FUNC_END sub_805E494

	THUMB_FUNC_START sub_805E4C4
sub_805E4C4: @ 0x0805E4C4
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _0805E500  @ gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805E504  @ gUnknown_085D5740
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r2, #0
	strh r2, [r0, #0x2c]
	strh r2, [r0, #0x2e]
	movs r1, #1
	str r1, [r0, #0x44]
	str r2, [r0, #0x48]
	ldr r0, _0805E508  @ gUnknown_08670528
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _0805E50C  @ gUnknown_08618BBC
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805E500: .4byte gEfxBgSemaphore
_0805E504: .4byte gUnknown_085D5740
_0805E508: .4byte gUnknown_08670528
_0805E50C: .4byte gUnknown_08618BBC

	THUMB_FUNC_END sub_805E4C4

	THUMB_FUNC_START sub_805E510
sub_805E510: @ 0x0805E510
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r4, #0
_0805E516:
	ldr r0, [r5, #0x5c]
	adds r1, r4, #0
	bl sub_805E53C
	adds r4, #1
	cmp r4, #0x1f
	ble _0805E516
	ldr r1, _0805E538  @ gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r5, #0
	bl Proc_Break
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805E538: .4byte gEfxBgSemaphore

	THUMB_FUNC_END sub_805E510

	THUMB_FUNC_START sub_805E53C
sub_805E53C: @ 0x0805E53C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	adds r6, r0, #0
	mov r8, r1
	mov r4, sp
	mov r0, sp
	movs r1, #0
	movs r2, #8
	bl memset
	movs r5, #0
	movs r0, #1
	strb r0, [r4, #6]
	strb r0, [r4, #7]
	ldr r1, _0805E5CC  @ gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805E5D0  @ gUnknown_085D5758
	movs r1, #3
	bl Proc_Start
	adds r7, r0, #0
	str r6, [r7, #0x5c]
	strh r5, [r7, #0x2c]
	movs r0, #0x64
	strh r0, [r7, #0x2e]
	movs r0, #7
	mov r1, r8
	ands r0, r1
	mov r2, sp
	adds r4, r2, r0
	ldrb r0, [r4]
	adds r1, r7, #0
	adds r1, #0x29
	strb r0, [r1]
	ldr r0, _0805E5D4  @ gUnknown_0861AD24
	movs r1, #0x78
	bl AnimCreate
	str r0, [r7, #0x60]
	movs r1, #0xa1
	lsls r1, r1, #6
	strh r1, [r0, #8]
	movs r1, #0x80
	lsls r1, r1, #1
	strh r1, [r0, #2]
	strh r1, [r0, #4]
	ldr r5, _0805E5D8  @ 0x0000FFFF
	adds r0, r5, #0
	bl sub_80716B0
	strh r0, [r7, #0x32]
	adds r0, r5, #0
	bl sub_80716B0
	strh r0, [r7, #0x3a]
	ldrb r0, [r4]
	cmp r0, #0
	bne _0805E5E0
	adds r0, r5, #0
	bl sub_80716B0
	ldr r2, _0805E5DC  @ 0x000001FF
	adds r1, r2, #0
	ands r0, r1
	movs r1, #0xe0
	lsls r1, r1, #3
	b _0805E5F2
	.align 2, 0
_0805E5CC: .4byte gEfxBgSemaphore
_0805E5D0: .4byte gUnknown_085D5758
_0805E5D4: .4byte gUnknown_0861AD24
_0805E5D8: .4byte 0x0000FFFF
_0805E5DC: .4byte 0x000001FF
_0805E5E0:
	adds r0, r5, #0
	bl sub_80716B0
	ldr r2, _0805E63C  @ 0x000001FF
	adds r1, r2, #0
	ands r0, r1
	movs r2, #0xa0
	lsls r2, r2, #4
	adds r1, r2, #0
_0805E5F2:
	adds r0, r0, r1
	strh r0, [r7, #0x34]
	ldr r4, _0805E640  @ 0x0000FF0F
	adds r0, r4, #0
	bl sub_80716B0
	ldr r2, _0805E644  @ 0x000003FF
	adds r1, r2, #0
	ands r0, r1
	ldr r1, _0805E648  @ 0xFFFFFF00
	adds r0, r0, r1
	strh r0, [r7, #0x3c]
	adds r0, r4, #0
	bl sub_80716B0
	strh r0, [r7, #0x36]
	adds r0, r4, #0
	bl sub_80716B0
	strh r0, [r7, #0x3e]
	movs r0, #7
	mov r2, r8
	ands r0, r2
	add r0, sp
	ldrb r0, [r0]
	cmp r0, #0
	bne _0805E64C
	adds r0, r4, #0
	bl sub_80716B0
	ldr r2, _0805E63C  @ 0x000001FF
	adds r1, r2, #0
	ands r0, r1
	movs r1, #0xe0
	lsls r1, r1, #3
	b _0805E65E
	.align 2, 0
_0805E63C: .4byte 0x000001FF
_0805E640: .4byte 0x0000FF0F
_0805E644: .4byte 0x000003FF
_0805E648: .4byte 0xFFFFFF00
_0805E64C:
	adds r0, r4, #0
	bl sub_80716B0
	ldr r2, _0805E684  @ 0x000001FF
	adds r1, r2, #0
	ands r0, r1
	movs r2, #0xa0
	lsls r2, r2, #4
	adds r1, r2, #0
_0805E65E:
	adds r0, r0, r1
	strh r0, [r7, #0x38]
	ldr r0, _0805E688  @ 0x0000FF0F
	bl sub_80716B0
	ldr r2, _0805E68C  @ 0x000003FF
	adds r1, r2, #0
	ands r0, r1
	ldr r1, _0805E690  @ 0xFFFFFF00
	adds r0, r0, r1
	adds r1, r7, #0
	adds r1, #0x40
	strh r0, [r1]
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805E684: .4byte 0x000001FF
_0805E688: .4byte 0x0000FF0F
_0805E68C: .4byte 0x000003FF
_0805E690: .4byte 0xFFFFFF00

	THUMB_FUNC_END sub_805E53C

	THUMB_FUNC_START sub_805E694
sub_805E694: @ 0x0805E694
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r3, [r4, #0x60]
	ldrh r0, [r4, #0x2c]
	adds r2, r0, #1
	strh r2, [r4, #0x2c]
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	movs r5, #0x2e
	ldrsh r1, [r4, r5]
	cmp r0, r1
	ble _0805E6C8
	ldr r1, _0805E6C4  @ gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r3, #0
	bl AnimDelete
	adds r0, r4, #0
	bl Proc_Break
	b _0805E748
	.align 2, 0
_0805E6C4: .4byte gEfxBgSemaphore
_0805E6C8:
	movs r0, #1
	ands r2, r0
	cmp r2, #0
	bne _0805E70C
	adds r0, r4, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #0
	bne _0805E6E4
	ldr r0, _0805E6E0  @ gUnknown_0861AD84
	b _0805E6E6
	.align 2, 0
_0805E6E0: .4byte gUnknown_0861AD84
_0805E6E4:
	ldr r0, _0805E708  @ gUnknown_0861AD8C
_0805E6E6:
	str r0, [r3, #0x24]
	str r0, [r3, #0x20]
	movs r0, #0
	strh r0, [r3, #6]
	ldrh r1, [r4, #0x34]
	ldrh r0, [r4, #0x32]
	adds r1, r1, r0
	strh r1, [r4, #0x32]
	ldrh r0, [r4, #0x3c]
	ldrh r2, [r4, #0x3a]
	adds r0, r0, r2
	strh r0, [r4, #0x3a]
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x18
	strh r1, [r3, #2]
	ldrh r0, [r4, #0x3a]
	b _0805E744
	.align 2, 0
_0805E708: .4byte gUnknown_0861AD8C
_0805E70C:
	adds r0, r4, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #0
	bne _0805E720
	ldr r0, _0805E71C  @ gUnknown_0861AD84
	b _0805E722
	.align 2, 0
_0805E71C: .4byte gUnknown_0861AD84
_0805E720:
	ldr r0, _0805E750  @ gUnknown_0861AD8C
_0805E722:
	str r0, [r3, #0x24]
	str r0, [r3, #0x20]
	movs r0, #0
	strh r0, [r3, #6]
	ldrh r0, [r4, #0x38]
	ldrh r5, [r4, #0x3e]
	adds r0, r0, r5
	strh r0, [r4, #0x3e]
	adds r1, r4, #0
	adds r1, #0x40
	ldrh r1, [r1]
	adds r0, r0, r1
	strh r0, [r4, #0x3e]
	ldrh r0, [r4, #0x36]
	lsrs r0, r0, #8
	strh r0, [r3, #2]
	ldrh r0, [r4, #0x3e]
_0805E744:
	lsrs r0, r0, #8
	strh r0, [r3, #4]
_0805E748:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805E750: .4byte gUnknown_0861AD8C

	THUMB_FUNC_END sub_805E694

	THUMB_FUNC_START sub_805E754
sub_805E754: @ 0x0805E754
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl NewEfxSpellCast
	bl SpellFx_ClearBG1Position
	ldr r0, _0805E78C  @ gUnknown_085D5770
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
_0805E78C: .4byte gUnknown_085D5770

	THUMB_FUNC_END sub_805E754

	THUMB_FUNC_START sub_805E790
sub_805E790: @ 0x0805E790
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetAnimAnotherSide
	adds r5, r0, #0
	bl EfxGetCamMovDuration
	adds r6, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _0805E7BA
	ldr r0, [r4, #0x5c]
	movs r1, #1
	negs r1, r1
	bl NewEfxFarAttackWithDistance
_0805E7BA:
	movs r0, #0x2c
	ldrsh r1, [r4, r0]
	adds r0, r6, #1
	cmp r1, r0
	bne _0805E7E0
	ldr r0, _0805E828  @ 0x00000119
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r5, r3]
	movs r3, #1
	bl PlaySFX
	adds r0, r5, #0
	bl sub_805E850
	adds r0, r5, #0
	bl sub_805E98C
_0805E7E0:
	movs r0, #0x2c
	ldrsh r1, [r4, r0]
	adds r0, r6, #0
	adds r0, #0x59
	cmp r1, r0
	bne _0805E7F6
	adds r0, r5, #0
	movs r1, #2
	movs r2, #3
	bl sub_805EAAC
_0805E7F6:
	movs r3, #0x2c
	ldrsh r1, [r4, r3]
	adds r0, r6, #0
	adds r0, #0x5e
	cmp r1, r0
	bne _0805E82C
	adds r0, r5, #0
	bl sub_805E900
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
	bne _0805E848
	adds r0, r5, #0
	bl EfxPlayHittedSFX
	b _0805E848
	.align 2, 0
_0805E828: .4byte 0x00000119
_0805E82C:
	adds r0, r6, #0
	adds r0, #0xc3
	cmp r1, r0
	beq _0805E848
	adds r0, #5
	cmp r1, r0
	bne _0805E848
	bl SpellFx_Finish
	bl RegisterEfxSpellCastEnd
	adds r0, r4, #0
	bl Proc_Break
_0805E848:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_805E790

	THUMB_FUNC_START sub_805E850
sub_805E850: @ 0x0805E850
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _0805E88C  @ gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805E890  @ gUnknown_085D5788
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r1, [r0, #0x44]
	ldr r1, _0805E894  @ gUnknown_080DCF7E
	str r1, [r0, #0x48]
	ldr r1, _0805E898  @ gUnknown_085D57CC
	str r1, [r0, #0x4c]
	str r1, [r0, #0x50]
	ldr r1, _0805E89C  @ gUnknown_085D57A0
	str r1, [r0, #0x54]
	ldr r0, _0805E8A0  @ gUnknown_08608838
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	bl SpellFx_SetSomeColorEffect
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805E88C: .4byte gEfxBgSemaphore
_0805E890: .4byte gUnknown_085D5788
_0805E894: .4byte gUnknown_080DCF7E
_0805E898: .4byte gUnknown_085D57CC
_0805E89C: .4byte gUnknown_085D57A0
_0805E8A0: .4byte gUnknown_08608838

	THUMB_FUNC_END sub_805E850

	THUMB_FUNC_START sub_805E8A4
sub_805E8A4: @ 0x0805E8A4
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
	blt _0805E8E0
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
	b _0805E8F6
_0805E8E0:
	movs r0, #1
	negs r0, r0
	cmp r4, r0
	bne _0805E8F6
	ldr r1, _0805E8FC  @ gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r7, #0
	bl Proc_End
_0805E8F6:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805E8FC: .4byte gEfxBgSemaphore

	THUMB_FUNC_END sub_805E8A4

	THUMB_FUNC_START sub_805E900
sub_805E900: @ 0x0805E900
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _0805E91C  @ gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805E920  @ gUnknown_085D57F8
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805E91C: .4byte gEfxBgSemaphore
_0805E920: .4byte gUnknown_085D57F8

	THUMB_FUNC_END sub_805E900

	THUMB_FUNC_START sub_805E924
sub_805E924: @ 0x0805E924
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	ldr r3, _0805E95C  @ gUnknown_0860A5D4
	str r3, [sp]
	adds r1, r3, #0
	adds r2, r3, #0
	bl EfxCreateFrontAnim
	str r0, [r4, #0x60]
	ldr r0, _0805E960  @ gUnknown_085F3F40
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _0805E964  @ gUnknown_085F3AA8
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	adds r0, r4, #0
	bl Proc_Break
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805E95C: .4byte gUnknown_0860A5D4
_0805E960: .4byte gUnknown_085F3F40
_0805E964: .4byte gUnknown_085F3AA8

	THUMB_FUNC_END sub_805E924

	THUMB_FUNC_START sub_805E968
sub_805E968: @ 0x0805E968
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x60]
	bl AnimDelete
	ldr r1, _0805E988  @ gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805E988: .4byte gEfxBgSemaphore

	THUMB_FUNC_END sub_805E968

	THUMB_FUNC_START sub_805E98C
sub_805E98C: @ 0x0805E98C
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _0805E9A8  @ gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805E9AC  @ gUnknown_085D5820
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805E9A8: .4byte gEfxBgSemaphore
_0805E9AC: .4byte gUnknown_085D5820

	THUMB_FUNC_END sub_805E98C

	THUMB_FUNC_START sub_805E9B0
sub_805E9B0: @ 0x0805E9B0
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x8d
	lsls r0, r0, #1
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r2, [r4, #0x5c]
	movs r3, #2
	ldrsh r2, [r2, r3]
	movs r3, #1
	bl PlaySFX
	ldr r0, [r4, #0x5c]
	movs r1, #0x26
	bl NewEfxFlashBgWhite
	movs r0, #0
	strh r0, [r4, #0x2c]
	movs r0, #5
	strh r0, [r4, #0x2e]
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_805E9B0

	THUMB_FUNC_START sub_805E9E4
sub_805E9E4: @ 0x0805E9E4
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	movs r0, #0x2c
	ldrsh r3, [r6, r0]
	movs r1, #0x2e
	ldrsh r0, [r6, r1]
	str r0, [sp]
	movs r0, #0
	movs r1, #0x10
	movs r2, #0
	bl Interpolate
	adds r5, r0, #0
	ldr r0, _0805EA44  @ gPaletteBuffer
	ldr r4, _0805EA48  @ gEfxPal
	movs r2, #0x80
	lsls r2, r2, #1
	adds r1, r4, #0
	bl CpuFastSet
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0x20
	adds r3, r5, #0
	bl EfxPalWhiteInOut
	ldrh r0, [r6, #0x2c]
	adds r0, #1
	strh r0, [r6, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x2e
	ldrsh r1, [r6, r2]
	cmp r0, r1
	ble _0805EA3A
	movs r0, #0
	strh r0, [r6, #0x2c]
	movs r0, #0xa
	strh r0, [r6, #0x2e]
	adds r0, r6, #0
	bl Proc_Break
_0805EA3A:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0805EA44: .4byte gPaletteBuffer
_0805EA48: .4byte gEfxPal

	THUMB_FUNC_END sub_805E9E4

	THUMB_FUNC_START sub_805EA4C
sub_805EA4C: @ 0x0805EA4C
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	movs r0, #0x2c
	ldrsh r3, [r4, r0]
	movs r1, #0x2e
	ldrsh r0, [r4, r1]
	str r0, [sp]
	movs r0, #0
	movs r1, #0x10
	movs r2, #0
	bl Interpolate
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	movs r0, #1
	movs r2, #0x10
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x2e
	ldrsh r1, [r4, r2]
	cmp r0, r1
	ble _0805EA9E
	bl SpellFx_ClearBG1
	bl SetDefaultColorEffects_
	ldr r1, _0805EAA8  @ gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
_0805EA9E:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805EAA8: .4byte gEfxBgSemaphore

	THUMB_FUNC_END sub_805EA4C

	THUMB_FUNC_START sub_805EAAC
sub_805EAAC: @ 0x0805EAAC
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	ldr r1, _0805EAE0  @ gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805EAE4  @ gPaletteBuffer
	ldr r1, _0805EAE8  @ gEfxPal
	movs r2, #0x80
	lsls r2, r2, #1
	bl CpuFastSet
	ldr r0, _0805EAEC  @ gUnknown_085D5860
	movs r1, #0
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r5, [r0, #0x2e]
	strh r6, [r0, #0x30]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0805EAE0: .4byte gEfxBgSemaphore
_0805EAE4: .4byte gPaletteBuffer
_0805EAE8: .4byte gEfxPal
_0805EAEC: .4byte gUnknown_085D5860

	THUMB_FUNC_END sub_805EAAC

	THUMB_FUNC_START sub_805EAF0
sub_805EAF0: @ 0x0805EAF0
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	movs r0, #0x2c
	ldrsh r3, [r5, r0]
	movs r1, #0x2e
	ldrsh r0, [r5, r1]
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0x10
	bl Interpolate
	adds r3, r0, #0
	ldr r4, _0805EB50  @ gEfxPal
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0x20
	bl EfxPalBlackInOut
	movs r1, #0xa0
	lsls r1, r1, #0x13
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r4, #0
	bl CpuFastSet
	bl DisablePaletteSync
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x2e
	ldrsh r1, [r5, r2]
	cmp r0, r1
	ble _0805EB46
	movs r0, #0
	strh r0, [r5, #0x2c]
	adds r0, r5, #0
	bl Proc_Break
_0805EB46:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805EB50: .4byte gEfxPal

	THUMB_FUNC_END sub_805EAF0

	THUMB_FUNC_START sub_805EB54
sub_805EB54: @ 0x0805EB54
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0805EB90  @ gEfxPal
	movs r1, #0xa0
	lsls r1, r1, #0x13
	movs r2, #0x80
	lsls r2, r2, #1
	bl CpuFastSet
	bl DisablePaletteSync
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x30
	ldrsh r1, [r4, r2]
	cmp r0, r1
	ble _0805EB8A
	ldr r1, _0805EB94  @ gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
_0805EB8A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805EB90: .4byte gEfxPal
_0805EB94: .4byte gEfxBgSemaphore

	THUMB_FUNC_END sub_805EB54

	THUMB_FUNC_START sub_805EB98
sub_805EB98: @ 0x0805EB98
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl NewEfxSpellCast
	bl SpellFx_ClearBG1Position
	ldr r0, _0805EBD0  @ gUnknown_085D5880
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
_0805EBD0: .4byte gUnknown_085D5880

	THUMB_FUNC_END sub_805EB98

	THUMB_FUNC_START sub_805EBD4
sub_805EBD4: @ 0x0805EBD4
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetAnimAnotherSide
	adds r5, r0, #0
	bl EfxGetCamMovDuration
	adds r2, r0, #0
	ldr r0, _0805EC2C  @ gEkrDistanceType
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r3, #0x3a
	cmp r0, #0
	beq _0805EBF6
	movs r3, #0x32
_0805EBF6:
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	movs r6, #0
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _0805EC30
	ldr r0, [r4, #0x5c]
	bl sub_805EE24
	movs r0, #0x84
	lsls r0, r0, #1
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r2, [r4, #0x5c]
	movs r3, #2
	ldrsh r2, [r2, r3]
	movs r3, #1
	bl PlaySFX
	ldr r0, [r4, #0x5c]
	movs r1, #1
	negs r1, r1
	bl NewEfxFarAttackWithDistance
	b _0805ECCC
	.align 2, 0
_0805EC2C: .4byte gEkrDistanceType
_0805EC30:
	movs r0, #0x2c
	ldrsh r1, [r4, r0]
	adds r0, r3, r2
	cmp r1, r0
	bne _0805EC44
	ldr r0, [r4, #0x5c]
	movs r1, #6
	bl NewEfxFlashBgWhite
	b _0805ECCC
_0805EC44:
	adds r0, r2, #6
	adds r0, r3, r0
	cmp r1, r0
	bne _0805EC80
	adds r0, r5, #0
	bl sub_805ECD4
	adds r0, r5, #0
	bl sub_805ED98
	str r6, [sp]
	str r6, [sp, #4]
	adds r0, r5, #0
	movs r1, #6
	movs r2, #5
	movs r3, #0x10
	bl NewEfxALPHA
	ldr r0, _0805EC7C  @ 0x00000109
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r5, r3]
	movs r3, #1
	bl PlaySFX
	b _0805ECCC
	.align 2, 0
_0805EC7C: .4byte 0x00000109
_0805EC80:
	adds r0, r2, #0
	adds r0, #8
	adds r0, r3, r0
	cmp r1, r0
	bne _0805ECAA
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
	bne _0805ECCC
	adds r0, r5, #0
	bl EfxPlayHittedSFX
	b _0805ECCC
_0805ECAA:
	adds r0, r2, #0
	adds r0, #0xc
	adds r0, r3, r0
	cmp r1, r0
	beq _0805ECCC
	adds r0, r2, #0
	adds r0, #0xe
	adds r0, r3, r0
	cmp r1, r0
	bne _0805ECCC
	bl SpellFx_Finish
	bl RegisterEfxSpellCastEnd
	adds r0, r4, #0
	bl Proc_Break
_0805ECCC:
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_805EBD4

	THUMB_FUNC_START sub_805ECD4
sub_805ECD4: @ 0x0805ECD4
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r1, _0805ED20  @ gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805ED24  @ gUnknown_085D5898
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	str r0, [r4, #0x44]
	ldr r0, _0805ED28  @ gUnknown_080DD024
	str r0, [r4, #0x48]
	ldr r0, _0805ED2C  @ gUnknown_085D58B0
	str r0, [r4, #0x4c]
	ldr r0, _0805ED30  @ gUnknown_08621960
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	bl SpellFx_SetSomeColorEffect
	ldr r0, [r4, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _0805ED34
	movs r0, #1
	movs r1, #0x18
	movs r2, #0
	bl BG_SetPosition
	b _0805ED3E
	.align 2, 0
_0805ED20: .4byte gEfxBgSemaphore
_0805ED24: .4byte gUnknown_085D5898
_0805ED28: .4byte gUnknown_080DD024
_0805ED2C: .4byte gUnknown_085D58B0
_0805ED30: .4byte gUnknown_08621960
_0805ED34:
	movs r0, #1
	movs r1, #0xe8
	movs r2, #0
	bl BG_SetPosition
_0805ED3E:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_805ECD4

	THUMB_FUNC_START sub_805ED44
sub_805ED44: @ 0x0805ED44
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
	blt _0805ED70
	ldr r2, [r4, #0x4c]
	ldr r0, [r4, #0x5c]
	lsls r1, r1, #2
	adds r1, r1, r2
	ldr r1, [r1]
	movs r2, #0x20
	movs r3, #0x14
	bl SpellFx_WriteBgMapExt
	b _0805ED8E
_0805ED70:
	movs r0, #1
	negs r0, r0
	cmp r1, r0
	bne _0805ED8E
	bl SpellFx_ClearBG1
	ldr r1, _0805ED94  @ gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SetDefaultColorEffects_
	adds r0, r4, #0
	bl Proc_Break
_0805ED8E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805ED94: .4byte gEfxBgSemaphore

	THUMB_FUNC_END sub_805ED44

	THUMB_FUNC_START sub_805ED98
sub_805ED98: @ 0x0805ED98
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _0805EDCC  @ gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805EDD0  @ gUnknown_085D58B8
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r1, [r0, #0x2e]
	str r1, [r0, #0x44]
	ldr r1, _0805EDD4  @ gUnknown_080DD044
	str r1, [r0, #0x48]
	ldr r1, _0805EDD8  @ gUnknown_08622F2C
	str r1, [r0, #0x4c]
	adds r0, r1, #0
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805EDCC: .4byte gEfxBgSemaphore
_0805EDD0: .4byte gUnknown_085D58B8
_0805EDD4: .4byte gUnknown_080DD044
_0805EDD8: .4byte gUnknown_08622F2C

	THUMB_FUNC_END sub_805ED98

	THUMB_FUNC_START sub_805EDDC
sub_805EDDC: @ 0x0805EDDC
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
	blt _0805EE02
	ldr r0, [r4, #0x4c]
	lsls r1, r1, #5
	adds r0, r0, r1
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	b _0805EE18
_0805EE02:
	movs r0, #1
	negs r0, r0
	cmp r1, r0
	bne _0805EE18
	ldr r1, _0805EE20  @ gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
_0805EE18:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805EE20: .4byte gEfxBgSemaphore

	THUMB_FUNC_END sub_805EDDC

	THUMB_FUNC_START sub_805EE24
sub_805EE24: @ 0x0805EE24
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r1, _0805EE68  @ gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805EE6C  @ gUnknown_085D58D8
	movs r1, #3
	bl Proc_Start
	adds r6, r0, #0
	str r4, [r6, #0x5c]
	movs r0, #0
	strh r0, [r6, #0x2c]
	ldr r1, _0805EE70  @ gUnknown_086267D8
	ldr r2, _0805EE74  @ gUnknown_08625094
	ldr r3, _0805EE78  @ gUnknown_0862688C
	ldr r0, _0805EE7C  @ gUnknown_08625148
	str r0, [sp]
	adds r0, r4, #0
	bl EfxCreateFrontAnim
	adds r5, r0, #0
	str r5, [r6, #0x60]
	adds r0, r4, #0
	bl GetAnimPosition
	cmp r0, #0
	bne _0805EE80
	ldrh r0, [r5, #2]
	adds r0, #0x48
	b _0805EE84
	.align 2, 0
_0805EE68: .4byte gEfxBgSemaphore
_0805EE6C: .4byte gUnknown_085D58D8
_0805EE70: .4byte gUnknown_086267D8
_0805EE74: .4byte gUnknown_08625094
_0805EE78: .4byte gUnknown_0862688C
_0805EE7C: .4byte gUnknown_08625148
_0805EE80:
	ldrh r0, [r5, #2]
	subs r0, #0x48
_0805EE84:
	strh r0, [r5, #2]
	movs r0, #0x60
	strh r0, [r6, #0x2e]
	ldr r0, _0805EEA4  @ gUnknown_08623A9C
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _0805EEA8  @ gUnknown_086234D8
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0805EEA4: .4byte gUnknown_08623A9C
_0805EEA8: .4byte gUnknown_086234D8

	THUMB_FUNC_END sub_805EE24

	THUMB_FUNC_START sub_805EEAC
sub_805EEAC: @ 0x0805EEAC
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
	bne _0805EED0
	ldr r1, _0805EED4  @ gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r2, #0
	bl Proc_Break
_0805EED0:
	pop {r0}
	bx r0
	.align 2, 0
_0805EED4: .4byte gEfxBgSemaphore

	THUMB_FUNC_END sub_805EEAC

	.align 2, 0