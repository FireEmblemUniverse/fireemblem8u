	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	THUMB_FUNC_START Event38_ChangeActiveUnit
Event38_ChangeActiveUnit: @ 0x08010618
	push {r4, lr}
	ldr r0, [r0, #0x38]
	movs r1, #2
	ldrsh r0, [r0, r1]
	bl GetUnitStructFromEventParameter
	adds r4, r0, #0
	cmp r4, #0
	beq _0801063C
	bl ClearActiveUnit
	ldr r0, _08010638  @ gActiveUnit
	str r4, [r0]
	movs r0, #0
	b _0801063E
	.align 2, 0
_08010638: .4byte gActiveUnit
_0801063C:
	movs r0, #6
_0801063E:
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END Event38_ChangeActiveUnit

	THUMB_FUNC_START Event39_
Event39_: @ 0x08010644
	push {r4, r5, r6, r7, lr}
	ldr r2, [r0, #0x38]
	ldrb r0, [r2]
	movs r3, #0xf
	ands r3, r0
	ldr r4, _0801066C  @ gEventSlots
	ldr r1, [r4, #4]
	ldrb r7, [r4, #4]
	lsrs r0, r1, #8
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	lsrs r1, r1, #0x10
	lsls r1, r1, #0x18
	lsrs r5, r1, #0x18
	cmp r3, #0
	beq _08010670
	cmp r3, #1
	beq _0801068C
	b _080106DC
	.align 2, 0
_0801066C: .4byte gEventSlots
_08010670:
	ldrh r1, [r2, #2]
	movs r3, #2
	ldrsh r0, [r2, r3]
	cmp r0, #0
	bge _0801067C
	ldrh r1, [r4, #8]
_0801067C:
	lsls r0, r1, #0x18
	lsrs r0, r0, #0x18
	adds r1, r7, #0
	adds r2, r6, #0
	adds r3, r5, #0
	bl sub_8011D10
	b _080106DC
_0801068C:
	ldrh r0, [r2, #2]
	lsrs r1, r0, #8
	ldrb r3, [r2, #2]
	movs r0, #2
	ldrsb r0, [r2, r0]
	cmp r0, #0
	blt _080106A0
	lsls r0, r1, #0x18
	cmp r0, #0
	bge _080106AC
_080106A0:
	ldrh r0, [r4, #0x2c]
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	ldrh r0, [r4, #0x2e]
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
_080106AC:
	lsls r1, r1, #0x18
	ldr r0, _080106CC  @ gBmMapUnit
	ldr r0, [r0]
	asrs r1, r1, #0x16
	adds r1, r1, r0
	lsls r0, r3, #0x18
	asrs r0, r0, #0x18
	ldr r1, [r1]
	adds r1, r1, r0
	ldrb r0, [r1]
	cmp r0, #0
	beq _080106D0
	bl GetUnit
	b _080106D2
	.align 2, 0
_080106CC: .4byte gBmMapUnit
_080106D0:
	movs r0, #0
_080106D2:
	adds r1, r7, #0
	adds r2, r6, #0
	adds r3, r5, #0
	bl sub_8011CCC
_080106DC:
	movs r0, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END Event39_

	THUMB_FUNC_START Event3A_
Event3A_: @ 0x080106E4
	push {r4, r5, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x3c]
	lsrs r0, r0, #2
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _080106F8
	movs r0, #0
	b _08010742
_080106F8:
	ldr r1, [r4, #0x38]
	ldrb r0, [r1]
	movs r2, #0xf
	ands r2, r0
	ldrh r3, [r1, #2]
	movs r5, #2
	ldrsh r0, [r1, r5]
	cmp r0, #0
	bge _0801070E
	ldr r0, _08010718  @ gEventSlots
	ldrh r3, [r0, #8]
_0801070E:
	cmp r2, #0
	beq _0801071C
	cmp r2, #1
	beq _0801072A
	b _08010740
	.align 2, 0
_08010718: .4byte gEventSlots
_0801071C:
	ldrh r1, [r1, #4]
	lsls r0, r3, #0x10
	asrs r0, r0, #0x10
	adds r2, r4, #0
	bl NewPopup_VerySimple
	b _08010740
_0801072A:
	ldrh r2, [r1, #6]
	lsls r0, r3, #0x10
	asrs r0, r0, #0x10
	ldrb r1, [r1, #6]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	lsls r2, r2, #0x10
	asrs r2, r2, #0x18
	adds r3, r4, #0
	bl sub_8011C94
_08010740:
	movs r0, #2
_08010742:
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END Event3A_

	THUMB_FUNC_START sub_8010748
sub_8010748: @ 0x08010748
	push {r4, lr}
	adds r2, r0, #0
	adds r0, #0x68
	ldrh r0, [r0]
	movs r1, #0xc
	ands r1, r0
	cmp r1, #0
	beq _0801075E
	cmp r1, #4
	beq _0801077A
	b _08010796
_0801075E:
	adds r0, r2, #0
	adds r0, #0x64
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r0, r0, #4
	adds r1, r2, #0
	adds r1, #0x66
	movs r2, #0
	ldrsh r1, [r1, r2]
	lsls r1, r1, #4
	movs r2, #0
	bl PutMapCursor
	b _08010796
_0801077A:
	adds r0, r2, #0
	adds r0, #0x64
	movs r3, #0
	ldrsh r0, [r0, r3]
	adds r1, r2, #0
	adds r1, #0x66
	movs r3, #0
	ldrsh r1, [r1, r3]
	adds r4, r2, #0
	adds r4, #0x6a
	ldrh r2, [r4]
	bl sub_8010E6C
	strh r0, [r4]
_08010796:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8010748

	THUMB_FUNC_START Event3B_
Event3B_: @ 0x0801079C
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	ldrh r0, [r6, #0x3c]
	lsrs r0, r0, #2
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _080107B8
	ldr r0, _080107B4  @ gUnknown_08591F08
	bl Proc_EndEach
	b _08010844
	.align 2, 0
_080107B4: .4byte gUnknown_08591F08
_080107B8:
	ldr r1, [r6, #0x38]
	ldrb r0, [r1]
	movs r7, #0xf
	ands r7, r0
	movs r0, #3
	ands r0, r7
	cmp r0, #1
	beq _080107F8
	cmp r0, #1
	bgt _080107D2
	cmp r0, #0
	beq _080107D8
	b _0801081C
_080107D2:
	cmp r0, #2
	beq _0801080E
	b _0801081C
_080107D8:
	ldrh r0, [r1, #2]
	lsrs r4, r0, #8
	ldrb r5, [r1, #2]
	movs r0, #2
	ldrsb r0, [r1, r0]
	cmp r0, #0
	blt _080107EC
	lsls r0, r4, #0x18
	cmp r0, #0
	bge _0801081C
_080107EC:
	ldr r0, _080107F4  @ gUnknown_030004E4
	ldrb r5, [r0]
	ldrb r4, [r0, #2]
	b _0801081C
	.align 2, 0
_080107F4: .4byte gUnknown_030004E4
_080107F8:
	movs r2, #2
	ldrsh r0, [r1, r2]
	bl GetUnitStructFromEventParameter
	cmp r0, #0
	bne _08010808
	movs r0, #6
	b _08010846
_08010808:
	ldrb r5, [r0, #0x10]
	ldrb r4, [r0, #0x11]
	b _0801081C
_0801080E:
	ldr r0, _08010818  @ gUnknown_08591F08
	bl Proc_EndEach
	movs r0, #2
	b _08010846
	.align 2, 0
_08010818: .4byte gUnknown_08591F08
_0801081C:
	ldr r0, _0801084C  @ gUnknown_08591F08
	adds r1, r6, #0
	bl Proc_Start
	adds r3, r0, #0
	lsls r0, r5, #0x18
	asrs r0, r0, #0x18
	adds r1, r3, #0
	adds r1, #0x64
	movs r2, #0
	strh r0, [r1]
	lsls r0, r4, #0x18
	asrs r0, r0, #0x18
	adds r1, #2
	strh r0, [r1]
	adds r0, r3, #0
	adds r0, #0x68
	strh r7, [r0]
	adds r0, #2
	strh r2, [r0]
_08010844:
	movs r0, #0
_08010846:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0801084C: .4byte gUnknown_08591F08

	THUMB_FUNC_END Event3B_

	THUMB_FUNC_START Event3C_
Event3C_: @ 0x08010850
	push {lr}
	ldr r2, [r0, #0x38]
	ldrb r0, [r2]
	movs r1, #0xf
	ands r1, r0
	cmp r1, #0
	beq _08010864
	cmp r1, #1
	beq _0801087C
	b _080108A2
_08010864:
	ldr r2, _08010874  @ gUnknown_030004E8
	ldr r1, _08010878  @ gBmSt
	ldrh r0, [r1, #0x14]
	strh r0, [r2]
	ldrh r0, [r1, #0x16]
	strh r0, [r2, #2]
	b _080108A2
	.align 2, 0
_08010874: .4byte gUnknown_030004E8
_08010878: .4byte gBmSt
_0801087C:
	ldrh r0, [r2, #2]
	lsrs r1, r0, #8
	ldrb r3, [r2, #2]
	movs r0, #2
	ldrsb r0, [r2, r0]
	cmp r0, #0
	blt _08010890
	lsls r0, r1, #0x18
	cmp r0, #0
	bge _08010896
_08010890:
	ldr r0, _080108A8  @ gUnknown_030004E4
	ldrb r3, [r0]
	ldrb r1, [r0, #2]
_08010896:
	lsls r0, r3, #0x18
	asrs r0, r0, #0x18
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl SetCursorMapPosition
_080108A2:
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0
_080108A8: .4byte gUnknown_030004E4

	THUMB_FUNC_END Event3C_

	THUMB_FUNC_START Event3D_
Event3D_: @ 0x080108AC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x18
	adds r5, r0, #0
	ldr r1, _08010914  @ gUnknown_080D793F
	mov r0, sp
	movs r2, #0xf
	bl memcpy
	add r4, sp, #0x10
	ldr r1, _08010918  @ gUnknown_080D794E
	adds r0, r4, #0
	movs r2, #5
	bl memcpy
	ldr r1, [r5, #0x38]
	ldrb r0, [r1]
	movs r5, #0xf
	ands r5, r0
	ldrh r7, [r1, #2]
	bl ResetMenuOverrides
	movs r6, #1
	mov r8, r4
	cmp r5, #1
	beq _08010920
	cmp r5, #1
	bgt _08010950
	cmp r5, #0
	bne _08010950
	movs r5, #0
_080108EC:
	adds r0, r7, #0
	ands r0, r6
	cmp r0, #0
	beq _08010902
	mov r1, sp
	adds r0, r1, r5
	ldrb r0, [r0]
	movs r1, #1
	ldr r2, _0801091C  @ MenuAlwaysNotShown
	bl AddMenuOverride
_08010902:
	lsls r0, r6, #0x11
	lsrs r6, r0, #0x10
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #0xe
	bls _080108EC
	b _08010950
	.align 2, 0
_08010914: .4byte gUnknown_080D793F
_08010918: .4byte gUnknown_080D794E
_0801091C: .4byte MenuAlwaysNotShown
_08010920:
	movs r5, #0
_08010922:
	adds r0, r7, #0
	ands r0, r6
	cmp r0, #0
	beq _08010942
	mov r0, r8
	adds r4, r0, r5
	ldrb r0, [r4]
	movs r1, #1
	ldr r2, _08010960  @ MenuAlwaysDisabled
	bl AddMenuOverride
	ldrb r0, [r4]
	movs r1, #2
	ldr r2, _08010964  @ Get8
	bl AddMenuOverride
_08010942:
	lsls r0, r6, #0x11
	lsrs r6, r0, #0x10
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #4
	bls _08010922
_08010950:
	movs r0, #0
	add sp, #0x18
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08010960: .4byte MenuAlwaysDisabled
_08010964: .4byte Get8

	THUMB_FUNC_END Event3D_

	THUMB_FUNC_START Event3E_PrepScreenCall
Event3E_PrepScreenCall: @ 0x08010968
	push {r4, lr}
	adds r4, r0, #0
	bl HideAllUnits
	movs r0, #0x84
	bl ClearFlag
	ldr r0, _08010988  @ gProcScr_SALLYCURSOR
	adds r1, r4, #0
	bl Proc_StartBlocking
	movs r0, #2
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08010988: .4byte gProcScr_SALLYCURSOR

	THUMB_FUNC_END Event3E_PrepScreenCall

	THUMB_FUNC_START sub_801098C
sub_801098C: @ 0x0801098C
	push {r4, r5, r6, r7, lr}
	ldr r4, _08010A18  @ gEventSlotQueue
	ldr r3, _08010A1C  @ gUnknown_0203A974
	movs r5, #0
	ldr r0, _08010A20  @ gEventSlots
	ldr r1, [r0, #0x34]
	adds r7, r0, #0
	cmp r5, r1
	bcs _08010A04
	ldrb r0, [r4]
	cmp r0, #0xff
	beq _08010A04
	movs r6, #7
_080109A6:
	ldrh r2, [r4, #2]
	ldr r0, [r3]
	ldr r1, _08010A24  @ 0xFFF80000
	ands r0, r1
	orrs r0, r2
	str r0, [r3]
	ldrb r0, [r3, #2]
	adds r2, r6, #0
	ands r2, r0
	strb r2, [r3, #2]
	cmp r5, #0
	bne _080109CE
	ldr r0, [r3]
	lsls r0, r0, #8
	lsrs r0, r0, #0x1b
	movs r1, #1
	orrs r0, r1
	lsls r0, r0, #3
	orrs r0, r2
	strb r0, [r3, #2]
_080109CE:
	ldrb r0, [r4]
	cmp r0, #1
	bne _080109EA
	ldr r1, [r3]
	lsls r1, r1, #8
	lsrs r1, r1, #0x1b
	movs r0, #8
	orrs r1, r0
	lsls r1, r1, #3
	ldrb r2, [r3, #2]
	adds r0, r6, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3, #2]
_080109EA:
	ldrb r0, [r4, #1]
	strb r0, [r3, #3]
	adds r3, #4
	adds r4, #4
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r0, [r7, #0x34]
	cmp r5, r0
	bcs _08010A04
	ldrb r0, [r4]
	cmp r0, #0xff
	bne _080109A6
_08010A04:
	ldrb r0, [r3, #2]
	movs r1, #7
	ands r1, r0
	movs r0, #0x80
	orrs r1, r0
	strb r1, [r3, #2]
	ldr r0, _08010A1C  @ gUnknown_0203A974
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08010A18: .4byte gEventSlotQueue
_08010A1C: .4byte gUnknown_0203A974
_08010A20: .4byte gEventSlots
_08010A24: .4byte 0xFFF80000

	THUMB_FUNC_END sub_801098C

	THUMB_FUNC_START sub_8010A28
sub_8010A28: @ 0x08010A28
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r0, #0x64
	movs r1, #0
	ldrsh r4, [r0, r1]
	bl GetGameLock
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r4, r0
	bne _08010A50
	bl sub_80121D4
	ldr r0, [r5, #0x58]
	movs r1, #6
	bl Proc_SetMark
	adds r0, r5, #0
	bl Proc_Break
_08010A50:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8010A28

	THUMB_FUNC_START Event3F_
Event3F_: @ 0x08010A58
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	adds r6, r0, #0
	ldr r0, [r6, #0x38]
	ldrb r1, [r0]
	movs r7, #0xf
	ands r7, r1
	ldrh r4, [r0, #2]
	ldrh r5, [r0, #4]
	ldrh r1, [r0, #6]
	ldrb r0, [r0, #6]
	str r0, [sp, #0xc]
	lsrs r1, r1, #8
	str r1, [sp, #0x10]
	ldr r0, _08010A88  @ gEventSlots
	ldr r0, [r0, #0x34]
	cmp r0, #0
	bne _08010A8C
	movs r0, #0
	b _08010A90
	.align 2, 0
_08010A88: .4byte gEventSlots
_08010A8C:
	bl sub_801098C
_08010A90:
	mov r8, r0
	cmp r7, #0
	blt _08010B36
	cmp r7, #1
	ble _08010AA0
	cmp r7, #2
	beq _08010B2C
	b _08010B36
_08010AA0:
	lsls r0, r4, #0x10
	cmp r0, #0
	bge _08010AA8
	ldr r4, _08010AE0  @ 0x0000FFFE
_08010AA8:
	lsls r0, r5, #0x10
	cmp r0, #0
	bge _08010AB0
	ldr r5, _08010AE0  @ 0x0000FFFE
_08010AB0:
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	bl GetUnitStructFromEventParameter
	mov sl, r0
	lsls r0, r5, #0x10
	asrs r0, r0, #0x10
	bl GetUnitStructFromEventParameter
	mov r9, r0
	ldrh r2, [r6, #0x3c]
	lsrs r0, r2, #2
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _08010ADA
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r2
	cmp r0, #0
	beq _08010AE4
_08010ADA:
	movs r5, #0
	b _08010B06
	.align 2, 0
_08010AE0: .4byte 0x0000FFFE
_08010AE4:
	movs r5, #1
	ldr r0, _08010B28  @ gUnknown_08591F18
	adds r1, r6, #0
	bl Proc_StartBlocking
	adds r4, r0, #0
	str r6, [r4, #0x58]
	bl GetGameLock
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r4, #0x64
	strh r0, [r4]
	adds r0, r6, #0
	movs r1, #7
	bl Proc_SetMark
_08010B06:
	adds r3, r5, #0
	ldr r0, [sp, #0xc]
	str r0, [sp]
	mov r0, r8
	str r0, [sp, #4]
	negs r0, r7
	orrs r0, r7
	lsrs r0, r0, #0x1f
	str r0, [sp, #8]
	mov r0, sl
	mov r1, r9
	ldr r2, [sp, #0x10]
	bl sub_8011F5C
	movs r0, #2
	b _08010B38
	.align 2, 0
_08010B28: .4byte gUnknown_08591F18
_08010B2C:
	mov r0, r8
	bl SetScriptedBattle
	movs r0, #0
	b _08010B38
_08010B36:
	movs r0, #6
_08010B38:
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END Event3F_

	THUMB_FUNC_START sub_8010B48
sub_8010B48: @ 0x08010B48
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r0, #0x64
	movs r1, #0
	ldrsh r4, [r0, r1]
	bl GetGameLock
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r4, r0
	bne _08010B70
	bl sub_8012324
	ldr r0, [r5, #0x58]
	movs r1, #6
	bl Proc_SetMark
	adds r0, r5, #0
	bl Proc_Break
_08010B70:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8010B48

	THUMB_FUNC_START Event40_
Event40_: @ 0x08010B78
	push {r4, r5, r6, lr}
	mov r6, r9
	mov r5, r8
	push {r5, r6}
	adds r6, r0, #0
	ldr r0, [r6, #0x38]
	ldrh r5, [r0, #2]
	ldrh r1, [r0, #4]
	mov r8, r1
	ldrh r0, [r0, #6]
	mov r9, r0
	ldr r0, _08010BE8  @ gUnknown_08591F28
	adds r1, r6, #0
	bl Proc_StartBlocking
	adds r4, r0, #0
	str r6, [r4, #0x58]
	bl GetGameLock
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r4, #0x64
	strh r0, [r4]
	adds r0, r6, #0
	movs r1, #7
	bl Proc_SetMark
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	adds r0, r5, #0
	bl GetUnitStructFromEventParameter
	adds r4, r0, #0
	movs r1, #0
	bl SetUnitStatus
	mov r0, r8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	mov r1, r9
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov r9, r1
	adds r0, r4, #0
	mov r1, r8
	mov r2, r9
	bl sub_8012270
	movs r0, #2
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08010BE8: .4byte gUnknown_08591F28

	THUMB_FUNC_END Event40_

	THUMB_FUNC_START Event41_
Event41_: @ 0x08010BEC
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	ldrh r6, [r5, #0x3c]
	lsrs r4, r6, #2
	movs r0, #1
	ands r4, r0
	cmp r4, #0
	beq _08010C02
	movs r0, #0
	b _08010C68
_08010C02:
	ldr r2, [r5, #0x38]
	ldrb r0, [r2]
	movs r3, #0xf
	ands r3, r0
	cmp r3, #0
	blt _08010C66
	cmp r3, #1
	ble _08010C18
	cmp r3, #0xf
	beq _08010C56
	b _08010C66
_08010C18:
	ldrb r2, [r2, #2]
	adds r1, r2, #0
	lsls r0, r2, #0x18
	cmp r0, #0
	bge _08010C28
	ldr r0, _08010C40  @ gUnknown_030004E4
	ldrb r1, [r0]
	ldrb r2, [r0, #2]
_08010C28:
	movs r0, #0x40
	ands r0, r6
	cmp r0, #0
	bne _08010C44
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	movs r0, #1
	str r0, [sp]
	b _08010C4E
	.align 2, 0
_08010C40: .4byte gUnknown_030004E4
_08010C44:
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	str r4, [sp]
_08010C4E:
	adds r0, r5, #0
	bl StartEventWarpAnim_ret
	b _08010C66
_08010C56:
	bl EventWarpAnimExists_ret
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _08010C66
	movs r0, #3
	b _08010C68
_08010C66:
	movs r0, #2
_08010C68:
	add sp, #4
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	THUMB_FUNC_END Event41_

	THUMB_FUNC_START Event42_
Event42_: @ 0x08010C70
	push {r4, r5, lr}
	adds r2, r0, #0
	ldr r0, [r2, #0x38]
	ldrb r1, [r0]
	movs r3, #0xf
	ands r3, r1
	ldrh r1, [r0, #2]
	ldrb r5, [r0, #2]
	lsrs r4, r1, #8
	cmp r3, #0
	beq _08010C8C
	cmp r3, #0xf
	beq _08010CE2
	b _08010CE6
_08010C8C:
	ldrh r0, [r2, #0x3c]
	lsrs r0, r0, #2
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _08010CE6
	adds r0, r2, #0
	adds r0, #0x42
	ldrb r0, [r0]
	cmp r0, #5
	bhi _08010CD4
	lsls r0, r0, #2
	ldr r1, _08010CAC  @ _08010CB0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08010CAC: .4byte _08010CB0
_08010CB0: @ jump table
	.4byte _08010CC8 @ case 0
	.4byte _08010CCC @ case 1
	.4byte _08010CD0 @ case 2
	.4byte _08010CC8 @ case 3
	.4byte _08010CC8 @ case 4
	.4byte _08010CD0 @ case 5
_08010CC8:
	movs r3, #0
	b _08010CD4
_08010CCC:
	movs r3, #1
	b _08010CD4
_08010CD0:
	movs r0, #6
	b _08010CE8
_08010CD4:
	lsls r2, r4, #0x18
	asrs r2, r2, #0x18
	adds r0, r3, #0
	adds r1, r5, #0
	bl sub_8012C34
	b _08010CE6
_08010CE2:
	bl sub_8012C88
_08010CE6:
	movs r0, #0
_08010CE8:
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END Event42_

	THUMB_FUNC_START Event43_
Event43_: @ 0x08010CF0
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x3c]
	lsrs r0, r0, #2
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _08010D04
	movs r0, #0
	b _08010D20
_08010D04:
	ldr r0, [r4, #0x38]
	movs r1, #2
	ldrsh r0, [r0, r1]
	bl GetUnitStructFromEventParameter
	adds r1, r0, #0
	cmp r1, #0
	beq _08010D1E
	adds r0, r4, #0
	bl sub_8080E9C
	movs r0, #2
	b _08010D20
_08010D1E:
	movs r0, #6
_08010D20:
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END Event43_

	THUMB_FUNC_START Event44_
Event44_: @ 0x08010D28
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x3c]
	lsrs r0, r0, #2
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _08010D3C
	movs r0, #0
	b _08010D56
_08010D3C:
	ldr r0, [r4, #0x38]
	movs r1, #2
	ldrsh r0, [r0, r1]
	bl GetUnitStructFromEventParameter
	cmp r0, #0
	beq _08010D54
	adds r1, r4, #0
	bl sub_8012CFC
	movs r0, #2
	b _08010D56
_08010D54:
	movs r0, #6
_08010D56:
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END Event44_

	THUMB_FUNC_START Event45_
Event45_: @ 0x08010D5C
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r1, [r5, #0x38]
	ldrb r0, [r1]
	movs r4, #0xf
	ands r4, r0
	movs r2, #2
	ldrsh r0, [r1, r2]
	bl GetUnitStructFromEventParameter
	adds r2, r0, #0
	cmp r2, #0
	bne _08010D7A
	movs r0, #6
	b _08010DB8
_08010D7A:
	cmp r4, #0
	beq _08010D84
	cmp r4, #0xf
	beq _08010D9A
	b _08010DB6
_08010D84:
	ldrh r0, [r5, #0x3c]
	lsrs r0, r0, #2
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _08010DB6
	adds r0, r5, #0
	adds r1, r2, #0
	bl sub_8081020
	b _08010DB6
_08010D9A:
	ldrh r0, [r5, #0x3c]
	lsrs r0, r0, #2
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _08010DB2
	adds r0, r5, #0
	movs r1, #0x78
	bl sub_80811D0
	movs r0, #2
	b _08010DB8
_08010DB2:
	bl sub_8081068
_08010DB6:
	movs r0, #0
_08010DB8:
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END Event45_

	.align 2, 0 @ Don't pad with nop.
