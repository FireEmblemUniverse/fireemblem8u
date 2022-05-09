	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	@ The screen with the chapter name and all

	THUMB_FUNC_START sub_8020AF8
sub_8020AF8: @ 0x08020AF8
	push {lr}
	movs r0, #0
	bl SetupBackgrounds
	bl sub_80156D4
	ldr r0, _08020B1C  @ gRAMChapterData
	ldrb r0, [r0, #0x15]
	bl AllocWeatherParticles
	bl SMS_UpdateFromGameData
	bl SMS_FlushIndirect
	bl Font_LoadForUI
	pop {r0}
	bx r0
	.align 2, 0
_08020B1C: .4byte gRAMChapterData

	THUMB_FUNC_END sub_8020AF8

	THUMB_FUNC_START sub_8020B20
sub_8020B20: @ 0x08020B20
	ldr r1, _08020B2C  @ gUnknown_0202BCB0
	movs r0, #0xa0
	lsls r0, r0, #2
	strh r0, [r1, #0xe]
	bx lr
	.align 2, 0
_08020B2C: .4byte gUnknown_0202BCB0

	THUMB_FUNC_END sub_8020B20

	THUMB_FUNC_START sub_8020B30
sub_8020B30: @ 0x08020B30
	push {r4, r5, lr}
	sub sp, #8
	ldr r2, _08020C10  @ gLCDControlBuffer
	ldrb r0, [r2, #1]
	movs r1, #1
	orrs r0, r1
	movs r1, #2
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2, #1]
	movs r0, #1
	movs r1, #0x10
	movs r2, #0
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	movs r4, #0
	str r4, [sp]
	movs r0, #0
	movs r1, #1
	movs r2, #0
	movs r3, #0
	bl sub_8001ED0
	movs r0, #1
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #1
	bl sub_8001F0C
	movs r0, #1
	bl sub_8001F64
	str r4, [sp, #4]
	movs r1, #0xc0
	lsls r1, r1, #0x13
	ldr r2, _08020C14  @ 0x01000008
	add r0, sp, #4
	bl CpuFastSet
	ldr r0, _08020C18  @ gBG0TilemapBuffer
	movs r1, #0
	bl BG_Fill
	ldr r0, _08020C1C  @ gBG1TilemapBuffer
	movs r1, #0
	bl BG_Fill
	ldr r0, _08020C20  @ gBG2TilemapBuffer
	movs r1, #0
	bl BG_Fill
	movs r0, #7
	bl BG_EnableSyncByMask
	bl DisableMapPaletteAnimations
	ldr r4, _08020C24  @ gRAMChapterData
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	bl UnpackChapterMapGraphics
	bl SetupMapSpritesPalettes
	bl LoadObjUIGfx
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	bl GetROMChapterStruct
	ldrb r0, [r0, #0x10]
	lsls r0, r0, #4
	bl sub_8015A40
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r0, #0xf
	movs r1, #0xf8
	lsls r1, r1, #1
	ands r0, r1
	ldr r5, _08020C28  @ gUnknown_0202BCB0
	strh r0, [r5, #0xc]
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	bl GetROMChapterStruct
	ldrb r0, [r0, #0x11]
	lsls r0, r0, #4
	bl sub_8015A6C
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r0, #0xf
	movs r1, #0xfc
	lsls r1, r1, #2
	ands r0, r1
	strh r0, [r5, #0xe]
	bl RefreshEntityBmMaps
	bl RenderBmMap
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08020C10: .4byte gLCDControlBuffer
_08020C14: .4byte 0x01000008
_08020C18: .4byte gBG0TilemapBuffer
_08020C1C: .4byte gBG1TilemapBuffer
_08020C20: .4byte gBG2TilemapBuffer
_08020C24: .4byte gRAMChapterData
_08020C28: .4byte gUnknown_0202BCB0

	THUMB_FUNC_END sub_8020B30

	THUMB_FUNC_START sub_8020C2C
sub_8020C2C: @ 0x08020C2C
	push {r4, r5, lr}
	adds r4, r0, #0
	bl sub_8001710
	ldr r5, _08020C9C  @ gUnknown_02022968
	adds r0, r5, #0
	movs r1, #6
	movs r2, #0xa
	movs r3, #1
	bl sub_800172C
	movs r1, #0xa0
	lsls r1, r1, #2
	adds r0, r5, r1
	movs r1, #0x1a
	movs r2, #6
	movs r3, #1
	bl sub_800172C
	movs r1, #0xa0
	lsls r1, r1, #1
	adds r0, r5, r1
	movs r1, #0x10
	movs r2, #2
	movs r3, #1
	bl sub_800172C
	movs r1, #0x88
	lsls r1, r1, #2
	adds r0, r5, r1
	movs r1, #0x17
	movs r2, #1
	movs r3, #1
	bl sub_800172C
	bl sub_80D74B0
	bl EnablePaletteSync
	adds r4, #0x4c
	movs r0, #0x1e
	strh r0, [r4]
	ldr r0, _08020CA0  @ gRAMChapterData
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetROMChapterStruct
	ldrb r0, [r0, #0x12]
	cmp r0, #5
	bne _08020C96
	bl WfxFlamesInitGradientPublic
_08020C96:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08020C9C: .4byte gUnknown_02022968
_08020CA0: .4byte gRAMChapterData

	THUMB_FUNC_END sub_8020C2C

	THUMB_FUNC_START sub_8020CA4
sub_8020CA4: @ 0x08020CA4
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	bl GetGameClock
	adds r4, r0, #0
	movs r0, #1
	ands r4, r0
	cmp r4, #0
	beq _08020CB8
	b _08020DAE
_08020CB8:
	bl sub_80D74B0
	ldr r5, _08020D30  @ gRAMChapterData
	movs r0, #0xe
	ldrsb r0, [r5, r0]
	bl GetROMChapterStruct
	ldrb r0, [r0, #0x12]
	cmp r0, #5
	bne _08020CD0
	bl WfxFlamesInitGradientPublic
_08020CD0:
	bl GetChapterThing
	cmp r0, #2
	beq _08020CE8
	movs r0, #0xe
	ldrsb r0, [r5, r0]
	bl GetROMChapterStruct
	adds r0, #0x87
	ldrb r0, [r0]
	cmp r0, #0
	beq _08020D3C
_08020CE8:
	movs r0, #0xe
	ldrsb r0, [r5, r0]
	bl GetROMChapterStruct
	ldrh r1, [r0, #0x28]
	ldr r0, _08020D34  @ 0x0000FFFF
	cmp r1, r0
	beq _08020D08
	movs r0, #0xe
	ldrsb r0, [r5, r0]
	bl GetROMChapterStruct
	ldrh r0, [r0, #0x28]
	movs r1, #0
	bl Sound_PlaySong80024D4
_08020D08:
	adds r3, r6, #0
	adds r3, #0x4c
	strh r4, [r3]
	ldr r2, _08020D38  @ gLCDControlBuffer
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
	adds r4, r3, #0
	b _08020D6C
	.align 2, 0
_08020D30: .4byte gRAMChapterData
_08020D34: .4byte 0x0000FFFF
_08020D38: .4byte gLCDControlBuffer
_08020D3C:
	bl EnablePaletteSync
	adds r0, r6, #0
	adds r0, #0x4c
	movs r1, #0
	ldrsh r2, [r0, r1]
	adds r1, r2, #7
	adds r4, r0, #0
	cmp r1, #0
	bge _08020D52
	adds r1, #7
_08020D52:
	asrs r0, r1, #3
	adds r1, r0, #0
	adds r1, #0xc
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	movs r2, #4
	subs r2, r2, r0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	movs r0, #1
	movs r3, #0
	bl SetSpecialColorEffectsParameters
_08020D6C:
	ldrh r0, [r4]
	subs r0, #1
	strh r0, [r4]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x18
	bne _08020D9C
	ldr r5, _08020DB4  @ gRAMChapterData
	movs r0, #0xe
	ldrsb r0, [r5, r0]
	bl GetROMChapterStruct
	ldrh r1, [r0, #0x28]
	ldr r0, _08020DB8  @ 0x0000FFFF
	cmp r1, r0
	beq _08020D9C
	movs r0, #0xe
	ldrsb r0, [r5, r0]
	bl GetROMChapterStruct
	ldrh r0, [r0, #0x28]
	movs r1, #0
	bl Sound_PlaySong80024D4
_08020D9C:
	movs r1, #0
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bge _08020DAE
	bl ResetMapPaletteAnimations
	adds r0, r6, #0
	bl Proc_Break
_08020DAE:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08020DB4: .4byte gRAMChapterData
_08020DB8: .4byte 0x0000FFFF

	THUMB_FUNC_END sub_8020CA4

	THUMB_FUNC_START sub_8020DBC
sub_8020DBC: @ 0x08020DBC
	adds r0, #0x4c
	movs r1, #0
	strh r1, [r0]
	ldr r2, _08020DE4  @ gLCDControlBuffer
	adds r2, #0x36
	ldrb r0, [r2]
	movs r1, #1
	orrs r0, r1
	movs r1, #2
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x11
	negs r1, r1
	ands r0, r1
	strb r0, [r2]
	bx lr
	.align 2, 0
_08020DE4: .4byte gLCDControlBuffer

	THUMB_FUNC_END sub_8020DBC

	THUMB_FUNC_START sub_8020DE8
sub_8020DE8: @ 0x08020DE8
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	adds r4, r5, #0
	adds r4, #0x4c
	movs r0, #0
	ldrsh r3, [r4, r0]
	movs r0, #0x28
	str r0, [sp]
	movs r0, #5
	movs r1, #0
	movs r2, #0x78
	bl sub_8012DCC
	ldr r3, _08020E44  @ gLCDControlBuffer
	movs r1, #0x78
	subs r1, r1, r0
	movs r2, #0x2d
	adds r2, r2, r3
	mov ip, r2
	movs r2, #0
	mov r6, ip
	strb r1, [r6]
	adds r1, r3, #0
	adds r1, #0x31
	strb r2, [r1]
	adds r0, #0x78
	subs r1, #5
	strb r0, [r1]
	adds r1, #4
	movs r0, #0xa0
	strb r0, [r1]
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x28
	ble _08020E3C
	adds r0, r5, #0
	bl Proc_Break
_08020E3C:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08020E44: .4byte gLCDControlBuffer

	THUMB_FUNC_END sub_8020DE8

	THUMB_FUNC_START sub_8020E48
sub_8020E48: @ 0x08020E48
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	movs r0, #4
	bl Sound_FadeOutBGM
	bl sub_8001710
	ldr r6, _08020EA8  @ gPaletteBuffer
	movs r4, #2
	negs r4, r4
	adds r0, r6, #0
	movs r1, #0
	movs r2, #3
	adds r3, r4, #0
	bl sub_800172C
	adds r0, r6, #0
	adds r0, #0x80
	movs r1, #4
	movs r2, #2
	adds r3, r4, #0
	bl sub_800172C
	movs r1, #0xe0
	lsls r1, r1, #1
	adds r0, r6, r1
	movs r1, #0xe
	movs r2, #2
	adds r3, r4, #0
	bl sub_800172C
	movs r1, #0x90
	lsls r1, r1, #2
	adds r0, r6, r1
	movs r1, #0x12
	movs r2, #1
	adds r3, r4, #0
	bl sub_800172C
	adds r5, #0x4c
	movs r0, #0xf
	strh r0, [r5]
	movs r0, #1
	bl Sound_FadeOutSE
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08020EA8: .4byte gPaletteBuffer

	THUMB_FUNC_END sub_8020E48

	THUMB_FUNC_START sub_8020EAC
sub_8020EAC: @ 0x08020EAC
	push {r4, lr}
	adds r4, r0, #0
	bl sub_80D74B0
	bl EnablePaletteSync
	adds r1, r4, #0
	adds r1, #0x4c
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _08020EF4
	ldr r2, _08020EFC  @ gLCDControlBuffer
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
	movs r0, #2
	movs r1, #0
	bl SetBackgroundTileDataOffset
	adds r0, r4, #0
	bl Proc_Break
_08020EF4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08020EFC: .4byte gLCDControlBuffer

	THUMB_FUNC_END sub_8020EAC

	THUMB_FUNC_START sub_8020F00
sub_8020F00: @ 0x08020F00
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r2, _08020FCC  @ gLCDControlBuffer
	ldrb r1, [r2]
	movs r0, #8
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	movs r0, #0
	str r0, [sp]
	movs r1, #0xc0
	lsls r1, r1, #0x13
	ldr r2, _08020FD0  @ 0x01000008
	mov r0, sp
	bl CpuFastSet
	ldr r0, _08020FD4  @ gBG0TilemapBuffer
	movs r1, #0
	bl BG_Fill
	ldr r0, _08020FD8  @ gBG1TilemapBuffer
	movs r1, #0
	bl BG_Fill
	ldr r0, _08020FDC  @ gBG2TilemapBuffer
	movs r1, #0
	bl BG_Fill
	movs r0, #7
	bl BG_EnableSyncByMask
	ldr r0, _08020FE0  @ gUnknown_0859B0E0
	bl Proc_EndEach
	ldr r0, _08020FE4  @ gUnknown_0859B108
	bl Proc_EndEach
	ldr r0, _08020FE8  @ gUnknown_0859B160
	bl Proc_EndEach
	bl sub_8001710
	ldr r5, _08020FEC  @ gUnknown_02022968
	adds r0, r5, #0
	movs r1, #6
	movs r2, #0xa
	movs r3, #2
	bl sub_800172C
	movs r1, #0xa0
	lsls r1, r1, #2
	adds r0, r5, r1
	movs r1, #0x1a
	movs r2, #6
	movs r3, #2
	bl sub_800172C
	movs r1, #0xa0
	lsls r1, r1, #1
	adds r0, r5, r1
	movs r1, #0x10
	movs r2, #2
	movs r3, #2
	bl sub_800172C
	movs r1, #0x88
	lsls r1, r1, #2
	adds r0, r5, r1
	movs r1, #0x17
	movs r2, #1
	movs r3, #2
	bl sub_800172C
	bl sub_80D74B0
	bl EnablePaletteSync
	adds r4, #0x4c
	movs r0, #0xe
	strh r0, [r4]
	ldr r4, _08020FF0  @ gRAMChapterData
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	bl GetROMChapterStruct
	ldrh r1, [r0, #0x28]
	ldr r0, _08020FF4  @ 0x0000FFFF
	cmp r1, r0
	beq _08020FC4
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	bl GetROMChapterStruct
	ldrh r0, [r0, #0x28]
	movs r1, #0
	bl Sound_PlaySong80024D4
_08020FC4:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08020FCC: .4byte gLCDControlBuffer
_08020FD0: .4byte 0x01000008
_08020FD4: .4byte gBG0TilemapBuffer
_08020FD8: .4byte gBG1TilemapBuffer
_08020FDC: .4byte gBG2TilemapBuffer
_08020FE0: .4byte gUnknown_0859B0E0
_08020FE4: .4byte gUnknown_0859B108
_08020FE8: .4byte gUnknown_0859B160
_08020FEC: .4byte gUnknown_02022968
_08020FF0: .4byte gRAMChapterData
_08020FF4: .4byte 0x0000FFFF

	THUMB_FUNC_END sub_8020F00

	THUMB_FUNC_START sub_8020FF8
sub_8020FF8: @ 0x08020FF8
	push {r4, r5, lr}
	adds r4, r0, #0
	bl sub_80D74B0
	ldr r5, _08021054  @ gRAMChapterData
	movs r0, #0xe
	ldrsb r0, [r5, r0]
	bl GetROMChapterStruct
	ldrb r0, [r0, #0x12]
	cmp r0, #5
	bne _08021014
	bl WfxFlamesInitGradientPublic
_08021014:
	bl GetChapterThing
	cmp r0, #2
	beq _0802102C
	movs r0, #0xe
	ldrsb r0, [r5, r0]
	bl GetROMChapterStruct
	adds r0, #0x87
	ldrb r0, [r0]
	cmp r0, #0
	beq _0802105C
_0802102C:
	adds r3, r4, #0
	adds r3, #0x4c
	movs r0, #0
	strh r0, [r3]
	ldr r2, _08021058  @ gLCDControlBuffer
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
	b _08021064
	.align 2, 0
_08021054: .4byte gRAMChapterData
_08021058: .4byte gLCDControlBuffer
_0802105C:
	bl EnablePaletteSync
	adds r3, r4, #0
	adds r3, #0x4c
_08021064:
	ldrh r0, [r3]
	subs r0, #1
	strh r0, [r3]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _0802107A
	bl ResetMapPaletteAnimations
	adds r0, r4, #0
	bl Proc_Break
_0802107A:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8020FF8

	THUMB_FUNC_START sub_8021080
sub_8021080: @ 0x08021080
	adds r1, #0x50
	strh r0, [r1]
	bx lr

	THUMB_FUNC_END sub_8021080

	THUMB_FUNC_START sub_8021088
sub_8021088: @ 0x08021088
	adds r1, #0x4c
	strh r0, [r1]
	bx lr

	THUMB_FUNC_END sub_8021088

	THUMB_FUNC_START sub_8021090
sub_8021090: @ 0x08021090
	push {lr}
	adds r3, r0, #0
	adds r0, #0x52
	ldrh r0, [r0]
	cmp r0, #0
	beq _080210A4
	adds r0, r3, #0
	bl Proc_Break
	b _080210BA
_080210A4:
	adds r0, r3, #0
	adds r0, #0x4c
	ldrh r1, [r0]
	subs r2, r1, #1
	strh r2, [r0]
	lsls r1, r1, #0x10
	cmp r1, #0
	bge _080210BA
	adds r0, r3, #0
	bl Proc_Break
_080210BA:
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8021090

	THUMB_FUNC_START sub_80210C0
sub_80210C0: @ 0x080210C0
	adds r0, #0x52
	movs r1, #2
	strh r1, [r0]
	bx lr

	THUMB_FUNC_END sub_80210C0

	THUMB_FUNC_START sub_80210C8
sub_80210C8: @ 0x080210C8
	push {r4, r5, r6, lr}
	mov r6, r9
	mov r5, r8
	push {r5, r6}
	ldr r4, _0802117C  @ gLCDControlBuffer
	ldrb r1, [r4, #0xc]
	movs r5, #4
	negs r5, r5
	adds r0, r5, #0
	ands r0, r1
	strb r0, [r4, #0xc]
	ldrb r1, [r4, #0x10]
	adds r0, r5, #0
	ands r0, r1
	movs r1, #1
	mov r9, r1
	mov r1, r9
	orrs r0, r1
	strb r0, [r4, #0x10]
	ldrb r1, [r4, #0x14]
	adds r0, r5, #0
	ands r0, r1
	movs r1, #2
	mov r8, r1
	mov r1, r8
	orrs r0, r1
	strb r0, [r4, #0x14]
	ldrb r0, [r4, #0x18]
	movs r6, #3
	orrs r0, r6
	strb r0, [r4, #0x18]
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
	ldr r0, _08021180  @ gBG0TilemapBuffer
	movs r1, #0
	bl BG_Fill
	movs r0, #1
	bl BG_EnableSyncByMask
	ldrb r1, [r4, #0xc]
	adds r0, r5, #0
	ands r0, r1
	strb r0, [r4, #0xc]
	ldrb r1, [r4, #0x10]
	adds r0, r5, #0
	ands r0, r1
	mov r1, r9
	orrs r0, r1
	strb r0, [r4, #0x10]
	ldrb r0, [r4, #0x14]
	ands r5, r0
	mov r0, r8
	orrs r5, r0
	strb r5, [r4, #0x14]
	ldrb r0, [r4, #0x18]
	orrs r0, r6
	strb r0, [r4, #0x18]
	bl GetChapterThing
	cmp r0, #2
	beq _08021168
	ldr r0, _08021184  @ gRAMChapterData
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetROMChapterStruct
	adds r0, #0x87
	ldrb r0, [r0]
	cmp r0, #0
	beq _08021170
_08021168:
	bl RefreshBMapGraphics
	bl sub_80141B0
_08021170:
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802117C: .4byte gLCDControlBuffer
_08021180: .4byte gBG0TilemapBuffer
_08021184: .4byte gRAMChapterData

	THUMB_FUNC_END sub_80210C8

	THUMB_FUNC_START sub_8021188
sub_8021188: @ 0x08021188
	push {r4, lr}
	adds r4, r0, #0
	bl GetGameClock
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	bne _080211BC
	bl sub_80D74B0
	ldr r0, _080211C4  @ gRAMChapterData
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetROMChapterStruct
	ldrb r0, [r0, #0x12]
	cmp r0, #5
	bne _080211B2
	bl WfxFlamesInitGradientPublic
_080211B2:
	bl ResetMapPaletteAnimations
	adds r0, r4, #0
	bl Proc_Break
_080211BC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080211C4: .4byte gRAMChapterData

	THUMB_FUNC_END sub_8021188

.align 2, 0 @ align with 0
