	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	THUMB_FUNC_START sub_8011784
sub_8011784: @ 0x08011784
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r6, r0, #0
	ldr r2, [r6, #0x38]
	movs r1, #0x80
	lsls r1, r1, #3
	adds r0, r2, r1
	ldr r4, _0801189C  @ 0x0001FFFF
	ands r0, r4
	lsrs r0, r0, #5
	str r0, [sp, #4]
	ldr r1, [r6, #0x3c]
	adds r0, r1, #1
	movs r3, #0xf
	ands r0, r3
	lsls r0, r0, #0xc
	ldr r5, [sp, #4]
	orrs r5, r0
	str r5, [sp, #4]
	ands r2, r4
	lsrs r7, r2, #5
	ands r1, r3
	lsls r1, r1, #0xc
	orrs r7, r1
	ldr r1, [r6, #0x30]
	adds r4, r6, #0
	adds r4, #0x48
	ldrh r0, [r4]
	ldr r2, [r6, #0x34]
	adds r2, r2, r0
	ldr r5, _080118A0  @ gObject_16x8
	str r7, [sp]
	movs r0, #4
	adds r3, r5, #0
	bl PutSpriteExt
	ldr r0, [r6, #0x44]
	subs r0, #2
	lsls r0, r0, #3
	ldr r1, [r6, #0x30]
	adds r1, r1, r0
	ldrh r0, [r4]
	ldr r2, [r6, #0x34]
	adds r2, r2, r0
	adds r0, r7, #4
	str r0, [sp]
	movs r0, #4
	adds r3, r5, #0
	bl PutSpriteExt
	ldr r1, [r6, #0x30]
	ldrh r0, [r4]
	adds r0, #0x18
	ldr r2, [r6, #0x34]
	adds r2, r2, r0
	adds r0, r7, #0
	adds r0, #0xd
	str r0, [sp]
	movs r0, #4
	adds r3, r5, #0
	bl PutSpriteExt
	ldr r0, [r6, #0x44]
	subs r0, #2
	lsls r0, r0, #3
	ldr r1, [r6, #0x30]
	adds r1, r1, r0
	ldrh r0, [r4]
	adds r0, #0x18
	ldr r2, [r6, #0x34]
	adds r2, r2, r0
	adds r0, r7, #0
	adds r0, #0x11
	str r0, [sp]
	movs r0, #4
	adds r3, r5, #0
	bl PutSpriteExt
	ldr r1, [r6, #0x30]
	ldrh r0, [r4]
	adds r0, #8
	ldr r2, [r6, #0x34]
	adds r2, r2, r0
	ldr r5, _080118A4  @ gObject_8x8
	adds r0, r7, #6
	str r0, [sp]
	movs r0, #4
	adds r3, r5, #0
	bl PutSpriteExt
	ldr r1, [r6, #0x30]
	ldrh r0, [r4]
	adds r0, #0x10
	ldr r2, [r6, #0x34]
	adds r2, r2, r0
	adds r0, r7, #0
	adds r0, #0xb
	str r0, [sp]
	movs r0, #4
	adds r3, r5, #0
	bl PutSpriteExt
	ldr r0, [r6, #0x44]
	subs r0, #1
	lsls r0, r0, #3
	ldr r1, [r6, #0x30]
	adds r1, r1, r0
	ldrh r0, [r4]
	adds r0, #8
	ldr r2, [r6, #0x34]
	adds r2, r2, r0
	adds r0, r7, #0
	adds r0, #0xa
	str r0, [sp]
	movs r0, #4
	adds r3, r5, #0
	bl PutSpriteExt
	ldr r0, [r6, #0x44]
	subs r0, #1
	lsls r0, r0, #3
	ldr r1, [r6, #0x30]
	adds r1, r1, r0
	ldrh r0, [r4]
	adds r0, #0x10
	ldr r2, [r6, #0x34]
	adds r2, r2, r0
	adds r0, r7, #0
	adds r0, #0xc
	str r0, [sp]
	movs r0, #4
	adds r3, r5, #0
	bl PutSpriteExt
	movs r5, #2
	b _080118C6
	.align 2, 0
_0801189C: .4byte 0x0001FFFF
_080118A0: .4byte gObject_16x8
_080118A4: .4byte gObject_8x8
_080118A8:
	lsls r0, r5, #3
	ldr r1, [r6, #0x30]
	adds r1, r1, r0
	adds r0, r6, #0
	adds r0, #0x48
	ldrh r0, [r0]
	ldr r2, [r6, #0x34]
	adds r2, r2, r0
	adds r0, r7, #2
	str r0, [sp]
	movs r0, #4
	ldr r3, _08011904  @ gObject_16x8
	bl PutSpriteExt
	adds r5, #2
_080118C6:
	ldr r0, [r6, #0x44]
	subs r0, #2
	cmp r5, r0
	blt _080118A8
	ldr r0, [r6, #0x44]
	subs r0, #1
	movs r1, #0x48
	adds r1, r1, r6
	mov sl, r1
	cmp r5, r0
	bge _08011900
_080118DC:
	lsls r0, r5, #3
	ldr r1, [r6, #0x30]
	adds r1, r1, r0
	mov r2, sl
	ldrh r0, [r2]
	ldr r2, [r6, #0x34]
	adds r2, r2, r0
	adds r0, r7, #2
	str r0, [sp]
	movs r0, #4
	ldr r3, _08011908  @ gObject_8x8
	bl PutSpriteExt
	adds r5, #1
	ldr r0, [r6, #0x44]
	subs r0, #1
	cmp r5, r0
	blt _080118DC
_08011900:
	movs r5, #2
	b _0801192C
	.align 2, 0
_08011904: .4byte gObject_16x8
_08011908: .4byte gObject_8x8
_0801190C:
	lsls r0, r5, #3
	ldr r1, [r6, #0x30]
	adds r1, r1, r0
	mov r2, sl
	ldrh r0, [r2]
	adds r0, #0x18
	ldr r2, [r6, #0x34]
	adds r2, r2, r0
	adds r0, r7, #0
	adds r0, #0xf
	str r0, [sp]
	movs r0, #4
	ldr r3, _08011A0C  @ gObject_16x8
	bl PutSpriteExt
	adds r5, #2
_0801192C:
	ldr r0, [r6, #0x44]
	subs r0, #2
	cmp r5, r0
	blt _0801190C
	movs r5, #1
	ldr r0, [r6, #0x44]
	subs r0, #2
	cmp r5, r0
	bge _08011986
	mov r9, sl
	movs r0, #8
	adds r0, r0, r7
	mov r8, r0
_08011946:
	lsls r4, r5, #3
	ldr r1, [r6, #0x30]
	adds r1, r1, r4
	mov r2, r9
	ldrh r0, [r2]
	adds r0, #8
	ldr r2, [r6, #0x34]
	adds r2, r2, r0
	mov r0, r8
	str r0, [sp]
	movs r0, #4
	ldr r3, _08011A0C  @ gObject_16x8
	bl PutSpriteExt
	ldr r1, [r6, #0x30]
	adds r1, r1, r4
	mov r2, r9
	ldrh r0, [r2]
	adds r0, #0x10
	ldr r2, [r6, #0x34]
	adds r2, r2, r0
	mov r0, r8
	str r0, [sp]
	movs r0, #4
	ldr r3, _08011A0C  @ gObject_16x8
	bl PutSpriteExt
	adds r5, #2
	ldr r0, [r6, #0x44]
	subs r0, #2
	cmp r5, r0
	blt _08011946
_08011986:
	ldr r0, [r6, #0x44]
	subs r0, #1
	cmp r5, r0
	bge _080119D2
	mov r8, sl
	ldr r1, _08011A10  @ gObject_8x8
	mov r9, r1
	adds r7, #8
_08011996:
	lsls r4, r5, #3
	ldr r1, [r6, #0x30]
	adds r1, r1, r4
	mov r2, r8
	ldrh r0, [r2]
	adds r0, #8
	ldr r2, [r6, #0x34]
	adds r2, r2, r0
	str r7, [sp]
	movs r0, #4
	mov r3, r9
	bl PutSpriteExt
	ldr r1, [r6, #0x30]
	adds r1, r1, r4
	mov r2, r8
	ldrh r0, [r2]
	adds r0, #0x10
	ldr r2, [r6, #0x34]
	adds r2, r2, r0
	str r7, [sp]
	movs r0, #4
	mov r3, r9
	bl PutSpriteExt
	adds r5, #1
	ldr r0, [r6, #0x44]
	subs r0, #1
	cmp r5, r0
	blt _08011996
_080119D2:
	ldr r4, [sp, #4]
	movs r7, #8
	movs r5, #2
_080119D8:
	ldr r1, [r6, #0x30]
	adds r1, r1, r7
	mov r2, sl
	ldrh r0, [r2]
	adds r0, #8
	ldr r2, [r6, #0x34]
	adds r2, r2, r0
	str r4, [sp]
	movs r0, #0
	ldr r3, _08011A14  @ gObject_32x16
	bl PutSpriteExt
	adds r4, #4
	adds r7, #0x20
	subs r5, #1
	cmp r5, #0
	bge _080119D8
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08011A0C: .4byte gObject_16x8
_08011A10: .4byte gObject_8x8
_08011A14: .4byte gObject_32x16

	THUMB_FUNC_END sub_8011784

	THUMB_FUNC_START nullsub_44
nullsub_44: @ 0x08011A18
	bx lr

	THUMB_FUNC_END nullsub_44

	THUMB_FUNC_START sub_8011A1C
sub_8011A1C: @ 0x08011A1C
	push {lr}
	adds r2, r0, #0
	lsls r1, r1, #0x18
	lsrs r0, r1, #0x18
	cmp r2, #0
	beq _08011A42
	lsls r0, r0, #0x18
	asrs r1, r0, #0x18
	cmp r1, #0
	beq _08011A3C
	adds r1, r2, #0
	adds r1, #0x48
	movs r0, #0x80
	lsls r0, r0, #3
	strh r0, [r1]
	b _08011A42
_08011A3C:
	adds r0, r2, #0
	adds r0, #0x48
	strh r1, [r0]
_08011A42:
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8011A1C

	THUMB_FUNC_START sub_8011A48
sub_8011A48: @ 0x08011A48
	push {r4, lr}
	sub sp, #4
	adds r0, #0x4c
	movs r4, #0
	strh r4, [r0]
	movs r0, #1
	movs r1, #0
	movs r2, #0x10
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	str r4, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl sub_8001ED0
	movs r0, #1
	str r0, [sp]
	movs r1, #1
	movs r2, #1
	movs r3, #1
	bl sub_8001F0C
	movs r0, #1
	bl sub_8001F48
	movs r0, #1
	bl sub_8001F64
	ldr r0, _08011A9C  @ gUnknown_085924D8
	bl Proc_Find
	movs r1, #1
	bl sub_8011A1C
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08011A9C: .4byte gUnknown_085924D8

	THUMB_FUNC_END sub_8011A48

	THUMB_FUNC_START sub_8011AA0
sub_8011AA0: @ 0x08011AA0
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r1, r5, #0
	adds r1, #0x4c
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	movs r0, #0
	ldrsh r4, [r1, r0]
	lsls r1, r4, #0x18
	lsrs r1, r1, #0x18
	movs r2, #0x10
	subs r2, r2, r4
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	movs r0, #1
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	cmp r4, #0x10
	bne _08011AE8
	adds r0, r5, #0
	bl Proc_Break
	movs r0, #0
	movs r1, #0x10
	movs r2, #0
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	ldr r0, _08011AF0  @ gUnknown_085924D8
	bl Proc_Find
	movs r1, #0
	bl sub_8011A1C
_08011AE8:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08011AF0: .4byte gUnknown_085924D8

	THUMB_FUNC_END sub_8011AA0

	THUMB_FUNC_START sub_8011AF4
sub_8011AF4: @ 0x08011AF4
	push {r4, lr}
	sub sp, #4
	adds r0, #0x4c
	movs r4, #0
	strh r4, [r0]
	movs r0, #1
	movs r1, #0x10
	movs r2, #0
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	str r4, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl sub_8001ED0
	movs r0, #1
	str r0, [sp]
	movs r1, #1
	movs r2, #1
	movs r3, #1
	bl sub_8001F0C
	movs r0, #1
	bl sub_8001F48
	movs r0, #1
	bl sub_8001F64
	ldr r0, _08011B48  @ gUnknown_085924D8
	bl Proc_Find
	movs r1, #1
	bl sub_8011A1C
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08011B48: .4byte gUnknown_085924D8

	THUMB_FUNC_END sub_8011AF4

	THUMB_FUNC_START sub_8011B4C
sub_8011B4C: @ 0x08011B4C
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r1, r5, #0
	adds r1, #0x4c
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	movs r0, #0
	ldrsh r4, [r1, r0]
	movs r1, #0x10
	subs r1, r1, r4
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsls r2, r4, #0x18
	lsrs r2, r2, #0x18
	movs r0, #1
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	cmp r4, #0x10
	bne _08011B86
	ldr r0, _08011B8C  @ gUnknown_085924D8
	bl Proc_Find
	bl Proc_End
	adds r0, r5, #0
	bl Proc_Break
_08011B86:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08011B8C: .4byte gUnknown_085924D8

	THUMB_FUNC_END sub_8011B4C

	THUMB_FUNC_START sub_8011B90
sub_8011B90: @ 0x08011B90
	push {lr}
	movs r0, #0
	movs r1, #0x10
	movs r2, #0
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8011B90

	THUMB_FUNC_START sub_8011BA4
sub_8011BA4: @ 0x08011BA4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x20
	mov r8, r0
	mov r9, r1
	adds r4, r2, #0
	adds r5, r3, #0
	ldr r1, [sp, #0x44]
	movs r6, #0
	ldr r0, _08011C7C  @ gUnknown_085924D8
	bl Proc_Start
	adds r7, r0, #0
	adds r0, r4, #0
	bl GetStringFromIndex
	mov sl, r0
	mov r0, r8
	str r0, [r7, #0x30]
	mov r2, r9
	str r2, [r7, #0x34]
	str r5, [r7, #0x38]
	ldr r0, [sp, #0x40]
	str r0, [r7, #0x3c]
	str r4, [r7, #0x40]
	adds r0, r7, #0
	adds r0, #0x48
	strh r6, [r0]
	ldr r0, _08011C80  @ gUnknown_08A4D0CC
	ldr r1, [r7, #0x3c]
	adds r1, #0x10
	lsls r1, r1, #5
	movs r2, #0x20
	bl CopyToPaletteBuffer
	ldr r0, _08011C84  @ gUnknown_0859EF00
	ldr r1, [r7, #0x3c]
	adds r1, #0x11
	lsls r1, r1, #5
	movs r2, #0x20
	bl CopyToPaletteBuffer
	ldr r0, _08011C88  @ gUnknown_08A4CF2C
	ldr r1, [r7, #0x38]
	ldr r2, _08011C8C  @ 0x06010000
	adds r1, r1, r2
	bl CopyDataWithPossibleUncomp
	mov r0, sl
	bl GetStringTextWidth
	adds r6, r0, #0
	adds r4, r6, #0
	cmp r6, #0
	bge _08011C1A
	adds r4, r6, #7
_08011C1A:
	asrs r4, r4, #3
	adds r6, r4, #5
	str r6, [r7, #0x44]
	ldr r1, [r7, #0x38]
	ldr r0, _08011C90  @ 0x06010400
	adds r1, r1, r0
	ldr r2, [r7, #0x3c]
	adds r2, #0x12
	mov r0, sp
	bl InitSomeOtherGraphicsRelatedStruct
	mov r0, sp
	bl SetFont
	add r5, sp, #0x18
	adds r0, r5, #0
	bl Text_Init3
	adds r0, r5, #0
	movs r1, #0
	bl Text_80046B4
	movs r0, #0
	bl SetFontGlyphSet
	adds r4, #3
	lsls r4, r4, #3
	adds r0, r4, #0
	mov r1, sl
	bl GetStringTextCenteredPos
	adds r1, r0, #0
	adds r0, r5, #0
	movs r2, #0
	mov r3, sl
	bl Text_InsertString
	movs r0, #0
	bl SetFont
	add sp, #0x20
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08011C7C: .4byte gUnknown_085924D8
_08011C80: .4byte gUnknown_08A4D0CC
_08011C84: .4byte gUnknown_0859EF00
_08011C88: .4byte gUnknown_08A4CF2C
_08011C8C: .4byte 0x06010000
_08011C90: .4byte 0x06010400

	THUMB_FUNC_END sub_8011BA4

	THUMB_FUNC_START sub_8011C94
sub_8011C94: @ 0x08011C94
	push {r4, r5, lr}
	sub sp, #8
	adds r5, r0, #0
	adds r0, r1, #0
	adds r1, r2, #0
	adds r4, r3, #0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r3, #0xa0
	lsls r3, r3, #7
	movs r2, #9
	str r2, [sp]
	str r4, [sp, #4]
	adds r2, r5, #0
	bl sub_8011BA4
	ldr r0, _08011CC8  @ gUnknown_08592530
	adds r1, r4, #0
	bl Proc_StartBlocking
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08011CC8: .4byte gUnknown_08592530

	THUMB_FUNC_END sub_8011C94

	THUMB_FUNC_START sub_8011CCC
sub_8011CCC: @ 0x08011CCC
	push {r4, lr}
	adds r3, r0, #0
	lsls r1, r1, #0x18
	lsrs r4, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	ldr r1, [r3, #0xc]
	movs r0, #5
	ands r1, r0
	cmp r1, #0
	bne _08011D0A
	cmp r4, #0x15
	beq _08011CF0
	adds r0, r3, #0
	adds r0, #0x42
	strb r4, [r0]
	adds r0, #1
	strb r1, [r0]
_08011CF0:
	cmp r2, #0x13
	beq _08011D0A
	adds r0, r3, #0
	adds r0, #0x44
	strb r2, [r0]
	adds r0, #1
	strb r1, [r0]
	cmp r2, #0xc
	bne _08011D0A
	ldrb r0, [r3, #0xa]
	movs r1, #8
	orrs r0, r1
	strb r0, [r3, #0xa]
_08011D0A:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8011CCC

	THUMB_FUNC_START sub_8011D10
sub_8011D10: @ 0x08011D10
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	lsls r1, r1, #0x18
	lsrs r7, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r6, r2, #0x18
	lsls r3, r3, #0x18
	lsrs r5, r3, #0x18
	movs r4, #1
_08011D2A:
	adds r0, r4, #0
	bl GetUnit
	adds r1, r0, #0
	cmp r1, #0
	beq _08011D4E
	ldr r0, [r1]
	cmp r0, #0
	beq _08011D4E
	ldrb r0, [r0, #4]
	cmp r0, r8
	bne _08011D4E
	adds r0, r1, #0
	adds r1, r7, #0
	adds r2, r6, #0
	adds r3, r5, #0
	bl sub_8011CCC
_08011D4E:
	adds r4, #1
	cmp r4, #0xbf
	ble _08011D2A
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8011D10

	THUMB_FUNC_START sub_8011D60
sub_8011D60: @ 0x08011D60
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	str r0, [sp]
	ldr r0, [sp, #0x24]
	lsls r1, r1, #0x18
	lsrs r6, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	mov sl, r2
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	mov r9, r3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	movs r4, #1
_08011D88:
	adds r0, r4, #0
	bl GetUnit
	adds r5, r0, #0
	adds r7, r4, #1
	cmp r5, #0
	beq _08011DDE
	ldr r0, [r5]
	cmp r0, #0
	beq _08011DDE
	movs r1, #0
	cmp r1, r6
	bge _08011DDE
_08011DA2:
	lsls r1, r1, #0x10
	asrs r0, r1, #0xe
	ldr r2, [sp]
	adds r3, r0, r2
	movs r2, #0x10
	ldrsb r2, [r5, r2]
	movs r4, #0
	ldrsh r0, [r3, r4]
	adds r4, r1, #0
	cmp r2, r0
	bne _08011DD0
	movs r1, #0x11
	ldrsb r1, [r5, r1]
	movs r2, #2
	ldrsh r0, [r3, r2]
	cmp r1, r0
	bne _08011DD0
	adds r0, r5, #0
	mov r1, sl
	mov r2, r9
	mov r3, r8
	bl sub_8011CCC
_08011DD0:
	movs r1, #0x80
	lsls r1, r1, #9
	adds r0, r4, r1
	lsrs r1, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, r6
	blt _08011DA2
_08011DDE:
	adds r4, r7, #0
	cmp r4, #0xbf
	ble _08011D88
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8011D60

	THUMB_FUNC_START sub_8011DF4
sub_8011DF4: @ 0x08011DF4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r7, r0, #0
	mov r8, r1
	ldr r5, _08011E38  @ gBattleActor
	adds r0, r5, #0
	adds r1, r7, #0
	bl InitBattleUnit
	ldr r4, _08011E3C  @ gBattleTarget
	adds r0, r4, #0
	mov r1, r8
	bl InitBattleUnit
	ldr r6, _08011E40  @ gBattleStats
	movs r2, #0x10
	ldrsb r2, [r5, r2]
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	subs r1, r2, r0
	cmp r1, #0
	bge _08011E24
	subs r1, r0, r2
_08011E24:
	movs r3, #0x11
	ldrsb r3, [r5, r3]
	movs r0, #0x11
	ldrsb r0, [r4, r0]
	subs r2, r3, r0
	cmp r2, #0
	blt _08011E44
	adds r0, r1, r2
	b _08011E48
	.align 2, 0
_08011E38: .4byte gBattleActor
_08011E3C: .4byte gBattleTarget
_08011E40: .4byte gBattleStats
_08011E44:
	subs r0, r0, r3
	adds r0, r1, r0
_08011E48:
	strb r0, [r6, #2]
	ldr r0, _08011E60  @ gBattleStats
	ldrh r1, [r0]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _08011E68
	ldr r0, _08011E64  @ gBattleActor
	bl SetBattleUnitWeaponBallista
	b _08011E72
	.align 2, 0
_08011E60: .4byte gBattleStats
_08011E64: .4byte gBattleActor
_08011E68:
	ldr r0, _08011EC0  @ gBattleActor
	movs r1, #1
	negs r1, r1
	bl SetBattleUnitWeapon
_08011E72:
	ldr r4, _08011EC4  @ gBattleTarget
	movs r1, #1
	negs r1, r1
	adds r0, r4, #0
	bl SetBattleUnitWeapon
	bl BattleInitTargetCanCounter
	ldr r5, _08011EC0  @ gBattleActor
	adds r0, r5, #0
	adds r1, r4, #0
	bl BattleApplyWeaponTriangleEffect
	bl DisableAllLightRunes
	adds r0, r5, #0
	bl SetBattleUnitTerrainBonusesAuto
	adds r0, r4, #0
	bl SetBattleUnitTerrainBonusesAuto
	adds r0, r7, #0
	mov r1, r8
	bl BattleGenerate
	bl EnableAllLightRunes
	adds r0, r4, #0
	bl BattleUnitTargetCheckCanCounter
	adds r0, r4, #0
	bl BattleUnitTargetSetEquippedWeapon
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08011EC0: .4byte gBattleActor
_08011EC4: .4byte gBattleTarget

	THUMB_FUNC_END sub_8011DF4

	THUMB_FUNC_START sub_8011EC8
sub_8011EC8: @ 0x08011EC8
	push {lr}
	ldr r3, _08011ED8  @ gBattleStats
	movs r2, #1
	strh r2, [r3]
	bl sub_8011DF4
	pop {r0}
	bx r0
	.align 2, 0
_08011ED8: .4byte gBattleStats

	THUMB_FUNC_END sub_8011EC8

	THUMB_FUNC_START sub_8011EDC
sub_8011EDC: @ 0x08011EDC
	push {lr}
	ldr r3, _08011EEC  @ gBattleStats
	movs r2, #9
	strh r2, [r3]
	bl sub_8011DF4
	pop {r0}
	bx r0
	.align 2, 0
_08011EEC: .4byte gBattleStats

	THUMB_FUNC_END sub_8011EDC

	THUMB_FUNC_START sub_8011EF0
sub_8011EF0: @ 0x08011EF0
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _08011F34  @ gBG2TilemapBuffer
	movs r1, #0
	bl BG_Fill
	movs r0, #4
	bl BG_EnableSyncByMask
	ldr r1, _08011F38  @ gPaletteBuffer
	movs r0, #0
	strh r0, [r1]
	bl EnablePaletteSync
	bl RenderBmMap
	bl sub_8055BC4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r4, #0
	beq _08011F22
	movs r0, #0
_08011F22:
	cmp r0, #0
	beq _08011F3C
	movs r0, #0
	bl sub_804FD48
	bl BeginAnimsOnBattleAnimations
	b _08011F52
	.align 2, 0
_08011F34: .4byte gBG2TilemapBuffer
_08011F38: .4byte gPaletteBuffer
_08011F3C:
	bl MU_EndAll
	bl RenderBmMap
	bl BeginBattleMapAnims
	ldr r0, _08011F58  @ gBattleStats
	ldrh r1, [r0]
	movs r2, #0x80
	orrs r1, r2
	strh r1, [r0]
_08011F52:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08011F58: .4byte gBattleStats

	THUMB_FUNC_END sub_8011EF0

	THUMB_FUNC_START sub_8011F5C
sub_8011F5C: @ 0x08011F5C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r7, r0, #0
	mov r8, r1
	ldr r0, [sp, #0x28]
	ldr r5, [sp, #0x2c]
	ldr r1, [sp, #0x30]
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	mov r9, r2
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	mov sl, r3
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	str r1, [sp]
	bl sub_8058B64
	movs r0, #0
	str r0, [sp, #4]
	cmp r5, #0
	bne _08011F98
	movs r1, #1
	str r1, [sp, #4]
_08011F98:
	ldr r1, _08011FA4  @ gActionData
	ldr r0, [sp, #4]
	cmp r0, #0
	bne _08011FA8
	str r5, [r1, #0x18]
	b _08011FAC
	.align 2, 0
_08011FA4: .4byte gActionData
_08011FA8:
	movs r0, #0
	str r0, [r1, #0x18]
_08011FAC:
	ldrh r0, [r7, #0x1e]
	bl GetItemType
	cmp r0, #4
	beq _08011FBA
	cmp r6, #0
	beq _08011FCA
_08011FBA:
	adds r0, r7, #0
	movs r1, #0
	bl BattleInitItemEffect
	mov r0, r8
	bl BattleInitItemEffectTarget
	b _08011FE2
_08011FCA:
	mov r1, r9
	cmp r1, #0
	bne _08011FDA
	adds r0, r7, #0
	mov r1, r8
	bl sub_8011EC8
	b _08011FE2
_08011FDA:
	adds r0, r7, #0
	mov r1, r8
	bl sub_8011EDC
_08011FE2:
	adds r0, r7, #0
	bl GetUnitEquippedWeapon
	ldr r1, _08012028  @ gBattleActor
	adds r2, r1, #0
	adds r2, #0x48
	strh r0, [r2]
	adds r1, #0x4a
	strh r0, [r1]
	mov r0, r8
	bl GetUnitEquippedWeapon
	ldr r1, _0801202C  @ gBattleTarget
	adds r2, r1, #0
	adds r2, #0x48
	strh r0, [r2]
	ldr r4, _08012030  @ 0x0000FFFF
	adds r1, #0x4a
	strh r0, [r1]
	ldr r0, _08012034  @ gUnknown_030005FC
	strh r4, [r0]
	cmp r6, #0
	beq _080120BE
	adds r0, r6, #0
	bl GetItemType
	cmp r0, #7
	bgt _08012038
	cmp r0, #5
	bge _08012050
	cmp r0, #0
	blt _080120BE
	cmp r0, #3
	ble _08012050
	b _0801209C
	.align 2, 0
_08012028: .4byte gBattleActor
_0801202C: .4byte gBattleTarget
_08012030: .4byte 0x0000FFFF
_08012034: .4byte gUnknown_030005FC
_08012038:
	cmp r0, #0xb
	beq _08012050
	cmp r0, #0xb
	bgt _08012046
	cmp r0, #9
	blt _080120BE
	b _0801209C
_08012046:
	cmp r0, #0xc
	beq _0801209C
	cmp r0, #0xff
	beq _0801209C
	b _080120BE
_08012050:
	ldr r0, _08012070  @ gUnknown_030005FC
	ldrh r1, [r7, #0x1e]
	strh r1, [r0]
	adds r0, r6, #0
	bl MakeNewItem
	strh r0, [r7, #0x1e]
	mov r0, r9
	cmp r0, #0
	bne _08012074
	adds r0, r7, #0
	mov r1, r8
	bl sub_8011EC8
	b _0801207C
	.align 2, 0
_08012070: .4byte gUnknown_030005FC
_08012074:
	adds r0, r7, #0
	mov r1, r8
	bl sub_8011EDC
_0801207C:
	adds r0, r6, #0
	bl MakeNewItem
	ldr r4, _08012098  @ gBattleActor
	adds r1, r4, #0
	adds r1, #0x48
	strh r0, [r1]
	adds r0, r6, #0
	bl MakeNewItem
	adds r4, #0x4a
	strh r0, [r4]
	movs r6, #0
	b _080120BE
	.align 2, 0
_08012098: .4byte gBattleActor
_0801209C:
	ldr r0, _08012150  @ gBattleActor
	movs r1, #0x80
	lsls r1, r1, #1
	adds r2, r6, r1
	adds r1, r0, #0
	adds r1, #0x48
	strh r2, [r1]
	adds r0, #0x4a
	strh r2, [r0]
	cmp r6, #0x80
	bgt _080120BE
	cmp r6, #0x7d
	blt _080120BE
	ldr r1, _08012154  @ gBattleStats
	movs r0, #0x80
	lsls r0, r0, #2
	strh r0, [r1]
_080120BE:
	ldr r0, _08012150  @ gBattleActor
	adds r0, #0x6e
	movs r1, #0
	strb r1, [r0]
	ldr r0, _08012158  @ gBattleTarget
	adds r0, #0x6e
	strb r1, [r0]
	mov r0, sl
	lsls r0, r0, #0x18
	mov sl, r0
	cmp r6, #0
	beq _08012118
	ldr r1, [sp, #4]
	cmp r1, #0
	bne _08012118
	bl ClearBattleHits
	ldr r2, _0801215C  @ gBattleHitIterator
	ldr r1, [r2]
	ldr r0, [r5]
	str r0, [r1]
	ldr r0, [r5]
	lsls r0, r0, #8
	lsrs r0, r0, #0x1b
	movs r1, #0x10
	ands r0, r1
	cmp r0, #0
	bne _08012114
	mov r9, r2
	movs r4, #0x10
_080120FA:
	bl BattleHitAdvance
	adds r5, #4
	mov r0, r9
	ldr r1, [r0]
	ldr r0, [r5]
	str r0, [r1]
	ldr r0, [r5]
	lsls r0, r0, #8
	lsrs r0, r0, #0x1b
	ands r0, r4
	cmp r0, #0
	beq _080120FA
_08012114:
	bl BattleHitTerminate
_08012118:
	mov r1, sl
	asrs r4, r1, #0x18
	cmp r4, #0
	bne _0801216C
	ldr r5, _08012150  @ gBattleActor
	ldrb r0, [r5, #0x13]
	strb r0, [r7, #0x13]
	ldr r0, _08012158  @ gBattleTarget
	ldrb r0, [r0, #0x13]
	mov r1, r8
	strb r0, [r1, #0x13]
	bl sub_8058B70
	ldr r0, _08012160  @ gActionData
	str r4, [r0, #0x18]
	ldr r4, _08012164  @ gUnknown_030005FC
	ldrh r1, [r4]
	ldr r0, _08012168  @ 0x0000FFFF
	cmp r1, r0
	beq _080121BA
	movs r0, #0xb
	ldrsb r0, [r5, r0]
	bl GetUnit
	ldrh r1, [r4]
	strh r1, [r0, #0x1e]
	b _080121BA
	.align 2, 0
_08012150: .4byte gBattleActor
_08012154: .4byte gBattleStats
_08012158: .4byte gBattleTarget
_0801215C: .4byte gBattleHitIterator
_08012160: .4byte gActionData
_08012164: .4byte gUnknown_030005FC
_08012168: .4byte 0x0000FFFF
_0801216C:
	adds r0, r7, #0
	bl UnitBeginAction
	ldr r4, _08012198  @ gActiveUnit
	ldr r0, [r4]
	bl HideUnitSMS
	ldr r0, [r4]
	bl MU_Create
	bl MU_SetDefaultFacing_Auto
	ldrh r0, [r7, #0x1e]
	bl GetItemType
	cmp r0, #4
	beq _08012192
	cmp r6, #0
	beq _080121A0
_08012192:
	ldr r1, _0801219C  @ gActionData
	movs r0, #3
	b _080121A4
	.align 2, 0
_08012198: .4byte gActiveUnit
_0801219C: .4byte gActionData
_080121A0:
	ldr r1, _080121CC  @ gActionData
	movs r0, #2
_080121A4:
	strb r0, [r1, #0x11]
	ldr r1, [sp]
	lsls r0, r1, #0x18
	asrs r0, r0, #0x18
	bl sub_8011EF0
	ldr r1, _080121D0  @ gAiDecision
	ldrb r0, [r7, #0x10]
	strb r0, [r1, #2]
	ldrb r0, [r7, #0x11]
	strb r0, [r1, #3]
_080121BA:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080121CC: .4byte gActionData
_080121D0: .4byte gAiDecision

	THUMB_FUNC_END sub_8011F5C

	THUMB_FUNC_START sub_80121D4
sub_80121D4: @ 0x080121D4
	push {r4, r5, r6, r7, lr}
	ldr r5, _08012258  @ gBattleActor
	movs r0, #0xb
	ldrsb r0, [r5, r0]
	bl GetUnit
	adds r6, r0, #0
	ldr r4, _0801225C  @ gBattleTarget
	movs r0, #0xb
	ldrsb r0, [r4, r0]
	bl GetUnit
	adds r7, r0, #0
	ldrb r0, [r5, #0x13]
	movs r1, #0
	strb r0, [r6, #0x13]
	ldrb r0, [r4, #0x13]
	strb r0, [r7, #0x13]
	ldr r0, _08012260  @ gActionData
	str r1, [r0, #0x18]
	bl sub_803A024
	ldr r0, _08012264  @ gUnknown_030005FC
	ldrh r1, [r0]
	ldr r0, _08012268  @ 0x0000FFFF
	cmp r1, r0
	beq _0801220C
	strh r1, [r6, #0x1e]
_0801220C:
	ldr r0, [r6, #0xc]
	movs r1, #3
	negs r1, r1
	ands r0, r1
	str r0, [r6, #0xc]
	ldr r0, [r7, #0xc]
	ands r0, r1
	str r0, [r7, #0xc]
	ldr r0, _0801226C  @ gBattleStats
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08012248
	movs r0, #0x13
	ldrsb r0, [r6, r0]
	cmp r0, #0
	bne _08012238
	ldr r0, [r6, #0xc]
	movs r1, #5
	orrs r0, r1
	str r0, [r6, #0xc]
_08012238:
	movs r0, #0x13
	ldrsb r0, [r7, r0]
	cmp r0, #0
	bne _08012248
	ldr r0, [r7, #0xc]
	movs r1, #5
	orrs r0, r1
	str r0, [r7, #0xc]
_08012248:
	bl RefreshEntityBmMaps
	bl SMS_UpdateFromGameData
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08012258: .4byte gBattleActor
_0801225C: .4byte gBattleTarget
_08012260: .4byte gActionData
_08012264: .4byte gUnknown_030005FC
_08012268: .4byte 0x0000FFFF
_0801226C: .4byte gBattleStats

	THUMB_FUNC_END sub_80121D4

	THUMB_FUNC_START sub_8012270
sub_8012270: @ 0x08012270
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #4
	mov r8, r0
	adds r6, r1, #0
	adds r5, r2, #0
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	ldr r4, _08012314  @ gLCDControlBuffer
	ldrb r2, [r4, #0xc]
	movs r1, #4
	negs r1, r1
	adds r0, r1, #0
	ands r0, r2
	strb r0, [r4, #0xc]
	ldrb r2, [r4, #0x10]
	adds r0, r1, #0
	ands r0, r2
	movs r2, #1
	orrs r0, r2
	strb r0, [r4, #0x10]
	ldrb r0, [r4, #0x14]
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	strb r1, [r4, #0x14]
	ldrb r0, [r4, #0x18]
	movs r1, #3
	orrs r0, r1
	strb r0, [r4, #0x18]
	movs r0, #3
	movs r1, #0
	movs r2, #0
	movs r3, #0x10
	bl SetSpecialColorEffectsParameters
	movs r0, #1
	str r0, [sp]
	movs r1, #1
	movs r2, #1
	movs r3, #1
	bl sub_8001ED0
	ldrb r1, [r4, #1]
	movs r0, #0x21
	negs r0, r0
	ands r0, r1
	movs r1, #0x41
	negs r1, r1
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r4, #1]
	movs r2, #1
	negs r2, r2
	mov r0, r8
	adds r1, r6, #0
	movs r3, #0
	bl sub_802F664
	ldr r1, _08012318  @ gBattleActor
	ldr r0, _0801231C  @ gBattleTarget
	adds r0, #0x4a
	strh r5, [r0]
	adds r1, #0x4a
	strh r5, [r1]
	ldr r1, _08012320  @ gBattleStats
	movs r0, #0x88
	lsls r0, r0, #1
	strh r0, [r1]
	bl BeginBattleAnimations
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08012314: .4byte gLCDControlBuffer
_08012318: .4byte gBattleActor
_0801231C: .4byte gBattleTarget
_08012320: .4byte gBattleStats

	THUMB_FUNC_END sub_8012270

	THUMB_FUNC_START sub_8012324
sub_8012324: @ 0x08012324
	push {lr}
	bl sub_808F270
	bl sub_8010E50
	movs r0, #0
	bl SetupBackgrounds
	bl sub_80141B0
	bl Font_LoadForUI
	bl sub_80156D4
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8012324

	THUMB_FUNC_START GetChapterAllyUnitCount
GetChapterAllyUnitCount: @ 0x08012344
	push {lr}
	bl GetChapterAllyUnitDataPointer
	adds r1, r0, #0
	movs r2, #0
	b _08012354
_08012350:
	adds r2, #1
	adds r1, #0x14
_08012354:
	ldrb r0, [r1]
	cmp r0, #0
	bne _08012350
	adds r0, r2, #0
	pop {r1}
	bx r1

	THUMB_FUNC_END GetChapterAllyUnitCount

	THUMB_FUNC_START InitPlayerUnitPositionsForPrepScreen
InitPlayerUnitPositionsForPrepScreen: @ 0x08012360
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	bl GetChapterAllyUnitDataPointer
	adds r5, r0, #0
	movs r6, #1
	ldr r0, _08012398  @ gRAMChapterData
	mov r8, r0
	mov r7, sp
	adds r7, #1
_08012378:
	adds r0, r6, #0
	bl GetUnit
	adds r4, r0, #0
	cmp r4, #0
	beq _080123F8
	ldr r2, [r4]
	cmp r2, #0
	beq _080123F8
	ldrb r0, [r5]
	cmp r0, #0
	bne _0801239C
	movs r0, #0xff
	strb r0, [r4, #0x10]
	b _080123F8
	.align 2, 0
_08012398: .4byte gRAMChapterData
_0801239C:
	ldr r0, [r4, #0xc]
	ldr r1, _080123DC  @ gUnknown_0201000C
	ands r0, r1
	cmp r0, #0
	bne _080123F8
	ldr r0, [r4, #4]
	ldr r1, [r2, #0x28]
	ldr r0, [r0, #0x28]
	orrs r1, r0
	movs r0, #0x80
	lsls r0, r0, #2
	ands r1, r0
	cmp r1, #0
	beq _080123E0
	mov r1, r8
	movs r0, #0xe
	ldrsb r0, [r1, r0]
	bl GetROMChapterStruct
	adds r0, #0x82
	ldrb r0, [r0]
	strb r0, [r4, #0x10]
	mov r1, r8
	movs r0, #0xe
	ldrsb r0, [r1, r0]
	bl GetROMChapterStruct
	adds r0, #0x84
	ldrb r0, [r0]
	strb r0, [r4, #0x11]
	b _080123F8
	.align 2, 0
_080123DC: .4byte gUnknown_0201000C
_080123E0:
	adds r0, r5, #0
	mov r1, sp
	adds r2, r7, #0
	movs r3, #0
	bl GetPreferredPositionForUNIT
	mov r0, sp
	ldrb r0, [r0]
	strb r0, [r4, #0x10]
	ldrb r0, [r7]
	strb r0, [r4, #0x11]
	adds r5, #0x14
_080123F8:
	adds r6, #1
	cmp r6, #0x3f
	ble _08012378
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END InitPlayerUnitPositionsForPrepScreen

	THUMB_FUNC_START sub_801240C
sub_801240C: @ 0x0801240C
	push {r4, r5, lr}
	movs r4, #1
	movs r5, #1
	negs r5, r5
_08012414:
	adds r0, r4, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq _0801246A
	ldr r0, [r2]
	cmp r0, #0
	beq _0801246A
	ldr r1, [r2, #0xc]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	bne _0801246A
	ldr r0, _08012444  @ 0x00010008
	ands r0, r1
	cmp r0, #0
	beq _08012448
	movs r0, #0xff
	strb r0, [r2, #0x10]
	movs r0, #1
	orrs r1, r0
	str r1, [r2, #0xc]
	b _0801246A
	.align 2, 0
_08012444: .4byte 0x00010008
_08012448:
	movs r0, #2
	negs r0, r0
	ands r1, r0
	str r1, [r2, #0xc]
	ldr r0, _08012478  @ gUnknown_0202BCB0
	ldrb r1, [r0, #4]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	bne _0801246A
	movs r0, #0x10
	ldrsb r0, [r2, r0]
	cmp r0, r5
	bne _0801246A
	adds r0, r2, #0
	bl sub_801247C
_0801246A:
	adds r4, #1
	cmp r4, #0x3f
	ble _08012414
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08012478: .4byte gUnknown_0202BCB0

	THUMB_FUNC_END sub_801240C

	THUMB_FUNC_START sub_801247C
sub_801247C: @ 0x0801247C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	mov r8, r0
	bl GetChapterAllyUnitDataPointer
	adds r6, r0, #0
	mov r1, r8
	ldr r0, [r1]
	ldr r1, [r1, #4]
	ldr r0, [r0, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	movs r1, #0x80
	lsls r1, r1, #2
	ands r0, r1
	cmp r0, #0
	beq _080124D0
	ldr r4, _080124CC  @ gRAMChapterData
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	bl GetROMChapterStruct
	adds r0, #0x82
	ldrb r0, [r0]
	mov r2, r8
	strb r0, [r2, #0x10]
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	bl GetROMChapterStruct
	adds r0, #0x84
	ldrb r0, [r0]
	mov r1, r8
	strb r0, [r1, #0x11]
	b _08012566
	.align 2, 0
_080124CC: .4byte gRAMChapterData
_080124D0:
	ldrb r0, [r6]
	cmp r0, #0
	beq _08012566
	mov r9, sp
	movs r2, #1
	add r2, sp
	mov sl, r2
_080124DE:
	movs r0, #0
	str r0, [sp, #4]
	movs r7, #1
_080124E4:
	adds r0, r7, #0
	bl GetUnit
	adds r4, r0, #0
	cmp r4, #0
	beq _0801252A
	ldr r0, [r4]
	cmp r0, #0
	beq _0801252A
	ldr r0, [r4, #0xc]
	ldr r1, _08012554  @ 0x0001000C
	ands r0, r1
	cmp r0, #0
	bne _0801252A
	mov r5, sp
	adds r5, #1
	adds r0, r6, #0
	mov r1, sp
	adds r2, r5, #0
	movs r3, #0
	bl GetPreferredPositionForUNIT
	movs r1, #0x10
	ldrsb r1, [r4, r1]
	mov r2, r9
	movs r0, #0
	ldrsb r0, [r2, r0]
	cmp r1, r0
	bne _0801252A
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	movs r0, #0
	ldrsb r0, [r5, r0]
	cmp r1, r0
	beq _08012558
_0801252A:
	adds r7, #1
	cmp r7, #0x3f
	ble _080124E4
_08012530:
	ldr r0, [sp, #4]
	cmp r0, #0
	bne _0801255E
	adds r0, r6, #0
	mov r1, sp
	mov r2, sl
	movs r3, #0
	bl GetPreferredPositionForUNIT
	mov r1, r9
	ldrb r0, [r1]
	mov r2, r8
	strb r0, [r2, #0x10]
	mov r1, sl
	ldrb r0, [r1]
	strb r0, [r2, #0x11]
	b _08012566
	.align 2, 0
_08012554: .4byte 0x0001000C
_08012558:
	movs r2, #1
	str r2, [sp, #4]
	b _08012530
_0801255E:
	adds r6, #0x14
	ldrb r0, [r6]
	cmp r0, #0
	bne _080124DE
_08012566:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_801247C

	THUMB_FUNC_START sub_8012578
sub_8012578: @ 0x08012578
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	cmp r6, #0x3f
	bgt _080125B6
_08012580:
	adds r0, r6, #0
	bl GetUnit
	adds r5, r0, #0
	cmp r5, #0
	beq _080125B0
	ldr r0, [r5]
	cmp r0, #0
	beq _080125B0
	ldrb r4, [r0, #4]
	bl GetPlayerLeaderUnitId
	cmp r4, r0
	beq _080125B0
	ldr r0, [r5, #0xc]
	ldr r1, _080125AC  @ 0x0001000C
	ands r0, r1
	cmp r0, #0
	bne _080125B0
	adds r0, r6, #0
	b _080125B8
	.align 2, 0
_080125AC: .4byte 0x0001000C
_080125B0:
	adds r6, #1
	cmp r6, #0x3f
	ble _08012580
_080125B6:
	movs r0, #0
_080125B8:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8012578

	THUMB_FUNC_START sub_80125C0
sub_80125C0: @ 0x080125C0
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	bl GetPlayerLeaderUnitId
	adds r5, r0, #0
	bl GetUnitFromCharId
	adds r2, r0, #0
	cmp r2, #0
	beq _080125F6
	ldr r0, [r2, #0xc]
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	bne _080125F6
	ldr r0, [r2]
	ldrb r0, [r0, #4]
	strb r0, [r4]
	ldr r0, [r2, #4]
	ldrb r0, [r0, #4]
	strb r0, [r4, #1]
	ldrb r1, [r4, #3]
	movs r0, #2
	negs r0, r0
	ands r0, r1
	strb r0, [r4, #3]
	adds r4, #0x14
_080125F6:
	movs r5, #0
	movs r0, #2
	negs r0, r0
	adds r6, r0, #0
	b _0801261E
_08012600:
	adds r0, r5, #0
	bl GetUnit
	adds r2, r0, #0
	adds r5, #1
	ldr r0, [r2]
	ldrb r0, [r0, #4]
	strb r0, [r4]
	ldr r0, [r2, #4]
	ldrb r0, [r0, #4]
	strb r0, [r4, #1]
	ldrb r0, [r4, #3]
	ands r0, r6
	strb r0, [r4, #3]
	adds r4, #0x14
_0801261E:
	ldrb r0, [r4]
	cmp r0, #0
	beq _08012630
	adds r0, r5, #0
	bl sub_8012578
	adds r5, r0, #0
	cmp r5, #0
	bne _08012600
_08012630:
	movs r0, #0
	strb r0, [r4]
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80125C0

	THUMB_FUNC_START StoreUnitWordStructs
StoreUnitWordStructs: @ 0x0801263C
	push {r4, r5, lr}
	ldr r4, _08012674  @ gUnknown_03000600
	movs r5, #1
_08012642:
	adds r0, r5, #0
	bl GetUnit
	adds r1, r0, #0
	cmp r1, #0
	beq _08012662
	ldr r0, [r1]
	cmp r0, #0
	beq _08012662
	ldrb r0, [r0, #4]
	strb r0, [r4]
	ldrb r0, [r1, #0x10]
	strb r0, [r4, #1]
	ldrb r0, [r1, #0x11]
	strb r0, [r4, #2]
	adds r4, #4
_08012662:
	adds r5, #1
	cmp r5, #0x3f
	ble _08012642
	movs r0, #0
	strb r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08012674: .4byte gUnknown_03000600

	THUMB_FUNC_END StoreUnitWordStructs

	THUMB_FUNC_START LoadUnitWordStructs
LoadUnitWordStructs: @ 0x08012678
	push {r4, lr}
	ldr r4, _08012680  @ gUnknown_03000600
	b _080126B0
	.align 2, 0
_08012680: .4byte gUnknown_03000600
_08012684:
	ldrb r0, [r4]
	bl GetUnitFromCharId
	adds r2, r0, #0
	ldrb r0, [r4, #1]
	strb r0, [r2, #0x10]
	ldrb r0, [r4, #2]
	strb r0, [r2, #0x11]
	movs r0, #1
	ldrsb r0, [r4, r0]
	cmp r0, #0
	bge _080126A4
	ldr r0, [r2, #0xc]
	movs r1, #8
	orrs r0, r1
	b _080126AC
_080126A4:
	ldr r0, [r2, #0xc]
	movs r1, #9
	negs r1, r1
	ands r0, r1
_080126AC:
	str r0, [r2, #0xc]
	adds r4, #4
_080126B0:
	ldrb r0, [r4]
	cmp r0, #0
	bne _08012684
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END LoadUnitWordStructs

	.align 2, 0 @ Don't pad with nop.
