	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	/* Seems something also related to ekrdragon */

	THUMB_FUNC_START sub_805A07C
sub_805A07C: @ 0x0805A07C
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r6, r1, #0
	bl sub_805A154
	cmp r0, #0
	bne _0805A09C
	ldr r0, _0805A098  @ gUnknown_080DAEF0
	lsls r1, r6, #2
	adds r2, r1, r0
	ldrb r5, [r2]
	adds r1, #1
	adds r1, r1, r0
	b _0805A0AA
	.align 2, 0
_0805A098: .4byte gUnknown_080DAEF0
_0805A09C:
	ldr r2, _0805A0C8  @ gUnknown_080DAEF0
	lsls r1, r6, #2
	adds r0, r1, #2
	adds r0, r0, r2
	ldrb r5, [r0]
	adds r1, #3
	adds r1, r1, r2
_0805A0AA:
	ldrb r7, [r1]
	cmp r5, #0xff
	beq _0805A0F0
	adds r0, r4, #0
	bl GetAISSubjectId
	cmp r0, #0
	bne _0805A0D4
	ldr r0, _0805A0CC  @ gUnknown_0200005C
	ldr r1, [r0]
	lsls r0, r5, #2
	adds r0, r0, r1
	ldr r1, [r0]
	ldr r0, _0805A0D0  @ gUnknown_0200F1C8
	b _0805A0E0
	.align 2, 0
_0805A0C8: .4byte gUnknown_080DAEF0
_0805A0CC: .4byte gUnknown_0200005C
_0805A0D0: .4byte gUnknown_0200F1C8
_0805A0D4:
	ldr r0, _0805A0E8  @ gUnknown_02000060
	ldr r1, [r0]
	lsls r0, r5, #2
	adds r0, r0, r1
	ldr r1, [r0]
	ldr r0, _0805A0EC  @ gUnknown_02011BC8
_0805A0E0:
	adds r1, r1, r0
	str r1, [r4, #0x24]
	str r1, [r4, #0x20]
	b _0805A0FA
	.align 2, 0
_0805A0E8: .4byte gUnknown_02000060
_0805A0EC: .4byte gUnknown_02011BC8
_0805A0F0:
	ldr r0, _0805A148  @ gUnknown_085B9D5C
	str r0, [r4, #0x24]
	str r0, [r4, #0x20]
	movs r0, #0
	strh r0, [r4, #0x10]
_0805A0FA:
	movs r3, #0
	movs r2, #0
	strh r7, [r4, #0xa]
	ldrh r1, [r4, #8]
	ldr r0, _0805A14C  @ 0x0000F3FF
	ands r0, r1
	movs r5, #0x80
	lsls r5, r5, #4
	adds r1, r5, #0
	orrs r0, r1
	strh r0, [r4, #8]
	strh r2, [r4, #6]
	ldrh r1, [r4, #0xc]
	movs r0, #0xe0
	lsls r0, r0, #3
	ands r0, r1
	strh r0, [r4, #0xc]
	strb r6, [r4, #0x12]
	strb r3, [r4, #0x14]
	adds r0, r4, #0
	bl GetAISSubjectId
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	subs r1, r1, r0
	lsls r1, r1, #0xb
	ldr r0, _0805A150  @ gUnknown_020041C8
	adds r1, r1, r0
	str r1, [r4, #0x30]
	bl AnimSort
	adds r0, r4, #0
	bl EkrDragonBodyAnimeSet54
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805A148: .4byte gUnknown_085B9D5C
_0805A14C: .4byte 0x0000F3FF
_0805A150: .4byte gUnknown_020041C8

	THUMB_FUNC_END sub_805A07C

	THUMB_FUNC_START sub_805A154
sub_805A154: @ 0x0805A154
	push {lr}
	ldrh r1, [r0, #0xc]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0805A166
	movs r0, #1
	b _0805A168
_0805A166:
	movs r0, #0
_0805A168:
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_805A154

	THUMB_FUNC_START GetAISSubjectId
GetAISSubjectId: @ 0x0805A16C
	push {lr}
	ldrh r1, [r0, #0xc]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0805A17E
	movs r0, #1
	b _0805A180
_0805A17E:
	movs r0, #0
_0805A180:
	pop {r1}
	bx r1

	THUMB_FUNC_END GetAISSubjectId

	THUMB_FUNC_START GetSomeBoolean
GetSomeBoolean: @ 0x0805A184
	push {lr}
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #9
	bhi _0805A1C8
	lsls r0, r0, #2
	ldr r1, _0805A198  @ _0805A19C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0805A198: .4byte _0805A19C
_0805A19C: @ jump table
	.4byte _0805A1C8 @ case 0
	.4byte _0805A1C8 @ case 1
	.4byte _0805A1C8 @ case 2
	.4byte _0805A1C8 @ case 3
	.4byte _0805A1C4 @ case 4
	.4byte _0805A1C4 @ case 5
	.4byte _0805A1C8 @ case 6
	.4byte _0805A1C8 @ case 7
	.4byte _0805A1C8 @ case 8
	.4byte _0805A1C8 @ case 9
_0805A1C4:
	movs r0, #1
	b _0805A1CA
_0805A1C8:
	movs r0, #0
_0805A1CA:
	pop {r1}
	bx r1

	THUMB_FUNC_END GetSomeBoolean

	THUMB_FUNC_START sub_805A1D0
sub_805A1D0: @ 0x0805A1D0
	push {lr}
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #9
	bhi _0805A214
	lsls r0, r0, #2
	ldr r1, _0805A1E4  @ _0805A1E8
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0805A1E4: .4byte _0805A1E8
_0805A1E8: @ jump table
	.4byte _0805A214 @ case 0
	.4byte _0805A214 @ case 1
	.4byte _0805A214 @ case 2
	.4byte _0805A214 @ case 3
	.4byte _0805A214 @ case 4
	.4byte _0805A214 @ case 5
	.4byte _0805A210 @ case 6
	.4byte _0805A210 @ case 7
	.4byte _0805A210 @ case 8
	.4byte _0805A214 @ case 9
_0805A210:
	movs r0, #1
	b _0805A216
_0805A214:
	movs r0, #0
_0805A216:
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_805A1D0

	THUMB_FUNC_START sub_805A21C
sub_805A21C: @ 0x0805A21C
	push {lr}
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #9
	bhi _0805A260
	lsls r0, r0, #2
	ldr r1, _0805A230  @ _0805A234
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0805A230: .4byte _0805A234
_0805A234: @ jump table
	.4byte _0805A25C @ case 0
	.4byte _0805A25C @ case 1
	.4byte _0805A25C @ case 2
	.4byte _0805A25C @ case 3
	.4byte _0805A260 @ case 4
	.4byte _0805A260 @ case 5
	.4byte _0805A260 @ case 6
	.4byte _0805A260 @ case 7
	.4byte _0805A260 @ case 8
	.4byte _0805A25C @ case 9
_0805A25C:
	movs r0, #1
	b _0805A262
_0805A260:
	movs r0, #0
_0805A262:
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_805A21C

	THUMB_FUNC_START sub_805A268
sub_805A268: @ 0x0805A268
	push {lr}
	ldrb r0, [r0, #0x12]
	cmp r0, #9
	bhi _0805A2AC
	lsls r0, r0, #2
	ldr r1, _0805A27C  @ _0805A280
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0805A27C: .4byte _0805A280
_0805A280: @ jump table
	.4byte _0805A2AC @ case 0
	.4byte _0805A2A8 @ case 1
	.4byte _0805A2AC @ case 2
	.4byte _0805A2A8 @ case 3
	.4byte _0805A2AC @ case 4
	.4byte _0805A2AC @ case 5
	.4byte _0805A2AC @ case 6
	.4byte _0805A2AC @ case 7
	.4byte _0805A2AC @ case 8
	.4byte _0805A2AC @ case 9
_0805A2A8:
	movs r0, #1
	b _0805A2AE
_0805A2AC:
	movs r0, #0
_0805A2AE:
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_805A268

	THUMB_FUNC_START GetCoreAIStruct
GetCoreAIStruct: @ 0x0805A2B4
	push {r4, lr}
	ldr r4, _0805A2CC  @ gAnims
	bl GetAISSubjectId
	movs r1, #1
	eors r1, r0
	lsls r1, r1, #3
	adds r1, r1, r4
	ldr r0, [r1]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0805A2CC: .4byte gAnims

	THUMB_FUNC_END GetCoreAIStruct

	THUMB_FUNC_START sub_805A2D0
sub_805A2D0: @ 0x0805A2D0
	push {r4, lr}
	adds r4, r0, #0
	bl GetAISSubjectId
	adds r1, r0, #0
	ldrh r0, [r4, #0xe]
	subs r0, #1
	lsls r0, r0, #1
	adds r0, r0, r1
	bl GetSomeAISRelatedIndexMaybeByID
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_805A2D0

	THUMB_FUNC_START sub_805A2F0
sub_805A2F0: @ 0x0805A2F0
	push {r4, lr}
	adds r4, r0, #0
	bl GetAISSubjectId
	adds r1, r0, #0
	ldrh r0, [r4, #0xe]
	lsls r0, r0, #1
	adds r0, r0, r1
	bl GetSomeAISRelatedIndexMaybeByID
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_805A2F0

	THUMB_FUNC_START GetSomeAISRelatedIndexMaybe
GetSomeAISRelatedIndexMaybe: @ 0x0805A310
	push {r4, lr}
	adds r4, r0, #0
	bl GetAISSubjectId
	adds r2, r0, #0
	ldrh r0, [r4, #0xe]
	subs r0, #1
	lsls r0, r0, #1
	movs r1, #1
	eors r1, r2
	adds r0, r0, r1
	bl GetSomeAISRelatedIndexMaybeByID
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END GetSomeAISRelatedIndexMaybe

	THUMB_FUNC_START sub_805A334
sub_805A334: @ 0x0805A334
	push {r4, lr}
	adds r4, r0, #0
	bl GetAISSubjectId
	adds r2, r0, #0
	ldrh r0, [r4, #0xe]
	lsls r0, r0, #1
	movs r1, #1
	eors r1, r2
	adds r0, r0, r1
	bl GetSomeAISRelatedIndexMaybeByID
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_805A334

	THUMB_FUNC_START SetAnimStateHidden
SetAnimStateHidden: @ 0x0805A358
	push {lr}
	cmp r0, #0
	bne _0805A374
	ldr r2, _0805A370  @ gAnims
	ldr r3, [r2]
	ldrh r0, [r3]
	movs r1, #2
	orrs r0, r1
	strh r0, [r3]
	ldr r3, [r2, #4]
	b _0805A386
	.align 2, 0
_0805A370: .4byte gAnims
_0805A374:
	cmp r0, #1
	bne _0805A38C
	ldr r2, _0805A390  @ gAnims
	ldr r3, [r2, #8]
	ldrh r0, [r3]
	movs r1, #2
	orrs r0, r1
	strh r0, [r3]
	ldr r3, [r2, #0xc]
_0805A386:
	ldrh r0, [r3]
	orrs r1, r0
	strh r1, [r3]
_0805A38C:
	pop {r0}
	bx r0
	.align 2, 0
_0805A390: .4byte gAnims

	THUMB_FUNC_END SetAnimStateHidden

	THUMB_FUNC_START SetAnimStateUnHidden
SetAnimStateUnHidden: @ 0x0805A394
	push {r4, lr}
	cmp r0, #0
	bne _0805A3B4
	ldr r3, _0805A3AC  @ gAnims
	ldr r4, [r3]
	ldrh r2, [r4]
	ldr r1, _0805A3B0  @ 0x0000FFFD
	adds r0, r1, #0
	ands r0, r2
	strh r0, [r4]
	ldr r4, [r3, #4]
	b _0805A3C8
	.align 2, 0
_0805A3AC: .4byte gAnims
_0805A3B0: .4byte 0x0000FFFD
_0805A3B4:
	cmp r0, #1
	bne _0805A3CE
	ldr r3, _0805A3D4  @ gAnims
	ldr r4, [r3, #8]
	ldrh r2, [r4]
	ldr r1, _0805A3D8  @ 0x0000FFFD
	adds r0, r1, #0
	ands r0, r2
	strh r0, [r4]
	ldr r4, [r3, #0xc]
_0805A3C8:
	ldrh r0, [r4]
	ands r1, r0
	strh r1, [r4]
_0805A3CE:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805A3D4: .4byte gAnims
_0805A3D8: .4byte 0x0000FFFD

	THUMB_FUNC_END SetAnimStateUnHidden

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
	bl sub_805A154
	cmp r0, #0
	bne _0805A508
	adds r0, r4, #0
	bl sub_806EB54
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
	bl sub_806EB54
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
	bl sub_805A154
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
	bl sub_805A154
	cmp r0, #0
	bne _0805A5FA
	ldr r0, _0805A604  @ gUnknown_080DAEF0
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
_0805A604: .4byte gUnknown_080DAEF0
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
	ldr r2, _0805A698  @ gUnknown_080DAEF0
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
	ldr r7, _0805A69C  @ gUnknown_085B9D5C
	cmp r5, #0xff
	beq _0805A66A
	lsls r0, r5, #2
	adds r0, r0, r2
	ldr r0, [r0]
	adds r7, r3, r0
_0805A66A:
	ldr r0, _0805A69C  @ gUnknown_085B9D5C
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
_0805A698: .4byte gUnknown_080DAEF0
_0805A69C: .4byte gUnknown_085B9D5C
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
	ldr r2, _0805A7B0  @ pPalette10Buffer
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
_0805A7B0: .4byte pPalette10Buffer

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
	ldr r2, _0805A830  @ gUnknown_080DAEF0
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
	ldr r0, _0805A834  @ gUnknown_085B9D5C
	mov r8, r0
	cmp r4, #0xff
	beq _0805A804
	lsls r0, r4, #2
	adds r0, r0, r2
	ldr r0, [r0]
	adds r0, r0, r3
	mov r8, r0
_0805A804:
	ldr r0, _0805A834  @ gUnknown_085B9D5C
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
_0805A830: .4byte gUnknown_080DAEF0
_0805A834: .4byte gUnknown_085B9D5C
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
	ldr r2, _0805A92C  @ pPalette10Buffer
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
_0805A92C: .4byte pPalette10Buffer

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

.align 2, 0
