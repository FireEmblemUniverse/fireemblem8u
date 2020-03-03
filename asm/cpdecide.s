	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	@ Computer/AI Phase (and berserk) action decision proc(s) (I think)

	THUMB_FUNC_START sub_8039AC8
sub_8039AC8: @ 0x08039AC8
	push {lr}
	ldr r0, _08039AE4  @ gActiveUnit
	ldr r0, [r0]
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #0xc0
	ands r0, r1
	cmp r0, #0
	bne _08039AEC
	ldr r1, _08039AE8  @ gActionData
	movs r0, #3
	b _08039AF0
	.align 2, 0
_08039AE4: .4byte gActiveUnit
_08039AE8: .4byte gActionData
_08039AEC:
	ldr r1, _08039AFC  @ gActionData
	movs r0, #2
_08039AF0:
	strb r0, [r1, #0x16]
	movs r0, #3
	bl SaveSuspendedGame
	pop {r0}
	bx r0
	.align 2, 0
_08039AFC: .4byte gActionData

	THUMB_FUNC_START Call6C_E_CPDECIDE
Call6C_E_CPDECIDE: @ 0x08039B00
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
_08039B04:
	ldr r4, _08039B48  @ gAiState
	adds r0, r4, #0
	adds r0, #0x79
	movs r1, #0
	strb r1, [r0]
	ldr r2, [r4, #0x74]
	ldrb r0, [r2]
	cmp r0, #0
	beq _08039BF4
	adds r0, r4, #0
	adds r0, #0x7c
	strb r1, [r0]
	ldr r1, _08039B4C  @ gActiveUnitId
	ldrb r0, [r2]
	strb r0, [r1]
	ldrb r0, [r1]
	bl GetUnit
	adds r1, r0, #0
	ldr r6, _08039B50  @ gActiveUnit
	str r1, [r6]
	ldr r5, [r1, #0xc]
	movs r0, #6
	ands r5, r0
	cmp r5, #0
	bne _08039B3E
	ldr r0, [r1]
	cmp r0, #0
	bne _08039B54
_08039B3E:
	ldr r0, [r4, #0x74]
	adds r0, #1
	str r0, [r4, #0x74]
	b _08039B04
	.align 2, 0
_08039B48: .4byte gAiState
_08039B4C: .4byte gActiveUnitId
_08039B50: .4byte gActiveUnit
_08039B54:
	bl RefreshEntityBmMaps
	bl RenderBmMap
	bl SMS_UpdateFromGameData
	ldr r0, [r6]
	bl sub_8041090
	ldr r0, [r6]
	adds r0, #0x40
	ldrh r1, [r0]
	movs r0, #0xf8
	ands r0, r1
	lsrs r0, r0, #3
	adds r1, r4, #0
	adds r1, #0x7d
	strb r0, [r1]
	adds r0, r4, #0
	adds r0, #0x7a
	strb r5, [r0]
	bl sub_803E2F4
	bl ClearSomeAIRelatedStruct
	ldr r0, _08039BD0  @ gCpDecideMainFunc
	ldr r0, [r0]
	bl _call_via_r0
	ldr r2, [r6]
	ldr r0, [r2, #0xc]
	movs r1, #0x80
	lsls r1, r1, #3
	orrs r0, r1
	str r0, [r2, #0xc]
	ldr r1, _08039BD4  @ gUnknown_0203AA94
	movs r0, #0xa
	ldrsb r0, [r1, r0]
	cmp r0, #0
	beq _08039BBE
	movs r0, #0x10
	ldrsb r0, [r2, r0]
	ldrb r3, [r1, #2]
	cmp r0, r3
	bne _08039BD8
	movs r0, #0x11
	ldrsb r0, [r2, r0]
	ldrb r2, [r1, #3]
	cmp r0, r2
	bne _08039BD8
	ldrb r0, [r1]
	cmp r0, #0
	bne _08039BD8
_08039BBE:
	ldr r0, [r4, #0x74]
	adds r0, #1
	str r0, [r4, #0x74]
	adds r0, r7, #0
	movs r1, #0
	bl Proc_GotoLabel
	b _08039BFA
	.align 2, 0
_08039BD0: .4byte gCpDecideMainFunc
_08039BD4: .4byte gUnknown_0203AA94
_08039BD8:
	ldr r0, _08039BEC  @ gAiState
	ldr r1, [r0, #0x74]
	adds r1, #1
	str r1, [r0, #0x74]
	ldr r0, _08039BF0  @ gUnknown_085A8024
	adds r1, r7, #0
	bl Proc_CreateBlockingChild
	b _08039BFA
	.align 2, 0
_08039BEC: .4byte gAiState
_08039BF0: .4byte gUnknown_085A8024
_08039BF4:
	adds r0, r7, #0
	bl Proc_Delete
_08039BFA:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_START ClearSomeAIRelatedStruct
ClearSomeAIRelatedStruct: @ 0x08039C00
	ldr r1, _08039C1C  @ gUnknown_0203AA94
	movs r0, #0
	strb r0, [r1]
	strb r0, [r1, #1]
	strb r0, [r1, #2]
	strb r0, [r1, #3]
	strb r0, [r1, #4]
	strb r0, [r1, #5]
	strb r0, [r1, #6]
	strb r0, [r1, #7]
	strb r0, [r1, #8]
	strb r0, [r1, #9]
	strb r0, [r1, #0xa]
	bx lr
	.align 2, 0
_08039C1C: .4byte gUnknown_0203AA94

	THUMB_FUNC_START sub_8039C20
sub_8039C20: @ 0x08039C20
	push {r4, r5, r6, lr}
	mov r6, r9
	mov r5, r8
	push {r5, r6}
	ldr r6, [sp, #0x18]
	ldr r4, [sp, #0x1c]
	mov r8, r4
	ldr r4, [sp, #0x20]
	mov r9, r4
	ldr r4, _08039C5C  @ gUnknown_0203AA94
	ldr r5, _08039C60  @ gActiveUnitId
	ldrb r5, [r5]
	strb r5, [r4, #1]
	strb r0, [r4, #2]
	strb r1, [r4, #3]
	strb r2, [r4]
	strb r3, [r4, #6]
	strb r6, [r4, #7]
	mov r0, r8
	strb r0, [r4, #8]
	mov r0, r9
	strb r0, [r4, #9]
	movs r0, #1
	strb r0, [r4, #0xa]
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08039C5C: .4byte gUnknown_0203AA94
_08039C60: .4byte gActiveUnitId

	THUMB_FUNC_START sub_8039C64
sub_8039C64: @ 0x08039C64
	push {r4, r5, lr}
	ldr r4, [sp, #0xc]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r5, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r1, _08039CA8  @ gUnknown_0203AA94
	cmp r0, #0xff
	beq _08039C84
	strb r0, [r1]
_08039C84:
	cmp r5, #0xff
	beq _08039C8A
	strb r5, [r1, #6]
_08039C8A:
	cmp r2, #0xff
	beq _08039C90
	strb r2, [r1, #7]
_08039C90:
	cmp r3, #0xff
	beq _08039C96
	strb r3, [r1, #8]
_08039C96:
	cmp r4, #0xff
	beq _08039C9C
	strb r4, [r1, #9]
_08039C9C:
	movs r0, #1
	strb r0, [r1, #0xa]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08039CA8: .4byte gUnknown_0203AA94

	THUMB_FUNC_START sub_8039CAC
sub_8039CAC: @ 0x08039CAC
	push {r4, r5, lr}
	ldr r2, _08039D04  @ gUnknown_085A7F9C
	ldr r0, _08039D08  @ gAiState
	adds r1, r0, #0
	adds r1, #0x79
	ldrb r0, [r1]
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r0, [r0]
	cmp r0, #0
	beq _08039CFC
	ldr r0, _08039D0C  @ gUnknown_0203AA94
	ldrb r0, [r0, #0xa]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _08039CFC
	adds r5, r2, #0
	adds r4, r1, #0
_08039CD2:
	ldrb r0, [r4]
	adds r1, r0, #1
	strb r1, [r4]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x16
	adds r0, r0, r5
	ldr r0, [r0]
	bl _call_via_r0
	ldrb r0, [r4]
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r0, [r0]
	cmp r0, #0
	beq _08039CFC
	ldr r0, _08039D0C  @ gUnknown_0203AA94
	ldrb r0, [r0, #0xa]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _08039CD2
_08039CFC:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08039D04: .4byte gUnknown_085A7F9C
_08039D08: .4byte gAiState
_08039D0C: .4byte gUnknown_0203AA94

	THUMB_FUNC_START sub_8039D10
sub_8039D10: @ 0x08039D10
	push {r4, lr}
	sub sp, #8
	ldr r0, _08039D5C  @ gAiState
	adds r0, #0x7b
	ldrb r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	bne _08039DBC
	ldr r4, _08039D60  @ gActiveUnit
	ldr r0, [r4]
	bl UpdateUnitHealingAIStatus
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _08039DA0
	bl sub_803E718
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq _08039DBC
	ldr r0, [r4]
	ldrb r1, [r0, #0xa]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _08039D64
	bl sub_803E7D0
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _08039D64
	bl sub_803ECC4
	b _08039DBC
	.align 2, 0
_08039D5C: .4byte gAiState
_08039D60: .4byte gActiveUnit
_08039D64:
	add r4, sp, #4
	adds r0, r4, #0
	bl sub_803E470
	lsls r0, r0, #0x18
	asrs r2, r0, #0x18
	cmp r2, #1
	bne _08039DBC
	add r0, sp, #4
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r3, #2
	ldrsh r1, [r4, r3]
	str r2, [sp]
	movs r2, #0
	movs r3, #0
	bl sub_803BA08
	ldr r0, _08039D9C  @ gUnknown_0203AA94
	ldrb r0, [r0, #0xa]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _08039DBC
	bl sub_803ECF0
	b _08039DBC
	.align 2, 0
_08039D9C: .4byte gUnknown_0203AA94
_08039DA0:
	ldr r0, [r4]
	ldrb r1, [r0, #0xa]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _08039DBC
	bl sub_803E7D0
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _08039DBC
	bl sub_803ECC4
_08039DBC:
	add sp, #8
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_START sub_8039DC4
sub_8039DC4: @ 0x08039DC4
	push {lr}
	ldr r0, _08039DDC  @ gAiState
	adds r0, #0x7b
	ldrb r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	bne _08039DD8
	bl sub_8040844
_08039DD8:
	pop {r0}
	bx r0
	.align 2, 0
_08039DDC: .4byte gAiState

	THUMB_FUNC_START sub_8039DE0
sub_8039DE0: @ 0x08039DE0
	push {r4, lr}
	movs r4, #0
	ldr r0, _08039E08  @ gActiveUnit
	ldr r0, [r0]
	ldr r0, [r0, #4]
	ldrb r0, [r0, #4]
	cmp r0, #0x62
	beq _08039E26
	cmp r0, #0x34
	beq _08039E26
	ldr r0, _08039E0C  @ gAiState
	adds r0, #0x7b
	ldrb r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _08039E10
	bl sub_803D3E4
	b _08039E26
	.align 2, 0
_08039E08: .4byte gActiveUnit
_08039E0C: .4byte gAiState
_08039E10:
	bl sub_803C4BC
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq _08039E26
	adds r4, #1
	cmp r4, #0xff
	ble _08039E10
	bl sub_803C510
_08039E26:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_START sub_8039E2C
sub_8039E2C: @ 0x08039E2C
	push {r4, lr}
	movs r4, #0
	ldr r0, _08039E64  @ gActiveUnit
	ldr r2, [r0]
	ldr r0, [r2, #0xc]
	movs r1, #0x80
	lsls r1, r1, #4
	ands r0, r1
	cmp r0, #0
	beq _08039E50
	movs r0, #0x10
	ldrsb r0, [r2, r0]
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	bl sub_803795C
	cmp r0, #0
	bne _08039E82
_08039E50:
	ldr r0, _08039E68  @ gAiState
	adds r0, #0x7b
	ldrb r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _08039E6C
	bl sub_803D404
	b _08039E82
	.align 2, 0
_08039E64: .4byte gActiveUnit
_08039E68: .4byte gAiState
_08039E6C:
	bl sub_803C54C
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq _08039E82
	adds r4, #1
	cmp r4, #0xff
	ble _08039E6C
	bl sub_803C5A0
_08039E82:
	pop {r4}
	pop {r0}
	bx r0

.align 2, 0
