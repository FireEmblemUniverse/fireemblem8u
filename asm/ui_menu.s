	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	@ UI "Menu" Framework

	THUMB_FUNC_START NewMenu_DefaultAdjusted
NewMenu_DefaultAdjusted: @ 0x0804EB98
	push {r4, lr}
	adds r4, r0, #0
	adds r0, r2, #0
	ldr r2, [r4]
	cmp r1, #0x77
	bgt _0804EBA8
	lsls r0, r3, #0x18
	b _0804EBAA
_0804EBA8:
	lsls r0, r0, #0x18
_0804EBAA:
	lsrs r0, r0, #0x18
	ldr r1, _0804EBC4  @ 0xFFFFFF00
	ands r2, r1
	orrs r2, r0
	adds r0, r4, #0
	adds r1, r2, #0
	movs r2, #0
	bl NewMenu_BG0BG1
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0804EBC4: .4byte 0xFFFFFF00

	THUMB_FUNC_START NewMenu_DefaultChild
NewMenu_DefaultChild: @ 0x0804EBC8
	push {lr}
	adds r2, r1, #0
	ldr r1, [r0]
	bl NewMenu_BG0BG1
	pop {r1}
	bx r1

	THUMB_FUNC_START sub_804EBD8
sub_804EBD8: @ 0x0804EBD8
	push {lr}
	movs r2, #0
	bl NewMenu_BG0BG1
	pop {r1}
	bx r1

	THUMB_FUNC_START NewMenu_Default
NewMenu_Default: @ 0x0804EBE4
	push {lr}
	ldr r1, [r0]
	movs r2, #0
	bl NewMenu_BG0BG1
	pop {r1}
	bx r1

	THUMB_FUNC_START sub_804EBF4
sub_804EBF4: @ 0x0804EBF4
	push {r4, lr}
	sub sp, #0xc
	adds r4, r0, #0
	adds r0, r2, #0
	ldr r2, [r4]
	cmp r1, #0x77
	bgt _0804EC06
	lsls r0, r3, #0x18
	b _0804EC08
_0804EC06:
	lsls r0, r0, #0x18
_0804EC08:
	lsrs r0, r0, #0x18
	ldr r1, _0804EC30  @ 0xFFFFFF00
	ands r2, r1
	orrs r2, r0
	ldr r0, [sp, #0x1c]
	str r0, [sp]
	ldr r0, [sp, #0x20]
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	adds r0, r4, #0
	adds r1, r2, #0
	ldr r2, [sp, #0x14]
	ldr r3, [sp, #0x18]
	bl NewMenu
	add sp, #0xc
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0804EC30: .4byte 0xFFFFFF00

	THUMB_FUNC_START NewMenu_804EC34
NewMenu_804EC34: @ 0x0804EC34
	push {r4, r5, r6, lr}
	sub sp, #0xc
	adds r5, r1, #0
	adds r6, r2, #0
	ldr r2, [sp, #0x1c]
	ldr r4, [sp, #0x20]
	ldr r1, [r0]
	str r3, [sp]
	str r2, [sp, #4]
	str r4, [sp, #8]
	adds r2, r5, #0
	adds r3, r6, #0
	bl NewMenu
	add sp, #0xc
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	THUMB_FUNC_START sub_804EC58
sub_804EC58: @ 0x0804EC58
	push {r4, r5, lr}
	sub sp, #0xc
	ldr r4, [sp, #0x18]
	ldr r5, [sp, #0x1c]
	str r4, [sp]
	str r5, [sp, #4]
	movs r4, #0
	str r4, [sp, #8]
	bl NewMenu
	add sp, #0xc
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_START sub_804EC74
sub_804EC74: @ 0x0804EC74
	push {r4, r5, lr}
	sub sp, #0xc
	adds r4, r1, #0
	adds r5, r2, #0
	ldr r2, [sp, #0x18]
	ldr r1, [r0]
	str r3, [sp]
	str r2, [sp, #4]
	movs r2, #0
	str r2, [sp, #8]
	adds r2, r4, #0
	adds r3, r5, #0
	bl NewMenu
	add sp, #0xc
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_START NewMenu_BG0BG1
NewMenu_BG0BG1: @ 0x0804EC98
	push {lr}
	sub sp, #0xc
	movs r3, #0
	str r3, [sp]
	str r3, [sp, #4]
	str r2, [sp, #8]
	movs r2, #1
	bl NewMenu
	add sp, #0xc
	pop {r1}
	bx r1

	THUMB_FUNC_START NewMenu
NewMenu: @ 0x0804ECB0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x30
	mov r8, r0
	mov sl, r1
	str r2, [sp]
	str r3, [sp, #4]
	ldr r4, [sp, #0x58]
	lsls r0, r1, #0x18
	asrs r0, r0, #0x18
	adds r0, #1
	str r0, [sp, #0xc]
	lsls r0, r1, #0x10
	asrs r0, r0, #0x18
	adds r0, #1
	mov r9, r0
	ldr r1, [sp, #0x50]
	lsls r0, r1, #0x10
	lsrs r0, r0, #0x10
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	ldr r2, [sp]
	lsls r0, r2, #0x10
	lsrs r0, r0, #0x10
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	ldr r0, _0804ED1C  @ gUnknown_0202BCF0
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0804ED04
	movs r0, #0x68
	bl m4aSongNumStart
_0804ED04:
	cmp r4, #0
	beq _0804ED24
	ldr r0, _0804ED20  @ gUnknown_085B64D0
	adds r1, r4, #0
	bl Proc_CreateBlockingChild
	adds r5, r0, #0
	adds r1, r5, #0
	adds r1, #0x63
	movs r0, #0
	b _0804ED38
	.align 2, 0
_0804ED1C: .4byte gUnknown_0202BCF0
_0804ED20: .4byte gUnknown_085B64D0
_0804ED24:
	bl AddSkipThread2
	ldr r0, _0804EE9C  @ gUnknown_085B64D0
	movs r1, #3
	bl Proc_Create
	adds r5, r0, #0
	adds r1, r5, #0
	adds r1, #0x63
	movs r0, #1
_0804ED38:
	strb r0, [r1]
	mov r1, sl
	asrs r0, r1, #0x18
	str r0, [sp, #0x2c]
	cmp r0, #0
	bge _0804ED50
	adds r2, r5, #0
	adds r2, #0x63
	ldrb r1, [r2]
	movs r0, #8
	orrs r0, r1
	strb r0, [r2]
_0804ED50:
	movs r7, #0
	movs r2, #0
	str r2, [sp, #8]
	mov r0, r8
	ldr r1, [r0, #8]
	ldr r0, [r1, #0xc]
	mov r2, sl
	lsls r2, r2, #0x10
	str r2, [sp, #0x28]
	adds r2, r5, #0
	adds r2, #0x60
	str r2, [sp, #0x10]
	adds r2, #1
	str r2, [sp, #0x14]
	adds r2, #1
	str r2, [sp, #0x18]
	adds r2, #2
	str r2, [sp, #0x1c]
	adds r2, #2
	str r2, [sp, #0x20]
	adds r2, #2
	str r2, [sp, #0x24]
	cmp r0, #0
	beq _0804EE12
	movs r6, #0
_0804ED82:
	adds r0, r1, r6
	adds r1, r7, #0
	bl sub_804F7AC
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0
	bne _0804EDA4
	mov r1, r8
	ldr r0, [r1, #8]
	adds r0, r6, r0
	ldr r2, [r0, #0xc]
	adds r1, r7, #0
	bl _call_via_r2
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
_0804EDA4:
	cmp r4, #3
	beq _0804EE02
	ldr r0, _0804EEA0  @ gUnknown_085B6510
	adds r1, r5, #0
	bl Proc_Create
	adds r2, r0, #0
	ldr r0, [sp, #8]
	lsls r1, r0, #2
	adds r0, r5, #0
	adds r0, #0x34
	adds r0, r0, r1
	str r2, [r0]
	ldr r1, [sp, #8]
	adds r1, #1
	str r1, [sp, #8]
	mov r1, r8
	ldr r0, [r1, #8]
	adds r0, r0, r6
	str r0, [r2, #0x30]
	adds r0, r2, #0
	adds r0, #0x3c
	strb r7, [r0]
	adds r0, #1
	strb r4, [r0]
	mov r0, sp
	ldrh r0, [r0, #0xc]
	strh r0, [r2, #0x2a]
	mov r1, r9
	strh r1, [r2, #0x2c]
	adds r0, r5, #0
	adds r0, #0x63
	ldrb r1, [r0]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	bne _0804EDFE
	adds r0, r2, #0
	adds r0, #0x34
	mov r2, sl
	lsls r1, r2, #8
	asrs r1, r1, #0x18
	subs r1, #1
	bl Text_Init
_0804EDFE:
	movs r0, #2
	add r9, r0
_0804EE02:
	adds r6, #0x24
	adds r7, #1
	mov r2, r8
	ldr r1, [r2, #8]
	adds r0, r6, r1
	ldr r0, [r0, #0xc]
	cmp r0, #0
	bne _0804ED82
_0804EE12:
	mov r0, r8
	str r0, [r5, #0x30]
	mov r1, sl
	str r1, [r5, #0x2c]
	movs r3, #0
	mov r2, sp
	ldrb r0, [r2, #8]
	ldr r2, [sp, #0x10]
	strb r0, [r2]
	ldr r1, [sp, #0x14]
	strb r3, [r1]
	movs r0, #0xff
	ldr r2, [sp, #0x18]
	strb r0, [r2]
	ldr r0, [sp, #0x28]
	asrs r1, r0, #0x18
	ldr r2, [sp, #0x2c]
	adds r0, r1, r2
	cmp r0, r9
	bge _0804EE46
	subs r0, r1, #1
	mov r1, r9
	subs r0, r1, r0
	adds r1, r5, #0
	adds r1, #0x2f
	strb r0, [r1]
_0804EE46:
	movs r2, #3
	ldr r0, [sp]
	ands r0, r2
	str r0, [sp]
	ldr r0, [sp, #0x1c]
	ldrb r1, [r0]
	movs r0, #4
	negs r0, r0
	ands r0, r1
	ldr r1, [sp]
	orrs r0, r1
	ldr r1, [sp, #0x1c]
	strb r0, [r1]
	mov r0, sp
	ldrh r1, [r0, #4]
	ldr r0, [sp, #0x20]
	strh r1, [r0]
	ldr r0, [sp, #0x50]
	ands r0, r2
	lsls r2, r0, #2
	ldr r0, [sp, #0x1c]
	ldrb r1, [r0]
	movs r0, #0xd
	negs r0, r0
	ands r0, r1
	orrs r0, r2
	ldr r1, [sp, #0x1c]
	strb r0, [r1]
	ldr r0, [sp, #0x54]
	ldr r2, [sp, #0x24]
	strh r0, [r2]
	ldr r0, _0804EEA4  @ gKeyStatusPtr
	ldr r0, [r0]
	strh r3, [r0, #8]
	adds r0, r5, #0
	add sp, #0x30
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0804EE9C: .4byte gUnknown_085B64D0
_0804EEA0: .4byte gUnknown_085B6510
_0804EEA4: .4byte gKeyStatusPtr

	THUMB_FUNC_START EndMenu
EndMenu: @ 0x0804EEA8
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r0, #0x61
	ldrb r1, [r0]
	lsls r1, r1, #2
	subs r0, #0x2d
	adds r0, r0, r1
	ldr r3, [r0]
	adds r4, r5, #0
	adds r4, #0x63
	ldrb r1, [r4]
	movs r0, #4
	orrs r0, r1
	strb r0, [r4]
	ldr r0, [r3, #0x30]
	ldr r2, [r0, #0x20]
	cmp r2, #0
	beq _0804EED4
	adds r0, r5, #0
	adds r1, r3, #0
	bl _call_via_r2
_0804EED4:
	ldr r0, [r5, #0x30]
	ldr r1, [r0, #0x10]
	cmp r1, #0
	beq _0804EEE2
	adds r0, r5, #0
	bl _call_via_r1
_0804EEE2:
	ldrb r1, [r4]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0804EEF0
	bl SubSkipThread2
_0804EEF0:
	adds r0, r5, #0
	bl Proc_Delete
	adds r4, r5, #0
	adds r4, #0x64
	ldrb r0, [r4]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1e
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	ldrb r0, [r4]
	lsls r0, r0, #0x1e
	lsrs r0, r0, #0x1e
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	ldr r0, [r5, #0x14]
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_START EndAllMenus
EndAllMenus: @ 0x0804EF20
	push {lr}
	ldr r0, _0804EF30  @ gUnknown_085B64D0
	ldr r1, _0804EF34  @ EndMenu
	bl Proc_ForEachWithScript
	pop {r0}
	bx r0
	.align 2, 0
_0804EF30: .4byte gUnknown_085B64D0
_0804EF34: .4byte EndMenu

	THUMB_FUNC_START Menu_CallDefinedConstructors
Menu_CallDefinedConstructors: @ 0x0804EF38
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x30]
	ldr r1, [r0, #0xc]
	cmp r1, #0
	beq _0804EF4A
	adds r0, r4, #0
	bl _call_via_r1
_0804EF4A:
	adds r0, r4, #0
	adds r0, #0x61
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r1, r4, #0
	adds r1, #0x34
	adds r1, r1, r0
	ldr r1, [r1]
	ldr r0, [r1, #0x30]
	ldr r2, [r0, #0x1c]
	cmp r2, #0
	beq _0804EF68
	adds r0, r4, #0
	bl _call_via_r2
_0804EF68:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_START Menu_Draw
Menu_Draw: @ 0x0804EF70
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	adds r7, r0, #0
	adds r0, #0x63
	ldrb r1, [r0]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _0804EF8C
	b _0804F0CE
_0804EF8C:
	adds r5, r7, #0
	adds r5, #0x64
	ldrb r0, [r5]
	lsls r0, r0, #0x1e
	lsrs r0, r0, #0x1e
	bl BG_GetMapBuffer
	adds r6, r7, #0
	adds r6, #0x2c
	movs r1, #0
	ldrsb r1, [r6, r1]
	movs r2, #0x2d
	adds r2, r2, r7
	mov sl, r2
	ldrb r2, [r2]
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	movs r3, #0x2e
	adds r3, r3, r7
	mov r9, r3
	ldrb r3, [r3]
	lsls r3, r3, #0x18
	asrs r3, r3, #0x18
	movs r4, #0x2f
	adds r4, r4, r7
	mov r8, r4
	ldrb r4, [r4]
	lsls r4, r4, #0x18
	asrs r4, r4, #0x18
	str r4, [sp]
	adds r4, r7, #0
	adds r4, #0x66
	ldrh r4, [r4]
	str r4, [sp, #4]
	ldr r4, [r7, #0x30]
	ldrb r4, [r4, #4]
	str r4, [sp, #8]
	bl DrawUiFrame
	ldrb r0, [r5]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1e
	bl BG_GetMapBuffer
	movs r1, #0
	ldrsb r1, [r6, r1]
	mov r6, sl
	movs r2, #0
	ldrsb r2, [r6, r2]
	mov r4, r9
	movs r3, #0
	ldrsb r3, [r4, r3]
	mov r6, r8
	movs r4, #0
	ldrsb r4, [r6, r4]
	str r4, [sp]
	bl ClearUiFrame
	movs r0, #0
	mov r8, r0
	adds r0, r7, #0
	adds r0, #0x60
	mov r9, r5
	adds r5, r0, #0
	movs r1, #0x61
	adds r1, r1, r7
	mov sl, r1
	ldrb r2, [r5]
	cmp r8, r2
	bge _0804F0A8
_0804F018:
	mov r3, r8
	lsls r1, r3, #2
	adds r0, r7, #0
	adds r0, #0x34
	adds r0, r0, r1
	ldr r4, [r0]
	ldr r1, [r4, #0x30]
	ldr r2, [r1, #0x10]
	cmp r2, #0
	beq _0804F036
	adds r0, r7, #0
	adds r1, r4, #0
	bl _call_via_r2
	b _0804F09E
_0804F036:
	ldrb r0, [r1, #8]
	adds r6, r4, #0
	adds r6, #0x34
	cmp r0, #0
	beq _0804F048
	adds r1, r0, #0
	adds r0, r6, #0
	bl Text_SetColorId
_0804F048:
	adds r0, r4, #0
	adds r0, #0x3d
	ldrb r0, [r0]
	cmp r0, #2
	bne _0804F05A
	adds r0, r6, #0
	movs r1, #1
	bl Text_SetColorId
_0804F05A:
	ldr r1, [r4, #0x30]
	ldrh r0, [r1, #4]
	cmp r0, #0
	bne _0804F06C
	ldr r1, [r1]
	adds r0, r6, #0
	bl Text_AppendString
	b _0804F07A
_0804F06C:
	ldrh r0, [r1, #4]
	bl GetStringFromIndex
	adds r1, r0, #0
	adds r0, r6, #0
	bl Text_AppendString
_0804F07A:
	mov r1, r9
	ldrb r0, [r1]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1e
	bl BG_GetMapBuffer
	adds r1, r0, #0
	movs r2, #0x2c
	ldrsh r0, [r4, r2]
	lsls r0, r0, #5
	movs r3, #0x2a
	ldrsh r2, [r4, r3]
	adds r0, r0, r2
	lsls r0, r0, #1
	adds r1, r1, r0
	adds r0, r6, #0
	bl Text_Draw
_0804F09E:
	movs r4, #1
	add r8, r4
	ldrb r6, [r5]
	cmp r8, r6
	blt _0804F018
_0804F0A8:
	mov r0, sl
	ldrb r1, [r0]
	adds r0, r7, #0
	movs r2, #1
	bl Menu_DrawHoverThing
	mov r1, r9
	ldrb r3, [r1]
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
_0804F0CE:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_START Menu_DrawHoverThing
Menu_DrawHoverThing: @ 0x0804F0E0
	push {r4, r5, lr}
	sub sp, #4
	mov ip, r0
	adds r3, r1, #0
	lsls r2, r2, #0x18
	lsrs r4, r2, #0x18
	adds r0, #0x63
	ldrb r1, [r0]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	bne _0804F15C
	mov r0, ip
	adds r0, #0x2c
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r5, r0, #1
	lsls r1, r3, #2
	mov r0, ip
	adds r0, #0x34
	adds r0, r0, r1
	ldr r0, [r0]
	movs r1, #0x2c
	ldrsh r3, [r0, r1]
	mov r0, ip
	adds r0, #0x2e
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r2, r0, #2
	lsls r0, r4, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0804F144
	cmp r0, #1
	bne _0804F15C
	mov r0, ip
	adds r0, #0x64
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	lsrs r0, r0, #0x1e
	mov r1, ip
	adds r1, #0x66
	ldrh r1, [r1]
	str r2, [sp]
	adds r2, r5, #0
	bl DrawUiItemHoverExt
	b _0804F15C
_0804F144:
	mov r0, ip
	adds r0, #0x64
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	lsrs r0, r0, #0x1e
	mov r1, ip
	adds r1, #0x66
	ldrh r1, [r1]
	str r2, [sp]
	adds r2, r5, #0
	bl ClearUiItemHoverExt
_0804F15C:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_START Menu_Idle
Menu_Idle: @ 0x0804F164
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r5, r0, #0
	adds r0, #0x63
	ldrb r1, [r0]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0804F18A
	add r2, sp, #4
	adds r0, r5, #0
	mov r1, sp
	bl Menu_GetCursorGfxCurrentPosition
	ldr r0, [sp]
	ldr r1, [sp, #4]
	bl DisplayFrozenUiHand
	b _0804F286
_0804F18A:
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0804F19A
	adds r0, r5, #0
	bl EndMenu
	b _0804F286
_0804F19A:
	adds r0, r5, #0
	bl Menu_HandleDirectionInputs
	adds r0, r5, #0
	bl Menu_HandleSelectInputs
	adds r6, r0, #0
	movs r0, #2
	ands r0, r6
	cmp r0, #0
	beq _0804F1B6
	adds r0, r5, #0
	bl EndMenu
_0804F1B6:
	movs r0, #4
	ands r0, r6
	cmp r0, #0
	beq _0804F1D0
	ldr r0, _0804F290  @ gUnknown_0202BCF0
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0804F1D0
	movs r0, #0x6a
	bl m4aSongNumStart
_0804F1D0:
	movs r0, #8
	ands r0, r6
	cmp r0, #0
	beq _0804F1EA
	ldr r0, _0804F290  @ gUnknown_0202BCF0
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0804F1EA
	movs r0, #0x6b
	bl m4aSongNumStart
_0804F1EA:
	movs r0, #0x10
	ands r0, r6
	cmp r0, #0
	beq _0804F22E
	adds r4, r5, #0
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
_0804F22E:
	movs r4, #0x20
	adds r0, r6, #0
	ands r0, r4
	cmp r0, #0
	beq _0804F23E
	movs r0, #0
	bl DeleteFaceByIndex
_0804F23E:
	movs r0, #0x80
	ands r0, r6
	cmp r0, #0
	beq _0804F252
	adds r2, r5, #0
	adds r2, #0x63
	ldrb r1, [r2]
	movs r0, #0x80
	orrs r0, r1
	strb r0, [r2]
_0804F252:
	movs r0, #1
	ands r0, r6
	cmp r0, #0
	bne _0804F286
	adds r0, r5, #0
	adds r0, #0x63
	ldrb r1, [r0]
	adds r0, r4, #0
	ands r0, r1
	cmp r0, #0
	bne _0804F286
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
_0804F286:
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0804F290: .4byte gUnknown_0202BCF0

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
