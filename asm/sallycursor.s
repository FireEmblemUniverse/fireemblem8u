	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	@ Prep Screen!

	THUMB_FUNC_START sub_8033BF8
sub_8033BF8: @ 0x08033BF8
	push {lr}
	ldr r0, _08033C0C  @ gUnknown_0859DBBC
	bl Proc_Find
	movs r1, #0x33
	bl Proc_Goto
	movs r0, #0x17
	pop {r1}
	bx r1
	.align 2, 0
_08033C0C: .4byte gUnknown_0859DBBC

	THUMB_FUNC_END sub_8033BF8

	THUMB_FUNC_START SALLYCURSOR6C_StartUnitSwap
SALLYCURSOR6C_StartUnitSwap: @ 0x08033C10
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _08033C7C  @ gUnknown_085A0EA0
	movs r1, #0
	bl AP_Create
	adds r4, r0, #0
	movs r0, #0
	strh r0, [r4, #0x22]
	adds r0, r4, #0
	movs r1, #0
	bl AP_SwitchAnimation
	str r4, [r5, #0x54]
	adds r1, r5, #0
	adds r1, #0x4a
	movs r0, #2
	strh r0, [r1]
	ldr r1, _08033C80  @ gUnknown_0202BCB0
	movs r2, #0x14
	ldrsh r0, [r1, r2]
	str r0, [r5, #0x3c]
	movs r2, #0x16
	ldrsh r0, [r1, r2]
	str r0, [r5, #0x40]
	ldr r0, _08033C84  @ 0x00000872
	bl GetStringFromIndex
	adds r1, r0, #0
	adds r0, r5, #0
	bl NewBottomHelpText
	ldr r0, _08033C88  @ gActiveUnit
	ldr r0, [r0]
	movs r1, #0x10
	ldrsb r1, [r0, r1]
	movs r2, #0x11
	ldrsb r2, [r0, r2]
	adds r0, r5, #0
	bl EnsureCameraOntoPosition
	ldr r0, _08033C8C  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08033C74
	movs r0, #0x69
	bl m4aSongNumStart
_08033C74:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08033C7C: .4byte gUnknown_085A0EA0
_08033C80: .4byte gUnknown_0202BCB0
_08033C84: .4byte 0x00000872
_08033C88: .4byte gActiveUnit
_08033C8C: .4byte gRAMChapterData

	THUMB_FUNC_END SALLYCURSOR6C_StartUnitSwap

	THUMB_FUNC_START sub_8033C90
sub_8033C90: @ 0x08033C90
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r6, _08033D28  @ gUnknown_0202BCB0
	movs r0, #0x16
	ldrsh r1, [r6, r0]
	ldr r0, _08033D2C  @ gBmMapRange
	ldr r0, [r0]
	lsls r1, r1, #2
	adds r0, r1, r0
	movs r3, #0x14
	ldrsh r2, [r6, r3]
	ldr r0, [r0]
	adds r0, r0, r2
	ldrb r7, [r0]
	ldr r0, _08033D30  @ gBmMapUnit
	ldr r0, [r0]
	adds r1, r1, r0
	ldr r0, [r1]
	adds r0, r0, r2
	ldrb r0, [r0]
	bl GetUnit
	bl GetUnitSelectionValueThing
	cmp r0, #4
	bne _08033CC8
	movs r7, #0
_08033CC8:
	bl HandlePlayerCursorMovement
	ldr r0, [r4, #0x3c]
	lsls r0, r0, #4
	movs r5, #0xc
	ldrsh r1, [r6, r5]
	subs r5, r0, r1
	ldr r0, [r4, #0x40]
	lsls r0, r0, #4
	movs r2, #0xe
	ldrsh r1, [r6, r2]
	subs r2, r0, r1
	adds r1, r5, #0
	adds r1, #0x10
	movs r0, #0x80
	lsls r0, r0, #1
	cmp r1, r0
	bhi _08033D04
	adds r0, r2, #0
	adds r0, #0x20
	cmp r0, #0xc0
	bhi _08033D04
	subs r2, #0xc
	ldr r3, _08033D34  @ gObject_16x16
	movs r0, #6
	str r0, [sp]
	movs r0, #4
	adds r1, r5, #0
	bl PutSprite
_08033D04:
	ldr r0, _08033D38  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08033D54
	cmp r7, #0
	beq _08033D3C
	ldr r0, [r4, #0x54]
	bl AP_Delete
	adds r0, r4, #0
	bl Proc_Break
	bl DeleteEach6CBB
	b _08033DCA
	.align 2, 0
_08033D28: .4byte gUnknown_0202BCB0
_08033D2C: .4byte gBmMapRange
_08033D30: .4byte gBmMapUnit
_08033D34: .4byte gObject_16x16
_08033D38: .4byte gKeyStatusPtr
_08033D3C:
	ldr r0, _08033D50  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08033DCA
	movs r0, #0x6c
	bl m4aSongNumStart
	b _08033DCA
	.align 2, 0
_08033D50: .4byte gRAMChapterData
_08033D54:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08033D88
	ldr r0, [r4, #0x54]
	bl AP_Delete
	adds r0, r4, #0
	movs r1, #4
	bl Proc_Goto
	bl DeleteEach6CBB
	ldr r0, _08033D84  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08033DCA
	movs r0, #0x6b
	bl m4aSongNumStart
	b _08033DCA
	.align 2, 0
_08033D84: .4byte gRAMChapterData
_08033D88:
	lsls r0, r7, #0x18
	asrs r3, r0, #0x18
	adds r1, r4, #0
	adds r1, #0x4a
	movs r5, #0
	ldrsh r2, [r1, r5]
	adds r6, r0, #0
	adds r5, r1, #0
	cmp r3, r2
	beq _08033DAA
	ldr r0, [r4, #0x54]
	movs r1, #0
	cmp r3, #0
	bne _08033DA6
	movs r1, #1
_08033DA6:
	bl AP_SwitchAnimation
_08033DAA:
	ldr r0, [r4, #0x54]
	ldr r3, _08033DD4  @ gUnknown_0202BCB0
	movs r2, #0x20
	ldrsh r1, [r3, r2]
	movs r4, #0xc
	ldrsh r2, [r3, r4]
	subs r1, r1, r2
	movs r4, #0x22
	ldrsh r2, [r3, r4]
	movs r4, #0xe
	ldrsh r3, [r3, r4]
	subs r2, r2, r3
	bl AP_Update
	asrs r0, r6, #0x18
	strh r0, [r5]
_08033DCA:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08033DD4: .4byte gUnknown_0202BCB0

	THUMB_FUNC_END sub_8033C90

	THUMB_FUNC_START sub_8033DD8
sub_8033DD8: @ 0x08033DD8
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _08033E04  @ gActiveUnit
	ldr r1, [r4]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	ldrb r1, [r1, #0x11]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl SetCursorMapPosition
	ldr r0, [r4]
	movs r1, #0x10
	ldrsb r1, [r0, r1]
	movs r2, #0x11
	ldrsb r2, [r0, r2]
	adds r0, r5, #0
	bl EnsureCameraOntoPosition
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08033E04: .4byte gActiveUnit

	THUMB_FUNC_END sub_8033DD8

	THUMB_FUNC_START sub_8033E08
sub_8033E08: @ 0x08033E08
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	ldr r0, _08033E44  @ gActiveUnit
	ldr r5, [r0]
	ldr r6, _08033E48  @ gUnknown_0202BCB0
	movs r1, #0x16
	ldrsh r0, [r6, r1]
	ldr r1, _08033E4C  @ gBmMapUnit
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r2, #0x14
	ldrsh r1, [r6, r2]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	bl GetUnit
	adds r4, r0, #0
	cmp r4, #0
	bne _08033E50
	movs r0, #0x14
	ldrsh r2, [r6, r0]
	movs r1, #0x16
	ldrsh r3, [r6, r1]
	adds r0, r7, #0
	adds r1, r5, #0
	bl sub_801EC10
	b _08033E70
	.align 2, 0
_08033E44: .4byte gActiveUnit
_08033E48: .4byte gUnknown_0202BCB0
_08033E4C: .4byte gBmMapUnit
_08033E50:
	movs r2, #0x10
	ldrsb r2, [r4, r2]
	movs r3, #0x11
	ldrsb r3, [r4, r3]
	adds r0, r7, #0
	adds r1, r5, #0
	bl sub_801EC10
	movs r2, #0x10
	ldrsb r2, [r5, r2]
	movs r3, #0x11
	ldrsb r3, [r5, r3]
	adds r0, r7, #0
	adds r1, r4, #0
	bl sub_801EC10
_08033E70:
	ldr r0, _08033E88  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08033E82
	movs r0, #0x61
	bl m4aSongNumStart
_08033E82:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08033E88: .4byte gRAMChapterData

	THUMB_FUNC_END sub_8033E08

	THUMB_FUNC_START sub_8033E8C
sub_8033E8C: @ 0x08033E8C
	push {lr}
	ldr r0, _08033EA0  @ gRAMChapterData
	ldrb r0, [r0, #0xd]
	cmp r0, #0
	beq _08033E9A
	bl RenderBmMapOnBg2
_08033E9A:
	pop {r0}
	bx r0
	.align 2, 0
_08033EA0: .4byte gRAMChapterData

	THUMB_FUNC_END sub_8033E8C

	THUMB_FUNC_START sub_8033EA4
sub_8033EA4: @ 0x08033EA4
	push {lr}
	ldr r0, _08033EBC  @ gRAMChapterData
	ldrb r0, [r0, #0xd]
	cmp r0, #0
	beq _08033EB8
	bl RenderBmMap
	movs r0, #0
	bl NewBMXFADE
_08033EB8:
	pop {r0}
	bx r0
	.align 2, 0
_08033EBC: .4byte gRAMChapterData

	THUMB_FUNC_END sub_8033EA4

	THUMB_FUNC_START sub_8033EC0
sub_8033EC0: @ 0x08033EC0
	push {lr}
	adds r1, r0, #0
	ldr r0, _08033ED0  @ gUnknown_08A2ED88
	bl Proc_StartBlocking
	pop {r0}
	bx r0
	.align 2, 0
_08033ED0: .4byte gUnknown_08A2ED88

	THUMB_FUNC_END sub_8033EC0

	THUMB_FUNC_START CallCursorShop
CallCursorShop: @ 0x08033ED4
	push {r4, lr}
	sub sp, #0x1c
	adds r4, r0, #0
	ldr r0, _08033F0C  @ gRAMChapterData
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetChapterEventDataPointer
	ldr r0, [r0, #8]
	str r0, [sp]
	mov r1, sp
	ldr r2, _08033F10  @ gUnknown_0202BCB0
	ldrh r0, [r2, #0x14]
	strb r0, [r1, #0x18]
	ldrh r0, [r2, #0x16]
	strb r0, [r1, #0x19]
	mov r0, sp
	bl CheckForEvents
	cmp r0, #0
	beq _08033F2A
	ldr r0, [sp, #0xc]
	cmp r0, #0x16
	beq _08033F14
	cmp r0, #0x17
	beq _08033F20
	b _08033F2A
	.align 2, 0
_08033F0C: .4byte gRAMChapterData
_08033F10: .4byte gUnknown_0202BCB0
_08033F14:
	ldr r1, [sp, #4]
	movs r0, #0
	adds r2, r4, #0
	bl MakeShopArmory
	b _08033F2A
_08033F20:
	ldr r1, [sp, #4]
	movs r0, #0
	adds r2, r4, #0
	bl MakeShopVendor
_08033F2A:
	add sp, #0x1c
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END CallCursorShop

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
