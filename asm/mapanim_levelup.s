	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

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
	bl ResetDialogueScreen
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_807F55C

.align 2, 0
