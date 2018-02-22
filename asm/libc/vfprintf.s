    .INCLUDE "macro.inc"

    .SYNTAX unified

	THUMB_FUNC_START __sprint
__sprint: @ 0x080D1E10
	push {r4, lr}
	adds r4, r1, #0
	ldr r1, [r4, #8]
	cmp r1, #0
	beq _080D1E28
	adds r1, r4, #0
	bl __sfvwrite
	movs r1, #0
	str r1, [r4, #8]
	str r1, [r4, #4]
	b _080D1E2C
_080D1E28:
	str r1, [r4, #4]
	movs r0, #0
_080D1E2C:
	pop {r4, pc}
	.byte 0x00, 0x00

	THUMB_FUNC_START __sbprintf
__sbprintf: @ 0x080D1E30
	push {r4, r5, lr}
	ldr r4, _080D1EA0 @ 0xFFFFFBA8
	add sp, r4
	adds r5, r0, #0
	ldr r0, [r5, #0x54]
	str r0, [sp, #0x54]
	mov r3, sp
	movs r0, #3
	rsbs r0, r0, #0
	ldrh r4, [r5, #0xc]
	ands r0, r4
	movs r4, #0
	strh r0, [r3, #0xc]
	ldrh r0, [r5, #0xe]
	strh r0, [r3, #0xe]
	ldr r0, [r5, #0x1c]
	str r0, [sp, #0x1c]
	ldr r0, [r5, #0x24]
	str r0, [sp, #0x24]
	add r0, sp, #0x58
	str r0, [sp]
	str r0, [sp, #0x10]
	movs r0, #0x80
	lsls r0, r0, #3
	str r0, [sp, #8]
	str r0, [sp, #0x14]
	str r4, [sp, #0x18]
	mov r0, sp
	bl vfprintf
	adds r4, r0, #0
	cmp r4, #0
	blt _080D1E80
	mov r0, sp
	bl fflush
	cmp r0, #0
	beq _080D1E80
	movs r4, #1
	rsbs r4, r4, #0
_080D1E80:
	mov r1, sp
	movs r0, #0x40
	ldrh r1, [r1, #0xc]
	ands r0, r1
	cmp r0, #0
	beq _080D1E94
	movs r0, #0x40
	ldrh r1, [r5, #0xc]
	orrs r0, r1
	strh r0, [r5, #0xc]
_080D1E94:
	adds r0, r4, #0
	movs r3, #0x8b
	lsls r3, r3, #3
	add sp, r3
	pop {r4, r5, pc}
	.align 2, 0
_080D1EA0: .4byte 0xFFFFFBA8

	THUMB_FUNC_START vfprintf
vfprintf: @ 0x080D1EA4
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r3, r2, #0
	ldr r0, [r4, #0x54]
	adds r1, r4, #0
	adds r2, r5, #0
	bl _vfprintf_r
	pop {r4, r5, pc}

	THUMB_FUNC_START _vfprintf_r
_vfprintf_r: @ 0x080D1EB8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r4, _080D1F20 @ 0xFFFFFDE0
	add sp, r4
	str r0, [sp, #0x1dc]
	str r1, [sp, #0x1e0]
	adds r4, r2, #0
	mov sl, r3
	bl localeconv
	ldr r0, [r0]
	str r0, [sp, #0x1f8]
	movs r1, #0
	add r0, sp, #0x1d0
	str r1, [r0]
	ldr r1, [sp, #0x1e0]
	ldr r0, [r1, #0x54]
	cmp r0, #0
	bne _080D1EEA
	ldr r0, _080D1F24 @ 0x08B1FA20
	ldr r0, [r0]
	str r0, [r1, #0x54]
_080D1EEA:
	ldr r2, [sp, #0x1e0]
	ldr r1, [r2, #0x54]
	ldr r0, [r1, #0x38]
	cmp r0, #0
	bne _080D1EFA
	adds r0, r1, #0
	bl __sinit
_080D1EFA:
	movs r0, #8
	ldr r1, [sp, #0x1e0]
	ldrh r1, [r1, #0xc]
	ands r0, r1
	cmp r0, #0
	beq _080D1F0E
	ldr r2, [sp, #0x1e0]
	ldr r0, [r2, #0x10]
	cmp r0, #0
	bne _080D1F28
_080D1F0E:
	ldr r0, [sp, #0x1e0]
	bl __swsetup
	cmp r0, #0
	beq _080D1F28
	movs r0, #1
	rsbs r0, r0, #0
	bl _080D2E08
	.align 2, 0
_080D1F20: .4byte 0xFFFFFDE0
_080D1F24: .4byte gUnknown_08B1FA20
_080D1F28:
	movs r0, #0x1a
	ldr r1, [sp, #0x1e0]
	ldrh r1, [r1, #0xc]
	ands r0, r1
	cmp r0, #0xa
	bne _080D1F4C
	ldr r2, [sp, #0x1e0]
	movs r1, #0xe
	ldrsh r0, [r2, r1]
	cmp r0, #0
	blt _080D1F4C
	adds r0, r2, #0
	adds r1, r4, #0
	mov r2, sl
	bl __sbprintf
	bl _080D2E08
_080D1F4C:
	str r4, [sp, #0x1e4]
	add r1, sp, #0x1c
	add r5, sp, #0x28
	str r5, [sp, #0x1c]
	movs r0, #0
	str r0, [r1, #8]
	str r0, [r1, #4]
	movs r2, #0
	str r2, [sp, #0x1f0]
	mov sb, r1
	movs r4, #0xe6
	lsls r4, r4, #1
	add r4, sp
	str r4, [sp, #0x214]
	movs r0, #0xe8
	lsls r0, r0, #1
	add r0, sp
	str r0, [sp, #0x218]
_080D1F70:
	ldr r1, [sp, #0x1e4]
	mov r8, r1
_080D1F74:
	ldr r0, _080D2020 @ 0x08B1FA20
	ldr r0, [r0]
	ldr r1, _080D2024 @ 0x08B1FA24
	ldr r3, [r1]
	ldr r2, [sp, #0x218]
	str r2, [sp]
	ldr r1, [sp, #0x214]
	ldr r2, [sp, #0x1e4]
	bl _mbtowc_r
	adds r4, r0, #0
	cmp r4, #0
	ble _080D1FA2
	ldr r0, [sp, #0x1e4]
	adds r0, r0, r4
	str r0, [sp, #0x1e4]
	add r0, sp, #0x1cc
	ldr r0, [r0]
	cmp r0, #0x25
	bne _080D1F74
	ldr r1, [sp, #0x1e4]
	subs r1, #1
	str r1, [sp, #0x1e4]
_080D1FA2:
	ldr r2, [sp, #0x1e4]
	mov r0, r8
	subs r6, r2, r0
	cmp r6, #0
	beq _080D1FDA
	str r0, [r5]
	str r6, [r5, #4]
	mov r1, sb
	ldr r0, [r1, #8]
	adds r0, r0, r6
	str r0, [r1, #8]
	adds r5, #8
	ldr r0, [r1, #4]
	adds r0, #1
	str r0, [r1, #4]
	cmp r0, #7
	ble _080D1FD4
	ldr r0, [sp, #0x1e0]
	bl __sprint
	cmp r0, #0
	beq _080D1FD2
	bl _080D2DF4
_080D1FD2:
	add r5, sp, #0x28
_080D1FD4:
	ldr r2, [sp, #0x1f0]
	adds r2, r2, r6
	str r2, [sp, #0x1f0]
_080D1FDA:
	cmp r4, #0
	bgt _080D1FE2
	bl _080D2DDC
_080D1FE2:
	ldr r4, [sp, #0x1e4]
	adds r4, #1
	str r4, [sp, #0x1e4]
	movs r0, #0
	str r0, [sp, #0x1ec]
	movs r1, #0
	str r1, [sp, #0x208]
	movs r2, #0
	str r2, [sp, #0x1f4]
	movs r6, #1
	rsbs r6, r6, #0
	ldr r0, _080D2028 @ 0x000001C9
	add r0, sp
	strb r2, [r0]
_080D1FFE:
	ldr r0, [sp, #0x1e4]
	ldrb r0, [r0]
	str r0, [sp, #0x1e8]
	ldr r1, [sp, #0x1e4]
	adds r1, #1
	str r1, [sp, #0x1e4]
_080D200A:
	ldr r0, [sp, #0x1e8]
	subs r0, #0x20
	cmp r0, #0x58
	bls _080D2014
	b _080D26C6
_080D2014:
	lsls r0, r0, #2
	ldr r1, _080D202C @ _080D2030
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080D2020: .4byte gUnknown_08B1FA20
_080D2024: .4byte gUnknown_08B1FA24
_080D2028: .4byte 0x000001C9
_080D202C: .4byte _080D2030
_080D2030: @ jump table
	.4byte _080D2194 @ case 0
	.4byte _080D26C6 @ case 1
	.4byte _080D26C6 @ case 2
	.4byte _080D21AC @ case 3
	.4byte _080D26C6 @ case 4
	.4byte _080D26C6 @ case 5
	.4byte _080D26C6 @ case 6
	.4byte _080D26C6 @ case 7
	.4byte _080D26C6 @ case 8
	.4byte _080D26C6 @ case 9
	.4byte _080D21B0 @ case 10
	.4byte _080D21CA @ case 11
	.4byte _080D26C6 @ case 12
	.4byte _080D21C6 @ case 13
	.4byte _080D21D8 @ case 14
	.4byte _080D26C6 @ case 15
	.4byte _080D2238 @ case 16
	.4byte _080D223C @ case 17
	.4byte _080D223C @ case 18
	.4byte _080D223C @ case 19
	.4byte _080D223C @ case 20
	.4byte _080D223C @ case 21
	.4byte _080D223C @ case 22
	.4byte _080D223C @ case 23
	.4byte _080D223C @ case 24
	.4byte _080D223C @ case 25
	.4byte _080D26C6 @ case 26
	.4byte _080D26C6 @ case 27
	.4byte _080D26C6 @ case 28
	.4byte _080D26C6 @ case 29
	.4byte _080D26C6 @ case 30
	.4byte _080D26C6 @ case 31
	.4byte _080D26C6 @ case 32
	.4byte _080D26C6 @ case 33
	.4byte _080D26C6 @ case 34
	.4byte _080D26C6 @ case 35
	.4byte _080D22A6 @ case 36
	.4byte _080D22F8 @ case 37
	.4byte _080D26C6 @ case 38
	.4byte _080D22F8 @ case 39
	.4byte _080D26C6 @ case 40
	.4byte _080D26C6 @ case 41
	.4byte _080D26C6 @ case 42
	.4byte _080D26C6 @ case 43
	.4byte _080D2260 @ case 44
	.4byte _080D26C6 @ case 45
	.4byte _080D26C6 @ case 46
	.4byte _080D24AE @ case 47
	.4byte _080D26C6 @ case 48
	.4byte _080D26C6 @ case 49
	.4byte _080D26C6 @ case 50
	.4byte _080D26C6 @ case 51
	.4byte _080D26C6 @ case 52
	.4byte _080D2546 @ case 53
	.4byte _080D26C6 @ case 54
	.4byte _080D26C6 @ case 55
	.4byte _080D2582 @ case 56
	.4byte _080D26C6 @ case 57
	.4byte _080D26C6 @ case 58
	.4byte _080D26C6 @ case 59
	.4byte _080D26C6 @ case 60
	.4byte _080D26C6 @ case 61
	.4byte _080D26C6 @ case 62
	.4byte _080D26C6 @ case 63
	.4byte _080D26C6 @ case 64
	.4byte _080D26C6 @ case 65
	.4byte _080D26C6 @ case 66
	.4byte _080D2294 @ case 67
	.4byte _080D22AE @ case 68
	.4byte _080D22F8 @ case 69
	.4byte _080D22F8 @ case 70
	.4byte _080D22F8 @ case 71
	.4byte _080D2264 @ case 72
	.4byte _080D22AE @ case 73
	.4byte _080D26C6 @ case 74
	.4byte _080D26C6 @ case 75
	.4byte _080D2268 @ case 76
	.4byte _080D26C6 @ case 77
	.4byte _080D2468 @ case 78
	.4byte _080D24B6 @ case 79
	.4byte _080D24E4 @ case 80
	.4byte _080D228A @ case 81
	.4byte _080D26C6 @ case 82
	.4byte _080D2504 @ case 83
	.4byte _080D26C6 @ case 84
	.4byte _080D254E @ case 85
	.4byte _080D26C6 @ case 86
	.4byte _080D26C6 @ case 87
	.4byte _080D258C @ case 88
_080D2194:
	ldr r1, _080D21A8 @ 0x000001C9
	add r1, sp
	ldrb r0, [r1]
	cmp r0, #0
	beq _080D21A0
	b _080D1FFE
_080D21A0:
	movs r0, #0x20
	strb r0, [r1]
	b _080D1FFE
	.align 2, 0
_080D21A8: .4byte 0x000001C9
_080D21AC:
	movs r0, #1
	b _080D2278
_080D21B0:
	movs r4, #4
	add sl, r4
	mov r0, sl
	subs r0, #4
	ldr r0, [r0]
	str r0, [sp, #0x1f4]
	cmp r0, #0
	blt _080D21C2
	b _080D1FFE
_080D21C2:
	rsbs r0, r0, #0
	str r0, [sp, #0x1f4]
_080D21C6:
	movs r0, #4
	b _080D228C
_080D21CA:
	ldr r1, _080D21D4 @ 0x000001C9
	add r1, sp
	movs r0, #0x2b
	strb r0, [r1]
	b _080D1FFE
	.align 2, 0
_080D21D4: .4byte 0x000001C9
_080D21D8:
	ldr r2, [sp, #0x1e4]
	ldrb r2, [r2]
	str r2, [sp, #0x1e8]
	ldr r4, [sp, #0x1e4]
	adds r4, #1
	str r4, [sp, #0x1e4]
	cmp r2, #0x2a
	bne _080D2202
	movs r0, #4
	add sl, r0
	mov r0, sl
	subs r0, #4
	ldr r4, [r0]
	adds r6, r4, #0
	movs r0, #1
	rsbs r0, r0, #0
	cmp r6, r0
	blt _080D21FE
	b _080D1FFE
_080D21FE:
	adds r6, r0, #0
	b _080D1FFE
_080D2202:
	movs r4, #0
	ldr r0, [sp, #0x1e8]
	b _080D2222
_080D2208:
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #1
	subs r0, #0x30
	ldr r1, [sp, #0x1e8]
	adds r4, r0, r1
	ldr r2, [sp, #0x1e4]
	ldrb r2, [r2]
	str r2, [sp, #0x1e8]
	ldr r0, [sp, #0x1e4]
	adds r0, #1
	str r0, [sp, #0x1e4]
	adds r0, r2, #0
_080D2222:
	subs r0, #0x30
	cmp r0, #9
	bls _080D2208
	adds r6, r4, #0
	movs r0, #1
	rsbs r0, r0, #0
	cmp r6, r0
	blt _080D2234
	b _080D200A
_080D2234:
	adds r6, r0, #0
	b _080D200A
_080D2238:
	movs r0, #0x80
	b _080D228C
_080D223C:
	movs r4, #0
_080D223E:
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #1
	subs r0, #0x30
	ldr r2, [sp, #0x1e8]
	adds r4, r0, r2
	ldr r0, [sp, #0x1e4]
	ldrb r0, [r0]
	str r0, [sp, #0x1e8]
	ldr r1, [sp, #0x1e4]
	adds r1, #1
	str r1, [sp, #0x1e4]
	subs r0, #0x30
	cmp r0, #9
	bls _080D223E
	str r4, [sp, #0x1f4]
	b _080D200A
_080D2260:
	movs r0, #8
	b _080D2278
_080D2264:
	movs r0, #0x40
	b _080D2282
_080D2268:
	ldr r0, [sp, #0x1e4]
	ldrb r0, [r0]
	cmp r0, #0x6c
	bne _080D2280
	ldr r1, [sp, #0x1e4]
	adds r1, #1
	str r1, [sp, #0x1e4]
	movs r0, #0x20
_080D2278:
	ldr r2, [sp, #0x1ec]
	orrs r2, r0
	str r2, [sp, #0x1ec]
	b _080D1FFE
_080D2280:
	movs r0, #0x10
_080D2282:
	ldr r4, [sp, #0x1ec]
	orrs r4, r0
	str r4, [sp, #0x1ec]
	b _080D1FFE
_080D228A:
	movs r0, #0x20
_080D228C:
	ldr r1, [sp, #0x1ec]
	orrs r1, r0
	str r1, [sp, #0x1ec]
	b _080D1FFE
_080D2294:
	add r2, sp, #0x68
	mov r8, r2
	movs r4, #4
	add sl, r4
	mov r0, sl
	subs r0, #4
	ldr r0, [r0]
	strb r0, [r2]
	b _080D26D4
_080D22A6:
	movs r0, #0x10
	ldr r1, [sp, #0x1ec]
	orrs r1, r0
	str r1, [sp, #0x1ec]
_080D22AE:
	movs r0, #0x10
	ldr r2, [sp, #0x1ec]
	ands r0, r2
	cmp r0, #0
	beq _080D22BE
	movs r4, #4
	add sl, r4
	b _080D22DA
_080D22BE:
	movs r0, #0x40
	ldr r1, [sp, #0x1ec]
	ands r0, r1
	cmp r0, #0
	beq _080D22D6
	movs r2, #4
	add sl, r2
	mov r0, sl
	subs r0, #4
	movs r1, #0
	ldrsh r4, [r0, r1]
	b _080D22E0
_080D22D6:
	movs r2, #4
	add sl, r2
_080D22DA:
	mov r0, sl
	subs r0, #4
	ldr r4, [r0]
_080D22E0:
	cmp r4, #0
	bge _080D22EE
	rsbs r4, r4, #0
	ldr r1, _080D22F4 @ 0x000001C9
	add r1, sp
	movs r0, #0x2d
	strb r0, [r1]
_080D22EE:
	movs r2, #1
	b _080D25DA
	.align 2, 0
_080D22F4: .4byte 0x000001C9
_080D22F8:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r6, r0
	bne _080D2304
	movs r6, #6
	b _080D2314
_080D2304:
	ldr r4, [sp, #0x1e8]
	cmp r4, #0x67
	beq _080D230E
	cmp r4, #0x47
	bne _080D2314
_080D230E:
	cmp r6, #0
	bne _080D2314
	movs r6, #1
_080D2314:
	movs r0, #8
	ldr r1, [sp, #0x1ec]
	ands r0, r1
	movs r2, #8
	add sl, r2
	mov r0, sl
	subs r0, #8
	ldr r1, [r0]
	ldr r2, [r0, #4]
	str r1, [sp, #0x1fc]
	str r2, [sp, #0x200]
	ldr r0, [sp, #0x1fc]
	ldr r1, [sp, #0x200]
	bl isinf
	cmp r0, #0
	beq _080D2368
	ldr r3, _080D235C @ 0x00000000
	ldr r2, _080D2358 @ 0x00000000
	ldr r0, [sp, #0x1fc]
	ldr r1, [sp, #0x200]
	bl __ltdf2
	cmp r0, #0
	bge _080D234E
	ldr r1, _080D2360 @ 0x000001C9
	add r1, sp
	movs r0, #0x2d
	strb r0, [r1]
_080D234E:
	ldr r2, _080D2364 @ 0x08587720
	mov r8, r2
	movs r3, #3
	b _080D26DE
	.align 2, 0
_080D2358: .4byte 0x00000000
_080D235C: .4byte 0x00000000
_080D2360: .4byte 0x000001C9
_080D2364: .4byte gUnknown_08587720
_080D2368:
	ldr r0, [sp, #0x1fc]
	ldr r1, [sp, #0x200]
	bl isnan
	cmp r0, #0
	beq _080D2380
	ldr r4, _080D237C @ 0x08587724
	mov r8, r4
	movs r3, #3
	b _080D26DE
	.align 2, 0
_080D237C: .4byte gUnknown_08587724
_080D2380:
	movs r0, #0x80
	lsls r0, r0, #1
	ldr r1, [sp, #0x1ec]
	orrs r1, r0
	str r1, [sp, #0x1ec]
	str r1, [sp]
	add r0, sp, #0x1c8
	str r0, [sp, #4]
	add r0, sp, #0x1d4
	str r0, [sp, #8]
	ldr r2, [sp, #0x1e8]
	str r2, [sp, #0xc]
	add r0, sp, #0x1d8
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x1dc]
	ldr r1, [sp, #0x1fc]
	ldr r2, [sp, #0x200]
	adds r3, r6, #0
	bl cvt
	mov r8, r0
	ldr r4, [sp, #0x1e8]
	cmp r4, #0x67
	beq _080D23B4
	cmp r4, #0x47
	bne _080D23D6
_080D23B4:
	add r0, sp, #0x1d4
	ldr r1, [r0]
	movs r0, #4
	rsbs r0, r0, #0
	cmp r1, r0
	ble _080D23C4
	cmp r1, r6
	ble _080D23D2
_080D23C4:
	movs r0, #0x45
	ldr r1, [sp, #0x1e8]
	cmp r1, #0x67
	bne _080D23CE
	movs r0, #0x65
_080D23CE:
	str r0, [sp, #0x1e8]
	b _080D23D6
_080D23D2:
	movs r2, #0x67
	str r2, [sp, #0x1e8]
_080D23D6:
	ldr r4, [sp, #0x1e8]
	cmp r4, #0x65
	bgt _080D23FC
	add r0, sp, #0x1d4
	ldr r1, [r0]
	subs r1, #1
	str r1, [r0]
	add r0, sp, #0x14
	ldr r2, [sp, #0x1e8]
	bl exponent
	str r0, [sp, #0x204]
	add r0, sp, #0x1d8
	ldr r0, [r0]
	ldr r1, [sp, #0x204]
	adds r3, r1, r0
	cmp r0, #1
	bgt _080D243C
	b _080D2432
_080D23FC:
	ldr r4, [sp, #0x1e8]
	cmp r4, #0x66
	bne _080D2424
	add r0, sp, #0x1d4
	ldr r0, [r0]
	cmp r0, #0
	ble _080D2420
	adds r3, r0, #0
	cmp r6, #0
	bne _080D241A
	movs r0, #1
	ldr r1, [sp, #0x1ec]
	ands r0, r1
	cmp r0, #0
	beq _080D244C
_080D241A:
	adds r0, r3, #1
	adds r3, r0, r6
	b _080D244C
_080D2420:
	adds r3, r6, #2
	b _080D244C
_080D2424:
	add r0, sp, #0x1d4
	ldr r1, [r0]
	add r0, sp, #0x1d8
	ldr r0, [r0]
	cmp r1, r0
	blt _080D2440
	adds r3, r1, #0
_080D2432:
	movs r0, #1
	ldr r2, [sp, #0x1ec]
	ands r0, r2
	cmp r0, #0
	beq _080D244C
_080D243C:
	adds r3, #1
	b _080D244C
_080D2440:
	cmp r1, #0
	bgt _080D244A
	adds r0, #2
	subs r3, r0, r1
	b _080D244C
_080D244A:
	adds r3, r0, #1
_080D244C:
	add r0, sp, #0x1c8
	ldrb r0, [r0]
	adds r7, r5, #0
	adds r7, #8
	cmp r0, #0
	bne _080D245A
	b _080D26E2
_080D245A:
	ldr r1, _080D2464 @ 0x000001C9
	add r1, sp
	movs r0, #0x2d
	strb r0, [r1]
	b _080D26E2
	.align 2, 0
_080D2464: .4byte 0x000001C9
_080D2468:
	movs r0, #0x10
	ldr r4, [sp, #0x1ec]
	ands r0, r4
	cmp r0, #0
	beq _080D2482
	movs r0, #4
	add sl, r0
	mov r0, sl
	subs r0, #4
	ldr r0, [r0]
	ldr r1, [sp, #0x1f0]
	str r1, [r0]
	b _080D1F70
_080D2482:
	movs r0, #0x40
	ldr r2, [sp, #0x1ec]
	ands r2, r0
	cmp r2, #0
	beq _080D249E
	movs r4, #4
	add sl, r4
	mov r0, sl
	subs r0, #4
	ldr r0, [r0]
	add r1, sp, #0x1f0
	ldrh r1, [r1]
	strh r1, [r0]
	b _080D1F70
_080D249E:
	movs r2, #4
	add sl, r2
	mov r0, sl
	subs r0, #4
	ldr r0, [r0]
	ldr r4, [sp, #0x1f0]
	str r4, [r0]
	b _080D1F70
_080D24AE:
	movs r0, #0x10
	ldr r1, [sp, #0x1ec]
	orrs r1, r0
	str r1, [sp, #0x1ec]
_080D24B6:
	movs r0, #0x10
	ldr r2, [sp, #0x1ec]
	ands r0, r2
	cmp r0, #0
	bne _080D24D6
	movs r0, #0x40
	ldr r1, [sp, #0x1ec]
	ands r0, r1
	cmp r0, #0
	beq _080D24D6
	movs r2, #4
	add sl, r2
	mov r0, sl
	subs r0, #4
	ldrh r4, [r0]
	b _080D24E0
_080D24D6:
	movs r4, #4
	add sl, r4
	mov r0, sl
	subs r0, #4
	ldr r4, [r0]
_080D24E0:
	movs r2, #0
	b _080D25D2
_080D24E4:
	movs r0, #4
	add sl, r0
	mov r0, sl
	subs r0, #4
	ldr r4, [r0]
	movs r2, #2
	ldr r1, _080D2500 @ 0x08587728
	str r1, [sp, #0x210]
	ldr r0, [sp, #0x1ec]
	orrs r0, r2
	str r0, [sp, #0x1ec]
	movs r1, #0x78
	str r1, [sp, #0x1e8]
	b _080D25D2
	.align 2, 0
_080D2500: .4byte gUnknown_08587728
_080D2504:
	movs r2, #4
	add sl, r2
	mov r0, sl
	subs r0, #4
	ldr r0, [r0]
	mov r8, r0
	cmp r0, #0
	bne _080D2518
	ldr r4, _080D2538 @ 0x0858773C
	mov r8, r4
_080D2518:
	cmp r6, #0
	blt _080D253C
	mov r0, r8
	movs r1, #0
	adds r2, r6, #0
	bl memchr
	cmp r0, #0
	beq _080D2534
	mov r1, r8
	subs r3, r0, r1
	cmp r3, r6
	bgt _080D2534
	b _080D26D6
_080D2534:
	adds r3, r6, #0
	b _080D26D6
	.align 2, 0
_080D2538: .4byte gUnknown_0858773C
_080D253C:
	mov r0, r8
	bl strlen
	adds r3, r0, #0
	b _080D26D6
_080D2546:
	movs r0, #0x10
	ldr r2, [sp, #0x1ec]
	orrs r2, r0
	str r2, [sp, #0x1ec]
_080D254E:
	movs r0, #0x10
	ldr r4, [sp, #0x1ec]
	ands r0, r4
	cmp r0, #0
	beq _080D255E
	movs r0, #4
	add sl, r0
	b _080D2578
_080D255E:
	movs r0, #0x40
	ldr r1, [sp, #0x1ec]
	ands r0, r1
	cmp r0, #0
	beq _080D2574
	movs r2, #4
	add sl, r2
	mov r0, sl
	subs r0, #4
	ldrh r4, [r0]
	b _080D257E
_080D2574:
	movs r4, #4
	add sl, r4
_080D2578:
	mov r0, sl
	subs r0, #4
	ldr r4, [r0]
_080D257E:
	movs r2, #1
	b _080D25D2
_080D2582:
	ldr r0, _080D2588 @ 0x08587744
	str r0, [sp, #0x210]
	b _080D2590
	.align 2, 0
_080D2588: .4byte gUnknown_08587744
_080D258C:
	ldr r1, _080D25B0 @ 0x08587728
	str r1, [sp, #0x210]
_080D2590:
	movs r0, #0x10
	ldr r2, [sp, #0x1ec]
	ands r0, r2
	cmp r0, #0
	bne _080D25B4
	movs r0, #0x40
	ldr r1, [sp, #0x1ec]
	ands r0, r1
	cmp r0, #0
	beq _080D25B4
	movs r2, #4
	add sl, r2
	mov r0, sl
	subs r0, #4
	ldrh r4, [r0]
	b _080D25BE
	.align 2, 0
_080D25B0: .4byte gUnknown_08587728
_080D25B4:
	movs r4, #4
	add sl, r4
	mov r0, sl
	subs r0, #4
	ldr r4, [r0]
_080D25BE:
	movs r2, #2
	movs r0, #1
	ldr r1, [sp, #0x1ec]
	ands r0, r1
	cmp r0, #0
	beq _080D25D2
	cmp r4, #0
	beq _080D25D2
	orrs r1, r2
	str r1, [sp, #0x1ec]
_080D25D2:
	ldr r1, _080D261C @ 0x000001C9
	add r1, sp
	movs r0, #0
	strb r0, [r1]
_080D25DA:
	str r6, [sp, #0x208]
	cmp r6, #0
	blt _080D25EA
	movs r0, #0x81
	rsbs r0, r0, #0
	ldr r1, [sp, #0x1ec]
	ands r1, r0
	str r1, [sp, #0x1ec]
_080D25EA:
	movs r0, #0xe2
	lsls r0, r0, #1
	add r0, sp
	mov r8, r0
	cmp r4, #0
	bne _080D2600
	adds r7, r5, #0
	adds r7, #8
	ldr r1, [sp, #0x208]
	cmp r1, #0
	beq _080D26B8
_080D2600:
	cmp r2, #1
	beq _080D265E
	cmp r2, #1
	blo _080D2624
	cmp r2, #2
	beq _080D2698
	ldr r2, _080D2620 @ 0x08587758
	mov r8, r2
	mov r0, r8
	bl strlen
	adds r3, r0, #0
	b _080D26DE
	.align 2, 0
_080D261C: .4byte 0x000001C9
_080D2620: .4byte gUnknown_08587758
_080D2624:
	adds r7, r5, #0
	adds r7, #8
	movs r2, #7
_080D262A:
	movs r0, #1
	rsbs r0, r0, #0
	add r8, r0
	adds r0, r4, #0
	ands r0, r2
	adds r1, r0, #0
	adds r1, #0x30
	mov r0, r8
	strb r1, [r0]
	lsrs r4, r4, #3
	cmp r4, #0
	bne _080D262A
	movs r0, #1
	ldr r2, [sp, #0x1ec]
	ands r0, r2
	cmp r0, #0
	beq _080D26B8
	cmp r1, #0x30
	beq _080D26B8
	movs r4, #1
	rsbs r4, r4, #0
	add r8, r4
	movs r0, #0x30
	mov r1, r8
	strb r0, [r1]
	b _080D26B8
_080D265E:
	adds r7, r5, #0
	adds r7, #8
	cmp r4, #9
	bls _080D2688
_080D2666:
	movs r2, #1
	rsbs r2, r2, #0
	add r8, r2
	adds r0, r4, #0
	movs r1, #0xa
	bl __umodsi3
	adds r0, #0x30
	mov r1, r8
	strb r0, [r1]
	adds r0, r4, #0
	movs r1, #0xa
	bl __udivsi3
	adds r4, r0, #0
	cmp r4, #9
	bhi _080D2666
_080D2688:
	movs r2, #1
	rsbs r2, r2, #0
	add r8, r2
	adds r0, r4, #0
	adds r0, #0x30
	mov r4, r8
	strb r0, [r4]
	b _080D26B8
_080D2698:
	adds r7, r5, #0
	adds r7, #8
	movs r1, #0xf
_080D269E:
	movs r0, #1
	rsbs r0, r0, #0
	add r8, r0
	adds r0, r4, #0
	ands r0, r1
	ldr r2, [sp, #0x210]
	adds r0, r2, r0
	ldrb r0, [r0]
	mov r2, r8
	strb r0, [r2]
	lsrs r4, r4, #4
	cmp r4, #0
	bne _080D269E
_080D26B8:
	add r4, sp, #0x14
	mov r1, r8
	subs r0, r4, r1
	movs r2, #0xd8
	lsls r2, r2, #1
	adds r3, r0, r2
	b _080D26E2
_080D26C6:
	ldr r4, [sp, #0x1e8]
	cmp r4, #0
	bne _080D26CE
	b _080D2DDC
_080D26CE:
	add r0, sp, #0x68
	mov r8, r0
	strb r4, [r0]
_080D26D4:
	movs r3, #1
_080D26D6:
	ldr r1, _080D2700 @ 0x000001C9
	add r1, sp
	movs r0, #0
	strb r0, [r1]
_080D26DE:
	adds r7, r5, #0
	adds r7, #8
_080D26E2:
	str r3, [sp, #0x20c]
	ldr r2, [sp, #0x208]
	cmp r3, r2
	bge _080D26EC
	str r2, [sp, #0x20c]
_080D26EC:
	ldr r0, _080D2700 @ 0x000001C9
	add r0, sp
	ldrb r0, [r0]
	cmp r0, #0
	beq _080D2704
	ldr r4, [sp, #0x20c]
	adds r4, #1
	str r4, [sp, #0x20c]
	b _080D2714
	.align 2, 0
_080D2700: .4byte 0x000001C9
_080D2704:
	movs r0, #2
	ldr r1, [sp, #0x1ec]
	ands r0, r1
	cmp r0, #0
	beq _080D2714
	ldr r2, [sp, #0x20c]
	adds r2, #2
	str r2, [sp, #0x20c]
_080D2714:
	movs r0, #0x84
	ldr r4, [sp, #0x1ec]
	ands r0, r4
	cmp r0, #0
	bne _080D2794
	ldr r0, [sp, #0x1f4]
	ldr r1, [sp, #0x20c]
	subs r4, r0, r1
	cmp r4, #0
	ble _080D2794
	ldr r1, _080D27C0 @ 0x08587700
	cmp r4, #0x10
	ble _080D2768
	mov r6, sb
_080D2730:
	str r1, [r5]
	movs r0, #0x10
	str r0, [r5, #4]
	ldr r0, [r6, #8]
	adds r0, #0x10
	str r0, [r6, #8]
	adds r5, r7, #0
	ldr r0, [r6, #4]
	adds r0, #1
	str r0, [r6, #4]
	cmp r0, #7
	ble _080D275E
	ldr r0, [sp, #0x1e0]
	mov r1, sb
	str r3, [sp, #0x21c]
	bl __sprint
	ldr r3, [sp, #0x21c]
	cmp r0, #0
	beq _080D275A
	b _080D2DF4
_080D275A:
	add r5, sp, #0x28
	ldr r1, _080D27C0 @ 0x08587700
_080D275E:
	subs r4, #0x10
	adds r7, r5, #0
	adds r7, #8
	cmp r4, #0x10
	bgt _080D2730
_080D2768:
	str r1, [r5]
	str r4, [r5, #4]
	mov r2, sb
	ldr r0, [r2, #8]
	adds r0, r0, r4
	str r0, [r2, #8]
	adds r5, r7, #0
	ldr r0, [r2, #4]
	adds r0, #1
	str r0, [r2, #4]
	cmp r0, #7
	ble _080D2794
	ldr r0, [sp, #0x1e0]
	mov r1, sb
	str r3, [sp, #0x21c]
	bl __sprint
	ldr r3, [sp, #0x21c]
	cmp r0, #0
	beq _080D2792
	b _080D2DF4
_080D2792:
	add r5, sp, #0x28
_080D2794:
	ldr r1, _080D27C4 @ 0x000001C9
	add r1, sp
	ldrb r0, [r1]
	cmp r0, #0
	beq _080D27C8
	str r1, [r5]
	movs r0, #1
	str r0, [r5, #4]
	mov r4, sb
	ldr r0, [r4, #8]
	adds r0, #1
	str r0, [r4, #8]
	adds r5, #8
	ldr r0, [r4, #4]
	adds r0, #1
	str r0, [r4, #4]
	cmp r0, #7
	ble _080D2808
	ldr r0, [sp, #0x1e0]
	mov r1, sb
	b _080D27F8
	.align 2, 0
_080D27C0: .4byte gUnknown_08587700
_080D27C4: .4byte 0x000001C9
_080D27C8:
	movs r2, #2
	ldr r0, [sp, #0x1ec]
	ands r0, r2
	cmp r0, #0
	beq _080D2808
	add r1, sp, #0x1c4
	movs r0, #0x30
	strb r0, [r1]
	add r0, sp, #0x1e8
	ldrb r0, [r0]
	strb r0, [r1, #1]
	str r1, [r5]
	str r2, [r5, #4]
	mov r1, sb
	ldr r0, [r1, #8]
	adds r0, #2
	str r0, [r1, #8]
	adds r5, #8
	ldr r0, [r1, #4]
	adds r0, #1
	str r0, [r1, #4]
	cmp r0, #7
	ble _080D2808
	ldr r0, [sp, #0x1e0]
_080D27F8:
	str r3, [sp, #0x21c]
	bl __sprint
	ldr r3, [sp, #0x21c]
	cmp r0, #0
	beq _080D2806
	b _080D2DF4
_080D2806:
	add r5, sp, #0x28
_080D2808:
	movs r0, #0x84
	ldr r2, [sp, #0x1ec]
	ands r0, r2
	cmp r0, #0x80
	bne _080D2884
	ldr r0, [sp, #0x1f4]
	ldr r1, [sp, #0x20c]
	subs r4, r0, r1
	cmp r4, #0
	ble _080D2884
	ldr r1, _080D2920 @ 0x08587710
	cmp r4, #0x10
	ble _080D2858
	mov r6, sb
_080D2824:
	str r1, [r5]
	movs r0, #0x10
	str r0, [r5, #4]
	ldr r0, [r6, #8]
	adds r0, #0x10
	str r0, [r6, #8]
	adds r5, #8
	ldr r0, [r6, #4]
	adds r0, #1
	str r0, [r6, #4]
	cmp r0, #7
	ble _080D2852
	ldr r0, [sp, #0x1e0]
	mov r1, sb
	str r3, [sp, #0x21c]
	bl __sprint
	ldr r3, [sp, #0x21c]
	cmp r0, #0
	beq _080D284E
	b _080D2DF4
_080D284E:
	add r5, sp, #0x28
	ldr r1, _080D2920 @ 0x08587710
_080D2852:
	subs r4, #0x10
	cmp r4, #0x10
	bgt _080D2824
_080D2858:
	str r1, [r5]
	str r4, [r5, #4]
	mov r2, sb
	ldr r0, [r2, #8]
	adds r0, r0, r4
	str r0, [r2, #8]
	adds r5, #8
	ldr r0, [r2, #4]
	adds r0, #1
	str r0, [r2, #4]
	cmp r0, #7
	ble _080D2884
	ldr r0, [sp, #0x1e0]
	mov r1, sb
	str r3, [sp, #0x21c]
	bl __sprint
	ldr r3, [sp, #0x21c]
	cmp r0, #0
	beq _080D2882
	b _080D2DF4
_080D2882:
	add r5, sp, #0x28
_080D2884:
	ldr r0, [sp, #0x208]
	subs r4, r0, r3
	cmp r4, #0
	ble _080D28F2
	ldr r1, _080D2920 @ 0x08587710
	cmp r4, #0x10
	ble _080D28C8
	mov r6, sb
_080D2894:
	str r1, [r5]
	movs r0, #0x10
	str r0, [r5, #4]
	ldr r0, [r6, #8]
	adds r0, #0x10
	str r0, [r6, #8]
	adds r5, #8
	ldr r0, [r6, #4]
	adds r0, #1
	str r0, [r6, #4]
	cmp r0, #7
	ble _080D28C2
	ldr r0, [sp, #0x1e0]
	mov r1, sb
	str r3, [sp, #0x21c]
	bl __sprint
	ldr r3, [sp, #0x21c]
	cmp r0, #0
	beq _080D28BE
	b _080D2DF4
_080D28BE:
	add r5, sp, #0x28
	ldr r1, _080D2920 @ 0x08587710
_080D28C2:
	subs r4, #0x10
	cmp r4, #0x10
	bgt _080D2894
_080D28C8:
	str r1, [r5]
	str r4, [r5, #4]
	mov r1, sb
	ldr r0, [r1, #8]
	adds r0, r0, r4
	str r0, [r1, #8]
	adds r5, #8
	ldr r0, [r1, #4]
	adds r0, #1
	str r0, [r1, #4]
	cmp r0, #7
	ble _080D28F2
	ldr r0, [sp, #0x1e0]
	str r3, [sp, #0x21c]
	bl __sprint
	ldr r3, [sp, #0x21c]
	cmp r0, #0
	beq _080D28F0
	b _080D2DF4
_080D28F0:
	add r5, sp, #0x28
_080D28F2:
	movs r0, #0x80
	lsls r0, r0, #1
	ldr r2, [sp, #0x1ec]
	ands r0, r2
	cmp r0, #0
	bne _080D2924
	mov r4, r8
	str r4, [r5]
	str r3, [r5, #4]
	mov r1, sb
	ldr r0, [r1, #8]
	adds r0, r0, r3
	str r0, [r1, #8]
	adds r5, #8
	ldr r0, [r1, #4]
	adds r0, #1
	str r0, [r1, #4]
	cmp r0, #7
	bgt _080D291A
	b _080D2D3A
_080D291A:
	ldr r0, [sp, #0x1e0]
	b _080D2D30
	.align 2, 0
_080D2920: .4byte gUnknown_08587710
_080D2924:
	ldr r2, [sp, #0x1e8]
	cmp r2, #0x65
	bgt _080D292C
	b _080D2C10
_080D292C:
	ldr r3, _080D29F8 @ 0x00000000
	ldr r2, _080D29F4 @ 0x00000000
	ldr r0, [sp, #0x1fc]
	ldr r1, [sp, #0x200]
	bl __eqdf2
	cmp r0, #0
	bne _080D2A04
	ldr r0, _080D29FC @ 0x08587774
	str r0, [r5]
	movs r6, #1
	str r6, [r5, #4]
	mov r4, sb
	ldr r0, [r4, #8]
	adds r0, #1
	str r0, [r4, #8]
	adds r5, #8
	ldr r0, [r4, #4]
	adds r0, #1
	str r0, [r4, #4]
	cmp r0, #7
	ble _080D2968
	ldr r0, [sp, #0x1e0]
	mov r1, sb
	bl __sprint
	cmp r0, #0
	beq _080D2966
	b _080D2DF4
_080D2966:
	add r5, sp, #0x28
_080D2968:
	add r0, sp, #0x1d4
	ldr r1, [r0]
	add r4, sp, #0x1d8
	ldr r0, [r4]
	cmp r1, r0
	blt _080D297E
	ldr r0, [sp, #0x1ec]
	ands r0, r6
	cmp r0, #0
	bne _080D297E
	b _080D2D3A
_080D297E:
	ldr r0, [sp, #0x1f8]
	str r0, [r5]
	str r6, [r5, #4]
	mov r1, sb
	ldr r0, [r1, #8]
	adds r0, #1
	str r0, [r1, #8]
	adds r5, #8
	ldr r0, [r1, #4]
	adds r0, #1
	str r0, [r1, #4]
	cmp r0, #7
	ble _080D29A6
	ldr r0, [sp, #0x1e0]
	bl __sprint
	cmp r0, #0
	beq _080D29A4
	b _080D2DF4
_080D29A4:
	add r5, sp, #0x28
_080D29A6:
	ldr r0, [r4]
	subs r4, r0, #1
	cmp r4, #0
	bgt _080D29B0
	b _080D2D3A
_080D29B0:
	ldr r1, _080D2A00 @ 0x08587710
	cmp r4, #0x10
	ble _080D29E8
	mov r6, sb
_080D29B8:
	str r1, [r5]
	movs r0, #0x10
	str r0, [r5, #4]
	ldr r0, [r6, #8]
	adds r0, #0x10
	str r0, [r6, #8]
	adds r5, #8
	ldr r0, [r6, #4]
	adds r0, #1
	str r0, [r6, #4]
	cmp r0, #7
	ble _080D29E2
	ldr r0, [sp, #0x1e0]
	mov r1, sb
	bl __sprint
	cmp r0, #0
	beq _080D29DE
	b _080D2DF4
_080D29DE:
	add r5, sp, #0x28
	ldr r1, _080D2A00 @ 0x08587710
_080D29E2:
	subs r4, #0x10
	cmp r4, #0x10
	bgt _080D29B8
_080D29E8:
	str r1, [r5]
	str r4, [r5, #4]
	mov r2, sb
	ldr r0, [r2, #8]
	adds r0, r0, r4
	b _080D2D1E
	.align 2, 0
_080D29F4: .4byte 0x00000000
_080D29F8: .4byte 0x00000000
_080D29FC: .4byte gUnknown_08587774
_080D2A00: .4byte gUnknown_08587710
_080D2A04:
	add r6, sp, #0x1d4
	ldr r2, [r6]
	cmp r2, #0
	bgt _080D2AEC
	ldr r0, _080D2AE4 @ 0x08587774
	str r0, [r5]
	movs r4, #1
	str r4, [r5, #4]
	mov r1, sb
	ldr r0, [r1, #8]
	adds r0, #1
	str r0, [r1, #8]
	adds r5, #8
	ldr r0, [r1, #4]
	adds r0, #1
	str r0, [r1, #4]
	cmp r0, #7
	ble _080D2A36
	ldr r0, [sp, #0x1e0]
	bl __sprint
	cmp r0, #0
	beq _080D2A34
	b _080D2DF4
_080D2A34:
	add r5, sp, #0x28
_080D2A36:
	ldr r2, [sp, #0x1f8]
	str r2, [r5]
	str r4, [r5, #4]
	mov r4, sb
	ldr r0, [r4, #8]
	adds r0, #1
	str r0, [r4, #8]
	adds r5, #8
	ldr r0, [r4, #4]
	adds r0, #1
	str r0, [r4, #4]
	cmp r0, #7
	ble _080D2A60
	ldr r0, [sp, #0x1e0]
	mov r1, sb
	bl __sprint
	cmp r0, #0
	beq _080D2A5E
	b _080D2DF4
_080D2A5E:
	add r5, sp, #0x28
_080D2A60:
	ldr r0, [r6]
	rsbs r4, r0, #0
	cmp r4, #0
	ble _080D2AC6
	ldr r1, _080D2AE8 @ 0x08587710
	cmp r4, #0x10
	ble _080D2AA0
	mov r6, sb
_080D2A70:
	str r1, [r5]
	movs r0, #0x10
	str r0, [r5, #4]
	ldr r0, [r6, #8]
	adds r0, #0x10
	str r0, [r6, #8]
	adds r5, #8
	ldr r0, [r6, #4]
	adds r0, #1
	str r0, [r6, #4]
	cmp r0, #7
	ble _080D2A9A
	ldr r0, [sp, #0x1e0]
	mov r1, sb
	bl __sprint
	cmp r0, #0
	beq _080D2A96
	b _080D2DF4
_080D2A96:
	add r5, sp, #0x28
	ldr r1, _080D2AE8 @ 0x08587710
_080D2A9A:
	subs r4, #0x10
	cmp r4, #0x10
	bgt _080D2A70
_080D2AA0:
	str r1, [r5]
	str r4, [r5, #4]
	mov r1, sb
	ldr r0, [r1, #8]
	adds r0, r0, r4
	str r0, [r1, #8]
	adds r5, #8
	ldr r0, [r1, #4]
	adds r0, #1
	str r0, [r1, #4]
	cmp r0, #7
	ble _080D2AC6
	ldr r0, [sp, #0x1e0]
	bl __sprint
	cmp r0, #0
	beq _080D2AC4
	b _080D2DF4
_080D2AC4:
	add r5, sp, #0x28
_080D2AC6:
	mov r2, r8
	str r2, [r5]
	add r0, sp, #0x1d8
	ldr r1, [r0]
	str r1, [r5, #4]
	mov r4, sb
	ldr r0, [r4, #8]
	adds r0, r0, r1
	str r0, [r4, #8]
	adds r5, #8
	ldr r0, [r4, #4]
	adds r0, #1
	str r0, [r4, #4]
	b _080D2D28
	.align 2, 0
_080D2AE4: .4byte gUnknown_08587774
_080D2AE8: .4byte gUnknown_08587710
_080D2AEC:
	add r4, sp, #0x1d8
	ldr r1, [r4]
	cmp r2, r1
	blt _080D2BA8
	mov r0, r8
	str r0, [r5]
	str r1, [r5, #4]
	mov r2, sb
	ldr r0, [r2, #8]
	adds r0, r0, r1
	str r0, [r2, #8]
	adds r5, #8
	ldr r0, [r2, #4]
	adds r0, #1
	str r0, [r2, #4]
	cmp r0, #7
	ble _080D2B1E
	ldr r0, [sp, #0x1e0]
	mov r1, sb
	bl __sprint
	cmp r0, #0
	beq _080D2B1C
	b _080D2DF4
_080D2B1C:
	add r5, sp, #0x28
_080D2B1E:
	ldr r1, [r6]
	ldr r0, [r4]
	subs r4, r1, r0
	cmp r4, #0
	ble _080D2B86
	ldr r1, _080D2BA0 @ 0x08587710
	cmp r4, #0x10
	ble _080D2B60
	mov r6, sb
_080D2B30:
	str r1, [r5]
	movs r0, #0x10
	str r0, [r5, #4]
	ldr r0, [r6, #8]
	adds r0, #0x10
	str r0, [r6, #8]
	adds r5, #8
	ldr r0, [r6, #4]
	adds r0, #1
	str r0, [r6, #4]
	cmp r0, #7
	ble _080D2B5A
	ldr r0, [sp, #0x1e0]
	mov r1, sb
	bl __sprint
	cmp r0, #0
	beq _080D2B56
	b _080D2DF4
_080D2B56:
	add r5, sp, #0x28
	ldr r1, _080D2BA0 @ 0x08587710
_080D2B5A:
	subs r4, #0x10
	cmp r4, #0x10
	bgt _080D2B30
_080D2B60:
	str r1, [r5]
	str r4, [r5, #4]
	mov r1, sb
	ldr r0, [r1, #8]
	adds r0, r0, r4
	str r0, [r1, #8]
	adds r5, #8
	ldr r0, [r1, #4]
	adds r0, #1
	str r0, [r1, #4]
	cmp r0, #7
	ble _080D2B86
	ldr r0, [sp, #0x1e0]
	bl __sprint
	cmp r0, #0
	beq _080D2B84
	b _080D2DF4
_080D2B84:
	add r5, sp, #0x28
_080D2B86:
	movs r1, #1
	ldr r0, [sp, #0x1ec]
	ands r0, r1
	cmp r0, #0
	bne _080D2B92
	b _080D2D3A
_080D2B92:
	ldr r0, _080D2BA4 @ 0x08587778
	str r0, [r5]
	str r1, [r5, #4]
	mov r2, sb
	ldr r0, [r2, #8]
	adds r0, #1
	b _080D2D1E
	.align 2, 0
_080D2BA0: .4byte gUnknown_08587710
_080D2BA4: .4byte gUnknown_08587778
_080D2BA8:
	mov r0, r8
	str r0, [r5]
	str r2, [r5, #4]
	mov r1, sb
	ldr r0, [r1, #8]
	adds r0, r0, r2
	str r0, [r1, #8]
	adds r5, #8
	ldr r0, [r1, #4]
	adds r0, #1
	str r0, [r1, #4]
	cmp r0, #7
	ble _080D2BD0
	ldr r0, [sp, #0x1e0]
	bl __sprint
	cmp r0, #0
	beq _080D2BCE
	b _080D2DF4
_080D2BCE:
	add r5, sp, #0x28
_080D2BD0:
	ldr r0, [r6]
	add r8, r0
	ldr r0, _080D2C0C @ 0x08587778
	str r0, [r5]
	movs r0, #1
	str r0, [r5, #4]
	mov r2, sb
	ldr r0, [r2, #8]
	adds r0, #1
	str r0, [r2, #8]
	adds r5, #8
	ldr r0, [r2, #4]
	adds r0, #1
	str r0, [r2, #4]
	cmp r0, #7
	ble _080D2C00
	ldr r0, [sp, #0x1e0]
	mov r1, sb
	bl __sprint
	cmp r0, #0
	beq _080D2BFE
	b _080D2DF4
_080D2BFE:
	add r5, sp, #0x28
_080D2C00:
	mov r0, r8
	str r0, [r5]
	ldr r1, [r4]
	ldr r0, [r6]
	subs r1, r1, r0
	b _080D2D16
	.align 2, 0
_080D2C0C: .4byte gUnknown_08587778
_080D2C10:
	add r4, sp, #0x1d8
	ldr r0, [r4]
	cmp r0, #1
	bgt _080D2C22
	movs r1, #1
	ldr r0, [sp, #0x1ec]
	ands r0, r1
	cmp r0, #0
	beq _080D2CE8
_080D2C22:
	add r1, sp, #0x1c4
	mov r2, r8
	ldrb r0, [r2]
	strb r0, [r1]
	movs r0, #1
	add r8, r0
	movs r0, #0x2e
	strb r0, [r1, #1]
	str r1, [r5]
	movs r0, #2
	str r0, [r5, #4]
	mov r1, sb
	ldr r0, [r1, #8]
	adds r0, #2
	str r0, [r1, #8]
	adds r5, #8
	ldr r0, [r1, #4]
	adds r0, #1
	str r0, [r1, #4]
	cmp r0, #7
	ble _080D2C5A
	ldr r0, [sp, #0x1e0]
	bl __sprint
	cmp r0, #0
	beq _080D2C58
	b _080D2DF4
_080D2C58:
	add r5, sp, #0x28
_080D2C5A:
	ldr r3, _080D2C84 @ 0x00000000
	ldr r2, _080D2C80 @ 0x00000000
	ldr r0, [sp, #0x1fc]
	ldr r1, [sp, #0x200]
	bl __nedf2
	cmp r0, #0
	beq _080D2C88
	mov r2, r8
	str r2, [r5]
	ldr r1, [r4]
	subs r0, r1, #1
	str r0, [r5, #4]
	mov r4, sb
	ldr r0, [r4, #8]
	subs r0, #1
	adds r0, r0, r1
	b _080D2CF4
	.align 2, 0
_080D2C80: .4byte 0x00000000
_080D2C84: .4byte 0x00000000
_080D2C88:
	ldr r0, [r4]
	subs r4, r0, #1
	cmp r4, #0
	ble _080D2D10
	ldr r1, _080D2CE4 @ 0x08587710
	cmp r4, #0x10
	ble _080D2CC8
	mov r6, sb
_080D2C98:
	str r1, [r5]
	movs r0, #0x10
	str r0, [r5, #4]
	ldr r0, [r6, #8]
	adds r0, #0x10
	str r0, [r6, #8]
	adds r5, #8
	ldr r0, [r6, #4]
	adds r0, #1
	str r0, [r6, #4]
	cmp r0, #7
	ble _080D2CC2
	ldr r0, [sp, #0x1e0]
	mov r1, sb
	bl __sprint
	cmp r0, #0
	beq _080D2CBE
	b _080D2DF4
_080D2CBE:
	add r5, sp, #0x28
	ldr r1, _080D2CE4 @ 0x08587710
_080D2CC2:
	subs r4, #0x10
	cmp r4, #0x10
	bgt _080D2C98
_080D2CC8:
	str r1, [r5]
	str r4, [r5, #4]
	mov r1, sb
	ldr r0, [r1, #8]
	adds r0, r0, r4
	str r0, [r1, #8]
	adds r5, #8
	ldr r0, [r1, #4]
	adds r0, #1
	str r0, [r1, #4]
	cmp r0, #7
	ble _080D2D10
	ldr r0, [sp, #0x1e0]
	b _080D2D06
	.align 2, 0
_080D2CE4: .4byte gUnknown_08587710
_080D2CE8:
	mov r2, r8
	str r2, [r5]
	str r1, [r5, #4]
	mov r4, sb
	ldr r0, [r4, #8]
	adds r0, #1
_080D2CF4:
	str r0, [r4, #8]
	adds r5, #8
	ldr r0, [r4, #4]
	adds r0, #1
	str r0, [r4, #4]
	cmp r0, #7
	ble _080D2D10
	ldr r0, [sp, #0x1e0]
	mov r1, sb
_080D2D06:
	bl __sprint
	cmp r0, #0
	bne _080D2DF4
	add r5, sp, #0x28
_080D2D10:
	add r0, sp, #0x14
	str r0, [r5]
	ldr r1, [sp, #0x204]
_080D2D16:
	str r1, [r5, #4]
	mov r2, sb
	ldr r0, [r2, #8]
	adds r0, r0, r1
_080D2D1E:
	str r0, [r2, #8]
	adds r5, #8
	ldr r0, [r2, #4]
	adds r0, #1
	str r0, [r2, #4]
_080D2D28:
	cmp r0, #7
	ble _080D2D3A
	ldr r0, [sp, #0x1e0]
	mov r1, sb
_080D2D30:
	bl __sprint
	cmp r0, #0
	bne _080D2DF4
	add r5, sp, #0x28
_080D2D3A:
	movs r0, #4
	ldr r4, [sp, #0x1ec]
	ands r4, r0
	cmp r4, #0
	beq _080D2DA6
	ldr r0, [sp, #0x1f4]
	ldr r1, [sp, #0x20c]
	subs r4, r0, r1
	cmp r4, #0
	ble _080D2DA6
	ldr r1, _080D2DD8 @ 0x08587700
	cmp r4, #0x10
	ble _080D2D84
	mov r6, sb
_080D2D56:
	str r1, [r5]
	movs r0, #0x10
	str r0, [r5, #4]
	ldr r0, [r6, #8]
	adds r0, #0x10
	str r0, [r6, #8]
	adds r5, #8
	ldr r0, [r6, #4]
	adds r0, #1
	str r0, [r6, #4]
	cmp r0, #7
	ble _080D2D7E
	ldr r0, [sp, #0x1e0]
	mov r1, sb
	bl __sprint
	cmp r0, #0
	bne _080D2DF4
	add r5, sp, #0x28
	ldr r1, _080D2DD8 @ 0x08587700
_080D2D7E:
	subs r4, #0x10
	cmp r4, #0x10
	bgt _080D2D56
_080D2D84:
	str r1, [r5]
	str r4, [r5, #4]
	mov r2, sb
	ldr r0, [r2, #8]
	adds r0, r0, r4
	str r0, [r2, #8]
	ldr r0, [r2, #4]
	adds r0, #1
	str r0, [r2, #4]
	cmp r0, #7
	ble _080D2DA6
	ldr r0, [sp, #0x1e0]
	mov r1, sb
	bl __sprint
	cmp r0, #0
	bne _080D2DF4
_080D2DA6:
	ldr r0, [sp, #0x20c]
	ldr r4, [sp, #0x1f4]
	cmp r0, r4
	bge _080D2DB0
	adds r0, r4, #0
_080D2DB0:
	ldr r1, [sp, #0x1f0]
	adds r1, r1, r0
	str r1, [sp, #0x1f0]
	mov r2, sb
	ldr r0, [r2, #8]
	cmp r0, #0
	beq _080D2DCA
	ldr r0, [sp, #0x1e0]
	mov r1, sb
	bl __sprint
	cmp r0, #0
	bne _080D2DF4
_080D2DCA:
	movs r0, #0
	mov r4, sb
	str r0, [r4, #4]
	add r5, sp, #0x28
	bl _080D1F70
	.align 2, 0
_080D2DD8: .4byte gUnknown_08587700
_080D2DDC:
	mov r1, sb
	ldr r0, [r1, #8]
	cmp r0, #0
	beq _080D2DEE
	ldr r0, [sp, #0x1e0]
	bl __sprint
	cmp r0, #0
	bne _080D2DF4
_080D2DEE:
	movs r0, #0
	mov r1, sb
	str r0, [r1, #4]
_080D2DF4:
	movs r0, #0x40
	ldr r2, [sp, #0x1e0]
	ldrh r2, [r2, #0xc]
	ands r0, r2
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, #0
	bne _080D2E06
	ldr r1, [sp, #0x1f0]
_080D2E06:
	adds r0, r1, #0
_080D2E08:
	movs r3, #0x88
	lsls r3, r3, #2
	add sp, r3
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7, pc}

	THUMB_FUNC_START cvt
cvt: @ 0x080D2E18
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x1c
	str r0, [sp, #0x18]
	adds r5, r2, #0
	adds r4, r1, #0
	mov r8, r3
	ldr r6, [sp, #0x3c]
	ldr r0, [sp, #0x44]
	mov sl, r0
	ldr r1, [sp, #0x48]
	mov sb, r1
	cmp r1, #0x66
	bne _080D2E3E
	movs r7, #3
	b _080D2E4E
_080D2E3E:
	mov r0, sb
	cmp r0, #0x65
	beq _080D2E48
	cmp r0, #0x45
	bne _080D2E4C
_080D2E48:
	movs r1, #1
	add r8, r1
_080D2E4C:
	movs r7, #2
_080D2E4E:
	lsls r0, r4, #0x1f
	lsrs r0, r0, #0x1f
	cmp r0, #0
	beq _080D2E64
	adds r1, r5, #0
	adds r0, r4, #0
	bl __negdf2
	adds r5, r1, #0
	adds r4, r0, #0
	movs r0, #0x2d
_080D2E64:
	ldr r1, [sp, #0x40]
	strb r0, [r1]
	mov r0, r8
	str r0, [sp]
	mov r1, sl
	str r1, [sp, #4]
	add r0, sp, #0x10
	str r0, [sp, #8]
	add r0, sp, #0x14
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x18]
	adds r2, r5, #0
	adds r1, r4, #0
	adds r3, r7, #0
	bl _dtoa_r
	adds r7, r0, #0
	mov r1, sb
	cmp r1, #0x67
	beq _080D2E90
	cmp r1, #0x47
	bne _080D2E98
_080D2E90:
	movs r0, #1
	ands r6, r0
	cmp r6, #0
	beq _080D2EEC
_080D2E98:
	mov r0, r8
	adds r6, r7, r0
	mov r1, sb
	cmp r1, #0x66
	bne _080D2EC8
	ldrb r0, [r7]
	cmp r0, #0x30
	bne _080D2EC2
	ldr r3, _080D2F08 @ 0x00000000
	ldr r2, _080D2F04 @ 0x00000000
	adds r1, r5, #0
	adds r0, r4, #0
	bl __nedf2
	cmp r0, #0
	beq _080D2EC2
	mov r1, r8
	rsbs r0, r1, #0
	adds r0, #1
	mov r1, sl
	str r0, [r1]
_080D2EC2:
	mov r1, sl
	ldr r0, [r1]
	adds r6, r6, r0
_080D2EC8:
	ldr r3, _080D2F08 @ 0x00000000
	ldr r2, _080D2F04 @ 0x00000000
	adds r1, r5, #0
	adds r0, r4, #0
	bl __eqdf2
	cmp r0, #0
	bne _080D2EDA
	str r6, [sp, #0x14]
_080D2EDA:
	ldr r0, [sp, #0x14]
	cmp r0, r6
	bhs _080D2EEC
	movs r1, #0x30
_080D2EE2:
	strb r1, [r0]
	adds r0, #1
	str r0, [sp, #0x14]
	cmp r0, r6
	blo _080D2EE2
_080D2EEC:
	ldr r0, [sp, #0x14]
	subs r0, r0, r7
	ldr r1, [sp, #0x4c]
	str r0, [r1]
	adds r0, r7, #0
	add sp, #0x1c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_080D2F04: .4byte 0x00000000
_080D2F08: .4byte 0x00000000

	THUMB_FUNC_START exponent
exponent: @ 0x080D2F0C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x134
	adds r7, r0, #0
	adds r6, r1, #0
	strb r2, [r7]
	adds r5, r7, #1
	cmp r6, #0
	bge _080D2F22
	rsbs r6, r6, #0
	movs r0, #0x2d
	b _080D2F24
_080D2F22:
	movs r0, #0x2b
_080D2F24:
	strb r0, [r7, #1]
	adds r5, #1
	add r4, sp, #0x134
	cmp r6, #9
	ble _080D2F66
_080D2F2E:
	subs r4, #1
	adds r0, r6, #0
	movs r1, #0xa
	bl __modsi3
	adds r0, #0x30
	strb r0, [r4]
	adds r0, r6, #0
	movs r1, #0xa
	bl __divsi3
	adds r6, r0, #0
	cmp r6, #9
	bgt _080D2F2E
	subs r4, #1
	adds r0, #0x30
	strb r0, [r4]
	add r0, sp, #0x134
	cmp r4, r0
	bhs _080D2F74
	adds r1, r0, #0
_080D2F58:
	ldrb r0, [r4]
	strb r0, [r5]
	adds r4, #1
	adds r5, #1
	cmp r4, r1
	blo _080D2F58
	b _080D2F74
_080D2F66:
	movs r0, #0x30
	strb r0, [r5]
	adds r5, #1
	adds r0, r6, #0
	adds r0, #0x30
	strb r0, [r5]
	adds r5, #1
_080D2F74:
	subs r0, r5, r7
	add sp, #0x134
	pop {r4, r5, r6, r7, pc}
	.byte 0x00, 0x00
