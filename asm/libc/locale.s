    .INCLUDE "macro.inc"

    .SYNTAX unified

	THUMB_FUNC_START _setlocale_r
_setlocale_r: @ 0x080D458C
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	adds r4, r2, #0
	cmp r4, #0
	beq _080D45C0
	ldr r1, _080D45B4 @ 0x085877CC
	adds r0, r4, #0
	bl strcmp
	cmp r0, #0
	beq _080D45BC
	ldr r1, _080D45B8 @ 0x085877C4
	adds r0, r4, #0
	bl strcmp
	cmp r0, #0
	beq _080D45BC
	movs r0, #0
	b _080D45C2
	.align 2, 0
_080D45B4: .4byte gUnknown_085877CC
_080D45B8: .4byte gUnknown_085877C4
_080D45BC:
	str r6, [r5, #0x30]
	str r4, [r5, #0x34]
_080D45C0:
	ldr r0, _080D45C4 @ 0x085877CC
_080D45C2:
	pop {r4, r5, r6, pc}
	.align 2, 0
_080D45C4: .4byte gUnknown_085877CC

	THUMB_FUNC_START _localeconv_r
_localeconv_r: @ 0x080D45C8
	ldr r0, _080D45CC @ 0x08587794
	bx lr
	.align 2, 0
_080D45CC: .4byte gUnknown_08587794

	THUMB_FUNC_START setlocale
setlocale: @ 0x080D45D0
	push {lr}
	adds r3, r0, #0
	adds r2, r1, #0
	ldr r0, _080D45E4 @ 0x08B1FA20
	ldr r0, [r0]
	adds r1, r3, #0
	bl _setlocale_r
	pop {pc}
	.align 2, 0
_080D45E4: .4byte gUnknown_08B1FA20

	THUMB_FUNC_START localeconv
localeconv: @ 0x080D45E8
	push {lr}
	ldr r0, _080D45F4 @ 0x08B1FA20
	ldr r0, [r0]
	bl _localeconv_r
	pop {pc}
	.align 2, 0
_080D45F4: .4byte gUnknown_08B1FA20
