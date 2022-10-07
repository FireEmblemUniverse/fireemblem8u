	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

    @ proc effect of event 42

	THUMB_FUNC_START sub_8012B9C
sub_8012B9C: @ 0x08012B9C
	push {r4, lr}
	adds r4, r0, #0
	bl GetGameClock
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	beq _08012C2E
	adds r0, r4, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #0
	beq _08012BBC
	cmp r0, #1
	beq _08012BF0
	b _08012C2E
_08012BBC:
	adds r0, r4, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	cmp r0, #0
	beq _08012BCC
	cmp r0, #1
	beq _08012BDC
	b _08012BE6
_08012BCC:
	ldr r0, _08012BD8  @ gGameState
	ldrh r1, [r0, #0xc]
	movs r2, #2
	eors r1, r2
	strh r1, [r0, #0xc]
	b _08012BE6
	.align 2, 0
_08012BD8: .4byte gGameState
_08012BDC:
	ldr r0, _08012BEC  @ gGameState
	ldrh r1, [r0, #0xe]
	movs r2, #2
	eors r1, r2
	strh r1, [r0, #0xe]
_08012BE6:
	bl RenderBmMap
	b _08012C2E
	.align 2, 0
_08012BEC: .4byte gGameState
_08012BF0:
	adds r0, r4, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	cmp r0, #0
	beq _08012C00
	cmp r0, #1
	beq _08012C18
	b _08012C2E
_08012C00:
	bl GetGameClock
	adds r1, r0, #0
	movs r0, #2
	ands r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r0, #3
	movs r2, #0
	bl BG_SetPosition
	b _08012C2E
_08012C18:
	bl GetGameClock
	adds r2, r0, #0
	movs r0, #2
	ands r2, r0
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #3
	movs r1, #0
	bl BG_SetPosition
_08012C2E:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8012B9C

	THUMB_FUNC_START sub_8012C34
sub_8012C34: @ 0x08012C34
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r6, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r4, r2, #0x18
	ldr r0, _08012C7C  @ gUnknown_085925F0
	bl Proc_Find
	cmp r0, #0
	bne _08012C6A
	cmp r4, #1
	bne _08012C62
	ldr r0, _08012C80  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08012C62
	ldr r0, _08012C84  @ 0x0000026A
	bl m4aSongNumStart
_08012C62:
	ldr r0, _08012C7C  @ gUnknown_085925F0
	movs r1, #3
	bl Proc_Start
_08012C6A:
	adds r1, r0, #0
	adds r1, #0x29
	strb r5, [r1]
	adds r0, #0x2a
	strb r6, [r0]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08012C7C: .4byte gUnknown_085925F0
_08012C80: .4byte gRAMChapterData
_08012C84: .4byte 0x0000026A

	THUMB_FUNC_END sub_8012C34

	THUMB_FUNC_START sub_8012C88
sub_8012C88: @ 0x08012C88
	push {lr}
	ldr r0, _08012CA4  @ gUnknown_085925F0
	bl Proc_Find
	cmp r0, #0
	beq _08012CDA
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #0
	beq _08012CA8
	cmp r0, #1
	beq _08012CC4
	b _08012CCE
	.align 2, 0
_08012CA4: .4byte gUnknown_085925F0
_08012CA8:
	ldr r2, _08012CBC  @ gGameState
	ldrh r3, [r2, #0xc]
	ldr r1, _08012CC0  @ 0x0000FFFC
	adds r0, r1, #0
	ands r0, r3
	strh r0, [r2, #0xc]
	ldrh r0, [r2, #0xe]
	ands r1, r0
	strh r1, [r2, #0xe]
	b _08012CCE
	.align 2, 0
_08012CBC: .4byte gGameState
_08012CC0: .4byte 0x0000FFFC
_08012CC4:
	movs r0, #3
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
_08012CCE:
	ldr r0, _08012CE0  @ gUnknown_085925F0
	bl Proc_EndEach
	movs r0, #4
	bl Sound_FadeOutSE
_08012CDA:
	pop {r0}
	bx r0
	.align 2, 0
_08012CE0: .4byte gUnknown_085925F0

	THUMB_FUNC_END sub_8012C88

    .align 2, 0 @ Don't pad with nop.
    