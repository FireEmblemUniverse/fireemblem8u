	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	THUMB_FUNC_START sub_8043308
sub_8043308: @ 0x08043308
	push {lr}
	adds r1, r0, #0
	ldr r0, _08043318  @ ProcScr_Sio_085A94AC
	bl Proc_StartBlocking
	pop {r0}
	bx r0
	.align 2, 0
_08043318: .4byte ProcScr_Sio_085A94AC

	THUMB_FUNC_END sub_8043308

	THUMB_FUNC_START sub_804331C
sub_804331C: @ 0x0804331C
	push {r4, lr}
	adds r3, r0, #0
	movs r0, #0x4a
	adds r0, r0, r3
	mov ip, r0
	movs r2, #0
	movs r1, #0
	movs r0, #0xd8
	mov r4, ip
	strh r0, [r4]
	adds r0, r3, #0
	adds r0, #0x48
	strb r2, [r0]
	str r1, [r3, #0x40]
	str r1, [r3, #0x3c]
	adds r0, #0xa
	strb r2, [r0]
	adds r1, r3, #0
	adds r1, #0x54
	movs r0, #0xff
	strb r0, [r1]
	subs r1, #1
	movs r0, #1
	negs r0, r0
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x4c
	strb r2, [r0]
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_804331C

	THUMB_FUNC_START sub_804335C
sub_804335C: @ 0x0804335C
	push {r4, lr}
	ldr r0, _08043368  @ gLinkArenaSt
	ldrb r0, [r0, #0xa]
	cmp r0, #0
	bne _08043370
	b _08043388
	.align 2, 0
_08043368: .4byte gLinkArenaSt
_0804336C:
	movs r0, #1
	b _0804338A
_08043370:
	movs r3, #0
	movs r4, #0x80
	ldr r2, _08043390  @ gUnk_Sio_0203DB7C
_08043376:
	ldrb r1, [r2, #0xf]
	adds r0, r4, #0
	ands r0, r1
	cmp r0, #0
	bne _0804336C
	adds r2, #0x14
	adds r3, #1
	cmp r3, #9
	ble _08043376
_08043388:
	movs r0, #0
_0804338A:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08043390: .4byte gUnk_Sio_0203DB7C

	THUMB_FUNC_END sub_804335C

	THUMB_FUNC_START sub_8043394
sub_8043394: @ 0x08043394
	push {r4, lr}
	movs r3, #0
	movs r4, #0x80
	ldr r2, _080433AC  @ gUnk_Sio_0203DB7C
_0804339C:
	ldrb r1, [r2, #0xf]
	adds r0, r4, #0
	ands r0, r1
	cmp r0, #0
	bne _080433B0
	movs r0, #1
	b _080433BA
	.align 2, 0
_080433AC: .4byte gUnk_Sio_0203DB7C
_080433B0:
	adds r2, #0x14
	adds r3, #1
	cmp r3, #9
	ble _0804339C
	movs r0, #0
_080433BA:
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8043394

	THUMB_FUNC_START sub_80433C0
sub_80433C0: @ 0x080433C0
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	sub sp, #0x10
	mov r9, r0
	lsls r1, r1, #0x18
	lsrs r4, r1, #0x18
	movs r7, #0
	ldr r1, _080433F0  @ gUnknown_085A94A0
	lsls r0, r4, #2
	adds r0, r0, r1
	ldr r0, [r0]
	mov r8, r0
	bl InitUnits
	cmp r4, #0
	beq _080433F4
	cmp r4, #0
	blt _0804349E
	cmp r4, #2
	bgt _0804349E
	movs r6, #0
	b _08043460
	.align 2, 0
_080433F0: .4byte gUnknown_085A94A0
_080433F4:
	movs r6, #0
	mov r1, r9
	lsls r0, r1, #4
	mov r1, r8
	adds r5, r0, r1
	movs r0, #1
	mov r8, r0
	movs r7, #0
_08043404:
	ldr r0, _08043420  @ gUnk_Sio_0203DB7C
	adds r4, r7, r0
	adds r0, r6, #0
	adds r1, r4, #0
	bl ReadMultiArenaSaveTeamName
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _08043424
	ldrb r0, [r5, #4]
	strb r0, [r4, #0x10]
	strb r6, [r4, #0xf]
	b _08043440
	.align 2, 0
_08043420: .4byte gUnk_Sio_0203DB7C
_08043424:
	movs r0, #0xcc
	bl GetStringFromIndex
	adds r1, r4, #0
	bl SioStrCpy
	ldrb r0, [r5, #5]
	strb r0, [r4, #0x10]
	movs r0, #0x80
	negs r0, r0
	adds r1, r0, #0
	adds r0, r6, #0
	orrs r0, r1
	strb r0, [r4, #0xf]
_08043440:
	mov r0, r8
	bl GetUnit
	adds r1, r0, #0
	adds r0, r6, #0
	mov r2, sp
	bl ReadMultiArenaSaveTeam
	movs r1, #5
	add r8, r1
	adds r7, #0x14
	adds r6, #1
	cmp r6, #9
	ble _08043404
	adds r7, r6, #0
	b _0804349E
_08043460:
	lsls r0, r7, #2
	adds r5, r0, r7
	lsls r1, r5, #2
	ldr r0, _080434B0  @ gUnk_Sio_0203DB7C
	adds r4, r1, r0
	adds r0, r6, #0
	adds r1, r4, #0
	bl ReadMultiArenaSaveTeamName
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _08043498
	mov r1, r9
	lsls r0, r1, #4
	add r0, r8
	ldrb r0, [r0, #4]
	strb r0, [r4, #0x10]
	strb r6, [r4, #0xf]
	adds r0, r5, #1
	bl GetUnit
	adds r1, r0, #0
	adds r0, r6, #0
	mov r2, sp
	bl ReadMultiArenaSaveTeam
	adds r7, #1
_08043498:
	adds r6, #1
	cmp r6, #9
	ble _08043460
_0804349E:
	adds r0, r7, #0
	add sp, #0x10
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080434B0: .4byte gUnk_Sio_0203DB7C

	THUMB_FUNC_END sub_80433C0

	THUMB_FUNC_START sub_80434B4
sub_80434B4: @ 0x080434B4
	push {r4, r5, r6, lr}
	mov r6, r9
	mov r5, r8
	push {r5, r6}
	adds r5, r0, #0
	lsls r0, r5, #3
	mov r8, r0
	ldr r6, _0804351C  @ gLinkArenaSt+0x0C
	adds r0, r0, r6
	mov r9, r0
	bl ClearText
	mov r0, r9
	movs r1, #0
	bl Text_SetColor
	lsls r4, r5, #2
	adds r4, r4, r5
	lsls r4, r4, #2
	ldr r0, _08043520  @ gUnk_Sio_0203DB7C
	adds r4, r4, r0
	mov r0, r9
	adds r1, r4, #0
	bl Text_DrawString
	subs r6, #0xc
	add r8, r6
	mov r1, r8
	ldrh r0, [r1, #0xc]
	ldr r1, _08043524  @ 0x00000FFF
	ands r1, r0
	ldrb r2, [r4, #0x10]
	movs r0, #0xf
	ands r0, r2
	lsls r0, r0, #0xc
	orrs r1, r0
	mov r0, r8
	strh r1, [r0, #0xc]
	lsls r5, r5, #7
	ldr r0, _08043528  @ gBG1TilemapBuffer+0x016
	adds r5, r5, r0
	mov r0, r9
	adds r1, r5, #0
	bl PutText
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0804351C: .4byte gLinkArenaSt+0x0C
_08043520: .4byte gUnk_Sio_0203DB7C
_08043524: .4byte 0x00000FFF
_08043528: .4byte gBG1TilemapBuffer+0x016

	THUMB_FUNC_END sub_80434B4

	THUMB_FUNC_START sub_804352C
sub_804352C: @ 0x0804352C
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r4, #0
	b _0804353C
_08043534:
	adds r0, r4, #0
	bl sub_80434B4
	adds r4, #1
_0804353C:
	ldr r0, [r5, #0x38]
	cmp r4, r0
	blt _08043534
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_804352C

	THUMB_FUNC_START sub_8043548
sub_8043548: @ 0x08043548
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r4, r0, #0
	lsls r1, r1, #0x18
	ldr r0, _08043588  @ gUnknown_085A94A0
	lsrs r1, r1, #0x16
	adds r1, r1, r0
	ldr r7, [r1]
	movs r6, #0
	ldr r0, [r4, #0x38]
	cmp r6, r0
	bge _080435D4
	ldr r0, _0804358C  @ gLinkArenaSt
	adds r5, r0, #0
	adds r5, #0xc
	ldr r0, _08043590  @ gUnk_Sio_0203DB7C
	mov r8, r0
	movs r3, #0
_08043570:
	ldr r0, _08043590  @ gUnk_Sio_0203DB7C
	adds r2, r3, r0
	ldrb r1, [r2, #0xf]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _08043594
	ldr r0, [r4, #0x3c]
	lsls r0, r0, #4
	adds r0, r0, r7
	ldrb r0, [r0, #4]
	b _0804359C
	.align 2, 0
_08043588: .4byte gUnknown_085A94A0
_0804358C: .4byte gLinkArenaSt
_08043590: .4byte gUnk_Sio_0203DB7C
_08043594:
	ldr r0, [r4, #0x3c]
	lsls r0, r0, #4
	adds r0, r0, r7
	ldrb r0, [r0, #5]
_0804359C:
	strb r0, [r2, #0x10]
	ldrh r1, [r5]
	ldr r2, _080435E8  @ 0x00000FFF
	adds r0, r2, #0
	ands r1, r0
	mov r0, r8
	ldrb r2, [r0, #0x10]
	movs r0, #0xf
	ands r0, r2
	lsls r0, r0, #0xc
	orrs r1, r0
	strh r1, [r5]
	lsls r1, r6, #7
	ldr r0, _080435EC  @ gBG1TilemapBuffer+0x016
	adds r1, r1, r0
	adds r0, r5, #0
	str r3, [sp]
	bl PutText
	adds r5, #8
	movs r2, #0x14
	add r8, r2
	ldr r3, [sp]
	adds r3, #0x14
	adds r6, #1
	ldr r0, [r4, #0x38]
	cmp r6, r0
	blt _08043570
_080435D4:
	movs r0, #2
	bl BG_EnableSyncByMask
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080435E8: .4byte 0x00000FFF
_080435EC: .4byte gBG1TilemapBuffer+0x016

	THUMB_FUNC_END sub_8043548

	THUMB_FUNC_START sub_80435F0
sub_80435F0: @ 0x080435F0
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	adds r7, r0, #0
	ldr r5, [r7, #0x40]
	ldr r1, _08043678  @ gUnknown_085A94A0
	ldr r0, _0804367C  @ gLinkArenaSt
	mov r9, r0
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	mov r8, r0
	lsls r4, r5, #2
	adds r4, r4, r5
	adds r0, r4, #1
	bl GetUnit
	adds r6, r0, #0
	ldr r0, _08043680  @ gUnk_Sio_0203DB7C
	lsls r4, r4, #2
	adds r4, r4, r0
	ldrb r1, [r4, #0xf]
	movs r0, #0x7f
	ands r0, r1
	bl WipeMultiArenaSaveTeam
	adds r0, r5, #0
	adds r1, r6, #0
	adds r2, r4, #0
	bl ReadMultiArenaSaveTeam
	movs r0, #0xcc
	bl GetStringFromIndex
	adds r1, r4, #0
	bl SioStrCpy
	ldr r0, [r7, #0x3c]
	lsls r0, r0, #4
	add r0, r8
	ldrb r0, [r0, #5]
	strb r0, [r4, #0x10]
	movs r2, #0x80
	negs r2, r2
	adds r1, r2, #0
	adds r0, r5, #0
	orrs r0, r1
	strb r0, [r4, #0xf]
	adds r0, r5, #0
	bl sub_80434B4
	bl sub_8043394
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08043684
	mov r1, r9
	ldrb r0, [r1]
	adds r1, r7, #0
	bl sub_80437C0
	adds r0, r7, #0
	movs r1, #2
	bl Proc_Goto
	b _08043698
	.align 2, 0
_08043678: .4byte gUnknown_085A94A0
_0804367C: .4byte gLinkArenaSt
_08043680: .4byte gUnk_Sio_0203DB7C
_08043684:
	adds r0, r7, #0
	adds r0, #0x4d
	ldrb r0, [r0]
	cmp r0, #0
	bne _08043698
	mov r2, r9
	ldrb r0, [r2]
	adds r1, r7, #0
	bl sub_80437C0
_08043698:
	ldr r0, [r7, #0x38]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r1, r7, #0
	adds r1, #0x4a
	ldrh r1, [r1]
	adds r1, #0x28
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl sub_804D24C
	movs r0, #2
	bl BG_EnableSyncByMask
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80435F0

	THUMB_FUNC_START sub_80436C0
sub_80436C0: @ 0x080436C0
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	mov r9, r0
	ldr r7, [r0, #0x40]
	adds r0, #0x53
	ldrb r0, [r0]
	mov r8, r0
	ldr r3, _08043730  @ gUnk_Sio_0203DB7C
	lsls r5, r0, #2
	add r5, r8
	lsls r0, r5, #2
	adds r6, r0, r3
	ldrb r2, [r6, #0xf]
	movs r1, #0x7f
	adds r0, r1, #0
	ands r0, r2
	lsls r4, r7, #2
	adds r4, r4, r7
	lsls r4, r4, #2
	adds r4, r4, r3
	ldrb r2, [r4, #0xf]
	ands r1, r2
	bl SwapMultiArenaSaveTeams
	ldrb r1, [r6, #0x10]
	ldrb r0, [r4, #0x10]
	strb r0, [r6, #0x10]
	strb r1, [r4, #0x10]
	adds r5, #1
	adds r0, r5, #0
	bl GetUnit
	adds r1, r0, #0
	mov r0, r8
	adds r2, r6, #0
	bl ReadMultiArenaSaveTeam
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08043734
	movs r0, #0xcc
	bl GetStringFromIndex
	adds r1, r6, #0
	bl SioStrCpy
	movs r0, #0x80
	negs r0, r0
	adds r1, r0, #0
	mov r0, r8
	orrs r0, r1
	strb r0, [r6, #0xf]
	b _08043738
	.align 2, 0
_08043730: .4byte gUnk_Sio_0203DB7C
_08043734:
	mov r1, r8
	strb r1, [r6, #0xf]
_08043738:
	lsls r4, r7, #2
	adds r4, r4, r7
	adds r0, r4, #1
	bl GetUnit
	adds r1, r0, #0
	lsls r4, r4, #2
	ldr r0, _08043774  @ gUnk_Sio_0203DB7C
	adds r4, r4, r0
	adds r0, r7, #0
	adds r2, r4, #0
	bl ReadMultiArenaSaveTeam
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08043778
	movs r0, #0xcc
	bl GetStringFromIndex
	adds r1, r4, #0
	bl SioStrCpy
	movs r0, #0x80
	negs r0, r0
	adds r1, r0, #0
	adds r0, r7, #0
	orrs r0, r1
	strb r0, [r4, #0xf]
	b _0804377A
	.align 2, 0
_08043774: .4byte gUnk_Sio_0203DB7C
_08043778:
	strb r7, [r4, #0xf]
_0804377A:
	adds r0, r7, #0
	bl sub_80434B4
	mov r0, r8
	bl sub_80434B4
	mov r1, r9
	ldr r0, [r1, #0x38]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r1, #0x4a
	ldrh r1, [r1]
	adds r1, #0x28
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl sub_804D24C
	mov r1, r9
	ldr r0, [r1, #0x30]
	bl Proc_End
	mov r1, r9
	adds r1, #0x52
	movs r0, #4
	strb r0, [r1]
	movs r0, #2
	bl BG_EnableSyncByMask
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80436C0

	THUMB_FUNC_START sub_80437C0
sub_80437C0: @ 0x080437C0
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	mov r8, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r6, #0
	ldr r2, _08043838  @ gUnknown_085A94A0
	lsls r1, r0, #2
	adds r1, r1, r2
	ldr r7, [r1]
	cmp r0, #1
	bne _08043848
	ldr r1, _0804383C  @ gLinkArenaSt
	ldrb r0, [r1, #5]
	adds r0, #2
	cmp r6, r0
	bge _0804382E
	mov r9, r1
	movs r0, #5
	mov r8, r0
	mov r5, r9
	adds r5, #0x64
	movs r7, #0
_080437F4:
	ldr r0, _08043840  @ 0x0000076B
	bl GetStringFromIndex
	ldr r4, _08043844  @ gUnk_Sio_0203DD50
	adds r4, r7, r4
	adds r1, r4, #0
	bl SioStrCpy
	adds r0, r5, #0
	bl ClearText
	movs r0, #0xa
	str r0, [sp]
	adds r0, r5, #0
	movs r1, #1
	mov r2, r8
	adds r3, r4, #0
	bl PutDrawTextCentered
	movs r1, #3
	add r8, r1
	adds r5, #8
	adds r7, #0xf
	adds r6, #1
	mov r1, r9
	ldrb r0, [r1, #5]
	adds r0, #2
	cmp r6, r0
	blt _080437F4
_0804382E:
	ldr r0, _0804383C  @ gLinkArenaSt
	ldrb r0, [r0, #5]
	adds r0, #2
	b _080438B0
	.align 2, 0
_08043838: .4byte gUnknown_085A94A0
_0804383C: .4byte gLinkArenaSt
_08043840: .4byte 0x0000076B
_08043844: .4byte gUnk_Sio_0203DD50
_08043848:
	lsls r0, r6, #4
	adds r1, r0, r7
	ldr r0, [r1, #8]
	cmp r0, #0
	bne _08043856
	adds r0, r6, #0
	b _080438B0
_08043856:
	mov r0, r8
	adds r0, #0x4d
	adds r4, r0, r6
	movs r0, #1
	strb r0, [r4]
	movs r5, #0
	ldr r0, [r1, #0xc]
	cmp r0, #0
	beq _08043876
	bl _call_via_r0
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08043876
	strb r5, [r4]
	movs r5, #1
_08043876:
	lsls r4, r6, #3
	ldr r0, _080438AC  @ gUnk_Sio_0203DA88
	adds r4, r4, r0
	adds r0, r4, #0
	bl ClearText
	adds r0, r4, #0
	adds r1, r5, #0
	bl Text_SetColor
	lsls r0, r6, #4
	adds r0, r0, r7
	ldr r0, [r0, #8]
	bl GetStringFromIndex
	adds r3, r0, #0
	lsls r2, r6, #1
	adds r2, #5
	movs r0, #7
	str r0, [sp]
	adds r0, r4, #0
	movs r1, #1
	bl PutDrawTextCentered
	adds r6, #1
	b _08043848
	.align 2, 0
_080438AC: .4byte gUnk_Sio_0203DA88
_080438B0:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80437C0

	THUMB_FUNC_START sub_80438C0
sub_80438C0: @ 0x080438C0
	push {lr}
	adds r3, r0, #0
	ldr r2, _080438E0  @ gUnknown_085A94A0
	ldr r0, _080438E4  @ gLinkArenaSt
	ldrb r1, [r0]
	lsls r0, r1, #2
	adds r0, r0, r2
	ldr r2, [r0]
	cmp r1, #1
	beq _080438E8
	ldr r0, [r3, #0x3c]
	lsls r0, r0, #4
	adds r0, r0, r2
	ldrh r0, [r0, #2]
	b _080438FA
	.align 2, 0
_080438E0: .4byte gUnknown_085A94A0
_080438E4: .4byte gLinkArenaSt
_080438E8:
	ldr r0, [r3, #0x3c]
	cmp r0, #0
	beq _080438F8
	ldr r0, _080438F4  @ 0x00000743
	b _080438FA
	.align 2, 0
_080438F4: .4byte 0x00000743
_080438F8:
	ldr r0, _08043900  @ 0x00000742
_080438FA:
	pop {r1}
	bx r1
	.align 2, 0
_08043900: .4byte 0x00000742

	THUMB_FUNC_END sub_80438C0

	THUMB_FUNC_START sub_8043904
sub_8043904: @ 0x08043904
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0xc
	adds r7, r0, #0
	ldr r5, _08043AD0  @ Pal_Text
	bl ClearSioBG
	bl InitSioBG
	movs r4, #0
	str r4, [sp]
	adds r0, r7, #0
	movs r1, #0
	movs r2, #0x12
	movs r3, #2
	bl StartMuralBackgroundExt
	ldr r0, _08043AD4  @ Img_TacticianSelObj
	ldr r1, _08043AD8  @ 0x06014800
	bl Decompress
	ldr r0, _08043ADC  @ gBG2TilemapBuffer+0x112
	ldr r1, _08043AE0  @ gUnknown_085ADF40
	movs r2, #0x80
	lsls r2, r2, #5
	bl CallARM_FillTileRect
	ldr r0, _08043AE4  @ Pal_TacticianSelObj
	movs r1, #0x98
	lsls r1, r1, #2
	movs r2, #0x80
	bl CopyToPaletteBuffer
	ldr r0, _08043AE8  @ gUnknown_085AC604
	ldr r1, _08043AEC  @ 0x06016000
	bl Decompress
	ldr r0, _08043AF0  @ gUnknown_08A1BD00
	movs r1, #0x88
	lsls r1, r1, #2
	movs r2, #0x40
	bl CopyToPaletteBuffer
	ldr r1, _08043AF4  @ gPaletteBuffer
	adds r0, r1, #0
	adds r0, #0x40
	strh r4, [r0]
	adds r1, #0x42
	movs r2, #2
_08043968:
	ldrh r0, [r5, #8]
	strh r0, [r1]
	adds r5, #2
	adds r1, #2
	subs r2, #1
	cmp r2, #0
	bge _08043968
	bl EnablePaletteSync
	ldr r0, _08043AF8  @ Font_0203DB64
	bl SetTextFont
	bl InitSystemTextFont
	bl ResetTextFont
	bl sub_8043164
	bl SetupMapSpritesPalettes
	bl ResetUnitSprites
	bl ForceSyncUnitSpriteSheet
	ldr r0, [r7, #0x3c]
	ldr r1, _08043AFC  @ gLinkArenaSt
	ldrb r1, [r1]
	bl sub_80433C0
	str r0, [r7, #0x38]
	adds r6, r7, #0
	adds r6, #0x5c
	adds r5, r7, #0
	adds r5, #0x4a
	movs r1, #0
	add r0, sp, #8
_080439B0:
	strb r1, [r0]
	subs r0, #1
	add r2, sp, #4
	cmp r0, r2
	bge _080439B0
	ldr r0, [r7, #0x3c]
	mov r1, sp
	adds r1, r1, r0
	adds r1, #4
	movs r0, #1
	strb r0, [r1]
	ldr r4, _08043AFC  @ gLinkArenaSt
	ldrb r0, [r4]
	adds r1, r7, #0
	bl sub_80437C0
	str r0, [r7, #0x34]
	adds r0, r7, #0
	bl sub_804352C
	ldr r1, [r7, #0x34]
	adds r0, r7, #0
	add r2, sp, #4
	bl sub_804CAEC
	str r0, [r7, #0x2c]
	movs r2, #0
	adds r4, #6
	movs r3, #0xff
_080439EA:
	adds r1, r2, r4
	ldrb r0, [r1]
	orrs r0, r3
	strb r0, [r1]
	adds r2, #1
	cmp r2, #3
	ble _080439EA
	movs r4, #0
	strb r4, [r6]
	ldrh r2, [r5]
	movs r0, #1
	movs r1, #0
	bl BG_SetPosition
	ldr r0, _08043B00  @ gLCDControlBuffer
	mov ip, r0
	ldrb r0, [r0, #1]
	movs r1, #0x20
	orrs r0, r1
	movs r1, #0x40
	orrs r0, r1
	movs r1, #0x7f
	ands r0, r1
	mov r1, ip
	strb r0, [r1, #1]
	mov r0, ip
	adds r0, #0x2d
	strb r4, [r0]
	adds r1, #0x31
	movs r0, #0x28
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x2c
	movs r2, #0xf0
	strb r2, [r0]
	adds r0, #4
	movs r1, #0x88
	strb r1, [r0]
	subs r0, #1
	strb r4, [r0]
	adds r0, #4
	strb r1, [r0]
	subs r0, #5
	strb r2, [r0]
	mov r1, ip
	adds r1, #0x32
	movs r0, #0xa0
	strb r0, [r1]
	mov r5, ip
	adds r5, #0x34
	ldrb r0, [r5]
	movs r4, #1
	orrs r0, r4
	movs r1, #2
	orrs r0, r1
	movs r3, #4
	orrs r0, r3
	movs r2, #8
	orrs r0, r2
	movs r6, #0x10
	orrs r0, r6
	strb r0, [r5]
	movs r0, #0x35
	add r0, ip
	mov r8, r0
	ldrb r0, [r0]
	orrs r0, r4
	movs r5, #3
	negs r5, r5
	ands r0, r5
	orrs r0, r3
	orrs r0, r2
	movs r1, #0x11
	negs r1, r1
	ands r0, r1
	mov r1, r8
	strb r0, [r1]
	mov r1, ip
	adds r1, #0x36
	ldrb r0, [r1]
	orrs r0, r4
	ands r0, r5
	orrs r0, r3
	orrs r0, r2
	orrs r0, r6
	strb r0, [r1]
	ldr r0, [r7, #0x2c]
	ldr r2, _08043B04  @ gUnknown_080D9D5E
	ldr r1, _08043AFC  @ gLinkArenaSt
	ldrb r1, [r1]
	adds r1, r1, r2
	ldrb r1, [r1]
	movs r2, #0
	bl NewProc085AA980
	bl sub_804C558
	adds r0, r7, #0
	bl sub_80438C0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #1
	bl sub_8043100
	movs r0, #0xf
	bl BG_EnableSyncByMask
	add sp, #0xc
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08043AD0: .4byte Pal_Text
_08043AD4: .4byte Img_TacticianSelObj
_08043AD8: .4byte 0x06014800
_08043ADC: .4byte gBG2TilemapBuffer+0x112
_08043AE0: .4byte gUnknown_085ADF40
_08043AE4: .4byte Pal_TacticianSelObj
_08043AE8: .4byte gUnknown_085AC604
_08043AEC: .4byte 0x06016000
_08043AF0: .4byte gUnknown_08A1BD00
_08043AF4: .4byte gPaletteBuffer
_08043AF8: .4byte Font_0203DB64
_08043AFC: .4byte gLinkArenaSt
_08043B00: .4byte gLCDControlBuffer
_08043B04: .4byte gUnknown_080D9D5E

	THUMB_FUNC_END sub_8043904

	THUMB_FUNC_START sub_8043B08
sub_8043B08: @ 0x08043B08
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	lsls r1, r1, #0x18
	lsrs r7, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r5, r2, #0x18
	lsls r3, r3, #0x18
	lsrs r6, r3, #0x18
	ldr r1, _08043B68  @ gKeyStatusPtr
	ldr r2, [r1]
	ldrh r3, [r2, #6]
	movs r0, #0x40
	ands r0, r3
	cmp r0, #0
	beq _08043B3E
	ldr r0, [r4]
	cmp r0, r5
	bgt _08043B32
	ldrh r2, [r2, #8]
	cmp r3, r2
	bne _08043B3E
_08043B32:
	subs r0, #1
	str r0, [r4]
	cmp r0, #0
	bge _08043B3E
	subs r0, r6, #1
	str r0, [r4]
_08043B3E:
	ldr r1, [r1]
	ldrh r2, [r1, #6]
	movs r0, #0x80
	ands r0, r2
	cmp r0, #0
	beq _08043B62
	ldr r0, [r4]
	cmp r0, r7
	blt _08043B56
	ldrh r1, [r1, #8]
	cmp r2, r1
	bne _08043B62
_08043B56:
	adds r0, #1
	str r0, [r4]
	adds r1, r6, #0
	bl __modsi3
	str r0, [r4]
_08043B62:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08043B68: .4byte gKeyStatusPtr

	THUMB_FUNC_END sub_8043B08

	THUMB_FUNC_START sub_8043B6C
sub_8043B6C: @ 0x08043B6C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	adds r4, r0, #0
	ldr r6, [r4, #0x3c]
	ldr r1, _08043C38  @ gUnknown_085A94A0
	ldr r0, _08043C3C  @ gLinkArenaSt
	mov r8, r0
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	mov r9, r0
	ldr r5, [r4, #0x2c]
	adds r0, r5, #0
	adds r0, #0x44
	movs r1, #0
	mov sl, r1
	movs r7, #1
	strb r7, [r0]
	movs r0, #1
	negs r0, r0
	str r0, [r5, #0x48]
	adds r0, r4, #0
	adds r0, #0x3c
	ldr r3, [r4, #0x34]
	subs r1, r3, #1
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	movs r2, #0
	bl sub_8043B08
	ldr r0, [r4, #0x3c]
	cmp r6, r0
	beq _08043BEA
	movs r0, #3
	bl SioPlaySoundEffect
	adds r0, r5, #0
	adds r0, #0x3a
	adds r1, r0, r6
	mov r2, sl
	strb r2, [r1]
	ldr r1, [r4, #0x3c]
	adds r0, r0, r1
	strb r7, [r0]
	mov r0, r8
	ldrb r1, [r0]
	adds r0, r4, #0
	bl sub_8043548
	adds r0, r4, #0
	bl sub_80438C0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #1
	bl sub_8043100
_08043BEA:
	ldr r0, _08043C40  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	adds r0, r7, #0
	ands r0, r1
	cmp r0, #0
	beq _08043C7C
	mov r1, r8
	ldrb r0, [r1]
	cmp r0, #1
	beq _08043C5A
	adds r0, r4, #0
	adds r0, #0x4d
	ldr r1, [r4, #0x3c]
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _08043C52
	lsls r0, r1, #4
	add r0, r9
	ldrb r0, [r0]
	adds r1, r4, #0
	adds r1, #0x52
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #7
	bne _08043C44
	movs r0, #1
	bl SioPlaySoundEffect
	adds r0, r4, #0
	movs r1, #9
	bl Proc_Goto
	movs r0, #0xff
	mov r2, r8
	strb r0, [r2, #3]
	b _08043CD8
	.align 2, 0
_08043C38: .4byte gUnknown_085A94A0
_08043C3C: .4byte gLinkArenaSt
_08043C40: .4byte gKeyStatusPtr
_08043C44:
	movs r0, #2
	bl SioPlaySoundEffect
	adds r0, r4, #0
	bl Proc_Break
	b _08043C7C
_08043C52:
	movs r0, #0
	bl SioPlaySoundEffect
	b _08043C7C
_08043C5A:
	movs r0, #2
	bl SioPlaySoundEffect
	adds r1, r4, #0
	adds r1, #0x52
	movs r0, #8
	strb r0, [r1]
	ldr r0, [r4, #0x3c]
	adds r1, #1
	strb r0, [r1]
	mov r0, sl
	str r0, [r4, #0x44]
	adds r0, r4, #0
	movs r1, #5
	bl Proc_Goto
	b _08043CD8
_08043C7C:
	ldr r5, _08043CE8  @ gKeyStatusPtr
	ldr r0, [r5]
	ldrh r1, [r0, #8]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08043C9E
	movs r0, #1
	bl SioPlaySoundEffect
	adds r0, r4, #0
	movs r1, #9
	bl Proc_Goto
	ldr r1, _08043CEC  @ gLinkArenaSt
	movs r0, #0xff
	strb r0, [r1, #3]
_08043C9E:
	ldr r0, [r5]
	ldrh r1, [r0, #8]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _08043CD8
	adds r0, r4, #0
	adds r0, #0x5c
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _08043CD8
	ldr r0, _08043CF0  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08043CCA
	movs r0, #0x6a
	bl m4aSongNumStart
_08043CCA:
	ldr r1, _08043CEC  @ gLinkArenaSt
	movs r0, #0
	strb r0, [r1, #3]
	adds r0, r4, #0
	movs r1, #9
	bl Proc_Goto
_08043CD8:
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08043CE8: .4byte gKeyStatusPtr
_08043CEC: .4byte gLinkArenaSt
_08043CF0: .4byte gPlaySt

	THUMB_FUNC_END sub_8043B6C

	THUMB_FUNC_START sub_8043CF4
sub_8043CF4: @ 0x08043CF4
	push {r4, lr}
	sub sp, #0x10
	adds r4, r0, #0
	ldr r0, [r4, #0x2c]
	bl Proc_End
	bl nullsub_13
	bl EndMuralBackground
	bl InitUnits
	movs r0, #1
	bl GetUnit
	adds r1, r0, #0
	ldr r3, _08043D38  @ gUnk_Sio_0203DB7C
	ldr r2, [r4, #0x40]
	lsls r0, r2, #2
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r0, r0, r3
	ldrb r0, [r0, #0xf]
	mov r2, sp
	bl ReadMultiArenaSaveTeam
	adds r0, r4, #0
	bl StartUnitListScreenUnk
	add sp, #0x10
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08043D38: .4byte gUnk_Sio_0203DB7C

	THUMB_FUNC_END sub_8043CF4

	THUMB_FUNC_START sub_8043D3C
sub_8043D3C: @ 0x08043D3C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08043D58  @ ProcScr_UnitListScreen_PrepMenu
	bl Proc_Find
	cmp r0, #0
	bne _08043D50
	adds r0, r4, #0
	bl Proc_Break
_08043D50:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08043D58: .4byte ProcScr_UnitListScreen_PrepMenu

	THUMB_FUNC_END sub_8043D3C

	THUMB_FUNC_START sub_8043D5C
sub_8043D5C: @ 0x08043D5C
	push {lr}
	movs r1, #0
	ldr r2, _08043D7C  @ gLinkArenaSt
	ldrb r0, [r2, #5]
	adds r0, #2
	cmp r1, r0
	bge _08043D86
	adds r3, r2, #6
	adds r2, r0, #0
_08043D6E:
	adds r0, r1, r3
	ldrb r0, [r0]
	cmp r0, #0xff
	bne _08043D80
	movs r0, #0
	b _08043D88
	.align 2, 0
_08043D7C: .4byte gLinkArenaSt
_08043D80:
	adds r1, #1
	cmp r1, r2
	blt _08043D6E
_08043D86:
	movs r0, #1
_08043D88:
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8043D5C

	THUMB_FUNC_START sub_8043D8C
sub_8043D8C: @ 0x08043D8C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	adds r7, r0, #0
	ldr r0, [r7, #0x40]
	mov r9, r0
	ldr r1, [r7, #0x2c]
	str r1, [sp, #4]
	ldr r0, _08043DD0  @ gSioList_085A93E0
	bl sub_8043268
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08043DD8
	ldr r1, _08043DD4  @ gUnk_Sio_0203DB7C
	mov r2, r9
	lsls r0, r2, #2
	add r0, r9
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r1, [r0, #0xf]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _08043DD8
	adds r0, r7, #0
	movs r1, #8
	bl Proc_Goto
	b _08044270
	.align 2, 0
_08043DD0: .4byte gSioList_085A93E0
_08043DD4: .4byte gUnk_Sio_0203DB7C
_08043DD8:
	ldr r1, [sp, #4]
	adds r1, #0x44
	movs r0, #0
	strb r0, [r1]
	adds r2, r7, #0
	adds r2, #0x48
	ldrb r1, [r2]
	ldr r0, [r7, #0x40]
	subs r0, r0, r1
	lsls r0, r0, #4
	adds r0, #0x28
	ldr r3, [sp, #4]
	str r0, [r3, #0x48]
	adds r0, r7, #0
	adds r0, #0x4c
	movs r1, #0
	ldrsb r1, [r0, r1]
	mov sl, r2
	str r0, [sp, #8]
	cmp r1, #0
	ble _08043E36
	adds r4, r7, #0
	adds r4, #0x4a
	ldrh r0, [r4]
	subs r0, #4
	strh r0, [r4]
	ldr r1, [sp, #8]
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	ldrh r2, [r4]
	movs r0, #1
	movs r1, #0
	bl BG_SetPosition
	ldr r0, [r7, #0x30]
	cmp r0, #0
	beq _08043E2A
	movs r1, #4
	bl sub_804303C
_08043E2A:
	movs r0, #4
	bl sub_804CC5C
	mov r2, sl
	ldrb r0, [r2]
	b _08043E70
_08043E36:
	cmp r1, #0
	bge _08043E92
	adds r4, r7, #0
	adds r4, #0x4a
	ldrh r0, [r4]
	adds r0, #4
	strh r0, [r4]
	ldr r3, [sp, #8]
	ldrb r0, [r3]
	adds r0, #1
	strb r0, [r3]
	ldrh r2, [r4]
	movs r0, #1
	movs r1, #0
	bl BG_SetPosition
	ldr r0, [r7, #0x30]
	cmp r0, #0
	beq _08043E64
	movs r1, #4
	negs r1, r1
	bl sub_804303C
_08043E64:
	movs r0, #4
	negs r0, r0
	bl sub_804CC5C
	mov r1, sl
	ldrb r0, [r1]
_08043E70:
	ldr r1, [r7, #0x40]
	subs r1, r1, r0
	lsls r1, r1, #4
	adds r1, #0x28
	movs r0, #0x50
	bl DisplayUiHand
	ldr r0, [r7, #0x38]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrh r1, [r4]
	adds r1, #0x28
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl sub_804D24C
	b _08044270
_08043E92:
	mov r2, sl
	ldrb r0, [r2]
	ldr r1, [r7, #0x40]
	subs r1, r1, r0
	lsls r1, r1, #4
	adds r1, #0x28
	movs r0, #0x50
	bl DisplayUiHand
	ldr r0, _08043ED0  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _08043EB4
	b _080440C6
_08043EB4:
	adds r1, r7, #0
	adds r1, #0x52
	ldrb r0, [r1]
	subs r0, #1
	adds r4, r1, #0
	cmp r0, #7
	bls _08043EC4
	b _080440C6
_08043EC4:
	lsls r0, r0, #2
	ldr r1, _08043ED4  @ _08043ED8
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08043ED0: .4byte gKeyStatusPtr
_08043ED4: .4byte _08043ED8
_08043ED8: @ jump table
	.4byte _08043EF8 @ case 0
	.4byte _08043F28 @ case 1
	.4byte _08043F50 @ case 2
	.4byte _08043F7C @ case 3
	.4byte _08043FE0 @ case 4
	.4byte _08043FEE @ case 5
	.4byte _080440C6 @ case 6
	.4byte _0804403C @ case 7
_08043EF8:
	ldr r1, _08043F20  @ gUnk_Sio_0203DB7C
	mov r3, r9
	lsls r0, r3, #2
	add r0, r9
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r1, [r0, #0xf]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _08043F10
	b _08044034
_08043F10:
	movs r0, #2
	bl SioPlaySoundEffect
	ldr r1, _08043F24  @ gLinkArenaSt
	ldr r0, [r7, #0x40]
	strb r0, [r1, #3]
	b _08043F40
	.align 2, 0
_08043F20: .4byte gUnk_Sio_0203DB7C
_08043F24: .4byte gLinkArenaSt
_08043F28:
	movs r0, #2
	bl SioPlaySoundEffect
	ldr r2, _08043F48  @ gLinkArenaSt
	ldr r1, _08043F4C  @ gUnk_Sio_0203DB7C
	mov r3, r9
	lsls r0, r3, #2
	add r0, r9
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r0, [r0, #0xf]
	strb r0, [r2, #3]
_08043F40:
	adds r0, r7, #0
	bl Proc_Break
	b _08044270
	.align 2, 0
_08043F48: .4byte gLinkArenaSt
_08043F4C: .4byte gUnk_Sio_0203DB7C
_08043F50:
	ldr r1, _08043F78  @ gUnk_Sio_0203DB7C
	mov r2, r9
	lsls r0, r2, #2
	add r0, r9
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r1, [r0, #0xf]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _08044034
	movs r0, #2
	bl SioPlaySoundEffect
	adds r0, r7, #0
	movs r1, #4
	bl Proc_Goto
	b _08044270
	.align 2, 0
_08043F78: .4byte gUnk_Sio_0203DB7C
_08043F7C:
	ldr r0, [r7, #0x38]
	cmp r0, #1
	bgt _08043F84
	b _080440C6
_08043F84:
	movs r0, #2
	bl SioPlaySoundEffect
	adds r0, r7, #0
	adds r0, #0x53
	mov r3, r9
	strb r3, [r0]
	ldrb r2, [r0]
	mov r1, sl
	ldrb r0, [r1]
	subs r2, r2, r0
	lsls r2, r2, #4
	adds r2, #0x28
	movs r0, #0x27
	str r0, [sp]
	adds r0, r7, #0
	movs r1, #0x50
	movs r3, #0x88
	bl StartSioHold
	str r0, [r7, #0x30]
	mov r1, r9
	adds r1, #1
	ldr r0, [r7, #0x38]
	cmp r1, r0
	bge _08043FC8
	ldr r0, _08043FC4  @ gKeyStatusPtr
	ldr r2, [r0]
	ldrh r1, [r2, #6]
	movs r0, #0x80
	b _08043FD0
	.align 2, 0
_08043FC4: .4byte gKeyStatusPtr
_08043FC8:
	ldr r0, _08043FDC  @ gKeyStatusPtr
	ldr r2, [r0]
	ldrh r1, [r2, #6]
	movs r0, #0x40
_08043FD0:
	orrs r0, r1
	strh r0, [r2, #6]
	movs r0, #5
	strb r0, [r4]
	b _080440C6
	.align 2, 0
_08043FDC: .4byte gKeyStatusPtr
_08043FE0:
	movs r0, #2
	bl SioPlaySoundEffect
	adds r0, r7, #0
	bl sub_80436C0
	b _080440C6
_08043FEE:
	ldr r1, _08044030  @ gUnk_Sio_0203DB7C
	mov r2, r9
	lsls r0, r2, #2
	add r0, r9
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r1, [r0, #0xf]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _08044034
	movs r0, #2
	bl SioPlaySoundEffect
	mov r3, sl
	ldrb r2, [r3]
	mov r0, r9
	subs r2, r0, r2
	lsls r2, r2, #4
	adds r2, #0x28
	movs r0, #0x27
	str r0, [sp]
	adds r0, r7, #0
	movs r1, #0x50
	movs r3, #0x88
	bl StartSioHold
	str r0, [r7, #0x30]
	adds r0, r7, #0
	movs r1, #7
	bl Proc_Goto
	b _080440C6
	.align 2, 0
_08044030: .4byte gUnk_Sio_0203DB7C
_08044034:
	movs r0, #0
	bl SioPlaySoundEffect
	b _080440C6
_0804403C:
	movs r0, #2
	bl SioPlaySoundEffect
	mov r1, r9
	lsls r4, r1, #2
	add r4, r9
	lsls r4, r4, #2
	ldr r0, _080440F0  @ gUnk_Sio_0203DB7C
	adds r4, r4, r0
	movs r2, #0x53
	adds r2, r2, r7
	mov r8, r2
	ldrb r0, [r2]
	lsls r1, r0, #4
	subs r1, r1, r0
	ldr r6, _080440F4  @ gUnk_Sio_0203DD50
	adds r1, r1, r6
	adds r0, r4, #0
	bl SioStrCpy
	ldr r5, _080440F8  @ gLinkArenaSt
	adds r0, r5, #6
	mov r3, r8
	ldrb r3, [r3]
	adds r0, r0, r3
	ldrb r1, [r4, #0xf]
	strb r1, [r0]
	mov r1, r8
	ldrb r0, [r1]
	lsls r0, r0, #3
	adds r5, #0x64
	adds r0, r0, r5
	bl ClearText
	mov r2, r8
	ldrb r1, [r2]
	lsls r0, r1, #3
	adds r0, r0, r5
	lsls r2, r1, #1
	adds r2, r2, r1
	adds r2, #5
	lsls r3, r1, #4
	subs r3, r3, r1
	adds r3, r3, r6
	movs r1, #0xa
	str r1, [sp]
	movs r1, #1
	bl PutDrawTextCentered
	bl sub_8043D5C
	adds r1, r7, #0
	adds r1, #0x5c
	strb r0, [r1]
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080440BA
	ldr r3, [sp, #4]
	ldr r0, [r3, #0x40]
	cmp r0, #0
	bne _080440BA
	movs r0, #8
	str r0, [r3, #0x40]
_080440BA:
	movs r0, #0
	str r0, [r7, #0x44]
	adds r0, r7, #0
	movs r1, #6
	bl Proc_Goto
_080440C6:
	ldr r0, _080440FC  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0804411A
	movs r0, #1
	bl SioPlaySoundEffect
	adds r1, r7, #0
	adds r1, #0x52
	ldrb r0, [r1]
	cmp r0, #5
	bne _08044100
	movs r0, #4
	strb r0, [r1]
	ldr r0, [r7, #0x30]
	bl Proc_End
	b _08044270
	.align 2, 0
_080440F0: .4byte gUnk_Sio_0203DB7C
_080440F4: .4byte gUnk_Sio_0203DD50
_080440F8: .4byte gLinkArenaSt
_080440FC: .4byte gKeyStatusPtr
_08044100:
	cmp r0, #8
	beq _0804410E
	adds r0, r7, #0
	movs r1, #2
	bl Proc_Goto
	b _0804411A
_0804410E:
	movs r0, #0
	str r0, [r7, #0x44]
	adds r0, r7, #0
	movs r1, #6
	bl Proc_Goto
_0804411A:
	ldr r0, _080441C4  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _08044156
	adds r0, r7, #0
	adds r0, #0x5c
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _08044156
	ldr r0, _080441C8  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08044148
	movs r0, #0x6a
	bl m4aSongNumStart
_08044148:
	ldr r1, _080441CC  @ gLinkArenaSt
	movs r0, #0
	strb r0, [r1, #3]
	adds r0, r7, #0
	movs r1, #9
	bl Proc_Goto
_08044156:
	ldr r0, _080441C4  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _080441DA
	mov r1, sl
	ldrb r0, [r1]
	cmp r0, #0
	beq _080441D0
	adds r1, r0, #0
	ldr r0, [r7, #0x40]
	subs r0, r0, r1
	cmp r0, #1
	bgt _080441D0
	adds r4, r7, #0
	adds r4, #0x4a
	ldrh r0, [r4]
	subs r0, #4
	strh r0, [r4]
	ldr r0, [r7, #0x30]
	cmp r0, #0
	beq _0804418C
	movs r1, #4
	bl sub_804303C
_0804418C:
	movs r0, #4
	bl sub_804CC5C
	mov r2, sl
	ldrb r0, [r2]
	subs r0, #1
	strb r0, [r2]
	movs r0, #3
	ldr r3, [sp, #8]
	strb r0, [r3]
	ldr r0, [r7, #0x40]
	subs r0, #1
	str r0, [r7, #0x40]
	ldrh r2, [r4]
	movs r0, #1
	movs r1, #0
	bl BG_SetPosition
	ldr r0, [r7, #0x38]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrh r1, [r4]
	adds r1, #0x28
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl sub_804D24C
	b _080441DA
	.align 2, 0
_080441C4: .4byte gKeyStatusPtr
_080441C8: .4byte gPlaySt
_080441CC: .4byte gLinkArenaSt
_080441D0:
	ldr r0, [r7, #0x40]
	cmp r0, #0
	ble _080441DA
	subs r0, #1
	str r0, [r7, #0x40]
_080441DA:
	ldr r0, _08044254  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08044264
	ldr r1, [r7, #0x38]
	cmp r1, #6
	ble _08044258
	mov r0, sl
	ldrb r2, [r0]
	adds r0, r2, #6
	cmp r0, r1
	bge _08044258
	ldr r0, [r7, #0x40]
	subs r0, r0, r2
	cmp r0, #3
	ble _08044258
	adds r4, r7, #0
	adds r4, #0x4a
	ldrh r0, [r4]
	adds r0, #4
	strh r0, [r4]
	ldr r0, [r7, #0x30]
	cmp r0, #0
	beq _08044218
	movs r1, #4
	negs r1, r1
	bl sub_804303C
_08044218:
	movs r0, #4
	negs r0, r0
	bl sub_804CC5C
	mov r1, sl
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	movs r0, #0xfd
	ldr r2, [sp, #8]
	strb r0, [r2]
	ldr r0, [r7, #0x40]
	adds r0, #1
	str r0, [r7, #0x40]
	ldrh r2, [r4]
	movs r0, #1
	movs r1, #0
	bl BG_SetPosition
	ldr r0, [r7, #0x38]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrh r1, [r4]
	adds r1, #0x28
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl sub_804D24C
	b _08044264
	.align 2, 0
_08044254: .4byte gKeyStatusPtr
_08044258:
	subs r0, r1, #1
	ldr r1, [r7, #0x40]
	cmp r1, r0
	bge _08044264
	adds r0, r1, #1
	str r0, [r7, #0x40]
_08044264:
	ldr r0, [r7, #0x40]
	cmp r9, r0
	beq _08044270
	movs r0, #3
	bl SioPlaySoundEffect
_08044270:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8043D8C

	THUMB_FUNC_START sub_8044280
sub_8044280: @ 0x08044280
	push {lr}
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	negs r1, r1
	subs r1, #8
	movs r2, #4
	adds r0, #0x38
_0804428E:
	strh r1, [r0]
	subs r0, #2
	subs r2, #1
	cmp r2, #0
	bge _0804428E
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8044280

	THUMB_FUNC_START sub_804429C
sub_804429C: @ 0x0804429C
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r6, [r4, #0x2c]
	ldr r0, _08044300  @ gUnknown_080D9D61
	ldr r1, [r4, #0x44]
	adds r1, r1, r0
	movs r5, #0
	ldrsb r5, [r1, r5]
	movs r0, #1
	negs r0, r0
	cmp r5, r0
	bne _080442BC
	adds r0, r4, #0
	movs r1, #3
	bl Proc_Goto
_080442BC:
	ldr r0, [r4, #0x44]
	adds r0, #1
	str r0, [r4, #0x44]
	movs r0, #2
	negs r0, r0
	cmp r5, r0
	bne _08044308
	ldr r3, _08044304  @ gLCDControlBuffer
	ldrb r2, [r3, #0x10]
	movs r1, #4
	negs r1, r1
	adds r0, r1, #0
	ands r0, r2
	strb r0, [r3, #0x10]
	ldrb r2, [r3, #0x14]
	adds r0, r1, #0
	ands r0, r2
	movs r2, #1
	orrs r0, r2
	strb r0, [r3, #0x14]
	ldrb r0, [r3, #0xc]
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	strb r1, [r3, #0xc]
	ldrb r0, [r3, #0x18]
	movs r1, #3
	orrs r0, r1
	strb r0, [r3, #0x18]
	adds r1, r6, #0
	adds r1, #0x44
	movs r0, #0
	strb r0, [r1]
	b _0804431C
	.align 2, 0
_08044300: .4byte gUnknown_080D9D61
_08044304: .4byte gLCDControlBuffer
_08044308:
	lsls r1, r5, #0x10
	lsrs r1, r1, #0x10
	movs r0, #0
	movs r2, #0
	bl BG_SetPosition
	adds r0, r6, #0
	adds r1, r5, #0
	bl sub_8044280
_0804431C:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_804429C

	THUMB_FUNC_START sub_8044324
sub_8044324: @ 0x08044324
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	ldr r6, [r4, #0x2c]
	ldr r1, _0804438C  @ gUnknown_080D9D61
	ldr r0, [r4, #0x44]
	adds r0, r0, r1
	movs r5, #0
	ldrsb r5, [r0, r5]
	movs r7, #1
	negs r7, r7
	cmp r5, r7
	bne _08044344
	adds r0, r4, #0
	movs r1, #2
	bl Proc_Goto
_08044344:
	ldr r0, [r4, #0x44]
	adds r0, #1
	str r0, [r4, #0x44]
	movs r0, #2
	negs r0, r0
	cmp r5, r0
	bne _08044394
	ldr r3, _08044390  @ gLCDControlBuffer
	ldrb r2, [r3, #0xc]
	movs r1, #4
	negs r1, r1
	adds r0, r1, #0
	ands r0, r2
	strb r0, [r3, #0xc]
	ldrb r2, [r3, #0x10]
	adds r0, r1, #0
	ands r0, r2
	movs r2, #1
	orrs r0, r2
	strb r0, [r3, #0x10]
	ldrb r0, [r3, #0x14]
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	strb r1, [r3, #0x14]
	ldrb r0, [r3, #0x18]
	movs r1, #3
	orrs r0, r1
	strb r0, [r3, #0x18]
	adds r1, r6, #0
	adds r1, #0x44
	movs r0, #1
	strb r0, [r1]
	str r7, [r6, #0x48]
	b _080443A8
	.align 2, 0
_0804438C: .4byte gUnknown_080D9D61
_08044390: .4byte gLCDControlBuffer
_08044394:
	lsls r1, r5, #0x10
	lsrs r1, r1, #0x10
	movs r0, #0
	movs r2, #0
	bl BG_SetPosition
	adds r0, r6, #0
	adds r1, r5, #0
	bl sub_8044280
_080443A8:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8044324

	THUMB_FUNC_START sub_80443B0
sub_80443B0: @ 0x080443B0
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r1, r5, #0
	adds r1, #0x55
	movs r0, #1
	strb r0, [r1]
	bl sub_804D80C
	adds r0, r5, #0
	adds r0, #0x48
	ldrb r1, [r0]
	ldr r0, [r5, #0x40]
	subs r0, r0, r1
	cmp r0, #2
	ble _080443D4
	lsls r0, r0, #1
	subs r0, #2
	b _080443D8
_080443D4:
	lsls r0, r0, #1
	adds r0, #5
_080443D8:
	str r0, [r5, #0x58]
	ldr r4, _08044424  @ Texts_0203DAB0
	adds r0, r4, #0
	bl ClearText
	movs r0, #0xa0
	lsls r0, r0, #1
	bl GetStringFromIndex
	adds r1, r0, #0
	adds r0, r4, #0
	bl Text_DrawString
	adds r0, r4, #0
	movs r1, #0x26
	bl Text_SetCursor
	ldr r0, _08044428  @ 0x00000141
	bl GetStringFromIndex
	adds r1, r0, #0
	adds r0, r4, #0
	bl Text_DrawString
	ldr r1, [r5, #0x58]
	adds r1, #4
	lsls r1, r1, #6
	ldr r0, _0804442C  @ gBG0TilemapBuffer+0x01E
	adds r1, r1, r0
	adds r0, r4, #0
	bl PutText
	movs r0, #1
	bl BG_EnableSyncByMask
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08044424: .4byte Texts_0203DAB0
_08044428: .4byte 0x00000141
_0804442C: .4byte gBG0TilemapBuffer+0x01E

	THUMB_FUNC_END sub_80443B0

	THUMB_FUNC_START sub_8044430
sub_8044430: @ 0x08044430
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x58]
	lsls r1, r1, #3
	adds r1, #0x18
	movs r0, #0x60
	bl sub_804D834
	ldr r0, _080444D4  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _08044462
	adds r1, r4, #0
	adds r1, #0x55
	ldrb r0, [r1]
	cmp r0, #1
	bne _08044462
	movs r0, #0
	strb r0, [r1]
	movs r0, #3
	bl SioPlaySoundEffect
_08044462:
	ldr r0, _080444D4  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0x10
	ands r0, r1
	adds r5, r4, #0
	adds r5, #0x55
	cmp r0, #0
	beq _08044484
	ldrb r0, [r5]
	cmp r0, #0
	bne _08044484
	movs r0, #1
	strb r0, [r5]
	movs r0, #3
	bl SioPlaySoundEffect
_08044484:
	ldrb r1, [r5]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, #0x70
	ldr r1, [r4, #0x58]
	lsls r1, r1, #3
	adds r1, #0x20
	bl DisplayUiHand
	ldr r0, _080444D4  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080444DC
	movs r0, #1
	bl SioPlaySoundEffect
	ldr r0, [r4, #0x30]
	bl Proc_End
	ldr r0, [r4, #0x58]
	adds r0, #4
	lsls r0, r0, #6
	ldr r1, _080444D8  @ gBG0TilemapBuffer+0x01E
	adds r0, r0, r1
	movs r1, #0xc
	movs r2, #2
	movs r3, #0
	bl TileMap_FillRect
	movs r0, #1
	bl BG_EnableSyncByMask
	adds r0, r4, #0
	bl Proc_Break
	b _08044524
	.align 2, 0
_080444D4: .4byte gKeyStatusPtr
_080444D8: .4byte gBG0TilemapBuffer+0x01E
_080444DC:
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08044524
	ldr r0, [r4, #0x30]
	bl Proc_End
	ldrb r0, [r5]
	cmp r0, #0
	bne _080444FE
	adds r0, r4, #0
	bl sub_80435F0
	movs r0, #2
	bl SioPlaySoundEffect
	b _08044504
_080444FE:
	movs r0, #1
	bl SioPlaySoundEffect
_08044504:
	ldr r0, [r4, #0x58]
	adds r0, #4
	lsls r0, r0, #6
	ldr r1, _0804452C  @ gBG0TilemapBuffer+0x01E
	adds r0, r0, r1
	movs r1, #0xc
	movs r2, #2
	movs r3, #0
	bl TileMap_FillRect
	movs r0, #1
	bl BG_EnableSyncByMask
	adds r0, r4, #0
	bl Proc_Break
_08044524:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0804452C: .4byte gBG0TilemapBuffer+0x01E

	THUMB_FUNC_END sub_8044430

	THUMB_FUNC_START sub_8044530
sub_8044530: @ 0x08044530
	push {r4, lr}
	sub sp, #0x10
	ldr r4, [r0, #0x40]
	movs r0, #1
	bl GetUnit
	adds r1, r0, #0
	adds r0, r4, #0
	mov r2, sp
	bl ReadMultiArenaSaveTeam
	add sp, #0x10
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8044530

	THUMB_FUNC_START GetTacticianTextConf
GetTacticianTextConf: @ 0x08044550
	lsls r0, r0, #0x10
	asrs r0, r0, #0xa
	ldr r1, _0804455C  @ gTacticianTextConf
	adds r0, r0, r1
	bx lr
	.align 2, 0
_0804455C: .4byte gTacticianTextConf

	THUMB_FUNC_END GetTacticianTextConf

	THUMB_FUNC_START sub_8044560
sub_8044560: @ 0x08044560
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	mov sl, r0
	mov r9, r1
	movs r0, #0
	str r0, [sp]
	ldrb r0, [r1]
	cmp r0, #0
	beq _08044602
_0804457A:
	movs r1, #0
	mov r8, r1
	mov r3, r9
	adds r3, #2
	str r3, [sp, #8]
_08044584:
	mov r5, r8
	lsls r0, r5, #0x10
	asrs r0, r0, #0x10
	bl GetTacticianTextConf
	str r0, [sp, #4]
	movs r7, #0
	mov r6, r8
	ldr r0, _080445D8  @ 0x00003FFF
	ands r6, r0
	movs r1, #0
	mov ip, r1
_0804459C:
	movs r4, #0
	mov r3, r9
	ldrh r3, [r3]
	str r3, [sp, #0xc]
	ldr r2, [sp, #4]
	add r2, ip
	adds r0, r7, #0
	movs r5, #3
	ands r0, r5
	lsls r1, r0, #0xe
	orrs r1, r6
	ldr r3, [sp]
	lsls r0, r3, #1
	adds r0, #0x4c
	mov r5, sl
	adds r3, r0, r5
_080445BC:
	ldr r0, [r2]
	ldrh r0, [r0]
	ldr r5, [sp, #0xc]
	cmp r0, r5
	bne _080445DC
	strh r1, [r3]
	mov r0, sl
	adds r0, #0x39
	strb r4, [r0]
	ldr r0, [sp]
	adds r0, #1
	str r0, [sp]
	b _080445F8
	.align 2, 0
_080445D8: .4byte 0x00003FFF
_080445DC:
	adds r2, #4
	adds r4, #1
	cmp r4, #2
	ble _080445BC
	movs r1, #0xc
	add ip, r1
	adds r7, #1
	cmp r7, #2
	ble _0804459C
	movs r3, #1
	add r8, r3
	mov r5, r8
	cmp r5, #0x50
	ble _08044584
_080445F8:
	ldr r0, [sp, #8]
	mov r9, r0
	ldrb r0, [r0]
	cmp r0, #0
	bne _0804457A
_08044602:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8044560

.align 2, 0
