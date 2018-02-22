    .INCLUDE "macro.inc"

    .SYNTAX unified

	THUMB_FUNC_START findslot
findslot: @ 0x080D578C
	adds r3, r0, #0
	movs r1, #0
	ldr r2, _080D5794 @ 0x03002B98
	b _080D57A0
	.align 2, 0
_080D5794: .4byte gUnknown_03002B98
_080D5798:
	adds r2, #8
	adds r1, #1
	cmp r1, #0x13
	bgt _080D57A6
_080D57A0:
	ldr r0, [r2]
	cmp r0, r3
	bne _080D5798
_080D57A6:
	adds r0, r1, #0
	bx lr
	.byte 0x00, 0x00

	THUMB_FUNC_START remap_handle
remap_handle: @ 0x080D57AC
	adds r2, r0, #0
	ldr r0, _080D57C0 @ 0x08B1FA20
	ldr r1, [r0]
	ldr r0, [r1, #4]
	movs r3, #0xe
	ldrsh r0, [r0, r3]
	cmp r2, r0
	bne _080D57C8
	ldr r0, _080D57C4 @ 0x03002B8C
	b _080D57EE
	.align 2, 0
_080D57C0: .4byte gUnknown_08B1FA20
_080D57C4: .4byte gUnknown_03002B8C
_080D57C8:
	ldr r0, [r1, #8]
	movs r3, #0xe
	ldrsh r0, [r0, r3]
	cmp r2, r0
	bne _080D57DC
	ldr r0, _080D57D8 @ 0x03002B90
	b _080D57EE
	.align 2, 0
_080D57D8: .4byte gUnknown_03002B90
_080D57DC:
	ldr r0, [r1, #0xc]
	movs r1, #0xe
	ldrsh r0, [r0, r1]
	cmp r2, r0
	beq _080D57EC
	adds r0, r2, #0
	subs r0, #0x20
	b _080D57F0
_080D57EC:
	ldr r0, _080D57F4 @ 0x03002B94
_080D57EE:
	ldr r0, [r0]
_080D57F0:
	bx lr
	.align 2, 0
_080D57F4: .4byte gUnknown_03002B94

	THUMB_FUNC_START initialise_monitor_handles
initialise_monitor_handles: @ 0x080D57F8
	push {r4, r5, lr}
	sub sp, #0xc
	ldr r4, _080D5854 @ 0x085878F4
	str r4, [sp]
	movs r3, #3
	str r3, [sp, #8]
	movs r0, #0
	str r0, [sp, #4]
	movs r5, #1
	adds r0, r5, #0
	mov r1, sp
	svc #0xab
	adds r2, r0, #0
	ldr r5, _080D5858 @ 0x03002B8C
	str r2, [r5]
	str r4, [sp]
	str r3, [sp, #8]
	movs r0, #4
	str r0, [sp, #4]
	ldr r3, _080D585C @ 0x03002B90
	movs r4, #1
	adds r0, r4, #0
	mov r1, sp
	svc #0xab
	adds r2, r0, #0
	ldr r0, _080D5860 @ 0x03002B94
	str r2, [r0]
	str r2, [r3]
	ldr r2, _080D5864 @ 0x03002B98
	adds r1, r2, #0
	subs r4, #2
	adds r0, r2, #0
	adds r0, #0x98
_080D583A:
	str r4, [r0]
	subs r0, #8
	cmp r0, r1
	bge _080D583A
	movs r0, #0
	ldr r1, [r5]
	str r1, [r2]
	str r0, [r2, #4]
	ldr r1, [r3]
	str r1, [r2, #8]
	str r0, [r2, #0xc]
	add sp, #0xc
	pop {r4, r5, pc}
	.align 2, 0
_080D5854: .4byte gUnknown_085878F4
_080D5858: .4byte gUnknown_03002B8C
_080D585C: .4byte gUnknown_03002B90
_080D5860: .4byte gUnknown_03002B94
_080D5864: .4byte gUnknown_03002B98

	THUMB_FUNC_START get_errno
get_errno: @ 0x080D5868
	push {r4, lr}
	movs r3, #0x13
	movs r4, #0
	adds r0, r3, #0
	adds r1, r4, #0
	svc #0xab
	adds r2, r0, #0
	adds r0, r2, #0
	pop {r4, pc}
	.byte 0x00, 0x00

	THUMB_FUNC_START error
error: @ 0x080D587C
	push {r4, r5, lr}
	adds r5, r0, #0
	bl __errno
	adds r4, r0, #0
	bl get_errno
	str r0, [r4]
	adds r0, r5, #0
	pop {r4, r5, pc}

	THUMB_FUNC_START wrap
wrap: @ 0x080D5890
	push {lr}
	adds r1, r0, #0
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _080D58A0
	adds r0, r1, #0
	b _080D58A6
_080D58A0:
	adds r0, r1, #0
	bl error
_080D58A6:
	pop {pc}

	THUMB_FUNC_START _swiread
_swiread: @ 0x080D58A8
	push {r4, r5, lr}
	sub sp, #0xc
	adds r4, r1, #0
	adds r5, r2, #0
	bl remap_handle
	str r0, [sp]
	str r4, [sp, #4]
	str r5, [sp, #8]
	movs r3, #6
	adds r0, r3, #0
	mov r1, sp
	svc #0xab
	adds r2, r0, #0
	adds r0, r2, #0
	add sp, #0xc
	pop {r4, r5, pc}
	.byte 0x00, 0x00

	THUMB_FUNC_START _read
_read: @ 0x080D58CC
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r7, r2, #0
	bl remap_handle
	bl findslot
	adds r6, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r7, #0
	bl _swiread
	cmp r0, #0
	bge _080D58F6
	movs r0, #1
	rsbs r0, r0, #0
	bl error
	b _080D590C
_080D58F6:
	subs r2, r7, r0
	cmp r6, #0x14
	beq _080D590A
	ldr r0, _080D5910 @ 0x03002B98
	lsls r1, r6, #3
	adds r0, #4
	adds r1, r1, r0
	ldr r0, [r1]
	adds r0, r0, r2
	str r0, [r1]
_080D590A:
	adds r0, r2, #0
_080D590C:
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_080D5910: .4byte gUnknown_03002B98

	THUMB_FUNC_START _swilseek
_swilseek: @ 0x080D5914
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	mov r8, r0
	adds r5, r1, #0
	adds r4, r2, #0
	bl remap_handle
	adds r7, r0, #0
	bl findslot
	adds r6, r0, #0
	cmp r4, #1
	bne _080D594A
	cmp r6, #0x14
	bne _080D593C
	movs r0, #1
	rsbs r0, r0, #0
	b _080D598C
_080D593C:
	ldr r0, _080D5994 @ 0x03002B98
	lsls r1, r6, #3
	adds r0, #4
	adds r1, r1, r0
	ldr r0, [r1]
	adds r5, r5, r0
	movs r4, #0
_080D594A:
	cmp r4, #2
	bne _080D595C
	str r7, [sp]
	movs r3, #0xc
	adds r0, r3, #0
	mov r1, sp
	svc #0xab
	adds r2, r0, #0
	adds r5, r5, r2
_080D595C:
	mov r0, r8
	bl remap_handle
	str r0, [sp]
	str r5, [sp, #4]
	movs r3, #0xa
	adds r0, r3, #0
	mov r1, sp
	svc #0xab
	adds r2, r0, #0
	cmp r6, #0x14
	beq _080D5982
	cmp r2, #0
	bne _080D5982
	ldr r0, _080D5994 @ 0x03002B98
	lsls r1, r6, #3
	adds r0, #4
	adds r1, r1, r0
	str r5, [r1]
_080D5982:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r2, #0
	bne _080D598C
	adds r0, r5, #0
_080D598C:
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_080D5994: .4byte gUnknown_03002B98

	THUMB_FUNC_START _lseek
_lseek: @ 0x080D5998
	push {lr}
	bl _swilseek
	bl wrap
	pop {pc}

	THUMB_FUNC_START _swiwrite
_swiwrite: @ 0x080D59A4
	push {r4, r5, lr}
	sub sp, #0xc
	adds r4, r1, #0
	adds r5, r2, #0
	bl remap_handle
	str r0, [sp]
	str r4, [sp, #4]
	str r5, [sp, #8]
	movs r3, #5
	adds r0, r3, #0
	mov r1, sp
	svc #0xab
	adds r2, r0, #0
	adds r0, r2, #0
	add sp, #0xc
	pop {r4, r5, pc}
	.byte 0x00, 0x00

	THUMB_FUNC_START _write
_write: @ 0x080D59C8
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	bl remap_handle
	bl findslot
	adds r7, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r6, #0
	bl _swiwrite
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	beq _080D59F0
	cmp r0, r6
	bne _080D59F8
_080D59F0:
	adds r0, r1, #0
	bl error
	b _080D5A0E
_080D59F8:
	subs r2, r6, r0
	cmp r7, #0x14
	beq _080D5A0C
	ldr r0, _080D5A10 @ 0x03002B98
	lsls r1, r7, #3
	adds r0, #4
	adds r1, r1, r0
	ldr r0, [r1]
	adds r0, r0, r2
	str r0, [r1]
_080D5A0C:
	adds r0, r2, #0
_080D5A0E:
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_080D5A10: .4byte gUnknown_03002B98

	THUMB_FUNC_START _swiopen
_swiopen: @ 0x080D5A14
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0xc
	adds r7, r0, #0
	adds r4, r1, #0
	movs r5, #0
	movs r6, #1
	rsbs r6, r6, #0
	adds r0, r6, #0
	bl findslot
	mov r8, r0
	cmp r0, #0x14
	bne _080D5A36
	adds r0, r6, #0
	b _080D5AAA
_080D5A36:
	movs r0, #2
	ands r0, r4
	cmp r0, #0
	beq _080D5A40
	movs r5, #2
_080D5A40:
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r4
	cmp r0, #0
	beq _080D5A4E
	movs r0, #4
	orrs r5, r0
_080D5A4E:
	movs r0, #0x80
	lsls r0, r0, #3
	ands r0, r4
	cmp r0, #0
	beq _080D5A5C
	movs r0, #4
	orrs r5, r0
_080D5A5C:
	movs r1, #8
	ands r4, r1
	cmp r4, #0
	beq _080D5A6C
	movs r0, #5
	rsbs r0, r0, #0
	ands r5, r0
	orrs r5, r1
_080D5A6C:
	str r7, [sp]
	adds r0, r7, #0
	bl strlen
	str r0, [sp, #8]
	str r5, [sp, #4]
	movs r2, #1
	adds r0, r2, #0
	mov r1, sp
	svc #0xab
	adds r3, r0, #0
	cmp r3, #0
	blt _080D5AA4
	ldr r0, _080D5AA0 @ 0x03002B98
	mov r1, r8
	lsls r2, r1, #3
	adds r1, r2, r0
	str r3, [r1]
	adds r0, #4
	adds r2, r2, r0
	movs r0, #0
	str r0, [r2]
	adds r0, r3, #0
	adds r0, #0x20
	b _080D5AAA
	.align 2, 0
_080D5AA0: .4byte gUnknown_03002B98
_080D5AA4:
	adds r0, r3, #0
	bl error
_080D5AAA:
	add sp, #0xc
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7, pc}
	.byte 0x00, 0x00

	THUMB_FUNC_START _open
_open: @ 0x080D5AB4
	push {r1, r2, r3}
	push {lr}
	ldr r1, [sp, #4]
	bl _swiopen
	bl wrap
	pop {r3}
	add sp, #0xc
	bx r3

	THUMB_FUNC_START _swiclose
_swiclose: @ 0x080D5AC8
	push {lr}
	sub sp, #4
	bl remap_handle
	str r0, [sp]
	bl findslot
	adds r1, r0, #0
	cmp r1, #0x14
	beq _080D5AE8
	ldr r0, _080D5AF8 @ 0x03002B98
	lsls r1, r1, #3
	adds r1, r1, r0
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r1]
_080D5AE8:
	movs r3, #2
	adds r0, r3, #0
	mov r1, sp
	svc #0xab
	adds r2, r0, #0
	adds r0, r2, #0
	add sp, #4
	pop {pc}
	.align 2, 0
_080D5AF8: .4byte gUnknown_03002B98

	THUMB_FUNC_START _close
_close: @ 0x080D5AFC
	push {lr}
	bl _swiclose
	bl wrap
	pop {pc}

	THUMB_FUNC_START _exit
_exit: @ 0x080D5B08
	mov ip, r3
	mov r3, r8
	push {r3}
	mov r3, ip
	movs r2, #0x18
	ldr r3, _080D5B24 @ 0x00020026
	adds r0, r2, #0
	adds r1, r3, #0
	svc #0xab
	mov r8, r0
	pop {r3}
	mov r8, r3
	bx lr
	.align 2, 0
_080D5B24: .4byte 0x00020026

	THUMB_FUNC_START _kill
_kill: @ 0x080D5B28
	mov ip, r3
	mov r3, r8
	push {r3}
	mov r3, ip
	movs r2, #0x18
	ldr r3, _080D5B44 @ 0x00020026
	adds r0, r2, #0
	adds r1, r3, #0
	svc #0xab
	mov r8, r0
	pop {r3}
	mov r8, r3
	bx lr
	.align 2, 0
_080D5B44: .4byte 0x00020026

	THUMB_FUNC_START _getpid
_getpid: @ 0x080D5B48
	movs r0, #1
	bx lr

	THUMB_FUNC_START _sbrk
_sbrk: @ 0x080D5B4C
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r4, _080D5B7C @ 0x03002B88
	ldr r0, [r4]
	cmp r0, #0
	bne _080D5B5C
	ldr r0, _080D5B80 @ 0x0203EFB8
	str r0, [r4]
_080D5B5C:
	ldr r5, [r4]
	adds r0, r5, r6
	cmp r0, sp
	bls _080D5B72
	ldr r1, _080D5B84 @ 0x085878F8
	movs r0, #1
	movs r2, #0x20
	bl _write
	bl abort
_080D5B72:
	ldr r0, [r4]
	adds r0, r0, r6
	str r0, [r4]
	adds r0, r5, #0
	pop {r4, r5, r6, pc}
	.align 2, 0
_080D5B7C: .4byte gUnknown_03002B88
_080D5B80: .4byte gUnknown_0203EFB8
_080D5B84: .4byte gUnknown_085878F8

	THUMB_FUNC_START _fstat
_fstat: @ 0x080D5B88
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [r1, #4]
	movs r0, #0
	bx lr
	.byte 0x00, 0x00

	THUMB_FUNC_START _unlink
_unlink: @ 0x080D5B94
	movs r0, #1
	rsbs r0, r0, #0
	bx lr
	.byte 0x00, 0x00

	THUMB_FUNC_START _raise
_raise: @ 0x080D5B9C
	bx lr
	.byte 0x00, 0x00

	THUMB_FUNC_START _gettimeofday
_gettimeofday: @ 0x080D5BA0
	push {r4, r5, lr}
	adds r2, r0, #0
	adds r3, r1, #0
	cmp r2, #0
	beq _080D5BBE
	movs r4, #0x11
	movs r5, #0
	adds r0, r4, #0
	adds r1, r5, #0
	svc #0xab
	adds r5, r0, #0
	adds r4, r5, #0
	str r4, [r2]
	movs r0, #0
	str r0, [r2, #4]
_080D5BBE:
	cmp r3, #0
	beq _080D5BC8
	movs r0, #0
	str r0, [r3]
	str r0, [r3, #4]
_080D5BC8:
	movs r0, #0
	pop {r4, r5, pc}

	THUMB_FUNC_START _times
_times: @ 0x080D5BCC
	push {r4, r5, lr}
	adds r2, r0, #0
	movs r4, #0x10
	movs r5, #0
	adds r0, r4, #0
	adds r1, r5, #0
	svc #0xab
	adds r3, r0, #0
	cmp r2, #0
	beq _080D5BEA
	str r3, [r2]
	movs r0, #0
	str r0, [r2, #4]
	str r0, [r2, #8]
	str r0, [r2, #0xc]
_080D5BEA:
	adds r0, r3, #0
	pop {r4, r5, pc}
	.byte 0x00, 0x00
