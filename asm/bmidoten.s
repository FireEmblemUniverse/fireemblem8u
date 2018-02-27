	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	THUMB_FUNC_START sub_801B950
sub_801B950: @ 0x0801B950
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r4, #0x81
_0801B956:
	adds r0, r4, #0
	bl GetUnitStruct
	adds r2, r0, #0
	cmp r2, #0
	beq _0801B98A
	ldr r1, [r2]
	cmp r1, #0
	beq _0801B98A
	ldr r0, [r2, #4]
	ldr r1, [r1, #0x28]
	ldr r0, [r0, #0x28]
	orrs r1, r0
	movs r0, #0x80
	lsls r0, r0, #0x13
	ands r1, r0
	cmp r1, #0
	beq _0801B98A
	movs r0, #0x10
	ldrsb r0, [r2, r0]
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	movs r2, #0xa
	adds r3, r5, #0
	bl StoreR3ToMapSomething
_0801B98A:
	adds r4, #1
	cmp r4, #0xbf
	ble _0801B956
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_START SetSubjectMap
SetSubjectMap: @ 0x0801B998
	ldr r1, _0801B9A0  @ gUnknown_030049A0
	str r0, [r1]
	bx lr
	.align 2, 0
_0801B9A0: .4byte gUnknown_030049A0

	THUMB_FUNC_START FillRangeMap
FillRangeMap: @ 0x0801B9A4
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	adds r4, r2, #0
	adds r2, r3, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	adds r0, r5, #0
	adds r1, r6, #0
	movs r3, #1
	bl MapAddInRange
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	subs r4, #1
	movs r3, #1
	negs r3, r3
	adds r0, r5, #0
	adds r1, r6, #0
	adds r2, r4, #0
	bl MapAddInRange
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_START GetCurrentMovCostTable
GetCurrentMovCostTable: @ 0x0801B9E4
	ldr r0, _0801B9E8  @ gUnknown_03004BB0
	bx lr
	.align 2, 0
_0801B9E8: .4byte gUnknown_03004BB0

	THUMB_FUNC_START sub_801B9EC
sub_801B9EC: @ 0x0801B9EC
	push {r4, lr}
	sub sp, #8
	bl sub_8000D28
	mov r2, sp
	adds r2, #2
	add r4, sp, #4
	mov r1, sp
	adds r3, r4, #0
	bl sub_8000D64
	ldrh r1, [r4]
	movs r0, #1
	ands r0, r1
	movs r1, #3
	cmp r0, #0
	bne _0801BA10
	movs r1, #2
_0801BA10:
	adds r0, r1, #0
	add sp, #8
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_START sub_801BA1C
sub_801BA1C: @ 0x0801BA1C
	push {r4, lr}
	sub sp, #8
	bl sub_8000D28
	mov r2, sp
	adds r2, #2
	add r4, sp, #4
	mov r1, sp
	adds r3, r4, #0
	bl sub_8000D64
	ldrh r1, [r4]
	movs r0, #1
	ands r0, r1
	movs r1, #3
	cmp r0, #0
	beq _0801BA40
	movs r1, #2
_0801BA40:
	adds r0, r1, #0
	add sp, #8
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_START Get8
Get8: @ 0x0801BA4C
	movs r0, #8
	bx lr

	THUMB_FUNC_START sub_801BA50
sub_801BA50: @ 0x0801BA50
	movs r0, #0x17
	bx lr

	THUMB_FUNC_START sub_801BA54
sub_801BA54: @ 0x0801BA54
	bx lr

	THUMB_FUNC_START Loop6C_WaitForSelectPress
Loop6C_WaitForSelectPress: @ 0x0801BA58
	push {lr}
	adds r2, r0, #0
	ldr r0, _0801BA74  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _0801BA70
	adds r0, r2, #0
	bl Proc_ClearNativeCallback
_0801BA70:
	pop {r0}
	bx r0
	.align 2, 0
_0801BA74: .4byte gKeyStatusPtr

	THUMB_FUNC_START sub_801BA78
sub_801BA78: @ 0x0801BA78
	push {lr}
	movs r0, #0x10
	bl NewKeyStatusSetter
	pop {r0}
	bx r0

	THUMB_FUNC_START sub_801BA84
sub_801BA84: @ 0x0801BA84
	bx lr

	THUMB_FUNC_START sub_801BA88
sub_801BA88: @ 0x0801BA88
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #0xc
	ldr r1, [r0, #0x2c]
	mov r8, r1
	ldr r4, [r0, #0x30]
	adds r1, r0, #0
	adds r1, #0x52
	ldrh r5, [r1]
	ldr r6, [r0, #0x54]
	add r0, sp, #4
	adds r1, r5, #0
	bl Text_Init
	add r0, sp, #4
	adds r1, r6, #0
	bl Text_AppendString
	adds r5, #2
	movs r0, #0
	str r0, [sp]
	mov r0, r8
	adds r1, r4, #0
	adds r2, r5, #0
	movs r3, #4
	bl MakeUIWindowTileMap_BG0BG1
	adds r4, #1
	lsls r4, r4, #5
	adds r4, #1
	add r4, r8
	lsls r4, r4, #1
	ldr r0, _0801BAE8  @ gBG0TilemapBuffer
	adds r4, r4, r0
	add r0, sp, #4
	adds r1, r4, #0
	bl Text_Draw
	movs r0, #3
	bl BG_EnableSyncByMask
	add sp, #0xc
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0801BAE8: .4byte gBG0TilemapBuffer

	THUMB_FUNC_START sub_801BAEC
sub_801BAEC: @ 0x0801BAEC
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r5, r0, #0
	adds r6, r1, #0
	mov r8, r2
	adds r4, r3, #0
	ldr r0, _0801BB18  @ gUnknown_0859AA64
	movs r1, #3
	bl Proc_Create
	str r5, [r0, #0x2c]
	str r6, [r0, #0x30]
	str r4, [r0, #0x54]
	adds r0, #0x52
	mov r1, r8
	strh r1, [r0]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0801BB18: .4byte gUnknown_0859AA64

	THUMB_FUNC_START sub_801BB1C
sub_801BB1C: @ 0x0801BB1C
	push {lr}
	bl EndMenu
	bl ClearBG0BG1
	ldr r0, _0801BB3C  @ gUnknown_0859D040
	bl NewMenu_Default
	movs r0, #2
	movs r1, #0
	bl SetupDebugFontForBG
	movs r0, #1
	pop {r1}
	bx r1
	.align 2, 0
_0801BB3C: .4byte gUnknown_0859D040

	.align 2, 0 @ Don't pad with nop.
