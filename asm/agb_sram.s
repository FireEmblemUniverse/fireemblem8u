    .INCLUDE "macro.inc"

    .SYNTAX unified

	THUMB_FUNC_START SRAMLoader
SRAMLoader: @ 0x080D16E4
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	adds r3, r2, #0
	ldr r2, _080D171C @ 0x04000204
	ldrh r0, [r2]
	ldr r1, _080D1720 @ 0x0000FFFC
	ands r0, r1
	movs r1, #3
	orrs r0, r1
	strh r0, [r2]
	subs r3, #1
	movs r0, #1
	rsbs r0, r0, #0
	cmp r3, r0
	beq _080D1714
	adds r1, r0, #0
_080D1706:
	ldrb r0, [r5]
	strb r0, [r4]
	adds r5, #1
	adds r4, #1
	subs r3, #1
	cmp r3, r1
	bne _080D1706
_080D1714:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080D171C: .4byte 0x04000204
_080D1720: .4byte 0x0000FFFC

	THUMB_FUNC_START SRAMTransfer
SRAMTransfer: @ 0x080D1724
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	adds r3, r2, #0
	ldr r2, _080D175C @ 0x04000204
	ldrh r0, [r2]
	ldr r1, _080D1760 @ 0x0000FFFC
	ands r0, r1
	movs r1, #3
	orrs r0, r1
	strh r0, [r2]
	subs r3, #1
	movs r0, #1
	rsbs r0, r0, #0
	cmp r3, r0
	beq _080D1754
	adds r1, r0, #0
_080D1746:
	ldrb r0, [r5]
	strb r0, [r4]
	adds r5, #1
	adds r4, #1
	subs r3, #1
	cmp r3, r1
	bne _080D1746
_080D1754:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080D175C: .4byte 0x04000204
_080D1760: .4byte 0x0000FFFC

	THUMB_FUNC_START SaveChecker
SaveChecker: @ 0x080D1764
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	adds r3, r2, #0
	ldr r2, _080D1798 @ 0x04000204
	ldrh r0, [r2]
	ldr r1, _080D179C @ 0x0000FFFC
	ands r0, r1
	movs r1, #3
	orrs r0, r1
	strh r0, [r2]
	subs r3, #1
	movs r0, #1
	rsbs r0, r0, #0
	cmp r3, r0
	beq _080D17A6
	adds r2, r0, #0
_080D1786:
	ldrb r1, [r4]
	ldrb r0, [r5]
	adds r5, #1
	adds r4, #1
	cmp r1, r0
	beq _080D17A0
	subs r0, r4, #1
	b _080D17A8
	.align 2, 0
_080D1798: .4byte 0x04000204
_080D179C: .4byte 0x0000FFFC
_080D17A0:
	subs r3, #1
	cmp r3, r2
	bne _080D1786
_080D17A6:
	movs r0, #0
_080D17A8:
	pop {r4, r5}
	pop {r1}
	bx r1
	.byte 0x00, 0x00

	THUMB_FUNC_START StoreLoadRoutinesToRAM
StoreLoadRoutinesToRAM: @ 0x080D17B0
	push {lr}
	ldr r2, _080D17C4 @ 0x080D16E5
	movs r0, #1
	bics r2, r0
	ldr r3, _080D17C8 @ 0x03002B08
	ldr r0, _080D17CC @ 0x080D1725
	ldr r1, _080D17C4 @ 0x080D16E5
	subs r0, r0, r1
	lsls r0, r0, #0xf
	b _080D17DC
	.align 2, 0
_080D17C4: .4byte SRAMLoader
_080D17C8: .4byte gUnknown_03002B08
_080D17CC: .4byte SRAMTransfer
_080D17D0:
	ldrh r0, [r2]
	strh r0, [r3]
	adds r2, #2
	adds r3, #2
	subs r0, r1, #1
	lsls r0, r0, #0x10
_080D17DC:
	lsrs r1, r0, #0x10
	cmp r1, #0
	bne _080D17D0
	ldr r1, _080D17FC @ 0x030067A0
	ldr r0, _080D1800 @ 0x03002B09
	str r0, [r1]
	ldr r2, _080D1804 @ 0x080D1765
	movs r0, #1
	bics r2, r0
	ldr r3, _080D1808 @ 0x03002A68
	ldr r0, _080D180C @ 0x080D17B1
	ldr r1, _080D1804 @ 0x080D1765
	subs r0, r0, r1
	lsls r0, r0, #0xf
	b _080D181C
	.align 2, 0
_080D17FC: .4byte gUnknown_030067A0
_080D1800: .4byte gUnknown_03002B09
_080D1804: .4byte SaveChecker
_080D1808: .4byte gUnknown_03002A68
_080D180C: .4byte StoreLoadRoutinesToRAM
_080D1810:
	ldrh r0, [r2]
	strh r0, [r3]
	adds r2, #2
	adds r3, #2
	subs r0, r1, #1
	lsls r0, r0, #0x10
_080D181C:
	lsrs r1, r0, #0x10
	cmp r1, #0
	bne _080D1810
	ldr r1, _080D183C @ 0x030067A4
	ldr r0, _080D1840 @ 0x03002A69
	str r0, [r1]
	ldr r2, _080D1844 @ 0x04000204
	ldrh r0, [r2]
	ldr r1, _080D1848 @ 0x0000FFFC
	ands r0, r1
	movs r1, #3
	orrs r0, r1
	strh r0, [r2]
	pop {r0}
	bx r0
	.align 2, 0
_080D183C: .4byte gUnknown_030067A4
_080D1840: .4byte gUnknown_03002A69
_080D1844: .4byte 0x04000204
_080D1848: .4byte 0x0000FFFC

	THUMB_FUNC_START SRAMTransfer_WithCheck
SRAMTransfer_WithCheck: @ 0x080D184C
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r5, r1, #0
	adds r4, r2, #0
	movs r7, #0
	b _080D185E
_080D1858:
	adds r0, r7, #1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
_080D185E:
	cmp r7, #2
	bhi _080D1880
	adds r0, r6, #0
	adds r1, r5, #0
	adds r2, r4, #0
	bl SRAMTransfer
	ldr r0, _080D1888 @ 0x030067A4
	ldr r3, [r0]
	adds r0, r6, #0
	adds r1, r5, #0
	adds r2, r4, #0
	bl _call_via_r3
	adds r3, r0, #0
	cmp r3, #0
	bne _080D1858
_080D1880:
	adds r0, r3, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080D1888: .4byte gUnknown_030067A4

	THUMB_FUNC_START sub_80D188C
sub_80D188C: @ 0x080D188C
	push {r4, r5, r6, lr}
	adds r6, r1, #0
	adds r5, r0, #0
	cmp r2, #0
	beq _080D18BC
	movs r0, #0x20
	subs r0, r0, r2
	cmp r0, #0
	bgt _080D18A8
	movs r3, #0
	rsbs r0, r0, #0
	adds r4, r5, #0
	lsls r4, r0
	b _080D18B8
_080D18A8:
	adds r1, r5, #0
	lsrs r1, r0
	adds r3, r5, #0
	lsls r3, r2
	adds r0, r6, #0
	lsls r0, r2
	adds r4, r0, #0
	orrs r4, r1
_080D18B8:
	adds r1, r4, #0
	adds r0, r3, #0
_080D18BC:
	pop {r4, r5, r6, pc}
	.byte 0x00, 0x00
