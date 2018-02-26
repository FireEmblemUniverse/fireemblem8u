	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	THUMB_FUNC_START sub_800A048
sub_800A048: @ 0x0800A048
	push {lr}
	lsls r1, r1, #0x18
	lsrs r2, r1, #0x18
	ldrb r0, [r0]
	subs r0, #0x41
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x34
	bhi _0800A14C
	lsls r0, r0, #2
	ldr r1, _0800A064  @ _0800A068
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0800A064: .4byte _0800A068
_0800A068: @ jump table
	.4byte _0800A13C @ case 0
	.4byte _0800A14C @ case 1
	.4byte _0800A14C @ case 2
	.4byte _0800A14C @ case 3
	.4byte _0800A13C @ case 4
	.4byte _0800A14C @ case 5
	.4byte _0800A14C @ case 6
	.4byte _0800A14C @ case 7
	.4byte _0800A13C @ case 8
	.4byte _0800A14C @ case 9
	.4byte _0800A14C @ case 10
	.4byte _0800A14C @ case 11
	.4byte _0800A14C @ case 12
	.4byte _0800A14C @ case 13
	.4byte _0800A13C @ case 14
	.4byte _0800A14C @ case 15
	.4byte _0800A14C @ case 16
	.4byte _0800A14C @ case 17
	.4byte _0800A14C @ case 18
	.4byte _0800A14C @ case 19
	.4byte _0800A13C @ case 20
	.4byte _0800A14C @ case 21
	.4byte _0800A14C @ case 22
	.4byte _0800A14C @ case 23
	.4byte _0800A14C @ case 24
	.4byte _0800A14C @ case 25
	.4byte _0800A14C @ case 26
	.4byte _0800A14C @ case 27
	.4byte _0800A14C @ case 28
	.4byte _0800A14C @ case 29
	.4byte _0800A14C @ case 30
	.4byte _0800A14C @ case 31
	.4byte _0800A13C @ case 32
	.4byte _0800A14C @ case 33
	.4byte _0800A14C @ case 34
	.4byte _0800A14C @ case 35
	.4byte _0800A13C @ case 36
	.4byte _0800A14C @ case 37
	.4byte _0800A14C @ case 38
	.4byte _0800A14C @ case 39
	.4byte _0800A13C @ case 40
	.4byte _0800A14C @ case 41
	.4byte _0800A14C @ case 42
	.4byte _0800A14C @ case 43
	.4byte _0800A14C @ case 44
	.4byte _0800A14C @ case 45
	.4byte _0800A13C @ case 46
	.4byte _0800A14C @ case 47
	.4byte _0800A14C @ case 48
	.4byte _0800A14C @ case 49
	.4byte _0800A14C @ case 50
	.4byte _0800A14C @ case 51
	.4byte _0800A13C @ case 52
_0800A13C:
	ldr r0, _0800A148  @ gUnknown_08591AA4
	lsls r1, r2, #0x18
	asrs r1, r1, #0x16
	adds r0, #8
	b _0800A152
	.align 2, 0
_0800A148: .4byte gUnknown_08591AA4
_0800A14C:
	ldr r0, _0800A15C  @ gUnknown_08591AA4
	lsls r1, r2, #0x18
	asrs r1, r1, #0x16
_0800A152:
	adds r1, r1, r0
	ldr r0, [r1]
	pop {r1}
	bx r1
	.align 2, 0
_0800A15C: .4byte gUnknown_08591AA4

	THUMB_FUNC_START sub_800A160
sub_800A160: @ 0x0800A160
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r0, r1, #0
	lsls r2, r2, #0x18
	lsrs r1, r2, #0x18
	cmp r0, #0
	bne _0800A178
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, r4, #0
	bl sub_800A048
_0800A178:
	adds r6, r0, #0
	adds r0, r6, #0
	bl strlen
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	adds r0, r4, #0
	bl strlen
	lsls r0, r0, #0x10
	cmp r0, #0
	blt _0800A1A4
_0800A190:
	asrs r2, r0, #0x10
	adds r1, r2, r5
	adds r1, r4, r1
	adds r0, r4, r2
	ldrb r0, [r0]
	strb r0, [r1]
	subs r2, #1
	lsls r0, r2, #0x10
	cmp r0, #0
	bge _0800A190
_0800A1A4:
	movs r1, #0
	cmp r1, r5
	bge _0800A1C2
_0800A1AA:
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	adds r2, r4, r0
	adds r1, r6, r0
	ldrb r1, [r1]
	strb r1, [r2]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, r5
	blt _0800A1AA
_0800A1C2:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_START SomethingRelatedToText
SomethingRelatedToText: @ 0x0800A1C8
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r3, #0
	movs r0, #0
	ldrsb r0, [r4, r0]
	cmp r0, #0
	beq _0800A20E
_0800A1D6:
	lsls r0, r3, #0x10
	asrs r2, r0, #0x10
	adds r0, r4, r2
	ldrb r1, [r0]
	cmp r1, #0x10
	bne _0800A1E8
	adds r0, r2, #2
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
_0800A1E8:
	cmp r1, #0x80
	bne _0800A1F6
	lsls r0, r3, #0x10
	movs r1, #0x80
	lsls r1, r1, #9
	adds r0, r0, r1
	lsrs r3, r0, #0x10
_0800A1F6:
	lsls r0, r3, #0x10
	movs r1, #0x80
	lsls r1, r1, #9
	adds r0, r0, r1
	lsrs r3, r0, #0x10
	asrs r0, r0, #0x10
	adds r0, r4, r0
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _0800A1D6
_0800A20E:
	lsls r0, r3, #0x10
	ldr r1, _0800A23C  @ 0xFFFF0000
	adds r0, r0, r1
	cmp r0, #0
	blt _0800A236
	movs r5, #0
_0800A21A:
	asrs r3, r0, #0x10
	adds r2, r4, r3
	ldrb r1, [r2]
	cmp r1, #0x1f
	bne _0800A236
	subs r0, r2, #1
	ldrb r1, [r0]
	cmp r1, #0x80
	beq _0800A22E
	strb r5, [r2]
_0800A22E:
	subs r0, r3, #1
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _0800A21A
_0800A236:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0800A23C: .4byte 0xFFFF0000

	THUMB_FUNC_START GetStringFromIndex
GetStringFromIndex: @ 0x0800A240
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r6, _0800A268  @ gUnknown_0202B6AC
	ldr r0, [r6]
	cmp r5, r0
	beq _0800A274
	ldr r1, _0800A26C  @ gUnknown_0815D48C
	lsls r0, r5, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r4, _0800A270  @ gUnknown_0202A6AC
	adds r1, r4, #0
	bl CallARM_DecompText
	adds r0, r4, #0
	bl SomethingRelatedToText
	str r5, [r6]
	adds r0, r4, #0
	b _0800A276
	.align 2, 0
_0800A268: .4byte gUnknown_0202B6AC
_0800A26C: .4byte gUnknown_0815D48C
_0800A270: .4byte gUnknown_0202A6AC
_0800A274:
	ldr r0, _0800A27C  @ gUnknown_0202A6AC
_0800A276:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0800A27C: .4byte gUnknown_0202A6AC

	THUMB_FUNC_START GetStringFromIndexInBuffer
GetStringFromIndexInBuffer: @ 0x0800A280
	push {r4, lr}
	adds r4, r1, #0
	ldr r1, _0800A2A0  @ gUnknown_0815D48C
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r1, r4, #0
	bl CallARM_DecompText
	adds r0, r4, #0
	bl SomethingRelatedToText
	adds r0, r4, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0800A2A0: .4byte gUnknown_0815D48C

	THUMB_FUNC_START sub_800A2A4
sub_800A2A4: @ 0x0800A2A4
	push {r4, r5, lr}
	ldr r5, _0800A2B8  @ gUnknown_0202AC01
	ldr r0, _0800A2BC  @ 0x00000555
	adds r4, r5, r0
	ldr r0, _0800A2C0  @ 0xFFFFFAAB
	adds r1, r5, r0
	adds r0, r5, #0
	bl CopyString
	b _0800A39C
	.align 2, 0
_0800A2B8: .4byte gUnknown_0202AC01
_0800A2BC: .4byte 0x00000555
_0800A2C0: .4byte 0xFFFFFAAB
_0800A2C4:
	adds r0, r1, #0
	cmp r0, #0x1f
	bhi _0800A2CE
	strb r1, [r4]
	b _0800A36A
_0800A2CE:
	cmp r0, #0x80
	beq _0800A2D6
	strb r1, [r4]
	b _0800A36A
_0800A2D6:
	adds r5, #1
	ldrb r0, [r5]
	subs r0, #0x12
	cmp r0, #0x10
	bhi _0800A360
	lsls r0, r0, #2
	ldr r1, _0800A2EC  @ _0800A2F0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0800A2EC: .4byte _0800A2F0
_0800A2F0: @ jump table
	.4byte _0800A334 @ case 0
	.4byte _0800A338 @ case 1
	.4byte _0800A33C @ case 2
	.4byte _0800A340 @ case 3
	.4byte _0800A360 @ case 4
	.4byte _0800A360 @ case 5
	.4byte _0800A360 @ case 6
	.4byte _0800A360 @ case 7
	.4byte _0800A360 @ case 8
	.4byte _0800A360 @ case 9
	.4byte _0800A360 @ case 10
	.4byte _0800A360 @ case 11
	.4byte _0800A360 @ case 12
	.4byte _0800A360 @ case 13
	.4byte _0800A344 @ case 14
	.4byte _0800A360 @ case 15
	.4byte _0800A34A @ case 16
_0800A334:
	movs r1, #0
	b _0800A370
_0800A338:
	movs r1, #1
	b _0800A370
_0800A33C:
	movs r1, #2
	b _0800A370
_0800A340:
	movs r1, #3
	b _0800A370
_0800A344:
	bl GetTacticianNameStringPtr
	b _0800A352
_0800A34A:
	ldr r0, _0800A35C  @ gUnknown_0203A958
	ldrh r0, [r0, #6]
	bl GetItemNameString
_0800A352:
	adds r1, r0, #0
	adds r0, r4, #0
	bl CopyString
	b _0800A38A
	.align 2, 0
_0800A35C: .4byte gUnknown_0203A958
_0800A360:
	movs r0, #0x80
	strb r0, [r4]
	adds r4, #1
	ldrb r0, [r5]
	strb r0, [r4]
_0800A36A:
	adds r5, #1
	adds r4, #1
	b _0800A39C
_0800A370:
	ldr r0, _0800A3B0  @ gUnknown_0202BCF0
	adds r0, #0x1c
	adds r0, r1, r0
	ldrb r0, [r0]
	bl GetROMCharStruct
	ldrh r0, [r0]
	bl GetStringFromIndex
	adds r1, r0, #0
	adds r0, r4, #0
	bl CopyString
_0800A38A:
	ldrb r0, [r4]
	adds r1, r5, #1
	cmp r0, #0
	beq _0800A39A
_0800A392:
	adds r4, #1
	ldrb r0, [r4]
	cmp r0, #0
	bne _0800A392
_0800A39A:
	adds r5, r1, #0
_0800A39C:
	ldrb r1, [r5]
	cmp r1, #0
	bne _0800A2C4
	movs r0, #0
	strb r0, [r4]
	ldr r0, _0800A3B4  @ gUnknown_0202B156
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0800A3B0: .4byte gUnknown_0202BCF0
_0800A3B4: .4byte gUnknown_0202B156

	THUMB_FUNC_START FilterSomeTextFromStandardBuffer
FilterSomeTextFromStandardBuffer: @ 0x0800A3B8
	push {r4, r5, lr}
	ldr r5, _0800A3D0  @ gUnknown_0202B4AC
	movs r0, #0x80
	lsls r0, r0, #1
	adds r4, r5, r0
	ldr r0, _0800A3D4  @ 0xFFFFF200
	adds r1, r5, r0
	adds r0, r5, #0
	bl CopyString
	b _0800A416
	.align 2, 0
_0800A3D0: .4byte gUnknown_0202B4AC
_0800A3D4: .4byte 0xFFFFF200
_0800A3D8:
	adds r1, r0, #0
	cmp r1, #0x1f
	bls _0800A3F0
	cmp r1, #0x80
	bne _0800A3F0
	adds r5, #1
	ldrb r0, [r5]
	cmp r0, #0x20
	beq _0800A3F8
	strb r1, [r4]
	adds r4, #1
	ldrb r0, [r5]
_0800A3F0:
	strb r0, [r4]
	adds r5, #1
	adds r4, #1
	b _0800A416
_0800A3F8:
	bl GetTacticianNameStringPtr
	adds r1, r0, #0
	adds r0, r4, #0
	bl CopyString
	ldrb r0, [r4]
	adds r1, r5, #1
	cmp r0, #0
	beq _0800A414
_0800A40C:
	adds r4, #1
	ldrb r0, [r4]
	cmp r0, #0
	bne _0800A40C
_0800A414:
	adds r5, r1, #0
_0800A416:
	ldrb r0, [r5]
	cmp r0, #0
	bne _0800A3D8
	movs r0, #0
	strb r0, [r4]
	ldr r0, _0800A428  @ gUnknown_0202B5AC
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0800A428: .4byte gUnknown_0202B5AC
