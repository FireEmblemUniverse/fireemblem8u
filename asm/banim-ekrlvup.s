	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	THUMB_FUNC_START EkrLvup_InitScreen
EkrLvup_InitScreen: @ 0x08073A4C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	mov r9, r0
	ldr r7, _08073AFC  @ gUnknown_020200E0
	movs r4, #0
	str r4, [sp]
	ldr r5, _08073B00  @ gBG1TilemapBuffer
	ldr r0, _08073B04  @ 0x01000200
	mov r8, r0
	mov r0, sp
	adds r1, r5, #0
	mov r2, r8
	bl CpuFastSet
	str r4, [sp, #4]
	add r0, sp, #4
	ldr r6, _08073B08  @ gBG2TilemapBuffer
	adds r1, r6, #0
	mov r2, r8
	bl CpuFastSet
	ldr r1, _08073B0C  @ 0x06006800
	movs r4, #0x80
	lsls r4, r4, #4
	adds r0, r5, #0
	adds r2, r4, #0
	bl RegisterTileGraphics
	ldr r1, _08073B10  @ 0x06007000
	adds r0, r5, #0
	adds r2, r4, #0
	bl RegisterTileGraphics
	ldr r1, _08073B14  @ 0x06005000
	adds r0, r6, #0
	adds r2, r4, #0
	bl RegisterTileGraphics
	ldr r1, _08073B18  @ 0x06005800
	adds r0, r6, #0
	adds r2, r4, #0
	bl RegisterTileGraphics
	ldr r1, _08073B1C  @ gBanimTerrainIndexMaybe
	ldrh r4, [r1]
	strh r4, [r7]
	movs r0, #3
	strh r0, [r7, #2]
	adds r0, #0xfd
	strh r0, [r7, #4]
	ldrh r3, [r1, #2]
	strh r3, [r7, #6]
	movs r0, #4
	strh r0, [r7, #8]
	movs r0, #0xa0
	lsls r0, r0, #1
	strh r0, [r7, #0xa]
	ldr r0, _08073B20  @ gEkrDistanceType
	ldrh r1, [r0]
	strh r1, [r7, #0xc]
	movs r0, #1
	negs r0, r0
	adds r2, r0, #0
	ldr r0, _08073B24  @ 0x0000FFFF
	strh r0, [r7, #0xe]
	ldr r0, _08073B28  @ 0x06010000
	str r0, [r7, #0x1c]
	ldr r0, _08073B2C  @ gUnknown_020145C8
	str r0, [r7, #0x20]
	ldr r0, _08073B30  @ gEkrSnowWeather
	ldrh r0, [r0]
	strh r0, [r7, #0x10]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	cmp r1, #2
	bne _08073B3E
	ldr r0, _08073B34  @ gEkrPos2Maybe
	ldr r0, [r0]
	cmp r0, #0
	bne _08073B38
	adds r0, r3, #0
	orrs r0, r2
	strh r0, [r7, #6]
	b _08073B3E
	.align 2, 0
_08073AFC: .4byte gUnknown_020200E0
_08073B00: .4byte gBG1TilemapBuffer
_08073B04: .4byte 0x01000200
_08073B08: .4byte gBG2TilemapBuffer
_08073B0C: .4byte 0x06006800
_08073B10: .4byte 0x06007000
_08073B14: .4byte 0x06005000
_08073B18: .4byte 0x06005800
_08073B1C: .4byte gBanimTerrainIndexMaybe
_08073B20: .4byte gEkrDistanceType
_08073B24: .4byte 0x0000FFFF
_08073B28: .4byte 0x06010000
_08073B2C: .4byte gUnknown_020145C8
_08073B30: .4byte gEkrSnowWeather
_08073B34: .4byte gEkrPos2Maybe
_08073B38:
	adds r0, r4, #0
	orrs r0, r2
	strh r0, [r7]
_08073B3E:
	bl GetBattleAnimArenaFlag
	cmp r0, #0
	bne _08073B6E
	bl GetBanimDragonStatusType
	cmp r0, #2
	beq _08073B6E
	adds r0, r7, #0
	bl sub_805AA68
	ldr r3, [r7, #0x14]
	ldr r0, [r3, #0x4c]
	ldr r2, _08073CD0  @ 0x0000F3FF
	ands r0, r2
	movs r1, #0xc0
	lsls r1, r1, #4
	orrs r0, r1
	str r0, [r3, #0x4c]
	ldr r3, [r7, #0x18]
	ldr r0, [r3, #0x4c]
	ands r0, r2
	orrs r0, r1
	str r0, [r3, #0x4c]
_08073B6E:
	mov r1, r9
	ldr r2, [r1, #0x5c]
	ldrh r1, [r2, #8]
	ldr r7, _08073CD0  @ 0x0000F3FF
	adds r0, r7, #0
	ands r0, r1
	strh r0, [r2, #8]
	mov r3, r9
	ldr r1, [r3, #0x5c]
	ldrh r0, [r1, #8]
	movs r3, #0xc0
	lsls r3, r3, #4
	adds r2, r3, #0
	orrs r0, r2
	strh r0, [r1, #8]
	mov r0, r9
	ldr r3, [r0, #0x60]
	ldrh r1, [r3, #8]
	adds r0, r7, #0
	ands r0, r1
	strh r0, [r3, #8]
	mov r3, r9
	ldr r1, [r3, #0x60]
	ldrh r0, [r1, #8]
	movs r3, #0
	mov sl, r3
	orrs r2, r0
	strh r2, [r1, #8]
	ldr r4, _08073CD4  @ gLCDControlBuffer
	ldrb r1, [r4, #0x14]
	movs r5, #4
	negs r5, r5
	adds r0, r5, #0
	ands r0, r1
	strb r0, [r4, #0x14]
	ldrb r1, [r4, #0x10]
	adds r0, r5, #0
	ands r0, r1
	movs r1, #1
	mov r8, r1
	mov r3, r8
	orrs r0, r3
	strb r0, [r4, #0x10]
	ldrb r1, [r4, #0xc]
	adds r0, r5, #0
	ands r0, r1
	movs r6, #2
	orrs r0, r6
	strb r0, [r4, #0xc]
	ldrb r0, [r4, #0x18]
	movs r1, #3
	orrs r0, r1
	strb r0, [r4, #0x18]
	bl GetBanimDragonStatusType
	cmp r0, #1
	bne _08073C24
	mov r0, r9
	ldr r2, [r0, #0x60]
	ldrh r1, [r2, #8]
	adds r0, r7, #0
	ands r0, r1
	strh r0, [r2, #8]
	mov r1, r9
	ldr r2, [r1, #0x60]
	ldrh r0, [r2, #8]
	movs r3, #0x80
	lsls r3, r3, #4
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2, #8]
	ldrb r1, [r4, #0xc]
	adds r0, r5, #0
	ands r0, r1
	orrs r0, r6
	strb r0, [r4, #0xc]
	ldrb r1, [r4, #0x10]
	adds r0, r5, #0
	ands r0, r1
	mov r1, r8
	orrs r0, r1
	strb r0, [r4, #0x10]
	ldrb r1, [r4, #0x14]
	adds r0, r5, #0
	ands r0, r1
	strb r0, [r4, #0x14]
	ldrb r1, [r4, #0x18]
	adds r0, r5, #0
	ands r0, r1
	orrs r0, r6
	strb r0, [r4, #0x18]
_08073C24:
	ldr r0, _08073CD8  @ gEkrLvupScrollPos1
	movs r1, #0x90
	strh r1, [r0]
	ldr r0, _08073CDC  @ gEkrLvupScrollPos2
	strh r1, [r0]
	movs r0, #2
	movs r1, #0
	movs r2, #8
	bl BG_SetPosition
	movs r0, #1
	movs r1, #0
	movs r2, #8
	bl BG_SetPosition
	movs r1, #0xc0
	lsls r1, r1, #7
	movs r0, #0
	bl SetBackgroundMapDataOffset
	movs r1, #0xd0
	lsls r1, r1, #7
	movs r0, #1
	bl SetBackgroundMapDataOffset
	movs r1, #0xa0
	lsls r1, r1, #7
	movs r0, #2
	bl SetBackgroundMapDataOffset
	movs r0, #1
	movs r1, #1
	bl SetBackgroundScreenSize
	movs r0, #2
	movs r1, #1
	bl SetBackgroundScreenSize
	bl NewEfxPartsofScroll
	ldr r1, _08073CE0  @ gUnknown_020200D8
	str r0, [r1]
	bl NewEfxleveluphb
	ldr r1, _08073CE4  @ gUnknown_020200DC
	str r0, [r1]
	bl sub_8074598
	movs r0, #2
	bl EkrGauge_Setup44
	mov r3, r9
	ldr r0, [r3, #0x5c]
	bl DisableEfxStatusUnits
	mov r1, r9
	ldr r0, [r1, #0x60]
	bl DisableEfxStatusUnits
	bl sub_8054EF0
	bl sub_80546C4
	ldrb r1, [r4, #1]
	movs r0, #0x21
	negs r0, r0
	ands r0, r1
	movs r1, #0x41
	negs r1, r1
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r4, #1]
	bl SetDefaultColorEffects
	mov r0, r9
	bl Proc_Break
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08073CD0: .4byte 0x0000F3FF
_08073CD4: .4byte gLCDControlBuffer
_08073CD8: .4byte gEkrLvupScrollPos1
_08073CDC: .4byte gEkrLvupScrollPos2
_08073CE0: .4byte gUnknown_020200D8
_08073CE4: .4byte gUnknown_020200DC

	THUMB_FUNC_END EkrLvup_InitScreen

	THUMB_FUNC_START EkrLvup_InitLevelUpBox
EkrLvup_InitLevelUpBox: @ 0x08073CE8
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	sub sp, #0xc
	adds r7, r0, #0
	ldr r0, _08073D80  @ gpEkrBattleUnitLeft
	ldr r0, [r0]
	mov r9, r0
	ldr r0, _08073D84  @ gpEkrBattleUnitRight
	ldr r0, [r0]
	mov r8, r0
	ldr r6, [r7, #0x5c]
	ldr r0, _08073D88  @ Img_LevelUpBoxFrame
	ldr r5, _08073D8C  @ gUnknown_02017790
	adds r1, r5, #0
	bl LZ77UnCompWram
	ldr r0, _08073D90  @ Tsa_LevelUpBoxFrame
	ldr r4, _08073D94  @ gEkrTsaBuffer
	adds r1, r4, #0
	bl LZ77UnCompWram
	ldr r1, _08073D98  @ gUnknown_02023628
	movs r0, #1
	str r0, [sp]
	adds r0, #0xff
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r2, #0x20
	movs r3, #0x14
	bl sub_8070E94
	ldr r1, _08073D9C  @ 0x06002000
	movs r2, #0x8c
	lsls r2, r2, #4
	adds r0, r5, #0
	bl RegisterTileGraphics
	ldr r0, _08073DA0  @ gUnknown_08803B10
	ldr r4, _08073DA4  @ pPalette1Buffer
	adds r1, r4, #0
	movs r2, #8
	bl CpuFastSet
	ldr r0, _08073DA8  @ gUnknown_085BB0C8
	ldr r5, _08073DAC  @ gUnknown_0201A790
	adds r1, r5, #0
	bl LZ77UnCompWram
	ldr r1, _08073DB0  @ 0x06011400
	movs r2, #0xc0
	lsls r2, r2, #4
	adds r0, r5, #0
	bl RegisterTileGraphics
	ldr r0, _08073DB4  @ gUnknown_085BB2DC
	movs r1, #0x80
	lsls r1, r1, #2
	adds r4, r4, r1
	adds r1, r4, #0
	movs r2, #8
	bl CpuFastSet
	bl EnablePaletteSync
	movs r0, #0x50
	strh r0, [r7, #0x2c]
	adds r0, r6, #0
	bl GetAISSubjectId
	cmp r0, #0
	bne _08073DB8
	mov r1, r9
	b _08073DBA
	.align 2, 0
_08073D80: .4byte gpEkrBattleUnitLeft
_08073D84: .4byte gpEkrBattleUnitRight
_08073D88: .4byte Img_LevelUpBoxFrame
_08073D8C: .4byte gUnknown_02017790
_08073D90: .4byte Tsa_LevelUpBoxFrame
_08073D94: .4byte gEkrTsaBuffer
_08073D98: .4byte gUnknown_02023628
_08073D9C: .4byte 0x06002000
_08073DA0: .4byte gUnknown_08803B10
_08073DA4: .4byte pPalette1Buffer
_08073DA8: .4byte gUnknown_085BB0C8
_08073DAC: .4byte gUnknown_0201A790
_08073DB0: .4byte 0x06011400
_08073DB4: .4byte gUnknown_085BB2DC
_08073DB8:
	mov r1, r8
_08073DBA:
	ldr r0, [r1]
	ldrh r4, [r0, #6]
	ldr r0, _08073E04  @ gUnknown_087592CC
	bl SetupFaceGfxData
	ldr r0, _08073E08  @ 0x00001042
	str r0, [sp]
	movs r0, #0
	adds r1, r4, #0
	movs r2, #0xbc
	movs r3, #0x50
	bl StartFace
	ldr r0, _08073E0C  @ gFaces
	ldr r1, [r0]
	movs r2, #0
	movs r0, #0xa0
	strh r0, [r1, #0x36]
	str r2, [sp, #8]
	ldr r1, _08073E10  @ gBG2TilemapBuffer
	ldr r2, _08073E14  @ 0x01000200
	add r0, sp, #8
	bl CpuFastSet
	adds r0, r7, #0
	bl EkrLvup_InitStatusText
	adds r0, r7, #0
	bl Proc_Break
	add sp, #0xc
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08073E04: .4byte gUnknown_087592CC
_08073E08: .4byte 0x00001042
_08073E0C: .4byte gFaces
_08073E10: .4byte gBG2TilemapBuffer
_08073E14: .4byte 0x01000200

	THUMB_FUNC_END EkrLvup_InitLevelUpBox

	THUMB_FUNC_START EkrLvup_SetBgs
EkrLvup_SetBgs: @ 0x08073E18
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08073E44  @ sub_8074834
	bl SetPrimaryHBlankHandler
	movs r0, #1
	bl BG_EnableSyncByMask
	movs r0, #4
	bl BG_EnableSyncByMask
	movs r0, #2
	bl BG_EnableSyncByMask
	bl EnablePaletteSync
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08073E44: .4byte sub_8074834

	THUMB_FUNC_END EkrLvup_SetBgs

	THUMB_FUNC_START EkrLvup_InitPalette
EkrLvup_InitPalette: @ 0x08073E48
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	movs r1, #0
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x50
	ble _08073E7E
	strh r1, [r4, #0x2c]
	str r1, [r4, #0x44]
	str r1, [r4, #0x48]
	movs r0, #2
	negs r0, r0
	str r0, [r4, #0x4c]
	subs r0, #2
	str r0, [r4, #0x50]
	ldr r0, _08073E84  @ gPaletteBuffer
	ldr r1, _08073E88  @ gUnknown_020165C8
	movs r2, #0x80
	lsls r2, r2, #1
	bl CpuFastSet
	adds r0, r4, #0
	bl Proc_Break
_08073E7E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08073E84: .4byte gPaletteBuffer
_08073E88: .4byte gUnknown_020165C8

	THUMB_FUNC_END EkrLvup_InitPalette

	THUMB_FUNC_START EkrLvup_PutWindowOnScreen
EkrLvup_PutWindowOnScreen: @ 0x08073E8C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r7, r0, #0
	ldr r3, [r7, #0x44]
	ldr r5, [r7, #0x48]
	ldr r6, [r7, #0x4c]
	ldr r0, [r7, #0x50]
	mov r9, r0
	cmp r3, #0
	bge _08073EAC
	movs r3, #0
	b _08073EB2
_08073EAC:
	cmp r3, #8
	ble _08073EB2
	movs r3, #8
_08073EB2:
	cmp r5, #0
	bge _08073EBA
	movs r5, #0
	b _08073EC0
_08073EBA:
	cmp r5, #8
	ble _08073EC0
	movs r5, #8
_08073EC0:
	cmp r6, #0
	bge _08073EC8
	movs r6, #0
	b _08073ECE
_08073EC8:
	cmp r6, #8
	ble _08073ECE
	movs r6, #8
_08073ECE:
	mov r2, r9
	cmp r2, #0
	bge _08073ED8
	movs r0, #0
	b _08073EE0
_08073ED8:
	mov r2, r9
	cmp r2, #8
	ble _08073EE2
	movs r0, #8
_08073EE0:
	mov r9, r0
_08073EE2:
	ldr r0, [r7, #0x44]
	adds r0, #1
	str r0, [r7, #0x44]
	ldr r0, [r7, #0x48]
	adds r0, #1
	str r0, [r7, #0x48]
	ldr r0, [r7, #0x4c]
	adds r0, #1
	str r0, [r7, #0x4c]
	ldr r0, [r7, #0x50]
	adds r0, #1
	str r0, [r7, #0x50]
	movs r1, #0x50
	negs r1, r1
	movs r4, #8
	str r4, [sp]
	movs r0, #0
	movs r2, #0
	bl Interpolate
	mov r8, r0
	str r4, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #8
	adds r3, r5, #0
	bl Interpolate
	mov sl, r0
	ldr r5, _08073FA0  @ gEkrLvupScrollPos1
	str r4, [sp]
	movs r0, #0
	movs r1, #0x90
	movs r2, #0
	adds r3, r6, #0
	bl Interpolate
	strh r0, [r5]
	ldr r5, _08073FA4  @ gEkrLvupScrollPos2
	str r4, [sp]
	movs r0, #0
	movs r1, #0x90
	movs r2, #0
	mov r3, r9
	bl Interpolate
	strh r0, [r5]
	ldr r0, _08073FA8  @ gFaces
	ldr r1, [r0]
	movs r0, #0x50
	mov r2, r8
	subs r0, r0, r2
	strh r0, [r1, #0x36]
	ldr r0, _08073FAC  @ gUnknown_020165C8
	ldr r4, _08073FB0  @ gPaletteBuffer
	movs r2, #0x80
	lsls r2, r2, #1
	adds r1, r4, #0
	bl CpuFastSet
	adds r0, r4, #0
	movs r1, #2
	movs r2, #4
	mov r3, sl
	bl EkrMaybePalFadeWithVal
	adds r0, r4, #0
	movs r1, #0x13
	movs r2, #0xc
	mov r3, sl
	bl EkrMaybePalFadeWithVal
	bl EnablePaletteSync
	ldrh r0, [r7, #0x2c]
	adds r0, #1
	strh r0, [r7, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x14
	ble _08073F8E
	movs r0, #0
	strh r0, [r7, #0x2c]
	adds r0, r7, #0
	bl Proc_Break
_08073F8E:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08073FA0: .4byte gEkrLvupScrollPos1
_08073FA4: .4byte gEkrLvupScrollPos2
_08073FA8: .4byte gFaces
_08073FAC: .4byte gUnknown_020165C8
_08073FB0: .4byte gPaletteBuffer

	THUMB_FUNC_END EkrLvup_PutWindowOnScreen

	THUMB_FUNC_START EkrLvup_PrepareApGfx
EkrLvup_PrepareApGfx: @ 0x08073FB4
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0xa0
	movs r1, #1
	bl NewEkrLvupApfx
	ldr r1, _08073FDC  @ gUnknown_020200B8
	movs r2, #0
	adds r0, r1, #0
	adds r0, #0x1c
_08073FC8:
	str r2, [r0]
	subs r0, #4
	cmp r0, r1
	bge _08073FC8
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08073FDC: .4byte gUnknown_020200B8

	THUMB_FUNC_END EkrLvup_PrepareApGfx

	THUMB_FUNC_START EkrLvup_Promo_WindowScroll0
EkrLvup_Promo_WindowScroll0: @ 0x08073FE0
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	cmp r0, #0
	bne _08073FF4
	adds r0, r5, #0
	bl Proc_Break
	b _0807402C
_08073FF4:
	ldr r0, _08074034  @ sub_8074874
	bl SetPrimaryHBlankHandler
	ldr r4, _08074038  @ gUnknown_020200D8
	ldr r0, [r4]
	bl Proc_End
	bl NewEfxPartsofScroll2
	str r0, [r4]
	ldr r4, _0807403C  @ 0x000002CD
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r4, #0
	bl SomePlaySound_8071990
	adds r0, r4, #0
	movs r1, #0x38
	movs r2, #0
	bl M4aPlayWithPostionCtrl
	movs r0, #0
	strh r0, [r5, #0x2c]
	movs r0, #8
	strh r0, [r5, #0x2e]
	adds r0, r5, #0
	bl Proc_Break
_0807402C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08074034: .4byte sub_8074874
_08074038: .4byte gUnknown_020200D8
_0807403C: .4byte 0x000002CD

	THUMB_FUNC_END EkrLvup_Promo_WindowScroll0

	THUMB_FUNC_START EkrLvup_Promo_DrawPromoNewClassName
EkrLvup_Promo_DrawPromoNewClassName: @ 0x08074040
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	cmp r0, #0
	bne _08074056
	adds r0, r5, #0
	bl Proc_Break
	b _080740AC
_08074056:
	ldr r4, _080740B4  @ gEkrLvupScrollPos1
	movs r2, #0x80
	lsls r2, r2, #5
	movs r0, #0x2c
	ldrsh r3, [r5, r0]
	movs r1, #0x2e
	ldrsh r0, [r5, r1]
	str r0, [sp]
	movs r0, #1
	movs r1, #0
	bl Interpolate
	strh r0, [r4]
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x2e
	ldrsh r1, [r5, r2]
	cmp r0, r1
	ble _080740AC
	ldr r1, _080740B8  @ gpEkrLvupUnit
	ldr r0, _080740BC  @ gpEkrLvupBattleUnit
	ldr r0, [r0]
	str r0, [r1]
	adds r0, r5, #0
	bl EkrLvup_DrawUnitName
	ldr r1, _080740C0  @ gEkrLvupPreLevel
	ldr r0, _080740C4  @ gEkrLvupPostLevel
	ldrh r0, [r0]
	strh r0, [r1]
	adds r0, r5, #0
	bl EkrLvup_DrawPreLevelValue
	movs r0, #0
	strh r0, [r5, #0x2c]
	movs r0, #8
	strh r0, [r5, #0x2e]
	adds r0, r5, #0
	bl Proc_Break
_080740AC:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080740B4: .4byte gEkrLvupScrollPos1
_080740B8: .4byte gpEkrLvupUnit
_080740BC: .4byte gpEkrLvupBattleUnit
_080740C0: .4byte gEkrLvupPreLevel
_080740C4: .4byte gEkrLvupPostLevel

	THUMB_FUNC_END EkrLvup_Promo_DrawPromoNewClassName

	THUMB_FUNC_START EkrLvup_Promo_WindowScroll1
EkrLvup_Promo_WindowScroll1: @ 0x080740C8
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	cmp r0, #0
	bne _080740DE
	adds r0, r5, #0
	bl Proc_Break
	b _08074110
_080740DE:
	ldr r4, _08074118  @ gEkrLvupScrollPos1
	movs r1, #0x80
	lsls r1, r1, #5
	movs r0, #0x2c
	ldrsh r3, [r5, r0]
	movs r2, #0x2e
	ldrsh r0, [r5, r2]
	str r0, [sp]
	movs r0, #4
	movs r2, #0
	bl Interpolate
	strh r0, [r4]
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x2e
	ldrsh r1, [r5, r2]
	cmp r0, r1
	ble _08074110
	adds r0, r5, #0
	bl Proc_Break
_08074110:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08074118: .4byte gEkrLvupScrollPos1

	THUMB_FUNC_END EkrLvup_Promo_WindowScroll1

	THUMB_FUNC_START EkrLvup_DrawNewLevel
EkrLvup_DrawNewLevel: @ 0x0807411C
	push {r4, r5, lr}
	sub sp, #8
	adds r5, r0, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	cmp r0, #0
	bne _08074174
	strh r0, [r5, #0x2c]
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #0xa0
	movs r1, #1
	movs r2, #0x84
	movs r3, #0x3c
	bl sub_8074D58
	ldr r1, _08074168  @ gEkrLvupPreLevel
	ldr r0, _0807416C  @ gEkrLvupPostLevel
	ldrh r0, [r0]
	strh r0, [r1]
	adds r0, r5, #0
	bl EkrLvup_DrawPreLevelValue
	ldr r4, _08074170  @ 0x000002CD
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r4, #0
	bl SomePlaySound_8071990
	adds r0, r4, #0
	movs r1, #0x38
	movs r2, #0
	bl M4aPlayWithPostionCtrl
	adds r0, r5, #0
	bl Proc_Break
	b _0807418E
	.align 2, 0
_08074168: .4byte gEkrLvupPreLevel
_0807416C: .4byte gEkrLvupPostLevel
_08074170: .4byte 0x000002CD
_08074174:
	ldr r4, _08074198  @ gUnknown_020200D8
	ldr r0, [r4]
	bl Proc_End
	bl NewEfxPartsofScroll
	str r0, [r4]
	movs r0, #0
	strh r0, [r5, #0x2c]
	strh r0, [r5, #0x2e]
	adds r0, r5, #0
	bl Proc_Break
_0807418E:
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08074198: .4byte gUnknown_020200D8

	THUMB_FUNC_END EkrLvup_DrawNewLevel

	THUMB_FUNC_START EkrLvup_InitCounterForMainAnim
EkrLvup_InitCounterForMainAnim: @ 0x0807419C
	push {lr}
	adds r1, r0, #0
	adds r0, #0x2a
	ldrb r2, [r0]
	cmp r2, #0
	beq _080741B0
	adds r0, r1, #0
	bl Proc_Break
	b _080741C8
_080741B0:
	ldrh r0, [r1, #0x2c]
	adds r0, #1
	strh r0, [r1, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x1d
	bgt _080741C8
	strh r2, [r1, #0x2c]
	strh r2, [r1, #0x2e]
	adds r0, r1, #0
	bl Proc_Break
_080741C8:
	pop {r0}
	bx r0

	THUMB_FUNC_END EkrLvup_InitCounterForMainAnim

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
	ldr r0, _080742E8  @ sub_8074834
	bl SetPrimaryHBlankHandler
	adds r0, r4, #0
	bl Proc_Break
_080742E2:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080742E8: .4byte sub_8074834

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
	ldr r0, _080743B8  @ gUnknown_020165C8
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
_080743B8: .4byte gUnknown_020165C8
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
	ldr r0, _08074578  @ gUnknown_020200D8
	ldr r0, [r0]
	bl Proc_End
	ldr r0, _0807457C  @ gUnknown_020200DC
	ldr r0, [r0]
	bl Proc_End
	ldr r0, [r4, #0x5c]
	bl EnableEfxStatusUnits
	ldr r0, [r4, #0x60]
	bl EnableEfxStatusUnits
	bl sub_8054F00
	bl sub_80546D4
	adds r4, #0x29
	movs r0, #1
	strb r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08074578: .4byte gUnknown_020200D8
_0807457C: .4byte gUnknown_020200DC

	THUMB_FUNC_END EkrLvup_OnEnd

.align 2, 0
