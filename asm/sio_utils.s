	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	THUMB_FUNC_START SioStrCpy
SioStrCpy: @ 0x08042DC8
	push {lr}
	movs r3, #0
	b _08042DD6
_08042DCE:
	strb r2, [r1]
	adds r0, #1
	adds r1, #1
	adds r3, #1
_08042DD6:
	ldrb r2, [r0]
	cmp r2, #0
	bne _08042DCE
	ldrb r0, [r0]
	strb r0, [r1]
	adds r0, r3, #0
	pop {r1}
	bx r1

	THUMB_FUNC_END SioStrCpy

	THUMB_FUNC_START SioDrawNumber
SioDrawNumber: @ 0x08042DE8
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r2, #0
	adds r6, r3, #0
	bl Text_SetCursor
	adds r0, r4, #0
	adds r1, r5, #0
	bl Text_SetColor
	adds r0, r4, #0
	adds r1, r6, #0
	bl Text_DrawNumber
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END SioDrawNumber

	THUMB_FUNC_START sub_8042E0C
sub_8042E0C: @ 0x08042E0C
	push {lr}
	bl SioRegisterIrq
	bl sub_8041898
	ldr r2, _08042E28  @ gSioSt
	ldr r1, [r2]
	movs r3, #0
	movs r0, #1
	strb r0, [r1, #1]
	ldr r0, [r2]
	strh r3, [r0, #4]
	pop {r0}
	bx r0
	.align 2, 0
_08042E28: .4byte gSioSt

	THUMB_FUNC_END sub_8042E0C

	THUMB_FUNC_START sub_8042E2C
sub_8042E2C: @ 0x08042E2C
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	ldr r0, _08042E70  @ 0x00002586
	mov r1, sp
	strh r0, [r1]
	bl sub_80415B0
	movs r5, #1
	negs r5, r5
	cmp r0, r5
	beq _08042E68
	ldr r4, _08042E74  @ gSioSt
	ldr r1, [r4]
	movs r0, #0
	strb r0, [r1, #0x11]
	ldr r1, [r4]
	movs r0, #5
	strh r0, [r1, #4]
	bl sub_80416D0
	ldr r1, [r4]
	strb r0, [r1, #6]
	mov r0, sp
	adds r1, r5, #0
	bl SioSend16
	adds r0, r6, #0
	bl Proc_Break
_08042E68:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08042E70: .4byte 0x00002586
_08042E74: .4byte gSioSt

	THUMB_FUNC_END sub_8042E2C

	THUMB_FUNC_START SetBmStLinkArenaFlag
SetBmStLinkArenaFlag: @ 0x08042E78
	ldr r2, _08042E84  @ gBmSt
	ldrb r1, [r2, #4]
	movs r0, #0x40
	orrs r0, r1
	strb r0, [r2, #4]
	bx lr
	.align 2, 0
_08042E84: .4byte gBmSt

	THUMB_FUNC_END SetBmStLinkArenaFlag

	THUMB_FUNC_START UnsetBmStLinkArenaFlag
UnsetBmStLinkArenaFlag: @ 0x08042E88
	ldr r2, _08042E94  @ gBmSt
	ldrb r1, [r2, #4]
	movs r0, #0xbf
	ands r0, r1
	strb r0, [r2, #4]
	bx lr
	.align 2, 0
_08042E94: .4byte gBmSt

	THUMB_FUNC_END UnsetBmStLinkArenaFlag

	THUMB_FUNC_START CheckInLinkArena
CheckInLinkArena: @ 0x08042E98
	ldr r0, _08042EA4  @ gBmSt
	ldrb r0, [r0, #4]
	lsrs r0, r0, #6
	movs r1, #1
	ands r0, r1
	bx lr
	.align 2, 0
_08042EA4: .4byte gBmSt

	THUMB_FUNC_END CheckInLinkArena

	THUMB_FUNC_START sub_8042EA8
sub_8042EA8: @ 0x08042EA8
	ldr r1, _08042EB0  @ gLinkArenaSt
	movs r0, #0xff
	strb r0, [r1, #4]
	bx lr
	.align 2, 0
_08042EB0: .4byte gLinkArenaSt

	THUMB_FUNC_END sub_8042EA8

	THUMB_FUNC_START sub_8042EB4
sub_8042EB4: @ 0x08042EB4
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	movs r4, #0
	str r4, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #1
	movs r3, #0
	bl SetBlendTargetA
	movs r0, #1
	str r0, [sp]
	movs r1, #1
	movs r2, #0
	movs r3, #1
	bl SetBlendTargetB
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	str r4, [r5, #0x58]
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8042EB4

	THUMB_FUNC_START sub_8042EF0
sub_8042EF0: @ 0x08042EF0
	push {r4, lr}
	sub sp, #4
	ldr r1, [r0, #0x58]
	adds r1, #1
	str r1, [r0, #0x58]
	movs r4, #0x3f
	ands r4, r1
	cmp r4, #0x1f
	ble _08042F06
	movs r0, #0x40
	subs r4, r0, r4
_08042F06:
	cmp r4, #0x10
	ble _08042F0C
	movs r4, #0x10
_08042F0C:
	movs r0, #0
	str r0, [sp]
	movs r1, #0
	movs r2, #1
	movs r3, #0
	bl SetBlendTargetA
	movs r0, #1
	str r0, [sp]
	movs r1, #1
	movs r2, #0
	movs r3, #1
	bl SetBlendTargetB
	lsls r1, r4, #0x18
	lsrs r1, r1, #0x18
	movs r2, #0x10
	subs r2, r2, r4
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	movs r0, #1
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8042EF0

	THUMB_FUNC_START sub_8042F44
sub_8042F44: @ 0x08042F44
	ldr r0, _08042F54  @ gLCDControlBuffer
	ldrh r1, [r0, #0x20]
	adds r1, #1
	strh r1, [r0, #0x20]
	ldrh r1, [r0, #0x24]
	subs r1, #1
	strh r1, [r0, #0x24]
	bx lr
	.align 2, 0
_08042F54: .4byte gLCDControlBuffer

	THUMB_FUNC_END sub_8042F44

	THUMB_FUNC_START sub_8042F58
sub_8042F58: @ 0x08042F58
	push {lr}
	adds r2, r0, #0
	ldr r0, _08042F78  @ gSioSt
	ldr r0, [r0]
	ldr r1, _08042F7C  @ 0x00001288
	strh r1, [r0, #0x30]
	ldr r1, _08042F80  @ 0x00001B7E
	adds r0, r0, r1
	ldrh r0, [r0]
	cmp r0, #0
	beq _08042F74
	adds r0, r2, #0
	bl Proc_Break
_08042F74:
	pop {r0}
	bx r0
	.align 2, 0
_08042F78: .4byte gSioSt
_08042F7C: .4byte 0x00001288
_08042F80: .4byte 0x00001B7E

	THUMB_FUNC_END sub_8042F58

	THUMB_FUNC_START sub_8042F84
sub_8042F84: @ 0x08042F84
	ldr r0, _08042F94  @ gSioSt
	ldr r2, [r0]
	movs r1, #6
	ldrsb r1, [r2, r1]
	movs r0, #1
	lsls r0, r1
	strb r0, [r2, #0xa]
	bx lr
	.align 2, 0
_08042F94: .4byte gSioSt

	THUMB_FUNC_END sub_8042F84

	THUMB_FUNC_START sub_8042F98
sub_8042F98: @ 0x08042F98
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _08042FD8  @ gSioMsgBuf
	movs r2, #0
	movs r1, #0x89
	strb r1, [r0]
	ldr r4, _08042FDC  @ gSioSt
	ldr r1, [r4]
	ldrb r1, [r1, #6]
	strb r1, [r0, #1]
	strh r2, [r0, #2]
	movs r1, #4
	bl SioSend
	ldr r4, [r4]
	ldrb r0, [r4, #0xa]
	ldrb r1, [r4, #9]
	ands r0, r1
	cmp r0, r1
	bne _08042FD0
	movs r1, #6
	ldrsb r1, [r4, r1]
	movs r0, #1
	lsls r0, r1
	strb r0, [r4, #0xa]
	adds r0, r5, #0
	bl Proc_Break
_08042FD0:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08042FD8: .4byte gSioMsgBuf
_08042FDC: .4byte gSioSt

	THUMB_FUNC_END sub_8042F98

	THUMB_FUNC_START sub_8042FE0
sub_8042FE0: @ 0x08042FE0
	push {lr}
	adds r2, r0, #0
	ldr r1, [r2, #0x30]
	ldr r0, [r2, #0x38]
	cmp r1, r0
	bge _08042FF8
	ldr r0, [r2, #0x34]
	cmp r1, r0
	ble _08042FF8
	ldr r0, [r2, #0x2c]
	bl DisplayFrozenUiHand
_08042FF8:
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8042FE0

	THUMB_FUNC_START sub_8042FFC
sub_8042FFC: @ 0x08042FFC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	mov r8, r3
	ldr r7, [sp, #0x18]
	ldr r0, _08043028  @ ProcScr_HOLD
	adds r1, r4, #0
	bl Proc_Start
	str r5, [r0, #0x2c]
	str r6, [r0, #0x30]
	mov r1, r8
	str r1, [r0, #0x38]
	str r7, [r0, #0x34]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08043028: .4byte ProcScr_HOLD

	THUMB_FUNC_END sub_8042FFC

	THUMB_FUNC_START sub_804302C
sub_804302C: @ 0x0804302C
	push {lr}
	ldr r0, _08043038  @ ProcScr_HOLD
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
_08043038: .4byte ProcScr_HOLD

	THUMB_FUNC_END sub_804302C

	THUMB_FUNC_START sub_804303C
sub_804303C: @ 0x0804303C
	ldr r2, [r0, #0x30]
	adds r2, r2, r1
	str r2, [r0, #0x30]
	bx lr

	THUMB_FUNC_END sub_804303C

	THUMB_FUNC_START ClearSioBG
ClearSioBG: @ 0x08043044
	push {lr}
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	movs r0, #3
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	ldr r0, _08043090  @ gBG0TilemapBuffer
	movs r1, #0
	bl BG_Fill
	ldr r0, _08043094  @ gBG1TilemapBuffer
	movs r1, #0
	bl BG_Fill
	ldr r0, _08043098  @ gBG2TilemapBuffer
	movs r1, #0
	bl BG_Fill
	movs r0, #7
	bl BG_EnableSyncByMask
	pop {r0}
	bx r0
	.align 2, 0
_08043090: .4byte gBG0TilemapBuffer
_08043094: .4byte gBG1TilemapBuffer
_08043098: .4byte gBG2TilemapBuffer

	THUMB_FUNC_END ClearSioBG

	THUMB_FUNC_START sub_804309C
sub_804309C: @ 0x0804309C
	push {lr}
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	movs r0, #3
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	ldr r0, _080430F0  @ gBG0TilemapBuffer
	movs r1, #0
	bl BG_Fill
	ldr r0, _080430F4  @ gBG1TilemapBuffer
	movs r1, #0
	bl BG_Fill
	ldr r0, _080430F8  @ gBG2TilemapBuffer
	movs r1, #0
	bl BG_Fill
	ldr r0, _080430FC  @ gBG3TilemapBuffer
	movs r1, #0
	bl BG_Fill
	movs r0, #0xf
	bl BG_EnableSyncByMask
	pop {r0}
	bx r0
	.align 2, 0
_080430F0: .4byte gBG0TilemapBuffer
_080430F4: .4byte gBG1TilemapBuffer
_080430F8: .4byte gBG2TilemapBuffer
_080430FC: .4byte gBG3TilemapBuffer

	THUMB_FUNC_END sub_804309C

	THUMB_FUNC_START sub_8043100
sub_8043100: @ 0x08043100
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r4, r1, #0
	lsls r1, r4, #3
	ldr r0, _0804312C  @ gUnknown_0203DD0C
	adds r5, r1, r0
	adds r0, r5, #0
	bl ClearText
	cmp r6, #0
	bge _08043134
	lsls r1, r4, #7
	movs r0, #0x80
	lsls r0, r0, #3
	adds r1, r1, r0
	ldr r0, _08043130  @ gBG2TilemapBuffer+0x002
	adds r1, r1, r0
	adds r0, r5, #0
	bl PutText
	b _0804315A
	.align 2, 0
_0804312C: .4byte gUnknown_0203DD0C
_08043130: .4byte gBG2TilemapBuffer+0x002
_08043134:
	adds r0, r6, #0
	bl GetStringFromIndex
	adds r1, r0, #0
	adds r0, r5, #0
	bl Text_DrawString
	lsls r1, r4, #7
	movs r0, #0x80
	lsls r0, r0, #3
	adds r1, r1, r0
	ldr r0, _08043160  @ gBG2TilemapBuffer+0x002
	adds r1, r1, r0
	adds r0, r5, #0
	bl PutText
	movs r0, #4
	bl BG_EnableSyncByMask
_0804315A:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08043160: .4byte gBG2TilemapBuffer+0x002

	THUMB_FUNC_END sub_8043100

	THUMB_FUNC_START sub_8043164
sub_8043164: @ 0x08043164
	push {r4, r5, lr}
	ldr r5, _080431A8  @ gUnknown_0203DA88
	movs r4, #5
_0804316A:
	adds r0, r5, #0
	movs r1, #0xc
	bl InitText
	adds r5, #8
	subs r4, #1
	cmp r4, #0
	bge _0804316A
	ldr r5, _080431AC  @ gLinkArenaSt+0x0C
	movs r4, #0xa
_0804317E:
	adds r0, r5, #0
	movs r1, #0xc
	bl InitText
	adds r5, #8
	subs r4, #1
	cmp r4, #0
	bge _0804317E
	ldr r5, _080431B0  @ gUnknown_0203DD0C
	movs r4, #1
_08043192:
	adds r0, r5, #0
	movs r1, #0x18
	bl InitText
	adds r5, #8
	subs r4, #1
	cmp r4, #0
	bge _08043192
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080431A8: .4byte gUnknown_0203DA88
_080431AC: .4byte gLinkArenaSt+0x0C
_080431B0: .4byte gUnknown_0203DD0C

	THUMB_FUNC_END sub_8043164

	THUMB_FUNC_START sub_80431B4
sub_80431B4: @ 0x080431B4
	push {r4, r5, lr}
	sub sp, #8
	adds r5, r0, #0
	ldr r1, _08043208  @ gUnknown_080D9D4D
	mov r0, sp
	movs r2, #8
	bl memcpy
	movs r1, #0
	movs r4, #4
	adds r0, r5, #0
	adds r0, #0x26
_080431CC:
	strh r1, [r0]
	subs r0, #2
	subs r4, #1
	cmp r4, #0
	bge _080431CC
	movs r4, #0
_080431D8:
	cmp r4, #4
	beq _080431FA
	adds r0, r5, #0
	adds r0, #0x28
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0
	beq _080431FA
	mov r1, sp
	adds r0, r1, r4
	ldrb r1, [r0]
	movs r0, #0xff
	lsls r0, r0, #8
	orrs r1, r0
	adds r0, r5, #0
	bl UnitAddItem
_080431FA:
	adds r4, #1
	cmp r4, #7
	ble _080431D8
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08043208: .4byte gUnknown_080D9D4D

	THUMB_FUNC_END sub_80431B4

	THUMB_FUNC_START SioPlaySoundEffect
SioPlaySoundEffect: @ 0x0804320C
	push {r4, lr}
	sub sp, #8
	adds r4, r0, #0
	ldr r1, _0804323C  @ gUnknown_080D9D56
	mov r0, sp
	movs r2, #8
	bl memcpy
	ldr r0, _08043240  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08043232
	lsls r0, r4, #1
	add r0, sp
	ldrh r0, [r0]
	bl m4aSongNumStart
_08043232:
	add sp, #8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804323C: .4byte gUnknown_080D9D56
_08043240: .4byte gPlaySt

	THUMB_FUNC_END SioPlaySoundEffect
