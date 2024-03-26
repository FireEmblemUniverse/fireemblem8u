	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	THUMB_FUNC_START sub_80CAA38
sub_80CAA38: @ 0x080CAA38
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov r9, r0
	ldrh r0, [r0, #0x2a]
	adds r2, r0, #0
	adds r2, #0xa
	movs r0, #0x78
	movs r1, #1
	negs r1, r1
	movs r3, #0x14
	bl sub_80CA9F8
	adds r7, r0, #0
	ldr r0, _080CAB60  @ 0x0000FFFF
	mov sl, r0
	cmp r7, sl
	beq _080CAAA2
	adds r4, r7, #0
	subs r4, #0x30
	ldr r5, _080CAB64  @ 0x000001FF
	ands r4, r5
	ldr r6, _080CAB68  @ gUnknown_08AA709C
	movs r1, #0
	mov r8, r1
	str r1, [sp]
	movs r0, #1
	adds r1, r4, #0
	movs r2, #0xec
	adds r3, r6, #0
	bl PutSpriteExt
	adds r1, r7, #0
	subs r1, #0x2c
	ands r1, r5
	ldr r2, _080CAB6C  @ 0x000004EC
	ldr r0, _080CAB70  @ 0x00001078
	str r0, [sp]
	movs r0, #2
	adds r3, r6, #0
	bl PutSpriteExt
	ldr r2, _080CAB74  @ 0x00000804
	ldr r3, _080CAB78  @ gUnknown_08AA70BC
	mov r0, r8
	str r0, [sp]
	movs r0, #0
	adds r1, r4, #0
	bl PutSpriteExt
_080CAAA2:
	mov r1, r9
	ldrh r0, [r1, #0x2a]
	adds r2, r0, #6
	movs r0, #0x78
	movs r1, #1
	negs r1, r1
	movs r3, #0x14
	bl sub_80CA9F8
	adds r7, r0, #0
	cmp r7, sl
	beq _080CAAF8
	adds r4, r7, #0
	subs r4, #0x30
	ldr r5, _080CAB64  @ 0x000001FF
	ands r4, r5
	ldr r6, _080CAB68  @ gUnknown_08AA709C
	ldr r0, _080CAB7C  @ 0x000020F0
	str r0, [sp]
	movs r0, #1
	adds r1, r4, #0
	movs r2, #0x20
	adds r3, r6, #0
	bl PutSpriteExt
	adds r1, r7, #0
	subs r1, #0x2c
	ands r1, r5
	movs r2, #0x84
	lsls r2, r2, #3
	ldr r0, _080CAB80  @ 0x00003168
	str r0, [sp]
	movs r0, #2
	adds r3, r6, #0
	bl PutSpriteExt
	ldr r2, _080CAB84  @ 0x00000838
	ldr r3, _080CAB78  @ gUnknown_08AA70BC
	movs r0, #0
	str r0, [sp]
	adds r1, r4, #0
	bl PutSpriteExt
_080CAAF8:
	mov r1, r9
	ldrh r0, [r1, #0x2a]
	adds r2, r0, #2
	movs r0, #0x78
	movs r1, #1
	negs r1, r1
	movs r3, #0x14
	bl sub_80CA9F8
	adds r7, r0, #0
	cmp r7, sl
	beq _080CAB4C
	adds r4, r7, #0
	subs r4, #0x30
	ldr r5, _080CAB64  @ 0x000001FF
	ands r4, r5
	ldr r6, _080CAB68  @ gUnknown_08AA709C
	ldr r0, _080CAB88  @ 0x000041E0
	str r0, [sp]
	movs r0, #1
	adds r1, r4, #0
	movs r2, #0x54
	adds r3, r6, #0
	bl PutSpriteExt
	adds r1, r7, #0
	subs r1, #0x2c
	ands r1, r5
	ldr r2, _080CAB8C  @ 0x00000454
	ldr r0, _080CAB90  @ 0x00005258
	str r0, [sp]
	movs r0, #2
	adds r3, r6, #0
	bl PutSpriteExt
	ldr r2, _080CAB94  @ 0x0000086C
	ldr r3, _080CAB78  @ gUnknown_08AA70BC
	movs r0, #0
	str r0, [sp]
	adds r1, r4, #0
	bl PutSpriteExt
_080CAB4C:
	mov r1, r9
	ldrh r0, [r1, #0x2a]
	cmp r0, #0x14
	bne _080CAB98
	movs r0, #0
	strh r0, [r1, #0x2a]
	mov r0, r9
	bl Proc_Break
	b _080CAB9E
	.align 2, 0
_080CAB60: .4byte 0x0000FFFF
_080CAB64: .4byte 0x000001FF
_080CAB68: .4byte gUnknown_08AA709C
_080CAB6C: .4byte 0x000004EC
_080CAB70: .4byte 0x00001078
_080CAB74: .4byte 0x00000804
_080CAB78: .4byte gUnknown_08AA70BC
_080CAB7C: .4byte 0x000020F0
_080CAB80: .4byte 0x00003168
_080CAB84: .4byte 0x00000838
_080CAB88: .4byte 0x000041E0
_080CAB8C: .4byte 0x00000454
_080CAB90: .4byte 0x00005258
_080CAB94: .4byte 0x0000086C
_080CAB98:
	adds r0, #1
	mov r1, r9
	strh r0, [r1, #0x2a]
_080CAB9E:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80CAA38

	THUMB_FUNC_START sub_80CABB0
sub_80CABB0: @ 0x080CABB0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	str r0, [sp, #4]
	ldrh r4, [r0, #0x2a]
	adds r4, #2
	movs r5, #1
	negs r5, r5
	movs r0, #0x42
	adds r1, r5, #0
	adds r2, r4, #0
	movs r3, #0x12
	bl sub_80CA9F8
	mov sl, r0
	movs r0, #0x2a
	adds r1, r5, #0
	adds r2, r4, #0
	movs r3, #0x12
	bl sub_80CA9F8
	adds r7, r0, #0
	movs r0, #0xae
	movs r1, #1
	adds r2, r4, #0
	movs r3, #0x12
	bl sub_80CA9F8
	str r0, [sp, #8]
	movs r0, #0x76
	movs r1, #1
	adds r2, r4, #0
	movs r3, #0x12
	bl sub_80CA9F8
	str r0, [sp, #0xc]
	ldr r0, _080CADDC  @ 0x0000FFFF
	cmp sl, r0
	beq _080CACE0
	cmp r7, r0
	beq _080CAC6E
	movs r0, #0x28
	negs r0, r0
	cmp r7, r0
	blt _080CAC6E
	cmp r7, #0xc8
	bgt _080CAC6E
	mov r5, sl
	subs r5, #0x30
	ldr r6, _080CADE0  @ 0x000001FF
	ands r5, r6
	adds r4, r7, #0
	subs r4, #0x28
	movs r0, #0xff
	mov r9, r0
	ands r4, r0
	ldr r1, _080CADE4  @ gUnknown_08AA709C
	mov r8, r1
	movs r0, #0
	str r0, [sp]
	movs r0, #1
	adds r1, r5, #0
	adds r2, r4, #0
	mov r3, r8
	bl PutSpriteExt
	mov r1, sl
	subs r1, #0x2c
	ands r1, r6
	movs r0, #0x80
	lsls r0, r0, #3
	orrs r4, r0
	ldr r0, _080CADE8  @ 0x00001078
	str r0, [sp]
	movs r0, #2
	adds r2, r4, #0
	mov r3, r8
	bl PutSpriteExt
	adds r2, r7, #0
	subs r2, #0x20
	mov r1, r9
	ands r2, r1
	movs r0, #0x80
	lsls r0, r0, #4
	orrs r2, r0
	ldr r3, _080CADEC  @ gUnknown_08AA70DC
	movs r0, #0
	str r0, [sp]
	adds r1, r5, #0
	bl PutSpriteExt
_080CAC6E:
	ldr r0, _080CADDC  @ 0x0000FFFF
	cmp sl, r0
	beq _080CACE0
	ldr r1, [sp, #0xc]
	cmp r1, r0
	beq _080CACE0
	movs r0, #0x28
	negs r0, r0
	cmp r1, r0
	blt _080CACE0
	cmp r1, #0xc8
	bgt _080CACE0
	mov r5, sl
	subs r5, #0x30
	ldr r6, _080CADE0  @ 0x000001FF
	ands r5, r6
	adds r4, r1, #0
	subs r4, #0x28
	movs r0, #0xff
	mov r9, r0
	ands r4, r0
	ldr r1, _080CADE4  @ gUnknown_08AA709C
	mov r8, r1
	ldr r0, _080CADF0  @ 0x000020F0
	str r0, [sp]
	movs r0, #1
	adds r1, r5, #0
	adds r2, r4, #0
	mov r3, r8
	bl PutSpriteExt
	mov r1, sl
	subs r1, #0x2c
	ands r1, r6
	movs r0, #0x80
	lsls r0, r0, #3
	orrs r4, r0
	ldr r0, _080CADF4  @ 0x00003168
	str r0, [sp]
	movs r0, #2
	adds r2, r4, #0
	mov r3, r8
	bl PutSpriteExt
	ldr r2, [sp, #0xc]
	subs r2, #0x20
	mov r0, r9
	ands r2, r0
	movs r0, #0x80
	lsls r0, r0, #4
	orrs r2, r0
	ldr r3, _080CADEC  @ gUnknown_08AA70DC
	movs r0, #0
	str r0, [sp]
	adds r1, r5, #0
	bl PutSpriteExt
_080CACE0:
	ldr r0, _080CADDC  @ 0x0000FFFF
	ldr r1, [sp, #8]
	cmp r1, r0
	beq _080CADC6
	cmp r7, r0
	beq _080CAD52
	movs r0, #0x28
	negs r0, r0
	cmp r7, r0
	blt _080CAD52
	cmp r7, #0xc8
	bgt _080CAD52
	adds r5, r1, #0
	subs r5, #0x30
	ldr r6, _080CADE0  @ 0x000001FF
	ands r5, r6
	adds r4, r7, #0
	subs r4, #0x28
	movs r0, #0xff
	mov r9, r0
	ands r4, r0
	ldr r1, _080CADE4  @ gUnknown_08AA709C
	mov r8, r1
	ldr r0, _080CADF8  @ 0x000041E0
	str r0, [sp]
	movs r0, #1
	adds r1, r5, #0
	adds r2, r4, #0
	mov r3, r8
	bl PutSpriteExt
	ldr r1, [sp, #8]
	subs r1, #0x2c
	ands r1, r6
	movs r0, #0x80
	lsls r0, r0, #3
	orrs r4, r0
	ldr r0, _080CADFC  @ 0x00005258
	str r0, [sp]
	movs r0, #2
	adds r2, r4, #0
	mov r3, r8
	bl PutSpriteExt
	adds r2, r7, #0
	subs r2, #0x20
	mov r0, r9
	ands r2, r0
	movs r0, #0x80
	lsls r0, r0, #4
	orrs r2, r0
	ldr r3, _080CADEC  @ gUnknown_08AA70DC
	movs r0, #0
	str r0, [sp]
	adds r1, r5, #0
	bl PutSpriteExt
_080CAD52:
	ldr r0, _080CADDC  @ 0x0000FFFF
	ldr r1, [sp, #8]
	cmp r1, r0
	beq _080CADC6
	ldr r1, [sp, #0xc]
	cmp r1, r0
	beq _080CADC6
	movs r0, #0x28
	negs r0, r0
	cmp r1, r0
	blt _080CADC6
	cmp r1, #0xc8
	bgt _080CADC6
	ldr r5, [sp, #8]
	subs r5, #0x30
	ldr r6, _080CADE0  @ 0x000001FF
	ands r5, r6
	adds r4, r1, #0
	subs r4, #0x28
	movs r0, #0xff
	mov r9, r0
	ands r4, r0
	ldr r1, _080CADE4  @ gUnknown_08AA709C
	mov r8, r1
	ldr r0, _080CAE00  @ 0x000062D0
	str r0, [sp]
	movs r0, #1
	adds r1, r5, #0
	adds r2, r4, #0
	mov r3, r8
	bl PutSpriteExt
	ldr r1, [sp, #8]
	subs r1, #0x2c
	ands r1, r6
	movs r0, #0x80
	lsls r0, r0, #3
	orrs r4, r0
	ldr r0, _080CAE04  @ 0x00007348
	str r0, [sp]
	movs r0, #2
	adds r2, r4, #0
	mov r3, r8
	bl PutSpriteExt
	ldr r2, [sp, #0xc]
	subs r2, #0x20
	mov r0, r9
	ands r2, r0
	movs r0, #0x80
	lsls r0, r0, #4
	orrs r2, r0
	ldr r3, _080CADEC  @ gUnknown_08AA70DC
	movs r0, #0
	str r0, [sp]
	adds r1, r5, #0
	bl PutSpriteExt
_080CADC6:
	ldr r1, [sp, #4]
	ldrh r0, [r1, #0x2a]
	cmp r0, #0x12
	bne _080CAE08
	movs r0, #0
	strh r0, [r1, #0x2a]
	ldr r0, [sp, #4]
	bl Proc_Break
	b _080CAE0E
	.align 2, 0
_080CADDC: .4byte 0x0000FFFF
_080CADE0: .4byte 0x000001FF
_080CADE4: .4byte gUnknown_08AA709C
_080CADE8: .4byte 0x00001078
_080CADEC: .4byte gUnknown_08AA70DC
_080CADF0: .4byte 0x000020F0
_080CADF4: .4byte 0x00003168
_080CADF8: .4byte 0x000041E0
_080CADFC: .4byte 0x00005258
_080CAE00: .4byte 0x000062D0
_080CAE04: .4byte 0x00007348
_080CAE08:
	adds r0, #1
	ldr r1, [sp, #4]
	strh r0, [r1, #0x2a]
_080CAE0E:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80CABB0

	THUMB_FUNC_START sub_80CAE20
sub_80CAE20: @ 0x080CAE20
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov r8, r0
	ldrh r0, [r0, #0x2a]
	adds r0, #2
	mov r9, r0
	movs r1, #1
	negs r1, r1
	movs r0, #0x3e
	mov r2, r9
	movs r3, #0x10
	bl sub_80CA9F8
	adds r7, r0, #0
	ldr r0, _080CAEF4  @ 0x0000FFFF
	mov sl, r0
	cmp r7, sl
	beq _080CAE8C
	adds r1, r7, #0
	subs r1, #0x20
	ldr r4, _080CAEF8  @ 0x000001FF
	ands r1, r4
	ldr r5, _080CAEFC  @ gUnknown_08AA709C
	movs r6, #0
	str r6, [sp]
	movs r0, #1
	movs r2, #0x20
	adds r3, r5, #0
	bl PutSpriteExt
	adds r1, r7, #0
	subs r1, #0x1c
	ands r1, r4
	movs r2, #0x84
	lsls r2, r2, #3
	ldr r0, _080CAF00  @ 0x00001078
	str r0, [sp]
	movs r0, #2
	adds r3, r5, #0
	bl PutSpriteExt
	adds r1, r7, #0
	subs r1, #0x38
	ands r1, r4
	ldr r2, _080CAF04  @ 0x00000838
	ldr r3, _080CAF08  @ gUnknown_08AA70EA
	str r6, [sp]
	movs r0, #0
	bl PutSpriteExt
_080CAE8C:
	movs r0, #0xb2
	movs r1, #1
	mov r2, r9
	movs r3, #0x10
	bl sub_80CA9F8
	adds r7, r0, #0
	cmp r7, sl
	beq _080CAEDE
	adds r1, r7, #0
	subs r1, #0x40
	ldr r4, _080CAEF8  @ 0x000001FF
	ands r1, r4
	ldr r5, _080CAEFC  @ gUnknown_08AA709C
	ldr r0, _080CAF0C  @ 0x000020F0
	str r0, [sp]
	movs r0, #1
	movs r2, #0x20
	adds r3, r5, #0
	bl PutSpriteExt
	adds r1, r7, #0
	subs r1, #0x3c
	ands r1, r4
	movs r2, #0x84
	lsls r2, r2, #3
	ldr r0, _080CAF10  @ 0x00003168
	str r0, [sp]
	movs r0, #2
	adds r3, r5, #0
	bl PutSpriteExt
	adds r1, r7, #0
	subs r1, #0x38
	ands r1, r4
	ldr r2, _080CAF04  @ 0x00000838
	ldr r3, _080CAF08  @ gUnknown_08AA70EA
	movs r0, #0
	str r0, [sp]
	bl PutSpriteExt
_080CAEDE:
	mov r1, r8
	ldrh r0, [r1, #0x2a]
	cmp r0, #0x10
	bne _080CAF14
	movs r0, #0
	strh r0, [r1, #0x2a]
	mov r0, r8
	bl Proc_Break
	b _080CAF1A
	.align 2, 0
_080CAEF4: .4byte 0x0000FFFF
_080CAEF8: .4byte 0x000001FF
_080CAEFC: .4byte gUnknown_08AA709C
_080CAF00: .4byte 0x00001078
_080CAF04: .4byte 0x00000838
_080CAF08: .4byte gUnknown_08AA70EA
_080CAF0C: .4byte 0x000020F0
_080CAF10: .4byte 0x00003168
_080CAF14:
	adds r0, #1
	mov r1, r8
	strh r0, [r1, #0x2a]
_080CAF1A:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80CAE20

	THUMB_FUNC_START sub_80CAF2C
sub_80CAF2C: @ 0x080CAF2C
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r7, r0, #0
	ldrh r0, [r7, #0x2a]
	adds r2, r0, #0
	adds r2, #0xa
	movs r1, #1
	negs r1, r1
	movs r0, #0x50
	movs r3, #0xf
	bl sub_80CA9F8
	adds r4, r0, #0
	ldr r0, _080CB074  @ 0x0000FFFF
	cmp r4, r0
	beq _080CAF98
	movs r0, #0x28
	negs r0, r0
	cmp r4, r0
	blt _080CAF98
	cmp r4, #0xc8
	bgt _080CAF98
	movs r6, #0
	subs r4, #0x28
	movs r0, #0xff
	ands r4, r0
	ldr r5, _080CB078  @ gUnknown_08AA709C
	str r6, [sp]
	movs r0, #1
	movs r1, #0
	adds r2, r4, #0
	adds r3, r5, #0
	bl PutSpriteExt
	movs r2, #0x80
	lsls r2, r2, #3
	orrs r2, r4
	ldr r0, _080CB07C  @ 0x00001078
	str r0, [sp]
	movs r0, #2
	movs r1, #4
	adds r3, r5, #0
	bl PutSpriteExt
	movs r0, #0x80
	lsls r0, r0, #4
	orrs r4, r0
	ldr r3, _080CB080  @ gUnknown_08AA7116
	str r6, [sp]
	movs r0, #0
	movs r1, #0x10
	adds r2, r4, #0
	bl PutSpriteExt
_080CAF98:
	ldrh r0, [r7, #0x2a]
	adds r2, r0, #6
	movs r1, #1
	negs r1, r1
	movs r0, #0x50
	movs r3, #0xf
	bl sub_80CA9F8
	adds r4, r0, #0
	ldr r0, _080CB074  @ 0x0000FFFF
	cmp r4, r0
	beq _080CAFFC
	movs r0, #0x28
	negs r0, r0
	cmp r4, r0
	blt _080CAFFC
	cmp r4, #0xc8
	bgt _080CAFFC
	subs r4, #0x28
	movs r0, #0xff
	ands r4, r0
	ldr r5, _080CB078  @ gUnknown_08AA709C
	ldr r0, _080CB084  @ 0x000020F0
	str r0, [sp]
	movs r0, #1
	movs r1, #0x48
	adds r2, r4, #0
	adds r3, r5, #0
	bl PutSpriteExt
	movs r2, #0x80
	lsls r2, r2, #3
	orrs r2, r4
	ldr r0, _080CB088  @ 0x00003168
	str r0, [sp]
	movs r0, #2
	movs r1, #0x4c
	adds r3, r5, #0
	bl PutSpriteExt
	movs r0, #0x80
	lsls r0, r0, #4
	orrs r4, r0
	ldr r3, _080CB080  @ gUnknown_08AA7116
	movs r0, #0
	str r0, [sp]
	movs r1, #0x58
	adds r2, r4, #0
	bl PutSpriteExt
_080CAFFC:
	ldrh r0, [r7, #0x2a]
	adds r2, r0, #2
	movs r1, #1
	negs r1, r1
	movs r0, #0x50
	movs r3, #0xf
	bl sub_80CA9F8
	adds r4, r0, #0
	ldr r0, _080CB074  @ 0x0000FFFF
	cmp r4, r0
	beq _080CB060
	movs r0, #0x28
	negs r0, r0
	cmp r4, r0
	blt _080CB060
	cmp r4, #0xc8
	bgt _080CB060
	subs r4, #0x28
	movs r0, #0xff
	ands r4, r0
	ldr r5, _080CB078  @ gUnknown_08AA709C
	ldr r0, _080CB08C  @ 0x000041E0
	str r0, [sp]
	movs r0, #1
	movs r1, #0x90
	adds r2, r4, #0
	adds r3, r5, #0
	bl PutSpriteExt
	movs r2, #0x80
	lsls r2, r2, #3
	orrs r2, r4
	ldr r0, _080CB090  @ 0x00005258
	str r0, [sp]
	movs r0, #2
	movs r1, #0x94
	adds r3, r5, #0
	bl PutSpriteExt
	movs r0, #0x80
	lsls r0, r0, #4
	orrs r4, r0
	ldr r3, _080CB080  @ gUnknown_08AA7116
	movs r0, #0
	str r0, [sp]
	movs r1, #0xa0
	adds r2, r4, #0
	bl PutSpriteExt
_080CB060:
	ldrh r0, [r7, #0x2a]
	cmp r0, #0xf
	bne _080CB094
	movs r0, #0
	strh r0, [r7, #0x2a]
	adds r0, r7, #0
	bl Proc_Break
	b _080CB098
	.align 2, 0
_080CB074: .4byte 0x0000FFFF
_080CB078: .4byte gUnknown_08AA709C
_080CB07C: .4byte 0x00001078
_080CB080: .4byte gUnknown_08AA7116
_080CB084: .4byte 0x000020F0
_080CB088: .4byte 0x00003168
_080CB08C: .4byte 0x000041E0
_080CB090: .4byte 0x00005258
_080CB094:
	adds r0, #1
	strh r0, [r7, #0x2a]
_080CB098:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80CAF2C

	THUMB_FUNC_START sub_80CB0A0
sub_80CB0A0: @ 0x080CB0A0
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r7, r0, #0
	ldrh r0, [r7, #0x2a]
	adds r2, r0, #0
	adds r2, #0xa
	movs r0, #0x50
	movs r1, #1
	movs r3, #0xd
	bl sub_80CA9F8
	adds r4, r0, #0
	ldr r0, _080CB1E0  @ 0x0000FFFF
	cmp r4, r0
	beq _080CB10A
	movs r0, #0x28
	negs r0, r0
	cmp r4, r0
	blt _080CB10A
	cmp r4, #0xc8
	bgt _080CB10A
	movs r6, #0
	subs r4, #0x28
	movs r0, #0xff
	ands r4, r0
	ldr r5, _080CB1E4  @ gUnknown_08AA709C
	str r6, [sp]
	movs r0, #1
	movs r1, #0
	adds r2, r4, #0
	adds r3, r5, #0
	bl PutSpriteExt
	movs r2, #0x80
	lsls r2, r2, #3
	orrs r2, r4
	ldr r0, _080CB1E8  @ 0x00001078
	str r0, [sp]
	movs r0, #2
	movs r1, #4
	adds r3, r5, #0
	bl PutSpriteExt
	movs r0, #0x80
	lsls r0, r0, #4
	orrs r4, r0
	ldr r3, _080CB1EC  @ gUnknown_08AA7116
	str r6, [sp]
	movs r0, #0
	movs r1, #0x10
	adds r2, r4, #0
	bl PutSpriteExt
_080CB10A:
	ldrh r0, [r7, #0x2a]
	adds r2, r0, #6
	movs r0, #0x50
	movs r1, #1
	movs r3, #0xd
	bl sub_80CA9F8
	adds r4, r0, #0
	ldr r0, _080CB1E0  @ 0x0000FFFF
	cmp r4, r0
	beq _080CB16C
	movs r0, #0x28
	negs r0, r0
	cmp r4, r0
	blt _080CB16C
	cmp r4, #0xc8
	bgt _080CB16C
	subs r4, #0x28
	movs r0, #0xff
	ands r4, r0
	ldr r5, _080CB1E4  @ gUnknown_08AA709C
	ldr r0, _080CB1F0  @ 0x000020F0
	str r0, [sp]
	movs r0, #1
	movs r1, #0x48
	adds r2, r4, #0
	adds r3, r5, #0
	bl PutSpriteExt
	movs r2, #0x80
	lsls r2, r2, #3
	orrs r2, r4
	ldr r0, _080CB1F4  @ 0x00003168
	str r0, [sp]
	movs r0, #2
	movs r1, #0x4c
	adds r3, r5, #0
	bl PutSpriteExt
	movs r0, #0x80
	lsls r0, r0, #4
	orrs r4, r0
	ldr r3, _080CB1EC  @ gUnknown_08AA7116
	movs r0, #0
	str r0, [sp]
	movs r1, #0x58
	adds r2, r4, #0
	bl PutSpriteExt
_080CB16C:
	ldrh r0, [r7, #0x2a]
	adds r2, r0, #2
	movs r0, #0x50
	movs r1, #1
	movs r3, #0xd
	bl sub_80CA9F8
	adds r4, r0, #0
	ldr r0, _080CB1E0  @ 0x0000FFFF
	cmp r4, r0
	beq _080CB1CE
	movs r0, #0x28
	negs r0, r0
	cmp r4, r0
	blt _080CB1CE
	cmp r4, #0xc8
	bgt _080CB1CE
	subs r4, #0x28
	movs r0, #0xff
	ands r4, r0
	ldr r5, _080CB1E4  @ gUnknown_08AA709C
	ldr r0, _080CB1F8  @ 0x000041E0
	str r0, [sp]
	movs r0, #1
	movs r1, #0x90
	adds r2, r4, #0
	adds r3, r5, #0
	bl PutSpriteExt
	movs r2, #0x80
	lsls r2, r2, #3
	orrs r2, r4
	ldr r0, _080CB1FC  @ 0x00005258
	str r0, [sp]
	movs r0, #2
	movs r1, #0x94
	adds r3, r5, #0
	bl PutSpriteExt
	movs r0, #0x80
	lsls r0, r0, #4
	orrs r4, r0
	ldr r3, _080CB1EC  @ gUnknown_08AA7116
	movs r0, #0
	str r0, [sp]
	movs r1, #0xa0
	adds r2, r4, #0
	bl PutSpriteExt
_080CB1CE:
	ldrh r0, [r7, #0x2a]
	cmp r0, #0xd
	bne _080CB200
	movs r0, #0
	strh r0, [r7, #0x2a]
	adds r0, r7, #0
	bl Proc_Break
	b _080CB204
	.align 2, 0
_080CB1E0: .4byte 0x0000FFFF
_080CB1E4: .4byte gUnknown_08AA709C
_080CB1E8: .4byte 0x00001078
_080CB1EC: .4byte gUnknown_08AA7116
_080CB1F0: .4byte 0x000020F0
_080CB1F4: .4byte 0x00003168
_080CB1F8: .4byte 0x000041E0
_080CB1FC: .4byte 0x00005258
_080CB200:
	adds r0, #1
	strh r0, [r7, #0x2a]
_080CB204:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80CB0A0

	THUMB_FUNC_START sub_80CB20C
sub_80CB20C: @ 0x080CB20C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r6, r0, #0
	ldrh r0, [r6, #0x2a]
	adds r2, r0, #6
	movs r0, #1
	negs r0, r0
	mov sl, r0
	movs r0, #0x3c
	mov r1, sl
	movs r3, #0xb
	bl sub_80CA9F8
	adds r7, r0, #0
	ldr r0, _080CB2E0  @ 0x0000FFFF
	mov r9, r0
	cmp r7, r9
	beq _080CB27A
	adds r1, r7, #0
	subs r1, #0x20
	ldr r4, _080CB2E4  @ 0x000001FF
	ands r1, r4
	ldr r5, _080CB2E8  @ gUnknown_08AA709C
	movs r0, #0
	mov r8, r0
	str r0, [sp]
	movs r0, #1
	movs r2, #6
	adds r3, r5, #0
	bl PutSpriteExt
	adds r1, r7, #0
	subs r1, #0x1c
	ands r1, r4
	ldr r2, _080CB2EC  @ 0x00000406
	ldr r0, _080CB2F0  @ 0x00001078
	str r0, [sp]
	movs r0, #2
	adds r3, r5, #0
	bl PutSpriteExt
	adds r1, r7, #0
	subs r1, #0x38
	ands r1, r4
	ldr r2, _080CB2F4  @ 0x0000081E
	ldr r3, _080CB2F8  @ gUnknown_08AA70EA
	mov r0, r8
	str r0, [sp]
	movs r0, #0
	bl PutSpriteExt
_080CB27A:
	ldrh r0, [r6, #0x2a]
	adds r2, r0, #2
	movs r0, #0x3c
	mov r1, sl
	movs r3, #0xb
	bl sub_80CA9F8
	adds r7, r0, #0
	cmp r7, r9
	beq _080CB2CC
	adds r1, r7, #0
	subs r1, #0x40
	ldr r4, _080CB2E4  @ 0x000001FF
	ands r1, r4
	ldr r5, _080CB2E8  @ gUnknown_08AA709C
	ldr r0, _080CB2FC  @ 0x000020F0
	str r0, [sp]
	movs r0, #1
	movs r2, #0x3a
	adds r3, r5, #0
	bl PutSpriteExt
	adds r1, r7, #0
	subs r1, #0x3c
	ands r1, r4
	ldr r2, _080CB300  @ 0x0000043A
	ldr r0, _080CB304  @ 0x00003168
	str r0, [sp]
	movs r0, #2
	adds r3, r5, #0
	bl PutSpriteExt
	adds r1, r7, #0
	subs r1, #0x38
	ands r1, r4
	ldr r2, _080CB308  @ 0x00000852
	ldr r3, _080CB2F8  @ gUnknown_08AA70EA
	movs r0, #0
	str r0, [sp]
	bl PutSpriteExt
_080CB2CC:
	ldrh r0, [r6, #0x2a]
	cmp r0, #0xb
	bne _080CB30C
	movs r0, #0
	strh r0, [r6, #0x2a]
	adds r0, r6, #0
	bl Proc_Break
	b _080CB310
	.align 2, 0
_080CB2E0: .4byte 0x0000FFFF
_080CB2E4: .4byte 0x000001FF
_080CB2E8: .4byte gUnknown_08AA709C
_080CB2EC: .4byte 0x00000406
_080CB2F0: .4byte 0x00001078
_080CB2F4: .4byte 0x0000081E
_080CB2F8: .4byte gUnknown_08AA70EA
_080CB2FC: .4byte 0x000020F0
_080CB300: .4byte 0x0000043A
_080CB304: .4byte 0x00003168
_080CB308: .4byte 0x00000852
_080CB30C:
	adds r0, #1
	strh r0, [r6, #0x2a]
_080CB310:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80CB20C

	THUMB_FUNC_START sub_80CB320
sub_80CB320: @ 0x080CB320
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov sl, r0
	ldrh r7, [r0, #0x2a]
	cmp r7, #0
	bne _080CB3A6
	ldr r0, _080CB54C  @ gLCDControlBuffer
	mov ip, r0
	ldrb r0, [r0, #1]
	movs r2, #0x20
	orrs r0, r2
	movs r1, #0x40
	orrs r0, r1
	movs r1, #0x80
	orrs r0, r1
	mov r1, ip
	strb r0, [r1, #1]
	mov r5, ip
	adds r5, #0x34
	ldrb r0, [r5]
	orrs r0, r2
	movs r1, #2
	negs r1, r1
	mov r8, r1
	ands r0, r1
	movs r6, #3
	negs r6, r6
	ands r0, r6
	movs r4, #4
	orrs r0, r4
	movs r3, #9
	negs r3, r3
	ands r0, r3
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r5]
	adds r5, #1
	ldrb r0, [r5]
	orrs r0, r2
	mov r2, r8
	ands r0, r2
	ands r0, r6
	orrs r0, r4
	ands r0, r3
	orrs r0, r1
	strb r0, [r5]
	mov r0, ip
	adds r0, #0x2d
	strb r7, [r0]
	adds r0, #4
	strb r7, [r0]
	subs r0, #5
	strb r7, [r0]
	adds r0, #4
	strb r7, [r0]
	subs r0, #1
	strb r7, [r0]
	adds r0, #4
	strb r7, [r0]
	subs r0, #5
	strb r7, [r0]
	adds r0, #4
	strb r7, [r0]
_080CB3A6:
	mov r1, sl
	ldrh r0, [r1, #0x2a]
	adds r0, #2
	mov r9, r0
	movs r1, #1
	negs r1, r1
	movs r0, #0x1c
	mov r2, r9
	movs r3, #0xa
	bl sub_80CA9F8
	adds r7, r0, #0
	ldr r0, _080CB550  @ 0x0000FFFF
	cmp r7, r0
	beq _080CB41C
	movs r0, #0x28
	negs r0, r0
	cmp r7, r0
	blt _080CB41C
	cmp r7, #0xc8
	bgt _080CB41C
	adds r4, r7, #0
	subs r4, #0x30
	movs r6, #0xff
	ands r4, r6
	ldr r5, _080CB554  @ gUnknown_08AA709C
	movs r2, #0
	mov r8, r2
	str r2, [sp]
	movs r0, #1
	movs r1, #0x48
	adds r2, r4, #0
	adds r3, r5, #0
	bl PutSpriteExt
	movs r0, #0x80
	lsls r0, r0, #3
	orrs r4, r0
	ldr r0, _080CB558  @ 0x00001078
	str r0, [sp]
	movs r0, #2
	movs r1, #0x4c
	adds r2, r4, #0
	adds r3, r5, #0
	bl PutSpriteExt
	adds r2, r7, #0
	subs r2, #0x18
	ands r2, r6
	movs r0, #0x80
	lsls r0, r0, #4
	orrs r2, r0
	ldr r3, _080CB55C  @ gUnknown_08AA70EA
	mov r0, r8
	str r0, [sp]
	movs r0, #0
	movs r1, #0x40
	bl PutSpriteExt
_080CB41C:
	movs r0, #0x84
	movs r1, #1
	mov r2, r9
	movs r3, #0xa
	bl sub_80CA9F8
	adds r7, r0, #0
	ldr r0, _080CB550  @ 0x0000FFFF
	movs r1, #0x78
	cmp r1, r0
	beq _080CB49A
	cmp r7, r0
	beq _080CB49A
	movs r0, #0x28
	negs r0, r0
	cmp r7, r0
	blt _080CB49A
	cmp r7, #0xc8
	bgt _080CB49A
	subs r1, #0x30
	ldr r5, _080CB560  @ 0x000001FF
	ands r1, r5
	adds r4, r7, #0
	subs r4, #0x30
	movs r2, #0xff
	mov r8, r2
	ands r4, r2
	ldr r6, _080CB554  @ gUnknown_08AA709C
	ldr r0, _080CB564  @ 0x000020F0
	str r0, [sp]
	movs r0, #1
	adds r2, r4, #0
	adds r3, r6, #0
	bl PutSpriteExt
	movs r1, #0x78
	subs r1, #0x2c
	ands r1, r5
	movs r0, #0x80
	lsls r0, r0, #3
	orrs r4, r0
	ldr r0, _080CB568  @ 0x00003168
	str r0, [sp]
	movs r0, #2
	adds r2, r4, #0
	adds r3, r6, #0
	bl PutSpriteExt
	movs r1, #0x78
	subs r1, #0x38
	ands r1, r5
	adds r2, r7, #0
	subs r2, #0x18
	mov r0, r8
	ands r2, r0
	movs r0, #0x80
	lsls r0, r0, #4
	orrs r2, r0
	ldr r3, _080CB55C  @ gUnknown_08AA70EA
	movs r0, #0
	str r0, [sp]
	bl PutSpriteExt
_080CB49A:
	mov r3, r9
	subs r3, #2
	cmp r3, #7
	bhi _080CB4F2
	movs r0, #8
	str r0, [sp]
	movs r0, #4
	movs r1, #0
	movs r2, #0x18
	bl Interpolate
	adds r7, r0, #0
	ldr r3, _080CB54C  @ gLCDControlBuffer
	adds r1, r3, #0
	adds r1, #0x2d
	movs r0, #6
	strb r0, [r1]
	movs r2, #0x50
	subs r2, r2, r7
	adds r0, r3, #0
	adds r0, #0x31
	strb r2, [r0]
	subs r1, #1
	movs r0, #0x76
	strb r0, [r1]
	adds r1, r7, #0
	adds r1, #0x50
	adds r0, r3, #0
	adds r0, #0x30
	strb r1, [r0]
	adds r5, r3, #0
	adds r5, #0x2f
	movs r0, #0x7a
	strb r0, [r5]
	adds r0, r3, #0
	adds r0, #0x33
	strb r2, [r0]
	adds r2, r3, #0
	adds r2, #0x2e
	movs r0, #0xea
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x32
	strb r1, [r0]
_080CB4F2:
	ldr r4, _080CB554  @ gUnknown_08AA709C
	ldr r0, _080CB56C  @ 0x000041E0
	str r0, [sp]
	movs r0, #1
	movs r1, #0xe
	movs r2, #0x20
	adds r3, r4, #0
	bl PutSpriteExt
	movs r5, #0x84
	lsls r5, r5, #3
	ldr r0, _080CB570  @ 0x00005258
	str r0, [sp]
	movs r0, #2
	movs r1, #0x12
	adds r2, r5, #0
	adds r3, r4, #0
	bl PutSpriteExt
	ldr r0, _080CB574  @ 0x000062D0
	str r0, [sp]
	movs r0, #1
	movs r1, #0x82
	movs r2, #0x20
	adds r3, r4, #0
	bl PutSpriteExt
	ldr r0, _080CB578  @ 0x00007348
	str r0, [sp]
	movs r0, #2
	movs r1, #0x86
	adds r2, r5, #0
	adds r3, r4, #0
	bl PutSpriteExt
	mov r1, sl
	ldrh r0, [r1, #0x2a]
	cmp r0, #0xa
	bne _080CB57C
	movs r0, #0
	strh r0, [r1, #0x2a]
	mov r0, sl
	bl Proc_Break
	b _080CB582
	.align 2, 0
_080CB54C: .4byte gLCDControlBuffer
_080CB550: .4byte 0x0000FFFF
_080CB554: .4byte gUnknown_08AA709C
_080CB558: .4byte 0x00001078
_080CB55C: .4byte gUnknown_08AA70EA
_080CB560: .4byte 0x000001FF
_080CB564: .4byte 0x000020F0
_080CB568: .4byte 0x00003168
_080CB56C: .4byte 0x000041E0
_080CB570: .4byte 0x00005258
_080CB574: .4byte 0x000062D0
_080CB578: .4byte 0x00007348
_080CB57C:
	adds r0, #1
	mov r2, sl
	strh r0, [r2, #0x2a]
_080CB582:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80CB320

	THUMB_FUNC_START sub_80CB594
sub_80CB594: @ 0x080CB594
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r6, r0, #0
	ldrh r0, [r6, #0x2a]
	adds r2, r0, #6
	movs r0, #0xb4
	movs r1, #1
	movs r3, #9
	bl sub_80CA9F8
	adds r7, r0, #0
	ldr r0, _080CB660  @ 0x0000FFFF
	mov r9, r0
	cmp r7, r9
	beq _080CB5FA
	adds r1, r7, #0
	subs r1, #0x20
	ldr r4, _080CB664  @ 0x000001FF
	ands r1, r4
	ldr r5, _080CB668  @ gUnknown_08AA709C
	movs r0, #0
	mov r8, r0
	str r0, [sp]
	movs r0, #1
	movs r2, #6
	adds r3, r5, #0
	bl PutSpriteExt
	adds r1, r7, #0
	subs r1, #0x1c
	ands r1, r4
	ldr r2, _080CB66C  @ 0x00000406
	ldr r0, _080CB670  @ 0x00001078
	str r0, [sp]
	movs r0, #2
	adds r3, r5, #0
	bl PutSpriteExt
	adds r1, r7, #0
	subs r1, #0x38
	ands r1, r4
	ldr r2, _080CB674  @ 0x0000081E
	ldr r3, _080CB678  @ gUnknown_08AA70EA
	mov r0, r8
	str r0, [sp]
	movs r0, #0
	bl PutSpriteExt
_080CB5FA:
	ldrh r0, [r6, #0x2a]
	adds r2, r0, #2
	movs r0, #0xb4
	movs r1, #1
	movs r3, #9
	bl sub_80CA9F8
	adds r7, r0, #0
	cmp r7, r9
	beq _080CB64C
	adds r1, r7, #0
	subs r1, #0x40
	ldr r4, _080CB664  @ 0x000001FF
	ands r1, r4
	ldr r5, _080CB668  @ gUnknown_08AA709C
	ldr r0, _080CB67C  @ 0x000020F0
	str r0, [sp]
	movs r0, #1
	movs r2, #0x3a
	adds r3, r5, #0
	bl PutSpriteExt
	adds r1, r7, #0
	subs r1, #0x3c
	ands r1, r4
	ldr r2, _080CB680  @ 0x0000043A
	ldr r0, _080CB684  @ 0x00003168
	str r0, [sp]
	movs r0, #2
	adds r3, r5, #0
	bl PutSpriteExt
	adds r1, r7, #0
	subs r1, #0x38
	ands r1, r4
	ldr r2, _080CB688  @ 0x00000852
	ldr r3, _080CB678  @ gUnknown_08AA70EA
	movs r0, #0
	str r0, [sp]
	bl PutSpriteExt
_080CB64C:
	ldrh r0, [r6, #0x2a]
	cmp r0, #9
	bne _080CB68C
	movs r0, #0
	strh r0, [r6, #0x2a]
	adds r0, r6, #0
	bl Proc_Break
	b _080CB690
	.align 2, 0
_080CB660: .4byte 0x0000FFFF
_080CB664: .4byte 0x000001FF
_080CB668: .4byte gUnknown_08AA709C
_080CB66C: .4byte 0x00000406
_080CB670: .4byte 0x00001078
_080CB674: .4byte 0x0000081E
_080CB678: .4byte gUnknown_08AA70EA
_080CB67C: .4byte 0x000020F0
_080CB680: .4byte 0x0000043A
_080CB684: .4byte 0x00003168
_080CB688: .4byte 0x00000852
_080CB68C:
	adds r0, #1
	strh r0, [r6, #0x2a]
_080CB690:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80CB594

	THUMB_FUNC_START sub_80CB6A0
sub_80CB6A0: @ 0x080CB6A0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov r9, r0
	ldrh r0, [r0, #0x2a]
	adds r2, r0, #0
	adds r2, #0xa
	movs r0, #0x78
	mov sl, r0
	movs r0, #0x1c
	movs r1, #1
	movs r3, #8
	bl sub_80CA9F8
	adds r7, r0, #0
	ldr r0, _080CB83C  @ 0x0000FFFF
	cmp r7, r0
	beq _080CB722
	movs r0, #0x28
	negs r0, r0
	cmp r7, r0
	blt _080CB722
	cmp r7, #0xc8
	bgt _080CB722
	adds r4, r7, #0
	subs r4, #0x30
	movs r6, #0xff
	ands r4, r6
	ldr r5, _080CB840  @ gUnknown_08AA709C
	movs r1, #0
	mov r8, r1
	str r1, [sp]
	movs r0, #1
	movs r1, #0x48
	adds r2, r4, #0
	adds r3, r5, #0
	bl PutSpriteExt
	movs r0, #0x80
	lsls r0, r0, #3
	orrs r4, r0
	ldr r0, _080CB844  @ 0x00001078
	str r0, [sp]
	movs r0, #2
	movs r1, #0x4c
	adds r2, r4, #0
	adds r3, r5, #0
	bl PutSpriteExt
	adds r2, r7, #0
	subs r2, #0x18
	ands r2, r6
	movs r0, #0x80
	lsls r0, r0, #4
	orrs r2, r0
	ldr r3, _080CB848  @ gUnknown_08AA715C
	mov r0, r8
	str r0, [sp]
	movs r0, #0
	movs r1, #0x18
	bl PutSpriteExt
_080CB722:
	mov r1, r9
	ldrh r0, [r1, #0x2a]
	adds r2, r0, #6
	movs r0, #0x50
	movs r1, #1
	movs r3, #8
	bl sub_80CA9F8
	adds r7, r0, #0
	ldr r0, _080CB83C  @ 0x0000FFFF
	cmp sl, r0
	beq _080CB7A4
	cmp r7, r0
	beq _080CB7A4
	movs r0, #0x28
	negs r0, r0
	cmp r7, r0
	blt _080CB7A4
	cmp r7, #0xc8
	bgt _080CB7A4
	mov r1, sl
	subs r1, #0x30
	ldr r5, _080CB84C  @ 0x000001FF
	ands r1, r5
	adds r4, r7, #0
	subs r4, #0x30
	movs r0, #0xff
	mov r8, r0
	ands r4, r0
	ldr r6, _080CB840  @ gUnknown_08AA709C
	ldr r0, _080CB850  @ 0x000020F0
	str r0, [sp]
	movs r0, #1
	adds r2, r4, #0
	adds r3, r6, #0
	bl PutSpriteExt
	mov r1, sl
	subs r1, #0x2c
	ands r1, r5
	movs r0, #0x80
	lsls r0, r0, #3
	orrs r4, r0
	ldr r0, _080CB854  @ 0x00003168
	str r0, [sp]
	movs r0, #2
	adds r2, r4, #0
	adds r3, r6, #0
	bl PutSpriteExt
	mov r1, sl
	subs r1, #0x60
	ands r1, r5
	adds r2, r7, #0
	subs r2, #0x18
	mov r0, r8
	ands r2, r0
	movs r0, #0x80
	lsls r0, r0, #4
	orrs r2, r0
	ldr r3, _080CB848  @ gUnknown_08AA715C
	movs r0, #0
	str r0, [sp]
	bl PutSpriteExt
_080CB7A4:
	mov r1, r9
	ldrh r0, [r1, #0x2a]
	adds r2, r0, #2
	movs r0, #0x84
	movs r1, #1
	movs r3, #8
	bl sub_80CA9F8
	adds r7, r0, #0
	ldr r0, _080CB83C  @ 0x0000FFFF
	cmp sl, r0
	beq _080CB826
	cmp r7, r0
	beq _080CB826
	movs r0, #0x28
	negs r0, r0
	cmp r7, r0
	blt _080CB826
	cmp r7, #0xc8
	bgt _080CB826
	mov r1, sl
	subs r1, #0x30
	ldr r5, _080CB84C  @ 0x000001FF
	ands r1, r5
	adds r4, r7, #0
	subs r4, #0x30
	movs r0, #0xff
	mov r8, r0
	ands r4, r0
	ldr r6, _080CB840  @ gUnknown_08AA709C
	ldr r0, _080CB858  @ 0x000041E0
	str r0, [sp]
	movs r0, #1
	adds r2, r4, #0
	adds r3, r6, #0
	bl PutSpriteExt
	mov r1, sl
	subs r1, #0x2c
	ands r1, r5
	movs r0, #0x80
	lsls r0, r0, #3
	orrs r4, r0
	ldr r0, _080CB85C  @ 0x00005258
	str r0, [sp]
	movs r0, #2
	adds r2, r4, #0
	adds r3, r6, #0
	bl PutSpriteExt
	mov r1, sl
	subs r1, #0x60
	ands r1, r5
	adds r2, r7, #0
	subs r2, #0x18
	mov r0, r8
	ands r2, r0
	movs r0, #0x80
	lsls r0, r0, #4
	orrs r2, r0
	ldr r3, _080CB848  @ gUnknown_08AA715C
	movs r0, #0
	str r0, [sp]
	bl PutSpriteExt
_080CB826:
	mov r1, r9
	ldrh r0, [r1, #0x2a]
	cmp r0, #8
	bne _080CB860
	movs r0, #0
	strh r0, [r1, #0x2a]
	mov r0, r9
	bl Proc_Break
	b _080CB866
	.align 2, 0
_080CB83C: .4byte 0x0000FFFF
_080CB840: .4byte gUnknown_08AA709C
_080CB844: .4byte 0x00001078
_080CB848: .4byte gUnknown_08AA715C
_080CB84C: .4byte 0x000001FF
_080CB850: .4byte 0x000020F0
_080CB854: .4byte 0x00003168
_080CB858: .4byte 0x000041E0
_080CB85C: .4byte 0x00005258
_080CB860:
	adds r0, #1
	mov r1, r9
	strh r0, [r1, #0x2a]
_080CB866:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80CB6A0

	THUMB_FUNC_START sub_80CB878
sub_80CB878: @ 0x080CB878
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	mov r9, r0
	ldrh r0, [r0, #0x2a]
	adds r0, #2
	str r0, [sp, #4]
	movs r0, #0x1e
	mov sl, r0
	movs r1, #1
	negs r1, r1
	movs r0, #0x50
	ldr r2, [sp, #4]
	movs r3, #7
	bl sub_80CA9F8
	adds r7, r0, #0
	ldr r0, _080CBA20  @ 0x0000FFFF
	cmp r7, r0
	beq _080CB902
	movs r0, #0x28
	negs r0, r0
	cmp r7, r0
	blt _080CB902
	cmp r7, #0xc8
	bgt _080CB902
	mov r1, sl
	subs r1, #0x30
	ldr r5, _080CBA24  @ 0x000001FF
	ands r1, r5
	adds r4, r7, #0
	subs r4, #0x28
	movs r0, #0xff
	ands r4, r0
	ldr r6, _080CBA28  @ gUnknown_08AA709C
	movs r0, #0
	mov r8, r0
	str r0, [sp]
	movs r0, #1
	adds r2, r4, #0
	adds r3, r6, #0
	bl PutSpriteExt
	mov r1, sl
	subs r1, #0x2c
	ands r1, r5
	movs r2, #0x80
	lsls r2, r2, #3
	orrs r2, r4
	ldr r0, _080CBA2C  @ 0x00001078
	str r0, [sp]
	movs r0, #2
	adds r3, r6, #0
	bl PutSpriteExt
	movs r0, #0x80
	lsls r0, r0, #4
	orrs r4, r0
	ldr r3, _080CBA30  @ gUnknown_08AA712A
	mov r1, r8
	str r1, [sp]
	movs r0, #0
	movs r1, #2
	adds r2, r4, #0
	bl PutSpriteExt
_080CB902:
	ldr r0, _080CBA20  @ 0x0000FFFF
	cmp r7, r0
	beq _080CB956
	movs r0, #0x28
	negs r0, r0
	cmp r7, r0
	blt _080CB956
	cmp r7, #0xc8
	bgt _080CB956
	adds r4, r7, #0
	subs r4, #0x28
	movs r0, #0xff
	ands r4, r0
	ldr r5, _080CBA28  @ gUnknown_08AA709C
	ldr r0, _080CBA34  @ 0x000041E0
	str r0, [sp]
	movs r0, #1
	movs r1, #0x66
	adds r2, r4, #0
	adds r3, r5, #0
	bl PutSpriteExt
	movs r2, #0x80
	lsls r2, r2, #3
	orrs r2, r4
	ldr r0, _080CBA38  @ 0x00005258
	str r0, [sp]
	movs r0, #2
	movs r1, #0x6a
	adds r3, r5, #0
	bl PutSpriteExt
	movs r0, #0x80
	lsls r0, r0, #4
	orrs r4, r0
	ldr r3, _080CBA30  @ gUnknown_08AA712A
	movs r0, #0
	str r0, [sp]
	movs r1, #0x7a
	adds r2, r4, #0
	bl PutSpriteExt
_080CB956:
	movs r0, #0x50
	movs r1, #1
	ldr r2, [sp, #4]
	movs r3, #7
	bl sub_80CA9F8
	adds r7, r0, #0
	ldr r0, _080CBA20  @ 0x0000FFFF
	cmp r7, r0
	beq _080CB9B8
	movs r0, #0x28
	negs r0, r0
	cmp r7, r0
	blt _080CB9B8
	cmp r7, #0xc8
	bgt _080CB9B8
	adds r4, r7, #0
	subs r4, #0x28
	movs r0, #0xff
	ands r4, r0
	ldr r5, _080CBA28  @ gUnknown_08AA709C
	ldr r0, _080CBA3C  @ 0x000020F0
	str r0, [sp]
	movs r0, #1
	movs r1, #0x2a
	adds r2, r4, #0
	adds r3, r5, #0
	bl PutSpriteExt
	movs r2, #0x80
	lsls r2, r2, #3
	orrs r2, r4
	ldr r0, _080CBA40  @ 0x00003168
	str r0, [sp]
	movs r0, #2
	movs r1, #0x2e
	adds r3, r5, #0
	bl PutSpriteExt
	movs r0, #0x80
	lsls r0, r0, #4
	orrs r4, r0
	ldr r3, _080CBA30  @ gUnknown_08AA712A
	movs r0, #0
	str r0, [sp]
	movs r1, #0x3e
	adds r2, r4, #0
	bl PutSpriteExt
_080CB9B8:
	ldr r0, _080CBA20  @ 0x0000FFFF
	cmp r7, r0
	beq _080CBA0C
	movs r0, #0x28
	negs r0, r0
	cmp r7, r0
	blt _080CBA0C
	cmp r7, #0xc8
	bgt _080CBA0C
	adds r4, r7, #0
	subs r4, #0x28
	movs r0, #0xff
	ands r4, r0
	ldr r5, _080CBA28  @ gUnknown_08AA709C
	ldr r0, _080CBA44  @ 0x000062D0
	str r0, [sp]
	movs r0, #1
	movs r1, #0xa2
	adds r2, r4, #0
	adds r3, r5, #0
	bl PutSpriteExt
	movs r2, #0x80
	lsls r2, r2, #3
	orrs r2, r4
	ldr r0, _080CBA48  @ 0x00007348
	str r0, [sp]
	movs r0, #2
	movs r1, #0xa6
	adds r3, r5, #0
	bl PutSpriteExt
	movs r0, #0x80
	lsls r0, r0, #4
	orrs r4, r0
	ldr r3, _080CBA30  @ gUnknown_08AA712A
	movs r0, #0
	str r0, [sp]
	movs r1, #0xb6
	adds r2, r4, #0
	bl PutSpriteExt
_080CBA0C:
	mov r1, r9
	ldrh r0, [r1, #0x2a]
	cmp r0, #7
	bne _080CBA4C
	movs r0, #0
	strh r0, [r1, #0x2a]
	mov r0, r9
	bl Proc_Break
	b _080CBA52
	.align 2, 0
_080CBA20: .4byte 0x0000FFFF
_080CBA24: .4byte 0x000001FF
_080CBA28: .4byte gUnknown_08AA709C
_080CBA2C: .4byte 0x00001078
_080CBA30: .4byte gUnknown_08AA712A
_080CBA34: .4byte 0x000041E0
_080CBA38: .4byte 0x00005258
_080CBA3C: .4byte 0x000020F0
_080CBA40: .4byte 0x00003168
_080CBA44: .4byte 0x000062D0
_080CBA48: .4byte 0x00007348
_080CBA4C:
	adds r0, #1
	mov r1, r9
	strh r0, [r1, #0x2a]
_080CBA52:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80CB878

	THUMB_FUNC_START sub_80CBA64
sub_80CBA64: @ 0x080CBA64
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov r9, r0
	ldrh r0, [r0, #0x2a]
	adds r2, r0, #2
	movs r0, #0x78
	mov sl, r0
	movs r1, #1
	negs r1, r1
	movs r0, #0x1c
	movs r3, #6
	bl sub_80CA9F8
	adds r7, r0, #0
	ldr r0, _080CBC04  @ 0x0000FFFF
	cmp r7, r0
	beq _080CBAE6
	movs r0, #0x28
	negs r0, r0
	cmp r7, r0
	blt _080CBAE6
	cmp r7, #0xc8
	bgt _080CBAE6
	adds r4, r7, #0
	subs r4, #0x30
	movs r6, #0xff
	ands r4, r6
	ldr r5, _080CBC08  @ gUnknown_08AA709C
	movs r1, #0
	mov r8, r1
	str r1, [sp]
	movs r0, #1
	movs r1, #0x48
	adds r2, r4, #0
	adds r3, r5, #0
	bl PutSpriteExt
	movs r0, #0x80
	lsls r0, r0, #3
	orrs r4, r0
	ldr r0, _080CBC0C  @ 0x00001078
	str r0, [sp]
	movs r0, #2
	movs r1, #0x4c
	adds r2, r4, #0
	adds r3, r5, #0
	bl PutSpriteExt
	adds r2, r7, #0
	subs r2, #0x18
	ands r2, r6
	movs r0, #0x80
	lsls r0, r0, #4
	orrs r2, r0
	ldr r3, _080CBC10  @ gUnknown_08AA715C
	mov r0, r8
	str r0, [sp]
	movs r0, #0
	movs r1, #0x18
	bl PutSpriteExt
_080CBAE6:
	mov r1, r9
	ldrh r0, [r1, #0x2a]
	adds r2, r0, #6
	movs r1, #1
	negs r1, r1
	movs r0, #0x50
	movs r3, #6
	bl sub_80CA9F8
	adds r7, r0, #0
	ldr r0, _080CBC04  @ 0x0000FFFF
	cmp sl, r0
	beq _080CBB6A
	cmp r7, r0
	beq _080CBB6A
	movs r0, #0x28
	negs r0, r0
	cmp r7, r0
	blt _080CBB6A
	cmp r7, #0xc8
	bgt _080CBB6A
	mov r1, sl
	subs r1, #0x30
	ldr r5, _080CBC14  @ 0x000001FF
	ands r1, r5
	adds r4, r7, #0
	subs r4, #0x30
	movs r0, #0xff
	mov r8, r0
	ands r4, r0
	ldr r6, _080CBC08  @ gUnknown_08AA709C
	ldr r0, _080CBC18  @ 0x000020F0
	str r0, [sp]
	movs r0, #1
	adds r2, r4, #0
	adds r3, r6, #0
	bl PutSpriteExt
	mov r1, sl
	subs r1, #0x2c
	ands r1, r5
	movs r0, #0x80
	lsls r0, r0, #3
	orrs r4, r0
	ldr r0, _080CBC1C  @ 0x00003168
	str r0, [sp]
	movs r0, #2
	adds r2, r4, #0
	adds r3, r6, #0
	bl PutSpriteExt
	mov r1, sl
	subs r1, #0x60
	ands r1, r5
	adds r2, r7, #0
	subs r2, #0x18
	mov r0, r8
	ands r2, r0
	movs r0, #0x80
	lsls r0, r0, #4
	orrs r2, r0
	ldr r3, _080CBC10  @ gUnknown_08AA715C
	movs r0, #0
	str r0, [sp]
	bl PutSpriteExt
_080CBB6A:
	mov r1, r9
	ldrh r0, [r1, #0x2a]
	adds r2, r0, #0
	adds r2, #0xa
	movs r1, #1
	negs r1, r1
	movs r0, #0x84
	movs r3, #6
	bl sub_80CA9F8
	adds r7, r0, #0
	ldr r0, _080CBC04  @ 0x0000FFFF
	cmp sl, r0
	beq _080CBBF0
	cmp r7, r0
	beq _080CBBF0
	movs r0, #0x28
	negs r0, r0
	cmp r7, r0
	blt _080CBBF0
	cmp r7, #0xc8
	bgt _080CBBF0
	mov r1, sl
	subs r1, #0x30
	ldr r5, _080CBC14  @ 0x000001FF
	ands r1, r5
	adds r4, r7, #0
	subs r4, #0x30
	movs r0, #0xff
	mov r8, r0
	ands r4, r0
	ldr r6, _080CBC08  @ gUnknown_08AA709C
	ldr r0, _080CBC20  @ 0x000041E0
	str r0, [sp]
	movs r0, #1
	adds r2, r4, #0
	adds r3, r6, #0
	bl PutSpriteExt
	mov r1, sl
	subs r1, #0x2c
	ands r1, r5
	movs r0, #0x80
	lsls r0, r0, #3
	orrs r4, r0
	ldr r0, _080CBC24  @ 0x00005258
	str r0, [sp]
	movs r0, #2
	adds r2, r4, #0
	adds r3, r6, #0
	bl PutSpriteExt
	mov r1, sl
	subs r1, #0x60
	ands r1, r5
	adds r2, r7, #0
	subs r2, #0x18
	mov r0, r8
	ands r2, r0
	movs r0, #0x80
	lsls r0, r0, #4
	orrs r2, r0
	ldr r3, _080CBC10  @ gUnknown_08AA715C
	movs r0, #0
	str r0, [sp]
	bl PutSpriteExt
_080CBBF0:
	mov r1, r9
	ldrh r0, [r1, #0x2a]
	cmp r0, #6
	bne _080CBC28
	movs r0, #0
	strh r0, [r1, #0x2a]
	mov r0, r9
	bl Proc_Break
	b _080CBC2E
	.align 2, 0
_080CBC04: .4byte 0x0000FFFF
_080CBC08: .4byte gUnknown_08AA709C
_080CBC0C: .4byte 0x00001078
_080CBC10: .4byte gUnknown_08AA715C
_080CBC14: .4byte 0x000001FF
_080CBC18: .4byte 0x000020F0
_080CBC1C: .4byte 0x00003168
_080CBC20: .4byte 0x000041E0
_080CBC24: .4byte 0x00005258
_080CBC28:
	adds r0, #1
	mov r1, r9
	strh r0, [r1, #0x2a]
_080CBC2E:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80CBA64

	THUMB_FUNC_START sub_80CBC40
sub_80CBC40: @ 0x080CBC40
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov r8, r0
	ldrh r0, [r0, #0x2a]
	adds r0, #2
	mov r9, r0
	movs r1, #1
	negs r1, r1
	movs r0, #0x3e
	mov r2, r9
	movs r3, #5
	bl sub_80CA9F8
	adds r7, r0, #0
	ldr r0, _080CBD3C  @ 0x0000FFFF
	mov sl, r0
	cmp r7, sl
	beq _080CBCAC
	adds r1, r7, #0
	subs r1, #0x30
	ldr r4, _080CBD40  @ 0x000001FF
	ands r1, r4
	ldr r5, _080CBD44  @ gUnknown_08AA709C
	movs r6, #0
	str r6, [sp]
	movs r0, #1
	movs r2, #0x28
	adds r3, r5, #0
	bl PutSpriteExt
	adds r1, r7, #0
	subs r1, #0x2c
	ands r1, r4
	movs r2, #0x85
	lsls r2, r2, #3
	ldr r0, _080CBD48  @ 0x00001078
	str r0, [sp]
	movs r0, #2
	adds r3, r5, #0
	bl PutSpriteExt
	adds r1, r7, #0
	subs r1, #0x38
	ands r1, r4
	ldr r2, _080CBD4C  @ 0x00000828
	ldr r3, _080CBD50  @ gUnknown_08AA7194
	str r6, [sp]
	movs r0, #0
	bl PutSpriteExt
_080CBCAC:
	movs r0, #0xb2
	movs r1, #1
	mov r2, r9
	movs r3, #5
	bl sub_80CA9F8
	adds r7, r0, #0
	cmp r7, sl
	beq _080CBCFE
	adds r1, r7, #0
	subs r1, #0x30
	ldr r4, _080CBD40  @ 0x000001FF
	ands r1, r4
	ldr r5, _080CBD44  @ gUnknown_08AA709C
	ldr r0, _080CBD54  @ 0x000020F0
	str r0, [sp]
	movs r0, #1
	movs r2, #0x28
	adds r3, r5, #0
	bl PutSpriteExt
	adds r1, r7, #0
	subs r1, #0x2c
	ands r1, r4
	movs r2, #0x85
	lsls r2, r2, #3
	ldr r0, _080CBD58  @ 0x00003168
	str r0, [sp]
	movs r0, #2
	adds r3, r5, #0
	bl PutSpriteExt
	adds r1, r7, #0
	subs r1, #0x38
	ands r1, r4
	ldr r2, _080CBD4C  @ 0x00000828
	ldr r3, _080CBD50  @ gUnknown_08AA7194
	movs r0, #0
	str r0, [sp]
	bl PutSpriteExt
_080CBCFE:
	mov r1, r8
	ldrh r0, [r1, #0x2a]
	cmp r0, #1
	bne _080CBD28
	ldr r0, _080CBD5C  @ Tsa_OpAnimShiningRingBlinking
	ldr r4, _080CBD60  @ 0x0600F000
	adds r1, r4, #0
	bl Decompress
	movs r3, #0x80
	lsls r3, r3, #8
	adds r2, r3, #0
	movs r1, #0xa0
	lsls r1, r1, #2
_080CBD1A:
	ldrh r3, [r4]
	adds r0, r2, r3
	strh r0, [r4]
	subs r1, #1
	adds r4, #2
	cmp r1, #0
	bne _080CBD1A
_080CBD28:
	mov r1, r8
	ldrh r0, [r1, #0x2a]
	cmp r0, #5
	bne _080CBD64
	movs r0, #0
	strh r0, [r1, #0x2a]
	mov r0, r8
	bl Proc_Break
	b _080CBD6A
	.align 2, 0
_080CBD3C: .4byte 0x0000FFFF
_080CBD40: .4byte 0x000001FF
_080CBD44: .4byte gUnknown_08AA709C
_080CBD48: .4byte 0x00001078
_080CBD4C: .4byte 0x00000828
_080CBD50: .4byte gUnknown_08AA7194
_080CBD54: .4byte 0x000020F0
_080CBD58: .4byte 0x00003168
_080CBD5C: .4byte Tsa_OpAnimShiningRingBlinking
_080CBD60: .4byte 0x0600F000
_080CBD64:
	adds r0, #1
	mov r3, r8
	strh r0, [r3, #0x2a]
_080CBD6A:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80CBC40

	THUMB_FUNC_START sub_80CBD7C
sub_80CBD7C: @ 0x080CBD7C
	push {r4, lr}
	bl EndAllProcChildren
	bl EndProc08AA6D04
	movs r0, #0
	bl SetPrimaryHBlankHandler
	bl EndOpAnimfxTerminator
	ldr r4, _080CBDCC  @ gLCDControlBuffer
	ldrb r1, [r4]
	movs r0, #0x41
	negs r0, r0
	ands r0, r1
	strb r0, [r4]
	ldr r1, _080CBDD0  @ gPaletteBuffer
	ldr r0, _080CBDD4  @ gOpAnimSt
	ldrh r0, [r0, #0xc]
	strh r0, [r1]
	bl EnablePaletteSync
	ldrb r1, [r4, #1]
	movs r0, #2
	negs r0, r0
	ands r0, r1
	movs r1, #3
	negs r1, r1
	ands r0, r1
	subs r1, #2
	ands r0, r1
	subs r1, #4
	ands r0, r1
	subs r1, #8
	ands r0, r1
	strb r0, [r4, #1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080CBDCC: .4byte gLCDControlBuffer
_080CBDD0: .4byte gPaletteBuffer
_080CBDD4: .4byte gOpAnimSt

	THUMB_FUNC_END sub_80CBD7C
