	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	THUMB_FUNC_START EkrLvup_MainAnime
EkrLvup_MainAnime: @ 0x080741CC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	adds r5, r0, #0
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x14
	bne _0807429E
	movs r0, #0
	strh r0, [r5, #0x2c]
	movs r1, #0x2e
	ldrsh r0, [r5, r1]
	cmp r0, #8
	beq _080742A6
	ldr r7, _08074278  @ gEkrLvupBaseStatus
_080741F2:
	movs r2, #0x2e
	ldrsh r0, [r5, r2]
	lsls r0, r0, #1
	adds r3, r0, r7
	ldrh r2, [r3]
	ldr r1, _0807427C  @ gEkrLvupPostStatus
	adds r0, r0, r1
	ldrh r0, [r0]
	subs r6, r0, r2
	cmp r6, #0
	beq _08074290
	movs r1, #0
	mov r8, r1
	strh r0, [r3]
	movs r2, #0x2e
	ldrsh r1, [r5, r2]
	adds r0, r5, #0
	bl EkrLvup_DrawUpdatedStatus
	movs r0, #0x76
	movs r1, #0x80
	lsls r1, r1, #1
	bl SomePlaySound_8071990
	movs r0, #0x76
	movs r1, #0x38
	movs r2, #0
	bl M4aPlayWithPostionCtrl
	ldr r1, _08074280  @ sEfxLvupPartsPos
	movs r0, #0x2e
	ldrsh r4, [r5, r0]
	lsls r0, r4, #1
	adds r0, r0, r1
	ldrh r3, [r0]
	movs r2, #0x1f
	ands r2, r3
	lsls r2, r2, #3
	adds r2, #0x35
	movs r1, #0xfc
	lsls r1, r1, #3
	adds r0, r1, #0
	ands r3, r0
	lsrs r3, r3, #2
	adds r3, #6
	adds r4, #1
	str r4, [sp]
	str r6, [sp, #4]
	movs r0, #0xa0
	movs r1, #1
	bl sub_8074D58
	movs r2, #0x2e
	ldrsh r0, [r5, r2]
	cmp r0, #0
	bne _08074272
	ldr r1, _08074284  @ gEkrPairMaxHP
	lsls r0, r0, #1
	adds r0, r0, r7
	ldrh r0, [r0]
	strh r0, [r1, #2]
	ldr r1, _08074288  @ gUnknown_0203E1B4
	ldr r0, _0807428C  @ 0x0000FFFF
	strh r0, [r1, #2]
_08074272:
	mov r0, r8
	strh r0, [r5, #0x2c]
	b _0807429E
	.align 2, 0
_08074278: .4byte gEkrLvupBaseStatus
_0807427C: .4byte gEkrLvupPostStatus
_08074280: .4byte sEfxLvupPartsPos
_08074284: .4byte gEkrPairMaxHP
_08074288: .4byte gUnknown_0203E1B4
_0807428C: .4byte 0x0000FFFF
_08074290:
	ldrh r0, [r5, #0x2e]
	adds r0, #1
	strh r0, [r5, #0x2e]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #8
	bne _080741F2
_0807429E:
	movs r1, #0x2e
	ldrsh r0, [r5, r1]
	cmp r0, #8
	bne _080742B0
_080742A6:
	movs r0, #0
	strh r0, [r5, #0x2c]
	adds r0, r5, #0
	bl Proc_Break
_080742B0:
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END EkrLvup_MainAnime

	THUMB_FUNC_START EkrLvup_SetHBlank
EkrLvup_SetHBlank: @ 0x080742BC
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x6d
	ble _080742E2
	movs r0, #0
	strh r0, [r4, #0x2c]
	bl EkrLvupApfxEndEach
	ldr r0, _080742E8  @ EkrLvupHBlank
	bl SetPrimaryHBlankHandler
	adds r0, r4, #0
	bl Proc_Break
_080742E2:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080742E8: .4byte EkrLvupHBlank

	THUMB_FUNC_END EkrLvup_SetHBlank

	THUMB_FUNC_START EkrLvup_DoNothing
EkrLvup_DoNothing: @ 0x080742EC
	push {lr}
	bl Proc_Break
	pop {r0}
	bx r0

	THUMB_FUNC_END EkrLvup_DoNothing

	THUMB_FUNC_START EkrLvup_PutWindowOffScreen
EkrLvup_PutWindowOffScreen: @ 0x080742F8
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r7, r0, #0
	ldr r5, _080743AC  @ gEkrLvupScrollPos1
	movs r0, #0x2c
	ldrsh r3, [r7, r0]
	movs r4, #8
	str r4, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0x90
	bl Interpolate
	strh r0, [r5]
	ldr r5, _080743B0  @ gEkrLvupScrollPos2
	movs r0, #0x2c
	ldrsh r3, [r7, r0]
	str r4, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0x90
	bl Interpolate
	strh r0, [r5]
	movs r2, #0x50
	negs r2, r2
	movs r0, #0x2c
	ldrsh r3, [r7, r0]
	str r4, [sp]
	movs r0, #0
	movs r1, #0
	bl Interpolate
	adds r5, r0, #0
	movs r0, #0x2c
	ldrsh r3, [r7, r0]
	str r4, [sp]
	movs r0, #0
	movs r1, #8
	movs r2, #0
	bl Interpolate
	adds r6, r0, #0
	ldr r0, _080743B4  @ gFaces
	ldr r1, [r0]
	movs r0, #0x50
	subs r0, r0, r5
	strh r0, [r1, #0x36]
	ldr r0, _080743B8  @ gEkrBgPalBackupMaybe
	ldr r4, _080743BC  @ gPaletteBuffer
	movs r2, #0x80
	lsls r2, r2, #1
	adds r1, r4, #0
	bl CpuFastSet
	adds r0, r4, #0
	movs r1, #2
	movs r2, #4
	adds r3, r6, #0
	bl EkrMaybePalFadeWithVal
	adds r0, r4, #0
	movs r1, #0x13
	movs r2, #0xc
	adds r3, r6, #0
	bl EkrMaybePalFadeWithVal
	bl EnablePaletteSync
	movs r0, #7
_08074384:
	subs r0, #1
	cmp r0, #0
	bge _08074384
	ldrh r0, [r7, #0x2c]
	adds r0, #1
	strh r0, [r7, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #8
	ble _080743A2
	movs r0, #0
	strh r0, [r7, #0x2c]
	adds r0, r7, #0
	bl Proc_Break
_080743A2:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080743AC: .4byte gEkrLvupScrollPos1
_080743B0: .4byte gEkrLvupScrollPos2
_080743B4: .4byte gFaces
_080743B8: .4byte gEkrBgPalBackupMaybe
_080743BC: .4byte gPaletteBuffer

	THUMB_FUNC_END EkrLvup_PutWindowOffScreen

	THUMB_FUNC_START EkrLvup_ResetScreen
EkrLvup_ResetScreen: @ 0x080743C0
	push {r4, r5, r6, lr}
	sub sp, #0x2c
	adds r5, r0, #0
	ldr r4, _080744DC  @ gUnknown_020200E0
	bl GetBattleAnimArenaFlag
	cmp r0, #0
	bne _080743DE
	bl GetBanimDragonStatusType
	cmp r0, #2
	beq _080743DE
	adds r0, r4, #0
	bl sub_805AE14
_080743DE:
	movs r1, #0xc0
	lsls r1, r1, #7
	movs r0, #0
	bl SetBackgroundMapDataOffset
	movs r1, #0xd0
	lsls r1, r1, #7
	movs r0, #1
	bl SetBackgroundMapDataOffset
	movs r1, #0xe0
	lsls r1, r1, #7
	movs r0, #2
	bl SetBackgroundMapDataOffset
	movs r0, #1
	movs r1, #0
	bl SetBackgroundScreenSize
	movs r0, #2
	movs r1, #0
	bl SetBackgroundScreenSize
	mov r4, sp
	ldr r2, _080744E0  @ gBanimTerrainIndexMaybe
	ldrh r0, [r2]
	movs r3, #0
	strh r0, [r4]
	movs r0, #4
	strh r0, [r4, #2]
	movs r1, #0xa0
	lsls r1, r1, #2
	strh r1, [r4, #4]
	ldrh r0, [r2, #2]
	strh r0, [r4, #6]
	movs r0, #5
	strh r0, [r4, #8]
	strh r1, [r4, #0xa]
	ldr r0, _080744E4  @ gEkrDistanceType
	ldrh r0, [r0]
	strh r0, [r4, #0xc]
	movs r0, #2
	strh r0, [r4, #0xe]
	str r3, [sp, #0x1c]
	ldr r0, _080744E8  @ gUnknown_020145C8
	str r0, [sp, #0x20]
	ldr r0, _080744EC  @ gEkrSnowWeather
	ldrh r0, [r0]
	strh r0, [r4, #0x10]
	bl GetBattleAnimArenaFlag
	cmp r0, #0
	bne _08074460
	bl GetBanimDragonStatusType
	cmp r0, #2
	beq _08074460
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	mov r0, sp
	bl sub_805AA68
_08074460:
	ldr r3, [r5, #0x5c]
	ldrh r2, [r3, #8]
	ldr r1, _080744F0  @ 0x0000F3FF
	adds r0, r1, #0
	ands r0, r2
	movs r4, #0
	strh r0, [r3, #8]
	ldr r3, [r5, #0x5c]
	ldrh r0, [r3, #8]
	movs r6, #0x80
	lsls r6, r6, #4
	adds r2, r6, #0
	orrs r0, r2
	strh r0, [r3, #8]
	ldr r3, [r5, #0x60]
	ldrh r0, [r3, #8]
	ands r1, r0
	strh r1, [r3, #8]
	ldr r1, [r5, #0x60]
	ldrh r0, [r1, #8]
	orrs r2, r0
	strh r2, [r1, #8]
	str r4, [sp, #0x28]
	add r0, sp, #0x28
	ldr r1, _080744F4  @ gBG1TilemapBuffer
	ldr r2, _080744F8  @ 0x01000200
	bl CpuFastSet
	movs r0, #2
	bl BG_EnableSyncByMask
	movs r0, #0
	bl EkrGauge_Setup44
	bl GetBanimDragonStatusType
	cmp r0, #1
	bne _08074500
	ldr r3, _080744FC  @ gLCDControlBuffer
	ldrb r2, [r3, #0xc]
	movs r1, #4
	negs r1, r1
	adds r0, r1, #0
	ands r0, r2
	strb r0, [r3, #0xc]
	ldrb r2, [r3, #0x10]
	adds r0, r1, #0
	ands r0, r2
	movs r2, #1
	orrs r0, r2
	strb r0, [r3, #0x10]
	ldrb r0, [r3, #0x18]
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	strb r1, [r3, #0x18]
	ldrb r0, [r3, #0x14]
	movs r1, #3
	orrs r0, r1
	strb r0, [r3, #0x14]
	b _0807452C
	.align 2, 0
_080744DC: .4byte gUnknown_020200E0
_080744E0: .4byte gBanimTerrainIndexMaybe
_080744E4: .4byte gEkrDistanceType
_080744E8: .4byte gUnknown_020145C8
_080744EC: .4byte gEkrSnowWeather
_080744F0: .4byte 0x0000F3FF
_080744F4: .4byte gBG1TilemapBuffer
_080744F8: .4byte 0x01000200
_080744FC: .4byte gLCDControlBuffer
_08074500:
	ldr r3, _08074540  @ gLCDControlBuffer
	ldrb r2, [r3, #0xc]
	movs r1, #4
	negs r1, r1
	adds r0, r1, #0
	ands r0, r2
	strb r0, [r3, #0xc]
	ldrb r2, [r3, #0x10]
	adds r0, r1, #0
	ands r0, r2
	movs r2, #1
	orrs r0, r2
	strb r0, [r3, #0x10]
	ldrb r0, [r3, #0x14]
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	strb r1, [r3, #0x14]
	ldrb r0, [r3, #0x18]
	movs r1, #3
	orrs r0, r1
	strb r0, [r3, #0x18]
_0807452C:
	movs r0, #0
	bl EndFaceById
	adds r0, r5, #0
	bl Proc_Break
	add sp, #0x2c
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08074540: .4byte gLCDControlBuffer

	THUMB_FUNC_END EkrLvup_ResetScreen

	THUMB_FUNC_START EkrLvup_OnEnd
EkrLvup_OnEnd: @ 0x08074544
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08074578  @ gpProcEfxPartsofScroll
	ldr r0, [r0]
	bl Proc_End
	ldr r0, _0807457C  @ gpProcEfxleveluphb
	ldr r0, [r0]
	bl Proc_End
	ldr r0, [r4, #0x5c]
	bl EnableEfxStatusUnits
	ldr r0, [r4, #0x60]
	bl EnableEfxStatusUnits
	bl EfxWeaponIconClear50
	bl EfxHPBarColorChangeClear29
	adds r4, #0x29
	movs r0, #1
	strb r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08074578: .4byte gpProcEfxPartsofScroll
_0807457C: .4byte gpProcEfxleveluphb

	THUMB_FUNC_END EkrLvup_OnEnd

.align 2, 0
