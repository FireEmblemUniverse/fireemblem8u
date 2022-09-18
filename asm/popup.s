	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	THUMB_FUNC_START sub_8011750
sub_8011750: @ 0x08011750
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r3, r2, #0
	ldr r0, _08011780  @ gPopupInst
	movs r4, #0
	movs r2, #0xc
	strb r2, [r0]
	str r1, [r0, #4]
	movs r1, #8
	strb r1, [r0, #8]
	str r4, [r0, #0xc]
	movs r1, #6
	strb r1, [r0, #0x10]
	str r5, [r0, #0x14]
	strb r4, [r0, #0x18]
	str r4, [r0, #0x1c]
	movs r1, #0x60
	movs r2, #0
	bl NewPopupSimple
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08011780: .4byte gPopupInst

	THUMB_FUNC_END sub_8011750

	.align 2, 0 @ Don't pad with nop.
