    .INCLUDE "macro.inc"

    .SYNTAX unified

	THUMB_FUNC_START sub_80D188C
sub_80D188C: @ 0x080D188C
	push {r4, r5, r6, lr}
	adds r6, r1, #0
	adds r5, r0, #0
	cmp r2, #0
	beq _080D18BC
	movs r0, #0x20
	subs r0, r0, r2
	cmp r0, #0
	bgt _080D18A8
	movs r3, #0
	negs r0, r0
	adds r4, r5, #0
	lsls r4, r0
	b _080D18B8
_080D18A8:
	adds r1, r5, #0
	lsrs r1, r0
	adds r3, r5, #0
	lsls r3, r2
	adds r0, r6, #0
	lsls r0, r2
	adds r4, r0, #0
	orrs r4, r1
_080D18B8:
	adds r1, r4, #0
	adds r0, r3, #0
_080D18BC:
	pop {r4, r5, r6, pc}
	.byte 0x00, 0x00
