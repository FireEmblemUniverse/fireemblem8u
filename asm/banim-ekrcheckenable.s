	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	THUMB_FUNC_START sub_8057CAC
sub_8057CAC: @ 0x08057CAC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	adds r5, r0, #0
	adds r4, r1, #0
	mov r9, r3
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	mov r8, r2
	movs r0, #0
	mov sl, r0
	cmp r4, #0
	beq _08057CE2
	mov r0, r8
	bl GetItemType
	cmp r0, #9
	bne _08057CEC
	mov r0, r8
	bl IsItemDisplayedInBattle
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _08057CEC
_08057CE2:
	ldr r0, _08057CE8  @ 0x0000FFFF
	b _08057D98
	.align 2, 0
_08057CE8: .4byte 0x0000FFFF
_08057CEC:
	mov r1, r8
	cmp r1, #0
	bne _08057CF6
	movs r3, #9
	b _08057D00
_08057CF6:
	mov r0, r8
	bl GetItemType
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
_08057D00:
	str r4, [sp]
	ldr r2, [r5]
	ldr r1, [r5, #4]
	ldr r0, [r2, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	lsrs r0, r0, #8
	movs r1, #1
	ands r0, r1
	adds r2, #0x25
	adds r2, r2, r0
	ldrb r0, [r2]
	cmp r0, #0
	beq _08057D26
	ldr r1, _08057D38  @ gUnknown_088AF834
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	str r0, [sp]
_08057D26:
	movs r0, #0
	mov r2, r9
	str r0, [r2]
	movs r7, #0
	movs r1, #0
_08057D30:
	ldr r5, [sp]
	movs r6, #0
	b _08057D80
	.align 2, 0
_08057D38: .4byte gUnknown_088AF834
_08057D3C:
	cmp r7, #0
	bne _08057D44
	cmp r0, #0xff
	bhi _08057D7C
_08057D44:
	cmp r7, #1
	bne _08057D4E
	ldrh r0, [r5]
	cmp r0, #0xff
	bls _08057D7C
_08057D4E:
	ldrh r4, [r5]
	mov r0, r8
	str r1, [sp, #4]
	str r3, [sp, #8]
	bl GetItemIndex
	ldr r1, [sp, #4]
	ldr r3, [sp, #8]
	cmp r4, r0
	beq _08057D6C
	ldrh r0, [r5]
	ldr r2, _08057D78  @ 0xFFFFFF00
	adds r0, r0, r2
	cmp r0, r3
	bne _08057D7C
_08057D6C:
	ldrh r5, [r5, #2]
	mov sl, r5
	mov r0, r9
	str r6, [r0]
	movs r1, #1
	b _08057D86
	.align 2, 0
_08057D78: .4byte 0xFFFFFF00
_08057D7C:
	adds r5, #4
	adds r6, #1
_08057D80:
	ldrh r0, [r5]
	cmp r0, #0
	bne _08057D3C
_08057D86:
	cmp r1, #1
	beq _08057D90
	adds r7, #1
	cmp r7, #1
	ble _08057D30
_08057D90:
	mov r0, sl
	subs r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
_08057D98:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8057CAC

.align 2, 0
