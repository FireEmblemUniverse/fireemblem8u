	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	THUMB_FUNC_START ChangeActiveUnitFacing
ChangeActiveUnitFacing: @ 0x0801F50C
	push {lr}
	adds r2, r0, #0
	adds r3, r1, #0
	ldr r0, _0801F538  @ gActiveUnit
	ldr r1, [r0]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	ldrb r1, [r1, #0x11]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl GetFacingDirection
	adds r0, #5
	ldr r1, _0801F53C  @ gWorkingMovementScript
	strb r0, [r1]
	movs r0, #4
	strb r0, [r1, #1]
	adds r0, r1, #0
	bl MU_StartMoveScript_Auto
	pop {r0}
	bx r0
	.align 2, 0
_0801F538: .4byte gActiveUnit
_0801F53C: .4byte gWorkingMovementScript

	THUMB_FUNC_END ChangeActiveUnitFacing

.align 2, 0