	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	@ Everything related to (non-map) battle animations
	@ Needs further splitting

	THUMB_FUNC_START sub_805AE58
sub_805AE58: @ 0x0805AE58
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x18
	adds r7, r0, #0
	movs r4, #0
	mov sl, r4
	ldr r0, _0805AE9C  @ gUnknown_085B9D6C
	movs r2, #0xc
	ldrsh r1, [r7, r2]
	lsls r2, r1, #3
	adds r2, r2, r0
	ldr r2, [r2]
	str r2, [sp, #0x10]
	lsls r1, r1, #1
	adds r1, #1
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r1, [r1]
	str r1, [sp, #0x14]
	movs r0, #0
	bl sub_80559B0
	movs r1, #0xc
	ldrsh r0, [r7, r1]
	cmp r0, #4
	bhi _0805AEEC
	lsls r0, r0, #2
	ldr r1, _0805AEA0  @ _0805AEA4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0805AE9C: .4byte gUnknown_085B9D6C
_0805AEA0: .4byte _0805AEA4
_0805AEA4: @ jump table
	.4byte _0805AEB8 @ case 0
	.4byte _0805AEC0 @ case 1
	.4byte _0805AED8 @ case 2
	.4byte _0805AEEC @ case 3
	.4byte _0805AEB8 @ case 4
_0805AEB8:
	movs r4, #0x21
	movs r2, #0x30
	mov sl, r2
	b _0805AF0C
_0805AEC0:
	movs r4, #0x1d
	movs r0, #0x30
	mov sl, r0
	ldr r0, _0805AED4  @ gEkrInitPosReal
	ldr r0, [r0]
	movs r5, #4
	negs r5, r5
_0805AECE:
	cmp r0, #1
	bne _0805AF0E
	b _0805AF0C
	.align 2, 0
_0805AED4: .4byte gEkrInitPosReal
_0805AED8:
	movs r4, #3
	movs r1, #0x30
	mov sl, r1
	ldr r0, _0805AEE8  @ gEkrInitPosReal
	ldr r0, [r0]
	movs r5, #0x1e
	negs r5, r5
	b _0805AECE
	.align 2, 0
_0805AEE8: .4byte gEkrInitPosReal
_0805AEEC:
	movs r2, #0
	ldrsh r0, [r7, r2]
	movs r1, #1
	negs r1, r1
	cmp r0, r1
	beq _0805AEFE
	movs r4, #0x27
	movs r0, #3
	mov sl, r0
_0805AEFE:
	movs r2, #6
	ldrsh r0, [r7, r2]
	cmp r0, r1
	beq _0805AF0C
	movs r4, #3
	movs r0, #0x2a
	mov sl, r0
_0805AF0C:
	movs r5, #0
_0805AF0E:
	movs r1, #1
	negs r1, r1
	mov r9, r1
	lsls r2, r4, #1
	ldr r4, _0805AF94  @ gTmA_Banim + 0x6B4
	adds r2, r2, r4
	movs r0, #0xf
	mov r8, r0
	str r0, [sp]
	movs r6, #5
	str r6, [sp, #4]
	movs r1, #2
	ldrsh r0, [r7, r1]
	str r0, [sp, #8]
	movs r1, #4
	ldrsh r0, [r7, r1]
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x10]
	mov r1, r9
	movs r3, #0x42
	bl EfxTmCpyExt
	mov r0, sl
	lsls r2, r0, #1
	adds r2, r2, r4
	mov r1, r8
	str r1, [sp]
	str r6, [sp, #4]
	movs r1, #8
	ldrsh r0, [r7, r1]
	str r0, [sp, #8]
	movs r1, #0xa
	ldrsh r0, [r7, r1]
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x14]
	mov r1, r9
	movs r3, #0x42
	bl EfxTmCpyExt
	lsls r0, r5, #1
	adds r4, r4, r0
	ldr r2, _0805AF98  @ 0xFFFFFA96
	adds r4, r4, r2
	ldr r2, _0805AF9C  @ gBG2TilemapBuffer
	movs r0, #0x20
	str r0, [sp]
	movs r0, #0x14
	str r0, [sp, #4]
	mov r0, r9
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	adds r0, r4, #0
	movs r1, #0x42
	movs r3, #0x20
	bl EfxTmCpyExt
	movs r0, #4
	bl BG_EnableSyncByMask
	add sp, #0x18
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805AF94: .4byte gTmA_Banim + 0x6B4
_0805AF98: .4byte 0xFFFFFA96
_0805AF9C: .4byte gBG2TilemapBuffer

	THUMB_FUNC_END sub_805AE58

	THUMB_FUNC_START sub_805AFA0
sub_805AFA0: @ 0x0805AFA0
	push {lr}
	sub sp, #0x10
	lsls r1, r1, #0x10
	lsrs r3, r1, #0x10
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #4
	bhi _0805AFE8
	lsls r0, r0, #2
	ldr r1, _0805AFBC  @ _0805AFC0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0805AFBC: .4byte _0805AFC0
_0805AFC0: @ jump table
	.4byte _0805AFD4 @ case 0
	.4byte _0805AFDE @ case 1
	.4byte _0805AFE8 @ case 2
	.4byte _0805AFE8 @ case 3
	.4byte _0805AFD4 @ case 4
_0805AFD4:
	movs r2, #0x30
	cmp r3, #0
	bne _0805AFF0
	movs r2, #0x21
	b _0805AFF0
_0805AFDE:
	movs r2, #0x30
	cmp r3, #0
	bne _0805AFF0
	movs r2, #0x1d
	b _0805AFF0
_0805AFE8:
	movs r2, #0x30
	cmp r3, #0
	bne _0805AFF0
	movs r2, #3
_0805AFF0:
	ldr r0, _0805B014  @ gUnknown_080DAF60
	movs r1, #1
	negs r1, r1
	lsls r2, r2, #1
	ldr r3, _0805B018  @ gTmA_Banim + 0x6B4
	adds r2, r2, r3
	movs r3, #0xf
	str r3, [sp]
	movs r3, #5
	str r3, [sp, #4]
	str r1, [sp, #8]
	str r1, [sp, #0xc]
	movs r3, #0x42
	bl EfxTmCpyExt
	add sp, #0x10
	pop {r0}
	bx r0
	.align 2, 0
_0805B014: .4byte gUnknown_080DAF60
_0805B018: .4byte gTmA_Banim + 0x6B4

	THUMB_FUNC_END sub_805AFA0

.align 2, 0
