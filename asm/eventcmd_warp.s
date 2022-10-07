
	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

    @ event 41 effect proc
    @ warp anim


	THUMB_FUNC_START sub_8012950
sub_8012950: @ 0x08012950
	push {r4, lr}
	sub sp, #4
	ldr r4, [sp, #0xc]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	lsls r3, r3, #0x18
	asrs r3, r3, #0x18
	lsls r4, r4, #0x18
	asrs r4, r4, #0x18
	str r4, [sp]
	bl StartEventWarpAnim
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8012950

	THUMB_FUNC_START sub_8012974
sub_8012974: @ 0x08012974
	push {lr}
	bl EventWarpAnimExists
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8012974

    .align 2, 0 @ Don't pad with nop.
