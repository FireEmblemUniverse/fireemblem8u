	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	@ Utility functions for "sorting" player units

	THUMB_FUNC_START InitUnitStack
InitUnitStack: @ 0x080316C4
	ldr r2, _080316D4  @ gUnknown_0203A8E4
	ldr r1, _080316D8  @ gUnknown_0203A8E8
	str r0, [r1]
	str r0, [r2]
	ldr r1, _080316DC  @ gUnknown_0203A8EC
	movs r0, #1
	strb r0, [r1]
	bx lr
	.align 2, 0
_080316D4: .4byte gUnknown_0203A8E4
_080316D8: .4byte gUnknown_0203A8E8
_080316DC: .4byte gUnknown_0203A8EC

	THUMB_FUNC_END InitUnitStack

	THUMB_FUNC_START PushUnit
PushUnit: @ 0x080316E0
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r4, _0803170C  @ gUnknown_0203A8E8
	ldr r1, [r4]
	movs r5, #0
	str r5, [r1]
	bl CopyUnit
	ldr r2, [r4]
	ldr r1, _08031710  @ gUnknown_0203A8EC
	ldrb r0, [r1]
	strb r0, [r2, #0xb]
	strb r5, [r6, #0x12]
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldr r0, [r4]
	adds r0, #0x48
	str r0, [r4]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0803170C: .4byte gUnknown_0203A8E8
_08031710: .4byte gUnknown_0203A8EC

	THUMB_FUNC_END PushUnit

	THUMB_FUNC_START LoadPlayerUnitsFromUnitStack
LoadPlayerUnitsFromUnitStack: @ 0x08031714
	push {r4, r5, lr}
	ldr r5, _08031748  @ gUnitArrayBlue
	movs r4, #0x3d
_0803171A:
	adds r0, r5, #0
	bl ClearUnit
	adds r5, #0x48
	subs r4, #1
	cmp r4, #0
	bge _0803171A
	ldr r0, _0803174C  @ gUnknown_0203A8E4
	ldr r0, [r0]
	ldr r1, _08031748  @ gUnitArrayBlue
	ldr r2, _08031750  @ gUnknown_0203A8E8
	ldr r2, [r2]
	subs r2, r2, r0
	lsrs r3, r2, #0x1f
	adds r2, r2, r3
	lsls r2, r2, #0xa
	lsrs r2, r2, #0xb
	bl CpuSet
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08031748: .4byte gUnitArrayBlue
_0803174C: .4byte gUnknown_0203A8E4
_08031750: .4byte gUnknown_0203A8E8

	THUMB_FUNC_END LoadPlayerUnitsFromUnitStack

	THUMB_FUNC_START LoadPlayerUnitsFromUnitStack2
LoadPlayerUnitsFromUnitStack2: @ 0x08031754
	push {r4, r5, lr}
	ldr r5, _08031788  @ gUnitArrayBlue
	movs r4, #0x3d
_0803175A:
	adds r0, r5, #0
	bl ClearUnit
	adds r5, #0x48
	subs r4, #1
	cmp r4, #0
	bge _0803175A
	ldr r0, _0803178C  @ gUnknown_0203A8E4
	ldr r0, [r0]
	ldr r1, _08031788  @ gUnitArrayBlue
	ldr r2, _08031790  @ gUnknown_0203A8E8
	ldr r2, [r2]
	subs r2, r2, r0
	lsrs r3, r2, #0x1f
	adds r2, r2, r3
	lsls r2, r2, #0xa
	lsrs r2, r2, #0xb
	bl CpuSet
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08031788: .4byte gUnitArrayBlue
_0803178C: .4byte gUnknown_0203A8E4
_08031790: .4byte gUnknown_0203A8E8

	THUMB_FUNC_END LoadPlayerUnitsFromUnitStack2

.align 2, 0
