	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	/**
	 * Magic spell anim effects
	 */

	THUMB_FUNC_START StartSpellAnimFimbulvetr
StartSpellAnimFimbulvetr: @ 0x0805E0E4
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl NewEfxSpellCast
	bl SpellFx_SpellFx_ClearBG1Position
	ldr r0, _0805E11C  @ ProcScr_efxFimbulvetr
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
_0805E11C: .4byte ProcScr_efxFimbulvetr

	THUMB_FUNC_END StartSpellAnimFimbulvetr

	THUMB_FUNC_START sub_805E120
sub_805E120: @ 0x0805E120
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetCoreAIStruct
	adds r5, r0, #0
	bl GetAnimationStartFrameMaybe
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
	bl EkrSoundSomeBark
_0805E194:
	movs r0, #0x2c
	ldrsh r1, [r4, r0]
	adds r0, r6, #0
	adds r0, #0x52
	cmp r1, r0
	bne _0805E1AA
	ldr r0, [r4, #0x5c]
	movs r1, #4
	bl StartSpellBG_FLASH
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
	bl EkrSoundSomeBark
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
	bl sub_8072450
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
	bl EfxSpellCastSet29
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
	bl GetAISSubjectId
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
	bl SpellFx_InterpretBgAnimScript
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
	bl GetAISSubjectId
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
	bl GetAISSubjectId
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
	bl SpellFx_InterpretBgAnimScript
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
	bl EfxAnimCreate1
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
	bl SpellFx_SpellFx_ClearBG1Position
	ldr r0, _0805E78C  @ gUnknown_085D5770
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
_0805E78C: .4byte gUnknown_085D5770

	THUMB_FUNC_END sub_805E754

	THUMB_FUNC_START sub_805E790
sub_805E790: @ 0x0805E790
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetCoreAIStruct
	adds r5, r0, #0
	bl GetAnimationStartFrameMaybe
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
	bl EkrSoundSomeBark
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
	bl sub_8072450
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
	bl EfxSpellCastSet29
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
	bl SpellFx_InterpretBgAnimScript
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
	bl EfxAnimCreate1
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
	bl EkrSoundSomeBark
	ldr r0, [r4, #0x5c]
	movs r1, #0x26
	bl StartSpellBG_FLASH
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
	ldr r4, _0805EA48  @ gEkrBgPalBackupMaybe
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
_0805EA48: .4byte gEkrBgPalBackupMaybe

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
	ldr r1, _0805EAE8  @ gEkrBgPalBackupMaybe
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
_0805EAE8: .4byte gEkrBgPalBackupMaybe
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
	ldr r4, _0805EB50  @ gEkrBgPalBackupMaybe
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0x20
	bl EkrMaybePalFadeWithVal
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
_0805EB50: .4byte gEkrBgPalBackupMaybe

	THUMB_FUNC_END sub_805EAF0

	THUMB_FUNC_START sub_805EB54
sub_805EB54: @ 0x0805EB54
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0805EB90  @ gEkrBgPalBackupMaybe
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
_0805EB90: .4byte gEkrBgPalBackupMaybe
_0805EB94: .4byte gEfxBgSemaphore

	THUMB_FUNC_END sub_805EB54

	THUMB_FUNC_START sub_805EB98
sub_805EB98: @ 0x0805EB98
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl NewEfxSpellCast
	bl SpellFx_SpellFx_ClearBG1Position
	ldr r0, _0805EBD0  @ gUnknown_085D5880
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
_0805EBD0: .4byte gUnknown_085D5880

	THUMB_FUNC_END sub_805EB98

	THUMB_FUNC_START sub_805EBD4
sub_805EBD4: @ 0x0805EBD4
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetCoreAIStruct
	adds r5, r0, #0
	bl GetAnimationStartFrameMaybe
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
	bl EkrSoundSomeBark
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
	bl StartSpellBG_FLASH
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
	bl EkrSoundSomeBark
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
	bl sub_8072450
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
	bl EfxSpellCastSet29
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
	bl GetAISSubjectId
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
	bl SpellFx_InterpretBgAnimScript
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
	bl sub_805576C
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
	bl SpellFx_InterpretBgAnimScript
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
	bl EfxAnimCreate1
	adds r5, r0, #0
	str r5, [r6, #0x60]
	adds r0, r4, #0
	bl GetAISSubjectId
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

	THUMB_FUNC_START sub_805EED8
sub_805EED8: @ 0x0805EED8
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl NewEfxSpellCast
	bl SpellFx_SpellFx_ClearBG1Position
	ldr r0, _0805EF10  @ gUnknown_085D58F0
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
_0805EF10: .4byte gUnknown_085D58F0

	THUMB_FUNC_END sub_805EED8

	THUMB_FUNC_START sub_805EF14
sub_805EF14: @ 0x0805EF14
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetCoreAIStruct
	adds r5, r0, #0
	bl GetAnimationStartFrameMaybe
	adds r2, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _0805EF50
	movs r0, #0x85
	lsls r0, r0, #1
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r2, [r4, #0x5c]
	movs r3, #2
	ldrsh r2, [r2, r3]
	movs r3, #1
	bl EkrSoundSomeBark
	adds r0, r5, #0
	bl sub_805F004
	b _0805EFFE
_0805EF50:
	cmp r0, #0x10
	bne _0805EF5C
	ldr r0, [r4, #0x5c]
	bl sub_805F1A4
	b _0805EFFE
_0805EF5C:
	cmp r0, #0x4a
	bne _0805EF6C
	ldr r0, [r4, #0x5c]
	movs r1, #1
	negs r1, r1
	bl NewEfxFarAttackWithDistance
	b _0805EFFE
_0805EF6C:
	movs r0, #0x2c
	ldrsh r1, [r4, r0]
	adds r0, r2, #0
	adds r0, #0x4b
	cmp r1, r0
	bne _0805EF82
	adds r0, r5, #0
	bl sub_805F1E8
	str r0, [r4, #0x64]
	b _0805EFFE
_0805EF82:
	adds r0, r2, #0
	adds r0, #0x5e
	cmp r1, r0
	bne _0805EFA8
	ldr r0, _0805EFA4  @ 0x000002E1
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r5, r3]
	movs r3, #1
	bl EkrSoundSomeBark
	ldr r0, [r4, #0x5c]
	bl sub_805F0B0
	b _0805EFFE
	.align 2, 0
_0805EFA4: .4byte 0x000002E1
_0805EFA8:
	adds r0, r2, #0
	adds r0, #0x72
	cmp r1, r0
	bne _0805EFB8
	ldr r0, [r4, #0x64]
	bl Proc_End
	b _0805EFFE
_0805EFB8:
	adds r0, r2, #0
	adds r0, #0x83
	cmp r1, r0
	bne _0805EFE8
	ldr r0, [r4, #0x5c]
	movs r1, #6
	bl StartSpellBG_FLASH
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
	bne _0805EFFE
	adds r0, r5, #0
	bl sub_8072450
	b _0805EFFE
_0805EFE8:
	adds r0, r2, #0
	adds r0, #0xa4
	cmp r1, r0
	bne _0805EFFE
	bl SpellFx_Finish
	bl EfxSpellCastSet29
	adds r0, r4, #0
	bl Proc_Break
_0805EFFE:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_805EF14

	THUMB_FUNC_START sub_805F004
sub_805F004: @ 0x0805F004
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r1, _0805F05C  @ gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805F060  @ gUnknown_085D5908
	movs r1, #3
	bl Proc_Start
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	str r0, [r5, #0x44]
	ldr r0, _0805F064  @ gUnknown_080DD094
	str r0, [r5, #0x48]
	ldr r0, _0805F068  @ gUnknown_085D5920
	str r0, [r5, #0x4c]
	str r0, [r5, #0x50]
	ldr r0, _0805F06C  @ gUnknown_085D59C4
	str r0, [r5, #0x54]
	ldr r0, _0805F070  @ gUnknown_0862A2D0
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	bl SpellFx_SetSomeColorEffect
	ldr r0, _0805F074  @ gEkrDistanceType
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _0805F082
	ldr r0, [r5, #0x5c]
	bl GetAISSubjectId
	cmp r0, #0
	bne _0805F078
	movs r0, #1
	movs r1, #0xe8
	movs r2, #0
	bl BG_SetPosition
	b _0805F082
	.align 2, 0
_0805F05C: .4byte gEfxBgSemaphore
_0805F060: .4byte gUnknown_085D5908
_0805F064: .4byte gUnknown_080DD094
_0805F068: .4byte gUnknown_085D5920
_0805F06C: .4byte gUnknown_085D59C4
_0805F070: .4byte gUnknown_0862A2D0
_0805F074: .4byte gEkrDistanceType
_0805F078:
	movs r0, #1
	movs r1, #0x18
	movs r2, #0
	bl BG_SetPosition
_0805F082:
	ldr r0, [r5, #0x5c]
	bl GetAISSubjectId
	cmp r0, #0
	bne _0805F098
	ldr r1, _0805F094  @ gLCDControlBuffer
	ldrh r0, [r1, #0x20]
	adds r0, #4
	b _0805F09E
	.align 2, 0
_0805F094: .4byte gLCDControlBuffer
_0805F098:
	ldr r1, _0805F0AC  @ gLCDControlBuffer
	ldrh r0, [r1, #0x20]
	subs r0, #4
_0805F09E:
	strh r0, [r1, #0x20]
	ldrh r0, [r1, #0x22]
	adds r0, #8
	strh r0, [r1, #0x22]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805F0AC: .4byte gLCDControlBuffer

	THUMB_FUNC_END sub_805F004

	THUMB_FUNC_START sub_805F0B0
sub_805F0B0: @ 0x0805F0B0
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r1, _0805F114  @ gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805F118  @ gUnknown_085D5908
	movs r1, #3
	bl Proc_Start
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	str r0, [r5, #0x44]
	ldr r0, _0805F11C  @ gUnknown_080DD0C6
	str r0, [r5, #0x48]
	ldr r0, _0805F120  @ gUnknown_085D5920
	str r0, [r5, #0x4c]
	str r0, [r5, #0x50]
	ldr r0, _0805F124  @ gUnknown_085D59C4
	str r0, [r5, #0x54]
	ldr r0, _0805F128  @ gUnknown_0862A2F0
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	bl SpellFx_SetSomeColorEffect
	movs r0, #1
	movs r1, #0xa
	movs r2, #7
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	ldr r0, _0805F12C  @ gEkrDistanceType
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _0805F13A
	ldr r0, [r5, #0x5c]
	bl GetAISSubjectId
	cmp r0, #0
	bne _0805F130
	movs r0, #1
	movs r1, #0xe8
	movs r2, #0
	bl BG_SetPosition
	b _0805F13A
	.align 2, 0
_0805F114: .4byte gEfxBgSemaphore
_0805F118: .4byte gUnknown_085D5908
_0805F11C: .4byte gUnknown_080DD0C6
_0805F120: .4byte gUnknown_085D5920
_0805F124: .4byte gUnknown_085D59C4
_0805F128: .4byte gUnknown_0862A2F0
_0805F12C: .4byte gEkrDistanceType
_0805F130:
	movs r0, #1
	movs r1, #0x18
	movs r2, #0
	bl BG_SetPosition
_0805F13A:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_805F0B0

	THUMB_FUNC_START sub_805F140
sub_805F140: @ 0x0805F140
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r0, #0x2c
	adds r1, r7, #0
	adds r1, #0x44
	ldr r2, [r7, #0x48]
	bl SpellFx_InterpretBgAnimScript
	lsls r0, r0, #0x10
	asrs r4, r0, #0x10
	cmp r4, #0
	blt _0805F17C
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
	b _0805F19A
_0805F17C:
	movs r0, #1
	negs r0, r0
	cmp r4, r0
	bne _0805F19A
	bl SpellFx_ClearBG1
	ldr r1, _0805F1A0  @ gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SetDefaultColorEffects_
	adds r0, r7, #0
	bl Proc_End
_0805F19A:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805F1A0: .4byte gEfxBgSemaphore

	THUMB_FUNC_END sub_805F140

	THUMB_FUNC_START sub_805F1A4
sub_805F1A4: @ 0x0805F1A4
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r1, _0805F1DC  @ gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805F1E0  @ ProcScr_efxMistyrainOBJ
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	adds r0, r5, #0
	bl GetCoreAIStruct
	ldr r3, _0805F1E4  @ FramScr_Unk5D4F90
	ldr r0, [r4, #0x5c]
	str r3, [sp]
	adds r1, r3, #0
	adds r2, r3, #0
	bl EfxAnimCreate1
	str r0, [r4, #0x60]
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805F1DC: .4byte gEfxBgSemaphore
_0805F1E0: .4byte ProcScr_efxMistyrainOBJ
_0805F1E4: .4byte FramScr_Unk5D4F90

	THUMB_FUNC_END sub_805F1A4

	THUMB_FUNC_START sub_805F1E8
sub_805F1E8: @ 0x0805F1E8
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r1, _0805F228  @ gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805F22C  @ gUnknown_085D5AB0
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	adds r0, r5, #0
	bl GetCoreAIStruct
	ldr r3, _0805F230  @ FramScr_Unk5D4F90
	ldr r0, [r4, #0x5c]
	str r3, [sp]
	adds r1, r3, #0
	adds r2, r3, #0
	bl EfxAnimCreate1
	str r0, [r4, #0x60]
	ldrh r1, [r0, #4]
	subs r1, #4
	strh r1, [r0, #4]
	adds r0, r4, #0
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0805F228: .4byte gEfxBgSemaphore
_0805F22C: .4byte gUnknown_085D5AB0
_0805F230: .4byte FramScr_Unk5D4F90

	THUMB_FUNC_END sub_805F1E8

	THUMB_FUNC_START sub_805F234
sub_805F234: @ 0x0805F234
	push {lr}
	ldr r2, _0805F248  @ gEfxBgSemaphore
	ldr r1, [r2]
	subs r1, #1
	str r1, [r2]
	ldr r0, [r0, #0x60]
	bl AnimDelete
	pop {r0}
	bx r0
	.align 2, 0
_0805F248: .4byte gEfxBgSemaphore

	THUMB_FUNC_END sub_805F234

	THUMB_FUNC_START sub_805F24C
sub_805F24C: @ 0x0805F24C
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x60]
	ldr r0, _0805F27C  @ gUnknown_0862D6A8
	str r0, [r1, #0x24]
	str r0, [r1, #0x20]
	movs r0, #0
	strh r0, [r1, #6]
	ldr r0, _0805F280  @ gUnknown_0862D424
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _0805F284  @ gUnknown_0862C82C
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805F27C: .4byte gUnknown_0862D6A8
_0805F280: .4byte gUnknown_0862D424
_0805F284: .4byte gUnknown_0862C82C

	THUMB_FUNC_END sub_805F24C

	THUMB_FUNC_START sub_805F288
sub_805F288: @ 0x0805F288
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x60]
	ldr r0, _0805F2B8  @ gUnknown_0862D82C
	str r0, [r1, #0x24]
	str r0, [r1, #0x20]
	movs r0, #0
	strh r0, [r1, #6]
	ldr r0, _0805F2BC  @ gUnknown_0862D424
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _0805F2C0  @ gUnknown_0862CC2C
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805F2B8: .4byte gUnknown_0862D82C
_0805F2BC: .4byte gUnknown_0862D424
_0805F2C0: .4byte gUnknown_0862CC2C

	THUMB_FUNC_END sub_805F288

	THUMB_FUNC_START sub_805F2C4
sub_805F2C4: @ 0x0805F2C4
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x60]
	ldr r0, _0805F2F4  @ gUnknown_0862DCE0
	str r0, [r1, #0x24]
	str r0, [r1, #0x20]
	movs r0, #0
	strh r0, [r1, #6]
	ldr r0, _0805F2F8  @ gUnknown_0862D424
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _0805F2FC  @ gUnknown_0862D06C
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805F2F4: .4byte gUnknown_0862DCE0
_0805F2F8: .4byte gUnknown_0862D424
_0805F2FC: .4byte gUnknown_0862D06C

	THUMB_FUNC_END sub_805F2C4

	THUMB_FUNC_START sub_805F300
sub_805F300: @ 0x0805F300
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x60]
	ldr r0, _0805F328  @ gUnknown_0862DC24
	str r0, [r1, #0x24]
	str r0, [r1, #0x20]
	movs r0, #0
	strh r0, [r1, #6]
	movs r0, #0x14
	strh r0, [r1, #0xa]
	bl AnimSort
	movs r0, #0x27
	strh r0, [r4, #0x2c]
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805F328: .4byte gUnknown_0862DC24

	THUMB_FUNC_END sub_805F300

	THUMB_FUNC_START sub_805F32C
sub_805F32C: @ 0x0805F32C
	push {lr}
	adds r1, r0, #0
	ldr r2, [r1, #0x60]
	ldrh r0, [r1, #0x2c]
	adds r0, #1
	movs r3, #0
	strh r0, [r1, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x28
	bne _0805F34C
	ldr r0, _0805F350  @ gUnknown_0862DC58
	str r0, [r2, #0x24]
	str r0, [r2, #0x20]
	strh r3, [r2, #6]
	strh r3, [r1, #0x2c]
_0805F34C:
	pop {r0}
	bx r0
	.align 2, 0
_0805F350: .4byte gUnknown_0862DC58

	THUMB_FUNC_END sub_805F32C

	THUMB_FUNC_START StartSpellAnimNosferatu
StartSpellAnimNosferatu: @ 0x0805F354
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl NewEfxSpellCast
	bl SpellFx_SpellFx_ClearBG1Position
	ldr r0, _0805F38C  @ ProcScr_efxResire
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
_0805F38C: .4byte ProcScr_efxResire

	THUMB_FUNC_END StartSpellAnimNosferatu

	THUMB_FUNC_START Loop6C_efxResire
Loop6C_efxResire: @ 0x0805F390
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetCoreAIStruct
	adds r5, r0, #0
	bl GetAnimationStartFrameMaybe
	adds r6, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	movs r7, #0
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _0805F3BE
	ldr r0, [r4, #0x5c]
	movs r1, #1
	negs r1, r1
	bl NewEfxFarAttackWithDistance
_0805F3BE:
	movs r0, #0x2c
	ldrsh r1, [r4, r0]
	adds r0, r6, #1
	cmp r1, r0
	bne _0805F402
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
	movs r2, #0xa
	movs r3, #0
	bl NewEfxALPHA
	str r7, [sp]
	str r7, [sp, #4]
	adds r0, r5, #0
	movs r1, #0x23
	movs r2, #0x14
	movs r3, #0x10
	bl NewEfxALPHA
	adds r0, r5, #0
	bl sub_805F53C
	movs r0, #0x92
	lsls r0, r0, #1
	b _0805F452
_0805F402:
	adds r0, r6, #0
	adds r0, #0xf
	cmp r1, r0
	bne _0805F43C
	movs r0, #2
	str r0, [sp]
	adds r0, r5, #0
	movs r1, #0x2a
	movs r2, #0xf
	movs r3, #0
	bl NewefxRestRST
	adds r1, r0, #0
	adds r0, r5, #0
	movs r2, #0x1e
	bl sub_805F838
	ldr r0, _0805F438  @ gLCDControlBuffer
	movs r1, #0x20
	ldrsh r2, [r0, r1]
	adds r0, r5, #0
	movs r1, #0x2b
	movs r3, #0
	bl NewEfxRestWINH
	b _0805F4A8
	.align 2, 0
_0805F438: .4byte gLCDControlBuffer
_0805F43C:
	adds r0, r6, #0
	adds r0, #0x3c
	cmp r1, r0
	bne _0805F468
	adds r0, r4, #0
	adds r0, #0x29
	ldrb r1, [r0]
	adds r0, r5, #0
	bl sub_805F4B0
	ldr r0, _0805F464  @ 0x00000125
_0805F452:
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r5, r3]
	movs r3, #1
	bl EkrSoundSomeBark
	b _0805F4A8
	.align 2, 0
_0805F464: .4byte 0x00000125
_0805F468:
	adds r0, r6, #0
	adds r0, #0x41
	cmp r1, r0
	bne _0805F490
	ldrh r0, [r5, #0x10]
	movs r1, #9
	orrs r0, r1
	strh r0, [r5, #0x10]
	adds r4, #0x29
	ldrb r1, [r4]
	adds r0, r5, #0
	bl StartBattleAnimResireHitEffects
	ldrb r0, [r4]
	cmp r0, #0
	bne _0805F4A8
	adds r0, r5, #0
	bl sub_8072450
	b _0805F4A8
_0805F490:
	adds r0, r6, #0
	adds r0, #0x6e
	cmp r1, r0
	beq _0805F4A8
	adds r0, #0x14
	cmp r1, r0
	bne _0805F4A8
	bl SpellFx_Finish
	adds r0, r4, #0
	bl Proc_Break
_0805F4A8:
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END Loop6C_efxResire

	THUMB_FUNC_START sub_805F4B0
sub_805F4B0: @ 0x0805F4B0
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, _0805F510  @ gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805F514  @ ProcScr_efxResireBG
	movs r1, #3
	bl Proc_Start
	adds r6, r0, #0
	str r4, [r6, #0x5c]
	adds r1, r6, #0
	adds r1, #0x29
	movs r0, #0
	strb r5, [r1]
	strh r0, [r6, #0x2c]
	str r0, [r6, #0x44]
	ldr r0, _0805F518  @ gUnknown_080DD186
	str r0, [r6, #0x48]
	ldr r0, _0805F51C  @ gUnknown_085D5C0C
	str r0, [r6, #0x4c]
	str r0, [r6, #0x50]
	ldr r0, _0805F520  @ gUnknown_085D5B40
	str r0, [r6, #0x54]
	ldr r0, _0805F524  @ gUnknown_08636640
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	bl SpellFx_SetSomeColorEffect
	ldr r0, _0805F528  @ gEkrDistanceType
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _0805F536
	ldr r0, [r6, #0x5c]
	bl GetAISSubjectId
	cmp r0, #0
	bne _0805F52C
	movs r0, #1
	movs r1, #0x18
	movs r2, #0
	bl BG_SetPosition
	b _0805F536
	.align 2, 0
_0805F510: .4byte gEfxBgSemaphore
_0805F514: .4byte ProcScr_efxResireBG
_0805F518: .4byte gUnknown_080DD186
_0805F51C: .4byte gUnknown_085D5C0C
_0805F520: .4byte gUnknown_085D5B40
_0805F524: .4byte gUnknown_08636640
_0805F528: .4byte gEkrDistanceType
_0805F52C:
	movs r0, #1
	movs r1, #0xe8
	movs r2, #0
	bl BG_SetPosition
_0805F536:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_805F4B0

	THUMB_FUNC_START sub_805F53C
sub_805F53C: @ 0x0805F53C
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r1, _0805F5AC  @ gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805F5B0  @ ProcScr_efxResireBG2
	movs r1, #3
	bl Proc_Start
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	str r0, [r5, #0x44]
	ldr r0, _0805F5B4  @ gUnknown_080DD252
	str r0, [r5, #0x48]
	ldr r0, _0805F5B8  @ gUnknown_085D5C0C
	str r0, [r5, #0x4c]
	str r0, [r5, #0x50]
	ldr r0, _0805F5BC  @ gUnknown_085D5B40
	str r0, [r5, #0x54]
	ldr r0, _0805F5C0  @ gUnknown_08636640
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	bl SpellFx_SetSomeColorEffect
	ldr r2, _0805F5C4  @ gLCDControlBuffer
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
	ldr r0, _0805F5C8  @ gEkrDistanceType
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _0805F5D6
	ldr r0, [r5, #0x5c]
	bl GetAISSubjectId
	cmp r0, #0
	bne _0805F5CC
	movs r0, #1
	movs r1, #0x18
	movs r2, #0
	bl BG_SetPosition
	b _0805F5D6
	.align 2, 0
_0805F5AC: .4byte gEfxBgSemaphore
_0805F5B0: .4byte ProcScr_efxResireBG2
_0805F5B4: .4byte gUnknown_080DD252
_0805F5B8: .4byte gUnknown_085D5C0C
_0805F5BC: .4byte gUnknown_085D5B40
_0805F5C0: .4byte gUnknown_08636640
_0805F5C4: .4byte gLCDControlBuffer
_0805F5C8: .4byte gEkrDistanceType
_0805F5CC:
	movs r0, #1
	movs r1, #0xe8
	movs r2, #0
	bl BG_SetPosition
_0805F5D6:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_805F53C

	THUMB_FUNC_START sub_805F5DC
sub_805F5DC: @ 0x0805F5DC
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r0, #0x2c
	adds r1, r7, #0
	adds r1, #0x44
	ldr r2, [r7, #0x48]
	bl SpellFx_InterpretBgAnimScript
	lsls r0, r0, #0x10
	asrs r4, r0, #0x10
	cmp r4, #0
	blt _0805F618
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
	b _0805F65A
_0805F618:
	movs r0, #1
	negs r0, r0
	cmp r4, r0
	bne _0805F65A
	bl SpellFx_ClearBG1
	adds r0, r7, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #1
	bne _0805F64C
	ldr r1, _0805F648  @ gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SetDefaultColorEffects_
	bl EfxSpellCastSet29
	adds r0, r7, #0
	bl Proc_End
	b _0805F65A
	.align 2, 0
_0805F648: .4byte gEfxBgSemaphore
_0805F64C:
	movs r0, #0
	strh r0, [r7, #0x2c]
	movs r0, #1
	strh r0, [r7, #0x2e]
	adds r0, r7, #0
	bl Proc_Break
_0805F65A:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_805F5DC

	THUMB_FUNC_START sub_805F660
sub_805F660: @ 0x0805F660
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r5, _0805F684  @ gUnknown_02017750
	ldr r0, [r5]
	cmp r0, #2
	bne _0805F68C
	ldr r1, _0805F688  @ gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SetDefaultColorEffects_
	bl EfxSpellCastSet29
	adds r0, r4, #0
	bl Proc_End
	b _0805F6E6
	.align 2, 0
_0805F684: .4byte gUnknown_02017750
_0805F688: .4byte gEfxBgSemaphore
_0805F68C:
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	movs r3, #0
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #0x2e
	ldrsh r2, [r4, r1]
	ldrh r1, [r4, #0x2e]
	cmp r0, r2
	ble _0805F6A4
	strh r1, [r4, #0x2c]
_0805F6A4:
	movs r1, #0x2c
	ldrsh r0, [r4, r1]
	cmp r0, r2
	bne _0805F6E6
	ldr r0, [r5]
	cmp r0, #1
	bne _0805F6E6
	strh r3, [r4, #0x2c]
	strh r3, [r4, #0x2e]
	str r3, [r4, #0x44]
	ldr r0, _0805F6EC  @ gUnknown_080DD1F4
	str r0, [r4, #0x48]
	ldr r0, _0805F6F0  @ gUnknown_085D5C0C
	str r0, [r4, #0x4c]
	str r0, [r4, #0x50]
	ldr r0, _0805F6F4  @ gUnknown_085D5B40
	str r0, [r4, #0x54]
	ldr r0, _0805F6F8  @ gEkrDistanceType
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _0805F6E0
	bl GetAnimationStartFrameMaybe
	strh r0, [r4, #0x2e]
	ldr r0, [r4, #0x5c]
	movs r1, #1
	negs r1, r1
	bl NewEfxFarAttackWithDistance
_0805F6E0:
	adds r0, r4, #0
	bl Proc_Break
_0805F6E6:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805F6EC: .4byte gUnknown_080DD1F4
_0805F6F0: .4byte gUnknown_085D5C0C
_0805F6F4: .4byte gUnknown_085D5B40
_0805F6F8: .4byte gEkrDistanceType

	THUMB_FUNC_END sub_805F660

	THUMB_FUNC_START sub_805F6FC
sub_805F6FC: @ 0x0805F6FC
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetCoreAIStruct
	adds r5, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x2e
	ldrsh r1, [r4, r2]
	cmp r0, r1
	ble _0805F766
	ldr r0, _0805F73C  @ gEkrDistanceType
	movs r3, #0
	ldrsh r0, [r0, r3]
	cmp r0, #0
	beq _0805F74A
	ldr r0, [r4, #0x5c]
	bl GetAISSubjectId
	cmp r0, #0
	bne _0805F740
	movs r0, #1
	movs r1, #0xe8
	movs r2, #0
	bl BG_SetPosition
	b _0805F74A
	.align 2, 0
_0805F73C: .4byte gEkrDistanceType
_0805F740:
	movs r0, #1
	movs r1, #0x18
	movs r2, #0
	bl BG_SetPosition
_0805F74A:
	movs r0, #0
	strh r0, [r4, #0x2c]
	movs r0, #0x93
	lsls r0, r0, #1
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r5, r3]
	movs r3, #1
	bl EkrSoundSomeBark
	adds r0, r4, #0
	bl Proc_Break
_0805F766:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_805F6FC

	THUMB_FUNC_START sub_805F76C
sub_805F76C: @ 0x0805F76C
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r0, #0x2c
	adds r1, r7, #0
	adds r1, #0x44
	ldr r2, [r7, #0x48]
	bl SpellFx_InterpretBgAnimScript
	lsls r0, r0, #0x10
	asrs r4, r0, #0x10
	cmp r4, #0
	blt _0805F7A8
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
	b _0805F7CA
_0805F7A8:
	movs r0, #1
	negs r0, r0
	cmp r4, r0
	bne _0805F7CA
	bl SpellFx_ClearBG1
	ldr r1, _0805F7D0  @ gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SetDefaultColorEffects_
	bl EfxSpellCastSet29
	adds r0, r7, #0
	bl Proc_Break
_0805F7CA:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805F7D0: .4byte gEfxBgSemaphore

	THUMB_FUNC_END sub_805F76C

	THUMB_FUNC_START sub_805F7D4
sub_805F7D4: @ 0x0805F7D4
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r0, #0x2c
	adds r1, r7, #0
	adds r1, #0x44
	ldr r2, [r7, #0x48]
	bl SpellFx_InterpretBgAnimScript
	lsls r0, r0, #0x10
	asrs r4, r0, #0x10
	cmp r4, #0
	blt _0805F810
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
	b _0805F82E
_0805F810:
	movs r0, #1
	negs r0, r0
	cmp r4, r0
	bne _0805F82E
	bl SpellFx_ClearBG1
	ldr r1, _0805F834  @ gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SetDefaultColorEffects_
	adds r0, r7, #0
	bl Proc_Break
_0805F82E:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805F834: .4byte gEfxBgSemaphore

	THUMB_FUNC_END sub_805F7D4

	THUMB_FUNC_START sub_805F838
sub_805F838: @ 0x0805F838
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r6, r1, #0
	adds r5, r2, #0
	ldr r1, _0805F860  @ gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805F864  @ gUnknown_085D5CD8
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r5, [r0, #0x2e]
	str r6, [r0, #0x64]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0805F860: .4byte gEfxBgSemaphore
_0805F864: .4byte gUnknown_085D5CD8

	THUMB_FUNC_END sub_805F838

	THUMB_FUNC_START sub_805F868
sub_805F868: @ 0x0805F868
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r4, [r5, #0x64]
	movs r0, #0x2c
	ldrsh r3, [r5, r0]
	movs r1, #0x2e
	ldrsh r0, [r5, r1]
	str r0, [sp]
	movs r0, #4
	movs r1, #0
	movs r2, #0x80
	bl Interpolate
	str r0, [r4, #0x4c]
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x2e
	ldrsh r1, [r5, r2]
	cmp r0, r1
	ble _0805F8A6
	ldr r1, _0805F8B0  @ gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r5, #0
	bl Proc_Break
_0805F8A6:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805F8B0: .4byte gEfxBgSemaphore

	THUMB_FUNC_END sub_805F868

	THUMB_FUNC_START sub_805F8B4
sub_805F8B4: @ 0x0805F8B4
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl NewEfxSpellCast
	bl SpellFx_SpellFx_ClearBG1Position
	ldr r0, _0805F8EC  @ gUnknown_085D5CF0
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
_0805F8EC: .4byte gUnknown_085D5CF0

	THUMB_FUNC_END sub_805F8B4

	THUMB_FUNC_START sub_805F8F0
sub_805F8F0: @ 0x0805F8F0
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetCoreAIStruct
	adds r5, r0, #0
	bl GetAnimationStartFrameMaybe
	adds r6, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _0805F91A
	ldr r0, [r4, #0x5c]
	movs r1, #1
	negs r1, r1
	bl NewEfxFarAttackWithDistance
_0805F91A:
	movs r0, #0x2c
	ldrsh r1, [r4, r0]
	adds r0, r6, #1
	cmp r1, r0
	bne _0805F93E
	movs r0, #0x90
	lsls r0, r0, #1
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r5, r3]
	movs r3, #1
	bl EkrSoundSomeBark
	adds r0, r5, #0
	bl sub_805F9A8
	b _0805F9A0
_0805F93E:
	adds r0, r6, #0
	adds r0, #0x1a
	cmp r1, r0
	bne _0805F984
	ldr r0, _0805F980  @ 0x00000121
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r5, r3]
	movs r3, #1
	bl EkrSoundSomeBark
	ldr r0, [r4, #0x5c]
	movs r1, #4
	bl StartSpellBG_FLASH
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
	bne _0805F9A0
	adds r0, r5, #0
	bl sub_8072450
	b _0805F9A0
	.align 2, 0
_0805F980: .4byte 0x00000121
_0805F984:
	adds r0, r6, #0
	adds r0, #0x2f
	cmp r1, r0
	beq _0805F9A0
	adds r0, #1
	cmp r1, r0
	bne _0805F9A0
	bl SpellFx_Finish
	bl EfxSpellCastSet29
	adds r0, r4, #0
	bl Proc_Break
_0805F9A0:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_805F8F0

	THUMB_FUNC_START sub_805F9A8
sub_805F9A8: @ 0x0805F9A8
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r1, _0805F9FC  @ gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805FA00  @ gUnknown_085D5D08
	movs r1, #3
	bl Proc_Start
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	str r0, [r5, #0x44]
	ldr r0, _0805FA04  @ gUnknown_080DD288
	str r0, [r5, #0x48]
	ldr r0, _0805FA08  @ gUnknown_085D5E28
	str r0, [r5, #0x4c]
	str r0, [r5, #0x50]
	ldr r0, _0805FA0C  @ gUnknown_085D5D20
	str r0, [r5, #0x54]
	ldr r0, _0805FA10  @ gUnknown_085D5DA4
	str r0, [r5, #0x58]
	bl SpellFx_SetSomeColorEffect
	ldr r0, _0805FA14  @ gEkrDistanceType
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _0805FA22
	ldr r0, [r5, #0x5c]
	bl GetAISSubjectId
	cmp r0, #0
	bne _0805FA18
	movs r0, #1
	movs r1, #0x18
	movs r2, #0
	bl BG_SetPosition
	b _0805FA22
	.align 2, 0
_0805F9FC: .4byte gEfxBgSemaphore
_0805FA00: .4byte gUnknown_085D5D08
_0805FA04: .4byte gUnknown_080DD288
_0805FA08: .4byte gUnknown_085D5E28
_0805FA0C: .4byte gUnknown_085D5D20
_0805FA10: .4byte gUnknown_085D5DA4
_0805FA14: .4byte gEkrDistanceType
_0805FA18:
	movs r0, #1
	movs r1, #0xe8
	movs r2, #0
	bl BG_SetPosition
_0805FA22:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_805F9A8

	THUMB_FUNC_START sub_805FA28
sub_805FA28: @ 0x0805FA28
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r7, r0, #0
	adds r0, #0x2c
	adds r1, r7, #0
	adds r1, #0x44
	ldr r2, [r7, #0x48]
	bl SpellFx_InterpretBgAnimScript
	lsls r0, r0, #0x10
	asrs r5, r0, #0x10
	cmp r5, #0
	blt _0805FAB0
	ldr r6, [r7, #0x4c]
	ldr r0, [r7, #0x50]
	mov r8, r0
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
	adds r6, r5, r6
	ldr r1, [r6]
	add r5, r8
	ldr r2, [r5]
	bl SpellFx_WriteBgMap
	ldr r0, _0805FA90  @ gEkrDistanceType
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _0805FACE
	ldr r0, [r7, #0x5c]
	bl GetAISSubjectId
	adds r1, r0, #0
	cmp r1, #0
	bne _0805FA98
	ldr r0, _0805FA94  @ gBG1TilemapBuffer
	b _0805FA9C
	.align 2, 0
_0805FA90: .4byte gEkrDistanceType
_0805FA94: .4byte gBG1TilemapBuffer
_0805FA98:
	ldr r0, _0805FAAC  @ gUnknown_020234E2
	movs r1, #0
_0805FA9C:
	str r1, [sp]
	movs r1, #3
	movs r2, #0x14
	movs r3, #0
	bl FillBGRect
	b _0805FACE
	.align 2, 0
_0805FAAC: .4byte gUnknown_020234E2
_0805FAB0:
	movs r0, #1
	negs r0, r0
	cmp r5, r0
	bne _0805FACE
	bl SpellFx_ClearBG1
	ldr r1, _0805FADC  @ gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SetDefaultColorEffects_
	adds r0, r7, #0
	bl Proc_End
_0805FACE:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805FADC: .4byte gEfxBgSemaphore

	THUMB_FUNC_END sub_805FA28

	THUMB_FUNC_START StartSpellAnimPurge
StartSpellAnimPurge: @ 0x0805FAE0
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl NewEfxSpellCast
	bl SpellFx_SpellFx_ClearBG1Position
	ldr r0, _0805FB1C  @ gUnknown_085D5EAC
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r6, #0
	strh r6, [r4, #0x2c]
	adds r0, r5, #0
	bl GetSomeAISRelatedIndexMaybe
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl EkrCheckHitOrMiss
	adds r4, #0x29
	strb r0, [r4]
	ldr r0, _0805FB20  @ gUnknown_02020044
	str r6, [r0]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0805FB1C: .4byte gUnknown_085D5EAC
_0805FB20: .4byte gUnknown_02020044

	THUMB_FUNC_END StartSpellAnimPurge

	THUMB_FUNC_START sub_805FB24
sub_805FB24: @ 0x0805FB24
	push {lr}
	adds r2, r0, #0
	adds r3, r1, #0
	ldr r0, _0805FB40  @ gUnknown_02020044
	ldr r0, [r0]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0805FB44
	adds r1, #0xff
	movs r0, #0xfe
	bl EkrSoundSomeBark
	b _0805FB4E
	.align 2, 0
_0805FB40: .4byte gUnknown_02020044
_0805FB44:
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #0xff
	bl EkrSoundSomeBark
_0805FB4E:
	ldr r1, _0805FB5C  @ gUnknown_02020044
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_0805FB5C: .4byte gUnknown_02020044

	THUMB_FUNC_END sub_805FB24

	THUMB_FUNC_START sub_805FB60
sub_805FB60: @ 0x0805FB60
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r6, r0, #0
	ldr r0, [r6, #0x5c]
	bl GetCoreAIStruct
	adds r5, r0, #0
	bl GetAnimationStartFrameMaybe
	adds r4, r0, #0
	ldrh r0, [r6, #0x2c]
	adds r0, #1
	movs r7, #0
	strh r0, [r6, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _0805FB8E
	ldr r0, [r6, #0x5c]
	movs r1, #1
	negs r1, r1
	bl NewEfxFarAttackWithDistance
_0805FB8E:
	movs r0, #0x2c
	ldrsh r1, [r6, r0]
	adds r0, r4, #1
	cmp r1, r0
	bne _0805FBB0
	adds r0, r5, #0
	movs r1, #4
	bl StartSpellBG_FLASH
	adds r0, r5, #0
	bl sub_805FC90
	adds r0, r5, #0
	bl sub_805FD5C
	movs r0, #0x30
	b _0805FBD6
_0805FBB0:
	adds r0, r4, #0
	adds r0, #0x15
	cmp r1, r0
	bne _0805FBC4
	adds r0, r5, #0
	movs r1, #4
	bl StartSpellBG_FLASH
	movs r0, #0xa0
	b _0805FBD6
_0805FBC4:
	adds r0, r4, #0
	adds r0, #0x29
	cmp r1, r0
	bne _0805FBDE
	adds r0, r5, #0
	movs r1, #4
	bl StartSpellBG_FLASH
	movs r0, #0x70
_0805FBD6:
	movs r1, #0
	bl sub_805FB24
	b _0805FC88
_0805FBDE:
	adds r0, r4, #0
	adds r0, #0x3d
	cmp r1, r0
	bne _0805FC12
	adds r0, r5, #0
	movs r1, #4
	bl StartSpellBG_FLASH
	movs r0, #0x10
	str r0, [sp]
	str r7, [sp, #4]
	adds r0, r5, #0
	movs r1, #3
	movs r2, #0xa
	movs r3, #0
	bl NewEfxALPHA
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r5, r3]
	adds r0, r1, #0
	movs r3, #1
	bl EkrSoundSomeBark
	b _0805FC88
_0805FC12:
	adds r0, r4, #0
	adds r0, #0x5e
	cmp r1, r0
	bne _0805FC58
	adds r0, r5, #0
	movs r1, #4
	bl StartSpellBG_FLASH
	ldrh r0, [r5, #0x10]
	movs r1, #9
	orrs r0, r1
	strh r0, [r5, #0x10]
	adds r4, r6, #0
	adds r4, #0x29
	ldrb r1, [r4]
	adds r0, r5, #0
	bl StartBattleAnimHitEffectsDefault
	ldr r0, _0805FC54  @ 0x00000101
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r5, r3]
	movs r3, #1
	bl EkrSoundSomeBark
	ldrb r0, [r4]
	cmp r0, #0
	bne _0805FC88
	adds r0, r5, #0
	bl sub_8072450
	b _0805FC88
	.align 2, 0
_0805FC54: .4byte 0x00000101
_0805FC58:
	adds r0, r4, #0
	adds r0, #0x69
	cmp r1, r0
	bne _0805FC72
	str r7, [sp]
	str r7, [sp, #4]
	adds r0, r5, #0
	movs r1, #0
	movs r2, #0x14
	movs r3, #8
	bl NewEfxALPHA
	b _0805FC88
_0805FC72:
	adds r0, r4, #0
	adds r0, #0x71
	cmp r1, r0
	bne _0805FC88
	bl SpellFx_Finish
	bl EfxSpellCastSet29
	adds r0, r6, #0
	bl Proc_Break
_0805FC88:
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_805FB60

	THUMB_FUNC_START sub_805FC90
sub_805FC90: @ 0x0805FC90
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _0805FCC8  @ gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805FCCC  @ gUnknown_085D5EC4
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r1, [r0, #0x44]
	ldr r1, _0805FCD0  @ gUnknown_080DD328
	str r1, [r0, #0x48]
	ldr r1, _0805FCD4  @ gUnknown_085D614C
	str r1, [r0, #0x4c]
	str r1, [r0, #0x50]
	ldr r1, _0805FCD8  @ gUnknown_085D5EDC
	str r1, [r0, #0x54]
	ldr r1, _0805FCDC  @ gUnknown_085D6014
	str r1, [r0, #0x58]
	bl SpellFx_SetSomeColorEffect
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805FCC8: .4byte gEfxBgSemaphore
_0805FCCC: .4byte gUnknown_085D5EC4
_0805FCD0: .4byte gUnknown_080DD328
_0805FCD4: .4byte gUnknown_085D614C
_0805FCD8: .4byte gUnknown_085D5EDC
_0805FCDC: .4byte gUnknown_085D6014

	THUMB_FUNC_END sub_805FC90

	THUMB_FUNC_START sub_805FCE0
sub_805FCE0: @ 0x0805FCE0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r7, r0, #0
	adds r0, #0x2c
	adds r1, r7, #0
	adds r1, #0x44
	ldr r2, [r7, #0x48]
	bl SpellFx_InterpretBgAnimScript
	lsls r0, r0, #0x10
	asrs r5, r0, #0x10
	cmp r5, #0
	blt _0805FD2E
	ldr r6, [r7, #0x4c]
	ldr r0, [r7, #0x50]
	mov r8, r0
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
	adds r6, r5, r6
	ldr r1, [r6]
	add r5, r8
	ldr r2, [r5]
	bl SpellFx_WriteBgMap
	b _0805FD4C
_0805FD2E:
	movs r0, #1
	negs r0, r0
	cmp r5, r0
	bne _0805FD4C
	bl SpellFx_ClearBG1
	ldr r1, _0805FD58  @ gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SetDefaultColorEffects_
	adds r0, r7, #0
	bl Proc_End
_0805FD4C:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805FD58: .4byte gEfxBgSemaphore

	THUMB_FUNC_END sub_805FCE0

	THUMB_FUNC_START sub_805FD5C
sub_805FD5C: @ 0x0805FD5C
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _0805FD88  @ gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805FD8C  @ gUnknown_085D6284
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r2, #0
	strh r2, [r0, #0x2c]
	movs r1, #7
	str r1, [r0, #0x44]
	strh r2, [r0, #0x2e]
	movs r1, #6
	str r1, [r0, #0x48]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805FD88: .4byte gEfxBgSemaphore
_0805FD8C: .4byte gUnknown_085D6284

	THUMB_FUNC_END sub_805FD5C

	THUMB_FUNC_START sub_805FD90
sub_805FD90: @ 0x0805FD90
	push {r4, r5, lr}
	adds r5, r0, #0
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r1, [r5, #0x44]
	cmp r0, r1
	ble _0805FDEC
	movs r0, #0
	strh r0, [r5, #0x2c]
	ldr r2, _0805FDF4  @ gUnknown_085D62A4
	movs r1, #0x2e
	ldrsh r0, [r5, r1]
	lsls r1, r0, #3
	adds r1, r1, r2
	ldr r4, [r1]
	lsls r0, r0, #1
	adds r0, #1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r2, [r0]
	ldr r0, [r5, #0x60]
	adds r1, r4, #0
	bl sub_805FDFC
	adds r0, r4, #0
	movs r1, #1
	bl sub_805FB24
	ldrh r0, [r5, #0x2e]
	adds r0, #1
	strh r0, [r5, #0x2e]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r1, [r5, #0x48]
	cmp r0, r1
	ble _0805FDEC
	ldr r1, _0805FDF8  @ gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r5, #0
	bl Proc_Break
_0805FDEC:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805FDF4: .4byte gUnknown_085D62A4
_0805FDF8: .4byte gEfxBgSemaphore

	THUMB_FUNC_END sub_805FD90

	THUMB_FUNC_START sub_805FDFC
sub_805FDFC: @ 0x0805FDFC
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #4
	adds r5, r0, #0
	adds r6, r1, #0
	mov r8, r2
	ldr r1, _0805FE54  @ gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805FE58  @ gUnknown_085D62DC
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	ldr r3, _0805FE5C  @ gUnknown_0866F58C
	str r3, [sp]
	adds r0, r5, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl EfxAnimCreate1
	str r0, [r4, #0x60]
	strh r6, [r0, #2]
	mov r1, r8
	strh r1, [r0, #4]
	ldr r0, _0805FE60  @ gUnknown_0866F2B4
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _0805FE64  @ gUnknown_0866EFF0
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0805FE54: .4byte gEfxBgSemaphore
_0805FE58: .4byte gUnknown_085D62DC
_0805FE5C: .4byte gUnknown_0866F58C
_0805FE60: .4byte gUnknown_0866F2B4
_0805FE64: .4byte gUnknown_0866EFF0

	THUMB_FUNC_END sub_805FDFC

	THUMB_FUNC_START sub_805FE68
sub_805FE68: @ 0x0805FE68
	push {lr}
	ldr r0, [r0, #0x60]
	bl AnimDelete
	ldr r1, _0805FE7C  @ gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_0805FE7C: .4byte gEfxBgSemaphore

	THUMB_FUNC_END sub_805FE68

	THUMB_FUNC_START nullsub_41
nullsub_41: @ 0x0805FE80
	bx lr

	THUMB_FUNC_END nullsub_41

	THUMB_FUNC_START StartSpellAnimDivine
StartSpellAnimDivine: @ 0x0805FE84
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl NewEfxSpellCast
	bl SpellFx_SpellFx_ClearBG1Position
	ldr r0, _0805FEBC  @ gUnknown_085D62FC
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
_0805FEBC: .4byte gUnknown_085D62FC

	THUMB_FUNC_END StartSpellAnimDivine

	THUMB_FUNC_START DivineSfxLoop
DivineSfxLoop: @ 0x0805FEC0
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetCoreAIStruct
	adds r5, r0, #0
	bl GetAnimationStartFrameMaybe
	adds r3, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r2, r0, #0x10
	cmp r2, #1
	bne _0805FF04
	ldr r0, _0805FF00  @ 0x00000127
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r2, [r4, #0x5c]
	movs r3, #2
	ldrsh r2, [r2, r3]
	movs r3, #1
	bl EkrSoundSomeBark
	adds r0, r5, #0
	bl sub_805FFB0
	ldr r0, [r4, #0x5c]
	bl sub_80601E0
	b _0805FFAA
	.align 2, 0
_0805FF00: .4byte 0x00000127
_0805FF04:
	cmp r2, #0x14
	bne _0805FF18
	movs r0, #0x94
	lsls r0, r0, #1
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r2, [r4, #0x5c]
	movs r3, #2
	ldrsh r2, [r2, r3]
	b _0805FF44
_0805FF18:
	cmp r2, #0x32
	bne _0805FF28
	ldr r0, [r4, #0x5c]
	movs r1, #1
	negs r1, r1
	bl NewEfxFarAttackWithDistance
	b _0805FFAA
_0805FF28:
	movs r0, #0x2c
	ldrsh r1, [r4, r0]
	adds r0, r3, #0
	adds r0, #0x46
	cmp r1, r0
	bne _0805FF50
	adds r0, r5, #0
	bl sub_8060034
	ldr r0, _0805FF4C  @ 0x00000129
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r5, r3]
_0805FF44:
	movs r3, #1
	bl EkrSoundSomeBark
	b _0805FFAA
	.align 2, 0
_0805FF4C: .4byte 0x00000129
_0805FF50:
	adds r0, r3, #0
	adds r0, #0x49
	cmp r1, r0
	bne _0805FF62
	ldr r0, [r4, #0x5c]
	movs r1, #0xa
	bl StartSpellBG_FLASH
	b _0805FFAA
_0805FF62:
	adds r0, r3, #0
	adds r0, #0x4b
	cmp r1, r0
	bne _0805FF90
	adds r0, r5, #0
	bl sub_80600B8
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
	bne _0805FFAA
	adds r0, r5, #0
	bl sub_8072450
	b _0805FFAA
_0805FF90:
	adds r0, r3, #0
	adds r0, #0x5a
	cmp r1, r0
	beq _0805FFAA
	cmp r2, #0x64
	bne _0805FFAA
	bl SpellFx_Finish
	bl EfxSpellCastSet29
	adds r0, r4, #0
	bl Proc_Break
_0805FFAA:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END DivineSfxLoop

	THUMB_FUNC_START sub_805FFB0
sub_805FFB0: @ 0x0805FFB0
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r1, _08060004  @ gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08060008  @ gUnknown_085D6314
	movs r1, #3
	bl Proc_Start
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	str r0, [r5, #0x44]
	ldr r0, _0806000C  @ gUnknown_080DD4D4
	str r0, [r5, #0x48]
	ldr r0, _08060010  @ gUnknown_085D637C
	str r0, [r5, #0x4c]
	str r0, [r5, #0x50]
	ldr r0, _08060014  @ gUnknown_085D632C
	str r0, [r5, #0x54]
	ldr r0, _08060018  @ gUnknown_08641D84
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	ldr r0, _0806001C  @ gEkrDistanceType
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _0806002A
	ldr r0, [r5, #0x5c]
	bl GetAISSubjectId
	cmp r0, #0
	bne _08060020
	movs r0, #1
	movs r1, #0xe8
	movs r2, #0
	bl BG_SetPosition
	b _0806002A
	.align 2, 0
_08060004: .4byte gEfxBgSemaphore
_08060008: .4byte gUnknown_085D6314
_0806000C: .4byte gUnknown_080DD4D4
_08060010: .4byte gUnknown_085D637C
_08060014: .4byte gUnknown_085D632C
_08060018: .4byte gUnknown_08641D84
_0806001C: .4byte gEkrDistanceType
_08060020:
	movs r0, #1
	movs r1, #0x18
	movs r2, #0
	bl BG_SetPosition
_0806002A:
	bl SpellFx_SetSomeColorEffect
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_805FFB0

	THUMB_FUNC_START sub_8060034
sub_8060034: @ 0x08060034
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r1, _08060088  @ gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0806008C  @ gUnknown_085D6314
	movs r1, #3
	bl Proc_Start
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	str r0, [r5, #0x44]
	ldr r0, _08060090  @ gUnknown_080DD542
	str r0, [r5, #0x48]
	ldr r0, _08060094  @ gUnknown_085D63D8
	str r0, [r5, #0x4c]
	str r0, [r5, #0x50]
	ldr r0, _08060098  @ gUnknown_085D63CC
	str r0, [r5, #0x54]
	ldr r0, _0806009C  @ gUnknown_08641D84
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	ldr r0, _080600A0  @ gEkrDistanceType
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _080600AE
	ldr r0, [r5, #0x5c]
	bl GetAISSubjectId
	cmp r0, #0
	bne _080600A4
	movs r0, #1
	movs r1, #0x18
	movs r2, #0
	bl BG_SetPosition
	b _080600AE
	.align 2, 0
_08060088: .4byte gEfxBgSemaphore
_0806008C: .4byte gUnknown_085D6314
_08060090: .4byte gUnknown_080DD542
_08060094: .4byte gUnknown_085D63D8
_08060098: .4byte gUnknown_085D63CC
_0806009C: .4byte gUnknown_08641D84
_080600A0: .4byte gEkrDistanceType
_080600A4:
	movs r0, #1
	movs r1, #0xe8
	movs r2, #0
	bl BG_SetPosition
_080600AE:
	bl SpellFx_SetSomeColorEffect
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8060034

	THUMB_FUNC_START sub_80600B8
sub_80600B8: @ 0x080600B8
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r1, _0806010C  @ gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08060110  @ gUnknown_085D6314
	movs r1, #3
	bl Proc_Start
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	str r0, [r5, #0x44]
	ldr r0, _08060114  @ gUnknown_080DD550
	str r0, [r5, #0x48]
	ldr r0, _08060118  @ gUnknown_085D6438
	str r0, [r5, #0x4c]
	str r0, [r5, #0x50]
	ldr r0, _0806011C  @ gUnknown_085D63E4
	str r0, [r5, #0x54]
	ldr r0, _08060120  @ gUnknown_08641D64
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	ldr r0, _08060124  @ gEkrDistanceType
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _08060132
	ldr r0, [r5, #0x5c]
	bl GetAISSubjectId
	cmp r0, #0
	bne _08060128
	movs r0, #1
	movs r1, #0x18
	movs r2, #0
	bl BG_SetPosition
	b _08060132
	.align 2, 0
_0806010C: .4byte gEfxBgSemaphore
_08060110: .4byte gUnknown_085D6314
_08060114: .4byte gUnknown_080DD550
_08060118: .4byte gUnknown_085D6438
_0806011C: .4byte gUnknown_085D63E4
_08060120: .4byte gUnknown_08641D64
_08060124: .4byte gEkrDistanceType
_08060128:
	movs r0, #1
	movs r1, #0xe8
	movs r2, #0
	bl BG_SetPosition
_08060132:
	bl SpellFx_SetSomeColorEffect
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80600B8

	THUMB_FUNC_START sub_806013C
sub_806013C: @ 0x0806013C
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r7, r0, #0
	adds r0, #0x2c
	adds r1, r7, #0
	adds r1, #0x44
	ldr r2, [r7, #0x48]
	bl SpellFx_InterpretBgAnimScript
	lsls r0, r0, #0x10
	asrs r4, r0, #0x10
	cmp r4, #0
	blt _080601B4
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
	ldr r0, _08060194  @ gEkrDistanceType
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _080601D2
	ldr r0, [r7, #0x5c]
	bl GetAISSubjectId
	adds r1, r0, #0
	cmp r1, #0
	bne _0806019C
	ldr r0, _08060198  @ gBG1TilemapBuffer
	b _080601A0
	.align 2, 0
_08060194: .4byte gEkrDistanceType
_08060198: .4byte gBG1TilemapBuffer
_0806019C:
	ldr r0, _080601B0  @ gUnknown_020234E2
	movs r1, #0
_080601A0:
	str r1, [sp]
	movs r1, #3
	movs r2, #0x14
	movs r3, #0
	bl FillBGRect
	b _080601D2
	.align 2, 0
_080601B0: .4byte gUnknown_020234E2
_080601B4:
	movs r0, #1
	negs r0, r0
	cmp r4, r0
	bne _080601D2
	bl SpellFx_ClearBG1
	ldr r1, _080601DC  @ gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SetDefaultColorEffects_
	adds r0, r7, #0
	bl Proc_Break
_080601D2:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080601DC: .4byte gEfxBgSemaphore

	THUMB_FUNC_END sub_806013C

	THUMB_FUNC_START sub_80601E0
sub_80601E0: @ 0x080601E0
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r1, _08060220  @ gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08060224  @ gUnknown_085D648C
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	ldr r3, _08060228  @ gUnknown_08646510
	str r3, [sp]
	adds r0, r5, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl EfxAnimCreate1
	adds r6, r0, #0
	str r6, [r4, #0x60]
	adds r0, r5, #0
	bl GetAISSubjectId
	cmp r0, #0
	bne _0806022C
	ldrh r0, [r6, #2]
	subs r0, #6
	b _08060230
	.align 2, 0
_08060220: .4byte gEfxBgSemaphore
_08060224: .4byte gUnknown_085D648C
_08060228: .4byte gUnknown_08646510
_0806022C:
	ldrh r0, [r6, #2]
	adds r0, #6
_08060230:
	strh r0, [r6, #2]
	ldr r0, _0806024C  @ gUnknown_08645F44
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _08060250  @ gUnknown_08645DD8
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806024C: .4byte gUnknown_08645F44
_08060250: .4byte gUnknown_08645DD8

	THUMB_FUNC_END sub_80601E0

	THUMB_FUNC_START sub_8060254
sub_8060254: @ 0x08060254
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x2c
	bne _0806027A
	ldr r0, [r4, #0x60]
	bl AnimDelete
	ldr r1, _08060280  @ gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
_0806027A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08060280: .4byte gEfxBgSemaphore

	THUMB_FUNC_END sub_8060254

	THUMB_FUNC_START sub_8060284
sub_8060284: @ 0x08060284
	bx lr

	THUMB_FUNC_END sub_8060284

	THUMB_FUNC_START nullsub_40
nullsub_40: @ 0x08060288
	bx lr

	THUMB_FUNC_END nullsub_40

	THUMB_FUNC_START sub_806028C
sub_806028C: @ 0x0806028C
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl NewEfxSpellCast
	bl SpellFx_SpellFx_ClearBG1Position
	ldr r0, _080602C4  @ gUnknown_085D64A4
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
_080602C4: .4byte gUnknown_085D64A4

	THUMB_FUNC_END sub_806028C

	THUMB_FUNC_START sub_80602C8
sub_80602C8: @ 0x080602C8
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r6, r0, #0
	ldr r0, [r6, #0x5c]
	bl GetCoreAIStruct
	adds r5, r0, #0
	bl GetAnimationStartFrameMaybe
	adds r4, r0, #0
	ldrh r0, [r6, #0x2c]
	adds r0, #1
	movs r7, #0
	strh r0, [r6, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _080602F6
	ldr r0, [r6, #0x5c]
	movs r1, #1
	negs r1, r1
	bl NewEfxFarAttackWithDistance
_080602F6:
	movs r0, #0x2c
	ldrsh r1, [r6, r0]
	adds r0, r4, #1
	cmp r1, r0
	bne _0806034C
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
	movs r2, #0xf
	movs r3, #0
	bl NewEfxALPHA
	str r7, [sp]
	str r7, [sp, #4]
	adds r0, r5, #0
	movs r1, #0x50
	movs r2, #0xf
	movs r3, #0x10
	bl NewEfxALPHA
	ldr r0, [r6, #0x5c]
	bl sub_8060440
	ldr r0, [r6, #0x5c]
	bl sub_8060790
	movs r0, #0x9c
	lsls r0, r0, #1
	movs r1, #0x80
	lsls r1, r1, #1
	movs r2, #0x78
	movs r3, #0
	bl EkrSoundSomeBark
	b _08060438
_0806034C:
	adds r0, r4, #0
	adds r0, #0x46
	cmp r1, r0
	bne _0806037A
	movs r0, #2
	str r0, [sp]
	adds r0, r5, #0
	movs r1, #0x2a
	movs r2, #0xf
	movs r3, #0
	bl NewefxRestRST
	adds r1, r0, #0
	adds r0, r5, #0
	movs r2, #0x1e
	bl sub_805F838
	adds r0, r5, #0
	movs r1, #0x2b
	movs r2, #0
	bl NewEfxRestWINH_
	b _08060438
_0806037A:
	adds r0, r4, #0
	adds r0, #0x78
	cmp r1, r0
	bne _0806038A
	adds r0, r5, #0
	bl sub_80604B0
	b _08060438
_0806038A:
	adds r0, r4, #0
	adds r0, #0x7d
	cmp r1, r0
	bne _080603A8
	ldr r0, _080603A4  @ 0x00000139
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r5, r3]
	movs r3, #1
	bl EkrSoundSomeBark
	b _08060438
	.align 2, 0
_080603A4: .4byte 0x00000139
_080603A8:
	adds r0, r4, #0
	adds r0, #0x97
	cmp r1, r0
	bne _080603B8
	ldr r0, [r6, #0x5c]
	bl sub_80605E8
	b _08060438
_080603B8:
	adds r0, r4, #0
	adds r0, #0xe2
	cmp r1, r0
	bne _08060400
	ldr r0, _080603FC  @ 0x000002E2
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r5, r3]
	movs r3, #1
	bl EkrSoundSomeBark
	adds r0, r5, #0
	movs r1, #0xa
	bl StartSpellBG_FLASH
	ldrh r0, [r5, #0x10]
	movs r1, #9
	orrs r0, r1
	strh r0, [r5, #0x10]
	adds r4, r6, #0
	adds r4, #0x29
	ldrb r1, [r4]
	adds r0, r5, #0
	bl StartBattleAnimHitEffectsDefault
	ldrb r0, [r4]
	cmp r0, #0
	bne _08060438
	adds r0, r5, #0
	bl sub_8072450
	b _08060438
	.align 2, 0
_080603FC: .4byte 0x000002E2
_08060400:
	adds r0, r4, #0
	adds r0, #0xec
	cmp r1, r0
	bne _08060420
	adds r0, r5, #0
	bl sub_8060514
	str r7, [sp]
	str r7, [sp, #4]
	adds r0, r5, #0
	movs r1, #0x10
	movs r2, #0xa
	movs r3, #0x10
	bl NewEfxALPHA
	b _08060438
_08060420:
	movs r2, #0x87
	lsls r2, r2, #1
	adds r0, r4, r2
	cmp r1, r0
	bne _08060438
	bl SpellFx_Finish
	bl EfxSpellCastSet29
	adds r0, r6, #0
	bl Proc_Break
_08060438:
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80602C8

	THUMB_FUNC_START sub_8060440
sub_8060440: @ 0x08060440
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _08060494  @ gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08060498  @ gUnknown_085D64BC
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r2, #0
	strh r2, [r0, #0x2c]
	str r2, [r0, #0x44]
	ldr r1, _0806049C  @ gUnknown_080DD5D2
	str r1, [r0, #0x48]
	ldr r1, _080604A0  @ gUnknown_085D64D4
	str r1, [r0, #0x4c]
	str r1, [r0, #0x50]
	ldr r1, _080604A4  @ gUnknown_085D6540
	str r1, [r0, #0x54]
	str r2, [r0, #0x58]
	ldr r0, _080604A8  @ gUnknown_08636640
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	bl SpellFx_SetSomeColorEffect
	ldr r2, _080604AC  @ gLCDControlBuffer
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
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08060494: .4byte gEfxBgSemaphore
_08060498: .4byte gUnknown_085D64BC
_0806049C: .4byte gUnknown_080DD5D2
_080604A0: .4byte gUnknown_085D64D4
_080604A4: .4byte gUnknown_085D6540
_080604A8: .4byte gUnknown_08636640
_080604AC: .4byte gLCDControlBuffer

	THUMB_FUNC_END sub_8060440

	THUMB_FUNC_START sub_80604B0
sub_80604B0: @ 0x080604B0
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _080604FC  @ gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08060500  @ gUnknown_085D64BC
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r2, #0
	strh r2, [r0, #0x2c]
	str r2, [r0, #0x44]
	ldr r1, _08060504  @ gUnknown_080DD5D8
	str r1, [r0, #0x48]
	ldr r1, _08060508  @ gUnknown_085D64D4
	str r1, [r0, #0x4c]
	str r1, [r0, #0x50]
	ldr r1, _0806050C  @ gUnknown_085D6540
	str r1, [r0, #0x54]
	str r2, [r0, #0x58]
	ldr r0, _08060510  @ gUnknown_0864E790
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	bl SpellFx_SetSomeColorEffect
	movs r0, #1
	movs r1, #0xc
	movs r2, #6
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080604FC: .4byte gEfxBgSemaphore
_08060500: .4byte gUnknown_085D64BC
_08060504: .4byte gUnknown_080DD5D8
_08060508: .4byte gUnknown_085D64D4
_0806050C: .4byte gUnknown_085D6540
_08060510: .4byte gUnknown_0864E790

	THUMB_FUNC_END sub_80604B0

	THUMB_FUNC_START sub_8060514
sub_8060514: @ 0x08060514
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _08060554  @ gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08060558  @ gUnknown_085D64BC
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r2, #0
	strh r2, [r0, #0x2c]
	str r2, [r0, #0x44]
	ldr r1, _0806055C  @ gUnknown_080DD67A
	str r1, [r0, #0x48]
	ldr r1, _08060560  @ gUnknown_085D64D4
	str r1, [r0, #0x4c]
	str r1, [r0, #0x50]
	ldr r1, _08060564  @ gUnknown_085D6540
	str r1, [r0, #0x54]
	str r2, [r0, #0x58]
	ldr r0, _08060568  @ gUnknown_0864E7B0
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	bl SpellFx_SetSomeColorEffect
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08060554: .4byte gEfxBgSemaphore
_08060558: .4byte gUnknown_085D64BC
_0806055C: .4byte gUnknown_080DD67A
_08060560: .4byte gUnknown_085D64D4
_08060564: .4byte gUnknown_085D6540
_08060568: .4byte gUnknown_0864E7B0

	THUMB_FUNC_END sub_8060514

	THUMB_FUNC_START sub_806056C
sub_806056C: @ 0x0806056C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl SpellFx_InterpretBgAnimScript
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	cmp r1, #0
	blt _080605BC
	ldr r7, [r4, #0x4c]
	ldr r0, [r4, #0x50]
	mov r8, r0
	ldr r0, [r4, #0x54]
	lsls r5, r1, #2
	adds r6, r5, r0
	ldr r0, [r4, #0x58]
	ldr r2, [r6]
	cmp r0, r2
	beq _080605A6
	movs r1, #0x80
	lsls r1, r1, #6
	adds r0, r2, #0
	bl SpellFx_RegisterBgGfx
_080605A6:
	ldr r0, [r6]
	str r0, [r4, #0x58]
	ldr r0, [r4, #0x5c]
	adds r1, r5, r7
	ldr r1, [r1]
	mov r3, r8
	adds r2, r5, r3
	ldr r2, [r2]
	bl SpellFx_WriteBgMap
	b _080605DA
_080605BC:
	movs r0, #1
	negs r0, r0
	cmp r1, r0
	bne _080605DA
	bl SpellFx_ClearBG1
	ldr r1, _080605E4  @ gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SetDefaultColorEffects_
	adds r0, r4, #0
	bl Proc_Break
_080605DA:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080605E4: .4byte gEfxBgSemaphore

	THUMB_FUNC_END sub_806056C

	THUMB_FUNC_START sub_80605E8
sub_80605E8: @ 0x080605E8
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r1, _08060640  @ gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08060644  @ ProcScr_efxHazymoonOBJ2
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	adds r0, r5, #0
	bl GetCoreAIStruct
	adds r5, r0, #0
	movs r0, #0
	strh r0, [r4, #0x2c]
	ldr r3, _08060648  @ FramScr_Unk5D4F90
	str r3, [sp]
	adds r0, r5, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl EfxAnimCreate1
	adds r6, r0, #0
	str r6, [r4, #0x60]
	ldrh r1, [r6, #8]
	ldr r0, _0806064C  @ 0x0000F3FF
	ands r0, r1
	movs r2, #0x80
	lsls r2, r2, #3
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r6, #8]
	adds r0, r5, #0
	bl GetAISSubjectId
	cmp r0, #0
	bne _08060650
	ldrh r0, [r6, #2]
	subs r0, #8
	b _08060654
	.align 2, 0
_08060640: .4byte gEfxBgSemaphore
_08060644: .4byte ProcScr_efxHazymoonOBJ2
_08060648: .4byte FramScr_Unk5D4F90
_0806064C: .4byte 0x0000F3FF
_08060650:
	ldrh r0, [r6, #2]
	adds r0, #8
_08060654:
	strh r0, [r6, #2]
	ldrh r0, [r6, #4]
	subs r0, #0x10
	strh r0, [r6, #4]
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80605E8

	THUMB_FUNC_START sub_8060664
sub_8060664: @ 0x08060664
	push {lr}
	ldr r2, _08060678  @ gEfxBgSemaphore
	ldr r1, [r2]
	subs r1, #1
	str r1, [r2]
	ldr r0, [r0, #0x60]
	bl AnimDelete
	pop {r0}
	bx r0
	.align 2, 0
_08060678: .4byte gEfxBgSemaphore

	THUMB_FUNC_END sub_8060664

	THUMB_FUNC_START sub_806067C
sub_806067C: @ 0x0806067C
	push {r4, lr}
	adds r1, r0, #0
	ldr r2, [r1, #0x60]
	ldrh r0, [r1, #0x2c]
	adds r0, #1
	movs r4, #0
	strh r0, [r1, #0x2c]
	lsls r0, r0, #0x10
	asrs r3, r0, #0x10
	cmp r3, #1
	bne _080606C0
	ldr r0, _080606B4  @ gUnknown_086517DC
	str r0, [r2, #0x24]
	str r0, [r2, #0x20]
	strh r4, [r2, #6]
	movs r0, #0xa
	strh r0, [r1, #0x2e]
	ldr r0, _080606B8  @ gUnknown_0865163C
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _080606BC  @ gUnknown_086508DC
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	b _080606D0
	.align 2, 0
_080606B4: .4byte gUnknown_086517DC
_080606B8: .4byte gUnknown_0865163C
_080606BC: .4byte gUnknown_086508DC
_080606C0:
	movs r2, #0x2e
	ldrsh r0, [r1, r2]
	cmp r3, r0
	bne _080606D0
	strh r4, [r1, #0x2c]
	adds r0, r1, #0
	bl Proc_Break
_080606D0:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_806067C

	THUMB_FUNC_START sub_80606D8
sub_80606D8: @ 0x080606D8
	push {r4, lr}
	adds r1, r0, #0
	ldr r2, [r1, #0x60]
	ldrh r0, [r1, #0x2c]
	adds r0, #1
	movs r4, #0
	strh r0, [r1, #0x2c]
	lsls r0, r0, #0x10
	asrs r3, r0, #0x10
	cmp r3, #1
	bne _0806071C
	ldr r0, _08060710  @ gUnknown_08651AE4
	str r0, [r2, #0x24]
	str r0, [r2, #0x20]
	strh r4, [r2, #6]
	movs r0, #0xa
	strh r0, [r1, #0x2e]
	ldr r0, _08060714  @ gUnknown_0865163C
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _08060718  @ gUnknown_08650DA8
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	b _0806072C
	.align 2, 0
_08060710: .4byte gUnknown_08651AE4
_08060714: .4byte gUnknown_0865163C
_08060718: .4byte gUnknown_08650DA8
_0806071C:
	movs r2, #0x2e
	ldrsh r0, [r1, r2]
	cmp r3, r0
	bne _0806072C
	strh r4, [r1, #0x2c]
	adds r0, r1, #0
	bl Proc_Break
_0806072C:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80606D8

	THUMB_FUNC_START sub_8060734
sub_8060734: @ 0x08060734
	push {r4, lr}
	adds r1, r0, #0
	ldr r2, [r1, #0x60]
	ldrh r0, [r1, #0x2c]
	adds r0, #1
	movs r4, #0
	strh r0, [r1, #0x2c]
	lsls r0, r0, #0x10
	asrs r3, r0, #0x10
	cmp r3, #1
	bne _08060778
	ldr r0, _0806076C  @ gUnknown_08651DE0
	str r0, [r2, #0x24]
	str r0, [r2, #0x20]
	strh r4, [r2, #6]
	movs r0, #0xa
	strh r0, [r1, #0x2e]
	ldr r0, _08060770  @ gUnknown_0865163C
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _08060774  @ gUnknown_08651240
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	b _08060788
	.align 2, 0
_0806076C: .4byte gUnknown_08651DE0
_08060770: .4byte gUnknown_0865163C
_08060774: .4byte gUnknown_08651240
_08060778:
	movs r2, #0x2e
	ldrsh r0, [r1, r2]
	cmp r3, r0
	bne _08060788
	strh r4, [r1, #0x2c]
	adds r0, r1, #0
	bl Proc_Break
_08060788:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8060734

	THUMB_FUNC_START sub_8060790
sub_8060790: @ 0x08060790
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _080607C8  @ gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _080607CC  @ gUnknown_085D65F4
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r1, [r0, #0x2e]
	movs r1, #0x2c
	strh r1, [r0, #0x30]
	ldr r0, _080607D0  @ gUnknown_0862D424
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _080607D4  @ gUnknown_0862C82C
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080607C8: .4byte gEfxBgSemaphore
_080607CC: .4byte gUnknown_085D65F4
_080607D0: .4byte gUnknown_0862D424
_080607D4: .4byte gUnknown_0862C82C

	THUMB_FUNC_END sub_8060790

	THUMB_FUNC_START sub_80607D8
sub_80607D8: @ 0x080607D8
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #8
	bne _0806082A
	movs r0, #0
	strh r0, [r4, #0x2c]
	ldr r0, _08060830  @ gUnknown_085D660C
	movs r1, #0x2e
	ldrsh r2, [r4, r1]
	lsls r1, r2, #2
	adds r1, r1, r0
	lsls r2, r2, #1
	adds r2, #1
	lsls r2, r2, #1
	adds r2, r2, r0
	ldr r0, [r4, #0x5c]
	movs r3, #0
	ldrsh r1, [r1, r3]
	movs r3, #0
	ldrsh r2, [r2, r3]
	bl sub_8060838
	ldrh r0, [r4, #0x2e]
	adds r0, #1
	strh r0, [r4, #0x2e]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #6
	bne _0806082A
	ldr r1, _08060834  @ gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
_0806082A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08060830: .4byte gUnknown_085D660C
_08060834: .4byte gEfxBgSemaphore

	THUMB_FUNC_END sub_80607D8

	THUMB_FUNC_START sub_8060838
sub_8060838: @ 0x08060838
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #4
	adds r5, r0, #0
	adds r6, r1, #0
	mov r8, r2
	ldr r1, _08060880  @ gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08060884  @ gUnknown_085D6624
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	ldr r3, _08060888  @ gUnknown_0862D6E0
	str r3, [sp]
	adds r0, r5, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl EfxAnimCreate1
	str r0, [r4, #0x60]
	strh r6, [r0, #2]
	mov r1, r8
	strh r1, [r0, #4]
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08060880: .4byte gEfxBgSemaphore
_08060884: .4byte gUnknown_085D6624
_08060888: .4byte gUnknown_0862D6E0

	THUMB_FUNC_END sub_8060838

	THUMB_FUNC_START sub_806088C
sub_806088C: @ 0x0806088C
	push {lr}
	ldr r2, _080608A0  @ gEfxBgSemaphore
	ldr r1, [r2]
	subs r1, #1
	str r1, [r2]
	ldr r0, [r0, #0x60]
	bl AnimDelete
	pop {r0}
	bx r0
	.align 2, 0
_080608A0: .4byte gEfxBgSemaphore

	THUMB_FUNC_END sub_806088C

	THUMB_FUNC_START StartSpellAnimFenrir
StartSpellAnimFenrir: @ 0x080608A4
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl NewEfxSpellCast
	bl SpellFx_SpellFx_ClearBG1Position
	ldr r0, _080608DC  @ gUnknown_085D6644
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
_080608DC: .4byte gUnknown_085D6644

	THUMB_FUNC_END StartSpellAnimFenrir

	THUMB_FUNC_START sub_80608E0
sub_80608E0: @ 0x080608E0
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r6, r0, #0
	ldr r0, [r6, #0x5c]
	bl GetCoreAIStruct
	adds r5, r0, #0
	bl GetAnimationStartFrameMaybe
	adds r4, r0, #0
	ldrh r0, [r6, #0x2c]
	adds r0, #1
	movs r7, #0
	strh r0, [r6, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _0806090E
	ldr r0, [r6, #0x5c]
	movs r1, #1
	negs r1, r1
	bl NewEfxFarAttackWithDistance
_0806090E:
	movs r0, #0x2c
	ldrsh r1, [r6, r0]
	adds r0, r4, #1
	cmp r1, r0
	bne _08060984
	adds r0, r5, #0
	movs r1, #0x64
	bl sub_8060A9C
	adds r0, r5, #0
	movs r1, #0x64
	bl sub_8060B7C
	movs r4, #0x80
	lsls r4, r4, #1
	movs r0, #1
	str r0, [sp]
	adds r0, r5, #0
	movs r1, #0x64
	movs r2, #2
	adds r3, r4, #0
	bl NewefxRestRST
	adds r0, r5, #0
	movs r1, #0x69
	movs r2, #0
	bl NewEfxRestWINH_
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
	movs r2, #0xf
	movs r3, #0
	bl NewEfxALPHA
	str r7, [sp]
	str r7, [sp, #4]
	adds r0, r5, #0
	movs r1, #0x46
	movs r2, #0xf
	movs r3, #0x10
	bl NewEfxALPHA
	movs r0, #0x98
	lsls r0, r0, #1
	adds r1, r4, #0
	movs r2, #0x78
	movs r3, #0
	bl EkrSoundSomeBark
	b _08060A94
_08060984:
	adds r0, r4, #0
	adds r0, #0x28
	cmp r1, r0
	bne _0806099C
	adds r0, r5, #0
	movs r1, #0x4a
	bl sub_8060C18
	ldr r0, _08060998  @ 0x00000131
	b _080609F4
	.align 2, 0
_08060998: .4byte 0x00000131
_0806099C:
	adds r0, r4, #0
	adds r0, #0x6e
	cmp r1, r0
	bne _080609AC
	adds r0, r5, #0
	bl sub_8060CAC
	b _08060A94
_080609AC:
	adds r0, r4, #0
	adds r0, #0x6f
	cmp r1, r0
	beq _080609F0
	adds r0, r4, #0
	adds r0, #0x7d
	cmp r1, r0
	beq _080609F0
	adds r0, r4, #0
	adds r0, #0x8b
	cmp r1, r0
	beq _080609F0
	adds r0, r4, #0
	adds r0, #0x99
	cmp r1, r0
	beq _080609F0
	adds r0, r4, #0
	adds r0, #0xa7
	cmp r1, r0
	beq _080609F0
	adds r0, r4, #0
	adds r0, #0xb5
	cmp r1, r0
	beq _080609F0
	adds r0, r4, #0
	adds r0, #0xc3
	cmp r1, r0
	beq _080609F0
	movs r0, #0x2c
	ldrsh r1, [r6, r0]
	adds r0, r4, #0
	adds r0, #0xd1
	cmp r1, r0
	bne _08060A04
_080609F0:
	movs r0, #0x99
	lsls r0, r0, #1
_080609F4:
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r5, r3]
	movs r3, #1
	bl EkrSoundSomeBark
	b _08060A94
_08060A04:
	adds r0, r4, #0
	adds r0, #0xee
	cmp r1, r0
	bne _08060A50
	adds r0, r5, #0
	movs r1, #0xa
	bl StartSpellBG_FLASH
	adds r0, r5, #0
	bl sub_8060E90
	ldrh r1, [r5, #0x10]
	movs r0, #9
	orrs r0, r1
	strh r0, [r5, #0x10]
	adds r4, r6, #0
	adds r4, #0x29
	ldrb r1, [r4]
	adds r0, r5, #0
	bl StartBattleAnimHitEffectsDefault
	ldr r0, _08060A4C  @ 0x00000133
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r5, r3]
	movs r3, #1
	bl EkrSoundSomeBark
	ldrb r0, [r4]
	cmp r0, #0
	bne _08060A94
	adds r0, r5, #0
	bl sub_8072450
	b _08060A94
	.align 2, 0
_08060A4C: .4byte 0x00000133
_08060A50:
	adds r0, r4, #0
	adds r0, #0xf8
	cmp r1, r0
	bne _08060A72
	adds r0, r5, #0
	bl sub_8060D3C
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	adds r0, r5, #0
	movs r1, #0x12
	movs r2, #8
	movs r3, #0x10
	bl NewEfxALPHA
	b _08060A94
_08060A72:
	movs r2, #0x91
	lsls r2, r2, #1
	adds r0, r4, r2
	cmp r1, r0
	beq _08060A94
	movs r3, #0x96
	lsls r3, r3, #1
	adds r0, r4, r3
	cmp r1, r0
	bne _08060A94
	bl SpellFx_Finish
	bl EfxSpellCastSet29
	adds r0, r6, #0
	bl Proc_Break
_08060A94:
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80608E0

	THUMB_FUNC_START sub_8060A9C
sub_8060A9C: @ 0x08060A9C
	push {r4, r5, lr}
	sub sp, #8
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, _08060B10  @ gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08060B14  @ gUnknown_085D665C
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r5, [r0, #0x2e]
	ldr r0, _08060B18  @ gUnknown_08651DF4
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	bl SpellFx_ClearBG1
	ldr r0, _08060B1C  @ gUnknown_08652734
	ldr r4, _08060B20  @ gEkrTsaBuffer
	adds r1, r4, #0
	bl LZ77UnCompWram
	ldr r1, _08060B24  @ gBG1TilemapBuffer
	movs r0, #1
	str r0, [sp]
	adds r0, #0xff
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r2, #0x20
	movs r3, #0x20
	bl sub_8070E94
	movs r0, #2
	bl BG_EnableSyncByMask
	bl SpellFx_SetSomeColorEffect
	ldr r2, _08060B28  @ gLCDControlBuffer
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
_08060B10: .4byte gEfxBgSemaphore
_08060B14: .4byte gUnknown_085D665C
_08060B18: .4byte gUnknown_08651DF4
_08060B1C: .4byte gUnknown_08652734
_08060B20: .4byte gEkrTsaBuffer
_08060B24: .4byte gBG1TilemapBuffer
_08060B28: .4byte gLCDControlBuffer

	THUMB_FUNC_END sub_8060A9C

	THUMB_FUNC_START sub_8060B2C
sub_8060B2C: @ 0x08060B2C
	push {lr}
	bl SpellFx_ClearBG1
	ldr r1, _08060B44  @ gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SetDefaultColorEffects_
	pop {r0}
	bx r0
	.align 2, 0
_08060B44: .4byte gEfxBgSemaphore

	THUMB_FUNC_END sub_8060B2C

	THUMB_FUNC_START sub_8060B48
sub_8060B48: @ 0x08060B48
	push {lr}
	adds r2, r0, #0
	ldr r1, _08060B78  @ gLCDControlBuffer
	ldrh r0, [r1, #0x22]
	adds r0, #1
	strh r0, [r1, #0x22]
	ldrh r0, [r1, #0x20]
	subs r0, #1
	strh r0, [r1, #0x20]
	ldrh r0, [r2, #0x2c]
	adds r0, #1
	strh r0, [r2, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r3, #0x2e
	ldrsh r1, [r2, r3]
	cmp r0, r1
	ble _08060B72
	adds r0, r2, #0
	bl Proc_Break
_08060B72:
	pop {r0}
	bx r0
	.align 2, 0
_08060B78: .4byte gLCDControlBuffer

	THUMB_FUNC_END sub_8060B48

	THUMB_FUNC_START sub_8060B7C
sub_8060B7C: @ 0x08060B7C
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, _08060BB4  @ gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08060BB8  @ ProcScr_efxFenrirBGCOL
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r1, [r0, #0x2e]
	strh r5, [r0, #0x30]
	str r1, [r0, #0x44]
	ldr r1, _08060BBC  @ gUnknown_080DD70C
	str r1, [r0, #0x48]
	ldr r1, _08060BC0  @ gUnknown_08652554
	str r1, [r0, #0x4c]
	adds r0, r1, #0
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08060BB4: .4byte gEfxBgSemaphore
_08060BB8: .4byte ProcScr_efxFenrirBGCOL
_08060BBC: .4byte gUnknown_080DD70C
_08060BC0: .4byte gUnknown_08652554

	THUMB_FUNC_END sub_8060B7C

	THUMB_FUNC_START sub_8060BC4
sub_8060BC4: @ 0x08060BC4
	ldr r1, _08060BD0  @ gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bx lr
	.align 2, 0
_08060BD0: .4byte gEfxBgSemaphore

	THUMB_FUNC_END sub_8060BC4

	THUMB_FUNC_START sub_8060BD4
sub_8060BD4: @ 0x08060BD4
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl SpellFx_InterpretBgAnimScript
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	cmp r1, #0
	blt _08060BF8
	ldr r0, [r4, #0x4c]
	lsls r1, r1, #5
	adds r0, r0, r1
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
_08060BF8:
	ldrh r0, [r4, #0x2e]
	adds r0, #1
	strh r0, [r4, #0x2e]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x30
	ldrsh r1, [r4, r2]
	cmp r0, r1
	ble _08060C10
	adds r0, r4, #0
	bl Proc_Break
_08060C10:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8060BD4

	THUMB_FUNC_START sub_8060C18
sub_8060C18: @ 0x08060C18
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	adds r6, r1, #0
	ldr r1, _08060C64  @ gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08060C68  @ gUnknown_085D66A4
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	strh r6, [r4, #0x2e]
	ldr r3, _08060C6C  @ gUnknown_0865C7D4
	str r3, [sp]
	adds r0, r5, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl EfxAnimCreate1
	str r0, [r4, #0x60]
	ldr r0, _08060C70  @ gUnknown_0865BAB8
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _08060C74  @ gUnknown_0865AF3C
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08060C64: .4byte gEfxBgSemaphore
_08060C68: .4byte gUnknown_085D66A4
_08060C6C: .4byte gUnknown_0865C7D4
_08060C70: .4byte gUnknown_0865BAB8
_08060C74: .4byte gUnknown_0865AF3C

	THUMB_FUNC_END sub_8060C18

	THUMB_FUNC_START sub_8060C78
sub_8060C78: @ 0x08060C78
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
	ble _08060CA2
	ldr r0, _08060CA8  @ gEfxBgSemaphore
	ldr r1, [r0]
	subs r1, #1
	str r1, [r0]
	ldr r0, [r4, #0x60]
	bl AnimDelete
	adds r0, r4, #0
	bl Proc_Break
_08060CA2:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08060CA8: .4byte gEfxBgSemaphore

	THUMB_FUNC_END sub_8060C78

	THUMB_FUNC_START sub_8060CAC
sub_8060CAC: @ 0x08060CAC
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r1, _08060D10  @ gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08060D14  @ ProcScr_efxFenrirBG2
	movs r1, #3
	bl Proc_Start
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	movs r1, #0
	strh r1, [r5, #0x2c]
	str r1, [r5, #0x44]
	ldr r0, _08060D18  @ gUnknown_080DD76A
	str r0, [r5, #0x48]
	ldr r0, _08060D1C  @ gUnknown_085D67A0
	str r0, [r5, #0x4c]
	str r0, [r5, #0x50]
	ldr r0, _08060D20  @ gUnknown_085D66D4
	str r0, [r5, #0x54]
	str r1, [r5, #0x58]
	ldr r0, _08060D24  @ gUnknown_086568F4
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	bl SpellFx_SetSomeColorEffect
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	ldr r0, _08060D28  @ gEkrDistanceType
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _08060D36
	ldr r0, [r5, #0x5c]
	bl GetAISSubjectId
	cmp r0, #0
	bne _08060D2C
	movs r0, #1
	movs r1, #0x18
	movs r2, #0
	bl BG_SetPosition
	b _08060D36
	.align 2, 0
_08060D10: .4byte gEfxBgSemaphore
_08060D14: .4byte ProcScr_efxFenrirBG2
_08060D18: .4byte gUnknown_080DD76A
_08060D1C: .4byte gUnknown_085D67A0
_08060D20: .4byte gUnknown_085D66D4
_08060D24: .4byte gUnknown_086568F4
_08060D28: .4byte gEkrDistanceType
_08060D2C:
	movs r0, #1
	movs r1, #0xe8
	movs r2, #0
	bl BG_SetPosition
_08060D36:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8060CAC

	THUMB_FUNC_START sub_8060D3C
sub_8060D3C: @ 0x08060D3C
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r1, _08060D98  @ gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08060D9C  @ ProcScr_efxFenrirBG2
	movs r1, #3
	bl Proc_Start
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	movs r1, #0
	strh r1, [r5, #0x2c]
	str r1, [r5, #0x44]
	ldr r0, _08060DA0  @ gUnknown_080DCD72
	str r0, [r5, #0x48]
	ldr r0, _08060DA4  @ gUnknown_085D55B4
	str r0, [r5, #0x4c]
	str r0, [r5, #0x50]
	ldr r0, _08060DA8  @ gUnknown_085D5560
	str r0, [r5, #0x54]
	str r1, [r5, #0x58]
	ldr r0, _08060DAC  @ gUnknown_08656914
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	bl SpellFx_SetSomeColorEffect
	ldr r0, _08060DB0  @ gEkrDistanceType
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _08060DBE
	ldr r0, [r5, #0x5c]
	bl GetAISSubjectId
	cmp r0, #0
	bne _08060DB4
	movs r0, #1
	movs r1, #0x18
	movs r2, #0
	bl BG_SetPosition
	b _08060DBE
	.align 2, 0
_08060D98: .4byte gEfxBgSemaphore
_08060D9C: .4byte ProcScr_efxFenrirBG2
_08060DA0: .4byte gUnknown_080DCD72
_08060DA4: .4byte gUnknown_085D55B4
_08060DA8: .4byte gUnknown_085D5560
_08060DAC: .4byte gUnknown_08656914
_08060DB0: .4byte gEkrDistanceType
_08060DB4:
	movs r0, #1
	movs r1, #0xe8
	movs r2, #0
	bl BG_SetPosition
_08060DBE:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8060D3C

	THUMB_FUNC_START sub_8060DC4
sub_8060DC4: @ 0x08060DC4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl SpellFx_InterpretBgAnimScript
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	cmp r1, #0
	blt _08060E60
	ldr r7, [r4, #0x4c]
	ldr r0, [r4, #0x50]
	mov r8, r0
	ldr r0, [r4, #0x54]
	lsls r5, r1, #2
	adds r6, r5, r0
	ldr r0, [r4, #0x58]
	ldr r2, [r6]
	cmp r0, r2
	beq _08060E00
	movs r1, #0x80
	lsls r1, r1, #6
	adds r0, r2, #0
	bl SpellFx_RegisterBgGfx
_08060E00:
	ldr r0, [r6]
	str r0, [r4, #0x58]
	ldr r0, [r4, #0x5c]
	adds r1, r5, r7
	ldr r1, [r1]
	mov r3, r8
	adds r2, r5, r3
	ldr r2, [r2]
	bl SpellFx_WriteBgMap
	ldr r0, _08060E3C  @ gEkrDistanceType
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _08060E7E
	ldr r0, [r4, #0x5c]
	bl GetAISSubjectId
	adds r1, r0, #0
	cmp r1, #0
	bne _08060E44
	ldr r0, _08060E40  @ gBG1TilemapBuffer
	str r1, [sp]
	movs r1, #3
	movs r2, #0x14
	movs r3, #0
	bl FillBGRect
	b _08060E54
	.align 2, 0
_08060E3C: .4byte gEkrDistanceType
_08060E40: .4byte gBG1TilemapBuffer
_08060E44:
	ldr r0, _08060E5C  @ gUnknown_020234E2
	movs r1, #0
	str r1, [sp]
	movs r1, #3
	movs r2, #0x14
	movs r3, #0
	bl FillBGRect
_08060E54:
	movs r0, #2
	bl BG_EnableSyncByMask
	b _08060E7E
	.align 2, 0
_08060E5C: .4byte gUnknown_020234E2
_08060E60:
	movs r0, #1
	negs r0, r0
	cmp r1, r0
	bne _08060E7E
	bl SpellFx_ClearBG1
	ldr r1, _08060E8C  @ gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SetDefaultColorEffects_
	adds r0, r4, #0
	bl Proc_Break
_08060E7E:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08060E8C: .4byte gEfxBgSemaphore

	THUMB_FUNC_END sub_8060DC4

	THUMB_FUNC_START sub_8060E90
sub_8060E90: @ 0x08060E90
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _08060EC8  @ gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08060ECC  @ ProcScr_efxFenrirOBJ2
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r1, [r0, #0x2e]
	str r1, [r0, #0x44]
	ldr r0, _08060ED0  @ gUnknown_0865BAD8
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _08060ED4  @ gUnknown_0865AF3C
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08060EC8: .4byte gEfxBgSemaphore
_08060ECC: .4byte ProcScr_efxFenrirOBJ2
_08060ED0: .4byte gUnknown_0865BAD8
_08060ED4: .4byte gUnknown_0865AF3C

	THUMB_FUNC_END sub_8060E90

	THUMB_FUNC_START sub_8060ED8
sub_8060ED8: @ 0x08060ED8
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #2
	bne _08060F18
	movs r0, #0
	strh r0, [r4, #0x2c]
	ldr r0, [r4, #0x5c]
	ldr r2, [r4, #0x44]
	adds r1, r2, #0
	adds r2, #1
	str r2, [r4, #0x44]
	bl sub_8060F24
	ldrh r0, [r4, #0x2e]
	adds r0, #1
	strh r0, [r4, #0x2e]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #8
	bne _08060F18
	ldr r1, _08060F20  @ gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
_08060F18:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08060F20: .4byte gEfxBgSemaphore

	THUMB_FUNC_END sub_8060ED8

	THUMB_FUNC_START sub_8060F24
sub_8060F24: @ 0x08060F24
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r4, r1, #0
	ldr r1, _08060F64  @ gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08060F68  @ gUnknown_085D6884
	movs r1, #3
	bl Proc_Start
	adds r5, r0, #0
	str r6, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	movs r0, #0x1e
	strh r0, [r5, #0x2e]
	ldr r1, _08060F6C  @ gUnknown_085D689C
	movs r0, #7
	ands r0, r4
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	str r0, [r5, #0x44]
	movs r1, #0
	movs r0, #1
	ands r0, r4
	cmp r0, #0
	beq _08060F70
	cmp r0, #1
	beq _08060F78
	b _08060F84
	.align 2, 0
_08060F64: .4byte gEfxBgSemaphore
_08060F68: .4byte gUnknown_085D6884
_08060F6C: .4byte gUnknown_085D689C
_08060F70:
	ldr r0, _08060F74  @ gUnknown_0865C77C
	b _08060F7A
	.align 2, 0
_08060F74: .4byte gUnknown_0865C77C
_08060F78:
	ldr r0, _08060FA0  @ gUnknown_0865C7A8
_08060F7A:
	movs r1, #0x78
	bl AnimCreate
	adds r1, r0, #0
	str r1, [r5, #0x60]
_08060F84:
	movs r0, #0xa1
	lsls r0, r0, #6
	strh r0, [r1, #8]
	ldrh r0, [r6, #2]
	strh r0, [r1, #2]
	ldrh r0, [r6, #2]
	strh r0, [r5, #0x32]
	ldrh r0, [r6, #4]
	strh r0, [r1, #4]
	ldrh r0, [r6, #4]
	strh r0, [r5, #0x3a]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08060FA0: .4byte gUnknown_0865C7A8

	THUMB_FUNC_END sub_8060F24

	THUMB_FUNC_START sub_8060FA4
sub_8060FA4: @ 0x08060FA4
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	ldr r5, [r6, #0x60]
	movs r2, #0x96
	lsls r2, r2, #1
	movs r0, #0x2c
	ldrsh r3, [r6, r0]
	movs r1, #0x2e
	ldrsh r0, [r6, r1]
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	bl Interpolate
	ldr r4, _0806101C  @ gSinLookup
	ldr r2, [r6, #0x44]
	lsls r1, r2, #1
	adds r1, r1, r4
	movs r3, #0
	ldrsh r1, [r1, r3]
	adds r3, r0, #0
	muls r3, r1, r3
	adds r2, #0x40
	lsls r2, r2, #1
	adds r2, r2, r4
	movs r4, #0
	ldrsh r1, [r2, r4]
	muls r0, r1, r0
	asrs r3, r3, #0xc
	ldrh r1, [r6, #0x32]
	adds r3, r3, r1
	strh r3, [r5, #2]
	asrs r0, r0, #0xc
	ldrh r2, [r6, #0x3a]
	adds r0, r0, r2
	strh r0, [r5, #4]
	ldrh r0, [r6, #0x2c]
	adds r0, #1
	strh r0, [r6, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r3, #0x2e
	ldrsh r1, [r6, r3]
	cmp r0, r1
	ble _08061014
	ldr r0, _08061020  @ gEfxBgSemaphore
	ldr r1, [r0]
	subs r1, #1
	str r1, [r0]
	ldr r0, [r6, #0x60]
	bl AnimDelete
	adds r0, r6, #0
	bl Proc_Break
_08061014:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806101C: .4byte gSinLookup
_08061020: .4byte gEfxBgSemaphore

	THUMB_FUNC_END sub_8060FA4

	THUMB_FUNC_START StartSpellAnimHeal
StartSpellAnimHeal: @ 0x08061024
	push {r4, lr}
	adds r4, r0, #0
	bl SpellFx_Begin
	bl NewEfxSpellCast
	bl SpellFx_SpellFx_ClearBG1Position
	ldr r0, _08061048  @ ProcScr_efxLive
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08061048: .4byte ProcScr_efxLive

	THUMB_FUNC_END StartSpellAnimHeal

	THUMB_FUNC_START EfxLiveMain
EfxLiveMain: @ 0x0806104C
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetCoreAIStruct
	adds r5, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	movs r6, #0
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _0806107E
	ldr r0, [r4, #0x5c]
	bl NewEfxLiveOBJ
	movs r0, #0xb3
	lsls r0, r0, #2
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r2, [r4, #0x5c]
	movs r3, #2
	ldrsh r2, [r2, r3]
	b _0806110A
_0806107E:
	cmp r0, #0x34
	bne _080610C6
	ldr r0, [r4, #0x5c]
	movs r1, #0
	bl sub_8061594
	ldr r0, [r4, #0x5c]
	movs r1, #0
	bl sub_8061774
	movs r0, #1
	movs r1, #0
	movs r2, #0x10
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	ldr r0, [r4, #0x5c]
	movs r1, #1
	movs r2, #0xc
	movs r3, #0
	bl sub_806189C
	ldr r0, [r4, #0x5c]
	movs r1, #0x23
	movs r2, #0x19
	movs r3, #1
	bl sub_806189C
	movs r0, #0x87
	lsls r0, r0, #1
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r2, [r4, #0x5c]
	movs r3, #2
	ldrsh r2, [r2, r3]
	b _0806110A
_080610C6:
	cmp r0, #0x37
	bne _080610D4
	ldrh r0, [r5, #0x10]
	movs r1, #9
	orrs r0, r1
	strh r0, [r5, #0x10]
	b _08061150
_080610D4:
	cmp r0, #0x71
	bne _08061118
	ldr r0, [r4, #0x5c]
	movs r1, #0
	bl sub_8061650
	ldr r0, [r4, #0x5c]
	movs r1, #0
	bl sub_80617E4
	ldr r0, [r4, #0x5c]
	movs r1, #1
	movs r2, #0xc
	movs r3, #0
	bl sub_806189C
	ldr r0, [r4, #0x5c]
	movs r1, #0x1d
	movs r2, #0x19
	movs r3, #1
	bl sub_806189C
	ldr r0, _08061114  @ 0x0000010F
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r5, r3]
_0806110A:
	movs r3, #1
	bl EkrSoundSomeBark
	b _08061150
	.align 2, 0
_08061114: .4byte 0x0000010F
_08061118:
	cmp r0, #0xa6
	bne _08061124
	adds r0, r5, #0
	bl NewEfxHPBarLive
	b _08061150
_08061124:
	cmp r0, #0xb5
	bne _08061150
	bl SpellFx_Finish
	bl EfxSpellCastSet29
	adds r0, r5, #0
	bl sub_805A2F0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #1
	negs r1, r1
	cmp r0, r1
	beq _0806114A
	ldrh r0, [r5, #0x10]
	movs r1, #2
	orrs r0, r1
	strh r0, [r5, #0x10]
_0806114A:
	adds r0, r4, #0
	bl Proc_Break
_08061150:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END EfxLiveMain

	THUMB_FUNC_START StartSpellAnimMend
StartSpellAnimMend: @ 0x08061158
	push {r4, lr}
	adds r4, r0, #0
	bl SpellFx_Begin
	bl NewEfxSpellCast
	bl SpellFx_SpellFx_ClearBG1Position
	ldr r0, _0806117C  @ ProcScr_efxRelive
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806117C: .4byte ProcScr_efxRelive

	THUMB_FUNC_END StartSpellAnimMend

	THUMB_FUNC_START EfxReliveMain
EfxReliveMain: @ 0x08061180
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetCoreAIStruct
	adds r5, r0, #0
	bl GetAnimationStartFrameMaybe
	adds r2, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	movs r6, #0
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _080611B8
	ldr r0, [r4, #0x5c]
	bl NewEfxLiveOBJ
	movs r0, #0xb3
	lsls r0, r0, #2
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r2, [r4, #0x5c]
	movs r3, #2
	ldrsh r2, [r2, r3]
	b _08061268
_080611B8:
	cmp r0, #0x34
	bne _08061200
	ldr r0, [r4, #0x5c]
	movs r1, #1
	bl sub_8061594
	ldr r0, [r4, #0x5c]
	movs r1, #1
	bl sub_8061774
	movs r0, #1
	movs r1, #0
	movs r2, #0x10
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	ldr r0, [r4, #0x5c]
	movs r1, #1
	movs r2, #0xc
	movs r3, #0
	bl sub_806189C
	ldr r0, [r4, #0x5c]
	movs r1, #0x23
	movs r2, #0x19
	movs r3, #1
	bl sub_806189C
	movs r0, #0x88
	lsls r0, r0, #1
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r2, [r4, #0x5c]
	movs r3, #2
	ldrsh r2, [r2, r3]
	b _08061268
_08061200:
	cmp r0, #0x37
	bne _0806120E
	ldrh r0, [r5, #0x10]
	movs r1, #9
	orrs r0, r1
	strh r0, [r5, #0x10]
	b _080612B4
_0806120E:
	cmp r0, #0x71
	bne _0806121E
	ldr r0, [r4, #0x5c]
	movs r1, #1
	negs r1, r1
	bl NewEfxFarAttackWithDistance
	b _080612B4
_0806121E:
	movs r0, #0x2c
	ldrsh r1, [r4, r0]
	adds r0, r2, #0
	adds r0, #0x72
	cmp r1, r0
	bne _08061274
	ldr r0, [r4, #0x5c]
	movs r1, #1
	bl sub_8061650
	ldr r0, [r4, #0x5c]
	movs r1, #1
	bl sub_80617E4
	movs r0, #1
	movs r1, #0
	movs r2, #0x10
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	ldr r0, [r4, #0x5c]
	movs r1, #1
	movs r2, #0xc
	movs r3, #0
	bl sub_806189C
	ldr r0, [r4, #0x5c]
	movs r1, #0x1d
	movs r2, #0x19
	movs r3, #1
	bl sub_806189C
	ldr r0, _08061270  @ 0x00000111
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r5, r3]
_08061268:
	movs r3, #1
	bl EkrSoundSomeBark
	b _080612B4
	.align 2, 0
_08061270: .4byte 0x00000111
_08061274:
	adds r0, r2, #0
	adds r0, #0xa6
	cmp r1, r0
	bne _08061284
	adds r0, r5, #0
	bl NewEfxHPBarLive
	b _080612B4
_08061284:
	adds r0, r2, #0
	adds r0, #0xb5
	cmp r1, r0
	bne _080612B4
	bl SpellFx_Finish
	bl EfxSpellCastSet29
	adds r0, r5, #0
	bl sub_805A2F0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #1
	negs r1, r1
	cmp r0, r1
	beq _080612AE
	ldrh r0, [r5, #0x10]
	movs r1, #2
	orrs r0, r1
	strh r0, [r5, #0x10]
_080612AE:
	adds r0, r4, #0
	bl Proc_Break
_080612B4:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END EfxReliveMain

	THUMB_FUNC_START StartSpellAnimRecover
StartSpellAnimRecover: @ 0x080612BC
	push {r4, lr}
	adds r4, r0, #0
	bl SpellFx_Begin
	bl NewEfxSpellCast
	bl SpellFx_SpellFx_ClearBG1Position
	ldr r0, _080612E0  @ ProcScr_efxRecover
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080612E0: .4byte ProcScr_efxRecover

	THUMB_FUNC_END StartSpellAnimRecover

	THUMB_FUNC_START EfxRecoverMain
EfxRecoverMain: @ 0x080612E4
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetCoreAIStruct
	adds r5, r0, #0
	bl GetAnimationStartFrameMaybe
	adds r2, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	movs r6, #0
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _0806131C
	ldr r0, [r4, #0x5c]
	bl NewEfxLiveOBJ
	movs r0, #0xb3
	lsls r0, r0, #2
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r2, [r4, #0x5c]
	movs r3, #2
	ldrsh r2, [r2, r3]
	b _080613CC
_0806131C:
	cmp r0, #0x34
	bne _08061364
	ldr r0, [r4, #0x5c]
	movs r1, #2
	bl sub_8061594
	ldr r0, [r4, #0x5c]
	movs r1, #2
	bl sub_8061774
	movs r0, #1
	movs r1, #0
	movs r2, #0x10
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	ldr r0, [r4, #0x5c]
	movs r1, #1
	movs r2, #0xc
	movs r3, #0
	bl sub_806189C
	ldr r0, [r4, #0x5c]
	movs r1, #0x23
	movs r2, #0x19
	movs r3, #1
	bl sub_806189C
	movs r0, #0x89
	lsls r0, r0, #1
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r2, [r4, #0x5c]
	movs r3, #2
	ldrsh r2, [r2, r3]
	b _080613CC
_08061364:
	cmp r0, #0x37
	bne _08061372
	ldrh r0, [r5, #0x10]
	movs r1, #9
	orrs r0, r1
	strh r0, [r5, #0x10]
	b _08061418
_08061372:
	cmp r0, #0x71
	bne _08061382
	ldr r0, [r4, #0x5c]
	movs r1, #1
	negs r1, r1
	bl NewEfxFarAttackWithDistance
	b _08061418
_08061382:
	movs r0, #0x2c
	ldrsh r1, [r4, r0]
	adds r0, r2, #0
	adds r0, #0x72
	cmp r1, r0
	bne _080613D8
	ldr r0, [r4, #0x5c]
	movs r1, #2
	bl sub_8061650
	ldr r0, [r4, #0x5c]
	movs r1, #2
	bl sub_80617E4
	movs r0, #1
	movs r1, #0
	movs r2, #0x10
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	ldr r0, [r4, #0x5c]
	movs r1, #1
	movs r2, #0xc
	movs r3, #0
	bl sub_806189C
	ldr r0, [r4, #0x5c]
	movs r1, #0x1d
	movs r2, #0x19
	movs r3, #1
	bl sub_806189C
	ldr r0, _080613D4  @ 0x00000113
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r5, r3]
_080613CC:
	movs r3, #1
	bl EkrSoundSomeBark
	b _08061418
	.align 2, 0
_080613D4: .4byte 0x00000113
_080613D8:
	adds r0, r2, #0
	adds r0, #0xa6
	cmp r1, r0
	bne _080613E8
	adds r0, r5, #0
	bl NewEfxHPBarLive
	b _08061418
_080613E8:
	adds r0, r2, #0
	adds r0, #0xb5
	cmp r1, r0
	bne _08061418
	bl SpellFx_Finish
	bl EfxSpellCastSet29
	adds r0, r5, #0
	bl sub_805A2F0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #1
	negs r1, r1
	cmp r0, r1
	beq _08061412
	ldrh r0, [r5, #0x10]
	movs r1, #2
	orrs r0, r1
	strh r0, [r5, #0x10]
_08061412:
	adds r0, r4, #0
	bl Proc_Break
_08061418:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END EfxRecoverMain

	THUMB_FUNC_START sub_8061420
sub_8061420: @ 0x08061420
	push {r4, lr}
	adds r4, r0, #0
	bl SpellFx_Begin
	bl NewEfxSpellCast
	bl SpellFx_SpellFx_ClearBG1Position
	ldr r0, _08061444  @ ProcScr_efxReblow
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08061444: .4byte ProcScr_efxReblow

	THUMB_FUNC_END sub_8061420

	THUMB_FUNC_START EfxReblowMain
EfxReblowMain: @ 0x08061448
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetCoreAIStruct
	adds r5, r0, #0
	bl GetAnimationStartFrameMaybe
	adds r2, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	movs r6, #0
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _08061488
	ldr r0, [r4, #0x5c]
	bl NewEfxLiveOBJ
	ldr r0, [r4, #0x5c]
	movs r1, #0
	bl sub_8061ACC
	movs r0, #0xb3
	lsls r0, r0, #2
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r2, [r4, #0x5c]
	movs r3, #2
	ldrsh r2, [r2, r3]
	b _08061540
_08061488:
	cmp r0, #0x34
	bne _080614D0
	ldr r0, [r4, #0x5c]
	movs r1, #0
	bl sub_8061594
	ldr r0, [r4, #0x5c]
	movs r1, #0
	bl sub_8061774
	movs r0, #1
	movs r1, #0
	movs r2, #0x10
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	ldr r0, [r4, #0x5c]
	movs r1, #1
	movs r2, #0xc
	movs r3, #0
	bl sub_806189C
	ldr r0, [r4, #0x5c]
	movs r1, #0x23
	movs r2, #0x19
	movs r3, #1
	bl sub_806189C
	movs r0, #0x87
	lsls r0, r0, #1
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r2, [r4, #0x5c]
	movs r3, #2
	ldrsh r2, [r2, r3]
	b _08061540
_080614D0:
	cmp r0, #0x37
	bne _080614DE
	ldrh r0, [r5, #0x10]
	movs r1, #9
	orrs r0, r1
	strh r0, [r5, #0x10]
	b _0806158C
_080614DE:
	cmp r0, #0x97
	bne _080614F6
	ldr r0, [r4, #0x5c]
	movs r1, #1
	bl sub_8061ACC
	ldr r0, [r4, #0x5c]
	movs r1, #1
	negs r1, r1
	bl NewEfxFarAttackWithDistance
	b _0806158C
_080614F6:
	movs r0, #0x2c
	ldrsh r1, [r4, r0]
	adds r0, r2, #0
	adds r0, #0xa1
	cmp r1, r0
	bne _0806154C
	ldr r0, [r4, #0x5c]
	movs r1, #0
	bl sub_8061650
	ldr r0, [r4, #0x5c]
	movs r1, #0
	bl sub_80617E4
	movs r0, #1
	movs r1, #0
	movs r2, #0x10
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	ldr r0, [r4, #0x5c]
	movs r1, #1
	movs r2, #0xc
	movs r3, #0
	bl sub_806189C
	ldr r0, [r4, #0x5c]
	movs r1, #0x1d
	movs r2, #0x19
	movs r3, #1
	bl sub_806189C
	ldr r0, _08061548  @ 0x0000010F
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r5, r3]
_08061540:
	movs r3, #1
	bl EkrSoundSomeBark
	b _0806158C
	.align 2, 0
_08061548: .4byte 0x0000010F
_0806154C:
	adds r0, r2, #0
	adds r0, #0xd3
	cmp r1, r0
	bne _0806155C
	adds r0, r5, #0
	bl NewEfxHPBarLive
	b _0806158C
_0806155C:
	adds r0, r2, #0
	adds r0, #0xdd
	cmp r1, r0
	bne _0806158C
	bl SpellFx_Finish
	bl EfxSpellCastSet29
	adds r0, r5, #0
	bl sub_805A2F0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #1
	negs r1, r1
	cmp r0, r1
	beq _08061586
	ldrh r0, [r5, #0x10]
	movs r1, #2
	orrs r0, r1
	strh r0, [r5, #0x10]
_08061586:
	adds r0, r4, #0
	bl Proc_Break
_0806158C:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END EfxReblowMain

	THUMB_FUNC_START sub_8061594
sub_8061594: @ 0x08061594
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r6, r1, #0
	ldr r1, _080615DC  @ gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _080615E0  @ ProcScr_efxLiveBG
	movs r1, #3
	bl Proc_Start
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	str r0, [r5, #0x44]
	cmp r6, #0
	beq _080615F4
	cmp r6, #2
	bhi _08061646
	adds r1, r5, #0
	adds r1, #0x29
	movs r0, #1
	strb r0, [r1]
	ldr r0, _080615E4  @ gUnknown_080DD8D2
	str r0, [r5, #0x48]
	ldr r0, _080615E8  @ gUnknown_08670D40
	str r0, [r5, #0x4c]
	ldr r0, _080615EC  @ gUnknown_086716A0
	str r0, [r5, #0x50]
	ldr r0, _080615F0  @ gUnknown_08670548
	movs r1, #0xa8
	lsls r1, r1, #5
	bl SpellFx_RegisterBgGfx
	b _08061646
	.align 2, 0
_080615DC: .4byte gEfxBgSemaphore
_080615E0: .4byte ProcScr_efxLiveBG
_080615E4: .4byte gUnknown_080DD8D2
_080615E8: .4byte gUnknown_08670D40
_080615EC: .4byte gUnknown_086716A0
_080615F0: .4byte gUnknown_08670548
_080615F4:
	adds r1, r5, #0
	adds r1, #0x29
	movs r0, #1
	strb r0, [r1]
	ldr r0, _0806162C  @ gUnknown_080DD8C6
	str r0, [r5, #0x48]
	ldr r0, _08061630  @ gUnknown_0866F774
	str r0, [r5, #0x4c]
	str r0, [r5, #0x50]
	ldr r0, _08061634  @ gUnknown_0866F5E4
	movs r1, #0x80
	lsls r1, r1, #3
	bl SpellFx_RegisterBgGfx
	ldr r0, _08061638  @ gEkrDistanceType
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _08061646
	ldr r0, [r5, #0x5c]
	bl GetAISSubjectId
	cmp r0, #0
	bne _0806163C
	movs r0, #1
	movs r1, #0x18
	b _08061640
	.align 2, 0
_0806162C: .4byte gUnknown_080DD8C6
_08061630: .4byte gUnknown_0866F774
_08061634: .4byte gUnknown_0866F5E4
_08061638: .4byte gEkrDistanceType
_0806163C:
	movs r0, #1
	movs r1, #0xe8
_08061640:
	movs r2, #0
	bl BG_SetPosition
_08061646:
	bl SpellFx_SetSomeColorEffect
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8061594

	THUMB_FUNC_START sub_8061650
sub_8061650: @ 0x08061650
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r6, r1, #0
	ldr r1, _08061698  @ gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0806169C  @ ProcScr_efxLiveBG
	movs r1, #3
	bl Proc_Start
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	movs r1, #0
	movs r0, #0
	strh r0, [r5, #0x2c]
	str r0, [r5, #0x44]
	adds r0, r5, #0
	adds r0, #0x29
	strb r1, [r0]
	cmp r6, #0
	beq _080616B0
	cmp r6, #2
	bhi _080616FA
	ldr r0, _080616A0  @ gUnknown_080DD8D8
	str r0, [r5, #0x48]
	ldr r0, _080616A4  @ gUnknown_08670D40
	str r0, [r5, #0x4c]
	ldr r0, _080616A8  @ gUnknown_086716A0
	str r0, [r5, #0x50]
	ldr r0, _080616AC  @ gUnknown_08670548
	movs r1, #0xa8
	lsls r1, r1, #5
	bl SpellFx_RegisterBgGfx
	b _080616FA
	.align 2, 0
_08061698: .4byte gEfxBgSemaphore
_0806169C: .4byte ProcScr_efxLiveBG
_080616A0: .4byte gUnknown_080DD8D8
_080616A4: .4byte gUnknown_08670D40
_080616A8: .4byte gUnknown_086716A0
_080616AC: .4byte gUnknown_08670548
_080616B0:
	ldr r0, _080616E0  @ gUnknown_080DD8CC
	str r0, [r5, #0x48]
	ldr r0, _080616E4  @ gUnknown_0866F774
	str r0, [r5, #0x4c]
	str r0, [r5, #0x50]
	ldr r0, _080616E8  @ gUnknown_0866F5E4
	movs r1, #0x80
	lsls r1, r1, #3
	bl SpellFx_RegisterBgGfx
	ldr r0, _080616EC  @ gEkrDistanceType
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _080616FA
	ldr r0, [r5, #0x5c]
	bl GetAISSubjectId
	cmp r0, #0
	bne _080616F0
	movs r0, #1
	movs r1, #0xe8
	b _080616F4
	.align 2, 0
_080616E0: .4byte gUnknown_080DD8CC
_080616E4: .4byte gUnknown_0866F774
_080616E8: .4byte gUnknown_0866F5E4
_080616EC: .4byte gEkrDistanceType
_080616F0:
	movs r0, #1
	movs r1, #0x18
_080616F4:
	movs r2, #0
	bl BG_SetPosition
_080616FA:
	bl SpellFx_SetSomeColorEffect
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8061650

	THUMB_FUNC_START EfxLivebgMain
EfxLivebgMain: @ 0x08061704
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl SpellFx_InterpretBgAnimScript
	lsls r0, r0, #0x10
	asrs r3, r0, #0x10
	cmp r3, #0
	blt _08061736
	ldr r1, [r4, #0x4c]
	ldr r2, [r4, #0x50]
	ldr r0, [r4, #0x5c]
	lsls r4, r3, #2
	adds r4, r4, r3
	lsls r3, r4, #4
	subs r3, r3, r4
	lsls r3, r3, #4
	adds r1, r1, r3
	adds r2, r2, r3
	bl sub_805560C
	b _08061768
_08061736:
	movs r0, #1
	negs r0, r0
	cmp r3, r0
	bne _08061768
	adds r0, r4, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #0
	bne _08061750
	bl SpellFx_ClearBG1
	bl SetDefaultColorEffects_
_08061750:
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	ldr r1, _08061770  @ gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
_08061768:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08061770: .4byte gEfxBgSemaphore

	THUMB_FUNC_END EfxLivebgMain

	THUMB_FUNC_START sub_8061774
sub_8061774: @ 0x08061774
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, _0806179C  @ gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _080617A0  @ gUnknown_085D6934
	movs r1, #3
	bl Proc_Start
	adds r1, r0, #0
	str r4, [r1, #0x5c]
	movs r0, #0
	strh r0, [r1, #0x2c]
	str r0, [r1, #0x44]
	cmp r5, #0
	bne _080617A8
	ldr r0, _080617A4  @ gUnknown_080DD8EE
	b _080617B6
	.align 2, 0
_0806179C: .4byte gEfxBgSemaphore
_080617A0: .4byte gUnknown_085D6934
_080617A4: .4byte gUnknown_080DD8EE
_080617A8:
	cmp r5, #1
	bne _080617B4
	ldr r0, _080617B0  @ gUnknown_080DD972
	b _080617B6
	.align 2, 0
_080617B0: .4byte gUnknown_080DD972
_080617B4:
	ldr r0, _080617C0  @ gUnknown_080DD9A4
_080617B6:
	str r0, [r1, #0x48]
	cmp r5, #0
	bne _080617C8
	ldr r0, _080617C4  @ gUnknown_086700D4
	b _080617D6
	.align 2, 0
_080617C0: .4byte gUnknown_080DD9A4
_080617C4: .4byte gUnknown_086700D4
_080617C8:
	cmp r5, #1
	bne _080617D4
	ldr r0, _080617D0  @ gUnknown_08672220
	b _080617D6
	.align 2, 0
_080617D0: .4byte gUnknown_08672220
_080617D4:
	ldr r0, _080617E0  @ gUnknown_08672000
_080617D6:
	str r0, [r1, #0x4c]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080617E0: .4byte gUnknown_08672000

	THUMB_FUNC_END sub_8061774

	THUMB_FUNC_START sub_80617E4
sub_80617E4: @ 0x080617E4
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, _0806180C  @ gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08061810  @ gUnknown_085D6934
	movs r1, #3
	bl Proc_Start
	adds r1, r0, #0
	str r4, [r1, #0x5c]
	movs r0, #0
	strh r0, [r1, #0x2c]
	str r0, [r1, #0x44]
	cmp r5, #0
	bne _08061818
	ldr r0, _08061814  @ gUnknown_080DD930
	b _08061826
	.align 2, 0
_0806180C: .4byte gEfxBgSemaphore
_08061810: .4byte gUnknown_085D6934
_08061814: .4byte gUnknown_080DD930
_08061818:
	cmp r5, #1
	bne _08061824
	ldr r0, _08061820  @ gUnknown_080DD972
	b _08061826
	.align 2, 0
_08061820: .4byte gUnknown_080DD972
_08061824:
	ldr r0, _08061830  @ gUnknown_080DD9A4
_08061826:
	str r0, [r1, #0x48]
	cmp r5, #0
	bne _08061838
	ldr r0, _08061834  @ gUnknown_086700D4
	b _08061846
	.align 2, 0
_08061830: .4byte gUnknown_080DD9A4
_08061834: .4byte gUnknown_086700D4
_08061838:
	cmp r5, #1
	bne _08061844
	ldr r0, _08061840  @ gUnknown_08672220
	b _08061846
	.align 2, 0
_08061840: .4byte gUnknown_08672220
_08061844:
	ldr r0, _08061850  @ gUnknown_08672000
_08061846:
	str r0, [r1, #0x4c]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08061850: .4byte gUnknown_08672000

	THUMB_FUNC_END sub_80617E4

	THUMB_FUNC_START sub_8061854
sub_8061854: @ 0x08061854
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl SpellFx_InterpretBgAnimScript
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	cmp r1, #0
	blt _0806187A
	ldr r0, [r4, #0x4c]
	lsls r1, r1, #5
	adds r0, r0, r1
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	b _08061890
_0806187A:
	movs r0, #1
	negs r0, r0
	cmp r1, r0
	bne _08061890
	ldr r1, _08061898  @ gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
_08061890:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08061898: .4byte gEfxBgSemaphore

	THUMB_FUNC_END sub_8061854

	THUMB_FUNC_START sub_806189C
sub_806189C: @ 0x0806189C
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	mov r8, r3
	ldr r1, _080618D0  @ gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _080618D4  @ gUnknown_085D6954
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	strh r5, [r0, #0x2c]
	strh r6, [r0, #0x2e]
	adds r0, #0x29
	mov r1, r8
	strb r1, [r0]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080618D0: .4byte gEfxBgSemaphore
_080618D4: .4byte gUnknown_085D6954

	THUMB_FUNC_END sub_806189C

	THUMB_FUNC_START sub_80618D8
sub_80618D8: @ 0x080618D8
	push {lr}
	adds r1, r0, #0
	ldrh r0, [r1, #0x2c]
	subs r0, #1
	strh r0, [r1, #0x2c]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _080618EE
	adds r0, r1, #0
	bl Proc_Break
_080618EE:
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80618D8

	THUMB_FUNC_START sub_80618F4
sub_80618F4: @ 0x080618F4
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	movs r0, #0x2c
	ldrsh r1, [r4, r0]
	movs r2, #0x2e
	ldrsh r0, [r4, r2]
	cmp r1, r0
	ble _0806191C
	ldr r1, _08061918  @ gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
	b _08061964
	.align 2, 0
_08061918: .4byte gEfxBgSemaphore
_0806191C:
	adds r0, r4, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #0
	bne _0806193C
	movs r0, #0x2c
	ldrsh r3, [r4, r0]
	movs r1, #0x2e
	ldrsh r0, [r4, r1]
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0x10
	bl Interpolate
	b _08061950
_0806193C:
	movs r2, #0x2c
	ldrsh r3, [r4, r2]
	movs r1, #0x2e
	ldrsh r0, [r4, r1]
	str r0, [sp]
	movs r0, #0
	movs r1, #0x10
	movs r2, #0
	bl Interpolate
_08061950:
	lsls r1, r0, #0x18
	lsrs r1, r1, #0x18
	movs r0, #1
	movs r2, #0x10
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
_08061964:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80618F4

	THUMB_FUNC_START NewEfxLiveOBJ
NewEfxLiveOBJ: @ 0x0806196C
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r1, _080619B8  @ gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _080619BC  @ ProcScr_efxLiveOBJ
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	movs r0, #0x33
	strh r0, [r4, #0x2e]
	ldr r3, _080619C0  @ gUnknown_08675114
	str r3, [sp]
	adds r0, r5, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl EfxAnimCreate1
	str r0, [r4, #0x60]
	ldr r0, _080619C4  @ gUnknown_08670528
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _080619C8  @ gUnknown_086702D4
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080619B8: .4byte gEfxBgSemaphore
_080619BC: .4byte ProcScr_efxLiveOBJ
_080619C0: .4byte gUnknown_08675114
_080619C4: .4byte gUnknown_08670528
_080619C8: .4byte gUnknown_086702D4

	THUMB_FUNC_END NewEfxLiveOBJ

	THUMB_FUNC_START sub_80619CC
sub_80619CC: @ 0x080619CC
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r1, _08061A1C  @ gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08061A20  @ ProcScr_efxReserveOBJ
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	movs r0, #0x33
	strh r0, [r4, #0x2e]
	movs r0, #0x34
	strh r0, [r4, #0x30]
	ldr r3, _08061A24  @ gUnknown_08675114
	str r3, [sp]
	adds r0, r5, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl EfxAnimCreate1
	str r0, [r4, #0x60]
	ldr r0, _08061A28  @ gUnknown_08670528
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _08061A2C  @ gUnknown_086702D4
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08061A1C: .4byte gEfxBgSemaphore
_08061A20: .4byte ProcScr_efxReserveOBJ
_08061A24: .4byte gUnknown_08675114
_08061A28: .4byte gUnknown_08670528
_08061A2C: .4byte gUnknown_086702D4

	THUMB_FUNC_END sub_80619CC

	THUMB_FUNC_START EfxLiveobjMain
EfxLiveobjMain: @ 0x08061A30
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
	bne _08061A5A
	ldr r0, _08061A60  @ gEfxBgSemaphore
	ldr r1, [r0]
	subs r1, #1
	str r1, [r0]
	ldr r0, [r4, #0x60]
	bl AnimDelete
	adds r0, r4, #0
	bl Proc_Break
_08061A5A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08061A60: .4byte gEfxBgSemaphore

	THUMB_FUNC_END EfxLiveobjMain

	THUMB_FUNC_START sub_8061A64
sub_8061A64: @ 0x08061A64
	push {r4, r5, lr}
	adds r2, r0, #0
	ldr r3, [r2, #0x60]
	ldrh r0, [r2, #0x2c]
	adds r0, #1
	movs r4, #0
	strh r0, [r2, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r5, #0x2e
	ldrsh r1, [r2, r5]
	cmp r0, r1
	bne _08061A8E
	ldr r0, _08061A94  @ gUnknown_086751A4
	str r0, [r3, #0x24]
	str r0, [r3, #0x20]
	strh r4, [r3, #6]
	strh r4, [r2, #0x2c]
	adds r0, r2, #0
	bl Proc_Break
_08061A8E:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08061A94: .4byte gUnknown_086751A4

	THUMB_FUNC_END sub_8061A64

	THUMB_FUNC_START sub_8061A98
sub_8061A98: @ 0x08061A98
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x30
	ldrsh r1, [r4, r2]
	cmp r0, r1
	bne _08061AC2
	ldr r0, _08061AC8  @ gEfxBgSemaphore
	ldr r1, [r0]
	subs r1, #1
	str r1, [r0]
	ldr r0, [r4, #0x60]
	bl AnimDelete
	adds r0, r4, #0
	bl Proc_Break
_08061AC2:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08061AC8: .4byte gEfxBgSemaphore

	THUMB_FUNC_END sub_8061A98

	THUMB_FUNC_START sub_8061ACC
sub_8061ACC: @ 0x08061ACC
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	ldr r1, _08061AFC  @ gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08061B00  @ ProcScr_efxReblowOBJ
	movs r1, #3
	bl Proc_Start
	adds r1, r0, #0
	str r5, [r1, #0x5c]
	movs r0, #0
	strh r0, [r1, #0x2c]
	adds r0, r1, #0
	adds r0, #0x29
	strb r4, [r0]
	cmp r4, #0
	bne _08061B04
	movs r0, #0x2b
	strh r0, [r1, #0x2e]
	movs r0, #0x44
	b _08061B0A
	.align 2, 0
_08061AFC: .4byte gEfxBgSemaphore
_08061B00: .4byte ProcScr_efxReblowOBJ
_08061B04:
	movs r0, #0x1f
	strh r0, [r1, #0x2e]
	movs r0, #0x3d
_08061B0A:
	strh r0, [r1, #0x30]
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8061ACC

	THUMB_FUNC_START sub_8061B14
sub_8061B14: @ 0x08061B14
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x2e
	ldrsh r1, [r4, r2]
	cmp r0, r1
	bne _08061BD6
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r4, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #0
	bne _08061B7E
	ldr r0, _08061B60  @ gUnknown_086766C0
	mov r8, r0
	ldr r7, _08061B64  @ gUnknown_08677CC0
	ldr r0, _08061B68  @ gEkrDistanceType
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _08061B6C
	ldr r0, [r4, #0x5c]
	bl GetAISSubjectId
	movs r5, #0x88
	cmp r0, #0
	bne _08061B7A
	movs r5, #0x68
	b _08061B7A
	.align 2, 0
_08061B60: .4byte gUnknown_086766C0
_08061B64: .4byte gUnknown_08677CC0
_08061B68: .4byte gEkrDistanceType
_08061B6C:
	ldr r0, [r4, #0x5c]
	bl GetAISSubjectId
	movs r5, #0x70
	cmp r0, #0
	bne _08061B7A
	movs r5, #0x80
_08061B7A:
	movs r6, #0x4e
	b _08061BBC
_08061B7E:
	ldr r2, _08061BA0  @ gUnknown_08676734
	mov r8, r2
	ldr r7, _08061BA4  @ gUnknown_08677D34
	ldr r0, _08061BA8  @ gEkrDistanceType
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _08061BAC
	ldr r0, [r4, #0x5c]
	bl GetAISSubjectId
	movs r5, #0x4c
	cmp r0, #0
	bne _08061BBA
	movs r5, #0xa4
	b _08061BBA
	.align 2, 0
_08061BA0: .4byte gUnknown_08676734
_08061BA4: .4byte gUnknown_08677D34
_08061BA8: .4byte gEkrDistanceType
_08061BAC:
	ldr r0, [r4, #0x5c]
	bl GetAISSubjectId
	movs r5, #0x64
	cmp r0, #0
	bne _08061BBA
	movs r5, #0x8c
_08061BBA:
	movs r6, #0x40
_08061BBC:
	ldr r0, [r4, #0x5c]
	mov r2, r8
	str r2, [sp]
	adds r1, r7, #0
	adds r3, r7, #0
	bl EfxAnimCreate1
	str r0, [r4, #0x60]
	strh r5, [r0, #2]
	strh r6, [r0, #4]
	adds r0, r4, #0
	bl Proc_Break
_08061BD6:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8061B14

	THUMB_FUNC_START sub_8061BE4
sub_8061BE4: @ 0x08061BE4
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x30
	ldrsh r1, [r4, r2]
	cmp r0, r1
	bne _08061C0E
	ldr r0, _08061C14  @ gEfxBgSemaphore
	ldr r1, [r0]
	subs r1, #1
	str r1, [r0]
	ldr r0, [r4, #0x60]
	bl AnimDelete
	adds r0, r4, #0
	bl Proc_Break
_08061C0E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08061C14: .4byte gEfxBgSemaphore

	THUMB_FUNC_END sub_8061BE4

	THUMB_FUNC_START sub_8061C18
sub_8061C18: @ 0x08061C18
	push {r4, lr}
	adds r4, r0, #0
	bl SpellFx_Begin
	bl NewEfxSpellCast
	bl SpellFx_SpellFx_ClearBG1Position
	ldr r0, _08061C44  @ ProcScr_efxReserve
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r2, #0
	movs r1, #0
	strh r1, [r0, #0x2c]
	adds r0, #0x29
	strb r2, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08061C44: .4byte ProcScr_efxReserve

	THUMB_FUNC_END sub_8061C18

	THUMB_FUNC_START sub_8061C48
sub_8061C48: @ 0x08061C48
	push {r4, lr}
	adds r4, r0, #0
	bl SpellFx_Begin
	bl NewEfxSpellCast
	bl SpellFx_SpellFx_ClearBG1Position
	ldr r0, _08061C74  @ ProcScr_efxReserve
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	adds r0, #0x29
	movs r1, #1
	strb r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08061C74: .4byte ProcScr_efxReserve

	THUMB_FUNC_END sub_8061C48

	THUMB_FUNC_START EfxReserveMain
EfxReserveMain: @ 0x08061C78
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	cmp r1, #1
	bne _08061CA6
	ldr r0, [r4, #0x5c]
	bl sub_80619CC
	movs r0, #0xb3
	lsls r0, r0, #2
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r2, [r4, #0x5c]
	movs r3, #2
	ldrsh r2, [r2, r3]
	movs r3, #1
	bl EkrSoundSomeBark
	b _08061D1E
_08061CA6:
	cmp r1, #0x34
	bne _08061CBE
	ldr r0, [r4, #0x5c]
	bl sub_8061D28
	ldr r0, [r4, #0x5c]
	adds r1, r4, #0
	adds r1, #0x29
	ldrb r1, [r1]
	bl sub_8061DF8
	b _08061D1E
_08061CBE:
	cmp r1, #0xb7
	bne _08061D0A
	movs r0, #0x8a
	lsls r0, r0, #1
	movs r1, #0x80
	lsls r1, r1, #1
	movs r2, #0x78
	movs r3, #0
	bl EkrSoundSomeBark
	ldr r0, [r4, #0x5c]
	bl sub_8061E8C
	ldr r0, [r4, #0x5c]
	adds r1, r4, #0
	adds r1, #0x29
	ldrb r1, [r1]
	bl sub_8062058
	movs r0, #1
	movs r1, #0
	movs r2, #0x10
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	ldr r0, [r4, #0x5c]
	movs r1, #1
	movs r2, #0x14
	movs r3, #0
	bl sub_806189C
	ldr r0, [r4, #0x5c]
	movs r1, #0xb4
	movs r2, #0x28
	movs r3, #1
	bl sub_806189C
	b _08061D1E
_08061D0A:
	ldr r0, _08061D24  @ 0x000001C5
	cmp r1, r0
	bne _08061D1E
	bl SpellFx_Finish
	bl EfxSpellCastSet29
	adds r0, r4, #0
	bl Proc_Break
_08061D1E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08061D24: .4byte 0x000001C5

	THUMB_FUNC_END EfxReserveMain

	THUMB_FUNC_START sub_8061D28
sub_8061D28: @ 0x08061D28
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _08061D64  @ gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08061D68  @ ProcScr_efxReserveBG
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r1, [r0, #0x44]
	ldr r1, _08061D6C  @ gUnknown_080DDA3E
	str r1, [r0, #0x48]
	ldr r1, _08061D70  @ gUnknown_085D69FC
	str r1, [r0, #0x4c]
	str r1, [r0, #0x50]
	ldr r0, _08061D74  @ gUnknown_0866F5E4
	movs r1, #0x80
	lsls r1, r1, #3
	bl SpellFx_RegisterBgGfx
	bl SpellFx_SetSomeColorEffect
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08061D64: .4byte gEfxBgSemaphore
_08061D68: .4byte ProcScr_efxReserveBG
_08061D6C: .4byte gUnknown_080DDA3E
_08061D70: .4byte gUnknown_085D69FC
_08061D74: .4byte gUnknown_0866F5E4

	THUMB_FUNC_END sub_8061D28

	THUMB_FUNC_START EfxReservebgMain
EfxReservebgMain: @ 0x08061D78
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetCoreAIStruct
	adds r6, r0, #0
	adds r0, r4, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl SpellFx_InterpretBgAnimScript
	lsls r0, r0, #0x10
	asrs r5, r0, #0x10
	cmp r5, #0
	blt _08061DD0
	ldr r1, [r4, #0x4c]
	ldr r2, [r4, #0x50]
	lsls r0, r5, #2
	adds r1, r0, r1
	ldr r1, [r1]
	adds r0, r0, r2
	ldr r2, [r0]
	adds r0, r6, #0
	bl SpellFx_WriteBgMap
	ldr r0, _08061DC8  @ gUnknown_080DDA50
	lsls r1, r5, #1
	adds r0, r1, r0
	ldrh r0, [r0]
	ldr r2, _08061DCC  @ gUnknown_080DDA58
	adds r1, r1, r2
	ldrh r2, [r1]
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #0
	bl EkrSoundSomeBark
	b _08061DEE
	.align 2, 0
_08061DC8: .4byte gUnknown_080DDA50
_08061DCC: .4byte gUnknown_080DDA58
_08061DD0:
	movs r0, #1
	negs r0, r0
	cmp r5, r0
	bne _08061DEE
	bl SpellFx_ClearBG1
	ldr r1, _08061DF4  @ gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SetDefaultColorEffects_
	adds r0, r4, #0
	bl Proc_Break
_08061DEE:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08061DF4: .4byte gEfxBgSemaphore

	THUMB_FUNC_END EfxReservebgMain

	THUMB_FUNC_START sub_8061DF8
sub_8061DF8: @ 0x08061DF8
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, _08061E24  @ gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08061E28  @ gUnknown_085D6A0C
	movs r1, #3
	bl Proc_Start
	adds r1, r0, #0
	str r4, [r1, #0x5c]
	movs r0, #0
	strh r0, [r1, #0x2c]
	str r0, [r1, #0x44]
	ldr r0, _08061E2C  @ gUnknown_080DDA70
	str r0, [r1, #0x48]
	cmp r5, #0
	bne _08061E34
	ldr r0, _08061E30  @ gUnknown_08678720
	b _08061E36
	.align 2, 0
_08061E24: .4byte gEfxBgSemaphore
_08061E28: .4byte gUnknown_085D6A0C
_08061E2C: .4byte gUnknown_080DDA70
_08061E30: .4byte gUnknown_08678720
_08061E34:
	ldr r0, _08061E40  @ gUnknown_08678920
_08061E36:
	str r0, [r1, #0x4c]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08061E40: .4byte gUnknown_08678920

	THUMB_FUNC_END sub_8061DF8

	THUMB_FUNC_START sub_8061E44
sub_8061E44: @ 0x08061E44
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl SpellFx_InterpretBgAnimScript
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	cmp r1, #0
	blt _08061E6A
	ldr r0, [r4, #0x4c]
	lsls r1, r1, #5
	adds r0, r0, r1
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	b _08061E80
_08061E6A:
	movs r0, #1
	negs r0, r0
	cmp r1, r0
	bne _08061E80
	ldr r1, _08061E88  @ gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
_08061E80:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08061E88: .4byte gEfxBgSemaphore

	THUMB_FUNC_END sub_8061E44

	THUMB_FUNC_START sub_8061E8C
sub_8061E8C: @ 0x08061E8C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r5, r0, #0
	ldr r1, _08061F58  @ gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08061F5C  @ gUnknown_085D6A2C
	movs r1, #3
	bl Proc_Start
	str r5, [r0, #0x5c]
	movs r1, #0
	mov r8, r1
	mov r1, r8
	strh r1, [r0, #0x2c]
	mov r1, r8
	str r1, [r0, #0x44]
	ldr r1, _08061F60  @ gUnknown_080DDB82
	str r1, [r0, #0x48]
	ldr r1, _08061F64  @ gUnknown_085D6A44
	str r1, [r0, #0x4c]
	str r1, [r0, #0x50]
	ldr r0, _08061F68  @ gUnknown_08670548
	movs r1, #0xa8
	lsls r1, r1, #5
	bl SpellFx_RegisterBgGfx
	ldr r3, _08061F6C  @ gLCDControlBuffer
	ldrb r2, [r3, #0xc]
	movs r1, #4
	negs r1, r1
	adds r0, r1, #0
	ands r0, r2
	strb r0, [r3, #0xc]
	ldrb r2, [r3, #0x14]
	adds r0, r1, #0
	ands r0, r2
	movs r2, #1
	orrs r0, r2
	strb r0, [r3, #0x14]
	ldrb r0, [r3, #0x10]
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	strb r1, [r3, #0x10]
	ldrb r0, [r3, #0x18]
	movs r1, #3
	orrs r0, r1
	strb r0, [r3, #0x18]
	bl sub_8055980
	ldrh r1, [r5, #8]
	ldr r7, _08061F70  @ 0x0000F3FF
	adds r0, r7, #0
	ands r0, r1
	movs r1, #0x80
	lsls r1, r1, #3
	adds r6, r1, #0
	orrs r0, r6
	strh r0, [r5, #8]
	ldr r4, _08061F74  @ gUnknown_02000010
	adds r0, r5, #0
	bl GetAISSubjectId
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r2, [r0]
	cmp r2, #0
	beq _08061F26
	ldrh r1, [r2, #8]
	adds r0, r7, #0
	ands r0, r1
	orrs r0, r6
	strh r0, [r2, #8]
_08061F26:
	bl SpellFx_SetSomeColorEffect
	mov r0, r8
	str r0, [sp]
	movs r0, #0
	movs r1, #1
	movs r2, #0
	movs r3, #0
	bl SetBlendTargetA
	mov r1, r8
	str r1, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #1
	bl SetBlendTargetB
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08061F58: .4byte gEfxBgSemaphore
_08061F5C: .4byte gUnknown_085D6A2C
_08061F60: .4byte gUnknown_080DDB82
_08061F64: .4byte gUnknown_085D6A44
_08061F68: .4byte gUnknown_08670548
_08061F6C: .4byte gLCDControlBuffer
_08061F70: .4byte 0x0000F3FF
_08061F74: .4byte gUnknown_02000010

	THUMB_FUNC_END sub_8061E8C

	THUMB_FUNC_START sub_8061F78
sub_8061F78: @ 0x08061F78
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r6, [r5, #0x5c]
	adds r0, r6, #0
	bl GetCoreAIStruct
	adds r7, r0, #0
	ldr r4, _08061FD4  @ gUnknown_02000010
	adds r0, r6, #0
	bl GetAISSubjectId
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r4, [r0]
	cmp r4, #0
	beq _08061FA8
	ldrh r0, [r4, #8]
	ldr r1, _08061FD8  @ 0x0000F3FF
	ands r1, r0
	movs r2, #0x80
	lsls r2, r2, #3
	adds r0, r2, #0
	orrs r1, r0
	strh r1, [r4, #8]
_08061FA8:
	adds r0, r5, #0
	adds r0, #0x2c
	adds r1, r5, #0
	adds r1, #0x44
	ldr r2, [r5, #0x48]
	bl SpellFx_InterpretBgAnimScript
	lsls r0, r0, #0x10
	asrs r3, r0, #0x10
	cmp r3, #0
	blt _08061FDC
	ldr r1, [r5, #0x4c]
	ldr r2, [r5, #0x50]
	lsls r0, r3, #2
	adds r1, r0, r1
	ldr r1, [r1]
	adds r0, r0, r2
	ldr r2, [r0]
	adds r0, r7, #0
	bl SpellFx_WriteBgMap
	b _08062046
	.align 2, 0
_08061FD4: .4byte gUnknown_02000010
_08061FD8: .4byte 0x0000F3FF
_08061FDC:
	movs r0, #1
	negs r0, r0
	cmp r3, r0
	bne _08062046
	bl SpellFx_ClearBG1
	ldr r1, _0806204C  @ gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	ldr r3, _08062050  @ gLCDControlBuffer
	ldrb r2, [r3, #0xc]
	movs r1, #4
	negs r1, r1
	adds r0, r1, #0
	ands r0, r2
	strb r0, [r3, #0xc]
	ldrb r2, [r3, #0x10]
	adds r0, r1, #0
	ands r0, r2
	movs r2, #1
	orrs r0, r2
	strb r0, [r3, #0x10]
	ldrb r0, [r3, #0x14]
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	strb r1, [r3, #0x14]
	ldrb r0, [r3, #0x18]
	movs r1, #3
	orrs r0, r1
	strb r0, [r3, #0x18]
	ldrh r1, [r6, #8]
	ldr r3, _08062054  @ 0x0000F3FF
	adds r0, r3, #0
	ands r0, r1
	movs r1, #0x80
	lsls r1, r1, #4
	adds r2, r1, #0
	orrs r0, r2
	strh r0, [r6, #8]
	cmp r4, #0
	beq _0806203C
	ldrh r1, [r4, #8]
	adds r0, r3, #0
	ands r0, r1
	orrs r0, r2
	strh r0, [r4, #8]
_0806203C:
	bl SetDefaultColorEffects_
	adds r0, r5, #0
	bl Proc_Break
_08062046:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806204C: .4byte gEfxBgSemaphore
_08062050: .4byte gLCDControlBuffer
_08062054: .4byte 0x0000F3FF

	THUMB_FUNC_END sub_8061F78

	THUMB_FUNC_START sub_8062058
sub_8062058: @ 0x08062058
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, _08062084  @ gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08062088  @ gUnknown_085D6A48
	movs r1, #3
	bl Proc_Start
	adds r1, r0, #0
	str r4, [r1, #0x5c]
	movs r0, #0
	strh r0, [r1, #0x2c]
	str r0, [r1, #0x44]
	ldr r0, _0806208C  @ gUnknown_080DDB9A
	str r0, [r1, #0x48]
	cmp r5, #0
	bne _08062094
	ldr r0, _08062090  @ gUnknown_086700D4
	b _08062096
	.align 2, 0
_08062084: .4byte gEfxBgSemaphore
_08062088: .4byte gUnknown_085D6A48
_0806208C: .4byte gUnknown_080DDB9A
_08062090: .4byte gUnknown_086700D4
_08062094:
	ldr r0, _080620A0  @ gUnknown_08678B20
_08062096:
	str r0, [r1, #0x4c]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080620A0: .4byte gUnknown_08678B20

	THUMB_FUNC_END sub_8062058

	THUMB_FUNC_START sub_80620A4
sub_80620A4: @ 0x080620A4
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl SpellFx_InterpretBgAnimScript
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	cmp r1, #0
	blt _080620CA
	ldr r0, [r4, #0x4c]
	lsls r1, r1, #5
	adds r0, r0, r1
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	b _080620E0
_080620CA:
	movs r0, #1
	negs r0, r0
	cmp r1, r0
	bne _080620E0
	ldr r1, _080620E8  @ gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
_080620E0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080620E8: .4byte gEfxBgSemaphore

	THUMB_FUNC_END sub_80620A4

	THUMB_FUNC_START sub_80620EC
sub_80620EC: @ 0x080620EC
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl NewEfxSpellCast
	bl SpellFx_SpellFx_ClearBG1Position
	ldr r0, _08062124  @ ProcScr_efxRest
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
_08062124: .4byte ProcScr_efxRest

	THUMB_FUNC_END sub_80620EC

	THUMB_FUNC_START EfxRestMain
EfxRestMain: @ 0x08062128
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetCoreAIStruct
	adds r6, r0, #0
	bl GetAnimationStartFrameMaybe
	adds r5, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	movs r1, #0
	mov r8, r1
	movs r7, #0
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _0806215E
	ldr r0, [r4, #0x5c]
	movs r1, #1
	negs r1, r1
	bl NewEfxFarAttackWithDistance
_0806215E:
	movs r2, #0x2c
	ldrsh r1, [r4, r2]
	adds r0, r5, #1
	cmp r1, r0
	bne _080621D4
	adds r0, r6, #0
	bl sub_80622A0
	movs r5, #8
	str r5, [sp]
	str r7, [sp, #4]
	adds r0, r6, #0
	movs r1, #0x28
	movs r2, #0x1e
	movs r3, #0x10
	bl NewEfxALPHA
	movs r4, #0x10
	str r4, [sp]
	str r7, [sp, #4]
	adds r0, r6, #0
	movs r1, #0x47
	movs r2, #0x1e
	movs r3, #8
	bl NewEfxALPHA
	str r5, [sp]
	str r7, [sp, #4]
	adds r0, r6, #0
	movs r1, #0x66
	movs r2, #0x1e
	movs r3, #0x10
	bl NewEfxALPHA
	str r4, [sp]
	str r7, [sp, #4]
	adds r0, r6, #0
	movs r1, #0x85
	movs r2, #0x1e
	movs r3, #8
	bl NewEfxALPHA
	str r7, [sp]
	str r7, [sp, #4]
	adds r0, r6, #0
	movs r1, #0xa4
	movs r2, #0x3c
	movs r3, #0x10
	bl NewEfxALPHA
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #2
	ldrsh r2, [r6, r0]
	movs r0, #0xfd
	movs r3, #1
	bl EkrSoundSomeBark
	b _08062294
_080621D4:
	adds r0, r5, #0
	adds r0, #0x50
	cmp r1, r0
	bne _080621E4
	adds r0, r6, #0
	bl sub_8062358
	b _08062294
_080621E4:
	adds r0, r5, #0
	adds r0, #0xa4
	cmp r1, r0
	bne _080621FA
	adds r0, r6, #0
	movs r1, #1
	movs r2, #5
	movs r3, #0
	bl NewEfxFlashUnit
	b _08062294
_080621FA:
	adds r0, r5, #0
	adds r0, #0xc8
	cmp r1, r0
	bne _08062274
	ldrh r0, [r6, #0x10]
	movs r1, #9
	orrs r0, r1
	strh r0, [r6, #0x10]
	adds r0, r4, #0
	adds r0, #0x29
	ldrb r1, [r0]
	adds r0, r6, #0
	bl sub_8055518
	adds r0, r6, #0
	bl GetAISSubjectId
	cmp r0, #0
	bne _08062228
	ldr r0, _08062224  @ gpEkrBattleUnitLeft
	b _0806222A
	.align 2, 0
_08062224: .4byte gpEkrBattleUnitLeft
_08062228:
	ldr r0, _0806226C  @ gpEkrBattleUnitRight
_0806222A:
	ldr r4, [r0]
	adds r0, r4, #0
	adds r0, #0x30
	ldrb r1, [r0]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #0xb
	bne _08062260
	adds r0, r6, #0
	movs r1, #0
	bl SetUnitEfxDebuff
	movs r0, #0xb
	ldrsb r0, [r4, r0]
	bl GetUnit
	adds r4, r0, #0
	ldr r0, [r4, #0xc]
	ldr r1, _08062270  @ 0xFFFFFBBD
	ands r0, r1
	str r0, [r4, #0xc]
	bl RefreshEntityBmMaps
	bl RefreshUnitSprites
	bl MU_EndAll
_08062260:
	adds r0, r6, #0
	movs r1, #0
	bl SetUnitEfxDebuff
	b _08062294
	.align 2, 0
_0806226C: .4byte gpEkrBattleUnitRight
_08062270: .4byte 0xFFFFFBBD
_08062274:
	movs r2, #0x96
	lsls r2, r2, #1
	adds r0, r5, r2
	cmp r1, r0
	bne _08062294
	ldrh r0, [r6, #0x10]
	movs r1, #2
	orrs r0, r1
	strh r0, [r6, #0x10]
	bl SpellFx_Finish
	bl EfxSpellCastSet29
	adds r0, r4, #0
	bl Proc_Break
_08062294:
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END EfxRestMain

	THUMB_FUNC_START sub_80622A0
sub_80622A0: @ 0x080622A0
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _080622DC  @ gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _080622E0  @ gUnknown_085D6A80
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r1, [r0, #0x44]
	ldr r1, _080622E4  @ gUnknown_080DDC8A
	str r1, [r0, #0x48]
	ldr r1, _080622E8  @ gUnknown_085D6A98
	str r1, [r0, #0x4c]
	str r1, [r0, #0x50]
	ldr r1, _080622EC  @ gUnknown_085D6ACC
	str r1, [r0, #0x54]
	ldr r0, _080622F0  @ gUnknown_0867B5A4
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	bl SpellFx_SetSomeColorEffect
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080622DC: .4byte gEfxBgSemaphore
_080622E0: .4byte gUnknown_085D6A80
_080622E4: .4byte gUnknown_080DDC8A
_080622E8: .4byte gUnknown_085D6A98
_080622EC: .4byte gUnknown_085D6ACC
_080622F0: .4byte gUnknown_0867B5A4

	THUMB_FUNC_END sub_80622A0

	THUMB_FUNC_START sub_80622F4
sub_80622F4: @ 0x080622F4
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl SpellFx_InterpretBgAnimScript
	lsls r0, r0, #0x10
	asrs r3, r0, #0x10
	cmp r3, #0
	blt _08062330
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
	b _0806234E
_08062330:
	movs r0, #1
	negs r0, r0
	cmp r3, r0
	bne _0806234E
	bl SpellFx_ClearBG1
	ldr r1, _08062354  @ gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SetDefaultColorEffects_
	adds r0, r4, #0
	bl Proc_Break
_0806234E:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08062354: .4byte gEfxBgSemaphore

	THUMB_FUNC_END sub_80622F4

	THUMB_FUNC_START sub_8062358
sub_8062358: @ 0x08062358
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r1, _08062394  @ gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08062398  @ ProcScr_efxRestOBJ
	movs r1, #3
	bl Proc_Start
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	ldr r3, _0806239C  @ gUnknown_0867EE04
	str r3, [sp]
	adds r0, r4, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl EfxAnimCreate1
	adds r6, r0, #0
	str r6, [r5, #0x60]
	adds r0, r4, #0
	bl GetAISSubjectId
	cmp r0, #0
	bne _080623A0
	ldrh r0, [r6, #2]
	subs r0, #8
	b _080623A4
	.align 2, 0
_08062394: .4byte gEfxBgSemaphore
_08062398: .4byte ProcScr_efxRestOBJ
_0806239C: .4byte gUnknown_0867EE04
_080623A0:
	ldrh r0, [r6, #2]
	adds r0, #8
_080623A4:
	strh r0, [r6, #2]
	ldrh r0, [r6, #4]
	subs r0, #8
	strh r0, [r6, #4]
	ldr r0, _080623C8  @ gUnknown_0868716C
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _080623CC  @ gUnknown_08686F84
	movs r1, #0x80
	lsls r1, r1, #4
	bl SpellFx_RegisterObjGfx
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080623C8: .4byte gUnknown_0868716C
_080623CC: .4byte gUnknown_08686F84

	THUMB_FUNC_END sub_8062358

	THUMB_FUNC_START sub_80623D0
sub_80623D0: @ 0x080623D0
	ldr r1, _080623DC  @ gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bx lr
	.align 2, 0
_080623DC: .4byte gEfxBgSemaphore

	THUMB_FUNC_END sub_80623D0

	THUMB_FUNC_START StartSpellAnimSilence
StartSpellAnimSilence: @ 0x080623E0
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl NewEfxSpellCast
	bl SpellFx_SpellFx_ClearBG1Position
	ldr r0, _08062418  @ gUnknown_085D6B20
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
_08062418: .4byte gUnknown_085D6B20

	THUMB_FUNC_END StartSpellAnimSilence

	THUMB_FUNC_START sub_806241C
sub_806241C: @ 0x0806241C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetCoreAIStruct
	adds r5, r0, #0
	bl GetAnimationStartFrameMaybe
	adds r6, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	movs r1, #0
	mov r8, r1
	movs r7, #0
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _08062460
	ldr r0, [r4, #0x5c]
	bl sub_8062608
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r0, [r4, #0x5c]
	movs r3, #2
	ldrsh r2, [r0, r3]
	movs r0, #0xfa
	movs r3, #1
	bl EkrSoundSomeBark
_08062460:
	movs r1, #0x2c
	ldrsh r0, [r4, r1]
	cmp r0, #0x29
	bne _08062474
	ldr r0, [r4, #0x5c]
	movs r1, #1
	negs r1, r1
	bl NewEfxFarAttackWithDistance
	b _08062518
_08062474:
	movs r3, #0x2c
	ldrsh r1, [r4, r3]
	adds r0, r6, #0
	adds r0, #0x44
	cmp r1, r0
	bne _080624A8
	ldr r0, [r4, #0x5c]
	bl sub_8062524
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #2
	ldrsh r2, [r5, r0]
	movs r0, #0xfb
	movs r3, #1
	bl EkrSoundSomeBark
	ldr r0, [r4, #0x5c]
	str r7, [sp]
	str r7, [sp, #4]
	movs r1, #0x42
	movs r2, #0x14
	movs r3, #0x10
	bl NewEfxALPHA
	b _08062518
_080624A8:
	adds r0, r6, #0
	adds r0, #0x86
	cmp r1, r0
	bne _080624FA
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r5, r3]
	movs r0, #0xfc
	movs r3, #1
	bl EkrSoundSomeBark
	bl StopBGM1
	ldrh r0, [r5, #0x10]
	movs r1, #9
	orrs r0, r1
	strh r0, [r5, #0x10]
	adds r6, r4, #0
	adds r6, #0x29
	ldrb r1, [r6]
	adds r0, r5, #0
	bl sub_8055518
	ldr r0, [r4, #0x5c]
	movs r1, #0xa
	bl StartSpellBG_FLASH
	ldrb r0, [r6]
	cmp r0, #0
	bne _08062518
	adds r0, r5, #0
	bl GettUnitEfxDebuff
	cmp r0, #0
	bne _08062518
	adds r0, r5, #0
	movs r1, #3
	bl SetUnitEfxDebuff
	b _08062518
_080624FA:
	adds r0, r6, #0
	adds r0, #0x9e
	cmp r1, r0
	bne _08062518
	ldrh r0, [r5, #0x10]
	movs r1, #2
	orrs r0, r1
	strh r0, [r5, #0x10]
	bl SpellFx_Finish
	bl EfxSpellCastSet29
	adds r0, r4, #0
	bl Proc_Break
_08062518:
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_806241C

	THUMB_FUNC_START sub_8062524
sub_8062524: @ 0x08062524
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r1, _08062584  @ gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08062588  @ gUnknown_085D6B38
	movs r1, #3
	bl Proc_Start
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	str r0, [r5, #0x44]
	ldr r0, _0806258C  @ gUnknown_080DDCE6
	str r0, [r5, #0x48]
	ldr r0, _08062590  @ gUnknown_085D6B50
	str r0, [r5, #0x4c]
	str r0, [r5, #0x50]
	ldr r0, _08062594  @ gUnknown_08680DC0
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	ldr r0, _08062598  @ gUnknown_0867EEB4
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	bl SpellFx_SetSomeColorEffect
	ldr r0, _0806259C  @ gEkrDistanceType
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _080625AA
	ldr r0, [r5, #0x5c]
	bl GetAISSubjectId
	cmp r0, #0
	bne _080625A0
	movs r0, #1
	movs r1, #0xe8
	movs r2, #0
	bl BG_SetPosition
	b _080625AA
	.align 2, 0
_08062584: .4byte gEfxBgSemaphore
_08062588: .4byte gUnknown_085D6B38
_0806258C: .4byte gUnknown_080DDCE6
_08062590: .4byte gUnknown_085D6B50
_08062594: .4byte gUnknown_08680DC0
_08062598: .4byte gUnknown_0867EEB4
_0806259C: .4byte gEkrDistanceType
_080625A0:
	movs r0, #1
	movs r1, #0x18
	movs r2, #0
	bl BG_SetPosition
_080625AA:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8062524

	THUMB_FUNC_START sub_80625B0
sub_80625B0: @ 0x080625B0
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl SpellFx_InterpretBgAnimScript
	lsls r0, r0, #0x10
	asrs r2, r0, #0x10
	cmp r2, #0
	blt _080625DE
	ldr r1, [r4, #0x4c]
	ldr r3, [r4, #0x50]
	ldr r0, [r4, #0x5c]
	lsls r2, r2, #2
	adds r1, r2, r1
	ldr r1, [r1]
	adds r2, r2, r3
	ldr r2, [r2]
	bl SpellFx_WriteBgMap
	b _080625FC
_080625DE:
	movs r0, #1
	negs r0, r0
	cmp r2, r0
	bne _080625FC
	bl SpellFx_ClearBG1
	ldr r1, _08062604  @ gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SetDefaultColorEffects_
	adds r0, r4, #0
	bl Proc_Break
_080625FC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08062604: .4byte gEfxBgSemaphore

	THUMB_FUNC_END sub_80625B0

	THUMB_FUNC_START sub_8062608
sub_8062608: @ 0x08062608
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r1, _0806264C  @ gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08062650  @ gUnknown_085D6B98
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	ldr r3, _08062654  @ gUnknown_08680FFC
	str r3, [sp]
	adds r0, r5, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl EfxAnimCreate1
	str r0, [r4, #0x60]
	ldr r0, _08062658  @ gUnknown_08680DC0
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _0806265C  @ gUnknown_086808A0
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806264C: .4byte gEfxBgSemaphore
_08062650: .4byte gUnknown_085D6B98
_08062654: .4byte gUnknown_08680FFC
_08062658: .4byte gUnknown_08680DC0
_0806265C: .4byte gUnknown_086808A0

	THUMB_FUNC_END sub_8062608

	THUMB_FUNC_START sub_8062660
sub_8062660: @ 0x08062660
	push {lr}
	ldr r0, [r0, #0x60]
	bl AnimDelete
	ldr r1, _08062674  @ gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_08062674: .4byte gEfxBgSemaphore

	THUMB_FUNC_END sub_8062660

	THUMB_FUNC_START StartSpellAnimSleep
StartSpellAnimSleep: @ 0x08062678
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl NewEfxSpellCast
	bl SpellFx_SpellFx_ClearBG1Position
	ldr r0, _080626B0  @ gUnknown_085D6BB8
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
_080626B0: .4byte gUnknown_085D6BB8

	THUMB_FUNC_END StartSpellAnimSleep

	THUMB_FUNC_START sub_80626B4
sub_80626B4: @ 0x080626B4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetCoreAIStruct
	adds r5, r0, #0
	bl GetAnimationStartFrameMaybe
	adds r6, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	movs r1, #0
	mov r8, r1
	movs r7, #0
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _080626F8
	ldr r0, [r4, #0x5c]
	bl sub_8062898
	ldr r0, _0806274C  @ 0x0000011B
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r2, [r4, #0x5c]
	movs r3, #2
	ldrsh r2, [r2, r3]
	movs r3, #1
	bl EkrSoundSomeBark
_080626F8:
	movs r1, #0x2c
	ldrsh r0, [r4, r1]
	cmp r0, #0x64
	bne _0806270A
	ldr r0, [r4, #0x5c]
	movs r1, #1
	negs r1, r1
	bl NewEfxFarAttackWithDistance
_0806270A:
	movs r2, #0x2c
	ldrsh r1, [r4, r2]
	adds r0, r6, #0
	adds r0, #0x82
	cmp r1, r0
	bne _08062750
	adds r0, r5, #0
	bl sub_80628F0
	adds r0, r5, #0
	bl sub_8062944
	ldr r0, [r4, #0x5c]
	bl sub_80627B4
	movs r0, #0x10
	str r0, [sp]
	str r7, [sp, #4]
	adds r0, r5, #0
	movs r1, #0
	movs r2, #0x14
	movs r3, #0
	bl NewEfxALPHA
	str r7, [sp]
	str r7, [sp, #4]
	adds r0, r5, #0
	movs r1, #0xe6
	movs r2, #0x14
	movs r3, #0x10
	bl NewEfxALPHA
	b _080627A6
	.align 2, 0
_0806274C: .4byte 0x0000011B
_08062750:
	movs r3, #0xa5
	lsls r3, r3, #1
	adds r0, r6, r3
	cmp r1, r0
	bne _08062786
	ldrh r0, [r5, #0x10]
	movs r1, #9
	orrs r0, r1
	strh r0, [r5, #0x10]
	adds r4, #0x29
	ldrb r1, [r4]
	adds r0, r5, #0
	bl sub_8055518
	ldrb r0, [r4]
	cmp r0, #0
	bne _080627A6
	adds r0, r5, #0
	bl GettUnitEfxDebuff
	cmp r0, #0
	bne _080627A6
	adds r0, r5, #0
	movs r1, #2
	bl SetUnitEfxDebuff
	b _080627A6
_08062786:
	movs r2, #0xb9
	lsls r2, r2, #1
	adds r0, r6, r2
	cmp r1, r0
	bne _080627A6
	ldrh r0, [r5, #0x10]
	movs r1, #2
	orrs r0, r1
	strh r0, [r5, #0x10]
	bl SpellFx_Finish
	bl EfxSpellCastSet29
	adds r0, r4, #0
	bl Proc_Break
_080627A6:
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80626B4

	THUMB_FUNC_START sub_80627B4
sub_80627B4: @ 0x080627B4
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r1, _08062814  @ gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08062818  @ gUnknown_085D6BD0
	movs r1, #3
	bl Proc_Start
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	str r0, [r5, #0x44]
	ldr r0, _0806281C  @ gUnknown_080DDD58
	str r0, [r5, #0x48]
	ldr r0, _08062820  @ gUnknown_085D6BE8
	str r0, [r5, #0x4c]
	str r0, [r5, #0x50]
	ldr r0, _08062824  @ gUnknown_086861A4
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	ldr r0, _08062828  @ gUnknown_086852D8
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	bl SpellFx_SetSomeColorEffect
	ldr r0, _0806282C  @ gEkrDistanceType
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _0806283A
	ldr r0, [r5, #0x5c]
	bl GetAISSubjectId
	cmp r0, #0
	bne _08062830
	movs r0, #1
	movs r1, #0xe8
	movs r2, #0
	bl BG_SetPosition
	b _0806283A
	.align 2, 0
_08062814: .4byte gEfxBgSemaphore
_08062818: .4byte gUnknown_085D6BD0
_0806281C: .4byte gUnknown_080DDD58
_08062820: .4byte gUnknown_085D6BE8
_08062824: .4byte gUnknown_086861A4
_08062828: .4byte gUnknown_086852D8
_0806282C: .4byte gEkrDistanceType
_08062830:
	movs r0, #1
	movs r1, #0x18
	movs r2, #0
	bl BG_SetPosition
_0806283A:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80627B4

	THUMB_FUNC_START sub_8062840
sub_8062840: @ 0x08062840
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl SpellFx_InterpretBgAnimScript
	lsls r0, r0, #0x10
	asrs r2, r0, #0x10
	cmp r2, #0
	blt _0806286E
	ldr r1, [r4, #0x4c]
	ldr r3, [r4, #0x50]
	ldr r0, [r4, #0x5c]
	lsls r2, r2, #2
	adds r1, r2, r1
	ldr r1, [r1]
	adds r2, r2, r3
	ldr r2, [r2]
	bl SpellFx_WriteBgMap
	b _0806288C
_0806286E:
	movs r0, #1
	negs r0, r0
	cmp r2, r0
	bne _0806288C
	bl SpellFx_ClearBG1
	ldr r1, _08062894  @ gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SetDefaultColorEffects_
	adds r0, r4, #0
	bl Proc_Break
_0806288C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08062894: .4byte gEfxBgSemaphore

	THUMB_FUNC_END sub_8062840

	THUMB_FUNC_START sub_8062898
sub_8062898: @ 0x08062898
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r1, _080628DC  @ gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _080628E0  @ gUnknown_085D6C28
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	ldr r3, _080628E4  @ gUnknown_0868C2E8
	str r3, [sp]
	adds r0, r5, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl EfxAnimCreate1
	str r0, [r4, #0x60]
	ldr r0, _080628E8  @ gUnknown_0868716C
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _080628EC  @ gUnknown_08686F84
	movs r1, #0x80
	lsls r1, r1, #4
	bl SpellFx_RegisterObjGfx
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080628DC: .4byte gEfxBgSemaphore
_080628E0: .4byte gUnknown_085D6C28
_080628E4: .4byte gUnknown_0868C2E8
_080628E8: .4byte gUnknown_0868716C
_080628EC: .4byte gUnknown_08686F84

	THUMB_FUNC_END sub_8062898

	THUMB_FUNC_START sub_80628F0
sub_80628F0: @ 0x080628F0
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r1, _08062928  @ gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0806292C  @ ProcScr_efxSleepOBJ2
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	ldr r3, _08062930  @ gUnknown_0868C168
	str r3, [sp]
	adds r0, r5, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl EfxAnimCreate1
	str r0, [r4, #0x60]
	ldrh r1, [r0, #4]
	subs r1, #8
	strh r1, [r0, #4]
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08062928: .4byte gEfxBgSemaphore
_0806292C: .4byte ProcScr_efxSleepOBJ2
_08062930: .4byte gUnknown_0868C168

	THUMB_FUNC_END sub_80628F0

	THUMB_FUNC_START sub_8062934
sub_8062934: @ 0x08062934
	ldr r1, _08062940  @ gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bx lr
	.align 2, 0
_08062940: .4byte gEfxBgSemaphore

	THUMB_FUNC_END sub_8062934

	THUMB_FUNC_START sub_8062944
sub_8062944: @ 0x08062944
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _08062960  @ gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08062964  @ ProcScr_efxSleepSE
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08062960: .4byte gEfxBgSemaphore
_08062964: .4byte ProcScr_efxSleepSE

	THUMB_FUNC_END sub_8062944

	THUMB_FUNC_START sub_8062968
sub_8062968: @ 0x08062968
	push {r4, lr}
	movs r3, #0x8e
	lsls r3, r3, #1
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r0, [r0, #0x5c]
	movs r4, #2
	ldrsh r2, [r0, r4]
	adds r0, r3, #0
	movs r3, #1
	bl EkrSoundSomeBark
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8062968

	THUMB_FUNC_START sub_8062988
sub_8062988: @ 0x08062988
	ldr r1, _08062994  @ gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bx lr
	.align 2, 0
_08062994: .4byte gEfxBgSemaphore

	THUMB_FUNC_END sub_8062988

	THUMB_FUNC_START StartSpellAnimHammerne
StartSpellAnimHammerne: @ 0x08062998
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl NewEfxSpellCast
	bl SpellFx_SpellFx_ClearBG1Position
	ldr r0, _080629D0  @ ProcScr_efxHammarne
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
_080629D0: .4byte ProcScr_efxHammarne

	THUMB_FUNC_END StartSpellAnimHammerne

	THUMB_FUNC_START sub_80629D4
sub_80629D4: @ 0x080629D4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetCoreAIStruct
	adds r6, r0, #0
	bl GetAnimationStartFrameMaybe
	adds r5, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	movs r1, #0
	mov r8, r1
	movs r7, #0
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _08062A0A
	ldr r0, [r4, #0x5c]
	movs r1, #1
	negs r1, r1
	bl NewEfxFarAttackWithDistance
_08062A0A:
	movs r2, #0x2c
	ldrsh r1, [r4, r2]
	adds r0, r5, #1
	cmp r1, r0
	bne _08062A84
	adds r0, r6, #0
	bl sub_8062AF4
	movs r5, #8
	str r5, [sp]
	str r7, [sp, #4]
	adds r0, r6, #0
	movs r1, #0x28
	movs r2, #0x1e
	movs r3, #0x10
	bl NewEfxALPHA
	movs r4, #0x10
	str r4, [sp]
	str r7, [sp, #4]
	adds r0, r6, #0
	movs r1, #0x47
	movs r2, #0x1e
	movs r3, #8
	bl NewEfxALPHA
	str r5, [sp]
	str r7, [sp, #4]
	adds r0, r6, #0
	movs r1, #0x66
	movs r2, #0x1e
	movs r3, #0x10
	bl NewEfxALPHA
	str r4, [sp]
	str r7, [sp, #4]
	adds r0, r6, #0
	movs r1, #0x85
	movs r2, #0x1e
	movs r3, #8
	bl NewEfxALPHA
	str r7, [sp]
	str r7, [sp, #4]
	adds r0, r6, #0
	movs r1, #0xa4
	movs r2, #0x3c
	movs r3, #0x10
	bl NewEfxALPHA
	ldr r0, _08062A80  @ 0x00000103
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r6, r3]
	movs r3, #1
	bl EkrSoundSomeBark
	b _08062AE8
	.align 2, 0
_08062A80: .4byte 0x00000103
_08062A84:
	adds r0, r5, #0
	adds r0, #0x50
	cmp r1, r0
	bne _08062A94
	adds r0, r6, #0
	bl sub_8062BAC
	b _08062AE8
_08062A94:
	adds r0, r5, #0
	adds r0, #0xa4
	cmp r1, r0
	bne _08062AAA
	adds r0, r6, #0
	movs r1, #1
	movs r2, #5
	movs r3, #0
	bl NewEfxFlashUnit
	b _08062AE8
_08062AAA:
	adds r0, r5, #0
	adds r0, #0xc8
	cmp r1, r0
	bne _08062AC8
	ldrh r0, [r6, #0x10]
	movs r1, #9
	orrs r0, r1
	strh r0, [r6, #0x10]
	adds r0, r4, #0
	adds r0, #0x29
	ldrb r1, [r0]
	adds r0, r6, #0
	bl sub_8055518
	b _08062AE8
_08062AC8:
	movs r2, #0x96
	lsls r2, r2, #1
	adds r0, r5, r2
	cmp r1, r0
	bne _08062AE8
	ldrh r0, [r6, #0x10]
	movs r1, #2
	orrs r0, r1
	strh r0, [r6, #0x10]
	bl SpellFx_Finish
	bl EfxSpellCastSet29
	adds r0, r4, #0
	bl Proc_Break
_08062AE8:
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80629D4

	THUMB_FUNC_START sub_8062AF4
sub_8062AF4: @ 0x08062AF4
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _08062B30  @ gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08062B34  @ ProcScr_efxHammarneBG
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r1, [r0, #0x44]
	ldr r1, _08062B38  @ gUnknown_080DDE9E
	str r1, [r0, #0x48]
	ldr r1, _08062B3C  @ gUnknown_085D6CE0
	str r1, [r0, #0x4c]
	str r1, [r0, #0x50]
	ldr r1, _08062B40  @ gUnknown_085D6D14
	str r1, [r0, #0x54]
	ldr r0, _08062B44  @ gUnknown_086810B8
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	bl SpellFx_SetSomeColorEffect
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08062B30: .4byte gEfxBgSemaphore
_08062B34: .4byte ProcScr_efxHammarneBG
_08062B38: .4byte gUnknown_080DDE9E
_08062B3C: .4byte gUnknown_085D6CE0
_08062B40: .4byte gUnknown_085D6D14
_08062B44: .4byte gUnknown_086810B8

	THUMB_FUNC_END sub_8062AF4

	THUMB_FUNC_START sub_8062B48
sub_8062B48: @ 0x08062B48
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl SpellFx_InterpretBgAnimScript
	lsls r0, r0, #0x10
	asrs r3, r0, #0x10
	cmp r3, #0
	blt _08062B84
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
	b _08062BA2
_08062B84:
	movs r0, #1
	negs r0, r0
	cmp r3, r0
	bne _08062BA2
	bl SpellFx_ClearBG1
	ldr r1, _08062BA8  @ gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SetDefaultColorEffects_
	adds r0, r4, #0
	bl Proc_Break
_08062BA2:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08062BA8: .4byte gEfxBgSemaphore

	THUMB_FUNC_END sub_8062B48

	THUMB_FUNC_START sub_8062BAC
sub_8062BAC: @ 0x08062BAC
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r1, _08062BF0  @ gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08062BF4  @ ProcScr_efxHammarneOBJ
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	ldr r3, _08062BF8  @ gUnknown_08684908
	str r3, [sp]
	adds r0, r5, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl EfxAnimCreate1
	str r0, [r4, #0x60]
	ldr r0, _08062BFC  @ gUnknown_0868718C
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _08062C00  @ gUnknown_08686F84
	movs r1, #0x80
	lsls r1, r1, #4
	bl SpellFx_RegisterObjGfx
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08062BF0: .4byte gEfxBgSemaphore
_08062BF4: .4byte ProcScr_efxHammarneOBJ
_08062BF8: .4byte gUnknown_08684908
_08062BFC: .4byte gUnknown_0868718C
_08062C00: .4byte gUnknown_08686F84

	THUMB_FUNC_END sub_8062BAC

	THUMB_FUNC_START sub_8062C04
sub_8062C04: @ 0x08062C04
	ldr r1, _08062C10  @ gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bx lr
	.align 2, 0
_08062C10: .4byte gEfxBgSemaphore

	THUMB_FUNC_END sub_8062C04

	THUMB_FUNC_START StartSpellAnimBerserk
StartSpellAnimBerserk: @ 0x08062C14
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl NewEfxSpellCast
	bl SpellFx_SpellFx_ClearBG1Position
	ldr r0, _08062C4C  @ ProcScr_efxBerserk
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
_08062C4C: .4byte ProcScr_efxBerserk

	THUMB_FUNC_END StartSpellAnimBerserk

	THUMB_FUNC_START sub_8062C50
sub_8062C50: @ 0x08062C50
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetCoreAIStruct
	adds r5, r0, #0
	bl GetAnimationStartFrameMaybe
	adds r6, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	movs r7, #0
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _08062C7E
	ldr r0, [r4, #0x5c]
	movs r1, #1
	negs r1, r1
	bl NewEfxFarAttackWithDistance
_08062C7E:
	movs r0, #0x2c
	ldrsh r1, [r4, r0]
	adds r0, r6, #1
	cmp r1, r0
	bne _08062CCC
	adds r0, r5, #0
	bl sub_8062F4C
	adds r0, r5, #0
	movs r1, #0x4a
	bl sub_8062D30
	adds r0, r5, #0
	movs r1, #0x4a
	bl sub_8062EAC
	movs r4, #0x80
	lsls r4, r4, #1
	movs r0, #1
	str r0, [sp]
	adds r0, r5, #0
	movs r1, #0x4a
	movs r2, #0xa
	adds r3, r4, #0
	bl NewefxRestRST
	adds r0, r5, #0
	movs r1, #0x4a
	movs r2, #0
	bl NewEfxRestWINH_
	movs r0, #2
	ldrsh r2, [r5, r0]
	movs r0, #0xf9
	adds r1, r4, #0
	movs r3, #1
	bl EkrSoundSomeBark
	b _08062D26
_08062CCC:
	adds r0, r6, #0
	adds r0, #0x4a
	cmp r1, r0
	bne _08062D08
	adds r0, r5, #0
	movs r1, #5
	bl StartSpellBG_FLASH
	ldrh r0, [r5, #0x10]
	movs r1, #9
	orrs r0, r1
	strh r0, [r5, #0x10]
	adds r4, #0x29
	ldrb r1, [r4]
	adds r0, r5, #0
	bl sub_8055518
	ldrb r0, [r4]
	cmp r0, #0
	bne _08062D26
	adds r0, r5, #0
	bl GettUnitEfxDebuff
	cmp r0, #0
	bne _08062D26
	adds r0, r5, #0
	movs r1, #4
	bl SetUnitEfxDebuff
	b _08062D26
_08062D08:
	adds r0, r6, #0
	adds r0, #0x5a
	cmp r1, r0
	bne _08062D26
	ldrh r0, [r5, #0x10]
	movs r1, #2
	orrs r0, r1
	strh r0, [r5, #0x10]
	bl SpellFx_Finish
	bl EfxSpellCastSet29
	adds r0, r4, #0
	bl Proc_Break
_08062D26:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8062C50

	THUMB_FUNC_START sub_8062D30
sub_8062D30: @ 0x08062D30
	push {r4, r5, r6, lr}
	mov r6, r9
	mov r5, r8
	push {r5, r6}
	sub sp, #8
	adds r5, r0, #0
	adds r4, r1, #0
	ldr r1, _08062E24  @ gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08062E28  @ ProcScr_efxBerserkBG
	movs r1, #3
	bl Proc_Start
	str r5, [r0, #0x5c]
	movs r1, #0
	mov r9, r1
	mov r2, r9
	strh r2, [r0, #0x2c]
	strh r4, [r0, #0x2e]
	ldr r0, _08062E2C  @ gUnknown_0868C338
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	ldr r0, _08062E30  @ gUnknown_086849B8
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	ldr r0, _08062E34  @ gUnknown_08684AB8
	ldr r1, _08062E38  @ gBG1TilemapBuffer
	movs r2, #1
	mov r8, r2
	str r2, [sp]
	adds r2, #0xff
	str r2, [sp, #4]
	movs r2, #0x20
	movs r3, #0x20
	bl sub_8070E94
	movs r0, #2
	bl BG_EnableSyncByMask
	bl SpellFx_SetSomeColorEffect
	movs r0, #1
	movs r1, #0xe
	movs r2, #8
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	bl sub_80708A0
	ldr r4, _08062E3C  @ gLCDControlBuffer
	adds r3, r4, #0
	adds r3, #0x37
	ldrb r1, [r3]
	movs r6, #0x20
	orrs r1, r6
	ldrb r2, [r4, #1]
	movs r0, #0x21
	negs r0, r0
	ands r0, r2
	movs r2, #0x41
	negs r2, r2
	ands r0, r2
	movs r2, #0x80
	orrs r0, r2
	strb r0, [r4, #1]
	movs r0, #2
	negs r0, r0
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	movs r0, #4
	orrs r1, r0
	movs r0, #8
	orrs r1, r0
	movs r0, #0x10
	orrs r1, r0
	strb r1, [r3]
	mov r0, r9
	str r0, [sp]
	movs r0, #0
	movs r1, #1
	movs r2, #0
	movs r3, #0
	bl SetBlendTargetA
	mov r1, r8
	str r1, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #1
	movs r3, #1
	bl SetBlendTargetB
	adds r4, #0x3d
	ldrb r0, [r4]
	orrs r0, r6
	strb r0, [r4]
	ldr r0, [r5, #0x1c]
	movs r1, #0x80
	lsls r1, r1, #4
	orrs r0, r1
	str r0, [r5, #0x1c]
	ldrh r1, [r5, #8]
	ldr r0, _08062E40  @ 0x0000F3FF
	ands r0, r1
	movs r2, #0x80
	lsls r2, r2, #3
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r5, #8]
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08062E24: .4byte gEfxBgSemaphore
_08062E28: .4byte ProcScr_efxBerserkBG
_08062E2C: .4byte gUnknown_0868C338
_08062E30: .4byte gUnknown_086849B8
_08062E34: .4byte gUnknown_08684AB8
_08062E38: .4byte gBG1TilemapBuffer
_08062E3C: .4byte gLCDControlBuffer
_08062E40: .4byte 0x0000F3FF

	THUMB_FUNC_END sub_8062D30

	THUMB_FUNC_START sub_8062E44
sub_8062E44: @ 0x08062E44
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r5, [r4, #0x5c]
	ldr r1, _08062E9C  @ gLCDControlBuffer
	ldrh r0, [r1, #0x22]
	subs r0, #1
	strh r0, [r1, #0x22]
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x2e
	ldrsh r1, [r4, r2]
	cmp r0, r1
	bne _08062E96
	bl SpellFx_ClearBG1
	bl SetDefaultColorEffects_
	bl sub_8070874
	ldr r0, [r5, #0x1c]
	ldr r1, _08062EA0  @ 0xFFFFF7FF
	ands r0, r1
	str r0, [r5, #0x1c]
	ldrh r1, [r5, #8]
	ldr r0, _08062EA4  @ 0x0000F3FF
	ands r0, r1
	movs r2, #0x80
	lsls r2, r2, #4
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r5, #8]
	ldr r1, _08062EA8  @ gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
_08062E96:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08062E9C: .4byte gLCDControlBuffer
_08062EA0: .4byte 0xFFFFF7FF
_08062EA4: .4byte 0x0000F3FF
_08062EA8: .4byte gEfxBgSemaphore

	THUMB_FUNC_END sub_8062E44

	THUMB_FUNC_START sub_8062EAC
sub_8062EAC: @ 0x08062EAC
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, _08062ED0  @ gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08062ED4  @ ProcScr_efxBerserkCLONE
	movs r1, #4
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r5, [r0, #0x2e]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08062ED0: .4byte gEfxBgSemaphore
_08062ED4: .4byte ProcScr_efxBerserkCLONE

	THUMB_FUNC_END sub_8062EAC

	THUMB_FUNC_START sub_8062ED8
sub_8062ED8: @ 0x08062ED8
	push {r4, lr}
	sub sp, #0x48
	adds r4, r0, #0
	ldr r2, [r4, #0x5c]
	mov r1, sp
	ldrh r0, [r2, #2]
	strh r0, [r1, #2]
	ldrh r0, [r2, #4]
	strh r0, [r1, #4]
	ldr r0, [r2, #0x3c]
	str r0, [sp, #0x3c]
	ldr r0, [r2, #0x1c]
	ldr r1, _08062F34  @ 0xFFFFF7FF
	ands r0, r1
	str r0, [sp, #0x1c]
	mov r0, sp
	ldrh r1, [r2, #8]
	strh r1, [r0, #8]
	mov r2, sp
	ldr r0, _08062F38  @ 0x0000F3FF
	ands r0, r1
	strh r0, [r2, #8]
	movs r3, #0x80
	lsls r3, r3, #4
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2, #8]
	mov r0, sp
	bl AnimDisplay
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x2e
	ldrsh r1, [r4, r2]
	cmp r0, r1
	bne _08062F2C
	adds r0, r4, #0
	bl Proc_Break
_08062F2C:
	add sp, #0x48
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08062F34: .4byte 0xFFFFF7FF
_08062F38: .4byte 0x0000F3FF

	THUMB_FUNC_END sub_8062ED8

	THUMB_FUNC_START sub_8062F3C
sub_8062F3C: @ 0x08062F3C
	ldr r1, _08062F48  @ gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bx lr
	.align 2, 0
_08062F48: .4byte gEfxBgSemaphore

	THUMB_FUNC_END sub_8062F3C

	THUMB_FUNC_START sub_8062F4C
sub_8062F4C: @ 0x08062F4C
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r1, _08062F94  @ gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08062F98  @ ProcScr_efxBerserkOBJ
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	adds r0, r5, #0
	bl GetCoreAIStruct
	ldr r3, _08062F9C  @ FramScr_Unk5D4F90
	ldr r0, [r4, #0x5c]
	str r3, [sp]
	adds r1, r3, #0
	adds r2, r3, #0
	bl EfxAnimCreate1
	str r0, [r4, #0x60]
	ldrh r2, [r0, #8]
	ldr r1, _08062FA0  @ 0x0000F3FF
	ands r1, r2
	movs r3, #0x80
	lsls r3, r3, #3
	adds r2, r3, #0
	orrs r1, r2
	strh r1, [r0, #8]
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08062F94: .4byte gEfxBgSemaphore
_08062F98: .4byte ProcScr_efxBerserkOBJ
_08062F9C: .4byte FramScr_Unk5D4F90
_08062FA0: .4byte 0x0000F3FF

	THUMB_FUNC_END sub_8062F4C

	THUMB_FUNC_START sub_8062FA4
sub_8062FA4: @ 0x08062FA4
	push {lr}
	ldr r2, _08062FB8  @ gEfxBgSemaphore
	ldr r1, [r2]
	subs r1, #1
	str r1, [r2]
	ldr r0, [r0, #0x60]
	bl AnimDelete
	pop {r0}
	bx r0
	.align 2, 0
_08062FB8: .4byte gEfxBgSemaphore

	THUMB_FUNC_END sub_8062FA4

	THUMB_FUNC_START sub_8062FBC
sub_8062FBC: @ 0x08062FBC
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x60]
	ldr r0, _08062FEC  @ gUnknown_0868D2B4
	str r0, [r1, #0x24]
	str r0, [r1, #0x20]
	movs r0, #0
	strh r0, [r1, #6]
	ldr r0, _08062FF0  @ gUnknown_0868CC10
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _08062FF4  @ gUnknown_0868C358
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08062FEC: .4byte gUnknown_0868D2B4
_08062FF0: .4byte gUnknown_0868CC10
_08062FF4: .4byte gUnknown_0868C358

	THUMB_FUNC_END sub_8062FBC

	THUMB_FUNC_START sub_8062FF8
sub_8062FF8: @ 0x08062FF8
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x60]
	ldr r0, _08063028  @ gUnknown_0868D2C8
	str r0, [r1, #0x24]
	str r0, [r1, #0x20]
	movs r0, #0
	strh r0, [r1, #6]
	ldr r0, _0806302C  @ gUnknown_0868CC10
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _08063030  @ gUnknown_0868C358
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08063028: .4byte gUnknown_0868D2C8
_0806302C: .4byte gUnknown_0868CC10
_08063030: .4byte gUnknown_0868C358

	THUMB_FUNC_END sub_8062FF8

	THUMB_FUNC_START sub_8063034
sub_8063034: @ 0x08063034
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x60]
	ldr r0, _08063064  @ gUnknown_0868D2DC
	str r0, [r1, #0x24]
	str r0, [r1, #0x20]
	movs r0, #0
	strh r0, [r1, #6]
	ldr r0, _08063068  @ gUnknown_0868CC10
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _0806306C  @ gUnknown_0868C358
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08063064: .4byte gUnknown_0868D2DC
_08063068: .4byte gUnknown_0868CC10
_0806306C: .4byte gUnknown_0868C358

	THUMB_FUNC_END sub_8063034

	THUMB_FUNC_START sub_8063070
sub_8063070: @ 0x08063070
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x60]
	ldr r0, _080630A0  @ gUnknown_0868D2F0
	str r0, [r1, #0x24]
	str r0, [r1, #0x20]
	movs r0, #0
	strh r0, [r1, #6]
	ldr r0, _080630A4  @ gUnknown_0868CC10
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _080630A8  @ gUnknown_0868C358
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080630A0: .4byte gUnknown_0868D2F0
_080630A4: .4byte gUnknown_0868CC10
_080630A8: .4byte gUnknown_0868C358

	THUMB_FUNC_END sub_8063070

	THUMB_FUNC_START sub_80630AC
sub_80630AC: @ 0x080630AC
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x60]
	ldr r0, _080630DC  @ gUnknown_0868D304
	str r0, [r1, #0x24]
	str r0, [r1, #0x20]
	movs r0, #0
	strh r0, [r1, #6]
	ldr r0, _080630E0  @ gUnknown_0868CC10
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _080630E4  @ gUnknown_0868C358
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080630DC: .4byte gUnknown_0868D304
_080630E0: .4byte gUnknown_0868CC10
_080630E4: .4byte gUnknown_0868C358

	THUMB_FUNC_END sub_80630AC

	THUMB_FUNC_START sub_80630E8
sub_80630E8: @ 0x080630E8
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x60]
	ldr r0, _08063118  @ gUnknown_0868D678
	str r0, [r1, #0x24]
	str r0, [r1, #0x20]
	movs r0, #0
	strh r0, [r1, #6]
	ldr r0, _0806311C  @ gUnknown_0868CC10
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _08063120  @ gUnknown_0868C7F0
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08063118: .4byte gUnknown_0868D678
_0806311C: .4byte gUnknown_0868CC10
_08063120: .4byte gUnknown_0868C7F0

	THUMB_FUNC_END sub_80630E8

	THUMB_FUNC_START sub_8063124
sub_8063124: @ 0x08063124
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x60]
	ldr r0, _08063154  @ gUnknown_0868D684
	str r0, [r1, #0x24]
	str r0, [r1, #0x20]
	movs r0, #0
	strh r0, [r1, #6]
	ldr r0, _08063158  @ gUnknown_0868CC10
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _0806315C  @ gUnknown_0868C7F0
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08063154: .4byte gUnknown_0868D684
_08063158: .4byte gUnknown_0868CC10
_0806315C: .4byte gUnknown_0868C7F0

	THUMB_FUNC_END sub_8063124

	THUMB_FUNC_START sub_8063160
sub_8063160: @ 0x08063160
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x60]
	ldr r0, _08063190  @ gUnknown_0868D690
	str r0, [r1, #0x24]
	str r0, [r1, #0x20]
	movs r0, #0
	strh r0, [r1, #6]
	ldr r0, _08063194  @ gUnknown_0868CC10
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _08063198  @ gUnknown_0868C7F0
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08063190: .4byte gUnknown_0868D690
_08063194: .4byte gUnknown_0868CC10
_08063198: .4byte gUnknown_0868C7F0

	THUMB_FUNC_END sub_8063160

	THUMB_FUNC_START sub_806319C
sub_806319C: @ 0x0806319C
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x60]
	ldr r0, _080631CC  @ gUnknown_0868D69C
	str r0, [r1, #0x24]
	str r0, [r1, #0x20]
	movs r0, #0
	strh r0, [r1, #6]
	ldr r0, _080631D0  @ gUnknown_0868CC10
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _080631D4  @ gUnknown_0868C7F0
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080631CC: .4byte gUnknown_0868D69C
_080631D0: .4byte gUnknown_0868CC10
_080631D4: .4byte gUnknown_0868C7F0

	THUMB_FUNC_END sub_806319C

	THUMB_FUNC_START sub_80631D8
sub_80631D8: @ 0x080631D8
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x60]
	ldr r0, _08063208  @ gUnknown_0868D6A8
	str r0, [r1, #0x24]
	str r0, [r1, #0x20]
	movs r0, #0
	strh r0, [r1, #6]
	ldr r0, _0806320C  @ gUnknown_0868CC10
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _08063210  @ gUnknown_0868C7F0
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08063208: .4byte gUnknown_0868D6A8
_0806320C: .4byte gUnknown_0868CC10
_08063210: .4byte gUnknown_0868C7F0

	THUMB_FUNC_END sub_80631D8

	THUMB_FUNC_START sub_8063214
sub_8063214: @ 0x08063214
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl NewEfxSpellCast
	bl SpellFx_SpellFx_ClearBG1Position
	ldr r0, _0806324C  @ ProcScr_efxMshield
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
_0806324C: .4byte ProcScr_efxMshield

	THUMB_FUNC_END sub_8063214

	THUMB_FUNC_START sub_8063250
sub_8063250: @ 0x08063250
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x5c]
	bl GetCoreAIStruct
	adds r4, r0, #0
	bl GetAnimationStartFrameMaybe
	adds r6, r0, #0
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	movs r7, #0
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _0806327C
	ldr r0, [r5, #0x5c]
	movs r1, #1
	negs r1, r1
	bl NewEfxFarAttackWithDistance
_0806327C:
	movs r0, #0x2c
	ldrsh r1, [r5, r0]
	adds r0, r6, #1
	cmp r1, r0
	bne _080632AC
	ldr r0, [r5, #0x5c]
	bl sub_806331C
	adds r0, r4, #0
	bl sub_80633D0
	adds r0, r4, #0
	bl sub_8063428
	movs r0, #0x81
	lsls r0, r0, #1
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r4, r3]
	movs r3, #1
	bl EkrSoundSomeBark
	b _08063316
_080632AC:
	adds r0, r6, #0
	adds r0, #0x28
	cmp r1, r0
	beq _080632BC
	adds r0, r6, #0
	adds r0, #0x50
	cmp r1, r0
	bne _080632C4
_080632BC:
	adds r0, r4, #0
	bl sub_8063428
	b _08063316
_080632C4:
	adds r0, r6, #0
	adds r0, #0xb0
	cmp r1, r0
	bne _080632DA
	adds r0, r4, #0
	movs r1, #1
	movs r2, #5
	movs r3, #0
	bl NewEfxFlashUnit
	b _08063316
_080632DA:
	adds r0, r6, #0
	adds r0, #0xe1
	cmp r1, r0
	bne _080632F8
	ldrh r0, [r4, #0x10]
	movs r1, #9
	orrs r0, r1
	strh r0, [r4, #0x10]
	adds r0, r5, #0
	adds r0, #0x29
	ldrb r1, [r0]
	adds r0, r4, #0
	bl sub_8055518
	b _08063316
_080632F8:
	adds r0, r6, #0
	adds r0, #0xe6
	cmp r1, r0
	bne _08063316
	ldrh r0, [r4, #0x10]
	movs r1, #2
	orrs r0, r1
	strh r0, [r4, #0x10]
	bl SpellFx_Finish
	bl EfxSpellCastSet29
	adds r0, r5, #0
	bl Proc_Break
_08063316:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8063250

	THUMB_FUNC_START sub_806331C
sub_806331C: @ 0x0806331C
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _08063360  @ gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08063364  @ ProcScr_efxMshieldBG
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r1, [r0, #0x44]
	ldr r1, _08063368  @ gUnknown_080DDF3A
	str r1, [r0, #0x48]
	ldr r1, _0806336C  @ gUnknown_085D6EA0
	str r1, [r0, #0x4c]
	str r1, [r0, #0x50]
	ldr r0, _08063370  @ gUnknown_0868DF5C
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	ldr r0, _08063374  @ gUnknown_0868D6D0
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	bl SpellFx_SetSomeColorEffect
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08063360: .4byte gEfxBgSemaphore
_08063364: .4byte ProcScr_efxMshieldBG
_08063368: .4byte gUnknown_080DDF3A
_0806336C: .4byte gUnknown_085D6EA0
_08063370: .4byte gUnknown_0868DF5C
_08063374: .4byte gUnknown_0868D6D0

	THUMB_FUNC_END sub_806331C

	THUMB_FUNC_START sub_8063378
sub_8063378: @ 0x08063378
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl SpellFx_InterpretBgAnimScript
	lsls r0, r0, #0x10
	asrs r2, r0, #0x10
	cmp r2, #0
	blt _080633A6
	ldr r1, [r4, #0x4c]
	ldr r3, [r4, #0x50]
	ldr r0, [r4, #0x5c]
	lsls r2, r2, #2
	adds r1, r2, r1
	ldr r1, [r1]
	adds r2, r2, r3
	ldr r2, [r2]
	bl SpellFx_WriteBgMap
	b _080633C4
_080633A6:
	movs r0, #1
	negs r0, r0
	cmp r2, r0
	bne _080633C4
	bl SpellFx_ClearBG1
	ldr r1, _080633CC  @ gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SetDefaultColorEffects_
	adds r0, r4, #0
	bl Proc_Break
_080633C4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080633CC: .4byte gEfxBgSemaphore

	THUMB_FUNC_END sub_8063378

	THUMB_FUNC_START sub_80633D0
sub_80633D0: @ 0x080633D0
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r1, _08063414  @ gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08063418  @ ProcScr_efxMshieldBGOBJ
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	ldr r3, _0806341C  @ gUnknown_08692524
	str r3, [sp]
	adds r0, r5, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl EfxAnimCreate1
	str r0, [r4, #0x60]
	ldr r0, _08063420  @ gUnknown_0868E46C
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _08063424  @ gUnknown_08686F84
	movs r1, #0x80
	lsls r1, r1, #4
	bl SpellFx_RegisterObjGfx
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08063414: .4byte gEfxBgSemaphore
_08063418: .4byte ProcScr_efxMshieldBGOBJ
_0806341C: .4byte gUnknown_08692524
_08063420: .4byte gUnknown_0868E46C
_08063424: .4byte gUnknown_08686F84

	THUMB_FUNC_END sub_80633D0

	THUMB_FUNC_START sub_8063428
sub_8063428: @ 0x08063428
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r1, _0806345C  @ gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08063460  @ ProcScr_efxMshieldBGOBJ2
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	ldr r3, _08063464  @ gUnknown_08692674
	str r3, [sp]
	adds r0, r5, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl EfxAnimCreate1
	str r0, [r4, #0x60]
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806345C: .4byte gEfxBgSemaphore
_08063460: .4byte ProcScr_efxMshieldBGOBJ2
_08063464: .4byte gUnknown_08692674

	THUMB_FUNC_END sub_8063428

	THUMB_FUNC_START sub_8063468
sub_8063468: @ 0x08063468
	push {lr}
	ldr r0, [r0, #0x60]
	bl AnimDelete
	ldr r1, _0806347C  @ gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_0806347C: .4byte gEfxBgSemaphore

	THUMB_FUNC_END sub_8063468

	THUMB_FUNC_START StartSpellAnimShine
StartSpellAnimShine: @ 0x08063480
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl NewEfxSpellCast
	bl SpellFx_SpellFx_ClearBG1Position
	ldr r0, _080634B8  @ ProcScr_efxShine
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
_080634B8: .4byte ProcScr_efxShine

	THUMB_FUNC_END StartSpellAnimShine

	THUMB_FUNC_START sub_80634BC
sub_80634BC: @ 0x080634BC
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetCoreAIStruct
	adds r5, r0, #0
	bl GetAnimationStartFrameMaybe
	adds r6, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _080634E6
	ldr r0, [r4, #0x5c]
	movs r1, #1
	negs r1, r1
	bl NewEfxFarAttackWithDistance
_080634E6:
	movs r0, #0x2c
	ldrsh r1, [r4, r0]
	adds r0, r6, #1
	cmp r1, r0
	bne _080634FA
	adds r0, r5, #0
	movs r1, #0xa
	bl StartSpellBG_FLASH
	b _08063588
_080634FA:
	adds r0, r6, #0
	adds r0, #0xb
	cmp r1, r0
	bne _0806351C
	adds r0, r5, #0
	bl sub_806364C
	movs r0, #0xaf
	lsls r0, r0, #2
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r5, r3]
	movs r3, #1
	bl EkrSoundSomeBark
	b _08063588
_0806351C:
	adds r0, r6, #0
	adds r0, #0x17
	cmp r1, r0
	bne _08063534
	adds r0, r5, #0
	movs r1, #5
	bl StartSpellBG_FLASH
	adds r0, r5, #0
	bl sub_80637F8
	b _08063588
_08063534:
	adds r0, r6, #0
	adds r0, #0x1d
	cmp r1, r0
	bne _0806354A
	adds r0, r5, #0
	bl sub_8063590
	adds r0, r5, #0
	bl sub_806376C
	b _08063588
_0806354A:
	adds r0, r6, #0
	adds r0, #0x1e
	cmp r1, r0
	bne _08063572
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
	bne _08063588
	adds r0, r5, #0
	bl sub_8072450
	b _08063588
_08063572:
	adds r0, r6, #0
	adds r0, #0x23
	cmp r1, r0
	bne _08063588
	bl SpellFx_Finish
	bl EfxSpellCastSet29
	adds r0, r4, #0
	bl Proc_Break
_08063588:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80634BC

	THUMB_FUNC_START sub_8063590
sub_8063590: @ 0x08063590
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _080635D0  @ gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _080635D4  @ ProcScr_efxShineBG
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r1, [r0, #0x44]
	ldr r1, _080635D8  @ gUnknown_080DE03C
	str r1, [r0, #0x48]
	ldr r1, _080635DC  @ gUnknown_085D6F24
	str r1, [r0, #0x4c]
	ldr r1, _080635E0  @ gUnknown_085D6F28
	str r1, [r0, #0x50]
	ldr r1, _080635E4  @ gUnknown_085D6F2C
	str r1, [r0, #0x54]
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	bl SpellFx_SetSomeColorEffect
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080635D0: .4byte gEfxBgSemaphore
_080635D4: .4byte ProcScr_efxShineBG
_080635D8: .4byte gUnknown_080DE03C
_080635DC: .4byte gUnknown_085D6F24
_080635E0: .4byte gUnknown_085D6F28
_080635E4: .4byte gUnknown_085D6F2C

	THUMB_FUNC_END sub_8063590

	THUMB_FUNC_START sub_80635E8
sub_80635E8: @ 0x080635E8
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r0, #0x2c
	adds r1, r7, #0
	adds r1, #0x44
	ldr r2, [r7, #0x48]
	bl SpellFx_InterpretBgAnimScript
	lsls r0, r0, #0x10
	asrs r4, r0, #0x10
	cmp r4, #0
	blt _08063624
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
	b _08063642
_08063624:
	movs r0, #1
	negs r0, r0
	cmp r4, r0
	bne _08063642
	bl SpellFx_ClearBG1
	ldr r1, _08063648  @ gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SetDefaultColorEffects_
	adds r0, r7, #0
	bl Proc_Break
_08063642:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08063648: .4byte gEfxBgSemaphore

	THUMB_FUNC_END sub_80635E8

	THUMB_FUNC_START sub_806364C
sub_806364C: @ 0x0806364C
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r1, _080636A8  @ gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _080636AC  @ ProcScr_efxShineBG2
	movs r1, #3
	bl Proc_Start
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	str r0, [r5, #0x44]
	ldr r0, _080636B0  @ gUnknown_080DE050
	str r0, [r5, #0x48]
	ldr r0, _080636B4  @ gUnknown_085D6F48
	str r0, [r5, #0x4c]
	str r0, [r5, #0x50]
	ldr r0, _080636B8  @ gUnknown_08727C48
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	ldr r0, _080636BC  @ gUnknown_0872796C
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	ldr r0, _080636C0  @ gEkrDistanceType
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _080636CE
	ldr r0, [r5, #0x5c]
	bl GetAISSubjectId
	cmp r0, #0
	bne _080636C4
	movs r0, #1
	movs r1, #0x18
	movs r2, #0
	bl BG_SetPosition
	b _080636CE
	.align 2, 0
_080636A8: .4byte gEfxBgSemaphore
_080636AC: .4byte ProcScr_efxShineBG2
_080636B0: .4byte gUnknown_080DE050
_080636B4: .4byte gUnknown_085D6F48
_080636B8: .4byte gUnknown_08727C48
_080636BC: .4byte gUnknown_0872796C
_080636C0: .4byte gEkrDistanceType
_080636C4:
	movs r0, #1
	movs r1, #0xe8
	movs r2, #0
	bl BG_SetPosition
_080636CE:
	bl SpellFx_SetSomeColorEffect
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_806364C

	THUMB_FUNC_START sub_80636D8
sub_80636D8: @ 0x080636D8
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl SpellFx_InterpretBgAnimScript
	lsls r0, r0, #0x10
	asrs r2, r0, #0x10
	cmp r2, #0
	blt _08063740
	ldr r1, [r4, #0x4c]
	ldr r3, [r4, #0x50]
	ldr r0, [r4, #0x5c]
	lsls r2, r2, #2
	adds r1, r2, r1
	ldr r1, [r1]
	adds r2, r2, r3
	ldr r2, [r2]
	bl SpellFx_WriteBgMap
	ldr r0, _08063720  @ gEkrDistanceType
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _0806375E
	ldr r0, [r4, #0x5c]
	bl GetAISSubjectId
	adds r1, r0, #0
	cmp r1, #0
	bne _08063728
	ldr r0, _08063724  @ gBG1TilemapBuffer
	b _0806372C
	.align 2, 0
_08063720: .4byte gEkrDistanceType
_08063724: .4byte gBG1TilemapBuffer
_08063728:
	ldr r0, _0806373C  @ gUnknown_020234E2
	movs r1, #0
_0806372C:
	str r1, [sp]
	movs r1, #3
	movs r2, #0x14
	movs r3, #0
	bl FillBGRect
	b _0806375E
	.align 2, 0
_0806373C: .4byte gUnknown_020234E2
_08063740:
	movs r0, #1
	negs r0, r0
	cmp r2, r0
	bne _0806375E
	bl SpellFx_ClearBG1
	ldr r1, _08063768  @ gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SetDefaultColorEffects_
	adds r0, r4, #0
	bl Proc_Break
_0806375E:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08063768: .4byte gEfxBgSemaphore

	THUMB_FUNC_END sub_80636D8

	THUMB_FUNC_START sub_806376C
sub_806376C: @ 0x0806376C
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _080637A0  @ gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _080637A4  @ ProcScr_efxShineBGCOL
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r1, [r0, #0x2e]
	str r1, [r0, #0x44]
	ldr r1, _080637A8  @ gUnknown_080DE086
	str r1, [r0, #0x48]
	ldr r1, _080637AC  @ gUnknown_08726FF4
	str r1, [r0, #0x4c]
	adds r0, r1, #0
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080637A0: .4byte gEfxBgSemaphore
_080637A4: .4byte ProcScr_efxShineBGCOL
_080637A8: .4byte gUnknown_080DE086
_080637AC: .4byte gUnknown_08726FF4

	THUMB_FUNC_END sub_806376C

	THUMB_FUNC_START sub_80637B0
sub_80637B0: @ 0x080637B0
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl SpellFx_InterpretBgAnimScript
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	cmp r1, #0
	blt _080637D6
	ldr r0, [r4, #0x4c]
	lsls r1, r1, #5
	adds r0, r0, r1
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	b _080637EC
_080637D6:
	movs r0, #1
	negs r0, r0
	cmp r1, r0
	bne _080637EC
	ldr r1, _080637F4  @ gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
_080637EC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080637F4: .4byte gEfxBgSemaphore

	THUMB_FUNC_END sub_80637B0

	THUMB_FUNC_START sub_80637F8
sub_80637F8: @ 0x080637F8
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _08063830  @ gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08063834  @ ProcScr_efxShineOBJRND
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r2, #0
	strh r2, [r0, #0x2c]
	movs r1, #2
	strh r1, [r0, #0x2e]
	strh r2, [r0, #0x30]
	ldr r0, _08063838  @ gUnknown_08728920
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _0806383C  @ gUnknown_0872865C
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08063830: .4byte gEfxBgSemaphore
_08063834: .4byte ProcScr_efxShineOBJRND
_08063838: .4byte gUnknown_08728920
_0806383C: .4byte gUnknown_0872865C

	THUMB_FUNC_END sub_80637F8

	THUMB_FUNC_START sub_8063840
sub_8063840: @ 0x08063840
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x2e
	ldrsh r1, [r5, r2]
	cmp r0, r1
	bne _080638E0
	ldr r0, [r5, #0x5c]
	bl GetAISSubjectId
	cmp r0, #0
	bne _08063894
	ldr r0, [r5, #0x5c]
	movs r4, #2
	ldrsh r3, [r0, r4]
	ldr r4, _08063890  @ gUnknown_085D6FA4
	movs r6, #0x30
	ldrsh r2, [r5, r6]
	lsls r1, r2, #1
	adds r1, r1, r4
	movs r6, #0
	ldrsh r1, [r1, r6]
	adds r6, r3, r1
	movs r1, #4
	ldrsh r3, [r0, r1]
	adds r2, #1
	lsls r2, r2, #1
	adds r2, r2, r4
	movs r4, #0
	ldrsh r1, [r2, r4]
	adds r2, r3, r1
	adds r1, r6, #0
	bl sub_80638F0
	b _080638C0
	.align 2, 0
_08063890: .4byte gUnknown_085D6FA4
_08063894:
	ldr r0, [r5, #0x5c]
	movs r6, #2
	ldrsh r3, [r0, r6]
	ldr r4, _080638E8  @ gUnknown_085D6FA4
	movs r1, #0x30
	ldrsh r2, [r5, r1]
	lsls r1, r2, #1
	adds r1, r1, r4
	movs r6, #0
	ldrsh r1, [r1, r6]
	subs r6, r3, r1
	movs r1, #4
	ldrsh r3, [r0, r1]
	adds r2, #1
	lsls r2, r2, #1
	adds r2, r2, r4
	movs r4, #0
	ldrsh r1, [r2, r4]
	adds r2, r3, r1
	adds r1, r6, #0
	bl sub_80638F0
_080638C0:
	movs r0, #0
	strh r0, [r5, #0x2c]
	ldrh r0, [r5, #0x30]
	adds r0, #2
	strh r0, [r5, #0x30]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #7
	ble _080638E0
	ldr r1, _080638EC  @ gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r5, #0
	bl Proc_Break
_080638E0:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080638E8: .4byte gUnknown_085D6FA4
_080638EC: .4byte gEfxBgSemaphore

	THUMB_FUNC_END sub_8063840

	THUMB_FUNC_START sub_80638F0
sub_80638F0: @ 0x080638F0
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #4
	adds r5, r0, #0
	adds r6, r1, #0
	mov r8, r2
	ldr r1, _0806393C  @ gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08063940  @ ProcScr_efxShineOBJ
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	movs r0, #0x46
	strh r0, [r4, #0x2e]
	ldr r3, _08063944  @ gUnknown_08728C04
	str r3, [sp]
	adds r0, r5, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl EfxAnimCreate1
	str r0, [r4, #0x60]
	strh r6, [r0, #2]
	mov r1, r8
	strh r1, [r0, #4]
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806393C: .4byte gEfxBgSemaphore
_08063940: .4byte ProcScr_efxShineOBJ
_08063944: .4byte gUnknown_08728C04

	THUMB_FUNC_END sub_80638F0

	THUMB_FUNC_START sub_8063948
sub_8063948: @ 0x08063948
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
	bne _0806396C
	ldr r1, _08063970  @ gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r2, #0
	bl Proc_Break
_0806396C:
	pop {r0}
	bx r0
	.align 2, 0
_08063970: .4byte gEfxBgSemaphore

	THUMB_FUNC_END sub_8063948

	THUMB_FUNC_START StartSpellAnimLuna
StartSpellAnimLuna: @ 0x08063974
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl NewEfxSpellCast
	bl SpellFx_SpellFx_ClearBG1Position
	ldr r0, _080639AC  @ ProcScr_efxLuna
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
_080639AC: .4byte ProcScr_efxLuna

	THUMB_FUNC_END StartSpellAnimLuna

	THUMB_FUNC_START sub_80639B0
sub_80639B0: @ 0x080639B0
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetCoreAIStruct
	adds r6, r0, #0
	bl GetAnimationStartFrameMaybe
	adds r5, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	movs r7, #0
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _080639DE
	ldr r0, [r4, #0x5c]
	movs r1, #1
	negs r1, r1
	bl NewEfxFarAttackWithDistance
_080639DE:
	movs r0, #0x2c
	ldrsh r1, [r4, r0]
	adds r0, r5, #1
	cmp r1, r0
	bne _08063A64
	adds r0, r6, #0
	bl sub_8063B6C
	ldr r4, _08063A5C  @ gLCDControlBuffer
	ldrb r1, [r4, #1]
	movs r0, #0x21
	negs r0, r0
	ands r0, r1
	movs r1, #0x41
	negs r1, r1
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r4, #1]
	movs r0, #1
	movs r1, #0
	movs r2, #0x10
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	movs r0, #0x10
	str r0, [sp]
	str r7, [sp, #4]
	adds r0, r6, #0
	movs r1, #0
	movs r2, #0xa
	movs r3, #0
	bl NewEfxALPHA
	movs r5, #0x80
	lsls r5, r5, #1
	movs r0, #2
	str r0, [sp]
	adds r0, r6, #0
	movs r1, #0x14
	movs r2, #0xf
	adds r3, r5, #0
	bl NewefxRestRST
	adds r1, r0, #0
	adds r0, r6, #0
	movs r2, #0x14
	bl sub_806428C
	movs r3, #0x20
	ldrsh r2, [r4, r3]
	adds r0, r6, #0
	movs r1, #0x14
	movs r3, #0
	bl NewEfxRestWINH
	ldr r0, _08063A60  @ 0x000002BD
	adds r1, r5, #0
	movs r2, #0x78
	movs r3, #1
	bl EkrSoundSomeBark
	b _08063B62
	.align 2, 0
_08063A5C: .4byte gLCDControlBuffer
_08063A60: .4byte 0x000002BD
_08063A64:
	adds r0, r5, #0
	adds r0, #0x29
	cmp r1, r0
	bne _08063A92
	bl sub_8063C20
	adds r0, r6, #0
	movs r1, #0x15
	movs r2, #1
	bl NewEfxRestWINH_
	adds r0, r6, #0
	bl sub_8064024
	str r7, [sp]
	str r7, [sp, #4]
	adds r0, r6, #0
	movs r1, #0
	movs r2, #0x19
	movs r3, #0x10
	bl NewEfxALPHA
	b _08063B62
_08063A92:
	adds r0, r5, #0
	adds r0, #0x37
	cmp r1, r0
	bne _08063AB0
	ldr r0, _08063AAC  @ 0x000002BE
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r6, r3]
	movs r3, #0
	bl EkrSoundSomeBark
	b _08063B62
	.align 2, 0
_08063AAC: .4byte 0x000002BE
_08063AB0:
	adds r0, r5, #0
	adds r0, #0x46
	cmp r1, r0
	bne _08063B02
	adds r0, r6, #0
	movs r1, #0x41
	bl sub_8063D64
	adds r0, r6, #0
	movs r1, #0x41
	bl sub_8063EA0
	movs r0, #1
	movs r1, #0
	movs r2, #0x10
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	movs r0, #0x10
	str r0, [sp]
	str r7, [sp, #4]
	adds r0, r6, #0
	movs r1, #0
	movs r2, #0xa
	movs r3, #0
	bl NewEfxALPHA
	movs r0, #1
	str r0, [sp]
	adds r0, r6, #0
	movs r1, #0x41
	movs r2, #2
	movs r3, #0x80
	bl NewefxRestRST
	adds r0, r6, #0
	movs r1, #0x44
	movs r2, #0
	bl NewEfxRestWINH_
	b _08063B62
_08063B02:
	adds r0, r5, #0
	adds r0, #0x87
	cmp r1, r0
	bne _08063B32
	adds r0, r6, #0
	movs r1, #5
	bl StartSpellBG_FLASH
	ldrh r0, [r6, #0x10]
	movs r1, #9
	orrs r0, r1
	strh r0, [r6, #0x10]
	adds r4, #0x29
	ldrb r1, [r4]
	adds r0, r6, #0
	bl StartBattleAnimHitEffectsDefault
	ldrb r0, [r4]
	cmp r0, #0
	bne _08063B62
	adds r0, r6, #0
	bl sub_8072450
	b _08063B62
_08063B32:
	adds r0, r5, #0
	adds r0, #0x8c
	cmp r1, r0
	bne _08063B4C
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	ldr r0, [r4, #0x5c]
	bl sub_8063F3C
	b _08063B62
_08063B4C:
	adds r0, r5, #0
	adds r0, #0xbe
	cmp r1, r0
	bne _08063B62
	bl SpellFx_Finish
	bl EfxSpellCastSet29
	adds r0, r4, #0
	bl Proc_Break
_08063B62:
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80639B0

	THUMB_FUNC_START sub_8063B6C
sub_8063B6C: @ 0x08063B6C
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _08063BB0  @ gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08063BB4  @ gUnknown_085D6FE4
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r1, [r0, #0x44]
	ldr r1, _08063BB8  @ gUnknown_080DE0CE
	str r1, [r0, #0x48]
	ldr r1, _08063BBC  @ gUnknown_085D6FFC
	str r1, [r0, #0x4c]
	str r1, [r0, #0x50]
	ldr r0, _08063BC0  @ gUnknown_0872972C
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	ldr r0, _08063BC4  @ gUnknown_08728C5C
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	bl SpellFx_SetSomeColorEffect
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08063BB0: .4byte gEfxBgSemaphore
_08063BB4: .4byte gUnknown_085D6FE4
_08063BB8: .4byte gUnknown_080DE0CE
_08063BBC: .4byte gUnknown_085D6FFC
_08063BC0: .4byte gUnknown_0872972C
_08063BC4: .4byte gUnknown_08728C5C

	THUMB_FUNC_END sub_8063B6C

	THUMB_FUNC_START sub_8063BC8
sub_8063BC8: @ 0x08063BC8
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl SpellFx_InterpretBgAnimScript
	lsls r0, r0, #0x10
	asrs r2, r0, #0x10
	cmp r2, #0
	blt _08063BF6
	ldr r1, [r4, #0x4c]
	ldr r3, [r4, #0x50]
	ldr r0, [r4, #0x5c]
	lsls r2, r2, #2
	adds r1, r2, r1
	ldr r1, [r1]
	adds r2, r2, r3
	ldr r2, [r2]
	bl SpellFx_WriteBgMap
	b _08063C14
_08063BF6:
	movs r0, #1
	negs r0, r0
	cmp r2, r0
	bne _08063C14
	bl SpellFx_ClearBG1
	ldr r1, _08063C1C  @ gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SetDefaultColorEffects_
	adds r0, r4, #0
	bl Proc_Break
_08063C14:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08063C1C: .4byte gEfxBgSemaphore

	THUMB_FUNC_END sub_8063BC8

	THUMB_FUNC_START sub_8063C20
sub_8063C20: @ 0x08063C20
	push {lr}
	ldr r0, _08063C3C  @ gUnknown_085D7000
	movs r1, #3
	bl Proc_Start
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r1, [r0, #0x2e]
	str r1, [r0, #0x44]
	bl sub_8063CFC
	pop {r0}
	bx r0
	.align 2, 0
_08063C3C: .4byte gUnknown_085D7000

	THUMB_FUNC_END sub_8063C20

	THUMB_FUNC_START sub_8063C40
sub_8063C40: @ 0x08063C40
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	mov r9, r0
	ldr r0, _08063CA4  @ gUnknown_0201FDB8
	ldr r0, [r0]
	ldr r5, _08063CA8  @ gUnknown_0201FB38
	cmp r0, #0
	bne _08063C56
	ldr r5, _08063CAC  @ gUnknown_0201FC78
_08063C56:
	ldr r3, _08063CB0  @ gUnknown_0201FDC4
	cmp r0, #0
	bne _08063C5E
	ldr r3, _08063CB4  @ gUnknown_0201FF04
_08063C5E:
	movs r4, #0
	movs r6, #0
	ldr r0, _08063CB8  @ gUnknown_085D7030
	movs r1, #0xe0
	lsls r1, r1, #0xf
	mov r8, r1
	movs r2, #0x70
	mov ip, r2
	adds r7, r0, #0
	subs r7, #0x20
_08063C72:
	cmp r4, #0xf
	bls _08063CD0
	cmp r4, #0x6f
	bhi _08063CD0
	movs r0, #0
	ldrsh r1, [r7, r0]
	mov r2, r9
	ldr r0, [r2, #0x44]
	muls r0, r1, r0
	lsls r0, r0, #4
	lsrs r2, r0, #0x10
	asrs r1, r0, #0x10
	cmp r1, #0
	beq _08063CC8
	cmp r4, #0x3f
	bhi _08063CC0
	adds r0, r4, #0
	subs r0, #0x70
	cmp r1, r0
	bcs _08063CC8
	ldr r1, _08063CBC  @ 0x0000FF90
	adds r0, r4, r1
	lsls r0, r0, #0x10
	b _08063CC6
	.align 2, 0
_08063CA4: .4byte gUnknown_0201FDB8
_08063CA8: .4byte gUnknown_0201FB38
_08063CAC: .4byte gUnknown_0201FC78
_08063CB0: .4byte gUnknown_0201FDC4
_08063CB4: .4byte gUnknown_0201FF04
_08063CB8: .4byte gUnknown_085D7030
_08063CBC: .4byte 0x0000FF90
_08063CC0:
	cmp r1, ip
	bls _08063CC8
	mov r0, r8
_08063CC6:
	lsrs r2, r0, #0x10
_08063CC8:
	strh r2, [r5]
	adds r5, #2
	strh r2, [r3]
	b _08063CD6
_08063CD0:
	strh r6, [r5]
	adds r5, #2
	strh r6, [r3]
_08063CD6:
	adds r3, #2
	ldr r1, _08063CF8  @ 0xFFFF0000
	add r8, r1
	movs r2, #1
	negs r2, r2
	add ip, r2
	adds r7, #2
	adds r4, #1
	cmp r4, #0x9f
	bls _08063C72
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08063CF8: .4byte 0xFFFF0000

	THUMB_FUNC_END sub_8063C40

	THUMB_FUNC_START sub_8063CFC
sub_8063CFC: @ 0x08063CFC
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08063D18  @ gUnknown_085D7018
	movs r1, #3
	bl Proc_Start
	movs r1, #0
	strh r1, [r0, #0x2c]
	movs r1, #0x14
	strh r1, [r0, #0x2e]
	str r4, [r0, #0x5c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08063D18: .4byte gUnknown_085D7018

	THUMB_FUNC_END sub_8063CFC

	THUMB_FUNC_START sub_8063D1C
sub_8063D1C: @ 0x08063D1C
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r5, [r4, #0x5c]
	movs r2, #0x80
	lsls r2, r2, #7
	movs r0, #0x2c
	ldrsh r3, [r4, r0]
	movs r1, #0x2e
	ldrsh r0, [r4, r1]
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	bl Interpolate
	str r0, [r5, #0x44]
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x2e
	ldrsh r1, [r4, r2]
	cmp r0, r1
	ble _08063D5A
	adds r0, r5, #0
	bl Proc_End
	adds r0, r4, #0
	bl Proc_Break
_08063D5A:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8063D1C

	THUMB_FUNC_START sub_8063D64
sub_8063D64: @ 0x08063D64
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, _08063DC8  @ gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08063DCC  @ gUnknown_085D70F0
	movs r1, #3
	bl Proc_Start
	adds r6, r0, #0
	str r4, [r6, #0x5c]
	movs r0, #0
	strh r0, [r6, #0x2c]
	strh r5, [r6, #0x2e]
	ldr r0, _08063DD0  @ gUnknown_0872987C
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	ldr r0, _08063DD4  @ gUnknown_08729FDC
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	bl SpellFx_ClearBG1
	ldr r0, _08063DD8  @ gUnknown_0872A1BC
	ldr r4, _08063DDC  @ gEkrTsaBuffer
	adds r1, r4, #0
	bl LZ77UnCompWram
	ldr r0, [r6, #0x5c]
	bl GetAISSubjectId
	cmp r0, #0
	bne _08063DE4
	ldr r1, _08063DE0  @ gBG1TilemapBuffer
	movs r0, #1
	str r0, [sp]
	adds r0, #0xff
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r2, #0x1e
	movs r3, #0x20
	bl sub_8070EC4
	b _08063DF8
	.align 2, 0
_08063DC8: .4byte gEfxBgSemaphore
_08063DCC: .4byte gUnknown_085D70F0
_08063DD0: .4byte gUnknown_0872987C
_08063DD4: .4byte gUnknown_08729FDC
_08063DD8: .4byte gUnknown_0872A1BC
_08063DDC: .4byte gEkrTsaBuffer
_08063DE0: .4byte gBG1TilemapBuffer
_08063DE4:
	ldr r1, _08063E24  @ gBG1TilemapBuffer
	movs r0, #1
	str r0, [sp]
	adds r0, #0xff
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r2, #0x1e
	movs r3, #0x20
	bl sub_8070E94
_08063DF8:
	movs r0, #2
	bl BG_EnableSyncByMask
	bl SpellFx_SetSomeColorEffect
	ldr r0, _08063E28  @ gEkrDistanceType
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _08063E36
	ldr r0, [r6, #0x5c]
	bl GetAISSubjectId
	cmp r0, #0
	bne _08063E2C
	movs r0, #1
	movs r1, #0x18
	movs r2, #0
	bl BG_SetPosition
	b _08063E36
	.align 2, 0
_08063E24: .4byte gBG1TilemapBuffer
_08063E28: .4byte gEkrDistanceType
_08063E2C:
	movs r0, #1
	movs r1, #0xe8
	movs r2, #0
	bl BG_SetPosition
_08063E36:
	ldr r2, _08063E54  @ gLCDControlBuffer
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
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08063E54: .4byte gLCDControlBuffer

	THUMB_FUNC_END sub_8063D64

	THUMB_FUNC_START sub_8063E58
sub_8063E58: @ 0x08063E58
	push {lr}
	bl SpellFx_ClearBG1
	ldr r1, _08063E70  @ gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SetDefaultColorEffects_
	pop {r0}
	bx r0
	.align 2, 0
_08063E70: .4byte gEfxBgSemaphore

	THUMB_FUNC_END sub_8063E58

	THUMB_FUNC_START sub_8063E74
sub_8063E74: @ 0x08063E74
	push {lr}
	adds r2, r0, #0
	ldr r1, _08063E9C  @ gLCDControlBuffer
	ldrh r0, [r1, #0x22]
	adds r0, #1
	strh r0, [r1, #0x22]
	ldrh r0, [r2, #0x2c]
	adds r0, #1
	strh r0, [r2, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r3, #0x2e
	ldrsh r1, [r2, r3]
	cmp r0, r1
	ble _08063E98
	adds r0, r2, #0
	bl Proc_Break
_08063E98:
	pop {r0}
	bx r0
	.align 2, 0
_08063E9C: .4byte gLCDControlBuffer

	THUMB_FUNC_END sub_8063E74

	THUMB_FUNC_START sub_8063EA0
sub_8063EA0: @ 0x08063EA0
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, _08063ED8  @ gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08063EDC  @ gUnknown_085D7110
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r1, [r0, #0x2e]
	strh r5, [r0, #0x30]
	str r1, [r0, #0x44]
	ldr r1, _08063EE0  @ gUnknown_080DE106
	str r1, [r0, #0x48]
	ldr r1, _08063EE4  @ gUnknown_08729FDC
	str r1, [r0, #0x4c]
	adds r0, r1, #0
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08063ED8: .4byte gEfxBgSemaphore
_08063EDC: .4byte gUnknown_085D7110
_08063EE0: .4byte gUnknown_080DE106
_08063EE4: .4byte gUnknown_08729FDC

	THUMB_FUNC_END sub_8063EA0

	THUMB_FUNC_START sub_8063EE8
sub_8063EE8: @ 0x08063EE8
	ldr r1, _08063EF4  @ gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bx lr
	.align 2, 0
_08063EF4: .4byte gEfxBgSemaphore

	THUMB_FUNC_END sub_8063EE8

	THUMB_FUNC_START sub_8063EF8
sub_8063EF8: @ 0x08063EF8
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl SpellFx_InterpretBgAnimScript
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	cmp r1, #0
	blt _08063F1C
	ldr r0, [r4, #0x4c]
	lsls r1, r1, #5
	adds r0, r0, r1
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
_08063F1C:
	ldrh r0, [r4, #0x2e]
	adds r0, #1
	strh r0, [r4, #0x2e]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x30
	ldrsh r1, [r4, r2]
	cmp r0, r1
	ble _08063F34
	adds r0, r4, #0
	bl Proc_Break
_08063F34:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8063EF8

	THUMB_FUNC_START sub_8063F3C
sub_8063F3C: @ 0x08063F3C
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r1, _08063F94  @ gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08063F98  @ gUnknown_085D7138
	movs r1, #3
	bl Proc_Start
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	str r0, [r5, #0x44]
	ldr r0, _08063F9C  @ gUnknown_080DE150
	str r0, [r5, #0x48]
	ldr r0, _08063FA0  @ gUnknown_085D7150
	str r0, [r5, #0x4c]
	str r0, [r5, #0x50]
	ldr r0, _08063FA4  @ gUnknown_085D7180
	str r0, [r5, #0x54]
	ldr r0, _08063FA8  @ gUnknown_0872CE60
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	bl SpellFx_SetSomeColorEffect
	ldr r0, _08063FAC  @ gEkrDistanceType
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _08063FBA
	ldr r0, [r5, #0x5c]
	bl GetAISSubjectId
	cmp r0, #0
	bne _08063FB0
	movs r0, #1
	movs r1, #0xe8
	movs r2, #0
	bl BG_SetPosition
	b _08063FBA
	.align 2, 0
_08063F94: .4byte gEfxBgSemaphore
_08063F98: .4byte gUnknown_085D7138
_08063F9C: .4byte gUnknown_080DE150
_08063FA0: .4byte gUnknown_085D7150
_08063FA4: .4byte gUnknown_085D7180
_08063FA8: .4byte gUnknown_0872CE60
_08063FAC: .4byte gEkrDistanceType
_08063FB0:
	movs r0, #1
	movs r1, #0x18
	movs r2, #0
	bl BG_SetPosition
_08063FBA:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8063F3C

	THUMB_FUNC_START sub_8063FC0
sub_8063FC0: @ 0x08063FC0
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl SpellFx_InterpretBgAnimScript
	lsls r0, r0, #0x10
	asrs r3, r0, #0x10
	cmp r3, #0
	blt _08063FFC
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
	b _0806401A
_08063FFC:
	movs r0, #1
	negs r0, r0
	cmp r3, r0
	bne _0806401A
	bl SpellFx_ClearBG1
	ldr r1, _08064020  @ gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SetDefaultColorEffects_
	adds r0, r4, #0
	bl Proc_Break
_0806401A:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08064020: .4byte gEfxBgSemaphore

	THUMB_FUNC_END sub_8063FC0

	THUMB_FUNC_START sub_8064024
sub_8064024: @ 0x08064024
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r4, #0
_0806402A:
	ldr r0, _08064054  @ ProcScr_efxLunaOBJ
	movs r1, #3
	bl Proc_Start
	str r5, [r0, #0x5c]
	str r4, [r0, #0x44]
	adds r4, #1
	cmp r4, #7
	bls _0806402A
	ldr r0, _08064058  @ gUnknown_0872DE04
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _0806405C  @ gUnknown_0872DA04
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08064054: .4byte ProcScr_efxLunaOBJ
_08064058: .4byte gUnknown_0872DE04
_0806405C: .4byte gUnknown_0872DA04

	THUMB_FUNC_END sub_8064024

	THUMB_FUNC_START sub_8064060
sub_8064060: @ 0x08064060
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r1, _080640C0  @ gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	movs r5, #0
	strh r5, [r4, #0x2c]
	strh r5, [r4, #0x2e]
	ldr r1, [r4, #0x44]
	ldr r0, _080640C4  @ 0x00002AAA
	muls r0, r1, r0
	strh r0, [r4, #0x30]
	ldr r3, _080640C8  @ gUnknown_0872DFEC
	ldr r0, [r4, #0x5c]
	str r3, [sp]
	adds r1, r3, #0
	adds r2, r3, #0
	bl EfxAnimCreate1
	str r0, [r4, #0x60]
	strh r5, [r0, #6]
	ldrh r2, [r0, #8]
	ldr r1, _080640CC  @ 0x0000F3FF
	ands r1, r2
	movs r3, #0x80
	lsls r3, r3, #4
	adds r2, r3, #0
	orrs r1, r2
	strh r1, [r0, #8]
	movs r1, #0x80
	lsls r1, r1, #1
	strh r1, [r0, #2]
	strh r1, [r0, #4]
	ldr r1, [r4, #0x5c]
	ldrh r0, [r1, #2]
	strh r0, [r4, #0x32]
	ldrh r0, [r1, #4]
	strh r0, [r4, #0x3a]
	adds r0, r4, #0
	bl Proc_Break
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080640C0: .4byte gEfxBgSemaphore
_080640C4: .4byte 0x00002AAA
_080640C8: .4byte gUnknown_0872DFEC
_080640CC: .4byte 0x0000F3FF

	THUMB_FUNC_END sub_8064060

	THUMB_FUNC_START sub_80640D0
sub_80640D0: @ 0x080640D0
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r5, [r4, #0x60]
	movs r0, #0x2c
	ldrsh r3, [r4, r0]
	movs r7, #0x14
	str r7, [sp]
	movs r0, #4
	movs r1, #0
	movs r2, #0x32
	bl Interpolate
	movs r2, #0x80
	lsls r2, r2, #2
	adds r1, r2, #0
	ldrh r3, [r4, #0x30]
	adds r1, r1, r3
	movs r6, #0
	strh r1, [r4, #0x30]
	ldrh r2, [r4, #0x30]
	lsrs r2, r2, #8
	ldr r3, _08064164  @ gSinLookup
	lsls r1, r2, #1
	adds r1, r1, r3
	adds r2, #0x40
	lsls r2, r2, #1
	adds r2, r2, r3
	movs r3, #0
	ldrsh r1, [r1, r3]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	muls r1, r0, r1
	lsls r1, r1, #4
	movs r3, #0
	ldrsh r2, [r2, r3]
	muls r0, r2, r0
	lsls r0, r0, #4
	asrs r1, r1, #0x10
	ldrh r2, [r4, #0x32]
	adds r1, r1, r2
	asrs r0, r0, #0x10
	ldrh r3, [r4, #0x3a]
	adds r0, r0, r3
	strh r1, [r5, #2]
	strh r0, [r5, #4]
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x14
	ble _0806413C
	strh r7, [r4, #0x2c]
_0806413C:
	ldrh r0, [r4, #0x2e]
	adds r0, #1
	strh r0, [r4, #0x2e]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x14
	ble _0806415C
	strh r6, [r4, #0x2c]
	strh r6, [r4, #0x2e]
	ldr r0, _08064168  @ gUnknown_0872E24C
	str r0, [r5, #0x24]
	str r0, [r5, #0x20]
	strh r6, [r5, #6]
	adds r0, r4, #0
	bl Proc_Break
_0806415C:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08064164: .4byte gSinLookup
_08064168: .4byte gUnknown_0872E24C

	THUMB_FUNC_END sub_80640D0

	THUMB_FUNC_START sub_806416C
sub_806416C: @ 0x0806416C
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r5, [r4, #0x60]
	movs r3, #0x32
	movs r1, #0x80
	lsls r1, r1, #2
	adds r0, r1, #0
	ldrh r2, [r4, #0x30]
	adds r0, r0, r2
	movs r6, #0
	strh r0, [r4, #0x30]
	ldrh r0, [r4, #0x30]
	lsrs r0, r0, #8
	ldr r2, _080641E8  @ gSinLookup
	lsls r1, r0, #1
	adds r1, r1, r2
	adds r0, #0x40
	lsls r0, r0, #1
	adds r0, r0, r2
	movs r2, #0
	ldrsh r1, [r1, r2]
	muls r1, r3, r1
	movs r2, #0
	ldrsh r0, [r0, r2]
	muls r0, r3, r0
	asrs r1, r1, #0xc
	ldrh r2, [r4, #0x32]
	adds r1, r1, r2
	asrs r0, r0, #0xc
	ldrh r2, [r4, #0x3a]
	adds r0, r0, r2
	strh r1, [r5, #2]
	strh r0, [r5, #4]
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x3c
	ble _080641C0
	movs r0, #0x3c
	strh r0, [r4, #0x2c]
_080641C0:
	ldrh r0, [r4, #0x2e]
	adds r0, #1
	strh r0, [r4, #0x2e]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x3c
	ble _080641E0
	strh r6, [r4, #0x2c]
	strh r6, [r4, #0x2e]
	ldr r0, _080641EC  @ gUnknown_0872E024
	str r0, [r5, #0x24]
	str r0, [r5, #0x20]
	strh r6, [r5, #6]
	adds r0, r4, #0
	bl Proc_Break
_080641E0:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080641E8: .4byte gSinLookup
_080641EC: .4byte gUnknown_0872E024

	THUMB_FUNC_END sub_806416C

	THUMB_FUNC_START sub_80641F0
sub_80641F0: @ 0x080641F0
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r4, [r5, #0x60]
	movs r0, #0x2c
	ldrsh r3, [r5, r0]
	movs r6, #0xa
	str r6, [sp]
	movs r0, #1
	movs r1, #0x32
	movs r2, #0
	bl Interpolate
	movs r2, #0x80
	lsls r2, r2, #3
	adds r1, r2, #0
	ldrh r3, [r5, #0x30]
	adds r1, r1, r3
	strh r1, [r5, #0x30]
	ldrh r2, [r5, #0x30]
	lsrs r2, r2, #8
	ldr r3, _08064284  @ gSinLookup
	lsls r1, r2, #1
	adds r1, r1, r3
	adds r2, #0x40
	lsls r2, r2, #1
	adds r2, r2, r3
	movs r3, #0
	ldrsh r1, [r1, r3]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	muls r1, r0, r1
	lsls r1, r1, #4
	movs r3, #0
	ldrsh r2, [r2, r3]
	muls r0, r2, r0
	lsls r0, r0, #4
	asrs r1, r1, #0x10
	ldrh r2, [r5, #0x32]
	adds r1, r1, r2
	asrs r0, r0, #0x10
	ldrh r3, [r5, #0x3a]
	adds r0, r0, r3
	strh r1, [r4, #2]
	strh r0, [r4, #4]
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xa
	ble _0806425A
	strh r6, [r5, #0x2c]
_0806425A:
	ldrh r0, [r5, #0x2e]
	adds r0, #1
	strh r0, [r5, #0x2e]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xa
	ble _0806427C
	ldr r0, _08064288  @ gEfxBgSemaphore
	ldr r1, [r0]
	subs r1, #1
	str r1, [r0]
	ldr r0, [r5, #0x60]
	bl AnimDelete
	adds r0, r5, #0
	bl Proc_Break
_0806427C:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08064284: .4byte gSinLookup
_08064288: .4byte gEfxBgSemaphore

	THUMB_FUNC_END sub_80641F0

	THUMB_FUNC_START sub_806428C
sub_806428C: @ 0x0806428C
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r6, r1, #0
	adds r5, r2, #0
	ldr r1, _080642B4  @ gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _080642B8  @ gUnknown_085D71E0
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r5, [r0, #0x2e]
	str r6, [r0, #0x64]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080642B4: .4byte gEfxBgSemaphore
_080642B8: .4byte gUnknown_085D71E0

	THUMB_FUNC_END sub_806428C

	THUMB_FUNC_START sub_80642BC
sub_80642BC: @ 0x080642BC
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r4, [r5, #0x64]
	movs r0, #0x2c
	ldrsh r3, [r5, r0]
	movs r1, #0x2e
	ldrsh r0, [r5, r1]
	str r0, [sp]
	movs r0, #4
	movs r1, #0x80
	movs r2, #0
	bl Interpolate
	str r0, [r4, #0x4c]
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x2e
	ldrsh r1, [r5, r2]
	cmp r0, r1
	ble _080642FA
	ldr r1, _08064304  @ gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r5, #0
	bl Proc_Break
_080642FA:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08064304: .4byte gEfxBgSemaphore

	THUMB_FUNC_END sub_80642BC

	THUMB_FUNC_START sub_8064308
sub_8064308: @ 0x08064308
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl NewEfxSpellCast
	bl SpellFx_SpellFx_ClearBG1Position
	ldr r0, _08064340  @ gUnknown_085D71F8
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
_08064340: .4byte gUnknown_085D71F8

	THUMB_FUNC_END sub_8064308

	THUMB_FUNC_START sub_8064344
sub_8064344: @ 0x08064344
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r5, r0, #0
	ldr r0, [r5, #0x5c]
	bl GetCoreAIStruct
	adds r4, r0, #0
	bl GetAnimationStartFrameMaybe
	adds r6, r0, #0
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	movs r2, #0
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _08064374
	ldr r0, [r5, #0x5c]
	movs r1, #1
	negs r1, r1
	bl NewEfxFarAttackWithDistance
	b _0806441C
_08064374:
	movs r0, #0x2c
	ldrsh r1, [r5, r0]
	adds r0, r6, #1
	cmp r1, r0
	bne _080643A0
	movs r0, #0x10
	str r0, [sp]
	str r2, [sp, #4]
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0x14
	movs r3, #0
	bl NewEfxALPHA
	adds r0, r4, #0
	bl sub_8064C28
	ldr r0, _0806439C  @ 0x000003B5
	b _080643EA
	.align 2, 0
_0806439C: .4byte 0x000003B5
_080643A0:
	adds r0, r6, #0
	adds r0, #0x29
	cmp r1, r0
	bne _080643BA
	str r2, [sp]
	str r2, [sp, #4]
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0x14
	movs r3, #0x10
	bl NewEfxALPHA
	b _0806441C
_080643BA:
	adds r0, r6, #0
	adds r0, #0x3f
	cmp r1, r0
	bne _080643D4
	movs r0, #0xf
	bl sub_80646FC
	adds r0, r4, #0
	movs r1, #0xf
	movs r2, #1
	bl NewEfxRestWINH_
	b _0806441C
_080643D4:
	adds r0, r6, #0
	adds r0, #0x40
	cmp r1, r0
	bne _08064400
	adds r0, r4, #0
	bl sub_80644E0
	adds r0, r4, #0
	bl sub_806466C
	ldr r0, _080643FC  @ 0x000002BF
_080643EA:
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r4, r3]
	movs r3, #1
	bl EkrSoundSomeBark
	b _0806441C
	.align 2, 0
_080643FC: .4byte 0x000002BF
_08064400:
	adds r0, r6, #0
	adds r0, #0x6c
	cmp r1, r0
	bne _0806441C
	movs r0, #0xb0
	lsls r0, r0, #2
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r2, [r5, #0x5c]
	movs r3, #2
	ldrsh r2, [r2, r3]
	movs r3, #1
	bl EkrSoundSomeBark
_0806441C:
	adds r7, r5, #0
	adds r7, #0x29
	ldrb r0, [r7]
	cmp r0, #0
	bne _080644A2
	movs r0, #0x2c
	ldrsh r1, [r5, r0]
	adds r0, r6, #0
	adds r0, #0x71
	cmp r1, r0
	bne _08064444
	adds r0, r4, #0
	bl sub_8064B90
	adds r0, r4, #0
	bl sub_8064838
	adds r0, r4, #0
	bl sub_8064958
_08064444:
	movs r3, #0x2c
	ldrsh r1, [r5, r3]
	adds r0, r6, #0
	adds r0, #0x92
	cmp r1, r0
	bne _0806446E
	adds r0, r4, #0
	movs r1, #5
	bl StartSpellBG_FLASH
	ldrh r0, [r4, #0x10]
	movs r1, #9
	orrs r1, r0
	strh r1, [r4, #0x10]
	ldrb r1, [r7]
	adds r0, r4, #0
	bl StartBattleAnimHitEffectsDefault
	adds r0, r4, #0
	bl sub_8072450
_0806446E:
	movs r0, #0x2c
	ldrsh r1, [r5, r0]
	adds r0, r6, #0
	adds r0, #0x98
	cmp r1, r0
	bne _08064486
	adds r0, r4, #0
	bl sub_80649E4
	adds r0, r4, #0
	bl sub_8064B04
_08064486:
	movs r3, #0x2c
	ldrsh r1, [r5, r3]
	adds r0, r6, #0
	adds r0, #0xa7
	cmp r1, r0
	bne _080644D8
	bl SpellFx_Finish
	bl EfxSpellCastSet29
	adds r0, r5, #0
	bl Proc_Break
	b _080644D8
_080644A2:
	movs r0, #0x2c
	ldrsh r1, [r5, r0]
	adds r0, r6, #0
	adds r0, #0x6e
	cmp r1, r0
	bne _080644BE
	ldrh r0, [r4, #0x10]
	movs r1, #9
	orrs r1, r0
	strh r1, [r4, #0x10]
	ldrb r1, [r7]
	adds r0, r4, #0
	bl StartBattleAnimHitEffectsDefault
_080644BE:
	movs r3, #0x2c
	ldrsh r1, [r5, r3]
	adds r0, r6, #0
	adds r0, #0x6f
	cmp r1, r0
	bne _080644D8
	bl SpellFx_Finish
	bl EfxSpellCastSet29
	adds r0, r5, #0
	bl Proc_Break
_080644D8:
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8064344

	THUMB_FUNC_START sub_80644E0
sub_80644E0: @ 0x080644E0
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _08064534  @ gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08064538  @ gUnknown_085D7210
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	movs r1, #0x28
	strh r1, [r0, #0x2e]
	ldr r0, _0806453C  @ gUnknown_0872E25C
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	bl SpellFx_ClearBG1
	ldr r0, _08064540  @ gUnknown_0872E7EC
	ldr r1, _08064544  @ gEkrTsaBuffer
	bl LZ77UnCompWram
	bl SpellFx_SetSomeColorEffect
	ldr r2, _08064548  @ gLCDControlBuffer
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
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08064534: .4byte gEfxBgSemaphore
_08064538: .4byte gUnknown_085D7210
_0806453C: .4byte gUnknown_0872E25C
_08064540: .4byte gUnknown_0872E7EC
_08064544: .4byte gEkrTsaBuffer
_08064548: .4byte gLCDControlBuffer

	THUMB_FUNC_END sub_80644E0

	THUMB_FUNC_START sub_806454C
sub_806454C: @ 0x0806454C
	push {lr}
	bl SpellFx_ClearBG1
	ldr r1, _08064564  @ gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SetDefaultColorEffects_
	pop {r0}
	bx r0
	.align 2, 0
_08064564: .4byte gEfxBgSemaphore

	THUMB_FUNC_END sub_806454C

	THUMB_FUNC_START sub_8064568
sub_8064568: @ 0x08064568
	push {r4, lr}
	sub sp, #8
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetAISSubjectId
	cmp r0, #0
	bne _08064598
	ldr r0, _08064590  @ gEkrTsaBuffer
	ldr r1, _08064594  @ gBG1TilemapBuffer
	movs r2, #1
	str r2, [sp]
	adds r2, #0xff
	str r2, [sp, #4]
	movs r2, #0x20
	movs r3, #0x20
	bl sub_8070EC4
	b _080645AC
	.align 2, 0
_08064590: .4byte gEkrTsaBuffer
_08064594: .4byte gBG1TilemapBuffer
_08064598:
	ldr r0, _080645DC  @ gEkrTsaBuffer
	ldr r1, _080645E0  @ gBG1TilemapBuffer
	movs r2, #1
	str r2, [sp]
	adds r2, #0xff
	str r2, [sp, #4]
	movs r2, #0x20
	movs r3, #0x20
	bl sub_8070E94
_080645AC:
	movs r0, #2
	bl BG_EnableSyncByMask
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	movs r2, #0
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r3, #0x2e
	ldrsh r1, [r4, r3]
	cmp r0, r1
	ble _080645EE
	strh r2, [r4, #0x2c]
	movs r0, #6
	strh r0, [r4, #0x2e]
	strh r2, [r4, #0x32]
	ldr r0, [r4, #0x5c]
	bl GetAISSubjectId
	cmp r0, #0
	bne _080645E4
	movs r0, #0x80
	b _080645E6
	.align 2, 0
_080645DC: .4byte gEkrTsaBuffer
_080645E0: .4byte gBG1TilemapBuffer
_080645E4:
	ldr r0, _080645F8  @ 0x0000FF80
_080645E6:
	strh r0, [r4, #0x34]
	adds r0, r4, #0
	bl Proc_Break
_080645EE:
	add sp, #8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080645F8: .4byte 0x0000FF80

	THUMB_FUNC_END sub_8064568

	THUMB_FUNC_START sub_80645FC
sub_80645FC: @ 0x080645FC
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	movs r0, #0x32
	ldrsh r1, [r4, r0]
	movs r5, #0x34
	ldrsh r2, [r4, r5]
	movs r0, #0x2c
	ldrsh r3, [r4, r0]
	movs r5, #0x2e
	ldrsh r0, [r4, r5]
	str r0, [sp]
	movs r0, #0
	bl Interpolate
	ldr r1, _08064648  @ gLCDControlBuffer
	strh r0, [r1, #0x20]
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x2e
	ldrsh r1, [r4, r2]
	cmp r0, r1
	ble _0806463E
	movs r0, #0
	strh r0, [r4, #0x2c]
	movs r0, #0xc
	strh r0, [r4, #0x2e]
	adds r0, r4, #0
	bl Proc_Break
_0806463E:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08064648: .4byte gLCDControlBuffer

	THUMB_FUNC_END sub_80645FC

	THUMB_FUNC_START sub_806464C
sub_806464C: @ 0x0806464C
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
	ble _08064668
	adds r0, r2, #0
	bl Proc_Break
_08064668:
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_806464C

	THUMB_FUNC_START sub_806466C
sub_806466C: @ 0x0806466C
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _080646A0  @ gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _080646A4  @ gUnknown_085D7240
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r1, [r0, #0x2e]
	str r1, [r0, #0x44]
	ldr r1, _080646A8  @ gUnknown_080DE1CE
	str r1, [r0, #0x48]
	ldr r1, _080646AC  @ gUnknown_0872E64C
	str r1, [r0, #0x4c]
	adds r0, r1, #0
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080646A0: .4byte gEfxBgSemaphore
_080646A4: .4byte gUnknown_085D7240
_080646A8: .4byte gUnknown_080DE1CE
_080646AC: .4byte gUnknown_0872E64C

	THUMB_FUNC_END sub_806466C

	THUMB_FUNC_START sub_80646B0
sub_80646B0: @ 0x080646B0
	ldr r1, _080646BC  @ gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bx lr
	.align 2, 0
_080646BC: .4byte gEfxBgSemaphore

	THUMB_FUNC_END sub_80646B0

	THUMB_FUNC_START sub_80646C0
sub_80646C0: @ 0x080646C0
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl SpellFx_InterpretBgAnimScript
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	cmp r1, #0
	blt _080646E6
	ldr r0, [r4, #0x4c]
	lsls r1, r1, #5
	adds r0, r0, r1
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	b _080646F4
_080646E6:
	movs r0, #1
	negs r0, r0
	cmp r1, r0
	bne _080646F4
	adds r0, r4, #0
	bl Proc_Break
_080646F4:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80646C0

	THUMB_FUNC_START sub_80646FC
sub_80646FC: @ 0x080646FC
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0806471C  @ gUnknown_085D7268
	movs r1, #3
	bl Proc_Start
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r1, [r0, #0x2e]
	str r1, [r0, #0x44]
	adds r1, r4, #0
	bl sub_80647D0
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806471C: .4byte gUnknown_085D7268

	THUMB_FUNC_END sub_80646FC

	THUMB_FUNC_START sub_8064720
sub_8064720: @ 0x08064720
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	mov r9, r0
	ldr r0, _0806477C  @ gUnknown_0201FDB8
	ldr r0, [r0]
	ldr r5, _08064780  @ gUnknown_0201FB38
	cmp r0, #0
	bne _08064736
	ldr r5, _08064784  @ gUnknown_0201FC78
_08064736:
	ldr r4, _08064788  @ gUnknown_0201FDC4
	cmp r0, #0
	bne _0806473E
	ldr r4, _0806478C  @ gUnknown_0201FF04
_0806473E:
	movs r3, #0
	movs r0, #0
	mov r8, r0
	movs r1, #0x80
	lsls r1, r1, #0x10
	mov ip, r1
	movs r7, #0x80
	ldr r6, _08064790  @ gUnknown_085D7298
_0806474E:
	cmp r3, #0x7f
	bhi _080647A8
	movs r2, #0
	ldrsh r1, [r6, r2]
	mov r2, r9
	ldr r0, [r2, #0x44]
	muls r0, r1, r0
	lsls r0, r0, #4
	lsrs r2, r0, #0x10
	asrs r1, r0, #0x10
	cmp r1, #0
	beq _080647A0
	cmp r3, #0x3f
	bhi _08064798
	adds r0, r3, #0
	subs r0, #0x80
	cmp r1, r0
	bcs _080647A0
	ldr r1, _08064794  @ 0x0000FF80
	adds r0, r3, r1
	lsls r0, r0, #0x10
	b _0806479E
	.align 2, 0
_0806477C: .4byte gUnknown_0201FDB8
_08064780: .4byte gUnknown_0201FB38
_08064784: .4byte gUnknown_0201FC78
_08064788: .4byte gUnknown_0201FDC4
_0806478C: .4byte gUnknown_0201FF04
_08064790: .4byte gUnknown_085D7298
_08064794: .4byte 0x0000FF80
_08064798:
	cmp r1, r7
	bls _080647A0
	mov r0, ip
_0806479E:
	lsrs r2, r0, #0x10
_080647A0:
	strh r2, [r5]
	adds r5, #2
	strh r2, [r4]
	b _080647B0
_080647A8:
	mov r1, r8
	strh r1, [r5]
	adds r5, #2
	strh r1, [r4]
_080647B0:
	adds r4, #2
	ldr r2, _080647CC  @ 0xFFFF0000
	add ip, r2
	subs r7, #1
	adds r6, #2
	adds r3, #1
	cmp r3, #0x9f
	bls _0806474E
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080647CC: .4byte 0xFFFF0000

	THUMB_FUNC_END sub_8064720

	THUMB_FUNC_START sub_80647D0
sub_80647D0: @ 0x080647D0
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	ldr r0, _080647EC  @ gUnknown_085D7280
	movs r1, #3
	bl Proc_Start
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r4, [r0, #0x2e]
	str r5, [r0, #0x5c]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080647EC: .4byte gUnknown_085D7280

	THUMB_FUNC_END sub_80647D0

	THUMB_FUNC_START sub_80647F0
sub_80647F0: @ 0x080647F0
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r5, [r4, #0x5c]
	movs r1, #0x80
	lsls r1, r1, #7
	movs r0, #0x2c
	ldrsh r3, [r4, r0]
	movs r2, #0x2e
	ldrsh r0, [r4, r2]
	str r0, [sp]
	movs r0, #4
	movs r2, #0
	bl Interpolate
	str r0, [r5, #0x44]
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x2e
	ldrsh r1, [r4, r2]
	cmp r0, r1
	ble _0806482E
	adds r0, r5, #0
	bl Proc_End
	adds r0, r4, #0
	bl Proc_Break
_0806482E:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80647F0

	THUMB_FUNC_START sub_8064838
sub_8064838: @ 0x08064838
	push {r4, r5, lr}
	sub sp, #8
	adds r4, r0, #0
	ldr r1, _0806487C  @ gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08064880  @ gUnknown_085D7398
	movs r1, #3
	bl Proc_Start
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	movs r0, #0xc
	strh r0, [r5, #0x2e]
	ldr r0, _08064884  @ gUnknown_0872E998
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	bl SpellFx_ClearBG1
	ldr r0, _08064888  @ gEkrDistanceType
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _08064894
	ldr r0, _0806488C  @ gUnknown_0872FA84
	ldr r1, _08064890  @ gEkrTsaBuffer
	bl LZ77UnCompWram
	b _0806489C
	.align 2, 0
_0806487C: .4byte gEfxBgSemaphore
_08064880: .4byte gUnknown_085D7398
_08064884: .4byte gUnknown_0872E998
_08064888: .4byte gEkrDistanceType
_0806488C: .4byte gUnknown_0872FA84
_08064890: .4byte gEkrTsaBuffer
_08064894:
	ldr r0, _080648BC  @ gUnknown_0872FEB8
	ldr r1, _080648C0  @ gEkrTsaBuffer
	bl LZ77UnCompWram
_0806489C:
	ldr r0, [r5, #0x5c]
	bl GetAISSubjectId
	cmp r0, #0
	bne _080648C8
	ldr r0, _080648C0  @ gEkrTsaBuffer
	ldr r1, _080648C4  @ gBG1TilemapBuffer
	movs r2, #1
	str r2, [sp]
	adds r2, #0xff
	str r2, [sp, #4]
	movs r2, #0x1e
	movs r3, #0x14
	bl sub_8070EC4
	b _080648DC
	.align 2, 0
_080648BC: .4byte gUnknown_0872FEB8
_080648C0: .4byte gEkrTsaBuffer
_080648C4: .4byte gBG1TilemapBuffer
_080648C8:
	ldr r0, _08064910  @ gEkrTsaBuffer
	ldr r1, _08064914  @ gBG1TilemapBuffer
	movs r2, #1
	str r2, [sp]
	adds r2, #0xff
	str r2, [sp, #4]
	movs r2, #0x1e
	movs r3, #0x14
	bl sub_8070E94
_080648DC:
	movs r0, #2
	bl BG_EnableSyncByMask
	bl SpellFx_SetSomeColorEffect
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	ldr r2, _08064918  @ gLCDControlBuffer
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
_08064910: .4byte gEkrTsaBuffer
_08064914: .4byte gBG1TilemapBuffer
_08064918: .4byte gLCDControlBuffer

	THUMB_FUNC_END sub_8064838

	THUMB_FUNC_START sub_806491C
sub_806491C: @ 0x0806491C
	push {lr}
	bl SpellFx_ClearBG1
	ldr r1, _08064934  @ gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SetDefaultColorEffects_
	pop {r0}
	bx r0
	.align 2, 0
_08064934: .4byte gEfxBgSemaphore

	THUMB_FUNC_END sub_806491C

	THUMB_FUNC_START sub_8064938
sub_8064938: @ 0x08064938
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
	ble _08064954
	adds r0, r2, #0
	bl Proc_Break
_08064954:
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8064938

	THUMB_FUNC_START sub_8064958
sub_8064958: @ 0x08064958
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _0806498C  @ gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08064990  @ ProcScr_efxExcaliburBGCOL2
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r1, [r0, #0x2e]
	str r1, [r0, #0x44]
	ldr r1, _08064994  @ gUnknown_080DE24C
	str r1, [r0, #0x48]
	ldr r1, _08064998  @ gUnknown_0872FA04
	str r1, [r0, #0x4c]
	adds r0, r1, #0
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806498C: .4byte gEfxBgSemaphore
_08064990: .4byte ProcScr_efxExcaliburBGCOL2
_08064994: .4byte gUnknown_080DE24C
_08064998: .4byte gUnknown_0872FA04

	THUMB_FUNC_END sub_8064958

	THUMB_FUNC_START sub_806499C
sub_806499C: @ 0x0806499C
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl SpellFx_InterpretBgAnimScript
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	cmp r1, #0
	blt _080649C2
	ldr r0, [r4, #0x4c]
	lsls r1, r1, #5
	adds r0, r0, r1
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	b _080649D8
_080649C2:
	movs r0, #1
	negs r0, r0
	cmp r1, r0
	bne _080649D8
	ldr r1, _080649E0  @ gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
_080649D8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080649E0: .4byte gEfxBgSemaphore

	THUMB_FUNC_END sub_806499C

	THUMB_FUNC_START sub_80649E4
sub_80649E4: @ 0x080649E4
	push {r4, r5, lr}
	sub sp, #8
	adds r4, r0, #0
	ldr r1, _08064A28  @ gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08064A2C  @ gUnknown_085D73D8
	movs r1, #3
	bl Proc_Start
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	movs r0, #0xc
	strh r0, [r5, #0x2e]
	ldr r0, _08064A30  @ gUnknown_08725DCC
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	bl SpellFx_ClearBG1
	ldr r0, _08064A34  @ gEkrDistanceType
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _08064A40
	ldr r0, _08064A38  @ gUnknown_087270B4
	ldr r1, _08064A3C  @ gEkrTsaBuffer
	bl LZ77UnCompWram
	b _08064A48
	.align 2, 0
_08064A28: .4byte gEfxBgSemaphore
_08064A2C: .4byte gUnknown_085D73D8
_08064A30: .4byte gUnknown_08725DCC
_08064A34: .4byte gEkrDistanceType
_08064A38: .4byte gUnknown_087270B4
_08064A3C: .4byte gEkrTsaBuffer
_08064A40:
	ldr r0, _08064A68  @ gUnknown_08727510
	ldr r1, _08064A6C  @ gEkrTsaBuffer
	bl LZ77UnCompWram
_08064A48:
	ldr r0, [r5, #0x5c]
	bl GetAISSubjectId
	cmp r0, #0
	bne _08064A74
	ldr r0, _08064A6C  @ gEkrTsaBuffer
	ldr r1, _08064A70  @ gBG1TilemapBuffer
	movs r2, #1
	str r2, [sp]
	adds r2, #0xff
	str r2, [sp, #4]
	movs r2, #0x1e
	movs r3, #0x14
	bl sub_8070EC4
	b _08064A88
	.align 2, 0
_08064A68: .4byte gUnknown_08727510
_08064A6C: .4byte gEkrTsaBuffer
_08064A70: .4byte gBG1TilemapBuffer
_08064A74:
	ldr r0, _08064ABC  @ gEkrTsaBuffer
	ldr r1, _08064AC0  @ gBG1TilemapBuffer
	movs r2, #1
	str r2, [sp]
	adds r2, #0xff
	str r2, [sp, #4]
	movs r2, #0x1e
	movs r3, #0x14
	bl sub_8070E94
_08064A88:
	movs r0, #2
	bl BG_EnableSyncByMask
	bl SpellFx_SetSomeColorEffect
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	ldr r2, _08064AC4  @ gLCDControlBuffer
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
_08064ABC: .4byte gEkrTsaBuffer
_08064AC0: .4byte gBG1TilemapBuffer
_08064AC4: .4byte gLCDControlBuffer

	THUMB_FUNC_END sub_80649E4

	THUMB_FUNC_START sub_8064AC8
sub_8064AC8: @ 0x08064AC8
	push {lr}
	bl SpellFx_ClearBG1
	ldr r1, _08064AE0  @ gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SetDefaultColorEffects_
	pop {r0}
	bx r0
	.align 2, 0
_08064AE0: .4byte gEfxBgSemaphore

	THUMB_FUNC_END sub_8064AC8

	THUMB_FUNC_START sub_8064AE4
sub_8064AE4: @ 0x08064AE4
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
	ble _08064B00
	adds r0, r2, #0
	bl Proc_Break
_08064B00:
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8064AE4

	THUMB_FUNC_START sub_8064B04
sub_8064B04: @ 0x08064B04
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _08064B38  @ gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08064B3C  @ gUnknown_085D73F8
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r1, [r0, #0x2e]
	str r1, [r0, #0x44]
	ldr r1, _08064B40  @ gUnknown_080DE284
	str r1, [r0, #0x48]
	ldr r1, _08064B44  @ gUnknown_087302A4
	str r1, [r0, #0x4c]
	adds r0, r1, #0
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08064B38: .4byte gEfxBgSemaphore
_08064B3C: .4byte gUnknown_085D73F8
_08064B40: .4byte gUnknown_080DE284
_08064B44: .4byte gUnknown_087302A4

	THUMB_FUNC_END sub_8064B04

	THUMB_FUNC_START sub_8064B48
sub_8064B48: @ 0x08064B48
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl SpellFx_InterpretBgAnimScript
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	cmp r1, #0
	blt _08064B6E
	ldr r0, [r4, #0x4c]
	lsls r1, r1, #5
	adds r0, r0, r1
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	b _08064B84
_08064B6E:
	movs r0, #1
	negs r0, r0
	cmp r1, r0
	bne _08064B84
	ldr r1, _08064B8C  @ gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
_08064B84:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08064B8C: .4byte gEfxBgSemaphore

	THUMB_FUNC_END sub_8064B48

	THUMB_FUNC_START sub_8064B90
sub_8064B90: @ 0x08064B90
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r1, _08064BE8  @ gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08064BEC  @ gUnknown_085D7418
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	movs r0, #0x28
	strh r0, [r4, #0x2e]
	ldr r3, _08064BF0  @ gUnknown_087312BC
	str r3, [sp]
	adds r0, r5, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl EfxAnimCreate1
	str r0, [r4, #0x60]
	ldr r1, [r4, #0x5c]
	ldrh r1, [r1, #2]
	strh r1, [r0, #2]
	ldr r1, [r4, #0x5c]
	ldrh r1, [r1, #4]
	strh r1, [r0, #4]
	ldr r0, _08064BF4  @ gUnknown_08730780
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _08064BF8  @ gUnknown_08730324
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08064BE8: .4byte gEfxBgSemaphore
_08064BEC: .4byte gUnknown_085D7418
_08064BF0: .4byte gUnknown_087312BC
_08064BF4: .4byte gUnknown_08730780
_08064BF8: .4byte gUnknown_08730324

	THUMB_FUNC_END sub_8064B90

	THUMB_FUNC_START sub_8064BFC
sub_8064BFC: @ 0x08064BFC
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
	bne _08064C20
	ldr r1, _08064C24  @ gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r2, #0
	bl Proc_Break
_08064C20:
	pop {r0}
	bx r0
	.align 2, 0
_08064C24: .4byte gEfxBgSemaphore

	THUMB_FUNC_END sub_8064BFC

	THUMB_FUNC_START sub_8064C28
sub_8064C28: @ 0x08064C28
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _08064C68  @ gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08064C6C  @ gUnknown_085D7430
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r1, [r0, #0x44]
	strh r1, [r0, #0x32]
	ldr r1, _08064C70  @ gUnknown_080DE2B8
	str r1, [r0, #0x48]
	ldr r1, _08064C74  @ gUnknown_085D744C
	str r1, [r0, #0x4c]
	str r1, [r0, #0x50]
	ldr r1, _08064C78  @ gUnknown_085D7448
	str r1, [r0, #0x54]
	ldr r0, _08064C7C  @ gUnknown_08724424
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	bl SpellFx_SetSomeColorEffect
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08064C68: .4byte gEfxBgSemaphore
_08064C6C: .4byte gUnknown_085D7430
_08064C70: .4byte gUnknown_080DE2B8
_08064C74: .4byte gUnknown_085D744C
_08064C78: .4byte gUnknown_085D7448
_08064C7C: .4byte gUnknown_08724424

	THUMB_FUNC_END sub_8064C28

	THUMB_FUNC_START sub_8064C80
sub_8064C80: @ 0x08064C80
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r1, #0x32
	ldrsh r0, [r4, r1]
	adds r0, #0x10
	movs r1, #0xf0
	bl __modsi3
	strh r0, [r4, #0x32]
	ldrh r1, [r4, #0x32]
	movs r0, #1
	movs r2, #0
	bl BG_SetPosition
	adds r0, r4, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl SpellFx_InterpretBgAnimScript
	lsls r0, r0, #0x10
	asrs r2, r0, #0x10
	cmp r2, #0
	blt _08064CD4
	ldr r1, [r4, #0x4c]
	ldr r5, [r4, #0x54]
	ldr r0, [r4, #0x5c]
	lsls r4, r2, #2
	adds r1, r4, r1
	ldr r1, [r1]
	movs r2, #0x20
	movs r3, #0x14
	bl sub_805576C
	adds r4, r4, r5
	ldr r0, [r4]
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	b _08064CF2
_08064CD4:
	movs r0, #1
	negs r0, r0
	cmp r2, r0
	bne _08064CF2
	bl SpellFx_ClearBG1
	ldr r1, _08064CF8  @ gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SetDefaultColorEffects_
	adds r0, r4, #0
	bl Proc_End
_08064CF2:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08064CF8: .4byte gEfxBgSemaphore

	THUMB_FUNC_END sub_8064C80

	THUMB_FUNC_START nullsub_51
nullsub_51: @ 0x08064CFC
	bx lr

	THUMB_FUNC_END nullsub_51

	THUMB_FUNC_START sub_8064D00
sub_8064D00: @ 0x08064D00
	push {r4, r5, lr}
	sub sp, #8
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, _08064D88  @ gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08064D8C  @ gUnknown_085D7450
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r5, [r0, #0x2e]
	ldr r0, _08064D90  @ gUnknown_087313C8
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	ldr r0, _08064D94  @ gUnknown_08732228
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	bl SpellFx_ClearBG1
	ldr r0, _08064D98  @ gUnknown_08732368
	ldr r4, _08064D9C  @ gEkrTsaBuffer
	adds r1, r4, #0
	bl LZ77UnCompWram
	ldr r1, _08064DA0  @ gBG1TilemapBuffer
	movs r0, #1
	str r0, [sp]
	adds r0, #0xff
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r2, #0x1e
	movs r3, #0x14
	bl sub_8070EC4
	movs r0, #2
	bl BG_EnableSyncByMask
	bl SpellFx_SetSomeColorEffect
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	ldr r2, _08064DA4  @ gLCDControlBuffer
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
_08064D88: .4byte gEfxBgSemaphore
_08064D8C: .4byte gUnknown_085D7450
_08064D90: .4byte gUnknown_087313C8
_08064D94: .4byte gUnknown_08732228
_08064D98: .4byte gUnknown_08732368
_08064D9C: .4byte gEkrTsaBuffer
_08064DA0: .4byte gBG1TilemapBuffer
_08064DA4: .4byte gLCDControlBuffer

	THUMB_FUNC_END sub_8064D00

	THUMB_FUNC_START sub_8064DA8
sub_8064DA8: @ 0x08064DA8
	push {lr}
	bl SpellFx_ClearBG1
	ldr r1, _08064DC0  @ gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SetDefaultColorEffects_
	pop {r0}
	bx r0
	.align 2, 0
_08064DC0: .4byte gEfxBgSemaphore

	THUMB_FUNC_END sub_8064DA8

	THUMB_FUNC_START sub_8064DC4
sub_8064DC4: @ 0x08064DC4
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
	ble _08064DE0
	adds r0, r2, #0
	bl Proc_Break
_08064DE0:
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8064DC4

	THUMB_FUNC_START sub_8064DE4
sub_8064DE4: @ 0x08064DE4
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _08064E18  @ gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08064E1C  @ ProcScr_efxGespenstBGCOL2
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r1, [r0, #0x2e]
	str r1, [r0, #0x44]
	ldr r1, _08064E20  @ gUnknown_080DE2E2
	str r1, [r0, #0x48]
	ldr r1, _08064E24  @ gUnknown_08732228
	str r1, [r0, #0x4c]
	ldr r0, _08064E28  @ gUnknown_08731348
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08064E18: .4byte gEfxBgSemaphore
_08064E1C: .4byte ProcScr_efxGespenstBGCOL2
_08064E20: .4byte gUnknown_080DE2E2
_08064E24: .4byte gUnknown_08732228
_08064E28: .4byte gUnknown_08731348

	THUMB_FUNC_END sub_8064DE4

	THUMB_FUNC_START sub_8064E2C
sub_8064E2C: @ 0x08064E2C
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl SpellFx_InterpretBgAnimScript
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	cmp r1, #0
	blt _08064E52
	ldr r0, [r4, #0x4c]
	lsls r1, r1, #5
	adds r0, r0, r1
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	b _08064E68
_08064E52:
	movs r0, #1
	negs r0, r0
	cmp r1, r0
	bne _08064E68
	ldr r1, _08064E70  @ gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
_08064E68:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08064E70: .4byte gEfxBgSemaphore

	THUMB_FUNC_END sub_8064E2C

	THUMB_FUNC_START StartSpellAnimAura
StartSpellAnimAura: @ 0x08064E74
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl NewEfxSpellCast
	bl SpellFx_SpellFx_ClearBG1Position
	ldr r0, _08064EAC  @ gUnknown_085D7490
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
_08064EAC: .4byte gUnknown_085D7490

	THUMB_FUNC_END StartSpellAnimAura

	THUMB_FUNC_START sub_8064EB0
sub_8064EB0: @ 0x08064EB0
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetCoreAIStruct
	adds r5, r0, #0
	bl GetAnimationStartFrameMaybe
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
	bl StartSpellBG_FLASH
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
	bl EkrSoundSomeBark
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
	bl StartSpellBG_FLASH
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
	bl sub_8072450
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
	bl EfxSpellCastSet29
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
	bl GetAISSubjectId
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
	bl GetAISSubjectId
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
	bl GetAISSubjectId
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
	bl SpellFx_InterpretBgAnimScript
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
	ldr r0, _08065268  @ gUnknown_08725DCC
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	bl SpellFx_ClearBG1
	ldr r0, _0806526C  @ gEkrDistanceType
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _08065278
	ldr r0, _08065270  @ gUnknown_087270B4
	ldr r1, _08065274  @ gEkrTsaBuffer
	bl LZ77UnCompWram
	b _08065280
	.align 2, 0
_08065260: .4byte gEfxBgSemaphore
_08065264: .4byte gUnknown_085D7530
_08065268: .4byte gUnknown_08725DCC
_0806526C: .4byte gEkrDistanceType
_08065270: .4byte gUnknown_087270B4
_08065274: .4byte gEkrTsaBuffer
_08065278:
	ldr r0, _080652A0  @ gUnknown_08727510
	ldr r1, _080652A4  @ gEkrTsaBuffer
	bl LZ77UnCompWram
_08065280:
	ldr r0, [r5, #0x5c]
	bl GetAISSubjectId
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
	bl sub_8070EC4
	b _080652C0
	.align 2, 0
_080652A0: .4byte gUnknown_08727510
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
	bl sub_8070E94
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
	ldr r0, _08065380  @ gUnknown_08726FF4
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
_08065380: .4byte gUnknown_08726FF4

	THUMB_FUNC_END sub_806533C

	THUMB_FUNC_START sub_8065384
sub_8065384: @ 0x08065384
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl SpellFx_InterpretBgAnimScript
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
	bl SpellFx_InterpretBgAnimScript
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
	bl SpellFx_InterpretBgAnimScript
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
	bl GetAISSubjectId
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
	ldr r0, _08065590  @ gUnknown_020234E2
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
_08065590: .4byte gUnknown_020234E2
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
	bl EfxAnimCreate1
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
	bl SpellFx_SpellFx_ClearBG1Position
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
_0806566C: .4byte ProcScr_efxDancepara

	THUMB_FUNC_END sub_8065634

	THUMB_FUNC_START sub_8065670
sub_8065670: @ 0x08065670
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl SpellFx_SpellFx_ClearBG1Position
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
_080656A8: .4byte ProcScr_efxDancepara

	THUMB_FUNC_END sub_8065670

	THUMB_FUNC_START sub_80656AC
sub_80656AC: @ 0x080656AC
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl SpellFx_SpellFx_ClearBG1Position
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
_080656E4: .4byte ProcScr_efxDancepara

	THUMB_FUNC_END sub_80656AC

	THUMB_FUNC_START sub_80656E8
sub_80656E8: @ 0x080656E8
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl SpellFx_SpellFx_ClearBG1Position
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
_08065720: .4byte ProcScr_efxDancepara

	THUMB_FUNC_END sub_80656E8

	THUMB_FUNC_START sub_8065724
sub_8065724: @ 0x08065724
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r5, r0, #0
	ldr r0, [r5, #0x5c]
	bl GetCoreAIStruct
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
	bl EkrSoundSomeBark
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
