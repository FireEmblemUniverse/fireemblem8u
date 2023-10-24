	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	THUMB_FUNC_START SetBanimArenaFlag
SetBanimArenaFlag: @ 0x0805B01C
	ldr r1, _0805B024  @ gBaArenaFlag
	str r0, [r1]
	bx lr
	.align 2, 0
_0805B024: .4byte gBaArenaFlag

	THUMB_FUNC_END SetBanimArenaFlag

	THUMB_FUNC_START GetBattleAnimArenaFlag
GetBattleAnimArenaFlag: @ 0x0805B028
	ldr r0, _0805B030  @ gBaArenaFlag
	ldr r0, [r0]
	bx lr
	.align 2, 0
_0805B030: .4byte gBaArenaFlag

	THUMB_FUNC_END GetBattleAnimArenaFlag

	THUMB_FUNC_START sub_805B034
sub_805B034: @ 0x0805B034
	push {r4, lr}
	sub sp, #0x10
	asrs r4, r0, #3
	movs r1, #7
	ands r1, r0
	movs r0, #3
	movs r2, #0
	bl BG_SetPosition
	lsls r4, r4, #1
	ldr r0, _0805B074  @ gUnknown_0201D438
	adds r4, r4, r0
	ldr r2, _0805B078  @ gBG3TilemapBuffer
	movs r0, #0x20
	str r0, [sp]
	movs r0, #0x16
	str r0, [sp, #4]
	subs r0, #0x17
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	adds r0, r4, #0
	movs r1, #0x42
	movs r3, #0x20
	bl EfxTmCpyExt
	movs r0, #8
	bl BG_EnableSyncByMask
	add sp, #0x10
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805B074: .4byte gUnknown_0201D438
_0805B078: .4byte gBG3TilemapBuffer

	THUMB_FUNC_END sub_805B034

	THUMB_FUNC_START PlaySound8FForArenaMaybe
PlaySound8FForArenaMaybe: @ 0x0805B07C
	push {lr}
	bl GetBattleAnimArenaFlag
	cmp r0, #0
	beq _0805B090
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #0x8f
	bl EfxPlaySE
_0805B090:
	pop {r0}
	bx r0

	THUMB_FUNC_END PlaySound8FForArenaMaybe

	THUMB_FUNC_START sub_805B094
sub_805B094: @ 0x0805B094
	push {lr}
	bl GetBattleAnimArenaFlag
	cmp r0, #0
	beq _0805B0A4
	movs r0, #0x8e
	bl DoM4aSongNumStop
_0805B0A4:
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_805B094

	THUMB_FUNC_START BeginAnimsOnBattle_Arena
BeginAnimsOnBattle_Arena: @ 0x0805B0A8
	push {lr}
	bl NewEkrBattleDeamon
	bl AnimClearAll
	bl GetBanimInitPosReal
	ldr r1, _0805B0C8  @ gEkrInitPosReal
	str r0, [r1]
	bl NewEkrTogiInitPROC
	movs r0, #0
	bl SetPrimaryHBlankHandler
	pop {r0}
	bx r0
	.align 2, 0
_0805B0C8: .4byte gEkrInitPosReal

	THUMB_FUNC_END BeginAnimsOnBattle_Arena

	THUMB_FUNC_START ExecBattleAnimArenaExit
ExecBattleAnimArenaExit: @ 0x0805B0CC
	push {lr}
	bl AnimClearAll
	bl NewEkrTogiEndPROC
	ldr r0, _0805B0E8  @ MainUpdate_8055C68
	bl SetMainUpdateRoutine
	ldr r0, _0805B0EC  @ ProcScr_efxStatusUnit
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
_0805B0E8: .4byte MainUpdate_8055C68
_0805B0EC: .4byte ProcScr_efxStatusUnit

	THUMB_FUNC_END ExecBattleAnimArenaExit

	THUMB_FUNC_START NewEkrTogiInitPROC
NewEkrTogiInitPROC: @ 0x0805B0F0
	push {lr}
	ldr r0, _0805B100  @ gProc_ekrTogiInit
	movs r1, #3
	bl Proc_Start
	pop {r0}
	bx r0
	.align 2, 0
_0805B100: .4byte gProc_ekrTogiInit

	THUMB_FUNC_END NewEkrTogiInitPROC

	THUMB_FUNC_START sub_805B104
sub_805B104: @ 0x0805B104
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	mov r8, r0
	movs r0, #0
	bl InitOam
	ldr r1, _0805B178  @ gEkrInitPosReal
	ldr r0, _0805B17C  @ gEkrInitialHitSide
	movs r2, #0
	ldrsh r0, [r0, r2]
	str r0, [r1]
	bl EfxClearScreenFx
	bl UpdateBanimFrame
	bl NewEkrGauge
	bl NewEkrDispUP
	bl NewEkrBattle
	ldr r0, _0805B180  @ gUnknown_085BEF94
	ldr r4, _0805B184  @ gPaletteBuffer+0xC0
	adds r1, r4, #0
	movs r2, #0x20
	bl CpuFastSet
	subs r4, #0xc0
	ldr r5, _0805B188  @ gEfxPal
	movs r6, #0x80
	lsls r6, r6, #1
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r6, #0
	bl CpuFastSet
	adds r0, r5, #0
	adds r1, r4, #0
	adds r2, r6, #0
	bl CpuFastSet
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0x20
	movs r3, #0x10
	bl EfxPalBlackInOut
	bl EnablePaletteSync
	mov r0, r8
	bl Proc_Break
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0805B178: .4byte gEkrInitPosReal
_0805B17C: .4byte gEkrInitialHitSide
_0805B180: .4byte gUnknown_085BEF94
_0805B184: .4byte gPaletteBuffer+0xC0
_0805B188: .4byte gEfxPal

	THUMB_FUNC_END sub_805B104

	THUMB_FUNC_START sub_805B18C
sub_805B18C: @ 0x0805B18C
	push {r4, r5, r6, lr}
	sub sp, #0x10
	adds r5, r0, #0
	ldr r0, _0805B1EC  @ gUnknown_085BC188
	ldr r1, _0805B1F0  @ 0x06008000
	bl LZ77UnCompVram
	ldr r0, _0805B1F4  @ gUnknown_085BE7F4
	ldr r6, _0805B1F8  @ gEkrTsaBuffer
	adds r1, r6, #0
	bl LZ77UnCompWram
	movs r1, #1
	negs r1, r1
	ldr r2, _0805B1FC  @ gEfxFrameTmap
	movs r0, #0x2e
	str r0, [sp]
	movs r0, #0x14
	str r0, [sp, #4]
	movs r0, #6
	str r0, [sp, #8]
	movs r4, #0
	str r4, [sp, #0xc]
	adds r0, r6, #0
	movs r3, #0x42
	bl EfxTmCpyExt
	movs r0, #0
	bl sub_805B034
	movs r0, #8
	bl BG_EnableSyncByMask
	strh r4, [r5, #0x2c]
	movs r0, #0x10
	strh r0, [r5, #0x2e]
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #0x8e
	bl EfxPlaySE
	adds r0, r5, #0
	bl Proc_Break
	add sp, #0x10
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0805B1EC: .4byte gUnknown_085BC188
_0805B1F0: .4byte 0x06008000
_0805B1F4: .4byte gUnknown_085BE7F4
_0805B1F8: .4byte gEkrTsaBuffer
_0805B1FC: .4byte gEfxFrameTmap

	THUMB_FUNC_END sub_805B18C

	THUMB_FUNC_START sub_805B200
sub_805B200: @ 0x0805B200
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	movs r0, #0x2c
	ldrsh r3, [r6, r0]
	movs r1, #0x2e
	ldrsh r0, [r6, r1]
	str r0, [sp]
	movs r0, #0
	movs r1, #0x10
	movs r2, #0
	bl Interpolate
	adds r5, r0, #0
	ldr r0, _0805B25C  @ gEfxPal
	ldr r4, _0805B260  @ gPaletteBuffer
	movs r2, #0x80
	lsls r2, r2, #1
	adds r1, r4, #0
	bl CpuFastSet
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0x20
	adds r3, r5, #0
	bl EfxPalBlackInOut
	bl EnablePaletteSync
	ldrh r1, [r6, #0x2c]
	adds r1, #1
	strh r1, [r6, #0x2c]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r2, #0x2e
	ldrsh r0, [r6, r2]
	adds r0, #1
	cmp r1, r0
	bne _0805B254
	adds r0, r6, #0
	bl Proc_Break
_0805B254:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0805B25C: .4byte gEfxPal
_0805B260: .4byte gPaletteBuffer

	THUMB_FUNC_END sub_805B200

	THUMB_FUNC_START sub_805B264
sub_805B264: @ 0x0805B264
	push {r4, lr}
	adds r4, r0, #0
	bl NewEkrTogiColor
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_805B264

	THUMB_FUNC_START NewEkrTogiEndPROC
NewEkrTogiEndPROC: @ 0x0805B278
	push {lr}
	ldr r0, _0805B28C  @ gProc_ekrTogiEnd
	movs r1, #3
	bl Proc_Start
	bl EndEkrTogiColor
	pop {r0}
	bx r0
	.align 2, 0
_0805B28C: .4byte gProc_ekrTogiEnd

	THUMB_FUNC_END NewEkrTogiEndPROC

	THUMB_FUNC_START sub_805B290
sub_805B290: @ 0x0805B290
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0805B2B4  @ gPaletteBuffer
	ldr r1, _0805B2B8  @ gEfxPal
	movs r2, #0x80
	lsls r2, r2, #1
	bl CpuFastSet
	movs r0, #0
	strh r0, [r4, #0x2c]
	movs r0, #0x10
	strh r0, [r4, #0x2e]
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805B2B4: .4byte gPaletteBuffer
_0805B2B8: .4byte gEfxPal

	THUMB_FUNC_END sub_805B290

	THUMB_FUNC_START sub_805B2BC
sub_805B2BC: @ 0x0805B2BC
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	movs r0, #0x2c
	ldrsh r3, [r6, r0]
	movs r1, #0x2e
	ldrsh r0, [r6, r1]
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0x10
	bl Interpolate
	adds r5, r0, #0
	ldr r0, _0805B318  @ gEfxPal
	ldr r4, _0805B31C  @ gPaletteBuffer
	movs r2, #0x80
	lsls r2, r2, #1
	adds r1, r4, #0
	bl CpuFastSet
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0x20
	adds r3, r5, #0
	bl EfxPalBlackInOut
	bl EnablePaletteSync
	ldrh r1, [r6, #0x2c]
	adds r1, #1
	strh r1, [r6, #0x2c]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r2, #0x2e
	ldrsh r0, [r6, r2]
	adds r0, #1
	cmp r1, r0
	bne _0805B310
	adds r0, r6, #0
	bl Proc_Break
_0805B310:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0805B318: .4byte gEfxPal
_0805B31C: .4byte gPaletteBuffer

	THUMB_FUNC_END sub_805B2BC

	THUMB_FUNC_START sub_805B320
sub_805B320: @ 0x0805B320
	push {r4, lr}
	adds r4, r0, #0
	bl EndEkrBattleDeamon
	bl EndEkrGauge
	ldr r0, _0805B344  @ OnGameLoopMain
	bl SetMainUpdateRoutine
	ldr r0, _0805B348  @ OnVBlank
	bl SetInterrupt_LCDVBlank
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805B344: .4byte OnGameLoopMain
_0805B348: .4byte OnVBlank

	THUMB_FUNC_END sub_805B320

	THUMB_FUNC_START NewEkrTogiColor
NewEkrTogiColor: @ 0x0805B34C
	push {r4, lr}
	ldr r4, _0805B370  @ gUnknown_0201FB24
	ldr r0, _0805B374  @ gProc_ekrTogiColor
	movs r1, #3
	bl Proc_Start
	str r0, [r4]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r1, [r0, #0x44]
	ldr r1, _0805B378  @ gUnknown_080DB026
	str r1, [r0, #0x48]
	ldr r1, _0805B37C  @ gUnknown_085B9E4C
	str r1, [r0, #0x4c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805B370: .4byte gUnknown_0201FB24
_0805B374: .4byte gProc_ekrTogiColor
_0805B378: .4byte gUnknown_080DB026
_0805B37C: .4byte gUnknown_085B9E4C

	THUMB_FUNC_END NewEkrTogiColor

	THUMB_FUNC_START EndEkrTogiColor
EndEkrTogiColor: @ 0x0805B380
	push {lr}
	ldr r0, _0805B390  @ gUnknown_0201FB24
	ldr r0, [r0]
	bl Proc_End
	pop {r0}
	bx r0
	.align 2, 0
_0805B390: .4byte gUnknown_0201FB24

	THUMB_FUNC_END EndEkrTogiColor

	THUMB_FUNC_START sub_805B394
sub_805B394: @ 0x0805B394
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl EfxAdvanceFrameLut
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0
	blt _0805B3C0
	ldr r1, [r4, #0x4c]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r1, _0805B3C8  @ gPaletteBuffer+0xC0
	movs r2, #0x20
	bl CpuFastSet
	bl EnablePaletteSync
_0805B3C0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805B3C8: .4byte gPaletteBuffer+0xC0

	THUMB_FUNC_END sub_805B394
