	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	@ Misc Camera movement functions

	THUMB_FUNC_START GetPlayerStartCursorPosition
GetPlayerStartCursorPosition: @ 0x0801DE30
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	ldr r4, _0801DE74  @ gRAMChapterData
	ldrh r0, [r4, #0x10]
	cmp r0, #1
	bne _0801DE50
	bl GetPlayerLeaderUnitId
	bl GetUnitFromCharId
	adds r1, r0, #0
	ldrb r0, [r1, #0x10]
	strb r0, [r4, #0x12]
	ldrb r0, [r1, #0x11]
	strb r0, [r4, #0x13]
_0801DE50:
	adds r0, r4, #0
	adds r0, #0x40
	ldrb r0, [r0]
	lsls r0, r0, #0x1b
	cmp r0, #0
	blt _0801DE78
	bl GetPlayerLeaderUnitId
	bl GetUnitFromCharId
	adds r1, r0, #0
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	str r0, [r5]
	movs r0, #0x11
	ldrsb r0, [r1, r0]
	b _0801DE7E
	.align 2, 0
_0801DE74: .4byte gRAMChapterData
_0801DE78:
	ldrb r0, [r4, #0x12]
	str r0, [r5]
	ldrb r0, [r4, #0x13]
_0801DE7E:
	str r0, [r6]
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END GetPlayerStartCursorPosition

	THUMB_FUNC_START GetEnemyStartCursorPosition
GetEnemyStartCursorPosition: @ 0x0801DE88
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r5, r1, #0
	ldr r0, _0801DE98  @ gRAMChapterData
	ldrb r0, [r0, #0xf]
	adds r4, r0, #1
	b _0801DEDC
	.align 2, 0
_0801DE98: .4byte gRAMChapterData
_0801DE9C:
	adds r0, r4, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq _0801DED6
	ldr r3, [r2]
	cmp r3, #0
	beq _0801DED6
	ldr r0, [r2, #0xc]
	ldr r1, _0801DEE8  @ 0x00000201
	ands r0, r1
	cmp r0, #0
	bne _0801DED6
	movs r0, #0x10
	ldrsb r0, [r2, r0]
	str r0, [r6]
	movs r0, #0x11
	ldrsb r0, [r2, r0]
	str r0, [r5]
	ldr r0, [r2, #4]
	ldr r1, [r3, #0x28]
	ldr r0, [r0, #0x28]
	orrs r1, r0
	movs r0, #0x80
	lsls r0, r0, #8
	ands r1, r0
	cmp r1, #0
	bne _0801DEE2
_0801DED6:
	adds r4, #1
	ldr r0, _0801DEEC  @ gRAMChapterData
	ldrb r0, [r0, #0xf]
_0801DEDC:
	adds r0, #0x40
	cmp r4, r0
	blt _0801DE9C
_0801DEE2:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0801DEE8: .4byte 0x00000201
_0801DEEC: .4byte gRAMChapterData

	THUMB_FUNC_END GetEnemyStartCursorPosition

	THUMB_FUNC_START sub_801DEF0
sub_801DEF0: @ 0x0801DEF0
	push {r4, r5, lr}
	sub sp, #8
	adds r5, r0, #0
	movs r0, #1
	negs r0, r0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r4, _0801DF14  @ gRAMChapterData
	ldrb r0, [r4, #0xf]
	bl GetPhaseAbleUnitCount
	cmp r0, #0
	bne _0801DF18
	adds r0, r5, #0
	bl Proc_End
	b _0801DF5A
	.align 2, 0
_0801DF14: .4byte gRAMChapterData
_0801DF18:
	ldrb r0, [r4, #0xf]
	cmp r0, #0x40
	beq _0801DF38
	cmp r0, #0x40
	bgt _0801DF28
	cmp r0, #0
	beq _0801DF2E
	b _0801DF40
_0801DF28:
	cmp r0, #0x80
	beq _0801DF38
	b _0801DF40
_0801DF2E:
	add r1, sp, #4
	mov r0, sp
	bl GetPlayerStartCursorPosition
	b _0801DF40
_0801DF38:
	add r1, sp, #4
	mov r0, sp
	bl GetEnemyStartCursorPosition
_0801DF40:
	ldr r1, [sp]
	cmp r1, #0
	blt _0801DF5A
	ldr r2, [sp, #4]
	cmp r2, #0
	blt _0801DF5A
	adds r0, r5, #0
	bl EnsureCameraOntoPosition
	ldr r0, [sp]
	ldr r1, [sp, #4]
	bl SetCursorMapPosition
_0801DF5A:
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_801DEF0

	THUMB_FUNC_START ADJUSTFROMXI_MoveCameraOnSomeUnit
ADJUSTFROMXI_MoveCameraOnSomeUnit: @ 0x0801DF64
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	bl GetLastStatScreenUid
	bl GetUnit
	cmp r0, #0
	beq _0801DF8E
	movs r4, #0x10
	ldrsb r4, [r0, r4]
	movs r5, #0x11
	ldrsb r5, [r0, r5]
	adds r0, r6, #0
	adds r1, r4, #0
	adds r2, r5, #0
	bl EnsureCameraOntoPosition
	adds r0, r4, #0
	adds r1, r5, #0
	bl SetCursorMapPosition
_0801DF8E:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END ADJUSTFROMXI_MoveCameraOnSomeUnit

.align 2, 0 @ align with 0
