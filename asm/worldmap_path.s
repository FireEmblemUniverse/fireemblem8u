	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	THUMB_FUNC_START nullsub_38
nullsub_38: @ 0x080BBEB4
	bx lr

	THUMB_FUNC_END nullsub_38

	THUMB_FUNC_START sub_80BBEB8
sub_80BBEB8: @ 0x080BBEB8
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r4, #0
	adds r5, #0x31
	movs r1, #0
	movs r0, #4
	strb r0, [r5]
	adds r0, r4, #0
	adds r0, #0x32
	strb r1, [r0]
	adds r1, r4, #0
	adds r1, #0x33
	movs r0, #0xff
	strb r0, [r1]
	adds r1, #1
	movs r0, #2
	strb r0, [r1]
	adds r1, #1
	movs r0, #1
	strb r0, [r1]
	bl BG_GetPriority
	adds r1, r4, #0
	adds r1, #0x3a
	strb r0, [r1]
	subs r1, #4
	ldr r0, [r4, #0x14]
	ldrh r0, [r0, #0x34]
	strb r0, [r1]
	adds r1, #1
	ldr r0, [r4, #0x14]
	ldrh r0, [r0, #0x36]
	strb r0, [r1]
	adds r0, r4, #0
	adds r0, #0x39
	movs r1, #0xfe
	strb r1, [r0]
	subs r0, #1
	strb r1, [r0]
	adds r0, r4, #0
	bl sub_80BBC54
	ldrb r1, [r5]
	movs r0, #3
	orrs r0, r1
	strb r0, [r5]
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80BBEB8

	THUMB_FUNC_START sub_80BBF1C
sub_80BBF1C: @ 0x080BBF1C
	push {r4, r5, r6, r7, lr}
	adds r3, r0, #0
	lsls r1, r1, #0x10
	lsrs r5, r1, #0x10
	cmp r2, #0
	ble _080BBF50
	ldr r0, _080BBF58  @ 0x0000F3FF
	mov ip, r0
	ldr r0, _080BBF5C  @ 0xFFFFF3FF
	adds r6, r0, #0
	movs r7, #0xc0
	lsls r7, r7, #4
	adds r4, r2, #0
_080BBF36:
	ldrh r2, [r3]
	mov r1, ip
	ands r1, r2
	adds r1, r5, r1
	ands r1, r6
	adds r0, r7, #0
	ands r0, r2
	orrs r1, r0
	strh r1, [r3]
	adds r3, #2
	subs r4, #1
	cmp r4, #0
	bne _080BBF36
_080BBF50:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BBF58: .4byte 0x0000F3FF
_080BBF5C: .4byte 0xFFFFF3FF

	THUMB_FUNC_END sub_80BBF1C

	THUMB_FUNC_START sub_80BBF60
sub_80BBF60: @ 0x080BBF60
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	sub sp, #8
	adds r7, r0, #0
	adds r0, #0x31
	ldrb r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	bne _080BBF7A
	b _080BC0AA
_080BBF7A:
	adds r6, r7, #0
	adds r6, #0x36
	ldrb r0, [r6]
	adds r5, r7, #0
	adds r5, #0x38
	strb r0, [r5]
	adds r4, r7, #0
	adds r4, #0x37
	ldrb r0, [r4]
	adds r3, r7, #0
	adds r3, #0x39
	strb r0, [r3]
	add r2, sp, #4
	ldr r1, [r7, #0x14]
	ldrh r0, [r1, #0x34]
	strh r0, [r2]
	adds r2, #2
	ldrh r0, [r1, #0x36]
	strh r0, [r2]
	add r0, sp, #4
	movs r1, #0
	ldrsh r0, [r0, r1]
	mov r8, r6
	mov ip, r5
	adds r6, r4, #0
	mov r9, r2
	cmp r0, #0
	bge _080BBFB4
	adds r0, #7
_080BBFB4:
	asrs r0, r0, #3
	mov r2, r8
	strb r0, [r2]
	mov r4, r9
	movs r1, #0
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bge _080BBFC6
	adds r0, #7
_080BBFC6:
	asrs r0, r0, #3
	strb r0, [r6]
	ldrh r0, [r7, #0x36]
	adds r5, r7, #0
	adds r5, #0x34
	ldrh r2, [r7, #0x38]
	cmp r0, r2
	beq _080BC054
	mov r4, r8
	movs r2, #0
	ldrsb r2, [r4, r2]
	mov r1, ip
	movs r0, #0
	ldrsb r0, [r1, r0]
	subs r1, r2, r0
	cmp r1, #0
	blt _080BBFEE
	cmp r1, #1
	bgt _080BC00E
	b _080BBFF4
_080BBFEE:
	subs r0, r0, r2
	cmp r0, #1
	bgt _080BC00E
_080BBFF4:
	movs r2, #0
	ldrsb r2, [r6, r2]
	movs r0, #0
	ldrsb r0, [r3, r0]
	subs r1, r2, r0
	cmp r1, #0
	blt _080BC008
	cmp r1, #1
	bgt _080BC00E
	b _080BC02C
_080BC008:
	subs r0, r0, r2
	cmp r0, #1
	ble _080BC02C
_080BC00E:
	mov r2, r8
	movs r0, #0
	ldrsb r0, [r2, r0]
	movs r1, #0
	ldrsb r1, [r6, r1]
	adds r4, r7, #0
	adds r4, #0x34
	ldrb r2, [r4]
	bl sub_80BBCC8
	ldrb r0, [r4]
	bl BG_EnableSync
	adds r5, r4, #0
	b _080BC054
_080BC02C:
	mov r4, r8
	movs r0, #0
	ldrsb r0, [r4, r0]
	movs r1, #0
	ldrsb r1, [r6, r1]
	mov r4, ip
	movs r2, #0
	ldrsb r2, [r4, r2]
	ldrb r3, [r3]
	lsls r3, r3, #0x18
	asrs r3, r3, #0x18
	adds r5, r7, #0
	adds r5, #0x34
	ldrb r4, [r5]
	str r4, [sp]
	bl sub_80BBDA4
	ldrb r0, [r5]
	bl BG_EnableSync
_080BC054:
	adds r4, r7, #0
	adds r4, #0x31
	ldrb r1, [r4]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080BC070
	adds r0, r7, #0
	bl sub_80BBC54
	ldrb r1, [r4]
	movs r0, #0xfd
	ands r0, r1
	strb r0, [r4]
_080BC070:
	ldrb r1, [r4]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080BC098
	mov r1, r8
	movs r0, #0
	ldrsb r0, [r1, r0]
	movs r1, #0
	ldrsb r1, [r6, r1]
	ldrb r2, [r5]
	bl sub_80BBCC8
	ldrb r0, [r5]
	bl BG_EnableSync
	ldrb r1, [r4]
	movs r0, #0xfe
	ands r0, r1
	strb r0, [r4]
_080BC098:
	ldrb r0, [r5]
	add r1, sp, #4
	ldrh r2, [r1]
	ldr r1, _080BC0B8  @ 0x000001FF
	ands r1, r2
	mov r3, r9
	ldrb r2, [r3]
	bl BG_SetPosition
_080BC0AA:
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BC0B8: .4byte 0x000001FF

	THUMB_FUNC_END sub_80BBF60

	THUMB_FUNC_START MapRoute_StartTransition
MapRoute_StartTransition: @ 0x080BC0BC
	push {r4, lr}
	adds r4, r0, #0
	adds r4, #0x35
	ldrb r0, [r4]
	bl BG_GetMapBuffer
	movs r1, #0
	bl BG_Fill
	ldrb r0, [r4]
	bl BG_EnableSync
	ldr r0, _080BC0F0  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080BC0E8
	movs r0, #0xc4
	lsls r0, r0, #2
	bl m4aSongNumStart
_080BC0E8:
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080BC0F0: .4byte gPlaySt

	THUMB_FUNC_END MapRoute_StartTransition

	THUMB_FUNC_START sub_80BC0F4
sub_80BC0F4: @ 0x080BC0F4
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	movs r0, #1
	movs r1, #0
	movs r2, #0x10
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	ldr r2, _080BC174  @ gUnknown_030030BC
	ldrh r0, [r2]
	ldr r1, _080BC178  @ 0x0000FFC0
	ands r1, r0
	adds r5, r4, #0
	adds r5, #0x35
	movs r0, #1
	ldrb r3, [r5]
	lsls r0, r3
	orrs r1, r0
	ldr r0, _080BC17C  @ 0x0000C0FF
	ands r1, r0
	movs r3, #0x80
	lsls r3, r3, #4
	adds r0, r3, #0
	orrs r1, r0
	strh r1, [r2]
	adds r0, r4, #0
	bl sub_80BBC54
	adds r0, r4, #0
	adds r0, #0x36
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r1, r4, #0
	adds r1, #0x37
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	ldrb r2, [r5]
	bl sub_80BBCC8
	mov r2, sp
	ldr r1, [r4, #0x14]
	ldrh r0, [r1, #0x34]
	strh r0, [r2]
	mov r0, sp
	adds r0, #2
	ldrh r3, [r1, #0x36]
	strh r3, [r0]
	ldrb r0, [r5]
	mov r1, sp
	ldrh r2, [r1]
	ldr r1, _080BC180  @ 0x000001FF
	ands r1, r2
	movs r2, #0xff
	ands r2, r3
	bl BG_SetPosition
	movs r0, #0
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080BC174: .4byte gUnknown_030030BC
_080BC178: .4byte 0x0000FFC0
_080BC17C: .4byte 0x0000C0FF
_080BC180: .4byte 0x000001FF

	THUMB_FUNC_END sub_80BC0F4

	THUMB_FUNC_START MapRoute_EnableBGSyncs
MapRoute_EnableBGSyncs: @ 0x080BC184
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r6, r4, #0
	adds r6, #0x35
	ldrb r5, [r6]
	movs r0, #3
	bl BG_GetPriority
	adds r1, r0, #0
	adds r0, r5, #0
	bl BG_SetPriority
	movs r1, #1
	adds r0, r1, #0
	ldrb r6, [r6]
	lsls r0, r6
	adds r4, #0x34
	ldrb r4, [r4]
	lsls r1, r4
	orrs r0, r1
	bl BG_EnableSyncByMask
	movs r0, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	THUMB_FUNC_END MapRoute_EnableBGSyncs

	THUMB_FUNC_START MapRoute_TransitionLoop
MapRoute_TransitionLoop: @ 0x080BC1B8
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldrh r0, [r6, #0x3e]
	adds r0, #1
	strh r0, [r6, #0x3e]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x3c
	ldrsh r1, [r6, r2]
	cmp r0, r1
	bge _080BC1F2
	movs r1, #0x3e
	ldrsh r0, [r6, r1]
	lsls r0, r0, #4
	movs r2, #0x3c
	ldrsh r1, [r6, r2]
	bl __divsi3
	lsls r1, r0, #0x18
	lsrs r1, r1, #0x18
	movs r2, #0x10
	subs r2, r2, r0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	movs r0, #1
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	b _080BC220
_080BC1F2:
	adds r0, r6, #0
	adds r0, #0x35
	ldrb r0, [r0]
	bl BG_GetMapBuffer
	adds r5, r0, #0
	adds r4, r6, #0
	adds r4, #0x34
	ldrb r0, [r4]
	bl BG_GetMapBuffer
	adds r1, r0, #0
	movs r2, #0x80
	lsls r2, r2, #2
	adds r0, r5, #0
	bl CpuFastSet
	ldrb r0, [r4]
	bl BG_EnableSync
	adds r0, r6, #0
	bl Proc_Break
_080BC220:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END MapRoute_TransitionLoop

	THUMB_FUNC_START MapRoute_TransitionEnd
MapRoute_TransitionEnd: @ 0x080BC228
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r5, #0
	adds r4, #0x35
	ldrb r0, [r4]
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	ldrb r0, [r4]
	bl BG_GetMapBuffer
	movs r1, #0
	bl BG_Fill
	ldrb r0, [r4]
	adds r1, r5, #0
	adds r1, #0x3a
	ldrb r1, [r1]
	bl BG_SetPriority
	adds r2, r5, #0
	adds r2, #0x34
	movs r1, #1
	adds r0, r1, #0
	ldrb r2, [r2]
	lsls r0, r2
	ldrb r4, [r4]
	lsls r1, r4
	orrs r0, r1
	bl BG_EnableSyncByMask
	bl SetDefaultColorEffects
	ldr r2, _080BC290  @ gUnknown_030030BC
	ldrh r1, [r2]
	ldr r0, _080BC294  @ 0x0000FFC0
	ands r0, r1
	ldr r1, _080BC298  @ 0x0000C0FF
	ands r0, r1
	strh r0, [r2]
	adds r2, r5, #0
	adds r2, #0x32
	ldrb r1, [r2]
	movs r0, #0xfe
	ands r0, r1
	strb r0, [r2]
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080BC290: .4byte gUnknown_030030BC
_080BC294: .4byte 0x0000FFC0
_080BC298: .4byte 0x0000C0FF

	THUMB_FUNC_END MapRoute_TransitionEnd

	THUMB_FUNC_START MapRoute_BeginRouteTransition
MapRoute_BeginRouteTransition: @ 0x080BC29C
	push {lr}
	adds r2, r0, #0
	cmp r1, #1
	bgt _080BC2BC
	adds r3, r2, #0
	adds r3, #0x31
	ldrb r1, [r3]
	movs r0, #3
	orrs r0, r1
	strb r0, [r3]
	adds r2, #0x32
	ldrb r1, [r2]
	movs r0, #0xfe
	ands r0, r1
	strb r0, [r2]
	b _080BC2D6
_080BC2BC:
	movs r0, #0
	strh r1, [r2, #0x3c]
	strh r0, [r2, #0x3e]
	adds r3, r2, #0
	adds r3, #0x32
	ldrb r1, [r3]
	movs r0, #1
	orrs r0, r1
	strb r0, [r3]
	adds r0, r2, #0
	movs r1, #1
	bl Proc_Goto
_080BC2D6:
	pop {r0}
	bx r0

	THUMB_FUNC_END MapRoute_BeginRouteTransition

	THUMB_FUNC_START MapRoute_80BC2DC
MapRoute_80BC2DC: @ 0x080BC2DC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r6, r0, #0
	adds r7, r6, #0
	adds r7, #0x32
	ldrb r1, [r7]
	movs r0, #1
	mov r8, r0
	ands r0, r1
	cmp r0, #0
	beq _080BC38A
	mov r2, sp
	ldr r1, [r6, #0x14]
	ldrh r0, [r1, #0x34]
	strh r0, [r2]
	mov r4, sp
	adds r4, #2
	ldrh r0, [r1, #0x36]
	strh r0, [r4]
	adds r0, r6, #0
	bl sub_80BBC54
	mov r0, sp
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bge _080BC318
	adds r0, #7
_080BC318:
	asrs r0, r0, #3
	movs r2, #0
	ldrsh r1, [r4, r2]
	cmp r1, #0
	bge _080BC324
	adds r1, #7
_080BC324:
	asrs r1, r1, #3
	adds r4, r6, #0
	adds r4, #0x34
	ldrb r2, [r4]
	bl sub_80BBCC8
	adds r5, r6, #0
	adds r5, #0x35
	ldrb r0, [r5]
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	ldrb r0, [r5]
	bl BG_GetMapBuffer
	movs r1, #0
	bl BG_Fill
	ldrb r0, [r5]
	adds r1, r6, #0
	adds r1, #0x3a
	ldrb r1, [r1]
	bl BG_SetPriority
	mov r0, r8
	ldrb r4, [r4]
	lsls r0, r4
	mov r1, r8
	ldrb r5, [r5]
	lsls r1, r5
	orrs r0, r1
	bl BG_EnableSyncByMask
	bl SetDefaultColorEffects
	ldr r2, _080BC398  @ gUnknown_030030BC
	ldrh r1, [r2]
	ldr r0, _080BC39C  @ 0x0000FFC0
	ands r0, r1
	ldr r1, _080BC3A0  @ 0x0000C0FF
	ands r0, r1
	strh r0, [r2]
	ldrb r1, [r7]
	movs r0, #0xfe
	ands r0, r1
	strb r0, [r7]
	adds r0, r6, #0
	movs r1, #0
	bl Proc_Goto
_080BC38A:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BC398: .4byte gUnknown_030030BC
_080BC39C: .4byte 0x0000FFC0
_080BC3A0: .4byte 0x0000C0FF

	THUMB_FUNC_END MapRoute_80BC2DC

	THUMB_FUNC_START NewMapRoute
NewMapRoute: @ 0x080BC3A4
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r4, r0, #0
	mov r8, r1
	adds r5, r2, #0
	adds r6, r3, #0
	ldr r0, _080BC3D0  @ gUnknown_08A3DFC4
	adds r1, r4, #0
	bl Proc_Start
	str r5, [r0, #0x2c]
	adds r1, r0, #0
	adds r1, #0x30
	strb r6, [r1]
	mov r1, r8
	str r1, [r0, #0x40]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_080BC3D0: .4byte gUnknown_08A3DFC4

	THUMB_FUNC_END NewMapRoute

	THUMB_FUNC_START sub_80BC3D4
sub_80BC3D4: @ 0x080BC3D4
	push {lr}
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _080BC3EC  @ gUnknown_08206674
	adds r1, r1, r0
	ldr r1, [r1, #8]
	cmp r1, #0
	bne _080BC3F0
	movs r0, #0
	b _080BC400
	.align 2, 0
_080BC3EC: .4byte gUnknown_08206674
_080BC3F0:
	movs r2, #0
	b _080BC3F8
_080BC3F4:
	adds r1, #8
	adds r2, #1
_080BC3F8:
	ldr r0, [r1]
	cmp r0, #0
	bge _080BC3F4
	adds r0, r2, #0
_080BC400:
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80BC3D4

	THUMB_FUNC_START sub_80BC404
sub_80BC404: @ 0x080BC404
	push {r4, lr}
	adds r4, r0, #0
	adds r4, #0x34
	ldrb r0, [r4]
	bl BG_GetMapBuffer
	movs r1, #0
	bl BG_Fill
	movs r0, #1
	ldrb r4, [r4]
	lsls r0, r4
	bl BG_EnableSyncByMask
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80BC404

	THUMB_FUNC_START sub_80BC428
sub_80BC428: @ 0x080BC428
	push {r4, r5, r6, lr}
	movs r4, #0
	adds r1, r0, #0
	adds r1, #0x60
	ldrb r2, [r1]
	cmp r4, r2
	bge _080BC44E
	adds r6, r0, #0
	adds r6, #0x34
	adds r5, r1, #0
_080BC43C:
	ldm r6!, {r0}
	adds r0, #0x34
	movs r1, #0
	bl Text_SetCursor
	adds r4, #1
	ldrb r0, [r5]
	cmp r4, r0
	blt _080BC43C
_080BC44E:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80BC428

	THUMB_FUNC_START sub_80BC454
sub_80BC454: @ 0x080BC454
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _080BC47C  @ gGMData
	movs r0, #0
	strb r0, [r1, #1]
	ldr r0, _080BC480  @ gUnknown_0201AFC0
	ldr r1, _080BC484  @ 0x06001000
	movs r2, #0x80
	movs r3, #0
	bl InitTextFont
	ldr r0, _080BC488  @ gUnknown_08A3E124
	ldr r1, _080BC48C  @ gUnknown_08A3E148
	ldr r1, [r1]
	adds r2, r4, #0
	bl StartMenuAt
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080BC47C: .4byte gGMData
_080BC480: .4byte gUnknown_0201AFC0
_080BC484: .4byte 0x06001000
_080BC488: .4byte gUnknown_08A3E124
_080BC48C: .4byte gUnknown_08A3E148

	THUMB_FUNC_END sub_80BC454

	THUMB_FUNC_START sub_80BC490
sub_80BC490: @ 0x080BC490
	push {lr}
	movs r0, #1
	bl BG_EnableSyncByMask
	movs r0, #0
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80BC490

	THUMB_FUNC_START sub_80BC4A0
sub_80BC4A0: @ 0x080BC4A0
	push {lr}
	bl ClearBg0Bg1
	movs r0, #0
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80BC4A0

	THUMB_FUNC_START sub_80BC4AC
sub_80BC4AC: @ 0x080BC4AC
	push {lr}
	ldr r0, _080BC4C0  @ gUnknown_08A3D748
	bl Proc_Find
	movs r1, #3
	bl Proc_Goto
	movs r0, #0x1b
	pop {r1}
	bx r1
	.align 2, 0
_080BC4C0: .4byte gUnknown_08A3D748

	THUMB_FUNC_END sub_80BC4AC

	THUMB_FUNC_START sub_80BC4C4
sub_80BC4C4: @ 0x080BC4C4
	push {lr}
	ldr r0, _080BC4D8  @ gUnknown_08A3D748
	bl Proc_Find
	movs r1, #9
	bl Proc_Goto
	movs r0, #0x17
	pop {r1}
	bx r1
	.align 2, 0
_080BC4D8: .4byte gUnknown_08A3D748

	THUMB_FUNC_END sub_80BC4C4

	THUMB_FUNC_START sub_80BC4DC
sub_80BC4DC: @ 0x080BC4DC
	push {lr}
	ldr r0, _080BC4F0  @ gUnknown_08A3D748
	bl Proc_Find
	movs r1, #0xc
	bl Proc_Goto
	movs r0, #0x17
	pop {r1}
	bx r1
	.align 2, 0
_080BC4F0: .4byte gUnknown_08A3D748

	THUMB_FUNC_END sub_80BC4DC

	THUMB_FUNC_START sub_80BC4F4
sub_80BC4F4: @ 0x080BC4F4
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r5, r1, #0
	adds r1, r6, #0
	adds r1, #0x63
	ldrb r2, [r1]
	movs r1, #8
	ands r1, r2
	cmp r1, #0
	bne _080BC566
	bl sub_80CF480
	lsls r0, r0, #0x18
	adds r4, r5, #0
	adds r4, #0x34
	cmp r0, #0
	bne _080BC51E
	adds r0, r4, #0
	movs r1, #4
	bl Text_SetColor
_080BC51E:
	adds r0, r5, #0
	adds r0, #0x3d
	ldrb r0, [r0]
	cmp r0, #2
	bne _080BC530
	adds r0, r4, #0
	movs r1, #1
	bl Text_SetColor
_080BC530:
	ldr r0, [r5, #0x30]
	ldrh r0, [r0, #4]
	bl GetStringFromIndex
	adds r1, r0, #0
	adds r0, r4, #0
	bl Text_DrawString
	adds r0, r6, #0
	adds r0, #0x64
	ldrb r0, [r0]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1e
	bl BG_GetMapBuffer
	adds r1, r0, #0
	movs r2, #0x2c
	ldrsh r0, [r5, r2]
	lsls r0, r0, #5
	movs r3, #0x2a
	ldrsh r2, [r5, r3]
	adds r0, r0, r2
	lsls r0, r0, #1
	adds r1, r1, r0
	adds r0, r4, #0
	bl PutText
_080BC566:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80BC4F4

	THUMB_FUNC_START sub_80BC56C
sub_80BC56C: @ 0x080BC56C
	push {lr}
	ldr r0, _080BC580  @ gUnknown_08A3D748
	bl Proc_Find
	movs r1, #0xa
	bl Proc_Goto
	movs r0, #0x17
	pop {r1}
	bx r1
	.align 2, 0
_080BC580: .4byte gUnknown_08A3D748

	THUMB_FUNC_END sub_80BC56C

	THUMB_FUNC_START sub_80BC584
sub_80BC584: @ 0x080BC584
	push {lr}
	ldr r0, _080BC598  @ gUnknown_08A3D748
	bl Proc_Find
	movs r1, #0xb
	bl Proc_Goto
	movs r0, #0x17
	pop {r1}
	bx r1
	.align 2, 0
_080BC598: .4byte gUnknown_08A3D748

	THUMB_FUNC_END sub_80BC584

	THUMB_FUNC_START sub_80BC59C
sub_80BC59C: @ 0x080BC59C
	push {lr}
	ldr r0, _080BC5B0  @ gUnknown_08A3D748
	bl Proc_Find
	movs r1, #0xd
	bl Proc_Goto
	movs r0, #0x17
	pop {r1}
	bx r1
	.align 2, 0
_080BC5B0: .4byte gUnknown_08A3D748

	THUMB_FUNC_END sub_80BC59C

	THUMB_FUNC_START sub_80BC5B4
sub_80BC5B4: @ 0x080BC5B4
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _080BC5E0  @ gGMData
	movs r0, #0
	strb r0, [r4, #1]
	ldr r0, _080BC5E4  @ gUnknown_0201AFC0
	ldr r1, _080BC5E8  @ 0x06001000
	movs r2, #0x80
	movs r3, #0
	bl InitTextFont
	ldr r0, [r4, #8]
	asrs r0, r0, #8
	movs r2, #2
	ldrsh r1, [r4, r2]
	subs r0, r0, r1
	cmp r0, #0x97
	bgt _080BC5F4
	ldr r0, _080BC5EC  @ gUnknown_08A3E200
	ldr r1, _080BC5F0  @ gUnknown_08A3E224
	b _080BC5F8
	.align 2, 0
_080BC5E0: .4byte gGMData
_080BC5E4: .4byte gUnknown_0201AFC0
_080BC5E8: .4byte 0x06001000
_080BC5EC: .4byte gUnknown_08A3E200
_080BC5F0: .4byte gUnknown_08A3E224
_080BC5F4:
	ldr r0, _080BC618  @ gUnknown_08A3E200
	ldr r1, _080BC61C  @ gUnknown_08A3E228
_080BC5F8:
	ldr r1, [r1]
	adds r2, r5, #0
	bl StartMenuAt
	adds r3, r0, #0
	ldr r0, _080BC620  @ gGMData
	adds r0, #0xcd
	adds r1, r3, #0
	adds r1, #0x60
	ldrb r2, [r0]
	ldrb r0, [r1]
	cmp r2, r0
	bcs _080BC624
	adds r1, #1
	strb r2, [r1]
	b _080BC62C
	.align 2, 0
_080BC618: .4byte gUnknown_08A3E200
_080BC61C: .4byte gUnknown_08A3E228
_080BC620: .4byte gGMData
_080BC624:
	subs r0, #1
	adds r2, r3, #0
	adds r2, #0x61
	strb r0, [r2]
_080BC62C:
	adds r0, r3, #0
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80BC5B4

	THUMB_FUNC_START sub_80BC634
sub_80BC634: @ 0x080BC634
	push {lr}
	movs r0, #1
	bl BG_EnableSyncByMask
	movs r0, #0
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80BC634

	THUMB_FUNC_START sub_80BC644
sub_80BC644: @ 0x080BC644
	push {lr}
	bl ClearBg0Bg1
	movs r0, #0
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80BC644

	THUMB_FUNC_START sub_80BC650
sub_80BC650: @ 0x080BC650
	push {lr}
	ldr r0, _080BC66C  @ gGMData
	adds r0, #0xcd
	movs r1, #0
	strb r1, [r0]
	ldr r0, _080BC670  @ gUnknown_08A3D748
	bl Proc_Find
	movs r1, #3
	bl Proc_Goto
	movs r0, #0x1b
	pop {r1}
	bx r1
	.align 2, 0
_080BC66C: .4byte gGMData
_080BC670: .4byte gUnknown_08A3D748

	THUMB_FUNC_END sub_80BC650

	THUMB_FUNC_START sub_80BC674
sub_80BC674: @ 0x080BC674
	push {lr}
	ldr r1, _080BC69C  @ gGMData
	ldrb r2, [r1, #0x11]
	lsls r0, r2, #2
	adds r0, r0, r1
	adds r0, #0x30
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _080BC6A4
	lsls r0, r2, #5
	ldr r1, _080BC6A0  @ gUnknown_082060B0
	adds r0, r0, r1
	ldr r0, [r0, #0xc]
	ldrh r0, [r0]
	cmp r0, #0
	beq _080BC6A4
	movs r0, #1
	b _080BC6A6
	.align 2, 0
_080BC69C: .4byte gGMData
_080BC6A0: .4byte gUnknown_082060B0
_080BC6A4:
	movs r0, #3
_080BC6A6:
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80BC674

	THUMB_FUNC_START sub_80BC6AC
sub_80BC6AC: @ 0x080BC6AC
	push {lr}
	ldr r1, _080BC6D4  @ gGMData
	ldrb r2, [r1, #0x11]
	lsls r0, r2, #2
	adds r0, r0, r1
	adds r0, #0x30
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _080BC6DC
	lsls r0, r2, #5
	ldr r1, _080BC6D8  @ gUnknown_082060B0
	adds r0, r0, r1
	ldr r0, [r0, #0x10]
	ldrh r0, [r0]
	cmp r0, #0
	beq _080BC6DC
	movs r0, #1
	b _080BC6DE
	.align 2, 0
_080BC6D4: .4byte gGMData
_080BC6D8: .4byte gUnknown_082060B0
_080BC6DC:
	movs r0, #3
_080BC6DE:
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80BC6AC

	THUMB_FUNC_START sub_80BC6E4
sub_80BC6E4: @ 0x080BC6E4
	push {lr}
	ldr r1, _080BC718  @ gGMData
	ldrb r2, [r1, #0x11]
	lsls r0, r2, #2
	adds r0, r0, r1
	adds r0, #0x30
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _080BC724
	lsls r0, r2, #5
	ldr r1, _080BC71C  @ gUnknown_082060B0
	adds r0, r0, r1
	ldr r0, [r0, #0x14]
	ldrh r0, [r0]
	cmp r0, #0
	beq _080BC724
	ldr r0, _080BC720  @ gPlaySt
	ldrb r1, [r0, #0x14]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _080BC724
	movs r0, #1
	b _080BC726
	.align 2, 0
_080BC718: .4byte gGMData
_080BC71C: .4byte gUnknown_082060B0
_080BC720: .4byte gPlaySt
_080BC724:
	movs r0, #3
_080BC726:
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80BC6E4

	THUMB_FUNC_START sub_80BC72C
sub_80BC72C: @ 0x080BC72C
	push {lr}
	ldr r1, _080BC748  @ gGMData
	ldrb r0, [r1, #0x11]
	lsls r0, r0, #2
	adds r0, r0, r1
	adds r0, #0x30
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080BC74C
	movs r0, #3
	b _080BC74E
	.align 2, 0
_080BC748: .4byte gGMData
_080BC74C:
	movs r0, #1
_080BC74E:
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80BC72C

	THUMB_FUNC_START sub_80BC754
sub_80BC754: @ 0x080BC754
	push {lr}
	ldr r1, _080BC770  @ gGMData
	ldrb r0, [r1, #0x11]
	lsls r0, r0, #2
	adds r0, r0, r1
	adds r0, #0x30
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _080BC774
	movs r0, #3
	b _080BC776
	.align 2, 0
_080BC770: .4byte gGMData
_080BC774:
	movs r0, #1
_080BC776:
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80BC754

	THUMB_FUNC_START sub_80BC77C
sub_80BC77C: @ 0x080BC77C
	push {lr}
	ldr r1, _080BC79C  @ gGMData
	adds r0, #0x61
	ldrb r0, [r0]
	adds r1, #0xcd
	strb r0, [r1]
	ldr r0, _080BC7A0  @ gUnknown_08A3D748
	bl Proc_Find
	movs r1, #0x13
	bl Proc_Goto
	movs r0, #0x17
	pop {r1}
	bx r1
	.align 2, 0
_080BC79C: .4byte gGMData
_080BC7A0: .4byte gUnknown_08A3D748

	THUMB_FUNC_END sub_80BC77C

	THUMB_FUNC_START sub_80BC7A4
sub_80BC7A4: @ 0x080BC7A4
	push {lr}
	ldr r1, _080BC7C4  @ gGMData
	adds r0, #0x61
	ldrb r0, [r0]
	adds r1, #0xcd
	strb r0, [r1]
	ldr r0, _080BC7C8  @ gUnknown_08A3D748
	bl Proc_Find
	movs r1, #0x14
	bl Proc_Goto
	movs r0, #0x17
	pop {r1}
	bx r1
	.align 2, 0
_080BC7C4: .4byte gGMData
_080BC7C8: .4byte gUnknown_08A3D748

	THUMB_FUNC_END sub_80BC7A4

	THUMB_FUNC_START sub_80BC7CC
sub_80BC7CC: @ 0x080BC7CC
	push {lr}
	ldr r1, _080BC7EC  @ gGMData
	adds r0, #0x61
	ldrb r0, [r0]
	adds r1, #0xcd
	strb r0, [r1]
	ldr r0, _080BC7F0  @ gUnknown_08A3D748
	bl Proc_Find
	movs r1, #0x15
	bl Proc_Goto
	movs r0, #0x17
	pop {r1}
	bx r1
	.align 2, 0
_080BC7EC: .4byte gGMData
_080BC7F0: .4byte gUnknown_08A3D748

	THUMB_FUNC_END sub_80BC7CC

	THUMB_FUNC_START sub_80BC7F4
sub_80BC7F4: @ 0x080BC7F4
	push {lr}
	ldr r1, _080BC814  @ gGMData
	adds r0, #0x61
	ldrb r0, [r0]
	adds r1, #0xcd
	strb r0, [r1]
	ldr r0, _080BC818  @ gUnknown_08A3D748
	bl Proc_Find
	movs r1, #0x16
	bl Proc_Goto
	movs r0, #0x17
	pop {r1}
	bx r1
	.align 2, 0
_080BC814: .4byte gGMData
_080BC818: .4byte gUnknown_08A3D748

	THUMB_FUNC_END sub_80BC7F4

	THUMB_FUNC_START sub_80BC81C
sub_80BC81C: @ 0x080BC81C
	push {r4, r5, r6, lr}
	sub sp, #4
	movs r0, #0
	str r0, [sp]
	ldr r4, _080BC890  @ gGMData
	ldr r2, _080BC894  @ 0x05000035
	mov r0, sp
	adds r1, r4, #0
	bl CpuSet
	adds r0, r4, #0
	adds r0, #0xa4
	bl sub_80BC898
	movs r5, #0
	movs r6, #0xfd
	adds r2, r4, #0
	adds r2, #0x10
	movs r3, #6
_080BC842:
	strh r5, [r2, #2]
	ldrb r1, [r2]
	adds r0, r6, #0
	ands r0, r1
	strb r0, [r2]
	adds r2, #4
	subs r3, #1
	cmp r3, #0
	bge _080BC842
	movs r3, #0
	movs r0, #1
	strh r0, [r4, #0x12]
	ldrb r1, [r4, #0x10]
	movs r0, #0xfd
	ands r0, r1
	strb r0, [r4, #0x10]
	strb r3, [r4, #0x11]
	adds r2, r4, #0
	adds r2, #0x30
	ldrb r1, [r2]
	movs r0, #2
	orrs r0, r1
	strb r0, [r2]
	ldrb r0, [r4]
	movs r1, #4
	orrs r0, r1
	movs r1, #0x30
	orrs r0, r1
	strb r0, [r4]
	adds r0, r4, #0
	adds r0, #0xcd
	strb r3, [r0]
	adds r0, #1
	bl StoreRNState
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080BC890: .4byte gGMData
_080BC894: .4byte 0x05000035

	THUMB_FUNC_END sub_80BC81C

	THUMB_FUNC_START sub_80BC898
sub_80BC898: @ 0x080BC898
	push {r4, lr}
	adds r3, r0, #0
	movs r2, #0
	movs r4, #0xff
_080BC8A0:
	adds r1, r3, r2
	ldrb r0, [r1]
	orrs r0, r4
	strb r0, [r1]
	adds r2, #1
	cmp r2, #0x1f
	bls _080BC8A0
	adds r1, r3, #0
	adds r1, #0x20
	movs r0, #0
	strb r0, [r1]
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80BC898

.align 2, 0
