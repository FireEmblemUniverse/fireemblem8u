	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	THUMB_FUNC_START NewEfxPartsofScroll
NewEfxPartsofScroll: @ 0x08074580
	push {lr}
	ldr r0, _08074594  @ ProcScr_EfxPartsofScroll
	movs r1, #3
	bl Proc_Start
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r1, [r0, #0x2e]
	pop {r1}
	bx r1
	.align 2, 0
_08074594: .4byte ProcScr_EfxPartsofScroll

	THUMB_FUNC_END NewEfxPartsofScroll

	THUMB_FUNC_START sub_8074598
sub_8074598: @ 0x08074598
	push {r4, r5, r6, lr}
	ldr r0, _080745C4  @ gUnknown_0201FDB8
	ldr r0, [r0]
	ldr r2, _080745C8  @ gUnknown_0201FB38
	cmp r0, #0
	bne _080745A6
	ldr r2, _080745CC  @ gUnknown_0201FC78
_080745A6:
	ldr r1, _080745D0  @ gUnknown_0201FDC4
	cmp r0, #0
	bne _080745AE
	ldr r1, _080745D4  @ gUnknown_0201FF04
_080745AE:
	movs r3, #0
	movs r6, #0
	ldr r5, _080745D8  @ gEkrLvupScrollPos1
	ldr r4, _080745DC  @ gEkrLvupScrollPos2
_080745B6:
	cmp r3, #0x27
	bhi _080745E0
	strh r6, [r2]
	adds r2, #2
	strh r6, [r1]
	b _080745FC
	.align 2, 0
_080745C4: .4byte gUnknown_0201FDB8
_080745C8: .4byte gUnknown_0201FB38
_080745CC: .4byte gUnknown_0201FC78
_080745D0: .4byte gUnknown_0201FDC4
_080745D4: .4byte gUnknown_0201FF04
_080745D8: .4byte gEkrLvupScrollPos1
_080745DC: .4byte gEkrLvupScrollPos2
_080745E0:
	cmp r3, #0x47
	bhi _080745EE
	ldrh r0, [r5]
	strh r0, [r2]
	adds r2, #2
	ldrh r0, [r5]
	b _080745FA
_080745EE:
	cmp r3, #0x9f
	bhi _080745FE
	ldrh r0, [r4]
	strh r0, [r2]
	adds r2, #2
	ldrh r0, [r4]
_080745FA:
	strh r0, [r1]
_080745FC:
	adds r1, #2
_080745FE:
	adds r3, #1
	cmp r3, #0x9f
	bls _080745B6
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8074598

	THUMB_FUNC_START nullsub_62
nullsub_62: @ 0x0807460C
	bx lr

	THUMB_FUNC_END nullsub_62

	THUMB_FUNC_START sub_8074610
sub_8074610: @ 0x08074610
	push {lr}
	bl sub_8074598
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8074610

	THUMB_FUNC_START NewEfxPartsofScroll2
NewEfxPartsofScroll2: @ 0x0807461C
	push {lr}
	ldr r0, _08074630  @ ProcScr_EfxPartsofScroll2
	movs r1, #3
	bl Proc_Start
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r1, [r0, #0x2e]
	pop {r1}
	bx r1
	.align 2, 0
_08074630: .4byte ProcScr_EfxPartsofScroll2

	THUMB_FUNC_END NewEfxPartsofScroll2

	THUMB_FUNC_START sub_8074634
sub_8074634: @ 0x08074634
	bx lr

	THUMB_FUNC_END sub_8074634

	THUMB_FUNC_START sub_8074638
sub_8074638: @ 0x08074638
	push {r4, r5, r6, lr}
	ldr r0, _08074684  @ gUnknown_0201FDB8
	ldr r0, [r0]
	ldr r3, _08074688  @ gUnknown_0201FB38
	cmp r0, #0
	bne _08074646
	ldr r3, _0807468C  @ gUnknown_0201FC78
_08074646:
	ldr r2, _08074690  @ gUnknown_0201FDC4
	cmp r0, #0
	bne _0807464E
	ldr r2, _08074694  @ gUnknown_0201FF04
_0807464E:
	movs r4, #0
	movs r5, #0
	ldr r0, _08074698  @ gUnknown_0875941C
	adds r6, r0, #0
	subs r6, #0x50
_08074658:
	cmp r4, #0x27
	bls _080746A8
	cmp r4, #0x47
	bhi _080746A4
	movs r0, #0
	ldrsh r1, [r6, r0]
	ldr r0, _0807469C  @ gEkrLvupScrollPos1
	ldrh r0, [r0]
	muls r0, r1, r0
	lsls r0, r0, #4
	lsrs r1, r0, #0x10
	asrs r0, r0, #0x10
	adds r0, r4, r0
	cmp r0, #0x2e
	bls _0807467A
	cmp r0, #0x51
	bls _0807467C
_0807467A:
	ldr r1, _080746A0  @ 0x0000FFE0
_0807467C:
	strh r1, [r3]
	adds r3, #2
	strh r1, [r2]
	b _080746AE
	.align 2, 0
_08074684: .4byte gUnknown_0201FDB8
_08074688: .4byte gUnknown_0201FB38
_0807468C: .4byte gUnknown_0201FC78
_08074690: .4byte gUnknown_0201FDC4
_08074694: .4byte gUnknown_0201FF04
_08074698: .4byte gUnknown_0875941C
_0807469C: .4byte gEkrLvupScrollPos1
_080746A0: .4byte 0x0000FFE0
_080746A4:
	cmp r4, #0x9f
	bhi _080746B0
_080746A8:
	strh r5, [r3]
	adds r3, #2
	strh r5, [r2]
_080746AE:
	adds r2, #2
_080746B0:
	adds r6, #2
	adds r4, #1
	cmp r4, #0x9f
	bls _08074658
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8074638

	THUMB_FUNC_START NewEfxleveluphb
NewEfxleveluphb: @ 0x080746C0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	ldr r1, _0807475C  @ gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r2, _08074760  @ gUnknown_0201FB38
	movs r1, #0
	adds r6, r2, #0
	ldr r4, _08074764  @ gUnknown_0201FC78
	ldr r0, _08074768  @ gUnknown_0201FDC4
	ldr r5, _0807476C  @ gUnknown_0201FF04
	ldr r3, _08074770  @ gUnknown_0201FB2C
	mov sl, r3
	ldr r7, _08074774  @ gUnknown_0201FDB8
	ldr r3, _08074778  @ gUnknown_0201FB30
	mov ip, r3
	ldr r3, _0807477C  @ gUnknown_0201FDBC
	mov r8, r3
	ldr r3, _08074780  @ gUnknown_0201FB34
	mov r9, r3
	movs r3, #0
_080746F2:
	strh r3, [r2]
	adds r2, #2
	adds r1, #1
	cmp r1, #0x9f
	bls _080746F2
	adds r2, r4, #0
	movs r1, #0
	movs r3, #0
_08074702:
	strh r3, [r2]
	adds r2, #2
	adds r1, #1
	cmp r1, #0x9f
	bls _08074702
	adds r2, r0, #0
	movs r1, #0
	movs r3, #0
_08074712:
	strh r3, [r2]
	adds r2, #2
	adds r1, #1
	cmp r1, #0x9f
	bls _08074712
	adds r2, r5, #0
	movs r1, #0
	movs r3, #0
_08074722:
	strh r3, [r2]
	adds r2, #2
	adds r1, #1
	cmp r1, #0x9f
	bls _08074722
	movs r4, #0
	mov r1, sl
	str r4, [r1]
	str r4, [r7]
	mov r3, ip
	str r6, [r3]
	mov r1, r8
	str r0, [r1]
	mov r3, r9
	str r6, [r3]
	ldr r1, _08074784  @ gUnknown_0201FDC0
	str r0, [r1]
	ldr r0, _08074788  @ ProcScr_Efxleveluphb
	movs r1, #0
	bl Proc_Start
	strh r4, [r0, #0x2c]
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0807475C: .4byte gEfxBgSemaphore
_08074760: .4byte gUnknown_0201FB38
_08074764: .4byte gUnknown_0201FC78
_08074768: .4byte gUnknown_0201FDC4
_0807476C: .4byte gUnknown_0201FF04
_08074770: .4byte gUnknown_0201FB2C
_08074774: .4byte gUnknown_0201FDB8
_08074778: .4byte gUnknown_0201FB30
_0807477C: .4byte gUnknown_0201FDBC
_08074780: .4byte gUnknown_0201FB34
_08074784: .4byte gUnknown_0201FDC0
_08074788: .4byte ProcScr_Efxleveluphb

	THUMB_FUNC_END NewEfxleveluphb

	THUMB_FUNC_START sub_807478C
sub_807478C: @ 0x0807478C
	push {lr}
	movs r0, #0
	bl SetPrimaryHBlankHandler
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_807478C

	THUMB_FUNC_START sub_8074798
sub_8074798: @ 0x08074798
	push {lr}
	bl Proc_Break
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8074798

	THUMB_FUNC_START sub_80747A4
sub_80747A4: @ 0x080747A4
	push {lr}
	ldr r0, _080747C8  @ gBmSt
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldr r3, _080747CC  @ gUnknown_0201FB30
	ldr r2, _080747D0  @ gUnknown_0201FDBC
	cmp r0, #0
	beq _08074814
	ldr r1, _080747D4  @ gUnknown_0201FB2C
	ldr r0, [r1]
	cmp r0, #1
	bne _080747DC
	movs r0, #0
	str r0, [r1]
	ldr r0, _080747D8  @ gUnknown_0201FB38
	b _080747E2
	.align 2, 0
_080747C8: .4byte gBmSt
_080747CC: .4byte gUnknown_0201FB30
_080747D0: .4byte gUnknown_0201FDBC
_080747D4: .4byte gUnknown_0201FB2C
_080747D8: .4byte gUnknown_0201FB38
_080747DC:
	movs r0, #1
	str r0, [r1]
	ldr r0, _080747F8  @ gUnknown_0201FC78
_080747E2:
	str r0, [r3]
	ldr r1, _080747FC  @ gUnknown_0201FDB8
	ldr r0, [r1]
	cmp r0, #1
	bne _08074808
	movs r0, #0
	str r0, [r1]
	ldr r1, _08074800  @ gUnknown_0201FDBC
	ldr r0, _08074804  @ gUnknown_0201FDC4
	b _08074810
	.align 2, 0
_080747F8: .4byte gUnknown_0201FC78
_080747FC: .4byte gUnknown_0201FDB8
_08074800: .4byte gUnknown_0201FDBC
_08074804: .4byte gUnknown_0201FDC4
_08074808:
	movs r0, #1
	str r0, [r1]
	ldr r1, _08074824  @ gUnknown_0201FDBC
	ldr r0, _08074828  @ gUnknown_0201FF04
_08074810:
	str r0, [r1]
	adds r2, r1, #0
_08074814:
	ldr r1, _0807482C  @ gUnknown_0201FB34
	ldr r0, [r3]
	str r0, [r1]
	ldr r1, _08074830  @ gUnknown_0201FDC0
	ldr r0, [r2]
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_08074824: .4byte gUnknown_0201FDBC
_08074828: .4byte gUnknown_0201FF04
_0807482C: .4byte gUnknown_0201FB34
_08074830: .4byte gUnknown_0201FDC0

	THUMB_FUNC_END sub_80747A4

	THUMB_FUNC_START EkrLvupHBlank
EkrLvupHBlank: @ 0x08074834
	push {lr}
	ldr r0, _08074864  @ 0x04000004
	ldrh r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _0807485E
	ldr r3, _08074868  @ 0x04000018
	ldr r2, _0807486C  @ gUnknown_0201FB34
	ldr r0, [r2]
	ldrh r1, [r0]
	strh r1, [r3]
	adds r0, #2
	str r0, [r2]
	subs r3, #4
	ldr r2, _08074870  @ gUnknown_0201FDC0
	ldr r0, [r2]
	ldrh r1, [r0]
	strh r1, [r3]
	adds r0, #2
	str r0, [r2]
_0807485E:
	pop {r0}
	bx r0
	.align 2, 0
_08074864: .4byte 0x04000004
_08074868: .4byte 0x04000018
_0807486C: .4byte gUnknown_0201FB34
_08074870: .4byte gUnknown_0201FDC0

	THUMB_FUNC_END EkrLvupHBlank

	THUMB_FUNC_START EfxPartsofScroll2HBlank
EfxPartsofScroll2HBlank: @ 0x08074874
	push {r4, r5, lr}
	ldr r0, _080748B0  @ 0x04000004
	ldrh r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _080748A8
	ldr r3, _080748B4  @ 0x0400001A
	ldr r4, _080748B8  @ gLCDControlBuffer
	ldr r2, _080748BC  @ gUnknown_0201FB34
	ldr r1, [r2]
	ldrh r0, [r1]
	ldrh r5, [r4, #0x26]
	adds r0, r0, r5
	strh r0, [r3]
	adds r1, #2
	str r1, [r2]
	subs r3, #4
	ldr r2, _080748C0  @ gUnknown_0201FDC0
	ldr r1, [r2]
	ldrh r0, [r1]
	ldrh r4, [r4, #0x22]
	adds r0, r0, r4
	strh r0, [r3]
	adds r1, #2
	str r1, [r2]
_080748A8:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080748B0: .4byte 0x04000004
_080748B4: .4byte 0x0400001A
_080748B8: .4byte gLCDControlBuffer
_080748BC: .4byte gUnknown_0201FB34
_080748C0: .4byte gUnknown_0201FDC0

	THUMB_FUNC_END EfxPartsofScroll2HBlank

	THUMB_FUNC_START NewEfxlvupbg
NewEfxlvupbg: @ 0x080748C4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080748F8  @ ProcScr_Efxlvupbg
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r1, [r0, #0x44]
	ldr r1, _080748FC  @ gUnknown_080E162A
	str r1, [r0, #0x48]
	ldr r1, _08074900  @ gUnknown_0875949C
	str r1, [r0, #0x4c]
	str r1, [r0, #0x50]
	ldr r1, _08074904  @ gUnknown_087594C8
	str r1, [r0, #0x54]
	ldr r0, _08074908  @ gUnknown_085C48AC
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	bl SpellFx_SetSomeColorEffect
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080748F8: .4byte ProcScr_Efxlvupbg
_080748FC: .4byte gUnknown_080E162A
_08074900: .4byte gUnknown_0875949C
_08074904: .4byte gUnknown_087594C8
_08074908: .4byte gUnknown_085C48AC

	THUMB_FUNC_END NewEfxlvupbg

	THUMB_FUNC_START sub_807490C
sub_807490C: @ 0x0807490C
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
	blt _08074948
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
	b _0807495E
_08074948:
	movs r0, #1
	negs r0, r0
	cmp r3, r0
	bne _0807495E
	bl SpellFx_ClearBG1
	bl SetDefaultColorEffects_
	adds r0, r4, #0
	bl Proc_Break
_0807495E:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_807490C

	THUMB_FUNC_START NewEfxLvupBG2
NewEfxLvupBG2: @ 0x08074964
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0807499C  @ ProcScr_efxLvupBG2
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r1, [r0, #0x44]
	ldr r1, _080749A0  @ gUnknown_080E1664
	str r1, [r0, #0x48]
	ldr r1, _080749A4  @ gUnknown_0875950C
	str r1, [r0, #0x4c]
	str r1, [r0, #0x50]
	ldr r0, _080749A8  @ gUnknown_085C5994
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	ldr r0, _080749AC  @ gUnknown_085C6054
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807499C: .4byte ProcScr_efxLvupBG2
_080749A0: .4byte gUnknown_080E1664
_080749A4: .4byte gUnknown_0875950C
_080749A8: .4byte gUnknown_085C5994
_080749AC: .4byte gUnknown_085C6054

	THUMB_FUNC_END NewEfxLvupBG2

	THUMB_FUNC_START sub_80749B0
sub_80749B0: @ 0x080749B0
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
	blt _080749DE
	ldr r1, [r4, #0x4c]
	ldr r3, [r4, #0x50]
	ldr r0, [r4, #0x5c]
	lsls r2, r2, #2
	adds r1, r2, r1
	ldr r1, [r1]
	adds r2, r2, r3
	ldr r2, [r2]
	bl SpellFx_WriteBgMap
	b _080749EC
_080749DE:
	movs r0, #1
	negs r0, r0
	cmp r2, r0
	bne _080749EC
	adds r0, r4, #0
	bl Proc_Break
_080749EC:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80749B0

	THUMB_FUNC_START NewEfxLvupOBJ2
NewEfxLvupOBJ2: @ 0x080749F4
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #4
	adds r5, r0, #0
	adds r6, r1, #0
	mov r8, r2
	ldr r0, _08074A44  @ ProcScr_efxLvupOBJ2
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	ldr r3, _08074A48  @ gUnknown_085C71E4
	str r3, [sp]
	adds r0, r5, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl EfxCreateFrontAnim
	str r0, [r4, #0x64]
	strh r6, [r0, #2]
	mov r1, r8
	strh r1, [r0, #4]
	ldr r0, _08074A4C  @ gUnknown_085C6730
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	ldr r0, _08074A50  @ gUnknown_085C6054
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08074A44: .4byte ProcScr_efxLvupOBJ2
_08074A48: .4byte gUnknown_085C71E4
_08074A4C: .4byte gUnknown_085C6730
_08074A50: .4byte gUnknown_085C6054

	THUMB_FUNC_END NewEfxLvupOBJ2

	THUMB_FUNC_START sub_8074A54
sub_8074A54: @ 0x08074A54
	push {lr}
	ldr r0, [r0, #0x64]
	bl AnimDelete
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8074A54

	THUMB_FUNC_START NewEfxLvupBGCOL
NewEfxLvupBGCOL: @ 0x08074A60
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08074A88  @ ProcScr_efxLvupBGCOL
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r2, #0
	strh r2, [r0, #0x2c]
	strh r2, [r0, #0x2e]
	movs r1, #0x19
	strh r1, [r0, #0x30]
	str r2, [r0, #0x44]
	ldr r1, _08074A8C  @ gUnknown_080E169A
	str r1, [r0, #0x48]
	ldr r1, _08074A90  @ gUnknown_085C60D4
	str r1, [r0, #0x4c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08074A88: .4byte ProcScr_efxLvupBGCOL
_08074A8C: .4byte gUnknown_080E169A
_08074A90: .4byte gUnknown_085C60D4

	THUMB_FUNC_END NewEfxLvupBGCOL

	THUMB_FUNC_START sub_8074A94
sub_8074A94: @ 0x08074A94
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl EfxAdvanceFrameLut
	lsls r0, r0, #0x10
	asrs r3, r0, #0x10
	cmp r3, #0
	blt _08074ABE
	ldr r0, [r4, #0x4c]
	ldr r1, _08074AF0  @ gUnknown_020228AA
	movs r2, #8
	str r2, [sp]
	adds r2, r3, #0
	movs r3, #0xf
	bl sub_805588C
_08074ABE:
	ldrh r0, [r4, #0x2e]
	adds r0, #1
	movs r2, #0
	strh r0, [r4, #0x2e]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r3, #0x30
	ldrsh r1, [r4, r3]
	cmp r0, r1
	ble _08074AE6
	strh r2, [r4, #0x2c]
	strh r2, [r4, #0x2e]
	str r2, [r4, #0x44]
	ldr r0, _08074AF4  @ gUnknown_080E16DC
	str r0, [r4, #0x48]
	ldr r0, _08074AF8  @ gUnknown_085C6054
	str r0, [r4, #0x4c]
	adds r0, r4, #0
	bl Proc_Break
_08074AE6:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08074AF0: .4byte gUnknown_020228AA
_08074AF4: .4byte gUnknown_080E16DC
_08074AF8: .4byte gUnknown_085C6054

	THUMB_FUNC_END sub_8074A94

	THUMB_FUNC_START sub_8074AFC
sub_8074AFC: @ 0x08074AFC
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
	blt _08074B22
	ldr r0, [r4, #0x4c]
	lsls r1, r1, #5
	adds r0, r0, r1
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	b _08074B30
_08074B22:
	movs r0, #1
	negs r0, r0
	cmp r1, r0
	bne _08074B30
	adds r0, r4, #0
	bl Proc_Break
_08074B30:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8074AFC

	THUMB_FUNC_START sub_8074B38
sub_8074B38: @ 0x08074B38
	movs r1, #0
	strh r1, [r0, #0x2e]
	bx lr

	THUMB_FUNC_END sub_8074B38

	THUMB_FUNC_START sub_8074B40
sub_8074B40: @ 0x08074B40
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r1, _08074B8C  @ Pal_ManimLevelUpStatGainCycling
	ldrh r0, [r5, #0x2e]
	adds r4, r0, #1
	strh r4, [r5, #0x2e]
	movs r0, #3
	ands r0, r4
	cmp r0, #0
	bne _08074B86
	lsls r4, r4, #0x10
	asrs r4, r4, #0x12
	movs r0, #0xf
	ands r4, r0
	lsls r4, r4, #1
	adds r4, r4, r1
	movs r0, #0x2c
	ldrsh r1, [r5, r0]
	adds r1, #0x10
	lsls r1, r1, #5
	adds r1, #0x12
	adds r0, r4, #0
	movs r2, #0xe
	bl CopyToPaletteBuffer
	adds r4, #0x40
	movs r0, #0x2c
	ldrsh r1, [r5, r0]
	adds r1, #0x11
	lsls r1, r1, #5
	adds r1, #0x12
	adds r0, r4, #0
	movs r2, #0xe
	bl CopyToPaletteBuffer
_08074B86:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08074B8C: .4byte Pal_ManimLevelUpStatGainCycling

	THUMB_FUNC_END sub_8074B40

	THUMB_FUNC_START NewEkrLvupApfx
NewEkrLvupApfx: @ 0x08074B90
	push {r4, r5, lr}
	adds r5, r1, #0
	ldr r2, _08074BDC  @ Img_ManimLevelUpStatGain
	ldr r1, _08074BE0  @ 0x000003FF
	ands r1, r0
	lsls r1, r1, #5
	ldr r0, _08074BE4  @ 0x06010000
	adds r1, r1, r0
	adds r0, r2, #0
	bl Decompress
	ldr r4, _08074BE8  @ Pal_ManimLevelUp
	adds r1, r5, #0
	adds r1, #0x10
	lsls r1, r1, #5
	adds r0, r4, #0
	movs r2, #0x20
	bl CopyToPaletteBuffer
	adds r1, r5, #0
	adds r1, #0x11
	lsls r1, r1, #5
	adds r0, r4, #0
	movs r2, #0x20
	bl CopyToPaletteBuffer
	ldr r0, _08074BEC  @ ProcScr_EkrLvupApfx
	movs r1, #3
	bl Proc_Start
	movs r1, #0
	strh r5, [r0, #0x2c]
	ldr r0, _08074BF0  @ gpProcEkrLvupApfx
	str r1, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08074BDC: .4byte Img_ManimLevelUpStatGain
_08074BE0: .4byte 0x000003FF
_08074BE4: .4byte 0x06010000
_08074BE8: .4byte Pal_ManimLevelUp
_08074BEC: .4byte ProcScr_EkrLvupApfx
_08074BF0: .4byte gpProcEkrLvupApfx

	THUMB_FUNC_END NewEkrLvupApfx

	THUMB_FUNC_START EkrLvupApfxEndEach
EkrLvupApfxEndEach: @ 0x08074BF4
	push {lr}
	ldr r0, _08074C08  @ ProcScr_EkrLvupApfx
	bl Proc_EndEach
	ldr r1, _08074C0C  @ gpProcEkrLvupApfx
	movs r0, #1
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_08074C08: .4byte ProcScr_EkrLvupApfx
_08074C0C: .4byte gpProcEkrLvupApfx

	THUMB_FUNC_END EkrLvupApfxEndEach

	THUMB_FUNC_START sub_8074C10
sub_8074C10: @ 0x08074C10
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r1, #0
	ldr r1, _08074C6C  @ gUnknown_085C8278
	mov r8, r1
	subs r0, #1
	lsls r4, r0, #1
	adds r0, r4, #0
	cmp r4, #0
	bge _08074C28
	negs r0, r4
_08074C28:
	ldr r5, _08074C70  @ 0x000003FF
	ands r0, r5
	lsls r0, r0, #5
	add r0, r8
	adds r1, r6, #0
	adds r1, #0x2c
	ands r1, r5
	lsls r1, r1, #5
	ldr r7, _08074C74  @ 0x06010000
	adds r1, r1, r7
	movs r2, #0x40
	bl VramCopy
	adds r0, r4, #0
	cmp r0, #0
	bge _08074C4A
	negs r0, r0
_08074C4A:
	adds r0, #0x20
	ands r0, r5
	lsls r0, r0, #5
	add r0, r8
	adds r1, r6, #0
	adds r1, #0x4c
	ands r1, r5
	lsls r1, r1, #5
	adds r1, r1, r7
	movs r2, #0x40
	bl VramCopy
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08074C6C: .4byte gUnknown_085C8278
_08074C70: .4byte 0x000003FF
_08074C74: .4byte 0x06010000

	THUMB_FUNC_END sub_8074C10

	THUMB_FUNC_START sub_8074C78
sub_8074C78: @ 0x08074C78
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	adds r7, r0, #0
	adds r6, r1, #0
	ldr r0, _08074CC0  @ Img_ManimLevelUpStatGainDigits
	mov r9, r0
	ldr r0, _08074CC4  @ gUnknown_085C8278
	mov r8, r0
	cmp r7, #0
	blt _08074CD0
	movs r0, #0xc0
	lsls r0, r0, #2
	add r0, r8
	adds r1, #0x2c
	ldr r5, _08074CC8  @ 0x000003FF
	ands r1, r5
	lsls r1, r1, #5
	ldr r4, _08074CCC  @ 0x06010000
	adds r1, r1, r4
	movs r2, #0x40
	bl VramCopy
	movs r0, #0xe0
	lsls r0, r0, #3
	add r0, r8
	adds r1, r6, #0
	adds r1, #0x4c
	ands r1, r5
	lsls r1, r1, #5
	adds r1, r1, r4
	movs r2, #0x40
	bl VramCopy
	b _08074D00
	.align 2, 0
_08074CC0: .4byte Img_ManimLevelUpStatGainDigits
_08074CC4: .4byte gUnknown_085C8278
_08074CC8: .4byte 0x000003FF
_08074CCC: .4byte 0x06010000
_08074CD0:
	movs r0, #0xd0
	lsls r0, r0, #2
	add r0, r8
	adds r1, r6, #0
	adds r1, #0x2c
	ldr r5, _08074D50  @ 0x000003FF
	ands r1, r5
	lsls r1, r1, #5
	ldr r4, _08074D54  @ 0x06010000
	adds r1, r1, r4
	movs r2, #0x40
	bl VramCopy
	movs r0, #0xe8
	lsls r0, r0, #3
	add r0, r8
	adds r1, r6, #0
	adds r1, #0x4c
	ands r1, r5
	lsls r1, r1, #5
	adds r1, r1, r4
	movs r2, #0x40
	bl VramCopy
_08074D00:
	adds r0, r7, #0
	cmp r7, #0
	bge _08074D08
	negs r0, r7
_08074D08:
	ldr r4, _08074D50  @ 0x000003FF
	ands r0, r4
	lsls r0, r0, #5
	add r0, r9
	adds r1, r6, #0
	adds r1, #0x2d
	ands r1, r4
	lsls r1, r1, #5
	ldr r5, _08074D54  @ 0x06010000
	adds r1, r1, r5
	movs r2, #0x20
	bl VramCopy
	adds r0, r7, #0
	cmp r0, #0
	bge _08074D2A
	negs r0, r0
_08074D2A:
	adds r0, #0x20
	ands r0, r4
	lsls r0, r0, #5
	add r0, r9
	adds r1, r6, #0
	adds r1, #0x4d
	ands r1, r4
	lsls r1, r1, #5
	adds r1, r1, r5
	movs r2, #0x20
	bl VramCopy
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08074D50: .4byte 0x000003FF
_08074D54: .4byte 0x06010000

	THUMB_FUNC_END sub_8074C78

	THUMB_FUNC_START BanimDrawStatupAp
BanimDrawStatupAp: @ 0x08074D58
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x1c
	str r0, [sp, #0xc]
	str r1, [sp, #0x10]
	mov r8, r2
	mov r9, r3
	str r0, [sp, #0x14]
	ldr r0, [sp, #0x3c]
	subs r0, #1
	lsls r0, r0, #1
	ldr r1, [sp, #0xc]
	adds r0, r1, r0
	str r0, [sp, #0x18]
	ldr r3, [sp, #0x10]
	lsls r6, r3, #0xc
	adds r7, r1, #0
	movs r0, #0x80
	lsls r0, r0, #3
	orrs r7, r0
	adds r5, r6, #0
	orrs r5, r7
	mov r0, r8
	subs r0, #0x12
	mov r1, r9
	subs r1, #4
	ldr r2, _08074DD8  @ gUnknown_085C9270
	str r5, [sp]
	movs r3, #0
	mov sl, r3
	str r3, [sp, #4]
	movs r3, #5
	str r3, [sp, #8]
	movs r3, #0
	bl NewEkrsubAnimeEmulator
	ldr r0, [sp, #0x3c]
	cmp r0, #0
	beq _08074E52
	ldr r0, _08074DDC  @ ProcScr_eobjLvup
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	ldr r1, [sp, #0x40]
	cmp r1, #0
	blt _08074DE4
	ldr r2, _08074DE0  @ gUnknown_085C92A0
	str r5, [sp]
	mov r3, sl
	str r3, [sp, #4]
	movs r0, #5
	str r0, [sp, #8]
	mov r0, r8
	mov r1, r9
	movs r3, #2
	bl NewEkrsubAnimeEmulator
	str r0, [r4, #0x64]
	b _08074E2A
	.align 2, 0
_08074DD8: .4byte gUnknown_085C9270
_08074DDC: .4byte ProcScr_eobjLvup
_08074DE0: .4byte gUnknown_085C92A0
_08074DE4:
	ldr r1, [sp, #0x18]
	movs r3, #0x80
	lsls r3, r3, #3
	orrs r1, r3
	orrs r1, r6
	mov r0, r8
	subs r0, #3
	ldr r2, _08074E64  @ gUnknown_085C92EC
	str r1, [sp]
	mov r1, sl
	str r1, [sp, #4]
	movs r3, #5
	str r3, [sp, #8]
	mov r1, r9
	movs r3, #2
	bl NewEkrsubAnimeEmulator
	str r0, [r4, #0x60]
	orrs r6, r7
	ldr r2, _08074E68  @ gUnknown_085C92D0
	str r6, [sp]
	mov r0, sl
	str r0, [sp, #4]
	movs r1, #5
	str r1, [sp, #8]
	mov r0, r8
	mov r1, r9
	movs r3, #2
	bl NewEkrsubAnimeEmulator
	str r0, [r4, #0x64]
	ldr r0, [sp, #0x40]
	ldr r1, [sp, #0x18]
	bl sub_8074C78
_08074E2A:
	movs r0, #0
	mov r3, r8
	strh r3, [r4, #0x32]
	mov r1, r9
	strh r1, [r4, #0x3a]
	strh r0, [r4, #0x2c]
	mov r3, sp
	ldrh r3, [r3, #0x14]
	strh r3, [r4, #0x2e]
	mov r0, sp
	ldrh r0, [r0, #0x18]
	strh r0, [r4, #0x30]
	ldr r1, [sp, #0xc]
	str r1, [r4, #0x44]
	ldr r3, [sp, #0x10]
	str r3, [r4, #0x48]
	ldr r0, [sp, #0x3c]
	str r0, [r4, #0x4c]
	ldr r1, [sp, #0x40]
	str r1, [r4, #0x50]
_08074E52:
	add sp, #0x1c
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08074E64: .4byte gUnknown_085C92EC
_08074E68: .4byte gUnknown_085C92D0

	THUMB_FUNC_END BanimDrawStatupAp

	THUMB_FUNC_START sub_8074E6C
sub_8074E6C: @ 0x08074E6C
	push {r4, r5, lr}
	sub sp, #0xc
	adds r4, r0, #0
	ldr r0, [r4, #0x50]
	cmp r0, #0
	bge _08074E80
	adds r0, r4, #0
	bl Proc_Break
	b _08074ECE
_08074E80:
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	movs r5, #0
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xf
	bne _08074ECE
	strh r5, [r4, #0x2c]
	ldr r3, [r4, #0x48]
	lsls r3, r3, #0xc
	movs r1, #0x30
	ldrsh r0, [r4, r1]
	movs r1, #0x80
	lsls r1, r1, #3
	orrs r0, r1
	orrs r3, r0
	movs r2, #0x32
	ldrsh r0, [r4, r2]
	subs r0, #3
	movs r2, #0x3a
	ldrsh r1, [r4, r2]
	ldr r2, _08074ED8  @ gUnknown_085C9328
	str r3, [sp]
	str r5, [sp, #4]
	movs r3, #3
	str r3, [sp, #8]
	movs r3, #2
	bl NewEkrsubAnimeEmulator
	str r0, [r4, #0x60]
	ldr r0, [r4, #0x50]
	movs r2, #0x30
	ldrsh r1, [r4, r2]
	bl sub_8074C10
	adds r0, r4, #0
	bl Proc_Break
_08074ECE:
	add sp, #0xc
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08074ED8: .4byte gUnknown_085C9328

	THUMB_FUNC_END sub_8074E6C

	THUMB_FUNC_START sub_8074EDC
sub_8074EDC: @ 0x08074EDC
	push {r4, lr}
	adds r4, r0, #0
	ldr r2, [r4, #0x50]
	cmp r2, #0
	bge _08074EEC
	bl Proc_Break
	b _08074F0E
_08074EEC:
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xf
	bne _08074F0E
	movs r0, #0
	strh r0, [r4, #0x2c]
	movs r0, #0x30
	ldrsh r1, [r4, r0]
	adds r0, r2, #0
	bl sub_8074C78
	adds r0, r4, #0
	bl Proc_Break
_08074F0E:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8074EDC

	THUMB_FUNC_START sub_8074F14
sub_8074F14: @ 0x08074F14
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08074F38  @ gpProcEkrLvupApfx
	ldr r0, [r0]
	cmp r0, #1
	bne _08074F32
	ldr r0, [r4, #0x60]
	bl Proc_End
	ldr r0, [r4, #0x64]
	bl Proc_End
	adds r0, r4, #0
	bl Proc_Break
_08074F32:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08074F38: .4byte gpProcEkrLvupApfx

	THUMB_FUNC_END sub_8074F14

.align 2, 0
