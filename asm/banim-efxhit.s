	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	THUMB_FUNC_START sub_806C14C
sub_806C14C: @ 0x0806C14C
	adds r0, #0x4c
	movs r1, #0
	strh r1, [r0]
	bx lr

	THUMB_FUNC_END sub_806C14C

	THUMB_FUNC_START sub_806C154
sub_806C154: @ 0x0806C154
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r2, _0806C1A4  @ gEkrBgPalBackupMaybe
	movs r1, #0
	adds r6, r2, #0
	adds r4, r5, #0
	adds r4, #0x4c
	ldr r3, _0806C1A8  @ 0x00007FFF
	adds r0, r3, #0
_0806C166:
	adds r2, #2
	adds r3, r1, #1
	movs r1, #0xe
_0806C16C:
	strh r0, [r2]
	adds r2, #2
	subs r1, #1
	cmp r1, #0
	bge _0806C16C
	adds r1, r3, #0
	cmp r1, #0x1f
	ble _0806C166
	movs r1, #0xa0
	lsls r1, r1, #0x13
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r6, #0
	bl CpuFastSet
	bl DisablePaletteSync
	ldrh r1, [r4]
	movs r2, #0
	ldrsh r0, [r4, r2]
	cmp r0, #8
	bne _0806C1AC
	movs r0, #0
	strh r0, [r4]
	adds r0, r5, #0
	bl Proc_Break
	b _0806C1B0
	.align 2, 0
_0806C1A4: .4byte gEkrBgPalBackupMaybe
_0806C1A8: .4byte 0x00007FFF
_0806C1AC:
	adds r0, r1, #1
	strh r0, [r4]
_0806C1B0:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_806C154

	THUMB_FUNC_START sub_806C1B8
sub_806C1B8: @ 0x0806C1B8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	ldr r5, _0806C1DC  @ gPaletteBuffer
	ldr r4, _0806C1E0  @ gEkrBgPalBackupMaybe
	ldrh r0, [r5]
	strh r0, [r4]
	movs r7, #0
_0806C1CA:
	subs r0, r7, #1
	cmp r0, #0x1d
	bhi _0806C276
	lsls r0, r0, #2
	ldr r1, _0806C1E4  @ _0806C1E8
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0806C1DC: .4byte gPaletteBuffer
_0806C1E0: .4byte gEkrBgPalBackupMaybe
_0806C1E4: .4byte _0806C1E8
_0806C1E8: @ jump table
	.4byte _0806C260 @ case 0
	.4byte _0806C260 @ case 1
	.4byte _0806C260 @ case 2
	.4byte _0806C276 @ case 3
	.4byte _0806C276 @ case 4
	.4byte _0806C276 @ case 5
	.4byte _0806C276 @ case 6
	.4byte _0806C276 @ case 7
	.4byte _0806C276 @ case 8
	.4byte _0806C276 @ case 9
	.4byte _0806C276 @ case 10
	.4byte _0806C276 @ case 11
	.4byte _0806C276 @ case 12
	.4byte _0806C276 @ case 13
	.4byte _0806C276 @ case 14
	.4byte _0806C260 @ case 15
	.4byte _0806C276 @ case 16
	.4byte _0806C276 @ case 17
	.4byte _0806C276 @ case 18
	.4byte _0806C276 @ case 19
	.4byte _0806C260 @ case 20
	.4byte _0806C260 @ case 21
	.4byte _0806C276 @ case 22
	.4byte _0806C276 @ case 23
	.4byte _0806C276 @ case 24
	.4byte _0806C276 @ case 25
	.4byte _0806C260 @ case 26
	.4byte _0806C260 @ case 27
	.4byte _0806C260 @ case 28
	.4byte _0806C260 @ case 29
_0806C260:
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #8
	bl CpuFastSet
	adds r5, #0x20
	adds r4, #0x20
	adds r1, r7, #1
	mov r6, r8
	adds r6, #0x4c
	b _0806C290
_0806C276:
	adds r5, #2
	adds r4, #2
	adds r1, r7, #1
	mov r6, r8
	adds r6, #0x4c
	movs r2, #0
	movs r0, #0xe
_0806C284:
	strh r2, [r4]
	adds r5, #2
	adds r4, #2
	subs r0, #1
	cmp r0, #0
	bge _0806C284
_0806C290:
	adds r7, r1, #0
	cmp r7, #0x1f
	ble _0806C1CA
	ldr r0, _0806C2C0  @ gEkrBgPalBackupMaybe
	movs r1, #0xa0
	lsls r1, r1, #0x13
	movs r2, #0x80
	lsls r2, r2, #1
	bl CpuFastSet
	bl DisablePaletteSync
	ldrh r1, [r6]
	movs r2, #0
	ldrsh r0, [r6, r2]
	cmp r0, #0x12
	bne _0806C2C4
	movs r0, #0
	strh r0, [r6]
	mov r0, r8
	bl Proc_Break
	b _0806C2C8
	.align 2, 0
_0806C2C0: .4byte gEkrBgPalBackupMaybe
_0806C2C4:
	adds r0, r1, #1
	strh r0, [r6]
_0806C2C8:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_806C1B8

	THUMB_FUNC_START sub_806C2D4
sub_806C2D4: @ 0x0806C2D4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	str r0, [sp, #4]
	ldr r6, _0806C314  @ gPaletteBuffer
	ldr r5, _0806C318  @ gEkrBgPalBackupMaybe
	adds r0, #0x4c
	movs r1, #0
	ldrsh r3, [r0, r1]
	movs r0, #0x12
	str r0, [sp]
	movs r0, #0
	movs r1, #0x10
	movs r2, #0
	bl Interpolate
	str r0, [sp, #8]
	ldrh r0, [r6]
	strh r0, [r5]
	movs r4, #0
_0806C302:
	subs r0, r4, #1
	cmp r0, #0x1d
	bhi _0806C3B2
	lsls r0, r0, #2
	ldr r1, _0806C31C  @ _0806C320
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0806C314: .4byte gPaletteBuffer
_0806C318: .4byte gEkrBgPalBackupMaybe
_0806C31C: .4byte _0806C320
_0806C320: @ jump table
	.4byte _0806C398 @ case 0
	.4byte _0806C398 @ case 1
	.4byte _0806C398 @ case 2
	.4byte _0806C3B2 @ case 3
	.4byte _0806C3B2 @ case 4
	.4byte _0806C3B2 @ case 5
	.4byte _0806C3B2 @ case 6
	.4byte _0806C3B2 @ case 7
	.4byte _0806C3B2 @ case 8
	.4byte _0806C3B2 @ case 9
	.4byte _0806C3B2 @ case 10
	.4byte _0806C3B2 @ case 11
	.4byte _0806C3B2 @ case 12
	.4byte _0806C3B2 @ case 13
	.4byte _0806C3B2 @ case 14
	.4byte _0806C398 @ case 15
	.4byte _0806C3B2 @ case 16
	.4byte _0806C3B2 @ case 17
	.4byte _0806C3B2 @ case 18
	.4byte _0806C3B2 @ case 19
	.4byte _0806C398 @ case 20
	.4byte _0806C398 @ case 21
	.4byte _0806C3B2 @ case 22
	.4byte _0806C3B2 @ case 23
	.4byte _0806C3B2 @ case 24
	.4byte _0806C3B2 @ case 25
	.4byte _0806C398 @ case 26
	.4byte _0806C398 @ case 27
	.4byte _0806C398 @ case 28
	.4byte _0806C398 @ case 29
_0806C398:
	adds r0, r6, #0
	adds r1, r5, #0
	movs r2, #8
	bl CpuFastSet
	adds r6, #0x20
	adds r5, #0x20
	ldr r2, [sp, #4]
	adds r2, #0x4c
	mov r8, r2
	adds r4, #1
	mov sl, r4
	b _0806C416
_0806C3B2:
	adds r6, #2
	adds r5, #2
	ldr r3, [sp, #4]
	adds r3, #0x4c
	mov r8, r3
	adds r4, #1
	mov sl, r4
	movs r0, #0x1f
	mov r9, r0
	movs r7, #0x1f
	movs r0, #0x10
	ldr r1, [sp, #8]
	subs r4, r0, r1
	movs r2, #0xe
	mov ip, r2
_0806C3D0:
	ldrh r1, [r6]
	adds r0, r7, #0
	ands r0, r1
	adds r3, r0, #0
	muls r3, r4, r3
	asrs r3, r3, #4
	lsls r1, r1, #0x10
	lsrs r0, r1, #0x15
	mov r2, r9
	ands r0, r2
	adds r2, r0, #0
	muls r2, r4, r2
	asrs r2, r2, #4
	lsrs r1, r1, #0x1a
	mov r0, r9
	ands r1, r0
	adds r0, r1, #0
	muls r0, r4, r0
	asrs r0, r0, #4
	ands r0, r7
	lsls r0, r0, #0xa
	ands r2, r7
	lsls r2, r2, #5
	orrs r0, r2
	ands r3, r7
	orrs r3, r0
	strh r3, [r5]
	adds r6, #2
	adds r5, #2
	movs r1, #1
	negs r1, r1
	add ip, r1
	mov r2, ip
	cmp r2, #0
	bge _0806C3D0
_0806C416:
	mov r4, sl
	cmp r4, #0x1f
	bgt _0806C41E
	b _0806C302
_0806C41E:
	ldr r0, _0806C448  @ gEkrBgPalBackupMaybe
	movs r1, #0xa0
	lsls r1, r1, #0x13
	movs r2, #0x80
	lsls r2, r2, #1
	bl CpuFastSet
	bl DisablePaletteSync
	mov r3, r8
	ldrh r1, [r3]
	movs r2, #0
	ldrsh r0, [r3, r2]
	cmp r0, #0x12
	bne _0806C44C
	movs r0, #0
	strh r0, [r3]
	ldr r0, [sp, #4]
	bl Proc_Break
	b _0806C452
	.align 2, 0
_0806C448: .4byte gEkrBgPalBackupMaybe
_0806C44C:
	adds r0, r1, #1
	mov r3, r8
	strh r0, [r3]
_0806C452:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_806C2D4

	THUMB_FUNC_START sub_806C464
sub_806C464: @ 0x0806C464
	push {lr}
	ldr r0, _0806C474  @ gUnknown_085D8CE4
	movs r1, #0
	bl Proc_Start
	pop {r0}
	bx r0
	.align 2, 0
_0806C474: .4byte gUnknown_085D8CE4

	THUMB_FUNC_END sub_806C464

	THUMB_FUNC_START sub_806C478
sub_806C478: @ 0x0806C478
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	str r0, [sp, #4]
	ldr r6, _0806C4B8  @ gPaletteBuffer
	ldr r5, _0806C4BC  @ gEkrBgPalBackupMaybe
	adds r0, #0x4c
	movs r1, #0
	ldrsh r3, [r0, r1]
	movs r0, #8
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0x10
	bl Interpolate
	str r0, [sp, #8]
	ldrh r0, [r6]
	strh r0, [r5]
	movs r4, #0
_0806C4A6:
	subs r0, r4, #1
	cmp r0, #0x1d
	bhi _0806C556
	lsls r0, r0, #2
	ldr r1, _0806C4C0  @ _0806C4C4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0806C4B8: .4byte gPaletteBuffer
_0806C4BC: .4byte gEkrBgPalBackupMaybe
_0806C4C0: .4byte _0806C4C4
_0806C4C4: @ jump table
	.4byte _0806C53C @ case 0
	.4byte _0806C53C @ case 1
	.4byte _0806C53C @ case 2
	.4byte _0806C556 @ case 3
	.4byte _0806C556 @ case 4
	.4byte _0806C556 @ case 5
	.4byte _0806C556 @ case 6
	.4byte _0806C556 @ case 7
	.4byte _0806C556 @ case 8
	.4byte _0806C556 @ case 9
	.4byte _0806C556 @ case 10
	.4byte _0806C556 @ case 11
	.4byte _0806C556 @ case 12
	.4byte _0806C556 @ case 13
	.4byte _0806C556 @ case 14
	.4byte _0806C53C @ case 15
	.4byte _0806C556 @ case 16
	.4byte _0806C556 @ case 17
	.4byte _0806C556 @ case 18
	.4byte _0806C556 @ case 19
	.4byte _0806C53C @ case 20
	.4byte _0806C53C @ case 21
	.4byte _0806C556 @ case 22
	.4byte _0806C556 @ case 23
	.4byte _0806C556 @ case 24
	.4byte _0806C556 @ case 25
	.4byte _0806C53C @ case 26
	.4byte _0806C53C @ case 27
	.4byte _0806C53C @ case 28
	.4byte _0806C53C @ case 29
_0806C53C:
	adds r0, r6, #0
	adds r1, r5, #0
	movs r2, #8
	bl CpuFastSet
	adds r6, #0x20
	adds r5, #0x20
	ldr r2, [sp, #4]
	adds r2, #0x4c
	mov r8, r2
	adds r4, #1
	mov sl, r4
	b _0806C5BA
_0806C556:
	adds r6, #2
	adds r5, #2
	ldr r3, [sp, #4]
	adds r3, #0x4c
	mov r8, r3
	adds r4, #1
	mov sl, r4
	movs r0, #0x1f
	mov r9, r0
	movs r7, #0x1f
	movs r0, #0x10
	ldr r1, [sp, #8]
	subs r4, r0, r1
	movs r2, #0xe
	mov ip, r2
_0806C574:
	ldrh r1, [r6]
	adds r0, r7, #0
	ands r0, r1
	adds r3, r0, #0
	muls r3, r4, r3
	asrs r3, r3, #4
	lsls r1, r1, #0x10
	lsrs r0, r1, #0x15
	mov r2, r9
	ands r0, r2
	adds r2, r0, #0
	muls r2, r4, r2
	asrs r2, r2, #4
	lsrs r1, r1, #0x1a
	mov r0, r9
	ands r1, r0
	adds r0, r1, #0
	muls r0, r4, r0
	asrs r0, r0, #4
	ands r0, r7
	lsls r0, r0, #0xa
	ands r2, r7
	lsls r2, r2, #5
	orrs r0, r2
	ands r3, r7
	orrs r3, r0
	strh r3, [r5]
	adds r6, #2
	adds r5, #2
	movs r1, #1
	negs r1, r1
	add ip, r1
	mov r2, ip
	cmp r2, #0
	bge _0806C574
_0806C5BA:
	mov r4, sl
	cmp r4, #0x1f
	bgt _0806C5C2
	b _0806C4A6
_0806C5C2:
	ldr r0, _0806C5EC  @ gEkrBgPalBackupMaybe
	movs r1, #0xa0
	lsls r1, r1, #0x13
	movs r2, #0x80
	lsls r2, r2, #1
	bl CpuFastSet
	bl DisablePaletteSync
	mov r3, r8
	ldrh r1, [r3]
	movs r2, #0
	ldrsh r0, [r3, r2]
	cmp r0, #8
	bne _0806C5F0
	movs r0, #0
	strh r0, [r3]
	ldr r0, [sp, #4]
	bl Proc_Break
	b _0806C5F6
	.align 2, 0
_0806C5EC: .4byte gEkrBgPalBackupMaybe
_0806C5F0:
	adds r0, r1, #1
	mov r3, r8
	strh r0, [r3]
_0806C5F6:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_806C478

	THUMB_FUNC_START sub_806C608
sub_806C608: @ 0x0806C608
	push {lr}
	ldr r0, _0806C618  @ gUnknown_085D8D14
	movs r1, #0
	bl Proc_Start
	pop {r0}
	bx r0
	.align 2, 0
_0806C618: .4byte gUnknown_085D8D14

	THUMB_FUNC_END sub_806C608

	THUMB_FUNC_START NewEfxDamageMojiEffect
NewEfxDamageMojiEffect: @ 0x0806C61C
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _0806C644  @ ProcScr_efxDamageMojiEffect
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	adds r0, #0x29
	strb r5, [r0]
	ldr r0, _0806C648  @ gUnknown_085BA0B8
	ldr r1, _0806C64C  @ 0x06012000
	bl LZ77UnCompVram
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806C644: .4byte ProcScr_efxDamageMojiEffect
_0806C648: .4byte gUnknown_085BA0B8
_0806C64C: .4byte 0x06012000

	THUMB_FUNC_END NewEfxDamageMojiEffect

	THUMB_FUNC_START efxDamageMojiEffectMain
efxDamageMojiEffectMain: @ 0x0806C650
	push {lr}
	adds r1, r0, #0
	ldrh r0, [r1, #0x2c]
	adds r0, #1
	strh r0, [r1, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _0806C66E
	ldr r0, [r1, #0x5c]
	adds r1, #0x29
	ldrb r1, [r1]
	bl sub_806C67C
	b _0806C678
_0806C66E:
	cmp r0, #0xa
	bne _0806C678
	adds r0, r1, #0
	bl Proc_Break
_0806C678:
	pop {r0}
	bx r0

	THUMB_FUNC_END efxDamageMojiEffectMain

	THUMB_FUNC_START sub_806C67C
sub_806C67C: @ 0x0806C67C
	push {r4, r5, r6, lr}
	sub sp, #0xc
	adds r5, r0, #0
	adds r4, r1, #0
	ldr r0, _0806C6A0  @ ProcScr_efxDamageMojiEffectOBJ
	movs r1, #3
	bl Proc_Start
	adds r6, r0, #0
	str r5, [r6, #0x5c]
	movs r0, #0
	strh r0, [r6, #0x2c]
	cmp r4, #0
	bne _0806C6A8
	movs r0, #0x32
	strh r0, [r6, #0x2e]
	ldr r4, _0806C6A4  @ gUnknown_085C81A4
	b _0806C6AE
	.align 2, 0
_0806C6A0: .4byte ProcScr_efxDamageMojiEffectOBJ
_0806C6A4: .4byte gUnknown_085C81A4
_0806C6A8:
	movs r0, #0x32
	strh r0, [r6, #0x2e]
	ldr r4, _0806C6E8  @ gUnknown_085C8218
_0806C6AE:
	adds r0, r5, #0
	bl GetAISSubjectId
	movs r2, #0xa2
	lsls r2, r2, #7
	cmp r0, #0
	bne _0806C6C0
	movs r2, #0xc2
	lsls r2, r2, #7
_0806C6C0:
	movs r1, #2
	ldrsh r0, [r5, r1]
	movs r3, #4
	ldrsh r1, [r5, r3]
	subs r1, #0x28
	str r2, [sp]
	movs r2, #0
	str r2, [sp, #4]
	movs r2, #3
	str r2, [sp, #8]
	adds r2, r4, #0
	movs r3, #2
	bl NewEkrsubAnimeEmulator
	str r0, [r6, #0x60]
	add sp, #0xc
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806C6E8: .4byte gUnknown_085C8218

	THUMB_FUNC_END sub_806C67C

	THUMB_FUNC_START efxDamageMojiEffectOBJMain
efxDamageMojiEffectOBJMain: @ 0x0806C6EC
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x60]
	ldr r0, [r4, #0x5c]
	ldrh r0, [r0, #2]
	strh r0, [r1, #0x32]
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x2e
	ldrsh r1, [r4, r2]
	cmp r0, r1
	ble _0806C716
	ldr r0, [r4, #0x60]
	bl Proc_End
	adds r0, r4, #0
	bl Proc_Break
_0806C716:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END efxDamageMojiEffectOBJMain

	THUMB_FUNC_START NewEfxPierceCritical
NewEfxPierceCritical: @ 0x0806C71C
	push {r4, r5, lr}
	adds r5, r0, #0
	bl GetCoreAIStruct
	adds r4, r0, #0
	bl GetAISSubjectId
	adds r1, r0, #0
	ldrh r0, [r4, #0xe]
	subs r0, #1
	lsls r0, r0, #1
	adds r0, r0, r1
	bl GetAnimRoundType
	movs r1, #0x80
	lsls r1, r1, #2
	ands r1, r0
	lsls r1, r1, #0x10
	asrs r4, r1, #0x10
	cmp r4, #0
	beq _0806C74E
	adds r0, r5, #0
	bl NewEfxPierceCriticalEffect
	b _0806C75E
_0806C74E:
	bl ClearBG1Setup
	ldr r0, _0806C764  @ ProcScr_efxCriricalEffect
	movs r1, #3
	bl Proc_Start
	str r5, [r0, #0x5c]
	strh r4, [r0, #0x2c]
_0806C75E:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806C764: .4byte ProcScr_efxCriricalEffect

	THUMB_FUNC_END NewEfxPierceCritical

	THUMB_FUNC_START efxCriricalEffectMain
efxCriricalEffectMain: @ 0x0806C768
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _0806C788
	ldr r0, [r4, #0x5c]
	bl sub_806C798
	ldr r0, [r4, #0x5c]
	bl sub_806C810
	b _0806C792
_0806C788:
	cmp r0, #0x11
	bne _0806C792
	adds r0, r4, #0
	bl Proc_Break
_0806C792:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END efxCriricalEffectMain

	THUMB_FUNC_START sub_806C798
sub_806C798: @ 0x0806C798
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _0806C7D4  @ ProcScr_efxCriricalEffectBG
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	ldr r0, _0806C7D8  @ gUnknown_085E7028
	movs r1, #0x80
	lsls r1, r1, #6
	bl SomeImageStoringRoutine_SpellAnim2
	ldr r0, _0806C7DC  @ gUnknown_085E8108
	movs r1, #0x20
	bl SomePaletteStoringRoutine_SpellAnim2
	ldr r0, [r4, #0x5c]
	ldr r1, _0806C7E0  @ gUnknown_085E8308
	ldr r2, _0806C7E4  @ gUnknown_085E87A8
	bl sub_8055670
	bl sub_80551B0
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806C7D4: .4byte ProcScr_efxCriricalEffectBG
_0806C7D8: .4byte gUnknown_085E7028
_0806C7DC: .4byte gUnknown_085E8108
_0806C7E0: .4byte gUnknown_085E8308
_0806C7E4: .4byte gUnknown_085E87A8

	THUMB_FUNC_END sub_806C798

	THUMB_FUNC_START efxCriricalEffectBGMain
efxCriricalEffectBGMain: @ 0x0806C7E8
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x11
	bne _0806C808
	bl ClearBG1
	bl SetDefaultColorEffects_
	adds r0, r4, #0
	bl Proc_Break
_0806C808:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END efxCriricalEffectBGMain

	THUMB_FUNC_START sub_806C810
sub_806C810: @ 0x0806C810
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0806C834  @ ProcScr_efxCriricalEffectBGCOL
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r1, [r0, #0x44]
	ldr r1, _0806C838  @ gUnknown_080DF188
	str r1, [r0, #0x48]
	ldr r1, _0806C83C  @ gUnknown_085E8108
	str r1, [r0, #0x4c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806C834: .4byte ProcScr_efxCriricalEffectBGCOL
_0806C838: .4byte gUnknown_080DF188
_0806C83C: .4byte gUnknown_085E8108

	THUMB_FUNC_END sub_806C810

	THUMB_FUNC_START efxCriricalEffectBGCOLMain
efxCriricalEffectBGCOLMain: @ 0x0806C840
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl sub_80558F4
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	cmp r1, #0
	blt _0806C866
	ldr r0, [r4, #0x4c]
	lsls r1, r1, #5
	adds r0, r0, r1
	movs r1, #0x20
	bl SomePaletteStoringRoutine_SpellAnim2
	b _0806C874
_0806C866:
	movs r0, #1
	negs r0, r0
	cmp r1, r0
	bne _0806C874
	adds r0, r4, #0
	bl Proc_Break
_0806C874:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END efxCriricalEffectBGCOLMain

	THUMB_FUNC_START NewEfxNormalEffect
NewEfxNormalEffect: @ 0x0806C87C
	push {r4, r5, lr}
	adds r4, r0, #0
	bl ClearBG1Setup
	adds r0, r4, #0
	bl GetAISSubjectId
	adds r1, r0, #0
	ldrh r0, [r4, #0xe]
	subs r0, #1
	lsls r0, r0, #1
	adds r0, r0, r1
	bl GetAnimRoundType
	movs r1, #0x80
	lsls r1, r1, #2
	ands r1, r0
	lsls r1, r1, #0x10
	asrs r5, r1, #0x10
	cmp r5, #0
	beq _0806C8AE
	adds r0, r4, #0
	bl sub_806CB1C
	b _0806C8BA
_0806C8AE:
	ldr r0, _0806C8C0  @ ProcScr_efxNormalEffect
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	strh r5, [r0, #0x2c]
_0806C8BA:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806C8C0: .4byte ProcScr_efxNormalEffect

	THUMB_FUNC_END NewEfxNormalEffect

	THUMB_FUNC_START efxNormalEffectMain
efxNormalEffectMain: @ 0x0806C8C4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetCoreAIStruct
	adds r1, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _0806C8E8
	ldr r0, [r4, #0x5c]
	movs r1, #4
	bl StartSpellBG_FLASH
	b _0806C8FE
_0806C8E8:
	cmp r0, #4
	bne _0806C8F4
	adds r0, r1, #0
	bl sub_806C904
	b _0806C8FE
_0806C8F4:
	cmp r0, #0x18
	bne _0806C8FE
	adds r0, r4, #0
	bl Proc_Break
_0806C8FE:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END efxNormalEffectMain

	THUMB_FUNC_START sub_806C904
sub_806C904: @ 0x0806C904
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r1, _0806C964  @ gUnknown_0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0806C968  @ ProcScr_efxNormalEffectBG
	movs r1, #3
	bl Proc_Start
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	str r0, [r5, #0x44]
	ldr r0, _0806C96C  @ gUnknown_080DF1EE
	str r0, [r5, #0x48]
	ldr r0, _0806C970  @ gUnknown_085D8DF4
	str r0, [r5, #0x4c]
	str r0, [r5, #0x50]
	ldr r0, _0806C974  @ gUnknown_085E9150
	movs r1, #0x20
	bl SomePaletteStoringRoutine_SpellAnim2
	ldr r0, _0806C978  @ gUnknown_085E8D88
	movs r1, #0x80
	lsls r1, r1, #6
	bl SomeImageStoringRoutine_SpellAnim2
	bl sub_80551B0
	ldr r0, _0806C97C  @ gEkrDistanceType
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _0806C98A
	ldr r0, [r5, #0x5c]
	bl GetAISSubjectId
	cmp r0, #0
	bne _0806C980
	movs r0, #1
	movs r1, #0x18
	movs r2, #0
	bl BG_SetPosition
	b _0806C98A
	.align 2, 0
_0806C964: .4byte gUnknown_0201774C
_0806C968: .4byte ProcScr_efxNormalEffectBG
_0806C96C: .4byte gUnknown_080DF1EE
_0806C970: .4byte gUnknown_085D8DF4
_0806C974: .4byte gUnknown_085E9150
_0806C978: .4byte gUnknown_085E8D88
_0806C97C: .4byte gEkrDistanceType
_0806C980:
	movs r0, #1
	movs r1, #0xe8
	movs r2, #0
	bl BG_SetPosition
_0806C98A:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_806C904

	THUMB_FUNC_START efxNormalEffectBGMain
efxNormalEffectBGMain: @ 0x0806C990
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
	blt _0806C9BE
	ldr r1, [r4, #0x4c]
	ldr r3, [r4, #0x50]
	ldr r0, [r4, #0x5c]
	lsls r2, r2, #2
	adds r1, r2, r1
	ldr r1, [r1]
	adds r2, r2, r3
	ldr r2, [r2]
	bl sub_8055670
	b _0806C9DC
_0806C9BE:
	movs r0, #1
	negs r0, r0
	cmp r2, r0
	bne _0806C9DC
	bl ClearBG1
	ldr r1, _0806C9E4  @ gUnknown_0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SetDefaultColorEffects_
	adds r0, r4, #0
	bl Proc_Break
_0806C9DC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806C9E4: .4byte gUnknown_0201774C

	THUMB_FUNC_END efxNormalEffectBGMain

	THUMB_FUNC_START NewEfxPierceCriticalEffect
NewEfxPierceCriticalEffect: @ 0x0806C9E8
	push {r4, lr}
	adds r4, r0, #0
	bl ClearBG1Setup
	ldr r0, _0806CA04  @ ProcScr_efxPierceCriticalEffect
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806CA04: .4byte ProcScr_efxPierceCriticalEffect

	THUMB_FUNC_END NewEfxPierceCriticalEffect

	THUMB_FUNC_START efxPierceCriticalEffectMain
efxPierceCriticalEffectMain: @ 0x0806CA08
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _0806CA28
	ldr r0, [r4, #0x5c]
	bl sub_806CA38
	ldr r0, [r4, #0x5c]
	bl sub_806CAB0
	b _0806CA32
_0806CA28:
	cmp r0, #0x11
	bne _0806CA32
	adds r0, r4, #0
	bl Proc_Break
_0806CA32:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END efxPierceCriticalEffectMain

	THUMB_FUNC_START sub_806CA38
sub_806CA38: @ 0x0806CA38
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _0806CA74  @ ProcScr_efxPierceCriticalEffectBG
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	ldr r0, _0806CA78  @ gUnknown_085CFB70
	movs r1, #0x80
	lsls r1, r1, #6
	bl SomeImageStoringRoutine_SpellAnim2
	ldr r0, _0806CA7C  @ gUnknown_085D0820
	movs r1, #0x20
	bl SomePaletteStoringRoutine_SpellAnim2
	ldr r0, [r4, #0x5c]
	ldr r1, _0806CA80  @ gUnknown_085D0A20
	ldr r2, _0806CA84  @ gUnknown_085D0CE0
	bl sub_8055670
	bl sub_80551B0
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806CA74: .4byte ProcScr_efxPierceCriticalEffectBG
_0806CA78: .4byte gUnknown_085CFB70
_0806CA7C: .4byte gUnknown_085D0820
_0806CA80: .4byte gUnknown_085D0A20
_0806CA84: .4byte gUnknown_085D0CE0

	THUMB_FUNC_END sub_806CA38

	THUMB_FUNC_START efxPierceCriticalEffectBGMain
efxPierceCriticalEffectBGMain: @ 0x0806CA88
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x11
	bne _0806CAA8
	bl ClearBG1
	bl SetDefaultColorEffects_
	adds r0, r4, #0
	bl Proc_Break
_0806CAA8:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END efxPierceCriticalEffectBGMain

	THUMB_FUNC_START sub_806CAB0
sub_806CAB0: @ 0x0806CAB0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0806CAD4  @ ProcScr_efxPierceCriticalEffectBGCOL
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r1, [r0, #0x44]
	ldr r1, _0806CAD8  @ gUnknown_080DF26A
	str r1, [r0, #0x48]
	ldr r1, _0806CADC  @ gUnknown_085D0820
	str r1, [r0, #0x4c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806CAD4: .4byte ProcScr_efxPierceCriticalEffectBGCOL
_0806CAD8: .4byte gUnknown_080DF26A
_0806CADC: .4byte gUnknown_085D0820

	THUMB_FUNC_END sub_806CAB0

	THUMB_FUNC_START efxPierceCriticalEffectBGCOLMain
efxPierceCriticalEffectBGCOLMain: @ 0x0806CAE0
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl sub_80558F4
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	cmp r1, #0
	blt _0806CB06
	ldr r0, [r4, #0x4c]
	lsls r1, r1, #5
	adds r0, r0, r1
	movs r1, #0x20
	bl SomePaletteStoringRoutine_SpellAnim2
	b _0806CB14
_0806CB06:
	movs r0, #1
	negs r0, r0
	cmp r1, r0
	bne _0806CB14
	adds r0, r4, #0
	bl Proc_Break
_0806CB14:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END efxPierceCriticalEffectBGCOLMain

	THUMB_FUNC_START sub_806CB1C
sub_806CB1C: @ 0x0806CB1C
	push {r4, lr}
	adds r4, r0, #0
	bl ClearBG1Setup
	ldr r0, _0806CB38  @ ProcScr_efxPierceNormalEffect
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806CB38: .4byte ProcScr_efxPierceNormalEffect

	THUMB_FUNC_END sub_806CB1C

	THUMB_FUNC_START efxPierceNormalEffectMain
efxPierceNormalEffectMain: @ 0x0806CB3C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetCoreAIStruct
	adds r1, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _0806CB60
	ldr r0, [r4, #0x5c]
	movs r1, #4
	bl StartSpellBG_FLASH
	b _0806CB76
_0806CB60:
	cmp r0, #4
	bne _0806CB6C
	adds r0, r1, #0
	bl sub_806CB7C
	b _0806CB76
_0806CB6C:
	cmp r0, #0x18
	bne _0806CB76
	adds r0, r4, #0
	bl Proc_Break
_0806CB76:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END efxPierceNormalEffectMain

	THUMB_FUNC_START sub_806CB7C
sub_806CB7C: @ 0x0806CB7C
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r1, _0806CBDC  @ gUnknown_0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0806CBE0  @ ProcScr_efxPierceNormalEffectBG
	movs r1, #3
	bl Proc_Start
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	str r0, [r5, #0x44]
	ldr r0, _0806CBE4  @ gUnknown_080DF2DC
	str r0, [r5, #0x48]
	ldr r0, _0806CBE8  @ gUnknown_085D8E9C
	str r0, [r5, #0x4c]
	str r0, [r5, #0x50]
	ldr r0, _0806CBEC  @ gUnknown_085D1470
	movs r1, #0x20
	bl SomePaletteStoringRoutine_SpellAnim2
	ldr r0, _0806CBF0  @ gUnknown_085D0FD0
	movs r1, #0x80
	lsls r1, r1, #6
	bl SomeImageStoringRoutine_SpellAnim2
	bl sub_80551B0
	ldr r0, _0806CBF4  @ gEkrDistanceType
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _0806CC02
	ldr r0, [r5, #0x5c]
	bl GetAISSubjectId
	cmp r0, #0
	bne _0806CBF8
	movs r0, #1
	movs r1, #0x18
	movs r2, #0
	bl BG_SetPosition
	b _0806CC02
	.align 2, 0
_0806CBDC: .4byte gUnknown_0201774C
_0806CBE0: .4byte ProcScr_efxPierceNormalEffectBG
_0806CBE4: .4byte gUnknown_080DF2DC
_0806CBE8: .4byte gUnknown_085D8E9C
_0806CBEC: .4byte gUnknown_085D1470
_0806CBF0: .4byte gUnknown_085D0FD0
_0806CBF4: .4byte gEkrDistanceType
_0806CBF8:
	movs r0, #1
	movs r1, #0xe8
	movs r2, #0
	bl BG_SetPosition
_0806CC02:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_806CB7C

	THUMB_FUNC_START efxPierceNormalEffectBGMain
efxPierceNormalEffectBGMain: @ 0x0806CC08
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
	blt _0806CC36
	ldr r1, [r4, #0x4c]
	ldr r3, [r4, #0x50]
	ldr r0, [r4, #0x5c]
	lsls r2, r2, #2
	adds r1, r2, r1
	ldr r1, [r1]
	adds r2, r2, r3
	ldr r2, [r2]
	bl sub_8055670
	b _0806CC54
_0806CC36:
	movs r0, #1
	negs r0, r0
	cmp r2, r0
	bne _0806CC54
	bl ClearBG1
	ldr r1, _0806CC5C  @ gUnknown_0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SetDefaultColorEffects_
	adds r0, r4, #0
	bl Proc_Break
_0806CC54:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806CC5C: .4byte gUnknown_0201774C

	THUMB_FUNC_END efxPierceNormalEffectBGMain

	THUMB_FUNC_START NewEfxYushaSpinShield
NewEfxYushaSpinShield: @ 0x0806CC60
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _0806CC84  @ ProcScr_efxYushaSpinShield
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_806CC94
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806CC84: .4byte ProcScr_efxYushaSpinShield

	THUMB_FUNC_END NewEfxYushaSpinShield

	THUMB_FUNC_START EfxYushaSpinShieldMain
EfxYushaSpinShieldMain: @ 0x0806CC88
	push {lr}
	bl Proc_Break
	pop {r0}
	bx r0

	THUMB_FUNC_END EfxYushaSpinShieldMain

	THUMB_FUNC_START sub_806CC94
sub_806CC94: @ 0x0806CC94
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	adds r4, r1, #0
	ldr r0, _0806CCBC  @ ProcScr_efxYushaSpinShieldOBJ
	movs r1, #3
	bl Proc_Start
	adds r5, r0, #0
	str r6, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	adds r0, r5, #0
	adds r0, #0x29
	strb r4, [r0]
	cmp r4, #0
	bne _0806CCC8
	ldr r2, _0806CCC0  @ gUnknown_085EAB58
	ldr r3, _0806CCC4  @ gUnknown_085EBDF8
	b _0806CCCC
	.align 2, 0
_0806CCBC: .4byte ProcScr_efxYushaSpinShieldOBJ
_0806CCC0: .4byte gUnknown_085EAB58
_0806CCC4: .4byte gUnknown_085EBDF8
_0806CCC8:
	ldr r2, _0806CCF8  @ gUnknown_085ED0C8
	ldr r3, _0806CCFC  @ gUnknown_085EE398
_0806CCCC:
	str r2, [sp]
	adds r0, r6, #0
	adds r1, r3, #0
	bl EfxAnimCreate
	adds r4, r0, #0
	str r4, [r5, #0x60]
	ldrh r0, [r4, #8]
	movs r1, #0xc0
	lsls r1, r1, #4
	ands r1, r0
	movs r5, #0
	strh r1, [r4, #8]
	adds r0, r6, #0
	bl GetAISSubjectId
	cmp r0, #0
	bne _0806CD00
	ldrh r0, [r4, #8]
	movs r2, #0xe4
	lsls r2, r2, #7
	b _0806CD06
	.align 2, 0
_0806CCF8: .4byte gUnknown_085ED0C8
_0806CCFC: .4byte gUnknown_085EE398
_0806CD00:
	ldrh r0, [r4, #8]
	movs r2, #0x93
	lsls r2, r2, #8
_0806CD06:
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r4, #8]
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_806CC94

	THUMB_FUNC_START efxYushaSpinShieldOBJ_806CD14
efxYushaSpinShieldOBJ_806CD14: @ 0x0806CD14
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, [r5, #0x60]
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x45
	bne _0806CD72
	adds r0, r5, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #0
	bne _0806CD4C
	ldr r0, [r5, #0x5c]
	bl GetAISSubjectId
	cmp r0, #0
	bne _0806CD44
	ldr r0, _0806CD40  @ gUnknown_085EBEFC
	b _0806CD62
	.align 2, 0
_0806CD40: .4byte gUnknown_085EBEFC
_0806CD44:
	ldr r0, _0806CD48  @ gUnknown_085EAC5C
	b _0806CD62
	.align 2, 0
_0806CD48: .4byte gUnknown_085EAC5C
_0806CD4C:
	ldr r0, [r5, #0x5c]
	bl GetAISSubjectId
	cmp r0, #0
	bne _0806CD60
	ldr r0, _0806CD5C  @ gUnknown_085EE49C
	b _0806CD62
	.align 2, 0
_0806CD5C: .4byte gUnknown_085EE49C
_0806CD60:
	ldr r0, _0806CD78  @ gUnknown_085ED1CC
_0806CD62:
	str r0, [r4, #0x24]
	str r0, [r4, #0x20]
	movs r0, #0
	strh r0, [r4, #6]
	strh r0, [r5, #0x2c]
	adds r0, r5, #0
	bl Proc_Break
_0806CD72:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806CD78: .4byte gUnknown_085ED1CC

	THUMB_FUNC_END efxYushaSpinShieldOBJ_806CD14

	THUMB_FUNC_START efxYushaSpinShieldOBJ_806CD7C
efxYushaSpinShieldOBJ_806CD7C: @ 0x0806CD7C
	push {lr}
	adds r1, r0, #0
	ldr r0, [r1, #0x5c]
	ldrh r2, [r0, #0x10]
	movs r0, #4
	ands r0, r2
	cmp r0, #0
	beq _0806CD9E
	movs r0, #8
	ands r0, r2
	cmp r0, #0
	beq _0806CD9E
	movs r0, #0
	strh r0, [r1, #0x2c]
	adds r0, r1, #0
	bl Proc_Break
_0806CD9E:
	pop {r0}
	bx r0

	THUMB_FUNC_END efxYushaSpinShieldOBJ_806CD7C

	THUMB_FUNC_START efxYushaSpinShieldOBJ_806CDA4
efxYushaSpinShieldOBJ_806CDA4: @ 0x0806CDA4
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, [r5, #0x60]
	bl sub_80522CC
	cmp r0, #1
	bne _0806CDFE
	adds r0, r5, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #0
	bne _0806CDD8
	ldr r0, [r5, #0x5c]
	bl GetAISSubjectId
	cmp r0, #0
	bne _0806CDD0
	ldr r0, _0806CDCC  @ gUnknown_085EBF24
	b _0806CDEE
	.align 2, 0
_0806CDCC: .4byte gUnknown_085EBF24
_0806CDD0:
	ldr r0, _0806CDD4  @ gUnknown_085EAC84
	b _0806CDEE
	.align 2, 0
_0806CDD4: .4byte gUnknown_085EAC84
_0806CDD8:
	ldr r0, [r5, #0x5c]
	bl GetAISSubjectId
	cmp r0, #0
	bne _0806CDEC
	ldr r0, _0806CDE8  @ gUnknown_085EE4C4
	b _0806CDEE
	.align 2, 0
_0806CDE8: .4byte gUnknown_085EE4C4
_0806CDEC:
	ldr r0, _0806CE04  @ gUnknown_085ED1F4
_0806CDEE:
	str r0, [r4, #0x24]
	str r0, [r4, #0x20]
	movs r0, #0
	strh r0, [r4, #6]
	strh r0, [r5, #0x2c]
	adds r0, r5, #0
	bl Proc_Break
_0806CDFE:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806CE04: .4byte gUnknown_085ED1F4

	THUMB_FUNC_END efxYushaSpinShieldOBJ_806CDA4

	THUMB_FUNC_START efxYushaSpinShieldOBJ_806CE08
efxYushaSpinShieldOBJ_806CE08: @ 0x0806CE08
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x14
	bne _0806CE2A
	movs r0, #0
	strh r0, [r4, #0x2c]
	ldr r0, [r4, #0x60]
	bl AnimDelete
	adds r0, r4, #0
	bl Proc_Break
_0806CE2A:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END efxYushaSpinShieldOBJ_806CE08

	THUMB_FUNC_START NewEfxHurtmutEff00
NewEfxHurtmutEff00: @ 0x0806CE30
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, _0806CE5C  @ gUnknown_0201774C
	ldr r5, [r0]
	cmp r5, #0
	bne _0806CE6E
	ldr r0, _0806CE60  @ ProcScr_efxHurtmutEff00
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	strh r5, [r0, #0x2c]
	ldr r0, _0806CE64  @ gEkrDistanceType
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _0806CE68
	adds r0, r4, #0
	bl sub_806CE80
	b _0806CE6E
	.align 2, 0
_0806CE5C: .4byte gUnknown_0201774C
_0806CE60: .4byte ProcScr_efxHurtmutEff00
_0806CE64: .4byte gEkrDistanceType
_0806CE68:
	adds r0, r4, #0
	bl sub_806CF80
_0806CE6E:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END NewEfxHurtmutEff00

	THUMB_FUNC_START EfxHurtmutEff00Main
EfxHurtmutEff00Main: @ 0x0806CE74
	push {lr}
	bl Proc_Break
	pop {r0}
	bx r0

	THUMB_FUNC_END EfxHurtmutEff00Main

	THUMB_FUNC_START sub_806CE80
sub_806CE80: @ 0x0806CE80
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r1, _0806CEB8  @ gUnknown_0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0806CEBC  @ ProcScr_efxHurtmutEff00OBJ
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	ldr r3, _0806CEC0  @ FramData_Unk5D4F90
	str r3, [sp]
	adds r0, r5, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl EfxAnimCreate
	str r0, [r4, #0x60]
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806CEB8: .4byte gUnknown_0201774C
_0806CEBC: .4byte ProcScr_efxHurtmutEff00OBJ
_0806CEC0: .4byte FramData_Unk5D4F90

	THUMB_FUNC_END sub_806CE80

	THUMB_FUNC_START efxHurtmutEff00OBJ_806CEC4
efxHurtmutEff00OBJ_806CEC4: @ 0x0806CEC4
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, [r5, #0x60]
	ldr r0, [r5, #0x5c]
	bl GetAISSubjectId
	cmp r0, #1
	bne _0806CEDC
	ldr r0, _0806CED8  @ gUnknown_085E15F4
	b _0806CEDE
	.align 2, 0
_0806CED8: .4byte gUnknown_085E15F4
_0806CEDC:
	ldr r0, _0806CF04  @ gUnknown_085E1960
_0806CEDE:
	str r0, [r4, #0x24]
	str r0, [r4, #0x20]
	movs r0, #0
	strh r0, [r4, #6]
	ldr r0, _0806CF08  @ gUnknown_085DFA08
	movs r1, #0x20
	bl SomePaletteStoringRoutine_SpellAnim
	ldr r0, _0806CF0C  @ gUnknown_085DE984
	movs r1, #0x80
	lsls r1, r1, #5
	bl SomeImageStoringRoutine_SpellAnim
	adds r0, r5, #0
	bl Proc_Break
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806CF04: .4byte gUnknown_085E1960
_0806CF08: .4byte gUnknown_085DFA08
_0806CF0C: .4byte gUnknown_085DE984

	THUMB_FUNC_END efxHurtmutEff00OBJ_806CEC4

	THUMB_FUNC_START efxHurtmutEff00OBJ_806CF10
efxHurtmutEff00OBJ_806CF10: @ 0x0806CF10
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, [r5, #0x60]
	ldr r0, [r5, #0x5c]
	bl GetAISSubjectId
	cmp r0, #1
	bne _0806CF28
	ldr r0, _0806CF24  @ gUnknown_085E1C48
	b _0806CF2A
	.align 2, 0
_0806CF24: .4byte gUnknown_085E1C48
_0806CF28:
	ldr r0, _0806CF50  @ gUnknown_085E1EA4
_0806CF2A:
	str r0, [r4, #0x24]
	str r0, [r4, #0x20]
	movs r0, #0
	strh r0, [r4, #6]
	ldr r0, _0806CF54  @ gUnknown_085DFA08
	movs r1, #0x20
	bl SomePaletteStoringRoutine_SpellAnim
	ldr r0, _0806CF58  @ gUnknown_085DF224
	movs r1, #0x80
	lsls r1, r1, #5
	bl SomeImageStoringRoutine_SpellAnim
	adds r0, r5, #0
	bl Proc_Break
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806CF50: .4byte gUnknown_085E1EA4
_0806CF54: .4byte gUnknown_085DFA08
_0806CF58: .4byte gUnknown_085DF224

	THUMB_FUNC_END efxHurtmutEff00OBJ_806CF10

	THUMB_FUNC_START efxHurtmutEff00OBJ_806CF5C
efxHurtmutEff00OBJ_806CF5C: @ 0x0806CF5C
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _0806CF7C  @ gUnknown_0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	ldr r0, [r4, #0x60]
	bl AnimDelete
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806CF7C: .4byte gUnknown_0201774C

	THUMB_FUNC_END efxHurtmutEff00OBJ_806CF5C

	THUMB_FUNC_START sub_806CF80
sub_806CF80: @ 0x0806CF80
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r1, _0806CFB8  @ gUnknown_0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0806CFBC  @ ProcScr_efxHurtmutEff01OBJ
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	ldr r3, _0806CFC0  @ FramData_Unk5D4F90
	str r3, [sp]
	adds r0, r5, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl EfxAnimCreate
	str r0, [r4, #0x60]
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806CFB8: .4byte gUnknown_0201774C
_0806CFBC: .4byte ProcScr_efxHurtmutEff01OBJ
_0806CFC0: .4byte FramData_Unk5D4F90

	THUMB_FUNC_END sub_806CF80

	THUMB_FUNC_START efxHurtmutEff01OBJ_806CFC4
efxHurtmutEff01OBJ_806CFC4: @ 0x0806CFC4
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, [r5, #0x60]
	ldr r0, [r5, #0x5c]
	bl GetAISSubjectId
	cmp r0, #1
	bne _0806CFDC
	ldr r0, _0806CFD8  @ gUnknown_085E163C
	b _0806CFDE
	.align 2, 0
_0806CFD8: .4byte gUnknown_085E163C
_0806CFDC:
	ldr r0, _0806D004  @ gUnknown_085E19A8
_0806CFDE:
	str r0, [r4, #0x24]
	str r0, [r4, #0x20]
	movs r0, #0
	strh r0, [r4, #6]
	ldr r0, _0806D008  @ gUnknown_085DFA08
	movs r1, #0x20
	bl SomePaletteStoringRoutine_SpellAnim
	ldr r0, _0806D00C  @ gUnknown_085DE984
	movs r1, #0x80
	lsls r1, r1, #5
	bl SomeImageStoringRoutine_SpellAnim
	adds r0, r5, #0
	bl Proc_Break
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806D004: .4byte gUnknown_085E19A8
_0806D008: .4byte gUnknown_085DFA08
_0806D00C: .4byte gUnknown_085DE984

	THUMB_FUNC_END efxHurtmutEff01OBJ_806CFC4

	THUMB_FUNC_START efxHurtmutEff01OBJ_806D010
efxHurtmutEff01OBJ_806D010: @ 0x0806D010
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, [r5, #0x60]
	ldr r0, [r5, #0x5c]
	bl GetAISSubjectId
	cmp r0, #1
	bne _0806D028
	ldr r0, _0806D024  @ gUnknown_085E1C58
	b _0806D02A
	.align 2, 0
_0806D024: .4byte gUnknown_085E1C58
_0806D028:
	ldr r0, _0806D050  @ gUnknown_085E1EB4
_0806D02A:
	str r0, [r4, #0x24]
	str r0, [r4, #0x20]
	movs r0, #0
	strh r0, [r4, #6]
	ldr r0, _0806D054  @ gUnknown_085DFA08
	movs r1, #0x20
	bl SomePaletteStoringRoutine_SpellAnim
	ldr r0, _0806D058  @ gUnknown_085DF224
	movs r1, #0x80
	lsls r1, r1, #5
	bl SomeImageStoringRoutine_SpellAnim
	adds r0, r5, #0
	bl Proc_Break
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806D050: .4byte gUnknown_085E1EB4
_0806D054: .4byte gUnknown_085DFA08
_0806D058: .4byte gUnknown_085DF224

	THUMB_FUNC_END efxHurtmutEff01OBJ_806D010

	THUMB_FUNC_START efxHurtmutEff01OBJ_806D05C
efxHurtmutEff01OBJ_806D05C: @ 0x0806D05C
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _0806D07C  @ gUnknown_0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	ldr r0, [r4, #0x60]
	bl AnimDelete
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806D07C: .4byte gUnknown_0201774C

	THUMB_FUNC_END efxHurtmutEff01OBJ_806D05C

	THUMB_FUNC_START NewEfxMagfcast
NewEfxMagfcast: @ 0x0806D080
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r7, r1, #0
	ldr r0, _0806D0C4  @ gUnknown_0201774C
	ldr r5, [r0]
	cmp r5, #0
	beq _0806D090
	b _0806D192
_0806D090:
	bl ClearBG1Setup
	ldr r0, _0806D0C8  @ ProcScr_efxMagfcast
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	str r6, [r4, #0x5c]
	strh r5, [r4, #0x2c]
	adds r0, r6, #0
	bl GetAISSubjectId
	ldr r1, _0806D0CC  @ gEkrPairBanimID2
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	subs r0, #0x6a
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x2a
	bhi _0806D18A
	lsls r0, r0, #2
	ldr r1, _0806D0D0  @ _0806D0D4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0806D0C4: .4byte gUnknown_0201774C
_0806D0C8: .4byte ProcScr_efxMagfcast
_0806D0CC: .4byte gEkrPairBanimID2
_0806D0D0: .4byte _0806D0D4
_0806D0D4: @ jump table
	.4byte _0806D180 @ case 0
	.4byte _0806D180 @ case 1
	.4byte _0806D18A @ case 2
	.4byte _0806D18A @ case 3
	.4byte _0806D18A @ case 4
	.4byte _0806D18A @ case 5
	.4byte _0806D18A @ case 6
	.4byte _0806D18A @ case 7
	.4byte _0806D18A @ case 8
	.4byte _0806D18A @ case 9
	.4byte _0806D18A @ case 10
	.4byte _0806D18A @ case 11
	.4byte _0806D18A @ case 12
	.4byte _0806D18A @ case 13
	.4byte _0806D18A @ case 14
	.4byte _0806D18A @ case 15
	.4byte _0806D18A @ case 16
	.4byte _0806D18A @ case 17
	.4byte _0806D18A @ case 18
	.4byte _0806D18A @ case 19
	.4byte _0806D18A @ case 20
	.4byte _0806D18A @ case 21
	.4byte _0806D18A @ case 22
	.4byte _0806D18A @ case 23
	.4byte _0806D18A @ case 24
	.4byte _0806D18A @ case 25
	.4byte _0806D18A @ case 26
	.4byte _0806D18A @ case 27
	.4byte _0806D18A @ case 28
	.4byte _0806D18A @ case 29
	.4byte _0806D18A @ case 30
	.4byte _0806D18A @ case 31
	.4byte _0806D18A @ case 32
	.4byte _0806D18A @ case 33
	.4byte _0806D18A @ case 34
	.4byte _0806D18A @ case 35
	.4byte _0806D18A @ case 36
	.4byte _0806D18A @ case 37
	.4byte _0806D18A @ case 38
	.4byte _0806D18A @ case 39
	.4byte _0806D18A @ case 40
	.4byte _0806D18A @ case 41
	.4byte _0806D180 @ case 42
_0806D180:
	ldr r0, [r4, #0x5c]
	adds r1, r7, #0
	bl sub_806D1B4
	b _0806D192
_0806D18A:
	ldr r0, [r4, #0x5c]
	adds r1, r7, #2
	bl sub_806D1B4
_0806D192:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END NewEfxMagfcast

	THUMB_FUNC_START EfxMagfcastMain
EfxMagfcastMain: @ 0x0806D198
	push {lr}
	adds r1, r0, #0
	ldrh r0, [r1, #0x2c]
	adds r0, #1
	strh r0, [r1, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x14
	bne _0806D1B0
	adds r0, r1, #0
	bl Proc_Break
_0806D1B0:
	pop {r0}
	bx r0

	THUMB_FUNC_END EfxMagfcastMain

	THUMB_FUNC_START sub_806D1B4
sub_806D1B4: @ 0x0806D1B4
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r5, r1, #0
	ldr r1, _0806D1E8  @ gUnknown_0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0806D1EC  @ ProcScr_efxMagfcastBG
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	str r6, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	str r0, [r4, #0x44]
	cmp r5, #1
	beq _0806D200
	cmp r5, #1
	bcc _0806D1F0
	cmp r5, #2
	beq _0806D210
	cmp r5, #3
	beq _0806D224
	b _0806D23A
	.align 2, 0
_0806D1E8: .4byte gUnknown_0201774C
_0806D1EC: .4byte ProcScr_efxMagfcastBG
_0806D1F0:
	ldr r0, _0806D1F8  @ gUnknown_080DF386
	str r0, [r4, #0x48]
	ldr r0, _0806D1FC  @ gUnknown_085D8FC4
	b _0806D216
	.align 2, 0
_0806D1F8: .4byte gUnknown_080DF386
_0806D1FC: .4byte gUnknown_085D8FC4
_0806D200:
	ldr r0, _0806D208  @ gUnknown_080DF39C
	str r0, [r4, #0x48]
	ldr r0, _0806D20C  @ gUnknown_085D8FC4
	b _0806D216
	.align 2, 0
_0806D208: .4byte gUnknown_080DF39C
_0806D20C: .4byte gUnknown_085D8FC4
_0806D210:
	ldr r0, _0806D21C  @ gUnknown_080DF3A2
	str r0, [r4, #0x48]
	ldr r0, _0806D220  @ gUnknown_085D8FDC
_0806D216:
	str r0, [r4, #0x4c]
	str r0, [r4, #0x50]
	b _0806D23A
	.align 2, 0
_0806D21C: .4byte gUnknown_080DF3A2
_0806D220: .4byte gUnknown_085D8FDC
_0806D224:
	ldr r0, _0806D270  @ gUnknown_080DF3C4
	str r0, [r4, #0x48]
	ldr r0, _0806D274  @ gUnknown_085D8FDC
	str r0, [r4, #0x4c]
	str r0, [r4, #0x50]
	ldrb r0, [r6, #0x14]
	adds r0, r6, r0
	ldrb r1, [r0, #0x14]
	adds r0, r6, #0
	bl sub_8071B6C
_0806D23A:
	ldr r0, _0806D278  @ gUnknown_085EE4F8
	movs r1, #0x80
	lsls r1, r1, #6
	bl SomeImageStoringRoutine_SpellAnim2
	ldr r0, _0806D27C  @ gUnknown_085EF24C
	movs r1, #0x20
	bl SomePaletteStoringRoutine_SpellAnim2
	bl sub_80551B0
	ldr r0, _0806D280  @ gEkrDistanceType
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _0806D28E
	ldr r0, [r4, #0x5c]
	bl GetAISSubjectId
	cmp r0, #0
	bne _0806D284
	movs r0, #1
	movs r1, #0x18
	movs r2, #0
	bl BG_SetPosition
	b _0806D28E
	.align 2, 0
_0806D270: .4byte gUnknown_080DF3C4
_0806D274: .4byte gUnknown_085D8FDC
_0806D278: .4byte gUnknown_085EE4F8
_0806D27C: .4byte gUnknown_085EF24C
_0806D280: .4byte gEkrDistanceType
_0806D284:
	movs r0, #1
	movs r1, #0xe8
	movs r2, #0
	bl BG_SetPosition
_0806D28E:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_806D1B4

	THUMB_FUNC_START EfxMagfcastBGMain
EfxMagfcastBGMain: @ 0x0806D294
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl sub_80558F4
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	asrs r1, r0, #0x10
	cmp r1, #0
	blt _0806D2F6
	ldr r0, _0806D2D0  @ gEkrDistanceType
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _0806D2DE
	ldr r0, [r4, #0x5c]
	bl GetAISSubjectId
	cmp r0, #0
	bne _0806D2D4
	movs r0, #1
	movs r1, #0x18
	movs r2, #0
	bl BG_SetPosition
	b _0806D2DE
	.align 2, 0
_0806D2D0: .4byte gEkrDistanceType
_0806D2D4:
	movs r0, #1
	movs r1, #0xe8
	movs r2, #0
	bl BG_SetPosition
_0806D2DE:
	ldr r1, [r4, #0x4c]
	ldr r3, [r4, #0x50]
	ldr r0, [r4, #0x5c]
	lsls r2, r5, #0x10
	asrs r2, r2, #0xe
	adds r1, r2, r1
	ldr r1, [r1]
	adds r2, r2, r3
	ldr r2, [r2]
	bl sub_8055670
	b _0806D314
_0806D2F6:
	movs r0, #1
	negs r0, r0
	cmp r1, r0
	bne _0806D314
	bl ClearBG1
	ldr r1, _0806D31C  @ gUnknown_0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SetDefaultColorEffects_
	adds r0, r4, #0
	bl Proc_End
_0806D314:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806D31C: .4byte gUnknown_0201774C

	THUMB_FUNC_END EfxMagfcastBGMain

	THUMB_FUNC_START NewEfxSunakemuri
NewEfxSunakemuri: @ 0x0806D320
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	ldr r0, _0806D348  @ gUnknown_0201774C
	ldr r4, [r0]
	cmp r4, #0
	bne _0806D342
	ldr r0, _0806D34C  @ ProcScr_efxSunakemuri
	movs r1, #3
	bl Proc_Start
	str r5, [r0, #0x5c]
	strh r4, [r0, #0x2c]
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_806D35C
_0806D342:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806D348: .4byte gUnknown_0201774C
_0806D34C: .4byte ProcScr_efxSunakemuri

	THUMB_FUNC_END NewEfxSunakemuri

	THUMB_FUNC_START sub_806D350
sub_806D350: @ 0x0806D350
	push {lr}
	bl Proc_Break
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_806D350

	THUMB_FUNC_START sub_806D35C
sub_806D35C: @ 0x0806D35C
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	adds r4, r1, #0
	ldr r1, _0806D3C4  @ gUnknown_0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0806D3C8  @ ProcScr_efxSunakemuriOBJ
	movs r1, #3
	bl Proc_Start
	adds r5, r0, #0
	str r6, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	ldr r2, _0806D3CC  @ gUnknown_085F1710
	cmp r4, #0
	beq _0806D38A
	ldr r2, _0806D3D0  @ gUnknown_085F19A0
	cmp r4, #1
	bne _0806D38A
	ldr r2, _0806D3D4  @ gUnknown_085F1858
_0806D38A:
	ldr r3, _0806D3D8  @ gUnknown_085F17B4
	cmp r4, #0
	beq _0806D398
	ldr r3, _0806D3DC  @ gUnknown_085F1A44
	cmp r4, #1
	bne _0806D398
	ldr r3, _0806D3E0  @ gUnknown_085F18FC
_0806D398:
	str r2, [sp]
	adds r0, r6, #0
	adds r1, r3, #0
	bl EfxAnimCreate
	str r0, [r5, #0x60]
	ldr r4, _0806D3E4  @ gEkrPairTerrainID
	ldr r0, [r5, #0x5c]
	bl GetAISSubjectId
	lsls r0, r0, #1
	adds r0, r0, r4
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0x40
	bls _0806D3BA
	b _0806D524
_0806D3BA:
	lsls r0, r0, #2
	ldr r1, _0806D3E8  @ _0806D3EC
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0806D3C4: .4byte gUnknown_0201774C
_0806D3C8: .4byte ProcScr_efxSunakemuriOBJ
_0806D3CC: .4byte gUnknown_085F1710
_0806D3D0: .4byte gUnknown_085F19A0
_0806D3D4: .4byte gUnknown_085F1858
_0806D3D8: .4byte gUnknown_085F17B4
_0806D3DC: .4byte gUnknown_085F1A44
_0806D3E0: .4byte gUnknown_085F18FC
_0806D3E4: .4byte gEkrPairTerrainID
_0806D3E8: .4byte _0806D3EC
_0806D3EC: @ jump table
	.4byte _0806D524 @ case 0
	.4byte _0806D4F0 @ case 1
	.4byte _0806D4F0 @ case 2
	.4byte _0806D4F0 @ case 3
	.4byte _0806D4F0 @ case 4
	.4byte _0806D4F0 @ case 5
	.4byte _0806D51C @ case 6
	.4byte _0806D51C @ case 7
	.4byte _0806D51C @ case 8
	.4byte _0806D51C @ case 9
	.4byte _0806D4F0 @ case 10
	.4byte _0806D51C @ case 11
	.4byte _0806D4F0 @ case 12
	.4byte _0806D4F0 @ case 13
	.4byte _0806D4F0 @ case 14
	.4byte _0806D4F0 @ case 15
	.4byte _0806D50C @ case 16
	.4byte _0806D4F0 @ case 17
	.4byte _0806D4F0 @ case 18
	.4byte _0806D4F0 @ case 19
	.4byte _0806D4F8 @ case 20
	.4byte _0806D50C @ case 21
	.4byte _0806D50C @ case 22
	.4byte _0806D51C @ case 23
	.4byte _0806D51C @ case 24
	.4byte _0806D4F0 @ case 25
	.4byte _0806D4F0 @ case 26
	.4byte _0806D4F0 @ case 27
	.4byte _0806D4F0 @ case 28
	.4byte _0806D51C @ case 29
	.4byte _0806D51C @ case 30
	.4byte _0806D51C @ case 31
	.4byte _0806D51C @ case 32
	.4byte _0806D51C @ case 33
	.4byte _0806D4F0 @ case 34
	.4byte _0806D4F0 @ case 35
	.4byte _0806D51C @ case 36
	.4byte _0806D4F0 @ case 37
	.4byte _0806D4F0 @ case 38
	.4byte _0806D4F0 @ case 39
	.4byte _0806D4F0 @ case 40
	.4byte _0806D4F0 @ case 41
	.4byte _0806D4F0 @ case 42
	.4byte _0806D4F0 @ case 43
	.4byte _0806D524 @ case 44
	.4byte _0806D51C @ case 45
	.4byte _0806D524 @ case 46
	.4byte _0806D4F0 @ case 47
	.4byte _0806D51C @ case 48
	.4byte _0806D51C @ case 49
	.4byte _0806D51C @ case 50
	.4byte _0806D4F0 @ case 51
	.4byte _0806D524 @ case 52
	.4byte _0806D524 @ case 53
	.4byte _0806D50C @ case 54
	.4byte _0806D51C @ case 55
	.4byte _0806D4F0 @ case 56
	.4byte _0806D4F0 @ case 57
	.4byte _0806D4F0 @ case 58
	.4byte _0806D4F0 @ case 59
	.4byte _0806D50C @ case 60
	.4byte _0806D4F0 @ case 61
	.4byte _0806D51C @ case 62
	.4byte _0806D4F0 @ case 63
	.4byte _0806D4F0 @ case 64
_0806D4F0:
	ldr r0, _0806D4F4  @ gUnknown_085F1620
	b _0806D50E
	.align 2, 0
_0806D4F4: .4byte gUnknown_085F1620
_0806D4F8:
	ldr r0, [r5, #0x5c]
	bl sub_80723A4
	cmp r0, #0
	beq _0806D50C
	ldr r0, _0806D508  @ gUnknown_085F1620
	b _0806D50E
	.align 2, 0
_0806D508: .4byte gUnknown_085F1620
_0806D50C:
	ldr r0, _0806D518  @ gUnknown_085F1640
_0806D50E:
	movs r1, #0x20
	bl SomePaletteStoringRoutine_SpellAnim
	b _0806D524
	.align 2, 0
_0806D518: .4byte gUnknown_085F1640
_0806D51C:
	ldr r0, _0806D538  @ gUnknown_085F1660
	movs r1, #0x20
	bl SomePaletteStoringRoutine_SpellAnim
_0806D524:
	ldr r0, _0806D53C  @ gUnknown_085F11B0
	movs r1, #0x80
	lsls r1, r1, #5
	bl SomeImageStoringRoutine_SpellAnim
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806D538: .4byte gUnknown_085F1660
_0806D53C: .4byte gUnknown_085F11B0

	THUMB_FUNC_END sub_806D35C

	THUMB_FUNC_START sub_806D540
sub_806D540: @ 0x0806D540
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #9
	bne _0806D566
	ldr r0, _0806D56C  @ gUnknown_0201774C
	ldr r1, [r0]
	subs r1, #1
	str r1, [r0]
	ldr r0, [r4, #0x60]
	bl AnimDelete
	adds r0, r4, #0
	bl Proc_Break
_0806D566:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806D56C: .4byte gUnknown_0201774C

	THUMB_FUNC_END sub_806D540

	THUMB_FUNC_START NewEfxLokmsuna
NewEfxLokmsuna: @ 0x0806D570
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _0806D594  @ gUnknown_0201774C
	ldr r4, [r0]
	cmp r4, #0
	bne _0806D58E
	ldr r0, _0806D598  @ ProcScr_efxLokmsuna
	movs r1, #3
	bl Proc_Start
	str r5, [r0, #0x5c]
	strh r4, [r0, #0x2c]
	adds r0, r5, #0
	bl sub_806D5A8
_0806D58E:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806D594: .4byte gUnknown_0201774C
_0806D598: .4byte ProcScr_efxLokmsuna

	THUMB_FUNC_END NewEfxLokmsuna

	THUMB_FUNC_START sub_806D59C
sub_806D59C: @ 0x0806D59C
	push {lr}
	bl Proc_Break
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_806D59C

	THUMB_FUNC_START sub_806D5A8
sub_806D5A8: @ 0x0806D5A8
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r1, _0806D5F4  @ gUnknown_0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0806D5F8  @ ProcScr_efxLokmsunaOBJ
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r7, #0
	movs r0, #0
	strh r0, [r4, #0x2c]
	ldr r2, _0806D5FC  @ gUnknown_087584B8
	ldr r3, _0806D600  @ gUnknown_087585DC
	str r2, [sp]
	adds r0, r5, #0
	adds r1, r3, #0
	bl EfxAnimCreate
	adds r6, r0, #0
	str r6, [r4, #0x60]
	ldrh r1, [r6, #8]
	ldr r0, _0806D604  @ 0x00000FFF
	ands r0, r1
	strh r0, [r6, #8]
	adds r0, r5, #0
	bl GetAISSubjectId
	cmp r0, #0
	bne _0806D608
	ldrh r0, [r6, #8]
	movs r2, #0xe0
	lsls r2, r2, #7
	b _0806D60E
	.align 2, 0
_0806D5F4: .4byte gUnknown_0201774C
_0806D5F8: .4byte ProcScr_efxLokmsunaOBJ
_0806D5FC: .4byte gUnknown_087584B8
_0806D600: .4byte gUnknown_087585DC
_0806D604: .4byte 0x00000FFF
_0806D608:
	ldrh r0, [r6, #8]
	movs r2, #0x90
	lsls r2, r2, #8
_0806D60E:
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r6, #8]
	ldr r0, _0806D628  @ gUnknown_08758218
	movs r1, #0x80
	lsls r1, r1, #5
	bl SomeImageStoringRoutine_SpellAnim
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806D628: .4byte gUnknown_08758218

	THUMB_FUNC_END sub_806D5A8

	THUMB_FUNC_START sub_806D62C
sub_806D62C: @ 0x0806D62C
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xf
	bne _0806D652
	ldr r0, _0806D658  @ gUnknown_0201774C
	ldr r1, [r0]
	subs r1, #1
	str r1, [r0]
	ldr r0, [r4, #0x60]
	bl AnimDelete
	adds r0, r4, #0
	bl Proc_Break
_0806D652:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806D658: .4byte gUnknown_0201774C

	THUMB_FUNC_END sub_806D62C

	THUMB_FUNC_START NewEfxKingPika
NewEfxKingPika: @ 0x0806D65C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0806D674  @ ProcScr_efxKingPika
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806D674: .4byte ProcScr_efxKingPika

	THUMB_FUNC_END NewEfxKingPika

	THUMB_FUNC_START sub_806D678
sub_806D678: @ 0x0806D678
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	ldr r6, [r7, #0x5c]
	ldrh r0, [r7, #0x2c]
	adds r0, #1
	strh r0, [r7, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _0806D69A
	adds r0, r6, #0
	movs r1, #1
	movs r2, #0x28
	movs r3, #0
	bl NewEfxFlashUnit
	b _0806D6DE
_0806D69A:
	cmp r0, #0xa
	bne _0806D6A8
	adds r0, r6, #0
	movs r1, #0x14
	bl StartSpellBG_FLASH
	b _0806D6DE
_0806D6A8:
	cmp r0, #0x2d
	bne _0806D6DE
	ldr r5, _0806D6E4  @ gAnims
	adds r0, r6, #0
	bl GetAISSubjectId
	lsls r0, r0, #3
	adds r0, r0, r5
	ldr r4, [r0]
	adds r0, r6, #0
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
	adds r0, r7, #0
	bl Proc_Break
_0806D6DE:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806D6E4: .4byte gAnims

	THUMB_FUNC_END sub_806D678

	THUMB_FUNC_START NewEfxFlashFX
NewEfxFlashFX: @ 0x0806D6E8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0806D700  @ ProcScr_efxFlashFX
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806D700: .4byte ProcScr_efxFlashFX

	THUMB_FUNC_END NewEfxFlashFX

	THUMB_FUNC_START sub_806D704
sub_806D704: @ 0x0806D704
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	ldr r6, [r7, #0x5c]
	ldrh r0, [r7, #0x2c]
	adds r0, #1
	strh r0, [r7, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _0806D722
	adds r0, r6, #0
	movs r1, #5
	bl StartSpellBG_FLASH
	b _0806D758
_0806D722:
	cmp r0, #6
	bne _0806D758
	ldr r5, _0806D760  @ gAnims
	adds r0, r6, #0
	bl GetAISSubjectId
	lsls r0, r0, #3
	adds r0, r0, r5
	ldr r4, [r0]
	adds r0, r6, #0
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
	adds r0, r7, #0
	bl Proc_Break
_0806D758:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806D760: .4byte gAnims

	THUMB_FUNC_END sub_806D704

	THUMB_FUNC_START sub_806D764
sub_806D764: @ 0x0806D764
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r1, _0806D7C4  @ gUnknown_0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0806D7C8  @ ProcScr_efxSongOBJ2
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	movs r0, #0x28
	strh r0, [r4, #0x2e]
	ldr r3, _0806D7CC  @ gUnknown_085DD4B4
	str r3, [sp]
	adds r0, r5, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl EfxAnimCreate
	str r0, [r4, #0x60]
	ldr r0, _0806D7D0  @ gUnknown_085DCC84
	movs r1, #0x20
	bl SomePaletteStoringRoutine_SpellAnim
	ldr r0, _0806D7D4  @ gUnknown_085DCB10
	movs r1, #0x80
	lsls r1, r1, #5
	bl SomeImageStoringRoutine_SpellAnim
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r0, [r4, #0x5c]
	movs r3, #2
	ldrsh r2, [r0, r3]
	movs r0, #0xee
	movs r3, #1
	bl EkrSoundSomeBark
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806D7C4: .4byte gUnknown_0201774C
_0806D7C8: .4byte ProcScr_efxSongOBJ2
_0806D7CC: .4byte gUnknown_085DD4B4
_0806D7D0: .4byte gUnknown_085DCC84
_0806D7D4: .4byte gUnknown_085DCB10

	THUMB_FUNC_END sub_806D764

	THUMB_FUNC_START sub_806D7D8
sub_806D7D8: @ 0x0806D7D8
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x18
	bne _0806D7FC
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r0, [r4, #0x5c]
	movs r3, #2
	ldrsh r2, [r0, r3]
	movs r0, #0xee
	movs r3, #1
	bl EkrSoundSomeBark
_0806D7FC:
	movs r0, #0x2c
	ldrsh r1, [r4, r0]
	movs r2, #0x2e
	ldrsh r0, [r4, r2]
	cmp r1, r0
	ble _0806D81C
	ldr r0, [r4, #0x60]
	bl AnimDelete
	ldr r1, _0806D824  @ gUnknown_0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
_0806D81C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806D824: .4byte gUnknown_0201774C

	THUMB_FUNC_END sub_806D7D8

	THUMB_FUNC_START sub_806D828
sub_806D828: @ 0x0806D828
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r1, _0806D888  @ gUnknown_0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0806D88C  @ ProcScr_efxDanceOBJ
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	movs r0, #0x19
	strh r0, [r4, #0x2e]
	ldr r3, _0806D890  @ gUnknown_085DD484
	str r3, [sp]
	adds r0, r5, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl EfxAnimCreate
	str r0, [r4, #0x60]
	ldr r0, _0806D894  @ gUnknown_085DCC84
	movs r1, #0x20
	bl SomePaletteStoringRoutine_SpellAnim
	ldr r0, _0806D898  @ gUnknown_085DCB10
	movs r1, #0x80
	lsls r1, r1, #5
	bl SomeImageStoringRoutine_SpellAnim
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r0, [r4, #0x5c]
	movs r3, #2
	ldrsh r2, [r0, r3]
	movs r0, #0xe1
	movs r3, #1
	bl EkrSoundSomeBark
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806D888: .4byte gUnknown_0201774C
_0806D88C: .4byte ProcScr_efxDanceOBJ
_0806D890: .4byte gUnknown_085DD484
_0806D894: .4byte gUnknown_085DCC84
_0806D898: .4byte gUnknown_085DCB10

	THUMB_FUNC_END sub_806D828

	THUMB_FUNC_START sub_806D89C
sub_806D89C: @ 0x0806D89C
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
	ble _0806D8C6
	ldr r0, [r4, #0x60]
	bl AnimDelete
	ldr r1, _0806D8CC  @ gUnknown_0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
_0806D8C6:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806D8CC: .4byte gUnknown_0201774C

	THUMB_FUNC_END sub_806D89C

.align 2, 0
