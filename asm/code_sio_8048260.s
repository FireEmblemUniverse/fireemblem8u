	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	THUMB_FUNC_START sub_804D9C4
sub_804D9C4: @ 0x0804D9C4
	adds r2, r0, #0
	movs r1, #0
	strb r1, [r2, #0x1e]
	strb r1, [r2, #0x18]
	strb r1, [r2, #0x1d]
	adds r3, r2, #0
	adds r3, #0x4a
	movs r0, #0xf
	strb r0, [r3]
	adds r0, r2, #0
	adds r0, #0x48
	strb r1, [r0]
	strh r1, [r2, #0x16]
	ldr r0, _0804D9F0  @ 0x04000134
	strh r1, [r0]
	ldr r2, _0804D9F4  @ 0x04000128
	ldr r3, _0804D9F8  @ 0x00002003
	adds r0, r3, #0
	strh r0, [r2]
	ldr r0, _0804D9FC  @ 0x0400012A
	strh r1, [r0]
	bx lr
	.align 2, 0
_0804D9F0: .4byte 0x04000134
_0804D9F4: .4byte 0x04000128
_0804D9F8: .4byte 0x00002003
_0804D9FC: .4byte 0x0400012A

	THUMB_FUNC_END sub_804D9C4

	THUMB_FUNC_START sub_804DA00
sub_804DA00: @ 0x0804DA00
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	adds r7, r0, #0
	bl sub_804DF24
	cmp r0, #0
	beq _0804DA16
	b _0804DDDE
_0804DA16:
	adds r0, r7, #0
	adds r0, #0x4a
	ldrb r1, [r0]
	mov sl, r0
	cmp r1, #0xf
	bls _0804DA2A
	subs r0, r1, #1
	mov r1, sl
	strb r0, [r1]
	b _0804DDDE
_0804DA2A:
	adds r1, r7, #0
	adds r1, #0x48
	ldrb r0, [r1]
	cmp r0, #0
	beq _0804DA54
	movs r0, #0
	strb r0, [r1]
	ldr r0, _0804DA50  @ 0x04000128
	ldrh r0, [r0]
	movs r5, #0xfc
	ands r5, r0
	cmp r5, #8
	beq _0804DA54
	adds r0, r7, #0
	bl sub_804D9C4
	movs r0, #8
	eors r0, r5
	b _0804DDE0
	.align 2, 0
_0804DA50: .4byte 0x04000128
_0804DA54:
	ldrb r0, [r7, #0x18]
	cmp r0, #0xdf
	bls _0804DAA6
	adds r0, r7, #0
	bl sub_804DF38
	adds r5, r0, #0
	cmp r5, #0
	beq _0804DA68
	b _0804DDE0
_0804DA68:
	adds r0, r7, #0
	adds r0, #0x4b
	ldrb r0, [r0]
	cmp r0, #1
	bne _0804DA84
	ldrb r0, [r7, #0x18]
	cmp r0, #0xe1
	bls _0804DA84
	adds r0, r7, #0
	bl sub_804DF24
	cmp r0, #0
	bne _0804DA84
	b _0804DDCE
_0804DA84:
	adds r0, r7, #0
	bl sub_804DF24
	cmp r0, #0
	beq _0804DA90
	b _0804DDDE
_0804DA90:
	ldrh r0, [r7, #0x16]
	cmp r0, #0
	bne _0804DAA0
	adds r0, r7, #0
	bl sub_804D9C4
	movs r0, #0x71
	b _0804DDE0
_0804DAA0:
	subs r0, #1
	strh r0, [r7, #0x16]
	b _0804DDDE
_0804DAA6:
	ldrb r0, [r7, #0x18]
	cmp r0, #2
	bne _0804DAAE
	b _0804DBE4
_0804DAAE:
	cmp r0, #2
	bgt _0804DABC
	cmp r0, #0
	beq _0804DACA
	cmp r0, #1
	beq _0804DB86
	b _0804DD1C
_0804DABC:
	cmp r0, #0xd0
	bne _0804DAC2
	b _0804DC30
_0804DAC2:
	cmp r0, #0xd1
	bne _0804DAC8
	b _0804DCCA
_0804DAC8:
	b _0804DD1C
_0804DACA:
	movs r3, #0xe
	movs r5, #3
	ldr r0, _0804DB10  @ 0x04000120
	ldrh r0, [r0, #6]
	adds r1, r0, #0
	ldr r0, _0804DB14  @ 0x0000FFFF
	ldrb r2, [r7, #0x1e]
	adds r6, r2, #0
	cmp r1, r0
	bne _0804DAF2
	adds r4, r1, #0
	ldr r1, _0804DB18  @ 0x04000126
_0804DAE2:
	asrs r3, r3, #1
	subs r1, #2
	subs r5, #1
	cmp r5, #0
	beq _0804DAF2
	ldrh r0, [r1]
	cmp r0, r4
	beq _0804DAE2
_0804DAF2:
	movs r0, #0xe
	ands r3, r0
	strb r3, [r7, #0x1d]
	movs r5, #3
	ldr r0, _0804DB10  @ 0x04000120
	ldrh r0, [r0, #6]
	adds r4, r0, #0
	asrs r0, r2, #3
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0804DB20
	ldr r0, _0804DB1C  @ 0x00007208
	b _0804DB46
	.align 2, 0
_0804DB10: .4byte 0x04000120
_0804DB14: .4byte 0x0000FFFF
_0804DB18: .4byte 0x04000126
_0804DB1C: .4byte 0x00007208
_0804DB20:
	subs r5, #1
	cmp r5, #0
	beq _0804DB4C
	lsls r0, r5, #1
	ldr r1, _0804DB74  @ 0x04000120
	adds r0, r0, r1
	ldrh r0, [r0]
	adds r4, r0, #0
	adds r0, r2, #0
	asrs r0, r5
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0804DB20
	adds r0, r1, #0
	lsls r0, r5
	movs r1, #0xe4
	lsls r1, r1, #7
	orrs r0, r1
_0804DB46:
	cmp r4, r0
	beq _0804DB20
	movs r3, #0
_0804DB4C:
	adds r0, r3, #0
	ands r0, r6
	strb r0, [r7, #0x1e]
	cmp r3, #0
	bne _0804DB5C
	movs r0, #0xf
	mov r2, sl
	strb r0, [r2]
_0804DB5C:
	mov r1, sl
	ldrb r0, [r1]
	cmp r0, #0
	bne _0804DB78
	ldrb r0, [r7, #0x1d]
	ldrb r2, [r7, #0x1e]
	cmp r0, r2
	beq _0804DB7E
	adds r0, r7, #0
	bl sub_804DE3C
	b _0804DB86
	.align 2, 0
_0804DB74: .4byte 0x04000120
_0804DB78:
	subs r0, #1
	mov r1, sl
	strb r0, [r1]
_0804DB7E:
	ldrb r1, [r7, #0x1e]
	movs r2, #0xc4
	lsls r2, r2, #7
	b _0804DC86
_0804DB86:
	adds r1, r7, #0
	adds r1, #0x49
	movs r0, #0
	strb r0, [r1]
	movs r5, #3
	mov ip, r1
	ldr r3, _0804DBDC  @ gUnknown_03001864
_0804DB94:
	lsls r0, r5, #1
	ldr r2, _0804DBE0  @ 0x04000120
	adds r0, r0, r2
	ldrh r0, [r0]
	adds r4, r0, #0
	asrs r0, r4, #8
	subs r2, r5, #1
	cmp r0, #0x72
	bne _0804DBBE
	lsls r0, r2, #1
	adds r0, r0, r3
	strh r4, [r0]
	movs r0, #0xff
	ands r4, r0
	movs r0, #1
	lsls r0, r5
	cmp r4, r0
	bne _0804DBBE
	ldrb r0, [r1]
	orrs r4, r0
	strb r4, [r1]
_0804DBBE:
	adds r5, r2, #0
	cmp r5, #0
	bne _0804DB94
	ldrb r0, [r7, #0x1d]
	mov r1, ip
	ldrb r1, [r1]
	cmp r0, r1
	bne _0804DB7E
	movs r0, #2
	strb r0, [r7, #0x18]
	mov r2, ip
	ldrb r1, [r2]
	movs r2, #0xc2
	lsls r2, r2, #7
	b _0804DC86
	.align 2, 0
_0804DBDC: .4byte gUnknown_03001864
_0804DBE0: .4byte 0x04000120
_0804DBE4:
	movs r5, #3
	movs r0, #0x49
	adds r0, r0, r7
	mov ip, r0
	mov r4, ip
	movs r6, #1
	ldr r1, _0804DC28  @ gUnknown_03001864
	mov r9, r1
	ldr r2, _0804DC2C  @ 0x04000120
	mov r8, r2
_0804DBF8:
	ldrb r3, [r4]
	adds r0, r3, #0
	asrs r0, r5
	ands r0, r6
	subs r2, r5, #1
	cmp r0, #0
	beq _0804DC1E
	lsls r0, r5, #1
	add r0, r8
	ldrh r1, [r0]
	lsls r0, r2, #1
	add r0, r9
	ldrh r0, [r0]
	cmp r1, r0
	beq _0804DC1E
	adds r0, r6, #0
	lsls r0, r5
	eors r3, r0
	strb r3, [r4]
_0804DC1E:
	adds r5, r2, #0
	cmp r5, #0
	bne _0804DBF8
	b _0804DD84
	.align 2, 0
_0804DC28: .4byte gUnknown_03001864
_0804DC2C: .4byte 0x04000120
_0804DC30:
	movs r3, #1
	movs r5, #3
	movs r0, #0x49
	adds r0, r0, r7
	mov ip, r0
	adds r6, r7, #0
	adds r6, #0x19
	ldr r1, _0804DC94  @ gUnknown_03001864
	mov r8, r1
_0804DC42:
	lsls r0, r5, #1
	ldr r2, _0804DC98  @ 0x04000120
	adds r0, r0, r2
	ldrh r0, [r0]
	adds r4, r0, #0
	subs r2, r5, #1
	adds r0, r6, r2
	strb r4, [r0]
	mov r0, ip
	ldrb r1, [r0]
	asrs r1, r5
	movs r0, #1
	ands r1, r0
	cmp r1, #0
	beq _0804DC76
	asrs r0, r4, #8
	subs r0, #0x72
	cmp r0, #1
	bls _0804DC6A
	b _0804DDD4
_0804DC6A:
	lsls r0, r2, #1
	add r0, r8
	ldrh r0, [r0]
	cmp r4, r0
	bne _0804DC76
	movs r3, #0
_0804DC76:
	adds r5, r2, #0
	cmp r5, #0
	bne _0804DC42
	cmp r3, #0
	bne _0804DC9C
	ldrb r1, [r7, #0x1c]
	movs r2, #0xc6
	lsls r2, r2, #7
_0804DC86:
	adds r0, r2, #0
	orrs r1, r0
	adds r0, r7, #0
	bl sub_804DDF0
	b _0804DDE0
	.align 2, 0
_0804DC94: .4byte gUnknown_03001864
_0804DC98: .4byte 0x04000120
_0804DC9C:
	movs r0, #0xd1
	strb r0, [r7, #0x18]
	movs r3, #0x11
	movs r5, #3
	adds r1, r6, #2
_0804DCA6:
	ldrb r0, [r1]
	adds r3, r3, r0
	subs r1, #1
	subs r5, #1
	cmp r5, #0
	bne _0804DCA6
	strb r3, [r7, #0x14]
	movs r0, #0xff
	ands r3, r0
	movs r1, #0xc8
	lsls r1, r1, #7
	adds r0, r1, #0
	orrs r3, r0
	adds r0, r7, #0
	adds r1, r3, #0
	bl sub_804DDF0
	b _0804DDE0
_0804DCCA:
	movs r5, #3
	movs r2, #0x49
	ldrb r1, [r2, r7]
	ldr r2, _0804DD08  @ 0x04000126
	movs r3, #1
_0804DCD4:
	ldrh r0, [r2]
	adds r4, r0, #0
	adds r0, r1, #0
	asrs r0, r5
	ands r0, r3
	cmp r0, #0
	beq _0804DCE8
	asrs r0, r4, #8
	cmp r0, #0x73
	bne _0804DDD4
_0804DCE8:
	subs r2, #2
	subs r5, #1
	cmp r5, #0
	bne _0804DCD4
	adds r0, r7, #0
	bl MultiBoot
	adds r5, r0, #0
	cmp r5, #0
	bne _0804DD0C
	movs r0, #0xe0
	strb r0, [r7, #0x18]
	adds r0, #0xb0
	strh r0, [r7, #0x16]
	b _0804DDDE
	.align 2, 0
_0804DD08: .4byte 0x04000126
_0804DD0C:
	adds r0, r7, #0
	bl sub_804D9C4
	movs r0, #0x1e
	mov r1, sl
	strb r0, [r1]
	movs r0, #0x70
	b _0804DDE0
_0804DD1C:
	movs r5, #3
	movs r2, #0x49
	adds r2, r2, r7
	mov ip, r2
	mov r8, ip
	movs r0, #1
	mov r9, r0
_0804DD2A:
	mov r1, r8
	ldrb r6, [r1]
	adds r0, r6, #0
	asrs r0, r5
	mov r2, r9
	ands r0, r2
	cmp r0, #0
	beq _0804DD64
	lsls r0, r5, #1
	ldr r1, _0804DD80  @ 0x04000120
	adds r0, r0, r1
	ldrh r0, [r0]
	adds r4, r0, #0
	asrs r2, r4, #8
	ldrb r0, [r7, #0x18]
	lsrs r0, r0, #1
	movs r1, #0x62
	subs r1, r1, r0
	mov r3, r9
	lsls r3, r5
	cmp r2, r1
	bne _0804DD5E
	movs r0, #0xff
	ands r4, r0
	cmp r4, r3
	beq _0804DD64
_0804DD5E:
	eors r6, r3
	mov r2, r8
	strb r6, [r2]
_0804DD64:
	subs r5, #1
	cmp r5, #0
	bne _0804DD2A
	ldrb r0, [r7, #0x18]
	cmp r0, #0xc4
	bne _0804DD84
	mov r0, ip
	ldrb r1, [r0]
	movs r0, #0xe
	ands r0, r1
	strb r0, [r7, #0x1e]
	strb r5, [r7, #0x18]
	b _0804DB7E
	.align 2, 0
_0804DD80: .4byte 0x04000120
_0804DD84:
	mov r1, ip
	ldrb r0, [r1]
	cmp r0, #0
	bne _0804DD96
	adds r0, r7, #0
	bl sub_804D9C4
	movs r0, #0x50
	b _0804DDE0
_0804DD96:
	ldrb r0, [r7, #0x18]
	adds r0, #2
	strb r0, [r7, #0x18]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xc4
	bne _0804DDA6
	b _0804DB7E
_0804DDA6:
	ldrb r0, [r7, #0x18]
	ldr r1, [r7, #0x28]
	adds r0, r0, r1
	subs r1, r0, #3
	ldrb r2, [r1]
	lsls r2, r2, #8
	subs r0, #4
	ldrb r1, [r0]
	orrs r1, r2
	adds r0, r7, #0
	bl sub_804DDF0
	adds r5, r0, #0
	cmp r5, #0
	bne _0804DDE0
	adds r0, r7, #0
	adds r0, #0x4b
	ldrb r0, [r0]
	cmp r0, #1
	bne _0804DDDE
_0804DDCE:
	bl sub_804E03C
	b _0804DA2A
_0804DDD4:
	adds r0, r7, #0
	bl sub_804D9C4
	movs r0, #0x60
	b _0804DDE0
_0804DDDE:
	movs r0, #0
_0804DDE0:
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_804DA00

	THUMB_FUNC_START sub_804DDF0
sub_804DDF0: @ 0x0804DDF0
	push {r4, lr}
	adds r2, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldr r3, _0804DE1C  @ 0x04000128
	ldrh r0, [r3]
	movs r4, #0x8c
	ands r4, r0
	cmp r4, #8
	bne _0804DE28
	ldr r0, _0804DE20  @ 0x0400012A
	strh r1, [r0]
	ldr r1, _0804DE24  @ 0x00002083
	adds r0, r1, #0
	strh r0, [r3]
	adds r1, r2, #0
	adds r1, #0x48
	movs r0, #1
	strb r0, [r1]
	movs r0, #0
	b _0804DE34
	.align 2, 0
_0804DE1C: .4byte 0x04000128
_0804DE20: .4byte 0x0400012A
_0804DE24: .4byte 0x00002083
_0804DE28:
	adds r0, r2, #0
	bl sub_804D9C4
	movs r0, #8
	eors r4, r0
	adds r0, r4, #0
_0804DE34:
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_804DDF0

	THUMB_FUNC_START sub_804DE3C
sub_804DE3C: @ 0x0804DE3C
	push {lr}
	adds r1, r0, #0
	ldrb r0, [r1, #0x18]
	cmp r0, #0
	beq _0804DE4E
	adds r0, r1, #0
	bl sub_804D9C4
	b _0804DE5A
_0804DE4E:
	adds r2, r1, #0
	adds r2, #0x4a
	strb r0, [r2]
	strb r0, [r1, #0x1e]
	movs r0, #1
	strb r0, [r1, #0x18]
_0804DE5A:
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_804DE3C

	THUMB_FUNC_START sub_804DE60
sub_804DE60: @ 0x0804DE60
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	ldr r0, [sp, #0x14]
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldrb r0, [r5, #0x18]
	cmp r0, #0
	bne _0804DE9A
	ldrb r0, [r5, #0x1e]
	cmp r0, #0
	beq _0804DE9A
	adds r0, r5, #0
	adds r0, #0x4a
	ldrb r0, [r0]
	cmp r0, #0
	bne _0804DE9A
	str r6, [r5, #0x20]
	adds r2, #0xf
	movs r0, #0x10
	negs r0, r0
	ands r2, r0
	subs r0, #0xf0
	adds r1, r2, r0
	ldr r0, _0804DEA4  @ 0x0003FF00
	cmp r1, r0
	bls _0804DEA8
_0804DE9A:
	adds r0, r5, #0
	bl sub_804D9C4
	b _0804DF1C
	.align 2, 0
_0804DEA4: .4byte 0x0003FF00
_0804DEA8:
	adds r0, r6, r2
	str r0, [r5, #0x24]
	lsls r1, r7, #0x18
	movs r2, #0x80
	lsls r2, r2, #0x13
	adds r0, r1, r2
	asrs r0, r0, #0x18
	adds r2, r1, #0
	cmp r0, #8
	bhi _0804DF08
	lsls r0, r0, #2
	ldr r1, _0804DEC8  @ _0804DECC
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0804DEC8: .4byte _0804DECC
_0804DECC: @ jump table
	.4byte _0804DEF0 @ case 0
	.4byte _0804DEF0 @ case 1
	.4byte _0804DEF0 @ case 2
	.4byte _0804DEF0 @ case 3
	.4byte _0804DEFA @ case 4
	.4byte _0804DF00 @ case 5
	.4byte _0804DF00 @ case 6
	.4byte _0804DF00 @ case 7
	.4byte _0804DF00 @ case 8
_0804DEF0:
	lsls r4, r3, #3
	asrs r1, r2, #0x18
	movs r0, #3
	subs r0, r0, r1
	b _0804DF06
_0804DEFA:
	movs r0, #0x38
	adds r4, r3, #0
	b _0804DF06
_0804DF00:
	lsls r4, r3, #3
	asrs r0, r2, #0x18
	subs r0, #1
_0804DF06:
	orrs r4, r0
_0804DF08:
	movs r0, #0x3f
	ands r4, r0
	lsls r0, r4, #1
	movs r2, #0x7f
	negs r2, r2
	adds r1, r2, #0
	orrs r0, r1
	strb r0, [r5, #0x1c]
	movs r0, #0xd0
	strb r0, [r5, #0x18]
_0804DF1C:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_804DE60

	THUMB_FUNC_START sub_804DF24
sub_804DF24: @ 0x0804DF24
	push {lr}
	ldrb r0, [r0, #0x18]
	cmp r0, #0xe9
	beq _0804DF30
	movs r0, #0
	b _0804DF32
_0804DF30:
	movs r0, #1
_0804DF32:
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_804DF24

	THUMB_FUNC_START sub_804DF38
sub_804DF38: @ 0x0804DF38
	push {r4, r5, r6, lr}
	adds r3, r0, #0
	ldrb r0, [r3, #0x18]
	cmp r0, #0xe0
	beq _0804DF54
	cmp r0, #0xe0
	blt _0804DF64
	cmp r0, #0xe8
	bgt _0804DF64
	cmp r0, #0xe7
	blt _0804DF64
	movs r4, #3
	ldrb r5, [r3, #0x1e]
	b _0804DFC4
_0804DF54:
	movs r1, #0
	movs r0, #0xe1
	strb r0, [r3, #0x18]
	str r1, [r3, #4]
	movs r0, #0x80
	lsls r0, r0, #0xd
	str r0, [r3]
	b _0804DFB6
_0804DF64:
	movs r4, #3
	ldrb r5, [r3, #0x1e]
	movs r6, #1
	ldr r1, _0804DFC0  @ 0x04000126
_0804DF6C:
	ldrh r0, [r1]
	adds r2, r0, #0
	adds r0, r5, #0
	asrs r0, r4
	ands r0, r6
	cmp r0, #0
	beq _0804DF80
	ldr r0, [r3, #4]
	cmp r2, r0
	bne _0804DF54
_0804DF80:
	subs r1, #2
	subs r4, #1
	cmp r4, #0
	bne _0804DF6C
	ldrb r0, [r3, #0x18]
	adds r0, #1
	strb r0, [r3, #0x18]
	ldr r1, [r3]
	ldrh r0, [r3]
	str r0, [r3, #4]
	cmp r1, #0
	bne _0804DFAE
	ldr r0, [r3, #0x28]
	adds r1, r0, #0
	adds r1, #0xac
	ldrb r1, [r1]
	adds r0, #0xad
	ldrb r0, [r0]
	lsls r0, r0, #8
	orrs r1, r0
	str r1, [r3, #4]
	lsls r1, r1, #5
	str r1, [r3]
_0804DFAE:
	ldr r0, [r3]
	lsrs r0, r0, #5
	str r0, [r3]
_0804DFB4:
	ldrh r1, [r3]
_0804DFB6:
	adds r0, r3, #0
	bl sub_804DDF0
	b _0804E01C
	.align 2, 0
_0804DFC0: .4byte 0x04000126
_0804DFC4:
	lsls r0, r4, #1
	ldr r1, _0804E00C  @ 0x04000120
	adds r0, r0, r1
	ldrh r0, [r0]
	adds r2, r0, #0
	adds r0, r5, #0
	asrs r0, r4
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0804DFE0
	ldr r0, [r3, #4]
	cmp r2, r0
	bne _0804E010
_0804DFE0:
	subs r4, #1
	cmp r4, #0
	bne _0804DFC4
	ldrb r0, [r3, #0x18]
	adds r0, #1
	strb r0, [r3, #0x18]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xe9
	beq _0804E01A
	ldr r0, [r3, #0x28]
	adds r1, r0, #0
	adds r1, #0xae
	ldrb r1, [r1]
	adds r0, #0xaf
	ldrb r0, [r0]
	lsls r0, r0, #8
	orrs r1, r0
	str r1, [r3]
	str r1, [r3, #4]
	b _0804DFB4
	.align 2, 0
_0804E00C: .4byte 0x04000120
_0804E010:
	adds r0, r3, #0
	bl sub_804D9C4
	movs r0, #0x71
	b _0804E01C
_0804E01A:
	movs r0, #0
_0804E01C:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_804DF38

	THUMB_FUNC_START sub_804E024
sub_804E024: @ 0x0804E024
	mov r2, pc
	lsrs r2, r2, #0x18
	movs r1, #0xc
	cmp r2, #2
	beq _0804E036
	movs r1, #0xd
	cmp r2, #8
	beq _0804E036
	movs r1, #4
_0804E036:
	subs r0, r0, r1
	bgt _0804E036
	bx lr

	THUMB_FUNC_END sub_804E024

	THUMB_FUNC_START sub_804E03C
sub_804E03C: @ 0x0804E03C
	push {r4, r5, lr}
	movs r2, #0
	ldr r3, _0804E070  @ 0x04000128
	ldrh r1, [r3]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0804E060
	ldr r5, _0804E074  @ 0x0000795C
	movs r4, #0x80
_0804E050:
	adds r2, #1
	cmp r2, r5
	bgt _0804E060
	ldrh r1, [r3]
	adds r0, r4, #0
	ands r0, r1
	cmp r0, #0
	bne _0804E050
_0804E060:
	movs r0, #0x96
	lsls r0, r0, #2
	bl sub_804E024
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0804E070: .4byte 0x04000128
_0804E074: .4byte 0x0000795C

	THUMB_FUNC_END sub_804E03C

.align 2, 0
