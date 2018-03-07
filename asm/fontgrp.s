	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

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
	ldr r1, _080043E0  @ gPaletteBuffer
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
_080043E0: .4byte gPaletteBuffer
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
	ldr r1, _08004420  @ gPaletteBuffer
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
_08004420: .4byte gPaletteBuffer
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
	bl __ashldi3
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
	bl __ashldi3
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
	ldr r2, _080049A4  @ gPaletteBuffer
	lsls r0, r0, #1
	ldr r1, _080049A8  @ gUnknown_0859EFC0
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r2, #0x1c]
	bl EnablePaletteSync
	pop {r0}
	bx r0
	.align 2, 0
_080049A4: .4byte gPaletteBuffer
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
	ldr r1, _08004C64  @ gBG0TilemapBuffer
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
_08004C64: .4byte gBG0TilemapBuffer

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
