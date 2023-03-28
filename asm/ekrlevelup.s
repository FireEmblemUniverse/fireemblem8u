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
	ldr r1, _08073B1C  @ gUnknown_0203E11C
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
	ldr r0, _08073B20  @ gUnknown_0203E120
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
	ldr r0, _08073B30  @ gUnknown_0203E102
	ldrh r0, [r0]
	strh r0, [r7, #0x10]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	cmp r1, #2
	bne _08073B3E
	ldr r0, _08073B34  @ gUnknown_02017744
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
_08073B1C: .4byte gUnknown_0203E11C
_08073B20: .4byte gUnknown_0203E120
_08073B24: .4byte 0x0000FFFF
_08073B28: .4byte 0x06010000
_08073B2C: .4byte gUnknown_020145C8
_08073B30: .4byte gUnknown_0203E102
_08073B34: .4byte gUnknown_02017744
_08073B38:
	adds r0, r4, #0
	orrs r0, r2
	strh r0, [r7]
_08073B3E:
	bl sub_805B028
	cmp r0, #0
	bne _08073B6E
	bl sub_806FAB0
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
	bl sub_806FAB0
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
	bl sub_8074580
	ldr r1, _08073CE0  @ gUnknown_020200D8
	str r0, [r1]
	bl sub_80746C0
	ldr r1, _08073CE4  @ gUnknown_020200DC
	str r0, [r1]
	bl sub_8074598
	movs r0, #2
	bl EkrGauge_80511C0
	mov r3, r9
	ldr r0, [r3, #0x5c]
	bl sub_8054B64
	mov r1, r9
	ldr r0, [r1, #0x60]
	bl sub_8054B64
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
	ldr r4, _08073D94  @ gUnknown_02019790
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
_08073D94: .4byte gUnknown_02019790
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
	bl sub_80712B0
	adds r0, r4, #0
	movs r1, #0x13
	movs r2, #0xc
	mov r3, sl
	bl sub_80712B0
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
	bl sub_8074B90
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
	bl sub_807461C
	str r0, [r4]
	ldr r4, _0807403C  @ 0x000002CD
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r4, #0
	bl SomePlaySound_8071990
	adds r0, r4, #0
	movs r1, #0x38
	movs r2, #0
	bl sub_8071AB0
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
	bl sub_8071AB0
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
	bl sub_8074580
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
	bl sub_8071AB0
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
	ldr r1, _08074284  @ gUnknown_0203E1B0
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
_08074284: .4byte gUnknown_0203E1B0
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
	bl sub_8074BF4
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
	bl sub_80712B0
	adds r0, r4, #0
	movs r1, #0x13
	movs r2, #0xc
	adds r3, r6, #0
	bl sub_80712B0
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
	bl sub_805B028
	cmp r0, #0
	bne _080743DE
	bl sub_806FAB0
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
	ldr r2, _080744E0  @ gUnknown_0203E11C
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
	ldr r0, _080744E4  @ gUnknown_0203E120
	ldrh r0, [r0]
	strh r0, [r4, #0xc]
	movs r0, #2
	strh r0, [r4, #0xe]
	str r3, [sp, #0x1c]
	ldr r0, _080744E8  @ gUnknown_020145C8
	str r0, [sp, #0x20]
	ldr r0, _080744EC  @ gUnknown_0203E102
	ldrh r0, [r0]
	strh r0, [r4, #0x10]
	bl sub_805B028
	cmp r0, #0
	bne _08074460
	bl sub_806FAB0
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
	bl EkrGauge_80511C0
	bl sub_806FAB0
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
_080744E0: .4byte gUnknown_0203E11C
_080744E4: .4byte gUnknown_0203E120
_080744E8: .4byte gUnknown_020145C8
_080744EC: .4byte gUnknown_0203E102
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
	bl sub_8054B84
	ldr r0, [r4, #0x60]
	bl sub_8054B84
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

	THUMB_FUNC_START sub_8074580
sub_8074580: @ 0x08074580
	push {lr}
	ldr r0, _08074594  @ gUnknown_087593DC
	movs r1, #3
	bl Proc_Start
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r1, [r0, #0x2e]
	pop {r1}
	bx r1
	.align 2, 0
_08074594: .4byte gUnknown_087593DC

	THUMB_FUNC_END sub_8074580

	THUMB_FUNC_START sub_8074598
sub_8074598: @ 0x08074598
	push {r4, r5, r6, lr}
	ldr r0, _080745C4  @ gUnknown_0201FDB8
	ldr r0, [r0]
	ldr r2, _080745C8  @ gUnknown_0201FB38
	cmp r0, #0
	bne _080745A6
	ldr r2, _080745CC  @ gUnknown_0201FC78
_080745A6:
	ldr r1, _080745D0  @ gUnknown_0201FDC4
	cmp r0, #0
	bne _080745AE
	ldr r1, _080745D4  @ gUnknown_0201FF04
_080745AE:
	movs r3, #0
	movs r6, #0
	ldr r5, _080745D8  @ gEkrLvupScrollPos1
	ldr r4, _080745DC  @ gEkrLvupScrollPos2
_080745B6:
	cmp r3, #0x27
	bhi _080745E0
	strh r6, [r2]
	adds r2, #2
	strh r6, [r1]
	b _080745FC
	.align 2, 0
_080745C4: .4byte gUnknown_0201FDB8
_080745C8: .4byte gUnknown_0201FB38
_080745CC: .4byte gUnknown_0201FC78
_080745D0: .4byte gUnknown_0201FDC4
_080745D4: .4byte gUnknown_0201FF04
_080745D8: .4byte gEkrLvupScrollPos1
_080745DC: .4byte gEkrLvupScrollPos2
_080745E0:
	cmp r3, #0x47
	bhi _080745EE
	ldrh r0, [r5]
	strh r0, [r2]
	adds r2, #2
	ldrh r0, [r5]
	b _080745FA
_080745EE:
	cmp r3, #0x9f
	bhi _080745FE
	ldrh r0, [r4]
	strh r0, [r2]
	adds r2, #2
	ldrh r0, [r4]
_080745FA:
	strh r0, [r1]
_080745FC:
	adds r1, #2
_080745FE:
	adds r3, #1
	cmp r3, #0x9f
	bls _080745B6
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8074598

	THUMB_FUNC_START nullsub_62
nullsub_62: @ 0x0807460C
	bx lr

	THUMB_FUNC_END nullsub_62

	THUMB_FUNC_START sub_8074610
sub_8074610: @ 0x08074610
	push {lr}
	bl sub_8074598
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8074610

	THUMB_FUNC_START sub_807461C
sub_807461C: @ 0x0807461C
	push {lr}
	ldr r0, _08074630  @ gUnknown_087593FC
	movs r1, #3
	bl Proc_Start
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r1, [r0, #0x2e]
	pop {r1}
	bx r1
	.align 2, 0
_08074630: .4byte gUnknown_087593FC

	THUMB_FUNC_END sub_807461C

	THUMB_FUNC_START sub_8074634
sub_8074634: @ 0x08074634
	bx lr

	THUMB_FUNC_END sub_8074634

	THUMB_FUNC_START sub_8074638
sub_8074638: @ 0x08074638
	push {r4, r5, r6, lr}
	ldr r0, _08074684  @ gUnknown_0201FDB8
	ldr r0, [r0]
	ldr r3, _08074688  @ gUnknown_0201FB38
	cmp r0, #0
	bne _08074646
	ldr r3, _0807468C  @ gUnknown_0201FC78
_08074646:
	ldr r2, _08074690  @ gUnknown_0201FDC4
	cmp r0, #0
	bne _0807464E
	ldr r2, _08074694  @ gUnknown_0201FF04
_0807464E:
	movs r4, #0
	movs r5, #0
	ldr r0, _08074698  @ gUnknown_0875941C
	adds r6, r0, #0
	subs r6, #0x50
_08074658:
	cmp r4, #0x27
	bls _080746A8
	cmp r4, #0x47
	bhi _080746A4
	movs r0, #0
	ldrsh r1, [r6, r0]
	ldr r0, _0807469C  @ gEkrLvupScrollPos1
	ldrh r0, [r0]
	muls r0, r1, r0
	lsls r0, r0, #4
	lsrs r1, r0, #0x10
	asrs r0, r0, #0x10
	adds r0, r4, r0
	cmp r0, #0x2e
	bls _0807467A
	cmp r0, #0x51
	bls _0807467C
_0807467A:
	ldr r1, _080746A0  @ 0x0000FFE0
_0807467C:
	strh r1, [r3]
	adds r3, #2
	strh r1, [r2]
	b _080746AE
	.align 2, 0
_08074684: .4byte gUnknown_0201FDB8
_08074688: .4byte gUnknown_0201FB38
_0807468C: .4byte gUnknown_0201FC78
_08074690: .4byte gUnknown_0201FDC4
_08074694: .4byte gUnknown_0201FF04
_08074698: .4byte gUnknown_0875941C
_0807469C: .4byte gEkrLvupScrollPos1
_080746A0: .4byte 0x0000FFE0
_080746A4:
	cmp r4, #0x9f
	bhi _080746B0
_080746A8:
	strh r5, [r3]
	adds r3, #2
	strh r5, [r2]
_080746AE:
	adds r2, #2
_080746B0:
	adds r6, #2
	adds r4, #1
	cmp r4, #0x9f
	bls _08074658
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8074638

	THUMB_FUNC_START sub_80746C0
sub_80746C0: @ 0x080746C0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	ldr r1, _0807475C  @ gUnknown_0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r2, _08074760  @ gUnknown_0201FB38
	movs r1, #0
	adds r6, r2, #0
	ldr r4, _08074764  @ gUnknown_0201FC78
	ldr r0, _08074768  @ gUnknown_0201FDC4
	ldr r5, _0807476C  @ gUnknown_0201FF04
	ldr r3, _08074770  @ gUnknown_0201FB2C
	mov sl, r3
	ldr r7, _08074774  @ gUnknown_0201FDB8
	ldr r3, _08074778  @ gUnknown_0201FB30
	mov ip, r3
	ldr r3, _0807477C  @ gUnknown_0201FDBC
	mov r8, r3
	ldr r3, _08074780  @ gUnknown_0201FB34
	mov r9, r3
	movs r3, #0
_080746F2:
	strh r3, [r2]
	adds r2, #2
	adds r1, #1
	cmp r1, #0x9f
	bls _080746F2
	adds r2, r4, #0
	movs r1, #0
	movs r3, #0
_08074702:
	strh r3, [r2]
	adds r2, #2
	adds r1, #1
	cmp r1, #0x9f
	bls _08074702
	adds r2, r0, #0
	movs r1, #0
	movs r3, #0
_08074712:
	strh r3, [r2]
	adds r2, #2
	adds r1, #1
	cmp r1, #0x9f
	bls _08074712
	adds r2, r5, #0
	movs r1, #0
	movs r3, #0
_08074722:
	strh r3, [r2]
	adds r2, #2
	adds r1, #1
	cmp r1, #0x9f
	bls _08074722
	movs r4, #0
	mov r1, sl
	str r4, [r1]
	str r4, [r7]
	mov r3, ip
	str r6, [r3]
	mov r1, r8
	str r0, [r1]
	mov r3, r9
	str r6, [r3]
	ldr r1, _08074784  @ gUnknown_0201FDC0
	str r0, [r1]
	ldr r0, _08074788  @ gUnknown_0875945C
	movs r1, #0
	bl Proc_Start
	strh r4, [r0, #0x2c]
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0807475C: .4byte gUnknown_0201774C
_08074760: .4byte gUnknown_0201FB38
_08074764: .4byte gUnknown_0201FC78
_08074768: .4byte gUnknown_0201FDC4
_0807476C: .4byte gUnknown_0201FF04
_08074770: .4byte gUnknown_0201FB2C
_08074774: .4byte gUnknown_0201FDB8
_08074778: .4byte gUnknown_0201FB30
_0807477C: .4byte gUnknown_0201FDBC
_08074780: .4byte gUnknown_0201FB34
_08074784: .4byte gUnknown_0201FDC0
_08074788: .4byte gUnknown_0875945C

	THUMB_FUNC_END sub_80746C0

	THUMB_FUNC_START sub_807478C
sub_807478C: @ 0x0807478C
	push {lr}
	movs r0, #0
	bl SetPrimaryHBlankHandler
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_807478C

	THUMB_FUNC_START sub_8074798
sub_8074798: @ 0x08074798
	push {lr}
	bl Proc_Break
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8074798

	THUMB_FUNC_START sub_80747A4
sub_80747A4: @ 0x080747A4
	push {lr}
	ldr r0, _080747C8  @ gBmSt
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldr r3, _080747CC  @ gUnknown_0201FB30
	ldr r2, _080747D0  @ gUnknown_0201FDBC
	cmp r0, #0
	beq _08074814
	ldr r1, _080747D4  @ gUnknown_0201FB2C
	ldr r0, [r1]
	cmp r0, #1
	bne _080747DC
	movs r0, #0
	str r0, [r1]
	ldr r0, _080747D8  @ gUnknown_0201FB38
	b _080747E2
	.align 2, 0
_080747C8: .4byte gBmSt
_080747CC: .4byte gUnknown_0201FB30
_080747D0: .4byte gUnknown_0201FDBC
_080747D4: .4byte gUnknown_0201FB2C
_080747D8: .4byte gUnknown_0201FB38
_080747DC:
	movs r0, #1
	str r0, [r1]
	ldr r0, _080747F8  @ gUnknown_0201FC78
_080747E2:
	str r0, [r3]
	ldr r1, _080747FC  @ gUnknown_0201FDB8
	ldr r0, [r1]
	cmp r0, #1
	bne _08074808
	movs r0, #0
	str r0, [r1]
	ldr r1, _08074800  @ gUnknown_0201FDBC
	ldr r0, _08074804  @ gUnknown_0201FDC4
	b _08074810
	.align 2, 0
_080747F8: .4byte gUnknown_0201FC78
_080747FC: .4byte gUnknown_0201FDB8
_08074800: .4byte gUnknown_0201FDBC
_08074804: .4byte gUnknown_0201FDC4
_08074808:
	movs r0, #1
	str r0, [r1]
	ldr r1, _08074824  @ gUnknown_0201FDBC
	ldr r0, _08074828  @ gUnknown_0201FF04
_08074810:
	str r0, [r1]
	adds r2, r1, #0
_08074814:
	ldr r1, _0807482C  @ gUnknown_0201FB34
	ldr r0, [r3]
	str r0, [r1]
	ldr r1, _08074830  @ gUnknown_0201FDC0
	ldr r0, [r2]
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_08074824: .4byte gUnknown_0201FDBC
_08074828: .4byte gUnknown_0201FF04
_0807482C: .4byte gUnknown_0201FB34
_08074830: .4byte gUnknown_0201FDC0

	THUMB_FUNC_END sub_80747A4

	THUMB_FUNC_START sub_8074834
sub_8074834: @ 0x08074834
	push {lr}
	ldr r0, _08074864  @ 0x04000004
	ldrh r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _0807485E
	ldr r3, _08074868  @ 0x04000018
	ldr r2, _0807486C  @ gUnknown_0201FB34
	ldr r0, [r2]
	ldrh r1, [r0]
	strh r1, [r3]
	adds r0, #2
	str r0, [r2]
	subs r3, #4
	ldr r2, _08074870  @ gUnknown_0201FDC0
	ldr r0, [r2]
	ldrh r1, [r0]
	strh r1, [r3]
	adds r0, #2
	str r0, [r2]
_0807485E:
	pop {r0}
	bx r0
	.align 2, 0
_08074864: .4byte 0x04000004
_08074868: .4byte 0x04000018
_0807486C: .4byte gUnknown_0201FB34
_08074870: .4byte gUnknown_0201FDC0

	THUMB_FUNC_END sub_8074834

	THUMB_FUNC_START sub_8074874
sub_8074874: @ 0x08074874
	push {r4, r5, lr}
	ldr r0, _080748B0  @ 0x04000004
	ldrh r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _080748A8
	ldr r3, _080748B4  @ 0x0400001A
	ldr r4, _080748B8  @ gLCDControlBuffer
	ldr r2, _080748BC  @ gUnknown_0201FB34
	ldr r1, [r2]
	ldrh r0, [r1]
	ldrh r5, [r4, #0x26]
	adds r0, r0, r5
	strh r0, [r3]
	adds r1, #2
	str r1, [r2]
	subs r3, #4
	ldr r2, _080748C0  @ gUnknown_0201FDC0
	ldr r1, [r2]
	ldrh r0, [r1]
	ldrh r4, [r4, #0x22]
	adds r0, r0, r4
	strh r0, [r3]
	adds r1, #2
	str r1, [r2]
_080748A8:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080748B0: .4byte 0x04000004
_080748B4: .4byte 0x0400001A
_080748B8: .4byte gLCDControlBuffer
_080748BC: .4byte gUnknown_0201FB34
_080748C0: .4byte gUnknown_0201FDC0

	THUMB_FUNC_END sub_8074874

	THUMB_FUNC_START sub_80748C4
sub_80748C4: @ 0x080748C4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080748F8  @ gUnknown_08759484
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r1, [r0, #0x44]
	ldr r1, _080748FC  @ gUnknown_080E162A
	str r1, [r0, #0x48]
	ldr r1, _08074900  @ gUnknown_0875949C
	str r1, [r0, #0x4c]
	str r1, [r0, #0x50]
	ldr r1, _08074904  @ gUnknown_087594C8
	str r1, [r0, #0x54]
	ldr r0, _08074908  @ gUnknown_085C48AC
	movs r1, #0x20
	bl SomePaletteStoringRoutine_SpellAnim2
	bl sub_80551B0
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080748F8: .4byte gUnknown_08759484
_080748FC: .4byte gUnknown_080E162A
_08074900: .4byte gUnknown_0875949C
_08074904: .4byte gUnknown_087594C8
_08074908: .4byte gUnknown_085C48AC

	THUMB_FUNC_END sub_80748C4

	THUMB_FUNC_START sub_807490C
sub_807490C: @ 0x0807490C
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl sub_80558F4
	lsls r0, r0, #0x10
	asrs r3, r0, #0x10
	cmp r3, #0
	blt _08074948
	ldr r1, [r4, #0x4c]
	ldr r2, [r4, #0x50]
	ldr r5, [r4, #0x54]
	ldr r0, [r4, #0x5c]
	lsls r4, r3, #2
	adds r1, r4, r1
	ldr r1, [r1]
	adds r2, r4, r2
	ldr r2, [r2]
	bl sub_8055670
	adds r4, r4, r5
	ldr r0, [r4]
	movs r1, #0x80
	lsls r1, r1, #6
	bl SomeImageStoringRoutine_SpellAnim2
	b _0807495E
_08074948:
	movs r0, #1
	negs r0, r0
	cmp r3, r0
	bne _0807495E
	bl ClearBG1
	bl sub_805526C
	adds r0, r4, #0
	bl Proc_Break
_0807495E:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_807490C

	THUMB_FUNC_START sub_8074964
sub_8074964: @ 0x08074964
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0807499C  @ gUnknown_087594F4
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r1, [r0, #0x44]
	ldr r1, _080749A0  @ gUnknown_080E1664
	str r1, [r0, #0x48]
	ldr r1, _080749A4  @ gUnknown_0875950C
	str r1, [r0, #0x4c]
	str r1, [r0, #0x50]
	ldr r0, _080749A8  @ gUnknown_085C5994
	movs r1, #0x80
	lsls r1, r1, #6
	bl SomeImageStoringRoutine_SpellAnim2
	ldr r0, _080749AC  @ gUnknown_085C6054
	movs r1, #0x20
	bl SomePaletteStoringRoutine_SpellAnim2
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807499C: .4byte gUnknown_087594F4
_080749A0: .4byte gUnknown_080E1664
_080749A4: .4byte gUnknown_0875950C
_080749A8: .4byte gUnknown_085C5994
_080749AC: .4byte gUnknown_085C6054

	THUMB_FUNC_END sub_8074964

	THUMB_FUNC_START sub_80749B0
sub_80749B0: @ 0x080749B0
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl sub_80558F4
	lsls r0, r0, #0x10
	asrs r2, r0, #0x10
	cmp r2, #0
	blt _080749DE
	ldr r1, [r4, #0x4c]
	ldr r3, [r4, #0x50]
	ldr r0, [r4, #0x5c]
	lsls r2, r2, #2
	adds r1, r2, r1
	ldr r1, [r1]
	adds r2, r2, r3
	ldr r2, [r2]
	bl sub_8055670
	b _080749EC
_080749DE:
	movs r0, #1
	negs r0, r0
	cmp r2, r0
	bne _080749EC
	adds r0, r4, #0
	bl Proc_Break
_080749EC:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80749B0

	THUMB_FUNC_START sub_80749F4
sub_80749F4: @ 0x080749F4
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #4
	adds r5, r0, #0
	adds r6, r1, #0
	mov r8, r2
	ldr r0, _08074A44  @ gUnknown_08759524
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	ldr r3, _08074A48  @ gUnknown_085C71E4
	str r3, [sp]
	adds r0, r5, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl sub_8055554
	str r0, [r4, #0x64]
	strh r6, [r0, #2]
	mov r1, r8
	strh r1, [r0, #4]
	ldr r0, _08074A4C  @ gUnknown_085C6730
	movs r1, #0x80
	lsls r1, r1, #5
	bl SomeImageStoringRoutine_SpellAnim
	ldr r0, _08074A50  @ gUnknown_085C6054
	movs r1, #0x20
	bl SomePaletteStoringRoutine_SpellAnim
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08074A44: .4byte gUnknown_08759524
_08074A48: .4byte gUnknown_085C71E4
_08074A4C: .4byte gUnknown_085C6730
_08074A50: .4byte gUnknown_085C6054

	THUMB_FUNC_END sub_80749F4

	THUMB_FUNC_START sub_8074A54
sub_8074A54: @ 0x08074A54
	push {lr}
	ldr r0, [r0, #0x64]
	bl AnimDelete
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8074A54

	THUMB_FUNC_START sub_8074A60
sub_8074A60: @ 0x08074A60
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08074A88  @ gUnknown_08759544
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r2, #0
	strh r2, [r0, #0x2c]
	strh r2, [r0, #0x2e]
	movs r1, #0x19
	strh r1, [r0, #0x30]
	str r2, [r0, #0x44]
	ldr r1, _08074A8C  @ gUnknown_080E169A
	str r1, [r0, #0x48]
	ldr r1, _08074A90  @ gUnknown_085C60D4
	str r1, [r0, #0x4c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08074A88: .4byte gUnknown_08759544
_08074A8C: .4byte gUnknown_080E169A
_08074A90: .4byte gUnknown_085C60D4

	THUMB_FUNC_END sub_8074A60

	THUMB_FUNC_START sub_8074A94
sub_8074A94: @ 0x08074A94
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl sub_80558F4
	lsls r0, r0, #0x10
	asrs r3, r0, #0x10
	cmp r3, #0
	blt _08074ABE
	ldr r0, [r4, #0x4c]
	ldr r1, _08074AF0  @ gUnknown_020228AA
	movs r2, #8
	str r2, [sp]
	adds r2, r3, #0
	movs r3, #0xf
	bl sub_805588C
_08074ABE:
	ldrh r0, [r4, #0x2e]
	adds r0, #1
	movs r2, #0
	strh r0, [r4, #0x2e]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r3, #0x30
	ldrsh r1, [r4, r3]
	cmp r0, r1
	ble _08074AE6
	strh r2, [r4, #0x2c]
	strh r2, [r4, #0x2e]
	str r2, [r4, #0x44]
	ldr r0, _08074AF4  @ gUnknown_080E16DC
	str r0, [r4, #0x48]
	ldr r0, _08074AF8  @ gUnknown_085C6054
	str r0, [r4, #0x4c]
	adds r0, r4, #0
	bl Proc_Break
_08074AE6:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08074AF0: .4byte gUnknown_020228AA
_08074AF4: .4byte gUnknown_080E16DC
_08074AF8: .4byte gUnknown_085C6054

	THUMB_FUNC_END sub_8074A94

	THUMB_FUNC_START sub_8074AFC
sub_8074AFC: @ 0x08074AFC
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl sub_80558F4
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	cmp r1, #0
	blt _08074B22
	ldr r0, [r4, #0x4c]
	lsls r1, r1, #5
	adds r0, r0, r1
	movs r1, #0x20
	bl SomePaletteStoringRoutine_SpellAnim2
	b _08074B30
_08074B22:
	movs r0, #1
	negs r0, r0
	cmp r1, r0
	bne _08074B30
	adds r0, r4, #0
	bl Proc_Break
_08074B30:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8074AFC

	THUMB_FUNC_START sub_8074B38
sub_8074B38: @ 0x08074B38
	movs r1, #0
	strh r1, [r0, #0x2e]
	bx lr

	THUMB_FUNC_END sub_8074B38

	THUMB_FUNC_START sub_8074B40
sub_8074B40: @ 0x08074B40
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r1, _08074B8C  @ gUnknown_089AC5CC
	ldrh r0, [r5, #0x2e]
	adds r4, r0, #1
	strh r4, [r5, #0x2e]
	movs r0, #3
	ands r0, r4
	cmp r0, #0
	bne _08074B86
	lsls r4, r4, #0x10
	asrs r4, r4, #0x12
	movs r0, #0xf
	ands r4, r0
	lsls r4, r4, #1
	adds r4, r4, r1
	movs r0, #0x2c
	ldrsh r1, [r5, r0]
	adds r1, #0x10
	lsls r1, r1, #5
	adds r1, #0x12
	adds r0, r4, #0
	movs r2, #0xe
	bl CopyToPaletteBuffer
	adds r4, #0x40
	movs r0, #0x2c
	ldrsh r1, [r5, r0]
	adds r1, #0x11
	lsls r1, r1, #5
	adds r1, #0x12
	adds r0, r4, #0
	movs r2, #0xe
	bl CopyToPaletteBuffer
_08074B86:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08074B8C: .4byte gUnknown_089AC5CC

	THUMB_FUNC_END sub_8074B40

	THUMB_FUNC_START sub_8074B90
sub_8074B90: @ 0x08074B90
	push {r4, r5, lr}
	adds r5, r1, #0
	ldr r2, _08074BDC  @ gUnknown_089ACA08
	ldr r1, _08074BE0  @ 0x000003FF
	ands r1, r0
	lsls r1, r1, #5
	ldr r0, _08074BE4  @ 0x06010000
	adds r1, r1, r0
	adds r0, r2, #0
	bl Decompress
	ldr r4, _08074BE8  @ gUnknown_089AC9A8
	adds r1, r5, #0
	adds r1, #0x10
	lsls r1, r1, #5
	adds r0, r4, #0
	movs r2, #0x20
	bl CopyToPaletteBuffer
	adds r1, r5, #0
	adds r1, #0x11
	lsls r1, r1, #5
	adds r0, r4, #0
	movs r2, #0x20
	bl CopyToPaletteBuffer
	ldr r0, _08074BEC  @ gUnknown_08759564
	movs r1, #3
	bl Proc_Start
	movs r1, #0
	strh r5, [r0, #0x2c]
	ldr r0, _08074BF0  @ gUnknown_02020138
	str r1, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08074BDC: .4byte gUnknown_089ACA08
_08074BE0: .4byte 0x000003FF
_08074BE4: .4byte 0x06010000
_08074BE8: .4byte gUnknown_089AC9A8
_08074BEC: .4byte gUnknown_08759564
_08074BF0: .4byte gUnknown_02020138

	THUMB_FUNC_END sub_8074B90

	THUMB_FUNC_START sub_8074BF4
sub_8074BF4: @ 0x08074BF4
	push {lr}
	ldr r0, _08074C08  @ gUnknown_08759564
	bl Proc_EndEach
	ldr r1, _08074C0C  @ gUnknown_02020138
	movs r0, #1
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_08074C08: .4byte gUnknown_08759564
_08074C0C: .4byte gUnknown_02020138

	THUMB_FUNC_END sub_8074BF4

	THUMB_FUNC_START sub_8074C10
sub_8074C10: @ 0x08074C10
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r1, #0
	ldr r1, _08074C6C  @ gUnknown_085C8278
	mov r8, r1
	subs r0, #1
	lsls r4, r0, #1
	adds r0, r4, #0
	cmp r4, #0
	bge _08074C28
	negs r0, r4
_08074C28:
	ldr r5, _08074C70  @ 0x000003FF
	ands r0, r5
	lsls r0, r0, #5
	add r0, r8
	adds r1, r6, #0
	adds r1, #0x2c
	ands r1, r5
	lsls r1, r1, #5
	ldr r7, _08074C74  @ 0x06010000
	adds r1, r1, r7
	movs r2, #0x40
	bl sub_801498C
	adds r0, r4, #0
	cmp r0, #0
	bge _08074C4A
	negs r0, r0
_08074C4A:
	adds r0, #0x20
	ands r0, r5
	lsls r0, r0, #5
	add r0, r8
	adds r1, r6, #0
	adds r1, #0x4c
	ands r1, r5
	lsls r1, r1, #5
	adds r1, r1, r7
	movs r2, #0x40
	bl sub_801498C
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08074C6C: .4byte gUnknown_085C8278
_08074C70: .4byte 0x000003FF
_08074C74: .4byte 0x06010000

	THUMB_FUNC_END sub_8074C10

	THUMB_FUNC_START sub_8074C78
sub_8074C78: @ 0x08074C78
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	adds r7, r0, #0
	adds r6, r1, #0
	ldr r0, _08074CC0  @ gUnknown_089ACC98
	mov r9, r0
	ldr r0, _08074CC4  @ gUnknown_085C8278
	mov r8, r0
	cmp r7, #0
	blt _08074CD0
	movs r0, #0xc0
	lsls r0, r0, #2
	add r0, r8
	adds r1, #0x2c
	ldr r5, _08074CC8  @ 0x000003FF
	ands r1, r5
	lsls r1, r1, #5
	ldr r4, _08074CCC  @ 0x06010000
	adds r1, r1, r4
	movs r2, #0x40
	bl sub_801498C
	movs r0, #0xe0
	lsls r0, r0, #3
	add r0, r8
	adds r1, r6, #0
	adds r1, #0x4c
	ands r1, r5
	lsls r1, r1, #5
	adds r1, r1, r4
	movs r2, #0x40
	bl sub_801498C
	b _08074D00
	.align 2, 0
_08074CC0: .4byte gUnknown_089ACC98
_08074CC4: .4byte gUnknown_085C8278
_08074CC8: .4byte 0x000003FF
_08074CCC: .4byte 0x06010000
_08074CD0:
	movs r0, #0xd0
	lsls r0, r0, #2
	add r0, r8
	adds r1, r6, #0
	adds r1, #0x2c
	ldr r5, _08074D50  @ 0x000003FF
	ands r1, r5
	lsls r1, r1, #5
	ldr r4, _08074D54  @ 0x06010000
	adds r1, r1, r4
	movs r2, #0x40
	bl sub_801498C
	movs r0, #0xe8
	lsls r0, r0, #3
	add r0, r8
	adds r1, r6, #0
	adds r1, #0x4c
	ands r1, r5
	lsls r1, r1, #5
	adds r1, r1, r4
	movs r2, #0x40
	bl sub_801498C
_08074D00:
	adds r0, r7, #0
	cmp r7, #0
	bge _08074D08
	negs r0, r7
_08074D08:
	ldr r4, _08074D50  @ 0x000003FF
	ands r0, r4
	lsls r0, r0, #5
	add r0, r9
	adds r1, r6, #0
	adds r1, #0x2d
	ands r1, r4
	lsls r1, r1, #5
	ldr r5, _08074D54  @ 0x06010000
	adds r1, r1, r5
	movs r2, #0x20
	bl sub_801498C
	adds r0, r7, #0
	cmp r0, #0
	bge _08074D2A
	negs r0, r0
_08074D2A:
	adds r0, #0x20
	ands r0, r4
	lsls r0, r0, #5
	add r0, r9
	adds r1, r6, #0
	adds r1, #0x4d
	ands r1, r4
	lsls r1, r1, #5
	adds r1, r1, r5
	movs r2, #0x20
	bl sub_801498C
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08074D50: .4byte 0x000003FF
_08074D54: .4byte 0x06010000

	THUMB_FUNC_END sub_8074C78

	THUMB_FUNC_START sub_8074D58
sub_8074D58: @ 0x08074D58
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x1c
	str r0, [sp, #0xc]
	str r1, [sp, #0x10]
	mov r8, r2
	mov r9, r3
	str r0, [sp, #0x14]
	ldr r0, [sp, #0x3c]
	subs r0, #1
	lsls r0, r0, #1
	ldr r1, [sp, #0xc]
	adds r0, r1, r0
	str r0, [sp, #0x18]
	ldr r3, [sp, #0x10]
	lsls r6, r3, #0xc
	adds r7, r1, #0
	movs r0, #0x80
	lsls r0, r0, #3
	orrs r7, r0
	adds r5, r6, #0
	orrs r5, r7
	mov r0, r8
	subs r0, #0x12
	mov r1, r9
	subs r1, #4
	ldr r2, _08074DD8  @ gUnknown_085C9270
	str r5, [sp]
	movs r3, #0
	mov sl, r3
	str r3, [sp, #4]
	movs r3, #5
	str r3, [sp, #8]
	movs r3, #0
	bl sub_80716C8
	ldr r0, [sp, #0x3c]
	cmp r0, #0
	beq _08074E52
	ldr r0, _08074DDC  @ gUnknown_0875957C
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	ldr r1, [sp, #0x40]
	cmp r1, #0
	blt _08074DE4
	ldr r2, _08074DE0  @ gUnknown_085C92A0
	str r5, [sp]
	mov r3, sl
	str r3, [sp, #4]
	movs r0, #5
	str r0, [sp, #8]
	mov r0, r8
	mov r1, r9
	movs r3, #2
	bl sub_80716C8
	str r0, [r4, #0x64]
	b _08074E2A
	.align 2, 0
_08074DD8: .4byte gUnknown_085C9270
_08074DDC: .4byte gUnknown_0875957C
_08074DE0: .4byte gUnknown_085C92A0
_08074DE4:
	ldr r1, [sp, #0x18]
	movs r3, #0x80
	lsls r3, r3, #3
	orrs r1, r3
	orrs r1, r6
	mov r0, r8
	subs r0, #3
	ldr r2, _08074E64  @ gUnknown_085C92EC
	str r1, [sp]
	mov r1, sl
	str r1, [sp, #4]
	movs r3, #5
	str r3, [sp, #8]
	mov r1, r9
	movs r3, #2
	bl sub_80716C8
	str r0, [r4, #0x60]
	orrs r6, r7
	ldr r2, _08074E68  @ gUnknown_085C92D0
	str r6, [sp]
	mov r0, sl
	str r0, [sp, #4]
	movs r1, #5
	str r1, [sp, #8]
	mov r0, r8
	mov r1, r9
	movs r3, #2
	bl sub_80716C8
	str r0, [r4, #0x64]
	ldr r0, [sp, #0x40]
	ldr r1, [sp, #0x18]
	bl sub_8074C78
_08074E2A:
	movs r0, #0
	mov r3, r8
	strh r3, [r4, #0x32]
	mov r1, r9
	strh r1, [r4, #0x3a]
	strh r0, [r4, #0x2c]
	mov r3, sp
	ldrh r3, [r3, #0x14]
	strh r3, [r4, #0x2e]
	mov r0, sp
	ldrh r0, [r0, #0x18]
	strh r0, [r4, #0x30]
	ldr r1, [sp, #0xc]
	str r1, [r4, #0x44]
	ldr r3, [sp, #0x10]
	str r3, [r4, #0x48]
	ldr r0, [sp, #0x3c]
	str r0, [r4, #0x4c]
	ldr r1, [sp, #0x40]
	str r1, [r4, #0x50]
_08074E52:
	add sp, #0x1c
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08074E64: .4byte gUnknown_085C92EC
_08074E68: .4byte gUnknown_085C92D0

	THUMB_FUNC_END sub_8074D58

	THUMB_FUNC_START sub_8074E6C
sub_8074E6C: @ 0x08074E6C
	push {r4, r5, lr}
	sub sp, #0xc
	adds r4, r0, #0
	ldr r0, [r4, #0x50]
	cmp r0, #0
	bge _08074E80
	adds r0, r4, #0
	bl Proc_Break
	b _08074ECE
_08074E80:
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	movs r5, #0
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xf
	bne _08074ECE
	strh r5, [r4, #0x2c]
	ldr r3, [r4, #0x48]
	lsls r3, r3, #0xc
	movs r1, #0x30
	ldrsh r0, [r4, r1]
	movs r1, #0x80
	lsls r1, r1, #3
	orrs r0, r1
	orrs r3, r0
	movs r2, #0x32
	ldrsh r0, [r4, r2]
	subs r0, #3
	movs r2, #0x3a
	ldrsh r1, [r4, r2]
	ldr r2, _08074ED8  @ gUnknown_085C9328
	str r3, [sp]
	str r5, [sp, #4]
	movs r3, #3
	str r3, [sp, #8]
	movs r3, #2
	bl sub_80716C8
	str r0, [r4, #0x60]
	ldr r0, [r4, #0x50]
	movs r2, #0x30
	ldrsh r1, [r4, r2]
	bl sub_8074C10
	adds r0, r4, #0
	bl Proc_Break
_08074ECE:
	add sp, #0xc
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08074ED8: .4byte gUnknown_085C9328

	THUMB_FUNC_END sub_8074E6C

	THUMB_FUNC_START sub_8074EDC
sub_8074EDC: @ 0x08074EDC
	push {r4, lr}
	adds r4, r0, #0
	ldr r2, [r4, #0x50]
	cmp r2, #0
	bge _08074EEC
	bl Proc_Break
	b _08074F0E
_08074EEC:
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xf
	bne _08074F0E
	movs r0, #0
	strh r0, [r4, #0x2c]
	movs r0, #0x30
	ldrsh r1, [r4, r0]
	adds r0, r2, #0
	bl sub_8074C78
	adds r0, r4, #0
	bl Proc_Break
_08074F0E:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8074EDC

	THUMB_FUNC_START sub_8074F14
sub_8074F14: @ 0x08074F14
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08074F38  @ gUnknown_02020138
	ldr r0, [r0]
	cmp r0, #1
	bne _08074F32
	ldr r0, [r4, #0x60]
	bl Proc_End
	ldr r0, [r4, #0x64]
	bl Proc_End
	adds r0, r4, #0
	bl Proc_Break
_08074F32:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08074F38: .4byte gUnknown_02020138

	THUMB_FUNC_END sub_8074F14

	THUMB_FUNC_START sub_8074F3C
sub_8074F3C: @ 0x08074F3C
	push {lr}
	ldr r0, _08074F4C  @ gUnknown_0202013C
	ldr r0, [r0]
	cmp r0, #1
	beq _08074F50
	movs r0, #0
	b _08074F52
	.align 2, 0
_08074F4C: .4byte gUnknown_0202013C
_08074F50:
	movs r0, #1
_08074F52:
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8074F3C

	THUMB_FUNC_START nullsub_18
nullsub_18: @ 0x08074F58
	bx lr

	THUMB_FUNC_END nullsub_18

	THUMB_FUNC_START NewEkrTriangle
NewEkrTriangle: @ 0x08074F5C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08074F78  @ gUnknown_087595A4
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	ldr r1, _08074F7C  @ gUnknown_0202013C
	movs r0, #0
	str r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08074F78: .4byte gUnknown_087595A4
_08074F7C: .4byte gUnknown_0202013C

	THUMB_FUNC_END NewEkrTriangle

	THUMB_FUNC_START sub_8074F80
sub_8074F80: @ 0x08074F80
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r6, r0, #0
	movs r0, #0
	mov r9, r0
	mov sl, r0
	mov r8, r0
	movs r7, #0
	ldr r0, [r6, #0x5c]
	bl GetAISSubjectId
	cmp r0, #0
	bne _08074FAC
	ldr r0, _08074FA8  @ gpEkrBattleUnitLeft
	b _08074FAE
	.align 2, 0
_08074FA8: .4byte gpEkrBattleUnitLeft
_08074FAC:
	ldr r0, _08074FFC  @ gpEkrBattleUnitRight
_08074FAE:
	ldr r0, [r0]
	ldr r0, [r0, #4]
	ldrb r5, [r0, #4]
	cmp r5, #9
	bge _08074FBA
	b _080750BC
_08074FBA:
	cmp r5, #0xc
	ble _08074FC0
	b _080750BC
_08074FC0:
	ldr r0, _08075000  @ gUnknown_0203E194
	ldr r1, [r0]
	ldr r0, [r1, #4]
	ldrb r0, [r0, #4]
	cmp r0, #9
	bne _08074FD0
	movs r2, #0
	mov r9, r2
_08074FD0:
	cmp r0, #0xa
	bne _08074FD8
	movs r2, #0
	mov r9, r2
_08074FD8:
	cmp r0, #0xb
	bne _08074FE0
	movs r2, #1
	mov r9, r2
_08074FE0:
	cmp r0, #0xc
	bne _08074FE8
	movs r0, #1
	mov r9, r0
_08074FE8:
	adds r0, r1, #0
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0
	bne _08075004
	movs r0, #1
	b _0807500A
	.align 2, 0
_08074FFC: .4byte gpEkrBattleUnitRight
_08075000: .4byte gUnknown_0203E194
_08075004:
	adds r0, r4, #0
	bl GetItemType
_0807500A:
	cmp r0, #1
	beq _08075014
	cmp r0, #2
	beq _0807501A
	b _0807502C
_08075014:
	movs r1, #0
	mov r8, r1
	b _0807502C
_0807501A:
	adds r0, r4, #0
	bl GetItemIndex
	movs r2, #1
	mov r8, r2
	cmp r0, #0x28
	bne _0807502C
	movs r0, #2
	mov r8, r0
_0807502C:
	ldr r0, _08075068  @ gUnknown_0203E194
	ldr r1, [r0, #4]
	ldr r0, [r1, #4]
	ldrb r0, [r0, #4]
	cmp r0, #9
	bne _0807503C
	movs r2, #0
	mov sl, r2
_0807503C:
	cmp r0, #0xa
	bne _08075044
	movs r2, #0
	mov sl, r2
_08075044:
	cmp r0, #0xb
	bne _0807504C
	movs r2, #1
	mov sl, r2
_0807504C:
	cmp r0, #0xc
	bne _08075054
	movs r0, #1
	mov sl, r0
_08075054:
	adds r0, r1, #0
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0
	bne _0807506C
	movs r0, #1
	b _08075072
	.align 2, 0
_08075068: .4byte gUnknown_0203E194
_0807506C:
	adds r0, r4, #0
	bl GetItemType
_08075072:
	cmp r0, #1
	beq _0807507C
	cmp r0, #2
	beq _08075080
	b _0807508E
_0807507C:
	movs r7, #0
	b _0807508E
_08075080:
	adds r0, r4, #0
	bl GetItemIndex
	movs r7, #1
	cmp r0, #0x28
	bne _0807508E
	movs r7, #2
_0807508E:
	ldr r0, [r6, #0x5c]
	str r7, [sp]
	mov r1, r9
	mov r2, sl
	mov r3, r8
	bl sub_8075424
	ldr r0, _080750B4  @ gpEkrBattleUnitRight
	ldr r0, [r0]
	adds r0, #0x4a
	ldrh r0, [r0]
	bl GetItemIndex
	cmp r0, #0x28
	bne _08075164
	ldr r1, _080750B8  @ gUnknown_0202013C
	movs r0, #0
	b _08075168
	.align 2, 0
_080750B4: .4byte gpEkrBattleUnitRight
_080750B8: .4byte gUnknown_0202013C
_080750BC:
	ldr r0, _080750E8  @ gUnknown_0203E194
	ldr r1, [r0]
	ldr r0, [r1, #4]
	ldrb r0, [r0, #4]
	cmp r0, #0x48
	bne _080750CC
	movs r2, #0
	mov r9, r2
_080750CC:
	cmp r0, #0x49
	bne _080750D4
	movs r0, #1
	mov r9, r0
_080750D4:
	adds r0, r1, #0
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0
	bne _080750EC
	movs r0, #1
	b _080750F6
	.align 2, 0
_080750E8: .4byte gUnknown_0203E194
_080750EC:
	adds r0, r4, #0
	bl GetItemType
	cmp r0, #0
	beq _08075100
_080750F6:
	cmp r0, #1
	bne _08075104
	movs r1, #0
	mov r8, r1
	b _08075104
_08075100:
	movs r2, #1
	mov r8, r2
_08075104:
	ldr r0, _08075130  @ gUnknown_0203E194
	ldr r1, [r0, #4]
	ldr r0, [r1, #4]
	ldrb r0, [r0, #4]
	cmp r0, #0x48
	bne _08075114
	movs r2, #0
	mov sl, r2
_08075114:
	cmp r0, #0x49
	bne _0807511C
	movs r0, #1
	mov sl, r0
_0807511C:
	adds r0, r1, #0
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0
	bne _08075134
	movs r0, #1
	b _0807513E
	.align 2, 0
_08075130: .4byte gUnknown_0203E194
_08075134:
	adds r0, r4, #0
	bl GetItemType
	cmp r0, #0
	beq _08075146
_0807513E:
	cmp r0, #1
	bne _08075148
	movs r7, #0
	b _08075148
_08075146:
	movs r7, #1
_08075148:
	ldr r0, [r6, #0x5c]
	str r7, [sp]
	mov r1, r9
	mov r2, sl
	mov r3, r8
	bl sub_8075184
	cmp r5, #0x48
	bne _08075164
	ldr r1, _08075160  @ gUnknown_0202013C
	movs r0, #0
	b _08075168
	.align 2, 0
_08075160: .4byte gUnknown_0202013C
_08075164:
	ldr r1, _08075180  @ gUnknown_0202013C
	movs r0, #1
_08075168:
	str r0, [r1]
	adds r0, r6, #0
	bl Proc_Break
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08075180: .4byte gUnknown_0202013C

	THUMB_FUNC_END sub_8074F80

	THUMB_FUNC_START sub_8075184
sub_8075184: @ 0x08075184
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	mov r8, r3
	ldr r7, [sp, #0x18]
	ldr r0, _080751B8  @ gUnknown_087595BC
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r5, [r0, #0x44]
	str r6, [r0, #0x48]
	mov r1, r8
	str r1, [r0, #0x4c]
	str r7, [r0, #0x50]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080751B8: .4byte gUnknown_087595BC

	THUMB_FUNC_END sub_8075184

	THUMB_FUNC_START sub_80751BC
sub_80751BC: @ 0x080751BC
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetCoreAIStruct
	adds r5, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xa
	bne _080751E2
	ldr r0, [r4, #0x5c]
	ldr r2, [r4, #0x44]
	ldr r3, [r4, #0x4c]
	movs r1, #0
	bl sub_8075350
_080751E2:
	movs r1, #0x2c
	ldrsh r0, [r4, r1]
	cmp r0, #0x1c
	bne _080751F2
	adds r0, r5, #0
	movs r1, #6
	bl StartSpellBG_FLASH
_080751F2:
	movs r3, #0x2c
	ldrsh r0, [r4, r3]
	cmp r0, #0x22
	bne _08075226
	ldr r2, [r4, #0x44]
	ldr r3, [r4, #0x4c]
	adds r0, r5, #0
	movs r1, #0
	bl sub_807527C
	ldr r0, [r4, #0x5c]
	ldr r2, [r4, #0x48]
	ldr r3, [r4, #0x50]
	movs r1, #1
	bl sub_8075350
	movs r0, #0x9a
	lsls r0, r0, #2
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r2, [r4, #0x5c]
	movs r3, #2
	ldrsh r2, [r2, r3]
	movs r3, #1
	bl sub_80729A4
_08075226:
	movs r1, #0x2c
	ldrsh r0, [r4, r1]
	cmp r0, #0x33
	bne _08075236
	adds r0, r5, #0
	movs r1, #6
	bl StartSpellBG_FLASH
_08075236:
	movs r3, #0x2c
	ldrsh r0, [r4, r3]
	cmp r0, #0x39
	bne _0807525E
	ldr r2, [r4, #0x48]
	ldr r3, [r4, #0x50]
	adds r0, r5, #0
	movs r1, #1
	bl sub_807527C
	movs r0, #0x9a
	lsls r0, r0, #2
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r2, [r4, #0x5c]
	movs r3, #2
	ldrsh r2, [r2, r3]
	movs r3, #1
	bl sub_80729A4
_0807525E:
	movs r1, #0x2c
	ldrsh r0, [r4, r1]
	cmp r0, #0x43
	bne _08075272
	ldr r1, _08075278  @ gUnknown_0202013C
	movs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
_08075272:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08075278: .4byte gUnknown_0202013C

	THUMB_FUNC_END sub_80751BC

	THUMB_FUNC_START sub_807527C
sub_807527C: @ 0x0807527C
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	adds r7, r3, #0
	ldr r0, _080752A4  @ gUnknown_087595D4
	movs r1, #3
	bl Proc_Start
	adds r1, r0, #0
	str r4, [r1, #0x5c]
	movs r0, #0
	strh r0, [r1, #0x2c]
	str r0, [r1, #0x44]
	cmp r5, #0
	bne _080752B0
	ldr r0, _080752A8  @ gUnknown_0203E19C
	ldr r2, [r0]
	ldr r0, _080752AC  @ gUnknown_080E1732
	b _080752B6
	.align 2, 0
_080752A4: .4byte gUnknown_087595D4
_080752A8: .4byte gUnknown_0203E19C
_080752AC: .4byte gUnknown_080E1732
_080752B0:
	ldr r0, _080752EC  @ gUnknown_0203E19C
	ldr r2, [r0, #4]
	ldr r0, _080752F0  @ gUnknown_080E1740
_080752B6:
	str r0, [r1, #0x48]
	ldr r0, _080752F4  @ gUnknown_087595EC
	str r0, [r1, #0x4c]
	str r0, [r1, #0x50]
	ldr r4, _080752F8  @ gUnknown_02017790
	adds r0, r2, #0
	adds r1, r4, #0
	bl LZ77UnCompWram
	adds r0, r4, #0
	movs r1, #0x20
	bl SomePaletteStoringRoutine_SpellAnim2
	ldr r0, _080752FC  @ gUnknown_080E17C0
	cmp r6, #0
	beq _080752DE
	ldr r0, _08075300  @ gUnknown_080E2B54
	cmp r7, #0
	bne _080752DE
	ldr r0, _08075304  @ gUnknown_080E2164
_080752DE:
	movs r1, #0x80
	lsls r1, r1, #6
	bl SomeImageStoringRoutine_SpellAnim2
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080752EC: .4byte gUnknown_0203E19C
_080752F0: .4byte gUnknown_080E1740
_080752F4: .4byte gUnknown_087595EC
_080752F8: .4byte gUnknown_02017790
_080752FC: .4byte gUnknown_080E17C0
_08075300: .4byte gUnknown_080E2B54
_08075304: .4byte gUnknown_080E2164

	THUMB_FUNC_END sub_807527C

	THUMB_FUNC_START sub_8075308
sub_8075308: @ 0x08075308
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl sub_80558F4
	lsls r0, r0, #0x10
	asrs r2, r0, #0x10
	cmp r2, #0
	blt _08075336
	ldr r1, [r4, #0x4c]
	ldr r3, [r4, #0x50]
	ldr r0, [r4, #0x5c]
	lsls r2, r2, #2
	adds r1, r2, r1
	ldr r1, [r1]
	adds r2, r2, r3
	ldr r2, [r2]
	bl sub_8055670
	b _08075348
_08075336:
	movs r0, #1
	negs r0, r0
	cmp r2, r0
	bne _08075348
	bl ClearBG1
	adds r0, r4, #0
	bl Proc_Break
_08075348:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8075308

	THUMB_FUNC_START sub_8075350
sub_8075350: @ 0x08075350
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r7, r0, #0
	adds r4, r1, #0
	mov r8, r2
	mov r9, r3
	ldr r0, _08075384  @ gUnknown_08759604
	movs r1, #3
	bl Proc_Start
	adds r5, r0, #0
	str r7, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	cmp r4, #0
	bne _08075390
	movs r0, #0x12
	strh r0, [r5, #0x2e]
	ldr r0, _08075388  @ gUnknown_0203E19C
	ldr r6, [r0]
	ldr r3, _0807538C  @ gUnknown_08759B34
	b _0807539A
	.align 2, 0
_08075384: .4byte gUnknown_08759604
_08075388: .4byte gUnknown_0203E19C
_0807538C: .4byte gUnknown_08759B34
_08075390:
	movs r0, #0x11
	strh r0, [r5, #0x2e]
	ldr r0, _080753E4  @ gUnknown_0203E19C
	ldr r6, [r0, #4]
	ldr r3, _080753E8  @ gUnknown_08759E68
_0807539A:
	str r3, [sp]
	adds r0, r7, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl sub_8055554
	str r0, [r5, #0x60]
	ldr r4, _080753EC  @ gUnknown_0201A790
	adds r0, r6, #0
	adds r1, r4, #0
	bl LZ77UnCompWram
	adds r0, r4, #0
	movs r1, #0x20
	bl SomePaletteStoringRoutine_SpellAnim
	ldr r0, _080753F0  @ gUnknown_080E3B78
	mov r1, r8
	cmp r1, #0
	beq _080753CC
	ldr r0, _080753F4  @ gUnknown_080E4EFC
	mov r1, r9
	cmp r1, #0
	bne _080753CC
	ldr r0, _080753F8  @ gUnknown_080E4530
_080753CC:
	movs r1, #0x80
	lsls r1, r1, #5
	bl SomeImageStoringRoutine_SpellAnim
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080753E4: .4byte gUnknown_0203E19C
_080753E8: .4byte gUnknown_08759E68
_080753EC: .4byte gUnknown_0201A790
_080753F0: .4byte gUnknown_080E3B78
_080753F4: .4byte gUnknown_080E4EFC
_080753F8: .4byte gUnknown_080E4530

	THUMB_FUNC_END sub_8075350

	THUMB_FUNC_START sub_80753FC
sub_80753FC: @ 0x080753FC
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x2e
	ldrsh r1, [r4, r2]
	cmp r0, r1
	ble _0807541E
	ldr r0, [r4, #0x60]
	bl AnimDelete
	adds r0, r4, #0
	bl Proc_Break
_0807541E:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80753FC

	THUMB_FUNC_START sub_8075424
sub_8075424: @ 0x08075424
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	mov r8, r3
	ldr r7, [sp, #0x18]
	ldr r0, _08075458  @ gUnknown_0875961C
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r5, [r0, #0x44]
	str r6, [r0, #0x48]
	mov r1, r8
	str r1, [r0, #0x4c]
	str r7, [r0, #0x50]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08075458: .4byte gUnknown_0875961C

	THUMB_FUNC_END sub_8075424

	THUMB_FUNC_START sub_807545C
sub_807545C: @ 0x0807545C
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _08075492
	ldr r0, [r5, #0x5c]
	ldr r1, [r5, #0x44]
	ldr r2, [r5, #0x48]
	ldr r3, [r5, #0x4c]
	ldr r4, [r5, #0x50]
	str r4, [sp]
	bl sub_8075538
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r0, [r5, #0x5c]
	movs r3, #2
	ldrsh r2, [r0, r3]
	movs r0, #0xe2
	movs r3, #1
	bl sub_80729A4
_08075492:
	movs r1, #0x2c
	ldrsh r0, [r5, r1]
	cmp r0, #0x30
	bne _080754B8
	ldr r0, [r5, #0x5c]
	ldr r2, [r5, #0x44]
	ldr r3, [r5, #0x4c]
	movs r1, #0
	bl sub_8075718
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r0, [r5, #0x5c]
	movs r3, #2
	ldrsh r2, [r0, r3]
	movs r0, #0xe2
	movs r3, #1
	bl sub_80729A4
_080754B8:
	movs r1, #0x2c
	ldrsh r0, [r5, r1]
	cmp r0, #0x3c
	bne _080754D0
	ldr r0, [r5, #0x5c]
	movs r1, #4
	bl StartSpellBG_FLASH
	ldr r0, [r5, #0x5c]
	movs r1, #0xa
	bl sub_807589C
_080754D0:
	movs r3, #0x2c
	ldrsh r0, [r5, r3]
	cmp r0, #0x4f
	bne _080754F6
	ldr r0, [r5, #0x5c]
	ldr r2, [r5, #0x48]
	ldr r3, [r5, #0x50]
	movs r1, #1
	bl sub_8075718
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r0, [r5, #0x5c]
	movs r3, #2
	ldrsh r2, [r0, r3]
	movs r0, #0xe2
	movs r3, #1
	bl sub_80729A4
_080754F6:
	movs r1, #0x2c
	ldrsh r0, [r5, r1]
	cmp r0, #0x5b
	bne _08075504
	ldr r1, _08075534  @ gUnknown_0202013C
	movs r0, #1
	str r0, [r1]
_08075504:
	movs r3, #0x2c
	ldrsh r0, [r5, r3]
	cmp r0, #0x60
	bne _0807551C
	ldr r0, [r5, #0x5c]
	movs r1, #4
	bl StartSpellBG_FLASH
	ldr r0, [r5, #0x5c]
	movs r1, #0xa
	bl sub_807589C
_0807551C:
	movs r1, #0x2c
	ldrsh r0, [r5, r1]
	cmp r0, #0x78
	bne _0807552A
	adds r0, r5, #0
	bl Proc_Break
_0807552A:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08075534: .4byte gUnknown_0202013C

	THUMB_FUNC_END sub_807545C

	THUMB_FUNC_START sub_8075538
sub_8075538: @ 0x08075538
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	mov r8, r0
	adds r4, r1, #0
	mov r9, r2
	adds r6, r3, #0
	ldr r0, _08075570  @ gUnknown_08759634
	movs r1, #3
	bl Proc_Start
	adds r5, r0, #0
	mov r0, r8
	str r0, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	movs r0, #0x14
	strh r0, [r5, #0x2e]
	ldr r0, _08075574  @ gUnknown_0203E19C
	ldr r7, [r0]
	cmp r4, #0
	bne _08075580
	ldr r3, _08075578  @ gUnknown_08759F00
	ldr r6, _0807557C  @ gUnknown_080E58A4
	b _080755AC
	.align 2, 0
_08075570: .4byte gUnknown_08759634
_08075574: .4byte gUnknown_0203E19C
_08075578: .4byte gUnknown_08759F00
_0807557C: .4byte gUnknown_080E58A4
_08075580:
	cmp r6, #1
	beq _08075598
	cmp r6, #1
	bcs _080755A8
	ldr r3, _08075590  @ gUnknown_08759F90
	ldr r6, _08075594  @ gUnknown_080E5BC4
	b _080755AC
	.align 2, 0
_08075590: .4byte gUnknown_08759F90
_08075594: .4byte gUnknown_080E5BC4
_08075598:
	ldr r3, _080755A0  @ gUnknown_0875A020
	ldr r6, _080755A4  @ gUnknown_080E5F98
	b _080755AC
	.align 2, 0
_080755A0: .4byte gUnknown_0875A020
_080755A4: .4byte gUnknown_080E5F98
_080755A8:
	ldr r3, _080755EC  @ gUnknown_0875A0AC
	ldr r6, _080755F0  @ gUnknown_080E63CC
_080755AC:
	str r3, [sp]
	mov r0, r8
	adds r1, r3, #0
	adds r2, r3, #0
	bl sub_8055554
	adds r1, r0, #0
	str r1, [r5, #0x60]
	ldr r0, _080755F4  @ 0x00008840
	strh r0, [r1, #8]
	ldr r4, _080755F8  @ gUnknown_0201A790
	adds r0, r7, #0
	adds r1, r4, #0
	bl LZ77UnCompWram
	ldr r1, _080755FC  @ gUnknown_02022BA8
	adds r0, r4, #0
	movs r2, #8
	bl CpuFastSet
	adds r0, r6, #0
	adds r1, r4, #0
	bl LZ77UnCompWram
	ldr r0, _08075600  @ gUnknown_0203E19C
	ldr r7, [r0, #4]
	mov r0, r9
	cmp r0, #0
	bne _0807560C
	ldr r3, _08075604  @ gUnknown_08759F00
	ldr r6, _08075608  @ gUnknown_080E58A4
	b _08075638
	.align 2, 0
_080755EC: .4byte gUnknown_0875A0AC
_080755F0: .4byte gUnknown_080E63CC
_080755F4: .4byte 0x00008840
_080755F8: .4byte gUnknown_0201A790
_080755FC: .4byte gUnknown_02022BA8
_08075600: .4byte gUnknown_0203E19C
_08075604: .4byte gUnknown_08759F00
_08075608: .4byte gUnknown_080E58A4
_0807560C:
	ldr r0, [sp, #0x20]
	cmp r0, #1
	beq _08075624
	cmp r0, #1
	bcs _08075634
	ldr r3, _0807561C  @ gUnknown_08759F90
	ldr r6, _08075620  @ gUnknown_080E5BC4
	b _08075638
	.align 2, 0
_0807561C: .4byte gUnknown_08759F90
_08075620: .4byte gUnknown_080E5BC4
_08075624:
	ldr r3, _0807562C  @ gUnknown_0875A020
	ldr r6, _08075630  @ gUnknown_080E5F98
	b _08075638
	.align 2, 0
_0807562C: .4byte gUnknown_0875A020
_08075630: .4byte gUnknown_080E5F98
_08075634:
	ldr r3, _080756A0  @ gUnknown_0875A0AC
	ldr r6, _080756A4  @ gUnknown_080E63CC
_08075638:
	str r3, [sp]
	mov r0, r8
	adds r1, r3, #0
	adds r2, r3, #0
	bl sub_8055554
	adds r1, r0, #0
	str r1, [r5, #0x64]
	ldr r0, _080756A8  @ 0x0000A880
	strh r0, [r1, #8]
	ldr r4, _080756AC  @ gUnknown_0201AF90
	adds r0, r7, #0
	adds r1, r4, #0
	bl LZ77UnCompWram
	ldr r1, _080756B0  @ gUnknown_02022BE8
	adds r0, r4, #0
	movs r2, #8
	bl CpuFastSet
	adds r0, r6, #0
	adds r1, r4, #0
	bl LZ77UnCompWram
	ldr r1, _080756B4  @ 0x06010800
	ldr r0, _080756B8  @ 0xFFFFF800
	adds r4, r4, r0
	movs r2, #0x80
	lsls r2, r2, #5
	adds r0, r4, #0
	bl RegisterTileGraphics
	bl EnablePaletteSync
	ldr r1, [r5, #0x60]
	ldr r0, [r5, #0x5c]
	ldrh r0, [r0, #2]
	adds r0, #0x20
	strh r0, [r1, #2]
	ldr r1, [r5, #0x64]
	ldr r0, [r5, #0x5c]
	ldrh r0, [r0, #2]
	subs r0, #0x20
	strh r0, [r1, #2]
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080756A0: .4byte gUnknown_0875A0AC
_080756A4: .4byte gUnknown_080E63CC
_080756A8: .4byte 0x0000A880
_080756AC: .4byte gUnknown_0201AF90
_080756B0: .4byte gUnknown_02022BE8
_080756B4: .4byte 0x06010800
_080756B8: .4byte 0xFFFFF800

	THUMB_FUNC_END sub_8075538

	THUMB_FUNC_START sub_80756BC
sub_80756BC: @ 0x080756BC
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	movs r0, #0x2c
	ldrsh r3, [r4, r0]
	movs r1, #0x2e
	ldrsh r0, [r4, r1]
	str r0, [sp]
	movs r0, #0
	movs r1, #0x20
	movs r2, #0
	bl Interpolate
	ldr r2, [r4, #0x60]
	ldr r1, [r4, #0x5c]
	ldrh r1, [r1, #2]
	adds r1, r1, r0
	strh r1, [r2, #2]
	ldr r2, [r4, #0x64]
	ldr r1, [r4, #0x5c]
	ldrh r1, [r1, #2]
	subs r1, r1, r0
	strh r1, [r2, #2]
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x2e
	ldrsh r1, [r4, r2]
	cmp r0, r1
	ble _0807570E
	ldr r0, [r4, #0x60]
	bl AnimDelete
	ldr r0, [r4, #0x64]
	bl AnimDelete
	adds r0, r4, #0
	bl Proc_Break
_0807570E:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80756BC

	THUMB_FUNC_START sub_8075718
sub_8075718: @ 0x08075718
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	mov r8, r0
	adds r5, r1, #0
	adds r6, r2, #0
	adds r7, r3, #0
	ldr r0, _08075754  @ gUnknown_0875964C
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	mov r0, r8
	str r0, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	movs r0, #5
	strh r0, [r4, #0x2e]
	adds r0, r4, #0
	adds r0, #0x29
	strb r5, [r0]
	adds r0, #1
	strb r6, [r0]
	cmp r5, #0
	bne _0807575C
	ldr r0, _08075758  @ gUnknown_0203E19C
	ldr r0, [r0]
	b _08075760
	.align 2, 0
_08075754: .4byte gUnknown_0875964C
_08075758: .4byte gUnknown_0203E19C
_0807575C:
	ldr r0, _0807576C  @ gUnknown_0203E19C
	ldr r0, [r0, #4]
_08075760:
	mov r9, r0
	cmp r6, #0
	bne _08075778
	ldr r3, _08075770  @ gUnknown_0875A19C
	ldr r6, _08075774  @ gUnknown_080E678C
	b _080757A4
	.align 2, 0
_0807576C: .4byte gUnknown_0203E19C
_08075770: .4byte gUnknown_0875A19C
_08075774: .4byte gUnknown_080E678C
_08075778:
	cmp r7, #1
	beq _08075790
	cmp r7, #1
	bcs _080757A0
	ldr r3, _08075788  @ gUnknown_0875A314
	ldr r6, _0807578C  @ gUnknown_080E6CC4
	b _080757A4
	.align 2, 0
_08075788: .4byte gUnknown_0875A314
_0807578C: .4byte gUnknown_080E6CC4
_08075790:
	ldr r3, _08075798  @ gUnknown_0875A468
	ldr r6, _0807579C  @ gUnknown_080E7400
	b _080757A4
	.align 2, 0
_08075798: .4byte gUnknown_0875A468
_0807579C: .4byte gUnknown_080E7400
_080757A0:
	ldr r3, _080757D0  @ gUnknown_0875A730
	ldr r6, _080757D4  @ gUnknown_080E7B8C
_080757A4:
	str r3, [sp]
	mov r0, r8
	adds r1, r3, #0
	adds r2, r3, #0
	bl sub_8055554
	adds r1, r0, #0
	str r1, [r4, #0x60]
	cmp r5, #0
	bne _080757D8
	ldrh r0, [r1, #4]
	adds r0, #0xa
	strh r0, [r1, #4]
	ldr r1, [r4, #0x60]
	movs r0, #0x78
	strh r0, [r1, #0xa]
	bl AnimSort
	ldr r0, [r4, #0x5c]
	ldrh r1, [r0, #2]
	adds r1, #0x10
	b _080757EE
	.align 2, 0
_080757D0: .4byte gUnknown_0875A730
_080757D4: .4byte gUnknown_080E7B8C
_080757D8:
	ldrh r0, [r1, #4]
	adds r0, #2
	strh r0, [r1, #4]
	ldr r1, [r4, #0x60]
	movs r0, #0x14
	strh r0, [r1, #0xa]
	bl AnimSort
	ldr r0, [r4, #0x5c]
	ldrh r1, [r0, #2]
	subs r1, #0xc
_080757EE:
	strh r1, [r4, #0x32]
	ldrh r0, [r0, #2]
	subs r0, #0x10
	strh r0, [r4, #0x34]
	ldr r0, [r4, #0x60]
	strh r1, [r0, #2]
	ldr r4, _08075824  @ gUnknown_0201A790
	mov r0, r9
	adds r1, r4, #0
	bl LZ77UnCompWram
	adds r0, r4, #0
	movs r1, #0x20
	bl SomePaletteStoringRoutine_SpellAnim
	movs r1, #0x80
	lsls r1, r1, #5
	adds r0, r6, #0
	bl SomeImageStoringRoutine_SpellAnim
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08075824: .4byte gUnknown_0201A790

	THUMB_FUNC_END sub_8075718

	THUMB_FUNC_START sub_8075828
sub_8075828: @ 0x08075828
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	movs r0, #0x32
	ldrsh r1, [r4, r0]
	movs r5, #0x34
	ldrsh r2, [r4, r5]
	movs r0, #0x2c
	ldrsh r3, [r4, r0]
	movs r5, #0x2e
	ldrsh r0, [r4, r5]
	str r0, [sp]
	movs r0, #1
	bl Interpolate
	ldr r1, [r4, #0x60]
	strh r0, [r1, #2]
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x2e
	ldrsh r1, [r4, r2]
	cmp r0, r1
	ble _0807586A
	movs r0, #0
	strh r0, [r4, #0x2c]
	movs r0, #0x14
	strh r0, [r4, #0x2e]
	adds r0, r4, #0
	bl Proc_Break
_0807586A:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8075828

	THUMB_FUNC_START sub_8075874
sub_8075874: @ 0x08075874
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x2e
	ldrsh r1, [r4, r2]
	cmp r0, r1
	ble _08075896
	ldr r0, [r4, #0x60]
	bl AnimDelete
	adds r0, r4, #0
	bl Proc_Break
_08075896:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8075874

	THUMB_FUNC_START sub_807589C
sub_807589C: @ 0x0807589C
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	ldr r1, _080758CC  @ gUnknown_0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _080758D0  @ gUnknown_0875966C
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	movs r1, #0
	bl sub_8053678
	str r0, [r4, #0x60]
	movs r0, #0
	strh r0, [r4, #0x2c]
	strh r6, [r4, #0x2e]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080758CC: .4byte gUnknown_0201774C
_080758D0: .4byte gUnknown_0875966C

	THUMB_FUNC_END sub_807589C

	THUMB_FUNC_START sub_80758D4
sub_80758D4: @ 0x080758D4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	adds r7, r0, #0
	ldr r4, _08075A38  @ gUnknown_02017760
	ldrh r1, [r4]
	ldrh r2, [r4, #2]
	movs r0, #2
	bl BG_SetPosition
	ldr r6, _08075A3C  @ gUnknown_02000038
	ldrh r1, [r6]
	ldrh r0, [r4]
	adds r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldrh r2, [r6, #2]
	ldrh r3, [r4, #2]
	adds r2, r2, r3
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #0
	bl BG_SetPosition
	ldrh r0, [r6]
	ldrh r1, [r4]
	adds r0, r0, r1
	negs r0, r0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldrh r1, [r6, #2]
	ldrh r2, [r4, #2]
	adds r1, r1, r2
	negs r1, r1
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl EkrGauge_80511E4
	ldrh r0, [r6]
	ldrh r3, [r4]
	adds r0, r0, r3
	negs r0, r0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r1, [r6, #2]
	ldrh r2, [r4, #2]
	adds r1, r1, r2
	negs r1, r1
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	bl sub_8051B5C
	ldr r3, _08075A40  @ gUnknown_02000028
	mov r9, r3
	ldrh r5, [r4]
	ldrh r0, [r3]
	adds r1, r5, r0
	ldr r2, _08075A44  @ gUnknown_0201FB0C
	mov sl, r2
	ldr r0, [r2]
	subs r1, r1, r0
	ldr r3, _08075A48  @ gUnknown_0200002C
	mov r8, r3
	ldrh r2, [r3]
	ldrh r3, [r4, #2]
	subs r2, r2, r3
	mov r4, r9
	ldrh r4, [r4, #2]
	adds r5, r5, r4
	subs r5, r5, r0
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	mov r0, r8
	ldrh r4, [r0, #2]
	subs r4, r4, r3
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	movs r0, #0
	bl sub_80559F0
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	movs r0, #1
	adds r1, r5, #0
	adds r2, r4, #0
	bl sub_80559F0
	ldrh r0, [r7, #0x2c]
	adds r0, #1
	strh r0, [r7, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x2e
	ldrsh r1, [r7, r2]
	cmp r0, r1
	ble _08075A2A
	ldr r1, _08075A4C  @ gUnknown_0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	ldrh r1, [r6]
	ldrh r2, [r6, #2]
	movs r0, #0
	bl BG_SetPosition
	ldrh r0, [r6]
	negs r0, r0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldrh r1, [r6, #2]
	negs r1, r1
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl EkrGauge_80511E4
	ldrh r0, [r6]
	negs r0, r0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r1, [r6, #2]
	negs r1, r1
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	bl sub_8051B5C
	mov r3, sl
	ldr r0, [r3]
	mov r4, r9
	ldrh r1, [r4]
	subs r1, r1, r0
	ldrh r4, [r4, #2]
	subs r4, r4, r0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	mov r0, r8
	ldrh r5, [r0, #2]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r3, #0
	ldrsh r2, [r0, r3]
	movs r0, #0
	bl sub_80559F0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	movs r0, #1
	adds r1, r4, #0
	adds r2, r5, #0
	bl sub_80559F0
	ldr r0, [r7, #0x60]
	bl Proc_End
	adds r0, r7, #0
	bl Proc_Break
_08075A2A:
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08075A38: .4byte gUnknown_02017760
_08075A3C: .4byte gUnknown_02000038
_08075A40: .4byte gUnknown_02000028
_08075A44: .4byte gUnknown_0201FB0C
_08075A48: .4byte gUnknown_0200002C
_08075A4C: .4byte gUnknown_0201774C

	THUMB_FUNC_END sub_80758D4

	THUMB_FUNC_START sub_8075A50
sub_8075A50: @ 0x08075A50
	push {lr}
	lsls r1, r0, #1
	adds r1, r1, r0
	ldr r0, _08075A68  @ gBattleBGDataTable
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r0, [r1]
	ldr r1, _08075A6C  @ 0x06008000
	bl LZ77UnCompVram
	pop {r0}
	bx r0
	.align 2, 0
_08075A68: .4byte gBattleBGDataTable
_08075A6C: .4byte 0x06008000

	THUMB_FUNC_END sub_8075A50

	THUMB_FUNC_START sub_8075A70
sub_8075A70: @ 0x08075A70
	push {r4, lr}
	sub sp, #8
	lsls r1, r0, #1
	adds r1, r1, r0
	adds r1, #1
	ldr r0, _08075AA8  @ gBattleBGDataTable
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r0, [r1]
	ldr r4, _08075AAC  @ gUnknown_02019790
	adds r1, r4, #0
	bl LZ77UnCompWram
	ldr r1, _08075AB0  @ gBG3TilemapBuffer
	movs r0, #6
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r2, #0x1e
	movs r3, #0x14
	bl sub_8070E94
	add sp, #8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08075AA8: .4byte gBattleBGDataTable
_08075AAC: .4byte gUnknown_02019790
_08075AB0: .4byte gBG3TilemapBuffer

	THUMB_FUNC_END sub_8075A70

	THUMB_FUNC_START sub_8075AB4
sub_8075AB4: @ 0x08075AB4
	push {lr}
	lsls r1, r0, #1
	adds r1, r1, r0
	adds r1, #2
	ldr r0, _08075AD0  @ gBattleBGDataTable
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r0, [r1]
	ldr r1, _08075AD4  @ pPalette6Buffer
	bl LZ77UnCompWram
	pop {r0}
	bx r0
	.align 2, 0
_08075AD0: .4byte gBattleBGDataTable
_08075AD4: .4byte pPalette6Buffer

	THUMB_FUNC_END sub_8075AB4

	THUMB_FUNC_START sub_8075AD8
sub_8075AD8: @ 0x08075AD8
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	bl sub_8075A50
	movs r5, #0
	str r5, [sp]
	ldr r1, _08075B14  @ 0x0600FFE0
	ldr r2, _08075B18  @ 0x01000008
	mov r0, sp
	bl CpuFastSet
	adds r0, r4, #0
	bl sub_8075A70
	adds r0, r4, #0
	bl sub_8075AB4
	ldr r0, _08075B1C  @ gPaletteBuffer
	strh r5, [r0]
	movs r0, #8
	bl BG_EnableSyncByMask
	bl EnablePaletteSync
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08075B14: .4byte 0x0600FFE0
_08075B18: .4byte 0x01000008
_08075B1C: .4byte gPaletteBuffer

	THUMB_FUNC_END sub_8075AD8

	THUMB_FUNC_START DoesBattlePopupExist
DoesBattlePopupExist: @ 0x08075B20
	push {lr}
	ldr r0, _08075B30  @ gpAnimOnPopupExist
	ldr r0, [r0]
	cmp r0, #1
	beq _08075B34
	movs r0, #0
	b _08075B36
	.align 2, 0
_08075B30: .4byte gpAnimOnPopupExist
_08075B34:
	movs r0, #1
_08075B36:
	pop {r1}
	bx r1

	THUMB_FUNC_END DoesBattlePopupExist

	THUMB_FUNC_START DeleteAnimsOnPopup
DeleteAnimsOnPopup: @ 0x08075B3C
	push {r4, lr}
	ldr r4, _08075B54  @ gpAnimOnPopuProc
	ldr r0, [r4]
	cmp r0, #0
	beq _08075B4E
	bl Proc_End
	movs r0, #0
	str r0, [r4]
_08075B4E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08075B54: .4byte gpAnimOnPopuProc

	THUMB_FUNC_END DeleteAnimsOnPopup

	THUMB_FUNC_START sub_8075B58
sub_8075B58: @ 0x08075B58
	push {lr}
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #0x5a
	bl SomePlaySound_8071990
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8075B58

	THUMB_FUNC_START sub_8075B68
sub_8075B68: @ 0x08075B68
	push {lr}
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #0x5c
	bl SomePlaySound_8071990
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8075B68

	THUMB_FUNC_START MakeBattlePopupTileMapFromTSA
MakeBattlePopupTileMapFromTSA: @ 0x08075B78
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r2, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov sl, r1
	ldr r3, _08075CA4  @ gUnknown_02019790
	movs r0, #0x88
	lsls r0, r0, #5
	mov r8, r0
	ldrh r0, [r3]
	add r0, r8
	strh r0, [r2]
	adds r1, r2, #0
	adds r1, #0x40
	ldrh r0, [r3, #0x34]
	add r0, r8
	strh r0, [r1]
	adds r1, #0x40
	adds r0, r3, #0
	adds r0, #0x68
	ldrh r0, [r0]
	add r0, r8
	strh r0, [r1]
	adds r1, #0x40
	adds r0, r3, #0
	adds r0, #0x9c
	ldrh r0, [r0]
	add r0, r8
	strh r0, [r1]
	ldrh r0, [r3, #2]
	add r0, r8
	strh r0, [r2, #2]
	subs r1, #0x7e
	ldrh r0, [r3, #0x36]
	add r0, r8
	strh r0, [r1]
	adds r1, #0x40
	adds r0, r3, #0
	adds r0, #0x6a
	ldrh r0, [r0]
	add r0, r8
	strh r0, [r1]
	adds r1, #0x40
	adds r0, r3, #0
	adds r0, #0x9e
	ldrh r0, [r0]
	add r0, r8
	strh r0, [r1]
	movs r1, #0
	mov r9, r1
	cmp r9, sl
	bcs _08075C38
	adds r7, r2, #0
	adds r7, #0xc4
	str r7, [sp]
	movs r0, #0x6c
	adds r0, r0, r3
	mov ip, r0
	adds r6, r2, #0
	adds r6, #0x84
	adds r5, r2, #0
	adds r5, #0x44
	adds r4, r3, #4
	adds r1, r2, #0
_08075C02:
	ldrh r0, [r4]
	add r0, r8
	strh r0, [r1, #4]
	ldrh r0, [r4, #0x34]
	add r0, r8
	strh r0, [r5]
	mov r7, ip
	ldrh r0, [r7]
	add r0, r8
	strh r0, [r6]
	ldrh r0, [r7, #0x34]
	add r0, r8
	ldr r7, [sp]
	strh r0, [r7]
	adds r0, r7, #0
	adds r0, #2
	str r0, [sp]
	movs r7, #2
	add ip, r7
	adds r6, #2
	adds r5, #2
	adds r4, #2
	adds r1, #2
	movs r0, #1
	add r9, r0
	cmp r9, sl
	bcc _08075C02
_08075C38:
	mov r1, r9
	lsls r0, r1, #1
	adds r2, r0, r2
	ldrh r0, [r3, #0x30]
	add r0, r8
	strh r0, [r2, #4]
	adds r1, r2, #0
	adds r1, #0x44
	adds r0, r3, #0
	adds r0, #0x64
	ldrh r0, [r0]
	add r0, r8
	strh r0, [r1]
	adds r1, #0x40
	adds r0, r3, #0
	adds r0, #0x98
	ldrh r0, [r0]
	add r0, r8
	strh r0, [r1]
	adds r1, #0x40
	adds r0, r3, #0
	adds r0, #0xcc
	ldrh r0, [r0]
	add r0, r8
	strh r0, [r1]
	ldrh r0, [r3, #0x32]
	add r0, r8
	strh r0, [r2, #6]
	subs r1, #0x7e
	adds r0, r3, #0
	adds r0, #0x66
	ldrh r0, [r0]
	add r0, r8
	strh r0, [r1]
	adds r1, #0x40
	adds r0, r3, #0
	adds r0, #0x9a
	ldrh r0, [r0]
	add r0, r8
	strh r0, [r1]
	adds r1, #0x40
	adds r0, r3, #0
	adds r0, #0xce
	ldrh r0, [r0]
	add r0, r8
	strh r0, [r1]
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08075CA4: .4byte gUnknown_02019790

	THUMB_FUNC_END MakeBattlePopupTileMapFromTSA

	THUMB_FUNC_START DrawBattlePopup
DrawBattlePopup: @ 0x08075CA8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	str r0, [sp]
	mov r9, r1
	mov sl, r2
	ldr r0, _08075D14  @ gUnknown_08803B30
	ldr r1, _08075D18  @ 0x06002000
	bl LZ77UnCompVram
	ldr r0, _08075D1C  @ gUnknown_08803CD0
	ldr r1, _08075D20  @ gUnknown_02019790
	bl LZ77UnCompWram
	ldr r0, _08075D24  @ gSomeFontStruct
	ldr r1, _08075D28  @ 0x06002100
	movs r2, #0x84
	lsls r2, r2, #1
	movs r3, #1
	bl Font_InitForUI
	bl Font_SetSomeSpecialDrawingRoutine
	ldr r0, _08075D2C  @ gUnknown_08803CB0
	ldr r1, _08075D30  @ pPalette1Buffer
	movs r2, #8
	bl CpuFastSet
	mov r0, r9
	cmp r0, #0
	bne _08075D34
	movs r0, #1
	bl GetStringFromIndex
	adds r4, r0, #0
	bl GetStringTextWidth
	str r0, [sp, #4]
	adds r1, r0, #0
	adds r1, #0x10
	mov r8, r1
	movs r0, #2
	bl GetStringFromIndex
	adds r4, r0, #0
	bl GetStringTextWidth
	mov r2, r8
	adds r7, r0, r2
	b _08075D7A
	.align 2, 0
_08075D14: .4byte gUnknown_08803B30
_08075D18: .4byte 0x06002000
_08075D1C: .4byte gUnknown_08803CD0
_08075D20: .4byte gUnknown_02019790
_08075D24: .4byte gSomeFontStruct
_08075D28: .4byte 0x06002100
_08075D2C: .4byte gUnknown_08803CB0
_08075D30: .4byte pPalette1Buffer
_08075D34:
	mov r0, r9
	cmp r0, #1
	bne _08075D62
	movs r1, #0
	str r1, [sp, #4]
	mov r0, sl
	movs r1, #1
	bl GetItemNameWithArticle
	adds r4, r0, #0
	bl GetStringTextWidth
	adds r0, #0x10
	mov r8, r0
	movs r0, #3
	bl GetStringFromIndex
	adds r4, r0, #0
	bl GetStringTextWidth
	add r0, r8
	adds r7, r0, #4
	b _08075D7A
_08075D62:
	movs r2, #0
	str r2, [sp, #4]
	movs r0, #0x10
	mov r8, r0
	movs r0, #0xd
	bl GetStringFromIndex
	adds r4, r0, #0
	bl GetStringTextWidth
	adds r7, r0, #0
	adds r7, #0x10
_08075D7A:
	adds r0, r7, #7
	asrs r6, r0, #3
	ldr r0, _08075DD4  @ gBG1TilemapBuffer
	lsls r1, r6, #0x10
	lsrs r1, r1, #0x10
	bl MakeBattlePopupTileMapFromTSA
	ldr r5, _08075DD8  @ gTextEkrlvupMsg
	adds r0, r5, #0
	adds r1, r6, #0
	bl Text_Init
	lsls r0, r6, #3
	subs r0, r0, r7
	asrs r0, r0, #1
	str r0, [sp, #8]
	adds r0, r5, #0
	ldr r1, [sp, #8]
	bl Text_SetXCursor
	ldr r0, _08075DDC  @ gUnknown_08803BD0
	ldr r1, _08075DE0  @ 0x06002100
	bl LZ77UnCompVram
	mov r1, r9
	cmp r1, #0
	bne _08075DE4
	movs r0, #1
	bl GetStringFromIndex
	adds r4, r0, #0
	adds r0, r5, #0
	movs r1, #0
	bl Text_SetColorId
	adds r0, r5, #0
	adds r1, r4, #0
	bl Text_AppendString
	adds r0, r5, #0
	movs r1, #0x10
	bl Text_Advance
	movs r0, #2
	b _08075E0E
	.align 2, 0
_08075DD4: .4byte gBG1TilemapBuffer
_08075DD8: .4byte gTextEkrlvupMsg
_08075DDC: .4byte gUnknown_08803BD0
_08075DE0: .4byte 0x06002100
_08075DE4:
	mov r2, r9
	cmp r2, #1
	bne _08075E26
	mov r0, sl
	movs r1, #1
	bl GetItemNameWithArticle
	adds r4, r0, #0
	adds r0, r5, #0
	movs r1, #1
	bl Text_SetColorId
	adds r0, r5, #0
	adds r1, r4, #0
	bl Text_AppendString
	adds r0, r5, #0
	movs r1, #0x14
	bl Text_Advance
	movs r0, #3
_08075E0E:
	bl GetStringFromIndex
	adds r4, r0, #0
	adds r0, r5, #0
	movs r1, #0
	bl Text_SetColorId
	adds r0, r5, #0
	adds r1, r4, #0
	bl Text_AppendString
	b _08075E3E
_08075E26:
	movs r0, #0xd
	bl GetStringFromIndex
	adds r4, r0, #0
	adds r0, r5, #0
	movs r1, #0
	bl Text_SetColorId
	adds r0, r5, #0
	adds r1, r4, #0
	bl Text_AppendString
_08075E3E:
	adds r1, r6, #2
	lsls r1, r1, #3
	movs r0, #0xe0
	subs r0, r0, r1
	asrs r4, r0, #1
	negs r1, r4
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldr r2, _08075E80  @ 0x0000FFD0
	movs r0, #1
	bl BG_SetPosition
	movs r0, #2
	bl BG_EnableSyncByMask
	bl ResetIconGraphics_
	mov r0, r9
	cmp r0, #0
	bne _08075E84
	movs r0, #1
	movs r1, #0x12
	bl LoadIconPalette
	mov r0, sl
	bl GetItemType
	adds r0, #0x70
	movs r1, #0x40
	bl LoadIconObjectGraphics
	b _08075EC0
	.align 2, 0
_08075E80: .4byte 0x0000FFD0
_08075E84:
	mov r1, r9
	cmp r1, #1
	bne _08075EA8
	movs r0, #0
	movs r1, #0x12
	bl LoadIconPalette
	mov r0, sl
	bl GetItemIconId
	movs r1, #0x40
	bl LoadIconObjectGraphics
	adds r0, r4, #0
	subs r0, #0xe
	mov r2, r8
	adds r4, r0, r2
	b _08075EC0
_08075EA8:
	movs r0, #1
	movs r1, #0x12
	bl LoadIconPalette
	mov r0, sl
	adds r0, #0x70
	movs r1, #0x40
	bl LoadIconObjectGraphics
	adds r0, r4, #0
	subs r0, #0x10
	adds r4, r0, r7
_08075EC0:
	ldr r0, _08075F10  @ gPopupIconFrameData
	movs r1, #0x96
	bl AnimCreate
	ldr r1, [sp]
	str r0, [r1, #0x60]
	movs r1, #0x91
	lsls r1, r1, #6
	strh r1, [r0, #8]
	ldr r1, [sp, #8]
	adds r1, #0x10
	adds r1, r4, r1
	ldr r2, [sp, #4]
	adds r1, r1, r2
	strh r1, [r0, #2]
	movs r1, #0x38
	strh r1, [r0, #4]
	bl EnablePaletteSync
	bl SetDefaultColorEffects
	ldr r2, _08075F14  @ gLCDControlBuffer
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
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08075F10: .4byte gPopupIconFrameData
_08075F14: .4byte gLCDControlBuffer

	THUMB_FUNC_END DrawBattlePopup

	THUMB_FUNC_START Battle_MakePopups
Battle_MakePopups: @ 0x08075F18
	push {r4, r5, lr}
	ldr r0, _08075F6C  @ gUnknown_0203E120
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #4
	bne _08075F9E
	ldr r4, _08075F70  @ gpAnimOnPopuProc
	ldr r0, _08075F74  @ ProcScr_ekrPopup2
	movs r1, #3
	bl Proc_Start
	adds r5, r0, #0
	str r5, [r4]
	ldr r1, _08075F78  @ gpAnimOnPopupExist
	movs r0, #0
	str r0, [r1]
	subs r0, #1
	str r0, [r5, #0x44]
	str r0, [r5, #0x48]
	movs r2, #0
	ldr r4, _08075F7C  @ gpEkrBattleUnitRight
	ldr r3, _08075F80  @ gpEkrBattleUnitLeft
_08075F44:
	ldr r0, [r4]
	adds r0, #0x28
	adds r0, r0, r2
	ldrb r0, [r0]
	cmp r0, #0
	bne _08075F86
	ldr r0, [r3]
	adds r0, #0x28
	adds r0, r0, r2
	ldrb r0, [r0]
	cmp r0, #0
	beq _08075F86
	ldr r1, [r5, #0x44]
	movs r0, #1
	negs r0, r0
	cmp r1, r0
	bne _08075F84
	str r2, [r5, #0x44]
	b _08075F86
	.align 2, 0
_08075F6C: .4byte gUnknown_0203E120
_08075F70: .4byte gpAnimOnPopuProc
_08075F74: .4byte ProcScr_ekrPopup2
_08075F78: .4byte gpAnimOnPopupExist
_08075F7C: .4byte gpEkrBattleUnitRight
_08075F80: .4byte gpEkrBattleUnitLeft
_08075F84:
	str r2, [r5, #0x48]
_08075F86:
	adds r2, #1
	cmp r2, #7
	ble _08075F44
	ldr r1, [r5, #0x44]
	movs r0, #1
	negs r0, r0
	cmp r1, r0
	beq _0807603C
	movs r0, #0x80
	bl Sound_SetSEVolume
	b _08076066
_08075F9E:
	ldr r4, _08076048  @ gpAnimOnPopuProc
	ldr r0, _0807604C  @ ProcScr_ekrPopup
	movs r1, #3
	bl Proc_Start
	adds r5, r0, #0
	str r5, [r4]
	ldr r1, _08076050  @ gpAnimOnPopupExist
	movs r0, #0
	str r0, [r1]
	strh r0, [r5, #0x2c]
	str r0, [r5, #0x48]
	str r0, [r5, #0x44]
	str r0, [r5, #0x50]
	str r0, [r5, #0x4c]
	ldr r0, _08076054  @ gUnknown_0203E114
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _08075FF4
	ldr r4, _08076058  @ gpEkrBattleUnitLeft
	ldr r0, [r4]
	bl HasBattleUnitGainedWeaponLevel
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _08075FDE
	ldr r0, [r4]
	adds r0, #0x4a
	ldrh r0, [r0]
	str r0, [r5, #0x44]
_08075FDE:
	ldr r0, [r4]
	bl DidBattleUnitBreakWeapon
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _08075FF4
	ldr r0, [r4]
	adds r0, #0x4a
	ldrh r0, [r0]
	str r0, [r5, #0x48]
_08075FF4:
	ldr r0, _08076054  @ gUnknown_0203E114
	movs r1, #2
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _0807602C
	ldr r4, _0807605C  @ gpEkrBattleUnitRight
	ldr r0, [r4]
	bl HasBattleUnitGainedWeaponLevel
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _08076016
	ldr r0, [r4]
	adds r0, #0x4a
	ldrh r0, [r0]
	str r0, [r5, #0x4c]
_08076016:
	ldr r0, [r4]
	bl DidBattleUnitBreakWeapon
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _0807602C
	ldr r0, [r4]
	adds r0, #0x4a
	ldrh r0, [r0]
	str r0, [r5, #0x50]
_0807602C:
	ldr r0, [r5, #0x44]
	ldr r1, [r5, #0x48]
	adds r0, r0, r1
	ldr r1, [r5, #0x4c]
	adds r0, r0, r1
	ldr r1, [r5, #0x50]
	cmn r0, r1
	bne _08076060
_0807603C:
	ldr r1, _08076050  @ gpAnimOnPopupExist
	movs r0, #1
	str r0, [r1]
	bl DeleteAnimsOnPopup
	b _08076066
	.align 2, 0
_08076048: .4byte gpAnimOnPopuProc
_0807604C: .4byte ProcScr_ekrPopup
_08076050: .4byte gpAnimOnPopupExist
_08076054: .4byte gUnknown_0203E114
_08076058: .4byte gpEkrBattleUnitLeft
_0807605C: .4byte gpEkrBattleUnitRight
_08076060:
	movs r0, #0x80
	bl Sound_SetSEVolume
_08076066:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END Battle_MakePopups

	THUMB_FUNC_START BattlePopup_Wait16Frames
BattlePopup_Wait16Frames: @ 0x0807606C
	push {lr}
	adds r1, r0, #0
	ldrh r0, [r1, #0x2c]
	adds r0, #1
	strh r0, [r1, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x10
	ble _08076084
	adds r0, r1, #0
	bl Proc_Break
_08076084:
	pop {r0}
	bx r0

	THUMB_FUNC_END BattlePopup_Wait16Frames

	THUMB_FUNC_START ekrPopup_DrawWRankUp
ekrPopup_DrawWRankUp: @ 0x08076088
	push {r4, lr}
	adds r4, r0, #0
	ldr r2, [r4, #0x44]
	cmp r2, #0
	beq _080760A4
	movs r1, #0
	bl DrawBattlePopup
	bl sub_8075B58
	movs r0, #0
	strh r0, [r4, #0x2c]
	movs r0, #0x60
	strh r0, [r4, #0x2e]
_080760A4:
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END ekrPopup_DrawWRankUp

	THUMB_FUNC_START ekrPopup_WaitWRankUp
ekrPopup_WaitWRankUp: @ 0x080760B0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x44]
	cmp r0, #0
	bne _080760C2
	adds r0, r4, #0
	bl Proc_Break
	b _080760E4
_080760C2:
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x2e
	ldrsh r1, [r4, r2]
	cmp r0, r1
	ble _080760E4
	ldr r0, [r4, #0x60]
	bl AnimDelete
	bl ClearBG1
	adds r0, r4, #0
	bl Proc_Break
_080760E4:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END ekrPopup_WaitWRankUp

	THUMB_FUNC_START ekrPopup_DrawWRankUp2
ekrPopup_DrawWRankUp2: @ 0x080760EC
	push {r4, lr}
	adds r4, r0, #0
	ldr r2, [r4, #0x4c]
	cmp r2, #0
	beq _08076108
	movs r1, #0
	bl DrawBattlePopup
	bl sub_8075B58
	movs r0, #0
	strh r0, [r4, #0x2c]
	movs r0, #0x60
	strh r0, [r4, #0x2e]
_08076108:
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END ekrPopup_DrawWRankUp2

	THUMB_FUNC_START ekrPopup_WaitWRankUp2
ekrPopup_WaitWRankUp2: @ 0x08076114
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x4c]
	cmp r0, #0
	bne _08076126
	adds r0, r4, #0
	bl Proc_Break
	b _08076148
_08076126:
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x2e
	ldrsh r1, [r4, r2]
	cmp r0, r1
	ble _08076148
	ldr r0, [r4, #0x60]
	bl AnimDelete
	bl ClearBG1
	adds r0, r4, #0
	bl Proc_Break
_08076148:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END ekrPopup_WaitWRankUp2

	THUMB_FUNC_START ekrPopup_DrawWpnBroke
ekrPopup_DrawWpnBroke: @ 0x08076150
	push {r4, lr}
	adds r4, r0, #0
	ldr r2, [r4, #0x48]
	cmp r2, #0
	beq _0807616C
	movs r1, #1
	bl DrawBattlePopup
	bl sub_8075B68
	movs r0, #0
	strh r0, [r4, #0x2c]
	movs r0, #0x6c
	strh r0, [r4, #0x2e]
_0807616C:
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END ekrPopup_DrawWpnBroke

	THUMB_FUNC_START ekrPopup_WaitWpnBroke
ekrPopup_WaitWpnBroke: @ 0x08076178
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x48]
	cmp r0, #0
	bne _0807618A
	adds r0, r4, #0
	bl Proc_Break
	b _080761AC
_0807618A:
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x2e
	ldrsh r1, [r4, r2]
	cmp r0, r1
	ble _080761AC
	ldr r0, [r4, #0x60]
	bl AnimDelete
	bl ClearBG1
	adds r0, r4, #0
	bl Proc_Break
_080761AC:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END ekrPopup_WaitWpnBroke

	THUMB_FUNC_START ekrPopup_DrawWpnBroke2
ekrPopup_DrawWpnBroke2: @ 0x080761B4
	push {r4, lr}
	adds r4, r0, #0
	ldr r2, [r4, #0x50]
	cmp r2, #0
	beq _080761D0
	movs r1, #1
	bl DrawBattlePopup
	bl sub_8075B68
	movs r0, #0
	strh r0, [r4, #0x2c]
	movs r0, #0x6c
	strh r0, [r4, #0x2e]
_080761D0:
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END ekrPopup_DrawWpnBroke2

	THUMB_FUNC_START ekrPopup_WaitWpnBroke2
ekrPopup_WaitWpnBroke2: @ 0x080761DC
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x50]
	cmp r0, #0
	bne _080761EE
	adds r0, r4, #0
	bl Proc_Break
	b _08076214
_080761EE:
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x2e
	ldrsh r1, [r4, r2]
	cmp r0, r1
	ble _08076214
	movs r0, #0
	strh r0, [r4, #0x2c]
	ldr r0, [r4, #0x60]
	bl AnimDelete
	bl ClearBG1
	adds r0, r4, #0
	bl Proc_Break
_08076214:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END ekrPopup_WaitWpnBroke2

	THUMB_FUNC_START ekrPopup_MarkEnd
ekrPopup_MarkEnd: @ 0x0807621C
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x10
	ble _08076242
	ldr r0, _08076248  @ gpAnimOnPopupExist
	movs r1, #1
	str r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #1
	bl Sound_SetSEVolume
	adds r0, r4, #0
	bl Proc_Break
_08076242:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08076248: .4byte gpAnimOnPopupExist

	THUMB_FUNC_END ekrPopup_MarkEnd

	THUMB_FUNC_START nullsub_68
nullsub_68: @ 0x0807624C
	bx lr

	THUMB_FUNC_END nullsub_68

.align 2, 0
