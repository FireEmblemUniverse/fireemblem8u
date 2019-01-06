	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	@ Computer/AI Phase (and berserk) order/sorting proc(s) (I think)

	THUMB_FUNC_START Loop6C_E_CPORDER
Loop6C_E_CPORDER: @ 0x08039788
	push {r4, lr}
	ldr r4, _080397A8  @ gUnknown_085A7F94
	ldr r2, _080397AC  @ gUnknown_0203AA04
	adds r2, #0x78
	ldrb r1, [r2]
	adds r3, r1, #1
	strb r3, [r2]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x16
	adds r1, r1, r4
	ldr r1, [r1]
	bl _call_via_r1
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080397A8: .4byte gUnknown_085A7F94
_080397AC: .4byte gUnknown_0203AA04

	THUMB_FUNC_START sub_80397B0
sub_80397B0: @ 0x080397B0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0xc
	mov r8, r0
	movs r5, #0
	ldr r0, _0803983C  @ gUnknown_0202BCF0
	ldrb r2, [r0, #0xf]
	mov r1, sp
	ldr r0, _08039840  @ gUnknown_080D80C4
	ldm r0!, {r3, r4, r6}
	stm r1!, {r3, r4, r6}
	movs r6, #0
	lsrs r0, r2, #6
	lsls r0, r0, #2
	mov r3, sp
	adds r1, r3, r0
	ldr r0, [r1]
	cmp r5, r0
	bge _08039814
	adds r7, r1, #0
	adds r4, r2, #1
_080397DC:
	adds r0, r4, #0
	bl GetUnitStruct
	adds r2, r0, #0
	ldr r0, [r2]
	cmp r0, #0
	beq _0803980A
	adds r0, r2, #0
	adds r0, #0x30
	ldrb r1, [r0]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #4
	bne _0803980A
	ldr r0, [r2, #0xc]
	ldr r1, _08039844  @ 0x00000427
	ands r0, r1
	cmp r0, #0
	bne _0803980A
	ldr r0, _08039848  @ gUnknown_0203AA04
	adds r0, r5, r0
	strb r4, [r0]
	adds r5, #1
_0803980A:
	adds r4, #1
	adds r6, #1
	ldr r0, [r7]
	cmp r6, r0
	blt _080397DC
_08039814:
	cmp r5, #0
	beq _08039830
	ldr r0, _08039848  @ gUnknown_0203AA04
	adds r2, r5, r0
	movs r1, #0
	strb r1, [r2]
	str r0, [r0, #0x74]
	ldr r1, _0803984C  @ gUnknown_03004F10
	ldr r0, _08039850  @ sub_8039CAC
	str r0, [r1]
	ldr r0, _08039854  @ gUnknown_085A7FCC
	mov r1, r8
	bl Proc_CreateBlockingChild
_08039830:
	add sp, #0xc
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803983C: .4byte gUnknown_0202BCF0
_08039840: .4byte gUnknown_080D80C4
_08039844: .4byte 0x00000427
_08039848: .4byte gUnknown_0203AA04
_0803984C: .4byte gUnknown_03004F10
_08039850: .4byte sub_8039CAC
_08039854: .4byte gUnknown_085A7FCC

	THUMB_FUNC_START sub_8039858
sub_8039858: @ 0x08039858
	push {r4, r5, lr}
	adds r5, r0, #0
	bl GetCurrentPhaseUnitCount
	adds r4, r0, #0
	cmp r4, #0
	beq _08039882
	bl sub_8039A50
	ldr r0, _08039888  @ gUnknown_0203AA04
	adds r2, r4, r0
	movs r1, #0
	strb r1, [r2]
	str r0, [r0, #0x74]
	ldr r1, _0803988C  @ gUnknown_03004F10
	ldr r0, _08039890  @ sub_8039CAC
	str r0, [r1]
	ldr r0, _08039894  @ gUnknown_085A7FCC
	adds r1, r5, #0
	bl Proc_CreateBlockingChild
_08039882:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08039888: .4byte gUnknown_0203AA04
_0803988C: .4byte gUnknown_03004F10
_08039890: .4byte sub_8039CAC
_08039894: .4byte gUnknown_085A7FCC

	THUMB_FUNC_START sub_8039898
sub_8039898: @ 0x08039898
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	movs r7, #0
	movs r0, #0
	mov r8, r0
	movs r6, #0
	ldrh r4, [r5, #0x1e]
	cmp r4, #0
	beq _08039916
_080398AE:
	adds r0, r5, #0
	adds r1, r4, #0
	bl CanUnitUseWeapon
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080398CA
	adds r0, r5, #0
	adds r1, r4, #0
	bl CanUnitUseStaff
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08039902
_080398CA:
	adds r0, r4, #0
	bl GetItemAttributes
	movs r1, #4
	ands r1, r0
	cmp r1, #0
	bne _08039928
	adds r0, r4, #0
	bl GetItemAttributes
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	beq _08039902
	adds r0, r4, #0
	bl GetItemMaxRange
	cmp r0, #1
	ble _080398F8
	adds r0, r7, #1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	b _08039902
_080398F8:
	mov r0, r8
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
_08039902:
	adds r6, #1
	cmp r6, #4
	bgt _08039916
	lsls r1, r6, #1
	adds r0, r5, #0
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r4, [r0]
	cmp r4, #0
	bne _080398AE
_08039916:
	cmp r7, #0
	beq _0803991E
	movs r0, #0x28
	b _0803992E
_0803991E:
	mov r0, r8
	cmp r0, #0
	bne _0803992C
	movs r0, #0x57
	b _0803992E
_08039928:
	movs r0, #0x48
	b _0803992E
_0803992C:
	movs r0, #0x14
_0803992E:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_START sub_8039938
sub_8039938: @ 0x08039938
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	movs r1, #0x1d
	ldrsb r1, [r5, r1]
	ldr r0, [r5, #4]
	ldrb r0, [r0, #0x12]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r4, r1, r0
	adds r0, r5, #0
	bl GetUnitLeader
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	adds r7, r3, #0
	ldr r6, [r5]
	ldr r0, [r5, #4]
	ldr r2, [r6, #0x28]
	ldr r0, [r0, #0x28]
	orrs r2, r0
	movs r0, #0x30
	ands r0, r2
	cmp r0, #0
	beq _0803996E
	adds r0, r4, #0
	subs r0, #0x95
	b _080399AA
_0803996E:
	ldrb r1, [r5, #0xa]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _080399A8
	lsls r0, r3, #8
	adds r4, r4, r0
	movs r0, #4
	ands r0, r2
	cmp r0, #0
	beq _0803998A
	adds r0, r4, #0
	adds r0, #0x3c
	b _080399AA
_0803998A:
	ldrb r0, [r6, #4]
	cmp r0, r7
	beq _0803999A
	movs r0, #0x80
	lsls r0, r0, #6
	ands r2, r0
	cmp r2, #0
	beq _080399A0
_0803999A:
	adds r0, r4, #0
	adds r0, #0x57
	b _080399AA
_080399A0:
	adds r0, r5, #0
	bl sub_8039898
	adds r4, r4, r0
_080399A8:
	adds r0, r4, #0
_080399AA:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_START GetCurrentPhaseUnitCount
GetCurrentPhaseUnitCount: @ 0x080399B0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0xc
	movs r5, #0
	ldr r0, _08039A3C  @ gUnknown_0202BCF0
	ldrb r2, [r0, #0xf]
	ldr r0, _08039A40  @ gUnknown_085A7F58
	ldr r0, [r0]
	mov r8, r0
	mov r1, sp
	ldr r0, _08039A44  @ gUnknown_080D80C4
	ldm r0!, {r3, r4, r6}
	stm r1!, {r3, r4, r6}
	movs r6, #0
	lsrs r0, r2, #6
	lsls r0, r0, #2
	mov r3, sp
	adds r1, r3, r0
	ldr r0, [r1]
	cmp r5, r0
	bge _08039A2C
	adds r7, r1, #0
	adds r4, r2, #1
_080399E0:
	adds r0, r4, #0
	bl GetUnitStruct
	adds r2, r0, #0
	ldr r0, [r2]
	cmp r0, #0
	beq _08039A22
	adds r0, r2, #0
	adds r0, #0x30
	ldrb r0, [r0]
	movs r1, #0xf
	ands r1, r0
	cmp r1, #2
	beq _08039A22
	cmp r1, #4
	beq _08039A22
	ldr r0, [r2, #0xc]
	ldr r1, _08039A48  @ 0x00000427
	ands r0, r1
	cmp r0, #0
	bne _08039A22
	ldr r0, _08039A4C  @ gUnknown_0203AA04
	adds r0, r5, r0
	strb r4, [r0]
	adds r0, r2, #0
	bl sub_8039938
	mov r1, r8
	adds r1, #4
	mov r8, r1
	subs r1, #4
	stm r1!, {r0}
	adds r5, #1
_08039A22:
	adds r4, #1
	adds r6, #1
	ldr r0, [r7]
	cmp r6, r0
	blt _080399E0
_08039A2C:
	adds r0, r5, #0
	add sp, #0xc
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08039A3C: .4byte gUnknown_0202BCF0
_08039A40: .4byte gUnknown_085A7F58
_08039A44: .4byte gUnknown_080D80C4
_08039A48: .4byte 0x00000427
_08039A4C: .4byte gUnknown_0203AA04

	THUMB_FUNC_START sub_8039A50
sub_8039A50: @ 0x08039A50
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	cmp r0, #1
	ble _08039AA6
	movs r5, #0
	subs r0, #2
	cmp r5, r0
	bgt _08039AA6
	mov ip, r0
	ldr r1, _08039AB4  @ gUnknown_085A7F58
	mov r9, r1
	ldr r1, _08039AB8  @ gUnknown_0203AA04
	mov r8, r1
_08039A6E:
	adds r4, r0, #0
	adds r6, r5, #1
	cmp r0, r5
	blt _08039A9E
	mov r7, r9
	mov r1, r8
	adds r3, r0, r1
_08039A7C:
	ldr r1, [r7]
	lsls r0, r4, #2
	adds r0, r0, r1
	ldr r2, [r0]
	ldr r1, [r0, #4]
	cmp r2, r1
	bls _08039A96
	str r1, [r0]
	str r2, [r0, #4]
	ldrb r1, [r3]
	ldrb r0, [r3, #1]
	strb r0, [r3]
	strb r1, [r3, #1]
_08039A96:
	subs r3, #1
	subs r4, #1
	cmp r4, r5
	bge _08039A7C
_08039A9E:
	adds r5, r6, #0
	mov r0, ip
	cmp r5, r0
	ble _08039A6E
_08039AA6:
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08039AB4: .4byte gUnknown_085A7F58
_08039AB8: .4byte gUnknown_0203AA04

	THUMB_FUNC_START CPORDER_End
CPORDER_End: @ 0x08039ABC
	push {lr}
	bl Proc_ClearNativeCallback
	pop {r0}
	bx r0

.align 2, 0
