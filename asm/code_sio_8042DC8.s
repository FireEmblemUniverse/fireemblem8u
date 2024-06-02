	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	THUMB_FUNC_START GetTacticianTextConf
GetTacticianTextConf: @ 0x08044550
	lsls r0, r0, #0x10
	asrs r0, r0, #0xa
	ldr r1, _0804455C  @ gTacticianTextConf
	adds r0, r0, r1
	bx lr
	.align 2, 0
_0804455C: .4byte gTacticianTextConf

	THUMB_FUNC_END GetTacticianTextConf

	THUMB_FUNC_START sub_8044560
sub_8044560: @ 0x08044560
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	mov sl, r0
	mov r9, r1
	movs r0, #0
	str r0, [sp]
	ldrb r0, [r1]
	cmp r0, #0
	beq _08044602
_0804457A:
	movs r1, #0
	mov r8, r1
	mov r3, r9
	adds r3, #2
	str r3, [sp, #8]
_08044584:
	mov r5, r8
	lsls r0, r5, #0x10
	asrs r0, r0, #0x10
	bl GetTacticianTextConf
	str r0, [sp, #4]
	movs r7, #0
	mov r6, r8
	ldr r0, _080445D8  @ 0x00003FFF
	ands r6, r0
	movs r1, #0
	mov ip, r1
_0804459C:
	movs r4, #0
	mov r3, r9
	ldrh r3, [r3]
	str r3, [sp, #0xc]
	ldr r2, [sp, #4]
	add r2, ip
	adds r0, r7, #0
	movs r5, #3
	ands r0, r5
	lsls r1, r0, #0xe
	orrs r1, r6
	ldr r3, [sp]
	lsls r0, r3, #1
	adds r0, #0x4c
	mov r5, sl
	adds r3, r0, r5
_080445BC:
	ldr r0, [r2]
	ldrh r0, [r0]
	ldr r5, [sp, #0xc]
	cmp r0, r5
	bne _080445DC
	strh r1, [r3]
	mov r0, sl
	adds r0, #0x39
	strb r4, [r0]
	ldr r0, [sp]
	adds r0, #1
	str r0, [sp]
	b _080445F8
	.align 2, 0
_080445D8: .4byte 0x00003FFF
_080445DC:
	adds r2, #4
	adds r4, #1
	cmp r4, #2
	ble _080445BC
	movs r1, #0xc
	add ip, r1
	adds r7, #1
	cmp r7, #2
	ble _0804459C
	movs r3, #1
	add r8, r3
	mov r5, r8
	cmp r5, #0x50
	ble _08044584
_080445F8:
	ldr r0, [sp, #8]
	mov r9, r0
	ldrb r0, [r0]
	cmp r0, #0
	bne _0804457A
_08044602:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8044560

.align 2, 0
