	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	@ Stuff related to reading (ROM) chapter data

	THUMB_FUNC_START GetROMChapterStruct
GetROMChapterStruct: @ 0x08034618
	push {lr}
	adds r1, r0, #0
	cmp r1, #0x7f
	beq _08034630
	movs r0, #0x94
	muls r0, r1, r0
	ldr r1, _0803462C  @ gUnknown_088B0890
	adds r0, r0, r1
	b _08034636
	.align 2, 0
_0803462C: .4byte gUnknown_088B0890
_08034630:
	ldr r0, _0803463C  @ gUnknown_08A1FB34
	ldr r0, [r0]
	ldr r0, [r0]
_08034636:
	pop {r1}
	bx r1
	.align 2, 0
_0803463C: .4byte gUnknown_08A1FB34

	THUMB_FUNC_START GetChapterMapPointer
GetChapterMapPointer: @ 0x08034640
	push {r4, r5, r6, lr}
	cmp r0, #0x7f
	bne _0803466C
	ldr r6, _08034664  @ ReadSramFast
	bl sub_80A6B70
	adds r4, r0, #0
	ldr r5, _08034668  @ gUnknown_02020188
	bl sub_80A6B90
	adds r2, r0, #0
	ldr r3, [r6]
	adds r0, r4, #0
	adds r1, r5, #0
	bl _call_via_r3
	adds r0, r5, #0
	b _0803467A
	.align 2, 0
_08034664: .4byte ReadSramFast
_08034668: .4byte gUnknown_02020188
_0803466C:
	ldr r4, _08034680  @ gUnknown_088B363C
	bl GetROMChapterStruct
	ldrb r0, [r0, #8]
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r0, [r0]
_0803467A:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08034680: .4byte gUnknown_088B363C

	THUMB_FUNC_START GetChapterMapChangesPointer
GetChapterMapChangesPointer: @ 0x08034684
	push {r4, lr}
	cmp r0, #0x7f
	bne _08034698
	ldr r0, _08034694  @ gUnknown_08A1FB34
	ldr r0, [r0]
	ldr r0, [r0, #4]
	b _080346A6
	.align 2, 0
_08034694: .4byte gUnknown_08A1FB34
_08034698:
	ldr r4, _080346AC  @ gUnknown_088B363C
	bl GetROMChapterStruct
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r0, [r0]
_080346A6:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080346AC: .4byte gUnknown_088B363C

	THUMB_FUNC_START GetChapterEventDataPointer
GetChapterEventDataPointer: @ 0x080346B0
	push {r4, lr}
	cmp r0, #0x7f
	bne _080346C4
	ldr r0, _080346C0  @ gUnknown_08A1FB34
	ldr r0, [r0]
	ldr r0, [r0, #8]
	b _080346D4
	.align 2, 0
_080346C0: .4byte gUnknown_08A1FB34
_080346C4:
	ldr r4, _080346DC  @ gUnknown_088B363C
	bl GetROMChapterStruct
	adds r0, #0x74
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r0, [r0]
_080346D4:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080346DC: .4byte gUnknown_088B363C

	THUMB_FUNC_START sub_80346E0
sub_80346E0: @ 0x080346E0
	push {lr}
	cmp r0, #0x7f
	bne _080346F4
	ldr r0, _080346F0  @ gUnknown_08A1FB34
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	b _080346FE
	.align 2, 0
_080346F0: .4byte gUnknown_08A1FB34
_080346F4:
	bl GetROMChapterStruct
	adds r0, #0x70
	bl GetStringFromIndex
_080346FE:
	pop {r1}
	bx r1

	THUMB_FUNC_START GetSomethingRelatedToCurrentDifficulty
GetSomethingRelatedToCurrentDifficulty: @ 0x08034704
	ldr r0, _08034718  @ gUnknown_0202BCF0
	ldrb r1, [r0, #0x14]
	movs r0, #0x40
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	negs r0, r0
	lsrs r0, r0, #0x1f
	bx lr
	.align 2, 0
_08034718: .4byte gUnknown_0202BCF0

.align 2, 0
