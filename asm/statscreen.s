	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	@ The Stat Screen

	THUMB_FUNC_START sub_8089060
sub_8089060: @ 0x08089060
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x50
	movs r1, #0
	strh r1, [r0]
	ldr r0, [r4, #0x2c]
	ldr r1, [r0, #0x14]
	cmp r1, #0
	beq _08089078
	adds r0, r4, #0
	bl _call_via_r1
_08089078:
	ldr r0, [r4, #0x2c]
	movs r1, #0
	bl sub_8088E9C
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_START sub_8089088
sub_8089088: @ 0x08089088
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	movs r4, #0
	ldr r1, _08089120  @ gUnknown_0203E788
	movs r2, #0
	ldrsh r0, [r1, r2]
	ldr r2, [r5, #0x2c]
	lsls r0, r0, #3
	ldrb r3, [r2, #0x10]
	adds r0, r0, r3
	movs r3, #2
	ldrsh r1, [r1, r3]
	lsls r1, r1, #3
	ldrb r2, [r2, #0x11]
	adds r1, r1, r2
	bl DisplayUiHand
	ldr r6, _08089124  @ gKeyStatusPtr
	ldr r0, [r6]
	ldrh r1, [r0, #6]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _080890C2
	adds r0, r5, #0
	bl sub_8089354
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
_080890C2:
	ldr r0, [r6]
	ldrh r1, [r0, #6]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _080890DA
	adds r0, r5, #0
	bl sub_8089384
	orrs r4, r0
	lsls r0, r4, #0x18
	lsrs r4, r0, #0x18
_080890DA:
	ldr r0, [r6]
	ldrh r1, [r0, #6]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _080890F2
	adds r0, r5, #0
	bl sub_80893B4
	orrs r4, r0
	lsls r0, r4, #0x18
	lsrs r4, r0, #0x18
_080890F2:
	ldr r0, [r6]
	ldrh r1, [r0, #6]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _0808910A
	adds r0, r5, #0
	bl sub_80893E4
	orrs r4, r0
	lsls r0, r4, #0x18
	lsrs r4, r0, #0x18
_0808910A:
	ldr r0, [r6]
	ldrh r1, [r0, #8]
	movs r0, #0x81
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08089128
	adds r0, r5, #0
	bl Proc_ClearNativeCallback
	b _08089146
	.align 2, 0
_08089120: .4byte gUnknown_0203E788
_08089124: .4byte gKeyStatusPtr
_08089128:
	cmp r4, #0
	beq _08089146
	ldr r0, _0808914C  @ gUnknown_0202BCF0
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0808913E
	movs r0, #0x67
	bl m4aSongNumStart
_0808913E:
	adds r0, r5, #0
	movs r1, #0
	bl Proc_GotoLabel
_08089146:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0808914C: .4byte gUnknown_0202BCF0

	THUMB_FUNC_START sub_8089150
sub_8089150: @ 0x08089150
	push {r4, lr}
	adds r4, r0, #0
	bl sub_8089018
	adds r0, r4, #0
	bl Proc_Delete
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_START Create6CRText
Create6CRText: @ 0x08089164
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08089180  @ gUnknown_08A00AD0
	bl Proc_CreateBlockingChild
	ldr r2, _08089184  @ gUnknown_0203E788
	movs r1, #0
	strh r1, [r2]
	strh r1, [r2, #2]
	str r4, [r0, #0x2c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08089180: .4byte gUnknown_08A00AD0
_08089184: .4byte gUnknown_0203E788

	THUMB_FUNC_START sub_8089188
sub_8089188: @ 0x08089188
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r4, r2, #0
	adds r5, r3, #0
	ldr r0, _080891A4  @ gUnknown_08A00AD0
	bl Proc_CreateBlockingChild
	ldr r1, _080891A8  @ gUnknown_0203E788
	strh r4, [r1]
	strh r5, [r1, #2]
	str r6, [r0, #0x2c]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080891A4: .4byte gUnknown_08A00AD0
_080891A8: .4byte gUnknown_0203E788

	THUMB_FUNC_START sub_80891AC
sub_80891AC: @ 0x080891AC
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	adds r4, #0xf
	movs r0, #0xf0
	ands r4, r0
	adds r0, r6, #0
	adds r0, #0x4e
	ldrh r0, [r0]
	bl sub_80892D0
	cmp r0, #2
	beq _080891F4
	cmp r0, #2
	bgt _080891D2
	cmp r0, #1
	beq _080891D8
	b _08089200
_080891D2:
	cmp r0, #3
	beq _080891FC
	b _08089200
_080891D8:
	cmp r4, #0x8f
	bgt _080891DE
	movs r4, #0x90
_080891DE:
	adds r0, r6, #0
	adds r0, #0x4c
	ldrh r0, [r0]
	bl GetStringFromIndex
	bl GetStringTextWidth
	cmp r0, #8
	ble _080891FE
	adds r5, #0x20
	b _08089200
_080891F4:
	cmp r4, #0x5f
	bgt _080891FE
	movs r4, #0x60
	b _080891FE
_080891FC:
	movs r4, #0x80
_080891FE:
	adds r5, #0x10
_08089200:
	adds r0, r6, #0
	adds r0, #0x44
	strh r4, [r0]
	adds r0, #2
	strh r5, [r0]
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_START sub_8089210
sub_8089210: @ 0x08089210
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	adds r4, r1, #0
	adds r7, r2, #0
	adds r0, #0x44
	movs r1, #0
	ldrsh r0, [r0, r1]
	adds r6, r0, #0
	adds r6, #0x10
	adds r0, r5, #0
	adds r0, #0x46
	movs r2, #0
	ldrsh r0, [r0, r2]
	adds r0, #0x10
	mov r8, r0
	ldr r1, _08089298  @ gUnknown_0203E788
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #3
	adds r4, r4, r0
	movs r2, #2
	ldrsh r0, [r1, r2]
	lsls r0, r0, #3
	adds r7, r7, r0
	adds r0, r6, #0
	movs r1, #6
	bl __divsi3
	adds r0, #0x10
	subs r4, r4, r0
	strh r4, [r5, #0x3c]
	lsls r4, r4, #0x10
	cmp r4, #0
	bge _0808925C
	movs r0, #0
	strh r0, [r5, #0x3c]
_0808925C:
	movs r1, #0x3c
	ldrsh r0, [r5, r1]
	adds r0, r0, r6
	cmp r0, #0xf0
	ble _0808926C
	movs r0, #0xf0
	subs r0, r0, r6
	strh r0, [r5, #0x3c]
_0808926C:
	adds r0, r7, #0
	adds r0, #0x10
	strh r0, [r5, #0x3e]
	movs r2, #0x3e
	ldrsh r0, [r5, r2]
	add r0, r8
	cmp r0, #0xa0
	ble _08089282
	mov r1, r8
	subs r0, r7, r1
	strh r0, [r5, #0x3e]
_08089282:
	ldrh r0, [r5, #0x3c]
	adds r0, #8
	strh r0, [r5, #0x3c]
	ldrh r0, [r5, #0x3e]
	adds r0, #8
	strh r0, [r5, #0x3e]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08089298: .4byte gUnknown_0203E788

	THUMB_FUNC_START sub_808929C
sub_808929C: @ 0x0808929C
	push {r4, r5, lr}
	ldr r4, _080892BC  @ gUnknown_0203E788
	movs r5, #0
	ldrsh r3, [r4, r5]
	lsls r3, r3, #3
	adds r1, r1, r3
	movs r5, #2
	ldrsh r3, [r4, r5]
	lsls r3, r3, #3
	adds r2, r2, r3
	strh r1, [r0, #0x38]
	strh r2, [r0, #0x3a]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080892BC: .4byte gUnknown_0203E788

	THUMB_FUNC_START sub_80892C0
sub_80892C0: @ 0x080892C0
	adds r2, r0, #0
	adds r2, #0x40
	movs r1, #0x20
	strh r1, [r2]
	adds r0, #0x42
	movs r1, #0x10
	strh r1, [r0]
	bx lr

	THUMB_FUNC_START sub_80892D0
sub_80892D0: @ 0x080892D0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080892E0  @ 0x0000FFFE
	cmp r4, r0
	bne _080892E4
	movs r0, #3
	b _0808931A
	.align 2, 0
_080892E0: .4byte 0x0000FFFE
_080892E4:
	adds r0, r4, #0
	bl GetItemAttributes
	movs r1, #0x80
	lsls r1, r1, #3
	ands r1, r0
	cmp r1, #0
	bne _08089314
	adds r0, r4, #0
	bl GetItemAttributes
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	beq _08089306
	movs r0, #1
	b _0808931A
_08089306:
	adds r0, r4, #0
	bl GetItemAttributes
	movs r1, #4
	ands r1, r0
	cmp r1, #0
	bne _08089318
_08089314:
	movs r0, #0
	b _0808931A
_08089318:
	movs r0, #2
_0808931A:
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_START sub_8089320
sub_8089320: @ 0x08089320
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x2c]
	ldrh r5, [r0, #0x12]
	adds r0, r4, #0
	adds r0, #0x4e
	strh r5, [r0]
	ldrh r0, [r0]
	bl sub_80892D0
	cmp r0, #3
	bne _08089340
	adds r1, r4, #0
	adds r1, #0x4c
	movs r0, #0
	b _0808934A
_08089340:
	adds r0, r5, #0
	bl GetItemDescId
	adds r1, r4, #0
	adds r1, #0x4c
_0808934A:
	strh r0, [r1]
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_START sub_8089354
sub_8089354: @ 0x08089354
	push {lr}
	adds r2, r0, #0
	ldr r0, [r2, #0x2c]
	ldr r0, [r0]
	cmp r0, #0
	bne _08089364
	movs r0, #0
	b _0808937E
_08089364:
	str r0, [r2, #0x2c]
	adds r0, r2, #0
	adds r0, #0x50
	movs r1, #0x40
	strh r1, [r0]
	ldr r0, [r2, #0x2c]
	ldr r1, [r0, #0x14]
	cmp r1, #0
	beq _0808937C
	adds r0, r2, #0
	bl _call_via_r1
_0808937C:
	movs r0, #1
_0808937E:
	pop {r1}
	bx r1

	THUMB_FUNC_START sub_8089384
sub_8089384: @ 0x08089384
	push {lr}
	adds r2, r0, #0
	ldr r0, [r2, #0x2c]
	ldr r0, [r0, #4]
	cmp r0, #0
	bne _08089394
	movs r0, #0
	b _080893AE
_08089394:
	str r0, [r2, #0x2c]
	adds r0, r2, #0
	adds r0, #0x50
	movs r1, #0x80
	strh r1, [r0]
	ldr r0, [r2, #0x2c]
	ldr r1, [r0, #0x14]
	cmp r1, #0
	beq _080893AC
	adds r0, r2, #0
	bl _call_via_r1
_080893AC:
	movs r0, #1
_080893AE:
	pop {r1}
	bx r1

	THUMB_FUNC_START sub_80893B4
sub_80893B4: @ 0x080893B4
	push {lr}
	adds r2, r0, #0
	ldr r0, [r2, #0x2c]
	ldr r0, [r0, #8]
	cmp r0, #0
	bne _080893C4
	movs r0, #0
	b _080893DE
_080893C4:
	str r0, [r2, #0x2c]
	adds r0, r2, #0
	adds r0, #0x50
	movs r1, #0x20
	strh r1, [r0]
	ldr r0, [r2, #0x2c]
	ldr r1, [r0, #0x14]
	cmp r1, #0
	beq _080893DC
	adds r0, r2, #0
	bl _call_via_r1
_080893DC:
	movs r0, #1
_080893DE:
	pop {r1}
	bx r1

	THUMB_FUNC_START sub_80893E4
sub_80893E4: @ 0x080893E4
	push {lr}
	adds r2, r0, #0
	ldr r1, [r2, #0x2c]
	ldr r0, [r1, #0xc]
	cmp r0, #0
	beq _08089400
	ldr r0, _08089404  @ gUnknown_08A00D14
	cmp r1, r0
	bne _0808940C
	ldr r0, _08089408  @ gUnknown_02003BFC
	ldr r0, [r0, #0xc]
	ldrh r0, [r0, #0x1e]
	cmp r0, #0
	bne _0808940C
_08089400:
	movs r0, #0
	b _0808942A
	.align 2, 0
_08089404: .4byte gUnknown_08A00D14
_08089408: .4byte gUnknown_02003BFC
_0808940C:
	ldr r0, [r2, #0x2c]
	ldr r0, [r0, #0xc]
	str r0, [r2, #0x2c]
	adds r1, r2, #0
	adds r1, #0x50
	movs r0, #0x10
	strh r0, [r1]
	ldr r0, [r2, #0x2c]
	ldr r1, [r0, #0x14]
	cmp r1, #0
	beq _08089428
	adds r0, r2, #0
	bl _call_via_r1
_08089428:
	movs r0, #1
_0808942A:
	pop {r1}
	bx r1

	THUMB_FUNC_START sub_8089430
sub_8089430: @ 0x08089430
	push {lr}
	adds r2, r0, #0
	ldr r0, _08089450  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0x81
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0808944A
	adds r0, r2, #0
	bl Proc_ClearNativeCallback
_0808944A:
	pop {r0}
	bx r0
	.align 2, 0
_08089450: .4byte gKeyStatusPtr

	THUMB_FUNC_START sub_8089454
sub_8089454: @ 0x08089454
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	movs r1, #1
	negs r1, r1
	movs r0, #0
	bl LoadDialogueBoxGfx
	bl GetUiHandPrevDisplayX
	adds r4, r0, #0
	bl GetUiHandPrevDisplayY
	adds r1, r0, #0
	adds r0, r4, #0
	adds r2, r5, #0
	bl sub_8088DE0
	ldr r0, _08089488  @ gUnknown_08A00B00
	adds r1, r6, #0
	bl Proc_CreateBlockingChild
	movs r0, #1
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08089488: .4byte gUnknown_08A00B00

	THUMB_FUNC_START Loop6C_8A00B20_UpdateOAMData
Loop6C_8A00B20_UpdateOAMData: @ 0x0808948C
	push {lr}
	sub sp, #4
	ldr r1, [r0, #0x2c]
	ldr r2, [r0, #0x30]
	ldr r3, _080894A8  @ gUnknown_08A00B10
	ldr r0, [r0, #0x34]
	str r0, [sp]
	movs r0, #0
	bl RegisterObjectAttributes_SafeMaybe
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_080894A8: .4byte gUnknown_08A00B10

	THUMB_FUNC_START sub_80894AC
sub_80894AC: @ 0x080894AC
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r7, r1, #0
	adds r4, r2, #0
	ldr r5, _080894DC  @ gUnknown_08A00B20
	adds r0, r5, #0
	bl Proc_Find
	adds r1, r0, #0
	cmp r1, #0
	bne _080894CC
	adds r0, r5, #0
	adds r1, r4, #0
	bl Proc_Create
	adds r1, r0, #0
_080894CC:
	str r6, [r1, #0x2c]
	str r7, [r1, #0x30]
	movs r0, #0
	str r0, [r1, #0x34]
	adds r0, r1, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080894DC: .4byte gUnknown_08A00B20

	THUMB_FUNC_START sub_80894E0
sub_80894E0: @ 0x080894E0
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	mov r8, r0
	mov r9, r1
	adds r5, r2, #0
	adds r6, r3, #0
	ldr r7, _08089534  @ gUnknown_08A00B20
	adds r0, r7, #0
	bl Proc_Find
	adds r4, r0, #0
	ldr r0, _08089538  @ gUnknown_08A1D79C
	adds r1, r5, #0
	adds r1, #0x10
	lsls r1, r1, #5
	movs r2, #0x20
	bl CopyToPaletteBuffer
	cmp r4, #0
	bne _08089516
	adds r0, r7, #0
	adds r1, r6, #0
	bl Proc_Create
	adds r4, r0, #0
_08089516:
	mov r0, r8
	str r0, [r4, #0x2c]
	mov r0, r9
	str r0, [r4, #0x30]
	movs r0, #0xf
	ands r0, r5
	lsls r0, r0, #0xc
	str r0, [r4, #0x34]
	adds r0, r4, #0
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08089534: .4byte gUnknown_08A00B20
_08089538: .4byte gUnknown_08A1D79C

	THUMB_FUNC_START sub_808953C
sub_808953C: @ 0x0808953C
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r7, r1, #0
	adds r4, r2, #0
	ldr r5, _0808956C  @ gUnknown_08A00B20
	adds r0, r5, #0
	bl Proc_Find
	adds r1, r0, #0
	cmp r1, #0
	bne _0808955C
	adds r0, r5, #0
	adds r1, r4, #0
	bl Proc_CreateBlockingChild
	adds r1, r0, #0
_0808955C:
	str r6, [r1, #0x2c]
	str r7, [r1, #0x30]
	movs r0, #0
	str r0, [r1, #0x34]
	adds r0, r1, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0808956C: .4byte gUnknown_08A00B20

	THUMB_FUNC_START sub_8089570
sub_8089570: @ 0x08089570
	push {lr}
	ldr r0, _08089584  @ gUnknown_08A00B20
	bl Proc_Find
	cmp r0, #0
	beq _08089580
	bl Proc_Delete
_08089580:
	pop {r0}
	bx r0
	.align 2, 0
_08089584: .4byte gUnknown_08A00B20

	THUMB_FUNC_START sub_8089588
sub_8089588: @ 0x08089588
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _080895A4  @ gUnknown_08A00B20
	bl Proc_Find
	cmp r0, #0
	beq _0808959C
	str r4, [r0, #0x2c]
	str r5, [r0, #0x30]
_0808959C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080895A4: .4byte gUnknown_08A00B20

	THUMB_FUNC_START sub_80895A8
sub_80895A8: @ 0x080895A8
	ldr r0, _080895B0  @ gUnknown_0203E784
	ldr r0, [r0]
	bx lr
	.align 2, 0
_080895B0: .4byte gUnknown_0203E784

.align 2, 0
