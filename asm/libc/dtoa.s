    .INCLUDE "macro.inc"

    .SYNTAX UNIFIED

	THUMB_FUNC_START quorem
quorem: @ 0x080D305C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x18
	str r0, [sp]
	str r1, [sp, #4]
	ldr r7, [r1, #0x10]
	ldr r0, [r0, #0x10]
	cmp r0, r7
	bge _080D3078
	movs r0, #0
	b _080D31AC
_080D3078:
	ldr r0, [sp, #4]
	adds r0, #0x14
	mov r8, r0
	subs r7, #1
	lsls r0, r7, #2
	mov r1, r8
	adds r1, r1, r0
	str r1, [sp, #0xc]
	ldr r4, [sp]
	adds r4, #0x14
	adds r5, r4, r0
	ldr r1, [r1]
	adds r1, #1
	ldr r2, [r5]
	mov sl, r2
	mov r0, sl
	bl __udivsi3
	str r0, [sp, #8]
	mov r3, r8
	str r3, [sp, #0x14]
	str r4, [sp, #0x10]
	cmp r0, #0
	beq _080D3122
	movs r6, #0
	mov sb, r6
	ldr r0, _080D310C @ 0x0000FFFF
	mov ip, r0
_080D30B0:
	mov r2, r8
	adds r2, #4
	mov r8, r2
	subs r2, #4
	ldm r2!, {r1}
	adds r0, r1, #0
	mov r3, ip
	ands r0, r3
	ldr r2, [sp, #8]
	muls r0, r2, r0
	mov r3, sb
	adds r2, r0, r3
	lsrs r0, r1, #0x10
	ldr r3, [sp, #8]
	adds r1, r0, #0
	muls r1, r3, r1
	lsrs r0, r2, #0x10
	adds r3, r1, r0
	lsrs r0, r3, #0x10
	mov sb, r0
	ldr r0, [r4]
	mov r1, ip
	ands r0, r1
	ands r2, r1
	subs r0, r0, r2
	adds r2, r0, r6
	asrs r6, r2, #0x10
	ldr r0, [r4]
	lsrs r1, r0, #0x10
	mov r0, ip
	ands r3, r0
	subs r1, r1, r3
	adds r0, r1, r6
	asrs r6, r0, #0x10
	strh r0, [r4]
	strh r2, [r4, #2]
	adds r4, #4
	ldr r1, [sp, #0xc]
	cmp r8, r1
	bls _080D30B0
	mov r2, sl
	cmp r2, #0
	bne _080D3122
	ldr r4, [sp, #0x10]
	b _080D3112
	.align 2, 0
_080D310C: .4byte 0x0000FFFF
_080D3110:
	subs r7, #1
_080D3112:
	subs r5, #4
	cmp r5, r4
	bls _080D311E
	ldr r0, [r5]
	cmp r0, #0
	beq _080D3110
_080D311E:
	ldr r3, [sp]
	str r7, [r3, #0x10]
_080D3122:
	ldr r0, [sp]
	ldr r1, [sp, #4]
	bl __mcmp
	cmp r0, #0
	blt _080D31AA
	ldr r0, [sp, #8]
	adds r0, #1
	str r0, [sp, #8]
	movs r6, #0
	mov sb, r6
	ldr r4, [sp, #0x10]
	ldr r1, [sp, #0x14]
	mov r8, r1
	lsls r2, r7, #2
	mov sl, r2
	ldr r5, _080D3194 @ 0x0000FFFF
_080D3144:
	mov r3, r8
	adds r3, #4
	mov r8, r3
	subs r3, #4
	ldm r3!, {r1}
	adds r0, r1, #0
	ands r0, r5
	mov r3, sb
	adds r2, r0, r3
	lsrs r1, r1, #0x10
	lsrs r0, r2, #0x10
	adds r3, r1, r0
	lsrs r0, r3, #0x10
	mov sb, r0
	ldr r1, [r4]
	adds r0, r1, #0
	ands r0, r5
	ands r2, r5
	subs r0, r0, r2
	adds r2, r0, r6
	asrs r6, r2, #0x10
	lsrs r1, r1, #0x10
	ands r3, r5
	subs r1, r1, r3
	adds r0, r1, r6
	asrs r6, r0, #0x10
	strh r0, [r4]
	strh r2, [r4, #2]
	adds r4, #4
	ldr r1, [sp, #0xc]
	cmp r8, r1
	bls _080D3144
	ldr r4, [sp, #0x10]
	mov r2, sl
	adds r5, r4, r2
	ldr r0, [r5]
	cmp r0, #0
	bne _080D31AA
	b _080D319A
	.align 2, 0
_080D3194: .4byte 0x0000FFFF
_080D3198:
	subs r7, #1
_080D319A:
	subs r5, #4
	cmp r5, r4
	bls _080D31A6
	ldr r0, [r5]
	cmp r0, #0
	beq _080D3198
_080D31A6:
	ldr r3, [sp]
	str r7, [r3, #0x10]
_080D31AA:
	ldr r0, [sp, #8]
_080D31AC:
	add sp, #0x18
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7, pc}

	THUMB_FUNC_START _dtoa_r
_dtoa_r: @ 0x080D31B8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x84
	mov sl, r0
	str r3, [sp, #0xc]
	ldr r4, [sp, #0xac]
	str r1, [sp, #0x40]
	str r2, [sp, #0x44]
	ldr r2, [r0, #0x40]
	cmp r2, #0
	beq _080D31F0
	ldr r0, [r0, #0x44]
	str r0, [r2, #4]
	mov r0, sl
	ldr r1, [r0, #0x44]
	movs r0, #1
	lsls r0, r1
	str r0, [r2, #8]
	mov r0, sl
	adds r1, r2, #0
	bl _Bfree
	movs r0, #0
	mov r1, sl
	str r0, [r1, #0x40]
_080D31F0:
	movs r0, #0x80
	lsls r0, r0, #0x18
	ldr r1, [sp, #0x40]
	ands r0, r1
	cmp r0, #0
	beq _080D320C
	movs r0, #1
	str r0, [r4]
	ldr r0, _080D3208 @ 0x7FFFFFFF
	ands r1, r0
	str r1, [sp, #0x40]
	b _080D320E
	.align 2, 0
_080D3208: .4byte 0x7FFFFFFF
_080D320C:
	str r0, [r4]
_080D320E:
	ldr r1, _080D3250 @ 0x7FF00000
	ldr r2, [sp, #0x40]
	adds r0, r2, #0
	ands r0, r1
	cmp r0, r1
	bne _080D3264
	ldr r0, _080D3254 @ 0x0000270F
	ldr r3, [sp, #0xa8]
	str r0, [r3]
	ldr r0, _080D3258 @ 0x08587788
	mov sb, r0
	ldr r1, [sp, #0x44]
	cmp r1, #0
	bne _080D3236
	ldr r0, _080D325C @ 0x000FFFFF
	ands r2, r0
	cmp r2, #0
	bne _080D3236
	ldr r2, _080D3260 @ 0x0858777C
	mov sb, r2
_080D3236:
	ldr r3, [sp, #0xb0]
	cmp r3, #0
	beq _080D3288
	mov r1, sb
	ldrb r0, [r1, #3]
	adds r1, #3
	cmp r0, #0
	beq _080D3248
	adds r1, #5
_080D3248:
	ldr r2, [sp, #0xb0]
	str r1, [r2]
	b _080D3288
	.align 2, 0
_080D3250: .4byte 0x7FF00000
_080D3254: .4byte 0x0000270F
_080D3258: .4byte gUnknown_08587788
_080D325C: .4byte 0x000FFFFF
_080D3260: .4byte gUnknown_0858777C
_080D3264:
	ldr r3, _080D3294 @ 0x00000000
	ldr r2, _080D3290 @ 0x00000000
	ldr r0, [sp, #0x40]
	ldr r1, [sp, #0x44]
	bl __eqdf2
	cmp r0, #0
	bne _080D329C
	movs r0, #1
	ldr r3, [sp, #0xa8]
	str r0, [r3]
	ldr r0, _080D3298 @ 0x0858778C
	mov sb, r0
	ldr r1, [sp, #0xb0]
	cmp r1, #0
	beq _080D3288
	adds r0, #1
	str r0, [r1]
_080D3288:
	mov r0, sb
	bl _080D3EA2
	.align 2, 0
_080D3290: .4byte 0x00000000
_080D3294: .4byte 0x00000000
_080D3298: .4byte gUnknown_0858778C
_080D329C:
	add r0, sp, #8
	str r0, [sp]
	mov r0, sl
	ldr r1, [sp, #0x40]
	ldr r2, [sp, #0x44]
	add r3, sp, #4
	bl _d2b
	str r0, [sp, #0x5c]
	ldr r2, [sp, #0x40]
	lsls r0, r2, #1
	lsrs r0, r0, #0x15
	mov r8, r0
	cmp r0, #0
	beq _080D32EC
	ldr r0, [sp, #0x40]
	ldr r1, [sp, #0x44]
	str r0, [sp, #0x48]
	str r1, [sp, #0x4c]
	ldr r0, _080D32E0 @ 0x000FFFFF
	ldr r1, [sp, #0x48]
	ands r1, r0
	str r1, [sp, #0x48]
	ldr r0, _080D32E4 @ 0x3FF00000
	adds r2, r1, #0
	orrs r2, r0
	str r2, [sp, #0x48]
	ldr r3, _080D32E8 @ 0xFFFFFC01
	add r8, r3
	movs r0, #0
	str r0, [sp, #0x58]
	ldr r6, [sp, #8]
	b _080D334C
	.align 2, 0
_080D32E0: .4byte 0x000FFFFF
_080D32E4: .4byte 0x3FF00000
_080D32E8: .4byte 0xFFFFFC01
_080D32EC:
	ldr r1, [sp, #8]
	ldr r0, [sp, #4]
	adds r2, r1, r0
	ldr r3, _080D3314 @ 0x00000432
	adds r3, r3, r2
	mov r8, r3
	adds r6, r1, #0
	cmp r3, #0x20
	ble _080D331C
	movs r0, #0x40
	subs r0, r0, r3
	ldr r4, [sp, #0x40]
	lsls r4, r0
	ldr r1, _080D3318 @ 0x00000412
	adds r0, r2, r1
	ldr r2, [sp, #0x44]
	lsrs r2, r0
	adds r0, r2, #0
	orrs r4, r0
	b _080D3326
	.align 2, 0
_080D3314: .4byte 0x00000432
_080D3318: .4byte 0x00000412
_080D331C:
	movs r0, #0x20
	mov r3, r8
	subs r0, r0, r3
	ldr r4, [sp, #0x44]
	lsls r4, r0
_080D3326:
	adds r0, r4, #0
	bl __floatsidf
	cmp r4, #0
	bge _080D3338
	ldr r3, _080D33FC @ 0x00000000
	ldr r2, _080D33F8 @ 0x41F00000
	bl __adddf3
_080D3338:
	str r0, [sp, #0x48]
	str r1, [sp, #0x4c]
	ldr r1, _080D3400 @ 0xFE100000
	ldr r0, [sp, #0x48]
	adds r1, r0, r1
	str r1, [sp, #0x48]
	ldr r2, _080D3404 @ 0xFFFFFBCD
	add r8, r2
	movs r3, #1
	str r3, [sp, #0x58]
_080D334C:
	ldr r2, _080D3408 @ 0x3FF80000
	ldr r3, _080D340C @ 0x00000000
	ldr r0, [sp, #0x48]
	ldr r1, [sp, #0x4c]
	bl __subdf3
	ldr r2, _080D3410 @ 0x3FD287A7
	ldr r3, _080D3414 @ 0x636F4361
	bl __muldf3
	ldr r2, _080D3418 @ 0x3FC68A28
	ldr r3, _080D341C @ 0x8B60C8B3
	bl __adddf3
	adds r5, r1, #0
	adds r4, r0, #0
	mov r0, r8
	bl __floatsidf
	ldr r2, _080D3420 @ 0x3FD34413
	ldr r3, _080D3424 @ 0x509F79FB
	bl __muldf3
	adds r3, r1, #0
	adds r2, r0, #0
	adds r1, r5, #0
	adds r0, r4, #0
	bl __adddf3
	str r0, [sp, #0x6c]
	str r1, [sp, #0x70]
	bl __fixdfsi
	str r0, [sp, #0x24]
	ldr r2, _080D3428 @ 0x00000000
	ldr r3, _080D342C @ 0x00000000
	ldr r0, [sp, #0x6c]
	ldr r1, [sp, #0x70]
	bl __ltdf2
	cmp r0, #0
	bge _080D33BC
	ldr r0, [sp, #0x24]
	bl __floatsidf
	adds r3, r1, #0
	adds r2, r0, #0
	ldr r0, [sp, #0x6c]
	ldr r1, [sp, #0x70]
	bl __nedf2
	cmp r0, #0
	beq _080D33BC
	ldr r0, [sp, #0x24]
	subs r0, #1
	str r0, [sp, #0x24]
_080D33BC:
	movs r1, #1
	str r1, [sp, #0x2c]
	ldr r2, [sp, #0x24]
	cmp r2, #0x16
	bhi _080D33E6
	ldr r1, _080D3430 @ 0x085877DC
	lsls r0, r2, #3
	adds r0, r0, r1
	ldr r2, [r0]
	ldr r3, [r0, #4]
	ldr r0, [sp, #0x40]
	ldr r1, [sp, #0x44]
	bl __ltdf2
	cmp r0, #0
	bge _080D33E2
	ldr r3, [sp, #0x24]
	subs r3, #1
	str r3, [sp, #0x24]
_080D33E2:
	movs r0, #0
	str r0, [sp, #0x2c]
_080D33E6:
	mov r1, r8
	subs r0, r6, r1
	subs r4, r0, #1
	cmp r4, #0
	blt _080D3434
	movs r2, #0
	str r2, [sp, #0x10]
	str r4, [sp, #0x34]
	b _080D343C
	.align 2, 0
_080D33F8: .4byte 0x41F00000
_080D33FC: .4byte 0x00000000
_080D3400: .4byte 0xFE100000
_080D3404: .4byte 0xFFFFFBCD
_080D3408: .4byte 0x3FF80000
_080D340C: .4byte 0x00000000
_080D3410: .4byte 0x3FD287A7
_080D3414: .4byte 0x636F4361
_080D3418: .4byte 0x3FC68A28
_080D341C: .4byte 0x8B60C8B3
_080D3420: .4byte 0x3FD34413
_080D3424: .4byte 0x509F79FB
_080D3428: .4byte 0x00000000
_080D342C: .4byte 0x00000000
_080D3430: .4byte gUnknown_085877DC
_080D3434:
	rsbs r4, r4, #0
	str r4, [sp, #0x10]
	movs r3, #0
	str r3, [sp, #0x34]
_080D343C:
	ldr r0, [sp, #0x24]
	cmp r0, #0
	blt _080D3450
	movs r1, #0
	str r1, [sp, #0x14]
	str r0, [sp, #0x38]
	ldr r2, [sp, #0x34]
	adds r2, r2, r0
	str r2, [sp, #0x34]
	b _080D3460
_080D3450:
	ldr r3, [sp, #0x10]
	ldr r0, [sp, #0x24]
	subs r3, r3, r0
	str r3, [sp, #0x10]
	rsbs r1, r0, #0
	str r1, [sp, #0x14]
	movs r2, #0
	str r2, [sp, #0x38]
_080D3460:
	ldr r3, [sp, #0xc]
	cmp r3, #9
	bls _080D346A
	movs r0, #0
	str r0, [sp, #0xc]
_080D346A:
	movs r5, #1
	ldr r1, [sp, #0xc]
	cmp r1, #5
	ble _080D3478
	subs r1, #4
	str r1, [sp, #0xc]
	movs r5, #0
_080D3478:
	movs r2, #1
	str r2, [sp, #0x30]
	ldr r3, [sp, #0xc]
	cmp r3, #5
	bhi _080D34F2
	lsls r0, r3, #2
	ldr r1, _080D348C @ _080D3490
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080D348C: .4byte _080D3490
_080D3490: @ jump table
	.4byte _080D34A8 @ case 0
	.4byte _080D34A8 @ case 1
	.4byte _080D34BA @ case 2
	.4byte _080D34D6 @ case 3
	.4byte _080D34BE @ case 4
	.4byte _080D34DA @ case 5
_080D34A8:
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [sp, #0x18]
	str r0, [sp, #0x20]
	movs r1, #0x12
	mov r8, r1
	movs r2, #0
	str r2, [sp, #0xa4]
	b _080D34F2
_080D34BA:
	movs r3, #0
	str r3, [sp, #0x30]
_080D34BE:
	ldr r0, [sp, #0xa4]
	cmp r0, #0
	bgt _080D34C8
	movs r1, #1
	str r1, [sp, #0xa4]
_080D34C8:
	ldr r2, [sp, #0xa4]
	mov r8, r2
	mov r3, r8
	str r3, [sp, #0x20]
	mov r0, r8
	str r0, [sp, #0x18]
	b _080D34F2
_080D34D6:
	movs r1, #0
	str r1, [sp, #0x30]
_080D34DA:
	ldr r2, [sp, #0xa4]
	ldr r3, [sp, #0x24]
	adds r0, r2, r3
	adds r1, r0, #1
	mov r8, r1
	mov r2, r8
	str r2, [sp, #0x18]
	str r0, [sp, #0x20]
	cmp r1, #0
	bgt _080D34F2
	movs r3, #1
	mov r8, r3
_080D34F2:
	movs r4, #4
	movs r0, #0
	mov r1, sl
	str r0, [r1, #0x44]
	mov r2, r8
	cmp r2, #0x17
	bls _080D3512
	movs r1, #0
_080D3502:
	adds r1, #1
	lsls r4, r4, #1
	adds r0, r4, #0
	adds r0, #0x14
	cmp r0, r8
	bls _080D3502
	mov r3, sl
	str r1, [r3, #0x44]
_080D3512:
	mov r0, sl
	ldr r1, [r0, #0x44]
	bl _Balloc
	mov r1, sl
	str r0, [r1, #0x40]
	str r0, [sp, #0x74]
	mov sb, r0
	ldr r2, [sp, #0x18]
	cmp r2, #0xe
	bls _080D352A
	b _080D389C
_080D352A:
	cmp r5, #0
	bne _080D3530
	b _080D389C
_080D3530:
	ldr r0, [sp, #0x40]
	ldr r1, [sp, #0x44]
	str r0, [sp, #0x78]
	str r1, [sp, #0x7c]
	str r0, [sp, #0x48]
	str r1, [sp, #0x4c]
	ldr r1, [sp, #0x24]
	str r1, [sp, #0x28]
	str r2, [sp, #0x1c]
	movs r7, #2
	cmp r1, #0
	ble _080D35C0
	ldr r0, _080D35B8 @ 0x085877DC
	movs r2, #0xf
	ands r1, r2
	lsls r1, r1, #3
	adds r3, r1, r0
	ldr r0, [r3]
	ldr r1, [r3, #4]
	str r0, [sp, #0x6c]
	str r1, [sp, #0x70]
	ldr r1, [sp, #0x24]
	asrs r4, r1, #4
	movs r0, #0x10
	ands r0, r4
	cmp r0, #0
	beq _080D357C
	ands r4, r2
	ldr r0, _080D35BC @ 0x085878A4
	ldr r2, [r0, #0x20]
	ldr r3, [r0, #0x24]
	ldr r0, [sp, #0x78]
	ldr r1, [sp, #0x7c]
	bl __divdf3
	str r0, [sp, #0x40]
	str r1, [sp, #0x44]
	movs r7, #3
_080D357C:
	cmp r4, #0
	beq _080D35A4
	ldr r5, _080D35BC @ 0x085878A4
_080D3582:
	movs r0, #1
	ands r0, r4
	cmp r0, #0
	beq _080D359C
	adds r7, #1
	ldr r2, [r5]
	ldr r3, [r5, #4]
	ldr r0, [sp, #0x6c]
	ldr r1, [sp, #0x70]
	bl __muldf3
	str r0, [sp, #0x6c]
	str r1, [sp, #0x70]
_080D359C:
	asrs r4, r4, #1
	adds r5, #8
	cmp r4, #0
	bne _080D3582
_080D35A4:
	ldr r0, [sp, #0x40]
	ldr r1, [sp, #0x44]
	ldr r2, [sp, #0x6c]
	ldr r3, [sp, #0x70]
	bl __divdf3
	str r0, [sp, #0x40]
	str r1, [sp, #0x44]
	b _080D360C
	.align 2, 0
_080D35B8: .4byte gUnknown_085877DC
_080D35BC: .4byte gUnknown_085878A4
_080D35C0:
	ldr r2, [sp, #0x24]
	rsbs r6, r2, #0
	cmp r6, #0
	beq _080D360C
	ldr r1, _080D36B4 @ 0x085877DC
	movs r0, #0xf
	ands r0, r6
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, [r0, #4]
	ldr r0, [r0]
	ldr r2, [sp, #0x78]
	ldr r3, [sp, #0x7c]
	bl __muldf3
	str r0, [sp, #0x40]
	str r1, [sp, #0x44]
	asrs r4, r6, #4
	cmp r4, #0
	beq _080D360C
	ldr r5, _080D36B8 @ 0x085878A4
_080D35EA:
	movs r0, #1
	ands r0, r4
	cmp r0, #0
	beq _080D3604
	adds r7, #1
	ldr r0, [r5]
	ldr r1, [r5, #4]
	ldr r2, [sp, #0x40]
	ldr r3, [sp, #0x44]
	bl __muldf3
	str r0, [sp, #0x40]
	str r1, [sp, #0x44]
_080D3604:
	asrs r4, r4, #1
	adds r5, #8
	cmp r4, #0
	bne _080D35EA
_080D360C:
	ldr r3, [sp, #0x2c]
	cmp r3, #0
	beq _080D364A
	ldr r2, _080D36BC @ 0x3FF00000
	ldr r3, _080D36C0 @ 0x00000000
	ldr r0, [sp, #0x40]
	ldr r1, [sp, #0x44]
	bl __ltdf2
	cmp r0, #0
	bge _080D364A
	ldr r0, [sp, #0x18]
	cmp r0, #0
	ble _080D364A
	ldr r1, [sp, #0x20]
	cmp r1, #0
	bgt _080D3630
	b _080D3888
_080D3630:
	str r1, [sp, #0x18]
	ldr r2, [sp, #0x24]
	subs r2, #1
	str r2, [sp, #0x24]
	ldr r0, _080D36C4 @ 0x40240000
	ldr r1, _080D36C8 @ 0x00000000
	ldr r2, [sp, #0x40]
	ldr r3, [sp, #0x44]
	bl __muldf3
	str r0, [sp, #0x40]
	str r1, [sp, #0x44]
	adds r7, #1
_080D364A:
	adds r0, r7, #0
	bl __floatsidf
	ldr r2, [sp, #0x40]
	ldr r3, [sp, #0x44]
	bl __muldf3
	ldr r2, _080D36CC @ 0x401C0000
	ldr r3, _080D36D0 @ 0x00000000
	bl __adddf3
	str r0, [sp, #0x50]
	str r1, [sp, #0x54]
	ldr r0, _080D36D4 @ 0xFCC00000
	ldr r3, [sp, #0x50]
	adds r0, r3, r0
	str r0, [sp, #0x50]
	ldr r1, [sp, #0x18]
	cmp r1, #0
	bne _080D36E0
	movs r2, #0
	str r2, [sp, #0x64]
	movs r3, #0
	str r3, [sp, #0x68]
	ldr r2, _080D36D8 @ 0x40140000
	ldr r3, _080D36DC @ 0x00000000
	ldr r0, [sp, #0x40]
	ldr r1, [sp, #0x44]
	bl __subdf3
	adds r5, r1, #0
	adds r4, r0, #0
	ldr r2, [sp, #0x50]
	ldr r3, [sp, #0x54]
	bl __gtdf2
	cmp r0, #0
	ble _080D3698
	b _080D3C12
_080D3698:
	ldr r0, [sp, #0x50]
	ldr r1, [sp, #0x54]
	bl __negdf2
	adds r3, r1, #0
	adds r2, r0, #0
	adds r1, r5, #0
	adds r0, r4, #0
	bl __ltdf2
	cmp r0, #0
	bge _080D36B2
	b _080D3C0A
_080D36B2:
	b _080D3888
	.align 2, 0
_080D36B4: .4byte gUnknown_085877DC
_080D36B8: .4byte gUnknown_085878A4
_080D36BC: .4byte 0x3FF00000
_080D36C0: .4byte 0x00000000
_080D36C4: .4byte 0x40240000
_080D36C8: .4byte 0x00000000
_080D36CC: .4byte 0x401C0000
_080D36D0: .4byte 0x00000000
_080D36D4: .4byte 0xFCC00000
_080D36D8: .4byte 0x40140000
_080D36DC: .4byte 0x00000000
_080D36E0:
	ldr r0, [sp, #0x30]
	cmp r0, #0
	beq _080D37B0
	ldr r1, _080D3710 @ 0x085877DC
	ldr r0, [sp, #0x18]
	subs r0, #1
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r2, [r0]
	ldr r3, [r0, #4]
	ldr r0, _080D3714 @ 0x3FE00000
	ldr r1, _080D3718 @ 0x00000000
	bl __divdf3
	ldr r2, [sp, #0x50]
	ldr r3, [sp, #0x54]
	bl __subdf3
	str r0, [sp, #0x50]
	str r1, [sp, #0x54]
	movs r1, #0
	mov r8, r1
	b _080D373C
	.align 2, 0
_080D3710: .4byte gUnknown_085877DC
_080D3714: .4byte 0x3FE00000
_080D3718: .4byte 0x00000000
_080D371C:
	ldr r1, _080D37A4 @ 0x00000000
	ldr r0, _080D37A0 @ 0x40240000
	ldr r2, [sp, #0x50]
	ldr r3, [sp, #0x54]
	bl __muldf3
	str r0, [sp, #0x50]
	str r1, [sp, #0x54]
	ldr r1, _080D37A4 @ 0x00000000
	ldr r0, _080D37A0 @ 0x40240000
	adds r3, r5, #0
	adds r2, r4, #0
	bl __muldf3
	str r0, [sp, #0x40]
	str r1, [sp, #0x44]
_080D373C:
	ldr r0, [sp, #0x40]
	ldr r1, [sp, #0x44]
	bl __fixdfsi
	adds r6, r0, #0
	bl __floatsidf
	adds r3, r1, #0
	adds r2, r0, #0
	ldr r0, [sp, #0x40]
	ldr r1, [sp, #0x44]
	bl __subdf3
	adds r5, r1, #0
	adds r4, r0, #0
	adds r0, r6, #0
	adds r0, #0x30
	mov r2, sb
	strb r0, [r2]
	movs r3, #1
	add sb, r3
	adds r1, r5, #0
	adds r0, r4, #0
	ldr r2, [sp, #0x50]
	ldr r3, [sp, #0x54]
	bl __ltdf2
	cmp r0, #0
	bge _080D3778
	b _080D3E82
_080D3778:
	ldr r0, _080D37A8 @ 0x3FF00000
	ldr r1, _080D37AC @ 0x00000000
	adds r3, r5, #0
	adds r2, r4, #0
	bl __subdf3
	ldr r2, [sp, #0x50]
	ldr r3, [sp, #0x54]
	bl __ltdf2
	cmp r0, #0
	bge _080D3792
	b _080D399C
_080D3792:
	movs r0, #1
	add r8, r0
	ldr r1, [sp, #0x18]
	cmp r8, r1
	blt _080D371C
	b _080D3888
	.align 2, 0
_080D37A0: .4byte 0x40240000
_080D37A4: .4byte 0x00000000
_080D37A8: .4byte 0x3FF00000
_080D37AC: .4byte 0x00000000
_080D37B0:
	ldr r1, _080D37D0 @ 0x085877DC
	ldr r0, [sp, #0x18]
	subs r0, #1
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, [r0, #4]
	ldr r0, [r0]
	ldr r2, [sp, #0x50]
	ldr r3, [sp, #0x54]
	bl __muldf3
	str r0, [sp, #0x50]
	str r1, [sp, #0x54]
	movs r2, #1
	mov r8, r2
	b _080D37E8
	.align 2, 0
_080D37D0: .4byte gUnknown_085877DC
_080D37D4:
	movs r3, #1
	add r8, r3
	ldr r1, _080D387C @ 0x00000000
	ldr r0, _080D3878 @ 0x40240000
	adds r3, r5, #0
	adds r2, r4, #0
	bl __muldf3
	str r0, [sp, #0x40]
	str r1, [sp, #0x44]
_080D37E8:
	ldr r0, [sp, #0x40]
	ldr r1, [sp, #0x44]
	bl __fixdfsi
	adds r6, r0, #0
	bl __floatsidf
	adds r3, r1, #0
	adds r2, r0, #0
	ldr r0, [sp, #0x40]
	ldr r1, [sp, #0x44]
	bl __subdf3
	adds r5, r1, #0
	adds r4, r0, #0
	adds r0, r6, #0
	adds r0, #0x30
	mov r1, sb
	strb r0, [r1]
	movs r2, #1
	add sb, r2
	ldr r3, [sp, #0x18]
	cmp r8, r3
	bne _080D37D4
	ldr r6, _080D3880 @ 0x3FE00000
	ldr r7, _080D3884 @ 0x00000000
	adds r1, r7, #0
	adds r0, r6, #0
	ldr r2, [sp, #0x50]
	ldr r3, [sp, #0x54]
	bl __adddf3
	adds r3, r1, #0
	adds r2, r0, #0
	adds r1, r5, #0
	adds r0, r4, #0
	bl __gtdf2
	cmp r0, #0
	ble _080D383A
	b _080D399C
_080D383A:
	adds r1, r7, #0
	adds r0, r6, #0
	ldr r2, [sp, #0x50]
	ldr r3, [sp, #0x54]
	bl __subdf3
	adds r3, r1, #0
	adds r2, r0, #0
	adds r1, r5, #0
	adds r0, r4, #0
	bl __ltdf2
	cmp r0, #0
	bge _080D3888
	movs r0, #1
	rsbs r0, r0, #0
	add sb, r0
	mov r1, sb
	ldrb r1, [r1]
	cmp r1, #0x30
	beq _080D3866
	b _080D39C2
_080D3866:
	movs r2, #1
	rsbs r2, r2, #0
	add sb, r2
	mov r3, sb
	ldrb r3, [r3]
	cmp r3, #0x30
	beq _080D3866
	b _080D39C2
	.align 2, 0
_080D3878: .4byte 0x40240000
_080D387C: .4byte 0x00000000
_080D3880: .4byte 0x3FE00000
_080D3884: .4byte 0x00000000
_080D3888:
	ldr r1, [sp, #0x74]
	mov sb, r1
	ldr r2, [sp, #0x48]
	ldr r3, [sp, #0x4c]
	str r2, [sp, #0x40]
	str r3, [sp, #0x44]
	ldr r3, [sp, #0x28]
	str r3, [sp, #0x24]
	ldr r0, [sp, #0x1c]
	str r0, [sp, #0x18]
_080D389C:
	ldr r0, [sp, #4]
	cmp r0, #0
	bge _080D38A4
	b _080D39D8
_080D38A4:
	ldr r1, [sp, #0x24]
	cmp r1, #0xe
	ble _080D38AC
	b _080D39D8
_080D38AC:
	ldr r1, _080D38F8 @ 0x085877DC
	ldr r2, [sp, #0x24]
	lsls r0, r2, #3
	adds r0, r0, r1
	ldr r1, [r0]
	ldr r2, [r0, #4]
	str r1, [sp, #0x6c]
	str r2, [sp, #0x70]
	ldr r2, [sp, #0xa4]
	cmp r2, #0
	bge _080D3904
	ldr r3, [sp, #0x18]
	cmp r3, #0
	bgt _080D3904
	movs r0, #0
	str r0, [sp, #0x64]
	movs r1, #0
	str r1, [sp, #0x68]
	cmp r3, #0
	bge _080D38D6
	b _080D3C0A
_080D38D6:
	ldr r2, _080D38FC @ 0x40140000
	ldr r3, _080D3900 @ 0x00000000
	ldr r0, [sp, #0x6c]
	ldr r1, [sp, #0x70]
	bl __muldf3
	adds r3, r1, #0
	adds r2, r0, #0
	ldr r0, [sp, #0x40]
	ldr r1, [sp, #0x44]
	bl __ledf2
	cmp r0, #0
	bgt _080D38F4
	b _080D3C0A
_080D38F4:
	b _080D3C12
	.align 2, 0
_080D38F8: .4byte gUnknown_085877DC
_080D38FC: .4byte 0x40140000
_080D3900: .4byte 0x00000000
_080D3904:
	movs r2, #1
	mov r8, r2
	b _080D3928
_080D390A:
	ldr r1, _080D39CC @ 0x00000000
	ldr r0, _080D39C8 @ 0x40240000
	bl __muldf3
	str r0, [sp, #0x40]
	str r1, [sp, #0x44]
	ldr r2, _080D39D0 @ 0x00000000
	ldr r3, _080D39D4 @ 0x00000000
	bl __eqdf2
	cmp r0, #0
	bne _080D3924
	b _080D3E82
_080D3924:
	movs r3, #1
	add r8, r3
_080D3928:
	ldr r0, [sp, #0x40]
	ldr r1, [sp, #0x44]
	ldr r2, [sp, #0x6c]
	ldr r3, [sp, #0x70]
	bl __divdf3
	bl __fixdfsi
	adds r6, r0, #0
	bl __floatsidf
	ldr r2, [sp, #0x6c]
	ldr r3, [sp, #0x70]
	bl __muldf3
	adds r3, r1, #0
	adds r2, r0, #0
	ldr r0, [sp, #0x40]
	ldr r1, [sp, #0x44]
	bl __subdf3
	adds r3, r1, #0
	adds r2, r0, #0
	adds r0, r6, #0
	adds r0, #0x30
	mov r1, sb
	strb r0, [r1]
	movs r0, #1
	add sb, r0
	ldr r1, [sp, #0x18]
	cmp r8, r1
	bne _080D390A
	adds r1, r3, #0
	adds r0, r2, #0
	bl __adddf3
	adds r5, r1, #0
	adds r4, r0, #0
	ldr r2, [sp, #0x6c]
	ldr r3, [sp, #0x70]
	bl __gtdf2
	cmp r0, #0
	bgt _080D399C
	adds r1, r5, #0
	adds r0, r4, #0
	ldr r2, [sp, #0x6c]
	ldr r3, [sp, #0x70]
	bl __eqdf2
	cmp r0, #0
	beq _080D3992
	b _080D3E82
_080D3992:
	movs r0, #1
	ands r0, r6
	cmp r0, #0
	bne _080D399C
	b _080D3E82
_080D399C:
	movs r0, #0x30
_080D399E:
	movs r2, #1
	rsbs r2, r2, #0
	add sb, r2
	mov r3, sb
	ldrb r3, [r3]
	cmp r3, #0x39
	bne _080D39BA
	ldr r1, [sp, #0x74]
	cmp sb, r1
	bne _080D399E
	ldr r2, [sp, #0x24]
	adds r2, #1
	str r2, [sp, #0x24]
	strb r0, [r1]
_080D39BA:
	mov r3, sb
	ldrb r0, [r3]
	adds r0, #1
	strb r0, [r3]
_080D39C2:
	movs r0, #1
	add sb, r0
	b _080D3E82
	.align 2, 0
_080D39C8: .4byte 0x40240000
_080D39CC: .4byte 0x00000000
_080D39D0: .4byte 0x00000000
_080D39D4: .4byte 0x00000000
_080D39D8:
	ldr r5, [sp, #0x10]
	ldr r6, [sp, #0x14]
	movs r1, #0
	str r1, [sp, #0x60]
	movs r2, #0
	str r2, [sp, #0x64]
	ldr r3, [sp, #0x30]
	cmp r3, #0
	beq _080D3A4E
	ldr r1, [sp, #0xc]
	cmp r1, #1
	bgt _080D3A0C
	ldr r2, [sp, #0x58]
	cmp r2, #0
	beq _080D3A04
	ldr r3, _080D3A00 @ 0x00000433
	adds r3, r3, r0
	mov r8, r3
	b _080D3A38
	.align 2, 0
_080D3A00: .4byte 0x00000433
_080D3A04:
	ldr r1, [sp, #8]
	movs r0, #0x36
	subs r0, r0, r1
	b _080D3A36
_080D3A0C:
	ldr r4, [sp, #0x18]
	subs r4, #1
	ldr r0, [sp, #0x14]
	cmp r0, r4
	blt _080D3A1A
	subs r6, r0, r4
	b _080D3A2A
_080D3A1A:
	ldr r1, [sp, #0x14]
	subs r4, r4, r1
	ldr r2, [sp, #0x38]
	adds r2, r2, r4
	str r2, [sp, #0x38]
	adds r1, r1, r4
	str r1, [sp, #0x14]
	movs r6, #0
_080D3A2A:
	ldr r3, [sp, #0x18]
	mov r8, r3
	cmp r3, #0
	bge _080D3A38
	subs r5, r5, r3
	movs r0, #0
_080D3A36:
	mov r8, r0
_080D3A38:
	ldr r1, [sp, #0x10]
	add r1, r8
	str r1, [sp, #0x10]
	ldr r2, [sp, #0x34]
	add r2, r8
	str r2, [sp, #0x34]
	mov r0, sl
	movs r1, #1
	bl _i2b
	str r0, [sp, #0x64]
_080D3A4E:
	cmp r5, #0
	ble _080D3A70
	ldr r3, [sp, #0x34]
	cmp r3, #0
	ble _080D3A70
	mov r8, r3
	cmp r8, r5
	ble _080D3A60
	mov r8, r5
_080D3A60:
	ldr r0, [sp, #0x10]
	mov r1, r8
	subs r0, r0, r1
	str r0, [sp, #0x10]
	subs r5, r5, r1
	ldr r2, [sp, #0x34]
	subs r2, r2, r1
	str r2, [sp, #0x34]
_080D3A70:
	ldr r3, [sp, #0x14]
	cmp r3, #0
	ble _080D3ABE
	ldr r0, [sp, #0x30]
	cmp r0, #0
	beq _080D3AB2
	cmp r6, #0
	ble _080D3AA2
	mov r0, sl
	ldr r1, [sp, #0x64]
	adds r2, r6, #0
	bl _pow5mult
	str r0, [sp, #0x64]
	mov r0, sl
	ldr r1, [sp, #0x64]
	ldr r2, [sp, #0x5c]
	bl _multiply
	adds r4, r0, #0
	mov r0, sl
	ldr r1, [sp, #0x5c]
	bl _Bfree
	str r4, [sp, #0x5c]
_080D3AA2:
	ldr r1, [sp, #0x14]
	subs r4, r1, r6
	cmp r4, #0
	beq _080D3ABE
	mov r0, sl
	ldr r1, [sp, #0x5c]
	adds r2, r4, #0
	b _080D3AB8
_080D3AB2:
	mov r0, sl
	ldr r1, [sp, #0x5c]
	ldr r2, [sp, #0x14]
_080D3AB8:
	bl _pow5mult
	str r0, [sp, #0x5c]
_080D3ABE:
	mov r0, sl
	movs r1, #1
	bl _i2b
	str r0, [sp, #0x68]
	ldr r2, [sp, #0x38]
	cmp r2, #0
	ble _080D3AD8
	mov r0, sl
	ldr r1, [sp, #0x68]
	bl _pow5mult
	str r0, [sp, #0x68]
_080D3AD8:
	ldr r3, [sp, #0xc]
	cmp r3, #1
	bgt _080D3B14
	ldr r0, [sp, #0x44]
	cmp r0, #0
	bne _080D3B10
	ldr r0, _080D3B08 @ 0x000FFFFF
	ldr r1, [sp, #0x40]
	ands r0, r1
	cmp r0, #0
	bne _080D3B10
	ldr r0, _080D3B0C @ 0x7FF00000
	ands r1, r0
	cmp r1, #0
	beq _080D3B10
	ldr r1, [sp, #0x10]
	adds r1, #1
	str r1, [sp, #0x10]
	ldr r2, [sp, #0x34]
	adds r2, #1
	str r2, [sp, #0x34]
	movs r3, #1
	str r3, [sp, #0x3c]
	b _080D3B14
	.align 2, 0
_080D3B08: .4byte 0x000FFFFF
_080D3B0C: .4byte 0x7FF00000
_080D3B10:
	movs r0, #0
	str r0, [sp, #0x3c]
_080D3B14:
	ldr r1, [sp, #0x38]
	cmp r1, #0
	beq _080D3B40
	ldr r2, [sp, #0x68]
	ldr r1, [r2, #0x10]
	subs r1, #1
	lsls r1, r1, #2
	adds r0, r2, #0
	adds r0, #0x14
	adds r0, r0, r1
	ldr r0, [r0]
	bl _hi0bits
	ldr r1, [sp, #0x34]
	adds r1, #0x20
	subs r1, r1, r0
	mov r8, r1
	movs r0, #0x1f
	mov r3, r8
	ands r3, r0
	mov r8, r3
	b _080D3B4E
_080D3B40:
	ldr r0, [sp, #0x34]
	adds r0, #1
	mov r8, r0
	movs r0, #0x1f
	mov r1, r8
	ands r1, r0
	mov r8, r1
_080D3B4E:
	mov r2, r8
	cmp r2, #0
	beq _080D3B5A
	movs r0, #0x20
	subs r2, r0, r2
	mov r8, r2
_080D3B5A:
	mov r3, r8
	cmp r3, #4
	ble _080D3B66
	movs r0, #4
	rsbs r0, r0, #0
	b _080D3B6E
_080D3B66:
	mov r3, r8
	cmp r3, #3
	bgt _080D3B7E
	movs r0, #0x1c
_080D3B6E:
	add r8, r0
	ldr r1, [sp, #0x10]
	add r1, r8
	str r1, [sp, #0x10]
	add r5, r8
	ldr r2, [sp, #0x34]
	add r2, r8
	str r2, [sp, #0x34]
_080D3B7E:
	ldr r3, [sp, #0x10]
	cmp r3, #0
	ble _080D3B90
	mov r0, sl
	ldr r1, [sp, #0x5c]
	adds r2, r3, #0
	bl _lshift
	str r0, [sp, #0x5c]
_080D3B90:
	ldr r0, [sp, #0x34]
	cmp r0, #0
	ble _080D3BA2
	mov r0, sl
	ldr r1, [sp, #0x68]
	ldr r2, [sp, #0x34]
	bl _lshift
	str r0, [sp, #0x68]
_080D3BA2:
	ldr r1, [sp, #0x2c]
	cmp r1, #0
	beq _080D3BE0
	ldr r0, [sp, #0x5c]
	ldr r1, [sp, #0x68]
	bl __mcmp
	cmp r0, #0
	bge _080D3BE0
	ldr r2, [sp, #0x24]
	subs r2, #1
	str r2, [sp, #0x24]
	mov r0, sl
	ldr r1, [sp, #0x5c]
	movs r2, #0xa
	movs r3, #0
	bl _multadd
	str r0, [sp, #0x5c]
	ldr r3, [sp, #0x30]
	cmp r3, #0
	beq _080D3BDC
	mov r0, sl
	ldr r1, [sp, #0x64]
	movs r2, #0xa
	movs r3, #0
	bl _multadd
	str r0, [sp, #0x64]
_080D3BDC:
	ldr r0, [sp, #0x20]
	str r0, [sp, #0x18]
_080D3BE0:
	ldr r1, [sp, #0x18]
	cmp r1, #0
	bgt _080D3C24
	ldr r2, [sp, #0xc]
	cmp r2, #2
	ble _080D3C24
	cmp r1, #0
	blt _080D3C0A
	mov r0, sl
	ldr r1, [sp, #0x68]
	movs r2, #5
	movs r3, #0
	bl _multadd
	str r0, [sp, #0x68]
	ldr r0, [sp, #0x5c]
	ldr r1, [sp, #0x68]
	bl __mcmp
	cmp r0, #0
	bgt _080D3C12
_080D3C0A:
	ldr r3, [sp, #0xa4]
	mvns r3, r3
	str r3, [sp, #0x24]
	b _080D3E5A
_080D3C12:
	movs r0, #0x31
	mov r1, sb
	strb r0, [r1]
	movs r2, #1
	add sb, r2
	ldr r3, [sp, #0x24]
	adds r3, #1
	str r3, [sp, #0x24]
	b _080D3E5A
_080D3C24:
	ldr r0, [sp, #0x30]
	cmp r0, #0
	bne _080D3C2C
	b _080D3DA2
_080D3C2C:
	cmp r5, #0
	ble _080D3C3C
	mov r0, sl
	ldr r1, [sp, #0x64]
	adds r2, r5, #0
	bl _lshift
	str r0, [sp, #0x64]
_080D3C3C:
	ldr r1, [sp, #0x64]
	str r1, [sp, #0x60]
	ldr r2, [sp, #0x3c]
	cmp r2, #0
	beq _080D3C6E
	ldr r1, [r1, #4]
	mov r0, sl
	bl _Balloc
	str r0, [sp, #0x64]
	adds r0, #0xc
	ldr r1, [sp, #0x60]
	adds r1, #0xc
	ldr r3, [sp, #0x60]
	ldr r2, [r3, #0x10]
	lsls r2, r2, #2
	adds r2, #8
	bl memcpy
	mov r0, sl
	ldr r1, [sp, #0x64]
	movs r2, #1
	bl _lshift
	str r0, [sp, #0x64]
_080D3C6E:
	movs r0, #1
	mov r8, r0
	mov r1, r8
	ldr r2, [sp, #0x44]
	ands r2, r1
	str r2, [sp, #0x80]
	b _080D3CC4
_080D3C7C:
	mov r0, sl
	ldr r1, [sp, #0x5c]
	movs r2, #0xa
	movs r3, #0
	bl _multadd
	str r0, [sp, #0x5c]
	ldr r3, [sp, #0x60]
	ldr r0, [sp, #0x64]
	cmp r3, r0
	bne _080D3CA4
	mov r0, sl
	ldr r1, [sp, #0x64]
	movs r2, #0xa
	movs r3, #0
	bl _multadd
	str r0, [sp, #0x64]
	str r0, [sp, #0x60]
	b _080D3CC0
_080D3CA4:
	mov r0, sl
	ldr r1, [sp, #0x60]
	movs r2, #0xa
	movs r3, #0
	bl _multadd
	str r0, [sp, #0x60]
	mov r0, sl
	ldr r1, [sp, #0x64]
	movs r2, #0xa
	movs r3, #0
	bl _multadd
	str r0, [sp, #0x64]
_080D3CC0:
	movs r1, #1
	add r8, r1
_080D3CC4:
	ldr r0, [sp, #0x5c]
	ldr r1, [sp, #0x68]
	bl quorem
	adds r7, r0, #0
	adds r7, #0x30
	ldr r0, [sp, #0x5c]
	ldr r1, [sp, #0x60]
	bl __mcmp
	adds r4, r0, #0
	mov r0, sl
	ldr r1, [sp, #0x68]
	ldr r2, [sp, #0x64]
	bl __mdiff
	adds r5, r0, #0
	ldr r0, [r5, #0xc]
	cmp r0, #0
	bne _080D3CF8
	ldr r0, [sp, #0x5c]
	adds r1, r5, #0
	bl __mcmp
	adds r6, r0, #0
	b _080D3CFA
_080D3CF8:
	movs r6, #1
_080D3CFA:
	mov r0, sl
	adds r1, r5, #0
	bl _Bfree
	cmp r6, #0
	bne _080D3D26
	ldr r2, [sp, #0xc]
	cmp r2, #0
	bne _080D3D26
	ldr r3, [sp, #0x80]
	cmp r3, #0
	bne _080D3D26
	cmp r7, #0x39
	beq _080D3D78
	cmp r4, #0
	ble _080D3D1C
	adds r7, #1
_080D3D1C:
	mov r0, sb
	strb r7, [r0]
	movs r1, #1
	add sb, r1
	b _080D3E5A
_080D3D26:
	cmp r4, #0
	blt _080D3D3A
	cmp r4, #0
	bne _080D3D70
	ldr r2, [sp, #0xc]
	cmp r2, #0
	bne _080D3D70
	ldr r3, [sp, #0x80]
	cmp r3, #0
	bne _080D3D70
_080D3D3A:
	cmp r6, #0
	ble _080D3D6A
	mov r0, sl
	ldr r1, [sp, #0x5c]
	movs r2, #1
	bl _lshift
	str r0, [sp, #0x5c]
	ldr r1, [sp, #0x68]
	bl __mcmp
	adds r6, r0, #0
	cmp r6, #0
	bgt _080D3D64
	cmp r6, #0
	bne _080D3D6A
	adds r0, r7, #0
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _080D3D6A
_080D3D64:
	adds r7, #1
	cmp r7, #0x3a
	beq _080D3D78
_080D3D6A:
	mov r2, sb
	strb r7, [r2]
	b _080D3E22
_080D3D70:
	cmp r6, #0
	ble _080D3D90
	cmp r7, #0x39
	bne _080D3D84
_080D3D78:
	movs r0, #0x39
	mov r1, sb
	strb r0, [r1]
	movs r2, #1
	add sb, r2
	b _080D3DF8
_080D3D84:
	adds r0, r7, #1
	mov r3, sb
	strb r0, [r3]
	movs r0, #1
	add sb, r0
	b _080D3E5A
_080D3D90:
	mov r1, sb
	strb r7, [r1]
	movs r2, #1
	add sb, r2
	ldr r3, [sp, #0x18]
	cmp r8, r3
	beq _080D3DA0
	b _080D3C7C
_080D3DA0:
	b _080D3DD4
_080D3DA2:
	movs r0, #1
	mov r8, r0
	b _080D3DBA
_080D3DA8:
	mov r0, sl
	ldr r1, [sp, #0x5c]
	movs r2, #0xa
	movs r3, #0
	bl _multadd
	str r0, [sp, #0x5c]
	movs r1, #1
	add r8, r1
_080D3DBA:
	ldr r0, [sp, #0x5c]
	ldr r1, [sp, #0x68]
	bl quorem
	adds r7, r0, #0
	adds r7, #0x30
	mov r2, sb
	strb r7, [r2]
	movs r3, #1
	add sb, r3
	ldr r0, [sp, #0x18]
	cmp r8, r0
	blt _080D3DA8
_080D3DD4:
	mov r0, sl
	ldr r1, [sp, #0x5c]
	movs r2, #1
	bl _lshift
	str r0, [sp, #0x5c]
	ldr r1, [sp, #0x68]
	bl __mcmp
	adds r4, r0, #0
	cmp r4, #0
	bgt _080D3DF8
	cmp r4, #0
	bne _080D3E3A
	movs r0, #1
	ands r7, r0
	cmp r7, #0
	beq _080D3E3A
_080D3DF8:
	movs r1, #1
	rsbs r1, r1, #0
	add sb, r1
	mov r2, sb
	ldrb r2, [r2]
	cmp r2, #0x39
	bne _080D3E1A
_080D3E06:
	ldr r3, [sp, #0x74]
	cmp sb, r3
	beq _080D3E28
	movs r0, #1
	rsbs r0, r0, #0
	add sb, r0
	mov r1, sb
	ldrb r1, [r1]
	cmp r1, #0x39
	beq _080D3E06
_080D3E1A:
	mov r2, sb
	ldrb r0, [r2]
	adds r0, #1
	strb r0, [r2]
_080D3E22:
	movs r3, #1
	add sb, r3
	b _080D3E5A
_080D3E28:
	ldr r0, [sp, #0x24]
	adds r0, #1
	str r0, [sp, #0x24]
	movs r0, #0x31
	ldr r1, [sp, #0x74]
	strb r0, [r1]
	adds r1, #1
	mov sb, r1
	b _080D3E5A
_080D3E3A:
	movs r2, #1
	rsbs r2, r2, #0
	add sb, r2
	mov r3, sb
	ldrb r3, [r3]
	cmp r3, #0x30
	bne _080D3E56
_080D3E48:
	movs r0, #1
	rsbs r0, r0, #0
	add sb, r0
	mov r1, sb
	ldrb r1, [r1]
	cmp r1, #0x30
	beq _080D3E48
_080D3E56:
	movs r2, #1
	add sb, r2
_080D3E5A:
	mov r0, sl
	ldr r1, [sp, #0x68]
	bl _Bfree
	ldr r3, [sp, #0x64]
	cmp r3, #0
	beq _080D3E82
	ldr r0, [sp, #0x60]
	cmp r0, #0
	beq _080D3E7A
	cmp r0, r3
	beq _080D3E7A
	mov r0, sl
	ldr r1, [sp, #0x60]
	bl _Bfree
_080D3E7A:
	mov r0, sl
	ldr r1, [sp, #0x64]
	bl _Bfree
_080D3E82:
	mov r0, sl
	ldr r1, [sp, #0x5c]
	bl _Bfree
	movs r0, #0
	mov r1, sb
	strb r0, [r1]
	ldr r0, [sp, #0x24]
	adds r0, #1
	ldr r2, [sp, #0xa8]
	str r0, [r2]
	ldr r3, [sp, #0xb0]
	cmp r3, #0
	beq _080D3EA0
	str r1, [r3]
_080D3EA0:
	ldr r0, [sp, #0x74]
_080D3EA2:
	add sp, #0x84
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7, pc}
	.byte 0x00, 0x00
