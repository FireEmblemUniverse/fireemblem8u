	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	@ General Battle Map System Stuff, mostly low level hardware stuff but also more

	THUMB_FUNC_START sub_8030F48
sub_8030F48: @ 0x08030F48
	push {r4, r5, lr}
	movs r0, #0
	bl SetupBackgrounds
	ldr r0, _08030FCC  @ SomeUpdateRoutine
	bl SetMainUpdateRoutine
	ldr r0, _08030FD0  @ GeneralVBlankHandler
	bl SetInterrupt_LCDVBlank
	bl sub_80156D4
	bl SetupMapSpritesPalettes
	bl SMS_ClearUsageTable
	bl ResetTraps
	ldr r4, _08030FD4  @ gUnknown_0202BCF0
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	bl GetROMChapterStruct
	ldrb r0, [r0, #0x12]
	movs r5, #0
	strb r0, [r4, #0x15]
	bl SetupBackgroundForWeatherMaybe
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	bl InitChapterMap
	bl AddSnagsAndWalls
	bl LoadChapterBallistae
	bl sub_8030174
	bl SetupGameVBlank6C
	ldr r0, _08030FD8  @ gUnknown_0859D908
	movs r1, #4
	bl Proc_Create
	ldr r0, _08030FDC  @ gPaletteBuffer
	strh r5, [r0]
	bl EnablePaletteSync
	ldr r2, _08030FE0  @ gLCDControlBuffer
	ldrb r0, [r2, #1]
	movs r1, #1
	orrs r0, r1
	movs r1, #2
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #9
	negs r1, r1
	ands r0, r1
	subs r1, #8
	ands r0, r1
	strb r0, [r2, #1]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08030FCC: .4byte SomeUpdateRoutine
_08030FD0: .4byte GeneralVBlankHandler
_08030FD4: .4byte gUnknown_0202BCF0
_08030FD8: .4byte gUnknown_0859D908
_08030FDC: .4byte gPaletteBuffer
_08030FE0: .4byte gLCDControlBuffer

	THUMB_FUNC_START sub_8030FE4
sub_8030FE4: @ 0x08030FE4
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r4, _08031068  @ gUnknown_0202BCF0
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	cmp r0, #0x7f
	bne _08030FF8
	bl sub_80A6C8C
_08030FF8:
	movs r0, #0
	bl SetupBackgrounds
	ldr r0, _0803106C  @ SomeUpdateRoutine
	bl SetMainUpdateRoutine
	ldr r0, _08031070  @ GeneralVBlankHandler
	bl SetInterrupt_LCDVBlank
	bl ResetGameState
	ldrb r0, [r4, #0x12]
	ldrb r1, [r4, #0x13]
	bl SetCursorMapPosition
	bl LoadGameCoreGfx
	bl SetupMapSpritesPalettes
	bl SMS_ClearUsageTable
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	bl InitChapterMap
	ldr r4, _08031074  @ gUnknown_0202BCB0
	adds r1, r4, #0
	adds r1, #0x3c
	movs r0, #1
	strb r0, [r1]
	adds r0, r5, #0
	bl MakeBMAPMAIN
	adds r5, r0, #0
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
	ldr r0, _08031078  @ gUnknown_0203A958
	ldrb r0, [r0, #0x16]
	cmp r0, #9
	bhi _080310CE
	lsls r0, r0, #2
	ldr r1, _0803107C  @ _08031080
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08031068: .4byte gUnknown_0202BCF0
_0803106C: .4byte SomeUpdateRoutine
_08031070: .4byte GeneralVBlankHandler
_08031074: .4byte gUnknown_0202BCB0
_08031078: .4byte gUnknown_0203A958
_0803107C: .4byte _08031080
_08031080: @ jump table
	.4byte _080310B0 @ case 0
	.4byte _080310A8 @ case 1
	.4byte _080310B0 @ case 2
	.4byte _080310B8 @ case 3
	.4byte _080310C0 @ case 4
	.4byte _080310CE @ case 5
	.4byte _080310CE @ case 6
	.4byte _080310CE @ case 7
	.4byte _080310CE @ case 8
	.4byte _080310C8 @ case 9
_080310A8:
	adds r0, r5, #0
	bl sub_803133C
	b _080310CE
_080310B0:
	adds r0, r5, #0
	bl sub_8031300
	b _080310CE
_080310B8:
	adds r0, r5, #0
	bl sub_80313BC
	b _080310CE
_080310C0:
	adds r0, r5, #0
	bl sub_80313F8
	b _080310CE
_080310C8:
	adds r0, r5, #0
	bl sub_8031474
_080310CE:
	movs r0, #1
	str r0, [sp]
	movs r1, #1
	movs r2, #1
	movs r3, #1
	bl sub_8001ED0
	movs r0, #1
	bl sub_8001F48
	movs r0, #3
	movs r1, #0
	movs r2, #0
	movs r3, #0x10
	bl SetSpecialColorEffectsParameters
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_START sub_80310F8
sub_80310F8: @ 0x080310F8
	push {lr}
	ldr r0, _08031144  @ SomeUpdateRoutine
	bl SetMainUpdateRoutine
	ldr r0, _08031148  @ GeneralVBlankHandler
	bl SetInterrupt_LCDVBlank
	bl LoadGameCoreGfx
	bl SetupMapSpritesPalettes
	bl ClearBG0BG1
	ldr r2, _0803114C  @ gLCDControlBuffer
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
	bl SetDefaultColorEffects
	movs r0, #0
	bl RegisterBlankTile
	ldr r0, _08031150  @ gBG2TilemapBuffer
	movs r1, #0
	bl BG_Fill
	movs r0, #4
	bl BG_EnableSyncByMask
	pop {r0}
	bx r0
	.align 2, 0
_08031144: .4byte SomeUpdateRoutine
_08031148: .4byte GeneralVBlankHandler
_0803114C: .4byte gLCDControlBuffer
_08031150: .4byte gBG2TilemapBuffer

	THUMB_FUNC_START sub_8031154
sub_8031154: @ 0x08031154
	push {lr}
	bl LoadObjUIGfx
	ldr r0, _08031170  @ gUnknown_0203A4EC
	bl MakeMOVEUNITForMapUnit
	bl _MOVEUNIT6C_SetDefaultFacingDirection
	ldr r0, _08031174  @ gUnknown_0859D9E4
	movs r1, #3
	bl Proc_Create
	pop {r0}
	bx r0
	.align 2, 0
_08031170: .4byte gUnknown_0203A4EC
_08031174: .4byte gUnknown_0859D9E4

	THUMB_FUNC_START LoadGameCoreGfx2
LoadGameCoreGfx2: @ 0x08031178
	push {r4, lr}
	ldr r4, _080311A4  @ gUnknown_0202BCF0
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	bl LoadChapterMapGfx
	ldrb r0, [r4, #0x15]
	bl SetupOAMSpliceForWeather
	bl UpdateGameTilesGraphics
	bl SMS_UpdateFromGameData
	bl SetupMapSpritesPalettes
	bl SMS_FlushIndirect
	bl Font_LoadForUI
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080311A4: .4byte gUnknown_0202BCF0

	THUMB_FUNC_START sub_80311A8
sub_80311A8: @ 0x080311A8
	push {lr}
	movs r0, #0
	bl SetupBackgrounds
	bl LoadGameCoreGfx
	bl LoadGameCoreGfx2
	pop {r0}
	bx r0

	THUMB_FUNC_START MakeBMAPMAIN
MakeBMAPMAIN: @ 0x080311BC
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, _080311E8  @ gUnknown_0859A1F0
	movs r1, #2
	bl Proc_Create
	adds r5, r0, #0
	str r4, [r5, #0x54]
	adds r4, #0x28
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	bl SetupGameVBlank6C
	ldr r0, _080311EC  @ gUnknown_0859D908
	movs r1, #4
	bl Proc_Create
	adds r0, r5, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080311E8: .4byte gUnknown_0859A1F0
_080311EC: .4byte gUnknown_0859D908

	THUMB_FUNC_START sub_80311F0
sub_80311F0: @ 0x080311F0
	push {lr}
	movs r0, #1
	bl Proc_DeleteEachWithMark
	ldr r0, _08031210  @ gUnknown_0859A1F0
	bl Proc_Find
	ldr r2, [r0, #0x54]
	adds r2, #0x28
	ldrb r1, [r2]
	subs r1, #1
	strb r1, [r2]
	bl Proc_Delete
	pop {r0}
	bx r0
	.align 2, 0
_08031210: .4byte gUnknown_0859A1F0

	THUMB_FUNC_START sub_8031214
sub_8031214: @ 0x08031214
	push {r4, r5, r6, lr}
	movs r4, #1
_08031218:
	adds r0, r4, #0
	bl GetUnitStruct
	adds r1, r0, #0
	cmp r1, #0
	beq _08031238
	ldr r0, [r1]
	cmp r0, #0
	beq _08031238
	ldr r0, [r1, #4]
	ldrb r0, [r0, #4]
	cmp r0, #0x51
	bne _08031238
	adds r0, r1, #0
	bl ClearUnitStruct
_08031238:
	adds r4, #1
	cmp r4, #0x3f
	ble _08031218
	movs r4, #0x41
_08031240:
	adds r0, r4, #0
	bl GetUnitStruct
	adds r1, r0, #0
	cmp r1, #0
	beq _08031258
	ldr r0, [r1]
	cmp r0, #0
	beq _08031258
	adds r0, r1, #0
	bl ClearUnitStruct
_08031258:
	adds r4, #1
	cmp r4, #0xbf
	ble _08031240
	movs r5, #1
	movs r6, #0
_08031262:
	adds r0, r5, #0
	bl GetUnitStruct
	adds r4, r0, #0
	cmp r4, #0
	beq _080312DC
	ldr r0, [r4]
	cmp r0, #0
	beq _080312DC
	adds r0, r4, #0
	bl GetUnitMaxHP
	adds r1, r0, #0
	adds r0, r4, #0
	bl SetUnitHP
	adds r0, r4, #0
	movs r1, #0
	bl SetUnitNewStatus
	adds r0, r4, #0
	adds r0, #0x31
	strb r6, [r0]
	ldr r1, [r4, #0xc]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _080312A2
	movs r0, #0x80
	lsls r0, r0, #0xe
	orrs r1, r0
	b _080312A6
_080312A2:
	ldr r0, _080312F4  @ 0xFFDFFFFF
	ands r1, r0
_080312A6:
	str r1, [r4, #0xc]
	ldr r3, [r4, #0xc]
	ldr r0, _080312F8  @ 0x0631E004
	ands r3, r0
	str r3, [r4, #0xc]
	ldr r0, [r4]
	ldr r2, [r4, #4]
	ldr r1, [r0, #0x28]
	ldr r0, [r2, #0x28]
	orrs r1, r0
	movs r0, #0x80
	lsls r0, r0, #2
	ands r1, r0
	cmp r1, #0
	beq _080312CC
	movs r0, #5
	negs r0, r0
	ands r3, r0
	str r3, [r4, #0xc]
_080312CC:
	ldr r0, [r4, #0xc]
	movs r1, #9
	orrs r0, r1
	str r0, [r4, #0xc]
	strb r6, [r4, #0x1b]
	adds r0, r4, #0
	adds r0, #0x39
	strb r6, [r0]
_080312DC:
	adds r5, #1
	cmp r5, #0x3f
	ble _08031262
	ldr r2, _080312FC  @ gUnknown_0202BCF0
	ldrb r1, [r2, #0x14]
	movs r0, #0xef
	ands r0, r1
	strb r0, [r2, #0x14]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080312F4: .4byte 0xFFDFFFFF
_080312F8: .4byte 0x0631E004
_080312FC: .4byte gUnknown_0202BCF0

	THUMB_FUNC_START sub_8031300
sub_8031300: @ 0x08031300
	push {r4, lr}
	adds r4, r0, #0
	bl RefreshFogAndUnitMaps
	bl SMS_UpdateFromGameData
	ldr r2, _08031338  @ gLCDControlBuffer
	ldrb r1, [r2, #1]
	movs r0, #2
	negs r0, r0
	ands r0, r1
	movs r1, #3
	negs r1, r1
	ands r0, r1
	subs r1, #2
	ands r0, r1
	subs r1, #4
	ands r0, r1
	subs r1, #8
	ands r0, r1
	strb r0, [r2, #1]
	adds r0, r4, #0
	movs r1, #4
	bl Proc_GotoLabel
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08031338: .4byte gLCDControlBuffer

	THUMB_FUNC_START sub_803133C
sub_803133C: @ 0x0803133C
	push {r4, r5, lr}
	adds r4, r0, #0
	bl RefreshFogAndUnitMaps
	bl SMS_UpdateFromGameData
	ldr r2, _080313AC  @ gLCDControlBuffer
	ldrb r1, [r2, #1]
	movs r0, #2
	negs r0, r0
	ands r0, r1
	movs r1, #3
	negs r1, r1
	ands r0, r1
	subs r1, #2
	ands r0, r1
	subs r1, #4
	ands r0, r1
	subs r1, #8
	ands r0, r1
	strb r0, [r2, #1]
	adds r0, r4, #0
	movs r1, #6
	bl Proc_GotoLabel
	ldr r4, _080313B0  @ gUnknown_0203A958
	ldrb r0, [r4, #0xc]
	bl GetUnitStruct
	ldr r5, _080313B4  @ gUnknown_03004E50
	str r0, [r5]
	movs r1, #0x11
	ldrsb r1, [r0, r1]
	ldr r2, _080313B8  @ gUnknown_0202E4D8
	ldr r2, [r2]
	lsls r1, r1, #2
	adds r1, r1, r2
	movs r2, #0x10
	ldrsb r2, [r0, r2]
	ldr r0, [r1]
	adds r0, r0, r2
	movs r1, #0
	strb r1, [r0]
	ldrb r0, [r4, #0xc]
	bl GetUnitStruct
	bl HideUnitSMS
	ldr r0, [r5]
	bl MakeMOVEUNITForMapUnit
	bl _MOVEUNIT6C_SetDefaultFacingDirection
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080313AC: .4byte gLCDControlBuffer
_080313B0: .4byte gUnknown_0203A958
_080313B4: .4byte gUnknown_03004E50
_080313B8: .4byte gUnknown_0202E4D8

	THUMB_FUNC_START sub_80313BC
sub_80313BC: @ 0x080313BC
	push {r4, lr}
	adds r4, r0, #0
	bl RefreshFogAndUnitMaps
	bl SMS_UpdateFromGameData
	ldr r2, _080313F4  @ gLCDControlBuffer
	ldrb r1, [r2, #1]
	movs r0, #2
	negs r0, r0
	ands r0, r1
	movs r1, #3
	negs r1, r1
	ands r0, r1
	subs r1, #2
	ands r0, r1
	subs r1, #4
	ands r0, r1
	subs r1, #8
	ands r0, r1
	strb r0, [r2, #1]
	adds r0, r4, #0
	movs r1, #7
	bl Proc_GotoLabel
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080313F4: .4byte gLCDControlBuffer

	THUMB_FUNC_START sub_80313F8
sub_80313F8: @ 0x080313F8
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r5, _08031464  @ gUnknown_0203A958
	ldrb r0, [r5, #0xc]
	bl GetUnitStruct
	ldr r4, _08031468  @ gUnknown_03004E50
	str r0, [r4]
	bl PrepareArena2
	ldr r0, [r4]
	bl sub_802CD64
	bl BeginBattleAnimations
	ldr r2, _0803146C  @ gLCDControlBuffer
	ldrb r1, [r2, #1]
	movs r0, #2
	negs r0, r0
	ands r0, r1
	movs r1, #3
	negs r1, r1
	ands r0, r1
	subs r1, #2
	ands r0, r1
	subs r1, #4
	ands r0, r1
	subs r1, #8
	ands r0, r1
	strb r0, [r2, #1]
	bl RefreshFogAndUnitMaps
	ldrb r0, [r5, #0xf]
	ldr r1, _08031470  @ gUnknown_0202E4D8
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r1, [r5, #0xe]
	ldr r0, [r0]
	adds r0, r0, r1
	movs r1, #0
	strb r1, [r0]
	bl SMS_UpdateFromGameData
	adds r0, r6, #0
	movs r1, #0xa
	bl Proc_GotoLabel
	bl sub_80B578C
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08031464: .4byte gUnknown_0203A958
_08031468: .4byte gUnknown_03004E50
_0803146C: .4byte gLCDControlBuffer
_08031470: .4byte gUnknown_0202E4D8

	THUMB_FUNC_START sub_8031474
sub_8031474: @ 0x08031474
	push {r4, lr}
	adds r4, r0, #0
	bl RefreshFogAndUnitMaps
	bl SMS_UpdateFromGameData
	ldr r2, _080314AC  @ gLCDControlBuffer
	ldrb r1, [r2, #1]
	movs r0, #2
	negs r0, r0
	ands r0, r1
	movs r1, #3
	negs r1, r1
	ands r0, r1
	subs r1, #2
	ands r0, r1
	subs r1, #4
	ands r0, r1
	subs r1, #8
	ands r0, r1
	strb r0, [r2, #1]
	adds r0, r4, #0
	movs r1, #8
	bl Proc_GotoLabel
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080314AC: .4byte gLCDControlBuffer

	THUMB_FUNC_START sub_80314B0
sub_80314B0: @ 0x080314B0
	push {r4, lr}
	ldr r4, _080314D0  @ gUnknown_0202BCF0
	adds r0, r4, #0
	bl RegisterChapterTimeAndTurnCount
	bl sub_80B6504
	bl sub_80A3DD8
	ldrb r1, [r4, #0x14]
	movs r0, #0x20
	orrs r0, r1
	strb r0, [r4, #0x14]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080314D0: .4byte gUnknown_0202BCF0

	THUMB_FUNC_START sub_80314D4
sub_80314D4: @ 0x080314D4
	push {lr}
	movs r0, #3
	bl SetNextGameActionId
	bl sub_80A4C14
	pop {r0}
	bx r0

	THUMB_FUNC_START GetTacticianNameStringPtr
GetTacticianNameStringPtr: @ 0x080314E4
	ldr r0, _080314E8  @ gUnknown_0202BD10
	bx lr
	.align 2, 0
_080314E8: .4byte gUnknown_0202BD10

	THUMB_FUNC_START sub_80314EC
sub_80314EC: @ 0x080314EC
	push {lr}
	adds r1, r0, #0
	ldr r0, _080314FC  @ gUnknown_0202BD10
	bl strcpy
	pop {r0}
	bx r0
	.align 2, 0
_080314FC: .4byte gUnknown_0202BD10

.align 2, 0
