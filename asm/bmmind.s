	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	@ Unit Action stuff (why "mind"?)

	THUMB_FUNC_START sub_80329C0
sub_80329C0: @ 0x080329C0
	push {r4, lr}
	ldr r4, _080329D4  @ gUnknown_0203A974
	adds r1, r4, #0
	movs r2, #7
	bl CpuFastSet
	adds r0, r4, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080329D4: .4byte gUnknown_0203A974

	THUMB_FUNC_END sub_80329C0

.align 2, 0
