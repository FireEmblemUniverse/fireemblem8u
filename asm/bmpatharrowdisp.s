	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	@ Logic for displaying the movement path/arrow thing

	THUMB_FUNC_START sub_80329D8
sub_80329D8: @ 0x080329D8
	ldr r3, _080329E8  @ gUnknown_0859DBA0
	ldr r2, [r3]
	adds r2, #0x29
	strb r0, [r2]
	ldr r0, [r3]
	adds r0, #0x2a
	strb r1, [r0]
	bx lr
	.align 2, 0
_080329E8: .4byte gUnknown_0859DBA0

	THUMB_FUNC_END sub_80329D8

	THUMB_FUNC_START sub_80329EC
sub_80329EC: @ 0x080329EC
	push {r4, r5, r6, r7, lr}
	ldr r3, _08032A8C  @ gUnknown_0859DBA0
	ldr r1, [r3]
	adds r2, r1, #0
	adds r2, #0x2c
	movs r1, #0
	ldrsb r1, [r2, r1]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r1, r0
	blt _08032A84
	subs r0, #1
	strb r0, [r2]
	ldr r2, [r3]
	adds r0, r2, #0
	adds r0, #0x2c
	movs r1, #0
	ldrsb r1, [r0, r1]
	adds r0, #0x29
	adds r0, r0, r1
	adds r1, r2, #0
	adds r1, #0x2b
	ldrb r1, [r1]
	strb r1, [r0]
	movs r5, #1
	ldr r0, [r3]
	adds r0, #0x2c
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r5, r0
	bgt _08032A84
	adds r7, r3, #0
_08032A2E:
	bl GetWorkingMoveCosts
	ldr r3, [r7]
	lsls r4, r5, #0x18
	asrs r4, r4, #0x18
	adds r5, r3, #0
	adds r5, #0x55
	adds r6, r5, r4
	subs r1, r4, #1
	adds r5, r5, r1
	adds r1, r3, #0
	adds r1, #0x41
	adds r1, r1, r4
	movs r2, #0
	ldrsb r2, [r1, r2]
	ldr r1, _08032A90  @ gBmMapTerrain
	ldr r1, [r1]
	lsls r2, r2, #2
	adds r2, r2, r1
	adds r3, #0x2d
	adds r3, r3, r4
	ldrb r3, [r3]
	lsls r3, r3, #0x18
	asrs r3, r3, #0x18
	ldr r1, [r2]
	adds r1, r1, r3
	ldrb r1, [r1]
	adds r0, r0, r1
	ldrb r1, [r5]
	ldrb r0, [r0]
	subs r1, r1, r0
	strb r1, [r6]
	adds r4, #1
	lsls r4, r4, #0x18
	ldr r0, [r7]
	adds r0, #0x2c
	lsrs r5, r4, #0x18
	asrs r4, r4, #0x18
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r4, r0
	ble _08032A2E
_08032A84:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08032A8C: .4byte gUnknown_0859DBA0
_08032A90: .4byte gBmMapTerrain

	THUMB_FUNC_END sub_80329EC

	THUMB_FUNC_START sub_8032A94
sub_8032A94: @ 0x08032A94
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r6, _08032B10  @ gUnknown_0859DBA0
	ldr r1, [r6]
	adds r1, #0x2c
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldr r0, [r6]
	adds r1, r0, #0
	adds r1, #0x2c
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, #0x2d
	adds r0, r0, r1
	strb r5, [r0]
	ldr r0, [r6]
	adds r1, r0, #0
	adds r1, #0x2c
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, #0x41
	adds r0, r0, r1
	strb r4, [r0]
	bl GetWorkingMoveCosts
	ldr r2, [r6]
	adds r1, r2, #0
	adds r1, #0x2c
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r2, #0x55
	adds r3, r2, r1
	subs r1, #1
	adds r2, r2, r1
	lsls r4, r4, #0x18
	ldr r1, _08032B14  @ gBmMapTerrain
	ldr r1, [r1]
	asrs r4, r4, #0x16
	adds r4, r4, r1
	lsls r5, r5, #0x18
	asrs r5, r5, #0x18
	ldr r1, [r4]
	adds r1, r1, r5
	ldrb r1, [r1]
	adds r0, r0, r1
	ldrb r1, [r2]
	ldrb r0, [r0]
	subs r1, r1, r0
	strb r1, [r3]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08032B10: .4byte gUnknown_0859DBA0
_08032B14: .4byte gBmMapTerrain

	THUMB_FUNC_END sub_8032A94

	THUMB_FUNC_START sub_8032B18
sub_8032B18: @ 0x08032B18
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r5, r1, #0x18
	movs r1, #0
	ldr r0, _08032B6C  @ gUnknown_0859DBA0
	ldr r2, [r0]
	adds r0, r2, #0
	adds r0, #0x2c
	movs r3, #0
	ldrsb r3, [r0, r3]
	cmp r1, r3
	bgt _08032B7E
	mov ip, r2
	lsls r0, r4, #0x18
	asrs r7, r0, #0x18
	mov r6, ip
	adds r6, #0x41
	lsls r0, r5, #0x18
	asrs r5, r0, #0x18
	adds r4, r3, #0
_08032B44:
	lsls r0, r1, #0x18
	asrs r2, r0, #0x18
	mov r1, ip
	adds r1, #0x2d
	adds r1, r1, r2
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r3, r0, #0
	cmp r1, r7
	bne _08032B70
	adds r0, r6, r2
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, r5
	bne _08032B70
	adds r0, r2, #0
	b _08032B82
	.align 2, 0
_08032B6C: .4byte gUnknown_0859DBA0
_08032B70:
	movs r1, #0x80
	lsls r1, r1, #0x11
	adds r0, r3, r1
	lsrs r1, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, r4
	ble _08032B44
_08032B7E:
	movs r0, #1
	negs r0, r0
_08032B82:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8032B18

	THUMB_FUNC_START sub_8032B88
sub_8032B88: @ 0x08032B88
	push {r4, lr}
	movs r4, #0
_08032B8C:
	ldr r2, _08032BB4  @ gWorkingMovementScript
	adds r1, r4, #0
	lsls r0, r1, #0x18
	movs r3, #0x80
	lsls r3, r3, #0x11
	adds r0, r0, r3
	lsrs r4, r0, #0x18
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r1, r1, r2
	ldrb r0, [r1]
	adds r0, #1
	cmp r0, #0xa
	bhi _08032B8C
	lsls r0, r0, #2
	ldr r1, _08032BB8  @ _08032BBC
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08032BB4: .4byte gWorkingMovementScript
_08032BB8: .4byte _08032BBC
_08032BBC: @ jump table
	.4byte _08032C80 @ case 0
	.4byte _08032BE8 @ case 1
	.4byte _08032C04 @ case 2
	.4byte _08032C54 @ case 3
	.4byte _08032C30 @ case 4
	.4byte _08032C80 @ case 5
	.4byte _08032B8C @ case 6
	.4byte _08032B8C @ case 7
	.4byte _08032B8C @ case 8
	.4byte _08032B8C @ case 9
	.4byte _08032B8C @ case 10
_08032BE8:
	ldr r0, _08032C00  @ gUnknown_0859DBA0
	ldr r1, [r0]
	adds r0, r1, #0
	adds r0, #0x2c
	movs r2, #0
	ldrsb r2, [r0, r2]
	adds r0, #1
	adds r0, r0, r2
	ldrb r0, [r0]
	subs r0, #1
	b _08032C18
	.align 2, 0
_08032C00: .4byte gUnknown_0859DBA0
_08032C04:
	ldr r0, _08032C2C  @ gUnknown_0859DBA0
	ldr r1, [r0]
	adds r0, r1, #0
	adds r0, #0x2c
	movs r2, #0
	ldrsb r2, [r0, r2]
	adds r0, #1
	adds r0, r0, r2
	ldrb r0, [r0]
	adds r0, #1
_08032C18:
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r1, #0x41
	adds r1, r1, r2
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl sub_8032A94
	b _08032B8C
	.align 2, 0
_08032C2C: .4byte gUnknown_0859DBA0
_08032C30:
	ldr r0, _08032C50  @ gUnknown_0859DBA0
	ldr r1, [r0]
	adds r0, r1, #0
	adds r0, #0x2c
	movs r2, #0
	ldrsb r2, [r0, r2]
	adds r0, #1
	adds r0, r0, r2
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r1, #0x41
	adds r1, r1, r2
	ldrb r1, [r1]
	subs r1, #1
	b _08032C72
	.align 2, 0
_08032C50: .4byte gUnknown_0859DBA0
_08032C54:
	ldr r0, _08032C7C  @ gUnknown_0859DBA0
	ldr r1, [r0]
	adds r0, r1, #0
	adds r0, #0x2c
	movs r2, #0
	ldrsb r2, [r0, r2]
	adds r0, #1
	adds r0, r0, r2
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r1, #0x41
	adds r1, r1, r2
	ldrb r1, [r1]
	adds r1, #1
_08032C72:
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl sub_8032A94
	b _08032B8C
	.align 2, 0
_08032C7C: .4byte gUnknown_0859DBA0
_08032C80:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8032B88

	THUMB_FUNC_START sub_8032C88
sub_8032C88: @ 0x08032C88
	push {r4, r5, r6, r7, lr}
	movs r6, #1
	ldr r2, _08032CCC  @ gUnknown_0859DBA0
	ldr r0, [r2]
	adds r0, #0x2c
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r7, r2, #0
	ldr r1, _08032CD0  @ gWorkingMovementScript
	mov ip, r1
	cmp r6, r0
	bgt _08032D1E
	mov r5, ip
_08032CA4:
	ldr r4, [r2]
	lsls r0, r6, #0x18
	asrs r3, r0, #0x18
	adds r0, r4, #0
	adds r0, #0x2d
	adds r1, r0, r3
	subs r2, r3, #1
	adds r0, r0, r2
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r1, r0
	bge _08032CD4
	adds r1, r2, r5
	movs r0, #0
	b _08032D00
	.align 2, 0
_08032CCC: .4byte gUnknown_0859DBA0
_08032CD0: .4byte gWorkingMovementScript
_08032CD4:
	cmp r1, r0
	ble _08032CDE
	adds r1, r2, r5
	movs r0, #1
	b _08032D00
_08032CDE:
	adds r0, r4, #0
	adds r0, #0x41
	adds r1, r0, r3
	adds r0, r0, r2
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r1, r0
	bge _08032CFC
	adds r1, r2, r5
	movs r0, #3
	b _08032D00
_08032CFC:
	adds r1, r2, r5
	movs r0, #2
_08032D00:
	strb r0, [r1]
	lsls r1, r6, #0x18
	movs r0, #0x80
	lsls r0, r0, #0x11
	adds r1, r1, r0
	adds r2, r7, #0
	ldr r0, [r2]
	adds r0, #0x2c
	lsrs r6, r1, #0x18
	asrs r1, r1, #0x18
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r1, r0
	ble _08032CA4
_08032D1E:
	lsls r0, r6, #0x18
	asrs r0, r0, #0x18
	subs r0, #1
	add r0, ip
	movs r1, #4
	strb r1, [r0]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8032C88

	THUMB_FUNC_START sub_8032D30
sub_8032D30: @ 0x08032D30
	push {r4, lr}
	ldr r0, _08032D6C  @ gActiveUnit
	ldr r0, [r0]
	ldr r1, _08032D70  @ gUnknown_0859DBA0
	ldr r3, [r1]
	adds r1, r3, #0
	adds r1, #0x2c
	movs r4, #0
	ldrsb r4, [r1, r4]
	adds r1, #1
	adds r1, r1, r4
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r2, r3, #0
	adds r2, #0x41
	adds r2, r2, r4
	ldrb r2, [r2]
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	adds r3, #0x55
	adds r3, r3, r4
	ldrb r3, [r3]
	lsls r3, r3, #0x18
	asrs r3, r3, #0x18
	bl GenerateMovementMapOnWorkingMap
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08032D6C: .4byte gActiveUnit
_08032D70: .4byte gUnknown_0859DBA0

	THUMB_FUNC_END sub_8032D30

	THUMB_FUNC_START sub_8032D74
sub_8032D74: @ 0x08032D74
	push {lr}
	movs r0, #1
	bl sub_80329EC
	bl sub_8032D30
	ldr r1, _08032D98  @ gUnknown_0202BCB0
	movs r2, #0x14
	ldrsh r0, [r1, r2]
	movs r2, #0x16
	ldrsh r1, [r1, r2]
	ldr r2, _08032D9C  @ gWorkingMovementScript
	bl GenerateBestMovementScript
	bl sub_8032B88
	pop {r0}
	bx r0
	.align 2, 0
_08032D98: .4byte gUnknown_0202BCB0
_08032D9C: .4byte gWorkingMovementScript

	THUMB_FUNC_END sub_8032D74

	THUMB_FUNC_START sub_8032DA0
sub_8032DA0: @ 0x08032DA0
	push {r4, r5, r6, r7, lr}
	ldr r0, _08032DAC  @ gUnknown_0859DBA0
	ldr r0, [r0]
	adds r0, #0x2c
	ldrb r1, [r0]
	b _08032E18
	.align 2, 0
_08032DAC: .4byte gUnknown_0859DBA0
_08032DB0:
	asrs r4, r0, #0x18
	movs r2, #0xff
	lsls r2, r2, #0x18
	adds r0, r0, r2
	lsrs r3, r0, #0x18
	lsls r2, r3, #0x18
	lsls r1, r1, #0x18
	mov ip, r1
	cmp r2, #0
	blt _08032E10
	ldr r0, _08032DFC  @ gUnknown_0859DBA0
	ldr r1, [r0]
	adds r6, r1, #0
	adds r6, #0x2d
	adds r0, r6, r4
	movs r7, #0
	ldrsb r7, [r0, r7]
	adds r5, r1, #0
	adds r5, #0x41
	adds r4, r5, r4
_08032DD8:
	asrs r1, r2, #0x18
	adds r0, r6, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r7, r0
	bne _08032E00
	adds r0, r5, r1
	movs r1, #0
	ldrsb r1, [r4, r1]
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r1, r0
	bne _08032E00
	movs r0, #0
	b _08032E20
	.align 2, 0
_08032DFC: .4byte gUnknown_0859DBA0
_08032E00:
	lsls r0, r3, #0x18
	movs r1, #0xff
	lsls r1, r1, #0x18
	adds r0, r0, r1
	lsrs r3, r0, #0x18
	lsls r2, r3, #0x18
	cmp r2, #0
	bge _08032DD8
_08032E10:
	movs r0, #0xff
	lsls r0, r0, #0x18
	add r0, ip
	lsrs r1, r0, #0x18
_08032E18:
	lsls r0, r1, #0x18
	cmp r0, #0
	bgt _08032DB0
	movs r0, #1
_08032E20:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8032DA0

	THUMB_FUNC_START sub_8032E28
sub_8032E28: @ 0x08032E28
	push {r4, r5, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _08032E98  @ gUnknown_08A03054
	ldr r1, _08032E9C  @ 0x06015E00
	bl CopyDataWithPossibleUncomp
	ldr r0, _08032EA0  @ gUnknown_08A0328C
	movs r1, #0x98
	lsls r1, r1, #2
	movs r2, #0x20
	bl CopyToPaletteBuffer
	cmp r4, #0
	bne _08032E90
	ldr r5, _08032EA4  @ gUnknown_0859DBA0
	ldr r2, [r5]
	ldr r4, _08032EA8  @ gActiveUnit
	ldr r1, [r4]
	ldr r0, [r1, #4]
	ldrb r0, [r0, #0x12]
	ldrb r1, [r1, #0x1d]
	adds r0, r0, r1
	ldr r1, _08032EAC  @ gActionData
	ldrb r1, [r1, #0x10]
	subs r0, r0, r1
	adds r2, #0x2b
	strb r0, [r2]
	movs r0, #0
	bl sub_80329EC
	ldr r1, [r4]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	ldrb r1, [r1, #0x11]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl sub_8032A94
	ldr r0, [r5]
	adds r1, r0, #0
	adds r1, #0x2b
	ldrb r1, [r1]
	adds r0, #0x55
	strb r1, [r0]
	ldr r1, _08032EB0  @ 0x0000FFFF
	adds r0, r1, #0
	bl sub_80329D8
	bl sub_8032EB4
_08032E90:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08032E98: .4byte gUnknown_08A03054
_08032E9C: .4byte 0x06015E00
_08032EA0: .4byte gUnknown_08A0328C
_08032EA4: .4byte gUnknown_0859DBA0
_08032EA8: .4byte gActiveUnit
_08032EAC: .4byte gActionData
_08032EB0: .4byte 0x0000FFFF

	THUMB_FUNC_END sub_8032E28

	THUMB_FUNC_START sub_8032EB4
sub_8032EB4: @ 0x08032EB4
	push {r4, r5, r6, r7, lr}
	ldr r7, _08032F38  @ gUnknown_0859DBA0
	ldr r2, [r7]
	adds r0, r2, #0
	adds r0, #0x29
	ldr r5, _08032F3C  @ gUnknown_0202BCB0
	movs r1, #0
	ldrsb r1, [r0, r1]
	movs r3, #0x14
	ldrsh r0, [r5, r3]
	cmp r1, r0
	bne _08032EDE
	adds r0, r2, #0
	adds r0, #0x2a
	movs r1, #0
	ldrsb r1, [r0, r1]
	movs r2, #0x16
	ldrsh r0, [r5, r2]
	cmp r1, r0
	bne _08032EDE
	b _08033060
_08032EDE:
	ldrh r0, [r5, #0x14]
	ldrh r1, [r5, #0x16]
	bl sub_80329D8
	ldr r0, _08032F40  @ gBmMapMovement
	ldr r0, [r0]
	bl SetWorkingBmMap
	movs r3, #0x16
	ldrsh r0, [r5, r3]
	ldr r1, _08032F44  @ gWorkingBmMap
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r2, #0x14
	ldrsh r1, [r5, r2]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r4, #1
	negs r4, r4
	cmp r0, r4
	bne _08032F12
	b _08033060
_08032F12:
	movs r0, #0x14
	ldrsb r0, [r5, r0]
	movs r1, #0x16
	ldrsb r1, [r5, r1]
	bl sub_8032B18
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, r4
	beq _08032F48
	lsls r0, r1, #0x18
	movs r3, #0x80
	lsls r3, r3, #0x11
	adds r0, r0, r3
	asrs r0, r0, #0x18
	bl sub_80329EC
	b _08033060
	.align 2, 0
_08032F38: .4byte gUnknown_0859DBA0
_08032F3C: .4byte gUnknown_0202BCB0
_08032F40: .4byte gBmMapMovement
_08032F44: .4byte gWorkingBmMap
_08032F48:
	ldr r4, [r7]
	adds r0, r4, #0
	adds r0, #0x2c
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r4, #0x55
	adds r4, r4, r0
	bl GetWorkingMoveCosts
	movs r1, #0x16
	ldrsh r6, [r5, r1]
	ldr r1, _08032FB8  @ gBmMapTerrain
	ldr r2, [r1]
	lsls r1, r6, #2
	adds r1, r1, r2
	movs r2, #0x14
	ldrsh r3, [r5, r2]
	ldr r1, [r1]
	adds r1, r1, r3
	ldrb r1, [r1]
	adds r0, r0, r1
	movs r1, #0
	ldrsb r1, [r4, r1]
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r1, r0
	blt _08032FDC
	ldr r4, [r7]
	adds r0, r4, #0
	adds r0, #0x2c
	movs r1, #0
	ldrsb r1, [r0, r1]
	adds r0, #1
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r2, r0, r3
	cmp r2, #0
	bge _08032F9E
	subs r2, r3, r0
_08032F9E:
	adds r0, r4, #0
	adds r0, #0x41
	adds r0, r0, r1
	movs r1, #0
	ldrsb r1, [r0, r1]
	subs r0, r1, r6
	cmp r0, #0
	blt _08032FBC
	adds r0, r2, r0
	cmp r0, #1
	beq _08032FC4
	b _08032FDC
	.align 2, 0
_08032FB8: .4byte gBmMapTerrain
_08032FBC:
	subs r0, r6, r1
	adds r0, r2, r0
	cmp r0, #1
	bne _08032FDC
_08032FC4:
	ldr r1, _08032FD8  @ gUnknown_0202BCB0
	movs r0, #0x14
	ldrsb r0, [r1, r0]
	ldrb r1, [r1, #0x16]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl sub_8032A94
	b _08033060
	.align 2, 0
_08032FD8: .4byte gUnknown_0202BCB0
_08032FDC:
	ldr r0, _08033034  @ gUnknown_0859DBA0
	ldr r0, [r0]
	adds r1, r0, #0
	adds r1, #0x2c
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, #0x55
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _08032FFE
	movs r0, #1
	bl sub_80329EC
_08032FFE:
	ldr r0, _08033038  @ gBmMapUnk
	ldr r0, [r0]
	bl SetWorkingBmMap
	bl sub_8032D30
	ldr r2, _0803303C  @ gUnknown_0202BCB0
	movs r3, #0x16
	ldrsh r4, [r2, r3]
	ldr r0, _08033040  @ gWorkingBmMap
	ldr r1, [r0]
	lsls r0, r4, #2
	adds r0, r0, r1
	movs r1, #0x14
	ldrsh r3, [r2, r1]
	ldr r0, [r0]
	adds r0, r0, r3
	movs r1, #0
	ldrsb r1, [r0, r1]
	movs r0, #1
	negs r0, r0
	cmp r1, r0
	bne _08033044
	bl sub_8032D74
	b _08033060
	.align 2, 0
_08033034: .4byte gUnknown_0859DBA0
_08033038: .4byte gBmMapUnk
_0803303C: .4byte gUnknown_0202BCB0
_08033040: .4byte gWorkingBmMap
_08033044:
	ldr r2, _08033068  @ gWorkingMovementScript
	adds r0, r3, #0
	adds r1, r4, #0
	bl GenerateBestMovementScript
	bl sub_8032B88
	bl sub_8032DA0
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08033060
	bl sub_8032D74
_08033060:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08033068: .4byte gWorkingMovementScript

	THUMB_FUNC_END sub_8032EB4

	THUMB_FUNC_START sub_803306C
sub_803306C: @ 0x0803306C
	push {r4, r5, lr}
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r3, r1, #0x18
	cmp r3, #0
	bne _0803307C
	movs r0, #0
	b _080330CE
_0803307C:
	ldr r1, _080330A0  @ gUnknown_0859DBA0
	ldr r4, [r1]
	subs r5, r3, #1
	adds r1, r4, #0
	adds r1, #0x2d
	adds r2, r1, r5
	adds r1, r1, r3
	ldrb r2, [r2]
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	cmp r2, r1
	bge _080330A4
	movs r0, #3
	b _080330CE
	.align 2, 0
_080330A0: .4byte gUnknown_0859DBA0
_080330A4:
	cmp r2, r1
	ble _080330AC
	movs r0, #1
	b _080330CE
_080330AC:
	adds r1, r4, #0
	adds r1, #0x41
	adds r2, r1, r5
	adds r1, r1, r3
	ldrb r2, [r2]
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	cmp r2, r1
	bge _080330C8
	movs r0, #4
	b _080330CE
_080330C8:
	cmp r2, r1
	ble _080330CE
	movs r0, #2
_080330CE:
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_803306C

	THUMB_FUNC_START sub_80330D4
sub_80330D4: @ 0x080330D4
	push {r4, r5, lr}
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r3, r1, #0x18
	ldr r1, _080330F4  @ gUnknown_0859DBA0
	ldr r4, [r1]
	adds r1, r4, #0
	adds r1, #0x2c
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	cmp r3, r1
	bne _080330F8
	movs r0, #0
	b _08033140
	.align 2, 0
_080330F4: .4byte gUnknown_0859DBA0
_080330F8:
	adds r1, r4, #0
	adds r1, #0x2d
	adds r2, r1, r3
	adds r5, r3, #1
	adds r1, r1, r5
	ldrb r2, [r2]
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	cmp r2, r1
	bge _08033116
	movs r0, #1
	b _08033140
_08033116:
	cmp r2, r1
	ble _0803311E
	movs r0, #3
	b _08033140
_0803311E:
	adds r1, r4, #0
	adds r1, #0x41
	adds r2, r1, r3
	adds r1, r1, r5
	ldrb r2, [r2]
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	cmp r2, r1
	bge _0803313A
	movs r0, #2
	b _08033140
_0803313A:
	cmp r2, r1
	ble _08033140
	movs r0, #4
_08033140:
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80330D4

	THUMB_FUNC_START sub_8033148
sub_8033148: @ 0x08033148
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	lsls r2, r2, #0x18
	lsrs r5, r2, #0x18
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	ldr r2, _08033180  @ gUnknown_0202BCB0
	movs r6, #0xe
	ldrsh r0, [r2, r6]
	subs r1, r1, r0
	cmn r1, r3
	ble _08033184
	cmp r1, #0x9f
	bgt _08033184
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	movs r3, #0xc
	ldrsh r1, [r2, r3]
	subs r0, r0, r1
	cmn r0, r5
	ble _08033184
	cmp r0, #0xef
	bgt _08033184
	movs r0, #1
	b _08033186
	.align 2, 0
_08033180: .4byte gUnknown_0202BCB0
_08033184:
	movs r0, #0
_08033186:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8033148

	THUMB_FUNC_START sub_803318C
sub_803318C: @ 0x0803318C
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	ldr r0, _08033238  @ gUnknown_0859DBA0
	ldr r0, [r0]
	adds r1, r0, #0
	adds r1, #0x2c
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	beq _08033228
	ldrb r0, [r1]
	lsls r5, r0, #0x18
	cmp r5, #0
	blt _08033228
	ldr r0, _0803323C  @ gUnknown_0859DB6C
	mov r9, r0
_080331B2:
	ldr r0, _08033238  @ gUnknown_0859DBA0
	ldr r1, [r0]
	asrs r6, r5, #0x18
	adds r0, r1, #0
	adds r0, #0x2d
	adds r0, r0, r6
	movs r2, #0
	ldrsb r2, [r0, r2]
	adds r1, #0x41
	adds r1, r1, r6
	movs r0, #0
	ldrsb r0, [r1, r0]
	lsls r7, r2, #4
	lsls r0, r0, #4
	mov r8, r0
	adds r0, r7, #0
	mov r1, r8
	movs r2, #0x10
	movs r3, #0x10
	bl sub_8033148
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08033220
	lsrs r5, r5, #0x18
	adds r0, r5, #0
	bl sub_803306C
	adds r4, r0, #0
	adds r0, r5, #0
	bl sub_80330D4
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x17
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #1
	adds r4, r4, r1
	add r4, r9
	ldrh r3, [r4]
	ldr r0, _08033240  @ gUnknown_0202BCB0
	movs r2, #0xc
	ldrsh r1, [r0, r2]
	subs r1, r7, r1
	movs r4, #0xe
	ldrsh r2, [r0, r4]
	mov r0, r8
	subs r2, r0, r2
	str r3, [sp]
	movs r0, #0xb
	ldr r3, _08033244  @ gObject_16x16
	bl PutSprite
_08033220:
	subs r0, r6, #1
	lsls r5, r0, #0x18
	cmp r5, #0
	bge _080331B2
_08033228:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08033238: .4byte gUnknown_0859DBA0
_0803323C: .4byte gUnknown_0859DB6C
_08033240: .4byte gUnknown_0202BCB0
_08033244: .4byte gObject_16x16

	THUMB_FUNC_END sub_803318C

	THUMB_FUNC_START sub_8033248
sub_8033248: @ 0x08033248
	push {lr}
	bl sub_8032EB4
	bl sub_803318C
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8033248

.align 2, 0
