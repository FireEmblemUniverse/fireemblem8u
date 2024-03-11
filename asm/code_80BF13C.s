	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	THUMB_FUNC_START sub_80C34D0
sub_80C34D0: @ 0x080C34D0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	adds r4, r0, #0
	adds r7, r1, #0
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	str r2, [sp]
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	mov sl, r3
	movs r2, #0
	cmp r2, r7
	bge _080C357E
	movs r0, #0x1f
	mov r1, sl
	ands r1, r0
	str r1, [sp, #4]
	movs r3, #0
	str r3, [sp, #8]
	mov r8, r4
	ldr r1, [sp]
	mov r9, r1
	mov r3, r9
	ands r3, r0
	mov r9, r3
_080C350A:
	subs r6, r7, r2
	mov r0, r9
	muls r0, r6, r0
	ldr r1, [sp, #8]
	adds r0, r0, r1
	adds r1, r7, #0
	str r2, [sp, #0xc]
	bl __divsi3
	adds r4, r0, #0
	movs r3, #0x1f
	ands r4, r3
	ldr r0, [sp]
	movs r1, #0xf8
	lsls r1, r1, #2
	ands r0, r1
	muls r0, r6, r0
	mov r1, sl
	movs r3, #0xf8
	lsls r3, r3, #2
	ands r1, r3
	ldr r2, [sp, #0xc]
	muls r1, r2, r1
	adds r0, r0, r1
	adds r1, r7, #0
	bl __divsi3
	movs r1, #0xf8
	lsls r1, r1, #2
	ands r0, r1
	adds r4, r4, r0
	movs r5, #0xf8
	lsls r5, r5, #7
	ldr r0, [sp]
	ands r0, r5
	muls r0, r6, r0
	mov r1, sl
	ands r1, r5
	ldr r2, [sp, #0xc]
	muls r1, r2, r1
	adds r0, r0, r1
	adds r1, r7, #0
	bl __divsi3
	ands r0, r5
	adds r4, r4, r0
	mov r3, r8
	strh r4, [r3]
	ldr r0, [sp, #8]
	ldr r1, [sp, #4]
	adds r0, r0, r1
	str r0, [sp, #8]
	movs r3, #2
	add r8, r3
	ldr r2, [sp, #0xc]
	adds r2, #1
	cmp r2, r7
	blt _080C350A
_080C357E:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80C34D0

	THUMB_FUNC_START sub_80C3590
sub_80C3590: @ 0x080C3590
	push {r4, r5, r6, lr}
	sub sp, #4
	movs r6, #0
	ldr r5, _080C35BC  @ 0x06014000
	movs r4, #3
_080C359A:
	str r6, [sp]
	mov r0, sp
	adds r1, r5, #0
	ldr r2, _080C35C0  @ 0x010000E0
	bl CpuFastSet
	movs r0, #0x80
	lsls r0, r0, #3
	adds r5, r5, r0
	subs r4, #1
	cmp r4, #0
	bge _080C359A
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080C35BC: .4byte 0x06014000
_080C35C0: .4byte 0x010000E0

	THUMB_FUNC_END sub_80C3590

	THUMB_FUNC_START sub_80C35C4
sub_80C35C4: @ 0x080C35C4
	push {lr}
	adds r3, r0, #0
	adds r3, #0x29
	movs r2, #0
	movs r1, #1
	strb r1, [r3]
	adds r0, #0x2a
	strb r2, [r0]
	bl sub_80C3590
	ldr r2, _080C35E8  @ gWmHblankStatus
	ldrb r1, [r2]
	movs r0, #0xfe
	ands r0, r1
	strb r0, [r2]
	pop {r0}
	bx r0
	.align 2, 0
_080C35E8: .4byte gWmHblankStatus

	THUMB_FUNC_END sub_80C35C4

	THUMB_FUNC_START sub_80C35EC
sub_80C35EC: @ 0x080C35EC
	push {lr}
	sub sp, #4
	adds r1, r0, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	cmp r0, #0
	beq _080C3618
	movs r2, #0
	adds r0, r1, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #1
	bne _080C3608
	movs r2, #0x6f
_080C3608:
	ldr r3, _080C3620  @ gUnknown_08A3EE28
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [sp]
	movs r0, #1
	movs r1, #0
	bl PutSpriteExt
_080C3618:
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_080C3620: .4byte gUnknown_08A3EE28

	THUMB_FUNC_END sub_80C35EC

	THUMB_FUNC_START StartWmText
StartWmText: @ 0x080C3624
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _080C3658  @ gUnknown_08A3EE44
	bl Proc_Find
	adds r4, r0, #0
	cmp r4, #0
	beq _080C3652
	bl sub_80C3590
	ldr r2, _080C365C  @ gWmHblankStatus
	ldrb r1, [r2]
	movs r0, #0xfe
	ands r0, r1
	strb r0, [r2]
	adds r0, r4, #0
	adds r0, #0x29
	strb r5, [r0]
	adds r1, r4, #0
	adds r1, #0x2a
	movs r0, #1
	strb r0, [r1]
_080C3652:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C3658: .4byte gUnknown_08A3EE44
_080C365C: .4byte gWmHblankStatus

	THUMB_FUNC_END StartWmText

	THUMB_FUNC_START RemoveWmText
RemoveWmText: @ 0x080C3660
	push {lr}
	ldr r0, _080C3684  @ gUnknown_08A3EE44
	bl Proc_Find
	adds r3, r0, #0
	cmp r3, #0
	beq _080C3680
	ldr r2, _080C3688  @ gWmHblankStatus
	ldrb r1, [r2]
	movs r0, #0xfe
	ands r0, r1
	strb r0, [r2]
	adds r1, r3, #0
	adds r1, #0x2a
	movs r0, #0
	strb r0, [r1]
_080C3680:
	pop {r0}
	bx r0
	.align 2, 0
_080C3684: .4byte gUnknown_08A3EE44
_080C3688: .4byte gWmHblankStatus

	THUMB_FUNC_END RemoveWmText

	THUMB_FUNC_START sub_80C368C
sub_80C368C: @ 0x080C368C
	push {lr}
	adds r1, r0, #0
	ldr r0, _080C369C  @ gUnknown_08A3EE44
	bl Proc_Start
	pop {r1}
	bx r1
	.align 2, 0
_080C369C: .4byte gUnknown_08A3EE44

	THUMB_FUNC_END sub_80C368C

	THUMB_FUNC_START sub_80C36A0
sub_80C36A0: @ 0x080C36A0
	push {r4, lr}
	adds r4, r0, #0
	bl EndTalk
	movs r0, #0x80
	lsls r0, r0, #2
	movs r1, #2
	movs r2, #2
	bl InitSpriteTalk
	bl EnablePaletteSync
	movs r0, #1
	movs r1, #0xf
	adds r2, r4, #0
	bl StartTalkMsg
	movs r0, #4
	bl SetTalkPrintDelay
	movs r0, #0x20
	bl SetTalkFlag
	movs r0, #0x80
	bl SetTalkFlag
	movs r0, #4
	bl SetTalkFlag
	movs r0, #1
	bl SetTalkFlag
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80C36A0

	THUMB_FUNC_START sub_80C36E8
sub_80C36E8: @ 0x080C36E8
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, _080C375C  @ gGMData
	ldr r1, [r0, #8]
	asrs r1, r1, #8
	ldr r6, [r0, #0xc]
	asrs r6, r6, #8
	adds r0, r4, #0
	adds r0, #0x2f
	movs r5, #0
	ldrsb r5, [r0, r5]
	lsls r5, r5, #3
	lsls r0, r1, #6
	subs r0, r0, r1
	movs r1, #0xf0
	lsls r1, r1, #1
	bl __divsi3
	adds r5, r5, r0
	adds r4, #0x30
	ldrb r4, [r4]
	lsls r4, r4, #0x18
	asrs r4, r4, #0x18
	lsls r4, r4, #3
	movs r0, #0x2b
	muls r0, r6, r0
	movs r1, #0xa0
	lsls r1, r1, #1
	bl __divsi3
	adds r4, r4, r0
	subs r1, r5, #1
	adds r2, r4, #7
	adds r5, #0x1f
	ldr r0, _080C3760  @ 0x0000012F
	cmp r5, r0
	bhi _080C3754
	movs r0, #0x20
	negs r0, r0
	cmp r2, r0
	blt _080C3754
	cmp r2, #0xbf
	bgt _080C3754
	ldr r0, _080C3764  @ 0x000001FF
	ands r1, r0
	movs r0, #0xff
	ands r2, r0
	ldr r3, _080C3768  @ gObject_8x8
	ldr r0, _080C376C  @ 0x000040F6
	str r0, [sp]
	movs r0, #0
	bl PutSpriteExt
_080C3754:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080C375C: .4byte gGMData
_080C3760: .4byte 0x0000012F
_080C3764: .4byte 0x000001FF
_080C3768: .4byte gObject_8x8
_080C376C: .4byte 0x000040F6

	THUMB_FUNC_END sub_80C36E8

	THUMB_FUNC_START sub_80C3770
sub_80C3770: @ 0x080C3770
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, _080C37F4  @ gGMData
	bl GetNextUnclearedNode
	cmp r0, #0
	blt _080C37EA
	lsls r0, r0, #5
	ldr r1, _080C37F8  @ gWMNodeData
	adds r0, r0, r1
	movs r2, #0x18
	ldrsh r1, [r0, r2]
	movs r2, #0x1a
	ldrsh r6, [r0, r2]
	adds r0, r4, #0
	adds r0, #0x2f
	movs r5, #0
	ldrsb r5, [r0, r5]
	lsls r5, r5, #3
	lsls r0, r1, #6
	subs r0, r0, r1
	movs r1, #0xf0
	lsls r1, r1, #1
	bl __divsi3
	adds r5, r5, r0
	adds r0, r4, #0
	adds r0, #0x30
	movs r4, #0
	ldrsb r4, [r0, r4]
	lsls r4, r4, #3
	movs r0, #0x2b
	muls r0, r6, r0
	movs r1, #0xa0
	lsls r1, r1, #1
	bl __divsi3
	adds r4, r4, r0
	subs r1, r5, #1
	adds r2, r4, #7
	adds r5, #0x1f
	ldr r0, _080C37FC  @ 0x0000012F
	cmp r5, r0
	bhi _080C37EA
	movs r0, #0x20
	negs r0, r0
	cmp r2, r0
	blt _080C37EA
	cmp r2, #0xbf
	bgt _080C37EA
	ldr r0, _080C3800  @ 0x000001FF
	ands r1, r0
	movs r0, #0xff
	ands r2, r0
	ldr r3, _080C3804  @ gObject_8x8
	ldr r0, _080C3808  @ 0x000040F7
	str r0, [sp]
	movs r0, #0
	bl PutSpriteExt
_080C37EA:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080C37F4: .4byte gGMData
_080C37F8: .4byte gWMNodeData
_080C37FC: .4byte 0x0000012F
_080C3800: .4byte 0x000001FF
_080C3804: .4byte gObject_8x8
_080C3808: .4byte 0x000040F7

	THUMB_FUNC_END sub_80C3770

	THUMB_FUNC_START sub_80C380C
sub_80C380C: @ 0x080C380C
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r7, r0, #0
	ldr r0, _080C38A4  @ gGMData
	ldrb r1, [r0, #0x10]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080C389A
	ldr r0, _080C38A8  @ ProcScr_WorldMapMain
	bl Proc_Find
	ldr r0, [r0, #0x54]
	mov r4, sp
	adds r4, #6
	movs r1, #0
	add r2, sp, #4
	adds r3, r4, #0
	bl GmMu_GetPosition
	add r0, sp, #4
	movs r2, #0
	ldrsh r1, [r0, r2]
	movs r0, #0
	ldrsh r6, [r4, r0]
	adds r0, r7, #0
	adds r0, #0x2f
	movs r5, #0
	ldrsb r5, [r0, r5]
	lsls r5, r5, #3
	lsls r0, r1, #6
	subs r0, r0, r1
	movs r1, #0xf0
	lsls r1, r1, #1
	bl __divsi3
	adds r5, r5, r0
	adds r0, r7, #0
	adds r0, #0x30
	movs r4, #0
	ldrsb r4, [r0, r4]
	lsls r4, r4, #3
	movs r0, #0x2b
	muls r0, r6, r0
	movs r1, #0xa0
	lsls r1, r1, #1
	bl __divsi3
	adds r4, r4, r0
	subs r1, r5, #3
	adds r2, r4, #7
	adds r5, #0x1d
	ldr r0, _080C38AC  @ 0x0000012F
	cmp r5, r0
	bhi _080C389A
	movs r0, #0x20
	negs r0, r0
	cmp r2, r0
	blt _080C389A
	cmp r2, #0xbf
	bgt _080C389A
	ldr r0, _080C38B0  @ 0x000001FF
	ands r1, r0
	movs r0, #0xff
	ands r2, r0
	ldr r3, _080C38B4  @ gObject_8x8
	ldr r0, _080C38B8  @ 0x000090F4
	str r0, [sp]
	movs r0, #0
	bl PutSpriteExt
_080C389A:
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C38A4: .4byte gGMData
_080C38A8: .4byte ProcScr_WorldMapMain
_080C38AC: .4byte 0x0000012F
_080C38B0: .4byte 0x000001FF
_080C38B4: .4byte gObject_8x8
_080C38B8: .4byte 0x000090F4

	THUMB_FUNC_END sub_80C380C

	THUMB_FUNC_START sub_80C38BC
sub_80C38BC: @ 0x080C38BC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x20
	str r0, [sp, #0x14]
	movs r0, #0
	str r0, [sp, #0x18]
	movs r1, #4
	mov r9, r1
	mov r2, sp
	adds r2, #0x10
	str r2, [sp, #0x1c]
	movs r3, #0x12
	add r3, sp
	mov sl, r3
	add r0, sp, #4
	mov r8, r0
_080C38E2:
	ldr r1, _080C3A10  @ gGMData
	mov r2, r9
	lsls r0, r2, #2
	adds r0, r0, r1
	ldrb r1, [r0, #0x10]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080C3956
	ldr r0, _080C3A14  @ ProcScr_WorldMapMain
	bl Proc_Find
	ldr r0, [r0, #0x54]
	mov r1, r9
	ldr r2, [sp, #0x1c]
	mov r3, sl
	bl GmMu_GetPosition
	ldr r3, [sp, #0x1c]
	movs r0, #0
	ldrsh r1, [r3, r0]
	mov r2, sl
	movs r3, #0
	ldrsh r6, [r2, r3]
	ldr r0, [sp, #0x14]
	adds r0, #0x2f
	movs r5, #0
	ldrsb r5, [r0, r5]
	lsls r5, r5, #3
	lsls r0, r1, #6
	subs r0, r0, r1
	movs r1, #0xf0
	lsls r1, r1, #1
	bl __divsi3
	adds r5, r5, r0
	ldr r0, [sp, #0x14]
	adds r0, #0x30
	movs r4, #0
	ldrsb r4, [r0, r4]
	lsls r4, r4, #3
	movs r0, #0x2b
	muls r0, r6, r0
	movs r1, #0xa0
	lsls r1, r1, #1
	bl __divsi3
	adds r4, r4, r0
	subs r5, #3
	mov r0, r8
	strh r5, [r0]
	adds r4, #7
	strh r4, [r0, #2]
	movs r1, #4
	add r8, r1
	ldr r2, [sp, #0x18]
	adds r2, #1
	str r2, [sp, #0x18]
_080C3956:
	movs r3, #1
	add r9, r3
	mov r0, r9
	cmp r0, #6
	ble _080C38E2
	movs r5, #0
	ldr r1, [sp, #0x18]
	subs r1, #1
	mov r8, r1
	cmp r5, r8
	bge _080C39B6
_080C396C:
	adds r6, r5, #1
	ldr r2, [sp, #0x18]
	cmp r6, r2
	bge _080C39B0
	lsls r0, r5, #2
	mov r4, sp
	adds r4, r4, r0
	adds r4, #4
	lsls r0, r6, #2
	adds r2, r0, #0
	add r2, sp
	adds r2, #4
	ldr r3, [sp, #0x18]
	subs r5, r3, r6
_080C3988:
	ldrh r0, [r4, #2]
	movs r3, #2
	ldrsh r1, [r2, r3]
	lsls r3, r0, #0x10
	asrs r0, r3, #0x10
	cmp r1, r0
	bge _080C39A8
	ldrh r7, [r4]
	orrs r7, r3
	ldrh r0, [r2]
	strh r0, [r4]
	ldrh r0, [r2, #2]
	strh r0, [r4, #2]
	strh r7, [r2]
	asrs r0, r7, #0x10
	strh r0, [r2, #2]
_080C39A8:
	adds r2, #4
	subs r5, #1
	cmp r5, #0
	bne _080C3988
_080C39B0:
	adds r5, r6, #0
	cmp r5, r8
	blt _080C396C
_080C39B6:
	ldr r0, [sp, #0x18]
	cmp r0, #0
	ble _080C3A00
	ldr r7, _080C3A18  @ 0x0000012F
	add r4, sp, #4
	movs r6, #0x20
	negs r6, r6
	adds r5, r0, #0
_080C39C6:
	ldrh r2, [r4]
	adds r0, r2, #0
	adds r0, #0x20
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, r7
	bhi _080C39F8
	ldrh r3, [r4, #2]
	movs r1, #2
	ldrsh r0, [r4, r1]
	cmp r0, r6
	blt _080C39F8
	cmp r0, #0xbf
	bgt _080C39F8
	ldr r0, _080C3A1C  @ 0x000001FF
	adds r1, r0, #0
	ands r1, r2
	movs r2, #0xff
	ands r2, r3
	ldr r0, _080C3A20  @ 0x000090F5
	str r0, [sp]
	movs r0, #0
	ldr r3, _080C3A24  @ gObject_8x8
	bl PutSpriteExt
_080C39F8:
	adds r4, #4
	subs r5, #1
	cmp r5, #0
	bne _080C39C6
_080C3A00:
	add sp, #0x20
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C3A10: .4byte gGMData
_080C3A14: .4byte ProcScr_WorldMapMain
_080C3A18: .4byte 0x0000012F
_080C3A1C: .4byte 0x000001FF
_080C3A20: .4byte 0x000090F5
_080C3A24: .4byte gObject_8x8

	THUMB_FUNC_END sub_80C38BC

	THUMB_FUNC_START sub_80C3A28
sub_80C3A28: @ 0x080C3A28
	push {lr}
	ldr r0, _080C3A54  @ ProcScr_WorldMapMain
	bl Proc_Find
	ldr r0, [r0, #0x50]
	adds r0, #0x34
	ldrb r1, [r0]
	ldr r2, _080C3A58  @ gPaletteBuffer+0x320
	lsls r1, r1, #1
	ldr r0, _080C3A5C  @ gUnknown_08AA1930
	adds r0, r1, r0
	ldrh r0, [r0]
	strh r0, [r2, #0x12]
	ldr r0, _080C3A60  @ gUnknown_08AA1950
	adds r1, r1, r0
	ldrh r0, [r1]
	strh r0, [r2, #0xe]
	bl EnablePaletteSync
	pop {r0}
	bx r0
	.align 2, 0
_080C3A54: .4byte ProcScr_WorldMapMain
_080C3A58: .4byte gPaletteBuffer+0x320
_080C3A5C: .4byte gUnknown_08AA1930
_080C3A60: .4byte gUnknown_08AA1950

	THUMB_FUNC_END sub_80C3A28

	THUMB_FUNC_START sub_80C3A64
sub_80C3A64: @ 0x080C3A64
	push {r4, lr}
	adds r4, r0, #0
	bl sub_80C3770
	adds r0, r4, #0
	bl sub_80C38BC
	adds r0, r4, #0
	bl sub_80C380C
	adds r0, r4, #0
	bl sub_80C36E8
	adds r0, r4, #0
	bl sub_80C3A28
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80C3A64

	THUMB_FUNC_START sub_80C3A8C
sub_80C3A8C: @ 0x080C3A8C
	push {r4, lr}
	ldr r4, _080C3AAC  @ gUnknown_0201B458
	adds r0, r4, #0
	movs r1, #8
	movs r2, #8
	movs r3, #0
	bl TileMap_FillRect
	ldr r1, _080C3AB0  @ gUnknown_08AA18AC
	ldr r2, _080C3AB4  @ 0x000071E0
	adds r0, r4, #0
	bl CallARM_FillTileRect
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C3AAC: .4byte gUnknown_0201B458
_080C3AB0: .4byte gUnknown_08AA18AC
_080C3AB4: .4byte 0x000071E0

	THUMB_FUNC_END sub_80C3A8C

	THUMB_FUNC_START sub_80C3AB8
sub_80C3AB8: @ 0x080C3AB8
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r6, _080C3B38  @ gGMData
	ldrb r1, [r6]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _080C3B32
	movs r0, #0
	str r0, [r5, #0x34]
	movs r0, #0x20
	movs r1, #0x20
	movs r2, #0x30
	movs r3, #0x30
	bl sub_80C089C
	adds r1, r5, #0
	adds r1, #0x2a
	strb r0, [r1]
	ldr r3, _080C3B3C  @ gUnknown_08206B70
	movs r2, #0
	ldrsb r2, [r1, r2]
	ldrb r4, [r6]
	lsls r1, r4, #0x1a
	lsrs r1, r1, #0x1e
	lsls r0, r1, #2
	adds r0, r0, r1
	adds r2, r2, r0
	adds r2, r2, r3
	ldrb r0, [r2]
	movs r1, #3
	ands r1, r0
	lsls r1, r1, #4
	movs r0, #0x31
	negs r0, r0
	ands r0, r4
	orrs r0, r1
	strb r0, [r6]
	adds r0, r5, #0
	bl sub_80C3A8C
	adds r1, r5, #0
	adds r1, #0x2d
	ldr r0, [r6, #8]
	asrs r0, r0, #8
	strb r0, [r1]
	adds r2, r5, #0
	adds r2, #0x2e
	ldr r0, [r6, #0xc]
	asrs r0, r0, #8
	strb r0, [r2]
	ldrb r0, [r1]
	subs r1, #2
	strb r0, [r1]
	ldrb r1, [r2]
	adds r0, r5, #0
	adds r0, #0x2c
	strb r1, [r0]
	adds r0, r5, #0
	bl Proc_Break
_080C3B32:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080C3B38: .4byte gGMData
_080C3B3C: .4byte gUnknown_08206B70

	THUMB_FUNC_END sub_80C3AB8

	THUMB_FUNC_START sub_80C3B40
sub_80C3B40: @ 0x080C3B40
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	bl sub_80C3A64
	adds r2, r4, #0
	adds r2, #0x2d
	ldrb r0, [r2]
	adds r5, r4, #0
	adds r5, #0x2b
	strb r0, [r5]
	adds r1, r4, #0
	adds r1, #0x2e
	ldrb r0, [r1]
	adds r7, r4, #0
	adds r7, #0x2c
	strb r0, [r7]
	ldr r6, _080C3BDC  @ gGMData
	ldr r0, [r6, #8]
	asrs r0, r0, #8
	strb r0, [r2]
	ldr r0, [r6, #0xc]
	asrs r3, r0, #8
	strb r3, [r1]
	ldrb r1, [r6]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _080C3BC6
	movs r0, #1
	ldrsb r0, [r6, r0]
	cmp r0, #0
	ble _080C3BD4
	ldrb r0, [r2]
	ldrb r5, [r5]
	cmp r0, r5
	bne _080C3B92
	lsls r0, r3, #0x18
	lsrs r0, r0, #0x18
	ldrb r7, [r7]
	cmp r0, r7
	beq _080C3BD4
_080C3B92:
	movs r0, #0x20
	movs r1, #0x20
	movs r2, #0x30
	movs r3, #0x30
	bl sub_80C089C
	adds r5, r0, #0
	adds r0, r4, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r5, r0
	beq _080C3BD4
	ldrb r1, [r6]
	lsls r1, r1, #0x1a
	ldr r3, _080C3BE0  @ gUnknown_08206B70
	lsrs r2, r1, #0x1e
	lsls r0, r2, #2
	adds r0, r0, r2
	adds r0, r5, r0
	adds r0, r0, r3
	adds r1, r2, #0
	ldrb r0, [r0]
	cmp r1, r0
	beq _080C3BD4
_080C3BC6:
	adds r1, r4, #0
	adds r1, #0x29
	movs r0, #1
	strb r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
_080C3BD4:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C3BDC: .4byte gGMData
_080C3BE0: .4byte gUnknown_08206B70

	THUMB_FUNC_END sub_80C3B40

	THUMB_FUNC_START sub_80C3BE4
sub_80C3BE4: @ 0x080C3BE4
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r6, r1, #0
	ldr r3, _080C3C14  @ gUnknown_08206B70
	adds r0, #0x2a
	movs r2, #0
	ldrsb r2, [r0, r2]
	ldr r0, _080C3C18  @ gGMData
	ldrb r1, [r0]
	lsls r1, r1, #0x1a
	lsrs r1, r1, #0x1e
	lsls r0, r1, #2
	adds r0, r0, r1
	adds r2, r2, r0
	adds r2, r2, r3
	ldrb r5, [r2]
	cmp r5, #1
	beq _080C3C64
	cmp r5, #1
	bgt _080C3C1C
	cmp r5, #0
	beq _080C3C26
	b _080C3D0C
	.align 2, 0
_080C3C14: .4byte gUnknown_08206B70
_080C3C18: .4byte gGMData
_080C3C1C:
	cmp r5, #2
	beq _080C3CA4
	cmp r5, #3
	beq _080C3CD4
	b _080C3D0C
_080C3C26:
	ldr r4, _080C3C5C  @ gBG0TilemapBuffer
	adds r0, r4, #0
	movs r1, #8
	movs r2, #8
	movs r3, #0
	bl TileMap_FillRect
	movs r0, #0x1c
	subs r0, r0, r6
	lsls r0, r0, #1
	ldr r1, _080C3C60  @ gUnknown_0201B430
	adds r0, r0, r1
	adds r1, r4, #0
	adds r2, r6, #0
	movs r3, #8
	bl TileMap_CopyRect
	adds r0, r6, #0
	subs r0, #8
	adds r3, r7, #0
	adds r3, #0x2f
	strb r0, [r3]
	adds r0, r7, #0
	adds r0, #0x30
	strb r5, [r0]
	b _080C3D0C
	.align 2, 0
_080C3C5C: .4byte gBG0TilemapBuffer
_080C3C60: .4byte gUnknown_0201B430
_080C3C64:
	ldr r4, _080C3C9C  @ gBG0TilemapBuffer+0x02C
	adds r0, r4, #0
	movs r1, #8
	movs r2, #8
	movs r3, #0
	bl TileMap_FillRect
	ldr r0, _080C3CA0  @ gUnknown_0201B458
	movs r1, #0x1e
	subs r1, r1, r6
	lsls r1, r1, #1
	subs r4, #0x2c
	adds r1, r1, r4
	adds r2, r6, #0
	movs r3, #8
	bl TileMap_CopyRect
	movs r0, #0x1e
	subs r0, r0, r6
	adds r3, r7, #0
	adds r3, #0x2f
	movs r1, #0
	strb r0, [r3]
	adds r0, r7, #0
	adds r0, #0x30
	strb r1, [r0]
	b _080C3D0C
	.align 2, 0
_080C3C9C: .4byte gBG0TilemapBuffer+0x02C
_080C3CA0: .4byte gUnknown_0201B458
_080C3CA4:
	ldr r4, _080C3CCC  @ gBG0TilemapBuffer+0x300
	adds r0, r4, #0
	movs r1, #8
	movs r2, #8
	movs r3, #0
	bl TileMap_FillRect
	movs r0, #0x1c
	subs r0, r0, r6
	lsls r0, r0, #1
	ldr r1, _080C3CD0  @ gUnknown_0201B430
	adds r0, r0, r1
	adds r1, r4, #0
	adds r2, r6, #0
	movs r3, #8
	bl TileMap_CopyRect
	adds r0, r6, #0
	subs r0, #8
	b _080C3CFE
	.align 2, 0
_080C3CCC: .4byte gBG0TilemapBuffer+0x300
_080C3CD0: .4byte gUnknown_0201B430
_080C3CD4:
	ldr r4, _080C3D18  @ gBG0TilemapBuffer+0x32C
	adds r0, r4, #0
	movs r1, #8
	movs r2, #8
	movs r3, #0
	bl TileMap_FillRect
	ldr r0, _080C3D1C  @ gUnknown_0201B458
	movs r1, #0xcf
	lsls r1, r1, #1
	subs r1, r1, r6
	lsls r1, r1, #1
	ldr r2, _080C3D20  @ 0xFFFFFCD4
	adds r4, r4, r2
	adds r1, r1, r4
	adds r2, r6, #0
	movs r3, #0xc
	bl TileMap_CopyRect
	movs r0, #0x1e
	subs r0, r0, r6
_080C3CFE:
	adds r3, r7, #0
	adds r3, #0x2f
	strb r0, [r3]
	adds r1, r7, #0
	adds r1, #0x30
	movs r0, #0xc
	strb r0, [r1]
_080C3D0C:
	movs r0, #1
	bl BG_EnableSyncByMask
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C3D18: .4byte gBG0TilemapBuffer+0x32C
_080C3D1C: .4byte gUnknown_0201B458
_080C3D20: .4byte 0xFFFFFCD4

	THUMB_FUNC_END sub_80C3BE4

	THUMB_FUNC_START sub_80C3D24
sub_80C3D24: @ 0x080C3D24
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _080C3D58  @ gUnknown_08A3EE6C
	ldr r0, [r4, #0x34]
	adds r0, r0, r1
	movs r1, #0
	ldrsb r1, [r0, r1]
	adds r0, r4, #0
	bl sub_80C3BE4
	adds r0, r4, #0
	bl sub_80C3A64
	ldr r0, [r4, #0x34]
	adds r0, #1
	str r0, [r4, #0x34]
	cmp r0, #4
	bne _080C3D52
	movs r0, #0
	str r0, [r4, #0x34]
	adds r0, r4, #0
	bl Proc_Break
_080C3D52:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C3D58: .4byte gUnknown_08A3EE6C

	THUMB_FUNC_END sub_80C3D24

	THUMB_FUNC_START sub_80C3D5C
sub_80C3D5C: @ 0x080C3D5C
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _080C3D98  @ gUnknown_08A3EE70
	ldr r0, [r4, #0x34]
	adds r0, r0, r1
	movs r1, #0
	ldrsb r1, [r0, r1]
	adds r0, r4, #0
	bl sub_80C3BE4
	adds r0, r4, #0
	bl sub_80C3A64
	ldr r0, [r4, #0x34]
	adds r0, #1
	str r0, [r4, #0x34]
	cmp r0, #4
	bne _080C3D90
	movs r0, #0
	str r0, [r4, #0x34]
	adds r1, r4, #0
	adds r1, #0x29
	strb r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
_080C3D90:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C3D98: .4byte gUnknown_08A3EE70

	THUMB_FUNC_END sub_80C3D5C

	THUMB_FUNC_START sub_80C3D9C
sub_80C3D9C: @ 0x080C3D9C
	movs r1, #0
	str r1, [r0, #0x34]
	adds r2, r0, #0
	adds r2, #0x29
	strb r1, [r2]
	adds r0, #0x2a
	strb r1, [r0]
	bx lr

	THUMB_FUNC_END sub_80C3D9C

	THUMB_FUNC_START sub_80C3DAC
sub_80C3DAC: @ 0x080C3DAC
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r2, _080C3E68  @ gLCDControlBuffer
	ldrb r1, [r2, #1]
	movs r0, #0x21
	negs r0, r0
	ands r0, r1
	movs r1, #0x41
	negs r1, r1
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r2, #1]
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
	movs r1, #0x20
	orrs r0, r1
	strb r0, [r2]
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
	movs r0, #1
	movs r1, #0xe
	movs r2, #3
	movs r3, #0
	bl SetBlendConfig
	movs r0, #0
	str r0, [sp]
	movs r1, #1
	movs r2, #0
	movs r3, #0
	bl SetBlendTargetA
	movs r0, #1
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #1
	movs r3, #1
	bl SetBlendTargetB
	movs r0, #0
	bl SetBlendBackdropA
	ldr r0, _080C3E6C  @ gUnknown_08AA1280
	ldr r1, _080C3E70  @ 0x06003C00
	bl Decompress
	ldr r0, _080C3E74  @ gUnknown_08AA188C
	movs r1, #0xe0
	movs r2, #0x20
	bl CopyToPaletteBuffer
	ldr r0, _080C3E78  @ gPal_GMapPI_ShopIcons
	movs r1, #0xc8
	lsls r1, r1, #2
	movs r2, #0x20
	bl CopyToPaletteBuffer
	bl EnablePaletteSync
	ldr r0, _080C3E7C  @ ProcScr_GmapRader
	ldr r1, [r4, #0x14]
	bl Proc_Start
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C3E68: .4byte gLCDControlBuffer
_080C3E6C: .4byte gUnknown_08AA1280
_080C3E70: .4byte 0x06003C00
_080C3E74: .4byte gUnknown_08AA188C
_080C3E78: .4byte gPal_GMapPI_ShopIcons
_080C3E7C: .4byte ProcScr_GmapRader

	THUMB_FUNC_END sub_80C3DAC

	THUMB_FUNC_START sub_80C3E80
sub_80C3E80: @ 0x080C3E80
	push {lr}
	adds r1, r0, #0
	ldr r0, _080C3E90  @ gUnknown_08A3EED4
	bl Proc_Start
	pop {r1}
	bx r1
	.align 2, 0
_080C3E90: .4byte gUnknown_08A3EED4

	THUMB_FUNC_END sub_80C3E80

	THUMB_FUNC_START sub_80C3E94
sub_80C3E94: @ 0x080C3E94
	push {lr}
	ldr r0, _080C3EB8  @ ProcScr_GmapRader
	bl Proc_EndEach
	ldr r0, _080C3EBC  @ gUnknown_08A3EED4
	bl Proc_EndEach
	bl SetDefaultColorEffects
	ldr r0, _080C3EC0  @ gBG1TilemapBuffer
	movs r1, #0
	bl BG_Fill
	movs r0, #2
	bl BG_EnableSyncByMask
	pop {r0}
	bx r0
	.align 2, 0
_080C3EB8: .4byte ProcScr_GmapRader
_080C3EBC: .4byte gUnknown_08A3EED4
_080C3EC0: .4byte gBG1TilemapBuffer

	THUMB_FUNC_END sub_80C3E94

	THUMB_FUNC_START nullsub_71
nullsub_71: @ 0x080C3EC4
	bx lr

	THUMB_FUNC_END nullsub_71

	THUMB_FUNC_START sub_80C3EC8
sub_80C3EC8: @ 0x080C3EC8
	adds r1, r0, #0
	adds r2, r1, #0
	adds r2, #0x2a
	movs r0, #0
	strb r0, [r2]
	adds r2, #1
	strb r0, [r2]
	subs r0, #1
	str r0, [r1, #0x2c]
	bx lr

	THUMB_FUNC_END sub_80C3EC8

	THUMB_FUNC_START sub_80C3EDC
sub_80C3EDC: @ 0x080C3EDC
	push {r4, lr}
	adds r4, r0, #0
	bl IsBgmPlaying
	adds r1, r4, #0
	adds r1, #0x30
	strb r0, [r1]
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080C3EF6
	bl GetCurrentBgmSong
	str r0, [r4, #0x34]
_080C3EF6:
	adds r0, r4, #0
	bl StartPrepItemScreen
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80C3EDC

	THUMB_FUNC_START sub_80C3F04
sub_80C3F04: @ 0x080C3F04
	push {lr}
	adds r1, r0, #0
	adds r0, #0x30
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _080C3F1E
	ldr r0, [r1, #0x34]
	movs r1, #1
	movs r2, #0
	bl StartBgmFadeIn
_080C3F1E:
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80C3F04

	THUMB_FUNC_START sub_80C3F24
sub_80C3F24: @ 0x080C3F24
	push {lr}
	adds r1, r0, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #1
	beq _080C3F50
	cmp r0, #1
	bgt _080C3F3A
	cmp r0, #0
	beq _080C3F40
	b _080C3F7A
_080C3F3A:
	cmp r0, #2
	beq _080C3F60
	b _080C3F7A
_080C3F40:
	ldr r0, [r1, #0x2c]
	cmp r0, #0
	beq _080C3F70
	adds r0, r1, #0
	movs r1, #1
	bl Proc_Goto
	b _080C3F82
_080C3F50:
	ldr r0, [r1, #0x2c]
	cmp r0, #0
	beq _080C3F70
	adds r0, r1, #0
	movs r1, #2
	bl Proc_Goto
	b _080C3F82
_080C3F60:
	ldr r0, [r1, #0x2c]
	cmp r0, #0
	beq _080C3F70
	adds r0, r1, #0
	movs r1, #3
	bl Proc_Goto
	b _080C3F82
_080C3F70:
	adds r0, r1, #0
	movs r1, #5
	bl Proc_Goto
	b _080C3F82
_080C3F7A:
	adds r0, r1, #0
	movs r1, #5
	bl Proc_Goto
_080C3F82:
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80C3F24

	THUMB_FUNC_START sub_80C3F88
sub_80C3F88: @ 0x080C3F88
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x2c]
	bl GetUnitFromCharId
	ldr r1, _080C3FAC  @ gGMData
	ldrb r1, [r1, #0x11]
	lsls r1, r1, #5
	ldr r2, _080C3FB0  @ gWMNodeData
	adds r1, r1, r2
	ldr r1, [r1, #0xc]
	adds r2, r4, #0
	bl StartArmoryScreen
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C3FAC: .4byte gGMData
_080C3FB0: .4byte gWMNodeData

	THUMB_FUNC_END sub_80C3F88

	THUMB_FUNC_START sub_80C3FB4
sub_80C3FB4: @ 0x080C3FB4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x2c]
	bl GetUnitFromCharId
	ldr r1, _080C3FD8  @ gGMData
	ldrb r1, [r1, #0x11]
	lsls r1, r1, #5
	ldr r2, _080C3FDC  @ gWMNodeData
	adds r1, r1, r2
	ldr r1, [r1, #0x10]
	adds r2, r4, #0
	bl StartVendorScreen
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C3FD8: .4byte gGMData
_080C3FDC: .4byte gWMNodeData

	THUMB_FUNC_END sub_80C3FB4

	THUMB_FUNC_START sub_80C3FE0
sub_80C3FE0: @ 0x080C3FE0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x2c]
	bl GetUnitFromCharId
	ldr r1, _080C4004  @ gGMData
	ldrb r1, [r1, #0x11]
	lsls r1, r1, #5
	ldr r2, _080C4008  @ gWMNodeData
	adds r1, r1, r2
	ldr r1, [r1, #0x14]
	adds r2, r4, #0
	bl StartSecretShopScreen
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C4004: .4byte gGMData
_080C4008: .4byte gWMNodeData

	THUMB_FUNC_END sub_80C3FE0

	THUMB_FUNC_START sub_80C400C
sub_80C400C: @ 0x080C400C
	push {r4, lr}
	adds r4, r0, #0
	cmp r1, #0
	beq _080C4020
	ldr r0, _080C401C  @ ProcScr_GmapBaseMenu
	bl Proc_StartBlocking
	b _080C4028
	.align 2, 0
_080C401C: .4byte ProcScr_GmapBaseMenu
_080C4020:
	ldr r0, _080C4034  @ ProcScr_GmapBaseMenu
	movs r1, #3
	bl Proc_Start
_080C4028:
	adds r1, r0, #0
	adds r1, #0x29
	strb r4, [r1]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080C4034: .4byte ProcScr_GmapBaseMenu

	THUMB_FUNC_END sub_80C400C

	THUMB_FUNC_START sub_80C4038
sub_80C4038: @ 0x080C4038
	push {lr}
	ldr r0, _080C4044  @ ProcScr_GmapBaseMenu
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
_080C4044: .4byte ProcScr_GmapBaseMenu

	THUMB_FUNC_END sub_80C4038

	THUMB_FUNC_START sub_80C4048
sub_80C4048: @ 0x080C4048
	push {lr}
	ldr r0, _080C4054  @ ProcScr_GmapBaseMenu
	bl Proc_Find
	pop {r1}
	bx r1
	.align 2, 0
_080C4054: .4byte ProcScr_GmapBaseMenu

	THUMB_FUNC_END sub_80C4048

	THUMB_FUNC_START sub_80C4058
sub_80C4058: @ 0x080C4058
	push {lr}
	ldr r0, _080C406C  @ ProcScr_GmapBaseMenu
	bl Proc_Find
	cmp r0, #0
	beq _080C4066
	movs r0, #1
_080C4066:
	pop {r1}
	bx r1
	.align 2, 0
_080C406C: .4byte ProcScr_GmapBaseMenu

	THUMB_FUNC_END sub_80C4058

	THUMB_FUNC_START sub_80C4070
sub_80C4070: @ 0x080C4070
	push {lr}
	bl sub_80C4048
	cmp r0, #0
	bne _080C407E
	movs r0, #0
	b _080C4082
_080C407E:
	adds r0, #0x29
	ldrb r0, [r0]
_080C4082:
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80C4070

	THUMB_FUNC_START sub_80C4088
sub_80C4088: @ 0x080C4088
	push {lr}
	bl sub_80C4048
	cmp r0, #0
	bne _080C4096
	movs r0, #0
	b _080C4098
_080C4096:
	ldr r0, [r0, #0x2c]
_080C4098:
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80C4088

	THUMB_FUNC_START sub_80C409C
sub_80C409C: @ 0x080C409C
	push {r4, lr}
	adds r4, r0, #0
	bl sub_80C4048
	cmp r0, #0
	beq _080C40AA
	str r4, [r0, #0x2c]
_080C40AA:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80C409C

.align 2, 0
