	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	THUMB_FUNC_START NewEfxSkillCommonBG
NewEfxSkillCommonBG: @ 0x0806E58C
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	lsls r5, r1, #0x18
	lsrs r5, r5, #0x18
	ldr r0, _0806E5E8  @ ProcScr_efxSkillCommonBG
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	str r6, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	str r0, [r4, #0x44]
	strh r5, [r4, #0x3a]
	ldr r0, _0806E5EC  @ gUnknown_080DF5D6
	str r0, [r4, #0x48]
	ldr r0, _0806E5F0  @ TsaLut_EfxSkillType01BG
	str r0, [r4, #0x4c]
	str r0, [r4, #0x50]
	ldr r0, _0806E5F4  @ ImgLut_EfxSkillType01BG
	str r0, [r4, #0x54]
	ldr r0, _0806E5F8  @ PalLut_EfxSkillType01BG
	str r0, [r4, #0x58]
	bl sub_80551B0
	ldr r0, [r4, #0x5c]
	bl GetCoreAIStruct
	adds r1, r0, #0
	ldr r0, _0806E5FC  @ gEkrDistanceType
	movs r2, #0
	ldrsh r0, [r0, r2]
	cmp r0, #0
	beq _0806E60A
	adds r0, r1, #0
	bl GetAISSubjectId
	cmp r0, #0
	bne _0806E600
	movs r0, #1
	movs r1, #0x18
	movs r2, #0
	bl BG_SetPosition
	b _0806E60A
	.align 2, 0
_0806E5E8: .4byte ProcScr_efxSkillCommonBG
_0806E5EC: .4byte gUnknown_080DF5D6
_0806E5F0: .4byte TsaLut_EfxSkillType01BG
_0806E5F4: .4byte ImgLut_EfxSkillType01BG
_0806E5F8: .4byte PalLut_EfxSkillType01BG
_0806E5FC: .4byte gEkrDistanceType
_0806E600:
	movs r0, #1
	movs r1, #0xe8
	movs r2, #0
	bl BG_SetPosition
_0806E60A:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END NewEfxSkillCommonBG

	THUMB_FUNC_START sub_806E610
sub_806E610: @ 0x0806E610
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0806E634  @ 0x000003D1
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r2, [r4, #0x5c]
	movs r3, #2
	ldrsh r2, [r2, r3]
	movs r3, #1
	bl EkrSoundSomeBark
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806E634: .4byte 0x000003D1

	THUMB_FUNC_END sub_806E610

	THUMB_FUNC_START sub_806E638
sub_806E638: @ 0x0806E638
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	ldr r0, [r6, #0x5c]
	bl GetCoreAIStruct
	adds r7, r0, #0
	adds r0, r6, #0
	adds r0, #0x2c
	adds r1, r6, #0
	adds r1, #0x44
	ldr r2, [r6, #0x48]
	bl sub_80558F4
	lsls r0, r0, #0x10
	asrs r4, r0, #0x10
	cmp r4, #0
	blt _0806E6B4
	ldr r0, [r6, #0x4c]
	ldr r2, [r6, #0x50]
	ldr r5, [r6, #0x54]
	ldr r6, [r6, #0x58]
	lsls r4, r4, #2
	adds r0, r4, r0
	ldr r1, [r0]
	adds r2, r4, r2
	ldr r2, [r2]
	adds r0, r7, #0
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
	movs r3, #0
	ldr r4, _0806E6B0  @ gBG1TilemapBuffer
_0806E68C:
	lsls r2, r3, #5
	adds r0, r2, #0
	adds r0, #0x1e
	lsls r0, r0, #1
	adds r0, r0, r4
	ldrh r1, [r4]
	strh r1, [r0]
	adds r2, #0x1f
	lsls r2, r2, #1
	adds r2, r2, r4
	ldrh r0, [r4]
	strh r0, [r2]
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #0x13
	bls _0806E68C
	b _0806E6DA
	.align 2, 0
_0806E6B0: .4byte gBG1TilemapBuffer
_0806E6B4:
	movs r0, #1
	negs r0, r0
	cmp r4, r0
	bne _0806E6DA
	movs r1, #0x3a
	ldrsh r0, [r6, r1]
	cmp r0, #1
	bne _0806E6CC
	adds r0, r7, #0
	movs r1, #0xc
	bl SetUnitEfxDebuff
_0806E6CC:
	bl ClearBG1
	bl SetDefaultColorEffects_
	adds r0, r6, #0
	bl Proc_Break
_0806E6DA:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_806E638

	THUMB_FUNC_START sub_806E6E0
sub_806E6E0: @ 0x0806E6E0
	push {r4, r5, r6, lr}
	mov r6, sl
	mov r5, r9
	mov r4, r8
	push {r4, r5, r6}
	mov sl, r0
	ldr r4, [r0, #0x5c]
	ldr r0, _0806E798  @ gAnims
	mov r9, r0
	adds r0, r4, #0
	bl GetAISSubjectId
	lsls r0, r0, #3
	add r0, r9
	ldr r6, [r0]
	adds r0, r4, #0
	bl GetAISSubjectId
	lsls r0, r0, #1
	adds r0, #1
	lsls r0, r0, #2
	add r0, r9
	ldr r1, [r0]
	ldrh r0, [r4, #0x10]
	movs r2, #0x20
	mov r8, r2
	mov r2, r8
	orrs r0, r2
	strh r0, [r4, #0x10]
	ldrh r0, [r4]
	movs r5, #8
	orrs r0, r5
	strh r0, [r4]
	ldrh r0, [r6, #0x10]
	orrs r0, r2
	strh r0, [r6, #0x10]
	ldrh r0, [r6]
	orrs r0, r5
	strh r0, [r6]
	ldrh r0, [r1, #0x10]
	orrs r0, r2
	strh r0, [r1, #0x10]
	ldrh r0, [r1]
	orrs r0, r5
	strh r0, [r1]
	mov r1, sl
	ldr r0, [r1, #0x5c]
	bl GetCoreAIStruct
	adds r4, r0, #0
	bl GetAISSubjectId
	lsls r0, r0, #3
	add r0, r9
	ldr r6, [r0]
	adds r0, r4, #0
	bl GetAISSubjectId
	lsls r0, r0, #1
	adds r0, #1
	lsls r0, r0, #2
	add r0, r9
	ldr r1, [r0]
	ldrh r0, [r4, #0x10]
	mov r2, r8
	orrs r0, r2
	strh r0, [r4, #0x10]
	ldrh r0, [r4]
	orrs r0, r5
	strh r0, [r4]
	ldrh r0, [r6, #0x10]
	orrs r0, r2
	strh r0, [r6, #0x10]
	ldrh r0, [r6]
	orrs r0, r5
	strh r0, [r6]
	ldrh r0, [r1, #0x10]
	orrs r0, r2
	strh r0, [r1, #0x10]
	ldrh r0, [r1]
	orrs r5, r0
	strh r5, [r1]
	mov r0, sl
	bl Proc_Break
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806E798: .4byte gAnims

	THUMB_FUNC_END sub_806E6E0

	THUMB_FUNC_START sub_806E79C
sub_806E79C: @ 0x0806E79C
	push {r4, r5, r6, lr}
	mov r6, r9
	mov r5, r8
	push {r5, r6}
	sub sp, #4
	mov r9, r0
	ldr r4, [r0, #0x5c]
	ldr r0, _0806E860  @ gAnims
	mov r8, r0
	adds r0, r4, #0
	bl GetAISSubjectId
	lsls r0, r0, #3
	add r0, r8
	ldr r3, [r0]
	adds r0, r4, #0
	str r3, [sp]
	bl GetAISSubjectId
	lsls r0, r0, #1
	adds r0, #1
	lsls r0, r0, #2
	add r0, r8
	ldr r2, [r0]
	ldrh r0, [r4, #0x10]
	movs r6, #0x40
	orrs r0, r6
	strh r0, [r4, #0x10]
	ldrh r1, [r4]
	ldr r5, _0806E864  @ 0x0000FFF7
	adds r0, r5, #0
	ands r0, r1
	strh r0, [r4]
	ldr r3, [sp]
	ldrh r0, [r3, #0x10]
	orrs r0, r6
	strh r0, [r3, #0x10]
	ldrh r1, [r3]
	adds r0, r5, #0
	ands r0, r1
	strh r0, [r3]
	ldrh r0, [r2, #0x10]
	orrs r0, r6
	strh r0, [r2, #0x10]
	ldrh r1, [r2]
	adds r0, r5, #0
	ands r0, r1
	strh r0, [r2]
	mov r1, r9
	ldr r0, [r1, #0x5c]
	bl GetCoreAIStruct
	adds r4, r0, #0
	bl GetAISSubjectId
	lsls r0, r0, #3
	add r0, r8
	ldr r3, [r0]
	adds r0, r4, #0
	str r3, [sp]
	bl GetAISSubjectId
	lsls r0, r0, #1
	adds r0, #1
	lsls r0, r0, #2
	add r0, r8
	ldr r2, [r0]
	ldrh r0, [r4, #0x10]
	orrs r0, r6
	strh r0, [r4, #0x10]
	ldrh r1, [r4]
	adds r0, r5, #0
	ands r0, r1
	strh r0, [r4]
	ldr r3, [sp]
	ldrh r0, [r3, #0x10]
	orrs r0, r6
	strh r0, [r3, #0x10]
	ldrh r1, [r3]
	adds r0, r5, #0
	ands r0, r1
	strh r0, [r3]
	ldrh r0, [r2, #0x10]
	orrs r6, r0
	strh r6, [r2, #0x10]
	ldrh r0, [r2]
	ands r5, r0
	strh r5, [r2]
	mov r0, r9
	bl Proc_Break
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806E860: .4byte gAnims
_0806E864: .4byte 0x0000FFF7

	THUMB_FUNC_END sub_806E79C

	THUMB_FUNC_START sub_806E868
sub_806E868: @ 0x0806E868
	push {r4, lr}
	adds r4, r0, #0
	bl GetAnimationStartFrameMaybe
	adds r2, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _0806E88C
	ldr r0, [r4, #0x5c]
	movs r1, #1
	negs r1, r1
	bl NewEfxFarAttackWithDistance
	b _0806E89E
_0806E88C:
	movs r0, #0x2c
	ldrsh r1, [r4, r0]
	adds r0, r2, #0
	adds r0, #0xa
	cmp r1, r0
	bne _0806E89E
	adds r0, r4, #0
	bl Proc_Break
_0806E89E:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_806E868

	THUMB_FUNC_START sub_806E8A4
sub_806E8A4: @ 0x0806E8A4
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
	bne _0806E8D0
	movs r1, #1
	negs r1, r1
	adds r0, r5, #0
	bl NewEfxFarAttackWithDistance
	b _0806E8EA
_0806E8D0:
	movs r0, #0x2c
	ldrsh r1, [r4, r0]
	adds r0, r2, #0
	adds r0, #0xa
	cmp r1, r0
	bne _0806E8EA
	ldrh r0, [r5, #0x10]
	movs r1, #0x40
	orrs r0, r1
	strh r0, [r5, #0x10]
	adds r0, r4, #0
	bl Proc_Break
_0806E8EA:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_806E8A4

.align 2, 0
