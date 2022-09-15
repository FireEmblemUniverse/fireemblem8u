    .INCLUDE "macro.inc"
    
    .syntax unified

	THUMB_FUNC_START sub_807F2B4
sub_807F2B4: @ 0x0807F2B4
	movs r1, #0
	str r1, [r0, #0x54]
	bx lr

	THUMB_FUNC_END sub_807F2B4

	THUMB_FUNC_START sub_807F2BC
sub_807F2BC: @ 0x0807F2BC
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r1, _0807F308  @ gUnknown_089AC5CC
	ldr r0, [r5, #0x54]
	adds r4, r0, #1
	str r4, [r5, #0x54]
	movs r0, #3
	ands r0, r4
	cmp r0, #0
	bne _0807F302
	asrs r4, r4, #2
	movs r0, #0xf
	ands r4, r0
	lsls r4, r4, #1
	adds r4, r4, r1
	adds r5, #0x64
	movs r0, #0
	ldrsh r1, [r5, r0]
	adds r1, #0x10
	lsls r1, r1, #5
	adds r1, #0x12
	adds r0, r4, #0
	movs r2, #0xe
	bl CopyToPaletteBuffer
	adds r4, #0x40
	movs r0, #0
	ldrsh r1, [r5, r0]
	adds r1, #0x11
	lsls r1, r1, #5
	adds r1, #0x12
	adds r0, r4, #0
	movs r2, #0xe
	bl CopyToPaletteBuffer
_0807F302:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807F308: .4byte gUnknown_089AC5CC

	THUMB_FUNC_END sub_807F2BC

	THUMB_FUNC_START sub_807F30C
sub_807F30C: @ 0x0807F30C
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x32]
	adds r0, #8
	strh r0, [r4, #0x32]
	ldrh r2, [r4, #0x32]
	movs r0, #0
	movs r1, #0
	bl BG_SetPosition
	ldrh r2, [r4, #0x32]
	movs r0, #1
	movs r1, #0
	bl BG_SetPosition
	ldr r0, _0807F350  @ gFaceProcs
	ldr r2, [r0]
	ldrh r1, [r4, #0x32]
	movs r0, #0x20
	subs r0, r0, r1
	strh r0, [r2, #0x36]
	movs r0, #0x32
	ldrsh r1, [r4, r0]
	movs r0, #0x30
	negs r0, r0
	cmp r1, r0
	blt _0807F348
	adds r0, r4, #0
	bl Proc_Break
_0807F348:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807F350: .4byte gFaceProcs

	THUMB_FUNC_END sub_807F30C

	THUMB_FUNC_START sub_807F354
sub_807F354: @ 0x0807F354
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x32]
	subs r0, #8
	strh r0, [r4, #0x32]
	ldrh r2, [r4, #0x32]
	movs r0, #0
	movs r1, #0
	bl BG_SetPosition
	ldrh r2, [r4, #0x32]
	movs r0, #1
	movs r1, #0
	bl BG_SetPosition
	ldr r0, _0807F398  @ gFaceProcs
	ldr r2, [r0]
	ldrh r1, [r4, #0x32]
	movs r0, #0x20
	subs r0, r0, r1
	strh r0, [r2, #0x36]
	movs r0, #0x32
	ldrsh r1, [r4, r0]
	movs r0, #0x90
	negs r0, r0
	cmp r1, r0
	bgt _0807F390
	adds r0, r4, #0
	bl Proc_Break
_0807F390:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807F398: .4byte gFaceProcs

	THUMB_FUNC_END sub_807F354

	THUMB_FUNC_START sub_807F39C
sub_807F39C: @ 0x0807F39C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r7, r0, #0
	adds r1, r7, #0
	adds r1, #0x31
	ldrb r0, [r1]
	cmp r0, #0
	beq _0807F3B4
	subs r0, #1
	b _0807F466
_0807F3B4:
	adds r0, r7, #0
	adds r0, #0x30
	ldrb r6, [r0]
	mov r8, r0
	b _0807F3C0
_0807F3BE:
	adds r6, #1
_0807F3C0:
	cmp r6, #8
	ble _0807F3CC
	adds r0, r7, #0
	bl Proc_Break
	b _0807F468
_0807F3CC:
	movs r1, #0x2e
	ldrsh r0, [r7, r1]
	adds r1, r6, #0
	bl GetSomeStatUp
	cmp r0, #0
	beq _0807F3BE
	movs r1, #0x2e
	ldrsh r0, [r7, r1]
	movs r1, #1
	str r1, [sp]
	movs r2, #1
	adds r3, r6, #0
	bl MapAnimLevelUp_DrawStatNum
	movs r0, #1
	bl BG_EnableSyncByMask
	ldr r1, _0807F43C  @ gUnknown_089A3ED4
	lsls r0, r6, #1
	adds r0, r0, r6
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r5, [r0]
	lsls r5, r5, #3
	adds r5, #0x3e
	ldrb r4, [r0, #1]
	lsls r4, r4, #3
	movs r1, #0x32
	ldrsh r0, [r7, r1]
	subs r0, #0x17
	subs r4, r4, r0
	movs r1, #0x2e
	ldrsh r0, [r7, r1]
	adds r1, r6, #0
	bl GetSomeStatUp
	adds r3, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	adds r2, r6, #0
	bl sub_807EE84
	cmp r6, #0
	bne _0807F448
	ldr r0, _0807F440  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0807F45A
	ldr r0, _0807F444  @ 0x000002CD
	bl m4aSongNumStart
	b _0807F45A
	.align 2, 0
_0807F43C: .4byte gUnknown_089A3ED4
_0807F440: .4byte gRAMChapterData
_0807F444: .4byte 0x000002CD
_0807F448:
	ldr r0, _0807F474  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0807F45A
	movs r0, #0x76
	bl m4aSongNumStart
_0807F45A:
	adds r0, r6, #1
	mov r1, r8
	strb r0, [r1]
	adds r1, r7, #0
	adds r1, #0x31
	movs r0, #0x14
_0807F466:
	strb r0, [r1]
_0807F468:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807F474: .4byte gRAMChapterData

	THUMB_FUNC_END sub_807F39C

	THUMB_FUNC_START sub_807F478
sub_807F478: @ 0x0807F478
	push {lr}
	adds r3, r0, #0
	movs r0, #0x80
	lsls r0, r0, #1
	movs r1, #0x80
	movs r2, #0x10
	bl ISuspectThisToBeMusicRelated_8002730
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_807F478

	THUMB_FUNC_START sub_807F48C
sub_807F48C: @ 0x0807F48C
	push {r4, r5, lr}
	sub sp, #8
	adds r4, r0, #0
	ldr r0, _0807F520  @ gUnknown_089AC794
	ldr r1, _0807F524  @ 0x06013800
	bl CopyDataWithPossibleUncomp
	ldr r0, _0807F528  @ gUnknown_089AC9A8
	movs r1, #0x98
	lsls r1, r1, #2
	movs r2, #0x60
	bl CopyToPaletteBuffer
	ldr r2, _0807F52C  @ gCurrentMapAnimState
	movs r0, #0x2e
	ldrsh r1, [r4, r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r3, [r0]
	movs r1, #0x10
	ldrsb r1, [r3, r1]
	ldr r2, _0807F530  @ gUnknown_0202BCB0
	ldrh r0, [r2, #0xc]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x14
	subs r1, r1, r0
	lsls r5, r1, #1
	lsls r1, r1, #4
	adds r4, r1, #0
	adds r4, #0x10
	movs r1, #0x11
	ldrsb r1, [r3, r1]
	ldrh r0, [r2, #0xe]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x14
	subs r1, r1, r0
	lsls r0, r1, #1
	lsls r1, r1, #4
	adds r2, r1, #0
	subs r2, #8
	cmp r0, #3
	bgt _0807F4E6
	adds r2, #0x20
_0807F4E6:
	cmp r5, #3
	bgt _0807F4EC
	movs r4, #0x30
_0807F4EC:
	cmp r5, #0x19
	ble _0807F4F2
	movs r4, #0xd0
_0807F4F2:
	ldr r0, _0807F534  @ gUnknown_089A5A6C
	movs r3, #0xc7
	lsls r3, r3, #6
	movs r1, #0
	str r1, [sp]
	movs r1, #2
	str r1, [sp, #4]
	adds r1, r4, #0
	bl APProc_Create
	ldr r0, _0807F538  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0807F518
	movs r0, #0x5b
	bl m4aSongNumStart
_0807F518:
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807F520: .4byte gUnknown_089AC794
_0807F524: .4byte 0x06013800
_0807F528: .4byte gUnknown_089AC9A8
_0807F52C: .4byte gCurrentMapAnimState
_0807F530: .4byte gUnknown_0202BCB0
_0807F534: .4byte gUnknown_089A5A6C
_0807F538: .4byte gRAMChapterData

	THUMB_FUNC_END sub_807F48C

	THUMB_FUNC_START sub_807F53C
sub_807F53C: @ 0x0807F53C
	push {lr}
	bl APProc_DeleteAll
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_807F53C

	THUMB_FUNC_START sub_807F548
sub_807F548: @ 0x0807F548
	push {lr}
	adds r3, r0, #0
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #0x80
	movs r2, #0x10
	bl ISuspectThisToBeMusicRelated_8002730
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_807F548

	THUMB_FUNC_START sub_807F55C
sub_807F55C: @ 0x0807F55C
	push {lr}
	bl sub_8010E50
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_807F55C

.align 2, 0

