    .INCLUDE "macro.inc"

    .SYNTAX unified

	THUMB_FUNC_START std
std: @ 0x080D3F44
	push {r4, lr}
	movs r4, #0
	str r4, [r0]
	str r4, [r0, #4]
	str r4, [r0, #8]
	strh r1, [r0, #0xc]
	strh r2, [r0, #0xe]
	str r4, [r0, #0x10]
	str r4, [r0, #0x18]
	str r0, [r0, #0x1c]
	ldr r1, _080D3F6C @ 0x080D566D
	str r1, [r0, #0x20]
	ldr r1, _080D3F70 @ 0x080D56A1
	str r1, [r0, #0x24]
	ldr r1, _080D3F74 @ 0x080D56E1
	str r1, [r0, #0x28]
	ldr r1, _080D3F78 @ 0x080D5721
	str r1, [r0, #0x2c]
	str r3, [r0, #0x54]
	pop {r4, pc}
	.align 2, 0
_080D3F6C: .4byte __sread
_080D3F70: .4byte __swrite
_080D3F74: .4byte __sseek
_080D3F78: .4byte __sclose

	THUMB_FUNC_START __sfmoreglue
__sfmoreglue: @ 0x080D3F7C
	push {r4, r5, r6, lr}
	adds r5, r1, #0
	movs r1, #0x58
	adds r6, r5, #0
	muls r6, r1, r6
	adds r1, r6, #0
	adds r1, #0xc
	bl _malloc_r
	adds r4, r0, #0
	cmp r4, #0
	beq _080D3FA8
	adds r0, #0xc
	movs r1, #0
	str r1, [r4]
	str r5, [r4, #4]
	str r0, [r4, #8]
	adds r2, r6, #0
	bl memset
	adds r0, r4, #0
	b _080D3FAA
_080D3FA8:
	movs r0, #0
_080D3FAA:
	pop {r4, r5, r6, pc}

	THUMB_FUNC_START __sfp
__sfp: @ 0x080D3FAC
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x38]
	cmp r0, #0
	bne _080D3FBC
	adds r0, r5, #0
	bl __sinit
_080D3FBC:
	movs r0, #0xec
	lsls r0, r0, #1
	adds r4, r5, r0
	b _080D3FC6
_080D3FC4:
	ldr r4, [r4]
_080D3FC6:
	ldr r2, [r4, #8]
	ldr r0, [r4, #4]
	b _080D3FD6
_080D3FCC:
	movs r3, #0xc
	ldrsh r1, [r2, r3]
	cmp r1, #0
	beq _080D3FF8
	adds r2, #0x58
_080D3FD6:
	subs r0, #1
	cmp r0, #0
	bge _080D3FCC
	ldr r0, [r4]
	cmp r0, #0
	bne _080D3FC4
	adds r0, r5, #0
	movs r1, #4
	bl __sfmoreglue
	str r0, [r4]
	cmp r0, #0
	bne _080D3FC4
	movs r0, #0xc
	str r0, [r5]
	movs r0, #0
	b _080D4018
_080D3FF8:
	movs r0, #1
	strh r0, [r2, #0xc]
	str r1, [r2]
	str r1, [r2, #8]
	str r1, [r2, #4]
	str r1, [r2, #0x10]
	str r1, [r2, #0x14]
	str r1, [r2, #0x18]
	ldr r0, _080D401C @ 0x0000FFFF
	strh r0, [r2, #0xe]
	str r1, [r2, #0x30]
	str r1, [r2, #0x34]
	str r1, [r2, #0x44]
	str r1, [r2, #0x48]
	str r5, [r2, #0x54]
	adds r0, r2, #0
_080D4018:
	pop {r4, r5, pc}
	.align 2, 0
_080D401C: .4byte 0x0000FFFF

	THUMB_FUNC_START _cleanup_r
_cleanup_r: @ 0x080D4020
	push {lr}
	ldr r1, _080D402C @ 0x080D3EB1
	bl _fwalk
	pop {pc}
	.align 2, 0
_080D402C: .4byte fflush

	THUMB_FUNC_START _cleanup
_cleanup: @ 0x080D4030
	push {lr}
	ldr r0, _080D403C @ 0x08B1FA20
	ldr r0, [r0]
	bl _cleanup_r
	pop {pc}
	.align 2, 0
_080D403C: .4byte 0x08B1FA20

	THUMB_FUNC_START __sinit
__sinit: @ 0x080D4040
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _080D409C @ 0x080D4021
	str r0, [r5, #0x3c]
	movs r0, #1
	str r0, [r5, #0x38]
	movs r0, #0xf2
	lsls r0, r0, #1
	adds r4, r5, r0
	adds r0, r4, #0
	movs r1, #4
	movs r2, #0
	adds r3, r5, #0
	bl std
	movs r1, #0x8f
	lsls r1, r1, #2
	adds r0, r5, r1
	movs r1, #9
	movs r2, #1
	adds r3, r5, #0
	bl std
	movs r1, #0xa5
	lsls r1, r1, #2
	adds r0, r5, r1
	movs r1, #0xa
	movs r2, #2
	adds r3, r5, #0
	bl std
	movs r0, #0xec
	lsls r0, r0, #1
	adds r1, r5, r0
	movs r0, #0
	str r0, [r1]
	movs r0, #0xee
	lsls r0, r0, #1
	adds r1, r5, r0
	movs r0, #3
	str r0, [r1]
	movs r1, #0xf0
	lsls r1, r1, #1
	adds r0, r5, r1
	str r4, [r0]
	pop {r4, r5, pc}
	.align 2, 0
_080D409C: .4byte _cleanup_r
