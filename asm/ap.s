	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED
	THUMB_FUNC_START TCS_ClearAll
TCS_ClearAll: @ 0x08009260
	push {lr}
	ldr r1, _08009278  @ gUnknown_03000108
	movs r2, #0
	movs r3, #0xbe
	lsls r3, r3, #2
	adds r0, r1, r3
_0800926C:
	str r2, [r0]
	subs r0, #0x28
	cmp r0, r1
	bge _0800926C
	pop {r0}
	bx r0
	.align 2, 0
_08009278: .4byte gUnknown_03000108

	THUMB_FUNC_START TCS_New
TCS_New: @ 0x0800927C
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	lsls r1, r1, #0x10
	lsrs r5, r1, #0x10
	movs r0, #0
	bl TCS_Alloc
	adds r4, r0, #0
	cmp r4, #0
	beq _0800929C
	adds r1, r6, #0
	adds r2, r5, #0
	bl TCS_Init
	adds r0, r4, #0
	b _0800929E
_0800929C:
	movs r0, #0
_0800929E:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	THUMB_FUNC_START TCS_Free
TCS_Free: @ 0x080092A4
	push {lr}
	adds r1, r0, #0
	cmp r1, #0
	beq _080092B6
	ldr r0, [r1]
	cmp r0, #0
	beq _080092B6
	movs r0, #0
	str r0, [r1]
_080092B6:
	pop {r0}
	bx r0

	THUMB_FUNC_START TCS_Update
TCS_Update: @ 0x080092BC
	push {r4, lr}
	adds r4, r0, #0
	cmp r4, #0
	beq _080092CA
	ldr r0, [r4]
	cmp r0, #0
	bne _080092CE
_080092CA:
	movs r0, #0
	b _080092DE
_080092CE:
	adds r0, r4, #0
	bl TCS_RegisterGraphics
	adds r0, r4, #0
	bl TCS_Exec
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
_080092DE:
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_START TCS_RegisterGraphics
TCS_RegisterGraphics: @ 0x080092E4
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	movs r2, #0
	cmp r4, #0
	beq _08009336
	ldr r0, [r4]
	cmp r0, #0
	beq _08009336
	ldr r0, [r4, #0x14]
	cmp r0, #0
	beq _0800930E
	adds r0, r4, #0
	bl TCS_QueueRotScaleData
	adds r0, r4, #0
	adds r0, #0x21
	ldrb r0, [r0]
	lsls r2, r0, #9
_0800930E:
	ldrh r0, [r4, #0x1e]
	orrs r2, r5
	ldr r3, [r4, #0x10]
	ldrh r1, [r4, #0x22]
	str r1, [sp]
	adds r1, r2, #0
	adds r2, r6, #0
	bl RegisterObjectAttributes
	ldr r0, [r4, #0x24]
	cmp r0, #0
	beq _08009336
	adds r0, r4, #0
	adds r0, #0x20
	ldrb r0, [r0]
	cmp r0, #0
	beq _08009336
	adds r0, r4, #0
	bl TCS_QueueTileGfx
_08009336:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_START TCS_Exec
TCS_Exec: @ 0x08009340
	push {r4, lr}
	adds r2, r0, #0
	cmp r2, #0
	beq _080093B2
	ldr r0, [r2]
	cmp r0, #0
	beq _080093B2
	ldrh r0, [r2, #0x1a]
	cmp r0, #0
	beq _08009368
	ldrh r1, [r2, #0x18]
	movs r3, #0x18
	ldrsh r0, [r2, r3]
	cmp r0, #0
	beq _08009376
	subs r0, r1, #1
	strh r0, [r2, #0x18]
	lsls r0, r0, #0x10
	cmp r0, #0
	ble _0800936C
_08009368:
	movs r0, #1
	b _0800942A
_0800936C:
	movs r0, #0
	strh r0, [r2, #0x18]
	ldr r0, [r2, #0xc]
	adds r0, #4
	str r0, [r2, #0xc]
_08009376:
	ldr r0, [r2, #0xc]
	ldrh r1, [r0]
	adds r4, r0, #0
	cmp r1, #0
	bne _080093B6
	ldrh r1, [r4, #2]
	cmp r1, #1
	beq _080093AC
	cmp r1, #1
	bgt _08009390
	cmp r1, #0
	beq _080093B2
	b _080093B6
_08009390:
	ldr r0, _080093A8  @ 0x0000FFFF
	cmp r1, r0
	bne _080093B6
	ldr r0, [r2, #8]
	str r0, [r2, #0xc]
	adds r0, r2, #0
	bl TCS_Exec
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	b _0800942A
	.align 2, 0
_080093A8: .4byte 0x0000FFFF
_080093AC:
	adds r0, r2, #0
	bl TCS_Free
_080093B2:
	movs r0, #0
	b _0800942A
_080093B6:
	ldrh r1, [r4]
	ldrh r0, [r2, #0x1a]
	muls r0, r1, r0
	ldrh r3, [r2, #0x1c]
	adds r1, r0, r3
	strh r1, [r2, #0x1c]
	lsls r3, r1, #0x10
	lsrs r0, r3, #0x10
	cmp r0, #0xff
	bhi _080093DA
	movs r0, #1
	strh r0, [r2, #0x18]
	adds r0, r2, #0
	bl TCS_Exec
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	b _0800942A
_080093DA:
	lsrs r0, r3, #0x18
	strh r0, [r2, #0x18]
	movs r0, #0xff
	ands r1, r0
	strh r1, [r2, #0x1c]
	ldrh r0, [r4, #2]
	ldr r1, [r2, #4]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	lsrs r0, r0, #1
	lsls r0, r0, #1
	adds r3, r1, r0
	str r3, [r2, #0x10]
	ldrh r4, [r3]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r4
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0
	beq _08009420
	str r3, [r2, #0x14]
	ldr r1, _0800941C  @ 0x00007FFF
	ands r1, r4
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, #2
	adds r0, r3, r0
	str r0, [r2, #0x10]
	b _08009422
	.align 2, 0
_0800941C: .4byte 0x00007FFF
_08009420:
	str r0, [r2, #0x14]
_08009422:
	adds r1, r2, #0
	adds r1, #0x20
	movs r0, #1
	strb r0, [r1]
_0800942A:
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_START TCS_QueueRotScaleData
TCS_QueueRotScaleData: @ 0x08009430
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	str r0, [sp, #4]
	cmp r0, #0
	beq _08009500
	ldr r0, [r0]
	cmp r0, #0
	beq _08009500
	ldr r0, [sp, #4]
	ldr r1, [r0, #0x14]
	cmp r1, #0
	beq _08009500
	ldrh r0, [r1]
	ldr r2, _08009510  @ 0x00007FFF
	ands r2, r0
	str r2, [sp, #8]
	adds r7, r1, #2
	movs r0, #0
	mov r8, r0
	cmp r8, r2
	bge _08009500
	ldr r1, _08009514  @ gUnknown_080D751C
	mov r9, r1
	movs r2, #0xff
	mov sl, r2
_0800946A:
	ldrh r1, [r7]
	mov r0, sl
	ands r0, r1
	adds r0, #0x40
	lsls r0, r0, #1
	add r0, r9
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r0, r0, #4
	ldrh r1, [r7, #2]
	bl Div
	adds r6, r0, #0
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	ldrh r1, [r7]
	mov r0, sl
	ands r0, r1
	lsls r0, r0, #1
	add r0, r9
	movs r2, #0
	ldrsh r0, [r0, r2]
	negs r0, r0
	lsls r0, r0, #4
	ldrh r1, [r7, #4]
	bl Div
	adds r5, r0, #0
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	ldrh r1, [r7]
	mov r0, sl
	ands r0, r1
	lsls r0, r0, #1
	add r0, r9
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r0, r0, #4
	ldrh r1, [r7, #2]
	bl Div
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	ldrh r1, [r7]
	mov r0, sl
	ands r0, r1
	adds r0, #0x40
	lsls r0, r0, #1
	add r0, r9
	movs r2, #0
	ldrsh r0, [r0, r2]
	lsls r0, r0, #4
	ldrh r1, [r7, #4]
	bl Div
	adds r1, r0, #0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	ldr r0, [sp, #4]
	adds r0, #0x21
	ldrb r0, [r0]
	add r0, r8
	str r1, [sp]
	adds r1, r6, #0
	adds r2, r5, #0
	adds r3, r4, #0
	bl WriteOAMRotScaleData
	adds r7, #6
	movs r0, #1
	add r8, r0
	ldr r1, [sp, #8]
	cmp r8, r1
	blt _0800946A
_08009500:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08009510: .4byte 0x00007FFF
_08009514: .4byte gUnknown_080D751C

	THUMB_FUNC_START TCS_SetAnim
TCS_SetAnim: @ 0x08009518
	push {lr}
	adds r3, r0, #0
	cmp r3, #0
	beq _08009544
	ldr r2, [r3]
	cmp r2, #0
	beq _08009544
	ldrh r0, [r2, #2]
	lsrs r0, r0, #1
	lsls r0, r0, #1
	adds r0, r2, r0
	lsls r1, r1, #1
	adds r1, r1, r0
	ldrh r1, [r1]
	lsrs r1, r1, #1
	lsls r1, r1, #1
	adds r0, r0, r1
	str r0, [r3, #8]
	str r0, [r3, #0xc]
	adds r0, r3, #0
	bl TCS_ExecOneFrame
_08009544:
	pop {r0}
	bx r0

	THUMB_FUNC_START TCS_SetROMTCS
TCS_SetROMTCS: @ 0x08009548
	push {r4, lr}
	adds r4, r0, #0
	cmp r4, #0
	beq _08009562
	ldr r0, [r4]
	cmp r0, #0
	beq _08009562
	adds r0, r4, #0
	bl TCS_Load
	adds r0, r4, #0
	bl TCS_ExecOneFrame
_08009562:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_START TCS_QueueTileGfx
TCS_QueueTileGfx: @ 0x08009568
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r7, r0, #0
	cmp r7, #0
	beq _08009660
	ldr r0, [r7]
	cmp r0, #0
	beq _08009660
	ldr r0, [r7, #0x10]
	ldrh r6, [r0]
	adds r5, r0, #2
	adds r2, r6, #0
	lsls r1, r6, #1
	adds r1, r1, r6
	lsls r1, r1, #1
	adds r1, #2
	adds r0, r0, r1
	str r0, [sp]
	movs r0, #0
	mov r9, r0
	subs r6, #1
	adds r1, r7, #0
	adds r1, #0x20
	str r1, [sp, #4]
	cmp r2, #0
	ble _0800965A
	ldr r4, _08009614  @ gUnknown_085916A4
	mov sl, r4
	movs r0, #0xc0
	lsls r0, r0, #8
	mov r8, r0
_080095AE:
	ldr r1, [sp]
	ldrh r0, [r1]
	ldr r1, _08009618  @ 0x000003FF
	ands r1, r0
	lsls r1, r1, #5
	ldr r0, [r7, #0x24]
	adds r0, r0, r1
	ldrh r2, [r7, #0x22]
	ldr r1, _08009618  @ 0x000003FF
	ands r1, r2
	lsls r1, r1, #5
	ldr r2, _0800961C  @ 0x06010000
	add r2, r9
	adds r1, r1, r2
	ldrh r2, [r5]
	mov r3, r8
	ands r3, r2
	lsrs r3, r3, #0xc
	ldrh r4, [r5, #2]
	mov r2, r8
	ands r2, r4
	lsrs r2, r2, #0xe
	adds r3, r3, r2
	lsls r3, r3, #1
	mov r4, sl
	adds r2, r3, r4
	ldrb r2, [r2]
	adds r3, #1
	add r3, sl
	ldrb r3, [r3]
	bl RegisterObjectTileGraphics
	ldr r0, _08009620  @ gUnknown_03003080
	ldrb r1, [r0]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	bne _08009624
	ldrh r0, [r5]
	mov r1, r8
	ands r1, r0
	lsrs r1, r1, #0xc
	ldrh r2, [r5, #2]
	mov r0, r8
	ands r0, r2
	lsrs r0, r0, #0xe
	adds r1, r1, r0
	lsls r1, r1, #1
	add r1, sl
	ldrb r0, [r1]
	b _08009646
	.align 2, 0
_08009614: .4byte gUnknown_085916A4
_08009618: .4byte 0x000003FF
_0800961C: .4byte 0x06010000
_08009620: .4byte gUnknown_03003080
_08009624:
	ldrh r0, [r5]
	mov r1, r8
	ands r1, r0
	lsrs r1, r1, #0xc
	ldrh r2, [r5, #2]
	mov r0, r8
	ands r0, r2
	lsrs r0, r0, #0xe
	adds r1, r1, r0
	lsls r1, r1, #1
	add r1, sl
	ldrb r0, [r1]
	adds r1, r0, #0
	muls r1, r0, r1
	adds r0, r1, #0
	ldr r4, _08009670  @ 0x000003FF
	ands r0, r4
_08009646:
	lsls r0, r0, #5
	add r9, r0
	adds r5, #6
	ldr r0, [sp]
	adds r0, #2
	str r0, [sp]
	adds r0, r6, #0
	subs r6, #1
	cmp r0, #0
	bgt _080095AE
_0800965A:
	movs r0, #0
	ldr r1, [sp, #4]
	strb r0, [r1]
_08009660:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08009670: .4byte 0x000003FF

	THUMB_FUNC_START TCS_Load
TCS_Load: @ 0x08009674
	str r1, [r0]
	ldrh r2, [r1]
	lsrs r2, r2, #1
	lsls r2, r2, #1
	adds r2, r1, r2
	str r2, [r0, #4]
	ldrh r2, [r1, #2]
	lsrs r2, r2, #1
	lsls r2, r2, #1
	adds r1, r1, r2
	ldrh r2, [r1]
	lsrs r2, r2, #1
	lsls r2, r2, #1
	adds r1, r1, r2
	str r1, [r0, #8]
	str r1, [r0, #0xc]
	bx lr

	THUMB_FUNC_START TCS_ExecOneFrame
TCS_ExecOneFrame: @ 0x08009698
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r0, #0
	ldrh r5, [r4, #0x1a]
	strh r0, [r4, #0x18]
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r4, #0x1a]
	adds r0, r4, #0
	bl TCS_Exec
	strh r5, [r4, #0x1a]
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_START TCS_Init
TCS_Init: @ 0x080096B8
	push {r4, r5, lr}
	adds r4, r0, #0
	lsls r5, r2, #0x10
	lsrs r5, r5, #0x10
	bl TCS_Load
	movs r1, #0
	str r1, [r4, #0x24]
	movs r0, #0
	strh r1, [r4, #0x22]
	strh r1, [r4, #0x18]
	strh r5, [r4, #0x1e]
	str r1, [r4, #0x14]
	adds r2, r4, #0
	adds r2, #0x21
	strb r0, [r2]
	strh r1, [r4, #0x18]
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r4, #0x1a]
	strh r1, [r4, #0x1c]
	adds r0, r4, #0
	bl TCS_Exec
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_START TCS_Alloc
TCS_Alloc: @ 0x080096F0
	push {lr}
	adds r3, r0, #0
	movs r2, #0
	ldr r1, _08009704  @ gUnknown_03000108
_080096F8:
	ldr r0, [r1]
	cmp r0, r3
	bne _08009708
	adds r0, r1, #0
	b _08009712
	.align 2, 0
_08009704: .4byte gUnknown_03000108
_08009708:
	adds r1, #0x28
	adds r2, #1
	cmp r2, #0x13
	ble _080096F8
	movs r0, #0
_08009712:
	pop {r1}
	bx r1

	THUMB_FUNC_START TCSWrapper_New
TCSWrapper_New: @ 0x08009718
	push {r4, r5, r6, lr}
	mov r6, r9
	mov r5, r8
	push {r5, r6}
	mov r8, r1
	mov r9, r2
	adds r6, r3, #0
	ldr r5, [sp, #0x18]
	ldr r1, [sp, #0x1c]
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	bl TCS_New
	adds r4, r0, #0
	adds r1, r5, #0
	bl TCS_SetAnim
	strh r6, [r4, #0x22]
	ldr r0, _0800975C  @ gUnknown_0859168C
	movs r1, #3
	bl Proc_Create
	str r4, [r0, #0x50]
	mov r1, r8
	str r1, [r0, #0x54]
	mov r1, r9
	str r1, [r0, #0x58]
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0800975C: .4byte gUnknown_0859168C

	THUMB_FUNC_START TCSWrapper_OnUpdate
TCSWrapper_OnUpdate: @ 0x08009760
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x50]
	ldr r1, [r4, #0x54]
	ldr r2, [r4, #0x58]
	bl TCS_Update
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08009786
	ldr r0, [r4, #0x50]
	cmp r0, #0
	beq _08009780
	ldr r0, [r0]
	cmp r0, #0
	bne _08009786
_08009780:
	adds r0, r4, #0
	bl Proc_Delete
_08009786:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_START TCSWrapper_OnDelete
TCSWrapper_OnDelete: @ 0x0800978C
	push {lr}
	ldr r0, [r0, #0x50]
	bl TCS_Free
	pop {r0}
	bx r0

	THUMB_FUNC_START TCSWrapper_SetParameters
TCSWrapper_SetParameters: @ 0x08009798
	push {r4, lr}
	adds r4, r0, #0
	str r1, [r4, #0x54]
	str r2, [r4, #0x58]
	movs r0, #1
	negs r0, r0
	cmp r3, r0
	beq _080097AC
	ldr r0, [r4, #0x50]
	strh r3, [r0, #0x22]
_080097AC:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_START TCSWrapper_Delete
TCSWrapper_Delete: @ 0x080097B4
	push {lr}
	bl Proc_Delete
	pop {r0}
	bx r0

	THUMB_FUNC_START DeleteAllTCSWrappers
DeleteAllTCSWrappers: @ 0x080097C0
	push {lr}
	ldr r0, _080097CC  @ gUnknown_0859168C
	bl Proc_DeleteAllWithScript
	pop {r0}
	bx r0
	.align 2, 0
_080097CC: .4byte gUnknown_0859168C

	THUMB_FUNC_START DoesTCSWrapperExist
DoesTCSWrapperExist: @ 0x080097D0
	push {lr}
	ldr r0, _080097E4  @ gUnknown_0859168C
	bl Proc_Find
	cmp r0, #0
	beq _080097DE
	movs r0, #1
_080097DE:
	pop {r1}
	bx r1
	.align 2, 0
_080097E4: .4byte gUnknown_0859168C
