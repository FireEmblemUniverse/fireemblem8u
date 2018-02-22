    .INCLUDE "macro.inc"

    .SYNTAX unified

	.global test

	THUMB_FUNC_START malloc_extend_top
malloc_extend_top: @ 0x080D46D4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	str r0, [sp]
	ldr r0, _080D4748 @ 0x08B1FA38
	ldr r0, [r0, #8]
	mov r8, r0
	ldr r7, [r0, #4]
	movs r0, #4
	rsbs r0, r0, #0
	ands r7, r0
	mov r2, r8
	adds r4, r2, r7
	ldr r0, _080D474C @ 0x08B1FE44
	ldr r0, [r0]
	adds r1, r1, r0
	adds r6, r1, #0
	adds r6, #0x10
	ldr r3, _080D4750 @ 0x08B1FE48
	mov sl, r3
	ldr r0, [r3]
	movs r2, #1
	rsbs r2, r2, #0
	mov sb, r2
	cmp r0, sb
	beq _080D4716
	ldr r3, _080D4754 @ 0x0000100F
	adds r6, r1, r3
	ldr r0, _080D4758 @ 0xFFFFF000
	ands r6, r0
_080D4716:
	ldr r0, [sp]
	adds r1, r6, #0
	bl _sbrk_r
	adds r5, r0, #0
	cmp r5, sb
	beq _080D4818
	cmp r5, r4
	bhs _080D472E
	ldr r0, _080D4748 @ 0x08B1FA38
	cmp r8, r0
	bne _080D4818
_080D472E:
	ldr r1, _080D475C @ 0x08B1FE54
	ldr r0, [r1]
	adds r2, r0, r6
	str r2, [r1]
	cmp r5, r4
	bne _080D4760
	adds r2, r6, r7
	ldr r3, _080D4748 @ 0x08B1FA38
	ldr r1, [r3, #8]
	movs r0, #1
	orrs r2, r0
	str r2, [r1, #4]
	b _080D4800
	.align 2, 0
_080D4748: .4byte gUnknown_08B1FA38
_080D474C: .4byte gUnknown_08B1FE44
_080D4750: .4byte gUnknown_08B1FE48
_080D4754: .4byte 0x0000100F
_080D4758: .4byte 0xFFFFF000
_080D475C: .4byte gUnknown_08B1FE54
_080D4760:
	mov r3, sl
	ldr r0, [r3]
	cmp r0, sb
	bne _080D476C
	str r5, [r3]
	b _080D4772
_080D476C:
	subs r0, r5, r4
	adds r0, r2, r0
	str r0, [r1]
_080D4772:
	adds r1, r5, #0
	adds r1, #8
	movs r0, #7
	ands r1, r0
	cmp r1, #0
	beq _080D4786
	movs r0, #8
	subs r4, r0, r1
	adds r5, r5, r4
	b _080D4788
_080D4786:
	movs r4, #0
_080D4788:
	adds r0, r5, r6
	movs r1, #0x80
	lsls r1, r1, #5
	subs r1, #1
	ands r0, r1
	movs r1, #0x80
	lsls r1, r1, #5
	subs r0, r1, r0
	adds r4, r4, r0
	ldr r0, [sp]
	adds r1, r4, #0
	bl _sbrk_r
	adds r2, r0, #0
	movs r0, #1
	rsbs r0, r0, #0
	cmp r2, r0
	beq _080D4818
	ldr r1, _080D47D0 @ 0x08B1FE54
	ldr r0, [r1]
	adds r0, r0, r4
	str r0, [r1]
	ldr r1, _080D47D4 @ 0x08B1FA38
	str r5, [r1, #8]
	subs r0, r2, r5
	adds r2, r0, r4
	movs r3, #1
	orrs r2, r3
	str r2, [r5, #4]
	cmp r8, r1
	beq _080D4800
	cmp r7, #0xf
	bhi _080D47D8
	str r3, [r5, #4]
	b _080D4818
	.align 2, 0
_080D47D0: .4byte gUnknown_08B1FE54
_080D47D4: .4byte gUnknown_08B1FA38
_080D47D8:
	subs r7, #0xc
	movs r0, #8
	rsbs r0, r0, #0
	ands r7, r0
	mov r2, r8
	ldr r0, [r2, #4]
	ands r0, r3
	orrs r0, r7
	str r0, [r2, #4]
	adds r1, r2, r7
	movs r0, #5
	str r0, [r1, #4]
	str r0, [r1, #8]
	cmp r7, #0xf
	bls _080D4800
	mov r1, r8
	adds r1, #8
	ldr r0, [sp]
	bl _free_r
_080D4800:
	ldr r0, _080D4824 @ 0x08B1FE54
	ldr r2, _080D4828 @ 0x08B1FE4C
	ldr r1, [r0]
	ldr r0, [r2]
	cmp r1, r0
	bls _080D480E
	str r1, [r2]
_080D480E:
	ldr r2, _080D482C @ 0x08B1FE50
	ldr r0, [r2]
	cmp r1, r0
	bls _080D4818
	str r1, [r2]
_080D4818:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_080D4824: .4byte gUnknown_08B1FE54
_080D4828: .4byte gUnknown_08B1FE4C
_080D482C: .4byte gUnknown_08B1FE50

	THUMB_FUNC_START _malloc_r
_malloc_r: @ 0x080D4830
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	str r0, [sp]
	adds r1, #0xb
	cmp r1, #0x16
	ble _080D4852
	movs r0, #8
	rsbs r0, r0, #0
	mov r8, r0
	mov r2, r8
	ands r2, r1
	mov r8, r2
	b _080D4856
_080D4852:
	movs r3, #0x10
	mov r8, r3
_080D4856:
	ldr r0, [sp]
	bl __malloc_lock
	ldr r0, _080D489C @ 0x000001F7
	cmp r8, r0
	bhi _080D48AA
	mov r4, r8
	lsrs r4, r4, #3
	mov ip, r4
	ldr r0, _080D48A0 @ 0x08B1FA38
	mov r7, r8
	adds r2, r7, r0
	ldr r5, [r2, #0xc]
	cmp r5, r2
	bne _080D487E
	adds r2, r5, #0
	adds r2, #8
	ldr r5, [r2, #0xc]
	cmp r5, r2
	beq _080D48A4
_080D487E:
	ldr r2, [r5, #4]
	movs r0, #4
	rsbs r0, r0, #0
	ands r2, r0
	ldr r6, [r5, #0xc]
	ldr r4, [r5, #8]
	str r6, [r4, #0xc]
	str r4, [r6, #8]
	adds r2, r5, r2
	ldr r0, [r2, #4]
	movs r1, #1
	orrs r0, r1
	str r0, [r2, #4]
	b _080D4BD6
	.align 2, 0
_080D489C: .4byte 0x000001F7
_080D48A0: .4byte gUnknown_08B1FA38
_080D48A4:
	movs r0, #2
	add ip, r0
	b _080D4956
_080D48AA:
	mov r2, r8
	lsrs r1, r2, #9
	cmp r1, #0
	bne _080D48B6
	lsrs r2, r2, #3
	b _080D4906
_080D48B6:
	cmp r1, #4
	bhi _080D48C4
	mov r3, r8
	lsrs r0, r3, #6
	adds r0, #0x38
	mov ip, r0
	b _080D4908
_080D48C4:
	cmp r1, #0x14
	bhi _080D48CE
	adds r1, #0x5b
	mov ip, r1
	b _080D4908
_080D48CE:
	cmp r1, #0x54
	bhi _080D48DC
	mov r4, r8
	lsrs r0, r4, #0xc
	adds r0, #0x6e
	mov ip, r0
	b _080D4908
_080D48DC:
	movs r0, #0xaa
	lsls r0, r0, #1
	cmp r1, r0
	bhi _080D48EE
	mov r7, r8
	lsrs r0, r7, #0xf
	adds r0, #0x77
	mov ip, r0
	b _080D4908
_080D48EE:
	ldr r0, _080D4900 @ 0x00000554
	cmp r1, r0
	bhi _080D4904
	mov r1, r8
	lsrs r0, r1, #0x12
	adds r0, #0x7c
	mov ip, r0
	b _080D4908
	.align 2, 0
_080D4900: .4byte 0x00000554
_080D4904:
	movs r2, #0x7e
_080D4906:
	mov ip, r2
_080D4908:
	mov r3, ip
	lsls r0, r3, #3
	ldr r1, _080D492C @ 0x08B1FA38
	adds r4, r0, r1
	ldr r5, [r4, #0xc]
	cmp r5, r4
	beq _080D4952
	ldr r1, [r5, #4]
	movs r0, #4
	rsbs r0, r0, #0
	ands r1, r0
	mov r7, r8
	subs r3, r1, r7
	cmp r3, #0xf
	ble _080D4930
	adds r0, #3
	add ip, r0
	b _080D4952
	.align 2, 0
_080D492C: .4byte gUnknown_08B1FA38
_080D4930:
	cmp r3, #0
	blt _080D4936
	b _080D4B70
_080D4936:
	ldr r5, [r5, #0xc]
	cmp r5, r4
	beq _080D4952
	ldr r1, [r5, #4]
	movs r0, #4
	rsbs r0, r0, #0
	ands r1, r0
	mov r2, r8
	subs r3, r1, r2
	cmp r3, #0xf
	ble _080D4930
	movs r3, #1
	rsbs r3, r3, #0
	add ip, r3
_080D4952:
	movs r4, #1
	add ip, r4
_080D4956:
	ldr r0, _080D4994 @ 0x08B1FA40
	ldr r5, [r0, #8]
	mov sl, r0
	cmp r5, sl
	bne _080D4962
	b _080D4A64
_080D4962:
	ldr r1, [r5, #4]
	movs r0, #4
	rsbs r0, r0, #0
	ands r1, r0
	mov r7, r8
	subs r3, r1, r7
	cmp r3, #0xf
	ble _080D4998
	adds r2, r5, r7
	movs r1, #1
	adds r0, r7, #0
	orrs r0, r1
	str r0, [r5, #4]
	mov r4, sl
	str r2, [r4, #0xc]
	str r2, [r4, #8]
	str r4, [r2, #0xc]
	str r4, [r2, #8]
	adds r0, r3, #0
	orrs r0, r1
	str r0, [r2, #4]
	adds r0, r2, r3
	str r3, [r0]
	b _080D4BD6
	.align 2, 0
_080D4994: .4byte gUnknown_08B1FA40
_080D4998:
	mov r7, sl
	str r7, [r7, #0xc]
	str r7, [r7, #8]
	cmp r3, #0
	blt _080D49AE
	adds r2, r5, r1
	ldr r0, [r2, #4]
	movs r1, #1
	orrs r0, r1
	str r0, [r2, #4]
	b _080D4BD6
_080D49AE:
	ldr r0, _080D49D0 @ 0x000001FF
	cmp r1, r0
	bhi _080D49D4
	lsrs r2, r1, #3
	mov r3, sl
	subs r3, #8
	adds r0, r2, #0
	asrs r0, r0, #2
	movs r1, #1
	lsls r1, r0
	ldr r0, [r3, #4]
	orrs r0, r1
	str r0, [r3, #4]
	lsls r0, r2, #3
	adds r6, r0, r3
	ldr r4, [r6, #8]
	b _080D4A5C
	.align 2, 0
_080D49D0: .4byte 0x000001FF
_080D49D4:
	lsrs r2, r1, #9
	cmp r2, #0
	bne _080D49DE
	lsrs r2, r1, #3
	b _080D4A22
_080D49DE:
	cmp r2, #4
	bhi _080D49EA
	lsrs r0, r1, #6
	adds r2, r0, #0
	adds r2, #0x38
	b _080D4A22
_080D49EA:
	cmp r2, #0x14
	bhi _080D49F2
	adds r2, #0x5b
	b _080D4A22
_080D49F2:
	cmp r2, #0x54
	bhi _080D49FE
	lsrs r0, r1, #0xc
	adds r2, r0, #0
	adds r2, #0x6e
	b _080D4A22
_080D49FE:
	movs r0, #0xaa
	lsls r0, r0, #1
	cmp r2, r0
	bhi _080D4A0E
	lsrs r0, r1, #0xf
	adds r2, r0, #0
	adds r2, #0x77
	b _080D4A22
_080D4A0E:
	ldr r0, _080D4A1C @ 0x00000554
	cmp r2, r0
	bhi _080D4A20
	lsrs r0, r1, #0x12
	adds r2, r0, #0
	adds r2, #0x7c
	b _080D4A22
	.align 2, 0
_080D4A1C: .4byte 0x00000554
_080D4A20:
	movs r2, #0x7e
_080D4A22:
	lsls r0, r2, #3
	ldr r3, _080D4A40 @ 0x08B1FA38
	adds r6, r0, r3
	ldr r4, [r6, #8]
	cmp r4, r6
	bne _080D4A44
	adds r0, r2, #0
	asrs r0, r0, #2
	movs r1, #1
	lsls r1, r0
	ldr r7, _080D4A40 @ 0x08B1FA38
	ldr r0, [r7, #4]
	orrs r0, r1
	str r0, [r7, #4]
	b _080D4A5C
	.align 2, 0
_080D4A40: .4byte gUnknown_08B1FA38
_080D4A44:
	ldr r0, [r4, #4]
	movs r2, #4
	rsbs r2, r2, #0
	b _080D4A54
_080D4A4C:
	ldr r4, [r4, #8]
	cmp r4, r6
	beq _080D4A5A
	ldr r0, [r4, #4]
_080D4A54:
	ands r0, r2
	cmp r1, r0
	blo _080D4A4C
_080D4A5A:
	ldr r6, [r4, #0xc]
_080D4A5C:
	str r6, [r5, #0xc]
	str r4, [r5, #8]
	str r5, [r6, #8]
	str r5, [r4, #0xc]
_080D4A64:
	mov r0, ip
	cmp r0, #0
	bge _080D4A6C
	adds r0, #3
_080D4A6C:
	asrs r0, r0, #2
	movs r6, #1
	lsls r6, r0
	ldr r0, _080D4A90 @ 0x08B1FA38
	ldr r1, [r0, #4]
	cmp r6, r1
	bhi _080D4B2E
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	bne _080D4AA2
	movs r0, #4
	rsbs r0, r0, #0
	mov r2, ip
	ands r0, r2
	adds r0, #4
	mov ip, r0
	b _080D4A98
	.align 2, 0
_080D4A90: .4byte gUnknown_08B1FA38
_080D4A94:
	movs r3, #4
	add ip, r3
_080D4A98:
	lsls r6, r6, #1
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	beq _080D4A94
_080D4AA2:
	ldr r4, _080D4B20 @ 0x08B1FA38
	mov sb, r4
_080D4AA6:
	mov r7, ip
	str r7, [sp, #4]
	mov r1, ip
	lsls r0, r1, #3
	mov r3, sb
	adds r2, r0, r3
	adds r4, r2, #0
_080D4AB4:
	ldr r5, [r4, #0xc]
	cmp r5, r4
	beq _080D4AD4
	movs r0, #4
	rsbs r0, r0, #0
_080D4ABE:
	ldr r1, [r5, #4]
	ands r1, r0
	mov r7, r8
	subs r3, r1, r7
	cmp r3, #0xf
	bgt _080D4B84
	cmp r3, #0
	bge _080D4BAC
	ldr r5, [r5, #0xc]
	cmp r5, r4
	bne _080D4ABE
_080D4AD4:
	adds r4, #8
	movs r0, #1
	add ip, r0
	mov r0, ip
	movs r1, #3
	ands r0, r1
	cmp r0, #0
	bne _080D4AB4
_080D4AE4:
	ldr r0, [sp, #4]
	ands r0, r1
	cmp r0, #0
	beq _080D4B24
	ldr r3, [sp, #4]
	subs r3, #1
	str r3, [sp, #4]
	subs r2, #8
	ldr r0, [r2, #8]
	cmp r0, r2
	beq _080D4AE4
_080D4AFA:
	lsls r6, r6, #1
	mov r4, sb
	ldr r1, [r4, #4]
	cmp r6, r1
	bhi _080D4B2E
	cmp r6, #0
	beq _080D4B2E
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	bne _080D4AA6
_080D4B10:
	movs r7, #4
	add ip, r7
	lsls r6, r6, #1
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	beq _080D4B10
	b _080D4AA6
	.align 2, 0
_080D4B20: .4byte gUnknown_08B1FA38
_080D4B24:
	mov r1, sb
	ldr r0, [r1, #4]
	bics r0, r6
	str r0, [r1, #4]
	b _080D4AFA
_080D4B2E:
	ldr r2, _080D4B6C @ 0x08B1FA38
	ldr r0, [r2, #8]
	ldr r0, [r0, #4]
	movs r4, #4
	rsbs r4, r4, #0
	ands r0, r4
	mov r7, r8
	subs r3, r0, r7
	cmp r0, r8
	blo _080D4B46
	cmp r3, #0xf
	bgt _080D4BC0
_080D4B46:
	ldr r0, [sp]
	mov r1, r8
	bl malloc_extend_top
	ldr r1, _080D4B6C @ 0x08B1FA38
	ldr r0, [r1, #8]
	ldr r0, [r0, #4]
	ands r0, r4
	mov r2, r8
	subs r3, r0, r2
	cmp r0, r8
	blo _080D4B62
	cmp r3, #0xf
	bgt _080D4BC0
_080D4B62:
	ldr r0, [sp]
	bl __malloc_unlock
	movs r0, #0
	b _080D4BE0
	.align 2, 0
_080D4B6C: .4byte gUnknown_08B1FA38
_080D4B70:
	ldr r6, [r5, #0xc]
	ldr r4, [r5, #8]
	str r6, [r4, #0xc]
	str r4, [r6, #8]
	adds r2, r5, r1
	ldr r0, [r2, #4]
	movs r1, #1
	orrs r0, r1
	str r0, [r2, #4]
	b _080D4BD6
_080D4B84:
	mov r4, r8
	adds r2, r5, r4
	movs r1, #1
	orrs r4, r1
	str r4, [r5, #4]
	ldr r6, [r5, #0xc]
	ldr r4, [r5, #8]
	str r6, [r4, #0xc]
	str r4, [r6, #8]
	mov r7, sl
	str r2, [r7, #0xc]
	str r2, [r7, #8]
	str r7, [r2, #0xc]
	str r7, [r2, #8]
	adds r0, r3, #0
	orrs r0, r1
	str r0, [r2, #4]
	adds r0, r2, r3
	str r3, [r0]
	b _080D4BD6
_080D4BAC:
	adds r2, r5, r1
	ldr r0, [r2, #4]
	movs r1, #1
	orrs r0, r1
	str r0, [r2, #4]
	ldr r6, [r5, #0xc]
	ldr r4, [r5, #8]
	str r6, [r4, #0xc]
	str r4, [r6, #8]
	b _080D4BD6
_080D4BC0:
	ldr r2, _080D4BEC @ 0x08B1FA38
	ldr r5, [r2, #8]
	movs r1, #1
	mov r0, r8
	orrs r0, r1
	str r0, [r5, #4]
	mov r4, r8
	adds r0, r5, r4
	str r0, [r2, #8]
	orrs r3, r1
	str r3, [r0, #4]
_080D4BD6:
	ldr r0, [sp]
	bl __malloc_unlock
	adds r0, r5, #0
	adds r0, #8
_080D4BE0:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_080D4BEC: .4byte gUnknown_08B1FA38
