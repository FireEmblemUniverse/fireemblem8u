	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	@ Target Selection Stuff

	THUMB_FUNC_START LinkTargetsOrdered
LinkTargetsOrdered: @ 0x0804FC5C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	movs r7, #0
	movs r5, #0
	movs r4, #0
	ldr r0, _0804FCF0  @ gUnknown_0203E0EC
	mov r9, r0
	ldr r1, _0804FCF4  @ gUnknown_0203DDE8
	mov r8, r1
	ldr r3, _0804FCF8  @ gUnknown_085B658C
	mov sl, r3
_0804FC7A:
	mov r6, r8
	movs r0, #0
	ldrsh r2, [r6, r0]
	lsls r1, r4, #2
	add r1, sl
	movs r0, #0
	ldrsb r0, [r1, r0]
	adds r2, r2, r0
	str r2, [sp]
	movs r3, #2
	ldrsh r2, [r6, r3]
	movs r0, #1
	ldrsb r0, [r1, r0]
	adds r2, r2, r0
	movs r1, #0
	ldr r3, _0804FCFC  @ gUnknown_0203DDEC
	mov r6, r9
	ldr r0, [r6]
	adds r4, #1
	cmp r1, r0
	bge _0804FCD4
	mov ip, r9
_0804FCA6:
	movs r0, #0
	ldrsb r0, [r3, r0]
	ldr r6, [sp]
	cmp r6, r0
	bne _0804FCC8
	movs r0, #1
	ldrsb r0, [r3, r0]
	cmp r2, r0
	bne _0804FCC8
	str r5, [r3, #4]
	cmp r5, #0
	beq _0804FCC0
	str r3, [r5, #8]
_0804FCC0:
	cmp r7, #0
	bne _0804FCC6
	adds r7, r3, #0
_0804FCC6:
	adds r5, r3, #0
_0804FCC8:
	adds r1, #1
	adds r3, #0xc
	mov r6, ip
	ldr r0, [r6]
	cmp r1, r0
	blt _0804FCA6
_0804FCD4:
	cmp r4, #0xc
	ble _0804FC7A
	str r5, [r7, #4]
	str r7, [r5, #8]
	adds r0, r7, #0
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0804FCF0: .4byte gUnknown_0203E0EC
_0804FCF4: .4byte gUnknown_0203DDE8
_0804FCF8: .4byte gUnknown_085B658C
_0804FCFC: .4byte gUnknown_0203DDEC

	THUMB_FUNC_END LinkTargetsOrdered

	THUMB_FUNC_START GetLinkedTargetList
GetLinkedTargetList: @ 0x0804FD00
	push {lr}
	bl LinkTargets
	ldr r0, _0804FD0C  @ gUnknown_0203DDEC
	pop {r1}
	bx r1
	.align 2, 0
_0804FD0C: .4byte gUnknown_0203DDEC

	THUMB_FUNC_END GetLinkedTargetList

	THUMB_FUNC_START GetFirstTargetPointer
GetFirstTargetPointer: @ 0x0804FD10
	push {lr}
	bl GetFarthestTargetIndex
	cmp r0, #2
	bgt _0804FD20
	bl LinkTargetsOrdered
	b _0804FD24
_0804FD20:
	bl GetLinkedTargetList
_0804FD24:
	pop {r1}
	bx r1

	THUMB_FUNC_END GetFirstTargetPointer

	THUMB_FUNC_START sub_804FD28
sub_804FD28: @ 0x0804FD28
	ldr r0, _0804FD30  @ gUnknown_0203E0EC
	ldr r0, [r0]
	bx lr
	.align 2, 0
_0804FD30: .4byte gUnknown_0203E0EC

	THUMB_FUNC_END sub_804FD28

	THUMB_FUNC_START GetTarget
GetTarget: @ 0x0804FD34
	adds r1, r0, #0
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _0804FD44  @ gUnknown_0203DDEC
	adds r0, r0, r1
	bx lr
	.align 2, 0
_0804FD44: .4byte gUnknown_0203DDEC

	THUMB_FUNC_END GetTarget

.align 2, 0
