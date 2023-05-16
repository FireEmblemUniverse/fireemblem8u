	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	THUMB_FUNC_START BattleAIS_ExecCommands
BattleAIS_ExecCommands: @ 0x08058BC8
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	movs r2, #0
_08058BD4:
	ldr r0, _08058C38  @ gUnknown_03004FAC
	str r2, [r0]
	ldr r1, _08058C3C  @ gAnims
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r7, [r0]
	adds r2, #1
	mov r9, r2
	cmp r7, #0
	bne _08058BEC
	bl _080598AE
_08058BEC:
	ldrh r0, [r7, #0xc]
	movs r1, #0xf0
	lsls r1, r1, #8
	mov r8, r1
	mov r2, r8
	ands r2, r0
	mov r8, r2
	cmp r2, #0
	bne _08058C02
	bl _080598AE
_08058C02:
	movs r0, #0x80
	lsls r0, r0, #5
	ands r0, r2
	cmp r0, #0
	bne _08058C10
	bl _080596E0
_08058C10:
	ldrb r0, [r7, #0x14]
	cmp r0, #0
	bne _08058C1A
	bl _080596D6
_08058C1A:
	subs r1, r0, #1
	adds r2, r7, #0
	adds r2, #0x15
	adds r1, r2, r1
	ldrb r1, [r1]
	adds r3, r0, #0
	cmp r1, #0x7b
	bls _08058C2E
	bl _080596CC
_08058C2E:
	lsls r0, r1, #2
	ldr r1, _08058C40  @ _08058C44
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08058C38: .4byte gUnknown_03004FAC
_08058C3C: .4byte gAnims
_08058C40: .4byte _08058C44
_08058C44: @ jump table
	.4byte _080596CC @ case 0
	.4byte _08058E34 @ case 1
	.4byte _08058E98 @ case 2
	.4byte _08058EB0 @ case 3
	.4byte _08058F30 @ case 4
	.4byte _08058FB4 @ case 5
	.4byte _08059018 @ case 6
	.4byte _08059048 @ case 7
	.4byte _08059158 @ case 8
	.4byte _08059158 @ case 9
	.4byte _08059158 @ case 10
	.4byte _08059158 @ case 11
	.4byte _08059158 @ case 12
	.4byte _080591F2 @ case 13
	.4byte _080596CC @ case 14
	.4byte _080596CC @ case 15
	.4byte _080596CC @ case 16
	.4byte _080596CC @ case 17
	.4byte _080596CC @ case 18
	.4byte _080593A0 @ case 19
	.4byte _080593D0 @ case 20
	.4byte _080593E4 @ case 21
	.4byte _080596CC @ case 22
	.4byte _080596CC @ case 23
	.4byte _080593F8 @ case 24
	.4byte _08059698 @ case 25
	.4byte _0805942C @ case 26
	.4byte _08059698 @ case 27
	.4byte _08059698 @ case 28
	.4byte _08059698 @ case 29
	.4byte _08059698 @ case 30
	.4byte _08059698 @ case 31
	.4byte _08059698 @ case 32
	.4byte _08059698 @ case 33
	.4byte _08059698 @ case 34
	.4byte _08059698 @ case 35
	.4byte _08059698 @ case 36
	.4byte _08059698 @ case 37
	.4byte _080594AC @ case 38
	.4byte _080594C2 @ case 39
	.4byte _08059698 @ case 40
	.4byte _08059698 @ case 41
	.4byte _08059698 @ case 42
	.4byte _08059698 @ case 43
	.4byte _080594D8 @ case 44
	.4byte _080594EC @ case 45
	.4byte _08059536 @ case 46
	.4byte _0805954C @ case 47
	.4byte _08059562 @ case 48
	.4byte _08059578 @ case 49
	.4byte _0805958E @ case 50
	.4byte _08059698 @ case 51
	.4byte _08059698 @ case 52
	.4byte _08059698 @ case 53
	.4byte _08059698 @ case 54
	.4byte _08059698 @ case 55
	.4byte _08059698 @ case 56
	.4byte _080595A4 @ case 57
	.4byte _08059698 @ case 58
	.4byte _080596CC @ case 59
	.4byte _08059698 @ case 60
	.4byte _080595CA @ case 61
	.4byte _08059698 @ case 62
	.4byte _08059698 @ case 63
	.4byte _08059698 @ case 64
	.4byte _08059698 @ case 65
	.4byte _08059698 @ case 66
	.4byte _08059698 @ case 67
	.4byte _08059698 @ case 68
	.4byte _08059698 @ case 69
	.4byte _08059698 @ case 70
	.4byte _080595FC @ case 71
	.4byte _08059698 @ case 72
	.4byte _08059698 @ case 73
	.4byte _08059698 @ case 74
	.4byte _08059698 @ case 75
	.4byte _08059698 @ case 76
	.4byte _08059698 @ case 77
	.4byte _08059604 @ case 78
	.4byte _08059698 @ case 79
	.4byte _080596CC @ case 80
	.4byte _0805960C @ case 81
	.4byte _08059630 @ case 82
	.4byte _080596CC @ case 83
	.4byte _080596CC @ case 84
	.4byte _080596CC @ case 85
	.4byte _08059698 @ case 86
	.4byte _08059698 @ case 87
	.4byte _08059698 @ case 88
	.4byte _08059698 @ case 89
	.4byte _08059698 @ case 90
	.4byte _08059698 @ case 91
	.4byte _08059698 @ case 92
	.4byte _08059698 @ case 93
	.4byte _08059698 @ case 94
	.4byte _08059698 @ case 95
	.4byte _08059698 @ case 96
	.4byte _08059698 @ case 97
	.4byte _08059698 @ case 98
	.4byte _08059698 @ case 99
	.4byte _08059698 @ case 100
	.4byte _08059698 @ case 101
	.4byte _08059698 @ case 102
	.4byte _08059698 @ case 103
	.4byte _08059698 @ case 104
	.4byte _080596CC @ case 105
	.4byte _08059698 @ case 106
	.4byte _08059698 @ case 107
	.4byte _08059698 @ case 108
	.4byte _08059698 @ case 109
	.4byte _08059698 @ case 110
	.4byte _08059698 @ case 111
	.4byte _08059698 @ case 112
	.4byte _080596A6 @ case 113
	.4byte _080596BA @ case 114
	.4byte _08059698 @ case 115
	.4byte _08059698 @ case 116
	.4byte _08059698 @ case 117
	.4byte _08059698 @ case 118
	.4byte _08059698 @ case 119
	.4byte _08059698 @ case 120
	.4byte _08059698 @ case 121
	.4byte _08059698 @ case 122
	.4byte _08059698 @ case 123
_08058E34:
	ldr r0, _08058E44  @ gEkrDebugUnk3
	ldr r0, [r0]
	cmp r0, #1
	bne _08058E48
	ldr r0, [r7, #0x24]
	str r0, [r7, #0x20]
	bl _080596CC
	.align 2, 0
_08058E44: .4byte gEkrDebugUnk3
_08058E48:
	ldrh r1, [r7, #0x10]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	bne _08058E56
	bl _08059686
_08058E56:
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	bne _08058E62
	bl _080596CC
_08058E62:
	bl sub_80522CC
	cmp r0, #1
	beq _08058E6E
	bl _080596CC
_08058E6E:
	ldrh r1, [r7, #0x10]
	ldr r0, _08058E94  @ 0x0000FFF2
	ands r0, r1
	strh r0, [r7, #0x10]
	ldr r0, [r7, #0x20]
	adds r0, #4
	str r0, [r7, #0x20]
	bl sub_8055A28
	cmp r0, #0
	bne _08058E88
	bl _080596CC
_08058E88:
	movs r0, #0
	bl sub_8055A34
	bl _080596CC
	.align 2, 0
_08058E94: .4byte 0x0000FFF2
_08058E98:
	ldrh r1, [r7, #0x10]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _08058EA6
	bl _080596CC
_08058EA6:
	ldr r0, _08058EAC  @ 0x0000FFFE
	b _08059682
	.align 2, 0
_08058EAC: .4byte 0x0000FFFE
_08058EB0:
	ldr r4, _08058F2C  @ gAnims
	ldr r0, [r4]
	bl GettUnitEfxDebuff
	movs r5, #0xc
	ands r0, r5
	cmp r0, #0
	beq _08058EC8
	ldr r0, [r4]
	movs r1, #0
	bl SetUnitEfxDebuff
_08058EC8:
	ldr r0, [r4, #4]
	bl GettUnitEfxDebuff
	ands r0, r5
	cmp r0, #0
	beq _08058EDC
	ldr r0, [r4, #4]
	movs r1, #0
	bl SetUnitEfxDebuff
_08058EDC:
	ldr r0, [r4, #8]
	bl GettUnitEfxDebuff
	ands r0, r5
	cmp r0, #0
	beq _08058EF0
	ldr r0, [r4, #8]
	movs r1, #0
	bl SetUnitEfxDebuff
_08058EF0:
	ldr r0, [r4, #0xc]
	bl GettUnitEfxDebuff
	ands r0, r5
	cmp r0, #0
	beq _08058F04
	ldr r0, [r4, #0xc]
	movs r1, #0
	bl SetUnitEfxDebuff
_08058F04:
	ldrh r1, [r7, #0x10]
	movs r2, #0x20
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	bne _08058F26
	adds r0, r2, #0
	orrs r0, r1
	strh r0, [r7, #0x10]
	adds r0, r7, #0
	bl sub_805A154
	cmp r0, #0
	bne _08058F26
	adds r0, r7, #0
	bl NewEfxSpecalEffect
_08058F26:
	ldrh r1, [r7, #0x10]
	b _08059674
	.align 2, 0
_08058F2C: .4byte gAnims
_08058F30:
	ldrh r1, [r7, #0x10]
	movs r2, #0x20
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	bne _08058F46
	adds r0, r2, #0
	orrs r0, r1
	movs r1, #0x40
	orrs r0, r1
	strh r0, [r7, #0x10]
_08058F46:
	ldrh r2, [r7, #0x10]
	movs r0, #0x40
	ands r0, r2
	cmp r0, #0
	bne _08058F52
	b _080596CC
_08058F52:
	ldr r1, _08058FAC  @ 0x0000FFDF
	ands r1, r2
	ldr r0, _08058FB0  @ 0x0000FFBF
	ands r1, r0
	ldr r0, [r7, #0x20]
	adds r0, #4
	str r0, [r7, #0x20]
	movs r5, #9
	movs r6, #0
	orrs r1, r5
	strh r1, [r7, #0x10]
	adds r0, r7, #0
	bl GetCoreAIStruct
	adds r2, r0, #0
	adds r0, r7, #0
	str r2, [sp]
	bl GetSomeAISRelatedIndexMaybe
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	mov r8, r0
	mov r4, r8
	adds r0, r4, #0
	bl GetSomeBoolean
	ldr r2, [sp]
	cmp r0, #1
	beq _08058F8E
	b _080596CC
_08058F8E:
	cmp r2, #0
	bne _08058F94
	b _080596CC
_08058F94:
	ldrh r0, [r2, #0x10]
	orrs r0, r5
	strh r0, [r2, #0x10]
	adds r0, r7, #0
	str r2, [sp]
	bl sub_805A154
	cmp r0, #0
	beq _08058FA8
	b _080596CC
_08058FA8:
	adds r0, r4, #0
	b _080591E2
	.align 2, 0
_08058FAC: .4byte 0x0000FFDF
_08058FB0: .4byte 0x0000FFBF
_08058FB4:
	ldrh r1, [r7, #0x10]
	movs r2, #0x20
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	bne _08058FCA
	adds r0, r2, #0
	orrs r0, r1
	movs r1, #0x40
	orrs r0, r1
	strh r0, [r7, #0x10]
_08058FCA:
	ldrh r2, [r7, #0x10]
	movs r0, #0x40
	ands r0, r2
	cmp r0, #0
	bne _08058FD6
	b _080596CC
_08058FD6:
	ldr r1, _08059010  @ 0x0000FFDF
	ands r1, r2
	ldr r0, _08059014  @ 0x0000FFBF
	ands r1, r0
	ldr r0, [r7, #0x20]
	adds r0, #4
	str r0, [r7, #0x20]
	movs r0, #9
	orrs r1, r0
	strh r1, [r7, #0x10]
	adds r0, r7, #0
	bl sub_805A154
	cmp r0, #0
	beq _08058FF6
	b _080596CC
_08058FF6:
	adds r0, r7, #0
	bl StartSpellAnimation
	bl sub_8055A28
	cmp r0, #0
	bne _08059006
	b _080596CC
_08059006:
	movs r0, #2
	bl sub_8055A34
	b _080596CC
	.align 2, 0
_08059010: .4byte 0x0000FFDF
_08059014: .4byte 0x0000FFBF
_08059018:
	adds r0, r7, #0
	bl GetCoreAIStruct
	adds r2, r0, #0
	cmp r2, #0
	bne _08059026
	b _080596CC
_08059026:
	str r2, [sp]
	bl sub_805A334
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	mov r8, r0
	movs r0, #1
	negs r0, r0
	ldr r2, [sp]
	cmp r8, r0
	bne _0805903E
	b _080596CC
_0805903E:
	ldrh r1, [r2, #0x10]
	movs r0, #2
	orrs r0, r1
	strh r0, [r2, #0x10]
	b _080596CC
_08059048:
	adds r0, r7, #0
	bl GetAISSubjectId
	adds r1, r0, #0
	ldrh r0, [r7, #0xe]
	subs r0, #1
	lsls r0, r0, #1
	adds r0, r0, r1
	bl GetAnimRoundType
	movs r1, #0x80
	lsls r1, r1, #4
	ands r1, r0
	cmp r1, #0
	beq _0805908C
	ldrh r1, [r7, #0x10]
	movs r2, #0x20
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _08059074
	b _08059674
_08059074:
	adds r0, r2, #0
	orrs r0, r1
	strh r0, [r7, #0x10]
	adds r0, r7, #0
	bl sub_805A154
	cmp r0, #0
	bne _08059140
	adds r0, r7, #0
	bl NewEfxSkillType01BG
	b _08059140
_0805908C:
	adds r0, r7, #0
	bl GetAISSubjectId
	adds r1, r0, #0
	ldrh r0, [r7, #0xe]
	subs r0, #1
	lsls r0, r0, #1
	adds r0, r0, r1
	bl GetAnimRoundType
	movs r1, #0x80
	lsls r1, r1, #3
	ands r1, r0
	cmp r1, #0
	beq _080590D2
	ldrh r1, [r7, #0x10]
	movs r2, #0x20
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _080590B8
	b _08059674
_080590B8:
	adds r0, r2, #0
	orrs r0, r1
	strh r0, [r7, #0x10]
	adds r0, r7, #0
	bl sub_805A154
	cmp r0, #0
	bne _08059140
	adds r0, r7, #0
	movs r1, #1
	bl NewEfxSkillCommonBG
	b _08059140
_080590D2:
	adds r0, r7, #0
	bl GetAISSubjectId
	adds r1, r0, #0
	ldrh r0, [r7, #0xe]
	subs r0, #1
	lsls r0, r0, #1
	adds r0, r0, r1
	bl GetAnimRoundType
	movs r1, #0x80
	lsls r1, r1, #2
	ands r1, r0
	cmp r1, #0
	beq _08059140
	ldrh r1, [r7, #0x10]
	movs r2, #0x20
	movs r5, #0x20
	adds r0, r5, #0
	ands r0, r1
	cmp r0, #0
	beq _08059100
	b _08059674
_08059100:
	adds r0, r2, #0
	orrs r0, r1
	strh r0, [r7, #0x10]
	adds r0, r7, #0
	bl sub_805A154
	cmp r0, #0
	bne _08059140
	adds r0, r7, #0
	bl NewEfxSkillType01BG
	ldr r4, _08059150  @ gAnims
	ldr r1, [r4, #8]
	ldrh r2, [r1, #0x10]
	adds r0, r5, #0
	ands r0, r2
	strh r0, [r1, #0x10]
	ldr r1, [r4, #8]
	ldrh r3, [r1]
	ldr r2, _08059154  @ 0x0000FFF7
	adds r0, r2, #0
	ands r0, r3
	strh r0, [r1]
	ldr r1, [r4, #0xc]
	ldrh r3, [r1, #0x10]
	adds r0, r5, #0
	ands r0, r3
	strh r0, [r1, #0x10]
	ldr r0, [r4, #0xc]
	ldrh r1, [r0]
	ands r2, r1
	strh r2, [r0]
_08059140:
	ldrh r1, [r7, #0x10]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	bne _0805914C
	b _080596CC
_0805914C:
	b _08059674
	.align 2, 0
_08059150: .4byte gAnims
_08059154: .4byte 0x0000FFF7
_08059158:
	adds r0, r7, #0
	bl sub_805A154
	cmp r0, #0
	beq _08059164
	b _080596CC
_08059164:
	adds r0, r7, #0
	bl GetCoreAIStruct
	adds r2, r0, #0
	adds r0, r7, #0
	str r2, [sp]
	bl GetSomeAISRelatedIndexMaybe
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	mov r8, r0
	bl GetSomeBoolean
	ldr r2, [sp]
	cmp r0, #0
	bne _080591C6
	adds r0, r2, #0
	bl sub_8072400
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r2, [sp]
	cmp r0, #2
	beq _080591C6
	adds r0, r7, #0
	bl GetAISSubjectId
	adds r1, r0, #0
	ldrh r0, [r7, #0xe]
	subs r0, #1
	lsls r0, r0, #1
	adds r0, r0, r1
	bl GetAnimRoundType
	movs r1, #0x80
	lsls r1, r1, #5
	ands r1, r0
	ldr r2, [sp]
	cmp r1, #0
	beq _080591BC
	adds r0, r2, #0
	bl sub_806E014
	b _080591C4
_080591BC:
	adds r0, r2, #0
	str r2, [sp]
	bl sub_806C71C
_080591C4:
	ldr r2, [sp]
_080591C6:
	cmp r2, #0
	bne _080591CC
	b _080596CC
_080591CC:
	ldrh r1, [r2, #0x10]
	movs r0, #9
	orrs r0, r1
	strh r0, [r2, #0x10]
	adds r0, r7, #0
	str r2, [sp]
	bl GetSomeAISRelatedIndexMaybe
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	mov r8, r0
_080591E2:
	bl GetSomeBoolean
	adds r1, r0, #0
	ldr r2, [sp]
	adds r0, r2, #0
	bl ThisMakesTheHPInSpellAnimGoAway
	b _080596CC
_080591F2:
	adds r0, r7, #0
	bl sub_805A2F0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	mov r8, r0
	ldr r4, _08059234  @ gAnims
	adds r0, r7, #0
	bl GetAISSubjectId
	lsls r0, r0, #3
	adds r0, r0, r4
	ldr r2, [r0]
	adds r0, r7, #0
	str r2, [sp]
	bl GetAISSubjectId
	lsls r0, r0, #1
	adds r0, #1
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r6, [r0]
	ldrb r0, [r7, #0x12]
	ldr r2, [sp]
	cmp r0, #9
	bls _08059228
	b _080596CC
_08059228:
	lsls r0, r0, #2
	ldr r1, _08059238  @ _0805923C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08059234: .4byte gAnims
_08059238: .4byte _0805923C
_0805923C: @ jump table
	.4byte _08059264 @ case 0
	.4byte _08059264 @ case 1
	.4byte _08059264 @ case 2
	.4byte _08059264 @ case 3
	.4byte _08059368 @ case 4
	.4byte _08059368 @ case 5
	.4byte _08059376 @ case 6
	.4byte _08059376 @ case 7
	.4byte _08059376 @ case 8
	.4byte _08059264 @ case 9
_08059264:
	movs r0, #1
	negs r0, r0
	cmp r8, r0
	bne _0805926E
	b _08059368
_0805926E:
	ldrh r0, [r2, #0xe]
	adds r0, #1
	strh r0, [r2, #0xe]
	ldrh r0, [r6, #0xe]
	adds r0, #1
	strh r0, [r6, #0xe]
	adds r0, r2, #0
	mov r1, r8
	str r2, [sp]
	bl BanimSetupRoundBasedScript
	adds r0, r6, #0
	mov r1, r8
	bl BanimSetupRoundBasedScript
	ldr r2, [sp]
	ldrh r0, [r2, #0x10]
	movs r1, #4
	orrs r0, r1
	strh r0, [r2, #0x10]
	ldrh r0, [r6, #0x10]
	orrs r1, r0
	strh r1, [r6, #0x10]
	ldr r1, _080592C4  @ gUnknown_080DAF18
	ldr r0, _080592C8  @ gEkrDistanceType
	movs r3, #0
	ldrsh r0, [r0, r3]
	adds r0, r0, r1
	ldrb r0, [r0]
	mov r8, r0
	ldr r1, _080592CC  @ gBanimRoundScripts
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r4, [r0]
	adds r0, r7, #0
	str r2, [sp]
	bl GetAISSubjectId
	ldr r2, [sp]
	cmp r0, #0
	bne _080592D4
	ldr r0, _080592D0  @ gpBanimModesLeft
	b _080592D6
	.align 2, 0
_080592C4: .4byte gUnknown_080DAF18
_080592C8: .4byte gEkrDistanceType
_080592CC: .4byte gBanimRoundScripts
_080592D0: .4byte gpBanimModesLeft
_080592D4:
	ldr r0, _08059354  @ gpBanimModesRight
_080592D6:
	ldr r1, [r0]
	lsls r0, r4, #2
	adds r0, r0, r1
	ldr r4, [r0]
	adds r0, r7, #0
	str r2, [sp]
	bl GetAISSubjectId
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r0
	lsls r1, r1, #9
	ldr r0, _08059358  @ gBanimScrLeft
	adds r1, r1, r0
	adds r1, r4, r1
	ldr r0, [r1, #4]
	ldr r2, [sp]
	str r0, [r2, #0x28]
	ldr r4, [r2, #0x30]
	ldr r1, [r1, #8]
	adds r4, r4, r1
	str r4, [r2, #0x3c]
	ldr r4, [r6, #0x30]
	ldr r0, _0805935C  @ 0x000057F0
	adds r4, r4, r0
	str r4, [r6, #0x3c]
	ldr r4, _08059360  @ gUnknown_0203E1A4
	adds r0, r7, #0
	str r2, [sp]
	bl GetAISSubjectId
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r0, [r0]
	ldr r2, [sp]
	cmp r0, #0
	bne _0805938A
	ldr r4, _08059364  @ gpImgSheet
	adds r0, r2, #0
	bl GetAISSubjectId
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r1, [r0]
	ldr r2, [sp]
	ldr r0, [r2, #0x28]
	cmp r1, r0
	beq _0805938A
	adds r0, r2, #0
	bl NewEkrChienCHR
	ldr r2, [sp]
	adds r0, r2, #0
	bl GetAISSubjectId
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r2, [sp]
	ldr r1, [r2, #0x28]
	str r1, [r0]
	b _0805938A
	.align 2, 0
_08059354: .4byte gpBanimModesRight
_08059358: .4byte gBanimScrLeft
_0805935C: .4byte 0x000057F0
_08059360: .4byte gUnknown_0203E1A4
_08059364: .4byte gpImgSheet
_08059368:
	ldr r1, _08059398  @ gUnknown_080DAF18
	ldr r0, _0805939C  @ gEkrDistanceType
	movs r3, #0
	ldrsh r0, [r0, r3]
	adds r0, r0, r1
	ldrb r0, [r0]
	mov r8, r0
_08059376:
	adds r0, r2, #0
	mov r1, r8
	str r2, [sp]
	bl BanimSetupRoundBasedScript
	adds r0, r6, #0
	mov r1, r8
	bl BanimSetupRoundBasedScript
	ldr r2, [sp]
_0805938A:
	adds r0, r2, #0
	bl sub_80598CC
	adds r0, r6, #0
	bl sub_80598CC
	b _080596D6
	.align 2, 0
_08059398: .4byte gUnknown_080DAF18
_0805939C: .4byte gEkrDistanceType
_080593A0:
	ldrh r2, [r7, #0x10]
	movs r1, #0x20
	movs r0, #0x20
	ands r0, r2
	cmp r0, #0
	bne _080593B4
	adds r0, r1, #0
	orrs r0, r2
	strh r0, [r7, #0x10]
	b _080596CC
_080593B4:
	ldr r1, _080593C8  @ gUnknown_02017758
	ldr r0, [r1]
	cmp r0, #1
	beq _080593BE
	b _080596CC
_080593BE:
	movs r0, #0
	str r0, [r1]
	ldr r0, _080593CC  @ 0x0000FFDF
	ands r0, r2
	b _08059684
	.align 2, 0
_080593C8: .4byte gUnknown_02017758
_080593CC: .4byte 0x0000FFDF
_080593D0:
	adds r0, r7, #0
	bl sub_805A154
	cmp r0, #0
	beq _080593DC
	b _080596CC
_080593DC:
	movs r0, #3
	bl sub_8053730
	b _080596CC
_080593E4:
	adds r0, r7, #0
	bl sub_805A154
	cmp r0, #0
	beq _080593F0
	b _080596CC
_080593F0:
	movs r0, #0
	bl sub_8053730
	b _080596CC
_080593F8:
	ldrh r1, [r7, #0x10]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _08059404
	b _080596CC
_08059404:
	ldr r0, _08059424  @ 0x0000FFFE
	ands r0, r1
	strh r0, [r7, #0x10]
	ldr r0, [r7, #0x20]
	adds r0, #4
	str r0, [r7, #0x20]
	ldrh r1, [r7, #8]
	ldr r0, _08059428  @ 0x0000F3FF
	ands r0, r1
	movs r2, #0x80
	lsls r2, r2, #3
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r7, #8]
	movs r0, #0x8c
	b _080596B2
	.align 2, 0
_08059424: .4byte 0x0000FFFE
_08059428: .4byte 0x0000F3FF
_0805942C:
	adds r0, r7, #0
	bl sub_805A154
	cmp r0, #0
	beq _08059438
	b _080596CC
_08059438:
	adds r0, r7, #0
	bl GetCoreAIStruct
	adds r2, r0, #0
	cmp r2, #0
	beq _0805946A
	ldrh r1, [r2, #0x10]
	movs r0, #9
	orrs r0, r1
	strh r0, [r2, #0x10]
	adds r0, r7, #0
	str r2, [sp]
	bl GetSomeAISRelatedIndexMaybe
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	mov r8, r0
	bl GetSomeBoolean
	adds r1, r0, #0
	ldr r2, [sp]
	adds r0, r2, #0
	bl ThisMakesTheHPInSpellAnimGoAway
	ldr r2, [sp]
_0805946A:
	adds r0, r2, #0
	str r2, [sp]
	bl sub_8072400
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #2
	bne _0805947C
	b _080596CC
_0805947C:
	adds r0, r7, #0
	bl GetAISSubjectId
	adds r1, r0, #0
	ldrh r0, [r7, #0xe]
	subs r0, #1
	lsls r0, r0, #1
	adds r0, r0, r1
	bl GetAnimRoundType
	movs r1, #0x80
	lsls r1, r1, #5
	ands r1, r0
	ldr r2, [sp]
	cmp r1, #0
	beq _080594A4
	adds r0, r2, #0
	bl sub_806E014
	b _080596CC
_080594A4:
	adds r0, r7, #0
	bl sub_806C87C
	b _080596CC
_080594AC:
	adds r0, r7, #0
	bl sub_805A154
	cmp r0, #0
	beq _080594B8
	b _080596CC
_080594B8:
	adds r0, r7, #0
	movs r1, #0
	bl sub_806CC60
	b _080596CC
_080594C2:
	adds r0, r7, #0
	bl sub_805A154
	cmp r0, #0
	beq _080594CE
	b _080596CC
_080594CE:
	adds r0, r7, #0
	movs r1, #1
	bl sub_806CC60
	b _080596CC
_080594D8:
	adds r0, r7, #0
	bl sub_805A154
	cmp r0, #0
	beq _080594E4
	b _080596CC
_080594E4:
	adds r0, r7, #0
	bl sub_806CE30
	b _080596CC
_080594EC:
	adds r0, r7, #0
	bl GetAISSubjectId
	adds r1, r0, #0
	ldrh r0, [r7, #0xe]
	subs r0, #1
	lsls r0, r0, #1
	adds r0, r0, r1
	bl GetAnimRoundType
	movs r1, #0x80
	lsls r1, r1, #5
	ands r1, r0
	cmp r1, #0
	bne _0805950C
	b _08059686
_0805950C:
	ldrh r1, [r7, #0x10]
	movs r2, #0x20
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _0805951A
	b _08059674
_0805951A:
	adds r0, r2, #0
	orrs r0, r1
	strh r0, [r7, #0x10]
	adds r0, r7, #0
	bl sub_805A154
	cmp r0, #0
	beq _0805952C
	b _080596CC
_0805952C:
	adds r0, r7, #0
	movs r1, #0
	bl sub_806E1F0
	b _080596CC
_08059536:
	adds r0, r7, #0
	bl sub_805A154
	cmp r0, #0
	beq _08059542
	b _080596CC
_08059542:
	adds r0, r7, #0
	movs r1, #0
	bl sub_806D080
	b _080596CC
_0805954C:
	adds r0, r7, #0
	bl sub_805A154
	cmp r0, #0
	beq _08059558
	b _080596CC
_08059558:
	adds r0, r7, #0
	movs r1, #1
	bl sub_806D080
	b _080596CC
_08059562:
	adds r0, r7, #0
	bl sub_805A154
	cmp r0, #0
	beq _0805956E
	b _080596CC
_0805956E:
	adds r0, r7, #0
	movs r1, #0
	bl sub_806D320
	b _080596CC
_08059578:
	adds r0, r7, #0
	bl sub_805A154
	cmp r0, #0
	beq _08059584
	b _080596CC
_08059584:
	adds r0, r7, #0
	movs r1, #1
	bl sub_806D320
	b _080596CC
_0805958E:
	adds r0, r7, #0
	bl sub_805A154
	cmp r0, #0
	beq _0805959A
	b _080596CC
_0805959A:
	adds r0, r7, #0
	movs r1, #2
	bl sub_806D320
	b _080596CC
_080595A4:
	ldrh r1, [r7, #0x10]
	movs r2, #0x20
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	bne _08059674
	adds r0, r2, #0
	orrs r0, r1
	strh r0, [r7, #0x10]
	adds r0, r7, #0
	bl sub_805A154
	cmp r0, #0
	beq _080595C2
	b _080596CC
_080595C2:
	adds r0, r7, #0
	bl sub_806D65C
	b _080596CC
_080595CA:
	ldrh r1, [r7, #0x10]
	movs r2, #0x20
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _080595D8
	b _08058F26
_080595D8:
	adds r0, r2, #0
	orrs r0, r1
	strh r0, [r7, #0x10]
	adds r0, r7, #0
	bl sub_805A154
	cmp r0, #0
	bne _080595EE
	movs r0, #1
	bl sub_8055A34
_080595EE:
	adds r0, r7, #0
	bl nullsub_17
	adds r0, r7, #0
	bl NewEfxspdquake
	b _08058F26
_080595FC:
	adds r0, r7, #0
	bl sub_806DD34
	b _080596CC
_08059604:
	adds r0, r7, #0
	bl sub_806D570
	b _080596CC
_0805960C:
	ldrh r1, [r7, #0x10]
	movs r2, #0x20
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	bne _08059674
	adds r0, r2, #0
	orrs r0, r1
	strh r0, [r7, #0x10]
	adds r0, r7, #0
	bl sub_805A154
	cmp r0, #0
	bne _080596CC
	adds r0, r7, #0
	bl sub_806D6E8
	b _080596CC
_08059630:
	adds r0, r7, #0
	bl GetAISSubjectId
	adds r1, r0, #0
	ldrh r0, [r7, #0xe]
	subs r0, #1
	lsls r0, r0, #1
	adds r0, r0, r1
	bl GetAnimRoundType
	movs r1, #0x80
	lsls r1, r1, #5
	ands r1, r0
	cmp r1, #0
	beq _08059686
	ldrh r1, [r7, #0x10]
	movs r2, #0x20
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	bne _08059674
	adds r0, r2, #0
	orrs r0, r1
	strh r0, [r7, #0x10]
	adds r0, r7, #0
	bl sub_805A154
	cmp r0, #0
	bne _080596CC
	adds r0, r7, #0
	movs r1, #1
	bl sub_806E1F0
	b _080596CC
_08059674:
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _080596CC
	ldr r0, _08059690  @ 0x0000FFDF
	ands r0, r1
	ldr r1, _08059694  @ 0x0000FFBF
_08059682:
	ands r0, r1
_08059684:
	strh r0, [r7, #0x10]
_08059686:
	ldr r0, [r7, #0x20]
	adds r0, #4
	str r0, [r7, #0x20]
	b _080596CC
	.align 2, 0
_08059690: .4byte 0x0000FFDF
_08059694: .4byte 0x0000FFBF
_08059698:
	subs r0, r3, #1
	adds r0, r2, r0
	ldrb r1, [r0]
	adds r0, r7, #0
	bl sub_8071B6C
	b _080596CC
_080596A6:
	adds r0, r7, #0
	bl sub_805A154
	cmp r0, #0
	bne _080596CC
	movs r0, #0x14
_080596B2:
	strh r0, [r7, #0xa]
	bl AnimSort
	b _080596CC
_080596BA:
	adds r0, r7, #0
	bl sub_805A154
	cmp r0, #0
	bne _080596CC
	movs r0, #0x64
	strh r0, [r7, #0xa]
	bl AnimSort
_080596CC:
	ldrb r0, [r7, #0x14]
	subs r0, #1
	strb r0, [r7, #0x14]
	bl _08058C10
_080596D6:
	ldrh r1, [r7, #0xc]
	movs r0, #0xe7
	lsls r0, r0, #8
	ands r0, r1
	strh r0, [r7, #0xc]
_080596E0: @ 0x080596E0
	movs r0, #0x80
	lsls r0, r0, #6
	mov r3, r8
	ands r0, r3
	cmp r0, #0
	beq _08059746
	adds r0, r7, #0
	bl sub_805A154
	cmp r0, #0
	bne _0805973C
	ldr r4, _0805979C  @ gUnknown_0203E1A4
	adds r0, r7, #0
	bl GetAISSubjectId
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r0, [r0]
	cmp r0, #0
	bne _0805973C
	ldrh r1, [r7, #0x10]
	movs r0, #0x80
	lsls r0, r0, #7
	ands r0, r1
	cmp r0, #0
	bne _0805973C
	ldr r4, _080597A0  @ gpImgSheet
	adds r0, r7, #0
	bl GetAISSubjectId
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r1, [r0]
	ldr r0, [r7, #0x28]
	cmp r1, r0
	beq _0805973C
	adds r0, r7, #0
	bl RegisterAISSheetGraphics
	adds r0, r7, #0
	bl GetAISSubjectId
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r1, [r7, #0x28]
	str r1, [r0]
_0805973C:
	ldrh r1, [r7, #0xc]
	movs r0, #0xd7
	lsls r0, r0, #8
	ands r0, r1
	strh r0, [r7, #0xc]
_08059746:
	movs r0, #0x80
	lsls r0, r0, #7
	mov r1, r8
	ands r1, r0
	cmp r1, #0
	bne _0805975C
	ldr r0, _080597A4  @ gEkrDebugUnk3
	ldr r0, [r0]
	cmp r0, #1
	beq _0805975C
	b _080598AE
_0805975C:
	ldrh r1, [r7, #0x10]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080597E8
	adds r0, r7, #0
	bl sub_805A2F0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	mov r8, r0
	movs r0, #1
	negs r0, r0
	cmp r8, r0
	beq _080597B0
	ldr r6, _080597A8  @ gAnims
	adds r0, r7, #0
	bl GetAISSubjectId
	lsls r0, r0, #3
	adds r0, r0, r6
	ldr r2, [r0]
	adds r0, r2, #0
	mov r1, r8
	str r2, [sp]
	bl BanimSetupRoundBasedScript
	ldr r2, [sp]
	ldrh r1, [r2, #0x10]
	ldr r4, _080597AC  @ 0x0000FFFD
	b _08059824
	.align 2, 0
_0805979C: .4byte gUnknown_0203E1A4
_080597A0: .4byte gpImgSheet
_080597A4: .4byte gEkrDebugUnk3
_080597A8: .4byte gAnims
_080597AC: .4byte 0x0000FFFD
_080597B0:
	ldr r5, _080597E0  @ gAnims
	adds r0, r7, #0
	bl GetAISSubjectId
	lsls r0, r0, #3
	adds r0, r0, r5
	ldr r2, [r0]
	ldrh r1, [r2, #0x10]
	ldr r4, _080597E4  @ 0x0000FFFD
	adds r0, r4, #0
	ands r0, r1
	strh r0, [r2, #0x10]
	adds r0, r7, #0
	bl GetAISSubjectId
	lsls r0, r0, #1
	adds r0, #1
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r6, [r0]
	ldrh r0, [r6, #0x10]
	ands r4, r0
	strh r4, [r6, #0x10]
	b _080598AE
	.align 2, 0
_080597E0: .4byte gAnims
_080597E4: .4byte 0x0000FFFD
_080597E8:
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r1
	cmp r0, #0
	beq _08059874
	adds r0, r7, #0
	bl sub_805A2F0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	mov r8, r0
	movs r0, #1
	negs r0, r0
	cmp r8, r0
	beq _080598AE
	ldr r6, _0805986C  @ gAnims
	adds r0, r7, #0
	bl GetAISSubjectId
	lsls r0, r0, #3
	adds r0, r0, r6
	ldr r2, [r0]
	adds r0, r2, #0
	mov r1, r8
	str r2, [sp]
	bl BanimSetupRoundBasedScript
	ldr r2, [sp]
	ldrh r1, [r2, #0x10]
	ldr r4, _08059870  @ 0x00007FFF
_08059824:
	adds r0, r4, #0
	ands r0, r1
	movs r5, #4
	orrs r0, r5
	strh r0, [r2, #0x10]
	adds r0, r7, #0
	str r2, [sp]
	bl GetAISSubjectId
	lsls r0, r0, #1
	adds r0, #1
	lsls r0, r0, #2
	adds r0, r0, r6
	ldr r6, [r0]
	adds r0, r6, #0
	mov r1, r8
	bl BanimSetupRoundBasedScript
	ldrh r0, [r6, #0x10]
	ands r4, r0
	orrs r4, r5
	strh r4, [r6, #0x10]
	ldr r2, [sp]
	ldrh r0, [r2, #0xe]
	adds r0, #1
	strh r0, [r2, #0xe]
	ldrh r0, [r6, #0xe]
	adds r0, #1
	strh r0, [r6, #0xe]
	adds r0, r2, #0
	bl sub_80598CC
	adds r0, r6, #0
	bl sub_80598CC
	b _080598AE
	.align 2, 0
_0805986C: .4byte gAnims
_08059870: .4byte 0x00007FFF
_08059874:
	adds r0, r7, #0
	bl sub_805A154
	cmp r0, #0
	bne _080598AE
	adds r0, r7, #0
	bl GetAISSubjectId
	adds r1, r0, #0
	ldrh r0, [r7, #0xe]
	lsls r0, r0, #1
	adds r0, r0, r1
	bl GetSomeAISRelatedIndexMaybeByID
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	mov r8, r0
	movs r0, #1
	negs r0, r0
	cmp r8, r0
	bne _080598AE
	adds r0, r7, #0
	bl GetAISSubjectId
	ldr r1, _080598C8  @ gBanimDoneMaybe
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r1, #1
	str r1, [r0]
_080598AE:
	mov r2, r9
	cmp r2, #3
	bhi _080598B8
	bl _08058BD4
_080598B8:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080598C8: .4byte gBanimDoneMaybe

	THUMB_FUNC_END BattleAIS_ExecCommands

.align 2, 0
