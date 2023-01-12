	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

    @ proc effect of event 44

	THUMB_FUNC_START sub_8012CE4
sub_8012CE4: @ 0x08012CE4
	push {lr}
	movs r0, #0
	movs r1, #0
	movs r2, #0x10
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	bl InitBmBgLayers
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8012CE4

	THUMB_FUNC_START sub_8012CFC
sub_8012CFC: @ 0x08012CFC
	push {r4, r5, r6, lr}
	sub sp, #0x14
	adds r5, r0, #0
	adds r6, r1, #0
	ldr r0, _08012DB4  @ gUnknown_08592608
	bl Proc_StartBlocking
	adds r6, r0, #0
	ldr r3, _08012DB8  @ gLCDControlBuffer
	ldrb r1, [r3, #0xc]
	movs r2, #4
	negs r2, r2
	adds r0, r2, #0
	ands r0, r1
	strb r0, [r3, #0xc]
	ldrb r1, [r3, #0x10]
	adds r0, r2, #0
	ands r0, r1
	movs r1, #1
	orrs r0, r1
	strb r0, [r3, #0x10]
	ldrb r0, [r3, #0x14]
	ands r2, r0
	strb r2, [r3, #0x14]
	ldrb r0, [r3, #0x18]
	movs r1, #3
	orrs r0, r1
	strb r0, [r3, #0x18]
	movs r0, #1
	movs r1, #0x10
	movs r2, #0x10
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	movs r4, #0
	str r4, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #1
	movs r3, #0
	bl SetBlendTargetA
	movs r0, #1
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #1
	bl SetBlendTargetB
	movs r2, #0x10
	ldrsb r2, [r5, r2]
	lsls r2, r2, #4
	ldr r1, _08012DBC  @ gGameState
	ldrh r0, [r1, #0xc]
	subs r2, r2, r0
	subs r2, #0x10
	movs r3, #0x11
	ldrsb r3, [r5, r3]
	lsls r3, r3, #4
	ldrh r0, [r1, #0xe]
	subs r3, r3, r0
	subs r3, #0x18
	ldr r0, _08012DC0  @ gUnknown_08592628
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	str r4, [sp]
	movs r1, #0x80
	lsls r1, r1, #6
	str r1, [sp, #4]
	movs r1, #0xf
	str r1, [sp, #8]
	str r4, [sp, #0xc]
	str r6, [sp, #0x10]
	movs r1, #2
	bl sub_80AE7C4
	ldr r0, _08012DC4  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08012DAC
	ldr r0, _08012DC8  @ 0x000002D6
	bl m4aSongNumStart
_08012DAC:
	add sp, #0x14
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08012DB4: .4byte gUnknown_08592608
_08012DB8: .4byte gLCDControlBuffer
_08012DBC: .4byte gGameState
_08012DC0: .4byte gUnknown_08592628
_08012DC4: .4byte gRAMChapterData
_08012DC8: .4byte 0x000002D6

	THUMB_FUNC_END sub_8012CFC

    .align 2, 0 @ Don't pad with nop.
