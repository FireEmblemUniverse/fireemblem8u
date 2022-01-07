	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	THUMB_FUNC_START sub_80CC698
sub_80CC698: @ 0x080CC698
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r5, [r4, #0x14]
	adds r0, r5, #0
	adds r0, #0x31
	ldrb r0, [r0]
	cmp r0, #0
	bne _080CC6BA
	bl sub_8002670
	movs r0, #0x80
	lsls r0, r0, #1
	bl Sound_SetVolume80022EC
	movs r0, #0x34
	bl sub_8002620
_080CC6BA:
	adds r1, r5, #0
	adds r1, #0x30
	movs r0, #2
	strb r0, [r1]
	adds r0, r4, #0
	bl sub_80ADDD4
	adds r0, r4, #0
	bl Proc_End
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80CC698

	THUMB_FUNC_START sub_80CC6D4
sub_80CC6D4: @ 0x080CC6D4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	adds r7, r0, #0
	mov r0, sp
	ldr r1, _080CC6FC  @ gUnknown_08207044
	ldm r1!, {r2, r3, r4}
	stm r0!, {r2, r3, r4}
	ldr r0, _080CC700  @ gRAMChapterData
	ldrb r0, [r0, #0x1b]
	cmp r0, #2
	beq _080CC6F6
	cmp r0, #3
	beq _080CC704
_080CC6F6:
	movs r5, #1
	mov r9, r5
	b _080CC708
	.align 2, 0
_080CC6FC: .4byte gUnknown_08207044
_080CC700: .4byte gRAMChapterData
_080CC704:
	movs r0, #0xf
	mov r9, r0
_080CC708:
	adds r1, r7, #0
	adds r1, #0x31
	ldrb r0, [r1]
	cmp r0, #0
	bne _080CC7EE
	strb r0, [r1]
	adds r1, #3
	movs r0, #1
	strb r0, [r1]
	movs r6, #0
	movs r3, #0
	mov r8, r1
	ldr r1, _080CC7C8  @ gUnknown_0895DFA5
	mov sl, r1
_080CC724:
	lsls r4, r3, #2
	mov r2, sp
	adds r5, r2, r4
	ldrb r0, [r5]
	str r3, [sp, #0xc]
	bl GetUnitFromCharId
	adds r2, r0, #0
	ldr r3, [sp, #0xc]
	cmp r2, #0
	bne _080CC73C
	movs r6, #1
_080CC73C:
	ldr r0, [r2, #0xc]
	ldr r1, _080CC7CC  @ 0x00010004
	ands r0, r1
	cmp r0, #0
	beq _080CC748
	movs r6, #1
_080CC748:
	movs r1, #8
	ldrsb r1, [r2, r1]
	ldrb r0, [r5, #1]
	cmp r1, r0
	bge _080CC754
	movs r6, #1
_080CC754:
	ldr r0, [r2, #4]
	ldrb r2, [r0, #4]
	ldrb r0, [r5, #2]
	cmp r2, r0
	beq _080CC760
	movs r6, #1
_080CC760:
	ldr r1, _080CC7D0  @ gUnknown_0895DFA4
	lsls r2, r2, #1
	adds r0, r2, r1
	ldrb r0, [r0]
	cmp r0, #0
	bne _080CC778
	mov r5, sl
	adds r0, r2, r5
	ldrb r0, [r0]
	cmp r0, #0
	bne _080CC778
	movs r6, #1
_080CC778:
	cmp r6, #0
	bne _080CC7E0
	adds r1, r2, r1
	ldrb r3, [r1]
	cmp r3, #0
	beq _080CC79E
	mov r5, sl
	adds r0, r2, r5
	ldrb r0, [r0]
	cmp r0, #0
	bne _080CC798
	adds r0, r7, #0
	adds r0, #0x35
	strb r3, [r0]
	mov r0, r8
	strb r6, [r0]
_080CC798:
	ldrb r0, [r1]
	cmp r0, #0
	bne _080CC7B4
_080CC79E:
	mov r1, sl
	adds r0, r2, r1
	ldrb r1, [r0]
	cmp r1, #0
	beq _080CC7B4
	adds r3, r7, #0
	adds r3, #0x35
	movs r0, #0
	strb r1, [r3]
	mov r2, r8
	strb r0, [r2]
_080CC7B4:
	mov r3, sp
	adds r0, r3, r4
	ldrb r1, [r0]
	cmp r1, r9
	beq _080CC7D4
	mov r4, r9
	lsls r2, r4, #0x18
	adds r0, r7, #0
	lsrs r2, r2, #0x18
	b _080CC8E2
	.align 2, 0
_080CC7C8: .4byte gUnknown_0895DFA5
_080CC7CC: .4byte 0x00010004
_080CC7D0: .4byte gUnknown_0895DFA4
_080CC7D4:
	adds r0, r7, #0
	mov r1, r9
	movs r2, #2
	bl MakePromotionScreen
	b _080CC8E6
_080CC7E0:
	movs r6, #0
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #6
	bls _080CC724
	b _080CC8F0
_080CC7EE:
	cmp r0, #1
	bne _080CC864
	strb r0, [r1]
	adds r5, r7, #0
	adds r5, #0x34
	strb r0, [r5]
	adds r4, r7, #0
	adds r4, #0x33
	ldrb r0, [r4]
	bl GetUnitFromCharId
	adds r2, r0, #0
	ldr r0, [r2, #4]
	ldrb r2, [r0, #4]
	ldr r0, _080CC824  @ gUnknown_0895DFA4
	lsls r1, r2, #1
	adds r6, r1, r0
	ldrb r3, [r6]
	mov r8, r5
	cmp r3, #0
	bne _080CC828
	adds r0, #1
	adds r0, r1, r0
	ldrb r0, [r0]
	cmp r0, #0
	bne _080CC842
	b _080CC8F0
	.align 2, 0
_080CC824: .4byte gUnknown_0895DFA4
_080CC828:
	adds r0, #1
	adds r0, r1, r0
	ldrb r0, [r0]
	cmp r0, #0
	bne _080CC83C
	adds r1, r7, #0
	adds r1, #0x35
	strb r3, [r1]
	mov r5, r8
	strb r0, [r5]
_080CC83C:
	ldrb r0, [r6]
	cmp r0, #0
	bne _080CC8DC
_080CC842:
	ldr r0, _080CC860  @ gUnknown_0895DFA4
	lsls r1, r2, #1
	adds r0, #1
	adds r1, r1, r0
	ldrb r1, [r1]
	cmp r1, #0
	beq _080CC8DC
	adds r3, r7, #0
	adds r3, #0x35
	movs r0, #0
	strb r1, [r3]
	mov r1, r8
	strb r0, [r1]
	b _080CC8DC
	.align 2, 0
_080CC860: .4byte gUnknown_0895DFA4
_080CC864:
	cmp r0, #2
	bne _080CC8F0
	strb r0, [r1]
	adds r5, r7, #0
	adds r5, #0x34
	movs r0, #1
	strb r0, [r5]
	adds r4, r7, #0
	adds r4, #0x33
	ldrb r0, [r4]
	bl GetUnitFromCharId
	adds r2, r0, #0
	ldr r0, [r2, #4]
	ldrb r2, [r0, #4]
	ldr r0, _080CC8A4  @ gUnknown_0895DFA4
	lsls r1, r2, #1
	adds r6, r1, r0
	ldrb r3, [r6]
	mov r8, r5
	cmp r3, #0
	bne _080CC8A8
	adds r0, #1
	adds r0, r1, r0
	ldrb r0, [r0]
	cmp r0, #0
	bne _080CC8C2
	bl BMapDispResume
	bl RefreshBMapGraphics
	b _080CC8F0
	.align 2, 0
_080CC8A4: .4byte gUnknown_0895DFA4
_080CC8A8:
	adds r0, #1
	adds r0, r1, r0
	ldrb r0, [r0]
	cmp r0, #0
	bne _080CC8BC
	adds r1, r7, #0
	adds r1, #0x35
	strb r3, [r1]
	mov r3, r8
	strb r0, [r3]
_080CC8BC:
	ldrb r0, [r6]
	cmp r0, #0
	bne _080CC8DC
_080CC8C2:
	ldr r0, _080CC8EC  @ gUnknown_0895DFA4
	lsls r1, r2, #1
	adds r0, #1
	adds r1, r1, r0
	ldrb r1, [r1]
	cmp r1, #0
	beq _080CC8DC
	adds r3, r7, #0
	adds r3, #0x35
	movs r0, #0
	strb r1, [r3]
	mov r5, r8
	strb r0, [r5]
_080CC8DC:
	ldrb r1, [r4]
	adds r0, r7, #0
	movs r2, #1
_080CC8E2:
	bl MakePromotionScreen
_080CC8E6:
	movs r0, #1
	b _080CC8F2
	.align 2, 0
_080CC8EC: .4byte gUnknown_0895DFA4
_080CC8F0:
	movs r0, #2
_080CC8F2:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80CC6D4

	THUMB_FUNC_START PromotionInit_SetNullState
PromotionInit_SetNullState: @ 0x080CC904
	adds r0, #0x30
	movs r1, #0
	strb r1, [r0]
	movs r0, #0
	bx lr

	THUMB_FUNC_END PromotionInit_SetNullState

	THUMB_FUNC_START PromotionInit_Loop
PromotionInit_Loop: @ 0x080CC910
	push {r4, lr}
	adds r4, r0, #0
	adds r4, #0x30
	ldrb r1, [r4]
	cmp r1, #1
	beq _080CC938
	cmp r1, #1
	bgt _080CC926
	cmp r1, #0
	beq _080CC92C
	b _080CC938
_080CC926:
	cmp r1, #2
	beq _080CC934
	b _080CC938
_080CC92C:
	bl sub_80CC6D4
	strb r0, [r4]
	b _080CC938
_080CC934:
	bl Proc_Break
_080CC938:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END PromotionInit_Loop

	THUMB_FUNC_START sub_80CC940
sub_80CC940: @ 0x080CC940
	push {lr}
	adds r1, r0, #0
	ldr r0, _080CC984  @ gUnknown_08B126CC
	bl Proc_StartBlocking
	adds r2, r0, #0
	adds r0, #0x31
	movs r1, #0
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	str r1, [r2, #0x38]
	movs r0, #1
	negs r0, r0
	str r0, [r2, #0x3c]
	ldr r2, _080CC988  @ gBattleActor
	ldr r3, _080CC98C  @ gBattleTarget
	adds r0, r3, #0
	adds r0, #0x4a
	strh r1, [r0]
	adds r0, r2, #0
	adds r0, #0x4a
	strh r1, [r0]
	adds r0, r3, #0
	adds r0, #0x48
	strh r1, [r0]
	adds r2, #0x48
	strh r1, [r2]
	adds r1, r3, #0
	adds r1, #0x6f
	movs r0, #0xff
	strb r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_080CC984: .4byte gUnknown_08B126CC
_080CC988: .4byte gBattleActor
_080CC98C: .4byte gBattleTarget

	THUMB_FUNC_END sub_80CC940

	THUMB_FUNC_START sub_80CC990
sub_80CC990: @ 0x080CC990
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r2, [r5, #0x30]
	movs r0, #1
	negs r0, r0
	cmp r2, r0
	beq _080CC9B6
	ldr r3, _080CCA08  @ gBattleActor
	ldr r1, _080CCA0C  @ gBattleTarget
	ldr r0, [r5, #0x2c]
	lsls r2, r2, #1
	adds r0, #0x1e
	adds r0, r0, r2
	ldrh r2, [r0]
	adds r1, #0x4a
	strh r2, [r1]
	ldrh r0, [r0]
	adds r3, #0x4a
	strh r0, [r3]
_080CC9B6:
	ldr r0, [r5, #0x2c]
	bl GetUnitEquippedWeapon
	ldr r1, _080CCA08  @ gBattleActor
	ldr r2, _080CCA0C  @ gBattleTarget
	adds r3, r2, #0
	adds r3, #0x48
	movs r4, #0
	strh r0, [r3]
	adds r1, #0x48
	strh r0, [r1]
	adds r2, #0x6f
	movs r0, #0xff
	strb r0, [r2]
	ldr r0, _080CCA10  @ gUnknown_08B126CC
	adds r1, r5, #0
	bl Proc_StartBlocking
	adds r3, r0, #0
	adds r1, r3, #0
	adds r1, #0x31
	movs r0, #1
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x32
	strb r4, [r0]
	ldr r1, [r3, #0x14]
	ldr r0, [r1, #0x2c]
	ldr r0, [r0]
	ldrb r0, [r0, #4]
	adds r2, r3, #0
	adds r2, #0x33
	strb r0, [r2]
	ldr r0, [r1, #0x2c]
	str r0, [r3, #0x38]
	ldr r0, [r1, #0x30]
	str r0, [r3, #0x3c]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080CCA08: .4byte gBattleActor
_080CCA0C: .4byte gBattleTarget
_080CCA10: .4byte gUnknown_08B126CC

	THUMB_FUNC_END sub_80CC990

	THUMB_FUNC_START sub_80CCA14
sub_80CCA14: @ 0x080CCA14
	push {r4, r5, lr}
	adds r1, r0, #0
	ldr r0, _080CCA5C  @ gUnknown_08B126CC
	bl Proc_StartBlocking
	adds r5, r0, #0
	adds r2, r5, #0
	adds r2, #0x31
	movs r1, #0
	movs r0, #2
	strb r0, [r2]
	adds r0, r5, #0
	adds r0, #0x32
	strb r1, [r0]
	ldr r4, _080CCA60  @ gActionData
	ldrb r0, [r4, #0xc]
	bl GetUnit
	ldr r0, [r0]
	ldrb r0, [r0, #4]
	adds r1, r5, #0
	adds r1, #0x33
	strb r0, [r1]
	ldrb r0, [r4, #0xc]
	bl GetUnit
	str r0, [r5, #0x38]
	ldrb r0, [r4, #0x12]
	str r0, [r5, #0x3c]
	bl BMapDispSuspend
	bl MU_EndAll
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080CCA5C: .4byte gUnknown_08B126CC
_080CCA60: .4byte gActionData

	THUMB_FUNC_END sub_80CCA14

	THUMB_FUNC_START sub_80CCA64
sub_80CCA64: @ 0x080CCA64
	push {r4, lr}
	adds r4, r0, #0
	bl sub_8006978
	bl sub_8008250
	movs r0, #2
	movs r1, #0xf
	adds r2, r4, #0
	bl sub_8006A30
	movs r0, #0
	bl sub_8006B10
	movs r0, #1
	bl sub_8006AA8
	movs r0, #2
	bl sub_8006AA8
	movs r0, #4
	bl sub_8006AA8
	movs r0, #8
	bl sub_8006AA8
	movs r0, #0x40
	bl sub_8006AA8
	movs r0, #4
	bl sub_8006AF0
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80CCA64

	THUMB_FUNC_START sub_80CCAAC
sub_80CCAAC: @ 0x080CCAAC
	push {r4, r5, lr}
	sub sp, #0x20
	adds r4, r0, #0
	lsls r0, r1, #0x10
	lsrs r0, r0, #0x10
	adds r2, r4, #0
	adds r2, #0x44
	movs r3, #0
	movs r1, #0
	strh r1, [r2]
	adds r5, r4, #0
	adds r5, #0x46
	strb r3, [r5]
	adds r2, #3
	movs r1, #0x78
	strb r1, [r2]
	bl GetClassData
	ldrh r0, [r0]
	mov r1, sp
	bl GetStringFromIndexInBuffer
	mov r0, sp
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _080CCB16
	mov r4, sp
_080CCAE6:
	ldrb r0, [r4]
	bl sub_80B4108
	adds r1, r0, #0
	cmp r1, #0
	beq _080CCAFE
	ldrb r0, [r1, #5]
	ldrb r1, [r1, #4]
	subs r0, r0, r1
	ldrb r1, [r5]
	adds r0, r0, r1
	b _080CCB02
_080CCAFE:
	ldrb r0, [r5]
	adds r0, #4
_080CCB02:
	strb r0, [r5]
	adds r4, #1
	mov r0, sp
	adds r0, #0x13
	cmp r4, r0
	bgt _080CCB16
	movs r0, #0
	ldrsb r0, [r4, r0]
	cmp r0, #0
	bne _080CCAE6
_080CCB16:
	ldr r0, _080CCB34  @ gUnknown_08A36338
	ldr r1, _080CCB38  @ 0x06011000
	bl CopyDataWithPossibleUncomp
	ldr r0, _080CCB3C  @ gUnknown_08A372C0
	movs r1, #0xa0
	lsls r1, r1, #2
	movs r2, #0x40
	bl CopyToPaletteBuffer
	add sp, #0x20
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080CCB34: .4byte gUnknown_08A36338
_080CCB38: .4byte 0x06011000
_080CCB3C: .4byte gUnknown_08A372C0

	THUMB_FUNC_END sub_80CCAAC

	THUMB_FUNC_START sub_80CCB40
sub_80CCB40: @ 0x080CCB40
	push {r4, r5, r6, r7, lr}
	sub sp, #0x24
	adds r7, r0, #0
	adds r0, #0x41
	ldrb r1, [r0]
	lsls r1, r1, #1
	subs r0, #0x15
	adds r0, r0, r1
	ldrh r0, [r0]
	movs r6, #0x74
	bl GetClassData
	ldrh r0, [r0]
	add r1, sp, #4
	bl GetStringFromIndexInBuffer
	add r0, sp, #4
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _080CCBBC
	add r5, sp, #4
_080CCB6E:
	ldrb r0, [r5]
	bl sub_80B4108
	adds r4, r0, #0
	cmp r4, #0
	beq _080CCBA8
	ldr r3, [r4]
	cmp r3, #0
	beq _080CCBAA
	movs r1, #4
	ldrsb r1, [r4, r1]
	subs r1, r6, r1
	subs r1, #2
	movs r2, #6
	ldrsb r2, [r4, r2]
	adds r2, #6
	movs r0, #0x81
	lsls r0, r0, #7
	str r0, [sp]
	movs r0, #4
	bl PutSpriteExt
	movs r0, #5
	ldrsb r0, [r4, r0]
	movs r1, #4
	ldrsb r1, [r4, r1]
	subs r0, r0, r1
	adds r6, r6, r0
	b _080CCBAA
_080CCBA8:
	adds r6, #4
_080CCBAA:
	adds r5, #1
	mov r0, sp
	adds r0, #0x17
	cmp r5, r0
	bgt _080CCBBC
	movs r0, #0
	ldrsb r0, [r5, r0]
	cmp r0, #0
	bne _080CCB6E
_080CCBBC:
	adds r1, r7, #0
	adds r1, #0x44
	ldrh r0, [r1]
	cmp r0, #0xfe
	bhi _080CCBCA
	adds r0, #1
	strh r0, [r1]
_080CCBCA:
	add sp, #0x24
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80CCB40

	THUMB_FUNC_START sub_80CCBD4
sub_80CCBD4: @ 0x080CCBD4
	push {lr}
	bl sub_805A9E0
	ldr r0, _080CCBEC  @ gUnknown_030053A0
	bl sub_805AA28
	ldr r0, _080CCBF0  @ gUnknown_0201FADC
	bl sub_805AE14
	pop {r0}
	bx r0
	.align 2, 0
_080CCBEC: .4byte gUnknown_030053A0
_080CCBF0: .4byte gUnknown_0201FADC

	THUMB_FUNC_END sub_80CCBD4

	THUMB_FUNC_START sub_80CCBF4
sub_80CCBF4: @ 0x080CCBF4
	push {r4, lr}
	ldr r4, _080CCC1C  @ gUnknown_08A30800
	movs r0, #2
	bl GetBackgroundTileDataOffset
	adds r1, r0, #0
	ldr r0, _080CCC20  @ 0x06003000
	adds r1, r1, r0
	adds r0, r4, #0
	bl CopyDataWithPossibleUncomp
	ldr r0, _080CCC24  @ gBG2TilemapBuffer
	ldr r1, _080CCC28  @ gUnknown_08A30978
	movs r2, #0x8c
	lsls r2, r2, #5
	bl sub_80CCCE0
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080CCC1C: .4byte gUnknown_08A30800
_080CCC20: .4byte 0x06003000
_080CCC24: .4byte gBG2TilemapBuffer
_080CCC28: .4byte gUnknown_08A30978

	THUMB_FUNC_END sub_80CCBF4

	THUMB_FUNC_START sub_80CCC2C
sub_80CCC2C: @ 0x080CCC2C
	push {r4, r5, r6, lr}
	sub sp, #0x24
	adds r6, r0, #0
	ldr r0, _080CCC9C  @ gBG2TilemapBuffer
	movs r1, #6
	str r1, [sp]
	movs r1, #0
	str r1, [sp, #4]
	movs r1, #1
	str r1, [sp, #8]
	movs r1, #2
	movs r2, #1
	movs r3, #0xa
	bl DrawUiFrame
	movs r0, #0
	bl SetFontGlyphSet
	movs r0, #0
	bl SetFont
	ldrh r0, [r6, #0x2c]
	bl GetClassData
	ldrh r0, [r0]
	bl GetStringFromIndex
	ldr r4, _080CCCA0  @ gUnknown_02022D2E
	movs r5, #8
	str r5, [sp]
	str r0, [sp, #4]
	movs r0, #0
	adds r1, r4, #0
	movs r2, #0
	movs r3, #0
	bl DrawTextInline
	ldrh r0, [r6, #0x2e]
	bl GetClassData
	ldrh r0, [r0]
	bl GetStringFromIndex
	adds r4, #0x80
	str r5, [sp]
	str r0, [sp, #4]
	movs r0, #0
	adds r1, r4, #0
	movs r2, #0
	movs r3, #0
	bl DrawTextInline
	add sp, #0x24
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080CCC9C: .4byte gBG2TilemapBuffer
_080CCCA0: .4byte gUnknown_02022D2E

	THUMB_FUNC_END sub_80CCC2C

	THUMB_FUNC_START sub_80CCCA4
sub_80CCCA4: @ 0x080CCCA4
	push {lr}
	sub sp, #0x64
	mov r0, sp
	bl LoadSomeUnitStatThingUnlockIdk
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080CCCBE
	bl sub_80A2DE4
	mov r0, sp
	bl LoadSomeUnitStatThingUnlockIdk
_080CCCBE:
	mov r0, sp
	ldrb r1, [r0, #0xe]
	movs r0, #0x1c
	ands r0, r1
	cmp r0, #0
	beq _080CCCD6
	movs r0, #0xe0
	ands r0, r1
	cmp r0, #0
	beq _080CCCD6
	movs r0, #1
	b _080CCCD8
_080CCCD6:
	movs r0, #0
_080CCCD8:
	add sp, #0x64
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80CCCA4

	THUMB_FUNC_START sub_80CCCE0
sub_80CCCE0: @ 0x080CCCE0
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	lsls r2, r2, #0x10
	lsrs r5, r2, #0x10
	adds r4, r1, #2
	movs r2, #0xff
	ldr r0, [r1]
	ldrb r6, [r1]
	lsrs r3, r0, #8
	ands r3, r2
	lsls r1, r3, #0x10
	cmp r3, #0xc
	ble _080CCD28
_080CCCFA:
	asrs r0, r1, #0xa
	adds r2, r7, r0
	lsls r1, r6, #0x10
	asrs r0, r1, #0x10
	lsls r3, r3, #0x10
	cmp r0, #0
	blt _080CCD1A
_080CCD08:
	ldrh r0, [r4]
	adds r0, r5, r0
	strh r0, [r2]
	adds r4, #2
	adds r2, #2
	ldr r0, _080CCD30  @ 0xFFFF0000
	adds r1, r1, r0
	cmp r1, #0
	bge _080CCD08
_080CCD1A:
	ldr r1, _080CCD30  @ 0xFFFF0000
	adds r0, r3, r1
	lsrs r3, r0, #0x10
	lsls r1, r3, #0x10
	asrs r0, r1, #0x10
	cmp r0, #0xc
	bgt _080CCCFA
_080CCD28:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080CCD30: .4byte 0xFFFF0000

	THUMB_FUNC_END sub_80CCCE0

	THUMB_FUNC_START Make6C_PromotionSub
Make6C_PromotionSub: @ 0x080CCD34
	push {lr}
	adds r1, r0, #0
	ldr r0, _080CCD44  @ gUnknown_08B1271C
	bl Proc_StartBlocking
	pop {r1}
	bx r1
	.align 2, 0
_080CCD44: .4byte gUnknown_08B1271C

	THUMB_FUNC_END Make6C_PromotionSub

	THUMB_FUNC_START sub_80CCD48
sub_80CCD48: @ 0x080CCD48
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x20
	adds r5, r0, #0
	ldr r0, [r5, #0x14]
	str r0, [sp, #4]
	adds r1, r0, #0
	adds r1, #0x29
	movs r4, #0
	movs r0, #2
	strb r0, [r1]
	ldr r0, [sp, #4]
	adds r0, #0x38
	ldrb r0, [r0]
	adds r1, r5, #0
	adds r1, #0x42
	strh r0, [r1]
	movs r0, #9
	str r0, [r5, #0x50]
	ldr r0, _080CCE80  @ gBG0TilemapBuffer
	movs r1, #0
	bl BG_Fill
	ldr r0, _080CCE84  @ gBG1TilemapBuffer
	movs r1, #0
	bl BG_Fill
	ldr r0, _080CCE88  @ gBG2TilemapBuffer
	movs r1, #0
	bl BG_Fill
	bl LoadUiFrameGraphics
	bl LoadObjUIGfx
	movs r1, #1
	negs r1, r1
	movs r2, #0xfb
	lsls r2, r2, #1
	movs r0, #6
	str r0, [sp]
	movs r0, #0
	movs r3, #0x58
	bl sub_80CD47C
	bl sub_80CCBF4
	ldr r0, [r5, #0x50]
	movs r1, #0x8c
	lsls r1, r1, #1
	movs r2, #0x68
	bl sub_80CD408
	strh r4, [r5, #0x32]
	strh r4, [r5, #0x34]
	strh r4, [r5, #0x36]
	movs r4, #1
_080CCDC0:
	adds r0, r4, #0
	bl GetUnit
	mov sl, r0
	cmp r0, #0
	bne _080CCDCE
	b _080CCEEE
_080CCDCE:
	ldr r0, [r0]
	cmp r0, #0
	bne _080CCDD6
	b _080CCEEE
_080CCDD6:
	adds r1, r5, #0
	adds r1, #0x42
	ldrb r0, [r0, #4]
	ldrh r1, [r1]
	cmp r0, r1
	beq _080CCDE4
	b _080CCEEE
_080CCDE4:
	mov r1, sl
	ldr r0, [r1, #4]
	ldrb r0, [r0, #4]
	str r0, [sp, #8]
	mov r0, sl
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r9, r0
	movs r2, #0
	mov r8, r2
	adds r0, r5, #0
	adds r0, #0x4a
	str r0, [sp, #0x18]
	adds r1, r5, #0
	adds r1, #0x48
	str r1, [sp, #0x14]
	adds r2, r5, #0
	adds r2, #0x40
	str r2, [sp, #0xc]
	subs r0, #9
	str r0, [sp, #0x10]
	adds r3, r5, #0
	adds r3, #0x38
	adds r7, r5, #0
	adds r7, #0x32
	adds r6, r5, #0
	adds r6, #0x2c
_080CCE1E:
	ldr r1, [sp, #8]
	lsls r4, r1, #1
	add r4, r8
	ldr r2, _080CCE8C  @ gUnknown_0895DFA4
	adds r4, r4, r2
	ldrb r0, [r4]
	strh r0, [r6]
	ldrb r1, [r4]
	adds r0, r7, #0
	mov r2, r9
	str r3, [sp, #0x1c]
	bl sub_80CD570
	ldr r1, [sp, #0x18]
	add r1, r8
	strb r0, [r1]
	ldrb r0, [r4]
	bl GetClassData
	ldrh r0, [r0, #2]
	ldr r3, [sp, #0x1c]
	strh r0, [r3]
	adds r3, #2
	adds r7, #2
	adds r6, #2
	movs r0, #1
	add r8, r0
	mov r1, r8
	cmp r1, #1
	ble _080CCE1E
	mov r0, r9
	ldr r2, [sp, #0x14]
	strh r0, [r2]
	bl sub_80CCCA4
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080CCF02
	mov r1, sl
	ldr r0, [r1, #4]
	ldrb r0, [r0, #4]
	str r0, [sp, #8]
	cmp r0, #0x3e
	beq _080CCEB2
	cmp r0, #0x3e
	bgt _080CCE90
	cmp r0, #0x3d
	beq _080CCE98
	b _080CCF02
	.align 2, 0
_080CCE80: .4byte gBG0TilemapBuffer
_080CCE84: .4byte gBG1TilemapBuffer
_080CCE88: .4byte gBG2TilemapBuffer
_080CCE8C: .4byte gUnknown_0895DFA4
_080CCE90:
	ldr r2, [sp, #8]
	cmp r2, #0x47
	beq _080CCECC
	b _080CCF02
_080CCE98:
	movs r0, #0x7e
	strh r0, [r5, #0x30]
	adds r0, r5, #0
	adds r0, #0x36
	movs r1, #0x7e
	mov r2, r9
	bl sub_80CD570
	adds r1, r5, #0
	adds r1, #0x4c
	strb r0, [r1]
	movs r0, #0x7e
	b _080CCEE4
_080CCEB2:
	movs r0, #0x7f
	strh r0, [r5, #0x30]
	adds r0, r5, #0
	adds r0, #0x36
	movs r1, #0x7f
	mov r2, r9
	bl sub_80CD570
	adds r1, r5, #0
	adds r1, #0x4c
	strb r0, [r1]
	movs r0, #0x7f
	b _080CCEE4
_080CCECC:
	movs r0, #0x37
	strh r0, [r5, #0x30]
	adds r0, r5, #0
	adds r0, #0x36
	movs r1, #0x37
	mov r2, r9
	bl sub_80CD570
	adds r1, r5, #0
	adds r1, #0x4c
	strb r0, [r1]
	movs r0, #0x37
_080CCEE4:
	bl GetClassData
	ldrh r0, [r0, #2]
	strh r0, [r5, #0x3c]
	b _080CCF02
_080CCEEE:
	adds r4, #1
	adds r0, r5, #0
	adds r0, #0x40
	str r0, [sp, #0xc]
	adds r1, r5, #0
	adds r1, #0x41
	str r1, [sp, #0x10]
	cmp r4, #0x3f
	bgt _080CCF02
	b _080CCDC0
_080CCF02:
	ldrh r0, [r5, #0x32]
	cmp r0, #0
	bne _080CCF12
	ldrh r0, [r5, #0x34]
	cmp r0, #0
	bne _080CCF12
	strh r0, [r5, #0x34]
	strh r0, [r5, #0x32]
_080CCF12:
	movs r1, #0
	movs r0, #1
	ldr r2, [sp, #0xc]
	strb r0, [r2]
	ldr r0, [sp, #0x10]
	strb r1, [r0]
	adds r0, r5, #0
	ldr r1, [sp, #8]
	bl sub_80CCAAC
	adds r0, r5, #0
	bl sub_80CCB40
	bl LoadObjUIGfx
	adds r0, r5, #0
	bl Make6C_PromotionMenuSelect
	str r0, [r5, #0x54]
	ldr r1, [sp, #4]
	ldr r0, [r1, #0x14]
	adds r0, #0x31
	ldrb r0, [r0]
	cmp r0, #1
	bne _080CCF4E
	bl sub_8095A1C
	movs r0, #0xf
	bl BG_EnableSyncByMask
_080CCF4E:
	add sp, #0x20
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80CCD48

	THUMB_FUNC_START sub_80CCF60
sub_80CCF60: @ 0x080CCF60
	push {r4, lr}
	adds r4, r0, #0
	bl sub_8003D20
	bl Font_InitForUIDefault
	movs r0, #0xf
	bl BG_EnableSyncByMask
	movs r0, #0x80
	lsls r0, r0, #1
	movs r1, #2
	movs r2, #0
	bl sub_800680C
	adds r0, r4, #0
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #1
	adds r4, #0x38
	adds r4, r4, r0
	movs r1, #0
	ldrsh r0, [r4, r1]
	bl sub_80CCA64
	movs r0, #1
	negs r0, r0
	bl sub_8006AF0
	ldr r3, _080CD004  @ gLCDControlBuffer
	ldrb r2, [r3, #0xc]
	movs r1, #4
	negs r1, r1
	adds r0, r1, #0
	ands r0, r2
	strb r0, [r3, #0xc]
	ldrb r2, [r3, #0x10]
	adds r0, r1, #0
	ands r0, r2
	movs r2, #2
	orrs r0, r2
	strb r0, [r3, #0x10]
	ldrb r0, [r3, #0x14]
	ands r1, r0
	movs r0, #1
	orrs r1, r0
	strb r1, [r3, #0x14]
	ldrb r0, [r3, #0x18]
	movs r1, #3
	orrs r0, r1
	strb r0, [r3, #0x18]
	movs r0, #0xf
	bl BG_EnableSyncByMask
	ldr r3, _080CD008  @ 0x04000008
	ldrh r2, [r3]
	ldr r1, _080CD00C  @ 0x0000FFFC
	adds r0, r1, #0
	ands r0, r2
	adds r0, #1
	strh r0, [r3]
	adds r3, #2
	ldrh r2, [r3]
	adds r0, r1, #0
	ands r0, r2
	adds r0, #1
	strh r0, [r3]
	adds r3, #2
	ldrh r2, [r3]
	adds r0, r1, #0
	ands r0, r2
	adds r0, #1
	strh r0, [r3]
	ldr r2, _080CD010  @ 0x0400000E
	ldrh r0, [r2]
	ands r1, r0
	adds r1, #1
	strh r1, [r2]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080CD004: .4byte gLCDControlBuffer
_080CD008: .4byte 0x04000008
_080CD00C: .4byte 0x0000FFFC
_080CD010: .4byte 0x0400000E

	THUMB_FUNC_END sub_80CCF60

	THUMB_FUNC_START sub_80CD014
sub_80CD014: @ 0x080CD014
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x5c
	mov r9, r0
	ldr r0, _080CD06C  @ gUnknown_030053A0
	ldr r1, [r0, #0x14]
	str r1, [sp, #0x50]
	ldr r2, [r0, #0x18]
	str r2, [sp, #0x54]
	ldr r1, _080CD070  @ gUnknown_0201FADC
	ldr r7, [r1, #0x14]
	ldr r1, [r1, #0x18]
	mov sl, r1
	mov r3, r9
	adds r3, #0x40
	ldrb r1, [r3]
	adds r4, r0, #0
	cmp r1, #1
	beq _080CD042
	b _080CD164
_080CD042:
	ldrh r2, [r7, #0x32]
	movs r0, #0x32
	ldrsh r1, [r7, r0]
	ldr r0, _080CD074  @ 0x00000117
	cmp r1, r0
	bgt _080CD08C
	adds r0, r2, #0
	adds r0, #0xc
	strh r0, [r7, #0x32]
	mov r1, sl
	ldrh r0, [r1, #0x32]
	adds r0, #0xc
	strh r0, [r1, #0x32]
	ldr r2, [sp, #0x50]
	ldrh r0, [r2, #2]
	adds r0, #0xc
	strh r0, [r2, #2]
	ldr r3, [sp, #0x54]
	strh r0, [r3, #2]
	b _080CD090
	.align 2, 0
_080CD06C: .4byte gUnknown_030053A0
_080CD070: .4byte gUnknown_0201FADC
_080CD074: .4byte 0x00000117
_080CD078:
	ldr r0, _080CD088  @ gUnknown_0895EEA4
	adds r0, r2, r0
	ldrb r0, [r0]
	subs r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x58]
	b _080CD130
	.align 2, 0
_080CD088: .4byte gUnknown_0895EEA4
_080CD08C:
	movs r0, #2
	strb r0, [r3]
_080CD090:
	mov r0, r9
	adds r0, #0x40
	ldrb r0, [r0]
	cmp r0, #2
	beq _080CD09C
	b _080CD1AC
_080CD09C:
	bl sub_805A9E0
	ldr r0, _080CD198  @ gUnknown_030053A0
	bl sub_805AA28
	mov r1, r9
	adds r1, #0x42
	ldrh r4, [r1]
	subs r4, #1
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	movs r0, #0x41
	add r0, r9
	mov r8, r0
	ldrb r0, [r0]
	lsls r0, r0, #1
	mov r5, r9
	adds r5, #0x2c
	adds r0, r5, r0
	ldrh r6, [r0]
	ldr r2, _080CD19C  @ 0x0000FFFF
	str r2, [sp, #0x58]
	ldrh r0, [r1]
	bl GetUnitFromCharId
	adds r1, r0, #0
	add r0, sp, #4
	movs r2, #0x48
	bl memcpy
	mov r3, r8
	ldrb r0, [r3]
	lsls r0, r0, #1
	adds r5, r5, r0
	ldrh r0, [r5]
	bl GetClassData
	str r0, [sp, #8]
	ldr r5, [r0, #0x34]
	add r0, sp, #4
	bl GetUnitEquippedWeapon
	adds r2, r0, #0
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	add r3, sp, #0x4c
	add r0, sp, #4
	adds r1, r5, #0
	bl GetBattleAnimationId
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	movs r1, #0
	ldr r5, _080CD1A0  @ gUnknown_0895E0A4
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	lsls r0, r4, #3
	subs r3, r0, r4
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
_080CD116:
	lsls r0, r1, #0x10
	asrs r1, r0, #0x10
	adds r2, r1, r3
	adds r0, r2, r5
	ldrb r0, [r0]
	cmp r0, r6
	beq _080CD078
	adds r0, r1, #1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #6
	ble _080CD116
_080CD130:
	mov r1, r8
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	ldr r2, [sp, #0x58]
	lsls r1, r2, #0x10
	asrs r1, r1, #0x10
	ldrh r2, [r7, #0x32]
	adds r2, #0x28
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	movs r3, #6
	str r3, [sp]
	movs r3, #0x58
	bl sub_80CD47C
	ldr r0, _080CD1A4  @ gUnknown_0201FADC
	bl sub_805AE14
	mov r3, r9
	ldr r0, [r3, #0x50]
	movs r2, #0x32
	ldrsh r1, [r7, r2]
	movs r3, #0x3a
	ldrsh r2, [r7, r3]
	bl sub_80CD408
_080CD164:
	mov r1, r9
	adds r1, #0x40
	ldrb r0, [r1]
	ldr r4, _080CD198  @ gUnknown_030053A0
	cmp r0, #2
	bne _080CD1AC
	ldrh r2, [r7, #0x32]
	movs r3, #0x32
	ldrsh r0, [r7, r3]
	cmp r0, #0x82
	ble _080CD1A8
	movs r1, #0xc
	subs r0, r2, r1
	strh r0, [r7, #0x32]
	mov r2, sl
	ldrh r0, [r2, #0x32]
	subs r0, r0, r1
	strh r0, [r2, #0x32]
	ldr r3, [sp, #0x50]
	ldrh r0, [r3, #2]
	subs r0, r0, r1
	strh r0, [r3, #2]
	ldr r1, [sp, #0x54]
	strh r0, [r1, #2]
	b _080CD1AC
	.align 2, 0
_080CD198: .4byte gUnknown_030053A0
_080CD19C: .4byte 0x0000FFFF
_080CD1A0: .4byte gUnknown_0895E0A4
_080CD1A4: .4byte gUnknown_0201FADC
_080CD1A8:
	movs r0, #0
	strb r0, [r1]
_080CD1AC:
	adds r0, r4, #0
	bl sub_805A96C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080CD1BE
	adds r0, r4, #0
	bl sub_805A990
_080CD1BE:
	mov r0, r9
	bl sub_80CCB40
	add sp, #0x5c
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80CD014

	THUMB_FUNC_START sub_80CD1D4
sub_80CD1D4: @ 0x080CD1D4
	push {r4, r5, lr}
	ldr r4, [r0, #0x14]
	ldr r5, [r4, #0x14]
	adds r1, r5, #0
	adds r1, #0x31
	ldrb r1, [r1]
	cmp r1, #0
	beq _080CD208
	cmp r1, #1
	bne _080CD208
	bl Proc_End
	adds r0, r4, #0
	bl Proc_End
	adds r0, r5, #0
	bl Proc_End
	ldr r0, _080CD210  @ gUnknown_030053A0
	bl sub_805AA28
	ldr r0, _080CD214  @ gUnknown_0201FADC
	bl sub_805AE14
	bl sub_805A9E0
_080CD208:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080CD210: .4byte gUnknown_030053A0
_080CD214: .4byte gUnknown_0201FADC

	THUMB_FUNC_END sub_80CD1D4

	THUMB_FUNC_START sub_80CD218
sub_80CD218: @ 0x080CD218
	push {r4, r5, r6, lr}
	adds r1, r0, #0
	ldr r5, [r1, #0x14]
	ldr r4, [r5, #0x14]
	ldr r6, [r4, #0x14]
	adds r0, r4, #0
	adds r0, #0x31
	ldrb r0, [r0]
	cmp r0, #2
	bne _080CD27C
	adds r0, r1, #0
	bl Proc_End
	adds r0, r5, #0
	bl Proc_End
	adds r0, r4, #0
	bl Proc_End
	ldr r0, _080CD284  @ gUnknown_030053A0
	bl sub_805AA28
	ldr r0, _080CD288  @ gUnknown_0201FADC
	bl sub_805AE14
	bl sub_805A9E0
	ldr r1, _080CD28C  @ gActionData
	movs r0, #0
	strb r0, [r1, #0x11]
	adds r0, r6, #0
	movs r1, #2
	bl Proc_Goto
	bl BMapDispResume
	bl RefreshBMapGraphics
	bl RefreshEntityBmMaps
	bl RenderBmMap
	bl SMS_UpdateFromGameData
	bl MU_EndAll
	ldr r0, _080CD290  @ gActiveUnit
	ldr r0, [r0]
	bl MU_Create
_080CD27C:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080CD284: .4byte gUnknown_030053A0
_080CD288: .4byte gUnknown_0201FADC
_080CD28C: .4byte gActionData
_080CD290: .4byte gActiveUnit

	THUMB_FUNC_END sub_80CD218

	THUMB_FUNC_START sub_80CD294
sub_80CD294: @ 0x080CD294
	push {lr}
	adds r1, r0, #0
	ldr r0, [r1, #0x14]
	ldr r0, [r0, #0x14]
	adds r0, #0x31
	ldrb r0, [r0]
	cmp r0, #0
	bne _080CD2AE
	adds r0, r1, #0
	movs r1, #4
	bl Proc_Goto
	b _080CD2C6
_080CD2AE:
	cmp r0, #1
	bne _080CD2BA
	adds r0, r1, #0
	bl Proc_Break
	b _080CD2C6
_080CD2BA:
	cmp r0, #2
	bne _080CD2C6
	adds r0, r1, #0
	movs r1, #4
	bl Proc_Goto
_080CD2C6:
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80CD294

	THUMB_FUNC_START sub_80CD2CC
sub_80CD2CC: @ 0x080CD2CC
	push {lr}
	adds r1, r0, #0
	ldr r0, [r1, #0x14]
	ldr r0, [r0, #0x14]
	adds r0, #0x31
	ldrb r0, [r0]
	cmp r0, #0
	beq _080CD2E0
	cmp r0, #1
	bne _080CD2EA
_080CD2E0:
	adds r0, r1, #0
	movs r1, #5
	bl Proc_Goto
	b _080CD2F4
_080CD2EA:
	cmp r0, #2
	bne _080CD2F4
	adds r0, r1, #0
	bl Proc_Break
_080CD2F4:
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80CD2CC

	THUMB_FUNC_START sub_80CD2F8
sub_80CD2F8: @ 0x080CD2F8
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r4, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #1
	beq _080CD324
	cmp r0, #1
	bgt _080CD310
	cmp r0, #0
	beq _080CD314
	b _080CD328
_080CD310:
	cmp r0, #0xff
	bne _080CD328
_080CD314:
	adds r0, r5, #0
	bl Make6C_PromotionSub
	str r0, [r5, #0x34]
	adds r1, r4, #0
	adds r1, #0x29
	movs r0, #1
	strb r0, [r1]
_080CD324:
	movs r0, #0
	b _080CD32A
_080CD328:
	movs r0, #1
_080CD32A:
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80CD2F8

	THUMB_FUNC_START sub_80CD330
sub_80CD330: @ 0x080CD330
	push {lr}
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #0
	blt _080CD346
	cmp r0, #1
	ble _080CD346
	cmp r0, #2
	bne _080CD346
	movs r0, #0
	b _080CD348
_080CD346:
	movs r0, #1
_080CD348:
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80CD330

	THUMB_FUNC_START sub_80CD34C
sub_80CD34C: @ 0x080CD34C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	movs r0, #1
	movs r1, #0x10
	movs r2, #0x10
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	movs r4, #0
	str r4, [sp]
	movs r0, #0
	movs r1, #1
	movs r2, #0
	movs r3, #0
	bl sub_8001ED0
	movs r0, #1
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #1
	movs r3, #1
	bl sub_8001F0C
	ldr r0, _080CD404  @ gLCDControlBuffer
	mov ip, r0
	ldrb r0, [r0, #1]
	movs r6, #0x20
	orrs r0, r6
	movs r1, #0x41
	negs r1, r1
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	mov r1, ip
	strb r0, [r1, #1]
	mov r0, ip
	adds r0, #0x2d
	strb r4, [r0]
	adds r0, #4
	strb r4, [r0]
	adds r1, #0x2c
	movs r0, #0xf0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0xa0
	strb r0, [r1]
	movs r2, #0x34
	add r2, ip
	mov r8, r2
	ldrb r1, [r2]
	movs r2, #1
	orrs r1, r2
	movs r0, #2
	orrs r1, r0
	movs r5, #4
	orrs r1, r5
	movs r4, #8
	orrs r1, r4
	movs r3, #0x10
	orrs r1, r3
	mov r7, ip
	adds r7, #0x36
	ldrb r0, [r7]
	orrs r0, r2
	movs r2, #3
	negs r2, r2
	ands r0, r2
	orrs r0, r5
	orrs r0, r4
	orrs r0, r3
	orrs r1, r6
	mov r2, r8
	strb r1, [r2]
	movs r1, #0x21
	negs r1, r1
	ands r0, r1
	strb r0, [r7]
	mov r1, ip
	adds r1, #0x3d
	ldrb r0, [r1]
	orrs r0, r6
	strb r0, [r1]
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080CD404: .4byte gLCDControlBuffer

	THUMB_FUNC_END sub_80CD34C

	THUMB_FUNC_START sub_80CD408
sub_80CD408: @ 0x080CD408
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r5, r1, #0
	adds r6, r2, #0
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	lsls r6, r6, #0x10
	lsrs r6, r6, #0x10
	ldr r4, _080CD46C  @ gUnknown_0201FADC
	movs r2, #0
	strh r0, [r4]
	movs r1, #0xe
	strh r1, [r4, #2]
	movs r1, #0xe0
	lsls r1, r1, #2
	strh r1, [r4, #4]
	strh r0, [r4, #6]
	movs r0, #0xf
	strh r0, [r4, #8]
	movs r0, #0xf0
	lsls r0, r0, #2
	strh r0, [r4, #0xa]
	strh r2, [r4, #0xc]
	ldr r0, _080CD470  @ 0x0000FFFF
	strh r0, [r4, #0xe]
	ldr r0, _080CD474  @ 0x06010000
	str r0, [r4, #0x1c]
	ldr r0, _080CD478  @ gUnknown_020145C8
	str r0, [r4, #0x20]
	adds r0, r4, #0
	bl sub_805AA68
	lsls r5, r5, #0x10
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	asrs r1, r5, #0x10
	movs r0, #0xc0
	lsls r0, r0, #0xf
	adds r5, r5, r0
	asrs r5, r5, #0x10
	str r6, [sp]
	adds r0, r4, #0
	adds r2, r6, #0
	adds r3, r5, #0
	bl sub_805AE40
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080CD46C: .4byte gUnknown_0201FADC
_080CD470: .4byte 0x0000FFFF
_080CD474: .4byte 0x06010000
_080CD478: .4byte gUnknown_020145C8

	THUMB_FUNC_END sub_80CD408

	THUMB_FUNC_START sub_80CD47C
sub_80CD47C: @ 0x080CD47C
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	mov r8, r0
	mov r9, r1
	lsls r2, r2, #0x10
	lsrs r7, r2, #0x10
	lsls r3, r3, #0x10
	lsrs r6, r3, #0x10
	ldr r2, _080CD53C  @ gKeyStatusPtr
	ldr r0, [r2]
	ldrh r1, [r0, #4]
	movs r0, #0xc
	ands r0, r1
	cmp r0, #0
	beq _080CD4A4
	ldr r1, _080CD540  @ gUnknown_03005408
	movs r0, #0
	strh r0, [r1]
_080CD4A4:
	ldr r0, [r2]
	ldrh r1, [r0, #8]
	movs r5, #0x80
	lsls r5, r5, #2
	adds r0, r5, #0
	ands r0, r1
	cmp r0, #0
	beq _080CD4BC
	ldr r1, _080CD540  @ gUnknown_03005408
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
_080CD4BC:
	bl NewEfxAnimeDrvProc
	ldr r4, _080CD544  @ gUnknown_030053A0
	movs r2, #0
	movs r1, #0
	strh r7, [r4, #2]
	strh r6, [r4, #4]
	movs r3, #1
	strh r3, [r4, #0xc]
	mov r0, r8
	strh r0, [r4, #6]
	mov r0, r9
	strh r0, [r4, #8]
	ldr r0, [sp, #0x1c]
	strh r0, [r4, #0xa]
	strb r2, [r4, #1]
	strh r5, [r4, #0xe]
	movs r0, #0xa
	strh r0, [r4, #0x10]
	ldr r0, _080CD548  @ gUnknown_02000088
	str r0, [r4, #0x1c]
	ldr r0, _080CD54C  @ gUnknown_020041C8
	str r0, [r4, #0x24]
	ldr r0, _080CD550  @ gUnknown_02004088
	str r0, [r4, #0x20]
	ldr r0, _080CD554  @ gUnknown_0200F1C8
	str r0, [r4, #0x28]
	ldr r0, _080CD558  @ gUnknown_030053E0
	str r0, [r4, #0x30]
	movs r2, #4
	strh r2, [r0]
	strh r1, [r0, #2]
	strh r1, [r0, #4]
	strh r1, [r0, #6]
	strh r1, [r0, #8]
	movs r1, #0xc0
	lsls r1, r1, #2
	strh r1, [r0, #0xe]
	movs r1, #8
	strh r1, [r0, #0x10]
	strh r5, [r0, #0xa]
	strh r2, [r0, #0xc]
	strh r3, [r0, #0x12]
	ldr r1, _080CD55C  @ gBG1TilemapBuffer
	str r1, [r0, #0x14]
	ldr r1, _080CD560  @ gUnknown_02017790
	str r1, [r0, #0x18]
	ldr r1, _080CD564  @ gUnknown_02019790
	str r1, [r0, #0x1c]
	ldr r1, _080CD568  @ gUnknown_0201A790
	str r1, [r0, #0x20]
	ldr r1, _080CD56C  @ sub_80CD34C
	str r1, [r0, #0x24]
	bl sub_806E8F0
	adds r0, r4, #0
	bl sub_805AA00
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080CD53C: .4byte gKeyStatusPtr
_080CD540: .4byte gUnknown_03005408
_080CD544: .4byte gUnknown_030053A0
_080CD548: .4byte gUnknown_02000088
_080CD54C: .4byte gUnknown_020041C8
_080CD550: .4byte gUnknown_02004088
_080CD554: .4byte gUnknown_0200F1C8
_080CD558: .4byte gUnknown_030053E0
_080CD55C: .4byte gBG1TilemapBuffer
_080CD560: .4byte gUnknown_02017790
_080CD564: .4byte gUnknown_02019790
_080CD568: .4byte gUnknown_0201A790
_080CD56C: .4byte sub_80CD34C

	THUMB_FUNC_END sub_80CD47C

	THUMB_FUNC_START sub_80CD570
sub_80CD570: @ 0x080CD570
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	lsls r1, r1, #0x10
	lsrs r7, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r6, r2, #0x10
	adds r0, r7, #0
	bl GetClassData
	ldr r5, [r0, #0x34]
	adds r0, r6, #0
	bl GetItemType
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	movs r0, #0
	strh r0, [r4]
	movs r2, #0
	b _080CD5A2
_080CD59C:
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
_080CD5A2:
	lsls r0, r2, #2
	adds r1, r0, r5
	ldrh r0, [r1]
	cmp r0, r3
	bne _080CD5B2
	ldrh r0, [r1, #2]
	subs r0, #1
	strh r0, [r4]
_080CD5B2:
	ldrh r0, [r1, #2]
	cmp r0, #0
	bne _080CD59C
	movs r1, #0
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _080CD5E8
	ldr r3, _080CD5C8  @ 0x00000109
	movs r2, #0
	b _080CD5D2
	.align 2, 0
_080CD5C8: .4byte 0x00000109
_080CD5CC:
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
_080CD5D2:
	lsls r0, r2, #2
	adds r1, r0, r5
	ldrh r0, [r1]
	cmp r0, r3
	bne _080CD5E2
	ldrh r0, [r1, #2]
	subs r0, #1
	strh r0, [r4]
_080CD5E2:
	ldrh r0, [r1, #2]
	cmp r0, #0
	bne _080CD5CC
_080CD5E8:
	cmp r6, #0
	beq _080CD60C
	adds r0, r6, #0
	bl GetItemRequiredExp
	adds r4, r0, #0
	adds r0, r7, #0
	bl GetClassData
	adds r5, r0, #0
	adds r0, r6, #0
	bl GetItemType
	adds r5, #0x2c
	adds r5, r5, r0
	ldrb r5, [r5]
	cmp r4, r5
	bge _080CD610
_080CD60C:
	movs r0, #0
	b _080CD612
_080CD610:
	movs r0, #1
_080CD612:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80CD570

	THUMB_FUNC_START sub_80CD618
sub_80CD618: @ 0x080CD618
	push {lr}
	ldr r0, _080CD628  @ gUnknown_08B127EC
	movs r1, #3
	bl Proc_Start
	pop {r0}
	bx r0
	.align 2, 0
_080CD628: .4byte gUnknown_08B127EC

	THUMB_FUNC_END sub_80CD618

	THUMB_FUNC_START sub_80CD62C
sub_80CD62C: @ 0x080CD62C
	push {lr}
	bl BMapDispResume
	bl RefreshBMapGraphics
	bl RefreshEntityBmMaps
	bl MU_EndAll
	ldr r0, _080CD654  @ gActiveUnit
	ldr r0, [r0]
	bl MU_Create
	bl RenderBmMap
	bl SMS_UpdateFromGameData
	pop {r0}
	bx r0
	.align 2, 0
_080CD654: .4byte gActiveUnit

	THUMB_FUNC_END sub_80CD62C

	THUMB_FUNC_START sub_80CD658
sub_80CD658: @ 0x080CD658
	push {r4, lr}
	adds r4, r0, #0
	bl sub_80CD668
	str r0, [r4, #0x30]
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80CD658

	THUMB_FUNC_START sub_80CD668
sub_80CD668: @ 0x080CD668
	push {lr}
	adds r1, r0, #0
	ldr r0, _080CD678  @ gUnknown_08B1280C
	bl Proc_StartBlocking
	pop {r1}
	bx r1
	.align 2, 0
_080CD678: .4byte gUnknown_08B1280C

	THUMB_FUNC_END sub_80CD668

	THUMB_FUNC_START sub_80CD67C
sub_80CD67C: @ 0x080CD67C
	push {r4, r5, r6, lr}
	ldr r5, _080CD6A4  @ gUnknown_03004980
	ldr r4, [r5]
	ldrh r6, [r4, #0x34]
	movs r0, #0x34
	ldrsh r1, [r4, r0]
	movs r0, #0xa8
	lsls r0, r0, #1
	cmp r1, r0
	bgt _080CD6A8
	ldr r3, [r5, #4]
	ldr r2, [r5, #8]
	ldr r1, [r5, #0xc]
	adds r0, r6, #4
	strh r0, [r4, #0x34]
	strh r0, [r1, #0x34]
	strh r0, [r2, #0x34]
	strh r0, [r3, #0x34]
	movs r0, #1
	b _080CD6AA
	.align 2, 0
_080CD6A4: .4byte gUnknown_03004980
_080CD6A8:
	movs r0, #0
_080CD6AA:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80CD67C

	THUMB_FUNC_START sub_80CD6B0
sub_80CD6B0: @ 0x080CD6B0
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, [r4, #0x14]
	adds r0, #0x38
	ldrb r0, [r0]
	strh r0, [r4, #0x2a]
	ldrh r0, [r4, #0x2a]
	bl GetUnitFromCharId
	cmp r0, #0
	beq _080CD6D4
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	adds r0, r4, #0
	adds r0, #0x2e
	strb r1, [r0]
	b _080CD6DC
_080CD6D4:
	adds r1, r4, #0
	adds r1, #0x2e
	movs r0, #0
	strb r0, [r1]
_080CD6DC:
	bl ResetFaces
	bl Font_InitForUIDefault
	bl LoadUiFrameGraphics
	bl LoadObjUIGfx
	ldr r4, _080CD788  @ gLCDControlBuffer
	ldrb r2, [r4, #0xc]
	movs r1, #4
	negs r1, r1
	adds r0, r1, #0
	ands r0, r2
	strb r0, [r4, #0xc]
	ldrb r2, [r4, #0x10]
	adds r0, r1, #0
	ands r0, r2
	movs r2, #2
	orrs r0, r2
	strb r0, [r4, #0x10]
	ldrb r0, [r4, #0x14]
	ands r1, r0
	movs r5, #1
	orrs r1, r5
	strb r1, [r4, #0x14]
	ldrb r0, [r4, #0x18]
	movs r1, #3
	orrs r0, r1
	strb r0, [r4, #0x18]
	movs r0, #2
	bl BG_EnableSyncByMask
	bl sub_8095A1C
	ldr r0, _080CD78C  @ gBG2TilemapBuffer
	movs r1, #0
	bl BG_Fill
	movs r0, #0xf
	bl BG_EnableSyncByMask
	ldrb r0, [r4, #1]
	orrs r0, r5
	movs r1, #3
	negs r1, r1
	ands r0, r1
	subs r1, #2
	ands r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r4, #1]
	movs r0, #0x80
	lsls r0, r0, #2
	movs r1, #3
	movs r2, #1
	bl sub_800680C
	movs r0, #1
	movs r1, #0xe
	movs r2, #8
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
	movs r1, #0
	movs r2, #0
	movs r3, #1
	bl sub_8001F0C
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080CD788: .4byte gLCDControlBuffer
_080CD78C: .4byte gBG2TilemapBuffer

	THUMB_FUNC_END sub_80CD6B0

	THUMB_FUNC_START sub_80CD790
sub_80CD790: @ 0x080CD790
	push {lr}
	ldr r0, [r0, #0x14]
	adds r0, #0x29
	movs r1, #0xff
	strb r1, [r0]
	bl sub_8010E50
	bl sub_8096C20
	bl APProc_DeleteAll
	bl EndBG3Slider_
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	movs r0, #4
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	movs r0, #8
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	movs r0, #0xf
	bl BG_EnableSyncByMask
	ldr r2, _080CD7F8  @ gLCDControlBuffer
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
	pop {r0}
	bx r0
	.align 2, 0
_080CD7F8: .4byte gLCDControlBuffer

	THUMB_FUNC_END sub_80CD790

	THUMB_FUNC_START sub_80CD7FC
sub_80CD7FC: @ 0x080CD7FC
	push {r4, r5, lr}
	sub sp, #0x1c
	adds r2, r0, #0
	add r1, sp, #0x10
	ldr r0, _080CD81C  @ gUnknown_0820707C
	ldm r0!, {r3, r4, r5}
	stm r1!, {r3, r4, r5}
	ldrh r0, [r2, #0x2a]
	cmp r0, #0x12
	beq _080CD820
	cmp r0, #0x12
	ble _080CD828
	cmp r0, #0x18
	beq _080CD824
	b _080CD828
	.align 2, 0
_080CD81C: .4byte gUnknown_0820707C
_080CD820:
	movs r5, #1
	b _080CD82A
_080CD824:
	movs r5, #2
	b _080CD82A
_080CD828:
	movs r5, #0
_080CD82A:
	adds r0, r2, #0
	adds r0, #0x2e
	ldrb r0, [r0]
	movs r4, #0
	str r4, [sp]
	movs r1, #0xd4
	movs r2, #0x50
	movs r3, #0x82
	bl sub_8007938
	lsls r0, r5, #2
	add r0, sp
	adds r0, #0x10
	ldr r0, [r0]
	str r0, [sp]
	ldr r0, _080CD88C  @ 0x06011800
	str r0, [sp, #4]
	movs r5, #1
	negs r5, r5
	str r5, [sp, #8]
	str r4, [sp, #0xc]
	movs r0, #0x16
	movs r1, #0x12
	movs r2, #0x12
	movs r3, #4
	bl sub_808F128
	movs r0, #0xa
	bl sub_808E9D8
	ldr r1, _080CD890  @ gUnknown_03004980
	ldr r2, [r1]
	movs r0, #0x82
	str r0, [r2, #0x30]
	ldr r3, [r1, #4]
	ldr r2, [r1, #8]
	ldr r1, [r1, #0xc]
	movs r0, #0x80
	lsls r0, r0, #7
	str r0, [r1, #0x30]
	str r0, [r2, #0x30]
	str r0, [r3, #0x30]
	ldr r0, _080CD894  @ gUnknown_03005398
	strb r5, [r0]
	add sp, #0x1c
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080CD88C: .4byte 0x06011800
_080CD890: .4byte gUnknown_03004980
_080CD894: .4byte gUnknown_03005398

	THUMB_FUNC_END sub_80CD7FC

	THUMB_FUNC_START sub_80CD898
sub_80CD898: @ 0x080CD898
	push {r4, r5, lr}
	sub sp, #0x1c
	add r2, sp, #0x10
	ldr r1, _080CD8B4  @ gUnknown_08207088
	ldm r1!, {r3, r4, r5}
	stm r2!, {r3, r4, r5}
	ldrh r0, [r0, #0x2a]
	cmp r0, #0x12
	beq _080CD8B8
	cmp r0, #0x12
	ble _080CD8C0
	cmp r0, #0x18
	beq _080CD8BC
	b _080CD8C0
	.align 2, 0
_080CD8B4: .4byte gUnknown_08207088
_080CD8B8:
	movs r0, #1
	b _080CD8C2
_080CD8BC:
	movs r0, #2
	b _080CD8C2
_080CD8C0:
	movs r0, #0
_080CD8C2:
	lsls r0, r0, #2
	add r0, sp
	adds r0, #0x10
	ldr r0, [r0]
	str r0, [sp]
	ldr r0, _080CD8F4  @ 0x06011800
	str r0, [sp, #4]
	movs r0, #1
	negs r0, r0
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	movs r0, #0x16
	movs r1, #0x12
	movs r2, #0x12
	movs r3, #4
	bl sub_808F128
	movs r0, #0xa
	bl sub_808E9D8
	add sp, #0x1c
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080CD8F4: .4byte 0x06011800

	THUMB_FUNC_END sub_80CD898

	THUMB_FUNC_START sub_80CD8F8
sub_80CD8F8: @ 0x080CD8F8
	push {r4, r5, lr}
	sub sp, #0x1c
	add r2, sp, #0x10
	ldr r1, _080CD914  @ gUnknown_08207094
	ldm r1!, {r3, r4, r5}
	stm r2!, {r3, r4, r5}
	ldrh r0, [r0, #0x2a]
	cmp r0, #0x12
	beq _080CD918
	cmp r0, #0x12
	ble _080CD920
	cmp r0, #0x18
	beq _080CD91C
	b _080CD920
	.align 2, 0
_080CD914: .4byte gUnknown_08207094
_080CD918:
	movs r0, #1
	b _080CD922
_080CD91C:
	movs r0, #2
	b _080CD922
_080CD920:
	movs r0, #0
_080CD922:
	lsls r0, r0, #2
	add r0, sp
	adds r0, #0x10
	ldr r0, [r0]
	str r0, [sp]
	ldr r0, _080CD954  @ 0x06011800
	str r0, [sp, #4]
	movs r0, #1
	negs r0, r0
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	movs r0, #0x16
	movs r1, #0x12
	movs r2, #0x12
	movs r3, #4
	bl sub_808F128
	movs r0, #0xa
	bl sub_808E9D8
	add sp, #0x1c
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080CD954: .4byte 0x06011800

	THUMB_FUNC_END sub_80CD8F8

	THUMB_FUNC_START sub_80CD958
sub_80CD958: @ 0x080CD958
	push {r4, r5, lr}
	sub sp, #0x1c
	add r2, sp, #0x10
	ldr r1, _080CD974  @ gUnknown_082070A0
	ldm r1!, {r3, r4, r5}
	stm r2!, {r3, r4, r5}
	ldrh r0, [r0, #0x2a]
	cmp r0, #0x12
	beq _080CD978
	cmp r0, #0x12
	ble _080CD980
	cmp r0, #0x18
	beq _080CD97C
	b _080CD980
	.align 2, 0
_080CD974: .4byte gUnknown_082070A0
_080CD978:
	movs r0, #1
	b _080CD982
_080CD97C:
	movs r0, #2
	b _080CD982
_080CD980:
	movs r0, #0
_080CD982:
	lsls r0, r0, #2
	add r0, sp
	adds r0, #0x10
	ldr r0, [r0]
	str r0, [sp]
	ldr r0, _080CD9B4  @ 0x06011800
	str r0, [sp, #4]
	movs r0, #1
	negs r0, r0
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	movs r0, #0x16
	movs r1, #0x12
	movs r2, #0x12
	movs r3, #4
	bl sub_808F128
	movs r0, #0xa
	bl sub_808E9D8
	add sp, #0x1c
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080CD9B4: .4byte 0x06011800

	THUMB_FUNC_END sub_80CD958

	THUMB_FUNC_START sub_80CD9B8
sub_80CD9B8: @ 0x080CD9B8
	push {r4, r5, lr}
	sub sp, #0x1c
	adds r2, r0, #0
	add r1, sp, #0x10
	ldr r0, _080CD9D8  @ gUnknown_082070AC
	ldm r0!, {r3, r4, r5}
	stm r1!, {r3, r4, r5}
	ldrh r0, [r2, #0x2a]
	cmp r0, #0x12
	beq _080CD9DC
	cmp r0, #0x12
	ble _080CD9E4
	cmp r0, #0x18
	beq _080CD9E0
	b _080CD9E4
	.align 2, 0
_080CD9D8: .4byte gUnknown_082070AC
_080CD9DC:
	movs r0, #1
	b _080CD9E6
_080CD9E0:
	movs r0, #2
	b _080CD9E6
_080CD9E4:
	movs r0, #0
_080CD9E6:
	lsls r0, r0, #2
	add r0, sp
	adds r0, #0x10
	ldr r0, [r0]
	movs r1, #1
	negs r1, r1
	cmp r0, r1
	bne _080CDA00
	adds r0, r2, #0
	movs r1, #3
	bl Proc_Goto
	b _080CDA1E
_080CDA00:
	str r0, [sp]
	ldr r0, _080CDA28  @ 0x06011800
	str r0, [sp, #4]
	str r1, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	movs r0, #0x16
	movs r1, #0x12
	movs r2, #0x12
	movs r3, #4
	bl sub_808F128
	movs r0, #0xa
	bl sub_808E9D8
_080CDA1E:
	add sp, #0x1c
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080CDA28: .4byte 0x06011800

	THUMB_FUNC_END sub_80CD9B8

	THUMB_FUNC_START sub_80CDA2C
sub_80CDA2C: @ 0x080CDA2C
	push {lr}
	bl sub_80CD658
	movs r0, #0
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80CDA2C

	THUMB_FUNC_START sub_80CDA38
sub_80CDA38: @ 0x080CDA38
	push {lr}
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #0xff
	beq _080CDA46
	movs r0, #1
	b _080CDA48
_080CDA46:
	movs r0, #0
_080CDA48:
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80CDA38

	THUMB_FUNC_START sub_80CDA4C
sub_80CDA4C: @ 0x080CDA4C
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r4, #0
	b _080CDA74
_080CDA54:
	lsls r1, r4, #2
	adds r0, r5, #0
	adds r0, #0x34
	adds r0, r0, r1
	ldr r1, [r0]
	ldr r0, [r1, #0x30]
	ldr r0, [r0, #0x10]
	cmp r0, #0
	bne _080CDA70
	adds r0, r1, #0
	adds r0, #0x34
	movs r1, #0
	bl Text_SetXCursor
_080CDA70:
	adds r4, #1
	adds r0, r5, #0
_080CDA74:
	adds r0, #0x60
	ldrb r0, [r0]
	cmp r4, r0
	blt _080CDA54
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80CDA4C

	THUMB_FUNC_START sub_80CDA84
sub_80CDA84: @ 0x080CDA84
	push {lr}
	bl SyncMenuBgs
	movs r0, #0
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80CDA84

	THUMB_FUNC_START sub_80CDA90
sub_80CDA90: @ 0x080CDA90
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080CDACC  @ gUnknown_02022DB8
	movs r1, #0xa
	movs r2, #6
	movs r3, #0
	bl TileMap_FillRect
	ldr r0, _080CDAD0  @ gUnknown_02023DB8
	movs r1, #0xa
	movs r2, #6
	movs r3, #0
	bl TileMap_FillRect
	ldr r0, _080CDAD4  @ gUnknown_03005380
	bl SetFont
	ldr r0, [r4, #0x14]
	bl sub_80CDA4C
	ldr r0, [r4, #0x14]
	bl RedrawMenu
	adds r0, r4, #0
	bl SyncMenuBgs
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080CDACC: .4byte gUnknown_02022DB8
_080CDAD0: .4byte gUnknown_02023DB8
_080CDAD4: .4byte gUnknown_03005380

	THUMB_FUNC_END sub_80CDA90

	THUMB_FUNC_START sub_80CDAD8
sub_80CDAD8: @ 0x080CDAD8
	push {r4, lr}
	adds r4, r0, #0
	adds r1, #0x3c
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bne _080CDB0A
	adds r0, r4, #0
	bl EndMenu
	ldr r0, [r4, #0x14]
	bl EndMenu
	ldr r0, _080CDB14  @ gUnknown_08B12614
	bl Proc_Find
	adds r4, r0, #0
	bl sub_80ADDD4
	bl sub_80CCBD4
	adds r0, r4, #0
	movs r1, #5
	bl Proc_Goto
_080CDB0A:
	movs r0, #7
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080CDB14: .4byte gUnknown_08B12614

	THUMB_FUNC_END sub_80CDAD8

	THUMB_FUNC_START sub_80CDB18
sub_80CDB18: @ 0x080CDB18
	movs r0, #0xb
	bx lr

	THUMB_FUNC_END sub_80CDB18

	THUMB_FUNC_START sub_80CDB1C
sub_80CDB1C: @ 0x080CDB1C
	push {lr}
	bl SyncMenuBgs
	movs r0, #0
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80CDB1C

	THUMB_FUNC_START sub_80CDB28
sub_80CDB28: @ 0x080CDB28
	push {lr}
	bl SyncMenuBgs
	movs r0, #0
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80CDB28

	THUMB_FUNC_START PromotionCommand_OnSelect
PromotionCommand_OnSelect: @ 0x080CDB34
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r7, r0, #0
	adds r6, r1, #0
	ldr r0, [r7, #0x14]
	ldr r0, [r0, #0x14]
	ldr r4, [r0, #0x14]
	adds r0, #0x40
	ldrb r0, [r0]
	cmp r0, #0
	bne _080CDBFA
	adds r0, r4, #0
	adds r0, #0x38
	ldrb r0, [r0]
	bl GetUnitFromCharId
	adds r5, r0, #0
	ldr r0, [r5, #4]
	ldrb r1, [r0, #4]
	adds r3, r6, #0
	adds r3, #0x3c
	movs r0, #0
	ldrsb r0, [r3, r0]
	cmp r0, #1
	bgt _080CDB78
	ldr r2, _080CDB74  @ gUnknown_0895DFA4
	lsls r1, r1, #1
	adds r0, r0, r1
	adds r0, r0, r2
	ldrb r1, [r0]
	b _080CDBA6
	.align 2, 0
_080CDB74: .4byte gUnknown_0895DFA4
_080CDB78:
	adds r2, r4, #0
	adds r2, #0x3b
	cmp r0, #2
	bne _080CDBAE
	cmp r1, #0x3e
	beq _080CDB9A
	cmp r1, #0x3e
	bgt _080CDB8E
	cmp r1, #0x3d
	beq _080CDB94
	b _080CDBA6
_080CDB8E:
	cmp r1, #0x47
	beq _080CDBA0
	b _080CDBA6
_080CDB94:
	movs r0, #0x7e
	strb r0, [r2]
	b _080CDBAE
_080CDB9A:
	movs r0, #0x7f
	strb r0, [r2]
	b _080CDBAE
_080CDBA0:
	movs r0, #0x37
	strb r0, [r2]
	b _080CDBAE
_080CDBA6:
	adds r0, r4, #0
	adds r0, #0x3b
	strb r1, [r0]
	adds r2, r0, #0
_080CDBAE:
	ldrb r0, [r2]
	cmp r0, #0x1e
	bgt _080CDBCA
	cmp r0, #0x1d
	blt _080CDBCA
	ldr r0, [r5, #0xc]
	movs r1, #0x80
	lsls r1, r1, #4
	ands r0, r1
	cmp r0, #0
	beq _080CDBCA
	adds r0, r5, #0
	bl TryRemoveUnitFromBallista
_080CDBCA:
	ldr r0, _080CDC04  @ gUnknown_03005360
	ldr r1, _080CDC08  @ 0x06001000
	movs r2, #0x80
	movs r3, #5
	bl Font_InitForUI
	ldr r0, _080CDC0C  @ gUnknown_02022DBA
	movs r1, #0xa
	movs r2, #6
	movs r3, #0
	bl TileMap_FillRect
	movs r0, #1
	bl BG_EnableSyncByMask
	ldr r0, _080CDC10  @ gUnknown_08B12930
	movs r1, #0
	str r1, [sp]
	str r7, [sp, #4]
	movs r1, #2
	movs r2, #0
	movs r3, #0
	bl StartMenuExt
_080CDBFA:
	movs r0, #0
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080CDC04: .4byte gUnknown_03005360
_080CDC08: .4byte 0x06001000
_080CDC0C: .4byte gUnknown_02022DBA
_080CDC10: .4byte gUnknown_08B12930

	THUMB_FUNC_END PromotionCommand_OnSelect

	THUMB_FUNC_START sub_80CDC14
sub_80CDC14: @ 0x080CDC14
	push {r4, lr}
	ldr r1, [r0, #0x14]
	ldr r4, [r1, #0x14]
	ldr r0, [r4, #0x14]
	ldr r0, [r0, #0x14]
	adds r0, #0x31
	ldrb r0, [r0]
	cmp r0, #0
	beq _080CDC2E
	cmp r0, #1
	beq _080CDC32
	cmp r0, #2
	beq _080CDC32
_080CDC2E:
	movs r0, #0
	b _080CDC42
_080CDC32:
	adds r0, r1, #0
	bl Proc_End
	adds r0, r4, #0
	movs r1, #2
	bl Proc_Goto
	movs r0, #0xb
_080CDC42:
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80CDC14

	THUMB_FUNC_START sub_80CDC48
sub_80CDC48: @ 0x080CDC48
	push {r4, r5, r6, r7, lr}
	sub sp, #0x20
	adds r7, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	ldr r1, [r5, #0x30]
	ldrb r0, [r1, #8]
	cmp r0, #0
	beq _080CDC64
	adds r0, r5, #0
	adds r0, #0x34
	ldrb r1, [r1, #8]
	bl Text_SetColorId
_080CDC64:
	adds r0, r5, #0
	adds r0, #0x3d
	ldrb r0, [r0]
	adds r4, r5, #0
	adds r4, #0x34
	cmp r0, #2
	bne _080CDC7A
	adds r0, r4, #0
	movs r1, #1
	bl Text_SetColorId
_080CDC7A:
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0x14
	bl sub_8003E00
	adds r0, r4, #0
	movs r1, #8
	bl Text_SetXCursor
	adds r0, r4, #0
	adds r1, r6, #0
	bl Text_AppendString
	adds r0, r7, #0
	adds r0, #0x64
	ldrb r0, [r0]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1e
	bl BG_GetMapBuffer
	adds r1, r0, #0
	movs r2, #0x2c
	ldrsh r0, [r5, r2]
	lsls r0, r0, #5
	movs r3, #0x2a
	ldrsh r2, [r5, r3]
	adds r0, r0, r2
	lsls r0, r0, #1
	adds r1, r1, r0
	adds r0, r4, #0
	bl Text_Draw
	add sp, #0x20
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80CDC48

	THUMB_FUNC_START PromotionCommand_OnTextDraw
PromotionCommand_OnTextDraw: @ 0x080CDCC4
	push {r4, r5, lr}
	sub sp, #0x48
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, [r4, #0x14]
	ldr r1, [r0, #0x14]
	adds r0, r5, #0
	adds r0, #0x3c
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #1
	adds r1, #0x2c
	adds r1, r1, r0
	ldrh r0, [r1]
	bl GetClassData
	ldrh r0, [r0]
	bl GetStringFromIndex
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_80CDC48
	add sp, #0x48
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END PromotionCommand_OnTextDraw

	THUMB_FUNC_START PromotionCommand_OnChange
PromotionCommand_OnChange: @ 0x080CDD00
	push {lr}
	ldr r0, [r0, #0x14]
	ldr r3, [r0, #0x14]
	adds r2, r3, #0
	adds r2, #0x40
	movs r0, #1
	strb r0, [r2]
	adds r1, #0x3c
	ldrb r0, [r1]
	adds r1, r3, #0
	adds r1, #0x41
	strb r0, [r1]
	ldrb r1, [r1]
	lsls r1, r1, #1
	adds r0, r3, #0
	adds r0, #0x38
	adds r0, r0, r1
	movs r1, #0
	ldrsh r0, [r0, r1]
	bl sub_80CCA64
	movs r0, #1
	negs r0, r0
	bl sub_8006AF0
	pop {r1}
	bx r1

	THUMB_FUNC_END PromotionCommand_OnChange

	THUMB_FUNC_START Usability_ThirdPromotionOption
Usability_ThirdPromotionOption: @ 0x080CDD38
	push {r4, lr}
	ldr r0, _080CDD6C  @ gUnknown_08B12A08
	bl Proc_Find
	ldr r0, [r0, #0x14]
	ldr r4, [r0, #0x14]
	bl sub_80CCCA4
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080CDD70
	adds r0, r4, #0
	adds r0, #0x38
	ldrb r0, [r0]
	bl GetUnitFromCharId
	ldr r0, [r0, #4]
	ldrb r0, [r0, #4]
	cmp r0, #0x3d
	blt _080CDD70
	cmp r0, #0x3e
	ble _080CDD68
	cmp r0, #0x47
	bne _080CDD70
_080CDD68:
	movs r0, #1
	b _080CDD72
	.align 2, 0
_080CDD6C: .4byte gUnknown_08B12A08
_080CDD70:
	movs r0, #3
_080CDD72:
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END Usability_ThirdPromotionOption

	THUMB_FUNC_START sub_80CDD78
sub_80CDD78: @ 0x080CDD78
	push {r4, r5, r6, lr}
	sub sp, #0xc
	adds r6, r0, #0
	adds r0, #0x4c
	movs r5, #0
	strb r5, [r0]
	bl sub_8003D20
	bl Font_InitForUIDefault
	movs r0, #0
	bl SetFontGlyphSet
	ldr r4, _080CDDC4  @ gUnknown_03005380
	ldr r1, _080CDDC8  @ 0x06001400
	adds r0, r4, #0
	movs r2, #0xa0
	movs r3, #5
	bl Font_InitForUI
	adds r0, r4, #0
	bl SetFont
	ldr r0, _080CDDCC  @ gUnknown_08B129E4
	ldr r1, _080CDDD0  @ gUnknown_08B12A60
	ldr r1, [r1]
	str r5, [sp]
	str r5, [sp, #4]
	str r6, [sp, #8]
	movs r2, #2
	movs r3, #0
	bl StartMenuCore
	str r0, [r6, #0x50]
	add sp, #0xc
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080CDDC4: .4byte gUnknown_03005380
_080CDDC8: .4byte 0x06001400
_080CDDCC: .4byte gUnknown_08B129E4
_080CDDD0: .4byte gUnknown_08B12A60

	THUMB_FUNC_END sub_80CDD78

	THUMB_FUNC_START sub_80CDDD4
sub_80CDDD4: @ 0x080CDDD4
	bx lr

	THUMB_FUNC_END sub_80CDDD4

	THUMB_FUNC_START nullsub_61
nullsub_61: @ 0x080CDDD8
	bx lr

	THUMB_FUNC_END nullsub_61

	THUMB_FUNC_START Make6C_PromotionMenuSelect
Make6C_PromotionMenuSelect: @ 0x080CDDDC
	push {lr}
	adds r1, r0, #0
	ldr r0, _080CDDEC  @ gUnknown_08B12A08
	bl Proc_Start
	pop {r1}
	bx r1
	.align 2, 0
_080CDDEC: .4byte gUnknown_08B12A08

	THUMB_FUNC_END Make6C_PromotionMenuSelect
