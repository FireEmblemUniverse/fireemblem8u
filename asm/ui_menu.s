	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	@ UI "Menu" Framework

	THUMB_FUNC_START Menu_HandleDirectionInputs
Menu_HandleDirectionInputs: @ 0x0804F294
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r2, r5, #0
	adds r2, #0x61
	ldrb r0, [r2]
	adds r1, r5, #0
	adds r1, #0x62
	strb r0, [r1]
	ldr r1, _0804F36C  @ gKeyStatusPtr
	ldr r3, [r1]
	ldrh r4, [r3, #6]
	movs r0, #0x40
	ands r0, r4
	cmp r0, #0
	beq _0804F2CC
	ldrb r0, [r2]
	cmp r0, #0
	bne _0804F2C6
	ldrh r3, [r3, #8]
	cmp r4, r3
	bne _0804F366
	adds r0, r5, #0
	adds r0, #0x60
	ldrb r0, [r0]
	strb r0, [r2]
_0804F2C6:
	ldrb r0, [r2]
	subs r0, #1
	strb r0, [r2]
_0804F2CC:
	ldr r1, [r1]
	ldrh r3, [r1, #6]
	movs r0, #0x80
	ands r0, r3
	adds r4, r5, #0
	adds r4, #0x61
	cmp r0, #0
	beq _0804F2FA
	ldrb r2, [r4]
	adds r0, r5, #0
	adds r0, #0x60
	ldrb r0, [r0]
	subs r0, #1
	cmp r2, r0
	bne _0804F2F4
	ldrh r1, [r1, #8]
	cmp r3, r1
	bne _0804F366
	movs r0, #0xff
	strb r0, [r4]
_0804F2F4:
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
_0804F2FA:
	adds r0, r5, #0
	adds r0, #0x62
	ldrb r1, [r0]
	adds r6, r0, #0
	ldrb r0, [r4]
	cmp r1, r0
	beq _0804F32E
	ldrb r1, [r6]
	adds r0, r5, #0
	movs r2, #0
	bl Menu_DrawHoverThing
	ldrb r1, [r4]
	adds r0, r5, #0
	movs r2, #1
	bl Menu_DrawHoverThing
	ldr r0, _0804F370  @ gUnknown_0202BCF0
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0804F32E
	movs r0, #0x66
	bl m4aSongNumStart
_0804F32E:
	ldrb r0, [r4]
	ldrb r1, [r6]
	cmp r0, r1
	beq _0804F366
	ldrb r0, [r6]
	lsls r0, r0, #2
	adds r6, r5, #0
	adds r6, #0x34
	adds r0, r6, r0
	ldr r1, [r0]
	ldr r0, [r1, #0x30]
	ldr r2, [r0, #0x20]
	cmp r2, #0
	beq _0804F350
	adds r0, r5, #0
	bl _call_via_r2
_0804F350:
	ldrb r0, [r4]
	lsls r0, r0, #2
	adds r0, r6, r0
	ldr r1, [r0]
	ldr r0, [r1, #0x30]
	ldr r2, [r0, #0x1c]
	cmp r2, #0
	beq _0804F366
	adds r0, r5, #0
	bl _call_via_r2
_0804F366:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0804F36C: .4byte gKeyStatusPtr
_0804F370: .4byte gUnknown_0202BCF0

	THUMB_FUNC_START Menu_HandleSelectInputs
Menu_HandleSelectInputs: @ 0x0804F374
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	movs r6, #0
	adds r0, #0x61
	ldrb r1, [r0]
	lsls r1, r1, #2
	subs r0, #0x2d
	adds r0, r0, r1
	ldr r5, [r0]
	ldr r7, [r5, #0x30]
	ldr r2, [r7, #0x18]
	cmp r2, #0
	beq _0804F39A
	adds r0, r4, #0
	adds r1, r5, #0
	bl _call_via_r2
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
_0804F39A:
	ldr r0, _0804F3BC  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0804F3C0
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_804F7E8
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #0xff
	bne _0804F3F6
	ldr r2, [r7, #0x14]
	b _0804F3CC
	.align 2, 0
_0804F3BC: .4byte gKeyStatusPtr
_0804F3C0:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0804F3DE
	ldr r0, [r4, #0x30]
	ldr r2, [r0, #0x18]
_0804F3CC:
	cmp r2, #0
	beq _0804F3F6
	adds r0, r4, #0
	adds r1, r5, #0
	bl _call_via_r2
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	b _0804F3F6
_0804F3DE:
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0804F3F6
	ldr r0, [r4, #0x30]
	ldr r1, [r0, #0x1c]
	cmp r1, #0
	beq _0804F3F6
	adds r0, r4, #0
	bl _call_via_r1
_0804F3F6:
	adds r0, r6, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_START Menu_GetCursorGfxCurrentPosition
Menu_GetCursorGfxCurrentPosition: @ 0x0804F400
	push {r4, r5, lr}
	adds r3, r0, #0
	adds r4, r1, #0
	movs r0, #0x61
	adds r0, r0, r3
	mov ip, r0
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r1, r3, #0
	adds r1, #0x34
	adds r0, r1, r0
	ldr r0, [r0]
	movs r5, #0x2a
	ldrsh r0, [r0, r5]
	lsls r0, r0, #3
	str r0, [r4]
	mov r5, ip
	ldrb r0, [r5]
	lsls r0, r0, #2
	adds r1, r1, r0
	ldr r0, [r1]
	movs r1, #0x2c
	ldrsh r0, [r0, r1]
	lsls r0, r0, #3
	str r0, [r2]
	ldr r0, [r3, #0x30]
	ldrb r0, [r0, #4]
	cmp r0, #0
	beq _0804F440
	ldr r0, [r4]
	subs r0, #4
	str r0, [r4]
_0804F440:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_START MenuCommand_UsabilityAlways
MenuCommand_UsabilityAlways: @ 0x0804F448
	movs r0, #1
	bx lr

	THUMB_FUNC_START UsabilityGrayed
UsabilityGrayed: @ 0x0804F44C
	movs r0, #2
	bx lr

	THUMB_FUNC_START UsabilityNever
UsabilityNever: @ 0x0804F450
	movs r0, #3
	bx lr

	THUMB_FUNC_START sub_804F454
sub_804F454: @ 0x0804F454
	movs r0, #0x1b
	bx lr

	THUMB_FUNC_START sub_804F458
sub_804F458: @ 0x0804F458
	push {lr}
	movs r2, #0x2a
	ldrsh r0, [r1, r2]
	lsls r0, r0, #3
	movs r2, #0x2c
	ldrsh r3, [r1, r2]
	lsls r3, r3, #3
	ldr r1, [r1, #0x30]
	ldrh r2, [r1, #6]
	adds r1, r3, #0
	bl sub_8088DE0
	pop {r1}
	bx r1

	THUMB_FUNC_START sub_804F474
sub_804F474: @ 0x0804F474
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #1
	negs r1, r1
	movs r0, #0
	bl LoadDialogueBoxGfx
	ldr r2, [r4, #0x30]
	adds r0, r4, #0
	adds r0, #0x61
	ldrb r1, [r0]
	lsls r1, r1, #2
	subs r0, #0x2d
	adds r0, r0, r1
	ldr r1, [r0]
	ldr r2, [r2, #0x20]
	adds r0, r4, #0
	bl _call_via_r2
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_START sub_804F4A0
sub_804F4A0: @ 0x0804F4A0
	push {r4, r5, lr}
	sub sp, #8
	adds r5, r0, #0
	bl Menu_HandleDirectionInputs
	add r4, sp, #4
	adds r0, r5, #0
	mov r1, sp
	adds r2, r4, #0
	bl Menu_GetCursorGfxCurrentPosition
	adds r0, r5, #0
	mov r1, sp
	adds r2, r4, #0
	bl Menu_UpdateMovingCursorGfxPosition
	ldr r0, [sp]
	ldr r1, [sp, #4]
	bl DisplayUiHand
	ldr r0, _0804F4E8  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0x81
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0804F4F0
	bl sub_8089018
	ldr r1, _0804F4EC  @ gUnknown_085B64B8
	adds r0, r5, #0
	bl Proc_JumpToPointer
	b _0804F516
	.align 2, 0
_0804F4E8: .4byte gKeyStatusPtr
_0804F4EC: .4byte gUnknown_085B64B8
_0804F4F0:
	adds r3, r5, #0
	adds r3, #0x61
	adds r1, r5, #0
	adds r1, #0x62
	ldrb r0, [r3]
	ldrb r1, [r1]
	cmp r0, r1
	beq _0804F516
	ldr r2, [r5, #0x30]
	adds r1, r0, #0
	lsls r1, r1, #2
	adds r0, r5, #0
	adds r0, #0x34
	adds r0, r0, r1
	ldr r1, [r0]
	ldr r2, [r2, #0x20]
	adds r0, r5, #0
	bl _call_via_r2
_0804F516:
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_START sub_804F520
sub_804F520: @ 0x0804F520
	push {lr}
	ldr r1, _0804F52C  @ gUnknown_085B6518
	bl Proc_JumpToPointer
	pop {r1}
	bx r1
	.align 2, 0
_0804F52C: .4byte gUnknown_085B6518

	THUMB_FUNC_START sub_804F530
sub_804F530: @ 0x0804F530
	push {r4, r5, lr}
	sub sp, #8
	adds r5, r0, #0
	add r4, sp, #4
	mov r1, sp
	adds r2, r4, #0
	bl Menu_GetCursorGfxCurrentPosition
	adds r0, r5, #0
	mov r1, sp
	adds r2, r4, #0
	bl Menu_UpdateMovingCursorGfxPosition
	ldr r0, [sp]
	ldr r1, [sp, #4]
	bl DisplayFrozenUiHand
	ldr r0, _0804F578  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0x81
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0804F56E
	bl sub_8089018
	ldr r1, _0804F57C  @ gUnknown_085B64B8
	adds r0, r5, #0
	bl Proc_JumpToPointer
_0804F56E:
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0804F578: .4byte gKeyStatusPtr
_0804F57C: .4byte gUnknown_085B64B8

	THUMB_FUNC_START Menu_CallTextBox
Menu_CallTextBox: @ 0x0804F580
	push {r4, r5, lr}
	adds r5, r1, #0
	ldr r1, _0804F5B0  @ gUnknown_085B6530
	bl Proc_JumpToPointer
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
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0804F5B0: .4byte gUnknown_085B6530

	THUMB_FUNC_START sub_804F5B4
sub_804F5B4: @ 0x0804F5B4
	push {r4, r5, lr}
	sub sp, #8
	adds r5, r0, #0
	add r4, sp, #4
	mov r1, sp
	adds r2, r4, #0
	bl Menu_GetCursorGfxCurrentPosition
	adds r0, r5, #0
	mov r1, sp
	adds r2, r4, #0
	bl Menu_UpdateMovingCursorGfxPosition
	ldr r0, [sp]
	ldr r1, [sp, #4]
	bl DisplayFrozenUiHand
	ldr r0, _0804F5F4  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #3
	ands r0, r1
	cmp r0, #0
	beq _0804F5EC
	ldr r1, _0804F5F8  @ gUnknown_085B64B8
	adds r0, r5, #0
	bl Proc_JumpToPointer
_0804F5EC:
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0804F5F4: .4byte gKeyStatusPtr
_0804F5F8: .4byte gUnknown_085B64B8

	THUMB_FUNC_START sub_804F5FC
sub_804F5FC: @ 0x0804F5FC
	push {lr}
	ldr r1, _0804F608  @ gUnknown_085B6540
	bl Proc_JumpToPointer
	pop {r1}
	bx r1
	.align 2, 0
_0804F608: .4byte gUnknown_085B6540

	THUMB_FUNC_START MarkSomethingInMenu
MarkSomethingInMenu: @ 0x0804F60C
	push {lr}
	ldr r0, _0804F628  @ gUnknown_085B64D0
	bl Proc_Find
	cmp r0, #0
	beq _0804F624
	adds r2, r0, #0
	adds r2, #0x63
	ldrb r1, [r2]
	movs r0, #0x40
	orrs r0, r1
	strb r0, [r2]
_0804F624:
	pop {r0}
	bx r0
	.align 2, 0
_0804F628: .4byte gUnknown_085B64D0

	THUMB_FUNC_START sub_804F62C
sub_804F62C: @ 0x0804F62C
	push {lr}
	ldr r0, _0804F648  @ gUnknown_085B64D0
	bl Proc_Find
	cmp r0, #0
	beq _0804F644
	adds r2, r0, #0
	adds r2, #0x63
	ldrb r1, [r2]
	movs r0, #0xbf
	ands r0, r1
	strb r0, [r2]
_0804F644:
	pop {r0}
	bx r0
	.align 2, 0
_0804F648: .4byte gUnknown_085B64D0

	THUMB_FUNC_START NewMenu_AndDoSomethingCommands
NewMenu_AndDoSomethingCommands: @ 0x0804F64C
	push {r4, r5, r6, r7, lr}
	bl NewMenu_DefaultAdjusted
	adds r5, r0, #0
	adds r2, r5, #0
	adds r2, #0x60
	ldrb r0, [r2]
	cmp r0, #6
	bls _0804F696
	adds r3, r5, #0
	adds r3, #0x2d
	ldr r6, _0804F6A0  @ gUnknown_085B6550
	ldrb r0, [r2]
	adds r0, r0, r6
	ldrb r1, [r3]
	ldrb r0, [r0]
	subs r1, r1, r0
	strb r1, [r3]
	movs r4, #0
	ldrb r0, [r2]
	cmp r4, r0
	bge _0804F696
	adds r7, r6, #0
	adds r3, r2, #0
	adds r6, r5, #0
	adds r6, #0x34
_0804F680:
	ldm r6!, {r2}
	ldrb r0, [r3]
	adds r0, r0, r7
	ldrb r1, [r0]
	ldrh r0, [r2, #0x2c]
	subs r0, r0, r1
	strh r0, [r2, #0x2c]
	adds r4, #1
	ldrb r0, [r3]
	cmp r4, r0
	blt _0804F680
_0804F696:
	adds r0, r5, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0804F6A0: .4byte gUnknown_085B6550

	THUMB_FUNC_START Menu_UpdateMovingCursorGfxPosition
Menu_UpdateMovingCursorGfxPosition: @ 0x0804F6A4
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r7, r2, #0
	adds r1, r4, #0
	adds r1, #0x60
	ldrb r0, [r1]
	cmp r0, #9
	bls _0804F6F0
	lsls r0, r0, #4
	subs r0, #0x90
	adds r1, #1
	ldrb r1, [r1]
	muls r0, r1, r0
	movs r1, #9
	bl __divsi3
	adds r6, r0, #0
	adds r5, r4, #0
	adds r5, #0x64
	ldrb r0, [r5]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1e
	lsls r4, r6, #0x10
	lsrs r4, r4, #0x10
	movs r1, #0
	adds r2, r4, #0
	bl BG_SetPosition
	ldrb r0, [r5]
	lsls r0, r0, #0x1e
	lsrs r0, r0, #0x1e
	movs r1, #0
	adds r2, r4, #0
	bl BG_SetPosition
	ldr r0, [r7]
	subs r0, r0, r6
	str r0, [r7]
_0804F6F0:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_START ClearMenuRelatedList
ClearMenuRelatedList: @ 0x0804F6F8
	push {lr}
	ldr r1, _0804F710  @ gUnknown_03001870
	movs r2, #0
	adds r0, r1, #0
	adds r0, #0x78
_0804F702:
	strh r2, [r0, #2]
	subs r0, #8
	cmp r0, r1
	bge _0804F702
	pop {r0}
	bx r0
	.align 2, 0
_0804F710: .4byte gUnknown_03001870

	THUMB_FUNC_START sub_804F714
sub_804F714: @ 0x0804F714
	push {r4, r5, r6, lr}
	movs r4, #0
	adds r1, r0, #0
	ldr r2, _0804F734  @ gUnknown_03001870
	ldr r5, _0804F738  @ UsabilityNever
	adds r3, r2, #4
_0804F720:
	movs r6, #2
	ldrsh r0, [r2, r6]
	cmp r0, #0
	beq _0804F73C
	ldr r0, [r3]
	cmp r0, r5
	bne _0804F73C
	ldrh r0, [r2]
	b _0804F73E
	.align 2, 0
_0804F734: .4byte gUnknown_03001870
_0804F738: .4byte UsabilityNever
_0804F73C:
	movs r0, #0
_0804F73E:
	strb r0, [r1]
	adds r1, #1
	adds r2, #8
	adds r3, #8
	adds r4, #1
	cmp r4, #0xf
	ble _0804F720
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_START sub_804F754
sub_804F754: @ 0x0804F754
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r4, #0
_0804F75A:
	adds r1, r5, r4
	ldrb r0, [r1]
	cmp r0, #0
	beq _0804F76A
	movs r1, #1
	ldr r2, _0804F778  @ UsabilityNever
	bl sub_804F77C
_0804F76A:
	adds r4, #1
	cmp r4, #0xf
	ble _0804F75A
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0804F778: .4byte UsabilityNever

	THUMB_FUNC_START sub_804F77C
sub_804F77C: @ 0x0804F77C
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r3, _0804F784  @ gUnknown_03001870
	b _0804F78A
	.align 2, 0
_0804F784: .4byte gUnknown_03001870
_0804F788:
	adds r3, #8
_0804F78A:
	movs r5, #2
	ldrsh r0, [r3, r5]
	cmp r0, #0
	beq _0804F79E
	cmp r0, r1
	bne _0804F788
	movs r5, #0
	ldrsh r0, [r3, r5]
	cmp r0, r4
	bne _0804F788
_0804F79E:
	strh r4, [r3]
	strh r1, [r3, #2]
	str r2, [r3, #4]
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_START sub_804F7AC
sub_804F7AC: @ 0x0804F7AC
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r2, _0804F7B4  @ gUnknown_03001870
	b _0804F7D6
	.align 2, 0
_0804F7B4: .4byte gUnknown_03001870
_0804F7B8:
	cmp r3, #1
	bne _0804F7D4
	movs r3, #0
	ldrsh r0, [r2, r3]
	ldrb r5, [r4, #9]
	cmp r0, r5
	bne _0804F7D4
	ldr r2, [r2, #4]
	adds r0, r4, #0
	bl _call_via_r2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	b _0804F7E2
_0804F7D4:
	adds r2, #8
_0804F7D6:
	ldrh r3, [r2, #2]
	movs r5, #2
	ldrsh r0, [r2, r5]
	cmp r0, #0
	bne _0804F7B8
	movs r0, #0
_0804F7E2:
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_START sub_804F7E8
sub_804F7E8: @ 0x0804F7E8
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r3, r1, #0
	ldr r2, _0804F7F4  @ gUnknown_03001870
	b _0804F81A
	.align 2, 0
_0804F7F4: .4byte gUnknown_03001870
_0804F7F8:
	cmp r1, #2
	bne _0804F818
	movs r0, #0
	ldrsh r1, [r2, r0]
	ldr r0, [r3, #0x30]
	ldrb r0, [r0, #9]
	cmp r1, r0
	bne _0804F818
	ldr r2, [r2, #4]
	adds r0, r4, #0
	adds r1, r3, #0
	bl _call_via_r2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	b _0804F826
_0804F818:
	adds r2, #8
_0804F81A:
	ldrh r1, [r2, #2]
	movs r5, #2
	ldrsh r0, [r2, r5]
	cmp r0, #0
	bne _0804F7F8
	movs r0, #0xff
_0804F826:
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_START sub_804F82C
sub_804F82C: @ 0x0804F82C
	push {lr}
	adds r0, #0x64
	ldrb r3, [r0]
	lsls r1, r3, #0x1e
	lsrs r1, r1, #0x1e
	movs r2, #1
	adds r0, r2, #0
	lsls r0, r1
	lsls r3, r3, #0x1c
	lsrs r3, r3, #0x1e
	lsls r2, r3
	adds r0, r0, r2
	bl BG_EnableSyncByMask
	pop {r0}
	bx r0

	THUMB_FUNC_START sub_804F84C
sub_804F84C: @ 0x0804F84C
	push {r4, lr}
	adds r4, r0, #0
	adds r4, #0x64
	ldrb r0, [r4]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1e
	bl BG_GetMapBuffer
	movs r1, #0
	bl BG_Fill
	ldrb r0, [r4]
	lsls r0, r0, #0x1e
	lsrs r0, r0, #0x1e
	bl BG_GetMapBuffer
	movs r1, #0
	bl BG_Fill
	ldrb r3, [r4]
	lsls r1, r3, #0x1e
	lsrs r1, r1, #0x1e
	movs r2, #1
	adds r0, r2, #0
	lsls r0, r1
	lsls r3, r3, #0x1c
	lsrs r3, r3, #0x1e
	lsls r2, r3
	adds r0, r0, r2
	bl BG_EnableSyncByMask
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_START sub_804F890
sub_804F890: @ 0x0804F890
	adds r1, r0, #0
	adds r1, #0x61
	adds r0, #0x62
	ldrb r1, [r1]
	ldrb r0, [r0]
	eors r1, r0
	negs r0, r1
	orrs r0, r1
	lsrs r0, r0, #0x1f
	bx lr

.align 2, 0
