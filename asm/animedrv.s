	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	THUMB_FUNC_START AIS_ExecAll
AIS_ExecAll: @ 0x08004E40
	push {r4, r5, lr}
	movs r5, #0
	ldr r0, _08004E50  @ gUnknown_02029D88
	ldr r0, [r0]
	cmp r0, #0
	beq _08004EB2
	adds r4, r0, #0
	b _08004E56
	.align 2, 0
_08004E50: .4byte gUnknown_02029D88
_08004E54:
	ldr r4, [r4, #0x38]
_08004E56:
	ldrh r0, [r4]
	adds r1, r0, #0
	cmp r1, #0
	beq _08004E54
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	bne _08004E96
	ldrh r1, [r4, #6]
	movs r2, #6
	ldrsh r0, [r4, r2]
	cmp r0, #0
	beq _08004E7A
	subs r0, r1, #1
	strh r0, [r4, #6]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _08004E8E
_08004E7A:
	adds r0, r4, #0
	bl HandleNextAISFrame
	cmp r0, #1
	bne _08004E86
	movs r5, #1
_08004E86:
	movs r1, #6
	ldrsh r0, [r4, r1]
	cmp r0, #0
	beq _08004E7A
_08004E8E:
	ldrh r0, [r4]
	adds r1, r0, #0
	cmp r1, #0
	beq _08004E54
_08004E96:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _08004EA4
	adds r0, r4, #0
	bl _AIS_Display
_08004EA4:
	ldr r0, [r4, #0x38]
	cmp r0, #0
	bne _08004E54
	cmp r5, #1
	bne _08004EB2
	bl AISArray_Sort
_08004EB2:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_START ClearAISArray
ClearAISArray: @ 0x08004EB8
	push {lr}
	ldr r0, _08004EE0  @ gUnknown_02028F78
	movs r1, #0xe1
	lsls r1, r1, #4
	adds r2, r0, r1
	ldr r3, _08004EE4  @ gUnknown_02029D88
	cmp r0, r2
	bcs _08004ED6
	movs r1, #0
_08004ECA:
	strh r1, [r0]
	str r1, [r0, #0x34]
	str r1, [r0, #0x38]
	adds r0, #0x48
	cmp r0, r2
	bcc _08004ECA
_08004ED6:
	movs r0, #0
	str r0, [r3]
	pop {r0}
	bx r0
	.align 2, 0
_08004EE0: .4byte gUnknown_02028F78
_08004EE4: .4byte gUnknown_02029D88

	THUMB_FUNC_START sub_8004EE8
sub_8004EE8: @ 0x08004EE8
	push {r4, lr}
	adds r3, r0, #0
	ldr r4, _08004F3C  @ gUnknown_02028F78
	movs r0, #0xe1
	lsls r0, r0, #4
	adds r2, r4, r0
	cmp r4, r2
	bcs _08004F0C
	ldrh r0, [r4]
	cmp r0, #0
	beq _08004F0C
	adds r1, r2, #0
_08004F00:
	adds r4, #0x48
	cmp r4, r1
	bcs _08004F0C
	ldrh r0, [r4]
	cmp r0, #0
	bne _08004F00
_08004F0C:
	cmp r4, r2
	beq _08004F40
	movs r0, #0
	movs r1, #0
	movs r2, #1
	strh r2, [r4]
	str r3, [r4, #0x20]
	str r3, [r4, #0x24]
	strh r1, [r4, #6]
	strh r1, [r4, #8]
	strh r1, [r4, #0xa]
	strh r1, [r4, #0xc]
	strh r1, [r4, #0x10]
	str r1, [r4, #0x1c]
	strb r0, [r4, #0x14]
	str r1, [r4, #0x2c]
	str r1, [r4, #0x30]
	str r1, [r4, #0x40]
	str r1, [r4, #0x44]
	adds r0, r4, #0
	bl LinkAIS
	adds r0, r4, #0
	b _08004F42
	.align 2, 0
_08004F3C: .4byte gUnknown_02028F78
_08004F40:
	movs r0, #0
_08004F42:
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_START AIS_New
AIS_New: @ 0x08004F48
	push {r4, r5, lr}
	adds r3, r0, #0
	lsls r1, r1, #0x10
	lsrs r5, r1, #0x10
	ldr r4, _08004FA0  @ gUnknown_02028F78
	movs r0, #0xe1
	lsls r0, r0, #4
	adds r2, r4, r0
	cmp r4, r2
	bcs _08004F70
	ldrh r0, [r4]
	cmp r0, #0
	beq _08004F70
	adds r1, r2, #0
_08004F64:
	adds r4, #0x48
	cmp r4, r1
	bcs _08004F70
	ldrh r0, [r4]
	cmp r0, #0
	bne _08004F64
_08004F70:
	cmp r4, r2
	beq _08004FA4
	movs r0, #0
	movs r1, #0
	movs r2, #1
	strh r2, [r4]
	str r3, [r4, #0x20]
	str r3, [r4, #0x24]
	strh r1, [r4, #6]
	strh r1, [r4, #8]
	strh r5, [r4, #0xa]
	strh r1, [r4, #0xc]
	strh r1, [r4, #0x10]
	str r1, [r4, #0x1c]
	strb r0, [r4, #0x14]
	str r1, [r4, #0x2c]
	str r1, [r4, #0x30]
	str r1, [r4, #0x40]
	str r1, [r4, #0x44]
	adds r0, r4, #0
	bl LinkAIS
	adds r0, r4, #0
	b _08004FA6
	.align 2, 0
_08004FA0: .4byte gUnknown_02028F78
_08004FA4:
	movs r0, #0
_08004FA6:
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_START AISArray_Sort
AISArray_Sort: @ 0x08004FAC
	push {r4, r5, lr}
	ldr r4, _08004FFC  @ gUnknown_02028F78
	movs r1, #0xe1
	lsls r1, r1, #4
	adds r0, r4, r1
	adds r5, r4, #0
	ldr r3, _08005000  @ gUnknown_02029D88
	cmp r4, r0
	bcs _08004FD2
	movs r1, #0
	adds r2, r0, #0
_08004FC2:
	ldrh r0, [r4]
	cmp r0, #0
	beq _08004FCC
	str r1, [r4, #0x34]
	str r1, [r4, #0x38]
_08004FCC:
	adds r4, #0x48
	cmp r4, r2
	bcc _08004FC2
_08004FD2:
	movs r0, #0
	str r0, [r3]
	adds r4, r5, #0
	movs r1, #0xe1
	lsls r1, r1, #4
	adds r0, r4, r1
	cmp r4, r0
	bcs _08004FF6
	adds r5, r0, #0
_08004FE4:
	ldrh r0, [r4]
	cmp r0, #0
	beq _08004FF0
	adds r0, r4, #0
	bl LinkAIS
_08004FF0:
	adds r4, #0x48
	cmp r4, r5
	bcc _08004FE4
_08004FF6:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08004FFC: .4byte gUnknown_02028F78
_08005000: .4byte gUnknown_02029D88

	THUMB_FUNC_START AIS_Free
AIS_Free: @ 0x08005004
	push {lr}
	adds r2, r0, #0
	ldr r3, [r2, #0x34]
	cmp r3, #0
	bne _0800501C
	ldr r1, _08005018  @ gUnknown_02029D88
	ldr r0, [r2, #0x38]
	str r0, [r1]
	str r3, [r0, #0x34]
	b _08005026
	.align 2, 0
_08005018: .4byte gUnknown_02029D88
_0800501C:
	ldr r0, [r2, #0x38]
	str r0, [r3, #0x38]
	ldr r1, [r2, #0x38]
	ldr r0, [r2, #0x34]
	str r0, [r1, #0x34]
_08005026:
	movs r0, #0
	strh r0, [r2]
	str r0, [r2, #0x34]
	str r0, [r2, #0x38]
	pop {r0}
	bx r0

	THUMB_FUNC_START AIS_Display
AIS_Display: @ 0x08005034
	push {lr}
	bl _AIS_Display
	pop {r0}
	bx r0

	THUMB_FUNC_START HandleNextAISFrame
HandleNextAISFrame: @ 0x08005040
	push {r4, r5, lr}
	adds r2, r0, #0
	movs r4, #0
	ldr r0, [r2, #0x20]
	ldm r0!, {r3}
	str r0, [r2, #0x20]
	cmp r3, #0
	blt _08005052
	b _080051A0
_08005052:
	movs r0, #0x80
	lsls r0, r0, #0x17
	ands r0, r3
	cmp r0, #0
	beq _0800508C
	lsrs r1, r3, #0x1c
	movs r0, #3
	ands r1, r0
	cmp r1, #0
	beq _0800506C
	cmp r1, #1
	beq _0800507C
	b _080051B4
_0800506C:
	ldr r0, _08005078  @ 0x0FFFFFFF
	ands r3, r0
	adds r0, r2, #0
	bl _call_via_r3
	b _080051B4
	.align 2, 0
_08005078: .4byte 0x0FFFFFFF
_0800507C:
	ldr r0, _08005088  @ 0x0FFFFFFF
	ands r0, r3
	str r0, [r2, #0x24]
	str r0, [r2, #0x20]
	strh r1, [r2, #6]
	b _080051B4
	.align 2, 0
_08005088: .4byte 0x0FFFFFFF
_0800508C:
	lsrs r1, r3, #0x18
	movs r0, #0x3f
	ands r1, r0
	cmp r1, #6
	bls _08005098
	b _080051B4
_08005098:
	lsls r0, r1, #2
	ldr r1, _080050A4  @ _080050A8
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080050A4: .4byte _080050A8
_080050A8: @ jump table
	.4byte _080050C4 @ case 0
	.4byte _080050E0 @ case 1
	.4byte _080050EC @ case 2
	.4byte _080050F8 @ case 3
	.4byte _080050F4 @ case 4
	.4byte _08005114 @ case 5
	.4byte _08005172 @ case 6
_080050C4:
	ldr r0, [r2, #0x20]
	subs r0, #4
	str r0, [r2, #0x20]
	movs r0, #1
	strh r0, [r2, #6]
	ldrh r1, [r2, #0xc]
	ldr r0, _080050DC  @ 0x00000FFF
	ands r0, r1
	movs r3, #0x80
	lsls r3, r3, #7
	b _08005194
	.align 2, 0
_080050DC: .4byte 0x00000FFF
_080050E0:
	movs r0, #0
	strh r0, [r2]
	movs r0, #1
	strh r0, [r2, #6]
	movs r4, #1
	b _080051B4
_080050EC:
	ldr r0, [r2, #0x24]
	str r0, [r2, #0x20]
	movs r0, #1
	b _080051B2
_080050F4:
	strh r3, [r2, #6]
	b _080051B4
_080050F8:
	lsls r0, r3, #0x18
	asrs r0, r0, #0x18
	ldrh r5, [r2, #2]
	adds r0, r0, r5
	strh r0, [r2, #2]
	lsls r0, r3, #0x10
	asrs r0, r0, #0x18
	ldrh r1, [r2, #4]
	adds r0, r0, r1
	strh r0, [r2, #4]
	lsrs r0, r3, #0x10
	movs r1, #0xff
	ands r0, r1
	b _080051B2
_08005114:
	ldrh r1, [r2, #0xc]
	ldr r0, _08005154  @ 0x00000FFF
	ands r0, r1
	movs r5, #0x80
	lsls r5, r5, #5
	adds r1, r5, #0
	orrs r0, r1
	strh r0, [r2, #0xc]
	adds r0, r2, #0
	adds r0, #0x15
	ldrb r1, [r2, #0x14]
	adds r0, r0, r1
	strb r3, [r0]
	ldrb r0, [r2, #0x14]
	adds r0, #1
	strb r0, [r2, #0x14]
	movs r0, #1
	strh r0, [r2, #6]
	movs r0, #0xff
	ands r0, r3
	cmp r0, #0x18
	beq _0800516A
	cmp r0, #0x18
	bhi _08005158
	cmp r0, #1
	bcc _080051B4
	cmp r0, #5
	bls _0800516A
	cmp r0, #0x13
	beq _0800516A
	b _080051B4
	.align 2, 0
_08005154: .4byte 0x00000FFF
_08005158:
	cmp r0, #0x39
	beq _0800516A
	cmp r0, #0x39
	bhi _08005166
	cmp r0, #0x2d
	beq _0800516A
	b _080051B4
_08005166:
	cmp r0, #0x52
	bne _080051B4
_0800516A:
	ldr r0, [r2, #0x20]
	subs r0, #4
	str r0, [r2, #0x20]
	b _080051B4
_08005172:
	strh r3, [r2, #6]
	lsrs r0, r3, #0x10
	strb r0, [r2, #0x13]
	ldr r0, [r2, #0x20]
	ldm r0!, {r1}
	str r1, [r2, #0x28]
	str r0, [r2, #0x20]
	ldm r0!, {r1}
	str r0, [r2, #0x20]
	ldr r0, [r2, #0x30]
	adds r1, r1, r0
	str r1, [r2, #0x3c]
	ldrh r1, [r2, #0xc]
	ldr r0, _0800519C  @ 0x00000FFF
	ands r0, r1
	movs r3, #0x80
	lsls r3, r3, #6
_08005194:
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2, #0xc]
	b _080051B4
	.align 2, 0
_0800519C: .4byte 0x00000FFF
_080051A0:
	ldr r0, _080051BC  @ 0x0FFFFFFC
	ands r0, r3
	str r0, [r2, #0x3c]
	lsrs r0, r3, #0x1a
	movs r1, #0x1c
	ands r0, r1
	movs r1, #3
	ands r3, r1
	adds r0, r0, r3
_080051B2:
	strh r0, [r2, #6]
_080051B4:
	adds r0, r4, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080051BC: .4byte 0x0FFFFFFC

	THUMB_FUNC_START LinkAIS
LinkAIS: @ 0x080051C0
	push {r4, lr}
	adds r2, r0, #0
	ldr r0, _080051D4  @ gUnknown_02029D88
	ldr r1, [r0]
	adds r4, r0, #0
	cmp r1, #0
	bne _080051E0
_080051CE:
	str r2, [r4]
	b _08005202
	.align 2, 0
_080051D4: .4byte gUnknown_02029D88
_080051D8:
	str r0, [r2, #0x38]
	str r1, [r2, #0x34]
	str r2, [r1, #0x38]
	b _08005202
_080051E0:
	ldrh r3, [r2, #0xa]
	b _080051EC
_080051E4:
	ldr r0, [r1, #0x38]
	cmp r0, #0
	beq _080051D8
	adds r1, r0, #0
_080051EC:
	ldrh r0, [r1, #0xa]
	cmp r3, r0
	bls _080051E4
	ldr r3, [r1, #0x34]
	str r3, [r2, #0x34]
	str r1, [r2, #0x38]
	str r2, [r1, #0x34]
	ldr r0, [r2, #0x34]
	cmp r0, #0
	beq _080051CE
	str r2, [r3, #0x38]
_08005202:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_START _AIS_Display
_AIS_Display: @ 0x08005208
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r7, r0, #0
	ldr r4, _08005314  @ gUnknown_0300312C
	ldrh r0, [r4]
	str r0, [sp]
	ldr r2, [r7, #0x3c]
	cmp r2, #0
	beq _08005304
	ldr r3, [r2]
	ldr r1, _08005318  @ 0xFFFF0000
	adds r0, r3, #0
	ands r0, r1
	cmp r0, r1
	bne _08005268
	ldr r6, _0800531C  @ 0x0000FFFF
	ands r6, r3
	cmp r6, #0
	beq _08005268
	ldr r3, _08005320  @ gUnknown_03004158
_08005238:
	ldr r0, [r3]
	ldrh r1, [r2, #4]
	strh r1, [r0, #6]
	adds r0, #8
	str r0, [r3]
	ldrh r1, [r2, #6]
	strh r1, [r0, #6]
	adds r0, #8
	str r0, [r3]
	ldrh r1, [r2, #8]
	strh r1, [r0, #6]
	adds r0, #8
	str r0, [r3]
	ldrh r1, [r2, #0xa]
	strh r1, [r0, #6]
	adds r0, #8
	str r0, [r3]
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
	subs r6, #1
	adds r2, #0xc
	cmp r6, #0
	bne _08005238
_08005268:
	adds r5, r2, #0
	ldr r0, [r5]
	cmp r0, #1
	beq _08005304
	ldr r2, _08005324  @ gUnknown_03003744
	ldr r0, [r2]
	ldr r1, _08005328  @ gUnknown_03003540
	mov sl, r1
	cmp r0, sl
	bcs _08005304
	movs r0, #0x80
	lsls r0, r0, #1
	mov r9, r0
	movs r1, #0x40
	negs r1, r1
	mov r8, r1
	mov ip, r2
_0800528A:
	movs r2, #6
	ldrsh r1, [r5, r2]
	movs r2, #2
	ldrsh r0, [r7, r2]
	adds r3, r1, r0
	movs r0, #8
	ldrsh r1, [r5, r0]
	movs r2, #4
	ldrsh r0, [r7, r2]
	adds r4, r1, r0
	cmp r3, r9
	bgt _080052A6
	cmp r3, r8
	bge _080052AA
_080052A6:
	movs r3, #0xc0
	lsls r3, r3, #1
_080052AA:
	cmp r4, #0xa0
	bgt _080052B2
	cmp r4, r8
	bge _080052B6
_080052B2:
	movs r3, #0xc0
	lsls r3, r3, #1
_080052B6:
	ldr r0, _0800532C  @ 0x000001FF
	ands r3, r0
	movs r0, #0xff
	ands r4, r0
	movs r6, #0
	ldr r1, [r5]
	adds r0, r1, #0
	mov r2, r9
	ands r0, r2
	cmp r0, #0
	beq _080052D0
	ldr r0, [sp]
	lsls r6, r0, #0x19
_080052D0:
	ldr r0, [r7, #0x1c]
	adds r6, r6, r0
	mov r0, ip
	ldr r2, [r0]
	adds r0, r1, r6
	lsls r1, r3, #0x10
	orrs r0, r1
	orrs r0, r4
	stm r2!, {r0}
	mov r1, ip
	str r2, [r1]
	ldrh r1, [r5, #4]
	ldr r0, _08005330  @ 0x0000F3FF
	ands r0, r1
	ldrh r1, [r7, #8]
	adds r0, r0, r1
	strh r0, [r2]
	adds r2, #4
	mov r0, ip
	str r2, [r0]
	adds r5, #0xc
	ldr r0, [r5]
	cmp r0, #1
	beq _08005304
	cmp r2, sl
	bcc _0800528A
_08005304:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08005314: .4byte gUnknown_0300312C
_08005318: .4byte 0xFFFF0000
_0800531C: .4byte 0x0000FFFF
_08005320: .4byte gUnknown_03004158
_08005324: .4byte gUnknown_03003744
_08005328: .4byte gUnknown_03003540
_0800532C: .4byte 0x000001FF
_08005330: .4byte 0x0000F3FF

	THUMB_FUNC_START sub_8005334
sub_8005334: @ 0x08005334
	push {lr}
	adds r2, r0, #0
	movs r0, #0xff
	ands r1, r0
	cmp r1, #0x18
	beq _08005364
	cmp r1, #0x18
	bhi _08005352
	cmp r1, #1
	bcc _0800536A
	cmp r1, #5
	bls _08005364
	cmp r1, #0x13
	beq _08005364
	b _0800536A
_08005352:
	cmp r1, #0x39
	beq _08005364
	cmp r1, #0x39
	bhi _08005360
	cmp r1, #0x2d
	beq _08005364
	b _0800536A
_08005360:
	cmp r1, #0x52
	bne _0800536A
_08005364:
	ldr r0, [r2, #0x20]
	subs r0, #4
	str r0, [r2, #0x20]
_0800536A:
	pop {r0}
	bx r0

	THUMB_FUNC_START sub_8005370
sub_8005370: @ 0x08005370
	push {r4, r5, r6, lr}
	ldr r6, [sp, #0x10]
	ldr r5, _080053A0  @ gUnknown_03003140
	lsls r0, r0, #4
	adds r4, r0, #3
	lsls r4, r4, #1
	adds r4, r4, r5
	strh r1, [r4]
	adds r1, r0, #7
	lsls r1, r1, #1
	adds r1, r1, r5
	strh r2, [r1]
	adds r1, r0, #0
	adds r1, #0xb
	lsls r1, r1, #1
	adds r1, r1, r5
	strh r3, [r1]
	adds r0, #0xf
	lsls r0, r0, #1
	adds r0, r0, r5
	strh r6, [r0]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080053A0: .4byte gUnknown_03003140
