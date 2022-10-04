	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	THUMB_FUNC_START StartPopup2WithIconAndNum
StartPopup2WithIconAndNum: @ 0x0801FA8C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	mov sl, r0
	adds r7, r1, #0
	mov r8, r2
	mov r9, r3
	movs r4, #1
	cmp r2, #0
	beq _0801FAAE
	mov r0, r8
	bl GetStringTextWidth
	adds r4, r0, #3
_0801FAAE:
	ldr r0, [sp, #0x2c]
	cmp r0, #0
	beq _0801FABC
	bl GetStringTextWidth
	adds r1, r4, #2
	adds r4, r1, r0
_0801FABC:
	movs r5, #8
	mov r0, r9
	b _0801FAC4
_0801FAC2:
	adds r5, #8
_0801FAC4:
	movs r1, #0xa
	bl __divsi3
	cmp r0, #0
	bne _0801FAC2
	cmp r7, #0
	blt _0801FAD4
	adds r4, #0x10
_0801FAD4:
	adds r4, #0x18
	movs r0, #0xf0
	subs r0, r0, r4
	cmp r0, #0
	bge _0801FAE0
	adds r0, #0xf
_0801FAE0:
	asrs r6, r0, #4
	adds r4, r4, r5
	adds r1, r4, #0
	cmp r4, #0
	bge _0801FAEC
	adds r1, r4, #7
_0801FAEC:
	asrs r5, r1, #3
	movs r0, #0
	str r0, [sp]
	adds r0, r6, #0
	movs r1, #8
	adds r2, r5, #0
	movs r3, #4
	bl DrawUiFrame2
	cmp r7, #0
	blt _0801FB1E
	bl ResetIconGraphics_
	movs r0, #4
	bl LoadIconPalettes
	lsls r0, r6, #1
	ldr r1, _0801FBA4  @ gUnknown_02022EEA
	adds r0, r0, r1
	movs r2, #0x80
	lsls r2, r2, #7
	adds r1, r7, #0
	bl DrawIcon
	adds r6, #2
_0801FB1E:
	bl Font_ResetAllocation
	add r0, sp, #4
	adds r1, r5, #0
	bl Text_Init
	add r0, sp, #4
	movs r1, #1
	bl Text_Advance
	mov r0, r8
	cmp r0, #0
	beq _0801FB50
	add r0, sp, #4
	movs r1, #0
	bl Text_SetColorId
	add r0, sp, #4
	mov r1, r8
	bl Text_AppendString
	add r0, sp, #4
	movs r1, #2
	bl Text_Advance
_0801FB50:
	add r0, sp, #4
	movs r1, #2
	bl Text_SetColorId
	add r0, sp, #4
	mov r1, r9
	bl sub_80040C0
	ldr r0, [sp, #0x2c]
	cmp r0, #0
	beq _0801FB7E
	add r0, sp, #4
	movs r1, #2
	bl Text_Advance
	add r0, sp, #4
	movs r1, #0
	bl Text_SetColorId
	add r0, sp, #4
	ldr r1, [sp, #0x2c]
	bl Text_AppendString
_0801FB7E:
	lsls r1, r6, #1
	ldr r0, _0801FBA4  @ gUnknown_02022EEA
	adds r1, r1, r0
	add r0, sp, #4
	bl Text_Draw
	ldr r0, _0801FBA8  @ ProcScr_Popup2
	mov r1, sl
	bl Proc_StartBlocking
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801FBA4: .4byte gUnknown_02022EEA
_0801FBA8: .4byte ProcScr_Popup2

	THUMB_FUNC_END StartPopup2WithIconAndNum

	THUMB_FUNC_START sub_801FBAC
sub_801FBAC: @ 0x0801FBAC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0xc
	mov r8, r0
	adds r7, r1, #0
	adds r4, r2, #0
	bl Font_ResetAllocation
	add r0, sp, #4
	movs r1, #0x14
	bl Text_Init
	add r0, sp, #4
	movs r1, #2
	bl Text_SetColorId
	adds r0, r7, #0
	bl GetItemName
	adds r1, r0, #0
	add r0, sp, #4
	bl Text_AppendString
	add r0, sp, #4
	movs r1, #2
	bl Text_Advance
	add r0, sp, #4
	movs r1, #0
	bl Text_SetColorId
	adds r0, r4, #0
	bl GetStringFromIndex
	adds r1, r0, #0
	add r0, sp, #4
	bl Text_AppendString
	add r0, sp, #4
	bl Text_GetXCursor
	adds r2, r0, #0
	adds r2, #0x28
	movs r0, #0xf0
	subs r0, r0, r2
	cmp r0, #0
	bge _0801FC0E
	adds r0, #0xf
_0801FC0E:
	asrs r5, r0, #4
	adds r0, r2, #0
	cmp r0, #0
	bge _0801FC18
	adds r0, #7
_0801FC18:
	asrs r2, r0, #3
	movs r0, #0
	str r0, [sp]
	adds r0, r5, #0
	movs r1, #8
	movs r3, #4
	bl DrawUiFrame2
	lsls r5, r5, #1
	ldr r4, _0801FC60  @ gUnknown_02022EEA
	adds r6, r5, r4
	adds r0, r7, #0
	bl GetItemIconId
	adds r1, r0, #0
	movs r2, #0x80
	lsls r2, r2, #7
	adds r0, r6, #0
	bl DrawIcon
	adds r4, #4
	adds r5, r5, r4
	add r0, sp, #4
	adds r1, r5, #0
	bl Text_Draw
	ldr r0, _0801FC64  @ ProcScr_Popup2
	mov r1, r8
	bl Proc_StartBlocking
	add sp, #0xc
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801FC60: .4byte gUnknown_02022EEA
_0801FC64: .4byte ProcScr_Popup2

	THUMB_FUNC_END sub_801FBAC

	THUMB_FUNC_START sub_801FC68
sub_801FC68: @ 0x0801FC68
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0xc
	mov r8, r0
	adds r7, r1, #0
	adds r4, r2, #0
	adds r5, r3, #0
	bl Font_ResetAllocation
	add r0, sp, #4
	movs r1, #0x14
	bl Text_Init
	cmp r4, #0
	beq _0801FCA6
	add r0, sp, #4
	movs r1, #0
	bl Text_SetColorId
	adds r0, r4, #0
	bl GetStringFromIndex
	adds r1, r0, #0
	add r0, sp, #4
	bl Text_AppendString
	add r0, sp, #4
	movs r1, #2
	bl Text_Advance
_0801FCA6:
	add r0, sp, #4
	movs r1, #2
	bl Text_SetColorId
	cmp r4, #0
	beq _0801FCB8
	adds r0, r7, #0
	movs r1, #0
	b _0801FCBC
_0801FCB8:
	adds r0, r7, #0
	movs r1, #1
_0801FCBC:
	bl GetItemNameWithArticle
	adds r1, r0, #0
	add r0, sp, #4
	bl Text_AppendString
	add r0, sp, #4
	bl Text_GetXCursor
	adds r1, r0, #7
	cmp r1, #0
	bge _0801FCD6
	adds r1, #7
_0801FCD6:
	asrs r4, r1, #3
	adds r1, r4, #2
	lsls r1, r1, #3
	add r0, sp, #4
	bl Text_SetXCursor
	add r0, sp, #4
	movs r1, #0
	bl Text_SetColorId
	cmp r5, #0
	beq _0801FCFC
	adds r0, r5, #0
	bl GetStringFromIndex
	adds r1, r0, #0
	add r0, sp, #4
	bl Text_AppendString
_0801FCFC:
	add r0, sp, #4
	bl Text_GetXCursor
	adds r2, r0, #0
	adds r2, #0x18
	movs r0, #0xf0
	subs r0, r0, r2
	cmp r0, #0
	bge _0801FD10
	adds r0, #0xf
_0801FD10:
	asrs r6, r0, #4
	adds r0, r2, #0
	cmp r0, #0
	bge _0801FD1A
	adds r0, #7
_0801FD1A:
	asrs r2, r0, #3
	movs r0, #0
	str r0, [sp]
	adds r0, r6, #0
	movs r1, #8
	movs r3, #4
	bl DrawUiFrame2
	lsls r1, r6, #1
	ldr r5, _0801FD68  @ gUnknown_02022EEA
	adds r1, r1, r5
	add r0, sp, #4
	bl Text_Draw
	adds r4, #1
	adds r4, r6, r4
	lsls r4, r4, #1
	subs r5, #2
	adds r4, r4, r5
	adds r0, r7, #0
	bl GetItemIconId
	adds r1, r0, #0
	movs r2, #0x80
	lsls r2, r2, #7
	adds r0, r4, #0
	bl DrawIcon
	ldr r0, _0801FD6C  @ ProcScr_Popup2
	mov r1, r8
	bl Proc_StartBlocking
	add sp, #0xc
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801FD68: .4byte gUnknown_02022EEA
_0801FD6C: .4byte ProcScr_Popup2

	THUMB_FUNC_END sub_801FC68

	THUMB_FUNC_START sub_801FD70
sub_801FD70: @ 0x0801FD70
	push {lr}
	movs r2, #0xf
	movs r3, #0x22
	bl sub_801FC68
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_801FD70

	THUMB_FUNC_START sub_801FD80
sub_801FD80: @ 0x0801FD80
	push {lr}
	movs r2, #0x10
	movs r3, #0x11
	bl sub_801FC68
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_801FD80

.align 2, 0 @ align with 0
