	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	THUMB_FUNC_START LoadObjUIGfx
LoadObjUIGfx: @ 0x08015680
	push {r4, lr}
	ldr r0, _080156AC  @ gUnknown_0859E8E0
	ldr r4, _080156B0  @ gUnknown_02020188
	adds r1, r4, #0
	bl CopyDataWithPossibleUncomp
	ldr r1, _080156B4  @ 0x06010000
	adds r0, r4, #0
	movs r2, #0x12
	movs r3, #4
	bl CopyTileGfxForObj
	ldr r0, _080156B8  @ gUnknown_0859ED70
	movs r1, #0x80
	lsls r1, r1, #2
	movs r2, #0x40
	bl CopyToPaletteBuffer
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080156AC: .4byte gUnknown_0859E8E0
_080156B0: .4byte gUnknown_02020188
_080156B4: .4byte 0x06010000
_080156B8: .4byte gUnknown_0859ED70

	THUMB_FUNC_END LoadObjUIGfx

	THUMB_FUNC_START sub_80156BC
sub_80156BC: @ 0x080156BC
	push {lr}
	ldr r0, _080156D0  @ gUnknown_0859ED70
	movs r1, #0x80
	lsls r1, r1, #2
	movs r2, #0x40
	bl CopyToPaletteBuffer
	pop {r0}
	bx r0
	.align 2, 0
_080156D0: .4byte gUnknown_0859ED70

	THUMB_FUNC_END sub_80156BC

	THUMB_FUNC_START sub_80156D4
sub_80156D4: @ 0x080156D4
	push {lr}
	bl Font_InitForUIDefault
	bl LoadLegacyUiFrameGraphics
	bl ResetFaces
	bl ResetIconGraphics_
	movs r0, #4
	bl LoadIconPalettes
	bl LoadObjUIGfx
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80156D4

	THUMB_FUNC_START LoadGameCoreGfx
LoadGameCoreGfx: @ 0x080156F4
	push {lr}
	bl Font_InitForUIDefault
	bl LoadUiFrameGraphics
	bl ResetFaces
	bl ResetIconGraphics_
	movs r0, #4
	bl LoadIconPalettes
	bl LoadObjUIGfx
	pop {r0}
	bx r0

	THUMB_FUNC_END LoadGameCoreGfx

	THUMB_FUNC_START HandleCursorMovement
HandleCursorMovement: @ 0x08015714
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	mov ip, r1
	lsrs r7, r0, #0x14
	movs r0, #0xf
	ands r7, r0
	ldr r3, _08015814  @ gUnknown_0202BCB0
	ldr r4, _08015818  @ gUnknown_0859A438
	lsls r2, r7, #1
	adds r0, r2, r4
	movs r1, #0
	ldrsb r1, [r0, r1]
	ldrh r0, [r3, #0x14]
	adds r1, r1, r0
	lsls r1, r1, #0x10
	adds r0, r4, #1
	adds r2, r2, r0
	movs r0, #0
	ldrsb r0, [r2, r0]
	ldrh r2, [r3, #0x16]
	adds r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r6, r1, #0x10
	orrs r6, r0
	ldrb r1, [r3, #4]
	movs r0, #2
	ands r0, r1
	adds r5, r3, #0
	cmp r0, #0
	beq _08015792
	movs r3, #0x16
	ldrsh r0, [r5, r3]
	ldr r1, _0801581C  @ gBmMapMovement
	ldr r2, [r1]
	lsls r0, r0, #2
	adds r0, r0, r2
	movs r3, #0x14
	ldrsh r1, [r5, r3]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0x77
	bhi _08015792
	asrs r0, r6, #0x10
	lsls r0, r0, #2
	adds r0, r0, r2
	lsls r1, r6, #0x10
	asrs r1, r1, #0x10
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0x77
	bls _08015792
	movs r1, #0xf0
	ldr r0, _08015820  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r2, [r0, #8]
	mov r0, ip
	ands r0, r1
	ands r1, r2
	cmp r0, r1
	bne _08015832
_08015792:
	lsls r0, r6, #0x10
	asrs r1, r0, #0x10
	cmp r1, #0
	blt _080157BC
	ldr r0, _08015824  @ gBmMapSize
	movs r2, #0
	ldrsh r0, [r0, r2]
	cmp r1, r0
	bge _080157BC
	lsls r0, r7, #1
	adds r0, r0, r4
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #4
	ldrh r3, [r5, #0x1c]
	adds r0, r0, r3
	strh r0, [r5, #0x1c]
	ldrh r0, [r5, #0x14]
	strh r0, [r5, #0x18]
	strh r6, [r5, #0x14]
_080157BC:
	asrs r2, r6, #0x10
	adds r1, r2, #0
	cmp r1, #0
	blt _080157E8
	ldr r0, _08015824  @ gBmMapSize
	movs r3, #2
	ldrsh r0, [r0, r3]
	cmp r1, r0
	bge _080157E8
	lsls r0, r7, #1
	adds r1, r4, #1
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #4
	ldrh r1, [r5, #0x1e]
	adds r0, r0, r1
	strh r0, [r5, #0x1e]
	ldrh r0, [r5, #0x16]
	strh r0, [r5, #0x1a]
	strh r2, [r5, #0x16]
_080157E8:
	ldrb r1, [r5, #4]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	bne _0801582C
	ldr r1, [r5, #0x14]
	ldr r0, [r5, #0x18]
	cmp r1, r0
	beq _08015832
	ldr r0, _08015828  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0801580C
	movs r0, #0x65
	bl m4aSongNumStart
_0801580C:
	ldrb r0, [r5, #4]
	movs r1, #4
	orrs r0, r1
	b _08015830
	.align 2, 0
_08015814: .4byte gUnknown_0202BCB0
_08015818: .4byte gUnknown_0859A438
_0801581C: .4byte gBmMapMovement
_08015820: .4byte gKeyStatusPtr
_08015824: .4byte gBmMapSize
_08015828: .4byte gRAMChapterData
_0801582C:
	movs r0, #0xfb
	ands r0, r1
_08015830:
	strb r0, [r5, #4]
_08015832:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END HandleCursorMovement

	THUMB_FUNC_START MoveCameraByStepMaybe
MoveCameraByStepMaybe: @ 0x08015838
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r2, _08015888  @ gUnknown_0202BCB0
	ldrh r3, [r2, #0x20]
	movs r0, #0x20
	ldrsh r1, [r2, r0]
	movs r5, #0x1c
	ldrsh r0, [r2, r5]
	cmp r1, r0
	bge _08015850
	adds r0, r3, r4
	strh r0, [r2, #0x20]
_08015850:
	ldrh r3, [r2, #0x20]
	movs r0, #0x20
	ldrsh r1, [r2, r0]
	movs r5, #0x1c
	ldrsh r0, [r2, r5]
	cmp r1, r0
	ble _08015862
	subs r0, r3, r4
	strh r0, [r2, #0x20]
_08015862:
	ldrh r3, [r2, #0x22]
	movs r1, #0x22
	ldrsh r0, [r2, r1]
	movs r5, #0x1e
	ldrsh r1, [r2, r5]
	cmp r0, r1
	bge _08015874
	adds r0, r3, r4
	strh r0, [r2, #0x22]
_08015874:
	ldrh r3, [r2, #0x22]
	movs r5, #0x22
	ldrsh r0, [r2, r5]
	cmp r0, r1
	ble _08015882
	subs r0, r3, r4
	strh r0, [r2, #0x22]
_08015882:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08015888: .4byte gUnknown_0202BCB0

	THUMB_FUNC_END MoveCameraByStepMaybe

	THUMB_FUNC_START sub_801588C
sub_801588C: @ 0x0801588C
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	movs r6, #0
	ldr r1, _080158B4  @ gUnknown_0202BCB0
	movs r0, #0x20
	ldrsh r3, [r1, r0]
	movs r2, #0x22
	ldrsh r5, [r1, r2]
	movs r2, #0xc
	ldrsh r0, [r1, r2]
	adds r0, #0x30
	adds r2, r1, #0
	cmp r0, r3
	ble _080158D0
	adds r0, r3, #0
	subs r0, #0x30
	cmp r0, #0
	bge _080158B8
	strh r6, [r2, #0xc]
	b _080158D0
	.align 2, 0
_080158B4: .4byte gUnknown_0202BCB0
_080158B8:
	movs r6, #1
	ldrh r0, [r2, #0xc]
	subs r0, r0, r4
	strh r0, [r2, #0xc]
	negs r0, r4
	adds r1, r2, #0
	adds r1, #0x36
	strb r0, [r1]
	ldrh r1, [r2, #0xc]
	movs r0, #0xf
	ands r0, r1
	strh r0, [r2, #0x32]
_080158D0:
	movs r1, #0xc
	ldrsh r0, [r2, r1]
	adds r0, #0xb0
	cmp r0, r3
	bge _08015902
	adds r1, r3, #0
	subs r1, #0xb0
	movs r3, #0x28
	ldrsh r0, [r2, r3]
	cmp r1, r0
	ble _080158EC
	ldrh r0, [r2, #0x28]
	strh r0, [r2, #0xc]
	b _08015902
_080158EC:
	movs r6, #1
	ldrh r0, [r2, #0xc]
	adds r0, r0, r4
	strh r0, [r2, #0xc]
	adds r0, r2, #0
	adds r0, #0x36
	strb r4, [r0]
	ldrh r1, [r2, #0xc]
	movs r0, #0xf
	ands r0, r1
	strh r0, [r2, #0x32]
_08015902:
	movs r1, #0xe
	ldrsh r0, [r2, r1]
	adds r0, #0x20
	cmp r0, r5
	ble _08015932
	adds r0, r5, #0
	subs r0, #0x20
	cmp r0, #0
	bge _0801591A
	movs r0, #0
	strh r0, [r2, #0xe]
	b _08015932
_0801591A:
	movs r6, #1
	ldrh r0, [r2, #0xe]
	subs r0, r0, r4
	strh r0, [r2, #0xe]
	negs r0, r4
	adds r1, r2, #0
	adds r1, #0x37
	strb r0, [r1]
	ldrh r1, [r2, #0xe]
	movs r0, #0xf
	ands r0, r1
	strh r0, [r2, #0x34]
_08015932:
	movs r3, #0xe
	ldrsh r0, [r2, r3]
	adds r0, #0x70
	cmp r0, r5
	bge _08015964
	adds r1, r5, #0
	subs r1, #0x70
	movs r3, #0x2a
	ldrsh r0, [r2, r3]
	cmp r1, r0
	ble _0801594E
	ldrh r0, [r2, #0x2a]
	strh r0, [r2, #0xe]
	b _08015964
_0801594E:
	movs r6, #1
	ldrh r0, [r2, #0xe]
	adds r0, r0, r4
	strh r0, [r2, #0xe]
	adds r0, r2, #0
	adds r0, #0x37
	strb r4, [r0]
	ldrh r1, [r2, #0xe]
	movs r0, #0xf
	ands r0, r1
	strh r0, [r2, #0x34]
_08015964:
	cmp r6, #0
	bne _080159B2
	adds r3, r2, #0
	ldrh r1, [r3, #0x32]
	movs r4, #0x32
	ldrsh r0, [r3, r4]
	cmp r0, #0
	beq _0801598E
	adds r4, r3, #0
	adds r4, #0x36
	movs r0, #0
	ldrsb r0, [r4, r0]
	adds r0, r1, r0
	movs r1, #0xf
	ands r0, r1
	strh r0, [r3, #0x32]
	movs r0, #0
	ldrsb r0, [r4, r0]
	ldrh r1, [r3, #0xc]
	adds r0, r0, r1
	strh r0, [r3, #0xc]
_0801598E:
	ldrh r1, [r2, #0x34]
	movs r3, #0x34
	ldrsh r0, [r2, r3]
	cmp r0, #0
	beq _080159B2
	adds r3, r2, #0
	adds r3, #0x37
	movs r0, #0
	ldrsb r0, [r3, r0]
	adds r0, r1, r0
	movs r1, #0xf
	ands r0, r1
	strh r0, [r2, #0x34]
	movs r0, #0
	ldrsb r0, [r3, r0]
	ldrh r4, [r2, #0xe]
	adds r0, r0, r4
	strh r0, [r2, #0xe]
_080159B2:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_801588C

	THUMB_FUNC_START GetSomeAdjustedCameraX
GetSomeAdjustedCameraX: @ 0x080159B8
	push {r4, lr}
	adds r3, r0, #0
	ldr r0, _080159F8  @ gUnknown_0202BCB0
	movs r1, #0xc
	ldrsh r2, [r0, r1]
	adds r1, r2, #0
	adds r1, #0x30
	adds r4, r0, #0
	cmp r1, r3
	ble _080159D6
	adds r2, r3, #0
	subs r2, #0x30
	cmp r2, #0
	bge _080159D6
	movs r2, #0
_080159D6:
	movs r1, #0xc
	ldrsh r0, [r4, r1]
	adds r0, #0xb0
	cmp r0, r3
	bge _080159EE
	movs r1, #0x28
	ldrsh r0, [r4, r1]
	adds r2, r3, #0
	subs r2, #0xb0
	cmp r2, r0
	ble _080159EE
	adds r2, r0, #0
_080159EE:
	lsls r0, r2, #0x10
	lsrs r0, r0, #0x10
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080159F8: .4byte gUnknown_0202BCB0

	THUMB_FUNC_END GetSomeAdjustedCameraX

	THUMB_FUNC_START GetSomeAdjustedCameraY
GetSomeAdjustedCameraY: @ 0x080159FC
	push {r4, lr}
	adds r3, r0, #0
	ldr r0, _08015A3C  @ gUnknown_0202BCB0
	movs r1, #0xe
	ldrsh r2, [r0, r1]
	adds r1, r2, #0
	adds r1, #0x20
	adds r4, r0, #0
	cmp r1, r3
	ble _08015A1A
	adds r2, r3, #0
	subs r2, #0x20
	cmp r2, #0
	bge _08015A1A
	movs r2, #0
_08015A1A:
	movs r1, #0xe
	ldrsh r0, [r4, r1]
	adds r0, #0x70
	cmp r0, r3
	bge _08015A32
	movs r1, #0x2a
	ldrsh r0, [r4, r1]
	adds r2, r3, #0
	subs r2, #0x70
	cmp r2, r0
	ble _08015A32
	adds r2, r0, #0
_08015A32:
	lsls r0, r2, #0x10
	lsrs r0, r0, #0x10
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08015A3C: .4byte gUnknown_0202BCB0

	THUMB_FUNC_END GetSomeAdjustedCameraY

	THUMB_FUNC_START sub_8015A40
sub_8015A40: @ 0x08015A40
	push {lr}
	adds r1, r0, #0
	subs r1, #0x78
	cmp r1, #0
	bge _08015A4C
	movs r1, #0
_08015A4C:
	ldr r0, _08015A68  @ gUnknown_0202BCB0
	movs r2, #0x28
	ldrsh r0, [r0, r2]
	cmp r1, r0
	ble _08015A58
	adds r1, r0, #0
_08015A58:
	movs r2, #0x10
	negs r2, r2
	adds r0, r2, #0
	ands r1, r0
	lsls r0, r1, #0x10
	lsrs r0, r0, #0x10
	pop {r1}
	bx r1
	.align 2, 0
_08015A68: .4byte gUnknown_0202BCB0

	THUMB_FUNC_END sub_8015A40

	THUMB_FUNC_START sub_8015A6C
sub_8015A6C: @ 0x08015A6C
	push {lr}
	adds r1, r0, #0
	subs r1, #0x50
	cmp r1, #0
	bge _08015A78
	movs r1, #0
_08015A78:
	ldr r0, _08015A94  @ gUnknown_0202BCB0
	movs r2, #0x2a
	ldrsh r0, [r0, r2]
	cmp r1, r0
	ble _08015A84
	adds r1, r0, #0
_08015A84:
	movs r2, #0x10
	negs r2, r2
	adds r0, r2, #0
	ands r1, r0
	lsls r0, r1, #0x10
	lsrs r0, r0, #0x10
	pop {r1}
	bx r1
	.align 2, 0
_08015A94: .4byte gUnknown_0202BCB0

	THUMB_FUNC_END sub_8015A6C

	THUMB_FUNC_START DisplayCursor
DisplayCursor: @ 0x08015A98
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r6, r0, #0
	adds r7, r1, #0
	adds r5, r2, #0
	movs r0, #0
	mov r9, r0
	mov r8, r0
	bl GetGameClock
	lsrs r4, r0, #1
	movs r0, #0xf
	ands r4, r0
	cmp r5, #4
	bhi _08015B52
	lsls r0, r5, #2
	ldr r1, _08015AC8  @ _08015ACC
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08015AC8: .4byte _08015ACC
_08015ACC: @ jump table
	.4byte _08015AE0 @ case 0
	.4byte _08015AE0 @ case 1
	.4byte _08015AF0 @ case 2
	.4byte _08015B38 @ case 3
	.4byte _08015B48 @ case 4
_08015AE0:
	movs r1, #2
	mov r9, r1
	ldr r1, _08015AEC  @ gUnknown_0859A4C0
	lsls r0, r4, #2
	adds r0, r0, r1
	b _08015B4E
	.align 2, 0
_08015AEC: .4byte gUnknown_0859A4C0
_08015AF0:
	bl GetGameClock
	subs r0, #1
	ldr r5, _08015B2C  @ gUnknown_0202BD40
	ldr r1, [r5]
	cmp r0, r1
	bne _08015B10
	ldr r0, _08015B30  @ gUnknown_0202BD3C
	movs r2, #0
	ldrsh r1, [r0, r2]
	adds r1, r6, r1
	asrs r6, r1, #1
	movs r1, #2
	ldrsh r0, [r0, r1]
	adds r0, r7, r0
	asrs r7, r0, #1
_08015B10:
	movs r2, #0x24
	mov r9, r2
	ldr r1, _08015B34  @ gUnknown_0859A4C0
	lsls r0, r4, #2
	adds r0, r0, r1
	ldr r0, [r0]
	mov r8, r0
	ldr r0, _08015B30  @ gUnknown_0202BD3C
	strh r6, [r0]
	strh r7, [r0, #2]
	bl GetGameClock
	str r0, [r5]
	b _08015B52
	.align 2, 0
_08015B2C: .4byte gUnknown_0202BD40
_08015B30: .4byte gUnknown_0202BD3C
_08015B34: .4byte gUnknown_0859A4C0
_08015B38:
	movs r0, #2
	mov r9, r0
	ldr r1, _08015B44  @ gUnknown_0859A4A6
	mov r8, r1
	b _08015B52
	.align 2, 0
_08015B44: .4byte gUnknown_0859A4A6
_08015B48:
	movs r2, #0x24
	mov r9, r2
	ldr r0, _08015B80  @ gUnknown_0859A4C0
_08015B4E:
	ldr r0, [r0]
	mov r8, r0
_08015B52:
	ldr r0, _08015B84  @ gUnknown_0202BCB0
	movs r2, #0xc
	ldrsh r1, [r0, r2]
	subs r6, r6, r1
	movs r1, #0xe
	ldrsh r0, [r0, r1]
	subs r7, r7, r0
	mov r2, r9
	str r2, [sp]
	movs r0, #4
	adds r1, r6, #0
	adds r2, r7, #0
	mov r3, r8
	bl PutSprite
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08015B80: .4byte gUnknown_0859A4C0
_08015B84: .4byte gUnknown_0202BCB0

	THUMB_FUNC_END DisplayCursor

	THUMB_FUNC_START sub_8015B88
sub_8015B88: @ 0x08015B88
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	bl GetGameClock
	lsrs r0, r0, #1
	movs r1, #0xf
	ands r0, r1
	movs r2, #2
	ldr r1, _08015BB8  @ gUnknown_0859A4C0
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r3, [r0]
	str r2, [sp]
	movs r0, #4
	adds r1, r4, #0
	adds r2, r5, #0
	bl PutSprite
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08015BB8: .4byte gUnknown_0859A4C0

	THUMB_FUNC_END sub_8015B88

	THUMB_FUNC_START SetCursorMapPosition
SetCursorMapPosition: @ 0x08015BBC
	ldr r2, _08015BD0  @ gUnknown_0202BCB0
	strh r0, [r2, #0x14]
	strh r1, [r2, #0x16]
	lsls r0, r0, #4
	strh r0, [r2, #0x1c]
	lsls r1, r1, #4
	strh r1, [r2, #0x1e]
	strh r0, [r2, #0x20]
	strh r1, [r2, #0x22]
	bx lr
	.align 2, 0
_08015BD0: .4byte gUnknown_0202BCB0

	THUMB_FUNC_END SetCursorMapPosition

	THUMB_FUNC_START sub_8015BD4
sub_8015BD4: @ 0x08015BD4
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	adds r6, r1, #0
	lsls r4, r2, #0x18
	lsrs r4, r4, #0x18
	bl GetGameClock
	lsrs r0, r0, #3
	movs r1, #3
	bl __umodsi3
	cmp r4, #0
	beq _08015BF8
	ldr r1, _08015BF4  @ gUnknown_0859A53C
	b _08015BFA
	.align 2, 0
_08015BF4: .4byte gUnknown_0859A53C
_08015BF8:
	ldr r1, _08015C18  @ gUnknown_0859A530
_08015BFA:
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r3, [r0]
	movs r0, #0
	str r0, [sp]
	movs r0, #4
	adds r1, r5, #0
	adds r2, r6, #0
	bl PutSprite
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08015C18: .4byte gUnknown_0859A530

	THUMB_FUNC_END sub_8015BD4

	THUMB_FUNC_START Init6C_GENS
Init6C_GENS: @ 0x08015C1C
	push {r4, r5, r6, lr}
	mov ip, r0
	movs r5, #1
	movs r1, #0x2c
	ldrsh r2, [r0, r1]
	movs r3, #0x30
	ldrsh r0, [r0, r3]
	subs r1, r2, r0
	cmp r1, #0
	bge _08015C32
	subs r1, r0, r2
_08015C32:
	mov r4, ip
	movs r0, #0x2e
	ldrsh r3, [r4, r0]
	movs r2, #0x32
	ldrsh r0, [r4, r2]
	subs r2, r3, r0
	cmp r2, #0
	bge _08015C44
	subs r2, r0, r3
_08015C44:
	cmp r1, r2
	ble _08015C54
	mov r0, ip
	adds r0, #0x40
	strb r5, [r0]
	mov r3, ip
	strh r1, [r3, #0x38]
	b _08015C60
_08015C54:
	mov r1, ip
	adds r1, #0x40
	movs r0, #0
	strb r0, [r1]
	mov r4, ip
	strh r2, [r4, #0x38]
_08015C60:
	mov r0, ip
	movs r1, #0x38
	ldrsh r3, [r0, r1]
	movs r4, #0
	lsls r0, r5, #0x18
	asrs r0, r0, #0x19
	subs r0, r3, r0
	ldr r6, _08015C78  @ gUnknown_0202BD44
	cmp r0, #0
	bge _08015C7C
	strb r3, [r6]
	b _08015CA2
	.align 2, 0
_08015C78: .4byte gUnknown_0202BD44
_08015C7C:
	lsls r1, r5, #0x18
	asrs r2, r1, #0x18
	asrs r1, r1, #0x19
	subs r3, r3, r1
	adds r0, r4, r6
	strb r1, [r0]
	cmp r2, #0xf
	bgt _08015C92
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
_08015C92:
	adds r4, #1
	lsls r0, r5, #0x18
	asrs r0, r0, #0x19
	subs r0, r3, r0
	cmp r0, #0
	bge _08015C7C
	adds r0, r4, r6
	strb r3, [r0]
_08015CA2:
	mov r2, ip
	str r4, [r2, #0x3c]
	ldrh r0, [r2, #0x38]
	strh r0, [r2, #0x3a]
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END Init6C_GENS

	THUMB_FUNC_START Loop6C_GENS
Loop6C_GENS: @ 0x08015CB0
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r2, [r5, #0x3c]
	cmp r2, #0
	bne _08015CD0
	ldr r0, _08015CCC  @ gUnknown_0202BCB0
	ldrh r1, [r0, #0xc]
	strh r1, [r5, #0x2c]
	ldrh r0, [r0, #0xe]
	strh r0, [r5, #0x2e]
	adds r0, r5, #0
	bl Proc_End
	b _08015D20
	.align 2, 0
_08015CCC: .4byte gUnknown_0202BCB0
_08015CD0:
	ldr r0, _08015D28  @ gUnknown_0202BD44
	adds r0, r2, r0
	movs r1, #0
	ldrsb r1, [r0, r1]
	ldrh r0, [r5, #0x3a]
	subs r0, r0, r1
	strh r0, [r5, #0x3a]
	subs r0, r2, #1
	str r0, [r5, #0x3c]
	ldr r4, _08015D2C  @ gUnknown_0202BCB0
	movs r1, #0x30
	ldrsh r0, [r5, r1]
	movs r2, #0x2c
	ldrsh r1, [r5, r2]
	subs r0, r0, r1
	movs r2, #0x3a
	ldrsh r1, [r5, r2]
	muls r0, r1, r0
	movs r2, #0x38
	ldrsh r1, [r5, r2]
	bl __divsi3
	ldrh r1, [r5, #0x2c]
	adds r1, r1, r0
	strh r1, [r4, #0xc]
	movs r1, #0x32
	ldrsh r0, [r5, r1]
	movs r2, #0x2e
	ldrsh r1, [r5, r2]
	subs r0, r0, r1
	movs r2, #0x3a
	ldrsh r1, [r5, r2]
	muls r0, r1, r0
	movs r2, #0x38
	ldrsh r1, [r5, r2]
	bl __divsi3
	ldrh r1, [r5, #0x2e]
	adds r1, r1, r0
	strh r1, [r4, #0xe]
_08015D20:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08015D28: .4byte gUnknown_0202BD44
_08015D2C: .4byte gUnknown_0202BCB0

	THUMB_FUNC_END Loop6C_GENS

	THUMB_FUNC_START StoreAdjustedCameraPositions
StoreAdjustedCameraPositions: @ 0x08015D30
	push {r4, r5, lr}
	adds r4, r2, #0
	subs r0, #7
	str r0, [r4]
	subs r1, #5
	str r1, [r3]
	ldr r0, [r4]
	cmp r0, #0
	bge _08015D46
	movs r0, #0
	str r0, [r4]
_08015D46:
	ldr r0, [r3]
	cmp r0, #0
	bge _08015D50
	movs r0, #0
	str r0, [r3]
_08015D50:
	ldr r1, [r4]
	adds r1, #8
	ldr r5, _08015D80  @ gBmMapSize
	movs r0, #0
	ldrsh r2, [r5, r0]
	subs r0, r2, #1
	cmp r1, r0
	ble _08015D64
	subs r0, #0xe
	str r0, [r4]
_08015D64:
	ldr r0, [r3]
	adds r0, #4
	movs r1, #2
	ldrsh r2, [r5, r1]
	subs r1, r2, #1
	cmp r0, r1
	ble _08015D78
	adds r0, r2, #0
	subs r0, #0xa
	str r0, [r3]
_08015D78:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08015D80: .4byte gBmMapSize

	THUMB_FUNC_END StoreAdjustedCameraPositions

	THUMB_FUNC_START sub_8015D84
sub_8015D84: @ 0x08015D84
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r5, r0, #0
	adds r6, r1, #0
	adds r7, r2, #0
	add r3, sp, #4
	adds r0, r6, #0
	adds r1, r7, #0
	mov r2, sp
	bl StoreAdjustedCameraPositions
	ldr r1, [sp]
	lsls r1, r1, #4
	str r1, [sp]
	ldr r0, [sp, #4]
	lsls r2, r0, #4
	str r2, [sp, #4]
	ldr r3, _08015DC8  @ gUnknown_0202BCB0
	movs r4, #0xc
	ldrsh r0, [r3, r4]
	cmp r1, r0
	bne _08015DB8
	movs r1, #0xe
	ldrsh r0, [r3, r1]
	cmp r2, r0
	beq _08015DC4
_08015DB8:
	ldr r4, _08015DCC  @ gUnknown_0859A548
	adds r0, r4, #0
	bl Proc_Find
	cmp r0, #0
	beq _08015DD0
_08015DC4:
	movs r0, #0
	b _08015E00
	.align 2, 0
_08015DC8: .4byte gUnknown_0202BCB0
_08015DCC: .4byte gUnknown_0859A548
_08015DD0:
	cmp r5, #0
	beq _08015DDE
	adds r0, r4, #0
	adds r1, r5, #0
	bl Proc_StartBlocking
	b _08015DE6
_08015DDE:
	adds r0, r4, #0
	movs r1, #3
	bl Proc_Start
_08015DE6:
	adds r2, r0, #0
	ldr r1, _08015E08  @ gUnknown_0202BCB0
	ldrh r0, [r1, #0xc]
	strh r0, [r2, #0x30]
	ldrh r0, [r1, #0xe]
	strh r0, [r2, #0x32]
	ldr r0, [sp]
	strh r0, [r2, #0x2c]
	ldr r0, [sp, #4]
	strh r0, [r2, #0x2e]
	strh r6, [r2, #0x34]
	strh r7, [r2, #0x36]
	movs r0, #1
_08015E00:
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08015E08: .4byte gUnknown_0202BCB0

	THUMB_FUNC_END sub_8015D84

	THUMB_FUNC_START EnsureCameraOntoPosition
EnsureCameraOntoPosition: @ 0x08015E0C
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	adds r5, r0, #0
	mov r8, r1
	mov r9, r2
	lsls r0, r1, #4
	bl GetSomeAdjustedCameraX
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	mov r1, r9
	lsls r0, r1, #4
	bl GetSomeAdjustedCameraY
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	ldr r1, _08015E54  @ gUnknown_0202BCB0
	movs r2, #0xc
	ldrsh r0, [r1, r2]
	cmp r7, r0
	bne _08015E42
	movs r2, #0xe
	ldrsh r0, [r1, r2]
	cmp r6, r0
	beq _08015E4E
_08015E42:
	ldr r4, _08015E58  @ gUnknown_0859A548
	adds r0, r4, #0
	bl Proc_Find
	cmp r0, #0
	beq _08015E5C
_08015E4E:
	movs r0, #0
	b _08015E8C
	.align 2, 0
_08015E54: .4byte gUnknown_0202BCB0
_08015E58: .4byte gUnknown_0859A548
_08015E5C:
	cmp r5, #0
	beq _08015E6A
	adds r0, r4, #0
	adds r1, r5, #0
	bl Proc_StartBlocking
	b _08015E72
_08015E6A:
	adds r0, r4, #0
	movs r1, #3
	bl Proc_Start
_08015E72:
	adds r2, r0, #0
	ldr r0, _08015E98  @ gUnknown_0202BCB0
	ldrh r1, [r0, #0xc]
	strh r1, [r2, #0x30]
	ldrh r0, [r0, #0xe]
	strh r0, [r2, #0x32]
	strh r7, [r2, #0x2c]
	strh r6, [r2, #0x2e]
	mov r0, r8
	strh r0, [r2, #0x34]
	mov r1, r9
	strh r1, [r2, #0x36]
	movs r0, #1
_08015E8C:
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08015E98: .4byte gUnknown_0202BCB0

	THUMB_FUNC_END EnsureCameraOntoPosition

	THUMB_FUNC_START ShouldMoveCameraPosSomething
ShouldMoveCameraPosSomething: @ 0x08015E9C
	push {r4, r5, lr}
	adds r5, r1, #0
	lsls r0, r0, #4
	bl GetSomeAdjustedCameraX
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #4
	adds r0, r5, #0
	bl GetSomeAdjustedCameraY
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	ldr r1, _08015ED0  @ gUnknown_0202BCB0
	movs r3, #0xc
	ldrsh r0, [r1, r3]
	cmp r4, r0
	bne _08015ED4
	movs r3, #0xe
	ldrsh r0, [r1, r3]
	cmp r2, r0
	bne _08015ED4
	movs r0, #0
	b _08015ED6
	.align 2, 0
_08015ED0: .4byte gUnknown_0202BCB0
_08015ED4:
	movs r0, #1
_08015ED6:
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END ShouldMoveCameraPosSomething

	THUMB_FUNC_START sub_8015EDC
sub_8015EDC: @ 0x08015EDC
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _08015F00  @ gUnknown_0202BCB0
	movs r2, #0xe
	ldrsh r1, [r0, r2]
	movs r2, #0x2a
	ldrsh r0, [r0, r2]
	cmp r1, r0
	ble _08015EFA
	ldr r4, _08015F04  @ gUnknown_0859A548
	adds r0, r4, #0
	bl Proc_Find
	cmp r0, #0
	beq _08015F08
_08015EFA:
	movs r0, #0
	b _08015F34
	.align 2, 0
_08015F00: .4byte gUnknown_0202BCB0
_08015F04: .4byte gUnknown_0859A548
_08015F08:
	cmp r5, #0
	beq _08015F16
	adds r0, r4, #0
	adds r1, r5, #0
	bl Proc_StartBlocking
	b _08015F1E
_08015F16:
	adds r0, r4, #0
	movs r1, #3
	bl Proc_Start
_08015F1E:
	adds r2, r0, #0
	ldr r1, _08015F3C  @ gUnknown_0202BCB0
	ldrh r0, [r1, #0xc]
	strh r0, [r2, #0x30]
	ldrh r0, [r1, #0xe]
	strh r0, [r2, #0x32]
	ldrh r0, [r1, #0xc]
	strh r0, [r2, #0x2c]
	ldrh r0, [r1, #0x2a]
	strh r0, [r2, #0x2e]
	movs r0, #1
_08015F34:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08015F3C: .4byte gUnknown_0202BCB0

	THUMB_FUNC_END sub_8015EDC

	THUMB_FUNC_START sub_8015F40
sub_8015F40: @ 0x08015F40
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	movs r1, #0x2c
	ldrsh r0, [r7, r1]
	movs r2, #0x30
	ldrsh r1, [r7, r2]
	subs r0, r0, r1
	ldr r4, [r7, #0x34]
	muls r0, r4, r0
	ldr r5, [r7, #0x38]
	adds r1, r5, #0
	bl __divsi3
	adds r6, r0, #0
	movs r1, #0x2e
	ldrsh r0, [r7, r1]
	movs r2, #0x32
	ldrsh r1, [r7, r2]
	subs r0, r0, r1
	muls r0, r4, r0
	adds r1, r5, #0
	bl __divsi3
	adds r1, r0, #0
	adds r0, r6, #0
	movs r2, #0
	bl DisplayCursor
	ldr r0, [r7, #0x34]
	subs r0, #1
	str r0, [r7, #0x34]
	cmp r0, #0
	bge _08015F88
	adds r0, r7, #0
	bl Proc_Break
_08015F88:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8015F40

	THUMB_FUNC_START sub_8015F90
sub_8015F90: @ 0x08015F90
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	ldr r0, _08015FC0  @ gUnknown_0859A570
	movs r1, #3
	bl Proc_Start
	ldr r2, _08015FC4  @ gUnknown_0202BCB0
	ldrh r1, [r2, #0x14]
	lsls r1, r1, #4
	strh r1, [r0, #0x2c]
	ldrh r1, [r2, #0x16]
	lsls r1, r1, #4
	strh r1, [r0, #0x2e]
	lsls r4, r4, #4
	strh r4, [r0, #0x30]
	lsls r5, r5, #4
	strh r5, [r0, #0x32]
	str r6, [r0, #0x38]
	str r6, [r0, #0x34]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08015FC0: .4byte gUnknown_0859A570
_08015FC4: .4byte gUnknown_0202BCB0

	THUMB_FUNC_END sub_8015F90

	THUMB_FUNC_START GetCurrentMapMusicIndex
GetCurrentMapMusicIndex: @ 0x08015FC8
	push {r4, r5, r6, r7, lr}
	movs r0, #4
	bl CheckEventId
	lsls r0, r0, #0x18
	movs r1, #6
	cmp r0, #0
	bne _08015FDA
	movs r1, #0
_08015FDA:
	adds r7, r1, #0
	movs r0, #4
	bl CheckEventId
	lsls r0, r0, #0x18
	movs r1, #7
	cmp r0, #0
	bne _08015FEC
	movs r1, #1
_08015FEC:
	adds r6, r1, #0
	movs r0, #4
	bl CheckEventId
	adds r1, r0, #0
	lsls r1, r1, #0x18
	cmp r1, #0
	bne _08016000
	movs r4, #2
	b _08016002
_08016000:
	movs r4, #6
_08016002:
	ldr r5, _08016014  @ gRAMChapterData
	ldrb r1, [r5, #0xf]
	cmp r1, #0x40
	beq _0801602E
	cmp r1, #0x40
	bgt _08016018
	cmp r1, #0
	beq _08016040
	b _080160C4
	.align 2, 0
_08016014: .4byte gRAMChapterData
_08016018:
	cmp r1, #0x80
	bne _080160C4
	movs r0, #0xe
	ldrsb r0, [r5, r0]
	bl GetROMChapterStruct
	lsls r1, r6, #1
	adds r0, #0x16
	adds r0, r0, r1
	ldrh r0, [r0]
	b _080160C4
_0801602E:
	movs r0, #0xe
	ldrsb r0, [r5, r0]
	bl GetROMChapterStruct
	lsls r1, r4, #1
	adds r0, #0x16
	adds r0, r0, r1
	ldrh r0, [r0]
	b _080160C4
_08016040:
	movs r0, #4
	bl CheckEventId
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0801605E
	movs r0, #0xe
	ldrsb r0, [r5, r0]
	bl GetROMChapterStruct
	lsls r1, r7, #1
	adds r0, #0x16
	adds r0, r0, r1
	ldrh r0, [r0]
	b _080160C4
_0801605E:
	bl GetChapterThing
	cmp r0, #2
	beq _0801607A
	movs r0, #0xe
	ldrsb r0, [r5, r0]
	bl GetROMChapterStruct
	adds r0, #0x86
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _080160B0
_0801607A:
	ldr r1, _080160A4  @ 0x0001000C
	movs r0, #0x80
	bl sub_8024D50
	adds r4, r0, #0
	bl GetChapterThing
	cmp r0, #2
	beq _080160A8
	movs r0, #0xe
	ldrsb r0, [r5, r0]
	bl GetROMChapterStruct
	adds r0, #0x86
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r4, r0
	ble _080160AC
	b _080160B0
	.align 2, 0
_080160A4: .4byte 0x0001000C
_080160A8:
	cmp r4, #1
	bgt _080160B0
_080160AC:
	movs r0, #0x10
	b _080160C4
_080160B0:
	ldr r0, _080160CC  @ gRAMChapterData
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetROMChapterStruct
	lsls r1, r7, #1
	adds r0, #0x16
	adds r0, r0, r1
	ldrh r0, [r0]
_080160C4:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080160CC: .4byte gRAMChapterData

	THUMB_FUNC_END GetCurrentMapMusicIndex

	THUMB_FUNC_START sub_80160D0
sub_80160D0: @ 0x080160D0
	push {lr}
	bl GetCurrentMapMusicIndex
	movs r1, #0
	bl Sound_PlaySong80024D4
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80160D0

	THUMB_FUNC_START sub_80160E0
sub_80160E0: @ 0x080160E0
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	movs r0, #0x30
	ldrsh r1, [r5, r0]
	movs r4, #0x2c
	ldrsh r2, [r5, r4]
	ldr r3, [r5, #0x3c]
	movs r6, #0x3a
	ldrsh r0, [r5, r6]
	str r0, [sp]
	movs r0, #0
	bl sub_8012DCC
	adds r4, r0, #0
	movs r0, #0x32
	ldrsh r1, [r5, r0]
	movs r6, #0x2e
	ldrsh r2, [r5, r6]
	ldr r3, [r5, #0x3c]
	movs r6, #0x3a
	ldrsh r0, [r5, r6]
	str r0, [sp]
	movs r0, #0
	bl sub_8012DCC
	ldr r1, _08016138  @ gUnknown_0202BCB0
	strh r4, [r1, #0xc]
	strh r0, [r1, #0xe]
	ldr r0, [r5, #0x3c]
	adds r0, #1
	str r0, [r5, #0x3c]
	movs r2, #0x3a
	ldrsh r1, [r5, r2]
	cmp r0, r1
	blt _0801612E
	adds r0, r5, #0
	bl Proc_End
_0801612E:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08016138: .4byte gUnknown_0202BCB0

	THUMB_FUNC_END sub_80160E0

	THUMB_FUNC_START sub_801613C
sub_801613C: @ 0x0801613C
	bx lr

	THUMB_FUNC_END sub_801613C

	THUMB_FUNC_START sub_8016140
sub_8016140: @ 0x08016140
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	adds r7, r3, #0
	cmp r4, #0
	beq _0801615C
	ldr r0, _08016158  @ gUnknown_0859A580
	adds r1, r4, #0
	bl Proc_StartBlocking
	b _08016164
	.align 2, 0
_08016158: .4byte gUnknown_0859A580
_0801615C:
	ldr r0, _08016184  @ gUnknown_0859A580
	movs r1, #3
	bl Proc_Start
_08016164:
	adds r3, r0, #0
	ldr r1, _08016188  @ gUnknown_0202BCB0
	ldrh r0, [r1, #0xc]
	movs r2, #0
	strh r0, [r3, #0x30]
	ldrh r0, [r1, #0xe]
	strh r0, [r3, #0x32]
	lsls r0, r5, #4
	strh r0, [r3, #0x2c]
	lsls r0, r6, #4
	strh r0, [r3, #0x2e]
	strh r7, [r3, #0x3a]
	str r2, [r3, #0x3c]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08016184: .4byte gUnknown_0859A580
_08016188: .4byte gUnknown_0202BCB0

	THUMB_FUNC_END sub_8016140

	.align 2, 0 @ Don't pad with nop.
