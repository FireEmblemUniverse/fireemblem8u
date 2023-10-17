	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	THUMB_FUNC_START sub_80717D4
sub_80717D4: @ 0x080717D4
	lsrs r1, r0, #0x1e
	movs r2, #0xc0
	lsls r2, r2, #8
	ands r2, r0
	ldr r0, _080717EC  @ gUnknown_080E13D4
	lsls r1, r1, #1
	lsrs r2, r2, #0xb
	adds r1, r1, r2
	adds r1, r1, r0
	movs r2, #0
	ldrsh r0, [r1, r2]
	bx lr
	.align 2, 0
_080717EC: .4byte gUnknown_080E13D4

	THUMB_FUNC_END sub_80717D4

	THUMB_FUNC_START sub_80717F0
sub_80717F0: @ 0x080717F0
	lsrs r1, r0, #0x1e
	movs r2, #0xc0
	lsls r2, r2, #8
	ands r2, r0
	ldr r0, _08071808  @ gUnknown_080E13F4
	lsls r1, r1, #1
	lsrs r2, r2, #0xb
	adds r1, r1, r2
	adds r1, r1, r0
	movs r2, #0
	ldrsh r0, [r1, r2]
	bx lr
	.align 2, 0
_08071808: .4byte gUnknown_080E13F4

	THUMB_FUNC_END sub_80717F0

	THUMB_FUNC_START EkrGetUnitSpriteDataMaybe
EkrGetUnitSpriteDataMaybe: @ 0x0807180C
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	sub sp, #8
	adds r6, r1, #0
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	mov r8, r2
	adds r7, r0, #0
	ldr r1, _08071984  @ 0xFFFF0000
	ldr r0, [sp, #4]
	ands r0, r1
	str r0, [sp, #4]
	lsls r3, r3, #0x10
	mov r9, r3
	mov r0, r8
	orrs r0, r3
	str r0, [sp]
	ldr r4, _08071988  @ 0xFFFF0004
	adds r1, r6, #0
	stm r1!, {r4}
	mov r0, sp
	movs r2, #1
	movs r3, #2
	bl ObjAffineSet
	adds r5, r6, #0
	adds r5, #0xc
	str r4, [r6, #0xc]
	adds r1, r6, #0
	adds r1, #0x10
	mov r0, sp
	movs r2, #1
	movs r3, #2
	bl ObjAffineSet
	ldrh r0, [r5, #4]
	negs r0, r0
	strh r0, [r5, #4]
	ldrh r0, [r5, #6]
	negs r0, r0
	strh r0, [r5, #6]
	adds r5, #0xc
	str r4, [r6, #0x18]
	adds r1, r6, #0
	adds r1, #0x1c
	mov r0, sp
	movs r2, #1
	movs r3, #2
	bl ObjAffineSet
	ldrh r0, [r5, #8]
	negs r0, r0
	strh r0, [r5, #8]
	ldrh r0, [r5, #0xa]
	negs r0, r0
	strh r0, [r5, #0xa]
	adds r5, #0xc
	str r4, [r6, #0x24]
	adds r1, r6, #0
	adds r1, #0x28
	mov r0, sp
	movs r2, #1
	movs r3, #2
	bl ObjAffineSet
	ldrh r0, [r5, #4]
	negs r0, r0
	strh r0, [r5, #4]
	ldrh r0, [r5, #6]
	negs r0, r0
	strh r0, [r5, #6]
	ldrh r0, [r5, #8]
	negs r0, r0
	strh r0, [r5, #8]
	ldrh r0, [r5, #0xa]
	negs r0, r0
	strh r0, [r5, #0xa]
	adds r6, #0x30
	ldr r0, [r7]
	cmp r0, #1
	beq _08071964
	mov r1, r8
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	mov r8, r0
	mov r2, r9
	asrs r5, r2, #0x10
_080718BE:
	ldr r2, [r7]
	movs r0, #0x80
	lsls r0, r0, #0x15
	ands r0, r2
	negs r0, r0
	asrs r1, r0, #0x1f
	movs r0, #0x80
	lsls r0, r0, #0x12
	ands r1, r0
	movs r0, #0x80
	lsls r0, r0, #0x16
	ands r0, r2
	cmp r0, #0
	beq _080718E0
	movs r3, #0x80
	lsls r3, r3, #0x13
	adds r1, r1, r3
_080718E0:
	ldr r0, _0807198C  @ 0xC1FFFFFF
	ands r0, r2
	movs r3, #0x80
	lsls r3, r3, #1
	adds r1, r1, r3
	adds r0, r0, r1
	str r0, [r6]
	ldrh r0, [r7, #4]
	strh r0, [r6, #4]
	adds r0, r2, #0
	bl sub_80717D4
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x11
	lsls r1, r4, #8
	adds r0, r1, #0
	mov r1, r8
	bl Div
	subs r1, r4, r0
	movs r2, #6
	ldrsh r0, [r7, r2]
	subs r4, r0, r1
	lsls r1, r0, #8
	adds r0, r1, #0
	mov r1, r8
	bl Div
	adds r1, r0, #0
	movs r3, #6
	ldrsh r0, [r7, r3]
	subs r1, r0, r1
	subs r4, r4, r1
	strh r4, [r6, #6]
	ldr r0, [r7]
	bl sub_80717F0
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x11
	lsls r1, r4, #8
	adds r0, r1, #0
	adds r1, r5, #0
	bl Div
	subs r1, r4, r0
	movs r2, #8
	ldrsh r0, [r7, r2]
	subs r4, r0, r1
	lsls r1, r0, #8
	adds r0, r1, #0
	adds r1, r5, #0
	bl Div
	adds r1, r0, #0
	movs r3, #8
	ldrsh r0, [r7, r3]
	subs r1, r0, r1
	subs r4, r4, r1
	strh r4, [r6, #8]
	adds r6, #0xc
	adds r7, #0xc
	ldr r0, [r7]
	cmp r0, #1
	bne _080718BE
_08071964:
	ldr r0, [r7]
	str r0, [r6]
	ldrh r0, [r7, #4]
	strh r0, [r6, #4]
	ldrh r0, [r7, #6]
	strh r0, [r6, #6]
	ldrh r0, [r7, #8]
	strh r0, [r6, #8]
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08071984: .4byte 0xFFFF0000
_08071988: .4byte 0xFFFF0004
_0807198C: .4byte 0xC1FFFFFF

	THUMB_FUNC_END EkrGetUnitSpriteDataMaybe

	THUMB_FUNC_START EfxPlaySE
EfxPlaySE: @ 0x08071990
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r5, r1, #0
	ldr r0, _080719D0  @ gBmSt
	ldrb r1, [r0, #4]
	movs r0, #0x20
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0
	bne _080719E6
	bl sub_8071AA4
	cmp r0, #0
	bne _080719D8
	bl sub_8071A98
	adds r0, r5, #0
	bl Sound_SetBGMVolume
	ldr r0, _080719D4  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080719E6
	lsls r0, r6, #0x10
	lsrs r0, r0, #0x10
	bl m4aSongNumStart
	b _080719E6
	.align 2, 0
_080719D0: .4byte gBmSt
_080719D4: .4byte gPlaySt
_080719D8:
	ldr r0, _080719EC  @ ProcScr_efxSoundSE
	movs r1, #3
	bl Proc_Start
	str r5, [r0, #0x44]
	str r6, [r0, #0x48]
	strh r4, [r0, #0x2c]
_080719E6:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080719EC: .4byte ProcScr_efxSoundSE

	THUMB_FUNC_END EfxPlaySE

	THUMB_FUNC_START Loop6C_efxSoundSE
Loop6C_efxSoundSE: @ 0x080719F0
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #5
	bne _08071A0A
	adds r0, r4, #0
	bl Proc_Break
	b _08071A38
_08071A0A:
	bl sub_8071AA4
	cmp r0, #0
	bne _08071A38
	bl sub_8071A98
	ldr r0, [r4, #0x44]
	bl Sound_SetBGMVolume
	ldr r0, _08071A40  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08071A32
	ldr r0, [r4, #0x48]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl m4aSongNumStart
_08071A32:
	adds r0, r4, #0
	bl Proc_Break
_08071A38:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08071A40: .4byte gPlaySt

	THUMB_FUNC_END Loop6C_efxSoundSE

	THUMB_FUNC_START DoM4aSongNumStop
DoM4aSongNumStop: @ 0x08071A44
	push {lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl m4aSongNumStop
	pop {r0}
	bx r0

	THUMB_FUNC_END DoM4aSongNumStop

	THUMB_FUNC_START sub_8071A54
sub_8071A54: @ 0x08071A54
	push {r4, lr}
	adds r4, r0, #0
	adds r2, r1, #0
	ldr r0, _08071A78  @ gBmSt
	ldrb r1, [r0, #4]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	bne _08071A72
	adds r0, r2, #0
	bl Sound_SetSEVolume
	adds r0, r4, #0
	bl OverrideBgm
_08071A72:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08071A78: .4byte gBmSt

	THUMB_FUNC_END sub_8071A54

	THUMB_FUNC_START StopBGM1
StopBGM1: @ 0x08071A7C
	push {lr}
	ldr r0, _08071A88  @ gMPlayInfo_BGM1
	bl m4aMPlayStop
	pop {r0}
	bx r0
	.align 2, 0
_08071A88: .4byte gMPlayInfo_BGM1

	THUMB_FUNC_END StopBGM1

	THUMB_FUNC_START sub_8071A8C
sub_8071A8C: @ 0x08071A8C
	ldr r1, _08071A94  @ gUnknown_020200AC
	movs r0, #0
	str r0, [r1]
	bx lr
	.align 2, 0
_08071A94: .4byte gUnknown_020200AC

	THUMB_FUNC_END sub_8071A8C

	THUMB_FUNC_START sub_8071A98
sub_8071A98: @ 0x08071A98
	ldr r1, _08071AA0  @ gUnknown_020200AC
	movs r0, #1
	str r0, [r1]
	bx lr
	.align 2, 0
_08071AA0: .4byte gUnknown_020200AC

	THUMB_FUNC_END sub_8071A98

	THUMB_FUNC_START sub_8071AA4
sub_8071AA4: @ 0x08071AA4
	ldr r0, _08071AAC  @ gUnknown_020200AC
	ldr r0, [r0]
	bx lr
	.align 2, 0
_08071AAC: .4byte gUnknown_020200AC

	THUMB_FUNC_END sub_8071AA4

	THUMB_FUNC_START M4aPlayWithPostionCtrl
M4aPlayWithPostionCtrl: @ 0x08071AB0
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r6, r1, #0
	ldr r0, _08071ADC  @ gBmSt
	ldrb r1, [r0, #4]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	bne _08071B58
	cmp r2, #0
	beq _08071B28
	cmp r6, #0x77
	bgt _08071AE0
	adds r0, r6, #0
	muls r0, r6, r0
	movs r1, #0x78
	bl Div
	adds r5, r0, #0
	subs r5, #0x78
	b _08071AF4
	.align 2, 0
_08071ADC: .4byte gBmSt
_08071AE0:
	movs r0, #0xf0
	subs r0, r0, r6
	adds r1, r0, #0
	muls r1, r0, r1
	adds r0, r1, #0
	movs r1, #0x78
	bl Div
	movs r1, #0x78
	subs r5, r1, r0
_08071AF4:
	ldr r2, _08071B1C  @ gMPlayTable
	ldr r1, _08071B20  @ gSongTable
	lsls r0, r4, #3
	adds r0, r0, r1
	ldrh r1, [r0, #4]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r4, [r0]
	adds r0, r4, #0
	bl m4aMPlayImmInit
	ldr r1, _08071B24  @ 0x0000FFFF
	lsls r2, r5, #0x18
	asrs r2, r2, #0x18
	adds r0, r4, #0
	bl m4aMPlayPanpotControl
	b _08071B58
	.align 2, 0
_08071B1C: .4byte gMPlayTable
_08071B20: .4byte gSongTable
_08071B24: .4byte 0x0000FFFF
_08071B28:
	ldr r2, _08071B60  @ gMPlayTable
	ldr r1, _08071B64  @ gSongTable
	lsls r0, r4, #3
	adds r0, r0, r1
	ldrh r1, [r0, #4]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r4, [r0]
	adds r0, r4, #0
	bl m4aMPlayImmInit
	ldr r5, _08071B68  @ 0x0000FFFF
	adds r0, r6, #0
	bl RerangeSomething
	adds r2, r0, #0
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	adds r0, r4, #0
	adds r1, r5, #0
	bl m4aMPlayPanpotControl
_08071B58:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08071B60: .4byte gMPlayTable
_08071B64: .4byte gSongTable
_08071B68: .4byte 0x0000FFFF

	THUMB_FUNC_END M4aPlayWithPostionCtrl

	THUMB_FUNC_START EfxPlaySEwithCmdCtrl
EfxPlaySEwithCmdCtrl: @ 0x08071B6C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	mov r8, r0
	mov sl, r1
	bl GetAnimAnotherSide
	mov r9, r0
	mov r0, r8
	bl GetAISLayerId
	cmp r0, #1
	bne _08071B8E
	b _08072246
_08071B8E:
	mov r0, r8
	bl GetAnimPosition
	adds r6, r0, #0
	cmp r6, #0
	bne _08071BA8
	ldr r0, _08071BA4  @ gEkrPairTerrainID
	movs r1, #0
	ldrsh r5, [r0, r1]
	b _08071BAE
	.align 2, 0
_08071BA4: .4byte gEkrPairTerrainID
_08071BA8:
	ldr r0, _08071BD8  @ gEkrPairTerrainID
	movs r2, #2
	ldrsh r5, [r0, r2]
_08071BAE:
	lsls r0, r5, #0x10
	lsrs r0, r0, #0x10
	bl sub_8072258
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r5, #0x14
	bne _08071BCA
	mov r0, r8
	bl sub_80723A4
	cmp r0, #0
	bne _08071BCA
	movs r4, #2
_08071BCA:
	cmp r6, #0
	bne _08071BE0
	ldr r0, _08071BDC  @ gEkrPairBaseCon
	movs r1, #0
	ldrsh r0, [r0, r1]
	b _08071BE6
	.align 2, 0
_08071BD8: .4byte gEkrPairTerrainID
_08071BDC: .4byte gEkrPairBaseCon
_08071BE0:
	ldr r0, _08071C20  @ gEkrPairBaseCon
	movs r2, #2
	ldrsh r0, [r0, r2]
_08071BE6:
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl sub_80723D4
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	ldr r5, _08071C24  @ 0x0000FFFF
	mov r0, r8
	bl sub_807290C
	mov r2, r8
	ldrh r1, [r2, #2]
	adds r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r2, r1, #0x10
	movs r0, #0x80
	lsls r0, r0, #1
	str r0, [sp]
	mov r0, sl
	subs r0, #0x19
	cmp r0, #0x62
	bls _08071C14
	b _08072220
_08071C14:
	lsls r0, r0, #2
	ldr r1, _08071C28  @ _08071C2C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08071C20: .4byte gEkrPairBaseCon
_08071C24: .4byte 0x0000FFFF
_08071C28: .4byte _08071C2C
_08071C2C: @ jump table
	.4byte _08071DB8 @ case 0
	.4byte _08072220 @ case 1
	.4byte _08071DBC @ case 2
	.4byte _08071DD0 @ case 3
	.4byte _08071DE4 @ case 4
	.4byte _08071DF8 @ case 5
	.4byte _08071E0C @ case 6
	.4byte _08071E78 @ case 7
	.4byte _08071EE4 @ case 8
	.4byte _08071F78 @ case 9
	.4byte _08071F7C @ case 10
	.4byte _08071F80 @ case 11
	.4byte _08071F84 @ case 12
	.4byte _08072220 @ case 13
	.4byte _08072220 @ case 14
	.4byte _08071F8C @ case 15
	.4byte _08071F90 @ case 16
	.4byte _08071F98 @ case 17
	.4byte _08071F9E @ case 18
	.4byte _08072220 @ case 19
	.4byte _08072220 @ case 20
	.4byte _08072220 @ case 21
	.4byte _08071FA8 @ case 22
	.4byte _08072220 @ case 23
	.4byte _08072220 @ case 24
	.4byte _08072220 @ case 25
	.4byte _08071FAE @ case 26
	.4byte _08071FB2 @ case 27
	.4byte _08071FFC @ case 28
	.4byte _0807200C @ case 29
	.4byte _08072010 @ case 30
	.4byte _08072014 @ case 31
	.4byte _08072220 @ case 32
	.4byte _08072018 @ case 33
	.4byte _08072020 @ case 34
	.4byte _08072026 @ case 35
	.4byte _08072220 @ case 36
	.4byte _08072038 @ case 37
	.4byte _0807203C @ case 38
	.4byte _08072042 @ case 39
	.4byte _0807204C @ case 40
	.4byte _08072050 @ case 41
	.4byte _08072054 @ case 42
	.4byte _0807205C @ case 43
	.4byte _08072062 @ case 44
	.4byte _0807206C @ case 45
	.4byte _08072220 @ case 46
	.4byte _08072074 @ case 47
	.4byte _08072078 @ case 48
	.4byte _08072080 @ case 49
	.4byte _08072086 @ case 50
	.4byte _08072090 @ case 51
	.4byte _08072098 @ case 52
	.4byte _08072220 @ case 53
	.4byte _080720A0 @ case 54
	.4byte _080720A8 @ case 55
	.4byte _08072220 @ case 56
	.4byte _08072220 @ case 57
	.4byte _08072220 @ case 58
	.4byte _08072220 @ case 59
	.4byte _08072220 @ case 60
	.4byte _080720AE @ case 61
	.4byte _080720B8 @ case 62
	.4byte _080720C0 @ case 63
	.4byte _080720C8 @ case 64
	.4byte _080720DC @ case 65
	.4byte _080720E4 @ case 66
	.4byte _080720EC @ case 67
	.4byte _080720F2 @ case 68
	.4byte _08072108 @ case 69
	.4byte _08072110 @ case 70
	.4byte _08072118 @ case 71
	.4byte _08072120 @ case 72
	.4byte _08072128 @ case 73
	.4byte _0807212E @ case 74
	.4byte _08072138 @ case 75
	.4byte _0807213E @ case 76
	.4byte _08072148 @ case 77
	.4byte _0807215C @ case 78
	.4byte _08072170 @ case 79
	.4byte _08072220 @ case 80
	.4byte _08072176 @ case 81
	.4byte _08072180 @ case 82
	.4byte _08072188 @ case 83
	.4byte _0807218E @ case 84
	.4byte _080721A4 @ case 85
	.4byte _080721B8 @ case 86
	.4byte _080721CC @ case 87
	.4byte _08072220 @ case 88
	.4byte _08072220 @ case 89
	.4byte _080721E0 @ case 90
	.4byte _080721E8 @ case 91
	.4byte _080721F0 @ case 92
	.4byte _080721F8 @ case 93
	.4byte _08072200 @ case 94
	.4byte _08072208 @ case 95
	.4byte _0807220E @ case 96
	.4byte _08072214 @ case 97
	.4byte _0807221C @ case 98
_08071DB8:
	movs r5, #0xd1
	b _08072222
_08071DBC:
	ldr r1, _08071DCC  @ gUnknown_08758D20
	lsls r0, r4, #2
	adds r0, r0, r1
	ldr r1, [r0]
	lsls r0, r7, #1
	adds r0, r0, r6
	lsls r0, r0, #1
	b _08072198
	.align 2, 0
_08071DCC: .4byte gUnknown_08758D20
_08071DD0:
	ldr r1, _08071DE0  @ gUnknown_08758D3C
	lsls r0, r4, #2
	adds r0, r0, r1
	ldr r1, [r0]
	lsls r0, r7, #1
	adds r0, r0, r6
	lsls r0, r0, #1
	b _08072198
	.align 2, 0
_08071DE0: .4byte gUnknown_08758D3C
_08071DE4:
	ldr r1, _08071DF4  @ gUnknown_08758D58
	lsls r0, r4, #2
	adds r0, r0, r1
	ldr r1, [r0]
	lsls r0, r7, #1
	adds r0, r0, r6
	lsls r0, r0, #1
	b _08072198
	.align 2, 0
_08071DF4: .4byte gUnknown_08758D58
_08071DF8:
	ldr r1, _08071E08  @ gUnknown_08758D74
	lsls r0, r4, #2
	adds r0, r0, r1
	ldr r1, [r0]
	lsls r0, r7, #1
	adds r0, r0, r6
	lsls r0, r0, #1
	b _08072198
	.align 2, 0
_08071E08: .4byte gUnknown_08758D74
_08071E0C:
	mov r0, r9
	bl sub_8072504
	mov r0, r9
	bl sub_8072400
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #2
	beq _08071E5A
	mov r0, r8
	bl GetAnimPosition
	adds r1, r0, #0
	mov r2, r8
	ldrh r0, [r2, #0xe]
	subs r0, #1
	lsls r0, r0, #1
	adds r0, r0, r1
	bl GetBattleAnimRoundTypeFlags
	movs r1, #0x80
	lsls r1, r1, #2
	ands r1, r0
	cmp r1, #0
	beq _08071E5A
	ldr r4, _08071E74  @ 0x000003CF
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r4, #0
	bl EfxPlaySE
	mov r0, r8
	movs r2, #2
	ldrsh r1, [r0, r2]
	adds r0, r4, #0
	movs r2, #1
	bl M4aPlayWithPostionCtrl
_08071E5A:
	mov r0, r9
	bl sub_8072400
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	beq _08071F5A
	cmp r0, #1
	bgt _08071F50
	cmp r0, #0
	bne _08071F60
	movs r5, #0xd2
	b _08071F60
	.align 2, 0
_08071E74: .4byte 0x000003CF
_08071E78:
	mov r0, r9
	bl sub_8072504
	mov r0, r9
	bl sub_8072400
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #2
	beq _08071EC6
	mov r0, r8
	bl GetAnimPosition
	adds r1, r0, #0
	mov r2, r8
	ldrh r0, [r2, #0xe]
	subs r0, #1
	lsls r0, r0, #1
	adds r0, r0, r1
	bl GetBattleAnimRoundTypeFlags
	movs r1, #0x80
	lsls r1, r1, #2
	ands r1, r0
	cmp r1, #0
	beq _08071EC6
	ldr r4, _08071EE0  @ 0x000003CF
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r4, #0
	bl EfxPlaySE
	mov r0, r8
	movs r2, #2
	ldrsh r1, [r0, r2]
	adds r0, r4, #0
	movs r2, #1
	bl M4aPlayWithPostionCtrl
_08071EC6:
	mov r0, r9
	bl sub_8072400
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	beq _08071F5A
	cmp r0, #1
	bgt _08071F50
	cmp r0, #0
	bne _08071F60
	movs r5, #0xd3
	b _08071F60
	.align 2, 0
_08071EE0: .4byte 0x000003CF
_08071EE4:
	mov r0, r9
	bl sub_8072504
	mov r0, r9
	bl sub_8072400
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #2
	beq _08071F32
	mov r0, r8
	bl GetAnimPosition
	adds r1, r0, #0
	mov r2, r8
	ldrh r0, [r2, #0xe]
	subs r0, #1
	lsls r0, r0, #1
	adds r0, r0, r1
	bl GetBattleAnimRoundTypeFlags
	movs r1, #0x80
	lsls r1, r1, #2
	ands r1, r0
	cmp r1, #0
	beq _08071F32
	ldr r4, _08071F4C  @ 0x000003CF
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r4, #0
	bl EfxPlaySE
	mov r0, r8
	movs r2, #2
	ldrsh r1, [r0, r2]
	adds r0, r4, #0
	movs r2, #1
	bl M4aPlayWithPostionCtrl
_08071F32:
	mov r0, r9
	bl sub_8072400
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	beq _08071F5A
	cmp r0, #1
	bgt _08071F50
	cmp r0, #0
	beq _08071F56
	b _08071F60
	.align 2, 0
_08071F4C: .4byte 0x000003CF
_08071F50:
	cmp r0, #2
	beq _08071F5E
	b _08071F60
_08071F56:
	movs r5, #0xd4
	b _08071F60
_08071F5A:
	movs r5, #0xd5
	b _08071F60
_08071F5E:
	ldr r5, _08071F74  @ 0x000002CE
_08071F60:
	mov r0, r9
	bl sub_807290C
	mov r2, r9
	ldrh r1, [r2, #2]
	adds r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r2, r1, #0x10
	b _08072222
	.align 2, 0
_08071F74: .4byte 0x000002CE
_08071F78:
	movs r5, #0xc9
	b _08072222
_08071F7C:
	movs r5, #0xc8
	b _08072222
_08071F80:
	movs r5, #0xca
	b _08072222
_08071F84:
	ldr r5, _08071F88  @ 0x00000263
	b _08071FFE
	.align 2, 0
_08071F88: .4byte 0x00000263
_08071F8C:
	movs r5, #0xf6
	b _08072222
_08071F90:
	ldr r5, _08071F94  @ 0x00000141
	b _08072222
	.align 2, 0
_08071F94: .4byte 0x00000141
_08071F98:
	movs r5, #0xa1
	lsls r5, r5, #1
	b _08072222
_08071F9E:
	ldr r5, _08071FA4  @ 0x00000267
	b _08071FFE
	.align 2, 0
_08071FA4: .4byte 0x00000267
_08071FA8:
	movs r5, #0xbe
	lsls r5, r5, #2
	b _08072222
_08071FAE:
	movs r5, #0xe7
	b _08072222
_08071FB2:
	cmp r6, #0
	beq _08071FC4
	ldr r0, _08071FC0  @ gEkrPairBanimID2
	movs r1, #0
	ldrsh r0, [r0, r1]
	b _08071FCA
	.align 2, 0
_08071FC0: .4byte gEkrPairBanimID2
_08071FC4:
	ldr r0, _08071FE0  @ gEkrPairBanimID2
	movs r1, #2
	ldrsh r0, [r0, r1]
_08071FCA:
	cmp r0, #0xbf
	bgt _08071FE8
	cmp r0, #0xbc
	blt _08071FE8
	ldr r0, _08071FE4  @ gUnknown_08758D20
	lsls r1, r4, #2
	adds r1, r1, r0
	ldr r1, [r1]
	adds r0, r6, #4
	lsls r0, r0, #1
	b _08072198
	.align 2, 0
_08071FE0: .4byte gEkrPairBanimID2
_08071FE4: .4byte gUnknown_08758D20
_08071FE8:
	ldr r1, _08071FF8  @ gUnknown_08758D20
	lsls r0, r4, #2
	adds r0, r0, r1
	ldr r1, [r0]
	lsls r0, r7, #1
	adds r0, r0, r6
	lsls r0, r0, #1
	b _08072198
	.align 2, 0
_08071FF8: .4byte gUnknown_08758D20
_08071FFC:
	ldr r5, _08072008  @ 0x00000265
_08071FFE:
	cmp r6, #0
	beq _08072004
	b _08072222
_08072004:
	subs r5, #1
	b _08072222
	.align 2, 0
_08072008: .4byte 0x00000265
_0807200C:
	movs r5, #0xce
	b _08072222
_08072010:
	movs r5, #0xcf
	b _08072222
_08072014:
	movs r5, #0xcb
	b _08072222
_08072018:
	ldr r5, _0807201C  @ 0x000002D3
	b _08072222
	.align 2, 0
_0807201C: .4byte 0x000002D3
_08072020:
	movs r5, #0xb5
	lsls r5, r5, #2
	b _08072222
_08072026:
	ldr r5, _08072034  @ 0x00000263
	cmp r6, #0
	bne _0807202E
	subs r5, #1
_0807202E:
	movs r0, #0x80
	str r0, [sp]
	b _08072222
	.align 2, 0
_08072034: .4byte 0x00000263
_08072038:
	movs r5, #0xf1
	b _08072222
_0807203C:
	movs r5, #0x9b
	lsls r5, r5, #1
	b _08072222
_08072042:
	ldr r5, _08072048  @ 0x00000117
	b _08072222
	.align 2, 0
_08072048: .4byte 0x00000117
_0807204C:
	movs r5, #0xeb
	b _08072222
_08072050:
	movs r5, #0xea
	b _08072222
_08072054:
	ldr r5, _08072058  @ 0x000002CF
	b _08072222
	.align 2, 0
_08072058: .4byte 0x000002CF
_0807205C:
	movs r5, #0xb4
	lsls r5, r5, #2
	b _08072222
_08072062:
	ldr r5, _08072068  @ 0x000002D1
	b _08072222
	.align 2, 0
_08072068: .4byte 0x000002D1
_0807206C:
	ldr r5, _08072070  @ 0x000002D2
	b _08072222
	.align 2, 0
_08072070: .4byte 0x000002D2
_08072074:
	movs r5, #0xed
	b _08072222
_08072078:
	ldr r5, _0807207C  @ 0x00000135
	b _08072222
	.align 2, 0
_0807207C: .4byte 0x00000135
_08072080:
	movs r5, #0x9a
	lsls r5, r5, #1
	b _08072222
_08072086:
	ldr r5, _0807208C  @ 0x000002DD
	b _08072222
	.align 2, 0
_0807208C: .4byte 0x000002DD
_08072090:
	ldr r5, _08072094  @ 0x000002DE
	b _08072222
	.align 2, 0
_08072094: .4byte 0x000002DE
_08072098:
	ldr r5, _0807209C  @ 0x000002DF
	b _08072222
	.align 2, 0
_0807209C: .4byte 0x000002DF
_080720A0:
	ldr r5, _080720A4  @ 0x000002F7
	b _08072222
	.align 2, 0
_080720A4: .4byte 0x000002F7
_080720A8:
	movs r5, #0xba
	lsls r5, r5, #2
	b _08072222
_080720AE:
	ldr r5, _080720B4  @ 0x00000325
	b _08072222
	.align 2, 0
_080720B4: .4byte 0x00000325
_080720B8:
	ldr r5, _080720BC  @ 0x00000326
	b _08072222
	.align 2, 0
_080720BC: .4byte 0x00000326
_080720C0:
	ldr r5, _080720C4  @ 0x00000327
	b _08072222
	.align 2, 0
_080720C4: .4byte 0x00000327
_080720C8:
	ldr r1, _080720D8  @ gUnknown_08758E00
	lsls r0, r4, #2
	adds r0, r0, r1
	ldr r1, [r0]
	lsls r0, r7, #1
	adds r0, r0, r6
	lsls r0, r0, #1
	b _08072198
	.align 2, 0
_080720D8: .4byte gUnknown_08758E00
_080720DC:
	ldr r5, _080720E0  @ 0x0000032A
	b _08072222
	.align 2, 0
_080720E0: .4byte 0x0000032A
_080720E4:
	ldr r5, _080720E8  @ 0x0000032B
	b _08072222
	.align 2, 0
_080720E8: .4byte 0x0000032B
_080720EC:
	movs r5, #0xcb
	lsls r5, r5, #2
	b _08072222
_080720F2:
	ldr r1, _08072104  @ gUnknown_08758E8C
	lsls r0, r4, #2
	adds r0, r0, r1
	ldr r1, [r0]
	lsls r0, r7, #1
	adds r0, r0, r6
	lsls r0, r0, #1
	b _08072198
	.align 2, 0
_08072104: .4byte gUnknown_08758E8C
_08072108:
	ldr r5, _0807210C  @ 0x0000032E
	b _08072222
	.align 2, 0
_0807210C: .4byte 0x0000032E
_08072110:
	ldr r5, _08072114  @ 0x00000332
	b _08072222
	.align 2, 0
_08072114: .4byte 0x00000332
_08072118:
	ldr r5, _0807211C  @ 0x000003B7
	b _08072222
	.align 2, 0
_0807211C: .4byte 0x000003B7
_08072120:
	ldr r5, _08072124  @ 0x0000032F
	b _08072222
	.align 2, 0
_08072124: .4byte 0x0000032F
_08072128:
	movs r5, #0xcc
	lsls r5, r5, #2
	b _08072222
_0807212E:
	ldr r5, _08072134  @ 0x00000331
	b _08072222
	.align 2, 0
_08072134: .4byte 0x00000331
_08072138:
	movs r5, #0xc8
	lsls r5, r5, #2
	b _08072222
_0807213E:
	ldr r5, _08072144  @ 0x00000321
	b _08072222
	.align 2, 0
_08072144: .4byte 0x00000321
_08072148:
	ldr r1, _08072158  @ gUnknown_08758F18
	lsls r0, r4, #2
	adds r0, r0, r1
	ldr r1, [r0]
	lsls r0, r7, #1
	adds r0, r0, r6
	lsls r0, r0, #1
	b _08072198
	.align 2, 0
_08072158: .4byte gUnknown_08758F18
_0807215C:
	ldr r1, _0807216C  @ gUnknown_08758FA4
	lsls r0, r4, #2
	adds r0, r0, r1
	ldr r1, [r0]
	lsls r0, r7, #1
	adds r0, r0, r6
	lsls r0, r0, #1
	b _08072198
	.align 2, 0
_0807216C: .4byte gUnknown_08758FA4
_08072170:
	movs r5, #0xf0
	lsls r5, r5, #2
	b _08072222
_08072176:
	ldr r5, _0807217C  @ 0x000003C2
	b _08072222
	.align 2, 0
_0807217C: .4byte 0x000003C2
_08072180:
	ldr r5, _08072184  @ 0x000003C3
	b _08072222
	.align 2, 0
_08072184: .4byte 0x000003C3
_08072188:
	movs r5, #0xf1
	lsls r5, r5, #2
	b _08072222
_0807218E:
	ldr r0, _080721A0  @ gUnknown_08758D20
	lsls r1, r4, #2
	adds r1, r1, r0
	ldr r1, [r1]
	lsls r0, r6, #1
_08072198:
	adds r0, r0, r1
	ldrh r5, [r0]
	b _08072222
	.align 2, 0
_080721A0: .4byte gUnknown_08758D20
_080721A4:
	ldr r0, _080721B4  @ gUnknown_08758D20
	lsls r1, r4, #2
	adds r1, r1, r0
	ldr r1, [r1]
	lsls r0, r6, #1
	adds r0, r0, r1
	ldrh r5, [r0, #4]
	b _08072222
	.align 2, 0
_080721B4: .4byte gUnknown_08758D20
_080721B8:
	ldr r0, _080721C8  @ gUnknown_08758D20
	lsls r1, r4, #2
	adds r1, r1, r0
	ldr r1, [r1]
	lsls r0, r6, #1
	adds r0, r0, r1
	ldrh r5, [r0, #8]
	b _08072222
	.align 2, 0
_080721C8: .4byte gUnknown_08758D20
_080721CC:
	ldr r0, _080721DC  @ gUnknown_08758D20
	lsls r1, r4, #2
	adds r1, r1, r0
	ldr r1, [r1]
	lsls r0, r6, #1
	adds r0, r0, r1
	ldrh r5, [r0, #0xc]
	b _08072222
	.align 2, 0
_080721DC: .4byte gUnknown_08758D20
_080721E0:
	ldr r5, _080721E4  @ 0x00000322
	b _08072222
	.align 2, 0
_080721E4: .4byte 0x00000322
_080721E8:
	ldr r5, _080721EC  @ 0x0000037D
	b _08072222
	.align 2, 0
_080721EC: .4byte 0x0000037D
_080721F0:
	ldr r5, _080721F4  @ 0x00000329
	b _08072222
	.align 2, 0
_080721F4: .4byte 0x00000329
_080721F8:
	ldr r5, _080721FC  @ 0x0000037A
	b _08072222
	.align 2, 0
_080721FC: .4byte 0x0000037A
_08072200:
	ldr r5, _08072204  @ 0x0000037B
	b _08072222
	.align 2, 0
_08072204: .4byte 0x0000037B
_08072208:
	movs r5, #0xb9
	lsls r5, r5, #2
	b _08072222
_0807220E:
	movs r5, #0xdf
	lsls r5, r5, #2
	b _08072222
_08072214:
	ldr r5, _08072218  @ 0x0000037F
	b _08072222
	.align 2, 0
_08072218: .4byte 0x0000037F
_0807221C:
	movs r5, #0xde
	b _08072222
_08072220:
	movs r5, #0
_08072222:
	lsls r0, r5, #0x10
	asrs r4, r0, #0x10
	movs r0, #1
	negs r0, r0
	cmp r4, r0
	beq _08072246
	ldr r1, [sp]
	adds r0, r4, #0
	str r2, [sp, #4]
	bl EfxPlaySE
	ldr r2, [sp, #4]
	lsls r1, r2, #0x10
	asrs r1, r1, #0x10
	movs r2, #1
	adds r0, r4, #0
	bl M4aPlayWithPostionCtrl
_08072246:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END EfxPlaySEwithCmdCtrl

	THUMB_FUNC_START sub_8072258
sub_8072258: @ 0x08072258
	push {r4, lr}
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	bl GetBattleAnimArenaFlag
	cmp r0, #1
	bne _0807226A
_08072266:
	movs r0, #0
	b _0807239E
_0807226A:
	cmp r4, #0x40
	bls _08072270
	b _0807239C
_08072270:
	lsls r0, r4, #2
	ldr r1, _0807227C  @ _08072280
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0807227C: .4byte _08072280
_08072280: @ jump table
	.4byte _0807239C @ case 0
	.4byte _08072266 @ case 1
	.4byte _08072266 @ case 2
	.4byte _08072266 @ case 3
	.4byte _08072266 @ case 4
	.4byte _08072266 @ case 5
	.4byte _08072398 @ case 6
	.4byte _08072398 @ case 7
	.4byte _08072398 @ case 8
	.4byte _08072398 @ case 9
	.4byte _08072266 @ case 10
	.4byte _08072398 @ case 11
	.4byte _08072384 @ case 12
	.4byte _08072384 @ case 13
	.4byte _08072390 @ case 14
	.4byte _08072390 @ case 15
	.4byte _08072388 @ case 16
	.4byte _08072266 @ case 17
	.4byte _0807238C @ case 18
	.4byte _08072394 @ case 19
	.4byte _08072394 @ case 20
	.4byte _08072388 @ case 21
	.4byte _08072388 @ case 22
	.4byte _08072398 @ case 23
	.4byte _08072398 @ case 24
	.4byte _08072266 @ case 25
	.4byte _08072266 @ case 26
	.4byte _08072266 @ case 27
	.4byte _08072266 @ case 28
	.4byte _08072398 @ case 29
	.4byte _08072398 @ case 30
	.4byte _08072398 @ case 31
	.4byte _08072398 @ case 32
	.4byte _08072398 @ case 33
	.4byte _08072266 @ case 34
	.4byte _08072266 @ case 35
	.4byte _08072398 @ case 36
	.4byte _08072266 @ case 37
	.4byte _0807238C @ case 38
	.4byte _08072266 @ case 39
	.4byte _08072266 @ case 40
	.4byte _08072266 @ case 41
	.4byte _0807238C @ case 42
	.4byte _08072266 @ case 43
	.4byte _0807239C @ case 44
	.4byte _08072398 @ case 45
	.4byte _0807239C @ case 46
	.4byte _08072266 @ case 47
	.4byte _08072398 @ case 48
	.4byte _08072398 @ case 49
	.4byte _08072398 @ case 50
	.4byte _08072266 @ case 51
	.4byte _0807239C @ case 52
	.4byte _0807239C @ case 53
	.4byte _08072388 @ case 54
	.4byte _08072398 @ case 55
	.4byte _08072266 @ case 56
	.4byte _08072266 @ case 57
	.4byte _0807238C @ case 58
	.4byte _0807238C @ case 59
	.4byte _08072388 @ case 60
	.4byte _0807238C @ case 61
	.4byte _08072398 @ case 62
	.4byte _08072266 @ case 63
	.4byte _08072266 @ case 64
_08072384:
	movs r0, #1
	b _0807239E
_08072388:
	movs r0, #2
	b _0807239E
_0807238C:
	movs r0, #3
	b _0807239E
_08072390:
	movs r0, #4
	b _0807239E
_08072394:
	movs r0, #5
	b _0807239E
_08072398:
	movs r0, #6
	b _0807239E
_0807239C:
	movs r0, #0
_0807239E:
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8072258

	THUMB_FUNC_START sub_80723A4
sub_80723A4: @ 0x080723A4
	push {r4, r5, lr}
	adds r4, r0, #0
	bl sub_807290C
	movs r2, #2
	ldrsh r1, [r4, r2]
	adds r5, r0, r1
	adds r0, r4, #0
	bl GetAnimPosition
	cmp r0, #0
	bne _080723C2
	cmp r5, #0x58
	bgt _080723CA
	b _080723C6
_080723C2:
	cmp r5, #0x97
	ble _080723CA
_080723C6:
	movs r0, #1
	b _080723CC
_080723CA:
	movs r0, #0
_080723CC:
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80723A4

	THUMB_FUNC_START sub_80723D4
sub_80723D4: @ 0x080723D4
	push {lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r2, r0, #0
	movs r1, #0
	cmp r0, #4
	bls _080723F8
	cmp r0, #8
	bhi _080723EA
	movs r1, #1
	b _080723F8
_080723EA:
	cmp r0, #0xb
	bhi _080723F2
	movs r1, #2
	b _080723F8
_080723F2:
	cmp r2, #0xf
	bhi _080723F8
	movs r1, #3
_080723F8:
	adds r0, r1, #0
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80723D4

	THUMB_FUNC_START sub_8072400
sub_8072400: @ 0x08072400
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r4, _08072440  @ gEfxPairHpBufOffset
	bl GetAnimPosition
	lsls r0, r0, #1
	adds r0, r0, r4
	movs r1, #0
	ldrsh r6, [r0, r1]
	adds r0, r5, #0
	bl GetAnimPosition
	lsls r1, r6, #1
	adds r6, r1, r0
	adds r0, r6, #0
	bl GetEfxHp
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	adds r0, r6, #2
	bl GetEfxHp
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r4, r0
	beq _08072448
	cmp r0, #0
	beq _08072444
	movs r0, #0
	b _0807244A
	.align 2, 0
_08072440: .4byte gEfxPairHpBufOffset
_08072444:
	movs r0, #1
	b _0807244A
_08072448:
	movs r0, #2
_0807244A:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8072400

	THUMB_FUNC_START sub_8072450
sub_8072450: @ 0x08072450
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	bl GetAnimAnotherSide
	adds r4, r0, #0
	ldr r6, _080724C0  @ 0x0000FFFF
	adds r0, r5, #0
	bl sub_8072504
	adds r0, r4, #0
	bl sub_8072400
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #2
	beq _080724A6
	adds r0, r5, #0
	bl GetAnimPosition
	adds r1, r0, #0
	ldrh r0, [r5, #0xe]
	subs r0, #1
	lsls r0, r0, #1
	adds r0, r0, r1
	bl GetBattleAnimRoundTypeFlags
	movs r1, #0x80
	lsls r1, r1, #2
	ands r1, r0
	cmp r1, #0
	beq _080724A6
	ldr r4, _080724C4  @ 0x000003CF
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r4, #0
	bl EfxPlaySE
	movs r0, #2
	ldrsh r1, [r5, r0]
	adds r0, r4, #0
	movs r2, #1
	bl M4aPlayWithPostionCtrl
_080724A6:
	adds r0, r5, #0
	bl sub_8072400
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	beq _080724D2
	cmp r0, #1
	bgt _080724C8
	cmp r0, #0
	beq _080724CE
	b _080724D8
	.align 2, 0
_080724C0: .4byte 0x0000FFFF
_080724C4: .4byte 0x000003CF
_080724C8:
	cmp r0, #2
	beq _080724D6
	b _080724D8
_080724CE:
	movs r6, #0xd4
	b _080724D8
_080724D2:
	movs r6, #0xd5
	b _080724D8
_080724D6:
	ldr r6, _08072500  @ 0x000002CE
_080724D8:
	lsls r0, r6, #0x10
	asrs r4, r0, #0x10
	movs r0, #1
	negs r0, r0
	cmp r4, r0
	beq _080724FA
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r4, #0
	bl EfxPlaySE
	movs r0, #2
	ldrsh r1, [r5, r0]
	adds r0, r4, #0
	movs r2, #1
	bl M4aPlayWithPostionCtrl
_080724FA:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08072500: .4byte 0x000002CE

	THUMB_FUNC_END sub_8072450

	THUMB_FUNC_START sub_8072504
sub_8072504: @ 0x08072504
	push {r4, r5, lr}
	adds r4, r0, #0
	bl GetAnimAnotherSide
	adds r5, r0, #0
	adds r0, r4, #0
	bl sub_8072400
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bgt _08072540
	cmp r0, #0
	blt _08072540
	adds r0, r5, #0
	bl CheckRoundCrit
	cmp r0, #1
	bne _08072540
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #0xd8
	bl EfxPlaySE
	movs r0, #2
	ldrsh r1, [r4, r0]
	movs r0, #0xd8
	movs r2, #1
	bl M4aPlayWithPostionCtrl
_08072540:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8072504

	THUMB_FUNC_START sub_8072548
sub_8072548: @ 0x08072548
	push {lr}
	ldr r1, _08072564  @ gBattleHitArray
	ldr r1, [r1]
	lsls r1, r1, #8
	lsrs r1, r1, #0x1b
	movs r2, #8
	ands r1, r2
	negs r1, r1
	lsrs r1, r1, #0x1f
	cmp r0, r1
	beq _08072568
	movs r0, #0
	b _0807256A
	.align 2, 0
_08072564: .4byte gBattleHitArray
_08072568:
	movs r0, #1
_0807256A:
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8072548

	THUMB_FUNC_START sub_8072570
sub_8072570: @ 0x08072570
	push {lr}
	cmp r0, #0
	bne _08072578
	b _080726A4
_08072578:
	bl GetItemIndex
	subs r0, #0x4b
	cmp r0, #0x41
	bls _08072584
	b _080726A4
_08072584:
	lsls r0, r0, #2
	ldr r1, _08072590  @ _08072594
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08072590: .4byte _08072594
_08072594: @ jump table
	.4byte _0807269C @ case 0
	.4byte _0807269C @ case 1
	.4byte _0807269C @ case 2
	.4byte _0807269C @ case 3
	.4byte _0807269C @ case 4
	.4byte _0807269C @ case 5
	.4byte _080726A0 @ case 6
	.4byte _080726A0 @ case 7
	.4byte _080726A0 @ case 8
	.4byte _080726A4 @ case 9
	.4byte _080726A4 @ case 10
	.4byte _080726A4 @ case 11
	.4byte _0807269C @ case 12
	.4byte _080726A4 @ case 13
	.4byte _0807269C @ case 14
	.4byte _080726A4 @ case 15
	.4byte _080726A4 @ case 16
	.4byte _080726A4 @ case 17
	.4byte _080726A4 @ case 18
	.4byte _080726A4 @ case 19
	.4byte _080726A4 @ case 20
	.4byte _080726A4 @ case 21
	.4byte _080726A4 @ case 22
	.4byte _080726A4 @ case 23
	.4byte _080726A4 @ case 24
	.4byte _080726A4 @ case 25
	.4byte _080726A4 @ case 26
	.4byte _080726A4 @ case 27
	.4byte _080726A4 @ case 28
	.4byte _080726A4 @ case 29
	.4byte _080726A4 @ case 30
	.4byte _080726A4 @ case 31
	.4byte _080726A4 @ case 32
	.4byte _080726A4 @ case 33
	.4byte _080726A4 @ case 34
	.4byte _080726A4 @ case 35
	.4byte _080726A4 @ case 36
	.4byte _080726A4 @ case 37
	.4byte _080726A4 @ case 38
	.4byte _080726A4 @ case 39
	.4byte _080726A4 @ case 40
	.4byte _080726A4 @ case 41
	.4byte _080726A4 @ case 42
	.4byte _080726A4 @ case 43
	.4byte _080726A4 @ case 44
	.4byte _080726A4 @ case 45
	.4byte _080726A4 @ case 46
	.4byte _080726A4 @ case 47
	.4byte _080726A4 @ case 48
	.4byte _080726A4 @ case 49
	.4byte _080726A4 @ case 50
	.4byte _080726A4 @ case 51
	.4byte _080726A4 @ case 52
	.4byte _080726A4 @ case 53
	.4byte _080726A4 @ case 54
	.4byte _080726A4 @ case 55
	.4byte _080726A4 @ case 56
	.4byte _080726A4 @ case 57
	.4byte _080726A4 @ case 58
	.4byte _080726A4 @ case 59
	.4byte _080726A4 @ case 60
	.4byte _080726A4 @ case 61
	.4byte _080726A4 @ case 62
	.4byte _080726A4 @ case 63
	.4byte _080726A4 @ case 64
	.4byte _0807269C @ case 65
_0807269C:
	movs r0, #2
	b _080726A6
_080726A0:
	movs r0, #1
	b _080726A6
_080726A4:
	movs r0, #0
_080726A6:
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8072570

	THUMB_FUNC_START sub_80726AC
sub_80726AC: @ 0x080726AC
	push {r4, r5, r6, r7, lr}
	ldr r0, _080726F0  @ gpEkrBattleUnitLeft
	ldr r1, _080726F4  @ gpEkrBattleUnitRight
	ldr r5, [r0]
	ldr r7, [r1]
	ldr r0, _080726F8  @ gBmSt
	ldrb r1, [r0, #4]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _080726C4
	b _0807288C
_080726C4:
	ldr r1, _080726FC  @ gUnknown_020200A8
	movs r0, #1
	str r0, [r1]
	ldr r1, _08072700  @ gPalIndexEfxHpBarUnk
	ldr r0, _08072704  @ gEkrInitialHitSide
	movs r2, #0
	ldrsh r0, [r0, r2]
	lsls r0, r0, #1
	adds r0, r0, r1
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r6, #0x1a
	cmp r0, #1
	beq _080726E2
	movs r6, #0x19
_080726E2:
	bl GetBattleAnimArenaFlag
	cmp r0, #1
	bne _08072708
	bl Sound_SetDefaultMaxNumChannels
	b _08072710
	.align 2, 0
_080726F0: .4byte gpEkrBattleUnitLeft
_080726F4: .4byte gpEkrBattleUnitRight
_080726F8: .4byte gBmSt
_080726FC: .4byte gUnknown_020200A8
_08072700: .4byte gPalIndexEfxHpBarUnk
_08072704: .4byte gEkrInitialHitSide
_08072708:
	bl GetBanimLinkArenaFlag
	cmp r0, #1
	bne _0807271C
_08072710:
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #0x39
	bl sub_8071A54
	b _08072892
_0807271C:
	ldr r0, _08072734  @ gEkrDistanceType
	movs r2, #0
	ldrsh r0, [r0, r2]
	cmp r0, #4
	bne _08072738
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #0x23
	bl sub_8071A54
	b _08072892
	.align 2, 0
_08072734: .4byte gEkrDistanceType
_08072738:
	movs r4, #0
	adds r0, r7, #0
	adds r0, #0x4a
	ldrh r0, [r0]
	bl sub_8058B08
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _0807274E
	movs r4, #1
_0807274E:
	movs r0, #1
	bl sub_8058B24
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0807275C
	movs r4, #0
_0807275C:
	ldr r0, _08072790  @ gEkrPairSideVaild
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _08072768
	movs r4, #0
_08072768:
	ldr r0, [r5]
	ldrb r0, [r0, #4]
	cmp r0, #0x40
	bne _08072772
	movs r4, #0
_08072772:
	cmp r0, #0x6c
	bne _08072778
	movs r4, #0
_08072778:
	cmp r0, #0xbe
	bne _0807277E
	movs r4, #0
_0807277E:
	cmp r4, #1
	bne _08072794
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #0x1f
	bl sub_8071A54
	b _08072892
	.align 2, 0
_08072790: .4byte gEkrPairSideVaild
_08072794:
	cmp r0, #0xbe
	bne _080727B4
	bl CheckFlag82
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _080727B0
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #0x55
	bl sub_8071A54
	b _08072892
_080727B0:
	bl SetFlag82
_080727B4:
	adds r0, r5, #0
	bl sub_80728D0
	adds r4, r0, #0
	ldr r0, [r5]
	ldrb r0, [r0, #4]
	bl GetUnitFromCharId
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #0xc0
	ands r0, r1
	cmp r0, #0
	bne _080727D6
	movs r4, #1
	negs r4, r4
_080727D6:
	ldr r0, _080727F8  @ gEkrPairSideVaild
	movs r2, #0
	ldrsh r0, [r0, r2]
	cmp r0, #0
	bne _080727E4
	movs r4, #1
	negs r4, r4
_080727E4:
	movs r0, #1
	negs r0, r0
	cmp r4, r0
	beq _080727FC
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r4, #0
	bl sub_8071A54
	b _08072892
	.align 2, 0
_080727F8: .4byte gEkrPairSideVaild
_080727FC:
	movs r4, #0
	ldr r0, [r7, #4]
	ldrb r0, [r0, #4]
	cmp r0, #0x4d
	bne _08072822
	ldr r0, _08072834  @ gBattleStats
	ldrh r1, [r0]
	movs r0, #0x40
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	negs r0, r0
	lsrs r4, r0, #0x1f
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08072822
	movs r4, #1
_08072822:
	cmp r4, #1
	bne _08072838
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #0x20
	bl sub_8071A54
	b _08072892
	.align 2, 0
_08072834: .4byte gBattleStats
_08072838:
	movs r0, #0
	bl sub_8072548
	cmp r0, #1
	bne _0807284C
	ldr r0, _08072848  @ gBattleActor
	b _08072858
	.align 2, 0
_08072848: .4byte gBattleActor
_0807284C:
	movs r0, #1
	bl sub_8072548
	cmp r0, #1
	bne _08072868
	ldr r0, _08072864  @ gBattleTarget
_08072858:
	adds r0, #0x4a
	ldrh r0, [r0]
	bl sub_8072570
	b _0807286A
	.align 2, 0
_08072864: .4byte gBattleTarget
_08072868:
	movs r0, #0
_0807286A:
	cmp r0, #1
	beq _08072876
	cmp r0, #2
	bne _08072878
	movs r6, #0x22
	b _08072878
_08072876:
	movs r6, #0x21
_08072878:
	movs r0, #1
	negs r0, r0
	cmp r6, r0
	beq _0807288C
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r6, #0
	bl sub_8071A54
	b _08072892
_0807288C:
	ldr r1, _08072898  @ gUnknown_020200A8
	movs r0, #0
	str r0, [r1]
_08072892:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08072898: .4byte gUnknown_020200A8

	THUMB_FUNC_END sub_80726AC

	THUMB_FUNC_START sub_807289C
sub_807289C: @ 0x0807289C
	push {lr}
	bl CheckBanimHensei
	cmp r0, #1
	beq _080728BA
	ldr r0, _080728C0  @ gBmSt
	ldrb r1, [r0, #4]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	bne _080728BA
	ldr r0, _080728C4  @ gUnknown_020200A8
	ldr r0, [r0]
	cmp r0, #0
	bne _080728C8
_080728BA:
	bl MakeBgmOverridePersist
	b _080728CC
	.align 2, 0
_080728C0: .4byte gBmSt
_080728C4: .4byte gUnknown_020200A8
_080728C8:
	bl RestoreBgm
_080728CC:
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_807289C

	THUMB_FUNC_START sub_80728D0
sub_80728D0: @ 0x080728D0
	push {r4, r5, lr}
	ldr r0, [r0]
	ldrb r2, [r0, #4]
	movs r3, #0
	ldr r0, _08072908  @ gUnknown_08758A60
	ldr r1, [r0]
	movs r4, #1
	negs r4, r4
	adds r5, r0, #0
	cmp r1, r4
	beq _080728FA
	cmp r2, r1
	beq _080728FA
	adds r1, r5, #0
_080728EC:
	adds r1, #8
	adds r3, #2
	ldr r0, [r1]
	cmp r0, r4
	beq _080728FA
	cmp r2, r0
	bne _080728EC
_080728FA:
	adds r0, r3, #1
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r0, [r0]
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08072908: .4byte gUnknown_08758A60

	THUMB_FUNC_END sub_80728D0

	THUMB_FUNC_START sub_807290C
sub_807290C: @ 0x0807290C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r2, [r0, #0x3c]
	ldr r3, [r2]
	ldr r1, _0807293C  @ 0xFFFF0000
	adds r0, r3, #0
	ands r0, r1
	cmp r0, r1
	bne _08072930
	ldr r7, _08072940  @ 0x0000FFFF
	ands r7, r3
	cmp r7, #0
	beq _08072930
_08072928:
	subs r7, #1
	adds r2, #0xc
	cmp r7, #0
	bne _08072928
_08072930:
	adds r6, r2, #0
	movs r7, #0
	movs r0, #0
	mov r8, r0
	b _08072978
	.align 2, 0
_0807293C: .4byte 0xFFFF0000
_08072940: .4byte 0x0000FFFF
_08072944:
	movs r0, #6
	ldrsh r5, [r6, r0]
	ldr r0, [r6]
	bl sub_80717D4
	lsls r0, r0, #0x10
	asrs r0, r0, #0x11
	adds r5, r5, r0
	ldr r0, [r6]
	bl sub_80717D4
	adds r4, r0, #0
	ldr r0, [r6]
	bl sub_80717F0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	adds r1, r4, #0
	muls r1, r0, r1
	adds r0, r1, #0
	muls r0, r5, r0
	add r8, r0
	adds r7, r7, r1
	adds r6, #0xc
_08072978:
	ldr r0, [r6]
	cmp r0, #1
	bne _08072944
	cmp r7, #0
	bne _0807298C
	ldr r0, _08072988  @ 0x7FFFFFFF
	b _08072994
	.align 2, 0
_08072988: .4byte 0x7FFFFFFF
_0807298C:
	mov r0, r8
	adds r1, r7, #0
	bl Div
_08072994:
	mov r8, r0
	mov r0, r8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_807290C

	THUMB_FUNC_START PlaySFX
PlaySFX: @ 0x080729A4
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r2, #0
	adds r6, r3, #0
	bl EfxPlaySE
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r6, #0
	bl M4aPlayWithPostionCtrl
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END PlaySFX

	THUMB_FUNC_START sub_80729C0
sub_80729C0: @ 0x080729C0
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r2, #0
	bl EfxPlaySE
	adds r0, r4, #0
	bl sub_807290C
	adds r1, r0, #0
	adds r0, r5, #0
	movs r2, #1
	bl M4aPlayWithPostionCtrl
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80729C0

.align 2, 0
