	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	THUMB_FUNC_START NewEfxMantBatabata
NewEfxMantBatabata: @ 0x0806DD34
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r7, r0, #0
	bl GetAISSubjectId
	ldr r1, _0806DD60  @ gEkrPairBanimID2
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	subs r0, #0x6a
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x51
	bls _0806DD56
	b _0806DF10
_0806DD56:
	lsls r0, r0, #2
	ldr r1, _0806DD64  @ _0806DD68
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0806DD60: .4byte gEkrPairBanimID2
_0806DD64: .4byte _0806DD68
_0806DD68: @ jump table
	.4byte _0806DF10 @ case 0
	.4byte _0806DF10 @ case 1
	.4byte _0806DEB0 @ case 2
	.4byte _0806DF10 @ case 3
	.4byte _0806DEB0 @ case 4
	.4byte _0806DF10 @ case 5
	.4byte _0806DF10 @ case 6
	.4byte _0806DF10 @ case 7
	.4byte _0806DF10 @ case 8
	.4byte _0806DF10 @ case 9
	.4byte _0806DEC0 @ case 10
	.4byte _0806DEC0 @ case 11
	.4byte _0806DF10 @ case 12
	.4byte _0806DF10 @ case 13
	.4byte _0806DF10 @ case 14
	.4byte _0806DF10 @ case 15
	.4byte _0806DF10 @ case 16
	.4byte _0806DF10 @ case 17
	.4byte _0806DF10 @ case 18
	.4byte _0806DF10 @ case 19
	.4byte _0806DF10 @ case 20
	.4byte _0806DF10 @ case 21
	.4byte _0806DF10 @ case 22
	.4byte _0806DF10 @ case 23
	.4byte _0806DF10 @ case 24
	.4byte _0806DF10 @ case 25
	.4byte _0806DF10 @ case 26
	.4byte _0806DF10 @ case 27
	.4byte _0806DF10 @ case 28
	.4byte _0806DF10 @ case 29
	.4byte _0806DF10 @ case 30
	.4byte _0806DF10 @ case 31
	.4byte _0806DF10 @ case 32
	.4byte _0806DF10 @ case 33
	.4byte _0806DF10 @ case 34
	.4byte _0806DF10 @ case 35
	.4byte _0806DF10 @ case 36
	.4byte _0806DF10 @ case 37
	.4byte _0806DF10 @ case 38
	.4byte _0806DF10 @ case 39
	.4byte _0806DF10 @ case 40
	.4byte _0806DF10 @ case 41
	.4byte _0806DED0 @ case 42
	.4byte _0806DF10 @ case 43
	.4byte _0806DF10 @ case 44
	.4byte _0806DF10 @ case 45
	.4byte _0806DF10 @ case 46
	.4byte _0806DF10 @ case 47
	.4byte _0806DF10 @ case 48
	.4byte _0806DF10 @ case 49
	.4byte _0806DEE0 @ case 50
	.4byte _0806DEE0 @ case 51
	.4byte _0806DF10 @ case 52
	.4byte _0806DF10 @ case 53
	.4byte _0806DF10 @ case 54
	.4byte _0806DF10 @ case 55
	.4byte _0806DF10 @ case 56
	.4byte _0806DF10 @ case 57
	.4byte _0806DF10 @ case 58
	.4byte _0806DF10 @ case 59
	.4byte _0806DF10 @ case 60
	.4byte _0806DF10 @ case 61
	.4byte _0806DF10 @ case 62
	.4byte _0806DF10 @ case 63
	.4byte _0806DF10 @ case 64
	.4byte _0806DF10 @ case 65
	.4byte _0806DF10 @ case 66
	.4byte _0806DF10 @ case 67
	.4byte _0806DF10 @ case 68
	.4byte _0806DF10 @ case 69
	.4byte _0806DF10 @ case 70
	.4byte _0806DF10 @ case 71
	.4byte _0806DF10 @ case 72
	.4byte _0806DF10 @ case 73
	.4byte _0806DF10 @ case 74
	.4byte _0806DF10 @ case 75
	.4byte _0806DF10 @ case 76
	.4byte _0806DF10 @ case 77
	.4byte _0806DF10 @ case 78
	.4byte _0806DEF0 @ case 79
	.4byte _0806DEF0 @ case 80
	.4byte _0806DF00 @ case 81
_0806DEB0:
	ldr r5, _0806DEB8  @ gUnknown_085F1F18
	ldr r4, _0806DEBC  @ gUnknown_085F20C4
	b _0806DF14
	.align 2, 0
_0806DEB8: .4byte gUnknown_085F1F18
_0806DEBC: .4byte gUnknown_085F20C4
_0806DEC0:
	ldr r5, _0806DEC8  @ gUnknown_085F2270
	ldr r4, _0806DECC  @ gUnknown_085F2418
	b _0806DF14
	.align 2, 0
_0806DEC8: .4byte gUnknown_085F2270
_0806DECC: .4byte gUnknown_085F2418
_0806DED0:
	ldr r5, _0806DED8  @ gUnknown_085F24F4
	ldr r4, _0806DEDC  @ gUnknown_085F25D8
	b _0806DF14
	.align 2, 0
_0806DED8: .4byte gUnknown_085F24F4
_0806DEDC: .4byte gUnknown_085F25D8
_0806DEE0:
	ldr r5, _0806DEE8  @ gUnknown_085F26E0
	ldr r4, _0806DEEC  @ gUnknown_085F27E4
	b _0806DF14
	.align 2, 0
_0806DEE8: .4byte gUnknown_085F26E0
_0806DEEC: .4byte gUnknown_085F27E4
_0806DEF0:
	ldr r5, _0806DEF8  @ gUnknown_085F29C0
	ldr r4, _0806DEFC  @ gUnknown_085F2C3C
	b _0806DF14
	.align 2, 0
_0806DEF8: .4byte gUnknown_085F29C0
_0806DEFC: .4byte gUnknown_085F2C3C
_0806DF00:
	ldr r5, _0806DF08  @ gUnknown_085F2D44
	ldr r4, _0806DF0C  @ gUnknown_085F2DAC
	b _0806DF14
	.align 2, 0
_0806DF08: .4byte gUnknown_085F2D44
_0806DF0C: .4byte gUnknown_085F2DAC
_0806DF10:
	ldr r5, _0806DF70  @ gUnknown_085F1BD8
	ldr r4, _0806DF74  @ gUnknown_085F1D6C
_0806DF14:
	ldr r0, _0806DF78  @ ProcScr_efxMantBatabata
	movs r1, #3
	bl Proc_Start
	adds r6, r0, #0
	str r7, [r6, #0x5c]
	movs r0, #0
	mov r8, r0
	movs r0, #0
	strh r0, [r6, #0x2c]
	str r5, [sp]
	adds r0, r7, #0
	adds r1, r4, #0
	adds r2, r5, #0
	adds r3, r4, #0
	bl EfxAnimCreate
	adds r4, r0, #0
	str r4, [r6, #0x60]
	ldr r0, [r6, #0x5c]
	bl GetAISSubjectId
	ldr r1, _0806DF7C  @ gUnknown_02000010
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r6, #0x60]
	str r1, [r0]
	ldrh r1, [r4, #8]
	movs r0, #0xc0
	lsls r0, r0, #4
	ands r0, r1
	strh r0, [r4, #8]
	movs r0, #0x64
	strh r0, [r4, #0xa]
	bl AnimSort
	adds r0, r7, #0
	bl GetAISSubjectId
	cmp r0, #0
	bne _0806DF80
	ldrh r0, [r4, #8]
	movs r2, #0xe4
	lsls r2, r2, #7
	b _0806DF86
	.align 2, 0
_0806DF70: .4byte gUnknown_085F1BD8
_0806DF74: .4byte gUnknown_085F1D6C
_0806DF78: .4byte ProcScr_efxMantBatabata
_0806DF7C: .4byte gUnknown_02000010
_0806DF80:
	ldrh r0, [r4, #8]
	movs r2, #0x93
	lsls r2, r2, #8
_0806DF86:
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r4, #8]
	ldr r0, [r6, #0x5c]
	bl GetAISSubjectId
	bl SetAnimStateHidden
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END NewEfxMantBatabata

	THUMB_FUNC_START sub_806DFA4
sub_806DFA4: @ 0x0806DFA4
	push {lr}
	adds r2, r0, #0
	ldr r1, [r2, #0x60]
	ldr r0, [r2, #0x5c]
	ldrh r0, [r0, #2]
	strh r0, [r1, #2]
	ldr r0, [r2, #0x5c]
	ldrh r1, [r0, #0x10]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _0806DFCA
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _0806DFCA
	adds r0, r2, #0
	bl Proc_Break
_0806DFCA:
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_806DFA4

	THUMB_FUNC_START sub_806DFD0
sub_806DFD0: @ 0x0806DFD0
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x60]
	ldr r0, [r4, #0x5c]
	ldrh r0, [r0, #2]
	strh r0, [r1, #2]
	bl sub_80522CC
	cmp r0, #1
	bne _0806E00A
	ldr r0, [r4, #0x5c]
	bl GetAISSubjectId
	bl SetAnimStateUnHidden
	ldr r0, [r4, #0x60]
	bl AnimDelete
	ldr r0, [r4, #0x5c]
	bl GetAISSubjectId
	ldr r1, _0806E010  @ gUnknown_02000010
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r1, #0
	str r1, [r0]
	adds r0, r4, #0
	bl Proc_Break
_0806E00A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806E010: .4byte gUnknown_02000010

	THUMB_FUNC_END sub_806DFD0
