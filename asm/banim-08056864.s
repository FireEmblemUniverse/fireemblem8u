	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	THUMB_FUNC_START sub_8056864
sub_8056864: @ 0x08056864
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r5, [r4, #0x5c]
	movs r0, #0x2c
	ldrsh r1, [r4, r0]
	movs r2, #0x2e
	ldrsh r0, [r4, r2]
	cmp r1, r0
	blt _08056886
	adds r0, r5, #0
	bl AnimDelete
	adds r0, r4, #0
	bl Proc_Break
	b _080568F6
_08056886:
	ldr r0, [r4, #0x44]
	cmp r0, #0
	bne _080568B0
	movs r3, #0x32
	ldrsh r1, [r4, r3]
	movs r6, #0x34
	ldrsh r2, [r4, r6]
	movs r0, #0x2c
	ldrsh r3, [r4, r0]
	movs r6, #0x2e
	ldrsh r0, [r4, r6]
	str r0, [sp]
	movs r0, #0
	bl Interpolate
	strh r0, [r5, #2]
	movs r0, #0x3a
	ldrsh r1, [r4, r0]
	movs r3, #0x3c
	ldrsh r2, [r4, r3]
	b _080568D2
_080568B0:
	movs r0, #0x34
	ldrsh r1, [r4, r0]
	movs r3, #0x32
	ldrsh r2, [r4, r3]
	movs r6, #0x2c
	ldrsh r3, [r4, r6]
	movs r6, #0x2e
	ldrsh r0, [r4, r6]
	str r0, [sp]
	movs r0, #0
	bl Interpolate
	strh r0, [r5, #2]
	movs r0, #0x3c
	ldrsh r1, [r4, r0]
	movs r3, #0x3a
	ldrsh r2, [r4, r3]
_080568D2:
	movs r6, #0x2c
	ldrsh r3, [r4, r6]
	movs r6, #0x2e
	ldrsh r0, [r4, r6]
	str r0, [sp]
	movs r0, #0
	bl Interpolate
	strh r0, [r5, #4]
	ldrh r2, [r4, #0x2c]
	movs r0, #0x2c
	ldrsh r1, [r4, r0]
	movs r3, #0x2e
	ldrsh r0, [r4, r3]
	cmp r1, r0
	bgt _080568F6
	adds r0, r2, #1
	strh r0, [r4, #0x2c]
_080568F6:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8056864

	THUMB_FUNC_START NewEkrUnitKakudai
NewEkrUnitKakudai: @ 0x08056900
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _0805692C  @ ProcScr_ekrUnitKakudai
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	str r5, [r4, #0x44]
	movs r1, #0
	str r1, [r4, #0x50]
	str r1, [r4, #0x4c]
	ldr r0, _08056930  @ gEkrDistanceType
	movs r2, #0
	ldrsh r0, [r0, r2]
	cmp r0, #0
	blt _0805696E
	cmp r0, #3
	ble _08056934
	cmp r0, #4
	beq _0805695C
	b _0805696E
	.align 2, 0
_0805692C: .4byte ProcScr_ekrUnitKakudai
_08056930: .4byte gEkrDistanceType
_08056934:
	ldr r0, _08056958  @ gEkrPairSideVaild
	movs r1, #0
	ldrsh r5, [r0, r1]
	cmp r5, #1
	bne _08056948
	bl GetBanimDragonStatusType
	cmp r0, #0
	bne _08056948
	str r5, [r4, #0x4c]
_08056948:
	ldr r0, _08056958  @ gEkrPairSideVaild
	movs r2, #2
	ldrsh r0, [r0, r2]
	cmp r0, #1
	bne _0805696E
	str r0, [r4, #0x50]
	b _0805696E
	.align 2, 0
_08056958: .4byte gEkrPairSideVaild
_0805695C:
	cmp r5, #0
	bne _08056968
	str r1, [r4, #0x4c]
	movs r0, #1
	str r0, [r4, #0x50]
	b _0805696E
_08056968:
	movs r0, #1
	str r0, [r4, #0x4c]
	str r1, [r4, #0x50]
_0805696E:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END NewEkrUnitKakudai

	THUMB_FUNC_START sub_8056974
sub_8056974: @ 0x08056974
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r1, _08056AE4  @ gUnknown_080DAF18
	ldr r0, _08056AE8  @ gEkrDistanceType
	movs r2, #0
	ldrsh r0, [r0, r2]
	adds r0, r0, r1
	ldrb r2, [r0]
	ldr r1, _08056AEC  @ gBanimRoundScripts
	lsls r0, r2, #2
	adds r0, r0, r1
	ldrb r6, [r0]
	bl UpdateBanimFrame
	ldr r0, _08056AF0  @ gEkrBattleEndFlag
	ldr r0, [r0]
	cmp r0, #0
	beq _080569B2
	ldr r5, _08056AF4  @ gAnims
	ldr r0, [r5, #8]
	cmp r0, #0
	beq _080569A4
	bl EndEfxStatusUnits
_080569A4:
	ldr r0, [r5]
	cmp r0, #0
	beq _080569AE
	bl EndEfxStatusUnits
_080569AE:
	bl DeleteEach6C_efxStatusUnit
_080569B2:
	ldr r0, _08056AF8  @ gpEkrBattleUnitRight
	ldr r0, [r0]
	adds r0, #0x30
	ldrb r0, [r0]
	movs r1, #0xf
	ands r1, r0
	cmp r1, #0xb
	beq _080569C6
	cmp r1, #0xd
	bne _080569D0
_080569C6:
	ldr r0, _08056AFC  @ gPaletteBuffer
	movs r1, #0x19
	movs r2, #1
	bl sub_8071468
_080569D0:
	ldr r0, _08056B00  @ gpEkrBattleUnitLeft
	ldr r0, [r0]
	adds r0, #0x30
	ldrb r0, [r0]
	movs r1, #0xf
	ands r1, r0
	cmp r1, #0xb
	beq _080569E4
	cmp r1, #0xd
	bne _080569EE
_080569E4:
	ldr r0, _08056AFC  @ gPaletteBuffer
	movs r1, #0x17
	movs r2, #1
	bl sub_8071468
_080569EE:
	ldr r0, [r4, #0x44]
	cmp r0, #0
	bne _08056A0A
	ldr r0, _08056B04  @ gBattleStats
	ldrh r1, [r0]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08056A0A
	ldr r0, _08056AFC  @ gPaletteBuffer
	movs r1, #0x17
	movs r2, #1
	bl sub_8071468
_08056A0A:
	ldr r5, _08056B08  @ gEkrPairSideVaild
	movs r3, #0
	ldrsh r0, [r5, r3]
	cmp r0, #1
	bne _08056A32
	ldr r0, _08056B0C  @ gpBanimModesLeft
	ldr r1, [r0]
	lsls r0, r6, #2
	adds r0, r0, r1
	ldr r2, [r0]
	ldr r0, _08056B10  @ gBanimScrLeft
	adds r2, r2, r0
	ldr r0, [r2, #4]
	ldr r1, [r2, #8]
	ldr r2, _08056B14  @ gBanimOaml
	adds r1, r1, r2
	str r1, [r4, #0x54]
	ldr r1, _08056B18  @ gUnknown_02000088
	bl LZ77UnCompWram
_08056A32:
	movs r1, #2
	ldrsh r0, [r5, r1]
	cmp r0, #1
	bne _08056A58
	ldr r0, _08056B1C  @ gpBanimModesRight
	ldr r1, [r0]
	lsls r0, r6, #2
	adds r0, r0, r1
	ldr r2, [r0]
	ldr r0, _08056B20  @ gBanimScrRight
	adds r2, r2, r0
	ldr r0, [r2, #4]
	ldr r1, [r2, #8]
	ldr r2, _08056B24  @ gBanimOamr2
	adds r1, r1, r2
	str r1, [r4, #0x58]
	ldr r1, _08056B28  @ gUnknown_02002088
	bl LZ77UnCompWram
_08056A58:
	ldr r5, _08056B2C  @ gUnknown_0203E1A4
	ldr r0, [r5]
	cmp r0, #0
	beq _08056A66
	ldr r1, _08056B30  @ gUnknown_02001088
	bl LZ77UnCompWram
_08056A66:
	ldr r0, [r5, #4]
	cmp r0, #0
	beq _08056A72
	ldr r1, _08056B34  @ gUnknown_02003088
	bl LZ77UnCompWram
_08056A72:
	ldr r1, _08056B38  @ 0x06014000
	ldr r0, _08056B18  @ gUnknown_02000088
	movs r2, #0x80
	lsls r2, r2, #7
	bl RegisterDataMove
	movs r0, #0
	strh r0, [r4, #0x2c]
	movs r0, #0xb
	strh r0, [r4, #0x2e]
	ldr r1, _08056B3C  @ gEkrPairBmLoc
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #4
	adds r0, #8
	strh r0, [r4, #0x32]
	movs r3, #2
	ldrsh r0, [r1, r3]
	lsls r0, r0, #4
	adds r0, #8
	strh r0, [r4, #0x3a]
	movs r5, #4
	ldrsh r0, [r1, r5]
	lsls r0, r0, #4
	adds r0, #8
	strh r0, [r4, #0x34]
	movs r2, #6
	ldrsh r0, [r1, r2]
	lsls r0, r0, #4
	adds r0, #8
	strh r0, [r4, #0x3c]
	ldr r1, _08056B40  @ gUnknown_080DAF1D
	ldr r2, _08056AE8  @ gEkrDistanceType
	movs r3, #0
	ldrsh r0, [r2, r3]
	adds r0, r0, r1
	ldrb r5, [r0]
	strh r5, [r4, #0x36]
	ldr r1, _08056B44  @ gUnknown_080DAF22
	movs r3, #0
	ldrsh r0, [r2, r3]
	adds r0, r0, r1
	ldrb r3, [r0]
	strh r3, [r4, #0x38]
	ldr r0, _08056B48  @ gEkrPos2Maybe
	ldr r0, [r0]
	cmp r0, #0
	bne _08056B50
	ldr r0, _08056B4C  @ gUnknown_080DAF28
	movs r5, #0
	ldrsh r1, [r2, r5]
	lsls r1, r1, #1
	adds r1, r1, r0
	ldrh r0, [r1]
	adds r0, r3, r0
	strh r0, [r4, #0x38]
	b _08056B60
	.align 2, 0
_08056AE4: .4byte gUnknown_080DAF18
_08056AE8: .4byte gEkrDistanceType
_08056AEC: .4byte gBanimRoundScripts
_08056AF0: .4byte gEkrBattleEndFlag
_08056AF4: .4byte gAnims
_08056AF8: .4byte gpEkrBattleUnitRight
_08056AFC: .4byte gPaletteBuffer
_08056B00: .4byte gpEkrBattleUnitLeft
_08056B04: .4byte gBattleStats
_08056B08: .4byte gEkrPairSideVaild
_08056B0C: .4byte gpBanimModesLeft
_08056B10: .4byte gBanimScrLeft
_08056B14: .4byte gBanimOaml
_08056B18: .4byte gUnknown_02000088
_08056B1C: .4byte gpBanimModesRight
_08056B20: .4byte gBanimScrRight
_08056B24: .4byte gBanimOamr2
_08056B28: .4byte gUnknown_02002088
_08056B2C: .4byte gUnknown_0203E1A4
_08056B30: .4byte gUnknown_02001088
_08056B34: .4byte gUnknown_02003088
_08056B38: .4byte 0x06014000
_08056B3C: .4byte gEkrPairBmLoc
_08056B40: .4byte gUnknown_080DAF1D
_08056B44: .4byte gUnknown_080DAF22
_08056B48: .4byte gEkrPos2Maybe
_08056B4C: .4byte gUnknown_080DAF28
_08056B50:
	ldr r0, _08056B6C  @ gUnknown_080DAF28
	movs r3, #0
	ldrsh r1, [r2, r3]
	lsls r1, r1, #1
	adds r1, r1, r0
	ldrh r0, [r1]
	subs r0, r5, r0
	strh r0, [r4, #0x36]
_08056B60:
	adds r0, r4, #0
	bl Proc_Break
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08056B6C: .4byte gUnknown_080DAF28

	THUMB_FUNC_END sub_8056974

	THUMB_FUNC_START sub_8056B70
sub_8056B70: @ 0x08056B70
	push {r4, r5, r6, r7, lr}
	ldr r4, _08056B90  @ 0xFFFFFCB4
	add sp, r4
	adds r4, r0, #0
	add r5, sp, #0x304
	ldrh r2, [r4, #0x2c]
	movs r0, #0x2c
	ldrsh r1, [r4, r0]
	movs r3, #0x2e
	ldrsh r0, [r4, r3]
	cmp r1, r0
	blt _08056B94
	adds r0, r4, #0
	bl Proc_Break
	b _08056D0A
	.align 2, 0
_08056B90: .4byte 0xFFFFFCB4
_08056B94:
	adds r0, r2, #1
	strh r0, [r4, #0x2c]
	ldr r0, [r4, #0x44]
	cmp r0, #0
	bne _08056BAC
	movs r1, #0x94
	lsls r1, r1, #2
	movs r2, #0x80
	lsls r2, r2, #1
	movs r6, #0x2c
	ldrsh r3, [r4, r6]
	b _08056BB8
_08056BAC:
	movs r1, #0x80
	lsls r1, r1, #1
	movs r2, #0x94
	lsls r2, r2, #2
	movs r0, #0x2c
	ldrsh r3, [r4, r0]
_08056BB8:
	movs r6, #0x2e
	ldrsh r0, [r4, r6]
	str r0, [sp]
	movs r0, #0
	bl Interpolate
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	ldr r0, [r4, #0x4c]
	cmp r0, #1
	bne _08056C6A
	ldr r0, [r4, #0x54]
	lsls r3, r7, #0x10
	asrs r3, r3, #0x10
	movs r1, #0
	str r1, [sp]
	add r1, sp, #4
	adds r2, r3, #0
	bl EkrEfxHandleUnitHittedEffect
	ldr r0, [r4, #0x44]
	cmp r0, #0
	bne _08056C16
	movs r0, #0x32
	ldrsh r1, [r4, r0]
	movs r3, #0x36
	ldrsh r2, [r4, r3]
	movs r6, #0x2c
	ldrsh r3, [r4, r6]
	movs r6, #0x2e
	ldrsh r0, [r4, r6]
	str r0, [sp]
	movs r0, #0
	bl Interpolate
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	movs r0, #0x3a
	ldrsh r1, [r4, r0]
	movs r2, #0x2c
	ldrsh r3, [r4, r2]
	movs r2, #0x2e
	ldrsh r0, [r4, r2]
	str r0, [sp]
	movs r0, #0
	movs r2, #0x58
	b _08056C44
_08056C16:
	movs r3, #0x36
	ldrsh r1, [r4, r3]
	movs r6, #0x32
	ldrsh r2, [r4, r6]
	movs r0, #0x2c
	ldrsh r3, [r4, r0]
	movs r6, #0x2e
	ldrsh r0, [r4, r6]
	str r0, [sp]
	movs r0, #0
	bl Interpolate
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	movs r0, #0x3a
	ldrsh r2, [r4, r0]
	movs r1, #0x2c
	ldrsh r3, [r4, r1]
	movs r1, #0x2e
	ldrsh r0, [r4, r1]
	str r0, [sp]
	movs r0, #0
	movs r1, #0x58
_08056C44:
	bl Interpolate
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	add r2, sp, #4
	str r2, [r5, #0x3c]
	movs r0, #0
	strh r6, [r5, #2]
	strh r1, [r5, #4]
	movs r1, #0x80
	lsls r1, r1, #3
	strh r1, [r5, #0xc]
	movs r1, #0xe4
	lsls r1, r1, #7
	strh r1, [r5, #8]
	str r0, [r5, #0x1c]
	adds r0, r5, #0
	bl AnimDisplay
_08056C6A:
	ldr r1, [r4, #0x50]
	cmp r1, #1
	bne _08056D0A
	ldr r0, [r4, #0x58]
	lsls r3, r7, #0x10
	asrs r3, r3, #0x10
	str r1, [sp]
	add r1, sp, #4
	adds r2, r3, #0
	bl EkrEfxHandleUnitHittedEffect
	ldr r0, [r4, #0x44]
	cmp r0, #0
	bne _08056CB6
	movs r3, #0x34
	ldrsh r1, [r4, r3]
	movs r6, #0x38
	ldrsh r2, [r4, r6]
	movs r0, #0x2c
	ldrsh r3, [r4, r0]
	movs r6, #0x2e
	ldrsh r0, [r4, r6]
	str r0, [sp]
	movs r0, #0
	bl Interpolate
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	movs r0, #0x3c
	ldrsh r1, [r4, r0]
	movs r2, #0x2c
	ldrsh r3, [r4, r2]
	movs r2, #0x2e
	ldrsh r0, [r4, r2]
	str r0, [sp]
	movs r0, #0
	movs r2, #0x58
	b _08056CE4
_08056CB6:
	movs r3, #0x38
	ldrsh r1, [r4, r3]
	movs r6, #0x34
	ldrsh r2, [r4, r6]
	movs r0, #0x2c
	ldrsh r3, [r4, r0]
	movs r6, #0x2e
	ldrsh r0, [r4, r6]
	str r0, [sp]
	movs r0, #0
	bl Interpolate
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	movs r0, #0x3c
	ldrsh r2, [r4, r0]
	movs r1, #0x2c
	ldrsh r3, [r4, r1]
	movs r1, #0x2e
	ldrsh r0, [r4, r1]
	str r0, [sp]
	movs r0, #0
	movs r1, #0x58
_08056CE4:
	bl Interpolate
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	add r2, sp, #4
	str r2, [r5, #0x3c]
	movs r0, #0
	strh r6, [r5, #2]
	strh r1, [r5, #4]
	movs r1, #0x80
	lsls r1, r1, #3
	strh r1, [r5, #0xc]
	movs r1, #0x93
	lsls r1, r1, #8
	strh r1, [r5, #8]
	str r0, [r5, #0x1c]
	adds r0, r5, #0
	bl AnimDisplay
_08056D0A:
	movs r3, #0xd3
	lsls r3, r3, #2
	add sp, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8056B70

	THUMB_FUNC_START sub_8056D18
sub_8056D18: @ 0x08056D18
	push {lr}
	bl Proc_Break
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8056D18

	THUMB_FUNC_START NewEkrWindowAppear
NewEkrWindowAppear: @ 0x08056D24
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	ldr r0, _08056D68  @ gProc_ekrWindowAppear
	movs r1, #3
	bl Proc_Start
	str r5, [r0, #0x44]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r4, [r0, #0x2e]
	movs r1, #0x39
	strh r1, [r0, #0x30]
	movs r2, #0
	cmp r5, #0
	bne _08056D46
	movs r2, #0x39
_08056D46:
	ldr r1, _08056D6C  @ gEkrBg0QuakeVec
	movs r3, #0
	ldrsh r0, [r1, r3]
	ldrh r1, [r1, #2]
	adds r1, r1, r2
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl EkrGauge_Clr323A
	ldr r1, _08056D70  @ gEkrWindowAppearExist
	movs r0, #1
	str r0, [r1]
	bl EkrGauge_ClrInitFlag
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08056D68: .4byte gProc_ekrWindowAppear
_08056D6C: .4byte gEkrBg0QuakeVec
_08056D70: .4byte gEkrWindowAppearExist

	THUMB_FUNC_END NewEkrWindowAppear

	THUMB_FUNC_START DoesEkrWindowAppearExist
DoesEkrWindowAppearExist: @ 0x08056D74
	push {lr}
	ldr r0, _08056D84  @ gEkrWindowAppearExist
	ldr r0, [r0]
	cmp r0, #0
	beq _08056D88
	movs r0, #0
	b _08056D8A
	.align 2, 0
_08056D84: .4byte gEkrWindowAppearExist
_08056D88:
	movs r0, #1
_08056D8A:
	pop {r1}
	bx r1

	THUMB_FUNC_END DoesEkrWindowAppearExist

	THUMB_FUNC_START sub_8056D90
sub_8056D90: @ 0x08056D90
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldrh r2, [r4, #0x2c]
	movs r0, #0x2c
	ldrsh r1, [r4, r0]
	movs r3, #0x2e
	ldrsh r0, [r4, r3]
	cmp r1, r0
	blt _08056DBC
	ldr r1, _08056DB8  @ gEkrWindowAppearExist
	movs r0, #0
	str r0, [r1]
	bl EkrGauge_SetInitFlag
	adds r0, r4, #0
	bl Proc_Break
	b _08056E04
	.align 2, 0
_08056DB8: .4byte gEkrWindowAppearExist
_08056DBC:
	adds r0, r2, #1
	strh r0, [r4, #0x2c]
	ldr r0, [r4, #0x44]
	cmp r0, #0
	bne _08056DDA
	movs r0, #0x30
	ldrsh r1, [r4, r0]
	movs r2, #0x2c
	ldrsh r3, [r4, r2]
	movs r2, #0x2e
	ldrsh r0, [r4, r2]
	str r0, [sp]
	movs r0, #1
	movs r2, #0
	b _08056DEC
_08056DDA:
	movs r3, #0x30
	ldrsh r2, [r4, r3]
	movs r0, #0x2c
	ldrsh r3, [r4, r0]
	movs r1, #0x2e
	ldrsh r0, [r4, r1]
	str r0, [sp]
	movs r0, #4
	movs r1, #0
_08056DEC:
	bl Interpolate
	adds r2, r0, #0
	ldr r1, _08056E0C  @ gEkrBg0QuakeVec
	movs r3, #0
	ldrsh r0, [r1, r3]
	ldrh r1, [r1, #2]
	adds r1, r1, r2
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl EkrGauge_Clr323A
_08056E04:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08056E0C: .4byte gEkrBg0QuakeVec

	THUMB_FUNC_END sub_8056D90

	THUMB_FUNC_START NewEkrNamewinAppear
NewEkrNamewinAppear: @ 0x08056E10
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	ldr r0, _08056E40  @ gProc_ekrNamewinAppear
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x44]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r5, [r0, #0x2e]
	strh r6, [r0, #0x30]
	subs r1, #0x31
	str r1, [r0, #0x48]
	cmp r4, #0
	bne _08056E44
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r0, #0
	bl EkrDispUP_8051B48
	b _08056E4C
	.align 2, 0
_08056E40: .4byte gProc_ekrNamewinAppear
_08056E44:
	movs r0, #0
	movs r1, #0
	bl EkrDispUP_8051B48
_08056E4C:
	ldr r1, _08056E5C  @ gEkrNamewinAppearExist
	movs r0, #1
	str r0, [r1]
	bl sub_8051B80
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08056E5C: .4byte gEkrNamewinAppearExist

	THUMB_FUNC_END NewEkrNamewinAppear

	THUMB_FUNC_START CheckEkrNamewinAppearUnexist
CheckEkrNamewinAppearUnexist: @ 0x08056E60
	push {lr}
	ldr r0, _08056E70  @ gEkrNamewinAppearExist
	ldr r0, [r0]
	cmp r0, #0
	beq _08056E74
	movs r0, #0
	b _08056E76
	.align 2, 0
_08056E70: .4byte gEkrNamewinAppearExist
_08056E74:
	movs r0, #1
_08056E76:
	pop {r1}
	bx r1

	THUMB_FUNC_END CheckEkrNamewinAppearUnexist

	THUMB_FUNC_START sub_8056E7C
sub_8056E7C: @ 0x08056E7C
	push {r4, lr}
	adds r2, r0, #0
	ldrh r3, [r2, #0x2c]
	movs r0, #0x2c
	ldrsh r1, [r2, r0]
	movs r4, #0x30
	ldrsh r0, [r2, r4]
	cmp r1, r0
	bne _08056E9A
	movs r0, #0
	strh r0, [r2, #0x2c]
	adds r0, r2, #0
	bl Proc_Break
	b _08056E9E
_08056E9A:
	adds r0, r3, #1
	strh r0, [r2, #0x2c]
_08056E9E:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8056E7C

	THUMB_FUNC_START sub_8056EA4
sub_8056EA4: @ 0x08056EA4
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldrh r2, [r4, #0x2c]
	movs r0, #0x2c
	ldrsh r1, [r4, r0]
	movs r3, #0x2e
	ldrsh r0, [r4, r3]
	cmp r1, r0
	blt _08056ED8
	ldr r0, _08056ED4  @ gEkrNamewinAppearExist
	movs r1, #0
	str r1, [r0]
	bl sub_8051B70
	ldr r0, [r4, #0x44]
	cmp r0, #2
	bne _08056ECC
	bl EndEkrDispUP
_08056ECC:
	adds r0, r4, #0
	bl Proc_Break
	b _08056F16
	.align 2, 0
_08056ED4: .4byte gEkrNamewinAppearExist
_08056ED8:
	adds r0, r2, #1
	strh r0, [r4, #0x2c]
	ldr r0, [r4, #0x44]
	cmp r0, #0
	bne _08056EF8
	ldr r1, [r4, #0x48]
	movs r0, #0x2c
	ldrsh r3, [r4, r0]
	movs r2, #0x2e
	ldrsh r0, [r4, r2]
	str r0, [sp]
	movs r0, #1
	movs r2, #0
	bl Interpolate
	b _08056F0C
_08056EF8:
	ldr r2, [r4, #0x48]
	movs r0, #0x2c
	ldrsh r3, [r4, r0]
	movs r1, #0x2e
	ldrsh r0, [r4, r1]
	str r0, [sp]
	movs r0, #4
	movs r1, #0
	bl Interpolate
_08056F0C:
	lsls r1, r0, #0x10
	lsrs r1, r1, #0x10
	movs r0, #0
	bl EkrDispUP_8051B48
_08056F16:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8056EA4

	THUMB_FUNC_START NewEkrBaseAppear
NewEkrBaseAppear: @ 0x08056F20
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _08056F44  @ ProcScr_ekrBaseAppear
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x44]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r5, [r0, #0x2e]
	cmp r4, #0
	bne _08056F4C
	ldr r2, _08056F48  @ 0x0000FFA8
	movs r0, #2
	bl BG_SetPosition
	b _08056F56
	.align 2, 0
_08056F44: .4byte ProcScr_ekrBaseAppear
_08056F48: .4byte 0x0000FFA8
_08056F4C:
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
_08056F56:
	ldr r1, _08056F64  @ gProcEkrBaseAppearExist
	movs r0, #1
	str r0, [r1]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08056F64: .4byte gProcEkrBaseAppearExist

	THUMB_FUNC_END NewEkrBaseAppear

	THUMB_FUNC_START CheckEkrBaseAppearExist
CheckEkrBaseAppearExist: @ 0x08056F68
	push {lr}
	ldr r0, _08056F78  @ gProcEkrBaseAppearExist
	ldr r0, [r0]
	cmp r0, #0
	beq _08056F7C
	movs r0, #0
	b _08056F7E
	.align 2, 0
_08056F78: .4byte gProcEkrBaseAppearExist
_08056F7C:
	movs r0, #1
_08056F7E:
	pop {r1}
	bx r1

	THUMB_FUNC_END CheckEkrBaseAppearExist

	THUMB_FUNC_START EndEkrBaseAppear
EndEkrBaseAppear: @ 0x08056F84
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldrh r2, [r4, #0x2c]
	movs r0, #0x2c
	ldrsh r1, [r4, r0]
	movs r3, #0x2e
	ldrsh r0, [r4, r3]
	cmp r1, r0
	blt _08056FAC
	ldr r1, _08056FA8  @ gProcEkrBaseAppearExist
	movs r0, #0
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
	b _08056FF0
	.align 2, 0
_08056FA8: .4byte gProcEkrBaseAppearExist
_08056FAC:
	adds r0, r2, #1
	strh r0, [r4, #0x2c]
	ldr r0, [r4, #0x44]
	cmp r0, #0
	bne _08056FCE
	movs r1, #0x50
	negs r1, r1
	movs r0, #0x2c
	ldrsh r3, [r4, r0]
	movs r2, #0x2e
	ldrsh r0, [r4, r2]
	str r0, [sp]
	movs r0, #1
	movs r2, #0
	bl Interpolate
	b _08056FE4
_08056FCE:
	movs r2, #0x50
	negs r2, r2
	movs r0, #0x2c
	ldrsh r3, [r4, r0]
	movs r1, #0x2e
	ldrsh r0, [r4, r1]
	str r0, [sp]
	movs r0, #4
	movs r1, #0
	bl Interpolate
_08056FE4:
	lsls r2, r0, #0x10
	lsrs r2, r2, #0x10
	movs r0, #2
	movs r1, #0
	bl BG_SetPosition
_08056FF0:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END EndEkrBaseAppear

.align 2, 0
