	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	THUMB_FUNC_START sub_808A384
sub_808A384: @ 0x0808A384
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	adds r4, #0x1f
	movs r0, #0xe0
	ands r4, r0
	adds r0, r6, #0
	adds r0, #0x4e
	ldrh r0, [r0]
	bl sub_808A454
	cmp r0, #1
	beq _0808A3A6
	cmp r0, #2
	beq _0808A3AC
	b _0808A3B4
_0808A3A6:
	movs r4, #0xa0
	adds r5, #0x20
	b _0808A3B4
_0808A3AC:
	cmp r4, #0x5f
	bgt _0808A3B2
	movs r4, #0x60
_0808A3B2:
	adds r5, #0x10
_0808A3B4:
	adds r0, r6, #0
	adds r0, #0x44
	strh r4, [r0]
	adds r0, #2
	strh r5, [r0]
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_808A384

	THUMB_FUNC_START sub_808A3C4
sub_808A3C4: @ 0x0808A3C4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	adds r4, r1, #0
	mov r8, r2
	adds r0, #0x44
	movs r1, #0
	ldrsh r0, [r0, r1]
	adds r6, r0, #0
	adds r6, #0x10
	adds r0, r5, #0
	adds r0, #0x46
	movs r1, #0
	ldrsh r0, [r0, r1]
	adds r7, r0, #0
	adds r7, #0x10
	adds r0, r6, #0
	movs r1, #6
	bl __divsi3
	adds r0, #0x10
	subs r4, r4, r0
	strh r4, [r5, #0x3c]
	lsls r4, r4, #0x10
	cmp r4, #0
	bge _0808A3FE
	movs r0, #0
	strh r0, [r5, #0x3c]
_0808A3FE:
	movs r1, #0x3c
	ldrsh r0, [r5, r1]
	adds r0, r0, r6
	cmp r0, #0xf0
	ble _0808A40E
	movs r0, #0xf0
	subs r0, r0, r6
	strh r0, [r5, #0x3c]
_0808A40E:
	mov r0, r8
	adds r0, #0x10
	strh r0, [r5, #0x3e]
	movs r1, #0x3e
	ldrsh r0, [r5, r1]
	adds r0, r0, r7
	cmp r0, #0xa0
	ble _0808A424
	mov r1, r8
	subs r0, r1, r7
	strh r0, [r5, #0x3e]
_0808A424:
	ldrh r0, [r5, #0x3c]
	adds r0, #8
	strh r0, [r5, #0x3c]
	ldrh r0, [r5, #0x3e]
	adds r0, #8
	strh r0, [r5, #0x3e]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_808A3C4

	THUMB_FUNC_START sub_808A43C
sub_808A43C: @ 0x0808A43C
	strh r1, [r0, #0x38]
	strh r2, [r0, #0x3a]
	bx lr

	THUMB_FUNC_END sub_808A43C

	THUMB_FUNC_START sub_808A444
sub_808A444: @ 0x0808A444
	adds r2, r0, #0
	adds r2, #0x40
	movs r1, #0x20
	strh r1, [r2]
	adds r0, #0x42
	movs r1, #0x10
	strh r1, [r0]
	bx lr

	THUMB_FUNC_END sub_808A444

	THUMB_FUNC_START sub_808A454
sub_808A454: @ 0x0808A454
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0808A464  @ 0x0000FFFE
	cmp r4, r0
	bne _0808A468
	movs r0, #3
	b _0808A49E
	.align 2, 0
_0808A464: .4byte 0x0000FFFE
_0808A468:
	adds r0, r4, #0
	bl GetItemAttributes
	movs r1, #0x80
	lsls r1, r1, #3
	ands r1, r0
	cmp r1, #0
	bne _0808A498
	adds r0, r4, #0
	bl GetItemAttributes
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	beq _0808A48A
	movs r0, #1
	b _0808A49E
_0808A48A:
	adds r0, r4, #0
	bl GetItemAttributes
	movs r1, #4
	ands r1, r0
	cmp r1, #0
	bne _0808A49C
_0808A498:
	movs r0, #0
	b _0808A49E
_0808A49C:
	movs r0, #2
_0808A49E:
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_808A454

	THUMB_FUNC_START sub_808A4A4
sub_808A4A4: @ 0x0808A4A4
	push {lr}
	adds r2, r0, #0
	ldr r0, _0808A4C0  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0808A4BC
	adds r0, r2, #0
	bl Proc_Break
_0808A4BC:
	pop {r0}
	bx r0
	.align 2, 0
_0808A4C0: .4byte gKeyStatusPtr

	THUMB_FUNC_END sub_808A4A4

	THUMB_FUNC_START sub_808A4C4
sub_808A4C4: @ 0x0808A4C4
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	movs r1, #1
	negs r1, r1
	movs r0, #0
	bl LoadDialogueBoxGfx
	bl GetUiHandPrevDisplayX
	adds r4, r0, #0
	bl GetUiHandPrevDisplayY
	adds r1, r0, #0
	adds r0, r4, #0
	adds r2, r5, #0
	bl sub_808A1E0
	ldr r0, _0808A4F8  @ gUnknown_08A016C8
	adds r1, r6, #0
	bl Proc_StartBlocking
	movs r0, #1
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0808A4F8: .4byte gUnknown_08A016C8

	THUMB_FUNC_END sub_808A4C4

	THUMB_FUNC_START sub_808A4FC
sub_808A4FC: @ 0x0808A4FC
	push {lr}
	ldr r0, _0808A50C  @ gUnknown_08A016E0
	bl Proc_Find
	cmp r0, #0
	bne _0808A510
	movs r0, #0
	b _0808A512
	.align 2, 0
_0808A50C: .4byte gUnknown_08A016E0
_0808A510:
	movs r0, #1
_0808A512:
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_808A4FC

	THUMB_FUNC_START sub_808A518
sub_808A518: @ 0x0808A518
	ldr r1, _0808A520  @ gUnknown_0203E7E8
	adds r1, #0x42
	strh r0, [r1]
	bx lr
	.align 2, 0
_0808A520: .4byte gUnknown_0203E7E8

	THUMB_FUNC_END sub_808A518

	THUMB_FUNC_START sub_808A524
sub_808A524: @ 0x0808A524
	ldr r0, _0808A52C  @ gUnknown_0203E7E8
	adds r0, #0x42
	ldrh r0, [r0]
	bx lr
	.align 2, 0
_0808A52C: .4byte gUnknown_0203E7E8

	THUMB_FUNC_END sub_808A524

	THUMB_FUNC_START sub_808A530
sub_808A530: @ 0x0808A530
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	mov r9, r0
	ldr r3, _0808A590  @ gUnknown_0203E7E8
	adds r0, r3, #0
	adds r0, #0x40
	ldrh r2, [r0]
	ldr r0, _0808A594  @ 0x000003FF
	ands r0, r2
	ldrh r3, [r3, #0x18]
	adds r0, r0, r3
	lsls r0, r0, #5
	ldr r2, _0808A598  @ 0x06010000
	adds r5, r0, r2
	movs r7, #0
	lsls r0, r1, #1
	cmp r7, r0
	bge _0808A5C2
	adds r3, r0, #0
_0808A55C:
	adds r4, r5, #0
	movs r2, #0
	adds r0, r7, #1
	mov r8, r0
	cmp r2, r9
	bge _0808A5B6
_0808A568:
	adds r6, r2, #1
	movs r1, #6
_0808A56C:
	ldr r0, [r4, #4]
	stm r4!, {r0}
	subs r1, #1
	cmp r1, #0
	bge _0808A56C
	subs r0, r3, #1
	cmp r7, r0
	bne _0808A5A4
	str r3, [sp]
	bl sub_808A524
	movs r1, #1
	ands r1, r0
	ldr r3, [sp]
	cmp r1, #0
	bne _0808A5A0
	ldr r0, _0808A59C  @ 0x44444444
	b _0808A5AE
	.align 2, 0
_0808A590: .4byte gUnknown_0203E7E8
_0808A594: .4byte 0x000003FF
_0808A598: .4byte 0x06010000
_0808A59C: .4byte 0x44444444
_0808A5A0:
	movs r0, #0
	b _0808A5AE
_0808A5A4:
	adds r0, r2, #0
	adds r0, #0x20
	lsls r0, r0, #5
	adds r0, r0, r5
	ldr r0, [r0]
_0808A5AE:
	stm r4!, {r0}
	adds r2, r6, #0
	cmp r2, r9
	blt _0808A568
_0808A5B6:
	movs r2, #0x80
	lsls r2, r2, #3
	adds r5, r5, r2
	mov r7, r8
	cmp r7, r3
	blt _0808A55C
_0808A5C2:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_808A530

	THUMB_FUNC_START sub_808A5D0
sub_808A5D0: @ 0x0808A5D0
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	cmp r5, #0
	bne _0808A5DC
	ldr r5, _0808A634  @ 0x06013000
_0808A5DC:
	cmp r6, #0
	bge _0808A5E2
	movs r6, #5
_0808A5E2:
	movs r0, #0xf
	ands r0, r6
	adds r6, r0, #0
	adds r6, #0x10
	bl sub_808A524
	movs r1, #0x10
	ands r1, r0
	cmp r1, #0
	beq _0808A64C
	ldr r0, _0808A638  @ gUnknown_08A029A8
	movs r2, #0xd8
	lsls r2, r2, #2
	adds r1, r5, r2
	bl Decompress
	ldr r0, _0808A63C  @ gUnknown_08A02A1C
	movs r2, #0xec
	lsls r2, r2, #3
	adds r1, r5, r2
	bl Decompress
	ldr r0, _0808A640  @ gUnknown_08A02A94
	movs r2, #0xb6
	lsls r2, r2, #4
	adds r1, r5, r2
	bl Decompress
	ldr r0, _0808A644  @ gUnknown_08A02B3C
	movs r2, #0xf8
	lsls r2, r2, #4
	adds r1, r5, r2
	bl Decompress
	ldr r0, _0808A648  @ gUnknown_08A02BAC
	movs r2, #0x9c
	lsls r2, r2, #5
	adds r1, r5, r2
	bl Decompress
	b _0808A688
	.align 2, 0
_0808A634: .4byte 0x06013000
_0808A638: .4byte gUnknown_08A029A8
_0808A63C: .4byte gUnknown_08A02A1C
_0808A640: .4byte gUnknown_08A02A94
_0808A644: .4byte gUnknown_08A02B3C
_0808A648: .4byte gUnknown_08A02BAC
_0808A64C:
	ldr r0, _0808A6FC  @ gUnknown_08A0285C
	movs r2, #0xd8
	lsls r2, r2, #2
	adds r1, r5, r2
	bl Decompress
	ldr r0, _0808A700  @ gUnknown_08A02884
	movs r2, #0xec
	lsls r2, r2, #3
	adds r1, r5, r2
	bl Decompress
	ldr r0, _0808A704  @ gUnknown_08A028AC
	movs r2, #0xb6
	lsls r2, r2, #4
	adds r1, r5, r2
	bl Decompress
	ldr r0, _0808A708  @ gUnknown_08A02914
	movs r2, #0xf6
	lsls r2, r2, #4
	adds r1, r5, r2
	bl Decompress
	ldr r0, _0808A70C  @ gUnknown_08A02980
	movs r2, #0x9b
	lsls r2, r2, #5
	adds r1, r5, r2
	bl Decompress
_0808A688:
	bl ClearAllTalkFlags
	bl sub_808A524
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	bne _0808A728
	ldr r4, _0808A710  @ gUnknown_0203E7E8
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r6, #0
	bl InitSomeOtherGraphicsRelatedStruct
	adds r0, r4, #0
	adds r0, #0x18
	bl Text_Init3
	adds r0, r4, #0
	adds r0, #0x20
	bl Text_Init3
	adds r0, r4, #0
	adds r0, #0x28
	bl Text_Init3
	bl sub_808A524
	movs r1, #0x10
	ands r1, r0
	cmp r1, #0
	beq _0808A6E4
	bl sub_808A524
	movs r1, #0x20
	ands r1, r0
	cmp r1, #0
	bne _0808A6E4
	adds r0, r4, #0
	adds r0, #0x30
	bl Text_Init3
	adds r0, r4, #0
	adds r0, #0x38
	bl Text_Init3
_0808A6E4:
	movs r0, #0
	bl SetFont
	bl sub_808A524
	movs r1, #0x10
	ands r1, r0
	cmp r1, #0
	beq _0808A718
	ldr r0, _0808A714  @ gUnknown_0859EF80
	b _0808A71A
	.align 2, 0
_0808A6FC: .4byte gUnknown_08A0285C
_0808A700: .4byte gUnknown_08A02884
_0808A704: .4byte gUnknown_08A028AC
_0808A708: .4byte gUnknown_08A02914
_0808A70C: .4byte gUnknown_08A02980
_0808A710: .4byte gUnknown_0203E7E8
_0808A714: .4byte gUnknown_0859EF80
_0808A718:
	ldr r0, _0808A724  @ gUnknown_0859EF60
_0808A71A:
	lsls r1, r6, #5
	movs r2, #0x20
	bl CopyToPaletteBuffer
	b _0808A764
	.align 2, 0
_0808A724: .4byte gUnknown_0859EF60
_0808A728:
	ldr r0, _0808A738  @ gUnknown_0203E7E8
	adds r1, r5, #0
	adds r2, r6, #0
	bl InitSomeOtherGraphicsRelatedStruct
	movs r4, #0
	lsls r7, r6, #5
	b _0808A748
	.align 2, 0
_0808A738: .4byte gUnknown_0203E7E8
_0808A73C:
	lsls r0, r4, #3
	ldr r1, _0808A79C  @ gUnknown_0203E800
	adds r0, r0, r1
	bl Text_Init3
	adds r4, #1
_0808A748:
	bl sub_808A524
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x18
	cmp r4, r0
	blt _0808A73C
	movs r0, #0
	bl SetFont
	ldr r0, _0808A7A0  @ Pal_UIFont
	adds r1, r7, #0
	movs r2, #0x20
	bl CopyToPaletteBuffer
_0808A764:
	ldr r2, _0808A7A4  @ gUnknown_0203E7E8
	lsls r1, r5, #0x11
	lsrs r1, r1, #0x16
	movs r0, #0xf
	ands r0, r6
	lsls r0, r0, #0xc
	adds r1, r1, r0
	adds r2, #0x40
	strh r1, [r2]
	bl sub_808A524
	movs r1, #0x10
	ands r1, r0
	cmp r1, #0
	beq _0808A794
	ldr r0, _0808A7A8  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0808A794
	ldr r0, _0808A7AC  @ 0x000002E6
	bl m4aSongNumStart
_0808A794:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808A79C: .4byte gUnknown_0203E800
_0808A7A0: .4byte Pal_UIFont
_0808A7A4: .4byte gUnknown_0203E7E8
_0808A7A8: .4byte gPlaySt
_0808A7AC: .4byte 0x000002E6

	THUMB_FUNC_END sub_808A5D0

	THUMB_FUNC_START sub_808A7B0
sub_808A7B0: @ 0x0808A7B0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	adds r0, #0x46
	movs r1, #0
	ldrsh r0, [r0, r1]
	adds r0, #0x10
	mov r8, r0
	adds r1, r4, #0
	adds r1, #0x44
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, #0xbf
	ble _0808A7D6
	movs r0, #0xc0
	strh r0, [r1]
_0808A7D6:
	movs r2, #0
	ldrsh r0, [r1, r2]
	adds r7, r0, #0
	adds r7, #0x10
	bl sub_808A524
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	bne _0808A828
	strh r5, [r4, #0x3c]
	adds r0, r6, #0
	adds r0, #8
	strh r0, [r4, #0x3e]
	bl sub_808A524
	movs r1, #0x40
	ands r1, r0
	cmp r1, #0
	bne _0808A820
	movs r1, #0x3c
	ldrsh r0, [r4, r1]
	adds r0, r0, r7
	cmp r0, #0xf0
	ble _0808A80E
	movs r0, #0xf0
	subs r0, r0, r7
	strh r0, [r4, #0x3c]
_0808A80E:
	movs r2, #0x3e
	ldrsh r0, [r4, r2]
	add r0, r8
	cmp r0, #0xa0
	ble _0808A820
	movs r0, #0x98
	mov r1, r8
	subs r0, r0, r1
	strh r0, [r4, #0x3e]
_0808A820:
	ldrh r0, [r4, #0x3c]
	adds r0, #8
	strh r0, [r4, #0x3c]
	b _0808A82C
_0808A828:
	strh r5, [r4, #0x3c]
	strh r6, [r4, #0x3e]
_0808A82C:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_808A7B0

	THUMB_FUNC_START sub_808A838
sub_808A838: @ 0x0808A838
	movs r3, #0xf8
	ands r3, r1
	adds r1, r0, #0
	adds r1, #0x44
	strh r3, [r1]
	adds r0, #0x46
	strh r2, [r0]
	bx lr

	THUMB_FUNC_END sub_808A838

	THUMB_FUNC_START sub_808A848
sub_808A848: @ 0x0808A848
	push {r4, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x40
	ldrb r0, [r1]
	cmp r0, #0xff
	bne _0808A862
	movs r1, #1
	negs r1, r1
	movs r0, #0
	bl sub_808A5D0
	b _0808A86A
_0808A862:
	ldr r0, [r4, #0x3c]
	ldrb r1, [r1]
	bl sub_808A5D0
_0808A86A:
	ldr r0, [r4, #0x2c]
	ldr r1, [r4, #0x30]
	ldr r2, [r4, #0x34]
	bl sub_808AC0C
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_808A848

	THUMB_FUNC_START sub_808A87C
sub_808A87C: @ 0x0808A87C
	push {r4, lr}
	adds r4, r0, #0
	bl sub_808A524
	movs r1, #0x82
	ands r1, r0
	cmp r1, #0
	bne _0808A8A2
	ldr r0, _0808A8A8  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0xa
	ands r0, r1
	cmp r0, #0
	beq _0808A8A2
	adds r0, r4, #0
	movs r1, #2
	bl Proc_Goto
_0808A8A2:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808A8A8: .4byte gKeyStatusPtr

	THUMB_FUNC_END sub_808A87C

	THUMB_FUNC_START sub_808A8AC
sub_808A8AC: @ 0x0808A8AC
	push {lr}
	bl sub_808A524
	movs r1, #0x10
	ands r1, r0
	cmp r1, #0
	beq _0808A8CC
	ldr r0, _0808A8DC  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0808A8CC
	ldr r0, _0808A8E0  @ 0x000002E7
	bl m4aSongNumStart
_0808A8CC:
	movs r0, #0
	bl SetFontGlyphSet
	bl sub_808A9F0
	pop {r0}
	bx r0
	.align 2, 0
_0808A8DC: .4byte gPlaySt
_0808A8E0: .4byte 0x000002E7

	THUMB_FUNC_END sub_808A8AC

	THUMB_FUNC_START sub_808A8E4
sub_808A8E4: @ 0x0808A8E4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r7, r0, #0
	adds r5, r1, #0
	movs r1, #0x3c
	ldrsh r0, [r7, r1]
	mov r8, r0
	movs r3, #0x3e
	ldrsh r2, [r7, r3]
	mov r9, r2
	adds r0, r7, #0
	adds r0, #0x40
	movs r4, #0
	ldrsh r1, [r0, r4]
	adds r0, #4
	movs r6, #0
	ldrsh r2, [r0, r6]
	adds r4, r7, #0
	adds r4, #0x48
	movs r3, #0
	ldrsh r0, [r4, r3]
	mov ip, r0
	movs r6, #0x4a
	adds r6, r6, r7
	mov sl, r6
	movs r3, #0
	ldrsh r0, [r6, r3]
	str r0, [sp]
	adds r0, r5, #0
	mov r3, ip
	bl Interpolate
	str r0, [sp, #4]
	adds r0, r7, #0
	adds r0, #0x42
	movs r6, #0
	ldrsh r1, [r0, r6]
	adds r0, #4
	movs r3, #0
	ldrsh r2, [r0, r3]
	movs r6, #0
	ldrsh r3, [r4, r6]
	mov r4, sl
	movs r6, #0
	ldrsh r0, [r4, r6]
	str r0, [sp]
	adds r0, r5, #0
	bl Interpolate
	adds r3, r0, #0
	mov r0, r8
	strh r0, [r7, #0x30]
	mov r1, r9
	strh r1, [r7, #0x32]
	mov r0, r8
	mov r1, r9
	ldr r2, [sp, #4]
	bl sub_808ACFC
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_808A8E4

	THUMB_FUNC_START sub_808A974
sub_808A974: @ 0x0808A974
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r1, #5
	bl sub_808A8E4
	adds r2, r4, #0
	adds r2, #0x48
	adds r4, #0x4a
	ldrh r3, [r2]
	movs r0, #0
	ldrsh r1, [r2, r0]
	movs r5, #0
	ldrsh r0, [r4, r5]
	cmp r1, r0
	bge _0808A996
	adds r0, r3, #1
	strh r0, [r2]
_0808A996:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_808A974

	THUMB_FUNC_START sub_808A99C
sub_808A99C: @ 0x0808A99C
	push {r4, r5, lr}
	adds r4, r0, #0
	bl ResetHelpBoxInitSize
	adds r5, r4, #0
	adds r5, #0x4a
	movs r1, #0
	ldrsh r0, [r5, r1]
	movs r1, #3
	bl __divsi3
	strh r0, [r5]
	adds r4, #0x48
	strh r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_808A99C

	THUMB_FUNC_START sub_808A9C0
sub_808A9C0: @ 0x0808A9C0
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0
	bl sub_808A8E4
	adds r1, r4, #0
	adds r1, #0x48
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _0808A9E6
	adds r0, r4, #0
	bl Proc_Break
	ldr r0, _0808A9EC  @ gUnknown_08A01818
	bl Proc_EndEach
_0808A9E6:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808A9EC: .4byte gUnknown_08A01818

	THUMB_FUNC_END sub_808A9C0

	THUMB_FUNC_START sub_808A9F0
sub_808A9F0: @ 0x0808A9F0
	push {lr}
	bl sub_808BAA4
	ldr r0, _0808AA00  @ gUnknown_08A01740
	bl Proc_BreakEach
	pop {r0}
	bx r0
	.align 2, 0
_0808AA00: .4byte gUnknown_08A01740

	THUMB_FUNC_END sub_808A9F0

	THUMB_FUNC_START sub_808AA04
sub_808AA04: @ 0x0808AA04
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	adds r7, r1, #0
	mov r8, r2
	adds r5, r3, #0
	ldr r4, _0808AA30  @ gUnknown_08A016E0
	adds r0, r4, #0
	bl Proc_EndEach
	movs r0, #0
	bl sub_808A518
	cmp r5, #0
	bne _0808AA34
	adds r0, r4, #0
	movs r1, #3
	bl Proc_Start
	b _0808AA3C
	.align 2, 0
_0808AA30: .4byte gUnknown_08A016E0
_0808AA34:
	adds r0, r4, #0
	adds r1, r5, #0
	bl Proc_StartBlocking
_0808AA3C:
	adds r2, r0, #0
	str r6, [r2, #0x2c]
	str r7, [r2, #0x30]
	mov r0, r8
	str r0, [r2, #0x34]
	adds r1, r2, #0
	adds r1, #0x40
	movs r0, #0xff
	strb r0, [r1]
	subs r1, #8
	movs r0, #1
	strb r0, [r1]
	ldr r0, _0808AA68  @ gUnknown_08A01818
	movs r1, #0
	bl Proc_Start
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808AA68: .4byte gUnknown_08A01818

	THUMB_FUNC_END sub_808AA04

	THUMB_FUNC_START sub_808AA6C
sub_808AA6C: @ 0x0808AA6C
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	adds r6, r0, #0
	adds r7, r1, #0
	mov r8, r2
	mov r9, r3
	ldr r5, [sp, #0x20]
	ldr r4, _0808AA9C  @ gUnknown_08A016E0
	adds r0, r4, #0
	bl Proc_EndEach
	movs r0, #0
	bl sub_808A518
	cmp r5, #0
	bne _0808AAA0
	adds r0, r4, #0
	movs r1, #3
	bl Proc_Start
	b _0808AAA8
	.align 2, 0
_0808AA9C: .4byte gUnknown_08A016E0
_0808AAA0:
	adds r0, r4, #0
	adds r1, r5, #0
	bl Proc_StartBlocking
_0808AAA8:
	adds r2, r0, #0
	str r6, [r2, #0x2c]
	str r7, [r2, #0x30]
	mov r0, r8
	str r0, [r2, #0x34]
	adds r1, r2, #0
	adds r1, #0x40
	ldr r0, [sp, #0x1c]
	strb r0, [r1]
	mov r0, r9
	str r0, [r2, #0x3c]
	subs r1, #8
	movs r0, #1
	strb r0, [r1]
	ldr r0, _0808AAD8  @ gUnknown_08A01818
	movs r1, #0
	bl Proc_Start
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808AAD8: .4byte gUnknown_08A01818

	THUMB_FUNC_END sub_808AA6C

	THUMB_FUNC_START sub_808AADC
sub_808AADC: @ 0x0808AADC
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r3, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	movs r7, #0
	movs r6, #0x10
	str r7, [r4]
	str r7, [r5]
_0808AAEE:
	ldrb r0, [r3]
	cmp r0, #7
	bgt _0808AB10
	cmp r0, #4
	bge _0808AB38
	cmp r0, #1
	beq _0808AB2C
	cmp r0, #1
	bgt _0808AB06
	cmp r0, #0
	beq _0808AB6E
	b _0808AB80
_0808AB06:
	cmp r0, #2
	beq _0808AB3C
	cmp r0, #3
	beq _0808AB52
	b _0808AB80
_0808AB10:
	cmp r0, #0x19
	ble _0808AB1A
	cmp r0, #0x80
	beq _0808AB28
	b _0808AB80
_0808AB1A:
	cmp r0, #0x18
	bge _0808AB36
	cmp r0, #0x14
	bgt _0808AB80
	cmp r0, #0x12
	blt _0808AB80
	b _0808AB6E
_0808AB28:
	adds r3, #2
	b _0808AAEE
_0808AB2C:
	adds r6, #0x10
	ldr r0, [r4]
	cmp r0, r7
	bge _0808AB36
	str r7, [r4]
_0808AB36:
	movs r7, #0
_0808AB38:
	adds r3, #1
	b _0808AAEE
_0808AB3C:
	adds r3, #1
	ldr r0, [r5]
	cmp r0, r6
	bge _0808AB46
	str r6, [r5]
_0808AB46:
	movs r6, #0
	ldr r0, [r4]
	cmp r0, r7
	bge _0808AB6A
	str r7, [r4]
	b _0808AB6A
_0808AB52:
	adds r3, #1
	ldr r0, [r5]
	cmp r0, r6
	bge _0808AB5C
	str r6, [r5]
_0808AB5C:
	movs r6, #0
	adds r1, r7, #0
	adds r1, #8
	ldr r0, [r4]
	cmp r0, r1
	bge _0808AB6A
	str r1, [r4]
_0808AB6A:
	movs r7, #0
	b _0808AAEE
_0808AB6E:
	ldr r0, [r4]
	cmp r0, r7
	bge _0808AB76
	str r7, [r4]
_0808AB76:
	ldr r0, [r5]
	cmp r0, r6
	bge _0808AB90
	str r6, [r5]
	b _0808AB90
_0808AB80:
	adds r0, r3, #0
	mov r1, sp
	bl GetCharTextWidth
	adds r3, r0, #0
	ldr r0, [sp]
	adds r7, r7, r0
	b _0808AAEE
_0808AB90:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_808AADC

	THUMB_FUNC_START sub_808AB98
sub_808AB98: @ 0x0808AB98
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r1, #0
	movs r5, #0
	adds r4, r0, #0
	strb r5, [r6]
	movs r0, #1
	bl SetFontGlyphSet
_0808ABAA:
	ldrb r0, [r4]
	cmp r0, #7
	bgt _0808ABCC
	cmp r0, #4
	bge _0808ABE2
	cmp r0, #1
	beq _0808ABE6
	cmp r0, #1
	bgt _0808ABC2
	cmp r0, #0
	beq _0808AC00
	b _0808ABF0
_0808ABC2:
	cmp r0, #2
	beq _0808ABE2
	cmp r0, #3
	beq _0808AC00
	b _0808ABF0
_0808ABCC:
	cmp r0, #0x19
	ble _0808ABD6
	cmp r0, #0x80
	beq _0808ABEC
	b _0808ABF0
_0808ABD6:
	cmp r0, #0x18
	bge _0808ABE6
	cmp r0, #0x14
	bgt _0808ABF0
	cmp r0, #0x12
	blt _0808ABF0
_0808ABE2:
	adds r4, #1
	b _0808ABAA
_0808ABE6:
	adds r4, #1
	movs r5, #0
	b _0808ABAA
_0808ABEC:
	adds r4, #2
	b _0808ABAA
_0808ABF0:
	adds r0, r4, #0
	mov r1, sp
	bl GetCharTextWidth
	adds r4, r0, #0
	ldr r0, [sp]
	adds r5, r5, r0
	b _0808ABAA
_0808AC00:
	adds r0, r5, #2
	strb r0, [r6]
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_808AB98

	THUMB_FUNC_START sub_808AC0C
sub_808AC0C: @ 0x0808AC0C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	adds r6, r0, #0
	adds r7, r1, #0
	mov r8, r2
	movs r5, #0
	str r5, [sp]
	str r5, [sp, #4]
	ldr r4, _0808AC5C  @ gUnknown_08A01740
	adds r0, r4, #0
	bl Proc_EndEach
	adds r0, r4, #0
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	adds r1, r6, #0
	adds r2, r7, #0
	bl SetHelpBoxInitPosition
	adds r0, r4, #0
	bl ResetHelpBoxInitSize
	str r5, [r4, #0x2c]
	adds r0, r4, #0
	adds r0, #0x48
	strh r5, [r0]
	bl sub_808A524
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	beq _0808AC60
	adds r0, r4, #0
	adds r0, #0x4a
	strh r5, [r0]
	b _0808AC68
	.align 2, 0
_0808AC5C: .4byte gUnknown_08A01740
_0808AC60:
	adds r1, r4, #0
	adds r1, #0x4a
	movs r0, #0xc
	strh r0, [r1]
_0808AC68:
	adds r1, r4, #0
	adds r1, #0x4e
	movs r0, #0
	strh r0, [r1]
	adds r5, r4, #0
	adds r5, #0x4c
	mov r0, r8
	strh r0, [r5]
	movs r0, #1
	bl SetFontGlyphSet
	ldrh r0, [r5]
	bl GetStringFromIndex
	bl sub_800A2A4
	add r2, sp, #4
	mov r1, sp
	bl sub_808AADC
	movs r0, #0
	bl SetFontGlyphSet
	ldr r1, [sp]
	ldr r2, [sp, #4]
	adds r0, r4, #0
	bl sub_808A838
	bl sub_808A524
	movs r1, #0x80
	lsls r1, r1, #1
	ands r1, r0
	cmp r1, #0
	beq _0808ACD6
	adds r0, r4, #0
	adds r0, #0x44
	movs r2, #0
	ldrsh r1, [r0, r2]
	movs r0, #0xd8
	subs r0, r0, r1
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	adds r6, r6, r0
	adds r0, r4, #0
	adds r0, #0x46
	movs r2, #0
	ldrsh r1, [r0, r2]
	movs r0, #0x90
	subs r0, r0, r1
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	adds r7, r7, r0
_0808ACD6:
	adds r0, r4, #0
	adds r1, r6, #0
	adds r2, r7, #0
	bl sub_808A7B0
	bl sub_808BAA4
	ldrh r0, [r5]
	ldr r1, [sp]
	ldr r2, [sp, #4]
	bl sub_808BA60
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_808AC0C

	THUMB_FUNC_START sub_808ACFC
sub_808ACFC: @ 0x0808ACFC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x28
	str r0, [sp, #4]
	str r1, [sp, #8]
	adds r4, r2, #0
	mov r8, r3
	mov r0, r8
	asrs r0, r0, #5
	str r0, [sp, #0x14]
	cmp r4, #0x1f
	bgt _0808AD1C
	movs r4, #0x20
_0808AD1C:
	cmp r4, #0xc0
	ble _0808AD22
	movs r4, #0xc0
_0808AD22:
	mov r1, r8
	cmp r1, #0xf
	bgt _0808AD2C
	movs r2, #0x10
	mov r8, r2
_0808AD2C:
	mov r3, r8
	cmp r3, #0x50
	ble _0808AD36
	movs r0, #0x50
	mov r8, r0
_0808AD36:
	bl sub_808A524
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	beq _0808AD44
	b _0808B020
_0808AD44:
	mov r0, r8
	adds r0, #0xf
	cmp r0, #0
	bge _0808AD4E
	adds r0, #0xf
_0808AD4E:
	asrs r0, r0, #4
	str r0, [sp, #0x10]
	adds r0, r4, #7
	cmp r0, #0
	bge _0808AD5A
	adds r0, #7
_0808AD5A:
	asrs r0, r0, #3
	adds r1, r0, #1
	str r1, [sp, #0xc]
	movs r7, #0
	subs r0, #3
	ldr r2, [sp, #8]
	subs r2, #8
	str r2, [sp, #0x24]
	ldr r3, [sp, #8]
	add r3, r8
	str r3, [sp, #0x1c]
	ldr r1, [sp, #4]
	subs r1, #8
	str r1, [sp, #0x20]
	cmp r7, r0
	bge _0808ADBE
	mov sl, r0
_0808AD7C:
	lsls r6, r7, #3
	ldr r5, [sp, #0x10]
	adds r4, r7, #4
	cmp r5, #0
	blt _0808ADB8
	ldr r2, _0808AE04  @ gUnknown_0203E828
	mov r9, r2
_0808AD8A:
	adds r0, r5, #1
	lsls r0, r0, #4
	cmp r0, r8
	ble _0808AD94
	mov r0, r8
_0808AD94:
	subs r0, #0x10
	ldr r3, [sp, #8]
	adds r2, r3, r0
	mov r1, r9
	ldrh r0, [r1]
	adds r0, r0, r7
	lsls r1, r5, #6
	adds r0, r0, r1
	str r0, [sp]
	movs r0, #2
	ldr r3, [sp, #4]
	adds r1, r3, r6
	ldr r3, _0808AE08  @ gObject_32x16
	bl PutSprite
	subs r5, #1
	cmp r5, #0
	bge _0808AD8A
_0808ADB8:
	adds r7, r4, #0
	cmp r7, sl
	blt _0808AD7C
_0808ADBE:
	ldr r0, [sp, #0xc]
	cmp r7, r0
	bge _0808AE40
	subs r0, #2
	mov sl, r0
_0808ADC8:
	lsls r6, r7, #3
	ldr r5, [sp, #0x10]
	cmp r5, #0
	blt _0808AE32
	ldr r1, _0808AE04  @ gUnknown_0203E828
	mov r9, r1
	lsls r4, r5, #6
_0808ADD6:
	adds r0, r5, #1
	lsls r0, r0, #4
	cmp r0, r8
	ble _0808ADE0
	mov r0, r8
_0808ADE0:
	subs r0, #0x10
	cmp r7, sl
	bge _0808AE10
	ldr r3, [sp, #8]
	adds r2, r3, r0
	mov r1, r9
	ldrh r0, [r1]
	adds r0, r0, r7
	adds r0, r0, r4
	str r0, [sp]
	movs r0, #2
	ldr r3, [sp, #4]
	adds r1, r3, r6
	ldr r3, _0808AE0C  @ gObject_16x16
	bl PutSprite
	b _0808AE2A
	.align 2, 0
_0808AE04: .4byte gUnknown_0203E828
_0808AE08: .4byte gObject_32x16
_0808AE0C: .4byte gObject_16x16
_0808AE10:
	ldr r1, [sp, #8]
	adds r2, r1, r0
	mov r3, r9
	ldrh r0, [r3]
	adds r0, r0, r7
	adds r0, r0, r4
	str r0, [sp]
	movs r0, #2
	ldr r3, [sp, #4]
	adds r1, r3, r6
	ldr r3, _0808AEAC  @ gObject_8x16
	bl PutSprite
_0808AE2A:
	subs r4, #0x40
	subs r5, #1
	cmp r5, #0
	bge _0808ADD6
_0808AE32:
	cmp r7, sl
	bge _0808AE38
	adds r7, #1
_0808AE38:
	adds r7, #1
	ldr r0, [sp, #0xc]
	cmp r7, r0
	blt _0808ADC8
_0808AE40:
	movs r7, #0
	ldr r1, [sp, #0xc]
	cmp r7, r1
	bge _0808AEEC
	ldr r2, _0808AEB0  @ gUnknown_0203E7E8
	str r2, [sp, #0x18]
_0808AE4C:
	lsls r6, r7, #3
	ldr r0, [sp, #0xc]
	subs r0, #2
	cmp r7, r0
	bge _0808AEB8
	ldr r3, [sp, #4]
	adds r3, r3, r6
	mov r9, r3
	ldr r0, [sp, #0x18]
	adds r0, #0x40
	mov sl, r0
	ldrh r5, [r0]
	adds r6, r5, #0
	adds r6, #0x1b
	adds r4, r7, #6
	adds r0, r4, #0
	movs r1, #0xa
	bl __modsi3
	cmp r0, #0
	bne _0808AE78
	adds r6, #2
_0808AE78:
	str r6, [sp]
	movs r0, #2
	mov r1, r9
	ldr r2, [sp, #0x24]
	ldr r3, _0808AEB4  @ gObject_16x8
	bl PutSprite
	mov r2, sl
	ldrh r1, [r2]
	adds r2, r1, #0
	adds r2, #0x3b
	movs r0, #7
	ands r4, r0
	cmp r4, #0
	bne _0808AE98
	adds r2, #2
_0808AE98:
	str r2, [sp]
	movs r0, #2
	mov r1, r9
	ldr r2, [sp, #0x1c]
	ldr r3, _0808AEB4  @ gObject_16x8
	bl PutSprite
	adds r7, #1
	b _0808AEE4
	.align 2, 0
_0808AEAC: .4byte gObject_8x16
_0808AEB0: .4byte gUnknown_0203E7E8
_0808AEB4: .4byte gObject_16x8
_0808AEB8:
	ldr r3, [sp, #4]
	adds r4, r3, r6
	ldr r1, _0808AF60  @ gUnknown_0203E828
	ldrh r0, [r1]
	adds r0, #0x1b
	str r0, [sp]
	movs r0, #2
	adds r1, r4, #0
	ldr r2, [sp, #0x24]
	ldr r3, _0808AF64  @ gObject_8x8
	bl PutSprite
	ldr r2, _0808AF60  @ gUnknown_0203E828
	ldrh r0, [r2]
	adds r0, #0x3b
	str r0, [sp]
	movs r0, #2
	adds r1, r4, #0
	ldr r2, [sp, #0x1c]
	ldr r3, _0808AF64  @ gObject_8x8
	bl PutSprite
_0808AEE4:
	adds r7, #1
	ldr r3, [sp, #0xc]
	cmp r7, r3
	blt _0808AE4C
_0808AEEC:
	bl sub_808A524
	movs r1, #0x10
	ands r1, r0
	cmp r1, #0
	beq _0808AF70
	ldr r5, [sp, #0x10]
	lsls r7, r7, #3
	mov r9, r7
	cmp r5, #0
	blt _0808AFBA
_0808AF02:
	adds r0, r5, #1
	lsls r0, r0, #4
	cmp r0, r8
	ble _0808AF0C
	mov r0, r8
_0808AF0C:
	subs r0, #0x10
	ldr r1, [sp, #8]
	adds r4, r1, r0
	ldr r6, _0808AF68  @ gObject_8x16
	ldr r0, _0808AF6C  @ gUnknown_0203E7E8
	adds r7, r0, #0
	adds r7, #0x40
	ldrh r2, [r7]
	movs r0, #1
	ands r0, r5
	adds r1, r2, #0
	adds r1, #0x5f
	cmp r0, #0
	beq _0808AF2A
	adds r1, #0x20
_0808AF2A:
	str r1, [sp]
	movs r0, #2
	ldr r1, [sp, #0x20]
	adds r2, r4, #0
	adds r3, r6, #0
	bl PutSprite
	ldr r1, [sp, #4]
	add r1, r9
	ldrh r0, [r7]
	adds r2, r0, #0
	adds r2, #0x1f
	ldr r3, [sp, #0x14]
	cmp r5, r3
	bne _0808AF4A
	adds r2, #0x5f
_0808AF4A:
	str r2, [sp]
	movs r0, #2
	adds r2, r4, #0
	adds r3, r6, #0
	bl PutSprite
	subs r5, #1
	cmp r5, #0
	bge _0808AF02
	b _0808AFBA
	.align 2, 0
_0808AF60: .4byte gUnknown_0203E828
_0808AF64: .4byte gObject_8x8
_0808AF68: .4byte gObject_8x16
_0808AF6C: .4byte gUnknown_0203E7E8
_0808AF70:
	ldr r5, [sp, #0x10]
	lsls r7, r7, #3
	mov r9, r7
	cmp r5, #0
	blt _0808AFBA
	ldr r6, _0808B010  @ gObject_8x16
	ldr r7, _0808B014  @ gUnknown_0203E828
_0808AF7E:
	adds r0, r5, #1
	lsls r0, r0, #4
	cmp r0, r8
	ble _0808AF88
	mov r0, r8
_0808AF88:
	subs r0, #0x10
	ldr r1, [sp, #8]
	adds r4, r1, r0
	ldrh r0, [r7]
	adds r0, #0x5f
	str r0, [sp]
	movs r0, #2
	ldr r1, [sp, #0x20]
	adds r2, r4, #0
	adds r3, r6, #0
	bl PutSprite
	ldrh r0, [r7]
	adds r0, #0x1f
	str r0, [sp]
	movs r0, #2
	ldr r1, [sp, #4]
	add r1, r9
	adds r2, r4, #0
	adds r3, r6, #0
	bl PutSprite
	subs r5, #1
	cmp r5, #0
	bge _0808AF7E
_0808AFBA:
	ldr r5, _0808B018  @ gObject_8x8
	ldr r4, _0808B01C  @ gUnknown_0203E7E8
	adds r4, #0x40
	ldrh r0, [r4]
	adds r0, #0x5b
	str r0, [sp]
	movs r0, #2
	ldr r1, [sp, #0x20]
	ldr r2, [sp, #0x24]
	adds r3, r5, #0
	bl PutSprite
	ldr r6, [sp, #4]
	add r6, r9
	ldrh r0, [r4]
	adds r0, #0x5c
	str r0, [sp]
	movs r0, #2
	adds r1, r6, #0
	ldr r2, [sp, #0x24]
	adds r3, r5, #0
	bl PutSprite
	ldrh r0, [r4]
	adds r0, #0x5d
	str r0, [sp]
	movs r0, #2
	ldr r1, [sp, #0x20]
	ldr r2, [sp, #0x1c]
	adds r3, r5, #0
	bl PutSprite
	ldrh r0, [r4]
	adds r0, #0x5e
	str r0, [sp]
	movs r0, #2
	adds r1, r6, #0
	ldr r2, [sp, #0x1c]
	adds r3, r5, #0
	bl PutSprite
	b _0808B082
	.align 2, 0
_0808B010: .4byte gObject_8x16
_0808B014: .4byte gUnknown_0203E828
_0808B018: .4byte gObject_8x8
_0808B01C: .4byte gUnknown_0203E7E8
_0808B020:
	adds r0, r4, #0
	adds r0, #0x1f
	cmp r0, #0
	bge _0808B02A
	adds r0, #0x1f
_0808B02A:
	asrs r0, r0, #5
	str r0, [sp, #0xc]
	bl sub_808A524
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x18
	subs r0, #1
	str r0, [sp, #0x10]
	ldr r7, [sp, #0xc]
	subs r7, #1
	cmp r7, #0
	blt _0808B082
_0808B042:
	ldr r5, [sp, #0x10]
	subs r2, r7, #1
	mov r8, r2
	cmp r5, #0
	blt _0808B07C
	lsls r6, r7, #5
	ldr r3, _0808B094  @ gUnknown_0203E828
	mov r9, r3
	lsls r0, r5, #4
	ldr r1, [sp, #8]
	adds r4, r0, r1
_0808B058:
	lsls r0, r7, #2
	mov r2, r9
	ldrh r2, [r2]
	adds r0, r0, r2
	lsls r1, r5, #6
	adds r0, r0, r1
	str r0, [sp]
	movs r0, #2
	ldr r3, [sp, #4]
	adds r1, r3, r6
	adds r2, r4, #0
	ldr r3, _0808B098  @ gObject_32x16
	bl PutSprite
	subs r4, #0x10
	subs r5, #1
	cmp r5, #0
	bge _0808B058
_0808B07C:
	mov r7, r8
	cmp r7, #0
	bge _0808B042
_0808B082:
	add sp, #0x28
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808B094: .4byte gUnknown_0203E828
_0808B098: .4byte gObject_32x16

	THUMB_FUNC_END sub_808ACFC

	THUMB_FUNC_START sub_808B09C
sub_808B09C: @ 0x0808B09C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0808B0D0  @ gUnknown_08A01740
	bl Proc_Find
	adds r2, r4, #0
	adds r2, #0x59
	movs r1, #0
	strb r1, [r2]
	ldrh r1, [r0, #0x30]
	subs r1, #8
	subs r2, #9
	strb r1, [r2]
	ldrh r0, [r0, #0x32]
	subs r0, #8
	adds r1, r4, #0
	adds r1, #0x51
	strb r0, [r1]
	ldr r0, [r4, #0x2c]
	adds r1, #1
	bl sub_808AB98
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808B0D0: .4byte gUnknown_08A01740

	THUMB_FUNC_END sub_808B09C

	THUMB_FUNC_START sub_808B0D4
sub_808B0D4: @ 0x0808B0D4
	push {lr}
	bl sub_808A524
	movs r1, #4
	ands r1, r0
	cmp r1, #0
	beq _0808B0F4
	movs r0, #0
	bl GetFaceDisplayBitsById
	movs r1, #0x11
	negs r1, r1
	ands r1, r0
	movs r0, #0
	bl SetFaceDisplayBitsById
_0808B0F4:
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_808B0D4

	THUMB_FUNC_START sub_808B0F8
sub_808B0F8: @ 0x0808B0F8
	push {lr}
	bl sub_808A524
	movs r1, #4
	ands r1, r0
	cmp r1, #0
	beq _0808B116
	movs r0, #0
	bl GetFaceDisplayBitsById
	movs r1, #0x10
	orrs r1, r0
	movs r0, #0
	bl SetFaceDisplayBitsById
_0808B116:
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_808B0F8

	THUMB_FUNC_START sub_808B11C
sub_808B11C: @ 0x0808B11C
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _0808B174  @ gUnknown_0203E800
	adds r0, r4, #0
	bl sub_80045FC
	adds r0, r4, #0
	adds r0, #8
	bl sub_80045FC
	adds r0, r4, #0
	adds r0, #0x10
	bl sub_80045FC
	bl sub_808A524
	movs r1, #0x10
	ands r1, r0
	cmp r1, #0
	beq _0808B160
	bl sub_808A524
	movs r1, #0x20
	ands r1, r0
	cmp r1, #0
	bne _0808B160
	adds r0, r4, #0
	adds r0, #0x18
	bl sub_80045FC
	adds r0, r4, #0
	adds r0, #0x20
	bl sub_80045FC
_0808B160:
	adds r0, r5, #0
	adds r0, #0x58
	movs r1, #0
	strb r1, [r0]
	subs r0, #0x10
	strh r1, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0808B174: .4byte gUnknown_0203E800

	THUMB_FUNC_END sub_808B11C

	THUMB_FUNC_START sub_808B178
sub_808B178: @ 0x0808B178
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x14
	adds r6, r0, #0
	adds r0, #0x4e
	movs r2, #0
	ldrsh r1, [r0, r2]
	mov r8, r1
	ldr r0, _0808B1AC  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0xf3
	ands r0, r1
	cmp r0, #0
	beq _0808B200
	bl sub_808A524
	movs r1, #8
	ands r1, r0
	cmp r1, #0
	bne _0808B200
	movs r3, #0x80
	mov r8, r3
	b _0808B21A
	.align 2, 0
_0808B1AC: .4byte gKeyStatusPtr
_0808B1B0:
	bl sub_808B0D4
	ldr r0, _0808B1D0  @ gUnknown_08A016E0
	bl Proc_Find
	movs r1, #1
	bl Proc_Goto
	adds r0, r6, #0
	movs r1, #1
	bl Proc_Goto
	ldr r0, _0808B1D4  @ gUnknown_08A01818
	bl Proc_EndEach
	b _0808B4C0
	.align 2, 0
_0808B1D0: .4byte gUnknown_08A016E0
_0808B1D4: .4byte gUnknown_08A01818
_0808B1D8:
	adds r0, r1, #1
	str r0, [r6, #0x2c]
	b _0808B772
_0808B1DE:
	adds r1, r6, #0
	adds r1, #0x58
	movs r0, #0
	strb r0, [r1]
	adds r0, r6, #0
	movs r1, #4
	bl Proc_Goto
	b _0808B772
_0808B1F0:
	adds r0, r6, #0
	bl Proc_Break
	b _0808B772
_0808B1F8:
	adds r0, r6, #0
	bl sub_808B11C
	b _0808B772
_0808B200:
	adds r1, r6, #0
	adds r1, #0x4a
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	cmp r0, #0
	ble _0808B212
	b _0808B778
_0808B212:
	adds r0, r6, #0
	adds r0, #0x4c
	ldrh r0, [r0]
	strh r0, [r1]
_0808B21A:
	bl sub_808B0F8
	ldr r0, [r6, #0x30]
	bl SetFont
	movs r7, #0
	cmp r7, r8
	blt _0808B22C
	b _0808B772
_0808B22C:
	ldr r0, [r6, #0x2c]
	ldrb r1, [r0]
	adds r2, r0, #0
	cmp r1, #0x80
	bls _0808B238
	b _0808B6A8
_0808B238:
	lsls r0, r1, #2
	ldr r1, _0808B244  @ _0808B248
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0808B244: .4byte _0808B248
_0808B248: @ jump table
	.4byte _0808B56C @ case 0
	.4byte _0808B572 @ case 1
	.4byte _0808B5EA @ case 2
	.4byte _0808B664 @ case 3
	.4byte _0808B59A @ case 4
	.4byte _0808B5AE @ case 5
	.4byte _0808B5C2 @ case 6
	.4byte _0808B5D6 @ case 7
	.4byte _0808B6A8 @ case 8
	.4byte _0808B6A8 @ case 9
	.4byte _0808B6A8 @ case 10
	.4byte _0808B6A8 @ case 11
	.4byte _0808B6A8 @ case 12
	.4byte _0808B6A8 @ case 13
	.4byte _0808B6A8 @ case 14
	.4byte _0808B6A8 @ case 15
	.4byte _0808B6A8 @ case 16
	.4byte _0808B6A8 @ case 17
	.4byte _0808B4FE @ case 18
	.4byte _0808B4FE @ case 19
	.4byte _0808B4FE @ case 20
	.4byte _0808B6A8 @ case 21
	.4byte _0808B6A8 @ case 22
	.4byte _0808B6A8 @ case 23
	.4byte _0808B44C @ case 24
	.4byte _0808B488 @ case 25
	.4byte _0808B6A8 @ case 26
	.4byte _0808B6A8 @ case 27
	.4byte _0808B6A8 @ case 28
	.4byte _0808B6A8 @ case 29
	.4byte _0808B6A8 @ case 30
	.4byte _0808B6A8 @ case 31
	.4byte _0808B6A8 @ case 32
	.4byte _0808B6A8 @ case 33
	.4byte _0808B6A8 @ case 34
	.4byte _0808B6A8 @ case 35
	.4byte _0808B6A8 @ case 36
	.4byte _0808B6A8 @ case 37
	.4byte _0808B6A8 @ case 38
	.4byte _0808B6A8 @ case 39
	.4byte _0808B6A8 @ case 40
	.4byte _0808B6A8 @ case 41
	.4byte _0808B6A8 @ case 42
	.4byte _0808B6A8 @ case 43
	.4byte _0808B6A8 @ case 44
	.4byte _0808B6A8 @ case 45
	.4byte _0808B6A8 @ case 46
	.4byte _0808B6A8 @ case 47
	.4byte _0808B6A8 @ case 48
	.4byte _0808B6A8 @ case 49
	.4byte _0808B6A8 @ case 50
	.4byte _0808B6A8 @ case 51
	.4byte _0808B6A8 @ case 52
	.4byte _0808B6A8 @ case 53
	.4byte _0808B6A8 @ case 54
	.4byte _0808B6A8 @ case 55
	.4byte _0808B6A8 @ case 56
	.4byte _0808B6A8 @ case 57
	.4byte _0808B6A8 @ case 58
	.4byte _0808B6A8 @ case 59
	.4byte _0808B6A8 @ case 60
	.4byte _0808B6A8 @ case 61
	.4byte _0808B6A8 @ case 62
	.4byte _0808B6A8 @ case 63
	.4byte _0808B6A8 @ case 64
	.4byte _0808B6A8 @ case 65
	.4byte _0808B6A8 @ case 66
	.4byte _0808B6A8 @ case 67
	.4byte _0808B6A8 @ case 68
	.4byte _0808B6A8 @ case 69
	.4byte _0808B6A8 @ case 70
	.4byte _0808B6A8 @ case 71
	.4byte _0808B6A8 @ case 72
	.4byte _0808B6A8 @ case 73
	.4byte _0808B6A8 @ case 74
	.4byte _0808B6A8 @ case 75
	.4byte _0808B6A8 @ case 76
	.4byte _0808B6A8 @ case 77
	.4byte _0808B6A8 @ case 78
	.4byte _0808B6A8 @ case 79
	.4byte _0808B6A8 @ case 80
	.4byte _0808B6A8 @ case 81
	.4byte _0808B6A8 @ case 82
	.4byte _0808B6A8 @ case 83
	.4byte _0808B6A8 @ case 84
	.4byte _0808B6A8 @ case 85
	.4byte _0808B6A8 @ case 86
	.4byte _0808B6A8 @ case 87
	.4byte _0808B6A8 @ case 88
	.4byte _0808B6A8 @ case 89
	.4byte _0808B6A8 @ case 90
	.4byte _0808B6A8 @ case 91
	.4byte _0808B6A8 @ case 92
	.4byte _0808B6A8 @ case 93
	.4byte _0808B6A8 @ case 94
	.4byte _0808B6A8 @ case 95
	.4byte _0808B6A8 @ case 96
	.4byte _0808B6A8 @ case 97
	.4byte _0808B6A8 @ case 98
	.4byte _0808B6A8 @ case 99
	.4byte _0808B6A8 @ case 100
	.4byte _0808B6A8 @ case 101
	.4byte _0808B6A8 @ case 102
	.4byte _0808B6A8 @ case 103
	.4byte _0808B6A8 @ case 104
	.4byte _0808B6A8 @ case 105
	.4byte _0808B6A8 @ case 106
	.4byte _0808B6A8 @ case 107
	.4byte _0808B6A8 @ case 108
	.4byte _0808B6A8 @ case 109
	.4byte _0808B6A8 @ case 110
	.4byte _0808B6A8 @ case 111
	.4byte _0808B6A8 @ case 112
	.4byte _0808B6A8 @ case 113
	.4byte _0808B6A8 @ case 114
	.4byte _0808B6A8 @ case 115
	.4byte _0808B6A8 @ case 116
	.4byte _0808B6A8 @ case 117
	.4byte _0808B6A8 @ case 118
	.4byte _0808B6A8 @ case 119
	.4byte _0808B6A8 @ case 120
	.4byte _0808B6A8 @ case 121
	.4byte _0808B6A8 @ case 122
	.4byte _0808B6A8 @ case 123
	.4byte _0808B6A8 @ case 124
	.4byte _0808B6A8 @ case 125
	.4byte _0808B6A8 @ case 126
	.4byte _0808B6A8 @ case 127
	.4byte _0808B4D0 @ case 128
_0808B44C:
	bl sub_808B0D4
	ldr r0, _0808B480  @ gUnknown_08A01740
	bl Proc_Find
	adds r3, r0, #0
	ldr r0, _0808B484  @ gUnknown_08A016D8
	adds r1, r6, #0
	adds r1, #0x48
	movs r5, #0
	ldrsh r4, [r1, r5]
	lsls r2, r4, #2
	subs r1, #0x14
	adds r1, r1, r2
	ldr r1, [r1]
	movs r5, #0x3c
	ldrsh r2, [r3, r5]
	movs r5, #0x3e
	ldrsh r3, [r3, r5]
	lsls r4, r4, #4
	adds r3, r3, r4
	movs r4, #6
	str r4, [sp]
	movs r4, #1
	b _0808B4B8
	.align 2, 0
_0808B480: .4byte gUnknown_08A01740
_0808B484: .4byte gUnknown_08A016D8
_0808B488:
	bl sub_808B0D4
	ldr r0, _0808B4C8  @ gUnknown_08A01740
	bl Proc_Find
	adds r3, r0, #0
	ldr r0, _0808B4CC  @ gUnknown_08A016D8
	adds r1, r6, #0
	adds r1, #0x48
	movs r2, #0
	ldrsh r4, [r1, r2]
	lsls r2, r4, #2
	subs r1, #0x14
	adds r1, r1, r2
	ldr r1, [r1]
	movs r5, #0x3c
	ldrsh r2, [r3, r5]
	movs r5, #0x3e
	ldrsh r3, [r3, r5]
	lsls r4, r4, #4
	adds r3, r3, r4
	movs r4, #6
	str r4, [sp]
	movs r4, #2
_0808B4B8:
	str r4, [sp, #4]
	str r6, [sp, #8]
	bl sub_80900EC
_0808B4C0:
	ldr r0, [r6, #0x2c]
	adds r0, #1
	str r0, [r6, #0x2c]
	b _0808B772
	.align 2, 0
_0808B4C8: .4byte gUnknown_08A01740
_0808B4CC: .4byte gUnknown_08A016D8
_0808B4D0:
	adds r1, r2, #1
	str r1, [r6, #0x2c]
	ldrb r0, [r2, #1]
	cmp r0, #0x21
	bne _0808B4F2
	adds r2, r6, #0
	adds r2, #0x59
	ldrb r0, [r2]
	adds r0, #1
	movs r1, #1
	ands r0, r1
	strb r0, [r2]
	ldr r0, [r6, #0x2c]
	adds r0, #1
	str r0, [r6, #0x2c]
	subs r7, #1
	b _0808B76A
_0808B4F2:
	cmp r0, #4
	bne _0808B4F8
	b _0808B1B0
_0808B4F8:
	cmp r0, #0x25
	bne _0808B4FE
	b _0808B1D8
_0808B4FE:
	ldr r0, _0808B568  @ gUnknown_08A01740
	bl Proc_Find
	adds r4, r0, #0
	bl sub_808B0D4
	ldr r0, [r6, #0x2c]
	adds r1, r0, #1
	str r1, [r6, #0x2c]
	ldrb r0, [r0, #1]
	cmp r0, #1
	bne _0808B51A
	adds r0, r1, #1
	str r0, [r6, #0x2c]
_0808B51A:
	cmp r4, #0
	bne _0808B520
	b _0808B772
_0808B520:
	adds r0, r6, #0
	bl sub_808B11C
	ldr r0, [r6, #0x2c]
	add r2, sp, #0x10
	add r1, sp, #0xc
	bl sub_808AADC
	ldr r0, [sp, #0xc]
	adds r1, r6, #0
	adds r1, #0x56
	movs r2, #0
	strb r0, [r1]
	ldr r0, [sp, #0x10]
	adds r1, #1
	strb r0, [r1]
	adds r0, r4, #0
	adds r0, #0x44
	ldrh r1, [r0]
	adds r0, r6, #0
	adds r0, #0x54
	strb r1, [r0]
	adds r0, r4, #0
	adds r0, #0x46
	ldrh r0, [r0]
	adds r1, r6, #0
	adds r1, #0x55
	strb r0, [r1]
	adds r0, r6, #0
	adds r0, #0x58
	strb r2, [r0]
	adds r0, r6, #0
	movs r1, #6
	bl Proc_Goto
	b _0808B772
	.align 2, 0
_0808B568: .4byte gUnknown_08A01740
_0808B56C:
	bl sub_808B0D4
	b _0808B606
_0808B572:
	bl sub_808B0D4
	ldr r0, [r6, #0x2c]
	adds r0, #1
	str r0, [r6, #0x2c]
	adds r0, r6, #0
	adds r0, #0x55
	ldrb r1, [r0]
	adds r2, r6, #0
	adds r2, #0x48
	movs r3, #0
	ldrsh r0, [r2, r3]
	adds r0, #1
	cmp r1, r0
	bne _0808B592
	b _0808B1DE
_0808B592:
	ldrh r0, [r2]
	adds r0, #1
	strh r0, [r2]
	b _0808B76A
_0808B59A:
	bl sub_808B0D4
	ldr r0, [r6, #0x2c]
	adds r0, #1
	str r0, [r6, #0x2c]
	adds r1, r6, #0
	adds r1, #0x4a
	movs r0, #8
	strh r0, [r1]
	b _0808B772
_0808B5AE:
	bl sub_808B0D4
	ldr r0, [r6, #0x2c]
	adds r0, #1
	str r0, [r6, #0x2c]
	adds r1, r6, #0
	adds r1, #0x4a
	movs r0, #0x10
	strh r0, [r1]
	b _0808B772
_0808B5C2:
	bl sub_808B0D4
	ldr r0, [r6, #0x2c]
	adds r0, #1
	str r0, [r6, #0x2c]
	adds r1, r6, #0
	adds r1, #0x4a
	movs r0, #0x20
	strh r0, [r1]
	b _0808B772
_0808B5D6:
	bl sub_808B0D4
	ldr r0, [r6, #0x2c]
	adds r0, #1
	str r0, [r6, #0x2c]
	adds r1, r6, #0
	adds r1, #0x4a
	movs r0, #0x40
	strh r0, [r1]
	b _0808B772
_0808B5EA:
	bl sub_808B0D4
	ldr r0, [r6, #0x2c]
	adds r1, r0, #1
	str r1, [r6, #0x2c]
	ldrb r0, [r0, #1]
	cmp r0, #1
	bne _0808B5FE
	adds r0, r1, #1
	str r0, [r6, #0x2c]
_0808B5FE:
	ldr r0, [r6, #0x2c]
	ldrb r0, [r0]
	cmp r0, #0
	bne _0808B638
_0808B606:
	bl sub_808A524
	movs r1, #2
	ands r1, r0
	cmp r1, #0
	bne _0808B614
	b _0808B1F0
_0808B614:
	ldr r0, _0808B630  @ gUnknown_08A016E0
	bl Proc_Find
	movs r1, #1
	bl Proc_Goto
	adds r0, r6, #0
	movs r1, #1
	bl Proc_Goto
	ldr r0, _0808B634  @ gUnknown_08A01818
	bl Proc_EndEach
	b _0808B772
	.align 2, 0
_0808B630: .4byte gUnknown_08A016E0
_0808B634: .4byte gUnknown_08A01818
_0808B638:
	bl sub_808A524
	movs r1, #0x10
	ands r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	cmp r1, #0
	beq _0808B64A
	b _0808B1F8
_0808B64A:
	ldr r0, [r6, #0x2c]
	ldrb r0, [r0]
	cmp r0, #0
	bne _0808B654
	b _0808B772
_0808B654:
	adds r0, r6, #0
	adds r0, #0x58
	strb r1, [r0]
	adds r0, r6, #0
	movs r1, #5
	bl Proc_Goto
	b _0808B772
_0808B664:
	bl sub_808B0D4
	ldr r0, [r6, #0x2c]
	adds r0, #1
	str r0, [r6, #0x2c]
	ldr r0, _0808B6A4  @ gUnknown_08A01740
	bl Proc_Find
	adds r4, r6, #0
	adds r4, #0x52
	movs r5, #0x3c
	ldrsh r1, [r0, r5]
	ldrb r2, [r4]
	adds r1, r1, r2
	movs r3, #0x3e
	ldrsh r2, [r0, r3]
	adds r0, r6, #0
	adds r0, #0x48
	movs r5, #0
	ldrsh r0, [r0, r5]
	lsls r0, r0, #4
	adds r2, r2, r0
	adds r2, #8
	adds r0, r6, #0
	bl StartTalkWaitForInput
	ldr r0, [r6, #0x2c]
	adds r1, r4, #0
	bl sub_808AB98
	b _0808B772
	.align 2, 0
_0808B6A4: .4byte gUnknown_08A01740
_0808B6A8:
	bl sub_808A524
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	beq _0808B6CE
	adds r5, r6, #0
	adds r5, #0x48
	movs r1, #0
	ldrsh r0, [r5, r1]
	lsls r0, r0, #2
	adds r4, r6, #0
	adds r4, #0x34
	adds r0, r4, r0
	ldr r0, [r0]
	movs r1, #1
	bl Text_SetColorId
	b _0808B70A
_0808B6CE:
	adds r0, r6, #0
	adds r0, #0x59
	ldrb r0, [r0]
	cmp r0, #0
	beq _0808B6F2
	adds r5, r6, #0
	adds r5, #0x48
	movs r2, #0
	ldrsh r0, [r5, r2]
	lsls r0, r0, #2
	adds r4, r6, #0
	adds r4, #0x34
	adds r0, r4, r0
	ldr r0, [r0]
	movs r1, #0xa
	bl Text_SetColorId
	b _0808B70A
_0808B6F2:
	adds r5, r6, #0
	adds r5, #0x48
	movs r3, #0
	ldrsh r0, [r5, r3]
	lsls r0, r0, #2
	adds r4, r6, #0
	adds r4, #0x34
	adds r0, r4, r0
	ldr r0, [r0]
	movs r1, #6
	bl Text_SetColorId
_0808B70A:
	movs r1, #0
	ldrsh r0, [r5, r1]
	lsls r0, r0, #2
	adds r0, r4, r0
	ldr r0, [r0]
	ldr r1, [r6, #0x2c]
	bl Text_AppendChar
	str r0, [r6, #0x2c]
	bl GetTextDisplaySpeed
	adds r4, r0, #0
	cmp r4, #1
	bne _0808B730
	bl GetGameClock
	ands r0, r4
	cmp r0, #0
	beq _0808B76A
_0808B730:
	bl sub_808A524
	movs r1, #0x10
	ands r1, r0
	cmp r1, #0
	beq _0808B758
	ldr r0, _0808B750  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0808B76A
	ldr r0, _0808B754  @ 0x000002E5
	bl m4aSongNumStart
	b _0808B76A
	.align 2, 0
_0808B750: .4byte gPlaySt
_0808B754: .4byte 0x000002E5
_0808B758:
	ldr r0, _0808B784  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0808B76A
	movs r0, #0x6e
	bl m4aSongNumStart
_0808B76A:
	adds r7, #1
	cmp r7, r8
	bge _0808B772
	b _0808B22C
_0808B772:
	movs r0, #0
	bl SetFont
_0808B778:
	add sp, #0x14
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808B784: .4byte gPlaySt

	THUMB_FUNC_END sub_808B178

	THUMB_FUNC_START sub_808B788
sub_808B788: @ 0x0808B788
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0808B7B0  @ gUnknown_08A01818
	bl Proc_Find
	cmp r0, #0
	beq _0808B7AA
	ldr r0, _0808B7B4  @ gUnknown_08A016E0
	bl Proc_Find
	movs r1, #0
	bl Proc_Goto
	adds r0, r4, #0
	movs r1, #0
	bl Proc_Goto
_0808B7AA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808B7B0: .4byte gUnknown_08A01818
_0808B7B4: .4byte gUnknown_08A016E0

	THUMB_FUNC_END sub_808B788

	THUMB_FUNC_START sub_808B7B8
sub_808B7B8: @ 0x0808B7B8
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x54
	ldrb r0, [r0]
	adds r0, #1
	adds r1, r4, #0
	adds r1, #0x55
	ldrb r1, [r1]
	bl sub_808A530
	adds r1, r4, #0
	adds r1, #0x58
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x10
	bne _0808B7F8
	adds r0, r4, #0
	adds r0, #0x48
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r0, r0, #3
	ldr r1, _0808B800  @ gUnknown_0203E800
	adds r0, r0, r1
	movs r1, #0
	bl Text_SetXCursor
	adds r0, r4, #0
	bl Proc_Break
_0808B7F8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808B800: .4byte gUnknown_0203E800

	THUMB_FUNC_END sub_808B7B8

	THUMB_FUNC_START sub_808B804
sub_808B804: @ 0x0808B804
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x48
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _0808B81A
	adds r0, r4, #0
	bl Proc_Break
	b _0808B822
_0808B81A:
	adds r0, r4, #0
	movs r1, #5
	bl Proc_Goto
_0808B822:
	adds r1, r4, #0
	adds r1, #0x48
	ldrh r2, [r1]
	movs r3, #0
	ldrsh r0, [r1, r3]
	cmp r0, #0
	beq _0808B834
	subs r0, r2, #1
	strh r0, [r1]
_0808B834:
	adds r1, r4, #0
	adds r1, #0x58
	movs r0, #0
	strb r0, [r1]
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_808B804

	THUMB_FUNC_START sub_808B844
sub_808B844: @ 0x0808B844
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0808B86C  @ gUnknown_08A016E0
	bl Proc_Find
	movs r1, #3
	bl Proc_Goto
	adds r0, r4, #0
	bl Proc_Break
	movs r0, #0
	bl SetFont
	movs r0, #0
	bl SetFontGlyphSet
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808B86C: .4byte gUnknown_08A016E0

	THUMB_FUNC_END sub_808B844

	THUMB_FUNC_START sub_808B870
sub_808B870: @ 0x0808B870
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r0, _0808B900  @ gUnknown_08A01740
	bl Proc_Find
	adds r6, r0, #0
	adds r5, r4, #0
	adds r5, #0x58
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
	cmp r6, #0
	beq _0808B8C8
	adds r0, r4, #0
	adds r0, #0x54
	ldrb r0, [r0]
	ldrb r3, [r5]
	movs r2, #2
	subs r2, r2, r3
	adds r1, r0, #0
	muls r1, r2, r1
	adds r0, r4, #0
	adds r0, #0x56
	ldrb r0, [r0]
	muls r0, r3, r0
	adds r1, r1, r0
	lsrs r0, r1, #0x1f
	adds r1, r1, r0
	asrs r1, r1, #1
	adds r0, r4, #0
	adds r0, #0x55
	ldrb r0, [r0]
	muls r2, r0, r2
	adds r0, r4, #0
	adds r0, #0x57
	ldrb r0, [r0]
	muls r0, r3, r0
	adds r2, r2, r0
	lsrs r0, r2, #0x1f
	adds r2, r2, r0
	asrs r2, r2, #1
	adds r0, r6, #0
	bl sub_808A838
_0808B8C8:
	ldrb r0, [r5]
	cmp r0, #2
	bne _0808B8F8
	adds r0, r4, #0
	adds r0, #0x56
	ldrb r0, [r0]
	lsrs r0, r0, #3
	adds r1, r4, #0
	adds r1, #0x54
	strb r0, [r1]
	adds r0, r4, #0
	adds r0, #0x57
	ldrb r0, [r0]
	lsrs r0, r0, #4
	adds r1, r0, #0
	cmp r0, #5
	bls _0808B8EC
	movs r1, #5
_0808B8EC:
	adds r0, r4, #0
	adds r0, #0x55
	strb r1, [r0]
	adds r0, r4, #0
	bl Proc_Break
_0808B8F8:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0808B900: .4byte gUnknown_08A01740

	THUMB_FUNC_END sub_808B870

	THUMB_FUNC_START sub_808B904
sub_808B904: @ 0x0808B904
	push {lr}
	ldr r0, _0808B91C  @ gUnknown_08A016E0
	bl Proc_Find
	cmp r0, #0
	beq _0808B920
	adds r0, #0x38
	ldrb r0, [r0]
	cmp r0, #0
	bne _0808B920
	movs r0, #0
	b _0808B922
	.align 2, 0
_0808B91C: .4byte gUnknown_08A016E0
_0808B920:
	movs r0, #1
_0808B922:
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_808B904

	THUMB_FUNC_START sub_808B928
sub_808B928: @ 0x0808B928
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _0808B998  @ gUnknown_0203E7E8
	adds r0, r4, #0
	bl SetFont
	movs r0, #0
	bl SetFontGlyphSet
	movs r0, #1
	bl SetFontGlyphSet
	bl sub_808A524
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	bne _0808B99C
	adds r0, r4, #0
	adds r0, #0x18
	movs r1, #6
	bl Text_SetColorId
	adds r0, r4, #0
	adds r0, #0x20
	movs r1, #6
	bl Text_SetColorId
	adds r0, r4, #0
	adds r0, #0x28
	movs r1, #6
	bl Text_SetColorId
	bl sub_808A524
	movs r1, #0x10
	ands r1, r0
	cmp r1, #0
	beq _0808B9BA
	bl sub_808A524
	movs r1, #0x20
	ands r1, r0
	cmp r1, #0
	bne _0808B9BA
	adds r0, r4, #0
	adds r0, #0x30
	movs r1, #6
	bl Text_SetColorId
	adds r0, r4, #0
	adds r0, #0x38
	movs r1, #6
	bl Text_SetColorId
	b _0808B9BA
	.align 2, 0
_0808B998: .4byte gUnknown_0203E7E8
_0808B99C:
	movs r4, #0
	b _0808B9AE
_0808B9A0:
	lsls r0, r4, #3
	ldr r1, _0808BA38  @ gUnknown_0203E800
	adds r0, r0, r1
	movs r1, #0
	bl Text_SetColorId
	adds r4, #1
_0808B9AE:
	bl sub_808A524
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x18
	cmp r4, r0
	blt _0808B9A0
_0808B9BA:
	movs r0, #0
	bl SetFont
	ldr r4, _0808BA3C  @ gUnknown_08A01760
	adds r0, r4, #0
	bl Proc_EndEach
	adds r0, r4, #0
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	ldr r1, _0808BA40  @ gUnknown_0203E7E8
	str r1, [r4, #0x30]
	adds r0, r1, #0
	adds r0, #0x18
	str r0, [r4, #0x34]
	adds r0, #8
	str r0, [r4, #0x38]
	adds r0, #8
	str r0, [r4, #0x3c]
	adds r0, #8
	str r0, [r4, #0x40]
	adds r0, #8
	str r0, [r4, #0x44]
	adds r1, r4, #0
	adds r1, #0x48
	movs r0, #0
	strh r0, [r1]
	ldr r0, [r5, #0x5c]
	bl GetStringFromIndex
	bl sub_800A2A4
	str r0, [r4, #0x2c]
	ldr r1, [r5, #0x2c]
	adds r0, r4, #0
	adds r0, #0x54
	strb r1, [r0]
	ldr r0, [r5, #0x30]
	adds r1, r4, #0
	adds r1, #0x55
	strb r0, [r1]
	bl sub_808B904
	lsls r0, r0, #0x18
	asrs r1, r0, #0x18
	cmp r1, #0
	beq _0808BA44
	bl GetTextDisplaySpeed
	adds r1, r4, #0
	adds r1, #0x4c
	strh r0, [r1]
	lsls r0, r0, #0x10
	movs r1, #0x80
	cmp r0, #0
	beq _0808BA30
	movs r1, #1
_0808BA30:
	adds r0, r4, #0
	adds r0, #0x4e
	strh r1, [r0]
	b _0808BA52
	.align 2, 0
_0808BA38: .4byte gUnknown_0203E800
_0808BA3C: .4byte gUnknown_08A01760
_0808BA40: .4byte gUnknown_0203E7E8
_0808BA44:
	adds r0, r4, #0
	adds r0, #0x4c
	strh r1, [r0]
	adds r1, r4, #0
	adds r1, #0x4e
	movs r0, #0x80
	strh r0, [r1]
_0808BA52:
	adds r1, r4, #0
	adds r1, #0x4a
	movs r0, #0
	strh r0, [r1]
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_808B928

	THUMB_FUNC_START sub_808BA60
sub_808BA60: @ 0x0808BA60
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	ldr r0, _0808BA94  @ gUnknown_08A01800
	movs r1, #3
	bl Proc_Start
	adds r1, r0, #0
	str r4, [r1, #0x5c]
	cmp r5, #0
	bge _0808BA7A
	adds r5, #7
_0808BA7A:
	asrs r0, r5, #3
	str r0, [r1, #0x2c]
	adds r0, r6, #0
	cmp r6, #0
	bge _0808BA86
	adds r0, #0xf
_0808BA86:
	asrs r0, r0, #4
	cmp r0, #5
	bgt _0808BA98
	cmp r0, #0
	bge _0808BA9A
	movs r0, #0
	b _0808BA9A
	.align 2, 0
_0808BA94: .4byte gUnknown_08A01800
_0808BA98:
	movs r0, #5
_0808BA9A:
	str r0, [r1, #0x30]
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_808BA60

	THUMB_FUNC_START sub_808BAA4
sub_808BAA4: @ 0x0808BAA4
	push {r4, lr}
	ldr r4, _0808BAFC  @ gUnknown_0203E7E8
	adds r0, r4, #0
	bl SetFont
	bl sub_808A524
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	bne _0808BB00
	adds r0, r4, #0
	adds r0, #0x18
	bl sub_80045FC
	adds r0, r4, #0
	adds r0, #0x20
	bl sub_80045FC
	adds r0, r4, #0
	adds r0, #0x28
	bl sub_80045FC
	bl sub_808A524
	movs r1, #0x10
	ands r1, r0
	cmp r1, #0
	beq _0808BB1E
	bl sub_808A524
	movs r1, #0x20
	ands r1, r0
	cmp r1, #0
	bne _0808BB1E
	adds r0, r4, #0
	adds r0, #0x30
	bl sub_80045FC
	adds r0, r4, #0
	adds r0, #0x38
	bl sub_80045FC
	b _0808BB1E
	.align 2, 0
_0808BAFC: .4byte gUnknown_0203E7E8
_0808BB00:
	movs r4, #0
	b _0808BB12
_0808BB04:
	lsls r0, r4, #3
	ldr r1, _0808BB38  @ gUnknown_0203E800
	adds r0, r0, r1
	movs r1, #0
	bl Text_80046B4
	adds r4, #1
_0808BB12:
	bl sub_808A524
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x18
	cmp r4, r0
	blt _0808BB04
_0808BB1E:
	ldr r0, _0808BB3C  @ gUnknown_08A01760
	bl Proc_EndEach
	ldr r0, _0808BB40  @ gUnknown_08A01800
	bl Proc_EndEach
	movs r0, #0
	bl SetFont
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808BB38: .4byte gUnknown_0203E800
_0808BB3C: .4byte gUnknown_08A01760
_0808BB40: .4byte gUnknown_08A01800

	THUMB_FUNC_END sub_808BAA4

	THUMB_FUNC_START sub_808BB44
sub_808BB44: @ 0x0808BB44
	push {lr}
	ldr r0, _0808BB54  @ gUnknown_08A01818
	movs r1, #0
	bl Proc_Start
	pop {r0}
	bx r0
	.align 2, 0
_0808BB54: .4byte gUnknown_08A01818

	THUMB_FUNC_END sub_808BB44

	THUMB_FUNC_START sub_808BB58
sub_808BB58: @ 0x0808BB58
	push {lr}
	ldr r0, _0808BB68  @ gUnknown_08A01818
	bl Proc_Find
	cmp r0, #0
	bne _0808BB6C
	movs r0, #0
	b _0808BB6E
	.align 2, 0
_0808BB68: .4byte gUnknown_08A01818
_0808BB6C:
	movs r0, #1
_0808BB6E:
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_808BB58

	THUMB_FUNC_START sub_808BB74
sub_808BB74: @ 0x0808BB74
	push {lr}
	ldr r0, _0808BB98  @ gUnknown_08A016E0
	bl Proc_EndEach
	ldr r0, _0808BB9C  @ gUnknown_08A01818
	bl Proc_EndEach
	ldr r0, _0808BBA0  @ gUnknown_08A01740
	bl Proc_EndEach
	ldr r0, _0808BBA4  @ gUnknown_08A01760
	bl Proc_EndEach
	ldr r0, _0808BBA8  @ gUnknown_08A01800
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
_0808BB98: .4byte gUnknown_08A016E0
_0808BB9C: .4byte gUnknown_08A01818
_0808BBA0: .4byte gUnknown_08A01740
_0808BBA4: .4byte gUnknown_08A01760
_0808BBA8: .4byte gUnknown_08A01800

	THUMB_FUNC_END sub_808BB74

.align 2, 0
