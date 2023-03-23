	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	THUMB_FUNC_START savemenu_SetDifficultyChoice
savemenu_SetDifficultyChoice: @ 0x080AA52C
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _080AA54C  @ ProcScr_SaveMenu
	bl Proc_Find
	cmp r0, #0
	beq _080AA546
	adds r1, r0, #0
	adds r1, #0x2a
	strb r4, [r1]
	adds r0, #0x3d
	strb r5, [r0]
_080AA546:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080AA54C: .4byte ProcScr_SaveMenu

	THUMB_FUNC_END savemenu_SetDifficultyChoice

	THUMB_FUNC_START sub_80AA550
sub_80AA550: @ 0x080AA550
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r5, r0, #0
	mov r1, sp
	movs r0, #0
	strh r0, [r1]
	ldr r4, _080AA5F0  @ gUnknown_08A204B8
	ldr r1, [r4]
	ldr r2, _080AA5F4  @ 0x010000A2
	mov r0, sp
	bl CpuSet
	ldr r0, [r4]
	bl LoadBonusContentData
	cmp r0, #0
	beq _080AA5E6
	movs r0, #0
	str r0, [r5, #0x5c]
	str r0, [r5, #0x58]
	mov r8, r4
	movs r6, #0
	movs r0, #0xfc
	mov r9, r0
	movs r7, #0xf
_080AA588:
	mov r1, r8
	ldr r0, [r1]
	adds r2, r0, r6
	ldrb r0, [r2]
	movs r4, #3
	ands r4, r0
	cmp r4, #1
	bne _080AA5D2
	ldrb r0, [r2, #1]
	cmp r0, #3
	bne _080AA5B2
	str r4, [r5, #0x58]
	ldrb r1, [r2]
	mov r0, r9
	ands r0, r1
	adds r0, #2
	strb r0, [r2]
	movs r0, #0
	movs r1, #0x75
	bl sub_80A3F08
_080AA5B2:
	mov r1, r8
	ldr r0, [r1]
	adds r2, r0, r6
	ldrb r0, [r2, #1]
	cmp r0, #4
	bne _080AA5D2
	str r4, [r5, #0x5c]
	ldrb r1, [r2]
	mov r0, r9
	ands r0, r1
	adds r0, #2
	strb r0, [r2]
	movs r0, #0
	movs r1, #0x76
	bl sub_80A3F08
_080AA5D2:
	adds r6, #0x14
	subs r7, #1
	cmp r7, #0
	bge _080AA588
	ldr r0, [r5, #0x58]
	cmp r0, #0
	bne _080AA5F8
	ldr r0, [r5, #0x5c]
	cmp r0, #0
	bne _080AA5F8
_080AA5E6:
	adds r0, r5, #0
	movs r1, #0xa
	bl Proc_Goto
	b _080AA600
	.align 2, 0
_080AA5F0: .4byte gUnknown_08A204B8
_080AA5F4: .4byte 0x010000A2
_080AA5F8:
	ldr r0, _080AA610  @ 0x06014000
	movs r1, #9
	bl LoadDialogueBoxGfx
_080AA600:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080AA610: .4byte 0x06014000

	THUMB_FUNC_END sub_80AA550

	THUMB_FUNC_START sub_80AA614
sub_80AA614: @ 0x080AA614
	push {lr}
	adds r1, r0, #0
	ldr r0, [r1, #0x58]
	cmp r0, #0
	beq _080AA64C
	adds r1, #0x4c
	movs r0, #0
	strh r0, [r1]
	ldr r2, _080AA644  @ 0x00000893
	movs r0, #0x40
	movs r1, #0x30
	bl StartHelpBoxExt_Unk
	ldr r0, _080AA648  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080AA654
	movs r0, #0x5b
	bl m4aSongNumStart
	b _080AA654
	.align 2, 0
_080AA644: .4byte 0x00000893
_080AA648: .4byte gPlaySt
_080AA64C:
	adds r0, r1, #0
	movs r1, #0
	bl Proc_Goto
_080AA654:
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80AA614

	THUMB_FUNC_START sub_80AA658
sub_80AA658: @ 0x080AA658
	push {lr}
	adds r1, r0, #0
	ldr r0, [r1, #0x5c]
	cmp r0, #0
	beq _080AA690
	adds r1, #0x4c
	movs r0, #0
	strh r0, [r1]
	ldr r2, _080AA688  @ 0x00000894
	movs r0, #0x40
	movs r1, #0x30
	bl StartHelpBoxExt_Unk
	ldr r0, _080AA68C  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080AA698
	movs r0, #0x5b
	bl m4aSongNumStart
	b _080AA698
	.align 2, 0
_080AA688: .4byte 0x00000894
_080AA68C: .4byte gPlaySt
_080AA690:
	adds r0, r1, #0
	movs r1, #1
	bl Proc_Goto
_080AA698:
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80AA658

	THUMB_FUNC_START sub_80AA69C
sub_80AA69C: @ 0x080AA69C
	push {r4, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x4c
	ldrh r2, [r1]
	movs r3, #0
	ldrsh r0, [r1, r3]
	cmp r0, #0x1e
	ble _080AA6CC
	ldr r0, _080AA6C8  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0xb
	ands r0, r1
	cmp r0, #0
	beq _080AA6D0
	bl CloseHelpBox
	adds r0, r4, #0
	bl Proc_Break
	b _080AA6D0
	.align 2, 0
_080AA6C8: .4byte gKeyStatusPtr
_080AA6CC:
	adds r0, r2, #1
	strh r0, [r1]
_080AA6D0:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80AA69C

	THUMB_FUNC_START sub_80AA6D8
sub_80AA6D8: @ 0x080AA6D8
	push {lr}
	ldr r0, _080AA6E8  @ gUnknown_08A204B8
	ldr r0, [r0]
	bl SaveBonusContentData
	pop {r0}
	bx r0
	.align 2, 0
_080AA6E8: .4byte gUnknown_08A204B8

	THUMB_FUNC_END sub_80AA6D8

	THUMB_FUNC_START sub_80AA6EC
sub_80AA6EC: @ 0x080AA6EC
	push {lr}
	adds r1, r0, #0
	ldr r0, _080AA6FC  @ gUnknown_08A204BC
	bl Proc_StartBlocking
	pop {r0}
	bx r0
	.align 2, 0
_080AA6FC: .4byte gUnknown_08A204BC

	THUMB_FUNC_END sub_80AA6EC

	THUMB_FUNC_START sub_80AA700
sub_80AA700: @ 0x080AA700
	ldr r1, _080AA714  @ gUnknown_0203EF64
	movs r0, #0
	strb r0, [r1]
	movs r0, #0xff
	strb r0, [r1, #1]
	movs r0, #1
	negs r0, r0
	strb r0, [r1, #2]
	bx lr
	.align 2, 0
_080AA714: .4byte gUnknown_0203EF64

	THUMB_FUNC_END sub_80AA700

	THUMB_FUNC_START sub_80AA718
sub_80AA718: @ 0x080AA718
	push {lr}
	ldr r1, _080AA734  @ gUnknown_0203EF64
	ldrb r0, [r1]
	cmp r0, #0
	beq _080AA73C
	ldr r2, _080AA738  @ gCharacterData
	subs r0, #1
	movs r1, #0x34
	muls r0, r1, r0
	adds r0, r0, r2
	ldrh r0, [r0]
	bl GetStringFromIndex
	b _080AA73E
	.align 2, 0
_080AA734: .4byte gUnknown_0203EF64
_080AA738: .4byte gCharacterData
_080AA73C:
	movs r0, #0
_080AA73E:
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80AA718

	THUMB_FUNC_START sub_80AA744
sub_80AA744: @ 0x080AA744
	push {lr}
	ldr r1, _080AA75C  @ gUnknown_0203EF64
	ldrb r0, [r1]
	cmp r0, #0
	beq _080AA756
	movs r0, #1
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bge _080AA760
_080AA756:
	movs r0, #1
	negs r0, r0
	b _080AA764
	.align 2, 0
_080AA75C: .4byte gUnknown_0203EF64
_080AA760:
	movs r0, #1
	ldrsb r0, [r1, r0]
_080AA764:
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80AA744

	THUMB_FUNC_START sub_80AA768
sub_80AA768: @ 0x080AA768
	push {lr}
	ldr r1, _080AA780  @ gUnknown_0203EF64
	ldrb r0, [r1]
	cmp r0, #0
	beq _080AA77A
	movs r0, #2
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bge _080AA784
_080AA77A:
	movs r0, #0
	b _080AA78C
	.align 2, 0
_080AA780: .4byte gUnknown_0203EF64
_080AA784:
	movs r0, #2
	ldrsb r0, [r1, r0]
	bl sub_80BBA28
_080AA78C:
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80AA768

	THUMB_FUNC_START sub_80AA790
sub_80AA790: @ 0x080AA790
	push {lr}
	lsls r2, r2, #4
	cmp r2, #0
	ble _080AA7A8
	adds r3, r0, #0
_080AA79A:
	ldrh r0, [r3]
	strh r0, [r1]
	adds r3, #2
	adds r1, #2
	subs r2, #1
	cmp r2, #0
	bne _080AA79A
_080AA7A8:
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80AA790

.align 2, 0
