	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	@ Everything related to link arena multiplayer stuff

	@ Needs further splitting, but since I know nothing about
	@ all this, this will have to wait.

	THUMB_FUNC_START sub_80415B0
sub_80415B0: @ 0x080415B0
	push {r4, r5, lr}
	ldr r4, _080415C4  @ gUnknown_03004F08
	ldr r3, [r4]
	cmp r3, #0
	beq _080415CC
	cmp r3, #1
	beq _08041638
	ldr r0, _080415C8  @ gUnknown_030017E4
	ldr r0, [r0]
	b _080416C6
	.align 2, 0
_080415C4: .4byte gUnknown_03004F08
_080415C8: .4byte gUnknown_030017E4
_080415CC:
	ldr r0, _0804161C  @ 0x04000134
	strh r3, [r0]
	ldr r2, _08041620  @ 0x04000128
	ldr r0, _08041624  @ gUnknown_085A92E0
	ldr r0, [r0]
	ldr r1, _08041628  @ 0x00001B78
	adds r0, r0, r1
	ldrh r0, [r0]
	mvns r0, r0
	strh r0, [r2, #2]
	ldr r0, _0804162C  @ gUnknown_030017E0
	ldrb r0, [r0]
	movs r5, #0xc0
	lsls r5, r5, #7
	adds r1, r5, #0
	orrs r0, r1
	strh r0, [r2]
	ldrh r0, [r2]
	adds r2, r0, #0
	movs r0, #8
	ands r0, r2
	cmp r0, #0
	beq _080416C2
	ldr r1, _08041630  @ gUnknown_030017E4
	movs r0, #4
	ands r2, r0
	lsls r0, r2, #0x10
	lsrs r0, r0, #0x10
	str r0, [r1]
	cmp r0, #0
	beq _08041610
	movs r0, #1
	negs r0, r0
	str r0, [r1]
_08041610:
	ldr r0, _08041634  @ gUnknown_03004E74
	str r3, [r0]
	movs r0, #1
	str r0, [r4]
	b _080416C2
	.align 2, 0
_0804161C: .4byte 0x04000134
_08041620: .4byte 0x04000128
_08041624: .4byte gUnknown_085A92E0
_08041628: .4byte 0x00001B78
_0804162C: .4byte gUnknown_030017E0
_08041630: .4byte gUnknown_030017E4
_08041634: .4byte gUnknown_03004E74
_08041638:
	ldr r0, _0804166C  @ 0x04000128
	ldrh r0, [r0]
	adds r2, r0, #0
	ldr r0, _08041670  @ gUnknown_03004E74
	ldr r0, [r0]
	ldr r3, _08041674  @ gUnknown_085A92E0
	cmp r0, #0
	beq _08041680
	movs r0, #0x40
	ands r0, r2
	cmp r0, #0
	bne _08041680
	ldr r0, [r3]
	ldrh r1, [r0, #0x14]
	ldr r0, _08041678  @ 0x0000FFFF
	cmp r1, r0
	beq _08041680
	ldr r1, _0804167C  @ gUnknown_030017E4
	movs r0, #0x30
	ands r2, r0
	lsrs r0, r2, #4
	str r0, [r1]
	movs r1, #2
	str r1, [r4]
	b _080416C6
	.align 2, 0
_0804166C: .4byte 0x04000128
_08041670: .4byte gUnknown_03004E74
_08041674: .4byte gUnknown_085A92E0
_08041678: .4byte 0x0000FFFF
_0804167C: .4byte gUnknown_030017E4
_08041680:
	ldr r2, _080416A4  @ 0x04000128
	ldr r0, [r3]
	ldr r1, _080416A8  @ 0x00001B78
	adds r0, r0, r1
	ldrh r0, [r0]
	mvns r0, r0
	strh r0, [r2, #2]
	ldr r0, _080416AC  @ gUnknown_030017E4
	ldr r0, [r0]
	cmp r0, #0
	beq _080416B4
	ldr r0, _080416B0  @ gUnknown_030017E0
	ldrb r0, [r0]
	movs r3, #0xc0
	lsls r3, r3, #7
	adds r1, r3, #0
	b _080416BE
	.align 2, 0
_080416A4: .4byte 0x04000128
_080416A8: .4byte 0x00001B78
_080416AC: .4byte gUnknown_030017E4
_080416B0: .4byte gUnknown_030017E0
_080416B4:
	ldr r0, _080416CC  @ gUnknown_030017E0
	ldrb r0, [r0]
	movs r5, #0xc1
	lsls r5, r5, #7
	adds r1, r5, #0
_080416BE:
	orrs r0, r1
	strh r0, [r2]
_080416C2:
	movs r0, #1
	negs r0, r0
_080416C6:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080416CC: .4byte gUnknown_030017E0

	THUMB_FUNC_END sub_80415B0

	THUMB_FUNC_START sub_80416D0
sub_80416D0: @ 0x080416D0
	ldr r0, _080416DC  @ 0x04000128
	ldrh r1, [r0]
	movs r0, #0x30
	ands r0, r1
	lsrs r0, r0, #4
	bx lr
	.align 2, 0
_080416DC: .4byte 0x04000128

	THUMB_FUNC_END sub_80416D0

	THUMB_FUNC_START sub_80416E0
sub_80416E0: @ 0x080416E0
	push {r4, r5, lr}
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldr r3, _08041708  @ gUnknown_085A92E0
	ldr r3, [r3]
	ldr r5, _0804170C  @ 0x00001B78
	adds r4, r3, r5
	strh r0, [r4]
	ldr r4, _08041710  @ 0x00001B7A
	adds r0, r3, r4
	strh r1, [r0]
	adds r5, #4
	adds r3, r3, r5
	strh r2, [r3]
	ldr r0, _08041714  @ gUnknown_030017E0
	strb r1, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08041708: .4byte gUnknown_085A92E0
_0804170C: .4byte 0x00001B78
_08041710: .4byte 0x00001B7A
_08041714: .4byte gUnknown_030017E0

	THUMB_FUNC_END sub_80416E0

	THUMB_FUNC_START sub_8041718
sub_8041718: @ 0x08041718
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	ldr r0, _08041868  @ gUnknown_03004E70
	movs r3, #0
	str r3, [r0]
	ldr r2, _0804186C  @ gUnknown_085A92E0
	ldr r0, [r2]
	movs r1, #0
	strh r3, [r0, #0x22]
	strh r3, [r0, #0x24]
	ldr r4, _08041870  @ 0x00001B74
	adds r0, r0, r4
	strb r1, [r0]
	ldr r0, [r2]
	adds r4, #1
	adds r0, r0, r4
	strb r1, [r0]
	ldr r0, [r2]
	adds r4, #1
	adds r0, r0, r4
	strb r1, [r0]
	ldr r0, [r2]
	adds r4, #1
	adds r0, r0, r4
	strb r1, [r0]
	ldr r0, [r2]
	strb r1, [r0, #0x1e]
	ldr r0, [r2]
	strb r1, [r0, #0x1f]
	ldr r0, [r2]
	adds r0, #0x20
	strb r1, [r0]
	ldr r0, [r2]
	strh r3, [r0, #0x30]
	ldr r0, _08041874  @ gUnknown_030017F0
	mov r9, r0
	ldr r1, _08041878  @ gUnknown_030017F2
	mov r8, r1
	adds r5, r2, #0
	movs r4, #0
_0804176C:
	ldr r0, [r5]
	adds r0, #0xb
	adds r0, r0, r3
	strb r4, [r0]
	ldr r1, [r5]
	lsls r2, r3, #1
	adds r0, r1, #0
	adds r0, #0x12
	adds r0, r0, r2
	strh r4, [r0]
	adds r1, #0x1a
	adds r1, r1, r3
	strb r4, [r1]
	ldr r0, [r5]
	adds r0, #0x26
	adds r0, r0, r2
	strh r4, [r0]
	adds r3, #1
	cmp r3, #3
	ble _0804176C
	movs r3, #0
	ldr r5, _0804187C  @ gUnknown_03004F20
	movs r2, #0
	ldr r4, _0804186C  @ gUnknown_085A92E0
_0804179C:
	adds r0, r3, r5
	strb r2, [r0]
	ldr r0, [r4]
	lsls r1, r3, #1
	adds r0, #0x32
	adds r0, r0, r1
	strh r2, [r0]
	adds r3, #1
	cmp r3, #0x7f
	ble _0804179C
	movs r4, #0
	ldr r5, _0804186C  @ gUnknown_085A92E0
	movs r1, #0
	movs r2, #0x9a
	lsls r2, r2, #1
_080417BA:
	ldr r0, [r5]
	adds r0, r0, r2
	strb r1, [r0]
	strb r1, [r0, #4]
	movs r3, #0x7f
	adds r0, #0x89
_080417C6:
	strb r1, [r0]
	subs r0, #1
	subs r3, #1
	cmp r3, #0
	bge _080417C6
	adds r2, #0x8c
	adds r4, #1
	cmp r4, #0x1f
	ble _080417BA
	movs r4, #0
	ldr r2, _0804186C  @ gUnknown_085A92E0
	mov ip, r2
	movs r5, #0
	movs r7, #0x8c
	ldr r6, _08041880  @ 0x000012B4
_080417E4:
	adds r0, r4, #0
	muls r0, r7, r0
	adds r0, r0, r6
	mov r2, ip
	ldr r1, [r2]
	adds r1, r1, r0
	strb r5, [r1]
	strb r5, [r1, #4]
	adds r2, r4, #1
	movs r3, #0x7f
	adds r1, #0x89
_080417FA:
	strb r5, [r1]
	subs r1, #1
	subs r3, #1
	cmp r3, #0
	bge _080417FA
	adds r4, r2, #0
	cmp r4, #0xf
	ble _080417E4
	movs r0, #0
	mov r4, r8
	strh r0, [r4]
	mov r1, r9
	strh r0, [r1]
	movs r1, #0
	ldr r0, _08041884  @ gUnknown_0203C624
	movs r3, #0x80
	lsls r3, r3, #2
_0804181C:
	strh r1, [r0]
	adds r0, #2
	subs r3, #1
	cmp r3, #0
	bne _0804181C
	movs r4, #0
	ldr r2, _08041888  @ gUnknown_030017F8
	mov r8, r2
	movs r5, #0
	ldr r0, _0804188C  @ 0x000001FF
	mov ip, r0
	ldr r7, _08041890  @ gUnknown_0203CA24
	ldr r6, _08041894  @ gUnknown_03001800
_08041836:
	lsls r0, r4, #1
	mov r1, r8
	adds r2, r0, r1
	adds r1, r0, r6
	strh r5, [r1]
	strh r5, [r2]
	adds r2, r4, #1
	adds r0, r0, r7
	mov r3, ip
	adds r3, #1
_0804184A:
	strh r5, [r0]
	adds r0, #8
	subs r3, #1
	cmp r3, #0
	bne _0804184A
	adds r4, r2, #0
	cmp r4, #3
	ble _08041836
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08041868: .4byte gUnknown_03004E70
_0804186C: .4byte gUnknown_085A92E0
_08041870: .4byte 0x00001B74
_08041874: .4byte gUnknown_030017F0
_08041878: .4byte gUnknown_030017F2
_0804187C: .4byte gUnknown_03004F20
_08041880: .4byte 0x000012B4
_08041884: .4byte gUnknown_0203C624
_08041888: .4byte gUnknown_030017F8
_0804188C: .4byte 0x000001FF
_08041890: .4byte gUnknown_0203CA24
_08041894: .4byte gUnknown_03001800

	THUMB_FUNC_END sub_8041718

	THUMB_FUNC_START sub_8041898
sub_8041898: @ 0x08041898
	push {r4, lr}
	ldr r2, _080418F4  @ gUnknown_085A92E0
	ldr r0, [r2]
	movs r4, #0
	strb r4, [r0]
	ldr r0, [r2]
	strb r4, [r0, #1]
	ldr r1, [r2]
	movs r3, #0
	strh r4, [r1, #2]
	strh r4, [r1, #4]
	movs r0, #0xff
	strb r0, [r1, #6]
	ldr r0, [r2]
	strb r3, [r0, #7]
	ldr r0, [r2]
	strb r3, [r0, #8]
	ldr r0, [r2]
	strb r3, [r0, #9]
	ldr r0, [r2]
	strb r3, [r0, #0xf]
	ldr r0, [r2]
	strb r3, [r0, #0x10]
	ldr r0, [r2]
	strb r3, [r0, #0x11]
	ldr r0, [r2]
	adds r0, #0x2e
	strb r3, [r0]
	ldr r0, [r2]
	strb r3, [r0, #0xa]
	ldr r0, _080418F8  @ 0x00006584
	movs r1, #3
	movs r2, #0x88
	bl sub_80416E0
	movs r0, #0
	bl sub_8042980
	bl sub_8041718
	ldr r0, _080418FC  @ gUnknown_030017EC
	str r4, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080418F4: .4byte gUnknown_085A92E0
_080418F8: .4byte 0x00006584
_080418FC: .4byte gUnknown_030017EC

	THUMB_FUNC_END sub_8041898

	THUMB_FUNC_START sub_8041900
sub_8041900: @ 0x08041900
	push {r4, lr}
	ldr r0, _08041950  @ 0x04000134
	movs r3, #0
	strh r3, [r0]
	ldr r2, _08041954  @ 0x04000128
	ldr r0, _08041958  @ gUnknown_030017E0
	ldrb r0, [r0]
	movs r4, #0x80
	lsls r4, r4, #6
	adds r1, r4, #0
	orrs r0, r1
	strh r0, [r2]
	ldr r0, _0804195C  @ 0x0400010E
	strh r3, [r0]
	ldr r2, _08041960  @ gUnknown_03004E74
	ldr r1, _08041964  @ gUnknown_03004E70
	movs r0, #0
	str r0, [r1]
	str r0, [r2]
	ldr r1, _08041968  @ gUnknown_03004F08
	str r0, [r1]
	ldr r1, _0804196C  @ gUnknown_030017E4
	subs r0, #1
	str r0, [r1]
	ldr r1, _08041970  @ sub_80419DC
	movs r0, #7
	bl SetIRQHandler
	ldr r1, _08041974  @ sub_8041D68
	movs r0, #6
	bl SetIRQHandler
	ldr r2, _08041978  @ 0x04000200
	ldrh r0, [r2]
	movs r1, #0xc0
	orrs r0, r1
	strh r0, [r2]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08041950: .4byte 0x04000134
_08041954: .4byte 0x04000128
_08041958: .4byte gUnknown_030017E0
_0804195C: .4byte 0x0400010E
_08041960: .4byte gUnknown_03004E74
_08041964: .4byte gUnknown_03004E70
_08041968: .4byte gUnknown_03004F08
_0804196C: .4byte gUnknown_030017E4
_08041970: .4byte sub_80419DC
_08041974: .4byte sub_8041D68
_08041978: .4byte 0x04000200

	THUMB_FUNC_END sub_8041900

	THUMB_FUNC_START sub_804197C
sub_804197C: @ 0x0804197C
	push {lr}
	ldr r1, _080419C0  @ 0x04000134
	movs r2, #0x80
	lsls r2, r2, #8
	adds r0, r2, #0
	strh r0, [r1]
	subs r1, #0xc
	movs r0, #0
	strh r0, [r1]
	ldr r2, _080419C4  @ gUnknown_03004E74
	ldr r1, _080419C8  @ gUnknown_03004E70
	movs r0, #0
	str r0, [r1]
	str r0, [r2]
	ldr r1, _080419CC  @ gUnknown_03004F08
	str r0, [r1]
	ldr r1, _080419D0  @ gUnknown_030017E4
	subs r0, #1
	str r0, [r1]
	movs r0, #7
	movs r1, #0
	bl SetIRQHandler
	movs r0, #6
	movs r1, #0
	bl SetIRQHandler
	ldr r2, _080419D4  @ 0x04000200
	ldrh r1, [r2]
	ldr r0, _080419D8  @ 0x0000FF3F
	ands r0, r1
	strh r0, [r2]
	pop {r0}
	bx r0
	.align 2, 0
_080419C0: .4byte 0x04000134
_080419C4: .4byte gUnknown_03004E74
_080419C8: .4byte gUnknown_03004E70
_080419CC: .4byte gUnknown_03004F08
_080419D0: .4byte gUnknown_030017E4
_080419D4: .4byte 0x04000200
_080419D8: .4byte 0x0000FF3F

	THUMB_FUNC_END sub_804197C

	THUMB_FUNC_START sub_80419DC
sub_80419DC: @ 0x080419DC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	movs r0, #0
	mov r9, r0
	ldr r0, _08041A70  @ gUnknown_03004E74
	movs r2, #1
	str r2, [r0]
	ldr r1, _08041A74  @ gUnknown_085A92E0
	ldr r0, [r1]
	mov r3, r9
	strb r3, [r0, #0x1e]
	ldr r0, _08041A78  @ gUnknown_03004E70
	str r2, [r0]
	ldr r0, [r1]
	strb r3, [r0, #8]
	ldr r0, _08041A7C  @ 0x0400010E
	mov r2, r9
	strh r2, [r0]
	ldr r2, [r1]
	ldr r3, _08041A80  @ 0x04000128
	ldrh r0, [r3]
	lsls r1, r0, #0x10
	strh r0, [r2, #2]
	ldrh r0, [r2, #4]
	cmp r0, #6
	beq _08041A20
	lsrs r0, r1, #0x14
	movs r1, #3
	ands r0, r1
	strb r0, [r2, #6]
_08041A20:
	ldr r0, _08041A84  @ 0x04000120
	ldr r1, [r0, #4]
	ldr r0, [r0]
	str r0, [sp]
	str r1, [sp, #4]
	ldr r0, _08041A88  @ gUnknown_030017E0
	ldrb r0, [r0]
	movs r2, #0xc0
	lsls r2, r2, #7
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r3]
	ldr r0, _08041A8C  @ 0x00007FFF
	strh r0, [r3, #2]
	movs r5, #0
	ldr r3, _08041A90  @ 0x0000FFFF
	mov sl, r3
	mov r4, sp
	movs r7, #0
_08041A46:
	ldrh r0, [r4]
	cmp r0, #0
	beq _08041A94
	cmp r0, sl
	beq _08041A94
	ldr r2, _08041A74  @ gUnknown_085A92E0
	ldr r0, [r2]
	adds r0, #0xb
	adds r1, r0, r5
	ldrb r0, [r1]
	cmp r0, #0
	bne _08041A62
	movs r0, #1
	strb r0, [r1]
_08041A62:
	ldr r0, [r2]
	movs r1, #1
	lsls r1, r5
	ldrb r2, [r0, #8]
	orrs r1, r2
	strb r1, [r0, #8]
	b _08041ACE
	.align 2, 0
_08041A70: .4byte gUnknown_03004E74
_08041A74: .4byte gUnknown_085A92E0
_08041A78: .4byte gUnknown_03004E70
_08041A7C: .4byte 0x0400010E
_08041A80: .4byte 0x04000128
_08041A84: .4byte 0x04000120
_08041A88: .4byte gUnknown_030017E0
_08041A8C: .4byte 0x00007FFF
_08041A90: .4byte 0x0000FFFF
_08041A94:
	lsls r0, r5, #0x18
	lsrs r0, r0, #0x18
	bl sub_8042194
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _08041ACE
	ldr r0, _08041AC0  @ gUnknown_085A92E0
	ldr r1, [r0]
	adds r0, r1, #0
	adds r0, #0x12
	adds r0, r0, r7
	ldrh r0, [r0]
	cmp r0, sl
	bne _08041AC4
	adds r1, #0x1a
	adds r1, r1, r5
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	b _08041ACE
	.align 2, 0
_08041AC0: .4byte gUnknown_085A92E0
_08041AC4:
	adds r0, r1, #0
	adds r0, #0x1a
	adds r0, r0, r5
	movs r1, #0
	strb r1, [r0]
_08041ACE:
	ldr r0, _08041B24  @ gUnknown_085A92E0
	mov r8, r0
	ldr r6, [r0]
	adds r3, r6, #0
	adds r3, #0x12
	adds r3, r3, r7
	ldr r1, _08041B28  @ gUnknown_0203CA24
	ldr r2, _08041B2C  @ gUnknown_03001800
	adds r2, r7, r2
	ldrh r0, [r2]
	lsls r0, r0, #3
	adds r0, r7, r0
	adds r0, r0, r1
	ldrh r1, [r4]
	strh r1, [r0]
	ldrh r0, [r4]
	ldr r1, _08041B30  @ 0x0000FFFF
	ands r0, r1
	strh r0, [r3]
	ldrh r0, [r2]
	adds r0, #1
	ldr r3, _08041B34  @ 0x000001FF
	mov ip, r3
	mov r1, ip
	ands r0, r1
	strh r0, [r2]
	adds r4, #2
	adds r7, #2
	adds r5, #1
	cmp r5, #3
	ble _08041A46
	mov r4, r8
	adds r1, r6, #0
	ldrh r0, [r1, #4]
	cmp r0, #4
	bls _08041BF0
	ldrb r0, [r1, #1]
	cmp r0, #1
	beq _08041B38
	cmp r0, #3
	beq _08041B98
	b _08041BF0
	.align 2, 0
_08041B24: .4byte gUnknown_085A92E0
_08041B28: .4byte gUnknown_0203CA24
_08041B2C: .4byte gUnknown_03001800
_08041B30: .4byte 0x0000FFFF
_08041B34: .4byte 0x000001FF
_08041B38:
	ldr r0, _08041B84  @ gUnknown_030017F2
	ldr r2, _08041B88  @ gUnknown_030017F0
	ldrh r3, [r2]
	ldrh r0, [r0]
	cmp r0, r3
	beq _08041B60
	ldr r1, _08041B8C  @ gUnknown_0203C624
	ldrh r0, [r2]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	add r0, sp, #8
	strh r1, [r0]
	adds r1, r3, #1
	mov r3, ip
	ands r1, r3
	strh r1, [r2]
	movs r1, #1
	bl sub_8042568
_08041B60:
	ldr r1, [r4]
	movs r0, #6
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bne _08041BF0
	ldr r0, _08041B90  @ 0x00001B7C
	adds r2, r1, r0
	ldrh r0, [r2]
	cmp r0, #0
	beq _08041BF0
	ldr r1, _08041B94  @ 0x0400010C
	negs r0, r0
	str r0, [r1]
	adds r1, #2
	movs r0, #0xc3
	strh r0, [r1]
	b _08041BF0
	.align 2, 0
_08041B84: .4byte gUnknown_030017F2
_08041B88: .4byte gUnknown_030017F0
_08041B8C: .4byte gUnknown_0203C624
_08041B90: .4byte 0x00001B7C
_08041B94: .4byte 0x0400010C
_08041B98:
	movs r0, #6
	ldrsb r0, [r6, r0]
	cmp r0, #0
	beq _08041BB2
	adds r0, r6, #0
	adds r0, #0x30
	movs r1, #1
	bl sub_8042568
	mov r2, r8
	ldr r1, [r2]
	ldr r0, _08041C08  @ 0x00005FFF
	strh r0, [r1, #0x30]
_08041BB2:
	movs r5, #0
	ldr r6, _08041C0C  @ 0x00001288
	mov r4, sp
_08041BB8:
	lsls r0, r5, #0x18
	lsrs r0, r0, #0x18
	bl sub_8042194
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08041BD6
	ldrh r0, [r4]
	cmp r0, r6
	beq _08041BD6
	mov r0, r9
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r9, r0
_08041BD6:
	adds r4, #2
	adds r5, #1
	cmp r5, #3
	ble _08041BB8
	mov r3, r9
	cmp r3, #0
	bne _08041BF0
	ldr r0, _08041C10  @ gUnknown_085A92E0
	ldr r0, [r0]
	ldr r1, _08041C14  @ 0x00001B7E
	adds r0, r0, r1
	movs r1, #1
	strh r1, [r0]
_08041BF0:
	ldr r1, _08041C18  @ gUnknown_03004E70
	movs r0, #0
	str r0, [r1]
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08041C08: .4byte 0x00005FFF
_08041C0C: .4byte 0x00001288
_08041C10: .4byte gUnknown_085A92E0
_08041C14: .4byte 0x00001B7E
_08041C18: .4byte gUnknown_03004E70

	THUMB_FUNC_END sub_80419DC

	THUMB_FUNC_START sub_8041C1C
sub_8041C1C: @ 0x08041C1C
	push {r4, r5, r6, lr}
	sub sp, #4
	ldr r0, _08041C58  @ gUnknown_085A92E0
	ldr r2, [r0]
	ldrh r1, [r2, #4]
	adds r5, r0, #0
	cmp r1, #4
	bhi _08041C2E
	b _08041D5C
_08041C2E:
	ldrb r0, [r2, #1]
	cmp r0, #0
	bne _08041C36
	b _08041D5C
_08041C36:
	ldrb r0, [r2, #0x1e]
	adds r0, #1
	strb r0, [r2, #0x1e]
	ldr r1, [r5]
	ldrh r0, [r1, #4]
	cmp r0, #6
	bne _08041CC4
	adds r0, r1, #0
	adds r0, #0x21
	ldrb r0, [r0]
	cmp r0, #2
	beq _08041C76
	cmp r0, #2
	bgt _08041C5C
	cmp r0, #1
	beq _08041C9C
	b _08041CC4
	.align 2, 0
_08041C58: .4byte gUnknown_085A92E0
_08041C5C:
	cmp r0, #3
	bne _08041CC4
	ldrb r0, [r1, #0x1e]
	cmp r0, #0x3c
	bls _08041C76
	movs r0, #6
	ldrsb r0, [r1, r0]
	adds r1, #0xb
	adds r1, r1, r0
	movs r0, #0
	strb r0, [r1]
	bl sub_808DC74
_08041C76:
	ldr r4, _08041CE8  @ gUnknown_085A92E0
	ldr r0, [r4]
	ldrb r0, [r0, #1]
	cmp r0, #0
	beq _08041C9C
	bl sub_80421E4
	lsls r0, r0, #0x18
	asrs r2, r0, #0x18
	cmp r2, #0
	bne _08041C9C
	ldr r0, [r4]
	movs r1, #6
	ldrsb r1, [r0, r1]
	adds r0, #0xb
	adds r0, r0, r1
	strb r2, [r0]
	bl sub_808DC74
_08041C9C:
	movs r4, #0
	ldr r5, _08041CE8  @ gUnknown_085A92E0
_08041CA0:
	ldr r0, _08041CE8  @ gUnknown_085A92E0
	ldr r1, [r0]
	adds r0, r1, #0
	adds r0, #0x1a
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0x3c
	bls _08041CBE
	adds r0, r1, #0
	adds r0, #0xb
	adds r0, r0, r4
	movs r1, #0
	strb r1, [r0]
	bl sub_808DC74
_08041CBE:
	adds r4, #1
	cmp r4, #3
	ble _08041CA0
_08041CC4:
	adds r4, r5, #0
	ldr r1, [r4]
	ldrb r0, [r1, #1]
	adds r6, r0, #0
	cmp r6, #1
	bne _08041D38
	ldrb r5, [r1, #0x10]
	cmp r5, #0
	bne _08041D1A
	ldrb r0, [r1, #0x11]
	cmp r0, #0x3c
	bls _08041CEC
	bl sub_808DC74
	ldr r1, [r4]
	movs r0, #2
	strh r0, [r1, #4]
	b _08041D5C
	.align 2, 0
_08041CE8: .4byte gUnknown_085A92E0
_08041CEC:
	mov r0, sp
	bl sub_8042694
	cmp r0, #0
	beq _08041D1A
	ldr r1, [sp]
	adds r1, #6
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	bl sub_80422B8
	lsls r0, r0, #0x10
	cmp r0, #0
	ble _08041D1A
	ldr r0, [r4]
	strb r5, [r0, #0x10]
	ldr r1, [r4]
	ldrb r0, [r1, #0x11]
	adds r0, #1
	strb r0, [r1, #0x11]
	ldr r0, [r4]
	adds r0, #0x2e
	strb r6, [r0]
_08041D1A:
	ldr r2, _08041D34  @ gUnknown_085A92E0
	ldr r1, [r2]
	ldrb r0, [r1, #0x10]
	adds r0, #1
	strb r0, [r1, #0x10]
	ldr r4, [r2]
	ldrb r0, [r4, #0x10]
	movs r1, #0x26
	bl __umodsi3
	strb r0, [r4, #0x10]
	b _08041D5C
	.align 2, 0
_08041D34: .4byte gUnknown_085A92E0
_08041D38:
	subs r0, #2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bhi _08041D5C
	movs r0, #6
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bne _08041D5C
	adds r0, r1, #0
	adds r0, #0x30
	movs r1, #1
	negs r1, r1
	bl sub_8042568
	ldr r1, [r5]
	ldr r0, _08041D64  @ 0x00005FFF
	strh r0, [r1, #0x30]
_08041D5C:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08041D64: .4byte 0x00005FFF

	THUMB_FUNC_END sub_8041C1C

	THUMB_FUNC_START sub_8041D68
sub_8041D68: @ 0x08041D68
	ldr r1, _08041D80  @ 0x0400010E
	movs r0, #0
	strh r0, [r1]
	ldr r2, _08041D84  @ 0x04000128
	ldr r0, _08041D88  @ gUnknown_030017E0
	ldrb r0, [r0]
	movs r3, #0xc1
	lsls r3, r3, #7
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2]
	bx lr
	.align 2, 0
_08041D80: .4byte 0x0400010E
_08041D84: .4byte 0x04000128
_08041D88: .4byte gUnknown_030017E0

	THUMB_FUNC_END sub_8041D68

	THUMB_FUNC_START sub_8041D8C
sub_8041D8C: @ 0x08041D8C
	push {r4, r5, lr}
	sub sp, #0x10
	adds r2, r0, #0
	mov r1, sp
	ldr r0, _08041DBC  @ gUnknown_080D8714
	ldm r0!, {r3, r4, r5}
	stm r1!, {r3, r4, r5}
	ldr r0, [r0]
	str r0, [r1]
	ldr r0, _08041DC0  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08041DB4
	lsls r0, r2, #2
	add r0, sp
	ldrh r0, [r0]
	bl m4aSongNumStart
_08041DB4:
	add sp, #0x10
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08041DBC: .4byte gUnknown_080D8714
_08041DC0: .4byte gRAMChapterData

	THUMB_FUNC_END sub_8041D8C

	THUMB_FUNC_START sub_8041DC4
sub_8041DC4: @ 0x08041DC4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r0, _08041E18  @ gUnknown_085A92E0
	ldr r2, [r0]
	ldrb r1, [r2, #1]
	cmp r1, #1
	beq _08041DD6
	b _0804212E
_08041DD6:
	movs r0, #6
	ldrsb r0, [r2, r0]
	lsls r1, r0
	ldrb r0, [r2, #0xf]
	orrs r1, r0
	strb r1, [r2, #0xf]
	movs r7, #0
_08041DE4:
	lsls r4, r7, #0x18
	asrs r0, r4, #0x18
	ldr r5, _08041E18  @ gUnknown_085A92E0
	ldr r1, [r5]
	adds r1, #0x32
	bl sub_80423B0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r1, r0, #0
	adds r2, r7, #1
	mov r8, r2
	cmp r0, #0
	bne _08041E02
	b _08042126
_08041E02:
	cmp r0, #0x16
	beq _08041E30
	cmp r0, #0x16
	bgt _08041E1C
	cmp r0, #4
	bne _08041E10
	b _08041F60
_08041E10:
	cmp r0, #0xa
	beq _08041E30
	b _08042126
	.align 2, 0
_08041E18: .4byte gUnknown_085A92E0
_08041E1C:
	cmp r0, #0x2e
	beq _08041E30
	cmp r0, #0x2e
	bgt _08041E2A
	cmp r0, #0x2a
	beq _08041E30
	b _08042126
_08041E2A:
	cmp r1, #0x80
	beq _08041E30
	b _08042126
_08041E30:
	ldr r6, _08041E88  @ gUnknown_085A92E0
	ldr r3, [r6]
	adds r5, r3, #0
	adds r5, #0x32
	ldrb r0, [r5]
	cmp r0, #0x8c
	beq _08041EBC
	adds r1, r7, #1
	mov r8, r1
	cmp r0, #0x8f
	beq _08041E48
	b _08042126
_08041E48:
	ldrb r1, [r5, #1]
	movs r0, #6
	ldrsb r0, [r3, r0]
	cmp r1, r0
	bne _08041E54
	b _08042126
_08041E54:
	lsls r1, r1, #1
	adds r4, r3, #0
	adds r4, #0x26
	adds r1, r4, r1
	ldrh r0, [r5, #2]
	ldrh r1, [r1]
	cmp r0, r1
	beq _08041E90
	ldr r0, _08041E8C  @ gUnknown_03004F0C
	movs r1, #0x8e
	strb r1, [r0]
	ldrb r1, [r3, #6]
	lsls r1, r1, #4
	ldrb r2, [r5, #1]
	orrs r1, r2
	strb r1, [r0, #1]
	ldrb r1, [r5, #1]
	lsls r1, r1, #1
	adds r1, r4, r1
	ldrh r1, [r1]
	strh r1, [r0, #2]
	movs r1, #4
	bl sub_80422B8
	b _08041DE4
	.align 2, 0
_08041E88: .4byte gUnknown_085A92E0
_08041E8C: .4byte gUnknown_03004F0C
_08041E90:
	adds r0, r5, #0
	bl sub_8042620
	ldr r0, _08041EB8  @ gUnknown_03004F0C
	movs r1, #0x8e
	strb r1, [r0]
	ldr r3, [r6]
	ldrb r1, [r3, #6]
	lsls r1, r1, #4
	ldrb r2, [r5, #1]
	orrs r1, r2
	strb r1, [r0, #1]
	ldrb r1, [r5, #1]
	lsls r1, r1, #1
	adds r3, #0x26
	adds r3, r3, r1
	ldrh r1, [r3]
	adds r1, #1
	strh r1, [r0, #2]
	b _08041F50
	.align 2, 0
_08041EB8: .4byte gUnknown_03004F0C
_08041EBC:
	movs r2, #0
	lsls r1, r7, #4
	adds r0, r7, #1
	mov r8, r0
	ldr r0, _08041F20  @ gUnknown_0203DA24
	subs r1, r1, r7
	adds r3, #0x38
	adds r0, #0xa1
	adds r1, r1, r0
_08041ECE:
	adds r0, r3, r2
	ldrb r0, [r0]
	strb r0, [r1]
	adds r1, #1
	adds r2, #1
	cmp r2, #0xe
	ble _08041ECE
	lsrs r0, r4, #0x18
	bl sub_8042194
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08041EFA
	ldr r0, _08041F24  @ gUnknown_085A92E0
	ldr r1, [r0]
	ldrb r0, [r1]
	ldrh r2, [r5, #2]
	cmp r0, r2
	bne _08041EFA
	ldrh r0, [r1, #4]
	cmp r0, #5
	bls _08041F08
_08041EFA:
	lsrs r0, r4, #0x18
	bl sub_8042194
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _08041F2C
_08041F08:
	ldr r0, _08041F24  @ gUnknown_085A92E0
	ldr r2, [r0]
	movs r0, #6
	ldrsb r0, [r2, r0]
	cmp r0, #0
	beq _08041F16
	b _08042126
_08041F16:
	ldr r0, _08041F28  @ gUnknown_03004F0C
	movs r1, #0x86
	strb r1, [r0]
	ldrb r1, [r2, #6]
	b _08041F4C
	.align 2, 0
_08041F20: .4byte gUnknown_0203DA24
_08041F24: .4byte gUnknown_085A92E0
_08041F28: .4byte gUnknown_03004F0C
_08041F2C:
	ldr r0, _08041F58  @ gUnknown_085A92E0
	ldr r1, [r0]
	movs r0, #6
	ldrsb r0, [r1, r0]
	cmp r0, #0
	beq _08041F3A
	b _08042126
_08041F3A:
	ldrb r0, [r1]
	movs r2, #0x85
	ldrh r5, [r5, #2]
	cmp r0, r5
	beq _08041F46
	movs r2, #0x87
_08041F46:
	ldr r0, _08041F5C  @ gUnknown_03004F0C
	strb r2, [r0]
	ldrb r1, [r1, #6]
_08041F4C:
	strb r1, [r0, #1]
	strh r7, [r0, #2]
_08041F50:
	movs r1, #4
	bl sub_80422B8
	b _08042126
	.align 2, 0
_08041F58: .4byte gUnknown_085A92E0
_08041F5C: .4byte gUnknown_03004F0C
_08041F60:
	ldr r0, [r5]
	adds r5, r0, #0
	adds r5, #0x32
	ldrb r0, [r5]
	subs r0, #0x84
	cmp r0, #0xa
	bls _08041F70
	b _08042126
_08041F70:
	lsls r0, r0, #2
	ldr r1, _08041F7C  @ _08041F80
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08041F7C: .4byte _08041F80
_08041F80: @ jump table
	.4byte _0804211C @ case 0
	.4byte _080420B4 @ case 1
	.4byte _080420E0 @ case 2
	.4byte _08042070 @ case 3
	.4byte _08042126 @ case 4
	.4byte _08041FAC @ case 5
	.4byte _08042126 @ case 6
	.4byte _08042126 @ case 7
	.4byte _08042126 @ case 8
	.4byte _08042126 @ case 9
	.4byte _08041FC4 @ case 10
_08041FAC:
	ldr r0, _08041FC0  @ gUnknown_085A92E0
	ldr r2, [r0]
	movs r0, #1
	ldrb r5, [r5, #1]
	lsls r0, r5
	ldrb r1, [r2, #0xa]
	orrs r0, r1
	strb r0, [r2, #0xa]
	b _08042122
	.align 2, 0
_08041FC0: .4byte gUnknown_085A92E0
_08041FC4:
	ldr r6, _08042064  @ gUnknown_085A92E0
	ldr r3, [r6]
	adds r0, r3, #0
	adds r0, #0x2e
	ldrb r0, [r0]
	adds r7, #1
	mov r8, r7
	cmp r0, #0
	bne _08041FD8
	b _08042126
_08041FD8:
	ldrb r2, [r5, #1]
	lsrs r4, r2, #4
	movs r1, #6
	ldrsb r1, [r3, r1]
	cmp r4, r1
	bne _08041FE6
	b _08042126
_08041FE6:
	movs r0, #0xf
	ands r0, r2
	cmp r0, r1
	beq _08041FF0
	b _08042126
_08041FF0:
	ldrh r0, [r3, #0x24]
	adds r0, #1
	ldrh r1, [r5, #2]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r1, r0
	beq _08042000
	b _08042126
_08042000:
	movs r0, #1
	lsls r0, r4
	ldrb r1, [r3, #0xf]
	orrs r0, r1
	strb r0, [r3, #0xf]
	ldr r0, _08042068  @ gUnknown_030017E8
	ldr r1, [r0]
	ldr r0, [r6]
	ldrb r0, [r0, #0xf]
	strb r0, [r1]
	ldr r4, [r6]
	ldrb r0, [r4, #0xf]
	ldrb r1, [r4, #9]
	ands r0, r1
	cmp r0, r1
	beq _08042022
	b _08042126
_08042022:
	ldrh r0, [r4, #0x24]
	adds r0, #1
	movs r3, #0
	strh r0, [r4, #0x24]
	ldr r2, _0804206C  @ 0x00001B74
	adds r0, r4, r2
	ldrb r1, [r0]
	movs r0, #0x8c
	muls r0, r1, r0
	adds r0, r4, r0
	movs r1, #0x9c
	lsls r1, r1, #1
	adds r0, r0, r1
	strb r3, [r0]
	ldr r1, [r6]
	adds r1, r1, r2
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldr r1, [r6]
	adds r1, r1, r2
	ldrb r2, [r1]
	movs r0, #0x1f
	ands r0, r2
	strb r0, [r1]
	ldr r0, [r6]
	adds r0, #0x2e
	strb r3, [r0]
	ldr r0, [r6]
	strb r3, [r0, #0xf]
	strb r3, [r0, #0x11]
	strb r3, [r0, #0x10]
	b _08042126
	.align 2, 0
_08042064: .4byte gUnknown_085A92E0
_08042068: .4byte gUnknown_030017E8
_0804206C: .4byte 0x00001B74
_08042070:
	ldrb r0, [r5, #2]
	bl sub_8042194
	lsls r0, r0, #0x18
	adds r7, #1
	mov r8, r7
	cmp r0, #0
	bne _08042126
	ldr r4, _080420B0  @ gUnknown_085A92E0
	ldr r0, [r4]
	movs r1, #6
	ldrsb r1, [r0, r1]
	adds r0, #0xb
	adds r0, r0, r1
	movs r3, #2
	strb r3, [r0]
	ldr r1, [r4]
	ldrh r2, [r1, #2]
	movs r0, #0x30
	ands r0, r2
	lsrs r0, r0, #4
	adds r1, #0xb
	adds r1, r1, r0
	strb r3, [r1]
	ldr r0, [r4]
	adds r0, #0xb
	ldrh r5, [r5, #2]
	adds r0, r0, r5
	strb r3, [r0]
	ldr r1, [r4]
	b _080420D4
	.align 2, 0
_080420B0: .4byte gUnknown_085A92E0
_080420B4:
	ldrb r0, [r5, #2]
	bl sub_8042194
	lsls r0, r0, #0x18
	adds r7, #1
	mov r8, r7
	cmp r0, #0
	bne _08042126
	ldr r2, _080420DC  @ gUnknown_085A92E0
	ldr r0, [r2]
	adds r0, #0xb
	ldrh r5, [r5, #2]
	adds r0, r0, r5
	movs r1, #2
	strb r1, [r0]
	ldr r1, [r2]
_080420D4:
	movs r0, #6
	strh r0, [r1, #4]
	b _08042126
	.align 2, 0
_080420DC: .4byte gUnknown_085A92E0
_080420E0:
	ldr r0, _08042114  @ gUnknown_0203DA24
	adds r0, #0x9c
	ldrh r2, [r5, #2]
	adds r0, r0, r2
	movs r4, #0
	movs r2, #1
	strb r2, [r0]
	ldr r3, _08042118  @ gUnknown_085A92E0
	ldr r0, [r3]
	adds r0, #0xb
	ldrh r1, [r5, #2]
	adds r0, r0, r1
	movs r1, #5
	strb r1, [r0]
	ldr r1, [r3]
	ldrh r0, [r5, #2]
	lsls r2, r0
	ldrb r0, [r1, #9]
	orrs r2, r0
	strb r2, [r1, #9]
	ldr r0, [r3]
	adds r0, #0x1a
	ldrh r5, [r5, #2]
	adds r0, r0, r5
	strb r4, [r0]
	b _08042122
	.align 2, 0
_08042114: .4byte gUnknown_0203DA24
_08042118: .4byte gUnknown_085A92E0
_0804211C:
	ldrb r0, [r5, #1]
	bl sub_8041D8C
_08042122:
	adds r7, #1
	mov r8, r7
_08042126:
	mov r7, r8
	cmp r7, #3
	bgt _0804212E
	b _08041DE4
_0804212E:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8041DC4

	THUMB_FUNC_START sub_8042138
sub_8042138: @ 0x08042138
	bx lr

	THUMB_FUNC_END sub_8042138

	THUMB_FUNC_START sub_804213C
sub_804213C: @ 0x0804213C
	push {r4, r5, lr}
	movs r5, #0
	movs r4, #0
_08042142:
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	bl sub_8042194
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _08042158
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
_08042158:
	adds r4, #1
	cmp r4, #3
	ble _08042142
	adds r0, r5, #0
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_804213C

	THUMB_FUNC_START sub_8042168
sub_8042168: @ 0x08042168
	push {r4, r5, lr}
	movs r5, #0
	movs r4, #0
_0804216E:
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	bl sub_80421BC
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _08042184
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
_08042184:
	adds r4, #1
	cmp r4, #3
	ble _0804216E
	adds r0, r5, #0
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8042168

	THUMB_FUNC_START sub_8042194
sub_8042194: @ 0x08042194
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _080421B0  @ gUnknown_085A92E0
	ldr r1, [r1]
	ldrb r1, [r1, #9]
	asrs r1, r0
	movs r0, #1
	ands r1, r0
	cmp r1, #0
	bne _080421B4
	movs r0, #0
	b _080421B6
	.align 2, 0
_080421B0: .4byte gUnknown_085A92E0
_080421B4:
	movs r0, #1
_080421B6:
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8042194

	THUMB_FUNC_START sub_80421BC
sub_80421BC: @ 0x080421BC
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _080421D8  @ gUnknown_085A92E0
	ldr r1, [r1]
	ldrb r1, [r1, #8]
	asrs r1, r0
	movs r0, #1
	ands r1, r0
	cmp r1, #0
	bne _080421DC
	movs r0, #0
	b _080421DE
	.align 2, 0
_080421D8: .4byte gUnknown_085A92E0
_080421DC:
	movs r0, #1
_080421DE:
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80421BC

	THUMB_FUNC_START sub_80421E4
sub_80421E4: @ 0x080421E4
	push {r4, lr}
	ldr r2, _08042210  @ gUnknown_085A92E0
	ldr r3, [r2]
	ldrh r1, [r3, #2]
	movs r0, #0
	strh r0, [r3, #2]
	movs r4, #8
	ands r1, r4
	cmp r1, #0
	bne _08042218
	ldr r0, _08042214  @ 0x04000128
	ldrh r1, [r0]
	adds r0, r4, #0
	ands r0, r1
	cmp r0, #0
	bne _08042218
	adds r1, r3, #0
	adds r1, #0x20
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	b _08042220
	.align 2, 0
_08042210: .4byte gUnknown_085A92E0
_08042214: .4byte 0x04000128
_08042218:
	ldr r0, [r2]
	adds r0, #0x20
	movs r1, #0
	strb r1, [r0]
_08042220:
	ldr r0, [r2]
	adds r0, #0x20
	ldrb r0, [r0]
	cmp r0, #0xa
	bhi _0804222E
	movs r0, #1
	b _08042230
_0804222E:
	movs r0, #0
_08042230:
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80421E4

	THUMB_FUNC_START sub_8042238
sub_8042238: @ 0x08042238
	push {lr}
	ldr r0, _08042254  @ gUnknown_085A92E0
	ldr r0, [r0]
	ldr r2, _08042258  @ 0x00001B75
	adds r1, r0, r2
	ldr r3, _0804225C  @ 0x00001B74
	adds r2, r0, r3
	ldrb r0, [r1]
	ldrb r3, [r2]
	cmp r0, r3
	bcs _08042260
	ldrb r1, [r2]
	subs r1, #0x20
	b _08042264
	.align 2, 0
_08042254: .4byte gUnknown_085A92E0
_08042258: .4byte 0x00001B75
_0804225C: .4byte 0x00001B74
_08042260:
	ldrb r0, [r1]
	ldrb r1, [r2]
_08042264:
	subs r0, r0, r1
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8042238

	THUMB_FUNC_START sub_804226C
sub_804226C: @ 0x0804226C
	push {r4, lr}
	movs r2, #0
	movs r1, #0
	ldr r4, _080422AC  @ gUnknown_085A92E0
	ldr r0, [r4]
	adds r3, r0, #0
	adds r3, #0xb
_0804227A:
	adds r0, r3, r1
	ldrb r0, [r0]
	cmp r0, #5
	bne _08042284
	adds r2, #1
_08042284:
	adds r1, #1
	cmp r1, #3
	ble _0804227A
	ldr r0, [r4]
	ldrb r0, [r0, #9]
	cmp r0, #3
	bne _08042296
	cmp r2, #2
	beq _080422A6
_08042296:
	cmp r0, #7
	bne _0804229E
	cmp r2, #3
	beq _080422A6
_0804229E:
	cmp r0, #0xf
	bne _080422B0
	cmp r2, #4
	bne _080422B0
_080422A6:
	movs r0, #1
	b _080422B2
	.align 2, 0
_080422AC: .4byte gUnknown_085A92E0
_080422B0:
	movs r0, #0
_080422B2:
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_804226C

	THUMB_FUNC_START sub_80422B8
sub_80422B8: @ 0x080422B8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	mov r9, r0
	lsls r1, r1, #0x10
	lsrs r5, r1, #0x10
	movs r0, #0
	mov r8, r0
	ldr r0, _08042358  @ gUnknown_030017F2
	ldrh r3, [r0]
	cmp r5, #0x80
	bhi _08042350
	lsrs r5, r1, #0x11
	ldr r1, _0804235C  @ 0x00004FFF
	adds r4, r5, r1
	ldr r2, _08042360  @ gUnknown_0203C624
	lsls r0, r3, #1
	adds r0, r0, r2
	strh r1, [r0]
	adds r3, #1
	ldr r6, _08042364  @ 0x000001FF
	ands r3, r6
	ldr r0, _08042368  @ gUnknown_030017F0
	ldrh r1, [r0]
	mov ip, r2
	mov sl, r0
	cmp r3, r1
	beq _08042350
	lsls r0, r3, #1
	add r0, ip
	strh r5, [r0]
	adds r3, #1
	ands r3, r6
	lsls r6, r3, #1
	adds r7, r3, #1
	cmp r3, r1
	beq _08042350
	movs r2, #0
	cmp r2, r5
	bge _0804232C
	mov r3, r9
_0804230E:
	ldrh r0, [r3]
	adds r2, #1
	adds r1, r0, #0
	muls r1, r2, r1
	adds r0, r4, r1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	mvns r1, r1
	add r1, r8
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov r8, r1
	adds r3, #2
	cmp r2, r5
	blt _0804230E
_0804232C:
	mov r1, ip
	adds r0, r6, r1
	strh r4, [r0]
	ldr r4, _08042364  @ 0x000001FF
	adds r3, r4, #0
	ands r3, r7
	mov r2, sl
	ldrh r1, [r2]
	cmp r3, r1
	beq _08042350
	lsls r0, r3, #1
	add r0, ip
	mov r2, r8
	strh r2, [r0]
	adds r3, #1
	ands r3, r4
	cmp r3, r1
	bne _0804236C
_08042350:
	movs r0, #1
	negs r0, r0
	b _0804239C
	.align 2, 0
_08042358: .4byte gUnknown_030017F2
_0804235C: .4byte 0x00004FFF
_08042360: .4byte gUnknown_0203C624
_08042364: .4byte 0x000001FF
_08042368: .4byte gUnknown_030017F0
_0804236C:
	movs r2, #0
	cmp r2, r5
	bge _08042394
	mov r8, ip
	adds r7, r4, #0
	mov r4, r9
	mov r6, sl
_0804237A:
	lsls r0, r3, #1
	add r0, r8
	ldrh r1, [r4]
	strh r1, [r0]
	adds r3, #1
	ands r3, r7
	ldrh r0, [r6]
	cmp r3, r0
	beq _08042350
	adds r4, #2
	adds r2, #1
	cmp r2, r5
	blt _0804237A
_08042394:
	ldr r1, _080423AC  @ gUnknown_030017F2
	strh r3, [r1]
	lsls r0, r5, #0x10
	asrs r0, r0, #0x10
_0804239C:
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080423AC: .4byte gUnknown_030017F2

	THUMB_FUNC_END sub_80422B8

	THUMB_FUNC_START sub_80423B0
sub_80423B0: @ 0x080423B0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	str r1, [sp, #4]
	lsls r0, r0, #0x18
	movs r1, #0
	mov r8, r1
	movs r3, #0
	str r3, [sp, #0xc]
	ldr r2, _08042428  @ gUnknown_030017F8
	lsrs r7, r0, #0x18
	str r7, [sp]
	asrs r3, r0, #0x17
	adds r4, r3, r2
	ldr r0, _0804242C  @ gUnknown_03001800
	adds r7, r3, r0
	ldrh r1, [r4]
	ldrh r5, [r7]
	mov sl, r2
	cmp r1, r5
	beq _080424B2
	ldr r0, _08042430  @ gUnknown_0203CA24
	ldrh r2, [r4]
	lsls r1, r2, #3
	adds r1, r3, r1
	adds r1, r1, r0
	ldrh r1, [r1]
	ldr r6, _08042434  @ 0x00004FFF
	mov r9, r0
	cmp r1, r6
	beq _0804243C
	cmp r2, r5
	beq _0804246A
	adds r1, r3, #0
	adds r3, r4, #0
	mov ip, r6
	adds r4, r7, #0
	ldr r6, _08042438  @ 0x000001FF
	mov r5, r9
_08042404:
	ldrh r0, [r3]
	adds r0, #1
	ands r0, r6
	strh r0, [r3]
	ldrh r2, [r3]
	lsls r0, r2, #3
	adds r0, r1, r0
	adds r0, r0, r5
	ldrh r0, [r0]
	cmp r0, ip
	bne _08042420
	ldrh r0, [r4]
	cmp r2, r0
	bne _0804243C
_08042420:
	ldrh r7, [r4]
	cmp r2, r7
	bne _08042404
	b _0804246A
	.align 2, 0
_08042428: .4byte gUnknown_030017F8
_0804242C: .4byte gUnknown_03001800
_08042430: .4byte gUnknown_0203CA24
_08042434: .4byte 0x00004FFF
_08042438: .4byte 0x000001FF
_0804243C:
	ldr r1, [sp]
	lsls r0, r1, #0x18
	asrs r1, r0, #0x17
	ldr r3, _0804245C  @ gUnknown_03001800
	adds r2, r1, r3
	add r1, sl
	ldrh r2, [r2]
	ldrh r1, [r1]
	adds r4, r0, #0
	cmp r2, r1
	bcs _08042460
	movs r7, #0x80
	lsls r7, r7, #2
	adds r0, r2, r7
	subs r0, r0, r1
	b _08042462
	.align 2, 0
_0804245C: .4byte gUnknown_03001800
_08042460:
	subs r0, r2, r1
_08042462:
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #4
	bhi _08042470
_0804246A:
	movs r0, #4
	negs r0, r0
	b _08042558
_08042470:
	asrs r0, r4, #0x17
	add r0, sl
	ldrh r0, [r0]
	adds r3, r0, #1
	ldr r0, _08042484  @ 0x000001FF
	cmp r3, r0
	bgt _08042488
	lsls r0, r3, #0x10
	lsrs r0, r0, #0x10
	b _0804248A
	.align 2, 0
_08042484: .4byte 0x000001FF
_08042488:
	movs r0, #0
_0804248A:
	asrs r4, r4, #0x17
	lsls r0, r0, #3
	adds r0, r4, r0
	add r0, r9
	ldrh r6, [r0]
	cmp r6, #0x80
	bls _080424AC
	mov r1, sl
	adds r0, r4, r1
	ldrh r1, [r0]
	adds r1, #1
	ldr r2, _080424A8  @ 0x000001FF
	ands r1, r2
	strh r1, [r0]
	b _0804246A
	.align 2, 0
_080424A8: .4byte 0x000001FF
_080424AC:
	adds r0, r6, #6
	cmp r0, r1
	ble _080424B8
_080424B2:
	movs r0, #2
	negs r0, r0
	b _08042558
_080424B8:
	mov r3, sl
	adds r2, r4, r3
	ldrh r0, [r2]
	adds r0, #2
	ldr r7, _0804254C  @ 0x000001FF
	ands r0, r7
	strh r0, [r2]
	ldrh r1, [r2]
	lsls r0, r1, #3
	adds r0, r4, r0
	add r0, r9
	ldrh r0, [r0]
	str r0, [sp, #8]
	adds r1, #1
	ands r1, r7
	strh r1, [r2]
	ldrh r1, [r2]
	lsls r0, r1, #3
	adds r0, r4, r0
	add r0, r9
	ldrh r0, [r0]
	mov sl, r0
	adds r1, #1
	ands r1, r7
	strh r1, [r2]
	ldr r0, _08042550  @ 0x00004FFF
	add r0, r8
	adds r0, r6, r0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	movs r3, #0
	cmp r3, r6
	bge _0804253A
	mov ip, r4
	adds r4, r2, #0
	ldr r5, [sp, #4]
_08042502:
	ldrh r0, [r4]
	lsls r0, r0, #3
	add r0, ip
	add r0, r9
	ldrh r2, [r0]
	adds r3, #1
	adds r1, r2, #0
	muls r1, r3, r1
	mov r7, r8
	adds r0, r7, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	mvns r1, r1
	ldr r0, [sp, #0xc]
	adds r1, r0, r1
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	str r1, [sp, #0xc]
	strh r2, [r5]
	ldrh r0, [r4]
	adds r0, #1
	ldr r1, _0804254C  @ 0x000001FF
	ands r0, r1
	strh r0, [r4]
	adds r5, #2
	cmp r3, r6
	blt _08042502
_0804253A:
	ldr r3, [sp, #8]
	cmp r8, r3
	bne _08042546
	ldr r7, [sp, #0xc]
	cmp r7, sl
	beq _08042554
_08042546:
	movs r0, #3
	negs r0, r0
	b _08042558
	.align 2, 0
_0804254C: .4byte 0x000001FF
_08042550: .4byte 0x00004FFF
_08042554:
	lsls r0, r6, #0x11
	asrs r0, r0, #0x10
_08042558:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80423B0

	THUMB_FUNC_START sub_8042568
sub_8042568: @ 0x08042568
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08042580  @ gUnknown_085A92E0
	ldr r3, [r0]
	movs r2, #6
	ldrsb r2, [r3, r2]
	movs r0, #1
	negs r0, r0
	cmp r2, r0
	bne _08042584
	adds r0, r2, #0
	b _080425A6
	.align 2, 0
_08042580: .4byte gUnknown_085A92E0
_08042584:
	ldr r2, _080425AC  @ 0x04000128
	ldrh r0, [r4]
	strh r0, [r2, #2]
	movs r0, #6
	ldrsb r0, [r3, r0]
	cmp r0, #0
	bne _080425A4
	cmp r1, #0
	bge _080425A4
	ldr r0, _080425B0  @ gUnknown_030017E0
	ldrb r0, [r0]
	movs r3, #0xc1
	lsls r3, r3, #7
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2]
_080425A4:
	movs r0, #0
_080425A6:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080425AC: .4byte 0x04000128
_080425B0: .4byte gUnknown_030017E0

	THUMB_FUNC_END sub_8042568

	THUMB_FUNC_START sub_80425B4
sub_80425B4: @ 0x080425B4
	push {r4, r5, r6, lr}
	adds r2, r1, #0
	ldr r3, _080425DC  @ gUnknown_030017F8
	ldr r1, _080425E0  @ gUnknown_03001800
	ldrh r0, [r3]
	ldrh r1, [r1]
	cmp r0, r1
	bne _080425E8
	ldr r1, _080425E4  @ 0x00007FFF
	adds r0, r1, #0
	strh r0, [r2]
	adds r2, #2
	strh r0, [r2]
	adds r2, #2
	strh r0, [r2]
	strh r0, [r2, #2]
	movs r0, #2
	negs r0, r0
	b _08042610
	.align 2, 0
_080425DC: .4byte gUnknown_030017F8
_080425E0: .4byte gUnknown_03001800
_080425E4: .4byte 0x00007FFF
_080425E8:
	movs r4, #0
	ldr r6, _08042618  @ gUnknown_0203CA24
	ldr r5, _0804261C  @ 0x000001FF
_080425EE:
	lsls r1, r4, #1
	ldrh r0, [r3]
	lsls r0, r0, #3
	adds r1, r1, r0
	adds r1, r1, r6
	ldrh r0, [r1]
	strh r0, [r2]
	adds r2, #2
	ldrh r0, [r3]
	adds r0, #1
	ands r0, r5
	strh r0, [r3]
	adds r3, #2
	adds r4, #1
	cmp r4, #3
	ble _080425EE
	movs r0, #0
_08042610:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08042618: .4byte gUnknown_0203CA24
_0804261C: .4byte 0x000001FF

	THUMB_FUNC_END sub_80425B4

	THUMB_FUNC_START sub_8042620
sub_8042620: @ 0x08042620
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r3, _08042688  @ gUnknown_085A92E0
	ldr r2, [r3]
	ldr r1, _0804268C  @ 0x00001B77
	adds r0, r2, r1
	ldrb r1, [r0]
	movs r0, #0x8c
	muls r0, r1, r0
	ldr r1, _08042690  @ 0x000012B4
	adds r0, r0, r1
	adds r1, r2, r0
	ldrb r0, [r4]
	strb r0, [r1, #4]
	ldrb r0, [r4, #1]
	strb r0, [r1, #5]
	ldrh r0, [r4, #2]
	strh r0, [r1, #6]
	ldrh r0, [r4, #4]
	strh r0, [r1, #8]
	movs r2, #0
	adds r6, r3, #0
	ldrh r0, [r4, #4]
	cmp r2, r0
	bge _08042668
	adds r5, r1, #0
	adds r5, #0xa
	adds r3, r4, #6
_08042658:
	adds r0, r5, r2
	adds r1, r3, r2
	ldrb r1, [r1]
	strb r1, [r0]
	adds r2, #1
	ldrh r1, [r4, #4]
	cmp r2, r1
	blt _08042658
_08042668:
	ldr r1, [r6]
	ldr r2, _0804268C  @ 0x00001B77
	adds r1, r1, r2
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldr r1, [r6]
	adds r1, r1, r2
	ldrb r2, [r1]
	movs r0, #0xf
	ands r0, r2
	strb r0, [r1]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08042688: .4byte gUnknown_085A92E0
_0804268C: .4byte 0x00001B77
_08042690: .4byte 0x000012B4

	THUMB_FUNC_END sub_8042620

	THUMB_FUNC_START sub_8042694
sub_8042694: @ 0x08042694
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	ldr r0, _080426E0  @ gUnknown_085A92E0
	ldr r3, [r0]
	ldr r0, _080426E4  @ 0x00001B74
	adds r4, r3, r0
	ldrb r0, [r4]
	movs r6, #0x8c
	adds r5, r0, #0
	muls r5, r6, r5
	adds r0, r3, r5
	movs r1, #0x9c
	lsls r1, r1, #1
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0x8f
	bne _080426EC
	ldr r1, _080426E8  @ gUnknown_030017E8
	movs r2, #0x9a
	lsls r2, r2, #1
	adds r0, r5, r2
	adds r0, r3, r0
	str r0, [r1]
	ldrb r0, [r4]
	muls r0, r6, r0
	adds r0, r3, r0
	movs r1, #0x9e
	lsls r1, r1, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	str r0, [r7]
	ldrb r0, [r4]
	muls r0, r6, r0
	adds r0, r0, r2
	adds r0, r3, r0
	adds r0, #4
	b _080426EE
	.align 2, 0
_080426E0: .4byte gUnknown_085A92E0
_080426E4: .4byte 0x00001B74
_080426E8: .4byte gUnknown_030017E8
_080426EC:
	movs r0, #0
_080426EE:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8042694

	THUMB_FUNC_START sub_80426F4
sub_80426F4: @ 0x080426F4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov ip, r0
	lsls r1, r1, #0x10
	lsrs r7, r1, #0x10
	ldr r6, _08042790  @ gUnknown_030017EC
	movs r0, #1
	str r0, [r6]
	ldr r4, _08042794  @ gUnknown_085A92E0
	ldr r1, [r4]
	ldr r2, _08042798  @ 0x00001B75
	adds r0, r1, r2
	ldrb r0, [r0]
	movs r5, #0x8c
	muls r0, r5, r0
	adds r1, r1, r0
	movs r3, #0x9a
	lsls r3, r3, #1
	adds r1, r1, r3
	movs r0, #0
	strb r0, [r1]
	ldr r1, [r4]
	adds r2, r1, r2
	ldrb r0, [r2]
	muls r0, r5, r0
	adds r0, r0, r3
	adds r5, r1, r0
	adds r2, r5, #4
	movs r0, #0x8f
	strb r0, [r5, #4]
	ldr r0, [r4]
	ldrb r0, [r0, #6]
	strb r0, [r2, #1]
	ldr r1, [r4]
	ldrh r0, [r1, #0x22]
	strh r0, [r2, #2]
	strh r7, [r2, #4]
	ldrh r0, [r1, #0x22]
	adds r0, #1
	strh r0, [r1, #0x22]
	movs r3, #0
	mov r8, r6
	adds r6, r4, #0
	cmp r3, r7
	bcs _08042766
	adds r2, #6
_08042752:
	adds r1, r2, r3
	mov r4, ip
	adds r0, r4, r3
	ldrb r0, [r0]
	strb r0, [r1]
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, r7
	bcc _08042752
_08042766:
	ldr r1, [r6]
	ldr r3, _08042798  @ 0x00001B75
	adds r1, r1, r3
	ldrb r0, [r1]
	adds r2, r0, #1
	movs r4, #0
	strb r2, [r1]
	ldr r2, [r6]
	adds r2, r2, r3
	ldrb r3, [r2]
	movs r1, #0x1f
	ands r1, r3
	strb r1, [r2]
	mov r1, r8
	str r4, [r1]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08042790: .4byte gUnknown_030017EC
_08042794: .4byte gUnknown_085A92E0
_08042798: .4byte 0x00001B75

	THUMB_FUNC_END sub_80426F4

	THUMB_FUNC_START sub_804279C
sub_804279C: @ 0x0804279C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov r9, r0
	str r1, [sp]
	mov sl, r2
_080427AE:
	ldr r0, _080427DC  @ gUnknown_085A92E0
	mov r8, r0
	ldr r2, [r0]
	ldr r7, _080427E0  @ 0x00001B76
	adds r0, r2, r7
	ldrb r1, [r0]
	movs r0, #0x8c
	muls r0, r1, r0
	ldr r1, _080427E4  @ 0x000012B4
	adds r0, r0, r1
	adds r5, r2, r0
	adds r6, r5, #4
	ldrb r0, [r5, #4]
	cmp r0, #0x8f
	bne _080427D6
	ldrb r1, [r6, #1]
	movs r0, #6
	ldrsb r0, [r2, r0]
	cmp r1, r0
	bne _080427E8
_080427D6:
	movs r0, #0
	b _08042910
	.align 2, 0
_080427DC: .4byte gUnknown_085A92E0
_080427E0: .4byte 0x00001B76
_080427E4: .4byte 0x000012B4
_080427E8:
	lsls r0, r1, #1
	adds r3, r2, #0
	adds r3, #0x26
	adds r0, r3, r0
	ldrh r1, [r6, #2]
	ldrh r0, [r0]
	cmp r1, r0
	beq _08042834
	ldr r0, _08042830  @ gUnknown_03004F0C
	movs r1, #0x8e
	strb r1, [r0]
	ldrb r1, [r2, #6]
	lsls r1, r1, #4
	ldrb r2, [r6, #1]
	orrs r1, r2
	strb r1, [r0, #1]
	ldrb r1, [r6, #1]
	lsls r1, r1, #1
	adds r1, r3, r1
	ldrh r1, [r1]
	movs r4, #0
	strh r1, [r0, #2]
	movs r1, #4
	bl sub_80422B8
	strb r4, [r5, #4]
	mov r0, r8
	ldr r1, [r0]
	adds r1, r1, r7
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	mov r0, r8
	ldr r1, [r0]
	adds r1, r1, r7
	b _080428A2
	.align 2, 0
_08042830: .4byte gUnknown_03004F0C
_08042834:
	movs r2, #0
	ldrh r1, [r6, #4]
	cmp r2, r1
	bcs _08042856
	adds r3, r5, #0
	adds r3, #0xa
_08042840:
	mov r0, r9
	adds r1, r0, r2
	adds r0, r3, r2
	ldrb r0, [r0]
	strb r0, [r1]
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	ldrh r1, [r6, #4]
	cmp r2, r1
	bcc _08042840
_08042856:
	mov r0, sl
	cmp r0, #0
	beq _080428B8
	mov r0, r9
	bl _call_via_sl
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080428B8
	ldr r0, _080428AC  @ gUnknown_03004F0C
	movs r1, #0x8e
	strb r1, [r0]
	ldr r5, _080428B0  @ gUnknown_085A92E0
	ldr r3, [r5]
	ldrb r1, [r3, #6]
	lsls r1, r1, #4
	ldrb r2, [r6, #1]
	orrs r1, r2
	strb r1, [r0, #1]
	ldrb r1, [r6, #1]
	lsls r1, r1, #1
	adds r3, #0x26
	adds r3, r3, r1
	ldrh r1, [r3]
	movs r4, #0
	strh r1, [r0, #2]
	movs r1, #4
	bl sub_80422B8
	strb r4, [r6]
	ldr r1, [r5]
	ldr r2, _080428B4  @ 0x00001B76
	adds r1, r1, r2
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldr r1, [r5]
	adds r1, r1, r2
_080428A2:
	ldrb r2, [r1]
	movs r0, #0xf
	ands r0, r2
	strb r0, [r1]
	b _080427AE
	.align 2, 0
_080428AC: .4byte gUnknown_03004F0C
_080428B0: .4byte gUnknown_085A92E0
_080428B4: .4byte 0x00001B76
_080428B8:
	movs r0, #0
	strb r0, [r6]
	ldrb r5, [r6, #1]
	ldr r4, _08042920  @ gUnknown_085A92E0
	ldr r2, [r4]
	lsls r0, r5, #1
	adds r1, r2, #0
	adds r1, #0x26
	adds r1, r1, r0
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	ldr r3, _08042924  @ 0x00001B76
	adds r2, r2, r3
	ldrb r0, [r2]
	adds r0, #1
	strb r0, [r2]
	ldr r1, [r4]
	adds r1, r1, r3
	ldrb r2, [r1]
	movs r0, #0xf
	ands r0, r2
	strb r0, [r1]
	ldr r1, [sp]
	strb r5, [r1]
	ldr r0, _08042928  @ gUnknown_03004F0C
	movs r1, #0x8e
	strb r1, [r0]
	ldr r3, [r4]
	ldrb r1, [r3, #6]
	lsls r1, r1, #4
	ldrb r2, [r6, #1]
	orrs r1, r2
	strb r1, [r0, #1]
	ldrb r1, [r6, #1]
	lsls r1, r1, #1
	adds r3, #0x26
	adds r3, r3, r1
	ldrh r1, [r3]
	strh r1, [r0, #2]
	movs r1, #4
	bl sub_80422B8
	ldrh r0, [r6, #4]
_08042910:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08042920: .4byte gUnknown_085A92E0
_08042924: .4byte 0x00001B76
_08042928: .4byte gUnknown_03004F0C

	THUMB_FUNC_END sub_804279C

	THUMB_FUNC_START sub_804292C
sub_804292C: @ 0x0804292C
	push {lr}
	sub sp, #4
	ldr r1, _08042968  @ 0x00007FFF
	mov r0, sp
	strh r1, [r0]
	ldr r0, _0804296C  @ gUnknown_085A92E0
	ldr r1, [r0]
	movs r0, #0
	strb r0, [r1, #1]
	mov r0, sp
	movs r1, #1
	bl sub_8042568
	ldr r1, _08042970  @ gUnknown_030017F2
	ldr r0, _08042974  @ gUnknown_030017F0
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r3, _08042978  @ gUnknown_030017F8
	ldr r2, _0804297C  @ gUnknown_03001800
	movs r1, #3
_08042954:
	ldrh r0, [r3]
	strh r0, [r2]
	adds r3, #2
	adds r2, #2
	subs r1, #1
	cmp r1, #0
	bge _08042954
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_08042968: .4byte 0x00007FFF
_0804296C: .4byte gUnknown_085A92E0
_08042970: .4byte gUnknown_030017F2
_08042974: .4byte gUnknown_030017F0
_08042978: .4byte gUnknown_030017F8
_0804297C: .4byte gUnknown_03001800

	THUMB_FUNC_END sub_804292C

	THUMB_FUNC_START sub_8042980
sub_8042980: @ 0x08042980
	ldr r1, _0804298C  @ gUnknown_085A92E0
	ldr r1, [r1]
	adds r1, #0x21
	strb r0, [r1]
	bx lr
	.align 2, 0
_0804298C: .4byte gUnknown_085A92E0

	THUMB_FUNC_END sub_8042980

	THUMB_FUNC_START sub_8042990
sub_8042990: @ 0x08042990
	push {lr}
	sub sp, #4
	ldr r1, _080429E4  @ 0x00007FFF
	mov r0, sp
	strh r1, [r0]
	ldr r1, _080429E8  @ gUnknown_085A92E0
	ldr r0, [r1]
	movs r2, #0
	strb r2, [r0, #1]
	ldr r0, [r1]
	ldr r1, _080429EC  @ 0x00001B7C
	adds r0, r0, r1
	strh r2, [r0]
	mov r0, sp
	movs r1, #1
	bl sub_8042568
	ldr r1, _080429F0  @ gUnknown_030017F2
	ldr r0, _080429F4  @ gUnknown_030017F0
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r3, _080429F8  @ gUnknown_030017F8
	ldr r2, _080429FC  @ gUnknown_03001800
	movs r1, #3
_080429C0:
	ldrh r0, [r3]
	strh r0, [r2]
	adds r3, #2
	adds r2, #2
	subs r1, #1
	cmp r1, #0
	bge _080429C0
	ldr r0, _080429E8  @ gUnknown_085A92E0
	ldr r2, [r0]
	ldr r0, _08042A00  @ 0x00001B7E
	adds r1, r2, r0
	movs r0, #0
	strh r0, [r1]
	movs r0, #3
	strb r0, [r2, #1]
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_080429E4: .4byte 0x00007FFF
_080429E8: .4byte gUnknown_085A92E0
_080429EC: .4byte 0x00001B7C
_080429F0: .4byte gUnknown_030017F2
_080429F4: .4byte gUnknown_030017F0
_080429F8: .4byte gUnknown_030017F8
_080429FC: .4byte gUnknown_03001800
_08042A00: .4byte 0x00001B7E

	THUMB_FUNC_END sub_8042990

	THUMB_FUNC_START sub_8042A04
sub_8042A04: @ 0x08042A04
	push {r4, lr}
	sub sp, #4
	ldr r1, _08042A60  @ 0x00002586
	mov r0, sp
	strh r1, [r0]
	ldr r3, _08042A64  @ gUnknown_085A92E0
	ldr r1, [r3]
	movs r2, #0
	movs r0, #0
	strh r0, [r1, #4]
	strb r2, [r1, #1]
	ldr r0, [r3]
	ldr r1, _08042A68  @ 0x00001B7C
	adds r0, r0, r1
	movs r1, #0x88
	strh r1, [r0]
	ldr r1, _08042A6C  @ gUnknown_030017F2
	ldr r0, _08042A70  @ gUnknown_030017F0
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, r3, #0
	ldr r3, _08042A74  @ gUnknown_030017F8
	ldr r2, _08042A78  @ gUnknown_03001800
	movs r1, #3
_08042A34:
	ldrh r0, [r3]
	strh r0, [r2]
	adds r3, #2
	adds r2, #2
	subs r1, #1
	cmp r1, #0
	bge _08042A34
	ldr r1, [r4]
	movs r0, #1
	strb r0, [r1, #1]
	ldr r1, [r4]
	movs r0, #6
	strh r0, [r1, #4]
	movs r1, #1
	negs r1, r1
	mov r0, sp
	bl sub_8042568
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08042A60: .4byte 0x00002586
_08042A64: .4byte gUnknown_085A92E0
_08042A68: .4byte 0x00001B7C
_08042A6C: .4byte gUnknown_030017F2
_08042A70: .4byte gUnknown_030017F0
_08042A74: .4byte gUnknown_030017F8
_08042A78: .4byte gUnknown_03001800

	THUMB_FUNC_END sub_8042A04

	THUMB_FUNC_START sub_8042A7C
sub_8042A7C: @ 0x08042A7C
	push {r4, lr}
	sub sp, #4
	ldr r1, _08042AD8  @ 0x00002586
	mov r0, sp
	strh r1, [r0]
	ldr r3, _08042ADC  @ gUnknown_085A92E0
	ldr r1, [r3]
	movs r2, #0
	movs r0, #0
	strh r0, [r1, #4]
	strb r2, [r1, #1]
	ldr r0, [r3]
	ldr r1, _08042AE0  @ 0x00001B7C
	adds r0, r0, r1
	movs r1, #0x18
	strh r1, [r0]
	ldr r1, _08042AE4  @ gUnknown_030017F2
	ldr r0, _08042AE8  @ gUnknown_030017F0
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, r3, #0
	ldr r3, _08042AEC  @ gUnknown_030017F8
	ldr r2, _08042AF0  @ gUnknown_03001800
	movs r1, #3
_08042AAC:
	ldrh r0, [r3]
	strh r0, [r2]
	adds r3, #2
	adds r2, #2
	subs r1, #1
	cmp r1, #0
	bge _08042AAC
	ldr r1, [r4]
	movs r0, #1
	strb r0, [r1, #1]
	ldr r1, [r4]
	movs r0, #6
	strh r0, [r1, #4]
	movs r1, #1
	negs r1, r1
	mov r0, sp
	bl sub_8042568
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08042AD8: .4byte 0x00002586
_08042ADC: .4byte gUnknown_085A92E0
_08042AE0: .4byte 0x00001B7C
_08042AE4: .4byte gUnknown_030017F2
_08042AE8: .4byte gUnknown_030017F0
_08042AEC: .4byte gUnknown_030017F8
_08042AF0: .4byte gUnknown_03001800

	THUMB_FUNC_END sub_8042A7C

	THUMB_FUNC_START sub_8042AF4
sub_8042AF4: @ 0x08042AF4
	ldr r0, _08042B00  @ gUnknown_030017F2
	ldr r1, _08042B04  @ gUnknown_030017F0
	ldrh r1, [r1]
	strh r1, [r0]
	bx lr
	.align 2, 0
_08042B00: .4byte gUnknown_030017F2
_08042B04: .4byte gUnknown_030017F0

	THUMB_FUNC_END sub_8042AF4

	THUMB_FUNC_START sub_8042B08
sub_8042B08: @ 0x08042B08
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r5, _08042B64  @ gUnknown_085A92E0
	ldr r1, [r5]
	adds r2, r1, #0
	adds r2, #0x2e
	movs r0, #0
	strb r0, [r2]
	strh r0, [r1, #0x22]
	strh r0, [r1, #0x24]
	ldr r1, [r5]
	strh r0, [r1, #0x2c]
	strh r0, [r1, #0x2a]
	strh r0, [r1, #0x28]
	strh r0, [r1, #0x26]
	bl sub_8041718
	mov r1, sp
	adds r0, r4, #0
	adds r0, #0x34
	ldrb r0, [r0]
	strb r0, [r1]
	mov r2, sp
	ldrh r1, [r4, #0x36]
	lsrs r0, r1, #8
	strb r0, [r2, #1]
	mov r0, sp
	strb r1, [r0, #2]
	mov r1, sp
	adds r4, #0x3a
	ldrb r0, [r4]
	strb r0, [r1, #3]
	mov r0, sp
	movs r1, #4
	bl sub_80426F4
	ldr r0, [r5]
	adds r0, #0x2e
	movs r1, #1
	strb r1, [r0]
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08042B64: .4byte gUnknown_085A92E0

	THUMB_FUNC_END sub_8042B08

	THUMB_FUNC_START sub_8042B68
sub_8042B68: @ 0x08042B68
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x2c]
	cmp r1, #0
	beq _08042B76
	bl _call_via_r1
_08042B76:
	ldr r5, _08042BD4  @ gUnknown_085A92E0
	ldr r1, [r5]
	adds r0, r1, #0
	adds r0, #0x2e
	ldrb r6, [r0]
	cmp r6, #0
	bne _08042BCC
	ldrh r2, [r4, #0x38]
	ldrh r0, [r1, #0x24]
	subs r0, #1
	cmp r2, r0
	beq _08042BAA
	ldr r0, [r4, #0x30]
	adds r0, #0x7a
	str r0, [r4, #0x30]
	movs r0, #0x64
	muls r0, r2, r0
	ldrh r1, [r4, #0x36]
	bl __divsi3
	adds r1, r4, #0
	adds r1, #0x3b
	strb r0, [r1]
	ldrh r0, [r4, #0x38]
	adds r0, #1
	strh r0, [r4, #0x38]
_08042BAA:
	ldr r0, [r4, #0x30]
	movs r1, #0x7a
	bl sub_80426F4
	ldr r0, [r5]
	adds r0, #0x2e
	movs r1, #1
	strb r1, [r0]
	ldr r0, [r5]
	strb r6, [r0, #0x10]
	ldrh r0, [r4, #0x38]
	ldrh r1, [r4, #0x36]
	cmp r0, r1
	bcc _08042BCC
	adds r0, r4, #0
	bl Proc_Break
_08042BCC:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08042BD4: .4byte gUnknown_085A92E0

	THUMB_FUNC_END sub_8042B68

	THUMB_FUNC_START sub_8042BD8
sub_8042BD8: @ 0x08042BD8
	push {lr}
	ldr r2, _08042BFC  @ gUnknown_085A92E0
	ldr r1, [r2]
	adds r3, r1, #0
	adds r3, #0x2e
	movs r0, #0
	strb r0, [r3]
	strh r0, [r1, #0x22]
	strh r0, [r1, #0x24]
	ldr r1, [r2]
	strh r0, [r1, #0x2c]
	strh r0, [r1, #0x2a]
	strh r0, [r1, #0x28]
	strh r0, [r1, #0x26]
	bl sub_8041718
	pop {r0}
	bx r0
	.align 2, 0
_08042BFC: .4byte gUnknown_085A92E0

	THUMB_FUNC_END sub_8042BD8

	THUMB_FUNC_START sub_8042C00
sub_8042C00: @ 0x08042C00
	push {r4, lr}
	sub sp, #8
	adds r4, r0, #0
	add r1, sp, #4
	mov r0, sp
	movs r2, #0
	bl sub_804279C
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _08042C3C
	mov r0, sp
	ldrb r1, [r0]
	adds r0, r4, #0
	adds r0, #0x34
	strb r1, [r0]
	mov r0, sp
	ldrb r1, [r0, #1]
	lsls r1, r1, #8
	ldrb r0, [r0, #2]
	adds r0, r0, r1
	strh r0, [r4, #0x36]
	mov r0, sp
	ldrb r0, [r0, #3]
	adds r1, r4, #0
	adds r1, #0x3a
	strb r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
_08042C3C:
	add sp, #8
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8042C00

	THUMB_FUNC_START sub_8042C44
sub_8042C44: @ 0x08042C44
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r5, _08042C80  @ gUnknown_02020188
	ldrh r1, [r4, #0x38]
	ldrh r0, [r4, #0x36]
	subs r0, #1
	cmp r1, r0
	bge _08042C84
	ldr r0, [r4, #0x30]
	mov r1, sp
	movs r2, #0
	bl sub_804279C
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _08042CCE
	ldr r0, [r4, #0x30]
	adds r0, #0x7a
	str r0, [r4, #0x30]
	ldrh r1, [r4, #0x38]
	movs r0, #0x64
	muls r0, r1, r0
	ldrh r1, [r4, #0x36]
	bl __divsi3
	adds r1, r4, #0
	adds r1, #0x3b
	strb r0, [r1]
	b _08042CC8
	.align 2, 0
_08042C80: .4byte gUnknown_02020188
_08042C84:
	adds r0, r5, #0
	mov r1, sp
	movs r2, #0
	bl sub_804279C
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _08042CCE
	movs r2, #0
	adds r3, r4, #0
	adds r3, #0x3a
	adds r6, r4, #0
	adds r6, #0x3b
	ldrb r0, [r3]
	cmp r2, r0
	bge _08042CBA
_08042CA4:
	ldr r1, [r4, #0x30]
	adds r0, r5, r2
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r0, [r4, #0x30]
	adds r0, #1
	str r0, [r4, #0x30]
	adds r2, #1
	ldrb r1, [r3]
	cmp r2, r1
	blt _08042CA4
_08042CBA:
	ldrh r1, [r4, #0x38]
	movs r0, #0x64
	muls r0, r1, r0
	ldrh r1, [r4, #0x36]
	bl __divsi3
	strb r0, [r6]
_08042CC8:
	ldrh r0, [r4, #0x38]
	adds r0, #1
	strh r0, [r4, #0x38]
_08042CCE:
	ldr r1, [r4, #0x2c]
	cmp r1, #0
	beq _08042CDA
	adds r0, r4, #0
	bl _call_via_r1
_08042CDA:
	ldrh r0, [r4, #0x38]
	ldrh r1, [r4, #0x36]
	cmp r0, r1
	bcc _08042CE8
	adds r0, r4, #0
	bl Proc_Break
_08042CE8:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8042C44

	THUMB_FUNC_START sub_8042CF0
sub_8042CF0: @ 0x08042CF0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r7, r0, #0
	adds r4, r1, #0
	mov r8, r2
	lsls r3, r3, #0x18
	lsrs r6, r3, #0x18
	ldr r0, _08042D0C  @ 0x0079FF86
	cmp r4, r0
	bls _08042D10
	movs r0, #1
	negs r0, r0
	b _08042D62
	.align 2, 0
_08042D0C: .4byte 0x0079FF86
_08042D10:
	adds r0, r4, #0
	movs r1, #0x7a
	bl __udivsi3
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	adds r0, r4, #0
	movs r1, #0x7a
	bl __umodsi3
	adds r4, r0, #0
	cmp r4, #0
	beq _08042D32
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
_08042D32:
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _08042D6C  @ gUnknown_085A92E4
	ldr r1, [sp, #0x18]
	bl Proc_StartBlocking
	adds r3, r0, #0
	str r7, [r3, #0x30]
	adds r0, #0x34
	movs r2, #0
	strb r6, [r0]
	mov r0, r8
	str r0, [r3, #0x2c]
	movs r1, #0
	strh r5, [r3, #0x36]
	adds r0, r3, #0
	adds r0, #0x3a
	strb r4, [r0]
	adds r0, #1
	strb r1, [r0]
	strh r2, [r3, #0x38]
	adds r0, #1
	strb r1, [r0]
	movs r0, #0
_08042D62:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08042D6C: .4byte gUnknown_085A92E4

	THUMB_FUNC_END sub_8042CF0

	THUMB_FUNC_START sub_8042D70
sub_8042D70: @ 0x08042D70
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	adds r1, r2, #0
	ldr r0, _08042D98  @ gUnknown_085A9304
	bl Proc_StartBlocking
	str r4, [r0, #0x2c]
	str r5, [r0, #0x30]
	adds r2, r0, #0
	adds r2, #0x3b
	movs r1, #0
	strb r1, [r2]
	movs r2, #0
	strh r1, [r0, #0x38]
	adds r0, #0x3c
	strb r2, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08042D98: .4byte gUnknown_085A9304

	THUMB_FUNC_END sub_8042D70

	THUMB_FUNC_START sub_8042D9C
sub_8042D9C: @ 0x08042D9C
	push {lr}
	ldr r0, _08042DB8  @ gUnknown_085A92E4
	bl Proc_Find
	cmp r0, #0
	bne _08042DC0
	ldr r0, _08042DBC  @ gUnknown_085A9304
	bl Proc_Find
	cmp r0, #0
	bne _08042DC0
	movs r0, #0
	b _08042DC2
	.align 2, 0
_08042DB8: .4byte gUnknown_085A92E4
_08042DBC: .4byte gUnknown_085A9304
_08042DC0:
	movs r0, #1
_08042DC2:
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8042D9C

	THUMB_FUNC_START sub_8042DC8
sub_8042DC8: @ 0x08042DC8
	push {lr}
	movs r3, #0
	b _08042DD6
_08042DCE:
	strb r2, [r1]
	adds r0, #1
	adds r1, #1
	adds r3, #1
_08042DD6:
	ldrb r2, [r0]
	cmp r2, #0
	bne _08042DCE
	ldrb r0, [r0]
	strb r0, [r1]
	adds r0, r3, #0
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8042DC8

	THUMB_FUNC_START sub_8042DE8
sub_8042DE8: @ 0x08042DE8
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r2, #0
	adds r6, r3, #0
	bl Text_SetXCursor
	adds r0, r4, #0
	adds r1, r5, #0
	bl Text_SetColorId
	adds r0, r4, #0
	adds r1, r6, #0
	bl Text_AppendDecNumber
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8042DE8

	THUMB_FUNC_START sub_8042E0C
sub_8042E0C: @ 0x08042E0C
	push {lr}
	bl sub_8041900
	bl sub_8041898
	ldr r2, _08042E28  @ gUnknown_085A92E0
	ldr r1, [r2]
	movs r3, #0
	movs r0, #1
	strb r0, [r1, #1]
	ldr r0, [r2]
	strh r3, [r0, #4]
	pop {r0}
	bx r0
	.align 2, 0
_08042E28: .4byte gUnknown_085A92E0

	THUMB_FUNC_END sub_8042E0C

	THUMB_FUNC_START sub_8042E2C
sub_8042E2C: @ 0x08042E2C
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	ldr r0, _08042E70  @ 0x00002586
	mov r1, sp
	strh r0, [r1]
	bl sub_80415B0
	movs r5, #1
	negs r5, r5
	cmp r0, r5
	beq _08042E68
	ldr r4, _08042E74  @ gUnknown_085A92E0
	ldr r1, [r4]
	movs r0, #0
	strb r0, [r1, #0x11]
	ldr r1, [r4]
	movs r0, #5
	strh r0, [r1, #4]
	bl sub_80416D0
	ldr r1, [r4]
	strb r0, [r1, #6]
	mov r0, sp
	adds r1, r5, #0
	bl sub_8042568
	adds r0, r6, #0
	bl Proc_Break
_08042E68:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08042E70: .4byte 0x00002586
_08042E74: .4byte gUnknown_085A92E0

	THUMB_FUNC_END sub_8042E2C

	THUMB_FUNC_START sub_8042E78
sub_8042E78: @ 0x08042E78
	ldr r2, _08042E84  @ gUnknown_0202BCB0
	ldrb r1, [r2, #4]
	movs r0, #0x40
	orrs r0, r1
	strb r0, [r2, #4]
	bx lr
	.align 2, 0
_08042E84: .4byte gUnknown_0202BCB0

	THUMB_FUNC_END sub_8042E78

	THUMB_FUNC_START sub_8042E88
sub_8042E88: @ 0x08042E88
	ldr r2, _08042E94  @ gUnknown_0202BCB0
	ldrb r1, [r2, #4]
	movs r0, #0xbf
	ands r0, r1
	strb r0, [r2, #4]
	bx lr
	.align 2, 0
_08042E94: .4byte gUnknown_0202BCB0

	THUMB_FUNC_END sub_8042E88

	THUMB_FUNC_START CheckSomethingSomewhere
CheckSomethingSomewhere: @ 0x08042E98
	ldr r0, _08042EA4  @ gUnknown_0202BCB0
	ldrb r0, [r0, #4]
	lsrs r0, r0, #6
	movs r1, #1
	ands r0, r1
	bx lr
	.align 2, 0
_08042EA4: .4byte gUnknown_0202BCB0

	THUMB_FUNC_END CheckSomethingSomewhere

	THUMB_FUNC_START sub_8042EA8
sub_8042EA8: @ 0x08042EA8
	ldr r1, _08042EB0  @ gUnknown_0203DA24
	movs r0, #0xff
	strb r0, [r1, #4]
	bx lr
	.align 2, 0
_08042EB0: .4byte gUnknown_0203DA24

	THUMB_FUNC_END sub_8042EA8

	THUMB_FUNC_START sub_8042EB4
sub_8042EB4: @ 0x08042EB4
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	movs r4, #0
	str r4, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #1
	movs r3, #0
	bl sub_8001ED0
	movs r0, #1
	str r0, [sp]
	movs r1, #1
	movs r2, #0
	movs r3, #1
	bl sub_8001F0C
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	str r4, [r5, #0x58]
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8042EB4

	THUMB_FUNC_START sub_8042EF0
sub_8042EF0: @ 0x08042EF0
	push {r4, lr}
	sub sp, #4
	ldr r1, [r0, #0x58]
	adds r1, #1
	str r1, [r0, #0x58]
	movs r4, #0x3f
	ands r4, r1
	cmp r4, #0x1f
	ble _08042F06
	movs r0, #0x40
	subs r4, r0, r4
_08042F06:
	cmp r4, #0x10
	ble _08042F0C
	movs r4, #0x10
_08042F0C:
	movs r0, #0
	str r0, [sp]
	movs r1, #0
	movs r2, #1
	movs r3, #0
	bl sub_8001ED0
	movs r0, #1
	str r0, [sp]
	movs r1, #1
	movs r2, #0
	movs r3, #1
	bl sub_8001F0C
	lsls r1, r4, #0x18
	lsrs r1, r1, #0x18
	movs r2, #0x10
	subs r2, r2, r4
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	movs r0, #1
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8042EF0

	THUMB_FUNC_START sub_8042F44
sub_8042F44: @ 0x08042F44
	ldr r0, _08042F54  @ gLCDControlBuffer
	ldrh r1, [r0, #0x20]
	adds r1, #1
	strh r1, [r0, #0x20]
	ldrh r1, [r0, #0x24]
	subs r1, #1
	strh r1, [r0, #0x24]
	bx lr
	.align 2, 0
_08042F54: .4byte gLCDControlBuffer

	THUMB_FUNC_END sub_8042F44

	THUMB_FUNC_START sub_8042F58
sub_8042F58: @ 0x08042F58
	push {lr}
	adds r2, r0, #0
	ldr r0, _08042F78  @ gUnknown_085A92E0
	ldr r0, [r0]
	ldr r1, _08042F7C  @ 0x00001288
	strh r1, [r0, #0x30]
	ldr r1, _08042F80  @ 0x00001B7E
	adds r0, r0, r1
	ldrh r0, [r0]
	cmp r0, #0
	beq _08042F74
	adds r0, r2, #0
	bl Proc_Break
_08042F74:
	pop {r0}
	bx r0
	.align 2, 0
_08042F78: .4byte gUnknown_085A92E0
_08042F7C: .4byte 0x00001288
_08042F80: .4byte 0x00001B7E

	THUMB_FUNC_END sub_8042F58

	THUMB_FUNC_START sub_8042F84
sub_8042F84: @ 0x08042F84
	ldr r0, _08042F94  @ gUnknown_085A92E0
	ldr r2, [r0]
	movs r1, #6
	ldrsb r1, [r2, r1]
	movs r0, #1
	lsls r0, r1
	strb r0, [r2, #0xa]
	bx lr
	.align 2, 0
_08042F94: .4byte gUnknown_085A92E0

	THUMB_FUNC_END sub_8042F84

	THUMB_FUNC_START sub_8042F98
sub_8042F98: @ 0x08042F98
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _08042FD8  @ gUnknown_03004F0C
	movs r2, #0
	movs r1, #0x89
	strb r1, [r0]
	ldr r4, _08042FDC  @ gUnknown_085A92E0
	ldr r1, [r4]
	ldrb r1, [r1, #6]
	strb r1, [r0, #1]
	strh r2, [r0, #2]
	movs r1, #4
	bl sub_80422B8
	ldr r4, [r4]
	ldrb r0, [r4, #0xa]
	ldrb r1, [r4, #9]
	ands r0, r1
	cmp r0, r1
	bne _08042FD0
	movs r1, #6
	ldrsb r1, [r4, r1]
	movs r0, #1
	lsls r0, r1
	strb r0, [r4, #0xa]
	adds r0, r5, #0
	bl Proc_Break
_08042FD0:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08042FD8: .4byte gUnknown_03004F0C
_08042FDC: .4byte gUnknown_085A92E0

	THUMB_FUNC_END sub_8042F98

	THUMB_FUNC_START sub_8042FE0
sub_8042FE0: @ 0x08042FE0
	push {lr}
	adds r2, r0, #0
	ldr r1, [r2, #0x30]
	ldr r0, [r2, #0x38]
	cmp r1, r0
	bge _08042FF8
	ldr r0, [r2, #0x34]
	cmp r1, r0
	ble _08042FF8
	ldr r0, [r2, #0x2c]
	bl DisplayFrozenUiHand
_08042FF8:
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8042FE0

	THUMB_FUNC_START sub_8042FFC
sub_8042FFC: @ 0x08042FFC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	mov r8, r3
	ldr r7, [sp, #0x18]
	ldr r0, _08043028  @ gUnknown_085A93B8
	adds r1, r4, #0
	bl Proc_Start
	str r5, [r0, #0x2c]
	str r6, [r0, #0x30]
	mov r1, r8
	str r1, [r0, #0x38]
	str r7, [r0, #0x34]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08043028: .4byte gUnknown_085A93B8

	THUMB_FUNC_END sub_8042FFC

	THUMB_FUNC_START sub_804302C
sub_804302C: @ 0x0804302C
	push {lr}
	ldr r0, _08043038  @ gUnknown_085A93B8
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
_08043038: .4byte gUnknown_085A93B8

	THUMB_FUNC_END sub_804302C

	THUMB_FUNC_START sub_804303C
sub_804303C: @ 0x0804303C
	ldr r2, [r0, #0x30]
	adds r2, r2, r1
	str r2, [r0, #0x30]
	bx lr

	THUMB_FUNC_END sub_804303C

	THUMB_FUNC_START sub_8043044
sub_8043044: @ 0x08043044
	push {lr}
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
	ldr r0, _08043090  @ gBG0TilemapBuffer
	movs r1, #0
	bl BG_Fill
	ldr r0, _08043094  @ gBG1TilemapBuffer
	movs r1, #0
	bl BG_Fill
	ldr r0, _08043098  @ gBG2TilemapBuffer
	movs r1, #0
	bl BG_Fill
	movs r0, #7
	bl BG_EnableSyncByMask
	pop {r0}
	bx r0
	.align 2, 0
_08043090: .4byte gBG0TilemapBuffer
_08043094: .4byte gBG1TilemapBuffer
_08043098: .4byte gBG2TilemapBuffer

	THUMB_FUNC_END sub_8043044

	THUMB_FUNC_START sub_804309C
sub_804309C: @ 0x0804309C
	push {lr}
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
	ldr r0, _080430F0  @ gBG0TilemapBuffer
	movs r1, #0
	bl BG_Fill
	ldr r0, _080430F4  @ gBG1TilemapBuffer
	movs r1, #0
	bl BG_Fill
	ldr r0, _080430F8  @ gBG2TilemapBuffer
	movs r1, #0
	bl BG_Fill
	ldr r0, _080430FC  @ gBG3TilemapBuffer
	movs r1, #0
	bl BG_Fill
	movs r0, #0xf
	bl BG_EnableSyncByMask
	pop {r0}
	bx r0
	.align 2, 0
_080430F0: .4byte gBG0TilemapBuffer
_080430F4: .4byte gBG1TilemapBuffer
_080430F8: .4byte gBG2TilemapBuffer
_080430FC: .4byte gBG3TilemapBuffer

	THUMB_FUNC_END sub_804309C

	THUMB_FUNC_START sub_8043100
sub_8043100: @ 0x08043100
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r4, r1, #0
	lsls r1, r4, #3
	ldr r0, _0804312C  @ gUnknown_0203DD0C
	adds r5, r1, r0
	adds r0, r5, #0
	bl Text_Clear
	cmp r6, #0
	bge _08043134
	lsls r1, r4, #7
	movs r0, #0x80
	lsls r0, r0, #3
	adds r1, r1, r0
	ldr r0, _08043130  @ gUnknown_02023CAA
	adds r1, r1, r0
	adds r0, r5, #0
	bl Text_Draw
	b _0804315A
	.align 2, 0
_0804312C: .4byte gUnknown_0203DD0C
_08043130: .4byte gUnknown_02023CAA
_08043134:
	adds r0, r6, #0
	bl GetStringFromIndex
	adds r1, r0, #0
	adds r0, r5, #0
	bl Text_AppendString
	lsls r1, r4, #7
	movs r0, #0x80
	lsls r0, r0, #3
	adds r1, r1, r0
	ldr r0, _08043160  @ gUnknown_02023CAA
	adds r1, r1, r0
	adds r0, r5, #0
	bl Text_Draw
	movs r0, #4
	bl BG_EnableSyncByMask
_0804315A:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08043160: .4byte gUnknown_02023CAA

	THUMB_FUNC_END sub_8043100

	THUMB_FUNC_START sub_8043164
sub_8043164: @ 0x08043164
	push {r4, r5, lr}
	ldr r5, _080431A8  @ gUnknown_0203DA88
	movs r4, #5
_0804316A:
	adds r0, r5, #0
	movs r1, #0xc
	bl Text_Init
	adds r5, #8
	subs r4, #1
	cmp r4, #0
	bge _0804316A
	ldr r5, _080431AC  @ gUnknown_0203DA30
	movs r4, #0xa
_0804317E:
	adds r0, r5, #0
	movs r1, #0xc
	bl Text_Init
	adds r5, #8
	subs r4, #1
	cmp r4, #0
	bge _0804317E
	ldr r5, _080431B0  @ gUnknown_0203DD0C
	movs r4, #1
_08043192:
	adds r0, r5, #0
	movs r1, #0x18
	bl Text_Init
	adds r5, #8
	subs r4, #1
	cmp r4, #0
	bge _08043192
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080431A8: .4byte gUnknown_0203DA88
_080431AC: .4byte gUnknown_0203DA30
_080431B0: .4byte gUnknown_0203DD0C

	THUMB_FUNC_END sub_8043164

	THUMB_FUNC_START sub_80431B4
sub_80431B4: @ 0x080431B4
	push {r4, r5, lr}
	sub sp, #8
	adds r5, r0, #0
	ldr r1, _08043208  @ gUnknown_080D9D4D
	mov r0, sp
	movs r2, #8
	bl memcpy
	movs r1, #0
	movs r4, #4
	adds r0, r5, #0
	adds r0, #0x26
_080431CC:
	strh r1, [r0]
	subs r0, #2
	subs r4, #1
	cmp r4, #0
	bge _080431CC
	movs r4, #0
_080431D8:
	cmp r4, #4
	beq _080431FA
	adds r0, r5, #0
	adds r0, #0x28
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0
	beq _080431FA
	mov r1, sp
	adds r0, r1, r4
	ldrb r1, [r0]
	movs r0, #0xff
	lsls r0, r0, #8
	orrs r1, r0
	adds r0, r5, #0
	bl UnitAddItem
_080431FA:
	adds r4, #1
	cmp r4, #7
	ble _080431D8
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08043208: .4byte gUnknown_080D9D4D

	THUMB_FUNC_END sub_80431B4

	THUMB_FUNC_START sub_804320C
sub_804320C: @ 0x0804320C
	push {r4, lr}
	sub sp, #8
	adds r4, r0, #0
	ldr r1, _0804323C  @ gUnknown_080D9D56
	mov r0, sp
	movs r2, #8
	bl memcpy
	ldr r0, _08043240  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08043232
	lsls r0, r4, #1
	add r0, sp
	ldrh r0, [r0]
	bl m4aSongNumStart
_08043232:
	add sp, #8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804323C: .4byte gUnknown_080D9D56
_08043240: .4byte gRAMChapterData

	THUMB_FUNC_END sub_804320C

	THUMB_FUNC_START sub_8043244
sub_8043244: @ 0x08043244
	push {r4, lr}
	ldr r4, _08043264  @ gUnknown_0203DB10
	adds r0, r4, #0
	bl sub_80A6A40
	ldrb r0, [r4]
	movs r1, #8
	orrs r0, r1
	strb r0, [r4]
	adds r0, r4, #0
	bl sub_80A6A04
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08043264: .4byte gUnknown_0203DB10

	THUMB_FUNC_END sub_8043244

	THUMB_FUNC_START sub_8043268
sub_8043268: @ 0x08043268
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, _0804328C  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r4, [r0, #8]
	adds r3, r4, #0
	cmp r3, #0
	bne _08043298
	ldr r1, _08043290  @ gUnknown_0203DD4C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	cmp r0, #0x3b
	ble _080432EC
	ldr r0, _08043294  @ gUnknown_0300180C
	str r3, [r1]
	str r3, [r0]
	b _080432EC
	.align 2, 0
_0804328C: .4byte gKeyStatusPtr
_08043290: .4byte gUnknown_0203DD4C
_08043294: .4byte gUnknown_0300180C
_08043298:
	ldr r0, _080432CC  @ gUnknown_0203DD4C
	movs r6, #0
	str r6, [r0]
	ldr r1, _080432D0  @ gUnknown_0203DD2C
	ldr r2, _080432D4  @ gUnknown_03001808
	ldr r0, [r2]
	lsls r0, r0, #1
	adds r0, r0, r1
	strh r4, [r0]
	ldr r1, _080432D8  @ gUnknown_0300180C
	ldr r4, [r1]
	lsls r0, r4, #1
	adds r0, r0, r5
	ldrh r0, [r0]
	cmp r3, r0
	bne _080432E0
	adds r0, r4, #1
	str r0, [r1]
	lsls r0, r0, #1
	adds r0, r0, r5
	ldrh r1, [r0]
	ldr r0, _080432DC  @ 0x0000FFFF
	cmp r1, r0
	bne _080432E2
	movs r0, #1
	b _080432EE
	.align 2, 0
_080432CC: .4byte gUnknown_0203DD4C
_080432D0: .4byte gUnknown_0203DD2C
_080432D4: .4byte gUnknown_03001808
_080432D8: .4byte gUnknown_0300180C
_080432DC: .4byte 0x0000FFFF
_080432E0:
	str r6, [r1]
_080432E2:
	ldr r0, [r2]
	adds r0, #1
	movs r1, #0xf
	ands r0, r1
	str r0, [r2]
_080432EC:
	movs r0, #0
_080432EE:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8043268

	THUMB_FUNC_START sub_80432F4
sub_80432F4: @ 0x080432F4
	push {lr}
	ldr r0, _08043304  @ gUnknown_085A93F0
	bl sub_8043268
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1
	.align 2, 0
_08043304: .4byte gUnknown_085A93F0

	THUMB_FUNC_END sub_80432F4

	THUMB_FUNC_START sub_8043308
sub_8043308: @ 0x08043308
	push {lr}
	adds r1, r0, #0
	ldr r0, _08043318  @ gUnknown_085A94AC
	bl Proc_StartBlocking
	pop {r0}
	bx r0
	.align 2, 0
_08043318: .4byte gUnknown_085A94AC

	THUMB_FUNC_END sub_8043308

	THUMB_FUNC_START sub_804331C
sub_804331C: @ 0x0804331C
	push {r4, lr}
	adds r3, r0, #0
	movs r0, #0x4a
	adds r0, r0, r3
	mov ip, r0
	movs r2, #0
	movs r1, #0
	movs r0, #0xd8
	mov r4, ip
	strh r0, [r4]
	adds r0, r3, #0
	adds r0, #0x48
	strb r2, [r0]
	str r1, [r3, #0x40]
	str r1, [r3, #0x3c]
	adds r0, #0xa
	strb r2, [r0]
	adds r1, r3, #0
	adds r1, #0x54
	movs r0, #0xff
	strb r0, [r1]
	subs r1, #1
	movs r0, #1
	negs r0, r0
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x4c
	strb r2, [r0]
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_804331C

	THUMB_FUNC_START sub_804335C
sub_804335C: @ 0x0804335C
	push {r4, lr}
	ldr r0, _08043368  @ gUnknown_0203DA24
	ldrb r0, [r0, #0xa]
	cmp r0, #0
	bne _08043370
	b _08043388
	.align 2, 0
_08043368: .4byte gUnknown_0203DA24
_0804336C:
	movs r0, #1
	b _0804338A
_08043370:
	movs r3, #0
	movs r4, #0x80
	ldr r2, _08043390  @ gUnknown_0203DB7C
_08043376:
	ldrb r1, [r2, #0xf]
	adds r0, r4, #0
	ands r0, r1
	cmp r0, #0
	bne _0804336C
	adds r2, #0x14
	adds r3, #1
	cmp r3, #9
	ble _08043376
_08043388:
	movs r0, #0
_0804338A:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08043390: .4byte gUnknown_0203DB7C

	THUMB_FUNC_END sub_804335C

	THUMB_FUNC_START sub_8043394
sub_8043394: @ 0x08043394
	push {r4, lr}
	movs r3, #0
	movs r4, #0x80
	ldr r2, _080433AC  @ gUnknown_0203DB7C
_0804339C:
	ldrb r1, [r2, #0xf]
	adds r0, r4, #0
	ands r0, r1
	cmp r0, #0
	bne _080433B0
	movs r0, #1
	b _080433BA
	.align 2, 0
_080433AC: .4byte gUnknown_0203DB7C
_080433B0:
	adds r2, #0x14
	adds r3, #1
	cmp r3, #9
	ble _0804339C
	movs r0, #0
_080433BA:
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8043394

	THUMB_FUNC_START sub_80433C0
sub_80433C0: @ 0x080433C0
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	sub sp, #0x10
	mov r9, r0
	lsls r1, r1, #0x18
	lsrs r4, r1, #0x18
	movs r7, #0
	ldr r1, _080433F0  @ gUnknown_085A94A0
	lsls r0, r4, #2
	adds r0, r0, r1
	ldr r0, [r0]
	mov r8, r0
	bl ClearUnits
	cmp r4, #0
	beq _080433F4
	cmp r4, #0
	blt _0804349E
	cmp r4, #2
	bgt _0804349E
	movs r6, #0
	b _08043460
	.align 2, 0
_080433F0: .4byte gUnknown_085A94A0
_080433F4:
	movs r6, #0
	mov r1, r9
	lsls r0, r1, #4
	mov r1, r8
	adds r5, r0, r1
	movs r0, #1
	mov r8, r0
	movs r7, #0
_08043404:
	ldr r0, _08043420  @ gUnknown_0203DB7C
	adds r4, r7, r0
	adds r0, r6, #0
	adds r1, r4, #0
	bl sub_80A66F4
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _08043424
	ldrb r0, [r5, #4]
	strb r0, [r4, #0x10]
	strb r6, [r4, #0xf]
	b _08043440
	.align 2, 0
_08043420: .4byte gUnknown_0203DB7C
_08043424:
	movs r0, #0xcc
	bl GetStringFromIndex
	adds r1, r4, #0
	bl sub_8042DC8
	ldrb r0, [r5, #5]
	strb r0, [r4, #0x10]
	movs r0, #0x80
	negs r0, r0
	adds r1, r0, #0
	adds r0, r6, #0
	orrs r0, r1
	strb r0, [r4, #0xf]
_08043440:
	mov r0, r8
	bl GetUnit
	adds r1, r0, #0
	adds r0, r6, #0
	mov r2, sp
	bl sub_80A693C
	movs r1, #5
	add r8, r1
	adds r7, #0x14
	adds r6, #1
	cmp r6, #9
	ble _08043404
	adds r7, r6, #0
	b _0804349E
_08043460:
	lsls r0, r7, #2
	adds r5, r0, r7
	lsls r1, r5, #2
	ldr r0, _080434B0  @ gUnknown_0203DB7C
	adds r4, r1, r0
	adds r0, r6, #0
	adds r1, r4, #0
	bl sub_80A66F4
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _08043498
	mov r1, r9
	lsls r0, r1, #4
	add r0, r8
	ldrb r0, [r0, #4]
	strb r0, [r4, #0x10]
	strb r6, [r4, #0xf]
	adds r0, r5, #1
	bl GetUnit
	adds r1, r0, #0
	adds r0, r6, #0
	mov r2, sp
	bl sub_80A693C
	adds r7, #1
_08043498:
	adds r6, #1
	cmp r6, #9
	ble _08043460
_0804349E:
	adds r0, r7, #0
	add sp, #0x10
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080434B0: .4byte gUnknown_0203DB7C

	THUMB_FUNC_END sub_80433C0

	THUMB_FUNC_START sub_80434B4
sub_80434B4: @ 0x080434B4
	push {r4, r5, r6, lr}
	mov r6, r9
	mov r5, r8
	push {r5, r6}
	adds r5, r0, #0
	lsls r0, r5, #3
	mov r8, r0
	ldr r6, _0804351C  @ gUnknown_0203DA30
	adds r0, r0, r6
	mov r9, r0
	bl Text_Clear
	mov r0, r9
	movs r1, #0
	bl Text_SetColorId
	lsls r4, r5, #2
	adds r4, r4, r5
	lsls r4, r4, #2
	ldr r0, _08043520  @ gUnknown_0203DB7C
	adds r4, r4, r0
	mov r0, r9
	adds r1, r4, #0
	bl Text_AppendString
	subs r6, #0xc
	add r8, r6
	mov r1, r8
	ldrh r0, [r1, #0xc]
	ldr r1, _08043524  @ 0x00000FFF
	ands r1, r0
	ldrb r2, [r4, #0x10]
	movs r0, #0xf
	ands r0, r2
	lsls r0, r0, #0xc
	orrs r1, r0
	mov r0, r8
	strh r1, [r0, #0xc]
	lsls r5, r5, #7
	ldr r0, _08043528  @ gUnknown_020234BE
	adds r5, r5, r0
	mov r0, r9
	adds r1, r5, #0
	bl Text_Draw
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0804351C: .4byte gUnknown_0203DA30
_08043520: .4byte gUnknown_0203DB7C
_08043524: .4byte 0x00000FFF
_08043528: .4byte gUnknown_020234BE

	THUMB_FUNC_END sub_80434B4

	THUMB_FUNC_START sub_804352C
sub_804352C: @ 0x0804352C
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r4, #0
	b _0804353C
_08043534:
	adds r0, r4, #0
	bl sub_80434B4
	adds r4, #1
_0804353C:
	ldr r0, [r5, #0x38]
	cmp r4, r0
	blt _08043534
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_804352C

	THUMB_FUNC_START sub_8043548
sub_8043548: @ 0x08043548
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r4, r0, #0
	lsls r1, r1, #0x18
	ldr r0, _08043588  @ gUnknown_085A94A0
	lsrs r1, r1, #0x16
	adds r1, r1, r0
	ldr r7, [r1]
	movs r6, #0
	ldr r0, [r4, #0x38]
	cmp r6, r0
	bge _080435D4
	ldr r0, _0804358C  @ gUnknown_0203DA24
	adds r5, r0, #0
	adds r5, #0xc
	ldr r0, _08043590  @ gUnknown_0203DB7C
	mov r8, r0
	movs r3, #0
_08043570:
	ldr r0, _08043590  @ gUnknown_0203DB7C
	adds r2, r3, r0
	ldrb r1, [r2, #0xf]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _08043594
	ldr r0, [r4, #0x3c]
	lsls r0, r0, #4
	adds r0, r0, r7
	ldrb r0, [r0, #4]
	b _0804359C
	.align 2, 0
_08043588: .4byte gUnknown_085A94A0
_0804358C: .4byte gUnknown_0203DA24
_08043590: .4byte gUnknown_0203DB7C
_08043594:
	ldr r0, [r4, #0x3c]
	lsls r0, r0, #4
	adds r0, r0, r7
	ldrb r0, [r0, #5]
_0804359C:
	strb r0, [r2, #0x10]
	ldrh r1, [r5]
	ldr r2, _080435E8  @ 0x00000FFF
	adds r0, r2, #0
	ands r1, r0
	mov r0, r8
	ldrb r2, [r0, #0x10]
	movs r0, #0xf
	ands r0, r2
	lsls r0, r0, #0xc
	orrs r1, r0
	strh r1, [r5]
	lsls r1, r6, #7
	ldr r0, _080435EC  @ gUnknown_020234BE
	adds r1, r1, r0
	adds r0, r5, #0
	str r3, [sp]
	bl Text_Draw
	adds r5, #8
	movs r2, #0x14
	add r8, r2
	ldr r3, [sp]
	adds r3, #0x14
	adds r6, #1
	ldr r0, [r4, #0x38]
	cmp r6, r0
	blt _08043570
_080435D4:
	movs r0, #2
	bl BG_EnableSyncByMask
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080435E8: .4byte 0x00000FFF
_080435EC: .4byte gUnknown_020234BE

	THUMB_FUNC_END sub_8043548

	THUMB_FUNC_START sub_80435F0
sub_80435F0: @ 0x080435F0
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	adds r7, r0, #0
	ldr r5, [r7, #0x40]
	ldr r1, _08043678  @ gUnknown_085A94A0
	ldr r0, _0804367C  @ gUnknown_0203DA24
	mov r9, r0
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	mov r8, r0
	lsls r4, r5, #2
	adds r4, r4, r5
	adds r0, r4, #1
	bl GetUnit
	adds r6, r0, #0
	ldr r0, _08043680  @ gUnknown_0203DB7C
	lsls r4, r4, #2
	adds r4, r4, r0
	ldrb r1, [r4, #0xf]
	movs r0, #0x7f
	ands r0, r1
	bl sub_80A6774
	adds r0, r5, #0
	adds r1, r6, #0
	adds r2, r4, #0
	bl sub_80A693C
	movs r0, #0xcc
	bl GetStringFromIndex
	adds r1, r4, #0
	bl sub_8042DC8
	ldr r0, [r7, #0x3c]
	lsls r0, r0, #4
	add r0, r8
	ldrb r0, [r0, #5]
	strb r0, [r4, #0x10]
	movs r2, #0x80
	negs r2, r2
	adds r1, r2, #0
	adds r0, r5, #0
	orrs r0, r1
	strb r0, [r4, #0xf]
	adds r0, r5, #0
	bl sub_80434B4
	bl sub_8043394
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08043684
	mov r1, r9
	ldrb r0, [r1]
	adds r1, r7, #0
	bl sub_80437C0
	adds r0, r7, #0
	movs r1, #2
	bl Proc_Goto
	b _08043698
	.align 2, 0
_08043678: .4byte gUnknown_085A94A0
_0804367C: .4byte gUnknown_0203DA24
_08043680: .4byte gUnknown_0203DB7C
_08043684:
	adds r0, r7, #0
	adds r0, #0x4d
	ldrb r0, [r0]
	cmp r0, #0
	bne _08043698
	mov r2, r9
	ldrb r0, [r2]
	adds r1, r7, #0
	bl sub_80437C0
_08043698:
	ldr r0, [r7, #0x38]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r1, r7, #0
	adds r1, #0x4a
	ldrh r1, [r1]
	adds r1, #0x28
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl sub_804D24C
	movs r0, #2
	bl BG_EnableSyncByMask
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80435F0

	THUMB_FUNC_START sub_80436C0
sub_80436C0: @ 0x080436C0
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	mov r9, r0
	ldr r7, [r0, #0x40]
	adds r0, #0x53
	ldrb r0, [r0]
	mov r8, r0
	ldr r3, _08043730  @ gUnknown_0203DB7C
	lsls r5, r0, #2
	add r5, r8
	lsls r0, r5, #2
	adds r6, r0, r3
	ldrb r2, [r6, #0xf]
	movs r1, #0x7f
	adds r0, r1, #0
	ands r0, r2
	lsls r4, r7, #2
	adds r4, r4, r7
	lsls r4, r4, #2
	adds r4, r4, r3
	ldrb r2, [r4, #0xf]
	ands r1, r2
	bl sub_80A6840
	ldrb r1, [r6, #0x10]
	ldrb r0, [r4, #0x10]
	strb r0, [r6, #0x10]
	strb r1, [r4, #0x10]
	adds r5, #1
	adds r0, r5, #0
	bl GetUnit
	adds r1, r0, #0
	mov r0, r8
	adds r2, r6, #0
	bl sub_80A693C
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08043734
	movs r0, #0xcc
	bl GetStringFromIndex
	adds r1, r6, #0
	bl sub_8042DC8
	movs r0, #0x80
	negs r0, r0
	adds r1, r0, #0
	mov r0, r8
	orrs r0, r1
	strb r0, [r6, #0xf]
	b _08043738
	.align 2, 0
_08043730: .4byte gUnknown_0203DB7C
_08043734:
	mov r1, r8
	strb r1, [r6, #0xf]
_08043738:
	lsls r4, r7, #2
	adds r4, r4, r7
	adds r0, r4, #1
	bl GetUnit
	adds r1, r0, #0
	lsls r4, r4, #2
	ldr r0, _08043774  @ gUnknown_0203DB7C
	adds r4, r4, r0
	adds r0, r7, #0
	adds r2, r4, #0
	bl sub_80A693C
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08043778
	movs r0, #0xcc
	bl GetStringFromIndex
	adds r1, r4, #0
	bl sub_8042DC8
	movs r0, #0x80
	negs r0, r0
	adds r1, r0, #0
	adds r0, r7, #0
	orrs r0, r1
	strb r0, [r4, #0xf]
	b _0804377A
	.align 2, 0
_08043774: .4byte gUnknown_0203DB7C
_08043778:
	strb r7, [r4, #0xf]
_0804377A:
	adds r0, r7, #0
	bl sub_80434B4
	mov r0, r8
	bl sub_80434B4
	mov r1, r9
	ldr r0, [r1, #0x38]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r1, #0x4a
	ldrh r1, [r1]
	adds r1, #0x28
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl sub_804D24C
	mov r1, r9
	ldr r0, [r1, #0x30]
	bl Proc_End
	mov r1, r9
	adds r1, #0x52
	movs r0, #4
	strb r0, [r1]
	movs r0, #2
	bl BG_EnableSyncByMask
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80436C0

	THUMB_FUNC_START sub_80437C0
sub_80437C0: @ 0x080437C0
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	mov r8, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r6, #0
	ldr r2, _08043838  @ gUnknown_085A94A0
	lsls r1, r0, #2
	adds r1, r1, r2
	ldr r7, [r1]
	cmp r0, #1
	bne _08043848
	ldr r1, _0804383C  @ gUnknown_0203DA24
	ldrb r0, [r1, #5]
	adds r0, #2
	cmp r6, r0
	bge _0804382E
	mov r9, r1
	movs r0, #5
	mov r8, r0
	mov r5, r9
	adds r5, #0x64
	movs r7, #0
_080437F4:
	ldr r0, _08043840  @ 0x0000076B
	bl GetStringFromIndex
	ldr r4, _08043844  @ gUnknown_0203DD50
	adds r4, r7, r4
	adds r1, r4, #0
	bl sub_8042DC8
	adds r0, r5, #0
	bl Text_Clear
	movs r0, #0xa
	str r0, [sp]
	adds r0, r5, #0
	movs r1, #1
	mov r2, r8
	adds r3, r4, #0
	bl sub_8014C54
	movs r1, #3
	add r8, r1
	adds r5, #8
	adds r7, #0xf
	adds r6, #1
	mov r1, r9
	ldrb r0, [r1, #5]
	adds r0, #2
	cmp r6, r0
	blt _080437F4
_0804382E:
	ldr r0, _0804383C  @ gUnknown_0203DA24
	ldrb r0, [r0, #5]
	adds r0, #2
	b _080438B0
	.align 2, 0
_08043838: .4byte gUnknown_085A94A0
_0804383C: .4byte gUnknown_0203DA24
_08043840: .4byte 0x0000076B
_08043844: .4byte gUnknown_0203DD50
_08043848:
	lsls r0, r6, #4
	adds r1, r0, r7
	ldr r0, [r1, #8]
	cmp r0, #0
	bne _08043856
	adds r0, r6, #0
	b _080438B0
_08043856:
	mov r0, r8
	adds r0, #0x4d
	adds r4, r0, r6
	movs r0, #1
	strb r0, [r4]
	movs r5, #0
	ldr r0, [r1, #0xc]
	cmp r0, #0
	beq _08043876
	bl _call_via_r0
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08043876
	strb r5, [r4]
	movs r5, #1
_08043876:
	lsls r4, r6, #3
	ldr r0, _080438AC  @ gUnknown_0203DA88
	adds r4, r4, r0
	adds r0, r4, #0
	bl Text_Clear
	adds r0, r4, #0
	adds r1, r5, #0
	bl Text_SetColorId
	lsls r0, r6, #4
	adds r0, r0, r7
	ldr r0, [r0, #8]
	bl GetStringFromIndex
	adds r3, r0, #0
	lsls r2, r6, #1
	adds r2, #5
	movs r0, #7
	str r0, [sp]
	adds r0, r4, #0
	movs r1, #1
	bl sub_8014C54
	adds r6, #1
	b _08043848
	.align 2, 0
_080438AC: .4byte gUnknown_0203DA88
_080438B0:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80437C0

	THUMB_FUNC_START sub_80438C0
sub_80438C0: @ 0x080438C0
	push {lr}
	adds r3, r0, #0
	ldr r2, _080438E0  @ gUnknown_085A94A0
	ldr r0, _080438E4  @ gUnknown_0203DA24
	ldrb r1, [r0]
	lsls r0, r1, #2
	adds r0, r0, r2
	ldr r2, [r0]
	cmp r1, #1
	beq _080438E8
	ldr r0, [r3, #0x3c]
	lsls r0, r0, #4
	adds r0, r0, r2
	ldrh r0, [r0, #2]
	b _080438FA
	.align 2, 0
_080438E0: .4byte gUnknown_085A94A0
_080438E4: .4byte gUnknown_0203DA24
_080438E8:
	ldr r0, [r3, #0x3c]
	cmp r0, #0
	beq _080438F8
	ldr r0, _080438F4  @ 0x00000743
	b _080438FA
	.align 2, 0
_080438F4: .4byte 0x00000743
_080438F8:
	ldr r0, _08043900  @ 0x00000742
_080438FA:
	pop {r1}
	bx r1
	.align 2, 0
_08043900: .4byte 0x00000742

	THUMB_FUNC_END sub_80438C0

	THUMB_FUNC_START sub_8043904
sub_8043904: @ 0x08043904
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0xc
	adds r7, r0, #0
	ldr r5, _08043AD0  @ gUnknown_0859EF00
	bl sub_8043044
	bl sub_804C33C
	movs r4, #0
	str r4, [sp]
	adds r0, r7, #0
	movs r1, #0
	movs r2, #0x12
	movs r3, #2
	bl sub_8086CE8
	ldr r0, _08043AD4  @ gUnknown_085ABD68
	ldr r1, _08043AD8  @ 0x06014800
	bl CopyDataWithPossibleUncomp
	ldr r0, _08043ADC  @ gUnknown_02023DBA
	ldr r1, _08043AE0  @ gUnknown_085ADF40
	movs r2, #0x80
	lsls r2, r2, #5
	bl CallARM_FillTileRect
	ldr r0, _08043AE4  @ gUnknown_085ADC48
	movs r1, #0x98
	lsls r1, r1, #2
	movs r2, #0x80
	bl CopyToPaletteBuffer
	ldr r0, _08043AE8  @ gUnknown_085AC604
	ldr r1, _08043AEC  @ 0x06016000
	bl CopyDataWithPossibleUncomp
	ldr r0, _08043AF0  @ gUnknown_08A1BD00
	movs r1, #0x88
	lsls r1, r1, #2
	movs r2, #0x40
	bl CopyToPaletteBuffer
	ldr r1, _08043AF4  @ gPaletteBuffer
	adds r0, r1, #0
	adds r0, #0x40
	strh r4, [r0]
	adds r1, #0x42
	movs r2, #2
_08043968:
	ldrh r0, [r5, #8]
	strh r0, [r1]
	adds r5, #2
	adds r1, #2
	subs r2, #1
	cmp r2, #0
	bge _08043968
	bl EnablePaletteSync
	ldr r0, _08043AF8  @ gUnknown_0203DB64
	bl SetFont
	bl Font_LoadForUI
	bl sub_8003D20
	bl sub_8043164
	bl SetupMapSpritesPalettes
	bl SMS_ClearUsageTable
	bl SMS_FlushIndirect
	ldr r0, [r7, #0x3c]
	ldr r1, _08043AFC  @ gUnknown_0203DA24
	ldrb r1, [r1]
	bl sub_80433C0
	str r0, [r7, #0x38]
	adds r6, r7, #0
	adds r6, #0x5c
	adds r5, r7, #0
	adds r5, #0x4a
	movs r1, #0
	add r0, sp, #8
_080439B0:
	strb r1, [r0]
	subs r0, #1
	add r2, sp, #4
	cmp r0, r2
	bge _080439B0
	ldr r0, [r7, #0x3c]
	mov r1, sp
	adds r1, r1, r0
	adds r1, #4
	movs r0, #1
	strb r0, [r1]
	ldr r4, _08043AFC  @ gUnknown_0203DA24
	ldrb r0, [r4]
	adds r1, r7, #0
	bl sub_80437C0
	str r0, [r7, #0x34]
	adds r0, r7, #0
	bl sub_804352C
	ldr r1, [r7, #0x34]
	adds r0, r7, #0
	add r2, sp, #4
	bl sub_804CAEC
	str r0, [r7, #0x2c]
	movs r2, #0
	adds r4, #6
	movs r3, #0xff
_080439EA:
	adds r1, r2, r4
	ldrb r0, [r1]
	orrs r0, r3
	strb r0, [r1]
	adds r2, #1
	cmp r2, #3
	ble _080439EA
	movs r4, #0
	strb r4, [r6]
	ldrh r2, [r5]
	movs r0, #1
	movs r1, #0
	bl BG_SetPosition
	ldr r0, _08043B00  @ gLCDControlBuffer
	mov ip, r0
	ldrb r0, [r0, #1]
	movs r1, #0x20
	orrs r0, r1
	movs r1, #0x40
	orrs r0, r1
	movs r1, #0x7f
	ands r0, r1
	mov r1, ip
	strb r0, [r1, #1]
	mov r0, ip
	adds r0, #0x2d
	strb r4, [r0]
	adds r1, #0x31
	movs r0, #0x28
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x2c
	movs r2, #0xf0
	strb r2, [r0]
	adds r0, #4
	movs r1, #0x88
	strb r1, [r0]
	subs r0, #1
	strb r4, [r0]
	adds r0, #4
	strb r1, [r0]
	subs r0, #5
	strb r2, [r0]
	mov r1, ip
	adds r1, #0x32
	movs r0, #0xa0
	strb r0, [r1]
	mov r5, ip
	adds r5, #0x34
	ldrb r0, [r5]
	movs r4, #1
	orrs r0, r4
	movs r1, #2
	orrs r0, r1
	movs r3, #4
	orrs r0, r3
	movs r2, #8
	orrs r0, r2
	movs r6, #0x10
	orrs r0, r6
	strb r0, [r5]
	movs r0, #0x35
	add r0, ip
	mov r8, r0
	ldrb r0, [r0]
	orrs r0, r4
	movs r5, #3
	negs r5, r5
	ands r0, r5
	orrs r0, r3
	orrs r0, r2
	movs r1, #0x11
	negs r1, r1
	ands r0, r1
	mov r1, r8
	strb r0, [r1]
	mov r1, ip
	adds r1, #0x36
	ldrb r0, [r1]
	orrs r0, r4
	ands r0, r5
	orrs r0, r3
	orrs r0, r2
	orrs r0, r6
	strb r0, [r1]
	ldr r0, [r7, #0x2c]
	ldr r2, _08043B04  @ gUnknown_080D9D5E
	ldr r1, _08043AFC  @ gUnknown_0203DA24
	ldrb r1, [r1]
	adds r1, r1, r2
	ldrb r1, [r1]
	movs r2, #0
	bl sub_804C49C
	bl sub_804C558
	adds r0, r7, #0
	bl sub_80438C0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #1
	bl sub_8043100
	movs r0, #0xf
	bl BG_EnableSyncByMask
	add sp, #0xc
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08043AD0: .4byte gUnknown_0859EF00
_08043AD4: .4byte gUnknown_085ABD68
_08043AD8: .4byte 0x06014800
_08043ADC: .4byte gUnknown_02023DBA
_08043AE0: .4byte gUnknown_085ADF40
_08043AE4: .4byte gUnknown_085ADC48
_08043AE8: .4byte gUnknown_085AC604
_08043AEC: .4byte 0x06016000
_08043AF0: .4byte gUnknown_08A1BD00
_08043AF4: .4byte gPaletteBuffer
_08043AF8: .4byte gUnknown_0203DB64
_08043AFC: .4byte gUnknown_0203DA24
_08043B00: .4byte gLCDControlBuffer
_08043B04: .4byte gUnknown_080D9D5E

	THUMB_FUNC_END sub_8043904

	THUMB_FUNC_START sub_8043B08
sub_8043B08: @ 0x08043B08
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	lsls r1, r1, #0x18
	lsrs r7, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r5, r2, #0x18
	lsls r3, r3, #0x18
	lsrs r6, r3, #0x18
	ldr r1, _08043B68  @ gKeyStatusPtr
	ldr r2, [r1]
	ldrh r3, [r2, #6]
	movs r0, #0x40
	ands r0, r3
	cmp r0, #0
	beq _08043B3E
	ldr r0, [r4]
	cmp r0, r5
	bgt _08043B32
	ldrh r2, [r2, #8]
	cmp r3, r2
	bne _08043B3E
_08043B32:
	subs r0, #1
	str r0, [r4]
	cmp r0, #0
	bge _08043B3E
	subs r0, r6, #1
	str r0, [r4]
_08043B3E:
	ldr r1, [r1]
	ldrh r2, [r1, #6]
	movs r0, #0x80
	ands r0, r2
	cmp r0, #0
	beq _08043B62
	ldr r0, [r4]
	cmp r0, r7
	blt _08043B56
	ldrh r1, [r1, #8]
	cmp r2, r1
	bne _08043B62
_08043B56:
	adds r0, #1
	str r0, [r4]
	adds r1, r6, #0
	bl __modsi3
	str r0, [r4]
_08043B62:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08043B68: .4byte gKeyStatusPtr

	THUMB_FUNC_END sub_8043B08

	THUMB_FUNC_START sub_8043B6C
sub_8043B6C: @ 0x08043B6C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	adds r4, r0, #0
	ldr r6, [r4, #0x3c]
	ldr r1, _08043C38  @ gUnknown_085A94A0
	ldr r0, _08043C3C  @ gUnknown_0203DA24
	mov r8, r0
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	mov r9, r0
	ldr r5, [r4, #0x2c]
	adds r0, r5, #0
	adds r0, #0x44
	movs r1, #0
	mov sl, r1
	movs r7, #1
	strb r7, [r0]
	movs r0, #1
	negs r0, r0
	str r0, [r5, #0x48]
	adds r0, r4, #0
	adds r0, #0x3c
	ldr r3, [r4, #0x34]
	subs r1, r3, #1
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	movs r2, #0
	bl sub_8043B08
	ldr r0, [r4, #0x3c]
	cmp r6, r0
	beq _08043BEA
	movs r0, #3
	bl sub_804320C
	adds r0, r5, #0
	adds r0, #0x3a
	adds r1, r0, r6
	mov r2, sl
	strb r2, [r1]
	ldr r1, [r4, #0x3c]
	adds r0, r0, r1
	strb r7, [r0]
	mov r0, r8
	ldrb r1, [r0]
	adds r0, r4, #0
	bl sub_8043548
	adds r0, r4, #0
	bl sub_80438C0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #1
	bl sub_8043100
_08043BEA:
	ldr r0, _08043C40  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	adds r0, r7, #0
	ands r0, r1
	cmp r0, #0
	beq _08043C7C
	mov r1, r8
	ldrb r0, [r1]
	cmp r0, #1
	beq _08043C5A
	adds r0, r4, #0
	adds r0, #0x4d
	ldr r1, [r4, #0x3c]
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _08043C52
	lsls r0, r1, #4
	add r0, r9
	ldrb r0, [r0]
	adds r1, r4, #0
	adds r1, #0x52
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #7
	bne _08043C44
	movs r0, #1
	bl sub_804320C
	adds r0, r4, #0
	movs r1, #9
	bl Proc_Goto
	movs r0, #0xff
	mov r2, r8
	strb r0, [r2, #3]
	b _08043CD8
	.align 2, 0
_08043C38: .4byte gUnknown_085A94A0
_08043C3C: .4byte gUnknown_0203DA24
_08043C40: .4byte gKeyStatusPtr
_08043C44:
	movs r0, #2
	bl sub_804320C
	adds r0, r4, #0
	bl Proc_Break
	b _08043C7C
_08043C52:
	movs r0, #0
	bl sub_804320C
	b _08043C7C
_08043C5A:
	movs r0, #2
	bl sub_804320C
	adds r1, r4, #0
	adds r1, #0x52
	movs r0, #8
	strb r0, [r1]
	ldr r0, [r4, #0x3c]
	adds r1, #1
	strb r0, [r1]
	mov r0, sl
	str r0, [r4, #0x44]
	adds r0, r4, #0
	movs r1, #5
	bl Proc_Goto
	b _08043CD8
_08043C7C:
	ldr r5, _08043CE8  @ gKeyStatusPtr
	ldr r0, [r5]
	ldrh r1, [r0, #8]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08043C9E
	movs r0, #1
	bl sub_804320C
	adds r0, r4, #0
	movs r1, #9
	bl Proc_Goto
	ldr r1, _08043CEC  @ gUnknown_0203DA24
	movs r0, #0xff
	strb r0, [r1, #3]
_08043C9E:
	ldr r0, [r5]
	ldrh r1, [r0, #8]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _08043CD8
	adds r0, r4, #0
	adds r0, #0x5c
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _08043CD8
	ldr r0, _08043CF0  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08043CCA
	movs r0, #0x6a
	bl m4aSongNumStart
_08043CCA:
	ldr r1, _08043CEC  @ gUnknown_0203DA24
	movs r0, #0
	strb r0, [r1, #3]
	adds r0, r4, #0
	movs r1, #9
	bl Proc_Goto
_08043CD8:
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08043CE8: .4byte gKeyStatusPtr
_08043CEC: .4byte gUnknown_0203DA24
_08043CF0: .4byte gRAMChapterData

	THUMB_FUNC_END sub_8043B6C

	THUMB_FUNC_START sub_8043CF4
sub_8043CF4: @ 0x08043CF4
	push {r4, lr}
	sub sp, #0x10
	adds r4, r0, #0
	ldr r0, [r4, #0x2c]
	bl Proc_End
	bl nullsub_13
	bl EndBG3Slider
	bl ClearUnits
	movs r0, #1
	bl GetUnit
	adds r1, r0, #0
	ldr r3, _08043D38  @ gUnknown_0203DB7C
	ldr r2, [r4, #0x40]
	lsls r0, r2, #2
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r0, r0, r3
	ldrb r0, [r0, #0xf]
	mov r2, sp
	bl sub_80A693C
	adds r0, r4, #0
	bl sub_8092164
	add sp, #0x10
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08043D38: .4byte gUnknown_0203DB7C

	THUMB_FUNC_END sub_8043CF4

	THUMB_FUNC_START sub_8043D3C
sub_8043D3C: @ 0x08043D3C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08043D58  @ gUnknown_08A178C0
	bl Proc_Find
	cmp r0, #0
	bne _08043D50
	adds r0, r4, #0
	bl Proc_Break
_08043D50:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08043D58: .4byte gUnknown_08A178C0

	THUMB_FUNC_END sub_8043D3C

	THUMB_FUNC_START sub_8043D5C
sub_8043D5C: @ 0x08043D5C
	push {lr}
	movs r1, #0
	ldr r2, _08043D7C  @ gUnknown_0203DA24
	ldrb r0, [r2, #5]
	adds r0, #2
	cmp r1, r0
	bge _08043D86
	adds r3, r2, #6
	adds r2, r0, #0
_08043D6E:
	adds r0, r1, r3
	ldrb r0, [r0]
	cmp r0, #0xff
	bne _08043D80
	movs r0, #0
	b _08043D88
	.align 2, 0
_08043D7C: .4byte gUnknown_0203DA24
_08043D80:
	adds r1, #1
	cmp r1, r2
	blt _08043D6E
_08043D86:
	movs r0, #1
_08043D88:
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8043D5C

	THUMB_FUNC_START sub_8043D8C
sub_8043D8C: @ 0x08043D8C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	adds r7, r0, #0
	ldr r0, [r7, #0x40]
	mov r9, r0
	ldr r1, [r7, #0x2c]
	str r1, [sp, #4]
	ldr r0, _08043DD0  @ gUnknown_085A93E0
	bl sub_8043268
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08043DD8
	ldr r1, _08043DD4  @ gUnknown_0203DB7C
	mov r2, r9
	lsls r0, r2, #2
	add r0, r9
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r1, [r0, #0xf]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _08043DD8
	adds r0, r7, #0
	movs r1, #8
	bl Proc_Goto
	b _08044270
	.align 2, 0
_08043DD0: .4byte gUnknown_085A93E0
_08043DD4: .4byte gUnknown_0203DB7C
_08043DD8:
	ldr r1, [sp, #4]
	adds r1, #0x44
	movs r0, #0
	strb r0, [r1]
	adds r2, r7, #0
	adds r2, #0x48
	ldrb r1, [r2]
	ldr r0, [r7, #0x40]
	subs r0, r0, r1
	lsls r0, r0, #4
	adds r0, #0x28
	ldr r3, [sp, #4]
	str r0, [r3, #0x48]
	adds r0, r7, #0
	adds r0, #0x4c
	movs r1, #0
	ldrsb r1, [r0, r1]
	mov sl, r2
	str r0, [sp, #8]
	cmp r1, #0
	ble _08043E36
	adds r4, r7, #0
	adds r4, #0x4a
	ldrh r0, [r4]
	subs r0, #4
	strh r0, [r4]
	ldr r1, [sp, #8]
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	ldrh r2, [r4]
	movs r0, #1
	movs r1, #0
	bl BG_SetPosition
	ldr r0, [r7, #0x30]
	cmp r0, #0
	beq _08043E2A
	movs r1, #4
	bl sub_804303C
_08043E2A:
	movs r0, #4
	bl sub_804CC5C
	mov r2, sl
	ldrb r0, [r2]
	b _08043E70
_08043E36:
	cmp r1, #0
	bge _08043E92
	adds r4, r7, #0
	adds r4, #0x4a
	ldrh r0, [r4]
	adds r0, #4
	strh r0, [r4]
	ldr r3, [sp, #8]
	ldrb r0, [r3]
	adds r0, #1
	strb r0, [r3]
	ldrh r2, [r4]
	movs r0, #1
	movs r1, #0
	bl BG_SetPosition
	ldr r0, [r7, #0x30]
	cmp r0, #0
	beq _08043E64
	movs r1, #4
	negs r1, r1
	bl sub_804303C
_08043E64:
	movs r0, #4
	negs r0, r0
	bl sub_804CC5C
	mov r1, sl
	ldrb r0, [r1]
_08043E70:
	ldr r1, [r7, #0x40]
	subs r1, r1, r0
	lsls r1, r1, #4
	adds r1, #0x28
	movs r0, #0x50
	bl DisplayUiHand
	ldr r0, [r7, #0x38]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrh r1, [r4]
	adds r1, #0x28
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl sub_804D24C
	b _08044270
_08043E92:
	mov r2, sl
	ldrb r0, [r2]
	ldr r1, [r7, #0x40]
	subs r1, r1, r0
	lsls r1, r1, #4
	adds r1, #0x28
	movs r0, #0x50
	bl DisplayUiHand
	ldr r0, _08043ED0  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _08043EB4
	b _080440C6
_08043EB4:
	adds r1, r7, #0
	adds r1, #0x52
	ldrb r0, [r1]
	subs r0, #1
	adds r4, r1, #0
	cmp r0, #7
	bls _08043EC4
	b _080440C6
_08043EC4:
	lsls r0, r0, #2
	ldr r1, _08043ED4  @ _08043ED8
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08043ED0: .4byte gKeyStatusPtr
_08043ED4: .4byte _08043ED8
_08043ED8: @ jump table
	.4byte _08043EF8 @ case 0
	.4byte _08043F28 @ case 1
	.4byte _08043F50 @ case 2
	.4byte _08043F7C @ case 3
	.4byte _08043FE0 @ case 4
	.4byte _08043FEE @ case 5
	.4byte _080440C6 @ case 6
	.4byte _0804403C @ case 7
_08043EF8:
	ldr r1, _08043F20  @ gUnknown_0203DB7C
	mov r3, r9
	lsls r0, r3, #2
	add r0, r9
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r1, [r0, #0xf]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _08043F10
	b _08044034
_08043F10:
	movs r0, #2
	bl sub_804320C
	ldr r1, _08043F24  @ gUnknown_0203DA24
	ldr r0, [r7, #0x40]
	strb r0, [r1, #3]
	b _08043F40
	.align 2, 0
_08043F20: .4byte gUnknown_0203DB7C
_08043F24: .4byte gUnknown_0203DA24
_08043F28:
	movs r0, #2
	bl sub_804320C
	ldr r2, _08043F48  @ gUnknown_0203DA24
	ldr r1, _08043F4C  @ gUnknown_0203DB7C
	mov r3, r9
	lsls r0, r3, #2
	add r0, r9
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r0, [r0, #0xf]
	strb r0, [r2, #3]
_08043F40:
	adds r0, r7, #0
	bl Proc_Break
	b _08044270
	.align 2, 0
_08043F48: .4byte gUnknown_0203DA24
_08043F4C: .4byte gUnknown_0203DB7C
_08043F50:
	ldr r1, _08043F78  @ gUnknown_0203DB7C
	mov r2, r9
	lsls r0, r2, #2
	add r0, r9
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r1, [r0, #0xf]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _08044034
	movs r0, #2
	bl sub_804320C
	adds r0, r7, #0
	movs r1, #4
	bl Proc_Goto
	b _08044270
	.align 2, 0
_08043F78: .4byte gUnknown_0203DB7C
_08043F7C:
	ldr r0, [r7, #0x38]
	cmp r0, #1
	bgt _08043F84
	b _080440C6
_08043F84:
	movs r0, #2
	bl sub_804320C
	adds r0, r7, #0
	adds r0, #0x53
	mov r3, r9
	strb r3, [r0]
	ldrb r2, [r0]
	mov r1, sl
	ldrb r0, [r1]
	subs r2, r2, r0
	lsls r2, r2, #4
	adds r2, #0x28
	movs r0, #0x27
	str r0, [sp]
	adds r0, r7, #0
	movs r1, #0x50
	movs r3, #0x88
	bl sub_8042FFC
	str r0, [r7, #0x30]
	mov r1, r9
	adds r1, #1
	ldr r0, [r7, #0x38]
	cmp r1, r0
	bge _08043FC8
	ldr r0, _08043FC4  @ gKeyStatusPtr
	ldr r2, [r0]
	ldrh r1, [r2, #6]
	movs r0, #0x80
	b _08043FD0
	.align 2, 0
_08043FC4: .4byte gKeyStatusPtr
_08043FC8:
	ldr r0, _08043FDC  @ gKeyStatusPtr
	ldr r2, [r0]
	ldrh r1, [r2, #6]
	movs r0, #0x40
_08043FD0:
	orrs r0, r1
	strh r0, [r2, #6]
	movs r0, #5
	strb r0, [r4]
	b _080440C6
	.align 2, 0
_08043FDC: .4byte gKeyStatusPtr
_08043FE0:
	movs r0, #2
	bl sub_804320C
	adds r0, r7, #0
	bl sub_80436C0
	b _080440C6
_08043FEE:
	ldr r1, _08044030  @ gUnknown_0203DB7C
	mov r2, r9
	lsls r0, r2, #2
	add r0, r9
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r1, [r0, #0xf]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _08044034
	movs r0, #2
	bl sub_804320C
	mov r3, sl
	ldrb r2, [r3]
	mov r0, r9
	subs r2, r0, r2
	lsls r2, r2, #4
	adds r2, #0x28
	movs r0, #0x27
	str r0, [sp]
	adds r0, r7, #0
	movs r1, #0x50
	movs r3, #0x88
	bl sub_8042FFC
	str r0, [r7, #0x30]
	adds r0, r7, #0
	movs r1, #7
	bl Proc_Goto
	b _080440C6
	.align 2, 0
_08044030: .4byte gUnknown_0203DB7C
_08044034:
	movs r0, #0
	bl sub_804320C
	b _080440C6
_0804403C:
	movs r0, #2
	bl sub_804320C
	mov r1, r9
	lsls r4, r1, #2
	add r4, r9
	lsls r4, r4, #2
	ldr r0, _080440F0  @ gUnknown_0203DB7C
	adds r4, r4, r0
	movs r2, #0x53
	adds r2, r2, r7
	mov r8, r2
	ldrb r0, [r2]
	lsls r1, r0, #4
	subs r1, r1, r0
	ldr r6, _080440F4  @ gUnknown_0203DD50
	adds r1, r1, r6
	adds r0, r4, #0
	bl sub_8042DC8
	ldr r5, _080440F8  @ gUnknown_0203DA24
	adds r0, r5, #6
	mov r3, r8
	ldrb r3, [r3]
	adds r0, r0, r3
	ldrb r1, [r4, #0xf]
	strb r1, [r0]
	mov r1, r8
	ldrb r0, [r1]
	lsls r0, r0, #3
	adds r5, #0x64
	adds r0, r0, r5
	bl Text_Clear
	mov r2, r8
	ldrb r1, [r2]
	lsls r0, r1, #3
	adds r0, r0, r5
	lsls r2, r1, #1
	adds r2, r2, r1
	adds r2, #5
	lsls r3, r1, #4
	subs r3, r3, r1
	adds r3, r3, r6
	movs r1, #0xa
	str r1, [sp]
	movs r1, #1
	bl sub_8014C54
	bl sub_8043D5C
	adds r1, r7, #0
	adds r1, #0x5c
	strb r0, [r1]
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080440BA
	ldr r3, [sp, #4]
	ldr r0, [r3, #0x40]
	cmp r0, #0
	bne _080440BA
	movs r0, #8
	str r0, [r3, #0x40]
_080440BA:
	movs r0, #0
	str r0, [r7, #0x44]
	adds r0, r7, #0
	movs r1, #6
	bl Proc_Goto
_080440C6:
	ldr r0, _080440FC  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0804411A
	movs r0, #1
	bl sub_804320C
	adds r1, r7, #0
	adds r1, #0x52
	ldrb r0, [r1]
	cmp r0, #5
	bne _08044100
	movs r0, #4
	strb r0, [r1]
	ldr r0, [r7, #0x30]
	bl Proc_End
	b _08044270
	.align 2, 0
_080440F0: .4byte gUnknown_0203DB7C
_080440F4: .4byte gUnknown_0203DD50
_080440F8: .4byte gUnknown_0203DA24
_080440FC: .4byte gKeyStatusPtr
_08044100:
	cmp r0, #8
	beq _0804410E
	adds r0, r7, #0
	movs r1, #2
	bl Proc_Goto
	b _0804411A
_0804410E:
	movs r0, #0
	str r0, [r7, #0x44]
	adds r0, r7, #0
	movs r1, #6
	bl Proc_Goto
_0804411A:
	ldr r0, _080441C4  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _08044156
	adds r0, r7, #0
	adds r0, #0x5c
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _08044156
	ldr r0, _080441C8  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08044148
	movs r0, #0x6a
	bl m4aSongNumStart
_08044148:
	ldr r1, _080441CC  @ gUnknown_0203DA24
	movs r0, #0
	strb r0, [r1, #3]
	adds r0, r7, #0
	movs r1, #9
	bl Proc_Goto
_08044156:
	ldr r0, _080441C4  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _080441DA
	mov r1, sl
	ldrb r0, [r1]
	cmp r0, #0
	beq _080441D0
	adds r1, r0, #0
	ldr r0, [r7, #0x40]
	subs r0, r0, r1
	cmp r0, #1
	bgt _080441D0
	adds r4, r7, #0
	adds r4, #0x4a
	ldrh r0, [r4]
	subs r0, #4
	strh r0, [r4]
	ldr r0, [r7, #0x30]
	cmp r0, #0
	beq _0804418C
	movs r1, #4
	bl sub_804303C
_0804418C:
	movs r0, #4
	bl sub_804CC5C
	mov r2, sl
	ldrb r0, [r2]
	subs r0, #1
	strb r0, [r2]
	movs r0, #3
	ldr r3, [sp, #8]
	strb r0, [r3]
	ldr r0, [r7, #0x40]
	subs r0, #1
	str r0, [r7, #0x40]
	ldrh r2, [r4]
	movs r0, #1
	movs r1, #0
	bl BG_SetPosition
	ldr r0, [r7, #0x38]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrh r1, [r4]
	adds r1, #0x28
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl sub_804D24C
	b _080441DA
	.align 2, 0
_080441C4: .4byte gKeyStatusPtr
_080441C8: .4byte gRAMChapterData
_080441CC: .4byte gUnknown_0203DA24
_080441D0:
	ldr r0, [r7, #0x40]
	cmp r0, #0
	ble _080441DA
	subs r0, #1
	str r0, [r7, #0x40]
_080441DA:
	ldr r0, _08044254  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08044264
	ldr r1, [r7, #0x38]
	cmp r1, #6
	ble _08044258
	mov r0, sl
	ldrb r2, [r0]
	adds r0, r2, #6
	cmp r0, r1
	bge _08044258
	ldr r0, [r7, #0x40]
	subs r0, r0, r2
	cmp r0, #3
	ble _08044258
	adds r4, r7, #0
	adds r4, #0x4a
	ldrh r0, [r4]
	adds r0, #4
	strh r0, [r4]
	ldr r0, [r7, #0x30]
	cmp r0, #0
	beq _08044218
	movs r1, #4
	negs r1, r1
	bl sub_804303C
_08044218:
	movs r0, #4
	negs r0, r0
	bl sub_804CC5C
	mov r1, sl
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	movs r0, #0xfd
	ldr r2, [sp, #8]
	strb r0, [r2]
	ldr r0, [r7, #0x40]
	adds r0, #1
	str r0, [r7, #0x40]
	ldrh r2, [r4]
	movs r0, #1
	movs r1, #0
	bl BG_SetPosition
	ldr r0, [r7, #0x38]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrh r1, [r4]
	adds r1, #0x28
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl sub_804D24C
	b _08044264
	.align 2, 0
_08044254: .4byte gKeyStatusPtr
_08044258:
	subs r0, r1, #1
	ldr r1, [r7, #0x40]
	cmp r1, r0
	bge _08044264
	adds r0, r1, #1
	str r0, [r7, #0x40]
_08044264:
	ldr r0, [r7, #0x40]
	cmp r9, r0
	beq _08044270
	movs r0, #3
	bl sub_804320C
_08044270:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8043D8C

	THUMB_FUNC_START sub_8044280
sub_8044280: @ 0x08044280
	push {lr}
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	negs r1, r1
	subs r1, #8
	movs r2, #4
	adds r0, #0x38
_0804428E:
	strh r1, [r0]
	subs r0, #2
	subs r2, #1
	cmp r2, #0
	bge _0804428E
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8044280

	THUMB_FUNC_START sub_804429C
sub_804429C: @ 0x0804429C
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r6, [r4, #0x2c]
	ldr r0, _08044300  @ gUnknown_080D9D61
	ldr r1, [r4, #0x44]
	adds r1, r1, r0
	movs r5, #0
	ldrsb r5, [r1, r5]
	movs r0, #1
	negs r0, r0
	cmp r5, r0
	bne _080442BC
	adds r0, r4, #0
	movs r1, #3
	bl Proc_Goto
_080442BC:
	ldr r0, [r4, #0x44]
	adds r0, #1
	str r0, [r4, #0x44]
	movs r0, #2
	negs r0, r0
	cmp r5, r0
	bne _08044308
	ldr r3, _08044304  @ gLCDControlBuffer
	ldrb r2, [r3, #0x10]
	movs r1, #4
	negs r1, r1
	adds r0, r1, #0
	ands r0, r2
	strb r0, [r3, #0x10]
	ldrb r2, [r3, #0x14]
	adds r0, r1, #0
	ands r0, r2
	movs r2, #1
	orrs r0, r2
	strb r0, [r3, #0x14]
	ldrb r0, [r3, #0xc]
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	strb r1, [r3, #0xc]
	ldrb r0, [r3, #0x18]
	movs r1, #3
	orrs r0, r1
	strb r0, [r3, #0x18]
	adds r1, r6, #0
	adds r1, #0x44
	movs r0, #0
	strb r0, [r1]
	b _0804431C
	.align 2, 0
_08044300: .4byte gUnknown_080D9D61
_08044304: .4byte gLCDControlBuffer
_08044308:
	lsls r1, r5, #0x10
	lsrs r1, r1, #0x10
	movs r0, #0
	movs r2, #0
	bl BG_SetPosition
	adds r0, r6, #0
	adds r1, r5, #0
	bl sub_8044280
_0804431C:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_804429C

	THUMB_FUNC_START sub_8044324
sub_8044324: @ 0x08044324
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	ldr r6, [r4, #0x2c]
	ldr r1, _0804438C  @ gUnknown_080D9D61
	ldr r0, [r4, #0x44]
	adds r0, r0, r1
	movs r5, #0
	ldrsb r5, [r0, r5]
	movs r7, #1
	negs r7, r7
	cmp r5, r7
	bne _08044344
	adds r0, r4, #0
	movs r1, #2
	bl Proc_Goto
_08044344:
	ldr r0, [r4, #0x44]
	adds r0, #1
	str r0, [r4, #0x44]
	movs r0, #2
	negs r0, r0
	cmp r5, r0
	bne _08044394
	ldr r3, _08044390  @ gLCDControlBuffer
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
	adds r1, r6, #0
	adds r1, #0x44
	movs r0, #1
	strb r0, [r1]
	str r7, [r6, #0x48]
	b _080443A8
	.align 2, 0
_0804438C: .4byte gUnknown_080D9D61
_08044390: .4byte gLCDControlBuffer
_08044394:
	lsls r1, r5, #0x10
	lsrs r1, r1, #0x10
	movs r0, #0
	movs r2, #0
	bl BG_SetPosition
	adds r0, r6, #0
	adds r1, r5, #0
	bl sub_8044280
_080443A8:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8044324

	THUMB_FUNC_START sub_80443B0
sub_80443B0: @ 0x080443B0
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r1, r5, #0
	adds r1, #0x55
	movs r0, #1
	strb r0, [r1]
	bl sub_804D80C
	adds r0, r5, #0
	adds r0, #0x48
	ldrb r1, [r0]
	ldr r0, [r5, #0x40]
	subs r0, r0, r1
	cmp r0, #2
	ble _080443D4
	lsls r0, r0, #1
	subs r0, #2
	b _080443D8
_080443D4:
	lsls r0, r0, #1
	adds r0, #5
_080443D8:
	str r0, [r5, #0x58]
	ldr r4, _08044424  @ gUnknown_0203DAB0
	adds r0, r4, #0
	bl Text_Clear
	movs r0, #0xa0
	lsls r0, r0, #1
	bl GetStringFromIndex
	adds r1, r0, #0
	adds r0, r4, #0
	bl Text_AppendString
	adds r0, r4, #0
	movs r1, #0x26
	bl Text_SetXCursor
	ldr r0, _08044428  @ 0x00000141
	bl GetStringFromIndex
	adds r1, r0, #0
	adds r0, r4, #0
	bl Text_AppendString
	ldr r1, [r5, #0x58]
	adds r1, #4
	lsls r1, r1, #6
	ldr r0, _0804442C  @ gUnknown_02022CC6
	adds r1, r1, r0
	adds r0, r4, #0
	bl Text_Draw
	movs r0, #1
	bl BG_EnableSyncByMask
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08044424: .4byte gUnknown_0203DAB0
_08044428: .4byte 0x00000141
_0804442C: .4byte gUnknown_02022CC6

	THUMB_FUNC_END sub_80443B0

	THUMB_FUNC_START sub_8044430
sub_8044430: @ 0x08044430
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x58]
	lsls r1, r1, #3
	adds r1, #0x18
	movs r0, #0x60
	bl sub_804D834
	ldr r0, _080444D4  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _08044462
	adds r1, r4, #0
	adds r1, #0x55
	ldrb r0, [r1]
	cmp r0, #1
	bne _08044462
	movs r0, #0
	strb r0, [r1]
	movs r0, #3
	bl sub_804320C
_08044462:
	ldr r0, _080444D4  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0x10
	ands r0, r1
	adds r5, r4, #0
	adds r5, #0x55
	cmp r0, #0
	beq _08044484
	ldrb r0, [r5]
	cmp r0, #0
	bne _08044484
	movs r0, #1
	strb r0, [r5]
	movs r0, #3
	bl sub_804320C
_08044484:
	ldrb r1, [r5]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, #0x70
	ldr r1, [r4, #0x58]
	lsls r1, r1, #3
	adds r1, #0x20
	bl DisplayUiHand
	ldr r0, _080444D4  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080444DC
	movs r0, #1
	bl sub_804320C
	ldr r0, [r4, #0x30]
	bl Proc_End
	ldr r0, [r4, #0x58]
	adds r0, #4
	lsls r0, r0, #6
	ldr r1, _080444D8  @ gUnknown_02022CC6
	adds r0, r0, r1
	movs r1, #0xc
	movs r2, #2
	movs r3, #0
	bl TileMap_FillRect
	movs r0, #1
	bl BG_EnableSyncByMask
	adds r0, r4, #0
	bl Proc_Break
	b _08044524
	.align 2, 0
_080444D4: .4byte gKeyStatusPtr
_080444D8: .4byte gUnknown_02022CC6
_080444DC:
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08044524
	ldr r0, [r4, #0x30]
	bl Proc_End
	ldrb r0, [r5]
	cmp r0, #0
	bne _080444FE
	adds r0, r4, #0
	bl sub_80435F0
	movs r0, #2
	bl sub_804320C
	b _08044504
_080444FE:
	movs r0, #1
	bl sub_804320C
_08044504:
	ldr r0, [r4, #0x58]
	adds r0, #4
	lsls r0, r0, #6
	ldr r1, _0804452C  @ gUnknown_02022CC6
	adds r0, r0, r1
	movs r1, #0xc
	movs r2, #2
	movs r3, #0
	bl TileMap_FillRect
	movs r0, #1
	bl BG_EnableSyncByMask
	adds r0, r4, #0
	bl Proc_Break
_08044524:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0804452C: .4byte gUnknown_02022CC6

	THUMB_FUNC_END sub_8044430

	THUMB_FUNC_START sub_8044530
sub_8044530: @ 0x08044530
	push {r4, lr}
	sub sp, #0x10
	ldr r4, [r0, #0x40]
	movs r0, #1
	bl GetUnit
	adds r1, r0, #0
	adds r0, r4, #0
	mov r2, sp
	bl sub_80A693C
	add sp, #0x10
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8044530

	THUMB_FUNC_START sub_8044550
sub_8044550: @ 0x08044550
	lsls r0, r0, #0x10
	asrs r0, r0, #0xa
	ldr r1, _0804455C  @ gUnknown_080D8740
	adds r0, r0, r1
	bx lr
	.align 2, 0
_0804455C: .4byte gUnknown_080D8740

	THUMB_FUNC_END sub_8044550

	THUMB_FUNC_START sub_8044560
sub_8044560: @ 0x08044560
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	mov sl, r0
	mov r9, r1
	movs r0, #0
	str r0, [sp]
	ldrb r0, [r1]
	cmp r0, #0
	beq _08044602
_0804457A:
	movs r1, #0
	mov r8, r1
	mov r3, r9
	adds r3, #2
	str r3, [sp, #8]
_08044584:
	mov r5, r8
	lsls r0, r5, #0x10
	asrs r0, r0, #0x10
	bl sub_8044550
	str r0, [sp, #4]
	movs r7, #0
	mov r6, r8
	ldr r0, _080445D8  @ 0x00003FFF
	ands r6, r0
	movs r1, #0
	mov ip, r1
_0804459C:
	movs r4, #0
	mov r3, r9
	ldrh r3, [r3]
	str r3, [sp, #0xc]
	ldr r2, [sp, #4]
	add r2, ip
	adds r0, r7, #0
	movs r5, #3
	ands r0, r5
	lsls r1, r0, #0xe
	orrs r1, r6
	ldr r3, [sp]
	lsls r0, r3, #1
	adds r0, #0x4c
	mov r5, sl
	adds r3, r0, r5
_080445BC:
	ldr r0, [r2]
	ldrh r0, [r0]
	ldr r5, [sp, #0xc]
	cmp r0, r5
	bne _080445DC
	strh r1, [r3]
	mov r0, sl
	adds r0, #0x39
	strb r4, [r0]
	ldr r0, [sp]
	adds r0, #1
	str r0, [sp]
	b _080445F8
	.align 2, 0
_080445D8: .4byte 0x00003FFF
_080445DC:
	adds r2, #4
	adds r4, #1
	cmp r4, #2
	ble _080445BC
	movs r1, #0xc
	add ip, r1
	adds r7, #1
	cmp r7, #2
	ble _0804459C
	movs r3, #1
	add r8, r3
	mov r5, r8
	cmp r5, #0x50
	ble _08044584
_080445F8:
	ldr r0, [sp, #8]
	mov r9, r0
	ldrb r0, [r0]
	cmp r0, #0
	bne _0804457A
_08044602:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8044560

	THUMB_FUNC_START sub_8044614
sub_8044614: @ 0x08044614
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	movs r5, #0
	adds r6, r0, #0
	adds r6, #0x31
	ldr r1, _080446F0  @ gUnknown_0203DB14
	mov r8, r1
	adds r0, #0x30
	mov sl, r0
_0804462E:
	ldrb r1, [r6]
	lsls r0, r1, #2
	adds r0, r0, r1
	adds r0, r5, r0
	lsls r0, r0, #3
	add r0, r8
	bl Text_Clear
	ldrb r1, [r6]
	lsls r0, r1, #2
	adds r0, r0, r1
	adds r0, r5, r0
	lsls r0, r0, #3
	add r0, r8
	movs r1, #0
	bl Text_SetColorId
	movs r7, #0
	lsls r0, r5, #4
	mov r9, r0
	lsls r1, r5, #1
	str r1, [sp, #4]
	adds r0, r5, #1
	str r0, [sp]
_0804465E:
	mov r1, r9
	subs r0, r1, r5
	adds r0, r0, r7
	lsls r0, r0, #1
	ldr r1, _080446F4  @ gUnknown_080D9C9E
	adds r0, r0, r1
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r0, r0, #6
	ldr r1, _080446F8  @ gUnknown_080D8740
	adds r4, r0, r1
	mov r0, sl
	ldrb r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r4, r0
	ldr r0, [r0]
	ldrb r0, [r0]
	cmp r0, #0
	beq _080446B8
	ldrb r1, [r6]
	lsls r0, r1, #2
	adds r0, r0, r1
	adds r0, r5, r0
	lsls r0, r0, #3
	add r0, r8
	ldrh r1, [r4, #0x30]
	bl Text_SetXCursor
	ldrb r1, [r6]
	lsls r0, r1, #2
	adds r0, r0, r1
	adds r0, r5, r0
	lsls r0, r0, #3
	add r0, r8
	mov r1, sl
	ldrb r2, [r1]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #2
	adds r1, r4, r1
	ldr r1, [r1]
	bl Text_AppendString
_080446B8:
	adds r7, #1
	cmp r7, #0xe
	ble _0804465E
	ldrb r1, [r6]
	lsls r0, r1, #2
	adds r0, r0, r1
	adds r0, r5, r0
	lsls r0, r0, #3
	add r0, r8
	ldr r1, [sp, #4]
	adds r1, #9
	lsls r1, r1, #6
	ldr r2, _080446FC  @ gBG1TilemapBuffer
	adds r1, r1, r2
	bl Text_Draw
	ldr r5, [sp]
	cmp r5, #4
	ble _0804462E
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080446F0: .4byte gUnknown_0203DB14
_080446F4: .4byte gUnknown_080D9C9E
_080446F8: .4byte gUnknown_080D8740
_080446FC: .4byte gBG1TilemapBuffer

	THUMB_FUNC_END sub_8044614

	THUMB_FUNC_START sub_8044700
sub_8044700: @ 0x08044700
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r4, #0x3d
	ldr r5, _08044748  @ gUnknown_0203DD1C
	adds r0, r5, #0
	bl Text_Clear
	ldrb r0, [r4]
	cmp r0, #0
	beq _08044732
	adds r6, r5, #0
	movs r5, #0
_08044718:
	adds r0, r6, #0
	adds r1, r5, #0
	bl Text_SetXCursor
	adds r0, r6, #0
	adds r1, r4, #0
	bl Text_AppendChar
	adds r4, r0, #0
	adds r5, #7
	ldrb r0, [r4]
	cmp r0, #0
	bne _08044718
_08044732:
	ldr r0, _08044748  @ gUnknown_0203DD1C
	ldr r1, _0804474C  @ gUnknown_02022E00
	bl Text_Draw
	movs r0, #1
	bl BG_EnableSyncByMask
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08044748: .4byte gUnknown_0203DD1C
_0804474C: .4byte gUnknown_02022E00

	THUMB_FUNC_END sub_8044700

	THUMB_FUNC_START sub_8044750
sub_8044750: @ 0x08044750
	push {lr}
	adds r1, r0, #0
	movs r2, #0
	b _0804475C
_08044758:
	adds r2, #1
	adds r1, #1
_0804475C:
	ldrb r0, [r1]
	cmp r0, #0
	bne _08044758
	adds r0, r2, #0
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8044750

	THUMB_FUNC_START sub_8044768
sub_8044768: @ 0x08044768
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x18
	adds r6, r0, #0
	bl sub_8043044
	bl sub_804C33C
	movs r0, #0
	str r0, [sp]
	adds r0, r6, #0
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl sub_8086CE8
	ldr r0, _080447DC  @ gUnknown_085ABD68
	ldr r1, _080447E0  @ 0x06014800
	bl CopyDataWithPossibleUncomp
	ldr r0, _080447E4  @ gUnknown_085ADC48
	movs r1, #0x98
	lsls r1, r1, #2
	movs r2, #0x20
	bl CopyToPaletteBuffer
	ldr r0, _080447E8  @ gUnknown_085ADE68
	movs r1, #0xa0
	lsls r1, r1, #2
	movs r2, #0x20
	bl CopyToPaletteBuffer
	ldr r0, _080447EC  @ gUnknown_02023EA8
	ldr r1, _080447F0  @ gUnknown_085AE190
	movs r2, #0x80
	lsls r2, r2, #5
	bl CallARM_FillTileRect
	ldr r0, _080447F4  @ gUnknown_0203DB64
	bl SetFont
	bl Font_LoadForUI
	bl sub_8003D20
	bl CheckSomethingSomewhere
	lsls r0, r0, #0x18
	asrs r1, r0, #0x18
	cmp r1, #0
	beq _080447F8
	adds r1, r6, #0
	adds r1, #0x3c
	movs r0, #7
	b _08044802
	.align 2, 0
_080447DC: .4byte gUnknown_085ABD68
_080447E0: .4byte 0x06014800
_080447E4: .4byte gUnknown_085ADC48
_080447E8: .4byte gUnknown_085ADE68
_080447EC: .4byte gUnknown_02023EA8
_080447F0: .4byte gUnknown_085AE190
_080447F4: .4byte gUnknown_0203DB64
_080447F8:
	ldr r0, _08044954  @ gUnknown_0203DA24
	strb r1, [r0]
	adds r1, r6, #0
	adds r1, #0x3c
	movs r0, #5
_08044802:
	strb r0, [r1]
	adds r5, r1, #0
	movs r4, #0
	adds r3, r5, #0
	ldrb r0, [r5]
	lsls r0, r0, #1
	adds r0, #1
	movs r1, #0x38
	adds r1, r1, r6
	mov r8, r1
	adds r7, r6, #0
	adds r7, #0x30
	movs r1, #0x39
	adds r1, r1, r6
	mov r9, r1
	movs r1, #0x31
	adds r1, r1, r6
	mov sl, r1
	adds r1, r6, #0
	adds r1, #0x32
	str r1, [sp, #0x14]
	cmp r4, r0
	bge _08044844
	adds r1, #0xb
	movs r2, #0
_08044834:
	adds r0, r1, r4
	strb r2, [r0]
	adds r4, #1
	ldrb r0, [r3]
	lsls r0, r0, #1
	adds r0, #1
	cmp r4, r0
	blt _08044834
_08044844:
	movs r4, #0
	adds r1, r5, #0
	ldrb r3, [r5]
	cmp r4, r3
	bge _08044860
	movs r2, #0
	adds r0, r6, #0
	adds r0, #0x4c
_08044854:
	strh r2, [r0]
	adds r0, #2
	adds r4, #1
	ldrb r3, [r1]
	cmp r4, r3
	blt _08044854
_08044860:
	bl CheckSomethingSomewhere
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0804486E
	movs r0, #9
	strb r0, [r5]
_0804486E:
	movs r0, #0
	mov r1, r8
	strb r0, [r1]
	ldr r0, _08044958  @ gUnknown_0203DD1C
	movs r1, #8
	bl Text_Init
	movs r0, #1
	strb r0, [r7]
	movs r4, #0
	movs r0, #6
	strh r0, [r6, #0x34]
	bl sub_8044550
	ldrh r1, [r0, #0x30]
	subs r1, #4
	ldrh r2, [r0, #0x32]
	adds r2, #1
	adds r0, r6, #0
	bl sub_804CD90
	str r0, [r6, #0x2c]
	mov r3, r9
	strb r4, [r3]
	ldr r5, _0804495C  @ gUnknown_0203DB14
	movs r4, #9
_080448A2:
	adds r0, r5, #0
	movs r1, #0x1a
	bl Text_Init
	adds r5, #8
	subs r4, #1
	cmp r4, #0
	bge _080448A2
	ldr r0, _08044960  @ gUnknown_0203DAB0
	movs r1, #0xc
	bl Text_Init
	ldr r0, [r6, #0x2c]
	movs r2, #0xa0
	lsls r2, r2, #3
	movs r1, #3
	bl sub_804C49C
	bl sub_804C508
	ldr r1, _08044964  @ gUnknown_0203DD24
	movs r0, #0
	strb r0, [r1]
	movs r0, #0
	mov r1, sl
	strb r0, [r1]
	adds r0, r6, #0
	bl sub_8044614
	ldr r3, [sp, #0x14]
	ldrb r0, [r3]
	cmp r0, #0
	beq _0804493C
	movs r4, #0
	bl GetTacticianName
	adds r2, r0, #0
	ldrb r1, [r2]
	cmp r1, #0
	beq _08044922
	adds r7, r6, #0
	adds r7, #0x3d
	mov r5, r8
	adds r3, r6, #0
	adds r3, #0x33
_080448FC:
	adds r0, r7, r4
	strb r1, [r0]
	mov r1, sp
	adds r1, r1, r4
	adds r1, #4
	ldrb r0, [r2]
	strb r0, [r1]
	adds r2, #1
	adds r4, #1
	ldrb r0, [r5]
	adds r0, #1
	ldrb r1, [r3]
	cmp r0, r1
	bge _0804491C
	mov r1, r8
	strb r0, [r1]
_0804491C:
	ldrb r1, [r2]
	cmp r1, #0
	bne _080448FC
_08044922:
	adds r0, r6, #0
	add r1, sp, #4
	bl sub_8044560
	adds r0, r6, #0
	bl sub_8044700
	ldr r2, [r6, #0x2c]
	mov r3, r8
	ldrb r1, [r3]
	lsls r0, r1, #3
	subs r0, r0, r1
	str r0, [r2, #0x40]
_0804493C:
	movs r0, #0xf
	bl BG_EnableSyncByMask
	add sp, #0x18
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08044954: .4byte gUnknown_0203DA24
_08044958: .4byte gUnknown_0203DD1C
_0804495C: .4byte gUnknown_0203DB14
_08044960: .4byte gUnknown_0203DAB0
_08044964: .4byte gUnknown_0203DD24

	THUMB_FUNC_END sub_8044768

	THUMB_FUNC_START sub_8044968
sub_8044968: @ 0x08044968
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	mov sl, r0
	mov r9, r1
	movs r0, #0x81
	bl GetUnit
	mov r8, r0
	mov r4, r8
	movs r6, #4
_08044982:
	adds r0, r4, #0
	bl ClearUnit
	adds r4, #0x48
	subs r6, #1
	cmp r6, #0
	bge _08044982
	movs r6, #0
	mov r7, r8
_08044994:
	ldr r0, _080449E4  @ gUnknown_0203E87C
	adds r0, r6, r0
	ldrb r0, [r0]
	cmp r0, #0
	beq _080449C2
	bl GetUnitFromCharId
	adds r5, r0, #0
	ldr r4, [r5, #0xc]
	movs r0, #8
	ands r4, r0
	cmp r4, #0
	bne _080449C2
	adds r0, r5, #0
	movs r1, #0
	bl SetUnitStatus
	str r4, [r5, #0xc]
	adds r0, r5, #0
	adds r1, r7, #0
	movs r2, #0x48
	bl sub_8014C38
_080449C2:
	adds r7, #0x48
	adds r6, #1
	cmp r6, #4
	ble _08044994
	mov r0, r9
	mov r1, r8
	mov r2, sl
	bl sub_80A68DC
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080449E4: .4byte gUnknown_0203E87C

	THUMB_FUNC_END sub_8044968

	THUMB_FUNC_START sub_80449E8
sub_80449E8: @ 0x080449E8
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	lsls r5, r1, #1
	adds r2, #0x36
	adds r2, r2, r5
	ldrh r4, [r2]
	movs r1, #0
	ldrsh r0, [r2, r1]
	lsls r0, r0, #6
	ldr r6, _08044A3C  @ gUnknown_080D8740
	adds r2, r0, r6
	adds r0, r7, #0
	adds r0, #0x30
	ldrb r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r3, r0, #2
	adds r0, r2, r3
	ldr r0, [r0]
	ldrb r0, [r0]
	cmp r0, #0
	bne _08044A32
	adds r1, r5, #0
	adds r5, r6, #0
_08044A18:
	adds r0, r2, #0
	adds r0, #0x36
	adds r0, r0, r1
	ldrh r4, [r0]
	movs r2, #0
	ldrsh r0, [r0, r2]
	lsls r0, r0, #6
	adds r2, r0, r5
	adds r0, r2, r3
	ldr r0, [r0]
	ldrb r0, [r0]
	cmp r0, #0
	beq _08044A18
_08044A32:
	strh r4, [r7, #0x34]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08044A3C: .4byte gUnknown_080D8740

	THUMB_FUNC_END sub_80449E8

	THUMB_FUNC_START sub_8044A40
sub_8044A40: @ 0x08044A40
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	adds r7, r1, #0
	adds r6, r5, #0
	adds r6, #0x38
	movs r0, #0x3c
	adds r0, r0, r5
	mov r8, r0
	ldrb r0, [r6]
	mov r1, r8
	ldrb r1, [r1]
	cmp r0, r1
	bcs _08044AC4
	movs r0, #2
	bl sub_804320C
	adds r4, r5, #0
	adds r4, #0x30
	ldrb r1, [r4]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r7, r0
	ldr r0, [r0]
	ldrb r1, [r6]
	adds r1, #0x3d
	adds r1, r5, r1
	bl sub_8042DC8
	ldrb r0, [r6]
	lsls r0, r0, #1
	adds r3, r5, #0
	adds r3, #0x4c
	adds r3, r3, r0
	ldrh r0, [r5, #0x34]
	ldr r1, _08044AAC  @ 0x00003FFF
	ands r1, r0
	ldrb r2, [r4]
	movs r0, #3
	ands r0, r2
	lsls r0, r0, #0xe
	orrs r1, r0
	strh r1, [r3]
	ldrb r0, [r6]
	adds r0, #1
	mov r2, r8
	ldrb r2, [r2]
	cmp r0, r2
	bge _08044AB0
	strb r0, [r6]
	b _08044AB4
	.align 2, 0
_08044AAC: .4byte 0x00003FFF
_08044AB0:
	movs r0, #5
	strh r0, [r5, #0x34]
_08044AB4:
	adds r0, r5, #0
	bl sub_8044700
	adds r1, r5, #0
	adds r1, #0x39
	movs r0, #0
	strb r0, [r1]
	b _08044ACA
_08044AC4:
	movs r0, #0
	bl sub_804320C
_08044ACA:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8044A40

	THUMB_FUNC_START sub_8044AD4
sub_8044AD4: @ 0x08044AD4
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r5, #0
	adds r4, #0x38
	ldrb r0, [r4]
	cmp r0, #0
	beq _08044B20
	movs r0, #2
	bl sub_804320C
	ldrb r1, [r4]
	lsls r0, r1, #1
	adds r2, r5, #0
	adds r2, #0x4c
	adds r0, r2, r0
	ldrh r0, [r0]
	cmp r0, #0
	bne _08044AFC
	subs r0, r1, #1
	strb r0, [r4]
_08044AFC:
	ldrb r0, [r4]
	adds r0, r0, r5
	adds r0, #0x3d
	movs r1, #0
	strb r1, [r0]
	ldrb r0, [r4]
	lsls r0, r0, #1
	adds r0, r2, r0
	movs r2, #0
	movs r1, #0
	strh r1, [r0]
	adds r0, r5, #0
	adds r0, #0x39
	strb r2, [r0]
	adds r0, r5, #0
	bl sub_8044700
	b _08044B26
_08044B20:
	movs r0, #0
	bl sub_804320C
_08044B26:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8044AD4

	THUMB_FUNC_START sub_8044B2C
sub_8044B2C: @ 0x08044B2C
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r5, #0
	adds r4, #0x3d
	ldrb r0, [r4]
	cmp r0, #0
	beq _08044B6A
	movs r0, #2
	bl sub_804320C
	bl CheckSomethingSomewhere
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08044B5C
	ldr r0, _08044B58  @ gUnknown_0203DA24
	ldrb r1, [r0, #3]
	adds r0, r4, #0
	bl sub_8044968
	b _08044B62
	.align 2, 0
_08044B58: .4byte gUnknown_0203DA24
_08044B5C:
	adds r0, r4, #0
	bl SetTacticianName
_08044B62:
	adds r0, r5, #0
	bl Proc_Break
	b _08044B70
_08044B6A:
	movs r0, #0
	bl sub_804320C
_08044B70:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8044B2C

	THUMB_FUNC_START sub_8044B78
sub_8044B78: @ 0x08044B78
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	adds r5, r0, #0
	adds r4, r1, #0
	mov r9, r2
	adds r7, r3, #0
	adds r0, #0x30
	ldrb r0, [r0]
	cmp r0, #1
	bls _08044BA4
	cmp r7, #0
	bne _08044BA4
	movs r0, #2
	bl sub_804320C
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_8044A40
	b _08044C46
_08044BA4:
	adds r6, r5, #0
	adds r6, #0x38
	ldrb r0, [r6]
	cmp r0, #0
	beq _08044C3C
	lsrs r2, r0, #1
	lsls r0, r2, #1
	adds r4, r5, #0
	adds r4, #0x4c
	adds r0, r4, r0
	ldrh r1, [r0]
	ldr r3, _08044C2C  @ 0x00003FFF
	adds r0, r3, #0
	ands r0, r1
	movs r1, #1
	mov r8, r1
	cmp r0, #0
	beq _08044BCC
	movs r0, #0
	mov r8, r0
_08044BCC:
	mov r1, r8
	subs r0, r2, r1
	lsls r0, r0, #1
	adds r0, r4, r0
	ldrh r1, [r0]
	adds r0, r3, #0
	ands r0, r1
	bl sub_8044550
	ldrb r1, [r6]
	lsrs r1, r1, #1
	mov r2, r8
	subs r1, r1, r2
	lsls r1, r1, #1
	adds r1, r4, r1
	ldrh r2, [r1]
	lsrs r2, r2, #0xe
	lsls r1, r2, #1
	adds r1, r1, r2
	add r1, r9
	lsls r1, r1, #2
	adds r4, r0, r1
	ldr r0, [r4]
	ldrb r0, [r0]
	cmp r0, #0
	beq _08044C30
	movs r0, #2
	bl sub_804320C
	ldr r0, [r4]
	ldrb r1, [r6]
	adds r1, #0x3d
	adds r1, r5, r1
	mov r3, r8
	lsls r2, r3, #1
	subs r1, r1, r2
	bl sub_8042DC8
	adds r0, r5, #0
	bl sub_8044700
	adds r0, r5, #0
	adds r0, #0x39
	mov r1, r9
	strb r1, [r0]
	movs r0, #1
	b _08044C48
	.align 2, 0
_08044C2C: .4byte 0x00003FFF
_08044C30:
	cmp r7, #0
	bne _08044C46
	movs r0, #0
	bl sub_804320C
	b _08044C46
_08044C3C:
	cmp r7, #0
	bne _08044C46
	movs r0, #0
	bl sub_804320C
_08044C46:
	movs r0, #0
_08044C48:
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8044B78

	THUMB_FUNC_START sub_8044C54
sub_8044C54: @ 0x08044C54
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	ldr r4, _08044CD4  @ gKeyStatusPtr
	ldr r0, [r4]
	ldrh r1, [r0, #6]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08044C72
	adds r0, r5, #0
	movs r1, #0
	adds r2, r6, #0
	bl sub_80449E8
_08044C72:
	ldr r0, [r4]
	ldrh r1, [r0, #6]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08044C88
	adds r0, r5, #0
	movs r1, #1
	adds r2, r6, #0
	bl sub_80449E8
_08044C88:
	ldr r0, [r4]
	ldrh r1, [r0, #6]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _08044C9E
	adds r0, r5, #0
	movs r1, #2
	adds r2, r6, #0
	bl sub_80449E8
_08044C9E:
	ldr r0, [r4]
	ldrh r1, [r0, #6]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _08044CB4
	adds r0, r5, #0
	movs r1, #3
	adds r2, r6, #0
	bl sub_80449E8
_08044CB4:
	ldr r0, [r4]
	ldrh r1, [r0, #8]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08044DAA
	adds r0, r6, #0
	adds r0, #0x3e
	ldrb r0, [r0]
	cmp r0, #7
	bhi _08044DAA
	lsls r0, r0, #2
	ldr r1, _08044CD8  @ _08044CDC
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08044CD4: .4byte gKeyStatusPtr
_08044CD8: .4byte _08044CDC
_08044CDC: @ jump table
	.4byte _08044CFC @ case 0
	.4byte _08044D30 @ case 1
	.4byte _08044D4C @ case 2
	.4byte _08044D72 @ case 3
	.4byte _08044D06 @ case 4
	.4byte _08044D10 @ case 5
	.4byte _08044D1A @ case 6
	.4byte _08044D22 @ case 7
_08044CFC:
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_8044A40
	b _08044DAA
_08044D06:
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_8044AD4
	b _08044DAA
_08044D10:
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_8044B2C
	b _08044DAA
_08044D1A:
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #1
	b _08044D28
_08044D22:
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #2
_08044D28:
	movs r3, #0
	bl sub_8044B78
	b _08044DAA
_08044D30:
	adds r4, r5, #0
	adds r4, #0x30
	ldrb r0, [r4]
	cmp r0, #0
	beq _08044D6A
	movs r0, #2
	bl sub_804320C
	movs r0, #0
	strb r0, [r4]
	adds r1, r5, #0
	adds r1, #0x39
	strb r0, [r1]
	b _08044E88
_08044D4C:
	adds r4, r5, #0
	adds r4, #0x30
	ldrb r0, [r4]
	cmp r0, #1
	beq _08044D6A
	movs r0, #2
	bl sub_804320C
	movs r1, #0
	movs r0, #1
	strb r0, [r4]
	adds r0, r5, #0
	adds r0, #0x39
	strb r1, [r0]
	b _08044E88
_08044D6A:
	movs r0, #0
	bl sub_804320C
	b _08044DAA
_08044D72:
	adds r4, r5, #0
	adds r4, #0x30
	ldrb r0, [r4]
	subs r0, #2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bls _08044DA4
	movs r0, #2
	bl sub_804320C
	movs r0, #2
	strb r0, [r4]
	adds r0, r5, #0
	adds r0, #0x32
	ldrb r0, [r0]
	cmp r0, #0
	beq _08044D9A
	movs r0, #3
	strb r0, [r4]
_08044D9A:
	adds r1, r5, #0
	adds r1, #0x39
	movs r0, #0
	strb r0, [r1]
	b _08044E88
_08044DA4:
	movs r0, #0
	bl sub_804320C
_08044DAA:
	ldr r0, _08044DC4  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08044DF2
	adds r0, r5, #0
	adds r0, #0x39
	ldrb r7, [r0]
	adds r4, r0, #0
	b _08044DDA
	.align 2, 0
_08044DC4: .4byte gKeyStatusPtr
_08044DC8:
	ldrb r2, [r4]
	adds r0, r5, #0
	adds r1, r6, #0
	movs r3, #1
	bl sub_8044B78
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08044DF2
_08044DDA:
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	ldrb r0, [r4]
	movs r1, #3
	bl __umodsi3
	strb r0, [r4]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r7, r0
	bne _08044DC8
_08044DF2:
	ldr r4, _08044E94  @ gKeyStatusPtr
	ldr r0, [r4]
	ldrh r1, [r0, #8]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08044E0A
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_8044AD4
_08044E0A:
	ldr r0, [r4]
	ldrh r1, [r0, #8]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _08044E20
	movs r0, #3
	bl sub_804320C
	movs r0, #5
	strh r0, [r5, #0x34]
_08044E20:
	ldr r0, [r4]
	ldrh r1, [r0, #8]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _08044E9C
	movs r0, #2
	bl sub_804320C
	adds r1, r5, #0
	adds r1, #0x30
	ldrb r0, [r1]
	adds r2, r0, #1
	strb r2, [r1]
	lsls r0, r2, #0x18
	lsrs r0, r0, #0x18
	adds r3, r1, #0
	cmp r0, #2
	bne _08044E54
	adds r0, r5, #0
	adds r0, #0x32
	ldrb r0, [r0]
	cmp r0, #0
	beq _08044E54
	adds r0, r2, #1
	strb r0, [r3]
_08044E54:
	adds r2, r3, #0
	ldrb r0, [r2]
	movs r1, #3
	ands r0, r1
	strb r0, [r2]
	ldr r0, [r5, #0x30]
	ldr r1, _08044E98  @ 0x00FF00FF
	ands r0, r1
	cmp r0, #3
	bne _08044E6C
	movs r0, #0
	strb r0, [r2]
_08044E6C:
	ldrb r1, [r3]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r6, r0
	ldr r0, [r0]
	ldrb r0, [r0]
	cmp r0, #0
	bne _08044E88
	adds r0, r5, #0
	movs r1, #2
	adds r2, r6, #0
	bl sub_80449E8
_08044E88:
	adds r0, r5, #0
	movs r1, #1
	bl Proc_Goto
	b _08044ED0
	.align 2, 0
_08044E94: .4byte gKeyStatusPtr
_08044E98: .4byte 0x00FF00FF
_08044E9C:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08044ED0
	adds r0, r5, #0
	adds r0, #0x38
	ldrb r0, [r0]
	cmp r0, #0
	beq _08044EB8
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_8044AD4
	b _08044ED0
_08044EB8:
	bl CheckSomethingSomewhere
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08044ED0
	movs r0, #1
	bl sub_804320C
	adds r0, r5, #0
	movs r1, #3
	bl Proc_Goto
_08044ED0:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8044C54

	THUMB_FUNC_START sub_8044ED8
sub_8044ED8: @ 0x08044ED8
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	sub sp, #8
	add r7, sp, #8
	adds r4, r0, #0
	mov r8, sp
	movs r0, #0x3c
	adds r0, r0, r4
	mov r9, r0
	ldrb r0, [r0]
	adds r0, #4
	lsrs r0, r0, #2
	lsls r0, r0, #2
	mov r1, sp
	subs r1, r1, r0
	mov sp, r1
	add r6, sp, #8
	movs r2, #0x34
	ldrsh r0, [r4, r2]
	bl sub_8044550
	adds r5, r0, #0
	ldrh r0, [r4, #0x34]
	strh r0, [r4, #0x36]
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_8044C54
	movs r0, #0x36
	ldrsh r1, [r4, r0]
	movs r2, #0x34
	ldrsh r0, [r4, r2]
	cmp r1, r0
	beq _08044F26
	movs r0, #3
	bl sub_804320C
_08044F26:
	movs r1, #0x34
	ldrsh r0, [r4, r1]
	bl sub_8044550
	adds r5, r0, #0
	adds r0, r4, #0
	adds r0, #0x3d
	adds r1, r6, #0
	bl sub_8042DC8
	mov r2, r9
	ldrb r0, [r2]
	subs r0, #1
	adds r0, r6, r0
	movs r1, #0
	strb r1, [r0]
	adds r0, r6, #0
	bl sub_8044750
	lsls r1, r0, #3
	subs r3, r1, r0
	ldr r6, [r4, #0x2c]
	ldrh r0, [r5, #0x30]
	subs r1, r0, #4
	ldrh r0, [r5, #0x32]
	adds r2, r0, #1
	adds r0, r5, #0
	adds r0, #0x34
	ldrb r0, [r0]
	str r0, [sp]
	adds r4, #0x30
	ldrb r0, [r4]
	cmp r0, #1
	bls _08044F6C
	movs r0, #2
_08044F6C:
	str r0, [sp, #4]
	adds r0, r6, #0
	bl sub_804CDD0
	mov sp, r8
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8044ED8

	THUMB_FUNC_START sub_8044F84
sub_8044F84: @ 0x08044F84
	push {lr}
	ldr r0, _08044FAC  @ 0x04000006
	ldrh r0, [r0]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0xa0
	bhi _08044FD0
	cmp r0, #0x27
	bhi _08044FB8
	ldr r1, _08044FB0  @ 0x04000050
	movs r2, #0x84
	lsls r2, r2, #4
	adds r0, r2, #0
	strh r0, [r1]
	adds r1, #2
	ldr r2, _08044FB4  @ 0x00000F08
	adds r0, r2, #0
	strh r0, [r1]
	b _08044FD0
	.align 2, 0
_08044FAC: .4byte 0x04000006
_08044FB0: .4byte 0x04000050
_08044FB4: .4byte 0x00000F08
_08044FB8:
	ldr r1, _08044FD4  @ 0x04000050
	ldr r2, _08044FD8  @ 0x00000442
	adds r0, r2, #0
	strh r0, [r1]
	ldr r2, _08044FDC  @ 0x04000052
	ldr r0, _08044FE0  @ gUnknown_03001810
	ldrb r1, [r0]
	movs r0, #0xf
	subs r0, r0, r1
	lsls r0, r0, #8
	adds r1, r1, r0
	strh r1, [r2]
_08044FD0:
	pop {r0}
	bx r0
	.align 2, 0
_08044FD4: .4byte 0x04000050
_08044FD8: .4byte 0x00000442
_08044FDC: .4byte 0x04000052
_08044FE0: .4byte gUnknown_03001810

	THUMB_FUNC_END sub_8044F84

	THUMB_FUNC_START sub_8044FE4
sub_8044FE4: @ 0x08044FE4
	push {lr}
	adds r0, #0x3a
	movs r1, #0
	strb r1, [r0]
	ldr r0, _08044FF8  @ sub_8044F84
	bl SetPrimaryHBlankHandler
	pop {r0}
	bx r0
	.align 2, 0
_08044FF8: .4byte sub_8044F84

	THUMB_FUNC_END sub_8044FE4

	THUMB_FUNC_START sub_8044FFC
sub_8044FFC: @ 0x08044FFC
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	ldr r4, _08045038  @ gUnknown_03001810
	adds r5, r6, #0
	adds r5, #0x3a
	ldrb r3, [r5]
	movs r0, #8
	str r0, [sp]
	movs r0, #0
	movs r1, #0xf
	movs r2, #0
	bl sub_8012DCC
	strb r0, [r4]
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #8
	bls _0804502E
	adds r0, r6, #0
	bl Proc_Break
_0804502E:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08045038: .4byte gUnknown_03001810

	THUMB_FUNC_END sub_8044FFC

	THUMB_FUNC_START sub_804503C
sub_804503C: @ 0x0804503C
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r2, r4, #0
	adds r2, #0x31
	ldrb r0, [r2]
	adds r0, #1
	movs r5, #0
	movs r1, #1
	ands r0, r1
	strb r0, [r2]
	adds r0, r4, #0
	bl sub_8044614
	movs r0, #2
	bl BG_EnableSyncByMask
	adds r4, #0x3a
	strb r5, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_804503C

	THUMB_FUNC_START sub_8045068
sub_8045068: @ 0x08045068
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	ldr r4, _080450A8  @ gUnknown_03001810
	adds r5, r6, #0
	adds r5, #0x3a
	ldrb r3, [r5]
	movs r0, #8
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0xf
	bl sub_8012DCC
	strb r0, [r4]
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #8
	bls _080450A0
	movs r0, #0
	bl SetPrimaryHBlankHandler
	adds r0, r6, #0
	bl Proc_Break
_080450A0:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080450A8: .4byte gUnknown_03001810

	THUMB_FUNC_END sub_8045068

	THUMB_FUNC_START NameSelect_DrawName
NameSelect_DrawName: @ 0x080450AC
	push {r4, lr}
	adds r0, #0x3b
	movs r1, #1
	strb r1, [r0]
	bl sub_804D80C
	ldr r4, _080450FC  @ gUnknown_0203DAB0
	adds r0, r4, #0
	bl Text_Clear
	ldr r0, _08045100  @ 0x00000141
	bl GetStringFromIndex
	adds r1, r0, #0
	adds r0, r4, #0
	bl Text_AppendString
	adds r0, r4, #0
	movs r1, #0x26
	bl Text_SetXCursor
	movs r0, #0xa3
	lsls r0, r0, #1
	bl GetStringFromIndex
	adds r1, r0, #0
	adds r0, r4, #0
	bl Text_AppendString
	ldr r1, _08045104  @ gUnknown_02022FBE
	adds r0, r4, #0
	bl Text_Draw
	movs r0, #1
	bl BG_EnableSyncByMask
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080450FC: .4byte gUnknown_0203DAB0
_08045100: .4byte 0x00000141
_08045104: .4byte gUnknown_02022FBE

	THUMB_FUNC_END NameSelect_DrawName

	THUMB_FUNC_START sub_8045108
sub_8045108: @ 0x08045108
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r0, #0x40
	movs r1, #0x58
	bl sub_804D834
	ldr r0, _08045198  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _08045136
	adds r1, r5, #0
	adds r1, #0x3b
	ldrb r0, [r1]
	cmp r0, #1
	bne _08045136
	movs r0, #0
	strb r0, [r1]
	movs r0, #3
	bl sub_804320C
_08045136:
	ldr r0, _08045198  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0x10
	ands r0, r1
	adds r4, r5, #0
	adds r4, #0x3b
	cmp r0, #0
	beq _08045158
	ldrb r0, [r4]
	cmp r0, #0
	bne _08045158
	movs r0, #1
	strb r0, [r4]
	movs r0, #3
	bl sub_804320C
_08045158:
	ldrb r1, [r4]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, #0x50
	movs r1, #0x60
	bl DisplayUiHand
	ldr r0, _08045198  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080451A0
	movs r0, #1
	bl sub_804320C
	ldr r0, _0804519C  @ gUnknown_02022FBE
	movs r1, #0xc
	movs r2, #2
	movs r3, #0
	bl TileMap_FillRect
	movs r0, #1
	bl BG_EnableSyncByMask
	adds r0, r5, #0
	bl Proc_Break
	b _080451E6
	.align 2, 0
_08045198: .4byte gKeyStatusPtr
_0804519C: .4byte gUnknown_02022FBE
_080451A0:
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080451E6
	ldrb r0, [r4]
	cmp r0, #0
	bne _080451C8
	movs r0, #2
	bl sub_804320C
	ldr r1, _080451C4  @ gUnknown_0203DD24
	movs r0, #1
	strb r0, [r1]
	adds r0, r5, #0
	movs r1, #2
	bl Proc_Goto
	b _080451CE
	.align 2, 0
_080451C4: .4byte gUnknown_0203DD24
_080451C8:
	movs r0, #1
	bl sub_804320C
_080451CE:
	ldr r0, _080451EC  @ gUnknown_02022FBE
	movs r1, #0xc
	movs r2, #2
	movs r3, #0
	bl TileMap_FillRect
	movs r0, #1
	bl BG_EnableSyncByMask
	adds r0, r5, #0
	bl Proc_Break
_080451E6:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080451EC: .4byte gUnknown_02022FBE

	THUMB_FUNC_END sub_8045108

	THUMB_FUNC_START sub_80451F0
sub_80451F0: @ 0x080451F0
	push {lr}
	bl EndBG3Slider
	bl CheckSomethingSomewhere
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08045204
	bl nullsub_13
_08045204:
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80451F0

	THUMB_FUNC_START sub_8045208
sub_8045208: @ 0x08045208
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x40
	ldrh r0, [r0]
	adds r1, r4, #0
	adds r1, #0x42
	ldrb r2, [r1]
	lsls r1, r2, #3
	movs r3, #0xc0
	lsls r3, r3, #1
	adds r1, r1, r3
	adds r2, #0xa
	bl sub_80059CC
	movs r0, #0
	str r0, [r4, #0x3c]
	subs r0, #0x26
	str r0, [r4, #0x34]
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8045208

	THUMB_FUNC_START sub_8045234
sub_8045234: @ 0x08045234
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r6, r0, #0
	ldr r4, [r6, #0x2c]
	ldr r0, [r4, #0x64]
	cmp r0, #0
	bne _08045254
	ldr r0, [r6, #0x3c]
	cmp r0, #0x20
	ble _0804524E
	adds r0, r6, #0
	bl Proc_Break
_0804524E:
	ldr r0, [r4, #0x64]
	cmp r0, #0
	beq _0804525A
_08045254:
	ldr r0, [r6, #0x34]
	adds r0, #1
	str r0, [r6, #0x34]
_0804525A:
	ldr r0, [r6, #0x38]
	subs r0, #1
	str r0, [r6, #0x38]
	cmp r0, #0
	bge _08045268
	movs r0, #0
	str r0, [r6, #0x38]
_08045268:
	ldr r4, [r6, #0x38]
	cmp r4, #0
	beq _08045270
	b _0804537E
_08045270:
	ldr r3, [r6, #0x3c]
	cmp r3, #0x20
	bgt _08045288
	movs r1, #0x50
	negs r1, r1
	movs r0, #0x20
	str r0, [sp]
	movs r0, #4
	movs r2, #0
	bl sub_8012DCC
	str r0, [r6, #0x30]
_08045288:
	ldr r0, [r6, #0x3c]
	adds r0, #1
	str r0, [r6, #0x3c]
	ldr r1, [r6, #0x30]
	ldr r2, [r6, #0x34]
	subs r2, #0x10
	ldr r3, _08045330  @ gUnknown_085A96E4
	adds r7, r6, #0
	adds r7, #0x43
	ldrb r0, [r7]
	lsls r0, r0, #2
	adds r0, r0, r3
	ldr r3, [r0]
	str r4, [sp]
	movs r0, #4
	bl PutSprite
	ldr r1, [r6, #0x30]
	adds r1, #0x48
	ldr r2, [r6, #0x34]
	subs r2, #6
	ldr r3, _08045334  @ gUnknown_085A96D4
	adds r5, r6, #0
	adds r5, #0x42
	ldrb r0, [r5]
	lsls r0, r0, #2
	adds r0, r0, r3
	ldr r3, [r0]
	str r4, [sp]
	movs r0, #4
	bl PutSprite
	ldr r1, [r6, #0x30]
	adds r1, #0x60
	ldr r2, [r6, #0x34]
	adds r2, #8
	ldr r3, _08045338  @ gUnknown_080D9DE4
	str r4, [sp]
	movs r0, #4
	bl PutSprite
	ldr r1, [r6, #0x30]
	adds r1, #0x40
	ldr r2, [r6, #0x34]
	adds r2, #8
	ldr r3, _0804533C  @ gUnknown_080D9E06
	ldrb r0, [r7]
	lsls r0, r0, #2
	adds r0, #0x50
	str r0, [sp]
	movs r0, #4
	bl PutSprite
	ldr r1, [r6, #0x30]
	negs r1, r1
	adds r1, #0x70
	ldr r2, [r6, #0x34]
	subs r2, #8
	ldr r3, _08045340  @ gUnknown_085AAA50
	ldrb r4, [r5]
	movs r0, #0xf
	ands r0, r4
	lsls r0, r0, #0xc
	movs r4, #0x80
	lsls r4, r4, #3
	adds r0, r0, r4
	str r0, [sp]
	movs r0, #4
	bl PutSprite
	ldr r0, [r6, #0x30]
	negs r0, r0
	adds r4, r0, #0
	adds r4, #0x7c
	ldr r2, [r6, #0x34]
	ldr r3, _08045344  @ gUnknown_080D9DF2
	ldrb r0, [r5]
	cmp r0, #3
	beq _08045348
	adds r1, r0, #0
	lsls r0, r1, #3
	adds r0, r0, r1
	b _0804534A
	.align 2, 0
_08045330: .4byte gUnknown_085A96E4
_08045334: .4byte gUnknown_085A96D4
_08045338: .4byte gUnknown_080D9DE4
_0804533C: .4byte gUnknown_080D9E06
_08045340: .4byte gUnknown_085AAA50
_08045344: .4byte gUnknown_080D9DF2
_08045348:
	movs r0, #0x40
_0804534A:
	str r0, [sp]
	movs r0, #4
	adds r1, r4, #0
	bl PutSprite
	ldr r1, [r6, #0x30]
	negs r1, r1
	adds r1, #0xd0
	ldr r2, [r6, #0x34]
	subs r2, #8
	ldr r3, _08045388  @ gUnknown_080D9E0E
	ldrb r4, [r5]
	adds r0, r4, #0
	adds r0, #0xa
	movs r5, #0xf
	ands r0, r5
	lsls r0, r0, #0xc
	lsls r4, r4, #3
	movs r5, #0xc0
	lsls r5, r5, #1
	adds r4, r4, r5
	adds r0, r0, r4
	str r0, [sp]
	movs r0, #5
	bl PutSprite
_0804537E:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08045388: .4byte gUnknown_080D9E0E

	THUMB_FUNC_END sub_8045234

	THUMB_FUNC_START sub_804538C
sub_804538C: @ 0x0804538C
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r1, [r5, #0x30]
	ldr r2, [r5, #0x34]
	subs r2, #0x10
	ldr r3, _08045434  @ gUnknown_085A96E4
	adds r7, r5, #0
	adds r7, #0x43
	ldrb r0, [r7]
	lsls r0, r0, #2
	adds r0, r0, r3
	ldr r3, [r0]
	movs r4, #0
	str r4, [sp]
	movs r0, #4
	bl PutSprite
	ldr r1, [r5, #0x30]
	adds r1, #0x48
	ldr r2, [r5, #0x34]
	subs r2, #6
	ldr r3, _08045438  @ gUnknown_085A96D4
	adds r6, r5, #0
	adds r6, #0x42
	ldrb r0, [r6]
	lsls r0, r0, #2
	adds r0, r0, r3
	ldr r3, [r0]
	str r4, [sp]
	movs r0, #4
	bl PutSprite
	ldr r1, [r5, #0x30]
	adds r1, #0x60
	ldr r2, [r5, #0x34]
	adds r2, #8
	ldr r3, _0804543C  @ gUnknown_080D9DE4
	str r4, [sp]
	movs r0, #4
	bl PutSprite
	ldr r1, [r5, #0x30]
	adds r1, #0x40
	ldr r2, [r5, #0x34]
	adds r2, #8
	ldr r3, _08045440  @ gUnknown_080D9E06
	ldrb r0, [r7]
	lsls r0, r0, #2
	adds r0, #0x50
	str r0, [sp]
	movs r0, #4
	bl PutSprite
	ldr r1, [r5, #0x30]
	negs r1, r1
	adds r1, #0x70
	ldr r2, [r5, #0x34]
	subs r2, #8
	ldr r3, _08045444  @ gUnknown_085AAA50
	ldrb r4, [r6]
	movs r0, #0xf
	ands r0, r4
	lsls r0, r0, #0xc
	movs r4, #0x80
	lsls r4, r4, #3
	adds r0, r0, r4
	str r0, [sp]
	movs r0, #4
	bl PutSprite
	ldr r0, [r5, #0x30]
	negs r0, r0
	adds r4, r0, #0
	adds r4, #0x7c
	ldr r2, [r5, #0x34]
	ldr r3, _08045448  @ gUnknown_080D9DF2
	ldrb r0, [r6]
	cmp r0, #3
	beq _0804544C
	adds r1, r0, #0
	lsls r0, r1, #3
	adds r0, r0, r1
	b _0804544E
	.align 2, 0
_08045434: .4byte gUnknown_085A96E4
_08045438: .4byte gUnknown_085A96D4
_0804543C: .4byte gUnknown_080D9DE4
_08045440: .4byte gUnknown_080D9E06
_08045444: .4byte gUnknown_085AAA50
_08045448: .4byte gUnknown_080D9DF2
_0804544C:
	movs r0, #0x40
_0804544E:
	str r0, [sp]
	movs r0, #4
	adds r1, r4, #0
	bl PutSprite
	ldr r1, [r5, #0x30]
	negs r1, r1
	adds r1, #0xd0
	ldr r2, [r5, #0x34]
	subs r2, #8
	ldr r3, _08045490  @ gUnknown_080D9E0E
	adds r0, r5, #0
	adds r0, #0x42
	ldrb r4, [r0]
	adds r0, r4, #0
	adds r0, #0xa
	movs r5, #0xf
	ands r0, r5
	lsls r0, r0, #0xc
	lsls r4, r4, #3
	movs r5, #0xc0
	lsls r5, r5, #1
	adds r4, r4, r5
	adds r0, r0, r4
	str r0, [sp]
	movs r0, #5
	bl PutSprite
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08045490: .4byte gUnknown_080D9E0E

	THUMB_FUNC_END sub_804538C

	THUMB_FUNC_START sub_8045494
sub_8045494: @ 0x08045494
	push {r4, r5, r6, lr}
	mov r6, r9
	mov r5, r8
	push {r5, r6}
	mov r8, r0
	mov r9, r1
	adds r4, r2, #0
	adds r6, r3, #0
	ldr r5, [sp, #0x18]
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	ldr r0, _080454E0  @ gUnknown_085A96F4
	mov r1, r8
	bl Proc_Start
	adds r1, r0, #0
	mov r0, r8
	str r0, [r1, #0x2c]
	mov r0, r9
	str r0, [r1, #0x38]
	adds r0, r1, #0
	adds r0, #0x40
	strh r4, [r0]
	adds r0, #3
	strb r5, [r0]
	subs r0, #1
	strb r6, [r0]
	adds r0, r1, #0
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_080454E0: .4byte gUnknown_085A96F4

	THUMB_FUNC_END sub_8045494

	THUMB_FUNC_START sub_80454E4
sub_80454E4: @ 0x080454E4
	push {r4, r5, r6, r7, lr}
	adds r2, r0, #0
	adds r0, #0x40
	ldrb r5, [r0]
	ldr r6, _08045524  @ gBG2TilemapBuffer
	adds r1, r2, #0
	adds r1, #0x42
	adds r4, r2, #0
	adds r4, #0x41
	ldrb r0, [r4]
	subs r3, r0, #1
	lsls r0, r3, #3
	adds r0, r2, r0
	adds r0, #0x44
	ldrb r1, [r1]
	ldrb r0, [r0]
	cmp r1, r0
	bne _08045534
	ldr r2, _08045528  @ gUnknown_080D9E1C
	lsls r0, r3, #1
	lsls r1, r5, #3
	adds r0, r0, r1
	adds r0, r0, r2
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r0, r0, #6
	adds r0, r0, r6
	ldr r1, _0804552C  @ gUnknown_085ADE88
	ldr r2, _08045530  @ 0x00002078
	bl CallARM_FillTileRect
	b _0804555E
	.align 2, 0
_08045524: .4byte gBG2TilemapBuffer
_08045528: .4byte gUnknown_080D9E1C
_0804552C: .4byte gUnknown_085ADE88
_08045530: .4byte 0x00002078
_08045534:
	movs r2, #0
	ldr r7, _08045564  @ gUnknown_080D9E1C
	adds r3, r4, #0
	lsls r1, r5, #3
	ldr r5, _08045568  @ 0x00001034
	adds r4, r5, #0
_08045540:
	ldrb r0, [r3]
	subs r0, #1
	lsls r0, r0, #1
	adds r0, r0, r1
	adds r0, r0, r7
	movs r5, #0
	ldrsh r0, [r0, r5]
	lsls r0, r0, #5
	adds r0, r0, r2
	lsls r0, r0, #1
	adds r0, r0, r6
	strh r4, [r0]
	adds r2, #1
	cmp r2, #0x5f
	ble _08045540
_0804555E:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08045564: .4byte gUnknown_080D9E1C
_08045568: .4byte 0x00001034

	THUMB_FUNC_END sub_80454E4

	THUMB_FUNC_START sub_804556C
sub_804556C: @ 0x0804556C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	str r0, [sp]
	adds r0, #0x40
	ldrb r0, [r0]
	mov r9, r0
	ldr r0, _080455C0  @ gUnknown_02000C60
	bl SetFont
	movs r5, #0
	cmp r5, r9
	bge _080455FA
	mov sl, r5
	movs r0, #0x98
	mov r8, r0
	movs r7, #0
	movs r6, #0
_08045596:
	ldr r0, _080455C4  @ gUnknown_0203DAC5
	adds r4, r6, r0
	adds r0, r4, #0
	bl GetStringTextWidth
	adds r1, r0, #0
	movs r0, #0x48
	subs r0, r0, r1
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r1, r0, #1
	cmp r5, #2
	bgt _080455CC
	adds r1, r7, r1
	ldr r0, _080455C8  @ gUnknown_0203DB14
	movs r2, #0
	adds r3, r4, #0
	bl Text_InsertString
	b _080455D6
	.align 2, 0
_080455C0: .4byte gUnknown_02000C60
_080455C4: .4byte gUnknown_0203DAC5
_080455C8: .4byte gUnknown_0203DB14
_080455CC:
	ldr r0, _0804560C  @ gUnknown_0203DB1C
	movs r2, #0
	adds r3, r4, #0
	bl Text_InsertString
_080455D6:
	ldr r0, [sp]
	adds r0, #0x48
	add r0, sl
	ldr r3, [r0]
	ldr r0, _0804560C  @ gUnknown_0203DB1C
	mov r1, r8
	movs r2, #2
	bl sub_8042DE8
	movs r0, #8
	add sl, r0
	movs r0, #0x20
	add r8, r0
	adds r7, #0x48
	adds r6, #0xf
	adds r5, #1
	cmp r5, r9
	blt _08045596
_080455FA:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804560C: .4byte gUnknown_0203DB1C

	THUMB_FUNC_END sub_804556C

	THUMB_FUNC_START sub_8045610
sub_8045610: @ 0x08045610
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08045630  @ gUnknown_085A9774
	adds r1, r4, #0
	bl Proc_Start
	adds r1, r0, #0
	adds r0, r4, #0
	adds r0, #0x42
	adds r4, #0x44
	ldrb r0, [r0]
	ldrb r4, [r4]
	cmp r0, r4
	bne _08045634
	movs r0, #1
	b _08045636
	.align 2, 0
_08045630: .4byte gUnknown_085A9774
_08045634:
	movs r0, #0
_08045636:
	str r0, [r1, #0x58]
	adds r0, r1, #0
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8045610

	THUMB_FUNC_START sub_8045640
sub_8045640: @ 0x08045640
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r6, r0, #0
	bl sub_8043044
	bl sub_804C33C
	ldr r0, _0804579C  @ gUnknown_085ABD68
	ldr r1, _080457A0  @ 0x06014800
	bl CopyDataWithPossibleUncomp
	ldr r0, _080457A4  @ gUnknown_085ADA38
	ldr r1, _080457A8  @ 0x06016000
	bl CopyDataWithPossibleUncomp
	ldr r0, _080457AC  @ gUnknown_085AD0CC
	ldr r1, _080457B0  @ 0x06016800
	bl CopyDataWithPossibleUncomp
	ldr r0, _080457B4  @ gUnknown_085ADC48
	movs r1, #0x98
	lsls r1, r1, #2
	movs r2, #0x80
	bl CopyToPaletteBuffer
	ldr r0, _080457B8  @ gUnknown_085ADDC8
	movs r1, #0xb8
	lsls r1, r1, #2
	movs r2, #0x20
	bl CopyToPaletteBuffer
	ldr r0, _080457BC  @ gUnknown_085ACD20
	ldr r1, _080457C0  @ 0x06000F00
	bl CopyDataWithPossibleUncomp
	ldr r0, _080457C4  @ gUnknown_085ADE08
	movs r1, #0x40
	movs r2, #0x20
	bl CopyToPaletteBuffer
	ldr r4, _080457C8  @ gUnknown_085AF170
	movs r0, #3
	bl GetBackgroundTileDataOffset
	adds r1, r0, #0
	movs r0, #0xc0
	lsls r0, r0, #0x13
	adds r1, r1, r0
	adds r0, r4, #0
	bl CopyDataWithPossibleUncomp
	ldr r0, _080457CC  @ gUnknown_085B081C
	movs r1, #0xa0
	lsls r1, r1, #1
	movs r2, #0x80
	bl CopyToPaletteBuffer
	ldr r0, _080457D0  @ gUnknown_085B089C
	ldr r4, _080457D4  @ gUnknown_02020188
	adds r1, r4, #0
	bl CopyDataWithPossibleUncomp
	ldr r0, _080457D8  @ gBG3TilemapBuffer
	movs r2, #0xa0
	lsls r2, r2, #8
	adds r1, r4, #0
	bl CallARM_FillTileRect
	ldr r0, _080457DC  @ gUnknown_02000C60
	ldr r1, _080457E0  @ 0x06012000
	movs r2, #0xe
	bl InitSomeOtherGraphicsRelatedStruct
	ldr r0, _080457E4  @ gUnknown_0859EF00
	movs r1, #0xf0
	lsls r1, r1, #2
	movs r2, #0x20
	bl CopyToPaletteBuffer
	movs r0, #0
	bl SetFontGlyphSet
	bl sub_8003D20
	ldr r4, _080457E8  @ gUnknown_0203DB14
	movs r5, #1
_080456EC:
	adds r0, r4, #0
	bl Text_Init3
	adds r0, r4, #0
	movs r1, #0
	bl Text_80046B4
	adds r4, #8
	subs r5, #1
	cmp r5, #0
	bge _080456EC
	ldr r0, _080457EC  @ gUnknown_085A92E0
	ldr r0, [r0]
	ldrb r2, [r0, #7]
	adds r1, r6, #0
	adds r1, #0x40
	movs r5, #0
	strb r2, [r1]
	ldrb r1, [r0, #7]
	adds r2, r6, #0
	adds r2, #0x41
	strb r1, [r2]
	ldrb r0, [r0, #6]
	adds r1, r6, #0
	adds r1, #0x42
	strb r0, [r1]
	add r0, sp, #4
	strh r5, [r0]
	adds r4, r6, #0
	adds r4, #0x44
	ldr r2, _080457F0  @ 0x01000010
	adds r1, r4, #0
	bl CpuSet
	adds r0, r4, #0
	bl sub_8048884
	adds r0, r6, #0
	bl sub_804556C
	movs r0, #0xb0
	str r0, [r6, #0x64]
	movs r0, #2
	movs r1, #0
	movs r2, #0xb0
	bl BG_SetPosition
	ldr r2, _080457F4  @ gLCDControlBuffer
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
	movs r0, #1
	movs r1, #8
	movs r2, #8
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	str r5, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #1
	movs r3, #0
	bl sub_8001ED0
	str r5, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #1
	bl sub_8001F0C
	adds r0, r6, #0
	bl sub_8045610
	movs r0, #8
	bl BG_EnableSyncByMask
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0804579C: .4byte gUnknown_085ABD68
_080457A0: .4byte 0x06014800
_080457A4: .4byte gUnknown_085ADA38
_080457A8: .4byte 0x06016000
_080457AC: .4byte gUnknown_085AD0CC
_080457B0: .4byte 0x06016800
_080457B4: .4byte gUnknown_085ADC48
_080457B8: .4byte gUnknown_085ADDC8
_080457BC: .4byte gUnknown_085ACD20
_080457C0: .4byte 0x06000F00
_080457C4: .4byte gUnknown_085ADE08
_080457C8: .4byte gUnknown_085AF170
_080457CC: .4byte gUnknown_085B081C
_080457D0: .4byte gUnknown_085B089C
_080457D4: .4byte gUnknown_02020188
_080457D8: .4byte gBG3TilemapBuffer
_080457DC: .4byte gUnknown_02000C60
_080457E0: .4byte 0x06012000
_080457E4: .4byte gUnknown_0859EF00
_080457E8: .4byte gUnknown_0203DB14
_080457EC: .4byte gUnknown_085A92E0
_080457F0: .4byte 0x01000010
_080457F4: .4byte gLCDControlBuffer

	THUMB_FUNC_END sub_8045640

	THUMB_FUNC_START sub_80457F8
sub_80457F8: @ 0x080457F8
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r0, #0x40
	ldrb r6, [r0]
	ldr r2, [r4, #0x64]
	subs r2, #1
	str r2, [r4, #0x64]
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #2
	movs r1, #0
	bl BG_SetPosition
	bl sub_804D6D4
	adds r5, r4, #0
	adds r5, #0x41
	ldrb r0, [r5]
	cmp r0, #0
	beq _08045880
	ldr r2, [r4, #0x64]
	asrs r2, r2, #3
	ldr r3, _08045894  @ gUnknown_080D9E1C
	subs r0, #1
	lsls r0, r0, #1
	lsls r1, r6, #3
	adds r0, r0, r1
	adds r0, r0, r3
	movs r1, #0
	ldrsh r0, [r0, r1]
	adds r0, #4
	cmp r2, r0
	bne _08045880
	adds r0, r4, #0
	bl sub_80454E4
	movs r0, #4
	bl BG_EnableSyncByMask
	ldr r2, _08045898  @ gUnknown_0203DD90
	ldrb r1, [r5]
	subs r1, #1
	lsls r0, r1, #3
	adds r0, r4, r0
	adds r0, #0x44
	ldrb r3, [r0]
	lsls r0, r3, #1
	adds r2, #0x24
	adds r0, r0, r2
	ldrh r2, [r0]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	str r1, [sp]
	adds r0, r4, #0
	movs r1, #0x28
	bl sub_8045494
	ldrb r2, [r5]
	subs r2, #1
	lsls r2, r2, #2
	adds r1, r4, #0
	adds r1, #0x2c
	adds r1, r1, r2
	str r0, [r1]
	ldrb r0, [r5]
	subs r0, #1
	strb r0, [r5]
_08045880:
	ldr r0, [r4, #0x64]
	cmp r0, #0
	bne _0804588C
	adds r0, r4, #0
	bl Proc_Break
_0804588C:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08045894: .4byte gUnknown_080D9E1C
_08045898: .4byte gUnknown_0203DD90

	THUMB_FUNC_END sub_80457F8

	THUMB_FUNC_START sub_804589C
sub_804589C: @ 0x0804589C
	push {r4, lr}
	adds r4, r0, #0
	bl sub_804D6D4
	ldr r0, _080458D8  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080458D2
	ldr r2, _080458DC  @ gMPlayTable
	ldr r0, _080458E0  @ gSongTable
	ldr r1, _080458E4  @ 0x0000040C
	adds r0, r0, r1
	ldrh r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r0, [r0]
	movs r1, #1
	bl m4aMPlayFadeOut
	adds r0, r4, #0
	bl Proc_Break
_080458D2:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080458D8: .4byte gKeyStatusPtr
_080458DC: .4byte gMPlayTable
_080458E0: .4byte gSongTable
_080458E4: .4byte 0x0000040C

	THUMB_FUNC_END sub_804589C

	THUMB_FUNC_START sub_80458E8
sub_80458E8: @ 0x080458E8
	push {lr}
	ldr r0, [r0, #0x58]
	cmp r0, #0
	beq _080458FC
	movs r0, #0x3a
	movs r1, #0
	movs r2, #0
	bl Sound_PlaySong80024E4
	b _08045906
_080458FC:
	movs r0, #0x3b
	movs r1, #0
	movs r2, #0
	bl Sound_PlaySong80024E4
_08045906:
	ldr r0, _0804591C  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08045918
	movs r0, #0x81
	bl m4aSongNumStart
_08045918:
	pop {r0}
	bx r0
	.align 2, 0
_0804591C: .4byte gRAMChapterData

	THUMB_FUNC_END sub_80458E8

	THUMB_FUNC_START sub_8045920
sub_8045920: @ 0x08045920
	push {lr}
	movs r0, #0x3b
	movs r1, #0
	movs r2, #0
	bl Sound_PlaySong80024E4
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8045920

	THUMB_FUNC_START sub_8045930
sub_8045930: @ 0x08045930
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	mov r9, r1
	mov sl, r2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	adds r4, r3, #0
	movs r2, #0
	ldr r1, _08045964  @ gUnknown_0203DC44
_0804594C:
	ldr r0, [r1]
	lsrs r0, r0, #5
	cmp r0, r4
	bcs _08045968
	adds r7, r2, #0
	movs r2, #9
	lsls r3, r3, #5
	str r3, [sp, #4]
	cmp r2, r7
	ble _080459E4
	b _08045976
	.align 2, 0
_08045964: .4byte gUnknown_0203DC44
_08045968:
	adds r1, #0x14
	adds r2, #1
	cmp r2, #9
	ble _0804594C
	movs r0, #1
	negs r0, r0
	b _08045A48
_08045976:
	ldr r6, _08045A58  @ gUnknown_0203DC44
	lsls r1, r2, #2
	adds r1, r1, r2
	lsls r1, r1, #2
	adds r5, r1, r6
	subs r2, #1
	mov r8, r2
	lsls r4, r2, #2
	add r4, r8
	lsls r4, r4, #2
	adds r4, r4, r6
	ldrb r2, [r4]
	lsls r2, r2, #0x1e
	lsrs r2, r2, #0x1e
	ldrb r3, [r5]
	movs r0, #4
	negs r0, r0
	ands r0, r3
	orrs r0, r2
	strb r0, [r5]
	ldr r3, [r4]
	lsrs r3, r3, #5
	lsls r3, r3, #5
	ldr r0, [r5]
	movs r2, #0x1f
	ands r0, r2
	orrs r0, r3
	str r0, [r5]
	ldrb r0, [r4]
	movs r2, #0xc
	ands r2, r0
	ldrb r3, [r5]
	movs r0, #0xd
	negs r0, r0
	ands r0, r3
	orrs r0, r2
	strb r0, [r5]
	ldrb r2, [r4]
	movs r3, #0x10
	ands r3, r2
	movs r2, #0x11
	negs r2, r2
	ands r0, r2
	orrs r0, r3
	strb r0, [r5]
	adds r0, r6, #0
	subs r0, #0x10
	adds r0, r1, r0
	adds r6, #4
	adds r1, r1, r6
	bl sub_8042DC8
	mov r2, r8
	cmp r2, r7
	bgt _08045976
_080459E4:
	ldr r5, _08045A58  @ gUnknown_0203DC44
	lsls r1, r7, #2
	adds r1, r1, r7
	lsls r1, r1, #2
	adds r4, r1, r5
	movs r6, #3
	ldr r2, [sp]
	ands r2, r6
	ldrb r3, [r4]
	movs r0, #4
	negs r0, r0
	ands r0, r3
	orrs r0, r2
	strb r0, [r4]
	ldr r0, [r4]
	movs r2, #0x1f
	ands r0, r2
	ldr r2, [sp, #4]
	orrs r0, r2
	str r0, [r4]
	mov r3, r9
	ands r3, r6
	lsls r3, r3, #2
	ldrb r2, [r4]
	movs r0, #0xd
	negs r0, r0
	ands r0, r2
	orrs r0, r3
	movs r2, #1
	mov r3, sl
	ands r3, r2
	lsls r3, r3, #4
	movs r2, #0x11
	negs r2, r2
	ands r0, r2
	orrs r0, r3
	strb r0, [r4]
	ldr r0, _08045A5C  @ gUnknown_085A92E0
	ldr r0, [r0]
	movs r2, #6
	ldrsb r2, [r0, r2]
	lsls r0, r2, #4
	subs r0, r0, r2
	ldr r2, _08045A60  @ gUnknown_0203DAC5
	adds r0, r0, r2
	adds r5, #4
	adds r1, r1, r5
	bl sub_8042DC8
	adds r0, r7, #0
_08045A48:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08045A58: .4byte gUnknown_0203DC44
_08045A5C: .4byte gUnknown_085A92E0
_08045A60: .4byte gUnknown_0203DAC5

	THUMB_FUNC_END sub_8045930

	THUMB_FUNC_START sub_8045A64
sub_8045A64: @ 0x08045A64
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	adds r7, r0, #0
	ldr r1, _08045AD0  @ gUnknown_0203DA24
	adds r0, r1, #0
	adds r0, #0xec
	ldrb r5, [r0]
	lsls r5, r5, #0x1e
	lsrs r5, r5, #0x1f
	adds r1, #0xa0
	ldrb r6, [r1]
	subs r6, #1
	bl sub_8049A60
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r1, _08045AD4  @ gUnknown_0203DD90
	ldr r0, _08045AD8  @ gUnknown_085A92E0
	ldr r0, [r0]
	ldrb r0, [r0, #6]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #2
	adds r1, #0x14
	adds r0, r0, r1
	ldr r0, [r0]
	mov r9, r0
	ldr r0, _08045ADC  @ gUnknown_0203DC44
	mov r8, r0
	bl sub_80A69DC
	adds r0, r4, #0
	adds r1, r6, #0
	adds r2, r5, #0
	mov r3, r9
	bl sub_8045930
	str r0, [r7, #0x58]
	mov r0, r8
	bl sub_80A69A0
	ldr r1, [r7, #0x58]
	movs r0, #1
	negs r0, r0
	cmp r1, r0
	beq _08045AE0
	adds r0, r1, #0
	adds r1, r7, #0
	bl sub_8047654
	b _08045AE6
	.align 2, 0
_08045AD0: .4byte gUnknown_0203DA24
_08045AD4: .4byte gUnknown_0203DD90
_08045AD8: .4byte gUnknown_085A92E0
_08045ADC: .4byte gUnknown_0203DC44
_08045AE0:
	movs r0, #1
	bl Sound_FadeOut800231C
_08045AE6:
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8045A64

	THUMB_FUNC_START sub_8045AF4
sub_8045AF4: @ 0x08045AF4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	ldr r1, _08045B78  @ gUnknown_080D9E44
	mov r0, sp
	movs r2, #3
	bl memcpy
	bl ClearUnits
	movs r6, #0
	ldr r1, _08045B7C  @ gUnknown_0203DA24
	ldrb r0, [r1, #5]
	adds r0, #2
	cmp r6, r0
	bge _08045BCC
	mov r9, r1
_08045B1C:
	lsls r4, r6, #6
	adds r4, #1
	adds r0, r4, #0
	bl GetUnit
	adds r5, r0, #0
	mov r0, r9
	adds r0, #6
	adds r0, r6, r0
	ldrb r0, [r0]
	lsls r2, r6, #4
	subs r2, r2, r6
	ldr r1, _08045B80  @ gUnknown_0203DAC5
	adds r2, r2, r1
	adds r1, r5, #0
	bl sub_80A693C
	movs r7, #0
	adds r0, r6, #1
	mov sl, r0
	lsls r0, r6, #1
	ldr r1, _08045B84  @ gUnknown_0203DDB4
	adds r0, r0, r1
	mov r8, r0
_08045B4C:
	adds r0, r4, #0
	bl GetUnit
	adds r5, r0, #0
	movs r0, #0
	strb r0, [r5, #9]
	adds r0, r5, #0
	movs r1, #0
	bl SetUnitStatus
	movs r1, #0
	strb r1, [r5, #0x1b]
	ldr r0, _08045B88  @ gUnknown_0203DB10
	ldrb r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	bne _08045B8C
	adds r0, r5, #0
	bl sub_80431B4
	b _08045B92
	.align 2, 0
_08045B78: .4byte gUnknown_080D9E44
_08045B7C: .4byte gUnknown_0203DA24
_08045B80: .4byte gUnknown_0203DAC5
_08045B84: .4byte gUnknown_0203DDB4
_08045B88: .4byte gUnknown_0203DB10
_08045B8C:
	adds r0, r5, #0
	bl sub_804D40C
_08045B92:
	cmp r7, #0
	bne _08045BA0
	adds r0, r5, #0
	bl GetUnitMiniPortraitId
	mov r1, r8
	strh r0, [r1]
_08045BA0:
	strb r4, [r5, #0xb]
	cmp r6, #0
	beq _08045BB8
	ldr r0, _08045C04  @ gUnknown_0203DB10
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _08045BB8
	movs r0, #0x80
	lsls r0, r0, #2
	str r0, [r5, #0xc]
_08045BB8:
	adds r4, #1
	adds r7, #1
	cmp r7, #4
	ble _08045B4C
	mov r6, sl
	mov r1, r9
	ldrb r0, [r1, #5]
	adds r0, #2
	cmp r6, r0
	blt _08045B1C
_08045BCC:
	ldr r0, _08045C08  @ gUnknown_0203DD90
	movs r1, #0
	strb r1, [r0]
	ldr r2, _08045C0C  @ gUnknown_085A92E0
	ldr r0, [r2]
	strb r1, [r0, #6]
	ldr r3, [r2]
	ldr r1, _08045C10  @ gUnknown_0203DA24
	ldrb r0, [r1, #5]
	add r0, sp
	ldrb r0, [r0]
	strb r0, [r3, #9]
	ldr r2, [r2]
	ldrb r0, [r1, #5]
	adds r0, #2
	strb r0, [r2, #7]
	ldrb r0, [r1, #5]
	adds r0, #2
	adds r1, #0xa0
	strb r0, [r1]
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08045C04: .4byte gUnknown_0203DB10
_08045C08: .4byte gUnknown_0203DD90
_08045C0C: .4byte gUnknown_085A92E0
_08045C10: .4byte gUnknown_0203DA24

	THUMB_FUNC_END sub_8045AF4

	THUMB_FUNC_START New6C_SIOMAIN2
New6C_SIOMAIN2: @ 0x08045C14
	push {lr}
	ldr r0, _08045C24  @ gUnknown_085AA6BC
	movs r1, #2
	bl Proc_Start
	pop {r0}
	bx r0
	.align 2, 0
_08045C24: .4byte gUnknown_085AA6BC

	THUMB_FUNC_END New6C_SIOMAIN2

	THUMB_FUNC_START sub_8045C28
sub_8045C28: @ 0x08045C28
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, _08045C60  @ gUnknown_085AA6BC
	bl Proc_Find
	cmp r0, #0
	bne _08045C5A
	ldr r5, _08045C64  @ gUnknown_0203DA24
	ldrb r0, [r5, #0xb]
	cmp r0, #1
	bne _08045C46
	adds r0, r4, #0
	movs r1, #1
	bl Proc_Goto
_08045C46:
	ldrb r0, [r5, #0xb]
	cmp r0, #2
	bne _08045C54
	adds r0, r4, #0
	movs r1, #4
	bl Proc_Goto
_08045C54:
	adds r0, r4, #0
	bl Proc_Break
_08045C5A:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08045C60: .4byte gUnknown_085AA6BC
_08045C64: .4byte gUnknown_0203DA24

	THUMB_FUNC_END sub_8045C28

	THUMB_FUNC_START sub_8045C68
sub_8045C68: @ 0x08045C68
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	mov r8, r0
	adds r4, r1, #0
	adds r5, r2, #0
	adds r6, r3, #0
	bl sub_8006978
	bl sub_8008250
	bl sub_8003D20
	adds r0, r4, #0
	adds r1, r5, #0
	mov r2, r8
	adds r3, r6, #0
	bl sub_800698C
	movs r0, #1
	bl sub_8006B10
	movs r0, #1
	bl sub_8006AA8
	movs r0, #2
	bl sub_8006AA8
	movs r0, #4
	bl sub_8006AA8
	movs r0, #2
	bl sub_8006AF0
	movs r0, #1
	bl sub_8007838
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8045C68

	THUMB_FUNC_START sub_8045CBC
sub_8045CBC: @ 0x08045CBC
	push {lr}
	ldr r0, _08045CD4  @ gUnknown_085A9354
	bl Proc_EndEach
	ldr r0, _08045CD8  @ gUnknown_085A937C
	bl Proc_EndEach
	ldr r0, _08045CDC  @ gUnknown_085A932C
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
_08045CD4: .4byte gUnknown_085A9354
_08045CD8: .4byte gUnknown_085A937C
_08045CDC: .4byte gUnknown_085A932C

	THUMB_FUNC_END sub_8045CBC

	THUMB_FUNC_START sub_8045CE0
sub_8045CE0: @ 0x08045CE0
	push {lr}
	bl sub_804197C
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8045CE0

	THUMB_FUNC_START sub_8045CEC
sub_8045CEC: @ 0x08045CEC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	movs r6, #0
	ldr r0, _08045D68  @ gUnknown_0203DA24
	mov r9, r0
	movs r0, #0x98
	lsls r0, r0, #2
	mov r8, r0
	movs r0, #0xa1
	add r0, r9
	mov sl, r0
	movs r7, #5
_08045D0C:
	mov r0, r9
	adds r0, #0x9c
	adds r5, r6, r0
	ldr r0, _08045D6C  @ gUnknown_085A92E0
	ldr r0, [r0]
	adds r0, #0xb
	adds r0, r0, r6
	ldrb r1, [r0]
	ldrb r0, [r5]
	cmp r0, r1
	beq _08045D9C
	strb r1, [r5]
	lsls r0, r6, #3
	mov r1, r9
	adds r1, #0xc
	adds r4, r0, r1
	adds r0, r4, #0
	bl Text_Clear
	adds r0, r4, #0
	movs r1, #0
	bl Text_SetColorId
	ldrb r0, [r5]
	cmp r0, #4
	bhi _08045D78
	ldr r1, _08045D70  @ gUnknown_080D9D34
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	bl GetStringFromIndex
	adds r3, r0, #0
	movs r0, #0xa
	str r0, [sp]
	adds r0, r4, #0
	movs r1, #0xb
	adds r2, r7, #0
	bl sub_8014C54
	ldr r0, _08045D74  @ gUnknown_085ADDA8
	mov r1, r8
	movs r2, #0x20
	bl CopyToPaletteBuffer
	b _08045D96
	.align 2, 0
_08045D68: .4byte gUnknown_0203DA24
_08045D6C: .4byte gUnknown_085A92E0
_08045D70: .4byte gUnknown_080D9D34
_08045D74: .4byte gUnknown_085ADDA8
_08045D78:
	movs r0, #0xa
	str r0, [sp]
	adds r0, r4, #0
	movs r1, #0xb
	adds r2, r7, #0
	mov r3, sl
	bl sub_8014C54
	lsls r0, r6, #5
	ldr r1, _08045DBC  @ gUnknown_085ADC48
	adds r0, r0, r1
	mov r1, r8
	movs r2, #0x20
	bl CopyToPaletteBuffer
_08045D96:
	movs r0, #1
	bl BG_EnableSyncByMask
_08045D9C:
	movs r0, #0x20
	add r8, r0
	movs r0, #0xf
	add sl, r0
	adds r7, #3
	adds r6, #1
	cmp r6, #3
	ble _08045D0C
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08045DBC: .4byte gUnknown_085ADC48

	THUMB_FUNC_END sub_8045CEC

	THUMB_FUNC_START sub_8045DC0
sub_8045DC0: @ 0x08045DC0
	push {r4, r5, r6, lr}
	sub sp, #0x14
	adds r6, r0, #0
	bl sub_8043044
	bl sub_804C33C
	movs r0, #0
	str r0, [sp]
	adds r0, r6, #0
	movs r1, #0
	movs r2, #0x12
	movs r3, #2
	bl sub_8086CE8
	ldr r0, _08045ECC  @ gUnknown_085ABD68
	ldr r1, _08045ED0  @ 0x06014800
	bl CopyDataWithPossibleUncomp
	ldr r0, _08045ED4  @ gUnknown_085ADA38
	ldr r1, _08045ED8  @ 0x06016000
	bl CopyDataWithPossibleUncomp
	ldr r0, _08045EDC  @ gUnknown_085AC604
	ldr r1, _08045EE0  @ 0x06016800
	bl CopyDataWithPossibleUncomp
	movs r4, #0x98
	lsls r4, r4, #2
	movs r5, #3
_08045DFC:
	ldr r0, _08045EE4  @ gUnknown_085ADDA8
	adds r1, r4, #0
	movs r2, #0x20
	bl CopyToPaletteBuffer
	adds r4, #0x20
	subs r5, #1
	cmp r5, #0
	bge _08045DFC
	ldr r4, _08045EE8  @ gUnknown_0203DA24
	ldrb r0, [r4, #3]
	add r1, sp, #4
	bl sub_80A66F4
	ldr r0, _08045EEC  @ gUnknown_0203DB64
	bl SetFont
	bl Font_LoadForUI
	bl sub_8003D20
	bl sub_8043164
	movs r5, #0
	adds r4, #0x9c
	movs r2, #0xff
_08045E30:
	adds r1, r5, r4
	ldrb r0, [r1]
	orrs r0, r2
	strb r0, [r1]
	adds r5, #1
	cmp r5, #3
	ble _08045E30
	bl sub_8045CEC
	movs r5, #0
	ldr r2, _08045EF0  @ gUnknown_03004E86
_08045E46:
	adds r0, r5, r2
	mov r1, sp
	adds r1, r1, r5
	adds r1, #4
	ldrb r1, [r1]
	strb r1, [r0]
	adds r5, #1
	cmp r5, #0xe
	ble _08045E46
	movs r0, #0
	str r0, [r6, #0x34]
	str r0, [r6, #0x30]
	movs r0, #0xc0
	movs r1, #0x10
	adds r2, r6, #0
	bl sub_804C2EC
	movs r0, #0x50
	movs r1, #0x20
	adds r2, r6, #0
	bl sub_804D664
	str r0, [r6, #0x2c]
	ldr r0, _08045EF4  @ gUnknown_085A9864
	bl SetupFaceGfxData
	movs r0, #2
	str r0, [sp]
	movs r0, #3
	movs r1, #0x64
	movs r2, #0xd0
	movs r3, #0x50
	bl NewFace
	ldr r0, [r6, #0x2c]
	ldr r2, _08045EF8  @ gUnknown_080D9D5E
	ldr r1, _08045EE8  @ gUnknown_0203DA24
	ldrb r1, [r1]
	adds r1, r1, r2
	ldrb r1, [r1]
	movs r2, #0
	bl sub_804C49C
	bl sub_804C508
	ldr r0, [r6, #0x30]
	movs r1, #0xe9
	lsls r1, r1, #3
	adds r0, r0, r1
	movs r1, #1
	bl sub_8043100
	ldr r2, _08045EFC  @ gLCDControlBuffer
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
	add sp, #0x14
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08045ECC: .4byte gUnknown_085ABD68
_08045ED0: .4byte 0x06014800
_08045ED4: .4byte gUnknown_085ADA38
_08045ED8: .4byte 0x06016000
_08045EDC: .4byte gUnknown_085AC604
_08045EE0: .4byte 0x06016800
_08045EE4: .4byte gUnknown_085ADDA8
_08045EE8: .4byte gUnknown_0203DA24
_08045EEC: .4byte gUnknown_0203DB64
_08045EF0: .4byte gUnknown_03004E86
_08045EF4: .4byte gUnknown_085A9864
_08045EF8: .4byte gUnknown_080D9D5E
_08045EFC: .4byte gLCDControlBuffer

	THUMB_FUNC_END sub_8045DC0

	THUMB_FUNC_START sub_8045F00
sub_8045F00: @ 0x08045F00
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r1, _08045F38  @ 0x00002586
	mov r0, sp
	strh r1, [r0]
	ldr r0, _08045F3C  @ gUnknown_085A9354
	movs r1, #0
	bl Proc_Start
	ldr r0, _08045F40  @ gUnknown_085A937C
	adds r1, r4, #0
	bl Proc_Start
	ldr r0, _08045F44  @ gUnknown_085A932C
	adds r1, r4, #0
	bl Proc_Start
	movs r1, #1
	negs r1, r1
	mov r0, sp
	bl sub_8042568
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08045F38: .4byte 0x00002586
_08045F3C: .4byte gUnknown_085A9354
_08045F40: .4byte gUnknown_085A937C
_08045F44: .4byte gUnknown_085A932C

	THUMB_FUNC_END sub_8045F00

	THUMB_FUNC_START sub_8045F48
sub_8045F48: @ 0x08045F48
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r4, r0, #0
	movs r6, #0
	movs r1, #0
	ldr r5, [r4, #0x2c]
	ldr r0, _08045F88  @ gUnknown_0203DD28
	str r1, [r0]
	mov r0, sp
	strb r1, [r0]
	bl sub_8045CEC
	ldr r0, _08045F8C  @ gUnknown_085A932C
	bl Proc_Find
	cmp r0, #0
	beq _08045F94
	ldr r0, _08045F90  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _08045F7A
	b _0804618A
_08045F7A:
	movs r0, #1
	bl sub_804320C
	bl sub_804C31C
	b _08045FEE
	.align 2, 0
_08045F88: .4byte gUnknown_0203DD28
_08045F8C: .4byte gUnknown_085A932C
_08045F90: .4byte gKeyStatusPtr
_08045F94:
	ldr r0, _08046000  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08045FBC
	movs r0, #1
	bl sub_804320C
	bl sub_804C31C
	bl sub_8045CBC
	bl sub_8045CE0
	adds r0, r4, #0
	movs r1, #2
	bl Proc_Goto
_08045FBC:
	ldr r0, _08046004  @ gUnknown_085A92E0
	ldr r2, [r0]
	movs r1, #6
	ldrsb r1, [r2, r1]
	str r1, [r5, #0x34]
	movs r1, #0
	adds r7, r0, #0
	adds r2, #0x1a
_08045FCC:
	adds r0, r2, r1
	ldrb r0, [r0]
	cmp r0, #0x3c
	bls _08045FD6
	adds r6, #1
_08045FD6:
	adds r1, #1
	cmp r1, #3
	ble _08045FCC
	adds r5, r7, #0
	ldr r0, [r5]
	movs r1, #6
	ldrsb r1, [r0, r1]
	adds r0, #0xb
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #2
	bne _08046008
_08045FEE:
	bl sub_8045CBC
	bl sub_8045CE0
	adds r0, r4, #0
	movs r1, #2
	bl Proc_Goto
	b _0804618A
	.align 2, 0
_08046000: .4byte gKeyStatusPtr
_08046004: .4byte gUnknown_085A92E0
_08046008:
	bl sub_80421E4
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0804601E
	ldr r1, [r5]
	ldrb r0, [r1, #0x1e]
	cmp r0, #0x3c
	bhi _0804601E
	cmp r6, #0
	beq _08046046
_0804601E:
	bl sub_8045CBC
	bl sub_8045CE0
	adds r0, r4, #0
	bl sub_8045F00
	movs r0, #0
	str r0, [r4, #0x30]
	movs r0, #0xe9
	lsls r0, r0, #3
	movs r1, #1
	bl sub_8043100
	movs r0, #0xc0
	movs r1, #0x10
	adds r2, r4, #0
	bl sub_804C2EC
	b _0804618A
_08046046:
	movs r0, #6
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bne _080460DC
	bl sub_804226C
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _080460DC
	ldr r0, [r4, #0x30]
	cmp r0, #2
	beq _0804606C
	movs r0, #2
	str r0, [r4, #0x30]
	ldr r0, _080460CC  @ 0x0000074A
	movs r1, #1
	bl sub_8043100
_0804606C:
	ldr r0, _080460D0  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _080460EE
	bl sub_804C31C
	ldr r0, [r7]
	movs r2, #0
	movs r1, #6
	strh r1, [r0, #4]
	strb r2, [r0, #0x1e]
	movs r1, #0
	adds r3, r7, #0
	movs r2, #0
_0804608E:
	ldr r0, [r3]
	adds r0, #0x1a
	adds r0, r0, r1
	strb r2, [r0]
	adds r1, #1
	cmp r1, #3
	ble _0804608E
	movs r0, #2
	bl sub_804320C
	bl sub_804213C
	ldr r2, _080460D4  @ gUnknown_085A92E0
	ldr r1, [r2]
	strb r0, [r1, #7]
	ldr r0, _080460D8  @ gUnknown_0203DA24
	ldr r1, [r2]
	ldrb r1, [r1, #7]
	adds r0, #0xa0
	strb r1, [r0]
	bl sub_8042AF4
	mov r1, sp
	movs r0, #0x18
	strb r0, [r1]
	mov r0, sp
	movs r1, #4
	bl sub_80426F4
	str r0, [r4, #0x34]
	b _08046150
	.align 2, 0
_080460CC: .4byte 0x0000074A
_080460D0: .4byte gKeyStatusPtr
_080460D4: .4byte gUnknown_085A92E0
_080460D8: .4byte gUnknown_0203DA24
_080460DC:
	ldr r0, [r4, #0x30]
	cmp r0, #1
	beq _080460EE
	movs r0, #1
	str r0, [r4, #0x30]
	ldr r0, _08046158  @ 0x00000749
	movs r1, #1
	bl sub_8043100
_080460EE:
	ldr r5, _0804615C  @ gUnknown_085A92E0
	ldr r1, [r5]
	movs r0, #6
	ldrsb r0, [r1, r0]
	cmp r0, #0
	beq _08046164
	ldrb r0, [r1, #6]
	bl sub_8042194
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08046164
	add r1, sp, #4
	mov r0, sp
	movs r2, #0
	bl sub_804279C
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _08046164
	bl sub_804C31C
	ldr r0, [r5]
	movs r2, #0
	movs r1, #6
	strh r1, [r0, #4]
	strb r2, [r0, #0x1e]
	movs r1, #0
	adds r3, r5, #0
	movs r2, #0
_0804612A:
	ldr r0, [r3]
	adds r0, #0x1a
	adds r0, r0, r1
	strb r2, [r0]
	adds r1, #1
	cmp r1, #3
	ble _0804612A
	bl sub_804213C
	ldr r2, _0804615C  @ gUnknown_085A92E0
	ldr r1, [r2]
	strb r0, [r1, #7]
	ldr r0, _08046160  @ gUnknown_0203DA24
	ldr r1, [r2]
	ldrb r1, [r1, #7]
	adds r0, #0xa0
	strb r1, [r0]
	bl sub_8042AF4
_08046150:
	adds r0, r4, #0
	bl Proc_Break
	b _0804618A
	.align 2, 0
_08046158: .4byte 0x00000749
_0804615C: .4byte gUnknown_085A92E0
_08046160: .4byte gUnknown_0203DA24
_08046164:
	bl GetGameClock
	movs r1, #0x26
	bl __umodsi3
	cmp r0, #0
	bne _0804618A
	ldr r0, _08046194  @ gUnknown_03004E80
	movs r1, #0x8c
	strb r1, [r0]
	ldr r1, _08046198  @ gUnknown_085A92E0
	ldr r2, [r1]
	ldrb r1, [r2, #6]
	strb r1, [r0, #1]
	ldrb r1, [r2]
	strh r1, [r0, #2]
	movs r1, #0x16
	bl sub_80422B8
_0804618A:
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08046194: .4byte gUnknown_03004E80
_08046198: .4byte gUnknown_085A92E0

	THUMB_FUNC_END sub_8045F48

	THUMB_FUNC_START sub_804619C
sub_804619C: @ 0x0804619C
	push {r4, lr}
	adds r4, r0, #0
	bl sub_8045CEC
	ldr r1, _080461F4  @ gUnknown_0203DD28
	ldr r0, [r1]
	adds r3, r0, #1
	str r3, [r1]
	ldr r0, _080461F8  @ gUnknown_0203DA24
	adds r0, #0xa0
	ldr r1, _080461FC  @ gUnknown_085A92E0
	ldr r2, [r1]
	ldrb r0, [r0]
	ldrb r1, [r2, #7]
	cmp r0, r1
	bne _080461C4
	movs r0, #0x96
	lsls r0, r0, #2
	cmp r3, r0
	ble _08046200
_080461C4:
	bl sub_8045CBC
	bl sub_8045CE0
	adds r0, r4, #0
	bl sub_8045F00
	movs r0, #0
	str r0, [r4, #0x30]
	movs r0, #0xe9
	lsls r0, r0, #3
	movs r1, #1
	bl sub_8043100
	movs r0, #0xc0
	movs r1, #0x10
	adds r2, r4, #0
	bl sub_804C2EC
	adds r0, r4, #0
	movs r1, #3
	bl Proc_Goto
	b _08046220
	.align 2, 0
_080461F4: .4byte gUnknown_0203DD28
_080461F8: .4byte gUnknown_0203DA24
_080461FC: .4byte gUnknown_085A92E0
_08046200:
	movs r0, #6
	ldrsb r0, [r2, r0]
	cmp r0, #0
	bne _08046228
	ldr r1, [r4, #0x34]
	movs r0, #0x8c
	muls r0, r1, r0
	adds r0, r2, r0
	movs r1, #0x9a
	lsls r1, r1, #1
	adds r0, r0, r1
	ldrb r0, [r0]
	ldrb r1, [r2, #9]
	ands r0, r1
	cmp r0, r1
	bne _0804622E
_08046220:
	adds r0, r4, #0
	bl Proc_Break
	b _0804622E
_08046228:
	adds r0, r4, #0
	bl Proc_Break
_0804622E:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_804619C

	THUMB_FUNC_START sub_8046234
sub_8046234: @ 0x08046234
	push {r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r7, r0, #0
	ldr r0, _080462C8  @ 0x00000749
	movs r1, #1
	bl sub_8043100
	ldr r0, _080462CC  @ gUnknown_085A92E0
	ldr r0, [r0]
	ldrb r0, [r0, #6]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _080462B4
	bl GetGameClock
	ldr r4, _080462D0  @ gUnknown_0203DA24
	adds r5, r4, #0
	adds r5, #0xa0
	ldrb r1, [r5]
	bl __umodsi3
	adds r6, r7, #0
	adds r6, #0x3b
	strb r0, [r6]
	bl AdvanceGetLCGRNValue
	ldrb r2, [r5]
	movs r1, #3
	ands r1, r0
	adds r1, #4
	adds r3, r2, #0
	muls r3, r1, r3
	ldrb r0, [r6]
	adds r3, r3, r0
	adds r0, r7, #0
	adds r0, #0x39
	strb r3, [r0]
	mov r2, sp
	adds r4, #0xec
	ldrb r1, [r4]
	lsls r0, r1, #0x1f
	lsrs r0, r0, #0x1f
	strb r0, [r2]
	lsls r0, r1, #0x1d
	lsrs r0, r0, #0x1f
	strb r0, [r2, #1]
	mov r0, sp
	lsls r1, r1, #0x1e
	lsrs r1, r1, #0x1f
	strb r1, [r0, #2]
	mov r1, sp
	ldrb r0, [r6]
	strb r0, [r1, #3]
	mov r0, sp
	strb r3, [r0, #4]
	adds r0, #6
	bl StoreRNState
	mov r0, sp
	movs r1, #0x10
	bl sub_80426F4
	str r0, [r7, #0x34]
_080462B4:
	adds r0, r7, #0
	adds r0, #0x3a
	movs r1, #0
	strb r1, [r0]
	subs r0, #2
	strb r1, [r0]
	add sp, #0x10
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080462C8: .4byte 0x00000749
_080462CC: .4byte gUnknown_085A92E0
_080462D0: .4byte gUnknown_0203DA24

	THUMB_FUNC_END sub_8046234

	THUMB_FUNC_START sub_80462D4
sub_80462D4: @ 0x080462D4
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	adds r5, r0, #0
	ldr r7, [r5, #0x2c]
	ldr r0, _08046310  @ gUnknown_085A92E0
	ldr r2, [r0]
	movs r4, #6
	ldrsb r4, [r2, r4]
	cmp r4, #0
	bne _08046318
	ldr r1, [r5, #0x34]
	movs r0, #0x8c
	muls r0, r1, r0
	adds r0, r2, r0
	movs r1, #0x9a
	lsls r1, r1, #1
	adds r0, r0, r1
	ldrb r0, [r0]
	ldrb r2, [r2, #9]
	cmp r0, r2
	bne _08046398
	ldr r0, _08046314  @ 0x0000074E
	movs r1, #1
	bl sub_8043100
	str r4, [r7, #0x38]
	adds r0, r5, #0
	bl Proc_Break
	b _08046398
	.align 2, 0
_08046310: .4byte gUnknown_085A92E0
_08046314: .4byte 0x0000074E
_08046318:
	bl GetGameClock
	movs r1, #0x26
	bl __umodsi3
	adds r6, r0, #0
	cmp r6, #0
	bne _08046398
	add r1, sp, #0x10
	mov r0, sp
	movs r2, #0
	bl sub_804279C
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _08046398
	ldr r4, _080463A0  @ gUnknown_0203DA24
	mov r0, sp
	adds r4, #0xec
	movs r3, #1
	ldrb r1, [r0]
	ands r1, r3
	ldrb r2, [r4]
	movs r0, #2
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	mov r1, sp
	ldrb r1, [r1, #1]
	ands r1, r3
	lsls r1, r1, #2
	movs r2, #5
	negs r2, r2
	ands r0, r2
	orrs r0, r1
	mov r1, sp
	ldrb r1, [r1, #2]
	ands r1, r3
	lsls r1, r1, #1
	adds r2, #2
	ands r0, r2
	orrs r0, r1
	strb r0, [r4]
	mov r0, sp
	ldrb r0, [r0, #3]
	adds r1, r5, #0
	adds r1, #0x3b
	strb r0, [r1]
	mov r0, sp
	ldrb r0, [r0, #4]
	subs r1, #2
	strb r0, [r1]
	mov r0, sp
	adds r0, #6
	bl LoadRNState
	ldr r0, _080463A4  @ 0x0000074E
	movs r1, #1
	bl sub_8043100
	str r6, [r7, #0x38]
	adds r0, r5, #0
	bl Proc_Break
_08046398:
	add sp, #0x14
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080463A0: .4byte gUnknown_0203DA24
_080463A4: .4byte 0x0000074E

	THUMB_FUNC_END sub_80462D4

	THUMB_FUNC_START sub_80463A8
sub_80463A8: @ 0x080463A8
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	ldr r7, [r6, #0x2c]
	adds r1, r6, #0
	adds r1, #0x38
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x10
	bls _0804644C
	movs r0, #0
	strb r0, [r1]
	adds r4, r6, #0
	adds r4, #0x3a
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	ldr r1, _08046428  @ gUnknown_0203DA24
	adds r1, #0xa0
	ldrb r0, [r4]
	ldrb r1, [r1]
	bl __umodsi3
	strb r0, [r4]
	adds r5, r6, #0
	adds r5, #0x39
	ldrb r0, [r5]
	subs r0, #1
	strb r0, [r5]
	ldrb r0, [r4]
	str r0, [r7, #0x38]
	ldr r0, _0804642C  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080463FC
	movs r0, #0x7d
	bl m4aSongNumStart
_080463FC:
	ldrb r0, [r5]
	cmp r0, #0
	bne _0804644C
	adds r1, r6, #0
	adds r1, #0x3b
	ldrb r2, [r1]
	ldr r0, _08046430  @ gUnknown_085A92E0
	ldr r0, [r0]
	ldrb r0, [r0, #6]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r4, r1, #0
	cmp r2, r0
	beq _08046434
	movs r1, #0xea
	lsls r1, r1, #3
	adds r0, r2, r1
	movs r1, #1
	bl sub_8043100
	b _0804643C
	.align 2, 0
_08046428: .4byte gUnknown_0203DA24
_0804642C: .4byte gRAMChapterData
_08046430: .4byte gUnknown_085A92E0
_08046434:
	ldr r0, _08046454  @ 0x0000074F
	movs r1, #1
	bl sub_8043100
_0804643C:
	ldrb r0, [r4]
	str r0, [r7, #0x38]
	ldr r1, _08046458  @ gUnknown_0203DD90
	ldrb r0, [r4]
	strb r0, [r1]
	adds r0, r6, #0
	bl Proc_Break
_0804644C:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08046454: .4byte 0x0000074F
_08046458: .4byte gUnknown_0203DD90

	THUMB_FUNC_END sub_80463A8

	THUMB_FUNC_START sub_804645C
sub_804645C: @ 0x0804645C
	push {lr}
	ldr r0, _08046474  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08046470
	movs r0, #0x7e
	bl m4aSongNumStart
_08046470:
	pop {r0}
	bx r0
	.align 2, 0
_08046474: .4byte gRAMChapterData

	THUMB_FUNC_END sub_804645C

	THUMB_FUNC_START sub_8046478
sub_8046478: @ 0x08046478
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r4, #0
	strb r4, [r5, #9]
	movs r1, #0
	bl SetUnitStatus
	strb r4, [r5, #0x1b]
	ldr r0, _080464A0  @ gUnknown_0203DA24
	adds r0, #0xec
	ldrb r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	bne _080464A4
	adds r0, r5, #0
	bl sub_80431B4
	b _080464AA
	.align 2, 0
_080464A0: .4byte gUnknown_0203DA24
_080464A4:
	adds r0, r5, #0
	bl sub_804D40C
_080464AA:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8046478

	THUMB_FUNC_START sub_80464B0
sub_80464B0: @ 0x080464B0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	mov r9, r0
	ldr r0, _0804656C  @ gUnknown_085A92E0
	ldr r0, [r0]
	ldrb r0, [r0, #6]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #6
	adds r0, #1
	mov r8, r0
	ldr r1, _08046570  @ gUnknown_0203DD28
	movs r0, #0
	str r0, [r1]
	bl ClearUnits
	ldr r0, _08046574  @ gUnknown_0203DA24
	ldrb r0, [r0, #3]
	ldr r4, _08046578  @ gUnknown_085A9884
	ldr r1, [r4]
	bl sub_80A66C0
	movs r6, #0
	ldr r0, _0804657C  @ gUnknown_0203DDB4
	mov sl, r0
	movs r7, #0x10
_080464EA:
	mov r1, r8
	adds r4, r1, r6
	adds r0, r4, #0
	bl GetUnit
	adds r5, r0, #0
	bl ClearUnit
	ldr r1, _08046578  @ gUnknown_085A9884
	ldr r0, [r1]
	adds r0, r0, r7
	adds r1, r5, #0
	bl LoadSavedUnit
	adds r0, r5, #0
	bl sub_8046478
	strb r4, [r5, #0xb]
	cmp r6, #0
	bne _08046528
	adds r0, r5, #0
	bl GetUnitMiniPortraitId
	ldr r1, _0804656C  @ gUnknown_085A92E0
	ldr r1, [r1]
	ldrb r1, [r1, #6]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	lsls r1, r1, #1
	add r1, sl
	strh r0, [r1]
_08046528:
	adds r7, #0x24
	adds r6, #1
	cmp r6, #4
	ble _080464EA
	ldr r2, _0804656C  @ gUnknown_085A92E0
	mov r3, r9
	adds r3, #0x64
	mov r4, r9
	adds r4, #0x4c
	ldr r0, _08046574  @ gUnknown_0203DA24
	movs r1, #0
	movs r6, #3
	adds r0, #0x9f
_08046542:
	strb r1, [r0]
	subs r0, #1
	subs r6, #1
	cmp r6, #0
	bge _08046542
	ldr r2, [r2]
	movs r1, #6
	ldrsb r1, [r2, r1]
	movs r0, #1
	lsls r0, r1
	movs r1, #0
	strb r0, [r2, #0xa]
	strh r1, [r3]
	strh r1, [r4]
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804656C: .4byte gUnknown_085A92E0
_08046570: .4byte gUnknown_0203DD28
_08046574: .4byte gUnknown_0203DA24
_08046578: .4byte gUnknown_085A9884
_0804657C: .4byte gUnknown_0203DDB4

	THUMB_FUNC_END sub_80464B0

	THUMB_FUNC_START sub_8046580
sub_8046580: @ 0x08046580
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x28
	mov r8, r0
	movs r0, #0
	mov sl, r0
	mov r0, r8
	adds r0, #0x4c
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _080465B0
	ldr r0, _080466EC  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080465B0
	movs r0, #0x7c
	bl m4aSongNumStart
_080465B0:
	mov r1, r8
	adds r1, #0x4c
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x17
	ble _080465C6
	movs r0, #0
	strh r0, [r1]
_080465C6:
	mov r4, r8
	adds r4, #0x64
	movs r1, #0
	ldrsh r0, [r4, r1]
	cmp r0, #4
	bgt _08046606
	ldr r2, _080466F0  @ gUnknown_085A9884
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, #0x10
	ldr r0, [r2]
	adds r0, r0, r1
	movs r1, #0x28
	bl sub_80426F4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r1, r8
	str r0, [r1, #0x58]
	ldrh r2, [r4]
	adds r2, #1
	strh r2, [r4]
	ldr r1, _080466F4  @ gUnknown_0203DA24
	ldr r0, _080466F8  @ gUnknown_085A92E0
	ldr r0, [r0]
	ldrb r0, [r0, #6]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r1, #0x9c
	adds r0, r0, r1
	strb r2, [r0]
_08046606:
	bl GetGameClock
	movs r1, #0x26
	bl __umodsi3
	cmp r0, #0
	bne _080466DA
	add r6, sp, #0x24
	mov r0, sp
	adds r1, r6, #0
	movs r2, #0
	bl sub_804279C
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _08046696
	ldrb r0, [r6]
	lsls r4, r0, #6
	adds r4, #1
	ldr r1, _080466F4  @ gUnknown_0203DA24
	mov r9, r1
	mov r7, r9
	adds r7, #0x9c
	adds r0, r0, r7
	ldrb r0, [r0]
	adds r0, r4, r0
	bl GetUnit
	adds r5, r0, #0
	bl ClearUnit
	mov r0, sp
	adds r1, r5, #0
	bl LoadSavedUnit
	adds r0, r5, #0
	bl sub_8046478
	ldrb r0, [r6]
	adds r0, r0, r7
	ldrb r0, [r0]
	adds r0, r0, r4
	strb r0, [r5, #0xb]
	ldrb r0, [r6]
	adds r0, r0, r7
	ldrb r0, [r0]
	cmp r0, #0
	bne _08046678
	adds r0, r5, #0
	bl GetUnitMiniPortraitId
	ldr r2, _080466FC  @ gUnknown_0203DD90
	ldrb r1, [r6]
	lsls r1, r1, #1
	adds r2, #0x24
	adds r1, r1, r2
	strh r0, [r1]
_08046678:
	mov r0, r9
	adds r0, #0xec
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _0804668C
	movs r0, #0x80
	lsls r0, r0, #2
	str r0, [r5, #0xc]
_0804668C:
	ldrb r1, [r6]
	adds r1, r1, r7
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
_08046696:
	movs r4, #0
	ldr r5, _08046700  @ gUnknown_0203DAC0
_0804669A:
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	bl sub_8042194
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080466BA
	adds r0, r4, r5
	ldrb r0, [r0]
	cmp r0, #4
	bhi _080466BA
	mov r0, sl
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sl, r0
_080466BA:
	adds r4, #1
	cmp r4, #3
	ble _0804669A
	mov r0, sl
	cmp r0, #0
	bne _080466DA
	ldr r0, _080466F8  @ gUnknown_085A92E0
	ldr r2, [r0]
	movs r1, #6
	ldrsb r1, [r2, r1]
	movs r0, #1
	lsls r0, r1
	strb r0, [r2, #0xa]
	mov r0, r8
	bl Proc_Break
_080466DA:
	add sp, #0x28
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080466EC: .4byte gRAMChapterData
_080466F0: .4byte gUnknown_085A9884
_080466F4: .4byte gUnknown_0203DA24
_080466F8: .4byte gUnknown_085A92E0
_080466FC: .4byte gUnknown_0203DD90
_08046700: .4byte gUnknown_0203DAC0

	THUMB_FUNC_END sub_8046580

	THUMB_FUNC_START sub_8046704
sub_8046704: @ 0x08046704
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r0, #0x4c
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _08046724
	ldr r0, _08046798  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08046724
	movs r0, #0x7c
	bl m4aSongNumStart
_08046724:
	adds r1, r5, #0
	adds r1, #0x4c
	ldrh r0, [r1]
	adds r0, #1
	movs r6, #0
	strh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x17
	ble _0804673A
	strh r6, [r1]
_0804673A:
	ldr r0, _0804679C  @ gUnknown_0203DD28
	ldr r1, [r0]
	adds r1, #1
	str r1, [r0]
	movs r0, #0x96
	lsls r0, r0, #2
	cmp r1, r0
	ble _0804674E
	bl sub_808DC74
_0804674E:
	ldr r0, _080467A0  @ gUnknown_03004F0C
	movs r1, #0x89
	strb r1, [r0]
	ldr r4, _080467A4  @ gUnknown_085A92E0
	ldr r1, [r4]
	ldrb r1, [r1, #6]
	strb r1, [r0, #1]
	strh r6, [r0, #2]
	movs r1, #4
	bl sub_80422B8
	ldr r4, [r4]
	ldr r1, [r5, #0x58]
	movs r0, #0x8c
	muls r0, r1, r0
	adds r0, r4, r0
	movs r1, #0x9a
	lsls r1, r1, #1
	adds r0, r0, r1
	ldrb r1, [r4, #9]
	ldrb r2, [r0]
	cmp r2, r1
	bne _08046790
	ldrb r0, [r4, #0xa]
	ands r0, r1
	cmp r0, r2
	bne _08046790
	ldr r0, _080467A8  @ gUnknown_085A93A0
	bl Proc_EndEach
	adds r0, r5, #0
	bl Proc_Break
_08046790:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08046798: .4byte gRAMChapterData
_0804679C: .4byte gUnknown_0203DD28
_080467A0: .4byte gUnknown_03004F0C
_080467A4: .4byte gUnknown_085A92E0
_080467A8: .4byte gUnknown_085A93A0

	THUMB_FUNC_END sub_8046704

	THUMB_FUNC_START sub_80467AC
sub_80467AC: @ 0x080467AC
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	bl sub_8043044
	bl sub_804C33C
	movs r0, #0
	str r0, [sp]
	adds r0, r6, #0
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl sub_8086CE8
	bl sub_804D6B4
	movs r0, #3
	bl DeleteFaceByIndex
	ldr r4, _08046828  @ gUnknown_0203DA78
	adds r0, r4, #0
	bl Text_Clear
	adds r0, r4, #0
	movs r1, #0
	bl Text_SetColorId
	ldr r5, _0804682C  @ 0x0000077D
	adds r0, r5, #0
	bl GetStringFromIndex
	adds r1, r0, #0
	movs r0, #0x60
	bl GetStringTextCenteredPos
	adds r1, r0, #0
	adds r0, r4, #0
	bl Text_SetXCursor
	adds r0, r5, #0
	bl GetStringFromIndex
	adds r1, r0, #0
	adds r0, r4, #0
	bl Text_AppendString
	ldr r1, _08046830  @ gUnknown_02023FBA
	adds r0, r4, #0
	bl Text_Draw
	ldr r0, _08046834  @ gUnknown_085A93A0
	adds r1, r6, #0
	bl Proc_Start
	movs r0, #0xf
	bl BG_EnableSyncByMask
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08046828: .4byte gUnknown_0203DA78
_0804682C: .4byte 0x0000077D
_08046830: .4byte gUnknown_02023FBA
_08046834: .4byte gUnknown_085A93A0

	THUMB_FUNC_END sub_80467AC

	THUMB_FUNC_START sub_8046838
sub_8046838: @ 0x08046838
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	sub sp, #8
	mov r9, r0
	bl sub_8043044
	bl sub_804C33C
	movs r0, #0
	str r0, [sp]
	mov r0, r9
	movs r1, #0
	movs r2, #0x12
	movs r3, #2
	bl sub_8086CE8
	ldr r4, _0804696C  @ gUnknown_085AC9DC
	movs r0, #1
	bl GetBackgroundTileDataOffset
	adds r1, r0, #0
	ldr r0, _08046970  @ 0x06000F00
	adds r1, r1, r0
	adds r0, r4, #0
	bl CopyDataWithPossibleUncomp
	ldr r0, _08046974  @ gUnknown_085ADCC8
	movs r1, #0xc0
	movs r2, #0x20
	bl CopyToPaletteBuffer
	ldr r0, _08046978  @ gUnknown_085ABD68
	ldr r1, _0804697C  @ 0x06014800
	bl CopyDataWithPossibleUncomp
	ldr r0, _08046980  @ gUnknown_085ADC48
	movs r1, #0x98
	lsls r1, r1, #2
	movs r2, #0x80
	bl CopyToPaletteBuffer
	movs r0, #0
	bl sub_804C3A4
	ldr r0, _08046984  @ gUnknown_085AE778
	ldr r4, _08046988  @ gUnknown_02020188
	adds r1, r4, #0
	bl CopyDataWithPossibleUncomp
	ldr r0, _0804698C  @ gUnknown_02023DEA
	movs r2, #0x80
	lsls r2, r2, #5
	adds r1, r4, #0
	bl CallARM_FillTileRect
	ldr r0, _08046990  @ gUnknown_0203DB64
	bl SetFont
	bl sub_8003D20
	bl sub_8043164
	bl sub_804CEB0
	add r0, sp, #4
	bl sub_804766C
	movs r0, #1
	movs r1, #0xfe
	movs r2, #0
	bl BG_SetPosition
	movs r5, #0
	movs r7, #0xc0
	lsls r7, r7, #1
	ldr r6, _08046994  @ gUnknown_080D9E50
_080468D4:
	lsls r4, r5, #3
	ldr r0, _08046998  @ gUnknown_0203DA30
	mov r8, r0
	add r4, r8
	adds r0, r4, #0
	bl Text_Clear
	adds r0, r4, #0
	movs r1, #0
	bl Text_SetColorId
	ldr r0, [r6]
	bl GetStringFromIndex
	adds r1, r0, #0
	adds r0, r4, #0
	bl Text_AppendString
	ldr r1, _0804699C  @ gUnknown_02022CB4
	adds r1, r7, r1
	adds r0, r4, #0
	bl Text_Draw
	mov r0, sp
	adds r0, r0, r5
	adds r0, #4
	ldrb r1, [r0]
	adds r0, r5, #0
	bl sub_80476CC
	adds r7, #0xc0
	adds r6, #0x14
	adds r5, #1
	cmp r5, #2
	ble _080468D4
	ldr r5, _08046994  @ gUnknown_080D9E50
	ldr r0, [r5, #0x18]
	lsls r0, r0, #1
	ldr r4, _080469A0  @ gUnknown_020236E4
	adds r0, r0, r4
	movs r1, #0
	bl sub_8046E94
	ldr r0, [r5, #0x1c]
	lsls r0, r0, #1
	adds r0, r0, r4
	movs r1, #1
	bl sub_8046E94
	ldr r1, _080469A4  @ gUnknown_080D9D5E
	mov r0, r8
	subs r0, #0xc
	ldrb r0, [r0]
	adds r0, r0, r1
	ldrb r1, [r0]
	mov r0, r9
	movs r2, #0
	bl sub_804C49C
	bl sub_804C508
	ldr r0, _080469A8  @ 0x0000074B
	movs r1, #1
	bl sub_8043100
	movs r0, #0xf
	bl BG_EnableSyncByMask
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804696C: .4byte gUnknown_085AC9DC
_08046970: .4byte 0x06000F00
_08046974: .4byte gUnknown_085ADCC8
_08046978: .4byte gUnknown_085ABD68
_0804697C: .4byte 0x06014800
_08046980: .4byte gUnknown_085ADC48
_08046984: .4byte gUnknown_085AE778
_08046988: .4byte gUnknown_02020188
_0804698C: .4byte gUnknown_02023DEA
_08046990: .4byte gUnknown_0203DB64
_08046994: .4byte gUnknown_080D9E50
_08046998: .4byte gUnknown_0203DA30
_0804699C: .4byte gUnknown_02022CB4
_080469A0: .4byte gUnknown_020236E4
_080469A4: .4byte gUnknown_080D9D5E
_080469A8: .4byte 0x0000074B

	THUMB_FUNC_END sub_8046838

	THUMB_FUNC_START sub_80469AC
sub_80469AC: @ 0x080469AC
	push {lr}
	movs r0, #3
	bl sub_8042980
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80469AC

	THUMB_FUNC_START sub_80469B8
sub_80469B8: @ 0x080469B8
	push {lr}
	movs r0, #0
	bl sub_8042980
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80469B8

	THUMB_FUNC_START sub_80469C4
sub_80469C4: @ 0x080469C4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x6c
	adds r7, r0, #0
	movs r0, #0
	str r0, [sp, #0x54]
	bl sub_8043044
	bl sub_804C33C
	ldr r1, [sp, #0x54]
	str r1, [sp]
	adds r0, r7, #0
	movs r1, #0
	movs r2, #0x10
	movs r3, #4
	bl sub_8086CE8
	ldr r0, _08046AB8  @ gUnknown_085ABD68
	ldr r1, _08046ABC  @ 0x06014800
	bl CopyDataWithPossibleUncomp
	ldr r0, _08046AC0  @ gUnknown_0203DB64
	bl SetFont
	bl Font_LoadForUI
	bl sub_8003D20
	movs r0, #0xc0
	movs r1, #0x10
	adds r2, r7, #0
	bl sub_804C2EC
	ldr r4, _08046AC4  @ gUnknown_0203DD0C
	adds r0, r4, #0
	movs r1, #0x18
	bl Text_Init
	adds r4, #8
	adds r0, r4, #0
	movs r1, #0x18
	bl Text_Init
	ldr r0, _08046AC8  @ 0x0000074C
	movs r1, #0
	bl sub_8043100
	ldr r0, _08046ACC  @ 0x0000074D
	movs r1, #1
	bl sub_8043100
	movs r0, #1
	negs r0, r0
	str r0, [r7, #0x4c]
	movs r2, #2
	mov r9, r2
	mov r3, sp
	adds r3, #0x50
	str r3, [sp, #0x58]
	add r6, sp, #4
	movs r5, #8
	mov r4, sp
	adds r4, #0x52
_08046A4A:
	movs r0, #0
	strb r0, [r4]
	mov r0, r9
	bl sub_80A5218
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08046B34
	mov r0, r9
	add r1, sp, #4
	bl sub_80A522C
	add r0, sp, #4
	bl sub_8089768
	adds r2, r7, #0
	adds r2, #0x2c
	adds r1, r2, r5
	str r0, [r1]
	ldrb r1, [r6, #0x14]
	movs r0, #0x40
	ands r0, r1
	mov sl, r2
	cmp r0, #0
	beq _08046A84
	ldrb r0, [r4]
	movs r1, #4
	orrs r0, r1
	strb r0, [r4]
_08046A84:
	mov r0, sp
	adds r0, #0x46
	ldrb r0, [r0]
	lsls r0, r0, #0x1a
	cmp r0, #0
	blt _08046AD0
	ldrb r0, [r6, #0x1b]
	cmp r0, #1
	bne _08046A9E
	ldrb r0, [r4]
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r4]
_08046A9E:
	ldrb r0, [r6, #0x1b]
	cmp r0, #2
	bne _08046AAC
	ldrb r0, [r4]
	movs r1, #0x20
	orrs r0, r1
	strb r0, [r4]
_08046AAC:
	ldrb r0, [r6, #0x1b]
	cmp r0, #3
	bne _08046AE4
	ldrb r0, [r4]
	movs r1, #0x40
	b _08046AE0
	.align 2, 0
_08046AB8: .4byte gUnknown_085ABD68
_08046ABC: .4byte 0x06014800
_08046AC0: .4byte gUnknown_0203DB64
_08046AC4: .4byte gUnknown_0203DD0C
_08046AC8: .4byte 0x0000074C
_08046ACC: .4byte 0x0000074D
_08046AD0:
	ldrb r0, [r6, #0x1b]
	cmp r0, #3
	bne _08046ADC
	ldrb r0, [r4]
	movs r1, #0x40
	b _08046AE0
_08046ADC:
	ldrb r0, [r4]
	movs r1, #0x20
_08046AE0:
	orrs r0, r1
	strb r0, [r4]
_08046AE4:
	add r0, sp, #4
	bl sub_80A52BC
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08046B02
	adds r2, r7, #0
	adds r2, #0x38
	adds r1, r2, r5
	mov r3, sl
	adds r0, r3, r5
	ldr r0, [r0]
	str r0, [r1]
	mov r8, r2
	b _08046B10
_08046B02:
	adds r1, r7, #0
	adds r1, #0x38
	adds r0, r1, r5
	movs r2, #1
	negs r2, r2
	str r2, [r0]
	mov r8, r1
_08046B10:
	mov r3, r8
	adds r0, r3, r5
	ldr r0, [r0]
	movs r1, #1
	negs r1, r1
	cmp r0, r1
	beq _08046B50
	ldr r2, [sp, #0x54]
	cmp r2, #0
	bne _08046B2E
	mov r3, r9
	str r3, [r7, #0x50]
	movs r0, #1
	str r0, [sp, #0x54]
	b _08046B50
_08046B2E:
	mov r1, r9
	str r1, [r7, #0x4c]
	b _08046B50
_08046B34:
	adds r2, r7, #0
	adds r2, #0x2c
	adds r3, r2, r5
	mov r8, r3
	adds r1, r7, #0
	adds r1, #0x38
	adds r0, r1, r5
	movs r3, #1
	negs r3, r3
	str r3, [r0]
	mov r0, r8
	str r3, [r0]
	mov sl, r2
	mov r8, r1
_08046B50:
	subs r5, #4
	subs r4, #1
	movs r1, #1
	negs r1, r1
	add r9, r1
	mov r2, r9
	cmp r2, #0
	blt _08046B62
	b _08046A4A
_08046B62:
	adds r0, r1, #0
	ldr r1, [r7, #0x4c]
	cmp r1, r0
	bne _08046B72
	ldr r0, [r7, #0x50]
	str r0, [r7, #0x4c]
	str r0, [r7, #0x48]
	b _08046B74
_08046B72:
	str r1, [r7, #0x48]
_08046B74:
	movs r0, #0xd0
	lsls r0, r0, #1
	bl sub_8089678
	movs r3, #0
	mov r9, r3
	movs r0, #0xa0
	lsls r0, r0, #1
	str r0, [sp, #0x5c]
	mov r1, sl
	str r1, [sp, #0x60]
	movs r2, #0x80
	lsls r2, r2, #1
	str r2, [sp, #0x64]
	ldr r6, [sp, #0x58]
	str r3, [sp, #0x68]
	movs r0, #0x88
	lsls r0, r0, #7
	mov sl, r0
_08046B9A:
	ldr r0, [sp, #0x68]
	add r0, r8
	ldr r1, [r0]
	movs r0, #1
	negs r0, r0
	cmp r1, r0
	bne _08046BB0
	ldrb r1, [r6]
	movs r0, #2
	orrs r0, r1
	strb r0, [r6]
_08046BB0:
	ldrb r1, [r6]
	movs r0, #1
	orrs r0, r1
	mov r4, r9
	adds r4, #4
	adds r1, r4, #0
	bl sub_80895B4
	ldrb r0, [r6]
	mov r5, r9
	adds r5, #7
	adds r1, r5, #0
	bl sub_80895B4
	ldr r0, _08046C58  @ gUnknown_020234AE
	ldr r1, [sp, #0x64]
	adds r0, r1, r0
	adds r1, r4, #0
	bl sub_8089720
	mov r2, sl
	lsls r0, r2, #0xf
	lsrs r0, r0, #0x14
	ldr r3, [sp, #0x60]
	ldm r3!, {r1}
	str r3, [sp, #0x60]
	bl sub_8089624
	ldr r0, _08046C5C  @ gUnknown_02022CAE
	ldr r1, [sp, #0x5c]
	adds r0, r1, r0
	adds r1, r5, #0
	bl sub_80896D8
	ldr r2, [sp, #0x5c]
	movs r3, #0x80
	lsls r3, r3, #1
	adds r2, r2, r3
	str r2, [sp, #0x5c]
	ldr r0, [sp, #0x64]
	adds r0, r0, r3
	str r0, [sp, #0x64]
	adds r6, #1
	ldr r1, [sp, #0x68]
	adds r1, #4
	str r1, [sp, #0x68]
	movs r2, #0x80
	lsls r2, r2, #4
	add sl, r2
	movs r3, #1
	add r9, r3
	mov r0, r9
	cmp r0, #2
	ble _08046B9A
	ldr r2, _08046C60  @ gLCDControlBuffer
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
	adds r0, r7, #0
	movs r1, #1
	movs r2, #0
	bl sub_804C49C
	bl sub_804C508
	movs r0, #0xf
	bl BG_EnableSyncByMask
	add sp, #0x6c
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08046C58: .4byte gUnknown_020234AE
_08046C5C: .4byte gUnknown_02022CAE
_08046C60: .4byte gLCDControlBuffer

	THUMB_FUNC_END sub_80469C4

	THUMB_FUNC_START sub_8046C64
sub_8046C64: @ 0x08046C64
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r5, r3, #0
	ldr r0, [sp, #0x14]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov ip, r1
	lsls r2, r2, #0x18
	lsrs r6, r2, #0x18
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldr r1, _08046CEC  @ gKeyStatusPtr
	ldr r3, [r1]
	ldrh r2, [r3, #6]
	movs r0, #0x40
	ands r0, r2
	cmp r0, #0
	beq _08046CB2
	ldr r0, [r4]
	cmp r0, r6
	bgt _08046C94
	ldrh r3, [r3, #8]
	cmp r2, r3
	bne _08046CB2
_08046C94:
	subs r2, r7, #1
	movs r3, #1
	negs r3, r3
_08046C9A:
	ldr r0, [r4]
	subs r0, #1
	str r0, [r4]
	cmp r0, #0
	bge _08046CA6
	str r2, [r4]
_08046CA6:
	ldr r0, [r4]
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r0, [r0]
	cmp r0, r3
	beq _08046C9A
_08046CB2:
	ldr r1, [r1]
	ldrh r2, [r1, #6]
	movs r0, #0x80
	ands r0, r2
	cmp r0, #0
	beq _08046CE6
	ldr r0, [r4]
	cmp r0, ip
	blt _08046CCA
	ldrh r1, [r1, #8]
	cmp r2, r1
	bne _08046CE6
_08046CCA:
	ldr r0, [r4]
	adds r0, #1
	str r0, [r4]
	adds r1, r7, #0
	bl __modsi3
	str r0, [r4]
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r1, [r0]
	movs r0, #1
	negs r0, r0
	cmp r1, r0
	beq _08046CCA
_08046CE6:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08046CEC: .4byte gKeyStatusPtr

	THUMB_FUNC_END sub_8046C64

	THUMB_FUNC_START sub_8046CF0
sub_8046CF0: @ 0x08046CF0
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	ldr r5, [r6, #0x48]
	adds r0, #0x48
	ldr r1, [r6, #0x50]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldr r2, [r6, #0x4c]
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	adds r3, r6, #0
	adds r3, #0x38
	movs r4, #3
	str r4, [sp]
	bl sub_8046C64
	ldr r1, [r6, #0x48]
	lsls r1, r1, #5
	adds r1, #0x28
	movs r0, #0x1c
	bl DisplayUiHand
	ldr r0, [r6, #0x48]
	cmp r5, r0
	beq _08046D2A
	movs r0, #3
	bl sub_804320C
_08046D2A:
	ldr r4, _08046D68  @ gKeyStatusPtr
	ldr r0, [r4]
	ldrh r1, [r0, #8]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08046D44
	movs r0, #2
	bl sub_804320C
	adds r0, r6, #0
	bl Proc_Break
_08046D44:
	ldr r0, [r4]
	ldrh r1, [r0, #8]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08046D5E
	movs r0, #1
	bl sub_804320C
	adds r0, r6, #0
	movs r1, #4
	bl Proc_Goto
_08046D5E:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08046D68: .4byte gKeyStatusPtr

	THUMB_FUNC_END sub_8046CF0

	THUMB_FUNC_START sub_8046D6C
sub_8046D6C: @ 0x08046D6C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x48]
	bl LoadGame
	ldr r1, _08046DAC  @ gRAMChapterData
	ldrb r2, [r1, #0x14]
	movs r0, #0xdf
	ands r0, r2
	strb r0, [r1, #0x14]
	adds r1, #0x41
	ldrb r2, [r1]
	movs r0, #0xd
	negs r0, r0
	ands r0, r2
	strb r0, [r1]
	ldr r1, _08046DB0  @ gUnknown_0203DA24
	ldr r0, [r4, #0x48]
	strb r0, [r1, #4]
	bl SetupMapSpritesPalettes
	bl sub_80496A4
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08046DAC: .4byte gRAMChapterData
_08046DB0: .4byte gUnknown_0203DA24

	THUMB_FUNC_END sub_8046D6C

	THUMB_FUNC_START sub_8046DB4
sub_8046DB4: @ 0x08046DB4
	push {lr}
	adds r1, r0, #0
	ldr r0, _08046DCC  @ gUnknown_0203DA24
	ldrb r0, [r0, #3]
	cmp r0, #0xff
	bne _08046DC8
	adds r0, r1, #0
	movs r1, #1
	bl Proc_Goto
_08046DC8:
	pop {r0}
	bx r0
	.align 2, 0
_08046DCC: .4byte gUnknown_0203DA24

	THUMB_FUNC_END sub_8046DB4

	THUMB_FUNC_START sub_8046DD0
sub_8046DD0: @ 0x08046DD0
	push {lr}
	adds r1, r0, #0
	ldr r0, _08046DE8  @ gUnknown_0203DA24
	ldrb r0, [r0, #4]
	cmp r0, #0xff
	bne _08046DE4
	adds r0, r1, #0
	movs r1, #2
	bl Proc_Goto
_08046DE4:
	pop {r0}
	bx r0
	.align 2, 0
_08046DE8: .4byte gUnknown_0203DA24

	THUMB_FUNC_END sub_8046DD0

	THUMB_FUNC_START sub_8046DEC
sub_8046DEC: @ 0x08046DEC
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08046E08  @ gUnknown_08A1829C
	bl Proc_Find
	cmp r0, #0
	bne _08046E00
	adds r0, r4, #0
	bl Proc_Break
_08046E00:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08046E08: .4byte gUnknown_08A1829C

	THUMB_FUNC_END sub_8046DEC

	THUMB_FUNC_START sub_8046E0C
sub_8046E0C: @ 0x08046E0C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08046E48  @ gUnknown_0203DD24
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _08046E40
	bl sub_804309C
	bl nullsub_13
	bl sub_804C4F8
	bl sub_804C590
	bl sub_804C31C
	bl BMapVSync_End
	bl sub_8096454
	adds r0, r4, #0
	movs r1, #5
	bl Proc_Goto
_08046E40:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08046E48: .4byte gUnknown_0203DD24

	THUMB_FUNC_END sub_8046E0C

	THUMB_FUNC_START sub_8046E4C
sub_8046E4C: @ 0x08046E4C
	push {lr}
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8046E4C

	THUMB_FUNC_START sub_8046E5C
sub_8046E5C: @ 0x08046E5C
	adds r3, r0, #0
	lsls r0, r1, #1
	adds r0, r0, r1
	ldr r1, _08046E90  @ 0x00006078
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	adds r0, r2, #0
	adds r0, #8
	strh r0, [r3]
	adds r0, #1
	strh r0, [r3, #2]
	adds r0, #1
	strh r0, [r3, #4]
	adds r1, r3, #0
	adds r1, #0x40
	adds r0, #0x1e
	strh r0, [r1]
	adds r1, #2
	adds r0, #1
	strh r0, [r1]
	adds r1, #2
	adds r0, #1
	strh r0, [r1]
	bx lr
	.align 2, 0
_08046E90: .4byte 0x00006078

	THUMB_FUNC_END sub_8046E5C

	THUMB_FUNC_START sub_8046E94
sub_8046E94: @ 0x08046E94
	lsls r1, r1, #0x12
	ldr r2, _08046EB4  @ 0x60780000
	adds r1, r1, r2
	lsrs r1, r1, #0x10
	strh r1, [r0]
	adds r2, r1, #1
	strh r2, [r0, #2]
	adds r3, r0, #0
	adds r3, #0x40
	adds r2, r1, #2
	strh r2, [r3]
	adds r0, #0x42
	adds r1, #3
	strh r1, [r0]
	bx lr
	.align 2, 0
_08046EB4: .4byte 0x60780000

	THUMB_FUNC_END sub_8046E94

	THUMB_FUNC_START sub_8046EB8
sub_8046EB8: @ 0x08046EB8
	push {r4, r5, r6, lr}
	mov r6, sl
	mov r5, r9
	mov r4, r8
	push {r4, r5, r6}
	sub sp, #0x18
	mov r9, r0
	mov sl, r1
	adds r4, r2, #0
	adds r6, r3, #0
	ldr r5, [sp, #0x34]
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r6, r6, #0x10
	lsrs r6, r6, #0x10
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	ldr r1, _08046F5C  @ gUnknown_080D9E9C
	mov r0, sp
	movs r2, #0xa
	bl memcpy
	add r0, sp, #0xc
	mov r8, r0
	ldr r1, _08046F60  @ gUnknown_080D9EA6
	movs r2, #0xc
	bl memcpy
	mov r0, r9
	movs r1, #4
	movs r2, #0
	mov r3, sl
	bl Text_InsertString
	mov r0, r9
	movs r1, #0x54
	movs r2, #2
	adds r3, r6, #0
	bl sub_8042DE8
	ldr r0, _08046F64  @ 0x0000077F
	bl GetStringFromIndex
	adds r3, r0, #0
	mov r0, r9
	movs r1, #0x5d
	movs r2, #0
	bl Text_InsertString
	lsls r4, r4, #1
	mov r1, sp
	adds r0, r1, r4
	ldrh r0, [r0]
	bl GetStringFromIndex
	adds r3, r0, #0
	mov r0, r9
	movs r1, #0x80
	movs r2, #2
	bl Text_InsertString
	lsls r5, r5, #1
	add r8, r5
	mov r1, r8
	ldrh r0, [r1]
	bl GetStringFromIndex
	adds r3, r0, #0
	mov r0, r9
	movs r1, #0x9a
	movs r2, #0
	bl Text_InsertString
	add sp, #0x18
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08046F5C: .4byte gUnknown_080D9E9C
_08046F60: .4byte gUnknown_080D9EA6
_08046F64: .4byte 0x0000077F

	THUMB_FUNC_END sub_8046EB8

	THUMB_FUNC_START sub_8046F68
sub_8046F68: @ 0x08046F68
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	movs r6, #0
	ldr r0, _08046FFC  @ gUnknown_0203DC48
	ldr r1, _08047000  @ gUnknown_020234AE
	mov sl, r1
	subs r7, r0, #4
	movs r1, #0x22
	add r1, sl
	mov r9, r1
	mov r8, r0
_08046F86:
	lsls r5, r6, #3
	ldr r0, _08047004  @ gUnknown_0203DB14
	adds r5, r5, r0
	adds r0, r5, #0
	bl Text_Clear
	ldrb r0, [r7]
	lsls r2, r0, #0x1e
	lsrs r2, r2, #6
	movs r1, #0x80
	lsls r1, r1, #0x11
	adds r2, r2, r1
	lsrs r2, r2, #0x18
	ldr r3, [r7]
	lsls r3, r3, #0xb
	lsrs r3, r3, #0x10
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1e
	adds r0, #1
	str r0, [sp]
	adds r0, r5, #0
	mov r1, r8
	bl sub_8046EB8
	lsls r4, r6, #7
	mov r1, sl
	adds r0, r4, r1
	adds r1, r6, #0
	bl sub_8046E5C
	mov r0, sl
	adds r0, #6
	adds r4, r4, r0
	adds r0, r5, #0
	adds r1, r4, #0
	bl Text_Draw
	ldrb r1, [r7]
	lsls r1, r1, #0x1b
	lsrs r1, r1, #0x1f
	mov r0, r9
	bl sub_8046E94
	adds r7, #0x14
	movs r0, #0x80
	add r9, r0
	movs r1, #0x14
	add r8, r1
	adds r6, #1
	cmp r6, #9
	ble _08046F86
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08046FFC: .4byte gUnknown_0203DC48
_08047000: .4byte gUnknown_020234AE
_08047004: .4byte gUnknown_0203DB14

	THUMB_FUNC_END sub_8046F68

	THUMB_FUNC_START sub_8047008
sub_8047008: @ 0x08047008
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r7, r0, #0
	bl sub_8043044
	bl sub_804C33C
	movs r0, #0
	str r0, [sp]
	adds r0, r7, #0
	movs r1, #0
	movs r2, #0x12
	movs r3, #2
	bl sub_8086CE8
	ldr r4, _080471C0  @ gUnknown_085AC9DC
	movs r0, #1
	bl GetBackgroundTileDataOffset
	adds r1, r0, #0
	ldr r0, _080471C4  @ 0x06000F00
	adds r1, r1, r0
	adds r0, r4, #0
	bl CopyDataWithPossibleUncomp
	ldr r0, _080471C8  @ gUnknown_085ADCC8
	movs r1, #0xc0
	movs r2, #0x20
	bl CopyToPaletteBuffer
	ldr r0, _080471CC  @ gUnknown_085ABD68
	ldr r1, _080471D0  @ 0x06014800
	bl CopyDataWithPossibleUncomp
	ldr r0, _080471D4  @ gUnknown_085ADC48
	movs r1, #0x98
	lsls r1, r1, #2
	movs r2, #0x80
	bl CopyToPaletteBuffer
	ldr r0, _080471D8  @ gUnknown_02023DAA
	ldr r1, _080471DC  @ gUnknown_085AE464
	movs r2, #0x80
	lsls r2, r2, #5
	bl CallARM_FillTileRect
	ldr r0, _080471E0  @ gUnknown_0203DB64
	bl SetFont
	bl Font_LoadForUI
	bl sub_8003D20
	movs r1, #0
	movs r0, #0xc8
	strh r0, [r7, #0x36]
	adds r0, r7, #0
	adds r0, #0x39
	strb r1, [r0]
	subs r0, #1
	strb r1, [r0]
	subs r0, #4
	strb r1, [r0]
	ldrh r2, [r7, #0x36]
	movs r0, #1
	movs r1, #0
	bl BG_SetPosition
	ldr r5, _080471E4  @ gUnknown_0203DB14
	movs r4, #9
_08047094:
	adds r0, r5, #0
	movs r1, #0x16
	bl Text_Init
	adds r5, #8
	subs r4, #1
	cmp r4, #0
	bge _08047094
	ldr r4, _080471E8  @ gUnknown_0203DD0C
	adds r0, r4, #0
	movs r1, #0x18
	bl Text_Init
	adds r0, r4, #0
	adds r0, #8
	movs r1, #0x18
	bl Text_Init
	adds r0, r4, #0
	bl Text_Clear
	ldr r0, _080471EC  @ 0x00000772
	bl GetStringFromIndex
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0xc
	movs r2, #0
	bl Text_InsertString
	ldr r0, _080471F0  @ 0x00000773
	bl GetStringFromIndex
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x54
	movs r2, #0
	bl Text_InsertString
	ldr r0, _080471F4  @ 0x00000774
	bl GetStringFromIndex
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x78
	movs r2, #0
	bl Text_InsertString
	ldr r0, _080471F8  @ 0x00000775
	bl GetStringFromIndex
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x96
	movs r2, #0
	bl Text_InsertString
	ldr r1, _080471FC  @ gUnknown_02022DF2
	adds r0, r4, #0
	bl Text_Draw
	ldr r0, _08047200  @ 0x00000744
	movs r1, #1
	bl sub_8043100
	ldr r0, _08047204  @ gUnknown_0203DC44
	bl sub_80A69DC
	bl sub_8046F68
	ldr r1, _08047208  @ gLCDControlBuffer
	mov ip, r1
	ldrb r0, [r1, #1]
	movs r1, #0x20
	orrs r0, r1
	movs r1, #0x41
	negs r1, r1
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	mov r1, ip
	strb r0, [r1, #1]
	adds r1, #0x2d
	movs r0, #0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0x3a
	strb r0, [r1]
	subs r1, #5
	movs r0, #0xf0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0x88
	strb r0, [r1]
	mov r2, ip
	adds r2, #0x34
	ldrb r0, [r2]
	movs r6, #1
	orrs r0, r6
	movs r1, #2
	orrs r0, r1
	movs r5, #4
	orrs r0, r5
	movs r4, #8
	orrs r0, r4
	movs r3, #0x10
	orrs r0, r3
	strb r0, [r2]
	adds r2, #2
	ldrb r0, [r2]
	orrs r0, r6
	movs r1, #3
	negs r1, r1
	ands r0, r1
	orrs r0, r5
	orrs r0, r4
	orrs r0, r3
	strb r0, [r2]
	ldrh r0, [r7, #0x36]
	adds r0, #0x38
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	str r7, [sp, #4]
	movs r0, #0xd9
	movs r1, #0x39
	movs r2, #0xa
	movs r3, #5
	bl sub_804D1E0
	adds r0, r7, #0
	movs r1, #5
	movs r2, #0
	bl sub_804C49C
	bl sub_804C558
	movs r0, #0xc0
	movs r1, #0x10
	adds r2, r7, #0
	bl sub_804C2EC
	movs r0, #0xf
	bl BG_EnableSyncByMask
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080471C0: .4byte gUnknown_085AC9DC
_080471C4: .4byte 0x06000F00
_080471C8: .4byte gUnknown_085ADCC8
_080471CC: .4byte gUnknown_085ABD68
_080471D0: .4byte 0x06014800
_080471D4: .4byte gUnknown_085ADC48
_080471D8: .4byte gUnknown_02023DAA
_080471DC: .4byte gUnknown_085AE464
_080471E0: .4byte gUnknown_0203DB64
_080471E4: .4byte gUnknown_0203DB14
_080471E8: .4byte gUnknown_0203DD0C
_080471EC: .4byte 0x00000772
_080471F0: .4byte 0x00000773
_080471F4: .4byte 0x00000774
_080471F8: .4byte 0x00000775
_080471FC: .4byte gUnknown_02022DF2
_08047200: .4byte 0x00000744
_08047204: .4byte gUnknown_0203DC44
_08047208: .4byte gLCDControlBuffer

	THUMB_FUNC_END sub_8047008

	THUMB_FUNC_START sub_804720C
sub_804720C: @ 0x0804720C
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r6, r4, #0
	adds r6, #0x38
	movs r0, #0
	ldrsb r0, [r6, r0]
	cmp r0, #0
	ble _08047228
	ldrh r0, [r4, #0x36]
	subs r0, #4
	strh r0, [r4, #0x36]
	ldrb r0, [r6]
	subs r0, #1
	b _08047236
_08047228:
	cmp r0, #0
	bge _08047252
	ldrh r0, [r4, #0x36]
	adds r0, #4
	strh r0, [r4, #0x36]
	ldrb r0, [r6]
	adds r0, #1
_08047236:
	strb r0, [r6]
	ldrh r2, [r4, #0x36]
	movs r0, #1
	movs r1, #0
	bl BG_SetPosition
	ldrh r1, [r4, #0x36]
	adds r1, #0x38
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r0, #0xa
	bl sub_804D24C
	b _080472FE
_08047252:
	ldr r0, _08047304  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08047298
	adds r5, r4, #0
	adds r5, #0x34
	ldrb r0, [r5]
	cmp r0, #0
	beq _08047298
	movs r0, #3
	bl sub_804320C
	ldrh r0, [r4, #0x36]
	subs r0, #4
	strh r0, [r4, #0x36]
	ldrb r0, [r5]
	subs r0, #1
	strb r0, [r5]
	movs r0, #3
	strb r0, [r6]
	ldrh r2, [r4, #0x36]
	movs r0, #1
	movs r1, #0
	bl BG_SetPosition
	ldrh r1, [r4, #0x36]
	adds r1, #0x38
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r0, #0xa
	bl sub_804D24C
_08047298:
	ldr r0, _08047304  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _080472E4
	adds r5, r4, #0
	adds r5, #0x34
	ldrb r0, [r5]
	adds r0, #5
	cmp r0, #9
	bgt _080472E4
	movs r0, #3
	bl sub_804320C
	ldrh r0, [r4, #0x36]
	adds r0, #4
	strh r0, [r4, #0x36]
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
	adds r1, r4, #0
	adds r1, #0x38
	movs r0, #0xfd
	strb r0, [r1]
	ldrh r2, [r4, #0x36]
	movs r0, #1
	movs r1, #0
	bl BG_SetPosition
	ldrh r1, [r4, #0x36]
	adds r1, #0x38
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r0, #0xa
	bl sub_804D24C
_080472E4:
	ldr r0, _08047304  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080472FE
	movs r0, #1
	bl sub_804320C
	adds r0, r4, #0
	bl Proc_Break
_080472FE:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08047304: .4byte gKeyStatusPtr

	THUMB_FUNC_END sub_804720C

	THUMB_FUNC_START sub_8047308
sub_8047308: @ 0x08047308
	push {lr}
	cmp r0, #6
	ble _08047312
	movs r0, #5
	b _0804731E
_08047312:
	subs r0, #2
	cmp r0, #0
	bge _0804731A
	movs r0, #0
_0804731A:
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
_0804731E:
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8047308

	THUMB_FUNC_START sub_8047324
sub_8047324: @ 0x08047324
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r7, r0, #0
	bl sub_8043044
	bl sub_804C33C
	movs r5, #0
	str r5, [sp]
	adds r0, r7, #0
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl sub_8086CE8
	ldr r4, _08047520  @ gUnknown_085AC9DC
	movs r0, #1
	bl GetBackgroundTileDataOffset
	adds r1, r0, #0
	ldr r0, _08047524  @ 0x06000F00
	adds r1, r1, r0
	adds r0, r4, #0
	bl CopyDataWithPossibleUncomp
	ldr r0, _08047528  @ gUnknown_085ADCC8
	movs r1, #0xc0
	movs r2, #0x20
	bl CopyToPaletteBuffer
	ldr r0, _0804752C  @ gUnknown_085ABD68
	ldr r1, _08047530  @ 0x06014800
	bl CopyDataWithPossibleUncomp
	ldr r0, _08047534  @ gUnknown_085ACEFC
	ldr r1, _08047538  @ 0x06016000
	bl CopyDataWithPossibleUncomp
	ldr r0, _0804753C  @ gUnknown_085ADE08
	movs r1, #0x98
	lsls r1, r1, #2
	movs r2, #0x20
	bl CopyToPaletteBuffer
	ldr r0, _08047540  @ gUnknown_02023DAA
	ldr r1, _08047544  @ gUnknown_085AE464
	movs r2, #0x80
	lsls r2, r2, #5
	bl CallARM_FillTileRect
	ldr r0, _08047548  @ gUnknown_0203DB64
	bl SetFont
	bl Font_LoadForUI
	bl sub_8003D20
	adds r1, r7, #0
	adds r1, #0x34
	movs r0, #5
	strb r0, [r1]
	movs r1, #0
	movs r0, #0x8c
	lsls r0, r0, #1
	strh r0, [r7, #0x36]
	adds r0, r7, #0
	adds r0, #0x39
	strb r1, [r0]
	subs r0, #1
	strb r1, [r0]
	ldr r0, [r7, #0x3c]
	bl sub_8047308
	adds r1, r7, #0
	adds r1, #0x35
	strb r0, [r1]
	str r5, [r7, #0x40]
	ldrh r2, [r7, #0x36]
	movs r0, #1
	movs r1, #0
	bl BG_SetPosition
	ldr r5, _0804754C  @ gUnknown_0203DB14
	movs r4, #9
_080473D2:
	adds r0, r5, #0
	movs r1, #0x18
	bl Text_Init
	adds r5, #8
	subs r4, #1
	cmp r4, #0
	bge _080473D2
	ldr r4, _08047550  @ gUnknown_0203DD0C
	adds r0, r4, #0
	movs r1, #0x18
	bl Text_Init
	adds r0, r4, #0
	adds r0, #8
	movs r1, #0x18
	bl Text_Init
	adds r0, r4, #0
	bl Text_Clear
	ldr r0, _08047554  @ 0x00000772
	bl GetStringFromIndex
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0xc
	movs r2, #0
	bl Text_InsertString
	ldr r0, _08047558  @ 0x00000773
	bl GetStringFromIndex
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x54
	movs r2, #0
	bl Text_InsertString
	ldr r0, _0804755C  @ 0x00000774
	bl GetStringFromIndex
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x78
	movs r2, #0
	bl Text_InsertString
	ldr r0, _08047560  @ 0x00000775
	bl GetStringFromIndex
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x96
	movs r2, #0
	bl Text_InsertString
	ldr r1, _08047564  @ gUnknown_02022DF2
	adds r0, r4, #0
	bl Text_Draw
	ldr r0, _08047568  @ gUnknown_0203DC44
	bl sub_80A69DC
	bl sub_8046F68
	ldr r1, _0804756C  @ gLCDControlBuffer
	mov ip, r1
	ldrb r0, [r1, #1]
	movs r1, #0x20
	orrs r0, r1
	movs r1, #0x40
	orrs r0, r1
	movs r1, #0x7f
	ands r0, r1
	mov r2, ip
	strb r0, [r2, #1]
	mov r0, ip
	adds r0, #0x2d
	movs r1, #0
	mov r8, r1
	mov r2, r8
	strb r2, [r0]
	mov r1, ip
	adds r1, #0x31
	movs r0, #0x3a
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x2c
	movs r6, #0xf0
	strb r6, [r0]
	subs r1, #1
	movs r0, #0x88
	strb r0, [r1]
	mov r2, ip
	adds r2, #0x34
	ldrb r0, [r2]
	movs r5, #1
	orrs r0, r5
	movs r1, #2
	orrs r0, r1
	movs r4, #4
	orrs r0, r4
	movs r3, #8
	orrs r0, r3
	movs r1, #0x10
	mov r9, r1
	mov r1, r9
	orrs r0, r1
	strb r0, [r2]
	mov r0, ip
	adds r0, #0x2f
	mov r2, r8
	strb r2, [r0]
	mov r1, ip
	adds r1, #0x33
	movs r0, #0x18
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x2e
	strb r6, [r0]
	subs r1, #1
	movs r0, #0x38
	strb r0, [r1]
	mov r6, ip
	adds r6, #0x35
	ldrb r0, [r6]
	orrs r0, r5
	movs r2, #3
	negs r2, r2
	ands r0, r2
	orrs r0, r4
	orrs r0, r3
	movs r1, #0x11
	negs r1, r1
	ands r0, r1
	strb r0, [r6]
	mov r1, ip
	adds r1, #0x36
	ldrb r0, [r1]
	orrs r0, r5
	ands r0, r2
	orrs r0, r4
	orrs r0, r3
	mov r2, r9
	orrs r0, r2
	strb r0, [r1]
	bl sub_804C558
	ldr r1, [r7, #0x3c]
	lsls r1, r1, #4
	subs r1, #0x18
	movs r0, #0xe
	adds r2, r7, #0
	bl sub_804D7DC
	str r0, [r7, #0x2c]
	movs r0, #0xf
	bl BG_EnableSyncByMask
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08047520: .4byte gUnknown_085AC9DC
_08047524: .4byte 0x06000F00
_08047528: .4byte gUnknown_085ADCC8
_0804752C: .4byte gUnknown_085ABD68
_08047530: .4byte 0x06014800
_08047534: .4byte gUnknown_085ACEFC
_08047538: .4byte 0x06016000
_0804753C: .4byte gUnknown_085ADE08
_08047540: .4byte gUnknown_02023DAA
_08047544: .4byte gUnknown_085AE464
_08047548: .4byte gUnknown_0203DB64
_0804754C: .4byte gUnknown_0203DB14
_08047550: .4byte gUnknown_0203DD0C
_08047554: .4byte 0x00000772
_08047558: .4byte 0x00000773
_0804755C: .4byte 0x00000774
_08047560: .4byte 0x00000775
_08047564: .4byte gUnknown_02022DF2
_08047568: .4byte gUnknown_0203DC44
_0804756C: .4byte gLCDControlBuffer

	THUMB_FUNC_END sub_8047324

	THUMB_FUNC_START sub_8047570
sub_8047570: @ 0x08047570
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	ldr r0, [r4, #0x2c]
	mov r8, r0
	ldr r0, [r4, #0x40]
	adds r0, #1
	str r0, [r4, #0x40]
	cmp r0, #0x3b
	ble _08047622
	adds r7, r4, #0
	adds r7, #0x35
	ldrb r0, [r7]
	cmp r0, #5
	bne _08047596
	adds r0, r4, #0
	bl Proc_Break
_08047596:
	adds r5, r4, #0
	adds r5, #0x38
	movs r0, #0
	ldrsb r0, [r5, r0]
	cmp r0, #0
	ble _080475D0
	ldrh r0, [r4, #0x36]
	subs r0, #2
	strh r0, [r4, #0x36]
	ldrb r0, [r5]
	subs r0, #1
	strb r0, [r5]
	ldrh r2, [r4, #0x36]
	movs r0, #1
	movs r1, #0
	bl BG_SetPosition
	ldrh r1, [r4, #0x36]
	adds r1, #0x38
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r0, #0xa
	bl sub_804D24C
	mov r1, r8
	ldr r0, [r1, #0x30]
	adds r0, #2
	str r0, [r1, #0x30]
	b _08047622
_080475D0:
	adds r6, r4, #0
	adds r6, #0x34
	ldrb r0, [r7]
	ldrb r1, [r6]
	cmp r0, r1
	beq _0804760C
	ldrh r0, [r4, #0x36]
	subs r0, #2
	strh r0, [r4, #0x36]
	ldrb r0, [r6]
	subs r0, #1
	strb r0, [r6]
	movs r0, #7
	strb r0, [r5]
	ldrh r2, [r4, #0x36]
	movs r0, #1
	movs r1, #0
	bl BG_SetPosition
	ldrh r1, [r4, #0x36]
	adds r1, #0x38
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r0, #0xa
	bl sub_804D24C
	mov r1, r8
	ldr r0, [r1, #0x30]
	adds r0, #2
	str r0, [r1, #0x30]
_0804760C:
	movs r0, #0
	ldrsb r0, [r5, r0]
	cmp r0, #0
	bne _08047622
	ldrb r0, [r6]
	ldrb r7, [r7]
	cmp r0, r7
	bne _08047622
	adds r0, r4, #0
	bl Proc_Break
_08047622:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8047570

	THUMB_FUNC_START sub_804762C
sub_804762C: @ 0x0804762C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08047650  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0804764A
	movs r0, #0
	bl Sound_FadeOut800231C
	adds r0, r4, #0
	bl Proc_Break
_0804764A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08047650: .4byte gKeyStatusPtr

	THUMB_FUNC_END sub_804762C

	THUMB_FUNC_START sub_8047654
sub_8047654: @ 0x08047654
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08047668  @ gUnknown_085A9D98
	bl Proc_StartBlocking
	str r4, [r0, #0x3c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08047668: .4byte gUnknown_085A9D98

	THUMB_FUNC_END sub_8047654

	THUMB_FUNC_START sub_804766C
sub_804766C: @ 0x0804766C
	ldr r1, _08047688  @ gUnknown_0203DA24
	adds r1, #0xec
	ldrb r2, [r1]
	lsls r1, r2, #0x1f
	lsrs r1, r1, #0x1f
	strb r1, [r0]
	lsls r1, r2, #0x1e
	lsrs r1, r1, #0x1f
	strb r1, [r0, #1]
	lsls r2, r2, #0x1d
	lsrs r2, r2, #0x1f
	strb r2, [r0, #2]
	bx lr
	.align 2, 0
_08047688: .4byte gUnknown_0203DA24

	THUMB_FUNC_END sub_804766C

	THUMB_FUNC_START sub_804768C
sub_804768C: @ 0x0804768C
	push {r4, r5, lr}
	ldr r5, _080476C8  @ gUnknown_0203DA24
	adds r5, #0xec
	movs r4, #1
	ldrb r2, [r0]
	ands r2, r4
	ldrb r3, [r5]
	movs r1, #2
	negs r1, r1
	ands r1, r3
	orrs r1, r2
	ldrb r2, [r0, #1]
	ands r2, r4
	lsls r2, r2, #1
	movs r3, #3
	negs r3, r3
	ands r1, r3
	orrs r1, r2
	ldrb r0, [r0, #2]
	ands r0, r4
	lsls r0, r0, #2
	movs r2, #5
	negs r2, r2
	ands r1, r2
	orrs r1, r0
	strb r1, [r5]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080476C8: .4byte gUnknown_0203DA24

	THUMB_FUNC_END sub_804768C

	THUMB_FUNC_START sub_80476CC
sub_80476CC: @ 0x080476CC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	str r1, [sp, #8]
	ldr r1, _08047770  @ gUnknown_080D9EC0
	ldr r2, [r1, #4]
	ldr r1, [r1]
	str r1, [sp]
	str r2, [sp, #4]
	movs r7, #0
	lsls r1, r0, #1
	ldr r2, _08047774  @ gUnknown_080D9E50
	mov r8, r2
	adds r1, r1, r0
	adds r1, #6
	lsls r1, r1, #5
	mov sl, r1
	adds r2, #4
	lsls r6, r0, #4
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r2, r2, r1
	mov r9, r2
	adds r5, r1, #0
_08047704:
	ldr r4, _08047778  @ gUnknown_0203DA88
	adds r4, r6, r4
	adds r0, r4, #0
	bl Text_Clear
	ldr r1, [sp, #8]
	adds r0, r1, r7
	movs r1, #1
	ands r0, r1
	lsls r0, r0, #2
	add r0, sp
	ldr r1, [r0]
	adds r0, r4, #0
	bl Text_SetColorId
	mov r0, r8
	adds r0, #0xc
	adds r0, r5, r0
	ldr r0, [r0]
	bl GetStringFromIndex
	adds r1, r0, #0
	adds r0, r4, #0
	bl Text_AppendString
	mov r2, r9
	adds r2, #4
	mov r9, r2
	subs r2, #4
	ldm r2!, {r1}
	add r1, sl
	lsls r1, r1, #1
	ldr r0, _0804777C  @ gBG0TilemapBuffer
	adds r1, r1, r0
	adds r0, r4, #0
	bl Text_Draw
	adds r6, #8
	adds r5, #4
	adds r7, #1
	cmp r7, #1
	ble _08047704
	movs r0, #1
	bl BG_EnableSyncByMask
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08047770: .4byte gUnknown_080D9EC0
_08047774: .4byte gUnknown_080D9E50
_08047778: .4byte gUnknown_0203DA88
_0804777C: .4byte gBG0TilemapBuffer

	THUMB_FUNC_END sub_80476CC

	THUMB_FUNC_START sub_8047780
sub_8047780: @ 0x08047780
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	mov r8, r0
	bl sub_8043044
	bl sub_804C33C
	movs r5, #0
	str r5, [sp]
	mov r0, r8
	movs r1, #0
	movs r2, #0x12
	movs r3, #2
	bl sub_8086CE8
	ldr r4, _080478EC  @ gUnknown_085AC9DC
	movs r0, #1
	bl GetBackgroundTileDataOffset
	adds r1, r0, #0
	ldr r0, _080478F0  @ 0x06000F00
	adds r1, r1, r0
	adds r0, r4, #0
	bl CopyDataWithPossibleUncomp
	ldr r0, _080478F4  @ gUnknown_085ADCC8
	movs r1, #0xc0
	movs r2, #0x20
	bl CopyToPaletteBuffer
	ldr r0, _080478F8  @ gUnknown_085ABD68
	ldr r1, _080478FC  @ 0x06014800
	bl CopyDataWithPossibleUncomp
	ldr r0, _08047900  @ gUnknown_085ADC48
	movs r1, #0x98
	lsls r1, r1, #2
	movs r2, #0x80
	bl CopyToPaletteBuffer
	movs r0, #0
	bl sub_804C3A4
	ldr r0, _08047904  @ gUnknown_085AE778
	ldr r4, _08047908  @ gUnknown_02020188
	adds r1, r4, #0
	bl CopyDataWithPossibleUncomp
	ldr r0, _0804790C  @ gUnknown_02023DEA
	movs r2, #0x80
	lsls r2, r2, #5
	adds r1, r4, #0
	bl CallARM_FillTileRect
	ldr r0, _08047910  @ gUnknown_0203DB64
	bl SetFont
	bl sub_8003D20
	bl sub_8043164
	mov r1, r8
	str r5, [r1, #0x30]
	mov r0, r8
	bl sub_804CE8C
	mov r2, r8
	str r0, [r2, #0x2c]
	movs r0, #1
	movs r1, #0xfe
	movs r2, #0
	bl BG_SetPosition
	add r0, sp, #4
	bl sub_804766C
	mov r3, r8
	ldr r0, [r3, #0x2c]
	ldr r4, [r3, #0x30]
	movs r2, #0x30
	ldrsh r1, [r3, r2]
	ldr r5, _08047914  @ gUnknown_080D9E50
	mov r3, sp
	adds r3, r3, r4
	adds r3, #4
	lsls r2, r4, #2
	adds r2, r2, r4
	ldrb r3, [r3]
	adds r2, r2, r3
	lsls r2, r2, #2
	adds r3, r5, #4
	adds r2, r2, r3
	ldr r2, [r2]
	lsls r2, r2, #0x13
	asrs r2, r2, #0x10
	lsls r3, r4, #1
	adds r3, r3, r4
	lsls r3, r3, #0x13
	movs r4, #0xc0
	lsls r4, r4, #0xe
	adds r3, r3, r4
	asrs r3, r3, #0x10
	bl sub_804CEC4
	movs r6, #0
	movs r7, #0xc0
	lsls r7, r7, #1
_0804785A:
	lsls r4, r6, #3
	ldr r0, _08047918  @ gUnknown_0203DA30
	adds r4, r4, r0
	adds r0, r4, #0
	bl Text_Clear
	adds r0, r4, #0
	movs r1, #0
	bl Text_SetColorId
	ldr r0, [r5]
	bl GetStringFromIndex
	adds r1, r0, #0
	adds r0, r4, #0
	bl Text_AppendString
	ldr r1, _0804791C  @ gUnknown_02022CB4
	adds r1, r7, r1
	adds r0, r4, #0
	bl Text_Draw
	mov r0, sp
	adds r0, r0, r6
	adds r0, #4
	ldrb r1, [r0]
	adds r0, r6, #0
	bl sub_80476CC
	adds r7, #0xc0
	adds r5, #0x14
	adds r6, #1
	cmp r6, #2
	ble _0804785A
	ldr r5, _08047914  @ gUnknown_080D9E50
	ldr r0, [r5, #0x18]
	lsls r0, r0, #1
	ldr r4, _08047920  @ gUnknown_020236E4
	adds r0, r0, r4
	movs r1, #0
	bl sub_8046E94
	ldr r0, [r5, #0x1c]
	lsls r0, r0, #1
	adds r0, r0, r4
	movs r1, #1
	bl sub_8046E94
	mov r1, r8
	ldr r0, [r1, #0x2c]
	movs r1, #6
	movs r2, #0
	bl sub_804C49C
	bl sub_804C508
	mov r2, r8
	ldr r0, [r2, #0x30]
	ldr r3, _08047924  @ 0x00000745
	adds r0, r0, r3
	movs r1, #1
	bl sub_8043100
	movs r0, #0xf
	bl BG_EnableSyncByMask
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080478EC: .4byte gUnknown_085AC9DC
_080478F0: .4byte 0x06000F00
_080478F4: .4byte gUnknown_085ADCC8
_080478F8: .4byte gUnknown_085ABD68
_080478FC: .4byte 0x06014800
_08047900: .4byte gUnknown_085ADC48
_08047904: .4byte gUnknown_085AE778
_08047908: .4byte gUnknown_02020188
_0804790C: .4byte gUnknown_02023DEA
_08047910: .4byte gUnknown_0203DB64
_08047914: .4byte gUnknown_080D9E50
_08047918: .4byte gUnknown_0203DA30
_0804791C: .4byte gUnknown_02022CB4
_08047920: .4byte gUnknown_020236E4
_08047924: .4byte 0x00000745

	THUMB_FUNC_END sub_8047780

	THUMB_FUNC_START sub_8047928
sub_8047928: @ 0x08047928
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r6, r0, #0
	movs r4, #0
	movs r7, #0
	ldr r5, _08047A44  @ gKeyStatusPtr
	ldr r0, [r5]
	ldrh r1, [r0, #8]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08047952
	movs r0, #1
	bl sub_804320C
	ldr r0, _08047A48  @ gUnknown_0203DB10
	bl sub_80A6A04
	adds r0, r6, #0
	bl Proc_Break
_08047952:
	mov r0, sp
	bl sub_804766C
	ldr r0, [r5]
	ldrh r1, [r0, #6]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08047970
	ldr r0, [r6, #0x30]
	cmp r0, #0
	beq _08047970
	subs r0, #1
	str r0, [r6, #0x30]
	movs r4, #1
_08047970:
	ldr r2, _08047A44  @ gKeyStatusPtr
	ldr r0, [r2]
	ldrh r1, [r0, #6]
	movs r0, #0x80
	ands r0, r1
	adds r5, r2, #0
	cmp r0, #0
	beq _08047990
	ldr r0, [r6, #0x30]
	cmp r0, #1
	bgt _08047990
	adds r0, #1
	str r0, [r6, #0x30]
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
_08047990:
	ldr r0, [r5]
	ldrh r1, [r0, #8]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _080479B8
	ldr r0, [r6, #0x30]
	mov r1, sp
	adds r3, r1, r0
	ldrb r1, [r3]
	subs r1, #1
	movs r2, #1
	ands r1, r2
	strb r1, [r3]
	ldrb r1, [r3]
	bl sub_80476CC
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
_080479B8:
	ldr r0, [r5]
	ldrh r1, [r0, #8]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _080479E0
	ldr r0, [r6, #0x30]
	mov r2, sp
	adds r3, r2, r0
	ldrb r1, [r3]
	adds r1, #1
	movs r2, #1
	ands r1, r2
	strb r1, [r3]
	ldrb r1, [r3]
	bl sub_80476CC
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
_080479E0:
	mov r0, sp
	bl sub_804768C
	cmp r4, #0
	beq _08047A3A
	movs r0, #3
	bl sub_804320C
	ldr r5, [r6, #0x30]
	cmp r5, #1
	bne _080479FA
	movs r7, #2
	negs r7, r7
_080479FA:
	ldr r0, [r6, #0x2c]
	lsls r1, r5, #0x10
	asrs r1, r1, #0x10
	ldr r3, _08047A4C  @ gUnknown_080D9E50
	mov r2, sp
	adds r4, r2, r5
	lsls r2, r5, #2
	adds r2, r2, r5
	ldrb r4, [r4]
	adds r2, r2, r4
	lsls r2, r2, #2
	adds r3, #4
	adds r2, r2, r3
	ldr r2, [r2]
	adds r2, r2, r7
	lsls r2, r2, #0x13
	asrs r2, r2, #0x10
	lsls r3, r5, #1
	adds r3, r3, r5
	lsls r3, r3, #0x13
	movs r4, #0xc0
	lsls r4, r4, #0xe
	adds r3, r3, r4
	asrs r3, r3, #0x10
	bl sub_804CEC4
	ldr r0, [r6, #0x30]
	ldr r1, _08047A50  @ 0x00000745
	adds r0, r0, r1
	movs r1, #1
	bl sub_8043100
_08047A3A:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08047A44: .4byte gKeyStatusPtr
_08047A48: .4byte gUnknown_0203DB10
_08047A4C: .4byte gUnknown_080D9E50
_08047A50: .4byte 0x00000745

	THUMB_FUNC_END sub_8047928

	THUMB_FUNC_START sub_8047A54
sub_8047A54: @ 0x08047A54
	push {r4, r5, r6, lr}
	sub sp, #0x28
	adds r2, r0, #0
	adds r3, r1, #0
	mov r0, sp
	ldr r1, _08047A88  @ gUnknown_080D9EC8
	ldm r1!, {r4, r5, r6}
	stm r0!, {r4, r5, r6}
	ldm r1!, {r4, r5, r6}
	stm r0!, {r4, r5, r6}
	ldm r1!, {r4, r5, r6}
	stm r0!, {r4, r5, r6}
	ldr r1, [r1]
	str r1, [r0]
	cmp r3, #0
	bne _08047A90
	adds r0, r2, #0
	adds r0, #0x58
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _08047AA4
	ldr r0, _08047A8C  @ 0x00000735
	b _08047AB0
	.align 2, 0
_08047A88: .4byte gUnknown_080D9EC8
_08047A8C: .4byte 0x00000735
_08047A90:
	adds r0, r2, #0
	adds r0, #0x58
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _08047AA4
	movs r0, #1
	negs r0, r0
	b _08047AB0
_08047AA4:
	ldr r0, [r2, #0x48]
	lsls r0, r0, #1
	adds r0, r0, r3
	lsls r0, r0, #2
	add r0, sp
	ldr r0, [r0]
_08047AB0:
	add sp, #0x28
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8047A54

	THUMB_FUNC_START sub_8047AB8
sub_8047AB8: @ 0x08047AB8
	push {r4, lr}
	sub sp, #0x4c
	movs r4, #0
_08047ABE:
	adds r0, r4, #0
	bl sub_80A5218
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08047AE2
	adds r0, r4, #0
	mov r1, sp
	bl sub_80A522C
	mov r0, sp
	bl sub_80A52BC
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08047AE2
	movs r0, #1
	b _08047AEA
_08047AE2:
	adds r4, #1
	cmp r4, #2
	ble _08047ABE
	movs r0, #0
_08047AEA:
	add sp, #0x4c
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8047AB8

	THUMB_FUNC_START sub_8047AF4
sub_8047AF4: @ 0x08047AF4
	push {lr}
	bl sub_8047AB8
	ldr r1, _08047B20  @ gUnknown_0203DA24
	strb r0, [r1, #0xa]
	ldr r1, _08047B24  @ gUnknown_0203DD2C
	movs r2, #0
	adds r0, r1, #0
	adds r0, #0x1e
_08047B06:
	strh r2, [r0]
	subs r0, #2
	cmp r0, r1
	bge _08047B06
	movs r1, #0
	ldr r3, _08047B28  @ gUnknown_03001808
	ldr r2, _08047B2C  @ gUnknown_0300180C
	ldr r0, _08047B30  @ gUnknown_0203DD4C
	str r1, [r0]
	str r1, [r2]
	str r1, [r3]
	pop {r0}
	bx r0
	.align 2, 0
_08047B20: .4byte gUnknown_0203DA24
_08047B24: .4byte gUnknown_0203DD2C
_08047B28: .4byte gUnknown_03001808
_08047B2C: .4byte gUnknown_0300180C
_08047B30: .4byte gUnknown_0203DD4C

	THUMB_FUNC_END sub_8047AF4

	THUMB_FUNC_START sub_8047B34
sub_8047B34: @ 0x08047B34
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r6, r0, #0
	ldr r4, _08047BC4  @ gUnknown_0203DB10
	adds r0, r4, #0
	bl sub_80A6A40
	ldrb r0, [r4]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1f
	adds r5, r6, #0
	adds r5, #0x59
	movs r4, #0
	strb r0, [r5]
	bl sub_804C33C
	str r4, [sp]
	adds r0, r6, #0
	movs r1, #0
	movs r2, #0x10
	movs r3, #4
	bl sub_8086CE8
	ldr r0, _08047BC8  @ gUnknown_085AB358
	ldr r1, _08047BCC  @ 0x06014800
	bl CopyDataWithPossibleUncomp
	ldr r0, _08047BD0  @ gUnknown_085ADBE8
	movs r1, #0x98
	lsls r1, r1, #2
	movs r2, #0x60
	bl CopyToPaletteBuffer
	ldr r0, _08047BD4  @ gUnknown_0203DB64
	bl SetFont
	bl Font_LoadForUI
	bl sub_8003D20
	bl sub_8043164
	str r4, [r6, #0x4c]
	bl sub_80A6A68
	adds r2, r6, #0
	adds r2, #0x58
	strb r0, [r2]
	adds r1, r6, #0
	adds r1, #0x40
	movs r0, #1
	strb r0, [r1]
	movs r1, #0
	ldrsb r1, [r2, r1]
	negs r0, r1
	orrs r0, r1
	lsrs r1, r0, #0x1f
	adds r0, r6, #0
	adds r0, #0x41
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	movs r0, #0
	ldrsb r0, [r5, r0]
	cmp r0, #0
	bne _08047BD8
	movs r1, #0
	movs r0, #3
	b _08047BDC
	.align 2, 0
_08047BC4: .4byte gUnknown_0203DB10
_08047BC8: .4byte gUnknown_085AB358
_08047BCC: .4byte 0x06014800
_08047BD0: .4byte gUnknown_085ADBE8
_08047BD4: .4byte gUnknown_0203DB64
_08047BD8:
	movs r1, #1
	movs r0, #4
_08047BDC:
	str r0, [r6, #0x50]
	adds r0, r6, #0
	adds r0, #0x44
	strb r1, [r0]
	ldr r0, _08047C58  @ gUnknown_0203DA24
	ldrb r0, [r0, #1]
	str r0, [r6, #0x48]
	adds r2, r6, #0
	adds r2, #0x40
	adds r0, r2, r0
	movs r1, #2
	strb r1, [r0]
	movs r4, #4
	adds r7, r2, #0
	adds r5, r6, #0
	adds r5, #0x3c
_08047BFC:
	lsls r3, r4, #0x18
	lsrs r3, r3, #0x18
	adds r0, r7, r4
	ldrb r0, [r0]
	str r0, [sp]
	adds r0, r6, #0
	movs r1, #0xb0
	movs r2, #0xa0
	bl sub_804C758
	str r0, [r5]
	subs r5, #4
	subs r4, #1
	cmp r4, #0
	bge _08047BFC
	ldr r0, [r6, #0x2c]
	movs r1, #0
	movs r2, #0
	bl sub_804C49C
	bl sub_804C508
	ldr r0, _08047C5C  @ gUnknown_085A9E48
	bl SetupFaceGfxData
	movs r0, #2
	str r0, [sp]
	movs r0, #3
	movs r1, #0x64
	movs r2, #0xd0
	movs r3, #0x50
	bl NewFace
	movs r0, #0
	str r0, [r6, #0x54]
	movs r0, #0x38
	movs r1, #0
	bl Sound_PlaySong80024D4
	bl sub_80497CC
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08047C58: .4byte gUnknown_0203DA24
_08047C5C: .4byte gUnknown_085A9E48

	THUMB_FUNC_END sub_8047B34

	THUMB_FUNC_START sub_8047C60
sub_8047C60: @ 0x08047C60
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r7, r0, #0
	movs r1, #0x50
	negs r1, r1
	ldr r5, _08047CEC  @ gUnknown_080D9EF0
	ldrb r2, [r5]
	ldr r3, [r7, #0x54]
	movs r4, #0x20
	str r4, [sp]
	movs r0, #4
	bl sub_8012DCC
	adds r6, r0, #0
	ldrb r2, [r5, #1]
	ldr r3, [r7, #0x54]
	str r4, [sp]
	movs r0, #5
	movs r1, #0xa0
	bl sub_8012DCC
	movs r5, #4
	lsls r6, r6, #0x10
	mov r8, r6
	lsls r6, r0, #0x10
	adds r4, r7, #0
	adds r4, #0x3c
_08047C9A:
	ldr r0, [r4]
	mov r2, r8
	asrs r1, r2, #0x10
	asrs r2, r6, #0x10
	bl sub_804C7DC
	subs r4, #4
	subs r5, #1
	cmp r5, #0
	bge _08047C9A
	ldr r0, [r7, #0x54]
	cmp r0, #0x1f
	ble _08047CDA
	movs r0, #0
	str r0, [r7, #0x54]
	adds r0, r7, #0
	movs r1, #0
	bl sub_8047A54
	movs r1, #0
	bl sub_8043100
	adds r0, r7, #0
	movs r1, #1
	bl sub_8047A54
	movs r1, #1
	bl sub_8043100
	adds r0, r7, #0
	bl Proc_Break
_08047CDA:
	ldr r0, [r7, #0x54]
	adds r0, #1
	str r0, [r7, #0x54]
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08047CEC: .4byte gUnknown_080D9EF0

	THUMB_FUNC_END sub_8047C60

	THUMB_FUNC_START sub_8047CF0
sub_8047CF0: @ 0x08047CF0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r5, r0, #0
	ldr r0, [r5, #0x48]
	lsls r0, r0, #1
	movs r7, #4
	ldr r1, _08047D84  @ gUnknown_080D9EF0
	movs r2, #0x10
	mov r8, r2
	adds r6, r1, #0
	adds r6, #8
	adds r4, r0, r1
	mov sl, r4
	adds r0, #1
	adds r0, r0, r1
	mov r9, r0
_08047D18:
	ldrb r2, [r6]
	ldr r3, [r5, #0x54]
	mov r0, r8
	str r0, [sp]
	movs r0, #4
	mov r4, sl
	ldrb r1, [r4]
	bl sub_8012DCC
	adds r4, r0, #0
	mov r0, r9
	ldrb r1, [r0]
	ldrb r2, [r6, #1]
	ldr r3, [r5, #0x54]
	mov r0, r8
	str r0, [sp]
	movs r0, #4
	bl sub_8012DCC
	adds r2, r0, #0
	lsls r1, r7, #2
	adds r0, r5, #0
	adds r0, #0x2c
	adds r0, r0, r1
	ldr r0, [r0]
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	adds r1, r4, #0
	bl sub_804C7DC
	subs r6, #2
	subs r7, #1
	cmp r7, #0
	bge _08047D18
	ldr r0, [r5, #0x54]
	cmp r0, #0xf
	ble _08047D6C
	adds r0, r5, #0
	bl Proc_Break
_08047D6C:
	ldr r0, [r5, #0x54]
	adds r0, #1
	str r0, [r5, #0x54]
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08047D84: .4byte gUnknown_080D9EF0

	THUMB_FUNC_END sub_8047CF0

	THUMB_FUNC_START sub_8047D88
sub_8047D88: @ 0x08047D88
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r6, r0, #0
	ldr r4, _08047E20  @ gUnknown_0203DB10
	adds r0, r4, #0
	bl sub_80A6A40
	ldrb r0, [r4]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1f
	adds r5, r6, #0
	adds r5, #0x59
	movs r4, #0
	strb r0, [r5]
	bl sub_804C33C
	str r4, [sp]
	adds r0, r6, #0
	movs r1, #0
	movs r2, #0x10
	movs r3, #4
	bl sub_8086CE8
	ldr r0, _08047E24  @ gUnknown_085AB358
	ldr r1, _08047E28  @ 0x06014800
	bl CopyDataWithPossibleUncomp
	ldr r0, _08047E2C  @ gUnknown_085ADBE8
	movs r1, #0x98
	lsls r1, r1, #2
	movs r2, #0x60
	bl CopyToPaletteBuffer
	ldr r0, _08047E30  @ gUnknown_0203DB64
	bl SetFont
	bl Font_LoadForUI
	bl sub_8003D20
	bl sub_8043164
	str r4, [r6, #0x4c]
	bl sub_80A6A68
	adds r2, r6, #0
	adds r2, #0x58
	strb r0, [r2]
	adds r1, r6, #0
	adds r1, #0x40
	movs r0, #1
	strb r0, [r1]
	movs r1, #0
	ldrsb r1, [r2, r1]
	negs r0, r1
	orrs r0, r1
	lsrs r1, r0, #0x1f
	adds r0, r6, #0
	adds r0, #0x41
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	movs r0, #0
	ldrsb r0, [r5, r0]
	cmp r0, #0
	bne _08047E34
	movs r1, #0
	movs r0, #3
	b _08047E38
	.align 2, 0
_08047E20: .4byte gUnknown_0203DB10
_08047E24: .4byte gUnknown_085AB358
_08047E28: .4byte 0x06014800
_08047E2C: .4byte gUnknown_085ADBE8
_08047E30: .4byte gUnknown_0203DB64
_08047E34:
	movs r1, #1
	movs r0, #4
_08047E38:
	str r0, [r6, #0x50]
	adds r0, r6, #0
	adds r0, #0x44
	strb r1, [r0]
	ldr r0, _08047EEC  @ gUnknown_0203DA24
	ldrb r0, [r0, #1]
	str r0, [r6, #0x48]
	adds r2, r6, #0
	adds r2, #0x40
	adds r0, r2, r0
	movs r1, #2
	strb r1, [r0]
	ldr r1, [r6, #0x48]
	lsls r1, r1, #1
	movs r5, #4
	mov r9, r2
	ldr r2, _08047EF0  @ gUnknown_080D9EF0
	adds r0, r1, #1
	adds r0, r0, r2
	mov r8, r0
	adds r4, r6, #0
	adds r4, #0x3c
	adds r1, r1, r2
	mov sl, r1
_08047E68:
	lsls r3, r5, #0x18
	lsrs r3, r3, #0x18
	mov r1, r9
	adds r0, r1, r5
	ldrb r0, [r0]
	str r0, [sp]
	adds r0, r6, #0
	mov r2, sl
	ldrb r1, [r2]
	mov r7, r8
	ldrb r2, [r7]
	bl sub_804C758
	str r0, [r4]
	subs r4, #4
	subs r5, #1
	cmp r5, #0
	bge _08047E68
	ldr r0, [r6, #0x2c]
	movs r1, #0
	movs r2, #0
	bl sub_804C49C
	bl sub_804C508
	ldr r0, _08047EF4  @ gUnknown_085A9E68
	bl SetupFaceGfxData
	movs r0, #2
	str r0, [sp]
	movs r0, #3
	movs r1, #0x64
	movs r2, #0xd0
	movs r3, #0x50
	bl NewFace
	adds r0, r6, #0
	movs r1, #0
	bl sub_8047A54
	movs r1, #0
	bl sub_8043100
	adds r0, r6, #0
	movs r1, #1
	bl sub_8047A54
	movs r1, #1
	bl sub_8043100
	bl sub_80497CC
	movs r0, #0x38
	movs r1, #0
	bl Sound_PlaySong80024D4
	movs r0, #0
	str r0, [r6, #0x54]
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08047EEC: .4byte gUnknown_0203DA24
_08047EF0: .4byte gUnknown_080D9EF0
_08047EF4: .4byte gUnknown_085A9E68

	THUMB_FUNC_END sub_8047D88

	THUMB_FUNC_START sub_8047EF8
sub_8047EF8: @ 0x08047EF8
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	lsls r1, r1, #0x18
	lsrs r6, r1, #0x18
	ldr r0, [r5, #0x48]
	cmp r0, #1
	bne _08047F78
	ldr r0, _08047FF0  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _08047F42
	ldr r1, _08047FF4  @ gUnknown_0203DA24
	ldrb r0, [r1, #5]
	subs r0, #1
	strb r0, [r1, #5]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #2
	bls _08047F2A
	movs r0, #2
	strb r0, [r1, #5]
_08047F2A:
	ldr r0, [r5, #0x30]
	movs r1, #6
	negs r1, r1
	movs r2, #4
	str r2, [sp]
	movs r2, #0x34
	movs r3, #0x1f
	bl sub_804C7C8
	movs r0, #3
	bl sub_804320C
_08047F42:
	ldr r0, _08047FF0  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _08047F78
	ldr r4, _08047FF4  @ gUnknown_0203DA24
	ldrb r0, [r4, #5]
	adds r0, #1
	strb r0, [r4, #5]
	ldrb r0, [r4, #5]
	movs r1, #3
	bl __umodsi3
	strb r0, [r4, #5]
	ldr r0, [r5, #0x30]
	movs r1, #0x1f
	str r1, [sp]
	movs r1, #0
	movs r2, #0x3a
	movs r3, #4
	bl sub_804C7C8
	movs r0, #3
	bl sub_804320C
_08047F78:
	ldr r1, _08047FF0  @ gKeyStatusPtr
	ldr r2, [r1]
	ldrh r3, [r2, #6]
	movs r0, #0x40
	ands r0, r3
	adds r4, r1, #0
	cmp r0, #0
	beq _08047FB2
	ldr r1, [r5, #0x48]
	ldr r0, [r5, #0x4c]
	cmp r1, r0
	bgt _08047F96
	ldrh r2, [r2, #8]
	cmp r3, r2
	bne _08047FB2
_08047F96:
	subs r2, r6, #1
	adds r1, r5, #0
	adds r1, #0x40
_08047F9C:
	ldr r0, [r5, #0x48]
	subs r0, #1
	str r0, [r5, #0x48]
	cmp r0, #0
	bge _08047FA8
	str r2, [r5, #0x48]
_08047FA8:
	ldr r0, [r5, #0x48]
	adds r0, r1, r0
	ldrb r0, [r0]
	cmp r0, #0
	beq _08047F9C
_08047FB2:
	ldr r2, [r4]
	ldrh r3, [r2, #6]
	movs r0, #0x80
	ands r0, r3
	cmp r0, #0
	beq _08047FE6
	ldr r1, [r5, #0x48]
	ldr r0, [r5, #0x50]
	cmp r1, r0
	blt _08047FCC
	ldrh r2, [r2, #8]
	cmp r3, r2
	bne _08047FE6
_08047FCC:
	adds r4, r5, #0
	adds r4, #0x40
_08047FD0:
	ldr r0, [r5, #0x48]
	adds r0, #1
	str r0, [r5, #0x48]
	adds r1, r6, #0
	bl __modsi3
	str r0, [r5, #0x48]
	adds r0, r4, r0
	ldrb r0, [r0]
	cmp r0, #0
	beq _08047FD0
_08047FE6:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08047FF0: .4byte gKeyStatusPtr
_08047FF4: .4byte gUnknown_0203DA24

	THUMB_FUNC_END sub_8047EF8

	THUMB_FUNC_START sub_8047FF8
sub_8047FF8: @ 0x08047FF8
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r5, [r4, #0x48]
	movs r1, #5
	bl sub_8047EF8
	ldr r0, [r4, #0x48]
	cmp r5, r0
	beq _0804805C
	movs r0, #3
	bl sub_804320C
	lsls r0, r5, #2
	adds r1, r4, #0
	adds r1, #0x2c
	adds r0, r1, r0
	ldr r3, [r0]
	adds r2, r3, #0
	adds r2, #0x2e
	movs r0, #1
	strb r0, [r2]
	ldr r0, [r4, #0x48]
	lsls r0, r0, #2
	adds r1, r1, r0
	ldr r3, [r1]
	adds r1, r3, #0
	adds r1, #0x2e
	movs r0, #2
	strb r0, [r1]
	movs r0, #0x2a
	ldrsh r1, [r3, r0]
	movs r0, #0x2c
	ldrsh r2, [r3, r0]
	adds r0, r3, #0
	bl sub_804CFB8
	adds r0, r4, #0
	movs r1, #0
	bl sub_8047A54
	movs r1, #0
	bl sub_8043100
	adds r0, r4, #0
	movs r1, #1
	bl sub_8047A54
	movs r1, #1
	bl sub_8043100
_0804805C:
	ldr r5, _080480AC  @ gKeyStatusPtr
	ldr r0, [r5]
	ldrh r1, [r0, #8]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08048080
	movs r0, #0
	str r0, [r4, #0x54]
	movs r0, #2
	bl sub_804320C
	ldr r1, _080480B0  @ gUnknown_0203DA24
	ldr r0, [r4, #0x48]
	strb r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
_08048080:
	ldr r0, [r5]
	ldrh r1, [r0, #8]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080480A4
	movs r0, #1
	bl sub_804320C
	movs r0, #2
	bl Sound_FadeOut800231C
	ldr r1, _080480B0  @ gUnknown_0203DA24
	movs r0, #0xff
	strb r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
_080480A4:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080480AC: .4byte gKeyStatusPtr
_080480B0: .4byte gUnknown_0203DA24

	THUMB_FUNC_END sub_8047FF8

	THUMB_FUNC_START sub_80480B4
sub_80480B4: @ 0x080480B4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r5, r0, #0
	ldr r4, _08048160  @ gUnknown_0203DA24
	ldrb r0, [r4]
	cmp r0, #0xff
	bne _080480D0
	adds r0, r5, #0
	bl Proc_Break
_080480D0:
	ldrb r2, [r4]
	ldr r0, [r5, #0x54]
	cmp r0, #0x10
	bgt _0804813E
	movs r0, #4
	mov r8, r0
	lsls r2, r2, #1
	ldr r1, _08048164  @ gUnknown_080D9EF0
	movs r4, #0x10
	mov r9, r4
	adds r0, r2, #1
	adds r0, r0, r1
	str r0, [sp, #4]
	adds r6, r5, #0
	adds r6, #0x3c
	adds r7, r1, #0
	adds r7, #8
	adds r2, r2, r1
	mov sl, r2
_080480F6:
	ldrb r1, [r7]
	ldr r3, [r5, #0x54]
	mov r0, r9
	str r0, [sp]
	movs r0, #4
	mov r4, sl
	ldrb r2, [r4]
	bl sub_8012DCC
	adds r4, r0, #0
	ldrb r1, [r7, #1]
	ldr r0, [sp, #4]
	ldrb r2, [r0]
	ldr r3, [r5, #0x54]
	mov r0, r9
	str r0, [sp]
	movs r0, #4
	bl sub_8012DCC
	adds r2, r0, #0
	ldr r0, [r6]
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	adds r1, r4, #0
	bl sub_804C7DC
	subs r6, #4
	subs r7, #2
	movs r4, #1
	negs r4, r4
	add r8, r4
	mov r0, r8
	cmp r0, #0
	bge _080480F6
_0804813E:
	ldr r0, [r5, #0x54]
	cmp r0, #0x20
	ble _0804814A
	adds r0, r5, #0
	bl Proc_Break
_0804814A:
	ldr r0, [r5, #0x54]
	adds r0, #1
	str r0, [r5, #0x54]
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08048160: .4byte gUnknown_0203DA24
_08048164: .4byte gUnknown_080D9EF0

	THUMB_FUNC_END sub_80480B4

	THUMB_FUNC_START sub_8048168
sub_8048168: @ 0x08048168
	push {r4, r5, r6, lr}
	sub sp, #0x14
	adds r6, r0, #0
	mov r1, sp
	ldr r0, _080481BC  @ gUnknown_080D9EFC
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldm r0!, {r2, r3}
	stm r1!, {r2, r3}
	bl EndBG3Slider
	movs r0, #3
	bl DeleteFaceByIndex
	adds r5, r6, #0
	adds r5, #0x2c
	movs r4, #4
_0804818A:
	ldm r5!, {r0}
	bl Proc_End
	subs r4, #1
	cmp r4, #0
	bge _0804818A
	ldr r1, _080481C0  @ gUnknown_0203DA24
	ldrb r2, [r1]
	adds r0, r2, #0
	cmp r0, #0xff
	bne _080481C8
	bl BMapVSync_End
	bl nullsub_13
	bl sub_8042E88
	ldr r0, _080481C4  @ gUnknown_0859AA5C
	bl Proc_EndEach
	adds r0, r6, #0
	bl Proc_End
	b _080481D8
	.align 2, 0
_080481BC: .4byte gUnknown_080D9EFC
_080481C0: .4byte gUnknown_0203DA24
_080481C4: .4byte gUnknown_0859AA5C
_080481C8:
	strb r2, [r1, #1]
	ldrb r0, [r1]
	lsls r0, r0, #2
	add r0, sp
	ldr r0, [r0]
	adds r1, r6, #0
	bl Proc_StartBlocking
_080481D8:
	add sp, #0x14
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8048168

	THUMB_FUNC_START sub_80481E0
sub_80481E0: @ 0x080481E0
	push {r4, lr}
	adds r4, r0, #0
	bl LoadUiFrameGraphics
	ldr r0, _08048248  @ gUnknown_0203DB64
	ldr r1, _0804824C  @ 0x06001800
	movs r2, #0xc0
	movs r3, #0
	bl Font_InitForUI
	movs r0, #5
	bl sub_80A5218
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08048204
	bl sub_80A6560
_08048204:
	ldr r1, _08048250  @ gUnknown_0203DA24
	movs r0, #0
	strb r0, [r1, #5]
	strb r0, [r1, #3]
	strb r0, [r1, #1]
	bl sub_8042E78
	bl sub_80496A4
	bl BMapVSync_Start
	ldr r1, _08048254  @ gRAMChapterData
	ldrb r2, [r1, #0x14]
	movs r0, #0xdf
	ands r0, r2
	strb r0, [r1, #0x14]
	adds r1, #0x41
	ldrb r2, [r1]
	movs r0, #0xd
	negs r0, r0
	ands r0, r2
	strb r0, [r1]
	ldr r0, _08048258  @ gUnknown_085A9E88
	adds r1, r4, #0
	bl Proc_StartBlocking
	ldr r0, _0804825C  @ gUnknown_0859AA5C
	movs r1, #3
	bl Proc_Start
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08048248: .4byte gUnknown_0203DB64
_0804824C: .4byte 0x06001800
_08048250: .4byte gUnknown_0203DA24
_08048254: .4byte gRAMChapterData
_08048258: .4byte gUnknown_085A9E88
_0804825C: .4byte gUnknown_0859AA5C

	THUMB_FUNC_END sub_80481E0

	THUMB_FUNC_START sub_8048260
sub_8048260: @ 0x08048260
	push {lr}
	adds r1, r0, #0
	ldr r0, _0804827C  @ gUnknown_085A9614
	bl Proc_StartBlocking
	adds r3, r0, #0
	adds r3, #0x33
	movs r2, #0
	movs r1, #7
	strb r1, [r3]
	adds r0, #0x32
	strb r2, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_0804827C: .4byte gUnknown_085A9614

	THUMB_FUNC_END sub_8048260

	THUMB_FUNC_START sub_8048280
sub_8048280: @ 0x08048280
	push {r4, lr}
	adds r4, r0, #0
	bl LoadLegacyUiFrameGraphics
	bl sub_8042E88
	ldr r0, _080482CC  @ gUnknown_0203DB64
	ldr r1, _080482D0  @ 0x06001800
	movs r2, #0xc0
	movs r3, #0
	bl Font_InitForUI
	ldr r1, _080482D4  @ gUnknown_0203DA24
	movs r0, #0
	strb r0, [r1, #5]
	strb r0, [r1, #3]
	strb r0, [r1, #1]
	ldr r1, _080482D8  @ gRAMChapterData
	adds r1, #0x41
	ldrb r2, [r1]
	subs r0, #0xd
	ands r0, r2
	strb r0, [r1]
	ldr r0, _080482DC  @ gUnknown_085A9614
	adds r1, r4, #0
	bl Proc_StartBlocking
	adds r2, r0, #0
	adds r2, #0x33
	movs r1, #5
	strb r1, [r2]
	adds r0, #0x32
	movs r1, #1
	strb r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080482CC: .4byte gUnknown_0203DB64
_080482D0: .4byte 0x06001800
_080482D4: .4byte gUnknown_0203DA24
_080482D8: .4byte gRAMChapterData
_080482DC: .4byte gUnknown_085A9614

	THUMB_FUNC_END sub_8048280

	THUMB_FUNC_START sub_80482E0
sub_80482E0: @ 0x080482E0
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	movs r4, #0
	ldr r0, _08048308  @ gUnknown_085A932C
	bl Proc_Find
	cmp r0, #0
	beq _08048310
	ldr r0, _0804830C  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080483EC
	adds r0, r5, #0
	movs r1, #4
	b _080483A8
	.align 2, 0
_08048308: .4byte gUnknown_085A932C
_0804830C: .4byte gKeyStatusPtr
_08048310:
	ldr r0, _08048330  @ gUnknown_085A92E0
	ldr r3, [r0]
	movs r0, #6
	ldrsb r0, [r3, r0]
	cmp r0, #1
	bgt _08048328
	adds r1, r3, #0
	adds r1, #0xb
	adds r1, r1, r0
	ldrb r0, [r1]
	cmp r0, #2
	bne _08048334
_08048328:
	adds r0, r5, #0
	movs r1, #0
	b _080483A8
	.align 2, 0
_08048330: .4byte gUnknown_085A92E0
_08048334:
	movs r2, #0
	adds r1, r3, #0
	adds r1, #0x1a
_0804833A:
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, #0x3c
	bls _08048344
	adds r4, #1
_08048344:
	adds r2, #1
	cmp r2, #3
	ble _0804833A
	bl sub_80421E4
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08048362
	ldr r6, _08048368  @ gUnknown_085A92E0
	ldr r2, [r6]
	ldrb r0, [r2, #0x1e]
	cmp r0, #0x3c
	bhi _08048362
	cmp r4, #0
	beq _0804836C
_08048362:
	adds r0, r5, #0
	movs r1, #0
	b _080483A8
	.align 2, 0
_08048368: .4byte gUnknown_085A92E0
_0804836C:
	ldr r0, _080483B0  @ gUnknown_03004E80
	movs r1, #0x8c
	strb r1, [r0]
	ldrb r1, [r2, #6]
	strb r1, [r0, #1]
	ldrb r1, [r2]
	strh r1, [r0, #2]
	movs r1, #0xa
	bl sub_80422B8
	ldr r0, [r6]
	ldrb r0, [r0, #6]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _080483B4
	bl sub_80A6C1C
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080483B4
	mov r1, sp
	movs r0, #1
	strb r0, [r1]
	mov r0, sp
	movs r1, #4
	bl sub_80426F4
	adds r0, r5, #0
	movs r1, #3
_080483A8:
	bl nullsub_15
_080483AC:
	movs r0, #0
	b _080483EE
	.align 2, 0
_080483B0: .4byte gUnknown_03004E80
_080483B4:
	ldr r4, _080483E8  @ gUnknown_085A92E0
	ldr r2, [r4]
	ldrb r0, [r2, #9]
	movs r1, #3
	ands r1, r0
	cmp r1, #3
	bne _080483EC
	strb r1, [r2, #9]
	bl sub_8042AF4
	ldr r1, [r4]
	movs r2, #0
	movs r0, #6
	strh r0, [r1, #4]
	strb r2, [r1, #0x1e]
	ldr r0, [r4]
	ldrb r0, [r0, #6]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _080483AC
	adds r0, r5, #0
	movs r1, #1
	bl nullsub_15
	b _080483AC
	.align 2, 0
_080483E8: .4byte gUnknown_085A92E0
_080483EC:
	movs r0, #1
_080483EE:
	add sp, #4
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80482E0

	THUMB_FUNC_START sub_80483F8
sub_80483F8: @ 0x080483F8
	push {lr}
	adds r1, r0, #0
	ldr r0, _08048414  @ gUnknown_085A92E0
	ldr r0, [r0]
	ldrb r0, [r0, #9]
	cmp r0, #3
	bls _0804840E
	adds r0, r1, #0
	movs r1, #0
	bl nullsub_15
_0804840E:
	pop {r0}
	bx r0
	.align 2, 0
_08048414: .4byte gUnknown_085A92E0

	THUMB_FUNC_END sub_80483F8

	THUMB_FUNC_START sub_8048418
sub_8048418: @ 0x08048418
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	bl sub_8008A00
	cmp r0, #1
	bne _08048430
	ldr r1, _0804842C  @ gUnknown_0203DD8C
	movs r0, #0
	b _08048434
	.align 2, 0
_0804842C: .4byte gUnknown_0203DD8C
_08048430:
	ldr r1, _0804845C  @ gUnknown_0203DD8C
	movs r0, #1
_08048434:
	str r0, [r1]
	adds r4, r1, #0
	mov r0, sp
	ldr r1, [r4]
	strb r1, [r0]
	movs r1, #4
	bl sub_80426F4
	ldr r0, [r4]
	cmp r0, #0
	beq _08048452
	adds r0, r5, #0
	movs r1, #5
	bl nullsub_15
_08048452:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0804845C: .4byte gUnknown_0203DD8C

	THUMB_FUNC_END sub_8048418

	THUMB_FUNC_START sub_8048460
sub_8048460: @ 0x08048460
	push {r4, r5, lr}
	sub sp, #8
	adds r5, r0, #0
	movs r4, #0
	movs r1, #0
	ldr r0, _080484A8  @ gUnknown_085A92E0
	ldr r0, [r0]
	adds r2, r0, #0
	adds r2, #0x1a
_08048472:
	adds r0, r2, r1
	ldrb r0, [r0]
	cmp r0, #0x3c
	bls _0804847C
	adds r4, #1
_0804847C:
	adds r1, #1
	cmp r1, #3
	ble _08048472
	bl sub_80421E4
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0804849A
	ldr r0, _080484A8  @ gUnknown_085A92E0
	ldr r0, [r0]
	ldrb r0, [r0, #0x1e]
	cmp r0, #0x3c
	bhi _0804849A
	cmp r4, #0
	beq _080484AC
_0804849A:
	adds r0, r5, #0
	movs r1, #0
	bl nullsub_15
_080484A2:
	movs r0, #0
	b _080484D0
	.align 2, 0
_080484A8: .4byte gUnknown_085A92E0
_080484AC:
	add r1, sp, #4
	mov r0, sp
	movs r2, #0
	bl sub_804279C
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _080484CE
	mov r0, sp
	ldrb r0, [r0]
	cmp r0, #0
	beq _080484A2
	adds r0, r5, #0
	movs r1, #5
	bl nullsub_15
	b _080484A2
_080484CE:
	movs r0, #1
_080484D0:
	add sp, #8
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8048460

	THUMB_FUNC_START sub_80484D8
sub_80484D8: @ 0x080484D8
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	bl Text_Clear
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0
	adds r3, r5, #0
	bl Text_InsertString
	adds r0, r4, #0
	movs r1, #0x36
	movs r2, #2
	adds r3, r6, #0
	bl sub_8042DE8
	ldr r0, _0804851C  @ 0x000005AE
	bl GetStringFromIndex
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x3e
	movs r2, #0
	bl Text_InsertString
	ldr r1, _08048520  @ gUnknown_02022FC6
	adds r0, r4, #0
	bl Text_Draw
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0804851C: .4byte 0x000005AE
_08048520: .4byte gUnknown_02022FC6

	THUMB_FUNC_END sub_80484D8

	THUMB_FUNC_START sub_8048524
sub_8048524: @ 0x08048524
	push {r4, r5, lr}
	sub sp, #0xc
	adds r5, r0, #0
	adds r5, #0x3c
	adds r0, #0x3b
	ldrb r1, [r5]
	ldrb r0, [r0]
	cmp r1, r0
	bcs _0804857C
	ldr r0, _08048584  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08048548
	movs r0, #0x7d
	bl m4aSongNumStart
_08048548:
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
	ldr r0, _08048588  @ gUnknown_0203DA88
	ldr r1, _0804858C  @ gUnknown_080D9F18
	ldrb r2, [r5]
	bl sub_80484D8
	movs r0, #0x80
	lsls r0, r0, #1
	ldr r2, _08048590  @ gUnknown_02023084
	movs r3, #0xc0
	lsls r3, r3, #7
	movs r4, #0x64
	str r4, [sp]
	ldrb r1, [r5]
	str r1, [sp, #4]
	ldrb r1, [r5]
	subs r4, r4, r1
	str r4, [sp, #8]
	movs r1, #0xe
	bl sub_8086B2C
	movs r0, #1
	bl BG_EnableSyncByMask
_0804857C:
	add sp, #0xc
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08048584: .4byte gRAMChapterData
_08048588: .4byte gUnknown_0203DA88
_0804858C: .4byte gUnknown_080D9F18
_08048590: .4byte gUnknown_02023084

	THUMB_FUNC_END sub_8048524

	THUMB_FUNC_START sub_8048594
sub_8048594: @ 0x08048594
	push {r4, r5, lr}
	sub sp, #0xc
	adds r5, r0, #0
	adds r5, #0x3c
	adds r0, #0x3b
	ldrb r1, [r5]
	ldrb r0, [r0]
	cmp r1, r0
	bcs _080485EC
	ldr r0, _080485F4  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080485B8
	movs r0, #0x7d
	bl m4aSongNumStart
_080485B8:
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
	ldr r0, _080485F8  @ gUnknown_0203DA88
	ldr r1, _080485FC  @ gUnknown_080D9F20
	ldrb r2, [r5]
	bl sub_80484D8
	movs r0, #0x80
	lsls r0, r0, #1
	ldr r2, _08048600  @ gUnknown_02023084
	movs r3, #0xc0
	lsls r3, r3, #7
	movs r4, #0x64
	str r4, [sp]
	ldrb r1, [r5]
	str r1, [sp, #4]
	ldrb r1, [r5]
	subs r4, r4, r1
	str r4, [sp, #8]
	movs r1, #0xe
	bl sub_8086B2C
	movs r0, #1
	bl BG_EnableSyncByMask
_080485EC:
	add sp, #0xc
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080485F4: .4byte gRAMChapterData
_080485F8: .4byte gUnknown_0203DA88
_080485FC: .4byte gUnknown_080D9F20
_08048600: .4byte gUnknown_02023084

	THUMB_FUNC_END sub_8048594

	THUMB_FUNC_START sub_8048604
sub_8048604: @ 0x08048604
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	ldr r0, _08048648  @ gUnknown_0203DB64
	bl SetFont
	bl Font_LoadForUI
	ldr r0, _0804864C  @ gUnknown_085A92E0
	ldr r0, [r0]
	ldrb r0, [r0, #6]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _08048660
	ldr r1, _08048650  @ ReadSramFast
	ldr r0, _08048654  @ 0x0E007400
	ldr r4, _08048658  @ gUnknown_02000000
	movs r5, #0xc0
	lsls r5, r5, #4
	ldr r3, [r1]
	adds r1, r4, #0
	adds r2, r5, #0
	bl _call_via_r3
	ldr r2, _0804865C  @ sub_8048524
	str r6, [sp]
	adds r0, r4, #0
	adds r1, r5, #0
	movs r3, #0
	bl sub_8042CF0
	b _0804866A
	.align 2, 0
_08048648: .4byte gUnknown_0203DB64
_0804864C: .4byte gUnknown_085A92E0
_08048650: .4byte ReadSramFast
_08048654: .4byte 0x0E007400
_08048658: .4byte gUnknown_02000000
_0804865C: .4byte sub_8048524
_08048660:
	ldr r0, _08048674  @ gUnknown_02000000
	ldr r1, _08048678  @ sub_8048594
	adds r2, r6, #0
	bl sub_8042D70
_0804866A:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08048674: .4byte gUnknown_02000000
_08048678: .4byte sub_8048594

	THUMB_FUNC_END sub_8048604

	THUMB_FUNC_START sub_804867C
sub_804867C: @ 0x0804867C
	push {lr}
	bl sub_8042D9C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0804868C
	movs r0, #1
	b _080486BE
_0804868C:
	ldr r0, _080486C4  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0804869E
	movs r0, #0x7e
	bl m4aSongNumStart
_0804869E:
	bl Font_LoadForDialogue
	ldr r0, _080486C8  @ gUnknown_085A92E0
	ldr r0, [r0]
	ldrb r0, [r0, #6]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _080486BC
	ldr r0, _080486CC  @ gUnknown_02000000
	ldr r1, _080486D0  @ 0x0E007400
	movs r2, #0xc0
	lsls r2, r2, #4
	bl WriteAndVerifySramFast
_080486BC:
	movs r0, #0
_080486BE:
	pop {r1}
	bx r1
	.align 2, 0
_080486C4: .4byte gRAMChapterData
_080486C8: .4byte gUnknown_085A92E0
_080486CC: .4byte gUnknown_02000000
_080486D0: .4byte 0x0E007400

	THUMB_FUNC_END sub_804867C

	THUMB_FUNC_START sub_80486D4
sub_80486D4: @ 0x080486D4
	ldr r0, _080486E4  @ gUnknown_085A92E0
	ldr r2, [r0]
	movs r1, #6
	ldrsb r1, [r2, r1]
	movs r0, #1
	lsls r0, r1
	strb r0, [r2, #0xa]
	bx lr
	.align 2, 0
_080486E4: .4byte gUnknown_085A92E0

	THUMB_FUNC_END sub_80486D4

	THUMB_FUNC_START sub_80486E8
sub_80486E8: @ 0x080486E8
	push {r4, lr}
	ldr r0, _08048714  @ gUnknown_03004F0C
	movs r2, #0
	movs r1, #0x89
	strb r1, [r0]
	ldr r4, _08048718  @ gUnknown_085A92E0
	ldr r1, [r4]
	ldrb r1, [r1, #6]
	strb r1, [r0, #1]
	strh r2, [r0, #2]
	movs r1, #4
	bl sub_80422B8
	ldr r4, [r4]
	ldrb r0, [r4, #0xa]
	ldrb r1, [r4, #9]
	ands r0, r1
	cmp r0, r1
	beq _0804871C
	movs r0, #1
	b _08048728
	.align 2, 0
_08048714: .4byte gUnknown_03004F0C
_08048718: .4byte gUnknown_085A92E0
_0804871C:
	movs r1, #6
	ldrsb r1, [r4, r1]
	movs r0, #1
	lsls r0, r1
	strb r0, [r4, #0xa]
	movs r0, #0
_08048728:
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80486E8

	THUMB_FUNC_START sub_8048730
sub_8048730: @ 0x08048730
	push {r4, r5, lr}
	sub sp, #0xc
	movs r0, #6
	bl UnpackUiBarPalette
	movs r5, #0
	str r5, [sp]
	movs r0, #0xd
	movs r1, #0xb
	movs r2, #0x10
	movs r3, #6
	bl DrawUiFrame2
	ldr r0, _0804878C  @ gUnknown_0203DB64
	bl SetFont
	bl Font_LoadForUI
	ldr r4, _08048790  @ gUnknown_0203DA88
	ldr r0, _08048794  @ 0x0000077E
	bl GetStringFromIndex
	adds r1, r0, #0
	adds r0, r4, #0
	movs r2, #0
	bl sub_80484D8
	movs r0, #0x80
	lsls r0, r0, #1
	ldr r2, _08048798  @ gUnknown_02023084
	movs r3, #0xc0
	lsls r3, r3, #7
	movs r1, #0x64
	str r1, [sp]
	str r5, [sp, #4]
	str r1, [sp, #8]
	movs r1, #0xd
	bl sub_8086B2C
	movs r0, #1
	bl BG_EnableSyncByMask
	add sp, #0xc
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0804878C: .4byte gUnknown_0203DB64
_08048790: .4byte gUnknown_0203DA88
_08048794: .4byte 0x0000077E
_08048798: .4byte gUnknown_02023084

	THUMB_FUNC_END sub_8048730

	THUMB_FUNC_START sub_804879C
sub_804879C: @ 0x0804879C
	ldr r2, _080487BC  @ gLCDControlBuffer
	adds r2, #0x36
	ldrb r0, [r2]
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
	strb r0, [r2]
	bx lr
	.align 2, 0
_080487BC: .4byte gLCDControlBuffer

	THUMB_FUNC_END sub_804879C

	THUMB_FUNC_START sub_80487C0
sub_80487C0: @ 0x080487C0
	push {r4, r5, lr}
	ldr r4, [r0, #0x14]
	movs r0, #3
	bl DeleteFaceByIndex
	adds r5, r4, #0
	adds r5, #0x2c
	movs r4, #4
_080487D0:
	ldm r5!, {r0}
	bl Proc_End
	subs r4, #1
	cmp r4, #0
	bge _080487D0
	bl sub_804C33C
	movs r0, #0
	movs r1, #0
	bl sub_804C3A0
	ldr r0, _08048810  @ gUnknown_085A92E0
	ldr r1, [r0]
	movs r0, #3
	strb r0, [r1]
	ldr r0, _08048814  @ gUnknown_0203DB64
	bl SetFont
	bl Font_LoadForUI
	ldr r0, _08048818  @ gUnknown_0203DA88
	movs r1, #0xa
	bl Text_Allocate
	movs r0, #1
	bl Sound_FadeOut800231C
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08048810: .4byte gUnknown_085A92E0
_08048814: .4byte gUnknown_0203DB64
_08048818: .4byte gUnknown_0203DA88

	THUMB_FUNC_END sub_80487C0

	THUMB_FUNC_START sub_804881C
sub_804881C: @ 0x0804881C
	push {lr}
	bl sub_8043044
	bl sub_8045CBC
	bl sub_8045CE0
	bl sub_8041898
	bl sub_80A6AA0
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_804881C

	THUMB_FUNC_START sub_8048838
sub_8048838: @ 0x08048838
	push {lr}
	bl sub_80A2DE4
	bl sub_80A39B4
	bl sub_80A3E28
	bl sub_80A3F84
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8048838

	THUMB_FUNC_START sub_8048850
sub_8048850: @ 0x08048850
	push {lr}
	ldr r0, _08048860  @ gUnknown_085A9F48
	movs r1, #3
	bl CallEvent
	pop {r0}
	bx r0
	.align 2, 0
_08048860: .4byte gUnknown_085A9F48

	THUMB_FUNC_END sub_8048850

	THUMB_FUNC_START sub_8048864
sub_8048864: @ 0x08048864
	push {lr}
	sub sp, #4
	ldr r3, _08048880  @ gUnknown_085A9F98
	movs r0, #0
	str r0, [sp]
	movs r0, #4
	movs r1, #0x38
	movs r2, #4
	bl PutSprite
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_08048880: .4byte gUnknown_085A9F98

	THUMB_FUNC_END sub_8048864

	THUMB_FUNC_START sub_8048884
sub_8048884: @ 0x08048884
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	ldr r0, _080488C8  @ gUnknown_0203DA24
	adds r1, r0, #0
	adds r1, #0xa0
	ldrb r3, [r1]
	adds r0, #0xec
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080488D0
	movs r6, #0
	cmp r6, r3
	bge _0804892A
	ldr r4, _080488CC  @ gUnknown_0203DD9F
	adds r5, r4, #5
	mov r2, r8
_080488AC:
	adds r1, r6, r4
	ldrb r0, [r1]
	strb r0, [r2]
	ldrb r0, [r1]
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r0, [r0]
	str r0, [r2, #4]
	adds r2, #8
	adds r6, #1
	cmp r6, r3
	blt _080488AC
	b _0804892A
	.align 2, 0
_080488C8: .4byte gUnknown_0203DA24
_080488CC: .4byte gUnknown_0203DD9F
_080488D0:
	movs r6, #0
	subs r0, r3, #2
	mov ip, r0
	cmp r6, r3
	bge _080488F0
	ldr r0, _080488F4  @ gUnknown_0203DD90
	adds r2, r0, #0
	adds r2, #0x14
	mov r1, r8
_080488E2:
	strb r6, [r1]
	ldm r2!, {r0}
	str r0, [r1, #4]
	adds r1, #8
	adds r6, #1
	cmp r6, r3
	blt _080488E2
_080488F0:
	movs r6, #0
	b _08048924
	.align 2, 0
_080488F4: .4byte gUnknown_0203DD90
_080488F8:
	adds r5, r0, #0
	adds r7, r6, #1
	cmp r0, r6
	blt _08048922
	lsls r0, r0, #3
	mov r1, r8
	adds r2, r0, r1
_08048906:
	ldr r4, [r2, #4]
	ldr r3, [r2, #0xc]
	cmp r4, r3
	bcs _0804891A
	ldrb r1, [r2]
	ldrb r0, [r2, #8]
	strb r0, [r2]
	strb r1, [r2, #8]
	str r3, [r2, #4]
	str r4, [r2, #0xc]
_0804891A:
	subs r2, #8
	subs r5, #1
	cmp r5, r6
	bge _08048906
_08048922:
	adds r6, r7, #0
_08048924:
	mov r0, ip
	cmp r6, r0
	ble _080488F8
_0804892A:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8048884

	THUMB_FUNC_START sub_8048934
sub_8048934: @ 0x08048934
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r5, r1, #0
	lsls r0, r2, #5
	adds r0, r0, r5
	lsls r0, r0, #1
	ldr r1, _08048980  @ gBG1TilemapBuffer
	adds r0, r0, r1
	movs r1, #0
	adds r4, r2, #1
_08048948:
	adds r2, r1, #1
	movs r1, #5
_0804894C:
	strh r3, [r0]
	adds r0, #2
	adds r3, #1
	subs r1, #1
	cmp r1, #0
	bge _0804894C
	adds r0, #0x34
	adds r1, r2, #0
	cmp r1, #3
	ble _08048948
	adds r0, r6, #0
	bl Text_Clear
	lsls r0, r4, #5
	adds r0, #4
	adds r0, r0, r5
	lsls r0, r0, #1
	ldr r1, _08048984  @ gBG0TilemapBuffer
	adds r0, r0, r1
	movs r1, #2
	ldr r2, [sp, #0x10]
	bl sub_8004B88
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08048980: .4byte gBG1TilemapBuffer
_08048984: .4byte gBG0TilemapBuffer

	THUMB_FUNC_END sub_8048934

	THUMB_FUNC_START sub_8048988
sub_8048988: @ 0x08048988
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, _08048A48  @ gUnknown_085AD80C
	ldr r1, _08048A4C  @ 0x06002800
	bl CopyDataWithPossibleUncomp
	ldr r0, _08048A50  @ gUnknown_085ADC48
	movs r1, #0x40
	movs r2, #0x80
	bl CopyToPaletteBuffer
	movs r0, #0
	bl SetFont
	bl sub_8003D20
	movs r0, #0
	mov r9, r0
	ldr r0, _08048A54  @ gUnknown_080D9F28
	mov sl, r0
	adds r6, r4, #0
	adds r6, #0x2c
	ldr r7, _08048A58  @ gUnknown_080D9F98
_080489C0:
	ldr r0, _08048A5C  @ gUnknown_085A92E0
	ldr r0, [r0]
	ldrb r0, [r0, #6]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #2
	add r0, r9
	add r0, sl
	ldrb r5, [r0]
	adds r0, r5, #0
	bl sub_8042194
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08048A24
	ldr r0, _08048A60  @ gUnknown_0203DD90
	mov r8, r0
	adds r0, #0xa
	adds r0, r5, r0
	ldrb r0, [r0]
	adds r4, r5, #2
	cmp r0, #0
	bne _080489F8
	lsls r1, r4, #5
	ldr r0, _08048A64  @ gUnknown_085ADDA8
	movs r2, #0x20
	bl CopyToPaletteBuffer
_080489F8:
	movs r0, #0xf
	ands r4, r0
	lsls r4, r4, #0xc
	movs r0, #0xa0
	lsls r0, r0, #1
	adds r4, r4, r0
	adds r0, r6, #0
	movs r1, #4
	bl Text_Allocate
	ldrb r1, [r7]
	ldrb r2, [r7, #1]
	lsls r0, r5, #2
	mov r3, r8
	adds r3, #0x14
	adds r0, r0, r3
	ldr r0, [r0]
	str r0, [sp]
	adds r0, r6, #0
	adds r3, r4, #0
	bl sub_8048934
_08048A24:
	adds r6, #8
	adds r7, #2
	movs r0, #1
	add r9, r0
	mov r0, r9
	cmp r0, #3
	ble _080489C0
	movs r0, #3
	bl BG_EnableSyncByMask
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08048A48: .4byte gUnknown_085AD80C
_08048A4C: .4byte 0x06002800
_08048A50: .4byte gUnknown_085ADC48
_08048A54: .4byte gUnknown_080D9F28
_08048A58: .4byte gUnknown_080D9F98
_08048A5C: .4byte gUnknown_085A92E0
_08048A60: .4byte gUnknown_0203DD90
_08048A64: .4byte gUnknown_085ADDA8

	THUMB_FUNC_END sub_8048988

	THUMB_FUNC_START nullsub_43
nullsub_43: @ 0x08048A68
	bx lr

	THUMB_FUNC_END nullsub_43

	THUMB_FUNC_START sub_8048A6C
sub_8048A6C: @ 0x08048A6C
	push {lr}
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	ldr r0, _08048A90  @ gUnknown_085AA06C
	movs r1, #3
	bl Proc_Start
	pop {r0}
	bx r0
	.align 2, 0
_08048A90: .4byte gUnknown_085AA06C

	THUMB_FUNC_END sub_8048A6C

	THUMB_FUNC_START sub_8048A94
sub_8048A94: @ 0x08048A94
	push {lr}
	ldr r0, _08048AA4  @ gUnknown_085AA06C
	bl Proc_EndEach
	bl ClearBg0Bg1
	pop {r0}
	bx r0
	.align 2, 0
_08048AA4: .4byte gUnknown_085AA06C

	THUMB_FUNC_END sub_8048A94

	THUMB_FUNC_START sub_8048AA8
sub_8048AA8: @ 0x08048AA8
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r0, #0x33
	ldrb r0, [r0]
	bl GetUnit
	adds r4, r0, #0
	ldr r1, _08048AFC  @ gUnknown_080D9F38
	adds r2, r5, #0
	adds r2, #0x32
	ldr r0, _08048B00  @ gUnknown_085A92E0
	ldr r0, [r0]
	ldrb r0, [r0, #6]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #2
	ldrb r2, [r2]
	adds r0, r0, r2
	adds r0, r0, r1
	ldrb r2, [r0]
	adds r0, r5, #0
	adds r0, #0x40
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _08048B04
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	cmp r0, #8
	beq _08048AEA
	movs r0, #0x10
	ldrsb r0, [r4, r0]
_08048AEA:
	lsls r0, r0, #4
	subs r0, #0x10
	strh r0, [r5, #0x2a]
	movs r0, #0x11
	ldrsb r0, [r4, r0]
	lsls r0, r0, #4
	strh r0, [r5, #0x2c]
	lsls r2, r2, #1
	b _08048B2C
	.align 2, 0
_08048AFC: .4byte gUnknown_080D9F38
_08048B00: .4byte gUnknown_085A92E0
_08048B04:
	movs r1, #0x10
	ldrsb r1, [r4, r1]
	lsls r1, r1, #4
	ldr r3, _08048B68  @ gUnknown_085AA084
	lsls r0, r2, #3
	adds r0, r0, r3
	ldr r0, [r0]
	adds r0, r0, r1
	subs r0, #0xc
	strh r0, [r5, #0x2a]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	lsls r1, r1, #4
	lsls r2, r2, #1
	adds r0, r2, #1
	lsls r0, r0, #2
	adds r0, r0, r3
	ldr r0, [r0]
	adds r0, r0, r1
	strh r0, [r5, #0x2c]
_08048B2C:
	ldr r1, _08048B6C  @ gUnknown_080D9F98
	adds r0, r2, r1
	ldrb r0, [r0]
	lsls r0, r0, #3
	adds r0, #8
	movs r4, #0
	strh r0, [r5, #0x2e]
	adds r0, r2, #1
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #3
	adds r0, #8
	strh r0, [r5, #0x30]
	ldr r0, _08048B70  @ gUnknown_02000C60
	bl SetFont
	ldr r0, _08048B74  @ gUnknown_02000C78
	adds r1, r5, #0
	adds r1, #0x32
	ldrb r1, [r1]
	lsls r1, r1, #5
	adds r1, #0x18
	ldr r3, [r5, #0x34]
	movs r2, #2
	bl sub_8042DE8
	str r4, [r5, #0x3c]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08048B68: .4byte gUnknown_085AA084
_08048B6C: .4byte gUnknown_080D9F98
_08048B70: .4byte gUnknown_02000C60
_08048B74: .4byte gUnknown_02000C78

	THUMB_FUNC_END sub_8048AA8

	THUMB_FUNC_START sub_8048B78
sub_8048B78: @ 0x08048B78
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r7, r0, #0
	adds r0, #0x33
	ldrb r0, [r0]
	bl GetUnit
	str r0, [sp, #4]
	ldr r3, [r7, #0x3c]
	cmp r3, #0x10
	bhi _08048C0C
	movs r0, #0x80
	lsls r0, r0, #1
	mov r8, r0
	movs r0, #0x10
	str r0, [sp]
	movs r0, #1
	movs r1, #0x10
	mov r2, r8
	bl sub_8012DCC
	mov sl, r0
	ldr r4, _08048C40  @ gSinLookup
	movs r1, #0x80
	adds r1, r1, r4
	mov r9, r1
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #4
	mov r1, r8
	bl Div
	adds r6, r0, #0
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	movs r1, #0
	ldrsh r0, [r4, r1]
	negs r0, r0
	lsls r0, r0, #4
	mov r1, sl
	bl Div
	adds r5, r0, #0
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	movs r2, #0
	ldrsh r0, [r4, r2]
	lsls r0, r0, #4
	mov r1, r8
	bl Div
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	mov r1, r9
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #4
	mov r1, sl
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	movs r0, #0
	adds r1, r6, #0
	adds r2, r5, #0
	adds r3, r4, #0
	bl WriteOAMRotScaleData
_08048C0C:
	adds r0, r7, #0
	adds r0, #0x40
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _08048C64
	ldr r1, [r7, #0x3c]
	cmp r1, #3
	bls _08048C64
	cmp r1, #0x16
	bhi _08048C64
	subs r2, r1, #4
	ldr r4, [sp, #4]
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	cmp r0, #8
	bne _08048C48
	ldr r0, _08048C44  @ gUnknown_085AA0A4
	lsls r1, r2, #1
	adds r0, r1, r0
	ldrh r0, [r0]
	ldrh r2, [r7, #0x2a]
	adds r0, r0, r2
	strh r0, [r7, #0x2a]
	b _08048C58
	.align 2, 0
_08048C40: .4byte gSinLookup
_08048C44: .4byte gUnknown_085AA0A4
_08048C48:
	ldr r1, _08048CA8  @ gUnknown_085AA0A4
	lsls r2, r2, #1
	adds r1, r2, r1
	ldrh r0, [r7, #0x2a]
	ldrh r1, [r1]
	subs r0, r0, r1
	strh r0, [r7, #0x2a]
	adds r1, r2, #0
_08048C58:
	ldr r0, _08048CAC  @ gUnknown_085AA0CA
	adds r0, r1, r0
	ldrh r1, [r7, #0x2c]
	ldrh r0, [r0]
	subs r1, r1, r0
	strh r1, [r7, #0x2c]
_08048C64:
	movs r4, #0x2a
	ldrsh r0, [r7, r4]
	movs r2, #0x2c
	ldrsh r1, [r7, r2]
	movs r4, #0x80
	lsls r4, r4, #1
	adds r1, r1, r4
	ldr r2, _08048CB0  @ gObject_32x16
	adds r3, r7, #0
	adds r3, #0x32
	ldrb r3, [r3]
	lsls r3, r3, #2
	ldr r4, _08048CB4  @ 0x00009340
	adds r3, r3, r4
	bl CallARM_PushToSecondaryOAM
	ldr r0, [r7, #0x3c]
	adds r0, #1
	str r0, [r7, #0x3c]
	cmp r0, #0x40
	bls _08048C98
	movs r0, #0
	str r0, [r7, #0x3c]
	adds r0, r7, #0
	bl Proc_Break
_08048C98:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08048CA8: .4byte gUnknown_085AA0A4
_08048CAC: .4byte gUnknown_085AA0CA
_08048CB0: .4byte gObject_32x16
_08048CB4: .4byte 0x00009340

	THUMB_FUNC_END sub_8048B78

	THUMB_FUNC_START sub_8048CB8
sub_8048CB8: @ 0x08048CB8
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	movs r0, #0x2a
	ldrsh r1, [r6, r0]
	movs r0, #0x2e
	ldrsh r2, [r6, r0]
	ldr r3, [r6, #0x3c]
	movs r4, #0x30
	str r4, [sp]
	movs r0, #5
	bl sub_8012DCC
	adds r5, r0, #0
	movs r0, #0x2c
	ldrsh r1, [r6, r0]
	movs r0, #0x30
	ldrsh r2, [r6, r0]
	ldr r3, [r6, #0x3c]
	str r4, [sp]
	movs r0, #5
	bl sub_8012DCC
	adds r1, r0, #0
	ldr r2, _08048D14  @ gObject_32x16
	adds r0, r6, #0
	adds r0, #0x32
	ldrb r3, [r0]
	lsls r3, r3, #2
	ldr r0, _08048D18  @ 0x00009340
	adds r3, r3, r0
	adds r0, r5, #0
	bl CallARM_PushToSecondaryOAM
	ldr r0, [r6, #0x3c]
	adds r0, #1
	str r0, [r6, #0x3c]
	cmp r0, #0x20
	bls _08048D0C
	adds r0, r6, #0
	bl Proc_Break
_08048D0C:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08048D14: .4byte gObject_32x16
_08048D18: .4byte 0x00009340

	THUMB_FUNC_END sub_8048CB8

	THUMB_FUNC_START sub_8048D1C
sub_8048D1C: @ 0x08048D1C
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r5, r0, #0
	mov r8, r1
	adds r4, r2, #0
	adds r6, r3, #0
	bl Text_Clear
	adds r0, r5, #0
	movs r1, #0x18
	movs r2, #2
	adds r3, r6, #0
	bl sub_8042DE8
	adds r4, #1
	lsls r4, r4, #5
	adds r4, #1
	add r4, r8
	lsls r4, r4, #1
	ldr r0, _08048D60  @ gBG0TilemapBuffer
	adds r4, r4, r0
	adds r0, r5, #0
	adds r1, r4, #0
	bl Text_Draw
	movs r0, #1
	bl BG_EnableSyncByMask
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08048D60: .4byte gBG0TilemapBuffer

	THUMB_FUNC_END sub_8048D1C

	THUMB_FUNC_START sub_8048D64
sub_8048D64: @ 0x08048D64
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r1, _08048DC4  @ gUnknown_080D9F38
	adds r2, r6, #0
	adds r2, #0x32
	ldr r0, _08048DC8  @ gUnknown_085A92E0
	ldr r0, [r0]
	ldrb r0, [r0, #6]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #2
	ldrb r2, [r2]
	adds r0, r0, r2
	adds r0, r0, r1
	ldrb r0, [r0]
	ldr r2, _08048DCC  @ gUnknown_080D9F98
	lsls r0, r0, #1
	adds r1, r0, r2
	ldrb r1, [r1]
	movs r5, #0
	strh r1, [r6, #0x2a]
	adds r0, #1
	adds r0, r0, r2
	ldrb r0, [r0]
	strh r0, [r6, #0x2c]
	movs r0, #0
	bl SetFont
	adds r0, r6, #0
	adds r0, #0x48
	movs r2, #0x2a
	ldrsh r1, [r6, r2]
	movs r3, #0x2c
	ldrsh r2, [r6, r3]
	ldr r3, [r6, #0x38]
	ldr r4, [r6, #0x34]
	subs r3, r3, r4
	bl sub_8048D1C
	str r5, [r6, #0x3c]
	ldr r0, [r6, #0x38]
	ldr r1, [r6, #0x34]
	subs r0, r0, r1
	str r0, [r6, #0x44]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08048DC4: .4byte gUnknown_080D9F38
_08048DC8: .4byte gUnknown_085A92E0
_08048DCC: .4byte gUnknown_080D9F98

	THUMB_FUNC_END sub_8048D64

	THUMB_FUNC_START sub_8048DD0
sub_8048DD0: @ 0x08048DD0
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r2, [r4, #0x38]
	ldr r1, [r4, #0x34]
	subs r1, r2, r1
	ldr r3, [r4, #0x3c]
	movs r0, #0xa
	str r0, [sp]
	movs r0, #0
	bl sub_8012DCC
	adds r5, r0, #0
	movs r0, #0
	bl SetFont
	adds r0, r4, #0
	adds r0, #0x48
	movs r2, #0x2a
	ldrsh r1, [r4, r2]
	movs r3, #0x2c
	ldrsh r2, [r4, r3]
	adds r3, r5, #0
	bl sub_8048D1C
	ldr r0, [r4, #0x44]
	cmp r0, r5
	beq _08048E2E
	adds r0, r4, #0
	adds r0, #0x32
	ldrb r1, [r0]
	ldr r0, _08048E60  @ gUnknown_085A92E0
	ldr r0, [r0]
	ldrb r0, [r0, #6]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r1, r0
	bne _08048E2E
	ldr r0, _08048E64  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08048E2E
	movs r0, #0x80
	bl m4aSongNumStart
_08048E2E:
	str r5, [r4, #0x44]
	ldr r0, [r4, #0x3c]
	adds r0, #1
	str r0, [r4, #0x3c]
	cmp r0, #0xa
	bls _08048E56
	movs r0, #0
	str r0, [r4, #0x3c]
	ldr r1, _08048E68  @ gUnknown_0203DD90
	adds r0, r4, #0
	adds r0, #0x32
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r1, #0x14
	adds r0, r0, r1
	ldr r1, [r4, #0x38]
	str r1, [r0]
	adds r0, r4, #0
	bl Proc_Break
_08048E56:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08048E60: .4byte gUnknown_085A92E0
_08048E64: .4byte gRAMChapterData
_08048E68: .4byte gUnknown_0203DD90

	THUMB_FUNC_END sub_8048DD0

	THUMB_FUNC_START sub_8048E6C
sub_8048E6C: @ 0x08048E6C
	push {lr}
	adds r1, r0, #0
	ldr r0, [r1, #0x3c]
	adds r0, #1
	str r0, [r1, #0x3c]
	cmp r0, #0x14
	bls _08048E80
	adds r0, r1, #0
	bl Proc_Break
_08048E80:
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8048E6C

	THUMB_FUNC_START sub_8048E84
sub_8048E84: @ 0x08048E84
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08048EB0  @ gUnknown_02000C60
	bl SetFont
	ldr r1, [r4, #0x54]
	movs r0, #0x50
	bl GetStringTextCenteredPos
	adds r1, r0, #0
	ldr r0, _08048EB4  @ gUnknown_02000C78
	adds r1, #0x80
	ldr r3, [r4, #0x54]
	movs r2, #0
	bl Text_InsertString
	adds r4, #0x4c
	movs r0, #0
	strh r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08048EB0: .4byte gUnknown_02000C60
_08048EB4: .4byte gUnknown_02000C78

	THUMB_FUNC_END sub_8048E84

	THUMB_FUNC_START sub_8048EB8
sub_8048EB8: @ 0x08048EB8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r7, r0, #0
	movs r0, #0x4c
	adds r0, r0, r7
	mov r9, r0
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0x10
	bgt _08048F4A
	movs r2, #0x80
	lsls r2, r2, #1
	mov r8, r2
	mov r0, r9
	movs r1, #0
	ldrsh r3, [r0, r1]
	movs r0, #0x10
	str r0, [sp]
	movs r0, #1
	movs r1, #0x10
	bl sub_8012DCC
	mov sl, r0
	ldr r4, _08048FB8  @ gSinLookup
	ldr r2, _08048FBC  @ gCosLookup
	movs r1, #0
	ldrsh r0, [r2, r1]
	lsls r0, r0, #4
	mov r1, r8
	bl Div
	adds r6, r0, #0
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	movs r2, #0
	ldrsh r0, [r4, r2]
	negs r0, r0
	lsls r0, r0, #4
	mov r1, sl
	bl Div
	adds r5, r0, #0
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	movs r1, #0
	ldrsh r0, [r4, r1]
	lsls r0, r0, #4
	mov r1, r8
	bl Div
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	ldr r2, _08048FBC  @ gCosLookup
	movs r1, #0
	ldrsh r0, [r2, r1]
	lsls r0, r0, #4
	mov r1, sl
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	movs r0, #1
	adds r1, r6, #0
	adds r2, r5, #0
	adds r3, r4, #0
	bl WriteOAMRotScaleData
_08048F4A:
	ldr r0, [r7, #0x2c]
	movs r2, #0x80
	lsls r2, r2, #2
	adds r0, r0, r2
	ldr r1, [r7, #0x30]
	movs r4, #0x80
	lsls r4, r4, #1
	adds r1, r1, r4
	ldr r5, _08048FC0  @ gObject_32x16
	ldr r3, _08048FC4  @ 0x00009350
	adds r2, r5, #0
	bl CallARM_PushToSecondaryOAM
	ldr r0, [r7, #0x2c]
	movs r1, #0x88
	lsls r1, r1, #2
	adds r0, r0, r1
	ldr r1, [r7, #0x30]
	adds r1, r1, r4
	ldr r3, _08048FC8  @ 0x00009354
	adds r2, r5, #0
	bl CallARM_PushToSecondaryOAM
	ldr r0, [r7, #0x2c]
	movs r2, #0x90
	lsls r2, r2, #2
	adds r0, r0, r2
	ldr r1, [r7, #0x30]
	adds r1, r1, r4
	ldr r2, _08048FCC  @ gObject_16x16
	ldr r3, _08048FD0  @ 0x00009358
	bl CallARM_PushToSecondaryOAM
	mov r1, r9
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x40
	ble _08048FA6
	movs r0, #0
	strh r0, [r1]
	adds r0, r7, #0
	bl Proc_Break
_08048FA6:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08048FB8: .4byte gSinLookup
_08048FBC: .4byte gCosLookup
_08048FC0: .4byte gObject_32x16
_08048FC4: .4byte 0x00009350
_08048FC8: .4byte 0x00009354
_08048FCC: .4byte gObject_16x16
_08048FD0: .4byte 0x00009358

	THUMB_FUNC_END sub_8048EB8

	THUMB_FUNC_START sub_8048FD4
sub_8048FD4: @ 0x08048FD4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r7, r0, #0
	adds r0, #0x4c
	str r0, [sp, #4]
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0x10
	bgt _0804906A
	movs r2, #0x80
	lsls r2, r2, #1
	mov r8, r2
	ldr r0, [sp, #4]
	movs r1, #0
	ldrsh r3, [r0, r1]
	movs r0, #0x10
	str r0, [sp]
	movs r0, #4
	mov r1, r8
	movs r2, #0x10
	bl sub_8012DCC
	mov sl, r0
	ldr r4, _080490D4  @ gSinLookup
	movs r2, #0x80
	adds r2, r2, r4
	mov r9, r2
	movs r1, #0
	ldrsh r0, [r2, r1]
	lsls r0, r0, #4
	mov r1, r8
	bl Div
	adds r6, r0, #0
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	movs r2, #0
	ldrsh r0, [r4, r2]
	negs r0, r0
	lsls r0, r0, #4
	mov r1, sl
	bl Div
	adds r5, r0, #0
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	movs r1, #0
	ldrsh r0, [r4, r1]
	lsls r0, r0, #4
	mov r1, r8
	bl Div
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	mov r2, r9
	movs r1, #0
	ldrsh r0, [r2, r1]
	lsls r0, r0, #4
	mov r1, sl
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	movs r0, #1
	adds r1, r6, #0
	adds r2, r5, #0
	adds r3, r4, #0
	bl WriteOAMRotScaleData
_0804906A:
	ldr r0, [r7, #0x2c]
	movs r2, #0x80
	lsls r2, r2, #2
	adds r0, r0, r2
	ldr r1, [r7, #0x30]
	movs r4, #0x80
	lsls r4, r4, #1
	adds r1, r1, r4
	ldr r5, _080490D8  @ gObject_32x16
	ldr r3, _080490DC  @ 0x00009350
	adds r2, r5, #0
	bl CallARM_PushToSecondaryOAM
	ldr r0, [r7, #0x2c]
	movs r1, #0x88
	lsls r1, r1, #2
	adds r0, r0, r1
	ldr r1, [r7, #0x30]
	adds r1, r1, r4
	ldr r3, _080490E0  @ 0x00009354
	adds r2, r5, #0
	bl CallARM_PushToSecondaryOAM
	ldr r0, [r7, #0x2c]
	movs r2, #0x90
	lsls r2, r2, #2
	adds r0, r0, r2
	ldr r1, [r7, #0x30]
	adds r1, r1, r4
	ldr r2, _080490E4  @ gObject_16x16
	ldr r3, _080490E8  @ 0x00009358
	bl CallARM_PushToSecondaryOAM
	ldr r1, [sp, #4]
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x10
	ble _080490C2
	adds r0, r7, #0
	bl Proc_Break
_080490C2:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080490D4: .4byte gSinLookup
_080490D8: .4byte gObject_32x16
_080490DC: .4byte 0x00009350
_080490E0: .4byte 0x00009354
_080490E4: .4byte gObject_16x16
_080490E8: .4byte 0x00009358

	THUMB_FUNC_END sub_8048FD4

	THUMB_FUNC_START sub_80490EC
sub_80490EC: @ 0x080490EC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	str r2, [sp, #0x10]
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	mov r9, r3
	movs r0, #0
	mov sl, r0
	ldr r0, _080491C4  @ gUnknown_0859EF00
	movs r1, #0xc8
	lsls r1, r1, #2
	movs r2, #0x20
	bl CopyToPaletteBuffer
	ldr r0, _080491C8  @ gUnknown_02000C60
	ldr r1, _080491CC  @ 0x06016800
	movs r2, #3
	bl InitSomeOtherGraphicsRelatedStruct
	movs r0, #0
	bl SetFontGlyphSet
	bl sub_8003D20
	ldr r4, _080491D0  @ gUnknown_02000C78
	adds r0, r4, #0
	bl Text_Init3
	adds r0, r4, #0
	movs r1, #0
	bl Text_80046B4
	movs r0, #0
	bl SetFont
	movs r1, #0
	mov r8, r1
_08049142:
	ldr r0, _080491D4  @ gUnknown_085A92E0
	ldr r0, [r0]
	ldrb r0, [r0, #6]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #2
	add r0, r8
	ldr r1, _080491D8  @ gUnknown_080D9F38
	adds r0, r0, r1
	ldrb r4, [r0]
	adds r0, r4, #0
	bl sub_8042194
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080491F0
	ldr r6, _080491DC  @ gUnknown_0203DD90
	lsls r5, r4, #3
	adds r0, r6, #0
	adds r0, #0x30
	adds r7, r5, r0
	ldr r0, [r7]
	cmp r0, #0
	beq _080491E8
	ldr r0, _080491E0  @ gUnknown_085AA0F0
	ldr r1, [sp, #0x34]
	bl Proc_StartBlocking
	adds r2, r0, #0
	adds r0, #0x32
	strb r4, [r0]
	adds r0, r5, r6
	adds r0, #0x2c
	ldrb r0, [r0]
	adds r1, r2, #0
	adds r1, #0x33
	strb r0, [r1]
	lsls r1, r4, #2
	adds r0, r6, #0
	adds r0, #0x14
	adds r3, r1, r0
	ldr r1, [r3]
	ldr r0, [r7]
	adds r1, r1, r0
	str r1, [r2, #0x38]
	ldr r0, _080491E4  @ 0x0000270F
	cmp r1, r0
	bls _080491A4
	str r0, [r2, #0x38]
_080491A4:
	ldr r0, [r2, #0x38]
	ldr r1, [r3]
	subs r0, r0, r1
	str r0, [r2, #0x34]
	adds r0, r2, #0
	adds r0, #0x40
	mov r1, r9
	strb r1, [r0]
	adds r0, #8
	movs r1, #4
	bl Text_Allocate
	movs r0, #1
	add sl, r0
	b _080491F0
	.align 2, 0
_080491C4: .4byte gUnknown_0859EF00
_080491C8: .4byte gUnknown_02000C60
_080491CC: .4byte 0x06016800
_080491D0: .4byte gUnknown_02000C78
_080491D4: .4byte gUnknown_085A92E0
_080491D8: .4byte gUnknown_080D9F38
_080491DC: .4byte gUnknown_0203DD90
_080491E0: .4byte gUnknown_085AA0F0
_080491E4: .4byte 0x0000270F
_080491E8:
	mov r0, sp
	movs r1, #4
	bl Text_Allocate
_080491F0:
	movs r1, #1
	add r8, r1
	mov r0, r8
	cmp r0, #3
	ble _08049142
	mov r1, sl
	cmp r1, #0
	beq _08049224
	mov r0, r9
	cmp r0, #0
	beq _0804921A
	ldr r0, _08049220  @ gUnknown_085AA130
	ldr r1, [sp, #0x34]
	bl Proc_StartBlocking
	ldr r1, [sp, #8]
	str r1, [r0, #0x2c]
	ldr r1, [sp, #0xc]
	str r1, [r0, #0x30]
	ldr r1, [sp, #0x10]
	str r1, [r0, #0x54]
_0804921A:
	movs r0, #1
	b _08049226
	.align 2, 0
_08049220: .4byte gUnknown_085AA130
_08049224:
	movs r0, #0
_08049226:
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80490EC

	THUMB_FUNC_START sub_8049238
sub_8049238: @ 0x08049238
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	bl sub_8048A6C
	ldr r0, _08049268  @ 0x00000771
	bl GetStringFromIndex
	adds r2, r0, #0
	str r4, [sp]
	movs r0, #0x58
	movs r1, #0x3c
	movs r3, #1
	bl sub_80490EC
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08049260
	bl sub_8048A94
_08049260:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08049268: .4byte 0x00000771

	THUMB_FUNC_END sub_8049238

	THUMB_FUNC_START sub_804926C
sub_804926C: @ 0x0804926C
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	bl sub_8048A6C
	ldr r0, _08049294  @ 0x00000771
	bl GetStringFromIndex
	adds r2, r0, #0
	str r4, [sp]
	movs r0, #0x58
	movs r1, #0x3c
	movs r3, #0
	bl sub_80490EC
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08049294: .4byte 0x00000771

	THUMB_FUNC_END sub_804926C

	THUMB_FUNC_START sub_8049298
sub_8049298: @ 0x08049298
	push {lr}
	adds r1, r0, #0
	adds r1, #0x1e
	ldr r3, _080492B4  @ gUnknown_03001840
	movs r2, #4
_080492A2:
	ldrh r0, [r1]
	strh r0, [r3]
	adds r1, #2
	adds r3, #2
	subs r2, #1
	cmp r2, #0
	bge _080492A2
	pop {r0}
	bx r0
	.align 2, 0
_080492B4: .4byte gUnknown_03001840

	THUMB_FUNC_END sub_8049298

	THUMB_FUNC_START sub_80492B8
sub_80492B8: @ 0x080492B8
	push {lr}
	ldr r3, _080492D4  @ gUnknown_03001840
	adds r1, r0, #0
	adds r1, #0x1e
	movs r2, #4
_080492C2:
	ldrh r0, [r3]
	strh r0, [r1]
	adds r3, #2
	adds r1, #2
	subs r2, #1
	cmp r2, #0
	bge _080492C2
	pop {r0}
	bx r0
	.align 2, 0
_080492D4: .4byte gUnknown_03001840

	THUMB_FUNC_END sub_80492B8

	THUMB_FUNC_START sub_80492D8
sub_80492D8: @ 0x080492D8
	push {lr}
	bl sub_8049594
	bl SMS_UpdateFromGameData
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80492D8

	THUMB_FUNC_START sub_80492E8
sub_80492E8: @ 0x080492E8
	push {lr}
	movs r1, #0
	ldr r3, _08049304  @ gUnknown_0203DD90
	adds r2, r3, #0
	adds r2, #0xa
_080492F2:
	cmp r0, #2
	beq _0804931A
	cmp r0, #2
	bgt _08049308
	cmp r0, #0
	beq _08049312
	cmp r0, #1
	beq _08049316
	b _08049324
	.align 2, 0
_08049304: .4byte gUnknown_0203DD90
_08049308:
	cmp r0, #3
	beq _0804931E
	cmp r0, #0xff
	beq _08049322
	b _08049324
_08049312:
	movs r1, #2
	b _08049324
_08049316:
	movs r1, #3
	b _08049324
_0804931A:
	movs r1, #1
	b _08049324
_0804931E:
	movs r1, #0
	b _08049324
_08049322:
	movs r1, #0xff
_08049324:
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, #0
	bne _08049334
	cmp r1, #0xff
	beq _08049334
	adds r0, r1, #0
	b _080492F2
_08049334:
	strb r1, [r3, #1]
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80492E8

	THUMB_FUNC_START sub_804933C
sub_804933C: @ 0x0804933C
	ldr r1, _0804934C  @ gUnknown_03001834
	movs r0, #0
	strb r0, [r1]
	strb r0, [r1, #1]
	strb r0, [r1, #3]
	strb r0, [r1, #2]
	bx lr
	.align 2, 0
_0804934C: .4byte gUnknown_03001834

	THUMB_FUNC_END sub_804933C

	THUMB_FUNC_START sub_8049350
sub_8049350: @ 0x08049350
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	adds r0, r3, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	bl sub_804933C
	ldr r1, _0804938C  @ gUnknown_03001834
	strb r4, [r1]
	strb r5, [r1, #1]
	strb r6, [r1, #2]
	ldr r0, [sp]
	strb r0, [r1, #3]
	ldr r0, _08049390  @ gUnknown_0203DA24
	ldrb r0, [r0]
	cmp r0, #2
	beq _08049394
	movs r0, #0
	b _080493A0
	.align 2, 0
_0804938C: .4byte gUnknown_03001834
_08049390: .4byte gUnknown_0203DA24
_08049394:
	adds r0, r1, #0
	movs r1, #4
	bl sub_80426F4
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
_080493A0:
	add sp, #4
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8049350

	THUMB_FUNC_START sub_80493A8
sub_80493A8: @ 0x080493A8
	push {r4, lr}
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r3, r1, #0x18
	movs r2, #0
	ldr r4, _080493C0  @ gUnknown_03001818
_080493B4:
	adds r1, r2, r4
	ldrb r1, [r1]
	cmp r1, r3
	bne _080493C4
	adds r0, r2, #0
	b _080493CA
	.align 2, 0
_080493C0: .4byte gUnknown_03001818
_080493C4:
	adds r2, #1
	cmp r2, #0x13
	ble _080493B4
_080493CA:
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80493A8

	THUMB_FUNC_START sub_80493D0
sub_80493D0: @ 0x080493D0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	adds r4, r0, #0
	str r1, [sp, #0x10]
	adds r5, r2, #0
	mov r8, r3
	ldr r0, [sp, #0x34]
	mov r9, r0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r1, _080494C4  @ gUnknown_080D9FA0
	mov r0, sp
	movs r2, #8
	bl memcpy
	add r7, sp, #8
	ldr r1, _080494C8  @ gUnknown_080D9FA8
	adds r0, r7, #0
	movs r2, #8
	bl memcpy
	adds r0, r4, #0
	bl sub_80493A8
	adds r4, r0, #0
	movs r1, #5
	bl Div
	lsls r6, r0, #1
	strb r4, [r5]
	ldr r0, _080494CC  @ gUnknown_03001818
	adds r4, r4, r0
	ldrb r0, [r4]
	bl GetUnit
	adds r5, r0, #0
	ldr r0, [r5, #0xc]
	movs r1, #0x80
	lsls r1, r1, #2
	mov sl, r1
	ands r0, r1
	cmp r0, #0
	bne _0804944C
	adds r0, r5, #0
	bl MU_Create
	ldr r1, _080494D0  @ gUnknown_03001838
	ldr r2, [sp, #0x10]
	lsls r4, r2, #2
	adds r4, r4, r1
	str r0, [r4]
	bl MU_DisableAttractCamera
	ldr r0, [r4]
	mov r3, sp
	adds r1, r3, r6
	bl MU_StartMoveScript
_0804944C:
	ldr r0, [r5, #0xc]
	movs r1, #1
	orrs r0, r1
	str r0, [r5, #0xc]
	bl SMS_UpdateFromGameData
	movs r0, #0x10
	ldrsb r0, [r5, r0]
	adds r4, r7, r6
	movs r1, #0
	ldrsb r1, [r4, r1]
	adds r0, r0, r1
	mov r1, r8
	str r0, [r1]
	movs r1, #0x11
	ldrsb r1, [r5, r1]
	adds r0, r6, #1
	adds r3, r7, r0
	movs r0, #0
	ldrsb r0, [r3, r0]
	adds r1, r1, r0
	mov r2, r9
	str r1, [r2]
	ldr r0, [r5, #0xc]
	mov r1, sl
	ands r0, r1
	cmp r0, #0
	beq _080494B4
	mov r2, r8
	ldr r0, [r2]
	movs r2, #0
	strb r0, [r5, #0x10]
	mov r1, r9
	ldr r0, [r1]
	strb r0, [r5, #0x11]
	movs r1, #0
	ldrsb r1, [r4, r1]
	mov r4, r8
	ldr r0, [r4]
	subs r0, r0, r1
	str r0, [r4]
	movs r1, #0
	ldrsb r1, [r3, r1]
	mov r3, r9
	ldr r0, [r3]
	subs r0, r0, r1
	str r0, [r3]
	ldr r1, _080494D0  @ gUnknown_03001838
	ldr r4, [sp, #0x10]
	lsls r0, r4, #2
	adds r0, r0, r1
	str r2, [r0]
_080494B4:
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080494C4: .4byte gUnknown_080D9FA0
_080494C8: .4byte gUnknown_080D9FA8
_080494CC: .4byte gUnknown_03001818
_080494D0: .4byte gUnknown_03001838

	THUMB_FUNC_END sub_80493D0

	THUMB_FUNC_START sub_80494D4
sub_80494D4: @ 0x080494D4
	push {lr}
	ldr r1, _080494EC  @ gUnknown_03001818
	movs r2, #0
	adds r0, r1, #0
	adds r0, #0x13
_080494DE:
	strb r2, [r0]
	subs r0, #1
	cmp r0, r1
	bge _080494DE
	pop {r0}
	bx r0
	.align 2, 0
_080494EC: .4byte gUnknown_03001818

	THUMB_FUNC_END sub_80494D4

	THUMB_FUNC_START sub_80494F0
sub_80494F0: @ 0x080494F0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	movs r7, #0
_080494FE:
	ldr r0, _08049580  @ gUnknown_085A92E0
	ldr r0, [r0]
	ldrb r0, [r0, #6]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #2
	adds r0, r7, r0
	ldr r1, _08049584  @ gUnknown_080D9F28
	adds r0, r0, r1
	ldrb r4, [r0]
	adds r0, r4, #0
	bl sub_8042194
	lsls r0, r0, #0x18
	adds r1, r7, #1
	mov r9, r1
	cmp r0, #0
	beq _08049568
	lsls r0, r4, #6
	adds r0, #1
	mov r8, r0
	movs r6, #0
	lsls r3, r7, #2
	ldr r0, _08049588  @ gUnknown_080D9F48
	mov sl, r0
_08049530:
	adds r0, r3, r7
	adds r5, r0, r6
	ldr r0, _0804958C  @ gUnknown_080D9FB0
	adds r0, r6, r0
	ldrb r0, [r0]
	mov r1, r8
	adds r4, r1, r0
	adds r0, r4, #0
	str r3, [sp]
	bl GetUnit
	adds r2, r0, #0
	ldr r0, [r2]
	ldr r3, [sp]
	cmp r0, #0
	beq _08049562
	ldr r0, _08049590  @ gUnknown_03001818
	adds r0, r5, r0
	strb r4, [r0]
	lsls r1, r5, #2
	add r1, sl
	ldrh r0, [r1]
	strb r0, [r2, #0x10]
	ldrh r0, [r1, #2]
	strb r0, [r2, #0x11]
_08049562:
	adds r6, #1
	cmp r6, #4
	ble _08049530
_08049568:
	mov r7, r9
	cmp r7, #3
	ble _080494FE
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08049580: .4byte gUnknown_085A92E0
_08049584: .4byte gUnknown_080D9F28
_08049588: .4byte gUnknown_080D9F48
_0804958C: .4byte gUnknown_080D9FB0
_08049590: .4byte gUnknown_03001818

	THUMB_FUNC_END sub_80494F0

	THUMB_FUNC_START sub_8049594
sub_8049594: @ 0x08049594
	push {r4, lr}
	ldr r0, _080495EC  @ gBmMapUnit
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFill
	ldr r0, _080495F0  @ gBmMapFog
	ldr r0, [r0]
	movs r1, #1
	bl BmMapFill
	movs r4, #1
_080495AC:
	adds r0, r4, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq _080495E0
	ldr r0, [r2]
	cmp r0, #0
	beq _080495E0
	ldr r0, [r2, #0xc]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _080495E0
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	ldr r0, _080495EC  @ gBmMapUnit
	ldr r0, [r0]
	lsls r1, r1, #2
	adds r1, r1, r0
	ldrb r2, [r2, #0x10]
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	ldr r0, [r1]
	adds r0, r0, r2
	strb r4, [r0]
_080495E0:
	adds r4, #1
	cmp r4, #0xc5
	ble _080495AC
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080495EC: .4byte gBmMapUnit
_080495F0: .4byte gBmMapFog

	THUMB_FUNC_END sub_8049594

	THUMB_FUNC_START sub_80495F4
sub_80495F4: @ 0x080495F4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	movs r2, #0
	ldr r0, _08049670  @ gUnknown_080D9F28
	mov sl, r0
_08049606:
	ldr r0, _08049674  @ gUnknown_085A92E0
	ldr r0, [r0]
	ldrb r0, [r0, #6]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #2
	adds r0, r2, r0
	add r0, sl
	ldrb r4, [r0]
	adds r0, r4, #0
	str r2, [sp]
	bl sub_8042194
	lsls r0, r0, #0x18
	ldr r2, [sp]
	adds r1, r2, #1
	mov r9, r1
	cmp r0, #0
	beq _0804968E
	lsls r0, r4, #6
	adds r0, #1
	mov r8, r0
	movs r6, #0
	lsls r3, r2, #2
	ldr r7, _08049678  @ gUnknown_03001818
_08049638:
	adds r0, r3, r2
	adds r5, r0, r6
	ldr r0, _0804967C  @ gUnknown_080D9FB0
	adds r0, r6, r0
	ldrb r0, [r0]
	mov r1, r8
	adds r4, r1, r0
	adds r0, r4, #0
	str r2, [sp]
	str r3, [sp, #4]
	bl GetUnit
	adds r1, r0, #0
	ldr r0, [r1]
	ldr r2, [sp]
	ldr r3, [sp, #4]
	cmp r0, #0
	beq _08049666
	ldr r0, [r1, #0xc]
	ldr r1, _08049680  @ 0x00010005
	ands r0, r1
	cmp r0, #0
	beq _08049684
_08049666:
	adds r1, r5, r7
	movs r0, #0
	strb r0, [r1]
	b _08049688
	.align 2, 0
_08049670: .4byte gUnknown_080D9F28
_08049674: .4byte gUnknown_085A92E0
_08049678: .4byte gUnknown_03001818
_0804967C: .4byte gUnknown_080D9FB0
_08049680: .4byte 0x00010005
_08049684:
	adds r0, r5, r7
	strb r4, [r0]
_08049688:
	adds r6, #1
	cmp r6, #4
	ble _08049638
_0804968E:
	mov r2, r9
	cmp r2, #3
	ble _08049606
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80495F4

	THUMB_FUNC_START sub_80496A4
sub_80496A4: @ 0x080496A4
	push {r4, r5, lr}
	sub sp, #4
	mov r1, sp
	movs r0, #0
	strh r0, [r1]
	ldr r4, _08049700  @ gUnknown_0202BCB0
	ldr r2, _08049704  @ 0x01000020
	mov r0, sp
	adds r1, r4, #0
	bl CpuSet
	ldrb r1, [r4, #4]
	movs r0, #0x40
	movs r5, #0
	orrs r0, r1
	strb r0, [r4, #4]
	bl ClearTraps
	ldr r4, _08049708  @ gRAMChapterData
	movs r0, #0x40
	strb r0, [r4, #0xf]
	movs r0, #0x3a
	strb r0, [r4, #0xe]
	strh r5, [r4, #0x10]
	bl GetROMChapterStruct
	ldrb r0, [r0, #0xc]
	strb r0, [r4, #0xd]
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	bl GetROMChapterStruct
	ldrb r0, [r0, #0x12]
	strb r0, [r4, #0x15]
	movs r0, #0x3a
	bl InitChapterMap
	bl GetGameClock
	str r0, [r4, #4]
	adds r4, #0x48
	strh r5, [r4]
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08049700: .4byte gUnknown_0202BCB0
_08049704: .4byte 0x01000020
_08049708: .4byte gRAMChapterData

	THUMB_FUNC_END sub_80496A4

	THUMB_FUNC_START sub_804970C
sub_804970C: @ 0x0804970C
	push {lr}
	bl sub_80496A4
	bl sub_80494D4
	bl sub_80494F0
	ldr r0, _0804973C  @ gBmMapFog
	ldr r2, [r0]
	movs r1, #0
	ldr r0, _08049740  @ gRAMChapterData
	ldrb r0, [r0, #0xd]
	cmp r0, #0
	bne _0804972A
	movs r1, #1
_0804972A:
	adds r0, r2, #0
	bl BmMapFill
	bl sub_8049594
	bl RenderBmMap
	pop {r0}
	bx r0
	.align 2, 0
_0804973C: .4byte gBmMapFog
_08049740: .4byte gRAMChapterData

	THUMB_FUNC_END sub_804970C

	THUMB_FUNC_START sub_8049744
sub_8049744: @ 0x08049744
	push {r4, lr}
	ldr r0, _0804977C  @ gUnknown_0203DD90
	movs r1, #0
	movs r2, #3
	adds r0, #0xd
_0804974E:
	strb r1, [r0]
	subs r0, #1
	subs r2, #1
	cmp r2, #0
	bge _0804974E
	movs r2, #0
	ldr r4, _08049780  @ gUnknown_03001818
	ldr r3, _08049784  @ gUnknown_0203DD9A
_0804975E:
	adds r0, r2, r4
	ldrb r1, [r0]
	cmp r1, #0
	beq _08049770
	lsrs r1, r1, #6
	adds r1, r1, r3
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
_08049770:
	adds r2, #1
	cmp r2, #0x13
	ble _0804975E
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804977C: .4byte gUnknown_0203DD90
_08049780: .4byte gUnknown_03001818
_08049784: .4byte gUnknown_0203DD9A

	THUMB_FUNC_END sub_8049744

	THUMB_FUNC_START sub_8049788
sub_8049788: @ 0x08049788
	push {lr}
	ldr r0, _08049798  @ gUnknown_085AD9CC
	ldr r1, _0804979C  @ 0x06013E00
	bl CopyDataWithPossibleUncomp
	pop {r0}
	bx r0
	.align 2, 0
_08049798: .4byte gUnknown_085AD9CC
_0804979C: .4byte 0x06013E00

	THUMB_FUNC_END sub_8049788

	THUMB_FUNC_START sub_80497A0
sub_80497A0: @ 0x080497A0
	push {lr}
	movs r0, #0
	bl SetupBackgrounds
	bl sub_80156D4
	bl SetupMapSpritesPalettes
	bl SMS_FlushIndirect
	bl sub_8049788
	bl Font_LoadForUI
	ldr r1, _080497C8  @ gUnknown_0203DD90
	movs r0, #0xff
	strb r0, [r1, #3]
	pop {r0}
	bx r0
	.align 2, 0
_080497C8: .4byte gUnknown_0203DD90

	THUMB_FUNC_END sub_80497A0

	THUMB_FUNC_START sub_80497CC
sub_80497CC: @ 0x080497CC
	push {r4, r5, lr}
	ldr r1, _08049824  @ gRAMChapterData
	movs r0, #0x42
	adds r0, r0, r1
	mov ip, r0
	ldrb r0, [r0]
	movs r3, #7
	negs r3, r3
	ands r3, r0
	adds r5, r1, #0
	adds r5, #0x40
	ldrb r2, [r5]
	movs r0, #0x10
	orrs r2, r0
	movs r0, #0x61
	negs r0, r0
	ands r2, r0
	movs r0, #0x40
	orrs r2, r0
	movs r0, #0x7f
	ands r2, r0
	adds r4, r1, #0
	adds r4, #0x41
	ldrb r1, [r4]
	subs r0, #0x81
	ands r0, r1
	movs r1, #3
	negs r1, r1
	ands r0, r1
	subs r1, #0xa
	ands r0, r1
	strb r0, [r4]
	movs r0, #0x19
	negs r0, r0
	ands r3, r0
	mov r0, ip
	strb r3, [r0]
	movs r0, #1
	orrs r2, r0
	strb r2, [r5]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08049824: .4byte gRAMChapterData

	THUMB_FUNC_END sub_80497CC

	THUMB_FUNC_START sub_8049828
sub_8049828: @ 0x08049828
	push {r4, r5, lr}
	movs r0, #0
	bl SetupBackgrounds
	bl sub_8043044
	bl sub_804970C
	bl sub_8049744
	ldr r4, _080498D4  @ gUnknown_0203DD90
	movs r5, #0
	strb r5, [r4, #9]
	ldr r0, _080498D8  @ gUnknown_0203DA24
	strb r5, [r0, #0xb]
	ldr r1, _080498DC  @ gUnknown_085AA158
	ldrb r0, [r4]
	adds r0, r0, r1
	ldrb r0, [r0]
	bl sub_80492E8
	movs r0, #1
	strb r0, [r4, #0xe]
	strb r5, [r4, #2]
	strb r0, [r4, #3]
	movs r1, #0
	movs r0, #3
	adds r4, #0x20
_08049860:
	str r1, [r4]
	subs r4, #4
	subs r0, #1
	cmp r0, #0
	bge _08049860
	movs r4, #0
	ldr r0, _080498E0  @ gUnknown_03001818
	ldrb r0, [r0, #3]
	bl GetUnit
	ldr r2, _080498E4  @ gUnknown_0300182C
	movs r1, #0x10
	ldrsb r1, [r0, r1]
	lsls r1, r1, #4
	strh r1, [r2]
	movs r1, #0x11
	ldrsb r1, [r0, r1]
	lsls r1, r1, #4
	strh r1, [r2, #2]
	movs r2, #0x10
	ldrsb r2, [r0, r2]
	movs r1, #0x11
	ldrsb r1, [r0, r1]
	adds r0, r2, #0
	bl SetCursorMapPosition
	ldr r0, _080498E8  @ gUnknown_0202BCB0
	strh r4, [r0, #0xc]
	strh r4, [r0, #0xe]
	bl LoadGameCoreGfx
	bl SetupMapSpritesPalettes
	bl SMS_ClearUsageTable
	bl SMS_UpdateFromGameData
	bl sub_8049788
	bl sub_804B38C
	ldr r0, _080498EC  @ gProc_MapTask
	movs r1, #4
	bl Proc_Start
	bl BMapVSync_Start
	bl sub_80497CC
	ldr r2, _080498F0  @ gRAMChapterData
	ldrb r1, [r2, #0x14]
	movs r0, #0xbf
	ands r0, r1
	strb r0, [r2, #0x14]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080498D4: .4byte gUnknown_0203DD90
_080498D8: .4byte gUnknown_0203DA24
_080498DC: .4byte gUnknown_085AA158
_080498E0: .4byte gUnknown_03001818
_080498E4: .4byte gUnknown_0300182C
_080498E8: .4byte gUnknown_0202BCB0
_080498EC: .4byte gProc_MapTask
_080498F0: .4byte gRAMChapterData

	THUMB_FUNC_END sub_8049828

	THUMB_FUNC_START sub_80498F4
sub_80498F4: @ 0x080498F4
	push {r4, r5, lr}
	ldr r1, _08049934  @ gUnknown_03001818
	ldr r0, _08049938  @ gUnknown_0203DD90
	ldrb r0, [r0, #4]
	adds r0, r0, r1
	ldrb r0, [r0]
	bl GetUnit
	adds r4, r0, #0
	bl MU_Create
	ldr r5, _0804993C  @ gUnknown_03001838
	str r0, [r5]
	movs r1, #0x10
	ldrsb r1, [r4, r1]
	lsls r1, r1, #4
	movs r2, #0x11
	ldrsb r2, [r4, r2]
	subs r2, #1
	lsls r2, r2, #4
	bl MU_SetDisplayPosition
	ldr r0, [r5]
	bl MU_DisableAttractCamera
	ldr r0, [r5]
	movs r1, #3
	bl MU_SetFacing
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08049934: .4byte gUnknown_03001818
_08049938: .4byte gUnknown_0203DD90
_0804993C: .4byte gUnknown_03001838

	THUMB_FUNC_END sub_80498F4

	THUMB_FUNC_START sub_8049940
sub_8049940: @ 0x08049940
	push {lr}
	adds r2, r0, #0
	ldr r0, _08049960  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0804995A
	adds r0, r2, #0
	bl Proc_Break
_0804995A:
	pop {r0}
	bx r0
	.align 2, 0
_08049960: .4byte gKeyStatusPtr

	THUMB_FUNC_END sub_8049940

	THUMB_FUNC_START sub_8049964
sub_8049964: @ 0x08049964
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08049978  @ gUnknown_0203DA24
	ldrb r0, [r0]
	cmp r0, #1
	beq _0804997C
	cmp r0, #2
	beq _08049990
	b _080499C0
	.align 2, 0
_08049978: .4byte gUnknown_0203DA24
_0804997C:
	ldr r0, _08049988  @ gRAMChapterData
	ldrb r0, [r0, #0xf]
	cmp r0, #0
	beq _080499A2
	ldr r0, _0804998C  @ gUnknown_085AA5BC
	b _080499A4
	.align 2, 0
_08049988: .4byte gRAMChapterData
_0804998C: .4byte gUnknown_085AA5BC
_08049990:
	ldr r0, _080499AC  @ gRAMChapterData
	ldrb r1, [r0, #0xf]
	ldr r0, _080499B0  @ gUnknown_085A92E0
	ldr r0, [r0]
	ldrb r0, [r0, #6]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r1, r0
	bne _080499B8
_080499A2:
	ldr r0, _080499B4  @ gUnknown_085AA2FC
_080499A4:
	adds r1, r4, #0
	bl Proc_StartBlocking
	b _080499C0
	.align 2, 0
_080499AC: .4byte gRAMChapterData
_080499B0: .4byte gUnknown_085A92E0
_080499B4: .4byte gUnknown_085AA2FC
_080499B8:
	ldr r0, _080499CC  @ gUnknown_085AA4CC
	adds r1, r4, #0
	bl Proc_StartBlocking
_080499C0:
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080499CC: .4byte gUnknown_085AA4CC

	THUMB_FUNC_END sub_8049964

	THUMB_FUNC_START sub_80499D0
sub_80499D0: @ 0x080499D0
	push {r4, lr}
	adds r3, r0, #0
	movs r1, #0
	ldr r2, _080499E8  @ gUnknown_0203DA24
	ldrb r0, [r2]
	cmp r0, #1
	bne _080499EC
	ldrb r0, [r2, #0xb]
	cmp r0, #1
	bne _080499FC
	b _080499F2
	.align 2, 0
_080499E8: .4byte gUnknown_0203DA24
_080499EC:
	ldrb r0, [r2, #0xb]
	cmp r0, #2
	bne _080499FC
_080499F2:
	adds r0, r3, #0
	movs r1, #3
	bl Proc_Goto
	b _08049A56
_080499FC:
	ldr r0, _08049A10  @ gUnknown_0203DD90
	ldrb r2, [r0, #1]
	adds r0, r2, #0
	cmp r0, #0xff
	bne _08049A14
	adds r0, r3, #0
	movs r1, #2
	bl Proc_Goto
	b _08049A56
	.align 2, 0
_08049A10: .4byte gUnknown_0203DD90
_08049A14:
	ldr r0, _08049A1C  @ gRAMChapterData
	strb r2, [r0, #0xf]
	ldr r2, _08049A20  @ gUnknown_03001818
	b _08049A26
	.align 2, 0
_08049A1C: .4byte gRAMChapterData
_08049A20: .4byte gUnknown_03001818
_08049A24:
	adds r1, #1
_08049A26:
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, #0
	beq _08049A24
	ldr r4, _08049A5C  @ gUnknown_0203DD90
	strb r1, [r4, #2]
	adds r0, r1, #1
	strb r0, [r4, #3]
	bl LoadObjUIGfx
	movs r0, #0
	adds r4, #0x2c
	movs r1, #3
_08049A40:
	str r0, [r4, #4]
	strb r0, [r4]
	adds r4, #8
	subs r1, #1
	cmp r1, #0
	bge _08049A40
	movs r0, #1
	negs r0, r0
	movs r1, #9
	bl SetupDebugFontForOBJ
_08049A56:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08049A5C: .4byte gUnknown_0203DD90

	THUMB_FUNC_END sub_80499D0

	THUMB_FUNC_START sub_8049A60
sub_8049A60: @ 0x08049A60
	push {r4, r5, r6, r7, lr}
	movs r5, #4
	ldr r3, _08049AB8  @ gUnknown_0203DD90
	ldr r0, _08049ABC  @ gUnknown_085A92E0
	ldr r0, [r0]
	ldrb r0, [r0, #6]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #2
	adds r2, r3, #0
	adds r2, #0x14
	adds r0, r0, r2
	ldr r7, [r0]
	ldr r0, _08049AC0  @ gUnknown_0203DA24
	adds r0, #0xec
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08049AC8
	movs r4, #0
	adds r5, r3, #0
	adds r5, #0xf
_08049A8E:
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	bl sub_8042194
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08049AAC
	ldr r0, _08049ABC  @ gUnknown_085A92E0
	ldr r0, [r0]
	movs r1, #6
	ldrsb r1, [r0, r1]
	adds r0, r4, r5
	ldrb r0, [r0]
	cmp r1, r0
	beq _08049AC4
_08049AAC:
	adds r4, #1
	cmp r4, #3
	ble _08049A8E
	movs r5, #3
	b _08049AF8
	.align 2, 0
_08049AB8: .4byte gUnknown_0203DD90
_08049ABC: .4byte gUnknown_085A92E0
_08049AC0: .4byte gUnknown_0203DA24
_08049AC4:
	adds r0, r4, #0
	b _08049AFA
_08049AC8:
	movs r4, #0
	adds r6, r2, #0
_08049ACC:
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	bl sub_8042194
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08049AEE
	ldr r0, _08049B00  @ gUnknown_085A92E0
	ldr r0, [r0]
	ldrb r0, [r0, #6]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, r4
	beq _08049AEE
	ldr r0, [r6]
	cmp r7, r0
	bls _08049AF0
_08049AEE:
	subs r5, #1
_08049AF0:
	adds r6, #4
	adds r4, #1
	cmp r4, #3
	ble _08049ACC
_08049AF8:
	adds r0, r5, #0
_08049AFA:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08049B00: .4byte gUnknown_085A92E0

	THUMB_FUNC_END sub_8049A60

	THUMB_FUNC_START sub_8049B04
sub_8049B04: @ 0x08049B04
	push {lr}
	ldr r0, _08049B20  @ gProc_MapTask
	bl Proc_EndEach
	bl sub_804B3A0
	bl BMapVSync_End
	movs r0, #1
	bl Sound_FadeOut800231C
	pop {r0}
	bx r0
	.align 2, 0
_08049B20: .4byte gProc_MapTask

	THUMB_FUNC_END sub_8049B04

	THUMB_FUNC_START sub_8049B24
sub_8049B24: @ 0x08049B24
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov ip, r1
	ldr r1, _08049B54  @ gUnknown_0203DD90
	ldrb r2, [r1, #2]
	adds r5, r2, #0
	strb r2, [r1, #3]
	movs r0, #0xf0
	ands r0, r3
	adds r7, r1, #0
	cmp r0, #0
	beq _08049C12
	lsls r4, r2, #2
	movs r0, #0x40
	ands r0, r3
	cmp r0, #0
	beq _08049B5C
	ldr r0, _08049B58  @ gUnknown_085AA15C
	adds r0, r4, r0
	b _08049B92
	.align 2, 0
_08049B54: .4byte gUnknown_0203DD90
_08049B58: .4byte gUnknown_085AA15C
_08049B5C:
	movs r0, #0x80
	ands r0, r3
	cmp r0, #0
	beq _08049B70
	ldr r1, _08049B6C  @ gUnknown_085AA15C
	adds r0, r4, #1
	b _08049B90
	.align 2, 0
_08049B6C: .4byte gUnknown_085AA15C
_08049B70:
	movs r0, #0x20
	ands r0, r3
	cmp r0, #0
	beq _08049B84
	ldr r1, _08049B80  @ gUnknown_085AA15C
	adds r0, r4, #2
	b _08049B90
	.align 2, 0
_08049B80: .4byte gUnknown_085AA15C
_08049B84:
	movs r0, #0x10
	ands r0, r3
	cmp r0, #0
	beq _08049B94
	ldr r1, _08049BF0  @ gUnknown_085AA15C
	adds r0, r4, #3
_08049B90:
	adds r0, r0, r1
_08049B92:
	ldrb r2, [r0]
_08049B94:
	subs r5, r2, r5
	ldrb r0, [r7, #3]
	cmp r0, #0
	bne _08049BA8
	movs r0, #0x20
	ands r0, r3
	cmp r0, #0
	beq _08049BA8
	movs r5, #1
	negs r5, r5
_08049BA8:
	ldrb r0, [r7, #3]
	cmp r0, #0x13
	bne _08049BB8
	movs r0, #0x80
	ands r0, r3
	cmp r0, #0
	beq _08049BB8
	movs r5, #1
_08049BB8:
	ldr r6, _08049BF4  @ gUnknown_03001818
	mov r0, ip
	lsls r4, r0, #0x18
_08049BBE:
	adds r0, r2, r6
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08049BDC
	cmp r4, #0
	beq _08049C10
	lsrs r1, r0, #0x1e
	ldr r0, _08049BF8  @ gUnknown_085A92E0
	ldr r0, [r0]
	ldrb r0, [r0, #6]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r1, r0
	bne _08049C10
_08049BDC:
	cmp r5, #0
	bge _08049BFC
	subs r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0xff
	bne _08049BBE
	movs r2, #0x13
	b _08049BBE
	.align 2, 0
_08049BF0: .4byte gUnknown_085AA15C
_08049BF4: .4byte gUnknown_03001818
_08049BF8: .4byte gUnknown_085A92E0
_08049BFC:
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	adds r0, r2, #0
	movs r1, #0x14
	bl __umodsi3
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	b _08049BBE
_08049C10:
	strb r2, [r7, #2]
_08049C12:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8049B24

	THUMB_FUNC_START sub_8049C18
sub_8049C18: @ 0x08049C18
	push {r4, r5, r6, r7, lr}
	ldr r6, _08049C88  @ gUnknown_0203DD90
	ldrb r0, [r6, #2]
	ldrb r1, [r6, #3]
	cmp r0, r1
	beq _08049C80
	ldr r7, _08049C8C  @ gUnknown_03001818
	ldrb r0, [r6, #3]
	adds r0, r0, r7
	ldrb r0, [r0]
	bl GetUnit
	adds r5, r0, #0
	ldrb r0, [r6, #2]
	adds r0, r0, r7
	ldrb r0, [r0]
	bl GetUnit
	adds r4, r0, #0
	cmp r5, #0
	beq _08049C4C
	bl MU_EndAll
	adds r0, r5, #0
	bl ShowUnitSMS
_08049C4C:
	cmp r4, #0
	beq _08049C80
	ldr r0, [r4, #0xc]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	bne _08049C80
	ldrb r0, [r6, #2]
	adds r0, r0, r7
	ldrb r1, [r0]
	lsrs r1, r1, #6
	ldr r0, _08049C90  @ gUnknown_085A92E0
	ldr r0, [r0]
	ldrb r0, [r0, #6]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r1, r0
	bne _08049C80
	adds r0, r4, #0
	bl MU_Create
	bl MU_DisableAttractCamera
	adds r0, r4, #0
	bl HideUnitSMS
_08049C80:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08049C88: .4byte gUnknown_0203DD90
_08049C8C: .4byte gUnknown_03001818
_08049C90: .4byte gUnknown_085A92E0

	THUMB_FUNC_END sub_8049C18

	THUMB_FUNC_START sub_8049C94
sub_8049C94: @ 0x08049C94
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	movs r5, #0
_08049C9A:
	lsls r1, r5, #1
	adds r0, r6, #0
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r4, [r0]
	adds r0, r4, #0
	bl GetItemAttributes
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	beq _08049CC6
	adds r0, r6, #0
	adds r1, r4, #0
	bl CanUnitUseWeapon
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _08049CC6
	movs r0, #1
	b _08049CCE
_08049CC6:
	adds r5, #1
	cmp r5, #4
	ble _08049C9A
	movs r0, #0
_08049CCE:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8049C94

	THUMB_FUNC_START sub_8049CD4
sub_8049CD4: @ 0x08049CD4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08049D04  @ gUnknown_0203DD90
	ldrb r2, [r0, #9]
	ldr r0, _08049D08  @ gUnknown_0203DA24
	adds r0, #0xa0
	ldrb r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	cmp r2, r0
	blt _08049CF6
	bl sub_8048A94
	adds r0, r4, #0
	movs r1, #3
	bl Proc_Goto
_08049CF6:
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08049D04: .4byte gUnknown_0203DD90
_08049D08: .4byte gUnknown_0203DA24

	THUMB_FUNC_END sub_8049CD4

	THUMB_FUNC_START sub_8049D0C
sub_8049D0C: @ 0x08049D0C
	push {r4, lr}
	adds r4, r0, #0
	bl sub_8042238
	cmp r0, #7
	bgt _08049D1E
	adds r0, r4, #0
	bl Proc_Break
_08049D1E:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8049D0C

	THUMB_FUNC_START sub_8049D24
sub_8049D24: @ 0x08049D24
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r6, r0, #0
	ldr r1, _08049E0C  @ gUnknown_080D9FB5
	mov r0, sp
	movs r2, #2
	bl memcpy
	ldr r0, _08049E10  @ gUnknown_0203DD90
	mov r9, r0
	ldrb r1, [r0, #2]
	mov sl, r1
	bl sub_8049C18
	ldr r4, _08049E14  @ gKeyStatusPtr
	ldr r0, [r4]
	ldrh r0, [r0, #6]
	movs r1, #0
	bl sub_8049B24
	ldr r2, _08049E18  @ gActiveUnitId
	mov r8, r2
	ldr r1, _08049E1C  @ gUnknown_03001818
	mov r2, r9
	ldrb r0, [r2, #2]
	adds r0, r0, r1
	ldrb r0, [r0]
	mov r1, r8
	strb r0, [r1]
	ldrb r0, [r1]
	bl GetUnit
	adds r2, r0, #0
	ldr r7, _08049E20  @ gActiveUnit
	str r2, [r7]
	ldr r0, [r4]
	ldrh r1, [r0, #8]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08049E42
	mov r0, r8
	ldrb r1, [r0]
	lsrs r1, r1, #6
	ldr r0, _08049E24  @ gUnknown_085A92E0
	ldr r0, [r0]
	ldrb r0, [r0, #6]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r1, r0
	bne _08049E30
	adds r0, r2, #0
	bl sub_8049C94
	lsls r0, r0, #0x18
	asrs r5, r0, #0x18
	cmp r5, #1
	bne _08049E30
	ldr r0, _08049E28  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08049DB2
	movs r0, #0x69
	bl m4aSongNumStart
_08049DB2:
	bl MU_EndAll
	ldr r0, [r7]
	bl MU_Create
	ldr r4, _08049E2C  @ gUnknown_03001838
	str r0, [r4]
	bl MU_DisableAttractCamera
	ldr r0, [r4]
	mov r1, sp
	bl MU_StartMoveScript
	ldr r1, [r7]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	str r0, [r6, #0x2c]
	movs r0, #0x11
	ldrsb r0, [r1, r0]
	subs r0, #1
	str r0, [r6, #0x30]
	ldr r0, [r1, #0xc]
	orrs r0, r5
	str r0, [r1, #0xc]
	bl sub_80492D8
	mov r1, r9
	ldrb r0, [r1, #2]
	strb r0, [r1, #4]
	movs r0, #0x40
	movs r1, #1
	bl sub_8049B24
	mov r2, r8
	ldrb r1, [r2]
	movs r0, #1
	movs r2, #0
	movs r3, #0
	bl sub_8049350
	adds r0, r6, #0
	movs r1, #5
	bl Proc_Goto
	b _08049F12
	.align 2, 0
_08049E0C: .4byte gUnknown_080D9FB5
_08049E10: .4byte gUnknown_0203DD90
_08049E14: .4byte gKeyStatusPtr
_08049E18: .4byte gActiveUnitId
_08049E1C: .4byte gUnknown_03001818
_08049E20: .4byte gActiveUnit
_08049E24: .4byte gUnknown_085A92E0
_08049E28: .4byte gRAMChapterData
_08049E2C: .4byte gUnknown_03001838
_08049E30:
	ldr r0, _08049E70  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08049E42
	movs r0, #0x6c
	bl m4aSongNumStart
_08049E42:
	ldr r2, _08049E74  @ gKeyStatusPtr
	ldr r0, [r2]
	ldrh r1, [r0, #8]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08049E7C
	ldr r0, _08049E78  @ gActiveUnit
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	movs r1, #0x80
	lsls r1, r1, #2
	ands r0, r1
	cmp r0, #0
	bne _08049E7C
	bl MU_EndAll
	adds r0, r6, #0
	movs r1, #4
	bl Proc_Goto
	b _08049F12
	.align 2, 0
_08049E70: .4byte gRAMChapterData
_08049E74: .4byte gKeyStatusPtr
_08049E78: .4byte gActiveUnit
_08049E7C:
	ldr r0, [r2]
	ldrh r1, [r0, #8]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _08049EAC
	bl sub_8048A94
	ldr r0, _08049EA8  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08049F12
	movs r0, #0x68
	bl m4aSongNumStart
	adds r0, r6, #0
	movs r1, #2
	bl Proc_Goto
	b _08049F12
	.align 2, 0
_08049EA8: .4byte gRAMChapterData
_08049EAC:
	ldr r0, _08049F24  @ gActiveUnit
	ldr r1, [r0]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	lsls r5, r0, #4
	ldrb r1, [r1, #0x11]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	lsls r4, r1, #4
	bl SetCursorMapPosition
	bl GetGameClock
	subs r0, #1
	ldr r6, _08049F28  @ gUnknown_03001830
	ldr r1, [r6]
	cmp r0, r1
	bne _08049EE2
	ldr r0, _08049F2C  @ gUnknown_0300182C
	movs r2, #0
	ldrsh r1, [r0, r2]
	adds r1, r5, r1
	asrs r5, r1, #1
	movs r1, #2
	ldrsh r0, [r0, r1]
	adds r0, r4, r0
	asrs r4, r0, #1
_08049EE2:
	ldr r0, _08049F2C  @ gUnknown_0300182C
	strh r5, [r0]
	strh r4, [r0, #2]
	bl GetGameClock
	str r0, [r6]
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #0
	bl DisplayCursor
	ldr r0, _08049F30  @ gUnknown_0203DD90
	ldrb r0, [r0, #2]
	cmp sl, r0
	beq _08049F12
	ldr r0, _08049F34  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08049F12
	movs r0, #0x65
	bl m4aSongNumStart
_08049F12:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08049F24: .4byte gActiveUnit
_08049F28: .4byte gUnknown_03001830
_08049F2C: .4byte gUnknown_0300182C
_08049F30: .4byte gUnknown_0203DD90
_08049F34: .4byte gRAMChapterData

	THUMB_FUNC_END sub_8049D24

	THUMB_FUNC_START sub_8049F38
sub_8049F38: @ 0x08049F38
	push {lr}
	bl sub_8048A6C
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8049F38

	THUMB_FUNC_START sub_8049F44
sub_8049F44: @ 0x08049F44
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	mov r8, r0
	ldr r6, _0804A020  @ gUnknown_0203DD90
	ldrb r0, [r6, #2]
	str r0, [sp, #4]
	ldr r1, _0804A024  @ gKeyStatusPtr
	ldr r0, [r1]
	ldrh r0, [r0, #6]
	movs r1, #1
	bl sub_8049B24
	ldr r2, _0804A028  @ gActiveUnitId
	mov sl, r2
	ldr r0, _0804A02C  @ gUnknown_03001818
	mov r9, r0
	ldrb r0, [r6, #2]
	add r0, r9
	ldrb r0, [r0]
	strb r0, [r2]
	ldrb r0, [r2]
	bl GetUnit
	ldr r1, _0804A030  @ gActiveUnit
	str r0, [r1]
	movs r2, #0x10
	ldrsb r2, [r0, r2]
	lsls r5, r2, #4
	movs r1, #0x11
	ldrsb r1, [r0, r1]
	lsls r4, r1, #4
	adds r0, r2, #0
	bl SetCursorMapPosition
	bl GetGameClock
	subs r0, #1
	ldr r7, _0804A034  @ gUnknown_03001830
	ldr r1, [r7]
	cmp r0, r1
	bne _08049FB0
	ldr r0, _0804A038  @ gUnknown_0300182C
	movs r2, #0
	ldrsh r1, [r0, r2]
	adds r1, r5, r1
	asrs r5, r1, #1
	movs r1, #2
	ldrsh r0, [r0, r1]
	adds r0, r4, r0
	asrs r4, r0, #1
_08049FB0:
	ldr r0, _0804A038  @ gUnknown_0300182C
	strh r5, [r0]
	strh r4, [r0, #2]
	bl GetGameClock
	str r0, [r7]
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #0
	bl DisplayCursor
	ldr r2, _0804A024  @ gKeyStatusPtr
	ldr r0, [r2]
	ldrh r1, [r0, #8]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0804A040
	ldr r0, _0804A03C  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08049FE6
	movs r0, #0x69
	bl m4aSongNumStart
_08049FE6:
	ldrb r0, [r6, #2]
	add r0, r9
	ldrb r0, [r0]
	adds r2, r6, #5
	mov r3, r8
	adds r3, #0x34
	mov r1, r8
	adds r1, #0x38
	str r1, [sp]
	movs r1, #1
	bl sub_80493D0
	ldrb r0, [r6, #5]
	add r0, r9
	ldrb r1, [r0]
	mov r0, sl
	ldrb r2, [r0]
	movs r0, #3
	movs r3, #0
	bl sub_8049350
	bl sub_8048A94
	mov r0, r8
	movs r1, #7
	bl Proc_Goto
	b _0804A0F0
	.align 2, 0
_0804A020: .4byte gUnknown_0203DD90
_0804A024: .4byte gKeyStatusPtr
_0804A028: .4byte gActiveUnitId
_0804A02C: .4byte gUnknown_03001818
_0804A030: .4byte gActiveUnit
_0804A034: .4byte gUnknown_03001830
_0804A038: .4byte gUnknown_0300182C
_0804A03C: .4byte gRAMChapterData
_0804A040:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0804A0A8
	ldr r0, _0804A0A0  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0804A05A
	movs r0, #0x6b
	bl m4aSongNumStart
_0804A05A:
	ldr r0, _0804A0A4  @ gUnknown_03001838
	ldr r0, [r0]
	bl MU_End
	ldrb r0, [r6, #4]
	add r0, r9
	ldrb r0, [r0]
	bl GetUnit
	ldr r1, [r0, #0xc]
	movs r2, #2
	negs r2, r2
	ands r1, r2
	str r1, [r0, #0xc]
	bl sub_80492D8
	ldrb r0, [r6, #4]
	strb r0, [r6, #2]
	adds r0, #1
	strb r0, [r6, #3]
	mov r2, sl
	ldrb r1, [r2]
	ldrb r0, [r6, #4]
	add r0, r9
	ldrb r2, [r0]
	movs r0, #2
	movs r3, #0
	bl sub_8049350
	mov r0, r8
	movs r1, #1
	bl Proc_Goto
	b _0804A0F0
	.align 2, 0
_0804A0A0: .4byte gRAMChapterData
_0804A0A4: .4byte gUnknown_03001838
_0804A0A8:
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0804A0D4
	ldr r1, _0804A0D0  @ gActiveUnit
	ldr r0, [r1]
	ldr r0, [r0, #0xc]
	movs r1, #0x80
	lsls r1, r1, #2
	ands r0, r1
	cmp r0, #0
	bne _0804A0D4
	bl MU_EndAll
	mov r0, r8
	movs r1, #6
	bl Proc_Goto
	b _0804A0F0
	.align 2, 0
_0804A0D0: .4byte gActiveUnit
_0804A0D4:
	ldr r0, _0804A100  @ gUnknown_0203DD90
	ldr r2, [sp, #4]
	ldrb r0, [r0, #2]
	cmp r2, r0
	beq _0804A0F0
	ldr r0, _0804A104  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0804A0F0
	movs r0, #0x65
	bl m4aSongNumStart
_0804A0F0:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804A100: .4byte gUnknown_0203DD90
_0804A104: .4byte gRAMChapterData

	THUMB_FUNC_END sub_8049F44

	THUMB_FUNC_START sub_804A108
sub_804A108: @ 0x0804A108
	push {r4, lr}
	adds r4, r0, #0
	bl sub_8003D20
	ldr r2, _0804A148  @ gUnknown_0203DD90
	movs r0, #0xff
	strb r0, [r2, #6]
	ldr r1, _0804A14C  @ gUnknown_03001818
	ldrb r0, [r2, #4]
	adds r0, r0, r1
	ldrb r0, [r0]
	bl GetUnit
	ldr r1, _0804A150  @ gActiveUnit
	str r0, [r1]
	bl sub_8049298
	bl GetThread2SkipStack
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r4, #0x64
	strh r0, [r4]
	movs r0, #4
	bl LoadIconPalettes
	ldr r0, _0804A154  @ gUnknown_085AADA0
	bl StartOrphanMenu
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804A148: .4byte gUnknown_0203DD90
_0804A14C: .4byte gUnknown_03001818
_0804A150: .4byte gActiveUnit
_0804A154: .4byte gUnknown_085AADA0

	THUMB_FUNC_END sub_804A108

	THUMB_FUNC_START sub_804A158
sub_804A158: @ 0x0804A158
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r0, #0x64
	movs r1, #0
	ldrsh r4, [r0, r1]
	bl GetThread2SkipStack
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r4, r0
	bne _0804A1C4
	ldr r0, _0804A194  @ gUnknown_0203DD90
	ldrb r0, [r0, #6]
	cmp r0, #0
	bne _0804A1A0
	ldr r0, _0804A198  @ gActiveUnit
	ldr r0, [r0]
	bl sub_80492B8
	adds r0, r5, #0
	bl Proc_End
	ldr r2, _0804A19C  @ gLCDControlBuffer
	ldrb r0, [r2, #1]
	movs r1, #1
	orrs r0, r1
	movs r1, #2
	orrs r0, r1
	b _0804A1B6
	.align 2, 0
_0804A194: .4byte gUnknown_0203DD90
_0804A198: .4byte gActiveUnit
_0804A19C: .4byte gLCDControlBuffer
_0804A1A0:
	adds r0, r5, #0
	bl Proc_Break
	ldr r2, _0804A1CC  @ gLCDControlBuffer
	ldrb r1, [r2, #1]
	movs r0, #2
	negs r0, r0
	ands r0, r1
	movs r1, #3
	negs r1, r1
	ands r0, r1
_0804A1B6:
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2, #1]
_0804A1C4:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0804A1CC: .4byte gLCDControlBuffer

	THUMB_FUNC_END sub_804A158

	THUMB_FUNC_START sub_804A1D0
sub_804A1D0: @ 0x0804A1D0
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r0, _0804A208  @ gActiveUnit
	ldr r1, [r0]
	ldr r6, _0804A20C  @ gUnknown_0203DD90
	ldrb r0, [r6, #7]
	lsls r0, r0, #1
	adds r1, #0x1e
	adds r1, r1, r0
	ldrh r5, [r1]
	bl GetThread2SkipStack
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r4, #0x64
	strh r0, [r4]
	adds r0, r5, #0
	bl GetItemMinRange
	cmp r0, #1
	bne _0804A210
	adds r0, r5, #0
	bl GetItemMaxRange
	cmp r0, #1
	bne _0804A210
	strb r0, [r6, #6]
	b _0804A292
	.align 2, 0
_0804A208: .4byte gActiveUnit
_0804A20C: .4byte gUnknown_0203DD90
_0804A210:
	adds r0, r5, #0
	bl GetItemMinRange
	cmp r0, #2
	bne _0804A230
	adds r0, r5, #0
	bl GetItemMaxRange
	adds r1, r0, #0
	cmp r1, #2
	bne _0804A230
	ldr r0, _0804A22C  @ gUnknown_0203DD90
	strb r1, [r0, #6]
	b _0804A292
	.align 2, 0
_0804A22C: .4byte gUnknown_0203DD90
_0804A230:
	adds r0, r5, #0
	bl GetItemMinRange
	adds r4, r0, #0
	cmp r4, #2
	bne _0804A250
	adds r0, r5, #0
	bl GetItemMaxRange
	cmp r0, #3
	bne _0804A250
	ldr r0, _0804A24C  @ gUnknown_0203DD90
	strb r4, [r0, #6]
	b _0804A292
	.align 2, 0
_0804A24C: .4byte gUnknown_0203DD90
_0804A250:
	ldr r1, _0804A270  @ gUnknown_03001818
	ldr r4, _0804A274  @ gUnknown_0203DD90
	ldrb r0, [r4, #5]
	adds r0, r0, r1
	ldrb r0, [r0]
	bl GetUnit
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0
	bne _0804A278
	movs r0, #1
	strb r0, [r4, #6]
	b _0804A292
	.align 2, 0
_0804A270: .4byte gUnknown_03001818
_0804A274: .4byte gUnknown_0203DD90
_0804A278:
	adds r0, r5, #0
	bl GetItemMinRange
	cmp r0, #1
	ble _0804A288
	movs r0, #2
	strb r0, [r4, #6]
	b _0804A292
_0804A288:
	movs r0, #1
	strb r0, [r4, #6]
	movs r0, #4
	bl LoadIconPalettes
_0804A292:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_804A1D0

	THUMB_FUNC_START sub_804A298
sub_804A298: @ 0x0804A298
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r6, r0, #0
	movs r0, #0
	mov sl, r0
	movs r1, #1
	str r1, [sp, #4]
	ldr r4, _0804A320  @ gUnknown_03001818
	ldr r2, _0804A324  @ gUnknown_0203DD90
	mov r8, r2
	ldrb r0, [r2, #4]
	adds r0, r0, r4
	ldrb r0, [r0]
	bl GetUnit
	mov r9, r0
	mov r1, r8
	ldrb r0, [r1, #5]
	adds r0, r0, r4
	ldrb r0, [r0]
	bl GetUnit
	adds r5, r0, #0
	adds r0, r6, #0
	adds r0, #0x64
	movs r2, #0
	ldrsh r4, [r0, r2]
	bl GetThread2SkipStack
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r4, r0
	bne _0804A396
	movs r0, #0x11
	ldrsb r0, [r5, r0]
	adds r0, #1
	ldr r1, _0804A328  @ gBmMapTerrain
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r1, #0x10
	ldrsb r1, [r5, r1]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0x17
	beq _0804A304
	movs r0, #1
	negs r0, r0
	str r0, [sp, #4]
_0804A304:
	mov r1, r8
	ldrb r0, [r1, #6]
	cmp r0, #0
	bne _0804A330
	ldr r0, _0804A32C  @ gActiveUnit
	ldr r0, [r0]
	bl sub_80492B8
	adds r0, r6, #0
	movs r1, #0
	bl Proc_Goto
	b _0804A396
	.align 2, 0
_0804A320: .4byte gUnknown_03001818
_0804A324: .4byte gUnknown_0203DD90
_0804A328: .4byte gBmMapTerrain
_0804A32C: .4byte gActiveUnit
_0804A330:
	ldr r7, _0804A384  @ gActiveUnit
	ldr r0, [r7]
	mov r2, r8
	ldrb r1, [r2, #7]
	bl EquipUnitItemSlot
	ldr r4, [r5, #0xc]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r4, r0
	cmp r4, #0
	bne _0804A388
	adds r0, r6, #0
	bl NewBattleForecast
	mov r1, r8
	ldrb r0, [r1, #6]
	cmp r0, #2
	bne _0804A35A
	movs r2, #1
	mov sl, r2
_0804A35A:
	movs r2, #0x10
	ldrsb r2, [r5, r2]
	add r2, sl
	movs r3, #0x11
	ldrsb r3, [r5, r3]
	ldr r0, [sp, #4]
	adds r3, r3, r0
	str r4, [sp]
	mov r0, r9
	adds r1, r5, #0
	bl BattleGenerateSimulation
	bl sub_803738C
	ldr r0, [r7]
	bl sub_80492B8
	adds r0, r6, #0
	bl Proc_Break
	b _0804A396
	.align 2, 0
_0804A384: .4byte gActiveUnit
_0804A388:
	ldr r0, [r7]
	bl sub_80492B8
	adds r0, r6, #0
	movs r1, #1
	bl Proc_Goto
_0804A396:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_804A298

	THUMB_FUNC_START sub_804A3A8
sub_804A3A8: @ 0x0804A3A8
	push {r4, lr}
	adds r4, r0, #0
	ldr r2, _0804A3F4  @ gLCDControlBuffer
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
	ldr r0, _0804A3F8  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0804A400
	ldr r0, _0804A3FC  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0804A3E6
	movs r0, #0x6a
	bl m4aSongNumStart
_0804A3E6:
	bl sub_80373B4
	adds r0, r4, #0
	bl Proc_Break
	b _0804A426
	.align 2, 0
_0804A3F4: .4byte gLCDControlBuffer
_0804A3F8: .4byte gKeyStatusPtr
_0804A3FC: .4byte gRAMChapterData
_0804A400:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0804A426
	ldr r0, _0804A42C  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0804A41A
	movs r0, #0x6b
	bl m4aSongNumStart
_0804A41A:
	bl sub_80373B4
	adds r0, r4, #0
	movs r1, #0
	bl Proc_Goto
_0804A426:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804A42C: .4byte gRAMChapterData

	THUMB_FUNC_END sub_804A3A8

	THUMB_FUNC_START sub_804A430
sub_804A430: @ 0x0804A430
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0804A448  @ gUnknown_085AA1AC
	adds r1, r4, #0
	bl Proc_StartBlocking
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804A448: .4byte gUnknown_085AA1AC

	THUMB_FUNC_END sub_804A430

	THUMB_FUNC_START sub_804A44C
sub_804A44C: @ 0x0804A44C
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r1, _0804A480  @ gUnknown_03001818
	ldr r6, _0804A484  @ gUnknown_0203DD90
	ldrb r0, [r6, #5]
	adds r0, r0, r1
	ldrb r0, [r0]
	bl GetUnit
	adds r4, r0, #0
	bl ClearBg0Bg1
	ldrb r0, [r6, #6]
	cmp r0, #0
	bne _0804A4D8
	ldr r0, [r4, #0xc]
	movs r1, #0x80
	lsls r1, r1, #2
	ands r0, r1
	cmp r0, #0
	bne _0804A48C
	ldr r0, _0804A488  @ gUnknown_03001838
	ldr r0, [r0, #4]
	bl MU_End
	b _0804A494
	.align 2, 0
_0804A480: .4byte gUnknown_03001818
_0804A484: .4byte gUnknown_0203DD90
_0804A488: .4byte gUnknown_03001838
_0804A48C:
	ldr r0, [r5, #0x34]
	strb r0, [r4, #0x10]
	ldr r0, [r5, #0x38]
	strb r0, [r4, #0x11]
_0804A494:
	ldr r0, [r4, #0xc]
	movs r1, #2
	negs r1, r1
	ands r0, r1
	str r0, [r4, #0xc]
	bl SMS_UpdateFromGameData
	ldr r1, _0804A4D0  @ gUnknown_0203DD90
	ldrb r0, [r1, #5]
	strb r0, [r1, #2]
	adds r0, #1
	strb r0, [r1, #3]
	ldr r2, _0804A4D4  @ gUnknown_03001818
	ldrb r0, [r1, #5]
	adds r0, r0, r2
	ldrb r2, [r0]
	movs r0, #4
	movs r1, #0
	movs r3, #0
	bl sub_8049350
	adds r0, r5, #0
	bl sub_8049F38
	adds r0, r5, #0
	movs r1, #5
	bl Proc_Goto
	b _0804A50E
	.align 2, 0
_0804A4D0: .4byte gUnknown_0203DD90
_0804A4D4: .4byte gUnknown_03001818
_0804A4D8:
	ldr r0, [r4, #0xc]
	movs r1, #0x80
	lsls r1, r1, #2
	ands r0, r1
	cmp r0, #0
	beq _0804A502
	adds r0, r4, #0
	bl MU_Create
	ldr r1, _0804A514  @ gUnknown_03001838
	str r0, [r1, #4]
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	str r0, [r5, #0x34]
	movs r0, #0x11
	ldrsb r0, [r4, r0]
	str r0, [r5, #0x38]
	ldr r0, [r4, #0xc]
	ldr r1, _0804A518  @ 0xFFFFFDFF
	ands r0, r1
	str r0, [r4, #0xc]
_0804A502:
	ldrb r2, [r6, #6]
	ldrb r3, [r6, #7]
	movs r0, #5
	movs r1, #0
	bl sub_8049350
_0804A50E:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0804A514: .4byte gUnknown_03001838
_0804A518: .4byte 0xFFFFFDFF

	THUMB_FUNC_END sub_804A44C

	THUMB_FUNC_START sub_804A51C
sub_804A51C: @ 0x0804A51C
	push {r4, r5, r6, lr}
	mov r6, r9
	mov r5, r8
	push {r5, r6}
	sub sp, #0xc
	adds r5, r0, #0
	ldr r0, _0804A598  @ gUnknown_03001818
	mov r8, r0
	ldr r4, _0804A59C  @ gUnknown_0203DD90
	ldrb r0, [r4, #4]
	add r0, r8
	ldrb r0, [r0]
	bl GetUnit
	adds r6, r0, #0
	ldrb r0, [r4, #5]
	add r0, r8
	ldrb r0, [r0]
	bl GetUnit
	adds r4, r0, #0
	ldr r0, [r5, #0x2c]
	movs r1, #0
	mov r9, r1
	strb r0, [r6, #0x10]
	ldr r0, [r5, #0x30]
	strb r0, [r6, #0x11]
	ldr r0, [r5, #0x34]
	strb r0, [r4, #0x10]
	ldr r0, [r5, #0x38]
	strb r0, [r4, #0x11]
	ldr r0, _0804A5A0  @ gUnknown_03001838
	mov r8, r0
	ldr r1, [r0]
	movs r0, #1
	str r0, [sp]
	str r0, [sp, #4]
	str r5, [sp, #8]
	adds r0, r6, #0
	movs r2, #6
	movs r3, #5
	bl sub_804C208
	mov r0, r8
	ldr r1, [r0, #4]
	mov r0, r9
	str r0, [sp]
	str r0, [sp, #4]
	str r5, [sp, #8]
	adds r0, r4, #0
	movs r2, #8
	movs r3, #5
	bl sub_804C208
	add sp, #0xc
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0804A598: .4byte gUnknown_03001818
_0804A59C: .4byte gUnknown_0203DD90
_0804A5A0: .4byte gUnknown_03001838

	THUMB_FUNC_END sub_804A51C

	THUMB_FUNC_START sub_804A5A4
sub_804A5A4: @ 0x0804A5A4
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	ldr r5, _0804A600  @ gUnknown_03001818
	ldr r4, _0804A604  @ gUnknown_0203DD90
	ldrb r0, [r4, #4]
	adds r0, r0, r5
	ldrb r0, [r0]
	bl GetUnit
	adds r7, r0, #0
	ldr r1, _0804A608  @ gUnknown_080D9FB7
	mov r0, sp
	movs r2, #2
	bl memcpy
	ldr r6, _0804A60C  @ gUnknown_03001838
	ldr r0, [r6, #4]
	bl MU_End
	ldrb r0, [r4, #5]
	adds r0, r0, r5
	ldrb r0, [r0]
	bl GetUnit
	ldr r1, [r0, #0xc]
	movs r2, #2
	negs r2, r2
	ands r1, r2
	str r1, [r0, #0xc]
	ldr r0, _0804A610  @ gUnknown_03001834
	ldrb r0, [r0, #2]
	cmp r0, #1
	bne _0804A5F2
	ldr r0, [r6]
	mov r1, sp
	bl MU_StartMoveScript
	movs r0, #7
	strb r0, [r7, #0x10]
_0804A5F2:
	bl sub_80492D8
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804A600: .4byte gUnknown_03001818
_0804A604: .4byte gUnknown_0203DD90
_0804A608: .4byte gUnknown_080D9FB7
_0804A60C: .4byte gUnknown_03001838
_0804A610: .4byte gUnknown_03001834

	THUMB_FUNC_END sub_804A5A4

	THUMB_FUNC_START sub_804A614
sub_804A614: @ 0x0804A614
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r7, r0, #0
	bl MU_IsAnyActive
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq _0804A682
	ldr r5, _0804A68C  @ gUnknown_03001818
	ldr r4, _0804A690  @ gUnknown_0203DD90
	ldrb r0, [r4, #4]
	adds r0, r0, r5
	ldrb r0, [r0]
	bl GetUnit
	adds r6, r0, #0
	ldrb r0, [r4, #5]
	adds r0, r0, r5
	ldrb r0, [r0]
	bl GetUnit
	mov r8, r0
	adds r0, r6, #0
	bl HideUnitSMS
	ldr r1, _0804A694  @ gActionData
	movs r0, #2
	strb r0, [r1, #0x11]
	ldrb r0, [r4, #5]
	adds r0, r0, r5
	ldrb r0, [r0]
	strb r0, [r1, #0xd]
	ldr r0, _0804A698  @ gUnknown_03001834
	ldrb r1, [r0, #3]
	adds r0, r6, #0
	bl EquipUnitItemSlot
	adds r0, r6, #0
	mov r1, r8
	bl BattleGenerateReal
	ldr r2, _0804A69C  @ gUnknown_0202BCB0
	ldrb r1, [r2, #4]
	movs r0, #0x40
	orrs r0, r1
	strb r0, [r2, #4]
	ldr r0, _0804A6A0  @ gUnknown_085AA75C
	adds r1, r7, #0
	bl Proc_StartBlocking
	adds r0, r7, #0
	bl Proc_Break
_0804A682:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804A68C: .4byte gUnknown_03001818
_0804A690: .4byte gUnknown_0203DD90
_0804A694: .4byte gActionData
_0804A698: .4byte gUnknown_03001834
_0804A69C: .4byte gUnknown_0202BCB0
_0804A6A0: .4byte gUnknown_085AA75C

	THUMB_FUNC_END sub_804A614

	THUMB_FUNC_START sub_804A6A4
sub_804A6A4: @ 0x0804A6A4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	mov sl, r0
	ldr r1, _0804A790  @ gUnknown_03001818
	ldr r0, _0804A794  @ gUnknown_0203DD90
	mov r8, r0
	ldrb r0, [r0, #4]
	adds r0, r0, r1
	ldrb r4, [r0]
	mov r2, r8
	ldrb r0, [r2, #5]
	adds r0, r0, r1
	ldrb r5, [r0]
	adds r0, r4, #0
	bl GetUnit
	adds r6, r0, #0
	adds r0, r5, #0
	bl GetUnit
	adds r7, r0, #0
	bl sub_8049788
	lsrs r0, r4, #6
	lsls r0, r0, #3
	mov r2, r8
	adds r2, #0x30
	adds r3, r0, r2
	ldr r1, _0804A798  @ gBattleActor
	mov r9, r1
	adds r1, #0x6e
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	str r1, [r3]
	add r0, r8
	adds r0, #0x2c
	movs r3, #0
	strb r4, [r0]
	strb r3, [r6, #9]
	lsrs r0, r5, #6
	lsls r0, r0, #3
	adds r2, r0, r2
	ldr r4, _0804A79C  @ gBattleTarget
	adds r1, r4, #0
	adds r1, #0x6e
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	str r1, [r2]
	add r0, r8
	adds r0, #0x2c
	strb r5, [r0]
	strb r3, [r7, #9]
	adds r0, r6, #0
	bl sub_804D40C
	adds r0, r7, #0
	bl sub_804D40C
	adds r0, r6, #0
	movs r1, #0
	bl SetUnitStatus
	adds r0, r7, #0
	movs r1, #0
	bl SetUnitStatus
	bl MU_EndAll
	adds r0, r6, #0
	bl GetUnitCurrentHp
	cmp r0, #0
	beq _0804A750
	adds r0, r6, #0
	bl ShowUnitSMS
	ldr r0, [r6, #0xc]
	movs r1, #2
	negs r1, r1
	ands r0, r1
	str r0, [r6, #0xc]
_0804A750:
	bl sub_80492D8
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	adds r0, r6, #0
	bl GetUnitCurrentHp
	mov r1, r9
	adds r1, #0x72
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	cmp r0, r1
	bne _0804A7A0
	adds r0, r7, #0
	bl GetUnitCurrentHp
	adds r1, r4, #0
	adds r1, #0x72
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	cmp r0, r1
	bne _0804A7A0
	mov r2, r8
	ldrb r0, [r2, #9]
	adds r0, #1
	strb r0, [r2, #9]
	b _0804A7A6
	.align 2, 0
_0804A790: .4byte gUnknown_03001818
_0804A794: .4byte gUnknown_0203DD90
_0804A798: .4byte gBattleActor
_0804A79C: .4byte gBattleTarget
_0804A7A0:
	ldr r1, _0804A7BC  @ gUnknown_0203DD90
	movs r0, #0
	strb r0, [r1, #9]
_0804A7A6:
	mov r0, sl
	bl Proc_Break
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804A7BC: .4byte gUnknown_0203DD90

	THUMB_FUNC_END sub_804A6A4

	THUMB_FUNC_START sub_804A7C0
sub_804A7C0: @ 0x0804A7C0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x18
	str r0, [sp, #0xc]
	ldr r1, _0804A830  @ gUnknown_03001818
	ldr r0, _0804A834  @ gUnknown_0203DD90
	mov sl, r0
	ldrb r0, [r0, #4]
	adds r0, r0, r1
	ldrb r0, [r0]
	adds r5, r0, #0
	mov r2, sl
	ldrb r0, [r2, #5]
	adds r0, r0, r1
	ldrb r0, [r0]
	mov r9, r0
	adds r0, r5, #0
	bl GetUnit
	adds r4, r0, #0
	mov r0, r9
	bl GetUnit
	mov r8, r0
	movs r7, #0
	adds r0, r5, #0
	bl sub_80493A8
	str r0, [sp, #0x10]
	mov r0, r9
	bl sub_80493A8
	str r0, [sp, #0x14]
	ldr r6, _0804A838  @ gUnknown_03001838
	str r7, [r6, #4]
	str r7, [r6]
	ldr r0, [r4, #0xc]
	ldr r1, _0804A83C  @ 0x00010004
	ands r0, r1
	cmp r0, #0
	bne _0804A81E
	ldr r0, [r4]
	cmp r0, #0
	bne _0804A840
_0804A81E:
	lsrs r0, r5, #6
	mov r1, sl
	adds r1, #0xa
	adds r0, r0, r1
	ldrb r1, [r0]
	subs r1, #1
	strb r1, [r0]
	b _0804A878
	.align 2, 0
_0804A830: .4byte gUnknown_03001818
_0804A834: .4byte gUnknown_0203DD90
_0804A838: .4byte gUnknown_03001838
_0804A83C: .4byte 0x00010004
_0804A840:
	adds r0, r4, #0
	bl MU_Create
	str r0, [r6]
	bl MU_DisableAttractCamera
	ldr r0, [r4, #0xc]
	movs r1, #1
	orrs r0, r1
	str r0, [r4, #0xc]
	movs r7, #1
	ldr r1, [r6]
	ldr r2, _0804A8A0  @ gUnknown_080D9F48
	ldr r3, [sp, #0x10]
	lsls r0, r3, #2
	adds r0, r0, r2
	movs r5, #0
	ldrsh r2, [r0, r5]
	movs r5, #2
	ldrsh r3, [r0, r5]
	movs r0, #2
	str r0, [sp]
	str r7, [sp, #4]
	ldr r0, [sp, #0xc]
	str r0, [sp, #8]
	adds r0, r4, #0
	bl sub_804C208
_0804A878:
	mov r1, r8
	ldr r0, [r1, #0xc]
	ldr r1, _0804A8A4  @ 0x00010004
	ands r0, r1
	cmp r0, #0
	bne _0804A88C
	mov r2, r8
	ldr r0, [r2]
	cmp r0, #0
	bne _0804A8AC
_0804A88C:
	ldr r0, _0804A8A8  @ gUnknown_0203DD90
	mov r3, r9
	lsrs r1, r3, #6
	adds r0, #0xa
	adds r1, r1, r0
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	b _0804A8F0
	.align 2, 0
_0804A8A0: .4byte gUnknown_080D9F48
_0804A8A4: .4byte 0x00010004
_0804A8A8: .4byte gUnknown_0203DD90
_0804A8AC:
	mov r0, r8
	bl MU_Create
	ldr r4, _0804A90C  @ gUnknown_03001838
	str r0, [r4, #4]
	bl MU_DisableAttractCamera
	mov r5, r8
	ldr r0, [r5, #0xc]
	movs r1, #1
	orrs r0, r1
	str r0, [r5, #0xc]
	adds r0, r7, #0
	movs r7, #0
	cmp r0, #0
	bne _0804A8CE
	movs r7, #1
_0804A8CE:
	ldr r1, [r4, #4]
	ldr r2, _0804A910  @ gUnknown_080D9F48
	ldr r3, [sp, #0x14]
	lsls r0, r3, #2
	adds r0, r0, r2
	movs r4, #0
	ldrsh r2, [r0, r4]
	movs r5, #2
	ldrsh r3, [r0, r5]
	movs r0, #2
	str r0, [sp]
	str r7, [sp, #4]
	ldr r0, [sp, #0xc]
	str r0, [sp, #8]
	mov r0, r8
	bl sub_804C208
_0804A8F0:
	bl sub_80492D8
	ldr r0, [sp, #0xc]
	bl Proc_Break
	add sp, #0x18
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804A90C: .4byte gUnknown_03001838
_0804A910: .4byte gUnknown_080D9F48

	THUMB_FUNC_END sub_804A7C0

	THUMB_FUNC_START sub_804A914
sub_804A914: @ 0x0804A914
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	movs r3, #0
_0804A91E:
	lsls r0, r3, #0x18
	lsrs r0, r0, #0x18
	str r3, [sp]
	bl sub_8042194
	lsls r0, r0, #0x18
	ldr r3, [sp]
	adds r1, r3, #1
	mov r8, r1
	cmp r0, #0
	beq _0804A984
	movs r6, #0
	movs r7, #0
	ldr r0, _0804A998  @ gUnknown_03001818
	adds r4, r3, r0
	movs r5, #4
_0804A93E:
	ldrb r0, [r4]
	cmp r0, #0
	beq _0804A96C
	adds r7, #1
	str r3, [sp]
	bl GetUnit
	adds r2, r0, #0
	ldr r0, [r2, #0xc]
	ldr r1, _0804A99C  @ 0x00010004
	ands r0, r1
	ldr r3, [sp]
	cmp r0, #0
	bne _0804A96C
	adds r0, r2, #0
	bl sub_8049C94
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldr r3, [sp]
	cmp r0, #1
	bne _0804A96C
	adds r6, #1
_0804A96C:
	adds r4, #5
	subs r5, #1
	cmp r5, #0
	bge _0804A93E
	cmp r6, #0
	bne _0804A984
	cmp r7, #0
	beq _0804A984
	ldr r0, _0804A9A0  @ gUnknown_0203DD90
	adds r0, #0xa
	adds r0, r3, r0
	strb r6, [r0]
_0804A984:
	mov r3, r8
	cmp r3, #3
	ble _0804A91E
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804A998: .4byte gUnknown_03001818
_0804A99C: .4byte 0x00010004
_0804A9A0: .4byte gUnknown_0203DD90

	THUMB_FUNC_END sub_804A914

	THUMB_FUNC_START sub_804A9A4
sub_804A9A4: @ 0x0804A9A4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	ldr r1, _0804AA48  @ gUnknown_03001818
	ldr r5, _0804AA4C  @ gUnknown_0203DD90
	ldrb r0, [r5, #4]
	adds r0, r0, r1
	ldrb r6, [r0]
	ldrb r0, [r5, #5]
	adds r0, r0, r1
	ldrb r7, [r0]
	adds r0, r6, #0
	bl GetUnit
	adds r4, r0, #0
	adds r0, r7, #0
	bl GetUnit
	adds r2, r0, #0
	ldr r1, [r4, #0xc]
	ldr r3, _0804AA50  @ 0x00010004
	adds r0, r1, #0
	ands r0, r3
	cmp r0, #0
	bne _0804A9E0
	movs r0, #2
	negs r0, r0
	ands r1, r0
	str r1, [r4, #0xc]
_0804A9E0:
	ldr r1, [r2, #0xc]
	adds r0, r1, #0
	ands r0, r3
	cmp r0, #0
	bne _0804A9F2
	movs r0, #2
	negs r0, r0
	ands r1, r0
	str r1, [r2, #0xc]
_0804A9F2:
	lsrs r0, r6, #6
	adds r1, r0, #0
	adds r2, r5, #0
	adds r2, #0xa
	adds r0, r1, r2
	ldrb r0, [r0]
	adds r5, r1, #0
	cmp r0, #0
	beq _0804AA0E
	lsrs r1, r7, #6
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, #0
	bne _0804AA6A
_0804AA0E:
	adds r4, r1, #0
	ldr r2, _0804AA4C  @ gUnknown_0203DD90
	ldr r3, _0804AA54  @ gUnknown_0203DA24
	adds r3, #0xa0
	ldrb r0, [r3]
	ldrb r1, [r2, #0xe]
	subs r0, r0, r1
	adds r1, r2, #0
	adds r1, #0xf
	adds r0, r0, r1
	strb r4, [r0]
	ldrb r0, [r2, #0xe]
	adds r0, #1
	strb r0, [r2, #0xe]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrb r3, [r3]
	cmp r0, r3
	bne _0804AA6A
	adds r1, r5, #0
	adds r0, r2, #0
	adds r0, #0xa
	adds r0, r1, r0
	ldrb r0, [r0]
	cmp r0, #0
	beq _0804AA58
	adds r4, r1, #0
	b _0804AA5A
	.align 2, 0
_0804AA48: .4byte gUnknown_03001818
_0804AA4C: .4byte gUnknown_0203DD90
_0804AA50: .4byte 0x00010004
_0804AA54: .4byte gUnknown_0203DA24
_0804AA58:
	lsrs r4, r7, #6
_0804AA5A:
	strb r4, [r2, #0xf]
	movs r0, #0xff
	bl sub_80492E8
	mov r0, r8
	bl Proc_Break
	b _0804AA78
_0804AA6A:
	ldr r0, _0804AA84  @ gRAMChapterData
	ldrb r0, [r0, #0xf]
	bl sub_80492E8
	mov r0, r8
	bl Proc_Break
_0804AA78:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804AA84: .4byte gRAMChapterData

	THUMB_FUNC_END sub_804A9A4

	THUMB_FUNC_START sub_804AA88
sub_804AA88: @ 0x0804AA88
	push {lr}
	bl MU_EndAll
	bl MU_EndAll
	bl sub_8049594
	bl sub_80495F4
	bl SMS_UpdateFromGameData
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_804AA88

	THUMB_FUNC_START sub_804AAA4
sub_804AAA4: @ 0x0804AAA4
	push {lr}
	ldr r0, _0804AAD0  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0804AACC
	ldr r0, _0804AAD4  @ gUnknown_03004F0C
	movs r2, #0
	movs r1, #0x84
	strb r1, [r0]
	ldr r1, _0804AAD8  @ gUnknown_085A92E0
	ldr r1, [r1]
	ldrb r1, [r1, #6]
	strb r1, [r0, #1]
	strh r2, [r0, #2]
	movs r1, #4
	bl sub_80422B8
_0804AACC:
	pop {r0}
	bx r0
	.align 2, 0
_0804AAD0: .4byte gKeyStatusPtr
_0804AAD4: .4byte gUnknown_03004F0C
_0804AAD8: .4byte gUnknown_085A92E0

	THUMB_FUNC_END sub_804AAA4

	THUMB_FUNC_START sub_804AADC
sub_804AADC: @ 0x0804AADC
	push {lr}
	ldrb r0, [r0]
	cmp r0, #1
	beq _0804AAF0
	cmp r0, #1
	blt _0804AAF4
	cmp r0, #7
	bgt _0804AAF4
	cmp r0, #6
	blt _0804AAF4
_0804AAF0:
	movs r0, #1
	b _0804AAF6
_0804AAF4:
	movs r0, #0
_0804AAF6:
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_804AADC

	THUMB_FUNC_START sub_804AAFC
sub_804AAFC: @ 0x0804AAFC
	push {r4, r5, lr}
	sub sp, #8
	adds r5, r0, #0
	ldr r4, _0804AB24  @ gUnknown_03001834
	ldr r2, _0804AB28  @ sub_804AADC
	adds r0, r4, #0
	add r1, sp, #4
	bl sub_804279C
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _0804ABA4
	ldrb r0, [r4]
	cmp r0, #6
	beq _0804AB54
	cmp r0, #6
	bgt _0804AB2C
	cmp r0, #1
	beq _0804AB32
	b _0804ABA4
	.align 2, 0
_0804AB24: .4byte gUnknown_03001834
_0804AB28: .4byte sub_804AADC
_0804AB2C:
	cmp r0, #7
	beq _0804AB8C
	b _0804ABA4
_0804AB32:
	ldrb r0, [r4, #1]
	ldr r2, _0804AB50  @ gUnknown_0203DD94
	adds r3, r5, #0
	adds r3, #0x2c
	adds r1, r5, #0
	adds r1, #0x30
	str r1, [sp]
	movs r1, #0
	bl sub_80493D0
	adds r0, r5, #0
	movs r1, #1
	bl Proc_Goto
	b _0804ABA4
	.align 2, 0
_0804AB50: .4byte gUnknown_0203DD94
_0804AB54:
	bl sub_8048A94
	add r0, sp, #4
	ldrb r1, [r0]
	lsls r0, r1, #4
	subs r0, r0, r1
	ldr r1, _0804AB80  @ gUnknown_0203DAC5
	adds r0, r0, r1
	ldr r1, _0804AB84  @ gUnknown_03001850
	bl sub_8042DC8
	ldr r0, _0804AB88  @ gUnknown_085AA1FC
	movs r1, #0x60
	movs r2, #0
	movs r3, #0
	bl NewPopupSimple
	adds r0, r5, #0
	movs r1, #3
	bl Proc_Goto
	b _0804ABA4
	.align 2, 0
_0804AB80: .4byte gUnknown_0203DAC5
_0804AB84: .4byte gUnknown_03001850
_0804AB88: .4byte gUnknown_085AA1FC
_0804AB8C:
	bl sub_8048A94
	ldr r0, _0804ABB0  @ gUnknown_085AA21C
	movs r1, #0x60
	movs r2, #0
	movs r3, #0
	bl NewPopupSimple
	adds r0, r5, #0
	movs r1, #4
	bl Proc_Goto
_0804ABA4:
	bl sub_804AAA4
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0804ABB0: .4byte gUnknown_085AA21C

	THUMB_FUNC_END sub_804AAFC

	THUMB_FUNC_START sub_804ABB4
sub_804ABB4: @ 0x0804ABB4
	push {lr}
	ldrb r0, [r0]
	cmp r0, #3
	bgt _0804ABC4
	cmp r0, #2
	blt _0804ABC4
	movs r0, #1
	b _0804ABC6
_0804ABC4:
	movs r0, #0
_0804ABC6:
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_804ABB4

	THUMB_FUNC_START sub_804ABCC
sub_804ABCC: @ 0x0804ABCC
	push {r4, r5, lr}
	sub sp, #8
	adds r5, r0, #0
	ldr r4, _0804ABF0  @ gUnknown_03001834
	ldr r2, _0804ABF4  @ sub_804ABB4
	adds r0, r4, #0
	add r1, sp, #4
	bl sub_804279C
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _0804AC58
	ldrb r0, [r4]
	cmp r0, #2
	beq _0804ABF8
	cmp r0, #3
	beq _0804AC3C
	b _0804AC58
	.align 2, 0
_0804ABF0: .4byte gUnknown_03001834
_0804ABF4: .4byte sub_804ABB4
_0804ABF8:
	ldrb r0, [r4, #2]
	bl GetUnit
	adds r4, r0, #0
	ldr r0, [r4, #0xc]
	movs r1, #0x80
	lsls r1, r1, #2
	ands r0, r1
	cmp r0, #0
	bne _0804AC1C
	ldr r0, _0804AC18  @ gUnknown_03001838
	ldr r0, [r0]
	bl MU_End
	b _0804AC24
	.align 2, 0
_0804AC18: .4byte gUnknown_03001838
_0804AC1C:
	ldr r0, [r5, #0x2c]
	strb r0, [r4, #0x10]
	ldr r0, [r5, #0x30]
	strb r0, [r4, #0x11]
_0804AC24:
	ldr r0, [r4, #0xc]
	movs r1, #2
	negs r1, r1
	ands r0, r1
	str r0, [r4, #0xc]
	bl SMS_UpdateFromGameData
	adds r0, r5, #0
	movs r1, #0
	bl Proc_Goto
	b _0804AC58
_0804AC3C:
	ldrb r0, [r4, #1]
	ldr r2, _0804AC64  @ gUnknown_0203DD95
	adds r3, r5, #0
	adds r3, #0x34
	adds r1, r5, #0
	adds r1, #0x38
	str r1, [sp]
	movs r1, #1
	bl sub_80493D0
	adds r0, r5, #0
	movs r1, #2
	bl Proc_Goto
_0804AC58:
	bl sub_804AAA4
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0804AC64: .4byte gUnknown_0203DD95

	THUMB_FUNC_END sub_804ABCC

	THUMB_FUNC_START sub_804AC68
sub_804AC68: @ 0x0804AC68
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r5, r0, #0
	adds r4, r1, #0
	adds r6, r2, #0
	mov r8, r3
	bl MU_Create
	ldr r1, _0804ACA4  @ gUnknown_03001838
	lsls r4, r4, #2
	adds r4, r4, r1
	str r0, [r4]
	movs r0, #0x10
	ldrsb r0, [r5, r0]
	str r0, [r6]
	movs r0, #0x11
	ldrsb r0, [r5, r0]
	mov r1, r8
	str r0, [r1]
	ldr r0, [r5, #0xc]
	ldr r1, _0804ACA8  @ 0xFFFFFDFF
	ands r0, r1
	str r0, [r5, #0xc]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0804ACA4: .4byte gUnknown_03001838
_0804ACA8: .4byte 0xFFFFFDFF

	THUMB_FUNC_END sub_804AC68

	THUMB_FUNC_START sub_804ACAC
sub_804ACAC: @ 0x0804ACAC
	push {lr}
	ldrb r0, [r0]
	cmp r0, #5
	bgt _0804ACBC
	cmp r0, #4
	blt _0804ACBC
	movs r0, #1
	b _0804ACBE
_0804ACBC:
	movs r0, #0
_0804ACBE:
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_804ACAC

	THUMB_FUNC_START sub_804ACC4
sub_804ACC4: @ 0x0804ACC4
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r7, r0, #0
	ldr r4, _0804ACE8  @ gUnknown_03001834
	ldr r2, _0804ACEC  @ sub_804ACAC
	adds r0, r4, #0
	mov r1, sp
	bl sub_804279C
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _0804AD8A
	ldrb r0, [r4]
	cmp r0, #4
	beq _0804ACF0
	cmp r0, #5
	beq _0804AD34
	b _0804AD8A
	.align 2, 0
_0804ACE8: .4byte gUnknown_03001834
_0804ACEC: .4byte sub_804ACAC
_0804ACF0:
	ldrb r0, [r4, #2]
	bl GetUnit
	adds r6, r0, #0
	ldr r0, [r6, #0xc]
	movs r1, #0x80
	lsls r1, r1, #2
	ands r0, r1
	cmp r0, #0
	bne _0804AD14
	ldr r0, _0804AD10  @ gUnknown_03001838
	ldr r0, [r0, #4]
	bl MU_End
	b _0804AD1C
	.align 2, 0
_0804AD10: .4byte gUnknown_03001838
_0804AD14:
	ldr r0, [r7, #0x34]
	strb r0, [r6, #0x10]
	ldr r0, [r7, #0x38]
	strb r0, [r6, #0x11]
_0804AD1C:
	ldr r0, [r6, #0xc]
	movs r1, #2
	negs r1, r1
	ands r0, r1
	str r0, [r6, #0xc]
	bl SMS_UpdateFromGameData
	adds r0, r7, #0
	movs r1, #1
	bl Proc_Goto
	b _0804AD8A
_0804AD34:
	ldr r5, _0804AD98  @ gUnknown_03001818
	ldr r4, _0804AD9C  @ gUnknown_0203DD90
	ldrb r0, [r4, #4]
	adds r0, r0, r5
	ldrb r0, [r0]
	bl GetUnit
	adds r6, r0, #0
	ldrb r0, [r4, #5]
	adds r0, r0, r5
	ldrb r0, [r0]
	bl GetUnit
	adds r4, r0, #0
	ldr r0, [r6, #0xc]
	movs r5, #0x80
	lsls r5, r5, #2
	ands r0, r5
	cmp r0, #0
	beq _0804AD6C
	adds r2, r7, #0
	adds r2, #0x2c
	adds r3, r7, #0
	adds r3, #0x30
	adds r0, r6, #0
	movs r1, #0
	bl sub_804AC68
_0804AD6C:
	ldr r0, [r4, #0xc]
	ands r0, r5
	cmp r0, #0
	beq _0804AD84
	adds r2, r7, #0
	adds r2, #0x34
	adds r3, r7, #0
	adds r3, #0x38
	adds r0, r4, #0
	movs r1, #1
	bl sub_804AC68
_0804AD84:
	adds r0, r7, #0
	bl Proc_Break
_0804AD8A:
	bl sub_804AAA4
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804AD98: .4byte gUnknown_03001818
_0804AD9C: .4byte gUnknown_0203DD90

	THUMB_FUNC_END sub_804ACC4

	THUMB_FUNC_START sub_804ADA0
sub_804ADA0: @ 0x0804ADA0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	movs r7, #0
	movs r0, #0
	mov r8, r0
	movs r5, #0
	ldrh r4, [r6, #0x1e]
	cmp r4, #0
	beq _0804ADEC
_0804ADB6:
	adds r0, r6, #0
	adds r1, r4, #0
	bl CanUnitUseWeapon
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0804ADD8
	adds r0, r4, #0
	bl GetItemMight
	cmp r0, r8
	bls _0804ADD8
	adds r7, r4, #0
	adds r0, r7, #0
	bl GetItemMight
	mov r8, r0
_0804ADD8:
	adds r5, #1
	cmp r5, #4
	bgt _0804ADEC
	lsls r1, r5, #1
	adds r0, r6, #0
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r4, [r0]
	cmp r4, #0
	bne _0804ADB6
_0804ADEC:
	cmp r7, #0
	beq _0804ADFA
	adds r0, r6, #0
	bl GetUnitPower
	add r0, r8
	b _0804ADFC
_0804ADFA:
	movs r0, #0
_0804ADFC:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_804ADA0

	THUMB_FUNC_START sub_804AE08
sub_804AE08: @ 0x0804AE08
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r7, r0, #0
	movs r0, #0
	mov r8, r0
	movs r6, #0
	adds r5, r7, #0
	adds r0, r7, #5
	cmp r7, r0
	bge _0804AE52
_0804AE1E:
	adds r0, r5, #0
	bl GetUnit
	adds r4, r0, #0
	ldr r0, [r4, #0xc]
	ldr r1, _0804AE74  @ 0x00010004
	ands r0, r1
	cmp r0, #0
	bne _0804AE4A
	ldr r0, [r4]
	cmp r0, #0
	beq _0804AE4A
	movs r0, #1
	add r8, r0
	adds r0, r4, #0
	bl sub_804ADA0
	adds r6, r6, r0
	adds r0, r4, #0
	bl GetUnitCurrentHp
	adds r6, r6, r0
_0804AE4A:
	adds r5, #1
	adds r0, r7, #5
	cmp r5, r0
	blt _0804AE1E
_0804AE52:
	ldr r0, _0804AE78  @ gUnknown_0203DD90
	asrs r1, r7, #6
	lsls r1, r1, #2
	adds r0, #0x14
	adds r1, r1, r0
	ldr r0, [r1]
	adds r6, r6, r0
	adds r0, r6, #0
	mov r1, r8
	bl Div
	adds r6, r0, #0
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0804AE74: .4byte 0x00010004
_0804AE78: .4byte gUnknown_0203DD90

	THUMB_FUNC_END sub_804AE08

	THUMB_FUNC_START sub_804AE7C
sub_804AE7C: @ 0x0804AE7C
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	ldr r0, _0804AEB4  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #4]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _0804AEBC
	bl sub_8048A94
	str r4, [r5, #0x58]
	ldr r0, _0804AEB8  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0804AEB0
	movs r0, #0x68
	bl m4aSongNumStart
	adds r0, r5, #0
	movs r1, #3
	bl Proc_Goto
_0804AEB0:
	movs r0, #1
	b _0804AEBE
	.align 2, 0
_0804AEB4: .4byte gKeyStatusPtr
_0804AEB8: .4byte gRAMChapterData
_0804AEBC:
	movs r0, #0
_0804AEBE:
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_804AE7C

	THUMB_FUNC_START sub_804AEC4
sub_804AEC4: @ 0x0804AEC4
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	movs r6, #1
	negs r6, r6
	movs r1, #0
	bl sub_804AE7C
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq _0804AF1C
	movs r4, #0
_0804AEDC:
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	bl sub_8042194
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0804AF10
	ldr r5, _0804AF24  @ gUnknown_0203DD90
	adds r0, r5, #0
	adds r0, #0xa
	adds r0, r4, r0
	ldrb r0, [r0]
	cmp r0, #0
	beq _0804AF10
	ldr r0, _0804AF28  @ gRAMChapterData
	ldrb r0, [r0, #0xf]
	cmp r0, r4
	beq _0804AF10
	lsls r0, r4, #6
	adds r0, #1
	bl sub_804AE08
	cmp r6, r0
	bls _0804AF10
	adds r6, r0, #0
	strb r4, [r5, #2]
_0804AF10:
	adds r4, #1
	cmp r4, #3
	ble _0804AEDC
	adds r0, r7, #0
	bl Proc_Break
_0804AF1C:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804AF24: .4byte gUnknown_0203DD90
_0804AF28: .4byte gRAMChapterData

	THUMB_FUNC_END sub_804AEC4

	THUMB_FUNC_START ITEMRANGEDONE_sub_804AF2C
ITEMRANGEDONE_sub_804AF2C: @ 0x0804AF2C
	push {r4, lr}
	adds r0, r1, #0
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r4, r0, #0
	cmp r0, #0
	beq _0804AF50
	bl GetItemMaxRange
	cmp r0, #1
	beq _0804AF50
	adds r0, r4, #0
	bl GetItemMinRange
	cmp r0, #1
	bgt _0804AF54
_0804AF50:
	movs r0, #1
	b _0804AF56
_0804AF54:
	movs r0, #2
_0804AF56:
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END ITEMRANGEDONE_sub_804AF2C

	THUMB_FUNC_START sub_804AF5C
sub_804AF5C: @ 0x0804AF5C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x3c
	str r0, [sp, #0x10]
	movs r0, #0
	str r0, [sp, #0x18]
	movs r1, #0
	str r1, [sp, #0x1c]
	movs r2, #0
	str r2, [sp, #0x20]
	ldr r0, [sp, #0x10]
	movs r1, #1
	bl sub_804AE7C
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _0804AF88
	b _0804B176
_0804AF88:
	ldr r0, _0804B0C8  @ gAiState
	adds r0, #0x7d
	movs r1, #0xe
	strb r1, [r0]
	ldr r0, _0804B0CC  @ gRAMChapterData
	ldrb r0, [r0, #0xf]
	lsls r0, r0, #6
	str r0, [sp, #0x14]
	adds r4, r0, #0
	adds r4, #1
	adds r0, #6
	ldr r1, [sp, #0x10]
	adds r1, #0x2c
	str r1, [sp, #0x34]
	ldr r2, [sp, #0x10]
	adds r2, #0x30
	str r2, [sp, #0x38]
	cmp r4, r0
	blt _0804AFB0
	b _0804B158
_0804AFB0:
	ldr r0, _0804B0D0  @ gActiveUnitId
	strb r4, [r0]
	ldrb r0, [r0]
	bl GetUnit
	adds r2, r0, #0
	ldr r0, _0804B0D4  @ gActiveUnit
	str r2, [r0]
	ldr r1, [r2, #0xc]
	ldr r0, _0804B0D8  @ 0x00010004
	ands r1, r0
	ldr r0, [sp, #0x14]
	adds r0, #6
	str r0, [sp, #0x30]
	adds r4, #1
	str r4, [sp, #0x28]
	cmp r1, #0
	beq _0804AFD6
	b _0804B14E
_0804AFD6:
	ldr r0, [r2]
	cmp r0, #0
	bne _0804AFDE
	b _0804B14E
_0804AFDE:
	movs r5, #0
_0804AFE0:
	ldr r0, _0804B0D4  @ gActiveUnit
	ldr r2, [r0]
	lsls r1, r5, #1
	adds r0, r2, #0
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r4, [r0]
	adds r6, r4, #0
	adds r1, r5, #1
	str r1, [sp, #0x2c]
	cmp r4, #0
	bne _0804AFFA
	b _0804B146
_0804AFFA:
	adds r0, r2, #0
	adds r1, r4, #0
	bl CanUnitUseWeapon
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0804B00A
	b _0804B146
_0804B00A:
	mov sl, r5
	movs r2, #0
	mov r8, r2
	adds r0, r4, #0
	bl GetItemMinRange
	cmp r0, #2
	ble _0804B01C
	b _0804B146
_0804B01C:
	adds r0, r4, #0
	bl GetItemAttributes
	movs r1, #0x80
	ands r1, r0
	cmp r1, #0
	beq _0804B02C
	b _0804B146
_0804B02C:
	adds r0, r4, #0
	bl GetItemMinRange
	cmp r0, #1
	bne _0804B03A
	movs r0, #2
	mov r8, r0
_0804B03A:
	adds r0, r6, #0
	bl GetItemMaxRange
	cmp r0, #1
	ble _0804B04C
	movs r0, #1
	mov r1, r8
	orrs r1, r0
	mov r8, r1
_0804B04C:
	add r0, sp, #4
	strh r5, [r0, #4]
	ldr r0, _0804B0DC  @ gUnknown_0203DD90
	ldrb r0, [r0, #2]
	lsls r0, r0, #6
	mov r9, r0
	mov r5, r9
	adds r5, #1
	adds r0, #6
	cmp r5, r0
	bge _0804B146
	add r6, sp, #4
	ldr r7, _0804B0E0  @ gUnknown_03001834
	mov r0, r8
	movs r2, #2
	ands r0, r2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0x24]
_0804B072:
	adds r0, r5, #0
	bl GetUnit
	adds r4, r0, #0
	ldr r1, [r4, #0xc]
	ldr r0, _0804B0D8  @ 0x00010004
	ands r1, r0
	cmp r1, #0
	bne _0804B13C
	ldr r0, [r4]
	cmp r0, #0
	beq _0804B13C
	strb r5, [r6, #2]
	ldr r0, [sp, #0x24]
	cmp r0, #0
	beq _0804B0EC
	ldrb r0, [r4, #0x10]
	adds r0, #1
	strb r0, [r6]
	ldrb r0, [r4, #0x11]
	strb r0, [r6, #1]
	add r0, sp, #4
	bl sub_803DEC8
	ldr r0, [sp, #0xc]
	ldr r1, [sp, #0x18]
	cmp r1, r0
	bhi _0804B0EC
	str r0, [sp, #0x18]
	ldr r0, _0804B0D0  @ gActiveUnitId
	ldrb r0, [r0]
	str r0, [sp, #0x1c]
	lsls r0, r5, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0x20]
	mov r2, r8
	cmp r2, #3
	bne _0804B0E4
	movs r0, #3
	adds r1, r4, #0
	bl ITEMRANGEDONE_sub_804AF2C
	b _0804B0E6
	.align 2, 0
_0804B0C8: .4byte gAiState
_0804B0CC: .4byte gRAMChapterData
_0804B0D0: .4byte gActiveUnitId
_0804B0D4: .4byte gActiveUnit
_0804B0D8: .4byte 0x00010004
_0804B0DC: .4byte gUnknown_0203DD90
_0804B0E0: .4byte gUnknown_03001834
_0804B0E4:
	movs r0, #1
_0804B0E6:
	strb r0, [r7, #2]
	mov r0, sl
	strb r0, [r7, #3]
_0804B0EC:
	movs r0, #1
	mov r1, r8
	ands r0, r1
	cmp r0, #0
	beq _0804B13C
	ldrb r0, [r4, #0x10]
	adds r0, #1
	strb r0, [r6]
	ldrb r0, [r4, #0x11]
	subs r0, #1
	strb r0, [r6, #1]
	add r0, sp, #4
	bl sub_803DEC8
	ldr r0, [sp, #0xc]
	ldr r2, [sp, #0x18]
	cmp r2, r0
	bhi _0804B13C
	str r0, [sp, #0x18]
	ldr r0, _0804B130  @ gActiveUnitId
	ldrb r0, [r0]
	str r0, [sp, #0x1c]
	lsls r0, r5, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0x20]
	mov r0, r8
	cmp r0, #3
	bne _0804B134
	movs r0, #3
	adds r1, r4, #0
	bl ITEMRANGEDONE_sub_804AF2C
	strb r0, [r7, #2]
	b _0804B138
	.align 2, 0
_0804B130: .4byte gActiveUnitId
_0804B134:
	movs r1, #2
	strb r1, [r7, #2]
_0804B138:
	mov r2, sl
	strb r2, [r7, #3]
_0804B13C:
	adds r5, #1
	mov r0, r9
	adds r0, #6
	cmp r5, r0
	blt _0804B072
_0804B146:
	ldr r5, [sp, #0x2c]
	cmp r5, #4
	bgt _0804B14E
	b _0804AFE0
_0804B14E:
	ldr r4, [sp, #0x28]
	ldr r0, [sp, #0x30]
	cmp r4, r0
	bge _0804B158
	b _0804AFB0
_0804B158:
	ldr r2, _0804B188  @ gUnknown_0203DD94
	ldr r1, [sp, #0x38]
	str r1, [sp]
	ldr r0, [sp, #0x1c]
	movs r1, #0
	ldr r3, [sp, #0x34]
	bl sub_80493D0
	ldr r0, _0804B18C  @ gUnknown_03001834
	add r2, sp, #0x20
	ldrb r2, [r2]
	strb r2, [r0, #1]
	ldr r0, [sp, #0x10]
	bl Proc_Break
_0804B176:
	add sp, #0x3c
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804B188: .4byte gUnknown_0203DD94
_0804B18C: .4byte gUnknown_03001834

	THUMB_FUNC_END sub_804AF5C

	THUMB_FUNC_START sub_804B190
sub_804B190: @ 0x0804B190
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0804B1BC  @ gUnknown_03001834
	ldrb r0, [r0, #1]
	bl GetUnit
	adds r1, r0, #0
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	lsls r0, r0, #4
	ldrb r1, [r1, #0x11]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	lsls r1, r1, #4
	movs r2, #2
	adds r3, r4, #0
	bl sub_8039ECC
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804B1BC: .4byte gUnknown_03001834

	THUMB_FUNC_END sub_804B190

	THUMB_FUNC_START sub_804B1C0
sub_804B1C0: @ 0x0804B1C0
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r6, r0, #0
	ldr r0, _0804B244  @ gUnknown_03001834
	ldrb r0, [r0, #1]
	ldr r4, _0804B248  @ gUnknown_0203DD95
	movs r1, #0x34
	adds r1, r1, r6
	mov r8, r1
	movs r1, #0x38
	adds r1, r1, r6
	mov r9, r1
	str r1, [sp]
	movs r1, #1
	adds r2, r4, #0
	mov r3, r8
	bl sub_80493D0
	ldr r5, _0804B24C  @ gUnknown_03001818
	subs r4, #5
	ldrb r0, [r4, #4]
	adds r0, r0, r5
	ldrb r0, [r0]
	bl GetUnit
	adds r7, r0, #0
	ldrb r0, [r4, #5]
	adds r0, r0, r5
	ldrb r0, [r0]
	bl GetUnit
	adds r4, r0, #0
	ldr r0, [r7, #0xc]
	movs r5, #0x80
	lsls r5, r5, #2
	ands r0, r5
	cmp r0, #0
	beq _0804B222
	adds r2, r6, #0
	adds r2, #0x2c
	adds r3, r6, #0
	adds r3, #0x30
	adds r0, r7, #0
	movs r1, #0
	bl sub_804AC68
_0804B222:
	ldr r0, [r4, #0xc]
	ands r0, r5
	cmp r0, #0
	beq _0804B236
	adds r0, r4, #0
	movs r1, #1
	mov r2, r8
	mov r3, r9
	bl sub_804AC68
_0804B236:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804B244: .4byte gUnknown_03001834
_0804B248: .4byte gUnknown_0203DD95
_0804B24C: .4byte gUnknown_03001818

	THUMB_FUNC_END sub_804B1C0

	THUMB_FUNC_START sub_804B250
sub_804B250: @ 0x0804B250
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #2
	bl sub_804AE7C
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq _0804B272
	bl MU_IsAnyActive
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0804B272
	adds r0, r4, #0
	bl Proc_Break
_0804B272:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_804B250

	THUMB_FUNC_START sub_804B278
sub_804B278: @ 0x0804B278
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	bl GetGameClock
	ldr r2, _0804B374  @ gUnknown_085AA22C
	movs r1, #0x1f
	ands r1, r0
	adds r1, r1, r2
	ldrb r0, [r1]
	adds r0, #4
	asrs r0, r0, #1
	str r0, [sp]
	movs r0, #0
	mov r8, r0
_0804B29C:
	ldr r1, _0804B378  @ gUnknown_080D9F28
	ldr r0, _0804B37C  @ gUnknown_085A92E0
	ldr r0, [r0]
	ldrb r0, [r0, #6]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #2
	add r0, r8
	adds r0, r0, r1
	ldrb r0, [r0]
	bl sub_8042194
	lsls r0, r0, #0x18
	mov r1, r8
	adds r1, #1
	str r1, [sp, #4]
	cmp r0, #0
	beq _0804B35A
	movs r7, #0
	mov r0, r8
	lsls r0, r0, #2
	str r0, [sp, #8]
	ldr r1, _0804B380  @ gObject_16x8
	mov sl, r1
	movs r0, #0xf
	mov r9, r0
_0804B2D0:
	ldr r0, _0804B384  @ gUnknown_03001818
	ldr r1, [sp, #8]
	add r1, r8
	adds r1, r1, r7
	adds r1, r1, r0
	ldrb r0, [r1]
	bl GetUnit
	adds r6, r0, #0
	cmp r6, #0
	beq _0804B354
	ldr r0, [r6]
	cmp r0, #0
	beq _0804B354
	ldr r0, [r6, #0xc]
	movs r1, #0x80
	lsls r1, r1, #2
	ands r0, r1
	cmp r0, #0
	beq _0804B354
	movs r5, #0x10
	ldrsb r5, [r6, r5]
	lsls r5, r5, #4
	movs r4, #0x11
	ldrsb r4, [r6, r4]
	lsls r4, r4, #4
	ldr r1, [sp]
	subs r4, r4, r1
	adds r0, r6, #0
	bl GetUnitSpritePaletteIndexWrapper
	adds r3, r0, #0
	mov r0, r9
	ands r3, r0
	lsls r3, r3, #0xc
	movs r1, #0x9f
	lsls r1, r1, #4
	adds r3, r3, r1
	adds r0, r5, #0
	adds r1, r4, #0
	mov r2, sl
	bl CallARM_PushToSecondaryOAM
	movs r5, #0x10
	ldrsb r5, [r6, r5]
	lsls r5, r5, #4
	movs r4, #0x11
	ldrsb r4, [r6, r4]
	lsls r4, r4, #4
	ldr r0, [sp]
	subs r4, r4, r0
	adds r4, #8
	adds r0, r6, #0
	bl GetUnitSpritePaletteIndexWrapper
	adds r3, r0, #0
	mov r1, r9
	ands r3, r1
	lsls r3, r3, #0xc
	ldr r0, _0804B388  @ 0x000009F2
	adds r3, r3, r0
	adds r0, r5, #0
	adds r1, r4, #0
	mov r2, sl
	bl CallARM_PushToSecondaryOAM
_0804B354:
	adds r7, #1
	cmp r7, #4
	ble _0804B2D0
_0804B35A:
	ldr r1, [sp, #4]
	mov r8, r1
	cmp r1, #3
	ble _0804B29C
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804B374: .4byte gUnknown_085AA22C
_0804B378: .4byte gUnknown_080D9F28
_0804B37C: .4byte gUnknown_085A92E0
_0804B380: .4byte gObject_16x8
_0804B384: .4byte gUnknown_03001818
_0804B388: .4byte 0x000009F2

	THUMB_FUNC_END sub_804B278

	THUMB_FUNC_START sub_804B38C
sub_804B38C: @ 0x0804B38C
	push {lr}
	ldr r0, _0804B39C  @ gUnknown_085AA24C
	movs r1, #4
	bl Proc_Start
	pop {r0}
	bx r0
	.align 2, 0
_0804B39C: .4byte gUnknown_085AA24C

	THUMB_FUNC_END sub_804B38C

	THUMB_FUNC_START sub_804B3A0
sub_804B3A0: @ 0x0804B3A0
	push {lr}
	ldr r0, _0804B3AC  @ gUnknown_085AA24C
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
_0804B3AC: .4byte gUnknown_085AA24C

	THUMB_FUNC_END sub_804B3A0

	THUMB_FUNC_START sub_804B3B0
sub_804B3B0: @ 0x0804B3B0
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x1f
	bl SetStatScreenConfig
	ldr r0, _0804B3CC  @ gActiveUnit
	ldr r0, [r0]
	adds r1, r4, #0
	bl StartStatScreen
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804B3CC: .4byte gActiveUnit

	THUMB_FUNC_END sub_804B3B0

	THUMB_FUNC_START sub_804B3D0
sub_804B3D0: @ 0x0804B3D0
	push {lr}
	adds r1, r0, #0
	ldr r0, _0804B3E8  @ gUnknown_0203DD90
	ldrb r0, [r0, #8]
	cmp r0, #0
	bne _0804B3EC
	adds r0, r1, #0
	movs r1, #0
	bl Proc_Goto
	b _0804B3FE
	.align 2, 0
_0804B3E8: .4byte gUnknown_0203DD90
_0804B3EC:
	bl MU_EndAll
	ldr r0, _0804B404  @ gRAMChapterData
	ldrb r1, [r0, #0xf]
	movs r0, #6
	movs r2, #0
	movs r3, #0
	bl sub_8049350
_0804B3FE:
	pop {r0}
	bx r0
	.align 2, 0
_0804B404: .4byte gRAMChapterData

	THUMB_FUNC_END sub_804B3D0

	THUMB_FUNC_START sub_804B408
sub_804B408: @ 0x0804B408
	push {lr}
	ldr r2, _0804B41C  @ gUnknown_0203DD90
	ldrb r1, [r2, #8]
	cmp r1, #0
	bne _0804B420
	strb r1, [r2, #9]
	movs r1, #0
	bl Proc_Goto
	b _0804B432
	.align 2, 0
_0804B41C: .4byte gUnknown_0203DD90
_0804B420:
	bl MU_EndAll
	ldr r0, _0804B438  @ gRAMChapterData
	ldrb r1, [r0, #0xf]
	movs r0, #7
	movs r2, #0
	movs r3, #0
	bl sub_8049350
_0804B432:
	pop {r0}
	bx r0
	.align 2, 0
_0804B438: .4byte gRAMChapterData

	THUMB_FUNC_END sub_804B408

	THUMB_FUNC_START sub_804B43C
sub_804B43C: @ 0x0804B43C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0804B454  @ gUnknown_0203DD90
	ldrb r0, [r0, #8]
	cmp r0, #0
	bne _0804B458
	ldr r1, [r4, #0x58]
	adds r0, r4, #0
	bl Proc_Goto
	b _0804B474
	.align 2, 0
_0804B454: .4byte gUnknown_0203DD90
_0804B458:
	bl MU_EndAll
	bl MU_EndAll
	ldr r1, _0804B47C  @ gUnknown_0203DA24
	movs r0, #1
	strb r0, [r1, #0xb]
	movs r0, #0xff
	bl sub_80492E8
	adds r0, r4, #0
	movs r1, #5
	bl Proc_Goto
_0804B474:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804B47C: .4byte gUnknown_0203DA24

	THUMB_FUNC_END sub_804B43C

	THUMB_FUNC_START sub_804B480
sub_804B480: @ 0x0804B480
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	movs r6, #0
	ldr r1, _0804B494  @ gUnknown_0203DA24
	ldrb r0, [r1]
	cmp r0, #1
	bne _0804B498
	strb r0, [r1, #0xb]
	b _0804B4EA
	.align 2, 0
_0804B494: .4byte gUnknown_0203DA24
_0804B498:
	ldr r2, _0804B4FC  @ gUnknown_0203DD90
	adds r4, r1, #0
	adds r4, #0xa0
	ldrb r1, [r4]
	ldrb r0, [r2, #0xe]
	subs r1, r1, r0
	adds r0, r2, #0
	adds r0, #0xf
	adds r1, r1, r0
	ldr r3, _0804B500  @ gRAMChapterData
	ldrb r0, [r3, #0xf]
	strb r0, [r1]
	ldrb r0, [r2, #0xe]
	adds r0, #1
	strb r0, [r2, #0xe]
	ldrb r0, [r3, #0xf]
	lsls r0, r0, #2
	adds r1, r2, #0
	adds r1, #0x14
	adds r0, r0, r1
	str r6, [r0]
	ldrb r0, [r2, #0xe]
	ldrb r1, [r4]
	cmp r0, r1
	bne _0804B504
	movs r1, #0
	ldrb r0, [r4]
	cmp r6, r0
	bge _0804B4E8
	adds r4, r2, #0
	adds r4, #0xa
	adds r3, r0, #0
_0804B4D8:
	adds r0, r1, r4
	ldrb r0, [r0]
	cmp r0, #0
	beq _0804B4E2
	adds r6, r1, #0
_0804B4E2:
	adds r1, #1
	cmp r1, r3
	blt _0804B4D8
_0804B4E8:
	strb r6, [r2, #0xf]
_0804B4EA:
	movs r0, #0xff
	bl sub_80492E8
	adds r0, r5, #0
	movs r1, #8
	bl Proc_Goto
	b _0804B512
	.align 2, 0
_0804B4FC: .4byte gUnknown_0203DD90
_0804B500: .4byte gRAMChapterData
_0804B504:
	ldrb r0, [r3, #0xf]
	bl sub_80492E8
	adds r0, r5, #0
	movs r1, #8
	bl Proc_Goto
_0804B512:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_804B480

	THUMB_FUNC_START sub_804B518
sub_804B518: @ 0x0804B518
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _0804B538  @ gUnknown_0203DA24
	ldrb r0, [r1]
	cmp r0, #1
	bne _0804B53C
	strb r0, [r1, #0xb]
	movs r0, #0xff
	bl sub_80492E8
	adds r0, r4, #0
	movs r1, #8
	bl Proc_Goto
	b _0804B54E
	.align 2, 0
_0804B538: .4byte gUnknown_0203DA24
_0804B53C:
	movs r0, #2
	strb r0, [r1, #0xb]
	movs r0, #0xff
	bl sub_80492E8
	adds r0, r4, #0
	movs r1, #8
	bl Proc_Goto
_0804B54E:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_804B518

	THUMB_FUNC_START sub_804B554
sub_804B554: @ 0x0804B554
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	movs r5, #0
	ldr r2, _0804B5C0  @ gUnknown_0203DD90
	ldr r0, _0804B5C4  @ gUnknown_0203DA24
	adds r4, r0, #0
	adds r4, #0xa0
	ldrb r1, [r4]
	ldrb r0, [r2, #0xe]
	subs r1, r1, r0
	adds r0, r2, #0
	adds r0, #0xf
	adds r1, r1, r0
	ldr r3, _0804B5C8  @ gRAMChapterData
	ldrb r0, [r3, #0xf]
	strb r0, [r1]
	ldrb r0, [r2, #0xe]
	adds r0, #1
	strb r0, [r2, #0xe]
	ldrb r0, [r3, #0xf]
	lsls r0, r0, #2
	adds r1, r2, #0
	adds r1, #0x14
	adds r0, r0, r1
	str r5, [r0]
	ldrb r0, [r2, #0xe]
	ldrb r1, [r4]
	cmp r0, r1
	bne _0804B5CC
	movs r1, #0
	ldrb r0, [r4]
	cmp r5, r0
	bge _0804B5AC
	adds r4, r2, #0
	adds r4, #0xa
	adds r3, r0, #0
_0804B59C:
	adds r0, r1, r4
	ldrb r0, [r0]
	cmp r0, #0
	beq _0804B5A6
	adds r5, r1, #0
_0804B5A6:
	adds r1, #1
	cmp r1, r3
	blt _0804B59C
_0804B5AC:
	strb r5, [r2, #0xf]
	movs r0, #0xff
	bl sub_80492E8
	adds r0, r6, #0
	movs r1, #5
	bl Proc_Goto
	b _0804B5DA
	.align 2, 0
_0804B5C0: .4byte gUnknown_0203DD90
_0804B5C4: .4byte gUnknown_0203DA24
_0804B5C8: .4byte gRAMChapterData
_0804B5CC:
	ldrb r0, [r3, #0xf]
	bl sub_80492E8
	adds r0, r6, #0
	movs r1, #5
	bl Proc_Goto
_0804B5DA:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_804B554

	THUMB_FUNC_START sub_804B5E0
sub_804B5E0: @ 0x0804B5E0
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _0804B600  @ gUnknown_0203DA24
	movs r0, #2
	strb r0, [r1, #0xb]
	movs r0, #0xff
	bl sub_80492E8
	adds r0, r4, #0
	movs r1, #5
	bl Proc_Goto
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804B600: .4byte gUnknown_0203DA24

	THUMB_FUNC_END sub_804B5E0

	THUMB_FUNC_START sub_804B604
sub_804B604: @ 0x0804B604
	movs r3, #0
	str r3, [r0, #0x58]
	ldr r2, _0804B61C  @ gRAMChapterData
	ldrb r1, [r2, #0xf]
	lsls r1, r1, #6
	str r1, [r0, #0x5c]
	ldr r0, _0804B620  @ gUnknown_0203DD90
	adds r0, #0xa
	ldrb r2, [r2, #0xf]
	adds r0, r0, r2
	strb r3, [r0]
	bx lr
	.align 2, 0
_0804B61C: .4byte gRAMChapterData
_0804B620: .4byte gUnknown_0203DD90

	THUMB_FUNC_END sub_804B604

	THUMB_FUNC_START sub_804B624
sub_804B624: @ 0x0804B624
	push {r4, r5, r6, lr}
	adds r5, r0, #0
_0804B628:
	ldr r1, [r5, #0x58]
	cmp r1, #5
	bne _0804B638
	adds r0, r5, #0
	movs r1, #1
	bl Proc_Goto
	b _0804B69C
_0804B638:
	ldr r0, [r5, #0x5c]
	adds r0, r0, r1
	adds r0, #1
	bl GetUnit
	adds r6, r0, #0
	ldr r0, [r6, #0xc]
	ldr r1, _0804B65C  @ 0x00010004
	ands r0, r1
	cmp r0, #0
	bne _0804B654
	ldr r0, [r6]
	cmp r0, #0
	bne _0804B660
_0804B654:
	ldr r0, [r5, #0x58]
	adds r0, #1
	str r0, [r5, #0x58]
	b _0804B628
	.align 2, 0
_0804B65C: .4byte 0x00010004
_0804B660:
	bl SMS_UpdateFromGameData
	adds r0, r6, #0
	bl HideUnitSMS
	adds r0, r6, #0
	bl MU_Create
	adds r4, r0, #0
	ldr r1, _0804B6A4  @ gWorkingMovementScript
	movs r0, #2
	strb r0, [r1]
	movs r0, #4
	strb r0, [r1, #1]
	adds r0, r4, #0
	bl MU_StartMoveScript
	adds r0, r4, #0
	bl sub_804BF4C
	str r4, [r5, #0x54]
	ldr r0, [r5, #0x58]
	adds r0, #1
	str r0, [r5, #0x58]
	ldr r0, [r6, #0xc]
	ldr r1, _0804B6A8  @ 0xFFFFFDFF
	ands r0, r1
	movs r1, #5
	orrs r0, r1
	str r0, [r6, #0xc]
_0804B69C:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0804B6A4: .4byte gWorkingMovementScript
_0804B6A8: .4byte 0xFFFFFDFF

	THUMB_FUNC_END sub_804B624

	THUMB_FUNC_START sub_804B6AC
sub_804B6AC: @ 0x0804B6AC
	push {lr}
	ldr r0, [r0, #0x54]
	bl MU_End
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_804B6AC

	THUMB_FUNC_START sub_804B6B8
sub_804B6B8: @ 0x0804B6B8
	push {lr}
	bl sub_8049594
	bl sub_80495F4
	bl SMS_UpdateFromGameData
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_804B6B8

	THUMB_FUNC_START sub_804B6CC
sub_804B6CC: @ 0x0804B6CC
	push {lr}
	bl sub_8008A00
	adds r1, r0, #0
	cmp r1, #1
	bne _0804B6E4
	ldr r0, _0804B6E0  @ gUnknown_0203DD90
	strb r1, [r0, #8]
	b _0804B6EA
	.align 2, 0
_0804B6E0: .4byte gUnknown_0203DD90
_0804B6E4:
	ldr r1, _0804B6F0  @ gUnknown_0203DD90
	movs r0, #0
	strb r0, [r1, #8]
_0804B6EA:
	pop {r0}
	bx r0
	.align 2, 0
_0804B6F0: .4byte gUnknown_0203DD90

	THUMB_FUNC_END sub_804B6CC

	THUMB_FUNC_START sub_804B6F4
sub_804B6F4: @ 0x0804B6F4
	push {lr}
	ldr r0, _0804B704  @ gUnknown_085AA2B4
	movs r1, #1
	bl CallEvent
	pop {r0}
	bx r0
	.align 2, 0
_0804B704: .4byte gUnknown_085AA2B4

	THUMB_FUNC_END sub_804B6F4

	THUMB_FUNC_START sub_804B708
sub_804B708: @ 0x0804B708
	push {lr}
	ldr r0, _0804B718  @ gUnknown_085AA2D8
	movs r1, #1
	bl CallEvent
	pop {r0}
	bx r0
	.align 2, 0
_0804B718: .4byte gUnknown_085AA2D8

	THUMB_FUNC_END sub_804B708

	THUMB_FUNC_START sub_804B71C
sub_804B71C: @ 0x0804B71C
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, _0804B760  @ 0x06015000
	movs r1, #6
	bl LoadDialogueBoxGfx
	ldr r2, _0804B764  @ 0x00000756
	movs r0, #0x40
	movs r1, #0x38
	bl StartHelpBoxExt_Unk
	movs r4, #0
	ldr r6, _0804B768  @ gUnknown_0203DD9A
_0804B736:
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	bl sub_8042194
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0804B74E
	adds r0, r4, r6
	ldrb r0, [r0]
	cmp r0, #0
	beq _0804B74E
	str r4, [r5, #0x58]
_0804B74E:
	adds r4, #1
	cmp r4, #3
	ble _0804B736
	movs r0, #0
	str r0, [r5, #0x5c]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0804B760: .4byte 0x06015000
_0804B764: .4byte 0x00000756
_0804B768: .4byte gUnknown_0203DD9A

	THUMB_FUNC_END sub_804B71C

	THUMB_FUNC_START sub_804B76C
sub_804B76C: @ 0x0804B76C
	push {r4, lr}
	adds r4, r0, #0
_0804B770:
	ldr r1, [r4, #0x5c]
	cmp r1, #4
	ble _0804B782
	bl CloseHelpBox
	adds r0, r4, #0
	bl Proc_Break
	b _0804B7DA
_0804B782:
	ldr r0, [r4, #0x58]
	lsls r0, r0, #6
	adds r0, r0, r1
	adds r0, #1
	bl GetUnit
	adds r2, r0, #0
	ldr r0, [r2, #0xc]
	ldr r1, _0804B7A8  @ 0x00010004
	ands r0, r1
	cmp r0, #0
	bne _0804B7A0
	ldr r0, [r2]
	cmp r0, #0
	bne _0804B7AC
_0804B7A0:
	ldr r0, [r4, #0x5c]
	adds r0, #1
	str r0, [r4, #0x5c]
	b _0804B770
	.align 2, 0
_0804B7A8: .4byte 0x00010004
_0804B7AC:
	ldr r3, _0804B7E0  @ gUnknown_0203DD90
	ldr r0, [r4, #0x58]
	lsls r0, r0, #3
	adds r1, r3, #0
	adds r1, #0x30
	adds r0, r0, r1
	movs r1, #0x1e
	str r1, [r0]
	ldr r1, [r4, #0x58]
	lsls r2, r1, #3
	adds r2, r2, r3
	lsls r1, r1, #6
	ldr r0, [r4, #0x5c]
	adds r0, r0, r1
	adds r0, #1
	adds r2, #0x2c
	strb r0, [r2]
	adds r0, r4, #0
	bl sub_804926C
	ldr r0, [r4, #0x5c]
	adds r0, #1
	str r0, [r4, #0x5c]
_0804B7DA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804B7E0: .4byte gUnknown_0203DD90

	THUMB_FUNC_END sub_804B76C

	THUMB_FUNC_START sub_804B7E4
sub_804B7E4: @ 0x0804B7E4
	push {lr}
	adds r1, r0, #0
	ldr r0, _0804B7FC  @ gUnknown_0203DA24
	ldrb r0, [r0]
	cmp r0, #1
	bne _0804B7F8
	adds r0, r1, #0
	movs r1, #1
	bl Proc_Goto
_0804B7F8:
	pop {r0}
	bx r0
	.align 2, 0
_0804B7FC: .4byte gUnknown_0203DA24

	THUMB_FUNC_END sub_804B7E4

	THUMB_FUNC_START sub_804B800
sub_804B800: @ 0x0804B800
	push {lr}
	ldr r0, _0804B82C  @ gBG2TilemapBuffer
	movs r1, #0
	bl BG_Fill
	movs r0, #4
	bl BG_EnableSyncByMask
	bl RenderBmMap
	bl sub_8055BB4
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0804B830
	movs r0, #1
	bl sub_804FD48
	bl BeginAnimsOnBattleAnimations
	b _0804B846
	.align 2, 0
_0804B82C: .4byte gBG2TilemapBuffer
_0804B830:
	bl MU_EndAll
	bl RenderBmMap
	bl BeginBattleMapAnims
	ldr r2, _0804B84C  @ gBattleStats
	ldrh r1, [r2]
	movs r0, #0x80
	orrs r0, r1
	strh r0, [r2]
_0804B846:
	pop {r0}
	bx r0
	.align 2, 0
_0804B84C: .4byte gBattleStats

	THUMB_FUNC_END sub_804B800

	THUMB_FUNC_START sub_804B850
sub_804B850: @ 0x0804B850
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	ldr r6, _0804B8C0  @ gBattleActor
	movs r0, #0x13
	ldrsb r0, [r6, r0]
	cmp r0, #0
	bne _0804B86C
	ldr r0, _0804B8C4  @ gProcScr_MoveUnit
	bl Proc_Find
	adds r4, r0, #0
	bl sub_804BF4C
	str r4, [r7, #0x54]
_0804B86C:
	ldr r5, _0804B8C8  @ gBattleTarget
	movs r0, #0x13
	ldrsb r0, [r5, r0]
	cmp r0, #0
	bne _0804B8B8
	bl SMS_UpdateFromGameData
	movs r0, #0xb
	ldrsb r0, [r5, r0]
	bl GetUnit
	bl HideUnitSMS
	adds r0, r5, #0
	bl MU_Create
	adds r4, r0, #0
	movs r0, #0x10
	ldrsb r0, [r6, r0]
	movs r1, #0x11
	ldrsb r1, [r6, r1]
	movs r2, #0x10
	ldrsb r2, [r5, r2]
	movs r3, #0x11
	ldrsb r3, [r5, r3]
	bl GetFacingDirection
	ldr r1, _0804B8CC  @ gWorkingMovementScript
	strb r0, [r1]
	movs r0, #4
	strb r0, [r1, #1]
	adds r0, r4, #0
	bl MU_StartMoveScript
	adds r0, r4, #0
	bl sub_804BF4C
	str r4, [r7, #0x54]
_0804B8B8:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804B8C0: .4byte gBattleActor
_0804B8C4: .4byte gProcScr_MoveUnit
_0804B8C8: .4byte gBattleTarget
_0804B8CC: .4byte gWorkingMovementScript

	THUMB_FUNC_END sub_804B850

	THUMB_FUNC_START sub_804B8D0
sub_804B8D0: @ 0x0804B8D0
	push {r4, r5, lr}
	ldr r0, _0804B918  @ gBattleActor
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetUnit
	adds r4, r0, #0
	ldr r0, _0804B91C  @ gBattleTarget
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetUnit
	adds r5, r0, #0
	adds r0, r4, #0
	bl GetUnitCurrentHp
	cmp r0, #0
	bne _0804B900
	ldr r0, [r4, #0xc]
	movs r1, #5
	orrs r0, r1
	str r0, [r4, #0xc]
_0804B900:
	adds r0, r5, #0
	bl GetUnitCurrentHp
	cmp r0, #0
	bne _0804B912
	ldr r0, [r5, #0xc]
	movs r1, #5
	orrs r0, r1
	str r0, [r5, #0xc]
_0804B912:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0804B918: .4byte gBattleActor
_0804B91C: .4byte gBattleTarget

	THUMB_FUNC_END sub_804B8D0

	THUMB_FUNC_START sub_804B920
sub_804B920: @ 0x0804B920
	ldr r1, _0804B928  @ gUnknown_0203DDDC
	movs r0, #1
	strb r0, [r1]
	bx lr
	.align 2, 0
_0804B928: .4byte gUnknown_0203DDDC

	THUMB_FUNC_END sub_804B920

	THUMB_FUNC_START sub_804B92C
sub_804B92C: @ 0x0804B92C
	ldr r1, _0804B934  @ gUnknown_0203DDDC
	movs r0, #0
	strb r0, [r1]
	bx lr
	.align 2, 0
_0804B934: .4byte gUnknown_0203DDDC

	THUMB_FUNC_END sub_804B92C

	THUMB_FUNC_START sub_804B938
sub_804B938: @ 0x0804B938
	push {lr}
	ldr r2, _0804B960  @ gLCDControlBuffer
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
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	pop {r0}
	bx r0
	.align 2, 0
_0804B960: .4byte gLCDControlBuffer

	THUMB_FUNC_END sub_804B938

	THUMB_FUNC_START sub_804B964
sub_804B964: @ 0x0804B964
	push {lr}
	ldr r0, _0804B994  @ 0x04000006
	ldrh r0, [r0]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	ldr r3, _0804B998  @ gUnknown_02001188
	cmp r1, #0xa0
	bls _0804B97E
	ldr r0, _0804B99C  @ gUnknown_02001180
	ldr r0, [r0]
	str r0, [r3]
	movs r1, #0
_0804B97E:
	ldr r2, _0804B9A0  @ 0x04000042
	ldr r0, [r3]
	lsls r1, r1, #2
	adds r1, r1, r0
	ldrh r0, [r1]
	lsls r0, r0, #8
	ldrh r1, [r1, #2]
	adds r0, r0, r1
	strh r0, [r2]
	pop {r0}
	bx r0
	.align 2, 0
_0804B994: .4byte 0x04000006
_0804B998: .4byte gUnknown_02001188
_0804B99C: .4byte gUnknown_02001180
_0804B9A0: .4byte 0x04000042

	THUMB_FUNC_END sub_804B964

	THUMB_FUNC_START sub_804B9A4
sub_804B9A4: @ 0x0804B9A4
	ldr r2, _0804B9B4  @ gUnknown_02001180
	ldr r3, [r2]
	ldr r1, _0804B9B8  @ gUnknown_02001184
	ldr r0, [r1]
	str r0, [r2]
	str r3, [r1]
	bx lr
	.align 2, 0
_0804B9B4: .4byte gUnknown_02001180
_0804B9B8: .4byte gUnknown_02001184

	THUMB_FUNC_END sub_804B9A4

	THUMB_FUNC_START sub_804B9BC
sub_804B9BC: @ 0x0804B9BC
	push {lr}
	ldr r2, _0804B9E0  @ gLCDControlBuffer
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
	movs r0, #0
	bl SetPrimaryHBlankHandler
	pop {r0}
	bx r0
	.align 2, 0
_0804B9E0: .4byte gLCDControlBuffer

	THUMB_FUNC_END sub_804B9BC

	THUMB_FUNC_START sub_804B9E4
sub_804B9E4: @ 0x0804B9E4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	str r0, [sp, #4]
	ldr r7, [sp, #0x34]
	ldr r0, [sp, #0x48]
	ldr r6, [sp, #0x4c]
	lsls r6, r6, #0x10
	lsrs r6, r6, #0x10
	subs r1, #0x78
	subs r2, #0x50
	subs r3, #0x78
	subs r7, #0x50
	ldr r4, [sp, #0x38]
	subs r4, #0x78
	str r4, [sp, #0x38]
	ldr r4, [sp, #0x3c]
	subs r4, #0x50
	str r4, [sp, #0x3c]
	ldr r4, [sp, #0x40]
	subs r4, #0x78
	str r4, [sp, #0x40]
	ldr r4, [sp, #0x44]
	subs r4, #0x50
	str r4, [sp, #0x44]
	ldr r4, _0804BB50  @ gSinLookup
	mov r9, r4
	lsls r0, r0, #0x10
	movs r4, #0xff
	lsls r4, r4, #0x10
	ands r4, r0
	asrs r4, r4, #0x10
	mov ip, r4
	lsls r0, r4, #1
	add r0, r9
	movs r4, #0
	ldrsh r5, [r0, r4]
	adds r0, r1, #0
	muls r0, r5, r0
	mov r8, r0
	mov r4, ip
	adds r4, #0x40
	lsls r4, r4, #1
	add r4, r9
	movs r0, #0
	ldrsh r4, [r4, r0]
	adds r0, r2, #0
	muls r0, r4, r0
	add r0, r8
	str r0, [sp, #8]
	muls r1, r4, r1
	adds r0, r2, #0
	muls r0, r5, r0
	subs r1, r1, r0
	str r1, [sp, #0xc]
	adds r1, r3, #0
	muls r1, r5, r1
	adds r0, r7, #0
	muls r0, r4, r0
	adds r1, r1, r0
	mov r9, r1
	adds r1, r3, #0
	muls r1, r4, r1
	adds r0, r7, #0
	muls r0, r5, r0
	subs r7, r1, r0
	ldr r2, [sp, #0x38]
	adds r1, r2, #0
	muls r1, r5, r1
	ldr r2, [sp, #0x3c]
	adds r0, r2, #0
	muls r0, r4, r0
	adds r1, r1, r0
	mov sl, r1
	ldr r0, [sp, #0x38]
	adds r1, r0, #0
	muls r1, r4, r1
	adds r0, r2, #0
	muls r0, r5, r0
	subs r1, r1, r0
	mov r8, r1
	ldr r2, [sp, #0x40]
	adds r1, r2, #0
	muls r1, r5, r1
	ldr r2, [sp, #0x44]
	adds r0, r2, #0
	muls r0, r4, r0
	adds r1, r1, r0
	str r1, [sp, #0x10]
	ldr r0, [sp, #0x40]
	adds r1, r0, #0
	muls r1, r4, r1
	adds r0, r2, #0
	muls r0, r5, r0
	subs r4, r1, r0
	ldr r1, [sp, #8]
	asrs r0, r1, #0xc
	muls r0, r6, r0
	asrs r0, r0, #8
	adds r0, #0x78
	str r0, [sp, #8]
	ldr r2, [sp, #0xc]
	asrs r0, r2, #0xc
	muls r0, r6, r0
	asrs r0, r0, #8
	adds r0, #0x50
	str r0, [sp, #0xc]
	mov r1, r9
	asrs r0, r1, #0xc
	muls r0, r6, r0
	asrs r0, r0, #8
	adds r0, #0x78
	mov r9, r0
	asrs r0, r7, #0xc
	muls r0, r6, r0
	asrs r0, r0, #8
	adds r7, r0, #0
	adds r7, #0x50
	mov r2, sl
	asrs r0, r2, #0xc
	muls r0, r6, r0
	asrs r0, r0, #8
	adds r0, #0x78
	mov sl, r0
	mov r1, r8
	asrs r0, r1, #0xc
	muls r0, r6, r0
	asrs r0, r0, #8
	adds r0, #0x50
	mov r8, r0
	ldr r2, [sp, #0x10]
	asrs r0, r2, #0xc
	muls r0, r6, r0
	asrs r0, r0, #8
	adds r0, #0x78
	str r0, [sp, #0x10]
	asrs r0, r4, #0xc
	muls r0, r6, r0
	asrs r0, r0, #8
	adds r4, r0, #0
	adds r4, #0x50
	str r7, [sp]
	ldr r0, [sp, #4]
	ldr r1, [sp, #8]
	ldr r2, [sp, #0xc]
	mov r3, r9
	bl sub_80131F0
	mov r0, r8
	str r0, [sp]
	ldr r0, [sp, #4]
	mov r1, r9
	adds r2, r7, #0
	mov r3, sl
	bl sub_80131F0
	str r4, [sp]
	ldr r0, [sp, #4]
	mov r1, sl
	mov r2, r8
	ldr r3, [sp, #0x10]
	bl sub_80131F0
	ldr r1, [sp, #0xc]
	str r1, [sp]
	ldr r0, [sp, #4]
	ldr r1, [sp, #0x10]
	adds r2, r4, #0
	ldr r3, [sp, #8]
	bl sub_80131F0
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804BB50: .4byte gSinLookup

	THUMB_FUNC_END sub_804B9E4

	THUMB_FUNC_START sub_804BB54
sub_804BB54: @ 0x0804BB54
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r1, _0804BB88  @ gUnknown_02001180
	ldr r0, _0804BB8C  @ gUnknown_02000F00
	str r0, [r1]
	ldr r5, _0804BB90  @ gUnknown_02001184
	ldr r2, _0804BB94  @ 0xFFFFFD80
	adds r1, r0, r2
	str r1, [r5]
	ldr r1, _0804BB98  @ gUnknown_02001188
	str r0, [r1]
	bl sub_80131D0
	ldr r0, [r5]
	bl sub_80131D0
	adds r4, #0x4c
	movs r0, #0
	strh r0, [r4]
	ldr r0, _0804BB9C  @ sub_804B964
	bl SetPrimaryHBlankHandler
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0804BB88: .4byte gUnknown_02001180
_0804BB8C: .4byte gUnknown_02000F00
_0804BB90: .4byte gUnknown_02001184
_0804BB94: .4byte 0xFFFFFD80
_0804BB98: .4byte gUnknown_02001188
_0804BB9C: .4byte sub_804B964

	THUMB_FUNC_END sub_804BB54

	THUMB_FUNC_START sub_804BBA0
sub_804BBA0: @ 0x0804BBA0
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	adds r4, r0, #0
	adds r7, r4, #0
	adds r7, #0x4c
	adds r5, r4, #0
	adds r5, #0x64
	movs r0, #0
	ldrsh r1, [r7, r0]
	movs r2, #0
	ldrsh r0, [r5, r2]
	cmp r1, r0
	bne _0804BBC8
	movs r0, #0
	bl SetPrimaryHBlankHandler
	adds r0, r4, #0
	bl Proc_Break
	b _0804BC2E
_0804BBC8:
	movs r0, #0
	ldrsh r3, [r7, r0]
	movs r1, #0
	ldrsh r0, [r5, r1]
	str r0, [sp]
	movs r0, #0
	movs r1, #0xa0
	movs r2, #0xc0
	bl sub_8012DCC
	adds r6, r0, #0
	movs r2, #0x88
	lsls r2, r2, #1
	movs r0, #0
	ldrsh r3, [r7, r0]
	movs r1, #0
	ldrsh r0, [r5, r1]
	str r0, [sp]
	movs r0, #1
	movs r1, #0x10
	bl sub_8012DCC
	adds r5, r0, #0
	ldr r4, _0804BC38  @ gUnknown_02001184
	ldr r0, [r4]
	bl sub_80131D0
	ldr r0, [r4]
	movs r2, #0
	str r2, [sp]
	movs r1, #0xf0
	str r1, [sp, #4]
	movs r1, #0xa0
	str r1, [sp, #8]
	str r2, [sp, #0xc]
	str r1, [sp, #0x10]
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	str r6, [sp, #0x14]
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	str r5, [sp, #0x18]
	movs r1, #0
	movs r3, #0xf0
	bl sub_804B9E4
	bl sub_804B9A4
	ldrh r0, [r7]
	adds r0, #1
	strh r0, [r7]
_0804BC2E:
	add sp, #0x1c
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804BC38: .4byte gUnknown_02001184

	THUMB_FUNC_END sub_804BBA0

	THUMB_FUNC_START sub_804BC3C
sub_804BC3C: @ 0x0804BC3C
	ldr r2, _0804BC80  @ gLCDControlBuffer
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
	movs r1, #0x21
	negs r1, r1
	ands r0, r1
	subs r1, #0x20
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r2, #1]
	adds r1, r2, #0
	adds r1, #0x2f
	movs r0, #0
	strb r0, [r1]
	adds r1, #4
	strb r0, [r1]
	subs r1, #5
	movs r0, #0xf0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0xa0
	strb r0, [r1]
	bx lr
	.align 2, 0
_0804BC80: .4byte gLCDControlBuffer

	THUMB_FUNC_END sub_804BC3C

	THUMB_FUNC_START sub_804BC84
sub_804BC84: @ 0x0804BC84
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	ldr r0, _0804BD24  @ gUnknown_085AA7B4
	bl Proc_StartBlocking
	adds r0, #0x64
	movs r2, #0
	strh r4, [r0]
	ldr r0, _0804BD28  @ gLCDControlBuffer
	mov ip, r0
	ldrb r0, [r0, #1]
	movs r1, #1
	mov r8, r1
	mov r1, r8
	orrs r0, r1
	movs r6, #2
	orrs r0, r6
	movs r5, #4
	orrs r0, r5
	movs r4, #8
	orrs r0, r4
	movs r3, #0x10
	orrs r0, r3
	movs r1, #0x21
	negs r1, r1
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	movs r1, #0x7f
	ands r0, r1
	mov r1, ip
	strb r0, [r1, #1]
	mov r0, ip
	adds r0, #0x2f
	strb r2, [r0]
	adds r0, #4
	strb r2, [r0]
	adds r1, #0x2e
	movs r0, #0xf0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0xa0
	strb r0, [r1]
	mov r7, ip
	adds r7, #0x35
	ldrb r1, [r7]
	mov r0, r8
	orrs r1, r0
	orrs r1, r6
	orrs r1, r5
	orrs r1, r4
	orrs r1, r3
	mov r3, ip
	adds r3, #0x36
	ldrb r2, [r3]
	movs r0, #2
	negs r0, r0
	ands r0, r2
	movs r2, #3
	negs r2, r2
	ands r0, r2
	subs r2, #2
	ands r0, r2
	subs r2, #4
	ands r0, r2
	subs r2, #8
	ands r0, r2
	strb r0, [r3]
	movs r0, #0x20
	orrs r1, r0
	strb r1, [r7]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804BD24: .4byte gUnknown_085AA7B4
_0804BD28: .4byte gLCDControlBuffer

	THUMB_FUNC_END sub_804BC84

	THUMB_FUNC_START sub_804BD2C
sub_804BD2C: @ 0x0804BD2C
	push {lr}
	adds r1, r0, #0
	movs r0, #0x40
	bl sub_804BC84
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_804BD2C

	THUMB_FUNC_START sub_804BD3C
sub_804BD3C: @ 0x0804BD3C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	adds r4, r0, #0
	adds r7, r4, #0
	adds r7, #0x4c
	adds r5, r4, #0
	adds r5, #0x64
	movs r0, #0
	ldrsh r1, [r7, r0]
	movs r2, #0
	ldrsh r0, [r5, r2]
	cmp r1, r0
	bne _0804BD64
	movs r0, #0
	bl SetPrimaryHBlankHandler
	adds r0, r4, #0
	bl Proc_Break
	b _0804BDCA
_0804BD64:
	movs r0, #0
	ldrsh r3, [r7, r0]
	movs r1, #0
	ldrsh r0, [r5, r1]
	str r0, [sp]
	movs r0, #4
	movs r1, #0xc0
	movs r2, #0xa0
	bl sub_8012DCC
	adds r6, r0, #0
	movs r1, #0x88
	lsls r1, r1, #1
	movs r2, #0
	ldrsh r3, [r7, r2]
	movs r2, #0
	ldrsh r0, [r5, r2]
	str r0, [sp]
	movs r0, #5
	movs r2, #0x10
	bl sub_8012DCC
	adds r5, r0, #0
	ldr r4, _0804BDD4  @ gUnknown_02001184
	ldr r0, [r4]
	bl sub_80131D0
	ldr r0, [r4]
	movs r2, #0
	str r2, [sp]
	movs r1, #0xf0
	str r1, [sp, #4]
	movs r1, #0xa0
	str r1, [sp, #8]
	str r2, [sp, #0xc]
	str r1, [sp, #0x10]
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	str r6, [sp, #0x14]
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	str r5, [sp, #0x18]
	movs r1, #0
	movs r3, #0xf0
	bl sub_804B9E4
	bl sub_804B9A4
	ldrh r0, [r7]
	adds r0, #1
	strh r0, [r7]
_0804BDCA:
	add sp, #0x1c
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804BDD4: .4byte gUnknown_02001184

	THUMB_FUNC_END sub_804BD3C

	THUMB_FUNC_START sub_804BDD8
sub_804BDD8: @ 0x0804BDD8
	ldr r2, _0804BDF8  @ gLCDControlBuffer
	movs r0, #0
	strb r0, [r2, #1]
	adds r1, r2, #0
	adds r1, #0x2f
	strb r0, [r1]
	adds r1, #4
	strb r0, [r1]
	subs r1, #5
	movs r0, #0xf0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0xa0
	strb r0, [r1]
	bx lr
	.align 2, 0
_0804BDF8: .4byte gLCDControlBuffer

	THUMB_FUNC_END sub_804BDD8

	THUMB_FUNC_START sub_804BDFC
sub_804BDFC: @ 0x0804BDFC
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	ldr r0, _0804BE80  @ gUnknown_085AA7EC
	bl Proc_StartBlocking
	adds r0, #0x64
	movs r2, #0
	strh r4, [r0]
	ldr r3, _0804BE84  @ gLCDControlBuffer
	ldrb r1, [r3, #1]
	movs r0, #0x21
	negs r0, r0
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r3, #1]
	adds r0, r3, #0
	adds r0, #0x2f
	strb r2, [r0]
	adds r0, #4
	strb r2, [r0]
	adds r1, r3, #0
	adds r1, #0x2e
	movs r0, #0xf0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0xa0
	strb r0, [r1]
	adds r4, r3, #0
	adds r4, #0x35
	ldrb r2, [r4]
	movs r0, #1
	orrs r2, r0
	movs r0, #2
	orrs r2, r0
	movs r0, #4
	orrs r2, r0
	movs r0, #8
	orrs r2, r0
	movs r0, #0x10
	orrs r2, r0
	adds r3, #0x36
	ldrb r1, [r3]
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
	strb r0, [r3]
	movs r0, #0x20
	orrs r2, r0
	strb r2, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804BE80: .4byte gUnknown_085AA7EC
_0804BE84: .4byte gLCDControlBuffer

	THUMB_FUNC_END sub_804BDFC

	THUMB_FUNC_START sub_804BE88
sub_804BE88: @ 0x0804BE88
	push {lr}
	adds r1, r0, #0
	movs r0, #0x40
	bl sub_804BDFC
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_804BE88

	THUMB_FUNC_START sub_804BE98
sub_804BE98: @ 0x0804BE98
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0804BEB4  @ gUnknown_085AA7B4
	bl Proc_Find
	cmp r0, #0
	bne _0804BEAC
	adds r0, r4, #0
	bl Proc_Break
_0804BEAC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804BEB4: .4byte gUnknown_085AA7B4

	THUMB_FUNC_END sub_804BE98

	THUMB_FUNC_START sub_804BEB8
sub_804BEB8: @ 0x0804BEB8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0804BED4  @ gUnknown_085AA7EC
	bl Proc_Find
	cmp r0, #0
	bne _0804BECC
	adds r0, r4, #0
	bl Proc_Break
_0804BECC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804BED4: .4byte gUnknown_085AA7EC

	THUMB_FUNC_END sub_804BEB8

	THUMB_FUNC_START sub_804BED8
sub_804BED8: @ 0x0804BED8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0804BF24  @ gUnknown_085AA824
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r0, [r1]
	movs r1, #0xb0
	lsls r1, r1, #2
	movs r2, #0x20
	bl CopyToPaletteBuffer
	ldr r2, [r4, #0x30]
	ldr r1, [r4, #0x34]
	movs r3, #0xd0
	lsls r3, r3, #7
	adds r0, r3, #0
	ldrh r1, [r1, #2]
	adds r0, r0, r1
	strh r0, [r2, #0x22]
	ldr r0, [r4, #0x34]
	ldrb r0, [r0, #1]
	adds r0, #0x10
	lsls r0, r0, #5
	ldr r1, _0804BF28  @ gPaletteBuffer
	adds r0, r0, r1
	movs r1, #0x16
	movs r2, #0x14
	adds r3, r4, #0
	bl sub_8013928
	ldr r0, _0804BF2C  @ gUnknown_085AA83C
	adds r1, r4, #0
	bl Proc_Start
	str r4, [r0, #0x2c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804BF24: .4byte gUnknown_085AA824
_0804BF28: .4byte gPaletteBuffer
_0804BF2C: .4byte gUnknown_085AA83C

	THUMB_FUNC_END sub_804BED8

	THUMB_FUNC_START sub_804BF30
sub_804BF30: @ 0x0804BF30
	ldr r0, [r0, #0x2c]
	ldr r3, [r0, #0x30]
	ldr r2, [r0, #0x34]
	ldrb r1, [r2, #1]
	movs r0, #0xf
	ands r0, r1
	lsls r0, r0, #0xc
	ldrh r2, [r2, #2]
	adds r0, r0, r2
	movs r1, #0x80
	lsls r1, r1, #4
	adds r0, r0, r1
	strh r0, [r3, #0x22]
	bx lr

	THUMB_FUNC_END sub_804BF30

	THUMB_FUNC_START sub_804BF4C
sub_804BF4C: @ 0x0804BF4C
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x3f
	movs r5, #0
	movs r0, #7
	strb r0, [r1]
	ldr r0, _0804BFA4  @ gProcScr_MUDeathFade
	adds r1, r4, #0
	bl Proc_Start
	str r4, [r0, #0x54]
	adds r0, #0x64
	movs r1, #0x20
	strh r1, [r0]
	movs r0, #0
	movs r1, #0x10
	movs r2, #0x10
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	ldr r0, [r4, #0x30]
	strh r5, [r0, #0x18]
	ldr r0, [r4, #0x30]
	strh r5, [r0, #0x1a]
	adds r0, r4, #0
	movs r1, #0
	bl sub_804BED8
	ldr r1, [r4, #0x30]
	movs r0, #0xd
	strh r0, [r1, #0x1e]
	ldr r0, _0804BFA8  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0804BF9E
	movs r0, #0xd6
	bl m4aSongNumStart
_0804BF9E:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0804BFA4: .4byte gProcScr_MUDeathFade
_0804BFA8: .4byte gRAMChapterData

	THUMB_FUNC_END sub_804BF4C

	THUMB_FUNC_START sub_804BFAC
sub_804BFAC: @ 0x0804BFAC
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	ldr r2, [r5, #0x30]
	ldr r1, [r5, #0x34]
	movs r3, #0xd0
	lsls r3, r3, #7
	adds r0, r3, #0
	ldrh r1, [r1, #2]
	adds r0, r0, r1
	strh r0, [r2, #0x22]
	ldr r0, [r5, #0x34]
	ldrb r0, [r0, #1]
	adds r0, #0x10
	lsls r0, r0, #5
	ldr r1, _0804BFF0  @ gPaletteBuffer
	adds r0, r0, r1
	movs r1, #0xb0
	lsls r1, r1, #2
	movs r2, #0x20
	bl CopyToPaletteBuffer
	ldr r0, _0804BFF4  @ gUnknown_085AA824
	lsls r4, r4, #2
	adds r4, r4, r0
	ldr r0, [r4]
	movs r1, #0x16
	movs r2, #8
	adds r3, r5, #0
	bl sub_8013928
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0804BFF0: .4byte gPaletteBuffer
_0804BFF4: .4byte gUnknown_085AA824

	THUMB_FUNC_END sub_804BFAC

	THUMB_FUNC_START sub_804BFF8
sub_804BFF8: @ 0x0804BFF8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x34]
	ldrb r0, [r0, #1]
	adds r0, #0x10
	lsls r0, r0, #5
	ldr r1, _0804C024  @ gPaletteBuffer
	adds r0, r0, r1
	movs r1, #0x16
	movs r2, #8
	adds r3, r4, #0
	bl sub_8013928
	ldr r0, _0804C028  @ gProcScr_MU_89A2CF8
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x54]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804C024: .4byte gPaletteBuffer
_0804C028: .4byte gProcScr_MU_89A2CF8

	THUMB_FUNC_END sub_804BFF8

	THUMB_FUNC_START sub_804C02C
sub_804C02C: @ 0x0804C02C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0804C06C  @ gUnknown_089AE224
	ldr r1, _0804C070  @ 0x06004400
	bl CopyDataWithPossibleUncomp
	ldr r0, _0804C074  @ gUnknown_089AE484
	movs r1, #0x60
	movs r2, #0x20
	bl CopyToPaletteBuffer
	adds r1, r4, #0
	adds r1, #0x40
	movs r0, #0
	strb r0, [r1]
	adds r0, r4, #0
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0804C064
	ldr r2, [r4, #0x34]
	lsls r2, r2, #3
	movs r0, #0x7f
	movs r1, #2
	bl MU_StartStepSfx
_0804C064:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804C06C: .4byte gUnknown_089AE224
_0804C070: .4byte 0x06004400
_0804C074: .4byte gUnknown_089AE484

	THUMB_FUNC_END sub_804C02C

	THUMB_FUNC_START sub_804C078
sub_804C078: @ 0x0804C078
	push {r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r7, r0, #0
	ldr r0, _0804C118  @ gBG2TilemapBuffer
	ldr r1, [r7, #0x34]
	subs r1, #1
	ldr r2, [r7, #0x38]
	subs r2, #3
	ldr r3, _0804C11C  @ 0x00003220
	movs r4, #4
	str r4, [sp]
	movs r4, #6
	str r4, [sp, #4]
	ldr r4, _0804C120  @ gUnknown_089AE4A4
	str r4, [sp, #8]
	ldr r6, _0804C124  @ gUnknown_085AA854
	adds r5, r7, #0
	adds r5, #0x40
	ldrb r4, [r5]
	adds r4, r4, r6
	ldrb r4, [r4]
	str r4, [sp, #0xc]
	bl sub_80146A0
	movs r0, #4
	bl BG_EnableSyncByMask
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
	ldrb r0, [r5]
	adds r0, r0, r6
	ldrb r0, [r0]
	cmp r0, #0xff
	bne _0804C0C4
	adds r0, r7, #0
	bl Proc_Break
_0804C0C4:
	ldr r2, _0804C128  @ gLCDControlBuffer
	ldrb r3, [r2, #0xc]
	movs r1, #4
	negs r1, r1
	adds r0, r1, #0
	ands r0, r3
	strb r0, [r2, #0xc]
	ldrb r3, [r2, #0x10]
	adds r0, r1, #0
	ands r0, r3
	strb r0, [r2, #0x10]
	ldrb r0, [r2, #0x14]
	ands r1, r0
	strb r1, [r2, #0x14]
	ldrb r0, [r2, #0x18]
	movs r1, #3
	orrs r0, r1
	strb r0, [r2, #0x18]
	movs r0, #0
	str r0, [sp]
	movs r1, #0
	movs r2, #1
	movs r3, #0
	bl sub_8001ED0
	movs r0, #1
	str r0, [sp]
	movs r1, #1
	movs r2, #0
	movs r3, #1
	bl sub_8001F0C
	movs r0, #1
	movs r1, #0xc
	movs r2, #0xc
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	add sp, #0x10
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804C118: .4byte gBG2TilemapBuffer
_0804C11C: .4byte 0x00003220
_0804C120: .4byte gUnknown_089AE4A4
_0804C124: .4byte gUnknown_085AA854
_0804C128: .4byte gLCDControlBuffer

	THUMB_FUNC_END sub_804C078

	THUMB_FUNC_START sub_804C12C
sub_804C12C: @ 0x0804C12C
	push {lr}
	ldr r0, _0804C144  @ gBG2TilemapBuffer
	movs r1, #0
	bl BG_Fill
	movs r0, #4
	bl BG_EnableSyncByMask
	bl SetDefaultColorEffects
	pop {r0}
	bx r0
	.align 2, 0
_0804C144: .4byte gBG2TilemapBuffer

	THUMB_FUNC_END sub_804C12C

	THUMB_FUNC_START sub_804C148
sub_804C148: @ 0x0804C148
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0804C174  @ gUnknown_085AA86C
	movs r1, #2
	bl Proc_Start
	ldr r2, [r4, #0x2c]
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	lsls r1, r1, #1
	str r1, [r0, #0x34]
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	lsls r1, r1, #1
	str r1, [r0, #0x38]
	adds r4, #0x41
	ldrb r1, [r4]
	adds r0, #0x41
	strb r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804C174: .4byte gUnknown_085AA86C

	THUMB_FUNC_END sub_804C148

	THUMB_FUNC_START sub_804C178
sub_804C178: @ 0x0804C178
	push {lr}
	ldr r0, [r0, #0x30]
	movs r1, #0
	bl sub_804BFAC
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_804C178

	THUMB_FUNC_START sub_804C188
sub_804C188: @ 0x0804C188
	push {lr}
	ldr r0, [r0, #0x30]
	bl MU_Hide
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_804C188

	THUMB_FUNC_START sub_804C194
sub_804C194: @ 0x0804C194
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x30]
	ldr r1, [r4, #0x34]
	lsls r1, r1, #4
	ldr r2, [r4, #0x38]
	lsls r2, r2, #4
	bl MU_SetDisplayPosition
	ldr r1, [r4, #0x2c]
	ldr r0, [r4, #0x34]
	strb r0, [r1, #0x10]
	ldr r1, [r4, #0x2c]
	ldr r0, [r4, #0x38]
	strb r0, [r1, #0x11]
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_804C194

	THUMB_FUNC_START sub_804C1B8
sub_804C1B8: @ 0x0804C1B8
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x3c]
	movs r0, #1
	negs r0, r0
	cmp r1, r0
	beq _0804C1CC
	ldr r0, [r4, #0x30]
	bl MU_SetFacing
_0804C1CC:
	ldr r0, [r4, #0x30]
	bl MU_Show
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_804C1B8

	THUMB_FUNC_START sub_804C1D8
sub_804C1D8: @ 0x0804C1D8
	push {lr}
	ldr r0, [r0, #0x30]
	bl sub_804BFF8
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_804C1D8

	THUMB_FUNC_START sub_804C1E4
sub_804C1E4: @ 0x0804C1E4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0804C204  @ gUnknown_085AA86C
	bl Proc_Find
	negs r1, r0
	orrs r1, r0
	cmp r1, #0
	blt _0804C1FC
	adds r0, r4, #0
	bl Proc_Break
_0804C1FC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804C204: .4byte gUnknown_085AA86C

	THUMB_FUNC_END sub_804C1E4

	THUMB_FUNC_START sub_804C208
sub_804C208: @ 0x0804C208
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	adds r6, r1, #0
	adds r7, r2, #0
	mov r8, r3
	ldr r0, [sp, #0x1c]
	ldr r1, [sp, #0x20]
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r1, #0
	beq _0804C230
	ldr r0, _0804C22C  @ gUnknown_085AA89C
	bl Proc_StartBlocking
	b _0804C238
	.align 2, 0
_0804C22C: .4byte gUnknown_085AA89C
_0804C230:
	ldr r0, _0804C25C  @ gUnknown_085AA89C
	movs r1, #2
	bl Proc_Start
_0804C238:
	adds r1, r0, #0
	str r5, [r1, #0x2c]
	str r6, [r1, #0x30]
	str r7, [r1, #0x34]
	mov r0, r8
	str r0, [r1, #0x38]
	ldr r0, [sp, #0x18]
	str r0, [r1, #0x3c]
	adds r0, r1, #0
	adds r0, #0x41
	strb r4, [r0]
	adds r0, r1, #0
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0804C25C: .4byte gUnknown_085AA89C

	THUMB_FUNC_END sub_804C208

	THUMB_FUNC_START sub_804C260
sub_804C260: @ 0x0804C260
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	adds r6, r1, #0
	adds r7, r2, #0
	mov r8, r3
	ldr r0, [sp, #0x1c]
	ldr r1, [sp, #0x20]
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r1, #0
	beq _0804C288
	ldr r0, _0804C284  @ gUnknown_085AA914
	bl Proc_StartBlocking
	b _0804C290
	.align 2, 0
_0804C284: .4byte gUnknown_085AA914
_0804C288:
	ldr r0, _0804C2B4  @ gUnknown_085AA914
	movs r1, #2
	bl Proc_Start
_0804C290:
	adds r1, r0, #0
	str r5, [r1, #0x2c]
	str r6, [r1, #0x30]
	str r7, [r1, #0x34]
	mov r0, r8
	str r0, [r1, #0x38]
	ldr r0, [sp, #0x18]
	str r0, [r1, #0x3c]
	adds r0, r1, #0
	adds r0, #0x41
	strb r4, [r0]
	adds r0, r1, #0
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0804C2B4: .4byte gUnknown_085AA914

	THUMB_FUNC_END sub_804C260

	THUMB_FUNC_START sub_804C2B8
sub_804C2B8: @ 0x0804C2B8
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r2, r1, #0
	ldr r3, _0804C2D8  @ gUnknown_080D9FD6
	movs r0, #0
	str r0, [sp]
	movs r0, #4
	adds r1, r4, #0
	bl PutSprite
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804C2D8: .4byte gUnknown_080D9FD6

	THUMB_FUNC_END sub_804C2B8

	THUMB_FUNC_START sub_804C2DC
sub_804C2DC: @ 0x0804C2DC
	push {lr}
	ldr r2, [r0, #0x2c]
	ldr r1, [r0, #0x30]
	adds r0, r2, #0
	bl sub_804C2B8
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_804C2DC

	THUMB_FUNC_START sub_804C2EC
sub_804C2EC: @ 0x0804C2EC
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r6, r0, #0
	mov r8, r1
	adds r5, r2, #0
	ldr r4, _0804C318  @ gUnknown_085AA954
	adds r0, r4, #0
	bl Proc_EndEach
	adds r0, r4, #0
	adds r1, r5, #0
	bl Proc_Start
	str r6, [r0, #0x2c]
	mov r1, r8
	str r1, [r0, #0x30]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0804C318: .4byte gUnknown_085AA954

	THUMB_FUNC_END sub_804C2EC

	THUMB_FUNC_START sub_804C31C
sub_804C31C: @ 0x0804C31C
	push {r4, lr}
	ldr r4, _0804C338  @ gUnknown_085AA954
	adds r0, r4, #0
	bl Proc_Find
	cmp r0, #0
	beq _0804C330
	adds r0, r4, #0
	bl Proc_EndEach
_0804C330:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804C338: .4byte gUnknown_085AA954

	THUMB_FUNC_END sub_804C31C

	THUMB_FUNC_START sub_804C33C
sub_804C33C: @ 0x0804C33C
	push {lr}
	sub sp, #0x18
	ldr r1, _0804C394  @ gUnknown_080D9FE4
	mov r0, sp
	movs r2, #0x18
	bl memcpy
	mov r0, sp
	bl SetupBackgrounds
	ldr r3, _0804C398  @ gLCDControlBuffer
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
	bl LoadGameCoreGfx
	ldr r0, _0804C39C  @ gUnknown_085ADCC8
	movs r1, #0xc0
	lsls r1, r1, #2
	movs r2, #0x40
	bl CopyToPaletteBuffer
	add sp, #0x18
	pop {r0}
	bx r0
	.align 2, 0
_0804C394: .4byte gUnknown_080D9FE4
_0804C398: .4byte gLCDControlBuffer
_0804C39C: .4byte gUnknown_085ADCC8

	THUMB_FUNC_END sub_804C33C

	THUMB_FUNC_START sub_804C3A0
sub_804C3A0: @ 0x0804C3A0
	bx lr

	THUMB_FUNC_END sub_804C3A0

	THUMB_FUNC_START sub_804C3A4
sub_804C3A4: @ 0x0804C3A4
	bx lr

	THUMB_FUNC_END sub_804C3A4

	THUMB_FUNC_START nullsub_13
nullsub_13: @ 0x0804C3A8
	bx lr

	THUMB_FUNC_END nullsub_13

	THUMB_FUNC_START sub_804C3AC
sub_804C3AC: @ 0x0804C3AC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	adds r5, r1, #0
	lsls r2, r2, #5
	mov r8, r2
	cmp r3, #0
	ble _0804C3E2
	movs r7, #0x80
	lsls r7, r7, #3
	adds r4, r3, #0
_0804C3C4:
	mov r2, r8
	cmp r2, #0
	bge _0804C3CC
	adds r2, #3
_0804C3CC:
	lsls r2, r2, #9
	lsrs r2, r2, #0xb
	adds r0, r6, #0
	adds r1, r5, #0
	bl CpuFastSet
	adds r6, r6, r7
	adds r5, r5, r7
	subs r4, #1
	cmp r4, #0
	bne _0804C3C4
_0804C3E2:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_804C3AC

	THUMB_FUNC_START sub_804C3EC
sub_804C3EC: @ 0x0804C3EC
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	mov r8, r0
	ldr r5, [r0, #0x58]
	adds r0, r5, #0
	movs r1, #3
	bl __modsi3
	lsls r4, r0, #2
	adds r4, r4, r0
	lsls r4, r4, #6
	adds r0, r5, #0
	movs r1, #3
	bl __divsi3
	adds r5, r0, #0
	lsls r5, r5, #0xb
	ldr r0, _0804C464  @ gUnknown_085B0DE8
	mov r2, r8
	ldr r1, [r2, #0x5c]
	movs r3, #0xc0
	lsls r3, r3, #0x13
	adds r1, r1, r3
	bl CopyDataWithPossibleUncomp
	ldr r0, _0804C468  @ gUnknown_085AAE0C
	ldr r6, _0804C46C  @ gUnknown_02020188
	adds r1, r6, #0
	bl CopyDataWithPossibleUncomp
	adds r4, r4, r5
	adds r4, r4, r6
	ldr r1, _0804C470  @ 0x06014000
	adds r0, r4, #0
	movs r2, #0xa
	movs r3, #2
	bl sub_804C3AC
	ldr r0, _0804C474  @ gBG2TilemapBuffer
	ldr r1, _0804C478  @ gUnknown_085B0F2C
	mov r4, r8
	ldr r2, [r4, #0x5c]
	lsls r2, r2, #0xf
	lsrs r2, r2, #0x14
	movs r4, #0x80
	lsls r4, r4, #5
	adds r3, r4, #0
	orrs r2, r3
	bl CallARM_FillTileRect
	movs r0, #4
	bl BG_EnableSyncByMask
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0804C464: .4byte gUnknown_085B0DE8
_0804C468: .4byte gUnknown_085AAE0C
_0804C46C: .4byte gUnknown_02020188
_0804C470: .4byte 0x06014000
_0804C474: .4byte gBG2TilemapBuffer
_0804C478: .4byte gUnknown_085B0F2C

	THUMB_FUNC_END sub_804C3EC

	THUMB_FUNC_START sub_804C47C
sub_804C47C: @ 0x0804C47C
	push {lr}
	sub sp, #4
	ldr r3, _0804C498  @ gUnknown_085AA96C
	movs r0, #0
	str r0, [sp]
	movs r0, #4
	movs r1, #0x14
	movs r2, #8
	bl PutSpriteExt
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_0804C498: .4byte gUnknown_085AA96C

	THUMB_FUNC_END sub_804C47C

	THUMB_FUNC_START sub_804C49C
sub_804C49C: @ 0x0804C49C
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r6, r0, #0
	mov r8, r1
	adds r5, r2, #0
	ldr r4, _0804C4F4  @ gUnknown_085AA980
	adds r0, r4, #0
	bl Proc_EndEach
	adds r0, r4, #0
	adds r1, r6, #0
	bl Proc_Start
	adds r6, r0, #0
	mov r0, r8
	str r0, [r6, #0x58]
	str r5, [r6, #0x5c]
	cmp r5, #0
	bne _0804C4CA
	movs r0, #0xb8
	lsls r0, r0, #7
	str r0, [r6, #0x5c]
_0804C4CA:
	ldr r4, [r6, #0x58]
	adds r0, r4, #0
	movs r1, #3
	bl __modsi3
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #6
	str r1, [r6, #0x2c]
	adds r0, r4, #0
	movs r1, #3
	bl __divsi3
	lsls r0, r0, #0xb
	str r0, [r6, #0x30]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0804C4F4: .4byte gUnknown_085AA980

	THUMB_FUNC_END sub_804C49C

	THUMB_FUNC_START sub_804C4F8
sub_804C4F8: @ 0x0804C4F8
	push {lr}
	ldr r0, _0804C504  @ gUnknown_085AA980
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
_0804C504: .4byte gUnknown_085AA980

	THUMB_FUNC_END sub_804C4F8

	THUMB_FUNC_START sub_804C508
sub_804C508: @ 0x0804C508
	push {r4, lr}
	sub sp, #4
	movs r0, #1
	movs r1, #0x10
	movs r2, #4
	movs r3, #0
	bl SetSpecialColorEffectsParameters
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
	ldr r2, _0804C554  @ gLCDControlBuffer
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
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804C554: .4byte gLCDControlBuffer

	THUMB_FUNC_END sub_804C508

	THUMB_FUNC_START sub_804C558
sub_804C558: @ 0x0804C558
	push {r4, lr}
	sub sp, #4
	movs r0, #1
	movs r1, #0x10
	movs r2, #4
	movs r3, #0
	bl SetSpecialColorEffectsParameters
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
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_804C558

	THUMB_FUNC_START sub_804C590
sub_804C590: @ 0x0804C590
	push {lr}
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_804C590

	THUMB_FUNC_START sub_804C5A4
sub_804C5A4: @ 0x0804C5A4
	push {r4, lr}
	sub sp, #0x20
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r1, _0804C5E8  @ gUnknown_080DA0DA
	mov r0, sp
	movs r2, #0x20
	bl memcpy
	ldr r0, _0804C5EC  @ gUnknown_0203DDDC
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _0804C5DE
	mov r1, sp
	adds r0, r1, r4
	ldrb r1, [r0]
	adds r1, #0x10
	ldr r3, _0804C5F0  @ gPaletteBuffer
	lsls r0, r1, #0xa
	lsls r2, r1, #5
	adds r0, r0, r2
	adds r0, r0, r1
	ldr r1, _0804C5F4  @ 0x00000262
	adds r3, r3, r1
	strh r0, [r3]
	bl EnablePaletteSync
_0804C5DE:
	add sp, #0x20
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804C5E8: .4byte gUnknown_080DA0DA
_0804C5EC: .4byte gUnknown_0203DDDC
_0804C5F0: .4byte gPaletteBuffer
_0804C5F4: .4byte 0x00000262

	THUMB_FUNC_END sub_804C5A4

	THUMB_FUNC_START sub_804C5F8
sub_804C5F8: @ 0x0804C5F8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r7, r0, #0
	ldr r0, _0804C73C  @ 0x000082C8
	mov r8, r0
	movs r2, #0x2a
	ldrsh r1, [r7, r2]
	movs r3, #0x2c
	ldrsh r2, [r7, r3]
	ldr r3, _0804C740  @ gUnknown_085AA9A0
	adds r0, r7, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r3
	ldr r3, [r0]
	ldr r4, _0804C744  @ gUnknown_080DA09C
	adds r5, r7, #0
	adds r5, #0x2e
	ldrb r0, [r5]
	lsls r0, r0, #1
	adds r0, r0, r4
	ldrh r0, [r0]
	str r0, [sp]
	movs r0, #4
	bl PutSprite
	ldrb r0, [r5]
	cmp r0, #2
	bne _0804C642
	adds r0, r7, #0
	adds r0, #0x30
	ldrb r0, [r0]
	bl sub_804C5A4
_0804C642:
	adds r2, r7, #0
	adds r2, #0x30
	ldrb r0, [r2]
	adds r0, #1
	movs r1, #0x1f
	ands r0, r1
	strb r0, [r2]
	ldrh r1, [r7, #0x2e]
	movs r0, #0x81
	lsls r0, r0, #1
	cmp r1, r0
	bne _0804C72E
	ldrh r1, [r7, #0x3a]
	ldrh r2, [r7, #0x36]
	adds r0, r1, r2
	strh r0, [r7, #0x36]
	ldrh r2, [r7, #0x3c]
	ldrh r3, [r7, #0x38]
	adds r0, r2, r3
	strh r0, [r7, #0x38]
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	cmp r0, #4
	ble _0804C676
	subs r0, r1, #1
	strh r0, [r7, #0x3a]
_0804C676:
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	cmp r0, #4
	ble _0804C682
	subs r0, r2, #1
	strh r0, [r7, #0x3c]
_0804C682:
	bl GetGameClock
	movs r1, #3
	ands r1, r0
	cmp r1, #0
	bne _0804C6AA
	ldrh r1, [r7, #0x32]
	movs r2, #0x32
	ldrsh r0, [r7, r2]
	cmp r0, #0
	bge _0804C69C
	adds r0, r1, #1
	strh r0, [r7, #0x32]
_0804C69C:
	ldrh r1, [r7, #0x34]
	movs r3, #0x34
	ldrsh r0, [r7, r3]
	cmp r0, #0x34
	ble _0804C6AA
	subs r0, r1, #1
	strh r0, [r7, #0x34]
_0804C6AA:
	movs r0, #0x2a
	ldrsh r5, [r7, r0]
	movs r1, #0x32
	ldrsh r0, [r7, r1]
	adds r0, #0x4b
	adds r5, r5, r0
	movs r2, #0x2c
	ldrsh r4, [r7, r2]
	adds r4, #8
	ldr r6, _0804C748  @ gObject_8x16
	ldrh r0, [r7, #0x36]
	lsrs r0, r0, #5
	movs r1, #6
	bl __umodsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	add r0, r8
	str r0, [sp]
	movs r0, #0
	adds r1, r5, #0
	adds r2, r4, #0
	adds r3, r6, #0
	bl PutSprite
	movs r3, #0x2a
	ldrsh r5, [r7, r3]
	movs r1, #0x34
	ldrsh r0, [r7, r1]
	adds r0, #0x49
	adds r5, r5, r0
	movs r2, #0x2c
	ldrsh r4, [r7, r2]
	adds r4, #8
	ldr r6, _0804C74C  @ gObject_8x16_HFlipped
	ldrh r0, [r7, #0x38]
	lsrs r0, r0, #5
	movs r1, #6
	bl __umodsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	add r0, r8
	str r0, [sp]
	movs r0, #0
	adds r1, r5, #0
	adds r2, r4, #0
	adds r3, r6, #0
	bl PutSprite
	movs r3, #0x2a
	ldrsh r1, [r7, r3]
	adds r1, #0x50
	movs r0, #0x2c
	ldrsh r2, [r7, r0]
	adds r2, #9
	ldr r3, _0804C750  @ gUnknown_085AA9B4
	ldr r0, _0804C754  @ gUnknown_0203DA24
	ldrb r0, [r0, #5]
	lsls r0, r0, #2
	adds r0, r0, r3
	ldr r3, [r0]
	movs r0, #0
	str r0, [sp]
	bl PutSpriteExt
_0804C72E:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804C73C: .4byte 0x000082C8
_0804C740: .4byte gUnknown_085AA9A0
_0804C744: .4byte gUnknown_080DA09C
_0804C748: .4byte gObject_8x16
_0804C74C: .4byte gObject_8x16_HFlipped
_0804C750: .4byte gUnknown_085AA9B4
_0804C754: .4byte gUnknown_0203DA24

	THUMB_FUNC_END sub_804C5F8

	THUMB_FUNC_START sub_804C758
sub_804C758: @ 0x0804C758
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #4
	mov r8, r0
	adds r4, r1, #0
	adds r5, r2, #0
	adds r2, r3, #0
	ldr r6, [sp, #0x18]
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	ldr r0, _0804C7C4  @ gUnknown_085AA9C0
	mov r1, r8
	str r2, [sp]
	bl Proc_Start
	mov r8, r0
	movs r3, #0
	movs r1, #0
	strh r4, [r0, #0x2a]
	strh r5, [r0, #0x2c]
	adds r0, #0x2e
	strb r6, [r0]
	adds r0, #1
	ldr r2, [sp]
	strb r2, [r0]
	mov r0, r8
	strh r1, [r0, #0x32]
	movs r0, #0x34
	mov r2, r8
	strh r0, [r2, #0x34]
	strh r1, [r2, #0x38]
	strh r1, [r2, #0x36]
	movs r0, #4
	strh r0, [r2, #0x3c]
	strh r0, [r2, #0x3a]
	mov r0, r8
	adds r0, #0x3e
	strb r3, [r0]
	subs r0, #0xe
	strb r3, [r0]
	mov r0, r8
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0804C7C4: .4byte gUnknown_085AA9C0

	THUMB_FUNC_END sub_804C758

	THUMB_FUNC_START sub_804C7C8
sub_804C7C8: @ 0x0804C7C8
	push {r4, lr}
	ldr r4, [sp, #8]
	strh r1, [r0, #0x32]
	strh r2, [r0, #0x34]
	strh r3, [r0, #0x3a]
	strh r4, [r0, #0x3c]
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_804C7C8

	THUMB_FUNC_START sub_804C7DC
sub_804C7DC: @ 0x0804C7DC
	strh r1, [r0, #0x2a]
	strh r2, [r0, #0x2c]
	bx lr

	THUMB_FUNC_END sub_804C7DC

	THUMB_FUNC_START sub_804C7E4
sub_804C7E4: @ 0x0804C7E4
	push {r4, lr}
	sub sp, #0x20
	ldr r4, _0804C82C  @ gUnknown_085ADDE8
	ldr r1, _0804C830  @ gUnknown_080DA102
	mov r0, sp
	movs r2, #0x20
	bl memcpy
	ldr r0, _0804C834  @ gUnknown_0203DDDC
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _0804C824
	bl GetGameClock
	movs r1, #0x3f
	ands r1, r0
	asrs r1, r1, #1
	mov r2, sp
	adds r0, r2, r1
	ldrb r0, [r0]
	ldr r1, _0804C838  @ gPaletteBuffer
	lsls r0, r0, #1
	adds r0, r0, r4
	ldrh r0, [r0]
	movs r2, #0xc7
	lsls r2, r2, #2
	adds r1, r1, r2
	strh r0, [r1]
	bl EnablePaletteSync
_0804C824:
	add sp, #0x20
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804C82C: .4byte gUnknown_085ADDE8
_0804C830: .4byte gUnknown_080DA102
_0804C834: .4byte gUnknown_0203DDDC
_0804C838: .4byte gPaletteBuffer

	THUMB_FUNC_END sub_804C7E4

	THUMB_FUNC_START sub_804C83C
sub_804C83C: @ 0x0804C83C
	push {r4, lr}
	sub sp, #0x20
	ldr r4, _0804C884  @ gUnknown_085ADE48
	ldr r1, _0804C888  @ gUnknown_080DA0DA
	mov r0, sp
	movs r2, #0x20
	bl memcpy
	ldr r0, _0804C88C  @ gUnknown_0203DDDC
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _0804C87C
	bl GetGameClock
	movs r1, #0x3f
	ands r1, r0
	asrs r1, r1, #1
	mov r2, sp
	adds r0, r2, r1
	ldrb r0, [r0]
	ldr r1, _0804C890  @ gPaletteBuffer
	lsls r0, r0, #1
	adds r0, r0, r4
	ldrh r0, [r0]
	movs r2, #0x9f
	lsls r2, r2, #2
	adds r1, r1, r2
	strh r0, [r1]
	bl EnablePaletteSync
_0804C87C:
	add sp, #0x20
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804C884: .4byte gUnknown_085ADE48
_0804C888: .4byte gUnknown_080DA0DA
_0804C88C: .4byte gUnknown_0203DDDC
_0804C890: .4byte gPaletteBuffer

	THUMB_FUNC_END sub_804C83C

	THUMB_FUNC_START sub_804C894
sub_804C894: @ 0x0804C894
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r7, r0, #0
	ldr r0, _0804C9E4  @ gUnknown_0203DA24
	ldrb r0, [r0]
	cmp r0, #1
	beq _0804C8AC
	b _0804CA08
_0804C8AC:
	adds r0, r7, #0
	adds r0, #0x44
	movs r1, #0
	ldrsb r1, [r0, r1]
	movs r2, #0xc0
	lsls r2, r2, #4
	mov r8, r2
	str r0, [sp, #4]
	cmp r1, #0
	beq _0804C8C6
	movs r0, #0x80
	lsls r0, r0, #3
	mov r8, r0
_0804C8C6:
	ldr r3, _0804C9E8  @ gUnknown_085AA9D8
	movs r0, #0
	str r0, [sp]
	movs r1, #0x58
	movs r2, #0x20
	bl PutSprite
	movs r6, #0
	ldr r0, [r7, #0x2c]
	cmp r6, r0
	bge _0804C92A
	movs r5, #0x20
_0804C8DE:
	lsls r1, r6, #1
	adds r0, r7, #0
	adds r0, #0x30
	adds r4, r0, r1
	movs r2, #0
	ldrsh r1, [r4, r2]
	adds r1, #6
	movs r0, #0xf
	ands r0, r6
	lsls r0, r0, #0xc
	add r0, r8
	str r0, [sp]
	movs r0, #4
	adds r2, r5, #0
	ldr r3, _0804C9EC  @ gUnknown_085AAA50
	bl PutSprite
	adds r0, r7, #0
	adds r0, #0x3a
	adds r0, r0, r6
	ldrb r0, [r0]
	cmp r0, #0
	beq _0804C920
	movs r0, #0
	ldrsh r1, [r4, r0]
	adds r1, #6
	mov r2, r8
	str r2, [sp]
	movs r0, #4
	adds r2, r5, #0
	ldr r3, _0804C9F0  @ gUnknown_085AAA5E
	bl PutSprite
_0804C920:
	adds r5, #0x18
	adds r6, #1
	ldr r0, [r7, #0x2c]
	cmp r6, r0
	blt _0804C8DE
_0804C92A:
	ldr r0, [r7, #0x40]
	cmp r0, #0
	beq _0804C9DE
	ldr r0, _0804C9F4  @ gUnknown_0203DDDC
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _0804C95C
	bl GetGameClock
	ldr r2, _0804C9F8  @ gPaletteBuffer
	movs r1, #0x3f
	ands r1, r0
	lsrs r1, r1, #2
	lsls r1, r1, #1
	ldr r0, _0804C9FC  @ gUnknown_08A1BD40
	adds r1, r1, r0
	ldrh r0, [r1]
	movs r1, #0xc7
	lsls r1, r1, #2
	adds r2, r2, r1
	strh r0, [r2]
	bl EnablePaletteSync
_0804C95C:
	ldr r0, [r7, #0x40]
	cmp r0, #0xff
	bgt _0804C966
	adds r0, #0x10
	str r0, [r7, #0x40]
_0804C966:
	ldr r4, _0804CA00  @ gSinLookup
	movs r2, #0x80
	adds r2, r2, r4
	mov r9, r2
	movs r1, #0
	ldrsh r0, [r2, r1]
	lsls r0, r0, #4
	movs r2, #0x80
	lsls r2, r2, #1
	mov r8, r2
	mov r1, r8
	bl Div
	adds r6, r0, #0
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	movs r1, #0
	ldrsh r0, [r4, r1]
	negs r0, r0
	lsls r0, r0, #4
	ldr r1, [r7, #0x40]
	bl Div
	adds r5, r0, #0
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	movs r2, #0
	ldrsh r0, [r4, r2]
	lsls r0, r0, #4
	mov r1, r8
	bl Div
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	mov r1, r9
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #4
	ldr r1, [r7, #0x40]
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	movs r0, #0
	adds r1, r6, #0
	adds r2, r5, #0
	adds r3, r4, #0
	bl WriteOAMRotScaleData
	ldr r3, _0804CA04  @ gUnknown_080DA0FA
	movs r0, #0x80
	lsls r0, r0, #8
	str r0, [sp]
	movs r0, #4
	movs r1, #0x78
	movs r2, #0
	bl PutSprite
_0804C9DE:
	bl sub_804C83C
	b _0804CA96
	.align 2, 0
_0804C9E4: .4byte gUnknown_0203DA24
_0804C9E8: .4byte gUnknown_085AA9D8
_0804C9EC: .4byte gUnknown_085AAA50
_0804C9F0: .4byte gUnknown_085AAA5E
_0804C9F4: .4byte gUnknown_0203DDDC
_0804C9F8: .4byte gPaletteBuffer
_0804C9FC: .4byte gUnknown_08A1BD40
_0804CA00: .4byte gSinLookup
_0804CA04: .4byte gUnknown_080DA0FA
_0804CA08:
	ldr r3, _0804CA70  @ gUnknown_085AA9D8
	movs r0, #0
	str r0, [sp]
	movs r0, #0xb
	movs r1, #0x58
	movs r2, #0x20
	bl PutSprite
	movs r6, #0
	ldr r0, [r7, #0x2c]
	adds r1, r7, #0
	adds r1, #0x44
	str r1, [sp, #4]
	cmp r6, r0
	bge _0804CA92
	ldr r2, _0804CA74  @ gUnknown_085AAA48
	mov sl, r2
	movs r0, #8
	negs r0, r0
	mov r9, r0
	movs r1, #0x30
	mov r8, r1
_0804CA34:
	lsls r1, r6, #1
	adds r0, r7, #0
	adds r0, #0x30
	adds r5, r0, r1
	movs r2, #0
	ldrsh r1, [r5, r2]
	adds r4, r7, #0
	adds r4, #0x3a
	adds r4, r4, r6
	ldrb r0, [r4]
	lsls r0, r0, #2
	add r0, sl
	ldr r3, [r0]
	movs r0, #0
	str r0, [sp]
	movs r0, #2
	mov r2, r8
	bl PutSprite
	ldrb r0, [r4]
	cmp r0, #0
	beq _0804CA78
	ldrh r1, [r5]
	movs r2, #0
	ldrsh r0, [r5, r2]
	cmp r0, #0
	bge _0804CA86
	adds r0, r1, #1
	b _0804CA84
	.align 2, 0
_0804CA70: .4byte gUnknown_085AA9D8
_0804CA74: .4byte gUnknown_085AAA48
_0804CA78:
	ldrh r1, [r5]
	movs r2, #0
	ldrsh r0, [r5, r2]
	cmp r0, r9
	ble _0804CA86
	subs r0, r1, #1
_0804CA84:
	strh r0, [r5]
_0804CA86:
	movs r0, #0x10
	add r8, r0
	adds r6, #1
	ldr r0, [r7, #0x2c]
	cmp r6, r0
	blt _0804CA34
_0804CA92:
	bl sub_804C7E4
_0804CA96:
	ldr r0, _0804CAE4  @ gUnknown_0203DA24
	ldrb r0, [r0]
	movs r1, #0x80
	lsls r1, r1, #4
	mov r8, r1
	cmp r0, #1
	bne _0804CAAA
	movs r2, #0x80
	lsls r2, r2, #3
	mov r8, r2
_0804CAAA:
	ldr r1, [sp, #4]
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	beq _0804CABC
	movs r0, #0xc0
	movs r1, #0x10
	bl sub_804C2B8
_0804CABC:
	ldr r0, [r7, #0x48]
	cmp r0, #0
	blt _0804CAD4
	adds r2, r0, #0
	adds r2, #8
	ldr r3, _0804CAE8  @ gUnknown_085AAA0E
	mov r0, r8
	str r0, [sp]
	movs r0, #4
	movs r1, #0x50
	bl PutSprite
_0804CAD4:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804CAE4: .4byte gUnknown_0203DA24
_0804CAE8: .4byte gUnknown_085AAA0E

	THUMB_FUNC_END sub_804C894

	THUMB_FUNC_START sub_804CAEC
sub_804CAEC: @ 0x0804CAEC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	adds r6, r0, #0
	adds r5, r1, #0
	mov r8, r2
	ldr r4, _0804CB8C  @ gUnknown_085AAA78
	adds r0, r4, #0
	bl Proc_EndEach
	adds r0, r4, #0
	adds r1, r6, #0
	bl Proc_Start
	adds r4, r0, #0
	str r5, [r4, #0x2c]
	adds r1, r4, #0
	adds r1, #0x44
	movs r2, #0
	movs r0, #1
	strb r0, [r1]
	str r2, [r4, #0x40]
	subs r0, #2
	str r0, [r4, #0x48]
	movs r3, #0
	adds r5, r4, #0
	adds r5, #0x3a
	ldr r0, _0804CB90  @ 0x0000FFF8
	mov ip, r0
	adds r2, r4, #0
	adds r2, #0x30
_0804CB2C:
	adds r0, r5, r3
	mov r7, r8
	adds r1, r7, r3
	ldrb r1, [r1]
	strb r1, [r0]
	mov r0, ip
	strh r0, [r2]
	adds r2, #2
	adds r3, #1
	cmp r3, #4
	ble _0804CB2C
	ldr r2, [r6, #0x38]
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	adds r0, r6, #0
	adds r0, #0x4a
	ldrb r0, [r0]
	adds r0, #0x28
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	str r4, [sp, #4]
	movs r0, #0xe1
	movs r1, #0x28
	movs r3, #6
	bl sub_804D1E0
	adds r0, r6, #0
	adds r0, #0x48
	ldrb r0, [r0]
	lsls r0, r0, #4
	movs r1, #0x28
	subs r1, r1, r0
	ldr r0, [r6, #0x38]
	str r0, [sp]
	str r4, [sp, #4]
	movs r0, #0x98
	movs r2, #0x88
	movs r3, #0x27
	bl sub_804CC14
	adds r0, r4, #0
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0804CB8C: .4byte gUnknown_085AAA78
_0804CB90: .4byte 0x0000FFF8

	THUMB_FUNC_END sub_804CAEC

	THUMB_FUNC_START sub_804CB94
sub_804CB94: @ 0x0804CB94
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r4, r0, #0
	movs r0, #0
	mov r8, r0
	b _0804CBFC
_0804CBA8:
	mov r1, r8
	lsls r0, r1, #4
	ldr r1, [r4, #0x30]
	adds r5, r1, r0
	ldr r0, [r4, #0x38]
	movs r1, #1
	add r1, r8
	mov sl, r1
	cmp r5, r0
	bge _0804CBFA
	ldr r0, [r4, #0x34]
	cmp r5, r0
	ble _0804CBFA
	movs r6, #0
	mov r0, r8
	lsls r0, r0, #2
	mov r9, r0
	movs r7, #0
_0804CBCC:
	mov r0, r9
	add r0, r8
	adds r0, r0, r6
	adds r0, #1
	bl GetUnit
	adds r2, r0, #0
	ldr r0, [r2]
	cmp r0, #0
	beq _0804CBF2
	ldr r1, [r4, #0x2c]
	adds r1, r1, r7
	str r2, [sp]
	movs r0, #4
	adds r2, r5, #0
	movs r3, #0x80
	lsls r3, r3, #3
	bl sub_8027E4C
_0804CBF2:
	adds r7, #0xe
	adds r6, #1
	cmp r6, #4
	ble _0804CBCC
_0804CBFA:
	mov r8, sl
_0804CBFC:
	ldr r0, [r4, #0x3c]
	cmp r8, r0
	blt _0804CBA8
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_804CB94

	THUMB_FUNC_START sub_804CC14
sub_804CC14: @ 0x0804CC14
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	mov r9, r0
	mov sl, r1
	adds r7, r2, #0
	mov r8, r3
	ldr r6, [sp, #0x20]
	ldr r5, [sp, #0x24]
	ldr r4, _0804CC58  @ gUnknown_085AAA90
	adds r0, r4, #0
	bl Proc_EndEach
	adds r0, r4, #0
	adds r1, r5, #0
	bl Proc_Start
	str r6, [r0, #0x3c]
	mov r1, r9
	str r1, [r0, #0x2c]
	mov r1, sl
	str r1, [r0, #0x30]
	mov r1, r8
	str r1, [r0, #0x34]
	str r7, [r0, #0x38]
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804CC58: .4byte gUnknown_085AAA90

	THUMB_FUNC_END sub_804CC14

	THUMB_FUNC_START sub_804CC5C
sub_804CC5C: @ 0x0804CC5C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0804CC74  @ gUnknown_085AAA90
	bl Proc_Find
	ldr r1, [r0, #0x30]
	adds r1, r1, r4
	str r1, [r0, #0x30]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804CC74: .4byte gUnknown_085AAA90

	THUMB_FUNC_END sub_804CC5C

	THUMB_FUNC_START sub_804CC78
sub_804CC78: @ 0x0804CC78
	push {r4, r5, r6, lr}
	ldr r5, _0804CCBC  @ gUnknown_085ADE28
	ldr r0, _0804CCC0  @ gUnknown_0203DDDC
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _0804CCB6
	bl GetGameClock
	adds r2, r0, #0
	movs r0, #0x1f
	ands r2, r0
	asrs r2, r2, #1
	movs r1, #0
	ldr r0, _0804CCC4  @ gPaletteBuffer
	movs r4, #0xf
	ldr r6, _0804CCC8  @ 0x00000336
	adds r3, r0, r6
_0804CC9E:
	adds r0, r2, r1
	ands r0, r4
	lsls r0, r0, #1
	adds r0, r0, r5
	ldrh r0, [r0]
	strh r0, [r3]
	adds r3, #2
	adds r1, #1
	cmp r1, #4
	ble _0804CC9E
	bl EnablePaletteSync
_0804CCB6:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0804CCBC: .4byte gUnknown_085ADE28
_0804CCC0: .4byte gUnknown_0203DDDC
_0804CCC4: .4byte gPaletteBuffer
_0804CCC8: .4byte 0x00000336

	THUMB_FUNC_END sub_804CC78

	THUMB_FUNC_START sub_804CCCC
sub_804CCCC: @ 0x0804CCCC
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r7, r0, #0
	ldr r1, [r7, #0x34]
	ldr r0, [r7, #0x2c]
	adds r1, r1, r0
	asrs r1, r1, #1
	ldr r2, [r7, #0x38]
	ldr r0, [r7, #0x30]
	adds r2, r2, r0
	asrs r2, r2, #1
	str r1, [r7, #0x2c]
	str r2, [r7, #0x30]
	ldr r3, _0804CD54  @ gUnknown_085AAAA8
	ldr r0, [r7, #0x3c]
	lsls r0, r0, #2
	adds r0, r0, r3
	ldr r3, [r0]
	movs r4, #0
	str r4, [sp]
	movs r0, #2
	bl PutSprite
	ldr r1, [r7, #0x40]
	adds r1, #0x60
	ldr r3, _0804CD58  @ gUnknown_080DA132
	str r4, [sp]
	movs r0, #2
	movs r2, #0x30
	bl PutSprite
	ldr r3, _0804CD5C  @ gUnknown_085AA9D8
	str r4, [sp]
	movs r0, #2
	movs r1, #0x60
	movs r2, #0x20
	bl PutSprite
	ldr r3, _0804CD60  @ gUnknown_085AAA50
	movs r0, #0x80
	lsls r0, r0, #4
	str r0, [sp]
	movs r0, #4
	movs r1, #0x50
	movs r2, #0x20
	bl PutSprite
	movs r4, #3
	ldr r0, _0804CD64  @ gUnknown_085AAAB0
	adds r6, r0, #0
	adds r6, #0xc
	movs r5, #0x78
_0804CD34:
	ldr r0, [r7, #0x44]
	cmp r0, r4
	bne _0804CD68
	cmp r4, #2
	bgt _0804CD68
	ldr r3, [r6]
	movs r0, #0x80
	lsls r0, r0, #7
	str r0, [sp]
	movs r0, #4
	movs r1, #0xc4
	adds r2, r5, #0
	bl PutSprite
	b _0804CD7A
	.align 2, 0
_0804CD54: .4byte gUnknown_085AAAA8
_0804CD58: .4byte gUnknown_080DA132
_0804CD5C: .4byte gUnknown_085AA9D8
_0804CD60: .4byte gUnknown_085AAA50
_0804CD64: .4byte gUnknown_085AAAB0
_0804CD68:
	ldr r3, [r6]
	movs r0, #0x80
	lsls r0, r0, #8
	str r0, [sp]
	movs r0, #4
	movs r1, #0xc4
	adds r2, r5, #0
	bl PutSprite
_0804CD7A:
	adds r6, #4
	adds r5, #0x10
	adds r4, #1
	cmp r4, #4
	ble _0804CD34
	bl sub_804CC78
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_804CCCC

	THUMB_FUNC_START sub_804CD90
sub_804CD90: @ 0x0804CD90
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r6, r0, #0
	adds r5, r1, #0
	mov r8, r2
	ldr r4, _0804CDCC  @ gUnknown_085AAAC4
	adds r0, r4, #0
	bl Proc_EndEach
	adds r0, r4, #0
	adds r1, r6, #0
	bl Proc_Start
	str r5, [r0, #0x34]
	str r5, [r0, #0x2c]
	mov r1, r8
	str r1, [r0, #0x38]
	str r1, [r0, #0x30]
	movs r1, #0
	str r1, [r0, #0x3c]
	str r1, [r0, #0x40]
	movs r1, #1
	str r1, [r0, #0x44]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0804CDCC: .4byte gUnknown_085AAAC4

	THUMB_FUNC_END sub_804CD90

	THUMB_FUNC_START sub_804CDD0
sub_804CDD0: @ 0x0804CDD0
	push {r4, r5, lr}
	ldr r4, [sp, #0xc]
	ldr r5, [sp, #0x10]
	str r1, [r0, #0x34]
	str r2, [r0, #0x38]
	str r4, [r0, #0x3c]
	str r3, [r0, #0x40]
	str r5, [r0, #0x44]
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_804CDD0

	THUMB_FUNC_START sub_804CDE8
sub_804CDE8: @ 0x0804CDE8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r5, r0, #0
	movs r0, #0x2c
	ldrsh r1, [r5, r0]
	movs r2, #0x2a
	ldrsh r0, [r5, r2]
	adds r1, r1, r0
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r7, r0, #2
	ldrh r0, [r5, #0x2c]
	strh r0, [r5, #0x2a]
	ldr r0, _0804CE58  @ gUnknown_085AAADC
	mov r8, r0
	movs r6, #0x30
	movs r4, #2
_0804CE0E:
	mov r1, r8
	adds r1, #4
	mov r8, r1
	subs r1, #4
	ldm r1!, {r3}
	movs r0, #0
	str r0, [sp]
	movs r0, #2
	movs r1, #0x20
	adds r2, r6, #0
	bl PutSprite
	adds r6, #0x18
	subs r4, #1
	cmp r4, #0
	bge _0804CE0E
	adds r1, r7, #0
	adds r1, #0x30
	movs r0, #0x20
	bl DisplayFrozenUiHand
	movs r2, #0x2e
	ldrsh r0, [r5, r2]
	movs r2, #0x30
	ldrsh r1, [r5, r2]
	bl DisplayUiHand
	movs r0, #0xc0
	movs r1, #0x10
	bl sub_804C2B8
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804CE58: .4byte gUnknown_085AAADC

	THUMB_FUNC_END sub_804CDE8

	THUMB_FUNC_START sub_804CE5C
sub_804CE5C: @ 0x0804CE5C
	push {r4, r5, r6, lr}
	sub sp, #4
	ldr r6, _0804CE88  @ gUnknown_085AAADC
	movs r5, #0x30
	movs r4, #2
_0804CE66:
	ldm r6!, {r3}
	movs r0, #0
	str r0, [sp]
	movs r0, #2
	movs r1, #0x20
	adds r2, r5, #0
	bl PutSprite
	adds r5, #0x18
	subs r4, #1
	cmp r4, #0
	bge _0804CE66
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0804CE88: .4byte gUnknown_085AAADC

	THUMB_FUNC_END sub_804CE5C

	THUMB_FUNC_START sub_804CE8C
sub_804CE8C: @ 0x0804CE8C
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _0804CEAC  @ gUnknown_085AAAE8
	adds r0, r4, #0
	bl Proc_EndEach
	adds r0, r4, #0
	adds r1, r5, #0
	bl Proc_Start
	movs r1, #0
	strh r1, [r0, #0x2a]
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0804CEAC: .4byte gUnknown_085AAAE8

	THUMB_FUNC_END sub_804CE8C

	THUMB_FUNC_START sub_804CEB0
sub_804CEB0: @ 0x0804CEB0
	push {lr}
	ldr r0, _0804CEC0  @ gUnknown_085AAB00
	movs r1, #3
	bl Proc_Start
	pop {r0}
	bx r0
	.align 2, 0
_0804CEC0: .4byte gUnknown_085AAB00

	THUMB_FUNC_END sub_804CEB0

	THUMB_FUNC_START sub_804CEC4
sub_804CEC4: @ 0x0804CEC4
	strh r1, [r0, #0x2c]
	strh r2, [r0, #0x2e]
	strh r3, [r0, #0x30]
	bx lr

	THUMB_FUNC_END sub_804CEC4

	THUMB_FUNC_START sub_804CECC
sub_804CECC: @ 0x0804CECC
	push {lr}
	adds r1, r0, #0
	ldr r2, _0804CEF8  @ gUnknown_085ADE28
	ldr r0, _0804CEFC  @ gUnknown_0203DDDC
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _0804CEF2
	ldr r0, _0804CF00  @ gPaletteBuffer
	lsls r1, r1, #1
	adds r1, r1, r2
	ldrh r1, [r1]
	movs r2, #0xb7
	lsls r2, r2, #2
	adds r0, r0, r2
	strh r1, [r0]
	bl EnablePaletteSync
_0804CEF2:
	pop {r0}
	bx r0
	.align 2, 0
_0804CEF8: .4byte gUnknown_085ADE28
_0804CEFC: .4byte gUnknown_0203DDDC
_0804CF00: .4byte gPaletteBuffer

	THUMB_FUNC_END sub_804CECC

	THUMB_FUNC_START sub_804CF04
sub_804CF04: @ 0x0804CF04
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r7, r0, #0
	movs r0, #0x4c
	adds r0, r0, r7
	mov r8, r0
	movs r1, #0
	ldrsh r5, [r0, r1]
	lsls r4, r5, #1
	adds r0, r5, #0
	bl sub_804CECC
	ldr r0, _0804CFA4  @ gUnknown_080DA1CA
	adds r4, #1
	lsls r4, r4, #1
	adds r4, r4, r0
	movs r1, #0
	ldrsh r6, [r4, r1]
	ldr r1, [r7, #0x2c]
	subs r1, r1, r6
	lsls r5, r5, #2
	adds r5, r5, r0
	movs r0, #0
	ldrsh r5, [r5, r0]
	ldr r2, [r7, #0x30]
	subs r2, r2, r5
	ldr r3, _0804CFA8  @ gUnknown_080DA17A
	movs r4, #0
	str r4, [sp]
	movs r0, #2
	bl PutSprite
	ldr r1, [r7, #0x2c]
	adds r1, r1, r6
	adds r1, #0x10
	ldr r2, [r7, #0x30]
	subs r2, r2, r5
	ldr r3, _0804CFAC  @ gUnknown_080DA18E
	str r4, [sp]
	movs r0, #2
	bl PutSprite
	ldr r1, [r7, #0x2c]
	subs r1, r1, r6
	ldr r2, [r7, #0x30]
	adds r2, r2, r5
	ldr r3, _0804CFB0  @ gUnknown_080DA1A2
	str r4, [sp]
	movs r0, #2
	bl PutSprite
	ldr r1, [r7, #0x2c]
	adds r1, r1, r6
	adds r1, #0x10
	ldr r2, [r7, #0x30]
	adds r2, r2, r5
	ldr r3, _0804CFB4  @ gUnknown_080DA1B6
	str r4, [sp]
	movs r0, #2
	bl PutSprite
	mov r1, r8
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xf
	bne _0804CF98
	adds r0, r7, #0
	bl Proc_Break
_0804CF98:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804CFA4: .4byte gUnknown_080DA1CA
_0804CFA8: .4byte gUnknown_080DA17A
_0804CFAC: .4byte gUnknown_080DA18E
_0804CFB0: .4byte gUnknown_080DA1A2
_0804CFB4: .4byte gUnknown_080DA1B6

	THUMB_FUNC_END sub_804CF04

	THUMB_FUNC_START sub_804CFB8
sub_804CFB8: @ 0x0804CFB8
	push {r4, r5, lr}
	adds r3, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	ldr r0, _0804CFDC  @ gUnknown_085AAB18
	adds r1, r3, #0
	bl Proc_Start
	adds r1, r0, #0
	str r4, [r1, #0x2c]
	str r5, [r1, #0x30]
	adds r1, #0x4c
	movs r2, #0
	strh r2, [r1]
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0804CFDC: .4byte gUnknown_085AAB18

	THUMB_FUNC_END sub_804CFB8

	THUMB_FUNC_START sub_804CFE0
sub_804CFE0: @ 0x0804CFE0
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r0, #0x45
	movs r1, #0
	strb r1, [r0]
	subs r0, #1
	strb r1, [r0]
	subs r0, #7
	ldrb r0, [r0]
	ldr r4, [r6, #0x34]
	muls r0, r4, r0
	lsls r0, r0, #3
	adds r5, r6, #0
	adds r5, #0x3c
	ldrb r1, [r5]
	bl __divsi3
	str r0, [r6, #0x38]
	lsls r4, r4, #0xb
	ldrb r1, [r5]
	lsls r1, r1, #4
	adds r0, r4, #0
	bl __divsi3
	adds r1, r6, #0
	adds r1, #0x42
	strh r0, [r1]
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_804CFE0

	THUMB_FUNC_START sub_804D01C
sub_804D01C: @ 0x0804D01C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x30
	adds r7, r0, #0
	ldr r0, [r7, #0x2c]
	mov r8, r0
	ldr r1, [r7, #0x30]
	str r1, [sp, #0xc]
	adds r1, #8
	mov sl, r1
	ldr r0, [r7, #0x38]
	asrs r2, r0, #3
	str r2, [sp, #0x10]
	movs r1, #7
	ands r0, r1
	movs r1, #8
	subs r0, r1, r0
	str r0, [sp, #0x14]
	movs r3, #0x3e
	ldrsh r1, [r7, r3]
	adds r0, r7, #0
	adds r0, #0x42
	ldrh r0, [r0]
	muls r0, r1, r0
	asrs r0, r0, #8
	str r0, [sp, #0x18]
	movs r0, #0x3c
	adds r0, r0, r7
	mov ip, r0
	movs r1, #0x3d
	adds r1, r1, r7
	mov r9, r1
	ldrb r0, [r0]
	ldrb r2, [r1]
	cmp r0, r2
	bhi _0804D06C
	b _0804D1C4
_0804D06C:
	adds r5, r7, #0
	adds r5, #0x44
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
	adds r4, r7, #0
	adds r4, #0x45
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	adds r0, r7, #0
	adds r0, #0x40
	movs r3, #0x3e
	ldrsh r2, [r7, r3]
	movs r3, #0
	ldrsh r1, [r0, r3]
	adds r3, r5, #0
	str r0, [sp, #0x2c]
	cmp r2, r1
	bge _0804D09A
	ldrb r0, [r3]
	adds r0, #2
	strb r0, [r3]
_0804D09A:
	movs r0, #0x3e
	ldrsh r1, [r7, r0]
	ldr r2, [sp, #0x2c]
	movs r3, #0
	ldrsh r0, [r2, r3]
	cmp r1, r0
	ble _0804D0AE
	ldrb r0, [r4]
	adds r0, #2
	strb r0, [r4]
_0804D0AE:
	movs r6, #0
	mov r0, ip
	str r0, [sp, #0x28]
	ldr r1, [sp, #0x18]
	add r1, sl
	str r1, [sp, #0x1c]
	ldr r2, [sp, #0x10]
	lsls r2, r2, #3
	str r2, [sp, #0x24]
	ldr r3, [sp, #0xc]
	str r3, [sp, #0x20]
_0804D0C4:
	ldrb r0, [r5]
	cmp r0, #0x30
	bls _0804D0CE
	movs r0, #0
	strb r0, [r5]
_0804D0CE:
	lsls r4, r6, #2
	add r4, sp
	adds r4, #4
	ldrb r0, [r5]
	lsrs r0, r0, #3
	movs r1, #6
	bl __umodsi3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [r4]
	adds r5, #1
	adds r6, #1
	cmp r6, #1
	ble _0804D0C4
	movs r1, #0x3e
	ldrsh r0, [r7, r1]
	cmp r0, #0
	beq _0804D106
	mov r2, sl
	subs r2, #9
	ldr r3, _0804D1D4  @ gUnknown_085AAB38
	ldr r0, [sp, #4]
	str r0, [sp]
	movs r0, #3
	mov r1, r8
	bl PutSprite
_0804D106:
	movs r2, #0x3e
	ldrsh r0, [r7, r2]
	cmp r0, #0
	bge _0804D110
	adds r0, #0xf
_0804D110:
	asrs r0, r0, #4
	mov r3, r9
	ldrb r3, [r3]
	adds r0, r0, r3
	ldr r1, [sp, #0x28]
	ldrb r1, [r1]
	cmp r0, r1
	bge _0804D136
	ldr r2, [r7, #0x34]
	lsls r2, r2, #3
	add r2, sl
	adds r2, #1
	ldr r3, _0804D1D8  @ gUnknown_085AAB30
	ldr r0, [sp, #8]
	str r0, [sp]
	movs r0, #3
	mov r1, r8
	bl PutSprite
_0804D136:
	movs r6, #0
	ldr r0, [r7, #0x34]
	cmp r6, r0
	bge _0804D15A
	mov r4, sl
	movs r5, #1
_0804D142:
	str r5, [sp]
	movs r0, #2
	mov r1, r8
	adds r2, r4, #0
	ldr r3, _0804D1DC  @ gUnknown_085AAB40
	bl PutSprite
	adds r4, #8
	adds r6, #1
	ldr r0, [r7, #0x34]
	cmp r6, r0
	blt _0804D142
_0804D15A:
	ldr r2, [sp, #0x10]
	cmp r2, #0
	ble _0804D17C
	ldr r4, [sp, #0x1c]
	movs r5, #0
	adds r6, r2, #0
_0804D166:
	str r5, [sp]
	movs r0, #2
	mov r1, r8
	adds r2, r4, #0
	ldr r3, _0804D1DC  @ gUnknown_085AAB40
	bl PutSprite
	adds r4, #8
	subs r6, #1
	cmp r6, #0
	bne _0804D166
_0804D17C:
	ldr r3, [sp, #0x1c]
	ldr r0, [sp, #0x24]
	adds r2, r3, r0
	ldr r1, [sp, #0x14]
	subs r2, r2, r1
	ldr r4, _0804D1DC  @ gUnknown_085AAB40
	movs r0, #0
	str r0, [sp]
	movs r0, #2
	mov r1, r8
	adds r3, r4, #0
	bl PutSprite
	movs r5, #2
	str r5, [sp]
	movs r0, #2
	mov r1, r8
	ldr r2, [sp, #0x20]
	adds r3, r4, #0
	bl PutSprite
	movs r1, #0x80
	lsls r1, r1, #6
	add r1, r8
	ldr r2, [r7, #0x34]
	lsls r2, r2, #3
	add r2, sl
	subs r2, #7
	str r5, [sp]
	movs r0, #2
	adds r3, r4, #0
	bl PutSprite
	ldrh r0, [r7, #0x3e]
	ldr r2, [sp, #0x2c]
	strh r0, [r2]
_0804D1C4:
	add sp, #0x30
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804D1D4: .4byte gUnknown_085AAB38
_0804D1D8: .4byte gUnknown_085AAB30
_0804D1DC: .4byte gUnknown_085AAB40

	THUMB_FUNC_END sub_804D01C

	THUMB_FUNC_START sub_804D1E0
sub_804D1E0: @ 0x0804D1E0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	mov r9, r0
	mov sl, r1
	mov r8, r2
	adds r5, r3, #0
	ldr r6, [sp, #0x20]
	ldr r7, [sp, #0x24]
	mov r0, r8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	ldr r4, _0804D248  @ gUnknown_085AAB48
	adds r0, r4, #0
	bl Proc_EndEach
	adds r0, r4, #0
	adds r1, r7, #0
	bl Proc_Start
	adds r1, r0, #0
	mov r2, r9
	str r2, [r1, #0x2c]
	mov r0, sl
	str r0, [r1, #0x30]
	lsls r0, r5, #1
	subs r0, #2
	str r0, [r1, #0x34]
	adds r0, r1, #0
	adds r0, #0x3c
	mov r2, r8
	strb r2, [r0]
	adds r0, #1
	strb r5, [r0]
	strh r6, [r1, #0x3e]
	adds r0, #3
	strh r6, [r0]
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804D248: .4byte gUnknown_085AAB48

	THUMB_FUNC_END sub_804D1E0

	THUMB_FUNC_START sub_804D24C
sub_804D24C: @ 0x0804D24C
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	lsls r1, r1, #0x10
	lsrs r4, r1, #0x10
	ldr r0, _0804D2A0  @ gUnknown_085AAB48
	bl Proc_Find
	adds r6, r0, #0
	cmp r6, #0
	beq _0804D298
	adds r5, r6, #0
	adds r5, #0x3c
	strb r7, [r5]
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	movs r1, #0xff
	ands r0, r1
	strh r0, [r6, #0x3e]
	adds r0, r6, #0
	adds r0, #0x3d
	ldrb r0, [r0]
	ldr r4, [r6, #0x34]
	muls r0, r4, r0
	lsls r0, r0, #3
	ldrb r1, [r5]
	bl __divsi3
	str r0, [r6, #0x38]
	lsls r4, r4, #0xb
	ldrb r1, [r5]
	lsls r1, r1, #4
	adds r0, r4, #0
	bl __divsi3
	adds r1, r6, #0
	adds r1, #0x42
	strh r0, [r1]
_0804D298:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804D2A0: .4byte gUnknown_085AAB48

	THUMB_FUNC_END sub_804D24C

	THUMB_FUNC_START sub_804D2A4
sub_804D2A4: @ 0x0804D2A4
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #0x30
	mov r1, sp
	ldr r0, _0804D348  @ gUnknown_080DA20C
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldr r0, [r0]
	str r0, [r1]
	add r6, sp, #0x10
	adds r1, r6, #0
	ldr r0, _0804D34C  @ gUnknown_080DA21C
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldr r0, [r0]
	str r0, [r1]
	add r0, sp, #0x20
	mov r8, r0
	mov r1, r8
	ldr r0, _0804D350  @ gUnknown_080DA22C
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldr r0, [r0]
	str r0, [r1]
	ldr r0, _0804D354  @ gUnknown_0859F020
	ldr r1, _0804D358  @ 0x06014000
	bl CopyDataWithPossibleUncomp
	ldr r0, _0804D35C  @ gUnknown_085A06D8
	ldr r1, _0804D360  @ 0x06002000
	bl CopyDataWithPossibleUncomp
	ldr r0, _0804D364  @ gUnknown_085AE7EC
	ldr r1, _0804D368  @ 0x06002800
	bl CopyDataWithPossibleUncomp
	ldr r5, _0804D36C  @ gRAMChapterData
	ldrb r0, [r5, #0xf]
	lsls r0, r0, #2
	add r0, sp
	ldr r0, [r0]
	ldr r4, _0804D370  @ gUnknown_02020188
	adds r1, r4, #0
	bl CopyDataWithPossibleUncomp
	ldr r1, _0804D374  @ 0x06002980
	adds r0, r4, #0
	movs r2, #3
	movs r3, #3
	bl CopyTileGfxForObj
	ldrb r0, [r5, #0xf]
	lsls r0, r0, #2
	adds r6, r6, r0
	ldr r0, [r6]
	movs r1, #0xa0
	movs r2, #0x20
	bl CopyToPaletteBuffer
	ldrb r0, [r5, #0xf]
	lsls r0, r0, #2
	add r8, r0
	mov r1, r8
	ldr r0, [r1]
	movs r1, #0x90
	lsls r1, r1, #2
	movs r2, #0x20
	bl CopyToPaletteBuffer
	ldr r1, _0804D378  @ gUnknown_03001860
	ldrb r0, [r5, #0xf]
	str r0, [r1]
	movs r0, #0
	strb r0, [r5, #0xf]
	add sp, #0x30
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0804D348: .4byte gUnknown_080DA20C
_0804D34C: .4byte gUnknown_080DA21C
_0804D350: .4byte gUnknown_080DA22C
_0804D354: .4byte gUnknown_0859F020
_0804D358: .4byte 0x06014000
_0804D35C: .4byte gUnknown_085A06D8
_0804D360: .4byte 0x06002000
_0804D364: .4byte gUnknown_085AE7EC
_0804D368: .4byte 0x06002800
_0804D36C: .4byte gRAMChapterData
_0804D370: .4byte gUnknown_02020188
_0804D374: .4byte 0x06002980
_0804D378: .4byte gUnknown_03001860

	THUMB_FUNC_END sub_804D2A4

	THUMB_FUNC_START sub_804D37C
sub_804D37C: @ 0x0804D37C
	push {r4, lr}
	ldr r1, _0804D3D0  @ gRAMChapterData
	ldr r0, _0804D3D4  @ gUnknown_03001860
	ldr r0, [r0]
	strb r0, [r1, #0xf]
	ldr r4, _0804D3D8  @ gLCDControlBuffer
	ldrb r1, [r4, #1]
	movs r0, #0x21
	negs r0, r0
	ands r0, r1
	movs r1, #0x41
	negs r1, r1
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r4, #1]
	bl SetDefaultColorEffects
	ldrb r2, [r4, #0xc]
	movs r1, #4
	negs r1, r1
	adds r0, r1, #0
	ands r0, r2
	strb r0, [r4, #0xc]
	ldrb r2, [r4, #0x10]
	adds r0, r1, #0
	ands r0, r2
	movs r2, #1
	orrs r0, r2
	strb r0, [r4, #0x10]
	ldrb r0, [r4, #0x14]
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	strb r1, [r4, #0x14]
	ldrb r0, [r4, #0x18]
	movs r1, #3
	orrs r0, r1
	strb r0, [r4, #0x18]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804D3D0: .4byte gRAMChapterData
_0804D3D4: .4byte gUnknown_03001860
_0804D3D8: .4byte gLCDControlBuffer

	THUMB_FUNC_END sub_804D37C

	THUMB_FUNC_START sub_804D3DC
sub_804D3DC: @ 0x0804D3DC
	push {lr}
	ldr r1, _0804D3EC  @ gUnknown_03006650
	movs r0, #0x34
	bl Sound_PlaySong80024D4
	pop {r0}
	bx r0
	.align 2, 0
_0804D3EC: .4byte gUnknown_03006650

	THUMB_FUNC_END sub_804D3DC

	THUMB_FUNC_START sub_804D3F0
sub_804D3F0: @ 0x0804D3F0
	push {lr}
	lsls r1, r1, #1
	adds r0, #0x1e
	adds r2, r0, r1
	ldrh r1, [r2]
	cmp r1, #0
	beq _0804D408
	movs r3, #0xff
	lsls r3, r3, #8
	adds r0, r3, #0
	orrs r1, r0
	strh r1, [r2]
_0804D408:
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_804D3F0

	THUMB_FUNC_START sub_804D40C
sub_804D40C: @ 0x0804D40C
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r4, #0
_0804D412:
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_804D3F0
	adds r4, #1
	cmp r4, #4
	ble _0804D412
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_804D40C

	THUMB_FUNC_START sub_804D428
sub_804D428: @ 0x0804D428
	push {r4, r5, r6, lr}
	ldr r5, _0804D46C  @ gUnknown_085ADE08
	ldr r0, _0804D470  @ gUnknown_0203DDDC
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _0804D466
	bl GetGameClock
	adds r2, r0, #0
	movs r0, #0x1f
	ands r2, r0
	asrs r2, r2, #1
	movs r1, #0
	ldr r0, _0804D474  @ gPaletteBuffer
	movs r4, #0xf
	ldr r6, _0804D478  @ 0x00000322
	adds r3, r0, r6
_0804D44E:
	adds r0, r2, r1
	ands r0, r4
	lsls r0, r0, #1
	adds r0, r0, r5
	ldrh r0, [r0]
	strh r0, [r3]
	adds r3, #2
	adds r1, #1
	cmp r1, #0xe
	ble _0804D44E
	bl EnablePaletteSync
_0804D466:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0804D46C: .4byte gUnknown_085ADE08
_0804D470: .4byte gUnknown_0203DDDC
_0804D474: .4byte gPaletteBuffer
_0804D478: .4byte 0x00000322

	THUMB_FUNC_END sub_804D428

	THUMB_FUNC_START sub_804D47C
sub_804D47C: @ 0x0804D47C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r7, r0, #0
	movs r0, #0
	mov r9, r0
	movs r1, #0
	str r1, [sp, #4]
	mov sl, r1
_0804D494:
	ldr r1, [r7, #0x2c]
	ldr r2, [r7, #0x30]
	ldr r3, [sp, #4]
	adds r2, r2, r3
	movs r0, #0xf
	mov r4, r9
	ands r0, r4
	lsls r0, r0, #0xc
	movs r3, #0x80
	lsls r3, r3, #4
	adds r0, r0, r3
	str r0, [sp]
	movs r0, #4
	ldr r3, _0804D648  @ gUnknown_085AAA50
	bl PutSprite
	ldr r4, _0804D64C  @ gCosLookup
	movs r1, #0
	ldrsh r0, [r4, r1]
	lsls r0, r0, #4
	movs r1, #0x80
	lsls r1, r1, #1
	bl Div
	adds r6, r0, #0
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	ldr r2, _0804D650  @ gSinLookup
	movs r3, #0
	ldrsh r0, [r2, r3]
	negs r0, r0
	lsls r0, r0, #4
	movs r1, #0x80
	lsls r1, r1, #1
	bl Div
	adds r5, r0, #0
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	ldr r4, _0804D650  @ gSinLookup
	movs r1, #0
	ldrsh r0, [r4, r1]
	lsls r0, r0, #4
	movs r1, #0x80
	lsls r1, r1, #1
	bl Div
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	ldr r2, _0804D64C  @ gCosLookup
	movs r3, #0
	ldrsh r0, [r2, r3]
	lsls r0, r0, #4
	movs r1, #0x80
	lsls r1, r1, #1
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	mov r0, r9
	adds r1, r6, #0
	adds r2, r5, #0
	adds r3, r4, #0
	bl WriteOAMRotScaleData
	ldr r1, [r7, #0x38]
	movs r0, #1
	negs r0, r0
	cmp r1, r0
	beq _0804D5BE
	adds r3, r7, #0
	adds r3, #0x3c
	cmp r1, r9
	beq _0804D544
	mov r4, sl
	adds r1, r3, r4
	ldrh r0, [r1]
	movs r2, #0x80
	lsls r2, r2, #1
	cmp r0, r2
	bls _0804D53E
	subs r0, #8
	strh r0, [r1]
_0804D53E:
	ldr r0, [r7, #0x38]
	cmp r0, r9
	bne _0804D556
_0804D544:
	mov r4, sl
	adds r2, r3, r4
	ldrh r1, [r2]
	ldr r0, _0804D654  @ 0x0000014F
	cmp r1, r0
	bhi _0804D556
	adds r0, r1, #0
	adds r0, #8
	strh r0, [r2]
_0804D556:
	ldr r1, _0804D64C  @ gCosLookup
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #4
	add r3, sl
	mov r8, r3
	ldrh r1, [r3]
	bl Div
	adds r6, r0, #0
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	ldr r3, _0804D650  @ gSinLookup
	movs r4, #0
	ldrsh r0, [r3, r4]
	negs r0, r0
	lsls r0, r0, #4
	mov r2, r8
	ldrh r1, [r2]
	bl Div
	adds r5, r0, #0
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	ldr r3, _0804D650  @ gSinLookup
	movs r4, #0
	ldrsh r0, [r3, r4]
	lsls r0, r0, #4
	mov r2, r8
	ldrh r1, [r2]
	bl Div
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	ldr r3, _0804D64C  @ gCosLookup
	movs r1, #0
	ldrsh r0, [r3, r1]
	lsls r0, r0, #4
	mov r2, r8
	ldrh r1, [r2]
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	mov r0, r9
	adds r1, r6, #0
	adds r2, r5, #0
	adds r3, r4, #0
	bl WriteOAMRotScaleData
_0804D5BE:
	ldr r1, [r7, #0x2c]
	subs r1, #0x30
	ldr r2, [r7, #0x30]
	ldr r3, [sp, #4]
	adds r2, r2, r3
	ldr r3, _0804D658  @ gUnknown_085AABB8
	mov r4, r9
	lsls r0, r4, #2
	adds r0, r0, r3
	ldr r3, [r0]
	movs r4, #0
	str r4, [sp]
	movs r0, #4
	bl PutSprite
	ldr r0, [sp, #4]
	adds r0, #0x18
	str r0, [sp, #4]
	movs r1, #2
	add sl, r1
	movs r2, #1
	add r9, r2
	mov r3, r9
	cmp r3, #3
	bgt _0804D5F2
	b _0804D494
_0804D5F2:
	ldr r2, [r7, #0x34]
	movs r0, #1
	negs r0, r0
	cmp r2, r0
	beq _0804D636
	ldr r1, [r7, #0x2c]
	subs r1, #0x48
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #3
	ldr r2, [r7, #0x30]
	adds r2, r2, r0
	adds r2, #8
	ldr r3, _0804D65C  @ gUnknown_080DA25C
	str r4, [sp]
	movs r0, #4
	bl PutSprite
	ldr r1, [r7, #0x2c]
	subs r1, #0x48
	ldr r2, [r7, #0x34]
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #3
	ldr r2, [r7, #0x30]
	adds r2, r2, r0
	adds r2, #0x12
	ldr r3, _0804D660  @ gUnknown_080DA26A
	str r4, [sp]
	movs r0, #4
	bl PutSprite
	bl sub_804D428
_0804D636:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804D648: .4byte gUnknown_085AAA50
_0804D64C: .4byte gCosLookup
_0804D650: .4byte gSinLookup
_0804D654: .4byte 0x0000014F
_0804D658: .4byte gUnknown_085AABB8
_0804D65C: .4byte gUnknown_080DA25C
_0804D660: .4byte gUnknown_080DA26A

	THUMB_FUNC_END sub_804D47C

	THUMB_FUNC_START sub_804D664
sub_804D664: @ 0x0804D664
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r6, r0, #0
	mov r8, r1
	adds r5, r2, #0
	ldr r4, _0804D6B0  @ gUnknown_085AABC8
	adds r0, r4, #0
	bl Proc_EndEach
	adds r0, r4, #0
	adds r1, r5, #0
	bl Proc_Start
	adds r1, r0, #0
	str r6, [r1, #0x2c]
	mov r0, r8
	str r0, [r1, #0x30]
	movs r0, #1
	negs r0, r0
	str r0, [r1, #0x34]
	str r0, [r1, #0x38]
	movs r3, #0x80
	lsls r3, r3, #1
	movs r2, #3
	adds r0, r1, #0
	adds r0, #0x42
_0804D69A:
	strh r3, [r0]
	subs r0, #2
	subs r2, #1
	cmp r2, #0
	bge _0804D69A
	adds r0, r1, #0
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0804D6B0: .4byte gUnknown_085AABC8

	THUMB_FUNC_END sub_804D664

	THUMB_FUNC_START sub_804D6B4
sub_804D6B4: @ 0x0804D6B4
	push {lr}
	ldr r0, _0804D6C0  @ gUnknown_085AABC8
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
_0804D6C0: .4byte gUnknown_085AABC8

	THUMB_FUNC_END sub_804D6B4

	THUMB_FUNC_START sub_804D6C4
sub_804D6C4: @ 0x0804D6C4
	push {lr}
	ldr r0, _0804D6D0  @ gUnknown_085AABC8
	bl Proc_Find
	pop {r1}
	bx r1
	.align 2, 0
_0804D6D0: .4byte gUnknown_085AABC8

	THUMB_FUNC_END sub_804D6C4

	THUMB_FUNC_START sub_804D6D4
sub_804D6D4: @ 0x0804D6D4
	push {r4, r5, lr}
	ldr r5, _0804D718  @ gUnknown_085ADE08
	ldr r0, _0804D71C  @ gUnknown_0203DDDC
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _0804D712
	bl GetGameClock
	adds r2, r0, #0
	movs r0, #0x1f
	ands r2, r0
	asrs r2, r2, #1
	movs r1, #0
	ldr r0, _0804D720  @ gPaletteBuffer
	movs r4, #0xf
	adds r3, r0, #0
	adds r3, #0x42
_0804D6FA:
	adds r0, r2, r1
	ands r0, r4
	lsls r0, r0, #1
	adds r0, r0, r5
	ldrh r0, [r0]
	strh r0, [r3]
	adds r3, #2
	adds r1, #1
	cmp r1, #0xe
	ble _0804D6FA
	bl EnablePaletteSync
_0804D712:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0804D718: .4byte gUnknown_085ADE08
_0804D71C: .4byte gUnknown_0203DDDC
_0804D720: .4byte gPaletteBuffer

	THUMB_FUNC_END sub_804D6D4

	THUMB_FUNC_START sub_804D724
sub_804D724: @ 0x0804D724
	push {r4, r5, r6, lr}
	ldr r5, _0804D768  @ gUnknown_085ADE08
	ldr r0, _0804D76C  @ gUnknown_0203DDDC
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _0804D762
	bl GetGameClock
	adds r2, r0, #0
	movs r0, #0x1f
	ands r2, r0
	asrs r2, r2, #1
	movs r1, #0
	ldr r0, _0804D770  @ gPaletteBuffer
	movs r4, #0xf
	ldr r6, _0804D774  @ 0x00000262
	adds r3, r0, r6
_0804D74A:
	adds r0, r2, r1
	ands r0, r4
	lsls r0, r0, #1
	adds r0, r0, r5
	ldrh r0, [r0]
	strh r0, [r3]
	adds r3, #2
	adds r1, #1
	cmp r1, #0xe
	ble _0804D74A
	bl EnablePaletteSync
_0804D762:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0804D768: .4byte gUnknown_085ADE08
_0804D76C: .4byte gUnknown_0203DDDC
_0804D770: .4byte gPaletteBuffer
_0804D774: .4byte 0x00000262

	THUMB_FUNC_END sub_804D724

	THUMB_FUNC_START sub_804D778
sub_804D778: @ 0x0804D778
	push {r4, lr}
	sub sp, #4
	movs r0, #1
	movs r1, #8
	movs r2, #0xc
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	movs r4, #0
	str r4, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl sub_8001ED0
	str r4, [sp]
	movs r0, #0
	movs r1, #1
	movs r2, #1
	movs r3, #1
	bl sub_8001F0C
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_804D778

	THUMB_FUNC_START sub_804D7B0
sub_804D7B0: @ 0x0804D7B0
	push {lr}
	sub sp, #4
	adds r1, r0, #0
	ldr r2, [r1, #0x30]
	adds r0, r2, #0
	subs r0, #0x1f
	cmp r0, #0x79
	bhi _0804D7D2
	ldr r1, [r1, #0x2c]
	ldr r3, _0804D7D8  @ gUnknown_080DA27E
	movs r0, #0
	str r0, [sp]
	movs r0, #4
	bl PutSprite
	bl sub_804D724
_0804D7D2:
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_0804D7D8: .4byte gUnknown_080DA27E

	THUMB_FUNC_END sub_804D7B0

	THUMB_FUNC_START sub_804D7DC
sub_804D7DC: @ 0x0804D7DC
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r6, r0, #0
	mov r8, r1
	adds r5, r2, #0
	ldr r4, _0804D808  @ gUnknown_085AABD8
	adds r0, r4, #0
	bl Proc_EndEach
	adds r0, r4, #0
	adds r1, r5, #0
	bl Proc_Start
	str r6, [r0, #0x2c]
	mov r1, r8
	str r1, [r0, #0x30]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0804D808: .4byte gUnknown_085AABD8

	THUMB_FUNC_END sub_804D7DC

	THUMB_FUNC_START sub_804D80C
sub_804D80C: @ 0x0804D80C
	push {lr}
	ldr r0, _0804D828  @ gUnknown_08A1DD0C
	ldr r1, _0804D82C  @ 0x06016800
	bl CopyDataWithPossibleUncomp
	ldr r0, _0804D830  @ gUnknown_08A1E0D8
	movs r1, #0x90
	lsls r1, r1, #2
	movs r2, #0x20
	bl CopyToPaletteBuffer
	pop {r0}
	bx r0
	.align 2, 0
_0804D828: .4byte gUnknown_08A1DD0C
_0804D82C: .4byte 0x06016800
_0804D830: .4byte gUnknown_08A1E0D8

	THUMB_FUNC_END sub_804D80C

	THUMB_FUNC_START sub_804D834
sub_804D834: @ 0x0804D834
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r2, r1, #0
	ldr r3, _0804D854  @ gUnknown_080DA2B0
	movs r0, #0x9d
	lsls r0, r0, #6
	str r0, [sp]
	movs r0, #1
	adds r1, r4, #0
	bl PutSprite
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804D854: .4byte gUnknown_080DA2B0

	THUMB_FUNC_END sub_804D834

	THUMB_FUNC_START sub_804D858
sub_804D858: @ 0x0804D858
	push {r4, r5, lr}
	ldr r5, _0804D884  @ gActiveUnit
	ldr r0, [r5]
	lsls r1, r1, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r4, [r0]
	adds r0, r4, #0
	bl GetItemAttributes
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	beq _0804D89A
	adds r0, r4, #0
	bl GetItemMinRange
	cmp r0, #2
	ble _0804D888
	movs r0, #2
	b _0804D89C
	.align 2, 0
_0804D884: .4byte gActiveUnit
_0804D888:
	ldr r0, [r5]
	adds r1, r4, #0
	bl CanUnitUseWeapon
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0804D89A
	movs r0, #1
	b _0804D89C
_0804D89A:
	movs r0, #3
_0804D89C:
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_804D858

	THUMB_FUNC_START sub_804D8A4
sub_804D8A4: @ 0x0804D8A4
	push {lr}
	adds r0, r1, #0
	adds r0, #0x3d
	ldrb r0, [r0]
	cmp r0, #2
	beq _0804D8C0
	ldr r0, _0804D8BC  @ gUnknown_0203DD90
	adds r1, #0x3c
	ldrb r1, [r1]
	strb r1, [r0, #7]
	movs r0, #0x84
	b _0804D8C2
	.align 2, 0
_0804D8BC: .4byte gUnknown_0203DD90
_0804D8C0:
	movs r0, #8
_0804D8C2:
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_804D8A4

	THUMB_FUNC_START sub_804D8C8
sub_804D8C8: @ 0x0804D8C8
	ldr r2, _0804D8D8  @ gUnknown_0203DD90
	adds r1, #0x3c
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r2, #6]
	movs r0, #0x17
	bx lr
	.align 2, 0
_0804D8D8: .4byte gUnknown_0203DD90

	THUMB_FUNC_END sub_804D8C8

	THUMB_FUNC_START sub_804D8DC
sub_804D8DC: @ 0x0804D8DC
	push {r4, r5, r6, lr}
	adds r4, r1, #0
	ldr r0, _0804D938  @ gActiveUnit
	ldr r0, [r0]
	adds r1, #0x3c
	movs r2, #0
	ldrsb r2, [r1, r2]
	lsls r2, r2, #1
	adds r1, r0, #0
	adds r1, #0x1e
	adds r1, r1, r2
	ldrh r6, [r1]
	adds r1, r6, #0
	bl CanUnitUseWeapon
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	adds r0, r6, #0
	bl GetItemMinRange
	cmp r0, #2
	ble _0804D90A
	movs r5, #0
_0804D90A:
	adds r0, r4, #0
	adds r0, #0x34
	lsls r2, r5, #0x18
	asrs r2, r2, #0x18
	movs r1, #0x2c
	ldrsh r3, [r4, r1]
	lsls r3, r3, #5
	movs r5, #0x2a
	ldrsh r1, [r4, r5]
	adds r3, r3, r1
	lsls r3, r3, #1
	ldr r1, _0804D93C  @ gBG0TilemapBuffer
	adds r3, r3, r1
	adds r1, r6, #0
	bl DrawItemMenuLine
	movs r0, #1
	bl BG_EnableSyncByMask
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0804D938: .4byte gActiveUnit
_0804D93C: .4byte gBG0TilemapBuffer

	THUMB_FUNC_END sub_804D8DC

	THUMB_FUNC_START sub_804D940
sub_804D940: @ 0x0804D940
	ldr r1, _0804D94C  @ gUnknown_0203DD90
	movs r0, #0
	strb r0, [r1, #6]
	movs r0, #0x1b
	bx lr
	.align 2, 0
_0804D94C: .4byte gUnknown_0203DD90

	THUMB_FUNC_END sub_804D940

	THUMB_FUNC_START sub_804D950
sub_804D950: @ 0x0804D950
	push {r4, r5, r6, r7, lr}
	adds r2, r0, #0
	ldr r1, _0804D9B8  @ gUnknown_0203DD90
	movs r0, #0
	strb r0, [r1, #6]
	adds r7, r2, #0
	adds r7, #0x2d
	movs r0, #0
	ldrsb r0, [r7, r0]
	lsls r0, r0, #5
	adds r5, r2, #0
	adds r5, #0x2c
	movs r1, #0
	ldrsb r1, [r5, r1]
	adds r0, r0, r1
	lsls r0, r0, #1
	ldr r1, _0804D9BC  @ gBG0TilemapBuffer
	adds r0, r0, r1
	adds r6, r2, #0
	adds r6, #0x2e
	movs r1, #0
	ldrsb r1, [r6, r1]
	adds r4, r2, #0
	adds r4, #0x2f
	movs r2, #0
	ldrsb r2, [r4, r2]
	movs r3, #0
	bl TileMap_FillRect
	movs r0, #0
	ldrsb r0, [r7, r0]
	lsls r0, r0, #5
	movs r1, #0
	ldrsb r1, [r5, r1]
	adds r0, r0, r1
	lsls r0, r0, #1
	ldr r1, _0804D9C0  @ gBG1TilemapBuffer
	adds r0, r0, r1
	movs r1, #0
	ldrsb r1, [r6, r1]
	movs r2, #0
	ldrsb r2, [r4, r2]
	movs r3, #0
	bl TileMap_FillRect
	movs r0, #3
	bl BG_EnableSyncByMask
	movs r0, #0xb
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0804D9B8: .4byte gUnknown_0203DD90
_0804D9BC: .4byte gBG0TilemapBuffer
_0804D9C0: .4byte gBG1TilemapBuffer

	THUMB_FUNC_END sub_804D950

	THUMB_FUNC_START sub_804D9C4
sub_804D9C4: @ 0x0804D9C4
	adds r2, r0, #0
	movs r1, #0
	strb r1, [r2, #0x1e]
	strb r1, [r2, #0x18]
	strb r1, [r2, #0x1d]
	adds r3, r2, #0
	adds r3, #0x4a
	movs r0, #0xf
	strb r0, [r3]
	adds r0, r2, #0
	adds r0, #0x48
	strb r1, [r0]
	strh r1, [r2, #0x16]
	ldr r0, _0804D9F0  @ 0x04000134
	strh r1, [r0]
	ldr r2, _0804D9F4  @ 0x04000128
	ldr r3, _0804D9F8  @ 0x00002003
	adds r0, r3, #0
	strh r0, [r2]
	ldr r0, _0804D9FC  @ 0x0400012A
	strh r1, [r0]
	bx lr
	.align 2, 0
_0804D9F0: .4byte 0x04000134
_0804D9F4: .4byte 0x04000128
_0804D9F8: .4byte 0x00002003
_0804D9FC: .4byte 0x0400012A

	THUMB_FUNC_END sub_804D9C4

	THUMB_FUNC_START sub_804DA00
sub_804DA00: @ 0x0804DA00
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	adds r7, r0, #0
	bl sub_804DF24
	cmp r0, #0
	beq _0804DA16
	b _0804DDDE
_0804DA16:
	adds r0, r7, #0
	adds r0, #0x4a
	ldrb r1, [r0]
	mov sl, r0
	cmp r1, #0xf
	bls _0804DA2A
	subs r0, r1, #1
	mov r1, sl
	strb r0, [r1]
	b _0804DDDE
_0804DA2A:
	adds r1, r7, #0
	adds r1, #0x48
	ldrb r0, [r1]
	cmp r0, #0
	beq _0804DA54
	movs r0, #0
	strb r0, [r1]
	ldr r0, _0804DA50  @ 0x04000128
	ldrh r0, [r0]
	movs r5, #0xfc
	ands r5, r0
	cmp r5, #8
	beq _0804DA54
	adds r0, r7, #0
	bl sub_804D9C4
	movs r0, #8
	eors r0, r5
	b _0804DDE0
	.align 2, 0
_0804DA50: .4byte 0x04000128
_0804DA54:
	ldrb r0, [r7, #0x18]
	cmp r0, #0xdf
	bls _0804DAA6
	adds r0, r7, #0
	bl sub_804DF38
	adds r5, r0, #0
	cmp r5, #0
	beq _0804DA68
	b _0804DDE0
_0804DA68:
	adds r0, r7, #0
	adds r0, #0x4b
	ldrb r0, [r0]
	cmp r0, #1
	bne _0804DA84
	ldrb r0, [r7, #0x18]
	cmp r0, #0xe1
	bls _0804DA84
	adds r0, r7, #0
	bl sub_804DF24
	cmp r0, #0
	bne _0804DA84
	b _0804DDCE
_0804DA84:
	adds r0, r7, #0
	bl sub_804DF24
	cmp r0, #0
	beq _0804DA90
	b _0804DDDE
_0804DA90:
	ldrh r0, [r7, #0x16]
	cmp r0, #0
	bne _0804DAA0
	adds r0, r7, #0
	bl sub_804D9C4
	movs r0, #0x71
	b _0804DDE0
_0804DAA0:
	subs r0, #1
	strh r0, [r7, #0x16]
	b _0804DDDE
_0804DAA6:
	ldrb r0, [r7, #0x18]
	cmp r0, #2
	bne _0804DAAE
	b _0804DBE4
_0804DAAE:
	cmp r0, #2
	bgt _0804DABC
	cmp r0, #0
	beq _0804DACA
	cmp r0, #1
	beq _0804DB86
	b _0804DD1C
_0804DABC:
	cmp r0, #0xd0
	bne _0804DAC2
	b _0804DC30
_0804DAC2:
	cmp r0, #0xd1
	bne _0804DAC8
	b _0804DCCA
_0804DAC8:
	b _0804DD1C
_0804DACA:
	movs r3, #0xe
	movs r5, #3
	ldr r0, _0804DB10  @ 0x04000120
	ldrh r0, [r0, #6]
	adds r1, r0, #0
	ldr r0, _0804DB14  @ 0x0000FFFF
	ldrb r2, [r7, #0x1e]
	adds r6, r2, #0
	cmp r1, r0
	bne _0804DAF2
	adds r4, r1, #0
	ldr r1, _0804DB18  @ 0x04000126
_0804DAE2:
	asrs r3, r3, #1
	subs r1, #2
	subs r5, #1
	cmp r5, #0
	beq _0804DAF2
	ldrh r0, [r1]
	cmp r0, r4
	beq _0804DAE2
_0804DAF2:
	movs r0, #0xe
	ands r3, r0
	strb r3, [r7, #0x1d]
	movs r5, #3
	ldr r0, _0804DB10  @ 0x04000120
	ldrh r0, [r0, #6]
	adds r4, r0, #0
	asrs r0, r2, #3
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0804DB20
	ldr r0, _0804DB1C  @ 0x00007208
	b _0804DB46
	.align 2, 0
_0804DB10: .4byte 0x04000120
_0804DB14: .4byte 0x0000FFFF
_0804DB18: .4byte 0x04000126
_0804DB1C: .4byte 0x00007208
_0804DB20:
	subs r5, #1
	cmp r5, #0
	beq _0804DB4C
	lsls r0, r5, #1
	ldr r1, _0804DB74  @ 0x04000120
	adds r0, r0, r1
	ldrh r0, [r0]
	adds r4, r0, #0
	adds r0, r2, #0
	asrs r0, r5
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0804DB20
	adds r0, r1, #0
	lsls r0, r5
	movs r1, #0xe4
	lsls r1, r1, #7
	orrs r0, r1
_0804DB46:
	cmp r4, r0
	beq _0804DB20
	movs r3, #0
_0804DB4C:
	adds r0, r3, #0
	ands r0, r6
	strb r0, [r7, #0x1e]
	cmp r3, #0
	bne _0804DB5C
	movs r0, #0xf
	mov r2, sl
	strb r0, [r2]
_0804DB5C:
	mov r1, sl
	ldrb r0, [r1]
	cmp r0, #0
	bne _0804DB78
	ldrb r0, [r7, #0x1d]
	ldrb r2, [r7, #0x1e]
	cmp r0, r2
	beq _0804DB7E
	adds r0, r7, #0
	bl sub_804DE3C
	b _0804DB86
	.align 2, 0
_0804DB74: .4byte 0x04000120
_0804DB78:
	subs r0, #1
	mov r1, sl
	strb r0, [r1]
_0804DB7E:
	ldrb r1, [r7, #0x1e]
	movs r2, #0xc4
	lsls r2, r2, #7
	b _0804DC86
_0804DB86:
	adds r1, r7, #0
	adds r1, #0x49
	movs r0, #0
	strb r0, [r1]
	movs r5, #3
	mov ip, r1
	ldr r3, _0804DBDC  @ gUnknown_03001864
_0804DB94:
	lsls r0, r5, #1
	ldr r2, _0804DBE0  @ 0x04000120
	adds r0, r0, r2
	ldrh r0, [r0]
	adds r4, r0, #0
	asrs r0, r4, #8
	subs r2, r5, #1
	cmp r0, #0x72
	bne _0804DBBE
	lsls r0, r2, #1
	adds r0, r0, r3
	strh r4, [r0]
	movs r0, #0xff
	ands r4, r0
	movs r0, #1
	lsls r0, r5
	cmp r4, r0
	bne _0804DBBE
	ldrb r0, [r1]
	orrs r4, r0
	strb r4, [r1]
_0804DBBE:
	adds r5, r2, #0
	cmp r5, #0
	bne _0804DB94
	ldrb r0, [r7, #0x1d]
	mov r1, ip
	ldrb r1, [r1]
	cmp r0, r1
	bne _0804DB7E
	movs r0, #2
	strb r0, [r7, #0x18]
	mov r2, ip
	ldrb r1, [r2]
	movs r2, #0xc2
	lsls r2, r2, #7
	b _0804DC86
	.align 2, 0
_0804DBDC: .4byte gUnknown_03001864
_0804DBE0: .4byte 0x04000120
_0804DBE4:
	movs r5, #3
	movs r0, #0x49
	adds r0, r0, r7
	mov ip, r0
	mov r4, ip
	movs r6, #1
	ldr r1, _0804DC28  @ gUnknown_03001864
	mov r9, r1
	ldr r2, _0804DC2C  @ 0x04000120
	mov r8, r2
_0804DBF8:
	ldrb r3, [r4]
	adds r0, r3, #0
	asrs r0, r5
	ands r0, r6
	subs r2, r5, #1
	cmp r0, #0
	beq _0804DC1E
	lsls r0, r5, #1
	add r0, r8
	ldrh r1, [r0]
	lsls r0, r2, #1
	add r0, r9
	ldrh r0, [r0]
	cmp r1, r0
	beq _0804DC1E
	adds r0, r6, #0
	lsls r0, r5
	eors r3, r0
	strb r3, [r4]
_0804DC1E:
	adds r5, r2, #0
	cmp r5, #0
	bne _0804DBF8
	b _0804DD84
	.align 2, 0
_0804DC28: .4byte gUnknown_03001864
_0804DC2C: .4byte 0x04000120
_0804DC30:
	movs r3, #1
	movs r5, #3
	movs r0, #0x49
	adds r0, r0, r7
	mov ip, r0
	adds r6, r7, #0
	adds r6, #0x19
	ldr r1, _0804DC94  @ gUnknown_03001864
	mov r8, r1
_0804DC42:
	lsls r0, r5, #1
	ldr r2, _0804DC98  @ 0x04000120
	adds r0, r0, r2
	ldrh r0, [r0]
	adds r4, r0, #0
	subs r2, r5, #1
	adds r0, r6, r2
	strb r4, [r0]
	mov r0, ip
	ldrb r1, [r0]
	asrs r1, r5
	movs r0, #1
	ands r1, r0
	cmp r1, #0
	beq _0804DC76
	asrs r0, r4, #8
	subs r0, #0x72
	cmp r0, #1
	bls _0804DC6A
	b _0804DDD4
_0804DC6A:
	lsls r0, r2, #1
	add r0, r8
	ldrh r0, [r0]
	cmp r4, r0
	bne _0804DC76
	movs r3, #0
_0804DC76:
	adds r5, r2, #0
	cmp r5, #0
	bne _0804DC42
	cmp r3, #0
	bne _0804DC9C
	ldrb r1, [r7, #0x1c]
	movs r2, #0xc6
	lsls r2, r2, #7
_0804DC86:
	adds r0, r2, #0
	orrs r1, r0
	adds r0, r7, #0
	bl sub_804DDF0
	b _0804DDE0
	.align 2, 0
_0804DC94: .4byte gUnknown_03001864
_0804DC98: .4byte 0x04000120
_0804DC9C:
	movs r0, #0xd1
	strb r0, [r7, #0x18]
	movs r3, #0x11
	movs r5, #3
	adds r1, r6, #2
_0804DCA6:
	ldrb r0, [r1]
	adds r3, r3, r0
	subs r1, #1
	subs r5, #1
	cmp r5, #0
	bne _0804DCA6
	strb r3, [r7, #0x14]
	movs r0, #0xff
	ands r3, r0
	movs r1, #0xc8
	lsls r1, r1, #7
	adds r0, r1, #0
	orrs r3, r0
	adds r0, r7, #0
	adds r1, r3, #0
	bl sub_804DDF0
	b _0804DDE0
_0804DCCA:
	movs r5, #3
	movs r2, #0x49
	ldrb r1, [r2, r7]
	ldr r2, _0804DD08  @ 0x04000126
	movs r3, #1
_0804DCD4:
	ldrh r0, [r2]
	adds r4, r0, #0
	adds r0, r1, #0
	asrs r0, r5
	ands r0, r3
	cmp r0, #0
	beq _0804DCE8
	asrs r0, r4, #8
	cmp r0, #0x73
	bne _0804DDD4
_0804DCE8:
	subs r2, #2
	subs r5, #1
	cmp r5, #0
	bne _0804DCD4
	adds r0, r7, #0
	bl MultiBoot
	adds r5, r0, #0
	cmp r5, #0
	bne _0804DD0C
	movs r0, #0xe0
	strb r0, [r7, #0x18]
	adds r0, #0xb0
	strh r0, [r7, #0x16]
	b _0804DDDE
	.align 2, 0
_0804DD08: .4byte 0x04000126
_0804DD0C:
	adds r0, r7, #0
	bl sub_804D9C4
	movs r0, #0x1e
	mov r1, sl
	strb r0, [r1]
	movs r0, #0x70
	b _0804DDE0
_0804DD1C:
	movs r5, #3
	movs r2, #0x49
	adds r2, r2, r7
	mov ip, r2
	mov r8, ip
	movs r0, #1
	mov r9, r0
_0804DD2A:
	mov r1, r8
	ldrb r6, [r1]
	adds r0, r6, #0
	asrs r0, r5
	mov r2, r9
	ands r0, r2
	cmp r0, #0
	beq _0804DD64
	lsls r0, r5, #1
	ldr r1, _0804DD80  @ 0x04000120
	adds r0, r0, r1
	ldrh r0, [r0]
	adds r4, r0, #0
	asrs r2, r4, #8
	ldrb r0, [r7, #0x18]
	lsrs r0, r0, #1
	movs r1, #0x62
	subs r1, r1, r0
	mov r3, r9
	lsls r3, r5
	cmp r2, r1
	bne _0804DD5E
	movs r0, #0xff
	ands r4, r0
	cmp r4, r3
	beq _0804DD64
_0804DD5E:
	eors r6, r3
	mov r2, r8
	strb r6, [r2]
_0804DD64:
	subs r5, #1
	cmp r5, #0
	bne _0804DD2A
	ldrb r0, [r7, #0x18]
	cmp r0, #0xc4
	bne _0804DD84
	mov r0, ip
	ldrb r1, [r0]
	movs r0, #0xe
	ands r0, r1
	strb r0, [r7, #0x1e]
	strb r5, [r7, #0x18]
	b _0804DB7E
	.align 2, 0
_0804DD80: .4byte 0x04000120
_0804DD84:
	mov r1, ip
	ldrb r0, [r1]
	cmp r0, #0
	bne _0804DD96
	adds r0, r7, #0
	bl sub_804D9C4
	movs r0, #0x50
	b _0804DDE0
_0804DD96:
	ldrb r0, [r7, #0x18]
	adds r0, #2
	strb r0, [r7, #0x18]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xc4
	bne _0804DDA6
	b _0804DB7E
_0804DDA6:
	ldrb r0, [r7, #0x18]
	ldr r1, [r7, #0x28]
	adds r0, r0, r1
	subs r1, r0, #3
	ldrb r2, [r1]
	lsls r2, r2, #8
	subs r0, #4
	ldrb r1, [r0]
	orrs r1, r2
	adds r0, r7, #0
	bl sub_804DDF0
	adds r5, r0, #0
	cmp r5, #0
	bne _0804DDE0
	adds r0, r7, #0
	adds r0, #0x4b
	ldrb r0, [r0]
	cmp r0, #1
	bne _0804DDDE
_0804DDCE:
	bl sub_804E03C
	b _0804DA2A
_0804DDD4:
	adds r0, r7, #0
	bl sub_804D9C4
	movs r0, #0x60
	b _0804DDE0
_0804DDDE:
	movs r0, #0
_0804DDE0:
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_804DA00

	THUMB_FUNC_START sub_804DDF0
sub_804DDF0: @ 0x0804DDF0
	push {r4, lr}
	adds r2, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldr r3, _0804DE1C  @ 0x04000128
	ldrh r0, [r3]
	movs r4, #0x8c
	ands r4, r0
	cmp r4, #8
	bne _0804DE28
	ldr r0, _0804DE20  @ 0x0400012A
	strh r1, [r0]
	ldr r1, _0804DE24  @ 0x00002083
	adds r0, r1, #0
	strh r0, [r3]
	adds r1, r2, #0
	adds r1, #0x48
	movs r0, #1
	strb r0, [r1]
	movs r0, #0
	b _0804DE34
	.align 2, 0
_0804DE1C: .4byte 0x04000128
_0804DE20: .4byte 0x0400012A
_0804DE24: .4byte 0x00002083
_0804DE28:
	adds r0, r2, #0
	bl sub_804D9C4
	movs r0, #8
	eors r4, r0
	adds r0, r4, #0
_0804DE34:
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_804DDF0

	THUMB_FUNC_START sub_804DE3C
sub_804DE3C: @ 0x0804DE3C
	push {lr}
	adds r1, r0, #0
	ldrb r0, [r1, #0x18]
	cmp r0, #0
	beq _0804DE4E
	adds r0, r1, #0
	bl sub_804D9C4
	b _0804DE5A
_0804DE4E:
	adds r2, r1, #0
	adds r2, #0x4a
	strb r0, [r2]
	strb r0, [r1, #0x1e]
	movs r0, #1
	strb r0, [r1, #0x18]
_0804DE5A:
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_804DE3C

	THUMB_FUNC_START sub_804DE60
sub_804DE60: @ 0x0804DE60
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	ldr r0, [sp, #0x14]
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldrb r0, [r5, #0x18]
	cmp r0, #0
	bne _0804DE9A
	ldrb r0, [r5, #0x1e]
	cmp r0, #0
	beq _0804DE9A
	adds r0, r5, #0
	adds r0, #0x4a
	ldrb r0, [r0]
	cmp r0, #0
	bne _0804DE9A
	str r6, [r5, #0x20]
	adds r2, #0xf
	movs r0, #0x10
	negs r0, r0
	ands r2, r0
	subs r0, #0xf0
	adds r1, r2, r0
	ldr r0, _0804DEA4  @ 0x0003FF00
	cmp r1, r0
	bls _0804DEA8
_0804DE9A:
	adds r0, r5, #0
	bl sub_804D9C4
	b _0804DF1C
	.align 2, 0
_0804DEA4: .4byte 0x0003FF00
_0804DEA8:
	adds r0, r6, r2
	str r0, [r5, #0x24]
	lsls r1, r7, #0x18
	movs r2, #0x80
	lsls r2, r2, #0x13
	adds r0, r1, r2
	asrs r0, r0, #0x18
	adds r2, r1, #0
	cmp r0, #8
	bhi _0804DF08
	lsls r0, r0, #2
	ldr r1, _0804DEC8  @ _0804DECC
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0804DEC8: .4byte _0804DECC
_0804DECC: @ jump table
	.4byte _0804DEF0 @ case 0
	.4byte _0804DEF0 @ case 1
	.4byte _0804DEF0 @ case 2
	.4byte _0804DEF0 @ case 3
	.4byte _0804DEFA @ case 4
	.4byte _0804DF00 @ case 5
	.4byte _0804DF00 @ case 6
	.4byte _0804DF00 @ case 7
	.4byte _0804DF00 @ case 8
_0804DEF0:
	lsls r4, r3, #3
	asrs r1, r2, #0x18
	movs r0, #3
	subs r0, r0, r1
	b _0804DF06
_0804DEFA:
	movs r0, #0x38
	adds r4, r3, #0
	b _0804DF06
_0804DF00:
	lsls r4, r3, #3
	asrs r0, r2, #0x18
	subs r0, #1
_0804DF06:
	orrs r4, r0
_0804DF08:
	movs r0, #0x3f
	ands r4, r0
	lsls r0, r4, #1
	movs r2, #0x7f
	negs r2, r2
	adds r1, r2, #0
	orrs r0, r1
	strb r0, [r5, #0x1c]
	movs r0, #0xd0
	strb r0, [r5, #0x18]
_0804DF1C:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_804DE60

	THUMB_FUNC_START sub_804DF24
sub_804DF24: @ 0x0804DF24
	push {lr}
	ldrb r0, [r0, #0x18]
	cmp r0, #0xe9
	beq _0804DF30
	movs r0, #0
	b _0804DF32
_0804DF30:
	movs r0, #1
_0804DF32:
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_804DF24

	THUMB_FUNC_START sub_804DF38
sub_804DF38: @ 0x0804DF38
	push {r4, r5, r6, lr}
	adds r3, r0, #0
	ldrb r0, [r3, #0x18]
	cmp r0, #0xe0
	beq _0804DF54
	cmp r0, #0xe0
	blt _0804DF64
	cmp r0, #0xe8
	bgt _0804DF64
	cmp r0, #0xe7
	blt _0804DF64
	movs r4, #3
	ldrb r5, [r3, #0x1e]
	b _0804DFC4
_0804DF54:
	movs r1, #0
	movs r0, #0xe1
	strb r0, [r3, #0x18]
	str r1, [r3, #4]
	movs r0, #0x80
	lsls r0, r0, #0xd
	str r0, [r3]
	b _0804DFB6
_0804DF64:
	movs r4, #3
	ldrb r5, [r3, #0x1e]
	movs r6, #1
	ldr r1, _0804DFC0  @ 0x04000126
_0804DF6C:
	ldrh r0, [r1]
	adds r2, r0, #0
	adds r0, r5, #0
	asrs r0, r4
	ands r0, r6
	cmp r0, #0
	beq _0804DF80
	ldr r0, [r3, #4]
	cmp r2, r0
	bne _0804DF54
_0804DF80:
	subs r1, #2
	subs r4, #1
	cmp r4, #0
	bne _0804DF6C
	ldrb r0, [r3, #0x18]
	adds r0, #1
	strb r0, [r3, #0x18]
	ldr r1, [r3]
	ldrh r0, [r3]
	str r0, [r3, #4]
	cmp r1, #0
	bne _0804DFAE
	ldr r0, [r3, #0x28]
	adds r1, r0, #0
	adds r1, #0xac
	ldrb r1, [r1]
	adds r0, #0xad
	ldrb r0, [r0]
	lsls r0, r0, #8
	orrs r1, r0
	str r1, [r3, #4]
	lsls r1, r1, #5
	str r1, [r3]
_0804DFAE:
	ldr r0, [r3]
	lsrs r0, r0, #5
	str r0, [r3]
_0804DFB4:
	ldrh r1, [r3]
_0804DFB6:
	adds r0, r3, #0
	bl sub_804DDF0
	b _0804E01C
	.align 2, 0
_0804DFC0: .4byte 0x04000126
_0804DFC4:
	lsls r0, r4, #1
	ldr r1, _0804E00C  @ 0x04000120
	adds r0, r0, r1
	ldrh r0, [r0]
	adds r2, r0, #0
	adds r0, r5, #0
	asrs r0, r4
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0804DFE0
	ldr r0, [r3, #4]
	cmp r2, r0
	bne _0804E010
_0804DFE0:
	subs r4, #1
	cmp r4, #0
	bne _0804DFC4
	ldrb r0, [r3, #0x18]
	adds r0, #1
	strb r0, [r3, #0x18]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xe9
	beq _0804E01A
	ldr r0, [r3, #0x28]
	adds r1, r0, #0
	adds r1, #0xae
	ldrb r1, [r1]
	adds r0, #0xaf
	ldrb r0, [r0]
	lsls r0, r0, #8
	orrs r1, r0
	str r1, [r3]
	str r1, [r3, #4]
	b _0804DFB4
	.align 2, 0
_0804E00C: .4byte 0x04000120
_0804E010:
	adds r0, r3, #0
	bl sub_804D9C4
	movs r0, #0x71
	b _0804E01C
_0804E01A:
	movs r0, #0
_0804E01C:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_804DF38

	THUMB_FUNC_START sub_804E024
sub_804E024: @ 0x0804E024
	mov r2, pc
	lsrs r2, r2, #0x18
	movs r1, #0xc
	cmp r2, #2
	beq _0804E036
	movs r1, #0xd
	cmp r2, #8
	beq _0804E036
	movs r1, #4
_0804E036:
	subs r0, r0, r1
	bgt _0804E036
	bx lr

	THUMB_FUNC_END sub_804E024

	THUMB_FUNC_START sub_804E03C
sub_804E03C: @ 0x0804E03C
	push {r4, r5, lr}
	movs r2, #0
	ldr r3, _0804E070  @ 0x04000128
	ldrh r1, [r3]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0804E060
	ldr r5, _0804E074  @ 0x0000795C
	movs r4, #0x80
_0804E050:
	adds r2, #1
	cmp r2, r5
	bgt _0804E060
	ldrh r1, [r3]
	adds r0, r4, #0
	ands r0, r1
	cmp r0, #0
	bne _0804E050
_0804E060:
	movs r0, #0x96
	lsls r0, r0, #2
	bl sub_804E024
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0804E070: .4byte 0x04000128
_0804E074: .4byte 0x0000795C

	THUMB_FUNC_END sub_804E03C

.align 2, 0
