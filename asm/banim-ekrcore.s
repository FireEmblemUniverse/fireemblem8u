	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	THUMB_FUNC_START ekrBattle_80506C8
ekrBattle_80506C8: @ 0x080506C8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	str r0, [sp, #8]
	ldr r0, _080507CC  @ gUnknown_02019490
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r0, r1
	mov sl, r0
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	ldr r7, _080507D0  @ gLCDControlBuffer
	ldrb r0, [r7, #1]
	movs r1, #0x20
	orrs r0, r1
	movs r1, #0x41
	negs r1, r1
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r7, #1]
	adds r1, r7, #0
	adds r1, #0x2d
	movs r0, #0
	strb r0, [r1]
	adds r0, r7, #0
	adds r0, #0x31
	movs r2, #0x94
	strb r2, [r0]
	subs r1, #1
	movs r0, #0xf0
	strb r0, [r1]
	adds r0, r7, #0
	adds r0, #0x30
	strb r2, [r0]
	adds r6, r7, #0
	adds r6, #0x34
	ldrb r1, [r6]
	movs r2, #1
	mov r8, r2
	mov r0, r8
	orrs r1, r0
	movs r2, #2
	mov r9, r2
	mov r0, r9
	orrs r1, r0
	movs r5, #4
	orrs r1, r5
	movs r4, #8
	orrs r1, r4
	movs r3, #0x10
	orrs r1, r3
	movs r2, #0x36
	adds r2, r2, r7
	mov ip, r2
	ldrb r0, [r2]
	mov r2, r8
	orrs r0, r2
	movs r2, #3
	negs r2, r2
	ands r0, r2
	orrs r0, r5
	orrs r0, r4
	orrs r0, r3
	subs r2, #0x1e
	ands r1, r2
	strb r1, [r6]
	ands r0, r2
	mov r1, ip
	strb r0, [r1]
	ldr r0, _080507D4  @ gUnknown_08802D44
	ldr r1, _080507D8  @ 0x06002000
	movs r2, #0xc0
	lsls r2, r2, #2
	bl RegisterTileGraphics
	ldr r0, _080507DC  @ gUnknown_08803524
	ldr r1, _080507E0  @ gUnknown_020238F4
	movs r2, #1
	str r2, [sp]
	adds r2, #0xff
	str r2, [sp, #4]
	movs r2, #0x12
	movs r3, #3
	bl sub_8070E94
	ldr r0, _080507E4  @ gUnknown_08803590
	ldr r1, _080507E8  @ pPalette1Buffer
	movs r2, #8
	bl CpuFastSet
	movs r0, #2
	bl BG_EnableSyncByMask
	bl EnablePaletteSync
	bl sub_806FAB0
	cmp r0, #2
	bhi _080507EC
	cmp r0, #1
	bcc _080507EC
	ldrb r2, [r7, #0x10]
	movs r1, #4
	negs r1, r1
	adds r0, r1, #0
	ands r0, r2
	strb r0, [r7, #0x10]
	ldrb r2, [r7, #0xc]
	adds r0, r1, #0
	ands r0, r2
	mov r2, r8
	orrs r0, r2
	strb r0, [r7, #0xc]
	ldrb r0, [r7, #0x18]
	ands r1, r0
	mov r0, r9
	orrs r1, r0
	strb r1, [r7, #0x18]
	ldrb r0, [r7, #0x14]
	movs r1, #3
	orrs r0, r1
	strb r0, [r7, #0x14]
	b _08050818
	.align 2, 0
_080507CC: .4byte gUnknown_02019490
_080507D0: .4byte gLCDControlBuffer
_080507D4: .4byte gUnknown_08802D44
_080507D8: .4byte 0x06002000
_080507DC: .4byte gUnknown_08803524
_080507E0: .4byte gUnknown_020238F4
_080507E4: .4byte gUnknown_08803590
_080507E8: .4byte pPalette1Buffer
_080507EC:
	ldr r3, _08050830  @ gLCDControlBuffer
	ldrb r2, [r3, #0x10]
	movs r1, #4
	negs r1, r1
	adds r0, r1, #0
	ands r0, r2
	strb r0, [r3, #0x10]
	ldrb r2, [r3, #0xc]
	adds r0, r1, #0
	ands r0, r2
	movs r2, #1
	orrs r0, r2
	strb r0, [r3, #0xc]
	ldrb r0, [r3, #0x14]
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	strb r1, [r3, #0x14]
	ldrb r0, [r3, #0x18]
	movs r1, #3
	orrs r0, r1
	strb r0, [r3, #0x18]
_08050818:
	movs r0, #1
	bl EkrGauge_80511C0
	ldr r0, _08050834  @ gUnknown_0203E1C8
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _0805083C
	ldr r0, _08050838  @ gUnknown_0203E1C4
	movs r2, #0
	ldrsh r0, [r0, r2]
	b _08050842
	.align 2, 0
_08050830: .4byte gLCDControlBuffer
_08050834: .4byte gUnknown_0203E1C8
_08050838: .4byte gUnknown_0203E1C4
_0805083C:
	ldr r0, _080508D8  @ gUnknown_0203E1C4
	movs r1, #2
	ldrsh r0, [r0, r1]
_08050842:
	movs r1, #0x64
	bl DivRem
	adds r6, r0, #0
	movs r1, #0xa
	bl Div
	adds r5, r0, #0
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #1
	subs r4, r6, r0
	cmp r5, #0
	bne _08050860
	movs r5, #0xa
_08050860:
	ldr r0, _080508DC  @ gUnknown_02019490
	adds r1, r6, #0
	bl sub_8071140
	lsls r5, r5, #5
	mov r8, r5
	lsls r4, r4, #5
	mov r9, r4
	mov r5, sl
	ldr r4, _080508DC  @ gUnknown_02019490
	ldr r7, _080508E0  @ gUnknown_088030C4
	movs r6, #0xc
_08050878:
	ldrh r0, [r4]
	lsls r0, r0, #5
	adds r0, r0, r7
	adds r1, r5, #0
	movs r2, #8
	bl CpuFastSet
	adds r5, #0x20
	adds r4, #2
	subs r6, #1
	cmp r6, #0
	bge _08050878
	ldr r4, _080508E4  @ gUnknown_088033C4
	mov r2, r8
	adds r0, r2, r4
	movs r1, #0xd0
	lsls r1, r1, #1
	add r1, sl
	movs r2, #8
	bl CpuFastSet
	add r4, r9
	movs r1, #0xe0
	lsls r1, r1, #1
	add r1, sl
	adds r0, r4, #0
	movs r2, #8
	bl CpuFastSet
	ldr r1, _080508E8  @ 0x060021A0
	movs r2, #0xf0
	lsls r2, r2, #1
	mov r0, sl
	bl RegisterTileGraphics
	movs r0, #0
	ldr r1, [sp, #8]
	strh r0, [r1, #0x2c]
	ldr r0, _080508EC  @ ekrBattle_80508F0
	str r0, [r1, #0xc]
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080508D8: .4byte gUnknown_0203E1C4
_080508DC: .4byte gUnknown_02019490
_080508E0: .4byte gUnknown_088030C4
_080508E4: .4byte gUnknown_088033C4
_080508E8: .4byte 0x060021A0
_080508EC: .4byte ekrBattle_80508F0

	THUMB_FUNC_END ekrBattle_80506C8

	THUMB_FUNC_START ekrBattle_80508F0
ekrBattle_80508F0: @ 0x080508F0
	push {lr}
	adds r2, r0, #0
	ldrh r0, [r2, #0x2c]
	adds r1, r0, #1
	strh r1, [r2, #0x2c]
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xc
	ble _08050910
	movs r0, #0
	strh r0, [r2, #0x2c]
	ldr r0, _0805090C  @ ekrBattle_8050940
	str r0, [r2, #0xc]
	b _08050936
	.align 2, 0
_0805090C: .4byte ekrBattle_8050940
_08050910:
	ldr r3, _0805093C  @ gLCDControlBuffer
	adds r2, r3, #0
	adds r2, #0x2d
	movs r0, #0
	strb r0, [r2]
	movs r2, #0x6c
	negs r2, r2
	adds r0, r2, #0
	subs r0, r0, r1
	adds r2, r3, #0
	adds r2, #0x31
	strb r0, [r2]
	subs r2, #5
	movs r0, #0xf0
	strb r0, [r2]
	subs r1, #0x6c
	adds r0, r3, #0
	adds r0, #0x30
	strb r1, [r0]
_08050936:
	pop {r0}
	bx r0
	.align 2, 0
_0805093C: .4byte gLCDControlBuffer

	THUMB_FUNC_END ekrBattle_80508F0

	THUMB_FUNC_START ekrBattle_8050940
ekrBattle_8050940: @ 0x08050940
	push {r4, lr}
	adds r1, r0, #0
	ldrh r0, [r1, #0x2c]
	adds r0, #1
	strh r0, [r1, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xa
	ble _08050998
	ldr r2, _08050964  @ gUnknown_0203E1C8
	ldrh r3, [r2]
	movs r4, #0
	ldrsh r0, [r2, r4]
	cmp r0, #0
	beq _0805096C
	ldr r0, _08050968  @ gUnknown_0203E1C4
	ldrh r0, [r0]
	b _0805097A
	.align 2, 0
_08050964: .4byte gUnknown_0203E1C8
_08050968: .4byte gUnknown_0203E1C4
_0805096C:
	ldrh r3, [r2, #2]
	movs r4, #2
	ldrsh r0, [r2, r4]
	cmp r0, #0
	beq _08050980
	ldr r0, _080509A0  @ gUnknown_0203E1C4
	ldrh r0, [r0, #2]
_0805097A:
	strh r0, [r1, #0x2c]
	adds r0, r0, r3
	strh r0, [r1, #0x2e]
_08050980:
	ldr r0, _080509A4  @ ekrBattle_80509A8
	str r0, [r1, #0xc]
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #0x74
	bl SomePlaySound_8071990
	movs r0, #0x74
	movs r1, #0x78
	movs r2, #0
	bl sub_8071AB0
_08050998:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080509A0: .4byte gUnknown_0203E1C4
_080509A4: .4byte ekrBattle_80509A8

	THUMB_FUNC_END ekrBattle_8050940

	THUMB_FUNC_START ekrBattle_80509A8
ekrBattle_80509A8: @ 0x080509A8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r7, r0, #0
	ldr r0, _08050A70  @ gUnknown_02019490
	mov r8, r0
	movs r1, #0x80
	lsls r1, r1, #1
	add r1, r8
	mov sl, r1
	movs r2, #0x2c
	ldrsh r0, [r7, r2]
	movs r1, #0x64
	bl DivRem
	adds r5, r0, #0
	movs r1, #0xa
	bl Div
	adds r4, r0, #0
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #1
	subs r6, r5, r0
	cmp r4, #0
	bne _080509E4
	movs r4, #0xa
_080509E4:
	mov r0, r8
	adds r1, r5, #0
	bl sub_8071140
	lsls r4, r4, #5
	mov r9, r4
	lsls r6, r6, #5
	str r6, [sp]
	mov r6, sl
	mov r5, r8
	ldr r0, _08050A74  @ gUnknown_088030C4
	mov r8, r0
	movs r4, #0xc
_080509FE:
	ldrh r0, [r5]
	lsls r0, r0, #5
	add r0, r8
	adds r1, r6, #0
	movs r2, #8
	bl CpuFastSet
	adds r6, #0x20
	adds r5, #2
	subs r4, #1
	cmp r4, #0
	bge _080509FE
	ldr r4, _08050A78  @ gUnknown_088033C4
	mov r1, r9
	adds r0, r1, r4
	movs r1, #0xd0
	lsls r1, r1, #1
	add r1, sl
	movs r2, #8
	bl CpuFastSet
	ldr r2, [sp]
	adds r4, r2, r4
	movs r1, #0xe0
	lsls r1, r1, #1
	add r1, sl
	adds r0, r4, #0
	movs r2, #8
	bl CpuFastSet
	ldr r1, _08050A7C  @ 0x060021A0
	movs r2, #0xf0
	lsls r2, r2, #1
	mov r0, sl
	bl RegisterTileGraphics
	ldrh r0, [r7, #0x2c]
	adds r0, #1
	strh r0, [r7, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x2e
	ldrsh r1, [r7, r2]
	cmp r0, r1
	ble _08050A60
	movs r0, #0
	strh r0, [r7, #0x2c]
	ldr r0, _08050A80  @ ekrBattle_8050A84
	str r0, [r7, #0xc]
_08050A60:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08050A70: .4byte gUnknown_02019490
_08050A74: .4byte gUnknown_088030C4
_08050A78: .4byte gUnknown_088033C4
_08050A7C: .4byte 0x060021A0
_08050A80: .4byte ekrBattle_8050A84

	THUMB_FUNC_END ekrBattle_80509A8

	THUMB_FUNC_START ekrBattle_8050A84
ekrBattle_8050A84: @ 0x08050A84
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0x2c
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _08050A96
	movs r0, #0x74
	bl sub_8071A44
_08050A96:
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x1e
	ble _08050AAC
	movs r0, #0
	strh r0, [r4, #0x2c]
	ldr r0, _08050AB4  @ ekrBattle_8050AB8
	str r0, [r4, #0xc]
_08050AAC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08050AB4: .4byte ekrBattle_8050AB8

	THUMB_FUNC_END ekrBattle_8050A84

	THUMB_FUNC_START ekrBattle_8050AB8
ekrBattle_8050AB8: @ 0x08050AB8
	push {lr}
	adds r1, r0, #0
	ldrh r0, [r1, #0x2c]
	adds r2, r0, #1
	strh r2, [r1, #0x2c]
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xc
	ble _08050AD8
	movs r0, #0
	strh r0, [r1, #0x2c]
	ldr r0, _08050AD4  @ ekrBattle_8050B08
	str r0, [r1, #0xc]
	b _08050AFE
	.align 2, 0
_08050AD4: .4byte ekrBattle_8050B08
_08050AD8:
	ldr r3, _08050B04  @ gLCDControlBuffer
	adds r1, r3, #0
	adds r1, #0x2d
	movs r0, #0
	strb r0, [r1]
	adds r0, r2, #0
	subs r0, #0x78
	adds r1, #4
	strb r0, [r1]
	subs r1, #5
	movs r0, #0xf0
	strb r0, [r1]
	movs r1, #0x60
	negs r1, r1
	adds r0, r1, #0
	subs r0, r0, r2
	adds r1, r3, #0
	adds r1, #0x30
	strb r0, [r1]
_08050AFE:
	pop {r0}
	bx r0
	.align 2, 0
_08050B04: .4byte gLCDControlBuffer

	THUMB_FUNC_END ekrBattle_8050AB8

	THUMB_FUNC_START ekrBattle_8050B08
ekrBattle_8050B08: @ 0x08050B08
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x18
	bne _08050B4C
	ldr r2, _08050B30  @ gUnknown_0203E1C8
	movs r1, #0
	ldrsh r0, [r2, r1]
	cmp r0, #0
	beq _08050B38
	ldr r0, _08050B34  @ gUnknown_0203E1C4
	movs r3, #0
	ldrsh r1, [r0, r3]
	movs r3, #0
	ldrsh r0, [r2, r3]
	b _08050B42
	.align 2, 0
_08050B30: .4byte gUnknown_0203E1C8
_08050B34: .4byte gUnknown_0203E1C4
_08050B38:
	ldr r0, _08050B98  @ gUnknown_0203E1C4
	movs r3, #2
	ldrsh r1, [r0, r3]
	movs r3, #2
	ldrsh r0, [r2, r3]
_08050B42:
	adds r1, r1, r0
	cmp r1, #0x63
	ble _08050B4C
	bl NewEkrLvlupFan
_08050B4C:
	movs r1, #0x2c
	ldrsh r0, [r4, r1]
	cmp r0, #0x28
	ble _08050C28
	bl ClearBG1
	movs r0, #0
	bl EkrGauge_80511C0
	bl sub_806FAB0
	cmp r0, #2
	bhi _08050BA0
	cmp r0, #1
	bcc _08050BA0
	ldr r3, _08050B9C  @ gLCDControlBuffer
	ldrb r2, [r3, #0xc]
	movs r1, #4
	negs r1, r1
	adds r0, r1, #0
	ands r0, r2
	strb r0, [r3, #0xc]
	ldrb r2, [r3, #0x10]
	adds r0, r1, #0
	ands r0, r2
	movs r2, #1
	orrs r0, r2
	strb r0, [r3, #0x10]
	ldrb r0, [r3, #0x18]
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	strb r1, [r3, #0x18]
	ldrb r0, [r3, #0x14]
	movs r1, #3
	orrs r0, r1
	strb r0, [r3, #0x14]
	b _08050BCC
	.align 2, 0
_08050B98: .4byte gUnknown_0203E1C4
_08050B9C: .4byte gLCDControlBuffer
_08050BA0:
	ldr r3, _08050BFC  @ gLCDControlBuffer
	ldrb r2, [r3, #0xc]
	movs r1, #4
	negs r1, r1
	adds r0, r1, #0
	ands r0, r2
	strb r0, [r3, #0xc]
	ldrb r2, [r3, #0x10]
	adds r0, r1, #0
	ands r0, r2
	movs r2, #1
	orrs r0, r2
	strb r0, [r3, #0x10]
	ldrb r0, [r3, #0x14]
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	strb r1, [r3, #0x14]
	ldrb r0, [r3, #0x18]
	movs r1, #3
	orrs r0, r1
	strb r0, [r3, #0x18]
_08050BCC:
	adds r2, r3, #0
	adds r1, r2, #0
	adds r1, #0x2d
	movs r0, #0
	strb r0, [r1]
	adds r1, #4
	strb r0, [r1]
	subs r1, #5
	movs r0, #0xf0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0xa0
	strb r0, [r1]
	ldr r2, _08050C00  @ gUnknown_0203E1C8
	movs r3, #0
	ldrsh r0, [r2, r3]
	cmp r0, #0
	beq _08050C08
	ldr r0, _08050C04  @ gUnknown_0203E1C4
	movs r3, #0
	ldrsh r1, [r0, r3]
	movs r3, #0
	ldrsh r0, [r2, r3]
	b _08050C12
	.align 2, 0
_08050BFC: .4byte gLCDControlBuffer
_08050C00: .4byte gUnknown_0203E1C8
_08050C04: .4byte gUnknown_0203E1C4
_08050C08:
	ldr r0, _08050C1C  @ gUnknown_0203E1C4
	movs r3, #2
	ldrsh r1, [r0, r3]
	movs r3, #2
	ldrsh r0, [r2, r3]
_08050C12:
	adds r1, r1, r0
	cmp r1, #0x63
	ble _08050C24
	ldr r0, _08050C20  @ ekrBattle_CheckForLevelup_8050C34
	b _08050C26
	.align 2, 0
_08050C1C: .4byte gUnknown_0203E1C4
_08050C20: .4byte ekrBattle_CheckForLevelup_8050C34
_08050C24:
	ldr r0, _08050C30  @ ekrBattle_MakePopups
_08050C26:
	str r0, [r4, #0xc]
_08050C28:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08050C30: .4byte ekrBattle_MakePopups

	THUMB_FUNC_END ekrBattle_8050B08

	THUMB_FUNC_START ekrBattle_CheckForLevelup_8050C34
ekrBattle_CheckForLevelup_8050C34: @ 0x08050C34
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08050C48  @ gUnknown_0203E1C8
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _08050C50
	ldr r0, _08050C4C  @ gUnknown_02000000
	ldr r0, [r0]
	b _08050C54
	.align 2, 0
_08050C48: .4byte gUnknown_0203E1C8
_08050C4C: .4byte gUnknown_02000000
_08050C50:
	ldr r0, _08050C64  @ gUnknown_02000000
	ldr r0, [r0, #8]
_08050C54:
	bl NewEkrLevelup
	ldr r0, _08050C68  @ ekrBattle_WaitForLevelup_8050C6C
	str r0, [r4, #0xc]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08050C64: .4byte gUnknown_02000000
_08050C68: .4byte ekrBattle_WaitForLevelup_8050C6C

	THUMB_FUNC_END ekrBattle_CheckForLevelup_8050C34

	THUMB_FUNC_START ekrBattle_WaitForLevelup_8050C6C
ekrBattle_WaitForLevelup_8050C6C: @ 0x08050C6C
	push {r4, lr}
	adds r4, r0, #0
	bl CheckEkrLvupDone
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _08050C84
	bl EndEkrLevelUp
	ldr r0, _08050C8C  @ ekrBattle_MakePopups
	str r0, [r4, #0xc]
_08050C84:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08050C8C: .4byte ekrBattle_MakePopups

	THUMB_FUNC_END ekrBattle_WaitForLevelup_8050C6C

	THUMB_FUNC_START ekrBattle_MakePopups
ekrBattle_MakePopups: @ 0x08050C90
	push {r4, lr}
	adds r4, r0, #0
	bl Battle_MakePopups
	ldr r0, _08050CA4  @ ekrBattle_WaitForPopup
	str r0, [r4, #0xc]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08050CA4: .4byte ekrBattle_WaitForPopup

	THUMB_FUNC_END ekrBattle_MakePopups

	THUMB_FUNC_START ekrBattle_WaitForPopup
ekrBattle_WaitForPopup: @ 0x08050CA8
	push {r4, lr}
	adds r4, r0, #0
	bl DoesBattlePopupExist
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _08050CC0
	bl DeleteAnimsOnPopup
	ldr r0, _08050CC8  @ ekrBattle_8050CCC
	str r0, [r4, #0xc]
_08050CC0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08050CC8: .4byte ekrBattle_8050CCC

	THUMB_FUNC_END ekrBattle_WaitForPopup

	THUMB_FUNC_START ekrBattle_8050CCC
ekrBattle_8050CCC: @ 0x08050CCC
	push {r4, lr}
	adds r4, r0, #0
	bl sub_8054ED4
	bl sub_80546B0
	ldr r0, _08050CF0  @ gUnknown_0203E100
	movs r1, #0
	ldrsh r0, [r0, r1]
	str r0, [r4, #0x44]
	movs r0, #0
	str r0, [r4, #0x48]
	ldr r0, _08050CF4  @ ekrBattle_8050CF8
	str r0, [r4, #0xc]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08050CF0: .4byte gUnknown_0203E100
_08050CF4: .4byte ekrBattle_8050CF8

	THUMB_FUNC_END ekrBattle_8050CCC

	THUMB_FUNC_START ekrBattle_8050CF8
ekrBattle_8050CF8: @ 0x08050CF8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x48]
	cmp r0, #2
	bne _08050D0C
	ldr r0, _08050D08  @ ekrBattle_8050DA8
	str r0, [r4, #0xc]
	b _08050D7C
	.align 2, 0
_08050D08: .4byte ekrBattle_8050DA8
_08050D0C:
	ldr r0, [r4, #0x44]
	cmp r0, #0
	bne _08050D48
	ldr r0, _08050D2C  @ gUnknown_02000000
	ldr r0, [r0]
	str r0, [r4, #0x5c]
	bl sub_806FA6C
	cmp r0, #2
	beq _08050D34
	cmp r0, #2
	bhi _08050D30
	cmp r0, #1
	beq _08050D34
	b _08050D3E
	.align 2, 0
_08050D2C: .4byte gUnknown_02000000
_08050D30:
	cmp r0, #3
	bne _08050D3E
_08050D34:
	ldr r0, [r4, #0x5c]
	bl sub_80701E8
	ldr r0, _08050D44  @ ekrBattle_8050D88
	str r0, [r4, #0xc]
_08050D3E:
	movs r0, #1
	b _08050D74
	.align 2, 0
_08050D44: .4byte ekrBattle_8050D88
_08050D48:
	ldr r0, _08050D60  @ gUnknown_02000000
	ldr r0, [r0, #8]
	str r0, [r4, #0x5c]
	bl sub_806FA6C
	cmp r0, #2
	beq _08050D68
	cmp r0, #2
	bhi _08050D64
	cmp r0, #1
	beq _08050D68
	b _08050D72
	.align 2, 0
_08050D60: .4byte gUnknown_02000000
_08050D64:
	cmp r0, #3
	bne _08050D72
_08050D68:
	ldr r0, [r4, #0x5c]
	bl sub_80701E8
	ldr r0, _08050D84  @ ekrBattle_8050D88
	str r0, [r4, #0xc]
_08050D72:
	movs r0, #0
_08050D74:
	str r0, [r4, #0x44]
	ldr r0, [r4, #0x48]
	adds r0, #1
	str r0, [r4, #0x48]
_08050D7C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08050D84: .4byte ekrBattle_8050D88

	THUMB_FUNC_END ekrBattle_8050CF8

	THUMB_FUNC_START ekrBattle_8050D88
ekrBattle_8050D88: @ 0x08050D88
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl sub_806FC14
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _08050D9E
	ldr r0, _08050DA4  @ ekrBattle_8050CF8
	str r0, [r4, #0xc]
_08050D9E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08050DA4: .4byte ekrBattle_8050CF8

	THUMB_FUNC_END ekrBattle_8050D88

	THUMB_FUNC_START ekrBattle_8050DA8
ekrBattle_8050DA8: @ 0x08050DA8
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _08050DD4  @ gUnknown_02017724
	movs r0, #1
	str r0, [r1]
	ldr r0, _08050DD8  @ gUnknown_0203E0FC
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _08050DCA
	movs r0, #2
	movs r1, #7
	movs r2, #0
	bl NewEkrNamewinAppear
	bl sub_807289C
_08050DCA:
	ldr r0, _08050DDC  @ nullsub_69
	str r0, [r4, #0xc]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08050DD4: .4byte gUnknown_02017724
_08050DD8: .4byte gUnknown_0203E0FC
_08050DDC: .4byte nullsub_69

	THUMB_FUNC_END ekrBattle_8050DA8

	THUMB_FUNC_START nullsub_69
nullsub_69: @ 0x08050DE0
	bx lr

	THUMB_FUNC_END nullsub_69



	THUMB_FUNC_START NewEkrLvlupFan
NewEkrLvlupFan: @ 0x08050DE4
	push {lr}
	ldr r0, _08050DFC  @ gProc_ekrLvupFan
	movs r1, #3
	bl Proc_Start
	movs r1, #0
	strh r1, [r0, #0x2c]
	movs r0, #0x80
	bl Sound_SetSEVolume
	pop {r0}
	bx r0
	.align 2, 0
_08050DFC: .4byte gProc_ekrLvupFan

	THUMB_FUNC_END NewEkrLvlupFan

	THUMB_FUNC_START EkrLvupFanMain
EkrLvupFanMain: @ 0x08050E00
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x10
	bne _08050E28
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #0x5b
	bl SomePlaySound_8071990
	movs r0, #0x5b
	movs r1, #0x78
	movs r2, #0
	bl sub_8071AB0
	b _08050E3A
_08050E28:
	cmp r0, #0x74
	bne _08050E3A
	movs r0, #0x80
	lsls r0, r0, #1
	bl Sound_SetSEVolume
	adds r0, r4, #0
	bl Proc_Break
_08050E3A:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END EkrLvupFanMain

.align 2, 0
