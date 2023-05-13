	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	THUMB_FUNC_START NewEkrPopup
NewEkrPopup: @ 0x08075F18
	push {r4, r5, lr}
	ldr r0, _08075F6C  @ gEkrDistanceType
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #4
	bne _08075F9E
	ldr r4, _08075F70  @ gpProcEkrPopup
	ldr r0, _08075F74  @ ProcScr_ekrPopup2
	movs r1, #3
	bl Proc_Start
	adds r5, r0, #0
	str r5, [r4]
	ldr r1, _08075F78  @ gEkrPopupEnded
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
_08075F6C: .4byte gEkrDistanceType
_08075F70: .4byte gpProcEkrPopup
_08075F74: .4byte ProcScr_ekrPopup2
_08075F78: .4byte gEkrPopupEnded
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
	ldr r4, _08076048  @ gpProcEkrPopup
	ldr r0, _0807604C  @ ProcScr_ekrPopup
	movs r1, #3
	bl Proc_Start
	adds r5, r0, #0
	str r5, [r4]
	ldr r1, _08076050  @ gEkrPopupEnded
	movs r0, #0
	str r0, [r1]
	strh r0, [r5, #0x2c]
	str r0, [r5, #0x48]
	str r0, [r5, #0x44]
	str r0, [r5, #0x50]
	str r0, [r5, #0x4c]
	ldr r0, _08076054  @ gBanimSomeObjPalIndex
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
	ldr r0, _08076054  @ gBanimSomeObjPalIndex
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
	ldr r1, _08076050  @ gEkrPopupEnded
	movs r0, #1
	str r0, [r1]
	bl DeleteAnimsOnPopup
	b _08076066
	.align 2, 0
_08076048: .4byte gpProcEkrPopup
_0807604C: .4byte ProcScr_ekrPopup
_08076050: .4byte gEkrPopupEnded
_08076054: .4byte gBanimSomeObjPalIndex
_08076058: .4byte gpEkrBattleUnitLeft
_0807605C: .4byte gpEkrBattleUnitRight
_08076060:
	movs r0, #0x80
	bl Sound_SetSEVolume
_08076066:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END NewEkrPopup

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
	ldr r0, _08076248  @ gEkrPopupEnded
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
_08076248: .4byte gEkrPopupEnded

	THUMB_FUNC_END ekrPopup_MarkEnd

	THUMB_FUNC_START nullsub_68
nullsub_68: @ 0x0807624C
	bx lr

	THUMB_FUNC_END nullsub_68

	THUMB_FUNC_START sub_8076250
sub_8076250: @ 0x08076250
	push {r4, lr}
	adds r4, r0, #0
	ldr r2, [r4, #0x44]
	movs r0, #1
	negs r0, r0
	cmp r2, r0
	bne _08076268
	adds r0, r4, #0
	movs r1, #1
	bl Proc_Goto
	b _08076288
_08076268:
	ldr r0, [r4, #0x4c]
	cmp r0, #0
	beq _08076282
	adds r0, r4, #0
	movs r1, #2
	bl DrawBattlePopup
	bl sub_8075B58
	movs r0, #0
	strh r0, [r4, #0x2c]
	movs r0, #0x60
	strh r0, [r4, #0x2e]
_08076282:
	adds r0, r4, #0
	bl Proc_Break
_08076288:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8076250

	THUMB_FUNC_START sub_8076290
sub_8076290: @ 0x08076290
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x50]
	cmp r0, #0
	bne _080762A2
	adds r0, r4, #0
	bl Proc_Break
	b _080762C8
_080762A2:
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x2e
	ldrsh r1, [r4, r2]
	cmp r0, r1
	ble _080762C8
	movs r0, #0
	strh r0, [r4, #0x2c]
	ldr r0, [r4, #0x60]
	bl AnimDelete
	bl ClearBG1
	adds r0, r4, #0
	bl Proc_Break
_080762C8:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8076290

	THUMB_FUNC_START sub_80762D0
sub_80762D0: @ 0x080762D0
	push {r4, lr}
	adds r4, r0, #0
	ldr r2, [r4, #0x48]
	movs r0, #1
	negs r0, r0
	cmp r2, r0
	bne _080762E8
	adds r0, r4, #0
	movs r1, #5
	bl Proc_Goto
	b _08076308
_080762E8:
	ldr r0, [r4, #0x4c]
	cmp r0, #0
	beq _08076302
	adds r0, r4, #0
	movs r1, #2
	bl DrawBattlePopup
	bl sub_8075B58
	movs r0, #0
	strh r0, [r4, #0x2c]
	movs r0, #0x60
	strh r0, [r4, #0x2e]
_08076302:
	adds r0, r4, #0
	bl Proc_Break
_08076308:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80762D0

	THUMB_FUNC_START CheckBanimHensei
CheckBanimHensei: @ 0x08076310
	push {lr}
	ldr r0, _08076324  @ gBattleStats
	ldrh r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	bne _08076328
	movs r0, #0
	b _0807632A
	.align 2, 0
_08076324: .4byte gBattleStats
_08076328:
	movs r0, #1
_0807632A:
	pop {r1}
	bx r1

	THUMB_FUNC_END CheckBanimHensei

	THUMB_FUNC_START BeginAnimsOnBattle_Hensei
BeginAnimsOnBattle_Hensei: @ 0x08076330
	push {lr}
	bl NewEkrBattleDeamon
	bl AnimClearAll
	bl GetEkrSomePosMaybe
	ldr r1, _08076350  @ gEkrPos2Maybe
	str r0, [r1]
	bl NewEkrHenseiInitPROC
	movs r0, #0
	bl SetPrimaryHBlankHandler
	pop {r0}
	bx r0
	.align 2, 0
_08076350: .4byte gEkrPos2Maybe

	THUMB_FUNC_END BeginAnimsOnBattle_Hensei

	THUMB_FUNC_START ExecEkrHenseiEnd
ExecEkrHenseiEnd: @ 0x08076354
	push {lr}
	bl AnimClearAll
	bl NewEkrHenseiEnd
	ldr r0, _08076368  @ MainUpdate_8055C68
	bl SetMainUpdateRoutine
	pop {r0}
	bx r0
	.align 2, 0
_08076368: .4byte MainUpdate_8055C68

	THUMB_FUNC_END ExecEkrHenseiEnd

	THUMB_FUNC_START NewEkrHenseiInitPROC
NewEkrHenseiInitPROC: @ 0x0807636C
	push {lr}
	ldr r0, _0807637C  @ ProcScr_ekrHenseiInit
	movs r1, #3
	bl Proc_Start
	pop {r0}
	bx r0
	.align 2, 0
_0807637C: .4byte ProcScr_ekrHenseiInit

	THUMB_FUNC_END NewEkrHenseiInitPROC

	THUMB_FUNC_START sub_8076380
sub_8076380: @ 0x08076380
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r0, #0
	bl SetupOAMBufferSplice
	bl EfxClearScreenFx
	bl UpdateBanimFrame
	bl NewEkrGauge
	bl NewEkrDispUP
	bl NewEkrBattle
	ldr r0, _080763D4  @ gEkrPairSomeTile
	movs r1, #0
	ldrsh r0, [r0, r1]
	subs r0, #1
	bl PutBanimBG
	ldr r4, _080763D8  @ gPaletteBuffer
	ldr r1, _080763DC  @ gEkrBgPalBackupMaybe
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r4, #0
	bl CpuFastSet
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0x20
	movs r3, #0x10
	bl EkrMaybePalFadeWithVal
	bl EnablePaletteSync
	adds r0, r5, #0
	bl Proc_Break
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080763D4: .4byte gEkrPairSomeTile
_080763D8: .4byte gPaletteBuffer
_080763DC: .4byte gEkrBgPalBackupMaybe

	THUMB_FUNC_END sub_8076380

	THUMB_FUNC_START sub_80763E0
sub_80763E0: @ 0x080763E0
	push {r4, lr}
	adds r4, r0, #0
	bl EkrGauge_Set4C
	bl EkrDispUpSet4C
	movs r0, #0
	strh r0, [r4, #0x2c]
	movs r0, #0x10
	strh r0, [r4, #0x2e]
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80763E0

	THUMB_FUNC_START sub_8076400
sub_8076400: @ 0x08076400
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
	ldr r0, _0807645C  @ gEkrBgPalBackupMaybe
	ldr r4, _08076460  @ gPaletteBuffer
	movs r2, #0x80
	lsls r2, r2, #1
	adds r1, r4, #0
	bl CpuFastSet
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0x20
	adds r3, r5, #0
	bl EkrMaybePalFadeWithVal
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
	bne _08076454
	adds r0, r6, #0
	bl Proc_Break
_08076454:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807645C: .4byte gEkrBgPalBackupMaybe
_08076460: .4byte gPaletteBuffer

	THUMB_FUNC_END sub_8076400

	THUMB_FUNC_START sub_8076464
sub_8076464: @ 0x08076464
	push {lr}
	bl Proc_Break
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8076464

	THUMB_FUNC_START NewEkrHenseiEnd
NewEkrHenseiEnd: @ 0x08076470
	push {lr}
	ldr r0, _08076480  @ ProcScr_ekrHenseiEnd
	movs r1, #3
	bl Proc_Start
	pop {r0}
	bx r0
	.align 2, 0
_08076480: .4byte ProcScr_ekrHenseiEnd

	THUMB_FUNC_END NewEkrHenseiEnd

	THUMB_FUNC_START sub_8076484
sub_8076484: @ 0x08076484
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080764A8  @ gPaletteBuffer
	ldr r1, _080764AC  @ gEkrBgPalBackupMaybe
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
_080764A8: .4byte gPaletteBuffer
_080764AC: .4byte gEkrBgPalBackupMaybe

	THUMB_FUNC_END sub_8076484

	THUMB_FUNC_START sub_80764B0
sub_80764B0: @ 0x080764B0
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
	ldr r0, _0807650C  @ gEkrBgPalBackupMaybe
	ldr r4, _08076510  @ gPaletteBuffer
	movs r2, #0x80
	lsls r2, r2, #1
	adds r1, r4, #0
	bl CpuFastSet
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0x20
	adds r3, r5, #0
	bl EkrMaybePalFadeWithVal
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
	bne _08076504
	adds r0, r6, #0
	bl Proc_Break
_08076504:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807650C: .4byte gEkrBgPalBackupMaybe
_08076510: .4byte gPaletteBuffer

	THUMB_FUNC_END sub_80764B0

	THUMB_FUNC_START sub_8076514
sub_8076514: @ 0x08076514
	push {r4, lr}
	adds r4, r0, #0
	bl EndEkrBattleDeamon
	bl EndEkrGauge
	ldr r0, _08076538  @ OnGameLoopMain
	bl SetMainUpdateRoutine
	ldr r0, _0807653C  @ OnVBlank
	bl SetInterrupt_LCDVBlank
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08076538: .4byte OnGameLoopMain
_0807653C: .4byte OnVBlank

	THUMB_FUNC_END sub_8076514

.align 2, 0
