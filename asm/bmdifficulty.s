	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	@ Difficulty mode stuff and also tower/ruins stuff
	@ May have been separate files

	THUMB_FUNC_START GetCurrentPromotedLevelBonus
GetCurrentPromotedLevelBonus: @ 0x08037B44
	push {lr}
	ldr r0, _08037B58  @ gRAMChapterData
	ldrb r1, [r0, #0x14]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	bne _08037B5C
	movs r0, #9
	b _08037B5E
	.align 2, 0
_08037B58: .4byte gRAMChapterData
_08037B5C:
	movs r0, #0x13
_08037B5E:
	pop {r1}
	bx r1

	THUMB_FUNC_END GetCurrentPromotedLevelBonus

	THUMB_FUNC_START CanUnitSeize
CanUnitSeize: @ 0x08037B64
	push {lr}
	adds r3, r0, #0
	ldr r0, _08037B7C  @ gRAMChapterData
	ldrb r1, [r0, #0x1b]
	cmp r1, #2
	beq _08037B86
	cmp r1, #2
	bgt _08037B80
	cmp r1, #1
	beq _08037B86
	b _08037B8C
	.align 2, 0
_08037B7C: .4byte gRAMChapterData
_08037B80:
	cmp r1, #3
	beq _08037B8A
	b _08037B8C
_08037B86:
	movs r2, #1
	b _08037B8C
_08037B8A:
	movs r2, #0xf
_08037B8C:
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #5
	bne _08037B98
	movs r2, #0xf
_08037B98:
	movs r1, #0
	ldr r0, [r3]
	ldrb r0, [r0, #4]
	cmp r0, r2
	bne _08037BA4
	movs r1, #1
_08037BA4:
	adds r0, r1, #0
	pop {r1}
	bx r1

	THUMB_FUNC_END CanUnitSeize

	THUMB_FUNC_START sub_8037BAC
sub_8037BAC: @ 0x08037BAC
	push {r4, r5, r6, r7, lr}
	movs r5, #0
	ldr r0, _08037C34  @ gUnknown_020038C8
	mov ip, r0
	movs r6, #0
	ldr r0, _08037C38  @ 0x0000FFFF
	adds r7, r0, #0
_08037BBA:
	movs r4, #0
	adds r3, r6, #0
_08037BBE:
	mov r0, ip
	adds r1, r3, r0
	movs r2, #7
_08037BC4:
	ldrh r0, [r1]
	orrs r0, r7
	strh r0, [r1]
	adds r1, #8
	subs r2, #1
	cmp r2, #0
	bge _08037BC4
	adds r3, #0x40
	adds r4, #1
	cmp r4, #3
	ble _08037BBE
	movs r0, #0xa0
	lsls r0, r0, #1
	adds r6, r6, r0
	adds r5, #1
	cmp r5, #1
	ble _08037BBA
	movs r5, #0
	ldr r0, _08037C34  @ gUnknown_020038C8
	mov ip, r0
	movs r3, #0
	movs r7, #0x80
	lsls r7, r7, #1
	ldr r0, _08037C38  @ 0x0000FFFF
	adds r6, r0, #0
_08037BF6:
	mov r0, ip
	adds r2, r3, r0
	movs r4, #7
_08037BFC:
	adds r1, r2, r7
	ldrh r0, [r1]
	orrs r0, r6
	strh r0, [r1]
	adds r2, #8
	subs r4, #1
	cmp r4, #0
	bge _08037BFC
	movs r0, #0xa0
	lsls r0, r0, #1
	adds r3, r3, r0
	adds r5, #1
	cmp r5, #1
	ble _08037BF6
	ldr r0, _08037C38  @ 0x0000FFFF
	adds r2, r0, #0
	ldr r1, _08037C3C  @ gUnknown_02003B48
	movs r5, #7
_08037C20:
	ldrh r0, [r1]
	orrs r0, r2
	strh r0, [r1]
	adds r1, #8
	subs r5, #1
	cmp r5, #0
	bge _08037C20
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08037C34: .4byte gUnknown_020038C8
_08037C38: .4byte 0x0000FFFF
_08037C3C: .4byte gUnknown_02003B48

	THUMB_FUNC_END sub_8037BAC

	THUMB_FUNC_START sub_8037C40
sub_8037C40: @ 0x08037C40
	ldr r1, _08037C90  @ gUnknown_030017A0
	adds r2, r1, #0
	adds r2, #0x24
	movs r3, #0
	strb r0, [r2]
	movs r0, #0
	strh r3, [r1]
	strb r0, [r1, #2]
	strb r0, [r1, #3]
	ldrb r2, [r1, #4]
	movs r0, #2
	negs r0, r0
	ands r0, r2
	strb r0, [r1, #4]
	ldrh r2, [r1, #6]
	movs r0, #7
	ands r0, r2
	strh r0, [r1, #6]
	ldrb r2, [r1, #8]
	movs r0, #8
	negs r0, r0
	ands r0, r2
	strb r0, [r1, #8]
	ldrh r2, [r1, #8]
	ldr r0, _08037C94  @ 0xFFFFFC07
	ands r0, r2
	strh r0, [r1, #8]
	ldr r0, [r1, #8]
	ldr r2, _08037C98  @ 0xFFF003FF
	ands r0, r2
	str r0, [r1, #8]
	ldrb r2, [r1, #0xa]
	movs r0, #0xf
	ands r0, r2
	strb r0, [r1, #0xa]
	ldr r0, [r1, #4]
	ldr r2, _08037C9C  @ 0xFFF80001
	ands r0, r2
	str r0, [r1, #4]
	bx lr
	.align 2, 0
_08037C90: .4byte gUnknown_030017A0
_08037C94: .4byte 0xFFFFFC07
_08037C98: .4byte 0xFFF003FF
_08037C9C: .4byte 0xFFF80001

	THUMB_FUNC_END sub_8037C40

	THUMB_FUNC_START sub_8037CA0
sub_8037CA0: @ 0x08037CA0
	push {r4, lr}
	ldr r4, _08037CF0  @ gUnknown_030017A0
	adds r0, r4, #0
	bl sub_8037EB0
	ldr r0, _08037CF4  @ gRAMChapterData
	ldrb r1, [r0, #0x14]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _08037CEA
	adds r0, r4, #0
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0
	bne _08037CD0
	ldr r0, [r4, #8]
	lsls r0, r0, #0xc
	lsrs r0, r0, #0x16
	cmp r0, #0xc7
	ble _08037CD0
	movs r0, #0x6b
	bl SetEventId
_08037CD0:
	ldr r0, _08037CF0  @ gUnknown_030017A0
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #1
	bne _08037CEA
	ldr r0, [r4, #8]
	lsls r0, r0, #0xc
	lsrs r0, r0, #0x16
	cmp r0, #0xc7
	ble _08037CEA
	movs r0, #0x6c
	bl SetEventId
_08037CEA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08037CF0: .4byte gUnknown_030017A0
_08037CF4: .4byte gRAMChapterData

	THUMB_FUNC_END sub_8037CA0

	THUMB_FUNC_START sub_8037CF8
sub_8037CF8: @ 0x08037CF8
	push {r4, lr}
	bl sub_8037CA0
	bl sub_8037FCC
	ldr r0, _08037D50  @ gRAMChapterData
	ldrb r1, [r0, #0x14]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _08037D4A
	ldr r1, _08037D54  @ gUnknown_030017A0
	adds r0, r1, #0
	adds r0, #0x24
	ldrb r2, [r0]
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r1, #0xc
	adds r4, r0, r1
	cmp r2, #0
	bne _08037D32
	ldrb r0, [r4, #0xa]
	lsrs r0, r0, #4
	cmp r0, #2
	ble _08037D32
	movs r0, #0x6f
	bl SetEventId
_08037D32:
	ldr r0, _08037D54  @ gUnknown_030017A0
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #1
	bne _08037D4A
	ldrb r0, [r4, #0xa]
	lsrs r0, r0, #4
	cmp r0, #2
	ble _08037D4A
	movs r0, #0x70
	bl SetEventId
_08037D4A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08037D50: .4byte gRAMChapterData
_08037D54: .4byte gUnknown_030017A0

	THUMB_FUNC_END sub_8037CF8

	THUMB_FUNC_START sub_8037D58
sub_8037D58: @ 0x08037D58
	push {lr}
	bl sub_8037CA0
	bl sub_8038134
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8037D58

	THUMB_FUNC_START sub_8037D68
sub_8037D68: @ 0x08037D68
	push {r4, r5, r6, lr}
	sub sp, #0x58
	adds r6, r0, #0
	ldr r1, _08037D88  @ gUnknown_080D8018
	mov r0, sp
	movs r2, #0x58
	bl memcpy
	ldr r0, _08037D8C  @ gRAMChapterData
	ldrb r1, [r0, #0x14]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	bne _08037D94
	b _08037DD2
	.align 2, 0
_08037D88: .4byte gUnknown_080D8018
_08037D8C: .4byte gRAMChapterData
_08037D90:
	movs r0, #1
	b _08037DD4
_08037D94:
	movs r5, #0
	mov r0, sp
	b _08037DCC
_08037D9A:
	lsls r4, r5, #3
	mov r1, sp
	adds r0, r1, r4
	ldrh r0, [r0]
	bl CheckEventId
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _08037DC2
	add r0, sp, #4
	adds r0, r0, r4
	ldr r1, [r0]
	adds r0, r6, #0
	bl sub_8037DDC
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq _08037D90
_08037DC2:
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r0, r5, #3
	add r0, sp
_08037DCC:
	ldrh r0, [r0]
	cmp r0, #0
	bne _08037D9A
_08037DD2:
	movs r0, #0
_08037DD4:
	add sp, #0x58
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8037D68

	THUMB_FUNC_START sub_8037DDC
sub_8037DDC: @ 0x08037DDC
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	ldrb r0, [r4]
	movs r1, #0
	bl GetUnitFromCharIdAndFaction
	cmp r0, #0
	beq _08037DF2
	movs r0, #0
	b _08037E02
_08037DF2:
	adds r0, r4, #0
	bl LoadUnit
	ldrb r1, [r4]
	adds r0, r5, #0
	bl sub_8011728
	movs r0, #1
_08037E02:
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8037DDC

	THUMB_FUNC_START sub_8037E08
sub_8037E08: @ 0x08037E08
	push {r4, r5, lr}
	ldr r3, _08037E2C  @ gUnknown_030017A0
	adds r1, r3, #0
	ldm r1!, {r2, r4, r5}
	stm r0!, {r2, r4, r5}
	adds r0, r3, #0
	adds r0, #0x24
	ldrb r1, [r0]
	lsls r1, r1, #4
	ldrb r2, [r3, #0xb]
	movs r0, #0xf
	ands r0, r2
	orrs r0, r1
	strb r0, [r3, #0xb]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08037E2C: .4byte gUnknown_030017A0

	THUMB_FUNC_END sub_8037E08

	THUMB_FUNC_START sub_8037E30
sub_8037E30: @ 0x08037E30
	push {r4, r5, lr}
	ldr r2, _08037E48  @ gUnknown_030017A0
	adds r1, r2, #0
	ldm r0!, {r3, r4, r5}
	stm r1!, {r3, r4, r5}
	ldrb r0, [r2, #0xb]
	lsrs r0, r0, #4
	adds r2, #0x24
	strb r0, [r2]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08037E48: .4byte gUnknown_030017A0

	THUMB_FUNC_END sub_8037E30

	THUMB_FUNC_START sub_8037E4C
sub_8037E4C: @ 0x08037E4C
	push {r4, lr}
	ldr r1, _08037E60  @ gUnknown_030017AC
	ldm r1!, {r2, r3, r4}
	stm r0!, {r2, r3, r4}
	ldm r1!, {r2, r3, r4}
	stm r0!, {r2, r3, r4}
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08037E60: .4byte gUnknown_030017AC

	THUMB_FUNC_END sub_8037E4C

	THUMB_FUNC_START sub_8037E64
sub_8037E64: @ 0x08037E64
	push {r4, lr}
	ldr r1, _08037E78  @ gUnknown_030017AC
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08037E78: .4byte gUnknown_030017AC

	THUMB_FUNC_END sub_8037E64

	THUMB_FUNC_START sub_8037E7C
sub_8037E7C: @ 0x08037E7C
	push {r4, lr}
	ldr r0, [r0, #4]
	lsls r0, r0, #0xd
	lsrs r4, r0, #0xe
	bl GetGameClock
	ldr r1, _08037EA8  @ gRAMChapterData
	ldr r1, [r1, #4]
	subs r0, r0, r1
	movs r1, #0x3c
	bl Div
	adds r4, r4, r0
	ldr r0, _08037EAC  @ 0x00034BC0
	cmp r4, r0
	ble _08037E9E
	adds r4, r0, #0
_08037E9E:
	adds r0, r4, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08037EA8: .4byte gRAMChapterData
_08037EAC: .4byte 0x00034BC0

	THUMB_FUNC_END sub_8037E7C

	THUMB_FUNC_START sub_8037EB0
sub_8037EB0: @ 0x08037EB0
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	ldrh r4, [r6]
	bl sub_80A49A4
	ldr r1, _08037FAC  @ gRAMChapterData
	ldr r1, [r1, #0x38]
	lsls r1, r1, #4
	lsrs r1, r1, #0xc
	subs r0, r0, r1
	adds r4, r4, r0
	ldr r0, _08037FB0  @ 0x0000C350
	cmp r4, r0
	ble _08037ECE
	adds r4, r0, #0
_08037ECE:
	strh r4, [r6]
	ldrb r4, [r6, #2]
	movs r5, #1
_08037ED4:
	adds r0, r5, #0
	bl GetUnit
	adds r1, r0, #0
	cmp r1, #0
	beq _08037EF2
	ldr r0, [r1]
	cmp r0, #0
	beq _08037EF2
	ldr r0, [r1, #0xc]
	ldr r1, _08037FB4  @ 0x0001000C
	ands r0, r1
	cmp r0, #0
	bne _08037EF2
	adds r4, #1
_08037EF2:
	adds r5, #1
	cmp r5, #0x3f
	ble _08037ED4
	strb r4, [r6, #2]
	ldrb r0, [r6, #3]
	ldrb r1, [r6, #4]
	movs r2, #1
	ands r1, r2
	lsls r4, r1, #8
	orrs r4, r0
	ldr r5, _08037FAC  @ gRAMChapterData
	ldrh r0, [r5, #0x10]
	adds r4, r4, r0
	movs r0, #0xfa
	lsls r0, r0, #1
	cmp r4, r0
	ble _08037F16
	adds r4, r0, #0
_08037F16:
	strb r4, [r6, #3]
	lsrs r1, r4, #8
	ands r1, r2
	ldrb r2, [r6, #4]
	movs r0, #2
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r6, #4]
	adds r0, r6, #0
	bl sub_8037E7C
	ldr r1, _08037FB8  @ 0x0003FFFF
	ands r1, r0
	lsls r1, r1, #1
	ldr r0, [r6, #4]
	ldr r2, _08037FBC  @ 0xFFF80001
	ands r0, r2
	orrs r0, r1
	str r0, [r6, #4]
	ldrh r3, [r6, #6]
	lsrs r1, r3, #3
	ldrb r0, [r6, #8]
	movs r2, #7
	ands r0, r2
	lsls r0, r0, #0xd
	adds r7, r5, #0
	adds r7, #0x48
	orrs r0, r1
	ldrh r1, [r7]
	adds r4, r0, r1
	ldr r0, _08037FB0  @ 0x0000C350
	cmp r4, r0
	ble _08037F5C
	adds r4, r0, #0
_08037F5C:
	ldr r1, _08037FC0  @ 0x00001FFF
	ands r1, r4
	lsls r1, r1, #3
	adds r0, r2, #0
	ands r0, r3
	orrs r0, r1
	strh r0, [r6, #6]
	lsrs r1, r4, #0xd
	ands r1, r2
	ldrb r2, [r6, #8]
	movs r0, #8
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r6, #8]
	ldrb r1, [r5, #0x14]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _08037FA6
	ldr r2, [r6, #8]
	lsls r0, r2, #0xc
	lsrs r0, r0, #0x16
	ldrh r7, [r7]
	adds r4, r0, r7
	movs r0, #0xfa
	lsls r0, r0, #2
	cmp r4, r0
	ble _08037F98
	adds r4, r0, #0
_08037F98:
	ldr r1, _08037FC4  @ 0x000003FF
	ands r1, r4
	lsls r1, r1, #0xa
	ldr r0, _08037FC8  @ 0xFFF003FF
	ands r0, r2
	orrs r0, r1
	str r0, [r6, #8]
_08037FA6:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08037FAC: .4byte gRAMChapterData
_08037FB0: .4byte 0x0000C350
_08037FB4: .4byte 0x0001000C
_08037FB8: .4byte 0x0003FFFF
_08037FBC: .4byte 0xFFF80001
_08037FC0: .4byte 0x00001FFF
_08037FC4: .4byte 0x000003FF
_08037FC8: .4byte 0xFFF003FF

	THUMB_FUNC_END sub_8037EB0

	THUMB_FUNC_START sub_8037FCC
sub_8037FCC: @ 0x08037FCC
	push {r4, r5, r6, lr}
	ldr r0, _08038054  @ gUnknown_030017A0
	mov ip, r0
	adds r0, #0x24
	ldrb r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	mov r1, ip
	adds r1, #0xc
	adds r3, r0, r1
	ldrh r0, [r3, #8]
	lsls r0, r0, #0x16
	lsrs r0, r0, #0x19
	cmp r0, #0
	ble _0803805C
	ldrh r0, [r3]
	mov r1, ip
	ldrh r1, [r1]
	cmp r0, r1
	bcs _08037FFC
	mov r2, ip
	ldrh r0, [r2]
	strh r0, [r3]
_08037FFC:
	mov r6, ip
	ldrb r0, [r6, #2]
	ldrb r1, [r3, #2]
	cmp r0, r1
	bcs _08038008
	strb r0, [r3, #2]
_08038008:
	mov r2, ip
	ldrb r1, [r2, #3]
	ldrb r0, [r2, #4]
	movs r4, #1
	ands r0, r4
	lsls r2, r0, #8
	orrs r2, r1
	ldrb r1, [r3, #3]
	ldrb r0, [r3, #4]
	ands r0, r4
	lsls r0, r0, #8
	orrs r0, r1
	cmp r2, r0
	bge _08038036
	strb r2, [r3, #3]
	lsrs r0, r2, #8
	ands r0, r4
	ldrb r2, [r3, #4]
	movs r1, #2
	negs r1, r1
	ands r1, r2
	orrs r1, r0
	strb r1, [r3, #4]
_08038036:
	mov r6, ip
	ldr r0, [r6, #4]
	lsls r0, r0, #0xd
	lsrs r1, r0, #0xe
	ldr r2, [r3, #4]
	lsls r0, r2, #0xd
	lsrs r0, r0, #0xe
	cmp r1, r0
	bge _08038096
	lsls r1, r1, #1
	ldr r0, _08038058  @ 0xFFF80001
	ands r0, r2
	orrs r0, r1
	b _08038094
	.align 2, 0
_08038054: .4byte gUnknown_030017A0
_08038058: .4byte 0xFFF80001
_0803805C:
	mov r1, ip
	ldrh r0, [r1]
	strh r0, [r3]
	ldrb r0, [r1, #2]
	strb r0, [r3, #2]
	ldrb r0, [r1, #3]
	ldrb r1, [r1, #4]
	movs r2, #1
	ands r1, r2
	lsls r1, r1, #8
	orrs r1, r0
	strb r0, [r3, #3]
	lsrs r1, r1, #8
	ands r1, r2
	ldrb r2, [r3, #4]
	movs r0, #2
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3, #4]
	mov r6, ip
	ldr r2, [r6, #4]
	ldr r0, _0803811C  @ 0x0007FFFE
	ands r2, r0
	ldr r0, [r3, #4]
	ldr r1, _08038120  @ 0xFFF80001
	ands r0, r1
	orrs r0, r2
_08038094:
	str r0, [r3, #4]
_08038096:
	ldrh r5, [r3, #6]
	lsrs r0, r5, #3
	ldrb r1, [r3, #8]
	movs r4, #7
	ands r1, r4
	lsls r1, r1, #0xd
	orrs r1, r0
	mov r0, ip
	ldrh r2, [r0, #6]
	lsrs r2, r2, #3
	ldrb r0, [r0, #8]
	ands r0, r4
	lsls r0, r0, #0xd
	orrs r0, r2
	adds r2, r1, r0
	ldr r0, _08038124  @ 0x0000C350
	cmp r2, r0
	ble _080380BC
	adds r2, r0, #0
_080380BC:
	ldr r1, _08038128  @ 0x00001FFF
	ands r1, r2
	lsls r1, r1, #3
	adds r0, r4, #0
	ands r0, r5
	orrs r0, r1
	strh r0, [r3, #6]
	lsrs r1, r2, #0xd
	ands r1, r4
	ldrb r2, [r3, #8]
	movs r0, #8
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3, #8]
	ldrh r2, [r3, #8]
	lsls r0, r2, #0x16
	lsrs r0, r0, #0x19
	cmp r0, #0x63
	bgt _080380F4
	adds r0, #1
	movs r1, #0x7f
	ands r0, r1
	lsls r0, r0, #3
	ldr r1, _0803812C  @ 0xFFFFFC07
	ands r1, r2
	orrs r1, r0
	strh r1, [r3, #8]
_080380F4:
	ldr r0, _08038130  @ gRAMChapterData
	ldrb r1, [r0, #0x14]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _08038114
	ldrb r2, [r3, #0xa]
	lsrs r1, r2, #4
	cmp r1, #9
	bgt _08038114
	adds r1, #1
	lsls r1, r1, #4
	movs r0, #0xf
	ands r0, r2
	orrs r0, r1
	strb r0, [r3, #0xa]
_08038114:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0803811C: .4byte 0x0007FFFE
_08038120: .4byte 0xFFF80001
_08038124: .4byte 0x0000C350
_08038128: .4byte 0x00001FFF
_0803812C: .4byte 0xFFFFFC07
_08038130: .4byte gRAMChapterData

	THUMB_FUNC_END sub_8037FCC

	THUMB_FUNC_START sub_8038134
sub_8038134: @ 0x08038134
	push {r4, r5, r6, lr}
	ldr r0, _080381C8  @ gUnknown_030017A0
	mov ip, r0
	adds r0, #0x24
	ldrb r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	mov r1, ip
	adds r1, #0xc
	adds r3, r0, r1
	ldrh r5, [r3, #6]
	lsrs r0, r5, #3
	ldrb r1, [r3, #8]
	movs r4, #7
	ands r1, r4
	lsls r1, r1, #0xd
	orrs r1, r0
	mov r6, ip
	ldrh r2, [r6, #6]
	lsrs r2, r2, #3
	ldrb r0, [r6, #8]
	ands r0, r4
	lsls r0, r0, #0xd
	orrs r0, r2
	adds r2, r1, r0
	ldr r0, _080381CC  @ 0x0000C350
	cmp r2, r0
	ble _08038170
	adds r2, r0, #0
_08038170:
	ldr r1, _080381D0  @ 0x00001FFF
	ands r1, r2
	lsls r1, r1, #3
	adds r0, r4, #0
	ands r0, r5
	orrs r0, r1
	strh r0, [r3, #6]
	lsrs r1, r2, #0xd
	ands r1, r4
	ldrb r2, [r3, #8]
	movs r0, #8
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3, #8]
	ldr r0, _080381D4  @ gRAMChapterData
	ldrb r1, [r0, #0x14]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _080381C2
	ldr r4, [r3, #8]
	lsls r1, r4, #0xc
	lsrs r1, r1, #0x16
	mov r2, ip
	ldr r0, [r2, #8]
	lsls r0, r0, #0xc
	lsrs r0, r0, #0x16
	adds r2, r1, r0
	movs r0, #0xfa
	lsls r0, r0, #2
	cmp r2, r0
	ble _080381B4
	adds r2, r0, #0
_080381B4:
	ldr r1, _080381D8  @ 0x000003FF
	ands r1, r2
	lsls r1, r1, #0xa
	ldr r0, _080381DC  @ 0xFFF003FF
	ands r0, r4
	orrs r0, r1
	str r0, [r3, #8]
_080381C2:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080381C8: .4byte gUnknown_030017A0
_080381CC: .4byte 0x0000C350
_080381D0: .4byte 0x00001FFF
_080381D4: .4byte gRAMChapterData
_080381D8: .4byte 0x000003FF
_080381DC: .4byte 0xFFF003FF

	THUMB_FUNC_END sub_8038134

	THUMB_FUNC_START sub_80381E0
sub_80381E0: @ 0x080381E0
	push {lr}
	adds r1, r0, #0
	ldr r0, _080381F0  @ gUnknown_0859E64C
	bl Proc_StartBlocking
	pop {r0}
	bx r0
	.align 2, 0
_080381F0: .4byte gUnknown_0859E64C

	THUMB_FUNC_END sub_80381E0

	THUMB_FUNC_START sub_80381F4
sub_80381F4: @ 0x080381F4
	push {lr}
	adds r1, r0, #0
	ldr r0, _08038204  @ gUnknown_0859E6EC
	bl Proc_StartBlocking
	pop {r0}
	bx r0
	.align 2, 0
_08038204: .4byte gUnknown_0859E6EC

	THUMB_FUNC_END sub_80381F4

	THUMB_FUNC_START PushGlobalTimer
PushGlobalTimer: @ 0x08038208
	push {lr}
	bl GetGameClock
	ldr r1, _08038218  @ gUnknown_020038C4
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_08038218: .4byte gUnknown_020038C4

	THUMB_FUNC_END PushGlobalTimer

	THUMB_FUNC_START PopGlobalTimer
PopGlobalTimer: @ 0x0803821C
	push {lr}
	ldr r0, _0803822C  @ gUnknown_020038C4
	ldr r0, [r0]
	bl SetGameClock
	pop {r0}
	bx r0
	.align 2, 0
_0803822C: .4byte gUnknown_020038C4

	THUMB_FUNC_END PopGlobalTimer

	THUMB_FUNC_START sub_8038230
sub_8038230: @ 0x08038230
	push {lr}
	movs r0, #0x40
	movs r1, #0
	bl Sound_PlaySong80024D4
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8038230

	THUMB_FUNC_START sub_8038240
sub_8038240: @ 0x08038240
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r7, r0, #0
	ldr r0, _080383F4  @ gUnknown_08A20050
	bl SetupBackgrounds
	ldr r0, _080383F8  @ gBG0TilemapBuffer
	movs r1, #0
	bl BG_Fill
	ldr r0, _080383FC  @ gBG1TilemapBuffer
	mov r8, r0
	movs r1, #0
	bl BG_Fill
	ldr r2, _08038400  @ gBG2TilemapBuffer
	mov sl, r2
	mov r0, sl
	movs r1, #0
	bl BG_Fill
	ldr r4, _08038404  @ gBG3TilemapBuffer
	mov r9, r4
	mov r0, r9
	movs r1, #0
	bl BG_Fill
	ldr r4, _08038408  @ gLCDControlBuffer
	ldrb r2, [r4, #0xc]
	movs r1, #4
	negs r1, r1
	adds r0, r1, #0
	ands r0, r2
	strb r0, [r4, #0xc]
	ldrb r2, [r4, #0x10]
	adds r0, r1, #0
	ands r0, r2
	movs r6, #1
	orrs r0, r6
	strb r0, [r4, #0x10]
	ldrb r0, [r4, #0x14]
	ands r1, r0
	movs r5, #2
	orrs r1, r5
	strb r1, [r4, #0x14]
	ldrb r0, [r4, #0x18]
	movs r1, #3
	orrs r0, r1
	strb r0, [r4, #0x18]
	bl LoadLegacyUiFrameGraphics
	ldrb r0, [r4, #1]
	orrs r0, r6
	orrs r0, r5
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r4, #1]
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
	movs r4, #0
	str r4, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #1
	movs r3, #0
	bl sub_8001ED0
	str r4, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #1
	bl sub_8001F0C
	movs r0, #0
	bl sub_8001F48
	movs r0, #0
	bl sub_8001F64
	movs r0, #1
	movs r1, #6
	movs r2, #0x10
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	ldr r4, _0803840C  @ gUnknown_08A21658
	movs r0, #3
	bl GetBackgroundTileDataOffset
	adds r1, r0, #0
	movs r0, #0xc0
	lsls r0, r0, #0x13
	adds r1, r1, r0
	adds r0, r4, #0
	bl CopyDataWithPossibleUncomp
	ldr r0, _08038410  @ gUnknown_08A25DCC
	movs r2, #0x80
	lsls r2, r2, #1
	adds r1, r2, #0
	bl CopyToPaletteBuffer
	ldr r1, _08038414  @ gUnknown_08A25ECC
	movs r2, #0x80
	lsls r2, r2, #8
	mov r0, r9
	bl CallARM_FillTileRect
	ldr r4, _08038418  @ gUnknown_08A26380
	movs r0, #2
	bl GetBackgroundTileDataOffset
	adds r1, r0, #0
	ldr r2, _0803841C  @ 0x06004C00
	adds r1, r1, r2
	adds r0, r4, #0
	bl CopyDataWithPossibleUncomp
	ldr r0, _08038420  @ gUnknown_08A268F8
	ldr r4, _08038424  @ gUnknown_02020188
	adds r1, r4, #0
	bl CopyDataWithPossibleUncomp
	ldr r0, _08038428  @ gUnknown_08A268D8
	movs r1, #0xe0
	movs r2, #0x20
	bl CopyToPaletteBuffer
	ldr r2, _0803842C  @ 0x00007260
	mov r0, sl
	adds r1, r4, #0
	bl CallARM_FillTileRect
	ldr r4, _08038430  @ gUnknown_089A234C
	movs r0, #1
	bl GetBackgroundTileDataOffset
	adds r1, r0, #0
	ldr r0, _08038434  @ 0x06004000
	adds r1, r1, r0
	adds r0, r4, #0
	bl CopyDataWithPossibleUncomp
	ldr r0, _08038438  @ gUnknown_089A27B4
	mov r1, r8
	bl CopyDataWithPossibleUncomp
	ldr r0, _0803843C  @ gUnknown_089A28E0
	movs r1, #0x40
	movs r2, #0x40
	bl CopyToPaletteBuffer
	movs r2, #0x88
	lsls r2, r2, #6
	adds r3, r2, #0
	mov r1, r8
	movs r2, #0xa0
	lsls r2, r2, #2
_080383B2:
	ldrh r4, [r1]
	adds r0, r3, r4
	strh r0, [r1]
	adds r1, #2
	subs r2, #1
	cmp r2, #0
	bne _080383B2
	bl sub_8037BAC
	adds r0, r7, #0
	bl sub_8038BA4
	movs r0, #0xf
	bl BG_EnableSyncByMask
	ldr r0, _08038440  @ gUnknown_0200310C
	bl sub_80AB760
	ldr r0, _08038444  @ gPaletteBuffer
	movs r2, #0xa8
	lsls r2, r2, #2
	adds r1, r0, r2
	movs r2, #8
	bl CpuFastSet
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080383F4: .4byte gUnknown_08A20050
_080383F8: .4byte gBG0TilemapBuffer
_080383FC: .4byte gBG1TilemapBuffer
_08038400: .4byte gBG2TilemapBuffer
_08038404: .4byte gBG3TilemapBuffer
_08038408: .4byte gLCDControlBuffer
_0803840C: .4byte gUnknown_08A21658
_08038410: .4byte gUnknown_08A25DCC
_08038414: .4byte gUnknown_08A25ECC
_08038418: .4byte gUnknown_08A26380
_0803841C: .4byte 0x06004C00
_08038420: .4byte gUnknown_08A268F8
_08038424: .4byte gUnknown_02020188
_08038428: .4byte gUnknown_08A268D8
_0803842C: .4byte 0x00007260
_08038430: .4byte gUnknown_089A234C
_08038434: .4byte 0x06004000
_08038438: .4byte gUnknown_089A27B4
_0803843C: .4byte gUnknown_089A28E0
_08038440: .4byte gUnknown_0200310C
_08038444: .4byte gPaletteBuffer

	THUMB_FUNC_END sub_8038240

	THUMB_FUNC_START sub_8038448
sub_8038448: @ 0x08038448
	push {r4, r5, r6, lr}
	sub sp, #0x24
	adds r6, r0, #0
	mov r0, sp
	ldr r1, _08038464  @ gUnknown_080D8070
	ldm r1!, {r2, r3, r4}
	stm r0!, {r2, r3, r4}
	ldm r1!, {r2, r3, r4}
	stm r0!, {r2, r3, r4}
	ldm r1!, {r2, r3, r4}
	stm r0!, {r2, r3, r4}
	mov r5, sp
	b _080384A8
	.align 2, 0
_08038464: .4byte gUnknown_080D8070
_08038468:
	ldrh r0, [r5]
	bl GetStringFromIndex
	adds r4, r0, #0
	bl strlen
	adds r1, r0, #0
	adds r0, r6, #0
	bl Text_Init
	adds r0, r6, #0
	movs r1, #0
	movs r2, #0
	bl Text_SetParameters
	adds r0, r6, #0
	adds r1, r4, #0
	bl Text_AppendString
	movs r1, #3
	ldrsb r1, [r5, r1]
	lsls r1, r1, #5
	movs r0, #2
	ldrsb r0, [r5, r0]
	adds r1, r1, r0
	lsls r1, r1, #1
	ldr r0, _080384B8  @ gBG0TilemapBuffer
	adds r1, r1, r0
	adds r0, r6, #0
	bl Text_Draw
	adds r5, #4
_080384A8:
	ldrh r0, [r5]
	cmp r0, #0
	bne _08038468
	add sp, #0x24
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080384B8: .4byte gBG0TilemapBuffer

	THUMB_FUNC_END sub_8038448

	THUMB_FUNC_START sub_80384BC
sub_80384BC: @ 0x080384BC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	adds r6, r0, #0
	ldr r0, [sp, #0x2c]
	ldr r4, [sp, #0x30]
	lsls r1, r1, #0x10
	lsrs r5, r1, #0x10
	lsls r2, r2, #0x18
	lsrs r7, r2, #0x18
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	mov sl, r3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r9, r0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	str r4, [sp, #8]
	movs r4, #0
	cmp r4, r7
	bge _0803850E
_080384EE:
	adds r0, r5, #0
	movs r1, #0xa
	bl DivRem
	mov r2, sp
	adds r1, r2, r4
	strb r0, [r1]
	adds r0, r5, #0
	movs r1, #0xa
	bl Div
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	adds r4, #1
	cmp r4, r7
	blt _080384EE
_0803850E:
	movs r0, #0
	mov r8, r0
	subs r4, r7, #1
	cmp r4, #0
	blt _08038570
	mov r1, r9
	lsls r0, r1, #0x18
	asrs r0, r0, #0x13
	mov r9, r0
	mov r2, sl
	lsls r0, r2, #0x18
	asrs r7, r0, #0x18
_08038526:
	mov r0, sp
	adds r5, r0, r4
	ldrb r0, [r5]
	cmp r0, #0
	beq _08038534
	movs r1, #1
	mov r8, r1
_08038534:
	mov r2, r8
	cmp r2, #0
	bne _0803853E
	cmp r4, #0
	bne _08038568
_0803853E:
	adds r0, r6, #0
	movs r1, #1
	bl Text_Init
	adds r0, r6, #0
	movs r1, #0
	ldr r2, [sp, #8]
	bl Text_SetParameters
	ldrb r1, [r5]
	adds r0, r6, #0
	bl Text_AppendDecNumber
	subs r1, r7, r4
	add r1, r9
	lsls r1, r1, #1
	ldr r0, _08038584  @ gBG0TilemapBuffer
	adds r1, r1, r0
	adds r0, r6, #0
	bl Text_Draw
_08038568:
	adds r6, #8
	subs r4, #1
	cmp r4, #0
	bge _08038526
_08038570:
	adds r0, r6, #0
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08038584: .4byte gBG0TilemapBuffer

	THUMB_FUNC_END sub_80384BC

	THUMB_FUNC_START sub_8038588
sub_8038588: @ 0x08038588
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	adds r5, r0, #0
	ldr r0, [sp, #0x2c]
	ldr r4, [sp, #0x30]
	lsls r1, r1, #0x10
	lsrs r6, r1, #0x10
	lsls r2, r2, #0x18
	lsrs r7, r2, #0x18
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	str r3, [sp, #8]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sl, r0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	mov r9, r4
	movs r4, #0
	cmp r4, r7
	bge _080385DA
_080385BA:
	adds r0, r6, #0
	movs r1, #0xa
	bl DivRem
	mov r2, sp
	adds r1, r2, r4
	strb r0, [r1]
	adds r0, r6, #0
	movs r1, #0xa
	bl Div
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	adds r4, #1
	cmp r4, r7
	blt _080385BA
_080385DA:
	movs r0, #0
	mov r8, r0
	subs r4, r7, #1
	cmp r4, #0
	blt _0803864E
	ldr r7, _08038660  @ 0x0000FFFF
_080385E6:
	ldrh r0, [r5]
	cmp r0, r7
	beq _080385F2
	adds r0, r5, #0
	bl Text_Clear
_080385F2:
	mov r2, sp
	adds r6, r2, r4
	ldrb r0, [r6]
	cmp r0, #0
	beq _08038600
	movs r0, #1
	mov r8, r0
_08038600:
	mov r2, r8
	cmp r2, #0
	bne _0803860A
	cmp r4, #0
	bne _08038646
_0803860A:
	ldrh r0, [r5]
	cmp r0, r7
	bne _08038618
	adds r0, r5, #0
	movs r1, #1
	bl Text_Init
_08038618:
	adds r0, r5, #0
	movs r1, #0
	mov r2, r9
	bl Text_SetParameters
	ldrb r1, [r6]
	adds r0, r5, #0
	bl Text_AppendDecNumber
	mov r0, sl
	lsls r1, r0, #0x18
	asrs r1, r1, #0x13
	ldr r2, [sp, #8]
	lsls r0, r2, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, r4
	adds r1, r1, r0
	lsls r1, r1, #1
	ldr r0, _08038664  @ gBG0TilemapBuffer
	adds r1, r1, r0
	adds r0, r5, #0
	bl Text_Draw
_08038646:
	adds r5, #8
	subs r4, #1
	cmp r4, #0
	bge _080385E6
_0803864E:
	adds r0, r5, #0
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08038660: .4byte 0x0000FFFF
_08038664: .4byte gBG0TilemapBuffer

	THUMB_FUNC_END sub_8038588

	THUMB_FUNC_START sub_8038668
sub_8038668: @ 0x08038668
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	subs r4, r1, #1
	cmp r4, #0
	blt _0803868C
	ldr r6, _08038694  @ 0x0000FFFF
_08038678:
	ldrh r0, [r5]
	cmp r0, r6
	beq _08038684
	adds r0, r5, #0
	bl Text_Clear
_08038684:
	adds r5, #8
	subs r4, #1
	cmp r4, #0
	bge _08038678
_0803868C:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08038694: .4byte 0x0000FFFF

	THUMB_FUNC_END sub_8038668

	THUMB_FUNC_START sub_8038698
sub_8038698: @ 0x08038698
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x18
	adds r6, r0, #0
	ldr r0, [sp, #0x38]
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	str r2, [sp, #0x10]
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	mov r9, r3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sl, r0
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #2
	mov r4, sp
	adds r4, #0xa
	add r1, sp, #0xc
	mov r8, r1
	add r1, sp, #8
	adds r2, r4, #0
	mov r3, r8
	bl ComputeDisplayTime
	ldr r2, [sp, #0x10]
	lsls r0, r2, #0x18
	movs r1, #0xf9
	lsls r1, r1, #0x18
	adds r0, r0, r1
	lsrs r7, r0, #0x18
	add r0, sp, #8
	ldrh r0, [r0]
	cmp r0, #9
	bhi _080386FC
	lsls r3, r7, #0x18
	asrs r3, r3, #0x18
	mov r2, r9
	lsls r4, r2, #0x18
	asrs r0, r4, #0x18
	str r0, [sp]
	mov r0, sl
	str r0, [sp, #4]
	adds r0, r6, #0
	movs r1, #0
	b _0803871E
_080386FC:
	add r0, sp, #8
	ldrh r0, [r0]
	movs r1, #0xa
	bl __udivsi3
	adds r1, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r3, r7, #0x18
	asrs r3, r3, #0x18
	mov r2, r9
	lsls r4, r2, #0x18
	asrs r0, r4, #0x18
	str r0, [sp]
	mov r0, sl
	str r0, [sp, #4]
	adds r0, r6, #0
_0803871E:
	movs r2, #1
	bl sub_80384BC
	adds r6, r0, #0
	str r4, [sp, #0x14]
	lsls r0, r7, #0x18
	movs r1, #0x80
	lsls r1, r1, #0x11
	adds r0, r0, r1
	lsrs r7, r0, #0x18
	add r0, sp, #8
	ldrh r0, [r0]
	movs r1, #0xa
	bl __umodsi3
	adds r1, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r3, r7, #0x18
	asrs r3, r3, #0x18
	ldr r2, [sp, #0x14]
	asrs r2, r2, #0x18
	mov r9, r2
	str r2, [sp]
	mov r0, sl
	str r0, [sp, #4]
	adds r0, r6, #0
	movs r2, #1
	bl sub_80384BC
	adds r6, r0, #0
	ldr r1, [sp, #0x10]
	lsls r1, r1, #0x18
	mov r8, r1
	asrs r4, r1, #0x18
	movs r0, #0xfb
	lsls r0, r0, #0x18
	add r0, r8
	lsrs r7, r0, #0x18
	ldr r0, _080387C8  @ 0x0000020D
	bl GetStringFromIndex
	adds r5, r0, #0
	adds r0, r6, #0
	movs r1, #1
	bl Text_Init
	adds r0, r6, #0
	movs r1, #2
	mov r2, sl
	bl Text_SetParameters
	adds r0, r6, #0
	adds r1, r5, #0
	bl Text_AppendChar
	mov r2, r9
	lsls r1, r2, #5
	lsls r0, r7, #0x18
	asrs r0, r0, #0x18
	adds r1, r1, r0
	lsls r1, r1, #1
	ldr r0, _080387CC  @ gBG0TilemapBuffer
	adds r1, r1, r0
	adds r0, r6, #0
	bl Text_Draw
	adds r6, #8
	subs r4, #4
	lsls r4, r4, #0x18
	lsrs r7, r4, #0x18
	mov r1, sp
	ldrh r0, [r1, #0xa]
	mov r5, r8
	cmp r0, #9
	bhi _080387D0
	lsls r3, r7, #0x18
	asrs r3, r3, #0x18
	mov r2, r9
	str r2, [sp]
	mov r0, sl
	str r0, [sp, #4]
	adds r0, r6, #0
	movs r1, #0
	b _080387EE
	.align 2, 0
_080387C8: .4byte 0x0000020D
_080387CC: .4byte gBG0TilemapBuffer
_080387D0:
	mov r1, sp
	ldrh r0, [r1, #0xa]
	movs r1, #0xa
	bl __udivsi3
	adds r1, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r3, r7, #0x18
	asrs r3, r3, #0x18
	mov r2, r9
	str r2, [sp]
	mov r0, sl
	str r0, [sp, #4]
	adds r0, r6, #0
_080387EE:
	movs r2, #1
	bl sub_80384BC
	adds r6, r0, #0
	lsls r0, r7, #0x18
	movs r1, #0x80
	lsls r1, r1, #0x11
	adds r0, r0, r1
	lsrs r7, r0, #0x18
	mov r2, sp
	ldrh r0, [r2, #0xa]
	movs r1, #0xa
	bl __umodsi3
	adds r1, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r3, r7, #0x18
	asrs r3, r3, #0x18
	ldr r0, [sp, #0x14]
	asrs r0, r0, #0x18
	mov r8, r0
	str r0, [sp]
	mov r2, sl
	str r2, [sp, #4]
	adds r0, r6, #0
	movs r2, #1
	bl sub_80384BC
	adds r6, r0, #0
	asrs r4, r5, #0x18
	movs r1, #0xfe
	lsls r1, r1, #0x18
	adds r0, r5, r1
	lsrs r7, r0, #0x18
	ldr r0, _08038890  @ 0x0000020D
	bl GetStringFromIndex
	adds r5, r0, #0
	adds r0, r6, #0
	movs r1, #1
	bl Text_Init
	adds r0, r6, #0
	movs r1, #2
	mov r2, sl
	bl Text_SetParameters
	adds r0, r6, #0
	adds r1, r5, #0
	bl Text_AppendChar
	mov r2, r8
	lsls r1, r2, #5
	lsls r0, r7, #0x18
	asrs r0, r0, #0x18
	adds r1, r1, r0
	lsls r1, r1, #1
	ldr r0, _08038894  @ gBG0TilemapBuffer
	adds r1, r1, r0
	adds r0, r6, #0
	bl Text_Draw
	adds r6, #8
	subs r4, #1
	lsls r4, r4, #0x18
	lsrs r7, r4, #0x18
	mov r1, sp
	ldrh r0, [r1, #0xc]
	cmp r0, #9
	bhi _08038898
	lsls r4, r7, #0x18
	asrs r3, r4, #0x18
	mov r2, r8
	str r2, [sp]
	mov r0, sl
	str r0, [sp, #4]
	adds r0, r6, #0
	movs r1, #0
	b _080388B6
	.align 2, 0
_08038890: .4byte 0x0000020D
_08038894: .4byte gBG0TilemapBuffer
_08038898:
	mov r1, sp
	ldrh r0, [r1, #0xc]
	movs r1, #0xa
	bl __udivsi3
	adds r1, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r4, r7, #0x18
	asrs r3, r4, #0x18
	mov r2, r8
	str r2, [sp]
	mov r0, sl
	str r0, [sp, #4]
	adds r0, r6, #0
_080388B6:
	movs r2, #1
	bl sub_80384BC
	adds r6, r0, #0
	movs r1, #0x80
	lsls r1, r1, #0x11
	adds r0, r4, r1
	lsrs r7, r0, #0x18
	mov r2, sp
	ldrh r0, [r2, #0xc]
	movs r1, #0xa
	bl __umodsi3
	adds r1, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r3, r7, #0x18
	asrs r3, r3, #0x18
	ldr r2, [sp, #0x14]
	asrs r0, r2, #0x18
	str r0, [sp]
	mov r0, sl
	str r0, [sp, #4]
	adds r0, r6, #0
	movs r2, #1
	bl sub_80384BC
	adds r6, r0, #0
	add sp, #0x18
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8038698

	THUMB_FUNC_START sub_8038900
sub_8038900: @ 0x08038900
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	adds r6, r0, #0
	ldr r0, [sp, #0x34]
	ldr r4, [sp, #0x38]
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	mov sl, r2
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	mov r8, r3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r9, r0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	str r4, [sp, #0x10]
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #2
	mov r4, sp
	adds r4, #0xa
	add r5, sp, #0xc
	add r1, sp, #8
	adds r2, r4, #0
	adds r3, r5, #0
	bl ComputeDisplayTime
	mov r1, sl
	lsls r0, r1, #0x18
	movs r2, #0xf9
	lsls r2, r2, #0x18
	adds r0, r0, r2
	lsrs r7, r0, #0x18
	add r0, sp, #8
	ldrh r0, [r0]
	cmp r0, #9
	bhi _0803896A
	lsls r3, r7, #0x18
	asrs r3, r3, #0x18
	mov r0, r8
	lsls r4, r0, #0x18
	asrs r0, r4, #0x18
	str r0, [sp]
	mov r1, r9
	str r1, [sp, #4]
	adds r0, r6, #0
	movs r1, #0
	b _0803898C
_0803896A:
	add r0, sp, #8
	ldrh r0, [r0]
	movs r1, #0xa
	bl __udivsi3
	adds r1, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r3, r7, #0x18
	asrs r3, r3, #0x18
	mov r2, r8
	lsls r4, r2, #0x18
	asrs r0, r4, #0x18
	str r0, [sp]
	mov r0, r9
	str r0, [sp, #4]
	adds r0, r6, #0
_0803898C:
	movs r2, #1
	bl sub_8038588
	adds r6, r0, #0
	mov r8, r4
	lsls r0, r7, #0x18
	movs r1, #0x80
	lsls r1, r1, #0x11
	adds r0, r0, r1
	lsrs r7, r0, #0x18
	add r0, sp, #8
	ldrh r0, [r0]
	movs r1, #0xa
	bl __umodsi3
	adds r1, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r3, r7, #0x18
	asrs r3, r3, #0x18
	mov r2, r8
	asrs r0, r2, #0x18
	str r0, [sp]
	mov r0, r9
	str r0, [sp, #4]
	adds r0, r6, #0
	movs r2, #1
	bl sub_8038588
	adds r6, r0, #0
	mov r1, sl
	lsls r4, r1, #0x18
	movs r2, #0xfb
	lsls r2, r2, #0x18
	adds r0, r4, r2
	lsrs r7, r0, #0x18
	ldr r0, _080389EC  @ 0x0000020D
	bl GetStringFromIndex
	adds r5, r0, #0
	ldrh r1, [r6]
	ldr r0, _080389F0  @ 0x0000FFFF
	cmp r1, r0
	beq _080389F4
	adds r0, r6, #0
	bl Text_Clear
	b _080389FC
	.align 2, 0
_080389EC: .4byte 0x0000020D
_080389F0: .4byte 0x0000FFFF
_080389F4:
	adds r0, r6, #0
	movs r1, #1
	bl Text_Init
_080389FC:
	ldr r1, [sp, #0x10]
	lsls r0, r1, #0x18
	mov sl, r0
	cmp r0, #0
	beq _08038A2E
	adds r0, r6, #0
	movs r1, #2
	mov r2, r9
	bl Text_SetParameters
	adds r0, r6, #0
	adds r1, r5, #0
	bl Text_AppendChar
	mov r2, r8
	asrs r1, r2, #0x13
	lsls r0, r7, #0x18
	asrs r0, r0, #0x18
	adds r1, r1, r0
	lsls r1, r1, #1
	ldr r0, _08038A54  @ gBG0TilemapBuffer
	adds r1, r1, r0
	adds r0, r6, #0
	bl Text_Draw
_08038A2E:
	adds r6, #8
	movs r1, #0xfc
	lsls r1, r1, #0x18
	adds r0, r4, r1
	lsrs r7, r0, #0x18
	mov r2, sp
	ldrh r0, [r2, #0xa]
	cmp r0, #9
	bhi _08038A58
	lsls r3, r7, #0x18
	asrs r3, r3, #0x18
	mov r1, r8
	asrs r0, r1, #0x18
	str r0, [sp]
	mov r2, r9
	str r2, [sp, #4]
	adds r0, r6, #0
	movs r1, #0
	b _08038A78
	.align 2, 0
_08038A54: .4byte gBG0TilemapBuffer
_08038A58:
	mov r1, sp
	ldrh r0, [r1, #0xa]
	movs r1, #0xa
	bl __udivsi3
	adds r1, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r3, r7, #0x18
	asrs r3, r3, #0x18
	mov r2, r8
	asrs r0, r2, #0x18
	str r0, [sp]
	mov r0, r9
	str r0, [sp, #4]
	adds r0, r6, #0
_08038A78:
	movs r2, #1
	bl sub_8038588
	adds r6, r0, #0
	lsls r0, r7, #0x18
	movs r1, #0x80
	lsls r1, r1, #0x11
	adds r0, r0, r1
	lsrs r7, r0, #0x18
	mov r2, sp
	ldrh r0, [r2, #0xa]
	movs r1, #0xa
	bl __umodsi3
	adds r1, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r3, r7, #0x18
	asrs r3, r3, #0x18
	mov r2, r8
	asrs r0, r2, #0x18
	str r0, [sp]
	mov r0, r9
	str r0, [sp, #4]
	adds r0, r6, #0
	movs r2, #1
	bl sub_8038588
	adds r6, r0, #0
	movs r1, #0xfe
	lsls r1, r1, #0x18
	adds r0, r4, r1
	lsrs r7, r0, #0x18
	ldr r0, _08038AD4  @ 0x0000020D
	bl GetStringFromIndex
	adds r5, r0, #0
	ldrh r1, [r6]
	ldr r0, _08038AD8  @ 0x0000FFFF
	cmp r1, r0
	beq _08038ADC
	adds r0, r6, #0
	bl Text_Clear
	b _08038AE4
	.align 2, 0
_08038AD4: .4byte 0x0000020D
_08038AD8: .4byte 0x0000FFFF
_08038ADC:
	adds r0, r6, #0
	movs r1, #1
	bl Text_Init
_08038AE4:
	mov r2, sl
	cmp r2, #0
	beq _08038B12
	adds r0, r6, #0
	movs r1, #2
	mov r2, r9
	bl Text_SetParameters
	adds r0, r6, #0
	adds r1, r5, #0
	bl Text_AppendChar
	mov r0, r8
	asrs r1, r0, #0x13
	lsls r0, r7, #0x18
	asrs r0, r0, #0x18
	adds r1, r1, r0
	lsls r1, r1, #1
	ldr r0, _08038B38  @ gBG0TilemapBuffer
	adds r1, r1, r0
	adds r0, r6, #0
	bl Text_Draw
_08038B12:
	adds r6, #8
	movs r1, #0xff
	lsls r1, r1, #0x18
	adds r0, r4, r1
	lsrs r7, r0, #0x18
	mov r2, sp
	ldrh r0, [r2, #0xc]
	cmp r0, #9
	bhi _08038B3C
	lsls r4, r7, #0x18
	asrs r3, r4, #0x18
	mov r1, r8
	asrs r0, r1, #0x18
	str r0, [sp]
	mov r2, r9
	str r2, [sp, #4]
	adds r0, r6, #0
	movs r1, #0
	b _08038B5C
	.align 2, 0
_08038B38: .4byte gBG0TilemapBuffer
_08038B3C:
	mov r1, sp
	ldrh r0, [r1, #0xc]
	movs r1, #0xa
	bl __udivsi3
	adds r1, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r4, r7, #0x18
	asrs r3, r4, #0x18
	mov r2, r8
	asrs r0, r2, #0x18
	str r0, [sp]
	mov r0, r9
	str r0, [sp, #4]
	adds r0, r6, #0
_08038B5C:
	movs r2, #1
	bl sub_8038588
	adds r6, r0, #0
	movs r1, #0x80
	lsls r1, r1, #0x11
	adds r0, r4, r1
	lsrs r7, r0, #0x18
	mov r2, sp
	ldrh r0, [r2, #0xc]
	movs r1, #0xa
	bl __umodsi3
	adds r1, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r3, r7, #0x18
	asrs r3, r3, #0x18
	mov r2, r8
	asrs r0, r2, #0x18
	str r0, [sp]
	mov r0, r9
	str r0, [sp, #4]
	adds r0, r6, #0
	movs r2, #1
	bl sub_8038588
	adds r6, r0, #0
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8038900

	THUMB_FUNC_START sub_8038BA4
sub_8038BA4: @ 0x08038BA4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x28
	adds r6, r0, #0
	ldr r4, _08038E18  @ gUnknown_030017A0
	ldr r5, _08038E1C  @ 0x04000003
	adds r0, r4, #0
	add r1, sp, #8
	adds r2, r5, #0
	bl CpuSet
	adds r0, r4, #0
	adds r0, #0x24
	ldrb r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r4, #0xc
	adds r0, r0, r4
	add r1, sp, #0x14
	mov r9, r1
	adds r2, r5, #0
	bl CpuSet
	bl GetGameClock
	adds r4, r0, #0
	ldr r0, _08038E20  @ gUnknown_020038C4
	ldr r0, [r0]
	bl SetGameClock
	add r0, sp, #8
	bl sub_8037EB0
	adds r0, r4, #0
	bl SetGameClock
	bl sub_8003D20
	ldr r4, _08038E24  @ gUnknown_020038AC
	movs r0, #0
	bl GetBackgroundTileDataOffset
	adds r1, r0, #0
	ldr r2, _08038E28  @ 0x06000020
	adds r1, r1, r2
	adds r0, r4, #0
	movs r2, #1
	movs r3, #0
	bl Font_InitForUI
	adds r0, r4, #0
	bl SetFont
	bl Font_LoadForUI
	adds r0, r6, #0
	bl NewGreenTextColorManager
	add r0, sp, #0x20
	bl sub_8038448
	ldr r0, _08038E2C  @ gUnknown_02003B70
	mov r3, r9
	ldrh r1, [r3, #8]
	lsls r1, r1, #0x16
	lsrs r1, r1, #0x19
	movs r6, #7
	str r6, [sp]
	movs r4, #2
	mov r8, r4
	str r4, [sp, #4]
	movs r2, #3
	movs r3, #0x1a
	bl sub_80384BC
	ldr r7, _08038E30  @ gUnknown_080D7FD0
	ldrb r2, [r7, #4]
	movs r5, #8
	subs r0, r5, r2
	lsls r0, r0, #3
	ldr r1, _08038E34  @ gUnknown_020038C8
	mov sl, r1
	add r0, sl
	add r1, sp, #8
	ldrh r3, [r1, #6]
	lsrs r3, r3, #3
	ldrb r1, [r1, #8]
	ands r1, r6
	lsls r1, r1, #0xd
	orrs r1, r3
	movs r3, #0
	ldrsb r3, [r7, r3]
	movs r4, #1
	ldrsb r4, [r7, r4]
	str r4, [sp]
	mov r4, r8
	str r4, [sp, #4]
	bl sub_80384BC
	adds r0, r7, #0
	adds r0, #0x28
	ldrb r2, [r0]
	subs r0, r5, r2
	lsls r0, r0, #3
	movs r1, #0xa0
	lsls r1, r1, #1
	add r1, sl
	adds r0, r0, r1
	mov r1, r9
	ldrh r3, [r1, #6]
	lsrs r3, r3, #3
	ldrb r1, [r1, #8]
	ands r1, r6
	lsls r1, r1, #0xd
	orrs r1, r3
	adds r3, r7, #0
	adds r3, #0x24
	ldrb r3, [r3]
	lsls r3, r3, #0x18
	asrs r3, r3, #0x18
	adds r4, r7, #0
	adds r4, #0x25
	ldrb r4, [r4]
	lsls r4, r4, #0x18
	asrs r4, r4, #0x18
	str r4, [sp]
	mov r4, r8
	str r4, [sp, #4]
	bl sub_80384BC
	ldrb r2, [r7, #0xc]
	subs r0, r5, r2
	lsls r0, r0, #3
	mov r1, sl
	adds r1, #0x40
	adds r0, r0, r1
	add r1, sp, #8
	ldrh r1, [r1]
	movs r3, #8
	ldrsb r3, [r7, r3]
	movs r4, #9
	ldrsb r4, [r7, r4]
	str r4, [sp]
	mov r6, r8
	str r6, [sp, #4]
	bl sub_80384BC
	adds r0, r7, #0
	adds r0, #0x30
	ldrb r2, [r0]
	subs r0, r5, r2
	lsls r0, r0, #3
	movs r1, #0xc0
	lsls r1, r1, #1
	add r1, sl
	adds r0, r0, r1
	mov r3, r9
	ldrh r1, [r3]
	adds r3, r7, #0
	adds r3, #0x2c
	ldrb r3, [r3]
	lsls r3, r3, #0x18
	asrs r3, r3, #0x18
	adds r4, r7, #0
	adds r4, #0x2d
	ldrb r4, [r4]
	lsls r4, r4, #0x18
	asrs r4, r4, #0x18
	str r4, [sp]
	str r6, [sp, #4]
	bl sub_80384BC
	ldrb r2, [r7, #0x14]
	subs r0, r5, r2
	lsls r0, r0, #3
	mov r1, sl
	adds r1, #0x80
	adds r0, r0, r1
	add r1, sp, #8
	ldrb r1, [r1, #2]
	movs r3, #0x10
	ldrsb r3, [r7, r3]
	adds r4, r7, #0
	adds r4, #0x35
	ldrb r4, [r4]
	lsls r4, r4, #0x18
	asrs r4, r4, #0x18
	str r4, [sp]
	str r6, [sp, #4]
	bl sub_80384BC
	adds r0, r7, #0
	adds r0, #0x38
	ldrb r2, [r0]
	subs r0, r5, r2
	lsls r0, r0, #3
	movs r1, #0xe0
	lsls r1, r1, #1
	add r1, sl
	adds r0, r0, r1
	mov r6, r9
	ldrb r1, [r6, #2]
	adds r3, r7, #0
	adds r3, #0x34
	ldrb r3, [r3]
	lsls r3, r3, #0x18
	asrs r3, r3, #0x18
	str r4, [sp]
	mov r4, r8
	str r4, [sp, #4]
	bl sub_80384BC
	ldrb r2, [r7, #0x1c]
	subs r0, r5, r2
	lsls r0, r0, #3
	mov r1, sl
	adds r1, #0xc0
	adds r0, r0, r1
	add r1, sp, #8
	ldrb r3, [r1, #3]
	ldrb r1, [r1, #4]
	movs r6, #1
	ands r1, r6
	lsls r1, r1, #8
	orrs r1, r3
	movs r3, #0x18
	ldrsb r3, [r7, r3]
	movs r4, #0x19
	ldrsb r4, [r7, r4]
	str r4, [sp]
	mov r4, r8
	str r4, [sp, #4]
	bl sub_80384BC
	adds r0, r7, #0
	adds r0, #0x40
	ldrb r2, [r0]
	subs r5, r5, r2
	lsls r5, r5, #3
	movs r0, #0x80
	lsls r0, r0, #2
	add r0, sl
	adds r5, r5, r0
	mov r1, r9
	ldrb r0, [r1, #3]
	ldrb r1, [r1, #4]
	ands r1, r6
	lsls r1, r1, #8
	orrs r1, r0
	adds r0, r7, #0
	adds r0, #0x3c
	movs r3, #0
	ldrsb r3, [r0, r3]
	adds r0, #1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	str r0, [sp]
	str r4, [sp, #4]
	adds r0, r5, #0
	bl sub_80384BC
	movs r0, #0x80
	lsls r0, r0, #1
	add r0, sl
	ldr r1, [sp, #0xc]
	lsls r1, r1, #0xd
	lsrs r1, r1, #0xe
	adds r2, r7, #0
	adds r2, #0x20
	ldrb r2, [r2]
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	adds r3, r7, #0
	adds r3, #0x21
	ldrb r3, [r3]
	lsls r3, r3, #0x18
	asrs r3, r3, #0x18
	str r4, [sp]
	bl sub_8038698
	movs r0, #0x90
	lsls r0, r0, #2
	add r0, sl
	mov r2, r9
	ldr r1, [r2, #4]
	lsls r1, r1, #0xd
	lsrs r1, r1, #0xe
	adds r2, r7, #0
	adds r2, #0x44
	ldrb r2, [r2]
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	adds r3, r7, #0
	adds r3, #0x45
	ldrb r3, [r3]
	lsls r3, r3, #0x18
	asrs r3, r3, #0x18
	str r4, [sp]
	bl sub_8038698
	add sp, #0x28
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08038E18: .4byte gUnknown_030017A0
_08038E1C: .4byte 0x04000003
_08038E20: .4byte gUnknown_020038C4
_08038E24: .4byte gUnknown_020038AC
_08038E28: .4byte 0x06000020
_08038E2C: .4byte gUnknown_02003B70
_08038E30: .4byte gUnknown_080D7FD0
_08038E34: .4byte gUnknown_020038C8

	THUMB_FUNC_END sub_8038BA4

	THUMB_FUNC_START sub_8038E38
sub_8038E38: @ 0x08038E38
	push {r4, r5, lr}
	sub sp, #0x14
	ldr r0, _08038E94  @ gUnknown_030017A0
	ldr r2, _08038E98  @ 0x04000003
	add r1, sp, #8
	bl CpuSet
	add r0, sp, #8
	bl sub_8037E7C
	adds r5, r0, #0
	bl GetGameClock
	ldr r1, _08038E9C  @ gRAMChapterData
	ldr r1, [r1, #4]
	subs r0, r0, r1
	movs r1, #0x3c
	bl __umodsi3
	movs r4, #1
	cmp r0, #0x1d
	bls _08038E66
	movs r4, #0
_08038E66:
	ldr r0, _08038EA0  @ gUnknown_020039C8
	ldr r1, _08038EA4  @ gUnknown_080D7FD0
	adds r2, r1, #0
	adds r2, #0x20
	ldrb r2, [r2]
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	adds r1, #0x21
	movs r3, #0
	ldrsb r3, [r1, r3]
	movs r1, #2
	str r1, [sp]
	str r4, [sp, #4]
	adds r1, r5, #0
	bl sub_8038900
	movs r0, #1
	bl BG_EnableSyncByMask
	add sp, #0x14
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08038E94: .4byte gUnknown_030017A0
_08038E98: .4byte 0x04000003
_08038E9C: .4byte gRAMChapterData
_08038EA0: .4byte gUnknown_020039C8
_08038EA4: .4byte gUnknown_080D7FD0

	THUMB_FUNC_END sub_8038E38

	THUMB_FUNC_START sub_8038EA8
sub_8038EA8: @ 0x08038EA8
	push {r4, lr}
	adds r4, r0, #0
	bl sub_8038E38
	ldr r0, _08038ECC  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #3
	ands r0, r1
	cmp r0, #0
	beq _08038EC4
	adds r0, r4, #0
	bl Proc_Break
_08038EC4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08038ECC: .4byte gKeyStatusPtr

	THUMB_FUNC_END sub_8038EA8

	THUMB_FUNC_START sub_8038ED0
sub_8038ED0: @ 0x08038ED0
	push {lr}
	adds r2, r0, #0
	ldr r0, _08038EEC  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #3
	ands r0, r1
	cmp r0, #0
	beq _08038EE8
	adds r0, r2, #0
	bl Proc_Break
_08038EE8:
	pop {r0}
	bx r0
	.align 2, 0
_08038EEC: .4byte gKeyStatusPtr

	THUMB_FUNC_END sub_8038ED0

	THUMB_FUNC_START sub_8038EF0
sub_8038EF0: @ 0x08038EF0
	push {lr}
	sub sp, #4
	bl sub_80AB77C
	bl EndGreenTextColorManager
	ldr r0, _08038F5C  @ gBG0TilemapBuffer
	movs r1, #0
	bl BG_Fill
	ldr r0, _08038F60  @ gBG1TilemapBuffer
	movs r1, #0
	bl BG_Fill
	ldr r0, _08038F64  @ gBG2TilemapBuffer
	movs r1, #0
	bl BG_Fill
	ldr r0, _08038F68  @ gBG3TilemapBuffer
	movs r1, #0
	bl BG_Fill
	movs r0, #0xf
	bl BG_EnableSyncByMask
	ldr r2, _08038F6C  @ gLCDControlBuffer
	ldrb r1, [r2, #1]
	movs r0, #2
	negs r0, r0
	ands r0, r1
	movs r1, #3
	negs r1, r1
	ands r0, r1
	subs r1, #2
	ands r0, r1
	subs r1, #4
	ands r0, r1
	subs r1, #8
	ands r0, r1
	strb r0, [r2, #1]
	bl Font_InitForUIDefault
	movs r0, #0
	str r0, [sp]
	ldr r1, _08038F70  @ gPaletteBuffer
	ldr r2, _08038F74  @ 0x01000100
	mov r0, sp
	bl CpuFastSet
	bl EnablePaletteSync
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_08038F5C: .4byte gBG0TilemapBuffer
_08038F60: .4byte gBG1TilemapBuffer
_08038F64: .4byte gBG2TilemapBuffer
_08038F68: .4byte gBG3TilemapBuffer
_08038F6C: .4byte gLCDControlBuffer
_08038F70: .4byte gPaletteBuffer
_08038F74: .4byte 0x01000100

	THUMB_FUNC_END sub_8038EF0

	THUMB_FUNC_START sub_8038F78
sub_8038F78: @ 0x08038F78
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	adds r5, r0, #0
	movs r0, #0
	bl GetBackgroundTileDataOffset
	str r0, [sp, #8]
	ldr r0, _08038FC4  @ 0x01000008
	mov sl, r0
	ldr r7, _08038FC8  @ 0x06012400
	ldr r6, _08038FCC  @ 0x06012000
	movs r1, #0
	mov r9, r1
	movs r0, #7
	mov r8, r0
_08038F9E:
	ldrh r0, [r5]
	ldr r1, _08038FD0  @ 0x0000FFFF
	cmp r0, r1
	bne _08038FD4
	mov r0, r9
	str r0, [sp]
	mov r0, sp
	adds r1, r6, #0
	mov r2, sl
	bl CpuFastSet
	mov r1, r9
	str r1, [sp, #4]
	add r0, sp, #4
	adds r1, r7, #0
	mov r2, sl
	bl CpuFastSet
	b _08038FFA
	.align 2, 0
_08038FC4: .4byte 0x01000008
_08038FC8: .4byte 0x06012400
_08038FCC: .4byte 0x06012000
_08038FD0: .4byte 0x0000FFFF
_08038FD4:
	ldrh r4, [r5]
	lsls r4, r4, #6
	movs r0, #0xc0
	lsls r0, r0, #0x13
	adds r4, r4, r0
	ldr r1, [sp, #8]
	adds r4, r1, r4
	adds r4, #0x20
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #8
	bl CpuFastSet
	adds r4, #0x20
	adds r0, r4, #0
	adds r1, r7, #0
	movs r2, #8
	bl CpuFastSet
_08038FFA:
	adds r5, #8
	adds r7, #0x20
	adds r6, #0x20
	movs r0, #1
	negs r0, r0
	add r8, r0
	mov r1, r8
	cmp r1, #0
	bge _08038F9E
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8038F78

	THUMB_FUNC_START sub_803901C
sub_803901C: @ 0x0803901C
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	mov r9, r0
	ldr r0, [r0, #0x2c]
	lsls r0, r0, #6
	ldr r1, _080390B8  @ gUnknown_020038C8
	adds r0, r0, r1
	bl sub_8038F78
	ldr r1, _080390BC  @ gUnknown_02003BE8
	movs r2, #0
	movs r0, #2
	strh r0, [r1]
	ldr r0, _080390C0  @ gUnknown_02003B88
	str r0, [r1, #4]
	ldr r3, _080390C4  @ gUnknown_02003BA8
	str r3, [r1, #8]
	str r2, [r1, #0xc]
	str r2, [r1, #0x10]
	ldr r2, _080390C8  @ gUnknown_0859E7C8
	ldr r0, _080390CC  @ gUnknown_0859E7D4
	movs r4, #6
	mov r8, r4
	mov r4, r8
	strh r4, [r1, #2]
	movs r7, #0
	adds r6, r0, #0
	adds r5, r3, #0
_0803905A:
	lsls r4, r7, #1
	ldrh r1, [r2]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r1, r0, #4
	subs r1, r1, r0
	movs r0, #0x80
	lsls r0, r0, #5
	str r2, [sp]
	bl DivArm
	ldr r1, _080390C0  @ gUnknown_02003B88
	adds r4, r4, r1
	strh r0, [r4]
	ldr r0, [r6]
	lsls r0, r0, #4
	str r0, [r5]
	ldr r0, [r6, #4]
	lsls r0, r0, #4
	str r0, [r5, #4]
	adds r6, #8
	adds r5, #8
	ldr r2, [sp]
	adds r2, #2
	adds r7, #1
	cmp r7, r8
	blt _0803905A
	movs r0, #0
	mov r1, r9
	str r0, [r1, #0x34]
	ldr r0, _080390D0  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080390A8
	movs r0, #0x80
	bl m4aSongNumStart
_080390A8:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080390B8: .4byte gUnknown_020038C8
_080390BC: .4byte gUnknown_02003BE8
_080390C0: .4byte gUnknown_02003B88
_080390C4: .4byte gUnknown_02003BA8
_080390C8: .4byte gUnknown_0859E7C8
_080390CC: .4byte gUnknown_0859E7D4
_080390D0: .4byte gRAMChapterData

	THUMB_FUNC_END sub_803901C

	THUMB_FUNC_START sub_80390D4
sub_80390D4: @ 0x080390D4
	push {r4, r5, lr}
	sub sp, #0x10
	adds r5, r0, #0
	ldr r0, [r5, #0x34]
	adds r1, r0, #1
	str r1, [r5, #0x34]
	cmp r1, #0x2c
	bgt _08039130
	ldr r0, _08039120  @ gUnknown_02003BE8
	lsls r1, r1, #0xc
	add r2, sp, #8
	bl sub_800A950
	ldr r1, [sp, #8]
	asrs r1, r1, #4
	ldr r0, _08039124  @ gUnknown_080D7FD0
	ldr r3, [r5, #0x2c]
	lsls r3, r3, #3
	adds r3, r3, r0
	ldrb r0, [r3]
	lsls r0, r0, #3
	adds r1, r1, r0
	ldr r2, [sp, #0xc]
	asrs r2, r2, #4
	ldrb r0, [r3, #1]
	lsls r0, r0, #3
	adds r2, r2, r0
	ldr r0, _08039128  @ 0x000001FF
	ands r2, r0
	ldr r3, _0803912C  @ gUnknown_0859E79C
	movs r0, #0xa0
	lsls r0, r0, #7
	str r0, [sp]
	movs r0, #4
	bl PutSpriteExt
	b _080391BA
	.align 2, 0
_08039120: .4byte gUnknown_02003BE8
_08039124: .4byte gUnknown_080D7FD0
_08039128: .4byte 0x000001FF
_0803912C: .4byte gUnknown_0859E79C
_08039130:
	ldr r4, [r5, #0x2c]
	cmp r4, #4
	bne _08039164
	ldr r0, _0803915C  @ gUnknown_02003B08
	ldr r1, [r5, #0x30]
	ldr r3, _08039160  @ gUnknown_080D7FD0
	adds r2, r3, #0
	adds r2, #0x44
	ldrb r2, [r2]
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	adds r3, #0x45
	ldrb r3, [r3]
	lsls r3, r3, #0x18
	asrs r3, r3, #0x18
	str r4, [sp]
	movs r4, #1
	str r4, [sp, #4]
	bl sub_8038900
	b _0803919C
	.align 2, 0
_0803915C: .4byte gUnknown_02003B08
_08039160: .4byte gUnknown_080D7FD0
_08039164:
	lsls r0, r4, #6
	ldr r2, _080391C4  @ gUnknown_080D7FD0
	lsls r1, r4, #3
	adds r4, r1, r2
	adds r1, r4, #0
	adds r1, #0x28
	ldrb r2, [r1]
	movs r1, #8
	subs r1, r1, r2
	lsls r1, r1, #3
	ldr r3, _080391C8  @ gUnknown_02003A08
	adds r1, r1, r3
	adds r0, r0, r1
	ldrh r1, [r5, #0x30]
	adds r3, r4, #0
	adds r3, #0x24
	ldrb r3, [r3]
	lsls r3, r3, #0x18
	asrs r3, r3, #0x18
	adds r4, #0x25
	ldrb r4, [r4]
	lsls r4, r4, #0x18
	asrs r4, r4, #0x18
	str r4, [sp]
	movs r4, #4
	str r4, [sp, #4]
	bl sub_8038588
_0803919C:
	ldr r0, _080391CC  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080391AE
	movs r0, #0x76
	bl m4aSongNumStart
_080391AE:
	movs r0, #1
	bl BG_EnableSyncByMask
	adds r0, r5, #0
	bl Proc_Break
_080391BA:
	add sp, #0x10
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080391C4: .4byte gUnknown_080D7FD0
_080391C8: .4byte gUnknown_02003A08
_080391CC: .4byte gRAMChapterData

	THUMB_FUNC_END sub_80390D4

	THUMB_FUNC_START sub_80391D0
sub_80391D0: @ 0x080391D0
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r1, r2, #0
	cmp r1, #0
	beq _080391E8
	ldr r0, _080391E4  @ gUnknown_0859E804
	bl Proc_StartBlocking
	b _080391F0
	.align 2, 0
_080391E4: .4byte gUnknown_0859E804
_080391E8:
	ldr r0, _080391FC  @ gUnknown_0859E804
	movs r1, #3
	bl Proc_Start
_080391F0:
	str r4, [r0, #0x2c]
	str r5, [r0, #0x30]
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080391FC: .4byte gUnknown_0859E804

	THUMB_FUNC_END sub_80391D0

	THUMB_FUNC_START sub_8039200
sub_8039200: @ 0x08039200
	push {r4, r5, lr}
	sub sp, #0xc
	adds r5, r0, #0
	ldr r0, _08039238  @ gUnknown_030017A0
	ldr r2, _0803923C  @ 0x04000003
	mov r1, sp
	bl CpuSet
	bl GetGameClock
	adds r4, r0, #0
	ldr r0, _08039240  @ gUnknown_020038C4
	ldr r0, [r0]
	bl SetGameClock
	mov r0, sp
	bl sub_8037EB0
	adds r0, r4, #0
	bl SetGameClock
	cmp r5, #4
	bhi _08039292
	lsls r0, r5, #2
	ldr r1, _08039244  @ _08039248
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08039238: .4byte gUnknown_030017A0
_0803923C: .4byte 0x04000003
_08039240: .4byte gUnknown_020038C4
_08039244: .4byte _08039248
_08039248: @ jump table
	.4byte _0803925C @ case 0
	.4byte _0803926E @ case 1
	.4byte _08039274 @ case 2
	.4byte _0803927A @ case 3
	.4byte _0803928A @ case 4
_0803925C:
	mov r0, sp
	ldrh r2, [r0, #6]
	lsrs r2, r2, #3
	ldrb r0, [r0, #8]
	movs r1, #7
	ands r0, r1
	lsls r0, r0, #0xd
	orrs r0, r2
	b _08039294
_0803926E:
	mov r0, sp
	ldrh r0, [r0]
	b _08039294
_08039274:
	mov r0, sp
	ldrb r0, [r0, #2]
	b _08039294
_0803927A:
	mov r0, sp
	ldrb r2, [r0, #3]
	ldrb r0, [r0, #4]
	movs r1, #1
	ands r0, r1
	lsls r0, r0, #8
	orrs r0, r2
	b _08039294
_0803928A:
	ldr r0, [sp, #4]
	lsls r0, r0, #0xd
	lsrs r0, r0, #0xe
	b _08039294
_08039292:
	movs r0, #0
_08039294:
	add sp, #0xc
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8039200

	THUMB_FUNC_START sub_803929C
sub_803929C: @ 0x0803929C
	push {lr}
	cmp r0, #4
	bhi _08039358
	lsls r0, r0, #2
	ldr r1, _080392AC  @ _080392B0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080392AC: .4byte _080392B0
_080392B0: @ jump table
	.4byte _080392C4 @ case 0
	.4byte _080392E8 @ case 1
	.4byte _08039300 @ case 2
	.4byte _08039318 @ case 3
	.4byte _0803933C @ case 4
_080392C4:
	ldr r2, _080392E4  @ gUnknown_030017A0
	adds r0, r2, #0
	adds r0, #0x24
	ldrb r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrh r2, [r0, #0x12]
	lsrs r2, r2, #3
	ldrb r0, [r0, #0x14]
	movs r1, #7
	ands r0, r1
	lsls r0, r0, #0xd
	orrs r0, r2
	b _0803935A
	.align 2, 0
_080392E4: .4byte gUnknown_030017A0
_080392E8:
	ldr r2, _080392FC  @ gUnknown_030017A0
	adds r0, r2, #0
	adds r0, #0x24
	ldrb r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrh r0, [r0, #0xc]
	b _0803935A
	.align 2, 0
_080392FC: .4byte gUnknown_030017A0
_08039300:
	ldr r2, _08039314  @ gUnknown_030017A0
	adds r0, r2, #0
	adds r0, #0x24
	ldrb r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r0, [r0, #0xe]
	b _0803935A
	.align 2, 0
_08039314: .4byte gUnknown_030017A0
_08039318:
	ldr r2, _08039338  @ gUnknown_030017A0
	adds r0, r2, #0
	adds r0, #0x24
	ldrb r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r2, [r0, #0xf]
	ldrb r0, [r0, #0x10]
	movs r1, #1
	ands r0, r1
	lsls r0, r0, #8
	orrs r0, r2
	b _0803935A
	.align 2, 0
_08039338: .4byte gUnknown_030017A0
_0803933C:
	ldr r2, _08039354  @ gUnknown_030017A0
	adds r0, r2, #0
	adds r0, #0x24
	ldrb r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r0, [r0, #0x10]
	lsls r0, r0, #0xd
	lsrs r0, r0, #0xe
	b _0803935A
	.align 2, 0
_08039354: .4byte gUnknown_030017A0
_08039358:
	movs r0, #0
_0803935A:
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_803929C

	THUMB_FUNC_START sub_8039360
sub_8039360: @ 0x08039360
	push {r4, r5, r6, lr}
	sub sp, #0xc
	adds r6, r0, #0
	ldr r4, _080393AC  @ gUnknown_030017A0
	ldr r2, _080393B0  @ 0x04000003
	adds r0, r4, #0
	mov r1, sp
	bl CpuSet
	bl GetGameClock
	adds r5, r0, #0
	ldr r0, _080393B4  @ gUnknown_020038C4
	ldr r0, [r0]
	bl SetGameClock
	mov r0, sp
	bl sub_8037EB0
	adds r0, r5, #0
	bl SetGameClock
	adds r0, r4, #0
	adds r0, #0x24
	ldrb r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r4, #0xc
	adds r4, r0, r4
	cmp r6, #4
	bhi _08039432
	lsls r0, r6, #2
	ldr r1, _080393B8  @ _080393BC
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080393AC: .4byte gUnknown_030017A0
_080393B0: .4byte 0x04000003
_080393B4: .4byte gUnknown_020038C4
_080393B8: .4byte _080393BC
_080393BC: @ jump table
	.4byte _080393DA @ case 0
	.4byte _080393D0 @ case 1
	.4byte _080393DE @ case 2
	.4byte _080393F4 @ case 3
	.4byte _08039418 @ case 4
_080393D0:
	mov r0, sp
	ldrh r0, [r0]
	ldrh r4, [r4]
	cmp r0, r4
	bls _08039432
_080393DA:
	movs r0, #1
	b _08039434
_080393DE:
	ldrh r0, [r4, #8]
	lsls r0, r0, #0x16
	lsrs r0, r0, #0x19
	cmp r0, #0
	ble _080393DA
	mov r0, sp
	ldrb r0, [r0, #2]
	ldrb r4, [r4, #2]
	cmp r0, r4
	bcs _08039432
	b _080393DA
_080393F4:
	ldrh r0, [r4, #8]
	lsls r0, r0, #0x16
	lsrs r0, r0, #0x19
	cmp r0, #0
	ble _080393DA
	mov r0, sp
	ldrb r3, [r0, #3]
	ldrb r1, [r0, #4]
	movs r2, #1
	ands r1, r2
	lsls r1, r1, #8
	orrs r1, r3
	ldrb r3, [r4, #3]
	ldrb r0, [r4, #4]
	ands r0, r2
	lsls r0, r0, #8
	orrs r0, r3
	b _0803942E
_08039418:
	ldrh r0, [r4, #8]
	lsls r0, r0, #0x16
	lsrs r0, r0, #0x19
	cmp r0, #0
	ble _080393DA
	ldr r1, [sp, #4]
	lsls r1, r1, #0xd
	lsrs r1, r1, #0xe
	ldr r0, [r4, #4]
	lsls r0, r0, #0xd
	lsrs r0, r0, #0xe
_0803942E:
	cmp r1, r0
	blt _080393DA
_08039432:
	movs r0, #0
_08039434:
	add sp, #0xc
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8039360

	THUMB_FUNC_START sub_803943C
sub_803943C: @ 0x0803943C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08039478  @ gUnknown_02003B48
	bl sub_8038F78
	ldr r1, _0803947C  @ gUnknown_02003BE8
	movs r2, #0
	movs r0, #2
	strh r0, [r1]
	movs r0, #5
	strh r0, [r1, #2]
	ldr r0, _08039480  @ gUnknown_0859E82C
	str r0, [r1, #4]
	ldr r0, _08039484  @ gUnknown_0859E838
	str r0, [r1, #8]
	str r2, [r1, #0xc]
	str r2, [r1, #0x10]
	str r2, [r4, #0x38]
	ldr r0, _08039488  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08039472
	movs r0, #0x80
	bl m4aSongNumStart
_08039472:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08039478: .4byte gUnknown_02003B48
_0803947C: .4byte gUnknown_02003BE8
_08039480: .4byte gUnknown_0859E82C
_08039484: .4byte gUnknown_0859E838
_08039488: .4byte gRAMChapterData

	THUMB_FUNC_END sub_803943C

	THUMB_FUNC_START sub_803948C
sub_803948C: @ 0x0803948C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080394A4  @ gUnknown_02003B48
	movs r1, #8
	bl sub_8038668
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080394A4: .4byte gUnknown_02003B48

	THUMB_FUNC_END sub_803948C

	THUMB_FUNC_START sub_80394A8
sub_80394A8: @ 0x080394A8
	push {r4, r5, lr}
	sub sp, #0x1c
	adds r4, r0, #0
	ldr r0, [r4, #0x38]
	adds r1, r0, #1
	str r1, [r4, #0x38]
	cmp r1, #0x1d
	bgt _080394E8
	ldr r0, _080394E0  @ gUnknown_02003BE8
	lsls r1, r1, #0xc
	add r4, sp, #0x14
	adds r2, r4, #0
	bl sub_800A950
	ldr r1, [sp, #0x14]
	asrs r1, r1, #4
	ldr r2, [r4, #4]
	lsls r2, r2, #0x13
	lsrs r2, r2, #0x17
	ldr r3, _080394E4  @ gUnknown_0859E79C
	movs r0, #0xa0
	lsls r0, r0, #7
	str r0, [sp]
	movs r0, #4
	bl PutSpriteExt
	b _0803953E
	.align 2, 0
_080394E0: .4byte gUnknown_02003BE8
_080394E4: .4byte gUnknown_0859E79C
_080394E8:
	ldr r2, _08039548  @ gUnknown_030017A0
	adds r0, r2, #0
	adds r0, #0x24
	ldrb r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	add r1, sp, #8
	adds r0, #0xc
	ldm r0!, {r2, r3, r5}
	stm r1!, {r2, r3, r5}
	add r0, sp, #8
	ldrh r0, [r0, #8]
	lsls r0, r0, #0x16
	lsrs r1, r0, #0x19
	cmp r1, #0x63
	bgt _0803950E
	adds r1, #1
_0803950E:
	ldr r0, _0803954C  @ gUnknown_02003B70
	movs r2, #7
	str r2, [sp]
	movs r2, #2
	str r2, [sp, #4]
	movs r2, #3
	movs r3, #0x1a
	bl sub_8038588
	movs r0, #1
	bl BG_EnableSyncByMask
	ldr r0, _08039550  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08039538
	movs r0, #0x76
	bl m4aSongNumStart
_08039538:
	adds r0, r4, #0
	bl Proc_Break
_0803953E:
	add sp, #0x1c
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08039548: .4byte gUnknown_030017A0
_0803954C: .4byte gUnknown_02003B70
_08039550: .4byte gRAMChapterData

	THUMB_FUNC_END sub_80394A8

	THUMB_FUNC_START sub_8039554
sub_8039554: @ 0x08039554
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0
	bl sub_803929C
	str r0, [r4, #0x30]
	movs r0, #0
	bl sub_8039200
	ldr r1, [r4, #0x30]
	adds r0, r0, r1
	str r0, [r4, #0x34]
	movs r0, #2
	str r0, [r4, #0x3c]
	ldr r0, _08039588  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08039582
	movs r0, #0x74
	bl m4aSongNumStart
_08039582:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08039588: .4byte gRAMChapterData

	THUMB_FUNC_END sub_8039554

	THUMB_FUNC_START sub_803958C
sub_803958C: @ 0x0803958C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	adds r7, r0, #0
	ldr r0, [r7, #0x30]
	adds r1, r0, #1
	str r1, [r7, #0x30]
	ldr r0, [r7, #0x34]
	subs r0, r0, r1
	cmp r0, #0x64
	ble _080395A8
	adds r0, r1, #1
	str r0, [r7, #0x30]
_080395A8:
	ldr r0, _08039630  @ gUnknown_080D7FD0
	mov r8, r0
	adds r0, #0x28
	ldrb r2, [r0]
	movs r5, #8
	subs r0, r5, r2
	lsls r0, r0, #3
	ldr r6, _08039634  @ gUnknown_02003A08
	adds r0, r0, r6
	ldrh r1, [r7, #0x30]
	mov r3, r8
	adds r3, #0x24
	ldrb r3, [r3]
	lsls r3, r3, #0x18
	asrs r3, r3, #0x18
	mov r4, r8
	adds r4, #0x25
	ldrb r4, [r4]
	lsls r4, r4, #0x18
	asrs r4, r4, #0x18
	str r4, [sp]
	movs r4, #2
	str r4, [sp, #4]
	bl sub_8038588
	mov r0, r8
	ldrb r2, [r0, #4]
	subs r5, r5, r2
	lsls r5, r5, #3
	ldr r0, _08039638  @ 0xFFFFFEC0
	adds r6, r6, r0
	adds r5, r5, r6
	ldr r1, [r7, #0x34]
	ldr r0, [r7, #0x30]
	subs r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov r6, r8
	movs r3, #0
	ldrsb r3, [r6, r3]
	movs r0, #1
	ldrsb r0, [r6, r0]
	str r0, [sp]
	str r4, [sp, #4]
	adds r0, r5, #0
	bl sub_8038588
	movs r0, #1
	bl BG_EnableSyncByMask
	ldr r0, [r7, #0x3c]
	cmp r0, #0
	ble _08039616
	subs r0, #1
	str r0, [r7, #0x3c]
_08039616:
	ldr r1, [r7, #0x30]
	ldr r0, [r7, #0x34]
	cmp r1, r0
	blt _08039624
	adds r0, r7, #0
	bl Proc_Break
_08039624:
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08039630: .4byte gUnknown_080D7FD0
_08039634: .4byte gUnknown_02003A08
_08039638: .4byte 0xFFFFFEC0

	THUMB_FUNC_END sub_803958C

	THUMB_FUNC_START sub_803963C
sub_803963C: @ 0x0803963C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x3c]
	cmp r0, #0
	bgt _08039654
	movs r0, #0x74
	bl m4aSongNumStop
	adds r0, r4, #0
	bl Proc_Break
	b _08039658
_08039654:
	subs r0, #1
	str r0, [r4, #0x3c]
_08039658:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_803963C

	THUMB_FUNC_START sub_8039660
sub_8039660: @ 0x08039660
	movs r1, #1
	str r1, [r0, #0x2c]
	bx lr

	THUMB_FUNC_END sub_8039660

	THUMB_FUNC_START sub_8039668
sub_8039668: @ 0x08039668
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x2c]
	bl sub_8039360
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803968A
	ldr r4, [r5, #0x2c]
	adds r0, r4, #0
	bl sub_8039200
	adds r1, r0, #0
	adds r0, r4, #0
	adds r2, r5, #0
	bl sub_80391D0
_0803968A:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8039668

	THUMB_FUNC_START sub_8039690
sub_8039690: @ 0x08039690
	push {lr}
	adds r1, r0, #0
	ldr r0, [r1, #0x2c]
	adds r0, #1
	str r0, [r1, #0x2c]
	cmp r0, #4
	bgt _080396A6
	adds r0, r1, #0
	movs r1, #1
	bl Proc_Goto
_080396A6:
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8039690

.align 2, 0
