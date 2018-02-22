    .INCLUDE "macro.inc"

    .SYNTAX unified

	THUMB_FUNC_START _free_r
_free_r: @ 0x080D40A0
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	mov sb, r0
	adds r4, r1, #0
	cmp r4, #0
	bne _080D40B2
	b _080D4256
_080D40B2:
	bl __malloc_lock
	adds r5, r4, #0
	subs r5, #8
	ldr r1, [r5, #4]
	movs r6, #2
	rsbs r6, r6, #0
	ands r6, r1
	adds r7, r5, r6
	ldr r4, [r7, #4]
	movs r0, #4
	rsbs r0, r0, #0
	ands r4, r0
	ldr r0, _080D4114 @ 0x08B1FA38
	mov ip, r0
	ldr r0, [r0, #8]
	cmp r7, r0
	bne _080D4120
	adds r6, r6, r4
	movs r4, #1
	ands r1, r4
	cmp r1, #0
	bne _080D40EE
	ldr r0, [r5]
	subs r5, r5, r0
	adds r6, r6, r0
	ldr r3, [r5, #0xc]
	ldr r2, [r5, #8]
	str r3, [r2, #0xc]
	str r2, [r3, #8]
_080D40EE:
	adds r0, r6, #0
	orrs r0, r4
	str r0, [r5, #4]
	mov r2, ip
	str r5, [r2, #8]
	ldr r0, _080D4118 @ 0x08B1FE40
	ldr r0, [r0]
	cmp r6, r0
	blo _080D410A
	ldr r0, _080D411C @ 0x08B1FE44
	ldr r1, [r0]
	mov r0, sb
	bl _malloc_trim_r
_080D410A:
	mov r0, sb
	bl __malloc_unlock
	b _080D4256
	.align 2, 0
_080D4114: .4byte gUnknown_08B1FA38
_080D4118: .4byte gUnknown_08B1FE40
_080D411C: .4byte gUnknown_08B1FE44
_080D4120:
	str r4, [r7, #4]
	movs r0, #0
	mov r8, r0
	movs r0, #1
	ands r1, r0
	cmp r1, #0
	bne _080D414C
	ldr r0, [r5]
	subs r5, r5, r0
	adds r6, r6, r0
	ldr r1, [r5, #8]
	mov r0, ip
	adds r0, #8
	cmp r1, r0
	bne _080D4144
	movs r2, #1
	mov r8, r2
	b _080D414C
_080D4144:
	ldr r3, [r5, #0xc]
	adds r2, r1, #0
	str r3, [r2, #0xc]
	str r2, [r3, #8]
_080D414C:
	adds r0, r7, r4
	ldr r0, [r0, #4]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _080D4184
	adds r6, r6, r4
	ldr r1, [r7, #8]
	mov r0, r8
	cmp r0, #0
	bne _080D417C
	ldr r0, _080D4178 @ 0x08B1FA40
	cmp r1, r0
	bne _080D417C
	movs r2, #1
	mov r8, r2
	str r5, [r1, #0xc]
	str r5, [r1, #8]
	str r1, [r5, #0xc]
	str r1, [r5, #8]
	b _080D4184
	.align 2, 0
_080D4178: .4byte gUnknown_08B1FA40
_080D417C:
	ldr r3, [r7, #0xc]
	adds r2, r1, #0
	str r3, [r2, #0xc]
	str r2, [r3, #8]
_080D4184:
	movs r1, #1
	adds r0, r6, #0
	orrs r0, r1
	str r0, [r5, #4]
	adds r0, r5, r6
	str r6, [r0]
	mov r0, r8
	cmp r0, #0
	bne _080D4250
	ldr r0, _080D41B4 @ 0x000001FF
	cmp r6, r0
	bhi _080D41BC
	lsrs r4, r6, #3
	ldr r2, _080D41B8 @ 0x08B1FA38
	adds r0, r4, #0
	asrs r0, r0, #2
	lsls r1, r0
	ldr r0, [r2, #4]
	orrs r0, r1
	str r0, [r2, #4]
	lsls r0, r4, #3
	adds r3, r0, r2
	ldr r2, [r3, #8]
	b _080D4248
	.align 2, 0
_080D41B4: .4byte 0x000001FF
_080D41B8: .4byte gUnknown_08B1FA38
_080D41BC:
	lsrs r1, r6, #9
	cmp r1, #0
	bne _080D41C6
	lsrs r4, r6, #3
	b _080D420E
_080D41C6:
	cmp r1, #4
	bhi _080D41D2
	lsrs r0, r6, #6
	adds r4, r0, #0
	adds r4, #0x38
	b _080D420E
_080D41D2:
	cmp r1, #0x14
	bhi _080D41DC
	adds r4, r1, #0
	adds r4, #0x5b
	b _080D420E
_080D41DC:
	cmp r1, #0x54
	bhi _080D41E8
	lsrs r0, r6, #0xc
	adds r4, r0, #0
	adds r4, #0x6e
	b _080D420E
_080D41E8:
	movs r0, #0xaa
	lsls r0, r0, #1
	cmp r1, r0
	bhi _080D41F8
	lsrs r0, r6, #0xf
	adds r4, r0, #0
	adds r4, #0x77
	b _080D420E
_080D41F8:
	ldr r0, _080D4208 @ 0x00000554
	cmp r1, r0
	bhi _080D420C
	lsrs r0, r6, #0x12
	adds r4, r0, #0
	adds r4, #0x7c
	b _080D420E
	.align 2, 0
_080D4208: .4byte 0x00000554
_080D420C:
	movs r4, #0x7e
_080D420E:
	lsls r0, r4, #3
	ldr r7, _080D422C @ 0x08B1FA38
	adds r3, r0, r7
	ldr r2, [r3, #8]
	cmp r2, r3
	bne _080D4230
	adds r0, r4, #0
	asrs r0, r0, #2
	movs r1, #1
	lsls r1, r0
	ldr r0, [r7, #4]
	orrs r0, r1
	str r0, [r7, #4]
	b _080D4248
	.align 2, 0
_080D422C: .4byte gUnknown_08B1FA38
_080D4230:
	ldr r0, [r2, #4]
	movs r1, #4
	rsbs r1, r1, #0
	b _080D4240
_080D4238:
	ldr r2, [r2, #8]
	cmp r2, r3
	beq _080D4246
	ldr r0, [r2, #4]
_080D4240:
	ands r0, r1
	cmp r6, r0
	blo _080D4238
_080D4246:
	ldr r3, [r2, #0xc]
_080D4248:
	str r3, [r5, #0xc]
	str r2, [r5, #8]
	str r5, [r3, #8]
	str r5, [r2, #0xc]
_080D4250:
	mov r0, sb
	bl __malloc_unlock
_080D4256:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7, pc}
	.byte 0x00, 0x00

	THUMB_FUNC_START _malloc_trim_r
_malloc_trim_r: @ 0x080D4260
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r7, r0, #0
	adds r4, r1, #0
	bl __malloc_lock
	ldr r0, _080D42E8 @ 0x08B1FA38
	mov r8, r0
	ldr r0, [r0, #8]
	ldr r6, [r0, #4]
	movs r0, #4
	rsbs r0, r0, #0
	ands r6, r0
	subs r4, r6, r4
	movs r5, #0x80
	lsls r5, r5, #5
	ldr r1, _080D42EC @ 0x00000FEF
	adds r4, r4, r1
	adds r0, r4, #0
	adds r1, r5, #0
	bl __udivsi3
	subs r0, #1
	lsls r4, r0, #0xc
	cmp r4, r5
	blt _080D42DE
	adds r0, r7, #0
	movs r1, #0
	bl _sbrk_r
	adds r2, r0, #0
	mov r1, r8
	ldr r0, [r1, #8]
	adds r0, r0, r6
	cmp r2, r0
	bne _080D42DE
	rsbs r1, r4, #0
	adds r0, r7, #0
	bl _sbrk_r
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	bne _080D42F8
	adds r0, r7, #0
	movs r1, #0
	bl _sbrk_r
	adds r2, r0, #0
	mov r0, r8
	ldr r3, [r0, #8]
	subs r6, r2, r3
	cmp r6, #0xf
	ble _080D42DE
	ldr r1, _080D42F0 @ 0x08B1FE54
	ldr r0, _080D42F4 @ 0x08B1FE48
	ldr r0, [r0]
	subs r0, r2, r0
	str r0, [r1]
	movs r0, #1
	orrs r6, r0
	str r6, [r3, #4]
_080D42DE:
	adds r0, r7, #0
	bl __malloc_unlock
	movs r0, #0
	b _080D4314
	.align 2, 0
_080D42E8: .4byte gUnknown_08B1FA38
_080D42EC: .4byte 0x00000FEF
_080D42F0: .4byte gUnknown_08B1FE54
_080D42F4: .4byte gUnknown_08B1FE48
_080D42F8:
	mov r1, r8
	ldr r2, [r1, #8]
	subs r0, r6, r4
	movs r1, #1
	orrs r0, r1
	str r0, [r2, #4]
	ldr r1, _080D431C @ 0x08B1FE54
	ldr r0, [r1]
	subs r0, r0, r4
	str r0, [r1]
	adds r0, r7, #0
	bl __malloc_unlock
	movs r0, #1
_080D4314:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_080D431C: .4byte gUnknown_08B1FE54
