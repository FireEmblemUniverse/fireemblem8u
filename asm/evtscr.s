	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	THUMB_FUNC_START Event00_NULL
Event00_NULL: @ 0x0800D5A0
	movs r0, #0
	bx lr

	THUMB_FUNC_END Event00_NULL

	THUMB_FUNC_START Event01_End
Event01_End: @ 0x0800D5A4
	push {r4, r5, r6, r7, lr}
	adds r3, r0, #0
	ldrh r1, [r3, #0x3c]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _0800D668
	ldr r0, [r3, #0x38]
	ldrb r1, [r0]
	movs r0, #0xf
	ands r0, r1
	ldr r7, _0800D62C  @ gUnknown_03000570
	cmp r0, #1
	bne _0800D5E2
	movs r2, #0
	adds r6, r7, #0
	movs r4, #0
	adds r5, r7, #4
_0800D5C8:
	lsls r0, r2, #0x18
	asrs r0, r0, #0x18
	lsls r2, r0, #3
	adds r1, r2, r6
	str r4, [r1]
	adds r2, r2, r5
	str r4, [r2]
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #7
	ble _0800D5C8
_0800D5E2:
	ldr r0, [r7]
	cmp r0, #0
	beq _0800D630
	str r0, [r3, #0x34]
	ldr r0, [r7, #4]
	str r0, [r3, #0x38]
	movs r2, #0
	adds r6, r7, #0
	adds r5, r7, #4
_0800D5F4:
	lsls r1, r2, #0x18
	asrs r1, r1, #0x18
	lsls r3, r1, #3
	adds r4, r3, r6
	adds r1, #1
	lsls r2, r1, #3
	adds r0, r2, r6
	ldr r0, [r0]
	str r0, [r4]
	adds r3, r3, r5
	adds r2, r2, r5
	ldr r0, [r2]
	str r0, [r3]
	lsls r1, r1, #0x18
	lsrs r2, r1, #0x18
	asrs r0, r1, #0x18
	cmp r0, #6
	ble _0800D5F4
	lsls r1, r0, #3
	adds r0, r1, r7
	movs r2, #0
	str r2, [r0]
	adds r0, r7, #4
	adds r1, r1, r0
	str r2, [r1]
	movs r0, #0
	b _0800D66A
	.align 2, 0
_0800D62C: .4byte gUnknown_03000570
_0800D630:
	adds r2, r3, #0
	adds r2, #0x41
	ldrb r0, [r2]
	cmp r0, #0
	beq _0800D640
	cmp r0, #1
	beq _0800D646
	b _0800D668
_0800D640:
	movs r0, #4
	strb r0, [r2]
	b _0800D668
_0800D646:
	ldrh r1, [r3, #0x3c]
	ldr r0, _0800D660  @ 0x0000FFFB
	ands r0, r1
	movs r1, #0x10
	orrs r0, r1
	strh r0, [r3, #0x3c]
	movs r0, #5
	strb r0, [r2]
	ldr r0, _0800D664  @ gUnknown_08592114
	str r0, [r3, #0x34]
	str r0, [r3, #0x38]
	movs r0, #1
	b _0800D66A
	.align 2, 0
_0800D660: .4byte 0x0000FFFB
_0800D664: .4byte gUnknown_08592114
_0800D668:
	movs r0, #5
_0800D66A:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END Event01_End

	THUMB_FUNC_START Event02_EvBitAndIdMod
Event02_EvBitAndIdMod: @ 0x0800D670
	push {r4, r5, r6, lr}
	adds r3, r0, #0
	ldr r1, [r3, #0x38]
	ldrh r2, [r1]
	movs r4, #7
	ands r4, r2
	movs r0, #0xf
	ands r0, r2
	lsrs r5, r0, #3
	ldrh r2, [r1, #2]
	movs r6, #2
	ldrsh r0, [r1, r6]
	cmp r0, #0
	bge _0800D690
	ldr r0, _0800D69C  @ gEventSlots
	ldrh r2, [r0, #8]
_0800D690:
	cmp r4, #0
	beq _0800D6A0
	cmp r4, #1
	beq _0800D6C4
	b _0800D6DA
	.align 2, 0
_0800D69C: .4byte gEventSlots
_0800D6A0:
	cmp r5, #0
	bne _0800D6B4
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	movs r1, #1
	lsls r1, r0
	ldrh r0, [r3, #0x3c]
	bics r0, r1
	strh r0, [r3, #0x3c]
	b _0800D6DA
_0800D6B4:
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	movs r1, #1
	lsls r1, r0
	ldrh r0, [r3, #0x3c]
	orrs r1, r0
	strh r1, [r3, #0x3c]
	b _0800D6DA
_0800D6C4:
	cmp r5, #0
	bne _0800D6D2
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	bl UnsetEventId
	b _0800D6DA
_0800D6D2:
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	bl SetEventId
_0800D6DA:
	movs r0, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	THUMB_FUNC_END Event02_EvBitAndIdMod

	THUMB_FUNC_START Event03_CheckEvBitOrId
Event03_CheckEvBitOrId: @ 0x0800D6E4
	push {r4, lr}
	adds r3, r0, #0
	ldr r0, [r3, #0x38]
	ldrb r1, [r0]
	movs r4, #0xf
	ands r4, r1
	ldrh r2, [r0, #2]
	movs r1, #2
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bge _0800D6FE
	ldr r0, _0800D708  @ gEventSlots
	ldrh r2, [r0, #8]
_0800D6FE:
	cmp r4, #0
	beq _0800D70C
	cmp r4, #1
	beq _0800D728
	b _0800D748
	.align 2, 0
_0800D708: .4byte gEventSlots
_0800D70C:
	ldrh r1, [r3, #0x3c]
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	asrs r1, r0
	movs r2, #1
	ands r1, r2
	cmp r1, #0
	beq _0800D744
	ldr r0, _0800D724  @ gEventSlots
	str r2, [r0, #0x30]
	b _0800D748
	.align 2, 0
_0800D724: .4byte gEventSlots
_0800D728:
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	bl CheckEventId
	lsls r0, r0, #0x18
	asrs r1, r0, #0x18
	cmp r1, #0
	bne _0800D744
	ldr r0, _0800D740  @ gEventSlots
	str r1, [r0, #0x30]
	b _0800D748
	.align 2, 0
_0800D740: .4byte gEventSlots
_0800D744:
	ldr r0, _0800D750  @ gEventSlots
	str r4, [r0, #0x30]
_0800D748:
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0800D750: .4byte gEventSlots

	THUMB_FUNC_END Event03_CheckEvBitOrId

	THUMB_FUNC_START Event04_CheckRandom
Event04_CheckRandom: @ 0x0800D754
	push {lr}
	ldr r0, [r0, #0x38]
	ldrh r1, [r0, #2]
	cmp r1, #0
	bne _0800D768
	ldr r0, _0800D764  @ gEventSlots
	str r1, [r0, #0x30]
	b _0800D772
	.align 2, 0
_0800D764: .4byte gEventSlots
_0800D768:
	adds r0, r1, #1
	bl NextRN_N
	ldr r1, _0800D778  @ gEventSlots
	str r0, [r1, #0x30]
_0800D772:
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0
_0800D778: .4byte gEventSlots

	THUMB_FUNC_END Event04_CheckRandom

	THUMB_FUNC_START Event05_SetSlot
Event05_SetSlot: @ 0x0800D77C
	ldr r1, [r0, #0x38]
	ldrh r0, [r1, #2]
	ldr r2, [r1, #4]
	ldr r1, _0800D790  @ gEventSlots
	lsls r0, r0, #2
	adds r0, r0, r1
	str r2, [r0]
	movs r0, #0
	bx lr
	.align 2, 0
_0800D790: .4byte gEventSlots

	THUMB_FUNC_END Event05_SetSlot

	THUMB_FUNC_START Event06_SlotOperation
Event06_SlotOperation: @ 0x0800D794
	push {r4, r5, r6, lr}
	ldr r2, [r0, #0x38]
	ldrb r0, [r2]
	movs r1, #0xf
	adds r4, r1, #0
	ands r4, r0
	ldrh r0, [r2, #2]
	adds r3, r1, #0
	ands r3, r0
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x14
	ands r5, r1
	lsrs r6, r0, #0x18
	ands r6, r1
	cmp r4, #9
	bls _0800D7B6
	b _0800D910
_0800D7B6:
	lsls r0, r4, #2
	ldr r1, _0800D7C0  @ _0800D7C4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0800D7C0: .4byte _0800D7C4
_0800D7C4: @ jump table
	.4byte _0800D7EC @ case 0
	.4byte _0800D808 @ case 1
	.4byte _0800D824 @ case 2
	.4byte _0800D844 @ case 3
	.4byte _0800D860 @ case 4
	.4byte _0800D880 @ case 5
	.4byte _0800D89C @ case 6
	.4byte _0800D8B8 @ case 7
	.4byte _0800D8D4 @ case 8
	.4byte _0800D8F0 @ case 9
_0800D7EC:
	ldr r2, _0800D804  @ gEventSlots
	lsls r3, r3, #2
	adds r3, r3, r2
	lsls r1, r5, #2
	adds r1, r1, r2
	lsls r0, r6, #2
	adds r0, r0, r2
	ldr r1, [r1]
	ldr r0, [r0]
	adds r1, r1, r0
	b _0800D904
	.align 2, 0
_0800D804: .4byte gEventSlots
_0800D808:
	ldr r2, _0800D820  @ gEventSlots
	lsls r3, r3, #2
	adds r3, r3, r2
	lsls r1, r5, #2
	adds r1, r1, r2
	lsls r0, r6, #2
	adds r0, r0, r2
	ldr r1, [r1]
	ldr r0, [r0]
	subs r1, r1, r0
	b _0800D904
	.align 2, 0
_0800D820: .4byte gEventSlots
_0800D824:
	ldr r2, _0800D840  @ gEventSlots
	lsls r3, r3, #2
	adds r3, r3, r2
	lsls r1, r5, #2
	adds r1, r1, r2
	lsls r0, r6, #2
	adds r0, r0, r2
	ldr r1, [r1]
	ldr r0, [r0]
	muls r0, r1, r0
	str r0, [r3]
	movs r0, #0
	b _0800D912
	.align 2, 0
_0800D840: .4byte gEventSlots
_0800D844:
	ldr r2, _0800D85C  @ gEventSlots
	lsls r4, r3, #2
	adds r4, r4, r2
	lsls r0, r5, #2
	adds r0, r0, r2
	lsls r1, r6, #2
	adds r1, r1, r2
	ldr r0, [r0]
	ldr r1, [r1]
	bl __udivsi3
	b _0800D876
	.align 2, 0
_0800D85C: .4byte gEventSlots
_0800D860:
	ldr r2, _0800D87C  @ gEventSlots
	lsls r4, r3, #2
	adds r4, r4, r2
	lsls r0, r5, #2
	adds r0, r0, r2
	lsls r1, r6, #2
	adds r1, r1, r2
	ldr r0, [r0]
	ldr r1, [r1]
	bl __umodsi3
_0800D876:
	str r0, [r4]
	movs r0, #0
	b _0800D912
	.align 2, 0
_0800D87C: .4byte gEventSlots
_0800D880:
	ldr r2, _0800D898  @ gEventSlots
	lsls r3, r3, #2
	adds r3, r3, r2
	lsls r1, r5, #2
	adds r1, r1, r2
	lsls r0, r6, #2
	adds r0, r0, r2
	ldr r1, [r1]
	ldr r0, [r0]
	ands r1, r0
	b _0800D904
	.align 2, 0
_0800D898: .4byte gEventSlots
_0800D89C:
	ldr r2, _0800D8B4  @ gEventSlots
	lsls r3, r3, #2
	adds r3, r3, r2
	lsls r1, r5, #2
	adds r1, r1, r2
	lsls r0, r6, #2
	adds r0, r0, r2
	ldr r1, [r1]
	ldr r0, [r0]
	orrs r1, r0
	b _0800D904
	.align 2, 0
_0800D8B4: .4byte gEventSlots
_0800D8B8:
	ldr r2, _0800D8D0  @ gEventSlots
	lsls r3, r3, #2
	adds r3, r3, r2
	lsls r1, r5, #2
	adds r1, r1, r2
	lsls r0, r6, #2
	adds r0, r0, r2
	ldr r1, [r1]
	ldr r0, [r0]
	eors r1, r0
	b _0800D904
	.align 2, 0
_0800D8D0: .4byte gEventSlots
_0800D8D4:
	ldr r2, _0800D8EC  @ gEventSlots
	lsls r3, r3, #2
	adds r3, r3, r2
	lsls r1, r5, #2
	adds r1, r1, r2
	lsls r0, r6, #2
	adds r0, r0, r2
	ldr r1, [r1]
	ldr r0, [r0]
	lsls r1, r0
	b _0800D904
	.align 2, 0
_0800D8EC: .4byte gEventSlots
_0800D8F0:
	ldr r2, _0800D90C  @ gEventSlots
	lsls r3, r3, #2
	adds r3, r3, r2
	lsls r1, r5, #2
	adds r1, r1, r2
	lsls r0, r6, #2
	adds r0, r0, r2
	ldr r1, [r1]
	ldr r0, [r0]
	lsrs r1, r0
_0800D904:
	str r1, [r3]
	movs r0, #0
	b _0800D912
	.align 2, 0
_0800D90C: .4byte gEventSlots
_0800D910:
	movs r0, #6
_0800D912:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	THUMB_FUNC_END Event06_SlotOperation

	THUMB_FUNC_START Event07_SlotQueueOperations
Event07_SlotQueueOperations: @ 0x0800D918
	push {r4, lr}
	ldr r1, [r0, #0x38]
	ldrb r0, [r1]
	movs r2, #0xf
	ands r2, r0
	adds r0, r2, #0
	cmp r2, #1
	beq _0800D950
	cmp r2, #1
	bgt _0800D932
	cmp r2, #0
	beq _0800D938
	b _0800D970
_0800D932:
	cmp r0, #2
	beq _0800D960
	b _0800D970
_0800D938:
	ldr r0, _0800D94C  @ gEventSlots
	movs r2, #2
	ldrsh r1, [r1, r2]
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r0, [r1]
	bl SlotQueuePush
	b _0800D970
	.align 2, 0
_0800D94C: .4byte gEventSlots
_0800D950:
	ldr r0, _0800D95C  @ gEventSlots
	ldr r0, [r0, #4]
	bl SlotQueuePush
	b _0800D970
	.align 2, 0
_0800D95C: .4byte gEventSlots
_0800D960:
	ldrh r4, [r1, #2]
	bl SlotQueuePop
	ldr r2, _0800D978  @ gEventSlots
	lsls r1, r4, #0x10
	asrs r1, r1, #0xe
	adds r1, r1, r2
	str r0, [r1]
_0800D970:
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0800D978: .4byte gEventSlots

	THUMB_FUNC_END Event07_SlotQueueOperations

	THUMB_FUNC_START Event08_Label
Event08_Label: @ 0x0800D97C
	movs r0, #0
	bx lr

	THUMB_FUNC_END Event08_Label

	THUMB_FUNC_START Event09_Goto
Event09_Goto: @ 0x0800D980
	push {r4, lr}
	adds r3, r0, #0
	ldr r0, [r3, #0x38]
	ldrh r0, [r0, #2]
	lsls r2, r0, #0x10
	movs r0, #0x82
	lsls r0, r0, #4
	orrs r2, r0
	ldr r1, [r3, #0x34]
	str r1, [r3, #0x38]
	ldr r0, [r1]
	cmp r0, r2
	beq _0800D9AE
	movs r4, #0xf
_0800D99C:
	ldrh r0, [r1]
	lsrs r0, r0, #4
	ands r0, r4
	lsls r0, r0, #1
	adds r1, r1, r0
	ldr r0, [r1]
	cmp r0, r2
	bne _0800D99C
	str r1, [r3, #0x38]
_0800D9AE:
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END Event09_Goto

	THUMB_FUNC_START Event0A_Call
Event0A_Call: @ 0x0800D9B8
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	adds r6, r0, #0
	ldr r0, [r6, #0x38]
	ldrh r5, [r0, #4]
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	orrs r5, r0
	cmp r5, #0
	bge _0800D9D4
	ldr r0, _0800DA24  @ gEventSlots
	ldr r5, [r0, #8]
_0800D9D4:
	movs r0, #7
	ldr r1, _0800DA28  @ gUnknown_03000570
	mov r8, r1
	mov ip, r8
	movs r7, #4
	add r7, r8
	mov r9, r7
_0800D9E2:
	lsls r1, r0, #0x18
	asrs r1, r1, #0x18
	lsls r3, r1, #3
	mov r0, ip
	adds r4, r3, r0
	subs r1, #1
	lsls r2, r1, #3
	adds r0, r2, r0
	ldr r0, [r0]
	str r0, [r4]
	add r3, r9
	add r2, r9
	ldr r0, [r2]
	str r0, [r3]
	lsls r1, r1, #0x18
	lsrs r0, r1, #0x18
	cmp r1, #0
	bgt _0800D9E2
	ldr r0, [r6, #0x34]
	mov r1, r8
	str r0, [r1]
	ldr r0, [r6, #0x38]
	str r0, [r1, #4]
	str r5, [r6, #0x34]
	str r5, [r6, #0x38]
	movs r0, #4
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0800DA24: .4byte gEventSlots
_0800DA28: .4byte gUnknown_03000570

	THUMB_FUNC_END Event0A_Call

	THUMB_FUNC_START Event0B_
Event0B_: @ 0x0800DA2C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x38]
	ldrb r1, [r0]
	movs r3, #0xf
	ands r3, r1
	ldrh r1, [r0, #2]
	ldr r2, [r0, #4]
	cmp r2, #0
	bge _0800DA44
	ldr r0, _0800DA54  @ gEventSlots
	ldr r2, [r0, #8]
_0800DA44:
	cmp r2, #0
	beq _0800DA70
	cmp r3, #0
	beq _0800DA58
	cmp r3, #1
	beq _0800DA66
	b _0800DA70
	.align 2, 0
_0800DA54: .4byte gEventSlots
_0800DA58:
	adds r0, r4, #0
	adds r0, #0x41
	ldrb r1, [r0]
	adds r0, r2, #0
	bl CallEvent
	b _0800DA70
_0800DA66:
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r2, #0
	bl sub_8083DD8
_0800DA70:
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END Event0B_

	THUMB_FUNC_START Event0C_Branch
Event0C_Branch: @ 0x0800DA78
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x38]
	ldrb r1, [r0]
	movs r5, #0xf
	ands r5, r1
	ldrh r3, [r0, #4]
	ldrh r2, [r0, #6]
	ldr r1, _0800DAA4  @ gEventSlots
	lsls r0, r3, #2
	adds r0, r0, r1
	ldr r3, [r0]
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r2, [r0]
	cmp r5, #5
	bhi _0800DAF6
	lsls r0, r5, #2
	ldr r1, _0800DAA8  @ _0800DAAC
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0800DAA4: .4byte gEventSlots
_0800DAA8: .4byte _0800DAAC
_0800DAAC: @ jump table
	.4byte _0800DAC4 @ case 0
	.4byte _0800DACA @ case 1
	.4byte _0800DAD0 @ case 2
	.4byte _0800DAD6 @ case 3
	.4byte _0800DADC @ case 4
	.4byte _0800DAE2 @ case 5
_0800DAC4:
	cmp r3, r2
	beq _0800DAE6
	b _0800DAF2
_0800DACA:
	cmp r3, r2
	bne _0800DAE6
	b _0800DAF2
_0800DAD0:
	cmp r3, r2
	bge _0800DAE6
	b _0800DAF2
_0800DAD6:
	cmp r3, r2
	bgt _0800DAE6
	b _0800DAF2
_0800DADC:
	cmp r3, r2
	ble _0800DAE6
	b _0800DAF2
_0800DAE2:
	cmp r3, r2
	bge _0800DAF2
_0800DAE6:
	adds r0, r4, #0
	bl Event09_Goto
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	b _0800DAF8
_0800DAF2:
	movs r0, #0
	b _0800DAF8
_0800DAF6:
	movs r0, #6
_0800DAF8:
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END Event0C_Branch

	THUMB_FUNC_START Event0D_AsmCall
Event0D_AsmCall: @ 0x0800DB00
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x38]
	ldrb r2, [r0]
	movs r1, #0xf
	ldrh r3, [r0, #4]
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	orrs r3, r0
	ands r1, r2
	cmp r1, #1
	bne _0800DB28
	ldrh r0, [r4, #0x3c]
	lsrs r0, r0, #2
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0800DB28
	movs r0, #0
	b _0800DB30
_0800DB28:
	adds r0, r4, #0
	bl _call_via_r3
	movs r0, #2
_0800DB30:
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END Event0D_AsmCall

	THUMB_FUNC_START Event0E_STAL
Event0E_STAL: @ 0x0800DB38
	push {r4, r5, r6, r7, lr}
	adds r2, r0, #0
	ldr r7, [r2, #0x38]
	ldrb r0, [r7]
	movs r1, #0xf
	ands r1, r0
	adds r4, r1, #0
	ldrh r6, [r2, #0x3c]
	lsls r3, r6, #0x10
	lsrs r0, r3, #0x12
	movs r5, #1
	ands r0, r5
	cmp r0, #0
	bne _0800DBC4
	movs r0, #1
	ands r1, r0
	cmp r1, #0
	beq _0800DB72
	lsrs r0, r3, #0x13
	ands r0, r5
	cmp r0, #0
	bne _0800DBC4
	ldr r0, _0800DB84  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _0800DBC4
_0800DB72:
	ldrh r3, [r2, #0x3e]
	movs r1, #0x3e
	ldrsh r0, [r2, r1]
	cmp r0, #0
	bgt _0800DB88
	ldrh r0, [r7, #2]
	strh r0, [r2, #0x3e]
	b _0800DBD6
	.align 2, 0
_0800DB84: .4byte gKeyStatusPtr
_0800DB88:
	movs r5, #1
	movs r0, #0x40
	ands r0, r6
	cmp r0, #0
	bne _0800DBB6
	movs r0, #2
	ands r4, r0
	cmp r4, #0
	beq _0800DBB6
	ldr r0, _0800DBCC  @ gRAMChapterData
	adds r0, #0x40
	ldrb r0, [r0]
	lsrs r0, r0, #7
	cmp r0, #0
	bne _0800DBB4
	ldr r0, _0800DBD0  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #4]
	adds r0, r5, #0
	ands r0, r1
	cmp r0, #0
	beq _0800DBB6
_0800DBB4:
	movs r5, #4
_0800DBB6:
	lsls r0, r3, #0x10
	asrs r0, r0, #0x10
	subs r0, r0, r5
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r0, #0
	bgt _0800DBD4
_0800DBC4:
	movs r0, #0
	strh r0, [r2, #0x3e]
	b _0800DBD8
	.align 2, 0
_0800DBCC: .4byte gRAMChapterData
_0800DBD0: .4byte gKeyStatusPtr
_0800DBD4:
	strh r3, [r2, #0x3e]
_0800DBD6:
	movs r0, #3
_0800DBD8:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END Event0E_STAL

	THUMB_FUNC_START Event0F_
Event0F_: @ 0x0800DBE0
	push {r4, r5, r6, r7, lr}
	ldr r0, [r0, #0x38]
	ldrb r1, [r0]
	movs r2, #0xf
	mov ip, r2
	movs r7, #0xf
	adds r2, r7, #0
	ands r2, r1
	adds r4, r2, #0
	ldrh r5, [r0, #2]
	ldrb r0, [r0, #2]
	movs r1, #7
	ands r0, r1
	lsls r6, r0, #2
	cmp r2, #1
	beq _0800DC38
	cmp r2, #1
	bgt _0800DC10
	cmp r2, #0
	beq _0800DC20
	ldr r4, _0800DC0C  @ gEventSlotCounter
	b _0800DC78
	.align 2, 0
_0800DC0C: .4byte gEventSlotCounter
_0800DC10:
	cmp r4, #2
	beq _0800DC44
	cmp r4, #3
	beq _0800DC60
	ldr r4, _0800DC1C  @ gEventSlotCounter
	b _0800DC78
	.align 2, 0
_0800DC1C: .4byte gEventSlotCounter
_0800DC20:
	ldr r1, _0800DC30  @ gEventSlots
	ldr r0, _0800DC34  @ gEventSlotCounter
	ldr r0, [r0]
	lsrs r0, r6
	ands r0, r7
	str r0, [r1, #0x30]
	b _0800DC8A
	.align 2, 0
_0800DC30: .4byte gEventSlots
_0800DC34: .4byte gEventSlotCounter
_0800DC38:
	lsls r0, r5, #0x10
	lsrs r3, r0, #0x18
	ldr r4, _0800DC40  @ gEventSlotCounter
	b _0800DC78
	.align 2, 0
_0800DC40: .4byte gEventSlotCounter
_0800DC44:
	ldr r1, _0800DC5C  @ gEventSlotCounter
	ldr r0, [r1]
	lsrs r0, r6
	mov r2, ip
	ands r0, r2
	adds r3, r0, #1
	adds r4, r1, #0
	cmp r3, #0xf
	ble _0800DC78
	movs r3, #0xf
	b _0800DC78
	.align 2, 0
_0800DC5C: .4byte gEventSlotCounter
_0800DC60:
	ldr r1, _0800DC94  @ gEventSlotCounter
	ldr r0, [r1]
	lsrs r0, r6
	mov r2, ip
	ands r0, r2
	subs r0, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	adds r4, r1, #0
	cmp r0, #0
	bge _0800DC78
	movs r3, #0
_0800DC78:
	movs r0, #0xf
	adds r1, r0, #0
	lsls r1, r6
	ldr r2, [r4]
	bics r2, r1
	ands r3, r0
	lsls r3, r6
	orrs r2, r3
	str r2, [r4]
_0800DC8A:
	movs r0, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0800DC94: .4byte gEventSlotCounter

	THUMB_FUNC_END Event0F_

	THUMB_FUNC_START Event10_ModifyEvBit
Event10_ModifyEvBit: @ 0x0800DC98
	push {r4, lr}
	adds r2, r0, #0
	ldr r0, [r2, #0x38]
	ldrh r3, [r0, #2]
	ldrh r4, [r2, #0x3c]
	lsrs r0, r4, #2
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0800DCBE
	cmp r3, #0
	beq _0800DCBE
	ldr r0, _0800DCCC  @ 0x0000FFFB
	ands r0, r4
	movs r4, #0x80
	lsls r4, r4, #1
	adds r1, r4, #0
	orrs r0, r1
	strh r0, [r2, #0x3c]
_0800DCBE:
	cmp r3, #4
	bhi _0800DD50
	lsls r0, r3, #2
	ldr r1, _0800DCD0  @ _0800DCD4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0800DCCC: .4byte 0x0000FFFB
_0800DCD0: .4byte _0800DCD4
_0800DCD4: @ jump table
	.4byte _0800DCE8 @ case 0
	.4byte _0800DCFC @ case 1
	.4byte _0800DD0C @ case 2
	.4byte _0800DD24 @ case 3
	.4byte _0800DD38 @ case 4
_0800DCE8:
	ldrh r1, [r2, #0x3c]
	ldr r0, _0800DCF4  @ 0x0000FFEF
	ands r0, r1
	ldr r1, _0800DCF8  @ 0x0000FFDF
	ands r0, r1
	b _0800DD42
	.align 2, 0
_0800DCF4: .4byte 0x0000FFEF
_0800DCF8: .4byte 0x0000FFDF
_0800DCFC:
	ldrh r1, [r2, #0x3c]
	movs r0, #0x10
	orrs r0, r1
	movs r1, #0x20
	orrs r0, r1
	movs r1, #0x40
	orrs r0, r1
	b _0800DD46
_0800DD0C:
	ldrh r1, [r2, #0x3c]
	ldr r0, _0800DD1C  @ 0x0000FFEF
	ands r0, r1
	ldr r1, _0800DD20  @ 0x0000FFDF
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	b _0800DD46
	.align 2, 0
_0800DD1C: .4byte 0x0000FFEF
_0800DD20: .4byte 0x0000FFDF
_0800DD24:
	ldrh r1, [r2, #0x3c]
	movs r0, #0x10
	orrs r0, r1
	ldr r1, _0800DD34  @ 0x0000FFDF
	ands r0, r1
	subs r1, #0x20
	b _0800DD44
	.align 2, 0
_0800DD34: .4byte 0x0000FFDF
_0800DD38:
	ldrh r1, [r2, #0x3c]
	movs r0, #0x10
	orrs r0, r1
	movs r1, #0x20
	orrs r0, r1
_0800DD42:
	ldr r1, _0800DD4C  @ 0x0000FFBF
_0800DD44:
	ands r0, r1
_0800DD46:
	strh r0, [r2, #0x3c]
	movs r0, #0
	b _0800DD52
	.align 2, 0
_0800DD4C: .4byte 0x0000FFBF
_0800DD50:
	movs r0, #6
_0800DD52:
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END Event10_ModifyEvBit

	THUMB_FUNC_START Event11_SetIgnoredKeys
Event11_SetIgnoredKeys: @ 0x0800DD58
	push {lr}
	ldr r2, [r0, #0x38]
	ldrb r1, [r2]
	movs r0, #0xf
	ands r0, r1
	ldrh r1, [r2, #2]
	cmp r0, #0
	bne _0800DD6E
	adds r0, r1, #0
	bl SetKeyStatus_IgnoreMask
_0800DD6E:
	movs r0, #0
	pop {r1}
	bx r1

	THUMB_FUNC_END Event11_SetIgnoredKeys

	THUMB_FUNC_START Event12_
Event12_: @ 0x0800DD74
	push {lr}
	adds r2, r0, #0
	ldrh r0, [r2, #0x3c]
	lsrs r0, r0, #2
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0800DD88
	movs r0, #0
	b _0800DDA6
_0800DD88:
	ldr r0, [r2, #0x38]
	ldrh r1, [r0, #2]
	movs r2, #2
	ldrsh r0, [r0, r2]
	cmp r0, #0
	bge _0800DD98
	ldr r0, _0800DDAC  @ gEventSlots
	ldrh r1, [r0, #8]
_0800DD98:
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	movs r1, #3
	movs r2, #0
	bl Sound_PlaySong80024E4
	movs r0, #2
_0800DDA6:
	pop {r1}
	bx r1
	.align 2, 0
_0800DDAC: .4byte gEventSlots

	THUMB_FUNC_END Event12_

	THUMB_FUNC_START Event13_
Event13_: @ 0x0800DDB0
	push {r4, lr}
	adds r2, r0, #0
	ldr r0, [r2, #0x38]
	ldrb r1, [r0]
	movs r4, #0xf
	ands r4, r1
	ldrh r1, [r0, #2]
	movs r3, #2
	ldrsh r0, [r0, r3]
	cmp r0, #0
	bge _0800DDCA
	ldr r0, _0800DDE4  @ gEventSlots
	ldrh r1, [r0, #8]
_0800DDCA:
	lsls r0, r1, #0x10
	asrs r3, r0, #0x10
	ldr r0, _0800DDE8  @ 0x00007FFF
	cmp r3, r0
	beq _0800DDF8
	ldrh r0, [r2, #0x3c]
	lsrs r0, r0, #2
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0800DDEC
	movs r0, #0
	b _0800DE0E
	.align 2, 0
_0800DDE4: .4byte gEventSlots
_0800DDE8: .4byte 0x00007FFF
_0800DDEC:
	adds r0, r3, #0
	adds r1, r4, #0
	movs r2, #0
	bl Sound_PlaySong8002574
	b _0800DE0C
_0800DDF8:
	ldrh r0, [r2, #0x3c]
	lsrs r0, r0, #2
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0800DE06
	movs r4, #1
_0800DE06:
	adds r0, r4, #0
	bl Sound_FadeOut800231C
_0800DE0C:
	movs r0, #2
_0800DE0E:
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END Event13_

	THUMB_FUNC_START Event14_
Event14_: @ 0x0800DE14
	push {r4, lr}
	adds r3, r0, #0
	ldr r1, [r3, #0x38]
	ldrb r0, [r1]
	movs r2, #0xf
	ands r2, r0
	ldrh r4, [r1, #2]
	cmp r2, #0
	beq _0800DE2C
	cmp r2, #1
	beq _0800DE60
	b _0800DE6A
_0800DE2C:
	ldrh r0, [r3, #0x3c]
	lsls r1, r0, #0x10
	lsrs r0, r1, #0x12
	movs r2, #1
	ands r0, r2
	cmp r0, #0
	bne _0800DE42
	lsrs r0, r1, #0x13
	ands r0, r2
	cmp r0, #0
	beq _0800DE46
_0800DE42:
	movs r0, #0
	b _0800DE6C
_0800DE46:
	lsls r0, r4, #0x10
	cmp r0, #0
	bge _0800DE50
	ldr r0, _0800DE5C  @ gEventSlots
	ldrh r4, [r0, #8]
_0800DE50:
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	bl sub_8002620
	b _0800DE6A
	.align 2, 0
_0800DE5C: .4byte gEventSlots
_0800DE60:
	bl DeleteAll6CWaitMusicRelated
	adds r0, r4, #0
	bl sub_80026BC
_0800DE6A:
	movs r0, #2
_0800DE6C:
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END Event14_

	THUMB_FUNC_START Event15_
Event15_: @ 0x0800DE74
	push {lr}
	adds r3, r0, #0
	ldr r0, [r3, #0x38]
	ldrb r0, [r0]
	movs r1, #0xf
	ands r1, r0
	cmp r1, #0
	beq _0800DE8A
	cmp r1, #1
	beq _0800DEA8
	b _0800DECC
_0800DE8A:
	ldrh r0, [r3, #0x3c]
	lsrs r0, r0, #2
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0800DE9A
	movs r0, #0
	b _0800DECE
_0800DE9A:
	movs r0, #0x80
	lsls r0, r0, #1
	movs r1, #0x90
	movs r2, #0xa
	bl ISuspectThisToBeMusicRelated_8002730
	b _0800DECC
_0800DEA8:
	ldrh r0, [r3, #0x3c]
	lsrs r0, r0, #2
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0800DEC0
	movs r0, #0x80
	lsls r0, r0, #1
	bl Sound_SetVolume80022EC
	movs r0, #0
	b _0800DECE
_0800DEC0:
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #0x90
	movs r2, #0xa
	bl ISuspectThisToBeMusicRelated_8002730
_0800DECC:
	movs r0, #2
_0800DECE:
	pop {r1}
	bx r1

	THUMB_FUNC_END Event15_

	THUMB_FUNC_START Event16_
Event16_: @ 0x0800DED4
	push {lr}
	adds r3, r0, #0
	ldrh r0, [r3, #0x3c]
	lsls r1, r0, #0x10
	lsrs r0, r1, #0x12
	movs r2, #1
	ands r0, r2
	cmp r0, #0
	bne _0800DF10
	lsrs r0, r1, #0x13
	ands r0, r2
	cmp r0, #0
	bne _0800DF10
	ldr r0, [r3, #0x38]
	ldrh r1, [r0, #2]
	movs r2, #2
	ldrsh r0, [r0, r2]
	cmp r0, #0
	bge _0800DEFE
	ldr r0, _0800DF18  @ gEventSlots
	ldrh r1, [r0, #8]
_0800DEFE:
	ldr r0, _0800DF1C  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0800DF10
	adds r0, r1, #0
	bl m4aSongNumStart
_0800DF10:
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0
_0800DF18: .4byte gEventSlots
_0800DF1C: .4byte gRAMChapterData

	THUMB_FUNC_END Event16_

	THUMB_FUNC_START Event17_
Event17_: @ 0x0800DF20
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x3c]
	lsrs r0, r0, #2
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0800DF34
	movs r0, #0
	b _0800DFB4
_0800DF34:
	ldr r1, [r4, #0x38]
	ldrb r0, [r1]
	movs r2, #0xf
	ands r2, r0
	ldrh r0, [r1, #2]
	cmp r2, #1
	beq _0800DF5E
	cmp r2, #1
	bgt _0800DF4C
	cmp r2, #0
	beq _0800DF56
	b _0800DFB2
_0800DF4C:
	cmp r2, #2
	beq _0800DF66
	cmp r2, #3
	beq _0800DF9C
	b _0800DFB2
_0800DF56:
	adds r1, r4, #0
	bl sub_8013D20
	b _0800DF6C
_0800DF5E:
	adds r1, r4, #0
	bl sub_8013D08
	b _0800DFA2
_0800DF66:
	adds r1, r4, #0
	bl sub_8013D50
_0800DF6C:
	ldrh r1, [r4, #0x3c]
	ldr r0, _0800DF94  @ 0x0000FEFF
	ands r0, r1
	strh r0, [r4, #0x3c]
	ldr r2, _0800DF98  @ gLCDControlBuffer
	ldrb r0, [r2, #1]
	movs r1, #1
	orrs r0, r1
	movs r1, #2
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2, #1]
	movs r0, #2
	b _0800DFB4
	.align 2, 0
_0800DF94: .4byte 0x0000FEFF
_0800DF98: .4byte gLCDControlBuffer
_0800DF9C:
	adds r1, r4, #0
	bl sub_8013D38
_0800DFA2:
	ldrh r1, [r4, #0x3c]
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r2, #0
	orrs r0, r1
	strh r0, [r4, #0x3c]
	movs r0, #2
	b _0800DFB4
_0800DFB2:
	movs r0, #6
_0800DFB4:
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END Event17_

	THUMB_FUNC_START Event18_
Event18_: @ 0x0800DFBC
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	sub sp, #8
	adds r5, r0, #0
	ldr r0, [r5, #0x38]
	ldrb r1, [r0]
	movs r2, #0xf
	ands r2, r1
	adds r4, r2, #0
	ldrh r1, [r0, #2]
	ldrb r3, [r0, #2]
	lsrs r6, r1, #8
	ldrh r7, [r0, #4]
	ldrh r1, [r0, #6]
	mov r8, r1
	ldrh r1, [r0, #8]
	mov r9, r1
	ldrh r0, [r0, #0xa]
	mov ip, r0
	cmp r2, #1
	beq _0800E002
	cmp r2, #1
	bgt _0800DFF4
	cmp r2, #0
	beq _0800DFFA
	b _0800E05E
_0800DFF4:
	cmp r4, #2
	beq _0800E00A
	b _0800E05E
_0800DFFA:
	bl sub_80127C4
	movs r0, #2
	b _0800E060
_0800E002:
	bl sub_8012824
	movs r0, #2
	b _0800E060
_0800E00A:
	ldrh r2, [r5, #0x3c]
	lsrs r0, r2, #2
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _0800E020
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r2
	cmp r0, #0
	beq _0800E022
_0800E020:
	movs r7, #0
_0800E022:
	movs r4, #0
	lsls r2, r6, #0x18
	cmp r2, #0
	ble _0800E048
	movs r6, #1
_0800E02C:
	lsls r0, r3, #0x18
	asrs r0, r0, #0x18
	adds r1, r6, #0
	lsls r1, r0
	orrs r4, r1
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	movs r0, #0xff
	lsls r0, r0, #0x18
	adds r2, r2, r0
	asrs r0, r2, #0x18
	cmp r0, #0
	bgt _0800E02C
_0800E048:
	mov r1, ip
	str r1, [sp]
	str r5, [sp, #4]
	adds r0, r7, #0
	adds r1, r4, #0
	mov r2, r8
	mov r3, r9
	bl sub_8012890
	movs r0, #2
	b _0800E060
_0800E05E:
	movs r0, #6
_0800E060:
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END Event18_

	THUMB_FUNC_START Event19_
Event19_: @ 0x0800E070
	push {lr}
	adds r2, r0, #0
	ldr r0, [r2, #0x38]
	ldrb r0, [r0]
	movs r1, #0xf
	ands r1, r0
	cmp r1, #0xa
	bls _0800E082
	b _0800E17C
_0800E082:
	lsls r0, r1, #2
	ldr r1, _0800E08C  @ _0800E090
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0800E08C: .4byte _0800E090
_0800E090: @ jump table
	.4byte _0800E0BC @ case 0
	.4byte _0800E0CC @ case 1
	.4byte _0800E0DC @ case 2
	.4byte _0800E0E8 @ case 3
	.4byte _0800E0F8 @ case 4
	.4byte _0800E0FE @ case 5
	.4byte _0800E104 @ case 6
	.4byte _0800E10A @ case 7
	.4byte _0800E134 @ case 8
	.4byte _0800E144 @ case 9
	.4byte _0800E158 @ case 10
_0800E0BC:
	ldr r0, _0800E0C4  @ gEventSlots
	ldr r1, _0800E0C8  @ gRAMChapterData
	ldrb r1, [r1, #0x1b]
	b _0800E17A
	.align 2, 0
_0800E0C4: .4byte gEventSlots
_0800E0C8: .4byte gRAMChapterData
_0800E0CC:
	ldr r0, _0800E0D8  @ gEventSlots
	adds r1, r2, #0
	adds r1, #0x43
	ldrb r1, [r1]
	b _0800E17A
	.align 2, 0
_0800E0D8: .4byte gEventSlots
_0800E0DC:
	ldr r0, _0800E0E4  @ gRAMChapterData
	ldrb r1, [r0, #0x14]
	movs r0, #0x40
	b _0800E15E
	.align 2, 0
_0800E0E4: .4byte gRAMChapterData
_0800E0E8:
	ldr r0, _0800E0F0  @ gEventSlots
	ldr r1, _0800E0F4  @ gRAMChapterData
	ldrh r1, [r1, #0x10]
	b _0800E17A
	.align 2, 0
_0800E0F0: .4byte gEventSlots
_0800E0F4: .4byte gRAMChapterData
_0800E0F8:
	bl CountRedUnits
	b _0800E14A
_0800E0FE:
	bl CountGreenUnits
	b _0800E14A
_0800E104:
	bl GetChapterThing
	b _0800E138
_0800E10A:
	ldr r1, _0800E12C  @ gRAMChapterData
	adds r0, r1, #0
	adds r0, #0x42
	ldrb r0, [r0]
	lsls r0, r0, #0x1a
	cmp r0, #0
	blt _0800E122
	ldrb r1, [r1, #0x14]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0800E168
_0800E122:
	ldr r1, _0800E130  @ gEventSlots
	movs r0, #0
	str r0, [r1, #0x30]
	b _0800E17C
	.align 2, 0
_0800E12C: .4byte gRAMChapterData
_0800E130: .4byte gEventSlots
_0800E134:
	bl GetPartyGoldAmount
_0800E138:
	ldr r1, _0800E140  @ gEventSlots
	str r0, [r1, #0x30]
	b _0800E17C
	.align 2, 0
_0800E140: .4byte gEventSlots
_0800E144:
	ldr r0, [r2, #0x30]
	bl sub_80845E4
_0800E14A:
	ldr r1, _0800E154  @ gEventSlots
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [r1, #0x30]
	b _0800E17C
	.align 2, 0
_0800E154: .4byte gEventSlots
_0800E158:
	ldr r0, _0800E170  @ gRAMChapterData
	ldrb r1, [r0, #0x14]
	movs r0, #0x20
_0800E15E:
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0
	beq _0800E178
_0800E168:
	ldr r1, _0800E174  @ gEventSlots
	movs r0, #1
	str r0, [r1, #0x30]
	b _0800E17C
	.align 2, 0
_0800E170: .4byte gRAMChapterData
_0800E174: .4byte gEventSlots
_0800E178:
	ldr r0, _0800E184  @ gEventSlots
_0800E17A:
	str r1, [r0, #0x30]
_0800E17C:
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0
_0800E184: .4byte gEventSlots

	THUMB_FUNC_END Event19_

	THUMB_FUNC_START Event1A_TEXTSTART
Event1A_TEXTSTART: @ 0x0800E188
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x38]
	ldrb r0, [r0]
	movs r5, #0xf
	ands r5, r0
	adds r0, r4, #0
	adds r0, #0x42
	ldrb r0, [r0]
	cmp r5, r0
	beq _0800E1C8
	cmp r5, #5
	beq _0800E1C8
	bl sub_8006A7C
	bl sub_808F270
	bl sub_808BB74
	adds r0, r4, #0
	adds r0, #0x41
	ldrb r0, [r0]
	cmp r0, #1
	bne _0800E1C2
	adds r0, r4, #0
	adds r0, #0x44
	ldrh r0, [r0]
	bl sub_800BCDC
_0800E1C2:
	adds r0, r4, #0
	bl sub_800E640
_0800E1C8:
	adds r0, r4, #0
	adds r0, #0x42
	strb r5, [r0]
	cmp r5, #5
	bhi _0800E208
	lsls r0, r5, #2
	ldr r1, _0800E1DC  @ _0800E1E0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0800E1DC: .4byte _0800E1E0
_0800E1E0: @ jump table
	.4byte _0800E1F8 @ case 0
	.4byte _0800E1FC @ case 1
	.4byte _0800E1FC @ case 2
	.4byte _0800E1F8 @ case 3
	.4byte _0800E1F8 @ case 4
	.4byte _0800E1F8 @ case 5
_0800E1F8:
	movs r0, #2
	b _0800E20A
_0800E1FC:
	adds r0, r4, #0
	bl Event23_
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	b _0800E20A
_0800E208:
	movs r0, #6
_0800E20A:
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END Event1A_TEXTSTART

	THUMB_FUNC_START sub_800E210
sub_800E210: @ 0x0800E210
	push {r4, r5, lr}
	adds r4, r0, #0
	lsls r1, r1, #0x10
	lsrs r5, r1, #0x10
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	cmp r2, #1
	bne _0800E22A
	movs r0, #0x80
	movs r1, #2
	movs r2, #1
	bl sub_800680C
_0800E22A:
	ldrh r1, [r4, #0x3c]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #1
	bne _0800E258
	ldr r2, _0800E254  @ gRAMChapterData
	adds r2, #0x40
	ldrb r3, [r2]
	lsls r0, r3, #0x19
	lsrs r0, r0, #0x1e
	adds r1, r4, #0
	adds r1, #0x40
	strb r0, [r1]
	movs r0, #0x61
	negs r0, r0
	ands r0, r3
	movs r1, #0x20
	orrs r0, r1
	strb r0, [r2]
	b _0800E260
	.align 2, 0
_0800E254: .4byte gRAMChapterData
_0800E258:
	adds r1, r4, #0
	adds r1, #0x40
	movs r0, #0xff
	strb r0, [r1]
_0800E260:
	movs r0, #1
	movs r1, #1
	adds r2, r5, #0
	bl sub_8006A30
	ldrh r1, [r4, #0x3c]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _0800E27A
	movs r0, #4
	bl sub_8006AA8
_0800E27A:
	ldrh r1, [r4, #0x3c]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0800E28A
	movs r0, #8
	bl sub_8006AA8
_0800E28A:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_800E210

	THUMB_FUNC_START sub_800E290
sub_800E290: @ 0x0800E290
	push {r4, r5, lr}
	sub sp, #0x10
	adds r4, r2, #0
	lsls r1, r1, #0x10
	lsrs r5, r1, #0x10
	movs r1, #0x80
	lsls r1, r1, #3
	orrs r4, r1
	ldrh r1, [r0, #0x3c]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _0800E2AE
	movs r0, #0x40
	orrs r4, r0
_0800E2AE:
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0800E2BA
	ldr r0, _0800E310  @ 0x00002820
	orrs r4, r0
_0800E2BA:
	ldr r2, _0800E314  @ gLCDControlBuffer
	ldrb r1, [r2, #1]
	movs r0, #0x21
	negs r0, r0
	ands r0, r1
	movs r1, #0x41
	negs r1, r1
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r2, #1]
	bl LoadObjUIGfx
	movs r0, #0x80
	movs r1, #0
	movs r2, #1
	bl sub_800680C
	movs r0, #1
	bl BG_EnableSyncByMask
	str r5, [sp]
	ldr r0, _0800E318  @ 0x06011000
	str r0, [sp, #4]
	movs r0, #1
	negs r0, r0
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	movs r0, #3
	movs r1, #0x12
	movs r2, #0x14
	movs r3, #4
	bl sub_808F128
	adds r0, r4, #0
	bl sub_808E9D8
	add sp, #0x10
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0800E310: .4byte 0x00002820
_0800E314: .4byte gLCDControlBuffer
_0800E318: .4byte 0x06011000

	THUMB_FUNC_END sub_800E290

	THUMB_FUNC_START sub_800E31C
sub_800E31C: @ 0x0800E31C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	mov r8, r0
	adds r4, r2, #0
	lsls r1, r1, #0x10
	lsrs r7, r1, #0x10
	ldr r0, _0800E348  @ gUnknown_030004E4
	ldrb r6, [r0]
	ldrb r5, [r0, #2]
	cmp r6, #0xff
	bne _0800E34C
	cmp r5, #0xff
	bne _0800E34C
	movs r6, #0
	movs r5, #0
	movs r0, #0x80
	lsls r0, r0, #1
	orrs r4, r0
	b _0800E38A
	.align 2, 0
_0800E348: .4byte gUnknown_030004E4
_0800E34C:
	adds r0, r7, #0
	bl GetStringFromIndex
	bl sub_800A2A4
	add r2, sp, #4
	mov r1, sp
	bl sub_808AADC
	cmp r6, #0xff
	bne _0800E376
	ldr r0, [sp]
	movs r1, #0xe0
	subs r1, r1, r0
	lsrs r0, r1, #0x1f
	adds r1, r1, r0
	asrs r1, r1, #1
	subs r1, #8
	lsls r1, r1, #0x18
	lsrs r6, r1, #0x18
	b _0800E38A
_0800E376:
	cmp r5, #0xff
	bne _0800E38A
	ldr r0, [sp, #4]
	movs r1, #0x90
	subs r1, r1, r0
	lsrs r0, r1, #0x1f
	adds r1, r1, r0
	asrs r1, r1, #1
	lsls r1, r1, #0x18
	lsrs r5, r1, #0x18
_0800E38A:
	mov r0, r8
	ldrh r1, [r0, #0x3c]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _0800E39A
	movs r0, #0x80
	orrs r4, r0
_0800E39A:
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0800E3A6
	movs r0, #8
	orrs r4, r0
_0800E3A6:
	adds r0, r6, #0
	adds r1, r5, #0
	adds r2, r7, #0
	movs r3, #0
	bl sub_808AA04
	lsls r0, r4, #0x10
	lsrs r0, r0, #0x10
	bl sub_808A518
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_800E31C

	THUMB_FUNC_START Event1B_TEXTSHOW
Event1B_TEXTSHOW: @ 0x0800E3C8
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x38]
	ldrb r0, [r1]
	movs r2, #0xf
	ands r2, r0
	ldrh r3, [r1, #2]
	movs r5, #0
	cmp r2, #2
	beq _0800E3EC
	lsls r0, r3, #0x10
	cmp r0, #0
	bge _0800E3E6
	ldr r0, _0800E3FC  @ gEventSlots
	ldrh r3, [r0, #8]
_0800E3E6:
	cmp r3, #0
	bne _0800E3EC
	b _0800E514
_0800E3EC:
	cmp r2, #1
	beq _0800E462
	cmp r2, #1
	bgt _0800E400
	cmp r2, #0
	beq _0800E406
	b _0800E514
	.align 2, 0
_0800E3FC: .4byte gEventSlots
_0800E400:
	cmp r2, #2
	beq _0800E4DE
	b _0800E514
_0800E406:
	ldrh r0, [r4, #0x3c]
	ldr r1, _0800E430  @ 0x0000FFF7
	ands r1, r0
	strh r1, [r4, #0x3c]
	lsrs r1, r1, #2
	movs r0, #1
	ands r1, r0
	cmp r1, #0
	beq _0800E41A
	b _0800E514
_0800E41A:
	adds r0, r4, #0
	adds r0, #0x42
	ldrb r0, [r0]
	cmp r0, #5
	bhi _0800E514
	lsls r0, r0, #2
	ldr r1, _0800E434  @ _0800E438
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0800E430: .4byte 0x0000FFF7
_0800E434: .4byte _0800E438
_0800E438: @ jump table
	.4byte _0800E450 @ case 0
	.4byte _0800E450 @ case 1
	.4byte _0800E4B4 @ case 2
	.4byte _0800E45C @ case 3
	.4byte _0800E4C6 @ case 4
	.4byte _0800E4D2 @ case 5
_0800E450:
	adds r1, r3, #0
	adds r0, r4, #0
	movs r2, #1
	bl sub_800E210
	b _0800E514
_0800E45C:
	adds r1, r3, #0
	movs r2, #0x10
	b _0800E4D6
_0800E462:
	ldrh r0, [r4, #0x3c]
	lsls r1, r0, #0x10
	lsrs r0, r1, #0x12
	movs r2, #1
	ands r0, r2
	cmp r0, #0
	bne _0800E514
	lsrs r0, r1, #0x13
	ands r0, r2
	cmp r0, #0
	bne _0800E514
	adds r0, r4, #0
	adds r0, #0x42
	ldrb r0, [r0]
	cmp r0, #5
	bhi _0800E514
	lsls r0, r0, #2
	ldr r1, _0800E48C  @ _0800E490
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0800E48C: .4byte _0800E490
_0800E490: @ jump table
	.4byte _0800E4A8 @ case 0
	.4byte _0800E4A8 @ case 1
	.4byte _0800E4B4 @ case 2
	.4byte _0800E4C0 @ case 3
	.4byte _0800E4C6 @ case 4
	.4byte _0800E4D2 @ case 5
_0800E4A8:
	adds r1, r3, #0
	adds r0, r4, #0
	movs r2, #0
	bl sub_800E210
	b _0800E514
_0800E4B4:
	adds r1, r3, #0
	adds r0, r4, #0
	adds r2, r5, #0
	bl sub_800E290
	b _0800E514
_0800E4C0:
	adds r1, r3, #0
	movs r2, #0x10
	b _0800E4D6
_0800E4C6:
	adds r1, r3, #0
	adds r0, r4, #0
	adds r2, r5, #0
	bl sub_800E31C
	b _0800E514
_0800E4D2:
	adds r1, r3, #0
	movs r2, #0x30
_0800E4D6:
	adds r0, r4, #0
	bl sub_800E31C
	b _0800E514
_0800E4DE:
	ldrh r0, [r4, #0x3c]
	ldr r1, _0800E510  @ 0x0000FFF7
	ands r1, r0
	strh r1, [r4, #0x3c]
	bl sub_8006A7C
	bl sub_808F270
	bl sub_808BB74
	adds r0, r4, #0
	adds r0, #0x41
	ldrb r0, [r0]
	cmp r0, #1
	bne _0800E506
	adds r0, r4, #0
	adds r0, #0x44
	ldrh r0, [r0]
	bl sub_800BCDC
_0800E506:
	adds r0, r4, #0
	bl sub_800E640
	movs r0, #2
	b _0800E516
	.align 2, 0
_0800E510: .4byte 0x0000FFF7
_0800E514:
	movs r0, #0
_0800E516:
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END Event1B_TEXTSHOW

	THUMB_FUNC_START Event1C_TEXTCONT
Event1C_TEXTCONT: @ 0x0800E51C
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x3c]
	lsrs r0, r0, #2
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0800E554
	bl sub_8006A7C
	bl sub_808F270
	bl sub_808BB74
	adds r0, r4, #0
	adds r0, #0x41
	ldrb r0, [r0]
	cmp r0, #1
	bne _0800E54C
	adds r0, r4, #0
	adds r0, #0x44
	ldrh r0, [r0]
	bl sub_800BCDC
_0800E54C:
	adds r0, r4, #0
	bl sub_800E640
	b _0800E558
_0800E554:
	bl sub_8006EF0
_0800E558:
	movs r0, #2
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END Event1C_TEXTCONT

	THUMB_FUNC_START Event1D_TEXTEND
Event1D_TEXTEND: @ 0x0800E560
	push {r4, r5, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x3c]
	lsrs r0, r0, #2
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0800E5A0
	bl sub_8006A7C
	bl sub_808F270
	bl sub_808BB74
	adds r0, r4, #0
	adds r0, #0x41
	ldrb r0, [r0]
	cmp r0, #1
	bne _0800E590
	adds r0, r4, #0
	adds r0, #0x44
	ldrh r0, [r0]
	bl sub_800BCDC
_0800E590:
	adds r0, r4, #0
	bl sub_800E640
	ldr r1, _0800E59C  @ gEventSlots
	movs r0, #0
	b _0800E606
	.align 2, 0
_0800E59C: .4byte gEventSlots
_0800E5A0:
	movs r5, #0
	bl sub_80089D0
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0800E5B6
	bl sub_8006ED8
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0800E5CA
_0800E5B6:
	bl sub_808F284
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0800E5CA
	ldr r0, _0800E5FC  @ gUnknown_08A016E0
	bl Proc_Find
	cmp r0, #0
	beq _0800E5CC
_0800E5CA:
	movs r5, #1
_0800E5CC:
	cmp r5, #1
	bne _0800E600
	adds r0, r4, #0
	adds r0, #0x41
	ldrb r0, [r0]
	cmp r0, #0
	beq _0800E5F8
	cmp r0, #4
	beq _0800E5F8
	adds r0, r4, #0
	adds r0, #0x42
	ldrb r0, [r0]
	cmp r0, #0
	blt _0800E5F8
	cmp r0, #2
	bgt _0800E5F8
	movs r0, #1
	movs r1, #0x10
	movs r2, #1
	movs r3, #0
	bl SetSpecialColorEffectsParameters
_0800E5F8:
	movs r0, #3
	b _0800E630
	.align 2, 0
_0800E5FC: .4byte gUnknown_08A016E0
_0800E600:
	bl sub_8008A00
	ldr r1, _0800E638  @ gEventSlots
_0800E606:
	str r0, [r1, #0x30]
	adds r3, r4, #0
	adds r3, #0x40
	movs r1, #0
	ldrsb r1, [r3, r1]
	movs r0, #1
	negs r0, r0
	cmp r1, r0
	beq _0800E62E
	ldr r2, _0800E63C  @ gRAMChapterData
	adds r2, #0x40
	movs r0, #3
	ands r1, r0
	lsls r1, r1, #5
	ldrb r3, [r2]
	movs r0, #0x61
	negs r0, r0
	ands r0, r3
	orrs r0, r1
	strb r0, [r2]
_0800E62E:
	movs r0, #2
_0800E630:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0800E638: .4byte gEventSlots
_0800E63C: .4byte gRAMChapterData

	THUMB_FUNC_END Event1D_TEXTEND

	THUMB_FUNC_START sub_800E640
sub_800E640: @ 0x0800E640
	push {r4, lr}
	adds r4, r0, #0
	ldrh r1, [r4, #0x3c]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0800E668
	bl sub_80081A8
	ldr r0, _0800E664  @ gUnknown_08591154
	bl Proc_EndEach
	bl ResetFaces
	bl sub_80067E8
	b _0800E686
	.align 2, 0
_0800E664: .4byte gUnknown_08591154
_0800E668:
	bl Face6CExists
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0800E686
	bl sub_80081A8
	ldr r0, _0800E68C  @ gUnknown_08591154
	ldr r1, _0800E690  @ sub_8005F38
	bl Proc_ForEach
	ldr r0, _0800E694  @ gUnknown_08591DE8
	adds r1, r4, #0
	bl Proc_StartBlocking
_0800E686:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800E68C: .4byte gUnknown_08591154
_0800E690: .4byte sub_8005F38
_0800E694: .4byte gUnknown_08591DE8

	THUMB_FUNC_END sub_800E640

	THUMB_FUNC_START _WhileFace6CExists
_WhileFace6CExists: @ 0x0800E698
	push {r4, lr}
	adds r4, r0, #0
	bl Face6CExists
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0800E6AC
	adds r0, r4, #0
	bl Proc_Break
_0800E6AC:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END _WhileFace6CExists

	THUMB_FUNC_START Event1E_
Event1E_: @ 0x0800E6B4
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x38]
	ldrb r1, [r0]
	movs r6, #0xf
	ands r6, r1
	adds r2, r6, #0
	ldrh r5, [r0, #2]
	movs r3, #2
	ldrsh r1, [r0, r3]
	movs r0, #1
	negs r0, r0
	cmp r1, r0
	bne _0800E6D4
	ldr r0, _0800E714  @ gEventSlots
	ldrh r5, [r0, #8]
_0800E6D4:
	lsls r0, r5, #0x10
	asrs r1, r0, #0x10
	movs r0, #3
	negs r0, r0
	cmp r1, r0
	beq _0800E73C
	adds r0, #1
	cmp r1, r0
	beq _0800E71C
	ldrh r0, [r4, #0x3c]
	lsrs r2, r0, #2
	movs r3, #1
	ands r2, r3
	cmp r2, #0
	bne _0800E770
	ldr r0, _0800E718  @ gUnknown_03000428
	adds r1, r6, #0
	adds r1, #8
	strb r1, [r0]
	movs r1, #0x10
	strb r1, [r0, #1]
	strb r5, [r0, #2]
	strb r3, [r0, #3]
	strb r3, [r0, #4]
	strb r2, [r0, #5]
	movs r0, #0x80
	movs r1, #2
	movs r2, #1
	bl sub_800680C
	b _0800E766
	.align 2, 0
_0800E714: .4byte gEventSlots
_0800E718: .4byte gUnknown_03000428
_0800E71C:
	ldr r1, _0800E738  @ gUnknown_03000428
	adds r0, r2, #0
	adds r0, #8
	movs r2, #0
	strb r0, [r1]
	movs r0, #0x11
	strb r0, [r1, #1]
	movs r0, #1
	strb r0, [r1, #2]
	strb r2, [r1, #3]
	bl sub_80081A8
	b _0800E766
	.align 2, 0
_0800E738: .4byte gUnknown_03000428
_0800E73C:
	bl sub_8006A7C
	bl sub_808F270
	bl sub_808BB74
	adds r0, r4, #0
	adds r0, #0x41
	ldrb r0, [r0]
	cmp r0, #1
	bne _0800E75C
	adds r0, r4, #0
	adds r0, #0x44
	ldrh r0, [r0]
	bl sub_800BCDC
_0800E75C:
	adds r0, r4, #0
	bl sub_800E640
	movs r0, #2
	b _0800E772
_0800E766:
	ldr r2, _0800E778  @ gUnknown_03000428
	movs r0, #0
	movs r1, #0
	bl sub_8006A70
_0800E770:
	movs r0, #0
_0800E772:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0800E778: .4byte gUnknown_03000428

	THUMB_FUNC_END Event1E_

	THUMB_FUNC_START Event1F_
Event1F_: @ 0x0800E77C
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x3c]
	lsls r1, r0, #0x10
	lsrs r0, r1, #0x12
	movs r2, #1
	ands r0, r2
	cmp r0, #0
	bne _0800E7B6
	lsrs r3, r1, #0x13
	ands r3, r2
	cmp r3, #0
	bne _0800E7B6
	ldr r0, [r4, #0x38]
	ldrh r1, [r0, #2]
	ldrb r0, [r0, #2]
	lsrs r1, r1, #8
	ldr r2, _0800E7C0  @ gUnknown_03000430
	adds r0, #8
	strb r0, [r2]
	movs r0, #0x80
	strb r0, [r2, #1]
	adds r1, #0xa
	strb r1, [r2, #2]
	strb r3, [r2, #3]
	movs r0, #0
	movs r1, #0
	bl sub_8006A70
_0800E7B6:
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0800E7C0: .4byte gUnknown_03000430

	THUMB_FUNC_END Event1F_

	THUMB_FUNC_START Event20_
Event20_: @ 0x0800E7C4
	push {lr}
	bl sub_80081A8
	movs r0, #0
	pop {r1}
	bx r1

	THUMB_FUNC_END Event20_

	THUMB_FUNC_START sub_800E7D0
sub_800E7D0: @ 0x0800E7D0
	push {r4, r5, r6, lr}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	lsls r1, r1, #0x10
	lsrs r6, r1, #0x10
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	movs r0, #3
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	cmp r4, #5
	bhi _0800E8BE
	lsls r0, r4, #2
	ldr r1, _0800E814  @ _0800E818
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0800E814: .4byte _0800E818
_0800E818: @ jump table
	.4byte _0800E830 @ case 0
	.4byte _0800E834 @ case 1
	.4byte _0800E8A0 @ case 2
	.4byte _0800E830 @ case 3
	.4byte _0800E830 @ case 4
	.4byte _0800E830 @ case 5
_0800E830:
	movs r0, #6
	b _0800E8C0
_0800E834:
	cmp r6, #0x37
	bne _0800E842
	movs r0, #0x35
	bl NextRN_N
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
_0800E842:
	ldr r5, _0800E894  @ gUnknown_0895DD1C
	lsls r4, r6, #1
	adds r4, r4, r6
	lsls r4, r4, #2
	adds r0, r4, r5
	ldr r6, [r0]
	movs r0, #3
	bl GetBackgroundTileDataOffset
	adds r1, r0, #0
	movs r0, #0xc0
	lsls r0, r0, #0x13
	adds r1, r1, r0
	adds r0, r6, #0
	bl CopyDataWithPossibleUncomp
	ldr r0, _0800E898  @ gBG3TilemapBuffer
	adds r1, r5, #4
	adds r1, r4, r1
	ldr r1, [r1]
	movs r2, #0x80
	lsls r2, r2, #8
	bl CallARM_FillTileRect
	adds r5, #8
	adds r4, r4, r5
	ldr r0, [r4]
	movs r2, #0x80
	lsls r2, r2, #1
	adds r1, r2, #0
	bl CopyToPaletteBuffer
	movs r0, #8
	bl BG_EnableSyncByMask
	bl EnablePaletteSync
	ldr r1, _0800E89C  @ gPaletteBuffer
	movs r0, #0
	strh r0, [r1]
	b _0800E8BE
	.align 2, 0
_0800E894: .4byte gUnknown_0895DD1C
_0800E898: .4byte gBG3TilemapBuffer
_0800E89C: .4byte gPaletteBuffer
_0800E8A0:
	movs r0, #3
	bl GetBackgroundTileDataOffset
	adds r1, r0, #0
	ldr r0, _0800E8C8  @ gBG3TilemapBuffer
	str r6, [sp]
	movs r2, #8
	movs r3, #8
	bl sub_80B65F8
	movs r0, #8
	bl BG_EnableSyncByMask
	bl EnablePaletteSync
_0800E8BE:
	movs r0, #2
_0800E8C0:
	add sp, #4
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0800E8C8: .4byte gBG3TilemapBuffer

	THUMB_FUNC_END sub_800E7D0

	THUMB_FUNC_START Event21_
Event21_: @ 0x0800E8CC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	ldr r2, [r5, #0x38]
	ldrb r0, [r2]
	movs r3, #0xf
	ands r3, r0
	ldrh r0, [r2, #2]
	mov r8, r0
	movs r1, #2
	ldrsh r0, [r2, r1]
	cmp r0, #0
	bge _0800E8EE
	ldr r0, _0800E8FC  @ gEventSlots
	ldrh r0, [r0, #8]
	mov r8, r0
_0800E8EE:
	cmp r3, #1
	beq _0800E91C
	cmp r3, #1
	bgt _0800E900
	cmp r3, #0
	beq _0800E90E
	b _0800EA76
	.align 2, 0
_0800E8FC: .4byte gEventSlots
_0800E900:
	cmp r3, #2
	bne _0800E906
	b _0800EA20
_0800E906:
	cmp r3, #3
	bne _0800E90C
	b _0800EA56
_0800E90C:
	b _0800EA76
_0800E90E:
	adds r0, r5, #0
	adds r0, #0x42
	ldrb r0, [r0]
	mov r1, r8
	bl sub_800E7D0
	b _0800E9CE
_0800E91C:
	ldrh r6, [r2, #4]
	ldrh r7, [r2, #6]
	adds r0, r5, #0
	adds r0, #0x42
	ldrb r0, [r0]
	cmp r0, #5
	bhi _0800EA06
	lsls r0, r0, #2
	ldr r1, _0800E934  @ _0800E938
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0800E934: .4byte _0800E938
_0800E938: @ jump table
	.4byte _0800E950 @ case 0
	.4byte _0800E990 @ case 1
	.4byte _0800E990 @ case 2
	.4byte _0800E950 @ case 3
	.4byte _0800E950 @ case 4
	.4byte _0800E950 @ case 5
_0800E950:
	cmp r6, #5
	bhi _0800EA06
	lsls r0, r6, #2
	ldr r1, _0800E960  @ _0800E964
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0800E960: .4byte _0800E964
_0800E964: @ jump table
	.4byte _0800EA44 @ case 0
	.4byte _0800E97C @ case 1
	.4byte _0800E97C @ case 2
	.4byte _0800EA44 @ case 3
	.4byte _0800EA44 @ case 4
	.4byte _0800EA44 @ case 5
_0800E97C:
	ldrh r0, [r5, #0x3c]
	lsrs r0, r0, #2
	movs r4, #1
	ands r0, r4
	cmp r0, #0
	bne _0800EA66
	ldr r0, _0800E98C  @ gUnknown_08591E58
	b _0800E9FA
	.align 2, 0
_0800E98C: .4byte gUnknown_08591E58
_0800E990:
	cmp r6, #5
	bhi _0800EA06
	lsls r0, r6, #2
	ldr r1, _0800E9A0  @ _0800E9A4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0800E9A0: .4byte _0800E9A4
_0800E9A4: @ jump table
	.4byte _0800E9BC @ case 0
	.4byte _0800E9EC @ case 1
	.4byte _0800E9EC @ case 2
	.4byte _0800E9BC @ case 3
	.4byte _0800E9BC @ case 4
	.4byte _0800E9BC @ case 5
_0800E9BC:
	ldrh r0, [r5, #0x3c]
	lsrs r0, r0, #2
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0800E9D4
	adds r0, r5, #0
	bl Event22_
_0800E9CE:
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	b _0800EA78
_0800E9D4:
	ldr r0, _0800E9E8  @ gUnknown_08591EB0
	adds r1, r5, #0
	bl Proc_StartBlocking
	mov ip, r0
	mov r1, ip
	adds r1, #0x29
	movs r0, #2
	strb r0, [r1]
	b _0800EA06
	.align 2, 0
_0800E9E8: .4byte gUnknown_08591EB0
_0800E9EC:
	ldrh r0, [r5, #0x3c]
	lsrs r4, r0, #2
	movs r0, #1
	ands r4, r0
	cmp r4, #0
	bne _0800EA66
	ldr r0, _0800EA1C  @ gUnknown_08591E00
_0800E9FA:
	adds r1, r5, #0
	bl Proc_StartBlocking
	mov ip, r0
	adds r0, #0x29
	strb r4, [r0]
_0800EA06:
	mov r1, ip
	adds r1, #0x2a
	movs r0, #0
	strb r6, [r1]
	mov r1, r8
	mov r2, ip
	strh r1, [r2, #0x2c]
	strh r7, [r2, #0x2e]
	strh r0, [r2, #0x30]
	str r5, [r2, #0x34]
	b _0800EA76
	.align 2, 0
_0800EA1C: .4byte gUnknown_08591E00
_0800EA20:
	ldrh r4, [r2, #4]
	ldrh r7, [r2, #6]
	ldrh r0, [r5, #0x3c]
	lsrs r0, r0, #2
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _0800EA66
	adds r0, r5, #0
	adds r0, #0x42
	ldrb r0, [r0]
	mov r1, r8
	bl sub_800E7D0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #6
	bne _0800EA48
_0800EA44:
	movs r0, #6
	b _0800EA78
_0800EA48:
	adds r0, r7, #0
	movs r1, #0
	adds r2, r4, #0
	adds r3, r5, #0
	bl sub_80B2780
	b _0800EA76
_0800EA56:
	ldrh r4, [r2, #4]
	ldrh r7, [r2, #6]
	ldrh r0, [r5, #0x3c]
	lsrs r0, r0, #2
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0800EA6A
_0800EA66:
	movs r0, #0
	b _0800EA78
_0800EA6A:
	adds r0, r7, #0
	movs r1, #0
	adds r2, r4, #0
	adds r3, r5, #0
	bl sub_80B272C
_0800EA76:
	movs r0, #2
_0800EA78:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END Event21_

	THUMB_FUNC_START sub_800EA84
sub_800EA84: @ 0x0800EA84
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r5, _0800EAC4  @ gLCDControlBuffer
	ldrb r1, [r5, #1]
	movs r0, #2
	negs r0, r0
	ands r0, r1
	movs r1, #3
	negs r1, r1
	ands r0, r1
	subs r1, #2
	ands r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r5, #1]
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	adds r4, #0x29
	ldrb r4, [r4]
	cmp r4, #1
	beq _0800EB22
	cmp r4, #1
	bgt _0800EAC8
	cmp r4, #0
	beq _0800EACE
	b _0800EB94
	.align 2, 0
_0800EAC4: .4byte gLCDControlBuffer
_0800EAC8:
	cmp r4, #2
	beq _0800EB40
	b _0800EB94
_0800EACE:
	movs r0, #1
	movs r1, #0
	movs r2, #0x10
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	str r4, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #1
	bl sub_8001ED0
	str r4, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #1
	movs r3, #0
	bl sub_8001F0C
	ldrb r1, [r5, #0xc]
	movs r2, #4
	negs r2, r2
	adds r0, r2, #0
	ands r0, r1
	strb r0, [r5, #0xc]
	ldrb r1, [r5, #0x10]
	adds r0, r2, #0
	ands r0, r1
	movs r1, #1
	orrs r0, r1
	strb r0, [r5, #0x10]
	ldrb r0, [r5, #0x14]
	movs r1, #3
	orrs r0, r1
	strb r0, [r5, #0x14]
	ldrb r0, [r5, #0x18]
	ands r2, r0
	movs r0, #2
	orrs r2, r0
	strb r2, [r5, #0x18]
	b _0800EB94
_0800EB22:
	movs r0, #1
	movs r1, #0
	movs r2, #0x10
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	movs r0, #0
	str r0, [sp]
	movs r1, #0
	movs r2, #1
	movs r3, #0
	bl sub_8001ED0
	str r4, [sp]
	b _0800EB5E
_0800EB40:
	movs r0, #1
	movs r1, #0x10
	movs r2, #0
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	movs r0, #0
	str r0, [sp]
	movs r1, #0
	movs r2, #1
	movs r3, #0
	bl sub_8001ED0
	movs r0, #1
	str r0, [sp]
_0800EB5E:
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #1
	bl sub_8001F0C
	ldrb r1, [r5, #0xc]
	movs r2, #4
	negs r2, r2
	adds r0, r2, #0
	ands r0, r1
	movs r1, #1
	orrs r0, r1
	strb r0, [r5, #0xc]
	ldrb r1, [r5, #0x10]
	adds r0, r2, #0
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	strb r0, [r5, #0x10]
	ldrb r0, [r5, #0x14]
	ands r2, r0
	strb r2, [r5, #0x14]
	ldrb r0, [r5, #0x18]
	movs r1, #3
	orrs r0, r1
	strb r0, [r5, #0x18]
_0800EB94:
	movs r0, #1
	bl sub_8001F48
	movs r0, #0
	bl sub_8001F64
	movs r0, #0
	movs r1, #6
	bl sub_800BA04
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_800EA84

	THUMB_FUNC_START sub_800EBB0
sub_800EBB0: @ 0x0800EBB0
	push {lr}
	movs r0, #3
	movs r1, #2
	movs r2, #0xa
	bl sub_800B910
	movs r0, #3
	movs r1, #2
	movs r2, #1
	bl sub_800B954
	movs r0, #8
	movs r1, #0
	movs r2, #6
	bl sub_800B994
	movs r1, #8
	negs r1, r1
	movs r0, #2
	bl sub_800B9B8
	ldr r2, _0800EBFC  @ gLCDControlBuffer
	ldrb r1, [r2, #1]
	movs r0, #2
	negs r0, r0
	ands r0, r1
	movs r1, #3
	negs r1, r1
	ands r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2, #1]
	pop {r0}
	bx r0
	.align 2, 0
_0800EBFC: .4byte gLCDControlBuffer

	THUMB_FUNC_END sub_800EBB0

	THUMB_FUNC_START sub_800EC00
sub_800EC00: @ 0x0800EC00
	push {lr}
	movs r0, #2
	movs r1, #3
	movs r2, #0xa
	bl sub_800B910
	movs r0, #2
	movs r1, #3
	movs r2, #1
	bl sub_800B954
	movs r0, #0
	movs r1, #8
	movs r2, #6
	bl sub_800B994
	movs r0, #3
	movs r1, #8
	bl sub_800B9B8
	ldr r2, _0800EC4C  @ gLCDControlBuffer
	ldrb r1, [r2, #1]
	movs r0, #2
	negs r0, r0
	ands r0, r1
	movs r1, #3
	negs r1, r1
	ands r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2, #1]
	pop {r0}
	bx r0
	.align 2, 0
_0800EC4C: .4byte gLCDControlBuffer

	THUMB_FUNC_END sub_800EC00

	THUMB_FUNC_START sub_800EC50
sub_800EC50: @ 0x0800EC50
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	cmp r0, #5
	bhi _0800ED20
	lsls r0, r0, #2
	ldr r1, _0800EC68  @ _0800EC6C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0800EC68: .4byte _0800EC6C
_0800EC6C: @ jump table
	.4byte _0800EC84 @ case 0
	.4byte _0800EC86 @ case 1
	.4byte _0800ED00 @ case 2
	.4byte _0800EC84 @ case 3
	.4byte _0800EC84 @ case 4
	.4byte _0800EC84 @ case 5
_0800EC84:
	b _0800EC84
_0800EC86:
	ldrh r0, [r6, #0x2c]
	cmp r0, #0x37
	bne _0800EC94
	movs r0, #0x35
	bl NextRN_N
	strh r0, [r6, #0x2c]
_0800EC94:
	ldr r5, _0800ECF4  @ gUnknown_0895DD1C
	ldrh r1, [r6, #0x2c]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r4, [r0]
	movs r0, #2
	bl GetBackgroundTileDataOffset
	adds r1, r0, #0
	movs r0, #0xc0
	lsls r0, r0, #0x13
	adds r1, r1, r0
	adds r0, r4, #0
	bl CopyDataWithPossibleUncomp
	ldr r0, _0800ECF8  @ gBG2TilemapBuffer
	ldrh r2, [r6, #0x2c]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #2
	adds r2, r5, #4
	adds r1, r1, r2
	ldr r1, [r1]
	movs r2, #0
	bl CallARM_FillTileRect
	ldrh r1, [r6, #0x2c]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r5, #8
	adds r0, r0, r5
	ldr r0, [r0]
	movs r1, #0
	movs r2, #0xc0
	bl CopyToPaletteBuffer
	movs r0, #4
	bl BG_EnableSyncByMask
	bl EnablePaletteSync
	ldr r1, _0800ECFC  @ gPaletteBuffer
	movs r0, #0
	strh r0, [r1]
	b _0800ED20
	.align 2, 0
_0800ECF4: .4byte gUnknown_0895DD1C
_0800ECF8: .4byte gBG2TilemapBuffer
_0800ECFC: .4byte gPaletteBuffer
_0800ED00:
	movs r0, #2
	bl GetBackgroundTileDataOffset
	adds r1, r0, #0
	ldr r0, _0800ED48  @ gBG2TilemapBuffer
	ldrh r2, [r6, #0x2c]
	str r2, [sp]
	movs r2, #0
	movs r3, #6
	bl sub_80B65F8
	movs r0, #4
	bl BG_EnableSyncByMask
	bl EnablePaletteSync
_0800ED20:
	ldr r2, _0800ED4C  @ gLCDControlBuffer
	ldrb r1, [r2, #1]
	movs r0, #2
	negs r0, r0
	ands r0, r1
	movs r1, #3
	negs r1, r1
	ands r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2, #1]
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0800ED48: .4byte gBG2TilemapBuffer
_0800ED4C: .4byte gLCDControlBuffer

	THUMB_FUNC_END sub_800EC50

	THUMB_FUNC_START sub_800ED50
sub_800ED50: @ 0x0800ED50
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	cmp r0, #5
	bhi _0800EE24
	lsls r0, r0, #2
	ldr r1, _0800ED68  @ _0800ED6C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0800ED68: .4byte _0800ED6C
_0800ED6C: @ jump table
	.4byte _0800ED84 @ case 0
	.4byte _0800ED86 @ case 1
	.4byte _0800EE04 @ case 2
	.4byte _0800ED84 @ case 3
	.4byte _0800ED84 @ case 4
	.4byte _0800ED84 @ case 5
_0800ED84:
	b _0800ED84
_0800ED86:
	ldrh r0, [r6, #0x2c]
	cmp r0, #0x37
	bne _0800ED94
	movs r0, #0x35
	bl NextRN_N
	strh r0, [r6, #0x2c]
_0800ED94:
	ldr r5, _0800EDF8  @ gUnknown_0895DD1C
	ldrh r1, [r6, #0x2c]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r4, [r0]
	movs r0, #3
	bl GetBackgroundTileDataOffset
	adds r1, r0, #0
	movs r0, #0xc0
	lsls r0, r0, #0x13
	adds r1, r1, r0
	adds r0, r4, #0
	bl CopyDataWithPossibleUncomp
	ldr r0, _0800EDFC  @ gBG3TilemapBuffer
	ldrh r2, [r6, #0x2c]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #2
	adds r2, r5, #4
	adds r1, r1, r2
	ldr r1, [r1]
	movs r2, #0x80
	lsls r2, r2, #8
	bl CallARM_FillTileRect
	ldrh r1, [r6, #0x2c]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r5, #8
	adds r0, r0, r5
	ldr r0, [r0]
	movs r1, #0x80
	lsls r1, r1, #1
	movs r2, #0xc0
	bl CopyToPaletteBuffer
	movs r0, #8
	bl BG_EnableSyncByMask
	bl EnablePaletteSync
	ldr r1, _0800EE00  @ gPaletteBuffer
	movs r0, #0
	strh r0, [r1]
	b _0800EE24
	.align 2, 0
_0800EDF8: .4byte gUnknown_0895DD1C
_0800EDFC: .4byte gBG3TilemapBuffer
_0800EE00: .4byte gPaletteBuffer
_0800EE04:
	movs r0, #3
	bl GetBackgroundTileDataOffset
	adds r1, r0, #0
	ldr r0, _0800EE4C  @ gBG3TilemapBuffer
	ldrh r2, [r6, #0x2c]
	str r2, [sp]
	movs r2, #8
	movs r3, #6
	bl sub_80B65F8
	movs r0, #8
	bl BG_EnableSyncByMask
	bl EnablePaletteSync
_0800EE24:
	ldr r2, _0800EE50  @ gLCDControlBuffer
	ldrb r1, [r2, #1]
	movs r0, #2
	negs r0, r0
	ands r0, r1
	movs r1, #3
	negs r1, r1
	ands r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2, #1]
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0800EE4C: .4byte gBG3TilemapBuffer
_0800EE50: .4byte gLCDControlBuffer

	THUMB_FUNC_END sub_800ED50

	THUMB_FUNC_START sub_800EE54
sub_800EE54: @ 0x0800EE54
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	cmp r0, #5
	bhi _0800EEBE
	lsls r0, r0, #2
	ldr r1, _0800EE6C  @ _0800EE70
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0800EE6C: .4byte _0800EE70
_0800EE70: @ jump table
	.4byte _0800EE88 @ case 0
	.4byte _0800EEBC @ case 1
	.4byte _0800EEBC @ case 2
	.4byte _0800EE88 @ case 3
	.4byte _0800EE88 @ case 4
	.4byte _0800EE88 @ case 5
_0800EE88:
	ldr r4, _0800EEB8  @ gRAMChapterData
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	bl UnpackChapterMapGraphics
	ldrb r0, [r4, #0x15]
	bl AllocWeatherParticles
	bl RenderBmMap
	bl SMS_UpdateFromGameData
	ldr r0, [r5, #0x34]
	adds r0, #0x44
	ldrh r0, [r0]
	bl sub_800BCDC
	bl SMS_FlushIndirect
	ldr r0, [r5, #0x34]
	bl Event24_
	b _0800EEBE
	.align 2, 0
_0800EEB8: .4byte gRAMChapterData
_0800EEBC:
	b _0800EEBC
_0800EEBE:
	ldr r2, _0800EEE4  @ gLCDControlBuffer
	ldrb r1, [r2, #1]
	movs r0, #2
	negs r0, r0
	ands r0, r1
	movs r1, #3
	negs r1, r1
	ands r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2, #1]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0800EEE4: .4byte gLCDControlBuffer

	THUMB_FUNC_END sub_800EE54

	THUMB_FUNC_START sub_800EEE8
sub_800EEE8: @ 0x0800EEE8
	push {r4, r5, lr}
	adds r5, r0, #0
	ldrh r0, [r5, #0x2e]
	ldrh r1, [r5, #0x30]
	adds r0, r0, r1
	strh r0, [r5, #0x30]
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x14
	adds r0, r5, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #0
	blt _0800EF36
	cmp r0, #1
	ble _0800EF0C
	cmp r0, #2
	beq _0800EF22
	b _0800EF36
_0800EF0C:
	lsls r1, r4, #0x18
	lsrs r1, r1, #0x18
	movs r2, #0x10
	subs r2, r2, r4
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	movs r0, #1
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	b _0800EF36
_0800EF22:
	movs r1, #0x10
	subs r1, r1, r4
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsls r2, r4, #0x18
	lsrs r2, r2, #0x18
	movs r0, #1
	movs r3, #0
	bl SetSpecialColorEffectsParameters
_0800EF36:
	cmp r4, #0xf
	bls _0800EF40
	adds r0, r5, #0
	bl Proc_Break
_0800EF40:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_800EEE8

	THUMB_FUNC_START sub_800EF48
sub_800EF48: @ 0x0800EF48
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #0x10
	adds r3, r0, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #1
	beq _0800EF90
	cmp r0, #1
	bgt _0800EF64
	cmp r0, #0
	beq _0800EF6A
	b _0800EFE2
_0800EF64:
	cmp r0, #2
	beq _0800EFBC
	b _0800EFE2
_0800EF6A:
	ldr r2, _0800EF8C  @ gLCDControlBuffer
	ldrb r1, [r2, #1]
	movs r0, #2
	negs r0, r0
	ands r0, r1
	movs r1, #3
	negs r1, r1
	ands r0, r1
	subs r1, #2
	ands r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2, #1]
	b _0800EFE2
	.align 2, 0
_0800EF8C: .4byte gLCDControlBuffer
_0800EF90:
	ldr r2, _0800EFB8  @ gLCDControlBuffer
	ldrb r1, [r2, #1]
	movs r0, #2
	negs r0, r0
	ands r0, r1
	movs r1, #3
	negs r1, r1
	ands r0, r1
	subs r1, #2
	ands r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x11
	negs r1, r1
	ands r0, r1
	strb r0, [r2, #1]
	ldr r0, [r3, #0x34]
	bl Event23_
	b _0800EFE2
	.align 2, 0
_0800EFB8: .4byte gLCDControlBuffer
_0800EFBC:
	ldr r2, _0800F0BC  @ gLCDControlBuffer
	ldrb r1, [r2, #1]
	movs r0, #2
	negs r0, r0
	ands r0, r1
	movs r1, #3
	negs r1, r1
	ands r0, r1
	subs r1, #2
	ands r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2, #1]
	bl Font_LoadForUI
	bl sub_80156D4
_0800EFE2:
	ldr r3, _0800F0BC  @ gLCDControlBuffer
	ldrb r2, [r3, #0xc]
	movs r1, #4
	negs r1, r1
	adds r0, r1, #0
	ands r0, r2
	strb r0, [r3, #0xc]
	ldrb r2, [r3, #0x10]
	adds r0, r1, #0
	ands r0, r2
	movs r2, #1
	orrs r0, r2
	strb r0, [r3, #0x10]
	ldrb r0, [r3, #0x14]
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	strb r1, [r3, #0x14]
	ldrb r0, [r3, #0x18]
	movs r1, #3
	orrs r0, r1
	strb r0, [r3, #0x18]
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	movs r0, #0
	movs r1, #0x10
	movs r2, #0
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	movs r0, #0
	mov r8, r0
	str r0, [sp]
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl sub_8001ED0
	mov r0, r8
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl sub_8001F0C
	movs r0, #1
	bl sub_8001F48
	movs r0, #1
	bl sub_8001F64
	bl sub_800BA34
	ldr r0, _0800F0C0  @ gBG2TilemapBuffer
	movs r1, #0
	bl BG_Fill
	movs r0, #4
	bl BG_EnableSyncByMask
	mov r0, r8
	str r0, [sp, #4]
	movs r0, #0
	bl GetBackgroundTileDataOffset
	adds r1, r0, #0
	movs r5, #0xc0
	lsls r5, r5, #0x13
	adds r1, r1, r5
	ldr r6, _0800F0C4  @ 0x01000008
	add r0, sp, #4
	adds r2, r6, #0
	bl CpuFastSet
	mov r0, r8
	str r0, [sp, #8]
	add r4, sp, #8
	movs r0, #1
	bl GetBackgroundTileDataOffset
	adds r1, r0, #0
	adds r1, r1, r5
	adds r0, r4, #0
	adds r2, r6, #0
	bl CpuFastSet
	mov r0, r8
	str r0, [sp, #0xc]
	add r4, sp, #0xc
	movs r0, #2
	bl GetBackgroundTileDataOffset
	adds r1, r0, #0
	adds r1, r1, r5
	adds r0, r4, #0
	adds r2, r6, #0
	bl CpuFastSet
	add sp, #0x10
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0800F0BC: .4byte gLCDControlBuffer
_0800F0C0: .4byte gBG2TilemapBuffer
_0800F0C4: .4byte 0x01000008

	THUMB_FUNC_END sub_800EF48

	THUMB_FUNC_START Event22_
Event22_: @ 0x0800F0C8
	push {r4, lr}
	adds r4, r0, #0
	bl RefreshBMapGraphics
	adds r0, r4, #0
	adds r0, #0x44
	ldrh r0, [r0]
	bl sub_800BCDC
	ldr r0, _0800F118  @ gBG0TilemapBuffer
	movs r1, #0
	bl BG_Fill
	ldr r0, _0800F11C  @ gBG1TilemapBuffer
	movs r1, #0
	bl BG_Fill
	movs r0, #1
	bl BG_EnableSyncByMask
	movs r0, #2
	bl BG_EnableSyncByMask
	bl sub_80081A8
	ldr r0, _0800F120  @ gUnknown_08591154
	bl Proc_EndEach
	bl ResetFaces
	bl sub_80067E8
	adds r0, r4, #0
	bl Event24_
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0800F118: .4byte gBG0TilemapBuffer
_0800F11C: .4byte gBG1TilemapBuffer
_0800F120: .4byte gUnknown_08591154

	THUMB_FUNC_END Event22_

	THUMB_FUNC_START Event23_
Event23_: @ 0x0800F124
	push {r4, r5, lr}
	adds r4, r0, #0
	ldrh r1, [r4, #0x3c]
	movs r5, #0x80
	lsls r5, r5, #5
	adds r0, r5, #0
	ands r0, r1
	cmp r0, #0
	bne _0800F13E
	bl BMapDispSuspend
	bl MU_AllDisable
_0800F13E:
	ldrh r1, [r4, #0x3c]
	adds r0, r5, #0
	orrs r0, r1
	strh r0, [r4, #0x3c]
	movs r0, #2
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END Event23_

	THUMB_FUNC_START Event24_
Event24_: @ 0x0800F150
	push {r4, lr}
	adds r4, r0, #0
	ldrh r1, [r4, #0x3c]
	movs r0, #0x80
	lsls r0, r0, #5
	ands r0, r1
	cmp r0, #0
	beq _0800F168
	bl BMapDispResume
	bl MU_AllEnable
_0800F168:
	ldrh r1, [r4, #0x3c]
	ldr r0, _0800F178  @ 0x0000EFFF
	ands r0, r1
	strh r0, [r4, #0x3c]
	movs r0, #2
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0800F178: .4byte 0x0000EFFF

	THUMB_FUNC_END Event24_

	THUMB_FUNC_START Event25_
Event25_: @ 0x0800F17C
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x38]
	ldr r1, _0800F1F8  @ gUnknown_030004E4
	ldrb r6, [r1]
	ldrb r7, [r1, #2]
	ldrh r4, [r0, #2]
	movs r2, #2
	ldrsh r0, [r0, r2]
	cmp r0, #0
	bge _0800F198
	adds r0, r1, #0
	subs r0, #0x2c
	ldrh r4, [r0, #8]
_0800F198:
	adds r0, r5, #0
	bl Event24_
	ldr r0, _0800F1FC  @ gRAMChapterData
	strb r4, [r0, #0xe]
	bl RestartBattleMap
	lsls r0, r6, #4
	bl sub_8015A40
	ldr r4, _0800F200  @ gUnknown_0202BCB0
	strh r0, [r4, #0xc]
	lsls r0, r7, #4
	bl sub_8015A6C
	strh r0, [r4, #0xe]
	bl RefreshEntityBmMaps
	bl RenderBmMap
	bl SMS_UpdateFromGameData
	bl RefreshBMapGraphics
	adds r0, r5, #0
	adds r0, #0x44
	ldrh r0, [r0]
	bl sub_800BCDC
	ldr r0, _0800F204  @ gBG0TilemapBuffer
	movs r1, #0
	bl BG_Fill
	ldr r0, _0800F208  @ gBG1TilemapBuffer
	movs r1, #0
	bl BG_Fill
	movs r0, #1
	bl BG_EnableSyncByMask
	movs r0, #2
	bl BG_EnableSyncByMask
	movs r0, #2
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0800F1F8: .4byte gUnknown_030004E4
_0800F1FC: .4byte gRAMChapterData
_0800F200: .4byte gUnknown_0202BCB0
_0800F204: .4byte gBG0TilemapBuffer
_0800F208: .4byte gBG1TilemapBuffer

	THUMB_FUNC_END Event25_

	THUMB_FUNC_START Event26_CameraControlMaybe
Event26_CameraControlMaybe: @ 0x0800F20C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r7, r0, #0
	ldr r2, [r7, #0x38]
	ldrh r1, [r2]
	movs r3, #7
	ands r3, r1
	movs r0, #0xf
	ands r0, r1
	lsrs r0, r0, #3
	mov r8, r0
	cmp r3, #0
	beq _0800F22E
	cmp r3, #1
	beq _0800F250
	b _0800F264
_0800F22E:
	ldrh r0, [r2, #2]
	lsrs r6, r0, #8
	ldrb r4, [r2, #2]
	movs r0, #2
	ldrsb r0, [r2, r0]
	cmp r0, #0
	blt _0800F242
	lsls r0, r6, #0x18
	cmp r0, #0
	bge _0800F264
_0800F242:
	ldr r0, _0800F24C  @ gUnknown_030004E4
	ldrb r4, [r0]
	ldrb r6, [r0, #2]
	b _0800F264
	.align 2, 0
_0800F24C: .4byte gUnknown_030004E4
_0800F250:
	movs r1, #2
	ldrsh r0, [r2, r1]
	bl GetUnitStructFromEventParameter
	cmp r0, #0
	bne _0800F260
	movs r0, #6
	b _0800F2CA
_0800F260:
	ldrb r4, [r0, #0x10]
	ldrb r6, [r0, #0x11]
_0800F264:
	ldrh r2, [r7, #0x3c]
	lsrs r0, r2, #2
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _0800F27A
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r2
	cmp r0, #0
	beq _0800F29C
_0800F27A:
	lsls r4, r4, #0x18
	asrs r4, r4, #0x18
	lsls r5, r6, #0x18
	asrs r5, r5, #0x18
	mov r2, r8
	adds r0, r4, #0
	adds r1, r5, #0
	bl SetSomeRealCamPos
	adds r0, r4, #0
	adds r1, r5, #0
	bl SetCursorMapPosition
	bl RenderBmMap
	movs r0, #0
	b _0800F2CA
_0800F29C:
	mov r0, r8
	cmp r0, #0
	bne _0800F2B2
	lsls r5, r4, #0x18
	asrs r1, r5, #0x18
	lsls r4, r6, #0x18
	asrs r2, r4, #0x18
	adds r0, r7, #0
	bl EnsureCameraOntoPosition
	b _0800F2C0
_0800F2B2:
	lsls r5, r4, #0x18
	asrs r1, r5, #0x18
	lsls r4, r6, #0x18
	asrs r2, r4, #0x18
	adds r0, r7, #0
	bl sub_8015D84
_0800F2C0:
	asrs r0, r5, #0x18
	asrs r1, r4, #0x18
	bl SetCursorMapPosition
	movs r0, #2
_0800F2CA:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END Event26_CameraControlMaybe

	THUMB_FUNC_START Event27_MapChange
Event27_MapChange: @ 0x0800F2D4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	movs r7, #1
	ldr r0, [r5, #0x38]
	ldrb r1, [r0]
	movs r6, #0xf
	ands r6, r1
	ldrh r2, [r0, #2]
	movs r3, #2
	ldrsh r1, [r0, r3]
	movs r0, #2
	negs r0, r0
	cmp r1, r0
	beq _0800F314
	cmp r1, r0
	bgt _0800F300
	subs r0, #1
	cmp r1, r0
	beq _0800F330
	b _0800F34A
_0800F300:
	movs r0, #1
	negs r0, r0
	cmp r1, r0
	bne _0800F34A
	ldr r1, _0800F310  @ gUnknown_030004E4
	ldrh r0, [r1]
	ldrh r1, [r1, #2]
	b _0800F31C
	.align 2, 0
_0800F310: .4byte gUnknown_030004E4
_0800F314:
	ldr r0, _0800F32C  @ gActiveUnit
	ldr r1, [r0]
	ldrb r0, [r1, #0x10]
	ldrb r1, [r1, #0x11]
_0800F31C:
	bl GetMapChangeIdAt
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r0, #0
	bge _0800F34A
	movs r0, #6
	b _0800F3E0
	.align 2, 0
_0800F32C: .4byte gActiveUnit
_0800F330:
	ldr r0, _0800F368  @ gEventSlotQueue
	mov r8, r0
	mov r1, r8
	adds r1, #4
	mov r8, r1
	subs r1, #4
	ldm r1!, {r0}
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	ldr r0, _0800F36C  @ gEventSlots
	ldr r0, [r0, #0x34]
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
_0800F34A:
	ldrh r1, [r5, #0x3c]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0800F3A0
	movs r4, #0
	cmp r4, r7
	bcs _0800F3DE
_0800F35C:
	cmp r6, #0
	beq _0800F370
	cmp r6, #1
	beq _0800F37C
	b _0800F386
	.align 2, 0
_0800F368: .4byte gEventSlotQueue
_0800F36C: .4byte gEventSlots
_0800F370:
	adds r0, r2, #0
	movs r1, #0
	adds r2, r5, #0
	bl TriggerMapChanges
	b _0800F386
_0800F37C:
	adds r0, r2, #0
	movs r1, #0
	adds r2, r5, #0
	bl sub_800BB48
_0800F386:
	mov r3, r8
	adds r3, #4
	mov r8, r3
	subs r3, #4
	ldm r3!, {r0}
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, r7
	bcc _0800F35C
	b _0800F3DE
_0800F3A0:
	movs r1, #1
	movs r4, #0
	cmp r4, r7
	bcs _0800F3DE
_0800F3A8:
	cmp r6, #0
	beq _0800F3B2
	cmp r6, #1
	beq _0800F3BC
	b _0800F3C4
_0800F3B2:
	adds r0, r2, #0
	adds r2, r5, #0
	bl TriggerMapChanges
	b _0800F3C4
_0800F3BC:
	adds r0, r2, #0
	adds r2, r5, #0
	bl sub_800BB48
_0800F3C4:
	mov r1, r8
	adds r1, #4
	mov r8, r1
	subs r1, #4
	ldm r1!, {r0}
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	movs r1, #0
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, r7
	bcc _0800F3A8
_0800F3DE:
	movs r0, #2
_0800F3E0:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END Event27_MapChange

	THUMB_FUNC_START Event28_ChangeWeather
Event28_ChangeWeather: @ 0x0800F3EC
	push {lr}
	ldr r0, [r0, #0x38]
	ldrh r0, [r0, #2]
	bl SetWeather
	movs r0, #2
	pop {r1}
	bx r1

	THUMB_FUNC_END Event28_ChangeWeather

	THUMB_FUNC_START Event29_SetFogVision
Event29_SetFogVision: @ 0x0800F3FC
	push {r4, lr}
	adds r2, r0, #0
	ldr r1, [r2, #0x38]
	ldrb r0, [r1]
	movs r3, #0xf
	ands r3, r0
	ldrh r4, [r1, #2]
	ldrh r0, [r2, #0x3c]
	lsrs r0, r0, #2
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0800F418
	movs r3, #0
_0800F418:
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	adds r1, r3, #0
	bl sub_800BAA8
	movs r0, #2
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END Event29_SetFogVision

	THUMB_FUNC_START Event2A_MoveToChapter
Event2A_MoveToChapter: @ 0x0800F42C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x38]
	ldrb r1, [r0]
	movs r3, #0xf
	ands r3, r1
	ldrh r2, [r0, #2]
	movs r1, #2
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bge _0800F446
	ldr r0, _0800F454  @ gEventSlots
	ldrh r2, [r0, #8]
_0800F446:
	cmp r3, #4
	bhi _0800F4E8
	lsls r0, r3, #2
	ldr r1, _0800F458  @ _0800F45C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0800F454: .4byte gEventSlots
_0800F458: .4byte _0800F45C
_0800F45C: @ jump table
	.4byte _0800F470 @ case 0
	.4byte _0800F474 @ case 1
	.4byte _0800F498 @ case 2
	.4byte _0800F4BC @ case 3
	.4byte _0800F4C4 @ case 4
_0800F470:
	movs r0, #0
	b _0800F4D8
_0800F474:
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	bl SetNextChapterId
	ldr r2, _0800F494  @ gRAMChapterData
	adds r2, #0x4a
	ldrb r1, [r2]
	movs r0, #0xf
	negs r0, r0
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	strb r0, [r2]
	movs r0, #1
	b _0800F4D8
	.align 2, 0
_0800F494: .4byte gRAMChapterData
_0800F498:
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	bl SetNextChapterId
	ldr r2, _0800F4B8  @ gRAMChapterData
	adds r2, #0x4a
	ldrb r1, [r2]
	movs r0, #0xf
	negs r0, r0
	ands r0, r1
	movs r1, #4
	orrs r0, r1
	strb r0, [r2]
	movs r0, #2
	b _0800F4D8
	.align 2, 0
_0800F4B8: .4byte gRAMChapterData
_0800F4BC:
	adds r0, r2, #0
	bl GotoChapterWithoutSave
	b _0800F4E8
_0800F4C4:
	ldr r2, _0800F508  @ gRAMChapterData
	adds r2, #0x4a
	ldrb r1, [r2]
	movs r0, #0xf
	negs r0, r0
	ands r0, r1
	movs r1, #6
	orrs r0, r1
	strb r0, [r2]
	movs r0, #3
_0800F4D8:
	bl SetNextGameActionId
	ldrh r1, [r4, #0x3c]
	movs r2, #0x80
	lsls r2, r2, #4
	adds r0, r2, #0
	orrs r0, r1
	strh r0, [r4, #0x3c]
_0800F4E8:
	ldrh r1, [r4, #0x3c]
	movs r2, #0x80
	lsls r2, r2, #3
	adds r0, r2, #0
	orrs r0, r1
	strh r0, [r4, #0x3c]
	bl DeleteAll6CWaitMusicRelated
	movs r0, #4
	bl Sound_FadeOut800231C
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0800F508: .4byte gRAMChapterData

	THUMB_FUNC_END Event2A_MoveToChapter

	THUMB_FUNC_START sub_800F50C
sub_800F50C: @ 0x0800F50C
	push {lr}
	adds r1, r0, #0
	movs r2, #0
	b _0800F51C
_0800F514:
	adds r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	adds r1, #0x14
_0800F51C:
	ldrb r0, [r1]
	cmp r0, #0
	bne _0800F514
	adds r0, r2, #0
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_800F50C

	THUMB_FUNC_START ShouldUNITBeLoaded
ShouldUNITBeLoaded: @ 0x0800F528
	push {r4, r5, lr}
	adds r4, r0, #0
	lsls r1, r1, #0x18
	lsrs r5, r1, #0x18
	ldrb r1, [r4, #3]
	movs r0, #6
	ands r0, r1
	cmp r0, #0
	bne _0800F564
	cmp r5, #1
	beq _0800F564
	ldrb r0, [r4]
	bl GetUnitFromCharId
	cmp r0, #0
	beq _0800F564
	ldr r0, [r0, #0xc]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	beq _0800F564
	cmp r5, #0
	beq _0800F5A2
	cmp r5, #2
	bne _0800F564
	ldrb r0, [r4]
	bl IsSethLArachelMyrrhInnes
	cmp r0, #0
	beq _0800F5A2
_0800F564:
	ldrb r1, [r4, #3]
	movs r0, #6
	ands r0, r1
	cmp r0, #4
	bne _0800F5B0
	ldr r0, [r4, #4]
	ldr r1, _0800F5A8  @ 0xFF004000
	ands r0, r1
	cmp r0, #0
	bne _0800F596
	ldrh r0, [r4, #4]
	lsls r0, r0, #0x14
	lsrs r0, r0, #0x1a
	ldr r1, _0800F5AC  @ gBmMapUnit
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r1, [r4, #4]
	lsls r1, r1, #0x1a
	lsrs r1, r1, #0x1a
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0
	bne _0800F5A2
_0800F596:
	movs r0, #0x80
	bl IsUnitSlotAvailable
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0800F5B0
_0800F5A2:
	movs r0, #0
	b _0800F5B2
	.align 2, 0
_0800F5A8: .4byte 0xFF004000
_0800F5AC: .4byte gBmMapUnit
_0800F5B0:
	movs r0, #1
_0800F5B2:
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END ShouldUNITBeLoaded

	THUMB_FUNC_START sub_800F5B8
sub_800F5B8: @ 0x0800F5B8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r6, r0, #0
	ldr r4, [r6, #0x48]
	adds r5, r6, #0
	adds r5, #0x4c
	ldrh r7, [r5]
	adds r0, #0x4f
	ldrb r0, [r0]
	lsls r0, r0, #0x19
	lsrs r0, r0, #0x19
	mov r9, r0
	adds r0, r6, #0
	movs r1, #1
	bl GetSomeEventEngineMoveRelatedBitfield
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp]
	movs r3, #0
	mov r0, r9
	cmp r0, #2
	bne _0800F5F0
	movs r3, #1
_0800F5F0:
	ldrh r0, [r6, #0x3c]
	lsrs r0, r0, #2
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0800F614
	lsls r1, r7, #0x10
	asrs r1, r1, #0x10
	adds r0, r4, #0
	mov r2, r9
	bl sub_800F698
	mov r8, r5
	b _0800F674
_0800F60C:
	str r4, [r6, #0x48]
	mov r1, r8
	strh r7, [r1]
	b _0800F684
_0800F614:
	ldrb r0, [r4]
	mov r8, r5
	cmp r0, #0
	beq _0800F674
	lsls r0, r7, #0x10
	adds r5, r0, #0
	cmp r5, #0
	ble _0800F674
	lsls r3, r3, #0x18
	mov sl, r3
_0800F628:
	adds r0, r4, #0
	mov r1, r9
	bl ShouldUNITBeLoaded
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _0800F664
	ldrb r1, [r4, #4]
	lsls r1, r1, #0x1a
	lsrs r1, r1, #0x1a
	ldrh r2, [r4, #4]
	lsls r2, r2, #0x14
	lsrs r2, r2, #0x1a
	adds r0, r6, #0
	bl TryPrepareEventUnitMovement
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0800F60C
	adds r0, r4, #0
	ldr r1, [sp]
	movs r2, #0
	mov r7, sl
	asrs r3, r7, #0x18
	bl LoadUnit_800F704
	ldr r1, _0800F694  @ 0xFFFF0000
	adds r0, r5, r1
	lsrs r7, r0, #0x10
_0800F664:
	adds r4, #0x14
	ldrb r0, [r4]
	cmp r0, #0
	beq _0800F674
	lsls r0, r7, #0x10
	adds r5, r0, #0
	cmp r5, #0
	bgt _0800F628
_0800F674:
	movs r1, #0
	movs r0, #0
	mov r2, r8
	strh r0, [r2]
	adds r2, r6, #0
	adds r2, #0x4e
	strb r1, [r2]
	str r0, [r6, #0x2c]
_0800F684:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800F694: .4byte 0xFFFF0000

	THUMB_FUNC_END sub_800F5B8

	THUMB_FUNC_START sub_800F698
sub_800F698: @ 0x0800F698
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	lsls r1, r1, #0x10
	lsrs r6, r1, #0x10
	lsls r2, r2, #0x18
	lsrs r7, r2, #0x18
	movs r3, #0
	cmp r7, #2
	bne _0800F6B0
	movs r3, #1
_0800F6B0:
	ldrb r0, [r5]
	cmp r0, #0
	beq _0800F6F6
	lsls r0, r6, #0x10
	adds r4, r0, #0
	cmp r4, #0
	ble _0800F6F6
	lsls r3, r3, #0x18
	mov r8, r3
_0800F6C2:
	adds r0, r5, #0
	adds r1, r7, #0
	bl ShouldUNITBeLoaded
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _0800F6E6
	adds r0, r5, #0
	movs r1, #1
	movs r2, #1
	mov r6, r8
	asrs r3, r6, #0x18
	bl LoadUnit_800F704
	ldr r1, _0800F700  @ 0xFFFF0000
	adds r0, r4, r1
	lsrs r6, r0, #0x10
_0800F6E6:
	adds r5, #0x14
	ldrb r0, [r5]
	cmp r0, #0
	beq _0800F6F6
	lsls r0, r6, #0x10
	adds r4, r0, #0
	cmp r4, #0
	bgt _0800F6C2
_0800F6F6:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800F700: .4byte 0xFFFF0000

	THUMB_FUNC_END sub_800F698

	THUMB_FUNC_START LoadUnit_800F704
LoadUnit_800F704: @ 0x0800F704
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	sub sp, #8
	adds r6, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov r8, r1
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	mov r9, r2
	lsls r3, r3, #0x18
	lsrs r4, r3, #0x18
	ldr r1, _0800F740  @ gUnknown_080D793C
	mov r0, sp
	movs r2, #3
	bl memcpy
	ldrb r1, [r6, #3]
	movs r0, #6
	ands r0, r1
	cmp r0, #0
	bne _0800F744
	ldrb r0, [r6]
	movs r1, #0
	bl GetUnitFromCharIdAndFaction
	b _0800F768
	.align 2, 0
_0800F740: .4byte gUnknown_080D793C
_0800F744:
	ldrb r0, [r6]
	movs r1, #0
	bl GetUnitFromCharIdAndFaction
	adds r5, r0, #0
	cmp r5, #0
	beq _0800F76E
	ldrb r0, [r6, #3]
	lsls r0, r0, #0x1d
	lsrs r0, r0, #0x1e
	add r0, sp
	ldrb r1, [r0]
	adds r0, r5, #0
	bl UnitChangeFaction
	ldrb r0, [r6]
	bl GetUnitFromCharId
_0800F768:
	adds r5, r0, #0
	cmp r5, #0
	bne _0800F790
_0800F76E:
	adds r0, r6, #0
	bl LoadUnit
	adds r5, r0, #0
	cmp r4, #1
	bne _0800F7FA
	ldrb r1, [r6, #3]
	movs r0, #6
	ands r0, r1
	cmp r0, #0
	bne _0800F7FA
	ldr r0, [r5, #0xc]
	movs r1, #0x80
	lsls r1, r1, #0xf
	orrs r0, r1
	str r0, [r5, #0xc]
	b _0800F7FA
_0800F790:
	ldrb r1, [r6, #3]
	movs r0, #6
	ands r0, r1
	cmp r0, #0
	bne _0800F7FA
	ldr r1, [r5, #0xc]
	movs r0, #3
	negs r0, r0
	ands r1, r0
	str r1, [r5, #0xc]
	cmp r4, #1
	bne _0800F7B8
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _0800F7C8
	movs r0, #0x80
	lsls r0, r0, #0xf
	orrs r1, r0
	b _0800F7C6
_0800F7B8:
	movs r0, #0x80
	lsls r0, r0, #0xf
	ands r0, r1
	cmp r0, #0
	beq _0800F7C8
	ldr r0, _0800F848  @ 0xFFBFFFFF
	ands r1, r0
_0800F7C6:
	str r1, [r5, #0xc]
_0800F7C8:
	add r4, sp, #4
	mov r7, sp
	adds r7, #5
	adds r0, r6, #0
	adds r1, r4, #0
	adds r2, r7, #0
	movs r3, #0
	bl GetPreferredPositionForUNIT
	movs r1, #0x10
	ldrsb r1, [r5, r1]
	movs r0, #0
	ldrsb r0, [r4, r0]
	cmp r1, r0
	bne _0800F7FA
	movs r1, #0x11
	ldrsb r1, [r5, r1]
	movs r0, #0
	ldrsb r0, [r7, r0]
	cmp r1, r0
	bne _0800F7FA
	ldr r0, _0800F84C  @ 0x0000FFFE
	mov r1, r8
	ands r1, r0
	mov r8, r1
_0800F7FA:
	ldrb r0, [r6, #4]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1a
	strb r0, [r5, #0x10]
	ldrh r0, [r6, #4]
	lsls r0, r0, #0x14
	lsrs r0, r0, #0x1a
	strb r0, [r5, #0x11]
	ldrb r1, [r6, #3]
	movs r0, #6
	ands r0, r1
	cmp r0, #4
	bne _0800F888
	ldr r0, [r5]
	ldrb r0, [r0, #4]
	cmp r0, #0x3b
	bls _0800F888
	ldr r2, _0800F850  @ gRAMChapterData
	adds r0, r2, #0
	adds r0, #0x42
	ldrb r0, [r0]
	lsls r0, r0, #0x1a
	adds r3, r2, #0
	cmp r0, #0
	blt _0800F854
	ldrb r1, [r2, #0x14]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	bne _0800F85E
	movs r0, #0xe
	ldrsb r0, [r2, r0]
	bl GetROMChapterStruct
	ldrb r1, [r0, #0x14]
	lsls r1, r1, #0x1c
	lsrs r1, r1, #0x1c
	negs r1, r1
	b _0800F86A
	.align 2, 0
_0800F848: .4byte 0xFFBFFFFF
_0800F84C: .4byte 0x0000FFFE
_0800F850: .4byte gRAMChapterData
_0800F854:
	ldrb r1, [r2, #0x14]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0800F872
_0800F85E:
	movs r0, #0xe
	ldrsb r0, [r3, r0]
	bl GetROMChapterStruct
	ldrb r1, [r0, #0x14]
	lsrs r1, r1, #4
_0800F86A:
	adds r0, r5, #0
	bl UnitApplyBonusLevels
	b _0800F888
_0800F872:
	movs r0, #0xe
	ldrsb r0, [r2, r0]
	bl GetROMChapterStruct
	ldrb r1, [r0, #0x15]
	lsls r1, r1, #0x1c
	lsrs r1, r1, #0x1c
	negs r1, r1
	adds r0, r5, #0
	bl UnitApplyBonusLevels
_0800F888:
	mov r0, r9
	lsls r3, r0, #0x18
	asrs r3, r3, #0x18
	adds r0, r5, #0
	adds r1, r6, #0
	mov r2, r8
	bl sub_800F8A8
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END LoadUnit_800F704

	THUMB_FUNC_START sub_800F8A8
sub_800F8A8: @ 0x0800F8A8
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	lsls r2, r2, #0x10
	lsrs r6, r2, #0x10
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	cmp r5, #0
	beq _0800F90C
	ldrb r1, [r4, #5]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0800F8C8
	movs r0, #2
	orrs r6, r0
_0800F8C8:
	ldrb r0, [r4, #7]
	cmp r0, #0
	bne _0800F8E4
	ldrb r1, [r4, #4]
	lsls r1, r1, #0x1a
	lsrs r1, r1, #0x1a
	ldrh r2, [r4, #4]
	lsls r2, r2, #0x14
	lsrs r2, r2, #0x1a
	adds r0, r5, #0
	adds r3, r6, #0
	bl MoveUnit_
	b _0800F90C
_0800F8E4:
	cmp r3, #1
	beq _0800F8F2
	ldr r0, [r5, #0xc]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0800F900
_0800F8F2:
	ldr r1, [r4, #8]
	ldrb r2, [r4, #7]
	adds r0, r5, #0
	adds r3, r6, #0
	bl sub_8079FA8
	b _0800F90C
_0800F900:
	ldr r1, [r4, #8]
	ldrb r2, [r4, #7]
	adds r0, r5, #0
	adds r3, r6, #0
	bl sub_8079D74
_0800F90C:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_800F8A8

	THUMB_FUNC_START sub_800F914
sub_800F914: @ 0x0800F914
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x60
	adds r6, r0, #0
	ldr r0, [sp, #0x80]
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov sl, r1
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	mov ip, r2
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	str r3, [sp, #0x40]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0x44]
	movs r0, #0
	mov r8, r0
	movs r3, #0
	cmp r2, #0
	beq _0800F994
	str r6, [sp, #0x54]
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	cmp r3, r0
	bge _0800F982
	movs r1, #0x40
	mov r9, r1
	adds r7, r0, #0
_0800F956:
	ldr r2, [sp, #0x54]
	ldrb r1, [r2, #5]
	mov r0, r9
	ands r0, r1
	cmp r0, #0
	beq _0800F972
	mov r0, sp
	add r0, r8
	strb r3, [r0]
	mov r0, r8
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
_0800F972:
	ldr r4, [sp, #0x54]
	adds r4, #0x14
	str r4, [sp, #0x54]
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, r7
	blt _0800F956
_0800F982:
	mov r5, ip
	mov r0, r8
	muls r0, r5, r0
	adds r0, #0x32
	movs r1, #0x64
	bl Div
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
_0800F994:
	movs r0, #0
	str r0, [sp, #0x58]
	str r0, [sp, #0x5c]
	mov r1, sl
	lsls r1, r1, #0x10
	mov r9, r1
	ldr r2, [sp, #0x44]
	lsls r2, r2, #0x18
	str r2, [sp, #0x4c]
	ldr r4, [sp, #0x40]
	lsls r4, r4, #0x18
	str r4, [sp, #0x48]
	cmp r3, #0
	beq _0800FA0C
	movs r7, #1
_0800F9B2:
	mov r0, r8
	str r3, [sp, #0x50]
	bl NextRN_N
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	mov r5, sp
	adds r0, r5, r2
	ldrb r2, [r0]
	ldr r3, [sp, #0x50]
	cmp r2, #0x1f
	bhi _0800F9D4
	adds r0, r7, #0
	lsls r0, r2
	ldr r1, [sp, #0x58]
	ands r0, r1
	b _0800F9E0
_0800F9D4:
	adds r1, r2, #0
	subs r1, #0x20
	adds r0, r7, #0
	lsls r0, r1
	ldr r4, [sp, #0x5c]
	ands r0, r4
_0800F9E0:
	cmp r0, #0
	bne _0800FA08
	cmp r2, #0x1f
	bhi _0800F9F4
	adds r0, r7, #0
	lsls r0, r2
	ldr r5, [sp, #0x58]
	orrs r5, r0
	str r5, [sp, #0x58]
	b _0800FA02
_0800F9F4:
	adds r1, r2, #0
	subs r1, #0x20
	adds r0, r7, #0
	lsls r0, r1
	ldr r1, [sp, #0x5c]
	orrs r1, r0
	str r1, [sp, #0x5c]
_0800FA02:
	subs r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
_0800FA08:
	cmp r3, #0
	bne _0800F9B2
_0800FA0C:
	str r6, [sp, #0x54]
	ldr r6, _0800FA34  @ end
	movs r3, #0
	mov r2, r9
	asrs r0, r2, #0x10
	mov ip, r6
	cmp r3, r0
	bge _0800FA70
	movs r4, #0x41
	negs r4, r4
	mov sl, r4
	mov r8, r0
_0800FA24:
	cmp r3, #0x1f
	bhi _0800FA38
	movs r0, #1
	lsls r0, r3
	ldr r5, [sp, #0x58]
	ands r0, r5
	b _0800FA44
	.align 2, 0
_0800FA34: .4byte end
_0800FA38:
	adds r1, r3, #0
	subs r1, #0x20
	movs r0, #1
	lsls r0, r1
	ldr r1, [sp, #0x5c]
	ands r0, r1
_0800FA44:
	cmp r0, #0
	bne _0800FA66
	lsls r0, r3, #2
	adds r0, r0, r3
	lsls r0, r0, #2
	adds r1, r6, #0
	ldr r2, [sp, #0x54]
	adds r0, r0, r2
	ldm r0!, {r2, r4, r5}
	stm r1!, {r2, r4, r5}
	ldm r0!, {r4, r5}
	stm r1!, {r4, r5}
	ldrb r1, [r6, #5]
	mov r0, sl
	ands r0, r1
	strb r0, [r6, #5]
	adds r6, #0x14
_0800FA66:
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, r8
	blt _0800FA24
_0800FA70:
	movs r3, #0
	mov r1, r9
	asrs r0, r1, #0x10
	cmp r3, r0
	bge _0800FACA
	movs r2, #1
	mov sl, r2
	mov r8, r0
_0800FA80:
	cmp r3, #0x1f
	bhi _0800FA92
	mov r0, sl
	lsls r0, r3
	ldr r4, [sp, #0x58]
	ands r0, r4
	cmp r0, #0
	bne _0800FAA2
	b _0800FAC0
_0800FA92:
	adds r1, r3, #0
	subs r1, #0x20
	mov r0, sl
	lsls r0, r1
	ldr r5, [sp, #0x5c]
	ands r0, r5
	cmp r0, #0
	beq _0800FAC0
_0800FAA2:
	lsls r0, r3, #2
	adds r0, r0, r3
	lsls r0, r0, #2
	adds r1, r6, #0
	ldr r2, [sp, #0x54]
	adds r0, r0, r2
	ldm r0!, {r2, r4, r5}
	stm r1!, {r2, r4, r5}
	ldm r0!, {r4, r5}
	stm r1!, {r4, r5}
	ldrb r0, [r6, #5]
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r6, #5]
	adds r6, #0x14
_0800FAC0:
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, r8
	blt _0800FA80
_0800FACA:
	movs r0, #0
	strb r0, [r6]
	ldr r1, [sp, #0x4c]
	asrs r0, r1, #0x18
	cmp r0, #1
	bne _0800FAF6
	mov r6, ip
	movs r3, #0
	mov r2, r9
	asrs r0, r2, #0x10
	cmp r3, r0
	bge _0800FAF6
	movs r2, #0
	adds r1, r0, #0
_0800FAE6:
	strb r2, [r6, #7]
	str r2, [r6, #8]
	adds r6, #0x14
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, r1
	blt _0800FAE6
_0800FAF6:
	mov r6, ip
	ldr r4, [sp, #0x48]
	asrs r0, r4, #0x18
	cmp r0, #1
	bne _0800FB06
	adds r0, r6, #0
	bl sub_80125C0
_0800FB06:
	adds r0, r6, #0
	add sp, #0x60
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_800F914

	THUMB_FUNC_START Event2B_
Event2B_: @ 0x0800FB18
	push {r4, r5, lr}
	adds r3, r0, #0
	ldr r0, [r3, #0x38]
	ldrb r1, [r0]
	movs r2, #0xf
	ands r2, r1
	adds r4, r2, #0
	ldrh r1, [r0, #2]
	movs r5, #2
	ldrsh r0, [r0, r5]
	cmp r0, #0
	bge _0800FB34
	ldr r0, _0800FB44  @ gEventSlots
	ldrh r1, [r0, #8]
_0800FB34:
	cmp r2, #1
	beq _0800FB56
	cmp r2, #1
	bgt _0800FB48
	cmp r2, #0
	beq _0800FB4E
	b _0800FB7A
	.align 2, 0
_0800FB44: .4byte gEventSlots
_0800FB48:
	cmp r4, #2
	beq _0800FB6E
	b _0800FB7A
_0800FB4E:
	adds r0, r3, #0
	adds r0, #0x4c
	strh r1, [r0]
	b _0800FB7A
_0800FB56:
	lsls r0, r1, #0x10
	cmp r0, #0
	bge _0800FB5E
	movs r1, #0
_0800FB5E:
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x64
	ble _0800FB68
	movs r1, #0x64
_0800FB68:
	adds r0, r3, #0
	adds r0, #0x4e
	b _0800FB78
_0800FB6E:
	adds r0, r3, #0
	adds r0, #0x4f
	ldrb r1, [r0]
	movs r2, #0x80
	orrs r1, r2
_0800FB78:
	strb r1, [r0]
_0800FB7A:
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END Event2B_

	THUMB_FUNC_START Event2C_LoadUnits
Event2C_LoadUnits: @ 0x0800FB84
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r6, r0, #0
	ldr r0, [r6, #0x38]
	ldrb r1, [r0]
	movs r4, #0xf
	ands r4, r1
	ldrb r1, [r0, #2]
	mov r8, r1
	ldr r5, [r0, #4]
	adds r0, r6, #0
	adds r0, #0x4c
	ldrh r7, [r0]
	cmp r4, #1
	beq _0800FBBE
	cmp r4, #1
	bgt _0800FBB4
	cmp r4, #0
	beq _0800FBC2
	b _0800FBD6
_0800FBB4:
	cmp r4, #2
	beq _0800FBC2
	cmp r4, #3
	beq _0800FBD0
	b _0800FBD6
_0800FBBE:
	movs r0, #2
	mov r8, r0
_0800FBC2:
	cmp r5, #0
	bge _0800FBD6
	ldr r0, _0800FBCC  @ gEventSlots
	ldr r5, [r0, #8]
	b _0800FBD6
	.align 2, 0
_0800FBCC: .4byte gEventSlots
_0800FBD0:
	bl sub_80833B0
	adds r5, r0, #0
_0800FBD6:
	cmp r7, #0
	bne _0800FBE4
	adds r0, r5, #0
	bl sub_800F50C
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
_0800FBE4:
	lsls r0, r7, #0x10
	asrs r0, r0, #0x10
	mov r9, r0
	movs r1, #0x4e
	adds r1, r1, r6
	mov sl, r1
	ldrb r2, [r1]
	movs r3, #0
	cmp r4, #2
	bne _0800FBFA
	movs r3, #1
_0800FBFA:
	adds r4, r6, #0
	adds r4, #0x4f
	ldrb r0, [r4]
	lsrs r0, r0, #7
	str r0, [sp]
	adds r0, r5, #0
	mov r1, r9
	bl sub_800F914
	adds r5, r0, #0
	ldr r0, _0800FC48  @ gBmMapUnk
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFill
	ldrh r2, [r6, #0x3c]
	lsrs r0, r2, #2
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _0800FC2E
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r2
	cmp r0, #0
	beq _0800FC4C
_0800FC2E:
	adds r0, r5, #0
	mov r1, r9
	mov r2, r8
	bl sub_800F698
	adds r0, r6, #0
	adds r0, #0x4c
	movs r2, #0
	movs r1, #0
	strh r1, [r0]
	mov r0, sl
	strb r2, [r0]
	b _0800FC72
	.align 2, 0
_0800FC48: .4byte gBmMapUnk
_0800FC4C:
	str r5, [r6, #0x48]
	adds r0, r6, #0
	adds r0, #0x4c
	strh r7, [r0]
	movs r0, #0x7f
	mov r1, r8
	ands r1, r0
	mov r8, r1
	ldrb r1, [r4]
	subs r0, #0xff
	ands r0, r1
	mov r1, r8
	orrs r0, r1
	strb r0, [r4]
	ldr r1, _0800FC8C  @ sub_800F5B8
	str r1, [r6, #0x2c]
	adds r0, r6, #0
	bl _call_via_r1
_0800FC72:
	ldrb r1, [r4]
	movs r0, #0x7f
	ands r0, r1
	strb r0, [r4]
	movs r0, #2
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0800FC8C: .4byte sub_800F5B8

	THUMB_FUNC_END Event2C_LoadUnits

	THUMB_FUNC_START TryPrepareEventUnitMovement
TryPrepareEventUnitMovement: @ 0x0800FC90
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	ldrh r1, [r4, #0x3c]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0800FCBE
	ldr r0, _0800FCCC  @ gUnknown_0859A548
	bl Proc_Find
	cmp r0, #0
	bne _0800FCD0
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r6, #0
	bl EnsureCameraOntoPosition
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0800FCD0
_0800FCBE:
	bl MU_CanStart
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0800FCD0
	movs r0, #1
	b _0800FCD2
	.align 2, 0
_0800FCCC: .4byte gUnknown_0859A548
_0800FCD0:
	movs r0, #0
_0800FCD2:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	THUMB_FUNC_END TryPrepareEventUnitMovement

	THUMB_FUNC_START GetSomeEventEngineMoveRelatedBitfield
GetSomeEventEngineMoveRelatedBitfield: @ 0x0800FCD8
	push {lr}
	movs r2, #0
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	cmp r1, #1
	bne _0800FCE6
	movs r2, #1
_0800FCE6:
	ldrh r1, [r0, #0x3c]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0800FCF6
	movs r0, #4
	orrs r2, r0
_0800FCF6:
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0800FD06
	movs r0, #8
	orrs r2, r0
	lsls r0, r2, #0x10
	lsrs r2, r0, #0x10
_0800FD06:
	adds r0, r2, #0
	pop {r1}
	bx r1

	THUMB_FUNC_END GetSomeEventEngineMoveRelatedBitfield

	THUMB_FUNC_START Event2D_
Event2D_: @ 0x0800FD0C
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x38]
	ldrh r5, [r0, #2]
	adds r0, r5, #0
	bl sub_800BCDC
	adds r4, #0x44
	strh r5, [r4]
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END Event2D_

	THUMB_FUNC_START Event2E_CheckAt
Event2E_CheckAt: @ 0x0800FD28
	push {r4, r5, lr}
	ldr r0, [r0, #0x38]
	ldrb r1, [r0]
	movs r2, #0xf
	ands r2, r1
	ldrh r1, [r0, #2]
	ldrb r5, [r0, #2]
	lsrs r3, r1, #8
	cmp r2, #0
	beq _0800FD42
	cmp r2, #1
	beq _0800FD60
	b _0800FD64
_0800FD42:
	ldr r0, _0800FD5C  @ gBmMapUnit
	ldr r1, [r0]
	lsls r0, r3, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r1, r0, r5
	ldrb r0, [r1]
	cmp r0, #0
	beq _0800FD68
	bl GetUnit
	adds r4, r0, #0
	b _0800FD64
	.align 2, 0
_0800FD5C: .4byte gBmMapUnit
_0800FD60:
	ldr r0, _0800FD70  @ gActiveUnit
	ldr r4, [r0]
_0800FD64:
	cmp r4, #0
	bne _0800FD78
_0800FD68:
	ldr r1, _0800FD74  @ gEventSlots
	movs r0, #0
	str r0, [r1, #0x30]
	b _0800FD80
	.align 2, 0
_0800FD70: .4byte gActiveUnit
_0800FD74: .4byte gEventSlots
_0800FD78:
	ldr r0, _0800FD88  @ gEventSlots
	ldr r1, [r4]
	ldrb r1, [r1, #4]
	str r1, [r0, #0x30]
_0800FD80:
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0800FD88: .4byte gEventSlots

	THUMB_FUNC_END Event2E_CheckAt

	THUMB_FUNC_START Event2F_MoveUnit
Event2F_MoveUnit: @ 0x0800FD8C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	adds r7, r0, #0
	ldr r1, [r7, #0x38]
	ldrh r2, [r1]
	movs r4, #7
	ands r4, r2
	movs r0, #0xf
	ands r0, r2
	lsrs r0, r0, #3
	str r0, [sp, #4]
	ldrh r0, [r1, #2]
	str r0, [sp, #8]
	movs r2, #4
	ldrsh r0, [r1, r2]
	bl GetUnitStructFromEventParameter
	mov r8, r0
	cmp r0, #0
	bne _0800FDBE
	b _0800FF0C
_0800FDBE:
	mov r0, r8
	ldrb r0, [r0, #0x10]
	mov r9, r0
	mov r1, r8
	ldrb r1, [r1, #0x11]
	mov sl, r1
	mov r2, r8
	ldr r1, [r2, #0xc]
	movs r0, #0x80
	lsls r0, r0, #0xf
	ands r0, r1
	cmp r0, #0
	bne _0800FDE2
	movs r0, #4
	ands r1, r0
	cmp r1, #0
	beq _0800FDE2
	b _0800FF0C
_0800FDE2:
	cmp r4, #1
	beq _0800FE04
	cmp r4, #1
	bgt _0800FDF0
	cmp r4, #0
	beq _0800FDFA
	b _0800FE7C
_0800FDF0:
	cmp r4, #2
	beq _0800FE28
	cmp r4, #3
	beq _0800FE78
	b _0800FE7C
_0800FDFA:
	ldr r0, [r7, #0x38]
	ldrh r1, [r0, #6]
	ldrb r6, [r0, #6]
	lsrs r5, r1, #8
	b _0800FE72
_0800FE04:
	ldr r0, [r7, #0x38]
	ldrh r1, [r0, #6]
	movs r2, #6
	ldrsh r0, [r0, r2]
	cmp r0, #0
	bge _0800FE12
	movs r1, #0
_0800FE12:
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	bl GetUnitStructFromEventParameter
	cmp r0, #0
	bne _0800FE22
	movs r0, #6
	b _0800FF0E
_0800FE22:
	ldrb r6, [r0, #0x10]
	ldrb r5, [r0, #0x11]
	b _0800FE72
_0800FE28:
	ldr r0, [r7, #0x38]
	ldrh r0, [r0, #6]
	mov r6, r9
	mov r5, sl
	cmp r0, #1
	beq _0800FE68
	cmp r0, #1
	bgt _0800FE3E
	cmp r0, #0
	beq _0800FE5E
	b _0800FE72
_0800FE3E:
	cmp r0, #2
	beq _0800FE52
	cmp r0, #3
	bne _0800FE72
	lsls r0, r5, #0x18
	movs r1, #0xff
	lsls r1, r1, #0x18
	adds r0, r0, r1
	lsrs r5, r0, #0x18
	b _0800FE72
_0800FE52:
	lsls r0, r5, #0x18
	movs r2, #0x80
	lsls r2, r2, #0x11
	adds r0, r0, r2
	lsrs r5, r0, #0x18
	b _0800FE72
_0800FE5E:
	lsls r0, r6, #0x18
	movs r1, #0xff
	lsls r1, r1, #0x18
	adds r0, r0, r1
	b _0800FE70
_0800FE68:
	lsls r0, r6, #0x18
	movs r2, #0x80
	lsls r2, r2, #0x11
	adds r0, r0, r2
_0800FE70:
	lsrs r6, r0, #0x18
_0800FE72:
	movs r0, #0
	str r0, [sp, #0xc]
	b _0800FE7C
_0800FE78:
	ldr r1, _0800FEB8  @ gEventSlotQueue
	str r1, [sp, #0xc]
_0800FE7C:
	ldr r1, [sp, #4]
	adds r0, r7, #0
	bl GetSomeEventEngineMoveRelatedBitfield
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	ldr r0, _0800FEBC  @ gBmMapUnk
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFill
	ldrh r0, [r7, #0x3c]
	lsrs r0, r0, #2
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _0800FEA6
	ldr r2, [sp, #8]
	lsls r0, r2, #0x10
	cmp r0, #0
	bge _0800FEC0
_0800FEA6:
	lsls r1, r6, #0x18
	asrs r1, r1, #0x18
	lsls r2, r5, #0x18
	asrs r2, r2, #0x18
	mov r0, r8
	adds r3, r4, #0
	bl MoveUnit_
	b _0800FF0C
	.align 2, 0
_0800FEB8: .4byte gEventSlotQueue
_0800FEBC: .4byte gBmMapUnk
_0800FEC0:
	mov r0, r9
	lsls r1, r0, #0x18
	asrs r1, r1, #0x18
	mov r0, sl
	lsls r2, r0, #0x18
	asrs r2, r2, #0x18
	adds r0, r7, #0
	bl TryPrepareEventUnitMovement
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0800FEDC
	movs r0, #3
	b _0800FF0E
_0800FEDC:
	ldr r1, [sp, #0xc]
	cmp r1, #0
	bne _0800FEFA
	lsls r1, r6, #0x18
	asrs r1, r1, #0x18
	lsls r2, r5, #0x18
	asrs r2, r2, #0x18
	ldr r0, [sp, #8]
	lsls r3, r0, #0x18
	lsrs r3, r3, #0x18
	str r4, [sp]
	mov r0, r8
	bl sub_8079DDC
	b _0800FF0C
_0800FEFA:
	ldr r0, _0800FF20  @ gEventSlots
	ldr r2, [r0, #0x34]
	lsls r2, r2, #0xf
	asrs r2, r2, #0x10
	mov r0, r8
	ldr r1, [sp, #0xc]
	adds r3, r4, #0
	bl sub_8079D74
_0800FF0C:
	movs r0, #0
_0800FF0E:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0800FF20: .4byte gEventSlots

	THUMB_FUNC_END Event2F_MoveUnit

	THUMB_FUNC_START Event30_ENUN
Event30_ENUN: @ 0x0800FF24
	push {lr}
	ldrh r0, [r0, #0x3c]
	lsrs r0, r0, #2
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0800FF36
	bl SetAllMOVEUNITField44To1_
_0800FF36:
	bl MuCtrExists
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq _0800FF60
	bl RefreshEntityBmMaps
	bl SMS_UpdateFromGameData
	bl RenderBmMap
	ldr r0, _0800FF5C  @ gBmMapUnk
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFill
	movs r0, #2
	b _0800FF62
	.align 2, 0
_0800FF5C: .4byte gBmMapUnk
_0800FF60:
	movs r0, #3
_0800FF62:
	pop {r1}
	bx r1

	THUMB_FUNC_END Event30_ENUN

	THUMB_FUNC_START Event31_DisplayEffectRange
Event31_DisplayEffectRange: @ 0x0800FF68
	push {r4, lr}
	adds r1, r0, #0
	ldrh r0, [r1, #0x3c]
	lsrs r4, r0, #2
	movs r0, #1
	ands r4, r0
	cmp r4, #0
	beq _0800FF7C
	movs r0, #0
	b _0800FFE8
_0800FF7C:
	ldr r2, [r1, #0x38]
	ldrb r0, [r2]
	movs r1, #0xf
	ands r1, r0
	cmp r1, #0
	beq _0800FF8E
	cmp r1, #1
	beq _0800FFD4
	b _0800FFE6
_0800FF8E:
	movs r1, #2
	ldrsh r0, [r2, r1]
	bl GetUnitStructFromEventParameter
	adds r4, r0, #0
	cmp r4, #0
	bne _0800FFA0
	movs r0, #6
	b _0800FFE8
_0800FFA0:
	ldr r0, _0800FFC8  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0800FFB2
	movs r0, #0x68
	bl m4aSongNumStart
_0800FFB2:
	ldr r2, _0800FFCC  @ gUnknown_03000434
	ldr r1, _0800FFD0  @ gActiveUnit
	ldr r0, [r1]
	str r0, [r2]
	str r4, [r1]
	bl HideMoveRangeGraphics
	adds r0, r4, #0
	bl DisplayUnitEffectRange
	b _0800FFE6
	.align 2, 0
_0800FFC8: .4byte gRAMChapterData
_0800FFCC: .4byte gUnknown_03000434
_0800FFD0: .4byte gActiveUnit
_0800FFD4:
	bl HideMoveRangeGraphics
	ldr r2, _0800FFF0  @ gUnknown_03000434
	ldr r1, [r2]
	cmp r1, #0
	beq _0800FFE6
	ldr r0, _0800FFF4  @ gActiveUnit
	str r1, [r0]
	str r4, [r2]
_0800FFE6:
	movs r0, #2
_0800FFE8:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0800FFF0: .4byte gUnknown_03000434
_0800FFF4: .4byte gActiveUnit

	THUMB_FUNC_END Event31_DisplayEffectRange

	THUMB_FUNC_START Event32_SpawnSingleUnit
Event32_SpawnSingleUnit: @ 0x0800FFF8
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	ldr r0, [r0, #0x38]
	ldrb r1, [r0]
	movs r2, #0xf
	mov ip, r2
	ands r2, r1
	mov ip, r2
	ldrh r1, [r0, #4]
	ldrb r6, [r0, #4]
	lsrs r7, r1, #8
	ldrh r4, [r0, #2]
	movs r2, #2
	ldrsh r1, [r0, r2]
	movs r0, #3
	negs r0, r0
	cmp r1, r0
	bne _08010020
	ldr r0, _08010100  @ gEventSlots
	ldrh r4, [r0, #8]
_08010020:
	lsls r0, r6, #0x18
	cmp r0, #0
	blt _0801002C
	lsls r0, r7, #0x18
	cmp r0, #0
	bge _08010032
_0801002C:
	ldr r0, _08010104  @ gUnknown_030004E4
	ldrb r6, [r0]
	ldrb r7, [r0, #2]
_08010032:
	mov r0, sp
	movs r5, #0
	strb r4, [r0]
	mov r3, sp
	ldr r2, _08010108  @ gCharacterData
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	subs r0, #1
	movs r1, #0x34
	muls r0, r1, r0
	adds r4, r0, r2
	ldrb r0, [r4, #5]
	strb r0, [r3, #1]
	mov r0, sp
	strb r5, [r0, #2]
	mov r1, sp
	ldrb r0, [r1, #3]
	movs r2, #2
	negs r2, r2
	ands r2, r0
	strb r2, [r1, #3]
	movs r0, #0
	mov r1, ip
	cmp r1, #0xf
	beq _08010066
	mov r0, ip
_08010066:
	movs r1, #3
	ands r1, r0
	lsls r1, r1, #1
	movs r0, #7
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3, #3]
	mov r3, sp
	ldrb r1, [r4, #0xb]
	lsls r1, r1, #3
	movs r2, #7
	ands r0, r2
	orrs r0, r1
	strb r0, [r3, #3]
	mov r2, sp
	movs r0, #0x3f
	ands r6, r0
	ldrb r1, [r2, #4]
	movs r0, #0x40
	negs r0, r0
	ands r0, r1
	orrs r0, r6
	strb r0, [r2, #4]
	lsls r1, r7, #0x18
	asrs r1, r1, #0x18
	movs r0, #0x3f
	ands r1, r0
	lsls r1, r1, #6
	ldrh r2, [r3, #4]
	ldr r0, _0801010C  @ 0xFFFFF03F
	ands r0, r2
	orrs r0, r1
	strh r0, [r3, #4]
	mov r2, sp
	ldrb r1, [r2, #5]
	movs r0, #0x11
	negs r0, r0
	ands r0, r1
	strb r0, [r2, #5]
	movs r1, #0x20
	orrs r0, r1
	strb r0, [r2, #5]
	movs r1, #0x41
	negs r1, r1
	ands r1, r0
	strb r1, [r2, #5]
	movs r0, #0x7f
	ands r0, r1
	strb r0, [r2, #5]
	mov r0, sp
	strb r5, [r0, #6]
	strb r5, [r0, #7]
	str r5, [sp, #8]
	strb r5, [r0, #0xc]
	strb r5, [r0, #0xd]
	strb r5, [r0, #0xe]
	strb r5, [r0, #0xf]
	strb r5, [r0, #0x10]
	strb r5, [r0, #0x11]
	strb r5, [r0, #0x12]
	strb r5, [r0, #0x13]
	movs r3, #0
	mov r2, ip
	cmp r2, #0xf
	bne _080100EC
	movs r3, #1
_080100EC:
	mov r0, sp
	movs r1, #0
	movs r2, #0
	bl LoadUnit_800F704
	movs r0, #0
	add sp, #0x14
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08010100: .4byte gEventSlots
_08010104: .4byte gUnknown_030004E4
_08010108: .4byte gCharacterData
_0801010C: .4byte 0xFFFFF03F

	THUMB_FUNC_END Event32_SpawnSingleUnit

	THUMB_FUNC_START Event33_CheckUnitVarious
Event33_CheckUnitVarious: @ 0x08010110
	push {r4, r5, lr}
	ldr r0, [r0, #0x38]
	ldrb r1, [r0]
	movs r4, #0xf
	ands r4, r1
	ldrh r5, [r0, #2]
	movs r1, #2
	ldrsh r0, [r0, r1]
	bl GetUnitStructFromEventParameter
	adds r2, r0, #0
	cmp r4, #8
	bls _0801012C
	b _0801028A
_0801012C:
	lsls r0, r4, #2
	ldr r1, _08010138  @ _0801013C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08010138: .4byte _0801013C
_0801013C: @ jump table
	.4byte _08010160 @ case 0
	.4byte _08010170 @ case 1
	.4byte _08010188 @ case 2
	.4byte _080101B8 @ case 3
	.4byte _080101E4 @ case 4
	.4byte _08010214 @ case 5
	.4byte _0801024C @ case 6
	.4byte _08010264 @ case 7
	.4byte _08010278 @ case 8
_08010160:
	cmp r2, #0
	beq _0801018C
	ldr r1, _0801016C  @ gEventSlots
	movs r0, #1
	b _08010288
	.align 2, 0
_0801016C: .4byte gEventSlots
_08010170:
	cmp r2, #0
	bne _08010176
	b _0801027C
_08010176:
	ldr r0, _08010184  @ gEventSlots
	ldr r1, [r2]
	adds r1, #0x30
	ldrb r1, [r1]
	str r1, [r0, #0x30]
	b _0801028A
	.align 2, 0
_08010184: .4byte gEventSlots
_08010188:
	cmp r2, #0
	bne _08010198
_0801018C:
	ldr r0, _08010194  @ gEventSlots
	str r2, [r0, #0x30]
	b _0801028A
	.align 2, 0
_08010194: .4byte gEventSlots
_08010198:
	ldr r0, [r2, #0xc]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	beq _080101AC
	ldr r1, _080101A8  @ gEventSlots
	movs r0, #0
	b _08010288
	.align 2, 0
_080101A8: .4byte gEventSlots
_080101AC:
	ldr r1, _080101B4  @ gEventSlots
	movs r0, #1
	b _08010288
	.align 2, 0
_080101B4: .4byte gEventSlots
_080101B8:
	cmp r2, #0
	beq _0801027C
	ldr r1, [r2, #0xc]
	movs r0, #8
	ands r1, r0
	cmp r1, #0
	beq _080101D0
	ldr r1, _080101CC  @ gEventSlots
	movs r0, #0
	b _08010288
	.align 2, 0
_080101CC: .4byte gEventSlots
_080101D0:
	movs r0, #0x10
	ldrsb r0, [r2, r0]
	cmp r0, #0
	blt _08010234
	ldr r1, _080101E0  @ gEventSlots
	movs r0, #1
	b _08010288
	.align 2, 0
_080101E0: .4byte gEventSlots
_080101E4:
	cmp r2, #0
	beq _0801027C
	ldr r0, _08010200  @ gActiveUnit
	ldr r0, [r0]
	ldr r0, [r0]
	ldrb r1, [r0, #4]
	lsls r0, r5, #0x10
	asrs r0, r0, #0x10
	cmp r1, r0
	beq _08010208
	ldr r1, _08010204  @ gEventSlots
	movs r0, #0
	b _08010288
	.align 2, 0
_08010200: .4byte gActiveUnit
_08010204: .4byte gEventSlots
_08010208:
	ldr r1, _08010210  @ gEventSlots
	movs r0, #1
	b _08010288
	.align 2, 0
_08010210: .4byte gEventSlots
_08010214:
	cmp r2, #0
	beq _0801027C
	movs r1, #0xb
	ldrsb r1, [r2, r1]
	movs r0, #0xc0
	ands r1, r0
	cmp r1, #0
	beq _08010234
	cmp r1, #0x80
	beq _08010240
	ldr r1, _08010230  @ gEventSlots
	movs r0, #1
	b _08010288
	.align 2, 0
_08010230: .4byte gEventSlots
_08010234:
	ldr r0, _0801023C  @ gEventSlots
	str r1, [r0, #0x30]
	b _0801028A
	.align 2, 0
_0801023C: .4byte gEventSlots
_08010240:
	ldr r1, _08010248  @ gEventSlots
	movs r0, #2
	b _08010288
	.align 2, 0
_08010248: .4byte gEventSlots
_0801024C:
	cmp r2, #0
	beq _0801027C
	ldr r0, _08010260  @ gUnknown_030004E8
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	strh r1, [r0]
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	strh r1, [r0, #2]
	b _0801028A
	.align 2, 0
_08010260: .4byte gUnknown_030004E8
_08010264:
	cmp r2, #0
	beq _0801027C
	ldr r0, _08010274  @ gEventSlots
	ldr r1, [r2, #4]
	ldrb r1, [r1, #4]
	str r1, [r0, #0x30]
	b _0801028A
	.align 2, 0
_08010274: .4byte gEventSlots
_08010278:
	cmp r2, #0
	bne _08010280
_0801027C:
	movs r0, #6
	b _0801028C
_08010280:
	adds r0, r2, #0
	bl GetUnitLuck
	ldr r1, _08010294  @ gEventSlots
_08010288:
	str r0, [r1, #0x30]
_0801028A:
	movs r0, #0
_0801028C:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08010294: .4byte gEventSlots

	THUMB_FUNC_END Event33_CheckUnitVarious

	THUMB_FUNC_START Event34_MessWithUnitState
Event34_MessWithUnitState: @ 0x08010298
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	ldr r1, _080102CC  @ gUnknown_080D793C
	mov r0, sp
	movs r2, #3
	bl memcpy
	ldr r1, [r6, #0x38]
	ldrb r0, [r1]
	movs r4, #0xf
	ands r4, r0
	movs r2, #2
	ldrsh r0, [r1, r2]
	bl GetUnitStructFromEventParameter
	adds r5, r0, #0
	cmp r4, #0xa
	blt _080102D0
	cmp r4, #0xc
	ble _080102D8
	cmp r4, #0xf
	bgt _080102D0
	cmp r5, #0
	bne _080102D8
	b _080104A6
	.align 2, 0
_080102CC: .4byte gUnknown_080D793C
_080102D0:
	cmp r5, #0
	bne _080102D8
	movs r0, #6
	b _080104A8
_080102D8:
	cmp r4, #0xf
	bls _080102DE
	b _0801049A
_080102DE:
	lsls r0, r4, #2
	ldr r1, _080102E8  @ _080102EC
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080102E8: .4byte _080102EC
_080102EC: @ jump table
	.4byte _0801032C @ case 0
	.4byte _08010338 @ case 1
	.4byte _08010344 @ case 2
	.4byte _08010344 @ case 3
	.4byte _08010344 @ case 4
	.4byte _08010352 @ case 5
	.4byte _08010370 @ case 6
	.4byte _08010376 @ case 7
	.4byte _0801037C @ case 8
	.4byte _0801049A @ case 9
	.4byte _080103CC @ case 10
	.4byte _08010400 @ case 11
	.4byte _08010426 @ case 12
	.4byte _0801044C @ case 13
	.4byte _0801047C @ case 14
	.4byte _08010494 @ case 15
_0801032C:
	ldr r0, [r5, #0xc]
	ldr r1, _08010334  @ 0x04010001
	b _080103A8
	.align 2, 0
_08010334: .4byte 0x04010001
_08010338:
	ldr r0, [r5, #0xc]
	ldr r1, _08010340  @ 0xFBFEFFFE
	b _0801039E
	.align 2, 0
_08010340: .4byte 0xFBFEFFFE
_08010344:
	subs r0, r4, #2
	add r0, sp
	ldrb r1, [r0]
	adds r0, r5, #0
	bl UnitChangeFaction
	b _0801049A
_08010352:
	ldr r4, _0801036C  @ gEventSlots
	ldr r1, [r4, #4]
	adds r0, r5, #0
	bl SetUnitHp
	ldr r0, [r4, #4]
	cmp r0, #0
	beq _08010364
	b _0801049A
_08010364:
	ldr r0, [r5, #0xc]
	movs r1, #4
	b _080103A8
	.align 2, 0
_0801036C: .4byte gEventSlots
_08010370:
	ldr r0, [r5, #0xc]
	movs r1, #2
	b _080103A8
_08010376:
	ldr r0, [r5, #0xc]
	movs r1, #0x40
	b _080103A8
_0801037C:
	ldr r0, _08010394  @ gEventSlots
	ldr r1, [r0, #4]
	cmp r1, #1
	beq _08010398
	cmp r1, #1
	bcc _080103A4
	movs r0, #1
	negs r0, r0
	cmp r1, r0
	beq _080103AE
	b _0801049A
	.align 2, 0
_08010394: .4byte gEventSlots
_08010398:
	ldr r0, [r5, #0xc]
	movs r1, #9
	negs r1, r1
_0801039E:
	ands r0, r1
	str r0, [r5, #0xc]
	b _0801049A
_080103A4:
	ldr r0, [r5, #0xc]
	movs r1, #8
_080103A8:
	orrs r0, r1
	str r0, [r5, #0xc]
	b _0801049A
_080103AE:
	ldr r1, [r5, #0xc]
	movs r0, #0x80
	lsls r0, r0, #0xe
	ands r0, r1
	cmp r0, #0
	beq _080103C2
	movs r0, #8
	orrs r1, r0
	str r1, [r5, #0xc]
	b _0801049A
_080103C2:
	movs r0, #9
	negs r0, r0
	ands r1, r0
	str r1, [r5, #0xc]
	b _0801049A
_080103CC:
	bl MU_EndAll
	movs r4, #1
_080103D2:
	adds r0, r4, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq _080103F4
	ldr r0, [r2]
	cmp r0, #0
	beq _080103F4
	ldr r0, [r2, #0xc]
	movs r1, #1
	orrs r0, r1
	subs r1, #4
	ands r0, r1
	subs r1, #0x2e
	ands r0, r1
	str r0, [r2, #0xc]
_080103F4:
	adds r4, #1
	cmp r4, #0x3f
	ble _080103D2
	bl ClearCutsceneUnits
	b _0801049A
_08010400:
	bl MU_EndAll
	movs r4, #0x41
_08010406:
	adds r0, r4, #0
	bl GetUnit
	adds r1, r0, #0
	cmp r1, #0
	beq _0801041E
	ldr r0, [r1]
	cmp r0, #0
	beq _0801041E
	adds r0, r1, #0
	bl ClearUnit
_0801041E:
	adds r4, #1
	cmp r4, #0x7f
	ble _08010406
	b _0801049A
_08010426:
	bl MU_EndAll
	movs r4, #0x81
_0801042C:
	adds r0, r4, #0
	bl GetUnit
	adds r1, r0, #0
	cmp r1, #0
	beq _08010444
	ldr r0, [r1]
	cmp r0, #0
	beq _08010444
	adds r0, r1, #0
	bl ClearUnit
_08010444:
	adds r4, #1
	cmp r4, #0xbf
	ble _0801042C
	b _0801049A
_0801044C:
	ldrh r0, [r6, #0x3c]
	lsrs r0, r0, #2
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _080104A6
	adds r0, r5, #0
	bl HideUnitSMS
	ldr r0, [r5, #0xc]
	movs r1, #1
	orrs r0, r1
	str r0, [r5, #0xc]
	adds r0, r5, #0
	bl MU_Create
	adds r4, r0, #0
	bl MU_SetDefaultFacing_Auto
	adds r0, r4, #0
	bl MU_StartDeathFade
	movs r0, #2
	b _080104A8
_0801047C:
	ldr r0, _08010490  @ gProcScr_MUDeathFade
	bl Proc_Find
	negs r1, r0
	orrs r1, r0
	cmp r1, #0
	bge _08010494
	movs r0, #3
	b _080104A8
	.align 2, 0
_08010490: .4byte gProcScr_MUDeathFade
_08010494:
	adds r0, r5, #0
	bl ClearUnit
_0801049A:
	bl RefreshEntityBmMaps
	bl SMS_UpdateFromGameData
	bl RenderBmMap
_080104A6:
	movs r0, #0
_080104A8:
	add sp, #4
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	THUMB_FUNC_END Event34_MessWithUnitState

	THUMB_FUNC_START Event35_UnitClassChanging
Event35_UnitClassChanging: @ 0x080104B0
	push {r4, r5, r6, r7, lr}
	ldr r0, [r0, #0x38]
	ldrb r1, [r0]
	movs r4, #0xf
	ands r4, r1
	ldrh r6, [r0, #4]
	ldrh r7, [r0, #6]
	movs r1, #2
	ldrsh r0, [r0, r1]
	bl GetUnitStructFromEventParameter
	adds r5, r0, #0
	cmp r5, #0
	beq _0801052E
	cmp r4, #0
	beq _080104D6
	cmp r4, #1
	beq _080104F0
	b _08010522
_080104D6:
	cmp r6, #0
	bne _08010518
	ldr r2, _080104EC  @ gCharacterData
	lsls r0, r7, #0x10
	asrs r0, r0, #0x10
	subs r0, #1
	movs r1, #0x34
	muls r0, r1, r0
	adds r0, r0, r2
	ldrb r6, [r0, #5]
	b _08010518
	.align 2, 0
_080104EC: .4byte gCharacterData
_080104F0:
	adds r4, r6, #0
	ldr r0, [r5, #4]
	ldrb r6, [r0, #4]
	ldr r2, _08010538  @ gCharacterData
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	subs r1, r4, #1
	movs r0, #0x34
	muls r0, r1, r0
	adds r0, r0, r2
	ldrb r0, [r0, #5]
	bl GetClassData
	str r0, [r5, #4]
	adds r0, r4, #0
	bl GetUnitFromCharId
	adds r5, r0, #0
	cmp r5, #0
	beq _0801052E
_08010518:
	lsls r0, r6, #0x10
	asrs r0, r0, #0x10
	bl GetClassData
	str r0, [r5, #4]
_08010522:
	bl RefreshEntityBmMaps
	bl SMS_UpdateFromGameData
	bl RenderBmMap
_0801052E:
	movs r0, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08010538: .4byte gCharacterData

	THUMB_FUNC_END Event35_UnitClassChanging

	THUMB_FUNC_START Event36_CheckInArea
Event36_CheckInArea: @ 0x0801053C
	push {r4, r5, r6, r7, lr}
	ldr r2, [r0, #0x38]
	ldrh r0, [r2, #4]
	ldrb r4, [r2, #4]
	lsrs r0, r0, #8
	adds r6, r0, #0
	ldrh r1, [r2, #6]
	adds r0, r1, r4
	subs r0, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsrs r1, r1, #8
	adds r1, r1, r6
	subs r1, #1
	lsls r1, r1, #0x18
	lsrs r7, r1, #0x18
	movs r1, #2
	ldrsh r0, [r2, r1]
	bl GetUnitStructFromEventParameter
	adds r2, r0, #0
	ldr r3, _080105A0  @ gEventSlots
	movs r0, #0
	str r0, [r3, #0x30]
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	lsls r4, r4, #0x18
	asrs r4, r4, #0x18
	cmp r1, r4
	blt _0801059A
	lsls r0, r5, #0x18
	asrs r0, r0, #0x18
	cmp r0, r1
	blt _08010598
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	lsls r0, r6, #0x18
	asrs r0, r0, #0x18
	cmp r1, r0
	blt _08010598
	lsls r0, r7, #0x18
	asrs r0, r0, #0x18
	cmp r0, r1
	blt _08010598
	movs r0, #1
	str r0, [r3, #0x30]
_08010598:
	movs r0, #0
_0801059A:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080105A0: .4byte gEventSlots

	THUMB_FUNC_END Event36_CheckInArea

	THUMB_FUNC_START Event37_GiveItem
Event37_GiveItem: @ 0x080105A4
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r1, [r5, #0x38]
	ldrb r0, [r1]
	movs r4, #0xf
	ands r4, r0
	adds r6, r4, #0
	movs r2, #2
	ldrsh r0, [r1, r2]
	bl GetUnitStructFromEventParameter
	adds r1, r0, #0
	cmp r1, #0
	bne _080105C4
	movs r0, #6
	b _0801060E
_080105C4:
	cmp r4, #1
	beq _080105E8
	cmp r4, #1
	bgt _080105D2
	cmp r4, #0
	beq _080105D8
	b _0801060C
_080105D2:
	cmp r6, #2
	beq _080105F8
	b _0801060C
_080105D8:
	ldr r0, _080105E4  @ gEventSlots
	ldrh r2, [r0, #0xc]
	adds r0, r5, #0
	bl NewItemGot
	b _0801060C
	.align 2, 0
_080105E4: .4byte gEventSlots
_080105E8:
	ldr r0, _080105F4  @ gEventSlots
	ldr r2, [r0, #0xc]
	adds r0, r5, #0
	bl NewGoldGotPopup
	b _0801060C
	.align 2, 0
_080105F4: .4byte gEventSlots
_080105F8:
	bl GetPartyGoldAmount
	ldr r1, _08010614  @ gEventSlots
	ldr r1, [r1, #0xc]
	subs r0, r0, r1
	cmp r0, #0
	bge _08010608
	movs r0, #0
_08010608:
	bl SetPartyGoldAmount
_0801060C:
	movs r0, #2
_0801060E:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08010614: .4byte gEventSlots

	THUMB_FUNC_END Event37_GiveItem

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
	bl sub_8011750
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
	bl DisplayCursor
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
	ldr r1, _08010878  @ gUnknown_0202BCB0
	ldrh r0, [r1, #0x14]
	strh r0, [r2]
	ldrh r0, [r1, #0x16]
	strh r0, [r2, #2]
	b _080108A2
	.align 2, 0
_08010874: .4byte gUnknown_030004E8
_08010878: .4byte gUnknown_0202BCB0
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
	bl UnsetEventId
	ldr r0, _08010988  @ gUnknown_0859DBBC
	adds r1, r4, #0
	bl Proc_StartBlocking
	movs r0, #2
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08010988: .4byte gUnknown_0859DBBC

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
	bl GetThread2SkipStack
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
	bl GetThread2SkipStack
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
	bl GetThread2SkipStack
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
	bl GetThread2SkipStack
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
	bl sub_8012950
	b _08010C66
_08010C56:
	bl sub_8012974
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
