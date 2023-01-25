	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	THUMB_FUNC_START sub_80AA7AC
sub_80AA7AC: @ 0x080AA7AC
	push {r4, r5, lr}
	movs r2, #0x3f
	ands r2, r0
	asrs r2, r2, #2
	ldr r4, _080AA7DC  @ gPaletteBuffer
	lsls r2, r2, #1
	ldr r0, _080AA7E0  @ gUnknown_08A28088
	adds r2, r2, r0
	ldrh r3, [r2]
	ldr r5, _080AA7E4  @ 0x00000222
	adds r0, r4, r5
	strh r3, [r0]
	lsls r1, r1, #6
	ldr r0, _080AA7E8  @ 0x00000342
	adds r1, r1, r0
	adds r1, r1, r4
	ldrh r0, [r2]
	strh r0, [r1]
	bl EnablePaletteSync
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080AA7DC: .4byte gPaletteBuffer
_080AA7E0: .4byte gUnknown_08A28088
_080AA7E4: .4byte 0x00000222
_080AA7E8: .4byte 0x00000342

	THUMB_FUNC_END sub_80AA7AC

	THUMB_FUNC_START sub_80AA7EC
sub_80AA7EC: @ 0x080AA7EC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	ldr r4, [r0, #0x14]
	adds r0, r4, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	lsls r0, r0, #5
	movs r1, #0xdc
	bl __divsi3
	movs r1, #0x20
	subs r1, r1, r0
	lsls r1, r1, #0x18
	movs r0, #0x92
	lsls r0, r0, #0x18
	adds r1, r1, r0
	lsrs r1, r1, #0x18
	mov r9, r1
	movs r1, #0x8f
	mov r8, r1
	adds r0, r4, #0
	adds r0, #0x42
	ldrh r0, [r0]
	cmp r0, #1
	bne _080AA83A
	ldr r0, [r4, #0x54]
	mov r4, sp
	adds r4, #6
	add r5, sp, #8
	add r1, sp, #4
	adds r2, r4, #0
	adds r3, r5, #0
	bl ComputeDisplayTime
	b _080AA858
_080AA83A:
	adds r0, r4, #0
	adds r0, #0x2c
	ldrb r1, [r0]
	lsls r1, r1, #2
	adds r0, #0x1c
	adds r0, r0, r1
	ldr r0, [r0]
	mov r4, sp
	adds r4, #6
	add r5, sp, #8
	add r1, sp, #4
	adds r2, r4, #0
	adds r3, r5, #0
	bl ComputeDisplayTime
_080AA858:
	mov sl, r4
	mov r1, r8
	adds r1, #6
	mov r2, r9
	subs r2, #0xe
	ldr r3, _080AA9CC  @ gUnknown_08A20590
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [sp]
	movs r0, #0xd
	bl PutSpriteExt
	add r0, sp, #4
	ldrh r0, [r0]
	mov r7, r9
	subs r7, #8
	cmp r0, #0x63
	bls _080AA8BE
	mov r5, r8
	adds r5, #0xa
	ldr r4, _080AA9D0  @ gUnknown_08A2067C
	add r0, sp, #4
	ldrh r0, [r0]
	movs r6, #0x64
	movs r1, #0x64
	bl __udivsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0xe
	adds r0, r0, r4
	ldr r3, [r0]
	movs r0, #0xe0
	lsls r0, r0, #7
	str r0, [sp]
	movs r0, #0xd
	adds r1, r5, #0
	adds r2, r7, #0
	bl PutSpriteExt
	add r5, sp, #4
	adds r0, r5, #0
	ldrh r4, [r0]
	adds r0, r4, #0
	movs r1, #0x64
	bl __udivsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	muls r0, r6, r0
	subs r4, r4, r0
	strh r4, [r5]
_080AA8BE:
	add r0, sp, #4
	ldrh r0, [r0]
	cmp r0, #9
	bls _080AA8EE
	mov r5, r8
	adds r5, #0x12
	ldr r4, _080AA9D0  @ gUnknown_08A2067C
	add r0, sp, #4
	ldrh r0, [r0]
	movs r1, #0xa
	bl __udivsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0xe
	adds r0, r0, r4
	ldr r3, [r0]
	movs r0, #0xe0
	lsls r0, r0, #7
	str r0, [sp]
	movs r0, #0xd
	adds r1, r5, #0
	adds r2, r7, #0
	bl PutSpriteExt
_080AA8EE:
	mov r6, r8
	adds r6, #0x1a
	ldr r5, _080AA9D0  @ gUnknown_08A2067C
	add r0, sp, #4
	ldrh r0, [r0]
	movs r1, #0xa
	bl __umodsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0xe
	adds r0, r0, r5
	ldr r3, [r0]
	movs r4, #0xe0
	lsls r4, r4, #7
	str r4, [sp]
	movs r0, #0xd
	adds r1, r6, #0
	adds r2, r7, #0
	bl PutSpriteExt
	mov r1, r8
	adds r1, #0x22
	mov r2, r9
	subs r2, #7
	ldr r3, [r5, #0x28]
	str r4, [sp]
	movs r0, #0xd
	bl PutSpriteExt
	adds r6, #0x10
	mov r1, sl
	ldrh r0, [r1]
	movs r1, #0xa
	bl __udivsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0xe
	adds r0, r0, r5
	ldr r3, [r0]
	str r4, [sp]
	movs r0, #0xd
	adds r1, r6, #0
	adds r2, r7, #0
	bl PutSpriteExt
	adds r6, #8
	mov r1, sl
	ldrh r0, [r1]
	movs r1, #0xa
	bl __umodsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0xe
	adds r0, r0, r5
	ldr r3, [r0]
	str r4, [sp]
	movs r0, #0xd
	adds r1, r6, #0
	adds r2, r7, #0
	bl PutSpriteExt
	mov r1, r8
	adds r1, #0x3a
	mov r2, r9
	adds r2, #1
	ldr r5, _080AA9D4  @ gUnknown_08A20650
	ldr r3, [r5, #0x28]
	str r4, [sp]
	movs r0, #0xd
	bl PutSpriteExt
	adds r6, #0x10
	mov r1, sp
	ldrh r0, [r1, #8]
	movs r1, #0xa
	bl __udivsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0xe
	adds r0, r0, r5
	ldr r3, [r0]
	str r4, [sp]
	movs r0, #0xd
	adds r1, r6, #0
	mov r2, r9
	bl PutSpriteExt
	adds r6, #8
	mov r1, sp
	ldrh r0, [r1, #8]
	movs r1, #0xa
	bl __umodsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0xe
	adds r0, r0, r5
	ldr r3, [r0]
	str r4, [sp]
	movs r0, #0xd
	adds r1, r6, #0
	mov r2, r9
	bl PutSpriteExt
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080AA9CC: .4byte gUnknown_08A20590
_080AA9D0: .4byte gUnknown_08A2067C
_080AA9D4: .4byte gUnknown_08A20650

	THUMB_FUNC_END sub_80AA7EC

	THUMB_FUNC_START sub_80AA9D8
sub_80AA9D8: @ 0x080AA9D8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	ldrh r1, [r0, #0x3e]
	adds r1, #1
	strh r1, [r0, #0x3e]
	adds r2, r0, #0
	adds r2, #0x40
	ldrh r1, [r2]
	adds r1, #2
	strh r1, [r2]
	ldrh r4, [r0, #0x3e]
	lsls r4, r4, #0x14
	lsrs r4, r4, #0x17
	ldrh r0, [r2]
	lsrs r7, r0, #3
	movs r0, #0xff
	ands r7, r0
	movs r0, #0
	movs r1, #1
	bl sub_8014E74
	adds r6, r7, #0
	ldr r1, _080AAA64  @ gSinLookup
	mov sl, r1
	lsls r4, r4, #0x10
	asrs r2, r4, #0x10
	mov r8, r2
	adds r5, r0, #0
	mov r9, r4
	movs r4, #0x9f
_080AAA1A:
	movs r0, #0xff
	ands r0, r6
	lsls r0, r0, #1
	add r0, sl
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r1, #0xc0
	lsls r1, r1, #2
	bl __divsi3
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add r0, r8
	ldr r2, _080AAA68  @ 0x000001FF
	adds r1, r2, #0
	ands r0, r1
	strh r0, [r5]
	adds r6, #0xc
	adds r5, #2
	subs r4, #1
	cmp r4, #0
	bge _080AAA1A
	mov r0, r9
	lsrs r1, r0, #0x10
	adds r2, r7, #0
	movs r0, #2
	bl BG_SetPosition
	bl sub_8014EA8
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080AAA64: .4byte gSinLookup
_080AAA68: .4byte 0x000001FF

	THUMB_FUNC_END sub_80AA9D8

	THUMB_FUNC_START sub_80AAA6C
sub_80AAA6C: @ 0x080AAA6C
	push {lr}
	bl sub_8014E3C
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80AAA6C

	THUMB_FUNC_START sub_80AAA78
sub_80AAA78: @ 0x080AAA78
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r6, r0, #0
	adds r1, r6, #0
	adds r1, #0x29
	movs r7, #0
	movs r0, #1
	strb r0, [r1]
	movs r5, #0
	strh r7, [r6, #0x2c]
	movs r4, #0x80
	lsls r4, r4, #1
	strh r4, [r6, #0x2e]
	adds r0, r6, #0
	adds r0, #0x3a
	strb r5, [r0]
	adds r1, #0x12
	movs r0, #0x28
	strb r0, [r1]
	strh r7, [r6, #0x30]
	adds r0, r6, #0
	adds r0, #0x32
	strb r5, [r0]
	str r4, [sp]
	movs r0, #0
	adds r1, r4, #0
	movs r2, #0
	movs r3, #0
	bl WriteOAMRotScaleData
	str r4, [sp]
	movs r0, #1
	adds r1, r4, #0
	movs r2, #0
	movs r3, #0
	bl WriteOAMRotScaleData
	str r4, [sp]
	movs r0, #2
	adds r1, r4, #0
	movs r2, #0
	movs r3, #0
	bl WriteOAMRotScaleData
	str r4, [sp]
	movs r0, #3
	adds r1, r4, #0
	movs r2, #0
	movs r3, #0
	bl WriteOAMRotScaleData
	strh r7, [r6, #0x2a]
	adds r0, r6, #0
	bl StartSaveDrawCursor
	str r0, [r6, #0x34]
	adds r0, r6, #0
	adds r0, #0x39
	strb r5, [r0]
	ldr r1, [r6, #0x14]
	adds r2, r1, #0
	adds r2, #0x3f
	ldrb r0, [r2]
	cmp r0, #0xff
	bne _080AAAFE
	str r7, [r1, #0x60]
	b _080AAB1C
_080AAAFE:
	ldr r0, _080AAB64  @ gUnknown_08A280A8
	movs r1, #0xa0
	lsls r1, r1, #1
	ldrb r2, [r2]
	lsls r2, r2, #5
	adds r2, #0x30
	movs r3, #0xc5
	lsls r3, r3, #6
	str r7, [sp]
	movs r4, #4
	str r4, [sp, #4]
	bl APProc_Create
	ldr r1, [r6, #0x14]
	str r0, [r1, #0x60]
_080AAB1C:
	ldr r0, [r6, #0x14]
	adds r0, #0x2c
	ldrb r2, [r0]
	adds r0, r6, #0
	adds r0, #0x3c
	movs r1, #0
	strb r2, [r0]
	adds r0, #4
	strh r1, [r0]
	strh r1, [r6, #0x3e]
	ldr r0, _080AAB68  @ gUnknown_02000000
	bl sub_8014DA8
	ldr r1, _080AAB6C  @ 0x04000018
	movs r0, #0
	bl sub_8014EC4
	movs r0, #0
	bl sub_8014EF4
	adds r0, r6, #0
	bl sub_80AA9D8
	ldr r0, _080AAB70  @ gUnknown_03004990
	ldr r0, [r0]
	ldr r1, _080AAB74  @ 0x0000079E
	adds r0, r0, r1
	movs r1, #1
	strb r1, [r0]
	bl sub_80AB548
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080AAB64: .4byte gUnknown_08A280A8
_080AAB68: .4byte gUnknown_02000000
_080AAB6C: .4byte 0x04000018
_080AAB70: .4byte gUnknown_03004990
_080AAB74: .4byte 0x0000079E

	THUMB_FUNC_END sub_80AAA78

	THUMB_FUNC_START sub_80AAB78
sub_80AAB78: @ 0x080AAB78
	push {lr}
	lsls r1, r1, #0x10
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080AABA4
	ldr r2, _080AABA0  @ gPaletteBuffer
	lsrs r0, r1, #0x12
	movs r1, #0xf
	ands r0, r1
	movs r1, #0xc8
	lsls r1, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	movs r1, #0xb4
	lsls r1, r1, #2
	adds r2, r2, r1
	strh r0, [r2]
	b _080AABB2
	.align 2, 0
_080AABA0: .4byte gPaletteBuffer
_080AABA4:
	ldr r0, _080AABBC  @ gPaletteBuffer
	ldr r2, _080AABC0  @ 0x0000033A
	adds r1, r0, r2
	ldrh r1, [r1]
	subs r2, #0x6a
	adds r0, r0, r2
	strh r1, [r0]
_080AABB2:
	bl EnablePaletteSync
	pop {r0}
	bx r0
	.align 2, 0
_080AABBC: .4byte gPaletteBuffer
_080AABC0: .4byte 0x0000033A

	THUMB_FUNC_END sub_80AAB78

	THUMB_FUNC_START sub_80AABC4
sub_80AABC4: @ 0x080AABC4
	push {r4, r5, r6, lr}
	mov r6, sl
	mov r5, r9
	mov r4, r8
	push {r4, r5, r6}
	sub sp, #4
	adds r6, r1, #0
	mov r8, r2
	adds r4, r3, #0
	ldr r0, [sp, #0x20]
	ldr r5, [sp, #0x24]
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	ldr r1, _080AAC34  @ 0x000001FF
	mov r9, r1
	adds r1, r6, #0
	mov r2, r9
	ands r1, r2
	ldr r3, _080AAC38  @ gUnknown_08A2051C
	movs r2, #0xf
	mov sl, r2
	ands r0, r2
	lsls r0, r0, #0xc
	str r0, [sp]
	movs r0, #4
	mov r2, r8
	bl PutSpriteExt
	adds r6, #8
	mov r0, r9
	ands r6, r0
	movs r1, #8
	add r8, r1
	ldr r0, _080AAC3C  @ gUnknown_08A209B8
	lsls r4, r4, #2
	adds r4, r4, r0
	ldr r3, [r4]
	mov r2, sl
	ands r5, r2
	lsls r5, r5, #0xc
	str r5, [sp]
	movs r0, #4
	adds r1, r6, #0
	mov r2, r8
	bl PutSpriteExt
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080AAC34: .4byte 0x000001FF
_080AAC38: .4byte gUnknown_08A2051C
_080AAC3C: .4byte gUnknown_08A209B8

	THUMB_FUNC_END sub_80AABC4

	THUMB_FUNC_START sub_80AAC40
sub_80AAC40: @ 0x080AAC40
	push {r4, r5, r6, lr}
	mov r6, sl
	mov r5, r9
	mov r4, r8
	push {r4, r5, r6}
	sub sp, #4
	adds r6, r1, #0
	mov r8, r2
	adds r4, r3, #0
	ldr r0, [sp, #0x20]
	ldr r5, [sp, #0x24]
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	ldr r1, _080AACB0  @ 0x000001FF
	mov r9, r1
	adds r1, r6, #0
	mov r2, r9
	ands r1, r2
	ldr r3, _080AACB4  @ gUnknown_08A2051C
	movs r2, #0xf
	mov sl, r2
	ands r0, r2
	lsls r0, r0, #0xc
	str r0, [sp]
	movs r0, #4
	mov r2, r8
	bl PutSpriteExt
	adds r6, #8
	mov r0, r9
	ands r6, r0
	movs r1, #8
	add r8, r1
	ldr r0, _080AACB8  @ gUnknown_08A2099C
	lsls r4, r4, #2
	adds r4, r4, r0
	ldr r3, [r4]
	mov r2, sl
	ands r5, r2
	lsls r5, r5, #0xc
	str r5, [sp]
	movs r0, #4
	adds r1, r6, #0
	mov r2, r8
	bl PutSpriteExt
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080AACB0: .4byte 0x000001FF
_080AACB4: .4byte gUnknown_08A2051C
_080AACB8: .4byte gUnknown_08A2099C

	THUMB_FUNC_END sub_80AAC40

	THUMB_FUNC_START sub_80AACBC
sub_80AACBC: @ 0x080AACBC
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r7, r0, #0
	adds r4, r7, #0
	adds r4, #0x3c
	ldr r0, [r7, #0x14]
	adds r1, r0, #0
	adds r1, #0x2c
	ldrb r0, [r4]
	ldrb r2, [r1]
	cmp r0, r2
	beq _080AACE8
	ldrb r0, [r1]
	bl sub_80ABD88
	ldr r0, [r7, #0x14]
	adds r0, #0x2c
	ldrb r0, [r0]
	strb r0, [r4]
_080AACE8:
	ldrh r0, [r7, #0x2a]
	ldrb r1, [r4]
	bl sub_80ABE3C
	bl EnablePaletteSync
	ldr r1, [r7, #0x14]
	adds r4, r1, #0
	adds r4, #0x3f
	ldrb r3, [r4]
	adds r0, r3, #0
	cmp r0, #0xff
	beq _080AADBA
	adds r5, r1, #0
	adds r5, #0x44
	ldrh r2, [r5]
	adds r1, r2, #0
	movs r0, #0x80
	lsls r0, r0, #1
	cmp r1, r0
	beq _080AADBA
	cmp r1, #0xf
	bhi _080AAD1C
	movs r0, #0xff
	strb r0, [r4]
	b _080AADB0
_080AAD1C:
	ldr r0, _080AADDC  @ gSinLookup
	mov r9, r0
	movs r4, #0xff
	adds r0, r4, #0
	ands r0, r2
	adds r0, #0x40
	lsls r0, r0, #1
	add r0, r9
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r0, r0, #4
	ldrh r1, [r5]
	bl Div
	mov r8, r0
	mov r2, r8
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	mov r8, r2
	ldr r1, [r7, #0x14]
	adds r1, #0x44
	ldrh r2, [r1]
	adds r0, r4, #0
	ands r0, r2
	lsls r0, r0, #1
	add r0, r9
	movs r2, #0
	ldrsh r0, [r0, r2]
	negs r0, r0
	lsls r0, r0, #4
	ldrh r1, [r1]
	bl Div
	adds r6, r0, #0
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	ldr r1, [r7, #0x14]
	adds r1, #0x44
	ldrh r2, [r1]
	adds r0, r4, #0
	ands r0, r2
	lsls r0, r0, #1
	add r0, r9
	movs r2, #0
	ldrsh r0, [r0, r2]
	lsls r0, r0, #4
	ldrh r1, [r1]
	bl Div
	adds r5, r0, #0
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	ldr r1, [r7, #0x14]
	adds r1, #0x44
	ldrh r0, [r1]
	ands r4, r0
	adds r4, #0x40
	lsls r4, r4, #1
	add r4, r9
	movs r2, #0
	ldrsh r0, [r4, r2]
	lsls r0, r0, #4
	ldrh r1, [r1]
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	movs r0, #3
	mov r1, r8
	adds r2, r6, #0
	adds r3, r5, #0
	bl WriteOAMRotScaleData
_080AADB0:
	ldr r1, [r7, #0x14]
	adds r1, #0x44
	ldrh r0, [r1]
	subs r0, #0x10
	strh r0, [r1]
_080AADBA:
	ldrh r0, [r7, #0x2a]
	adds r1, r7, #0
	adds r1, #0x3c
	ldrb r1, [r1]
	bl sub_80AA7AC
	ldrh r0, [r7, #0x2a]
	adds r0, #1
	strh r0, [r7, #0x2a]
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080AADDC: .4byte gSinLookup

	THUMB_FUNC_END sub_80AACBC

	THUMB_FUNC_START sub_80AADE0
sub_80AADE0: @ 0x080AADE0
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, [r4, #0x14]
	adds r0, #0x2f
	ldrb r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #4
	movs r1, #0xdc
	bl __divsi3
	movs r1, #0xe8
	lsls r1, r1, #1
	adds r5, r0, r1
	movs r0, #0xff
	ands r5, r0
	ldr r3, _080AAE38  @ gUnknown_08A2051C
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [sp]
	movs r0, #4
	movs r1, #0x30
	adds r2, r5, #0
	bl PutSpriteExt
	ldr r1, [r4, #0x14]
	adds r0, r1, #0
	adds r0, #0x46
	ldrh r0, [r0]
	cmp r0, #0
	beq _080AAE5C
	adds r0, r1, #0
	adds r0, #0x35
	ldrb r1, [r0]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _080AAE40
	adds r2, r5, #0
	adds r2, #8
	ldr r0, _080AAE3C  @ gUnknown_08A209B8
	ldr r3, [r0, #0x28]
	b _080AAE48
	.align 2, 0
_080AAE38: .4byte gUnknown_08A2051C
_080AAE3C: .4byte gUnknown_08A209B8
_080AAE40:
	adds r2, r5, #0
	adds r2, #8
	ldr r0, _080AAE58  @ gUnknown_08A209B8
	ldr r3, [r0, #0x20]
_080AAE48:
	movs r0, #0x80
	lsls r0, r0, #7
	str r0, [sp]
	movs r0, #4
	movs r1, #0x38
	bl PutSpriteExt
	b _080AAE82
	.align 2, 0
_080AAE58: .4byte gUnknown_08A209B8
_080AAE5C:
	adds r0, r1, #0
	adds r0, #0x42
	ldrb r0, [r0]
	bl sub_80A88B8
	lsls r0, r0, #0x18
	adds r2, r5, #0
	adds r2, #8
	ldr r1, _080AAE8C  @ gUnknown_08A209B8
	lsrs r0, r0, #0x16
	adds r0, r0, r1
	ldr r3, [r0]
	movs r0, #0x80
	lsls r0, r0, #7
	str r0, [sp]
	movs r0, #4
	movs r1, #0x38
	bl PutSpriteExt
_080AAE82:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080AAE8C: .4byte gUnknown_08A209B8

	THUMB_FUNC_END sub_80AADE0

	THUMB_FUNC_START sub_80AAE90
sub_80AAE90: @ 0x080AAE90
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	sub sp, #8
	adds r5, r0, #0
	ldr r2, [r5, #0x14]
	adds r0, r2, #0
	adds r0, #0x2f
	ldrb r1, [r0]
	adds r0, #0x17
	ldrh r0, [r0]
	adds r7, r1, r0
	cmp r7, #0xdb
	bgt _080AAF5E
	adds r0, r2, #0
	adds r0, #0x31
	ldrb r3, [r0]
	lsls r0, r3, #1
	adds r0, r0, r3
	lsls r0, r0, #3
	adds r0, r0, r3
	asrs r0, r0, #1
	movs r1, #0x44
	subs r1, r1, r0
	mov r8, r1
	cmp r1, #1
	bgt _080AAECC
	movs r0, #2
	mov r8, r0
_080AAECC:
	movs r6, #0
	cmp r6, r3
	bge _080AAF36
	mov r4, r8
	movs r2, #0x30
	mov r9, r2
_080AAED8:
	ldr r0, [r5, #0x14]
	adds r0, #0x30
	ldrb r0, [r0]
	adds r1, r6, #0
	bl sub_80A8844
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl sub_80A88B8
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	ldr r0, [r5, #0x14]
	adds r0, #0x2b
	ldrb r0, [r0]
	cmp r6, r0
	bne _080AAF10
	movs r0, #1
	str r0, [sp]
	movs r0, #4
	str r0, [sp, #4]
	adds r0, r5, #0
	mov r2, r9
	subs r1, r2, r7
	adds r2, r4, #0
	bl sub_80AABC4
	b _080AAF24
_080AAF10:
	movs r0, #6
	str r0, [sp]
	movs r0, #4
	str r0, [sp, #4]
	adds r0, r5, #0
	mov r2, r9
	subs r1, r2, r7
	adds r2, r4, #0
	bl sub_80AABC4
_080AAF24:
	adds r4, #0x19
	adds r6, #1
	ldr r0, [r5, #0x14]
	adds r1, r0, #0
	adds r1, #0x31
	adds r2, r0, #0
	ldrb r1, [r1]
	cmp r6, r1
	blt _080AAED8
_080AAF36:
	adds r0, r2, #0
	adds r0, #0x2e
	ldrb r0, [r0]
	cmp r0, #2
	bne _080AAF5E
	adds r0, r2, #0
	adds r0, #0x2b
	ldrb r0, [r0]
	lsls r2, r0, #1
	adds r2, r2, r0
	lsls r2, r2, #3
	adds r2, r2, r0
	add r2, r8
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	movs r0, #0
	movs r1, #0x1c
	adds r3, r5, #0
	bl sub_80AB4F4
_080AAF5E:
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80AAE90

	THUMB_FUNC_START sub_80AAF6C
sub_80AAF6C: @ 0x080AAF6C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	adds r5, r0, #0
	ldr r2, [r5, #0x14]
	adds r0, r2, #0
	adds r0, #0x46
	ldrh r0, [r0]
	subs r0, #1
	lsls r0, r0, #0x10
	movs r1, #0xdb
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _080AB050
	adds r1, r2, #0
	adds r1, #0x33
	ldrb r0, [r1]
	cmp r0, #7
	bne _080AAF9A
	movs r7, #2
	movs r0, #0x15
	b _080AAFAE
_080AAF9A:
	ldrb r0, [r1]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	movs r0, #0x44
	subs r7, r0, r1
	cmp r7, #1
	bgt _080AAFAC
	movs r7, #2
_080AAFAC:
	movs r0, #0x19
_080AAFAE:
	mov r8, r0
	movs r6, #0
	ldr r0, [r5, #0x14]
	adds r1, r0, #0
	adds r1, #0x33
	adds r2, r0, #0
	ldrb r1, [r1]
	cmp r6, r1
	bge _080AB030
	adds r4, r7, #0
_080AAFC2:
	adds r0, #0x32
	ldrb r0, [r0]
	adds r1, r6, #0
	bl sub_80A8844
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl sub_80A88B8
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	ldr r1, [r5, #0x14]
	adds r0, r1, #0
	adds r0, #0x34
	ldrb r0, [r0]
	cmp r6, r0
	bne _080AB002
	adds r0, r1, #0
	adds r0, #0x46
	ldrh r0, [r0]
	movs r1, #0x86
	lsls r1, r1, #1
	subs r1, r1, r0
	movs r0, #1
	str r0, [sp]
	movs r0, #4
	str r0, [sp, #4]
	adds r0, r5, #0
	adds r2, r4, #0
	bl sub_80AAC40
	b _080AB01E
_080AB002:
	adds r0, r1, #0
	adds r0, #0x46
	ldrh r0, [r0]
	movs r1, #0x86
	lsls r1, r1, #1
	subs r1, r1, r0
	movs r0, #6
	str r0, [sp]
	movs r0, #4
	str r0, [sp, #4]
	adds r0, r5, #0
	adds r2, r4, #0
	bl sub_80AAC40
_080AB01E:
	add r4, r8
	adds r6, #1
	ldr r0, [r5, #0x14]
	adds r1, r0, #0
	adds r1, #0x33
	adds r2, r0, #0
	ldrb r1, [r1]
	cmp r6, r1
	blt _080AAFC2
_080AB030:
	adds r0, r2, #0
	adds r0, #0x2e
	ldrb r0, [r0]
	cmp r0, #0xa
	bne _080AB050
	adds r0, r2, #0
	adds r0, #0x34
	ldrb r0, [r0]
	mov r2, r8
	muls r2, r0, r2
	adds r2, r7, r2
	movs r0, #0
	movs r1, #0x1c
	adds r3, r5, #0
	bl sub_80AB4F4
_080AB050:
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80AAF6C

	THUMB_FUNC_START sub_80AB05C
sub_80AB05C: @ 0x080AB05C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov r8, r0
	ldr r0, [r0, #0x14]
	adds r0, #0x2f
	ldrb r0, [r0]
	cmp r0, #0
	bne _080AB076
	b _080AB1DA
_080AB076:
	mov r0, r8
	bl sub_80AA7EC
	mov r0, r8
	bl sub_80AADE0
	movs r7, #0
	movs r0, #0xf
	mov sl, r0
	movs r1, #0xa
	mov r9, r1
_080AB08C:
	mov r2, r8
	ldr r1, [r2, #0x14]
	adds r0, r1, #0
	adds r0, #0x2e
	ldrb r0, [r0]
	movs r2, #0
	cmp r0, #6
	bne _080AB0AA
	adds r0, r1, #0
	adds r0, #0x2c
	ldrb r0, [r0]
	cmp r0, r7
	bne _080AB0AA
	movs r2, #0x80
	lsls r2, r2, #1
_080AB0AA:
	mov r1, r8
	ldr r0, [r1, #0x14]
	adds r0, #0x2f
	ldrb r1, [r0]
	movs r0, #0xf8
	subs r1, r0, r1
	ldr r0, _080AB168  @ 0x000001FF
	ands r1, r0
	lsls r5, r7, #5
	adds r5, #0x20
	adds r5, r2, r5
	ldr r0, _080AB16C  @ gUnknown_08A209F0
	lsls r6, r7, #2
	adds r0, r6, r0
	ldr r3, [r0]
	lsls r4, r7, #1
	mov r0, r9
	mov r2, sl
	ands r0, r2
	lsls r0, r0, #0xc
	str r0, [sp]
	movs r0, #4
	adds r2, r5, #0
	bl PutSpriteExt
	mov r1, r8
	ldr r0, [r1, #0x14]
	adds r0, #0x2f
	ldrb r1, [r0]
	movs r2, #0xf8
	subs r1, r2, r1
	ldr r0, _080AB168  @ 0x000001FF
	ands r1, r0
	adds r5, #8
	ldr r0, _080AB170  @ gUnknown_08A209E4
	adds r6, r6, r0
	ldr r3, [r6]
	adds r4, #0xb
	mov r2, sl
	ands r4, r2
	lsls r4, r4, #0xc
	str r4, [sp]
	movs r0, #4
	adds r2, r5, #0
	bl PutSpriteExt
	movs r0, #2
	add r9, r0
	adds r7, #1
	cmp r7, #2
	ble _080AB08C
	mov r1, r8
	ldr r2, [r1, #0x14]
	adds r3, r2, #0
	adds r3, #0x3f
	ldrb r0, [r3]
	cmp r0, #0xff
	beq _080AB1DA
	adds r0, r2, #0
	adds r0, #0x44
	ldrh r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #1
	cmp r1, r0
	beq _080AB178
	ldr r0, [r2, #0x60]
	cmp r0, #0
	beq _080AB13E
	bl APProc_Delete
	mov r2, r8
	ldr r1, [r2, #0x14]
	movs r0, #0
	str r0, [r1, #0x60]
_080AB13E:
	mov r0, r8
	ldr r2, [r0, #0x14]
	adds r0, r2, #0
	adds r0, #0x42
	ldrh r1, [r0]
	movs r0, #1
	ands r0, r1
	adds r0, r2, #0
	adds r0, #0x3f
	ldrb r2, [r0]
	lsls r2, r2, #5
	adds r2, #0x1e
	ldr r3, _080AB174  @ gUnknown_08A20588
	movs r0, #0xc0
	lsls r0, r0, #6
	str r0, [sp]
	movs r0, #4
	movs r1, #0xca
	bl PutSpriteExt
	b _080AB1DA
	.align 2, 0
_080AB168: .4byte 0x000001FF
_080AB16C: .4byte gUnknown_08A209F0
_080AB170: .4byte gUnknown_08A209E4
_080AB174: .4byte gUnknown_08A20588
_080AB178:
	adds r0, r2, #0
	adds r0, #0x42
	ldrh r0, [r0]
	cmp r0, #1
	bne _080AB1A0
	ldr r0, [r2, #0x60]
	adds r1, r2, #0
	adds r1, #0x2f
	ldrb r2, [r1]
	movs r1, #0xda
	lsls r1, r1, #1
	subs r1, r1, r2
	ldrb r2, [r3]
	lsls r2, r2, #5
	adds r2, #0x30
	movs r3, #0xc5
	lsls r3, r3, #6
	bl APProc_SetParameters
	b _080AB1DA
_080AB1A0:
	ldr r0, [r2, #0x60]
	movs r1, #0xa0
	lsls r1, r1, #1
	ldrb r2, [r3]
	lsls r2, r2, #5
	adds r2, #0x30
	movs r3, #0xc5
	lsls r3, r3, #6
	bl APProc_SetParameters
	mov r1, r8
	ldr r0, [r1, #0x14]
	adds r1, r0, #0
	adds r1, #0x2f
	ldrb r2, [r1]
	movs r1, #0xd3
	lsls r1, r1, #1
	subs r1, r1, r2
	adds r0, #0x3f
	ldrb r2, [r0]
	lsls r2, r2, #5
	adds r2, #0x1e
	ldr r3, _080AB248  @ gUnknown_08A20588
	movs r0, #0xc0
	lsls r0, r0, #6
	str r0, [sp]
	movs r0, #4
	bl PutSpriteExt
_080AB1DA:
	mov r2, r8
	ldr r1, [r2, #0x14]
	adds r0, r1, #0
	adds r0, #0x2e
	ldrb r0, [r0]
	subs r0, #5
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bhi _080AB28E
	adds r0, r1, #0
	adds r0, #0x36
	ldrb r0, [r0]
	cmp r0, #0
	beq _080AB250
	ldr r3, _080AB24C  @ gUnknown_08A20536
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [sp]
	movs r0, #4
	movs r1, #0x2c
	movs r2, #0x80
	bl PutSpriteExt
	mov r1, r8
	ldr r0, [r1, #0x14]
	adds r0, #0x36
	ldrb r1, [r0]
	subs r1, #1
	lsrs r0, r1, #0x1f
	adds r0, r1, r0
	asrs r0, r0, #1
	lsls r0, r0, #1
	subs r1, r1, r0
	movs r0, #0x2c
	muls r0, r1, r0
	adds r0, #0x34
	movs r1, #0x88
	bl DisplayUiHand
	mov r2, r8
	ldr r0, [r2, #0x14]
	adds r0, #0x2c
	ldrb r2, [r0]
	lsls r2, r2, #0x15
	movs r0, #0x80
	lsls r0, r0, #0xe
	adds r2, r2, r0
	asrs r2, r2, #0x10
	movs r0, #1
	movs r1, #0xc
	mov r3, r8
	bl sub_80AB4F4
	b _080AB26E
	.align 2, 0
_080AB248: .4byte gUnknown_08A20588
_080AB24C: .4byte gUnknown_08A20536
_080AB250:
	adds r1, #0x2c
	ldrb r0, [r1]
	cmp r0, #0xff
	beq _080AB26E
	adds r2, r0, #0
	lsls r2, r2, #0x15
	movs r1, #0x80
	lsls r1, r1, #0xe
	adds r2, r2, r1
	asrs r2, r2, #0x10
	movs r0, #1
	movs r1, #0xc
	mov r3, r8
	bl sub_80AB4F4
_080AB26E:
	mov r2, r8
	ldr r0, [r2, #0x14]
	adds r1, r0, #0
	adds r1, #0x2d
	ldrb r0, [r1]
	cmp r0, #0xff
	beq _080AB28E
	adds r1, r0, #0
	lsls r1, r1, #0x1d
	movs r0, #0x80
	lsls r0, r0, #0x16
	adds r1, r1, r0
	lsrs r1, r1, #0x18
	movs r0, #1
	bl sub_80AB514
_080AB28E:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80AB05C

	THUMB_FUNC_START sub_80AB2A0
sub_80AB2A0: @ 0x080AB2A0
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x29
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _080AB2EC
	ldr r0, [r4, #0x14]
	adds r1, r0, #0
	adds r1, #0x42
	ldrh r2, [r1]
	adds r1, r2, #0
	cmp r1, #0xff
	bhi _080AB2D4
	cmp r1, #0x20
	bne _080AB2CE
	adds r0, #0x35
	ldrb r0, [r0]
	adds r1, r4, #0
	adds r1, #0x33
	strb r0, [r1]
	b _080AB2D4
_080AB2CE:
	adds r0, r4, #0
	adds r0, #0x33
	strb r2, [r0]
_080AB2D4:
	adds r0, r4, #0
	bl sub_80AAE90
	adds r0, r4, #0
	bl sub_80AAF6C
	adds r0, r4, #0
	bl sub_80AB05C
	adds r0, r4, #0
	bl sub_80AACBC
_080AB2EC:
	adds r0, r4, #0
	bl sub_80AA9D8
	ldrh r0, [r4, #0x2a]
	bl sub_80AB56C
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80AB2A0

	THUMB_FUNC_START New6C_savedraw
New6C_savedraw: @ 0x080AB300
	push {lr}
	adds r1, r0, #0
	ldr r0, _080AB310  @ gUnknown_08A206A8
	bl Proc_Start
	pop {r1}
	bx r1
	.align 2, 0
_080AB310: .4byte gUnknown_08A206A8

	THUMB_FUNC_END New6C_savedraw

.align 2, 0
