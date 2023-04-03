	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	THUMB_FUNC_START sub_80560D8
sub_80560D8: @ 0x080560D8
	push {lr}
	ldr r0, _080560EC  @ gProc_ekrbattleendin
	movs r1, #3
	bl Proc_Start
	movs r1, #0
	strh r1, [r0, #0x2c]
	pop {r0}
	bx r0
	.align 2, 0
_080560EC: .4byte gProc_ekrbattleendin

	THUMB_FUNC_END sub_80560D8

	THUMB_FUNC_START ekrBattleEnding_80560F0
ekrBattleEnding_80560F0: @ 0x080560F0
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r0, _08056114  @ gUnknown_0203E0FE
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _0805610C
	bl sub_806FAB0
	cmp r0, #1
	bcc _08056118
	cmp r0, #2
	bhi _08056118
_0805610C:
	adds r0, r5, #0
	bl Proc_Break
	b _08056160
	.align 2, 0
_08056114: .4byte gUnknown_0203E0FE
_08056118:
	movs r0, #0x2c
	ldrsh r3, [r5, r0]
	movs r0, #8
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0x10
	bl Interpolate
	adds r4, r0, #0
	ldr r0, _08056168  @ gUnknown_0203E0FE
	movs r1, #0
	ldrsh r0, [r0, r1]
	subs r0, #1
	bl sub_8075AB4
	ldr r0, _0805616C  @ gPaletteBuffer
	movs r1, #6
	movs r2, #0xa
	adds r3, r4, #0
	bl sub_80712B0
	bl EnablePaletteSync
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #9
	bne _08056160
	movs r0, #0
	strh r0, [r5, #0x2c]
	adds r0, r5, #0
	bl Proc_Break
_08056160:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08056168: .4byte gUnknown_0203E0FE
_0805616C: .4byte gPaletteBuffer

	THUMB_FUNC_END ekrBattleEnding_80560F0

	THUMB_FUNC_START ekrBattleEnding_8056170
ekrBattleEnding_8056170: @ 0x08056170
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08056194  @ gUnknown_0203E0FE
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _0805618A
	bl sub_806FAB0
	cmp r0, #1
	bcc _08056198
	cmp r0, #2
	bhi _08056198
_0805618A:
	adds r0, r4, #0
	bl Proc_Break
	b _080561BE
	.align 2, 0
_08056194: .4byte gUnknown_0203E0FE
_08056198:
	ldr r0, _080561C4  @ gPlaySt
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl UnpackChapterMapGraphics
	movs r0, #0x10
	bl sub_807168C
	bl RenderBmMap
	movs r0, #3
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	adds r0, r4, #0
	bl Proc_Break
_080561BE:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080561C4: .4byte gPlaySt

	THUMB_FUNC_END ekrBattleEnding_8056170

	THUMB_FUNC_START ekrBattleEnding_80561C8
ekrBattleEnding_80561C8: @ 0x080561C8
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, _080561EC  @ gUnknown_0203E0FE
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _080561E4
	bl sub_806FAB0
	cmp r0, #1
	bcc _080561F0
	cmp r0, #2
	bhi _080561F0
_080561E4:
	adds r0, r4, #0
	bl Proc_Break
	b _0805621E
	.align 2, 0
_080561EC: .4byte gUnknown_0203E0FE
_080561F0:
	movs r0, #0x2c
	ldrsh r3, [r4, r0]
	movs r0, #8
	str r0, [sp]
	movs r0, #0
	movs r1, #0x10
	movs r2, #4
	bl Interpolate
	bl sub_807168C
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #9
	bne _0805621E
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r4, #0
	bl Proc_Break
_0805621E:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END ekrBattleEnding_80561C8

	THUMB_FUNC_START ekrBattleEnding_8056228
ekrBattleEnding_8056228: @ 0x08056228
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0
	strh r0, [r4, #0x2c]
	ldr r2, _08056284  @ gUnknown_0203E122
	movs r1, #0
	ldrsh r0, [r2, r1]
	movs r3, #4
	ldrsh r1, [r2, r3]
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, #8
	strh r0, [r4, #0x34]
	strh r0, [r4, #0x32]
	movs r1, #2
	ldrsh r0, [r2, r1]
	movs r3, #6
	ldrsh r1, [r2, r3]
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, #8
	strh r0, [r4, #0x3c]
	strh r0, [r4, #0x3a]
	bl AnimClearAll
	movs r0, #1
	bl sub_8056900
	movs r0, #1
	bl sub_805649C
	movs r0, #1
	movs r1, #0xb
	bl NewEkrWindowAppear
	movs r0, #1
	movs r1, #0xb
	bl sub_8056F20
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08056284: .4byte gUnknown_0203E122

	THUMB_FUNC_END ekrBattleEnding_8056228

	THUMB_FUNC_START ekrBattleEnding_8056288
ekrBattleEnding_8056288: @ 0x08056288
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	movs r5, #0
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xc
	ble _08056304
	bl EndEkrGauge
	adds r0, r4, #0
	bl Proc_Break
	bl InitBmBgLayers
	ldr r0, _0805630C  @ gLCDControlBuffer
	mov ip, r0
	ldrb r0, [r0, #1]
	movs r1, #0x20
	orrs r0, r1
	movs r1, #0x41
	negs r1, r1
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	mov r1, ip
	strb r0, [r1, #1]
	mov r0, ip
	adds r0, #0x2d
	strb r5, [r0]
	adds r0, #4
	strb r5, [r0]
	subs r0, #5
	strb r5, [r0]
	adds r0, #4
	strb r5, [r0]
	mov r2, ip
	adds r2, #0x34
	ldrb r0, [r2]
	movs r6, #1
	orrs r0, r6
	movs r5, #2
	orrs r0, r5
	movs r4, #4
	orrs r0, r4
	movs r3, #8
	orrs r0, r3
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2]
	adds r2, #2
	ldrb r0, [r2]
	orrs r0, r6
	orrs r0, r5
	orrs r0, r4
	orrs r0, r3
	movs r1, #0x11
	negs r1, r1
	ands r0, r1
	strb r0, [r2]
_08056304:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0805630C: .4byte gLCDControlBuffer

	THUMB_FUNC_END ekrBattleEnding_8056288

	THUMB_FUNC_START ekrBattleEnding_8056310
ekrBattleEnding_8056310: @ 0x08056310
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	movs r4, #0
	strh r4, [r5, #0x2c]
	movs r0, #0xf
	strh r0, [r5, #0x2e]
	bl ResetUnitSprites
	bl BMapDispResume_FromBattleDelayed
	bl RefreshUnitSprites
	bl ForceSyncUnitSpriteSheet
	bl SetupMapSpritesPalettes
	movs r0, #3
	movs r1, #0
	movs r2, #0
	movs r3, #4
	bl SetSpecialColorEffectsParameters
	str r4, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #1
	bl SetBlendTargetA
	ldr r2, _0805638C  @ gLCDControlBuffer
	adds r3, r2, #0
	adds r3, #0x34
	ldrb r1, [r3]
	movs r0, #0x21
	negs r0, r0
	ands r0, r1
	strb r0, [r3]
	adds r2, #0x36
	ldrb r0, [r2]
	movs r1, #0x20
	orrs r0, r1
	strb r0, [r2]
	bl sub_805B028
	cmp r0, #1
	beq _08056372
	bl UnpackChapterMapPalette
_08056372:
	bl sub_804FD54
	cmp r0, #1
	bne _0805637E
	bl sub_8049788
_0805637E:
	adds r0, r5, #0
	bl Proc_Break
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805638C: .4byte gLCDControlBuffer

	THUMB_FUNC_END ekrBattleEnding_8056310

	THUMB_FUNC_START ekrBattleEnding_8056390
ekrBattleEnding_8056390: @ 0x08056390
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	sub sp, #8
	adds r7, r0, #0
	ldrh r2, [r7, #0x2c]
	movs r0, #0x2c
	ldrsh r1, [r7, r0]
	movs r3, #0x2e
	ldrsh r0, [r7, r3]
	cmp r1, r0
	beq _080563AE
	adds r0, r2, #1
	strh r0, [r7, #0x2c]
_080563AE:
	movs r0, #0x32
	ldrsh r1, [r7, r0]
	movs r2, #0x2c
	ldrsh r3, [r7, r2]
	movs r2, #0x2e
	ldrsh r0, [r7, r2]
	str r0, [sp]
	movs r0, #0
	movs r2, #0
	bl Interpolate
	adds r6, r0, #0
	movs r3, #0x3a
	ldrsh r1, [r7, r3]
	movs r0, #0x2c
	ldrsh r3, [r7, r0]
	movs r2, #0x2e
	ldrsh r0, [r7, r2]
	str r0, [sp]
	movs r0, #0
	movs r2, #0
	bl Interpolate
	adds r5, r0, #0
	movs r3, #0x34
	ldrsh r1, [r7, r3]
	movs r0, #0x2c
	ldrsh r3, [r7, r0]
	movs r2, #0x2e
	ldrsh r0, [r7, r2]
	str r0, [sp]
	movs r0, #0
	movs r2, #0xf0
	bl Interpolate
	adds r4, r0, #0
	movs r3, #0x3c
	ldrsh r1, [r7, r3]
	movs r0, #0x2c
	ldrsh r3, [r7, r0]
	movs r2, #0x2e
	ldrsh r0, [r7, r2]
	str r0, [sp]
	movs r0, #0
	movs r2, #0xa0
	bl Interpolate
	ldr r1, _08056478  @ gLCDControlBuffer
	movs r3, #0x2d
	adds r3, r3, r1
	mov r9, r3
	movs r2, #0
	mov r8, r2
	strb r6, [r3]
	adds r6, r1, #0
	adds r6, #0x31
	strb r5, [r6]
	adds r5, r1, #0
	adds r5, #0x2c
	strb r4, [r5]
	adds r4, r1, #0
	adds r4, #0x30
	strb r0, [r4]
	str r2, [sp, #4]
	ldr r1, _0805647C  @ gBG2TilemapBuffer
	ldr r2, _08056480  @ 0x01000200
	add r0, sp, #4
	bl CpuFastSet
	movs r0, #4
	bl BG_EnableSyncByMask
	movs r3, #0x2c
	ldrsh r1, [r7, r3]
	movs r2, #0x2e
	ldrsh r0, [r7, r2]
	cmp r1, r0
	bne _08056468
	movs r0, #0
	mov r3, r8
	strh r3, [r7, #0x2c]
	mov r1, r9
	strb r0, [r1]
	strb r0, [r6]
	movs r0, #0xf0
	strb r0, [r5]
	movs r0, #0xa0
	strb r0, [r4]
	bl EnablePaletteSync
	adds r0, r7, #0
	bl Proc_Break
_08056468:
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08056478: .4byte gLCDControlBuffer
_0805647C: .4byte gBG2TilemapBuffer
_08056480: .4byte 0x01000200

	THUMB_FUNC_END ekrBattleEnding_8056390

	THUMB_FUNC_START ekrBattleEnding_8056484
ekrBattleEnding_8056484: @ 0x08056484
	push {r4, lr}
	adds r4, r0, #0
	bl EndEkrBattleDeamon
	bl RefreshBMapDisplay_FromBattle
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END ekrBattleEnding_8056484

	THUMB_FUNC_START sub_805649C
sub_805649C: @ 0x0805649C
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r7, r0, #0
	movs r0, #0
	movs r1, #0xa
	movs r2, #6
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	movs r4, #0
	str r4, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl SetBlendTargetA
	str r4, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #1
	movs r3, #1
	bl SetBlendTargetB
	ldr r1, _080564F8  @ gLCDControlBuffer
	adds r1, #0x3d
	ldrb r0, [r1]
	movs r2, #0x20
	orrs r0, r2
	strb r0, [r1]
	ldr r0, _080564FC  @ gUnknown_0203E122
	movs r1, #0
	ldrsh r3, [r0, r1]
	movs r4, #4
	ldrsh r2, [r0, r4]
	cmp r3, r2
	bne _08056500
	movs r2, #2
	ldrsh r1, [r0, r2]
	movs r3, #6
	ldrsh r0, [r0, r3]
	movs r4, #2
	cmp r1, r0
	blt _0805652C
	movs r4, #6
	b _0805652C
	.align 2, 0
_080564F8: .4byte gLCDControlBuffer
_080564FC: .4byte gUnknown_0203E122
_08056500:
	movs r4, #2
	ldrsh r1, [r0, r4]
	movs r4, #6
	ldrsh r0, [r0, r4]
	cmp r1, r0
	bne _08056516
	movs r4, #4
	cmp r3, r2
	bge _0805652C
	movs r4, #0
	b _0805652C
_08056516:
	cmp r3, r2
	bge _08056524
	movs r4, #1
	cmp r1, r0
	blt _0805652C
	movs r4, #7
	b _0805652C
_08056524:
	movs r4, #3
	cmp r1, r0
	blt _0805652C
	movs r4, #5
_0805652C:
	ldr r0, _08056540  @ gUnknown_0203E120
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #3
	bgt _08056544
	cmp r0, #1
	bge _08056550
	cmp r0, #0
	beq _08056548
	b _08056550
	.align 2, 0
_08056540: .4byte gUnknown_0203E120
_08056544:
	cmp r0, #4
	bne _08056550
_08056548:
	ldr r0, _0805654C  @ gUnknown_085B9B84
	b _08056552
	.align 2, 0
_0805654C: .4byte gUnknown_085B9B84
_08056550:
	ldr r0, _08056584  @ gUnknown_085B9BA4
_08056552:
	lsls r1, r4, #2
	adds r0, r1, r0
	ldr r0, [r0]
	adds r6, r1, #0
	ldr r1, _08056588  @ 0x06010000
	bl LZ77UnCompVram
	ldr r0, _0805658C  @ gUnknown_080DC85C
	ldr r1, _08056590  @ gUnknown_02022B28
	movs r2, #1
	bl CpuFastSet
	bl EnablePaletteSync
	ldr r0, _08056594  @ gUnknown_0203E120
	movs r2, #0
	ldrsh r0, [r0, r2]
	cmp r0, #4
	bls _0805657A
	b _08056856
_0805657A:
	lsls r0, r0, #2
	ldr r1, _08056598  @ _0805659C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08056584: .4byte gUnknown_085B9BA4
_08056588: .4byte 0x06010000
_0805658C: .4byte gUnknown_080DC85C
_08056590: .4byte gUnknown_02022B28
_08056594: .4byte gUnknown_0203E120
_08056598: .4byte _0805659C
_0805659C: @ jump table
	.4byte _080565B0 @ case 0
	.4byte _08056650 @ case 1
	.4byte _08056650 @ case 2
	.4byte _080567BC @ case 3
	.4byte _080565B0 @ case 4
_080565B0:
	ldr r0, _08056600  @ gProc_EkrBaseKaiten
	movs r1, #3
	bl Proc_Start
	adds r5, r0, #0
	str r7, [r5, #0x44]
	adds r1, r5, #0
	adds r1, #0x29
	movs r0, #0
	strb r0, [r1]
	strh r0, [r5, #0x2c]
	movs r0, #0xb
	strh r0, [r5, #0x2e]
	ldr r2, _08056604  @ gUnknown_0203E122
	movs r3, #0
	ldrsh r0, [r2, r3]
	movs r4, #4
	ldrsh r1, [r2, r4]
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, #8
	strh r0, [r5, #0x32]
	movs r1, #2
	ldrsh r0, [r2, r1]
	movs r3, #6
	ldrsh r1, [r2, r3]
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, #8
	strh r0, [r5, #0x3a]
	movs r0, #0x78
	strh r0, [r5, #0x34]
	movs r0, #0x68
	strh r0, [r5, #0x3c]
	ldr r0, [r5, #0x44]
	cmp r0, #0
	bne _0805660C
	ldr r0, _08056608  @ gUnknown_085B9BC4
	b _0805660E
	.align 2, 0
_08056600: .4byte gProc_EkrBaseKaiten
_08056604: .4byte gUnknown_0203E122
_08056608: .4byte gUnknown_085B9BC4
_0805660C:
	ldr r0, _0805663C  @ gUnknown_085B9C24
_0805660E:
	adds r0, r6, r0
	ldr r0, [r0]
	movs r1, #0x64
	bl AnimCreate
	adds r2, r0, #0
	str r2, [r5, #0x5c]
	movs r0, #0x90
	lsls r0, r0, #7
	strh r0, [r2, #8]
	ldr r0, [r2, #0x1c]
	movs r1, #0x80
	lsls r1, r1, #3
	orrs r0, r1
	str r0, [r2, #0x1c]
	ldr r0, [r5, #0x44]
	cmp r0, #0
	bne _08056640
	ldrh r0, [r5, #0x32]
	strh r0, [r2, #2]
	ldrh r0, [r5, #0x3a]
	b _08056646
	.align 2, 0
_0805663C: .4byte gUnknown_085B9C24
_08056640:
	ldrh r0, [r5, #0x34]
	strh r0, [r2, #2]
	ldrh r0, [r5, #0x3c]
_08056646:
	strh r0, [r2, #4]
	ldr r0, _0805664C  @ gUnknown_085B9C84
	b _0805684A
	.align 2, 0
_0805664C: .4byte gUnknown_085B9C84
_08056650:
	ldr r0, _080566AC  @ gProc_EkrBaseKaiten
	movs r1, #3
	bl Proc_Start
	adds r5, r0, #0
	str r7, [r5, #0x44]
	adds r1, r5, #0
	adds r1, #0x29
	movs r0, #0
	strb r0, [r1]
	strh r0, [r5, #0x2c]
	movs r0, #0xb
	strh r0, [r5, #0x2e]
	ldr r1, _080566B0  @ gUnknown_0203E122
	movs r4, #0
	ldrsh r0, [r1, r4]
	lsls r0, r0, #4
	adds r0, #8
	strh r0, [r5, #0x32]
	movs r2, #2
	ldrsh r0, [r1, r2]
	lsls r0, r0, #4
	adds r0, #8
	strh r0, [r5, #0x3a]
	movs r2, #0x48
	strh r2, [r5, #0x34]
	movs r0, #0x68
	strh r0, [r5, #0x3c]
	ldr r0, _080566B4  @ gUnknown_02017744
	ldr r0, [r0]
	cmp r0, #1
	bne _080566A2
	ldr r1, _080566B8  @ gUnknown_080DAF28
	ldr r0, _080566BC  @ gUnknown_0203E120
	movs r3, #0
	ldrsh r0, [r0, r3]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	subs r0, r2, r0
	strh r0, [r5, #0x34]
_080566A2:
	ldr r0, [r5, #0x44]
	cmp r0, #0
	bne _080566C4
	ldr r0, _080566C0  @ gUnknown_085B9BE4
	b _080566C6
	.align 2, 0
_080566AC: .4byte gProc_EkrBaseKaiten
_080566B0: .4byte gUnknown_0203E122
_080566B4: .4byte gUnknown_02017744
_080566B8: .4byte gUnknown_080DAF28
_080566BC: .4byte gUnknown_0203E120
_080566C0: .4byte gUnknown_085B9BE4
_080566C4:
	ldr r0, _080566F4  @ gUnknown_085B9C44
_080566C6:
	adds r0, r6, r0
	ldr r0, [r0]
	movs r1, #0x64
	bl AnimCreate
	adds r2, r0, #0
	str r2, [r5, #0x5c]
	movs r0, #0x90
	lsls r0, r0, #7
	strh r0, [r2, #8]
	ldr r0, [r2, #0x1c]
	movs r1, #0x80
	lsls r1, r1, #3
	orrs r0, r1
	str r0, [r2, #0x1c]
	ldr r0, [r5, #0x44]
	cmp r0, #0
	bne _080566F8
	ldrh r0, [r5, #0x32]
	strh r0, [r2, #2]
	ldrh r0, [r5, #0x3a]
	b _080566FE
	.align 2, 0
_080566F4: .4byte gUnknown_085B9C44
_080566F8:
	ldrh r0, [r5, #0x34]
	strh r0, [r2, #2]
	ldrh r0, [r5, #0x3c]
_080566FE:
	strh r0, [r2, #4]
	ldr r0, _0805676C  @ gUnknown_085B9CA4
	adds r0, r6, r0
	ldr r0, [r0]
	str r0, [r5, #0x60]
	movs r4, #0
	strh r4, [r5, #0x3e]
	strh r4, [r5, #0x36]
	ldr r0, _08056770  @ gProc_EkrBaseKaiten
	movs r1, #3
	bl Proc_Start
	adds r5, r0, #0
	str r7, [r5, #0x44]
	adds r1, r5, #0
	adds r1, #0x29
	movs r0, #1
	strb r0, [r1]
	strh r4, [r5, #0x2c]
	movs r0, #0xb
	strh r0, [r5, #0x2e]
	ldr r1, _08056774  @ gUnknown_0203E122
	movs r4, #4
	ldrsh r0, [r1, r4]
	lsls r0, r0, #4
	adds r0, #8
	strh r0, [r5, #0x32]
	movs r2, #6
	ldrsh r0, [r1, r2]
	lsls r0, r0, #4
	adds r0, #8
	strh r0, [r5, #0x3a]
	movs r0, #0xa8
	strh r0, [r5, #0x34]
	movs r0, #0x68
	strh r0, [r5, #0x3c]
	ldr r0, _08056778  @ gUnknown_02017744
	ldr r0, [r0]
	cmp r0, #0
	bne _08056760
	ldr r1, _0805677C  @ gUnknown_080DAF28
	ldr r0, _08056780  @ gUnknown_0203E120
	movs r3, #0
	ldrsh r0, [r0, r3]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	adds r0, #0xa8
	strh r0, [r5, #0x34]
_08056760:
	ldr r0, [r5, #0x44]
	cmp r0, #0
	bne _08056788
	ldr r0, _08056784  @ gUnknown_085B9C04
	b _0805678A
	.align 2, 0
_0805676C: .4byte gUnknown_085B9CA4
_08056770: .4byte gProc_EkrBaseKaiten
_08056774: .4byte gUnknown_0203E122
_08056778: .4byte gUnknown_02017744
_0805677C: .4byte gUnknown_080DAF28
_08056780: .4byte gUnknown_0203E120
_08056784: .4byte gUnknown_085B9C04
_08056788:
	ldr r0, _080567B8  @ gUnknown_085B9C64
_0805678A:
	adds r0, r6, r0
	ldr r0, [r0]
	movs r1, #0x64
	bl AnimCreate
	adds r2, r0, #0
	str r2, [r5, #0x5c]
	movs r0, #0x90
	lsls r0, r0, #7
	strh r0, [r2, #8]
	ldr r0, [r2, #0x1c]
	movs r1, #0x80
	lsls r1, r1, #3
	orrs r0, r1
	str r0, [r2, #0x1c]
	ldr r0, [r5, #0x44]
	cmp r0, #0
	bne _08056840
	ldrh r0, [r5, #0x32]
	strh r0, [r2, #2]
	ldrh r0, [r5, #0x3a]
	b _08056846
	.align 2, 0
_080567B8: .4byte gUnknown_085B9C64
_080567BC:
	ldr r0, _08056800  @ gProc_EkrBaseKaiten
	movs r1, #3
	bl Proc_Start
	adds r5, r0, #0
	str r7, [r5, #0x44]
	adds r1, r5, #0
	adds r1, #0x29
	movs r0, #0
	strb r0, [r1]
	strh r0, [r5, #0x2c]
	movs r0, #0xb
	strh r0, [r5, #0x2e]
	ldr r1, _08056804  @ gUnknown_0203E122
	movs r4, #4
	ldrsh r0, [r1, r4]
	lsls r0, r0, #4
	adds r0, #8
	strh r0, [r5, #0x32]
	movs r2, #6
	ldrsh r0, [r1, r2]
	lsls r0, r0, #4
	adds r0, #8
	strh r0, [r5, #0x3a]
	movs r0, #0x78
	strh r0, [r5, #0x34]
	movs r0, #0x68
	strh r0, [r5, #0x3c]
	ldr r0, [r5, #0x44]
	cmp r0, #0
	bne _0805680C
	ldr r0, _08056808  @ gUnknown_085B9C04
	b _0805680E
	.align 2, 0
_08056800: .4byte gProc_EkrBaseKaiten
_08056804: .4byte gUnknown_0203E122
_08056808: .4byte gUnknown_085B9C04
_0805680C:
	ldr r0, _0805683C  @ gUnknown_085B9C64
_0805680E:
	adds r0, r6, r0
	ldr r0, [r0]
	movs r1, #0x64
	bl AnimCreate
	adds r2, r0, #0
	str r2, [r5, #0x5c]
	movs r0, #0x90
	lsls r0, r0, #7
	strh r0, [r2, #8]
	ldr r0, [r2, #0x1c]
	movs r1, #0x80
	lsls r1, r1, #3
	orrs r0, r1
	str r0, [r2, #0x1c]
	ldr r0, [r5, #0x44]
	cmp r0, #0
	bne _08056840
	ldrh r0, [r5, #0x32]
	strh r0, [r2, #2]
	ldrh r0, [r5, #0x3a]
	b _08056846
	.align 2, 0
_0805683C: .4byte gUnknown_085B9C64
_08056840:
	ldrh r0, [r5, #0x34]
	strh r0, [r2, #2]
	ldrh r0, [r5, #0x3c]
_08056846:
	strh r0, [r2, #4]
	ldr r0, _08056860  @ gUnknown_085B9CC4
_0805684A:
	adds r0, r6, r0
	ldr r0, [r0]
	str r0, [r5, #0x60]
	movs r0, #0
	strh r0, [r5, #0x3e]
	strh r0, [r5, #0x36]
_08056856:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08056860: .4byte gUnknown_085B9CC4

	THUMB_FUNC_END sub_805649C

.align 2, 0
