	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	@ Functions managing checking for event activations and such
	@ This is what reads codes such as TURN, CHAR or LOCA ("""main codes""")
	@ Also includes getters for knowing who is force deployed when

	THUMB_FUNC_START CallEventsFromBuffer
CallEventsFromBuffer: @ 0x08082E80
	push {r4, r5, lr}
	adds r4, r0, #0
	lsls r1, r1, #0x18
	lsrs r5, r1, #0x18
	ldr r0, [r4, #4]
	cmp r0, #0
	beq _08082EBE
	ldr r0, [r4, #8]
	bl SetEventId
	ldr r0, [r4, #4]
	cmp r0, #1
	beq _08082EBE
	ldrh r1, [r4, #8]
	bl sub_80845B8
	ldr r0, [r4, #4]
	adds r1, r5, #0
	bl CallEvent
	movs r0, #3
	bl CheckEventId
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08082EBE
	bl sub_8019108
	movs r0, #0x84
	bl SetEventId
_08082EBE:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END CallEventsFromBuffer

	THUMB_FUNC_START CheckForEvents
CheckForEvents: @ 0x08082EC4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	movs r0, #0
	str r0, [r4, #4]
	str r0, [r4, #8]
	ldr r7, _08082F0C  @ gUnknown_089E84F4
	adds r0, r7, #4
	mov r8, r0
_08082ED8:
	ldr r0, [r4]
	ldrh r5, [r0]
	adds r6, r5, #0
	ldrh r0, [r0, #2]
	bl CheckEventId
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08082EFA
	lsls r0, r5, #3
	adds r0, r0, r7
	ldr r1, [r0]
	adds r0, r4, #0
	bl _call_via_r1
	cmp r0, #1
	beq _08082F10
_08082EFA:
	lsls r0, r6, #3
	add r0, r8
	ldr r1, [r0]
	lsls r1, r1, #2
	ldr r0, [r4]
	adds r0, r0, r1
	str r0, [r4]
	b _08082ED8
	.align 2, 0
_08082F0C: .4byte gUnknown_089E84F4
_08082F10:
	ldr r0, [r4, #4]
	cmp r0, #0
	bne _08082F1A
	movs r0, #0
	b _08082F1C
_08082F1A:
	adds r0, r4, #0
_08082F1C:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END CheckForEvents

	THUMB_FUNC_START CheckForNextEvents
CheckForNextEvents: @ 0x08082F28
	push {lr}
	adds r3, r0, #0
	cmp r3, #0
	bne _08082F34
	movs r0, #0
	b _08082F4E
_08082F34:
	ldr r2, [r3]
	ldrh r1, [r2]
	ldr r0, _08082F54  @ gUnknown_089E84F4
	lsls r1, r1, #3
	adds r0, #4
	adds r1, r1, r0
	ldr r0, [r1]
	lsls r0, r0, #2
	adds r2, r2, r0
	str r2, [r3]
	adds r0, r3, #0
	bl CheckForEvents
_08082F4E:
	pop {r1}
	bx r1
	.align 2, 0
_08082F54: .4byte gUnknown_089E84F4

	THUMB_FUNC_END CheckForNextEvents

	THUMB_FUNC_START sub_8082F58
sub_8082F58: @ 0x08082F58
	push {lr}
	adds r3, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	ldrb r0, [r3, #0x1a]
	cmp r0, r1
	bne _08082F7E
	ldrb r0, [r3, #0x1b]
	cmp r0, r2
	bne _08082F7E
	ldr r0, [r3]
	ldr r1, [r0, #4]
	str r1, [r3, #4]
	ldrh r0, [r0, #2]
	str r0, [r3, #8]
	movs r0, #1
	b _08082F80
_08082F7E:
	movs r0, #0
_08082F80:
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8082F58

	THUMB_FUNC_START sub_8082F84
sub_8082F84: @ 0x08082F84
	push {r4, r5, lr}
	adds r5, r1, #0
	adds r4, r2, #0
	ldr r1, _08082FAC  @ gActiveUnit
	ldr r2, [r1]
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	cmp r1, r0
	blt _08082FB0
	cmp r1, r4
	bgt _08082FB0
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	cmp r1, r5
	blt _08082FB0
	cmp r1, r3
	bgt _08082FB0
	movs r0, #1
	b _08082FB2
	.align 2, 0
_08082FAC: .4byte gActiveUnit
_08082FB0:
	movs r0, #0
_08082FB2:
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8082F84

	THUMB_FUNC_START sub_8082FB8
sub_8082FB8: @ 0x08082FB8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	adds r7, r1, #0
	adds r6, r2, #0
	adds r5, r3, #0
	movs r4, #1
_08082FC8:
	adds r0, r4, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq _08083004
	ldr r0, [r2]
	cmp r0, #0
	beq _08083004
	ldr r0, [r2, #0xc]
	ldr r1, _08083000  @ 0x00010004
	ands r0, r1
	cmp r0, #0
	bne _08083004
	movs r0, #0x10
	ldrsb r0, [r2, r0]
	cmp r0, r8
	blt _08083004
	cmp r0, r6
	bgt _08083004
	movs r0, #0x11
	ldrsb r0, [r2, r0]
	cmp r0, r7
	blt _08083004
	cmp r0, r5
	bgt _08083004
	movs r0, #1
	b _0808300C
	.align 2, 0
_08083000: .4byte 0x00010004
_08083004:
	adds r4, #1
	cmp r4, #0x3f
	ble _08082FC8
	movs r0, #0
_0808300C:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8082FB8

	THUMB_FUNC_START sub_8083018
sub_8083018: @ 0x08083018
	push {lr}
	ldr r0, _08083038  @ gRAMChapterData
	ldrb r0, [r0, #0xf]
	cmp r0, #0x80
	bne _0808303C
	movs r0, #0
	movs r1, #0xf
	movs r2, #0x19
	movs r3, #0x17
	bl sub_8082FB8
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0808303C
	movs r0, #1
	b _0808303E
	.align 2, 0
_08083038: .4byte gRAMChapterData
_0808303C:
	movs r0, #0
_0808303E:
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8083018

	THUMB_FUNC_START sub_8083044
sub_8083044: @ 0x08083044
	push {lr}
	ldr r0, _08083088  @ gRAMChapterData
	ldrb r0, [r0, #0xf]
	cmp r0, #0x80
	bne _08083084
	movs r0, #0
	movs r1, #0x18
	movs r2, #0x10
	movs r3, #0x1b
	bl sub_8082FB8
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0808308C
	movs r0, #0
	movs r1, #0x15
	movs r2, #2
	movs r3, #0x17
	bl sub_8082FB8
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0808308C
	movs r0, #3
	movs r1, #0x14
	movs r2, #5
	movs r3, #0x16
	bl sub_8082FB8
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0808308C
_08083084:
	movs r0, #0
	b _0808308E
	.align 2, 0
_08083088: .4byte gRAMChapterData
_0808308C:
	movs r0, #1
_0808308E:
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8083044

	THUMB_FUNC_START sub_8083094
sub_8083094: @ 0x08083094
	push {lr}
	movs r0, #0xc
	movs r1, #0x15
	movs r2, #0x1f
	movs r3, #0x18
	bl sub_8082FB8
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8083094

	THUMB_FUNC_START sub_80830AC
sub_80830AC: @ 0x080830AC
	push {lr}
	ldr r0, _080830C8  @ gRAMChapterData
	ldrb r0, [r0, #0xf]
	cmp r0, #0x80
	bne _080830CC
	movs r0, #0x11
	movs r1, #0x15
	movs r2, #0x1f
	movs r3, #0x23
	bl sub_8082FB8
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	b _080830CE
	.align 2, 0
_080830C8: .4byte gRAMChapterData
_080830CC:
	movs r0, #0
_080830CE:
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80830AC

	THUMB_FUNC_START sub_80830D4
sub_80830D4: @ 0x080830D4
	push {lr}
	ldr r0, _080830F0  @ gRAMChapterData
	ldrb r0, [r0, #0xf]
	cmp r0, #0x80
	bne _080830F4
	movs r0, #0
	movs r1, #0xf
	movs r2, #8
	movs r3, #0x12
	bl sub_8082FB8
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	b _080830F6
	.align 2, 0
_080830F0: .4byte gRAMChapterData
_080830F4:
	movs r0, #0
_080830F6:
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80830D4

	THUMB_FUNC_START sub_80830FC
sub_80830FC: @ 0x080830FC
	push {lr}
	ldr r0, _08083118  @ gRAMChapterData
	ldrb r0, [r0, #0xf]
	cmp r0, #0x80
	bne _0808311C
	movs r0, #0
	movs r1, #0x18
	movs r2, #0xc
	movs r3, #0x1b
	bl sub_8082FB8
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	b _0808311E
	.align 2, 0
_08083118: .4byte gRAMChapterData
_0808311C:
	movs r0, #0
_0808311E:
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80830FC

	THUMB_FUNC_START sub_8083124
sub_8083124: @ 0x08083124
	push {lr}
	ldr r0, _08083140  @ gRAMChapterData
	ldrb r0, [r0, #0xf]
	cmp r0, #0x80
	bne _08083144
	movs r0, #0x15
	movs r1, #0
	movs r2, #0x1e
	movs r3, #6
	bl sub_8082FB8
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	b _08083146
	.align 2, 0
_08083140: .4byte gRAMChapterData
_08083144:
	movs r0, #0
_08083146:
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8083124

	THUMB_FUNC_START sub_808314C
sub_808314C: @ 0x0808314C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	adds r7, r1, #0
	adds r6, r2, #0
	adds r5, r3, #0
	movs r4, #0x81
_0808315C:
	adds r0, r4, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq _08083198
	ldr r0, [r2]
	cmp r0, #0
	beq _08083198
	ldr r0, [r2, #0xc]
	ldr r1, _08083194  @ 0x00010004
	ands r0, r1
	cmp r0, #0
	bne _08083198
	movs r0, #0x10
	ldrsb r0, [r2, r0]
	cmp r0, r8
	blt _08083198
	cmp r0, r6
	bgt _08083198
	movs r0, #0x11
	ldrsb r0, [r2, r0]
	cmp r0, r7
	blt _08083198
	cmp r0, r5
	bgt _08083198
	movs r0, #1
	b _080831A0
	.align 2, 0
_08083194: .4byte 0x00010004
_08083198:
	adds r4, #1
	cmp r4, #0xbf
	ble _0808315C
	movs r0, #0
_080831A0:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_808314C

	THUMB_FUNC_START IsThereClosedChestAt
IsThereClosedChestAt: @ 0x080831AC
	push {lr}
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl GetAvailableLocaCommandAt
	cmp r0, #0x14
	beq _080831C2
	movs r0, #0
	b _080831C4
_080831C2:
	movs r0, #1
_080831C4:
	pop {r1}
	bx r1

	THUMB_FUNC_END IsThereClosedChestAt

	THUMB_FUNC_START sub_80831C8
sub_80831C8: @ 0x080831C8
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	asrs r5, r0, #0x18
	lsls r1, r1, #0x18
	asrs r4, r1, #0x18
	adds r0, r5, #0
	adds r1, r4, #0
	bl IsThereClosedChestAt
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080831E8
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_80840C4
_080831E8:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80831C8

	THUMB_FUNC_START IsThereClosedDoorAt
IsThereClosedDoorAt: @ 0x080831F0
	push {lr}
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl GetAvailableLocaCommandAt
	cmp r0, #0x12
	beq _08083206
	movs r0, #0
	b _08083208
_08083206:
	movs r0, #1
_08083208:
	pop {r1}
	bx r1

	THUMB_FUNC_END IsThereClosedDoorAt

	THUMB_FUNC_START sub_808320C
sub_808320C: @ 0x0808320C
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	asrs r5, r0, #0x18
	lsls r1, r1, #0x18
	asrs r4, r1, #0x18
	adds r0, r5, #0
	adds r1, r4, #0
	bl IsThereClosedDoorAt
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0808322C
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_80840C4
_0808322C:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_808320C

	THUMB_FUNC_START sub_8083234
sub_8083234: @ 0x08083234
	push {lr}
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl GetAvailableLocaCommandAt
	cmp r0, #0x15
	beq _0808324A
	movs r0, #0
	b _0808324C
_0808324A:
	movs r0, #1
_0808324C:
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8083234

	THUMB_FUNC_START sub_8083250
sub_8083250: @ 0x08083250
	push {lr}
	bl GetChapterThing
	cmp r0, #2
	beq _08083264
	bl CheckEventId3
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	b _08083266
_08083264:
	movs r0, #0
_08083266:
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8083250

	THUMB_FUNC_START sub_808326C
sub_808326C: @ 0x0808326C
	push {lr}
	bl GetChapterThing
	cmp r0, #2
	beq _0808327A
	bl sub_80832E8
_0808327A:
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_808326C

	THUMB_FUNC_START sub_8083280
sub_8083280: @ 0x08083280
	push {r4, lr}
	ldr r0, _080832A4  @ gRAMChapterData
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetChapterEventDataPointer
	adds r4, r0, #0
	bl GetChapterThing
	cmp r0, #2
	beq _080832A8
	ldr r0, [r4, #0x4c]
	movs r1, #1
	bl CallEvent
	b _080832B0
	.align 2, 0
_080832A4: .4byte gRAMChapterData
_080832A8:
	ldr r0, _080832C0  @ gUnknown_089FFD64
	movs r1, #1
	bl CallEvent
_080832B0:
	bl sub_8019108
	movs r0, #0x84
	bl SetEventId
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080832C0: .4byte gUnknown_089FFD64

	THUMB_FUNC_END sub_8083280

	THUMB_FUNC_START sub_80832C4
sub_80832C4: @ 0x080832C4
	movs r0, #0
	bx lr

	THUMB_FUNC_END sub_80832C4

	THUMB_FUNC_START sub_80832C8
sub_80832C8: @ 0x080832C8
	movs r0, #0
	bx lr

	THUMB_FUNC_END sub_80832C8

	THUMB_FUNC_START sub_80832CC
sub_80832CC: @ 0x080832CC
	movs r0, #0
	bx lr

	THUMB_FUNC_END sub_80832CC

	THUMB_FUNC_START sub_80832D0
sub_80832D0: @ 0x080832D0
	movs r0, #0
	bx lr

	THUMB_FUNC_END sub_80832D0

	THUMB_FUNC_START sub_80832D4
sub_80832D4: @ 0x080832D4
	movs r0, #0
	bx lr

	THUMB_FUNC_END sub_80832D4

	THUMB_FUNC_START CheckEventId3
CheckEventId3: @ 0x080832D8
	push {lr}
	movs r0, #3
	bl CheckEventId
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	THUMB_FUNC_END CheckEventId3

	THUMB_FUNC_START sub_80832E8
sub_80832E8: @ 0x080832E8
	push {lr}
	movs r0, #3
	bl CheckEventId
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08083304
	bl sub_8083250
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08083304
	bl sub_8083280
_08083304:
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80832E8

	THUMB_FUNC_START GetCurrentChapterBallistaePtr
GetCurrentChapterBallistaePtr: @ 0x08083308
	push {lr}
	ldr r0, _0808331C  @ gRAMChapterData
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetChapterEventDataPointer
	ldr r0, [r0, #0x20]
	pop {r1}
	bx r1
	.align 2, 0
_0808331C: .4byte gRAMChapterData

	THUMB_FUNC_END GetCurrentChapterBallistaePtr

	THUMB_FUNC_START GetCurrentChapterBallistae2Ptr
GetCurrentChapterBallistae2Ptr: @ 0x08083320
	push {r4, lr}
	ldr r4, _0808333C  @ gRAMChapterData
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	bl GetChapterEventDataPointer
	adds r2, r0, #0
	ldrb r1, [r4, #0x14]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	bne _08083340
	movs r0, #0
	b _08083342
	.align 2, 0
_0808333C: .4byte gRAMChapterData
_08083340:
	ldr r0, [r2, #0x24]
_08083342:
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END GetCurrentChapterBallistae2Ptr

	THUMB_FUNC_START GetChapterAllyUnitDataPointer
GetChapterAllyUnitDataPointer: @ 0x08083348
	push {r4, r5, lr}
	ldr r5, _08083370  @ gRAMChapterData
	movs r0, #0xe
	ldrsb r0, [r5, r0]
	bl GetChapterEventDataPointer
	adds r4, r0, #0
	bl GetChapterThing
	adds r1, r0, #0
	cmp r1, #2
	beq _08083378
	ldrb r1, [r5, #0x14]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08083374
	ldr r0, [r4, #0x2c]
	b _080833A8
	.align 2, 0
_08083370: .4byte gRAMChapterData
_08083374:
	ldr r0, [r4, #0x28]
	b _080833A8
_08083378:
	ldr r1, _08083394  @ gUnknown_03005280
	adds r2, r1, #0
	adds r2, #0xcc
	adds r1, #0xc9
	ldrb r2, [r2]
	adds r1, r1, r2
	ldrb r1, [r1]
	cmp r1, #1
	beq _080833A2
	cmp r1, #1
	bgt _08083398
	cmp r1, #0
	beq _0808339E
	b _080833A8
	.align 2, 0
_08083394: .4byte gUnknown_03005280
_08083398:
	cmp r1, #2
	beq _080833A6
	b _080833A8
_0808339E:
	ldr r0, [r4, #0x30]
	b _080833A8
_080833A2:
	ldr r0, [r4, #0x34]
	b _080833A8
_080833A6:
	ldr r0, [r4, #0x38]
_080833A8:
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END GetChapterAllyUnitDataPointer

	THUMB_FUNC_START sub_80833B0
sub_80833B0: @ 0x080833B0
	push {lr}
	ldr r0, _080833E0  @ gRAMChapterData
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetChapterEventDataPointer
	adds r2, r0, #0
	movs r3, #0
	ldr r0, _080833E4  @ gUnknown_03005280
	adds r1, r0, #0
	adds r1, #0xcc
	adds r0, #0xc9
	ldrb r1, [r1]
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #1
	beq _080833F2
	cmp r0, #1
	bgt _080833E8
	cmp r0, #0
	beq _080833EE
	b _080833F8
	.align 2, 0
_080833E0: .4byte gRAMChapterData
_080833E4: .4byte gUnknown_03005280
_080833E8:
	cmp r0, #2
	beq _080833F6
	b _080833F8
_080833EE:
	ldr r3, [r2, #0x3c]
	b _080833F8
_080833F2:
	ldr r3, [r2, #0x40]
	b _080833F8
_080833F6:
	ldr r3, [r2, #0x44]
_080833F8:
	adds r0, r3, #0
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80833B0

	THUMB_FUNC_START sub_8083400
sub_8083400: @ 0x08083400
	push {r4, lr}
	adds r4, r1, #0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl GetChapterEventDataPointer
	ldr r1, [r0, #0x3c]
	ldrb r1, [r1, #1]
	strb r1, [r4]
	ldr r1, [r0, #0x40]
	ldrb r1, [r1, #1]
	strb r1, [r4, #1]
	ldr r0, [r0, #0x44]
	ldrb r0, [r0, #1]
	strb r0, [r4, #2]
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8083400

	THUMB_FUNC_START sub_8083424
sub_8083424: @ 0x08083424
	push {lr}
	ldr r0, _0808345C  @ gRAMChapterData
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetChapterEventDataPointer
	adds r1, r0, #0
	ldr r0, [r1, #0x30]
	cmp r0, #0
	beq _08083460
	ldr r0, [r1, #0x34]
	cmp r0, #0
	beq _08083460
	ldr r0, [r1, #0x38]
	cmp r0, #0
	beq _08083460
	ldr r0, [r1, #0x3c]
	cmp r0, #0
	beq _08083460
	ldr r0, [r1, #0x40]
	cmp r0, #0
	beq _08083460
	ldr r0, [r1, #0x44]
	cmp r0, #0
	beq _08083460
	movs r0, #1
	b _08083462
	.align 2, 0
_0808345C: .4byte gRAMChapterData
_08083460:
	movs r0, #0
_08083462:
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8083424

	THUMB_FUNC_START sub_8083468
sub_8083468: @ 0x08083468
	push {r4, r5, lr}
	adds r4, r1, #0
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	b _080834A2
_08083472:
	ldr r0, [r4, #8]
	bl CheckEventId
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080834A0
	ldrb r0, [r4]
	cmp r5, r0
	bne _080834A0
	ldrb r0, [r4, #1]
	cmp r0, #0x4f
	beq _08083498
	ldr r0, _0808349C  @ gRAMChapterData
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldrb r1, [r4, #1]
	cmp r0, r1
	bne _080834A0
_08083498:
	adds r0, r4, #0
	b _080834AA
	.align 2, 0
_0808349C: .4byte gRAMChapterData
_080834A0:
	adds r4, #0xc
_080834A2:
	ldrb r0, [r4]
	cmp r0, #0
	bne _08083472
	movs r0, #0
_080834AA:
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8083468

	THUMB_FUNC_START ShouldCallBattleQuote
ShouldCallBattleQuote: @ 0x080834B0
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	adds r6, r5, #0
	lsls r1, r1, #0x18
	lsrs r4, r1, #0x18
	adds r7, r4, #0
	bl GetChapterThing
	cmp r0, #2
	beq _080834F2
	ldr r0, _080834F8  @ gActionData
	ldrb r0, [r0, #0x11]
	cmp r0, #2
	bne _080834F2
	adds r0, r5, #0
	adds r1, r4, #0
	bl GetBattleQuoteEntry
	cmp r0, #0
	bne _080834FC
	adds r0, r6, #0
	movs r1, #0
	bl GetBattleQuoteEntry
	cmp r0, #0
	bne _080834FC
	movs r0, #0
	adds r1, r7, #0
	bl GetBattleQuoteEntry
	cmp r0, #0
	bne _080834FC
_080834F2:
	movs r0, #0
	b _080834FE
	.align 2, 0
_080834F8: .4byte gActionData
_080834FC:
	movs r0, #1
_080834FE:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END ShouldCallBattleQuote

	THUMB_FUNC_START CallBattleQuoteEventsIfAny
CallBattleQuoteEventsIfAny: @ 0x08083504
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r6, r1, #0x18
	bl GetChapterThing
	cmp r0, #2
	beq _08083568
	ldr r0, _08083554  @ gActionData
	ldrb r0, [r0, #0x11]
	cmp r0, #2
	bne _08083568
	adds r0, r5, #0
	adds r1, r6, #0
	bl GetBattleQuoteEntry
	adds r4, r0, #0
	cmp r4, #0
	bne _08083548
	adds r0, r5, #0
	movs r1, #0
	bl GetBattleQuoteEntry
	adds r4, r0, #0
	cmp r4, #0
	bne _08083548
	movs r0, #0
	adds r1, r6, #0
	bl GetBattleQuoteEntry
	adds r4, r0, #0
	cmp r4, #0
	beq _08083568
_08083548:
	ldrh r0, [r4, #8]
	cmp r0, #0
	beq _08083558
	bl CallBattleQuoteEventInBattle
	b _08083562
	.align 2, 0
_08083554: .4byte gActionData
_08083558:
	ldr r0, [r4, #0xc]
	cmp r0, #0
	beq _08083562
	bl EventEngine_CreateBattle
_08083562:
	ldrh r0, [r4, #6]
	bl SetEventId
_08083568:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END CallBattleQuoteEventsIfAny

	THUMB_FUNC_START sub_8083570
sub_8083570: @ 0x08083570
	push {r4, r5, lr}
	adds r4, r1, #0
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	bl GetChapterThing
	cmp r0, #0
	beq _08083598
	ldr r0, _080835A4  @ gRAMChapterData
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetROMChapterStruct
	adds r0, #0x8e
	ldrb r0, [r0]
	cmp r5, r0
	bne _08083598
	cmp r4, #0x65
	beq _0808359E
_08083598:
	adds r0, r4, #0
	bl SetEventId
_0808359E:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080835A4: .4byte gRAMChapterData

	THUMB_FUNC_END sub_8083570

	THUMB_FUNC_START sub_80835A8
sub_80835A8: @ 0x080835A8
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r0, r4, #0
	bl sub_80846E4
	adds r1, r0, #0
	cmp r1, #0
	beq _080835D4
	ldrh r0, [r1, #6]
	cmp r0, #0
	bne _080835D0
	ldr r0, [r1, #8]
	cmp r0, #0
	bne _080835D0
	ldrh r1, [r1, #4]
	adds r0, r4, #0
	bl sub_8083570
	b _080835D4
_080835D0:
	movs r0, #1
	b _080835D6
_080835D4:
	movs r0, #0
_080835D6:
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80835A8

	THUMB_FUNC_START sub_80835DC
sub_80835DC: @ 0x080835DC
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	adds r0, r5, #0
	bl sub_80846E4
	adds r4, r0, #0
	cmp r4, #0
	beq _0808364E
	ldrb r0, [r4, #2]
	cmp r0, #1
	bne _08083614
	ldrh r0, [r4, #4]
	cmp r0, #0x65
	bne _08083614
	movs r0, #0x3e
	movs r1, #0
	bl Sound_PlaySong80024D4
	ldr r0, _08083610  @ gRAMChapterData
	adds r0, #0x41
	ldrb r1, [r0]
	movs r2, #1
	orrs r1, r2
	strb r1, [r0]
	b _08083630
	.align 2, 0
_08083610: .4byte gRAMChapterData
_08083614:
	adds r0, r5, #0
	bl GetUnitFromCharId
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #0xc0
	ands r0, r1
	cmp r0, #0
	bne _08083630
	movs r0, #0x3f
	movs r1, #0
	bl Sound_PlaySong80024D4
_08083630:
	ldrh r0, [r4, #6]
	cmp r0, #0
	beq _0808363C
	bl CallBattleQuoteEventInBattle
	b _08083646
_0808363C:
	ldr r0, [r4, #8]
	cmp r0, #0
	beq _08083646
	bl EventEngine_CreateBattle
_08083646:
	ldrh r1, [r4, #4]
	adds r0, r5, #0
	bl sub_8083570
_0808364E:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80835DC

	THUMB_FUNC_START sub_8083654
sub_8083654: @ 0x08083654
	push {r4, r5, r6, lr}
	sub sp, #8
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	movs r5, #1
_0808365E:
	adds r0, r5, #0
	bl GetUnit
	adds r4, r0, #0
	cmp r4, #0
	beq _0808370C
	ldr r0, [r4]
	cmp r0, #0
	beq _0808370C
	ldrb r0, [r0, #4]
	cmp r0, r6
	bne _0808370C
	ldr r0, [r4, #0xc]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	bne _0808370C
	lsls r0, r6, #0x18
	lsrs r0, r0, #0x18
	movs r1, #0
	movs r2, #7
	bl BWL_AddWinOrLossIdk
	adds r0, r4, #0
	bl UnitKill
	adds r0, r4, #0
	movs r1, #0
	bl SetUnitHp
	ldr r2, _08083704  @ gBattleActor
	movs r1, #0xb
	ldrsb r1, [r2, r1]
	movs r0, #0xb
	ldrsb r0, [r4, r0]
	cmp r1, r0
	bne _080836B2
	adds r0, r2, #0
	adds r1, r4, #0
	movs r2, #0x48
	bl memcpy
_080836B2:
	ldr r2, _08083708  @ gBattleTarget
	movs r1, #0xb
	ldrsb r1, [r2, r1]
	movs r0, #0xb
	ldrsb r0, [r4, r0]
	cmp r1, r0
	bne _080836CA
	adds r0, r2, #0
	adds r1, r4, #0
	movs r2, #0x48
	bl memcpy
_080836CA:
	ldr r0, [r4, #0xc]
	movs r1, #0x20
	ands r0, r1
	cmp r0, #0
	beq _080836E2
	ldrb r0, [r4, #0x1b]
	bl GetUnit
	movs r1, #0
	movs r2, #0
	bl UnitDrop
_080836E2:
	ldr r0, [r4, #0xc]
	movs r1, #0x10
	ands r0, r1
	cmp r0, #0
	beq _08083712
	adds r0, r4, #0
	mov r1, sp
	add r2, sp, #4
	bl UnitGetDeathDropLocation
	ldr r1, [sp]
	ldr r2, [sp, #4]
	adds r0, r4, #0
	bl UnitDrop
	b _08083712
	.align 2, 0
_08083704: .4byte gBattleActor
_08083708: .4byte gBattleTarget
_0808370C:
	adds r5, #1
	cmp r5, #0x3f
	ble _0808365E
_08083712:
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8083654

	THUMB_FUNC_START sub_808371C
sub_808371C: @ 0x0808371C
	push {r4, r5, r6, r7, lr}
	adds r6, r2, #0
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r4, r1, #0x18
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_8084748
	adds r7, r0, #0
	cmp r7, #0
	beq _0808375E
	lsls r2, r6, #0x18
	lsrs r2, r2, #0x18
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_808478C
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	subs r2, r6, #1
	lsls r2, r2, #1
	adds r1, r7, #4
	adds r1, r1, r2
	ldrh r1, [r1]
	bl CallMapSupportEvent
	adds r0, r5, #0
	adds r1, r4, #0
	adds r2, r6, #0
	bl sub_80A3724
_0808375E:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_808371C

	THUMB_FUNC_START sub_8083764
sub_8083764: @ 0x08083764
	push {r4, lr}
	adds r4, r2, #0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	bl sub_8084748
	adds r1, r0, #0
	cmp r1, #0
	beq _08083788
	subs r0, r4, #1
	lsls r0, r0, #1
	adds r1, #4
	adds r1, r1, r0
	ldrh r0, [r1]
	bl CallSupportViewerEvent
_08083788:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8083764

	THUMB_FUNC_START sub_8083790
sub_8083790: @ 0x08083790
	push {lr}
	adds r0, r1, #0
	adds r1, r2, #0
	adds r2, r3, #0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	bl sub_808478C
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8083790

	THUMB_FUNC_START sub_80837B0
sub_80837B0: @ 0x080837B0
	push {lr}
	movs r0, #0x65
	bl SetEventId
	movs r0, #0x3e
	movs r1, #0
	bl Sound_PlaySong80024D4
	ldr r0, _080837D4  @ gRAMChapterData
	adds r0, #0x41
	ldrb r1, [r0]
	movs r2, #1
	orrs r1, r2
	strb r1, [r0]
	bl CallGameOverEvent
	pop {r0}
	bx r0
	.align 2, 0
_080837D4: .4byte gRAMChapterData

	THUMB_FUNC_END sub_80837B0

	THUMB_FUNC_START sub_80837D8
sub_80837D8: @ 0x080837D8
	push {lr}
	ldr r0, _080837EC  @ gRAMChapterData
	ldrb r1, [r0, #0x14]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	bne _080837F0
	movs r0, #0
	b _080837F2
	.align 2, 0
_080837EC: .4byte gRAMChapterData
_080837F0:
	movs r0, #1
_080837F2:
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80837D8

	THUMB_FUNC_START sub_80837F8
sub_80837F8: @ 0x080837F8
	push {lr}
	movs r3, #0
	ldr r2, _0808382C  @ gRAMChapterData
	ldrb r1, [r2, #0x14]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	bne _08083824
	adds r0, r2, #0
	adds r0, #0x42
	ldrb r0, [r0]
	lsls r0, r0, #0x1a
	cmp r0, #0
	blt _08083824
	movs r0, #0x87
	bl CheckEventId
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	negs r1, r0
	orrs r1, r0
	lsrs r3, r1, #0x1f
_08083824:
	adds r0, r3, #0
	pop {r1}
	bx r1
	.align 2, 0
_0808382C: .4byte gRAMChapterData

	THUMB_FUNC_END sub_80837F8

	THUMB_FUNC_START sub_8083830
sub_8083830: @ 0x08083830
	movs r0, #1
	bx lr

	THUMB_FUNC_END sub_8083830

	THUMB_FUNC_START CheckAFEV
CheckAFEV: @ 0x08083834
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, [r5]
	ldr r0, [r4, #8]
	cmp r0, #0
	beq _08083850
	cmp r0, #0x64
	beq _08083850
	bl CheckEventId
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _0808385C
_08083850:
	ldr r0, [r4, #4]
	str r0, [r5, #4]
	ldrh r0, [r4, #2]
	str r0, [r5, #8]
	movs r0, #1
	b _0808385E
_0808385C:
	movs r0, #0
_0808385E:
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END CheckAFEV

	THUMB_FUNC_START CheckTURN
CheckTURN: @ 0x08083864
	push {r4, r5, r6, lr}
	adds r3, r0, #0
	ldr r2, [r3]
	ldrb r4, [r2, #8]
	ldrb r0, [r2, #9]
	ldrh r6, [r2, #0xa]
	cmp r0, #0
	bne _08083878
	adds r0, r4, #0
	b _0808387E
_08083878:
	cmp r0, #0xff
	bne _0808387E
	ldr r0, _0808389C  @ 0x7FFFFFFF
_0808387E:
	ldr r5, _080838A0  @ gRAMChapterData
	ldrh r1, [r5, #0x10]
	cmp r4, r1
	bgt _080838A4
	cmp r1, r0
	bgt _080838A4
	ldrb r0, [r5, #0xf]
	cmp r0, r6
	bne _080838A4
	ldr r0, [r2, #4]
	str r0, [r3, #4]
	ldrh r0, [r2, #2]
	str r0, [r3, #8]
	movs r0, #1
	b _080838A6
	.align 2, 0
_0808389C: .4byte 0x7FFFFFFF
_080838A0: .4byte gRAMChapterData
_080838A4:
	movs r0, #0
_080838A6:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	THUMB_FUNC_END CheckTURN

	THUMB_FUNC_START CheckCHAR
CheckCHAR: @ 0x080838AC
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r4, [r5]
	ldrb r6, [r4, #8]
	ldrb r7, [r4, #9]
	ldrh r0, [r4, #0xc]
	cmp r0, #2
	beq _080838F2
	cmp r0, #2
	bgt _080838C6
	cmp r0, #1
	beq _080838F2
	b _080838D6
_080838C6:
	cmp r0, #3
	bne _080838D6
	ldrh r0, [r4, #0xe]
	bl CheckEventId
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080838F2
_080838D6:
	ldrb r0, [r5, #0x1a]
	cmp r0, r6
	beq _080838E0
	cmp r6, #0
	bne _080838F2
_080838E0:
	ldrb r0, [r5, #0x1b]
	cmp r0, r7
	bne _080838F2
	ldr r0, [r4, #4]
	str r0, [r5, #4]
	ldrh r0, [r4, #2]
	str r0, [r5, #8]
	movs r0, #1
	b _080838F4
_080838F2:
	movs r0, #0
_080838F4:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END CheckCHAR

	THUMB_FUNC_START CheckCHARASM
CheckCHARASM: @ 0x080838FC
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	ldr r5, [r4]
	ldrb r6, [r5, #8]
	ldrb r7, [r5, #9]
	ldr r1, [r5, #0xc]
	bl _call_via_r1
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0808392E
	ldrb r0, [r4, #0x1a]
	cmp r0, r6
	beq _0808391C
	cmp r6, #0
	bne _0808392E
_0808391C:
	ldrb r0, [r4, #0x1b]
	cmp r0, r7
	bne _0808392E
	ldr r0, [r5, #4]
	str r0, [r4, #4]
	ldrh r0, [r5, #2]
	str r0, [r4, #8]
	movs r0, #1
	b _08083930
_0808392E:
	movs r0, #0
_08083930:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END CheckCHARASM

	THUMB_FUNC_START CheckLOCA
CheckLOCA: @ 0x08083938
	push {r4, r5, r6, lr}
	adds r2, r0, #0
	ldr r3, [r2]
	ldrb r1, [r3, #8]
	ldrb r4, [r3, #9]
	ldrh r5, [r3, #0xa]
	movs r6, #0
	str r6, [r2, #0x10]
	movs r0, #0x18
	ldrsb r0, [r2, r0]
	cmp r1, r0
	bne _0808396E
	movs r0, #0x19
	ldrsb r0, [r2, r0]
	cmp r4, r0
	bne _0808396E
	ldr r0, [r3, #4]
	str r0, [r2, #4]
	ldrh r0, [r3, #2]
	str r0, [r2, #8]
	ldrh r0, [r3, #0xa]
	str r0, [r2, #0xc]
	cmp r5, #0x14
	bne _0808396A
	str r6, [r2, #0x14]
_0808396A:
	movs r0, #1
	b _08083970
_0808396E:
	movs r0, #0
_08083970:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	THUMB_FUNC_END CheckLOCA

	THUMB_FUNC_START CheckVILL
CheckVILL: @ 0x08083978
	push {r4, lr}
	adds r4, r0, #0
	bl CheckLOCA
	movs r1, #3
	str r1, [r4, #0x10]
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END CheckVILL

	THUMB_FUNC_START CheckCHES
CheckCHES: @ 0x0808398C
	push {r4, lr}
	adds r2, r0, #0
	ldr r3, [r2]
	ldrb r1, [r3, #8]
	ldrb r4, [r3, #9]
	movs r0, #0x18
	ldrsb r0, [r2, r0]
	cmp r1, r0
	bne _080839BE
	movs r0, #0x19
	ldrsb r0, [r2, r0]
	cmp r4, r0
	bne _080839BE
	movs r0, #1
	str r0, [r2, #4]
	ldrh r0, [r3, #2]
	str r0, [r2, #8]
	ldrh r0, [r3, #0xa]
	str r0, [r2, #0xc]
	ldrh r0, [r3, #4]
	str r0, [r2, #0x14]
	ldrh r0, [r3, #6]
	str r0, [r2, #0x10]
	movs r0, #1
	b _080839C0
_080839BE:
	movs r0, #0
_080839C0:
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END CheckCHES

	THUMB_FUNC_START CheckDOOR
CheckDOOR: @ 0x080839C8
	push {r4, r5, r6, lr}
	adds r3, r0, #0
	ldr r4, [r3]
	ldr r1, [r4, #8]
	ldrb r2, [r4, #8]
	movs r0, #0xff
	lsls r0, r0, #8
	ands r0, r1
	lsrs r5, r0, #8
	movs r0, #0xff
	lsls r0, r0, #0x10
	ands r0, r1
	lsrs r6, r0, #0x10
	lsrs r1, r1, #0x18
	movs r0, #0x18
	ldrsb r0, [r3, r0]
	cmp r2, r0
	bne _08083A06
	movs r0, #0x19
	ldrsb r0, [r3, r0]
	cmp r5, r0
	bne _08083A06
	ldr r0, [r4, #4]
	str r0, [r3, #4]
	ldr r0, [r3]
	ldrh r0, [r0, #2]
	str r0, [r3, #8]
	str r6, [r3, #0xc]
	str r1, [r3, #0x10]
	movs r0, #1
	b _08083A08
_08083A06:
	movs r0, #0
_08083A08:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	THUMB_FUNC_END CheckDOOR

	THUMB_FUNC_START sub_8083A10
sub_8083A10: @ 0x08083A10
	push {r4, r5, r6, lr}
	adds r3, r0, #0
	ldr r4, [r3]
	ldr r1, [r4, #8]
	ldrb r2, [r4, #8]
	movs r0, #0xff
	lsls r0, r0, #8
	ands r0, r1
	lsrs r5, r0, #8
	movs r0, #0xff
	lsls r0, r0, #0x10
	ands r0, r1
	lsrs r6, r0, #0x10
	lsrs r1, r1, #0x18
	movs r0, #0x18
	ldrsb r0, [r3, r0]
	cmp r2, r0
	bne _08083A4E
	movs r0, #0x19
	ldrsb r0, [r3, r0]
	cmp r5, r0
	bne _08083A4E
	ldr r0, [r4, #4]
	str r0, [r3, #4]
	ldr r0, [r3]
	ldrh r0, [r0, #2]
	str r0, [r3, #8]
	str r6, [r3, #0xc]
	str r1, [r3, #0x10]
	movs r0, #1
	b _08083A50
_08083A4E:
	movs r0, #0
_08083A50:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8083A10

	THUMB_FUNC_START CheckSHOP
CheckSHOP: @ 0x08083A58
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r5, [r4]
	ldrb r1, [r5, #8]
	ldrb r2, [r5, #9]
	ldrh r6, [r5, #0xa]
	movs r0, #0x18
	ldrsb r0, [r4, r0]
	cmp r1, r0
	bne _08083A9C
	movs r0, #0x19
	ldrsb r0, [r4, r0]
	cmp r2, r0
	bne _08083A9C
	cmp r6, #0x18
	bne _08083A8A
	ldr r0, _08083A98  @ gActiveUnit
	ldr r0, [r0]
	movs r1, #0x72
	bl GetUnitItemSlot
	movs r1, #1
	negs r1, r1
	cmp r0, r1
	beq _08083A9C
_08083A8A:
	ldr r0, [r5, #4]
	str r0, [r4, #4]
	ldrh r0, [r5, #2]
	str r0, [r4, #8]
	str r6, [r4, #0xc]
	movs r0, #1
	b _08083A9E
	.align 2, 0
_08083A98: .4byte gActiveUnit
_08083A9C:
	movs r0, #0
_08083A9E:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	THUMB_FUNC_END CheckSHOP

	THUMB_FUNC_START CheckAREA
CheckAREA: @ 0x08083AA4
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	ldr r0, _08083B18  @ gActiveUnit
	ldr r3, [r0]
	ldrb r0, [r3, #0x11]
	mov ip, r0
	ldr r2, [r4]
	ldr r1, [r2, #8]
	movs r0, #0xff
	lsls r0, r0, #8
	ands r0, r1
	lsrs r7, r0, #8
	movs r0, #0xff
	lsls r0, r0, #0x10
	ands r0, r1
	lsrs r0, r0, #0x10
	adds r5, r0, #0
	lsrs r6, r1, #0x18
	movs r1, #8
	ldrsb r1, [r2, r1]
	movs r2, #0x10
	ldrsb r2, [r3, r2]
	cmp r1, r2
	bgt _08083ADC
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r2, r0
	ble _08083AE8
_08083ADC:
	lsls r0, r5, #0x18
	asrs r0, r0, #0x18
	cmp r0, r2
	bgt _08083B1C
	cmp r2, r1
	bgt _08083B1C
_08083AE8:
	lsls r0, r7, #0x18
	asrs r3, r0, #0x18
	mov r1, ip
	lsls r0, r1, #0x18
	asrs r2, r0, #0x18
	lsls r1, r6, #0x18
	cmp r3, r2
	bgt _08083AFE
	asrs r0, r1, #0x18
	cmp r2, r0
	ble _08083B08
_08083AFE:
	asrs r0, r1, #0x18
	cmp r0, r2
	bgt _08083B1C
	cmp r2, r3
	bgt _08083B1C
_08083B08:
	ldr r0, [r4]
	ldr r1, [r0, #4]
	str r1, [r4, #4]
	ldrh r0, [r0, #2]
	str r0, [r4, #8]
	movs r0, #1
	b _08083B1E
	.align 2, 0
_08083B18: .4byte gActiveUnit
_08083B1C:
	movs r0, #0
_08083B1E:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END CheckAREA

	THUMB_FUNC_START sub_8083B24
sub_8083B24: @ 0x08083B24
	movs r0, #0
	bx lr

	THUMB_FUNC_END sub_8083B24

	THUMB_FUNC_START sub_8083B28
sub_8083B28: @ 0x08083B28
	movs r0, #0
	bx lr

	THUMB_FUNC_END sub_8083B28

	THUMB_FUNC_START sub_8083B2C
sub_8083B2C: @ 0x08083B2C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4]
	ldr r1, [r0, #8]
	adds r0, r4, #0
	bl _call_via_r1
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08083B44
	movs r0, #0
	b _08083B50
_08083B44:
	ldr r0, [r4]
	ldr r1, [r0, #4]
	str r1, [r4, #4]
	ldrh r0, [r0, #2]
	str r0, [r4, #8]
	movs r0, #1
_08083B50:
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8083B2C

	THUMB_FUNC_START sub_8083B58
sub_8083B58: @ 0x08083B58
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r0, [r4]
	ldrh r5, [r0, #0xc]
	ldr r6, _08083B8C  @ 0xFFFF0000
	ldrh r0, [r0, #2]
	bl CheckEventId
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08083B90
	adds r0, r5, #0
	bl CheckEventId
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08083B90
	ldr r1, [r4]
	ldr r0, [r1, #8]
	str r0, [r4, #4]
	ldr r0, [r1]
	ands r0, r6
	lsrs r0, r0, #0x10
	str r0, [r4, #8]
	movs r0, #1
	b _08083B92
	.align 2, 0
_08083B8C: .4byte 0xFFFF0000
_08083B90:
	movs r0, #0
_08083B92:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8083B58

	THUMB_FUNC_START sub_8083B98
sub_8083B98: @ 0x08083B98
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r0, [r4]
	ldrh r5, [r0, #0xc]
	ldr r6, _08083BCC  @ 0xFFFF0000
	ldrh r0, [r0, #2]
	bl CheckEventId
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08083BD0
	adds r0, r5, #0
	bl CheckEventId
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08083BD0
	ldr r1, [r4]
	ldr r0, [r1, #8]
	str r0, [r4, #4]
	ldr r0, [r1]
	ands r0, r6
	lsrs r0, r0, #0x10
	str r0, [r4, #8]
	movs r0, #1
	b _08083BD2
	.align 2, 0
_08083BCC: .4byte 0xFFFF0000
_08083BD0:
	movs r0, #0
_08083BD2:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8083B98

	THUMB_FUNC_START SetLocalEventId
SetLocalEventId: @ 0x08083BD8
	push {lr}
	adds r3, r0, #0
	cmp r3, #0
	beq _08083C00
	subs r3, #1
	ldr r1, _08083C04  @ gUnknown_03005270
	adds r0, r3, #0
	cmp r3, #0
	bge _08083BEC
	adds r0, r3, #7
_08083BEC:
	asrs r0, r0, #3
	adds r2, r0, r1
	ldr r1, _08083C08  @ gUnknown_089E857C
	lsls r0, r0, #3
	subs r0, r3, r0
	adds r0, r0, r1
	ldrb r1, [r2]
	ldrb r0, [r0]
	orrs r1, r0
	strb r1, [r2]
_08083C00:
	pop {r0}
	bx r0
	.align 2, 0
_08083C04: .4byte gUnknown_03005270
_08083C08: .4byte gUnknown_089E857C

	THUMB_FUNC_END SetLocalEventId

	THUMB_FUNC_START UnsetLocalEventId
UnsetLocalEventId: @ 0x08083C0C
	push {lr}
	adds r2, r0, #0
	cmp r2, #0
	beq _08083C3A
	subs r2, #1
	ldr r3, _08083C40  @ gUnknown_089E857C
	adds r1, r2, #0
	cmp r2, #0
	bge _08083C20
	adds r1, r2, #7
_08083C20:
	asrs r1, r1, #3
	lsls r0, r1, #3
	subs r0, r2, r0
	adds r0, r0, r3
	ldrb r0, [r0]
	mvns r0, r0
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	ldr r0, _08083C44  @ gUnknown_03005270
	adds r1, r1, r0
	ldrb r0, [r1]
	ands r0, r3
	strb r0, [r1]
_08083C3A:
	pop {r0}
	bx r0
	.align 2, 0
_08083C40: .4byte gUnknown_089E857C
_08083C44: .4byte gUnknown_03005270

	THUMB_FUNC_END UnsetLocalEventId

	THUMB_FUNC_START ClearLocalEvents
ClearLocalEvents: @ 0x08083C48
	push {lr}
	ldr r1, _08083C5C  @ gUnknown_03005270
	movs r2, #0
	adds r0, r1, #4
_08083C50:
	strb r2, [r0]
	subs r0, #1
	cmp r0, r1
	bge _08083C50
	pop {r0}
	bx r0
	.align 2, 0
_08083C5C: .4byte gUnknown_03005270

	THUMB_FUNC_END ClearLocalEvents

	THUMB_FUNC_START CheckLocalEventId
CheckLocalEventId: @ 0x08083C60
	push {lr}
	adds r3, r0, #0
	cmp r3, #0
	beq _08083C8A
	subs r3, #1
	ldr r1, _08083C90  @ gUnknown_03005270
	adds r0, r3, #0
	cmp r3, #0
	bge _08083C74
	adds r0, r3, #7
_08083C74:
	asrs r0, r0, #3
	adds r2, r0, r1
	ldr r1, _08083C94  @ gUnknown_089E857C
	lsls r0, r0, #3
	subs r0, r3, r0
	adds r0, r0, r1
	ldrb r1, [r2]
	ldrb r0, [r0]
	ands r0, r1
	cmp r0, #0
	bne _08083C98
_08083C8A:
	movs r0, #0
	b _08083C9A
	.align 2, 0
_08083C90: .4byte gUnknown_03005270
_08083C94: .4byte gUnknown_089E857C
_08083C98:
	movs r0, #1
_08083C9A:
	pop {r1}
	bx r1

	THUMB_FUNC_END CheckLocalEventId

	THUMB_FUNC_START SetGlobalEventId
SetGlobalEventId: @ 0x08083CA0
	push {lr}
	adds r3, r0, #0
	cmp r3, #0x63
	ble _08083CCC
	cmp r3, #0x64
	beq _08083CCC
	subs r3, #0x65
	ldr r1, _08083CD0  @ gUnknown_03005250
	adds r0, r3, #0
	cmp r3, #0
	bge _08083CB8
	adds r0, r3, #7
_08083CB8:
	asrs r0, r0, #3
	adds r2, r0, r1
	ldr r1, _08083CD4  @ gUnknown_089E857C
	lsls r0, r0, #3
	subs r0, r3, r0
	adds r0, r0, r1
	ldrb r1, [r2]
	ldrb r0, [r0]
	orrs r1, r0
	strb r1, [r2]
_08083CCC:
	pop {r0}
	bx r0
	.align 2, 0
_08083CD0: .4byte gUnknown_03005250
_08083CD4: .4byte gUnknown_089E857C

	THUMB_FUNC_END SetGlobalEventId

	THUMB_FUNC_START UnsetGlobalEventId
UnsetGlobalEventId: @ 0x08083CD8
	push {lr}
	adds r2, r0, #0
	cmp r2, #0x63
	ble _08083D0A
	cmp r2, #0x64
	beq _08083D0A
	subs r2, #0x65
	ldr r3, _08083D10  @ gUnknown_089E857C
	adds r1, r2, #0
	cmp r2, #0
	bge _08083CF0
	adds r1, r2, #7
_08083CF0:
	asrs r1, r1, #3
	lsls r0, r1, #3
	subs r0, r2, r0
	adds r0, r0, r3
	ldrb r0, [r0]
	mvns r0, r0
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	ldr r0, _08083D14  @ gUnknown_03005250
	adds r1, r1, r0
	ldrb r0, [r1]
	ands r0, r3
	strb r0, [r1]
_08083D0A:
	pop {r0}
	bx r0
	.align 2, 0
_08083D10: .4byte gUnknown_089E857C
_08083D14: .4byte gUnknown_03005250

	THUMB_FUNC_END UnsetGlobalEventId

	THUMB_FUNC_START sub_8083D18
sub_8083D18: @ 0x08083D18
	push {lr}
	ldr r1, _08083D30  @ gUnknown_03005250
	movs r2, #0
	adds r0, r1, #0
	adds r0, #0x18
_08083D22:
	strb r2, [r0]
	subs r0, #1
	cmp r0, r1
	bge _08083D22
	pop {r0}
	bx r0
	.align 2, 0
_08083D30: .4byte gUnknown_03005250

	THUMB_FUNC_END sub_8083D18

	THUMB_FUNC_START sub_8083D34
sub_8083D34: @ 0x08083D34
	push {lr}
	adds r3, r0, #0
	cmp r3, #0x64
	ble _08083D5C
	subs r3, #0x65
	adds r0, r3, #0
	cmp r3, #0
	bge _08083D46
	adds r0, r3, #7
_08083D46:
	asrs r0, r0, #3
	adds r2, r1, r0
	ldr r1, _08083D60  @ gUnknown_089E857C
	lsls r0, r0, #3
	subs r0, r3, r0
	adds r0, r0, r1
	ldrb r1, [r2]
	ldrb r0, [r0]
	ands r0, r1
	cmp r0, #0
	bne _08083D64
_08083D5C:
	movs r0, #0
	b _08083D66
	.align 2, 0
_08083D60: .4byte gUnknown_089E857C
_08083D64:
	movs r0, #1
_08083D66:
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8083D34

	THUMB_FUNC_START CheckGlobalEventId
CheckGlobalEventId: @ 0x08083D6C
	push {lr}
	ldr r1, _08083D7C  @ gUnknown_03005250
	bl sub_8083D34
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1
	.align 2, 0
_08083D7C: .4byte gUnknown_03005250

	THUMB_FUNC_END CheckGlobalEventId

	THUMB_FUNC_START SetEventId
SetEventId: @ 0x08083D80
	push {lr}
	cmp r0, #0x63
	bgt _08083D8C
	bl SetLocalEventId
	b _08083D90
_08083D8C:
	bl SetGlobalEventId
_08083D90:
	pop {r0}
	bx r0

	THUMB_FUNC_END SetEventId

	THUMB_FUNC_START UnsetEventId
UnsetEventId: @ 0x08083D94
	push {lr}
	cmp r0, #0x63
	bgt _08083DA0
	bl UnsetLocalEventId
	b _08083DA4
_08083DA0:
	bl UnsetGlobalEventId
_08083DA4:
	pop {r0}
	bx r0

	THUMB_FUNC_END UnsetEventId

	THUMB_FUNC_START CheckEventId
CheckEventId: @ 0x08083DA8
	push {lr}
	cmp r0, #0x63
	ble _08083DB4
	bl CheckGlobalEventId
	b _08083DB8
_08083DB4:
	bl CheckLocalEventId
_08083DB8:
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	THUMB_FUNC_END CheckEventId

	THUMB_FUNC_START GetGlobalEventIdStorage
GetGlobalEventIdStorage: @ 0x08083DC0
	ldr r0, _08083DC4  @ gUnknown_03005250
	bx lr
	.align 2, 0
_08083DC4: .4byte gUnknown_03005250

	THUMB_FUNC_END GetGlobalEventIdStorage

	THUMB_FUNC_START GetGlobalEventIdStorageSize
GetGlobalEventIdStorageSize: @ 0x08083DC8
	movs r0, #0x19
	bx lr

	THUMB_FUNC_END GetGlobalEventIdStorageSize

	THUMB_FUNC_START GetLocalEventIdStorage
GetLocalEventIdStorage: @ 0x08083DCC
	ldr r0, _08083DD0  @ gUnknown_03005270
	bx lr
	.align 2, 0
_08083DD0: .4byte gUnknown_03005270

	THUMB_FUNC_END GetLocalEventIdStorage

	THUMB_FUNC_START GetLocalEventIdStorageSize
GetLocalEventIdStorageSize: @ 0x08083DD4
	movs r0, #5
	bx lr

	THUMB_FUNC_END GetLocalEventIdStorageSize

	THUMB_FUNC_START sub_8083DD8
sub_8083DD8: @ 0x08083DD8
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	lsls r1, r1, #0x18
	lsrs r6, r1, #0x18
	movs r4, #0
	ldr r5, _08083E18  @ gRAMChapterData
	movs r0, #0xe
	ldrsb r0, [r5, r0]
	bl GetChapterEventDataPointer
	ldr r1, [r0, #0x1c]
	ldr r0, [r1]
	cmp r0, #0
	beq _08083E2C
	adds r2, r5, #0
	adds r2, #0x4a
	lsls r3, r6, #4
	adds r5, #0x4b
	movs r6, #0xf
_08083DFE:
	lsls r0, r4, #2
	adds r0, r0, r1
	ldr r0, [r0]
	cmp r0, r7
	bne _08083E1C
	adds r0, r4, #1
	strb r0, [r5]
	ldrb r1, [r2]
	adds r0, r6, #0
	ands r0, r1
	orrs r0, r3
	strb r0, [r2]
	b _08083E2C
	.align 2, 0
_08083E18: .4byte gRAMChapterData
_08083E1C:
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	lsls r0, r4, #2
	adds r0, r0, r1
	ldr r0, [r0]
	cmp r0, #0
	bne _08083DFE
_08083E2C:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8083DD8

	THUMB_FUNC_START sub_8083E34
sub_8083E34: @ 0x08083E34
	push {lr}
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	ldr r1, _08083E58  @ gRAMChapterData
	adds r0, r1, #0
	adds r0, #0x4b
	ldrb r0, [r0]
	cmp r0, #0
	beq _08083E5C
	adds r0, r1, #0
	adds r0, #0x4a
	ldrb r0, [r0]
	lsrs r0, r0, #4
	cmp r0, r2
	bne _08083E5C
	movs r0, #1
	b _08083E5E
	.align 2, 0
_08083E58: .4byte gRAMChapterData
_08083E5C:
	movs r0, #0
_08083E5E:
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8083E34

	THUMB_FUNC_START TryCallSelectEvents_u1C
TryCallSelectEvents_u1C: @ 0x08083E64
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	ldr r1, _08083EAC  @ gRAMChapterData
	adds r6, r1, #0
	adds r6, #0x4b
	ldrb r0, [r6]
	cmp r0, #0
	beq _08083EB0
	adds r5, r1, #0
	adds r5, #0x4a
	ldrb r0, [r5]
	lsrs r0, r0, #4
	cmp r0, r2
	bne _08083EB0
	ldrb r4, [r6]
	movs r0, #0xe
	ldrsb r0, [r1, r0]
	bl GetChapterEventDataPointer
	ldr r0, [r0, #0x1c]
	lsls r4, r4, #2
	adds r4, r4, r0
	subs r4, #4
	ldr r0, [r4]
	movs r1, #1
	bl CallEvent
	movs r0, #0
	strb r0, [r6]
	ldrb r1, [r5]
	movs r0, #0xf
	ands r0, r1
	strb r0, [r5]
	movs r0, #1
	b _08083EB2
	.align 2, 0
_08083EAC: .4byte gRAMChapterData
_08083EB0:
	movs r0, #0
_08083EB2:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	THUMB_FUNC_END TryCallSelectEvents_u1C

	THUMB_FUNC_START sub_8083EB8
sub_8083EB8: @ 0x08083EB8
	push {r4, lr}
	sub sp, #0x1c
	bl GetChapterThing
	cmp r0, #2
	bne _08083EC8
	movs r0, #0
	b _08083F60
_08083EC8:
	ldr r0, _08083EEC  @ gRAMChapterData
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0
	beq _08083F18
	bl GetChapterThing
	cmp r0, #2
	beq _08083EF0
	adds r0, r4, #0
	bl GetROMChapterStruct
	adds r0, #0x8c
	ldrb r0, [r0]
	b _08083EF2
	.align 2, 0
_08083EEC: .4byte gRAMChapterData
_08083EF0:
	movs r0, #1
_08083EF2:
	cmp r0, #1
	beq _08083EFA
	cmp r0, #3
	bne _08083F18
_08083EFA:
	bl AreAnyEnemyUnitDead
	cmp r0, #0
	bne _08083F18
	bl GetChapterThing
	cmp r0, #0
	bne _08083F10
	movs r0, #3
	bl SetEventId
_08083F10:
	bl sub_8083280
	movs r0, #1
	b _08083F60
_08083F18:
	movs r0, #0
	bl TryCallSelectEvents_u1C
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r0, _08083F58  @ gRAMChapterData
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetChapterEventDataPointer
	ldr r0, [r0]
	str r0, [sp]
	mov r0, sp
	bl CheckForEvents
	cmp r0, #0
	beq _08083F5C
	bl sub_80845A4
_08083F40:
	mov r0, sp
	movs r1, #1
	bl CallEventsFromBuffer
	mov r0, sp
	bl CheckForNextEvents
	cmp r0, #0
	bne _08083F40
	movs r0, #1
	b _08083F60
	.align 2, 0
_08083F58: .4byte gRAMChapterData
_08083F5C:
	lsls r0, r4, #0x18
	asrs r0, r0, #0x18
_08083F60:
	add sp, #0x1c
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8083EB8

	THUMB_FUNC_START sub_8083F68
sub_8083F68: @ 0x08083F68
	push {r4, r5, lr}
	sub sp, #0x1c
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r5, r1, #0x18
	bl GetChapterThing
	cmp r0, #2
	beq _08083F9A
	ldr r0, _08083FA0  @ gRAMChapterData
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetChapterEventDataPointer
	ldr r0, [r0, #4]
	str r0, [sp]
	mov r0, sp
	strb r4, [r0, #0x1a]
	strb r5, [r0, #0x1b]
	bl CheckForEvents
	cmp r0, #0
	bne _08083FA4
_08083F9A:
	movs r0, #0
	b _08083FA6
	.align 2, 0
_08083FA0: .4byte gRAMChapterData
_08083FA4:
	movs r0, #1
_08083FA6:
	add sp, #0x1c
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8083F68

	THUMB_FUNC_START sub_8083FB0
sub_8083FB0: @ 0x08083FB0
	push {r4, r5, lr}
	sub sp, #0x1c
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r5, r1, #0x18
	bl GetChapterThing
	cmp r0, #2
	beq _08083FEE
	ldr r0, _08083FF8  @ gRAMChapterData
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetChapterEventDataPointer
	ldr r0, [r0, #4]
	str r0, [sp]
	mov r0, sp
	strb r4, [r0, #0x1a]
	strb r5, [r0, #0x1b]
	bl CheckForEvents
	cmp r0, #0
	beq _08083FEE
	bl sub_80845A4
	mov r0, sp
	movs r1, #1
	bl CallEventsFromBuffer
_08083FEE:
	add sp, #0x1c
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08083FF8: .4byte gRAMChapterData

	THUMB_FUNC_END sub_8083FB0

	THUMB_FUNC_START sub_8083FFC
sub_8083FFC: @ 0x08083FFC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	cmp r0, #0x72
	bne _0808406C
	movs r0, #0x72
	bl GetConvoyItemSlot
	movs r1, #1
	negs r1, r1
	cmp r0, r1
	beq _0808401E
_0808401A:
	movs r0, #0x74
	b _0808406E
_0808401E:
	movs r7, #1
_08084020:
	adds r0, r7, #0
	bl GetUnit
	adds r6, r0, #0
	cmp r6, #0
	beq _08084066
	ldr r0, [r6]
	cmp r0, #0
	beq _08084066
	ldr r0, [r6, #0xc]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	bne _08084066
	movs r5, #0
	b _08084050
_08084040:
	ldrh r0, [r4]
	bl GetItemIndex
	cmp r0, #0x72
	beq _0808401A
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
_08084050:
	cmp r5, #4
	bhi _08084066
	lsls r1, r5, #1
	adds r0, r6, #0
	adds r0, #0x1e
	adds r4, r0, r1
	ldrh r0, [r4]
	bl GetItemIndex
	cmp r0, #0
	bne _08084040
_08084066:
	adds r7, #1
	cmp r7, #0x3f
	ble _08084020
_0808406C:
	mov r0, r8
_0808406E:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8083FFC

	THUMB_FUNC_START GetAvailableLocaCommandAt
GetAvailableLocaCommandAt: @ 0x08084078
	push {r4, r5, lr}
	sub sp, #0x1c
	adds r4, r0, #0
	adds r5, r1, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	ldr r0, _080840B4  @ gRAMChapterData
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetChapterEventDataPointer
	ldr r0, [r0, #8]
	str r0, [sp]
	mov r0, sp
	strb r4, [r0, #0x18]
	strb r5, [r0, #0x19]
	bl CheckForEvents
	cmp r0, #0
	beq _080840B8
	bl GetChapterThing
	cmp r0, #2
	beq _080840B8
	ldr r0, [sp, #0xc]
	b _080840BA
	.align 2, 0
_080840B4: .4byte gRAMChapterData
_080840B8:
	movs r0, #0
_080840BA:
	add sp, #0x1c
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END GetAvailableLocaCommandAt

	THUMB_FUNC_START sub_80840C4
sub_80840C4: @ 0x080840C4
	push {r4, r5, lr}
	sub sp, #0x1c
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r4, r1, #0x18
	ldr r0, _08084104  @ gRAMChapterData
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetChapterEventDataPointer
	ldr r0, [r0, #8]
	str r0, [sp]
	mov r0, sp
	strb r5, [r0, #0x18]
	strb r4, [r0, #0x19]
	bl CheckForEvents
	cmp r0, #0
	bne _080840F0
	b _08084326
_080840F0:
	ldr r0, [sp, #0xc]
	cmp r0, #0x20
	bls _080840F8
	b _08084326
_080840F8:
	lsls r0, r0, #2
	ldr r1, _08084108  @ _0808410C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08084104: .4byte gRAMChapterData
_08084108: .4byte _0808410C
_0808410C: @ jump table
	.4byte _08084324 @ case 0
	.4byte _08084326 @ case 1
	.4byte _08084326 @ case 2
	.4byte _08084326 @ case 3
	.4byte _08084326 @ case 4
	.4byte _08084326 @ case 5
	.4byte _08084326 @ case 6
	.4byte _08084326 @ case 7
	.4byte _08084326 @ case 8
	.4byte _08084326 @ case 9
	.4byte _08084326 @ case 10
	.4byte _08084326 @ case 11
	.4byte _08084326 @ case 12
	.4byte _08084326 @ case 13
	.4byte _08084326 @ case 14
	.4byte _08084326 @ case 15
	.4byte _08084190 @ case 16
	.4byte _080841AC @ case 17
	.4byte _080841FC @ case 18
	.4byte _080841FC @ case 19
	.4byte _08084238 @ case 20
	.4byte _08084326 @ case 21
	.4byte _080842D8 @ case 22
	.4byte _080842F0 @ case 23
	.4byte _08084308 @ case 24
	.4byte _08084320 @ case 25
	.4byte _08084326 @ case 26
	.4byte _08084326 @ case 27
	.4byte _08084326 @ case 28
	.4byte _08084326 @ case 29
	.4byte _08084326 @ case 30
	.4byte _08084326 @ case 31
	.4byte _080841D4 @ case 32
_08084190:
	lsls r1, r4, #0x18
	ldr r0, _080841CC  @ gBmMapUnit
	ldr r0, [r0]
	asrs r1, r1, #0x16
	adds r1, r1, r0
	lsls r0, r5, #0x18
	asrs r0, r0, #0x18
	ldr r1, [r1]
	adds r1, r1, r0
	ldr r0, _080841D0  @ gActiveUnit
	ldr r0, [r0]
	ldr r0, [r0]
	ldrb r0, [r0, #4]
	strb r0, [r1]
_080841AC:
	bl GetChapterThing
	cmp r0, #2
	bne _080841B6
	b _08084326
_080841B6:
	bl sub_80845A4
	mov r0, sp
	movs r1, #1
	bl CallEventsFromBuffer
	ldr r0, [sp, #0x10]
	cmp r0, #3
	beq _080841CA
	b _08084326
_080841CA:
	b _080841DE
	.align 2, 0
_080841CC: .4byte gBmMapUnit
_080841D0: .4byte gActiveUnit
_080841D4:
	bl GetChapterThing
	cmp r0, #2
	bne _080841DE
	b _08084326
_080841DE:
	mov r0, sp
	ldrb r0, [r0, #0x18]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	mov r1, sp
	ldrb r1, [r1, #0x19]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl GetMapChangeIdAt
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl CallTileChangeEvent
	b _08084326
_080841FC:
	bl GetChapterThing
	cmp r0, #2
	bne _08084206
	b _08084326
_08084206:
	ldr r0, [sp, #4]
	cmp r0, #1
	bne _0808422A
	mov r0, sp
	ldrb r0, [r0, #0x18]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	mov r1, sp
	ldrb r1, [r1, #0x19]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl GetMapChangeIdAt
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl CallTileChangeEvent
	b _080842D0
_0808422A:
	bl sub_80845A4
	mov r0, sp
	movs r1, #1
	bl CallEventsFromBuffer
	b _08084326
_08084238:
	bl GetChapterThing
	cmp r0, #2
	beq _08084326
	ldr r0, [sp, #0x14]
	cmp r0, #0
	bne _08084278
	bl NextRN_100
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	ldr r2, [sp, #4]
	ldrb r0, [r2]
	cmp r0, #0
	beq _08084274
	ldrb r1, [r2, #1]
	cmp r3, r1
	bcc _08084272
_0808425C:
	adds r2, #2
	ldrb r0, [r2]
	cmp r0, #0
	beq _08084274
	ldrb r0, [r2, #1]
	adds r0, r1, r0
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r3, r1
	bcs _0808425C
	ldrb r0, [r2]
_08084272:
	str r0, [sp, #0x14]
_08084274:
	ldr r0, [sp, #0x14]
	b _0808427C
_08084278:
	cmp r0, #0x77
	beq _080842AE
_0808427C:
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl sub_8083FFC
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x14]
	mov r0, sp
	ldrb r0, [r0, #0x18]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	mov r1, sp
	ldrb r1, [r1, #0x19]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl GetMapChangeIdAt
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r1, [sp, #0x14]
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	bl CallChestOpeningEvent
	b _080842D0
_080842AE:
	mov r0, sp
	ldrb r0, [r0, #0x18]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	mov r1, sp
	ldrb r1, [r1, #0x19]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl GetMapChangeIdAt
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r1, [sp, #0x10]
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	bl CallChestOpeningEvent
_080842D0:
	ldr r0, [sp, #8]
	bl SetEventId
	b _08084326
_080842D8:
	bl GetChapterThing
	cmp r0, #2
	beq _08084326
	ldr r0, _080842EC  @ gActiveUnit
	ldr r0, [r0]
	ldr r1, [sp, #4]
	bl sub_80B41D0
	b _08084326
	.align 2, 0
_080842EC: .4byte gActiveUnit
_080842F0:
	bl GetChapterThing
	cmp r0, #2
	beq _08084326
	ldr r0, _08084304  @ gActiveUnit
	ldr r0, [r0]
	ldr r1, [sp, #4]
	bl sub_80B41F0
	b _08084326
	.align 2, 0
_08084304: .4byte gActiveUnit
_08084308:
	bl GetChapterThing
	cmp r0, #2
	beq _08084326
	ldr r0, _0808431C  @ gActiveUnit
	ldr r0, [r0]
	ldr r1, [sp, #4]
	bl sub_80B4210
	b _08084326
	.align 2, 0
_0808431C: .4byte gActiveUnit
_08084320:
	mov r8, r8
	b _08084326
_08084324:
	mov r8, r8
_08084326:
	add sp, #0x1c
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80840C4

	THUMB_FUNC_START CheckForWaitEvents
CheckForWaitEvents: @ 0x08084330
	push {r4, lr}
	sub sp, #0x1c
	bl AreAnyEnemyUnitDead
	cmp r0, #0
	bne _0808434C
	movs r0, #6
	bl SetEventId
	bl GetChapterThing
	cmp r0, #2
	bne _08084352
	b _080843B4
_0808434C:
	movs r0, #6
	bl UnsetEventId
_08084352:
	movs r0, #0x65
	bl CheckEventId
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080843B4
	bl CountAvailableBlueUnits
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _080843B4
	bl GetChapterThing
	cmp r0, #2
	bne _08084374
	movs r0, #0
	b _080843B6
_08084374:
	movs r0, #1
	bl sub_8083E34
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r0, _080843AC  @ gRAMChapterData
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetChapterEventDataPointer
	ldr r0, [r0, #0xc]
	str r0, [sp]
	mov r1, sp
	ldr r0, _080843B0  @ gActiveUnit
	ldr r2, [r0]
	ldrb r0, [r2, #0x10]
	strb r0, [r1, #0x18]
	ldrb r0, [r2, #0x11]
	strb r0, [r1, #0x19]
	mov r0, sp
	bl CheckForEvents
	cmp r0, #0
	bne _080843B4
	lsls r0, r4, #0x18
	asrs r0, r0, #0x18
	b _080843B6
	.align 2, 0
_080843AC: .4byte gRAMChapterData
_080843B0: .4byte gActiveUnit
_080843B4:
	movs r0, #1
_080843B6:
	add sp, #0x1c
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END CheckForWaitEvents

	THUMB_FUNC_START RunWaitEvents
RunWaitEvents: @ 0x080843C0
	push {lr}
	sub sp, #0x1c
	bl AreAnyEnemyUnitDead
	cmp r0, #0
	bne _080843E0
	movs r0, #6
	bl SetEventId
	bl GetChapterThing
	cmp r0, #2
	bne _080843E6
	bl sub_8083280
	b _0808444E
_080843E0:
	movs r0, #6
	bl UnsetEventId
_080843E6:
	movs r0, #0x65
	bl CheckEventId
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080843FC
	bl CountAvailableBlueUnits
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _08084402
_080843FC:
	bl sub_80837B0
	b _0808444E
_08084402:
	bl GetChapterThing
	cmp r0, #2
	beq _0808444E
	movs r0, #1
	bl TryCallSelectEvents_u1C
	ldr r0, _08084454  @ gRAMChapterData
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetChapterEventDataPointer
	ldr r0, [r0, #0xc]
	str r0, [sp]
	mov r1, sp
	ldr r0, _08084458  @ gActiveUnit
	ldr r2, [r0]
	ldrb r0, [r2, #0x10]
	strb r0, [r1, #0x18]
	ldrb r0, [r2, #0x11]
	strb r0, [r1, #0x19]
	mov r0, sp
	bl CheckForEvents
	cmp r0, #0
	beq _0808444E
	bl sub_80845A4
_0808443C:
	mov r0, sp
	movs r1, #1
	bl CallEventsFromBuffer
	mov r0, sp
	bl CheckForNextEvents
	cmp r0, #0
	bne _0808443C
_0808444E:
	add sp, #0x1c
	pop {r0}
	bx r0
	.align 2, 0
_08084454: .4byte gRAMChapterData
_08084458: .4byte gActiveUnit

	THUMB_FUNC_END RunWaitEvents

	THUMB_FUNC_START TryCallSelectEvents
TryCallSelectEvents: @ 0x0808445C
	push {r4, lr}
	sub sp, #0x1c
	bl GetChapterThing
	cmp r0, #2
	bne _0808446C
	movs r0, #0
	b _080844A8
_0808446C:
	movs r0, #2
	bl TryCallSelectEvents_u1C
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r0, _0808448C  @ gRAMChapterData
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetChapterEventDataPointer
	ldr r0, [r0, #0x10]
	str r0, [sp]
	bl sub_80845A4
	b _0808449A
	.align 2, 0
_0808448C: .4byte gRAMChapterData
_08084490:
	mov r0, sp
	movs r1, #1
	bl CallEventsFromBuffer
	movs r4, #1
_0808449A:
	mov r0, sp
	bl CheckForEvents
	cmp r0, #0
	bne _08084490
	lsls r0, r4, #0x18
	asrs r0, r0, #0x18
_080844A8:
	add sp, #0x1c
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END TryCallSelectEvents

	THUMB_FUNC_START sub_80844B0
sub_80844B0: @ 0x080844B0
	push {r4, lr}
	sub sp, #0x1c
	bl GetChapterThing
	cmp r0, #2
	bne _080844C0
	movs r0, #0
	b _080844FE
_080844C0:
	movs r0, #3
	bl TryCallSelectEvents_u1C
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r0, _080844EC  @ gRAMChapterData
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetChapterEventDataPointer
	ldr r0, [r0, #0x14]
	str r0, [sp]
	mov r0, sp
	bl CheckForEvents
	cmp r0, #0
	bne _080844F0
	lsls r0, r4, #0x18
	asrs r0, r0, #0x18
	b _080844FE
	.align 2, 0
_080844EC: .4byte gRAMChapterData
_080844F0:
	bl sub_80845A4
	mov r0, sp
	movs r1, #1
	bl CallEventsFromBuffer
	movs r0, #1
_080844FE:
	add sp, #0x1c
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80844B0

	THUMB_FUNC_START sub_8084508
sub_8084508: @ 0x08084508
	push {r4, lr}
	sub sp, #0x1c
	bl GetChapterThing
	cmp r0, #2
	bne _08084518
	movs r0, #0
	b _08084556
_08084518:
	movs r0, #4
	bl TryCallSelectEvents_u1C
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r0, _08084544  @ gRAMChapterData
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetChapterEventDataPointer
	ldr r0, [r0, #0x18]
	str r0, [sp]
	mov r0, sp
	bl CheckForEvents
	cmp r0, #0
	bne _08084548
	lsls r0, r4, #0x18
	asrs r0, r0, #0x18
	b _08084556
	.align 2, 0
_08084544: .4byte gRAMChapterData
_08084548:
	bl sub_80845A4
	mov r0, sp
	movs r1, #1
	bl CallEventsFromBuffer
	movs r0, #1
_08084556:
	add sp, #0x1c
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8084508

	THUMB_FUNC_START sub_8084560
sub_8084560: @ 0x08084560
	push {lr}
	bl GetChapterThing
	cmp r0, #2
	beq _08084576
	movs r0, #5
	bl sub_8083E34
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	b _08084578
_08084576:
	movs r0, #0
_08084578:
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8084560

	THUMB_FUNC_START sub_808457C
sub_808457C: @ 0x0808457C
	push {lr}
	bl GetChapterThing
	cmp r0, #2
	beq _0808458C
	movs r0, #5
	bl TryCallSelectEvents_u1C
_0808458C:
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_808457C

	THUMB_FUNC_START sub_8084590
sub_8084590: @ 0x08084590
	push {lr}
	bl GetChapterThing
	cmp r0, #2
	beq _080845A0
	movs r0, #6
	bl TryCallSelectEvents_u1C
_080845A0:
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8084590

	THUMB_FUNC_START sub_80845A4
sub_80845A4: @ 0x080845A4
	push {lr}
	ldr r0, _080845B4  @ gUnknown_03001C80
	movs r1, #0
	movs r2, #0x40
	bl memset
	pop {r0}
	bx r0
	.align 2, 0
_080845B4: .4byte gUnknown_03001C80

	THUMB_FUNC_END sub_80845A4

	THUMB_FUNC_START sub_80845B8
sub_80845B8: @ 0x080845B8
	push {r4, lr}
	ldr r3, _080845E0  @ gUnknown_03001C80
	movs r4, #0x3c
	ldrsh r2, [r3, r4]
	lsls r2, r2, #2
	adds r2, r2, r3
	str r0, [r2]
	movs r2, #0x3c
	ldrsh r0, [r3, r2]
	lsls r0, r0, #1
	adds r2, r3, #0
	adds r2, #0x28
	adds r0, r0, r2
	strh r1, [r0]
	ldrh r0, [r3, #0x3c]
	adds r0, #1
	strh r0, [r3, #0x3c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080845E0: .4byte gUnknown_03001C80

	THUMB_FUNC_END sub_80845B8

	THUMB_FUNC_START sub_80845E4
sub_80845E4: @ 0x080845E4
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r1, #0
	ldr r2, _08084610  @ gUnknown_03001C80
	movs r3, #0x3c
	ldrsh r0, [r2, r3]
	cmp r1, r0
	bge _08084620
	adds r3, r0, #0
	adds r5, r2, #0
	adds r5, #0x28
_080845FA:
	lsls r0, r1, #0x10
	asrs r1, r0, #0x10
	lsls r0, r1, #2
	adds r0, r0, r2
	ldr r0, [r0]
	cmp r0, r4
	bne _08084614
	lsls r0, r1, #1
	adds r0, r0, r5
	ldrh r0, [r0]
	b _08084622
	.align 2, 0
_08084610: .4byte gUnknown_03001C80
_08084614:
	adds r0, r1, #1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, r3
	blt _080845FA
_08084620:
	movs r0, #0
_08084622:
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80845E4

	THUMB_FUNC_START sub_8084628
sub_8084628: @ 0x08084628
	push {lr}
	movs r0, #0x82
	bl SetEventId
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8084628

	THUMB_FUNC_START sub_8084634
sub_8084634: @ 0x08084634
	push {lr}
	movs r0, #0x82
	bl CheckEventId
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08084646
	movs r0, #0
	b _08084648
_08084646:
	movs r0, #1
_08084648:
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8084634

	THUMB_FUNC_START GetBattleQuoteEntry
GetBattleQuoteEntry: @ 0x0808464C
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r5, r1, #0x10
	ldr r4, _080846AC  @ gUnknown_089EC6BC
	ldrh r0, [r4]
	ldr r1, _080846B0  @ 0x0000FFFF
	cmp r0, r1
	beq _080846DC
	adds r7, r1, #0
_08084662:
	ldrh r0, [r4, #4]
	cmp r0, #0xff
	beq _08084686
	adds r1, r0, #0
	ldr r0, _080846B4  @ gRAMChapterData
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r1, r0
	beq _08084686
	cmp r1, #0xfe
	bne _080846D4
	bl BattleIsTriangleAttack
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _080846D4
_08084686:
	ldrh r0, [r4, #6]
	bl GetEventTriggerState
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080846D4
	ldrh r0, [r4]
	adds r1, r0, #0
	adds r3, r0, #0
	cmp r1, #0
	beq _080846B8
	ldrh r0, [r4, #2]
	adds r2, r0, #0
	cmp r2, #0
	bne _080846C4
	cmp r6, r1
	bne _080846D4
_080846A8:
	adds r0, r4, #0
	b _080846DE
	.align 2, 0
_080846AC: .4byte gUnknown_089EC6BC
_080846B0: .4byte 0x0000FFFF
_080846B4: .4byte gRAMChapterData
_080846B8:
	ldrh r0, [r4, #2]
	cmp r0, #0
	beq _080846D4
	cmp r5, r0
	bne _080846D4
	b _080846A8
_080846C4:
	cmp r6, r1
	bne _080846CC
	cmp r5, r2
	beq _080846A8
_080846CC:
	cmp r5, r3
	bne _080846D4
	cmp r6, r0
	beq _080846A8
_080846D4:
	adds r4, #0x10
	ldrh r0, [r4]
	cmp r0, r7
	bne _08084662
_080846DC:
	movs r0, #0
_080846DE:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END GetBattleQuoteEntry

	THUMB_FUNC_START sub_80846E4
sub_80846E4: @ 0x080846E4
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	ldr r4, _0808472C  @ gUnknown_089ECD4C
	ldrh r0, [r4]
	ldr r1, _08084730  @ 0x0000FFFF
	cmp r0, r1
	beq _08084740
	ldr r5, _08084734  @ gRAMChapterData
	adds r7, r1, #0
_080846F8:
	ldrb r0, [r4, #2]
	cmp r0, #0xff
	beq _08084704
	ldrb r1, [r5, #0x1b]
	cmp r0, r1
	bne _08084738
_08084704:
	ldrb r0, [r4, #3]
	cmp r0, #0xff
	beq _08084714
	adds r1, r0, #0
	movs r0, #0xe
	ldrsb r0, [r5, r0]
	cmp r1, r0
	bne _08084738
_08084714:
	ldrh r0, [r4, #4]
	bl GetEventTriggerState
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08084738
	ldrh r0, [r4]
	cmp r6, r0
	bne _08084738
	adds r0, r4, #0
	b _08084742
	.align 2, 0
_0808472C: .4byte gUnknown_089ECD4C
_08084730: .4byte 0x0000FFFF
_08084734: .4byte gRAMChapterData
_08084738:
	adds r4, #0xc
	ldrh r0, [r4]
	cmp r0, r7
	bne _080846F8
_08084740:
	movs r0, #0
_08084742:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80846E4

	THUMB_FUNC_START sub_8084748
sub_8084748: @ 0x08084748
	push {r4, lr}
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldr r0, _08084784  @ gUnknown_089ED10C
	ldrh r2, [r0]
	ldr r3, _08084788  @ 0x0000FFFF
	cmp r2, r3
	beq _0808477A
_0808475C:
	cmp r4, r2
	bne _08084766
	ldrh r2, [r0, #2]
	cmp r1, r2
	beq _0808477C
_08084766:
	ldrh r2, [r0]
	cmp r1, r2
	bne _08084772
	ldrh r2, [r0, #2]
	cmp r4, r2
	beq _0808477C
_08084772:
	adds r0, #0x10
	ldrh r2, [r0]
	cmp r2, r3
	bne _0808475C
_0808477A:
	movs r0, #0
_0808477C:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08084784: .4byte gUnknown_089ED10C
_08084788: .4byte 0x0000FFFF

	THUMB_FUNC_END sub_8084748

	THUMB_FUNC_START sub_808478C
sub_808478C: @ 0x0808478C
	push {r4, r5, lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r2, r2, #0x18
	lsrs r4, r2, #0x18
	adds r5, r4, #0
	bl sub_8084748
	cmp r0, #0
	beq _080847EE
	cmp r4, #2
	beq _080847BE
	cmp r4, #2
	bgt _080847B2
	cmp r4, #1
	beq _080847B8
	b _080847EE
_080847B2:
	cmp r5, #3
	beq _080847C4
	b _080847EE
_080847B8:
	ldrb r0, [r0, #0xc]
	lsls r0, r0, #0x1b
	b _080847C8
_080847BE:
	ldrh r0, [r0, #0xc]
	lsls r0, r0, #0x16
	b _080847C8
_080847C4:
	ldrb r0, [r0, #0xd]
	lsls r0, r0, #0x19
_080847C8:
	lsrs r0, r0, #0x1b
	cmp r0, #2
	beq _080847E6
	cmp r0, #2
	bgt _080847D8
	cmp r0, #1
	beq _080847E2
	b _080847EE
_080847D8:
	cmp r0, #3
	beq _080847EA
	cmp r0, #4
	beq _080847EA
	b _080847EE
_080847E2:
	movs r0, #0x27
	b _080847F0
_080847E6:
	movs r0, #0x4c
	b _080847F0
_080847EA:
	movs r0, #0x6a
	b _080847F0
_080847EE:
	movs r0, #0
_080847F0:
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_808478C

	THUMB_FUNC_START sub_80847F8
sub_80847F8: @ 0x080847F8
	ldr r0, _080847FC  @ gUnknown_089ED10C
	bx lr
	.align 2, 0
_080847FC: .4byte gUnknown_089ED10C

	THUMB_FUNC_END sub_80847F8

	THUMB_FUNC_START IsCharacterForceDeployed_
IsCharacterForceDeployed_: @ 0x08084800
	push {r4, r5, lr}
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	ldr r2, _0808483C  @ gUnknown_089ED64C
	ldrh r0, [r2]
	ldr r1, _08084840  @ 0x0000FFFF
	cmp r0, r1
	beq _08084850
	ldr r3, _08084844  @ gRAMChapterData
	adds r5, r1, #0
_08084814:
	ldrb r0, [r2, #2]
	cmp r0, #0xff
	beq _08084820
	ldrb r1, [r3, #0x1b]
	cmp r0, r1
	bne _08084848
_08084820:
	ldrb r0, [r2, #3]
	cmp r0, #0xff
	beq _08084830
	adds r1, r0, #0
	movs r0, #0xe
	ldrsb r0, [r3, r0]
	cmp r1, r0
	bne _08084848
_08084830:
	ldrh r0, [r2]
	cmp r4, r0
	bne _08084848
	movs r0, #1
	b _08084852
	.align 2, 0
_0808483C: .4byte gUnknown_089ED64C
_08084840: .4byte 0x0000FFFF
_08084844: .4byte gRAMChapterData
_08084848:
	adds r2, #4
	ldrh r0, [r2]
	cmp r0, r5
	bne _08084814
_08084850:
	movs r0, #0
_08084852:
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END IsCharacterForceDeployed_

	THUMB_FUNC_START IsSethLArachelMyrrhInnes
IsSethLArachelMyrrhInnes: @ 0x08084858
	push {lr}
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	ldr r1, _08084864  @ gUnknown_089ED674
	b _08084874
	.align 2, 0
_08084864: .4byte gUnknown_089ED674
_08084868:
	ldrb r0, [r1]
	cmp r0, r2
	bne _08084872
	movs r0, #1
	b _0808487C
_08084872:
	adds r1, #1
_08084874:
	ldrb r0, [r1]
	cmp r0, #0
	bne _08084868
	movs r0, #0
_0808487C:
	pop {r1}
	bx r1

	THUMB_FUNC_END IsSethLArachelMyrrhInnes

.align 2, 0
