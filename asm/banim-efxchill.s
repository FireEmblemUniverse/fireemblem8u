	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	THUMB_FUNC_START NewEfxChillEffect
NewEfxChillEffect: @ 0x0806E014
	push {r4, lr}
	adds r4, r0, #0
	bl ClearBG1Setup
	ldr r0, _0806E030  @ ProcScr_efxChillEffect
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806E030: .4byte ProcScr_efxChillEffect

	THUMB_FUNC_END NewEfxChillEffect

	THUMB_FUNC_START sub_806E034
sub_806E034: @ 0x0806E034
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _0806E054
	ldr r0, [r4, #0x5c]
	bl sub_806E078
	ldr r0, [r4, #0x5c]
	bl sub_806E128
	b _0806E070
_0806E054:
	cmp r0, #3
	beq _0806E05C
	cmp r0, #0x11
	bne _0806E066
_0806E05C:
	ldr r0, [r4, #0x5c]
	movs r1, #5
	bl sub_8053F8C
	b _0806E070
_0806E066:
	cmp r0, #0x24
	bne _0806E070
	adds r0, r4, #0
	bl Proc_Break
_0806E070:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_806E034

	THUMB_FUNC_START sub_806E078
sub_806E078: @ 0x0806E078
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _0806E0BC  @ gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0806E0C0  @ ProcScr_efxChillEffectBG
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r1, [r0, #0x2e]
	str r1, [r0, #0x44]
	ldr r1, _0806E0C4  @ gUnknown_080DF546
	str r1, [r0, #0x48]
	ldr r1, _0806E0C8  @ gUnknown_085D92D4
	str r1, [r0, #0x4c]
	str r1, [r0, #0x50]
	ldr r0, _0806E0CC  @ gUnknown_0872E998
	movs r1, #0x80
	lsls r1, r1, #6
	bl SomeImageStoringRoutine_SpellAnim2
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806E0BC: .4byte gEfxBgSemaphore
_0806E0C0: .4byte ProcScr_efxChillEffectBG
_0806E0C4: .4byte gUnknown_080DF546
_0806E0C8: .4byte gUnknown_085D92D4
_0806E0CC: .4byte gUnknown_0872E998

	THUMB_FUNC_END sub_806E078

	THUMB_FUNC_START sub_806E0D0
sub_806E0D0: @ 0x0806E0D0
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl EfxGetNextFrameIndex
	lsls r0, r0, #0x10
	asrs r2, r0, #0x10
	cmp r2, #0
	blt _0806E0FE
	ldr r1, [r4, #0x4c]
	ldr r3, [r4, #0x50]
	ldr r0, [r4, #0x5c]
	lsls r2, r2, #2
	adds r1, r2, r1
	ldr r1, [r1]
	adds r2, r2, r3
	ldr r2, [r2]
	bl sub_8055670
	b _0806E11C
_0806E0FE:
	movs r0, #1
	negs r0, r0
	cmp r2, r0
	bne _0806E11C
	bl ClearBG1
	ldr r1, _0806E124  @ gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SetDefaultColorEffects_
	adds r0, r4, #0
	bl Proc_Break
_0806E11C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806E124: .4byte gEfxBgSemaphore

	THUMB_FUNC_END sub_806E0D0

	THUMB_FUNC_START sub_806E128
sub_806E128: @ 0x0806E128
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0806E14C  @ ProcScr_efxChillEffectBGCOL
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r1, [r0, #0x44]
	ldr r1, _0806E150  @ gUnknown_080DF568
	str r1, [r0, #0x48]
	ldr r1, _0806E154  @ gUnknown_087456E8
	str r1, [r0, #0x4c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806E14C: .4byte ProcScr_efxChillEffectBGCOL
_0806E150: .4byte gUnknown_080DF568
_0806E154: .4byte gUnknown_087456E8

	THUMB_FUNC_END sub_806E128

	THUMB_FUNC_START sub_806E158
sub_806E158: @ 0x0806E158
	push {r4, r5, r6, r7, lr}
	sub sp, #0x20
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl EfxGetNextFrameIndex
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	cmp r1, #0
	blt _0806E1D8
	ldr r0, [r4, #0x4c]
	mov r7, sp
	lsls r1, r1, #5
	adds r0, r0, r1
	mov r1, sp
	movs r2, #8
	bl CpuFastSet
	movs r6, #0
	movs r0, #0x1f
	mov ip, r0
_0806E188:
	lsls r0, r6, #1
	adds r5, r0, r7
	ldrh r1, [r5]
	lsrs r3, r1, #5
	mov r2, ip
	ands r3, r2
	mov r0, ip
	ands r0, r1
	subs r0, #0xc
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	movs r2, #0x80
	lsls r2, r2, #0x13
	adds r1, r0, r2
	lsrs r2, r1, #0x18
	cmp r0, #0
	bge _0806E1AC
	movs r4, #0
_0806E1AC:
	lsls r0, r2, #0x18
	cmp r0, #0
	bge _0806E1B4
	movs r2, #0
_0806E1B4:
	lsls r1, r4, #0x18
	asrs r1, r1, #0x18
	lsls r0, r3, #5
	orrs r1, r0
	lsls r0, r2, #0x18
	asrs r0, r0, #0xe
	orrs r1, r0
	strh r1, [r5]
	adds r0, r6, #1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	cmp r6, #0xf
	bls _0806E188
	adds r0, r7, #0
	movs r1, #0x20
	bl SomePaletteStoringRoutine_SpellAnim2
	b _0806E1E6
_0806E1D8:
	movs r0, #1
	negs r0, r0
	cmp r1, r0
	bne _0806E1E6
	adds r0, r4, #0
	bl Proc_Break
_0806E1E6:
	add sp, #0x20
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_806E158

	THUMB_FUNC_START NewEfxChillAnime
NewEfxChillAnime: @ 0x0806E1F0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r6, r0, #0
	cmp r1, #0
	bne _0806E202
	ldr r4, _0806E25C  @ gUnknown_08746508
	ldr r7, _0806E260  @ gUnknown_0874670C
_0806E202:
	ldr r0, _0806E264  @ ProcScr_efxChillAnime
	movs r1, #3
	bl Proc_Start
	adds r5, r0, #0
	str r6, [r5, #0x5c]
	movs r0, #0
	mov r8, r0
	movs r0, #0
	strh r0, [r5, #0x2c]
	str r4, [sp]
	adds r0, r6, #0
	adds r1, r7, #0
	adds r2, r4, #0
	adds r3, r7, #0
	bl EfxAnimCreate
	adds r4, r0, #0
	str r4, [r5, #0x60]
	ldr r0, [r5, #0x5c]
	bl GetAISSubjectId
	ldr r1, _0806E268  @ gUnknown_02000010
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r5, #0x60]
	str r1, [r0]
	ldrh r1, [r4, #8]
	movs r0, #0xc0
	lsls r0, r0, #4
	ands r0, r1
	strh r0, [r4, #8]
	movs r0, #0x64
	strh r0, [r4, #0xa]
	bl AnimSort
	adds r0, r6, #0
	bl GetAISSubjectId
	cmp r0, #0
	bne _0806E26C
	ldrh r0, [r4, #8]
	movs r2, #0xe4
	lsls r2, r2, #7
	b _0806E272
	.align 2, 0
_0806E25C: .4byte gUnknown_08746508
_0806E260: .4byte gUnknown_0874670C
_0806E264: .4byte ProcScr_efxChillAnime
_0806E268: .4byte gUnknown_02000010
_0806E26C:
	ldrh r0, [r4, #8]
	movs r2, #0x93
	lsls r2, r2, #8
_0806E272:
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r4, #8]
	ldr r0, [r5, #0x5c]
	bl GetAISSubjectId
	bl SetAnimStateHidden
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END NewEfxChillAnime

	THUMB_FUNC_START sub_806E290
sub_806E290: @ 0x0806E290
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r1, [r6, #0x60]
	ldr r0, [r6, #0x5c]
	ldrh r0, [r0, #2]
	strh r0, [r1, #2]
	ldrh r0, [r6, #0x2c]
	adds r0, #1
	strh r0, [r6, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x14
	bne _0806E2FC
	ldr r0, [r6, #0x5c]
	bl GetAISSubjectId
	bl SetAnimStateUnHidden
	ldr r0, [r6, #0x60]
	bl AnimDelete
	ldr r0, [r6, #0x5c]
	bl GetAISSubjectId
	ldr r1, _0806E304  @ gUnknown_02000010
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r1, #0
	str r1, [r0]
	ldr r5, _0806E308  @ gAnims
	ldr r0, [r6, #0x5c]
	bl GetAISSubjectId
	lsls r0, r0, #3
	adds r0, r0, r5
	ldr r4, [r0]
	ldr r0, [r6, #0x5c]
	bl GetAISSubjectId
	lsls r0, r0, #1
	adds r0, #1
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r2, [r0]
	ldrh r0, [r4, #0x10]
	movs r1, #0x40
	orrs r0, r1
	strh r0, [r4, #0x10]
	ldrh r0, [r2, #0x10]
	orrs r0, r1
	strh r0, [r2, #0x10]
	adds r0, r6, #0
	bl Proc_Break
_0806E2FC:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806E304: .4byte gUnknown_02000010
_0806E308: .4byte gAnims

	THUMB_FUNC_END sub_806E290

	THUMB_FUNC_START nullsub_17
nullsub_17: @ 0x0806E30C
	bx lr

	THUMB_FUNC_END nullsub_17

.align 2, 0
