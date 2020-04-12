	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	@ These three functions seem to be generally unrelated to whatever is before and after them
	@ So I'll put them here until someone decides on a better name/split
	@ -Stan

	THUMB_FUNC_START sub_801E2E0
sub_801E2E0: @ 0x0801E2E0
	push {r4, lr}
	adds r4, r0, #0
	cmp r4, #0
	bge _0801E2F6
	ldr r0, _0801E318  @ gRAMChapterData
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetROMChapterStruct
	ldrb r4, [r0, #0xc]
_0801E2F6:
	bl RenderBmMapOnBg2
	ldr r0, _0801E318  @ gRAMChapterData
	strb r4, [r0, #0xd]
	bl RefreshEntityBmMaps
	bl SMS_UpdateFromGameData
	bl RenderBmMap
	movs r0, #1
	bl NewBMXFADE
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0801E318: .4byte gRAMChapterData

	THUMB_FUNC_END sub_801E2E0

	THUMB_FUNC_START sub_801E31C
sub_801E31C: @ 0x0801E31C
	push {lr}
	adds r1, r0, #0
	cmp r1, #0
	bge _0801E332
	ldr r0, _0801E348  @ gRAMChapterData
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetROMChapterStruct
	ldrb r1, [r0, #0xc]
_0801E332:
	ldr r0, _0801E348  @ gRAMChapterData
	strb r1, [r0, #0xd]
	bl RefreshEntityBmMaps
	bl SMS_UpdateFromGameData
	bl RenderBmMap
	pop {r0}
	bx r0
	.align 2, 0
_0801E348: .4byte gRAMChapterData

	THUMB_FUNC_END sub_801E31C

	THUMB_FUNC_START FillWarpRangeMap
FillWarpRangeMap: @ 0x0801E34C
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	mov r9, r0
	mov r8, r1
	ldr r6, _0801E418  @ gBmMapMovement
	ldr r0, [r6]
	movs r1, #1
	negs r1, r1
	bl BmMapFill
	ldr r0, _0801E41C  @ gBmMapRange
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFill
	ldr r0, [r6]
	bl SetWorkingBmMap
	mov r0, r8
	movs r4, #0x10
	ldrsb r4, [r0, r4]
	movs r5, #0x11
	ldrsb r5, [r0, r5]
	mov r0, r9
	bl GetUnitMagBy2Range
	adds r3, r0, #0
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #1
	bl MapAddInBoundedRange
	ldr r0, _0801E420  @ gRAMChapterData
	ldrb r0, [r0, #0xd]
	cmp r0, #0
	bne _0801E430
	ldr r0, _0801E424  @ gBmMapSize
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r3, r0, #1
	adds r2, r6, #0
	cmp r3, #0
	bge _0801E3AC
	b _0801E4B4
_0801E3AC:
	ldr r0, _0801E424  @ gBmMapSize
	movs r1, #0
	ldrsh r0, [r0, r1]
	subs r4, r0, #1
	subs r7, r3, #1
	cmp r4, #0
	blt _0801E40E
	ldr r6, _0801E418  @ gBmMapMovement
	lsls r5, r3, #2
_0801E3BE:
	ldr r0, [r6]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _0801E408
	ldr r0, _0801E428  @ gBmMapTerrain
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r1, [r0]
	mov r0, r8
	bl CanUnitCrossTerrain
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0801E3F6
	ldr r0, _0801E42C  @ gBmMapUnit
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	ldr r2, _0801E418  @ gBmMapMovement
	cmp r0, #0
	beq _0801E408
_0801E3F6:
	ldr r0, [r6]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r4
	movs r2, #1
	negs r2, r2
	adds r1, r2, #0
	strb r1, [r0]
	ldr r2, _0801E418  @ gBmMapMovement
_0801E408:
	subs r4, #1
	cmp r4, #0
	bge _0801E3BE
_0801E40E:
	adds r3, r7, #0
	cmp r3, #0
	bge _0801E3AC
	b _0801E4B4
	.align 2, 0
_0801E418: .4byte gBmMapMovement
_0801E41C: .4byte gBmMapRange
_0801E420: .4byte gRAMChapterData
_0801E424: .4byte gBmMapSize
_0801E428: .4byte gBmMapTerrain
_0801E42C: .4byte gBmMapUnit
_0801E430:
	ldr r0, _0801E4E0  @ gBmMapSize
	movs r3, #2
	ldrsh r0, [r0, r3]
	subs r3, r0, #1
	adds r2, r6, #0
	cmp r3, #0
	blt _0801E4B4
_0801E43E:
	ldr r0, _0801E4E0  @ gBmMapSize
	movs r1, #0
	ldrsh r0, [r0, r1]
	subs r4, r0, #1
	subs r7, r3, #1
	cmp r4, #0
	blt _0801E4AE
	lsls r5, r3, #2
_0801E44E:
	ldr r0, [r2]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _0801E4A8
	ldr r0, _0801E4E4  @ gBmMapTerrain
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r1, [r0]
	mov r0, r8
	bl CanUnitCrossTerrain
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0801E496
	ldr r0, _0801E4E8  @ gBmMapUnit
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801E496
	ldr r0, _0801E4EC  @ gBmMapFog
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	ldr r2, _0801E4F0  @ gBmMapMovement
	cmp r0, #0
	bne _0801E4A8
_0801E496:
	ldr r2, _0801E4F0  @ gBmMapMovement
	ldr r0, [r2]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r4
	movs r3, #1
	negs r3, r3
	adds r1, r3, #0
	strb r1, [r0]
_0801E4A8:
	subs r4, #1
	cmp r4, #0
	bge _0801E44E
_0801E4AE:
	adds r3, r7, #0
	cmp r3, #0
	bge _0801E43E
_0801E4B4:
	mov r1, r9
	movs r0, #0x11
	ldrsb r0, [r1, r0]
	ldr r1, [r2]
	lsls r0, r0, #2
	adds r0, r0, r1
	mov r2, r9
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	ldr r0, [r0]
	adds r0, r0, r1
	movs r3, #1
	negs r3, r3
	adds r1, r3, #0
	strb r1, [r0]
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801E4E0: .4byte gBmMapSize
_0801E4E4: .4byte gBmMapTerrain
_0801E4E8: .4byte gBmMapUnit
_0801E4EC: .4byte gBmMapFog
_0801E4F0: .4byte gBmMapMovement

	THUMB_FUNC_END FillWarpRangeMap

.align 2, 0 @ align with 0
