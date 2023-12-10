	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	/**
	 * Magic spell anim effects
	 */

	THUMB_FUNC_START StartSpellAnimSilence
StartSpellAnimSilence: @ 0x080623E0
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SpellFx_Begin
	bl NewEfxSpellCast
	bl SpellFx_ClearBG1Position
	ldr r0, _08062418  @ gUnknown_085D6B20
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
	bl GetAnimAnotherSide
	adds r5, r0, #0
	bl EfxGetCamMovDuration
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
	bl PlaySFX
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
	bl PlaySFX
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
	bl PlaySFX
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
	bl NewEfxFlashBgWhite
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
	bl RegisterEfxSpellCastEnd
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
	bl GetAnimPosition
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
	bl EfxAdvanceFrameLut
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
	bl EfxCreateFrontAnim
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
	bl SpellFx_ClearBG1Position
	ldr r0, _080626B0  @ gUnknown_085D6BB8
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
	bl GetAnimAnotherSide
	adds r5, r0, #0
	bl EfxGetCamMovDuration
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
	bl PlaySFX
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
	bl RegisterEfxSpellCastEnd
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
	bl GetAnimPosition
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
	bl EfxAdvanceFrameLut
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
	bl EfxCreateFrontAnim
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
	bl EfxCreateFrontAnim
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
	bl PlaySFX
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
	bl SpellFx_ClearBG1Position
	ldr r0, _080629D0  @ ProcScr_efxHammarne
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
	bl GetAnimAnotherSide
	adds r6, r0, #0
	bl EfxGetCamMovDuration
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
	bl PlaySFX
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
	bl RegisterEfxSpellCastEnd
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
	bl EfxAdvanceFrameLut
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
	bl EfxCreateFrontAnim
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
	bl SpellFx_ClearBG1Position
	ldr r0, _08062C4C  @ ProcScr_efxBerserk
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
_08062C4C: .4byte ProcScr_efxBerserk

	THUMB_FUNC_END StartSpellAnimBerserk

	THUMB_FUNC_START sub_8062C50
sub_8062C50: @ 0x08062C50
	push {r4, r5, r6, r7, lr}
	sub sp, #4
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
	bl PlaySFX
	b _08062D26
_08062CCC:
	adds r0, r6, #0
	adds r0, #0x4a
	cmp r1, r0
	bne _08062D08
	adds r0, r5, #0
	movs r1, #5
	bl NewEfxFlashBgWhite
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
	bl RegisterEfxSpellCastEnd
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
	ldr r0, _08062E30  @ Img_086849B8
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
	bl EfxTmCpyBG
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
_08062E30: .4byte Img_086849B8
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
	bl GetAnimAnotherSide
	ldr r3, _08062F9C  @ FramScr_Unk5D4F90
	ldr r0, [r4, #0x5c]
	str r3, [sp]
	adds r1, r3, #0
	adds r2, r3, #0
	bl EfxCreateFrontAnim
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
	bl SpellFx_ClearBG1Position
	ldr r0, _0806324C  @ ProcScr_efxMshield
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
_0806324C: .4byte ProcScr_efxMshield

	THUMB_FUNC_END sub_8063214

	THUMB_FUNC_START sub_8063250
sub_8063250: @ 0x08063250
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x5c]
	bl GetAnimAnotherSide
	adds r4, r0, #0
	bl EfxGetCamMovDuration
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
	bl PlaySFX
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
	bl RegisterEfxSpellCastEnd
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
	bl EfxAdvanceFrameLut
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
	bl EfxCreateFrontAnim
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
	bl EfxCreateFrontAnim
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
	bl SpellFx_ClearBG1Position
	ldr r0, _080634B8  @ ProcScr_efxShine
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
_080634B8: .4byte ProcScr_efxShine

	THUMB_FUNC_END StartSpellAnimShine

	THUMB_FUNC_START sub_80634BC
sub_80634BC: @ 0x080634BC
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
	bl NewEfxFlashBgWhite
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
	bl PlaySFX
	b _08063588
_0806351C:
	adds r0, r6, #0
	adds r0, #0x17
	cmp r1, r0
	bne _08063534
	adds r0, r5, #0
	movs r1, #5
	bl NewEfxFlashBgWhite
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
	bl EfxPlayHittedSFX
	b _08063588
_08063572:
	adds r0, r6, #0
	adds r0, #0x23
	cmp r1, r0
	bne _08063588
	bl SpellFx_Finish
	bl RegisterEfxSpellCastEnd
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
	bl EfxAdvanceFrameLut
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
	bl GetAnimPosition
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
	bl EfxAdvanceFrameLut
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
	bl GetAnimPosition
	adds r1, r0, #0
	cmp r1, #0
	bne _08063728
	ldr r0, _08063724  @ gBG1TilemapBuffer
	b _0806372C
	.align 2, 0
_08063720: .4byte gEkrDistanceType
_08063724: .4byte gBG1TilemapBuffer
_08063728:
	ldr r0, _0806373C  @ gBG1TilemapBuffer+0x03A
	movs r1, #0
_0806372C:
	str r1, [sp]
	movs r1, #3
	movs r2, #0x14
	movs r3, #0
	bl FillBGRect
	b _0806375E
	.align 2, 0
_0806373C: .4byte gBG1TilemapBuffer+0x03A
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
	bl EfxAdvanceFrameLut
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
	bl GetAnimPosition
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
	bl EfxCreateFrontAnim
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
	bl SpellFx_ClearBG1Position
	ldr r0, _080639AC  @ ProcScr_efxLuna
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
_080639AC: .4byte ProcScr_efxLuna

	THUMB_FUNC_END StartSpellAnimLuna

	THUMB_FUNC_START sub_80639B0
sub_80639B0: @ 0x080639B0
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetAnimAnotherSide
	adds r6, r0, #0
	bl EfxGetCamMovDuration
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
	bl PlaySFX
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
	bl PlaySFX
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
	bl NewEfxFlashBgWhite
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
	bl EfxPlayHittedSFX
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
	bl RegisterEfxSpellCastEnd
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
	bl EfxAdvanceFrameLut
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
	ldr r0, _08063CA4  @ gEkrBg1ScrollFlip
	ldr r0, [r0]
	ldr r5, _08063CA8  @ gpEkrLvupBg2ScrollOffsetTable1
	cmp r0, #0
	bne _08063C56
	ldr r5, _08063CAC  @ gpEkrLvupBg2ScrollOffsetTable2
_08063C56:
	ldr r3, _08063CB0  @ gpEkrLvupBg1ScrollOffsetList1
	cmp r0, #0
	bne _08063C5E
	ldr r3, _08063CB4  @ gpEkrLvupBg1ScrollOffsetList2
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
_08063CA4: .4byte gEkrBg1ScrollFlip
_08063CA8: .4byte gpEkrLvupBg2ScrollOffsetTable1
_08063CAC: .4byte gpEkrLvupBg2ScrollOffsetTable2
_08063CB0: .4byte gpEkrLvupBg1ScrollOffsetList1
_08063CB4: .4byte gpEkrLvupBg1ScrollOffsetList2
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
	bl GetAnimPosition
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
	bl EfxTmCpyBgHFlip
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
	bl EfxTmCpyBG
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
	bl GetAnimPosition
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
	bl EfxAdvanceFrameLut
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
	bl GetAnimPosition
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
	bl EfxAdvanceFrameLut
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
	bl EfxCreateFrontAnim
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
	bl SpellFx_ClearBG1Position
	ldr r0, _08064340  @ gUnknown_085D71F8
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
_08064340: .4byte gUnknown_085D71F8

	THUMB_FUNC_END sub_8064308

	THUMB_FUNC_START sub_8064344
sub_8064344: @ 0x08064344
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r5, r0, #0
	ldr r0, [r5, #0x5c]
	bl GetAnimAnotherSide
	adds r4, r0, #0
	bl EfxGetCamMovDuration
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
	bl PlaySFX
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
	bl PlaySFX
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
	bl NewEfxFlashBgWhite
	ldrh r0, [r4, #0x10]
	movs r1, #9
	orrs r1, r0
	strh r1, [r4, #0x10]
	ldrb r1, [r7]
	adds r0, r4, #0
	bl StartBattleAnimHitEffectsDefault
	adds r0, r4, #0
	bl EfxPlayHittedSFX
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
	bl RegisterEfxSpellCastEnd
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
	bl RegisterEfxSpellCastEnd
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
	bl GetAnimPosition
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
	bl EfxTmCpyBgHFlip
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
	bl EfxTmCpyBG
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
	bl GetAnimPosition
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
	bl EfxAdvanceFrameLut
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
	ldr r0, _0806477C  @ gEkrBg1ScrollFlip
	ldr r0, [r0]
	ldr r5, _08064780  @ gpEkrLvupBg2ScrollOffsetTable1
	cmp r0, #0
	bne _08064736
	ldr r5, _08064784  @ gpEkrLvupBg2ScrollOffsetTable2
_08064736:
	ldr r4, _08064788  @ gpEkrLvupBg1ScrollOffsetList1
	cmp r0, #0
	bne _0806473E
	ldr r4, _0806478C  @ gpEkrLvupBg1ScrollOffsetList2
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
_0806477C: .4byte gEkrBg1ScrollFlip
_08064780: .4byte gpEkrLvupBg2ScrollOffsetTable1
_08064784: .4byte gpEkrLvupBg2ScrollOffsetTable2
_08064788: .4byte gpEkrLvupBg1ScrollOffsetList1
_0806478C: .4byte gpEkrLvupBg1ScrollOffsetList2
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
	bl GetAnimPosition
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
	bl EfxTmCpyBgHFlip
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
	bl EfxTmCpyBG
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
	bl EfxAdvanceFrameLut
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
	bl GetAnimPosition
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
	bl EfxTmCpyBgHFlip
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
	bl EfxTmCpyBG
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
	bl EfxAdvanceFrameLut
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
	bl EfxCreateFrontAnim
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
	bl EfxAdvanceFrameLut
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
	bl SpellFx_WriteBgMapExt
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
	bl EfxTmCpyBgHFlip
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
	bl EfxAdvanceFrameLut
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
