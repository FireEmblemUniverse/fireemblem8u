	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	THUMB_FUNC_START NewEkrUnitMainMini
NewEkrUnitMainMini: @ 0x0805AA00
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, _0805AA24  @ ProcScr_ekrUnitMainMini
	movs r1, #4
	bl Proc_Start
	adds r5, r0, #0
	adds r0, r4, #0
	bl sub_805A60C
	str r4, [r5, #0x5c]
	str r5, [r4, #0x34]
	movs r0, #1
	strb r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805AA24: .4byte ProcScr_ekrUnitMainMini

	THUMB_FUNC_END NewEkrUnitMainMini

	THUMB_FUNC_START sub_805AA28
sub_805AA28: @ 0x0805AA28
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x14]
	bl AnimDelete
	ldr r0, [r4, #0x18]
	bl AnimDelete
	movs r0, #0
	str r0, [r4, #0x14]
	str r0, [r4, #0x18]
	ldr r0, [r4, #0x34]
	bl Proc_End
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_805AA28

	THUMB_FUNC_START EkrUnitMainMiniMain
EkrUnitMainMiniMain: @ 0x0805AA4C
	push {r4, lr}
	ldr r4, [r0, #0x5c]
	ldr r1, [r4, #0x14]
	adds r0, r4, #0
	bl sub_805A3DC
	ldr r1, [r4, #0x18]
	adds r0, r4, #0
	bl sub_805A3DC
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END EkrUnitMainMiniMain

	THUMB_FUNC_START sub_805AA68
sub_805AA68: @ 0x0805AA68
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	sub sp, #0xc
	adds r6, r0, #0
	movs r0, #0
	ldrsh r1, [r6, r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	ldr r2, _0805AAD0  @ battle_terrain_table
	adds r0, r0, r2
	mov r8, r0
	movs r0, #6
	ldrsh r1, [r6, r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r5, r0, r2
	movs r1, #0
	ldrsh r0, [r6, r1]
	movs r4, #1
	negs r4, r4
	cmp r0, r4
	beq _0805AAA6
	mov r2, r8
	ldr r0, [r2, #0xc]
	ldr r1, [r6, #0x20]
	bl LZ77UnCompWram
_0805AAA6:
	movs r1, #6
	ldrsh r0, [r6, r1]
	cmp r0, r4
	beq _0805AABC
	ldr r0, [r5, #0xc]
	ldr r1, [r6, #0x20]
	movs r2, #0x80
	lsls r2, r2, #5
	adds r1, r1, r2
	bl LZ77UnCompWram
_0805AABC:
	movs r1, #0xc
	ldrsh r0, [r6, r1]
	cmp r0, #3
	bgt _0805AAD4
	cmp r0, #1
	bge _0805AAE2
	cmp r0, #0
	beq _0805AAD8
	b _0805AAE2
	.align 2, 0
_0805AAD0: .4byte battle_terrain_table
_0805AAD4:
	cmp r0, #4
	bne _0805AAE2
_0805AAD8:
	ldr r3, [r6, #0x20]
	movs r2, #0x80
	lsls r2, r2, #5
	adds r7, r3, r2
	b _0805AAF0
_0805AAE2:
	ldr r0, [r6, #0x20]
	movs r1, #0x80
	lsls r1, r1, #4
	adds r3, r0, r1
	movs r2, #0xc0
	lsls r2, r2, #5
	adds r7, r0, r2
_0805AAF0:
	mov r0, r8
	ldr r0, [r0, #0x10]
	mov r8, r0
	ldr r5, [r5, #0x10]
	mov r9, r5
	movs r1, #0xe
	ldrsh r4, [r6, r1]
	movs r0, #1
	negs r0, r0
	cmp r4, r0
	beq _0805AB74
	cmp r4, r0
	blt _0805ABD4
	cmp r4, #3
	bgt _0805ABD4
	movs r2, #4
	ldrsh r0, [r6, r2]
	adds r0, #0x40
	lsls r0, r0, #5
	movs r4, #0xc0
	lsls r4, r4, #0x13
	adds r0, r0, r4
	ldr r1, [r6, #0x1c]
	adds r1, r1, r0
	movs r5, #0x80
	lsls r5, r5, #4
	adds r0, r3, #0
	adds r2, r5, #0
	bl RegisterDataMove
	movs r1, #0xa
	ldrsh r0, [r6, r1]
	lsls r0, r0, #5
	adds r0, r0, r4
	ldr r1, [r6, #0x1c]
	adds r1, r1, r0
	adds r0, r7, #0
	adds r2, r5, #0
	bl RegisterDataMove
	movs r2, #2
	ldrsh r1, [r6, r2]
	lsls r1, r1, #5
	ldr r4, _0805AB70  @ gPaletteBuffer
	adds r1, r1, r4
	mov r0, r8
	movs r2, #8
	bl CpuFastSet
	movs r0, #8
	ldrsh r1, [r6, r0]
	lsls r1, r1, #5
	adds r1, r1, r4
	mov r0, r9
	movs r2, #8
	bl CpuFastSet
	bl EnablePaletteSync
	adds r0, r6, #0
	bl sub_805AE58
	b _0805ABD4
	.align 2, 0
_0805AB70: .4byte gPaletteBuffer
_0805AB74:
	movs r1, #0
	ldrsh r0, [r6, r1]
	cmp r0, r4
	beq _0805ABA2
	movs r2, #4
	ldrsh r0, [r6, r2]
	lsls r0, r0, #5
	ldr r1, [r6, #0x1c]
	adds r1, r1, r0
	movs r2, #0x80
	lsls r2, r2, #4
	adds r0, r3, #0
	bl RegisterDataMove
	movs r0, #2
	ldrsh r1, [r6, r0]
	lsls r1, r1, #5
	ldr r0, _0805ABEC  @ pPalette10Buffer
	adds r1, r1, r0
	mov r0, r8
	movs r2, #8
	bl CpuFastSet
_0805ABA2:
	movs r1, #6
	ldrsh r0, [r6, r1]
	cmp r0, r4
	beq _0805ABD0
	movs r2, #0xa
	ldrsh r0, [r6, r2]
	lsls r0, r0, #5
	ldr r1, [r6, #0x1c]
	adds r1, r1, r0
	movs r2, #0x80
	lsls r2, r2, #4
	adds r0, r7, #0
	bl RegisterDataMove
	movs r0, #8
	ldrsh r1, [r6, r0]
	lsls r1, r1, #5
	ldr r0, _0805ABEC  @ pPalette10Buffer
	adds r1, r1, r0
	mov r0, r9
	movs r2, #8
	bl CpuFastSet
_0805ABD0:
	bl EnablePaletteSync
_0805ABD4:
	ldrh r0, [r6, #0xe]
	adds r0, #1
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #4
	bls _0805ABE2
	b _0805AE02
_0805ABE2:
	lsls r0, r0, #2
	ldr r1, _0805ABF0  @ _0805ABF4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0805ABEC: .4byte pPalette10Buffer
_0805ABF0: .4byte _0805ABF4
_0805ABF4: @ jump table
	.4byte _0805AC28 @ case 0
	.4byte _0805AC08 @ case 1
	.4byte _0805AC10 @ case 2
	.4byte _0805AC18 @ case 3
	.4byte _0805AC20 @ case 4
_0805AC08:
	movs r0, #1
	bl BG_EnableSyncByMask
	b _0805AE02
_0805AC10:
	movs r0, #2
	bl BG_EnableSyncByMask
	b _0805AE02
_0805AC18:
	movs r0, #4
	bl BG_EnableSyncByMask
	b _0805AE02
_0805AC20:
	movs r0, #8
	bl BG_EnableSyncByMask
	b _0805AE02
_0805AC28:
	movs r0, #0
	str r0, [r6, #0x14]
	str r0, [r6, #0x18]
	movs r2, #6
	ldrsh r1, [r6, r2]
	subs r0, #1
	cmp r1, r0
	beq _0805AD16
	movs r1, #0xc
	ldrsh r0, [r6, r1]
	cmp r0, #4
	bhi _0805AD16
	lsls r0, r0, #2
	ldr r1, _0805AC4C  @ _0805AC50
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0805AC4C: .4byte _0805AC50
_0805AC50: @ jump table
	.4byte _0805AC64 @ case 0
	.4byte _0805AC90 @ case 1
	.4byte _0805ACBC @ case 2
	.4byte _0805ACE8 @ case 3
	.4byte _0805AC64 @ case 4
_0805AC64:
	movs r2, #8
	ldrsh r0, [r6, r2]
	lsls r0, r0, #0xc
	ldrh r1, [r6, #0xa]
	orrs r0, r1
	movs r2, #0xc0
	lsls r2, r2, #4
	adds r1, r2, #0
	orrs r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r2, _0805AC8C  @ gUnknown_085C73B8
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	movs r0, #4
	str r0, [sp, #8]
	movs r0, #0xa8
	b _0805AD0C
	.align 2, 0
_0805AC8C: .4byte gUnknown_085C73B8
_0805AC90:
	movs r1, #8
	ldrsh r0, [r6, r1]
	lsls r0, r0, #0xc
	ldrh r1, [r6, #0xa]
	orrs r0, r1
	movs r2, #0xc0
	lsls r2, r2, #4
	adds r1, r2, #0
	orrs r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r2, _0805ACB8  @ gUnknown_085C72AC
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	movs r0, #4
	str r0, [sp, #8]
	movs r0, #0xb0
	b _0805AD0C
	.align 2, 0
_0805ACB8: .4byte gUnknown_085C72AC
_0805ACBC:
	movs r1, #8
	ldrsh r0, [r6, r1]
	lsls r0, r0, #0xc
	ldrh r1, [r6, #0xa]
	orrs r0, r1
	movs r2, #0xc0
	lsls r2, r2, #4
	adds r1, r2, #0
	orrs r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r2, _0805ACE4  @ gUnknown_085C72AC
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	movs r0, #4
	str r0, [sp, #8]
	movs r0, #0xb0
	b _0805AD0C
	.align 2, 0
_0805ACE4: .4byte gUnknown_085C72AC
_0805ACE8:
	movs r1, #8
	ldrsh r0, [r6, r1]
	lsls r0, r0, #0xc
	ldrh r1, [r6, #0xa]
	orrs r0, r1
	movs r2, #0xc0
	lsls r2, r2, #4
	adds r1, r2, #0
	orrs r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r2, _0805AD34  @ gUnknown_085C72AC
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	movs r0, #4
	str r0, [sp, #8]
	movs r0, #0x80
_0805AD0C:
	movs r1, #0x68
	movs r3, #2
	bl NewEkrsubAnimeEmulator
	str r0, [r6, #0x18]
_0805AD16:
	movs r0, #0
	ldrsh r1, [r6, r0]
	movs r0, #1
	negs r0, r0
	cmp r1, r0
	beq _0805AE02
	movs r1, #0xc
	ldrsh r0, [r6, r1]
	cmp r0, #4
	bhi _0805AE02
	lsls r0, r0, #2
	ldr r1, _0805AD38  @ _0805AD3C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0805AD34: .4byte gUnknown_085C72AC
_0805AD38: .4byte _0805AD3C
_0805AD3C: @ jump table
	.4byte _0805AD50 @ case 0
	.4byte _0805AD7C @ case 1
	.4byte _0805ADA8 @ case 2
	.4byte _0805ADD4 @ case 3
	.4byte _0805AD50 @ case 4
_0805AD50:
	movs r2, #2
	ldrsh r0, [r6, r2]
	lsls r0, r0, #0xc
	ldrh r1, [r6, #4]
	orrs r0, r1
	movs r2, #0xc0
	lsls r2, r2, #4
	adds r1, r2, #0
	orrs r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r2, _0805AD78  @ gUnknown_085C7438
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	movs r0, #4
	str r0, [sp, #8]
	movs r0, #0x48
	b _0805ADF8
	.align 2, 0
_0805AD78: .4byte gUnknown_085C7438
_0805AD7C:
	movs r1, #2
	ldrsh r0, [r6, r1]
	lsls r0, r0, #0xc
	ldrh r1, [r6, #4]
	orrs r0, r1
	movs r2, #0xc0
	lsls r2, r2, #4
	adds r1, r2, #0
	orrs r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r2, _0805ADA4  @ gUnknown_085C7338
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	movs r0, #4
	str r0, [sp, #8]
	movs r0, #0x20
	b _0805ADF8
	.align 2, 0
_0805ADA4: .4byte gUnknown_085C7338
_0805ADA8:
	movs r1, #2
	ldrsh r0, [r6, r1]
	lsls r0, r0, #0xc
	ldrh r1, [r6, #4]
	orrs r0, r1
	movs r2, #0xc0
	lsls r2, r2, #4
	adds r1, r2, #0
	orrs r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r2, _0805ADD0  @ gUnknown_085C7338
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	movs r0, #4
	str r0, [sp, #8]
	movs r0, #0x40
	b _0805ADF8
	.align 2, 0
_0805ADD0: .4byte gUnknown_085C7338
_0805ADD4:
	movs r1, #2
	ldrsh r0, [r6, r1]
	lsls r0, r0, #0xc
	ldrh r1, [r6, #4]
	orrs r0, r1
	movs r2, #0xc0
	lsls r2, r2, #4
	adds r1, r2, #0
	orrs r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r2, _0805AE10  @ gUnknown_085C7438
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	movs r0, #4
	str r0, [sp, #8]
	movs r0, #0x78
_0805ADF8:
	movs r1, #0x68
	movs r3, #2
	bl NewEkrsubAnimeEmulator
	str r0, [r6, #0x14]
_0805AE02:
	add sp, #0xc
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805AE10: .4byte gUnknown_085C7438

	THUMB_FUNC_END sub_805AA68

.align 2, 0
