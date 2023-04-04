	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	THUMB_FUNC_START sub_8055BB4
sub_8055BB4: @ 0x08055BB4
	push {lr}
	bl PrepareBattleGraphicsMaybe
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8055BB4

	THUMB_FUNC_START sub_8055BC4
sub_8055BC4: @ 0x08055BC4
	push {lr}
	bl PrepareBattleGraphicsMaybe
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8055BC4

	THUMB_FUNC_START BeginAnimsOnBattleAnimations
BeginAnimsOnBattleAnimations: @ 0x08055BD4
	push {lr}
	bl sub_805B028
	cmp r0, #1
	bne _08055BE4
	bl BeginAnimsOnBattle_Arena
	b _08055C24
_08055BE4:
	bl sub_8076310
	cmp r0, #1
	bne _08055BF2
	bl BeginAnimsOnBattle_Hensei
	b _08055C24
_08055BF2:
	bl NewEkrBattleDeamon
	bl AnimClearAll
	bl sub_8052184
	ldr r1, _08055C28  @ gUnknown_02017744
	str r0, [r1]
	bl NewEkrBattleStarting
	ldr r0, _08055C2C  @ gUnknown_02000000
	movs r1, #0
	str r1, [r0]
	str r1, [r0, #4]
	str r1, [r0, #8]
	str r1, [r0, #0xc]
	ldr r0, _08055C30  @ gUnknown_02000010
	str r1, [r0]
	str r1, [r0, #4]
	ldr r0, _08055C34  @ MainUpdate_8055C68
	bl SetMainUpdateRoutine
	movs r0, #0
	bl SetPrimaryHBlankHandler
_08055C24:
	pop {r0}
	bx r0
	.align 2, 0
_08055C28: .4byte gUnknown_02017744
_08055C2C: .4byte gUnknown_02000000
_08055C30: .4byte gUnknown_02000010
_08055C34: .4byte MainUpdate_8055C68

	THUMB_FUNC_END BeginAnimsOnBattleAnimations

	THUMB_FUNC_START sub_8055C38
sub_8055C38: @ 0x08055C38
	push {lr}
	bl sub_805B028
	cmp r0, #1
	bne _08055C48
	bl sub_805B0CC
	b _08055C60
_08055C48:
	bl sub_8076310
	cmp r0, #1
	bne _08055C56
	bl sub_8076354
	b _08055C60
_08055C56:
	bl sub_80560D8
	ldr r0, _08055C64  @ MainUpdate_8055C68
	bl SetMainUpdateRoutine
_08055C60:
	pop {r0}
	bx r0
	.align 2, 0
_08055C64: .4byte MainUpdate_8055C68

	THUMB_FUNC_END sub_8055C38

	THUMB_FUNC_START MainUpdate_8055C68
MainUpdate_8055C68: @ 0x08055C68
	push {r4, lr}
	ldr r0, _08055CCC  @ gKeyStatusPtr
	ldr r0, [r0]
	bl UpdateKeyStatus
	bl ClearSprites
	ldr r4, _08055CD0  @ gProcTreeRootArray
	ldr r0, [r4, #4]
	bl Proc_Run
	bl GetThread2SkipStack
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08055C8E
	ldr r0, [r4, #8]
	bl Proc_Run
_08055C8E:
	ldr r0, [r4, #0xc]
	bl Proc_Run
	ldr r0, [r4, #0x14]
	bl Proc_Run
	movs r0, #0
	bl PushSpriteLayerObjects
	ldr r0, [r4, #0x10]
	bl Proc_Run
	bl AnimUpdateAll
	bl BattleAIS_ExecCommands
	movs r0, #0xd
	bl PushSpriteLayerObjects
	ldr r1, _08055CD4  @ gBmSt
	movs r0, #1
	strb r0, [r1]
	ldr r0, _08055CD8  @ 0x04000006
	ldrh r0, [r0]
	strh r0, [r1, #6]
	bl VBlankIntrWait
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08055CCC: .4byte gKeyStatusPtr
_08055CD0: .4byte gProcTreeRootArray
_08055CD4: .4byte gBmSt
_08055CD8: .4byte 0x04000006

	THUMB_FUNC_END MainUpdate_8055C68

	THUMB_FUNC_START NewEkrBattleStarting
NewEkrBattleStarting: @ 0x08055CDC
	push {lr}
	ldr r0, _08055CEC  @ gProc_ekrBattleStarting
	movs r1, #3
	bl Proc_Start
	pop {r0}
	bx r0
	.align 2, 0
_08055CEC: .4byte gProc_ekrBattleStarting

	THUMB_FUNC_END NewEkrBattleStarting

	THUMB_FUNC_START ekrBattleStarting_8055CF0
ekrBattleStarting_8055CF0: @ 0x08055CF0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r4, r0, #0
	movs r6, #0
	movs r5, #0
	strh r5, [r4, #0x2c]
	movs r0, #0xf
	strh r0, [r4, #0x2e]
	ldr r2, _08055DE4  @ gUnknown_0203E122
	movs r1, #0
	ldrsh r0, [r2, r1]
	movs r3, #4
	ldrsh r1, [r2, r3]
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, #8
	strh r0, [r4, #0x34]
	strh r0, [r4, #0x32]
	movs r7, #2
	ldrsh r0, [r2, r7]
	movs r3, #6
	ldrsh r1, [r2, r3]
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, #8
	strh r0, [r4, #0x3c]
	strh r0, [r4, #0x3a]
	str r5, [sp, #4]
	ldr r1, _08055DE8  @ gBG2TilemapBuffer
	ldr r2, _08055DEC  @ 0x01000200
	add r0, sp, #4
	bl CpuFastSet
	movs r0, #4
	bl BG_EnableSyncByMask
	movs r0, #3
	movs r1, #0
	movs r2, #0
	movs r3, #4
	bl SetSpecialColorEffectsParameters
	str r5, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #1
	bl SetBlendTargetA
	ldr r7, _08055DF0  @ gLCDControlBuffer
	mov r8, r7
	mov r1, r8
	ldrb r0, [r1, #1]
	movs r2, #0x20
	mov sl, r2
	mov r3, sl
	orrs r0, r3
	movs r1, #0x41
	negs r1, r1
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r7, #1]
	mov r0, r8
	adds r0, #0x2d
	strb r6, [r0]
	adds r0, #4
	strb r6, [r0]
	mov r1, r8
	adds r1, #0x2c
	movs r0, #0xf0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0xa0
	strb r0, [r1]
	movs r0, #0x34
	add r0, r8
	mov r9, r0
	ldrb r1, [r0]
	movs r6, #1
	orrs r1, r6
	movs r5, #2
	orrs r1, r5
	movs r3, #4
	orrs r1, r3
	movs r2, #8
	orrs r1, r2
	movs r0, #0x10
	orrs r1, r0
	movs r7, #0x36
	add r8, r7
	mov r7, r8
	ldrb r0, [r7]
	orrs r0, r6
	orrs r0, r5
	orrs r0, r3
	orrs r0, r2
	movs r2, #0x11
	negs r2, r2
	ands r0, r2
	subs r2, #0x10
	ands r1, r2
	mov r2, r9
	strb r1, [r2]
	mov r3, sl
	orrs r0, r3
	strb r0, [r7]
	adds r0, r4, #0
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
_08055DE4: .4byte gUnknown_0203E122
_08055DE8: .4byte gBG2TilemapBuffer
_08055DEC: .4byte 0x01000200
_08055DF0: .4byte gLCDControlBuffer

	THUMB_FUNC_END ekrBattleStarting_8055CF0

	THUMB_FUNC_START ekrBattleStarting_8055DF4
ekrBattleStarting_8055DF4: @ 0x08055DF4
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r7, r0, #0
	ldrh r2, [r7, #0x2c]
	movs r0, #0x2c
	ldrsh r1, [r7, r0]
	movs r3, #0x2e
	ldrsh r0, [r7, r3]
	cmp r1, r0
	beq _08055E12
	adds r0, r2, #1
	strh r0, [r7, #0x2c]
_08055E12:
	movs r0, #0x32
	ldrsh r2, [r7, r0]
	movs r1, #0x2c
	ldrsh r3, [r7, r1]
	movs r1, #0x2e
	ldrsh r0, [r7, r1]
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	bl Interpolate
	adds r6, r0, #0
	movs r3, #0x3a
	ldrsh r2, [r7, r3]
	movs r0, #0x2c
	ldrsh r3, [r7, r0]
	movs r1, #0x2e
	ldrsh r0, [r7, r1]
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	bl Interpolate
	adds r5, r0, #0
	movs r3, #0x34
	ldrsh r2, [r7, r3]
	movs r0, #0x2c
	ldrsh r3, [r7, r0]
	movs r1, #0x2e
	ldrsh r0, [r7, r1]
	str r0, [sp]
	movs r0, #0
	movs r1, #0xf0
	bl Interpolate
	adds r4, r0, #0
	movs r3, #0x3c
	ldrsh r2, [r7, r3]
	movs r0, #0x2c
	ldrsh r3, [r7, r0]
	movs r1, #0x2e
	ldrsh r0, [r7, r1]
	str r0, [sp]
	movs r0, #0
	movs r1, #0xa0
	bl Interpolate
	ldr r2, _08055EF8  @ gLCDControlBuffer
	movs r3, #0x2d
	adds r3, r3, r2
	mov r8, r3
	movs r1, #0
	mov r9, r1
	strb r6, [r3]
	adds r6, r2, #0
	adds r6, #0x31
	strb r5, [r6]
	adds r5, r2, #0
	adds r5, #0x2c
	strb r4, [r5]
	adds r4, r2, #0
	adds r4, #0x30
	strb r0, [r4]
	movs r3, #0x2c
	ldrsh r1, [r7, r3]
	movs r3, #0x2e
	ldrsh r0, [r7, r3]
	cmp r1, r0
	bne _08055EEA
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
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2]
	movs r0, #0
	bl SetupOAMBufferSplice
	bl BMapDispSuspend
	mov r1, r9
	mov r0, r8
	strb r1, [r0]
	strb r1, [r6]
	movs r0, #0xf0
	strb r0, [r5]
	movs r0, #0xa0
	strb r0, [r4]
	ldr r0, _08055EFC  @ gPaletteBuffer
	movs r1, #6
	movs r2, #0xa
	movs r3, #4
	bl sub_80712B0
	bl EnablePaletteSync
	bl MU_EndAll
	adds r0, r7, #0
	bl Proc_Break
_08055EEA:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08055EF8: .4byte gLCDControlBuffer
_08055EFC: .4byte gPaletteBuffer

	THUMB_FUNC_END ekrBattleStarting_8055DF4

	THUMB_FUNC_START ekrBattleStarting_8055F00
ekrBattleStarting_8055F00: @ 0x08055F00
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _08055F2C  @ gUnknown_0203E0FC
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _08055F64
	bl NewEkrGauge
	bl NewEkrDispUP
	ldr r0, _08055F30  @ gUnknown_0203E120
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #3
	beq _08055F34
	cmp r0, #3
	ble _08055F64
	cmp r0, #4
	beq _08055F5C
	b _08055F64
	.align 2, 0
_08055F2C: .4byte gUnknown_0203E0FC
_08055F30: .4byte gUnknown_0203E120
_08055F34:
	ldr r4, _08055F58  @ gUnknown_0203E104
	movs r1, #0
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _08055F46
	bl EkrGauge_80511A0
	bl sub_8051B28
_08055F46:
	movs r1, #2
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _08055F64
	bl EkrGauge_80511B0
	bl sub_8051B38
	b _08055F64
	.align 2, 0
_08055F58: .4byte gUnknown_0203E104
_08055F5C:
	bl EkrGauge_80511A0
	bl sub_8051B28
_08055F64:
	bl sub_8051CC4
	movs r0, #0
	bl sub_8056900
	movs r0, #0
	bl sub_805649C
	movs r0, #0
	movs r1, #0xb
	bl NewEkrWindowAppear
	movs r0, #0
	movs r1, #0xb
	movs r2, #0
	bl NewEkrNamewinAppear
	movs r0, #0
	movs r1, #0xb
	bl sub_8056F20
	movs r0, #0
	strh r0, [r5, #0x2c]
	adds r0, r5, #0
	bl Proc_Break
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END ekrBattleStarting_8055F00

	THUMB_FUNC_START ekrBattleStarting_8055FA0
ekrBattleStarting_8055FA0: @ 0x08055FA0
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xb
	ble _08055FE0
	ldr r0, _08055FD0  @ gUnknown_0203E0FE
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _08055FC4
	bl sub_806FAB0
	cmp r0, #0
	beq _08055FD4
_08055FC4:
	bl NewEkrBattle
	adds r0, r4, #0
	bl Proc_End
	b _08055FE0
	.align 2, 0
_08055FD0: .4byte gUnknown_0203E0FE
_08055FD4:
	strh r0, [r4, #0x2c]
	bl NewEkrBattle
	adds r0, r4, #0
	bl Proc_Break
_08055FE0:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END ekrBattleStarting_8055FA0

	THUMB_FUNC_START ekrBattleStarting_8055FE8
ekrBattleStarting_8055FE8: @ 0x08055FE8
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	movs r0, #0x2c
	ldrsh r3, [r4, r0]
	movs r0, #8
	str r0, [sp]
	movs r0, #0
	movs r1, #4
	movs r2, #0x10
	bl Interpolate
	bl sub_807168C
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #9
	bne _0805601C
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r4, #0
	bl Proc_Break
_0805601C:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END ekrBattleStarting_8055FE8

	THUMB_FUNC_START ekrBattleStarting_8056024
ekrBattleStarting_8056024: @ 0x08056024
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08056038  @ gUnknown_0203E102
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _08056040
	ldr r1, _0805603C  @ gUnknown_0201FAD8
	movs r0, #6
	b _08056044
	.align 2, 0
_08056038: .4byte gUnknown_0203E102
_0805603C: .4byte gUnknown_0201FAD8
_08056040:
	ldr r1, _0805606C  @ gUnknown_0201FAD8
	movs r0, #0xa
_08056044:
	str r0, [r1]
	ldr r0, _08056070  @ gUnknown_0203E0FE
	movs r1, #0
	ldrsh r0, [r0, r1]
	subs r0, #1
	bl sub_8075AD8
	ldr r0, _08056074  @ gPaletteBuffer
	movs r1, #6
	movs r2, #0xa
	movs r3, #0x10
	bl sub_80712B0
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805606C: .4byte gUnknown_0201FAD8
_08056070: .4byte gUnknown_0203E0FE
_08056074: .4byte gPaletteBuffer

	THUMB_FUNC_END ekrBattleStarting_8056024

	THUMB_FUNC_START ekrBattleStarting_8056078
ekrBattleStarting_8056078: @ 0x08056078
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	movs r0, #0x2c
	ldrsh r3, [r5, r0]
	movs r0, #8
	str r0, [sp]
	movs r0, #0
	movs r1, #0x10
	movs r2, #0
	bl Interpolate
	adds r4, r0, #0
	ldr r0, _080560D0  @ gUnknown_0203E0FE
	movs r1, #0
	ldrsh r0, [r0, r1]
	subs r0, #1
	bl sub_8075AB4
	ldr r0, _080560D4  @ gPaletteBuffer
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
	bne _080560C6
	movs r0, #0
	strh r0, [r5, #0x2c]
	adds r0, r5, #0
	bl Proc_Break
_080560C6:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080560D0: .4byte gUnknown_0203E0FE
_080560D4: .4byte gPaletteBuffer

	THUMB_FUNC_END ekrBattleStarting_8056078

.align 2, 0
