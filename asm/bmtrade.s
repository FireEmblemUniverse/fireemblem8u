	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	@ Map Trade Menu Proc & Friends

	THUMB_FUNC_START sub_802DCD8
sub_802DCD8: @ 0x0802DCD8
	push {r4, r5, r6, lr}
	ldr r4, [r0, #0x14]
	adds r5, r4, #0
	adds r5, #0x45
	movs r0, #0
	ldrsb r0, [r5, r0]
	cmp r0, #0
	beq _0802DD06
	adds r2, r4, #0
	adds r2, #0x47
	adds r0, r4, #0
	adds r0, #0x46
	ldrb r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	ldrb r2, [r2]
	adds r0, r0, r2
	adds r1, r4, #0
	adds r1, #0x34
	adds r1, r1, r0
	movs r0, #1
	strb r0, [r1]
_0802DD06:
	bl sub_8089018
	ldr r6, _0802DD68  @ gUnknown_0859BADC
	adds r2, r4, #0
	adds r2, #0x42
	adds r0, r4, #0
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r1, r0, #2
	adds r1, r1, r0
	ldrb r2, [r2]
	adds r1, r1, r2
	lsls r1, r1, #2
	adds r1, r1, r6
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #3
	movs r2, #2
	ldrsh r1, [r1, r2]
	lsls r1, r1, #3
	bl sub_804E79C
	movs r0, #0
	ldrsb r0, [r5, r0]
	cmp r0, #0
	beq _0802DD60
	adds r2, r4, #0
	adds r2, #0x44
	adds r0, r4, #0
	adds r0, #0x43
	ldrb r0, [r0]
	lsls r1, r0, #2
	adds r1, r1, r0
	ldrb r2, [r2]
	adds r1, r1, r2
	lsls r1, r1, #2
	adds r1, r1, r6
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #3
	movs r2, #2
	ldrsh r1, [r1, r2]
	lsls r1, r1, #3
	bl sub_804E848
_0802DD60:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802DD68: .4byte gUnknown_0859BADC

	THUMB_FUNC_START sub_802DD6C
sub_802DD6C: @ 0x0802DD6C
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r4, r1, #0
	ldr r0, _0802DDC8  @ gUnknown_0859BB1C
	movs r1, #3
	bl Proc_Create
	adds r2, r0, #0
	str r6, [r2, #0x2c]
	str r4, [r2, #0x30]
	adds r1, r2, #0
	adds r1, #0x40
	movs r0, #0
	strb r0, [r1]
	adds r5, r2, #0
	adds r5, #0x41
	strb r0, [r5]
	adds r1, #2
	strb r0, [r1]
	adds r4, r2, #0
	adds r4, #0x48
	strb r0, [r4]
	ldr r0, _0802DDCC  @ gUnknown_0203A610
	str r2, [r0]
	bl sub_80837F8
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0802DDB0
	movs r0, #0xc9
	bl SetKeyStatus_IgnoreMask
	movs r0, #1
	strb r0, [r4]
_0802DDB0:
	adds r0, r6, #0
	bl GetUnitItemCount
	adds r1, r0, #0
	cmp r1, #0
	bne _0802DDC0
	movs r1, #1
	strb r1, [r5]
_0802DDC0:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0802DDC8: .4byte gUnknown_0859BB1C
_0802DDCC: .4byte gUnknown_0203A610

	THUMB_FUNC_START sub_802DDD0
sub_802DDD0: @ 0x0802DDD0
	push {lr}
	ldr r0, _0802DE00  @ gUnknown_0203A610
	ldr r0, [r0]
	ldr r2, _0802DE04  @ gUnknown_0859BADC
	adds r3, r0, #0
	adds r3, #0x42
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r1, r0, #2
	adds r1, r1, r0
	ldrb r3, [r3]
	adds r1, r1, r3
	lsls r1, r1, #2
	adds r1, r1, r2
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #3
	movs r2, #2
	ldrsh r1, [r1, r2]
	lsls r1, r1, #3
	bl sub_804E848
	pop {r0}
	bx r0
	.align 2, 0
_0802DE00: .4byte gUnknown_0203A610
_0802DE04: .4byte gUnknown_0859BADC

	THUMB_FUNC_START sub_802DE08
sub_802DE08: @ 0x0802DE08
	push {r4, r5, lr}
	ldr r0, _0802DE64  @ gUnknown_0203A610
	ldr r5, [r0]
	ldr r4, _0802DE68  @ gUnknown_0859BADC
	adds r2, r5, #0
	adds r2, #0x42
	adds r0, r5, #0
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r1, r0, #2
	adds r1, r1, r0
	ldrb r2, [r2]
	adds r1, r1, r2
	lsls r1, r1, #2
	adds r1, r1, r4
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #3
	movs r2, #2
	ldrsh r1, [r1, r2]
	lsls r1, r1, #3
	bl sub_804E848
	adds r2, r5, #0
	adds r2, #0x44
	adds r0, r5, #0
	adds r0, #0x43
	ldrb r0, [r0]
	lsls r1, r0, #2
	adds r1, r1, r0
	ldrb r2, [r2]
	adds r1, r1, r2
	lsls r1, r1, #2
	adds r1, r1, r4
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #3
	movs r2, #2
	ldrsh r1, [r1, r2]
	lsls r1, r1, #3
	bl sub_804E848
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802DE64: .4byte gUnknown_0203A610
_0802DE68: .4byte gUnknown_0859BADC

	THUMB_FUNC_START sub_802DE6C
sub_802DE6C: @ 0x0802DE6C
	push {lr}
	ldr r0, _0802DE7C  @ gUnknown_0859BBF4
	movs r1, #3
	bl Proc_Create
	pop {r0}
	bx r0
	.align 2, 0
_0802DE7C: .4byte gUnknown_0859BBF4

	THUMB_FUNC_START sub_802DE80
sub_802DE80: @ 0x0802DE80
	push {lr}
	ldr r0, _0802DE90  @ gUnknown_0859BC0C
	movs r1, #3
	bl Proc_Create
	pop {r0}
	bx r0
	.align 2, 0
_0802DE90: .4byte gUnknown_0859BC0C

	THUMB_FUNC_START sub_802DE94
sub_802DE94: @ 0x0802DE94
	push {lr}
	ldr r0, _0802DEA0  @ gUnknown_0859BBF4
	bl Proc_DeleteAllWithScript
	pop {r0}
	bx r0
	.align 2, 0
_0802DEA0: .4byte gUnknown_0859BBF4

	THUMB_FUNC_START sub_802DEA4
sub_802DEA4: @ 0x0802DEA4
	push {lr}
	ldr r0, _0802DEB0  @ gUnknown_0859BC0C
	bl Proc_DeleteAllWithScript
	pop {r0}
	bx r0
	.align 2, 0
_0802DEB0: .4byte gUnknown_0859BC0C

	THUMB_FUNC_START sub_802DEB4
sub_802DEB4: @ 0x0802DEB4
	adds r0, #0x4c
	movs r1, #0x14
	strh r1, [r0]
	bx lr

	THUMB_FUNC_START sub_802DEBC
sub_802DEBC: @ 0x0802DEBC
	push {lr}
	adds r2, r0, #0
	adds r1, r2, #0
	adds r1, #0x4c
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _0802DED6
	adds r0, r2, #0
	bl Proc_ClearNativeCallback
_0802DED6:
	pop {r0}
	bx r0

	THUMB_FUNC_START sub_802DEDC
sub_802DEDC: @ 0x0802DEDC
	push {lr}
	adds r1, r0, #0
	ldr r0, _0802DF00  @ gUnknown_0203A610
	ldr r0, [r0]
	adds r0, #0x48
	ldrb r0, [r0]
	cmp r0, #3
	beq _0802DEFA
	cmp r0, #5
	beq _0802DEFA
	cmp r0, #8
	beq _0802DEFA
	ldr r0, _0802DF04  @ gUnknown_0859BC24
	bl Proc_CreateBlockingChild
_0802DEFA:
	pop {r0}
	bx r0
	.align 2, 0
_0802DF00: .4byte gUnknown_0203A610
_0802DF04: .4byte gUnknown_0859BC24

	THUMB_FUNC_START sub_802DF08
sub_802DF08: @ 0x0802DF08
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x48
	ldrb r0, [r0]
	cmp r0, #4
	beq _0802DF20
	ldr r0, _0802DF3C  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r0, [r0, #8]
	cmp r0, #0
	bne _0802DF20
	b _0802E098
_0802DF20:
	ldr r0, _0802DF40  @ gUnknown_0203A610
	ldr r0, [r0]
	adds r0, #0x48
	ldrb r0, [r0]
	subs r0, #2
	cmp r0, #6
	bls _0802DF30
	b _0802E098
_0802DF30:
	lsls r0, r0, #2
	ldr r1, _0802DF44  @ _0802DF48
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0802DF3C: .4byte gKeyStatusPtr
_0802DF40: .4byte gUnknown_0203A610
_0802DF44: .4byte _0802DF48
_0802DF48: @ jump table
	.4byte _0802DF64 @ case 0
	.4byte _0802DFA8 @ case 1
	.4byte _0802E04A @ case 2
	.4byte _0802E01C @ case 3
	.4byte _0802E098 @ case 4
	.4byte _0802E098 @ case 5
	.4byte _0802E058 @ case 6
_0802DF64:
	ldr r0, _0802DF80  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _0802DF84
	movs r0, #0xc8
	bl SetKeyStatus_IgnoreMask
	adds r0, r4, #0
	bl sub_802E168
	b _0802E098
	.align 2, 0
_0802DF80: .4byte gKeyStatusPtr
_0802DF84:
	ldr r0, _0802DFA4  @ gUnknown_0202BCF0
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0802DF96
	movs r0, #0x6c
	bl m4aSongNumStart
_0802DF96:
	adds r0, r4, #0
	movs r1, #0x65
	bl Proc_GotoLabel
	movs r0, #1
	b _0802E09A
	.align 2, 0
_0802DFA4: .4byte gUnknown_0202BCF0
_0802DFA8:
	ldr r0, _0802DFF8  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0x91
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	bne _0802DFFC
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0802E098
	movs r0, #0xc0
	ands r0, r1
	cmp r0, #0
	bne _0802DFFC
	adds r0, r4, #0
	adds r0, #0x41
	ldrb r1, [r0]
	lsls r1, r1, #2
	subs r0, #0x15
	adds r0, r0, r1
	ldr r1, [r0]
	adds r0, r4, #0
	adds r0, #0x42
	ldrb r0, [r0]
	lsls r0, r0, #1
	adds r1, #0x1e
	adds r1, r1, r0
	ldrh r0, [r1]
	bl GetItemIndex
	cmp r0, #0x6c
	bne _0802DFFC
	movs r0, #0xc8
	bl SetKeyStatus_IgnoreMask
	bl sub_802E0C0
	b _0802E098
	.align 2, 0
_0802DFF8: .4byte gKeyStatusPtr
_0802DFFC:
	ldr r0, _0802E018  @ gUnknown_0202BCF0
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0802E00E
	movs r0, #0x6c
	bl m4aSongNumStart
_0802E00E:
	adds r0, r4, #0
	bl sub_802E168
	movs r0, #1
	b _0802E09A
	.align 2, 0
_0802E018: .4byte gUnknown_0202BCF0
_0802E01C:
	ldr r0, _0802E034  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0802E038
	adds r0, r4, #0
	bl sub_802E1A8
	b _0802E098
	.align 2, 0
_0802E034: .4byte gKeyStatusPtr
_0802E038:
	ldr r0, _0802E054  @ gUnknown_0202BCF0
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0802E04A
	movs r0, #0x6c
	bl m4aSongNumStart
_0802E04A:
	adds r0, r4, #0
	bl sub_802E188
	movs r0, #1
	b _0802E09A
	.align 2, 0
_0802E054: .4byte gUnknown_0202BCF0
_0802E058:
	ldr r0, _0802E074  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0802E078
	movs r0, #0
	bl SetKeyStatus_IgnoreMask
	movs r0, #0x87
	bl UnsetEventId
	b _0802E098
	.align 2, 0
_0802E074: .4byte gKeyStatusPtr
_0802E078:
	ldr r0, _0802E094  @ gUnknown_0202BCF0
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0802E08A
	movs r0, #0x6c
	bl m4aSongNumStart
_0802E08A:
	adds r0, r4, #0
	bl sub_802E1A8
	movs r0, #1
	b _0802E09A
	.align 2, 0
_0802E094: .4byte gUnknown_0202BCF0
_0802E098:
	movs r0, #0
_0802E09A:
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_START sub_802E0A0
sub_802E0A0: @ 0x0802E0A0
	ldr r0, _0802E0AC  @ gUnknown_0203A610
	ldr r0, [r0]
	adds r0, #0x48
	movs r1, #2
	strb r1, [r0]
	bx lr
	.align 2, 0
_0802E0AC: .4byte gUnknown_0203A610

	THUMB_FUNC_START sub_802E0B0
sub_802E0B0: @ 0x0802E0B0
	ldr r0, _0802E0BC  @ gUnknown_0203A610
	ldr r0, [r0]
	adds r0, #0x48
	movs r1, #3
	strb r1, [r0]
	bx lr
	.align 2, 0
_0802E0BC: .4byte gUnknown_0203A610

	THUMB_FUNC_START sub_802E0C0
sub_802E0C0: @ 0x0802E0C0
	ldr r0, _0802E0CC  @ gUnknown_0203A610
	ldr r0, [r0]
	adds r0, #0x48
	movs r1, #4
	strb r1, [r0]
	bx lr
	.align 2, 0
_0802E0CC: .4byte gUnknown_0203A610

	THUMB_FUNC_START sub_802E0D0
sub_802E0D0: @ 0x0802E0D0
	ldr r0, _0802E0DC  @ gUnknown_0203A610
	ldr r0, [r0]
	adds r0, #0x48
	movs r1, #5
	strb r1, [r0]
	bx lr
	.align 2, 0
_0802E0DC: .4byte gUnknown_0203A610

	THUMB_FUNC_START sub_802E0E0
sub_802E0E0: @ 0x0802E0E0
	ldr r0, _0802E0EC  @ gUnknown_0203A610
	ldr r0, [r0]
	adds r0, #0x48
	movs r1, #6
	strb r1, [r0]
	bx lr
	.align 2, 0
_0802E0EC: .4byte gUnknown_0203A610

	THUMB_FUNC_START sub_802E0F0
sub_802E0F0: @ 0x0802E0F0
	ldr r0, _0802E0FC  @ gUnknown_0203A610
	ldr r0, [r0]
	adds r0, #0x48
	movs r1, #7
	strb r1, [r0]
	bx lr
	.align 2, 0
_0802E0FC: .4byte gUnknown_0203A610

	THUMB_FUNC_START sub_802E100
sub_802E100: @ 0x0802E100
	ldr r0, _0802E10C  @ gUnknown_0203A610
	ldr r0, [r0]
	adds r0, #0x48
	movs r1, #8
	strb r1, [r0]
	bx lr
	.align 2, 0
_0802E10C: .4byte gUnknown_0203A610

	THUMB_FUNC_START sub_802E110
sub_802E110: @ 0x0802E110
	push {lr}
	ldr r0, _0802E120  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r0, [r0, #4]
	cmp r0, #0
	beq _0802E124
	movs r0, #1
	b _0802E126
	.align 2, 0
_0802E120: .4byte gKeyStatusPtr
_0802E124:
	movs r0, #0
_0802E126:
	pop {r1}
	bx r1

	THUMB_FUNC_START sub_802E12C
sub_802E12C: @ 0x0802E12C
	push {lr}
	adds r1, r0, #0
	ldr r0, _0802E13C  @ gUnknown_0859BC3C
	bl Proc_CreateBlockingChild
	pop {r0}
	bx r0
	.align 2, 0
_0802E13C: .4byte gUnknown_0859BC3C

	THUMB_FUNC_START sub_802E140
sub_802E140: @ 0x0802E140
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x48
	ldrb r0, [r0]
	cmp r0, #0
	beq _0802E15E
	ldr r0, _0802E164  @ gUnknown_0859BC64
	movs r1, #3
	bl CallEvent
	adds r0, r4, #0
	bl sub_802E12C
	bl sub_802DE6C
_0802E15E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802E164: .4byte gUnknown_0859BC64

	THUMB_FUNC_START sub_802E168
sub_802E168: @ 0x0802E168
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0802E184  @ gUnknown_0859BCA8
	movs r1, #3
	bl CallEvent
	adds r0, r4, #0
	bl sub_802E12C
	bl sub_802DE6C
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802E184: .4byte gUnknown_0859BCA8

	THUMB_FUNC_START sub_802E188
sub_802E188: @ 0x0802E188
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0802E1A4  @ gUnknown_0859BCF4
	movs r1, #3
	bl CallEvent
	adds r0, r4, #0
	bl sub_802E12C
	bl sub_802DE80
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802E1A4: .4byte gUnknown_0859BCF4

	THUMB_FUNC_START sub_802E1A8
sub_802E1A8: @ 0x0802E1A8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0802E1C4  @ gUnknown_0859BD40
	movs r1, #3
	bl CallEvent
	adds r0, r4, #0
	bl sub_802E12C
	bl sub_802DE6C
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802E1C4: .4byte gUnknown_0859BD40

.align 2, 0
