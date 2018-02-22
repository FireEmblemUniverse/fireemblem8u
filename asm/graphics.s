	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	THUMB_FUNC_START CopyToPaletteBuffer
CopyToPaletteBuffer: @ 0x08000DB8
	push {r4, lr}
	adds r4, r0, #0
	adds r3, r2, #0
	movs r0, #0x1f
	ands r0, r3
	cmp r0, #0
	beq _08000DE4
	asrs r1, r1, #1
	lsls r1, r1, #1
	ldr r0, _08000DE0  @ gUnknown_020228A8
	adds r1, r1, r0
	lsrs r2, r3, #0x1f
	adds r2, r3, r2
	lsls r2, r2, #0xa
	lsrs r2, r2, #0xb
	adds r0, r4, #0
	bl CpuSet
	b _08000DFE
	.align 2, 0
_08000DE0: .4byte gUnknown_020228A8
_08000DE4:
	asrs r0, r1, #1
	lsls r0, r0, #1
	ldr r1, _08000E0C  @ gUnknown_020228A8
	adds r1, r0, r1
	adds r2, r3, #0
	cmp r2, #0
	bge _08000DF4
	adds r2, #3
_08000DF4:
	lsls r2, r2, #9
	lsrs r2, r2, #0xb
	adds r0, r4, #0
	bl CpuFastSet
_08000DFE:
	ldr r1, _08000E10  @ gUnknown_0300000E
	movs r0, #1
	strb r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08000E0C: .4byte gUnknown_020228A8
_08000E10: .4byte gUnknown_0300000E

	THUMB_FUNC_START sub_8000E14
sub_8000E14: @ 0x08000E14
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r7, r2, #0
	adds r6, r3, #0
	asrs r1, r1, #1
	lsls r1, r1, #1
	ldr r2, _08000E94  @ gUnknown_020228A8
	adds r5, r1, r2
	adds r4, r0, #0
	ldr r0, _08000E98  @ gUnknown_0300000E
	mov sl, r0
	cmp r7, #0
	ble _08000E7E
	movs r1, #0x1f
	mov sb, r1
	movs r2, #0xf8
	lsls r2, r2, #2
	mov r8, r2
	movs r0, #0xf8
	lsls r0, r0, #7
	mov ip, r0
	adds r3, r7, #0
_08000E46:
	ldrh r2, [r4]
	movs r0, #0x1f
	ands r0, r2
	adds r1, r0, #0
	muls r1, r6, r1
	asrs r1, r1, #6
	mov r7, sb
	ands r1, r7
	mov r0, r8
	ands r0, r2
	muls r0, r6, r0
	asrs r0, r0, #6
	mov r7, r8
	ands r0, r7
	adds r1, r1, r0
	mov r0, ip
	ands r0, r2
	muls r0, r6, r0
	asrs r0, r0, #6
	mov r2, ip
	ands r0, r2
	adds r1, r1, r0
	strh r1, [r5]
	adds r5, #2
	adds r4, #2
	subs r3, #1
	cmp r3, #0
	bne _08000E46
_08000E7E:
	movs r0, #1
	mov r7, sl
	strb r0, [r7]
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08000E94: .4byte gUnknown_020228A8
_08000E98: .4byte gUnknown_0300000E

	THUMB_FUNC_START FlushLCDControl
FlushLCDControl: @ 0x08000E9C
	movs r1, #0x80
	lsls r1, r1, #0x13
	ldr r2, _08000F40  @ gUnknown_03003080
	ldrh r0, [r2]
	strh r0, [r1]
	adds r1, #4
	ldrh r0, [r2, #4]
	strh r0, [r1]
	adds r1, #4
	ldrh r0, [r2, #0xc]
	strh r0, [r1]
	adds r1, #2
	ldrh r0, [r2, #0x10]
	strh r0, [r1]
	adds r1, #2
	ldrh r0, [r2, #0x14]
	strh r0, [r1]
	adds r1, #2
	ldrh r0, [r2, #0x18]
	strh r0, [r1]
	adds r1, #2
	ldr r0, [r2, #0x1c]
	str r0, [r1]
	adds r1, #4
	ldr r0, [r2, #0x20]
	str r0, [r1]
	adds r1, #4
	ldr r0, [r2, #0x24]
	str r0, [r1]
	adds r1, #4
	ldr r0, [r2, #0x28]
	str r0, [r1]
	adds r1, #0x24
	ldr r0, [r2, #0x2c]
	str r0, [r1]
	adds r1, #4
	ldr r0, [r2, #0x30]
	str r0, [r1]
	adds r1, #4
	ldr r0, [r2, #0x34]
	str r0, [r1]
	adds r1, #4
	ldrh r0, [r2, #0x38]
	strh r0, [r1]
	adds r1, #4
	ldrh r0, [r2, #0x3c]
	strh r0, [r1]
	adds r1, #2
	adds r0, r2, #0
	adds r0, #0x44
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, #2
	adds r0, r2, #0
	adds r0, #0x46
	ldrb r0, [r0]
	strb r0, [r1]
	subs r1, #0x34
	ldr r0, [r2, #0x48]
	str r0, [r1]
	adds r1, #4
	ldr r0, [r2, #0x4c]
	str r0, [r1]
	adds r1, #4
	ldr r0, [r2, #0x50]
	str r0, [r1]
	adds r1, #4
	ldr r0, [r2, #0x54]
	str r0, [r1]
	adds r1, #4
	ldr r0, [r2, #0x58]
	str r0, [r1]
	adds r1, #4
	ldr r0, [r2, #0x5c]
	str r0, [r1]
	adds r1, #4
	ldr r0, [r2, #0x60]
	str r0, [r1]
	adds r1, #4
	ldr r0, [r2, #0x64]
	str r0, [r1]
	bx lr
	.align 2, 0
_08000F40: .4byte gUnknown_03003080

	THUMB_FUNC_START GetBackgroundControlBuffer
GetBackgroundControlBuffer: @ 0x08000F44
	push {lr}
	adds r1, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	adds r2, r1, #0
	cmp r1, #1
	beq _08000F70
	cmp r1, #1
	bgt _08000F5C
	cmp r1, #0
	beq _08000F66
	b _08000F82
_08000F5C:
	cmp r2, #2
	beq _08000F78
	cmp r2, #3
	beq _08000F80
	b _08000F82
_08000F66:
	ldr r0, _08000F6C  @ gUnknown_0300308C
	b _08000F82
	.align 2, 0
_08000F6C: .4byte gUnknown_0300308C
_08000F70:
	ldr r0, _08000F74  @ gUnknown_03003090
	b _08000F82
	.align 2, 0
_08000F74: .4byte gUnknown_03003090
_08000F78:
	ldr r0, _08000F7C  @ gUnknown_03003094
	b _08000F82
	.align 2, 0
_08000F7C: .4byte gUnknown_03003094
_08000F80:
	ldr r0, _08000F88  @ gUnknown_03003098
_08000F82:
	pop {r1}
	bx r1
	.align 2, 0
_08000F88: .4byte gUnknown_03003098

	THUMB_FUNC_START GetBackgroundTileDataOffset
GetBackgroundTileDataOffset: @ 0x08000F8C
	push {lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl GetBackgroundControlBuffer
	ldr r0, [r0]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1e
	lsls r0, r0, #0xe
	pop {r1}
	bx r1

	THUMB_FUNC_START GetTileIndex
GetTileIndex: @ 0x08000FA4
	push {r4, lr}
	adds r4, r1, #0
	ldr r1, _08000FC0  @ 0x0000FFFF
	ands r4, r1
	bl GetBackgroundTileDataOffset
	subs r0, r4, r0
	cmp r0, #0
	bge _08000FB8
	adds r0, #0x1f
_08000FB8:
	asrs r0, r0, #5
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08000FC0: .4byte 0x0000FFFF

	THUMB_FUNC_START sub_8000FC4
sub_8000FC4: @ 0x08000FC4
	push {lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl GetBackgroundControlBuffer
	ldr r0, [r0]
	lsls r0, r0, #0x13
	lsrs r0, r0, #0x1b
	lsls r0, r0, #0xb
	pop {r1}
	bx r1

	THUMB_FUNC_START SetBackgroundTileDataOffset
SetBackgroundTileDataOffset: @ 0x08000FDC
	push {r4, lr}
	adds r4, r1, #0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl GetBackgroundControlBuffer
	asrs r4, r4, #0xe
	movs r1, #3
	ands r4, r1
	lsls r4, r4, #2
	ldrb r2, [r0]
	movs r1, #0xd
	rsbs r1, r1, #0
	ands r1, r2
	orrs r1, r4
	strb r1, [r0]
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_START SetBackgroundMapDataOffset
SetBackgroundMapDataOffset: @ 0x08001004
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	lsls r0, r5, #0x10
	lsrs r0, r0, #0x10
	bl GetBackgroundControlBuffer
	adds r3, r0, #0
	ldr r0, _08001044  @ 0x000007FF
	ands r0, r4
	cmp r0, #0
	bne _0800103C
	asrs r1, r4, #0xb
	movs r0, #0x1f
	ands r1, r0
	ldrb r2, [r3, #1]
	movs r0, #0x20
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3, #1]
	ldr r0, _08001048  @ gUnknown_02024CA8
	lsls r1, r5, #2
	adds r1, r1, r0
	movs r0, #0xc0
	lsls r0, r0, #0x13
	orrs r0, r4
	str r0, [r1]
_0800103C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08001044: .4byte 0x000007FF
_08001048: .4byte gUnknown_02024CA8

	THUMB_FUNC_START SetBackgroundScreenSize
SetBackgroundScreenSize: @ 0x0800104C
	push {r4, lr}
	adds r4, r1, #0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl GetBackgroundControlBuffer
	lsls r4, r4, #6
	ldrb r2, [r0, #1]
	movs r1, #0x3f
	ands r1, r2
	orrs r1, r4
	strb r1, [r0, #1]
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_START sub_800106C
sub_800106C: @ 0x0800106C
	push {r4, lr}
	adds r4, r1, #0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl GetBackgroundControlBuffer
	adds r3, r0, #0
	movs r2, #0
	cmp r4, #8
	bne _08001082
	movs r2, #1
_08001082:
	lsls r2, r2, #7
	ldrb r1, [r3]
	movs r0, #0x7f
	ands r0, r1
	orrs r0, r2
	strb r0, [r3]
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_START FlushPalettesAdditive
FlushPalettesAdditive: @ 0x08001094
	push {r4, r5, r6, r7, lr}
	adds r3, r0, #0
	ldr r6, _080010E8  @ gUnknown_020228A8
	movs r5, #0xa0
	lsls r5, r5, #0x13
	movs r4, #0
	movs r7, #0x1f
_080010A2:
	ldrh r0, [r6]
	movs r1, #0x1f
	ands r1, r0
	adds r2, r1, r3
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x15
	ands r1, r7
	adds r1, r1, r3
	lsrs r0, r0, #0x1a
	ands r0, r7
	adds r0, r0, r3
	cmp r2, #0x1f
	ble _080010BE
	movs r2, #0x1f
_080010BE:
	cmp r1, #0x1f
	ble _080010C4
	movs r1, #0x1f
_080010C4:
	cmp r0, #0x1f
	ble _080010CA
	movs r0, #0x1f
_080010CA:
	lsls r0, r0, #0xa
	lsls r1, r1, #5
	adds r0, r0, r1
	adds r0, r0, r2
	strh r0, [r5]
	adds r6, #2
	adds r5, #2
	adds r4, #1
	ldr r0, _080010EC  @ 0x000001FF
	cmp r4, r0
	ble _080010A2
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080010E8: .4byte gUnknown_020228A8
_080010EC: .4byte 0x000001FF

	THUMB_FUNC_START FlushPalettesSubstractive
FlushPalettesSubstractive: @ 0x080010F0
	push {r4, r5, r6, r7, lr}
	adds r3, r0, #0
	ldr r6, _08001144  @ gUnknown_020228A8
	movs r5, #0xa0
	lsls r5, r5, #0x13
	movs r4, #0
	movs r7, #0x1f
_080010FE:
	ldrh r0, [r6]
	movs r1, #0x1f
	ands r1, r0
	adds r2, r1, r3
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x15
	ands r1, r7
	adds r1, r1, r3
	lsrs r0, r0, #0x1a
	ands r0, r7
	adds r0, r0, r3
	cmp r2, #0
	bge _0800111A
	movs r2, #0
_0800111A:
	cmp r1, #0
	bge _08001120
	movs r1, #0
_08001120:
	cmp r0, #0
	bge _08001126
	movs r0, #0
_08001126:
	lsls r0, r0, #0xa
	lsls r1, r1, #5
	adds r0, r0, r1
	adds r0, r0, r2
	strh r0, [r5]
	adds r6, #2
	adds r5, #2
	adds r4, #1
	ldr r0, _08001148  @ 0x000001FF
	cmp r4, r0
	ble _080010FE
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08001144: .4byte gUnknown_020228A8
_08001148: .4byte 0x000001FF

	THUMB_FUNC_START FlushBackgrounds
FlushBackgrounds: @ 0x0800114C
	push {r4, lr}
	ldr r4, _080011DC  @ gUnknown_0300000D
	ldrb r1, [r4]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08001168
	ldr r0, _080011E0  @ gUnknown_02022CA8
	ldr r1, _080011E4  @ gUnknown_02024CA8
	ldr r1, [r1]
	movs r2, #0x80
	lsls r2, r2, #2
	bl CpuFastSet
_08001168:
	ldrb r1, [r4]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08001180
	ldr r0, _080011E8  @ gUnknown_020234A8
	ldr r1, _080011E4  @ gUnknown_02024CA8
	ldr r1, [r1, #4]
	movs r2, #0x80
	lsls r2, r2, #2
	bl CpuFastSet
_08001180:
	ldrb r1, [r4]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _08001198
	ldr r0, _080011EC  @ gUnknown_02023CA8
	ldr r1, _080011E4  @ gUnknown_02024CA8
	ldr r1, [r1, #8]
	movs r2, #0x80
	lsls r2, r2, #2
	bl CpuFastSet
_08001198:
	ldrb r1, [r4]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _080011B0
	ldr r0, _080011F0  @ gUnknown_020244A8
	ldr r1, _080011E4  @ gUnknown_02024CA8
	ldr r1, [r1, #0xc]
	movs r2, #0x80
	lsls r2, r2, #2
	bl CpuFastSet
_080011B0:
	movs r2, #0
	strb r2, [r4]
	ldr r1, _080011F4  @ gUnknown_0300000E
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #1
	bne _0800121A
	strb r2, [r1]
	ldr r0, _080011F8  @ gUnknown_03003080
	adds r0, #0x68
	movs r1, #0
	ldrsb r1, [r0, r1]
	cmp r1, #0
	bne _08001200
	ldr r0, _080011FC  @ gUnknown_020228A8
	movs r1, #0xa0
	lsls r1, r1, #0x13
	movs r2, #0x80
	lsls r2, r2, #1
	bl CpuFastSet
	b _0800121A
	.align 2, 0
_080011DC: .4byte gUnknown_0300000D
_080011E0: .4byte gUnknown_02022CA8
_080011E4: .4byte gUnknown_02024CA8
_080011E8: .4byte gUnknown_020234A8
_080011EC: .4byte gUnknown_02023CA8
_080011F0: .4byte gUnknown_020244A8
_080011F4: .4byte gUnknown_0300000E
_080011F8: .4byte gUnknown_03003080
_080011FC: .4byte gUnknown_020228A8
_08001200:
	cmp r1, #0
	ble _08001210
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl FlushPalettesAdditive
	b _0800121A
_08001210:
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl FlushPalettesSubstractive
_0800121A:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_START BG_Fill
BG_Fill: @ 0x08001220
	push {lr}
	sub sp, #4
	adds r3, r0, #0
	lsls r0, r1, #0x10
	adds r0, r0, r1
	str r0, [sp]
	ldr r2, _0800123C  @ 0x01000200
	mov r0, sp
	adds r1, r3, #0
	bl CpuFastSet
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_0800123C: .4byte 0x01000200

	THUMB_FUNC_START RegisterBlankTile
RegisterBlankTile: @ 0x08001240
	push {lr}
	adds r1, r0, #0
	lsls r1, r1, #5
	movs r0, #0xc0
	lsls r0, r0, #0x13
	adds r1, r1, r0
	movs r0, #0
	movs r2, #0x20
	bl RegisterFillTile
	pop {r0}
	bx r0
