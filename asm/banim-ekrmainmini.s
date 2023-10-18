	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	THUMB_FUNC_START sub_805A3DC
sub_805A3DC: @ 0x0805A3DC
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r4, r1, #0
	cmp r4, #0
	bne _0805A3E8
	b _0805A576
_0805A3E8:
	ldrh r0, [r4, #0xc]
	movs r5, #0xf0
	lsls r5, r5, #8
	ands r5, r0
	cmp r5, #0
	bne _0805A3F6
	b _0805A576
_0805A3F6:
	movs r0, #0x80
	lsls r0, r0, #5
	ands r0, r5
	cmp r0, #0
	bne _0805A402
	b _0805A538
_0805A402:
	ldrb r0, [r4, #0x14]
	cmp r0, #0
	bne _0805A40A
	b _0805A52E
_0805A40A:
	adds r0, r4, r0
	ldrb r0, [r0, #0x14]
	cmp r0, #0x32
	bls _0805A414
	b _0805A526
_0805A414:
	lsls r0, r0, #2
	ldr r1, _0805A420  @ _0805A424
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0805A420: .4byte _0805A424
_0805A424: @ jump table
	.4byte _0805A526 @ case 0
	.4byte _0805A4F0 @ case 1
	.4byte _0805A4F0 @ case 2
	.4byte _0805A508 @ case 3
	.4byte _0805A508 @ case 4
	.4byte _0805A4F8 @ case 5
	.4byte _0805A526 @ case 6
	.4byte _0805A526 @ case 7
	.4byte _0805A526 @ case 8
	.4byte _0805A526 @ case 9
	.4byte _0805A526 @ case 10
	.4byte _0805A526 @ case 11
	.4byte _0805A526 @ case 12
	.4byte _0805A510 @ case 13
	.4byte _0805A518 @ case 14
	.4byte _0805A526 @ case 15
	.4byte _0805A526 @ case 16
	.4byte _0805A526 @ case 17
	.4byte _0805A526 @ case 18
	.4byte _0805A526 @ case 19
	.4byte _0805A526 @ case 20
	.4byte _0805A526 @ case 21
	.4byte _0805A526 @ case 22
	.4byte _0805A526 @ case 23
	.4byte _0805A520 @ case 24
	.4byte _0805A526 @ case 25
	.4byte _0805A526 @ case 26
	.4byte _0805A526 @ case 27
	.4byte _0805A526 @ case 28
	.4byte _0805A526 @ case 29
	.4byte _0805A526 @ case 30
	.4byte _0805A526 @ case 31
	.4byte _0805A526 @ case 32
	.4byte _0805A526 @ case 33
	.4byte _0805A526 @ case 34
	.4byte _0805A526 @ case 35
	.4byte _0805A526 @ case 36
	.4byte _0805A526 @ case 37
	.4byte _0805A526 @ case 38
	.4byte _0805A526 @ case 39
	.4byte _0805A526 @ case 40
	.4byte _0805A526 @ case 41
	.4byte _0805A526 @ case 42
	.4byte _0805A526 @ case 43
	.4byte _0805A526 @ case 44
	.4byte _0805A526 @ case 45
	.4byte _0805A526 @ case 46
	.4byte _0805A526 @ case 47
	.4byte _0805A526 @ case 48
	.4byte _0805A526 @ case 49
	.4byte _0805A526 @ case 50
_0805A4F0:
	adds r0, r4, #0
	bl sub_805A580
	b _0805A526
_0805A4F8:
	adds r0, r4, #0
	bl GetAISLayerId
	cmp r0, #0
	bne _0805A508
	adds r0, r4, #0
	bl ExecEfxop
_0805A508:
	ldr r0, [r4, #0x20]
	adds r0, #4
	str r0, [r4, #0x20]
	b _0805A526
_0805A510:
	adds r0, r4, #0
	bl sub_805A5A8
	b _0805A526
_0805A518:
	adds r0, r4, #0
	bl ExecEfxop
	b _0805A526
_0805A520:
	adds r0, r4, #0
	bl sub_805A580
_0805A526:
	ldrb r0, [r4, #0x14]
	subs r0, #1
	strb r0, [r4, #0x14]
	b _0805A402
_0805A52E:
	ldrh r1, [r4, #0xc]
	movs r0, #0xe7
	lsls r0, r0, #8
	ands r0, r1
	strh r0, [r4, #0xc]
_0805A538:
	movs r0, #0x80
	lsls r0, r0, #6
	ands r0, r5
	cmp r0, #0
	beq _0805A568
	adds r0, r4, #0
	bl GetAISLayerId
	cmp r0, #0
	bne _0805A55E
	ldr r1, [r6, #0x2c]
	ldr r0, [r4, #0x28]
	cmp r1, r0
	beq _0805A55E
	adds r0, r4, #0
	bl RegisterAISSheetGraphics
	ldr r0, [r4, #0x28]
	str r0, [r6, #0x2c]
_0805A55E:
	ldrh r1, [r4, #0xc]
	movs r0, #0xd7
	lsls r0, r0, #8
	ands r0, r1
	strh r0, [r4, #0xc]
_0805A568:
	movs r0, #0x80
	lsls r0, r0, #7
	ands r5, r0
	cmp r5, #0
	beq _0805A576
	ldr r0, _0805A57C  @ 0x0000FFFF
	strh r0, [r4, #0xe]
_0805A576:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0805A57C: .4byte 0x0000FFFF

	THUMB_FUNC_END sub_805A3DC

	THUMB_FUNC_START sub_805A580
sub_805A580: @ 0x0805A580
	push {lr}
	adds r1, r0, #0
	ldr r0, _0805A5A4  @ 0x0000FFFE
	strh r0, [r1, #0xe]
	ldrh r0, [r1, #0x10]
	movs r2, #8
	ands r2, r0
	cmp r2, #0
	beq _0805A59E
	strh r2, [r1, #0x10]
	movs r0, #0
	strh r0, [r1, #0xe]
	ldr r0, [r1, #0x20]
	adds r0, #4
	str r0, [r1, #0x20]
_0805A59E:
	pop {r0}
	bx r0
	.align 2, 0
_0805A5A4: .4byte 0x0000FFFE

	THUMB_FUNC_END sub_805A580

	THUMB_FUNC_START sub_805A5A8
sub_805A5A8: @ 0x0805A5A8
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r5, [r6, #0x44]
	ldr r4, _0805A600  @ banim_data
	bl GetAISLayerId
	cmp r0, #0
	bne _0805A5FA
	ldr r0, _0805A604  @ BanimDefaultModeConfig
	ldrb r1, [r0, #0x18]
	movs r2, #6
	ldrsh r0, [r5, r2]
	lsls r0, r0, #5
	adds r0, r0, r4
	ldr r0, [r0, #0xc]
	ldr r2, [r5, #0x14]
	ldr r3, [r5, #0x18]
	ldr r4, [r5, #0x28]
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r1, [r1]
	adds r1, r4, r1
	ldr r0, [r1, #4]
	str r0, [r2, #0x28]
	ldr r4, [r2, #0x30]
	ldr r1, [r1, #8]
	adds r4, r4, r1
	str r4, [r2, #0x3c]
	ldr r4, [r3, #0x30]
	ldr r0, _0805A608  @ 0x000057F0
	adds r4, r4, r0
	str r4, [r3, #0x3c]
	ldr r1, [r5, #0x2c]
	ldr r0, [r6, #0x28]
	cmp r1, r0
	beq _0805A5FA
	adds r0, r6, #0
	bl NewEkrChienCHR
	ldr r0, [r6, #0x28]
	str r0, [r5, #0x2c]
_0805A5FA:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0805A600: .4byte banim_data
_0805A604: .4byte BanimDefaultModeConfig
_0805A608: .4byte 0x000057F0

	THUMB_FUNC_END sub_805A5A8

	THUMB_FUNC_START sub_805A60C
sub_805A60C: @ 0x0805A60C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, _0805A694  @ banim_data
	mov r9, r0
	ldr r2, _0805A698  @ BanimDefaultModeConfig
	ldrh r1, [r4, #0xa]
	lsls r1, r1, #2
	adds r0, r1, r2
	ldrb r5, [r0]
	adds r0, r1, #1
	adds r0, r0, r2
	ldrb r0, [r0]
	mov r8, r0
	adds r0, r1, #2
	adds r0, r0, r2
	ldrb r6, [r0]
	adds r1, #3
	adds r1, r1, r2
	ldrb r1, [r1]
	mov sl, r1
	movs r1, #6
	ldrsh r0, [r4, r1]
	lsls r0, r0, #5
	add r0, r9
	ldr r0, [r0, #0x10]
	ldr r1, [r4, #0x28]
	bl LZ77UnCompWram
	movs r2, #6
	ldrsh r0, [r4, r2]
	lsls r0, r0, #5
	mov r3, r9
	adds r1, r0, r3
	ldr r2, [r1, #0xc]
	ldr r3, [r4, #0x28]
	ldr r7, _0805A69C  @ BanimScr_DefaultAnim
	cmp r5, #0xff
	beq _0805A66A
	lsls r0, r5, #2
	adds r0, r0, r2
	ldr r0, [r0]
	adds r7, r3, r0
_0805A66A:
	ldr r0, _0805A69C  @ BanimScr_DefaultAnim
	str r0, [sp]
	cmp r6, #0xff
	beq _0805A67C
	lsls r0, r6, #2
	adds r0, r0, r2
	ldr r0, [r0]
	adds r3, r3, r0
	str r3, [sp]
_0805A67C:
	ldrh r0, [r4, #0xc]
	cmp r0, #0
	bne _0805A6A4
	ldr r5, [r4, #0x24]
	ldr r0, [r1, #0x18]
	adds r1, r5, #0
	bl LZ77UnCompWram
	ldr r2, _0805A6A0  @ 0x000057F0
	adds r1, r5, r2
	b _0805A6B2
	.align 2, 0
_0805A694: .4byte banim_data
_0805A698: .4byte BanimDefaultModeConfig
_0805A69C: .4byte BanimScr_DefaultAnim
_0805A6A0: .4byte 0x000057F0
_0805A6A4:
	ldr r5, [r4, #0x24]
	ldr r0, [r1, #0x14]
	adds r1, r5, #0
	bl LZ77UnCompWram
	ldr r3, _0805A70C  @ 0x000057F0
	adds r1, r5, r3
_0805A6B2:
	movs r0, #1
	str r0, [r1]
	mov r1, r8
	adds r0, r7, #0
	bl AnimCreate
	adds r2, r0, #0
	ldr r0, [r4, #0x24]
	str r0, [r2, #0x30]
	ldrh r0, [r4, #2]
	movs r5, #0
	strh r0, [r2, #2]
	ldrh r0, [r4, #4]
	strh r0, [r2, #4]
	ldrh r0, [r4, #0x10]
	lsls r0, r0, #0xc
	movs r1, #0x80
	lsls r1, r1, #4
	adds r6, r1, #0
	orrs r0, r6
	ldrh r1, [r4, #0xe]
	orrs r0, r1
	strh r0, [r2, #8]
	ldrh r0, [r4, #0xc]
	lsls r0, r0, #9
	movs r3, #0x80
	lsls r3, r3, #3
	adds r1, r3, #0
	orrs r0, r1
	ldrh r1, [r2, #0xc]
	orrs r0, r1
	strh r0, [r2, #0xc]
	strh r5, [r2, #0xe]
	ldrh r0, [r4, #0xa]
	strb r0, [r2, #0x12]
	ldr r0, [r4, #0x1c]
	str r0, [r2, #0x2c]
	str r2, [r4, #0x14]
	str r4, [r2, #0x44]
	movs r1, #6
	ldrsh r0, [r4, r1]
	cmp r0, #0xc4
	bne _0805A710
	str r5, [r4, #0x18]
	b _0805A752
	.align 2, 0
_0805A70C: .4byte 0x000057F0
_0805A710:
	mov r1, sl
	ldr r0, [sp]
	bl AnimCreate
	adds r2, r0, #0
	ldr r0, [r4, #0x24]
	str r0, [r2, #0x30]
	ldrh r0, [r4, #2]
	strh r0, [r2, #2]
	ldrh r0, [r4, #4]
	strh r0, [r2, #4]
	ldrh r0, [r4, #0x10]
	lsls r0, r0, #0xc
	orrs r0, r6
	ldrh r1, [r4, #0xe]
	orrs r0, r1
	strh r0, [r2, #8]
	ldrh r0, [r4, #0xc]
	lsls r0, r0, #9
	movs r3, #0xa0
	lsls r3, r3, #3
	adds r1, r3, #0
	orrs r0, r1
	ldrh r1, [r2, #0xc]
	orrs r0, r1
	strh r0, [r2, #0xc]
	strh r5, [r2, #0xe]
	ldrh r0, [r4, #0xa]
	strb r0, [r2, #0x12]
	ldr r0, [r4, #0x1c]
	str r0, [r2, #0x2c]
	str r2, [r4, #0x18]
	str r4, [r2, #0x44]
_0805A752:
	movs r1, #6
	ldrsh r0, [r4, r1]
	lsls r0, r0, #5
	add r0, r9
	ldr r0, [r0, #0x1c]
	ldr r1, [r4, #0x20]
	bl LZ77UnCompWram
	movs r2, #8
	ldrsh r1, [r4, r2]
	movs r0, #1
	negs r0, r0
	cmp r1, r0
	beq _0805A77E
	adds r0, r1, #0
	lsls r0, r0, #4
	ldr r1, _0805A7AC  @ character_battle_animation_palette_table
	adds r0, r0, r1
	ldr r0, [r0, #0xc]
	ldr r1, [r4, #0x20]
	bl LZ77UnCompWram
_0805A77E:
	ldrb r1, [r4, #1]
	lsls r1, r1, #5
	ldr r0, [r4, #0x20]
	adds r0, r0, r1
	ldrh r1, [r4, #0x10]
	lsls r1, r1, #5
	ldr r2, _0805A7B0  @ gPaletteBuffer+0x200
	adds r1, r1, r2
	movs r2, #8
	bl CpuFastSet
	bl EnablePaletteSync
	movs r0, #0
	str r0, [r4, #0x2c]
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805A7AC: .4byte character_battle_animation_palette_table
_0805A7B0: .4byte gPaletteBuffer+0x200

	THUMB_FUNC_END sub_805A60C

	THUMB_FUNC_START sub_805A7B4
sub_805A7B4: @ 0x0805A7B4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	adds r7, r0, #0
	ldr r0, _0805A82C  @ banim_data
	mov sl, r0
	ldr r2, _0805A830  @ BanimDefaultModeConfig
	ldrh r0, [r7, #0xa]
	lsls r0, r0, #2
	adds r1, r0, r2
	ldrb r4, [r1]
	adds r0, #2
	adds r0, r0, r2
	ldrb r5, [r0]
	movs r1, #6
	ldrsh r0, [r7, r1]
	lsls r0, r0, #5
	add r0, sl
	ldr r0, [r0, #0x10]
	ldr r1, [r7, #0x28]
	bl LZ77UnCompWram
	movs r2, #6
	ldrsh r0, [r7, r2]
	lsls r0, r0, #5
	mov r2, sl
	adds r1, r0, r2
	ldr r2, [r1, #0xc]
	ldr r3, [r7, #0x28]
	ldr r0, _0805A834  @ BanimScr_DefaultAnim
	mov r8, r0
	cmp r4, #0xff
	beq _0805A804
	lsls r0, r4, #2
	adds r0, r0, r2
	ldr r0, [r0]
	adds r0, r0, r3
	mov r8, r0
_0805A804:
	ldr r0, _0805A834  @ BanimScr_DefaultAnim
	mov r9, r0
	cmp r5, #0xff
	beq _0805A816
	lsls r0, r5, #2
	adds r0, r0, r2
	ldr r0, [r0]
	adds r3, r3, r0
	mov r9, r3
_0805A816:
	ldrh r0, [r7, #0xc]
	cmp r0, #0
	bne _0805A83C
	ldr r4, [r7, #0x24]
	ldr r0, [r1, #0x18]
	adds r1, r4, #0
	bl LZ77UnCompWram
	ldr r2, _0805A838  @ 0x000057F0
	adds r1, r4, r2
	b _0805A84A
	.align 2, 0
_0805A82C: .4byte banim_data
_0805A830: .4byte BanimDefaultModeConfig
_0805A834: .4byte BanimScr_DefaultAnim
_0805A838: .4byte 0x000057F0
_0805A83C:
	ldr r4, [r7, #0x24]
	ldr r0, [r1, #0x14]
	adds r1, r4, #0
	bl LZ77UnCompWram
	ldr r0, _0805A924  @ 0x000057F0
	adds r1, r4, r0
_0805A84A:
	movs r0, #1
	str r0, [r1]
	ldr r6, [r7, #0x14]
	mov r1, r8
	str r1, [r6, #0x24]
	str r1, [r6, #0x20]
	ldr r0, [r7, #0x24]
	str r0, [r6, #0x30]
	ldrh r0, [r7, #2]
	movs r5, #0
	movs r3, #0
	strh r0, [r6, #2]
	ldrh r0, [r7, #4]
	strh r0, [r6, #4]
	ldrh r0, [r7, #0x10]
	lsls r0, r0, #0xc
	movs r2, #0x80
	lsls r2, r2, #4
	adds r4, r2, #0
	orrs r0, r4
	ldrh r1, [r7, #0xe]
	orrs r0, r1
	strh r0, [r6, #8]
	ldrh r1, [r6, #0xc]
	movs r2, #0xe0
	lsls r2, r2, #3
	adds r0, r2, #0
	ands r0, r1
	strh r0, [r6, #0xc]
	strh r3, [r6, #0x10]
	strh r3, [r6, #6]
	strh r3, [r6, #0xe]
	ldrh r0, [r7, #0xa]
	strb r0, [r6, #0x12]
	ldr r0, [r7, #0x1c]
	str r0, [r6, #0x2c]
	strb r5, [r6, #0x14]
	str r6, [r7, #0x14]
	ldr r6, [r7, #0x18]
	mov r0, r9
	str r0, [r6, #0x24]
	str r0, [r6, #0x20]
	ldr r0, [r7, #0x24]
	str r0, [r6, #0x30]
	ldrh r0, [r7, #2]
	strh r0, [r6, #2]
	ldrh r0, [r7, #4]
	strh r0, [r6, #4]
	ldrh r0, [r7, #0x10]
	lsls r0, r0, #0xc
	orrs r0, r4
	ldrh r1, [r7, #0xe]
	orrs r0, r1
	strh r0, [r6, #8]
	ldrh r0, [r6, #0xc]
	ands r2, r0
	strh r2, [r6, #0xc]
	strh r3, [r6, #0x10]
	strh r3, [r6, #6]
	strh r3, [r6, #0xe]
	ldrh r0, [r7, #0xa]
	strb r0, [r6, #0x12]
	ldr r0, [r7, #0x1c]
	str r0, [r6, #0x2c]
	strb r5, [r6, #0x14]
	str r6, [r7, #0x18]
	movs r1, #6
	ldrsh r0, [r7, r1]
	lsls r0, r0, #5
	add r0, sl
	ldr r0, [r0, #0x1c]
	ldr r1, [r7, #0x20]
	bl LZ77UnCompWram
	movs r2, #8
	ldrsh r1, [r7, r2]
	movs r0, #1
	negs r0, r0
	cmp r1, r0
	beq _0805A8FA
	adds r0, r1, #0
	lsls r0, r0, #4
	ldr r2, _0805A928  @ character_battle_animation_palette_table
	adds r0, r0, r2
	ldr r0, [r0, #0xc]
	ldr r1, [r7, #0x20]
	bl LZ77UnCompWram
_0805A8FA:
	ldrb r1, [r7, #1]
	lsls r1, r1, #5
	ldr r0, [r7, #0x20]
	adds r0, r0, r1
	ldrh r1, [r7, #0x10]
	lsls r1, r1, #5
	ldr r2, _0805A92C  @ gPaletteBuffer+0x200
	adds r1, r1, r2
	movs r2, #8
	bl CpuFastSet
	bl EnablePaletteSync
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805A924: .4byte 0x000057F0
_0805A928: .4byte character_battle_animation_palette_table
_0805A92C: .4byte gPaletteBuffer+0x200

	THUMB_FUNC_END sub_805A7B4

	THUMB_FUNC_START sub_805A930
sub_805A930: @ 0x0805A930
	push {lr}
	strh r1, [r0, #6]
	strh r2, [r0, #8]
	bl sub_805A7B4
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_805A930

	THUMB_FUNC_START sub_805A940
sub_805A940: @ 0x0805A940
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	strh r1, [r0, #2]
	strh r2, [r0, #4]
	ldr r2, [r0, #0x14]
	strh r1, [r2, #2]
	ldrh r1, [r0, #4]
	strh r1, [r2, #4]
	ldr r2, [r0, #0x18]
	ldrh r1, [r0, #2]
	strh r1, [r2, #2]
	ldrh r0, [r0, #4]
	strh r0, [r2, #4]
	bx lr

	THUMB_FUNC_END sub_805A940

	THUMB_FUNC_START sub_805A95C
sub_805A95C: @ 0x0805A95C
	lsls r1, r1, #0x10
	ldr r2, [r0, #0x14]
	lsrs r1, r1, #6
	strh r1, [r2, #8]
	ldr r2, [r0, #0x18]
	strh r1, [r2, #8]
	bx lr

	THUMB_FUNC_END sub_805A95C

	THUMB_FUNC_START sub_805A96C
sub_805A96C: @ 0x0805A96C
	push {lr}
	ldr r1, [r0, #0x14]
	ldr r2, [r0, #0x18]
	ldrh r0, [r1, #0xe]
	ldr r1, _0805A984  @ 0x0000FFFE
	cmp r0, r1
	beq _0805A988
	ldrh r0, [r2, #0xe]
	cmp r0, r1
	beq _0805A988
	movs r0, #0
	b _0805A98A
	.align 2, 0
_0805A984: .4byte 0x0000FFFE
_0805A988:
	movs r0, #1
_0805A98A:
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_805A96C

	THUMB_FUNC_START sub_805A990
sub_805A990: @ 0x0805A990
	ldr r3, [r0, #0x14]
	ldrh r1, [r3, #0x10]
	movs r2, #8
	orrs r1, r2
	strh r1, [r3, #0x10]
	ldr r3, [r0, #0x18]
	ldrh r0, [r3, #0x10]
	orrs r2, r0
	strh r2, [r3, #0x10]
	bx lr

	THUMB_FUNC_END sub_805A990

	THUMB_FUNC_START sub_805A9A4
sub_805A9A4: @ 0x0805A9A4
	push {lr}
	ldr r0, [r0, #0x14]
	ldrh r1, [r0, #0xe]
	ldr r0, _0805A9B4  @ 0x0000FFFF
	cmp r1, r0
	bne _0805A9B8
	movs r0, #1
	b _0805A9BA
	.align 2, 0
_0805A9B4: .4byte 0x0000FFFF
_0805A9B8:
	movs r0, #0
_0805A9BA:
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_805A9A4

	THUMB_FUNC_START NewEfxAnimeDrvProc
NewEfxAnimeDrvProc: @ 0x0805A9C0
	push {r4, lr}
	ldr r4, _0805A9D8  @ gpProcEfxAnimeDrv
	ldr r0, _0805A9DC  @ gProc_efxAnimeDrvProc
	movs r1, #4
	bl Proc_Start
	str r0, [r4]
	bl AnimClearAll
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805A9D8: .4byte gpProcEfxAnimeDrv
_0805A9DC: .4byte gProc_efxAnimeDrvProc

	THUMB_FUNC_END NewEfxAnimeDrvProc

	THUMB_FUNC_START EndEfxAnimeDrvProc
EndEfxAnimeDrvProc: @ 0x0805A9E0
	push {lr}
	ldr r0, _0805A9F0  @ gpProcEfxAnimeDrv
	ldr r0, [r0]
	bl Proc_End
	pop {r0}
	bx r0
	.align 2, 0
_0805A9F0: .4byte gpProcEfxAnimeDrv

	THUMB_FUNC_END EndEfxAnimeDrvProc

	THUMB_FUNC_START ExecAllAIS
ExecAllAIS: @ 0x0805A9F4
	push {lr}
	bl AnimUpdateAll
	pop {r0}
	bx r0

	THUMB_FUNC_END ExecAllAIS

	THUMB_FUNC_START NewEkrUnitMainMini
NewEkrUnitMainMini: @ 0x0805AA00
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, _0805AA24  @ ProcScr_ekrUnitMainMini
	movs r1, #4
	bl Proc_Start
	adds r5, r0, #0
	adds r0, r4, #0
	bl sub_805A60C
	str r4, [r5, #0x5c]
	str r5, [r4, #0x34]
	movs r0, #1
	strb r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805AA24: .4byte ProcScr_ekrUnitMainMini

	THUMB_FUNC_END NewEkrUnitMainMini

	THUMB_FUNC_START sub_805AA28
sub_805AA28: @ 0x0805AA28
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x14]
	bl AnimDelete
	ldr r0, [r4, #0x18]
	bl AnimDelete
	movs r0, #0
	str r0, [r4, #0x14]
	str r0, [r4, #0x18]
	ldr r0, [r4, #0x34]
	bl Proc_End
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_805AA28

	THUMB_FUNC_START EkrUnitMainMiniMain
EkrUnitMainMiniMain: @ 0x0805AA4C
	push {r4, lr}
	ldr r4, [r0, #0x5c]
	ldr r1, [r4, #0x14]
	adds r0, r4, #0
	bl sub_805A3DC
	ldr r1, [r4, #0x18]
	adds r0, r4, #0
	bl sub_805A3DC
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END EkrUnitMainMiniMain

	THUMB_FUNC_START sub_805AA68
sub_805AA68: @ 0x0805AA68
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	sub sp, #0xc
	adds r6, r0, #0
	movs r0, #0
	ldrsh r1, [r6, r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	ldr r2, _0805AAD0  @ battle_terrain_table
	adds r0, r0, r2
	mov r8, r0
	movs r0, #6
	ldrsh r1, [r6, r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r5, r0, r2
	movs r1, #0
	ldrsh r0, [r6, r1]
	movs r4, #1
	negs r4, r4
	cmp r0, r4
	beq _0805AAA6
	mov r2, r8
	ldr r0, [r2, #0xc]
	ldr r1, [r6, #0x20]
	bl LZ77UnCompWram
_0805AAA6:
	movs r1, #6
	ldrsh r0, [r6, r1]
	cmp r0, r4
	beq _0805AABC
	ldr r0, [r5, #0xc]
	ldr r1, [r6, #0x20]
	movs r2, #0x80
	lsls r2, r2, #5
	adds r1, r1, r2
	bl LZ77UnCompWram
_0805AABC:
	movs r1, #0xc
	ldrsh r0, [r6, r1]
	cmp r0, #3
	bgt _0805AAD4
	cmp r0, #1
	bge _0805AAE2
	cmp r0, #0
	beq _0805AAD8
	b _0805AAE2
	.align 2, 0
_0805AAD0: .4byte battle_terrain_table
_0805AAD4:
	cmp r0, #4
	bne _0805AAE2
_0805AAD8:
	ldr r3, [r6, #0x20]
	movs r2, #0x80
	lsls r2, r2, #5
	adds r7, r3, r2
	b _0805AAF0
_0805AAE2:
	ldr r0, [r6, #0x20]
	movs r1, #0x80
	lsls r1, r1, #4
	adds r3, r0, r1
	movs r2, #0xc0
	lsls r2, r2, #5
	adds r7, r0, r2
_0805AAF0:
	mov r0, r8
	ldr r0, [r0, #0x10]
	mov r8, r0
	ldr r5, [r5, #0x10]
	mov r9, r5
	movs r1, #0xe
	ldrsh r4, [r6, r1]
	movs r0, #1
	negs r0, r0
	cmp r4, r0
	beq _0805AB74
	cmp r4, r0
	blt _0805ABD4
	cmp r4, #3
	bgt _0805ABD4
	movs r2, #4
	ldrsh r0, [r6, r2]
	adds r0, #0x40
	lsls r0, r0, #5
	movs r4, #0xc0
	lsls r4, r4, #0x13
	adds r0, r0, r4
	ldr r1, [r6, #0x1c]
	adds r1, r1, r0
	movs r5, #0x80
	lsls r5, r5, #4
	adds r0, r3, #0
	adds r2, r5, #0
	bl RegisterDataMove
	movs r1, #0xa
	ldrsh r0, [r6, r1]
	lsls r0, r0, #5
	adds r0, r0, r4
	ldr r1, [r6, #0x1c]
	adds r1, r1, r0
	adds r0, r7, #0
	adds r2, r5, #0
	bl RegisterDataMove
	movs r2, #2
	ldrsh r1, [r6, r2]
	lsls r1, r1, #5
	ldr r4, _0805AB70  @ gPaletteBuffer
	adds r1, r1, r4
	mov r0, r8
	movs r2, #8
	bl CpuFastSet
	movs r0, #8
	ldrsh r1, [r6, r0]
	lsls r1, r1, #5
	adds r1, r1, r4
	mov r0, r9
	movs r2, #8
	bl CpuFastSet
	bl EnablePaletteSync
	adds r0, r6, #0
	bl sub_805AE58
	b _0805ABD4
	.align 2, 0
_0805AB70: .4byte gPaletteBuffer
_0805AB74:
	movs r1, #0
	ldrsh r0, [r6, r1]
	cmp r0, r4
	beq _0805ABA2
	movs r2, #4
	ldrsh r0, [r6, r2]
	lsls r0, r0, #5
	ldr r1, [r6, #0x1c]
	adds r1, r1, r0
	movs r2, #0x80
	lsls r2, r2, #4
	adds r0, r3, #0
	bl RegisterDataMove
	movs r0, #2
	ldrsh r1, [r6, r0]
	lsls r1, r1, #5
	ldr r0, _0805ABEC  @ gPaletteBuffer+0x200
	adds r1, r1, r0
	mov r0, r8
	movs r2, #8
	bl CpuFastSet
_0805ABA2:
	movs r1, #6
	ldrsh r0, [r6, r1]
	cmp r0, r4
	beq _0805ABD0
	movs r2, #0xa
	ldrsh r0, [r6, r2]
	lsls r0, r0, #5
	ldr r1, [r6, #0x1c]
	adds r1, r1, r0
	movs r2, #0x80
	lsls r2, r2, #4
	adds r0, r7, #0
	bl RegisterDataMove
	movs r0, #8
	ldrsh r1, [r6, r0]
	lsls r1, r1, #5
	ldr r0, _0805ABEC  @ gPaletteBuffer+0x200
	adds r1, r1, r0
	mov r0, r9
	movs r2, #8
	bl CpuFastSet
_0805ABD0:
	bl EnablePaletteSync
_0805ABD4:
	ldrh r0, [r6, #0xe]
	adds r0, #1
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #4
	bls _0805ABE2
	b _0805AE02
_0805ABE2:
	lsls r0, r0, #2
	ldr r1, _0805ABF0  @ _0805ABF4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0805ABEC: .4byte gPaletteBuffer+0x200
_0805ABF0: .4byte _0805ABF4
_0805ABF4: @ jump table
	.4byte _0805AC28 @ case 0
	.4byte _0805AC08 @ case 1
	.4byte _0805AC10 @ case 2
	.4byte _0805AC18 @ case 3
	.4byte _0805AC20 @ case 4
_0805AC08:
	movs r0, #1
	bl BG_EnableSyncByMask
	b _0805AE02
_0805AC10:
	movs r0, #2
	bl BG_EnableSyncByMask
	b _0805AE02
_0805AC18:
	movs r0, #4
	bl BG_EnableSyncByMask
	b _0805AE02
_0805AC20:
	movs r0, #8
	bl BG_EnableSyncByMask
	b _0805AE02
_0805AC28:
	movs r0, #0
	str r0, [r6, #0x14]
	str r0, [r6, #0x18]
	movs r2, #6
	ldrsh r1, [r6, r2]
	subs r0, #1
	cmp r1, r0
	beq _0805AD16
	movs r1, #0xc
	ldrsh r0, [r6, r1]
	cmp r0, #4
	bhi _0805AD16
	lsls r0, r0, #2
	ldr r1, _0805AC4C  @ _0805AC50
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0805AC4C: .4byte _0805AC50
_0805AC50: @ jump table
	.4byte _0805AC64 @ case 0
	.4byte _0805AC90 @ case 1
	.4byte _0805ACBC @ case 2
	.4byte _0805ACE8 @ case 3
	.4byte _0805AC64 @ case 4
_0805AC64:
	movs r2, #8
	ldrsh r0, [r6, r2]
	lsls r0, r0, #0xc
	ldrh r1, [r6, #0xa]
	orrs r0, r1
	movs r2, #0xc0
	lsls r2, r2, #4
	adds r1, r2, #0
	orrs r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r2, _0805AC8C  @ gUnknown_085C73B8
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	movs r0, #4
	str r0, [sp, #8]
	movs r0, #0xa8
	b _0805AD0C
	.align 2, 0
_0805AC8C: .4byte gUnknown_085C73B8
_0805AC90:
	movs r1, #8
	ldrsh r0, [r6, r1]
	lsls r0, r0, #0xc
	ldrh r1, [r6, #0xa]
	orrs r0, r1
	movs r2, #0xc0
	lsls r2, r2, #4
	adds r1, r2, #0
	orrs r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r2, _0805ACB8  @ gUnknown_085C72AC
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	movs r0, #4
	str r0, [sp, #8]
	movs r0, #0xb0
	b _0805AD0C
	.align 2, 0
_0805ACB8: .4byte gUnknown_085C72AC
_0805ACBC:
	movs r1, #8
	ldrsh r0, [r6, r1]
	lsls r0, r0, #0xc
	ldrh r1, [r6, #0xa]
	orrs r0, r1
	movs r2, #0xc0
	lsls r2, r2, #4
	adds r1, r2, #0
	orrs r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r2, _0805ACE4  @ gUnknown_085C72AC
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	movs r0, #4
	str r0, [sp, #8]
	movs r0, #0xb0
	b _0805AD0C
	.align 2, 0
_0805ACE4: .4byte gUnknown_085C72AC
_0805ACE8:
	movs r1, #8
	ldrsh r0, [r6, r1]
	lsls r0, r0, #0xc
	ldrh r1, [r6, #0xa]
	orrs r0, r1
	movs r2, #0xc0
	lsls r2, r2, #4
	adds r1, r2, #0
	orrs r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r2, _0805AD34  @ gUnknown_085C72AC
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	movs r0, #4
	str r0, [sp, #8]
	movs r0, #0x80
_0805AD0C:
	movs r1, #0x68
	movs r3, #2
	bl NewEkrsubAnimeEmulator
	str r0, [r6, #0x18]
_0805AD16:
	movs r0, #0
	ldrsh r1, [r6, r0]
	movs r0, #1
	negs r0, r0
	cmp r1, r0
	beq _0805AE02
	movs r1, #0xc
	ldrsh r0, [r6, r1]
	cmp r0, #4
	bhi _0805AE02
	lsls r0, r0, #2
	ldr r1, _0805AD38  @ _0805AD3C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0805AD34: .4byte gUnknown_085C72AC
_0805AD38: .4byte _0805AD3C
_0805AD3C: @ jump table
	.4byte _0805AD50 @ case 0
	.4byte _0805AD7C @ case 1
	.4byte _0805ADA8 @ case 2
	.4byte _0805ADD4 @ case 3
	.4byte _0805AD50 @ case 4
_0805AD50:
	movs r2, #2
	ldrsh r0, [r6, r2]
	lsls r0, r0, #0xc
	ldrh r1, [r6, #4]
	orrs r0, r1
	movs r2, #0xc0
	lsls r2, r2, #4
	adds r1, r2, #0
	orrs r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r2, _0805AD78  @ gUnknown_085C7438
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	movs r0, #4
	str r0, [sp, #8]
	movs r0, #0x48
	b _0805ADF8
	.align 2, 0
_0805AD78: .4byte gUnknown_085C7438
_0805AD7C:
	movs r1, #2
	ldrsh r0, [r6, r1]
	lsls r0, r0, #0xc
	ldrh r1, [r6, #4]
	orrs r0, r1
	movs r2, #0xc0
	lsls r2, r2, #4
	adds r1, r2, #0
	orrs r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r2, _0805ADA4  @ gUnknown_085C7338
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	movs r0, #4
	str r0, [sp, #8]
	movs r0, #0x20
	b _0805ADF8
	.align 2, 0
_0805ADA4: .4byte gUnknown_085C7338
_0805ADA8:
	movs r1, #2
	ldrsh r0, [r6, r1]
	lsls r0, r0, #0xc
	ldrh r1, [r6, #4]
	orrs r0, r1
	movs r2, #0xc0
	lsls r2, r2, #4
	adds r1, r2, #0
	orrs r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r2, _0805ADD0  @ gUnknown_085C7338
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	movs r0, #4
	str r0, [sp, #8]
	movs r0, #0x40
	b _0805ADF8
	.align 2, 0
_0805ADD0: .4byte gUnknown_085C7338
_0805ADD4:
	movs r1, #2
	ldrsh r0, [r6, r1]
	lsls r0, r0, #0xc
	ldrh r1, [r6, #4]
	orrs r0, r1
	movs r2, #0xc0
	lsls r2, r2, #4
	adds r1, r2, #0
	orrs r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r2, _0805AE10  @ gUnknown_085C7438
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	movs r0, #4
	str r0, [sp, #8]
	movs r0, #0x78
_0805ADF8:
	movs r1, #0x68
	movs r3, #2
	bl NewEkrsubAnimeEmulator
	str r0, [r6, #0x14]
_0805AE02:
	add sp, #0xc
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805AE10: .4byte gUnknown_085C7438

	THUMB_FUNC_END sub_805AA68

.align 2, 0
