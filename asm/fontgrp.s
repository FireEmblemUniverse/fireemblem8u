	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	THUMB_FUNC_START SetupDebugFontForBG
SetupDebugFontForBG: @ 0x0800378C
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	cmp r6, #0
	bne _0800379A
	movs r6, #0xb0
	lsls r6, r6, #7
_0800379A:
	adds r0, r5, #0
	movs r1, #0
	bl SetBackgroundTileDataOffset
	adds r0, r5, #0
	movs r1, #0
	bl SetBackgroundScreenSize
	ldr r0, _080037F0  @ gUnknown_08587A40
	ldr r1, _080037F4  @ 0x0001FFFF
	ands r1, r6
	movs r2, #0xc0
	lsls r2, r2, #0x13
	adds r1, r1, r2
	movs r2, #0x80
	lsls r2, r2, #4
	bl RegisterTileGraphics
	ldr r1, _080037F8  @ gUnknown_020228A8
	movs r0, #0
	strh r0, [r1]
	ldr r0, _080037FC  @ 0x00007FFF
	strh r0, [r1, #4]
	bl EnablePaletteSync
	adds r0, r5, #0
	bl BG_GetMapBuffer
	movs r1, #0
	bl BG_Fill
	ldr r4, _08003800  @ gUnknown_02026E30
	strh r5, [r4, #4]
	str r6, [r4]
	adds r0, r5, #0
	adds r1, r6, #0
	bl GetTileIndex
	strh r0, [r4, #6]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080037F0: .4byte gUnknown_08587A40
_080037F4: .4byte 0x0001FFFF
_080037F8: .4byte gUnknown_020228A8
_080037FC: .4byte 0x00007FFF
_08003800: .4byte gUnknown_02026E30

	THUMB_FUNC_START PrintDebugStringToBG
PrintDebugStringToBG: @ 0x08003804
	push {r4, r5, r6, lr}
	adds r2, r0, #0
	ldrb r0, [r1]
	ldr r5, _08003820  @ gUnknown_02026E30
	cmp r0, #0
	beq _0800383C
	adds r3, r5, #0
	ldr r4, _08003824  @ 0x0000FFC0
_08003814:
	cmp r0, #0x60
	bls _08003828
	ldrh r0, [r3, #6]
	adds r0, r0, r4
	b _0800382C
	.align 2, 0
_08003820: .4byte gUnknown_02026E30
_08003824: .4byte 0x0000FFC0
_08003828:
	ldrh r0, [r3, #6]
	subs r0, #0x20
_0800382C:
	ldrb r6, [r1]
	adds r0, r0, r6
	strh r0, [r2]
	adds r2, #2
	adds r1, #1
	ldrb r0, [r1]
	cmp r0, #0
	bne _08003814
_0800383C:
	movs r1, #4
	ldrsh r0, [r5, r1]
	bl BG_EnableSync
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_START sub_800384C
sub_800384C: @ 0x0800384C
	push {r1, r2, r3}
	push {r4, lr}
	sub sp, #0x100
	adds r4, r0, #0
	ldr r1, [sp, #0x108]
	add r2, sp, #0x10c
	mov r0, sp
	bl vsprintf
	adds r0, r4, #0
	mov r1, sp
	bl PrintDebugStringToBG
	add sp, #0x100
	pop {r4}
	pop {r3}
	add sp, #0xc
	bx r3

	THUMB_FUNC_START sub_8003870
sub_8003870: @ 0x08003870
	push {r4, r5, r6, lr}
	movs r1, #0
	ldr r2, _080038AC  @ gUnknown_02026E30
	ldr r6, _080038B0  @ gUnknown_02023CA8
	movs r5, #0xff
	adds r4, r2, #0
	adds r4, #0x14
	movs r3, #0
_08003880:
	adds r0, r1, #0
	ands r0, r5
	lsls r0, r0, #5
	adds r0, r0, r4
	strb r3, [r0]
	adds r1, #1
	cmp r1, #0xff
	ble _08003880
	movs r0, #0
	str r0, [r2, #8]
	str r0, [r2, #0xc]
	adds r0, r6, #0
	movs r1, #0
	bl BG_Fill
	movs r0, #4
	bl BG_EnableSyncByMask
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080038AC: .4byte gUnknown_02026E30
_080038B0: .4byte gUnknown_02023CA8

	THUMB_FUNC_START sub_80038B4
sub_80038B4: @ 0x080038B4
	push {r0, r1, r2, r3}
	push {lr}
	sub sp, #0x100
	mov r0, sp
	bl PrintStringToDBG
	add sp, #0x100
	pop {r3}
	add sp, #0x10
	bx r3

	THUMB_FUNC_START ClearSmallStringBuffer
ClearSmallStringBuffer: @ 0x080038C8
	ldr r1, _080038D8  @ gUnknown_02028E44
	ldr r0, _080038DC  @ 0x20202020
	stm r1!, {r0}
	str r0, [r1]
	ldr r1, _080038D8  @ gUnknown_02028E44
	movs r0, #0
	strb r0, [r1, #8]
	bx lr
	.align 2, 0
_080038D8: .4byte gUnknown_02028E44
_080038DC: .4byte 0x20202020

	THUMB_FUNC_START StoreNumberStringToSmallBuffer
StoreNumberStringToSmallBuffer: @ 0x080038E0
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	bl ClearSmallStringBuffer
	movs r6, #7
	b _080038F2
_080038EC:
	subs r6, #1
	cmp r6, #0
	blt _08003910
_080038F2:
	ldr r4, _08003918  @ gUnknown_02028E44
	adds r4, r6, r4
	adds r0, r5, #0
	movs r1, #0xa
	bl __modsi3
	adds r0, #0x30
	strb r0, [r4]
	adds r0, r5, #0
	movs r1, #0xa
	bl __divsi3
	adds r5, r0, #0
	cmp r5, #0
	bne _080038EC
_08003910:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08003918: .4byte gUnknown_02028E44

	THUMB_FUNC_START StoreNumberStringOrDashesToSmallBuffer
StoreNumberStringOrDashesToSmallBuffer: @ 0x0800391C
	push {r4, lr}
	adds r4, r0, #0
	bl ClearSmallStringBuffer
	cmp r4, #0xff
	beq _08003930
	movs r0, #1
	negs r0, r0
	cmp r4, r0
	bne _08003940
_08003930:
	ldr r1, _0800393C  @ gUnknown_02028E44
	movs r0, #0x3a
	strb r0, [r1, #7]
	strb r0, [r1, #6]
	b _08003946
	.align 2, 0
_0800393C: .4byte gUnknown_02028E44
_08003940:
	adds r0, r4, #0
	bl StoreNumberStringToSmallBuffer
_08003946:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_START sub_800394C
sub_800394C: @ 0x0800394C
	push {r4, lr}
	adds r4, r1, #0
	bl StoreNumberStringToSmallBuffer
	ldr r0, _08003964  @ gUnknown_02028E4C
	subs r0, r0, r4
	bl PrintStringToDBG
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08003964: .4byte gUnknown_02028E4C

	THUMB_FUNC_START StoreNumberHexStringToSmallBuffer
StoreNumberHexStringToSmallBuffer: @ 0x08003968
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	bl ClearSmallStringBuffer
	movs r2, #7
	ldr r1, _080039AC  @ gUnknown_02028E44
	ldr r3, _080039B0  @ gUnknown_080D779C
	movs r0, #0xf
	ands r0, r4
	adds r0, r0, r3
	ldrb r0, [r0]
	strb r0, [r1, #7]
	asrs r4, r4, #4
	cmp r4, #0
	beq _080039A4
	adds r6, r1, #0
	adds r5, r3, #0
	movs r3, #0xf
_0800398C:
	subs r2, #1
	cmp r2, #0
	blt _080039A4
	adds r0, r2, r6
	adds r1, r4, #0
	ands r1, r3
	adds r1, r1, r5
	ldrb r1, [r1]
	strb r1, [r0]
	asrs r4, r4, #4
	cmp r4, #0
	bne _0800398C
_080039A4:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080039AC: .4byte gUnknown_02028E44
_080039B0: .4byte gUnknown_080D779C

	THUMB_FUNC_START sub_80039B4
sub_80039B4: @ 0x080039B4
	push {r4, lr}
	adds r4, r1, #0
	bl StoreNumberHexStringToSmallBuffer
	ldr r0, _080039CC  @ gUnknown_02028E4C
	subs r0, r0, r4
	bl PrintStringToDBG
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080039CC: .4byte gUnknown_02028E4C

	THUMB_FUNC_START PrintStringToDBG
PrintStringToDBG: @ 0x080039D0
	push {r4, lr}
	adds r4, r0, #0
	ldrb r0, [r4]
	ldr r1, _080039EC  @ gUnknown_02026E30
	mov ip, r1
	cmp r0, #0
	beq _08003A24
	mov r3, ip
_080039E0:
	ldrb r2, [r4]
	ldr r0, [r3, #8]
	cmp r0, #0x30
	bne _080039F0
	movs r2, #0
	b _080039F2
	.align 2, 0
_080039EC: .4byte gUnknown_02026E30
_080039F0:
	adds r4, #1
_080039F2:
	cmp r2, #0xa
	bne _080039F8
	movs r2, #0
_080039F8:
	ldrb r1, [r3, #0xc]
	lsls r1, r1, #5
	ldr r0, [r3, #8]
	adds r0, r0, r1
	adds r1, r3, #0
	adds r1, #0x14
	adds r0, r0, r1
	strb r2, [r0]
	ldr r0, [r3, #8]
	adds r0, #1
	str r0, [r3, #8]
	cmp r2, #0
	bne _08003A1E
	mov r0, ip
	str r2, [r0, #8]
	ldr r0, [r0, #0xc]
	adds r0, #1
	mov r1, ip
	str r0, [r1, #0xc]
_08003A1E:
	ldrb r0, [r4]
	cmp r0, #0
	bne _080039E0
_08003A24:
	mov r2, ip
	ldr r0, [r2, #0x10]
	adds r0, #0x14
	ldr r1, [r2, #0xc]
	cmp r1, r0
	bls _08003A36
	adds r0, r1, #0
	subs r0, #0x14
	str r0, [r2, #0x10]
_08003A36:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_START FlushDBGToBG2
FlushDBGToBG2: @ 0x08003A3C
	push {r4, r5, r6, r7, lr}
	ldr r0, _08003A88  @ gUnknown_02023CA8
	movs r1, #0
	bl BG_Fill
	movs r2, #0
	ldr r7, _08003A8C  @ gUnknown_02026E30
	movs r0, #0x14
	adds r0, r0, r7
	mov ip, r0
	movs r6, #0xff
_08003A52:
	lsls r1, r2, #6
	ldr r0, _08003A88  @ gUnknown_02023CA8
	adds r3, r1, r0
	ldr r0, [r7, #0x10]
	adds r0, r2, r0
	ands r0, r6
	lsls r0, r0, #5
	add r0, ip
	ldrb r0, [r0]
	adds r5, r2, #1
	cmp r0, #0
	beq _08003AA8
	ldr r4, _08003A8C  @ gUnknown_02026E30
	ldr r0, [r4, #0x10]
	adds r0, r2, r0
	ands r0, r6
	lsls r0, r0, #5
	adds r1, r4, #0
	adds r1, #0x14
	adds r1, r0, r1
_08003A7A:
	ldrb r2, [r1]
	cmp r2, #0x60
	bls _08003A90
	adds r0, r2, #0
	subs r0, #0x40
	b _08003A94
	.align 2, 0
_08003A88: .4byte gUnknown_02023CA8
_08003A8C: .4byte gUnknown_02026E30
_08003A90:
	adds r0, r2, #0
	subs r0, #0x20
_08003A94:
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	ldrh r0, [r4, #6]
	adds r0, r2, r0
	strh r0, [r3]
	adds r3, #2
	adds r1, #1
	ldrb r0, [r1]
	cmp r0, #0
	bne _08003A7A
_08003AA8:
	adds r2, r5, #0
	cmp r2, #0x13
	ble _08003A52
	movs r0, #4
	bl BG_EnableSyncByMask
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_START sub_8003ABC
sub_8003ABC: @ 0x08003ABC
	push {r4, lr}
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r0, #2
	ands r1, r0
	cmp r1, #0
	beq _08003AD2
	movs r0, #0
	b _08003B16
_08003AD2:
	bl FlushDBGToBG2
	ldr r3, _08003B1C  @ gUnknown_02026E30
	ldr r0, [r3, #0xc]
	ldr r2, _08003B20  @ 0xFFFFFF00
	adds r1, r0, r2
	cmp r1, #0
	bge _08003AE4
	movs r1, #0
_08003AE4:
	adds r2, r0, #0
	subs r2, #0x14
	cmp r2, #0
	bge _08003AEE
	movs r2, #0
_08003AEE:
	movs r0, #0x40
	ands r0, r4
	cmp r0, #0
	beq _08003B00
	ldr r0, [r3, #0x10]
	cmp r1, r0
	bcs _08003B00
	subs r0, #1
	str r0, [r3, #0x10]
_08003B00:
	movs r0, #0x80
	ands r0, r4
	cmp r0, #0
	beq _08003B14
	ldr r1, _08003B1C  @ gUnknown_02026E30
	ldr r0, [r1, #0x10]
	cmp r2, r0
	bls _08003B14
	adds r0, #1
	str r0, [r1, #0x10]
_08003B14:
	movs r0, #1
_08003B16:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08003B1C: .4byte gUnknown_02026E30
_08003B20: .4byte 0xFFFFFF00

	THUMB_FUNC_START SetupDebugFontForOBJ
SetupDebugFontForOBJ: @ 0x08003B24
	push {r4, lr}
	adds r2, r0, #0
	adds r4, r1, #0
	cmp r2, #0
	bge _08003B32
	movs r2, #0xc0
	lsls r2, r2, #6
_08003B32:
	ldr r0, _08003B94  @ 0x0000FFFF
	ands r2, r0
	ldr r1, _08003B98  @ gUnknown_02028E50
	adds r0, r2, #0
	asrs r0, r0, #5
	str r0, [r1]
	ldr r1, _08003B9C  @ gUnknown_02028E54
	movs r0, #0xf
	ands r0, r4
	lsls r0, r0, #0xc
	str r0, [r1]
	ldr r0, _08003BA0  @ gUnknown_08587A40
	movs r3, #0x80
	lsls r3, r3, #9
	adds r1, r2, r3
	ldr r2, _08003BA4  @ 0x0001FFFF
	ands r1, r2
	movs r2, #0xc0
	lsls r2, r2, #0x13
	adds r1, r1, r2
	movs r2, #0x80
	lsls r2, r2, #4
	bl RegisterTileGraphics
	ldr r3, _08003BA8  @ gUnknown_020228A8
	adds r1, r4, #0
	adds r1, #0x10
	lsls r0, r1, #5
	adds r0, r0, r3
	movs r2, #0
	strh r2, [r0]
	lsls r1, r1, #4
	adds r0, r1, #1
	lsls r0, r0, #1
	adds r0, r0, r3
	movs r2, #0xf8
	lsls r2, r2, #7
	strh r2, [r0]
	adds r1, #2
	lsls r1, r1, #1
	adds r1, r1, r3
	ldr r0, _08003BAC  @ 0x00007FFF
	strh r0, [r1]
	bl EnablePaletteSync
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08003B94: .4byte 0x0000FFFF
_08003B98: .4byte gUnknown_02028E50
_08003B9C: .4byte gUnknown_02028E54
_08003BA0: .4byte gUnknown_08587A40
_08003BA4: .4byte 0x0001FFFF
_08003BA8: .4byte gUnknown_020228A8
_08003BAC: .4byte 0x00007FFF

	THUMB_FUNC_START PrintDebugStringAsOBJ
PrintDebugStringAsOBJ: @ 0x08003BB0
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	adds r4, r2, #0
	b _08003BE2
_08003BBA:
	cmp r0, #0x60
	bls _08003BC2
	subs r0, #0x40
	b _08003BC4
_08003BC2:
	subs r0, #0x20
_08003BC4:
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	ldr r0, _08003BF0  @ gUnknown_02028E50
	ldr r3, [r0]
	adds r3, r1, r3
	ldr r0, _08003BF4  @ gUnknown_02028E54
	ldr r0, [r0]
	adds r3, r3, r0
	adds r0, r5, #0
	adds r1, r6, #0
	ldr r2, _08003BF8  @ gUnknown_08590F44
	bl CallARM_PushToSecondaryOAM
	adds r5, #8
	adds r4, #1
_08003BE2:
	ldrb r0, [r4]
	cmp r0, #0
	bne _08003BBA
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08003BF0: .4byte gUnknown_02028E50
_08003BF4: .4byte gUnknown_02028E54
_08003BF8: .4byte gUnknown_08590F44

	THUMB_FUNC_START sub_8003BFC
sub_8003BFC: @ 0x08003BFC
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	adds r0, r2, #0
	adds r4, r3, #0
	bl StoreNumberStringToSmallBuffer
	ldr r2, _08003C1C  @ gUnknown_02028E4C
	subs r2, r2, r4
	adds r0, r5, #0
	adds r1, r6, #0
	bl PrintDebugStringAsOBJ
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08003C1C: .4byte gUnknown_02028E4C

	THUMB_FUNC_START sub_8003C20
sub_8003C20: @ 0x08003C20
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	adds r0, r2, #0
	adds r4, r3, #0
	bl StoreNumberHexStringToSmallBuffer
	ldr r2, _08003C40  @ gUnknown_02028E4C
	subs r2, r2, r4
	adds r0, r5, #0
	adds r1, r6, #0
	bl PrintDebugStringAsOBJ
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08003C40: .4byte gUnknown_02028E4C

	THUMB_FUNC_START sub_8003C44
sub_8003C44: @ 0x08003C44
	push {r2, r3}
	push {r4, r5, lr}
	sub sp, #0x100
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, [sp, #0x10c]
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	add r2, sp, #0x110
	mov r0, sp
	bl vsprintf
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	adds r0, r4, #0
	adds r1, r5, #0
	mov r2, sp
	bl PrintDebugStringAsOBJ
	add sp, #0x100
	pop {r4, r5}
	pop {r3}
	add sp, #8
	bx r3

	THUMB_FUNC_START GetSomeByte
GetSomeByte: @ 0x08003C7C
	ldr r0, _08003C84  @ gUnknown_02028E74
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_08003C84: .4byte gUnknown_02028E74

	THUMB_FUNC_START SetSomeByte
SetSomeByte: @ 0x08003C88
	ldr r1, _08003C90  @ gUnknown_02028E74
	strb r0, [r1]
	bx lr
	.align 2, 0
_08003C90: .4byte gUnknown_02028E74

	THUMB_FUNC_START Font_InitForUIDefault
Font_InitForUIDefault: @ 0x08003C94
	push {lr}
	ldr r0, _08003CAC  @ gUnknown_02028E58
	ldr r1, _08003CB0  @ 0x06001000
	movs r2, #0x80
	movs r3, #0
	bl Font_InitForUI
	ldr r1, _08003CB4  @ gUnknown_02028E78
	movs r0, #0xff
	strb r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_08003CAC: .4byte gUnknown_02028E58
_08003CB0: .4byte 0x06001000
_08003CB4: .4byte gUnknown_02028E78

	THUMB_FUNC_START Font_InitForUI
Font_InitForUI: @ 0x08003CB8
	push {r4, lr}
	adds r4, r0, #0
	cmp r4, #0
	bne _08003CC2
	ldr r4, _08003CEC  @ gUnknown_02028E58
_08003CC2:
	str r1, [r4]
	ldr r0, _08003CF0  @ GetVRAMPointerForTextMaybe
	str r0, [r4, #0xc]
	movs r1, #0
	strh r3, [r4, #0x14]
	lsls r0, r3, #0xc
	adds r0, r2, r0
	strh r0, [r4, #0x10]
	strh r1, [r4, #0x12]
	bl GetSomeByte
	strb r0, [r4, #0x16]
	adds r0, r4, #0
	bl SetFont
	bl Font_LoadForUI
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08003CEC: .4byte gUnknown_02028E58
_08003CF0: .4byte GetVRAMPointerForTextMaybe

	THUMB_FUNC_START SetFontGlyphSet
SetFontGlyphSet: @ 0x08003CF4
	push {lr}
	cmp r0, #0
	bne _08003D0C
	ldr r0, _08003D04  @ gUnknown_02028E70
	ldr r1, [r0]
	ldr r0, _08003D08  @ gUnknown_0858C7EC
	b _08003D12
	.align 2, 0
_08003D04: .4byte gUnknown_02028E70
_08003D08: .4byte gUnknown_0858C7EC
_08003D0C:
	ldr r0, _08003D18  @ gUnknown_02028E70
	ldr r1, [r0]
	ldr r0, _08003D1C  @ gUnknown_0858F6F4
_08003D12:
	str r0, [r1, #4]
	pop {r0}
	bx r0
	.align 2, 0
_08003D18: .4byte gUnknown_02028E70
_08003D1C: .4byte gUnknown_0858F6F4

	THUMB_FUNC_START sub_8003D20
sub_8003D20: @ 0x08003D20
	ldr r0, _08003D30  @ gUnknown_02028E70
	ldr r1, [r0]
	movs r0, #0
	strh r0, [r1, #0x12]
	ldr r1, _08003D34  @ gUnknown_02028E78
	movs r0, #0xff
	strb r0, [r1]
	bx lr
	.align 2, 0
_08003D30: .4byte gUnknown_02028E70
_08003D34: .4byte gUnknown_02028E78

	THUMB_FUNC_START SetFont
SetFont: @ 0x08003D38
	push {lr}
	adds r1, r0, #0
	cmp r1, #0
	bne _08003D50
	ldr r1, _08003D48  @ gUnknown_02028E70
	ldr r0, _08003D4C  @ gUnknown_02028E58
	str r0, [r1]
	b _08003D54
	.align 2, 0
_08003D48: .4byte gUnknown_02028E70
_08003D4C: .4byte gUnknown_02028E58
_08003D50:
	ldr r0, _08003D58  @ gUnknown_02028E70
	str r1, [r0]
_08003D54:
	pop {r0}
	bx r0
	.align 2, 0
_08003D58: .4byte gUnknown_02028E70

	THUMB_FUNC_START Text_Init
Text_Init: @ 0x08003D5C
	push {r4, lr}
	ldr r2, _08003D80  @ gUnknown_02028E70
	ldr r4, [r2]
	ldrh r3, [r4, #0x12]
	movs r2, #0
	strh r3, [r0]
	strb r1, [r0, #4]
	strb r2, [r0, #6]
	strb r2, [r0, #5]
	strb r2, [r0, #7]
	ldrh r2, [r4, #0x12]
	adds r2, r2, r1
	strh r2, [r4, #0x12]
	bl Text_Clear
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08003D80: .4byte gUnknown_02028E70

	THUMB_FUNC_START Text_Allocate
Text_Allocate: @ 0x08003D84
	push {r4, lr}
	ldr r2, _08003DA8  @ gUnknown_02028E70
	ldr r3, [r2]
	ldrh r2, [r3, #0x12]
	movs r4, #0
	strh r2, [r0]
	strb r1, [r0, #4]
	strb r4, [r0, #6]
	movs r2, #1
	strb r2, [r0, #5]
	strb r4, [r0, #7]
	lsls r1, r1, #1
	ldrh r0, [r3, #0x12]
	adds r1, r1, r0
	strh r1, [r3, #0x12]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08003DA8: .4byte gUnknown_02028E70

	THUMB_FUNC_START InitTextBatch
InitTextBatch: @ 0x08003DAC
	push {r4, lr}
	adds r4, r0, #0
	b _08003DBC
_08003DB2:
	ldr r0, [r4]
	ldrb r1, [r4, #4]
	bl Text_Init
	adds r4, #8
_08003DBC:
	ldr r0, [r4]
	cmp r0, #0
	bne _08003DB2
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_START Text_Clear
Text_Clear: @ 0x08003DC8
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	movs r0, #0
	strb r0, [r4, #2]
	strb r0, [r4, #3]
	str r0, [sp]
	ldr r0, _08003DFC  @ gUnknown_02028E70
	ldr r0, [r0]
	ldr r1, [r0, #0xc]
	adds r0, r4, #0
	bl _call_via_r1
	adds r1, r0, #0
	ldrb r2, [r4, #4]
	lsls r2, r2, #4
	movs r0, #0x80
	lsls r0, r0, #0x11
	orrs r2, r0
	mov r0, sp
	bl CpuFastSet
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08003DFC: .4byte gUnknown_02028E70

	THUMB_FUNC_START sub_8003E00
sub_8003E00: @ 0x08003E00
	push {r4, r5, lr}
	sub sp, #4
	ldr r3, _08003E38  @ gUnknown_02028E70
	ldr r5, [r3]
	ldrb r4, [r0, #6]
	ldrb r3, [r0, #4]
	muls r3, r4, r3
	ldrh r0, [r0]
	adds r3, r3, r0
	adds r3, r3, r1
	lsls r3, r3, #6
	ldr r1, [r5]
	adds r1, r1, r3
	movs r0, #0
	str r0, [sp]
	lsls r2, r2, #4
	ldr r0, _08003E3C  @ 0x001FFFFF
	ands r2, r0
	movs r0, #0x80
	lsls r0, r0, #0x11
	orrs r2, r0
	mov r0, sp
	bl CpuFastSet
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08003E38: .4byte gUnknown_02028E70
_08003E3C: .4byte 0x001FFFFF

	THUMB_FUNC_START sub_8003E40
sub_8003E40: @ 0x08003E40
	adds r1, r0, #0
	ldrb r2, [r1, #6]
	ldrb r0, [r1, #4]
	muls r0, r2, r0
	ldrh r1, [r1]
	adds r0, r0, r1
	lsls r0, r0, #1
	bx lr

	THUMB_FUNC_START Text_GetXCursor
Text_GetXCursor: @ 0x08003E50
	ldrb r0, [r0, #2]
	bx lr

	THUMB_FUNC_START Text_SetXCursor
Text_SetXCursor: @ 0x08003E54
	strb r1, [r0, #2]
	bx lr

	THUMB_FUNC_START Text_Advance
Text_Advance: @ 0x08003E58
	ldrb r2, [r0, #2]
	adds r2, r2, r1
	strb r2, [r0, #2]
	bx lr

	THUMB_FUNC_START Text_SetColorId
Text_SetColorId: @ 0x08003E60
	strb r1, [r0, #3]
	bx lr

	THUMB_FUNC_START Text_GetColorId
Text_GetColorId: @ 0x08003E64
	ldrb r0, [r0, #3]
	bx lr

	THUMB_FUNC_START Text_SetParameters
Text_SetParameters: @ 0x08003E68
	strb r1, [r0, #2]
	strb r2, [r0, #3]
	bx lr

	THUMB_FUNC_START Text_Draw
Text_Draw: @ 0x08003E70
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r2, r1, #0
	ldr r0, _08003EB8  @ gUnknown_02028E70
	ldr r1, [r0]
	ldrb r0, [r4, #6]
	ldrb r3, [r4, #4]
	muls r0, r3, r0
	ldrh r5, [r4]
	adds r0, r0, r5
	lsls r0, r0, #1
	ldrh r1, [r1, #0x10]
	adds r1, r0, r1
	cmp r3, #0
	beq _08003EA2
_08003E8E:
	strh r1, [r2]
	adds r1, #1
	adds r0, r2, #0
	adds r0, #0x40
	strh r1, [r0]
	adds r1, #1
	adds r2, #2
	subs r3, #1
	cmp r3, #0
	bne _08003E8E
_08003EA2:
	movs r0, #5
	ldrsb r0, [r4, r0]
	cmp r0, #0
	beq _08003EB2
	ldrb r0, [r4, #6]
	movs r1, #1
	eors r0, r1
	strb r0, [r4, #6]
_08003EB2:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08003EB8: .4byte gUnknown_02028E70

	THUMB_FUNC_START Text_DrawBlank
Text_DrawBlank: @ 0x08003EBC
	push {lr}
	ldrb r0, [r0, #4]
	cmp r0, #0
	beq _08003ED8
	movs r3, #0
	adds r2, r0, #0
_08003EC8:
	strh r3, [r1]
	adds r0, r1, #0
	adds r0, #0x40
	strh r3, [r0]
	adds r1, #2
	subs r2, #1
	cmp r2, #0
	bne _08003EC8
_08003ED8:
	pop {r0}
	bx r0

	THUMB_FUNC_START GetStringTextWidth
GetStringTextWidth: @ 0x08003EDC
	push {r4, r5, lr}
	adds r2, r0, #0
	movs r4, #0
	ldr r0, _08003EF8  @ gUnknown_02028E70
	ldr r1, [r0]
	ldrb r1, [r1, #0x16]
	adds r5, r0, #0
	cmp r1, #0
	beq _08003F2C
	adds r0, r2, #0
	bl GetStringTextWidthSimple
	b _08003F34
	.align 2, 0
_08003EF8: .4byte gUnknown_02028E70
_08003EFC:
	ldrb r3, [r2]
	adds r2, #1
	cmp r3, #0x1f
	bls _08003F2C
	ldrb r0, [r2]
	adds r2, #1
	ldr r1, [r5]
	ldr r1, [r1, #4]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _08003F18  @ 0xFFFFFF00
	adds r0, r0, r1
	ldr r1, [r0]
	b _08003F1E
	.align 2, 0
_08003F18: .4byte 0xFFFFFF00
_08003F1C:
	ldr r1, [r1]
_08003F1E:
	cmp r1, #0
	beq _08003F2C
	ldrb r0, [r1, #4]
	cmp r0, r3
	bne _08003F1C
	ldrb r0, [r1, #5]
	adds r4, r4, r0
_08003F2C:
	ldrb r0, [r2]
	cmp r0, #1
	bhi _08003EFC
	adds r0, r4, #0
_08003F34:
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_START GetCharTextWidth
GetCharTextWidth: @ 0x08003F3C
	push {r4, lr}
	adds r2, r0, #0
	adds r4, r1, #0
	ldr r0, _08003F58  @ gUnknown_02028E70
	ldr r1, [r0]
	ldrb r0, [r1, #0x16]
	cmp r0, #0
	beq _08003F5C
	adds r0, r2, #0
	adds r1, r4, #0
	bl GetCharTextWidthSimple
	b _08003F8A
	.align 2, 0
_08003F58: .4byte gUnknown_02028E70
_08003F5C:
	ldrb r3, [r2]
	adds r2, #1
	ldrb r0, [r2]
	adds r2, #1
	ldr r1, [r1, #4]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _08003F74  @ 0xFFFFFF00
	adds r0, r0, r1
	ldr r1, [r0]
	b _08003F7A
	.align 2, 0
_08003F74: .4byte 0xFFFFFF00
_08003F78:
	ldr r1, [r1]
_08003F7A:
	cmp r1, #0
	beq _08003F88
	ldrb r0, [r1, #4]
	cmp r0, r3
	bne _08003F78
	ldrb r0, [r1, #5]
	str r0, [r4]
_08003F88:
	adds r0, r2, #0
_08003F8A:
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_START GetStringTextCenteredPos
GetStringTextCenteredPos: @ 0x08003F90
	push {r4, lr}
	adds r4, r0, #0
	adds r0, r1, #0
	bl GetStringTextWidth
	subs r4, r4, r0
	lsrs r0, r4, #0x1f
	adds r4, r4, r0
	asrs r4, r4, #1
	adds r0, r4, #0
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_START sub_8003FAC
sub_8003FAC: @ 0x08003FAC
	push {r4, r5, r6, lr}
	adds r6, r1, #0
	adds r5, r2, #0
	movs r0, #0
	str r0, [r6]
	str r0, [r5]
	bl sub_800A2A4
	adds r4, r0, #0
	b _08003FC2
_08003FC0:
	adds r4, #1
_08003FC2:
	ldrb r0, [r4]
	cmp r0, #1
	bls _08003FEC
	adds r0, r4, #0
	bl GetStringTextWidth
	adds r1, r0, #0
	ldr r0, [r6]
	cmp r0, r1
	bge _08003FD8
	str r1, [r6]
_08003FD8:
	ldr r0, [r5]
	adds r0, #0x10
	str r0, [r5]
	adds r0, r4, #0
	bl String_GetEnd
	adds r4, r0, #0
	ldrb r0, [r4]
	cmp r0, #0
	bne _08003FC0
_08003FEC:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_START String_GetEnd
String_GetEnd: @ 0x08003FF4
	push {lr}
	b _08003FFA
_08003FF8:
	adds r0, #1
_08003FFA:
	ldrb r1, [r0]
	cmp r1, #1
	bhi _08003FF8
	pop {r1}
	bx r1

	THUMB_FUNC_START Text_AppendString
Text_AppendString: @ 0x08004004
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r4, r1, #0
	ldr r0, _0800401C  @ gUnknown_02028E70
	ldr r0, [r0]
	ldrb r0, [r0, #0x16]
	cmp r0, #0
	beq _08004068
	adds r0, r6, #0
	bl Text_AppendStringSimple
	b _0800406E
	.align 2, 0
_0800401C: .4byte gUnknown_02028E70
_08004020:
	ldrb r3, [r4]
	adds r4, #1
	cmp r3, #0x1f
	bls _08004068
	ldrb r2, [r4]
	adds r4, #1
	ldr r5, _08004044  @ gUnknown_02028E70
_0800402E:
	ldr r0, [r5]
	ldr r1, [r0, #4]
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r1, _08004048  @ 0xFFFFFF00
	adds r0, r0, r1
	ldr r1, [r0]
	cmp r1, #0
	beq _08004068
	b _08004058
	.align 2, 0
_08004044: .4byte gUnknown_02028E70
_08004048: .4byte 0xFFFFFF00
_0800404C:
	ldr r1, [r1]
	cmp r1, #0
	bne _08004058
	movs r3, #0x81
	movs r2, #0xa7
	b _0800402E
_08004058:
	ldrb r0, [r1, #4]
	cmp r0, r3
	bne _0800404C
	ldr r0, [r5]
	ldr r2, [r0, #8]
	adds r0, r6, #0
	bl _call_via_r2
_08004068:
	ldrb r0, [r4]
	cmp r0, #1
	bhi _08004020
_0800406E:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_START Text_AppendDecNumber
Text_AppendDecNumber: @ 0x08004074
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	adds r4, r1, #0
	cmp r4, #0
	bne _0800408C
	ldr r1, _08004088  @ gUnknown_080D77B0
	bl Text_AppendChar
	b _080040B6
	.align 2, 0
_08004088: .4byte gUnknown_080D77B0
_0800408C:
	adds r0, r4, #0
	movs r1, #0xa
	bl __modsi3
	adds r0, #0x30
	mov r1, sp
	strh r0, [r1]
	adds r0, r4, #0
	movs r1, #0xa
	bl __divsi3
	adds r4, r0, #0
	adds r0, r5, #0
	mov r1, sp
	bl Text_AppendChar
	ldrb r0, [r5, #2]
	subs r0, #0xf
	strb r0, [r5, #2]
	cmp r4, #0
	bne _0800408C
_080040B6:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_START sub_80040C0
sub_80040C0: @ 0x080040C0
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	cmp r5, #0
	bne _080040DC
	ldr r1, _080040D8  @ gUnknown_080D77B0
	bl Text_AppendChar
	ldrb r0, [r4, #2]
	adds r0, #8
	b _0800413A
	.align 2, 0
_080040D8: .4byte gUnknown_080D77B0
_080040DC:
	movs r6, #1
	adds r0, r5, #0
	movs r1, #0xa
	bl __divsi3
	ldrb r7, [r4, #2]
	cmp r0, #0
	beq _080040F8
_080040EC:
	adds r6, #1
	movs r1, #0xa
	bl __divsi3
	cmp r0, #0
	bne _080040EC
_080040F8:
	subs r0, r6, #1
	lsls r0, r0, #3
	adds r0, r7, r0
	strb r0, [r4, #2]
	lsls r7, r6, #3
	cmp r6, #0
	ble _08004132
_08004106:
	adds r0, r5, #0
	movs r1, #0xa
	bl __modsi3
	adds r0, #0x30
	mov r1, sp
	strh r0, [r1]
	adds r0, r5, #0
	movs r1, #0xa
	bl __divsi3
	adds r5, r0, #0
	adds r0, r4, #0
	mov r1, sp
	bl Text_AppendChar
	ldrb r0, [r4, #2]
	subs r0, #0xf
	strb r0, [r4, #2]
	subs r6, #1
	cmp r6, #0
	bne _08004106
_08004132:
	adds r0, r7, #0
	adds r0, #8
	ldrb r1, [r4, #2]
	adds r0, r0, r1
_0800413A:
	strb r0, [r4, #2]
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_START Text_AppendNumberOr2Dashes
Text_AppendNumberOr2Dashes: @ 0x08004144
	push {r4, lr}
	adds r4, r0, #0
	cmp r1, #0xff
	beq _08004154
	movs r0, #1
	negs r0, r0
	cmp r1, r0
	bne _08004174
_08004154:
	movs r1, #8
	negs r1, r1
	adds r0, r4, #0
	bl Text_Advance
	ldr r0, _08004170  @ 0x00000535
	bl GetStringFromIndex
	adds r1, r0, #0
	adds r0, r4, #0
	bl Text_AppendString
	b _0800417A
	.align 2, 0
_08004170: .4byte 0x00000535
_08004174:
	adds r0, r4, #0
	bl Text_AppendDecNumber
_0800417A:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_START Text_AppendChar
Text_AppendChar: @ 0x08004180
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	ldr r0, _0800419C  @ gUnknown_02028E70
	ldr r1, [r0]
	ldrb r1, [r1, #0x16]
	adds r6, r0, #0
	cmp r1, #0
	beq _080041A0
	adds r0, r5, #0
	adds r1, r4, #0
	bl Text_AppendCharSimple
	b _080041E2
	.align 2, 0
_0800419C: .4byte gUnknown_02028E70
_080041A0:
	ldrb r3, [r4]
	adds r4, #1
	ldrb r2, [r4]
	adds r4, #1
_080041A8:
	ldr r0, [r6]
	ldr r1, [r0, #4]
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r1, _080041B8  @ 0xFFFFFF00
	adds r0, r0, r1
	ldr r1, [r0]
	b _080041BE
	.align 2, 0
_080041B8: .4byte 0xFFFFFF00
_080041BC:
	ldr r1, [r1]
_080041BE:
	cmp r1, #0
	bne _080041D0
	movs r3, #0x81
	movs r2, #0xa7
	ldr r6, _080041CC  @ gUnknown_02028E70
	b _080041A8
	.align 2, 0
_080041CC: .4byte gUnknown_02028E70
_080041D0:
	ldrb r0, [r1, #4]
	cmp r0, r3
	bne _080041BC
	ldr r0, [r6]
	ldr r2, [r0, #8]
	adds r0, r5, #0
	bl _call_via_r2
	adds r0, r4, #0
_080041E2:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	THUMB_FUNC_START GetVRAMPointerForTextMaybe
GetVRAMPointerForTextMaybe: @ 0x080041E8
	ldrb r2, [r0, #6]
	ldrb r1, [r0, #4]
	muls r1, r2, r1
	ldrh r2, [r0]
	adds r1, r1, r2
	ldrb r0, [r0, #2]
	lsrs r0, r0, #3
	adds r1, r1, r0
	ldr r0, _08004204  @ gUnknown_02028E70
	ldr r0, [r0]
	lsls r1, r1, #6
	ldr r0, [r0]
	adds r0, r0, r1
	bx lr
	.align 2, 0
_08004204: .4byte gUnknown_02028E70

	THUMB_FUNC_START GetSomeTextDrawingRelatedTablePointer
GetSomeTextDrawingRelatedTablePointer: @ 0x08004208
	ldr r1, _08004214  @ gUnknown_08588240
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	bx lr
	.align 2, 0
_08004214: .4byte gUnknown_08588240

	THUMB_FUNC_START Font_StandardGlyphDrawer
Font_StandardGlyphDrawer: @ 0x08004218
	push {r4, r5, r6, lr}
	mov r6, r9
	mov r5, r8
	push {r5, r6}
	adds r5, r0, #0
	mov r9, r1
	ldr r0, _08004264  @ gUnknown_02028E70
	ldr r0, [r0]
	ldr r1, [r0, #0xc]
	adds r0, r5, #0
	bl _call_via_r1
	mov r8, r0
	ldrb r0, [r5, #2]
	movs r4, #7
	ands r4, r0
	mov r6, r9
	adds r6, #8
	ldrb r0, [r5, #3]
	bl GetSomeTextDrawingRelatedTablePointer
	mov r1, r8
	adds r2, r6, #0
	adds r3, r4, #0
	bl CallARM_Func3
	mov r1, r9
	ldrb r0, [r1, #5]
	ldrb r1, [r5, #2]
	adds r0, r0, r1
	strb r0, [r5, #2]
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08004264: .4byte gUnknown_02028E70

	THUMB_FUNC_START Font_SpecializedGlyphDrawer
Font_SpecializedGlyphDrawer: @ 0x08004268
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x18
	str r0, [sp]
	str r1, [sp, #4]
	ldr r0, _080043A4  @ gUnknown_02028E70
	ldr r0, [r0]
	ldr r1, [r0, #0xc]
	ldr r0, [sp]
	bl _call_via_r1
	str r0, [sp, #0xc]
	ldr r1, [sp]
	ldrb r0, [r1, #2]
	movs r2, #7
	ands r2, r0
	str r2, [sp, #0x10]
	ldr r3, [sp, #4]
	adds r3, #8
	str r3, [sp, #0x14]
	movs r0, #9
	bl GetSomeTextDrawingRelatedTablePointer
	mov sl, r0
	ldr r1, [sp]
	ldrb r0, [r1, #3]
	bl GetSomeTextDrawingRelatedTablePointer
	mov r9, r0
	movs r2, #0xf
	str r2, [sp, #8]
	ldr r7, [sp, #0xc]
	adds r7, #0x40
_080042B0:
	ldr r3, [sp, #0x14]
	ldm r3!, {r0}
	str r3, [sp, #0x14]
	movs r1, #0
	ldr r3, [sp, #0x10]
	lsls r2, r3, #1
	bl sub_80D188C
	movs r6, #0xff
	ands r6, r0
	lsls r6, r6, #1
	mov r3, sl
	adds r2, r6, r3
	ldrh r2, [r2]
	mov r8, r2
	lsls r5, r1, #0x18
	lsrs r4, r0, #8
	adds r2, r5, #0
	orrs r2, r4
	movs r4, #0xff
	ands r4, r2
	lsls r4, r4, #1
	adds r2, r4, r3
	ldrh r2, [r2]
	lsls r2, r2, #0x10
	mov r3, r8
	orrs r3, r2
	ldr r2, [sp, #0xc]
	ldr r5, [r2]
	ands r5, r3
	str r5, [r2]
	add r6, r9
	ldrh r3, [r6]
	add r4, r9
	ldrh r2, [r4]
	lsls r2, r2, #0x10
	orrs r3, r2
	orrs r5, r3
	ldr r3, [sp, #0xc]
	stm r3!, {r5}
	str r3, [sp, #0xc]
	lsls r5, r1, #0x10
	lsrs r4, r0, #0x10
	adds r2, r5, #0
	orrs r2, r4
	movs r6, #0xff
	ands r6, r2
	lsls r6, r6, #1
	mov r3, sl
	adds r2, r6, r3
	ldrh r2, [r2]
	mov r8, r2
	lsls r5, r1, #8
	lsrs r4, r0, #0x18
	adds r2, r5, #0
	orrs r2, r4
	movs r4, #0xff
	ands r4, r2
	lsls r4, r4, #1
	adds r2, r4, r3
	ldrh r2, [r2]
	lsls r2, r2, #0x10
	mov r3, r8
	orrs r3, r2
	ldr r5, [r7]
	ands r5, r3
	add r6, r9
	ldrh r3, [r6]
	add r4, r9
	ldrh r2, [r4]
	lsls r2, r2, #0x10
	orrs r3, r2
	orrs r5, r3
	str r5, [r7]
	adds r2, r1, #0
	movs r4, #0xff
	ands r4, r2
	lsls r4, r4, #1
	mov r3, sl
	adds r2, r4, r3
	ldrh r5, [r2]
	lsrs r2, r1, #8
	movs r1, #0xff
	ands r1, r2
	lsls r1, r1, #1
	mov r2, sl
	adds r0, r1, r2
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	orrs r5, r0
	ldr r3, [r7, #0x40]
	ands r3, r5
	add r4, r9
	ldrh r2, [r4]
	add r1, r9
	ldrh r0, [r1]
	lsls r0, r0, #0x10
	orrs r2, r0
	orrs r3, r2
	str r3, [r7, #0x40]
	adds r7, #4
	ldr r3, [sp, #8]
	subs r3, #1
	str r3, [sp, #8]
	cmp r3, #0
	bge _080042B0
	ldr r1, [sp, #4]
	ldrb r0, [r1, #5]
	ldr r2, [sp]
	ldrb r2, [r2, #2]
	adds r0, r0, r2
	ldr r3, [sp]
	strb r0, [r3, #2]
	add sp, #0x18
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080043A4: .4byte gUnknown_02028E70

	THUMB_FUNC_START Font_LoadForUI
Font_LoadForUI: @ 0x080043A8
	push {r4, lr}
	ldr r0, _080043D8  @ gUnknown_0859EF00
	ldr r4, _080043DC  @ gUnknown_02028E70
	ldr r1, [r4]
	ldrh r1, [r1, #0x14]
	lsls r1, r1, #5
	movs r2, #0x20
	bl CopyToPaletteBuffer
	ldr r1, _080043E0  @ gUnknown_020228A8
	ldr r2, [r4]
	ldrh r0, [r2, #0x14]
	lsls r0, r0, #5
	adds r0, r0, r1
	movs r1, #0
	strh r1, [r0]
	ldr r0, _080043E4  @ Font_StandardGlyphDrawer
	str r0, [r2, #8]
	movs r0, #0
	bl SetFontGlyphSet
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080043D8: .4byte gUnknown_0859EF00
_080043DC: .4byte gUnknown_02028E70
_080043E0: .4byte gUnknown_020228A8
_080043E4: .4byte Font_StandardGlyphDrawer

	THUMB_FUNC_START Font_LoadForDialogue
Font_LoadForDialogue: @ 0x080043E8
	push {r4, lr}
	ldr r0, _08004418  @ gUnknown_0859EF20
	ldr r4, _0800441C  @ gUnknown_02028E70
	ldr r1, [r4]
	ldrh r1, [r1, #0x14]
	lsls r1, r1, #5
	movs r2, #0x20
	bl CopyToPaletteBuffer
	ldr r1, _08004420  @ gUnknown_020228A8
	ldr r2, [r4]
	ldrh r0, [r2, #0x14]
	lsls r0, r0, #5
	adds r0, r0, r1
	movs r1, #0
	strh r1, [r0]
	ldr r0, _08004424  @ Font_StandardGlyphDrawer
	str r0, [r2, #8]
	movs r0, #1
	bl SetFontGlyphSet
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08004418: .4byte gUnknown_0859EF20
_0800441C: .4byte gUnknown_02028E70
_08004420: .4byte gUnknown_020228A8
_08004424: .4byte Font_StandardGlyphDrawer

	THUMB_FUNC_START Font_SetSomeSpecialDrawingRoutine
Font_SetSomeSpecialDrawingRoutine: @ 0x08004428
	ldr r0, _08004434  @ gUnknown_02028E70
	ldr r1, [r0]
	ldr r0, _08004438  @ Font_SpecializedGlyphDrawer
	str r0, [r1, #8]
	bx lr
	.align 2, 0
_08004434: .4byte gUnknown_02028E70
_08004438: .4byte Font_SpecializedGlyphDrawer

	THUMB_FUNC_START DrawTextInline
DrawTextInline: @ 0x0800443C
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r4, r0, #0
	adds r7, r1, #0
	adds r6, r2, #0
	adds r5, r3, #0
	cmp r4, #0
	bne _08004456
	mov r4, sp
	mov r0, sp
	ldr r1, [sp, #0x1c]
	bl Text_Init
_08004456:
	adds r0, r4, #0
	adds r1, r5, #0
	bl Text_SetXCursor
	adds r0, r4, #0
	adds r1, r6, #0
	bl Text_SetColorId
	adds r0, r4, #0
	ldr r1, [sp, #0x20]
	bl Text_AppendString
	adds r0, r4, #0
	adds r1, r7, #0
	bl Text_Draw
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_START Text_InsertString
Text_InsertString: @ 0x08004480
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r2, #0
	adds r6, r3, #0
	bl Text_SetXCursor
	adds r0, r4, #0
	adds r1, r5, #0
	bl Text_SetColorId
	adds r0, r4, #0
	adds r1, r6, #0
	bl Text_AppendString
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_START Text_InsertNumberOr2Dashes
Text_InsertNumberOr2Dashes: @ 0x080044A4
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r2, #0
	adds r6, r3, #0
	bl Text_SetXCursor
	adds r0, r4, #0
	adds r1, r5, #0
	bl Text_SetColorId
	adds r0, r4, #0
	adds r1, r6, #0
	bl Text_AppendNumberOr2Dashes
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_START Text_AppendStringSimple
Text_AppendStringSimple: @ 0x080044C8
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	b _080044F2
_080044D0:
	ldr r0, _08004500  @ gUnknown_02028E70
	ldr r3, [r0]
	ldrb r0, [r4]
	ldr r2, [r3, #4]
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r1, [r0]
	adds r4, #1
	cmp r1, #0
	bne _080044EA
	adds r0, r2, #0
	adds r0, #0xfc
	ldr r1, [r0]
_080044EA:
	ldr r2, [r3, #8]
	adds r0, r5, #0
	bl _call_via_r2
_080044F2:
	ldrb r0, [r4]
	cmp r0, #1
	bhi _080044D0
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08004500: .4byte gUnknown_02028E70

	THUMB_FUNC_START Text_AppendCharSimple
Text_AppendCharSimple: @ 0x08004504
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	ldr r0, _08004534  @ gUnknown_02028E70
	ldr r3, [r0]
	ldrb r0, [r4]
	ldr r2, [r3, #4]
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r1, [r0]
	adds r4, #1
	cmp r1, #0
	bne _08004524
	adds r0, r2, #0
	adds r0, #0xfc
	ldr r1, [r0]
_08004524:
	ldr r2, [r3, #8]
	adds r0, r5, #0
	bl _call_via_r2
	adds r0, r4, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08004534: .4byte gUnknown_02028E70

	THUMB_FUNC_START GetCharTextWidthSimple
GetCharTextWidthSimple: @ 0x08004538
	push {lr}
	adds r2, r0, #0
	adds r3, r1, #0
	ldr r0, _08004564  @ gUnknown_02028E70
	ldr r1, [r0]
	ldrb r0, [r2]
	ldr r1, [r1, #4]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r2, #1
	cmp r0, #0
	bne _08004558
	adds r0, r1, #0
	adds r0, #0xfc
	ldr r0, [r0]
_08004558:
	ldrb r0, [r0, #5]
	str r0, [r3]
	adds r0, r2, #0
	pop {r1}
	bx r1
	.align 2, 0
_08004564: .4byte gUnknown_02028E70

	THUMB_FUNC_START GetStringTextWidthSimple
GetStringTextWidthSimple: @ 0x08004568
	push {lr}
	adds r1, r0, #0
	movs r2, #0
	ldrb r0, [r1]
	cmp r0, #1
	bls _0800458E
	ldr r0, _08004594  @ gUnknown_02028E70
	ldr r0, [r0]
	ldr r3, [r0, #4]
_0800457A:
	ldrb r0, [r1]
	lsls r0, r0, #2
	adds r0, r0, r3
	ldr r0, [r0]
	adds r1, #1
	ldrb r0, [r0, #5]
	adds r2, r2, r0
	ldrb r0, [r1]
	cmp r0, #1
	bhi _0800457A
_0800458E:
	adds r0, r2, #0
	pop {r1}
	bx r1
	.align 2, 0
_08004594: .4byte gUnknown_02028E70

	THUMB_FUNC_START sub_8004598
sub_8004598: @ 0x08004598
	bx lr

	THUMB_FUNC_START InitSomeOtherGraphicsRelatedStruct
InitSomeOtherGraphicsRelatedStruct: @ 0x0800459C
	push {r4, lr}
	adds r4, r0, #0
	str r1, [r4]
	ldr r0, _080045D0  @ sub_80046E0
	str r0, [r4, #0xc]
	movs r0, #0xf
	ands r2, r0
	adds r2, #0x10
	movs r0, #0
	strh r2, [r4, #0x14]
	lsls r1, r1, #0xf
	lsrs r1, r1, #0x14
	strh r1, [r4, #0x10]
	strh r0, [r4, #0x12]
	bl GetSomeByte
	strb r0, [r4, #0x16]
	adds r0, r4, #0
	bl SetFont
	ldr r0, _080045D4  @ sub_8004700
	str r0, [r4, #8]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080045D0: .4byte sub_80046E0
_080045D4: .4byte sub_8004700

	THUMB_FUNC_START Text_Init3
Text_Init3: @ 0x080045D8
	ldr r1, _080045F8  @ gUnknown_02028E70
	ldr r3, [r1]
	ldrh r1, [r3, #0x12]
	movs r2, #0
	strh r1, [r0]
	movs r1, #0x20
	strb r1, [r0, #4]
	strb r2, [r0, #6]
	strb r2, [r0, #5]
	strb r2, [r0, #7]
	ldrh r1, [r3, #0x12]
	adds r1, #0x40
	strh r1, [r3, #0x12]
	strb r2, [r0, #2]
	strb r2, [r0, #3]
	bx lr
	.align 2, 0
_080045F8: .4byte gUnknown_02028E70

	THUMB_FUNC_START sub_80045FC
sub_80045FC: @ 0x080045FC
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r7, r0, #0
	ldrb r0, [r7, #4]
	cmp r0, #0
	beq _08004646
	movs r0, #0
	strb r0, [r7, #2]
	ldr r4, _08004650  @ 0x44444444
	str r4, [sp]
	ldr r5, _08004654  @ gUnknown_02028E70
	ldr r0, [r5]
	ldr r1, [r0, #0xc]
	adds r0, r7, #0
	bl _call_via_r1
	adds r1, r0, #0
	ldr r6, _08004658  @ 0x010000D8
	mov r0, sp
	adds r2, r6, #0
	bl CpuFastSet
	str r4, [sp, #4]
	add r4, sp, #4
	ldr r0, [r5]
	ldr r1, [r0, #0xc]
	adds r0, r7, #0
	bl _call_via_r1
	adds r1, r0, #0
	movs r0, #0x80
	lsls r0, r0, #3
	adds r1, r1, r0
	adds r0, r4, #0
	adds r2, r6, #0
	bl CpuFastSet
_08004646:
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08004650: .4byte 0x44444444
_08004654: .4byte gUnknown_02028E70
_08004658: .4byte 0x010000D8

	THUMB_FUNC_START sub_800465C
sub_800465C: @ 0x0800465C
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r7, r0, #0
	ldrb r0, [r7, #4]
	cmp r0, #0
	beq _080046A4
	movs r4, #0
	strb r4, [r7, #2]
	str r4, [sp]
	ldr r5, _080046AC  @ gUnknown_02028E70
	ldr r0, [r5]
	ldr r1, [r0, #0xc]
	adds r0, r7, #0
	bl _call_via_r1
	adds r1, r0, #0
	ldr r6, _080046B0  @ 0x010000D8
	mov r0, sp
	adds r2, r6, #0
	bl CpuFastSet
	str r4, [sp, #4]
	add r4, sp, #4
	ldr r0, [r5]
	ldr r1, [r0, #0xc]
	adds r0, r7, #0
	bl _call_via_r1
	adds r1, r0, #0
	movs r0, #0x80
	lsls r0, r0, #3
	adds r1, r1, r0
	adds r0, r4, #0
	adds r2, r6, #0
	bl CpuFastSet
_080046A4:
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080046AC: .4byte gUnknown_02028E70
_080046B0: .4byte 0x010000D8

	THUMB_FUNC_START Text_80046B4
Text_80046B4: @ 0x080046B4
	push {lr}
	sub sp, #4
	movs r2, #0
	strb r2, [r0, #2]
	str r1, [sp]
	ldr r1, _080046D8  @ gUnknown_02028E70
	ldr r1, [r1]
	ldr r1, [r1, #0xc]
	bl _call_via_r1
	adds r1, r0, #0
	ldr r2, _080046DC  @ 0x01000200
	mov r0, sp
	bl CpuFastSet
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_080046D8: .4byte gUnknown_02028E70
_080046DC: .4byte 0x01000200

	THUMB_FUNC_START sub_80046E0
sub_80046E0: @ 0x080046E0
	ldrb r2, [r0, #6]
	ldrb r1, [r0, #4]
	muls r1, r2, r1
	ldrh r2, [r0]
	adds r1, r1, r2
	ldrb r0, [r0, #2]
	lsrs r0, r0, #3
	adds r1, r1, r0
	ldr r0, _080046FC  @ gUnknown_02028E70
	ldr r0, [r0]
	lsls r1, r1, #5
	ldr r0, [r0]
	adds r0, r0, r1
	bx lr
	.align 2, 0
_080046FC: .4byte gUnknown_02028E70

	THUMB_FUNC_START sub_8004700
sub_8004700: @ 0x08004700
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	str r0, [sp]
	str r1, [sp, #4]
	ldr r0, _080048AC  @ gUnknown_02028E70
	ldr r0, [r0]
	ldr r1, [r0, #0xc]
	ldr r0, [sp]
	bl _call_via_r1
	adds r7, r0, #0
	ldr r1, [sp]
	ldrb r0, [r1, #2]
	movs r2, #7
	ands r2, r0
	str r2, [sp, #8]
	ldr r3, [sp, #4]
	adds r3, #8
	str r3, [sp, #0xc]
	ldrb r0, [r1, #3]
	bl GetSomeTextDrawingRelatedTablePointer
	mov r8, r0
	movs r0, #0xff
	mov r9, r0
	ldr r1, [sp, #8]
	lsls r1, r1, #1
	str r1, [sp, #0x10]
	movs r2, #7
	mov sl, r2
_08004744:
	ldr r3, [sp, #0xc]
	ldm r3!, {r0}
	str r3, [sp, #0xc]
	movs r1, #0
	ldr r3, [sp, #8]
	lsls r2, r3, #1
	bl sub_80D188C
	adds r6, r1, #0
	adds r5, r0, #0
	mov r0, r9
	ands r0, r5
	lsls r0, r0, #1
	add r0, r8
	ldrh r4, [r0]
	lsls r3, r6, #0x18
	lsrs r2, r5, #8
	adds r0, r3, #0
	orrs r0, r2
	mov r2, r9
	ands r2, r0
	lsls r2, r2, #1
	add r2, r8
	ldrh r0, [r2]
	lsls r0, r0, #0x10
	orrs r4, r0
	ldr r0, [r7]
	orrs r0, r4
	str r0, [r7]
	lsls r3, r6, #0x10
	lsrs r2, r5, #0x10
	adds r0, r3, #0
	orrs r0, r2
	mov r2, r9
	ands r2, r0
	lsls r2, r2, #1
	add r2, r8
	ldrh r4, [r2]
	lsls r3, r6, #8
	lsrs r2, r5, #0x18
	adds r0, r3, #0
	orrs r0, r2
	mov r2, r9
	ands r2, r0
	lsls r2, r2, #1
	add r2, r8
	ldrh r0, [r2]
	lsls r0, r0, #0x10
	orrs r4, r0
	ldr r0, [r7, #0x20]
	orrs r0, r4
	str r0, [r7, #0x20]
	adds r0, r6, #0
	mov r2, r9
	ands r2, r0
	lsls r2, r2, #1
	add r2, r8
	ldrh r3, [r2]
	lsrs r0, r6, #8
	mov r2, r9
	ands r2, r0
	lsls r2, r2, #1
	add r2, r8
	ldrh r0, [r2]
	lsls r0, r0, #0x10
	orrs r3, r0
	ldr r0, [r7, #0x40]
	orrs r0, r3
	str r0, [r7, #0x40]
	adds r7, #4
	movs r0, #1
	negs r0, r0
	add sl, r0
	mov r1, sl
	cmp r1, #0
	bge _08004744
	ldr r0, _080048AC  @ gUnknown_02028E70
	ldr r0, [r0]
	ldr r1, [r0, #0xc]
	ldr r0, [sp]
	bl _call_via_r1
	movs r2, #0x80
	lsls r2, r2, #3
	adds r7, r0, r2
	movs r3, #0xff
	mov r9, r3
	movs r0, #7
	mov sl, r0
_080047F6:
	ldr r2, [sp, #0xc]
	ldm r2!, {r0}
	str r2, [sp, #0xc]
	movs r1, #0
	ldr r2, [sp, #0x10]
	bl sub_80D188C
	adds r6, r1, #0
	adds r5, r0, #0
	mov r0, r9
	ands r0, r5
	lsls r0, r0, #1
	add r0, r8
	ldrh r4, [r0]
	lsls r3, r6, #0x18
	lsrs r2, r5, #8
	adds r0, r3, #0
	orrs r0, r2
	mov r2, r9
	ands r2, r0
	lsls r2, r2, #1
	add r2, r8
	ldrh r0, [r2]
	lsls r0, r0, #0x10
	orrs r4, r0
	ldr r0, [r7]
	orrs r0, r4
	str r0, [r7]
	lsls r3, r6, #0x10
	lsrs r2, r5, #0x10
	adds r0, r3, #0
	orrs r0, r2
	mov r2, r9
	ands r2, r0
	lsls r2, r2, #1
	add r2, r8
	ldrh r4, [r2]
	lsls r3, r6, #8
	lsrs r2, r5, #0x18
	adds r0, r3, #0
	orrs r0, r2
	mov r2, r9
	ands r2, r0
	lsls r2, r2, #1
	add r2, r8
	ldrh r0, [r2]
	lsls r0, r0, #0x10
	orrs r4, r0
	ldr r0, [r7, #0x20]
	orrs r0, r4
	str r0, [r7, #0x20]
	adds r0, r6, #0
	mov r2, r9
	ands r2, r0
	lsls r2, r2, #1
	add r2, r8
	ldrh r3, [r2]
	lsrs r0, r6, #8
	mov r2, r9
	ands r2, r0
	lsls r2, r2, #1
	add r2, r8
	ldrh r0, [r2]
	lsls r0, r0, #0x10
	orrs r3, r0
	ldr r0, [r7, #0x40]
	orrs r0, r3
	str r0, [r7, #0x40]
	adds r7, #4
	movs r3, #1
	negs r3, r3
	add sl, r3
	mov r0, sl
	cmp r0, #0
	bge _080047F6
	ldr r1, [sp, #4]
	ldrb r0, [r1, #5]
	ldr r2, [sp]
	ldrb r2, [r2, #2]
	adds r0, r0, r2
	ldr r3, [sp]
	strb r0, [r3, #2]
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080048AC: .4byte gUnknown_02028E70

	THUMB_FUNC_START sub_80048B0
sub_80048B0: @ 0x080048B0
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x35
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	cmp r0, #0
	bgt _0800491E
	adds r0, r4, #0
	adds r0, #0x34
	ldrb r0, [r0]
	strb r0, [r1]
	movs r5, #0
	adds r0, r4, #0
	adds r0, #0x36
	movs r1, #0
	ldrsb r1, [r0, r1]
	adds r6, r0, #0
	cmp r5, r1
	bge _0800491E
_080048DC:
	ldr r0, [r4, #0x30]
	ldrb r2, [r0]
	adds r1, r0, #0
	cmp r2, #0
	blt _0800490C
	cmp r2, #1
	ble _080048F0
	cmp r2, #4
	beq _080048FE
	b _0800490C
_080048F0:
	ldr r1, [r4, #0x2c]
	movs r0, #0
	strb r0, [r1, #7]
	adds r0, r4, #0
	bl Proc_ClearNativeCallback
	b _0800491E
_080048FE:
	adds r0, r1, #1
	str r0, [r4, #0x30]
	ldr r0, [r4, #0x2c]
	movs r1, #6
	bl Text_Advance
	b _08004914
_0800490C:
	ldr r0, [r4, #0x2c]
	bl Text_AppendChar
	str r0, [r4, #0x30]
_08004914:
	adds r5, #1
	movs r0, #0
	ldrsb r0, [r6, r0]
	cmp r5, r0
	blt _080048DC
_0800491E:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_START sub_8004924
sub_8004924: @ 0x08004924
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	adds r7, r2, #0
	adds r4, r3, #0
	cmp r7, #0
	bne _08004936
	bl Text_AppendString
_08004936:
	cmp r4, #0
	bne _0800493C
	movs r4, #1
_0800493C:
	ldr r0, _08004968  @ gUnknown_08588274
	movs r1, #3
	bl Proc_Create
	adds r2, r0, #0
	str r5, [r2, #0x2c]
	str r6, [r2, #0x30]
	adds r0, #0x36
	movs r1, #0
	strb r4, [r0]
	subs r0, #2
	strb r7, [r0]
	adds r0, #1
	strb r1, [r0]
	movs r0, #1
	strb r0, [r5, #7]
	adds r0, r6, #0
	bl String_GetEnd
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08004968: .4byte gUnknown_08588274

	THUMB_FUNC_START sub_800496C
sub_800496C: @ 0x0800496C
	ldrb r0, [r0, #7]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bx lr

	THUMB_FUNC_START sub_8004974
sub_8004974: @ 0x08004974
	push {lr}
	ldr r0, _08004980  @ gUnknown_08588274
	bl Proc_DeleteAllWithScript
	pop {r0}
	bx r0
	.align 2, 0
_08004980: .4byte gUnknown_08588274

	THUMB_FUNC_START sub_8004984
sub_8004984: @ 0x08004984
	push {lr}
	bl sub_8000D28
	lsrs r0, r0, #2
	movs r1, #0xf
	ands r0, r1
	ldr r2, _080049A4  @ gUnknown_020228A8
	lsls r0, r0, #1
	ldr r1, _080049A8  @ gUnknown_0859EFC0
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r2, #0x1c]
	bl EnablePaletteSync
	pop {r0}
	bx r0
	.align 2, 0
_080049A4: .4byte gUnknown_020228A8
_080049A8: .4byte gUnknown_0859EFC0

	THUMB_FUNC_START NewGreenTextColorManager
NewGreenTextColorManager: @ 0x080049AC
	push {lr}
	adds r1, r0, #0
	cmp r1, #0
	beq _080049C0
	ldr r0, _080049BC  @ gUnknown_08588284
	bl Proc_Create
	b _080049C8
	.align 2, 0
_080049BC: .4byte gUnknown_08588284
_080049C0:
	ldr r0, _080049CC  @ gUnknown_08588284
	movs r1, #3
	bl Proc_Create
_080049C8:
	pop {r0}
	bx r0
	.align 2, 0
_080049CC: .4byte gUnknown_08588284

	THUMB_FUNC_START EndGreenTextColorManager
EndGreenTextColorManager: @ 0x080049D0
	push {lr}
	ldr r0, _080049DC  @ gUnknown_08588284
	bl Proc_DeleteAllWithScript
	pop {r0}
	bx r0
	.align 2, 0
_080049DC: .4byte gUnknown_08588284

	THUMB_FUNC_START sub_80049E0
sub_80049E0: @ 0x080049E0
	push {r4, r5, lr}
	adds r4, r0, #0
	mov ip, r1
	adds r5, r2, #0
	ldr r0, _08004A00  @ gUnknown_02028E70
	ldr r1, [r0]
	ldrb r0, [r4, #6]
	ldrb r2, [r4, #4]
	muls r0, r2, r0
	ldrh r3, [r4]
	adds r0, r0, r3
	lsls r0, r0, #1
	ldrh r1, [r1, #0x10]
	adds r1, r0, r1
	movs r3, #0
	b _08004A16
	.align 2, 0
_08004A00: .4byte gUnknown_02028E70
_08004A04:
	mov r0, ip
	strh r1, [r0]
	adds r1, #1
	adds r0, #0x40
	strh r1, [r0]
	adds r1, #1
	movs r0, #2
	add ip, r0
	adds r3, #1
_08004A16:
	cmp r3, r2
	bge _08004A1E
	cmp r3, r5
	blt _08004A04
_08004A1E:
	movs r0, #5
	ldrsb r0, [r4, r0]
	cmp r0, #0
	beq _08004A2E
	ldrb r0, [r4, #6]
	movs r1, #1
	eors r0, r1
	strb r0, [r4, #6]
_08004A2E:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_START sub_8004A34
sub_8004A34: @ 0x08004A34
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r3, _08004A8C  @ gUnknown_02028E70
	ldr r3, [r3]
	lsls r0, r0, #6
	ldr r3, [r3]
	adds r3, r3, r0
	mov r8, r3
	adds r7, r2, #0
	adds r7, #8
	adds r0, r1, #0
	bl GetSomeTextDrawingRelatedTablePointer
	adds r2, r0, #0
	movs r6, #0xff
	movs r3, #0xf
_08004A56:
	ldm r7!, {r0}
	adds r1, r0, #0
	ands r1, r6
	lsls r1, r1, #1
	adds r1, r1, r2
	ldrh r4, [r1]
	lsrs r0, r0, #8
	ands r0, r6
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r5, [r0]
	lsls r0, r5, #0x10
	adds r0, r0, r4
	mov r1, r8
	adds r1, #4
	mov r8, r1
	subs r1, #4
	stm r1!, {r0}
	subs r3, #1
	cmp r3, #0
	bge _08004A56
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08004A8C: .4byte gUnknown_02028E70

	THUMB_FUNC_START sub_8004A90
sub_8004A90: @ 0x08004A90
	push {r4, r5, lr}
	adds r5, r0, #0
	strb r1, [r5]
	strb r2, [r5, #1]
	ldr r0, _08004AC4  @ gUnknown_02028E70
	ldr r3, [r0]
	ldrh r4, [r3, #0x12]
	adds r0, r4, #1
	strh r0, [r3, #0x12]
	strh r4, [r5, #2]
	movs r0, #0xff
	strb r0, [r5, #4]
	movs r3, #2
	ldrsh r0, [r5, r3]
	ldr r3, _08004AC8  @ gUnknown_08590B44
	lsls r2, r2, #2
	adds r2, r2, r3
	ldr r2, [r2]
	bl sub_8004A34
	movs r1, #2
	ldrsh r0, [r5, r1]
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08004AC4: .4byte gUnknown_02028E70
_08004AC8: .4byte gUnknown_08590B44

	THUMB_FUNC_START sub_8004ACC
sub_8004ACC: @ 0x08004ACC
	push {lr}
	adds r3, r0, #0
	adds r2, r1, #0
	ldr r1, _08004AE8  @ gUnknown_02028E78
_08004AD4:
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bge _08004AEC
	adds r0, r1, #0
	adds r1, r3, #0
	bl sub_8004A90
	b _08004B06
	.align 2, 0
_08004AE8: .4byte gUnknown_02028E78
_08004AEC:
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, r3
	bne _08004B02
	movs r0, #1
	ldrsb r0, [r1, r0]
	cmp r0, r2
	bne _08004B02
	movs r2, #2
	ldrsh r0, [r1, r2]
	b _08004B06
_08004B02:
	adds r1, #4
	b _08004AD4
_08004B06:
	pop {r1}
	bx r1

	THUMB_FUNC_START sub_8004B0C
sub_8004B0C: @ 0x08004B0C
	push {r4, lr}
	adds r4, r0, #0
	adds r0, r1, #0
	adds r1, r2, #0
	cmp r1, #0xff
	bne _08004B24
	movs r1, #0
	strh r1, [r4]
	adds r0, r4, #0
	adds r0, #0x40
	strh r1, [r0]
	b _08004B3C
_08004B24:
	bl sub_8004ACC
	ldr r1, _08004B44  @ gUnknown_02028E70
	ldr r1, [r1]
	lsls r0, r0, #1
	ldrh r1, [r1, #0x10]
	adds r0, r0, r1
	strh r0, [r4]
	adds r1, r4, #0
	adds r1, #0x40
	adds r0, #1
	strh r0, [r1]
_08004B3C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08004B44: .4byte gUnknown_02028E70

	THUMB_FUNC_START sub_8004B48
sub_8004B48: @ 0x08004B48
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r7, r1, #0
	adds r4, r2, #0
	adds r6, r3, #0
	cmp r4, #0
	bne _08004B5E
	adds r2, r6, #0
	bl sub_8004B0C
	b _08004B82
_08004B5E:
	adds r0, r4, #0
	movs r1, #0xa
	bl __modsi3
	adds r2, r0, #0
	adds r2, r2, r6
	adds r0, r5, #0
	adds r1, r7, #0
	bl sub_8004B0C
	adds r0, r4, #0
	movs r1, #0xa
	bl __divsi3
	adds r4, r0, #0
	subs r5, #2
	cmp r4, #0
	bne _08004B5E
_08004B82:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_START sub_8004B88
sub_8004B88: @ 0x08004B88
	push {lr}
	movs r3, #0
	bl sub_8004B48
	pop {r0}
	bx r0

	THUMB_FUNC_START DrawDecNumber
DrawDecNumber: @ 0x08004B94
	push {lr}
	cmp r2, #0
	blt _08004B9E
	cmp r2, #0xff
	bne _08004BAA
_08004B9E:
	subs r0, #2
	movs r2, #0x14
	movs r3, #0x14
	bl sub_8004D5C
	b _08004BAE
_08004BAA:
	bl sub_8004B88
_08004BAE:
	pop {r0}
	bx r0

	THUMB_FUNC_START sub_8004BB4
sub_8004BB4: @ 0x08004BB4
	push {lr}
	cmp r2, #0x64
	bne _08004BC6
	subs r0, #2
	movs r2, #0x28
	movs r3, #0x29
	bl sub_8004D5C
	b _08004BDE
_08004BC6:
	cmp r2, #0
	blt _08004BCE
	cmp r2, #0xff
	bne _08004BDA
_08004BCE:
	subs r0, #2
	movs r2, #0x14
	movs r3, #0x14
	bl sub_8004D5C
	b _08004BDE
_08004BDA:
	bl sub_8004B88
_08004BDE:
	pop {r0}
	bx r0

	THUMB_FUNC_START sub_8004BE4
sub_8004BE4: @ 0x08004BE4
	push {lr}
	movs r3, #0xa
	bl sub_8004B48
	pop {r0}
	bx r0

	THUMB_FUNC_START sub_8004BF0
sub_8004BF0: @ 0x08004BF0
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	cmp r5, #0
	beq _08004C14
	adds r0, r4, #0
	movs r1, #4
	movs r2, #0x15
	bl sub_8004B0C
	adds r0, r4, #2
	cmp r5, #9
	ble _08004C0C
	adds r0, r4, #4
_08004C0C:
	movs r1, #4
	adds r2, r5, #0
	bl sub_8004BE4
_08004C14:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_START sub_8004C1C
sub_8004C1C: @ 0x08004C1C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	bl sub_8000D28
	adds r5, r0, #0
	movs r0, #0
	ldr r1, _08004C64  @ gUnknown_02022CA8
	mov r8, r1
_08004C2E:
	adds r7, r0, #1
	lsls r4, r0, #7
	movs r6, #0x1d
_08004C34:
	mov r1, r8
	adds r0, r4, r1
	movs r2, #1
	ands r2, r5
	adds r5, #1
	movs r1, #0
	bl sub_8004B0C
	adds r4, #2
	subs r6, #1
	cmp r6, #0
	bge _08004C34
	adds r0, r7, #0
	cmp r0, #9
	ble _08004C2E
	movs r0, #1
	bl BG_EnableSyncByMask
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08004C64: .4byte gUnknown_02022CA8

	THUMB_FUNC_START sub_8004C68
sub_8004C68: @ 0x08004C68
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	adds r7, r0, #0
	adds r6, r1, #0
	adds r0, r2, #0
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	mov sl, r3
	mov r4, sp
	adds r4, #2
	add r1, sp, #4
	mov r8, r1
	mov r1, sp
	adds r2, r4, #0
	mov r3, r8
	bl sub_8000D64
	mov r1, sp
	strb r0, [r1, #8]
	lsls r0, r0, #0x18
	str r0, [sp, #0xc]
	lsrs r0, r0, #0x18
	mov r9, r0
	adds r0, r7, #4
	ldrh r2, [r1]
	adds r1, r6, #0
	bl sub_8004B88
	ldrh r5, [r4]
	adds r4, r7, #0
	adds r4, #0xa
	adds r0, r5, #0
	movs r1, #0xa
	bl __modsi3
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r6, #0
	bl sub_8004B0C
	subs r4, #2
	adds r0, r5, #0
	movs r1, #0xa
	bl __divsi3
	movs r1, #0xa
	bl __modsi3
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r6, #0
	bl sub_8004B0C
	mov r1, r8
	ldrh r5, [r1]
	adds r4, #8
	adds r0, r5, #0
	movs r1, #0xa
	bl __modsi3
	adds r2, r0, #0
	adds r2, #0xa
	adds r0, r4, #0
	adds r1, r6, #0
	bl sub_8004B0C
	subs r4, #2
	adds r0, r5, #0
	movs r1, #0xa
	bl __divsi3
	movs r1, #0xa
	bl __modsi3
	adds r2, r0, #0
	adds r2, #0xa
	adds r0, r4, #0
	adds r1, r6, #0
	bl sub_8004B0C
	mov r0, r9
	cmp r0, #0
	beq _08004D1C
	mov r1, sl
	cmp r1, #0
	beq _08004D34
_08004D1C:
	adds r0, r7, #6
	adds r1, r6, #0
	movs r2, #0x20
	bl sub_8004B0C
	adds r0, r7, #0
	adds r0, #0xc
	adds r1, r6, #0
	movs r2, #0x20
	bl sub_8004B0C
	b _08004D4A
_08004D34:
	adds r0, r7, #6
	adds r1, r6, #0
	movs r2, #0xff
	bl sub_8004B0C
	adds r0, r7, #0
	adds r0, #0xc
	adds r1, r6, #0
	movs r2, #0xff
	bl sub_8004B0C
_08004D4A:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_START sub_8004D5C
sub_8004D5C: @ 0x08004D5C
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r3, #0
	adds r4, #2
	bl sub_8004B0C
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r6, #0
	bl sub_8004B0C
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_START sub_8004D7C
sub_8004D7C: @ 0x08004D7C
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r6, r1, #0
	adds r5, r2, #0
	adds r0, r5, #0
	movs r1, #0xa
	bl __modsi3
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r6, #0
	bl sub_8004B0C
	subs r4, #2
	adds r0, r5, #0
	movs r1, #0xa
	bl __divsi3
	movs r1, #0xa
	bl __modsi3
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r6, #0
	bl sub_8004B0C
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_START sub_8004DB8
sub_8004DB8: @ 0x08004DB8
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r6, r1, #0
	adds r5, r2, #0
	adds r0, r5, #0
	movs r1, #0xa
	bl __modsi3
	adds r2, r0, #0
	adds r2, #0xa
	adds r0, r4, #0
	adds r1, r6, #0
	bl sub_8004B0C
	subs r4, #2
	adds r0, r5, #0
	movs r1, #0xa
	bl __divsi3
	movs r1, #0xa
	bl __modsi3
	adds r2, r0, #0
	adds r2, #0xa
	adds r0, r4, #0
	adds r1, r6, #0
	bl sub_8004B0C
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_START sub_8004DF8
sub_8004DF8: @ 0x08004DF8
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r4, r0, #0
	mov r8, r1
	adds r5, r2, #0
	adds r6, r3, #0
	adds r0, r5, #0
	movs r1, #0xa
	bl __modsi3
	adds r2, r0, #0
	adds r2, r2, r6
	adds r0, r4, #0
	mov r1, r8
	bl sub_8004B0C
	subs r4, #2
	adds r0, r5, #0
	movs r1, #0xa
	bl __divsi3
	movs r1, #0xa
	bl __modsi3
	adds r2, r0, #0
	adds r2, r2, r6
	adds r0, r4, #0
	mov r1, r8
	bl sub_8004B0C
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
