	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	THUMB_FUNC_START sub_80A6560
sub_80A6560: @ 0x080A6560
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x80
	movs r0, #5
	bl GetSaveTargetAddress
	mov r9, r0
	add r0, sp, #0x6c
	movs r4, #0
	strh r4, [r0]
	add r5, sp, #0x24
	ldr r2, _080A66A8  @ 0x01000012
	adds r1, r5, #0
	bl CpuSet
	mov r0, sp
	adds r0, #0x6e
	strh r4, [r0]
	add r4, sp, #0x48
	ldr r2, _080A66AC  @ 0x01000007
	adds r1, r4, #0
	bl CpuSet
	movs r7, #0
	mov r8, r5
	add r0, sp, #0x70
	mov sl, r0
	mov r1, sp
	adds r1, #0x58
	str r1, [sp, #0x78]
	mov r3, sp
	adds r3, #0x5c
	str r3, [sp, #0x7c]
	mov r5, sp
	adds r5, #0x14
	str r5, [sp, #0x74]
	mov r6, r9
_080A65B0:
	movs r0, #0xc4
	muls r0, r7, r0
	adds r0, #0x10
	mov r1, r9
	adds r4, r1, r0
	movs r5, #4
_080A65BC:
	mov r0, r8
	adds r1, r4, #0
	movs r2, #0x24
	bl WriteAndVerifySramFast
	adds r4, #0x24
	subs r5, #1
	cmp r5, #0
	bge _080A65BC
	add r0, sp, #0x48
	adds r1, r6, #0
	movs r2, #0xf
	bl WriteAndVerifySramFast
	adds r6, #0xc4
	adds r7, #1
	cmp r7, #9
	ble _080A65B0
	movs r0, #7
	mov r3, sl
	strh r0, [r3]
	movs r1, #0xf5
	lsls r1, r1, #3
	add r1, r9
	mov r0, sl
	movs r2, #2
	bl WriteAndVerifySramFast
	movs r7, #0
	ldr r5, [sp, #0x78]
	mov r8, r5
	movs r0, #3
	mov sl, r0
	ldr r6, _080A66B0  @ 0x000007AC
	add r6, r9
	movs r1, #0
	mov r9, r1
_080A6606:
	ldr r4, _080A66B4  @ gUnknown_08205CB4
	lsls r3, r7, #2
	mov ip, r3
	add r4, r9
	ldrb r3, [r4]
	lsls r1, r3, #0x1e
	lsrs r1, r1, #0x1e
	mov r5, sl
	ands r1, r5
	mov r0, r8
	ldrb r2, [r0]
	movs r5, #4
	negs r5, r5
	adds r0, r5, #0
	ands r2, r0
	orrs r2, r1
	lsls r0, r3, #0x1c
	lsrs r0, r0, #0x1e
	mov r1, sl
	ands r0, r1
	lsls r0, r0, #2
	subs r5, #9
	adds r1, r5, #0
	ands r2, r1
	orrs r2, r0
	movs r1, #0x10
	ands r1, r3
	movs r3, #0x11
	negs r3, r3
	adds r0, r3, #0
	ands r2, r0
	orrs r2, r1
	mov r5, r8
	strb r2, [r5]
	ldr r2, [r4]
	lsrs r2, r2, #5
	lsls r2, r2, #5
	ldr r0, [sp, #0x58]
	movs r1, #0x1f
	ands r0, r1
	orrs r0, r2
	str r0, [sp, #0x58]
	ldr r0, _080A66B8  @ gUnknown_08A1FB08
	mov r1, ip
	adds r5, r1, r0
	ldr r0, [r5]
	mov r1, sp
	bl GetStringFromIndexInBuffer
	mov r0, sp
	ldr r1, [sp, #0x7c]
	bl sub_8042DC8
	mov r0, r8
	adds r1, r6, #0
	movs r2, #0x14
	bl WriteAndVerifySramFast
	adds r6, #0x14
	movs r3, #0x14
	add r9, r3
	adds r7, #1
	cmp r7, #9
	ble _080A6606
	ldr r0, _080A66BC  @ 0x00020112
	str r0, [sp, #0x14]
	movs r0, #2
	ldr r5, [sp, #0x74]
	strb r0, [r5, #6]
	ldr r0, [sp, #0x74]
	movs r1, #5
	bl SaveMetadata_Save
	add sp, #0x80
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A66A8: .4byte 0x01000012
_080A66AC: .4byte 0x01000007
_080A66B0: .4byte 0x000007AC
_080A66B4: .4byte gUnknown_08205CB4
_080A66B8: .4byte gUnknown_08A1FB08
_080A66BC: .4byte 0x00020112

	THUMB_FUNC_END sub_80A6560

	THUMB_FUNC_START sub_80A66C0
sub_80A66C0: @ 0x080A66C0
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	movs r0, #5
	bl GetSaveSourceAddress
	ldr r2, _080A66E8  @ ReadSramFast
	movs r1, #0xc4
	muls r1, r4, r1
	adds r0, r0, r1
	ldr r3, [r2]
	adds r1, r5, #0
	movs r2, #0xc4
	bl _call_via_r3
	ldrb r0, [r5]
	cmp r0, #0
	beq _080A66EC
	movs r0, #1
	b _080A66EE
	.align 2, 0
_080A66E8: .4byte ReadSramFast
_080A66EC:
	movs r0, #0
_080A66EE:
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80A66C0

	THUMB_FUNC_START sub_80A66F4
sub_80A66F4: @ 0x080A66F4
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	movs r0, #5
	bl GetSaveSourceAddress
	ldr r2, _080A6728  @ ReadSramFast
	movs r1, #0xc4
	muls r1, r4, r1
	adds r0, r0, r1
	ldr r4, _080A672C  @ gUnknown_0203EDBC
	ldr r3, [r2]
	adds r1, r4, #0
	movs r2, #0xc4
	bl _call_via_r3
	ldrb r0, [r4]
	cmp r0, #0
	beq _080A6730
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_8042DC8
	movs r0, #1
	b _080A6732
	.align 2, 0
_080A6728: .4byte ReadSramFast
_080A672C: .4byte gUnknown_0203EDBC
_080A6730:
	movs r0, #0
_080A6732:
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80A66F4

	THUMB_FUNC_START sub_80A6738
sub_80A6738: @ 0x080A6738
	push {r4, r5, lr}
	sub sp, #0x10
	adds r4, r0, #0
	adds r5, r1, #0
	movs r0, #5
	bl GetSaveTargetAddress
	adds r1, r0, #0
	movs r0, #0xc4
	muls r0, r4, r0
	adds r1, r1, r0
	adds r0, r5, #0
	movs r2, #0xf
	bl WriteAndVerifySramFast
	ldr r0, _080A6770  @ 0x00020112
	str r0, [sp]
	mov r1, sp
	movs r0, #2
	strb r0, [r1, #6]
	mov r0, sp
	movs r1, #5
	bl SaveMetadata_Save
	add sp, #0x10
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A6770: .4byte 0x00020112

	THUMB_FUNC_END sub_80A6738

	THUMB_FUNC_START sub_80A6774
sub_80A6774: @ 0x080A6774
	push {r4, r5, r6, lr}
	sub sp, #0x14
	adds r6, r0, #0
	movs r0, #5
	bl GetSaveTargetAddress
	adds r4, r0, #0
	add r0, sp, #0x10
	movs r1, #0
	strh r1, [r0]
	ldr r5, _080A67BC  @ gUnknown_0203EDBC
	ldr r2, _080A67C0  @ 0x01000062
	adds r1, r5, #0
	bl CpuSet
	movs r0, #0xc4
	muls r0, r6, r0
	adds r4, r4, r0
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #0xc4
	bl WriteAndVerifySramFast
	ldr r0, _080A67C4  @ 0x00020112
	str r0, [sp]
	mov r1, sp
	movs r0, #2
	strb r0, [r1, #6]
	mov r0, sp
	movs r1, #5
	bl SaveMetadata_Save
	add sp, #0x14
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A67BC: .4byte gUnknown_0203EDBC
_080A67C0: .4byte 0x01000062
_080A67C4: .4byte 0x00020112

	THUMB_FUNC_END sub_80A6774

	THUMB_FUNC_START sub_80A67C8
sub_80A67C8: @ 0x080A67C8
	push {r4, r5, r6, lr}
	mov r6, r9
	mov r5, r8
	push {r5, r6}
	sub sp, #0x10
	adds r6, r0, #0
	mov r9, r1
	movs r0, #5
	bl GetSaveSourceAddress
	adds r4, r0, #0
	movs r0, #5
	bl GetSaveTargetAddress
	adds r5, r0, #0
	ldr r1, _080A6834  @ ReadSramFast
	movs r0, #0xc4
	mov r8, r0
	mov r0, r8
	muls r0, r6, r0
	adds r4, r4, r0
	ldr r6, _080A6838  @ gUnknown_0203EDBC
	ldr r3, [r1]
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #0xc4
	bl _call_via_r3
	mov r1, r8
	mov r0, r9
	muls r0, r1, r0
	adds r5, r5, r0
	adds r0, r6, #0
	adds r1, r5, #0
	movs r2, #0xc4
	bl WriteAndVerifySramFast
	ldr r0, _080A683C  @ 0x00020112
	str r0, [sp]
	mov r1, sp
	movs r0, #2
	strb r0, [r1, #6]
	mov r0, sp
	movs r1, #5
	bl SaveMetadata_Save
	add sp, #0x10
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A6834: .4byte ReadSramFast
_080A6838: .4byte gUnknown_0203EDBC
_080A683C: .4byte 0x00020112

	THUMB_FUNC_END sub_80A67C8

	THUMB_FUNC_START sub_80A6840
sub_80A6840: @ 0x080A6840
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	mov r8, r0
	mov sl, r1
	movs r0, #5
	bl GetSaveSourceAddress
	adds r5, r0, #0
	movs r0, #5
	bl GetSaveTargetAddress
	adds r6, r0, #0
	ldr r0, _080A68CC  @ ReadSramFast
	mov r9, r0
	movs r4, #0xc4
	mov r7, r8
	muls r7, r4, r7
	adds r0, r5, r7
	mov r1, r9
	ldr r3, [r1]
	ldr r1, _080A68D0  @ gUnknown_0203EDBC
	movs r2, #0xc4
	bl _call_via_r3
	mov r0, sl
	muls r0, r4, r0
	adds r4, r0, #0
	adds r5, r5, r4
	ldr r1, _080A68D4  @ gUnknown_0203EE80
	mov r8, r1
	mov r0, r9
	ldr r3, [r0]
	adds r0, r5, #0
	movs r2, #0xc4
	bl _call_via_r3
	adds r4, r6, r4
	ldr r0, _080A68D0  @ gUnknown_0203EDBC
	adds r1, r4, #0
	movs r2, #0xc4
	bl WriteAndVerifySramFast
	adds r6, r6, r7
	mov r0, r8
	adds r1, r6, #0
	movs r2, #0xc4
	bl WriteAndVerifySramFast
	ldr r0, _080A68D8  @ 0x00020112
	str r0, [sp]
	mov r1, sp
	movs r0, #2
	strb r0, [r1, #6]
	mov r0, sp
	movs r1, #5
	bl SaveMetadata_Save
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A68CC: .4byte ReadSramFast
_080A68D0: .4byte gUnknown_0203EDBC
_080A68D4: .4byte gUnknown_0203EE80
_080A68D8: .4byte 0x00020112

	THUMB_FUNC_END sub_80A6840

	THUMB_FUNC_START sub_80A68DC
sub_80A68DC: @ 0x080A68DC
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #0x10
	adds r4, r0, #0
	mov r8, r1
	adds r6, r2, #0
	movs r0, #5
	bl GetSaveTargetAddress
	adds r5, r0, #0
	movs r0, #0xc4
	muls r4, r0, r4
	adds r1, r5, r4
	adds r0, r6, #0
	movs r2, #0xf
	bl WriteAndVerifySramFast
	adds r4, #0x10
	adds r5, r5, r4
	mov r4, r8
	movs r6, #4
_080A6908:
	adds r0, r4, #0
	adds r1, r5, #0
	bl SaveUnit
	adds r5, #0x24
	adds r4, #0x48
	subs r6, #1
	cmp r6, #0
	bge _080A6908
	ldr r0, _080A6938  @ 0x00020112
	str r0, [sp]
	mov r1, sp
	movs r0, #2
	strb r0, [r1, #6]
	mov r0, sp
	movs r1, #5
	bl SaveMetadata_Save
	add sp, #0x10
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A6938: .4byte 0x00020112

	THUMB_FUNC_END sub_80A68DC

	THUMB_FUNC_START sub_80A693C
sub_80A693C: @ 0x080A693C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	adds r6, r1, #0
	adds r5, r2, #0
	movs r0, #5
	bl GetSaveSourceAddress
	adds r7, r0, #0
	ldr r1, _080A6990  @ ReadSramFast
	movs r0, #0xc4
	mov r4, r8
	muls r4, r0, r4
	adds r0, r7, r4
	ldr r3, [r1]
	adds r1, r5, #0
	movs r2, #0xf
	bl _call_via_r3
	adds r4, #0x10
	adds r4, r7, r4
	movs r5, #4
_080A696A:
	adds r0, r4, #0
	adds r1, r6, #0
	bl LoadSavedUnit
	adds r6, #0x48
	adds r4, #0x24
	subs r5, #1
	cmp r5, #0
	bge _080A696A
	movs r0, #0xc4
	mov r1, r8
	muls r1, r0, r1
	adds r0, r1, #0
	adds r0, r7, r0
	ldrb r0, [r0]
	cmp r0, #0
	beq _080A6994
	movs r0, #1
	b _080A6996
	.align 2, 0
_080A6990: .4byte ReadSramFast
_080A6994:
	movs r0, #0
_080A6996:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80A693C

	THUMB_FUNC_START sub_80A69A0
sub_80A69A0: @ 0x080A69A0
	push {r4, lr}
	sub sp, #0x10
	adds r4, r0, #0
	movs r0, #5
	bl GetSaveTargetAddress
	adds r1, r0, #0
	ldr r0, _080A69D4  @ 0x000007AC
	adds r1, r1, r0
	adds r0, r4, #0
	movs r2, #0xc8
	bl WriteAndVerifySramFast
	ldr r0, _080A69D8  @ 0x00020112
	str r0, [sp]
	mov r1, sp
	movs r0, #2
	strb r0, [r1, #6]
	mov r0, sp
	movs r1, #5
	bl SaveMetadata_Save
	add sp, #0x10
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A69D4: .4byte 0x000007AC
_080A69D8: .4byte 0x00020112

	THUMB_FUNC_END sub_80A69A0

	THUMB_FUNC_START sub_80A69DC
sub_80A69DC: @ 0x080A69DC
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #5
	bl GetSaveSourceAddress
	ldr r1, _080A69FC  @ ReadSramFast
	ldr r2, _080A6A00  @ 0x000007AC
	adds r0, r0, r2
	ldr r3, [r1]
	adds r1, r4, #0
	movs r2, #0xc8
	bl _call_via_r3
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A69FC: .4byte ReadSramFast
_080A6A00: .4byte 0x000007AC

	THUMB_FUNC_END sub_80A69DC

	THUMB_FUNC_START sub_80A6A04
sub_80A6A04: @ 0x080A6A04
	push {r4, lr}
	sub sp, #0x10
	adds r4, r0, #0
	movs r0, #5
	bl GetSaveTargetAddress
	adds r1, r0, #0
	movs r0, #0xf5
	lsls r0, r0, #3
	adds r1, r1, r0
	adds r0, r4, #0
	movs r2, #2
	bl WriteAndVerifySramFast
	ldr r0, _080A6A3C  @ 0x00020112
	str r0, [sp]
	mov r1, sp
	movs r0, #2
	strb r0, [r1, #6]
	mov r0, sp
	movs r1, #5
	bl SaveMetadata_Save
	add sp, #0x10
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A6A3C: .4byte 0x00020112

	THUMB_FUNC_END sub_80A6A04

	THUMB_FUNC_START sub_80A6A40
sub_80A6A40: @ 0x080A6A40
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #5
	bl GetSaveSourceAddress
	ldr r1, _080A6A64  @ ReadSramFast
	movs r2, #0xf5
	lsls r2, r2, #3
	adds r0, r0, r2
	ldr r3, [r1]
	adds r1, r4, #0
	movs r2, #2
	bl _call_via_r3
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A6A64: .4byte ReadSramFast

	THUMB_FUNC_END sub_80A6A40

	THUMB_FUNC_START sub_80A6A68
sub_80A6A68: @ 0x080A6A68
	push {r4, lr}
	sub sp, #0x10
	movs r0, #5
	bl sub_80A654C
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080A6A7E
	b _080A6A96
_080A6A7A:
	movs r0, #1
	b _080A6A98
_080A6A7E:
	movs r4, #0
_080A6A80:
	adds r0, r4, #0
	mov r1, sp
	bl sub_80A66F4
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq _080A6A7A
	adds r4, #1
	cmp r4, #9
	ble _080A6A80
_080A6A96:
	movs r0, #0
_080A6A98:
	add sp, #0x10
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80A6A68

	THUMB_FUNC_START sub_80A6AA0
sub_80A6AA0: @ 0x080A6AA0
	push {r4, lr}
	sub sp, #0x4c
	movs r0, #3
	bl sub_80A5DA8
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A6AE8
	movs r0, #3
	mov r1, sp
	bl sub_80A5DFC
	mov r0, sp
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x7f
	bne _080A6AE8
	ldr r1, _080A6AF0  @ ReadSramFast
	ldr r0, _080A6AF4  @ gUnknown_08A1FB30
	ldr r0, [r0]
	ldr r4, _080A6AF8  @ gUnknown_0203EF44
	ldr r3, [r1]
	adds r1, r4, #0
	movs r2, #0x1c
	bl _call_via_r3
	ldr r0, [sp, #0x2c]
	lsls r0, r0, #9
	lsrs r0, r0, #0x16
	ldrb r4, [r4, #0xf]
	cmp r0, r4
	beq _080A6AE8
	movs r0, #3
	bl ClearSaveBlock
_080A6AE8:
	add sp, #0x4c
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A6AF0: .4byte ReadSramFast
_080A6AF4: .4byte gUnknown_08A1FB30
_080A6AF8: .4byte gUnknown_0203EF44

	THUMB_FUNC_END sub_80A6AA0

	THUMB_FUNC_START sub_80A6AFC
sub_80A6AFC: @ 0x080A6AFC
	push {r4, r5, lr}
	ldr r1, _080A6B4C  @ ReadSramFast
	ldr r5, _080A6B50  @ gUnknown_08A1FB30
	ldr r0, [r5]
	ldr r4, _080A6B54  @ gUnknown_0203EF44
	ldr r3, [r1]
	adds r1, r4, #0
	movs r2, #0x1c
	bl _call_via_r3
	ldr r1, [r4]
	ldr r0, _080A6B58  @ 0x50414D58
	cmp r1, r0
	bne _080A6B68
	bl GetSomeByte
	lsls r0, r0, #0x18
	ldr r1, _080A6B5C  @ 0x00020223
	adds r0, r0, r1
	ldr r1, [r4, #8]
	cmp r1, r0
	bne _080A6B68
	ldr r0, [r4, #0x10]
	ldr r1, [r5]
	adds r0, r0, r1
	str r0, [r4, #0x10]
	ldr r0, [r4, #0x18]
	adds r0, r0, r1
	str r0, [r4, #0x18]
	ldr r3, _080A6B60  @ gRAMChapterData
	ldrb r2, [r4, #0xf]
	lsls r2, r2, #0xd
	ldr r0, [r3, #0x2c]
	ldr r1, _080A6B64  @ 0xFF801FFF
	ands r0, r1
	orrs r0, r2
	str r0, [r3, #0x2c]
	movs r0, #1
	b _080A6B6A
	.align 2, 0
_080A6B4C: .4byte ReadSramFast
_080A6B50: .4byte gUnknown_08A1FB30
_080A6B54: .4byte gUnknown_0203EF44
_080A6B58: .4byte 0x50414D58
_080A6B5C: .4byte 0x00020223
_080A6B60: .4byte gRAMChapterData
_080A6B64: .4byte 0xFF801FFF
_080A6B68:
	movs r0, #0
_080A6B6A:
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80A6AFC

	THUMB_FUNC_START sub_80A6B70
sub_80A6B70: @ 0x080A6B70
	push {lr}
	ldr r2, _080A6B80  @ gUnknown_0203EF44
	ldr r1, [r2]
	ldr r0, _080A6B84  @ 0x50414D58
	cmp r1, r0
	bne _080A6B88
	ldr r0, [r2, #0x10]
	b _080A6B8A
	.align 2, 0
_080A6B80: .4byte gUnknown_0203EF44
_080A6B84: .4byte 0x50414D58
_080A6B88:
	movs r0, #0
_080A6B8A:
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80A6B70

	THUMB_FUNC_START sub_80A6B90
sub_80A6B90: @ 0x080A6B90
	push {lr}
	ldr r2, _080A6BA4  @ gUnknown_0203EF44
	ldr r1, [r2]
	ldr r0, _080A6BA8  @ 0x50414D58
	cmp r1, r0
	bne _080A6BAC
	movs r1, #0x14
	ldrsh r0, [r2, r1]
	b _080A6BAE
	.align 2, 0
_080A6BA4: .4byte gUnknown_0203EF44
_080A6BA8: .4byte 0x50414D58
_080A6BAC:
	movs r0, #0
_080A6BAE:
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80A6B90

	THUMB_FUNC_START sub_80A6BB4
sub_80A6BB4: @ 0x080A6BB4
	push {lr}
	ldr r2, _080A6BC4  @ gUnknown_0203EF44
	ldr r1, [r2]
	ldr r0, _080A6BC8  @ 0x50414D58
	cmp r1, r0
	bne _080A6BCC
	ldr r0, [r2, #0x18]
	b _080A6BCE
	.align 2, 0
_080A6BC4: .4byte gUnknown_0203EF44
_080A6BC8: .4byte 0x50414D58
_080A6BCC:
	movs r0, #0
_080A6BCE:
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80A6BB4

	THUMB_FUNC_START sub_80A6BD4
sub_80A6BD4: @ 0x080A6BD4
	push {lr}
	ldr r2, _080A6BE8  @ gUnknown_0203EF44
	ldr r1, [r2]
	ldr r0, _080A6BEC  @ 0x50414D58
	cmp r1, r0
	bne _080A6BF0
	movs r1, #0x16
	ldrsh r0, [r2, r1]
	b _080A6BF2
	.align 2, 0
_080A6BE8: .4byte gUnknown_0203EF44
_080A6BEC: .4byte 0x50414D58
_080A6BF0:
	movs r0, #0
_080A6BF2:
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80A6BD4

	THUMB_FUNC_START sub_80A6BF8
sub_80A6BF8: @ 0x080A6BF8
	push {lr}
	adds r2, r0, #0
	movs r3, #0
	lsrs r0, r1, #0x1f
	adds r1, r1, r0
	asrs r1, r1, #1
	cmp r3, r1
	bge _080A6C14
_080A6C08:
	ldrh r0, [r2]
	adds r3, r3, r0
	adds r2, #2
	subs r1, #1
	cmp r1, #0
	bne _080A6C08
_080A6C14:
	lsls r0, r3, #0x10
	lsrs r0, r0, #0x10
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80A6BF8

	THUMB_FUNC_START sub_80A6C1C
sub_80A6C1C: @ 0x080A6C1C
	push {r4, lr}
	ldr r4, _080A6C70  @ gGenericBuffer
	bl IsSramWorking
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A6C84
	ldr r1, _080A6C74  @ ReadSramFast
	ldr r0, _080A6C78  @ 0x0E007400
	movs r2, #0xc0
	lsls r2, r2, #4
	ldr r3, [r1]
	adds r1, r4, #0
	bl _call_via_r3
	ldr r1, [r4]
	ldr r0, _080A6C7C  @ 0x50414D58
	cmp r1, r0
	bne _080A6C84
	bl GetSomeByte
	lsls r0, r0, #0x18
	ldr r1, _080A6C80  @ 0x00020223
	adds r0, r0, r1
	ldr r1, [r4, #8]
	cmp r1, r0
	bne _080A6C84
	ldrh r0, [r4, #4]
	cmp r0, #0
	beq _080A6C84
	adds r0, r4, #0
	adds r0, #8
	ldrh r1, [r4, #4]
	bl sub_80A6BF8
	ldrh r1, [r4, #6]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r1, r0
	bne _080A6C84
	movs r0, #1
	b _080A6C86
	.align 2, 0
_080A6C70: .4byte gGenericBuffer
_080A6C74: .4byte ReadSramFast
_080A6C78: .4byte 0x0E007400
_080A6C7C: .4byte 0x50414D58
_080A6C80: .4byte 0x00020223
_080A6C84:
	movs r0, #0
_080A6C86:
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80A6C1C

	THUMB_FUNC_START sub_80A6C8C
sub_80A6C8C: @ 0x080A6C8C
	push {r4, r5, r6, lr}
	bl sub_80A6AFC
	ldr r5, _080A6CF4  @ ReadSramFast
	bl sub_80A6BB4
	adds r4, r0, #0
	ldr r6, _080A6CF8  @ gGenericBuffer
	bl sub_80A6BD4
	adds r2, r0, #0
	ldr r3, [r5]
	adds r0, r4, #0
	adds r1, r6, #0
	bl _call_via_r3
	ldr r4, _080A6CFC  @ gUnknown_08A1FB34
	ldr r1, [r4]
	adds r0, r6, #0
	bl CopyDataWithPossibleUncomp
	ldr r1, [r4]
	ldr r0, _080A6D00  @ gRAMChapterData
	str r0, [r1, #0x18]
	ldr r0, _080A6D04  @ gGameState
	str r0, [r1, #0x1c]
	ldr r0, _080A6D08  @ gActiveUnit
	str r0, [r1, #0x20]
	ldr r0, _080A6D0C  @ gUnitLookup
	str r0, [r1, #0x24]
	ldr r0, _080A6D10  @ gBattleActor
	str r0, [r1, #0x28]
	ldr r0, _080A6D14  @ gBattleTarget
	str r0, [r1, #0x2c]
	ldr r0, _080A6D18  @ gBattleHitArray
	str r0, [r1, #0x30]
	movs r0, #0
	bl GetTrap
	ldr r1, [r4]
	str r0, [r1, #0x34]
	bl GetGlobalEventIdStorage
	ldr r1, [r4]
	str r0, [r1, #0x38]
	bl GetLocalEventIdStorage
	ldr r1, [r4]
	str r0, [r1, #0x3c]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A6CF4: .4byte ReadSramFast
_080A6CF8: .4byte gGenericBuffer
_080A6CFC: .4byte gUnknown_08A1FB34
_080A6D00: .4byte gRAMChapterData
_080A6D04: .4byte gGameState
_080A6D08: .4byte gActiveUnit
_080A6D0C: .4byte gUnitLookup
_080A6D10: .4byte gBattleActor
_080A6D14: .4byte gBattleTarget
_080A6D18: .4byte gBattleHitArray

	THUMB_FUNC_END sub_80A6C8C

	THUMB_FUNC_START sub_80A6D1C
sub_80A6D1C: @ 0x080A6D1C
	movs r1, #0
	strb r1, [r0]
	movs r0, #1
	bx lr

	THUMB_FUNC_END sub_80A6D1C

	THUMB_FUNC_START sub_80A6D24
sub_80A6D24: @ 0x080A6D24
	push {lr}
	bl GetChapterTitle
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80A6D24

	THUMB_FUNC_START sub_80A6D30
sub_80A6D30: @ 0x080A6D30
	movs r0, #0
	bx lr

	THUMB_FUNC_END sub_80A6D30

	THUMB_FUNC_START sub_80A6D34
sub_80A6D34: @ 0x080A6D34
	movs r0, #0
	bx lr

	THUMB_FUNC_END sub_80A6D34

	THUMB_FUNC_START sub_80A6D38
sub_80A6D38: @ 0x080A6D38
	push {lr}
	bl GetGlobalCompletionCount
	ldr r1, _080A6D48  @ gBmMapHidden
	movs r0, #0
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_080A6D48: .4byte gBmMapHidden

	THUMB_FUNC_END sub_80A6D38

	THUMB_FUNC_START sub_80A6D4C
sub_80A6D4C: @ 0x080A6D4C
	push {r4, r5, lr}
	bl GetGameClock
	ldr r5, _080A6D94  @ gRAMChapterData
	ldr r1, [r5, #4]
	subs r0, r0, r1
	movs r1, #0xb4
	bl __udivsi3
	adds r4, r0, #0
	ldr r0, _080A6D98  @ 0x0000EA60
	cmp r4, r0
	ble _080A6D68
	adds r4, r0, #0
_080A6D68:
	ldr r0, _080A6D9C  @ gUnknown_0203EF60
	movs r1, #0x7f
	ldrb r2, [r5, #0xe]
	ands r2, r1
	ldrb r3, [r0]
	movs r1, #0x80
	negs r1, r1
	ands r1, r3
	orrs r1, r2
	strb r1, [r0]
	ldrh r2, [r5, #0x10]
	lsls r2, r2, #7
	ldrh r3, [r0]
	movs r1, #0x7f
	ands r1, r3
	orrs r1, r2
	strh r1, [r0]
	strh r4, [r0, #2]
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080A6D94: .4byte gRAMChapterData
_080A6D98: .4byte 0x0000EA60
_080A6D9C: .4byte gUnknown_0203EF60

	THUMB_FUNC_END sub_80A6D4C

	THUMB_FUNC_START sub_80A6DA0
sub_80A6DA0: @ 0x080A6DA0
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	mov r9, r0
	adds r7, r1, #0
	movs r1, #0
	adds r0, r7, #7
_080A6DB0:
	strb r1, [r0]
	subs r0, #1
	cmp r0, r7
	bge _080A6DB0
	movs r5, #0
	movs r0, #0
	movs r1, #1
	mov r8, r1
_080A6DC0:
	movs r4, #0
	adds r1, r0, #1
	mov ip, r1
	lsls r0, r0, #2
	add r0, r9
	adds r6, r0, #0
	adds r6, #0x30
_080A6DCE:
	cmp r4, #0
	beq _080A6DD8
	cmp r4, #1
	beq _080A6DE0
	b _080A6DEA
_080A6DD8:
	ldrb r0, [r6]
	mov r3, r8
	ands r3, r0
	b _080A6DEA
_080A6DE0:
	ldrb r1, [r6]
	movs r0, #2
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
_080A6DEA:
	lsls r0, r3, #0x18
	cmp r0, #0
	beq _080A6E0A
	adds r2, r5, #0
	cmp r5, #0
	bge _080A6DF8
	adds r2, r5, #7
_080A6DF8:
	asrs r2, r2, #3
	movs r1, #7
	ands r1, r5
	adds r2, r7, r2
	mov r0, r8
	lsls r0, r1
	ldrb r1, [r2]
	orrs r0, r1
	strb r0, [r2]
_080A6E0A:
	adds r5, #1
	adds r4, #1
	cmp r4, #1
	ble _080A6DCE
	mov r0, ip
	cmp r0, #0x1c
	ble _080A6DC0
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80A6DA0

	THUMB_FUNC_START sub_80A6E24
sub_80A6E24: @ 0x080A6E24
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	mov r8, r0
	adds r6, r1, #0
	movs r4, #0
	movs r0, #0
	movs r1, #1
	mov ip, r1
_080A6E38:
	movs r5, #0
	adds r7, r0, #1
	lsls r0, r0, #2
	add r0, r8
	adds r3, r0, #0
	adds r3, #0x30
_080A6E44:
	adds r0, r4, #0
	cmp r4, #0
	bge _080A6E4C
	adds r0, r4, #7
_080A6E4C:
	asrs r2, r0, #3
	movs r1, #7
	ands r1, r4
	mov r0, ip
	lsls r0, r1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r5, #0
	beq _080A6E64
	cmp r5, #1
	beq _080A6E7C
	b _080A6E96
_080A6E64:
	adds r0, r6, r2
	ldrb r0, [r0]
	ands r0, r1
	cmp r0, #0
	beq _080A6E76
	ldrb r1, [r3]
	mov r0, ip
	orrs r0, r1
	b _080A6E94
_080A6E76:
	ldrb r1, [r3]
	movs r0, #0xfe
	b _080A6E92
_080A6E7C:
	adds r0, r6, r2
	ldrb r0, [r0]
	ands r0, r1
	cmp r0, #0
	beq _080A6E8E
	ldrb r0, [r3]
	movs r1, #2
	orrs r0, r1
	b _080A6E94
_080A6E8E:
	ldrb r1, [r3]
	movs r0, #0xfd
_080A6E92:
	ands r0, r1
_080A6E94:
	strb r0, [r3]
_080A6E96:
	adds r4, #1
	adds r5, #1
	cmp r5, #1
	ble _080A6E44
	adds r0, r7, #0
	cmp r0, #0x1c
	ble _080A6E38
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80A6E24

	THUMB_FUNC_START sub_80A6EB0
sub_80A6EB0: @ 0x080A6EB0
	push {r4, r5, r6, r7, lr}
	adds r2, r0, #0
	adds r4, r1, #0
	movs r1, #0
	adds r0, r4, #3
_080A6EBA:
	strb r1, [r0]
	subs r0, #1
	cmp r0, r4
	bge _080A6EBA
	movs r3, #0
	adds r0, r2, #0
	adds r0, #0xc4
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r3, r0
	bge _080A6F04
	adds r6, r2, #0
	adds r6, #0xa4
	movs r1, #7
	mov ip, r1
	adds r5, r0, #0
	movs r7, #1
_080A6EDE:
	adds r0, r6, r3
	movs r2, #0
	ldrsb r2, [r0, r2]
	adds r0, r2, #0
	cmp r2, #0
	bge _080A6EEC
	adds r0, r2, #7
_080A6EEC:
	asrs r0, r0, #3
	adds r0, r4, r0
	mov r1, ip
	ands r2, r1
	adds r1, r7, #0
	lsls r1, r2
	ldrb r2, [r0]
	orrs r1, r2
	strb r1, [r0]
	adds r3, #1
	cmp r3, r5
	blt _080A6EDE
_080A6F04:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80A6EB0

	THUMB_FUNC_START sub_80A6F0C
sub_80A6F0C: @ 0x080A6F0C
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	adds r1, r5, #0
	adds r1, #0xc4
	movs r0, #0
	strb r0, [r1]
	movs r4, #0
_080A6F1C:
	adds r0, r4, #0
	cmp r4, #0
	bge _080A6F24
	adds r0, r4, #7
_080A6F24:
	asrs r0, r0, #3
	adds r0, r6, r0
	ldrb r1, [r0]
	movs r0, #7
	ands r0, r4
	asrs r1, r0
	movs r0, #1
	ands r1, r0
	cmp r1, #0
	beq _080A6F44
	adds r0, r5, #0
	adds r1, r5, #0
	adds r1, #0xa4
	adds r2, r4, #0
	bl SetupNewWMRoute
_080A6F44:
	adds r4, #1
	cmp r4, #0x1f
	ble _080A6F1C
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80A6F0C

	THUMB_FUNC_START sub_80A6F50
sub_80A6F50: @ 0x080A6F50
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	movs r2, #1
	mov r8, r2
	movs r2, #1
	mov ip, r2
	adds r6, r1, #0
	adds r4, r0, #0
	adds r4, #0x10
	movs r7, #6
_080A6F66:
	ldrb r2, [r4]
	mov r3, ip
	ands r3, r2
	movs r0, #2
	negs r0, r0
	ands r0, r5
	orrs r3, r0
	ldrb r1, [r4, #1]
	movs r0, #0x3f
	ands r1, r0
	lsls r1, r1, #1
	subs r0, #0xbe
	ands r0, r3
	orrs r1, r0
	lsrs r2, r2, #1
	mov r0, r8
	ands r2, r0
	mov r0, ip
	ands r2, r0
	lsls r2, r2, #7
	movs r0, #0x81
	negs r0, r0
	ands r0, r1
	orrs r2, r0
	ldrb r1, [r4, #2]
	lsls r1, r1, #8
	ldr r0, _080A6FB8  @ 0xFFFF00FF
	ands r0, r2
	orrs r1, r0
	adds r5, r1, #0
	strh r5, [r6]
	adds r6, #2
	adds r4, #4
	subs r7, #1
	cmp r7, #0
	bge _080A6F66
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A6FB8: .4byte 0xFFFF00FF

	THUMB_FUNC_END sub_80A6F50

	THUMB_FUNC_START sub_80A6FBC
sub_80A6FBC: @ 0x080A6FBC
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	mov r4, sp
	movs r7, #1
	adds r3, r0, #0
	adds r5, r1, #0
	movs r6, #6
_080A6FCA:
	ldrh r2, [r5]
	ldr r1, _080A6FE8  @ 0xFFFF0000
	ldr r0, [sp]
	ands r0, r1
	orrs r0, r2
	str r0, [sp]
	ldrb r1, [r4]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080A6FEC
	ldrb r0, [r3, #0x10]
	orrs r0, r7
	b _080A6FF2
	.align 2, 0
_080A6FE8: .4byte 0xFFFF0000
_080A6FEC:
	ldrb r1, [r3, #0x10]
	movs r0, #0xfe
	ands r0, r1
_080A6FF2:
	strb r0, [r3, #0x10]
	ldr r0, [sp]
	lsls r0, r0, #0x19
	lsrs r0, r0, #0x1a
	movs r2, #0
	strb r0, [r3, #0x11]
	ldrb r1, [r4]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _080A7014
	ldrb r0, [r4, #1]
	strh r0, [r3, #0x12]
	ldrb r0, [r3, #0x10]
	movs r1, #2
	orrs r0, r1
	b _080A701E
_080A7014:
	ldrb r0, [r4, #1]
	strh r0, [r3, #0x12]
	ldrb r1, [r3, #0x10]
	movs r0, #0xfd
	ands r0, r1
_080A701E:
	strb r0, [r3, #0x10]
	adds r3, #4
	adds r5, #2
	subs r6, #1
	cmp r6, #0
	bge _080A6FCA
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80A6FBC

	THUMB_FUNC_START sub_80A7034
sub_80A7034: @ 0x080A7034
	push {r4, lr}
	adds r4, r1, #0
	movs r2, #0
	adds r3, r0, #0
	adds r3, #0xc9
_080A703E:
	adds r0, r4, r2
	adds r1, r3, r2
	ldrb r1, [r1]
	strb r1, [r0]
	adds r2, #1
	cmp r2, #2
	ble _080A703E
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80A7034

	THUMB_FUNC_START sub_80A7054
sub_80A7054: @ 0x080A7054
	push {r4, lr}
	adds r4, r1, #0
	movs r2, #0
	adds r3, r0, #0
	adds r3, #0xc9
_080A705E:
	adds r0, r3, r2
	adds r1, r4, r2
	ldrb r1, [r1]
	strb r1, [r0]
	adds r2, #1
	cmp r2, #2
	ble _080A705E
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80A7054

	THUMB_FUNC_START sub_80A7074
sub_80A7074: @ 0x080A7074
	push {r4, lr}
	sub sp, #0x28
	adds r4, r0, #0
	add r0, sp, #0x24
	movs r1, #0
	strh r1, [r0]
	ldr r2, _080A70AC  @ 0x01000012
	mov r1, sp
	bl CpuSet
	mov r2, sp
	ldrb r0, [r2, #0x1c]
	movs r1, #2
	orrs r0, r1
	strb r0, [r2, #0x1c]
	movs r1, #0xc
	orrs r0, r1
	strb r0, [r2, #0x1c]
	mov r0, sp
	adds r1, r4, #0
	movs r2, #0x24
	bl WriteAndVerifySramFast
	add sp, #0x28
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A70AC: .4byte 0x01000012

	THUMB_FUNC_END sub_80A7074

	THUMB_FUNC_START SaveWMStuff
SaveWMStuff: @ 0x080A70B0
	push {r4, r5, r6, lr}
	sub sp, #0x24
	adds r6, r0, #0
	adds r4, r1, #0
	adds r0, r4, #0
	mov r1, sp
	bl sub_80A6DA0
	add r1, sp, #8
	adds r0, r4, #0
	bl sub_80A6EB0
	add r1, sp, #0xc
	adds r0, r4, #0
	bl sub_80A6F50
	mov r1, sp
	adds r1, #0x1d
	adds r0, r4, #0
	bl sub_80A7034
	adds r0, r4, #0
	adds r0, #0xcc
	ldrb r1, [r0]
	add r0, sp, #0x20
	strb r1, [r0]
	mov r1, sp
	ldrh r0, [r4, #2]
	strb r0, [r1, #0x1a]
	ldrh r0, [r4, #4]
	strb r0, [r1, #0x1b]
	mov r5, sp
	ldrb r3, [r4]
	lsls r0, r3, #0x1e
	lsrs r0, r0, #0x1f
	ldrb r1, [r5, #0x1c]
	movs r2, #2
	negs r2, r2
	ands r2, r1
	orrs r2, r0
	strb r2, [r5, #0x1c]
	mov r4, sp
	lsls r1, r3, #0x1d
	lsrs r1, r1, #0x1f
	lsls r1, r1, #1
	movs r0, #3
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r4, #0x1c]
	mov r2, sp
	lsls r3, r3, #0x1a
	lsrs r3, r3, #0x1e
	lsls r3, r3, #2
	movs r1, #0xd
	negs r1, r1
	ands r0, r1
	orrs r0, r3
	strb r0, [r2, #0x1c]
	mov r0, sp
	adds r1, r6, #0
	movs r2, #0x24
	bl WriteAndVerifySramFast
	add sp, #0x24
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END SaveWMStuff

	THUMB_FUNC_START LoadWMStuff
LoadWMStuff: @ 0x080A7138
	push {r4, lr}
	sub sp, #0x24
	adds r4, r1, #0
	ldr r1, _080A718C  @ ReadSramFast
	ldr r3, [r1]
	mov r1, sp
	movs r2, #0x24
	bl _call_via_r3
	adds r0, r4, #0
	mov r1, sp
	bl sub_80A6E24
	add r1, sp, #8
	adds r0, r4, #0
	bl sub_80A6F0C
	add r1, sp, #0xc
	adds r0, r4, #0
	bl sub_80A6FBC
	mov r1, sp
	adds r1, #0x1d
	adds r0, r4, #0
	bl sub_80A7054
	add r0, sp, #0x20
	ldrb r1, [r0]
	adds r0, r4, #0
	adds r0, #0xcc
	strb r1, [r0]
	mov r0, sp
	ldrb r1, [r0, #0x1c]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080A7190
	ldrb r0, [r4]
	movs r1, #2
	orrs r0, r1
	b _080A7198
	.align 2, 0
_080A718C: .4byte ReadSramFast
_080A7190:
	ldrb r1, [r4]
	movs r0, #3
	negs r0, r0
	ands r0, r1
_080A7198:
	strb r0, [r4]
	mov r0, sp
	ldrb r1, [r0, #0x1c]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080A71AE
	ldrb r0, [r4]
	movs r1, #4
	orrs r0, r1
	b _080A71B6
_080A71AE:
	ldrb r1, [r4]
	movs r0, #5
	negs r0, r0
	ands r0, r1
_080A71B6:
	strb r0, [r4]
	mov r0, sp
	ldrb r1, [r0, #0x1c]
	lsls r1, r1, #0x1c
	lsrs r1, r1, #0x1e
	lsls r1, r1, #4
	ldrb r2, [r4]
	movs r0, #0x31
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r4]
	mov r0, sp
	ldrb r0, [r0, #0x1a]
	strh r0, [r4, #2]
	mov r0, sp
	ldrb r0, [r0, #0x1b]
	strh r0, [r4, #4]
	add sp, #0x24
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END LoadWMStuff

	THUMB_FUNC_START sub_80A71E4
sub_80A71E4: @ 0x080A71E4
	push {lr}
	adds r1, r0, #0
	ldr r0, _080A71F4  @ gGMData
	bl sub_80BD260
	pop {r0}
	bx r0
	.align 2, 0
_080A71F4: .4byte gGMData

	THUMB_FUNC_END sub_80A71E4

	THUMB_FUNC_START sub_80A71F8
sub_80A71F8: @ 0x080A71F8
	push {lr}
	adds r1, r0, #0
	ldr r0, _080A7208  @ gGMData
	bl sub_80BD270
	pop {r0}
	bx r0
	.align 2, 0
_080A7208: .4byte gGMData

	THUMB_FUNC_END sub_80A71F8

	THUMB_FUNC_START sub_80A720C
sub_80A720C: @ 0x080A720C
	push {r4, lr}
	adds r4, r1, #0
	ldr r2, _080A722C  @ 0x04000019
	bl CpuSet
	ldr r1, _080A7230  @ gUnknown_08205D7C
	adds r0, r4, #0
	bl CopyString
	ldr r0, _080A7234  @ 0x00040624
	str r0, [r4, #8]
	ldr r0, _080A7238  @ 0x0000200A
	strh r0, [r4, #0xc]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A722C: .4byte 0x04000019
_080A7230: .4byte gUnknown_08205D7C
_080A7234: .4byte 0x00040624
_080A7238: .4byte 0x0000200A

	THUMB_FUNC_END sub_80A720C

	THUMB_FUNC_START sub_80A723C
sub_80A723C: @ 0x080A723C
	push {r4, r5, lr}
	adds r2, r1, #0
	ldm r0!, {r3, r4, r5}
	stm r2!, {r3, r4, r5}
	ldr r0, [r0]
	str r0, [r2]
	ldr r0, _080A7254  @ 0x00040624
	str r0, [r1]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A7254: .4byte 0x00040624

	THUMB_FUNC_END sub_80A723C

	THUMB_FUNC_START sub_80A7258
sub_80A7258: @ 0x080A7258
	push {r4, lr}
	adds r2, r0, #0
	adds r4, r1, #0
	adds r0, r4, #0
	adds r1, r2, #0
	movs r2, #0x4c
	bl memcpy
	ldrb r1, [r4, #0xe]
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	cmp r0, #4
	ble _080A7276
	adds r0, r1, #1
	strb r0, [r4, #0xe]
_080A7276:
	ldrb r1, [r4, #0xe]
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	cmp r0, #0x15
	ble _080A7284
	adds r0, r1, #1
	strb r0, [r4, #0xe]
_080A7284:
	ldrb r1, [r4, #0xe]
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	cmp r0, #0x22
	ble _080A7292
	adds r0, r1, #1
	strb r0, [r4, #0xe]
_080A7292:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80A7258

	THUMB_FUNC_START sub_80A7298
sub_80A7298: @ 0x080A7298
	push {r4, lr}
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldr r2, [r0]
	str r2, [r1]
	ldrb r0, [r0, #4]
	strb r0, [r1, #4]
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80A7298

	THUMB_FUNC_START sub_80A72B0
sub_80A72B0: @ 0x080A72B0
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r0, r5, #0
	adds r0, #0x4c
	adds r1, r4, #0
	adds r1, #0x58
	ldr r2, _080A72E4  @ 0x00001EC4
	bl memcpy
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_80A7258
	ldr r0, _080A72E8  @ 0x00001F1C
	adds r4, r4, r0
	adds r0, #0x28
	adds r5, r5, r0
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_80A7298
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A72E4: .4byte 0x00001EC4
_080A72E8: .4byte 0x00001F1C

	THUMB_FUNC_END sub_80A72B0

	THUMB_FUNC_START sub_80A72EC
sub_80A72EC: @ 0x080A72EC
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r0, r5, #0
	adds r0, #0x4c
	adds r1, r4, #0
	adds r1, #0x58
	ldr r2, _080A7320  @ 0x00000D1C
	bl memcpy
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_80A7258
	ldr r0, _080A7324  @ 0x00000D74
	adds r4, r4, r0
	adds r0, #0x18
	adds r5, r5, r0
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_80A7298
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A7320: .4byte 0x00000D1C
_080A7324: .4byte 0x00000D74

	THUMB_FUNC_END sub_80A72EC

	THUMB_FUNC_START sub_80A7328
sub_80A7328: @ 0x080A7328
	push {lr}
	adds r3, r0, #0
	adds r0, r1, #0
	movs r2, #0xa2
	lsls r2, r2, #1
	adds r1, r3, #0
	bl memcpy
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80A7328

	THUMB_FUNC_START sub_80A733C
sub_80A733C: @ 0x080A733C
	push {r4, lr}
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldm r0!, {r2, r3}
	stm r1!, {r2, r3}
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80A733C

	THUMB_FUNC_START sub_80A734C
sub_80A734C: @ 0x080A734C
	push {r4, lr}
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80A734C

	THUMB_FUNC_START sub_80A7360
sub_80A7360: @ 0x080A7360
	push {lr}
	adds r2, r0, #0
	adds r0, r1, #0
	adds r1, r2, #0
	movs r2, #0x94
	bl memcpy
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80A7360

	THUMB_FUNC_START sub_80A7374
sub_80A7374: @ 0x080A7374
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x34
	ldr r4, _080A751C  @ gUnknown_02000000
	movs r0, #0xe0
	lsls r0, r0, #0x14
	mov r9, r0
	ldr r5, _080A7520  @ ReadSramFast
	ldr r3, [r5]
	adds r1, r4, #0
	movs r2, #0x64
	bl _call_via_r3
	ldr r1, [r4, #8]
	ldr r0, _080A7524  @ 0x00040624
	cmp r1, r0
	bne _080A739E
	b _080A750C
_080A739E:
	mov r8, r4
	movs r2, #0x80
	lsls r2, r2, #8
	ldr r3, [r5]
	mov r0, r9
	mov r1, r8
	bl _call_via_r3
	mov r0, r8
	ldr r1, [r0, #8]
	ldr r0, _080A7528  @ 0x00040603
	cmp r1, r0
	beq _080A73BA
	b _080A750C
_080A73BA:
	movs r0, #0
	str r0, [sp]
	movs r4, #0x80
	lsls r4, r4, #8
	add r4, r8
	ldr r2, _080A752C  @ 0x01000019
	mov r0, sp
	adds r1, r4, #0
	bl CpuFastSet
	mov r0, r8
	adds r1, r4, #0
	bl sub_80A720C
	adds r0, r4, #0
	bl SaveGeneralGameMetadata
	movs r5, #0
	add r7, sp, #4
	add r1, sp, #8
	mov sl, r1
	mov r0, sp
	adds r0, #0xc
	str r0, [sp, #0x20]
	mov r1, sp
	adds r1, #0x10
	str r1, [sp, #0x24]
	adds r0, #8
	str r0, [sp, #0x28]
	adds r1, #8
	str r1, [sp, #0x2c]
	adds r0, #8
	str r0, [sp, #0x30]
	mov r6, r9
	adds r6, #0xd4
_080A7400:
	movs r0, #0
	str r0, [sp, #4]
	adds r0, r7, #0
	adds r1, r4, #0
	ldr r2, _080A7530  @ 0x010007DE
	bl CpuFastSet
	ldr r0, _080A7534  @ 0x00001F58
	muls r0, r5, r0
	adds r0, #0xd4
	add r0, r8
	adds r1, r4, #0
	bl sub_80A72B0
	adds r0, r4, #0
	adds r1, r6, #0
	ldr r2, _080A7538  @ 0x00001F78
	bl WriteAndVerifySramFast
	ldr r1, _080A7538  @ 0x00001F78
	adds r6, r6, r1
	adds r5, #1
	cmp r5, #1
	ble _080A7400
	movs r5, #0
	ldr r6, _080A753C  @ gUnknown_02008000
	ldr r0, _080A7540  @ 0x00003FC4
	mov r1, r9
	adds r4, r1, r0
_080A743A:
	movs r7, #0
	str r7, [sp, #8]
	mov r0, sl
	adds r1, r6, #0
	ldr r2, _080A7544  @ 0x01000372
	bl CpuFastSet
	ldr r0, _080A7548  @ 0x00000DA4
	muls r0, r5, r0
	ldr r1, _080A754C  @ 0x00003F84
	adds r0, r0, r1
	add r0, r8
	adds r1, r6, #0
	bl sub_80A72EC
	adds r0, r6, #0
	adds r1, r4, #0
	ldr r2, _080A7550  @ 0x00000DC8
	bl WriteAndVerifySramFast
	ldr r0, _080A7550  @ 0x00000DC8
	adds r4, r4, r0
	adds r5, #1
	cmp r5, #2
	ble _080A743A
	str r7, [sp, #0xc]
	ldr r4, _080A753C  @ gUnknown_02008000
	ldr r2, _080A7554  @ 0x01000025
	ldr r0, [sp, #0x20]
	adds r1, r4, #0
	bl CpuFastSet
	ldr r0, _080A7558  @ 0x000070E4
	add r0, r8
	adds r1, r4, #0
	bl sub_80A7360
	adds r0, r4, #0
	bl SaveRankings
	str r7, [sp, #0x10]
	ldr r2, _080A755C  @ 0x01000009
	ldr r0, [sp, #0x24]
	adds r1, r4, #0
	bl CpuFastSet
	ldr r0, _080A7560  @ 0x00007178
	add r0, r8
	adds r1, r4, #0
	bl sub_80A734C
	adds r0, r4, #0
	bl sub_80A3EA4
	str r7, [sp, #0x14]
	ldr r2, _080A7564  @ 0x01000005
	ldr r0, [sp, #0x28]
	adds r1, r4, #0
	bl CpuFastSet
	ldr r0, _080A7568  @ 0x0000719C
	add r0, r8
	adds r1, r4, #0
	bl sub_80A733C
	adds r0, r4, #0
	bl sub_80A4000
	str r7, [sp, #0x18]
	ldr r2, _080A756C  @ 0x01000051
	ldr r0, [sp, #0x2c]
	adds r1, r4, #0
	bl CpuFastSet
	ldr r0, _080A7570  @ 0x000071B0
	add r0, r8
	adds r1, r4, #0
	bl sub_80A7328
	adds r0, r4, #0
	bl SaveBonusContentData
	movs r5, #0
	adds r6, r4, #0
	mov r4, r8
	adds r4, #0x64
_080A74E6:
	movs r0, #0
	str r0, [sp, #0x1c]
	ldr r0, [sp, #0x30]
	adds r1, r6, #0
	ldr r2, _080A7574  @ 0x01000004
	bl CpuFastSet
	adds r0, r4, #0
	adds r1, r6, #0
	bl sub_80A723C
	adds r0, r6, #0
	adds r1, r5, #0
	bl SaveMetadata_Save
	adds r4, #0x10
	adds r5, #1
	cmp r5, #6
	ble _080A74E6
_080A750C:
	add sp, #0x34
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A751C: .4byte gUnknown_02000000
_080A7520: .4byte ReadSramFast
_080A7524: .4byte 0x00040624
_080A7528: .4byte 0x00040603
_080A752C: .4byte 0x01000019
_080A7530: .4byte 0x010007DE
_080A7534: .4byte 0x00001F58
_080A7538: .4byte 0x00001F78
_080A753C: .4byte gUnknown_02008000
_080A7540: .4byte 0x00003FC4
_080A7544: .4byte 0x01000372
_080A7548: .4byte 0x00000DA4
_080A754C: .4byte 0x00003F84
_080A7550: .4byte 0x00000DC8
_080A7554: .4byte 0x01000025
_080A7558: .4byte 0x000070E4
_080A755C: .4byte 0x01000009
_080A7560: .4byte 0x00007178
_080A7564: .4byte 0x01000005
_080A7568: .4byte 0x0000719C
_080A756C: .4byte 0x01000051
_080A7570: .4byte 0x000071B0
_080A7574: .4byte 0x01000004

	THUMB_FUNC_END sub_80A7374
.align 2, 0
