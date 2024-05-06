	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	THUMB_FUNC_START sub_8047AB8
sub_8047AB8: @ 0x08047AB8
	push {r4, lr}
	sub sp, #0x4c
	movs r4, #0
_08047ABE:
	adds r0, r4, #0
	bl IsSaveValid
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08047AE2
	adds r0, r4, #0
	mov r1, sp
	bl ReadGameSavePlaySt
	mov r0, sp
	bl IsGameNotFirstChapter
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08047AE2
	movs r0, #1
	b _08047AEA
_08047AE2:
	adds r4, #1
	cmp r4, #2
	ble _08047ABE
	movs r0, #0
_08047AEA:
	add sp, #0x4c
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8047AB8

	THUMB_FUNC_START sub_8047AF4
sub_8047AF4: @ 0x08047AF4
	push {lr}
	bl sub_8047AB8
	ldr r1, _08047B20  @ gLinkArenaSt
	strb r0, [r1, #0xa]
	ldr r1, _08047B24  @ gUnk_Sio_0203DD2C
	movs r2, #0
	adds r0, r1, #0
	adds r0, #0x1e
_08047B06:
	strh r2, [r0]
	subs r0, #2
	cmp r0, r1
	bge _08047B06
	movs r1, #0
	ldr r3, _08047B28  @ gUnknown_03001808
	ldr r2, _08047B2C  @ gUnknown_0300180C
	ldr r0, _08047B30  @ gUnk_Sio_0203DD4C
	str r1, [r0]
	str r1, [r2]
	str r1, [r3]
	pop {r0}
	bx r0
	.align 2, 0
_08047B20: .4byte gLinkArenaSt
_08047B24: .4byte gUnk_Sio_0203DD2C
_08047B28: .4byte gUnknown_03001808
_08047B2C: .4byte gUnknown_0300180C
_08047B30: .4byte gUnk_Sio_0203DD4C

	THUMB_FUNC_END sub_8047AF4

	THUMB_FUNC_START sub_8047B34
sub_8047B34: @ 0x08047B34
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r6, r0, #0
	ldr r4, _08047BC4  @ gSioSaveConfig
	adds r0, r4, #0
	bl ReadMultiArenaSaveConfig
	ldrb r0, [r4]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1f
	adds r5, r6, #0
	adds r5, #0x59
	movs r4, #0
	strb r0, [r5]
	bl InitSioBG
	str r4, [sp]
	adds r0, r6, #0
	movs r1, #0
	movs r2, #0x10
	movs r3, #4
	bl StartMuralBackgroundExt
	ldr r0, _08047BC8  @ gUnknown_085AB358
	ldr r1, _08047BCC  @ 0x06014800
	bl Decompress
	ldr r0, _08047BD0  @ gUnknown_085ADBE8
	movs r1, #0x98
	lsls r1, r1, #2
	movs r2, #0x60
	bl CopyToPaletteBuffer
	ldr r0, _08047BD4  @ Font_0203DB64
	bl SetTextFont
	bl InitSystemTextFont
	bl ResetTextFont
	bl sub_8043164
	str r4, [r6, #0x4c]
	bl IsMultiArenaSaveReady
	adds r2, r6, #0
	adds r2, #0x58
	strb r0, [r2]
	adds r1, r6, #0
	adds r1, #0x40
	movs r0, #1
	strb r0, [r1]
	movs r1, #0
	ldrsb r1, [r2, r1]
	negs r0, r1
	orrs r0, r1
	lsrs r1, r0, #0x1f
	adds r0, r6, #0
	adds r0, #0x41
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	movs r0, #0
	ldrsb r0, [r5, r0]
	cmp r0, #0
	bne _08047BD8
	movs r1, #0
	movs r0, #3
	b _08047BDC
	.align 2, 0
_08047BC4: .4byte gSioSaveConfig
_08047BC8: .4byte gUnknown_085AB358
_08047BCC: .4byte 0x06014800
_08047BD0: .4byte gUnknown_085ADBE8
_08047BD4: .4byte Font_0203DB64
_08047BD8:
	movs r1, #1
	movs r0, #4
_08047BDC:
	str r0, [r6, #0x50]
	adds r0, r6, #0
	adds r0, #0x44
	strb r1, [r0]
	ldr r0, _08047C58  @ gLinkArenaSt
	ldrb r0, [r0, #1]
	str r0, [r6, #0x48]
	adds r2, r6, #0
	adds r2, #0x40
	adds r0, r2, r0
	movs r1, #2
	strb r1, [r0]
	movs r4, #4
	adds r7, r2, #0
	adds r5, r6, #0
	adds r5, #0x3c
_08047BFC:
	lsls r3, r4, #0x18
	lsrs r3, r3, #0x18
	adds r0, r7, r4
	ldrb r0, [r0]
	str r0, [sp]
	adds r0, r6, #0
	movs r1, #0xb0
	movs r2, #0xa0
	bl sub_804C758
	str r0, [r5]
	subs r5, #4
	subs r4, #1
	cmp r4, #0
	bge _08047BFC
	ldr r0, [r6, #0x2c]
	movs r1, #0
	movs r2, #0
	bl NewProc085AA980
	bl sub_804C508
	ldr r0, _08047C5C  @ gUnknown_085A9E48
	bl SetupFaceGfxData
	movs r0, #2
	str r0, [sp]
	movs r0, #3
	movs r1, #0x64
	movs r2, #0xd0
	movs r3, #0x50
	bl StartFace
	movs r0, #0
	str r0, [r6, #0x54]
	movs r0, #0x38
	movs r1, #0
	bl StartBgm
	bl sub_80497CC
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08047C58: .4byte gLinkArenaSt
_08047C5C: .4byte gUnknown_085A9E48

	THUMB_FUNC_END sub_8047B34

	THUMB_FUNC_START sub_8047C60
sub_8047C60: @ 0x08047C60
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r7, r0, #0
	movs r1, #0x50
	negs r1, r1
	ldr r5, _08047CEC  @ gUnknown_080D9EF0
	ldrb r2, [r5]
	ldr r3, [r7, #0x54]
	movs r4, #0x20
	str r4, [sp]
	movs r0, #4
	bl Interpolate
	adds r6, r0, #0
	ldrb r2, [r5, #1]
	ldr r3, [r7, #0x54]
	str r4, [sp]
	movs r0, #5
	movs r1, #0xa0
	bl Interpolate
	movs r5, #4
	lsls r6, r6, #0x10
	mov r8, r6
	lsls r6, r0, #0x10
	adds r4, r7, #0
	adds r4, #0x3c
_08047C9A:
	ldr r0, [r4]
	mov r2, r8
	asrs r1, r2, #0x10
	asrs r2, r6, #0x10
	bl sub_804C7DC
	subs r4, #4
	subs r5, #1
	cmp r5, #0
	bge _08047C9A
	ldr r0, [r7, #0x54]
	cmp r0, #0x1f
	ble _08047CDA
	movs r0, #0
	str r0, [r7, #0x54]
	adds r0, r7, #0
	movs r1, #0
	bl sub_8047A54
	movs r1, #0
	bl sub_8043100
	adds r0, r7, #0
	movs r1, #1
	bl sub_8047A54
	movs r1, #1
	bl sub_8043100
	adds r0, r7, #0
	bl Proc_Break
_08047CDA:
	ldr r0, [r7, #0x54]
	adds r0, #1
	str r0, [r7, #0x54]
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08047CEC: .4byte gUnknown_080D9EF0

	THUMB_FUNC_END sub_8047C60

	THUMB_FUNC_START sub_8047CF0
sub_8047CF0: @ 0x08047CF0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r5, r0, #0
	ldr r0, [r5, #0x48]
	lsls r0, r0, #1
	movs r7, #4
	ldr r1, _08047D84  @ gUnknown_080D9EF0
	movs r2, #0x10
	mov r8, r2
	adds r6, r1, #0
	adds r6, #8
	adds r4, r0, r1
	mov sl, r4
	adds r0, #1
	adds r0, r0, r1
	mov r9, r0
_08047D18:
	ldrb r2, [r6]
	ldr r3, [r5, #0x54]
	mov r0, r8
	str r0, [sp]
	movs r0, #4
	mov r4, sl
	ldrb r1, [r4]
	bl Interpolate
	adds r4, r0, #0
	mov r0, r9
	ldrb r1, [r0]
	ldrb r2, [r6, #1]
	ldr r3, [r5, #0x54]
	mov r0, r8
	str r0, [sp]
	movs r0, #4
	bl Interpolate
	adds r2, r0, #0
	lsls r1, r7, #2
	adds r0, r5, #0
	adds r0, #0x2c
	adds r0, r0, r1
	ldr r0, [r0]
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	adds r1, r4, #0
	bl sub_804C7DC
	subs r6, #2
	subs r7, #1
	cmp r7, #0
	bge _08047D18
	ldr r0, [r5, #0x54]
	cmp r0, #0xf
	ble _08047D6C
	adds r0, r5, #0
	bl Proc_Break
_08047D6C:
	ldr r0, [r5, #0x54]
	adds r0, #1
	str r0, [r5, #0x54]
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08047D84: .4byte gUnknown_080D9EF0

	THUMB_FUNC_END sub_8047CF0

	THUMB_FUNC_START sub_8047D88
sub_8047D88: @ 0x08047D88
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r6, r0, #0
	ldr r4, _08047E20  @ gSioSaveConfig
	adds r0, r4, #0
	bl ReadMultiArenaSaveConfig
	ldrb r0, [r4]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1f
	adds r5, r6, #0
	adds r5, #0x59
	movs r4, #0
	strb r0, [r5]
	bl InitSioBG
	str r4, [sp]
	adds r0, r6, #0
	movs r1, #0
	movs r2, #0x10
	movs r3, #4
	bl StartMuralBackgroundExt
	ldr r0, _08047E24  @ gUnknown_085AB358
	ldr r1, _08047E28  @ 0x06014800
	bl Decompress
	ldr r0, _08047E2C  @ gUnknown_085ADBE8
	movs r1, #0x98
	lsls r1, r1, #2
	movs r2, #0x60
	bl CopyToPaletteBuffer
	ldr r0, _08047E30  @ Font_0203DB64
	bl SetTextFont
	bl InitSystemTextFont
	bl ResetTextFont
	bl sub_8043164
	str r4, [r6, #0x4c]
	bl IsMultiArenaSaveReady
	adds r2, r6, #0
	adds r2, #0x58
	strb r0, [r2]
	adds r1, r6, #0
	adds r1, #0x40
	movs r0, #1
	strb r0, [r1]
	movs r1, #0
	ldrsb r1, [r2, r1]
	negs r0, r1
	orrs r0, r1
	lsrs r1, r0, #0x1f
	adds r0, r6, #0
	adds r0, #0x41
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	movs r0, #0
	ldrsb r0, [r5, r0]
	cmp r0, #0
	bne _08047E34
	movs r1, #0
	movs r0, #3
	b _08047E38
	.align 2, 0
_08047E20: .4byte gSioSaveConfig
_08047E24: .4byte gUnknown_085AB358
_08047E28: .4byte 0x06014800
_08047E2C: .4byte gUnknown_085ADBE8
_08047E30: .4byte Font_0203DB64
_08047E34:
	movs r1, #1
	movs r0, #4
_08047E38:
	str r0, [r6, #0x50]
	adds r0, r6, #0
	adds r0, #0x44
	strb r1, [r0]
	ldr r0, _08047EEC  @ gLinkArenaSt
	ldrb r0, [r0, #1]
	str r0, [r6, #0x48]
	adds r2, r6, #0
	adds r2, #0x40
	adds r0, r2, r0
	movs r1, #2
	strb r1, [r0]
	ldr r1, [r6, #0x48]
	lsls r1, r1, #1
	movs r5, #4
	mov r9, r2
	ldr r2, _08047EF0  @ gUnknown_080D9EF0
	adds r0, r1, #1
	adds r0, r0, r2
	mov r8, r0
	adds r4, r6, #0
	adds r4, #0x3c
	adds r1, r1, r2
	mov sl, r1
_08047E68:
	lsls r3, r5, #0x18
	lsrs r3, r3, #0x18
	mov r1, r9
	adds r0, r1, r5
	ldrb r0, [r0]
	str r0, [sp]
	adds r0, r6, #0
	mov r2, sl
	ldrb r1, [r2]
	mov r7, r8
	ldrb r2, [r7]
	bl sub_804C758
	str r0, [r4]
	subs r4, #4
	subs r5, #1
	cmp r5, #0
	bge _08047E68
	ldr r0, [r6, #0x2c]
	movs r1, #0
	movs r2, #0
	bl NewProc085AA980
	bl sub_804C508
	ldr r0, _08047EF4  @ gUnknown_085A9E68
	bl SetupFaceGfxData
	movs r0, #2
	str r0, [sp]
	movs r0, #3
	movs r1, #0x64
	movs r2, #0xd0
	movs r3, #0x50
	bl StartFace
	adds r0, r6, #0
	movs r1, #0
	bl sub_8047A54
	movs r1, #0
	bl sub_8043100
	adds r0, r6, #0
	movs r1, #1
	bl sub_8047A54
	movs r1, #1
	bl sub_8043100
	bl sub_80497CC
	movs r0, #0x38
	movs r1, #0
	bl StartBgm
	movs r0, #0
	str r0, [r6, #0x54]
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08047EEC: .4byte gLinkArenaSt
_08047EF0: .4byte gUnknown_080D9EF0
_08047EF4: .4byte gUnknown_085A9E68

	THUMB_FUNC_END sub_8047D88

	THUMB_FUNC_START sub_8047EF8
sub_8047EF8: @ 0x08047EF8
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	lsls r1, r1, #0x18
	lsrs r6, r1, #0x18
	ldr r0, [r5, #0x48]
	cmp r0, #1
	bne _08047F78
	ldr r0, _08047FF0  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _08047F42
	ldr r1, _08047FF4  @ gLinkArenaSt
	ldrb r0, [r1, #5]
	subs r0, #1
	strb r0, [r1, #5]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #2
	bls _08047F2A
	movs r0, #2
	strb r0, [r1, #5]
_08047F2A:
	ldr r0, [r5, #0x30]
	movs r1, #6
	negs r1, r1
	movs r2, #4
	str r2, [sp]
	movs r2, #0x34
	movs r3, #0x1f
	bl sub_804C7C8
	movs r0, #3
	bl SioPlaySoundEffect
_08047F42:
	ldr r0, _08047FF0  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _08047F78
	ldr r4, _08047FF4  @ gLinkArenaSt
	ldrb r0, [r4, #5]
	adds r0, #1
	strb r0, [r4, #5]
	ldrb r0, [r4, #5]
	movs r1, #3
	bl __umodsi3
	strb r0, [r4, #5]
	ldr r0, [r5, #0x30]
	movs r1, #0x1f
	str r1, [sp]
	movs r1, #0
	movs r2, #0x3a
	movs r3, #4
	bl sub_804C7C8
	movs r0, #3
	bl SioPlaySoundEffect
_08047F78:
	ldr r1, _08047FF0  @ gKeyStatusPtr
	ldr r2, [r1]
	ldrh r3, [r2, #6]
	movs r0, #0x40
	ands r0, r3
	adds r4, r1, #0
	cmp r0, #0
	beq _08047FB2
	ldr r1, [r5, #0x48]
	ldr r0, [r5, #0x4c]
	cmp r1, r0
	bgt _08047F96
	ldrh r2, [r2, #8]
	cmp r3, r2
	bne _08047FB2
_08047F96:
	subs r2, r6, #1
	adds r1, r5, #0
	adds r1, #0x40
_08047F9C:
	ldr r0, [r5, #0x48]
	subs r0, #1
	str r0, [r5, #0x48]
	cmp r0, #0
	bge _08047FA8
	str r2, [r5, #0x48]
_08047FA8:
	ldr r0, [r5, #0x48]
	adds r0, r1, r0
	ldrb r0, [r0]
	cmp r0, #0
	beq _08047F9C
_08047FB2:
	ldr r2, [r4]
	ldrh r3, [r2, #6]
	movs r0, #0x80
	ands r0, r3
	cmp r0, #0
	beq _08047FE6
	ldr r1, [r5, #0x48]
	ldr r0, [r5, #0x50]
	cmp r1, r0
	blt _08047FCC
	ldrh r2, [r2, #8]
	cmp r3, r2
	bne _08047FE6
_08047FCC:
	adds r4, r5, #0
	adds r4, #0x40
_08047FD0:
	ldr r0, [r5, #0x48]
	adds r0, #1
	str r0, [r5, #0x48]
	adds r1, r6, #0
	bl __modsi3
	str r0, [r5, #0x48]
	adds r0, r4, r0
	ldrb r0, [r0]
	cmp r0, #0
	beq _08047FD0
_08047FE6:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08047FF0: .4byte gKeyStatusPtr
_08047FF4: .4byte gLinkArenaSt

	THUMB_FUNC_END sub_8047EF8

	THUMB_FUNC_START sub_8047FF8
sub_8047FF8: @ 0x08047FF8
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r5, [r4, #0x48]
	movs r1, #5
	bl sub_8047EF8
	ldr r0, [r4, #0x48]
	cmp r5, r0
	beq _0804805C
	movs r0, #3
	bl SioPlaySoundEffect
	lsls r0, r5, #2
	adds r1, r4, #0
	adds r1, #0x2c
	adds r0, r1, r0
	ldr r3, [r0]
	adds r2, r3, #0
	adds r2, #0x2e
	movs r0, #1
	strb r0, [r2]
	ldr r0, [r4, #0x48]
	lsls r0, r0, #2
	adds r1, r1, r0
	ldr r3, [r1]
	adds r1, r3, #0
	adds r1, #0x2e
	movs r0, #2
	strb r0, [r1]
	movs r0, #0x2a
	ldrsh r1, [r3, r0]
	movs r0, #0x2c
	ldrsh r2, [r3, r0]
	adds r0, r3, #0
	bl sub_804CFB8
	adds r0, r4, #0
	movs r1, #0
	bl sub_8047A54
	movs r1, #0
	bl sub_8043100
	adds r0, r4, #0
	movs r1, #1
	bl sub_8047A54
	movs r1, #1
	bl sub_8043100
_0804805C:
	ldr r5, _080480AC  @ gKeyStatusPtr
	ldr r0, [r5]
	ldrh r1, [r0, #8]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08048080
	movs r0, #0
	str r0, [r4, #0x54]
	movs r0, #2
	bl SioPlaySoundEffect
	ldr r1, _080480B0  @ gLinkArenaSt
	ldr r0, [r4, #0x48]
	strb r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
_08048080:
	ldr r0, [r5]
	ldrh r1, [r0, #8]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080480A4
	movs r0, #1
	bl SioPlaySoundEffect
	movs r0, #2
	bl Sound_FadeOutBGM
	ldr r1, _080480B0  @ gLinkArenaSt
	movs r0, #0xff
	strb r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
_080480A4:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080480AC: .4byte gKeyStatusPtr
_080480B0: .4byte gLinkArenaSt

	THUMB_FUNC_END sub_8047FF8

	THUMB_FUNC_START sub_80480B4
sub_80480B4: @ 0x080480B4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r5, r0, #0
	ldr r4, _08048160  @ gLinkArenaSt
	ldrb r0, [r4]
	cmp r0, #0xff
	bne _080480D0
	adds r0, r5, #0
	bl Proc_Break
_080480D0:
	ldrb r2, [r4]
	ldr r0, [r5, #0x54]
	cmp r0, #0x10
	bgt _0804813E
	movs r0, #4
	mov r8, r0
	lsls r2, r2, #1
	ldr r1, _08048164  @ gUnknown_080D9EF0
	movs r4, #0x10
	mov r9, r4
	adds r0, r2, #1
	adds r0, r0, r1
	str r0, [sp, #4]
	adds r6, r5, #0
	adds r6, #0x3c
	adds r7, r1, #0
	adds r7, #8
	adds r2, r2, r1
	mov sl, r2
_080480F6:
	ldrb r1, [r7]
	ldr r3, [r5, #0x54]
	mov r0, r9
	str r0, [sp]
	movs r0, #4
	mov r4, sl
	ldrb r2, [r4]
	bl Interpolate
	adds r4, r0, #0
	ldrb r1, [r7, #1]
	ldr r0, [sp, #4]
	ldrb r2, [r0]
	ldr r3, [r5, #0x54]
	mov r0, r9
	str r0, [sp]
	movs r0, #4
	bl Interpolate
	adds r2, r0, #0
	ldr r0, [r6]
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	adds r1, r4, #0
	bl sub_804C7DC
	subs r6, #4
	subs r7, #2
	movs r4, #1
	negs r4, r4
	add r8, r4
	mov r0, r8
	cmp r0, #0
	bge _080480F6
_0804813E:
	ldr r0, [r5, #0x54]
	cmp r0, #0x20
	ble _0804814A
	adds r0, r5, #0
	bl Proc_Break
_0804814A:
	ldr r0, [r5, #0x54]
	adds r0, #1
	str r0, [r5, #0x54]
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08048160: .4byte gLinkArenaSt
_08048164: .4byte gUnknown_080D9EF0

	THUMB_FUNC_END sub_80480B4

	THUMB_FUNC_START sub_8048168
sub_8048168: @ 0x08048168
	push {r4, r5, r6, lr}
	sub sp, #0x14
	adds r6, r0, #0
	mov r1, sp
	ldr r0, _080481BC  @ gUnknown_080D9EFC
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldm r0!, {r2, r3}
	stm r1!, {r2, r3}
	bl EndMuralBackground
	movs r0, #3
	bl EndFaceById
	adds r5, r6, #0
	adds r5, #0x2c
	movs r4, #4
_0804818A:
	ldm r5!, {r0}
	bl Proc_End
	subs r4, #1
	cmp r4, #0
	bge _0804818A
	ldr r1, _080481C0  @ gLinkArenaSt
	ldrb r2, [r1]
	adds r0, r2, #0
	cmp r0, #0xff
	bne _080481C8
	bl BMapVSync_End
	bl nullsub_13
	bl UnsetBmStLinkArenaFlag
	ldr r0, _080481C4  @ ProcScr_DebugMonitor
	bl Proc_EndEach
	adds r0, r6, #0
	bl Proc_End
	b _080481D8
	.align 2, 0
_080481BC: .4byte gUnknown_080D9EFC
_080481C0: .4byte gLinkArenaSt
_080481C4: .4byte ProcScr_DebugMonitor
_080481C8:
	strb r2, [r1, #1]
	ldrb r0, [r1]
	lsls r0, r0, #2
	add r0, sp
	ldr r0, [r0]
	adds r1, r6, #0
	bl Proc_StartBlocking
_080481D8:
	add sp, #0x14
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8048168

	THUMB_FUNC_START sub_80481E0
sub_80481E0: @ 0x080481E0
	push {r4, lr}
	adds r4, r0, #0
	bl LoadUiFrameGraphics
	ldr r0, _08048248  @ Font_0203DB64
	ldr r1, _0804824C  @ 0x06001800
	movs r2, #0xc0
	movs r3, #0
	bl InitTextFont
	movs r0, #5
	bl IsSaveValid
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08048204
	bl WriteNewMultiArenaSave
_08048204:
	ldr r1, _08048250  @ gLinkArenaSt
	movs r0, #0
	strb r0, [r1, #5]
	strb r0, [r1, #3]
	strb r0, [r1, #1]
	bl SetBmStLinkArenaFlag
	bl sub_80496A4
	bl BMapVSync_Start
	ldr r1, _08048254  @ gPlaySt
	ldrb r2, [r1, #0x14]
	movs r0, #0xdf
	ands r0, r2
	strb r0, [r1, #0x14]
	adds r1, #0x41
	ldrb r2, [r1]
	movs r0, #0xd
	negs r0, r0
	ands r0, r2
	strb r0, [r1]
	ldr r0, _08048258  @ gUnknown_085A9E88
	adds r1, r4, #0
	bl Proc_StartBlocking
	ldr r0, _0804825C  @ ProcScr_DebugMonitor
	movs r1, #3
	bl Proc_Start
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08048248: .4byte Font_0203DB64
_0804824C: .4byte 0x06001800
_08048250: .4byte gLinkArenaSt
_08048254: .4byte gPlaySt
_08048258: .4byte gUnknown_085A9E88
_0804825C: .4byte ProcScr_DebugMonitor

	THUMB_FUNC_END sub_80481E0

	.align 2, 0
