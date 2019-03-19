	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	THUMB_FUNC_START sub_801A9D0
sub_801A9D0: @ 0x0801A9D0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	ldr r1, _0801AAB0  @ gBmMapSize
	movs r2, #2
	ldrsh r0, [r1, r2]
	subs r4, r0, #1
	ldr r7, _0801AAB4  @ gUnknown_03004E60
	mov r9, r7
	cmp r4, #0
	blt _0801AA98
	mov ip, r1
	mov sl, r9
_0801A9EE:
	mov r1, ip
	movs r2, #0
	ldrsh r0, [r1, r2]
	subs r3, r0, #1
	subs r7, r4, #1
	mov r8, r7
	cmp r3, #0
	blt _0801AA92
	lsls r5, r4, #2
	mov r6, sl
_0801AA02:
	ldr r1, _0801AAB8  @ gUnknown_030049A0
	ldr r0, [r1]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r1, r0, r3
	ldrb r0, [r1]
	cmp r0, #0x78
	bhi _0801AA8C
	movs r0, #0
	ldrsb r0, [r1, r0]
	ldrb r2, [r6, #0xb]
	cmp r0, r2
	beq _0801AA8C
	subs r1, #1
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bge _0801AA2C
	cmp r3, #0
	beq _0801AA2C
	strb r2, [r1]
_0801AA2C:
	ldr r2, _0801AAB8  @ gUnknown_030049A0
	ldr r0, [r2]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r1, r3, r0
	movs r0, #1
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bge _0801AA4E
	mov r7, ip
	movs r2, #0
	ldrsh r0, [r7, r2]
	subs r0, #1
	cmp r3, r0
	beq _0801AA4E
	ldrb r0, [r6, #0xb]
	strb r0, [r1, #1]
_0801AA4E:
	ldr r7, _0801AAB8  @ gUnknown_030049A0
	ldr r0, [r7]
	adds r0, r5, r0
	subs r0, #4
	ldr r0, [r0]
	adds r1, r0, r3
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bge _0801AA6A
	cmp r4, #0
	beq _0801AA6A
	ldrb r0, [r6, #0xb]
	strb r0, [r1]
_0801AA6A:
	ldr r1, _0801AAB8  @ gUnknown_030049A0
	ldr r0, [r1]
	adds r0, r5, r0
	ldr r0, [r0, #4]
	adds r1, r0, r3
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bge _0801AA8C
	mov r2, ip
	movs r7, #2
	ldrsh r0, [r2, r7]
	subs r0, #1
	cmp r4, r0
	beq _0801AA8C
	ldrb r0, [r6, #0xb]
	strb r0, [r1]
_0801AA8C:
	subs r3, #1
	cmp r3, #0
	bge _0801AA02
_0801AA92:
	mov r4, r8
	cmp r4, #0
	bge _0801A9EE
_0801AA98:
	mov r1, r9
	ldrb r0, [r1, #0xb]
	adds r0, #1
	strb r0, [r1, #0xb]
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801AAB0: .4byte gBmMapSize
_0801AAB4: .4byte gUnknown_03004E60
_0801AAB8: .4byte gUnknown_030049A0

	THUMB_FUNC_START MapAddInRange
MapAddInRange: @ 0x0801AABC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	str r0, [sp]
	mov r9, r1
	mov r8, r2
	mov sl, r3
	mov r5, r8
	mov r4, r9
	adds r0, r4, r5
	cmp r4, r0
	bgt _0801AB3C
	ldr r1, _0801ABB8  @ gBmMapSize
	movs r2, #2
	ldrsh r0, [r1, r2]
	cmp r4, r0
	bge _0801AB3C
_0801AAE4:
	ldr r6, [sp]
	subs r1, r6, r5
	lsls r0, r5, #1
	adds r0, #1
	cmp r1, #0
	bge _0801AAF4
	adds r0, r0, r1
	movs r1, #0
_0801AAF4:
	adds r3, r1, r0
	ldr r2, _0801ABB8  @ gBmMapSize
	movs r6, #0
	ldrsh r0, [r2, r6]
	cmp r3, r0
	ble _0801AB02
	adds r3, r0, #0
_0801AB02:
	adds r2, r1, #0
	subs r5, #1
	adds r7, r4, #1
	mov r6, r9
	add r6, r8
	cmp r2, r3
	bge _0801AB2C
	ldr r0, _0801ABBC  @ gUnknown_030049A0
	mov ip, r0
	lsls r4, r4, #2
_0801AB16:
	mov r1, ip
	ldr r0, [r1]
	adds r0, r4, r0
	ldr r1, [r0]
	adds r1, r1, r2
	ldrb r0, [r1]
	add r0, sl
	strb r0, [r1]
	adds r2, #1
	cmp r2, r3
	blt _0801AB16
_0801AB2C:
	adds r4, r7, #0
	cmp r4, r6
	bgt _0801AB3C
	ldr r2, _0801ABB8  @ gBmMapSize
	movs r6, #2
	ldrsh r0, [r2, r6]
	cmp r4, r0
	blt _0801AAE4
_0801AB3C:
	mov r5, r8
	subs r5, #1
	mov r4, r9
	subs r4, #1
	mov r0, r9
	mov r1, r8
	subs r0, r0, r1
	mov r8, r0
	cmp r4, r8
	blt _0801ABA6
	cmp r4, #0
	blt _0801ABA6
	ldr r2, _0801ABB8  @ gBmMapSize
	mov ip, r2
	ldr r6, _0801ABBC  @ gUnknown_030049A0
	mov r9, r6
_0801AB5C:
	ldr r0, [sp]
	subs r1, r0, r5
	lsls r0, r5, #1
	adds r0, #1
	cmp r1, #0
	bge _0801AB6C
	adds r0, r0, r1
	movs r1, #0
_0801AB6C:
	adds r3, r1, r0
	mov r2, ip
	movs r6, #0
	ldrsh r0, [r2, r6]
	cmp r3, r0
	ble _0801AB7A
	adds r3, r0, #0
_0801AB7A:
	adds r2, r1, #0
	subs r5, #1
	subs r6, r4, #1
	cmp r2, r3
	bge _0801AB9C
	mov r7, r9
	lsls r4, r4, #2
_0801AB88:
	ldr r0, [r7]
	adds r0, r4, r0
	ldr r1, [r0]
	adds r1, r1, r2
	ldrb r0, [r1]
	add r0, sl
	strb r0, [r1]
	adds r2, #1
	cmp r2, r3
	blt _0801AB88
_0801AB9C:
	adds r4, r6, #0
	cmp r6, r8
	blt _0801ABA6
	cmp r6, #0
	bge _0801AB5C
_0801ABA6:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801ABB8: .4byte gBmMapSize
_0801ABBC: .4byte gUnknown_030049A0

	THUMB_FUNC_START StoreR3ToMapSomething
StoreR3ToMapSomething: @ 0x0801ABC0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	str r0, [sp]
	mov r9, r1
	mov r8, r2
	mov sl, r3
	mov r5, r8
	mov r3, r9
	adds r0, r3, r5
	cmp r3, r0
	bgt _0801AC3C
	ldr r4, _0801ACB4  @ gBmMapSize
	movs r1, #2
	ldrsh r0, [r4, r1]
	cmp r3, r0
	bge _0801AC3C
_0801ABE8:
	ldr r2, [sp]
	subs r1, r2, r5
	lsls r0, r5, #1
	adds r0, #1
	cmp r1, #0
	bge _0801ABF8
	adds r0, r0, r1
	movs r1, #0
_0801ABF8:
	adds r2, r1, r0
	ldr r4, _0801ACB4  @ gBmMapSize
	movs r6, #0
	ldrsh r0, [r4, r6]
	cmp r2, r0
	ble _0801AC06
	adds r2, r0, #0
_0801AC06:
	subs r6, r5, #1
	adds r7, r3, #1
	mov r0, r9
	add r0, r8
	mov ip, r0
	cmp r1, r2
	bge _0801AC2A
	ldr r5, _0801ACB8  @ gUnknown_030049A0
	lsls r4, r3, #2
_0801AC18:
	ldr r0, [r5]
	adds r0, r4, r0
	ldr r0, [r0]
	adds r0, r0, r1
	mov r3, sl
	strb r3, [r0]
	adds r1, #1
	cmp r1, r2
	blt _0801AC18
_0801AC2A:
	adds r5, r6, #0
	adds r3, r7, #0
	cmp r3, ip
	bgt _0801AC3C
	ldr r4, _0801ACB4  @ gBmMapSize
	movs r6, #2
	ldrsh r0, [r4, r6]
	cmp r3, r0
	blt _0801ABE8
_0801AC3C:
	mov r5, r8
	subs r5, #1
	mov r3, r9
	subs r3, #1
	mov r0, r9
	mov r1, r8
	subs r0, r0, r1
	mov r8, r0
	cmp r3, r8
	blt _0801ACA4
	cmp r3, #0
	blt _0801ACA4
	ldr r2, _0801ACB4  @ gBmMapSize
	mov ip, r2
	ldr r4, _0801ACB8  @ gUnknown_030049A0
	mov r9, r4
_0801AC5C:
	ldr r6, [sp]
	subs r1, r6, r5
	lsls r0, r5, #1
	adds r0, #1
	cmp r1, #0
	bge _0801AC6C
	adds r0, r0, r1
	movs r1, #0
_0801AC6C:
	adds r2, r1, r0
	mov r4, ip
	movs r6, #0
	ldrsh r0, [r4, r6]
	cmp r2, r0
	ble _0801AC7A
	adds r2, r0, #0
_0801AC7A:
	subs r6, r5, #1
	subs r4, r3, #1
	cmp r1, r2
	bge _0801AC98
	mov r7, r9
	lsls r5, r3, #2
_0801AC86:
	ldr r0, [r7]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r1
	mov r3, sl
	strb r3, [r0]
	adds r1, #1
	cmp r1, r2
	blt _0801AC86
_0801AC98:
	adds r5, r6, #0
	adds r3, r4, #0
	cmp r4, r8
	blt _0801ACA4
	cmp r4, #0
	bge _0801AC5C
_0801ACA4:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801ACB4: .4byte gBmMapSize
_0801ACB8: .4byte gUnknown_030049A0

	THUMB_FUNC_START FillMapAttackRangeForUnit
FillMapAttackRangeForUnit: @ 0x0801ACBC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov r9, r0
	movs r1, #1
	negs r1, r1
	bl GetUnitWeaponReachBits
	subs r0, #1
	cmp r0, #0xe
	bls _0801ACDA
	b _0801B378
_0801ACDA:
	lsls r0, r0, #2
	ldr r1, _0801ACE4  @ _0801ACE8
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0801ACE4: .4byte _0801ACE8
_0801ACE8: @ jump table
	.4byte _0801AD24 @ case 0
	.4byte _0801AED4 @ case 1
	.4byte _0801ADB4 @ case 2
	.4byte _0801AFF4 @ case 3
	.4byte _0801B114 @ case 4
	.4byte _0801AF64 @ case 5
	.4byte _0801AE44 @ case 6
	.4byte _0801B378 @ case 7
	.4byte _0801B2FC @ case 8
	.4byte _0801B378 @ case 9
	.4byte _0801B378 @ case 10
	.4byte _0801B084 @ case 11
	.4byte _0801B1C0 @ case 12
	.4byte _0801B378 @ case 13
	.4byte _0801B26C @ case 14
_0801AD24:
	ldr r0, _0801ADA4  @ gBmMapSize
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r6, r0, #1
	cmp r6, #0
	bge _0801AD32
	b _0801B378
_0801AD32:
	ldr r0, _0801ADA4  @ gBmMapSize
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r7, r0, #1
	subs r0, r6, #1
	mov sl, r0
	cmp r7, #0
	blt _0801AD9C
	lsls r5, r6, #2
	lsls r0, r6, #0x10
	asrs r6, r0, #0x10
_0801AD48:
	ldr r0, _0801ADA8  @ gBmMapMovement
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r7
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _0801AD96
	ldr r0, _0801ADAC  @ gBmMapUnit
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r7
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801AD96
	ldr r0, _0801ADB0  @ gBmMapUnk
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r7
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801AD96
	lsls r4, r7, #0x10
	asrs r4, r4, #0x10
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #1
	movs r3, #1
	bl MapAddInRange
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #0
	movs r3, #1
	negs r3, r3
	bl MapAddInRange
_0801AD96:
	subs r7, #1
	cmp r7, #0
	bge _0801AD48
_0801AD9C:
	mov r6, sl
	cmp r6, #0
	bge _0801AD32
	b _0801B378
	.align 2, 0
_0801ADA4: .4byte gBmMapSize
_0801ADA8: .4byte gBmMapMovement
_0801ADAC: .4byte gBmMapUnit
_0801ADB0: .4byte gBmMapUnk
_0801ADB4:
	ldr r0, _0801AE34  @ gBmMapSize
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r6, r0, #1
	cmp r6, #0
	bge _0801ADC2
	b _0801B378
_0801ADC2:
	ldr r0, _0801AE34  @ gBmMapSize
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r7, r0, #1
	subs r0, r6, #1
	mov sl, r0
	cmp r7, #0
	blt _0801AE2C
	lsls r5, r6, #2
	lsls r0, r6, #0x10
	asrs r6, r0, #0x10
_0801ADD8:
	ldr r0, _0801AE38  @ gBmMapMovement
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r7
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _0801AE26
	ldr r0, _0801AE3C  @ gBmMapUnit
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r7
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801AE26
	ldr r0, _0801AE40  @ gBmMapUnk
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r7
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801AE26
	lsls r4, r7, #0x10
	asrs r4, r4, #0x10
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #2
	movs r3, #1
	bl MapAddInRange
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #0
	movs r3, #1
	negs r3, r3
	bl MapAddInRange
_0801AE26:
	subs r7, #1
	cmp r7, #0
	bge _0801ADD8
_0801AE2C:
	mov r6, sl
	cmp r6, #0
	bge _0801ADC2
	b _0801B378
	.align 2, 0
_0801AE34: .4byte gBmMapSize
_0801AE38: .4byte gBmMapMovement
_0801AE3C: .4byte gBmMapUnit
_0801AE40: .4byte gBmMapUnk
_0801AE44:
	ldr r0, _0801AEC4  @ gBmMapSize
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r6, r0, #1
	cmp r6, #0
	bge _0801AE52
	b _0801B378
_0801AE52:
	ldr r0, _0801AEC4  @ gBmMapSize
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r7, r0, #1
	subs r0, r6, #1
	mov sl, r0
	cmp r7, #0
	blt _0801AEBC
	lsls r5, r6, #2
	lsls r0, r6, #0x10
	asrs r6, r0, #0x10
_0801AE68:
	ldr r0, _0801AEC8  @ gBmMapMovement
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r7
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _0801AEB6
	ldr r0, _0801AECC  @ gBmMapUnit
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r7
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801AEB6
	ldr r0, _0801AED0  @ gBmMapUnk
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r7
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801AEB6
	lsls r4, r7, #0x10
	asrs r4, r4, #0x10
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #3
	movs r3, #1
	bl MapAddInRange
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #0
	movs r3, #1
	negs r3, r3
	bl MapAddInRange
_0801AEB6:
	subs r7, #1
	cmp r7, #0
	bge _0801AE68
_0801AEBC:
	mov r6, sl
	cmp r6, #0
	bge _0801AE52
	b _0801B378
	.align 2, 0
_0801AEC4: .4byte gBmMapSize
_0801AEC8: .4byte gBmMapMovement
_0801AECC: .4byte gBmMapUnit
_0801AED0: .4byte gBmMapUnk
_0801AED4:
	ldr r0, _0801AF54  @ gBmMapSize
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r6, r0, #1
	cmp r6, #0
	bge _0801AEE2
	b _0801B378
_0801AEE2:
	ldr r0, _0801AF54  @ gBmMapSize
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r7, r0, #1
	subs r0, r6, #1
	mov sl, r0
	cmp r7, #0
	blt _0801AF4C
	lsls r5, r6, #2
	lsls r0, r6, #0x10
	asrs r6, r0, #0x10
_0801AEF8:
	ldr r0, _0801AF58  @ gBmMapMovement
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r7
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _0801AF46
	ldr r0, _0801AF5C  @ gBmMapUnit
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r7
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801AF46
	ldr r0, _0801AF60  @ gBmMapUnk
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r7
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801AF46
	lsls r4, r7, #0x10
	asrs r4, r4, #0x10
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #2
	movs r3, #1
	bl MapAddInRange
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #1
	movs r3, #1
	negs r3, r3
	bl MapAddInRange
_0801AF46:
	subs r7, #1
	cmp r7, #0
	bge _0801AEF8
_0801AF4C:
	mov r6, sl
	cmp r6, #0
	bge _0801AEE2
	b _0801B378
	.align 2, 0
_0801AF54: .4byte gBmMapSize
_0801AF58: .4byte gBmMapMovement
_0801AF5C: .4byte gBmMapUnit
_0801AF60: .4byte gBmMapUnk
_0801AF64:
	ldr r0, _0801AFE4  @ gBmMapSize
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r6, r0, #1
	cmp r6, #0
	bge _0801AF72
	b _0801B378
_0801AF72:
	ldr r0, _0801AFE4  @ gBmMapSize
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r7, r0, #1
	subs r0, r6, #1
	mov sl, r0
	cmp r7, #0
	blt _0801AFDC
	lsls r5, r6, #2
	lsls r0, r6, #0x10
	asrs r6, r0, #0x10
_0801AF88:
	ldr r0, _0801AFE8  @ gBmMapMovement
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r7
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _0801AFD6
	ldr r0, _0801AFEC  @ gBmMapUnit
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r7
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801AFD6
	ldr r0, _0801AFF0  @ gBmMapUnk
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r7
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801AFD6
	lsls r4, r7, #0x10
	asrs r4, r4, #0x10
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #3
	movs r3, #1
	bl MapAddInRange
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #1
	movs r3, #1
	negs r3, r3
	bl MapAddInRange
_0801AFD6:
	subs r7, #1
	cmp r7, #0
	bge _0801AF88
_0801AFDC:
	mov r6, sl
	cmp r6, #0
	bge _0801AF72
	b _0801B378
	.align 2, 0
_0801AFE4: .4byte gBmMapSize
_0801AFE8: .4byte gBmMapMovement
_0801AFEC: .4byte gBmMapUnit
_0801AFF0: .4byte gBmMapUnk
_0801AFF4:
	ldr r0, _0801B074  @ gBmMapSize
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r6, r0, #1
	cmp r6, #0
	bge _0801B002
	b _0801B378
_0801B002:
	ldr r0, _0801B074  @ gBmMapSize
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r7, r0, #1
	subs r0, r6, #1
	mov sl, r0
	cmp r7, #0
	blt _0801B06C
	lsls r5, r6, #2
	lsls r0, r6, #0x10
	asrs r6, r0, #0x10
_0801B018:
	ldr r0, _0801B078  @ gBmMapMovement
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r7
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _0801B066
	ldr r0, _0801B07C  @ gBmMapUnit
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r7
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801B066
	ldr r0, _0801B080  @ gBmMapUnk
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r7
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801B066
	lsls r4, r7, #0x10
	asrs r4, r4, #0x10
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #3
	movs r3, #1
	bl MapAddInRange
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #2
	movs r3, #1
	negs r3, r3
	bl MapAddInRange
_0801B066:
	subs r7, #1
	cmp r7, #0
	bge _0801B018
_0801B06C:
	mov r6, sl
	cmp r6, #0
	bge _0801B002
	b _0801B378
	.align 2, 0
_0801B074: .4byte gBmMapSize
_0801B078: .4byte gBmMapMovement
_0801B07C: .4byte gBmMapUnit
_0801B080: .4byte gBmMapUnk
_0801B084:
	ldr r0, _0801B104  @ gBmMapSize
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r6, r0, #1
	cmp r6, #0
	bge _0801B092
	b _0801B378
_0801B092:
	ldr r0, _0801B104  @ gBmMapSize
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r7, r0, #1
	subs r0, r6, #1
	mov sl, r0
	cmp r7, #0
	blt _0801B0FC
	lsls r5, r6, #2
	lsls r0, r6, #0x10
	asrs r6, r0, #0x10
_0801B0A8:
	ldr r0, _0801B108  @ gBmMapMovement
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r7
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _0801B0F6
	ldr r0, _0801B10C  @ gBmMapUnit
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r7
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801B0F6
	ldr r0, _0801B110  @ gBmMapUnk
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r7
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801B0F6
	lsls r4, r7, #0x10
	asrs r4, r4, #0x10
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #0xa
	movs r3, #1
	bl MapAddInRange
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #2
	movs r3, #1
	negs r3, r3
	bl MapAddInRange
_0801B0F6:
	subs r7, #1
	cmp r7, #0
	bge _0801B0A8
_0801B0FC:
	mov r6, sl
	cmp r6, #0
	bge _0801B092
	b _0801B378
	.align 2, 0
_0801B104: .4byte gBmMapSize
_0801B108: .4byte gBmMapMovement
_0801B10C: .4byte gBmMapUnit
_0801B110: .4byte gBmMapUnk
_0801B114:
	ldr r0, _0801B1B0  @ gBmMapSize
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r6, r0, #1
	cmp r6, #0
	bge _0801B122
	b _0801B378
_0801B122:
	ldr r0, _0801B1B0  @ gBmMapSize
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r7, r0, #1
	subs r0, r6, #1
	mov sl, r0
	cmp r7, #0
	blt _0801B1A8
	lsls r1, r6, #2
	mov r8, r1
	lsls r0, r6, #0x10
	asrs r5, r0, #0x10
_0801B13A:
	ldr r0, _0801B1B4  @ gBmMapMovement
	ldr r0, [r0]
	add r0, r8
	ldr r0, [r0]
	adds r0, r0, r7
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _0801B1A2
	ldr r0, _0801B1B8  @ gBmMapUnit
	ldr r0, [r0]
	add r0, r8
	ldr r0, [r0]
	adds r0, r0, r7
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801B1A2
	ldr r0, _0801B1BC  @ gBmMapUnk
	ldr r0, [r0]
	add r0, r8
	ldr r0, [r0]
	adds r0, r0, r7
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801B1A2
	lsls r4, r7, #0x10
	asrs r4, r4, #0x10
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #1
	movs r3, #1
	bl MapAddInRange
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0
	movs r3, #1
	negs r3, r3
	bl MapAddInRange
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #3
	movs r3, #1
	bl MapAddInRange
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #2
	movs r3, #1
	negs r3, r3
	bl MapAddInRange
_0801B1A2:
	subs r7, #1
	cmp r7, #0
	bge _0801B13A
_0801B1A8:
	mov r6, sl
	cmp r6, #0
	bge _0801B122
	b _0801B378
	.align 2, 0
_0801B1B0: .4byte gBmMapSize
_0801B1B4: .4byte gBmMapMovement
_0801B1B8: .4byte gBmMapUnit
_0801B1BC: .4byte gBmMapUnk
_0801B1C0:
	ldr r0, _0801B25C  @ gBmMapSize
	movs r2, #2
	ldrsh r0, [r0, r2]
	subs r6, r0, #1
	cmp r6, #0
	bge _0801B1CE
	b _0801B378
_0801B1CE:
	ldr r0, _0801B25C  @ gBmMapSize
	movs r1, #0
	ldrsh r0, [r0, r1]
	subs r7, r0, #1
	subs r2, r6, #1
	mov sl, r2
	cmp r7, #0
	blt _0801B254
	lsls r0, r6, #2
	mov r8, r0
	lsls r0, r6, #0x10
	asrs r5, r0, #0x10
_0801B1E6:
	ldr r0, _0801B260  @ gBmMapMovement
	ldr r0, [r0]
	add r0, r8
	ldr r0, [r0]
	adds r0, r0, r7
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _0801B24E
	ldr r0, _0801B264  @ gBmMapUnit
	ldr r0, [r0]
	add r0, r8
	ldr r0, [r0]
	adds r0, r0, r7
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801B24E
	ldr r0, _0801B268  @ gBmMapUnk
	ldr r0, [r0]
	add r0, r8
	ldr r0, [r0]
	adds r0, r0, r7
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801B24E
	lsls r4, r7, #0x10
	asrs r4, r4, #0x10
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #1
	movs r3, #1
	bl MapAddInRange
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0
	movs r3, #1
	negs r3, r3
	bl MapAddInRange
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0xa
	movs r3, #1
	bl MapAddInRange
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #2
	movs r3, #1
	negs r3, r3
	bl MapAddInRange
_0801B24E:
	subs r7, #1
	cmp r7, #0
	bge _0801B1E6
_0801B254:
	mov r6, sl
	cmp r6, #0
	bge _0801B1CE
	b _0801B378
	.align 2, 0
_0801B25C: .4byte gBmMapSize
_0801B260: .4byte gBmMapMovement
_0801B264: .4byte gBmMapUnit
_0801B268: .4byte gBmMapUnk
_0801B26C:
	ldr r0, _0801B2EC  @ gBmMapSize
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r6, r0, #1
	cmp r6, #0
	bge _0801B27A
	b _0801B378
_0801B27A:
	ldr r0, _0801B2EC  @ gBmMapSize
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r7, r0, #1
	subs r0, r6, #1
	mov sl, r0
	cmp r7, #0
	blt _0801B2E4
	lsls r5, r6, #2
	lsls r0, r6, #0x10
	asrs r6, r0, #0x10
_0801B290:
	ldr r0, _0801B2F0  @ gBmMapMovement
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r7
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _0801B2DE
	ldr r0, _0801B2F4  @ gBmMapUnit
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r7
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801B2DE
	ldr r0, _0801B2F8  @ gBmMapUnk
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r7
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801B2DE
	lsls r4, r7, #0x10
	asrs r4, r4, #0x10
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #0xa
	movs r3, #1
	bl MapAddInRange
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #0
	movs r3, #1
	negs r3, r3
	bl MapAddInRange
_0801B2DE:
	subs r7, #1
	cmp r7, #0
	bge _0801B290
_0801B2E4:
	mov r6, sl
	cmp r6, #0
	bge _0801B27A
	b _0801B378
	.align 2, 0
_0801B2EC: .4byte gBmMapSize
_0801B2F0: .4byte gBmMapMovement
_0801B2F4: .4byte gBmMapUnit
_0801B2F8: .4byte gBmMapUnk
_0801B2FC:
	ldr r0, _0801B44C  @ gBmMapSize
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r6, r0, #1
	cmp r6, #0
	blt _0801B378
_0801B308:
	ldr r0, _0801B44C  @ gBmMapSize
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r7, r0, #1
	subs r0, r6, #1
	mov sl, r0
	cmp r7, #0
	blt _0801B372
	lsls r5, r6, #2
	lsls r0, r6, #0x10
	asrs r6, r0, #0x10
_0801B31E:
	ldr r0, _0801B450  @ gBmMapMovement
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r7
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _0801B36C
	ldr r0, _0801B454  @ gBmMapUnit
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r7
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801B36C
	ldr r0, _0801B458  @ gBmMapUnk
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r7
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801B36C
	lsls r4, r7, #0x10
	asrs r4, r4, #0x10
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #4
	movs r3, #1
	bl MapAddInRange
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #0
	movs r3, #1
	negs r3, r3
	bl MapAddInRange
_0801B36C:
	subs r7, #1
	cmp r7, #0
	bge _0801B31E
_0801B372:
	mov r6, sl
	cmp r6, #0
	bge _0801B308
_0801B378:
	mov r1, r9
	ldr r0, [r1]
	ldr r1, [r1, #4]
	ldr r0, [r0, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0801B434
	ldr r0, _0801B44C  @ gBmMapSize
	movs r2, #2
	ldrsh r0, [r0, r2]
	subs r6, r0, #1
	cmp r6, #0
	blt _0801B434
_0801B398:
	ldr r0, _0801B44C  @ gBmMapSize
	movs r1, #0
	ldrsh r0, [r0, r1]
	subs r7, r0, #1
	subs r2, r6, #1
	mov sl, r2
	cmp r7, #0
	blt _0801B42E
	lsls r0, r6, #2
	mov r8, r0
	lsls r0, r6, #0x10
	asrs r0, r0, #0x10
	mov r9, r0
_0801B3B2:
	ldr r0, _0801B450  @ gBmMapMovement
	ldr r0, [r0]
	add r0, r8
	ldr r0, [r0]
	adds r0, r0, r7
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _0801B428
	ldr r0, _0801B454  @ gBmMapUnit
	ldr r0, [r0]
	add r0, r8
	ldr r0, [r0]
	adds r0, r0, r7
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801B428
	ldr r0, _0801B458  @ gBmMapUnk
	ldr r0, [r0]
	add r0, r8
	ldr r0, [r0]
	adds r0, r0, r7
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801B428
	adds r0, r7, #0
	adds r1, r6, #0
	bl GetBallistaItemAt
	adds r1, r0, #0
	cmp r1, #0
	beq _0801B428
	lsls r5, r7, #0x10
	asrs r5, r5, #0x10
	str r1, [sp]
	bl GetItemMinRange
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	ldr r1, [sp]
	adds r0, r1, #0
	bl GetItemMaxRange
	adds r2, r0, #0
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	adds r0, r5, #0
	mov r1, r9
	movs r3, #1
	bl MapAddInRange
	subs r4, #1
	adds r0, r5, #0
	mov r1, r9
	adds r2, r4, #0
	movs r3, #1
	negs r3, r3
	bl MapAddInRange
_0801B428:
	subs r7, #1
	cmp r7, #0
	bge _0801B3B2
_0801B42E:
	mov r6, sl
	cmp r6, #0
	bge _0801B398
_0801B434:
	ldr r2, _0801B450  @ gBmMapMovement
	ldr r1, [r2]
	ldr r0, _0801B45C  @ gUnknown_030049A0
	str r1, [r0]
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801B44C: .4byte gBmMapSize
_0801B450: .4byte gBmMapMovement
_0801B454: .4byte gBmMapUnit
_0801B458: .4byte gBmMapUnk
_0801B45C: .4byte gUnknown_030049A0

	THUMB_FUNC_START FillRangeByRangeMask
FillRangeByRangeMask: @ 0x0801B460
	push {r4, r5, lr}
	adds r2, r0, #0
	movs r4, #0x10
	ldrsb r4, [r2, r4]
	movs r5, #0x11
	ldrsb r5, [r2, r5]
	subs r0, r1, #1
	cmp r0, #0x1f
	bls _0801B474
	b _0801B610
_0801B474:
	lsls r0, r0, #2
	ldr r1, _0801B480  @ _0801B484
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0801B480: .4byte _0801B484
_0801B484: @ jump table
	.4byte _0801B504 @ case 0
	.4byte _0801B51C @ case 1
	.4byte _0801B50C @ case 2
	.4byte _0801B544 @ case 3
	.4byte _0801B56C @ case 4
	.4byte _0801B530 @ case 5
	.4byte _0801B514 @ case 6
	.4byte _0801B610 @ case 7
	.4byte _0801B5D0 @ case 8
	.4byte _0801B610 @ case 9
	.4byte _0801B610 @ case 10
	.4byte _0801B558 @ case 11
	.4byte _0801B59A @ case 12
	.4byte _0801B610 @ case 13
	.4byte _0801B5C8 @ case 14
	.4byte _0801B610 @ case 15
	.4byte _0801B610 @ case 16
	.4byte _0801B610 @ case 17
	.4byte _0801B610 @ case 18
	.4byte _0801B610 @ case 19
	.4byte _0801B610 @ case 20
	.4byte _0801B610 @ case 21
	.4byte _0801B610 @ case 22
	.4byte _0801B610 @ case 23
	.4byte _0801B610 @ case 24
	.4byte _0801B610 @ case 25
	.4byte _0801B610 @ case 26
	.4byte _0801B610 @ case 27
	.4byte _0801B610 @ case 28
	.4byte _0801B610 @ case 29
	.4byte _0801B610 @ case 30
	.4byte _0801B5EC @ case 31
_0801B504:
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #1
	b _0801B5D6
_0801B50C:
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #2
	b _0801B5D6
_0801B514:
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #3
	b _0801B5D6
_0801B51C:
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #2
	movs r3, #1
	bl MapAddInRange
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #1
	b _0801B5E2
_0801B530:
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #3
	movs r3, #1
	bl MapAddInRange
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #1
	b _0801B5E2
_0801B544:
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #3
	movs r3, #1
	bl MapAddInRange
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #2
	b _0801B5E2
_0801B558:
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0xa
	movs r3, #1
	bl MapAddInRange
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #2
	b _0801B5E2
_0801B56C:
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #1
	movs r3, #1
	bl MapAddInRange
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0
	movs r3, #1
	negs r3, r3
	bl MapAddInRange
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #3
	movs r3, #1
	bl MapAddInRange
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #2
	b _0801B5E2
_0801B59A:
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #1
	movs r3, #1
	bl MapAddInRange
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0
	movs r3, #1
	negs r3, r3
	bl MapAddInRange
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0xa
	movs r3, #1
	bl MapAddInRange
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #2
	b _0801B5E2
_0801B5C8:
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0xa
	b _0801B5D6
_0801B5D0:
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #4
_0801B5D6:
	movs r3, #1
	bl MapAddInRange
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0
_0801B5E2:
	movs r3, #1
	negs r3, r3
	bl MapAddInRange
	b _0801B610
_0801B5EC:
	adds r0, r2, #0
	bl GetUnitMagBy2Range
	adds r2, r0, #0
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	adds r0, r4, #0
	adds r1, r5, #0
	movs r3, #1
	bl MapAddInRange
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0
	movs r3, #1
	negs r3, r3
	bl MapAddInRange
_0801B610:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_START FillMapStaffRangeForUnit
FillMapStaffRangeForUnit: @ 0x0801B618
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	adds r4, r0, #0
	bl GetUnitStaffReachBits
	adds r5, r0, #0
	adds r0, r4, #0
	bl GetUnitMagBy2Range
	adds r2, r0, #0
	cmp r5, #3
	beq _0801B6D8
	cmp r5, #3
	bgt _0801B640
	cmp r5, #1
	beq _0801B648
	b _0801B7F2
_0801B640:
	cmp r5, #0x20
	bne _0801B646
	b _0801B768
_0801B646:
	b _0801B7F2
_0801B648:
	ldr r0, _0801B6C8  @ gBmMapSize
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r1, r0, #1
	cmp r1, #0
	bge _0801B656
	b _0801B7F2
_0801B656:
	ldr r0, _0801B6C8  @ gBmMapSize
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r5, r0, #1
	subs r3, r1, #1
	mov r8, r3
	cmp r5, #0
	blt _0801B6C0
	lsls r6, r1, #2
	lsls r0, r1, #0x10
	asrs r7, r0, #0x10
_0801B66C:
	ldr r0, _0801B6CC  @ gBmMapMovement
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _0801B6BA
	ldr r0, _0801B6D0  @ gBmMapUnit
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801B6BA
	ldr r0, _0801B6D4  @ gBmMapUnk
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801B6BA
	lsls r4, r5, #0x10
	asrs r4, r4, #0x10
	adds r0, r4, #0
	adds r1, r7, #0
	movs r2, #1
	movs r3, #1
	bl MapAddInRange
	adds r0, r4, #0
	adds r1, r7, #0
	movs r2, #0
	movs r3, #1
	negs r3, r3
	bl MapAddInRange
_0801B6BA:
	subs r5, #1
	cmp r5, #0
	bge _0801B66C
_0801B6C0:
	mov r1, r8
	cmp r1, #0
	bge _0801B656
	b _0801B7F2
	.align 2, 0
_0801B6C8: .4byte gBmMapSize
_0801B6CC: .4byte gBmMapMovement
_0801B6D0: .4byte gBmMapUnit
_0801B6D4: .4byte gBmMapUnk
_0801B6D8:
	ldr r0, _0801B758  @ gBmMapSize
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r1, r0, #1
	cmp r1, #0
	bge _0801B6E6
	b _0801B7F2
_0801B6E6:
	ldr r0, _0801B758  @ gBmMapSize
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r5, r0, #1
	subs r3, r1, #1
	mov r8, r3
	cmp r5, #0
	blt _0801B750
	lsls r6, r1, #2
	lsls r0, r1, #0x10
	asrs r7, r0, #0x10
_0801B6FC:
	ldr r0, _0801B75C  @ gBmMapMovement
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _0801B74A
	ldr r0, _0801B760  @ gBmMapUnit
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801B74A
	ldr r0, _0801B764  @ gBmMapUnk
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801B74A
	lsls r4, r5, #0x10
	asrs r4, r4, #0x10
	adds r0, r4, #0
	adds r1, r7, #0
	movs r2, #2
	movs r3, #1
	bl MapAddInRange
	adds r0, r4, #0
	adds r1, r7, #0
	movs r2, #0
	movs r3, #1
	negs r3, r3
	bl MapAddInRange
_0801B74A:
	subs r5, #1
	cmp r5, #0
	bge _0801B6FC
_0801B750:
	mov r1, r8
	cmp r1, #0
	bge _0801B6E6
	b _0801B7F2
	.align 2, 0
_0801B758: .4byte gBmMapSize
_0801B75C: .4byte gBmMapMovement
_0801B760: .4byte gBmMapUnit
_0801B764: .4byte gBmMapUnk
_0801B768:
	ldr r0, _0801B800  @ gBmMapSize
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r1, r0, #1
	cmp r1, #0
	blt _0801B7F2
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	mov sl, r0
_0801B77A:
	ldr r0, _0801B800  @ gBmMapSize
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r5, r0, #1
	subs r3, r1, #1
	mov r8, r3
	cmp r5, #0
	blt _0801B7EC
	lsls r6, r1, #2
	lsls r0, r1, #0x10
	asrs r7, r0, #0x10
	mov r0, sl
	lsls r0, r0, #0x10
	mov r9, r0
_0801B796:
	ldr r0, _0801B804  @ gBmMapMovement
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _0801B7E6
	ldr r0, _0801B808  @ gBmMapUnit
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801B7E6
	ldr r0, _0801B80C  @ gBmMapUnk
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801B7E6
	lsls r4, r5, #0x10
	asrs r4, r4, #0x10
	adds r0, r4, #0
	adds r1, r7, #0
	mov r3, r9
	asrs r2, r3, #0x10
	movs r3, #1
	bl MapAddInRange
	adds r0, r4, #0
	adds r1, r7, #0
	movs r2, #0
	movs r3, #1
	negs r3, r3
	bl MapAddInRange
_0801B7E6:
	subs r5, #1
	cmp r5, #0
	bge _0801B796
_0801B7EC:
	mov r1, r8
	cmp r1, #0
	bge _0801B77A
_0801B7F2:
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801B800: .4byte gBmMapSize
_0801B804: .4byte gBmMapMovement
_0801B808: .4byte gBmMapUnit
_0801B80C: .4byte gBmMapUnk

	THUMB_FUNC_START ApplyStuffToRangeMaps
ApplyStuffToRangeMaps: @ 0x0801B810
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	movs r0, #1
	negs r0, r0
	mov sl, r0
	ldr r0, _0801B840  @ gBmMapRange
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFill
	bl IsNotEnemyPhaseMaybe
	mov r9, r0
	mov r6, r9
	adds r6, #1
	b _0801B934
	.align 2, 0
_0801B840: .4byte gBmMapRange
_0801B844:
	adds r0, r6, #0
	bl GetUnit
	adds r4, r0, #0
	cmp r4, #0
	beq _0801B930
	ldr r0, [r4]
	cmp r0, #0
	beq _0801B930
	ldr r1, [sp]
	lsls r0, r1, #0x18
	mov r8, r0
	cmp r0, #0
	beq _0801B86C
	adds r0, r4, #0
	bl UnitHasMagicRank
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0801B930
_0801B86C:
	ldr r0, _0801B8FC  @ gUnknown_0202BCF0
	ldrb r0, [r0, #0xd]
	cmp r0, #0
	beq _0801B88E
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	ldr r0, _0801B900  @ gBmMapFog
	ldr r0, [r0]
	lsls r1, r1, #2
	adds r1, r1, r0
	movs r2, #0x10
	ldrsb r2, [r4, r2]
	ldr r0, [r1]
	adds r0, r0, r2
	ldrb r0, [r0]
	cmp r0, #0
	beq _0801B930
_0801B88E:
	ldr r5, [r4, #0xc]
	movs r0, #0x80
	ands r5, r0
	cmp r5, #0
	bne _0801B930
	ldr r0, [r4, #4]
	ldrb r1, [r0, #0x12]
	ldrb r0, [r4, #0x1d]
	adds r1, r1, r0
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, r4, #0
	bl FillMovementMapForUnitAndMovement
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	ldr r0, _0801B904  @ gBmMapUnit
	ldr r0, [r0]
	lsls r1, r1, #2
	adds r1, r1, r0
	movs r2, #0x10
	ldrsb r2, [r4, r2]
	ldr r0, [r1]
	adds r0, r0, r2
	ldrb r7, [r0]
	strb r5, [r0]
	adds r0, r4, #0
	bl UnitHasMagicRank
	lsls r0, r0, #0x18
	asrs r5, r0, #0x18
	cmp sl, r5
	beq _0801B8E6
	ldr r0, _0801B908  @ gBmMapUnk
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFill
	cmp r5, #0
	beq _0801B8E4
	movs r0, #1
	bl sub_801B950
_0801B8E4:
	mov sl, r5
_0801B8E6:
	ldr r0, _0801B90C  @ gBmMapRange
	ldr r1, [r0]
	ldr r0, _0801B910  @ gUnknown_030049A0
	str r1, [r0]
	mov r1, r8
	cmp r1, #0
	beq _0801B914
	adds r0, r4, #0
	bl FillMapStaffRangeForUnit
	b _0801B91A
	.align 2, 0
_0801B8FC: .4byte gUnknown_0202BCF0
_0801B900: .4byte gBmMapFog
_0801B904: .4byte gBmMapUnit
_0801B908: .4byte gBmMapUnk
_0801B90C: .4byte gBmMapRange
_0801B910: .4byte gUnknown_030049A0
_0801B914:
	adds r0, r4, #0
	bl FillMapAttackRangeForUnit
_0801B91A:
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	ldr r0, _0801B94C  @ gBmMapUnit
	ldr r0, [r0]
	lsls r1, r1, #2
	adds r1, r1, r0
	movs r2, #0x10
	ldrsb r2, [r4, r2]
	ldr r0, [r1]
	adds r0, r0, r2
	strb r7, [r0]
_0801B930:
	adds r6, #1
	mov r0, r9
_0801B934:
	adds r0, #0x80
	cmp r6, r0
	bge _0801B93C
	b _0801B844
_0801B93C:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801B94C: .4byte gBmMapUnit

	THUMB_FUNC_START sub_801B950
sub_801B950: @ 0x0801B950
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r4, #0x81
_0801B956:
	adds r0, r4, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq _0801B98A
	ldr r1, [r2]
	cmp r1, #0
	beq _0801B98A
	ldr r0, [r2, #4]
	ldr r1, [r1, #0x28]
	ldr r0, [r0, #0x28]
	orrs r1, r0
	movs r0, #0x80
	lsls r0, r0, #0x13
	ands r1, r0
	cmp r1, #0
	beq _0801B98A
	movs r0, #0x10
	ldrsb r0, [r2, r0]
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	movs r2, #0xa
	adds r3, r5, #0
	bl StoreR3ToMapSomething
_0801B98A:
	adds r4, #1
	cmp r4, #0xbf
	ble _0801B956
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_START SetSubjectMap
SetSubjectMap: @ 0x0801B998
	ldr r1, _0801B9A0  @ gUnknown_030049A0
	str r0, [r1]
	bx lr
	.align 2, 0
_0801B9A0: .4byte gUnknown_030049A0

	THUMB_FUNC_START FillRangeMap
FillRangeMap: @ 0x0801B9A4
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	adds r4, r2, #0
	adds r2, r3, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	adds r0, r5, #0
	adds r1, r6, #0
	movs r3, #1
	bl MapAddInRange
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	subs r4, #1
	movs r3, #1
	negs r3, r3
	adds r0, r5, #0
	adds r1, r6, #0
	adds r2, r4, #0
	bl MapAddInRange
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_START GetCurrentMovCostTable
GetCurrentMovCostTable: @ 0x0801B9E4
	ldr r0, _0801B9E8  @ gUnknown_03004BB0
	bx lr
	.align 2, 0
_0801B9E8: .4byte gUnknown_03004BB0

	.align 2, 0 @ Don't pad with nop.
