	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	@ Prep Screen!

	THUMB_FUNC_START GetPlayerLeaderUnitId
GetPlayerLeaderUnitId: @ 0x08033258
	push {r4, r5, lr}
	ldr r0, _0803326C  @ gRAMChapterData
	ldrb r1, [r0, #0x1b]
	cmp r1, #1
	blt _08033276
	cmp r1, #2
	ble _08033270
	cmp r1, #3
	beq _08033274
	b _08033276
	.align 2, 0
_0803326C: .4byte gRAMChapterData
_08033270:
	movs r5, #1
	b _08033276
_08033274:
	movs r5, #0xf
_08033276:
	ldrb r0, [r0, #0xe]
	cmp r0, #5
	bne _08033284
	movs r0, #0xf
	b _080332C4
_08033280:
	ldrb r0, [r2, #4]
	b _080332C4
_08033284:
	bl GetChapterThing
	cmp r0, #0
	beq _080332C2
	adds r0, r5, #0
	bl GetUnitFromCharId
	cmp r0, #0
	beq _080332A0
	ldr r0, [r0, #0xc]
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	beq _080332C2
_080332A0:
	movs r4, #1
_080332A2:
	adds r0, r4, #0
	bl GetUnit
	cmp r0, #0
	beq _080332BC
	ldr r2, [r0]
	cmp r2, #0
	beq _080332BC
	ldr r0, [r0, #0xc]
	ldr r1, _080332CC  @ 0x0001000C
	ands r0, r1
	cmp r0, #0
	beq _08033280
_080332BC:
	adds r4, #1
	cmp r4, #0x3f
	ble _080332A2
_080332C2:
	adds r0, r5, #0
_080332C4:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080332CC: .4byte 0x0001000C

	THUMB_FUNC_END GetPlayerLeaderUnitId

	THUMB_FUNC_START sub_80332D0
sub_80332D0: @ 0x080332D0
	push {r4, r5, lr}
	sub sp, #4
	bl GetChapterAllyUnitDataPointer
	adds r4, r0, #0
	ldr r0, _08033344  @ gBmMapRange
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFill
	ldr r0, _08033348  @ gBmMapMovement
	ldr r0, [r0]
	movs r1, #1
	negs r1, r1
	bl BmMapFill
	bl sub_809541C
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r4, r4, r1
	ldrb r0, [r4]
	cmp r0, #0
	beq _08033334
	mov r5, sp
	adds r5, #1
_08033306:
	adds r0, r4, #0
	mov r1, sp
	adds r2, r5, #0
	movs r3, #0
	bl GetPreferredPositionForUNIT
	movs r1, #0
	ldrsb r1, [r5, r1]
	ldr r0, _08033344  @ gBmMapRange
	ldr r0, [r0]
	lsls r1, r1, #2
	adds r1, r1, r0
	mov r0, sp
	movs r2, #0
	ldrsb r2, [r0, r2]
	ldr r0, [r1]
	adds r0, r0, r2
	movs r1, #1
	strb r1, [r0]
	adds r4, #0x14
	ldrb r0, [r4]
	cmp r0, #0
	bne _08033306
_08033334:
	movs r0, #0x10
	bl DisplayMoveRangeGraphics
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08033344: .4byte gBmMapRange
_08033348: .4byte gBmMapMovement

	THUMB_FUNC_END sub_80332D0

	THUMB_FUNC_START sub_803334C
sub_803334C: @ 0x0803334C
	push {lr}
	bl sub_80972B0
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_803334C

	THUMB_FUNC_START sub_8033358
sub_8033358: @ 0x08033358
	push {lr}
	movs r1, #1
	str r1, [r0, #0x58]
	bl Proc_Break
	bl sub_803334C
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8033358

	THUMB_FUNC_START sub_803336C
sub_803336C: @ 0x0803336C
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r0, #2
	str r0, [r5, #0x58]
	ldr r4, _080333A0  @ gUnknown_0202BCB0
	movs r1, #0x14
	ldrsh r0, [r4, r1]
	movs r2, #0x16
	ldrsh r1, [r4, r2]
	bl sub_801DB4C
	movs r1, #0x20
	ldrsh r0, [r4, r1]
	movs r2, #0x22
	ldrsh r1, [r4, r2]
	movs r2, #0
	bl DisplayCursor
	adds r0, r5, #0
	bl Proc_Break
	bl sub_803334C
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080333A0: .4byte gUnknown_0202BCB0

	THUMB_FUNC_END sub_803336C

	THUMB_FUNC_START sub_80333A4
sub_80333A4: @ 0x080333A4
	push {r4, lr}
	adds r4, r0, #0
	bl sub_8095970
	cmp r0, #0
	beq _080333BC
	adds r0, r4, #0
	movs r1, #0x37
	bl Proc_Goto
	movs r0, #1
	b _080333BE
_080333BC:
	movs r0, #0
_080333BE:
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80333A4

	THUMB_FUNC_START sub_80333C4
sub_80333C4: @ 0x080333C4
	push {lr}
	movs r1, #0x33
	bl Proc_Goto
	movs r0, #1
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80333C4

	THUMB_FUNC_START sub_80333D4
sub_80333D4: @ 0x080333D4
	push {r4, r5, lr}
	bl sub_8031688
	adds r5, r0, #0
	cmp r5, #0
	beq _08033410
	ldr r0, [r5, #0xc]
	movs r1, #9
	negs r1, r1
	ands r0, r1
	str r0, [r5, #0xc]
	ldr r4, _08033418  @ gRAMChapterData
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	bl GetROMChapterStruct
	adds r0, #0x82
	ldrb r0, [r0]
	strb r0, [r5, #0x10]
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	bl GetROMChapterStruct
	adds r0, #0x84
	ldrb r0, [r0]
	strb r0, [r5, #0x11]
	bl RefreshEntityBmMaps
	bl SMS_UpdateFromGameData
_08033410:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08033418: .4byte gRAMChapterData

	THUMB_FUNC_END sub_80333D4

	THUMB_FUNC_START sub_803341C
sub_803341C: @ 0x0803341C
	push {lr}
	movs r1, #8
	str r1, [r0, #0x58]
	movs r1, #0x39
	bl Proc_Goto
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_803341C

	THUMB_FUNC_START sub_803342C
sub_803342C: @ 0x0803342C
	push {lr}
	bl sub_8031688
	adds r2, r0, #0
	cmp r2, #0
	beq _08033452
	ldr r0, [r2, #0xc]
	movs r1, #8
	orrs r0, r1
	str r0, [r2, #0xc]
	movs r0, #0xff
	strb r0, [r2, #0x10]
	movs r0, #1
	negs r0, r0
	strb r0, [r2, #0x11]
	bl RefreshEntityBmMaps
	bl SMS_UpdateFromGameData
_08033452:
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_803342C

	THUMB_FUNC_START sub_8033458
sub_8033458: @ 0x08033458
	push {lr}
	movs r1, #9
	str r1, [r0, #0x58]
	movs r1, #0x3b
	bl Proc_Goto
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8033458

	THUMB_FUNC_START sub_8033468
sub_8033468: @ 0x08033468
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0xa
	str r0, [r4, #0x58]
	bl sub_803334C
	ldr r0, _08033488  @ gDebugMenuDef
	bl StartOrphanMenu
	adds r0, r4, #0
	movs r1, #0x3a
	bl Proc_Goto
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08033488: .4byte gDebugMenuDef

	THUMB_FUNC_END sub_8033468

	THUMB_FUNC_START sub_803348C
sub_803348C: @ 0x0803348C
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r4, _080334B8  @ gRAMChapterData
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	bl GetROMChapterStruct
	adds r0, #0x82
	ldrb r5, [r0]
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	bl GetROMChapterStruct
	adds r0, #0x84
	ldrb r2, [r0]
	adds r0, r6, #0
	adds r1, r5, #0
	bl EnsureCameraOntoPosition
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080334B8: .4byte gRAMChapterData

	THUMB_FUNC_END sub_803348C

	THUMB_FUNC_START sub_80334BC
sub_80334BC: @ 0x080334BC
	push {lr}
	movs r1, #1
	str r1, [r0, #0x58]
	bl sub_8033648
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80334BC

	THUMB_FUNC_START sub_80334CC
sub_80334CC: @ 0x080334CC
	push {lr}
	bl ArchiveCurrentPalettes
	ldr r3, _080334E4  @ 0xFF00FFF0
	movs r0, #0xc0
	movs r1, #0xc0
	movs r2, #0xc0
	bl WriteFadedPaletteFromArchive
	pop {r0}
	bx r0
	.align 2, 0
_080334E4: .4byte 0xFF00FFF0

	THUMB_FUNC_END sub_80334CC

	THUMB_FUNC_START sub_80334E8
sub_80334E8: @ 0x080334E8
	push {lr}
	sub sp, #0x14
	movs r3, #0x80
	lsls r3, r3, #1
	str r3, [sp]
	str r3, [sp, #4]
	ldr r1, _08033510  @ 0xFF00FFF0
	str r1, [sp, #8]
	movs r1, #0x40
	str r1, [sp, #0xc]
	str r0, [sp, #0x10]
	movs r0, #0xc0
	movs r1, #0xc0
	movs r2, #0xc0
	bl sub_8013800
	add sp, #0x14
	pop {r0}
	bx r0
	.align 2, 0
_08033510: .4byte 0xFF00FFF0

	THUMB_FUNC_END sub_80334E8

	THUMB_FUNC_START sub_8033514
sub_8033514: @ 0x08033514
	push {r4, lr}
	sub sp, #0x14
	adds r4, r0, #0
	bl ArchiveCurrentPalettes
	movs r2, #0x80
	lsls r2, r2, #1
	movs r0, #0xc0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _08033544  @ 0xFF00FFF0
	str r0, [sp, #8]
	movs r0, #0x40
	str r0, [sp, #0xc]
	str r4, [sp, #0x10]
	adds r0, r2, #0
	adds r1, r2, #0
	movs r3, #0xc0
	bl sub_8013800
	add sp, #0x14
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08033544: .4byte 0xFF00FFF0

	THUMB_FUNC_END sub_8033514

	THUMB_FUNC_START sub_8033548
sub_8033548: @ 0x08033548
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0xaa
	movs r1, #0x8c
	movs r2, #2
	adds r3, r4, #0
	bl StartHelpPromptSprite
	ldr r0, _0803356C  @ gUnknown_08A199C8
	ldr r1, _08033570  @ 0x06017000
	bl CopyDataWithPossibleUncomp
	movs r0, #0
	str r0, [r4, #0x58]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0803356C: .4byte gUnknown_08A199C8
_08033570: .4byte 0x06017000

	THUMB_FUNC_END sub_8033548

	THUMB_FUNC_START sub_8033574
sub_8033574: @ 0x08033574
	push {r4, lr}
	sub sp, #4
	ldr r4, _080335E4  @ gObject_32x16
	ldr r0, _080335E8  @ 0x0000238B
	str r0, [sp]
	movs r0, #4
	movs r1, #0x64
	movs r2, #0x8c
	adds r3, r4, #0
	bl PutSprite
	ldr r0, _080335EC  @ 0x0000238F
	str r0, [sp]
	movs r0, #4
	movs r1, #0x84
	movs r2, #0x8c
	adds r3, r4, #0
	bl PutSprite
	ldr r3, _080335F0  @ gObject_16x16
	ldr r0, _080335F4  @ 0x00002393
	str r0, [sp]
	movs r0, #4
	movs r1, #0xa4
	movs r2, #0x8c
	bl PutSprite
	ldr r0, _080335F8  @ 0x00002395
	str r0, [sp]
	movs r0, #4
	movs r1, #0x10
	movs r2, #0x8c
	adds r3, r4, #0
	bl PutSprite
	ldr r0, _080335FC  @ 0x00002399
	str r0, [sp]
	movs r0, #4
	movs r1, #0x30
	movs r2, #0x8c
	adds r3, r4, #0
	bl PutSprite
	ldr r3, _08033600  @ gObject_8x16
	ldr r0, _08033604  @ 0x0000239D
	str r0, [sp]
	movs r0, #4
	movs r1, #0x50
	movs r2, #0x8c
	bl PutSprite
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080335E4: .4byte gObject_32x16
_080335E8: .4byte 0x0000238B
_080335EC: .4byte 0x0000238F
_080335F0: .4byte gObject_16x16
_080335F4: .4byte 0x00002393
_080335F8: .4byte 0x00002395
_080335FC: .4byte 0x00002399
_08033600: .4byte gObject_8x16
_08033604: .4byte 0x0000239D

	THUMB_FUNC_END sub_8033574

	THUMB_FUNC_START sub_8033608
sub_8033608: @ 0x08033608
	push {lr}
	ldr r0, _0803361C  @ gUnknown_08A1B154
	movs r1, #0x90
	lsls r1, r1, #2
	movs r2, #0x20
	bl CopyToPaletteBuffer
	pop {r0}
	bx r0
	.align 2, 0
_0803361C: .4byte gUnknown_08A1B154

	THUMB_FUNC_END sub_8033608

	THUMB_FUNC_START sub_8033620
sub_8033620: @ 0x08033620
	push {lr}
	adds r1, r0, #0
	ldr r0, _08033630  @ gUnknown_0859DBA4
	bl Proc_Start
	pop {r0}
	bx r0
	.align 2, 0
_08033630: .4byte gUnknown_0859DBA4

	THUMB_FUNC_END sub_8033620

	THUMB_FUNC_START sub_8033634
sub_8033634: @ 0x08033634
	push {lr}
	bl EndHelpPromptSprite
	ldr r0, _08033644  @ gUnknown_0859DBA4
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
_08033644: .4byte gUnknown_0859DBA4

	THUMB_FUNC_END sub_8033634

	THUMB_FUNC_START sub_8033648
sub_8033648: @ 0x08033648
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	movs r1, #1
	negs r1, r1
	movs r0, #0
	bl LoadDialogueBoxGfx
	bl Font_InitForUIDefault
	bl DeletePlayerPhaseInterface6Cs
	bl HideMoveRangeGraphics
	adds r0, r4, #0
	bl sub_8096FAC
	ldr r1, _080336C4  @ sub_8033358
	movs r3, #0xb2
	lsls r3, r3, #3
	ldr r0, _080336C8  @ 0x000005BB
	str r0, [sp]
	movs r0, #1
	movs r2, #0
	bl sub_8097024
	bl sub_8095970
	movs r2, #0
	cmp r0, #0
	bne _08033688
	movs r2, #1
_08033688:
	ldr r1, _080336CC  @ sub_803336C
	ldr r3, _080336D0  @ 0x00000591
	ldr r0, _080336D4  @ 0x000005BC
	str r0, [sp]
	movs r0, #2
	bl sub_8097024
	ldr r1, _080336D8  @ sub_803341C
	ldr r3, _080336DC  @ 0x00000592
	ldr r0, _080336E0  @ 0x000005BD
	str r0, [sp]
	movs r0, #8
	movs r2, #0
	bl sub_8097024
	bl sub_8094FF4
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080336F0
	ldr r1, _080336E4  @ sub_8033458
	ldr r3, _080336E8  @ 0x00000579
	ldr r0, _080336EC  @ 0x000005BE
	str r0, [sp]
	movs r0, #9
	movs r2, #0
	bl sub_8097024
	b _08033700
	.align 2, 0
_080336C4: .4byte sub_8033358
_080336C8: .4byte 0x000005BB
_080336CC: .4byte sub_803336C
_080336D0: .4byte 0x00000591
_080336D4: .4byte 0x000005BC
_080336D8: .4byte sub_803341C
_080336DC: .4byte 0x00000592
_080336E0: .4byte 0x000005BD
_080336E4: .4byte sub_8033458
_080336E8: .4byte 0x00000579
_080336EC: .4byte 0x000005BE
_080336F0:
	ldr r1, _08033734  @ sub_8033458
	ldr r3, _08033738  @ 0x00000579
	ldr r0, _0803373C  @ 0x000005BE
	str r0, [sp]
	movs r0, #9
	movs r2, #1
	bl sub_8097024
_08033700:
	adds r0, r4, #0
	bl sub_8033620
	ldr r0, _08033740  @ sub_80333C4
	bl sub_8096FD0
	ldr r0, _08033744  @ sub_80333A4
	bl sub_8096FEC
	ldr r0, _08033748  @ sub_8033634
	bl sub_8097008
	movs r0, #0xa
	movs r1, #2
	bl sub_8097154
	ldr r0, [r4, #0x58]
	bl sub_80970CC
	movs r0, #3
	bl BG_EnableSyncByMask
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08033734: .4byte sub_8033458
_08033738: .4byte 0x00000579
_0803373C: .4byte 0x000005BE
_08033740: .4byte sub_80333C4
_08033744: .4byte sub_80333A4
_08033748: .4byte sub_8033634

	THUMB_FUNC_END sub_8033648

	THUMB_FUNC_START CanCharacterBePrepMoved
CanCharacterBePrepMoved: @ 0x0803374C
	push {r4, lr}
	adds r4, r0, #0
	bl IsCharacterForceDeployed
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08033766
	movs r0, #0x80
	lsls r0, r0, #1
	cmp r4, r0
	beq _08033766
	movs r0, #1
	b _08033768
_08033766:
	movs r0, #0
_08033768:
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END CanCharacterBePrepMoved

	THUMB_FUNC_START sub_8033770
sub_8033770: @ 0x08033770
	adds r1, r0, #0
	adds r1, #0x4a
	movs r2, #0
	strh r2, [r1]
	str r2, [r0, #0x2c]
	str r2, [r0, #0x30]
	movs r1, #2
	str r1, [r0, #0x34]
	str r2, [r0, #0x38]
	ldr r1, _08033794  @ gBmMapSize
	movs r2, #0
	ldrsh r1, [r1, r2]
	lsls r1, r1, #3
	subs r1, #0x78
	adds r0, #0x4c
	strh r1, [r0]
	bx lr
	.align 2, 0
_08033794: .4byte gBmMapSize

	THUMB_FUNC_END sub_8033770

	THUMB_FUNC_START sub_8033798
sub_8033798: @ 0x08033798
	movs r1, #0
	str r1, [r0, #0x34]
	movs r1, #2
	str r1, [r0, #0x38]
	ldr r1, _080337B0  @ gBmMapSize
	movs r2, #2
	ldrsh r1, [r1, r2]
	lsls r1, r1, #3
	subs r1, #0x50
	adds r0, #0x4c
	strh r1, [r0]
	bx lr
	.align 2, 0
_080337B0: .4byte gBmMapSize

	THUMB_FUNC_END sub_8033798

	THUMB_FUNC_START sub_80337B4
sub_80337B4: @ 0x080337B4
	movs r1, #2
	negs r1, r1
	str r1, [r0, #0x34]
	movs r1, #0
	str r1, [r0, #0x38]
	ldr r1, _080337D0  @ gBmMapSize
	movs r2, #0
	ldrsh r1, [r1, r2]
	lsls r1, r1, #3
	subs r1, #0x78
	adds r0, #0x4c
	strh r1, [r0]
	bx lr
	.align 2, 0
_080337D0: .4byte gBmMapSize

	THUMB_FUNC_END sub_80337B4

	THUMB_FUNC_START sub_80337D4
sub_80337D4: @ 0x080337D4
	movs r1, #0
	str r1, [r0, #0x34]
	subs r1, #2
	str r1, [r0, #0x38]
	ldr r1, _080337EC  @ gBmMapSize
	movs r2, #2
	ldrsh r1, [r1, r2]
	lsls r1, r1, #3
	subs r1, #0x50
	adds r0, #0x4c
	strh r1, [r0]
	bx lr
	.align 2, 0
_080337EC: .4byte gBmMapSize

	THUMB_FUNC_END sub_80337D4

	THUMB_FUNC_START sub_80337F0
sub_80337F0: @ 0x080337F0
	push {r4, r5, lr}
	adds r3, r0, #0
	ldr r0, _08033838  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0xb
	ands r0, r1
	cmp r0, #0
	beq _0803380A
	adds r1, r3, #0
	adds r1, #0x4a
	movs r0, #1
	strh r0, [r1]
_0803380A:
	adds r0, r3, #0
	adds r0, #0x4a
	movs r1, #0
	ldrsh r0, [r0, r1]
	ldr r4, [r3, #0x2c]
	ldr r5, [r3, #0x30]
	cmp r0, #0
	beq _0803383C
	movs r1, #0xf
	adds r0, r4, #0
	ands r0, r1
	cmp r0, #0
	bne _0803383C
	adds r0, r5, #0
	ands r0, r1
	cmp r0, #0
	bne _0803383C
	adds r0, r3, #0
	movs r1, #2
	bl Proc_Goto
	b _08033864
	.align 2, 0
_08033838: .4byte gKeyStatusPtr
_0803383C:
	ldr r2, [r3, #0x34]
	adds r2, r4, r2
	str r2, [r3, #0x2c]
	ldr r0, [r3, #0x38]
	adds r0, r5, r0
	str r0, [r3, #0x30]
	ldr r1, _0803386C  @ gUnknown_0202BCB0
	strh r2, [r1, #0xc]
	strh r0, [r1, #0xe]
	adds r1, r3, #0
	adds r1, #0x4c
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	cmp r0, #0
	bgt _08033864
	adds r0, r3, #0
	bl Proc_Break
_08033864:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0803386C: .4byte gUnknown_0202BCB0

	THUMB_FUNC_END sub_80337F0

	THUMB_FUNC_START InitPrepScreenUnitsAndCamera
InitPrepScreenUnitsAndCamera: @ 0x08033870
	push {r4, r5, lr}
	bl LoadUnitPrepScreenPositions
	ldr r4, _080338B8  @ gRAMChapterData
	ldrb r1, [r4, #0x14]
	movs r5, #0x10
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	bne _08033892
	bl SortPlayerUnitsForPrepScreen
	bl InitPlayerUnitPositionsForPrepScreen
	ldrb r0, [r4, #0x14]
	orrs r0, r5
	strb r0, [r4, #0x14]
_08033892:
	movs r0, #0
	bl sub_8015A40
	ldr r4, _080338BC  @ gUnknown_0202BCB0
	strh r0, [r4, #0xc]
	movs r0, #0
	bl sub_8015A6C
	strh r0, [r4, #0xe]
	ldrb r0, [r4, #4]
	orrs r0, r5
	strb r0, [r4, #4]
	bl RefreshEntityBmMaps
	bl RenderBmMap
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080338B8: .4byte gRAMChapterData
_080338BC: .4byte gUnknown_0202BCB0

	THUMB_FUNC_END InitPrepScreenUnitsAndCamera

	THUMB_FUNC_START sub_80338C0
sub_80338C0: @ 0x080338C0
	push {r4, r5, lr}
	sub sp, #4
	bl GetPlayerLeaderUnitId
	bl GetUnitFromCharId
	adds r4, r0, #0
	cmp r4, #0
	beq _080338E8
	bl sub_8095970
	cmp r0, #0
	beq _080338E8
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	bl SetCursorMapPosition
	b _0803391A
_080338E8:
	bl GetChapterAllyUnitDataPointer
	adds r4, r0, #0
	bl sub_809541C
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r4, r4, r1
	mov r5, sp
	adds r5, #1
	adds r0, r4, #0
	mov r1, sp
	adds r2, r5, #0
	movs r3, #0
	bl GetPreferredPositionForUNIT
	mov r0, sp
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #0
	ldrsb r1, [r5, r1]
	bl SetCursorMapPosition
_0803391A:
	ldr r4, _0803393C  @ gUnknown_0202BCB0
	movs r1, #0x14
	ldrsh r0, [r4, r1]
	lsls r0, r0, #4
	bl sub_8015A40
	strh r0, [r4, #0xc]
	movs r1, #0x16
	ldrsh r0, [r4, r1]
	lsls r0, r0, #4
	bl sub_8015A6C
	strh r0, [r4, #0xe]
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0803393C: .4byte gUnknown_0202BCB0

	THUMB_FUNC_END sub_80338C0

	THUMB_FUNC_START sub_8033940
sub_8033940: @ 0x08033940
	push {r4, lr}
	adds r4, r0, #0
	bl DoesBMXFADEExist
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0803395E
	ldr r0, [r4, #0x58]
	cmp r0, #2
	bne _08033958
	bl sub_80332D0
_08033958:
	adds r0, r4, #0
	bl Proc_Break
_0803395E:
	ldr r1, _08033974  @ gUnknown_0202BCB0
	movs r2, #0x20
	ldrsh r0, [r1, r2]
	movs r2, #0x22
	ldrsh r1, [r1, r2]
	movs r2, #0
	bl DisplayCursor
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08033974: .4byte gUnknown_0202BCB0

	THUMB_FUNC_END sub_8033940

	THUMB_FUNC_START sub_8033978
sub_8033978: @ 0x08033978
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	bl HandlePlayerCursorMovement
	bl DoesBMXFADEExist
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803398C
	b _08033BDC
_0803398C:
	ldr r0, _080339C0  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080339CC
	ldr r1, _080339C4  @ gUnknown_0202BCB0
	movs r2, #0x14
	ldrsh r0, [r1, r2]
	movs r3, #0x16
	ldrsh r1, [r1, r3]
	bl sub_801DB4C
	ldr r0, _080339C8  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	bge _080339B8
	b _08033BDC
_080339B8:
	movs r0, #0x6b
	bl m4aSongNumStart
	b _08033BDC
	.align 2, 0
_080339C0: .4byte gKeyStatusPtr
_080339C4: .4byte gUnknown_0202BCB0
_080339C8: .4byte gRAMChapterData
_080339CC:
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08033A3C
	ldr r4, _08033A34  @ gUnknown_0202BCB0
	movs r1, #0x16
	ldrsh r0, [r4, r1]
	ldr r6, _08033A38  @ gBmMapUnit
	ldr r1, [r6]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r2, #0x14
	ldrsh r1, [r4, r2]
	ldr r0, [r0]
	adds r1, r0, r1
	ldrb r0, [r1]
	cmp r0, #0
	beq _08033A3C
	bl GetUnit
	bl sub_801C928
	cmp r0, #0
	beq _08033A3C
	bl MU_EndAll
	bl DeletePlayerPhaseInterface6Cs
	movs r0, #0x1f
	bl SetStatScreenConfig
	movs r3, #0x16
	ldrsh r0, [r4, r3]
	ldr r1, [r6]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r2, #0x14
	ldrsh r1, [r4, r2]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	bl GetUnit
	adds r1, r5, #0
	bl StartStatScreen
	adds r0, r5, #0
	movs r1, #5
	bl Proc_Goto
	b _08033BEC
	.align 2, 0
_08033A34: .4byte gUnknown_0202BCB0
_08033A38: .4byte gBmMapUnit
_08033A3C:
	ldr r0, _08033A68  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08033A74
	bl DeletePlayerPhaseInterface6Cs
	ldr r4, _08033A6C  @ gRAMChapterData
	ldr r1, _08033A70  @ gUnknown_0202BCB0
	ldrh r0, [r1, #0x14]
	strb r0, [r4, #0x12]
	ldrh r0, [r1, #0x16]
	strb r0, [r4, #0x13]
	adds r0, r5, #0
	movs r1, #0
	bl Proc_Goto
	adds r4, #0x41
	ldrb r0, [r4]
	b _08033B36
	.align 2, 0
_08033A68: .4byte gKeyStatusPtr
_08033A6C: .4byte gRAMChapterData
_08033A70: .4byte gUnknown_0202BCB0
_08033A74:
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _08033A7E
	b _08033BB4
_08033A7E:
	ldr r2, _08033AB0  @ gUnknown_0202BCB0
	movs r3, #0x16
	ldrsh r0, [r2, r3]
	ldr r1, _08033AB4  @ gBmMapUnit
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r4, #0x14
	ldrsh r1, [r2, r4]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	bl GetUnit
	adds r4, r0, #0
	bl GetUnitSelectionValueThing
	cmp r0, #4
	bls _08033AA6
	b _08033BB4
_08033AA6:
	lsls r0, r0, #2
	ldr r1, _08033AB8  @ _08033ABC
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08033AB0: .4byte gUnknown_0202BCB0
_08033AB4: .4byte gBmMapUnit
_08033AB8: .4byte _08033ABC
_08033ABC: @ jump table
	.4byte _08033AD0 @ case 0
	.4byte _08033AD0 @ case 1
	.4byte _08033B48 @ case 2
	.4byte _08033B90 @ case 3
	.4byte _08033B70 @ case 4
_08033AD0:
	bl DeletePlayerPhaseInterface6Cs
	ldr r3, _08033B1C  @ gRAMChapterData
	ldr r2, _08033B20  @ gUnknown_0202BCB0
	ldrh r0, [r2, #0x14]
	strb r0, [r3, #0x12]
	ldrh r0, [r2, #0x16]
	strb r0, [r3, #0x13]
	movs r1, #0x16
	ldrsh r0, [r2, r1]
	ldr r1, _08033B24  @ gBmMapTerrain
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r4, #0x14
	ldrsh r1, [r2, r4]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #7
	bgt _08033B28
	cmp r0, #6
	blt _08033B28
	adds r0, r3, #0
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08033B10
	movs r0, #0x6a
	bl m4aSongNumStart
_08033B10:
	adds r0, r5, #0
	movs r1, #0x3c
	bl Proc_Goto
	b _08033BEC
	.align 2, 0
_08033B1C: .4byte gRAMChapterData
_08033B20: .4byte gUnknown_0202BCB0
_08033B24: .4byte gBmMapTerrain
_08033B28:
	adds r0, r5, #0
	movs r1, #0
	bl Proc_Goto
	ldr r0, _08033B44  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
_08033B36:
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08033BEC
	movs r0, #0x69
	bl m4aSongNumStart
	b _08033BEC
	.align 2, 0
_08033B44: .4byte gRAMChapterData
_08033B48:
	adds r0, r4, #0
	bl UnitBeginAction
	ldr r0, _08033B6C  @ gActiveUnit
	ldr r2, [r0]
	ldr r0, [r2, #0xc]
	movs r1, #2
	negs r1, r1
	ands r0, r1
	str r0, [r2, #0xc]
	ldr r0, [r5, #0x58]
	cmp r0, #2
	bne _08033BA4
	adds r0, r5, #0
	movs r1, #3
	bl Proc_Goto
	b _08033BEC
	.align 2, 0
_08033B6C: .4byte gActiveUnit
_08033B70:
	ldr r0, [r5, #0x58]
	cmp r0, #2
	bne _08033B90
	ldr r0, _08033B8C  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08033BEC
	movs r0, #0x6c
	bl m4aSongNumStart
	b _08033BEC
	.align 2, 0
_08033B8C: .4byte gRAMChapterData
_08033B90:
	adds r0, r4, #0
	bl UnitBeginAction
	ldr r0, _08033BB0  @ gActiveUnit
	ldr r2, [r0]
	ldr r0, [r2, #0xc]
	movs r1, #2
	negs r1, r1
	ands r0, r1
	str r0, [r2, #0xc]
_08033BA4:
	adds r0, r5, #0
	movs r1, #1
	bl Proc_Goto
	b _08033BEC
	.align 2, 0
_08033BB0: .4byte gActiveUnit
_08033BB4:
	ldr r0, _08033BD8  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _08033BDC
	bl DeletePlayerPhaseInterface6Cs
	adds r0, r5, #0
	bl sub_80A87DC
	adds r0, r5, #0
	movs r1, #9
	bl Proc_Goto
	b _08033BEC
	.align 2, 0
_08033BD8: .4byte gKeyStatusPtr
_08033BDC:
	ldr r1, _08033BF4  @ gUnknown_0202BCB0
	movs r2, #0x20
	ldrsh r0, [r1, r2]
	movs r3, #0x22
	ldrsh r1, [r1, r3]
	movs r2, #0
	bl DisplayCursor
_08033BEC:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08033BF4: .4byte gUnknown_0202BCB0

	THUMB_FUNC_END sub_8033978

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
