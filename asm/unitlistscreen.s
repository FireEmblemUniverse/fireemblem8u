	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	THUMB_FUNC_START sub_8092BF0
sub_8092BF0: @ 0x08092BF0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x60
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r2, r1, #0x18
	movs r1, #1
	ands r2, r1
	subs r0, #1
	cmp r0, #0x1f
	bls _08092C12
	bl _08094FE0
_08092C12:
	lsls r0, r0, #2
	ldr r1, _08092C1C  @ _08092C20
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08092C1C: .4byte _08092C20
_08092C20: @ jump table
	.4byte _08092CA0 @ case 0
	.4byte _08092F90 @ case 1
	.4byte _08092E84 @ case 2
	.4byte _08093094 @ case 3
	.4byte _08093190 @ case 4
	.4byte _0809329C @ case 5
	.4byte _080933A8 @ case 6
	.4byte _080934B4 @ case 7
	.4byte _080935C0 @ case 8
	.4byte _080936CC @ case 9
	.4byte _080937D8 @ case 10
	.4byte _080938E4 @ case 11
	.4byte _08093C58 @ case 12
	.4byte _08093D64 @ case 13
	.4byte _08093F68 @ case 14
	.4byte _0809405C @ case 15
	.4byte _08094150 @ case 16
	.4byte _08094244 @ case 17
	.4byte _080939F0 @ case 18
	.4byte _08093B4C @ case 19
	.4byte _08094374 @ case 20
	.4byte _08094480 @ case 21
	.4byte _08094608 @ case 22
	.4byte _0809470C @ case 23
	.4byte _08094808 @ case 24
	.4byte _08094904 @ case 25
	.4byte _08094A00 @ case 26
	.4byte _08094AFC @ case 27
	.4byte _08094BF8 @ case 28
	.4byte _08094CF4 @ case 29
	.4byte _08094DF0 @ case 30
	.4byte _08094EDC @ case 31
_08092CA0:
	cmp r2, #0
	bne _08092D94
	movs r0, #0
	str r0, [sp, #0x40]
	movs r1, #0
	ldr r3, _08092D8C  @ gUnknown_0200F158
	mov ip, r3
	ldrb r0, [r3]
	subs r0, #1
	cmp r2, r0
	bge _08092D16
	adds r7, r3, #0
	mov sl, r7
_08092CBA:
	movs r3, #0
	mov r2, sl
	ldrb r0, [r2]
	adds r1, #1
	subs r0, r0, r1
	mov r8, r1
	cmp r3, r0
	bge _08092D06
	ldr r7, _08092D90  @ gUnknown_0200D6E0
	mov r9, r7
_08092CCE:
	adds r7, r3, #1
	lsls r0, r7, #2
	mov r1, r9
	adds r6, r0, r1
	ldr r5, [r6]
	ldr r0, [r5]
	ldr r2, [r0]
	lsls r0, r3, #2
	adds r4, r0, r1
	ldr r3, [r4]
	ldr r0, [r3]
	ldr r1, [r0]
	ldrb r0, [r2, #0xa]
	ldrb r1, [r1, #0xa]
	cmp r0, r1
	bcs _08092CF6
	str r5, [r4]
	str r3, [r6]
	movs r2, #1
	str r2, [sp, #0x40]
_08092CF6:
	lsls r0, r7, #0x18
	lsrs r3, r0, #0x18
	mov r7, sl
	ldrb r0, [r7]
	mov r1, r8
	subs r0, r0, r1
	cmp r3, r0
	blt _08092CCE
_08092D06:
	mov r2, r8
	lsls r0, r2, #0x18
	lsrs r1, r0, #0x18
	mov r3, ip
	ldrb r0, [r3]
	subs r0, #1
	cmp r1, r0
	blt _08092CBA
_08092D16:
	movs r1, #0
	ldr r7, _08092D8C  @ gUnknown_0200F158
	ldrb r0, [r7]
	subs r0, #1
	cmp r1, r0
	bge _08092D86
	mov sl, r7
_08092D24:
	movs r3, #0
	mov r2, sl
	ldrb r0, [r2]
	adds r1, #1
	subs r0, r0, r1
	mov r8, r1
	cmp r3, r0
	bge _08092D76
	ldr r7, _08092D90  @ gUnknown_0200D6E0
	mov r9, r7
	movs r7, #2
	mov ip, r8
_08092D3C:
	adds r6, r3, #1
	lsls r0, r6, #2
	mov r1, r9
	adds r5, r0, r1
	ldr r4, [r5]
	ldr r0, [r4]
	ldr r1, [r0, #0xc]
	ands r1, r7
	lsls r0, r3, #2
	mov r2, r9
	adds r3, r0, r2
	ldr r2, [r3]
	ldr r0, [r2]
	ldr r0, [r0, #0xc]
	ands r0, r7
	cmp r1, r0
	bcs _08092D66
	str r4, [r3]
	str r2, [r5]
	movs r3, #1
	str r3, [sp, #0x40]
_08092D66:
	lsls r0, r6, #0x18
	lsrs r3, r0, #0x18
	mov r1, sl
	ldrb r0, [r1]
	mov r2, ip
	subs r0, r0, r2
	cmp r3, r0
	blt _08092D3C
_08092D76:
	mov r3, r8
	lsls r0, r3, #0x18
	lsrs r1, r0, #0x18
	ldr r7, _08092D8C  @ gUnknown_0200F158
	ldrb r0, [r7]
	subs r0, #1
	cmp r1, r0
	blt _08092D24
_08092D86:
	ldr r0, [sp, #0x40]
	bl _080945F2
	.align 2, 0
_08092D8C: .4byte gUnknown_0200F158
_08092D90: .4byte gUnknown_0200D6E0
_08092D94:
	movs r1, #0
	str r1, [sp, #0x44]
	ldr r2, _08092E7C  @ gUnknown_0200F158
	mov ip, r2
	ldrb r0, [r2]
	subs r0, #1
	adds r3, r1, #0
	cmp r3, r0
	bge _08092E06
	adds r7, r2, #0
	mov sl, r7
_08092DAA:
	movs r3, #0
	mov r2, sl
	ldrb r0, [r2]
	adds r1, #1
	subs r0, r0, r1
	mov r8, r1
	cmp r3, r0
	bge _08092DF6
	ldr r7, _08092E80  @ gUnknown_0200D6E0
	mov r9, r7
_08092DBE:
	adds r7, r3, #1
	lsls r0, r7, #2
	mov r1, r9
	adds r6, r0, r1
	ldr r5, [r6]
	ldr r0, [r5]
	ldr r2, [r0]
	lsls r0, r3, #2
	adds r4, r0, r1
	ldr r3, [r4]
	ldr r0, [r3]
	ldr r1, [r0]
	ldrb r0, [r2, #0xa]
	ldrb r1, [r1, #0xa]
	cmp r0, r1
	bls _08092DE6
	str r5, [r4]
	str r3, [r6]
	movs r2, #1
	str r2, [sp, #0x44]
_08092DE6:
	lsls r0, r7, #0x18
	lsrs r3, r0, #0x18
	mov r7, sl
	ldrb r0, [r7]
	mov r1, r8
	subs r0, r0, r1
	cmp r3, r0
	blt _08092DBE
_08092DF6:
	mov r2, r8
	lsls r0, r2, #0x18
	lsrs r1, r0, #0x18
	mov r3, ip
	ldrb r0, [r3]
	subs r0, #1
	cmp r1, r0
	blt _08092DAA
_08092E06:
	movs r1, #0
	ldr r7, _08092E7C  @ gUnknown_0200F158
	ldrb r0, [r7]
	subs r0, #1
	cmp r1, r0
	bge _08092E76
	mov sl, r7
_08092E14:
	movs r3, #0
	mov r2, sl
	ldrb r0, [r2]
	adds r1, #1
	subs r0, r0, r1
	mov r8, r1
	cmp r3, r0
	bge _08092E66
	ldr r7, _08092E80  @ gUnknown_0200D6E0
	mov r9, r7
	movs r7, #2
	mov ip, r8
_08092E2C:
	adds r6, r3, #1
	lsls r0, r6, #2
	mov r1, r9
	adds r5, r0, r1
	ldr r4, [r5]
	ldr r0, [r4]
	ldr r1, [r0, #0xc]
	ands r1, r7
	lsls r0, r3, #2
	mov r2, r9
	adds r3, r0, r2
	ldr r2, [r3]
	ldr r0, [r2]
	ldr r0, [r0, #0xc]
	ands r0, r7
	cmp r1, r0
	bls _08092E56
	str r4, [r3]
	str r2, [r5]
	movs r3, #1
	str r3, [sp, #0x44]
_08092E56:
	lsls r0, r6, #0x18
	lsrs r3, r0, #0x18
	mov r1, sl
	ldrb r0, [r1]
	mov r2, ip
	subs r0, r0, r2
	cmp r3, r0
	blt _08092E2C
_08092E66:
	mov r3, r8
	lsls r0, r3, #0x18
	lsrs r1, r0, #0x18
	ldr r7, _08092E7C  @ gUnknown_0200F158
	ldrb r0, [r7]
	subs r0, #1
	cmp r1, r0
	blt _08092E14
_08092E76:
	ldr r0, [sp, #0x44]
	bl _080945F2
	.align 2, 0
_08092E7C: .4byte gUnknown_0200F158
_08092E80: .4byte gUnknown_0200D6E0
_08092E84:
	cmp r2, #0
	bne _08092F0C
	movs r1, #0
	mov sl, r1
	ldr r3, _08092F04  @ gUnknown_0200F158
	mov ip, r3
	ldrb r0, [r3]
	subs r0, #1
	cmp r2, r0
	blt _08092E9C
	bl _08094EC8
_08092E9C:
	adds r7, r3, #0
	mov r9, r7
_08092EA0:
	movs r2, #0
	mov r3, r9
	ldrb r0, [r3]
	adds r1, #1
	subs r0, r0, r1
	adds r7, r1, #0
	cmp r2, r0
	bge _08092EF0
	ldr r0, _08092F08  @ gUnknown_0200D6E0
	mov r8, r0
_08092EB4:
	adds r6, r2, #1
	lsls r0, r6, #2
	mov r1, r8
	adds r5, r0, r1
	ldr r4, [r5]
	ldr r1, [r4]
	lsls r0, r2, #2
	mov r3, r8
	adds r2, r0, r3
	ldr r3, [r2]
	ldr r0, [r3]
	ldrb r1, [r1, #8]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	ldrb r0, [r0, #8]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r1, r0
	ble _08092EE2
	str r4, [r2]
	str r3, [r5]
	movs r0, #1
	mov sl, r0
_08092EE2:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r1, r9
	ldrb r0, [r1]
	subs r0, r0, r7
	cmp r2, r0
	blt _08092EB4
_08092EF0:
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	mov r2, ip
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt _08092EA0
	bl _08094EC8
	.align 2, 0
_08092F04: .4byte gUnknown_0200F158
_08092F08: .4byte gUnknown_0200D6E0
_08092F0C:
	movs r7, #0
	mov sl, r7
	movs r1, #0
	ldr r0, _08092F88  @ gUnknown_0200F158
	mov ip, r0
	ldrb r0, [r0]
	subs r0, #1
	cmp sl, r0
	blt _08092F22
	bl _08094EC8
_08092F22:
	ldr r2, _08092F88  @ gUnknown_0200F158
	mov r9, r2
_08092F26:
	movs r2, #0
	mov r3, r9
	ldrb r0, [r3]
	adds r1, #1
	subs r0, r0, r1
	adds r7, r1, #0
	cmp r2, r0
	bge _08092F76
	ldr r0, _08092F8C  @ gUnknown_0200D6E0
	mov r8, r0
_08092F3A:
	adds r6, r2, #1
	lsls r0, r6, #2
	mov r1, r8
	adds r5, r0, r1
	ldr r4, [r5]
	ldr r1, [r4]
	lsls r0, r2, #2
	mov r3, r8
	adds r2, r0, r3
	ldr r3, [r2]
	ldr r0, [r3]
	ldrb r1, [r1, #8]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	ldrb r0, [r0, #8]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r1, r0
	bge _08092F68
	str r4, [r2]
	str r3, [r5]
	movs r0, #1
	mov sl, r0
_08092F68:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r1, r9
	ldrb r0, [r1]
	subs r0, r0, r7
	cmp r2, r0
	blt _08092F3A
_08092F76:
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	mov r2, ip
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt _08092F26
	bl _08094EC8
	.align 2, 0
_08092F88: .4byte gUnknown_0200F158
_08092F8C: .4byte gUnknown_0200D6E0
_08092F90:
	cmp r2, #0
	bne _08093014
	movs r7, #0
	mov ip, r7
	movs r1, #0
	ldr r3, _0809300C  @ gUnknown_0200F158
	ldrb r0, [r3]
	subs r0, #1
	cmp r2, r0
	blt _08092FA8
	bl _0809435C
_08092FA8:
	adds r7, r3, #0
	mov sl, r7
_08092FAC:
	movs r3, #0
	mov r2, sl
	ldrb r0, [r2]
	adds r1, #1
	subs r0, r0, r1
	mov r8, r1
	cmp r3, r0
	bge _08092FF8
	ldr r7, _08093010  @ gUnknown_0200D6E0
	mov r9, r7
_08092FC0:
	adds r7, r3, #1
	lsls r0, r7, #2
	mov r1, r9
	adds r6, r0, r1
	ldr r5, [r6]
	ldr r0, [r5]
	ldr r2, [r0, #4]
	lsls r0, r3, #2
	adds r3, r0, r1
	ldr r4, [r3]
	ldr r0, [r4]
	ldr r1, [r0, #4]
	ldrb r0, [r2, #0xa]
	ldrb r1, [r1, #0xa]
	cmp r0, r1
	bcs _08092FE8
	str r5, [r3]
	str r4, [r6]
	movs r2, #1
	mov ip, r2
_08092FE8:
	lsls r0, r7, #0x18
	lsrs r3, r0, #0x18
	mov r7, sl
	ldrb r0, [r7]
	mov r1, r8
	subs r0, r0, r1
	cmp r3, r0
	blt _08092FC0
_08092FF8:
	mov r2, r8
	lsls r0, r2, #0x18
	lsrs r1, r0, #0x18
	ldr r3, _0809300C  @ gUnknown_0200F158
	ldrb r0, [r3]
	subs r0, #1
	cmp r1, r0
	blt _08092FAC
	bl _0809435C
	.align 2, 0
_0809300C: .4byte gUnknown_0200F158
_08093010: .4byte gUnknown_0200D6E0
_08093014:
	movs r0, #0
	mov ip, r0
	movs r1, #0
	ldr r2, _0809308C  @ gUnknown_0200F158
	ldrb r0, [r2]
	subs r0, #1
	cmp ip, r0
	blt _08093028
	bl _0809435C
_08093028:
	adds r3, r2, #0
	mov sl, r3
_0809302C:
	movs r3, #0
	mov r7, sl
	ldrb r0, [r7]
	adds r1, #1
	subs r0, r0, r1
	mov r8, r1
	cmp r3, r0
	bge _08093078
	ldr r0, _08093090  @ gUnknown_0200D6E0
	mov r9, r0
_08093040:
	adds r7, r3, #1
	lsls r0, r7, #2
	mov r1, r9
	adds r6, r0, r1
	ldr r5, [r6]
	ldr r0, [r5]
	ldr r2, [r0, #4]
	lsls r0, r3, #2
	adds r3, r0, r1
	ldr r4, [r3]
	ldr r0, [r4]
	ldr r1, [r0, #4]
	ldrb r0, [r2, #0xa]
	ldrb r1, [r1, #0xa]
	cmp r0, r1
	bls _08093068
	str r5, [r3]
	str r4, [r6]
	movs r2, #1
	mov ip, r2
_08093068:
	lsls r0, r7, #0x18
	lsrs r3, r0, #0x18
	mov r7, sl
	ldrb r0, [r7]
	mov r1, r8
	subs r0, r0, r1
	cmp r3, r0
	blt _08093040
_08093078:
	mov r2, r8
	lsls r0, r2, #0x18
	lsrs r1, r0, #0x18
	ldr r3, _0809308C  @ gUnknown_0200F158
	ldrb r0, [r3]
	subs r0, #1
	cmp r1, r0
	blt _0809302C
	bl _0809435C
	.align 2, 0
_0809308C: .4byte gUnknown_0200F158
_08093090: .4byte gUnknown_0200D6E0
_08093094:
	cmp r2, #0
	bne _08093114
	movs r0, #0
	mov ip, r0
	movs r1, #0
	ldr r3, _0809310C  @ gUnknown_0200F158
	ldrb r0, [r3]
	subs r0, #1
	cmp r2, r0
	blt _080930AC
	bl _0809435C
_080930AC:
	adds r7, r3, #0
	mov sl, r7
_080930B0:
	movs r3, #0
	mov r2, sl
	ldrb r0, [r2]
	adds r1, #1
	subs r0, r0, r1
	mov r8, r1
	cmp r3, r0
	bge _080930F8
	ldr r7, _08093110  @ gUnknown_0200D6E0
	mov r9, r7
_080930C4:
	adds r7, r3, #1
	lsls r0, r7, #2
	mov r1, r9
	adds r6, r0, r1
	ldr r5, [r6]
	ldr r2, [r5]
	lsls r0, r3, #2
	adds r3, r0, r1
	ldr r4, [r3]
	ldr r1, [r4]
	ldrb r0, [r2, #9]
	ldrb r1, [r1, #9]
	cmp r0, r1
	bls _080930E8
	str r5, [r3]
	str r4, [r6]
	movs r2, #1
	mov ip, r2
_080930E8:
	lsls r0, r7, #0x18
	lsrs r3, r0, #0x18
	mov r7, sl
	ldrb r0, [r7]
	mov r1, r8
	subs r0, r0, r1
	cmp r3, r0
	blt _080930C4
_080930F8:
	mov r2, r8
	lsls r0, r2, #0x18
	lsrs r1, r0, #0x18
	ldr r3, _0809310C  @ gUnknown_0200F158
	ldrb r0, [r3]
	subs r0, #1
	cmp r1, r0
	blt _080930B0
	bl _0809435C
	.align 2, 0
_0809310C: .4byte gUnknown_0200F158
_08093110: .4byte gUnknown_0200D6E0
_08093114:
	movs r0, #0
	mov ip, r0
	movs r1, #0
	ldr r2, _08093188  @ gUnknown_0200F158
	ldrb r0, [r2]
	subs r0, #1
	cmp ip, r0
	blt _08093128
	bl _0809435C
_08093128:
	adds r3, r2, #0
	mov sl, r3
_0809312C:
	movs r3, #0
	mov r7, sl
	ldrb r0, [r7]
	adds r1, #1
	subs r0, r0, r1
	mov r8, r1
	cmp r3, r0
	bge _08093174
	ldr r0, _0809318C  @ gUnknown_0200D6E0
	mov r9, r0
_08093140:
	adds r7, r3, #1
	lsls r0, r7, #2
	mov r1, r9
	adds r6, r0, r1
	ldr r5, [r6]
	ldr r2, [r5]
	lsls r0, r3, #2
	adds r3, r0, r1
	ldr r4, [r3]
	ldr r1, [r4]
	ldrb r0, [r2, #9]
	ldrb r1, [r1, #9]
	cmp r0, r1
	bcs _08093164
	str r5, [r3]
	str r4, [r6]
	movs r2, #1
	mov ip, r2
_08093164:
	lsls r0, r7, #0x18
	lsrs r3, r0, #0x18
	mov r7, sl
	ldrb r0, [r7]
	mov r1, r8
	subs r0, r0, r1
	cmp r3, r0
	blt _08093140
_08093174:
	mov r2, r8
	lsls r0, r2, #0x18
	lsrs r1, r0, #0x18
	ldr r3, _08093188  @ gUnknown_0200F158
	ldrb r0, [r3]
	subs r0, #1
	cmp r1, r0
	blt _0809312C
	bl _0809435C
	.align 2, 0
_08093188: .4byte gUnknown_0200F158
_0809318C: .4byte gUnknown_0200D6E0
_08093190:
	cmp r2, #0
	bne _08093218
	movs r0, #0
	mov sl, r0
	movs r1, #0
	ldr r3, _08093210  @ gUnknown_0200F158
	ldrb r0, [r3]
	subs r0, #1
	cmp r2, r0
	blt _080931A8
	bl _08094EC8
_080931A8:
	movs r5, #0
	ldrb r0, [r3]
	adds r1, #1
	subs r0, r0, r1
	mov r8, r1
	cmp r5, r0
	bge _080931FA
	ldr r1, _08093214  @ gUnknown_0200D6E0
	mov r9, r1
_080931BA:
	adds r7, r5, #1
	lsls r0, r7, #2
	mov r2, r9
	adds r6, r0, r2
	ldr r0, [r6]
	ldr r0, [r0]
	bl GetUnitCurrentHp
	adds r4, r0, #0
	lsls r0, r5, #2
	mov r3, r9
	adds r5, r0, r3
	ldr r0, [r5]
	ldr r0, [r0]
	bl GetUnitCurrentHp
	cmp r4, r0
	ble _080931EA
	ldr r1, [r5]
	ldr r0, [r6]
	str r0, [r5]
	str r1, [r6]
	movs r0, #1
	mov sl, r0
_080931EA:
	lsls r0, r7, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _08093210  @ gUnknown_0200F158
	ldrb r0, [r0]
	mov r1, r8
	subs r0, r0, r1
	cmp r5, r0
	blt _080931BA
_080931FA:
	mov r2, r8
	lsls r0, r2, #0x18
	lsrs r1, r0, #0x18
	ldr r3, _08093210  @ gUnknown_0200F158
	ldrb r0, [r3]
	subs r0, #1
	cmp r1, r0
	blt _080931A8
	bl _08094EC8
	.align 2, 0
_08093210: .4byte gUnknown_0200F158
_08093214: .4byte gUnknown_0200D6E0
_08093218:
	movs r7, #0
	mov sl, r7
	movs r1, #0
	ldr r2, _08093294  @ gUnknown_0200F158
	ldrb r0, [r2]
	subs r0, #1
	cmp sl, r0
	blt _0809322C
	bl _08094FCE
_0809322C:
	movs r5, #0
	ldrb r0, [r2]
	adds r1, #1
	subs r0, r0, r1
	mov r8, r1
	cmp r5, r0
	bge _0809327E
	ldr r0, _08093298  @ gUnknown_0200D6E0
	mov r9, r0
_0809323E:
	adds r7, r5, #1
	lsls r0, r7, #2
	mov r1, r9
	adds r6, r0, r1
	ldr r0, [r6]
	ldr r0, [r0]
	bl GetUnitCurrentHp
	adds r4, r0, #0
	lsls r0, r5, #2
	mov r2, r9
	adds r5, r0, r2
	ldr r0, [r5]
	ldr r0, [r0]
	bl GetUnitCurrentHp
	cmp r4, r0
	bge _0809326E
	ldr r1, [r5]
	ldr r0, [r6]
	str r0, [r5]
	str r1, [r6]
	movs r3, #1
	mov sl, r3
_0809326E:
	lsls r0, r7, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _08093294  @ gUnknown_0200F158
	ldrb r0, [r0]
	mov r7, r8
	subs r0, r0, r7
	cmp r5, r0
	blt _0809323E
_0809327E:
	mov r1, r8
	lsls r0, r1, #0x18
	lsrs r1, r0, #0x18
	ldr r2, _08093294  @ gUnknown_0200F158
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt _0809322C
	bl _08094FCE
	.align 2, 0
_08093294: .4byte gUnknown_0200F158
_08093298: .4byte gUnknown_0200D6E0
_0809329C:
	cmp r2, #0
	bne _08093324
	movs r3, #0
	mov sl, r3
	movs r1, #0
	ldr r3, _0809331C  @ gUnknown_0200F158
	ldrb r0, [r3]
	subs r0, #1
	cmp r2, r0
	blt _080932B4
	bl _08094FCE
_080932B4:
	movs r5, #0
	ldrb r0, [r3]
	adds r1, #1
	subs r0, r0, r1
	mov r8, r1
	cmp r5, r0
	bge _08093306
	ldr r7, _08093320  @ gUnknown_0200D6E0
	mov r9, r7
_080932C6:
	adds r7, r5, #1
	lsls r0, r7, #2
	mov r1, r9
	adds r6, r0, r1
	ldr r0, [r6]
	ldr r0, [r0]
	bl GetUnitMaxHp
	adds r4, r0, #0
	lsls r0, r5, #2
	mov r2, r9
	adds r5, r0, r2
	ldr r0, [r5]
	ldr r0, [r0]
	bl GetUnitMaxHp
	cmp r4, r0
	ble _080932F6
	ldr r1, [r5]
	ldr r0, [r6]
	str r0, [r5]
	str r1, [r6]
	movs r3, #1
	mov sl, r3
_080932F6:
	lsls r0, r7, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _0809331C  @ gUnknown_0200F158
	ldrb r0, [r0]
	mov r7, r8
	subs r0, r0, r7
	cmp r5, r0
	blt _080932C6
_08093306:
	mov r1, r8
	lsls r0, r1, #0x18
	lsrs r1, r0, #0x18
	ldr r3, _0809331C  @ gUnknown_0200F158
	ldrb r0, [r3]
	subs r0, #1
	cmp r1, r0
	blt _080932B4
	bl _08094FCE
	.align 2, 0
_0809331C: .4byte gUnknown_0200F158
_08093320: .4byte gUnknown_0200D6E0
_08093324:
	movs r3, #0
	mov sl, r3
	movs r1, #0
	ldr r2, _080933A0  @ gUnknown_0200F158
	ldrb r0, [r2]
	subs r0, #1
	cmp sl, r0
	blt _08093338
	bl _08094FCE
_08093338:
	movs r5, #0
	ldrb r0, [r2]
	adds r1, #1
	subs r0, r0, r1
	mov r8, r1
	cmp r5, r0
	bge _0809338A
	ldr r7, _080933A4  @ gUnknown_0200D6E0
	mov r9, r7
_0809334A:
	adds r7, r5, #1
	lsls r0, r7, #2
	mov r1, r9
	adds r6, r0, r1
	ldr r0, [r6]
	ldr r0, [r0]
	bl GetUnitMaxHp
	adds r4, r0, #0
	lsls r0, r5, #2
	mov r2, r9
	adds r5, r0, r2
	ldr r0, [r5]
	ldr r0, [r0]
	bl GetUnitMaxHp
	cmp r4, r0
	bge _0809337A
	ldr r1, [r5]
	ldr r0, [r6]
	str r0, [r5]
	str r1, [r6]
	movs r3, #1
	mov sl, r3
_0809337A:
	lsls r0, r7, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _080933A0  @ gUnknown_0200F158
	ldrb r0, [r0]
	mov r7, r8
	subs r0, r0, r7
	cmp r5, r0
	blt _0809334A
_0809338A:
	mov r1, r8
	lsls r0, r1, #0x18
	lsrs r1, r0, #0x18
	ldr r2, _080933A0  @ gUnknown_0200F158
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt _08093338
	bl _08094FCE
	.align 2, 0
_080933A0: .4byte gUnknown_0200F158
_080933A4: .4byte gUnknown_0200D6E0
_080933A8:
	cmp r2, #0
	bne _08093430
	movs r3, #0
	mov sl, r3
	movs r1, #0
	ldr r3, _08093428  @ gUnknown_0200F158
	ldrb r0, [r3]
	subs r0, #1
	cmp r2, r0
	blt _080933C0
	bl _08094FCE
_080933C0:
	movs r5, #0
	ldrb r0, [r3]
	adds r1, #1
	subs r0, r0, r1
	mov r8, r1
	cmp r5, r0
	bge _08093412
	ldr r7, _0809342C  @ gUnknown_0200D6E0
	mov r9, r7
_080933D2:
	adds r7, r5, #1
	lsls r0, r7, #2
	mov r1, r9
	adds r6, r0, r1
	ldr r0, [r6]
	ldr r0, [r0]
	bl GetUnitPower
	adds r4, r0, #0
	lsls r0, r5, #2
	mov r2, r9
	adds r5, r0, r2
	ldr r0, [r5]
	ldr r0, [r0]
	bl GetUnitPower
	cmp r4, r0
	ble _08093402
	ldr r1, [r5]
	ldr r0, [r6]
	str r0, [r5]
	str r1, [r6]
	movs r3, #1
	mov sl, r3
_08093402:
	lsls r0, r7, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _08093428  @ gUnknown_0200F158
	ldrb r0, [r0]
	mov r7, r8
	subs r0, r0, r7
	cmp r5, r0
	blt _080933D2
_08093412:
	mov r1, r8
	lsls r0, r1, #0x18
	lsrs r1, r0, #0x18
	ldr r3, _08093428  @ gUnknown_0200F158
	ldrb r0, [r3]
	subs r0, #1
	cmp r1, r0
	blt _080933C0
	bl _08094FCE
	.align 2, 0
_08093428: .4byte gUnknown_0200F158
_0809342C: .4byte gUnknown_0200D6E0
_08093430:
	movs r3, #0
	mov sl, r3
	movs r1, #0
	ldr r2, _080934AC  @ gUnknown_0200F158
	ldrb r0, [r2]
	subs r0, #1
	cmp sl, r0
	blt _08093444
	bl _08094FCE
_08093444:
	movs r5, #0
	ldrb r0, [r2]
	adds r1, #1
	subs r0, r0, r1
	mov r8, r1
	cmp r5, r0
	bge _08093496
	ldr r7, _080934B0  @ gUnknown_0200D6E0
	mov r9, r7
_08093456:
	adds r7, r5, #1
	lsls r0, r7, #2
	mov r1, r9
	adds r6, r0, r1
	ldr r0, [r6]
	ldr r0, [r0]
	bl GetUnitPower
	adds r4, r0, #0
	lsls r0, r5, #2
	mov r2, r9
	adds r5, r0, r2
	ldr r0, [r5]
	ldr r0, [r0]
	bl GetUnitPower
	cmp r4, r0
	bge _08093486
	ldr r1, [r5]
	ldr r0, [r6]
	str r0, [r5]
	str r1, [r6]
	movs r3, #1
	mov sl, r3
_08093486:
	lsls r0, r7, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _080934AC  @ gUnknown_0200F158
	ldrb r0, [r0]
	mov r7, r8
	subs r0, r0, r7
	cmp r5, r0
	blt _08093456
_08093496:
	mov r1, r8
	lsls r0, r1, #0x18
	lsrs r1, r0, #0x18
	ldr r2, _080934AC  @ gUnknown_0200F158
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt _08093444
	bl _08094FCE
	.align 2, 0
_080934AC: .4byte gUnknown_0200F158
_080934B0: .4byte gUnknown_0200D6E0
_080934B4:
	cmp r2, #0
	bne _0809353C
	movs r3, #0
	mov sl, r3
	movs r1, #0
	ldr r3, _08093534  @ gUnknown_0200F158
	ldrb r0, [r3]
	subs r0, #1
	cmp r2, r0
	blt _080934CC
	bl _08094FCE
_080934CC:
	movs r5, #0
	ldrb r0, [r3]
	adds r1, #1
	subs r0, r0, r1
	mov r8, r1
	cmp r5, r0
	bge _0809351E
	ldr r7, _08093538  @ gUnknown_0200D6E0
	mov r9, r7
_080934DE:
	adds r7, r5, #1
	lsls r0, r7, #2
	mov r1, r9
	adds r6, r0, r1
	ldr r0, [r6]
	ldr r0, [r0]
	bl GetUnitSkill
	adds r4, r0, #0
	lsls r0, r5, #2
	mov r2, r9
	adds r5, r0, r2
	ldr r0, [r5]
	ldr r0, [r0]
	bl GetUnitSkill
	cmp r4, r0
	ble _0809350E
	ldr r1, [r5]
	ldr r0, [r6]
	str r0, [r5]
	str r1, [r6]
	movs r3, #1
	mov sl, r3
_0809350E:
	lsls r0, r7, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _08093534  @ gUnknown_0200F158
	ldrb r0, [r0]
	mov r7, r8
	subs r0, r0, r7
	cmp r5, r0
	blt _080934DE
_0809351E:
	mov r1, r8
	lsls r0, r1, #0x18
	lsrs r1, r0, #0x18
	ldr r3, _08093534  @ gUnknown_0200F158
	ldrb r0, [r3]
	subs r0, #1
	cmp r1, r0
	blt _080934CC
	bl _08094FCE
	.align 2, 0
_08093534: .4byte gUnknown_0200F158
_08093538: .4byte gUnknown_0200D6E0
_0809353C:
	movs r3, #0
	mov sl, r3
	movs r1, #0
	ldr r2, _080935B8  @ gUnknown_0200F158
	ldrb r0, [r2]
	subs r0, #1
	cmp sl, r0
	blt _08093550
	bl _08094FCE
_08093550:
	movs r5, #0
	ldrb r0, [r2]
	adds r1, #1
	subs r0, r0, r1
	mov r8, r1
	cmp r5, r0
	bge _080935A2
	ldr r7, _080935BC  @ gUnknown_0200D6E0
	mov r9, r7
_08093562:
	adds r7, r5, #1
	lsls r0, r7, #2
	mov r1, r9
	adds r6, r0, r1
	ldr r0, [r6]
	ldr r0, [r0]
	bl GetUnitSkill
	adds r4, r0, #0
	lsls r0, r5, #2
	mov r2, r9
	adds r5, r0, r2
	ldr r0, [r5]
	ldr r0, [r0]
	bl GetUnitSkill
	cmp r4, r0
	bge _08093592
	ldr r1, [r5]
	ldr r0, [r6]
	str r0, [r5]
	str r1, [r6]
	movs r3, #1
	mov sl, r3
_08093592:
	lsls r0, r7, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _080935B8  @ gUnknown_0200F158
	ldrb r0, [r0]
	mov r7, r8
	subs r0, r0, r7
	cmp r5, r0
	blt _08093562
_080935A2:
	mov r1, r8
	lsls r0, r1, #0x18
	lsrs r1, r0, #0x18
	ldr r2, _080935B8  @ gUnknown_0200F158
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt _08093550
	bl _08094FCE
	.align 2, 0
_080935B8: .4byte gUnknown_0200F158
_080935BC: .4byte gUnknown_0200D6E0
_080935C0:
	cmp r2, #0
	bne _08093648
	movs r3, #0
	mov sl, r3
	movs r1, #0
	ldr r3, _08093640  @ gUnknown_0200F158
	ldrb r0, [r3]
	subs r0, #1
	cmp r2, r0
	blt _080935D8
	bl _08094FCE
_080935D8:
	movs r5, #0
	ldrb r0, [r3]
	adds r1, #1
	subs r0, r0, r1
	mov r8, r1
	cmp r5, r0
	bge _0809362A
	ldr r7, _08093644  @ gUnknown_0200D6E0
	mov r9, r7
_080935EA:
	adds r7, r5, #1
	lsls r0, r7, #2
	mov r1, r9
	adds r6, r0, r1
	ldr r0, [r6]
	ldr r0, [r0]
	bl GetUnitSpeed
	adds r4, r0, #0
	lsls r0, r5, #2
	mov r2, r9
	adds r5, r0, r2
	ldr r0, [r5]
	ldr r0, [r0]
	bl GetUnitSpeed
	cmp r4, r0
	ble _0809361A
	ldr r1, [r5]
	ldr r0, [r6]
	str r0, [r5]
	str r1, [r6]
	movs r3, #1
	mov sl, r3
_0809361A:
	lsls r0, r7, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _08093640  @ gUnknown_0200F158
	ldrb r0, [r0]
	mov r7, r8
	subs r0, r0, r7
	cmp r5, r0
	blt _080935EA
_0809362A:
	mov r1, r8
	lsls r0, r1, #0x18
	lsrs r1, r0, #0x18
	ldr r3, _08093640  @ gUnknown_0200F158
	ldrb r0, [r3]
	subs r0, #1
	cmp r1, r0
	blt _080935D8
	bl _08094FCE
	.align 2, 0
_08093640: .4byte gUnknown_0200F158
_08093644: .4byte gUnknown_0200D6E0
_08093648:
	movs r3, #0
	mov sl, r3
	movs r1, #0
	ldr r2, _080936C4  @ gUnknown_0200F158
	ldrb r0, [r2]
	subs r0, #1
	cmp sl, r0
	blt _0809365C
	bl _08094FCE
_0809365C:
	movs r5, #0
	ldrb r0, [r2]
	adds r1, #1
	subs r0, r0, r1
	mov r8, r1
	cmp r5, r0
	bge _080936AE
	ldr r7, _080936C8  @ gUnknown_0200D6E0
	mov r9, r7
_0809366E:
	adds r7, r5, #1
	lsls r0, r7, #2
	mov r1, r9
	adds r6, r0, r1
	ldr r0, [r6]
	ldr r0, [r0]
	bl GetUnitSpeed
	adds r4, r0, #0
	lsls r0, r5, #2
	mov r2, r9
	adds r5, r0, r2
	ldr r0, [r5]
	ldr r0, [r0]
	bl GetUnitSpeed
	cmp r4, r0
	bge _0809369E
	ldr r1, [r5]
	ldr r0, [r6]
	str r0, [r5]
	str r1, [r6]
	movs r3, #1
	mov sl, r3
_0809369E:
	lsls r0, r7, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _080936C4  @ gUnknown_0200F158
	ldrb r0, [r0]
	mov r7, r8
	subs r0, r0, r7
	cmp r5, r0
	blt _0809366E
_080936AE:
	mov r1, r8
	lsls r0, r1, #0x18
	lsrs r1, r0, #0x18
	ldr r2, _080936C4  @ gUnknown_0200F158
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt _0809365C
	bl _08094FCE
	.align 2, 0
_080936C4: .4byte gUnknown_0200F158
_080936C8: .4byte gUnknown_0200D6E0
_080936CC:
	cmp r2, #0
	bne _08093754
	movs r3, #0
	mov sl, r3
	movs r1, #0
	ldr r3, _0809374C  @ gUnknown_0200F158
	ldrb r0, [r3]
	subs r0, #1
	cmp r2, r0
	blt _080936E4
	bl _08094FCE
_080936E4:
	movs r5, #0
	ldrb r0, [r3]
	adds r1, #1
	subs r0, r0, r1
	mov r8, r1
	cmp r5, r0
	bge _08093736
	ldr r7, _08093750  @ gUnknown_0200D6E0
	mov r9, r7
_080936F6:
	adds r7, r5, #1
	lsls r0, r7, #2
	mov r1, r9
	adds r6, r0, r1
	ldr r0, [r6]
	ldr r0, [r0]
	bl GetUnitLuck
	adds r4, r0, #0
	lsls r0, r5, #2
	mov r2, r9
	adds r5, r0, r2
	ldr r0, [r5]
	ldr r0, [r0]
	bl GetUnitLuck
	cmp r4, r0
	ble _08093726
	ldr r1, [r5]
	ldr r0, [r6]
	str r0, [r5]
	str r1, [r6]
	movs r3, #1
	mov sl, r3
_08093726:
	lsls r0, r7, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _0809374C  @ gUnknown_0200F158
	ldrb r0, [r0]
	mov r7, r8
	subs r0, r0, r7
	cmp r5, r0
	blt _080936F6
_08093736:
	mov r1, r8
	lsls r0, r1, #0x18
	lsrs r1, r0, #0x18
	ldr r3, _0809374C  @ gUnknown_0200F158
	ldrb r0, [r3]
	subs r0, #1
	cmp r1, r0
	blt _080936E4
	bl _08094FCE
	.align 2, 0
_0809374C: .4byte gUnknown_0200F158
_08093750: .4byte gUnknown_0200D6E0
_08093754:
	movs r3, #0
	mov sl, r3
	movs r1, #0
	ldr r2, _080937D0  @ gUnknown_0200F158
	ldrb r0, [r2]
	subs r0, #1
	cmp sl, r0
	blt _08093768
	bl _08094FCE
_08093768:
	movs r5, #0
	ldrb r0, [r2]
	adds r1, #1
	subs r0, r0, r1
	mov r8, r1
	cmp r5, r0
	bge _080937BA
	ldr r7, _080937D4  @ gUnknown_0200D6E0
	mov r9, r7
_0809377A:
	adds r7, r5, #1
	lsls r0, r7, #2
	mov r1, r9
	adds r6, r0, r1
	ldr r0, [r6]
	ldr r0, [r0]
	bl GetUnitLuck
	adds r4, r0, #0
	lsls r0, r5, #2
	mov r2, r9
	adds r5, r0, r2
	ldr r0, [r5]
	ldr r0, [r0]
	bl GetUnitLuck
	cmp r4, r0
	bge _080937AA
	ldr r1, [r5]
	ldr r0, [r6]
	str r0, [r5]
	str r1, [r6]
	movs r3, #1
	mov sl, r3
_080937AA:
	lsls r0, r7, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _080937D0  @ gUnknown_0200F158
	ldrb r0, [r0]
	mov r7, r8
	subs r0, r0, r7
	cmp r5, r0
	blt _0809377A
_080937BA:
	mov r1, r8
	lsls r0, r1, #0x18
	lsrs r1, r0, #0x18
	ldr r2, _080937D0  @ gUnknown_0200F158
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt _08093768
	bl _08094FCE
	.align 2, 0
_080937D0: .4byte gUnknown_0200F158
_080937D4: .4byte gUnknown_0200D6E0
_080937D8:
	cmp r2, #0
	bne _08093860
	movs r3, #0
	mov sl, r3
	movs r1, #0
	ldr r3, _08093858  @ gUnknown_0200F158
	ldrb r0, [r3]
	subs r0, #1
	cmp r2, r0
	blt _080937F0
	bl _08094FCE
_080937F0:
	movs r5, #0
	ldrb r0, [r3]
	adds r1, #1
	subs r0, r0, r1
	mov r8, r1
	cmp r5, r0
	bge _08093842
	ldr r7, _0809385C  @ gUnknown_0200D6E0
	mov r9, r7
_08093802:
	adds r7, r5, #1
	lsls r0, r7, #2
	mov r1, r9
	adds r6, r0, r1
	ldr r0, [r6]
	ldr r0, [r0]
	bl GetUnitDefense
	adds r4, r0, #0
	lsls r0, r5, #2
	mov r2, r9
	adds r5, r0, r2
	ldr r0, [r5]
	ldr r0, [r0]
	bl GetUnitDefense
	cmp r4, r0
	ble _08093832
	ldr r1, [r5]
	ldr r0, [r6]
	str r0, [r5]
	str r1, [r6]
	movs r3, #1
	mov sl, r3
_08093832:
	lsls r0, r7, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _08093858  @ gUnknown_0200F158
	ldrb r0, [r0]
	mov r7, r8
	subs r0, r0, r7
	cmp r5, r0
	blt _08093802
_08093842:
	mov r1, r8
	lsls r0, r1, #0x18
	lsrs r1, r0, #0x18
	ldr r3, _08093858  @ gUnknown_0200F158
	ldrb r0, [r3]
	subs r0, #1
	cmp r1, r0
	blt _080937F0
	bl _08094FCE
	.align 2, 0
_08093858: .4byte gUnknown_0200F158
_0809385C: .4byte gUnknown_0200D6E0
_08093860:
	movs r3, #0
	mov sl, r3
	movs r1, #0
	ldr r2, _080938DC  @ gUnknown_0200F158
	ldrb r0, [r2]
	subs r0, #1
	cmp sl, r0
	blt _08093874
	bl _08094FCE
_08093874:
	movs r5, #0
	ldrb r0, [r2]
	adds r1, #1
	subs r0, r0, r1
	mov r8, r1
	cmp r5, r0
	bge _080938C6
	ldr r7, _080938E0  @ gUnknown_0200D6E0
	mov r9, r7
_08093886:
	adds r7, r5, #1
	lsls r0, r7, #2
	mov r1, r9
	adds r6, r0, r1
	ldr r0, [r6]
	ldr r0, [r0]
	bl GetUnitDefense
	adds r4, r0, #0
	lsls r0, r5, #2
	mov r2, r9
	adds r5, r0, r2
	ldr r0, [r5]
	ldr r0, [r0]
	bl GetUnitDefense
	cmp r4, r0
	bge _080938B6
	ldr r1, [r5]
	ldr r0, [r6]
	str r0, [r5]
	str r1, [r6]
	movs r3, #1
	mov sl, r3
_080938B6:
	lsls r0, r7, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _080938DC  @ gUnknown_0200F158
	ldrb r0, [r0]
	mov r7, r8
	subs r0, r0, r7
	cmp r5, r0
	blt _08093886
_080938C6:
	mov r1, r8
	lsls r0, r1, #0x18
	lsrs r1, r0, #0x18
	ldr r2, _080938DC  @ gUnknown_0200F158
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt _08093874
	bl _08094FCE
	.align 2, 0
_080938DC: .4byte gUnknown_0200F158
_080938E0: .4byte gUnknown_0200D6E0
_080938E4:
	cmp r2, #0
	bne _0809396C
	movs r3, #0
	mov sl, r3
	movs r1, #0
	ldr r3, _08093964  @ gUnknown_0200F158
	ldrb r0, [r3]
	subs r0, #1
	cmp r2, r0
	blt _080938FC
	bl _08094FCE
_080938FC:
	movs r5, #0
	ldrb r0, [r3]
	adds r1, #1
	subs r0, r0, r1
	mov r8, r1
	cmp r5, r0
	bge _0809394E
	ldr r7, _08093968  @ gUnknown_0200D6E0
	mov r9, r7
_0809390E:
	adds r7, r5, #1
	lsls r0, r7, #2
	mov r1, r9
	adds r6, r0, r1
	ldr r0, [r6]
	ldr r0, [r0]
	bl GetUnitResistance
	adds r4, r0, #0
	lsls r0, r5, #2
	mov r2, r9
	adds r5, r0, r2
	ldr r0, [r5]
	ldr r0, [r0]
	bl GetUnitResistance
	cmp r4, r0
	ble _0809393E
	ldr r1, [r5]
	ldr r0, [r6]
	str r0, [r5]
	str r1, [r6]
	movs r3, #1
	mov sl, r3
_0809393E:
	lsls r0, r7, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _08093964  @ gUnknown_0200F158
	ldrb r0, [r0]
	mov r7, r8
	subs r0, r0, r7
	cmp r5, r0
	blt _0809390E
_0809394E:
	mov r1, r8
	lsls r0, r1, #0x18
	lsrs r1, r0, #0x18
	ldr r3, _08093964  @ gUnknown_0200F158
	ldrb r0, [r3]
	subs r0, #1
	cmp r1, r0
	blt _080938FC
	bl _08094FCE
	.align 2, 0
_08093964: .4byte gUnknown_0200F158
_08093968: .4byte gUnknown_0200D6E0
_0809396C:
	movs r3, #0
	mov sl, r3
	movs r1, #0
	ldr r2, _080939E8  @ gUnknown_0200F158
	ldrb r0, [r2]
	subs r0, #1
	cmp sl, r0
	blt _08093980
	bl _08094FCE
_08093980:
	movs r5, #0
	ldrb r0, [r2]
	adds r1, #1
	subs r0, r0, r1
	mov r8, r1
	cmp r5, r0
	bge _080939D2
	ldr r7, _080939EC  @ gUnknown_0200D6E0
	mov r9, r7
_08093992:
	adds r7, r5, #1
	lsls r0, r7, #2
	mov r1, r9
	adds r6, r0, r1
	ldr r0, [r6]
	ldr r0, [r0]
	bl GetUnitResistance
	adds r4, r0, #0
	lsls r0, r5, #2
	mov r2, r9
	adds r5, r0, r2
	ldr r0, [r5]
	ldr r0, [r0]
	bl GetUnitResistance
	cmp r4, r0
	bge _080939C2
	ldr r1, [r5]
	ldr r0, [r6]
	str r0, [r5]
	str r1, [r6]
	movs r3, #1
	mov sl, r3
_080939C2:
	lsls r0, r7, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _080939E8  @ gUnknown_0200F158
	ldrb r0, [r0]
	mov r7, r8
	subs r0, r0, r7
	cmp r5, r0
	blt _08093992
_080939D2:
	mov r1, r8
	lsls r0, r1, #0x18
	lsrs r1, r0, #0x18
	ldr r2, _080939E8  @ gUnknown_0200F158
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt _08093980
	bl _08094FCE
	.align 2, 0
_080939E8: .4byte gUnknown_0200F158
_080939EC: .4byte gUnknown_0200D6E0
_080939F0:
	cmp r2, #0
	bne _08093AA0
	movs r3, #0
	str r3, [sp, #0x48]
	movs r1, #0
	ldr r7, _08093A98  @ gUnknown_0200F158
	ldrb r0, [r7]
	subs r0, #1
	cmp r2, r0
	bge _08093A90
	adds r0, r7, #0
	mov sl, r0
_08093A08:
	movs r2, #0
	mov r3, sl
	ldrb r0, [r3]
	adds r1, #1
	subs r0, r0, r1
	mov r9, r1
	cmp r2, r0
	bge _08093A80
	ldr r7, _08093A9C  @ gUnknown_0200D6E0
	mov ip, r7
_08093A1C:
	adds r0, r2, #1
	mov r8, r0
	lsls r0, r0, #2
	mov r1, ip
	adds r7, r0, r1
	ldr r6, [r7]
	ldr r1, [r6]
	ldr r0, [r1, #4]
	movs r3, #0x11
	ldrsb r3, [r0, r3]
	ldr r0, [r1]
	ldrb r0, [r0, #0x13]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r3, r3, r0
	movs r0, #0x1a
	ldrsb r0, [r1, r0]
	adds r3, r3, r0
	lsls r0, r2, #2
	mov r2, ip
	adds r4, r0, r2
	ldr r5, [r4]
	ldr r2, [r5]
	ldr r0, [r2, #4]
	ldrb r0, [r0, #0x11]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldr r1, [r2]
	ldrb r1, [r1, #0x13]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, r0, r1
	movs r1, #0x1a
	ldrsb r1, [r2, r1]
	adds r0, r0, r1
	cmp r3, r0
	ble _08093A6E
	str r6, [r4]
	str r5, [r7]
	movs r3, #1
	str r3, [sp, #0x48]
_08093A6E:
	mov r7, r8
	lsls r0, r7, #0x18
	lsrs r2, r0, #0x18
	mov r1, sl
	ldrb r0, [r1]
	mov r3, r9
	subs r0, r0, r3
	cmp r2, r0
	blt _08093A1C
_08093A80:
	mov r7, r9
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	ldr r2, _08093A98  @ gUnknown_0200F158
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt _08093A08
_08093A90:
	ldr r3, [sp, #0x48]
	bl _08094ECA
	.align 2, 0
_08093A98: .4byte gUnknown_0200F158
_08093A9C: .4byte gUnknown_0200D6E0
_08093AA0:
	movs r7, #0
	str r7, [sp, #0x4c]
	movs r1, #0
	ldr r2, _08093B44  @ gUnknown_0200F158
	ldrb r0, [r2]
	subs r0, #1
	cmp r7, r0
	bge _08093B3C
	adds r3, r2, #0
	mov sl, r3
_08093AB4:
	movs r2, #0
	mov r7, sl
	ldrb r0, [r7]
	adds r1, #1
	subs r0, r0, r1
	mov r9, r1
	cmp r2, r0
	bge _08093B2C
	ldr r0, _08093B48  @ gUnknown_0200D6E0
	mov ip, r0
_08093AC8:
	adds r1, r2, #1
	mov r8, r1
	lsls r0, r1, #2
	mov r3, ip
	adds r7, r0, r3
	ldr r6, [r7]
	ldr r1, [r6]
	ldr r0, [r1, #4]
	movs r3, #0x11
	ldrsb r3, [r0, r3]
	ldr r0, [r1]
	ldrb r0, [r0, #0x13]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r3, r3, r0
	movs r0, #0x1a
	ldrsb r0, [r1, r0]
	adds r3, r3, r0
	lsls r0, r2, #2
	mov r1, ip
	adds r4, r0, r1
	ldr r5, [r4]
	ldr r2, [r5]
	ldr r0, [r2, #4]
	ldrb r0, [r0, #0x11]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldr r1, [r2]
	ldrb r1, [r1, #0x13]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, r0, r1
	movs r1, #0x1a
	ldrsb r1, [r2, r1]
	adds r0, r0, r1
	cmp r3, r0
	bge _08093B1A
	str r6, [r4]
	str r5, [r7]
	movs r2, #1
	str r2, [sp, #0x4c]
_08093B1A:
	mov r3, r8
	lsls r0, r3, #0x18
	lsrs r2, r0, #0x18
	mov r7, sl
	ldrb r0, [r7]
	mov r1, r9
	subs r0, r0, r1
	cmp r2, r0
	blt _08093AC8
_08093B2C:
	mov r2, r9
	lsls r0, r2, #0x18
	lsrs r1, r0, #0x18
	ldr r3, _08093B44  @ gUnknown_0200F158
	ldrb r0, [r3]
	subs r0, #1
	cmp r1, r0
	blt _08093AB4
_08093B3C:
	ldr r7, [sp, #0x4c]
	bl _0809435E
	.align 2, 0
_08093B44: .4byte gUnknown_0200F158
_08093B48: .4byte gUnknown_0200D6E0
_08093B4C:
	cmp r2, #0
	bne _08093BD4
	movs r0, #0
	mov sl, r0
	movs r1, #0
	ldr r3, _08093BCC  @ gUnknown_0200F158
	ldrb r0, [r3]
	subs r0, #1
	cmp r2, r0
	blt _08093B64
	bl _08094EC8
_08093B64:
	movs r5, #0
	ldrb r0, [r3]
	adds r1, #1
	subs r0, r0, r1
	mov r8, r1
	cmp r5, r0
	bge _08093BB6
	ldr r1, _08093BD0  @ gUnknown_0200D6E0
	mov r9, r1
_08093B76:
	adds r7, r5, #1
	lsls r0, r7, #2
	mov r2, r9
	adds r6, r0, r2
	ldr r0, [r6]
	ldr r0, [r0]
	bl GetUnitAid
	adds r4, r0, #0
	lsls r0, r5, #2
	mov r3, r9
	adds r5, r0, r3
	ldr r0, [r5]
	ldr r0, [r0]
	bl GetUnitAid
	cmp r4, r0
	ble _08093BA6
	ldr r1, [r5]
	ldr r0, [r6]
	str r0, [r5]
	str r1, [r6]
	movs r0, #1
	mov sl, r0
_08093BA6:
	lsls r0, r7, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _08093BCC  @ gUnknown_0200F158
	ldrb r0, [r0]
	mov r1, r8
	subs r0, r0, r1
	cmp r5, r0
	blt _08093B76
_08093BB6:
	mov r2, r8
	lsls r0, r2, #0x18
	lsrs r1, r0, #0x18
	ldr r3, _08093BCC  @ gUnknown_0200F158
	ldrb r0, [r3]
	subs r0, #1
	cmp r1, r0
	blt _08093B64
	bl _08094EC8
	.align 2, 0
_08093BCC: .4byte gUnknown_0200F158
_08093BD0: .4byte gUnknown_0200D6E0
_08093BD4:
	movs r7, #0
	mov sl, r7
	movs r1, #0
	ldr r2, _08093C50  @ gUnknown_0200F158
	ldrb r0, [r2]
	subs r0, #1
	cmp sl, r0
	blt _08093BE8
	bl _08094FCE
_08093BE8:
	movs r5, #0
	ldrb r0, [r2]
	adds r1, #1
	subs r0, r0, r1
	mov r8, r1
	cmp r5, r0
	bge _08093C3A
	ldr r0, _08093C54  @ gUnknown_0200D6E0
	mov r9, r0
_08093BFA:
	adds r7, r5, #1
	lsls r0, r7, #2
	mov r1, r9
	adds r6, r0, r1
	ldr r0, [r6]
	ldr r0, [r0]
	bl GetUnitAid
	adds r4, r0, #0
	lsls r0, r5, #2
	mov r2, r9
	adds r5, r0, r2
	ldr r0, [r5]
	ldr r0, [r0]
	bl GetUnitAid
	cmp r4, r0
	bge _08093C2A
	ldr r1, [r5]
	ldr r0, [r6]
	str r0, [r5]
	str r1, [r6]
	movs r3, #1
	mov sl, r3
_08093C2A:
	lsls r0, r7, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _08093C50  @ gUnknown_0200F158
	ldrb r0, [r0]
	mov r7, r8
	subs r0, r0, r7
	cmp r5, r0
	blt _08093BFA
_08093C3A:
	mov r1, r8
	lsls r0, r1, #0x18
	lsrs r1, r0, #0x18
	ldr r2, _08093C50  @ gUnknown_0200F158
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt _08093BE8
	bl _08094FCE
	.align 2, 0
_08093C50: .4byte gUnknown_0200F158
_08093C54: .4byte gUnknown_0200D6E0
_08093C58:
	cmp r2, #0
	bne _08093CE0
	movs r3, #0
	mov sl, r3
	movs r1, #0
	ldr r3, _08093CD8  @ gUnknown_0200F158
	ldrb r0, [r3]
	subs r0, #1
	cmp r2, r0
	blt _08093C70
	bl _08094FCE
_08093C70:
	movs r5, #0
	ldrb r0, [r3]
	adds r1, #1
	subs r0, r0, r1
	mov r8, r1
	cmp r5, r0
	bge _08093CC2
	ldr r7, _08093CDC  @ gUnknown_0200D6E0
	mov r9, r7
_08093C82:
	adds r7, r5, #1
	lsls r0, r7, #2
	mov r1, r9
	adds r6, r0, r1
	ldr r0, [r6]
	ldr r0, [r0]
	bl GetUnitAffinityIcon
	adds r4, r0, #0
	lsls r0, r5, #2
	mov r2, r9
	adds r5, r0, r2
	ldr r0, [r5]
	ldr r0, [r0]
	bl GetUnitAffinityIcon
	cmp r4, r0
	bge _08093CB2
	ldr r1, [r5]
	ldr r0, [r6]
	str r0, [r5]
	str r1, [r6]
	movs r3, #1
	mov sl, r3
_08093CB2:
	lsls r0, r7, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _08093CD8  @ gUnknown_0200F158
	ldrb r0, [r0]
	mov r7, r8
	subs r0, r0, r7
	cmp r5, r0
	blt _08093C82
_08093CC2:
	mov r1, r8
	lsls r0, r1, #0x18
	lsrs r1, r0, #0x18
	ldr r3, _08093CD8  @ gUnknown_0200F158
	ldrb r0, [r3]
	subs r0, #1
	cmp r1, r0
	blt _08093C70
	bl _08094FCE
	.align 2, 0
_08093CD8: .4byte gUnknown_0200F158
_08093CDC: .4byte gUnknown_0200D6E0
_08093CE0:
	movs r3, #0
	mov sl, r3
	movs r1, #0
	ldr r2, _08093D5C  @ gUnknown_0200F158
	ldrb r0, [r2]
	subs r0, #1
	cmp sl, r0
	blt _08093CF4
	bl _08094FCE
_08093CF4:
	movs r5, #0
	ldrb r0, [r2]
	adds r1, #1
	subs r0, r0, r1
	mov r8, r1
	cmp r5, r0
	bge _08093D46
	ldr r7, _08093D60  @ gUnknown_0200D6E0
	mov r9, r7
_08093D06:
	adds r7, r5, #1
	lsls r0, r7, #2
	mov r1, r9
	adds r6, r0, r1
	ldr r0, [r6]
	ldr r0, [r0]
	bl GetUnitAffinityIcon
	adds r4, r0, #0
	lsls r0, r5, #2
	mov r2, r9
	adds r5, r0, r2
	ldr r0, [r5]
	ldr r0, [r0]
	bl GetUnitAffinityIcon
	cmp r4, r0
	ble _08093D36
	ldr r1, [r5]
	ldr r0, [r6]
	str r0, [r5]
	str r1, [r6]
	movs r3, #1
	mov sl, r3
_08093D36:
	lsls r0, r7, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _08093D5C  @ gUnknown_0200F158
	ldrb r0, [r0]
	mov r7, r8
	subs r0, r0, r7
	cmp r5, r0
	blt _08093D06
_08093D46:
	mov r1, r8
	lsls r0, r1, #0x18
	lsrs r1, r0, #0x18
	ldr r2, _08093D5C  @ gUnknown_0200F158
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt _08093CF4
	bl _08094FCE
	.align 2, 0
_08093D5C: .4byte gUnknown_0200F158
_08093D60: .4byte gUnknown_0200D6E0
_08093D64:
	cmp r2, #0
	beq _08093D6A
	b _08093E6C
_08093D6A:
	movs r3, #0
	str r3, [sp, #0x50]
	movs r4, #0
	ldr r0, _08093DA8  @ gUnknown_0200F158
	ldrb r0, [r0]
	cmp r2, r0
	bcs _08093DA2
	ldr r5, _08093DAC  @ gUnknown_0200D6E0
_08093D7A:
	lsls r0, r4, #2
	adds r0, r0, r5
	ldr r0, [r0]
	ldr r0, [r0]
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl GetItemIndex
	mov r7, sp
	adds r1, r7, r4
	strb r0, [r1]
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r0, _08093DA8  @ gUnknown_0200F158
	ldrb r0, [r0]
	cmp r4, r0
	bcc _08093D7A
_08093DA2:
	movs r4, #0
	b _08093E56
	.align 2, 0
_08093DA8: .4byte gUnknown_0200F158
_08093DAC: .4byte gUnknown_0200D6E0
_08093DB0:
	movs r6, #0
	ldrb r0, [r1]
	adds r1, r4, #1
	subs r0, r0, r1
	str r1, [sp, #0x58]
	cmp r6, r0
	bge _08093E50
	ldr r0, _08093DF8  @ gUnknown_0200D6E0
	mov sl, r0
_08093DC2:
	adds r0, r6, #1
	mov r1, sp
	adds r1, r1, r0
	mov r8, r1
	mov r2, sp
	adds r5, r2, r6
	ldrb r4, [r1]
	adds r3, r4, #0
	ldrb r2, [r5]
	mov r9, r0
	cmp r3, r2
	bls _08093DFC
	adds r1, r2, #0
	strb r4, [r5]
	mov r3, r8
	strb r1, [r3]
	lsls r2, r6, #2
	add r2, sl
	ldr r3, [r2]
	lsls r1, r0, #2
	add r1, sl
	ldr r0, [r1]
	str r0, [r2]
	str r3, [r1]
	movs r7, #1
	str r7, [sp, #0x50]
	b _08093E3E
	.align 2, 0
_08093DF8: .4byte gUnknown_0200D6E0
_08093DFC:
	cmp r3, r2
	bne _08093E3E
	mov r1, r9
	lsls r0, r1, #2
	mov r2, sl
	adds r7, r0, r2
	ldr r0, [r7]
	ldr r0, [r0]
	bl GetUnitEquippedWeapon
	adds r4, r0, #0
	lsls r0, r6, #2
	mov r3, sl
	adds r6, r0, r3
	ldr r0, [r6]
	ldr r0, [r0]
	bl GetUnitEquippedWeapon
	lsls r4, r4, #0x10
	lsls r0, r0, #0x10
	cmp r4, r0
	bls _08093E3E
	ldrb r1, [r5]
	mov r2, r8
	ldrb r0, [r2]
	strb r0, [r5]
	strb r1, [r2]
	ldr r3, [r6]
	ldr r0, [r7]
	str r0, [r6]
	str r3, [r7]
	movs r3, #1
	str r3, [sp, #0x50]
_08093E3E:
	mov r7, r9
	lsls r0, r7, #0x18
	lsrs r6, r0, #0x18
	ldr r0, _08093E68  @ gUnknown_0200F158
	ldrb r0, [r0]
	ldr r1, [sp, #0x58]
	subs r0, r0, r1
	cmp r6, r0
	blt _08093DC2
_08093E50:
	ldr r2, [sp, #0x58]
	lsls r0, r2, #0x18
	lsrs r4, r0, #0x18
_08093E56:
	ldr r1, _08093E68  @ gUnknown_0200F158
	ldrb r0, [r1]
	subs r0, #1
	cmp r4, r0
	blt _08093DB0
	ldr r3, [sp, #0x50]
	bl _08094ECA
	.align 2, 0
_08093E68: .4byte gUnknown_0200F158
_08093E6C:
	movs r7, #0
	str r7, [sp, #0x54]
	movs r4, #0
	ldr r0, _08093EA8  @ gUnknown_0200F158
	ldrb r0, [r0]
	cmp r7, r0
	bcs _08093EA4
	ldr r5, _08093EAC  @ gUnknown_0200D6E0
_08093E7C:
	lsls r0, r4, #2
	adds r0, r0, r5
	ldr r0, [r0]
	ldr r0, [r0]
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl GetItemIndex
	mov r2, sp
	adds r1, r2, r4
	strb r0, [r1]
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r0, _08093EA8  @ gUnknown_0200F158
	ldrb r0, [r0]
	cmp r4, r0
	bcc _08093E7C
_08093EA4:
	movs r4, #0
	b _08093F56
	.align 2, 0
_08093EA8: .4byte gUnknown_0200F158
_08093EAC: .4byte gUnknown_0200D6E0
_08093EB0:
	movs r6, #0
	ldrb r0, [r1]
	adds r1, r4, #1
	subs r0, r0, r1
	str r1, [sp, #0x5c]
	cmp r6, r0
	bge _08093F50
	ldr r3, _08093EF8  @ gUnknown_0200D6E0
	mov sl, r3
_08093EC2:
	adds r0, r6, #1
	mov r7, sp
	adds r7, r7, r0
	mov r8, r7
	mov r1, sp
	adds r5, r1, r6
	ldrb r4, [r7]
	adds r3, r4, #0
	ldrb r2, [r5]
	mov r9, r0
	cmp r3, r2
	bcs _08093EFC
	adds r1, r2, #0
	strb r4, [r5]
	strb r1, [r7]
	lsls r2, r6, #2
	add r2, sl
	ldr r3, [r2]
	lsls r1, r0, #2
	add r1, sl
	ldr r0, [r1]
	str r0, [r2]
	str r3, [r1]
	movs r2, #1
	str r2, [sp, #0x54]
	b _08093F3E
	.align 2, 0
_08093EF8: .4byte gUnknown_0200D6E0
_08093EFC:
	cmp r3, r2
	bne _08093F3E
	mov r3, r9
	lsls r0, r3, #2
	mov r1, sl
	adds r7, r0, r1
	ldr r0, [r7]
	ldr r0, [r0]
	bl GetUnitEquippedWeapon
	adds r4, r0, #0
	lsls r0, r6, #2
	mov r2, sl
	adds r6, r0, r2
	ldr r0, [r6]
	ldr r0, [r0]
	bl GetUnitEquippedWeapon
	lsls r4, r4, #0x10
	lsls r0, r0, #0x10
	cmp r4, r0
	bcs _08093F3E
	ldrb r1, [r5]
	mov r3, r8
	ldrb r0, [r3]
	strb r0, [r5]
	strb r1, [r3]
	ldr r3, [r6]
	ldr r0, [r7]
	str r0, [r6]
	str r3, [r7]
	movs r7, #1
	str r7, [sp, #0x54]
_08093F3E:
	mov r1, r9
	lsls r0, r1, #0x18
	lsrs r6, r0, #0x18
	ldr r0, _08093F64  @ gUnknown_0200F158
	ldrb r0, [r0]
	ldr r2, [sp, #0x5c]
	subs r0, r0, r2
	cmp r6, r0
	blt _08093EC2
_08093F50:
	ldr r3, [sp, #0x5c]
	lsls r0, r3, #0x18
	lsrs r4, r0, #0x18
_08093F56:
	ldr r1, _08093F64  @ gUnknown_0200F158
	ldrb r0, [r1]
	subs r0, #1
	cmp r4, r0
	blt _08093EB0
	ldr r7, [sp, #0x54]
	b _0809435E
	.align 2, 0
_08093F64: .4byte gUnknown_0200F158
_08093F68:
	cmp r2, #0
	bne _08093FE4
	movs r0, #0
	mov ip, r0
	movs r1, #0
	ldr r3, _08093FDC  @ gUnknown_0200F158
	ldrb r0, [r3]
	subs r0, #1
	cmp r2, r0
	bge _08093FD6
	adds r7, r3, #0
	mov sl, r7
_08093F80:
	movs r2, #0
	mov r3, sl
	ldrb r0, [r3]
	adds r1, #1
	subs r0, r0, r1
	mov r9, r1
	cmp r2, r0
	bge _08093FC6
	mov r8, r9
_08093F92:
	adds r6, r2, #1
	lsls r0, r6, #2
	ldr r7, _08093FE0  @ gUnknown_0200D6E0
	adds r5, r0, r7
	ldr r4, [r5]
	lsls r0, r2, #2
	adds r2, r0, r7
	ldr r3, [r2]
	movs r0, #4
	ldrsh r1, [r4, r0]
	movs r7, #4
	ldrsh r0, [r3, r7]
	cmp r1, r0
	ble _08093FB6
	str r4, [r2]
	str r3, [r5]
	movs r0, #1
	mov ip, r0
_08093FB6:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r1, sl
	ldrb r0, [r1]
	mov r3, r8
	subs r0, r0, r3
	cmp r2, r0
	blt _08093F92
_08093FC6:
	mov r7, r9
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	ldr r2, _08093FDC  @ gUnknown_0200F158
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt _08093F80
_08093FD6:
	mov r3, ip
	bl _08094ECA
	.align 2, 0
_08093FDC: .4byte gUnknown_0200F158
_08093FE0: .4byte gUnknown_0200D6E0
_08093FE4:
	movs r7, #0
	mov ip, r7
	movs r1, #0
	ldr r2, _08094054  @ gUnknown_0200F158
	ldrb r0, [r2]
	subs r0, #1
	cmp ip, r0
	bge _0809404E
	adds r3, r2, #0
	mov sl, r3
_08093FF8:
	movs r2, #0
	mov r7, sl
	ldrb r0, [r7]
	adds r1, #1
	subs r0, r0, r1
	mov r9, r1
	cmp r2, r0
	bge _0809403E
	mov r8, r9
_0809400A:
	adds r6, r2, #1
	lsls r0, r6, #2
	ldr r1, _08094058  @ gUnknown_0200D6E0
	adds r5, r0, r1
	ldr r4, [r5]
	lsls r0, r2, #2
	adds r2, r0, r1
	ldr r3, [r2]
	movs r7, #4
	ldrsh r1, [r4, r7]
	movs r7, #4
	ldrsh r0, [r3, r7]
	cmp r1, r0
	bge _0809402E
	str r4, [r2]
	str r3, [r5]
	movs r0, #1
	mov ip, r0
_0809402E:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r1, sl
	ldrb r0, [r1]
	mov r3, r8
	subs r0, r0, r3
	cmp r2, r0
	blt _0809400A
_0809403E:
	mov r7, r9
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	ldr r2, _08094054  @ gUnknown_0200F158
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt _08093FF8
_0809404E:
	mov r3, ip
	bl _08094ECA
	.align 2, 0
_08094054: .4byte gUnknown_0200F158
_08094058: .4byte gUnknown_0200D6E0
_0809405C:
	cmp r2, #0
	bne _080940D8
	movs r7, #0
	mov ip, r7
	movs r1, #0
	ldr r3, _080940D0  @ gUnknown_0200F158
	ldrb r0, [r3]
	subs r0, #1
	cmp r2, r0
	bge _080940CA
	adds r7, r3, #0
	mov sl, r7
_08094074:
	movs r2, #0
	mov r3, sl
	ldrb r0, [r3]
	adds r1, #1
	subs r0, r0, r1
	mov r9, r1
	cmp r2, r0
	bge _080940BA
	mov r8, r9
_08094086:
	adds r6, r2, #1
	lsls r0, r6, #2
	ldr r7, _080940D4  @ gUnknown_0200D6E0
	adds r5, r0, r7
	ldr r4, [r5]
	lsls r0, r2, #2
	adds r2, r0, r7
	ldr r3, [r2]
	movs r0, #6
	ldrsh r1, [r4, r0]
	movs r7, #6
	ldrsh r0, [r3, r7]
	cmp r1, r0
	ble _080940AA
	str r4, [r2]
	str r3, [r5]
	movs r0, #1
	mov ip, r0
_080940AA:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r1, sl
	ldrb r0, [r1]
	mov r3, r8
	subs r0, r0, r3
	cmp r2, r0
	blt _08094086
_080940BA:
	mov r7, r9
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	ldr r2, _080940D0  @ gUnknown_0200F158
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt _08094074
_080940CA:
	mov r3, ip
	bl _08094ECA
	.align 2, 0
_080940D0: .4byte gUnknown_0200F158
_080940D4: .4byte gUnknown_0200D6E0
_080940D8:
	movs r7, #0
	mov ip, r7
	movs r1, #0
	ldr r2, _08094148  @ gUnknown_0200F158
	ldrb r0, [r2]
	subs r0, #1
	cmp ip, r0
	bge _08094142
	adds r3, r2, #0
	mov sl, r3
_080940EC:
	movs r2, #0
	mov r7, sl
	ldrb r0, [r7]
	adds r1, #1
	subs r0, r0, r1
	mov r9, r1
	cmp r2, r0
	bge _08094132
	mov r8, r9
_080940FE:
	adds r6, r2, #1
	lsls r0, r6, #2
	ldr r1, _0809414C  @ gUnknown_0200D6E0
	adds r5, r0, r1
	ldr r4, [r5]
	lsls r0, r2, #2
	adds r2, r0, r1
	ldr r3, [r2]
	movs r7, #6
	ldrsh r1, [r4, r7]
	movs r7, #6
	ldrsh r0, [r3, r7]
	cmp r1, r0
	bge _08094122
	str r4, [r2]
	str r3, [r5]
	movs r0, #1
	mov ip, r0
_08094122:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r1, sl
	ldrb r0, [r1]
	mov r3, r8
	subs r0, r0, r3
	cmp r2, r0
	blt _080940FE
_08094132:
	mov r7, r9
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	ldr r2, _08094148  @ gUnknown_0200F158
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt _080940EC
_08094142:
	mov r3, ip
	bl _08094ECA
	.align 2, 0
_08094148: .4byte gUnknown_0200F158
_0809414C: .4byte gUnknown_0200D6E0
_08094150:
	cmp r2, #0
	bne _080941CC
	movs r7, #0
	mov ip, r7
	movs r1, #0
	ldr r3, _080941C4  @ gUnknown_0200F158
	ldrb r0, [r3]
	subs r0, #1
	cmp r2, r0
	bge _080941BE
	adds r7, r3, #0
	mov sl, r7
_08094168:
	movs r2, #0
	mov r3, sl
	ldrb r0, [r3]
	adds r1, #1
	subs r0, r0, r1
	mov r9, r1
	cmp r2, r0
	bge _080941AE
	mov r8, r9
_0809417A:
	adds r6, r2, #1
	lsls r0, r6, #2
	ldr r7, _080941C8  @ gUnknown_0200D6E0
	adds r5, r0, r7
	ldr r4, [r5]
	lsls r0, r2, #2
	adds r2, r0, r7
	ldr r3, [r2]
	movs r0, #8
	ldrsh r1, [r4, r0]
	movs r7, #8
	ldrsh r0, [r3, r7]
	cmp r1, r0
	ble _0809419E
	str r4, [r2]
	str r3, [r5]
	movs r0, #1
	mov ip, r0
_0809419E:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r1, sl
	ldrb r0, [r1]
	mov r3, r8
	subs r0, r0, r3
	cmp r2, r0
	blt _0809417A
_080941AE:
	mov r7, r9
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	ldr r2, _080941C4  @ gUnknown_0200F158
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt _08094168
_080941BE:
	mov r3, ip
	bl _08094ECA
	.align 2, 0
_080941C4: .4byte gUnknown_0200F158
_080941C8: .4byte gUnknown_0200D6E0
_080941CC:
	movs r7, #0
	mov ip, r7
	movs r1, #0
	ldr r2, _0809423C  @ gUnknown_0200F158
	ldrb r0, [r2]
	subs r0, #1
	cmp ip, r0
	bge _08094236
	adds r3, r2, #0
	mov sl, r3
_080941E0:
	movs r2, #0
	mov r7, sl
	ldrb r0, [r7]
	adds r1, #1
	subs r0, r0, r1
	mov r9, r1
	cmp r2, r0
	bge _08094226
	mov r8, r9
_080941F2:
	adds r6, r2, #1
	lsls r0, r6, #2
	ldr r1, _08094240  @ gUnknown_0200D6E0
	adds r5, r0, r1
	ldr r4, [r5]
	lsls r0, r2, #2
	adds r2, r0, r1
	ldr r3, [r2]
	movs r7, #8
	ldrsh r1, [r4, r7]
	movs r7, #8
	ldrsh r0, [r3, r7]
	cmp r1, r0
	bge _08094216
	str r4, [r2]
	str r3, [r5]
	movs r0, #1
	mov ip, r0
_08094216:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r1, sl
	ldrb r0, [r1]
	mov r3, r8
	subs r0, r0, r3
	cmp r2, r0
	blt _080941F2
_08094226:
	mov r7, r9
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	ldr r2, _0809423C  @ gUnknown_0200F158
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt _080941E0
_08094236:
	mov r3, ip
	bl _08094ECA
	.align 2, 0
_0809423C: .4byte gUnknown_0200F158
_08094240: .4byte gUnknown_0200D6E0
_08094244:
	cmp r2, #0
	bne _080942D8
	movs r7, #0
	mov ip, r7
	movs r1, #0
	ldr r3, _080942D0  @ gUnknown_0200F158
	ldrb r0, [r3]
	subs r0, #1
	cmp r2, r0
	blt _0809425A
	b _0809435C
_0809425A:
	adds r7, r3, #0
	mov sl, r7
_0809425E:
	movs r3, #0
	mov r2, sl
	ldrb r0, [r2]
	adds r1, #1
	subs r0, r0, r1
	mov r8, r1
	cmp r3, r0
	bge _080942BE
	ldr r7, _080942D4  @ gUnknown_0200D6E0
	mov r9, r7
_08094272:
	adds r7, r3, #1
	lsls r0, r7, #2
	mov r1, r9
	adds r6, r0, r1
	ldr r5, [r6]
	ldr r0, [r5]
	movs r2, #0x1d
	ldrsb r2, [r0, r2]
	ldr r0, [r0, #4]
	ldrb r0, [r0, #0x12]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r2, r2, r0
	lsls r0, r3, #2
	adds r3, r0, r1
	ldr r4, [r3]
	ldr r0, [r4]
	movs r1, #0x1d
	ldrsb r1, [r0, r1]
	ldr r0, [r0, #4]
	ldrb r0, [r0, #0x12]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r1, r1, r0
	cmp r2, r1
	ble _080942AE
	str r5, [r3]
	str r4, [r6]
	movs r2, #1
	mov ip, r2
_080942AE:
	lsls r0, r7, #0x18
	lsrs r3, r0, #0x18
	mov r7, sl
	ldrb r0, [r7]
	mov r1, r8
	subs r0, r0, r1
	cmp r3, r0
	blt _08094272
_080942BE:
	mov r2, r8
	lsls r0, r2, #0x18
	lsrs r1, r0, #0x18
	ldr r3, _080942D0  @ gUnknown_0200F158
	ldrb r0, [r3]
	subs r0, #1
	cmp r1, r0
	blt _0809425E
	b _0809435C
	.align 2, 0
_080942D0: .4byte gUnknown_0200F158
_080942D4: .4byte gUnknown_0200D6E0
_080942D8:
	movs r0, #0
	mov ip, r0
	movs r1, #0
	ldr r2, _0809436C  @ gUnknown_0200F158
	ldrb r0, [r2]
	subs r0, #1
	cmp ip, r0
	bge _0809435C
	adds r3, r2, #0
	mov sl, r3
_080942EC:
	movs r3, #0
	mov r7, sl
	ldrb r0, [r7]
	adds r1, #1
	subs r0, r0, r1
	mov r8, r1
	cmp r3, r0
	bge _0809434C
	ldr r0, _08094370  @ gUnknown_0200D6E0
	mov r9, r0
_08094300:
	adds r7, r3, #1
	lsls r0, r7, #2
	mov r1, r9
	adds r6, r0, r1
	ldr r5, [r6]
	ldr r0, [r5]
	movs r2, #0x1d
	ldrsb r2, [r0, r2]
	ldr r0, [r0, #4]
	ldrb r0, [r0, #0x12]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r2, r2, r0
	lsls r0, r3, #2
	adds r3, r0, r1
	ldr r4, [r3]
	ldr r0, [r4]
	movs r1, #0x1d
	ldrsb r1, [r0, r1]
	ldr r0, [r0, #4]
	ldrb r0, [r0, #0x12]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r1, r1, r0
	cmp r2, r1
	bge _0809433C
_08094334:
	str r5, [r3]
	str r4, [r6]
	movs r2, #1
	mov ip, r2
_0809433C:
	lsls r0, r7, #0x18
	lsrs r3, r0, #0x18
	mov r7, sl
	ldrb r0, [r7]
	mov r1, r8
	subs r0, r0, r1
	cmp r3, r0
	blt _08094300
_0809434C:
	mov r2, r8
	lsls r0, r2, #0x18
	lsrs r1, r0, #0x18
	ldr r3, _0809436C  @ gUnknown_0200F158
	ldrb r0, [r3]
	subs r0, #1
	cmp r1, r0
	blt _080942EC
_0809435C:
	mov r7, ip
_0809435E:
	cmp r7, #0
	bne _08094366
	bl _08094FE0
_08094366:
	movs r0, #1
	bl _08094FE2
	.align 2, 0
_0809436C: .4byte gUnknown_0200F158
_08094370: .4byte gUnknown_0200D6E0
_08094374:
	cmp r2, #0
	bne _080943FC
	movs r0, #0
	mov sl, r0
	movs r1, #0
	ldr r3, _080943F4  @ gUnknown_0200F158
	mov ip, r3
	ldrb r0, [r3]
	subs r0, #1
	cmp r2, r0
	blt _0809438E
	bl _08094EC8
_0809438E:
	adds r7, r3, #0
	mov r9, r7
_08094392:
	movs r2, #0
	mov r3, r9
	ldrb r0, [r3]
	adds r1, #1
	subs r0, r0, r1
	adds r7, r1, #0
	cmp r2, r0
	bge _080943E2
	ldr r0, _080943F8  @ gUnknown_0200D6E0
	mov r8, r0
_080943A6:
	adds r6, r2, #1
	lsls r0, r6, #2
	mov r1, r8
	adds r5, r0, r1
	ldr r4, [r5]
	ldr r0, [r4]
	adds r0, #0x30
	ldrb r1, [r0]
	lsls r1, r1, #0x1c
	lsls r0, r2, #2
	mov r3, r8
	adds r2, r0, r3
	ldr r3, [r2]
	ldr r0, [r3]
	adds r0, #0x30
	ldrb r0, [r0]
	lsls r0, r0, #0x1c
	cmp r1, r0
	bls _080943D4
	str r4, [r2]
	str r3, [r5]
	movs r0, #1
	mov sl, r0
_080943D4:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r1, r9
	ldrb r0, [r1]
	subs r0, r0, r7
	cmp r2, r0
	blt _080943A6
_080943E2:
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	mov r2, ip
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt _08094392
	bl _08094EC8
	.align 2, 0
_080943F4: .4byte gUnknown_0200F158
_080943F8: .4byte gUnknown_0200D6E0
_080943FC:
	movs r7, #0
	mov sl, r7
	movs r1, #0
	ldr r0, _08094478  @ gUnknown_0200F158
	mov ip, r0
	ldrb r0, [r0]
	subs r0, #1
	cmp sl, r0
	blt _08094412
	bl _08094EC8
_08094412:
	ldr r2, _08094478  @ gUnknown_0200F158
	mov r9, r2
_08094416:
	movs r2, #0
	mov r3, r9
	ldrb r0, [r3]
	adds r1, #1
	subs r0, r0, r1
	adds r7, r1, #0
	cmp r2, r0
	bge _08094466
	ldr r0, _0809447C  @ gUnknown_0200D6E0
	mov r8, r0
_0809442A:
	adds r6, r2, #1
	lsls r0, r6, #2
	mov r1, r8
	adds r5, r0, r1
	ldr r4, [r5]
	ldr r0, [r4]
	adds r0, #0x30
	ldrb r1, [r0]
	lsls r1, r1, #0x1c
	lsls r0, r2, #2
	mov r3, r8
	adds r2, r0, r3
	ldr r3, [r2]
	ldr r0, [r3]
	adds r0, #0x30
	ldrb r0, [r0]
	lsls r0, r0, #0x1c
	cmp r1, r0
	bcs _08094458
	str r4, [r2]
	str r3, [r5]
	movs r0, #1
	mov sl, r0
_08094458:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r1, r9
	ldrb r0, [r1]
	subs r0, r0, r7
	cmp r2, r0
	blt _0809442A
_08094466:
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	mov r2, ip
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt _08094416
	bl _08094EC8
	.align 2, 0
_08094478: .4byte gUnknown_0200F158
_0809447C: .4byte gUnknown_0200D6E0
_08094480:
	cmp r2, #0
	bne _08094540
	movs r7, #0
	mov r9, r7
	movs r1, #0
	ldr r0, _080944B0  @ gUnknown_0200F158
	ldrb r3, [r0]
	cmp r2, r3
	bcs _080944C8
	ldr r6, _080944B4  @ gUnknown_0200D6E0
	movs r5, #0x10
	movs r4, #1
_08094498:
	lsls r0, r1, #2
	adds r0, r0, r6
	ldr r0, [r0]
	ldr r0, [r0]
	ldr r2, [r0, #0xc]
	ands r2, r5
	cmp r2, #0
	beq _080944B8
	mov r2, sp
	adds r0, r2, r1
	strb r4, [r0]
	b _080944BE
	.align 2, 0
_080944B0: .4byte gUnknown_0200F158
_080944B4: .4byte gUnknown_0200D6E0
_080944B8:
	mov r7, sp
	adds r0, r7, r1
	strb r2, [r0]
_080944BE:
	adds r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, r3
	bcc _08094498
_080944C8:
	movs r1, #0
	ldr r2, _08094538  @ gUnknown_0200F158
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt _080944D6
	b _080945F0
_080944D6:
	mov r8, r2
	ldr r3, _0809453C  @ gUnknown_0200D6E0
	mov ip, r3
	mov sl, r8
_080944DE:
	movs r2, #0
	mov r7, r8
	ldrb r0, [r7]
	adds r1, #1
	subs r0, r0, r1
	adds r6, r1, #0
	cmp r2, r0
	bge _08094528
	mov r7, ip
_080944F0:
	adds r5, r2, #1
	mov r0, sp
	adds r4, r0, r5
	adds r1, r0, r2
	ldrb r3, [r4]
	ldrb r0, [r1]
	cmp r3, r0
	bls _0809451A
	ldrb r0, [r1]
	strb r3, [r1]
	strb r0, [r4]
	lsls r2, r2, #2
	adds r2, r2, r7
	ldr r3, [r2]
	lsls r1, r5, #2
	adds r1, r1, r7
	ldr r0, [r1]
	str r0, [r2]
	str r3, [r1]
	movs r1, #1
	mov r9, r1
_0809451A:
	lsls r0, r5, #0x18
	lsrs r2, r0, #0x18
	mov r3, r8
	ldrb r0, [r3]
	subs r0, r0, r6
	cmp r2, r0
	blt _080944F0
_08094528:
	lsls r0, r6, #0x18
	lsrs r1, r0, #0x18
	mov r7, sl
	ldrb r0, [r7]
	subs r0, #1
	cmp r1, r0
	blt _080944DE
	b _080945F0
	.align 2, 0
_08094538: .4byte gUnknown_0200F158
_0809453C: .4byte gUnknown_0200D6E0
_08094540:
	movs r1, #0
	mov r9, r1
	ldr r0, _0809456C  @ gUnknown_0200F158
	ldrb r2, [r0]
	cmp r9, r2
	bcs _08094584
	ldr r6, _08094570  @ gUnknown_0200D6E0
	adds r3, r2, #0
	movs r5, #0x10
	movs r4, #1
_08094554:
	lsls r0, r1, #2
	adds r0, r0, r6
	ldr r0, [r0]
	ldr r0, [r0]
	ldr r2, [r0, #0xc]
	ands r2, r5
	cmp r2, #0
	beq _08094574
	mov r2, sp
	adds r0, r2, r1
	strb r4, [r0]
	b _0809457A
	.align 2, 0
_0809456C: .4byte gUnknown_0200F158
_08094570: .4byte gUnknown_0200D6E0
_08094574:
	mov r7, sp
	adds r0, r7, r1
	strb r2, [r0]
_0809457A:
	adds r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, r3
	bcc _08094554
_08094584:
	movs r1, #0
	ldr r2, _08094600  @ gUnknown_0200F158
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	bge _080945F0
	mov r8, r2
	ldr r3, _08094604  @ gUnknown_0200D6E0
	mov ip, r3
	mov sl, r8
_08094598:
	movs r2, #0
	mov r7, r8
	ldrb r0, [r7]
	adds r1, #1
	subs r0, r0, r1
	adds r6, r1, #0
	cmp r2, r0
	bge _080945E2
	mov r7, ip
_080945AA:
	adds r5, r2, #1
	mov r0, sp
	adds r4, r0, r5
	adds r1, r0, r2
	ldrb r3, [r4]
	ldrb r0, [r1]
	cmp r3, r0
	bcs _080945D4
	ldrb r0, [r1]
	strb r3, [r1]
	strb r0, [r4]
	lsls r2, r2, #2
	adds r2, r2, r7
	ldr r3, [r2]
	lsls r1, r5, #2
_080945C8:
	adds r1, r1, r7
	ldr r0, [r1]
	str r0, [r2]
	str r3, [r1]
	movs r1, #1
	mov r9, r1
_080945D4:
	lsls r0, r5, #0x18
	lsrs r2, r0, #0x18
	mov r3, r8
	ldrb r0, [r3]
	subs r0, r0, r6
	cmp r2, r0
	blt _080945AA
_080945E2:
	lsls r0, r6, #0x18
	lsrs r1, r0, #0x18
	mov r7, sl
	ldrb r0, [r7]
	subs r0, #1
	cmp r1, r0
	blt _08094598
_080945F0:
	mov r0, r9
_080945F2:
	cmp r0, #0
	bne _080945FA
	bl _08094FE0
_080945FA:
	movs r0, #1
	bl _08094FE2
	.align 2, 0
_08094600: .4byte gUnknown_0200F158
_08094604: .4byte gUnknown_0200D6E0
_08094608:
	cmp r2, #0
	bne _0809468C
	movs r1, #0
	mov sl, r1
	ldr r3, _08094684  @ gUnknown_0200F158
	mov ip, r3
	ldrb r0, [r3]
	subs r0, #1
	cmp r2, r0
	blt _08094620
	bl _08094EC8
_08094620:
	adds r7, r3, #0
	mov r9, r7
_08094624:
	movs r2, #0
	mov r3, r9
	ldrb r0, [r3]
	adds r1, #1
	subs r0, r0, r1
	adds r7, r1, #0
	cmp r2, r0
	bge _08094670
	ldr r0, _08094688  @ gUnknown_0200D6E0
	mov r8, r0
_08094638:
	adds r6, r2, #1
	lsls r0, r6, #2
	mov r1, r8
	adds r5, r0, r1
	ldr r4, [r5]
	ldr r1, [r4]
	adds r1, #0x28
	lsls r0, r2, #2
	mov r3, r8
	adds r2, r0, r3
	ldr r3, [r2]
	ldr r0, [r3]
	adds r0, #0x28
	ldrb r1, [r1]
	ldrb r0, [r0]
	cmp r1, r0
	bls _08094662
	str r4, [r2]
	str r3, [r5]
	movs r0, #1
	mov sl, r0
_08094662:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r1, r9
	ldrb r0, [r1]
	subs r0, r0, r7
	cmp r2, r0
	blt _08094638
_08094670:
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	mov r2, ip
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt _08094624
	bl _08094EC8
	.align 2, 0
_08094684: .4byte gUnknown_0200F158
_08094688: .4byte gUnknown_0200D6E0
_0809468C:
	movs r7, #0
	mov sl, r7
	movs r1, #0
	ldr r0, _08094704  @ gUnknown_0200F158
	mov ip, r0
	ldrb r0, [r0]
	subs r0, #1
	cmp sl, r0
	blt _080946A2
	bl _08094EC8
_080946A2:
	ldr r2, _08094704  @ gUnknown_0200F158
	mov r9, r2
_080946A6:
	movs r2, #0
	mov r3, r9
	ldrb r0, [r3]
	adds r1, #1
	subs r0, r0, r1
	adds r7, r1, #0
	cmp r2, r0
	bge _080946F2
	ldr r0, _08094708  @ gUnknown_0200D6E0
	mov r8, r0
_080946BA:
	adds r6, r2, #1
	lsls r0, r6, #2
	mov r1, r8
	adds r5, r0, r1
	ldr r4, [r5]
	ldr r1, [r4]
	adds r1, #0x28
	lsls r0, r2, #2
	mov r3, r8
	adds r2, r0, r3
	ldr r3, [r2]
	ldr r0, [r3]
	adds r0, #0x28
	ldrb r1, [r1]
	ldrb r0, [r0]
	cmp r1, r0
	bcs _080946E4
	str r4, [r2]
	str r3, [r5]
	movs r0, #1
	mov sl, r0
_080946E4:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r1, r9
	ldrb r0, [r1]
	subs r0, r0, r7
	cmp r2, r0
	blt _080946BA
_080946F2:
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	mov r2, ip
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt _080946A6
	bl _08094EC8
	.align 2, 0
_08094704: .4byte gUnknown_0200F158
_08094708: .4byte gUnknown_0200D6E0
_0809470C:
	cmp r2, #0
	bne _0809478C
	movs r7, #0
	mov sl, r7
	movs r1, #0
	ldr r0, _08094784  @ gUnknown_0200F158
	mov ip, r0
	ldrb r0, [r0]
	subs r0, #1
	cmp r2, r0
	blt _08094724
	b _08094EC8
_08094724:
	ldr r2, _08094784  @ gUnknown_0200F158
	mov r9, r2
_08094728:
	movs r2, #0
	mov r3, r9
	ldrb r0, [r3]
	adds r1, #1
	subs r0, r0, r1
	adds r7, r1, #0
	cmp r2, r0
	bge _08094774
	ldr r0, _08094788  @ gUnknown_0200D6E0
	mov r8, r0
_0809473C:
	adds r6, r2, #1
	lsls r0, r6, #2
	mov r1, r8
	adds r5, r0, r1
	ldr r4, [r5]
	ldr r1, [r4]
	adds r1, #0x29
	lsls r0, r2, #2
	mov r3, r8
	adds r2, r0, r3
	ldr r3, [r2]
	ldr r0, [r3]
	adds r0, #0x29
	ldrb r1, [r1]
	ldrb r0, [r0]
	cmp r1, r0
	bls _08094766
	str r4, [r2]
	str r3, [r5]
	movs r0, #1
	mov sl, r0
_08094766:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r1, r9
	ldrb r0, [r1]
	subs r0, r0, r7
	cmp r2, r0
	blt _0809473C
_08094774:
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	mov r2, ip
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt _08094728
	b _08094EC8
	.align 2, 0
_08094784: .4byte gUnknown_0200F158
_08094788: .4byte gUnknown_0200D6E0
_0809478C:
	movs r7, #0
	mov sl, r7
	movs r1, #0
	ldr r0, _08094800  @ gUnknown_0200F158
	mov ip, r0
	ldrb r0, [r0]
	subs r0, #1
	cmp sl, r0
	blt _080947A0
	b _08094EC8
_080947A0:
	ldr r2, _08094800  @ gUnknown_0200F158
	mov r9, r2
_080947A4:
	movs r2, #0
	mov r3, r9
	ldrb r0, [r3]
	adds r1, #1
	subs r0, r0, r1
	adds r7, r1, #0
	cmp r2, r0
	bge _080947F0
	ldr r0, _08094804  @ gUnknown_0200D6E0
	mov r8, r0
_080947B8:
	adds r6, r2, #1
	lsls r0, r6, #2
	mov r1, r8
	adds r5, r0, r1
	ldr r4, [r5]
	ldr r1, [r4]
	adds r1, #0x29
	lsls r0, r2, #2
	mov r3, r8
	adds r2, r0, r3
	ldr r3, [r2]
	ldr r0, [r3]
	adds r0, #0x29
	ldrb r1, [r1]
	ldrb r0, [r0]
	cmp r1, r0
	bcs _080947E2
	str r4, [r2]
	str r3, [r5]
	movs r0, #1
	mov sl, r0
_080947E2:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r1, r9
	ldrb r0, [r1]
	subs r0, r0, r7
	cmp r2, r0
	blt _080947B8
_080947F0:
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	mov r2, ip
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt _080947A4
	b _08094EC8
	.align 2, 0
_08094800: .4byte gUnknown_0200F158
_08094804: .4byte gUnknown_0200D6E0
_08094808:
	cmp r2, #0
	bne _08094888
	movs r7, #0
	mov sl, r7
	movs r1, #0
	ldr r0, _08094880  @ gUnknown_0200F158
	mov ip, r0
	ldrb r0, [r0]
	subs r0, #1
	cmp r2, r0
	blt _08094820
	b _08094EC8
_08094820:
	ldr r2, _08094880  @ gUnknown_0200F158
	mov r9, r2
_08094824:
	movs r2, #0
	mov r3, r9
	ldrb r0, [r3]
	adds r1, #1
	subs r0, r0, r1
	adds r7, r1, #0
	cmp r2, r0
	bge _08094870
	ldr r0, _08094884  @ gUnknown_0200D6E0
	mov r8, r0
_08094838:
	adds r6, r2, #1
	lsls r0, r6, #2
	mov r1, r8
	adds r5, r0, r1
	ldr r4, [r5]
	ldr r1, [r4]
	adds r1, #0x2a
	lsls r0, r2, #2
	mov r3, r8
	adds r2, r0, r3
	ldr r3, [r2]
	ldr r0, [r3]
	adds r0, #0x2a
	ldrb r1, [r1]
	ldrb r0, [r0]
	cmp r1, r0
	bls _08094862
	str r4, [r2]
	str r3, [r5]
	movs r0, #1
	mov sl, r0
_08094862:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r1, r9
	ldrb r0, [r1]
	subs r0, r0, r7
	cmp r2, r0
	blt _08094838
_08094870:
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	mov r2, ip
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt _08094824
	b _08094EC8
	.align 2, 0
_08094880: .4byte gUnknown_0200F158
_08094884: .4byte gUnknown_0200D6E0
_08094888:
	movs r7, #0
	mov sl, r7
	movs r1, #0
	ldr r0, _080948FC  @ gUnknown_0200F158
	mov ip, r0
	ldrb r0, [r0]
	subs r0, #1
	cmp sl, r0
	blt _0809489C
	b _08094EC8
_0809489C:
	ldr r2, _080948FC  @ gUnknown_0200F158
	mov r9, r2
_080948A0:
	movs r2, #0
	mov r3, r9
	ldrb r0, [r3]
	adds r1, #1
	subs r0, r0, r1
	adds r7, r1, #0
	cmp r2, r0
	bge _080948EC
	ldr r0, _08094900  @ gUnknown_0200D6E0
	mov r8, r0
_080948B4:
	adds r6, r2, #1
	lsls r0, r6, #2
	mov r1, r8
	adds r5, r0, r1
	ldr r4, [r5]
	ldr r1, [r4]
	adds r1, #0x2a
	lsls r0, r2, #2
	mov r3, r8
	adds r2, r0, r3
	ldr r3, [r2]
	ldr r0, [r3]
	adds r0, #0x2a
	ldrb r1, [r1]
	ldrb r0, [r0]
	cmp r1, r0
	bcs _080948DE
	str r4, [r2]
	str r3, [r5]
	movs r0, #1
	mov sl, r0
_080948DE:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r1, r9
	ldrb r0, [r1]
	subs r0, r0, r7
	cmp r2, r0
	blt _080948B4
_080948EC:
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	mov r2, ip
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt _080948A0
	b _08094EC8
	.align 2, 0
_080948FC: .4byte gUnknown_0200F158
_08094900: .4byte gUnknown_0200D6E0
_08094904:
	cmp r2, #0
	bne _08094984
	movs r7, #0
	mov sl, r7
	movs r1, #0
	ldr r0, _0809497C  @ gUnknown_0200F158
	mov ip, r0
	ldrb r0, [r0]
	subs r0, #1
	cmp r2, r0
	blt _0809491C
	b _08094EC8
_0809491C:
	ldr r2, _0809497C  @ gUnknown_0200F158
	mov r9, r2
_08094920:
	movs r2, #0
	mov r3, r9
	ldrb r0, [r3]
	adds r1, #1
	subs r0, r0, r1
	adds r7, r1, #0
	cmp r2, r0
	bge _0809496C
	ldr r0, _08094980  @ gUnknown_0200D6E0
	mov r8, r0
_08094934:
	adds r6, r2, #1
	lsls r0, r6, #2
	mov r1, r8
	adds r5, r0, r1
	ldr r4, [r5]
	ldr r1, [r4]
	adds r1, #0x2b
	lsls r0, r2, #2
	mov r3, r8
	adds r2, r0, r3
	ldr r3, [r2]
	ldr r0, [r3]
	adds r0, #0x2b
	ldrb r1, [r1]
	ldrb r0, [r0]
	cmp r1, r0
	bls _0809495E
	str r4, [r2]
	str r3, [r5]
	movs r0, #1
	mov sl, r0
_0809495E:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r1, r9
	ldrb r0, [r1]
	subs r0, r0, r7
	cmp r2, r0
	blt _08094934
_0809496C:
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	mov r2, ip
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt _08094920
	b _08094EC8
	.align 2, 0
_0809497C: .4byte gUnknown_0200F158
_08094980: .4byte gUnknown_0200D6E0
_08094984:
	movs r7, #0
	mov sl, r7
	movs r1, #0
	ldr r0, _080949F8  @ gUnknown_0200F158
	mov ip, r0
	ldrb r0, [r0]
	subs r0, #1
	cmp sl, r0
	blt _08094998
	b _08094EC8
_08094998:
	ldr r2, _080949F8  @ gUnknown_0200F158
	mov r9, r2
_0809499C:
	movs r2, #0
	mov r3, r9
	ldrb r0, [r3]
	adds r1, #1
	subs r0, r0, r1
	adds r7, r1, #0
	cmp r2, r0
	bge _080949E8
	ldr r0, _080949FC  @ gUnknown_0200D6E0
	mov r8, r0
_080949B0:
	adds r6, r2, #1
	lsls r0, r6, #2
	mov r1, r8
	adds r5, r0, r1
	ldr r4, [r5]
	ldr r1, [r4]
	adds r1, #0x2b
	lsls r0, r2, #2
	mov r3, r8
	adds r2, r0, r3
	ldr r3, [r2]
	ldr r0, [r3]
	adds r0, #0x2b
	ldrb r1, [r1]
	ldrb r0, [r0]
	cmp r1, r0
	bcs _080949DA
	str r4, [r2]
	str r3, [r5]
	movs r0, #1
	mov sl, r0
_080949DA:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r1, r9
	ldrb r0, [r1]
	subs r0, r0, r7
	cmp r2, r0
	blt _080949B0
_080949E8:
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	mov r2, ip
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt _0809499C
	b _08094EC8
	.align 2, 0
_080949F8: .4byte gUnknown_0200F158
_080949FC: .4byte gUnknown_0200D6E0
_08094A00:
	cmp r2, #0
	bne _08094A80
	movs r7, #0
	mov sl, r7
	movs r1, #0
	ldr r0, _08094A78  @ gUnknown_0200F158
	mov ip, r0
	ldrb r0, [r0]
	subs r0, #1
	cmp r2, r0
	blt _08094A18
	b _08094EC8
_08094A18:
	ldr r2, _08094A78  @ gUnknown_0200F158
	mov r9, r2
_08094A1C:
	movs r2, #0
	mov r3, r9
	ldrb r0, [r3]
	adds r1, #1
	subs r0, r0, r1
	adds r7, r1, #0
	cmp r2, r0
	bge _08094A68
	ldr r0, _08094A7C  @ gUnknown_0200D6E0
	mov r8, r0
_08094A30:
	adds r6, r2, #1
	lsls r0, r6, #2
	mov r1, r8
	adds r5, r0, r1
	ldr r4, [r5]
	ldr r1, [r4]
	adds r1, #0x2c
	lsls r0, r2, #2
	mov r3, r8
	adds r2, r0, r3
	ldr r3, [r2]
	ldr r0, [r3]
	adds r0, #0x2c
	ldrb r1, [r1]
	ldrb r0, [r0]
	cmp r1, r0
	bls _08094A5A
	str r4, [r2]
	str r3, [r5]
	movs r0, #1
	mov sl, r0
_08094A5A:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r1, r9
	ldrb r0, [r1]
	subs r0, r0, r7
	cmp r2, r0
	blt _08094A30
_08094A68:
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	mov r2, ip
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt _08094A1C
	b _08094EC8
	.align 2, 0
_08094A78: .4byte gUnknown_0200F158
_08094A7C: .4byte gUnknown_0200D6E0
_08094A80:
	movs r7, #0
	mov sl, r7
	movs r1, #0
	ldr r0, _08094AF4  @ gUnknown_0200F158
	mov ip, r0
	ldrb r0, [r0]
	subs r0, #1
	cmp sl, r0
	blt _08094A94
	b _08094EC8
_08094A94:
	ldr r2, _08094AF4  @ gUnknown_0200F158
	mov r9, r2
_08094A98:
	movs r2, #0
	mov r3, r9
	ldrb r0, [r3]
	adds r1, #1
	subs r0, r0, r1
	adds r7, r1, #0
	cmp r2, r0
	bge _08094AE4
	ldr r0, _08094AF8  @ gUnknown_0200D6E0
	mov r8, r0
_08094AAC:
	adds r6, r2, #1
	lsls r0, r6, #2
	mov r1, r8
	adds r5, r0, r1
	ldr r4, [r5]
	ldr r1, [r4]
	adds r1, #0x2c
	lsls r0, r2, #2
	mov r3, r8
	adds r2, r0, r3
	ldr r3, [r2]
	ldr r0, [r3]
	adds r0, #0x2c
	ldrb r1, [r1]
	ldrb r0, [r0]
	cmp r1, r0
	bcs _08094AD6
	str r4, [r2]
	str r3, [r5]
	movs r0, #1
	mov sl, r0
_08094AD6:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r1, r9
	ldrb r0, [r1]
	subs r0, r0, r7
	cmp r2, r0
	blt _08094AAC
_08094AE4:
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	mov r2, ip
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt _08094A98
	b _08094EC8
	.align 2, 0
_08094AF4: .4byte gUnknown_0200F158
_08094AF8: .4byte gUnknown_0200D6E0
_08094AFC:
	cmp r2, #0
	bne _08094B7C
	movs r7, #0
	mov sl, r7
	movs r1, #0
	ldr r0, _08094B74  @ gUnknown_0200F158
	mov ip, r0
	ldrb r0, [r0]
	subs r0, #1
	cmp r2, r0
	blt _08094B14
	b _08094EC8
_08094B14:
	ldr r2, _08094B74  @ gUnknown_0200F158
	mov r9, r2
_08094B18:
	movs r2, #0
	mov r3, r9
	ldrb r0, [r3]
	adds r1, #1
	subs r0, r0, r1
	adds r7, r1, #0
	cmp r2, r0
	bge _08094B64
	ldr r0, _08094B78  @ gUnknown_0200D6E0
	mov r8, r0
_08094B2C:
	adds r6, r2, #1
	lsls r0, r6, #2
	mov r1, r8
	adds r5, r0, r1
	ldr r4, [r5]
	ldr r1, [r4]
	adds r1, #0x2d
	lsls r0, r2, #2
	mov r3, r8
	adds r2, r0, r3
	ldr r3, [r2]
	ldr r0, [r3]
	adds r0, #0x2d
	ldrb r1, [r1]
	ldrb r0, [r0]
	cmp r1, r0
	bls _08094B56
	str r4, [r2]
	str r3, [r5]
	movs r0, #1
	mov sl, r0
_08094B56:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r1, r9
	ldrb r0, [r1]
	subs r0, r0, r7
	cmp r2, r0
	blt _08094B2C
_08094B64:
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	mov r2, ip
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt _08094B18
	b _08094EC8
	.align 2, 0
_08094B74: .4byte gUnknown_0200F158
_08094B78: .4byte gUnknown_0200D6E0
_08094B7C:
	movs r7, #0
	mov sl, r7
	movs r1, #0
	ldr r0, _08094BF0  @ gUnknown_0200F158
	mov ip, r0
	ldrb r0, [r0]
	subs r0, #1
	cmp sl, r0
	blt _08094B90
	b _08094EC8
_08094B90:
	ldr r2, _08094BF0  @ gUnknown_0200F158
	mov r9, r2
_08094B94:
	movs r2, #0
	mov r3, r9
	ldrb r0, [r3]
	adds r1, #1
	subs r0, r0, r1
	adds r7, r1, #0
	cmp r2, r0
	bge _08094BE0
	ldr r0, _08094BF4  @ gUnknown_0200D6E0
	mov r8, r0
_08094BA8:
	adds r6, r2, #1
	lsls r0, r6, #2
	mov r1, r8
	adds r5, r0, r1
	ldr r4, [r5]
	ldr r1, [r4]
	adds r1, #0x2d
	lsls r0, r2, #2
	mov r3, r8
	adds r2, r0, r3
	ldr r3, [r2]
	ldr r0, [r3]
	adds r0, #0x2d
	ldrb r1, [r1]
	ldrb r0, [r0]
	cmp r1, r0
	bcs _08094BD2
	str r4, [r2]
	str r3, [r5]
	movs r0, #1
	mov sl, r0
_08094BD2:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r1, r9
	ldrb r0, [r1]
	subs r0, r0, r7
	cmp r2, r0
	blt _08094BA8
_08094BE0:
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	mov r2, ip
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt _08094B94
	b _08094EC8
	.align 2, 0
_08094BF0: .4byte gUnknown_0200F158
_08094BF4: .4byte gUnknown_0200D6E0
_08094BF8:
	cmp r2, #0
	bne _08094C78
	movs r7, #0
	mov sl, r7
	movs r1, #0
	ldr r0, _08094C70  @ gUnknown_0200F158
	mov ip, r0
	ldrb r0, [r0]
	subs r0, #1
	cmp r2, r0
	blt _08094C10
	b _08094EC8
_08094C10:
	ldr r2, _08094C70  @ gUnknown_0200F158
	mov r9, r2
_08094C14:
	movs r2, #0
	mov r3, r9
	ldrb r0, [r3]
	adds r1, #1
	subs r0, r0, r1
	adds r7, r1, #0
	cmp r2, r0
	bge _08094C60
	ldr r0, _08094C74  @ gUnknown_0200D6E0
	mov r8, r0
_08094C28:
	adds r6, r2, #1
	lsls r0, r6, #2
	mov r1, r8
	adds r5, r0, r1
	ldr r4, [r5]
	ldr r1, [r4]
	adds r1, #0x2e
	lsls r0, r2, #2
	mov r3, r8
	adds r2, r0, r3
	ldr r3, [r2]
	ldr r0, [r3]
	adds r0, #0x2e
	ldrb r1, [r1]
	ldrb r0, [r0]
	cmp r1, r0
	bls _08094C52
	str r4, [r2]
	str r3, [r5]
	movs r0, #1
	mov sl, r0
_08094C52:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r1, r9
	ldrb r0, [r1]
	subs r0, r0, r7
	cmp r2, r0
	blt _08094C28
_08094C60:
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	mov r2, ip
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt _08094C14
	b _08094EC8
	.align 2, 0
_08094C70: .4byte gUnknown_0200F158
_08094C74: .4byte gUnknown_0200D6E0
_08094C78:
	movs r7, #0
	mov sl, r7
	movs r1, #0
	ldr r0, _08094CEC  @ gUnknown_0200F158
	mov ip, r0
	ldrb r0, [r0]
	subs r0, #1
	cmp sl, r0
	blt _08094C8C
	b _08094EC8
_08094C8C:
	ldr r2, _08094CEC  @ gUnknown_0200F158
	mov r9, r2
_08094C90:
	movs r2, #0
	mov r3, r9
	ldrb r0, [r3]
	adds r1, #1
	subs r0, r0, r1
	adds r7, r1, #0
	cmp r2, r0
	bge _08094CDC
	ldr r0, _08094CF0  @ gUnknown_0200D6E0
	mov r8, r0
_08094CA4:
	adds r6, r2, #1
	lsls r0, r6, #2
	mov r1, r8
	adds r5, r0, r1
	ldr r4, [r5]
	ldr r1, [r4]
	adds r1, #0x2e
	lsls r0, r2, #2
	mov r3, r8
	adds r2, r0, r3
	ldr r3, [r2]
	ldr r0, [r3]
	adds r0, #0x2e
	ldrb r1, [r1]
	ldrb r0, [r0]
	cmp r1, r0
	bcs _08094CCE
	str r4, [r2]
	str r3, [r5]
	movs r0, #1
	mov sl, r0
_08094CCE:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r1, r9
	ldrb r0, [r1]
	subs r0, r0, r7
	cmp r2, r0
	blt _08094CA4
_08094CDC:
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	mov r2, ip
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt _08094C90
	b _08094EC8
	.align 2, 0
_08094CEC: .4byte gUnknown_0200F158
_08094CF0: .4byte gUnknown_0200D6E0
_08094CF4:
	cmp r2, #0
	bne _08094D74
	movs r7, #0
	mov sl, r7
	movs r1, #0
	ldr r0, _08094D6C  @ gUnknown_0200F158
	mov ip, r0
	ldrb r0, [r0]
	subs r0, #1
	cmp r2, r0
	blt _08094D0C
	b _08094EC8
_08094D0C:
	ldr r2, _08094D6C  @ gUnknown_0200F158
	mov r9, r2
_08094D10:
	movs r2, #0
	mov r3, r9
	ldrb r0, [r3]
	adds r1, #1
	subs r0, r0, r1
	adds r7, r1, #0
	cmp r2, r0
	bge _08094D5C
	ldr r0, _08094D70  @ gUnknown_0200D6E0
	mov r8, r0
_08094D24:
	adds r6, r2, #1
	lsls r0, r6, #2
	mov r1, r8
	adds r5, r0, r1
	ldr r4, [r5]
	ldr r1, [r4]
	adds r1, #0x2f
	lsls r0, r2, #2
	mov r3, r8
	adds r2, r0, r3
	ldr r3, [r2]
	ldr r0, [r3]
	adds r0, #0x2f
	ldrb r1, [r1]
	ldrb r0, [r0]
	cmp r1, r0
	bls _08094D4E
	str r4, [r2]
	str r3, [r5]
	movs r0, #1
	mov sl, r0
_08094D4E:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r1, r9
	ldrb r0, [r1]
	subs r0, r0, r7
	cmp r2, r0
	blt _08094D24
_08094D5C:
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	mov r2, ip
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt _08094D10
	b _08094EC8
	.align 2, 0
_08094D6C: .4byte gUnknown_0200F158
_08094D70: .4byte gUnknown_0200D6E0
_08094D74:
	movs r7, #0
	mov sl, r7
	movs r1, #0
	ldr r0, _08094DE8  @ gUnknown_0200F158
	mov ip, r0
	ldrb r0, [r0]
	subs r0, #1
	cmp sl, r0
	blt _08094D88
	b _08094EC8
_08094D88:
	ldr r2, _08094DE8  @ gUnknown_0200F158
	mov r9, r2
_08094D8C:
	movs r2, #0
	mov r3, r9
	ldrb r0, [r3]
	adds r1, #1
	subs r0, r0, r1
	adds r7, r1, #0
	cmp r2, r0
	bge _08094DD8
	ldr r0, _08094DEC  @ gUnknown_0200D6E0
	mov r8, r0
_08094DA0:
	adds r6, r2, #1
	lsls r0, r6, #2
	mov r1, r8
	adds r5, r0, r1
	ldr r4, [r5]
	ldr r1, [r4]
	adds r1, #0x2f
	lsls r0, r2, #2
	mov r3, r8
	adds r2, r0, r3
	ldr r3, [r2]
	ldr r0, [r3]
	adds r0, #0x2f
	ldrb r1, [r1]
	ldrb r0, [r0]
	cmp r1, r0
	bcs _08094DCA
	str r4, [r2]
	str r3, [r5]
	movs r0, #1
	mov sl, r0
_08094DCA:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r1, r9
	ldrb r0, [r1]
	subs r0, r0, r7
	cmp r2, r0
	blt _08094DA0
_08094DD8:
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	mov r2, ip
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt _08094D8C
	b _08094EC8
	.align 2, 0
_08094DE8: .4byte gUnknown_0200F158
_08094DEC: .4byte gUnknown_0200D6E0
_08094DF0:
	cmp r2, #0
	bne _08094E64
	movs r7, #0
	mov sl, r7
	movs r1, #0
	ldr r0, _08094E5C  @ gUnknown_0200F158
	mov ip, r0
	ldrb r0, [r0]
	subs r0, #1
	cmp r2, r0
	bge _08094EC8
	ldr r2, _08094E5C  @ gUnknown_0200F158
	mov r9, r2
_08094E0A:
	movs r2, #0
	mov r3, r9
	ldrb r0, [r3]
	adds r1, #1
	subs r0, r0, r1
	mov r8, r1
	cmp r2, r0
	bge _08094E48
_08094E1A:
	adds r6, r2, #1
	lsls r0, r6, #2
	ldr r7, _08094E60  @ gUnknown_0200D6E0
	adds r5, r0, r7
	ldr r4, [r5]
	lsls r0, r2, #2
	adds r2, r0, r7
	ldr r3, [r2]
	ldrb r0, [r4, #0xa]
	ldrb r7, [r3, #0xa]
	cmp r0, r7
	bls _08094E3A
	str r4, [r2]
	str r3, [r5]
	movs r0, #1
	mov sl, r0
_08094E3A:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r3, r9
	ldrb r0, [r3]
	subs r0, r0, r1
	cmp r2, r0
	blt _08094E1A
_08094E48:
	mov r7, r8
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	mov r2, ip
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt _08094E0A
	b _08094EC8
	.align 2, 0
_08094E5C: .4byte gUnknown_0200F158
_08094E60: .4byte gUnknown_0200D6E0
_08094E64:
	movs r7, #0
	mov sl, r7
	movs r1, #0
	ldr r0, _08094ED4  @ gUnknown_0200F158
	mov ip, r0
	ldrb r0, [r0]
	subs r0, #1
	cmp sl, r0
	bge _08094EC8
	ldr r2, _08094ED4  @ gUnknown_0200F158
	mov r9, r2
_08094E7A:
	movs r2, #0
	mov r3, r9
	ldrb r0, [r3]
	adds r1, #1
	subs r0, r0, r1
	mov r8, r1
	cmp r2, r0
	bge _08094EB8
_08094E8A:
	adds r6, r2, #1
	lsls r0, r6, #2
	ldr r7, _08094ED8  @ gUnknown_0200D6E0
	adds r5, r0, r7
	ldr r4, [r5]
	lsls r0, r2, #2
	adds r2, r0, r7
	ldr r3, [r2]
	ldrb r0, [r4, #0xa]
	ldrb r7, [r3, #0xa]
	cmp r0, r7
	bcs _08094EAA
	str r4, [r2]
	str r3, [r5]
	movs r0, #1
	mov sl, r0
_08094EAA:
	lsls r0, r6, #0x18
	lsrs r2, r0, #0x18
	mov r3, r9
	ldrb r0, [r3]
	subs r0, r0, r1
	cmp r2, r0
	blt _08094E8A
_08094EB8:
	mov r7, r8
	lsls r0, r7, #0x18
	lsrs r1, r0, #0x18
	mov r2, ip
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt _08094E7A
_08094EC8:
	mov r3, sl
_08094ECA:
	cmp r3, #0
	bne _08094ED0
	b _08094FE0
_08094ED0:
	movs r0, #1
	b _08094FE2
	.align 2, 0
_08094ED4: .4byte gUnknown_0200F158
_08094ED8: .4byte gUnknown_0200D6E0
_08094EDC:
	cmp r2, #0
	bne _08094F5C
	movs r7, #0
	mov sl, r7
	movs r1, #0
	ldr r2, _08094F54  @ gUnknown_0200F158
	ldrb r0, [r2]
	subs r0, #1
	cmp sl, r0
	bge _08094FCE
_08094EF0:
	movs r5, #0
	ldrb r0, [r2]
	adds r1, #1
	subs r0, r0, r1
	mov r8, r1
	cmp r5, r0
	bge _08094F42
	ldr r0, _08094F58  @ gUnknown_0200D6E0
	mov r9, r0
_08094F02:
	adds r7, r5, #1
	lsls r0, r7, #2
	mov r1, r9
	adds r6, r0, r1
	ldr r0, [r6]
	ldr r0, [r0]
	bl sub_8092BE4
	adds r4, r0, #0
	lsls r0, r5, #2
	mov r2, r9
	adds r5, r0, r2
	ldr r0, [r5]
	ldr r0, [r0]
	bl sub_8092BE4
	cmp r4, r0
	ble _08094F32
	ldr r1, [r5]
	ldr r0, [r6]
	str r0, [r5]
	str r1, [r6]
	movs r3, #1
	mov sl, r3
_08094F32:
	lsls r0, r7, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _08094F54  @ gUnknown_0200F158
	ldrb r0, [r0]
	mov r7, r8
	subs r0, r0, r7
	cmp r5, r0
	blt _08094F02
_08094F42:
	mov r1, r8
	lsls r0, r1, #0x18
	lsrs r1, r0, #0x18
	ldr r2, _08094F54  @ gUnknown_0200F158
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt _08094EF0
	b _08094FCE
	.align 2, 0
_08094F54: .4byte gUnknown_0200F158
_08094F58: .4byte gUnknown_0200D6E0
_08094F5C:
	movs r3, #0
	mov sl, r3
	movs r1, #0
	ldr r2, _08094FD8  @ gUnknown_0200F158
	ldrb r0, [r2]
	subs r0, #1
	cmp sl, r0
	bge _08094FCE
_08094F6C:
	movs r5, #0
	ldrb r0, [r2]
	adds r1, #1
	subs r0, r0, r1
	mov r8, r1
	cmp r5, r0
	bge _08094FBE
	ldr r7, _08094FDC  @ gUnknown_0200D6E0
	mov r9, r7
_08094F7E:
	adds r7, r5, #1
	lsls r0, r7, #2
	mov r1, r9
	adds r6, r0, r1
	ldr r0, [r6]
	ldr r0, [r0]
	bl sub_8092BE4
	adds r4, r0, #0
	lsls r0, r5, #2
	mov r2, r9
	adds r5, r0, r2
	ldr r0, [r5]
	ldr r0, [r0]
	bl sub_8092BE4
	cmp r4, r0
	bge _08094FAE
	ldr r1, [r5]
	ldr r0, [r6]
	str r0, [r5]
	str r1, [r6]
	movs r3, #1
	mov sl, r3
_08094FAE:
	lsls r0, r7, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _08094FD8  @ gUnknown_0200F158
	ldrb r0, [r0]
	mov r7, r8
	subs r0, r0, r7
	cmp r5, r0
	blt _08094F7E
_08094FBE:
	mov r1, r8
	lsls r0, r1, #0x18
	lsrs r1, r0, #0x18
	ldr r2, _08094FD8  @ gUnknown_0200F158
	ldrb r0, [r2]
	subs r0, #1
	cmp r1, r0
	blt _08094F6C
_08094FCE:
	mov r2, sl
	cmp r2, #0
	beq _08094FE0
	movs r0, #1
	b _08094FE2
	.align 2, 0
_08094FD8: .4byte gUnknown_0200F158
_08094FDC: .4byte gUnknown_0200D6E0
_08094FE0:
	movs r0, #0
_08094FE2:
	add sp, #0x60
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8092BF0

	THUMB_FUNC_START CanPrepScreenSave
CanPrepScreenSave: @ 0x08094FF4
	push {lr}
	ldr r0, _08095014  @ gPlaySt
	movs r2, #0xe
	ldrsb r2, [r0, r2]
	ldr r0, _08095018  @ gGMData
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _0809501C
	adds r0, r2, #0
	subs r0, #0x24
	cmp r0, #0x13
	bhi _0809501C
	movs r0, #0
	b _0809501E
	.align 2, 0
_08095014: .4byte gPlaySt
_08095018: .4byte gGMData
_0809501C:
	movs r0, #1
_0809501E:
	pop {r1}
	bx r1

	THUMB_FUNC_END CanPrepScreenSave

	THUMB_FUNC_START sub_8095024
sub_8095024: @ 0x08095024
	push {r4, lr}
	bl GetActivePrepMenuItemIndex
	adds r4, r0, #0
	bl CheckInLinkArena
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08095048
	ldr r0, _08095044  @ gUnknown_08A18200
	lsls r1, r4, #1
	adds r1, r1, r4
	lsls r1, r1, #2
	adds r0, #8
	b _08095086
	.align 2, 0
_08095044: .4byte gUnknown_08A18200
_08095048:
	cmp r4, #4
	bne _08095064
	movs r0, #2
	bl sub_80A095C
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0809507C
	ldr r0, _08095060  @ gUnknown_08A18200
	ldr r0, [r0, #0x30]
	b _0809508A
	.align 2, 0
_08095060: .4byte gUnknown_08A18200
_08095064:
	cmp r4, #2
	bne _0809507C
	bl CanPrepScreenSave
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0809507C
	ldr r0, _08095078  @ gUnknown_08A18200
	ldr r0, [r0, #0x18]
	b _0809508A
	.align 2, 0
_08095078: .4byte gUnknown_08A18200
_0809507C:
	ldr r0, _08095090  @ gUnknown_08A18200
	lsls r1, r4, #1
	adds r1, r1, r4
	lsls r1, r1, #2
	adds r0, #4
_08095086:
	adds r1, r1, r0
	ldr r0, [r1]
_0809508A:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08095090: .4byte gUnknown_08A18200

	THUMB_FUNC_END sub_8095024

	THUMB_FUNC_START sub_8095094
sub_8095094: @ 0x08095094
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r3, #0
	movs r2, #0
	movs r5, #1
_0809509E:
	adds r0, r1, #0
	asrs r0, r2
	ands r0, r5
	cmp r0, #0
	beq _080950B2
	cmp r4, r3
	bne _080950B0
	adds r0, r2, #0
	b _080950BC
_080950B0:
	adds r3, #1
_080950B2:
	adds r2, #1
	cmp r2, #3
	ble _0809509E
	movs r0, #1
	negs r0, r0
_080950BC:
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8095094

	THUMB_FUNC_START sub_80950C4
sub_80950C4: @ 0x080950C4
	push {r4, lr}
	adds r3, r0, #0
	movs r2, #0
	movs r1, #0
	movs r4, #1
_080950CE:
	adds r0, r3, #0
	asrs r0, r1
	ands r0, r4
	cmp r0, #0
	beq _080950DA
	adds r2, #1
_080950DA:
	adds r1, #1
	cmp r1, #3
	ble _080950CE
	adds r0, r2, #0
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80950C4

	THUMB_FUNC_START sub_80950E8
sub_80950E8: @ 0x080950E8
	push {r4, r5, r6, lr}
	sub sp, #0x10
	adds r2, r0, #0
	adds r4, r1, #0
	mov r1, sp
	ldr r0, _0809512C  @ gUnknown_08205BB0
	ldm r0!, {r3, r5, r6}
	stm r1!, {r3, r5, r6}
	ldr r0, [r0]
	str r0, [r1]
	ldr r0, _08095130  @ Img_PrepWindow
	movs r1, #0xc0
	lsls r1, r1, #0x13
	adds r2, r2, r1
	adds r1, r2, #0
	bl Decompress
	ldr r0, _08095134  @ gPlaySt
	adds r0, #0x41
	ldrb r1, [r0]
	movs r0, #0xc
	ands r0, r1
	add r0, sp
	ldr r0, [r0]
	lsls r4, r4, #5
	adds r1, r4, #0
	movs r2, #0x20
	bl CopyToPaletteBuffer
	add sp, #0x10
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0809512C: .4byte gUnknown_08205BB0
_08095130: .4byte Img_PrepWindow
_08095134: .4byte gPlaySt

	THUMB_FUNC_END sub_80950E8

	THUMB_FUNC_START sub_8095138
sub_8095138: @ 0x08095138
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	mov r8, r0
	adds r7, r1, #0
	mov r9, r2
	mov sl, r3
	ldr r1, _080951AC  @ gUnknown_08A1A41C
	lsls r0, r2, #0xf
	lsrs r0, r0, #0x14
	movs r3, #0x80
	lsls r3, r3, #5
	adds r2, r3, #0
	adds r0, r0, r2
	lsls r6, r0, #0x10
	lsrs r2, r6, #0x10
	mov r0, r8
	bl CallARM_FillTileRect
	movs r5, #0
	cmp r5, r7
	bge _08095182
	mov r4, r8
	adds r4, #0x40
	adds r5, r7, #0
_0809516E:
	adds r0, r4, #0
	ldr r1, _080951B0  @ gUnknown_08A1A434
	lsrs r2, r6, #0x10
	bl CallARM_FillTileRect
	adds r4, #0x80
	subs r5, #1
	cmp r5, #0
	bne _0809516E
	adds r5, r7, #0
_08095182:
	lsls r0, r5, #7
	add r0, r8
	adds r0, #0x40
	ldr r1, _080951B4  @ gUnknown_08A1A474
	mov r4, sl
	lsls r2, r4, #0xc
	mov r4, r9
	lsls r3, r4, #0xf
	lsrs r3, r3, #0x14
	adds r2, r2, r3
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	bl CallARM_FillTileRect
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080951AC: .4byte gUnknown_08A1A41C
_080951B0: .4byte gUnknown_08A1A434
_080951B4: .4byte gUnknown_08A1A474

	THUMB_FUNC_END sub_8095138

.align 2, 0
