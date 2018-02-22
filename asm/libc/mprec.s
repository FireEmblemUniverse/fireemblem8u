    .INCLUDE "macro.inc"

    .SYNTAX unified

	THUMB_FUNC_START _Balloc
_Balloc: @ 0x080D4D2C
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r6, r1, #0
	ldr r0, [r4, #0x4c]
	cmp r0, #0
	bne _080D4D48
	adds r0, r4, #0
	movs r1, #4
	movs r2, #0x10
	bl _calloc_r
	str r0, [r4, #0x4c]
	cmp r0, #0
	beq _080D4D70
_080D4D48:
	ldr r1, [r4, #0x4c]
	lsls r0, r6, #2
	adds r2, r0, r1
	ldr r1, [r2]
	cmp r1, #0
	beq _080D4D5A
	ldr r0, [r1]
	str r0, [r2]
	b _080D4D78
_080D4D5A:
	movs r5, #1
	lsls r5, r6
	lsls r2, r5, #2
	adds r2, #0x14
	adds r0, r4, #0
	movs r1, #1
	bl _calloc_r
	adds r1, r0, #0
	cmp r1, #0
	bne _080D4D74
_080D4D70:
	movs r0, #0
	b _080D4D80
_080D4D74:
	str r6, [r1, #4]
	str r5, [r1, #8]
_080D4D78:
	movs r0, #0
	str r0, [r1, #0x10]
	str r0, [r1, #0xc]
	adds r0, r1, #0
_080D4D80:
	pop {r4, r5, r6, pc}
	.byte 0x00, 0x00

	THUMB_FUNC_START _Bfree
_Bfree: @ 0x080D4D84
	adds r3, r0, #0
	adds r2, r1, #0
	cmp r2, #0
	beq _080D4D9A
	ldr r0, [r2, #4]
	ldr r1, [r3, #0x4c]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	str r1, [r2]
	str r2, [r0]
_080D4D9A:
	bx lr

	THUMB_FUNC_START _multadd
_multadd: @ 0x080D4D9C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	mov sb, r0
	adds r5, r1, #0
	adds r4, r2, #0
	mov r8, r3
	ldr r6, [r5, #0x10]
	adds r3, r5, #0
	adds r3, #0x14
	movs r7, #0
	ldr r0, _080D4E30 @ 0x0000FFFF
	mov ip, r0
_080D4DB8:
	ldr r1, [r3]
	adds r0, r1, #0
	mov r2, ip
	ands r0, r2
	adds r2, r0, #0
	muls r2, r4, r2
	add r2, r8
	lsrs r1, r1, #0x10
	adds r0, r1, #0
	muls r0, r4, r0
	lsrs r1, r2, #0x10
	adds r0, r0, r1
	lsrs r1, r0, #0x10
	mov r8, r1
	lsls r0, r0, #0x10
	mov r1, ip
	ands r2, r1
	adds r0, r0, r2
	stm r3!, {r0}
	adds r7, #1
	cmp r7, r6
	blt _080D4DB8
	mov r2, r8
	cmp r2, #0
	beq _080D4E26
	ldr r0, [r5, #8]
	cmp r6, r0
	blt _080D4E16
	ldr r1, [r5, #4]
	adds r1, #1
	mov r0, sb
	bl _Balloc
	adds r4, r0, #0
	adds r0, #0xc
	adds r1, r5, #0
	adds r1, #0xc
	ldr r2, [r5, #0x10]
	lsls r2, r2, #2
	adds r2, #8
	bl memcpy
	mov r0, sb
	adds r1, r5, #0
	bl _Bfree
	adds r5, r4, #0
_080D4E16:
	lsls r1, r6, #2
	adds r0, r5, #0
	adds r0, #0x14
	adds r0, r0, r1
	mov r1, r8
	str r1, [r0]
	adds r6, #1
	str r6, [r5, #0x10]
_080D4E26:
	adds r0, r5, #0
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_080D4E30: .4byte 0x0000FFFF

	THUMB_FUNC_START _s2b
_s2b: @ 0x080D4E34
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r7, r0, #0
	adds r4, r1, #0
	adds r6, r2, #0
	mov r8, r3
	mov r0, r8
	adds r0, #8
	movs r1, #9
	bl __divsi3
	movs r1, #0
	movs r2, #1
	cmp r0, #1
	ble _080D4E5C
_080D4E54:
	lsls r2, r2, #1
	adds r1, #1
	cmp r0, r2
	bgt _080D4E54
_080D4E5C:
	adds r0, r7, #0
	bl _Balloc
	adds r1, r0, #0
	ldr r0, [sp, #0x18]
	str r0, [r1, #0x14]
	movs r0, #1
	str r0, [r1, #0x10]
	movs r5, #9
	cmp r6, #9
	ble _080D4E8E
	adds r4, #9
_080D4E74:
	ldrb r3, [r4]
	subs r3, #0x30
	adds r4, #1
	adds r0, r7, #0
	movs r2, #0xa
	bl _multadd
	adds r1, r0, #0
	adds r5, #1
	cmp r5, r6
	blt _080D4E74
	adds r4, #1
	b _080D4E90
_080D4E8E:
	adds r4, #0xa
_080D4E90:
	cmp r5, r8
	bge _080D4EAE
	mov r0, r8
	subs r5, r0, r5
_080D4E98:
	ldrb r3, [r4]
	subs r3, #0x30
	adds r4, #1
	adds r0, r7, #0
	movs r2, #0xa
	bl _multadd
	adds r1, r0, #0
	subs r5, #1
	cmp r5, #0
	bne _080D4E98
_080D4EAE:
	adds r0, r1, #0
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7, pc}
	.byte 0x00, 0x00

	THUMB_FUNC_START _hi0bits
_hi0bits: @ 0x080D4EB8
	adds r1, r0, #0
	movs r2, #0
	ldr r0, _080D4F08 @ 0xFFFF0000
	ands r0, r1
	cmp r0, #0
	bne _080D4EC8
	movs r2, #0x10
	lsls r1, r1, #0x10
_080D4EC8:
	movs r0, #0xff
	lsls r0, r0, #0x18
	ands r0, r1
	cmp r0, #0
	bne _080D4ED6
	adds r2, #8
	lsls r1, r1, #8
_080D4ED6:
	movs r0, #0xf0
	lsls r0, r0, #0x18
	ands r0, r1
	cmp r0, #0
	bne _080D4EE4
	adds r2, #4
	lsls r1, r1, #4
_080D4EE4:
	movs r0, #0xc0
	lsls r0, r0, #0x18
	ands r0, r1
	cmp r0, #0
	bne _080D4EF2
	adds r2, #2
	lsls r1, r1, #2
_080D4EF2:
	cmp r1, #0
	blt _080D4F0C
	adds r2, #1
	movs r0, #0x80
	lsls r0, r0, #0x17
	ands r0, r1
	cmp r0, #0
	bne _080D4F0C
	movs r0, #0x20
	b _080D4F0E
	.align 2, 0
_080D4F08: .4byte 0xFFFF0000
_080D4F0C:
	adds r0, r2, #0
_080D4F0E:
	bx lr

	THUMB_FUNC_START _lo0bits
_lo0bits: @ 0x080D4F10
	adds r3, r0, #0
	ldr r1, [r3]
	movs r0, #7
	ands r0, r1
	cmp r0, #0
	beq _080D4F40
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080D4F28
	movs r0, #0
	b _080D4F90
_080D4F28:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080D4F38
	lsrs r0, r1, #1
	str r0, [r3]
	movs r0, #1
	b _080D4F90
_080D4F38:
	lsrs r0, r1, #2
	str r0, [r3]
	movs r0, #2
	b _080D4F90
_080D4F40:
	movs r2, #0
	ldr r0, _080D4F88 @ 0x0000FFFF
	ands r0, r1
	cmp r0, #0
	bne _080D4F4E
	movs r2, #0x10
	lsrs r1, r1, #0x10
_080D4F4E:
	movs r0, #0xff
	ands r0, r1
	cmp r0, #0
	bne _080D4F5A
	adds r2, #8
	lsrs r1, r1, #8
_080D4F5A:
	movs r0, #0xf
	ands r0, r1
	cmp r0, #0
	bne _080D4F66
	adds r2, #4
	lsrs r1, r1, #4
_080D4F66:
	movs r0, #3
	ands r0, r1
	cmp r0, #0
	bne _080D4F72
	adds r2, #2
	lsrs r1, r1, #2
_080D4F72:
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _080D4F8C
	adds r2, #1
	lsrs r1, r1, #1
	cmp r1, #0
	bne _080D4F8C
	movs r0, #0x20
	b _080D4F90
	.align 2, 0
_080D4F88: .4byte 0x0000FFFF
_080D4F8C:
	str r1, [r3]
	adds r0, r2, #0
_080D4F90:
	bx lr
	.byte 0x00, 0x00

	THUMB_FUNC_START _i2b
_i2b: @ 0x080D4F94
	push {r4, lr}
	adds r4, r1, #0
	movs r1, #1
	bl _Balloc
	str r4, [r0, #0x14]
	movs r1, #1
	str r1, [r0, #0x10]
	pop {r4, pc}
	.byte 0x00, 0x00

	THUMB_FUNC_START _multiply
_multiply: @ 0x080D4FA8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x24
	adds r3, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	ldr r1, [r4, #0x10]
	ldr r0, [r5, #0x10]
	cmp r1, r0
	bge _080D4FC8
	str r4, [sp]
	adds r4, r5, #0
	ldr r5, [sp]
_080D4FC8:
	ldr r1, [r4, #4]
	ldr r6, [r4, #0x10]
	ldr r0, [r5, #0x10]
	mov r8, r0
	mov r2, r8
	adds r2, r6, r2
	str r2, [sp, #4]
	ldr r0, [r4, #8]
	cmp r2, r0
	ble _080D4FDE
	adds r1, #1
_080D4FDE:
	adds r0, r3, #0
	bl _Balloc
	str r0, [sp]
	adds r7, r0, #0
	adds r7, #0x14
	ldr r1, [sp, #4]
	lsls r0, r1, #2
	adds r2, r7, r0
	str r2, [sp, #8]
	str r0, [sp, #0x18]
	adds r1, r4, #0
	adds r1, #0x14
	lsls r3, r6, #2
	adds r2, r5, #0
	adds r2, #0x14
	mov r5, r8
	lsls r4, r5, #2
	ldr r0, [sp, #8]
	cmp r7, r0
	bhs _080D5012
	movs r0, #0
_080D500A:
	stm r7!, {r0}
	ldr r5, [sp, #8]
	cmp r7, r5
	blo _080D500A
_080D5012:
	str r1, [sp, #8]
	adds r3, r1, r3
	str r3, [sp, #0xc]
	mov r8, r2
	add r4, r8
	str r4, [sp, #0x10]
	ldr r0, [sp]
	adds r0, #0x14
	mov sb, r0
	mov r1, sb
	str r1, [sp, #0x20]
	cmp r8, r4
	bhs _080D50DA
_080D502C:
	mov r2, r8
	ldm r2!, {r6}
	str r2, [sp, #0x14]
	ldr r0, _080D50E8 @ 0x0000FFFF
	ands r6, r0
	mov r4, sb
	adds r4, #4
	str r4, [sp, #0x1c]
	cmp r6, #0
	beq _080D5084
	ldr r7, [sp, #8]
	mov r5, sb
	movs r1, #0
	mov ip, r1
	mov sl, r0
_080D504A:
	ldm r7!, {r3}
	adds r0, r3, #0
	mov r2, sl
	ands r0, r2
	adds r1, r0, #0
	muls r1, r6, r1
	ldr r2, [r5]
	adds r0, r2, #0
	mov r4, sl
	ands r0, r4
	adds r1, r1, r0
	mov r0, ip
	adds r4, r1, r0
	lsrs r1, r4, #0x10
	lsrs r3, r3, #0x10
	adds r0, r3, #0
	muls r0, r6, r0
	lsrs r2, r2, #0x10
	adds r0, r0, r2
	adds r2, r0, r1
	lsrs r0, r2, #0x10
	mov ip, r0
	strh r2, [r5]
	strh r4, [r5, #2]
	adds r5, #4
	ldr r1, [sp, #0xc]
	cmp r7, r1
	blo _080D504A
	str r0, [r5]
_080D5084:
	mov r2, r8
	ldrh r6, [r2, #2]
	cmp r6, #0
	beq _080D50CC
	ldr r7, [sp, #8]
	mov r5, sb
	movs r4, #0
	mov ip, r4
	ldr r2, [r5]
	ldr r3, _080D50E8 @ 0x0000FFFF
_080D5098:
	ldm r7!, {r1}
	adds r0, r1, #0
	ands r0, r3
	muls r0, r6, r0
	ldrh r4, [r5, #2]
	adds r4, r4, r0
	mov r8, r4
	add r4, ip
	lsrs r0, r4, #0x10
	mov ip, r0
	strh r4, [r5]
	strh r2, [r5, #2]
	adds r5, #4
	lsrs r1, r1, #0x10
	muls r1, r6, r1
	ldr r0, [r5]
	ands r0, r3
	adds r1, r1, r0
	mov r4, ip
	adds r2, r1, r4
	lsrs r0, r2, #0x10
	mov ip, r0
	ldr r1, [sp, #0xc]
	cmp r7, r1
	blo _080D5098
	str r2, [r5]
_080D50CC:
	ldr r2, [sp, #0x14]
	mov r8, r2
	ldr r4, [sp, #0x1c]
	mov sb, r4
	ldr r5, [sp, #0x10]
	cmp r8, r5
	blo _080D502C
_080D50DA:
	ldr r0, [sp, #0x20]
	ldr r1, [sp, #0x18]
	adds r5, r0, r1
	ldr r2, [sp, #4]
	cmp r2, #0
	ble _080D50FE
	b _080D50F6
	.align 2, 0
_080D50E8: .4byte 0x0000FFFF
_080D50EC:
	ldr r4, [sp, #4]
	subs r4, #1
	str r4, [sp, #4]
	cmp r4, #0
	ble _080D50FE
_080D50F6:
	subs r5, #4
	ldr r0, [r5]
	cmp r0, #0
	beq _080D50EC
_080D50FE:
	ldr r5, [sp, #4]
	ldr r0, [sp]
	str r5, [r0, #0x10]
	ldr r0, [sp]
	add sp, #0x24
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7, pc}
	.byte 0x00, 0x00

	THUMB_FUNC_START _pow5mult
_pow5mult: @ 0x080D5114
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	adds r7, r1, #0
	adds r6, r2, #0
	movs r1, #3
	ands r1, r6
	cmp r1, #0
	beq _080D513E
	ldr r0, _080D5160 @ 0x085877D0
	subs r1, #1
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r2, [r1]
	mov r0, r8
	adds r1, r7, #0
	movs r3, #0
	bl _multadd
	adds r7, r0, #0
_080D513E:
	asrs r6, r6, #2
	cmp r6, #0
	beq _080D51A4
	mov r0, r8
	ldr r5, [r0, #0x48]
	adds r4, r5, #0
	cmp r5, #0
	bne _080D5180
	ldr r1, _080D5164 @ 0x00000271
	bl _i2b
	mov r1, r8
	str r0, [r1, #0x48]
	adds r5, r0, #0
	str r4, [r5]
	b _080D5180
	.align 2, 0
_080D5160: .4byte gUnknown_085877D0
_080D5164: .4byte 0x00000271
_080D5168:
	ldr r0, [r5]
	adds r4, r0, #0
	cmp r0, #0
	bne _080D517E
	mov r0, r8
	adds r1, r5, #0
	adds r2, r5, #0
	bl _multiply
	str r0, [r5]
	str r4, [r0]
_080D517E:
	adds r5, r0, #0
_080D5180:
	movs r0, #1
	ands r0, r6
	cmp r0, #0
	beq _080D519E
	mov r0, r8
	adds r1, r7, #0
	adds r2, r5, #0
	bl _multiply
	adds r4, r0, #0
	mov r0, r8
	adds r1, r7, #0
	bl _Bfree
	adds r7, r4, #0
_080D519E:
	asrs r6, r6, #1
	cmp r6, #0
	bne _080D5168
_080D51A4:
	adds r0, r7, #0
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7, pc}

	THUMB_FUNC_START _lshift
_lshift: @ 0x080D51AC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	mov sl, r0
	mov r8, r1
	adds r5, r2, #0
	asrs r6, r5, #5
	ldr r1, [r1, #4]
	mov r2, r8
	ldr r0, [r2, #0x10]
	adds r0, r6, r0
	adds r7, r0, #1
	ldr r2, [r2, #8]
	cmp r7, r2
	ble _080D51D6
_080D51CE:
	adds r1, #1
	lsls r2, r2, #1
	cmp r7, r2
	bgt _080D51CE
_080D51D6:
	mov r0, sl
	bl _Balloc
	mov sb, r0
	mov r4, sb
	adds r4, #0x14
	mov r0, r8
	adds r0, #0x14
	cmp r6, #0
	ble _080D51F6
	movs r1, #0
	adds r2, r6, #0
_080D51EE:
	stm r4!, {r1}
	subs r2, #1
	cmp r2, #0
	bne _080D51EE
_080D51F6:
	adds r3, r0, #0
	mov r1, r8
	ldr r0, [r1, #0x10]
	lsls r0, r0, #2
	adds r6, r3, r0
	movs r0, #0x1f
	ands r5, r0
	cmp r5, #0
	beq _080D5228
	movs r0, #0x20
	subs r1, r0, r5
	movs r2, #0
_080D520E:
	ldr r0, [r3]
	lsls r0, r5
	orrs r0, r2
	stm r4!, {r0}
	ldm r3!, {r2}
	lsrs r2, r1
	cmp r3, r6
	blo _080D520E
	str r2, [r4]
	cmp r2, #0
	beq _080D5230
	adds r7, #1
	b _080D5230
_080D5228:
	ldm r3!, {r0}
	stm r4!, {r0}
	cmp r3, r6
	blo _080D5228
_080D5230:
	subs r0, r7, #1
	mov r2, sb
	str r0, [r2, #0x10]
	mov r0, sl
	mov r1, r8
	bl _Bfree
	mov r0, sb
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7, pc}
	.byte 0x00, 0x00

	THUMB_FUNC_START __mcmp
__mcmp: @ 0x080D524C
	push {r4, r5, lr}
	adds r2, r0, #0
	adds r5, r1, #0
	ldr r0, [r2, #0x10]
	ldr r1, [r5, #0x10]
	subs r0, r0, r1
	cmp r0, #0
	bne _080D5288
	adds r4, r2, #0
	adds r4, #0x14
	lsls r1, r1, #2
	adds r3, r4, r1
	adds r0, r5, #0
	adds r0, #0x14
	adds r1, r0, r1
_080D526A:
	subs r3, #4
	subs r1, #4
	ldr r0, [r3]
	ldr r2, [r1]
	cmp r0, r2
	beq _080D5282
	movs r1, #1
	cmp r0, r2
	bhs _080D527E
	subs r1, #2
_080D527E:
	adds r0, r1, #0
	b _080D5288
_080D5282:
	cmp r3, r4
	bhi _080D526A
	movs r0, #0
_080D5288:
	pop {r4, r5, pc}
	.byte 0x00, 0x00

	THUMB_FUNC_START __mdiff
__mdiff: @ 0x080D528C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r6, r0, #0
	adds r5, r1, #0
	mov r8, r2
	adds r0, r5, #0
	mov r1, r8
	bl __mcmp
	adds r4, r0, #0
	cmp r4, #0
	bne _080D52BE
	adds r0, r6, #0
	movs r1, #0
	bl _Balloc
	adds r7, r0, #0
	movs r0, #1
	str r0, [r7, #0x10]
	str r4, [r7, #0x14]
	b _080D536E
_080D52BE:
	cmp r4, #0
	bge _080D52CC
	adds r7, r5, #0
	mov r5, r8
	mov r8, r7
	movs r4, #1
	b _080D52CE
_080D52CC:
	movs r4, #0
_080D52CE:
	ldr r1, [r5, #4]
	adds r0, r6, #0
	bl _Balloc
	adds r7, r0, #0
	str r4, [r7, #0xc]
	ldr r0, [r5, #0x10]
	mov sb, r0
	adds r6, r5, #0
	adds r6, #0x14
	lsls r0, r0, #2
	adds r0, r0, r6
	mov sl, r0
	mov r1, r8
	ldr r0, [r1, #0x10]
	movs r3, #0x14
	add r3, r8
	mov ip, r3
	lsls r0, r0, #2
	add r0, ip
	str r0, [sp]
	adds r4, r7, #0
	adds r4, #0x14
	movs r5, #0
	ldr r0, _080D5358 @ 0x0000FFFF
	mov r8, r0
_080D5302:
	ldm r6!, {r1}
	str r1, [sp, #4]
	mov r3, r8
	ands r1, r3
	mov r0, ip
	adds r0, #4
	mov ip, r0
	subs r0, #4
	ldm r0!, {r2}
	adds r0, r2, #0
	ands r0, r3
	subs r1, r1, r0
	adds r0, r1, r5
	asrs r5, r0, #0x10
	ldr r1, [sp, #4]
	lsrs r3, r1, #0x10
	lsrs r2, r2, #0x10
	subs r3, r3, r2
	adds r1, r3, r5
	asrs r5, r1, #0x10
	strh r1, [r4]
	strh r0, [r4, #2]
	adds r4, #4
	ldr r3, [sp]
	cmp ip, r3
	blo _080D5302
	cmp r6, sl
	bhs _080D5362
	ldr r2, _080D5358 @ 0x0000FFFF
_080D533C:
	ldm r6!, {r1}
	adds r0, r1, #0
	ands r0, r2
	adds r0, r0, r5
	asrs r5, r0, #0x10
	lsrs r1, r1, #0x10
	adds r1, r1, r5
	asrs r5, r1, #0x10
	strh r1, [r4]
	strh r0, [r4, #2]
	adds r4, #4
	cmp r6, sl
	blo _080D533C
	b _080D5362
	.align 2, 0
_080D5358: .4byte 0x0000FFFF
_080D535C:
	movs r0, #1
	rsbs r0, r0, #0
	add sb, r0
_080D5362:
	subs r4, #4
	ldr r0, [r4]
	cmp r0, #0
	beq _080D535C
	mov r1, sb
	str r1, [r7, #0x10]
_080D536E:
	adds r0, r7, #0
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7, pc}

	THUMB_FUNC_START _ulp
_ulp: @ 0x080D537C
	push {r4, lr}
	ldr r2, _080D5390 @ 0x7FF00000
	ands r2, r0
	ldr r0, _080D5394 @ 0xFCC00000
	adds r2, r2, r0
	cmp r2, #0
	ble _080D5398
	adds r3, r2, #0
	movs r4, #0
	b _080D53C2
	.align 2, 0
_080D5390: .4byte 0x7FF00000
_080D5394: .4byte 0xFCC00000
_080D5398:
	rsbs r0, r2, #0
	asrs r2, r0, #0x14
	cmp r2, #0x13
	bgt _080D53AC
	movs r0, #0x80
	lsls r0, r0, #0xc
	adds r3, r0, #0
	asrs r3, r2
	movs r4, #0
	b _080D53C2
_080D53AC:
	movs r3, #0
	subs r2, #0x14
	cmp r2, #0x1e
	bgt _080D53BE
	movs r0, #0x1f
	subs r0, r0, r2
	movs r1, #1
	lsls r1, r0
	b _080D53C0
_080D53BE:
	movs r1, #1
_080D53C0:
	adds r4, r1, #0
_080D53C2:
	adds r1, r4, #0
	adds r0, r3, #0
	pop {r4, pc}

	THUMB_FUNC_START _b2d
_b2d: @ 0x080D53C8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r4, r1, #0
	movs r1, #0x14
	adds r1, r1, r0
	mov r8, r1
	ldr r0, [r0, #0x10]
	lsls r0, r0, #2
	adds r5, r1, r0
	subs r5, #4
	ldr r2, [r5]
	adds r0, r2, #0
	str r2, [sp]
	bl _hi0bits
	adds r3, r0, #0
	movs r0, #0x20
	subs r0, r0, r3
	str r0, [r4]
	ldr r2, [sp]
	cmp r3, #0xa
	bgt _080D5428
	movs r0, #0xb
	subs r0, r0, r3
	adds r1, r2, #0
	lsrs r1, r0
	ldr r0, _080D5410 @ 0x3FF00000
	adds r6, r1, #0
	orrs r6, r0
	cmp r5, r8
	bls _080D5414
	subs r5, #4
	ldr r1, [r5]
	b _080D5416
	.align 2, 0
_080D5410: .4byte 0x3FF00000
_080D5414:
	movs r1, #0
_080D5416:
	adds r0, r3, #0
	adds r0, #0x15
	lsls r2, r0
	movs r0, #0xb
	subs r0, r0, r3
	lsrs r1, r0
	adds r7, r2, #0
	orrs r7, r1
	b _080D5474
_080D5428:
	cmp r5, r8
	bls _080D5432
	subs r5, #4
	ldr r4, [r5]
	b _080D5434
_080D5432:
	movs r4, #0
_080D5434:
	subs r3, #0xb
	cmp r3, #0
	beq _080D546C
	lsls r2, r3
	movs r0, #0x20
	subs r0, r0, r3
	adds r1, r4, #0
	lsrs r1, r0
	ldr r0, _080D5458 @ 0x3FF00000
	orrs r1, r0
	adds r6, r2, #0
	orrs r6, r1
	cmp r5, r8
	bls _080D545C
	subs r5, #4
	ldr r2, [r5]
	b _080D545E
	.align 2, 0
_080D5458: .4byte 0x3FF00000
_080D545C:
	movs r2, #0
_080D545E:
	lsls r4, r3
	movs r0, #0x20
	subs r0, r0, r3
	lsrs r2, r0
	adds r7, r4, #0
	orrs r7, r2
	b _080D5474
_080D546C:
	ldr r0, _080D5480 @ 0x3FF00000
	adds r6, r2, #0
	orrs r6, r0
	adds r7, r4, #0
_080D5474:
	adds r1, r7, #0
	adds r0, r6, #0
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_080D5480: .4byte 0x3FF00000

	THUMB_FUNC_START _d2b
_d2b: @ 0x080D5484
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	mov sb, r3
	ldr r3, [sp, #0x28]
	mov sl, r3
	adds r5, r2, #0
	adds r4, r1, #0
	movs r1, #1
	bl _Balloc
	adds r6, r0, #0
	movs r0, #0x14
	adds r0, r0, r6
	mov r8, r0
	ldr r2, _080D54EC @ 0x000FFFFF
	adds r1, r4, #0
	ands r2, r1
	str r2, [sp, #4]
	ldr r0, _080D54F0 @ 0x7FFFFFFF
	ands r4, r0
	lsrs r7, r4, #0x14
	cmp r7, #0
	beq _080D54C2
	movs r0, #0x80
	lsls r0, r0, #0xd
	orrs r0, r2
	str r0, [sp, #4]
_080D54C2:
	str r5, [sp]
	cmp r5, #0
	beq _080D550C
	mov r0, sp
	bl _lo0bits
	adds r2, r0, #0
	cmp r2, #0
	beq _080D54F4
	movs r0, #0x20
	subs r0, r0, r2
	ldr r1, [sp, #4]
	lsls r1, r0
	ldr r0, [sp]
	orrs r0, r1
	str r0, [r6, #0x14]
	ldr r0, [sp, #4]
	lsrs r0, r2
	str r0, [sp, #4]
	b _080D54F8
	.align 2, 0
_080D54EC: .4byte 0x000FFFFF
_080D54F0: .4byte 0x7FFFFFFF
_080D54F4:
	ldr r0, [sp]
	str r0, [r6, #0x14]
_080D54F8:
	ldr r0, [sp, #4]
	mov r1, r8
	str r0, [r1, #4]
	movs r1, #1
	cmp r0, #0
	beq _080D5506
	movs r1, #2
_080D5506:
	str r1, [r6, #0x10]
	adds r4, r1, #0
	b _080D5520
_080D550C:
	add r0, sp, #4
	bl _lo0bits
	adds r2, r0, #0
	ldr r0, [sp, #4]
	str r0, [r6, #0x14]
	movs r0, #1
	str r0, [r6, #0x10]
	movs r4, #1
	adds r2, #0x20
_080D5520:
	cmp r7, #0
	beq _080D553C
	ldr r3, _080D5538 @ 0xFFFFFBCD
	adds r0, r2, r3
	adds r0, r7, r0
	mov r1, sb
	str r0, [r1]
	movs r0, #0x35
	subs r0, r0, r2
	mov r3, sl
	str r0, [r3]
	b _080D5558
	.align 2, 0
_080D5538: .4byte 0xFFFFFBCD
_080D553C:
	ldr r1, _080D5568 @ 0xFFFFFBCE
	adds r0, r2, r1
	mov r3, sb
	str r0, [r3]
	lsls r0, r4, #2
	add r0, r8
	subs r0, #4
	ldr r0, [r0]
	bl _hi0bits
	lsls r1, r4, #5
	subs r1, r1, r0
	mov r0, sl
	str r1, [r0]
_080D5558:
	adds r0, r6, #0
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_080D5568: .4byte 0xFFFFFBCE

	THUMB_FUNC_START _ratio
_ratio: @ 0x080D556C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r4, r0, #0
	adds r5, r1, #0
	mov r1, sp
	bl _b2d
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	add r1, sp, #4
	adds r0, r5, #0
	bl _b2d
	adds r7, r1, #0
	adds r6, r0, #0
	ldr r2, [sp]
	ldr r0, [sp, #4]
	subs r2, r2, r0
	ldr r0, [r4, #0x10]
	ldr r1, [r5, #0x10]
	subs r0, r0, r1
	lsls r0, r0, #5
	adds r0, r2, r0
	cmp r0, #0
	ble _080D55A8
	lsls r0, r0, #0x14
	ldr r1, [sp, #8]
	adds r0, r1, r0
	str r0, [sp, #8]
	b _080D55AC
_080D55A8:
	lsls r0, r0, #0x14
	subs r6, r6, r0
_080D55AC:
	ldr r0, [sp, #8]
	ldr r1, [sp, #0xc]
	adds r3, r7, #0
	adds r2, r6, #0
	bl __divdf3
	add sp, #0x10
	pop {r4, r5, r6, r7, pc}

	THUMB_FUNC_START _mprec_log10
_mprec_log10: @ 0x080D55BC
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _080D55D8 @ 0x00000000
	ldr r0, _080D55D4 @ 0x3FF00000
	cmp r4, #0x17
	bgt _080D55E0
	ldr r0, _080D55DC @ 0x085877DC
	lsls r1, r4, #3
	adds r1, r1, r0
	ldr r0, [r1]
	ldr r1, [r1, #4]
	b _080D55F2
	.align 2, 0
_080D55D4: .4byte 0x3FF00000
_080D55D8: .4byte 0x00000000
_080D55DC: .4byte gUnknown_085877DC
_080D55E0:
	cmp r4, #0
	ble _080D55F2
_080D55E4:
	ldr r3, _080D55F8 @ 0x00000000
	ldr r2, _080D55F4 @ 0x40240000
	bl __muldf3
	subs r4, #1
	cmp r4, #0
	bgt _080D55E4
_080D55F2:
	pop {r4, pc}
	.align 2, 0
_080D55F4: .4byte 0x40240000
_080D55F8: .4byte 0x00000000
