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
	.byte 0x00, 0x00, 0x10, 0xB5, 0x02, 0x1C
	.byte 0x09, 0x04, 0x09, 0x0C, 0x53, 0x6B, 0x06, 0x48, 0x83, 0x42, 0x05, 0xD1, 0xD1, 0x83, 0x94, 0x8B
	.byte 0x08, 0x1C, 0x60, 0x43, 0x00, 0x12, 0x10, 0x84, 0x10, 0xBC, 0x01, 0xBC, 0x00, 0x47, 0x00, 0x00
	.byte 0x53, 0x6D, 0x73, 0x68

	THUMB_FUNC_START m4aMPlayVolumeControl
m4aMPlayVolumeControl: @ 0x080D11A4
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r4, r0, #0
	lsls r1, r1, #0x10
	lsrs r7, r1, #0x10
	lsls r6, r2, #0x10
	ldr r3, [r4, #0x34]
	ldr r0, _080D1208 @ 0x68736D53
	cmp r3, r0
	bne _080D11FC
	adds r0, r3, #1
	str r0, [r4, #0x34]
	ldrb r2, [r4, #8]
	ldr r1, [r4, #0x2c]
	movs r5, #1
	cmp r2, #0
	ble _080D11F8
	movs r0, #0x80
	mov r8, r0
	lsrs r6, r6, #0x12
	movs r0, #3
	mov ip, r0
_080D11D4:
	adds r0, r7, #0
	ands r0, r5
	cmp r0, #0
	beq _080D11EE
	ldrb r3, [r1]
	mov r0, r8
	ands r0, r3
	cmp r0, #0
	beq _080D11EE
	strb r6, [r1, #0x13]
	mov r0, ip
	orrs r0, r3
	strb r0, [r1]
_080D11EE:
	subs r2, #1
	adds r1, #0x50
	lsls r5, r5, #1
	cmp r2, #0
	bgt _080D11D4
_080D11F8:
	ldr r0, _080D1208 @ 0x68736D53
	str r0, [r4, #0x34]
_080D11FC:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080D1208: .4byte 0x68736D53
	.byte 0xF0, 0xB5, 0x57, 0x46
	.byte 0x4E, 0x46, 0x45, 0x46, 0xE0, 0xB4, 0x04, 0x1C, 0x09, 0x04, 0x09, 0x0C, 0x8C, 0x46, 0x12, 0x04
	.byte 0x16, 0x0C, 0x63, 0x6B, 0x15, 0x48, 0x83, 0x42, 0x21, 0xD1, 0x58, 0x1C, 0x60, 0x63, 0x22, 0x7A
	.byte 0xE3, 0x6A, 0x01, 0x25, 0x00, 0x2A, 0x18, 0xDD, 0x80, 0x20, 0x81, 0x46, 0x30, 0x04, 0x07, 0x16
	.byte 0x0C, 0x20, 0x80, 0x46, 0x60, 0x46, 0x28, 0x40, 0x00, 0x28, 0x09, 0xD0, 0x19, 0x78, 0x48, 0x46
	.byte 0x08, 0x40, 0x00, 0x28, 0x04, 0xD0, 0xDF, 0x72, 0x5E, 0x73, 0x40, 0x46, 0x08, 0x43, 0x18, 0x70
	.byte 0x01, 0x3A, 0x50, 0x33, 0x6D, 0x00, 0x00, 0x2A, 0xEC, 0xDC, 0x04, 0x48, 0x60, 0x63, 0x38, 0xBC
	.byte 0x98, 0x46, 0xA1, 0x46, 0xAA, 0x46, 0xF0, 0xBC, 0x01, 0xBC, 0x00, 0x47, 0x53, 0x6D, 0x73, 0x68

	THUMB_FUNC_START m4aMPlayPanpotControl
m4aMPlayPanpotControl: @ 0x080D1280
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r4, r0, #0
	lsls r1, r1, #0x10
	lsrs r7, r1, #0x10
	lsls r2, r2, #0x18
	lsrs r6, r2, #0x18
	ldr r3, [r4, #0x34]
	ldr r0, _080D12E4 @ 0x68736D53
	cmp r3, r0
	bne _080D12D8
	adds r0, r3, #1
	str r0, [r4, #0x34]
	ldrb r2, [r4, #8]
	ldr r1, [r4, #0x2c]
	movs r5, #1
	cmp r2, #0
	ble _080D12D4
	movs r0, #0x80
	mov r8, r0
	movs r0, #3
	mov ip, r0
_080D12B0:
	adds r0, r7, #0
	ands r0, r5
	cmp r0, #0
	beq _080D12CA
	ldrb r3, [r1]
	mov r0, r8
	ands r0, r3
	cmp r0, #0
	beq _080D12CA
	strb r6, [r1, #0x15]
	mov r0, ip
	orrs r0, r3
	strb r0, [r1]
_080D12CA:
	subs r2, #1
	adds r1, #0x50
	lsls r5, r5, #1
	cmp r2, #0
	bgt _080D12B0
_080D12D4:
	ldr r0, _080D12E4 @ 0x68736D53
	str r0, [r4, #0x34]
_080D12D8:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080D12E4: .4byte 0x68736D53

	THUMB_FUNC_START ClearModM
ClearModM: @ 0x080D12E8
	adds r1, r0, #0
	movs r2, #0
	movs r0, #0
	strb r0, [r1, #0x1a]
	strb r0, [r1, #0x16]
	ldrb r0, [r1, #0x18]
	cmp r0, #0
	bne _080D12FC
	movs r0, #0xc
	b _080D12FE
_080D12FC:
	movs r0, #3
_080D12FE:
	ldrb r2, [r1]
	orrs r0, r2
	strb r0, [r1]
	bx lr
	.byte 0x00, 0x00, 0xF0, 0xB5, 0x57, 0x46, 0x4E, 0x46, 0x45, 0x46
	.byte 0xE0, 0xB4, 0x06, 0x1C, 0x09, 0x04, 0x09, 0x0C, 0x8A, 0x46, 0x12, 0x06, 0x12, 0x0E, 0x90, 0x46
	.byte 0x71, 0x6B, 0x15, 0x48, 0x81, 0x42, 0x1F, 0xD1, 0x48, 0x1C, 0x70, 0x63, 0x35, 0x7A, 0xF4, 0x6A
	.byte 0x01, 0x27, 0x00, 0x2D, 0x16, 0xDD, 0xC1, 0x46, 0x50, 0x46, 0x38, 0x40, 0x00, 0x28, 0x0C, 0xD0
	.byte 0x80, 0x20, 0x21, 0x78, 0x08, 0x40, 0x00, 0x28, 0x07, 0xD0, 0x40, 0x46, 0xE0, 0x75, 0x49, 0x46
	.byte 0x00, 0x29, 0x02, 0xD1, 0x20, 0x1C, 0xFF, 0xF7, 0xC7, 0xFF, 0x01, 0x3D, 0x50, 0x34, 0x7F, 0x00
	.byte 0x00, 0x2D, 0xE9, 0xDC, 0x04, 0x48, 0x70, 0x63, 0x38, 0xBC, 0x98, 0x46, 0xA1, 0x46, 0xAA, 0x46
	.byte 0xF0, 0xBC, 0x01, 0xBC, 0x00, 0x47, 0x00, 0x00, 0x53, 0x6D, 0x73, 0x68, 0xF0, 0xB5, 0x57, 0x46
	.byte 0x4E, 0x46, 0x45, 0x46, 0xE0, 0xB4, 0x06, 0x1C, 0x09, 0x04, 0x09, 0x0C, 0x8A, 0x46, 0x12, 0x06
	.byte 0x12, 0x0E, 0x90, 0x46, 0x71, 0x6B, 0x15, 0x48, 0x81, 0x42, 0x1F, 0xD1, 0x48, 0x1C, 0x70, 0x63
	.byte 0x35, 0x7A, 0xF4, 0x6A, 0x01, 0x27, 0x00, 0x2D, 0x16, 0xDD, 0xC1, 0x46, 0x50, 0x46, 0x38, 0x40
	.byte 0x00, 0x28, 0x0C, 0xD0, 0x80, 0x20, 0x21, 0x78, 0x08, 0x40, 0x00, 0x28, 0x07, 0xD0, 0x40, 0x46
	.byte 0x60, 0x76, 0x49, 0x46, 0x00, 0x29, 0x02, 0xD1, 0x20, 0x1C, 0xFF, 0xF7, 0x8D, 0xFF, 0x01, 0x3D
	.byte 0x50, 0x34, 0x7F, 0x00, 0x00, 0x2D, 0xE9, 0xDC, 0x04, 0x48, 0x70, 0x63, 0x38, 0xBC, 0x98, 0x46
	.byte 0xA1, 0x46, 0xAA, 0x46, 0xF0, 0xBC, 0x01, 0xBC, 0x00, 0x47, 0x00, 0x00, 0x53, 0x6D, 0x73, 0x68

	THUMB_FUNC_START ply_memacc
ply_memacc: @ 0x080D13F0
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r6, r1, #0
	ldr r1, [r6, #0x40]
	ldrb r5, [r1]
	adds r2, r1, #1
	str r2, [r6, #0x40]
	ldr r0, [r4, #0x18]
	ldrb r1, [r1, #1]
	adds r3, r1, r0
	adds r0, r2, #1
	str r0, [r6, #0x40]
	ldrb r2, [r2, #1]
	adds r0, #1
	str r0, [r6, #0x40]
	cmp r5, #0x11
	bls _080D1414
	b _080D1542
_080D1414:
	lsls r0, r5, #2
	ldr r1, _080D1420 @ _080D1424
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080D1420: .4byte _080D1424
_080D1424: @ jump table
	.4byte _080D146C @ case 0
	.4byte _080D1470 @ case 1
	.4byte _080D1478 @ case 2
	.4byte _080D1480 @ case 3
	.4byte _080D148A @ case 4
	.4byte _080D1498 @ case 5
	.4byte _080D14A6 @ case 6
	.4byte _080D14AE @ case 7
	.4byte _080D14B6 @ case 8
	.4byte _080D14BE @ case 9
	.4byte _080D14C6 @ case 10
	.4byte _080D14CE @ case 11
	.4byte _080D14D6 @ case 12
	.4byte _080D14E4 @ case 13
	.4byte _080D14F2 @ case 14
	.4byte _080D1500 @ case 15
	.4byte _080D150E @ case 16
	.4byte _080D151C @ case 17
_080D146C:
	strb r2, [r3]
	b _080D1542
_080D1470:
	ldrb r1, [r3]
	adds r0, r1, r2
	strb r0, [r3]
	b _080D1542
_080D1478:
	ldrb r1, [r3]
	subs r0, r1, r2
	strb r0, [r3]
	b _080D1542
_080D1480:
	ldr r0, [r4, #0x18]
	adds r0, r0, r2
	ldrb r0, [r0]
	strb r0, [r3]
	b _080D1542
_080D148A:
	ldr r0, [r4, #0x18]
	adds r0, r0, r2
	ldrb r1, [r3]
	ldrb r0, [r0]
	adds r0, r1, r0
	strb r0, [r3]
	b _080D1542
_080D1498:
	ldr r0, [r4, #0x18]
	adds r0, r0, r2
	ldrb r1, [r3]
	ldrb r0, [r0]
	subs r0, r1, r0
	strb r0, [r3]
	b _080D1542
_080D14A6:
	ldrb r3, [r3]
	cmp r3, r2
	beq _080D1528
	b _080D153C
_080D14AE:
	ldrb r3, [r3]
	cmp r3, r2
	bne _080D1528
	b _080D153C
_080D14B6:
	ldrb r3, [r3]
	cmp r3, r2
	bhi _080D1528
	b _080D153C
_080D14BE:
	ldrb r3, [r3]
	cmp r3, r2
	bhs _080D1528
	b _080D153C
_080D14C6:
	ldrb r3, [r3]
	cmp r3, r2
	bls _080D1528
	b _080D153C
_080D14CE:
	ldrb r3, [r3]
	cmp r3, r2
	blo _080D1528
	b _080D153C
_080D14D6:
	ldr r0, [r4, #0x18]
	adds r0, r0, r2
	ldrb r3, [r3]
	ldrb r0, [r0]
	cmp r3, r0
	beq _080D1528
	b _080D153C
_080D14E4:
	ldr r0, [r4, #0x18]
	adds r0, r0, r2
	ldrb r3, [r3]
	ldrb r0, [r0]
	cmp r3, r0
	bne _080D1528
	b _080D153C
_080D14F2:
	ldr r0, [r4, #0x18]
	adds r0, r0, r2
	ldrb r3, [r3]
	ldrb r0, [r0]
	cmp r3, r0
	bhi _080D1528
	b _080D153C
_080D1500:
	ldr r0, [r4, #0x18]
	adds r0, r0, r2
	ldrb r3, [r3]
	ldrb r0, [r0]
	cmp r3, r0
	bhs _080D1528
	b _080D153C
_080D150E:
	ldr r0, [r4, #0x18]
	adds r0, r0, r2
	ldrb r3, [r3]
	ldrb r0, [r0]
	cmp r3, r0
	bls _080D1528
	b _080D153C
_080D151C:
	ldr r0, [r4, #0x18]
	adds r0, r0, r2
	ldrb r3, [r3]
	ldrb r0, [r0]
	cmp r3, r0
	bhs _080D153C
_080D1528:
	ldr r0, _080D1538 @ 0x03006484
	ldr r2, [r0]
	adds r0, r4, #0
	adds r1, r6, #0
	bl _call_via_r2
	b _080D1542
	.align 2, 0
_080D1538: .4byte gUnknown_03006484
_080D153C:
	ldr r0, [r6, #0x40]
	adds r0, #4
	str r0, [r6, #0x40]
_080D1542:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_START ply_xcmd
ply_xcmd: @ 0x080D1548
	push {lr}
	ldr r2, [r1, #0x40]
	ldrb r3, [r2]
	adds r2, #1
	str r2, [r1, #0x40]
	ldr r2, _080D1564 @ 0x08207438
	lsls r3, r3, #2
	adds r3, r3, r2
	ldr r2, [r3]
	bl _call_via_r2
	pop {r0}
	bx r0
	.align 2, 0
_080D1564: .4byte gUnknown_08207438

	THUMB_FUNC_START ply_xxx
ply_xxx: @ 0x080D1568
	push {lr}
	ldr r2, _080D1578 @ 0x03006480
	ldr r2, [r2]
	bl _call_via_r2
	pop {r0}
	bx r0
	.align 2, 0
_080D1578: .4byte gMPlayJumpTable

	THUMB_FUNC_START ply_xwave
ply_xwave: @ 0x080D157C
	push {r4, lr}
	ldr r2, [r1, #0x40]
	ldr r0, _080D15B4 @ 0xFFFFFF00
	ands r4, r0
	ldrb r0, [r2]
	orrs r4, r0
	ldrb r0, [r2, #1]
	lsls r3, r0, #8
	ldr r0, _080D15B8 @ 0xFFFF00FF
	ands r4, r0
	orrs r4, r3
	ldrb r0, [r2, #2]
	lsls r3, r0, #0x10
	ldr r0, _080D15BC @ 0xFF00FFFF
	ands r4, r0
	orrs r4, r3
	ldrb r0, [r2, #3]
	lsls r3, r0, #0x18
	ldr r0, _080D15C0 @ 0x00FFFFFF
	ands r4, r0
	orrs r4, r3
	str r4, [r1, #0x28]
	adds r2, #4
	str r2, [r1, #0x40]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080D15B4: .4byte 0xFFFFFF00
_080D15B8: .4byte 0xFFFF00FF
_080D15BC: .4byte 0xFF00FFFF
_080D15C0: .4byte 0x00FFFFFF

	THUMB_FUNC_START ply_xtype
ply_xtype: @ 0x080D15C4
	ldr r0, [r1, #0x40]
	ldrb r2, [r0]
	adds r0, r1, #0
	adds r0, #0x24
	strb r2, [r0]
	ldr r0, [r1, #0x40]
	adds r0, #1
	str r0, [r1, #0x40]
	bx lr
	.byte 0x00, 0x00

	THUMB_FUNC_START ply_xatta
ply_xatta: @ 0x080D15D8
	ldr r0, [r1, #0x40]
	ldrb r2, [r0]
	adds r0, r1, #0
	adds r0, #0x2c
	strb r2, [r0]
	ldr r0, [r1, #0x40]
	adds r0, #1
	str r0, [r1, #0x40]
	bx lr
	.byte 0x00, 0x00

	THUMB_FUNC_START ply_xdeca
ply_xdeca: @ 0x080D15EC
	ldr r0, [r1, #0x40]
	ldrb r0, [r0]
	adds r2, r1, #0
	adds r2, #0x2d
	strb r0, [r2]
	ldr r0, [r1, #0x40]
	adds r0, #1
	str r0, [r1, #0x40]
	bx lr
	.byte 0x00, 0x00

	THUMB_FUNC_START ply_xsust
ply_xsust: @ 0x080D1600
	ldr r0, [r1, #0x40]
	ldrb r0, [r0]
	adds r2, r1, #0
	adds r2, #0x2e
	strb r0, [r2]
	ldr r0, [r1, #0x40]
	adds r0, #1
	str r0, [r1, #0x40]
	bx lr
	.byte 0x00, 0x00

	THUMB_FUNC_START ply_xrele
ply_xrele: @ 0x080D1614
	ldr r0, [r1, #0x40]
	ldrb r0, [r0]
	adds r2, r1, #0
	adds r2, #0x2f
	strb r0, [r2]
	ldr r0, [r1, #0x40]
	adds r0, #1
	str r0, [r1, #0x40]
	bx lr
	.byte 0x00, 0x00

	THUMB_FUNC_START ply_xiecv
ply_xiecv: @ 0x080D1628
	ldr r0, [r1, #0x40]
	ldrb r2, [r0]
	strb r2, [r1, #0x1e]
	adds r0, #1
	str r0, [r1, #0x40]
	bx lr

	THUMB_FUNC_START ply_xiecl
ply_xiecl: @ 0x080D1634
	ldr r0, [r1, #0x40]
	ldrb r2, [r0]
	strb r2, [r1, #0x1f]
	adds r0, #1
	str r0, [r1, #0x40]
	bx lr

	THUMB_FUNC_START ply_xleng
ply_xleng: @ 0x080D1640
	ldr r0, [r1, #0x40]
	ldrb r0, [r0]
	adds r2, r1, #0
	adds r2, #0x26
	strb r0, [r2]
	ldr r0, [r1, #0x40]
	adds r0, #1
	str r0, [r1, #0x40]
	bx lr
	.byte 0x00, 0x00

	THUMB_FUNC_START ply_xswee
ply_xswee: @ 0x080D1654
	ldr r0, [r1, #0x40]
	ldrb r0, [r0]
	adds r2, r1, #0
	adds r2, #0x27
	strb r0, [r2]
	ldr r0, [r1, #0x40]
	adds r0, #1
	str r0, [r1, #0x40]
	bx lr
	.byte 0x00, 0x00

	THUMB_FUNC_START DummyFunc
DummyFunc: @ 0x080D1668
	bx lr
	.byte 0x00, 0x00
