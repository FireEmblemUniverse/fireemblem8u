	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	THUMB_FUNC_START sub_8050E40
sub_8050E40: @ 0x08050E40
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r7, r1, #0
	movs r6, #0
	adds r5, r7, #0
_08050E4C:
	ldrh r0, [r4]
	movs r1, #0xf
	cmp r0, #0xff
	beq _08050E56
	adds r1, r0, #0
_08050E56:
	lsls r0, r1, #5
	ldr r1, _08050E88  @ gUnknown_08802904
	adds r0, r0, r1
	adds r1, r5, #0
	movs r2, #8
	bl CpuFastSet
	adds r4, #2
	adds r5, #0x20
	adds r6, #1
	cmp r6, #0xa
	bls _08050E4C
	movs r0, #0
	str r0, [sp]
	movs r0, #0xc0
	lsls r0, r0, #1
	adds r1, r7, r0
	ldr r2, _08050E8C  @ 0x01000008
	mov r0, sp
	bl CpuFastSet
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08050E88: .4byte gUnknown_08802904
_08050E8C: .4byte 0x01000008

	THUMB_FUNC_END sub_8050E40

	THUMB_FUNC_START sub_8050E90
sub_8050E90: @ 0x08050E90
	push {r4, r5, r6, lr}
	adds r5, r1, #0
	lsls r0, r0, #0x10
	asrs r6, r0, #0x10
	movs r0, #1
	negs r0, r0
	cmp r6, r0
	bne _08050EAC
	movs r0, #0xb
	strh r0, [r5]
	movs r0, #0xa
	strh r0, [r5, #2]
	strh r0, [r5, #4]
	b _08050EF0
_08050EAC:
	adds r0, r6, #0
	movs r1, #0x64
	bl Div
	strh r0, [r5]
	ldrh r1, [r5]
	movs r0, #0x64
	adds r4, r1, #0
	muls r4, r0, r4
	subs r4, r6, r4
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	adds r0, r4, #0
	movs r1, #0xa
	bl Div
	strh r0, [r5, #2]
	ldrh r1, [r5, #2]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #1
	subs r4, r4, r0
	strh r4, [r5, #4]
	ldrh r1, [r5]
	ldrh r0, [r5, #2]
	cmn r1, r0
	bne _08050EE6
	movs r0, #0xb
	strh r0, [r5, #2]
_08050EE6:
	ldrh r0, [r5]
	cmp r0, #0
	bne _08050EF0
	movs r0, #0xb
	strh r0, [r5]
_08050EF0:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8050E90

	THUMB_FUNC_START NewEkrGauge
NewEkrGauge: @ 0x08050EF8
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	sub sp, #8
	ldr r4, _08050F44  @ gUnknown_02000068
	ldr r0, _08050F48  @ gProc_ekrGauge
	movs r1, #1
	bl Proc_Start
	str r0, [r4]
	movs r0, #0
	bl EkrGauge_80511C0
	bl EkrGauge_8051180
	bl EkrGauge_8051228
	bl EkrGauge_8051208
	ldr r1, _08050F4C  @ gUnknown_02000038
	movs r2, #0
	ldrsh r0, [r1, r2]
	movs r2, #2
	ldrsh r1, [r1, r2]
	bl EkrGauge_80511D0
	ldr r0, _08050F50  @ gUnknown_0203E1AC
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0x50
	ble _08050F5C
	ldr r0, _08050F54  @ gUnknown_08802C84
	ldr r1, _08050F58  @ gUnknown_02022C08
	movs r2, #0x10
	bl CpuSet
	b _08050F70
	.align 2, 0
_08050F44: .4byte gUnknown_02000068
_08050F48: .4byte gProc_ekrGauge
_08050F4C: .4byte gUnknown_02000038
_08050F50: .4byte gUnknown_0203E1AC
_08050F54: .4byte gUnknown_08802C84
_08050F58: .4byte gUnknown_02022C08
_08050F5C:
	ldr r0, _08050F88  @ gUnknown_0203E114
	movs r2, #0
	ldrsh r0, [r0, r2]
	lsls r0, r0, #5
	ldr r1, _08050F8C  @ gUnknown_08802B04
	adds r0, r0, r1
	ldr r1, _08050F90  @ gUnknown_02022C08
	movs r2, #0x10
	bl CpuSet
_08050F70:
	ldr r0, _08050F94  @ gUnknown_0203E1AC
	movs r1, #2
	ldrsh r0, [r0, r1]
	cmp r0, #0x50
	ble _08050FA0
	ldr r0, _08050F98  @ gUnknown_08802C84
	ldr r1, _08050F9C  @ gUnknown_02022C28
	movs r2, #0x10
	bl CpuSet
	b _08050FB4
	.align 2, 0
_08050F88: .4byte gUnknown_0203E114
_08050F8C: .4byte gUnknown_08802B04
_08050F90: .4byte gUnknown_02022C08
_08050F94: .4byte gUnknown_0203E1AC
_08050F98: .4byte gUnknown_08802C84
_08050F9C: .4byte gUnknown_02022C28
_08050FA0:
	ldr r0, _08051108  @ gUnknown_0203E114
	movs r2, #2
	ldrsh r0, [r0, r2]
	lsls r0, r0, #5
	ldr r1, _0805110C  @ gUnknown_08802B04
	adds r0, r0, r1
	ldr r1, _08051110  @ gUnknown_02022C28
	movs r2, #0x10
	bl CpuSet
_08050FB4:
	ldr r1, _08051114  @ gUnknown_0203E1B4
	ldr r0, _08051118  @ 0x0000FFFF
	strh r0, [r1]
	movs r0, #1
	negs r0, r0
	strh r0, [r1, #2]
	ldr r0, _0805111C  @ gUnknown_088025D8
	ldr r1, _08051120  @ 0x06013800
	bl LZ77UnCompVram
	ldr r0, _08051124  @ gUnknown_08802674
	ldr r1, _08051128  @ 0x06013940
	bl LZ77UnCompVram
	ldr r0, _0805112C  @ gUnknown_08802698
	ldr r1, _08051130  @ 0x06013D40
	bl LZ77UnCompVram
	ldr r6, _08051108  @ gUnknown_0203E114
	movs r1, #0
	ldrsh r0, [r6, r1]
	lsls r0, r0, #5
	ldr r5, _08051134  @ gUnknown_08802884
	adds r0, r0, r5
	ldr r4, _08051138  @ gUnknown_02022B48
	adds r1, r4, #0
	movs r2, #8
	bl CpuFastSet
	movs r2, #2
	ldrsh r0, [r6, r2]
	lsls r0, r0, #5
	adds r0, r0, r5
	adds r4, #0x20
	adds r1, r4, #0
	movs r2, #8
	bl CpuFastSet
	bl EnablePaletteSync
	ldr r6, _0805113C  @ gUnknown_0203E1B8
	movs r1, #0
	ldrsh r0, [r6, r1]
	ldr r7, _08051140  @ gUnknown_02017700
	adds r1, r7, #0
	bl sub_8050E90
	ldr r5, _08051144  @ gUnknown_0203E1BC
	movs r2, #0
	ldrsh r0, [r5, r2]
	adds r1, r7, #6
	bl sub_8050E90
	ldr r4, _08051148  @ gUnknown_0203E1C0
	movs r1, #0
	ldrsh r0, [r4, r1]
	adds r1, r7, #0
	adds r1, #0xc
	bl sub_8050E90
	movs r2, #2
	ldrsh r0, [r6, r2]
	adds r1, r7, #0
	adds r1, #0x12
	bl sub_8050E90
	movs r1, #2
	ldrsh r0, [r5, r1]
	adds r1, r7, #0
	adds r1, #0x18
	bl sub_8050E90
	movs r2, #2
	ldrsh r0, [r4, r2]
	adds r1, r7, #0
	adds r1, #0x1e
	bl sub_8050E90
	movs r0, #0
	str r0, [sp]
	ldr r1, _0805114C  @ gUnknown_020169C8
	ldr r2, _08051150  @ 0x01000100
	mov r0, sp
	bl CpuFastSet
	movs r6, #0
	mov r9, r7
_08051062:
	movs r5, #0
	lsls r3, r6, #1
	adds r0, r6, #1
	mov r8, r0
	lsls r4, r6, #7
_0805106C:
	adds r0, r3, r6
	adds r0, r0, r5
	lsls r0, r0, #1
	add r0, r9
	ldrh r0, [r0]
	lsls r0, r0, #5
	ldr r1, _08051154  @ gUnknown_088026E4
	adds r0, r0, r1
	ldr r7, _0805114C  @ gUnknown_020169C8
	adds r1, r4, r7
	movs r2, #0x10
	str r3, [sp, #4]
	bl CpuSet
	adds r4, #0x20
	adds r5, #1
	ldr r3, [sp, #4]
	cmp r5, #2
	bls _0805106C
	mov r6, r8
	cmp r6, #5
	bls _08051062
	ldr r1, _08051158  @ 0x06013A00
	movs r4, #0xc0
	lsls r4, r4, #1
	adds r0, r7, #0
	adds r2, r4, #0
	bl RegisterTileGraphics
	adds r0, r7, r4
	ldr r1, _0805115C  @ 0x06013E00
	adds r2, r4, #0
	bl RegisterTileGraphics
	bl ResetIconGraphics_
	movs r0, #0
	movs r1, #0x1d
	bl LoadIconPalette
	movs r0, #0
	movs r1, #0x1e
	bl LoadIconPalette
	ldr r0, _08051160  @ gpEkrBattleUnitLeft
	ldr r0, [r0]
	adds r0, #0x4a
	ldrh r0, [r0]
	bl GetItemIconId
	movs r1, #0xee
	lsls r1, r1, #1
	bl LoadIconObjectGraphics
	ldr r0, _08051164  @ gpEkrBattleUnitRight
	ldr r0, [r0]
	adds r0, #0x4a
	ldrh r0, [r0]
	bl GetItemIconId
	movs r1, #0xef
	lsls r1, r1, #1
	bl LoadIconObjectGraphics
	ldr r0, _08051168  @ gPal_MiscUiGraphics
	movs r1, #0x80
	lsls r1, r1, #2
	movs r2, #0x20
	bl CopyToPaletteBuffer
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08051108: .4byte gUnknown_0203E114
_0805110C: .4byte gUnknown_08802B04
_08051110: .4byte gUnknown_02022C28
_08051114: .4byte gUnknown_0203E1B4
_08051118: .4byte 0x0000FFFF
_0805111C: .4byte gUnknown_088025D8
_08051120: .4byte 0x06013800
_08051124: .4byte gUnknown_08802674
_08051128: .4byte 0x06013940
_0805112C: .4byte gUnknown_08802698
_08051130: .4byte 0x06013D40
_08051134: .4byte gUnknown_08802884
_08051138: .4byte gUnknown_02022B48
_0805113C: .4byte gUnknown_0203E1B8
_08051140: .4byte gUnknown_02017700
_08051144: .4byte gUnknown_0203E1BC
_08051148: .4byte gUnknown_0203E1C0
_0805114C: .4byte gUnknown_020169C8
_08051150: .4byte 0x01000100
_08051154: .4byte gUnknown_088026E4
_08051158: .4byte 0x06013A00
_0805115C: .4byte 0x06013E00
_08051160: .4byte gpEkrBattleUnitLeft
_08051164: .4byte gpEkrBattleUnitRight
_08051168: .4byte gPal_MiscUiGraphics

	THUMB_FUNC_END NewEkrGauge

	THUMB_FUNC_START EndEkrGauge
EndEkrGauge: @ 0x0805116C
	push {lr}
	ldr r0, _0805117C  @ gUnknown_02000068
	ldr r0, [r0]
	bl Proc_End
	pop {r0}
	bx r0
	.align 2, 0
_0805117C: .4byte gUnknown_02000068

	THUMB_FUNC_END EndEkrGauge

	THUMB_FUNC_START EkrGauge_8051180
EkrGauge_8051180: @ 0x08051180
	ldr r0, _0805118C  @ gUnknown_02000068
	ldr r1, [r0]
	movs r0, #0
	str r0, [r1, #0x4c]
	str r0, [r1, #0x50]
	bx lr
	.align 2, 0
_0805118C: .4byte gUnknown_02000068

	THUMB_FUNC_END EkrGauge_8051180

	THUMB_FUNC_START EkrGauge_8051190
EkrGauge_8051190: @ 0x08051190
	ldr r0, _0805119C  @ gUnknown_02000068
	ldr r1, [r0]
	movs r0, #1
	str r0, [r1, #0x4c]
	str r0, [r1, #0x50]
	bx lr
	.align 2, 0
_0805119C: .4byte gUnknown_02000068

	THUMB_FUNC_END EkrGauge_8051190

	THUMB_FUNC_START EkrGauge_80511A0
EkrGauge_80511A0: @ 0x080511A0
	ldr r0, _080511AC  @ gUnknown_02000068
	ldr r1, [r0]
	movs r0, #1
	str r0, [r1, #0x4c]
	bx lr
	.align 2, 0
_080511AC: .4byte gUnknown_02000068

	THUMB_FUNC_END EkrGauge_80511A0

	THUMB_FUNC_START EkrGauge_80511B0
EkrGauge_80511B0: @ 0x080511B0
	ldr r0, _080511BC  @ gUnknown_02000068
	ldr r1, [r0]
	movs r0, #1
	str r0, [r1, #0x50]
	bx lr
	.align 2, 0
_080511BC: .4byte gUnknown_02000068

	THUMB_FUNC_END EkrGauge_80511B0

	THUMB_FUNC_START EkrGauge_80511C0
EkrGauge_80511C0: @ 0x080511C0
	lsls r0, r0, #0x10
	ldr r1, _080511CC  @ gUnknown_02000068
	ldr r1, [r1]
	lsrs r0, r0, #6
	str r0, [r1, #0x44]
	bx lr
	.align 2, 0
_080511CC: .4byte gUnknown_02000068

	THUMB_FUNC_END EkrGauge_80511C0

	THUMB_FUNC_START EkrGauge_80511D0
EkrGauge_80511D0: @ 0x080511D0
	ldr r2, _080511E0  @ gUnknown_02000068
	ldr r2, [r2]
	movs r3, #0
	strh r0, [r2, #0x32]
	strh r1, [r2, #0x3a]
	adds r2, #0x29
	strb r3, [r2]
	bx lr
	.align 2, 0
_080511E0: .4byte gUnknown_02000068

	THUMB_FUNC_END EkrGauge_80511D0

	THUMB_FUNC_START EkrGauge_80511E4
EkrGauge_80511E4: @ 0x080511E4
	ldr r2, _080511F4  @ gUnknown_02000068
	ldr r2, [r2]
	strh r0, [r2, #0x32]
	strh r1, [r2, #0x3a]
	adds r2, #0x29
	movs r0, #1
	strb r0, [r2]
	bx lr
	.align 2, 0
_080511F4: .4byte gUnknown_02000068

	THUMB_FUNC_END EkrGauge_80511E4

	THUMB_FUNC_START EkrGauge_80511F8
EkrGauge_80511F8: @ 0x080511F8
	ldr r0, _08051204  @ gUnknown_02000068
	ldr r0, [r0]
	adds r0, #0x29
	movs r1, #1
	strb r1, [r0]
	bx lr
	.align 2, 0
_08051204: .4byte gUnknown_02000068

	THUMB_FUNC_END EkrGauge_80511F8

	THUMB_FUNC_START EkrGauge_8051208
EkrGauge_8051208: @ 0x08051208
	ldr r0, _08051214  @ gUnknown_02000068
	ldr r0, [r0]
	adds r0, #0x29
	movs r1, #0
	strb r1, [r0]
	bx lr
	.align 2, 0
_08051214: .4byte gUnknown_02000068

	THUMB_FUNC_END EkrGauge_8051208

	THUMB_FUNC_START EkrGauge_8051218
EkrGauge_8051218: @ 0x08051218
	ldr r0, _08051224  @ gUnknown_02000068
	ldr r0, [r0]
	adds r0, #0x2a
	movs r1, #1
	strb r1, [r0]
	bx lr
	.align 2, 0
_08051224: .4byte gUnknown_02000068

	THUMB_FUNC_END EkrGauge_8051218

	THUMB_FUNC_START EkrGauge_8051228
EkrGauge_8051228: @ 0x08051228
	ldr r0, _08051234  @ gUnknown_02000068
	ldr r0, [r0]
	adds r0, #0x2a
	movs r1, #0
	strb r1, [r0]
	bx lr
	.align 2, 0
_08051234: .4byte gUnknown_02000068

	THUMB_FUNC_END EkrGauge_8051228

	THUMB_FUNC_START sub_8051238
sub_8051238: @ 0x08051238
	push {lr}
	adds r3, r0, #0
	cmp r1, #0
	ble _08051260
	cmp r2, #1
	beq _08051250
	cmp r2, #1
	bcs _08051258
	ldr r0, _0805124C  @ gUnknown_085B955C
	b _0805127A
	.align 2, 0
_0805124C: .4byte gUnknown_085B955C
_08051250:
	ldr r0, _08051254  @ gUnknown_085B9574
	b _0805127A
	.align 2, 0
_08051254: .4byte gUnknown_085B9574
_08051258:
	ldr r0, _0805125C  @ gUnknown_085B958C
	b _0805127A
	.align 2, 0
_0805125C: .4byte gUnknown_085B958C
_08051260:
	cmp r2, #1
	beq _08051270
	cmp r2, #1
	bcs _08051278
	ldr r0, _0805126C  @ gUnknown_085B95A4
	b _0805127A
	.align 2, 0
_0805126C: .4byte gUnknown_085B95A4
_08051270:
	ldr r0, _08051274  @ gUnknown_085B95BC
	b _0805127A
	.align 2, 0
_08051274: .4byte gUnknown_085B95BC
_08051278:
	ldr r0, _08051280  @ gUnknown_085B95D4
_0805127A:
	str r0, [r3, #0x3c]
	pop {r0}
	bx r0
	.align 2, 0
_08051280: .4byte gUnknown_085B95D4

	THUMB_FUNC_END sub_8051238

	THUMB_FUNC_START ekrGauge_Loop
ekrGauge_Loop: @ 0x08051284
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x118
	mov sl, r0
	movs r0, #0
	str r0, [sp, #0xd8]
	bl GetGameClock
	lsrs r0, r0, #3
	movs r1, #3
	bl DivRem
	str r0, [sp, #0xe8]
	mov r0, sl
	adds r0, #0x2a
	ldrb r0, [r0]
	cmp r0, #1
	bne _080512B0
	b _08051A7E
_080512B0:
	mov r0, sl
	adds r0, #0x29
	ldrb r1, [r0]
	str r0, [sp, #0x110]
	cmp r1, #0
	beq _080512BE
	b _080513C4
_080512BE:
	mov r1, sl
	ldrh r0, [r1, #0x3a]
	lsls r0, r0, #0x10
	asrs r4, r0, #0x13
	lsls r0, r4, #5
	movs r2, #0xd0
	lsls r2, r2, #1
	adds r7, r0, r2
	cmp r7, #0
	bge _080512D4
	movs r7, #0
_080512D4:
	adds r6, r4, #7
	cmp r6, #7
	ble _080512DC
	movs r6, #7
_080512DC:
	movs r0, #7
	subs r0, r0, r6
	lsls r1, r0, #4
	subs r1, r1, r0
	lsls r1, r1, #1
	mov r8, r1
	ldr r0, _08051300  @ gUnknown_0203E120
	movs r3, #0
	ldrsh r0, [r0, r3]
	cmp r0, #0
	blt _08051304
	cmp r0, #2
	bgt _08051304
	movs r4, #0
	mov r9, r4
	movs r5, #0xf
	str r5, [sp, #0xdc]
	b _0805130A
	.align 2, 0
_08051300: .4byte gUnknown_0203E120
_08051304:
	movs r0, #8
	str r0, [sp, #0xdc]
	mov r9, r0
_0805130A:
	ldr r4, _08051374  @ gUnknown_02022FE8
	movs r1, #0x80
	str r1, [sp]
	adds r0, r4, #0
	movs r1, #0x1e
	movs r2, #8
	movs r3, #0
	bl FillBGRect
	mov r2, sl
	ldr r0, [r2, #0x4c]
	cmp r0, #0
	bne _0805135C
	ldr r0, _08051378  @ gUnknown_08802274
	add r0, r8
	lsls r5, r7, #1
	mov r3, r9
	lsls r1, r3, #1
	ldr r3, _0805137C  @ 0xFFFFFCC0
	adds r2, r4, r3
	adds r1, r1, r2
	adds r5, r5, r1
	lsls r4, r6, #0x10
	lsrs r4, r4, #0x10
	movs r1, #1
	negs r1, r1
	str r1, [sp]
	str r1, [sp, #4]
	adds r1, r5, #0
	movs r2, #0xf
	adds r3, r4, #0
	bl sub_8070E94
	movs r0, #0x80
	str r0, [sp]
	adds r0, r5, #0
	movs r1, #0xf
	adds r2, r4, #0
	movs r3, #2
	bl sub_8070D04
_0805135C:
	mov r1, sl
	ldr r0, [r1, #0x50]
	cmp r0, #0
	bne _080513BE
	ldr r0, [r1, #0x4c]
	cmp r0, #0
	bne _08051384
	ldr r0, _08051380  @ gUnknown_08802348
	mov r3, r8
	adds r2, r3, r0
	b _0805138A
	.align 2, 0
_08051374: .4byte gUnknown_02022FE8
_08051378: .4byte gUnknown_08802274
_0805137C: .4byte 0xFFFFFCC0
_08051380: .4byte gUnknown_08802348
_08051384:
	ldr r0, _0805141C  @ gUnknown_08802428
	mov r4, r8
	adds r2, r4, r0
_0805138A:
	lsls r5, r7, #1
	ldr r1, [sp, #0xdc]
	lsls r0, r1, #1
	ldr r1, _08051420  @ gBG0TilemapBuffer
	adds r0, r0, r1
	adds r5, r5, r0
	lsls r4, r6, #0x10
	lsrs r4, r4, #0x10
	movs r0, #1
	negs r0, r0
	str r0, [sp]
	str r0, [sp, #4]
	adds r0, r2, #0
	adds r1, r5, #0
	movs r2, #0x10
	adds r3, r4, #0
	bl sub_8070E94
	movs r0, #0x80
	str r0, [sp]
	adds r0, r5, #0
	movs r1, #0x10
	adds r2, r4, #0
	movs r3, #3
	bl sub_8070D04
_080513BE:
	movs r0, #1
	bl BG_EnableSyncByMask
_080513C4:
	ldr r3, _08051424  @ gUnknown_0203E1B4
	ldr r0, _08051428  @ gUnknown_0203E1AC
	movs r4, #0
	ldrsh r2, [r3, r4]
	ldrh r4, [r0]
	movs r5, #0
	ldrsh r1, [r0, r5]
	adds r5, r0, #0
	cmp r2, r1
	beq _080513DC
	movs r6, #1
	str r6, [sp, #0xd8]
_080513DC:
	movs r0, #2
	ldrsh r1, [r3, r0]
	ldrh r2, [r5, #2]
	movs r6, #2
	ldrsh r0, [r5, r6]
	cmp r1, r0
	beq _080513EE
	movs r0, #1
	str r0, [sp, #0xd8]
_080513EE:
	strh r4, [r3]
	strh r2, [r3, #2]
	ldrh r7, [r5]
	ldr r0, _0805142C  @ gUnknown_0203E1B0
	ldrh r6, [r0]
	ldrh r1, [r5, #2]
	mov r8, r1
	ldrh r0, [r0, #2]
	str r0, [sp, #0xd4]
	ldr r0, _08051430  @ gUnknown_0203E120
	movs r2, #0
	ldrsh r0, [r0, r2]
	cmp r0, #3
	beq _08051434
	cmp r0, #3
	bgt _08051454
	cmp r0, #0
	blt _08051454
	mov r3, sl
	movs r4, #0x32
	ldrsh r3, [r3, r4]
	str r3, [sp, #0xe0]
	b _0805145E
	.align 2, 0
_0805141C: .4byte gUnknown_08802428
_08051420: .4byte gBG0TilemapBuffer
_08051424: .4byte gUnknown_0203E1B4
_08051428: .4byte gUnknown_0203E1AC
_0805142C: .4byte gUnknown_0203E1B0
_08051430: .4byte gUnknown_0203E120
_08051434:
	ldr r0, _08051448  @ gUnknown_0203E104
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #1
	bne _0805144C
	mov r2, sl
	movs r3, #0x32
	ldrsh r0, [r2, r3]
	adds r0, #0x38
	b _0805145C
	.align 2, 0
_08051448: .4byte gUnknown_0203E104
_0805144C:
	mov r4, sl
	movs r1, #0x32
	ldrsh r0, [r4, r1]
	b _0805145A
_08051454:
	mov r2, sl
	movs r3, #0x32
	ldrsh r0, [r2, r3]
_0805145A:
	subs r0, #0x38
_0805145C:
	str r0, [sp, #0xe0]
_0805145E:
	ldr r4, [sp, #0x110]
	ldrb r0, [r4]
	cmp r0, #0
	bne _0805147C
	mov r0, sl
	movs r1, #0x3a
	ldrsh r0, [r0, r1]
	str r0, [sp, #0xe4]
	ldr r0, _08051478  @ 0x0000FFF8
	ldr r2, [sp, #0xe4]
	ands r2, r0
	str r2, [sp, #0xe4]
	b _08051484
	.align 2, 0
_08051478: .4byte 0x0000FFF8
_0805147C:
	mov r3, sl
	movs r4, #0x3a
	ldrsh r3, [r3, r4]
	str r3, [sp, #0xe4]
_08051484:
	adds r4, r5, #0
	movs r1, #0
	ldrsh r0, [r4, r1]
	movs r1, #0xa
	bl Div
	add r3, sp, #0x68
	strh r0, [r3]
	ldrh r1, [r3]
	lsls r2, r1, #2
	adds r2, r2, r1
	lsls r2, r2, #1
	ldrh r1, [r4]
	subs r1, r1, r2
	strh r1, [r3, #2]
	lsls r0, r0, #0x10
	mov r9, r3
	cmp r0, #0
	bne _080514AE
	movs r0, #0xb
	strh r0, [r3]
_080514AE:
	movs r2, #2
	ldrsh r0, [r4, r2]
	movs r1, #0xa
	bl Div
	mov r3, r9
	strh r0, [r3, #4]
	ldrh r1, [r3, #4]
	lsls r2, r1, #2
	adds r2, r2, r1
	lsls r2, r2, #1
	ldrh r1, [r4, #2]
	subs r1, r1, r2
	strh r1, [r3, #6]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _080514D4
	movs r0, #0xb
	strh r0, [r3, #4]
_080514D4:
	movs r1, #0
	ldrsh r0, [r4, r1]
	cmp r0, #0x50
	ble _080514E4
	movs r0, #0xc
	mov r2, r9
	strh r0, [r2]
	strh r0, [r2, #2]
_080514E4:
	movs r3, #2
	ldrsh r0, [r5, r3]
	cmp r0, #0x50
	ble _080514F4
	movs r0, #0xc
	mov r4, r9
	strh r0, [r4, #4]
	strh r0, [r4, #6]
_080514F4:
	ldr r5, [sp, #0xe0]
	adds r5, #9
	str r5, [sp, #0xfc]
	ldr r0, [sp, #0xe4]
	adds r0, #0x91
	str r0, [sp, #0xf4]
	ldr r1, [sp, #0xe0]
	adds r1, #0x81
	str r1, [sp, #0xf0]
	lsls r2, r7, #0x10
	str r2, [sp, #0x100]
	lsls r6, r6, #0x10
	str r6, [sp, #0x104]
	ldr r3, [sp, #0xe0]
	adds r3, #0x1d
	str r3, [sp, #0x114]
	mov r4, r8
	lsls r4, r4, #0x10
	str r4, [sp, #0x108]
	ldr r5, [sp, #0xd4]
	lsls r5, r5, #0x10
	str r5, [sp, #0x10c]
	ldr r6, [sp, #0xe0]
	adds r6, #0x95
	str r6, [sp, #0xf8]
	ldr r0, [sp, #0xd8]
	cmp r0, #1
	bne _08051582
	add r0, sp, #0xd0
	movs r1, #0
	str r1, [r0]
	ldr r1, _080515BC  @ gUnknown_02016DC8
	ldr r2, _080515C0  @ 0x01000020
	bl CpuFastSet
	movs r0, #0
_0805153C:
	adds r1, r0, #1
	mov r8, r1
	lsls r5, r0, #6
	lsls r0, r0, #2
	mov r2, r9
	adds r4, r0, r2
	movs r6, #1
_0805154A:
	ldrh r0, [r4]
	lsls r0, r0, #5
	ldr r1, _080515C4  @ gUnknown_088026E4
	adds r0, r0, r1
	ldr r7, _080515BC  @ gUnknown_02016DC8
	adds r1, r5, r7
	movs r2, #0x10
	bl CpuSet
	adds r5, #0x20
	adds r4, #2
	subs r6, #1
	cmp r6, #0
	bge _0805154A
	mov r0, r8
	cmp r0, #1
	ble _0805153C
	ldr r1, _080515C8  @ 0x060139C0
	adds r0, r7, #0
	movs r2, #0x40
	bl RegisterTileGraphics
	adds r0, r7, #0
	adds r0, #0x40
	ldr r1, _080515CC  @ 0x06013DC0
	movs r2, #0x40
	bl RegisterTileGraphics
_08051582:
	add r0, sp, #8
	movs r4, #0
	ldr r1, _080515D0  @ 0x0000B1CE
	strh r1, [r0, #8]
	adds r2, r0, #0
	mov r3, sl
	ldr r0, [r3, #0x44]
	orrs r0, r1
	strh r0, [r2, #8]
	adds r0, r2, #0
	add r5, sp, #0xfc
	ldrh r5, [r5]
	strh r5, [r0, #2]
	add r6, sp, #0xf4
	ldrh r6, [r6]
	strh r6, [r0, #4]
	strh r4, [r0, #0xc]
	movs r0, #0
	bl sub_80522F4
	lsls r0, r0, #0x10
	asrs r3, r0, #0x10
	cmp r3, #1
	beq _080515D8
	ldr r0, _080515D4  @ gUnknown_085B940C
	str r0, [sp, #0x44]
	str r4, [sp, #0x24]
	b _08051602
	.align 2, 0
_080515BC: .4byte gUnknown_02016DC8
_080515C0: .4byte 0x01000020
_080515C4: .4byte gUnknown_088026E4
_080515C8: .4byte 0x060139C0
_080515CC: .4byte 0x06013DC0
_080515D0: .4byte 0x0000B1CE
_080515D4: .4byte gUnknown_085B940C
_080515D8:
	add r1, sp, #0x70
	str r1, [sp, #0x44]
	movs r0, #0x80
	lsls r0, r0, #2
	str r0, [sp, #0x24]
	add r2, sp, #8
	adds r0, r2, #0
	ldrh r0, [r0, #2]
	subs r0, #8
	strh r0, [r2, #2]
	adds r0, r2, #0
	ldrh r0, [r0, #4]
	subs r0, #8
	strh r0, [r2, #4]
	ldr r0, _0805164C  @ gUnknown_085B940C
	movs r2, #0x80
	lsls r2, r2, #1
	str r3, [sp]
	movs r3, #0x80
	bl sub_807180C
_08051602:
	mov r1, sl
	ldr r0, [r1, #0x4c]
	cmp r0, #0
	bne _08051610
	add r0, sp, #8
	bl AnimDisplay
_08051610:
	movs r4, #0
	str r4, [sp, #0x24]
	add r0, sp, #8
	ldr r1, _08051650  @ 0x0000C1EE
	strh r1, [r0, #8]
	adds r2, r0, #0
	mov r3, sl
	ldr r0, [r3, #0x44]
	orrs r0, r1
	strh r0, [r2, #8]
	adds r0, r2, #0
	add r5, sp, #0xf0
	ldrh r5, [r5]
	strh r5, [r0, #2]
	add r6, sp, #0xf4
	ldrh r6, [r6]
	strh r6, [r0, #4]
	strh r4, [r0, #0xc]
	movs r0, #1
	bl sub_80522F4
	lsls r0, r0, #0x10
	asrs r3, r0, #0x10
	cmp r3, #1
	beq _08051654
	ldr r0, _0805164C  @ gUnknown_085B940C
	str r0, [sp, #0x44]
	str r4, [sp, #0x24]
	b _0805167E
	.align 2, 0
_0805164C: .4byte gUnknown_085B940C
_08051650: .4byte 0x0000C1EE
_08051654:
	add r1, sp, #0x70
	str r1, [sp, #0x44]
	movs r0, #0x80
	lsls r0, r0, #2
	str r0, [sp, #0x24]
	add r2, sp, #8
	adds r0, r2, #0
	ldrh r0, [r0, #2]
	subs r0, #8
	strh r0, [r2, #2]
	adds r0, r2, #0
	ldrh r0, [r0, #4]
	subs r0, #8
	strh r0, [r2, #4]
	ldr r0, _08051778  @ gUnknown_085B940C
	movs r2, #0x80
	lsls r2, r2, #1
	str r3, [sp]
	movs r3, #0x80
	bl sub_807180C
_0805167E:
	mov r1, sl
	ldr r0, [r1, #0x50]
	cmp r0, #0
	bne _0805168C
	add r0, sp, #8
	bl AnimDisplay
_0805168C:
	ldr r2, [sp, #0x100]
	ldr r3, _0805177C  @ 0xFFD80000
	adds r1, r2, r3
	ldr r4, [sp, #0x104]
	adds r0, r4, r3
	lsrs r5, r0, #0x10
	lsrs r7, r2, #0x10
	lsrs r4, r4, #0x10
	mov r8, r4
	lsrs r6, r1, #0x10
	asrs r1, r1, #0x10
	cmp r1, #0x28
	ble _080516A8
	movs r6, #0x28
_080516A8:
	lsls r0, r5, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x28
	ble _080516B2
	movs r5, #0x28
_080516B2:
	lsls r0, r6, #0x10
	cmp r0, #0
	bge _080516BA
	movs r6, #0
_080516BA:
	lsls r0, r5, #0x10
	cmp r0, #0
	bge _080516C2
	movs r5, #0
_080516C2:
	lsls r0, r7, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x28
	ble _080516CC
	movs r7, #0x28
_080516CC:
	mov r1, r8
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x28
	ble _080516DA
	movs r2, #0x28
	mov r8, r2
_080516DA:
	add r0, sp, #8
	movs r3, #0
	movs r1, #0xb0
	lsls r1, r1, #8
	strh r1, [r0, #8]
	adds r2, r0, #0
	mov r4, sl
	ldr r0, [r4, #0x44]
	orrs r0, r1
	strh r0, [r2, #8]
	str r3, [sp, #0x24]
	adds r0, r2, #0
	add r1, sp, #0x114
	ldrh r1, [r1]
	strh r1, [r0, #2]
	ldr r0, _08051780  @ gUnknown_085B93D0
	str r0, [sp, #0x44]
	ldr r2, [r4, #0x4c]
	mov r9, r2
	cmp r2, #0
	bne _080517B0
	lsls r0, r5, #0x10
	asrs r2, r0, #0x10
	add r4, sp, #0x50
	cmp r2, #0
	beq _0805174A
	lsls r1, r6, #0x10
	asrs r1, r1, #0x10
	adds r0, r4, #0
	bl sub_8071068
	ldr r3, [sp, #0xd8]
	cmp r3, #1
	bne _08051726
	ldr r1, _08051784  @ gUnknown_02016E48
	adds r0, r4, #0
	bl sub_8050E40
_08051726:
	add r1, sp, #8
	ldr r0, [sp, #0xe4]
	adds r0, #0x8e
	strh r0, [r1, #4]
	adds r2, r1, #0
	adds r0, r1, #0
	ldrh r1, [r0, #8]
	movs r0, #0xfc
	lsls r0, r0, #8
	ands r0, r1
	strh r0, [r2, #8]
	adds r1, r2, #0
	strh r0, [r1, #8]
	adds r0, r1, #0
	mov r6, r9
	strh r6, [r0, #0xc]
	bl AnimDisplay
_0805174A:
	lsls r1, r7, #0x10
	asrs r1, r1, #0x10
	mov r0, r8
	lsls r2, r0, #0x10
	asrs r2, r2, #0x10
	adds r0, r4, #0
	bl sub_8071068
	ldr r1, [sp, #0xd8]
	cmp r1, #1
	bne _08051768
	ldr r1, _08051788  @ gUnknown_02017248
	adds r0, r4, #0
	bl sub_8050E40
_08051768:
	cmp r5, #0
	beq _0805178C
	add r1, sp, #8
	ldr r0, [sp, #0xe4]
	adds r0, #0x95
	strh r0, [r1, #4]
	b _08051794
	.align 2, 0
_08051778: .4byte gUnknown_085B940C
_0805177C: .4byte 0xFFD80000
_08051780: .4byte gUnknown_085B93D0
_08051784: .4byte gUnknown_02016E48
_08051788: .4byte gUnknown_02017248
_0805178C:
	add r0, sp, #8
	add r2, sp, #0xf4
	ldrh r2, [r2]
	strh r2, [r0, #4]
_08051794:
	add r2, sp, #8
	adds r0, r2, #0
	ldrh r1, [r0, #8]
	movs r0, #0xfc
	lsls r0, r0, #8
	ands r0, r1
	movs r3, #0
	movs r1, #0x20
	orrs r0, r1
	strh r0, [r2, #8]
	adds r0, r2, #0
	strh r3, [r0, #0xc]
	bl AnimDisplay
_080517B0:
	ldr r3, [sp, #0x108]
	ldr r4, _080518A8  @ 0xFFD80000
	adds r1, r3, r4
	ldr r5, [sp, #0x10c]
	adds r0, r5, r4
	lsrs r5, r0, #0x10
	lsrs r7, r3, #0x10
	ldr r6, [sp, #0x10c]
	lsrs r6, r6, #0x10
	mov r8, r6
	lsrs r6, r1, #0x10
	asrs r1, r1, #0x10
	cmp r1, #0x28
	ble _080517CE
	movs r6, #0x28
_080517CE:
	lsls r0, r5, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x28
	ble _080517D8
	movs r5, #0x28
_080517D8:
	lsls r0, r6, #0x10
	cmp r0, #0
	bge _080517E0
	movs r6, #0
_080517E0:
	lsls r0, r5, #0x10
	cmp r0, #0
	bge _080517E8
	movs r5, #0
_080517E8:
	lsls r0, r7, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x28
	ble _080517F2
	movs r7, #0x28
_080517F2:
	mov r1, r8
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x28
	ble _08051800
	movs r2, #0x28
	mov r8, r2
_08051800:
	add r0, sp, #8
	movs r3, #0
	mov r9, r3
	movs r1, #0xc0
	lsls r1, r1, #8
	strh r1, [r0, #8]
	adds r2, r0, #0
	mov r4, sl
	ldr r0, [r4, #0x44]
	add r4, sp, #0xec
	strh r3, [r4]
	orrs r0, r1
	strh r0, [r2, #8]
	mov r0, r9
	str r0, [sp, #0x24]
	adds r0, r2, #0
	add r1, sp, #0xf8
	ldrh r1, [r1]
	strh r1, [r0, #2]
	ldr r0, _080518AC  @ gUnknown_085B93D0
	str r0, [sp, #0x44]
	mov r2, sl
	ldr r2, [r2, #0x50]
	mov r9, r2
	cmp r2, #0
	bne _080518DC
	lsls r0, r5, #0x10
	asrs r2, r0, #0x10
	adds r5, r0, #0
	add r4, sp, #0x50
	cmp r2, #0
	beq _0805187C
	lsls r1, r6, #0x10
	asrs r1, r1, #0x10
	adds r0, r4, #0
	bl sub_8071068
	ldr r3, [sp, #0xd8]
	cmp r3, #1
	bne _08051858
	ldr r1, _080518B0  @ gUnknown_02017048
	adds r0, r4, #0
	bl sub_8050E40
_08051858:
	add r1, sp, #8
	ldr r0, [sp, #0xe4]
	adds r0, #0x8e
	strh r0, [r1, #4]
	adds r2, r1, #0
	adds r0, r1, #0
	ldrh r1, [r0, #8]
	movs r0, #0xfc
	lsls r0, r0, #8
	ands r0, r1
	movs r1, #0x10
	orrs r0, r1
	strh r0, [r2, #8]
	adds r0, r2, #0
	mov r6, r9
	strh r6, [r0, #0xc]
	bl AnimDisplay
_0805187C:
	lsls r1, r7, #0x10
	asrs r1, r1, #0x10
	mov r0, r8
	lsls r2, r0, #0x10
	asrs r2, r2, #0x10
	adds r0, r4, #0
	bl sub_8071068
	ldr r1, [sp, #0xd8]
	cmp r1, #1
	bne _0805189A
	ldr r1, _080518B4  @ gUnknown_02017448
	adds r0, r4, #0
	bl sub_8050E40
_0805189A:
	cmp r5, #0
	beq _080518B8
	add r1, sp, #8
	ldr r0, [sp, #0xe4]
	adds r0, #0x95
	strh r0, [r1, #4]
	b _080518C0
	.align 2, 0
_080518A8: .4byte 0xFFD80000
_080518AC: .4byte gUnknown_085B93D0
_080518B0: .4byte gUnknown_02017048
_080518B4: .4byte gUnknown_02017448
_080518B8:
	add r0, sp, #8
	add r2, sp, #0xf4
	ldrh r2, [r2]
	strh r2, [r0, #4]
_080518C0:
	add r2, sp, #8
	adds r0, r2, #0
	ldrh r1, [r0, #8]
	movs r0, #0xfc
	lsls r0, r0, #8
	ands r0, r1
	movs r3, #0
	movs r1, #0x30
	orrs r0, r1
	strh r0, [r2, #8]
	adds r0, r2, #0
	strh r3, [r0, #0xc]
	bl AnimDisplay
_080518DC:
	ldr r3, [sp, #0xd8]
	cmp r3, #1
	bne _080518EE
	ldr r0, _08051A90  @ gUnknown_02016E48
	ldr r1, _08051A94  @ 0x06013000
	movs r2, #0x80
	lsls r2, r2, #4
	bl RegisterTileGraphics
_080518EE:
	mov r5, sl
	ldr r4, [r5, #0x4c]
	cmp r4, #0
	bne _0805194A
	str r4, [sp, #0x24]
	ldr r0, _08051A98  @ gUnknown_085B9424
	str r0, [sp, #0x44]
	add r0, sp, #8
	ldr r1, _08051A9C  @ 0x0000B1D0
	strh r1, [r0, #8]
	adds r2, r0, #0
	ldr r0, [r5, #0x44]
	orrs r0, r1
	strh r0, [r2, #8]
	adds r1, r2, #0
	ldr r0, [sp, #0xe0]
	adds r0, #0x12
	strh r0, [r1, #2]
	ldr r0, [sp, #0xe4]
	adds r0, #0x70
	strh r0, [r1, #4]
	adds r0, r1, #0
	strh r4, [r0, #0xc]
	bl AnimDisplay
	str r4, [sp, #0x24]
	ldr r0, _08051AA0  @ gUnknown_085B949C
	str r0, [sp, #0x44]
	add r0, sp, #8
	ldr r1, _08051AA4  @ 0x0000B1C0
	strh r1, [r0, #8]
	adds r2, r0, #0
	ldr r0, [r5, #0x44]
	orrs r0, r1
	strh r0, [r2, #8]
	adds r1, r2, #0
	ldr r0, [sp, #0xe0]
	adds r0, #0x65
	strh r0, [r1, #2]
	ldr r0, [sp, #0xe4]
	adds r0, #0x78
	strh r0, [r1, #4]
	adds r0, r1, #0
	strh r4, [r0, #0xc]
	bl AnimDisplay
_0805194A:
	mov r6, sl
	ldr r4, [r6, #0x50]
	cmp r4, #0
	bne _080519A6
	str r4, [sp, #0x24]
	ldr r0, _08051A98  @ gUnknown_085B9424
	str r0, [sp, #0x44]
	add r0, sp, #8
	ldr r1, _08051AA8  @ 0x0000C1F0
	strh r1, [r0, #8]
	adds r2, r0, #0
	ldr r0, [r6, #0x44]
	orrs r0, r1
	strh r0, [r2, #8]
	adds r1, r2, #0
	ldr r0, [sp, #0xe0]
	adds r0, #0xd8
	strh r0, [r1, #2]
	ldr r0, [sp, #0xe4]
	adds r0, #0x70
	strh r0, [r1, #4]
	adds r0, r1, #0
	strh r4, [r0, #0xc]
	bl AnimDisplay
	str r4, [sp, #0x24]
	ldr r0, _08051AAC  @ gUnknown_085B94F0
	str r0, [sp, #0x44]
	add r0, sp, #8
	ldr r1, _08051AB0  @ 0x0000C1C0
	strh r1, [r0, #8]
	adds r2, r0, #0
	ldr r0, [r6, #0x44]
	orrs r0, r1
	strh r0, [r2, #8]
	adds r1, r2, #0
	ldr r0, [sp, #0xe0]
	adds r0, #0x87
	strh r0, [r1, #2]
	ldr r0, [sp, #0xe4]
	adds r0, #0x78
	strh r0, [r1, #4]
	adds r0, r1, #0
	strh r4, [r0, #0xc]
	bl AnimDisplay
_080519A6:
	mov r0, sl
	ldr r4, [r0, #0x4c]
	cmp r4, #0
	bne _08051A12
	str r4, [sp, #0x24]
	ldr r1, _08051AB4  @ gUnknown_0203E1D4
	movs r2, #0
	ldrsh r0, [r1, r2]
	ldr r5, [sp, #0xe4]
	adds r5, #0x79
	cmp r0, #0
	beq _080519EC
	adds r1, r0, #0
	add r0, sp, #8
	ldr r2, [sp, #0xe8]
	bl sub_8051238
	add r0, sp, #8
	movs r1, #0xe5
	lsls r1, r1, #1
	strh r1, [r0, #8]
	adds r2, r0, #0
	mov r6, sl
	ldr r0, [r6, #0x44]
	orrs r0, r1
	strh r0, [r2, #8]
	adds r1, r2, #0
	ldr r0, [sp, #0xe0]
	adds r0, #0x36
	strh r0, [r1, #2]
	adds r0, r1, #0
	strh r5, [r0, #4]
	strh r4, [r0, #0xc]
	bl AnimDisplay
_080519EC:
	ldr r0, _08051AB8  @ gUnknown_085B9544
	str r0, [sp, #0x44]
	add r0, sp, #8
	ldr r1, _08051ABC  @ 0x0000D1DC
	strh r1, [r0, #8]
	adds r2, r0, #0
	mov r3, sl
	ldr r0, [r3, #0x44]
	orrs r0, r1
	strh r0, [r2, #8]
	adds r1, r2, #0
	ldr r0, [sp, #0xe0]
	adds r0, #0x2c
	strh r0, [r1, #2]
	adds r0, r1, #0
	strh r5, [r0, #4]
	strh r4, [r0, #0xc]
	bl AnimDisplay
_08051A12:
	mov r5, sl
	ldr r4, [r5, #0x50]
	cmp r4, #0
	bne _08051A7E
	str r4, [sp, #0x24]
	ldr r1, _08051AB4  @ gUnknown_0203E1D4
	movs r6, #2
	ldrsh r0, [r1, r6]
	ldr r5, [sp, #0xe4]
	adds r5, #0x79
	cmp r0, #0
	beq _08051A58
	adds r1, r0, #0
	add r0, sp, #8
	ldr r2, [sp, #0xe8]
	bl sub_8051238
	add r0, sp, #8
	movs r1, #0xe5
	lsls r1, r1, #1
	strh r1, [r0, #8]
	adds r2, r0, #0
	mov r3, sl
	ldr r0, [r3, #0x44]
	orrs r0, r1
	strh r0, [r2, #8]
	adds r1, r2, #0
	ldr r0, [sp, #0xe0]
	adds r0, #0x85
	strh r0, [r1, #2]
	adds r0, r1, #0
	strh r5, [r0, #4]
	strh r4, [r0, #0xc]
	bl AnimDisplay
_08051A58:
	ldr r0, _08051AB8  @ gUnknown_085B9544
	str r0, [sp, #0x44]
	add r0, sp, #8
	ldr r1, _08051AC0  @ 0x0000E1DE
	strh r1, [r0, #8]
	adds r2, r0, #0
	mov r6, sl
	ldr r0, [r6, #0x44]
	orrs r0, r1
	strh r0, [r2, #8]
	adds r1, r2, #0
	ldr r0, [sp, #0xe0]
	adds r0, #0x7b
	strh r0, [r1, #2]
	adds r0, r1, #0
	strh r5, [r0, #4]
	strh r4, [r0, #0xc]
	bl AnimDisplay
_08051A7E:
	add sp, #0x118
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08051A90: .4byte gUnknown_02016E48
_08051A94: .4byte 0x06013000
_08051A98: .4byte gUnknown_085B9424
_08051A9C: .4byte 0x0000B1D0
_08051AA0: .4byte gUnknown_085B949C
_08051AA4: .4byte 0x0000B1C0
_08051AA8: .4byte 0x0000C1F0
_08051AAC: .4byte gUnknown_085B94F0
_08051AB0: .4byte 0x0000C1C0
_08051AB4: .4byte gUnknown_0203E1D4
_08051AB8: .4byte gUnknown_085B9544
_08051ABC: .4byte 0x0000D1DC
_08051AC0: .4byte 0x0000E1DE

	THUMB_FUNC_END ekrGauge_Loop

.align 2, 0
