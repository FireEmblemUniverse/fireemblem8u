	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	THUMB_FUNC_START sub_8059970
sub_8059970: @ 0x08059970
	push {lr}
	adds r2, r0, #0
	ldr r0, _08059998  @ gUnknown_0203E1DC
	lsls r1, r1, #1
	adds r1, r1, r0
	movs r3, #0
	ldrsh r0, [r1, r3]
	cmp r0, #0
	beq _08059992
	movs r1, #0
	adds r3, r2, #0
	adds r3, #0x80
_08059988:
	ldm r3!, {r0}
	stm r2!, {r0}
	adds r1, #1
	cmp r1, #7
	bls _08059988
_08059992:
	pop {r0}
	bx r0
	.align 2, 0
_08059998: .4byte gUnknown_0203E1DC

	THUMB_FUNC_END sub_8059970

	THUMB_FUNC_START GetBanimPalette
GetBanimPalette: @ 0x0805999C
	push {lr}
	adds r2, r0, #0
	cmp r1, #0
	bne _080599AC
	ldr r0, _080599A8  @ gpEkrBattleUnitLeft
	b _080599AE
	.align 2, 0
_080599A8: .4byte gpEkrBattleUnitLeft
_080599AC:
	ldr r0, _080599C4  @ gpEkrBattleUnitRight
_080599AE:
	ldr r0, [r0]
	ldr r0, [r0, #4]
	ldrb r0, [r0, #4]
	cmp r0, #0x1a
	beq _080599D6
	cmp r0, #0x1a
	bhi _080599C8
	cmp r0, #0x19
	beq _080599D2
	b _080599E2
	.align 2, 0
_080599C4: .4byte gpEkrBattleUnitRight
_080599C8:
	cmp r0, #0x1b
	beq _080599DA
	cmp r0, #0x1c
	beq _080599DE
	b _080599E2
_080599D2:
	movs r0, #0x25
	b _080599E4
_080599D6:
	movs r0, #0x27
	b _080599E4
_080599DA:
	movs r0, #0x29
	b _080599E4
_080599DE:
	movs r0, #0x2b
	b _080599E4
_080599E2:
	adds r0, r2, #0
_080599E4:
	pop {r1}
	bx r1

	THUMB_FUNC_END GetBanimPalette

	THUMB_FUNC_START UpdateBanimFrame
UpdateBanimFrame: @ 0x080599E8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	ldr r0, _08059BD8  @ banim_data
	mov sl, r0
	ldr r1, _08059BDC  @ gpImgSheet
	movs r0, #0
	str r0, [r1, #4]
	str r0, [r1]
	ldr r0, _08059BE0  @ gEkrPairSideVaild
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #1
	bne _08059ADE
	ldr r0, _08059BE4  @ gEkrPairBanimID2
	movs r2, #0
	ldrsh r7, [r0, r2]
	ldr r0, _08059BE8  @ gBanimSomeObjPalIndex
	movs r2, #0
	ldrsh r1, [r0, r2]
	mov r8, r1
	ldr r0, _08059BEC  @ gBattleInitSide
	movs r1, #0
	ldrsh r5, [r0, r1]
	lsls r4, r7, #5
	add r4, sl
	ldr r0, [r4, #0x10]
	ldr r1, _08059BF0  @ gBanimScrLeft
	bl LZ77UnCompWram
	ldr r1, _08059BF4  @ gpBanimModesLeft
	ldr r0, [r4, #0xc]
	str r0, [r1]
	adds r0, r7, #0
	movs r1, #0
	bl GetBanimPalette
	lsls r0, r0, #5
	add r0, sl
	ldr r0, [r0, #0x1c]
	ldr r4, _08059BF8  @ gBanimPal1
	adds r1, r4, #0
	bl LZ77UnCompWram
	movs r0, #1
	negs r0, r0
	cmp r5, r0
	beq _08059A64
	lsls r0, r5, #4
	ldr r2, _08059BFC  @ character_battle_animation_palette_table
	adds r0, r0, r2
	ldr r0, [r0, #0xc]
	adds r1, r4, #0
	bl LZ77UnCompWram
	adds r0, r4, #0
	movs r1, #0
	bl sub_8059970
_08059A64:
	ldr r1, _08059C00  @ gpEfxUnitPaletteBackup
	mov r2, r8
	lsls r0, r2, #5
	adds r0, r0, r4
	str r0, [r1]
	ldr r4, _08059C04  @ gUnknown_02022B88
	adds r1, r4, #0
	movs r2, #8
	bl CpuFastSet
	ldr r0, _08059C08  @ gBanimCharacterTSAs
	ldr r0, [r0]
	adds r1, r4, #0
	adds r1, #0x20
	movs r2, #8
	bl CpuFastSet
	ldr r0, _08059C0C  @ gBattleActor
	adds r0, #0x30
	ldrb r0, [r0]
	movs r1, #0xf
	ands r1, r0
	cmp r1, #0xb
	beq _08059A98
	cmp r1, #0xd
	bne _08059AA4
_08059A98:
	ldr r1, _08059C10  @ 0xFFFFFD20
	adds r0, r4, r1
	adds r1, r4, #0
	movs r2, #1
	bl sub_8071468
_08059AA4:
	ldr r0, _08059C14  @ gBattleTarget
	adds r0, #0x30
	ldrb r0, [r0]
	movs r1, #0xf
	ands r1, r0
	cmp r1, #0xb
	beq _08059AB6
	cmp r1, #0xd
	bne _08059AC4
_08059AB6:
	ldr r0, _08059C18  @ gPaletteBuffer
	movs r2, #0xc0
	lsls r2, r2, #2
	adds r1, r0, r2
	movs r2, #1
	bl sub_8071468
_08059AC4:
	bl EnablePaletteSync
	lsls r0, r7, #5
	add r0, sl
	ldr r0, [r0, #0x18]
	ldr r4, _08059C1C  @ gBanimOaml
	adds r1, r4, #0
	bl LZ77UnCompWram
	ldr r0, _08059C20  @ 0x000057F0
	adds r4, r4, r0
	movs r0, #1
	str r0, [r4]
_08059ADE:
	ldr r0, _08059BE0  @ gEkrPairSideVaild
	movs r2, #2
	ldrsh r1, [r0, r2]
	mov r9, r1
	cmp r1, #1
	bne _08059B7E
	ldr r0, _08059BE4  @ gEkrPairBanimID2
	movs r1, #2
	ldrsh r7, [r0, r1]
	ldr r0, _08059BE8  @ gBanimSomeObjPalIndex
	movs r1, #2
	ldrsh r2, [r0, r1]
	mov r8, r2
	ldr r0, _08059BEC  @ gBattleInitSide
	movs r2, #2
	ldrsh r5, [r0, r2]
	lsls r0, r7, #5
	mov r1, sl
	adds r6, r0, r1
	ldr r0, [r6, #0x10]
	ldr r1, _08059C24  @ gBanimScrRight
	bl LZ77UnCompWram
	ldr r1, _08059C28  @ gpBanimModesRight
	ldr r0, [r6, #0xc]
	str r0, [r1]
	adds r0, r7, #0
	movs r1, #1
	bl GetBanimPalette
	lsls r0, r0, #5
	add r0, sl
	ldr r0, [r0, #0x1c]
	ldr r4, _08059C2C  @ gBanimPal2
	adds r1, r4, #0
	bl LZ77UnCompWram
	movs r0, #1
	negs r0, r0
	cmp r5, r0
	beq _08059B46
	lsls r0, r5, #4
	ldr r2, _08059BFC  @ character_battle_animation_palette_table
	adds r0, r0, r2
	ldr r0, [r0, #0xc]
	adds r1, r4, #0
	bl LZ77UnCompWram
	adds r0, r4, #0
	movs r1, #1
	bl sub_8059970
_08059B46:
	ldr r1, _08059C00  @ gpEfxUnitPaletteBackup
	mov r2, r8
	lsls r0, r2, #5
	adds r0, r0, r4
	str r0, [r1, #4]
	ldr r4, _08059C30  @ gUnknown_02022BC8
	adds r1, r4, #0
	movs r2, #8
	bl CpuFastSet
	ldr r0, _08059C08  @ gBanimCharacterTSAs
	ldr r0, [r0, #4]
	adds r4, #0x20
	adds r1, r4, #0
	movs r2, #8
	bl CpuFastSet
	bl EnablePaletteSync
	ldr r0, [r6, #0x14]
	ldr r4, _08059C34  @ gBanimOamr2
	adds r1, r4, #0
	bl LZ77UnCompWram
	ldr r0, _08059C20  @ 0x000057F0
	adds r4, r4, r0
	mov r1, r9
	str r1, [r4]
_08059B7E:
	ldr r4, _08059C38  @ gEkrTriangleAtkFlag
	ldr r2, [r4]
	cmp r2, #0
	bne _08059B88
	b _08059D06
_08059B88:
	ldr r0, [r2, #4]
	ldr r1, [r0, #0x34]
	adds r0, r2, #0
	movs r2, #0
	mov r3, sp
	bl sub_8057CAC
	lsls r0, r0, #0x10
	ldr r2, _08059C08  @ gBanimCharacterTSAs
	lsrs r0, r0, #0xb
	add r0, sl
	ldr r0, [r0, #0x1c]
	str r0, [r2]
	ldr r1, [r4]
	ldr r0, [r1]
	ldrb r0, [r0, #4]
	subs r0, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	ldr r0, [r1, #4]
	ldrb r5, [r0, #4]
	movs r3, #0
	ldr r0, _08059C3C  @ gUnknown_0895E0A4
	lsls r1, r4, #3
	subs r1, r1, r4
	adds r0, r1, r0
	ldrb r0, [r0]
	cmp r0, r5
	bne _08059C44
	ldr r0, _08059C40  @ gUnknown_0895EEA4
	adds r0, r1, r0
	ldrb r0, [r0]
	lsls r0, r0, #4
	ldr r1, _08059BFC  @ character_battle_animation_palette_table
	adds r0, r0, r1
	subs r0, #0x10
	ldr r0, [r0, #0xc]
	str r0, [r2]
	b _08059C72
	.align 2, 0
_08059BD8: .4byte banim_data
_08059BDC: .4byte gpImgSheet
_08059BE0: .4byte gEkrPairSideVaild
_08059BE4: .4byte gEkrPairBanimID2
_08059BE8: .4byte gBanimSomeObjPalIndex
_08059BEC: .4byte gBattleInitSide
_08059BF0: .4byte gBanimScrLeft
_08059BF4: .4byte gpBanimModesLeft
_08059BF8: .4byte gBanimPal1
_08059BFC: .4byte character_battle_animation_palette_table
_08059C00: .4byte gpEfxUnitPaletteBackup
_08059C04: .4byte gUnknown_02022B88
_08059C08: .4byte gBanimCharacterTSAs
_08059C0C: .4byte gBattleActor
_08059C10: .4byte 0xFFFFFD20
_08059C14: .4byte gBattleTarget
_08059C18: .4byte gPaletteBuffer
_08059C1C: .4byte gBanimOaml
_08059C20: .4byte 0x000057F0
_08059C24: .4byte gBanimScrRight
_08059C28: .4byte gpBanimModesRight
_08059C2C: .4byte gBanimPal2
_08059C30: .4byte gUnknown_02022BC8
_08059C34: .4byte gBanimOamr2
_08059C38: .4byte gEkrTriangleAtkFlag
_08059C3C: .4byte gUnknown_0895E0A4
_08059C40: .4byte gUnknown_0895EEA4
_08059C44:
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #6
	bhi _08059C72
	ldr r0, _08059CC4  @ gUnknown_0895E0A4
	lsls r1, r4, #3
	subs r1, r1, r4
	adds r2, r3, r1
	adds r0, r2, r0
	ldrb r0, [r0]
	cmp r0, r5
	bne _08059C44
	ldr r1, _08059CC8  @ gBanimCharacterTSAs
	ldr r0, _08059CCC  @ gUnknown_0895EEA4
	adds r0, r2, r0
	ldrb r0, [r0]
	lsls r0, r0, #4
	ldr r2, _08059CD0  @ character_battle_animation_palette_table
	adds r0, r0, r2
	subs r0, #0x10
	ldr r0, [r0, #0xc]
	str r0, [r1]
_08059C72:
	ldr r4, _08059CD4  @ gEkrTriangleAtkFlag
	ldr r0, [r4, #4]
	ldr r1, [r0, #4]
	ldr r1, [r1, #0x34]
	movs r2, #0
	mov r3, sp
	bl sub_8057CAC
	lsls r0, r0, #0x10
	ldr r2, _08059CC8  @ gBanimCharacterTSAs
	lsrs r0, r0, #0xb
	add r0, sl
	ldr r0, [r0, #0x1c]
	str r0, [r2, #4]
	ldr r1, [r4, #4]
	ldr r0, [r1]
	ldrb r0, [r0, #4]
	subs r0, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	ldr r0, [r1, #4]
	ldrb r5, [r0, #4]
	movs r3, #0
	ldr r0, _08059CC4  @ gUnknown_0895E0A4
	lsls r1, r4, #3
	subs r1, r1, r4
	adds r0, r1, r0
	ldrb r0, [r0]
	cmp r0, r5
	bne _08059CD8
	ldr r0, _08059CCC  @ gUnknown_0895EEA4
	adds r0, r1, r0
	ldrb r0, [r0]
	lsls r0, r0, #4
	ldr r1, _08059CD0  @ character_battle_animation_palette_table
	adds r0, r0, r1
	subs r0, #0x10
	ldr r0, [r0, #0xc]
	str r0, [r2, #4]
	b _08059D06
	.align 2, 0
_08059CC4: .4byte gUnknown_0895E0A4
_08059CC8: .4byte gBanimCharacterTSAs
_08059CCC: .4byte gUnknown_0895EEA4
_08059CD0: .4byte character_battle_animation_palette_table
_08059CD4: .4byte gEkrTriangleAtkFlag
_08059CD8:
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #6
	bhi _08059D06
	ldr r0, _08059D18  @ gUnknown_0895E0A4
	lsls r1, r4, #3
	subs r1, r1, r4
	adds r2, r3, r1
	adds r0, r2, r0
	ldrb r0, [r0]
	cmp r0, r5
	bne _08059CD8
	ldr r1, _08059D1C  @ gBanimCharacterTSAs
	ldr r0, _08059D20  @ gUnknown_0895EEA4
	adds r0, r2, r0
	ldrb r0, [r0]
	lsls r0, r0, #4
	ldr r2, _08059D24  @ character_battle_animation_palette_table
	adds r0, r0, r2
	subs r0, #0x10
	ldr r0, [r0, #0xc]
	str r0, [r1, #4]
_08059D06:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08059D18: .4byte gUnknown_0895E0A4
_08059D1C: .4byte gBanimCharacterTSAs
_08059D20: .4byte gUnknown_0895EEA4
_08059D24: .4byte character_battle_animation_palette_table

	THUMB_FUNC_END UpdateBanimFrame

	THUMB_FUNC_START sub_8059D28
sub_8059D28: @ 0x08059D28
	push {lr}
	ldr r0, _08059D40  @ gEkrDistanceType
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #4
	bhi _08059DA2
	lsls r0, r0, #2
	ldr r1, _08059D44  @ _08059D48
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08059D40: .4byte gEkrDistanceType
_08059D44: .4byte _08059D48
_08059D48: @ jump table
	.4byte _08059D5C @ case 0
	.4byte _08059D66 @ case 1
	.4byte _08059D70 @ case 2
	.4byte _08059D5C @ case 3
	.4byte _08059D5C @ case 4
_08059D5C:
	movs r0, #6
	movs r1, #6
	bl sub_8059DB8
	b _08059DA2
_08059D66:
	movs r0, #8
	movs r1, #8
	bl sub_8059DB8
	b _08059DA2
_08059D70:
	movs r0, #8
	movs r1, #8
	bl sub_8059DB8
	bl GetEkrSomePosMaybe
	cmp r0, #0
	bne _08059D94
	ldr r1, _08059D90  @ gAnims
	ldr r2, [r1, #8]
	movs r0, #0xc0
	lsls r0, r0, #1
	strh r0, [r2, #2]
	ldr r1, [r1, #0xc]
	b _08059DA0
	.align 2, 0
_08059D90: .4byte gAnims
_08059D94:
	ldr r1, _08059DB0  @ gAnims
	ldr r2, [r1]
	movs r0, #0xc0
	lsls r0, r0, #1
	strh r0, [r2, #2]
	ldr r1, [r1, #4]
_08059DA0:
	strh r0, [r1, #2]
_08059DA2:
	ldr r1, _08059DB4  @ gEfxPairHpBufOffset
	movs r0, #0
	strh r0, [r1]
	strh r0, [r1, #2]
	pop {r0}
	bx r0
	.align 2, 0
_08059DB0: .4byte gAnims
_08059DB4: .4byte gEfxPairHpBufOffset

	THUMB_FUNC_END sub_8059D28

	THUMB_FUNC_START sub_8059DB8
sub_8059DB8: @ 0x08059DB8
	push {r4, r5, r6, lr}
	adds r2, r0, #0
	adds r6, r1, #0
	ldr r4, _08059E0C  @ gAnims
	movs r0, #0
	str r0, [r4]
	str r0, [r4, #4]
	str r0, [r4, #8]
	str r0, [r4, #0xc]
	ldr r5, _08059E10  @ gEkrPairSideVaild
	movs r1, #0
	ldrsh r0, [r5, r1]
	cmp r0, #1
	bne _08059DDA
	adds r0, r2, #0
	bl sub_8059E18
_08059DDA:
	movs r1, #2
	ldrsh r0, [r5, r1]
	cmp r0, #1
	bne _08059DE8
	adds r0, r6, #0
	bl sub_8059F5C
_08059DE8:
	ldr r0, _08059E14  @ gEkrDistanceType
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #4
	bne _08059E04
	ldr r2, [r4]
	ldrh r0, [r2]
	movs r1, #2
	orrs r0, r1
	strh r0, [r2]
	ldr r2, [r4, #4]
	ldrh r0, [r2]
	orrs r1, r0
	strh r1, [r2]
_08059E04:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08059E0C: .4byte gAnims
_08059E10: .4byte gEkrPairSideVaild
_08059E14: .4byte gEkrDistanceType

	THUMB_FUNC_END sub_8059DB8

	THUMB_FUNC_START sub_8059E18
sub_8059E18: @ 0x08059E18
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	adds r7, r0, #0
	ldr r2, _08059F20  @ gBanimRoundScripts
	lsls r1, r7, #2
	adds r0, r1, r2
	ldrb r5, [r0]
	adds r0, r1, #1
	adds r0, r0, r2
	ldrb r6, [r0]
	adds r0, r1, #2
	adds r0, r0, r2
	ldrb r0, [r0]
	mov r8, r0
	adds r1, #3
	adds r1, r1, r2
	ldrb r1, [r1]
	mov r9, r1
	ldr r0, _08059F24  @ gUnknown_080DAF1D
	ldr r1, _08059F28  @ gEkrDistanceType
	movs r2, #0
	ldrsh r1, [r1, r2]
	adds r0, r1, r0
	ldrb r4, [r0]
	ldr r3, _08059F2C  @ gUnknown_02000030
	ldr r0, _08059F30  @ gUnknown_080DAF28
	lsls r1, r1, #1
	adds r1, r1, r0
	ldrh r1, [r1]
	negs r1, r1
	movs r2, #0
	strh r1, [r3]
	ldr r0, _08059F34  @ gUnknown_02000034
	strh r2, [r0]
	ldr r0, _08059F38  @ gEkrXPosBase
	adds r1, r1, r4
	strh r1, [r0]
	ldr r1, _08059F3C  @ gEkrYPosBase
	movs r0, #0x58
	strh r0, [r1]
	ldr r0, _08059F40  @ gpBanimModesLeft
	ldr r1, [r0]
	lsls r0, r5, #2
	adds r0, r0, r1
	ldr r1, [r0]
	ldr r0, _08059F44  @ gBanimScrLeft
	adds r0, r1, r0
	cmp r5, #0xff
	bne _08059E80
	ldr r0, _08059F48  @ gUnknown_085B9D5C
_08059E80:
	adds r1, r6, #0
	bl AnimCreate
	adds r3, r0, #0
	ldr r2, _08059F38  @ gEkrXPosBase
	ldr r0, _08059F4C  @ gEkrBgXOffset
	ldr r1, [r0]
	ldrh r0, [r2]
	subs r0, r0, r1
	movs r2, #0
	strh r0, [r3, #2]
	ldr r0, _08059F3C  @ gEkrYPosBase
	ldrh r0, [r0]
	strh r0, [r3, #4]
	movs r0, #0xf4
	lsls r0, r0, #7
	strh r0, [r3, #8]
	ldrh r1, [r3, #0xc]
	movs r4, #0x80
	lsls r4, r4, #3
	adds r0, r4, #0
	orrs r0, r1
	strh r0, [r3, #0xc]
	strh r2, [r3, #0xe]
	strb r7, [r3, #0x12]
	ldr r0, _08059F50  @ gUnknown_02000088
	str r0, [r3, #0x2c]
	ldr r0, _08059F54  @ gBanimOaml
	str r0, [r3, #0x30]
	ldr r0, _08059F58  @ gAnims
	str r3, [r0]
	ldr r0, _08059F40  @ gpBanimModesLeft
	ldr r1, [r0]
	mov r2, r8
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r1, [r0]
	ldr r0, _08059F44  @ gBanimScrLeft
	adds r0, r1, r0
	cmp r2, #0xff
	bne _08059ED4
	ldr r0, _08059F48  @ gUnknown_085B9D5C
_08059ED4:
	mov r1, r9
	bl AnimCreate
	adds r3, r0, #0
	ldr r2, _08059F38  @ gEkrXPosBase
	ldr r0, _08059F4C  @ gEkrBgXOffset
	ldr r1, [r0]
	ldrh r0, [r2]
	subs r0, r0, r1
	movs r2, #0
	strh r0, [r3, #2]
	ldr r0, _08059F3C  @ gEkrYPosBase
	ldrh r0, [r0]
	strh r0, [r3, #4]
	movs r0, #0xf4
	lsls r0, r0, #7
	strh r0, [r3, #8]
	ldrh r1, [r3, #0xc]
	movs r4, #0xa0
	lsls r4, r4, #3
	adds r0, r4, #0
	orrs r0, r1
	strh r0, [r3, #0xc]
	strh r2, [r3, #0xe]
	strb r7, [r3, #0x12]
	ldr r0, _08059F50  @ gUnknown_02000088
	str r0, [r3, #0x2c]
	ldr r0, _08059F54  @ gBanimOaml
	str r0, [r3, #0x30]
	ldr r0, _08059F58  @ gAnims
	str r3, [r0, #4]
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08059F20: .4byte gBanimRoundScripts
_08059F24: .4byte gUnknown_080DAF1D
_08059F28: .4byte gEkrDistanceType
_08059F2C: .4byte gUnknown_02000030
_08059F30: .4byte gUnknown_080DAF28
_08059F34: .4byte gUnknown_02000034
_08059F38: .4byte gEkrXPosBase
_08059F3C: .4byte gEkrYPosBase
_08059F40: .4byte gpBanimModesLeft
_08059F44: .4byte gBanimScrLeft
_08059F48: .4byte gUnknown_085B9D5C
_08059F4C: .4byte gEkrBgXOffset
_08059F50: .4byte gUnknown_02000088
_08059F54: .4byte gBanimOaml
_08059F58: .4byte gAnims

	THUMB_FUNC_END sub_8059E18

	THUMB_FUNC_START sub_8059F5C
sub_8059F5C: @ 0x08059F5C
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r2, _0805A044  @ gBanimRoundScripts
	lsls r1, r5, #2
	adds r0, r1, r2
	ldrb r3, [r0]
	adds r0, r1, #1
	adds r0, r0, r2
	ldrb r4, [r0]
	adds r0, r1, #2
	adds r0, r0, r2
	ldrb r6, [r0]
	adds r1, #3
	adds r1, r1, r2
	ldrb r7, [r1]
	ldr r1, _0805A048  @ gUnknown_080DAF22
	ldr r0, _0805A04C  @ gEkrDistanceType
	movs r2, #0
	ldrsh r0, [r0, r2]
	adds r0, r0, r1
	ldrb r2, [r0]
	ldr r0, _0805A050  @ gUnknown_02000030
	movs r1, #0
	strh r1, [r0, #2]
	ldr r0, _0805A054  @ gUnknown_02000034
	strh r1, [r0, #2]
	ldr r0, _0805A058  @ gEkrXPosBase
	strh r2, [r0, #2]
	ldr r1, _0805A05C  @ gEkrYPosBase
	movs r0, #0x58
	strh r0, [r1, #2]
	ldr r0, _0805A060  @ gpBanimModesRight
	ldr r1, [r0]
	lsls r0, r3, #2
	adds r0, r0, r1
	ldr r1, [r0]
	ldr r0, _0805A064  @ gBanimScrRight
	adds r0, r1, r0
	cmp r3, #0xff
	bne _08059FAE
	ldr r0, _0805A068  @ gUnknown_085B9D5C
_08059FAE:
	adds r1, r4, #0
	bl AnimCreate
	adds r3, r0, #0
	ldr r2, _0805A058  @ gEkrXPosBase
	ldr r0, _0805A06C  @ gEkrBgXOffset
	ldr r1, [r0]
	ldrh r0, [r2, #2]
	subs r0, r0, r1
	movs r2, #0
	strh r0, [r3, #2]
	ldr r0, _0805A05C  @ gEkrYPosBase
	ldrh r0, [r0, #2]
	strh r0, [r3, #4]
	movs r0, #0x9b
	lsls r0, r0, #8
	strh r0, [r3, #8]
	ldrh r1, [r3, #0xc]
	movs r4, #0xc0
	lsls r4, r4, #3
	adds r0, r4, #0
	orrs r0, r1
	strh r0, [r3, #0xc]
	strh r2, [r3, #0xe]
	strb r5, [r3, #0x12]
	ldr r0, _0805A070  @ gUnknown_02002088
	str r0, [r3, #0x2c]
	ldr r0, _0805A074  @ gBanimOamr2
	str r0, [r3, #0x30]
	ldr r0, _0805A078  @ gAnims
	str r3, [r0, #8]
	ldr r0, _0805A060  @ gpBanimModesRight
	ldr r1, [r0]
	lsls r0, r6, #2
	adds r0, r0, r1
	ldr r1, [r0]
	ldr r0, _0805A064  @ gBanimScrRight
	adds r0, r1, r0
	cmp r6, #0xff
	bne _0805A000
	ldr r0, _0805A068  @ gUnknown_085B9D5C
_0805A000:
	adds r1, r7, #0
	bl AnimCreate
	adds r3, r0, #0
	ldr r2, _0805A058  @ gEkrXPosBase
	ldr r0, _0805A06C  @ gEkrBgXOffset
	ldr r1, [r0]
	ldrh r0, [r2, #2]
	subs r0, r0, r1
	movs r2, #0
	strh r0, [r3, #2]
	ldr r0, _0805A05C  @ gEkrYPosBase
	ldrh r0, [r0, #2]
	strh r0, [r3, #4]
	movs r0, #0x9b
	lsls r0, r0, #8
	strh r0, [r3, #8]
	ldrh r1, [r3, #0xc]
	movs r4, #0xe0
	lsls r4, r4, #3
	adds r0, r4, #0
	orrs r0, r1
	strh r0, [r3, #0xc]
	strh r2, [r3, #0xe]
	strb r5, [r3, #0x12]
	ldr r0, _0805A070  @ gUnknown_02002088
	str r0, [r3, #0x2c]
	ldr r0, _0805A074  @ gBanimOamr2
	str r0, [r3, #0x30]
	ldr r0, _0805A078  @ gAnims
	str r3, [r0, #0xc]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805A044: .4byte gBanimRoundScripts
_0805A048: .4byte gUnknown_080DAF22
_0805A04C: .4byte gEkrDistanceType
_0805A050: .4byte gUnknown_02000030
_0805A054: .4byte gUnknown_02000034
_0805A058: .4byte gEkrXPosBase
_0805A05C: .4byte gEkrYPosBase
_0805A060: .4byte gpBanimModesRight
_0805A064: .4byte gBanimScrRight
_0805A068: .4byte gUnknown_085B9D5C
_0805A06C: .4byte gEkrBgXOffset
_0805A070: .4byte gUnknown_02002088
_0805A074: .4byte gBanimOamr2
_0805A078: .4byte gAnims

	THUMB_FUNC_END sub_8059F5C

	THUMB_FUNC_START BanimSetupRoundBasedScript
BanimSetupRoundBasedScript: @ 0x0805A07C
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r6, r1, #0
	bl sub_805A154
	cmp r0, #0
	bne _0805A09C
	ldr r0, _0805A098  @ gBanimRoundScripts
	lsls r1, r6, #2
	adds r2, r1, r0
	ldrb r5, [r2]
	adds r1, #1
	adds r1, r1, r0
	b _0805A0AA
	.align 2, 0
_0805A098: .4byte gBanimRoundScripts
_0805A09C:
	ldr r2, _0805A0C8  @ gBanimRoundScripts
	lsls r1, r6, #2
	adds r0, r1, #2
	adds r0, r0, r2
	ldrb r5, [r0]
	adds r1, #3
	adds r1, r1, r2
_0805A0AA:
	ldrb r7, [r1]
	cmp r5, #0xff
	beq _0805A0F0
	adds r0, r4, #0
	bl GetAISSubjectId
	cmp r0, #0
	bne _0805A0D4
	ldr r0, _0805A0CC  @ gpBanimModesLeft
	ldr r1, [r0]
	lsls r0, r5, #2
	adds r0, r0, r1
	ldr r1, [r0]
	ldr r0, _0805A0D0  @ gBanimScrLeft
	b _0805A0E0
	.align 2, 0
_0805A0C8: .4byte gBanimRoundScripts
_0805A0CC: .4byte gpBanimModesLeft
_0805A0D0: .4byte gBanimScrLeft
_0805A0D4:
	ldr r0, _0805A0E8  @ gpBanimModesRight
	ldr r1, [r0]
	lsls r0, r5, #2
	adds r0, r0, r1
	ldr r1, [r0]
	ldr r0, _0805A0EC  @ gBanimScrRight
_0805A0E0:
	adds r1, r1, r0
	str r1, [r4, #0x24]
	str r1, [r4, #0x20]
	b _0805A0FA
	.align 2, 0
_0805A0E8: .4byte gpBanimModesRight
_0805A0EC: .4byte gBanimScrRight
_0805A0F0:
	ldr r0, _0805A148  @ gUnknown_085B9D5C
	str r0, [r4, #0x24]
	str r0, [r4, #0x20]
	movs r0, #0
	strh r0, [r4, #0x10]
_0805A0FA:
	movs r3, #0
	movs r2, #0
	strh r7, [r4, #0xa]
	ldrh r1, [r4, #8]
	ldr r0, _0805A14C  @ 0x0000F3FF
	ands r0, r1
	movs r5, #0x80
	lsls r5, r5, #4
	adds r1, r5, #0
	orrs r0, r1
	strh r0, [r4, #8]
	strh r2, [r4, #6]
	ldrh r1, [r4, #0xc]
	movs r0, #0xe0
	lsls r0, r0, #3
	ands r0, r1
	strh r0, [r4, #0xc]
	strb r6, [r4, #0x12]
	strb r3, [r4, #0x14]
	adds r0, r4, #0
	bl GetAISSubjectId
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	subs r1, r1, r0
	lsls r1, r1, #0xb
	ldr r0, _0805A150  @ gBanimOaml
	adds r1, r1, r0
	str r1, [r4, #0x30]
	bl AnimSort
	adds r0, r4, #0
	bl EkrDragonBodyAnimeSet54
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805A148: .4byte gUnknown_085B9D5C
_0805A14C: .4byte 0x0000F3FF
_0805A150: .4byte gBanimOaml

	THUMB_FUNC_END BanimSetupRoundBasedScript

	THUMB_FUNC_START sub_805A154
sub_805A154: @ 0x0805A154
	push {lr}
	ldrh r1, [r0, #0xc]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0805A166
	movs r0, #1
	b _0805A168
_0805A166:
	movs r0, #0
_0805A168:
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_805A154

	THUMB_FUNC_START GetAISSubjectId
GetAISSubjectId: @ 0x0805A16C
	push {lr}
	ldrh r1, [r0, #0xc]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0805A17E
	movs r0, #1
	b _0805A180
_0805A17E:
	movs r0, #0
_0805A180:
	pop {r1}
	bx r1

	THUMB_FUNC_END GetAISSubjectId

	THUMB_FUNC_START GetSomeBoolean
GetSomeBoolean: @ 0x0805A184
	push {lr}
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #9
	bhi _0805A1C8
	lsls r0, r0, #2
	ldr r1, _0805A198  @ _0805A19C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0805A198: .4byte _0805A19C
_0805A19C: @ jump table
	.4byte _0805A1C8 @ case 0
	.4byte _0805A1C8 @ case 1
	.4byte _0805A1C8 @ case 2
	.4byte _0805A1C8 @ case 3
	.4byte _0805A1C4 @ case 4
	.4byte _0805A1C4 @ case 5
	.4byte _0805A1C8 @ case 6
	.4byte _0805A1C8 @ case 7
	.4byte _0805A1C8 @ case 8
	.4byte _0805A1C8 @ case 9
_0805A1C4:
	movs r0, #1
	b _0805A1CA
_0805A1C8:
	movs r0, #0
_0805A1CA:
	pop {r1}
	bx r1

	THUMB_FUNC_END GetSomeBoolean

	THUMB_FUNC_START sub_805A1D0
sub_805A1D0: @ 0x0805A1D0
	push {lr}
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #9
	bhi _0805A214
	lsls r0, r0, #2
	ldr r1, _0805A1E4  @ _0805A1E8
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0805A1E4: .4byte _0805A1E8
_0805A1E8: @ jump table
	.4byte _0805A214 @ case 0
	.4byte _0805A214 @ case 1
	.4byte _0805A214 @ case 2
	.4byte _0805A214 @ case 3
	.4byte _0805A214 @ case 4
	.4byte _0805A214 @ case 5
	.4byte _0805A210 @ case 6
	.4byte _0805A210 @ case 7
	.4byte _0805A210 @ case 8
	.4byte _0805A214 @ case 9
_0805A210:
	movs r0, #1
	b _0805A216
_0805A214:
	movs r0, #0
_0805A216:
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_805A1D0

	THUMB_FUNC_START sub_805A21C
sub_805A21C: @ 0x0805A21C
	push {lr}
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #9
	bhi _0805A260
	lsls r0, r0, #2
	ldr r1, _0805A230  @ _0805A234
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0805A230: .4byte _0805A234
_0805A234: @ jump table
	.4byte _0805A25C @ case 0
	.4byte _0805A25C @ case 1
	.4byte _0805A25C @ case 2
	.4byte _0805A25C @ case 3
	.4byte _0805A260 @ case 4
	.4byte _0805A260 @ case 5
	.4byte _0805A260 @ case 6
	.4byte _0805A260 @ case 7
	.4byte _0805A260 @ case 8
	.4byte _0805A25C @ case 9
_0805A25C:
	movs r0, #1
	b _0805A262
_0805A260:
	movs r0, #0
_0805A262:
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_805A21C

	THUMB_FUNC_START sub_805A268
sub_805A268: @ 0x0805A268
	push {lr}
	ldrb r0, [r0, #0x12]
	cmp r0, #9
	bhi _0805A2AC
	lsls r0, r0, #2
	ldr r1, _0805A27C  @ _0805A280
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0805A27C: .4byte _0805A280
_0805A280: @ jump table
	.4byte _0805A2AC @ case 0
	.4byte _0805A2A8 @ case 1
	.4byte _0805A2AC @ case 2
	.4byte _0805A2A8 @ case 3
	.4byte _0805A2AC @ case 4
	.4byte _0805A2AC @ case 5
	.4byte _0805A2AC @ case 6
	.4byte _0805A2AC @ case 7
	.4byte _0805A2AC @ case 8
	.4byte _0805A2AC @ case 9
_0805A2A8:
	movs r0, #1
	b _0805A2AE
_0805A2AC:
	movs r0, #0
_0805A2AE:
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_805A268

	THUMB_FUNC_START GetCoreAIStruct
GetCoreAIStruct: @ 0x0805A2B4
	push {r4, lr}
	ldr r4, _0805A2CC  @ gAnims
	bl GetAISSubjectId
	movs r1, #1
	eors r1, r0
	lsls r1, r1, #3
	adds r1, r1, r4
	ldr r0, [r1]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0805A2CC: .4byte gAnims

	THUMB_FUNC_END GetCoreAIStruct

	THUMB_FUNC_START sub_805A2D0
sub_805A2D0: @ 0x0805A2D0
	push {r4, lr}
	adds r4, r0, #0
	bl GetAISSubjectId
	adds r1, r0, #0
	ldrh r0, [r4, #0xe]
	subs r0, #1
	lsls r0, r0, #1
	adds r0, r0, r1
	bl GetSomeAISRelatedIndexMaybeByID
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_805A2D0

	THUMB_FUNC_START sub_805A2F0
sub_805A2F0: @ 0x0805A2F0
	push {r4, lr}
	adds r4, r0, #0
	bl GetAISSubjectId
	adds r1, r0, #0
	ldrh r0, [r4, #0xe]
	lsls r0, r0, #1
	adds r0, r0, r1
	bl GetSomeAISRelatedIndexMaybeByID
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_805A2F0

	THUMB_FUNC_START GetSomeAISRelatedIndexMaybe
GetSomeAISRelatedIndexMaybe: @ 0x0805A310
	push {r4, lr}
	adds r4, r0, #0
	bl GetAISSubjectId
	adds r2, r0, #0
	ldrh r0, [r4, #0xe]
	subs r0, #1
	lsls r0, r0, #1
	movs r1, #1
	eors r1, r2
	adds r0, r0, r1
	bl GetSomeAISRelatedIndexMaybeByID
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END GetSomeAISRelatedIndexMaybe

	THUMB_FUNC_START sub_805A334
sub_805A334: @ 0x0805A334
	push {r4, lr}
	adds r4, r0, #0
	bl GetAISSubjectId
	adds r2, r0, #0
	ldrh r0, [r4, #0xe]
	lsls r0, r0, #1
	movs r1, #1
	eors r1, r2
	adds r0, r0, r1
	bl GetSomeAISRelatedIndexMaybeByID
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_805A334

	THUMB_FUNC_START SetAnimStateHidden
SetAnimStateHidden: @ 0x0805A358
	push {lr}
	cmp r0, #0
	bne _0805A374
	ldr r2, _0805A370  @ gAnims
	ldr r3, [r2]
	ldrh r0, [r3]
	movs r1, #2
	orrs r0, r1
	strh r0, [r3]
	ldr r3, [r2, #4]
	b _0805A386
	.align 2, 0
_0805A370: .4byte gAnims
_0805A374:
	cmp r0, #1
	bne _0805A38C
	ldr r2, _0805A390  @ gAnims
	ldr r3, [r2, #8]
	ldrh r0, [r3]
	movs r1, #2
	orrs r0, r1
	strh r0, [r3]
	ldr r3, [r2, #0xc]
_0805A386:
	ldrh r0, [r3]
	orrs r1, r0
	strh r1, [r3]
_0805A38C:
	pop {r0}
	bx r0
	.align 2, 0
_0805A390: .4byte gAnims

	THUMB_FUNC_END SetAnimStateHidden

	THUMB_FUNC_START SetAnimStateUnHidden
SetAnimStateUnHidden: @ 0x0805A394
	push {r4, lr}
	cmp r0, #0
	bne _0805A3B4
	ldr r3, _0805A3AC  @ gAnims
	ldr r4, [r3]
	ldrh r2, [r4]
	ldr r1, _0805A3B0  @ 0x0000FFFD
	adds r0, r1, #0
	ands r0, r2
	strh r0, [r4]
	ldr r4, [r3, #4]
	b _0805A3C8
	.align 2, 0
_0805A3AC: .4byte gAnims
_0805A3B0: .4byte 0x0000FFFD
_0805A3B4:
	cmp r0, #1
	bne _0805A3CE
	ldr r3, _0805A3D4  @ gAnims
	ldr r4, [r3, #8]
	ldrh r2, [r4]
	ldr r1, _0805A3D8  @ 0x0000FFFD
	adds r0, r1, #0
	ands r0, r2
	strh r0, [r4]
	ldr r4, [r3, #0xc]
_0805A3C8:
	ldrh r0, [r4]
	ands r1, r0
	strh r1, [r4]
_0805A3CE:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805A3D4: .4byte gAnims
_0805A3D8: .4byte 0x0000FFFD

	THUMB_FUNC_END SetAnimStateUnHidden

	THUMB_FUNC_START sub_805A3DC
sub_805A3DC: @ 0x0805A3DC
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r4, r1, #0
	cmp r4, #0
	bne _0805A3E8
	b _0805A576
_0805A3E8:
	ldrh r0, [r4, #0xc]
	movs r5, #0xf0
	lsls r5, r5, #8
	ands r5, r0
	cmp r5, #0
	bne _0805A3F6
	b _0805A576
_0805A3F6:
	movs r0, #0x80
	lsls r0, r0, #5
	ands r0, r5
	cmp r0, #0
	bne _0805A402
	b _0805A538
_0805A402:
	ldrb r0, [r4, #0x14]
	cmp r0, #0
	bne _0805A40A
	b _0805A52E
_0805A40A:
	adds r0, r4, r0
	ldrb r0, [r0, #0x14]
	cmp r0, #0x32
	bls _0805A414
	b _0805A526
_0805A414:
	lsls r0, r0, #2
	ldr r1, _0805A420  @ _0805A424
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0805A420: .4byte _0805A424
_0805A424: @ jump table
	.4byte _0805A526 @ case 0
	.4byte _0805A4F0 @ case 1
	.4byte _0805A4F0 @ case 2
	.4byte _0805A508 @ case 3
	.4byte _0805A508 @ case 4
	.4byte _0805A4F8 @ case 5
	.4byte _0805A526 @ case 6
	.4byte _0805A526 @ case 7
	.4byte _0805A526 @ case 8
	.4byte _0805A526 @ case 9
	.4byte _0805A526 @ case 10
	.4byte _0805A526 @ case 11
	.4byte _0805A526 @ case 12
	.4byte _0805A510 @ case 13
	.4byte _0805A518 @ case 14
	.4byte _0805A526 @ case 15
	.4byte _0805A526 @ case 16
	.4byte _0805A526 @ case 17
	.4byte _0805A526 @ case 18
	.4byte _0805A526 @ case 19
	.4byte _0805A526 @ case 20
	.4byte _0805A526 @ case 21
	.4byte _0805A526 @ case 22
	.4byte _0805A526 @ case 23
	.4byte _0805A520 @ case 24
	.4byte _0805A526 @ case 25
	.4byte _0805A526 @ case 26
	.4byte _0805A526 @ case 27
	.4byte _0805A526 @ case 28
	.4byte _0805A526 @ case 29
	.4byte _0805A526 @ case 30
	.4byte _0805A526 @ case 31
	.4byte _0805A526 @ case 32
	.4byte _0805A526 @ case 33
	.4byte _0805A526 @ case 34
	.4byte _0805A526 @ case 35
	.4byte _0805A526 @ case 36
	.4byte _0805A526 @ case 37
	.4byte _0805A526 @ case 38
	.4byte _0805A526 @ case 39
	.4byte _0805A526 @ case 40
	.4byte _0805A526 @ case 41
	.4byte _0805A526 @ case 42
	.4byte _0805A526 @ case 43
	.4byte _0805A526 @ case 44
	.4byte _0805A526 @ case 45
	.4byte _0805A526 @ case 46
	.4byte _0805A526 @ case 47
	.4byte _0805A526 @ case 48
	.4byte _0805A526 @ case 49
	.4byte _0805A526 @ case 50
_0805A4F0:
	adds r0, r4, #0
	bl sub_805A580
	b _0805A526
_0805A4F8:
	adds r0, r4, #0
	bl sub_805A154
	cmp r0, #0
	bne _0805A508
	adds r0, r4, #0
	bl sub_806EB54
_0805A508:
	ldr r0, [r4, #0x20]
	adds r0, #4
	str r0, [r4, #0x20]
	b _0805A526
_0805A510:
	adds r0, r4, #0
	bl sub_805A5A8
	b _0805A526
_0805A518:
	adds r0, r4, #0
	bl sub_806EB54
	b _0805A526
_0805A520:
	adds r0, r4, #0
	bl sub_805A580
_0805A526:
	ldrb r0, [r4, #0x14]
	subs r0, #1
	strb r0, [r4, #0x14]
	b _0805A402
_0805A52E:
	ldrh r1, [r4, #0xc]
	movs r0, #0xe7
	lsls r0, r0, #8
	ands r0, r1
	strh r0, [r4, #0xc]
_0805A538:
	movs r0, #0x80
	lsls r0, r0, #6
	ands r0, r5
	cmp r0, #0
	beq _0805A568
	adds r0, r4, #0
	bl sub_805A154
	cmp r0, #0
	bne _0805A55E
	ldr r1, [r6, #0x2c]
	ldr r0, [r4, #0x28]
	cmp r1, r0
	beq _0805A55E
	adds r0, r4, #0
	bl RegisterAISSheetGraphics
	ldr r0, [r4, #0x28]
	str r0, [r6, #0x2c]
_0805A55E:
	ldrh r1, [r4, #0xc]
	movs r0, #0xd7
	lsls r0, r0, #8
	ands r0, r1
	strh r0, [r4, #0xc]
_0805A568:
	movs r0, #0x80
	lsls r0, r0, #7
	ands r5, r0
	cmp r5, #0
	beq _0805A576
	ldr r0, _0805A57C  @ 0x0000FFFF
	strh r0, [r4, #0xe]
_0805A576:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0805A57C: .4byte 0x0000FFFF

	THUMB_FUNC_END sub_805A3DC

	THUMB_FUNC_START sub_805A580
sub_805A580: @ 0x0805A580
	push {lr}
	adds r1, r0, #0
	ldr r0, _0805A5A4  @ 0x0000FFFE
	strh r0, [r1, #0xe]
	ldrh r0, [r1, #0x10]
	movs r2, #8
	ands r2, r0
	cmp r2, #0
	beq _0805A59E
	strh r2, [r1, #0x10]
	movs r0, #0
	strh r0, [r1, #0xe]
	ldr r0, [r1, #0x20]
	adds r0, #4
	str r0, [r1, #0x20]
_0805A59E:
	pop {r0}
	bx r0
	.align 2, 0
_0805A5A4: .4byte 0x0000FFFE

	THUMB_FUNC_END sub_805A580

	THUMB_FUNC_START sub_805A5A8
sub_805A5A8: @ 0x0805A5A8
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r5, [r6, #0x44]
	ldr r4, _0805A600  @ banim_data
	bl sub_805A154
	cmp r0, #0
	bne _0805A5FA
	ldr r0, _0805A604  @ gBanimRoundScripts
	ldrb r1, [r0, #0x18]
	movs r2, #6
	ldrsh r0, [r5, r2]
	lsls r0, r0, #5
	adds r0, r0, r4
	ldr r0, [r0, #0xc]
	ldr r2, [r5, #0x14]
	ldr r3, [r5, #0x18]
	ldr r4, [r5, #0x28]
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r1, [r1]
	adds r1, r4, r1
	ldr r0, [r1, #4]
	str r0, [r2, #0x28]
	ldr r4, [r2, #0x30]
	ldr r1, [r1, #8]
	adds r4, r4, r1
	str r4, [r2, #0x3c]
	ldr r4, [r3, #0x30]
	ldr r0, _0805A608  @ 0x000057F0
	adds r4, r4, r0
	str r4, [r3, #0x3c]
	ldr r1, [r5, #0x2c]
	ldr r0, [r6, #0x28]
	cmp r1, r0
	beq _0805A5FA
	adds r0, r6, #0
	bl NewEkrChienCHR
	ldr r0, [r6, #0x28]
	str r0, [r5, #0x2c]
_0805A5FA:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0805A600: .4byte banim_data
_0805A604: .4byte gBanimRoundScripts
_0805A608: .4byte 0x000057F0

	THUMB_FUNC_END sub_805A5A8

	THUMB_FUNC_START sub_805A60C
sub_805A60C: @ 0x0805A60C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, _0805A694  @ banim_data
	mov r9, r0
	ldr r2, _0805A698  @ gBanimRoundScripts
	ldrh r1, [r4, #0xa]
	lsls r1, r1, #2
	adds r0, r1, r2
	ldrb r5, [r0]
	adds r0, r1, #1
	adds r0, r0, r2
	ldrb r0, [r0]
	mov r8, r0
	adds r0, r1, #2
	adds r0, r0, r2
	ldrb r6, [r0]
	adds r1, #3
	adds r1, r1, r2
	ldrb r1, [r1]
	mov sl, r1
	movs r1, #6
	ldrsh r0, [r4, r1]
	lsls r0, r0, #5
	add r0, r9
	ldr r0, [r0, #0x10]
	ldr r1, [r4, #0x28]
	bl LZ77UnCompWram
	movs r2, #6
	ldrsh r0, [r4, r2]
	lsls r0, r0, #5
	mov r3, r9
	adds r1, r0, r3
	ldr r2, [r1, #0xc]
	ldr r3, [r4, #0x28]
	ldr r7, _0805A69C  @ gUnknown_085B9D5C
	cmp r5, #0xff
	beq _0805A66A
	lsls r0, r5, #2
	adds r0, r0, r2
	ldr r0, [r0]
	adds r7, r3, r0
_0805A66A:
	ldr r0, _0805A69C  @ gUnknown_085B9D5C
	str r0, [sp]
	cmp r6, #0xff
	beq _0805A67C
	lsls r0, r6, #2
	adds r0, r0, r2
	ldr r0, [r0]
	adds r3, r3, r0
	str r3, [sp]
_0805A67C:
	ldrh r0, [r4, #0xc]
	cmp r0, #0
	bne _0805A6A4
	ldr r5, [r4, #0x24]
	ldr r0, [r1, #0x18]
	adds r1, r5, #0
	bl LZ77UnCompWram
	ldr r2, _0805A6A0  @ 0x000057F0
	adds r1, r5, r2
	b _0805A6B2
	.align 2, 0
_0805A694: .4byte banim_data
_0805A698: .4byte gBanimRoundScripts
_0805A69C: .4byte gUnknown_085B9D5C
_0805A6A0: .4byte 0x000057F0
_0805A6A4:
	ldr r5, [r4, #0x24]
	ldr r0, [r1, #0x14]
	adds r1, r5, #0
	bl LZ77UnCompWram
	ldr r3, _0805A70C  @ 0x000057F0
	adds r1, r5, r3
_0805A6B2:
	movs r0, #1
	str r0, [r1]
	mov r1, r8
	adds r0, r7, #0
	bl AnimCreate
	adds r2, r0, #0
	ldr r0, [r4, #0x24]
	str r0, [r2, #0x30]
	ldrh r0, [r4, #2]
	movs r5, #0
	strh r0, [r2, #2]
	ldrh r0, [r4, #4]
	strh r0, [r2, #4]
	ldrh r0, [r4, #0x10]
	lsls r0, r0, #0xc
	movs r1, #0x80
	lsls r1, r1, #4
	adds r6, r1, #0
	orrs r0, r6
	ldrh r1, [r4, #0xe]
	orrs r0, r1
	strh r0, [r2, #8]
	ldrh r0, [r4, #0xc]
	lsls r0, r0, #9
	movs r3, #0x80
	lsls r3, r3, #3
	adds r1, r3, #0
	orrs r0, r1
	ldrh r1, [r2, #0xc]
	orrs r0, r1
	strh r0, [r2, #0xc]
	strh r5, [r2, #0xe]
	ldrh r0, [r4, #0xa]
	strb r0, [r2, #0x12]
	ldr r0, [r4, #0x1c]
	str r0, [r2, #0x2c]
	str r2, [r4, #0x14]
	str r4, [r2, #0x44]
	movs r1, #6
	ldrsh r0, [r4, r1]
	cmp r0, #0xc4
	bne _0805A710
	str r5, [r4, #0x18]
	b _0805A752
	.align 2, 0
_0805A70C: .4byte 0x000057F0
_0805A710:
	mov r1, sl
	ldr r0, [sp]
	bl AnimCreate
	adds r2, r0, #0
	ldr r0, [r4, #0x24]
	str r0, [r2, #0x30]
	ldrh r0, [r4, #2]
	strh r0, [r2, #2]
	ldrh r0, [r4, #4]
	strh r0, [r2, #4]
	ldrh r0, [r4, #0x10]
	lsls r0, r0, #0xc
	orrs r0, r6
	ldrh r1, [r4, #0xe]
	orrs r0, r1
	strh r0, [r2, #8]
	ldrh r0, [r4, #0xc]
	lsls r0, r0, #9
	movs r3, #0xa0
	lsls r3, r3, #3
	adds r1, r3, #0
	orrs r0, r1
	ldrh r1, [r2, #0xc]
	orrs r0, r1
	strh r0, [r2, #0xc]
	strh r5, [r2, #0xe]
	ldrh r0, [r4, #0xa]
	strb r0, [r2, #0x12]
	ldr r0, [r4, #0x1c]
	str r0, [r2, #0x2c]
	str r2, [r4, #0x18]
	str r4, [r2, #0x44]
_0805A752:
	movs r1, #6
	ldrsh r0, [r4, r1]
	lsls r0, r0, #5
	add r0, r9
	ldr r0, [r0, #0x1c]
	ldr r1, [r4, #0x20]
	bl LZ77UnCompWram
	movs r2, #8
	ldrsh r1, [r4, r2]
	movs r0, #1
	negs r0, r0
	cmp r1, r0
	beq _0805A77E
	adds r0, r1, #0
	lsls r0, r0, #4
	ldr r1, _0805A7AC  @ character_battle_animation_palette_table
	adds r0, r0, r1
	ldr r0, [r0, #0xc]
	ldr r1, [r4, #0x20]
	bl LZ77UnCompWram
_0805A77E:
	ldrb r1, [r4, #1]
	lsls r1, r1, #5
	ldr r0, [r4, #0x20]
	adds r0, r0, r1
	ldrh r1, [r4, #0x10]
	lsls r1, r1, #5
	ldr r2, _0805A7B0  @ pPalette10Buffer
	adds r1, r1, r2
	movs r2, #8
	bl CpuFastSet
	bl EnablePaletteSync
	movs r0, #0
	str r0, [r4, #0x2c]
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805A7AC: .4byte character_battle_animation_palette_table
_0805A7B0: .4byte pPalette10Buffer

	THUMB_FUNC_END sub_805A60C

	THUMB_FUNC_START sub_805A7B4
sub_805A7B4: @ 0x0805A7B4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	adds r7, r0, #0
	ldr r0, _0805A82C  @ banim_data
	mov sl, r0
	ldr r2, _0805A830  @ gBanimRoundScripts
	ldrh r0, [r7, #0xa]
	lsls r0, r0, #2
	adds r1, r0, r2
	ldrb r4, [r1]
	adds r0, #2
	adds r0, r0, r2
	ldrb r5, [r0]
	movs r1, #6
	ldrsh r0, [r7, r1]
	lsls r0, r0, #5
	add r0, sl
	ldr r0, [r0, #0x10]
	ldr r1, [r7, #0x28]
	bl LZ77UnCompWram
	movs r2, #6
	ldrsh r0, [r7, r2]
	lsls r0, r0, #5
	mov r2, sl
	adds r1, r0, r2
	ldr r2, [r1, #0xc]
	ldr r3, [r7, #0x28]
	ldr r0, _0805A834  @ gUnknown_085B9D5C
	mov r8, r0
	cmp r4, #0xff
	beq _0805A804
	lsls r0, r4, #2
	adds r0, r0, r2
	ldr r0, [r0]
	adds r0, r0, r3
	mov r8, r0
_0805A804:
	ldr r0, _0805A834  @ gUnknown_085B9D5C
	mov r9, r0
	cmp r5, #0xff
	beq _0805A816
	lsls r0, r5, #2
	adds r0, r0, r2
	ldr r0, [r0]
	adds r3, r3, r0
	mov r9, r3
_0805A816:
	ldrh r0, [r7, #0xc]
	cmp r0, #0
	bne _0805A83C
	ldr r4, [r7, #0x24]
	ldr r0, [r1, #0x18]
	adds r1, r4, #0
	bl LZ77UnCompWram
	ldr r2, _0805A838  @ 0x000057F0
	adds r1, r4, r2
	b _0805A84A
	.align 2, 0
_0805A82C: .4byte banim_data
_0805A830: .4byte gBanimRoundScripts
_0805A834: .4byte gUnknown_085B9D5C
_0805A838: .4byte 0x000057F0
_0805A83C:
	ldr r4, [r7, #0x24]
	ldr r0, [r1, #0x14]
	adds r1, r4, #0
	bl LZ77UnCompWram
	ldr r0, _0805A924  @ 0x000057F0
	adds r1, r4, r0
_0805A84A:
	movs r0, #1
	str r0, [r1]
	ldr r6, [r7, #0x14]
	mov r1, r8
	str r1, [r6, #0x24]
	str r1, [r6, #0x20]
	ldr r0, [r7, #0x24]
	str r0, [r6, #0x30]
	ldrh r0, [r7, #2]
	movs r5, #0
	movs r3, #0
	strh r0, [r6, #2]
	ldrh r0, [r7, #4]
	strh r0, [r6, #4]
	ldrh r0, [r7, #0x10]
	lsls r0, r0, #0xc
	movs r2, #0x80
	lsls r2, r2, #4
	adds r4, r2, #0
	orrs r0, r4
	ldrh r1, [r7, #0xe]
	orrs r0, r1
	strh r0, [r6, #8]
	ldrh r1, [r6, #0xc]
	movs r2, #0xe0
	lsls r2, r2, #3
	adds r0, r2, #0
	ands r0, r1
	strh r0, [r6, #0xc]
	strh r3, [r6, #0x10]
	strh r3, [r6, #6]
	strh r3, [r6, #0xe]
	ldrh r0, [r7, #0xa]
	strb r0, [r6, #0x12]
	ldr r0, [r7, #0x1c]
	str r0, [r6, #0x2c]
	strb r5, [r6, #0x14]
	str r6, [r7, #0x14]
	ldr r6, [r7, #0x18]
	mov r0, r9
	str r0, [r6, #0x24]
	str r0, [r6, #0x20]
	ldr r0, [r7, #0x24]
	str r0, [r6, #0x30]
	ldrh r0, [r7, #2]
	strh r0, [r6, #2]
	ldrh r0, [r7, #4]
	strh r0, [r6, #4]
	ldrh r0, [r7, #0x10]
	lsls r0, r0, #0xc
	orrs r0, r4
	ldrh r1, [r7, #0xe]
	orrs r0, r1
	strh r0, [r6, #8]
	ldrh r0, [r6, #0xc]
	ands r2, r0
	strh r2, [r6, #0xc]
	strh r3, [r6, #0x10]
	strh r3, [r6, #6]
	strh r3, [r6, #0xe]
	ldrh r0, [r7, #0xa]
	strb r0, [r6, #0x12]
	ldr r0, [r7, #0x1c]
	str r0, [r6, #0x2c]
	strb r5, [r6, #0x14]
	str r6, [r7, #0x18]
	movs r1, #6
	ldrsh r0, [r7, r1]
	lsls r0, r0, #5
	add r0, sl
	ldr r0, [r0, #0x1c]
	ldr r1, [r7, #0x20]
	bl LZ77UnCompWram
	movs r2, #8
	ldrsh r1, [r7, r2]
	movs r0, #1
	negs r0, r0
	cmp r1, r0
	beq _0805A8FA
	adds r0, r1, #0
	lsls r0, r0, #4
	ldr r2, _0805A928  @ character_battle_animation_palette_table
	adds r0, r0, r2
	ldr r0, [r0, #0xc]
	ldr r1, [r7, #0x20]
	bl LZ77UnCompWram
_0805A8FA:
	ldrb r1, [r7, #1]
	lsls r1, r1, #5
	ldr r0, [r7, #0x20]
	adds r0, r0, r1
	ldrh r1, [r7, #0x10]
	lsls r1, r1, #5
	ldr r2, _0805A92C  @ pPalette10Buffer
	adds r1, r1, r2
	movs r2, #8
	bl CpuFastSet
	bl EnablePaletteSync
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805A924: .4byte 0x000057F0
_0805A928: .4byte character_battle_animation_palette_table
_0805A92C: .4byte pPalette10Buffer

	THUMB_FUNC_END sub_805A7B4

	THUMB_FUNC_START sub_805A930
sub_805A930: @ 0x0805A930
	push {lr}
	strh r1, [r0, #6]
	strh r2, [r0, #8]
	bl sub_805A7B4
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_805A930

	THUMB_FUNC_START sub_805A940
sub_805A940: @ 0x0805A940
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	strh r1, [r0, #2]
	strh r2, [r0, #4]
	ldr r2, [r0, #0x14]
	strh r1, [r2, #2]
	ldrh r1, [r0, #4]
	strh r1, [r2, #4]
	ldr r2, [r0, #0x18]
	ldrh r1, [r0, #2]
	strh r1, [r2, #2]
	ldrh r0, [r0, #4]
	strh r0, [r2, #4]
	bx lr

	THUMB_FUNC_END sub_805A940

	THUMB_FUNC_START sub_805A95C
sub_805A95C: @ 0x0805A95C
	lsls r1, r1, #0x10
	ldr r2, [r0, #0x14]
	lsrs r1, r1, #6
	strh r1, [r2, #8]
	ldr r2, [r0, #0x18]
	strh r1, [r2, #8]
	bx lr

	THUMB_FUNC_END sub_805A95C

	THUMB_FUNC_START sub_805A96C
sub_805A96C: @ 0x0805A96C
	push {lr}
	ldr r1, [r0, #0x14]
	ldr r2, [r0, #0x18]
	ldrh r0, [r1, #0xe]
	ldr r1, _0805A984  @ 0x0000FFFE
	cmp r0, r1
	beq _0805A988
	ldrh r0, [r2, #0xe]
	cmp r0, r1
	beq _0805A988
	movs r0, #0
	b _0805A98A
	.align 2, 0
_0805A984: .4byte 0x0000FFFE
_0805A988:
	movs r0, #1
_0805A98A:
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_805A96C

	THUMB_FUNC_START sub_805A990
sub_805A990: @ 0x0805A990
	ldr r3, [r0, #0x14]
	ldrh r1, [r3, #0x10]
	movs r2, #8
	orrs r1, r2
	strh r1, [r3, #0x10]
	ldr r3, [r0, #0x18]
	ldrh r0, [r3, #0x10]
	orrs r2, r0
	strh r2, [r3, #0x10]
	bx lr

	THUMB_FUNC_END sub_805A990

	THUMB_FUNC_START sub_805A9A4
sub_805A9A4: @ 0x0805A9A4
	push {lr}
	ldr r0, [r0, #0x14]
	ldrh r1, [r0, #0xe]
	ldr r0, _0805A9B4  @ 0x0000FFFF
	cmp r1, r0
	bne _0805A9B8
	movs r0, #1
	b _0805A9BA
	.align 2, 0
_0805A9B4: .4byte 0x0000FFFF
_0805A9B8:
	movs r0, #0
_0805A9BA:
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_805A9A4

	THUMB_FUNC_START NewEfxAnimeDrvProc
NewEfxAnimeDrvProc: @ 0x0805A9C0
	push {r4, lr}
	ldr r4, _0805A9D8  @ gpProcEfxAnimeDrv
	ldr r0, _0805A9DC  @ gProc_efxAnimeDrvProc
	movs r1, #4
	bl Proc_Start
	str r0, [r4]
	bl AnimClearAll
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805A9D8: .4byte gpProcEfxAnimeDrv
_0805A9DC: .4byte gProc_efxAnimeDrvProc

	THUMB_FUNC_END NewEfxAnimeDrvProc

	THUMB_FUNC_START EndEfxAnimeDrvProc
EndEfxAnimeDrvProc: @ 0x0805A9E0
	push {lr}
	ldr r0, _0805A9F0  @ gpProcEfxAnimeDrv
	ldr r0, [r0]
	bl Proc_End
	pop {r0}
	bx r0
	.align 2, 0
_0805A9F0: .4byte gpProcEfxAnimeDrv

	THUMB_FUNC_END EndEfxAnimeDrvProc

	THUMB_FUNC_START ExecAllAIS
ExecAllAIS: @ 0x0805A9F4
	push {lr}
	bl AnimUpdateAll
	pop {r0}
	bx r0

	THUMB_FUNC_END ExecAllAIS

	THUMB_FUNC_START NewEkrUnitMainMini
NewEkrUnitMainMini: @ 0x0805AA00
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, _0805AA24  @ ProcScr_ekrUnitMainMini
	movs r1, #4
	bl Proc_Start
	adds r5, r0, #0
	adds r0, r4, #0
	bl sub_805A60C
	str r4, [r5, #0x5c]
	str r5, [r4, #0x34]
	movs r0, #1
	strb r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805AA24: .4byte ProcScr_ekrUnitMainMini

	THUMB_FUNC_END NewEkrUnitMainMini

	THUMB_FUNC_START sub_805AA28
sub_805AA28: @ 0x0805AA28
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x14]
	bl AnimDelete
	ldr r0, [r4, #0x18]
	bl AnimDelete
	movs r0, #0
	str r0, [r4, #0x14]
	str r0, [r4, #0x18]
	ldr r0, [r4, #0x34]
	bl Proc_End
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_805AA28

	THUMB_FUNC_START EkrUnitMainMiniMain
EkrUnitMainMiniMain: @ 0x0805AA4C
	push {r4, lr}
	ldr r4, [r0, #0x5c]
	ldr r1, [r4, #0x14]
	adds r0, r4, #0
	bl sub_805A3DC
	ldr r1, [r4, #0x18]
	adds r0, r4, #0
	bl sub_805A3DC
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END EkrUnitMainMiniMain

	THUMB_FUNC_START sub_805AA68
sub_805AA68: @ 0x0805AA68
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	sub sp, #0xc
	adds r6, r0, #0
	movs r0, #0
	ldrsh r1, [r6, r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	ldr r2, _0805AAD0  @ battle_terrain_table
	adds r0, r0, r2
	mov r8, r0
	movs r0, #6
	ldrsh r1, [r6, r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r5, r0, r2
	movs r1, #0
	ldrsh r0, [r6, r1]
	movs r4, #1
	negs r4, r4
	cmp r0, r4
	beq _0805AAA6
	mov r2, r8
	ldr r0, [r2, #0xc]
	ldr r1, [r6, #0x20]
	bl LZ77UnCompWram
_0805AAA6:
	movs r1, #6
	ldrsh r0, [r6, r1]
	cmp r0, r4
	beq _0805AABC
	ldr r0, [r5, #0xc]
	ldr r1, [r6, #0x20]
	movs r2, #0x80
	lsls r2, r2, #5
	adds r1, r1, r2
	bl LZ77UnCompWram
_0805AABC:
	movs r1, #0xc
	ldrsh r0, [r6, r1]
	cmp r0, #3
	bgt _0805AAD4
	cmp r0, #1
	bge _0805AAE2
	cmp r0, #0
	beq _0805AAD8
	b _0805AAE2
	.align 2, 0
_0805AAD0: .4byte battle_terrain_table
_0805AAD4:
	cmp r0, #4
	bne _0805AAE2
_0805AAD8:
	ldr r3, [r6, #0x20]
	movs r2, #0x80
	lsls r2, r2, #5
	adds r7, r3, r2
	b _0805AAF0
_0805AAE2:
	ldr r0, [r6, #0x20]
	movs r1, #0x80
	lsls r1, r1, #4
	adds r3, r0, r1
	movs r2, #0xc0
	lsls r2, r2, #5
	adds r7, r0, r2
_0805AAF0:
	mov r0, r8
	ldr r0, [r0, #0x10]
	mov r8, r0
	ldr r5, [r5, #0x10]
	mov r9, r5
	movs r1, #0xe
	ldrsh r4, [r6, r1]
	movs r0, #1
	negs r0, r0
	cmp r4, r0
	beq _0805AB74
	cmp r4, r0
	blt _0805ABD4
	cmp r4, #3
	bgt _0805ABD4
	movs r2, #4
	ldrsh r0, [r6, r2]
	adds r0, #0x40
	lsls r0, r0, #5
	movs r4, #0xc0
	lsls r4, r4, #0x13
	adds r0, r0, r4
	ldr r1, [r6, #0x1c]
	adds r1, r1, r0
	movs r5, #0x80
	lsls r5, r5, #4
	adds r0, r3, #0
	adds r2, r5, #0
	bl RegisterTileGraphics
	movs r1, #0xa
	ldrsh r0, [r6, r1]
	lsls r0, r0, #5
	adds r0, r0, r4
	ldr r1, [r6, #0x1c]
	adds r1, r1, r0
	adds r0, r7, #0
	adds r2, r5, #0
	bl RegisterTileGraphics
	movs r2, #2
	ldrsh r1, [r6, r2]
	lsls r1, r1, #5
	ldr r4, _0805AB70  @ gPaletteBuffer
	adds r1, r1, r4
	mov r0, r8
	movs r2, #8
	bl CpuFastSet
	movs r0, #8
	ldrsh r1, [r6, r0]
	lsls r1, r1, #5
	adds r1, r1, r4
	mov r0, r9
	movs r2, #8
	bl CpuFastSet
	bl EnablePaletteSync
	adds r0, r6, #0
	bl sub_805AE58
	b _0805ABD4
	.align 2, 0
_0805AB70: .4byte gPaletteBuffer
_0805AB74:
	movs r1, #0
	ldrsh r0, [r6, r1]
	cmp r0, r4
	beq _0805ABA2
	movs r2, #4
	ldrsh r0, [r6, r2]
	lsls r0, r0, #5
	ldr r1, [r6, #0x1c]
	adds r1, r1, r0
	movs r2, #0x80
	lsls r2, r2, #4
	adds r0, r3, #0
	bl RegisterTileGraphics
	movs r0, #2
	ldrsh r1, [r6, r0]
	lsls r1, r1, #5
	ldr r0, _0805ABEC  @ pPalette10Buffer
	adds r1, r1, r0
	mov r0, r8
	movs r2, #8
	bl CpuFastSet
_0805ABA2:
	movs r1, #6
	ldrsh r0, [r6, r1]
	cmp r0, r4
	beq _0805ABD0
	movs r2, #0xa
	ldrsh r0, [r6, r2]
	lsls r0, r0, #5
	ldr r1, [r6, #0x1c]
	adds r1, r1, r0
	movs r2, #0x80
	lsls r2, r2, #4
	adds r0, r7, #0
	bl RegisterTileGraphics
	movs r0, #8
	ldrsh r1, [r6, r0]
	lsls r1, r1, #5
	ldr r0, _0805ABEC  @ pPalette10Buffer
	adds r1, r1, r0
	mov r0, r9
	movs r2, #8
	bl CpuFastSet
_0805ABD0:
	bl EnablePaletteSync
_0805ABD4:
	ldrh r0, [r6, #0xe]
	adds r0, #1
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #4
	bls _0805ABE2
	b _0805AE02
_0805ABE2:
	lsls r0, r0, #2
	ldr r1, _0805ABF0  @ _0805ABF4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0805ABEC: .4byte pPalette10Buffer
_0805ABF0: .4byte _0805ABF4
_0805ABF4: @ jump table
	.4byte _0805AC28 @ case 0
	.4byte _0805AC08 @ case 1
	.4byte _0805AC10 @ case 2
	.4byte _0805AC18 @ case 3
	.4byte _0805AC20 @ case 4
_0805AC08:
	movs r0, #1
	bl BG_EnableSyncByMask
	b _0805AE02
_0805AC10:
	movs r0, #2
	bl BG_EnableSyncByMask
	b _0805AE02
_0805AC18:
	movs r0, #4
	bl BG_EnableSyncByMask
	b _0805AE02
_0805AC20:
	movs r0, #8
	bl BG_EnableSyncByMask
	b _0805AE02
_0805AC28:
	movs r0, #0
	str r0, [r6, #0x14]
	str r0, [r6, #0x18]
	movs r2, #6
	ldrsh r1, [r6, r2]
	subs r0, #1
	cmp r1, r0
	beq _0805AD16
	movs r1, #0xc
	ldrsh r0, [r6, r1]
	cmp r0, #4
	bhi _0805AD16
	lsls r0, r0, #2
	ldr r1, _0805AC4C  @ _0805AC50
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0805AC4C: .4byte _0805AC50
_0805AC50: @ jump table
	.4byte _0805AC64 @ case 0
	.4byte _0805AC90 @ case 1
	.4byte _0805ACBC @ case 2
	.4byte _0805ACE8 @ case 3
	.4byte _0805AC64 @ case 4
_0805AC64:
	movs r2, #8
	ldrsh r0, [r6, r2]
	lsls r0, r0, #0xc
	ldrh r1, [r6, #0xa]
	orrs r0, r1
	movs r2, #0xc0
	lsls r2, r2, #4
	adds r1, r2, #0
	orrs r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r2, _0805AC8C  @ gUnknown_085C73B8
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	movs r0, #4
	str r0, [sp, #8]
	movs r0, #0xa8
	b _0805AD0C
	.align 2, 0
_0805AC8C: .4byte gUnknown_085C73B8
_0805AC90:
	movs r1, #8
	ldrsh r0, [r6, r1]
	lsls r0, r0, #0xc
	ldrh r1, [r6, #0xa]
	orrs r0, r1
	movs r2, #0xc0
	lsls r2, r2, #4
	adds r1, r2, #0
	orrs r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r2, _0805ACB8  @ gUnknown_085C72AC
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	movs r0, #4
	str r0, [sp, #8]
	movs r0, #0xb0
	b _0805AD0C
	.align 2, 0
_0805ACB8: .4byte gUnknown_085C72AC
_0805ACBC:
	movs r1, #8
	ldrsh r0, [r6, r1]
	lsls r0, r0, #0xc
	ldrh r1, [r6, #0xa]
	orrs r0, r1
	movs r2, #0xc0
	lsls r2, r2, #4
	adds r1, r2, #0
	orrs r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r2, _0805ACE4  @ gUnknown_085C72AC
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	movs r0, #4
	str r0, [sp, #8]
	movs r0, #0xb0
	b _0805AD0C
	.align 2, 0
_0805ACE4: .4byte gUnknown_085C72AC
_0805ACE8:
	movs r1, #8
	ldrsh r0, [r6, r1]
	lsls r0, r0, #0xc
	ldrh r1, [r6, #0xa]
	orrs r0, r1
	movs r2, #0xc0
	lsls r2, r2, #4
	adds r1, r2, #0
	orrs r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r2, _0805AD34  @ gUnknown_085C72AC
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	movs r0, #4
	str r0, [sp, #8]
	movs r0, #0x80
_0805AD0C:
	movs r1, #0x68
	movs r3, #2
	bl NewEkrsubAnimeEmulator
	str r0, [r6, #0x18]
_0805AD16:
	movs r0, #0
	ldrsh r1, [r6, r0]
	movs r0, #1
	negs r0, r0
	cmp r1, r0
	beq _0805AE02
	movs r1, #0xc
	ldrsh r0, [r6, r1]
	cmp r0, #4
	bhi _0805AE02
	lsls r0, r0, #2
	ldr r1, _0805AD38  @ _0805AD3C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0805AD34: .4byte gUnknown_085C72AC
_0805AD38: .4byte _0805AD3C
_0805AD3C: @ jump table
	.4byte _0805AD50 @ case 0
	.4byte _0805AD7C @ case 1
	.4byte _0805ADA8 @ case 2
	.4byte _0805ADD4 @ case 3
	.4byte _0805AD50 @ case 4
_0805AD50:
	movs r2, #2
	ldrsh r0, [r6, r2]
	lsls r0, r0, #0xc
	ldrh r1, [r6, #4]
	orrs r0, r1
	movs r2, #0xc0
	lsls r2, r2, #4
	adds r1, r2, #0
	orrs r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r2, _0805AD78  @ gUnknown_085C7438
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	movs r0, #4
	str r0, [sp, #8]
	movs r0, #0x48
	b _0805ADF8
	.align 2, 0
_0805AD78: .4byte gUnknown_085C7438
_0805AD7C:
	movs r1, #2
	ldrsh r0, [r6, r1]
	lsls r0, r0, #0xc
	ldrh r1, [r6, #4]
	orrs r0, r1
	movs r2, #0xc0
	lsls r2, r2, #4
	adds r1, r2, #0
	orrs r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r2, _0805ADA4  @ gUnknown_085C7338
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	movs r0, #4
	str r0, [sp, #8]
	movs r0, #0x20
	b _0805ADF8
	.align 2, 0
_0805ADA4: .4byte gUnknown_085C7338
_0805ADA8:
	movs r1, #2
	ldrsh r0, [r6, r1]
	lsls r0, r0, #0xc
	ldrh r1, [r6, #4]
	orrs r0, r1
	movs r2, #0xc0
	lsls r2, r2, #4
	adds r1, r2, #0
	orrs r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r2, _0805ADD0  @ gUnknown_085C7338
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	movs r0, #4
	str r0, [sp, #8]
	movs r0, #0x40
	b _0805ADF8
	.align 2, 0
_0805ADD0: .4byte gUnknown_085C7338
_0805ADD4:
	movs r1, #2
	ldrsh r0, [r6, r1]
	lsls r0, r0, #0xc
	ldrh r1, [r6, #4]
	orrs r0, r1
	movs r2, #0xc0
	lsls r2, r2, #4
	adds r1, r2, #0
	orrs r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r2, _0805AE10  @ gUnknown_085C7438
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	movs r0, #4
	str r0, [sp, #8]
	movs r0, #0x78
_0805ADF8:
	movs r1, #0x68
	movs r3, #2
	bl NewEkrsubAnimeEmulator
	str r0, [r6, #0x14]
_0805AE02:
	add sp, #0xc
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805AE10: .4byte gUnknown_085C7438

	THUMB_FUNC_END sub_805AA68

.align 2, 0
