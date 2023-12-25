	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	THUMB_FUNC_START sub_8044C54
sub_8044C54: @ 0x08044C54
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	ldr r4, _08044CD4  @ gKeyStatusPtr
	ldr r0, [r4]
	ldrh r1, [r0, #6]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08044C72
	adds r0, r5, #0
	movs r1, #0
	adds r2, r6, #0
	bl sub_80449E8
_08044C72:
	ldr r0, [r4]
	ldrh r1, [r0, #6]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08044C88
	adds r0, r5, #0
	movs r1, #1
	adds r2, r6, #0
	bl sub_80449E8
_08044C88:
	ldr r0, [r4]
	ldrh r1, [r0, #6]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _08044C9E
	adds r0, r5, #0
	movs r1, #2
	adds r2, r6, #0
	bl sub_80449E8
_08044C9E:
	ldr r0, [r4]
	ldrh r1, [r0, #6]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _08044CB4
	adds r0, r5, #0
	movs r1, #3
	adds r2, r6, #0
	bl sub_80449E8
_08044CB4:
	ldr r0, [r4]
	ldrh r1, [r0, #8]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08044DAA
	adds r0, r6, #0
	adds r0, #0x3e
	ldrb r0, [r0]
	cmp r0, #7
	bhi _08044DAA
	lsls r0, r0, #2
	ldr r1, _08044CD8  @ _08044CDC
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08044CD4: .4byte gKeyStatusPtr
_08044CD8: .4byte _08044CDC
_08044CDC: @ jump table
	.4byte _08044CFC @ case 0
	.4byte _08044D30 @ case 1
	.4byte _08044D4C @ case 2
	.4byte _08044D72 @ case 3
	.4byte _08044D06 @ case 4
	.4byte _08044D10 @ case 5
	.4byte _08044D1A @ case 6
	.4byte _08044D22 @ case 7
_08044CFC:
	adds r0, r5, #0
	adds r1, r6, #0
	bl TacticianTryAppendChar
	b _08044DAA
_08044D06:
	adds r0, r5, #0
	adds r1, r6, #0
	bl TacticianTryDeleteChar
	b _08044DAA
_08044D10:
	adds r0, r5, #0
	adds r1, r6, #0
	bl SaveTactician
	b _08044DAA
_08044D1A:
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #1
	b _08044D28
_08044D22:
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #2
_08044D28:
	movs r3, #0
	bl sub_8044B78
	b _08044DAA
_08044D30:
	adds r4, r5, #0
	adds r4, #0x30
	ldrb r0, [r4]
	cmp r0, #0
	beq _08044D6A
	movs r0, #2
	bl SioPlaySoundEffect
	movs r0, #0
	strb r0, [r4]
	adds r1, r5, #0
	adds r1, #0x39
	strb r0, [r1]
	b _08044E88
_08044D4C:
	adds r4, r5, #0
	adds r4, #0x30
	ldrb r0, [r4]
	cmp r0, #1
	beq _08044D6A
	movs r0, #2
	bl SioPlaySoundEffect
	movs r1, #0
	movs r0, #1
	strb r0, [r4]
	adds r0, r5, #0
	adds r0, #0x39
	strb r1, [r0]
	b _08044E88
_08044D6A:
	movs r0, #0
	bl SioPlaySoundEffect
	b _08044DAA
_08044D72:
	adds r4, r5, #0
	adds r4, #0x30
	ldrb r0, [r4]
	subs r0, #2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bls _08044DA4
	movs r0, #2
	bl SioPlaySoundEffect
	movs r0, #2
	strb r0, [r4]
	adds r0, r5, #0
	adds r0, #0x32
	ldrb r0, [r0]
	cmp r0, #0
	beq _08044D9A
	movs r0, #3
	strb r0, [r4]
_08044D9A:
	adds r1, r5, #0
	adds r1, #0x39
	movs r0, #0
	strb r0, [r1]
	b _08044E88
_08044DA4:
	movs r0, #0
	bl SioPlaySoundEffect
_08044DAA:
	ldr r0, _08044DC4  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08044DF2
	adds r0, r5, #0
	adds r0, #0x39
	ldrb r7, [r0]
	adds r4, r0, #0
	b _08044DDA
	.align 2, 0
_08044DC4: .4byte gKeyStatusPtr
_08044DC8:
	ldrb r2, [r4]
	adds r0, r5, #0
	adds r1, r6, #0
	movs r3, #1
	bl sub_8044B78
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08044DF2
_08044DDA:
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	ldrb r0, [r4]
	movs r1, #3
	bl __umodsi3
	strb r0, [r4]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r7, r0
	bne _08044DC8
_08044DF2:
	ldr r4, _08044E94  @ gKeyStatusPtr
	ldr r0, [r4]
	ldrh r1, [r0, #8]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08044E0A
	adds r0, r5, #0
	adds r1, r6, #0
	bl TacticianTryDeleteChar
_08044E0A:
	ldr r0, [r4]
	ldrh r1, [r0, #8]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _08044E20
	movs r0, #3
	bl SioPlaySoundEffect
	movs r0, #5
	strh r0, [r5, #0x34]
_08044E20:
	ldr r0, [r4]
	ldrh r1, [r0, #8]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _08044E9C
	movs r0, #2
	bl SioPlaySoundEffect
	adds r1, r5, #0
	adds r1, #0x30
	ldrb r0, [r1]
	adds r2, r0, #1
	strb r2, [r1]
	lsls r0, r2, #0x18
	lsrs r0, r0, #0x18
	adds r3, r1, #0
	cmp r0, #2
	bne _08044E54
	adds r0, r5, #0
	adds r0, #0x32
	ldrb r0, [r0]
	cmp r0, #0
	beq _08044E54
	adds r0, r2, #1
	strb r0, [r3]
_08044E54:
	adds r2, r3, #0
	ldrb r0, [r2]
	movs r1, #3
	ands r0, r1
	strb r0, [r2]
	ldr r0, [r5, #0x30]
	ldr r1, _08044E98  @ 0x00FF00FF
	ands r0, r1
	cmp r0, #3
	bne _08044E6C
	movs r0, #0
	strb r0, [r2]
_08044E6C:
	ldrb r1, [r3]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r6, r0
	ldr r0, [r0]
	ldrb r0, [r0]
	cmp r0, #0
	bne _08044E88
	adds r0, r5, #0
	movs r1, #2
	adds r2, r6, #0
	bl sub_80449E8
_08044E88:
	adds r0, r5, #0
	movs r1, #1
	bl Proc_Goto
	b _08044ED0
	.align 2, 0
_08044E94: .4byte gKeyStatusPtr
_08044E98: .4byte 0x00FF00FF
_08044E9C:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08044ED0
	adds r0, r5, #0
	adds r0, #0x38
	ldrb r0, [r0]
	cmp r0, #0
	beq _08044EB8
	adds r0, r5, #0
	adds r1, r6, #0
	bl TacticianTryDeleteChar
	b _08044ED0
_08044EB8:
	bl CheckInLinkArena
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08044ED0
	movs r0, #1
	bl SioPlaySoundEffect
	adds r0, r5, #0
	movs r1, #3
	bl Proc_Goto
_08044ED0:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8044C54

	THUMB_FUNC_START Tactician_Loop
Tactician_Loop: @ 0x08044ED8
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	sub sp, #8
	add r7, sp, #8
	adds r4, r0, #0
	mov r8, sp
	movs r0, #0x3c
	adds r0, r0, r4
	mov r9, r0
	ldrb r0, [r0]
	adds r0, #4
	lsrs r0, r0, #2
	lsls r0, r0, #2
	mov r1, sp
	subs r1, r1, r0
	mov sp, r1
	add r6, sp, #8
	movs r2, #0x34
	ldrsh r0, [r4, r2]
	bl GetTacticianTextConf
	adds r5, r0, #0
	ldrh r0, [r4, #0x34]
	strh r0, [r4, #0x36]
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_8044C54
	movs r0, #0x36
	ldrsh r1, [r4, r0]
	movs r2, #0x34
	ldrsh r0, [r4, r2]
	cmp r1, r0
	beq _08044F26
	movs r0, #3
	bl SioPlaySoundEffect
_08044F26:
	movs r1, #0x34
	ldrsh r0, [r4, r1]
	bl GetTacticianTextConf
	adds r5, r0, #0
	adds r0, r4, #0
	adds r0, #0x3d
	adds r1, r6, #0
	bl SioStrCpy
	mov r2, r9
	ldrb r0, [r2]
	subs r0, #1
	adds r0, r6, r0
	movs r1, #0
	strb r1, [r0]
	adds r0, r6, #0
	bl StrLen
	lsls r1, r0, #3
	subs r3, r1, r0
	ldr r6, [r4, #0x2c]
	ldrh r0, [r5, #0x30]
	subs r1, r0, #4
	ldrh r0, [r5, #0x32]
	adds r2, r0, #1
	adds r0, r5, #0
	adds r0, #0x34
	ldrb r0, [r0]
	str r0, [sp]
	adds r4, #0x30
	ldrb r0, [r4]
	cmp r0, #1
	bls _08044F6C
	movs r0, #2
_08044F6C:
	str r0, [sp, #4]
	adds r0, r6, #0
	bl sub_804CDD0
	mov sp, r8
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END Tactician_Loop

	THUMB_FUNC_START sub_8044F84
sub_8044F84: @ 0x08044F84
	push {lr}
	ldr r0, _08044FAC  @ 0x04000006
	ldrh r0, [r0]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0xa0
	bhi _08044FD0
	cmp r0, #0x27
	bhi _08044FB8
	ldr r1, _08044FB0  @ 0x04000050
	movs r2, #0x84
	lsls r2, r2, #4
	adds r0, r2, #0
	strh r0, [r1]
	adds r1, #2
	ldr r2, _08044FB4  @ 0x00000F08
	adds r0, r2, #0
	strh r0, [r1]
	b _08044FD0
	.align 2, 0
_08044FAC: .4byte 0x04000006
_08044FB0: .4byte 0x04000050
_08044FB4: .4byte 0x00000F08
_08044FB8:
	ldr r1, _08044FD4  @ 0x04000050
	ldr r2, _08044FD8  @ 0x00000442
	adds r0, r2, #0
	strh r0, [r1]
	ldr r2, _08044FDC  @ 0x04000052
	ldr r0, _08044FE0  @ gUnknown_03001810
	ldrb r1, [r0]
	movs r0, #0xf
	subs r0, r0, r1
	lsls r0, r0, #8
	adds r1, r1, r0
	strh r1, [r2]
_08044FD0:
	pop {r0}
	bx r0
	.align 2, 0
_08044FD4: .4byte 0x04000050
_08044FD8: .4byte 0x00000442
_08044FDC: .4byte 0x04000052
_08044FE0: .4byte gUnknown_03001810

	THUMB_FUNC_END sub_8044F84

	THUMB_FUNC_START sub_8044FE4
sub_8044FE4: @ 0x08044FE4
	push {lr}
	adds r0, #0x3a
	movs r1, #0
	strb r1, [r0]
	ldr r0, _08044FF8  @ sub_8044F84
	bl SetPrimaryHBlankHandler
	pop {r0}
	bx r0
	.align 2, 0
_08044FF8: .4byte sub_8044F84

	THUMB_FUNC_END sub_8044FE4

	THUMB_FUNC_START sub_8044FFC
sub_8044FFC: @ 0x08044FFC
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	ldr r4, _08045038  @ gUnknown_03001810
	adds r5, r6, #0
	adds r5, #0x3a
	ldrb r3, [r5]
	movs r0, #8
	str r0, [sp]
	movs r0, #0
	movs r1, #0xf
	movs r2, #0
	bl Interpolate
	strb r0, [r4]
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #8
	bls _0804502E
	adds r0, r6, #0
	bl Proc_Break
_0804502E:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08045038: .4byte gUnknown_03001810

	THUMB_FUNC_END sub_8044FFC

	THUMB_FUNC_START sub_804503C
sub_804503C: @ 0x0804503C
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r2, r4, #0
	adds r2, #0x31
	ldrb r0, [r2]
	adds r0, #1
	movs r5, #0
	movs r1, #1
	ands r0, r1
	strb r0, [r2]
	adds r0, r4, #0
	bl sub_8044614
	movs r0, #2
	bl BG_EnableSyncByMask
	adds r4, #0x3a
	strb r5, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_804503C

	THUMB_FUNC_START sub_8045068
sub_8045068: @ 0x08045068
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	ldr r4, _080450A8  @ gUnknown_03001810
	adds r5, r6, #0
	adds r5, #0x3a
	ldrb r3, [r5]
	movs r0, #8
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0xf
	bl Interpolate
	strb r0, [r4]
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #8
	bls _080450A0
	movs r0, #0
	bl SetPrimaryHBlankHandler
	adds r0, r6, #0
	bl Proc_Break
_080450A0:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080450A8: .4byte gUnknown_03001810

	THUMB_FUNC_END sub_8045068

	THUMB_FUNC_START NameSelect_DrawName
NameSelect_DrawName: @ 0x080450AC
	push {r4, lr}
	adds r0, #0x3b
	movs r1, #1
	strb r1, [r0]
	bl sub_804D80C
	ldr r4, _080450FC  @ Texts_0203DAB0
	adds r0, r4, #0
	bl ClearText
	ldr r0, _08045100  @ 0x00000141
	bl GetStringFromIndex
	adds r1, r0, #0
	adds r0, r4, #0
	bl Text_DrawString
	adds r0, r4, #0
	movs r1, #0x26
	bl Text_SetCursor
	movs r0, #0xa3
	lsls r0, r0, #1
	bl GetStringFromIndex
	adds r1, r0, #0
	adds r0, r4, #0
	bl Text_DrawString
	ldr r1, _08045104  @ gBG0TilemapBuffer+0x316
	adds r0, r4, #0
	bl PutText
	movs r0, #1
	bl BG_EnableSyncByMask
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080450FC: .4byte Texts_0203DAB0
_08045100: .4byte 0x00000141
_08045104: .4byte gBG0TilemapBuffer+0x316

	THUMB_FUNC_END NameSelect_DrawName

	THUMB_FUNC_START sub_8045108
sub_8045108: @ 0x08045108
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r0, #0x40
	movs r1, #0x58
	bl sub_804D834
	ldr r0, _08045198  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _08045136
	adds r1, r5, #0
	adds r1, #0x3b
	ldrb r0, [r1]
	cmp r0, #1
	bne _08045136
	movs r0, #0
	strb r0, [r1]
	movs r0, #3
	bl SioPlaySoundEffect
_08045136:
	ldr r0, _08045198  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0x10
	ands r0, r1
	adds r4, r5, #0
	adds r4, #0x3b
	cmp r0, #0
	beq _08045158
	ldrb r0, [r4]
	cmp r0, #0
	bne _08045158
	movs r0, #1
	strb r0, [r4]
	movs r0, #3
	bl SioPlaySoundEffect
_08045158:
	ldrb r1, [r4]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, #0x50
	movs r1, #0x60
	bl DisplayUiHand
	ldr r0, _08045198  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080451A0
	movs r0, #1
	bl SioPlaySoundEffect
	ldr r0, _0804519C  @ gBG0TilemapBuffer+0x316
	movs r1, #0xc
	movs r2, #2
	movs r3, #0
	bl TileMap_FillRect
	movs r0, #1
	bl BG_EnableSyncByMask
	adds r0, r5, #0
	bl Proc_Break
	b _080451E6
	.align 2, 0
_08045198: .4byte gKeyStatusPtr
_0804519C: .4byte gBG0TilemapBuffer+0x316
_080451A0:
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080451E6
	ldrb r0, [r4]
	cmp r0, #0
	bne _080451C8
	movs r0, #2
	bl SioPlaySoundEffect
	ldr r1, _080451C4  @ gUnknown_0203DD24
	movs r0, #1
	strb r0, [r1]
	adds r0, r5, #0
	movs r1, #2
	bl Proc_Goto
	b _080451CE
	.align 2, 0
_080451C4: .4byte gUnknown_0203DD24
_080451C8:
	movs r0, #1
	bl SioPlaySoundEffect
_080451CE:
	ldr r0, _080451EC  @ gBG0TilemapBuffer+0x316
	movs r1, #0xc
	movs r2, #2
	movs r3, #0
	bl TileMap_FillRect
	movs r0, #1
	bl BG_EnableSyncByMask
	adds r0, r5, #0
	bl Proc_Break
_080451E6:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080451EC: .4byte gBG0TilemapBuffer+0x316

	THUMB_FUNC_END sub_8045108

	THUMB_FUNC_START sub_80451F0
sub_80451F0: @ 0x080451F0
	push {lr}
	bl EndMuralBackground
	bl CheckInLinkArena
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08045204
	bl nullsub_13
_08045204:
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80451F0

.align 2, 0
