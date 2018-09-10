	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	@ "MOVEUNIT" proc and related functions
	@ Handles managing and displaying moving map sprites

	THUMB_FUNC_START sub_8079BE0
sub_8079BE0: @ 0x08079BE0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x18
	movs r0, #0
	str r0, [sp, #0x10]
	add r0, sp, #0x10
	ldr r2, _08079CD4  @ 0x05000004
	mov r1, sp
	bl CpuSet
	movs r5, #0
	movs r1, #0
_08079BFE:
	lsls r0, r1, #0x18
	asrs r4, r0, #0x18
	adds r0, r4, #0
	bl GetMoveunitByIndex
	adds r2, r0, #0
	cmp r2, #0
	beq _08079C1E
	lsls r0, r5, #0x18
	asrs r0, r0, #0x18
	lsls r1, r0, #2
	add r1, sp
	str r2, [r1]
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
_08079C1E:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #3
	ble _08079BFE
	movs r1, #0
	lsls r0, r5, #0x18
	asrs r2, r0, #0x18
	subs r3, r2, #1
	mov r8, r0
	cmp r1, r3
	bge _08079C98
	mov sl, r2
	mov r9, r3
_08079C3C:
	lsls r0, r1, #0x18
	asrs r3, r0, #0x18
	movs r1, #0x80
	lsls r1, r1, #0x11
	adds r2, r0, r1
	asrs r1, r2, #0x18
	mov ip, r0
	cmp r1, sl
	bge _08079C8A
	lsls r0, r3, #2
	mov r7, sp
	adds r6, r7, r0
	mov r0, r8
	asrs r0, r0, #0x18
	str r0, [sp, #0x14]
_08079C5A:
	asrs r5, r2, #0x18
	lsls r0, r5, #2
	mov r1, sp
	adds r4, r1, r0
	ldr r3, [r4]
	adds r1, r3, #0
	adds r1, #0x4e
	ldr r2, [r6]
	adds r0, r2, #0
	adds r0, #0x4e
	movs r7, #0
	ldrsh r1, [r1, r7]
	movs r7, #0
	ldrsh r0, [r0, r7]
	cmp r1, r0
	bge _08079C7E
	str r3, [r6]
	str r2, [r4]
_08079C7E:
	adds r0, r5, #1
	lsls r2, r0, #0x18
	asrs r0, r2, #0x18
	ldr r1, [sp, #0x14]
	cmp r0, r1
	blt _08079C5A
_08079C8A:
	movs r0, #0x80
	lsls r0, r0, #0x11
	add r0, ip
	lsrs r1, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, r9
	blt _08079C3C
_08079C98:
	movs r1, #0
	mov r2, r8
	asrs r0, r2, #0x18
	cmp r1, r0
	bge _08079CC2
	movs r4, #0xa
	adds r3, r0, #0
_08079CA6:
	lsls r0, r1, #0x18
	asrs r0, r0, #0x18
	lsls r1, r0, #2
	add r1, sp
	ldr r1, [r1]
	ldr r2, [r1, #0x30]
	subs r1, r4, r0
	strh r1, [r2, #0x1e]
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, r3
	blt _08079CA6
_08079CC2:
	add sp, #0x18
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08079CD4: .4byte 0x05000004

.align 2, 0
