	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	@ The nice phase changing animation thing and related procs/functions

	THUMB_FUNC_START sub_801EC64
sub_801EC64: @ 0x0801EC64
	push {lr}
	ldr r1, _0801EC94  @ 0x04000050
	ldr r2, _0801EC98  @ 0x00003C42
	adds r0, r2, #0
	strh r0, [r1]
	ldr r2, _0801EC9C  @ 0x04000052
	ldr r1, _0801ECA0  @ gUnknown_0202BCB0
	adds r0, r1, #0
	adds r0, #0x3a
	ldrb r0, [r0]
	strb r0, [r2]
	adds r2, #1
	adds r1, #0x3b
	ldrb r0, [r1]
	strb r0, [r2]
	movs r0, #0x48
	bl sub_8001308
	ldr r0, _0801ECA4  @ sub_801ECA8
	bl SetInterrupt_LCDVCountMatch
	pop {r0}
	bx r0
	.align 2, 0
_0801EC94: .4byte 0x04000050
_0801EC98: .4byte 0x00003C42
_0801EC9C: .4byte 0x04000052
_0801ECA0: .4byte gUnknown_0202BCB0
_0801ECA4: .4byte sub_801ECA8

	THUMB_FUNC_END sub_801EC64

	THUMB_FUNC_START sub_801ECA8
sub_801ECA8: @ 0x0801ECA8
	push {lr}
	ldr r1, _0801ECD8  @ 0x04000050
	ldr r2, _0801ECDC  @ 0x00003E41
	adds r0, r2, #0
	strh r0, [r1]
	ldr r2, _0801ECE0  @ 0x04000052
	ldr r1, _0801ECE4  @ gUnknown_0202BCB0
	adds r0, r1, #0
	adds r0, #0x38
	ldrb r0, [r0]
	strb r0, [r2]
	adds r2, #1
	adds r1, #0x39
	ldrb r0, [r1]
	strb r0, [r2]
	movs r0, #0x60
	bl sub_8001308
	ldr r0, _0801ECE8  @ sub_801ECEC
	bl SetInterrupt_LCDVCountMatch
	pop {r0}
	bx r0
	.align 2, 0
_0801ECD8: .4byte 0x04000050
_0801ECDC: .4byte 0x00003E41
_0801ECE0: .4byte 0x04000052
_0801ECE4: .4byte gUnknown_0202BCB0
_0801ECE8: .4byte sub_801ECEC

	THUMB_FUNC_END sub_801ECA8

	THUMB_FUNC_START sub_801ECEC
sub_801ECEC: @ 0x0801ECEC
	push {lr}
	ldr r1, _0801ED1C  @ 0x04000050
	ldr r2, _0801ED20  @ 0x00003C42
	adds r0, r2, #0
	strh r0, [r1]
	ldr r2, _0801ED24  @ 0x04000052
	ldr r1, _0801ED28  @ gUnknown_0202BCB0
	adds r0, r1, #0
	adds r0, #0x3a
	ldrb r0, [r0]
	strb r0, [r2]
	adds r2, #1
	adds r1, #0x3b
	ldrb r0, [r1]
	strb r0, [r2]
	movs r0, #0
	bl sub_8001308
	ldr r0, _0801ED2C  @ sub_801EC64
	bl SetInterrupt_LCDVCountMatch
	pop {r0}
	bx r0
	.align 2, 0
_0801ED1C: .4byte 0x04000050
_0801ED20: .4byte 0x00003C42
_0801ED24: .4byte 0x04000052
_0801ED28: .4byte gUnknown_0202BCB0
_0801ED2C: .4byte sub_801EC64

	THUMB_FUNC_END sub_801ECEC

	THUMB_FUNC_START sub_801ED30
sub_801ED30: @ 0x0801ED30
	push {lr}
	ldr r2, _0801ED50  @ gUnknown_02022EE8
	movs r1, #0
	ldr r0, _0801ED54  @ 0x00005140
	adds r3, r0, #0
_0801ED3A:
	adds r0, r1, r3
	strh r0, [r2]
	adds r2, #2
	adds r1, #1
	cmp r1, #0x5f
	ble _0801ED3A
	movs r0, #1
	bl BG_EnableSyncByMask
	pop {r0}
	bx r0
	.align 2, 0
_0801ED50: .4byte gUnknown_02022EE8
_0801ED54: .4byte 0x00005140

	THUMB_FUNC_END sub_801ED30

	THUMB_FUNC_START sub_801ED58
sub_801ED58: @ 0x0801ED58
	push {r4, r5, lr}
	adds r5, r0, #0
	bl Sound_GetCurrentSong
	adds r4, r0, #0
	bl GetCurrentMapMusicIndex
	cmp r4, r0
	beq _0801ED70
	movs r0, #4
	bl Sound_FadeOut800231C
_0801ED70:
	ldr r0, _0801ED90  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0801ED82
	movs r0, #0x73
	bl m4aSongNumStart
_0801ED82:
	adds r1, r5, #0
	adds r1, #0x4c
	movs r0, #0xf
	strh r0, [r1]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0801ED90: .4byte gRAMChapterData

	THUMB_FUNC_END sub_801ED58

	THUMB_FUNC_START sub_801ED94
sub_801ED94: @ 0x0801ED94
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	bl CheckSomethingSomewhere
	cmp r0, #0
	beq _0801EDAA
	movs r2, #0
	movs r1, #0x14
	negs r1, r1
	b _0801EDB2
_0801EDAA:
	movs r2, #8
	negs r2, r2
	movs r1, #0x1c
	negs r1, r1
_0801EDB2:
	adds r4, r5, #0
	adds r4, #0x4c
	movs r0, #0
	ldrsh r3, [r4, r0]
	movs r0, #0x10
	str r0, [sp]
	movs r0, #5
	bl sub_8012DCC
	adds r1, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r0, #0
	movs r2, #0
	bl BG_SetPosition
	ldr r1, _0801EE04  @ gUnknown_0202BCB0
	adds r2, r1, #0
	adds r2, #0x38
	ldrb r0, [r2]
	adds r0, #1
	strb r0, [r2]
	adds r1, #0x39
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	ldrh r0, [r4]
	subs r0, #1
	strh r0, [r4]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _0801EDFC
	movs r0, #0xf
	strh r0, [r4]
	adds r0, r5, #0
	bl Proc_Break
_0801EDFC:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0801EE04: .4byte gUnknown_0202BCB0

	THUMB_FUNC_END sub_801ED94

	THUMB_FUNC_START sub_801EE08
sub_801EE08: @ 0x0801EE08
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	bl CheckSomethingSomewhere
	cmp r0, #0
	beq _0801EE20
	movs r2, #0x14
	negs r2, r2
	movs r1, #0x30
	negs r1, r1
	b _0801EE28
_0801EE20:
	movs r2, #0x1c
	negs r2, r2
	movs r1, #0x38
	negs r1, r1
_0801EE28:
	adds r4, r5, #0
	adds r4, #0x4c
	movs r0, #0
	ldrsh r3, [r4, r0]
	movs r0, #0x10
	str r0, [sp]
	movs r0, #2
	bl sub_8012DCC
	adds r1, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r0, #0
	movs r2, #0
	bl BG_SetPosition
	ldr r1, _0801EE7C  @ gUnknown_0202BCB0
	adds r2, r1, #0
	adds r2, #0x38
	ldrb r0, [r2]
	subs r0, #1
	strb r0, [r2]
	adds r1, #0x39
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldrh r0, [r4]
	subs r0, #1
	strh r0, [r4]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _0801EE72
	movs r0, #0xf
	strh r0, [r4]
	adds r0, r5, #0
	bl Proc_Break
_0801EE72:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0801EE7C: .4byte gUnknown_0202BCB0

	THUMB_FUNC_END sub_801EE08

	THUMB_FUNC_START sub_801EE80
sub_801EE80: @ 0x0801EE80
	push {lr}
	ldr r0, _0801EE94  @ gBG0TilemapBuffer
	movs r1, #0
	bl BG_Fill
	movs r0, #1
	bl BG_EnableSyncByMask
	pop {r0}
	bx r0
	.align 2, 0
_0801EE94: .4byte gBG0TilemapBuffer

	THUMB_FUNC_END sub_801EE80

	THUMB_FUNC_START sub_801EE98
sub_801EE98: @ 0x0801EE98
	adds r1, r0, #0
	adds r1, #0x4c
	movs r2, #0
	strh r2, [r1]
	adds r0, #0x4e
	strh r2, [r0]
	bx lr

	THUMB_FUNC_END sub_801EE98

	THUMB_FUNC_START sub_801EEA8
sub_801EEA8: @ 0x0801EEA8
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r6, r0, #0
	movs r0, #0x4e
	adds r0, r0, r6
	mov r8, r0
	movs r1, #0
	ldrsh r5, [r0, r1]
	cmp r5, #1
	beq _0801EF02
	cmp r5, #1
	bgt _0801EECC
	cmp r5, #0
	beq _0801EED2
	b _0801EF58
_0801EECC:
	cmp r5, #2
	beq _0801EF28
	b _0801EF58
_0801EED2:
	movs r2, #0x80
	lsls r2, r2, #1
	adds r4, r6, #0
	adds r4, #0x4c
	movs r0, #0
	ldrsh r3, [r4, r0]
	movs r0, #0xf
	str r0, [sp]
	movs r0, #4
	movs r1, #0x10
	bl sub_8012DCC
	adds r7, r0, #0
	ldrh r1, [r4]
	movs r2, #0
	ldrsh r0, [r4, r2]
	cmp r0, #0xe
	ble _0801EF4C
	strh r5, [r4]
	mov r3, r8
	ldrh r0, [r3]
	adds r0, #1
	strh r0, [r3]
	b _0801EF58
_0801EF02:
	movs r7, #0x80
	lsls r7, r7, #1
	adds r1, r6, #0
	adds r1, #0x4c
	ldrh r2, [r1]
	movs r3, #0
	ldrsh r0, [r1, r3]
	cmp r0, #0x1d
	bgt _0801EF1A
	adds r0, r2, #1
	strh r0, [r1]
	b _0801EF58
_0801EF1A:
	movs r0, #0
	strh r0, [r1]
	mov r1, r8
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	b _0801EF58
_0801EF28:
	movs r1, #0x80
	lsls r1, r1, #1
	adds r4, r6, #0
	adds r4, #0x4c
	movs r2, #0
	ldrsh r3, [r4, r2]
	movs r0, #0xf
	str r0, [sp]
	movs r0, #2
	movs r2, #0x10
	bl sub_8012DCC
	adds r7, r0, #0
	ldrh r1, [r4]
	movs r3, #0
	ldrsh r0, [r4, r3]
	cmp r0, #0xe
	bgt _0801EF52
_0801EF4C:
	adds r0, r1, #1
	strh r0, [r4]
	b _0801EF58
_0801EF52:
	adds r0, r6, #0
	bl Proc_Break
_0801EF58:
	ldr r4, _0801EFE0  @ gSinLookup
	movs r0, #0x80
	adds r0, r0, r4
	mov r9, r0
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r0, r0, #4
	movs r2, #0x80
	lsls r2, r2, #1
	mov r8, r2
	mov r1, r8
	bl Div
	adds r6, r0, #0
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	movs r3, #0
	ldrsh r0, [r4, r3]
	negs r0, r0
	lsls r0, r0, #4
	adds r1, r7, #0
	bl Div
	adds r5, r0, #0
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	movs r1, #0
	ldrsh r0, [r4, r1]
	lsls r0, r0, #4
	mov r1, r8
	bl Div
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	mov r2, r9
	movs r3, #0
	ldrsh r0, [r2, r3]
	lsls r0, r0, #4
	adds r1, r7, #0
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	movs r0, #0
	adds r1, r6, #0
	adds r2, r5, #0
	adds r3, r4, #0
	bl WriteOAMRotScaleData
	ldr r3, _0801EFE4  @ gUnknown_0859AEC8
	movs r0, #0x98
	lsls r0, r0, #6
	str r0, [sp]
	movs r0, #2
	movs r1, #0
	movs r2, #0x44
	bl PutSpriteExt
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801EFE0: .4byte gSinLookup
_0801EFE4: .4byte gUnknown_0859AEC8

	THUMB_FUNC_END sub_801EEA8

	THUMB_FUNC_START sub_801EFE8
sub_801EFE8: @ 0x0801EFE8
	adds r0, #0x4c
	movs r1, #4
	strh r1, [r0]
	bx lr

	THUMB_FUNC_END sub_801EFE8

	THUMB_FUNC_START sub_801EFF0
sub_801EFF0: @ 0x0801EFF0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov sl, r0
	movs r6, #9
	movs r0, #0x4c
	add r0, sl
	mov r8, r0
	ldr r1, _0801F0C0  @ gBG1TilemapBuffer
	mov ip, r1
_0801F00A:
	movs r2, #0xe
	str r2, [sp]
	lsls r0, r6, #1
	lsls r2, r6, #6
	subs r3, r6, #1
	mov r9, r3
	adds r0, #1
	lsls r1, r0, #5
	adds r1, #0x1d
	lsls r0, r0, #6
	add r0, ip
	adds r5, r0, #0
	adds r5, #0x38
	adds r2, #0x1d
	lsls r0, r6, #7
	add r0, ip
	adds r4, r0, #0
	adds r4, #0x38
	lsls r2, r2, #1
	add r2, ip
	lsls r1, r1, #1
	add r1, ip
_0801F036:
	mov r7, r8
	movs r3, #0
	ldrsh r0, [r7, r3]
	ldr r7, [sp]
	subs r0, r7, r0
	adds r0, #0x15
	subs r3, r0, r6
	cmp r3, #0x10
	ble _0801F04A
	movs r3, #0x10
_0801F04A:
	cmp r3, #0
	bge _0801F050
	movs r3, #0
_0801F050:
	movs r0, #0x10
	subs r3, r0, r3
	movs r0, #0xfe
	ands r3, r0
	movs r7, #0xa2
	lsls r7, r7, #7
	adds r0, r7, #0
	adds r0, r3, r0
	strh r0, [r4]
	adds r7, #1
	adds r0, r7, #0
	adds r0, r3, r0
	strh r0, [r2]
	adds r7, #0x1f
	adds r0, r3, r7
	strh r0, [r5]
	adds r7, #1
	adds r0, r3, r7
	strh r0, [r1]
	subs r1, #4
	subs r5, #4
	subs r2, #4
	subs r4, #4
	ldr r0, [sp]
	subs r0, #1
	str r0, [sp]
	cmp r0, #0
	bge _0801F036
	mov r6, r9
	cmp r6, #0
	bge _0801F00A
	mov r1, r8
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	movs r0, #2
	bl BG_EnableSyncByMask
	mov r2, r8
	movs r3, #0
	ldrsh r0, [r2, r3]
	cmp r0, #0x22
	bne _0801F0B0
	movs r0, #0
	strh r0, [r2]
	mov r0, sl
	bl Proc_Break
_0801F0B0:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801F0C0: .4byte gBG1TilemapBuffer

	THUMB_FUNC_END sub_801EFF0

	THUMB_FUNC_START sub_801F0C4
sub_801F0C4: @ 0x0801F0C4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov sl, r0
	movs r6, #9
	movs r0, #0x4c
	add r0, sl
	mov r8, r0
	ldr r1, _0801F190  @ gBG1TilemapBuffer
	mov ip, r1
_0801F0DE:
	movs r2, #0xe
	str r2, [sp]
	lsls r0, r6, #1
	lsls r2, r6, #6
	subs r3, r6, #1
	mov r9, r3
	adds r0, #1
	lsls r1, r0, #5
	adds r1, #0x1d
	lsls r0, r0, #6
	add r0, ip
	adds r5, r0, #0
	adds r5, #0x38
	adds r2, #0x1d
	lsls r0, r6, #7
	add r0, ip
	adds r4, r0, #0
	adds r4, #0x38
	lsls r2, r2, #1
	add r2, ip
	lsls r1, r1, #1
	add r1, ip
_0801F10A:
	mov r7, r8
	movs r3, #0
	ldrsh r0, [r7, r3]
	ldr r7, [sp]
	subs r0, r7, r0
	adds r0, #0x15
	subs r3, r0, r6
	cmp r3, #0x10
	ble _0801F11E
	movs r3, #0x10
_0801F11E:
	cmp r3, #0
	bge _0801F124
	movs r3, #0
_0801F124:
	movs r0, #0xfe
	ands r3, r0
	ldr r7, _0801F194  @ 0x00005501
	adds r0, r7, #0
	adds r0, r3, r0
	strh r0, [r4]
	subs r7, #1
	adds r0, r7, #0
	adds r0, r3, r0
	strh r0, [r2]
	adds r7, #0x21
	adds r0, r3, r7
	strh r0, [r5]
	subs r7, #1
	adds r0, r3, r7
	strh r0, [r1]
	subs r1, #4
	subs r5, #4
	subs r2, #4
	subs r4, #4
	ldr r0, [sp]
	subs r0, #1
	str r0, [sp]
	cmp r0, #0
	bge _0801F10A
	mov r6, r9
	cmp r6, #0
	bge _0801F0DE
	mov r1, r8
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	movs r0, #2
	bl BG_EnableSyncByMask
	mov r2, r8
	movs r3, #0
	ldrsh r0, [r2, r3]
	cmp r0, #0x24
	bne _0801F17E
	movs r0, #0
	strh r0, [r2]
	mov r0, sl
	bl Proc_Break
_0801F17E:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801F190: .4byte gBG1TilemapBuffer
_0801F194: .4byte 0x00005501

	THUMB_FUNC_END sub_801F0C4

	THUMB_FUNC_START sub_801F198
sub_801F198: @ 0x0801F198
	adds r0, #0x4c
	movs r1, #4
	strh r1, [r0]
	bx lr

	THUMB_FUNC_END sub_801F198

	THUMB_FUNC_START sub_801F1A0
sub_801F1A0: @ 0x0801F1A0
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	adds r4, r6, #0
	adds r4, #0x4c
	movs r0, #0
	ldrsh r3, [r4, r0]
	movs r5, #0x20
	str r5, [sp]
	movs r0, #5
	movs r1, #0x10
	movs r2, #0x3c
	bl sub_8012DCC
	ldr r3, _0801F220  @ gLCDControlBuffer
	adds r2, r3, #0
	adds r2, #0x2d
	movs r1, #0
	strb r1, [r2]
	adds r1, r0, #0
	adds r1, #8
	adds r2, #4
	strb r1, [r2]
	subs r2, #5
	movs r1, #0xf0
	strb r1, [r2]
	movs r2, #0x60
	negs r2, r2
	adds r1, r2, #0
	subs r1, r1, r0
	adds r0, r3, #0
	adds r0, #0x30
	strb r1, [r0]
	movs r0, #0
	ldrsh r3, [r4, r0]
	str r5, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #7
	bl sub_8012DCC
	ldr r2, _0801F224  @ gUnknown_0202BCB0
	adds r1, r2, #0
	adds r1, #0x3a
	strb r0, [r1]
	movs r1, #0x10
	subs r1, r1, r0
	adds r2, #0x3b
	strb r1, [r2]
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x20
	bne _0801F216
	adds r0, r6, #0
	bl Proc_Break
_0801F216:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0801F220: .4byte gLCDControlBuffer
_0801F224: .4byte gUnknown_0202BCB0

	THUMB_FUNC_END sub_801F1A0

	THUMB_FUNC_START sub_801F228
sub_801F228: @ 0x0801F228
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	adds r4, r6, #0
	adds r4, #0x4c
	movs r0, #0
	ldrsh r3, [r4, r0]
	movs r5, #0x20
	str r5, [sp]
	movs r0, #5
	movs r1, #0
	movs r2, #0x3c
	bl sub_8012DCC
	ldr r3, _0801F2A4  @ gLCDControlBuffer
	adds r2, r3, #0
	adds r2, #0x2d
	movs r1, #0
	strb r1, [r2]
	adds r1, r0, #0
	adds r1, #8
	adds r2, #4
	strb r1, [r2]
	subs r2, #5
	movs r1, #0xf0
	strb r1, [r2]
	movs r2, #0x60
	negs r2, r2
	adds r1, r2, #0
	subs r1, r1, r0
	adds r0, r3, #0
	adds r0, #0x30
	strb r1, [r0]
	movs r0, #0
	ldrsh r3, [r4, r0]
	str r5, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #7
	bl sub_8012DCC
	ldr r2, _0801F2A8  @ gUnknown_0202BCB0
	adds r1, r2, #0
	adds r1, #0x3a
	strb r0, [r1]
	movs r1, #0x10
	subs r1, r1, r0
	adds r2, #0x3b
	strb r1, [r2]
	ldrh r0, [r4]
	subs r0, #1
	strh r0, [r4]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _0801F29C
	adds r0, r6, #0
	bl Proc_Break
_0801F29C:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0801F2A4: .4byte gLCDControlBuffer
_0801F2A8: .4byte gUnknown_0202BCB0

	THUMB_FUNC_END sub_801F228

	THUMB_FUNC_START sub_801F2AC
sub_801F2AC: @ 0x0801F2AC
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0801F2C8  @ gRAMChapterData
	ldrb r0, [r0, #0xf]
	bl GetPhaseAbleUnitCount
	cmp r0, #0
	bne _0801F2C2
	adds r0, r4, #0
	bl Proc_End
_0801F2C2:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0801F2C8: .4byte gRAMChapterData

	THUMB_FUNC_END sub_801F2AC

	THUMB_FUNC_START sub_801F2CC
sub_801F2CC: @ 0x0801F2CC
	push {r4, lr}
	ldr r0, _0801F310  @ gUnknown_0859F020
	ldr r1, _0801F314  @ 0x06014000
	bl CopyDataWithPossibleUncomp
	ldr r0, _0801F318  @ gUnknown_085A06D8
	ldr r1, _0801F31C  @ 0x06002000
	bl CopyDataWithPossibleUncomp
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	ldr r0, _0801F320  @ gRAMChapterData
	ldrb r0, [r0, #0xf]
	cmp r0, #0x40
	beq _0801F374
	cmp r0, #0x40
	bgt _0801F324
	cmp r0, #0
	beq _0801F32A
	b _0801F394
	.align 2, 0
_0801F310: .4byte gUnknown_0859F020
_0801F314: .4byte 0x06014000
_0801F318: .4byte gUnknown_085A06D8
_0801F31C: .4byte 0x06002000
_0801F320: .4byte gRAMChapterData
_0801F324:
	cmp r0, #0x80
	beq _0801F344
	b _0801F394
_0801F32A:
	ldr r0, _0801F338  @ gUnknown_0859F3F8
	ldr r1, _0801F33C  @ 0x06002800
	bl CopyDataWithPossibleUncomp
	ldr r4, _0801F340  @ gUnknown_0859FA2C
	b _0801F34E
	.align 2, 0
_0801F338: .4byte gUnknown_0859F3F8
_0801F33C: .4byte 0x06002800
_0801F340: .4byte gUnknown_0859FA2C
_0801F344:
	ldr r0, _0801F368  @ gUnknown_0859FA4C
	ldr r1, _0801F36C  @ 0x06002800
	bl CopyDataWithPossibleUncomp
	ldr r4, _0801F370  @ gUnknown_085A0068
_0801F34E:
	adds r0, r4, #0
	movs r1, #0xa0
	movs r2, #0x20
	bl CopyToPaletteBuffer
	movs r1, #0x90
	lsls r1, r1, #2
	adds r0, r4, #0
	movs r2, #0x20
	bl CopyToPaletteBuffer
	b _0801F394
	.align 2, 0
_0801F368: .4byte gUnknown_0859FA4C
_0801F36C: .4byte 0x06002800
_0801F370: .4byte gUnknown_085A0068
_0801F374:
	ldr r0, _0801F39C  @ gUnknown_085A0088
	ldr r1, _0801F3A0  @ 0x06002800
	bl CopyDataWithPossibleUncomp
	ldr r4, _0801F3A4  @ gUnknown_085A0698
	adds r0, r4, #0
	movs r1, #0xa0
	movs r2, #0x20
	bl CopyToPaletteBuffer
	movs r1, #0x90
	lsls r1, r1, #2
	adds r0, r4, #0
	movs r2, #0x20
	bl CopyToPaletteBuffer
_0801F394:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0801F39C: .4byte gUnknown_085A0088
_0801F3A0: .4byte 0x06002800
_0801F3A4: .4byte gUnknown_085A0698

	THUMB_FUNC_END sub_801F2CC

	THUMB_FUNC_START sub_801F3A8
sub_801F3A8: @ 0x0801F3A8
	push {r4, r5, r6, lr}
	mov r6, sl
	mov r5, r9
	mov r4, r8
	push {r4, r5, r6}
	sub sp, #4
	ldr r6, _0801F484  @ gLCDControlBuffer
	ldrb r0, [r6, #1]
	movs r1, #0x20
	mov r9, r1
	mov r2, r9
	orrs r0, r2
	movs r1, #0x41
	negs r1, r1
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r6, #1]
	adds r0, r6, #0
	adds r0, #0x2d
	movs r4, #0
	mov r8, r4
	mov r1, r8
	strb r1, [r0]
	adds r0, #4
	strb r1, [r0]
	adds r1, r6, #0
	adds r1, #0x2c
	movs r0, #0xf0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0xa0
	strb r0, [r1]
	movs r2, #0x34
	adds r2, r2, r6
	mov sl, r2
	ldrb r1, [r2]
	movs r2, #1
	orrs r1, r2
	subs r0, #0xa3
	ands r1, r0
	movs r5, #4
	orrs r1, r5
	movs r4, #8
	orrs r1, r4
	movs r3, #0x10
	orrs r1, r3
	adds r6, #0x36
	ldrb r0, [r6]
	orrs r0, r2
	movs r2, #2
	orrs r0, r2
	orrs r0, r5
	orrs r0, r4
	orrs r0, r3
	mov r4, r9
	orrs r1, r4
	mov r2, sl
	strb r1, [r2]
	orrs r0, r4
	strb r0, [r6]
	ldr r2, _0801F488  @ gUnknown_0202BCB0
	adds r0, r2, #0
	adds r0, #0x3a
	mov r4, r8
	strb r4, [r0]
	adds r3, r2, #0
	adds r3, #0x3b
	movs r1, #0x10
	strb r1, [r3]
	subs r0, #2
	strb r4, [r0]
	adds r0, #1
	strb r1, [r0]
	ldrb r2, [r3]
	movs r0, #1
	movs r1, #0
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	mov r0, r8
	str r0, [sp]
	movs r0, #0
	movs r1, #1
	movs r2, #0
	movs r3, #0
	bl sub_8001ED0
	movs r0, #1
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #1
	movs r3, #1
	bl sub_8001F0C
	movs r0, #0
	bl SetLCDVCountSetting
	ldr r0, _0801F48C  @ sub_801EC64
	bl SetInterrupt_LCDVCountMatch
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0801F484: .4byte gLCDControlBuffer
_0801F488: .4byte gUnknown_0202BCB0
_0801F48C: .4byte sub_801EC64

	THUMB_FUNC_END sub_801F3A8

	THUMB_FUNC_START sub_801F490
sub_801F490: @ 0x0801F490
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0801F4FC  @ gUnknown_0202BCB0
	adds r1, r0, #0
	adds r1, #0x3a
	ldrb r1, [r1]
	adds r0, #0x3b
	ldrb r2, [r0]
	movs r0, #1
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	ldr r0, _0801F500  @ gUnknown_0859AEF8
	bl Proc_Find
	cmp r0, #0
	bne _0801F4F4
	ldr r0, _0801F504  @ gUnknown_0859AF40
	bl Proc_Find
	cmp r0, #0
	bne _0801F4F4
	ldr r0, _0801F508  @ gUnknown_0859AF60
	bl Proc_Find
	cmp r0, #0
	bne _0801F4F4
	bl ClearBg0Bg1
	movs r0, #0
	bl SetInterrupt_LCDVCountMatch
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	adds r0, r4, #0
	bl Proc_Break
_0801F4F4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0801F4FC: .4byte gUnknown_0202BCB0
_0801F500: .4byte gUnknown_0859AEF8
_0801F504: .4byte gUnknown_0859AF40
_0801F508: .4byte gUnknown_0859AF60

	THUMB_FUNC_END sub_801F490

.align 2, 0 @ align with 0
