	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	@ Prep Screen!

	THUMB_FUNC_START sub_8033F34
sub_8033F34: @ 0x08033F34
	push {r4, r5, lr}
	adds r5, r0, #0
	bl HandlePlayerCursorMovement
	ldr r0, _08033F90  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #3
	ands r0, r1
	cmp r0, #0
	beq _08033FA0
	bl MU_EndAll
	ldr r0, _08033F94  @ gActiveUnit
	ldr r2, [r0]
	ldr r0, [r2, #0xc]
	movs r1, #2
	negs r1, r1
	ands r0, r1
	str r0, [r2, #0xc]
	ldr r2, _08033F98  @ gUnknown_0202BCB0
	ldrb r1, [r2, #4]
	movs r0, #0xf7
	ands r0, r1
	strb r0, [r2, #4]
	bl HideMoveRangeGraphics
	bl RefreshEntityBmMaps
	bl SMS_UpdateFromGameData
	ldr r0, _08033F9C  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08033F84
	movs r0, #0x6b
	bl m4aSongNumStart
_08033F84:
	adds r0, r5, #0
	movs r1, #9
	bl Proc_Goto
	b _08034058
	.align 2, 0
_08033F90: .4byte gKeyStatusPtr
_08033F94: .4byte gActiveUnit
_08033F98: .4byte gUnknown_0202BCB0
_08033F9C: .4byte gRAMChapterData
_08033FA0:
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08034002
	ldr r2, _08034060  @ gUnknown_0202BCB0
	movs r1, #0x16
	ldrsh r0, [r2, r1]
	ldr r1, _08034064  @ gBmMapUnit
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r3, #0x14
	ldrsh r1, [r2, r3]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r4, [r0]
	ldr r0, _08034068  @ gActiveUnitMoveOrigin
	ldr r1, [r0]
	ldr r0, [r2, #0x14]
	cmp r1, r0
	bne _08033FD2
	ldr r0, _0803406C  @ gActiveUnit
	ldr r0, [r0]
	ldrb r4, [r0, #0xb]
_08033FD2:
	cmp r4, #0
	beq _08034002
	adds r0, r4, #0
	bl GetUnit
	bl sub_801C928
	cmp r0, #0
	beq _08034002
	bl MU_EndAll
	movs r0, #0x1f
	bl SetStatScreenConfig
	adds r0, r4, #0
	bl GetUnit
	adds r1, r5, #0
	bl StartStatScreen
	adds r0, r5, #0
	movs r1, #6
	bl Proc_Goto
_08034002:
	ldr r0, _08034070  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08034048
	ldr r0, _0803406C  @ gActiveUnit
	ldr r0, [r0]
	cmp r0, #0
	beq _08034048
	ldr r4, _08034068  @ gActiveUnitMoveOrigin
	movs r0, #0
	ldrsh r1, [r4, r0]
	movs r3, #2
	ldrsh r2, [r4, r3]
	adds r0, r5, #0
	bl EnsureCameraOntoPosition
	movs r1, #0
	ldrsh r0, [r4, r1]
	movs r2, #2
	ldrsh r1, [r4, r2]
	bl SetCursorMapPosition
	ldr r0, _08034074  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08034048
	movs r0, #0x6b
	bl m4aSongNumStart
_08034048:
	ldr r1, _08034060  @ gUnknown_0202BCB0
	movs r3, #0x20
	ldrsh r0, [r1, r3]
	movs r2, #0x22
	ldrsh r1, [r1, r2]
	movs r2, #1
	bl DisplayCursor
_08034058:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08034060: .4byte gUnknown_0202BCB0
_08034064: .4byte gBmMapUnit
_08034068: .4byte gActiveUnitMoveOrigin
_0803406C: .4byte gActiveUnit
_08034070: .4byte gKeyStatusPtr
_08034074: .4byte gRAMChapterData

	THUMB_FUNC_END sub_8033F34

	THUMB_FUNC_START sub_8034078
sub_8034078: @ 0x08034078
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0
	bl SetupBackgrounds
	adds r0, r4, #0
	bl sub_80ADDD4
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8034078

	THUMB_FUNC_START sub_8034090
sub_8034090: @ 0x08034090
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r5, _080340AC  @ gActiveUnit
	ldr r2, [r5]
	cmp r2, #0
	bne _080340B0
	bl RefreshBMapGraphics
	adds r0, r6, #0
	movs r1, #0xc
	bl Proc_Goto
	b _08034102
	.align 2, 0
_080340AC: .4byte gActiveUnit
_080340B0:
	movs r0, #0x11
	ldrsb r0, [r2, r0]
	ldr r4, _08034108  @ gBmMapUnit
	ldr r1, [r4]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r1, [r2, #0xb]
	strb r1, [r0]
	ldr r2, [r5]
	ldr r0, [r2, #0xc]
	movs r1, #2
	negs r1, r1
	ands r0, r1
	str r0, [r2, #0xc]
	bl RefreshBMapGraphics
	ldr r2, [r5]
	movs r0, #0x11
	ldrsb r0, [r2, r0]
	ldr r1, [r4]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	ldr r0, [r0]
	adds r0, r0, r1
	movs r1, #0
	strb r1, [r0]
	ldr r2, [r5]
	ldr r0, [r2, #0xc]
	movs r1, #1
	orrs r0, r1
	str r0, [r2, #0xc]
	adds r0, r6, #0
	movs r1, #0xb
	bl Proc_Goto
_08034102:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08034108: .4byte gBmMapUnit

	THUMB_FUNC_END sub_8034090

	THUMB_FUNC_START sub_803410C
sub_803410C: @ 0x0803410C
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r2, _08034164  @ gRAMChapterData
	adds r4, r2, #0
	adds r4, #0x4a
	ldrb r1, [r4]
	movs r5, #0xf
	negs r5, r5
	adds r0, r5, #0
	ands r0, r1
	movs r1, #4
	orrs r0, r1
	strb r0, [r4]
	ldrb r1, [r2, #0x14]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	bne _08034146
	bl GetChapterThing
	subs r0, #1
	cmp r0, #1
	bhi _08034146
	ldrb r0, [r4]
	adds r1, r5, #0
	ands r1, r0
	movs r0, #8
	orrs r1, r0
	strb r1, [r4]
_08034146:
	movs r0, #0x80
	lsls r0, r0, #1
	movs r1, #0x80
	movs r2, #0x20
	movs r3, #0
	bl ISuspectThisToBeMusicRelated_8002730
	bl sub_801240C
	adds r0, r6, #0
	bl Make6C_savemenu2
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08034164: .4byte gRAMChapterData

	THUMB_FUNC_END sub_803410C

	THUMB_FUNC_START sub_8034168
sub_8034168: @ 0x08034168
	push {lr}
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #0x80
	movs r2, #0x20
	movs r3, #0
	bl ISuspectThisToBeMusicRelated_8002730
	ldr r2, _08034190  @ gRAMChapterData
	adds r2, #0x4a
	ldrb r1, [r2]
	movs r0, #0xf
	negs r0, r0
	ands r0, r1
	movs r1, #4
	orrs r0, r1
	strb r0, [r2]
	pop {r0}
	bx r0
	.align 2, 0
_08034190: .4byte gRAMChapterData

	THUMB_FUNC_END sub_8034168

	THUMB_FUNC_START sub_8034194
sub_8034194: @ 0x08034194
	push {lr}
	sub sp, #4
	bl CheckSomethingSomewhere
	cmp r0, #0
	bne _080341C8
	ldr r0, _080341B4  @ gUnknown_03005280
	ldrb r0, [r0]
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	beq _080341B8
	bl sub_80B9FC0
	b _080341C8
	.align 2, 0
_080341B4: .4byte gUnknown_03005280
_080341B8:
	movs r2, #0x80
	lsls r2, r2, #1
	str r1, [sp]
	movs r0, #0x34
	adds r1, r2, #0
	movs r3, #0x18
	bl sub_80029E8
_080341C8:
	add sp, #4
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8034194

	THUMB_FUNC_START sub_80341D0
sub_80341D0: @ 0x080341D0
	push {lr}
	bl AddSkipThread2
	bl BMapDispSuspend
	ldr r2, _080341FC  @ gLCDControlBuffer
	ldrb r0, [r2, #1]
	movs r1, #1
	orrs r0, r1
	movs r1, #2
	orrs r0, r1
	movs r1, #5
	negs r1, r1
	ands r0, r1
	subs r1, #4
	ands r0, r1
	subs r1, #8
	ands r0, r1
	strb r0, [r2, #1]
	pop {r0}
	bx r0
	.align 2, 0
_080341FC: .4byte gLCDControlBuffer

	THUMB_FUNC_END sub_80341D0

	THUMB_FUNC_START sub_8034200
sub_8034200: @ 0x08034200
	push {lr}
	bl SubSkipThread2
	bl BMapDispResume
	bl sub_80141B0
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8034200

	THUMB_FUNC_START ShrinkPlayerUnits
ShrinkPlayerUnits: @ 0x08034214
	push {r4, lr}
	ldr r0, _08034268  @ gRAMChapterData
	ldrb r1, [r0, #0x14]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08034262
	ldr r0, _0803426C  @ gUnknown_0202BCB0
	ldrb r1, [r0, #4]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	bne _08034262
	ldr r0, _08034270  @ gUnknown_02020188
	bl InitUnitStack
	movs r4, #1
_08034236:
	adds r0, r4, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq _08034258
	ldr r0, [r2]
	cmp r0, #0
	beq _08034258
	ldr r0, [r2, #0xc]
	ldr r1, _08034274  @ 0x0001000C
	ands r0, r1
	cmp r0, #0
	bne _08034258
	adds r0, r2, #0
	bl PushUnit
_08034258:
	adds r4, #1
	cmp r4, #0x3f
	ble _08034236
	bl LoadPlayerUnitsFromUnitStack2
_08034262:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08034268: .4byte gRAMChapterData
_0803426C: .4byte gUnknown_0202BCB0
_08034270: .4byte gUnknown_02020188
_08034274: .4byte 0x0001000C

	THUMB_FUNC_END ShrinkPlayerUnits

	THUMB_FUNC_START sub_8034278
sub_8034278: @ 0x08034278
	push {r4, lr}
	movs r4, #1
_0803427C:
	adds r0, r4, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq _080342BA
	ldr r3, [r2]
	cmp r3, #0
	beq _080342BA
	ldr r1, [r2, #0xc]
	movs r0, #3
	negs r0, r0
	ands r1, r0
	str r1, [r2, #0xc]
	ldr r0, _080342B0  @ gUnknown_02010004
	ands r0, r1
	cmp r0, #0
	bne _080342BA
	movs r0, #8
	ands r1, r0
	cmp r1, #0
	beq _080342B4
	ldrb r0, [r3, #4]
	bl sub_80A48F0
	b _080342BA
	.align 2, 0
_080342B0: .4byte gUnknown_02010004
_080342B4:
	ldrb r0, [r3, #4]
	bl BWL_IncrementDeployCountMaybe
_080342BA:
	adds r4, #1
	cmp r4, #0x3f
	ble _0803427C
	bl ShrinkPlayerUnits
	ldr r0, _080342F0  @ gUnknown_0859DBBC
	bl Proc_EndEach
	ldr r3, _080342F4  @ gUnknown_0202BCB0
	ldrb r2, [r3, #4]
	movs r1, #0xef
	adds r0, r1, #0
	ands r0, r2
	strb r0, [r3, #4]
	ldr r2, _080342F8  @ gRAMChapterData
	ldrb r0, [r2, #0x14]
	ands r1, r0
	strb r1, [r2, #0x14]
	adds r2, #0x4a
	ldrb r0, [r2]
	movs r1, #1
	orrs r0, r1
	strb r0, [r2]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080342F0: .4byte gUnknown_0859DBBC
_080342F4: .4byte gUnknown_0202BCB0
_080342F8: .4byte gRAMChapterData

	THUMB_FUNC_END sub_8034278

	THUMB_FUNC_START sub_80342FC
sub_80342FC: @ 0x080342FC
	push {lr}
	ldr r0, _08034310  @ gUnknown_0859DBBC
	bl Proc_Find
	cmp r0, #0
	beq _0803430A
	movs r0, #1
_0803430A:
	pop {r1}
	bx r1
	.align 2, 0
_08034310: .4byte gUnknown_0859DBBC

	THUMB_FUNC_END sub_80342FC

.align 2, 0
