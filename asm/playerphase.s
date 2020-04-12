	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	@ Player Phase proc code and related functions

	THUMB_FUNC_START ClearActionAndSave
ClearActionAndSave: @ 0x0801C894
	push {lr}
	ldr r1, _0801C8A8  @ gActionData
	movs r0, #0
	strb r0, [r1, #0x16]
	movs r0, #3
	bl SaveSuspendedGame
	pop {r0}
	bx r0
	.align 2, 0
_0801C8A8: .4byte gActionData

	THUMB_FUNC_END ClearActionAndSave

	THUMB_FUNC_START HandlePlayerCursorMovement
HandlePlayerCursorMovement: @ 0x0801C8AC
	push {lr}
	ldr r2, _0801C8DC  @ gKeyStatusPtr
	ldr r3, [r2]
	ldrh r1, [r3, #4]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0801C8E8
	ldr r0, _0801C8E0  @ gUnknown_0202BCB0
	ldr r0, [r0, #0x20]
	ldr r1, _0801C8E4  @ 0x00070007
	ands r0, r1
	cmp r0, #0
	bne _0801C8E8
	ldrh r0, [r3, #0x10]
	bl HandleCursorMovement
	movs r0, #8
	bl MoveCameraByStepMaybe
	movs r0, #8
	bl sub_801588C
	b _0801C8FC
	.align 2, 0
_0801C8DC: .4byte gKeyStatusPtr
_0801C8E0: .4byte gUnknown_0202BCB0
_0801C8E4: .4byte 0x00070007
_0801C8E8:
	ldr r0, [r2]
	ldrh r0, [r0, #6]
	bl HandleCursorMovement
	movs r0, #4
	bl MoveCameraByStepMaybe
	movs r0, #4
	bl sub_801588C
_0801C8FC:
	ldr r1, _0801C91C  @ gUnknown_0202BCB0
	ldrh r0, [r1, #0x20]
	ldrh r1, [r1, #0x22]
	orrs r0, r1
	movs r1, #0xf
	ands r0, r1
	cmp r0, #0
	beq _0801C918
	ldr r0, _0801C920  @ gKeyStatusPtr
	ldr r2, [r0]
	ldrh r1, [r2, #8]
	ldr r0, _0801C924  @ 0x0000FCF4
	ands r0, r1
	strh r0, [r2, #8]
_0801C918:
	pop {r0}
	bx r0
	.align 2, 0
_0801C91C: .4byte gUnknown_0202BCB0
_0801C920: .4byte gKeyStatusPtr
_0801C924: .4byte 0x0000FCF4

	THUMB_FUNC_END HandlePlayerCursorMovement

	THUMB_FUNC_START sub_801C928
sub_801C928: @ 0x0801C928

	@ r0 is an Unit*

	push {lr}
	ldr r0, [r0, #4]
	ldrb r0, [r0, #4]
	cmp r0, #0x62
	beq _0801C936
	cmp r0, #0x34
	bne _0801C93A
_0801C936:
	movs r0, #0
	b _0801C93C
_0801C93A:
	movs r0, #1
_0801C93C:
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_801C928

	THUMB_FUNC_START PlayerPhase_MainLoop
PlayerPhase_MainLoop: @ 0x0801C940
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	bl HandlePlayerCursorMovement
	ldr r4, _0801C97C  @ gKeyStatusPtr
	ldr r0, [r4]
	ldrh r1, [r0, #8]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0801C988
	ldr r1, _0801C980  @ gUnknown_0202BCB0
	movs r2, #0x14
	ldrsh r0, [r1, r2]
	movs r3, #0x16
	ldrsh r1, [r1, r3]
	bl sub_801DB4C
	ldr r0, _0801C984  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	bge _0801C974
	b _0801CB38
_0801C974:
	movs r0, #0x6b
	bl m4aSongNumStart
	b _0801CB38
	.align 2, 0
_0801C97C: .4byte gKeyStatusPtr
_0801C980: .4byte gUnknown_0202BCB0
_0801C984: .4byte gRAMChapterData
_0801C988:
	bl DoesBMXFADEExist
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0801C994
	b _0801CB38
_0801C994:
	ldr r0, [r4]
	ldrh r1, [r0, #8]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0801CA0C
	ldr r4, _0801CA04  @ gUnknown_0202BCB0
	movs r1, #0x16
	ldrsh r0, [r4, r1]
	ldr r5, _0801CA08  @ gBmMapUnit
	ldr r1, [r5]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r2, #0x14
	ldrsh r1, [r4, r2]
	ldr r0, [r0]
	adds r1, r0, r1
	ldrb r0, [r1]
	cmp r0, #0
	beq _0801CA0C
	bl GetUnit
	bl sub_801C928
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0801CA0C
	bl MU_EndAll
	bl DeletePlayerPhaseInterface6Cs
	movs r0, #0x1f
	bl SetStatScreenConfig
	movs r3, #0x16
	ldrsh r0, [r4, r3]
	ldr r1, [r5]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r2, #0x14
	ldrsh r1, [r4, r2]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	bl GetUnit
	adds r1, r6, #0
	bl StartStatScreen
	adds r0, r6, #0
	movs r1, #5
	bl Proc_Goto
	b _0801CB64
	.align 2, 0
_0801CA04: .4byte gUnknown_0202BCB0
_0801CA08: .4byte gBmMapUnit
_0801CA0C:
	ldr r0, _0801CA4C  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0801CAD4
	ldr r5, _0801CA50  @ gUnknown_0202BCB0
	movs r3, #0x16
	ldrsh r0, [r5, r3]
	ldr r1, _0801CA54  @ gBmMapUnit
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r2, #0x14
	ldrsh r1, [r5, r2]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	bl GetUnit
	adds r4, r0, #0
	bl GetUnitSelectionValueThing
	cmp r0, #2
	beq _0801CA9C
	cmp r0, #2
	ble _0801CA58
	cmp r0, #3
	beq _0801CABC
	b _0801CAD4
	.align 2, 0
_0801CA4C: .4byte gKeyStatusPtr
_0801CA50: .4byte gUnknown_0202BCB0
_0801CA54: .4byte gBmMapUnit
_0801CA58:
	cmp r0, #0
	blt _0801CAD4
	bl DeletePlayerPhaseInterface6Cs
	ldr r0, _0801CA94  @ gRAMChapterData
	ldrh r1, [r5, #0x14]
	strb r1, [r0, #0x12]
	ldrh r1, [r5, #0x16]
	strb r1, [r0, #0x13]
	cmp r4, #0
	beq _0801CA78
	bl MU_EndAll
	adds r0, r4, #0
	bl ShowUnitSMS
_0801CA78:
	ldr r0, _0801CA98  @ gMapMenuDef
	movs r3, #0x1c
	ldrsh r1, [r5, r3]
	movs r3, #0xc
	ldrsh r2, [r5, r3]
	subs r1, r1, r2
	movs r2, #1
	movs r3, #0x17
	bl StartOrphanMenuAdjusted
	bl sub_80832CC
	b _0801CB20
	.align 2, 0
_0801CA94: .4byte gRAMChapterData
_0801CA98: .4byte gMapMenuDef
_0801CA9C:
	adds r0, r4, #0
	bl UnitBeginAction
	ldr r0, _0801CAB8  @ gActiveUnit
	ldr r0, [r0]
	ldr r0, [r0]
	ldrb r0, [r0, #4]
	bl BWL_IncrementMoveValue
	adds r0, r6, #0
	bl Proc_Break
	b _0801CB38
	.align 2, 0
_0801CAB8: .4byte gActiveUnit
_0801CABC:
	adds r0, r4, #0
	bl UnitBeginAction
	adds r1, r5, #0
	adds r1, #0x3e
	movs r0, #0
	strb r0, [r1]
	adds r0, r6, #0
	movs r1, #0xb
	bl Proc_Goto
	b _0801CB38
_0801CAD4:
	ldr r0, _0801CB2C  @ gKeyStatusPtr
	ldr r2, [r0]
	ldrh r1, [r2, #8]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _0801CB38
	ldrh r1, [r2, #4]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	bne _0801CB38
	ldr r2, _0801CB30  @ gUnknown_0202BCB0
	movs r1, #0x16
	ldrsh r0, [r2, r1]
	ldr r1, _0801CB34  @ gBmMapUnit
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r3, #0x14
	ldrsh r1, [r2, r3]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	bl GetUnit
	adds r4, r0, #0
	cmp r4, #0
	beq _0801CB18
	bl MU_EndAll
	adds r0, r4, #0
	bl ShowUnitSMS
_0801CB18:
	bl DeletePlayerPhaseInterface6Cs
	bl sub_80A87C8
_0801CB20:
	adds r0, r6, #0
	movs r1, #9
	bl Proc_Goto
	b _0801CB64
	.align 2, 0
_0801CB2C: .4byte gKeyStatusPtr
_0801CB30: .4byte gUnknown_0202BCB0
_0801CB34: .4byte gBmMapUnit
_0801CB38:
	bl sub_8027A4C
	ldr r1, _0801CB6C  @ gUnknown_0202BCB0
	movs r0, #0x20
	ldrsh r4, [r1, r0]
	movs r2, #0x22
	ldrsh r5, [r1, r2]
	movs r3, #0x14
	ldrsh r0, [r1, r3]
	movs r2, #0x16
	ldrsh r1, [r1, r2]
	bl sub_8027B0C
	lsls r0, r0, #0x18
	movs r2, #0
	cmp r0, #0
	beq _0801CB5C
	movs r2, #3
_0801CB5C:
	adds r0, r4, #0
	adds r1, r5, #0
	bl DisplayCursor
_0801CB64:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0801CB6C: .4byte gUnknown_0202BCB0

	THUMB_FUNC_END PlayerPhase_MainLoop

	THUMB_FUNC_START DisplayUnitEffectRange
DisplayUnitEffectRange: @ 0x0801CB70
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	movs r4, #1
	ldr r5, _0801CBD8  @ gActiveUnit
	ldr r0, [r5]
	ldr r1, [r0, #4]
	ldrb r1, [r1, #0x12]
	ldrb r2, [r0, #0x1d]
	adds r1, r1, r2
	ldr r2, _0801CBDC  @ gActionData
	ldrb r2, [r2, #0x10]
	subs r1, r1, r2
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl GenerateUnitMovementMapExt
	ldr r0, [r5]
	ldr r0, [r0, #0xc]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	bne _0801CC10
	ldr r0, _0801CBE0  @ gBmMapUnk
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFill
	adds r0, r6, #0
	bl UnitHasMagicRank
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0801CBB8
	movs r0, #1
	bl GenerateMagicSealMap
_0801CBB8:
	ldr r0, _0801CBE4  @ gBmMapRange
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFill
	ldr r0, [r5]
	bl GetUnitWeaponUsabilityBits
	cmp r0, #2
	beq _0801CBF8
	cmp r0, #2
	bgt _0801CBE8
	cmp r0, #1
	beq _0801CC08
	b _0801CC10
	.align 2, 0
_0801CBD8: .4byte gActiveUnit
_0801CBDC: .4byte gActionData
_0801CBE0: .4byte gBmMapUnk
_0801CBE4: .4byte gBmMapRange
_0801CBE8:
	cmp r0, #3
	bne _0801CC10
	ldr r0, _0801CC04  @ gUnknown_0202BCB0
	adds r0, #0x3e
	ldrb r0, [r0]
	ands r4, r0
	cmp r4, #0
	beq _0801CC08
_0801CBF8:
	ldr r0, [r5]
	bl GenerateUnitCompleteStaffRange
	movs r4, #5
	b _0801CC10
	.align 2, 0
_0801CC04: .4byte gUnknown_0202BCB0
_0801CC08:
	ldr r0, [r5]
	bl GenerateUnitCompleteAttackRange
	movs r4, #3
_0801CC10:
	adds r0, r4, #0
	bl DisplayMoveRangeGraphics
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END DisplayUnitEffectRange

	THUMB_FUNC_START sub_801CC1C
sub_801CC1C: @ 0x0801CC1C
	push {r4, r5, lr}
	ldr r5, _0801CC64  @ gUnknown_0202BCB0
	ldrb r1, [r5, #4]
	movs r0, #2
	orrs r0, r1
	strb r0, [r5, #4]
	ldr r4, _0801CC68  @ gActiveUnit
	ldr r0, [r4]
	bl DisplayUnitEffectRange
	ldr r4, [r4]
	movs r1, #0x10
	ldrsb r1, [r4, r1]
	movs r2, #0x14
	ldrsh r0, [r5, r2]
	cmp r1, r0
	bne _0801CC70
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	movs r2, #0x16
	ldrsh r0, [r5, r2]
	cmp r1, r0
	bne _0801CC70
	movs r0, #0
	bl sub_8032E28
	ldr r0, _0801CC6C  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0801CC76
	movs r0, #0x69
	bl m4aSongNumStart
	b _0801CC76
	.align 2, 0
_0801CC64: .4byte gUnknown_0202BCB0
_0801CC68: .4byte gActiveUnit
_0801CC6C: .4byte gRAMChapterData
_0801CC70:
	movs r0, #1
	bl sub_8032E28
_0801CC76:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_801CC1C

	THUMB_FUNC_START DisplayActiveUnitEffectRange
DisplayActiveUnitEffectRange: @ 0x0801CC7C
	push {lr}
	ldr r0, _0801CCA8  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0801CC90
	movs r0, #0x68
	bl m4aSongNumStart
_0801CC90:
	ldr r2, _0801CCAC  @ gUnknown_0202BCB0
	ldrb r1, [r2, #4]
	movs r0, #0xfd
	ands r0, r1
	strb r0, [r2, #4]
	ldr r0, _0801CCB0  @ gActiveUnit
	ldr r0, [r0]
	bl DisplayUnitEffectRange
	pop {r0}
	bx r0
	.align 2, 0
_0801CCA8: .4byte gRAMChapterData
_0801CCAC: .4byte gUnknown_0202BCB0
_0801CCB0: .4byte gActiveUnit

	THUMB_FUNC_END DisplayActiveUnitEffectRange

	THUMB_FUNC_START sub_801CCB4
sub_801CCB4: @ 0x0801CCB4

	@ DANGER ZONE

	push {r4, r5, r6, lr}
	ldr r4, _0801CD04  @ gUnknown_0202BCB0
	adds r5, r4, #0
	adds r5, #0x3e
	ldrb r1, [r5]
	movs r6, #1
	adds r0, r6, #0
	ands r0, r1
	bl GenerateDangerZoneRange
	ldr r0, _0801CD08  @ gBmMapMovement
	ldr r0, [r0]
	movs r1, #1
	negs r1, r1
	bl BmMapFill
	ldr r0, _0801CD0C  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0801CCE6
	movs r0, #0x68
	bl m4aSongNumStart
_0801CCE6:
	ldrb r1, [r4, #4]
	movs r0, #8
	orrs r0, r1
	movs r1, #0xfd
	ands r0, r1
	strb r0, [r4, #4]
	ldrb r1, [r5]
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	beq _0801CD10
	movs r0, #5
	bl DisplayMoveRangeGraphics
	b _0801CD16
	.align 2, 0
_0801CD04: .4byte gUnknown_0202BCB0
_0801CD08: .4byte gBmMapMovement
_0801CD0C: .4byte gRAMChapterData
_0801CD10:
	movs r0, #3
	bl DisplayMoveRangeGraphics
_0801CD16:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_801CCB4

	THUMB_FUNC_START sub_801CD1C
sub_801CD1C: @ 0x0801CD1C

	@ Player Phase Proc Idle during range display?

	push {r4, r5, lr}
	adds r5, r0, #0
	movs r4, #0xff
	bl HandlePlayerCursorMovement
	ldr r0, _0801CD44  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0801CD98
	ldr r4, _0801CD48  @ gActiveUnit
	ldr r0, [r4]
	cmp r0, #0
	bne _0801CD4C
	bl GetCombinedEnemyWeaponUsabilityBits
	b _0801CD76
	.align 2, 0
_0801CD44: .4byte gKeyStatusPtr
_0801CD48: .4byte gActiveUnit
_0801CD4C:
	bl sub_80844B0
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0801CD5A
	movs r4, #5
	b _0801CDE2
_0801CD5A:
	ldr r0, [r4]
	bl GetUnitSelectionValueThing
	cmp r0, #2
	beq _0801CD80
	ldr r2, [r4]
	ldr r0, [r2, #0xc]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	bne _0801CD80
	adds r0, r2, #0
	bl GetUnitWeaponUsabilityBits
_0801CD76:
	movs r4, #2
	cmp r0, #3
	bne _0801CDE2
	movs r4, #6
	b _0801CDE2
_0801CD80:
	ldr r1, _0801CDBC  @ gUnknown_0202BCB0
	movs r2, #0x14
	ldrsh r0, [r1, r2]
	movs r3, #0x16
	ldrsh r1, [r1, r3]
	bl sub_801D5A8
	lsls r0, r0, #0x18
	movs r4, #0
	cmp r0, #0
	beq _0801CDE2
	movs r4, #1
_0801CD98:
	ldr r0, _0801CDC0  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0801CDC8
	ldr r0, _0801CDC4  @ gActiveUnit
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	movs r1, #0x40
	ands r0, r1
	movs r4, #2
	cmp r0, #0
	beq _0801CDE2
	movs r4, #0
	b _0801CDE2
	.align 2, 0
_0801CDBC: .4byte gUnknown_0202BCB0
_0801CDC0: .4byte gKeyStatusPtr
_0801CDC4: .4byte gActiveUnit
_0801CDC8:
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0801CDD6
	movs r4, #3
	b _0801CDE2
_0801CDD6:
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0801CDE2
	movs r4, #4
_0801CDE2:
	cmp r4, #6
	bls _0801CDE8
	b _0801CFC0
_0801CDE8:
	lsls r0, r4, #2
	ldr r1, _0801CDF4  @ _0801CDF8
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0801CDF4: .4byte _0801CDF8
_0801CDF8: @ jump table
	.4byte _0801CE14 @ case 0
	.4byte _0801CE30 @ case 1
	.4byte _0801CE50 @ case 2
	.4byte _0801CED4 @ case 3
	.4byte _0801CF4C @ case 4
	.4byte _0801CFC0 @ case 5
	.4byte _0801CF90 @ case 6
_0801CE14:
	ldr r0, _0801CE2C  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	bge _0801CE22
	b _0801CFC0
_0801CE22:
	movs r0, #0x6c
	bl m4aSongNumStart
	b _0801CFC0
	.align 2, 0
_0801CE2C: .4byte gRAMChapterData
_0801CE30:
	ldr r0, _0801CE4C  @ gActiveUnitMoveOrigin
	movs r2, #0
	ldrsh r1, [r0, r2]
	movs r3, #2
	ldrsh r2, [r0, r3]
	adds r0, r5, #0
	bl EnsureCameraOntoPosition
	bl HideMoveRangeGraphics
	adds r0, r5, #0
	bl Proc_Break
	b _0801CFE0
	.align 2, 0
_0801CE4C: .4byte gActiveUnitMoveOrigin
_0801CE50:
	ldr r4, _0801CEC4  @ gActiveUnit
	ldr r0, [r4]
	cmp r0, #0
	beq _0801CE90
	bl MU_EndAll
	ldr r2, [r4]
	ldr r0, [r2, #0xc]
	movs r1, #2
	negs r1, r1
	ands r0, r1
	str r0, [r2, #0xc]
	movs r0, #0xb
	ldrsb r0, [r2, r0]
	movs r1, #0xc0
	ands r0, r1
	cmp r0, #0
	bne _0801CE90
	ldr r4, _0801CEC8  @ gActiveUnitMoveOrigin
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
_0801CE90:
	ldr r2, _0801CECC  @ gUnknown_0202BCB0
	ldrb r1, [r2, #4]
	movs r0, #0xf7
	ands r0, r1
	strb r0, [r2, #4]
	bl HideMoveRangeGraphics
	bl RefreshEntityBmMaps
	bl SMS_UpdateFromGameData
	ldr r0, _0801CED0  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0801CEB8
	movs r0, #0x6b
	bl m4aSongNumStart
_0801CEB8:
	adds r0, r5, #0
	movs r1, #9
	bl Proc_Goto
	b _0801CFE0
	.align 2, 0
_0801CEC4: .4byte gActiveUnit
_0801CEC8: .4byte gActiveUnitMoveOrigin
_0801CECC: .4byte gUnknown_0202BCB0
_0801CED0: .4byte gRAMChapterData
_0801CED4:
	bl EventEngineExists
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq _0801CFC0
	ldr r2, _0801CF3C  @ gUnknown_0202BCB0
	movs r3, #0x16
	ldrsh r0, [r2, r3]
	ldr r1, _0801CF40  @ gBmMapUnit
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r3, #0x14
	ldrsh r1, [r2, r3]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r4, [r0]
	ldr r0, _0801CF44  @ gActiveUnitMoveOrigin
	ldr r1, [r0]
	ldr r0, [r2, #0x14]
	cmp r1, r0
	bne _0801CF08
	ldr r0, _0801CF48  @ gActiveUnit
	ldr r0, [r0]
	ldrb r4, [r0, #0xb]
_0801CF08:
	cmp r4, #0
	beq _0801CFC0
	adds r0, r4, #0
	bl GetUnit
	bl sub_801C928
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0801CFC0
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
	b _0801CFE0
	.align 2, 0
_0801CF3C: .4byte gUnknown_0202BCB0
_0801CF40: .4byte gBmMapUnit
_0801CF44: .4byte gActiveUnitMoveOrigin
_0801CF48: .4byte gActiveUnit
_0801CF4C:
	ldr r0, _0801CF84  @ gActiveUnit
	ldr r0, [r0]
	cmp r0, #0
	beq _0801CFC0
	ldr r4, _0801CF88  @ gActiveUnitMoveOrigin
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
	ldr r0, _0801CF8C  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0801CFC0
	movs r0, #0x6b
	bl m4aSongNumStart
	b _0801CFC0
	.align 2, 0
_0801CF84: .4byte gActiveUnit
_0801CF88: .4byte gActiveUnitMoveOrigin
_0801CF8C: .4byte gRAMChapterData
_0801CF90:
	ldr r4, _0801CFB4  @ gUnknown_0202BCB0
	adds r1, r4, #0
	adds r1, #0x3e
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	bl HideMoveRangeGraphics
	ldrb r1, [r4, #4]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _0801CFB8
	adds r0, r5, #0
	movs r1, #0xc
	bl Proc_Goto
	b _0801CFC0
	.align 2, 0
_0801CFB4: .4byte gUnknown_0202BCB0
_0801CFB8:
	adds r0, r5, #0
	movs r1, #0xb
	bl Proc_Goto
_0801CFC0:
	ldr r0, _0801CFE8  @ gActiveUnit
	ldr r0, [r0]
	bl GetUnitSelectionValueThing
	cmp r0, #2
	bne _0801CFD0
	bl sub_8033248
_0801CFD0:
	ldr r1, _0801CFEC  @ gUnknown_0202BCB0
	movs r3, #0x20
	ldrsh r0, [r1, r3]
	movs r2, #0x22
	ldrsh r1, [r1, r2]
	movs r2, #1
	bl DisplayCursor
_0801CFE0:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0801CFE8: .4byte gActiveUnit
_0801CFEC: .4byte gUnknown_0202BCB0

	THUMB_FUNC_END sub_801CD1C

	THUMB_FUNC_START sub_801CFF0
sub_801CFF0: @ 0x0801CFF0

	@ Player Phase Action Cancel

	push {lr}
	ldr r2, _0801D004  @ gActionData
	movs r1, #0
	strb r1, [r2, #0x11]
	movs r1, #2
	bl Proc_Goto
	pop {r0}
	bx r0
	.align 2, 0
_0801D004: .4byte gActionData

	THUMB_FUNC_END sub_801CFF0

	THUMB_FUNC_START sub_801D008
sub_801D008: @ 0x0801D008
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _0801D050  @ gActiveUnit
	ldr r1, [r4]
	ldr r2, _0801D054  @ gActiveUnitMoveOrigin
	ldrh r0, [r2]
	strb r0, [r1, #0x10]
	ldr r1, [r4]
	ldrh r0, [r2, #2]
	strb r0, [r1, #0x11]
	ldr r0, [r4]
	bl UnitFinalizeMovement
	ldr r2, [r4]
	ldr r0, [r2, #0xc]
	movs r1, #2
	negs r1, r1
	ands r0, r1
	str r0, [r2, #0xc]
	bl RefreshEntityBmMaps
	bl RenderBmMap
	bl SMS_UpdateFromGameData
	ldr r4, [r4]
	ldr r0, [r4, #0xc]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	bne _0801D058
	adds r0, r4, #0
	bl UnitBeginAction
	b _0801D05E
	.align 2, 0
_0801D050: .4byte gActiveUnit
_0801D054: .4byte gActiveUnitMoveOrigin
_0801D058:
	adds r0, r4, #0
	bl UnitBeginCantoAction
_0801D05E:
	ldr r4, _0801D080  @ gActiveUnit
	ldr r0, [r4]
	bl HideUnitSMS
	bl MU_EndAll
	ldr r0, [r4]
	bl MU_Create
	adds r0, r5, #0
	movs r1, #1
	bl Proc_Goto
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0801D080: .4byte gActiveUnit

	THUMB_FUNC_END sub_801D008

	THUMB_FUNC_START _6CE_PLAYERPAHSE_PrepareAction
_6CE_PLAYERPAHSE_PrepareAction: @ 0x0801D084
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r4, _0801D0C4  @ gActionData
	ldrb r0, [r4, #0xc]
	bl GetUnit
	movs r5, #0x10
	ldrsb r5, [r0, r5]
	ldrb r0, [r4, #0xc]
	bl GetUnit
	movs r2, #0x11
	ldrsb r2, [r0, r2]
	adds r0, r6, #0
	adds r1, r5, #0
	bl EnsureCameraOntoPosition
	lsls r0, r0, #0x18
	movs r1, #0x80
	lsls r1, r1, #0x11
	eors r1, r0
	lsrs r5, r1, #0x18
	ldrb r0, [r4, #0x11]
	cmp r0, #0x22
	bls _0801D0B8
	b _0801D1C8
_0801D0B8:
	lsls r0, r0, #2
	ldr r1, _0801D0C8  @ _0801D0CC
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0801D0C4: .4byte gActionData
_0801D0C8: .4byte _0801D0CC
_0801D0CC: @ jump table
	.4byte _0801D158 @ case 0
	.4byte _0801D1C8 @ case 1
	.4byte _0801D1C8 @ case 2
	.4byte _0801D1C8 @ case 3
	.4byte _0801D1C8 @ case 4
	.4byte _0801D1C8 @ case 5
	.4byte _0801D1C8 @ case 6
	.4byte _0801D1C8 @ case 7
	.4byte _0801D1C8 @ case 8
	.4byte _0801D1C8 @ case 9
	.4byte _0801D1C8 @ case 10
	.4byte _0801D19C @ case 11
	.4byte _0801D19C @ case 12
	.4byte _0801D1C8 @ case 13
	.4byte _0801D1C8 @ case 14
	.4byte _0801D1C8 @ case 15
	.4byte _0801D1C8 @ case 16
	.4byte _0801D1C8 @ case 17
	.4byte _0801D1C8 @ case 18
	.4byte _0801D1C8 @ case 19
	.4byte _0801D1C8 @ case 20
	.4byte _0801D1C8 @ case 21
	.4byte _0801D1C8 @ case 22
	.4byte _0801D1C8 @ case 23
	.4byte _0801D1C8 @ case 24
	.4byte _0801D1C8 @ case 25
	.4byte _0801D1C8 @ case 26
	.4byte _0801D17E @ case 27
	.4byte _0801D18C @ case 28
	.4byte _0801D1B8 @ case 29
	.4byte _0801D1C8 @ case 30
	.4byte _0801D1C8 @ case 31
	.4byte _0801D1C8 @ case 32
	.4byte _0801D1AC @ case 33
	.4byte _0801D1AC @ case 34
_0801D158:
	ldr r0, _0801D16C  @ gUnknown_0202BCB0
	adds r0, #0x3d
	ldrb r0, [r0]
	cmp r0, #0
	beq _0801D174
	ldr r1, _0801D170  @ gActionData
	movs r0, #0x1f
	strb r0, [r1, #0x11]
	b _0801D1C8
	.align 2, 0
_0801D16C: .4byte gUnknown_0202BCB0
_0801D170: .4byte gActionData
_0801D174:
	adds r0, r6, #0
	bl sub_801D008
	movs r0, #1
	b _0801D234
_0801D17E:
	ldr r0, _0801D188  @ gUnknown_0202BCB0
	adds r0, #0x3d
	ldrb r2, [r0]
	movs r1, #2
	b _0801D1B4
	.align 2, 0
_0801D188: .4byte gUnknown_0202BCB0
_0801D18C:
	ldr r0, _0801D198  @ gUnknown_0202BCB0
	adds r0, #0x3d
	ldrb r2, [r0]
	movs r1, #4
	b _0801D1B4
	.align 2, 0
_0801D198: .4byte gUnknown_0202BCB0
_0801D19C:
	ldr r0, _0801D1A8  @ gUnknown_0202BCB0
	adds r0, #0x3d
	ldrb r2, [r0]
	movs r1, #1
	b _0801D1B4
	.align 2, 0
_0801D1A8: .4byte gUnknown_0202BCB0
_0801D1AC:
	ldr r0, _0801D1C4  @ gUnknown_0202BCB0
	adds r0, #0x3d
	ldrb r2, [r0]
	movs r1, #8
_0801D1B4:
	orrs r1, r2
	strb r1, [r0]
_0801D1B8:
	adds r0, r6, #0
	bl sub_801CFF0
	movs r0, #1
	b _0801D234
	.align 2, 0
_0801D1C4: .4byte gUnknown_0202BCB0
_0801D1C8:
	ldr r4, _0801D200  @ gActionData
	ldrb r0, [r4, #0xc]
	bl GetUnit
	ldrb r1, [r4, #0x12]
	lsls r1, r1, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r0, [r0]
	bl GetItemIndex
	adds r2, r0, #0
	ldr r0, _0801D204  @ gBattleActor
	adds r0, #0x7e
	movs r1, #0
	strb r1, [r0]
	cmp r2, #0x8a
	beq _0801D230
	cmp r2, #0x8a
	bgt _0801D208
	cmp r2, #0x64
	blt _0801D214
	cmp r2, #0x68
	ble _0801D230
	cmp r2, #0x88
	beq _0801D230
	b _0801D214
	.align 2, 0
_0801D200: .4byte gActionData
_0801D204: .4byte gBattleActor
_0801D208:
	cmp r2, #0x97
	blt _0801D214
	cmp r2, #0x99
	ble _0801D230
	cmp r2, #0xc1
	beq _0801D230
_0801D214:
	ldr r1, _0801D23C  @ gActionData
	ldrb r0, [r1, #0x11]
	cmp r0, #1
	beq _0801D230
	ldr r0, _0801D240  @ gUnknown_0202BCB0
	adds r0, #0x3c
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801D230
	movs r0, #1
	strb r0, [r1, #0x16]
	movs r0, #3
	bl SaveSuspendedGame
_0801D230:
	lsls r0, r5, #0x18
	asrs r0, r0, #0x18
_0801D234:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0801D23C: .4byte gActionData
_0801D240: .4byte gUnknown_0202BCB0

	THUMB_FUNC_END _6CE_PLAYERPAHSE_PrepareAction

	THUMB_FUNC_START TryMakeCantoUnit
TryMakeCantoUnit: @ 0x0801D244
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r2, _0801D29C  @ gActiveUnit
	ldr r3, [r2]
	ldr r0, [r3]
	ldr r1, [r3, #4]
	ldr r0, [r0, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	movs r1, #2
	ands r0, r1
	adds r4, r2, #0
	cmp r0, #0
	beq _0801D298
	ldr r0, [r3, #0xc]
	ldr r1, _0801D2A0  @ 0x00010044
	ands r0, r1
	cmp r0, #0
	bne _0801D298
	ldr r0, _0801D2A4  @ gActionData
	ldrb r1, [r0, #0x11]
	adds r2, r0, #0
	cmp r1, #3
	bgt _0801D278
	cmp r1, #1
	bge _0801D298
_0801D278:
	ldr r1, [r4]
	movs r0, #0x1d
	ldrsb r0, [r1, r0]
	ldr r1, [r1, #4]
	ldrb r1, [r1, #0x12]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, r0, r1
	ldrb r2, [r2, #0x10]
	cmp r0, r2
	ble _0801D298
	bl CanUnitMove
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0801D2A8
_0801D298:
	movs r0, #0
	b _0801D2FA
	.align 2, 0
_0801D29C: .4byte gActiveUnit
_0801D2A0: .4byte 0x00010044
_0801D2A4: .4byte gActionData
_0801D2A8:
	ldr r0, _0801D2E8  @ gBmMapRange
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFill
	ldr r0, [r4]
	bl UnitBeginCantoAction
	ldr r2, [r4]
	ldr r0, [r2, #0xc]
	movs r1, #0x40
	orrs r0, r1
	subs r1, #0x43
	ands r0, r1
	str r0, [r2, #0xc]
	bl MU_EndAll
	ldr r0, [r4]
	bl MU_Create
	bl MU_SetDefaultFacing_Auto
	ldr r0, _0801D2EC  @ gRAMChapterData
	ldrb r0, [r0, #0xd]
	cmp r0, #0
	beq _0801D2F0
	adds r0, r5, #0
	movs r1, #4
	bl Proc_Goto
	b _0801D2F8
	.align 2, 0
_0801D2E8: .4byte gBmMapRange
_0801D2EC: .4byte gRAMChapterData
_0801D2F0:
	adds r0, r5, #0
	movs r1, #1
	bl Proc_Goto
_0801D2F8:
	movs r0, #1
_0801D2FA:
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END TryMakeCantoUnit

	THUMB_FUNC_START RunPotentialWaitEvents
RunPotentialWaitEvents: @ 0x0801D300
	push {lr}
	bl CheckForWaitEvents
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0801D310
	movs r0, #1
	b _0801D316
_0801D310:
	bl RunWaitEvents
	movs r0, #0
_0801D316:
	pop {r1}
	bx r1

	THUMB_FUNC_END RunPotentialWaitEvents

	THUMB_FUNC_START EnsureCameraOntoActiveUnitPosition
EnsureCameraOntoActiveUnitPosition: @ 0x0801D31C
	push {lr}
	ldr r1, _0801D340  @ gActiveUnit
	ldr r2, [r1]
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	ldrb r2, [r2, #0x11]
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	bl EnsureCameraOntoPosition
	movs r1, #0
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0801D33A
	movs r1, #1
_0801D33A:
	adds r0, r1, #0
	pop {r1}
	bx r1
	.align 2, 0
_0801D340: .4byte gActiveUnit

	THUMB_FUNC_END EnsureCameraOntoActiveUnitPosition

	THUMB_FUNC_START sub_801D344
sub_801D344: @ 0x0801D344
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _0801D374  @ gRAMChapterData
	ldrb r0, [r0, #0xd]
	cmp r0, #0
	beq _0801D37C
	bl RenderBmMapOnBg2
	ldr r1, _0801D378  @ gActionData
	ldrb r0, [r1, #0xe]
	ldrb r1, [r1, #0xf]
	bl MoveActiveUnit
	bl RefreshEntityBmMaps
	bl RenderBmMap
	movs r0, #0
	bl NewBMXFADE
	bl SMS_UpdateFromGameData
	b _0801D38E
	.align 2, 0
_0801D374: .4byte gRAMChapterData
_0801D378: .4byte gActionData
_0801D37C:
	ldr r1, _0801D3C0  @ gActionData
	ldrb r0, [r1, #0xe]
	ldrb r1, [r1, #0xf]
	bl MoveActiveUnit
	bl RefreshEntityBmMaps
	bl RenderBmMap
_0801D38E:
	ldr r4, _0801D3C4  @ gActiveUnit
	ldr r1, [r4]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	ldrb r1, [r1, #0x11]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl SetCursorMapPosition
	ldr r2, _0801D3C8  @ gRAMChapterData
	ldr r1, _0801D3CC  @ gUnknown_0202BCB0
	ldrh r0, [r1, #0x14]
	strb r0, [r2, #0x12]
	ldrh r0, [r1, #0x16]
	strb r0, [r2, #0x13]
	adds r0, r5, #0
	bl TryMakeCantoUnit
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0801D3D0
	ldr r0, [r4]
	bl HideUnitSMS
	b _0801D3FC
	.align 2, 0
_0801D3C0: .4byte gActionData
_0801D3C4: .4byte gActiveUnit
_0801D3C8: .4byte gRAMChapterData
_0801D3CC: .4byte gUnknown_0202BCB0
_0801D3D0:
	bl sub_8083250
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0801D3F8
	bl MU_EndAll
	bl RefreshEntityBmMaps
	bl RenderBmMap
	bl SMS_UpdateFromGameData
	bl sub_808326C
	adds r0, r5, #0
	movs r1, #8
	bl Proc_Goto
	b _0801D3FC
_0801D3F8:
	bl MU_EndAll
_0801D3FC:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_801D344

	THUMB_FUNC_START sub_801D404
sub_801D404: @ 0x0801D404
	push {lr}
	ldr r0, _0801D42C  @ gRAMChapterData
	ldrb r0, [r0, #0xf]
	cmp r0, #0
	bne _0801D428
	ldr r1, _0801D430  @ gActionData
	ldrb r0, [r1, #0xe]
	ldrb r1, [r1, #0xf]
	bl MoveActiveUnit
	bl RefreshEntityBmMaps
	bl RenderBmMap
	bl SMS_UpdateFromGameData
	bl MU_EndAll
_0801D428:
	pop {r0}
	bx r0
	.align 2, 0
_0801D42C: .4byte gRAMChapterData
_0801D430: .4byte gActionData

	THUMB_FUNC_END sub_801D404

	THUMB_FUNC_START sub_801D434
sub_801D434: @ 0x0801D434
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0801D464  @ gActionData
	ldrb r0, [r0, #0x11]
	cmp r0, #0x1e
	beq _0801D456
	ldr r0, _0801D468  @ gUnitActionMenuDef
	ldr r2, _0801D46C  @ gUnknown_0202BCB0
	movs r3, #0x1c
	ldrsh r1, [r2, r3]
	movs r3, #0xc
	ldrsh r2, [r2, r3]
	subs r1, r1, r2
	movs r2, #1
	movs r3, #0x16
	bl StartSemiCenteredOrphanMenu
_0801D456:
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0801D464: .4byte gActionData
_0801D468: .4byte gUnitActionMenuDef
_0801D46C: .4byte gUnknown_0202BCB0

	THUMB_FUNC_END sub_801D434

	THUMB_FUNC_START PlayerPhase_ApplyUnitMovement
PlayerPhase_ApplyUnitMovement: @ 0x0801D470
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r4, _0801D4D4  @ gActiveUnit
	ldr r1, [r4]
	ldr r5, _0801D4D8  @ gActionData
	ldrb r0, [r5, #0xe]
	strb r0, [r1, #0x10]
	ldr r1, [r4]
	ldrb r0, [r5, #0xf]
	strb r0, [r1, #0x11]
	ldr r0, [r4]
	bl UnitFinalizeMovement
	ldr r0, [r4]
	ldr r0, [r0, #0xc]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	bne _0801D4BA
	ldrb r0, [r5, #0x11]
	cmp r0, #0
	bne _0801D4BA
	ldr r0, _0801D4DC  @ gUnknown_0202BCB0
	adds r0, #0x3d
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801D4BA
	ldrb r0, [r5, #0xf]
	ldr r1, _0801D4E0  @ gBmMapMovement
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r1, [r5, #0xe]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	strb r0, [r5, #0x10]
_0801D4BA:
	bl sub_8003D20
	bl sub_8084508
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _0801D4E4
	adds r0, r6, #0
	bl sub_801D434
	b _0801D508
	.align 2, 0
_0801D4D4: .4byte gActiveUnit
_0801D4D8: .4byte gActionData
_0801D4DC: .4byte gUnknown_0202BCB0
_0801D4E0: .4byte gBmMapMovement
_0801D4E4:
	ldr r0, _0801D510  @ gActionData
	ldrb r0, [r0, #0x11]
	cmp r0, #0x1e
	beq _0801D502
	ldr r0, _0801D514  @ gUnitActionMenuDef
	ldr r2, _0801D518  @ gUnknown_0202BCB0
	movs r3, #0x1c
	ldrsh r1, [r2, r3]
	movs r3, #0xc
	ldrsh r2, [r2, r3]
	subs r1, r1, r2
	movs r2, #1
	movs r3, #0x16
	bl StartSemiCenteredOrphanMenu
_0801D502:
	adds r0, r6, #0
	bl Proc_Break
_0801D508:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0801D510: .4byte gActionData
_0801D514: .4byte gUnitActionMenuDef
_0801D518: .4byte gUnknown_0202BCB0

	THUMB_FUNC_END PlayerPhase_ApplyUnitMovement

	THUMB_FUNC_START GetUnitSelectionValueThing
GetUnitSelectionValueThing: @ 0x0801D51C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0801D548  @ gRAMChapterData
	ldrb r2, [r0, #0xf]
	cmp r4, #0
	beq _0801D556
	ldr r0, _0801D54C  @ gUnknown_0202BCB0
	ldrb r1, [r0, #4]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _0801D552
	ldr r0, [r4]
	ldrb r0, [r0, #4]
	bl CanCharacterBePrepMoved
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0801D550
	movs r0, #4
	b _0801D5A0
	.align 2, 0
_0801D548: .4byte gRAMChapterData
_0801D54C: .4byte gUnknown_0202BCB0
_0801D550:
	movs r2, #0
_0801D552:
	cmp r4, #0
	bne _0801D55A
_0801D556:
	movs r0, #0
	b _0801D5A0
_0801D55A:
	movs r0, #0xb
	ldrsb r0, [r4, r0]
	movs r1, #0xc0
	ands r0, r1
	cmp r0, r2
	bne _0801D59E
	ldr r0, [r4, #0xc]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	bne _0801D584
	ldr r0, [r4]
	ldr r1, [r4, #4]
	ldr r0, [r0, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	movs r1, #0x80
	lsls r1, r1, #0xd
	ands r0, r1
	cmp r0, #0
	beq _0801D588
_0801D584:
	movs r0, #1
	b _0801D5A0
_0801D588:
	adds r0, r4, #0
	adds r0, #0x30
	ldrb r0, [r0]
	movs r1, #0xf
	ands r1, r0
	cmp r1, #2
	beq _0801D59E
	cmp r1, #4
	beq _0801D59E
	movs r0, #2
	b _0801D5A0
_0801D59E:
	movs r0, #3
_0801D5A0:
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END GetUnitSelectionValueThing

	THUMB_FUNC_START sub_801D5A8
sub_801D5A8: @ 0x0801D5A8
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _0801D60C  @ gBmMapUnit
	ldr r0, [r0]
	lsls r1, r5, #2
	adds r0, r1, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801D606
	ldr r0, _0801D610  @ gBmMapMovement
	ldr r0, [r0]
	adds r0, r1, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0x77
	bhi _0801D606
	ldr r0, _0801D614  @ gActiveUnit
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	movs r1, #0x80
	lsls r1, r1, #4
	ands r0, r1
	cmp r0, #0
	beq _0801D61C
	adds r0, r4, #0
	adds r1, r5, #0
	bl GetTrapAt
	adds r2, r0, #0
	ldr r1, _0801D618  @ gActiveUnitMoveOrigin
	movs r3, #0
	ldrsh r0, [r1, r3]
	cmp r4, r0
	bne _0801D5FC
	movs r3, #2
	ldrsh r0, [r1, r3]
	cmp r5, r0
	beq _0801D61C
_0801D5FC:
	cmp r2, #0
	beq _0801D61C
	ldrb r0, [r2, #2]
	cmp r0, #1
	bne _0801D61C
_0801D606:
	movs r0, #0
	b _0801D61E
	.align 2, 0
_0801D60C: .4byte gBmMapUnit
_0801D610: .4byte gBmMapMovement
_0801D614: .4byte gActiveUnit
_0801D618: .4byte gActiveUnitMoveOrigin
_0801D61C:
	movs r0, #1
_0801D61E:
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_801D5A8

	THUMB_FUNC_START sub_801D624
sub_801D624: @ 0x0801D624
	push {lr}
	bl sub_8032C88
	ldr r0, _0801D644  @ gActiveUnit
	ldr r0, [r0]
	movs r1, #0x10
	ldrsb r1, [r0, r1]
	movs r2, #0x11
	ldrsb r2, [r0, r2]
	bl UnitApplyWorkingMovementScript
	ldr r0, _0801D648  @ gWorkingMovementScript
	bl MU_StartMoveScript_Auto
	pop {r0}
	bx r0
	.align 2, 0
_0801D644: .4byte gActiveUnit
_0801D648: .4byte gWorkingMovementScript

	THUMB_FUNC_END sub_801D624

	THUMB_FUNC_START PlayerPhase_WaitForUnitMovement
PlayerPhase_WaitForUnitMovement: @ 0x0801D64C
	push {r4, lr}
	adds r4, r0, #0
	bl MU_IsAnyActive
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0801D660
	adds r0, r4, #0
	bl Proc_Break
_0801D660:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END PlayerPhase_WaitForUnitMovement

	THUMB_FUNC_START sub_801D668
sub_801D668: @ 0x0801D668
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r5, _0801D684  @ gActiveUnit
	ldr r2, [r5]
	cmp r2, #0
	bne _0801D688
	bl RefreshBMapGraphics
	adds r0, r6, #0
	movs r1, #0xc
	bl Proc_Goto
	b _0801D6F4
	.align 2, 0
_0801D684: .4byte gActiveUnit
_0801D688:
	movs r0, #0x11
	ldrsb r0, [r2, r0]
	ldr r4, _0801D6E0  @ gBmMapUnit
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
	ldr r0, [r5]
	ldr r1, [r0, #0xc]
	movs r2, #1
	orrs r1, r2
	str r1, [r0, #0xc]
	bl GetUnitSelectionValueThing
	cmp r0, #2
	beq _0801D6E4
	cmp r0, #3
	beq _0801D6EC
	b _0801D6F4
	.align 2, 0
_0801D6E0: .4byte gBmMapUnit
_0801D6E4:
	ldr r0, [r5]
	bl HideUnitSMS
	b _0801D6F4
_0801D6EC:
	adds r0, r6, #0
	movs r1, #0xb
	bl Proc_Goto
_0801D6F4:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_801D668

	THUMB_FUNC_START sub_801D6FC
sub_801D6FC: @ 0x0801D6FC
	push {lr}
	bl RefreshBMapGraphics
	bl SetDefaultColorEffects
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_801D6FC

	THUMB_FUNC_START MakeMoveunitForActiveUnit
MakeMoveunitForActiveUnit: @ 0x0801D70C
	push {r4, lr}
	bl MU_Exists
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0801D74A
	ldr r4, _0801D754  @ gActiveUnit
	ldr r2, [r4]
	movs r0, #0xb
	ldrsb r0, [r2, r0]
	movs r1, #0xc0
	ands r0, r1
	ldr r1, _0801D758  @ gRAMChapterData
	ldrb r1, [r1, #0xf]
	cmp r0, r1
	bne _0801D74A
	adds r0, r2, #0
	adds r0, #0x30
	ldrb r0, [r0]
	movs r1, #0xf
	ands r1, r0
	cmp r1, #2
	beq _0801D74A
	cmp r1, #4
	beq _0801D74A
	adds r0, r2, #0
	bl MU_Create
	ldr r0, [r4]
	bl HideUnitSMS
_0801D74A:
	bl MU_SetDefaultFacing_Auto
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0801D754: .4byte gActiveUnit
_0801D758: .4byte gRAMChapterData

	THUMB_FUNC_END MakeMoveunitForActiveUnit

	THUMB_FUNC_START ClearActiveUnit
ClearActiveUnit: @ 0x0801D75C
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _0801D7D8  @ gUnknown_0859AAD8
	bl Proc_Find
	cmp r0, #0
	beq _0801D7D2
	movs r1, #9
	bl Proc_Goto
	ldr r4, _0801D7DC  @ gActiveUnit
	ldr r0, [r4]
	cmp r0, #0
	beq _0801D788
	bl MU_EndAll
	ldr r0, [r4]
	ldr r1, [r0, #0xc]
	movs r2, #2
	negs r2, r2
	ands r1, r2
	str r1, [r0, #0xc]
_0801D788:
	ldr r2, _0801D7E0  @ gUnknown_0202BCB0
	ldrb r1, [r2, #4]
	movs r0, #0xf7
	ands r0, r1
	strb r0, [r2, #4]
	bl HideMoveRangeGraphics
	bl RefreshEntityBmMaps
	bl SMS_UpdateFromGameData
	adds r0, r5, #0
	bl UnitBeginAction
	ldr r2, [r4]
	ldr r0, [r2, #0xc]
	movs r1, #2
	negs r1, r1
	ands r0, r1
	str r0, [r2, #0xc]
	ldr r1, _0801D7E4  @ gActiveUnitMoveOrigin
	movs r0, #0x10
	ldrsb r0, [r2, r0]
	strh r0, [r1]
	movs r0, #0x11
	ldrsb r0, [r2, r0]
	strh r0, [r1, #2]
	movs r2, #0
	ldrsh r0, [r1, r2]
	movs r2, #2
	ldrsh r1, [r1, r2]
	bl SetCursorMapPosition
	bl RefreshEntityBmMaps
	bl SMS_UpdateFromGameData
_0801D7D2:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0801D7D8: .4byte gUnknown_0859AAD8
_0801D7DC: .4byte gActiveUnit
_0801D7E0: .4byte gUnknown_0202BCB0
_0801D7E4: .4byte gActiveUnitMoveOrigin

	THUMB_FUNC_END ClearActiveUnit

	THUMB_FUNC_START sub_801D7E8
sub_801D7E8: @ 0x0801D7E8
	push {lr}
	ldr r0, _0801D80C  @ gUnknown_0859AAD8
	bl Proc_Find
	adds r2, r0, #0
	cmp r2, #0
	beq _0801D806
	ldr r1, [r2, #0xc]
	ldr r0, _0801D810  @ sub_801CD1C
	cmp r1, r0
	bne _0801D806
	ldr r1, _0801D814  @ sub_801D818
	adds r0, r2, #0
	bl Proc_SetRepeatCb
_0801D806:
	pop {r0}
	bx r0
	.align 2, 0
_0801D80C: .4byte gUnknown_0859AAD8
_0801D810: .4byte sub_801CD1C
_0801D814: .4byte sub_801D818

	THUMB_FUNC_END sub_801D7E8

	THUMB_FUNC_START sub_801D818
sub_801D818: @ 0x0801D818
	push {lr}
	ldr r1, _0801D830  @ gKeyStatusPtr
	ldr r2, [r1]
	movs r3, #0
	movs r1, #1
	strh r1, [r2, #8]
	strh r3, [r2, #6]
	bl sub_801CD1C
	pop {r0}
	bx r0
	.align 2, 0
_0801D830: .4byte gKeyStatusPtr

	THUMB_FUNC_END sub_801D818

	THUMB_FUNC_START sub_801D834
sub_801D834: @ 0x0801D834
	push {r4, r5, lr}
	ldr r5, _0801D890  @ gActiveUnit
	ldr r2, [r5]
	ldr r0, [r2]
	ldr r3, [r2, #4]
	ldr r0, [r0, #0x28]
	ldr r1, [r3, #0x28]
	orrs r0, r1
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	beq _0801D888
	ldr r0, [r2, #0xc]
	ldr r1, _0801D894  @ 0x00010044
	ands r0, r1
	cmp r0, #0
	bne _0801D888
	ldr r4, _0801D898  @ gActionData
	ldrb r0, [r4, #0x11]
	subs r0, #2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bls _0801D888
	movs r0, #0x1d
	ldrsb r0, [r2, r0]
	movs r1, #0x12
	ldrsb r1, [r3, r1]
	adds r0, r0, r1
	ldrb r4, [r4, #0x10]
	cmp r0, r4
	ble _0801D888
	bl CanUnitMove
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0801D888
	ldr r0, [r5]
	ldr r1, [r0, #0xc]
	movs r2, #0x40
	orrs r1, r2
	str r1, [r0, #0xc]
_0801D888:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0801D890: .4byte gActiveUnit
_0801D894: .4byte 0x00010044
_0801D898: .4byte gActionData

	THUMB_FUNC_END sub_801D834

	THUMB_FUNC_START Load6CRangeDisplaySquareGfx
Load6CRangeDisplaySquareGfx: @ 0x0801D89C
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r5, _0801D8C4  @ gUnknown_08A02EB4
	ldr r1, _0801D8C8  @ 0x06005080
	adds r0, r5, #0
	movs r2, #0x80
	bl RegisterTileGraphics
	ldr r0, _0801D8CC  @ gUnknown_0202BCB0
	ldrb r1, [r0, #4]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _0801D8D0
	adds r1, r4, #0
	adds r1, #0x4c
	movs r0, #2
	strh r0, [r1]
	b _0801D8E0
	.align 2, 0
_0801D8C4: .4byte gUnknown_08A02EB4
_0801D8C8: .4byte 0x06005080
_0801D8CC: .4byte gUnknown_0202BCB0
_0801D8D0:
	ldr r1, _0801D8E8  @ 0x06005000
	adds r0, r5, #0
	movs r2, #0x80
	bl RegisterTileGraphics
	adds r0, r4, #0
	bl Proc_End
_0801D8E0:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0801D8E8: .4byte 0x06005000

	THUMB_FUNC_END Load6CRangeDisplaySquareGfx

	THUMB_FUNC_START Loop6C_MLVCHC
Loop6C_MLVCHC: @ 0x0801D8EC
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r1, _0801D924  @ gUnknown_0859AD08
	adds r4, r5, #0
	adds r4, #0x4c
	movs r2, #0
	ldrsh r0, [r4, r2]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r1, _0801D928  @ 0x06005000
	movs r2, #0x80
	bl RegisterTileGraphics
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #8
	bne _0801D91C
	adds r0, r5, #0
	bl Proc_Break
_0801D91C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0801D924: .4byte gUnknown_0859AD08
_0801D928: .4byte 0x06005000

	THUMB_FUNC_END Loop6C_MLVCHC

	THUMB_FUNC_START Setup6CRangeDisplayGfx
Setup6CRangeDisplayGfx: @ 0x0801D92C
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	ldr r2, _0801D9D0  @ gLCDControlBuffer
	ldrb r1, [r2, #1]
	movs r0, #0x21
	negs r0, r0
	ands r0, r1
	movs r1, #0x41
	negs r1, r1
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r2, #1]
	ldr r4, _0801D9D4  @ gUnknown_0202BCB0
	ldrb r1, [r4, #4]
	movs r0, #1
	orrs r0, r1
	strb r0, [r4, #4]
	bl RenderBmMap
	movs r5, #9
	adds r7, r4, #0
_0801D958:
	movs r4, #0xe
	subs r6, r5, #1
_0801D95C:
	movs r0, #0x24
	ldrsh r1, [r7, r0]
	adds r1, r1, r4
	movs r0, #0x26
	ldrsh r2, [r7, r0]
	adds r2, r2, r5
	str r5, [sp]
	ldr r0, _0801D9D8  @ gBG2TilemapBuffer
	adds r3, r4, #0
	bl DisplayMovementViewTile
	subs r4, #1
	cmp r4, #0
	bge _0801D95C
	adds r5, r6, #0
	cmp r5, #0
	bge _0801D958
	movs r0, #4
	bl BG_EnableSyncByMask
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	movs r0, #1
	movs r1, #0xa
	movs r2, #6
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	movs r0, #0
	str r0, [sp]
	movs r1, #0
	movs r2, #1
	movs r3, #0
	bl sub_8001ED0
	movs r0, #0
	bl sub_8001F48
	movs r0, #1
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #1
	bl sub_8001F0C
	movs r0, #1
	bl sub_8001F64
	bl SetupBackgroundForWeatherMaybe
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801D9D0: .4byte gLCDControlBuffer
_0801D9D4: .4byte gUnknown_0202BCB0
_0801D9D8: .4byte gBG2TilemapBuffer

	THUMB_FUNC_END Setup6CRangeDisplayGfx

	THUMB_FUNC_START Loop6C_MoveLimitView
Loop6C_MoveLimitView: @ 0x0801D9DC
	push {r4, r5, lr}
	adds r4, r0, #0
	bl GetGameClock
	lsrs r5, r0, #1
	movs r0, #0x1f
	ands r5, r0
	adds r4, #0x4a
	ldrh r1, [r4]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0801DA04
	lsls r0, r5, #1
	ldr r1, _0801DA54  @ gUnknown_08A02F34
	adds r0, r0, r1
	movs r1, #0x82
	movs r2, #0x20
	bl CopyToPaletteBuffer
_0801DA04:
	ldrh r1, [r4]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0801DA1C
	lsls r0, r5, #1
	ldr r1, _0801DA58  @ gUnknown_08A02F94
	adds r0, r0, r1
	movs r1, #0xa2
	movs r2, #0x20
	bl CopyToPaletteBuffer
_0801DA1C:
	ldrh r1, [r4]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _0801DA34
	lsls r0, r5, #1
	ldr r1, _0801DA5C  @ gUnknown_08A02FF4
	adds r0, r0, r1
	movs r1, #0xa2
	movs r2, #0x20
	bl CopyToPaletteBuffer
_0801DA34:
	ldrh r1, [r4]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _0801DA4C
	lsls r0, r5, #1
	ldr r1, _0801DA54  @ gUnknown_08A02F34
	adds r0, r0, r1
	movs r1, #0xa2
	movs r2, #0x20
	bl CopyToPaletteBuffer
_0801DA4C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0801DA54: .4byte gUnknown_08A02F34
_0801DA58: .4byte gUnknown_08A02F94
_0801DA5C: .4byte gUnknown_08A02FF4

	THUMB_FUNC_END Loop6C_MoveLimitView

	THUMB_FUNC_START DestructMoveLimitView
DestructMoveLimitView: @ 0x0801DA60
	push {lr}
	adds r0, #0x4a
	ldrh r1, [r0]
	movs r0, #0x11
	ands r0, r1
	cmp r0, #0
	beq _0801DA7C
	ldr r0, _0801DA90  @ gBG2TilemapBuffer
	movs r1, #0
	bl BG_Fill
	movs r0, #4
	bl BG_EnableSyncByMask
_0801DA7C:
	ldr r2, _0801DA94  @ gUnknown_0202BCB0
	ldrb r1, [r2, #4]
	movs r0, #0xfc
	ands r0, r1
	strb r0, [r2, #4]
	bl SetupBackgroundForWeatherMaybe
	pop {r0}
	bx r0
	.align 2, 0
_0801DA90: .4byte gBG2TilemapBuffer
_0801DA94: .4byte gUnknown_0202BCB0

	THUMB_FUNC_END DestructMoveLimitView

	THUMB_FUNC_START DisplayMoveRangeGraphics
DisplayMoveRangeGraphics: @ 0x0801DA98
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _0801DAB4  @ gUnknown_0859AD50
	adds r0, r4, #0
	bl Proc_Find
	cmp r0, #0
	beq _0801DAB8
	bl Setup6CRangeDisplayGfx
	movs r0, #0
	bl Load6CRangeDisplaySquareGfx
	b _0801DAC4
	.align 2, 0
_0801DAB4: .4byte gUnknown_0859AD50
_0801DAB8:
	adds r0, r4, #0
	movs r1, #4
	bl Proc_Start
	adds r0, #0x4a
	strh r5, [r0]
_0801DAC4:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END DisplayMoveRangeGraphics

	THUMB_FUNC_START HideMoveRangeGraphics
HideMoveRangeGraphics: @ 0x0801DACC
	push {lr}
	ldr r0, _0801DAD8  @ gUnknown_0859AD50
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
_0801DAD8: .4byte gUnknown_0859AD50

	THUMB_FUNC_END HideMoveRangeGraphics

	THUMB_FUNC_START sub_801DADC
sub_801DADC: @ 0x0801DADC
	push {r4, lr}
	bl GetUnit
	adds r4, r0, #0
	cmp r4, #0
	beq _0801DB0A
	ldr r0, [r4]
	cmp r0, #0
	beq _0801DB0A
	ldr r0, [r4, #0xc]
	ldr r1, _0801DB10  @ 0x00010007
	ands r0, r1
	cmp r0, #0
	bne _0801DB0A
	adds r0, r4, #0
	adds r0, #0x30
	ldrb r0, [r0]
	movs r1, #0xf
	ands r1, r0
	cmp r1, #4
	beq _0801DB0A
	cmp r1, #2
	bne _0801DB14
_0801DB0A:
	movs r0, #0
	b _0801DB3E
	.align 2, 0
_0801DB10: .4byte 0x00010007
_0801DB14:
	ldr r0, _0801DB44  @ gUnknown_0859AAD8
	bl Proc_Find
	cmp r0, #0
	bne _0801DB24
	ldr r0, _0801DB48  @ gUnknown_0859DBBC
	bl Proc_Find
_0801DB24:
	movs r1, #0x10
	ldrsb r1, [r4, r1]
	movs r2, #0x11
	ldrsb r2, [r4, r2]
	bl EnsureCameraOntoPosition
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	bl SetCursorMapPosition
	movs r0, #1
_0801DB3E:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0801DB44: .4byte gUnknown_0859AAD8
_0801DB48: .4byte gUnknown_0859DBBC

	THUMB_FUNC_END sub_801DADC

	THUMB_FUNC_START sub_801DB4C
sub_801DB4C: @ 0x0801DB4C
	push {r4, r5, lr}
	ldr r2, _0801DBA0  @ gBmMapUnit
	ldr r2, [r2]
	lsls r1, r1, #2
	adds r1, r1, r2
	ldr r1, [r1]
	adds r1, r1, r0
	ldrb r5, [r1]
	movs r0, #0xc0
	ands r0, r5
	cmp r0, #0
	beq _0801DB66
	movs r5, #0
_0801DB66:
	adds r5, #1
	adds r4, r5, #0
	cmp r5, #0x3e
	bgt _0801DB80
_0801DB6E:
	adds r0, r4, #0
	bl sub_801DADC
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0801DB98
	adds r4, #1
	cmp r4, #0x3e
	ble _0801DB6E
_0801DB80:
	movs r4, #1
	cmp r4, r5
	bgt _0801DB98
_0801DB86:
	adds r0, r4, #0
	bl sub_801DADC
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0801DB98
	adds r4, #1
	cmp r4, r5
	ble _0801DB86
_0801DB98:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0801DBA0: .4byte gBmMapUnit

	THUMB_FUNC_END sub_801DB4C

	THUMB_FUNC_START Goto3IfPhaseHasNoAbleUnits
Goto3IfPhaseHasNoAbleUnits: @ 0x0801DBA4
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _0801DBD0  @ gRAMChapterData
	adds r0, r1, #0
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x19
	cmp r0, #0
	blt _0801DBC8
	ldrb r0, [r1, #0xf]
	bl GetPhaseAbleUnitCount
	cmp r0, #0
	bne _0801DBC8
	adds r0, r4, #0
	movs r1, #3
	bl Proc_Goto
_0801DBC8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0801DBD0: .4byte gRAMChapterData

@ align with 0 (not nop)
	THUMB_FUNC_END Goto3IfPhaseHasNoAbleUnits

.align 2, 0
