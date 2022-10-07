	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

    @ anim for a maybe boom fog
    @ seems unused

	THUMB_FUNC_START sub_8012B3C
sub_8012B3C: @ 0x08012B3C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08012B7C  @ ProcScr_BoomFogFx
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x2c]
	movs r2, #0x10
	ldrsb r2, [r4, r2]
	ldr r3, _08012B80  @ gGameState
	ldrh r1, [r3, #0xc]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x14
	subs r2, r2, r1
	lsls r2, r2, #1
	adds r2, #1
	lsls r2, r2, #3
	str r2, [r0, #0x30]
	movs r2, #0x11
	ldrsb r2, [r4, r2]
	ldrh r1, [r3, #0xe]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x14
	subs r2, r2, r1
	lsls r2, r2, #1
	adds r2, #1
	lsls r2, r2, #3
	str r2, [r0, #0x34]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08012B7C: .4byte ProcScr_BoomFogFx
_08012B80: .4byte gGameState

	THUMB_FUNC_END sub_8012B3C

	THUMB_FUNC_START sub_8012B84
sub_8012B84: @ 0x08012B84
	push {lr}
	ldr r0, _08012B98  @ ProcScr_BoomFogFx
	bl Proc_Find
	cmp r0, #0
	beq _08012B92
	movs r0, #1
_08012B92:
	pop {r1}
	bx r1
	.align 2, 0
_08012B98: .4byte ProcScr_BoomFogFx

	THUMB_FUNC_END sub_8012B84

    .align 2, 0 @ Don't pad with nop.
