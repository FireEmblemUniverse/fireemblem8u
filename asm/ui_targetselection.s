	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	@ Target Selection Stuff

	THUMB_FUNC_START TargetSelection_HandleMoveInput
TargetSelection_HandleMoveInput: @ 0x0804FAEC
	push {r4, lr}
	adds r4, r0, #0
	ldr r3, [r4, #0x30]
	ldr r2, _0804FB5C  @ gKeyStatusPtr
	ldr r0, [r2]
	ldrh r1, [r0, #6]
	movs r0, #0x60
	ands r0, r1
	cmp r0, #0
	beq _0804FB08
	ldr r0, [r3, #4]
	cmp r0, #0
	beq _0804FB08
	str r0, [r4, #0x30]
_0804FB08:
	ldr r0, [r2]
	ldrh r1, [r0, #6]
	movs r0, #0x90
	ands r0, r1
	cmp r0, #0
	beq _0804FB1E
	ldr r0, [r4, #0x30]
	ldr r0, [r0, #8]
	cmp r0, #0
	beq _0804FB1E
	str r0, [r4, #0x30]
_0804FB1E:
	ldr r0, [r4, #0x30]
	cmp r0, r3
	beq _0804FB56
	ldr r0, [r4, #0x2c]
	ldr r2, [r0, #0x10]
	cmp r2, #0
	beq _0804FB34
	adds r0, r4, #0
	adds r1, r3, #0
	bl _call_via_r2
_0804FB34:
	ldr r0, [r4, #0x2c]
	ldr r2, [r0, #0xc]
	cmp r2, #0
	beq _0804FB44
	ldr r1, [r4, #0x30]
	adds r0, r4, #0
	bl _call_via_r2
_0804FB44:
	ldr r0, _0804FB60  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0804FB56
	movs r0, #0x67
	bl m4aSongNumStart
_0804FB56:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804FB5C: .4byte gKeyStatusPtr
_0804FB60: .4byte gRAMChapterData

	THUMB_FUNC_END TargetSelection_HandleMoveInput

	THUMB_FUNC_START TargetSelection_HandleSelectInput
TargetSelection_HandleSelectInput: @ 0x0804FB64
	push {r4, lr}
	adds r2, r0, #0
	movs r4, #0
	ldr r0, _0804FB84  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0804FB88
	ldr r3, [r2, #0x38]
	cmp r3, #0
	bne _0804FBA8
	ldr r0, [r2, #0x2c]
	ldr r3, [r0, #0x14]
	b _0804FBA4
	.align 2, 0
_0804FB84: .4byte gKeyStatusPtr
_0804FB88:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0804FB96
	ldr r0, [r2, #0x2c]
	ldr r3, [r0, #0x18]
	b _0804FBA4
_0804FB96:
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0804FBB4
	ldr r0, [r2, #0x2c]
	ldr r3, [r0, #0x1c]
_0804FBA4:
	cmp r3, #0
	beq _0804FBB4
_0804FBA8:
	ldr r1, [r2, #0x30]
	adds r0, r2, #0
	bl _call_via_r3
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
_0804FBB4:
	adds r0, r4, #0
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END TargetSelection_HandleSelectInput

	THUMB_FUNC_START sub_804FBBC
sub_804FBBC: @ 0x0804FBBC
	push {lr}
	ldr r0, _0804FBD8  @ gUnknown_085B655C
	bl Proc_Find
	cmp r0, #0
	beq _0804FBD4
	adds r2, r0, #0
	adds r2, #0x34
	ldrb r1, [r2]
	movs r0, #0x40
	orrs r0, r1
	strb r0, [r2]
_0804FBD4:
	pop {r0}
	bx r0
	.align 2, 0
_0804FBD8: .4byte gUnknown_085B655C

	THUMB_FUNC_END sub_804FBBC

	THUMB_FUNC_START sub_804FBDC
sub_804FBDC: @ 0x0804FBDC
	push {lr}
	ldr r0, _0804FBF8  @ gUnknown_085B655C
	bl Proc_Find
	cmp r0, #0
	beq _0804FBF4
	adds r2, r0, #0
	adds r2, #0x34
	ldrb r1, [r2]
	movs r0, #0xbf
	ands r0, r1
	strb r0, [r2]
_0804FBF4:
	pop {r0}
	bx r0
	.align 2, 0
_0804FBF8: .4byte gUnknown_085B655C

	THUMB_FUNC_END sub_804FBDC

	THUMB_FUNC_START GetFarthestTargetIndex
GetFarthestTargetIndex: @ 0x0804FBFC
	push {r4, r5, r6, r7, lr}
	movs r7, #0
	ldr r5, _0804FC34  @ gUnknown_0203DDEC
	ldr r0, _0804FC38  @ gUnknown_0203E0EC
	ldr r0, [r0]
	cmp r7, r0
	bge _0804FC52
	ldr r1, _0804FC3C  @ gUnknown_0203DDE8
	mov ip, r1
	movs r2, #0
	ldrsh r6, [r1, r2]
	adds r4, r0, #0
_0804FC14:
	movs r0, #0
	ldrsb r0, [r5, r0]
	subs r2, r6, r0
	cmp r2, #0
	bge _0804FC20
	subs r2, r0, r6
_0804FC20:
	mov r0, ip
	movs r1, #2
	ldrsh r3, [r0, r1]
	movs r0, #1
	ldrsb r0, [r5, r0]
	subs r1, r3, r0
	cmp r1, #0
	blt _0804FC40
	adds r0, r2, r1
	b _0804FC44
	.align 2, 0
_0804FC34: .4byte gUnknown_0203DDEC
_0804FC38: .4byte gUnknown_0203E0EC
_0804FC3C: .4byte gUnknown_0203DDE8
_0804FC40:
	subs r0, r0, r3
	adds r0, r2, r0
_0804FC44:
	cmp r7, r0
	bge _0804FC4A
	adds r7, r0, #0
_0804FC4A:
	subs r4, #1
	adds r5, #0xc
	cmp r4, #0
	bne _0804FC14
_0804FC52:
	adds r0, r7, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END GetFarthestTargetIndex

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
