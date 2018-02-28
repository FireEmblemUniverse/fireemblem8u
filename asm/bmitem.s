	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	THUMB_FUNC_START GetItemSomeString
GetItemSomeString: @ 0x0801618C
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	lsls r1, r1, #0x18
	lsrs r5, r1, #0x18
	bl GetItemIndex
	subs r0, #0x3c
	cmp r0, #0x7d
	bls _080161A0
	b _080163B0
_080161A0:
	lsls r0, r0, #2
	ldr r1, _080161AC  @ _080161B0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080161AC: .4byte _080161B0
_080161B0: @ jump table
	.4byte _080163A8 @ case 0
	.4byte _080163B0 @ case 1
	.4byte _080163A8 @ case 2
	.4byte _080163B0 @ case 3
	.4byte _080163B0 @ case 4
	.4byte _080163B0 @ case 5
	.4byte _080163B0 @ case 6
	.4byte _080163B0 @ case 7
	.4byte _080163B0 @ case 8
	.4byte _080163B0 @ case 9
	.4byte _080163B0 @ case 10
	.4byte _080163B0 @ case 11
	.4byte _080163B0 @ case 12
	.4byte _080163A8 @ case 13
	.4byte _080163A8 @ case 14
	.4byte _080163B0 @ case 15
	.4byte _080163B0 @ case 16
	.4byte _080163B0 @ case 17
	.4byte _080163B0 @ case 18
	.4byte _080163B0 @ case 19
	.4byte _080163B0 @ case 20
	.4byte _080163B0 @ case 21
	.4byte _080163B0 @ case 22
	.4byte _080163B0 @ case 23
	.4byte _080163B0 @ case 24
	.4byte _080163B0 @ case 25
	.4byte _080163B0 @ case 26
	.4byte _080163B0 @ case 27
	.4byte _080163B0 @ case 28
	.4byte _080163B0 @ case 29
	.4byte _080163B0 @ case 30
	.4byte _080163B0 @ case 31
	.4byte _080163B0 @ case 32
	.4byte _080163B0 @ case 33
	.4byte _080163B0 @ case 34
	.4byte _080163B0 @ case 35
	.4byte _080163B0 @ case 36
	.4byte _080163B0 @ case 37
	.4byte _080163B0 @ case 38
	.4byte _080163B0 @ case 39
	.4byte _080163B0 @ case 40
	.4byte _080163B0 @ case 41
	.4byte _080163B0 @ case 42
	.4byte _080163B0 @ case 43
	.4byte _080163B0 @ case 44
	.4byte _080163B0 @ case 45
	.4byte _080163B0 @ case 46
	.4byte _080163B0 @ case 47
	.4byte _080163B0 @ case 48
	.4byte _080163B0 @ case 49
	.4byte _080163B0 @ case 50
	.4byte _080163B0 @ case 51
	.4byte _080163B0 @ case 52
	.4byte _080163B0 @ case 53
	.4byte _080163B0 @ case 54
	.4byte _080163B0 @ case 55
	.4byte _080163B0 @ case 56
	.4byte _080163B0 @ case 57
	.4byte _080163B0 @ case 58
	.4byte _080163A8 @ case 59
	.4byte _080163A8 @ case 60
	.4byte _080163B0 @ case 61
	.4byte _080163B0 @ case 62
	.4byte _080163B0 @ case 63
	.4byte _080163B0 @ case 64
	.4byte _080163B0 @ case 65
	.4byte _080163B0 @ case 66
	.4byte _080163B0 @ case 67
	.4byte _080163B0 @ case 68
	.4byte _080163B0 @ case 69
	.4byte _080163B0 @ case 70
	.4byte _080163B0 @ case 71
	.4byte _080163B0 @ case 72
	.4byte _080163A8 @ case 73
	.4byte _080163B0 @ case 74
	.4byte _080163A8 @ case 75
	.4byte _080163B0 @ case 76
	.4byte _080163A8 @ case 77
	.4byte _080163B0 @ case 78
	.4byte _080163B0 @ case 79
	.4byte _080163A8 @ case 80
	.4byte _080163B0 @ case 81
	.4byte _080163A8 @ case 82
	.4byte _080163A8 @ case 83
	.4byte _080163B0 @ case 84
	.4byte _080163A8 @ case 85
	.4byte _080163A8 @ case 86
	.4byte _080163A8 @ case 87
	.4byte _080163A8 @ case 88
	.4byte _080163B0 @ case 89
	.4byte _080163B0 @ case 90
	.4byte _080163B0 @ case 91
	.4byte _080163B0 @ case 92
	.4byte _080163B0 @ case 93
	.4byte _080163A8 @ case 94
	.4byte _080163A8 @ case 95
	.4byte _080163A8 @ case 96
	.4byte _080163A8 @ case 97
	.4byte _080163A8 @ case 98
	.4byte _080163A8 @ case 99
	.4byte _080163A8 @ case 100
	.4byte _080163B0 @ case 101
	.4byte _080163B0 @ case 102
	.4byte _080163B0 @ case 103
	.4byte _080163B0 @ case 104
	.4byte _080163B0 @ case 105
	.4byte _080163B0 @ case 106
	.4byte _080163B0 @ case 107
	.4byte _080163B0 @ case 108
	.4byte _080163B0 @ case 109
	.4byte _080163B0 @ case 110
	.4byte _080163B0 @ case 111
	.4byte _080163B0 @ case 112
	.4byte _080163B0 @ case 113
	.4byte _080163B0 @ case 114
	.4byte _080163B0 @ case 115
	.4byte _080163B0 @ case 116
	.4byte _080163B0 @ case 117
	.4byte _080163B0 @ case 118
	.4byte _080163B0 @ case 119
	.4byte _080163B0 @ case 120
	.4byte _080163B0 @ case 121
	.4byte _080163A8 @ case 122
	.4byte _080163B0 @ case 123
	.4byte _080163A8 @ case 124
	.4byte _080163A8 @ case 125
_080163A8:
	adds r0, r4, #0
	bl GetItemNameString
	b _080163EA
_080163B0:
	adds r0, r4, #0
	bl GetItemIndex
	cmp r0, #0xb7
	bne _080163D4
	lsls r0, r5, #0x18
	asrs r1, r0, #0x18
	ldr r6, _080163CC  @ gUnknown_080D79E0
	adds r5, r0, #0
	cmp r1, #1
	bne _080163D8
	ldr r6, _080163D0  @ gUnknown_080D79D8
	b _080163D8
	.align 2, 0
_080163CC: .4byte gUnknown_080D79E0
_080163D0: .4byte gUnknown_080D79D8
_080163D4:
	movs r6, #0
	lsls r5, r5, #0x18
_080163D8:
	adds r0, r4, #0
	bl GetItemNameString
	adds r4, r0, #0
	asrs r2, r5, #0x18
	adds r1, r6, #0
	bl sub_800A160
	adds r0, r4, #0
_080163EA:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	THUMB_FUNC_START GetItemHPBonus
GetItemHPBonus: @ 0x080163F0
	push {lr}
	adds r1, r0, #0
	cmp r1, #0
	beq _0801640C
	movs r0, #0xff
	ands r0, r1
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _08016410  @ gUnknown_08809B10
	adds r1, r1, r0
	ldr r0, [r1, #0xc]
	cmp r0, #0
	bne _08016414
_0801640C:
	movs r0, #0
	b _0801641A
	.align 2, 0
_08016410: .4byte gUnknown_08809B10
_08016414:
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
_0801641A:
	pop {r1}
	bx r1

	THUMB_FUNC_START GetItemPowBonus
GetItemPowBonus: @ 0x08016420
	push {lr}
	adds r1, r0, #0
	cmp r1, #0
	beq _0801643C
	movs r0, #0xff
	ands r0, r1
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _08016440  @ gUnknown_08809B10
	adds r1, r1, r0
	ldr r0, [r1, #0xc]
	cmp r0, #0
	bne _08016444
_0801643C:
	movs r0, #0
	b _0801644A
	.align 2, 0
_08016440: .4byte gUnknown_08809B10
_08016444:
	ldrb r0, [r0, #1]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
_0801644A:
	pop {r1}
	bx r1

	THUMB_FUNC_START GetItemSklBonus
GetItemSklBonus: @ 0x08016450
	push {lr}
	adds r1, r0, #0
	cmp r1, #0
	beq _0801646C
	movs r0, #0xff
	ands r0, r1
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _08016470  @ gUnknown_08809B10
	adds r1, r1, r0
	ldr r0, [r1, #0xc]
	cmp r0, #0
	bne _08016474
_0801646C:
	movs r0, #0
	b _0801647A
	.align 2, 0
_08016470: .4byte gUnknown_08809B10
_08016474:
	ldrb r0, [r0, #2]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
_0801647A:
	pop {r1}
	bx r1

	THUMB_FUNC_START GetItemSpdBonus
GetItemSpdBonus: @ 0x08016480
	push {lr}
	adds r1, r0, #0
	cmp r1, #0
	beq _0801649C
	movs r0, #0xff
	ands r0, r1
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _080164A0  @ gUnknown_08809B10
	adds r1, r1, r0
	ldr r0, [r1, #0xc]
	cmp r0, #0
	bne _080164A4
_0801649C:
	movs r0, #0
	b _080164AA
	.align 2, 0
_080164A0: .4byte gUnknown_08809B10
_080164A4:
	ldrb r0, [r0, #3]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
_080164AA:
	pop {r1}
	bx r1

	THUMB_FUNC_START GetItemDefBonus
GetItemDefBonus: @ 0x080164B0
	push {lr}
	adds r1, r0, #0
	cmp r1, #0
	beq _080164CC
	movs r0, #0xff
	ands r0, r1
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _080164D0  @ gUnknown_08809B10
	adds r1, r1, r0
	ldr r0, [r1, #0xc]
	cmp r0, #0
	bne _080164D4
_080164CC:
	movs r0, #0
	b _080164DA
	.align 2, 0
_080164D0: .4byte gUnknown_08809B10
_080164D4:
	ldrb r0, [r0, #4]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
_080164DA:
	pop {r1}
	bx r1

	THUMB_FUNC_START GetItemResBonus
GetItemResBonus: @ 0x080164E0
	push {lr}
	adds r1, r0, #0
	cmp r1, #0
	beq _080164FC
	movs r0, #0xff
	ands r0, r1
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _08016500  @ gUnknown_08809B10
	adds r1, r1, r0
	ldr r0, [r1, #0xc]
	cmp r0, #0
	bne _08016504
_080164FC:
	movs r0, #0
	b _0801650A
	.align 2, 0
_08016500: .4byte gUnknown_08809B10
_08016504:
	ldrb r0, [r0, #5]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
_0801650A:
	pop {r1}
	bx r1

	THUMB_FUNC_START GetItemLckBonus
GetItemLckBonus: @ 0x08016510
	push {lr}
	adds r1, r0, #0
	cmp r1, #0
	beq _0801652C
	movs r0, #0xff
	ands r0, r1
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _08016530  @ gUnknown_08809B10
	adds r1, r1, r0
	ldr r0, [r1, #0xc]
	cmp r0, #0
	bne _08016534
_0801652C:
	movs r0, #0
	b _0801653A
	.align 2, 0
_08016530: .4byte gUnknown_08809B10
_08016534:
	ldrb r0, [r0, #6]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
_0801653A:
	pop {r1}
	bx r1

	THUMB_FUNC_START MakeItemShort
MakeItemShort: @ 0x08016540
	push {lr}
	adds r2, r0, #0
	movs r0, #0xff
	ands r2, r0
	lsls r0, r2, #3
	adds r0, r0, r2
	lsls r0, r0, #2
	ldr r1, _08016570  @ gUnknown_08809B10
	adds r3, r0, r1
	ldr r1, [r3, #8]
	movs r0, #8
	ands r1, r0
	movs r0, #0xff
	cmp r1, #0
	bne _08016560
	ldrb r0, [r3, #0x14]
_08016560:
	cmp r1, #0
	beq _08016566
	movs r0, #0
_08016566:
	lsls r0, r0, #8
	adds r0, r0, r2
	pop {r1}
	bx r1
	.align 2, 0
_08016570: .4byte gUnknown_08809B10

	.align 2, 0 @ Don't pad with nop.
