	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	@ I don't know, so graphical effect stuff probably


	THUMB_FUNC_START sub_808683C
sub_808683C: @ 0x0808683C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	ldr r7, _08086914  @ gPaletteBuffer+0xC0
	movs r0, #0
	mov r9, r0
	movs r1, #0x1f
	mov sl, r1
	movs r0, #0x80
	lsls r0, r0, #0xd
	mov r8, r0
_08086856:
	ldrh r3, [r7]
	movs r0, #0x1f
	lsrs r1, r3, #5
	lsrs r2, r3, #0xa
	ands r0, r3
	lsls r4, r0, #3
	adds r4, r4, r0
	lsls r0, r4, #4
	adds r4, r4, r0
	lsls r4, r4, #1
	mov r0, sl
	ands r1, r0
	ldr r0, _08086918  @ 0x00000259
	muls r0, r1, r0
	adds r4, r4, r0
	mov r1, sl
	ands r2, r1
	movs r0, #0x75
	muls r0, r2, r0
	adds r4, r4, r0
	lsls r4, r4, #0xa
	ldr r1, _0808691C  @ 0x0029BDDC
	adds r0, r4, r1
	mov r1, r8
	bl Div
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	ldr r1, _08086920  @ 0xFFFBEDED
	adds r0, r4, r1
	mov r1, r8
	bl Div
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	ldr r0, _08086924  @ 0xFFC71C6D
	adds r4, r4, r0
	adds r0, r4, #0
	mov r1, r8
	bl Div
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	lsls r0, r5, #0x10
	cmp r0, #0
	bge _080868B4
	movs r5, #0
_080868B4:
	lsls r0, r6, #0x10
	cmp r0, #0
	bge _080868BC
	movs r6, #0
_080868BC:
	lsls r0, r2, #0x10
	cmp r0, #0
	bge _080868C4
	movs r2, #0
_080868C4:
	lsls r0, r5, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x1f
	ble _080868CE
	movs r5, #0x1f
_080868CE:
	lsls r0, r6, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x1f
	ble _080868D8
	movs r6, #0x1f
_080868D8:
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x1f
	ble _080868E2
	movs r2, #0x1f
_080868E2:
	lsls r0, r6, #0x10
	asrs r0, r0, #0xb
	orrs r5, r0
	lsls r1, r5, #0x10
	lsls r0, r2, #0x1a
	orrs r0, r1
	lsrs r3, r0, #0x10
	strh r3, [r7]
	adds r7, #2
	mov r0, r9
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r9, r0
	cmp r0, #0x9f
	bls _08086856
	bl EnablePaletteSync
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08086914: .4byte gPaletteBuffer+0xC0
_08086918: .4byte 0x00000259
_0808691C: .4byte 0x0029BDDC
_08086920: .4byte 0xFFFBEDED
_08086924: .4byte 0xFFC71C6D

	THUMB_FUNC_END sub_808683C

	THUMB_FUNC_START sub_8086928
sub_8086928: @ 0x08086928
	push {lr}
	bl Make6C_SaveMenuPostChapter
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8086928

.align 2, 0
