	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	THUMB_FUNC_START NewEkrDragonBodvBlack
NewEkrDragonBodvBlack: @ 0x080772C0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080772E0  @ ProcScr_ekrDragonBodvBlack
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r2, #0
	movs r1, #0
	strh r1, [r0, #0x2c]
	adds r1, r0, #0
	adds r1, #0x29
	strb r2, [r1]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080772E0: .4byte ProcScr_ekrDragonBodvBlack

	THUMB_FUNC_END NewEkrDragonBodvBlack

	THUMB_FUNC_START sub_80772E4
sub_80772E4: @ 0x080772E4
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _08077308  @ gUnknown_080E1164
	ldr r4, _0807730C  @ pPalette4Buffer
	adds r1, r4, #0
	movs r2, #8
	bl CpuFastSet
	subs r4, #0x80
	adds r0, r4, #0
	movs r1, #4
	movs r2, #1
	adds r3, r5, #0
	bl sub_80712B0
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08077308: .4byte gUnknown_080E1164
_0807730C: .4byte pPalette4Buffer

	THUMB_FUNC_END sub_80772E4

	THUMB_FUNC_START sub_8077310
sub_8077310: @ 0x08077310
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	movs r0, #0x2c
	ldrsh r3, [r6, r0]
	movs r0, #8
	str r0, [sp]
	movs r0, #4
	movs r1, #0
	movs r2, #0x10
	bl Interpolate
	adds r5, r0, #0
	ldr r0, _08077388  @ Pal_DemonKingBG
	ldr r4, _0807738C  @ pPalette6Buffer
	adds r1, r4, #0
	movs r2, #8
	bl CpuFastSet
	ldr r0, _08077390  @ gUnknown_02000054
	ldr r0, [r0]
	movs r2, #0x88
	lsls r2, r2, #2
	adds r1, r4, r2
	movs r2, #8
	bl CpuFastSet
	subs r4, #0xc0
	adds r0, r4, #0
	movs r1, #6
	movs r2, #1
	adds r3, r5, #0
	bl sub_80712B0
	adds r0, r4, #0
	movs r1, #0x17
	movs r2, #1
	adds r3, r5, #0
	bl sub_80712B0
	bl EnablePaletteSync
	ldrh r0, [r6, #0x2c]
	adds r0, #1
	strh r0, [r6, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #9
	bne _08077380
	adds r1, r6, #0
	adds r1, #0x29
	movs r0, #1
	strb r0, [r1]
	adds r0, r6, #0
	bl Proc_Break
_08077380:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08077388: .4byte Pal_DemonKingBG
_0807738C: .4byte pPalette6Buffer
_08077390: .4byte gUnknown_02000054

	THUMB_FUNC_END sub_8077310

	THUMB_FUNC_START sub_8077394
sub_8077394: @ 0x08077394
	bx lr

	THUMB_FUNC_END sub_8077394

	THUMB_FUNC_START sub_8077398
sub_8077398: @ 0x08077398
	push {lr}
	movs r0, #3
	movs r1, #2
	movs r2, #3
	bl NewEkrWhiteOUT
	ldr r0, _080773B8  @ 0x00000147
	movs r1, #0x80
	lsls r1, r1, #1
	movs r2, #0x78
	movs r3, #0
	bl sub_80729A4
	pop {r0}
	bx r0
	.align 2, 0
_080773B8: .4byte 0x00000147

	THUMB_FUNC_END sub_8077398

	THUMB_FUNC_START sub_80773BC
sub_80773BC: @ 0x080773BC
	push {lr}
	adds r2, r0, #0
	adds r1, r2, #0
	adds r1, #0x29
	movs r0, #0
	strb r0, [r1]
	strh r0, [r2, #0x2c]
	ldr r0, _080773DC  @ gEkrSomeType
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _080773D6
	ldr r0, _080773E0  @ 0x0000FFE0
_080773D6:
	strh r0, [r2, #0x32]
	pop {r0}
	bx r0
	.align 2, 0
_080773DC: .4byte gEkrSomeType
_080773E0: .4byte 0x0000FFE0

	THUMB_FUNC_END sub_80773BC

	THUMB_FUNC_START sub_80773E4
sub_80773E4: @ 0x080773E4
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	mov r4, sp
	adds r4, #2
	movs r0, #0x2c
	ldrsh r2, [r5, r0]
	mov r0, sp
	adds r1, r4, #0
	movs r3, #0
	bl sub_8077D80
	mov r0, sp
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r2, #0
	ldrsh r1, [r4, r2]
	bl sub_8077DB4
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	strh r0, [r5, #0x2c]
	movs r0, #0x2c
	ldrsh r1, [r5, r0]
	movs r0, #0xf0
	lsls r0, r0, #1
	cmp r1, r0
	bne _08077436
	ldr r4, _08077458  @ gUnknown_0859A120
	adds r0, r4, #0
	movs r1, #0x17
	movs r2, #0xf0
	adds r3, r5, #0
	bl sub_8013928
	adds r0, r4, #0
	movs r1, #6
	movs r2, #0xf0
	adds r3, r5, #0
	bl sub_8013928
_08077436:
	ldr r0, _0807745C  @ gUnknown_08801810
	bl Proc_Find
	cmp r0, #0
	bne _0807744E
	movs r0, #0
	movs r1, #0
	bl sub_8077DB4
	adds r0, r5, #0
	bl Proc_Break
_0807744E:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08077458: .4byte gUnknown_0859A120
_0807745C: .4byte gUnknown_08801810

	THUMB_FUNC_END sub_80773E4

	THUMB_FUNC_START sub_8077460
sub_8077460: @ 0x08077460
	push {lr}
	adds r2, r0, #0
	adds r2, #0x29
	movs r1, #1
	strb r1, [r2]
	bl Proc_Break
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8077460

	THUMB_FUNC_START sub_8077474
sub_8077474: @ 0x08077474
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	adds r5, r0, #0
	adds r4, r1, #0
	asrs r5, r5, #3
	asrs r4, r4, #3
	ldr r0, _08077500  @ Tsa_DemonKingBG1
	ldr r6, _08077504  @ gUnknown_02019790
	adds r1, r6, #0
	bl Decompress
	movs r1, #0xf0
	lsls r1, r1, #3
	adds r0, r6, r1
	lsls r5, r5, #1
	lsls r2, r4, #5
	adds r2, r2, r4
	lsls r2, r2, #2
	ldr r7, _08077508  @ gUnknown_0201D428
	adds r2, r2, r7
	adds r2, r5, r2
	movs r1, #0x20
	mov sl, r1
	str r1, [sp]
	movs r1, #2
	str r1, [sp, #4]
	movs r1, #6
	mov r9, r1
	str r1, [sp, #8]
	movs r1, #0
	mov r8, r1
	str r1, [sp, #0xc]
	subs r1, #1
	movs r3, #0x42
	bl sub_8070FA4
	adds r4, #2
	lsls r0, r4, #5
	adds r0, r0, r4
	lsls r0, r0, #2
	adds r0, r0, r7
	adds r5, r5, r0
	mov r0, sl
	str r0, [sp]
	movs r0, #0x1e
	str r0, [sp, #4]
	mov r1, r9
	str r1, [sp, #8]
	mov r0, r8
	str r0, [sp, #0xc]
	adds r0, r6, #0
	movs r1, #1
	negs r1, r1
	adds r2, r5, #0
	movs r3, #0x42
	bl sub_8070FA4
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08077500: .4byte Tsa_DemonKingBG1
_08077504: .4byte gUnknown_02019790
_08077508: .4byte gUnknown_0201D428

	THUMB_FUNC_END sub_8077474

	THUMB_FUNC_START sub_807750C
sub_807750C: @ 0x0807750C
	push {r4, r5, lr}
	sub sp, #0x10
	adds r3, r0, #0
	adds r2, r1, #0
	asrs r4, r3, #3
	movs r1, #7
	asrs r5, r2, #3
	ands r2, r1
	movs r0, #3
	ands r1, r3
	bl BG_SetPosition
	lsls r4, r4, #1
	lsls r0, r5, #5
	adds r0, r0, r5
	lsls r0, r0, #2
	ldr r1, _08077558  @ gUnknown_0201D428
	adds r0, r0, r1
	adds r4, r4, r0
	ldr r2, _0807755C  @ gBG3TilemapBuffer
	movs r0, #0x20
	str r0, [sp]
	str r0, [sp, #4]
	subs r0, #0x21
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	adds r0, r4, #0
	movs r1, #0x42
	movs r3, #0x20
	bl sub_8070EF4
	movs r0, #8
	bl BG_EnableSyncByMask
	add sp, #0x10
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08077558: .4byte gUnknown_0201D428
_0807755C: .4byte gBG3TilemapBuffer

	THUMB_FUNC_END sub_807750C

	THUMB_FUNC_START sub_8077560
sub_8077560: @ 0x08077560
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, _08077580  @ gUnknown_087F4518
	movs r1, #3
	bl Proc_Start
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	movs r0, #1
	bl Sound_FadeOutBGM
	adds r0, r5, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08077580: .4byte gUnknown_087F4518

	THUMB_FUNC_END sub_8077560

	THUMB_FUNC_START sub_8077584
sub_8077584: @ 0x08077584
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08077598  @ ProcScr_ekrDragonTunkFace
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08077598: .4byte ProcScr_ekrDragonTunkFace

	THUMB_FUNC_END sub_8077584

	THUMB_FUNC_START sub_807759C
sub_807759C: @ 0x0807759C
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r4, _080775DC  @ gUnknown_087F4184
	ldr r0, _080775E0  @ gUnknown_088017E0
	movs r1, #0x20
	bl SomePaletteStoringRoutine_SpellAnim
	ldr r0, _080775E4  @ gUnknown_087FF488
	movs r1, #0x80
	lsls r1, r1, #6
	bl SomeImageStoringRoutine_SpellAnim
	ldr r0, [r5, #0x5c]
	str r4, [sp]
	adds r1, r4, #0
	adds r2, r4, #0
	adds r3, r4, #0
	bl sub_80555B0
	str r0, [r5, #0x60]
	ldrh r1, [r5, #0x32]
	movs r2, #0
	strh r1, [r0, #2]
	ldrh r1, [r5, #0x3a]
	strh r1, [r0, #4]
	strh r2, [r5, #0x2c]
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080775DC: .4byte gUnknown_087F4184
_080775E0: .4byte gUnknown_088017E0
_080775E4: .4byte gUnknown_087FF488

	THUMB_FUNC_END sub_807759C

	THUMB_FUNC_START sub_80775E8
sub_80775E8: @ 0x080775E8
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x60]
	ldrh r0, [r4, #0x32]
	strh r0, [r1, #2]
	ldrh r0, [r4, #0x3a]
	strh r0, [r1, #4]
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #3
	ble _0807761A
	movs r0, #0
	strh r0, [r4, #0x2c]
	ldr r0, [r4, #0x60]
	bl AnimDelete
	adds r0, r4, #0
	bl Proc_Break
	adds r0, r4, #0
	bl sub_8077620
_0807761A:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80775E8

	THUMB_FUNC_START sub_8077620
sub_8077620: @ 0x08077620
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r4, _08077660  @ gUnknown_087F4314
	ldr r0, _08077664  @ gUnknown_088017E0
	movs r1, #0x20
	bl SomePaletteStoringRoutine_SpellAnim
	ldr r0, _08077668  @ gUnknown_0880064C
	movs r1, #0x80
	lsls r1, r1, #6
	bl SomeImageStoringRoutine_SpellAnim
	ldr r0, [r5, #0x5c]
	str r4, [sp]
	adds r1, r4, #0
	adds r2, r4, #0
	adds r3, r4, #0
	bl sub_80555B0
	str r0, [r5, #0x60]
	ldrh r1, [r5, #0x32]
	movs r2, #0
	strh r1, [r0, #2]
	ldrh r1, [r5, #0x3a]
	strh r1, [r0, #4]
	strh r2, [r5, #0x2c]
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08077660: .4byte gUnknown_087F4314
_08077664: .4byte gUnknown_088017E0
_08077668: .4byte gUnknown_0880064C

	THUMB_FUNC_END sub_8077620

	THUMB_FUNC_START sub_807766C
sub_807766C: @ 0x0807766C
	ldr r2, [r0, #0x60]
	ldrh r1, [r0, #0x32]
	strh r1, [r2, #2]
	ldrh r0, [r0, #0x3a]
	strh r0, [r2, #4]
	bx lr

	THUMB_FUNC_END sub_807766C

	THUMB_FUNC_START sub_8077678
sub_8077678: @ 0x08077678
	push {lr}
	ldr r0, [r0, #0x60]
	bl AnimDelete
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8077678

	THUMB_FUNC_START sub_8077684
sub_8077684: @ 0x08077684
	push {lr}
	adds r2, r0, #0
	ldr r1, [r2, #0x60]
	ldrh r0, [r2, #0x32]
	strh r0, [r1, #2]
	ldrh r0, [r2, #0x3a]
	strh r0, [r1, #4]
	ldrh r0, [r2, #0x2c]
	adds r0, #1
	strh r0, [r2, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #4
	bne _080776AA
	movs r0, #0
	strh r0, [r2, #0x2c]
	adds r0, r2, #0
	bl Proc_Break
_080776AA:
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8077684

	THUMB_FUNC_START sub_80776B0
sub_80776B0: @ 0x080776B0
	push {lr}
	adds r2, r0, #0
	ldr r1, [r2, #0x60]
	ldrh r0, [r2, #0x32]
	strh r0, [r1, #2]
	ldrh r0, [r2, #0x3a]
	strh r0, [r1, #4]
	ldrh r0, [r2, #0x2c]
	adds r0, #1
	strh r0, [r2, #0x2c]
	lsls r0, r0, #0x10
	movs r1, #0x96
	lsls r1, r1, #0x11
	cmp r0, r1
	bne _080776D4
	adds r0, r2, #0
	bl Proc_Break
_080776D4:
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80776B0

	THUMB_FUNC_START sub_80776D8
sub_80776D8: @ 0x080776D8
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #0x10
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	asrs r4, r4, #3
	asrs r5, r5, #3
	movs r0, #0
	bl sub_80559D0
	ldr r0, _08077734  @ gUnknown_02019790
	mov r8, r0
	adds r0, r6, #0
	mov r1, r8
	bl LZ77UnCompWram
	movs r1, #1
	negs r1, r1
	lsls r4, r4, #1
	lsls r0, r5, #5
	adds r0, r0, r5
	lsls r0, r0, #2
	ldr r2, _08077738  @ gUnknown_0201D428
	adds r0, r0, r2
	adds r4, r4, r0
	movs r0, #0x20
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #6
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	mov r0, r8
	adds r2, r4, #0
	movs r3, #0x42
	bl sub_8070FA4
	add sp, #0x10
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08077734: .4byte gUnknown_02019790
_08077738: .4byte gUnknown_0201D428

	THUMB_FUNC_END sub_80776D8

	THUMB_FUNC_START sub_807773C
sub_807773C: @ 0x0807773C
	push {r4, r5, lr}
	sub sp, #0x10
	adds r3, r0, #0
	adds r2, r1, #0
	asrs r4, r3, #3
	movs r1, #7
	asrs r5, r2, #3
	ands r2, r1
	movs r0, #3
	ands r1, r3
	bl BG_SetPosition
	lsls r4, r4, #1
	lsls r0, r5, #5
	adds r0, r0, r5
	lsls r0, r0, #2
	ldr r1, _08077788  @ gUnknown_0201D428
	adds r0, r0, r1
	adds r4, r4, r0
	ldr r2, _0807778C  @ gBG3TilemapBuffer
	movs r0, #0x20
	str r0, [sp]
	str r0, [sp, #4]
	subs r0, #0x21
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	adds r0, r4, #0
	movs r1, #0x42
	movs r3, #0x20
	bl sub_8070EF4
	movs r0, #8
	bl BG_EnableSyncByMask
	add sp, #0x10
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08077788: .4byte gUnknown_0201D428
_0807778C: .4byte gBG3TilemapBuffer

	THUMB_FUNC_END sub_807773C

	THUMB_FUNC_START NewEkrDragonTunk
NewEkrDragonTunk: @ 0x08077790
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, _080777BC  @ ProcScr_ekrDragonTunk
	movs r1, #3
	bl Proc_Start
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	adds r1, r5, #0
	adds r1, #0x29
	movs r0, #0
	strb r0, [r1]
	movs r1, #0
	strh r0, [r5, #0x2c]
	ldr r0, _080777C0  @ gEkrSomeType
	movs r2, #0
	ldrsh r0, [r0, r2]
	cmp r0, #0
	bne _080777C8
	ldr r0, _080777C4  @ 0x0000FFF8
	b _080777CA
	.align 2, 0
_080777BC: .4byte ProcScr_ekrDragonTunk
_080777C0: .4byte gEkrSomeType
_080777C4: .4byte 0x0000FFF8
_080777C8:
	ldr r0, _080777DC  @ 0x0000FFE0
_080777CA:
	strh r0, [r5, #0x32]
	movs r0, #1
	bl Sound_FadeOutBGM
	adds r0, r5, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080777DC: .4byte 0x0000FFE0

	THUMB_FUNC_END NewEkrDragonTunk

	THUMB_FUNC_START sub_80777E0
sub_80777E0: @ 0x080777E0
	push {r4, r5, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	movs r5, #0
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _0807780C
	movs r0, #3
	movs r1, #2
	movs r2, #3
	bl NewEkrWhiteOUT
	ldr r0, _08077894  @ 0x00000147
	movs r1, #0x80
	lsls r1, r1, #1
	movs r2, #0x78
	movs r3, #0
	bl sub_80729A4
_0807780C:
	movs r1, #0x2c
	ldrsh r0, [r4, r1]
	cmp r0, #0x23
	bne _0807782C
	movs r0, #3
	movs r1, #2
	movs r2, #3
	bl NewEkrWhiteOUT
	ldr r0, _08077894  @ 0x00000147
	movs r1, #0x80
	lsls r1, r1, #1
	movs r2, #0x78
	movs r3, #0
	bl sub_80729A4
_0807782C:
	movs r1, #0x2c
	ldrsh r0, [r4, r1]
	cmp r0, #0x32
	bne _0807784C
	movs r0, #3
	movs r1, #2
	movs r2, #3
	bl NewEkrWhiteOUT
	ldr r0, _08077894  @ 0x00000147
	movs r1, #0x80
	lsls r1, r1, #1
	movs r2, #0x78
	movs r3, #0
	bl sub_80729A4
_0807784C:
	movs r1, #0x2c
	ldrsh r0, [r4, r1]
	cmp r0, #0x36
	bne _08077874
	ldr r0, [r4, #0x5c]
	bl GetAISSubjectId
	bl SetAnimStateHidden
	movs r1, #0x32
	ldrsh r0, [r4, r1]
	movs r1, #8
	negs r1, r1
	ldr r2, _08077898  @ Tsa_DemonKingBG1
	bl sub_80776D8
	movs r0, #0
	movs r1, #0
	bl sub_807773C
_08077874:
	movs r1, #0x2c
	ldrsh r0, [r4, r1]
	cmp r0, #0x64
	bne _0807788C
	strh r5, [r4, #0x2c]
	strh r5, [r4, #0x30]
	adds r0, r4, #0
	bl Proc_Break
	ldr r0, [r4, #0x5c]
	bl sub_8077560
_0807788C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08077894: .4byte 0x00000147
_08077898: .4byte Tsa_DemonKingBG1

	THUMB_FUNC_END sub_80777E0

	THUMB_FUNC_START sub_807789C
sub_807789C: @ 0x0807789C
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	movs r7, #0
	movs r0, #0x30
	ldrsh r1, [r4, r0]
	movs r0, #0xc5
	lsls r0, r0, #1
	cmp r1, r0
	bgt _080778BC
	ldr r1, _08077A8C  @ gUnknown_02017760
	movs r2, #0
	ldrsh r0, [r1, r2]
	movs r2, #2
	ldrsh r1, [r1, r2]
	bl sub_807773C
_080778BC:
	ldr r5, _08077A8C  @ gUnknown_02017760
	ldrh r1, [r5]
	ldrh r2, [r5, #2]
	movs r0, #2
	bl BG_SetPosition
	ldr r6, _08077A90  @ gBanimBgPosMaybe
	ldrh r1, [r6]
	ldrh r0, [r5]
	adds r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldrh r2, [r6, #2]
	ldrh r0, [r5, #2]
	adds r2, r2, r0
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #0
	bl BG_SetPosition
	movs r1, #0
	ldrsh r0, [r5, r1]
	movs r2, #2
	ldrsh r1, [r5, r2]
	bl sub_8077EAC
	ldrh r0, [r6]
	ldrh r1, [r5]
	adds r0, r0, r1
	negs r0, r0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldrh r1, [r6, #2]
	ldrh r2, [r5, #2]
	adds r1, r1, r2
	negs r1, r1
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl EkrGauge_Setxy323A
	ldrh r0, [r6]
	ldrh r1, [r5]
	adds r0, r0, r1
	negs r0, r0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r1, [r6, #2]
	ldrh r2, [r5, #2]
	adds r1, r1, r2
	negs r1, r1
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	bl sub_8051B5C
	ldrh r0, [r4, #0x30]
	adds r0, #1
	strh r0, [r4, #0x30]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #2
	bne _08077950
	movs r0, #0xc
	movs r1, #0
	bl sub_8053678
	str r0, [r4, #0x54]
	movs r0, #0xa1
	lsls r0, r0, #1
	movs r1, #0x80
	lsls r1, r1, #1
	movs r2, #0x78
	movs r3, #0
	bl sub_80729A4
_08077950:
	movs r1, #0x30
	ldrsh r0, [r4, r1]
	cmp r0, #0x78
	bne _08077968
	ldr r0, [r4, #0x54]
	bl Proc_End
	movs r0, #0xd
	movs r1, #0
	bl sub_8053678
	str r0, [r4, #0x54]
_08077968:
	movs r2, #0x30
	ldrsh r0, [r4, r2]
	cmp r0, #0xb4
	bne _08077980
	ldr r0, [r4, #0x54]
	bl Proc_End
	movs r0, #0xe
	movs r1, #0
	bl sub_8053678
	str r0, [r4, #0x54]
_08077980:
	movs r1, #0x30
	ldrsh r0, [r4, r1]
	cmp r0, #0xe6
	bne _080779A6
	strh r7, [r4, #0x3a]
	strh r7, [r4, #0x3c]
	ldr r0, [r4, #0x5c]
	bl sub_8077584
	str r0, [r4, #0x64]
	ldr r1, [r4, #0x5c]
	ldrh r1, [r1, #2]
	strh r1, [r0, #0x32]
	ldr r2, [r4, #0x64]
	ldr r0, [r4, #0x5c]
	ldrh r0, [r0, #4]
	ldrh r1, [r4, #0x3a]
	subs r0, r0, r1
	strh r0, [r2, #0x3a]
_080779A6:
	movs r2, #0x30
	ldrsh r0, [r4, r2]
	cmp r0, #0xe7
	bne _080779C4
	movs r1, #0x32
	ldrsh r0, [r4, r1]
	movs r1, #8
	negs r1, r1
	ldr r2, _08077A94  @ Tsa_DemonKingBG2
	bl sub_80776D8
	movs r0, #0
	movs r1, #0
	bl sub_807773C
_080779C4:
	movs r2, #0x30
	ldrsh r0, [r4, r2]
	cmp r0, #0xe5
	ble _080779F0
	ldr r1, [r4, #0x64]
	ldr r0, [r4, #0x5c]
	ldrh r0, [r0, #2]
	strh r0, [r1, #0x32]
	ldr r1, [r4, #0x64]
	ldr r0, [r4, #0x5c]
	ldrh r0, [r0, #4]
	strh r0, [r1, #0x3a]
	ldr r2, [r4, #0x64]
	ldrh r0, [r2, #0x32]
	ldrh r1, [r5]
	subs r0, r0, r1
	strh r0, [r2, #0x32]
	ldr r2, [r4, #0x64]
	ldrh r0, [r2, #0x3a]
	ldrh r1, [r5, #2]
	subs r0, r0, r1
	strh r0, [r2, #0x3a]
_080779F0:
	movs r1, #0x30
	ldrsh r0, [r4, r1]
	cmp r0, #0xf0
	bne _08077A02
	movs r0, #0x7d
	movs r1, #0x1e
	movs r2, #0x78
	bl NewEkrWhiteOUT
_08077A02:
	movs r2, #0x30
	ldrsh r1, [r4, r2]
	ldr r0, _08077A98  @ 0x0000018B
	cmp r1, r0
	bne _08077A6E
	ldr r0, [r4, #0x64]
	bl Proc_End
	ldr r0, [r4, #0x54]
	bl Proc_End
	strh r7, [r5]
	strh r7, [r5, #2]
	ldr r0, _08077A9C  @ gBG3TilemapBuffer
	ldr r1, _08077AA0  @ 0x0000601F
	bl BG_Fill
	movs r0, #8
	bl BG_EnableSyncByMask
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	ldrh r1, [r6]
	ldrh r2, [r6, #2]
	movs r0, #0
	bl BG_SetPosition
	movs r0, #0
	movs r1, #0
	bl sub_8077EAC
	ldrh r0, [r6]
	negs r0, r0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldrh r1, [r6, #2]
	negs r1, r1
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl EkrGauge_Setxy323A
	ldrh r0, [r6]
	negs r0, r0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r1, [r6, #2]
	negs r1, r1
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	bl sub_8051B5C
_08077A6E:
	movs r0, #0x30
	ldrsh r1, [r4, r0]
	ldr r0, _08077AA4  @ 0x00000203
	cmp r1, r0
	bne _08077A86
	adds r1, r4, #0
	adds r1, #0x29
	movs r0, #1
	strb r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
_08077A86:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08077A8C: .4byte gUnknown_02017760
_08077A90: .4byte gBanimBgPosMaybe
_08077A94: .4byte Tsa_DemonKingBG2
_08077A98: .4byte 0x0000018B
_08077A9C: .4byte gBG3TilemapBuffer
_08077AA0: .4byte 0x0000601F
_08077AA4: .4byte 0x00000203

	THUMB_FUNC_END sub_807789C

	THUMB_FUNC_START sub_8077AA8
sub_8077AA8: @ 0x08077AA8
	bx lr

	THUMB_FUNC_END sub_8077AA8

	THUMB_FUNC_START NewEkrWhiteOUT
NewEkrWhiteOUT: @ 0x08077AAC
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	ldr r0, _08077AE4  @ ProcScr_ekrWhiteOUT
	movs r1, #0
	bl Proc_Start
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r4, [r0, #0x44]
	str r5, [r0, #0x48]
	str r6, [r0, #0x4c]
	ldr r2, _08077AE8  @ gLCDControlBuffer
	adds r4, r2, #0
	adds r4, #0x3c
	ldrb r3, [r4]
	subs r1, #0x21
	adds r0, r1, #0
	ands r0, r3
	strb r0, [r4]
	adds r2, #0x3d
	ldrb r0, [r2]
	ands r1, r0
	strb r1, [r2]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08077AE4: .4byte ProcScr_ekrWhiteOUT
_08077AE8: .4byte gLCDControlBuffer

	THUMB_FUNC_END NewEkrWhiteOUT

	THUMB_FUNC_START sub_8077AEC
sub_8077AEC: @ 0x08077AEC
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r7, r0, #0
	movs r0, #0x2c
	ldrsh r3, [r7, r0]
	ldr r0, [r7, #0x44]
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0x10
	bl Interpolate
	adds r6, r0, #0
	ldr r0, _08077B54  @ gPaletteBuffer
	ldr r4, _08077B58  @ gUnknown_020165C8
	movs r5, #0x80
	lsls r5, r5, #1
	adds r1, r4, #0
	adds r2, r5, #0
	bl CpuFastSet
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0x20
	adds r3, r6, #0
	bl sub_807132C
	movs r1, #0xa0
	lsls r1, r1, #0x13
	adds r0, r4, #0
	adds r2, r5, #0
	bl CpuFastSet
	bl DisablePaletteSync
	ldrh r0, [r7, #0x2c]
	adds r0, #1
	strh r0, [r7, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r1, [r7, #0x44]
	cmp r0, r1
	ble _08077B4C
	movs r0, #0
	strh r0, [r7, #0x2c]
	adds r0, r7, #0
	bl Proc_Break
_08077B4C:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08077B54: .4byte gPaletteBuffer
_08077B58: .4byte gUnknown_020165C8

	THUMB_FUNC_END sub_8077AEC

	THUMB_FUNC_START sub_8077B5C
sub_8077B5C: @ 0x08077B5C
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r0, _08077BAC  @ gPaletteBuffer
	ldr r4, _08077BB0  @ gUnknown_020165C8
	movs r5, #0x80
	lsls r5, r5, #1
	adds r1, r4, #0
	adds r2, r5, #0
	bl CpuFastSet
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0x20
	movs r3, #0x10
	bl sub_807132C
	movs r1, #0xa0
	lsls r1, r1, #0x13
	adds r0, r4, #0
	adds r2, r5, #0
	bl CpuFastSet
	bl DisablePaletteSync
	ldrh r0, [r6, #0x2c]
	adds r0, #1
	strh r0, [r6, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r1, [r6, #0x48]
	cmp r0, r1
	ble _08077BA6
	movs r0, #0
	strh r0, [r6, #0x2c]
	adds r0, r6, #0
	bl Proc_Break
_08077BA6:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08077BAC: .4byte gPaletteBuffer
_08077BB0: .4byte gUnknown_020165C8

	THUMB_FUNC_END sub_8077B5C

	THUMB_FUNC_START sub_8077BB4
sub_8077BB4: @ 0x08077BB4
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r7, r0, #0
	movs r0, #0x2c
	ldrsh r3, [r7, r0]
	ldr r0, [r7, #0x4c]
	str r0, [sp]
	movs r0, #0
	movs r1, #0x10
	movs r2, #0
	bl Interpolate
	adds r6, r0, #0
	ldr r0, _08077C1C  @ gPaletteBuffer
	ldr r4, _08077C20  @ gUnknown_020165C8
	movs r5, #0x80
	lsls r5, r5, #1
	adds r1, r4, #0
	adds r2, r5, #0
	bl CpuFastSet
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0x20
	adds r3, r6, #0
	bl sub_807132C
	movs r1, #0xa0
	lsls r1, r1, #0x13
	adds r0, r4, #0
	adds r2, r5, #0
	bl CpuFastSet
	bl DisablePaletteSync
	ldrh r0, [r7, #0x2c]
	adds r0, #1
	strh r0, [r7, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r1, [r7, #0x4c]
	cmp r0, r1
	ble _08077C14
	movs r0, #0
	strh r0, [r7, #0x2c]
	adds r0, r7, #0
	bl Proc_Break
_08077C14:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08077C1C: .4byte gPaletteBuffer
_08077C20: .4byte gUnknown_020165C8

	THUMB_FUNC_END sub_8077BB4

	THUMB_FUNC_START sub_8077C24
sub_8077C24: @ 0x08077C24
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _08077C50  @ gLCDControlBuffer
	adds r2, r1, #0
	adds r2, #0x3c
	ldrb r0, [r2]
	movs r3, #0x20
	orrs r0, r3
	strb r0, [r2]
	adds r1, #0x3d
	ldrb r0, [r1]
	orrs r0, r3
	strb r0, [r1]
	bl EnablePaletteSync
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08077C50: .4byte gLCDControlBuffer

	THUMB_FUNC_END sub_8077C24

	THUMB_FUNC_START sub_8077C54
sub_8077C54: @ 0x08077C54
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	adds r5, r0, #0
	adds r6, r1, #0
	lsls r5, r5, #0x10
	lsrs r0, r5, #0x10
	mov r9, r0
	lsls r6, r6, #0x10
	lsrs r7, r6, #0x10
	mov r8, r7
	movs r0, #2
	mov r1, r9
	mov r2, r8
	bl BG_SetPosition
	ldr r4, _08077D20  @ gBanimBgPosMaybe
	ldrh r1, [r4]
	asrs r5, r5, #0x10
	adds r1, r5, r1
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldrh r2, [r4, #2]
	asrs r6, r6, #0x10
	adds r2, r6, r2
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #0
	bl BG_SetPosition
	ldrh r0, [r4]
	adds r0, r5, r0
	negs r0, r0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldrh r1, [r4, #2]
	adds r1, r6, r1
	negs r1, r1
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl EkrGauge_Setxy323A
	ldrh r0, [r4]
	adds r0, r5, r0
	negs r0, r0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r1, [r4, #2]
	adds r1, r6, r1
	negs r1, r1
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	bl sub_8051B5C
	movs r0, #3
	mov r1, r9
	mov r2, r8
	bl BG_SetPosition
	ldr r0, _08077D24  @ gEkrXPosBase
	mov r8, r0
	ldrh r1, [r0]
	subs r1, r1, r5
	ldr r0, _08077D28  @ gUnknown_0201FB0C
	ldr r3, [r0]
	subs r1, r1, r3
	ldr r4, _08077D2C  @ gEkrYPosBase
	ldrh r2, [r4]
	subs r2, r2, r6
	mov r7, r8
	ldrh r0, [r7, #2]
	adds r5, r5, r0
	subs r5, r5, r3
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	ldrh r4, [r4, #2]
	subs r4, r4, r6
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	movs r0, #0
	bl SetEkrFrontAnimPostion
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	movs r0, #1
	adds r1, r5, #0
	adds r2, r4, #0
	bl SetEkrFrontAnimPostion
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08077D20: .4byte gBanimBgPosMaybe
_08077D24: .4byte gEkrXPosBase
_08077D28: .4byte gUnknown_0201FB0C
_08077D2C: .4byte gEkrYPosBase

	THUMB_FUNC_END sub_8077C54

	THUMB_FUNC_START sub_8077D30
sub_8077D30: @ 0x08077D30
	movs r1, #0
	str r1, [r0, #0x58]
	bx lr

	THUMB_FUNC_END sub_8077D30

	THUMB_FUNC_START sub_8077D38
sub_8077D38: @ 0x08077D38
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	mov r8, r0
	ldr r6, _08077D74  @ gUnknown_03004FA0
	ldr r1, [r6]
	ldr r5, _08077D78  @ gUnknown_0201FB0C
	ldr r0, [r5]
	subs r0, r0, r1
	ldr r4, _08077D7C  @ gUnknown_03004FA4
	ldr r1, [r4]
	negs r1, r1
	bl sub_8077EAC
	ldr r1, [r6]
	ldr r0, [r5]
	subs r0, r0, r1
	ldr r1, [r4]
	negs r1, r1
	bl sub_806FB2C
	mov r1, r8
	ldr r0, [r1, #0x58]
	adds r0, #1
	str r0, [r1, #0x58]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08077D74: .4byte gUnknown_03004FA0
_08077D78: .4byte gUnknown_0201FB0C
_08077D7C: .4byte gUnknown_03004FA4

	THUMB_FUNC_END sub_8077D38

	THUMB_FUNC_START sub_8077D80
sub_8077D80: @ 0x08077D80
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	adds r0, r2, #0
	ldr r1, _08077DB0  @ gUnknown_08801AAC
	lsls r3, r3, #2
	adds r3, r3, r1
	ldr r4, [r3]
	movs r2, #0
	ldrsh r1, [r4, r2]
	bl __modsi3
	lsls r0, r0, #1
	adds r0, #1
	lsls r0, r0, #1
	adds r0, r0, r4
	ldrh r1, [r0]
	strh r1, [r5]
	ldrh r0, [r0, #2]
	strh r0, [r6]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08077DB0: .4byte gUnknown_08801AAC

	THUMB_FUNC_END sub_8077D80

	THUMB_FUNC_START sub_8077DB4
sub_8077DB4: @ 0x08077DB4
	ldr r2, _08077DC0  @ gUnknown_03004FA0
	str r0, [r2]
	ldr r0, _08077DC4  @ gUnknown_03004FA4
	str r1, [r0]
	bx lr
	.align 2, 0
_08077DC0: .4byte gUnknown_03004FA0
_08077DC4: .4byte gUnknown_03004FA4

	THUMB_FUNC_END sub_8077DB4

	THUMB_FUNC_START sub_8077DC8
sub_8077DC8: @ 0x08077DC8
	push {r4, r5, lr}
	sub sp, #0xc
	ldr r0, _08077E4C  @ gUnknown_087F45D0
	ldr r4, _08077E50  @ gUnknown_02019790
	adds r1, r4, #0
	bl Decompress
	ldr r1, _08077E54  @ gBG1TilemapBuffer
	movs r5, #1
	str r5, [sp]
	movs r0, #0x80
	lsls r0, r0, #1
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r2, #0x20
	movs r3, #0x20
	bl sub_8070E94
	movs r0, #2
	bl BG_EnableSyncByMask
	ldr r0, _08077E58  @ gUnknown_0201FB0C
	ldr r0, [r0]
	movs r1, #0
	bl sub_8077EAC
	movs r0, #1
	bl sub_8013A84
	bl EnablePaletteSync
	add r1, sp, #8
	movs r0, #0
	strh r0, [r1]
	ldr r1, _08077E5C  @ 0x06002000
	ldr r2, _08077E60  @ 0x01000800
	add r0, sp, #8
	bl CpuSet
	movs r0, #2
	bl BG_EnableSyncByMask
	movs r0, #1
	movs r1, #0
	movs r2, #0x10
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	movs r0, #0
	str r0, [sp]
	movs r1, #1
	movs r2, #0
	movs r3, #0
	bl SetBlendTargetA
	str r5, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl SetBlendTargetB
	add sp, #0xc
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08077E4C: .4byte gUnknown_087F45D0
_08077E50: .4byte gUnknown_02019790
_08077E54: .4byte gBG1TilemapBuffer
_08077E58: .4byte gUnknown_0201FB0C
_08077E5C: .4byte 0x06002000
_08077E60: .4byte 0x01000800

	THUMB_FUNC_END sub_8077DC8

	THUMB_FUNC_START sub_8077E64
sub_8077E64: @ 0x08077E64
	movs r1, #0
	str r1, [r0, #0x58]
	str r1, [r0, #0x5c]
	bx lr

	THUMB_FUNC_END sub_8077E64

	THUMB_FUNC_START sub_8077E6C
sub_8077E6C: @ 0x08077E6C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x58]
	adds r0, #1
	str r0, [r4, #0x58]
	cmp r0, #0x18
	bne _08077E96
	ldr r0, [r4, #0x5c]
	adds r1, r4, #0
	bl sub_8077EEC
	movs r0, #0
	str r0, [r4, #0x58]
	ldr r0, [r4, #0x5c]
	adds r0, #1
	str r0, [r4, #0x5c]
	cmp r0, #0xf
	ble _08077E96
	adds r0, r4, #0
	bl Proc_Break
_08077E96:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8077E6C

	THUMB_FUNC_START sub_8077E9C
sub_8077E9C: @ 0x08077E9C
	push {lr}
	bl ClearBG1
	movs r0, #2
	bl BG_EnableSyncByMask
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8077E9C

	THUMB_FUNC_START sub_8077EAC
sub_8077EAC: @ 0x08077EAC
	push {lr}
	adds r3, r0, #0
	adds r2, r1, #0
	ldr r0, _08077EC8  @ gEkrSomeType
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #1
	beq _08077ED6
	cmp r0, #1
	bgt _08077ECC
	cmp r0, #0
	beq _08077ED2
	b _08077ED8
	.align 2, 0
_08077EC8: .4byte gEkrSomeType
_08077ECC:
	cmp r0, #2
	beq _08077ED6
	b _08077ED8
_08077ED2:
	adds r3, #8
	b _08077ED8
_08077ED6:
	adds r3, #0x20
_08077ED8:
	lsls r1, r3, #0x10
	lsrs r1, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #1
	bl BG_SetPosition
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8077EAC

	THUMB_FUNC_START sub_8077EEC
sub_8077EEC: @ 0x08077EEC
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08077F00  @ gUnknown_08801840
	bl Proc_Start
	adds r0, #0x64
	strh r4, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08077F00: .4byte gUnknown_08801840

	THUMB_FUNC_END sub_8077EEC

	THUMB_FUNC_START sub_8077F04
sub_8077F04: @ 0x08077F04
	adds r2, r0, #0
	adds r2, #0x64
	movs r1, #0
	strh r1, [r2]
	str r1, [r0, #0x58]
	bx lr

	THUMB_FUNC_END sub_8077F04

	THUMB_FUNC_START sub_8077F10
sub_8077F10: @ 0x08077F10
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	movs r4, #0
	adds r7, r5, #0
	adds r7, #0x64
	ldr r6, _08077F84  @ gUnknown_08801AB4
_08077F1C:
	adds r0, r5, #0
	adds r0, #0x64
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r1, r4, #4
	adds r0, r0, r1
	ldr r1, _08077F88  @ 0x000003FF
	ands r0, r1
	lsls r0, r0, #5
	ldr r1, _08077F8C  @ 0x06002000
	adds r0, r0, r1
	ldm r6!, {r1}
	ldr r2, [r5, #0x58]
	adds r1, r1, r2
	ldrb r1, [r1]
	bl sub_8077F9C
	adds r4, #1
	cmp r4, #5
	ble _08077F1C
	ldr r0, [r5, #0x58]
	cmp r0, #0x3e
	bgt _08077F7C
	adds r0, #1
	str r0, [r5, #0x58]
	movs r4, #0
	ldr r6, _08077F84  @ gUnknown_08801AB4
_08077F52:
	movs r1, #0
	ldrsh r0, [r7, r1]
	lsls r1, r4, #4
	adds r0, r0, r1
	ldr r1, _08077F88  @ 0x000003FF
	ands r0, r1
	lsls r0, r0, #5
	ldr r1, _08077F8C  @ 0x06002000
	adds r0, r0, r1
	ldm r6!, {r1}
	ldr r2, [r5, #0x58]
	adds r1, r1, r2
	ldrb r1, [r1]
	bl sub_8077F9C
	adds r4, #1
	cmp r4, #5
	ble _08077F52
	ldr r0, [r5, #0x58]
	cmp r0, #0x3e
	ble _08077F90
_08077F7C:
	adds r0, r5, #0
	bl Proc_Break
	b _08077F94
	.align 2, 0
_08077F84: .4byte gUnknown_08801AB4
_08077F88: .4byte 0x000003FF
_08077F8C: .4byte 0x06002000
_08077F90:
	adds r0, #1
	str r0, [r5, #0x58]
_08077F94:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8077F10

	THUMB_FUNC_START sub_8077F9C
sub_8077F9C: @ 0x08077F9C
	asrs r2, r1, #2
	lsls r2, r2, #1
	adds r0, r0, r2
	ldr r3, _08077FC0  @ gUnknown_08801858
	movs r2, #3
	ands r2, r1
	lsls r2, r2, #1
	adds r3, r2, r3
	ldrh r3, [r3]
	ldrh r1, [r0]
	bics r1, r3
	strh r1, [r0]
	ldr r3, _08077FC4  @ gUnknown_08801860
	adds r2, r2, r3
	ldrh r2, [r2]
	orrs r1, r2
	strh r1, [r0]
	bx lr
	.align 2, 0
_08077FC0: .4byte gUnknown_08801858
_08077FC4: .4byte gUnknown_08801860

	THUMB_FUNC_END sub_8077F9C

	THUMB_FUNC_START sub_8077FC8
sub_8077FC8: @ 0x08077FC8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r2, #0
	movs r2, #0xf8
	lsls r2, r2, #2
	mov r8, r2
	movs r2, #0xf8
	lsls r2, r2, #7
	mov ip, r2
	adds r4, r1, #0
	adds r5, r0, #0
	movs r7, #0xf
_08077FE2:
	ldrh r3, [r5]
	adds r0, r3, #0
	cmp r0, #0
	beq _0807802C
	movs r2, #0x1f
	ands r2, r3
	mov r0, r8
	ands r0, r3
	lsrs r1, r0, #5
	mov r0, ip
	ands r0, r3
	lsrs r0, r0, #0xa
	adds r2, r2, r6
	adds r1, r1, r6
	adds r0, r0, r6
	cmp r2, #0
	bge _08078006
	movs r2, #0
_08078006:
	cmp r1, #0
	bge _0807800C
	movs r1, #0
_0807800C:
	cmp r0, #0
	bge _08078012
	movs r0, #0
_08078012:
	cmp r2, #0x1f
	ble _08078018
	movs r2, #0x1f
_08078018:
	cmp r1, #0x1f
	ble _0807801E
	movs r1, #0x1f
_0807801E:
	cmp r0, #0x1f
	ble _08078024
	movs r0, #0x1f
_08078024:
	lsls r0, r0, #0xa
	lsls r1, r1, #5
	adds r0, r0, r1
	adds r0, r0, r2
_0807802C:
	strh r0, [r4]
	adds r4, #2
	adds r5, #2
	subs r7, #1
	cmp r7, #0
	bge _08077FE2
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8077FC8

	THUMB_FUNC_START NewEkrSelfThunder
NewEkrSelfThunder: @ 0x08078044
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08078070  @ 0x0000037E
	movs r1, #0x80
	lsls r1, r1, #1
	movs r2, #0x78
	movs r3, #0
	bl sub_80729A4
	bl ClearBG1Setup
	ldr r0, _08078074  @ ProcScr_ekrSelfThunder
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08078070: .4byte 0x0000037E
_08078074: .4byte ProcScr_ekrSelfThunder

	THUMB_FUNC_END NewEkrSelfThunder

	THUMB_FUNC_START sub_8078078
sub_8078078: @ 0x08078078
	push {lr}
	adds r1, r0, #0
	ldrh r0, [r1, #0x2c]
	adds r0, #1
	strh r0, [r1, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _08078092
	ldr r0, [r1, #0x5c]
	bl NewEkrSelfThunderBG
	b _080780A0
_08078092:
	cmp r0, #0x15
	beq _080780A0
	cmp r0, #0x46
	bne _080780A0
	adds r0, r1, #0
	bl Proc_Break
_080780A0:
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8078078

	THUMB_FUNC_START sub_80780A4
sub_80780A4: @ 0x080780A4
	push {r4, r5, lr}
	sub sp, #8
	adds r4, r0, #0
	adds r3, r1, #0
	ldr r0, _080780C0  @ gEkrSomeType
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _080780C8
	ldr r1, _080780C4  @ gUnknown_02019790
	adds r0, r3, #0
	bl LZ77UnCompWram
	b _080780D0
	.align 2, 0
_080780C0: .4byte gEkrSomeType
_080780C4: .4byte gUnknown_02019790
_080780C8:
	ldr r1, _080780F4  @ gUnknown_02019790
	adds r0, r2, #0
	bl LZ77UnCompWram
_080780D0:
	ldr r5, _080780F4  @ gUnknown_02019790
	adds r0, r4, #0
	bl GetAISSubjectId
	cmp r0, #0
	bne _080780FC
	ldr r1, _080780F8  @ gBG1TilemapBuffer
	movs r0, #1
	str r0, [sp]
	adds r0, #0xff
	str r0, [sp, #4]
	adds r0, r5, #0
	movs r2, #0x20
	movs r3, #0x14
	bl sub_8070E94
	b _08078110
	.align 2, 0
_080780F4: .4byte gUnknown_02019790
_080780F8: .4byte gBG1TilemapBuffer
_080780FC:
	ldr r1, _08078120  @ gBG1TilemapBuffer
	movs r0, #1
	str r0, [sp]
	adds r0, #0xff
	str r0, [sp, #4]
	adds r0, r5, #0
	movs r2, #0x20
	movs r3, #0x14
	bl sub_8070EC4
_08078110:
	movs r0, #2
	bl BG_EnableSyncByMask
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08078120: .4byte gBG1TilemapBuffer

	THUMB_FUNC_END sub_80780A4

	THUMB_FUNC_START NewEkrSelfThunderBG
NewEkrSelfThunderBG: @ 0x08078124
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0807813C  @ ProcScr_ekrSelfThunderBG
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	bl sub_80551B0
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807813C: .4byte ProcScr_ekrSelfThunderBG

	THUMB_FUNC_END NewEkrSelfThunderBG

	THUMB_FUNC_START sub_8078140
sub_8078140: @ 0x08078140
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r5, r0, #0
	adds r0, r1, #0
	adds r6, r2, #0
	mov r8, r3
	ldr r4, [sp, #0x14]
	movs r1, #0xc0
	lsls r1, r1, #4
	bl SomeImageStoringRoutine_SpellAnim2
	adds r0, r4, #0
	movs r1, #0x20
	bl SomePaletteStoringRoutine_SpellAnim2
	ldr r0, [r5, #0x5c]
	adds r1, r6, #0
	mov r2, r8
	bl sub_80780A4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8078140

	THUMB_FUNC_START sub_8078174
sub_8078174: @ 0x08078174
	push {r4, lr}
	sub sp, #4
	movs r1, #0
	str r1, [r0, #0x44]
	ldr r4, _08078198  @ gUnknown_088018A0
	ldr r1, [r4]
	strh r1, [r0, #0x2c]
	ldr r1, [r4, #4]
	ldr r2, [r4, #8]
	ldr r3, [r4, #0xc]
	ldr r4, [r4, #0x10]
	str r4, [sp]
	bl sub_8078140
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08078198: .4byte gUnknown_088018A0

	THUMB_FUNC_END sub_8078174

	THUMB_FUNC_START sub_807819C
sub_807819C: @ 0x0807819C
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r4, r0, #0
	movs r1, #0x2c
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _08078206
	ldr r1, [r4, #0x44]
	adds r1, #1
	str r1, [r4, #0x44]
	ldr r6, _080781DC  @ gUnknown_088018A0
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r5, r0, #2
	adds r0, r5, r6
	ldr r0, [r0]
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #1
	negs r1, r1
	cmp r0, r1
	bne _080781E0
	bl ClearBG1
	bl sub_805526C
	adds r0, r4, #0
	bl Proc_Break
	b _0807820C
	.align 2, 0
_080781DC: .4byte gUnknown_088018A0
_080781E0:
	adds r0, r6, #4
	adds r0, r5, r0
	ldr r1, [r0]
	adds r0, r6, #0
	adds r0, #8
	adds r0, r5, r0
	ldr r2, [r0]
	adds r0, r6, #0
	adds r0, #0xc
	adds r0, r5, r0
	ldr r3, [r0]
	adds r0, r6, #0
	adds r0, #0x10
	adds r0, r5, r0
	ldr r0, [r0]
	str r0, [sp]
	adds r0, r4, #0
	bl sub_8078140
_08078206:
	ldrh r0, [r4, #0x2c]
	subs r0, #1
	strh r0, [r4, #0x2c]
_0807820C:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_807819C
