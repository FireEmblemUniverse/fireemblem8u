	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	THUMB_FUNC_START sub_80AE86C
sub_80AE86C: @ 0x080AE86C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r6, r1, #0
	ldr r1, [r0, #0x30]
	lsls r1, r1, #5
	ldr r2, _080AE92C  @ gPaletteBuffer
	adds r1, r1, r2
	mov r8, r1
	ldr r1, [r0, #0x3c]
	mov ip, r1
	ldr r7, [r0, #0x40]
	movs r1, #0
	ldr r0, [r0, #0x34]
	cmp r1, r0
	bge _080AE918
	str r0, [sp, #4]
	movs r0, #0x80
	subs r5, r0, r6
	movs r0, #0xf8
	lsls r0, r0, #7
	mov sl, r0
_080AE89E:
	adds r1, #1
	str r1, [sp]
	movs r1, #0xf
	mov r9, r1
_080AE8A6:
	mov r0, ip
	ldrh r4, [r0]
	movs r0, #0x1f
	ands r0, r4
	adds r2, r0, #0
	muls r2, r5, r2
	ldrh r3, [r7]
	movs r0, #0x1f
	ands r0, r3
	muls r0, r6, r0
	adds r2, r2, r0
	asrs r2, r2, #7
	movs r1, #0x1f
	ands r2, r1
	movs r0, #0xf8
	lsls r0, r0, #2
	ands r0, r4
	adds r1, r0, #0
	muls r1, r5, r1
	movs r0, #0xf8
	lsls r0, r0, #2
	ands r0, r3
	muls r0, r6, r0
	adds r1, r1, r0
	asrs r1, r1, #7
	movs r0, #0xf8
	lsls r0, r0, #2
	ands r1, r0
	adds r2, r2, r1
	mov r0, sl
	ands r0, r4
	adds r1, r0, #0
	muls r1, r5, r1
	mov r0, sl
	ands r0, r3
	muls r0, r6, r0
	adds r1, r1, r0
	asrs r1, r1, #7
	mov r0, sl
	ands r1, r0
	adds r2, r2, r1
	mov r1, r8
	strh r2, [r1]
	movs r0, #2
	add r8, r0
	add ip, r0
	adds r7, #2
	movs r1, #1
	negs r1, r1
	add r9, r1
	mov r0, r9
	cmp r0, #0
	bge _080AE8A6
	ldr r1, [sp]
	ldr r0, [sp, #4]
	cmp r1, r0
	blt _080AE89E
_080AE918:
	bl EnablePaletteSync
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080AE92C: .4byte gPaletteBuffer

	THUMB_FUNC_END sub_80AE86C

	THUMB_FUNC_START sub_80AE930
sub_80AE930: @ 0x080AE930
	movs r1, #0
	str r1, [r0, #0x38]
	bx lr

	THUMB_FUNC_END sub_80AE930

	THUMB_FUNC_START sub_80AE938
sub_80AE938: @ 0x080AE938
	push {lr}
	adds r2, r0, #0
	ldr r0, [r2, #0x38]
	ldr r1, [r2, #0x2c]
	adds r0, r0, r1
	str r0, [r2, #0x38]
	movs r1, #0x80
	lsls r1, r1, #1
	cmp r0, r1
	ble _080AE950
	movs r0, #0
	str r0, [r2, #0x38]
_080AE950:
	ldr r0, [r2, #0x38]
	subs r1, r1, r0
	cmp r0, #0x7f
	bgt _080AE95A
	adds r1, r0, #0
_080AE95A:
	adds r0, r2, #0
	bl sub_80AE86C
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80AE938

	THUMB_FUNC_START sub_80AE964
sub_80AE964: @ 0x080AE964
	push {r4, r5, r6, lr}
	mov r6, r9
	mov r5, r8
	push {r5, r6}
	mov r8, r0
	mov r9, r1
	adds r4, r2, #0
	adds r5, r3, #0
	ldr r6, [sp, #0x18]
	ldr r1, [sp, #0x1c]
	ldr r0, _080AE998  @ gUnknown_08A20E24
	bl Proc_Start
	str r4, [r0, #0x2c]
	str r5, [r0, #0x30]
	str r6, [r0, #0x34]
	mov r1, r8
	str r1, [r0, #0x3c]
	mov r1, r9
	str r1, [r0, #0x40]
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080AE998: .4byte gUnknown_08A20E24

	THUMB_FUNC_END sub_80AE964

	THUMB_FUNC_START sub_80AE99C
sub_80AE99C: @ 0x080AE99C
	push {lr}
	ldr r0, _080AE9AC  @ gUnknown_08A20E24
	bl Proc_Find
	bl Proc_End
	pop {r0}
	bx r0
	.align 2, 0
_080AE9AC: .4byte gUnknown_08A20E24

	THUMB_FUNC_END sub_80AE99C

	THUMB_FUNC_START sub_80AE9B0
sub_80AE9B0: @ 0x080AE9B0
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	sub sp, #8
	adds r5, r0, #0
	adds r6, r1, #0
	mov r8, r2
	mov r9, r3
	ldr r4, [sp, #0x2c]
	ldr r0, [sp, #0x34]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r7, r0, #0
	cmp r5, #0
	beq _080AE9E0
	ldr r1, _080AEA1C  @ 0x000003FF
	ands r1, r0
	lsls r1, r1, #5
	ldr r0, _080AEA20  @ 0x06010000
	adds r1, r1, r0
	adds r0, r5, #0
	bl Decompress
_080AE9E0:
	cmp r6, #0
	beq _080AE9F4
	adds r1, r4, #0
	adds r1, #0x10
	lsls r1, r1, #5
	ldr r2, [sp, #0x30]
	lsls r2, r2, #5
	adds r0, r6, #0
	bl CopyToPaletteBuffer
_080AE9F4:
	movs r0, #0xf
	ands r4, r0
	lsls r3, r4, #0xc
	adds r3, r3, r7
	ldr r0, [sp, #0x28]
	str r0, [sp]
	ldr r0, [sp, #0x38]
	str r0, [sp, #4]
	mov r0, r8
	mov r1, r9
	ldr r2, [sp, #0x24]
	bl APProc_Create
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080AEA1C: .4byte 0x000003FF
_080AEA20: .4byte 0x06010000

	THUMB_FUNC_END sub_80AE9B0

	THUMB_FUNC_START sub_80AEA24
sub_80AEA24: @ 0x080AEA24
	push {lr}
	adds r1, r0, #0
	cmp r1, #1
	beq _080AEA4C
	cmp r1, #1
	bgt _080AEA36
	cmp r1, #0
	beq _080AEA40
	b _080AEA68
_080AEA36:
	cmp r1, #2
	beq _080AEA58
	cmp r1, #3
	beq _080AEA64
	b _080AEA68
_080AEA40:
	ldr r0, _080AEA48  @ gLCDControlBuffer
	ldrh r0, [r0, #0x1c]
	b _080AEA68
	.align 2, 0
_080AEA48: .4byte gLCDControlBuffer
_080AEA4C:
	ldr r0, _080AEA54  @ gLCDControlBuffer
	ldrh r0, [r0, #0x20]
	b _080AEA68
	.align 2, 0
_080AEA54: .4byte gLCDControlBuffer
_080AEA58:
	ldr r0, _080AEA60  @ gLCDControlBuffer
	ldrh r0, [r0, #0x24]
	b _080AEA68
	.align 2, 0
_080AEA60: .4byte gLCDControlBuffer
_080AEA64:
	ldr r0, _080AEA6C  @ gLCDControlBuffer
	ldrh r0, [r0, #0x28]
_080AEA68:
	pop {r1}
	bx r1
	.align 2, 0
_080AEA6C: .4byte gLCDControlBuffer

	THUMB_FUNC_END sub_80AEA24

	THUMB_FUNC_START sub_80AEA70
sub_80AEA70: @ 0x080AEA70
	push {lr}
	adds r1, r0, #0
	cmp r1, #1
	beq _080AEA98
	cmp r1, #1
	bgt _080AEA82
	cmp r1, #0
	beq _080AEA8C
	b _080AEAB4
_080AEA82:
	cmp r1, #2
	beq _080AEAA4
	cmp r1, #3
	beq _080AEAB0
	b _080AEAB4
_080AEA8C:
	ldr r0, _080AEA94  @ gLCDControlBuffer
	ldrh r0, [r0, #0x1e]
	b _080AEAB4
	.align 2, 0
_080AEA94: .4byte gLCDControlBuffer
_080AEA98:
	ldr r0, _080AEAA0  @ gLCDControlBuffer
	ldrh r0, [r0, #0x22]
	b _080AEAB4
	.align 2, 0
_080AEAA0: .4byte gLCDControlBuffer
_080AEAA4:
	ldr r0, _080AEAAC  @ gLCDControlBuffer
	ldrh r0, [r0, #0x26]
	b _080AEAB4
	.align 2, 0
_080AEAAC: .4byte gLCDControlBuffer
_080AEAB0:
	ldr r0, _080AEAB8  @ gLCDControlBuffer
	ldrh r0, [r0, #0x2a]
_080AEAB4:
	pop {r1}
	bx r1
	.align 2, 0
_080AEAB8: .4byte gLCDControlBuffer

	THUMB_FUNC_END sub_80AEA70

	THUMB_FUNC_START sub_80AEABC
sub_80AEABC: @ 0x080AEABC
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	adds r0, r4, #0
	adds r1, r5, #0
	bl strcpy
	adds r0, r5, #0
	bl strlen
	adds r4, r4, r0
	adds r0, r4, #0
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80AEABC

	THUMB_FUNC_START sub_80AEADC
sub_80AEADC: @ 0x080AEADC
	strb r0, [r1]
	adds r1, #1
	movs r0, #0
	strb r0, [r1]
	adds r0, r1, #0
	bx lr

	THUMB_FUNC_END sub_80AEADC

	THUMB_FUNC_START sub_80AEAE8
sub_80AEAE8: @ 0x080AEAE8
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	adds r6, r1, #0
	ldr r0, [r5]
	mov r1, sp
	bl GetCharTextLen
	adds r4, r0, #0
	ldr r1, [r5]
	subs r4, r4, r1
	ldr r0, [r6]
	adds r2, r4, #0
	bl memcpy
	ldr r0, [r5]
	adds r0, r0, r4
	str r0, [r5]
	ldr r0, [r6]
	adds r0, r0, r4
	str r0, [r6]
	adds r0, r4, #0
	add sp, #4
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80AEAE8

	THUMB_FUNC_START sub_80AEB1C
sub_80AEB1C: @ 0x080AEB1C
	push {lr}
	movs r0, #0
	bl SetPrimaryHBlankHandler
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80AEB1C

	THUMB_FUNC_START sub_80AEB28
sub_80AEB28: @ 0x080AEB28
	push {lr}
	sub sp, #4
	adds r3, r0, #0
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #0
	str r0, [sp]
	movs r2, #0
	bl CallSomeSoundMaybe
	add sp, #4
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80AEB28

	THUMB_FUNC_START sub_80AEB44
sub_80AEB44: @ 0x080AEB44
	push {lr}
	sub sp, #4
	movs r2, #0x80
	lsls r2, r2, #1
	movs r1, #0
	str r1, [sp]
	adds r1, r2, #0
	movs r3, #0x20
	bl CallSomeSoundMaybe
	add sp, #4
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80AEB44

	THUMB_FUNC_START sub_80AEB60
sub_80AEB60: @ 0x080AEB60
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080AEB88  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080AEB76
	movs r0, #0x70
	bl m4aSongNumStart
_080AEB76:
	ldr r0, [r4, #0x2c]
	ldr r1, [r4, #0x30]
	ldr r2, [r4, #0x58]
	bl StartHelpBox_Unk
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080AEB88: .4byte gPlaySt

	THUMB_FUNC_END sub_80AEB60

	THUMB_FUNC_START sub_80AEB8C
sub_80AEB8C: @ 0x080AEB8C
	push {lr}
	adds r2, r0, #0
	ldr r0, _080AEBC0  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	ldr r0, _080AEBC4  @ 0x0000030B
	ands r0, r1
	cmp r0, #0
	beq _080AEBBA
	adds r0, r2, #0
	bl Proc_Break
	ldr r0, _080AEBC8  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080AEBB6
	movs r0, #0x71
	bl m4aSongNumStart
_080AEBB6:
	bl CloseHelpBox
_080AEBBA:
	pop {r0}
	bx r0
	.align 2, 0
_080AEBC0: .4byte gKeyStatusPtr
_080AEBC4: .4byte 0x0000030B
_080AEBC8: .4byte gPlaySt

	THUMB_FUNC_END sub_80AEB8C

	THUMB_FUNC_START sub_80AEBCC
sub_80AEBCC: @ 0x080AEBCC
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	adds r1, r3, #0
	ldr r0, _080AEBE8  @ gUnknown_08A20E44
	bl Proc_StartBlocking
	str r4, [r0, #0x2c]
	str r5, [r0, #0x30]
	str r6, [r0, #0x58]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080AEBE8: .4byte gUnknown_08A20E44

	THUMB_FUNC_END sub_80AEBCC

	THUMB_FUNC_START sub_80AEBEC
sub_80AEBEC: @ 0x080AEBEC
	push {r4, lr}
	movs r4, #0
_080AEBF0:
	adds r4, #1
	movs r1, #0xa
	bl __divsi3
	cmp r0, #0
	bne _080AEBF0
	adds r0, r4, #0
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80AEBEC

	THUMB_FUNC_START sub_80AEC04
sub_80AEC04: @ 0x080AEC04
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r5, r1, #0
	ldr r4, [sp, #0x14]
	ldr r0, [sp, #0x18]
	subs r7, r2, r6
	subs r2, r0, r5
	adds r1, r7, #0
	muls r1, r2, r1
	subs r3, r3, r5
	subs r4, r4, r6
	adds r0, r3, #0
	muls r0, r4, r0
	subs r1, r1, r0
	cmp r1, #0
	blt _080AEC4C
	ldr r0, [sp, #0x20]
	subs r5, r0, r5
	adds r1, r4, #0
	muls r1, r5, r1
	ldr r0, [sp, #0x1c]
	subs r4, r0, r6
	adds r0, r2, #0
	muls r0, r4, r0
	subs r1, r1, r0
	cmp r1, #0
	blt _080AEC4C
	adds r0, r4, #0
	muls r0, r3, r0
	adds r1, r5, #0
	muls r1, r7, r1
	subs r0, r0, r1
	cmp r0, #0
	blt _080AEC4C
	movs r0, #1
	b _080AEC4E
_080AEC4C:
	movs r0, #0
_080AEC4E:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80AEC04

	THUMB_FUNC_START sub_80AEC54
sub_80AEC54: @ 0x080AEC54
	push {lr}
	sub sp, #0x64
	mov r0, sp
	bl ReadGlobalSaveInfo
	movs r0, #0
	add sp, #0x64
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80AEC54

	THUMB_FUNC_START sub_80AEC68
sub_80AEC68: @ 0x080AEC68
	push {lr}
	sub sp, #0x64
	mov r0, sp
	bl ReadGlobalSaveInfo
	movs r0, #0
	add sp, #0x64
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80AEC68

	THUMB_FUNC_START sub_80AEC7C
sub_80AEC7C: @ 0x080AEC7C
	push {lr}
	adds r0, #0x34
	ldrb r0, [r0]
	cmp r0, #0x64
	beq _080AEC8A
	movs r0, #0
	b _080AEC8C
_080AEC8A:
	movs r0, #1
_080AEC8C:
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80AEC7C

	THUMB_FUNC_START sub_80AEC90
sub_80AEC90: @ 0x080AEC90
	movs r0, #0
	bx lr

	THUMB_FUNC_END sub_80AEC90

	THUMB_FUNC_START sub_80AEC94
sub_80AEC94: @ 0x080AEC94
	push {lr}
	movs r2, #0
	ldr r1, _080AECA8  @ gSoundRoomTable
_080AEC9A:
	ldr r0, [r1]
	cmp r0, #0
	blt _080AECAC
	adds r1, #0x10
	adds r2, #1
	b _080AEC9A
	.align 2, 0
_080AECA8: .4byte gSoundRoomTable
_080AECAC:
	adds r0, r2, #0
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80AEC94

	THUMB_FUNC_START sub_80AECB4
sub_80AECB4: @ 0x080AECB4
	push {r4, r5, lr}
	movs r3, #0
	movs r4, #0
	ldr r0, _080AECD0  @ gSoundRoomTable
	adds r5, r0, #0
	adds r5, #8
	adds r2, r0, #0
_080AECC2:
	lsls r1, r3, #4
	ldr r0, [r2]
	cmp r0, #0
	bge _080AECD4
	adds r0, r4, #0
	b _080AECE4
	.align 2, 0
_080AECD0: .4byte gSoundRoomTable
_080AECD4:
	adds r0, r1, r5
	ldr r0, [r0]
	cmp r0, #0
	beq _080AECDE
	adds r4, #1
_080AECDE:
	adds r2, #0x10
	adds r3, #1
	b _080AECC2
_080AECE4:
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80AECB4

	THUMB_FUNC_START sub_80AECEC
sub_80AECEC: @ 0x080AECEC
	push {lr}
	asrs r3, r1, #5
	lsls r3, r3, #2
	adds r3, r3, r0
	movs r2, #0x1f
	ands r2, r1
	ldr r0, [r3, #0x40]
	lsrs r0, r2
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _080AED08
	movs r0, #0
	b _080AED0A
_080AED08:
	movs r0, #1
_080AED0A:
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80AECEC

	THUMB_FUNC_START sub_80AED10
sub_80AED10: @ 0x080AED10
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	movs r2, #0
	movs r4, #0
	ldr r3, _080AED2C  @ gSoundRoomTable
	adds r5, r3, #0
_080AED1C:
	lsls r1, r2, #4
	adds r0, r1, r5
	ldr r0, [r0]
	cmp r0, #0
	bge _080AED30
	adds r0, r4, #0
	b _080AED5E
	.align 2, 0
_080AED2C: .4byte gSoundRoomTable
_080AED30:
	adds r0, r3, #0
	adds r0, #8
	adds r0, r1, r0
	ldr r0, [r0]
	cmp r0, #0
	beq _080AED56
	asrs r1, r2, #5
	lsls r1, r1, #2
	adds r1, r1, r6
	movs r0, #0x1f
	ands r0, r2
	ldr r1, [r1, #0x40]
	lsrs r1, r0
	movs r0, #1
	ands r1, r0
	adds r0, r2, #1
	cmp r1, #0
	beq _080AED5A
	b _080AED58
_080AED56:
	adds r0, r2, #1
_080AED58:
	adds r4, r0, #0
_080AED5A:
	adds r2, r0, #0
	b _080AED1C
_080AED5E:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80AED10

	THUMB_FUNC_START sub_80AED64
sub_80AED64: @ 0x080AED64
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x2c
	adds r7, r0, #0
	bl sub_80AEC94
	movs r1, #0x36
	adds r1, r1, r7
	mov r8, r1
	movs r1, #0
	mov r2, r8
	strb r0, [r2]
	add r0, sp, #0x24
	movs r4, #0
	strh r1, [r0]
	adds r1, r7, #0
	adds r1, #0x40
	ldr r2, _080AEEB8  @ 0x01000008
	bl CpuSet
	adds r5, r7, #0
	adds r5, #0x33
	strb r4, [r5]
	mov r0, sp
	bl LoadAndVerfyLinkArenaStruct1
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080AEE9A
	movs r6, #0
	ldr r1, _080AEEBC  @ gSoundRoomTable
	ldr r0, [r1]
	mov r9, r8
	mov r8, r5
	movs r3, #0x34
	adds r3, r3, r7
	mov sl, r3
	cmp r0, #0
	blt _080AEE0C
	movs r4, #0
	movs r0, #8
	adds r0, r0, r1
	mov ip, r0
_080AEDC0:
	mov r2, ip
	ldr r0, [r2]
	cmp r0, #0
	bne _080AEDFA
	adds r0, r4, r1
	ldr r1, [r0]
	asrs r0, r1, #5
	lsls r0, r0, #2
	add r0, sp
	movs r3, #0x1f
	ands r1, r3
	ldr r0, [r0]
	lsrs r0, r1
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _080AEDFA
	asrs r2, r6, #5
	lsls r2, r2, #2
	adds r2, r2, r7
	adds r0, r6, #0
	ands r0, r3
	lsls r1, r0
	ldr r0, [r2, #0x40]
	orrs r0, r1
	str r0, [r2, #0x40]
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
_080AEDFA:
	adds r4, #0x10
	movs r3, #0x10
	add ip, r3
	adds r6, #1
	ldr r1, _080AEEBC  @ gSoundRoomTable
	adds r0, r4, r1
	ldr r0, [r0]
	cmp r0, #0
	bge _080AEDC0
_080AEE0C:
	bl sub_80AECB4
	adds r2, r0, #0
	mov r0, r8
	ldrb r1, [r0]
	movs r0, #0x64
	muls r0, r1, r0
	mov r3, r9
	ldrb r1, [r3]
	subs r1, r1, r2
	bl __divsi3
	mov r1, sl
	strb r0, [r1]
	movs r6, #0
	ldr r1, _080AEEBC  @ gSoundRoomTable
	ldr r0, [r1]
	cmp r0, #0
	blt _080AEE9A
	movs r5, #0
_080AEE34:
	adds r0, r1, #0
	adds r0, #8
	adds r0, r5, r0
	ldr r2, [r0]
	cmp r2, #0
	beq _080AEE8C
	adds r0, r5, r1
	ldr r1, [r0]
	asrs r0, r1, #5
	lsls r0, r0, #2
	add r0, sp
	movs r3, #0x1f
	ands r1, r3
	ldr r0, [r0]
	lsrs r0, r1
	movs r4, #1
	ands r0, r4
	cmp r0, #0
	bne _080AEE6A
	adds r0, r7, #0
	str r3, [sp, #0x28]
	bl _call_via_r2
	lsls r0, r0, #0x18
	ldr r3, [sp, #0x28]
	cmp r0, #0
	beq _080AEE8C
_080AEE6A:
	asrs r2, r6, #5
	lsls r2, r2, #2
	adds r2, r2, r7
	adds r0, r6, #0
	ands r0, r3
	adds r1, r4, #0
	lsls r1, r0
	ldr r0, [r2, #0x40]
	orrs r0, r1
	str r0, [r2, #0x40]
	mov r2, r8
	ldrb r0, [r2]
	adds r0, #1
	strb r0, [r2]
	adds r0, r7, #0
	adds r0, #0x2e
	strb r4, [r0]
_080AEE8C:
	adds r5, #0x10
	adds r6, #1
	ldr r1, _080AEEBC  @ gSoundRoomTable
	adds r0, r5, r1
	ldr r0, [r0]
	cmp r0, #0
	bge _080AEE34
_080AEE9A:
	adds r0, r7, #0
	bl sub_80AED10
	adds r1, r7, #0
	adds r1, #0x36
	strb r0, [r1]
	add sp, #0x2c
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080AEEB8: .4byte 0x01000008
_080AEEBC: .4byte gSoundRoomTable

	THUMB_FUNC_END sub_80AED64

	THUMB_FUNC_START sub_80AEEC0
sub_80AEEC0: @ 0x080AEEC0
	bx lr

	THUMB_FUNC_END sub_80AEEC0

	THUMB_FUNC_START sub_80AEEC4
sub_80AEEC4: @ 0x080AEEC4
	push {r4, lr}
	sub sp, #4
	ldr r4, [r0, #0x14]
	movs r1, #0x80
	lsls r1, r1, #1
	str r0, [sp]
	movs r0, #0
	movs r2, #0
	movs r3, #0x78
	bl CallSomeSoundMaybe
	adds r4, #0x3f
	movs r0, #1
	strb r0, [r4]
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80AEEC4

	THUMB_FUNC_START sub_80AEEE8
sub_80AEEE8: @ 0x080AEEE8
	push {r4, lr}
	ldr r4, [r0, #0x14]
	adds r0, r4, #0
	adds r0, #0x31
	ldrb r1, [r0]
	ldr r0, _080AEF20  @ gUnknown_08A212E0
	ldr r0, [r0]
	adds r0, r0, r1
	movs r1, #0
	ldrsb r1, [r0, r1]
	adds r0, r4, #0
	movs r2, #0
	bl StartSoundRoomSong
	adds r0, r4, #0
	adds r0, #0x32
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl DrawSoundRoomSongTitle
	adds r4, #0x3f
	movs r0, #0
	strb r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080AEF20: .4byte gUnknown_08A212E0

	THUMB_FUNC_END sub_80AEEE8

	THUMB_FUNC_START sub_80AEF24
sub_80AEF24: @ 0x080AEF24
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080AEF5C  @ gUnknown_08A212E4
	adds r1, r4, #0
	bl Proc_Start
	adds r4, #0x31
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	ldrb r2, [r4]
	ldr r0, _080AEF60  @ gUnknown_08A212E0
	ldr r0, [r0]
	adds r0, r0, r2
	movs r1, #0
	ldrsb r1, [r0, r1]
	movs r0, #1
	negs r0, r0
	cmp r1, r0
	beq _080AEF50
	cmp r2, #0x80
	bne _080AEF54
_080AEF50:
	movs r0, #0
	strb r0, [r4]
_080AEF54:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080AEF5C: .4byte gUnknown_08A212E4
_080AEF60: .4byte gUnknown_08A212E0

	THUMB_FUNC_END sub_80AEF24

	THUMB_FUNC_START sub_80AEF64
sub_80AEF64: @ 0x080AEF64
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	mov r9, r0
	movs r6, #0
	ldr r2, _080AF0AC  @ gUnknown_08A212E0
	movs r0, #1
	negs r0, r0
	adds r1, r0, #0
_080AEF7C:
	ldr r0, [r2]
	adds r0, r0, r6
	strb r1, [r0]
	adds r6, #1
	cmp r6, #0x7f
	ble _080AEF7C
	bl GetGameClock
	adds r3, r0, #0
	movs r0, #0x7f
	ands r3, r0
	adds r2, r3, #0
	movs r6, #0
	mov r7, r9
	adds r7, #0x31
	mov r1, r9
	adds r1, #0x35
	str r1, [sp, #4]
	mov r5, r9
	adds r5, #0x30
	str r5, [sp]
_080AEFA6:
	asrs r0, r2, #5
	lsls r0, r0, #2
	add r0, r9
	movs r1, #0x1f
	ands r1, r2
	ldr r0, [r0, #0x40]
	lsrs r0, r1
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _080AEFC6
	ldr r0, _080AF0AC  @ gUnknown_08A212E0
	ldr r0, [r0]
	adds r0, r0, r6
	strb r2, [r0]
	adds r6, #1
_080AEFC6:
	adds r1, r2, #1
	adds r0, r1, #0
	cmp r1, #0
	bge _080AEFD2
	adds r0, r2, #0
	adds r0, #0x80
_080AEFD2:
	asrs r2, r0, #7
	lsls r0, r2, #7
	subs r2, r1, r0
	cmp r2, r3
	bne _080AEFA6
	mov r8, r6
	bl GetGameClock
	adds r4, r0, #0
	adds r4, #0x7b
	ldr r0, _080AF0AC  @ gUnknown_08A212E0
	mov sl, r0
	movs r6, #0xff
_080AEFEC:
	movs r1, #0xd
	adds r2, r4, #0
	muls r2, r1, r2
	adds r1, r2, #1
	adds r0, r1, #0
	cmp r1, #0
	bge _080AF000
	movs r3, #0x80
	lsls r3, r3, #8
	adds r0, r2, r3
_080AF000:
	asrs r4, r0, #0xf
	lsls r0, r4, #0xf
	subs r4, r1, r0
	asrs r0, r4, #8
	mov r1, r8
	bl __modsi3
	adds r5, r0, #0
	movs r0, #0xd
	adds r2, r4, #0
	muls r2, r0, r2
	adds r1, r2, #1
	adds r0, r1, #0
	cmp r1, #0
	bge _080AF024
	movs r3, #0x80
	lsls r3, r3, #8
	adds r0, r2, r3
_080AF024:
	asrs r4, r0, #0xf
	lsls r0, r4, #0xf
	subs r4, r1, r0
	asrs r0, r4, #8
	mov r1, r8
	bl __modsi3
	adds r3, r0, #0
	cmp r5, r3
	beq _080AF068
	mov r1, sl
	ldr r0, [r1]
	adds r1, r0, r5
	adds r0, r0, r3
	ldrb r0, [r0]
	ldrb r2, [r1]
	adds r0, r0, r2
	strb r0, [r1]
	mov r1, sl
	ldr r0, [r1]
	adds r2, r0, r3
	adds r0, r0, r5
	ldrb r0, [r0]
	ldrb r1, [r2]
	subs r0, r0, r1
	strb r0, [r2]
	mov r2, sl
	ldr r1, [r2]
	adds r2, r1, r5
	adds r1, r1, r3
	ldrb r0, [r2]
	ldrb r1, [r1]
	subs r0, r0, r1
	strb r0, [r2]
_080AF068:
	subs r6, #1
	cmp r6, #0
	bge _080AEFEC
	movs r0, #0
	strb r0, [r7]
	ldr r3, [sp, #4]
	ldrb r2, [r3]
	lsrs r0, r2, #5
	lsls r0, r0, #2
	add r0, r9
	movs r1, #0x1f
	ands r1, r2
	ldr r0, [r0, #0x40]
	lsrs r0, r1
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _080AF0C4
	ldr r0, _080AF0AC  @ gUnknown_08A212E0
	ldr r1, [r0]
	movs r0, #0
	ldrsb r0, [r1, r0]
	adds r5, r2, #0
	cmp r0, r5
	beq _080AF0C4
	adds r3, r7, #0
	movs r4, #0
	ldr r2, [sp, #4]
_080AF0A0:
	ldrb r0, [r3]
	cmp r0, #0x80
	bne _080AF0B0
	strb r4, [r7]
	b _080AF0C4
	.align 2, 0
_080AF0AC: .4byte gUnknown_08A212E0
_080AF0B0:
	adds r0, #1
	strb r0, [r7]
	ldrb r0, [r7]
	adds r0, r1, r0
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldrb r5, [r2]
	cmp r0, r5
	bne _080AF0A0
_080AF0C4:
	movs r0, #1
	ldr r1, [sp]
	strb r0, [r1]
	mov r0, r9
	bl sub_80AEF24
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80AEF64

	THUMB_FUNC_START sub_80AF0E0
sub_80AF0E0: @ 0x080AF0E0
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x32
	ldrb r0, [r0]
	adds r2, r0, #1
	movs r0, #0x7f
	ands r2, r0
_080AF0EE:
	lsrs r0, r2, #5
	lsls r0, r0, #2
	adds r0, r0, r4
	movs r1, #0x1f
	ands r1, r2
	ldr r0, [r0, #0x40]
	lsrs r0, r1
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _080AF12A
	adds r0, r4, #0
	adds r1, r2, #0
	movs r2, #0x20
	bl StartSoundRoomSong
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080AF126
	adds r0, r4, #0
	adds r0, #0x32
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl DrawSoundRoomSongTitle
	movs r0, #1
	b _080AF138
_080AF126:
	movs r0, #0
	b _080AF138
_080AF12A:
	adds r1, r2, #1
	lsls r1, r1, #0x18
	movs r0, #0xfe
	lsls r0, r0, #0x17
	ands r0, r1
	lsrs r2, r0, #0x18
	b _080AF0EE
_080AF138:
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80AF0E0

	THUMB_FUNC_START sub_80AF140
sub_80AF140: @ 0x080AF140
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x32
	ldrb r0, [r0]
	subs r2, r0, #1
	movs r0, #0x7f
	ands r2, r0
_080AF14E:
	lsrs r0, r2, #5
	lsls r0, r0, #2
	adds r0, r0, r4
	movs r1, #0x1f
	ands r1, r2
	ldr r0, [r0, #0x40]
	lsrs r0, r1
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _080AF18A
	adds r0, r4, #0
	adds r1, r2, #0
	movs r2, #0x20
	bl StartSoundRoomSong
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080AF186
	adds r0, r4, #0
	adds r0, #0x32
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl DrawSoundRoomSongTitle
	movs r0, #1
	b _080AF198
_080AF186:
	movs r0, #0
	b _080AF198
_080AF18A:
	subs r1, r2, #1
	lsls r1, r1, #0x18
	movs r0, #0xfe
	lsls r0, r0, #0x17
	ands r0, r1
	lsrs r2, r0, #0x18
	b _080AF14E
_080AF198:
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80AF140

	THUMB_FUNC_START sub_80AF1A0
sub_80AF1A0: @ 0x080AF1A0
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r6, _080AF1D4  @ gUnknown_0201F19C
	lsls r1, r4, #1
	adds r0, r1, r4
	lsls r0, r0, #4
	adds r0, r0, r4
	adds r2, r0, r6
	movs r3, #0x2f
_080AF1B4:
	ldrb r0, [r2, #1]
	strb r0, [r2]
	adds r2, #1
	subs r3, #1
	cmp r3, #0
	bge _080AF1B4
	adds r0, r1, r4
	lsls r0, r0, #4
	adds r0, r0, r4
	adds r1, r6, #0
	adds r1, #0x30
	adds r0, r0, r1
	strb r5, [r0]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080AF1D4: .4byte gUnknown_0201F19C

	THUMB_FUNC_END sub_80AF1A0

	THUMB_FUNC_START sub_80AF1D8
sub_80AF1D8: @ 0x080AF1D8
	push {r4, r5, lr}
	movs r1, #0
	ldr r5, _080AF210  @ gUnknown_08A2C838
	ldr r3, _080AF214  @ gUnknown_0201F19C
	movs r2, #0
	adds r4, r3, #0
	adds r4, #0x31
_080AF1E6:
	adds r0, r1, r3
	strb r2, [r0]
	adds r0, r1, r4
	strb r2, [r0]
	adds r1, #1
	cmp r1, #0x30
	ble _080AF1E6
	ldr r1, _080AF218  @ 0x06010800
	adds r0, r5, #0
	bl Decompress
	ldr r0, _080AF21C  @ gUnknown_08A2C8A8
	movs r1, #0xe8
	lsls r1, r1, #2
	movs r2, #0x60
	bl CopyToPaletteBuffer
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080AF210: .4byte gUnknown_08A2C838
_080AF214: .4byte gUnknown_0201F19C
_080AF218: .4byte 0x06010800
_080AF21C: .4byte gUnknown_08A2C8A8

	THUMB_FUNC_END sub_80AF1D8

	THUMB_FUNC_START sub_80AF220
sub_80AF220: @ 0x080AF220
	movs r1, #0
	str r1, [r0, #0x2c]
	bx lr

	THUMB_FUNC_END sub_80AF220

	THUMB_FUNC_START nullsub_65
nullsub_65: @ 0x080AF228
	bx lr

	THUMB_FUNC_END nullsub_65

	THUMB_FUNC_START sub_80AF22C
sub_80AF22C: @ 0x080AF22C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r4, r0, #0
	movs r7, #0
	movs r5, #0
	movs r0, #0xff
	mov r8, r0
	mov ip, r0
	movs r6, #0
	ldr r1, _080AF32C  @ gUnknown_08A212DC
	mov r9, r1
	movs r2, #0xd4
	lsls r2, r2, #2
	mov sl, r2
_080AF250:
	mov r0, r9
	ldr r2, [r0]
	lsls r3, r6, #1
	adds r2, r3, r2
	str r2, [sp]
	ldr r2, _080AF330  @ gUnknown_08A21304
	ldr r1, [r2]
	ldr r0, [r4, #0x2c]
	movs r2, #0xc6
	lsls r2, r2, #3
	adds r0, r0, r2
	add r1, sl
	adds r1, r1, r0
	ldrb r0, [r1]
	subs r0, #0x80
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x19
	ldr r1, [sp]
	strb r0, [r1]
	mov r0, r9
	ldr r2, [r0]
	adds r2, r3, r2
	ldr r1, _080AF330  @ gUnknown_08A21304
	ldr r0, [r1]
	add r0, sl
	ldr r1, [r4, #0x2c]
	adds r0, r0, r1
	ldrb r0, [r0]
	subs r0, #0x80
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x19
	movs r1, #0xf0
	subs r1, r1, r0
	strb r1, [r2, #1]
	mov r2, r9
	ldr r0, [r2]
	adds r3, r3, r0
	ldrb r0, [r3]
	cmp r0, r5
	bcs _080AF2A2
	adds r0, r5, #0
_080AF2A2:
	adds r5, r0, #0
	ldrb r0, [r3]
	cmp r0, ip
	bls _080AF2AC
	mov r0, ip
_080AF2AC:
	mov ip, r0
	ldrb r3, [r3, #1]
	adds r0, r3, #0
	cmp r3, r7
	bcs _080AF2B8
	adds r3, r7, #0
_080AF2B8:
	adds r7, r3, #0
	adds r1, r0, #0
	lsls r0, r1, #0x18
	lsrs r0, r0, #0x18
	cmp r0, r8
	bls _080AF2C6
	mov r1, r8
_080AF2C6:
	lsls r0, r1, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	ldr r0, [r4, #0x2c]
	adds r1, r0, #1
	str r1, [r4, #0x2c]
	ldr r0, _080AF334  @ 0x0000062F
	cmp r1, r0
	ble _080AF2E0
	movs r2, #0xc6
	lsls r2, r2, #3
	subs r0, r1, r2
	str r0, [r4, #0x2c]
_080AF2E0:
	adds r6, #1
	cmp r6, #0xdf
	ble _080AF250
	mov r1, ip
	subs r0, r5, r1
	cmp r0, #0x3f
	ble _080AF2F0
	movs r0, #0x3f
_080AF2F0:
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	mov r2, r8
	subs r0, r7, r2
	cmp r0, #0x3f
	ble _080AF2FE
	movs r0, #0x3f
_080AF2FE:
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	lsls r0, r5, #1
	adds r0, r0, r5
	asrs r1, r0, #2
	movs r0, #0
	bl sub_80AF1A0
	lsls r0, r7, #1
	adds r0, r0, r7
	asrs r1, r0, #2
	movs r0, #1
	bl sub_80AF1A0
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080AF32C: .4byte gUnknown_08A212DC
_080AF330: .4byte gUnknown_08A21304
_080AF334: .4byte 0x0000062F

	THUMB_FUNC_END sub_80AF22C

	THUMB_FUNC_START sub_80AF338
sub_80AF338: @ 0x080AF338
	push {lr}
	ldrh r1, [r0, #0x2a]
	adds r0, #0x36
	ldrb r0, [r0]
	adds r2, r0, #3
	asrs r2, r2, #2
	movs r0, #8
	movs r3, #5
	bl UpdateMenuScrollBarConfig
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80AF338

	THUMB_FUNC_START sub_80AF350
sub_80AF350: @ 0x080AF350
	push {lr}
	adds r2, r0, #0
	adds r0, #0x35
	ldrb r1, [r0]
	movs r0, #3
	ands r0, r1
	lsls r0, r0, #5
	adds r0, #0x60
	lsrs r1, r1, #2
	lsls r1, r1, #4
	ldrh r2, [r2, #0x2a]
	subs r2, #0x40
	subs r1, r1, r2
	movs r3, #0x80
	lsls r3, r3, #4
	movs r2, #2
	bl ShowPrepScreenHandCursor
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80AF350

	THUMB_FUNC_START sub_80AF378
sub_80AF378: @ 0x080AF378
	push {r4, lr}
	adds r2, r0, #0
	adds r0, #0x35
	ldrb r0, [r0]
	lsrs r0, r0, #2
	lsls r0, r0, #4
	ldrh r1, [r2, #0x2a]
	subs r0, r0, r1
	cmp r0, #0
	bge _080AF38E
	adds r0, #0xf
_080AF38E:
	asrs r4, r0, #4
	cmp r1, #0
	beq _080AF39E
	cmp r4, #0
	bgt _080AF39E
	movs r0, #1
	negs r0, r0
	b _080AF3C2
_080AF39E:
	ldrh r0, [r2, #0x2a]
	lsrs r0, r0, #4
	adds r3, r0, #5
	adds r0, r2, #0
	adds r0, #0x36
	ldrb r1, [r0]
	subs r0, r1, #1
	cmp r0, #0
	bge _080AF3B2
	adds r0, r1, #2
_080AF3B2:
	asrs r0, r0, #2
	cmp r3, r0
	bgt _080AF3C0
	cmp r4, #3
	ble _080AF3C0
	movs r0, #1
	b _080AF3C2
_080AF3C0:
	movs r0, #0
_080AF3C2:
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80AF378

	THUMB_FUNC_START sub_80AF3C8
sub_80AF3C8: @ 0x080AF3C8
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	ldrh r0, [r6, #0x2a]
	lsrs r0, r0, #4
	subs r0, #1
	lsls r7, r0, #2
	ldr r0, _080AF3E4  @ gBG2TilemapBuffer
	movs r1, #0
	bl BG_Fill
	adds r4, r7, #0
	adds r0, r4, #0
	b _080AF4A8
	.align 2, 0
_080AF3E4: .4byte gBG2TilemapBuffer
_080AF3E8:
	adds r0, r6, #0
	adds r1, r4, #0
	bl sub_80AECEC
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080AF3FA
	movs r5, #0
	b _080AF440
_080AF3FA:
	ldr r0, _080AF438  @ gSoundRoomTable
	lsls r1, r4, #4
	adds r0, #8
	adds r1, r1, r0
	ldr r0, [r1]
	cmp r0, #0
	beq _080AF440
	adds r2, r4, #0
	cmp r4, #0
	bge _080AF410
	adds r2, r4, #3
_080AF410:
	asrs r2, r2, #2
	lsls r0, r2, #1
	adds r0, #8
	movs r1, #0x1f
	ands r0, r1
	lsls r0, r0, #5
	adds r0, #0xc
	lsls r2, r2, #2
	subs r2, r4, r2
	lsls r2, r2, #2
	adds r0, r0, r2
	lsls r0, r0, #1
	ldr r1, _080AF43C  @ gBG2TilemapBuffer
	adds r0, r0, r1
	movs r1, #1
	movs r2, #0x14
	movs r3, #0x14
	bl PutTwoSpecialChar
	b _080AF4A4
	.align 2, 0
_080AF438: .4byte gSoundRoomTable
_080AF43C: .4byte gBG2TilemapBuffer
_080AF440:
	cmp r4, #0x62
	ble _080AF478
	adds r2, r4, #0
	cmp r4, #0
	bge _080AF44C
	adds r2, r4, #3
_080AF44C:
	asrs r2, r2, #2
	lsls r0, r2, #1
	adds r0, #8
	movs r1, #0x1f
	ands r0, r1
	lsls r0, r0, #5
	adds r0, #0xd
	lsls r2, r2, #2
	subs r2, r4, r2
	lsls r2, r2, #2
	adds r0, r0, r2
	lsls r0, r0, #1
	ldr r1, _080AF474  @ gBG2TilemapBuffer
	adds r0, r0, r1
	adds r2, r4, #1
	adds r1, r5, #0
	bl PutNumber
	b _080AF4A4
	.align 2, 0
_080AF474: .4byte gBG2TilemapBuffer
_080AF478:
	adds r2, r4, #0
	cmp r4, #0
	bge _080AF480
	adds r2, r4, #3
_080AF480:
	asrs r2, r2, #2
	lsls r0, r2, #1
	adds r0, #8
	movs r1, #0x1f
	ands r0, r1
	lsls r0, r0, #5
	adds r0, #0xd
	lsls r2, r2, #2
	subs r2, r4, r2
	lsls r2, r2, #2
	adds r0, r0, r2
	lsls r0, r0, #1
	ldr r1, _080AF4CC  @ gBG2TilemapBuffer
	adds r0, r0, r1
	adds r2, r4, #1
	adds r1, r5, #0
	bl PutNumber2Digit
_080AF4A4:
	adds r4, #1
	adds r0, r7, #0
_080AF4A8:
	adds r0, #0x1c
	cmp r4, r0
	bge _080AF4BE
	movs r5, #1
	cmp r4, #0
	blt _080AF4A4
	adds r0, r6, #0
	adds r0, #0x36
	ldrb r0, [r0]
	cmp r4, r0
	blt _080AF3E8
_080AF4BE:
	movs r0, #4
	bl BG_EnableSyncByMask
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080AF4CC: .4byte gBG2TilemapBuffer

	THUMB_FUNC_END sub_80AF3C8

	THUMB_FUNC_START sub_80AF4D0
sub_80AF4D0: @ 0x080AF4D0
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	ldr r6, _080AF50C  @ gUnknown_0201F160
	adds r0, r6, #0
	adds r1, r5, #0
	bl PutText
	adds r3, r5, #0
	adds r3, #0x10
	adds r4, #0x34
	ldrb r0, [r4]
	movs r1, #2
	cmp r0, #0x64
	bne _080AF4F0
	movs r1, #4
_080AF4F0:
	ldrb r2, [r4]
	adds r0, r3, #0
	bl PutNumber
	adds r0, r6, #0
	adds r0, #0x30
	adds r1, r5, #0
	adds r1, #0x12
	bl PutText
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080AF50C: .4byte gUnknown_0201F160

	THUMB_FUNC_END sub_80AF4D0

	THUMB_FUNC_START sub_80AF510
sub_80AF510: @ 0x080AF510
	push {lr}
	adds r1, r0, #0
	ldrh r0, [r1, #0x2c]
	cmp r0, #0
	beq _080AF51E
	adds r0, #1
	strh r0, [r1, #0x2c]
_080AF51E:
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80AF510

.align 2, 0
