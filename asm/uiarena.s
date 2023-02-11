	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	THUMB_FUNC_START sub_80B5730
sub_80B5730: @ 0x080B5730
	push {lr}
	ldr r2, _080B5758  @ gMPlayTable
	ldr r0, _080B575C  @ gSongTable
	movs r1, #0xe2
	lsls r1, r1, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r0, [r0]
	ldr r0, [r0, #4]
	ldr r1, _080B5760  @ 0x8000FFFF
	ands r0, r1
	cmp r0, #0
	beq _080B5764
	movs r0, #1
	b _080B5766
	.align 2, 0
_080B5758: .4byte gMPlayTable
_080B575C: .4byte gSongTable
_080B5760: .4byte 0x8000FFFF
_080B5764:
	movs r0, #0
_080B5766:
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80B5730

	THUMB_FUNC_START sub_80B576C
sub_80B576C: @ 0x080B576C
	push {lr}
	ldr r0, _080B5784  @ gActiveUnit
	ldr r0, [r0]
	bl ArenaBegin
	ldr r0, _080B5788  @ gUnknown_08A394DC
	movs r1, #3
	bl Proc_Start
	pop {r0}
	bx r0
	.align 2, 0
_080B5784: .4byte gActiveUnit
_080B5788: .4byte gUnknown_08A394DC

	THUMB_FUNC_END sub_80B576C

	THUMB_FUNC_START sub_80B578C
sub_80B578C: @ 0x080B578C
	push {lr}
	ldr r0, _080B579C  @ gUnknown_08A3963C
	movs r1, #3
	bl Proc_Start
	pop {r0}
	bx r0
	.align 2, 0
_080B579C: .4byte gUnknown_08A3963C

	THUMB_FUNC_END sub_80B578C

	THUMB_FUNC_START sub_80B57A0
sub_80B57A0: @ 0x080B57A0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r6, r0, #0
	ldr r0, _080B5948  @ gProcScr_MoveUnit
	ldr r1, _080B594C  @ MU_Hide
	bl Proc_ForEach
	bl sub_80B52CC
	ldr r7, _080B5950  @ gLCDControlBuffer
	ldrb r2, [r7, #0xc]
	movs r1, #4
	negs r1, r1
	adds r0, r1, #0
	ands r0, r2
	strb r0, [r7, #0xc]
	ldrb r2, [r7, #0x10]
	adds r0, r1, #0
	ands r0, r2
	movs r2, #2
	mov r8, r2
	mov r3, r8
	orrs r0, r3
	strb r0, [r7, #0x10]
	ldrb r0, [r7, #0x14]
	ands r1, r0
	strb r1, [r7, #0x14]
	ldrb r0, [r7, #0x18]
	movs r1, #3
	orrs r0, r1
	strb r0, [r7, #0x18]
	movs r0, #0x80
	lsls r0, r0, #2
	movs r1, #2
	movs r2, #0
	bl sub_800680C
	bl ResetFaces
	movs r0, #1
	str r0, [sp]
	movs r0, #0x67
	movs r1, #0x20
	movs r2, #8
	movs r3, #3
	bl sub_8007938
	ldr r0, _080B5954  @ gUnknown_089AD934
	ldr r5, _080B5958  @ gGenericBuffer
	adds r1, r5, #0
	bl CopyDataWithPossibleUncomp
	ldr r4, _080B595C  @ gBG1TilemapBuffer
	movs r2, #0x80
	lsls r2, r2, #5
	adds r0, r4, #0
	adds r1, r5, #0
	bl CallARM_FillTileRect
	movs r5, #0x80
	lsls r5, r5, #2
	adds r4, r4, r5
	adds r0, r4, #0
	movs r1, #0x1e
	movs r2, #0xc
	movs r3, #0
	bl TileMap_FillRect
	movs r0, #2
	bl BG_EnableSyncByMask
	adds r0, r6, #0
	bl StartUiGoldBox
	ldrb r0, [r7, #1]
	movs r6, #0x20
	orrs r0, r6
	movs r1, #0x40
	orrs r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r7, #1]
	movs r0, #0x34
	adds r0, r0, r7
	mov r9, r0
	ldrb r4, [r0]
	movs r5, #1
	orrs r4, r5
	mov r1, r8
	orrs r4, r1
	movs r0, #4
	orrs r4, r0
	movs r3, #8
	orrs r4, r3
	movs r0, #0x10
	orrs r4, r0
	movs r2, #0x35
	adds r2, r2, r7
	mov sl, r2
	ldrb r2, [r2]
	orrs r2, r5
	orrs r2, r1
	subs r6, #0x25
	ands r2, r6
	orrs r2, r3
	orrs r2, r0
	movs r1, #0x36
	adds r1, r1, r7
	mov ip, r1
	ldrb r1, [r1]
	orrs r1, r5
	mov r5, r8
	orrs r1, r5
	ands r1, r6
	orrs r1, r3
	orrs r1, r0
	adds r3, r7, #0
	adds r3, #0x2d
	movs r6, #0
	movs r0, #0x58
	strb r0, [r3]
	adds r3, #4
	movs r0, #0x48
	strb r0, [r3]
	adds r0, r7, #0
	adds r0, #0x2c
	movs r5, #0xf0
	strb r5, [r0]
	subs r3, #1
	movs r0, #0x98
	strb r0, [r3]
	adds r0, r7, #0
	adds r0, #0x2f
	strb r6, [r0]
	adds r3, #3
	movs r0, #8
	strb r0, [r3]
	adds r0, r7, #0
	adds r0, #0x2e
	strb r5, [r0]
	subs r3, #1
	movs r0, #0x38
	strb r0, [r3]
	subs r0, #0x59
	ands r4, r0
	mov r3, r9
	strb r4, [r3]
	movs r5, #0x20
	orrs r2, r5
	mov r3, sl
	strb r2, [r3]
	ands r1, r0
	mov r5, ip
	strb r1, [r5]
	movs r0, #3
	movs r1, #0
	movs r2, #0
	movs r3, #8
	bl SetSpecialColorEffectsParameters
	str r6, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #1
	bl SetBlendTargetA
	str r6, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl SetBlendTargetB
	ldr r4, _080B5960  @ gUnknown_089A8F94
	movs r0, #3
	bl GetBackgroundTileDataOffset
	adds r1, r0, #0
	movs r6, #0xc0
	lsls r6, r6, #0x13
	adds r1, r1, r6
	adds r0, r4, #0
	bl CopyDataWithPossibleUncomp
	ldr r0, _080B5964  @ gBG3TilemapBuffer
	ldr r1, _080B5968  @ gUnknown_089ABB70
	movs r2, #0xc0
	lsls r2, r2, #8
	bl CallARM_FillTileRect
	ldr r0, _080B596C  @ gUnknown_089AC024
	movs r1, #0xc0
	lsls r1, r1, #1
	movs r2, #0x80
	bl CopyToPaletteBuffer
	movs r0, #8
	bl BG_EnableSyncByMask
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B5948: .4byte gProcScr_MoveUnit
_080B594C: .4byte MU_Hide
_080B5950: .4byte gLCDControlBuffer
_080B5954: .4byte gUnknown_089AD934
_080B5958: .4byte gGenericBuffer
_080B595C: .4byte gBG1TilemapBuffer
_080B5960: .4byte gUnknown_089A8F94
_080B5964: .4byte gBG3TilemapBuffer
_080B5968: .4byte gUnknown_089ABB70
_080B596C: .4byte gUnknown_089AC024

	THUMB_FUNC_END sub_80B57A0

	THUMB_FUNC_START sub_80B5970
sub_80B5970: @ 0x080B5970
	push {lr}
	ldr r0, _080B598C  @ gArenaState
	ldr r0, [r0]
	ldr r1, _080B5990  @ gBattleActor
	bl UpdateUnitFromBattle
	ldr r0, _080B5994  @ gActiveUnit
	ldr r0, [r0]
	bl MU_Create
	bl MU_SetDefaultFacing_Auto
	pop {r0}
	bx r0
	.align 2, 0
_080B598C: .4byte gArenaState
_080B5990: .4byte gBattleActor
_080B5994: .4byte gActiveUnit

	THUMB_FUNC_END sub_80B5970

	THUMB_FUNC_START sub_80B5998
sub_80B5998: @ 0x080B5998
	push {lr}
	adds r2, r0, #0
	ldr r0, _080B59B8  @ gArenaState
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	lsrs r0, r0, #0x11
	movs r1, #7
	ands r0, r1
	cmp r0, #4
	bhi _080B59BC
	movs r0, #0x8d
	lsls r0, r0, #4
	adds r1, r2, #0
	bl sub_80B5C04
	b _080B59C4
	.align 2, 0
_080B59B8: .4byte gArenaState
_080B59BC:
	ldr r0, _080B59C8  @ 0x000008D1
	adds r1, r2, #0
	bl sub_80B5C04
_080B59C4:
	pop {r0}
	bx r0
	.align 2, 0
_080B59C8: .4byte 0x000008D1

	THUMB_FUNC_END sub_80B5998

	THUMB_FUNC_START sub_80B59CC
sub_80B59CC: @ 0x080B59CC
	push {r4, lr}
	adds r4, r0, #0
	bl ArenaGetMatchupGoldValue
	bl sub_8008A18
	ldr r0, _080B59E8  @ 0x000008D2
	adds r1, r4, #0
	bl sub_80B5C04
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B59E8: .4byte 0x000008D2

	THUMB_FUNC_END sub_80B59CC

	THUMB_FUNC_START sub_80B59EC
sub_80B59EC: @ 0x080B59EC
	push {r4, r5, lr}
	adds r5, r0, #0
	bl GetDialoguePromptResult
	cmp r0, #1
	beq _080B5A10
	ldr r0, _080B5A0C  @ 0x000008D4
	adds r1, r5, #0
	bl sub_80B5C04
	adds r0, r5, #0
	movs r1, #2
	bl Proc_Goto
	b _080B5A2E
	.align 2, 0
_080B5A0C: .4byte 0x000008D4
_080B5A10:
	bl ArenaGetMatchupGoldValue
	adds r4, r0, #0
	bl GetPartyGoldAmount
	cmp r4, r0
	ble _080B5A2E
	ldr r0, _080B5A34  @ 0x000008DA
	adds r1, r5, #0
	bl sub_80B5C04
	adds r0, r5, #0
	movs r1, #2
	bl Proc_Goto
_080B5A2E:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B5A34: .4byte 0x000008DA

	THUMB_FUNC_END sub_80B59EC

	THUMB_FUNC_START sub_80B5A38
sub_80B5A38: @ 0x080B5A38
	push {r4, r5, lr}
	adds r5, r0, #0
	bl GetPartyGoldAmount
	adds r4, r0, #0
	bl ArenaGetMatchupGoldValue
	subs r4, r4, r0
	adds r0, r4, #0
	bl SetPartyGoldAmount
	ldr r0, _080B5A74  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080B5A60
	movs r0, #0xb9
	bl m4aSongNumStart
_080B5A60:
	ldr r0, _080B5A78  @ gUnknown_02022E5E
	bl DisplayGoldBoxText
	adds r0, r5, #0
	bl sub_80B5C48
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B5A74: .4byte gRAMChapterData
_080B5A78: .4byte gUnknown_02022E5E

	THUMB_FUNC_END sub_80B5A38

	THUMB_FUNC_START sub_80B5A7C
sub_80B5A7C: @ 0x080B5A7C
	push {lr}
	adds r1, r0, #0
	ldr r0, _080B5A8C  @ 0x000008D5
	bl sub_80B5C04
	pop {r0}
	bx r0
	.align 2, 0
_080B5A8C: .4byte 0x000008D5

	THUMB_FUNC_END sub_80B5A7C

	THUMB_FUNC_START sub_80B5A90
sub_80B5A90: @ 0x080B5A90
	push {lr}
	adds r1, r0, #0
	ldr r0, _080B5AA0  @ 0x000008D3
	bl sub_80B5C04
	pop {r0}
	bx r0
	.align 2, 0
_080B5AA0: .4byte 0x000008D3

	THUMB_FUNC_END sub_80B5A90

	THUMB_FUNC_START sub_80B5AA4
sub_80B5AA4: @ 0x080B5AA4
	push {lr}
	movs r0, #1
	negs r0, r0
	bl Sound_FadeOutBGM
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80B5AA4

	THUMB_FUNC_START sub_80B5AB4
sub_80B5AB4: @ 0x080B5AB4
	push {r4, r5, r6, lr}
	movs r1, #7
	bl Proc_SetMark
	bl ResetDialogueScreen
	ldr r0, _080B5AF4  @ gProcScr_GoldBox
	bl Proc_EndEach
	ldr r5, _080B5AF8  @ gActionData
	movs r6, #0
	movs r0, #0x19
	strb r0, [r5, #0x11]
	ldr r4, _080B5AFC  @ gActiveUnit
	ldr r0, [r4]
	ldr r1, [r0, #0xc]
	movs r2, #0x40
	orrs r1, r2
	str r1, [r0, #0xc]
	bl sub_80A44C8
	bl MU_EndAll
	strb r6, [r5, #0x15]
	ldr r0, [r4]
	bl BattleGenerateArena
	bl BeginBattleAnimations
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B5AF4: .4byte gProcScr_GoldBox
_080B5AF8: .4byte gActionData
_080B5AFC: .4byte gActiveUnit

	THUMB_FUNC_END sub_80B5AB4

	THUMB_FUNC_START sub_80B5B00
sub_80B5B00: @ 0x080B5B00
	push {lr}
	bl sub_8014944
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80B5B00

	THUMB_FUNC_START sub_80B5B0C
sub_80B5B0C: @ 0x080B5B0C
	push {lr}
	bl sub_80B57A0
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80B5B0C

	THUMB_FUNC_START sub_80B5B18
sub_80B5B18: @ 0x080B5B18
	push {r4, r5, lr}
	adds r5, r0, #0
	bl GetPartyGoldAmount
	adds r4, r0, #0
	bl ArenaGetResult
	cmp r0, #2
	beq _080B5B5C
	cmp r0, #2
	bgt _080B5B34
	cmp r0, #1
	beq _080B5B3E
	b _080B5B90
_080B5B34:
	cmp r0, #3
	beq _080B5B6C
	cmp r0, #4
	beq _080B5B88
	b _080B5B90
_080B5B3E:
	bl ArenaGetMatchupGoldValue
	lsls r0, r0, #1
	bl sub_8008A18
	ldr r0, _080B5B58  @ 0x000008D6
	adds r1, r5, #0
	bl sub_80B5C04
	bl ArenaGetMatchupGoldValue
	lsls r0, r0, #1
	b _080B5B78
	.align 2, 0
_080B5B58: .4byte 0x000008D6
_080B5B5C:
	ldr r0, _080B5B68  @ 0x000008D7
	adds r1, r5, #0
	bl sub_80B5C04
	b _080B5B90
	.align 2, 0
_080B5B68: .4byte 0x000008D7
_080B5B6C:
	ldr r0, _080B5B84  @ 0x000008D9
	adds r1, r5, #0
	bl sub_80B5C04
	bl ArenaGetMatchupGoldValue
_080B5B78:
	adds r4, r4, r0
	adds r0, r4, #0
	bl SetPartyGoldAmount
	b _080B5B90
	.align 2, 0
_080B5B84: .4byte 0x000008D9
_080B5B88:
	ldr r0, _080B5B98  @ 0x000008D8
	adds r1, r5, #0
	bl sub_80B5C04
_080B5B90:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B5B98: .4byte 0x000008D8

	THUMB_FUNC_END sub_80B5B18

	THUMB_FUNC_START sub_80B5B9C
sub_80B5B9C: @ 0x080B5B9C
	push {r4, lr}
	adds r4, r0, #0
	bl ArenaGetResult
	cmp r0, #2
	beq _080B5BD6
	cmp r0, #2
	bgt _080B5BB2
	cmp r0, #1
	beq _080B5BB6
	b _080B5BD6
_080B5BB2:
	cmp r0, #3
	bne _080B5BD6
_080B5BB6:
	ldr r0, _080B5BDC  @ gUnknown_02022E5E
	bl DisplayGoldBoxText
	ldr r0, _080B5BE0  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080B5BCE
	movs r0, #0xb9
	bl m4aSongNumStart
_080B5BCE:
	adds r0, r4, #0
	movs r1, #0x3c
	bl NewBlockingTimer
_080B5BD6:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B5BDC: .4byte gUnknown_02022E5E
_080B5BE0: .4byte gRAMChapterData

	THUMB_FUNC_END sub_80B5B9C

	THUMB_FUNC_START sub_80B5BE4
sub_80B5BE4: @ 0x080B5BE4
	push {lr}
	ldr r0, _080B5BF8  @ gProcScr_GoldBox
	bl Proc_EndEach
	ldr r0, _080B5BFC  @ gProcScr_MoveUnit
	ldr r1, _080B5C00  @ MU_Show
	bl Proc_ForEach
	pop {r0}
	bx r0
	.align 2, 0
_080B5BF8: .4byte gProcScr_GoldBox
_080B5BFC: .4byte gProcScr_MoveUnit
_080B5C00: .4byte MU_Show

	THUMB_FUNC_END sub_80B5BE4

	THUMB_FUNC_START sub_80B5C04
sub_80B5C04: @ 0x080B5C04
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	bl sub_8006978
	bl sub_8008250
	adds r0, r4, #0
	bl GetStringFromIndex
	adds r2, r0, #0
	movs r0, #8
	movs r1, #2
	adds r3, r5, #0
	bl sub_800698C
	movs r0, #0
	bl sub_8006B10
	movs r0, #1
	bl sub_8006AA8
	movs r0, #2
	bl sub_8006AA8
	movs r0, #4
	bl sub_8006AA8
	movs r0, #1
	bl sub_8007838
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80B5C04

	THUMB_FUNC_START sub_80B5C48
sub_80B5C48: @ 0x080B5C48
	push {r4, r5, r6, lr}
	sub sp, #4
	movs r0, #0
	str r0, [sp]
	movs r0, #7
	movs r1, #9
	movs r2, #0x10
	movs r3, #6
	bl DrawUiFrame2
	movs r0, #0
	bl SetFont
	bl Font_LoadForUI
	ldr r4, _080B5CD4  @ gUnknown_02022F38
	ldr r0, _080B5CD8  @ gMid_Lv
	ldr r0, [r0]
	bl GetStringFromIndex
	adds r2, r0, #0
	adds r0, r4, #0
	movs r1, #0
	bl MADrawTextMaybe
	adds r0, r4, #0
	adds r0, #8
	ldr r5, _080B5CDC  @ gArenaState
	ldr r1, [r5, #4]
	movs r2, #8
	ldrsb r2, [r1, r2]
	movs r1, #2
	bl sub_8004B88
	adds r6, r4, #0
	adds r6, #0x80
	ldr r0, [r5, #4]
	ldr r0, [r0]
	ldrh r0, [r0]
	bl GetStringFromIndex
	adds r2, r0, #0
	adds r0, r6, #0
	movs r1, #0
	bl MADrawTextMaybe
	subs r6, #0x72
	ldr r0, [r5, #4]
	ldr r0, [r0, #4]
	ldrh r0, [r0]
	bl GetStringFromIndex
	adds r2, r0, #0
	adds r0, r6, #0
	movs r1, #0
	bl MADrawTextMaybe
	adds r4, #0x8e
	ldrh r0, [r5, #0x1c]
	bl GetItemName
	adds r2, r0, #0
	adds r0, r4, #0
	movs r1, #0
	bl MADrawTextMaybe
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B5CD4: .4byte gUnknown_02022F38
_080B5CD8: .4byte gMid_Lv
_080B5CDC: .4byte gArenaState

	THUMB_FUNC_END sub_80B5C48

	THUMB_FUNC_START sub_80B5CE0
sub_80B5CE0: @ 0x080B5CE0
	push {r4, lr}
	adds r4, r0, #0
	bl ArenaGetResult
	cmp r0, #1
	bne _080B5D08
	ldr r0, _080B5D04  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1f
	cmp r0, #0
	bne _080B5D22
	movs r0, #0x3a
	movs r1, #0
	bl Sound_PlaySong8002448
	b _080B5D22
	.align 2, 0
_080B5D04: .4byte gRAMChapterData
_080B5D08:
	ldr r0, _080B5D28  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1f
	cmp r0, #0
	bne _080B5D1C
	movs r0, #0x38
	movs r1, #0
	bl Sound_PlaySong8002448
_080B5D1C:
	adds r0, r4, #0
	bl Proc_End
_080B5D22:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B5D28: .4byte gRAMChapterData

	THUMB_FUNC_END sub_80B5CE0

	THUMB_FUNC_START sub_80B5D2C
sub_80B5D2C: @ 0x080B5D2C
	push {lr}
	movs r0, #0x38
	movs r1, #0
	movs r2, #0
	bl Sound_PlaySong80024E4
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80B5D2C

	THUMB_FUNC_START sub_80B5D3C
sub_80B5D3C: @ 0x080B5D3C
	push {lr}
	bl CallSuspendPromptEvent
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80B5D3C

	THUMB_FUNC_START sub_80B5D48
sub_80B5D48: @ 0x080B5D48
	push {lr}
	bl GetDialoguePromptResult
	cmp r0, #1
	bne _080B5D56
	movs r0, #1
	b _080B5D58
_080B5D56:
	movs r0, #0
_080B5D58:
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80B5D48

	THUMB_FUNC_START sub_80B5D5C
sub_80B5D5C: @ 0x080B5D5C
	push {lr}
	ldr r1, _080B5D70  @ gActionData
	movs r0, #0
	strb r0, [r1, #0x16]
	movs r0, #3
	bl SaveSuspendedGame
	pop {r0}
	bx r0
	.align 2, 0
_080B5D70: .4byte gActionData

	THUMB_FUNC_END sub_80B5D5C

.align 2, 0
