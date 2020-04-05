	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	@ "MuCtr" proc and related functions
	@ Handles REDA Interpretation

	THUMB_FUNC_START CopyEventMoveToBuffer
CopyEventMoveToBuffer: @ 0x08079CD8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r7, r0, #0
	lsls r1, r1, #0x18
	lsrs r2, r1, #0x18
	movs r4, #0
	ldr r6, _08079D28  @ gUnknown_03001A30
	movs r1, #1
	mov ip, r1
	adds r3, r6, #4
	mov r8, r3
_08079CF0:
	ldrb r1, [r6]
	asrs r1, r4
	mov r3, ip
	ands r1, r3
	cmp r1, #0
	bne _08079D2C
	lsls r0, r4, #7
	mov r1, r8
	adds r3, r0, r1
	adds r5, r0, #0
	cmp r2, #0
	beq _08079D16
_08079D08:
	ldm r7!, {r0, r1}
	stm r3!, {r0, r1}
	subs r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0
	bne _08079D08
_08079D16:
	mov r0, ip
	lsls r0, r4
	ldrb r1, [r6]
	orrs r0, r1
	strb r0, [r6]
	mov r3, r8
	adds r0, r5, r3
	b _08079D36
	.align 2, 0
_08079D28: .4byte gUnknown_03001A30
_08079D2C:
	adds r1, r4, #1
	lsls r1, r1, #0x18
	lsrs r4, r1, #0x18
	cmp r4, #3
	bls _08079CF0
_08079D36:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END CopyEventMoveToBuffer

	THUMB_FUNC_START ClearEventMoveBuffer
ClearEventMoveBuffer: @ 0x08079D40
	push {r4, r5, lr}
	adds r1, r0, #0
	movs r2, #0
	ldr r3, _08079D60  @ gUnknown_03001A34
	subs r4, r3, #4
	movs r5, #1
_08079D4C:
	lsls r0, r2, #7
	adds r0, r0, r3
	cmp r0, r1
	bne _08079D64
	adds r1, r5, #0
	lsls r1, r2
	ldrb r0, [r4]
	bics r0, r1
	strb r0, [r4]
	b _08079D6E
	.align 2, 0
_08079D60: .4byte gUnknown_03001A34
_08079D64:
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #3
	bls _08079D4C
_08079D6E:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END ClearEventMoveBuffer

	THUMB_FUNC_START sub_8079D74
sub_8079D74: @ 0x08079D74
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	mov r8, r0
	adds r4, r1, #0
	lsls r2, r2, #0x10
	lsrs r6, r2, #0x10
	lsls r3, r3, #0x10
	lsrs r7, r3, #0x10
	ldr r0, _08079DAC  @ gUnknown_089A2DB0
	movs r1, #5
	bl Proc_Start
	adds r5, r0, #0
	lsls r0, r6, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0
	beq _08079DB0
	cmp r0, #1
	beq _08079DB4
	lsls r1, r6, #0x18
	lsrs r1, r1, #0x18
	adds r0, r4, #0
	bl CopyEventMoveToBuffer
	adds r4, r0, #0
	b _08079DC0
	.align 2, 0
_08079DAC: .4byte gUnknown_089A2DB0
_08079DB0:
	movs r4, #0
	b _08079DC0
_08079DB4:
	ldr r0, [r4]
	ldr r1, [r4, #4]
	str r0, [r5, #0x44]
	str r1, [r5, #0x48]
	adds r4, r5, #0
	adds r4, #0x44
_08079DC0:
	lsls r3, r6, #0x10
	asrs r3, r3, #0x10
	str r7, [sp]
	adds r0, r5, #0
	mov r1, r8
	adds r2, r4, #0
	bl MuCtr_SetupWithEventMoveBuffer
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8079D74

	THUMB_FUNC_START sub_8079DDC
sub_8079DDC: @ 0x08079DDC
	push {r4, r5, r6, lr}
	mov r6, r9
	mov r5, r8
	push {r5, r6}
	sub sp, #4
	mov r9, r0
	adds r4, r1, #0
	adds r5, r2, #0
	adds r6, r3, #0
	ldr r0, [sp, #0x1c]
	mov r8, r0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	mov r1, r8
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov r8, r1
	ldr r0, _08079E6C  @ gUnknown_089A2DB0
	movs r1, #5
	bl Proc_Start
	adds r2, r0, #0
	adds r2, #0x44
	lsls r4, r4, #0x18
	asrs r4, r4, #0x18
	movs r1, #0x3f
	ands r4, r1
	ldrb r3, [r2]
	movs r1, #0x40
	negs r1, r1
	ands r1, r3
	orrs r1, r4
	strb r1, [r2]
	lsls r5, r5, #0x18
	asrs r5, r5, #0x18
	movs r1, #0x3f
	ands r5, r1
	lsls r5, r5, #6
	ldrh r3, [r2]
	ldr r1, _08079E70  @ 0xFFFFF03F
	ands r1, r3
	orrs r1, r5
	strh r1, [r2]
	movs r1, #0x3f
	ands r6, r1
	lsls r6, r6, #0xc
	ldr r1, [r0, #0x44]
	ldr r3, _08079E74  @ 0xFFFC0FFF
	ands r1, r3
	orrs r1, r6
	str r1, [r0, #0x44]
	movs r1, #0
	strb r1, [r2, #3]
	strh r1, [r2, #4]
	strh r1, [r2, #6]
	mov r1, r8
	str r1, [sp]
	mov r1, r9
	movs r3, #1
	bl MuCtr_SetupWithEventMoveBuffer
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08079E6C: .4byte gUnknown_089A2DB0
_08079E70: .4byte 0xFFFFF03F
_08079E74: .4byte 0xFFFC0FFF

	THUMB_FUNC_END sub_8079DDC

	THUMB_FUNC_START MuCtr_SetupWithEventMoveBuffer
MuCtr_SetupWithEventMoveBuffer: @ 0x08079E78
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	mov r8, r0
	adds r7, r1, #0
	adds r5, r2, #0
	ldr r4, [sp, #0x28]
	lsls r3, r3, #0x10
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	ldrb r0, [r7, #0x10]
	str r0, [sp, #4]
	ldrb r0, [r7, #0x11]
	mov sl, r0
	lsrs r0, r3, #0x10
	mov r9, r0
	asrs r3, r3, #0xd
	adds r3, r3, r5
	subs r3, #8
	ldrb r1, [r3]
	lsls r1, r1, #0x1a
	ldrh r0, [r3]
	lsls r0, r0, #0x14
	lsrs r0, r0, #0x1a
	lsls r0, r0, #0x10
	lsrs r1, r1, #0x1a
	orrs r1, r0
	str r1, [sp]
	mov r6, sp
	adds r0, r7, #0
	mov r1, sp
	adds r2, r4, #0
	bl GetAdjustedPositionForNewUnit
	mov r1, r8
	str r7, [r1, #0x2c]
	adds r0, r7, #0
	bl MU_Create
	mov r2, r8
	str r0, [r2, #0x30]
	str r5, [r2, #0x34]
	movs r0, #0
	mov r3, r9
	strh r3, [r2, #0x38]
	strh r0, [r2, #0x3a]
	ldrh r0, [r5, #6]
	strh r0, [r2, #0x3c]
	strh r4, [r2, #0x3e]
	mov r0, sp
	ldrh r1, [r0]
	mov r0, r8
	adds r0, #0x40
	strb r1, [r0]
	ldrh r0, [r6, #2]
	mov r1, r8
	adds r1, #0x41
	strb r0, [r1]
	mov r0, r8
	adds r0, #0x42
	mov r1, sp
	ldrb r1, [r1, #4]
	strb r1, [r0]
	adds r0, #1
	mov r2, sl
	strb r2, [r0]
	adds r0, r7, #0
	bl HideUnitSMS
	ldr r0, [r7, #0xc]
	movs r1, #1
	orrs r0, r1
	str r0, [r7, #0xc]
	movs r0, #0x11
	ldrsb r0, [r7, r0]
	ldr r1, _08079F7C  @ gBmMapUnit
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r1, #0x10
	ldrsb r1, [r7, r1]
	ldr r0, [r0]
	adds r1, r0, r1
	ldrb r0, [r1]
	ldrb r3, [r7, #0xb]
	cmp r0, r3
	bne _08079F30
	movs r0, #0
	strb r0, [r1]
_08079F30:
	mov r1, sl
	lsls r0, r1, #0x18
	ldr r2, _08079F80  @ gBmMapUnk
	ldr r1, [r2]
	asrs r0, r0, #0x16
	adds r0, r0, r1
	ldr r3, [sp, #4]
	lsls r1, r3, #0x18
	asrs r1, r1, #0x18
	ldr r0, [r0]
	adds r0, r0, r1
	movs r1, #0
	strb r1, [r0]
	movs r3, #2
	ldrsh r0, [r6, r3]
	ldr r1, [r2]
	lsls r0, r0, #2
	adds r0, r0, r1
	mov r1, sp
	movs r2, #0
	ldrsh r1, [r1, r2]
	ldr r0, [r0]
	adds r0, r0, r1
	ldr r1, [r7]
	ldrb r1, [r1, #4]
	strb r1, [r0]
	mov r3, r8
	ldr r0, [r3, #0x30]
	bl MU_Hide
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08079F7C: .4byte gBmMapUnit
_08079F80: .4byte gBmMapUnk

	THUMB_FUNC_END MuCtr_SetupWithEventMoveBuffer

	THUMB_FUNC_START MuCtrExists
MuCtrExists: @ 0x08079F84
	push {lr}
	ldr r0, _08079F98  @ gUnknown_089A2DB0
	bl Proc_Find
	cmp r0, #0
	beq _08079F92
	movs r0, #1
_08079F92:
	pop {r1}
	bx r1
	.align 2, 0
_08079F98: .4byte gUnknown_089A2DB0

	THUMB_FUNC_END MuCtrExists

	THUMB_FUNC_START SetAllMOVEUNITField44To1_
SetAllMOVEUNITField44To1_: @ 0x08079F9C
	push {lr}
	bl MU_AllForceSetMaxMoveSpeed
	pop {r0}
	bx r0

	THUMB_FUNC_END SetAllMOVEUNITField44To1_

	THUMB_FUNC_START sub_8079FA8
sub_8079FA8: @ 0x08079FA8
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	lsls r2, r2, #0x10
	asrs r2, r2, #0xd
	subs r2, #8
	adds r1, r1, r2
	ldrb r2, [r1]
	lsls r2, r2, #0x1a
	ldrh r0, [r1]
	lsls r0, r0, #0x14
	lsrs r0, r0, #0x1a
	lsls r0, r0, #0x10
	lsrs r2, r2, #0x1a
	orrs r2, r0
	str r2, [sp]
	mov r0, sp
	ldrb r0, [r0]
	strb r0, [r5, #0x10]
	asrs r2, r2, #0x10
	strb r2, [r5, #0x11]
	mov r4, sp
	adds r0, r5, #0
	mov r1, sp
	adds r2, r3, #0
	bl GetAdjustedPositionForNewUnit
	mov r0, sp
	ldrh r0, [r0]
	strb r0, [r5, #0x10]
	ldrh r0, [r4, #2]
	strb r0, [r5, #0x11]
	adds r0, r5, #0
	bl UnitFinalizeMovement
	ldr r1, [r5, #0xc]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0807A00C
	movs r0, #2
	negs r0, r0
	ands r1, r0
	str r1, [r5, #0xc]
	bl RefreshEntityBmMaps
	bl SMS_UpdateFromGameData
_0807A00C:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8079FA8

	THUMB_FUNC_START MoveUnit_
MoveUnit_: @ 0x0807A014
	push {r4, r5, r6, lr}
	sub sp, #8
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	movs r6, #0x3f
	ands r1, r6
	movs r5, #0x40
	negs r5, r5
	ldr r4, [sp]
	ands r4, r5
	orrs r4, r1
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	ands r2, r6
	lsls r2, r2, #6
	ldr r1, _0807A050  @ 0xFFFFF03F
	ands r4, r1
	orrs r4, r2
	str r4, [sp]
	mov r1, sp
	movs r2, #1
	bl sub_8079FA8
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807A050: .4byte 0xFFFFF03F

	THUMB_FUNC_END MoveUnit_

	THUMB_FUNC_START GetPreferredPositionForUNIT
GetPreferredPositionForUNIT: @ 0x0807A054
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r6, r1, #0
	adds r7, r2, #0
	lsls r3, r3, #0x18
	lsrs r1, r3, #0x18
	ldrb r0, [r4, #7]
	cmp r0, #0
	beq _0807A0CC
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	negs r0, r1
	orrs r0, r1
	lsrs r5, r0, #0x1f
	ldrb r1, [r4, #5]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0807A080
	movs r0, #2
	orrs r5, r0
_0807A080:
	ldrb r0, [r4]
	bl GetUnit
	ldrb r1, [r4, #7]
	lsls r1, r1, #3
	subs r1, #8
	ldr r3, [r4, #8]
	adds r3, r3, r1
	ldrb r1, [r3]
	lsls r1, r1, #0x1a
	lsrs r1, r1, #0x1a
	ldr r4, _0807A0C4  @ 0xFFFF0000
	ldr r2, [sp]
	ands r2, r4
	orrs r2, r1
	str r2, [sp]
	ldrh r1, [r3]
	lsls r1, r1, #0x14
	lsrs r1, r1, #0x1a
	lsls r1, r1, #0x10
	ldr r3, _0807A0C8  @ 0x0000FFFF
	ands r2, r3
	orrs r2, r1
	str r2, [sp]
	mov r4, sp
	mov r1, sp
	adds r2, r5, #0
	bl GetAdjustedPositionForNewUnit
	mov r0, sp
	ldrh r0, [r0]
	strb r0, [r6]
	ldrh r0, [r4, #2]
	b _0807A0DA
	.align 2, 0
_0807A0C4: .4byte 0xFFFF0000
_0807A0C8: .4byte 0x0000FFFF
_0807A0CC:
	ldrb r0, [r4, #4]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1a
	strb r0, [r6]
	ldrh r0, [r4, #4]
	lsls r0, r0, #0x14
	lsrs r0, r0, #0x1a
_0807A0DA:
	strb r0, [r7]
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END GetPreferredPositionForUNIT

	THUMB_FUNC_START sub_807A0E4
sub_807A0E4: @ 0x0807A0E4
	push {r4, r5, lr}
	adds r5, r0, #0
	ldrh r0, [r5, #0x3a]
	lsls r0, r0, #3
	ldr r1, [r5, #0x34]
	adds r4, r1, r0
	bl MU_SortObjLayers
	ldr r0, [r5, #0x30]
	adds r0, #0x44
	ldrb r0, [r0]
	cmp r0, #0
	beq _0807A10A
	adds r0, r5, #0
	movs r1, #1
	bl Proc_Goto
	movs r0, #0
	b _0807A188
_0807A10A:
	ldrb r0, [r4, #3]
	ldrh r1, [r4, #4]
	bl sub_807A294
	lsls r0, r0, #0x18
	asrs r2, r0, #0x18
	cmp r2, #1
	bne _0807A14C
	ldr r0, _0807A130  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #4]
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	beq _0807A134
	ldrh r0, [r5, #0x3c]
	subs r0, #4
	b _0807A138
	.align 2, 0
_0807A130: .4byte gKeyStatusPtr
_0807A134:
	ldrh r0, [r5, #0x3c]
	subs r0, #1
_0807A138:
	strh r0, [r5, #0x3c]
	movs r1, #0x3c
	ldrsh r0, [r5, r1]
	cmp r0, #0
	bgt _0807A14C
	adds r0, r5, #0
	bl sub_807A358
	movs r0, #0
	b _0807A188
_0807A14C:
	ldrh r0, [r5, #0x3a]
	cmp r0, #0
	beq _0807A186
	ldr r4, [r5, #0x2c]
	adds r0, r4, #0
	bl ShowUnitSMS
	ldr r0, [r4, #0xc]
	movs r1, #2
	negs r1, r1
	ands r0, r1
	str r0, [r4, #0xc]
	ldr r0, [r5, #0x30]
	bl MU_Hide
	movs r0, #0x11
	ldrsb r0, [r4, r0]
	ldr r1, _0807A190  @ gBmMapUnit
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r1, #0x10
	ldrsb r1, [r4, r1]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r1, [r4, #0xb]
	strb r1, [r0]
	bl SMS_UpdateFromGameData
_0807A186:
	movs r0, #1
_0807A188:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0807A190: .4byte gBmMapUnit

	THUMB_FUNC_END sub_807A0E4

	THUMB_FUNC_START sub_807A194
sub_807A194: @ 0x0807A194
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r5, [r4, #0x30]
	bl MU_SortObjLayers
	adds r0, r5, #0
	bl MU_IsActive
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0807A1F2
	ldr r1, [r4, #0x2c]
	adds r0, r4, #0
	adds r0, #0x42
	ldrb r0, [r0]
	strb r0, [r1, #0x10]
	adds r0, r4, #0
	adds r0, #0x43
	ldrb r0, [r0]
	strb r0, [r1, #0x11]
	ldrh r0, [r4, #0x3a]
	adds r0, #1
	strh r0, [r4, #0x3a]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r1, [r4, #0x38]
	cmp r0, r1
	bcs _0807A1E6
	adds r0, r5, #0
	adds r0, #0x44
	ldrb r0, [r0]
	cmp r0, #0
	bne _0807A1E6
	ldrh r0, [r4, #0x3a]
	ldr r1, [r4, #0x34]
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r0, [r0, #6]
	strh r0, [r4, #0x3c]
	movs r0, #0
	b _0807A1F4
_0807A1E6:
	adds r0, r4, #0
	movs r1, #1
	bl Proc_Goto
	movs r0, #0
	b _0807A1F4
_0807A1F2:
	movs r0, #1
_0807A1F4:
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_807A194

	THUMB_FUNC_START sub_807A1FC
sub_807A1FC: @ 0x0807A1FC
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r6, [r5, #0x30]
	ldr r4, [r5, #0x2c]
	adds r0, r6, #0
	adds r0, #0x44
	ldrb r0, [r0]
	cmp r0, #0
	beq _0807A234
	ldrh r0, [r5, #0x38]
	cmp r0, #0
	beq _0807A234
	adds r0, r5, #0
	adds r0, #0x40
	movs r1, #0
	ldrsb r1, [r0, r1]
	adds r0, #1
	movs r2, #0
	ldrsb r2, [r0, r2]
	ldrh r0, [r5, #0x3e]
	ldr r3, _0807A230  @ 0x0000FFFE
	ands r3, r0
	adds r0, r4, #0
	bl MoveUnit_
	b _0807A27A
	.align 2, 0
_0807A230: .4byte 0x0000FFFE
_0807A234:
	adds r0, r5, #0
	adds r0, #0x40
	ldrb r0, [r0]
	strb r0, [r4, #0x10]
	adds r0, r5, #0
	adds r0, #0x41
	ldrb r0, [r0]
	strb r0, [r4, #0x11]
	adds r0, r4, #0
	bl UnitFinalizeMovement
	adds r0, r4, #0
	bl ShowUnitSMS
	ldr r0, [r4, #0xc]
	movs r1, #2
	negs r1, r1
	ands r0, r1
	str r0, [r4, #0xc]
	movs r0, #0x11
	ldrsb r0, [r4, r0]
	ldr r1, _0807A290  @ gBmMapUnit
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r1, #0x10
	ldrsb r1, [r4, r1]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r1, [r4, #0xb]
	strb r1, [r0]
	bl RefreshEntityBmMaps
	bl SMS_UpdateFromGameData
_0807A27A:
	adds r0, r6, #0
	bl MU_End
	bl MU_SortObjLayers
	ldr r0, [r5, #0x34]
	bl ClearEventMoveBuffer
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807A290: .4byte gBmMapUnit

	THUMB_FUNC_END sub_807A1FC

	THUMB_FUNC_START sub_807A294
sub_807A294: @ 0x0807A294
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	lsls r1, r1, #0x10
	lsrs r5, r1, #0x10
	cmp r2, #0
	bne _0807A2A6
	movs r0, #1
	b _0807A2DE
_0807A2A6:
	ldr r0, _0807A2E4  @ gUnknown_03001C35
	strb r2, [r0]
	ldr r4, _0807A2E8  @ gUnknown_03001C34
	movs r0, #1
	strb r0, [r4]
	ldr r6, _0807A2EC  @ gUnknown_089A2DB0
	ldr r1, _0807A2F0  @ sub_807A300
	adds r0, r6, #0
	bl Proc_ForEach
	movs r1, #0
	ldrsb r1, [r4, r1]
	cmp r1, #0
	bne _0807A2D6
	ldr r0, _0807A2F4  @ 0x0000FFFF
	cmp r5, r0
	beq _0807A2D6
	ldr r0, _0807A2F8  @ gUnknown_03001C36
	strh r5, [r0]
	strb r1, [r4]
	ldr r1, _0807A2FC  @ sub_807A324
	adds r0, r6, #0
	bl Proc_ForEach
_0807A2D6:
	ldr r0, _0807A2E8  @ gUnknown_03001C34
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
_0807A2DE:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0807A2E4: .4byte gUnknown_03001C35
_0807A2E8: .4byte gUnknown_03001C34
_0807A2EC: .4byte gUnknown_089A2DB0
_0807A2F0: .4byte sub_807A300
_0807A2F4: .4byte 0x0000FFFF
_0807A2F8: .4byte gUnknown_03001C36
_0807A2FC: .4byte sub_807A324

	THUMB_FUNC_END sub_807A294

	THUMB_FUNC_START sub_807A300
sub_807A300: @ 0x0807A300
	push {lr}
	ldr r0, [r0, #0x2c]
	ldr r0, [r0]
	ldr r1, _0807A31C  @ gUnknown_03001C35
	ldrb r0, [r0, #4]
	ldrb r1, [r1]
	cmp r0, r1
	bne _0807A316
	ldr r1, _0807A320  @ gUnknown_03001C34
	movs r0, #0
	strb r0, [r1]
_0807A316:
	pop {r0}
	bx r0
	.align 2, 0
_0807A31C: .4byte gUnknown_03001C35
_0807A320: .4byte gUnknown_03001C34

	THUMB_FUNC_END sub_807A300

	THUMB_FUNC_START sub_807A324
sub_807A324: @ 0x0807A324
	push {lr}
	adds r2, r0, #0
	ldr r0, [r2, #0x2c]
	ldr r0, [r0]
	ldr r1, _0807A34C  @ gUnknown_03001C35
	ldrb r0, [r0, #4]
	ldrb r1, [r1]
	cmp r0, r1
	bne _0807A346
	ldr r0, _0807A350  @ gUnknown_03001C36
	ldrh r0, [r0]
	ldrh r2, [r2, #0x3a]
	cmp r0, r2
	bcs _0807A346
	ldr r1, _0807A354  @ gUnknown_03001C34
	movs r0, #1
	strb r0, [r1]
_0807A346:
	pop {r0}
	bx r0
	.align 2, 0
_0807A34C: .4byte gUnknown_03001C35
_0807A350: .4byte gUnknown_03001C36
_0807A354: .4byte gUnknown_03001C34

	THUMB_FUNC_END sub_807A324

	THUMB_FUNC_START sub_807A358
sub_807A358: @ 0x0807A358
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r4, r0, #0
	ldr r6, [r4, #0x2c]
	ldrh r0, [r4, #0x3a]
	lsls r0, r0, #3
	ldr r1, [r4, #0x34]
	adds r7, r1, r0
	ldrh r5, [r4, #0x3e]
	movs r0, #0x41
	adds r0, r0, r4
	mov ip, r0
	movs r1, #0
	ldrsb r1, [r0, r1]
	ldr r0, _0807A3C0  @ gBmMapUnk
	ldr r0, [r0]
	lsls r1, r1, #2
	adds r1, r1, r0
	adds r3, r4, #0
	adds r3, #0x40
	movs r2, #0
	ldrsb r2, [r3, r2]
	ldr r0, [r1]
	adds r0, r0, r2
	movs r1, #0
	strb r1, [r0]
	ldrh r1, [r4, #0x3a]
	ldrh r0, [r4, #0x38]
	subs r0, #1
	cmp r1, r0
	bge _0807A3CC
	ldrb r0, [r7]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1a
	ldr r2, _0807A3C4  @ 0xFFFF0000
	ldr r1, [sp]
	ands r1, r2
	orrs r1, r0
	str r1, [sp]
	ldrh r0, [r7]
	lsls r0, r0, #0x14
	lsrs r0, r0, #0x1a
	lsls r0, r0, #0x10
	ldr r2, _0807A3C8  @ 0x0000FFFF
	ands r1, r2
	orrs r1, r0
	str r1, [sp]
	b _0807A3E8
	.align 2, 0
_0807A3C0: .4byte gBmMapUnk
_0807A3C4: .4byte 0xFFFF0000
_0807A3C8: .4byte 0x0000FFFF
_0807A3CC:
	movs r0, #0
	ldrsb r0, [r3, r0]
	lsls r0, r0, #0x10
	mov r2, ip
	movs r1, #0
	ldrsb r1, [r2, r1]
	lsls r1, r1, #0x10
	lsrs r0, r0, #0x10
	orrs r0, r1
	str r0, [sp]
	movs r0, #2
	ands r0, r5
	cmp r0, #0
	beq _0807A3EC
_0807A3E8:
	ldr r0, _0807A484  @ 0x0000FFFE
	ands r5, r0
_0807A3EC:
	mov r8, sp
	movs r0, #1
	adds r2, r5, #0
	ands r2, r0
	adds r0, r6, #0
	mov r1, sp
	bl sub_807A644
	mov r9, r0
	adds r0, r4, #0
	adds r0, #0x41
	movs r1, #0
	ldrsb r1, [r0, r1]
	ldr r0, _0807A488  @ gBmMapUnk
	ldr r0, [r0]
	lsls r1, r1, #2
	adds r1, r1, r0
	adds r0, r4, #0
	adds r0, #0x40
	movs r2, #0
	ldrsb r2, [r0, r2]
	ldr r0, [r1]
	adds r0, r0, r2
	ldr r1, [r6]
	ldrb r1, [r1, #4]
	strb r1, [r0]
	adds r1, r4, #0
	adds r1, #0x42
	mov r0, sp
	movs r2, #0
	ldrsb r2, [r1, r2]
	movs r3, #0
	ldrsh r0, [r0, r3]
	str r1, [sp, #4]
	movs r1, #0x43
	adds r1, r1, r4
	mov sl, r1
	cmp r2, r0
	bne _0807A44C
	mov r2, r8
	ldrh r0, [r2, #2]
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r1, r0
	beq _0807A4D4
_0807A44C:
	ldr r4, [r4, #0x30]
	adds r0, r4, #0
	bl MU_Show
	adds r0, r4, #0
	mov r1, r9
	bl MU_StartMoveScript
	ldr r0, [r7]
	lsls r0, r0, #0xe
	lsrs r1, r0, #0x1a
	movs r0, #8
	ands r0, r5
	cmp r0, #0
	beq _0807A46E
	movs r0, #0x40
	orrs r1, r0
_0807A46E:
	adds r0, r4, #0
	bl MU_SetMoveConfig
	movs r0, #4
	ands r5, r0
	cmp r5, #0
	beq _0807A48C
	adds r0, r4, #0
	bl MU_EnableAttractCamera
	b _0807A492
	.align 2, 0
_0807A484: .4byte 0x0000FFFE
_0807A488: .4byte gBmMapUnk
_0807A48C:
	adds r0, r4, #0
	bl MU_DisableAttractCamera
_0807A492:
	adds r0, r6, #0
	bl HideUnitSMS
	ldr r0, [r6, #0xc]
	movs r1, #1
	orrs r0, r1
	str r0, [r6, #0xc]
	movs r0, #0x11
	ldrsb r0, [r6, r0]
	ldr r1, _0807A4E4  @ gBmMapUnit
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r1, #0x10
	ldrsb r1, [r6, r1]
	ldr r0, [r0]
	adds r1, r0, r1
	ldrb r0, [r1]
	ldrb r6, [r6, #0xb]
	cmp r0, r6
	bne _0807A4C0
	movs r0, #0
	strb r0, [r1]
_0807A4C0:
	bl SMS_UpdateFromGameData
	mov r0, sp
	ldrh r0, [r0]
	ldr r3, [sp, #4]
	strb r0, [r3]
	mov r0, sp
	ldrh r0, [r0, #2]
	mov r1, sl
	strb r0, [r1]
_0807A4D4:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807A4E4: .4byte gBmMapUnit

	THUMB_FUNC_END sub_807A358

	THUMB_FUNC_START GetAdjustedPositionForNewUnit
GetAdjustedPositionForNewUnit: @ 0x0807A4E8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x24
	adds r3, r0, #0
	adds r6, r1, #0
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #2
	ands r0, r2
	cmp r0, #0
	bne _0807A506
	b _0807A604
_0807A506:
	movs r0, #0
	mov r8, r0
	movs r1, #0
	ldrsh r4, [r6, r1]
	movs r2, #2
	ldrsh r5, [r6, r2]
	adds r0, r3, #0
	bl GetUnitMovementCost
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	bl GenerateExtendedMovementMapOnRange
	movs r2, #0xff
	ldrb r3, [r6]
	mov sl, r3
	ldrb r0, [r6, #2]
	add r1, sp, #0x20
	strb r0, [r1]
_0807A52E:
	movs r5, #0xff
	lsls r1, r5, #0x18
	lsls r2, r2, #0x18
	mov ip, r2
	asrs r7, r2, #0x18
	add r2, sp, #0x20
	ldrb r2, [r2]
	adds r0, r7, r2
	lsls r0, r0, #0x18
	mov r9, r0
_0807A542:
	asrs r1, r1, #0x18
	mov r3, sl
	adds r0, r1, r3
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r1, #0
	bne _0807A554
	cmp r7, #0
	beq _0807A5B6
_0807A554:
	mov r0, r9
	asrs r4, r0, #0x18
	ldr r0, _0807A5F4  @ gBmMapUnit
	ldr r1, [r0]
	lsls r3, r4, #2
	adds r1, r3, r1
	lsls r0, r2, #0x18
	asrs r2, r0, #0x18
	ldr r0, [r1]
	adds r0, r0, r2
	ldrb r0, [r0]
	cmp r0, #0
	bne _0807A5B6
	ldr r0, _0807A5F8  @ gBmMapUnk
	ldr r0, [r0]
	adds r0, r3, r0
	ldr r0, [r0]
	adds r0, r0, r2
	ldrb r0, [r0]
	cmp r0, #0
	bne _0807A5B6
	ldr r0, _0807A5FC  @ gBmMapHidden
	ldr r0, [r0]
	adds r0, r3, r0
	ldr r0, [r0]
	adds r0, r0, r2
	ldrb r0, [r0]
	cmp r0, #0
	bne _0807A5B6
	ldr r0, _0807A600  @ gBmMapRange
	ldr r0, [r0]
	adds r0, r3, r0
	ldr r0, [r0]
	adds r0, r0, r2
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	blt _0807A5B6
	mov r1, r8
	lsls r0, r1, #2
	add r0, sp
	strh r2, [r0]
	strh r4, [r0, #2]
	mov r0, r8
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
_0807A5B6:
	lsls r0, r5, #0x18
	movs r2, #0x80
	lsls r2, r2, #0x11
	adds r0, r0, r2
	lsrs r5, r0, #0x18
	lsls r1, r5, #0x18
	asrs r0, r1, #0x18
	cmp r0, #1
	ble _0807A542
	adds r0, r2, #0
	add r0, ip
	lsrs r2, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	ble _0807A52E
	mov r3, r8
	cmp r3, #0
	beq _0807A62E
	mov r0, r8
	bl NextRN_N
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x16
	mov r2, sp
	adds r1, r2, r0
	ldrh r0, [r1]
	strh r0, [r6]
	ldrh r0, [r1, #2]
	strh r0, [r6, #2]
	b _0807A62E
	.align 2, 0
_0807A5F4: .4byte gBmMapUnit
_0807A5F8: .4byte gBmMapUnk
_0807A5FC: .4byte gBmMapHidden
_0807A600: .4byte gBmMapRange
_0807A604:
	movs r0, #1
	ands r0, r2
	cmp r0, #0
	beq _0807A62E
	movs r2, #2
	ldrsb r2, [r6, r2]
	ldr r0, _0807A640  @ gBmMapTerrain
	ldr r1, [r0]
	lsls r0, r2, #2
	adds r0, r0, r1
	movs r1, #0
	ldrsb r1, [r6, r1]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _0807A62E
	adds r0, r3, #0
	adds r3, r6, #0
	bl sub_803BDE0
_0807A62E:
	add sp, #0x24
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807A640: .4byte gBmMapTerrain

	THUMB_FUNC_END GetAdjustedPositionForNewUnit

	THUMB_FUNC_START sub_807A644
sub_807A644: @ 0x0807A644
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	adds r5, r1, #0
	ldrb r7, [r5]
	ldrb r6, [r5, #2]
	lsls r2, r2, #0x18
	cmp r2, #0
	bne _0807A67C
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	ldr r2, [r4, #4]
	ldr r2, [r2, #0x38]
	bl GenerateExtendedMovementMapOnRange
	lsls r0, r7, #0x18
	asrs r0, r0, #0x18
	lsls r1, r6, #0x18
	asrs r1, r1, #0x18
	ldr r2, _0807A678  @ gWorkingMovementScript
	bl GenerateBestMovementScript
	b _0807A6F4
	.align 2, 0
_0807A678: .4byte gWorkingMovementScript
_0807A67C:
	bl DisableAllLightRunes
	lsls r0, r6, #0x18
	asrs r2, r0, #0x18
	ldr r0, _0807A6A4  @ gBmMapTerrain
	ldr r1, [r0]
	lsls r0, r2, #2
	adds r0, r0, r1
	lsls r1, r7, #0x18
	asrs r1, r1, #0x18
	ldr r0, [r0]
	adds r3, r0, r1
	ldrb r0, [r3]
	cmp r0, #0
	bne _0807A6A8
	movs r0, #1
	strb r0, [r3]
	movs r0, #1
	b _0807A6B6
	.align 2, 0
_0807A6A4: .4byte gBmMapTerrain
_0807A6A8:
	adds r0, r4, #0
	adds r3, r5, #0
	bl sub_803BDE0
	ldrb r7, [r5]
	ldrb r6, [r5, #2]
	movs r0, #0
_0807A6B6:
	mov r8, r0
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	ldr r2, [r4, #4]
	ldr r2, [r2, #0x38]
	bl GenerateExtendedMovementMapOnRange
	lsls r0, r7, #0x18
	asrs r5, r0, #0x18
	lsls r0, r6, #0x18
	asrs r4, r0, #0x18
	ldr r2, _0807A700  @ gWorkingMovementScript
	adds r0, r5, #0
	adds r1, r4, #0
	bl GenerateBestMovementScript
	mov r0, r8
	cmp r0, #0
	beq _0807A6F0
	ldr r0, _0807A704  @ gBmMapTerrain
	ldr r1, [r0]
	lsls r0, r4, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, r0, r5
	movs r1, #0
	strb r1, [r0]
_0807A6F0:
	bl EnableAllLightRunes
_0807A6F4:
	ldr r0, _0807A700  @ gWorkingMovementScript
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0807A700: .4byte gWorkingMovementScript
_0807A704: .4byte gBmMapTerrain

	THUMB_FUNC_END sub_807A644

.align 2, 0
