	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	THUMB_FUNC_START CanPrepScreenSave
CanPrepScreenSave: @ 0x08094FF4
	push {lr}
	ldr r0, _08095014  @ gPlaySt
	movs r2, #0xe
	ldrsb r2, [r0, r2]
	ldr r0, _08095018  @ gGMData
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _0809501C
	adds r0, r2, #0
	subs r0, #0x24
	cmp r0, #0x13
	bhi _0809501C
	movs r0, #0
	b _0809501E
	.align 2, 0
_08095014: .4byte gPlaySt
_08095018: .4byte gGMData
_0809501C:
	movs r0, #1
_0809501E:
	pop {r1}
	bx r1

	THUMB_FUNC_END CanPrepScreenSave

	THUMB_FUNC_START sub_8095024
sub_8095024: @ 0x08095024
	push {r4, lr}
	bl GetActivePrepMenuItemIndex
	adds r4, r0, #0
	bl CheckInLinkArena
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08095048
	ldr r0, _08095044  @ gUnknown_08A18200
	lsls r1, r4, #1
	adds r1, r1, r4
	lsls r1, r1, #2
	adds r0, #8
	b _08095086
	.align 2, 0
_08095044: .4byte gUnknown_08A18200
_08095048:
	cmp r4, #4
	bne _08095064
	movs r0, #2
	bl sub_80A095C
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0809507C
	ldr r0, _08095060  @ gUnknown_08A18200
	ldr r0, [r0, #0x30]
	b _0809508A
	.align 2, 0
_08095060: .4byte gUnknown_08A18200
_08095064:
	cmp r4, #2
	bne _0809507C
	bl CanPrepScreenSave
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0809507C
	ldr r0, _08095078  @ gUnknown_08A18200
	ldr r0, [r0, #0x18]
	b _0809508A
	.align 2, 0
_08095078: .4byte gUnknown_08A18200
_0809507C:
	ldr r0, _08095090  @ gUnknown_08A18200
	lsls r1, r4, #1
	adds r1, r1, r4
	lsls r1, r1, #2
	adds r0, #4
_08095086:
	adds r1, r1, r0
	ldr r0, [r1]
_0809508A:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08095090: .4byte gUnknown_08A18200

	THUMB_FUNC_END sub_8095024

	THUMB_FUNC_START sub_8095094
sub_8095094: @ 0x08095094
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r3, #0
	movs r2, #0
	movs r5, #1
_0809509E:
	adds r0, r1, #0
	asrs r0, r2
	ands r0, r5
	cmp r0, #0
	beq _080950B2
	cmp r4, r3
	bne _080950B0
	adds r0, r2, #0
	b _080950BC
_080950B0:
	adds r3, #1
_080950B2:
	adds r2, #1
	cmp r2, #3
	ble _0809509E
	movs r0, #1
	negs r0, r0
_080950BC:
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8095094

	THUMB_FUNC_START sub_80950C4
sub_80950C4: @ 0x080950C4
	push {r4, lr}
	adds r3, r0, #0
	movs r2, #0
	movs r1, #0
	movs r4, #1
_080950CE:
	adds r0, r3, #0
	asrs r0, r1
	ands r0, r4
	cmp r0, #0
	beq _080950DA
	adds r2, #1
_080950DA:
	adds r1, #1
	cmp r1, #3
	ble _080950CE
	adds r0, r2, #0
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80950C4

	THUMB_FUNC_START sub_80950E8
sub_80950E8: @ 0x080950E8
	push {r4, r5, r6, lr}
	sub sp, #0x10
	adds r2, r0, #0
	adds r4, r1, #0
	mov r1, sp
	ldr r0, _0809512C  @ gUnknown_08205BB0
	ldm r0!, {r3, r5, r6}
	stm r1!, {r3, r5, r6}
	ldr r0, [r0]
	str r0, [r1]
	ldr r0, _08095130  @ Img_PrepWindow
	movs r1, #0xc0
	lsls r1, r1, #0x13
	adds r2, r2, r1
	adds r1, r2, #0
	bl Decompress
	ldr r0, _08095134  @ gPlaySt
	adds r0, #0x41
	ldrb r1, [r0]
	movs r0, #0xc
	ands r0, r1
	add r0, sp
	ldr r0, [r0]
	lsls r4, r4, #5
	adds r1, r4, #0
	movs r2, #0x20
	bl CopyToPaletteBuffer
	add sp, #0x10
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0809512C: .4byte gUnknown_08205BB0
_08095130: .4byte Img_PrepWindow
_08095134: .4byte gPlaySt

	THUMB_FUNC_END sub_80950E8

	THUMB_FUNC_START sub_8095138
sub_8095138: @ 0x08095138
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	mov r8, r0
	adds r7, r1, #0
	mov r9, r2
	mov sl, r3
	ldr r1, _080951AC  @ gUnknown_08A1A41C
	lsls r0, r2, #0xf
	lsrs r0, r0, #0x14
	movs r3, #0x80
	lsls r3, r3, #5
	adds r2, r3, #0
	adds r0, r0, r2
	lsls r6, r0, #0x10
	lsrs r2, r6, #0x10
	mov r0, r8
	bl CallARM_FillTileRect
	movs r5, #0
	cmp r5, r7
	bge _08095182
	mov r4, r8
	adds r4, #0x40
	adds r5, r7, #0
_0809516E:
	adds r0, r4, #0
	ldr r1, _080951B0  @ gUnknown_08A1A434
	lsrs r2, r6, #0x10
	bl CallARM_FillTileRect
	adds r4, #0x80
	subs r5, #1
	cmp r5, #0
	bne _0809516E
	adds r5, r7, #0
_08095182:
	lsls r0, r5, #7
	add r0, r8
	adds r0, #0x40
	ldr r1, _080951B4  @ gUnknown_08A1A474
	mov r4, sl
	lsls r2, r4, #0xc
	mov r4, r9
	lsls r3, r4, #0xf
	lsrs r3, r3, #0x14
	adds r2, r2, r3
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	bl CallARM_FillTileRect
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080951AC: .4byte gUnknown_08A1A41C
_080951B0: .4byte gUnknown_08A1A434
_080951B4: .4byte gUnknown_08A1A474

	THUMB_FUNC_END sub_8095138

.align 2, 0
