	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	@ "Container" (aka Convoy) related things

	THUMB_FUNC_START sub_8031660
sub_8031660: @ 0x08031660
	push {lr}
	ldr r0, _0803167C  @ gRAMChapterData
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetROMChapterStruct
	adds r0, #0x82
	ldrb r0, [r0]
	cmp r0, #0xff
	beq _08031680
	movs r0, #1
	b _08031682
	.align 2, 0
_0803167C: .4byte gRAMChapterData
_08031680:
	movs r0, #0
_08031682:
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8031660

	THUMB_FUNC_START sub_8031688
sub_8031688: @ 0x08031688
	push {r4, lr}
	movs r4, #1
_0803168C:
	adds r0, r4, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq _080316B4
	ldr r1, [r2]
	cmp r1, #0
	beq _080316B4
	ldr r0, [r2, #4]
	ldr r1, [r1, #0x28]
	ldr r0, [r0, #0x28]
	orrs r1, r0
	movs r0, #0x80
	lsls r0, r0, #2
	ands r1, r0
	cmp r1, #0
	beq _080316B4
	adds r0, r2, #0
	b _080316BC
_080316B4:
	adds r4, #1
	cmp r4, #0x3f
	ble _0803168C
	movs r0, #0
_080316BC:
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8031688

.align 2, 0
