	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	THUMB_FUNC_START NewEfxSpecalEffect
NewEfxSpecalEffect: @ 0x0806D8D0
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r4, _0806D904  @ gUnknown_02017768
	bl GetAISSubjectId
	lsls r0, r0, #1
	adds r0, r0, r4
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _0806D91E
	adds r0, r5, #0
	bl GetAISSubjectId
	lsls r0, r0, #1
	adds r0, r0, r4
	movs r1, #1
	strh r1, [r0]
	adds r0, r5, #0
	bl GetAISSubjectId
	cmp r0, #0
	bne _0806D90C
	ldr r0, _0806D908  @ gpEkrBattleUnitLeft
	b _0806D90E
	.align 2, 0
_0806D904: .4byte gUnknown_02017768
_0806D908: .4byte gpEkrBattleUnitLeft
_0806D90C:
	ldr r0, _0806D94C  @ gpEkrBattleUnitRight
_0806D90E:
	ldr r0, [r0]
	adds r0, #0x4a
	ldrh r0, [r0]
	bl IsWeaponLegency
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _0806D954
_0806D91E:
	ldr r4, _0806D950  @ gAnims
	adds r0, r5, #0
	bl GetAISSubjectId
	lsls r0, r0, #3
	adds r0, r0, r4
	ldr r6, [r0]
	adds r0, r5, #0
	bl GetAISSubjectId
	lsls r0, r0, #1
	adds r0, #1
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r2, [r0]
	ldrh r1, [r6, #0x10]
	movs r0, #0x40
	orrs r1, r0
	strh r1, [r6, #0x10]
	ldrh r1, [r2, #0x10]
	orrs r0, r1
	strh r0, [r2, #0x10]
	b _0806D976
	.align 2, 0
_0806D94C: .4byte gpEkrBattleUnitRight
_0806D950: .4byte gAnims
_0806D954:
	ldr r0, _0806D97C  @ ProcScr_efxSpecalEffect
	movs r1, #3
	bl Proc_Start
	str r5, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #0xf0
	movs r2, #0x78
	movs r3, #0
	bl EkrSoundSomeBark
	adds r0, r5, #0
	bl NewEfxSRankWeaponEffect
_0806D976:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806D97C: .4byte ProcScr_efxSpecalEffect

	THUMB_FUNC_END NewEfxSpecalEffect

	THUMB_FUNC_START sub_806D980
sub_806D980: @ 0x0806D980
	push {lr}
	bl Proc_Break
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_806D980

	THUMB_FUNC_START NewEfxSRankWeaponEffect
NewEfxSRankWeaponEffect: @ 0x0806D98C
	push {r4, lr}
	adds r4, r0, #0
	bl ClearBG1Setup
	ldr r0, _0806D9A8  @ ProcScr_efxSRankWeaponEffect
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806D9A8: .4byte ProcScr_efxSRankWeaponEffect

	THUMB_FUNC_END NewEfxSRankWeaponEffect

	THUMB_FUNC_START sub_806D9AC
sub_806D9AC: @ 0x0806D9AC
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldrh r0, [r6, #0x2c]
	adds r0, #1
	strh r0, [r6, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _0806D9C6
	ldr r0, [r6, #0x5c]
	bl sub_806DA1C
	b _0806DA10
_0806D9C6:
	cmp r0, #0x15
	bne _0806D9DA
	ldr r0, [r6, #0x5c]
	movs r1, #0x2d
	movs r2, #1
	bl NewEfxRestWINH_
	bl sub_806DA90
	b _0806DA10
_0806D9DA:
	cmp r0, #0x46
	bne _0806DA10
	ldr r5, _0806DA18  @ gAnims
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
_0806DA10:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806DA18: .4byte gAnims

	THUMB_FUNC_END sub_806D9AC

	THUMB_FUNC_START sub_806DA1C
sub_806DA1C: @ 0x0806DA1C
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _0806DA58  @ ProcScr_efxSRankWeaponEffectBG
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	ldr r0, _0806DA5C  @ gUnknown_085E8C04
	movs r1, #0x80
	lsls r1, r1, #6
	bl SomeImageStoringRoutine_SpellAnim2
	ldr r0, _0806DA60  @ gUnknown_085E8CC4
	movs r1, #0x20
	bl SomePaletteStoringRoutine_SpellAnim2
	ldr r0, [r4, #0x5c]
	ldr r2, _0806DA64  @ gUnknown_085E8CE4
	adds r1, r2, #0
	bl sub_8055670
	bl sub_80551B0
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806DA58: .4byte ProcScr_efxSRankWeaponEffectBG
_0806DA5C: .4byte gUnknown_085E8C04
_0806DA60: .4byte gUnknown_085E8CC4
_0806DA64: .4byte gUnknown_085E8CE4

	THUMB_FUNC_END sub_806DA1C

	THUMB_FUNC_START sub_806DA68
sub_806DA68: @ 0x0806DA68
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x3c
	bne _0806DA88
	bl ClearBG1
	bl SetDefaultColorEffects_
	adds r0, r4, #0
	bl Proc_Break
_0806DA88:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_806DA68

	THUMB_FUNC_START sub_806DA90
sub_806DA90: @ 0x0806DA90
	push {lr}
	ldr r0, _0806DAAC  @ efxSRankWeaponEffectSCR
	movs r1, #3
	bl Proc_Start
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r1, [r0, #0x2e]
	str r1, [r0, #0x44]
	bl sub_806DB34
	pop {r0}
	bx r0
	.align 2, 0
_0806DAAC: .4byte efxSRankWeaponEffectSCR

	THUMB_FUNC_END sub_806DA90

	THUMB_FUNC_START sub_806DAB0
sub_806DAB0: @ 0x0806DAB0
	push {r4, r5, r6, r7, lr}
	mov ip, r0
	ldr r0, _0806DAF8  @ gUnknown_0201FDB8
	ldr r0, [r0]
	ldr r4, _0806DAFC  @ gUnknown_0201FDC4
	cmp r0, #0
	bne _0806DAC0
	ldr r4, _0806DB00  @ gUnknown_0201FF04
_0806DAC0:
	movs r3, #0
	movs r7, #0x88
	lsls r7, r7, #0x10
	movs r6, #0x88
	ldr r5, _0806DB04  @ gUnknown_085D9154
_0806DACA:
	cmp r3, #0x77
	bhi _0806DB16
	movs r0, #0
	ldrsh r1, [r5, r0]
	mov r2, ip
	ldr r0, [r2, #0x44]
	muls r0, r1, r0
	lsls r0, r0, #4
	lsrs r2, r0, #0x10
	asrs r1, r0, #0x10
	cmp r1, #0
	beq _0806DB12
	cmp r3, #0x3b
	bhi _0806DB0C
	adds r0, r3, #0
	subs r0, #0x88
	cmp r1, r0
	bcs _0806DB12
	ldr r1, _0806DB08  @ 0x0000FF78
	adds r0, r3, r1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	b _0806DB12
	.align 2, 0
_0806DAF8: .4byte gUnknown_0201FDB8
_0806DAFC: .4byte gUnknown_0201FDC4
_0806DB00: .4byte gUnknown_0201FF04
_0806DB04: .4byte gUnknown_085D9154
_0806DB08: .4byte 0x0000FF78
_0806DB0C:
	cmp r1, r6
	bls _0806DB12
	lsrs r2, r7, #0x10
_0806DB12:
	strh r2, [r4]
	b _0806DB1A
_0806DB16:
	movs r0, #0
	strh r0, [r4]
_0806DB1A:
	adds r4, #2
	ldr r2, _0806DB30  @ 0xFFFF0000
	adds r7, r7, r2
	subs r6, #1
	adds r5, #2
	adds r3, #1
	cmp r3, #0x9f
	bls _0806DACA
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806DB30: .4byte 0xFFFF0000

	THUMB_FUNC_END sub_806DAB0

	THUMB_FUNC_START sub_806DB34
sub_806DB34: @ 0x0806DB34
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0806DB50  @ efxSRankWeaponEffectSCR2
	movs r1, #3
	bl Proc_Start
	movs r1, #0
	strh r1, [r0, #0x2c]
	movs r1, #0x28
	strh r1, [r0, #0x2e]
	str r4, [r0, #0x5c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806DB50: .4byte efxSRankWeaponEffectSCR2

	THUMB_FUNC_END sub_806DB34

	THUMB_FUNC_START sub_806DB54
sub_806DB54: @ 0x0806DB54
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r5, [r4, #0x5c]
	movs r2, #0x80
	lsls r2, r2, #0xb
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
	ble _0806DB92
	adds r0, r5, #0
	bl Proc_End
	adds r0, r4, #0
	bl Proc_Break
_0806DB92:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_806DB54

	THUMB_FUNC_START sub_806DB9C
sub_806DB9C: @ 0x0806DB9C
	push {r4, lr}
	adds r4, r0, #0
	bl ClearBG1Setup
	ldr r0, _0806DBB8  @ ProcScr_efxMagdhisEffect
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806DBB8: .4byte ProcScr_efxMagdhisEffect

	THUMB_FUNC_END sub_806DB9C

	THUMB_FUNC_START sub_806DBBC
sub_806DBBC: @ 0x0806DBBC
	push {r4, r5, lr}
	adds r5, r0, #0
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x11
	bne _0806DBF2
	ldr r0, [r5, #0x5c]
	movs r1, #0x49
	bl sub_806DC08
	movs r4, #0xa0
	lsls r4, r4, #1
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r4, #0
	bl EfxPlaySE
	ldr r0, [r5, #0x5c]
	movs r2, #2
	ldrsh r1, [r0, r2]
	adds r0, r4, #0
	movs r2, #1
	bl M4aPlayWithPostionCtrl
_0806DBF2:
	movs r1, #0x2c
	ldrsh r0, [r5, r1]
	cmp r0, #0x64
	bne _0806DC00
	adds r0, r5, #0
	bl Proc_Break
_0806DC00:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_806DBBC

	THUMB_FUNC_START sub_806DC08
sub_806DC08: @ 0x0806DC08
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, _0806DC88  @ gUnknown_0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0806DC8C  @ ProcScr_efxMagdhisEffectBG
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r1, [r0, #0x2e]
	strh r5, [r0, #0x30]
	str r1, [r0, #0x44]
	ldr r1, _0806DC90  @ gUnknown_080DF4F4
	str r1, [r0, #0x48]
	ldr r1, _0806DC94  @ gUnknown_085D9274
	str r1, [r0, #0x4c]
	str r1, [r0, #0x50]
	ldr r0, _0806DC98  @ gUnknown_085F0E04
	movs r1, #0x20
	bl SomePaletteStoringRoutine_SpellAnim2
	ldr r0, _0806DC9C  @ gUnknown_085F0190
	movs r1, #0x80
	lsls r1, r1, #6
	bl SomeImageStoringRoutine_SpellAnim2
	bl sub_80551B0
	ldr r3, _0806DCA0  @ gLCDControlBuffer
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
	movs r0, #1
	movs r1, #0x10
	movs r2, #0
	bl BG_SetPosition
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806DC88: .4byte gUnknown_0201774C
_0806DC8C: .4byte ProcScr_efxMagdhisEffectBG
_0806DC90: .4byte gUnknown_080DF4F4
_0806DC94: .4byte gUnknown_085D9274
_0806DC98: .4byte gUnknown_085F0E04
_0806DC9C: .4byte gUnknown_085F0190
_0806DCA0: .4byte gLCDControlBuffer

	THUMB_FUNC_END sub_806DC08

	THUMB_FUNC_START sub_806DCA4
sub_806DCA4: @ 0x0806DCA4
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl sub_80558F4
	lsls r0, r0, #0x10
	asrs r2, r0, #0x10
	cmp r2, #0
	blt _0806DCD0
	ldr r1, [r4, #0x4c]
	ldr r3, [r4, #0x50]
	ldr r0, [r4, #0x5c]
	lsls r2, r2, #2
	adds r1, r2, r1
	ldr r1, [r1]
	adds r2, r2, r3
	ldr r2, [r2]
	bl sub_8055670
_0806DCD0:
	ldrh r0, [r4, #0x2e]
	adds r0, #1
	strh r0, [r4, #0x2e]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x30
	ldrsh r1, [r4, r2]
	cmp r0, r1
	bne _0806DD24
	ldr r3, _0806DD2C  @ gLCDControlBuffer
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
	ldrb r0, [r3, #0x18]
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	strb r1, [r3, #0x18]
	ldrb r0, [r3, #0x14]
	movs r1, #3
	orrs r0, r1
	strb r0, [r3, #0x14]
	bl ClearBG1
	ldr r1, _0806DD30  @ gUnknown_0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SetDefaultColorEffects_
	adds r0, r4, #0
	bl Proc_Break
_0806DD24:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806DD2C: .4byte gLCDControlBuffer
_0806DD30: .4byte gUnknown_0201774C

	THUMB_FUNC_END sub_806DCA4
