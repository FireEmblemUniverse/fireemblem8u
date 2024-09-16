	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	THUMB_FUNC_START sub_800AF64
sub_800AF64: @ 0x0800AF64
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xb0
	adds r7, r0, #0
	str r2, [sp, #0x88]
	movs r2, #0
	ldrsh r0, [r7, r2]
	str r0, [sp, #0x8c]
	ldr r3, [r7, #4]
	mov r9, r3
	ldr r4, [r7, #8]
	str r4, [sp, #0x90]
	ldr r0, [r7, #0xc]
	mov r8, r0
	ldr r2, [r7, #0x10]
	mov sl, r2
	add r0, sp, #0x80
	str r1, [r0]
	cmp r1, #0
	bne _0800AF98
	movs r3, #0
	str r3, [sp, #0x94]
	b _0800AFA0
_0800AF98:
	movs r4, #2
	ldrsh r0, [r7, r4]
	subs r0, #1
	str r0, [sp, #0x94]
_0800AFA0:
	mov r0, sp
	adds r0, #0x10
	str r0, [sp, #0xa4]
	ldrh r0, [r7, #2]
	add r2, sp, #0x34
	add r1, sp, #0xc
_0800AFAC:
	str r2, [r1]
	subs r2, #0xc
	subs r1, #4
	cmp r1, sp
	bge _0800AFAC
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _0800AFC2
	movs r0, #1
	negs r0, r0
	b _0800B15A
_0800AFC2:
	movs r2, #2
	ldrsh r1, [r7, r2]
	add r4, sp, #0x84
	mov r0, r9
	add r2, sp, #0x80
	adds r3, r4, #0
	bl sub_800A8D8
	ldr r1, [r4]
	cmp r1, #0
	bne _0800AFDC
	movs r3, #1
	b _0800AFEC
_0800AFDC:
	movs r4, #2
	ldrsh r0, [r7, r4]
	subs r0, #1
	movs r2, #0
	str r2, [sp, #0x98]
	cmp r1, r0
	bne _0800AFEE
	movs r3, #2
_0800AFEC:
	str r3, [sp, #0x98]
_0800AFEE:
	movs r6, #0
	ldrh r4, [r7]
	add r0, sp, #0xa8
	strh r4, [r0]
	mov r1, sp
	adds r1, #0x40
	str r1, [sp, #0xa0]
	add r2, sp, #0x18
	mov ip, r6
	add r5, sp, #0x14
	mov r3, sp
	adds r3, #0x84
	str r3, [sp, #0xac]
	ldr r4, [sp, #0x94]
	lsls r0, r4, #2
	ldr r1, [sp, #0x90]
	adds r0, r0, r1
	str r0, [sp, #0x9c]
_0800B012:
	ldr r3, [sp, #0xa4]
	add r3, ip
	add r4, sp, #0xa8
	ldrh r4, [r4]
	strh r4, [r3]
	ldr r1, [sp, #0xac]
	ldr r0, [r1]
	adds r0, r0, r6
	subs r1, r0, #1
	cmp r1, #0
	bgt _0800B048
	mov r4, r9
	ldrh r0, [r4]
	strh r0, [r3, #2]
	ldr r1, [sp, #0x90]
	ldr r0, [r1]
	str r0, [r5]
	mov r3, sl
	ldr r0, [r3]
	cmp r0, #0
	bne _0800B0AC
	ldr r4, _0800B044  @ gUnknown_08591AB4
	str r4, [r2]
	b _0800B0B4
	.align 2, 0
_0800B044: .4byte gUnknown_08591AB4
_0800B048:
	ldr r4, [sp, #0x94]
	cmp r1, r4
	blt _0800B076
	lsls r1, r4, #1
	mov r4, r9
	adds r0, r1, r4
	ldrh r0, [r0]
	strh r0, [r3, #2]
	ldr r3, [sp, #0x9c]
	ldr r0, [r3]
	str r0, [r5]
	mov r4, r8
	cmp r4, #0
	beq _0800B0B0
	adds r0, r1, r4
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r0, r0, #2
	add r0, sl
	ldr r0, [r0]
	cmp r0, #0
	bne _0800B0AC
	b _0800B0B0
_0800B076:
	lsls r0, r0, #1
	add r0, r9
	subs r0, #2
	ldrh r0, [r0]
	strh r0, [r3, #2]
	ldr r4, [sp, #0xac]
	ldr r0, [r4]
	adds r1, r0, r6
	lsls r0, r1, #2
	ldr r3, [sp, #0x90]
	adds r0, r0, r3
	subs r0, #4
	ldr r0, [r0]
	str r0, [r5]
	mov r4, r8
	cmp r4, #0
	beq _0800B0B0
	lsls r0, r1, #1
	add r0, r8
	subs r0, #2
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r0, r0, #2
	add r0, sl
	ldr r0, [r0]
	cmp r0, #0
	beq _0800B0B0
_0800B0AC:
	str r0, [r2]
	b _0800B0B4
_0800B0B0:
	ldr r3, _0800B0F4  @ gUnknown_08591AB4
	str r3, [r2]
_0800B0B4:
	adds r2, #0xc
	movs r4, #0xc
	add ip, r4
	adds r5, #0xc
	adds r6, #1
	cmp r6, #3
	ble _0800B012
	ldr r0, [sp]
	ldr r1, [sp, #0xa0]
	ldr r2, [sp, #0x98]
	bl sub_800A7D8
	movs r0, #2
	ldrsh r1, [r7, r0]
	ldr r2, [sp, #0x84]
	adds r0, r2, #1
	cmp r1, r0
	ble _0800B0F8
	lsls r1, r2, #1
	add r1, r9
	movs r2, #2
	ldrsh r0, [r1, r2]
	movs r3, #0
	ldrsh r2, [r1, r3]
	subs r0, r0, r2
	lsls r2, r2, #0xc
	ldr r1, [sp, #0x80]
	subs r1, r1, r2
	bl DivArm
	adds r5, r0, #0
	b _0800B106
	.align 2, 0
_0800B0F4: .4byte gUnknown_08591AB4
_0800B0F8:
	lsls r0, r2, #1
	add r0, r9
	movs r4, #0
	ldrsh r0, [r0, r4]
	lsls r0, r0, #0xc
	ldr r1, [sp, #0x80]
	subs r5, r1, r0
_0800B106:
	ldr r4, [sp, #0xa0]
	movs r6, #0
	ldr r0, [sp, #0x8c]
	cmp r6, r0
	bcs _0800B158
	movs r7, #0x80
	lsls r7, r7, #5
	ldr r1, [sp, #0x88]
	mov r8, r1
_0800B118:
	ldr r0, [r4]
	adds r1, r5, #0
	muls r1, r0, r1
	adds r0, r7, #0
	bl DivArm
	ldr r1, [r4, #4]
	adds r0, r0, r1
	adds r1, r5, #0
	muls r1, r0, r1
	adds r0, r7, #0
	bl DivArm
	ldr r1, [r4, #8]
	adds r0, r0, r1
	adds r1, r5, #0
	muls r1, r0, r1
	adds r0, r7, #0
	bl DivArm
	ldr r1, [r4, #0xc]
	adds r0, r0, r1
	mov r2, r8
	adds r2, #4
	mov r8, r2
	subs r2, #4
	stm r2!, {r0}
	adds r4, #0x10
	adds r6, #1
	ldr r3, [sp, #0x8c]
	cmp r6, r3
	bcc _0800B118
_0800B158:
	ldr r0, [sp, #0x84]
_0800B15A:
	add sp, #0xb0
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_800AF64

	.align 2, 0
