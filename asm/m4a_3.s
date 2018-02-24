	.INCLUDE "macro.inc"

	.SYNTAX unified

	THUMB_FUNC_START CgbSound
CgbSound: @ 0x080D0D30
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x1c
	ldr r0, _080D0D50 @ 0x03007FF0
	ldr r0, [r0]
	str r0, [sp, #4]
	ldrb r0, [r0, #0xa]
	cmp r0, #0
	beq _080D0D54
	subs r0, #1
	ldr r1, [sp, #4]
	strb r0, [r1, #0xa]
	b _080D0D5A
	.align 2, 0
_080D0D50: .4byte gUnknown_03007FF0
_080D0D54:
	movs r0, #0xe
	ldr r2, [sp, #4]
	strb r0, [r2, #0xa]
_080D0D5A:
	movs r6, #1
	ldr r0, [sp, #4]
	ldr r4, [r0, #0x1c]
_080D0D60:
	ldrb r1, [r4]
	movs r0, #0xc7
	ands r0, r1
	adds r2, r6, #1
	mov sl, r2
	movs r2, #0x40
	adds r2, r2, r4
	mov sb, r2
	cmp r0, #0
	bne _080D0D76
	b _080D1160
_080D0D76:
	cmp r6, #2
	beq _080D0DA8
	cmp r6, #2
	bgt _080D0D84
	cmp r6, #1
	beq _080D0D8A
	b _080D0DE0
_080D0D84:
	cmp r6, #3
	beq _080D0DC0
	b _080D0DE0
_080D0D8A:
	ldr r0, _080D0D9C @ 0x04000060
	str r0, [sp, #8]
	ldr r7, _080D0DA0 @ 0x04000062
	ldr r2, _080D0DA4 @ 0x04000063
	str r2, [sp, #0xc]
	adds r0, #4
	str r0, [sp, #0x10]
	adds r2, #2
	b _080D0DF0
	.align 2, 0
_080D0D9C: .4byte 0x04000060
_080D0DA0: .4byte 0x04000062
_080D0DA4: .4byte 0x04000063
_080D0DA8:
	ldr r0, _080D0DB4 @ 0x04000061
	str r0, [sp, #8]
	ldr r7, _080D0DB8 @ 0x04000068
	ldr r2, _080D0DBC @ 0x04000069
	b _080D0DE8
	.align 2, 0
_080D0DB4: .4byte 0x04000061
_080D0DB8: .4byte 0x04000068
_080D0DBC: .4byte 0x04000069
_080D0DC0:
	ldr r0, _080D0DD4 @ 0x04000070
	str r0, [sp, #8]
	ldr r7, _080D0DD8 @ 0x04000072
	ldr r2, _080D0DDC @ 0x04000073
	str r2, [sp, #0xc]
	adds r0, #4
	str r0, [sp, #0x10]
	adds r2, #2
	b _080D0DF0
	.align 2, 0
_080D0DD4: .4byte 0x04000070
_080D0DD8: .4byte 0x04000072
_080D0DDC: .4byte 0x04000073
_080D0DE0:
	ldr r0, _080D0E40 @ 0x04000071
	str r0, [sp, #8]
	ldr r7, _080D0E44 @ 0x04000078
	ldr r2, _080D0E48 @ 0x04000079
_080D0DE8:
	str r2, [sp, #0xc]
	adds r0, #0xb
	str r0, [sp, #0x10]
	adds r2, #4
_080D0DF0:
	str r2, [sp, #0x14]
	ldr r0, [sp, #4]
	ldrb r0, [r0, #0xa]
	str r0, [sp]
	ldr r2, [sp, #0xc]
	ldrb r0, [r2]
	mov r8, r0
	adds r2, r1, #0
	movs r0, #0x80
	ands r0, r2
	cmp r0, #0
	beq _080D0EE6
	movs r3, #0x40
	adds r0, r3, #0
	ands r0, r2
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	adds r0, r6, #1
	mov sl, r0
	movs r1, #0x40
	adds r1, r1, r4
	mov sb, r1
	cmp r5, #0
	bne _080D0F0A
	movs r0, #3
	strb r0, [r4]
	strb r0, [r4, #0x1d]
	adds r0, r4, #0
	str r3, [sp, #0x18]
	bl CgbModVol
	ldr r3, [sp, #0x18]
	cmp r6, #2
	beq _080D0E58
	cmp r6, #2
	bgt _080D0E4C
	cmp r6, #1
	beq _080D0E52
	b _080D0EAC
	.align 2, 0
_080D0E40: .4byte 0x04000071
_080D0E44: .4byte 0x04000078
_080D0E48: .4byte 0x04000079
_080D0E4C:
	cmp r6, #3
	beq _080D0E64
	b _080D0EAC
_080D0E52:
	ldrb r0, [r4, #0x1f]
	ldr r2, [sp, #8]
	strb r0, [r2]
_080D0E58:
	ldr r0, [r4, #0x24]
	lsls r0, r0, #6
	ldrb r1, [r4, #0x1e]
	adds r0, r1, r0
	strb r0, [r7]
	b _080D0EB8
_080D0E64:
	ldr r1, [r4, #0x24]
	ldr r0, [r4, #0x28]
	cmp r1, r0
	beq _080D0E8C
	ldr r2, [sp, #8]
	strb r3, [r2]
	ldr r1, _080D0EA0 @ 0x04000090
	ldr r2, [r4, #0x24]
	ldr r0, [r2]
	str r0, [r1]
	adds r1, #4
	ldr r0, [r2, #4]
	str r0, [r1]
	adds r1, #4
	ldr r0, [r2, #8]
	str r0, [r1]
	adds r1, #4
	ldr r0, [r2, #0xc]
	str r0, [r1]
	str r2, [r4, #0x28]
_080D0E8C:
	ldr r0, [sp, #8]
	strb r5, [r0]
	ldrb r0, [r4, #0x1e]
	strb r0, [r7]
	ldrb r0, [r4, #0x1e]
	cmp r0, #0
	beq _080D0EA4
	movs r0, #0xc0
	b _080D0EC6
	.align 2, 0
_080D0EA0: .4byte 0x04000090
_080D0EA4:
	movs r1, #0x80
	rsbs r1, r1, #0
	strb r1, [r4, #0x1a]
	b _080D0EC8
_080D0EAC:
	ldrb r0, [r4, #0x1e]
	strb r0, [r7]
	ldr r0, [r4, #0x24]
	lsls r0, r0, #3
	ldr r2, [sp, #0x10]
	strb r0, [r2]
_080D0EB8:
	ldrb r0, [r4, #4]
	adds r0, #8
	mov r8, r0
	ldrb r0, [r4, #0x1e]
	cmp r0, #0
	beq _080D0EC6
	movs r0, #0x40
_080D0EC6:
	strb r0, [r4, #0x1a]
_080D0EC8:
	ldrb r1, [r4, #4]
	movs r2, #0
	strb r1, [r4, #0xb]
	movs r0, #0xff
	ands r0, r1
	adds r1, r6, #1
	mov sl, r1
	movs r1, #0x40
	adds r1, r1, r4
	mov sb, r1
	cmp r0, #0
	bne _080D0EE2
	b _080D101E
_080D0EE2:
	strb r2, [r4, #9]
	b _080D104C
_080D0EE6:
	movs r0, #4
	ands r0, r2
	cmp r0, #0
	beq _080D0F18
	ldrb r0, [r4, #0xd]
	subs r0, #1
	strb r0, [r4, #0xd]
	movs r2, #0xff
	ands r0, r2
	lsls r0, r0, #0x18
	adds r1, r6, #1
	mov sl, r1
	movs r2, #0x40
	adds r2, r2, r4
	mov sb, r2
	cmp r0, #0
	ble _080D0F0A
	b _080D105E
_080D0F0A:
	lsls r0, r6, #0x18
	lsrs r0, r0, #0x18
	bl CgbOscOff
	movs r0, #0
	strb r0, [r4]
	b _080D115C
_080D0F18:
	movs r0, #0x40
	ands r0, r1
	adds r2, r6, #1
	mov sl, r2
	movs r2, #0x40
	adds r2, r2, r4
	mov sb, r2
	cmp r0, #0
	beq _080D0F58
	movs r0, #3
	ands r0, r1
	cmp r0, #0
	beq _080D0F58
	movs r0, #0xfc
	ands r0, r1
	movs r2, #0
	strb r0, [r4]
	ldrb r1, [r4, #7]
	strb r1, [r4, #0xb]
	movs r0, #0xff
	ands r0, r1
	cmp r0, #0
	beq _080D0F8A
	movs r0, #1
	ldrb r1, [r4, #0x1d]
	orrs r0, r1
	strb r0, [r4, #0x1d]
	cmp r6, #3
	beq _080D104C
	ldrb r2, [r4, #7]
	mov r8, r2
	b _080D104C
_080D0F58:
	ldrb r0, [r4, #0xb]
	cmp r0, #0
	bne _080D104C
	cmp r6, #3
	bne _080D0F6A
	movs r0, #1
	ldrb r1, [r4, #0x1d]
	orrs r0, r1
	strb r0, [r4, #0x1d]
_080D0F6A:
	adds r0, r4, #0
	bl CgbModVol
	movs r0, #3
	ldrb r2, [r4]
	ands r0, r2
	cmp r0, #0
	bne _080D0FBE
	ldrb r0, [r4, #9]
	subs r0, #1
	strb r0, [r4, #9]
	movs r1, #0xff
	ands r0, r1
	lsls r0, r0, #0x18
	cmp r0, #0
	bgt _080D0FBA
_080D0F8A:
	ldrb r2, [r4, #0xc]
	ldrb r1, [r4, #0xa]
	adds r0, r2, #0
	muls r0, r1, r0
	adds r0, #0xff
	asrs r0, r0, #8
	movs r1, #0
	strb r0, [r4, #9]
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080D0F0A
	movs r0, #4
	ldrb r2, [r4]
	orrs r0, r2
	strb r0, [r4]
	movs r0, #1
	ldrb r1, [r4, #0x1d]
	orrs r0, r1
	strb r0, [r4, #0x1d]
	cmp r6, #3
	beq _080D105E
	movs r2, #8
	mov r8, r2
	b _080D105E
_080D0FBA:
	ldrb r0, [r4, #7]
	b _080D104A
_080D0FBE:
	cmp r0, #1
	bne _080D0FCA
_080D0FC2:
	ldrb r0, [r4, #0x19]
	strb r0, [r4, #9]
	movs r0, #7
	b _080D104A
_080D0FCA:
	cmp r0, #2
	bne _080D100E
	ldrb r0, [r4, #9]
	subs r0, #1
	strb r0, [r4, #9]
	movs r1, #0xff
	ands r0, r1
	lsls r0, r0, #0x18
	ldrb r2, [r4, #0x19]
	lsls r1, r2, #0x18
	cmp r0, r1
	bgt _080D100A
_080D0FE2:
	ldrb r0, [r4, #6]
	cmp r0, #0
	bne _080D0FF2
	movs r0, #0xfc
	ldrb r1, [r4]
	ands r0, r1
	strb r0, [r4]
	b _080D0F8A
_080D0FF2:
	ldrb r0, [r4]
	subs r0, #1
	strb r0, [r4]
	movs r0, #1
	ldrb r2, [r4, #0x1d]
	orrs r0, r2
	strb r0, [r4, #0x1d]
	cmp r6, #3
	beq _080D0FC2
	movs r0, #8
	mov r8, r0
	b _080D0FC2
_080D100A:
	ldrb r0, [r4, #5]
	b _080D104A
_080D100E:
	ldrb r0, [r4, #9]
	adds r0, #1
	strb r0, [r4, #9]
	movs r1, #0xff
	ands r0, r1
	ldrb r2, [r4, #0xa]
	cmp r0, r2
	blo _080D1048
_080D101E:
	ldrb r0, [r4]
	subs r0, #1
	movs r2, #0
	strb r0, [r4]
	ldrb r1, [r4, #5]
	strb r1, [r4, #0xb]
	movs r0, #0xff
	ands r0, r1
	cmp r0, #0
	beq _080D0FE2
	movs r0, #1
	ldrb r1, [r4, #0x1d]
	orrs r0, r1
	strb r0, [r4, #0x1d]
	ldrb r0, [r4, #0xa]
	strb r0, [r4, #9]
	cmp r6, #3
	beq _080D104C
	ldrb r2, [r4, #5]
	mov r8, r2
	b _080D104C
_080D1048:
	ldrb r0, [r4, #4]
_080D104A:
	strb r0, [r4, #0xb]
_080D104C:
	ldrb r0, [r4, #0xb]
	subs r0, #1
	strb r0, [r4, #0xb]
	ldr r0, [sp]
	cmp r0, #0
	bne _080D105E
	subs r0, #1
	str r0, [sp]
	b _080D0F58
_080D105E:
	movs r0, #2
	ldrb r1, [r4, #0x1d]
	ands r0, r1
	cmp r0, #0
	beq _080D10D6
	cmp r6, #3
	bgt _080D109E
	movs r0, #8
	ldrb r2, [r4, #1]
	ands r0, r2
	cmp r0, #0
	beq _080D109E
	ldr r0, _080D1088 @ 0x04000089
	ldrb r0, [r0]
	cmp r0, #0x3f
	bgt _080D1090
	ldr r0, [r4, #0x20]
	adds r0, #2
	ldr r1, _080D108C @ 0x000007FC
	b _080D109A
	.align 2, 0
_080D1088: .4byte 0x04000089
_080D108C: .4byte 0x000007FC
_080D1090:
	cmp r0, #0x7f
	bgt _080D109E
	ldr r0, [r4, #0x20]
	adds r0, #1
	ldr r1, _080D10AC @ 0x000007FE
_080D109A:
	ands r0, r1
	str r0, [r4, #0x20]
_080D109E:
	cmp r6, #4
	beq _080D10B0
	ldr r0, [r4, #0x20]
	ldr r1, [sp, #0x10]
	strb r0, [r1]
	b _080D10BE
	.align 2, 0
_080D10AC: .4byte 0x000007FE
_080D10B0:
	ldr r2, [sp, #0x10]
	ldrb r0, [r2]
	movs r1, #8
	ands r1, r0
	ldr r0, [r4, #0x20]
	orrs r0, r1
	strb r0, [r2]
_080D10BE:
	movs r0, #0xc0
	ldrb r1, [r4, #0x1a]
	ands r0, r1
	adds r1, r4, #0
	adds r1, #0x21
	ldrb r1, [r1]
	adds r0, r1, r0
	strb r0, [r4, #0x1a]
	movs r2, #0xff
	ands r0, r2
	ldr r1, [sp, #0x14]
	strb r0, [r1]
_080D10D6:
	movs r0, #1
	ldrb r2, [r4, #0x1d]
	ands r0, r2
	cmp r0, #0
	beq _080D115C
	ldr r1, _080D1120 @ 0x04000081
	ldrb r0, [r1]
	ldrb r2, [r4, #0x1c]
	bics r0, r2
	ldrb r2, [r4, #0x1b]
	orrs r0, r2
	strb r0, [r1]
	cmp r6, #3
	bne _080D1128
	ldr r0, _080D1124 @ 0x082073F4
	ldrb r1, [r4, #9]
	adds r0, r1, r0
	ldrb r0, [r0]
	ldr r2, [sp, #0xc]
	strb r0, [r2]
	movs r1, #0x80
	adds r0, r1, #0
	ldrb r2, [r4, #0x1a]
	ands r0, r2
	cmp r0, #0
	beq _080D115C
	ldr r0, [sp, #8]
	strb r1, [r0]
	ldrb r0, [r4, #0x1a]
	ldr r1, [sp, #0x14]
	strb r0, [r1]
	movs r0, #0x7f
	ldrb r2, [r4, #0x1a]
	ands r0, r2
	strb r0, [r4, #0x1a]
	b _080D115C
	.align 2, 0
_080D1120: .4byte 0x04000081
_080D1124: .4byte gUnknown_082073F4
_080D1128:
	movs r0, #0xf
	mov r1, r8
	ands r1, r0
	mov r8, r1
	ldrb r2, [r4, #9]
	lsls r0, r2, #4
	add r0, r8
	ldr r1, [sp, #0xc]
	strb r0, [r1]
	movs r2, #0x80
	ldrb r0, [r4, #0x1a]
	orrs r0, r2
	ldr r1, [sp, #0x14]
	strb r0, [r1]
	cmp r6, #1
	bne _080D115C
	ldr r0, [sp, #8]
	ldrb r1, [r0]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	bne _080D115C
	ldrb r0, [r4, #0x1a]
	orrs r0, r2
	ldr r1, [sp, #0x14]
	strb r0, [r1]
_080D115C:
	movs r0, #0
	strb r0, [r4, #0x1d]
_080D1160:
	mov r6, sl
	mov r4, sb
	cmp r6, #4
	bgt _080D116A
	b _080D0D60
_080D116A:
	add sp, #0x1c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

    .align 2, 0
