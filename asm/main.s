	.INCLUDE "macro.inc"

	.syntax unified
	.thumb
	
	THUMB_FUNC_START AgbMain
AgbMain: @ 0x08000A20
	push {r4, r5, lr}
	sub sp, #4
	movs r2, #0
	str r2, [sp]
	ldr r1, _08000AE8
	mov r0, sp
	str r0, [r1]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	str r0, [r1, #4]
	ldr r0, _08000AEC
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	str r2, [sp]
	movs r1, #0x80
	lsls r1, r1, #0x12
	ldr r2, _08000AF0
	mov r0, sp
	bl CpuFastSet
	ldr r5, _08000AF4
	ldrh r0, [r5]
	rsbs r4, r0, #0
	orrs r4, r0
	lsrs r4, r4, #0x1f
	adds r0, r4, #0
	bl sub_8001C5C
	cmp r4, #1
	bne _08000A64
	movs r0, #3
	rsbs r0, r0, #0
	bl RegisterRamReset
_08000A64:
	ldr r1, _08000AF8
	adds r0, r1, #0
	strh r0, [r5]
	bl StoreIRQToIRAM
	movs r0, #0
	bl SetInterrupt_LCDVBlank
	ldr r1, _08000AFC
	movs r0, #8
	strh r0, [r1]
	ldr r1, _08000B00
	movs r0, #1
	strh r0, [r1]
	ldr r4, _08000B04
	ldr r0, [r4]
	bl ResetKeyStatus
	ldr r0, [r4]
	bl UpdateKeyStatus
	bl StoreRoutinesToIRAM
	bl sub_80A2C3C
	bl Initialize6CEngine
	bl TCS_ClearAll
	bl ResetMoveunitStructs
	ldr r0, _08000B08
	bl SetOtherRNState
	bl GetOtherRN
	bl sub_8000BC8
	bl sub_8000D0C
	bl sub_80A7374
	bl sub_80A40A8
	bl sub_80D0178
	bl sub_80028D0
	ldr r0, _08000B0C
	bl SetInterrupt_LCDVBlank
	bl sub_80BC81C
	movs r0, #1
	bl SetSomeByte
	bl Font_InitForUIDefault
	bl NewGameControl
_08000ADC:
	bl ExecMainUpdate
	bl sub_8001C78
	b _08000ADC
	.align 2, 0
_08000AE8: .4byte 0x040000D4
_08000AEC: .4byte 0x85001FE0
_08000AF0: .4byte 0x01010000
_08000AF4: .4byte 0x04000204
_08000AF8: .4byte 0x000045B4
_08000AFC: .4byte 0x04000004
_08000B00: .4byte 0x04000208
_08000B04: .4byte 0x0858791C
_08000B08: .4byte 0x42D690E9
_08000B0C: .4byte 0x080152A5

	THUMB_FUNC_START sub_8000B10
sub_8000B10: @ 0x08000B10
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _08000B2C
	bl PrintDebugStringToBG
	subs r4, #0x40
	ldr r1, _08000B30
	adds r0, r4, #0
	bl PrintDebugStringToBG
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08000B2C: .4byte 0x080D74D0
_08000B30: .4byte 0x080D74EC

	THUMB_FUNC_START StoreIRQToIRAM
StoreIRQToIRAM: @ 0x08000B34
	push {r4, lr}
	ldr r0, _08000B60
	ldr r4, _08000B64
	ldr r2, _08000B68
	ldr r3, _08000B6C
	adds r1, r2, #0
	adds r1, #0x34
_08000B42:
	str r3, [r1]
	subs r1, #4
	cmp r1, r2
	bge _08000B42
	movs r2, #0x80
	lsls r2, r2, #2
	adds r1, r4, #0
	bl CpuFastSet
	ldr r0, _08000B70
	str r4, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08000B60: .4byte 0x080000FC
_08000B64: .4byte 0x03004160
_08000B68: .4byte 0x030030F0
_08000B6C: .4byte 0x08000B75
_08000B70: .4byte 0x03007FFC

	THUMB_FUNC_START DummyIRQRoutine
DummyIRQRoutine: @ 0x08000B74
	bx lr
	.byte 0x00, 0x00

	THUMB_FUNC_START SetIRQHandler
SetIRQHandler: @ 0x08000B78
	ldr r2, _08000B84
	lsls r0, r0, #2
	adds r0, r0, r2
	str r1, [r0]
	bx lr
	.align 2, 0
_08000B84: .4byte 0x030030F0


