	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	THUMB_FUNC_START CheckEkrTriangleInvalid
CheckEkrTriangleInvalid: @ 0x08074F3C
	push {lr}
	ldr r0, _08074F4C  @ gEkrTriangleInvalid
	ldr r0, [r0]
	cmp r0, #1
	beq _08074F50
	movs r0, #0
	b _08074F52
	.align 2, 0
_08074F4C: .4byte gEkrTriangleInvalid
_08074F50:
	movs r0, #1
_08074F52:
	pop {r1}
	bx r1

	THUMB_FUNC_END CheckEkrTriangleInvalid

	THUMB_FUNC_START nullsub_18
nullsub_18: @ 0x08074F58
	bx lr

	THUMB_FUNC_END nullsub_18

	THUMB_FUNC_START NewEkrTriangle
NewEkrTriangle: @ 0x08074F5C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08074F78  @ ProcScr_ekrTriangle
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	ldr r1, _08074F7C  @ gEkrTriangleInvalid
	movs r0, #0
	str r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08074F78: .4byte ProcScr_ekrTriangle
_08074F7C: .4byte gEkrTriangleInvalid

	THUMB_FUNC_END NewEkrTriangle

	THUMB_FUNC_START sub_8074F80
sub_8074F80: @ 0x08074F80
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r6, r0, #0
	movs r0, #0
	mov r9, r0
	mov sl, r0
	mov r8, r0
	movs r7, #0
	ldr r0, [r6, #0x5c]
	bl GetAISSubjectId
	cmp r0, #0
	bne _08074FAC
	ldr r0, _08074FA8  @ gpEkrBattleUnitLeft
	b _08074FAE
	.align 2, 0
_08074FA8: .4byte gpEkrBattleUnitLeft
_08074FAC:
	ldr r0, _08074FFC  @ gpEkrBattleUnitRight
_08074FAE:
	ldr r0, [r0]
	ldr r0, [r0, #4]
	ldrb r5, [r0, #4]
	cmp r5, #9
	bge _08074FBA
	b _080750BC
_08074FBA:
	cmp r5, #0xc
	ble _08074FC0
	b _080750BC
_08074FC0:
	ldr r0, _08075000  @ gEkrTriangleAtkFlag
	ldr r1, [r0]
	ldr r0, [r1, #4]
	ldrb r0, [r0, #4]
	cmp r0, #9
	bne _08074FD0
	movs r2, #0
	mov r9, r2
_08074FD0:
	cmp r0, #0xa
	bne _08074FD8
	movs r2, #0
	mov r9, r2
_08074FD8:
	cmp r0, #0xb
	bne _08074FE0
	movs r2, #1
	mov r9, r2
_08074FE0:
	cmp r0, #0xc
	bne _08074FE8
	movs r0, #1
	mov r9, r0
_08074FE8:
	adds r0, r1, #0
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0
	bne _08075004
	movs r0, #1
	b _0807500A
	.align 2, 0
_08074FFC: .4byte gpEkrBattleUnitRight
_08075000: .4byte gEkrTriangleAtkFlag
_08075004:
	adds r0, r4, #0
	bl GetItemType
_0807500A:
	cmp r0, #1
	beq _08075014
	cmp r0, #2
	beq _0807501A
	b _0807502C
_08075014:
	movs r1, #0
	mov r8, r1
	b _0807502C
_0807501A:
	adds r0, r4, #0
	bl GetItemIndex
	movs r2, #1
	mov r8, r2
	cmp r0, #0x28
	bne _0807502C
	movs r0, #2
	mov r8, r0
_0807502C:
	ldr r0, _08075068  @ gEkrTriangleAtkFlag
	ldr r1, [r0, #4]
	ldr r0, [r1, #4]
	ldrb r0, [r0, #4]
	cmp r0, #9
	bne _0807503C
	movs r2, #0
	mov sl, r2
_0807503C:
	cmp r0, #0xa
	bne _08075044
	movs r2, #0
	mov sl, r2
_08075044:
	cmp r0, #0xb
	bne _0807504C
	movs r2, #1
	mov sl, r2
_0807504C:
	cmp r0, #0xc
	bne _08075054
	movs r0, #1
	mov sl, r0
_08075054:
	adds r0, r1, #0
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0
	bne _0807506C
	movs r0, #1
	b _08075072
	.align 2, 0
_08075068: .4byte gEkrTriangleAtkFlag
_0807506C:
	adds r0, r4, #0
	bl GetItemType
_08075072:
	cmp r0, #1
	beq _0807507C
	cmp r0, #2
	beq _08075080
	b _0807508E
_0807507C:
	movs r7, #0
	b _0807508E
_08075080:
	adds r0, r4, #0
	bl GetItemIndex
	movs r7, #1
	cmp r0, #0x28
	bne _0807508E
	movs r7, #2
_0807508E:
	ldr r0, [r6, #0x5c]
	str r7, [sp]
	mov r1, r9
	mov r2, sl
	mov r3, r8
	bl sub_8075424
	ldr r0, _080750B4  @ gpEkrBattleUnitRight
	ldr r0, [r0]
	adds r0, #0x4a
	ldrh r0, [r0]
	bl GetItemIndex
	cmp r0, #0x28
	bne _08075164
	ldr r1, _080750B8  @ gEkrTriangleInvalid
	movs r0, #0
	b _08075168
	.align 2, 0
_080750B4: .4byte gpEkrBattleUnitRight
_080750B8: .4byte gEkrTriangleInvalid
_080750BC:
	ldr r0, _080750E8  @ gEkrTriangleAtkFlag
	ldr r1, [r0]
	ldr r0, [r1, #4]
	ldrb r0, [r0, #4]
	cmp r0, #0x48
	bne _080750CC
	movs r2, #0
	mov r9, r2
_080750CC:
	cmp r0, #0x49
	bne _080750D4
	movs r0, #1
	mov r9, r0
_080750D4:
	adds r0, r1, #0
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0
	bne _080750EC
	movs r0, #1
	b _080750F6
	.align 2, 0
_080750E8: .4byte gEkrTriangleAtkFlag
_080750EC:
	adds r0, r4, #0
	bl GetItemType
	cmp r0, #0
	beq _08075100
_080750F6:
	cmp r0, #1
	bne _08075104
	movs r1, #0
	mov r8, r1
	b _08075104
_08075100:
	movs r2, #1
	mov r8, r2
_08075104:
	ldr r0, _08075130  @ gEkrTriangleAtkFlag
	ldr r1, [r0, #4]
	ldr r0, [r1, #4]
	ldrb r0, [r0, #4]
	cmp r0, #0x48
	bne _08075114
	movs r2, #0
	mov sl, r2
_08075114:
	cmp r0, #0x49
	bne _0807511C
	movs r0, #1
	mov sl, r0
_0807511C:
	adds r0, r1, #0
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0
	bne _08075134
	movs r0, #1
	b _0807513E
	.align 2, 0
_08075130: .4byte gEkrTriangleAtkFlag
_08075134:
	adds r0, r4, #0
	bl GetItemType
	cmp r0, #0
	beq _08075146
_0807513E:
	cmp r0, #1
	bne _08075148
	movs r7, #0
	b _08075148
_08075146:
	movs r7, #1
_08075148:
	ldr r0, [r6, #0x5c]
	str r7, [sp]
	mov r1, r9
	mov r2, sl
	mov r3, r8
	bl NewEkrTriPegasusKnight
	cmp r5, #0x48
	bne _08075164
	ldr r1, _08075160  @ gEkrTriangleInvalid
	movs r0, #0
	b _08075168
	.align 2, 0
_08075160: .4byte gEkrTriangleInvalid
_08075164:
	ldr r1, _08075180  @ gEkrTriangleInvalid
	movs r0, #1
_08075168:
	str r0, [r1]
	adds r0, r6, #0
	bl Proc_Break
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08075180: .4byte gEkrTriangleInvalid

	THUMB_FUNC_END sub_8074F80

	THUMB_FUNC_START NewEkrTriPegasusKnight
NewEkrTriPegasusKnight: @ 0x08075184
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	mov r8, r3
	ldr r7, [sp, #0x18]
	ldr r0, _080751B8  @ ProcScr_ekrTriPegasusKnight
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r5, [r0, #0x44]
	str r6, [r0, #0x48]
	mov r1, r8
	str r1, [r0, #0x4c]
	str r7, [r0, #0x50]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080751B8: .4byte ProcScr_ekrTriPegasusKnight

	THUMB_FUNC_END NewEkrTriPegasusKnight

	THUMB_FUNC_START sub_80751BC
sub_80751BC: @ 0x080751BC
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetCoreAIStruct
	adds r5, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xa
	bne _080751E2
	ldr r0, [r4, #0x5c]
	ldr r2, [r4, #0x44]
	ldr r3, [r4, #0x4c]
	movs r1, #0
	bl sub_8075350
_080751E2:
	movs r1, #0x2c
	ldrsh r0, [r4, r1]
	cmp r0, #0x1c
	bne _080751F2
	adds r0, r5, #0
	movs r1, #6
	bl StartSpellBG_FLASH
_080751F2:
	movs r3, #0x2c
	ldrsh r0, [r4, r3]
	cmp r0, #0x22
	bne _08075226
	ldr r2, [r4, #0x44]
	ldr r3, [r4, #0x4c]
	adds r0, r5, #0
	movs r1, #0
	bl NewEkrTriPegasusKnightBG
	ldr r0, [r4, #0x5c]
	ldr r2, [r4, #0x48]
	ldr r3, [r4, #0x50]
	movs r1, #1
	bl sub_8075350
	movs r0, #0x9a
	lsls r0, r0, #2
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r2, [r4, #0x5c]
	movs r3, #2
	ldrsh r2, [r2, r3]
	movs r3, #1
	bl EkrSoundSomeBark
_08075226:
	movs r1, #0x2c
	ldrsh r0, [r4, r1]
	cmp r0, #0x33
	bne _08075236
	adds r0, r5, #0
	movs r1, #6
	bl StartSpellBG_FLASH
_08075236:
	movs r3, #0x2c
	ldrsh r0, [r4, r3]
	cmp r0, #0x39
	bne _0807525E
	ldr r2, [r4, #0x48]
	ldr r3, [r4, #0x50]
	adds r0, r5, #0
	movs r1, #1
	bl NewEkrTriPegasusKnightBG
	movs r0, #0x9a
	lsls r0, r0, #2
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r2, [r4, #0x5c]
	movs r3, #2
	ldrsh r2, [r2, r3]
	movs r3, #1
	bl EkrSoundSomeBark
_0807525E:
	movs r1, #0x2c
	ldrsh r0, [r4, r1]
	cmp r0, #0x43
	bne _08075272
	ldr r1, _08075278  @ gEkrTriangleInvalid
	movs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
_08075272:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08075278: .4byte gEkrTriangleInvalid

	THUMB_FUNC_END sub_80751BC

	THUMB_FUNC_START NewEkrTriPegasusKnightBG
NewEkrTriPegasusKnightBG: @ 0x0807527C
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	adds r7, r3, #0
	ldr r0, _080752A4  @ ProcScr_ekrTriPegasusKnightBG
	movs r1, #3
	bl Proc_Start
	adds r1, r0, #0
	str r4, [r1, #0x5c]
	movs r0, #0
	strh r0, [r1, #0x2c]
	str r0, [r1, #0x44]
	cmp r5, #0
	bne _080752B0
	ldr r0, _080752A8  @ gBanimCharacterTSAs
	ldr r2, [r0]
	ldr r0, _080752AC  @ gUnknown_080E1732
	b _080752B6
	.align 2, 0
_080752A4: .4byte ProcScr_ekrTriPegasusKnightBG
_080752A8: .4byte gBanimCharacterTSAs
_080752AC: .4byte gUnknown_080E1732
_080752B0:
	ldr r0, _080752EC  @ gBanimCharacterTSAs
	ldr r2, [r0, #4]
	ldr r0, _080752F0  @ gUnknown_080E1740
_080752B6:
	str r0, [r1, #0x48]
	ldr r0, _080752F4  @ gUnknown_087595EC
	str r0, [r1, #0x4c]
	str r0, [r1, #0x50]
	ldr r4, _080752F8  @ gEkrImgBuffer
	adds r0, r2, #0
	adds r1, r4, #0
	bl LZ77UnCompWram
	adds r0, r4, #0
	movs r1, #0x20
	bl SomePaletteStoringRoutine_SpellAnim2
	ldr r0, _080752FC  @ gUnknown_080E17C0
	cmp r6, #0
	beq _080752DE
	ldr r0, _08075300  @ gUnknown_080E2B54
	cmp r7, #0
	bne _080752DE
	ldr r0, _08075304  @ gUnknown_080E2164
_080752DE:
	movs r1, #0x80
	lsls r1, r1, #6
	bl SomeImageStoringRoutine_SpellAnim2
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080752EC: .4byte gBanimCharacterTSAs
_080752F0: .4byte gUnknown_080E1740
_080752F4: .4byte gUnknown_087595EC
_080752F8: .4byte gEkrImgBuffer
_080752FC: .4byte gUnknown_080E17C0
_08075300: .4byte gUnknown_080E2B54
_08075304: .4byte gUnknown_080E2164

	THUMB_FUNC_END NewEkrTriPegasusKnightBG

	THUMB_FUNC_START sub_8075308
sub_8075308: @ 0x08075308
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl sub_80558F4
	lsls r0, r0, #0x10
	asrs r2, r0, #0x10
	cmp r2, #0
	blt _08075336
	ldr r1, [r4, #0x4c]
	ldr r3, [r4, #0x50]
	ldr r0, [r4, #0x5c]
	lsls r2, r2, #2
	adds r1, r2, r1
	ldr r1, [r1]
	adds r2, r2, r3
	ldr r2, [r2]
	bl sub_8055670
	b _08075348
_08075336:
	movs r0, #1
	negs r0, r0
	cmp r2, r0
	bne _08075348
	bl ClearBG1
	adds r0, r4, #0
	bl Proc_Break
_08075348:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8075308

	THUMB_FUNC_START sub_8075350
sub_8075350: @ 0x08075350
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r7, r0, #0
	adds r4, r1, #0
	mov r8, r2
	mov r9, r3
	ldr r0, _08075384  @ ProcScr_EkrTriPegasusKnightOBJ
	movs r1, #3
	bl Proc_Start
	adds r5, r0, #0
	str r7, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	cmp r4, #0
	bne _08075390
	movs r0, #0x12
	strh r0, [r5, #0x2e]
	ldr r0, _08075388  @ gBanimCharacterTSAs
	ldr r6, [r0]
	ldr r3, _0807538C  @ gUnknown_08759B34
	b _0807539A
	.align 2, 0
_08075384: .4byte ProcScr_EkrTriPegasusKnightOBJ
_08075388: .4byte gBanimCharacterTSAs
_0807538C: .4byte gUnknown_08759B34
_08075390:
	movs r0, #0x11
	strh r0, [r5, #0x2e]
	ldr r0, _080753E4  @ gBanimCharacterTSAs
	ldr r6, [r0, #4]
	ldr r3, _080753E8  @ gUnknown_08759E68
_0807539A:
	str r3, [sp]
	adds r0, r7, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl sub_8055554
	str r0, [r5, #0x60]
	ldr r4, _080753EC  @ gUnknown_0201A790
	adds r0, r6, #0
	adds r1, r4, #0
	bl LZ77UnCompWram
	adds r0, r4, #0
	movs r1, #0x20
	bl SomePaletteStoringRoutine_SpellAnim
	ldr r0, _080753F0  @ gUnknown_080E3B78
	mov r1, r8
	cmp r1, #0
	beq _080753CC
	ldr r0, _080753F4  @ gUnknown_080E4EFC
	mov r1, r9
	cmp r1, #0
	bne _080753CC
	ldr r0, _080753F8  @ gUnknown_080E4530
_080753CC:
	movs r1, #0x80
	lsls r1, r1, #5
	bl SomeImageStoringRoutine_SpellAnim
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080753E4: .4byte gBanimCharacterTSAs
_080753E8: .4byte gUnknown_08759E68
_080753EC: .4byte gUnknown_0201A790
_080753F0: .4byte gUnknown_080E3B78
_080753F4: .4byte gUnknown_080E4EFC
_080753F8: .4byte gUnknown_080E4530

	THUMB_FUNC_END sub_8075350

	THUMB_FUNC_START sub_80753FC
sub_80753FC: @ 0x080753FC
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x2e
	ldrsh r1, [r4, r2]
	cmp r0, r1
	ble _0807541E
	ldr r0, [r4, #0x60]
	bl AnimDelete
	adds r0, r4, #0
	bl Proc_Break
_0807541E:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80753FC

	THUMB_FUNC_START sub_8075424
sub_8075424: @ 0x08075424
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	mov r8, r3
	ldr r7, [sp, #0x18]
	ldr r0, _08075458  @ ProcScr_EkrTriArmorKnight
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r5, [r0, #0x44]
	str r6, [r0, #0x48]
	mov r1, r8
	str r1, [r0, #0x4c]
	str r7, [r0, #0x50]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08075458: .4byte ProcScr_EkrTriArmorKnight

	THUMB_FUNC_END sub_8075424

	THUMB_FUNC_START sub_807545C
sub_807545C: @ 0x0807545C
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _08075492
	ldr r0, [r5, #0x5c]
	ldr r1, [r5, #0x44]
	ldr r2, [r5, #0x48]
	ldr r3, [r5, #0x4c]
	ldr r4, [r5, #0x50]
	str r4, [sp]
	bl sub_8075538
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r0, [r5, #0x5c]
	movs r3, #2
	ldrsh r2, [r0, r3]
	movs r0, #0xe2
	movs r3, #1
	bl EkrSoundSomeBark
_08075492:
	movs r1, #0x2c
	ldrsh r0, [r5, r1]
	cmp r0, #0x30
	bne _080754B8
	ldr r0, [r5, #0x5c]
	ldr r2, [r5, #0x44]
	ldr r3, [r5, #0x4c]
	movs r1, #0
	bl sub_8075718
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r0, [r5, #0x5c]
	movs r3, #2
	ldrsh r2, [r0, r3]
	movs r0, #0xe2
	movs r3, #1
	bl EkrSoundSomeBark
_080754B8:
	movs r1, #0x2c
	ldrsh r0, [r5, r1]
	cmp r0, #0x3c
	bne _080754D0
	ldr r0, [r5, #0x5c]
	movs r1, #4
	bl StartSpellBG_FLASH
	ldr r0, [r5, #0x5c]
	movs r1, #0xa
	bl sub_807589C
_080754D0:
	movs r3, #0x2c
	ldrsh r0, [r5, r3]
	cmp r0, #0x4f
	bne _080754F6
	ldr r0, [r5, #0x5c]
	ldr r2, [r5, #0x48]
	ldr r3, [r5, #0x50]
	movs r1, #1
	bl sub_8075718
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r0, [r5, #0x5c]
	movs r3, #2
	ldrsh r2, [r0, r3]
	movs r0, #0xe2
	movs r3, #1
	bl EkrSoundSomeBark
_080754F6:
	movs r1, #0x2c
	ldrsh r0, [r5, r1]
	cmp r0, #0x5b
	bne _08075504
	ldr r1, _08075534  @ gEkrTriangleInvalid
	movs r0, #1
	str r0, [r1]
_08075504:
	movs r3, #0x2c
	ldrsh r0, [r5, r3]
	cmp r0, #0x60
	bne _0807551C
	ldr r0, [r5, #0x5c]
	movs r1, #4
	bl StartSpellBG_FLASH
	ldr r0, [r5, #0x5c]
	movs r1, #0xa
	bl sub_807589C
_0807551C:
	movs r1, #0x2c
	ldrsh r0, [r5, r1]
	cmp r0, #0x78
	bne _0807552A
	adds r0, r5, #0
	bl Proc_Break
_0807552A:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08075534: .4byte gEkrTriangleInvalid

	THUMB_FUNC_END sub_807545C

	THUMB_FUNC_START sub_8075538
sub_8075538: @ 0x08075538
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	mov r8, r0
	adds r4, r1, #0
	mov r9, r2
	adds r6, r3, #0
	ldr r0, _08075570  @ ProcScr_EkrTriArmorKnightOBJ
	movs r1, #3
	bl Proc_Start
	adds r5, r0, #0
	mov r0, r8
	str r0, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	movs r0, #0x14
	strh r0, [r5, #0x2e]
	ldr r0, _08075574  @ gBanimCharacterTSAs
	ldr r7, [r0]
	cmp r4, #0
	bne _08075580
	ldr r3, _08075578  @ gUnknown_08759F00
	ldr r6, _0807557C  @ gUnknown_080E58A4
	b _080755AC
	.align 2, 0
_08075570: .4byte ProcScr_EkrTriArmorKnightOBJ
_08075574: .4byte gBanimCharacterTSAs
_08075578: .4byte gUnknown_08759F00
_0807557C: .4byte gUnknown_080E58A4
_08075580:
	cmp r6, #1
	beq _08075598
	cmp r6, #1
	bcs _080755A8
	ldr r3, _08075590  @ gUnknown_08759F90
	ldr r6, _08075594  @ gUnknown_080E5BC4
	b _080755AC
	.align 2, 0
_08075590: .4byte gUnknown_08759F90
_08075594: .4byte gUnknown_080E5BC4
_08075598:
	ldr r3, _080755A0  @ gUnknown_0875A020
	ldr r6, _080755A4  @ gUnknown_080E5F98
	b _080755AC
	.align 2, 0
_080755A0: .4byte gUnknown_0875A020
_080755A4: .4byte gUnknown_080E5F98
_080755A8:
	ldr r3, _080755EC  @ gUnknown_0875A0AC
	ldr r6, _080755F0  @ gUnknown_080E63CC
_080755AC:
	str r3, [sp]
	mov r0, r8
	adds r1, r3, #0
	adds r2, r3, #0
	bl sub_8055554
	adds r1, r0, #0
	str r1, [r5, #0x60]
	ldr r0, _080755F4  @ 0x00008840
	strh r0, [r1, #8]
	ldr r4, _080755F8  @ gUnknown_0201A790
	adds r0, r7, #0
	adds r1, r4, #0
	bl LZ77UnCompWram
	ldr r1, _080755FC  @ gUnknown_02022BA8
	adds r0, r4, #0
	movs r2, #8
	bl CpuFastSet
	adds r0, r6, #0
	adds r1, r4, #0
	bl LZ77UnCompWram
	ldr r0, _08075600  @ gBanimCharacterTSAs
	ldr r7, [r0, #4]
	mov r0, r9
	cmp r0, #0
	bne _0807560C
	ldr r3, _08075604  @ gUnknown_08759F00
	ldr r6, _08075608  @ gUnknown_080E58A4
	b _08075638
	.align 2, 0
_080755EC: .4byte gUnknown_0875A0AC
_080755F0: .4byte gUnknown_080E63CC
_080755F4: .4byte 0x00008840
_080755F8: .4byte gUnknown_0201A790
_080755FC: .4byte gUnknown_02022BA8
_08075600: .4byte gBanimCharacterTSAs
_08075604: .4byte gUnknown_08759F00
_08075608: .4byte gUnknown_080E58A4
_0807560C:
	ldr r0, [sp, #0x20]
	cmp r0, #1
	beq _08075624
	cmp r0, #1
	bcs _08075634
	ldr r3, _0807561C  @ gUnknown_08759F90
	ldr r6, _08075620  @ gUnknown_080E5BC4
	b _08075638
	.align 2, 0
_0807561C: .4byte gUnknown_08759F90
_08075620: .4byte gUnknown_080E5BC4
_08075624:
	ldr r3, _0807562C  @ gUnknown_0875A020
	ldr r6, _08075630  @ gUnknown_080E5F98
	b _08075638
	.align 2, 0
_0807562C: .4byte gUnknown_0875A020
_08075630: .4byte gUnknown_080E5F98
_08075634:
	ldr r3, _080756A0  @ gUnknown_0875A0AC
	ldr r6, _080756A4  @ gUnknown_080E63CC
_08075638:
	str r3, [sp]
	mov r0, r8
	adds r1, r3, #0
	adds r2, r3, #0
	bl sub_8055554
	adds r1, r0, #0
	str r1, [r5, #0x64]
	ldr r0, _080756A8  @ 0x0000A880
	strh r0, [r1, #8]
	ldr r4, _080756AC  @ gUnknown_0201AF90
	adds r0, r7, #0
	adds r1, r4, #0
	bl LZ77UnCompWram
	ldr r1, _080756B0  @ gUnknown_02022BE8
	adds r0, r4, #0
	movs r2, #8
	bl CpuFastSet
	adds r0, r6, #0
	adds r1, r4, #0
	bl LZ77UnCompWram
	ldr r1, _080756B4  @ 0x06010800
	ldr r0, _080756B8  @ 0xFFFFF800
	adds r4, r4, r0
	movs r2, #0x80
	lsls r2, r2, #5
	adds r0, r4, #0
	bl RegisterDataMove
	bl EnablePaletteSync
	ldr r1, [r5, #0x60]
	ldr r0, [r5, #0x5c]
	ldrh r0, [r0, #2]
	adds r0, #0x20
	strh r0, [r1, #2]
	ldr r1, [r5, #0x64]
	ldr r0, [r5, #0x5c]
	ldrh r0, [r0, #2]
	subs r0, #0x20
	strh r0, [r1, #2]
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080756A0: .4byte gUnknown_0875A0AC
_080756A4: .4byte gUnknown_080E63CC
_080756A8: .4byte 0x0000A880
_080756AC: .4byte gUnknown_0201AF90
_080756B0: .4byte gUnknown_02022BE8
_080756B4: .4byte 0x06010800
_080756B8: .4byte 0xFFFFF800

	THUMB_FUNC_END sub_8075538

	THUMB_FUNC_START sub_80756BC
sub_80756BC: @ 0x080756BC
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	movs r0, #0x2c
	ldrsh r3, [r4, r0]
	movs r1, #0x2e
	ldrsh r0, [r4, r1]
	str r0, [sp]
	movs r0, #0
	movs r1, #0x20
	movs r2, #0
	bl Interpolate
	ldr r2, [r4, #0x60]
	ldr r1, [r4, #0x5c]
	ldrh r1, [r1, #2]
	adds r1, r1, r0
	strh r1, [r2, #2]
	ldr r2, [r4, #0x64]
	ldr r1, [r4, #0x5c]
	ldrh r1, [r1, #2]
	subs r1, r1, r0
	strh r1, [r2, #2]
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x2e
	ldrsh r1, [r4, r2]
	cmp r0, r1
	ble _0807570E
	ldr r0, [r4, #0x60]
	bl AnimDelete
	ldr r0, [r4, #0x64]
	bl AnimDelete
	adds r0, r4, #0
	bl Proc_Break
_0807570E:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80756BC

	THUMB_FUNC_START sub_8075718
sub_8075718: @ 0x08075718
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	mov r8, r0
	adds r5, r1, #0
	adds r6, r2, #0
	adds r7, r3, #0
	ldr r0, _08075754  @ ProcScr_EkrTriArmorKnightOBJ2
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	mov r0, r8
	str r0, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	movs r0, #5
	strh r0, [r4, #0x2e]
	adds r0, r4, #0
	adds r0, #0x29
	strb r5, [r0]
	adds r0, #1
	strb r6, [r0]
	cmp r5, #0
	bne _0807575C
	ldr r0, _08075758  @ gBanimCharacterTSAs
	ldr r0, [r0]
	b _08075760
	.align 2, 0
_08075754: .4byte ProcScr_EkrTriArmorKnightOBJ2
_08075758: .4byte gBanimCharacterTSAs
_0807575C:
	ldr r0, _0807576C  @ gBanimCharacterTSAs
	ldr r0, [r0, #4]
_08075760:
	mov r9, r0
	cmp r6, #0
	bne _08075778
	ldr r3, _08075770  @ gUnknown_0875A19C
	ldr r6, _08075774  @ gUnknown_080E678C
	b _080757A4
	.align 2, 0
_0807576C: .4byte gBanimCharacterTSAs
_08075770: .4byte gUnknown_0875A19C
_08075774: .4byte gUnknown_080E678C
_08075778:
	cmp r7, #1
	beq _08075790
	cmp r7, #1
	bcs _080757A0
	ldr r3, _08075788  @ gUnknown_0875A314
	ldr r6, _0807578C  @ gUnknown_080E6CC4
	b _080757A4
	.align 2, 0
_08075788: .4byte gUnknown_0875A314
_0807578C: .4byte gUnknown_080E6CC4
_08075790:
	ldr r3, _08075798  @ gUnknown_0875A468
	ldr r6, _0807579C  @ gUnknown_080E7400
	b _080757A4
	.align 2, 0
_08075798: .4byte gUnknown_0875A468
_0807579C: .4byte gUnknown_080E7400
_080757A0:
	ldr r3, _080757D0  @ gUnknown_0875A730
	ldr r6, _080757D4  @ gUnknown_080E7B8C
_080757A4:
	str r3, [sp]
	mov r0, r8
	adds r1, r3, #0
	adds r2, r3, #0
	bl sub_8055554
	adds r1, r0, #0
	str r1, [r4, #0x60]
	cmp r5, #0
	bne _080757D8
	ldrh r0, [r1, #4]
	adds r0, #0xa
	strh r0, [r1, #4]
	ldr r1, [r4, #0x60]
	movs r0, #0x78
	strh r0, [r1, #0xa]
	bl AnimSort
	ldr r0, [r4, #0x5c]
	ldrh r1, [r0, #2]
	adds r1, #0x10
	b _080757EE
	.align 2, 0
_080757D0: .4byte gUnknown_0875A730
_080757D4: .4byte gUnknown_080E7B8C
_080757D8:
	ldrh r0, [r1, #4]
	adds r0, #2
	strh r0, [r1, #4]
	ldr r1, [r4, #0x60]
	movs r0, #0x14
	strh r0, [r1, #0xa]
	bl AnimSort
	ldr r0, [r4, #0x5c]
	ldrh r1, [r0, #2]
	subs r1, #0xc
_080757EE:
	strh r1, [r4, #0x32]
	ldrh r0, [r0, #2]
	subs r0, #0x10
	strh r0, [r4, #0x34]
	ldr r0, [r4, #0x60]
	strh r1, [r0, #2]
	ldr r4, _08075824  @ gUnknown_0201A790
	mov r0, r9
	adds r1, r4, #0
	bl LZ77UnCompWram
	adds r0, r4, #0
	movs r1, #0x20
	bl SomePaletteStoringRoutine_SpellAnim
	movs r1, #0x80
	lsls r1, r1, #5
	adds r0, r6, #0
	bl SomeImageStoringRoutine_SpellAnim
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08075824: .4byte gUnknown_0201A790

	THUMB_FUNC_END sub_8075718

	THUMB_FUNC_START sub_8075828
sub_8075828: @ 0x08075828
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	movs r0, #0x32
	ldrsh r1, [r4, r0]
	movs r5, #0x34
	ldrsh r2, [r4, r5]
	movs r0, #0x2c
	ldrsh r3, [r4, r0]
	movs r5, #0x2e
	ldrsh r0, [r4, r5]
	str r0, [sp]
	movs r0, #1
	bl Interpolate
	ldr r1, [r4, #0x60]
	strh r0, [r1, #2]
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x2e
	ldrsh r1, [r4, r2]
	cmp r0, r1
	ble _0807586A
	movs r0, #0
	strh r0, [r4, #0x2c]
	movs r0, #0x14
	strh r0, [r4, #0x2e]
	adds r0, r4, #0
	bl Proc_Break
_0807586A:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8075828

	THUMB_FUNC_START sub_8075874
sub_8075874: @ 0x08075874
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x2e
	ldrsh r1, [r4, r2]
	cmp r0, r1
	ble _08075896
	ldr r0, [r4, #0x60]
	bl AnimDelete
	adds r0, r4, #0
	bl Proc_Break
_08075896:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8075874

	THUMB_FUNC_START sub_807589C
sub_807589C: @ 0x0807589C
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	ldr r1, _080758CC  @ gUnknown_0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _080758D0  @ ProcScr_EfxTriangleQUAKE
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	movs r1, #0
	bl NewEfxQuakePure
	str r0, [r4, #0x60]
	movs r0, #0
	strh r0, [r4, #0x2c]
	strh r6, [r4, #0x2e]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080758CC: .4byte gUnknown_0201774C
_080758D0: .4byte ProcScr_EfxTriangleQUAKE

	THUMB_FUNC_END sub_807589C

.align 2, 0