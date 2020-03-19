	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED
	
	THUMB_FUNC_START sub_80097E8
sub_80097E8: @ 0x080097E8
	push {lr}
	cmp r0, #0x3e
	bls _080097F0
	b _08009948
_080097F0:
	lsls r0, r0, #2
	ldr r1, _080097FC  @ _08009800
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080097FC: .4byte _08009800
_08009800: @ jump table
	.4byte _08009948 @ case 0
	.4byte _08009948 @ case 1
	.4byte _080098FC @ case 2
	.4byte _08009900 @ case 3
	.4byte _08009904 @ case 4
	.4byte _08009908 @ case 5
	.4byte _08009908 @ case 6
	.4byte _0800990C @ case 7
	.4byte _08009910 @ case 8
	.4byte _08009914 @ case 9
	.4byte _08009918 @ case 10
	.4byte _0800991C @ case 11
	.4byte _08009920 @ case 12
	.4byte _08009924 @ case 13
	.4byte _08009928 @ case 14
	.4byte _0800992C @ case 15
	.4byte _08009930 @ case 16
	.4byte _08009934 @ case 17
	.4byte _08009938 @ case 18
	.4byte _0800993C @ case 19
	.4byte _08009940 @ case 20
	.4byte _08009944 @ case 21
	.4byte _08009944 @ case 22
	.4byte _08009918 @ case 23
	.4byte _0800991C @ case 24
	.4byte _08009920 @ case 25
	.4byte _08009924 @ case 26
	.4byte _08009928 @ case 27
	.4byte _0800992C @ case 28
	.4byte _08009930 @ case 29
	.4byte _08009934 @ case 30
	.4byte _08009938 @ case 31
	.4byte _0800993C @ case 32
	.4byte _08009940 @ case 33
	.4byte _08009944 @ case 34
	.4byte _08009944 @ case 35
	.4byte _08009948 @ case 36
	.4byte _08009948 @ case 37
	.4byte _08009948 @ case 38
	.4byte _08009948 @ case 39
	.4byte _08009948 @ case 40
	.4byte _08009948 @ case 41
	.4byte _08009948 @ case 42
	.4byte _08009948 @ case 43
	.4byte _08009948 @ case 44
	.4byte _08009948 @ case 45
	.4byte _08009948 @ case 46
	.4byte _08009948 @ case 47
	.4byte _08009948 @ case 48
	.4byte _08009948 @ case 49
	.4byte _08009948 @ case 50
	.4byte _08009948 @ case 51
	.4byte _08009948 @ case 52
	.4byte _08009948 @ case 53
	.4byte _08009948 @ case 54
	.4byte _08009948 @ case 55
	.4byte _08009914 @ case 56
	.4byte _08009948 @ case 57
	.4byte _08009948 @ case 58
	.4byte _08009948 @ case 59
	.4byte _08009948 @ case 60
	.4byte _08009920 @ case 61
	.4byte _08009920 @ case 62
_080098FC:
	movs r0, #1
	b _0800994A
_08009900:
	movs r0, #2
	b _0800994A
_08009904:
	movs r0, #3
	b _0800994A
_08009908:
	movs r0, #4
	b _0800994A
_0800990C:
	movs r0, #5
	b _0800994A
_08009910:
	movs r0, #6
	b _0800994A
_08009914:
	movs r0, #7
	b _0800994A
_08009918:
	movs r0, #8
	b _0800994A
_0800991C:
	movs r0, #9
	b _0800994A
_08009920:
	movs r0, #0xa
	b _0800994A
_08009924:
	movs r0, #0xb
	b _0800994A
_08009928:
	movs r0, #0xc
	b _0800994A
_0800992C:
	movs r0, #0xd
	b _0800994A
_08009930:
	movs r0, #0xe
	b _0800994A
_08009934:
	movs r0, #0xf
	b _0800994A
_08009938:
	movs r0, #0x10
	b _0800994A
_0800993C:
	movs r0, #0x11
	b _0800994A
_08009940:
	movs r0, #0x12
	b _0800994A
_08009944:
	movs r0, #0x13
	b _0800994A
_08009948:
	movs r0, #0
_0800994A:
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80097E8

	THUMB_FUNC_START sub_8009950
sub_8009950: @ 0x08009950
	push {r4, r5, r6, lr}
	sub sp, #0x4c
	bl sub_80A4BB0
	cmp r0, #0
	beq _08009960
_0800995C:
	movs r0, #9
	b _080099DA
_08009960:
	movs r5, #0
	movs r4, #0
	mov r6, sp
_08009966:
	adds r0, r4, #0
	bl sub_80A5218
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08009992
	adds r0, r4, #0
	mov r1, sp
	bl sub_80A522C
	ldrh r0, [r6, #0x2e]
	lsls r0, r0, #0x14
	lsrs r0, r0, #0x1b
	cmp r0, #0
	bne _0800995C
	movs r0, #0xe
	ldrsb r0, [r6, r0]
	bl sub_80097E8
	cmp r5, r0
	bge _08009992
	adds r5, r0, #0
_08009992:
	adds r4, #1
	cmp r4, #2
	ble _08009966
	cmp r5, #0x11
	ble _080099A0
	movs r0, #8
	b _080099DA
_080099A0:
	cmp r5, #0xf
	ble _080099A8
	movs r0, #7
	b _080099DA
_080099A8:
	cmp r5, #0xd
	ble _080099B0
	movs r0, #6
	b _080099DA
_080099B0:
	cmp r5, #0xb
	ble _080099B8
	movs r0, #5
	b _080099DA
_080099B8:
	cmp r5, #9
	ble _080099C0
	movs r0, #4
	b _080099DA
_080099C0:
	cmp r5, #7
	ble _080099C8
	movs r0, #3
	b _080099DA
_080099C8:
	cmp r5, #5
	ble _080099D0
	movs r0, #2
	b _080099DA
_080099D0:
	cmp r5, #3
	bgt _080099D8
	movs r0, #0
	b _080099DA
_080099D8:
	movs r0, #1
_080099DA:
	add sp, #0x4c
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8009950

	THUMB_FUNC_START sub_80099E4
sub_80099E4: @ 0x080099E4
	push {r4, lr}
	adds r4, r0, #0
	bl sub_8009950
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r1, r4, #0
	bl Make6C_opinfo
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80099E4

	THUMB_FUNC_START Goto6CLabel12IfSomething
Goto6CLabel12IfSomething: @ 0x08009A00
	push {lr}
	adds r2, r0, #0
	ldr r0, _08009A20  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #4]
	movs r0, #0x85
	lsls r0, r0, #2
	cmp r1, r0
	bne _08009A1A
	adds r0, r2, #0
	movs r1, #0x12
	bl Proc_Goto
_08009A1A:
	pop {r0}
	bx r0
	.align 2, 0
_08009A20: .4byte gKeyStatusPtr

	THUMB_FUNC_END Goto6CLabel12IfSomething

	THUMB_FUNC_START sub_8009A24
sub_8009A24: @ 0x08009A24
	push {lr}
	movs r0, #0
	bl SetupBackgrounds
	bl sub_80156D4
	ldr r2, _08009A54  @ gRAMChapterData
	adds r2, #0x40
	ldrb r1, [r2]
	movs r0, #0x61
	negs r0, r0
	ands r0, r1
	movs r1, #0x20
	orrs r0, r1
	strb r0, [r2]
	movs r2, #1
	negs r2, r2
	movs r0, #3
	movs r1, #0
	bl sub_8086BB8
	pop {r0}
	bx r0
	.align 2, 0
_08009A54: .4byte gRAMChapterData

	THUMB_FUNC_END sub_8009A24

	THUMB_FUNC_START sub_8009A58
sub_8009A58: @ 0x08009A58
	movs r1, #0x14
	strh r1, [r0, #0x2e]
	bx lr

	THUMB_FUNC_END sub_8009A58

	THUMB_FUNC_START Null6CCallback
Null6CCallback: @ 0x08009A60
	push {lr}
	bl Proc_Break
	pop {r0}
	bx r0

	THUMB_FUNC_END Null6CCallback

	THUMB_FUNC_START Delete6CIfNotMarkedB
Delete6CIfNotMarkedB: @ 0x08009A6C
	push {lr}
	adds r1, r0, #0
	adds r0, #0x26
	ldrb r0, [r0]
	cmp r0, #0xb
	beq _08009A7E
	adds r0, r1, #0
	bl Proc_End
_08009A7E:
	pop {r0}
	bx r0

	THUMB_FUNC_END Delete6CIfNotMarkedB

	THUMB_FUNC_START sub_8009A84
sub_8009A84: @ 0x08009A84
	push {lr}
	sub sp, #4
	movs r0, #0
	str r0, [sp]
	ldr r1, _08009AAC  @ gPaletteBuffer
	ldr r2, _08009AB0  @ 0x01000100
	mov r0, sp
	bl CpuFastSet
	bl EnablePaletteSync
	ldr r0, _08009AB4  @ Delete6CIfNotMarkedB
	bl Proc_ForAll
	ldr r0, _08009AB8  @ SomeUpdateRoutine
	bl SetMainUpdateRoutine
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_08009AAC: .4byte gPaletteBuffer
_08009AB0: .4byte 0x01000100
_08009AB4: .4byte Delete6CIfNotMarkedB
_08009AB8: .4byte SomeUpdateRoutine

	THUMB_FUNC_END sub_8009A84

	THUMB_FUNC_START sub_8009ABC
sub_8009ABC: @ 0x08009ABC
	push {lr}
	movs r0, #0x43
	movs r1, #0
	bl Sound_PlaySong8002448
	movs r0, #0
	movs r1, #0xc0
	movs r2, #0x3c
	movs r3, #0
	bl ISuspectThisToBeMusicRelated_8002730
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8009ABC

	THUMB_FUNC_START sub_8009AD8
sub_8009AD8: @ 0x08009AD8
	push {lr}
	movs r0, #0x80
	lsls r0, r0, #1
	movs r1, #0xc0
	movs r2, #0x20
	movs r3, #0
	bl ISuspectThisToBeMusicRelated_8002730
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8009AD8

	THUMB_FUNC_START sub_8009AEC
sub_8009AEC: @ 0x08009AEC
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r0, #0x29
	ldrb r2, [r0]
	cmp r2, #1
	beq _08009B26
	cmp r2, #1
	bgt _08009B02
	cmp r2, #0
	beq _08009B16
	b _08009B5C
_08009B02:
	cmp r2, #2
	beq _08009B0C
	cmp r2, #3
	beq _08009B54
	b _08009B5C
_08009B0C:
	adds r0, r4, #0
	movs r1, #4
	bl Proc_Goto
	b _08009B5C
_08009B16:
	adds r0, r4, #0
	movs r1, #5
	bl Proc_Goto
	adds r0, r4, #0
	bl sub_8009AD8
	b _08009B5C
_08009B26:
	adds r0, r4, #0
	adds r0, #0x2b
	ldrb r1, [r0]
	ands r1, r2
	adds r5, r0, #0
	cmp r1, #0
	beq _08009B3A
	cmp r1, #1
	beq _08009B44
	b _08009B4C
_08009B3A:
	adds r0, r4, #0
	movs r1, #2
	bl Proc_Goto
	b _08009B4C
_08009B44:
	adds r0, r4, #0
	movs r1, #1
	bl Proc_Goto
_08009B4C:
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
	b _08009B5C
_08009B54:
	adds r0, r4, #0
	movs r1, #0x18
	bl Proc_Goto
_08009B5C:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8009AEC

	THUMB_FUNC_START sub_8009B64
sub_8009B64: @ 0x08009B64
	push {lr}
	adds r1, r0, #0
	adds r1, #0x29
	ldrb r1, [r1]
	cmp r1, #0
	beq _08009B76
	cmp r1, #1
	beq _08009B7E
	b _08009B84
_08009B76:
	movs r1, #4
	bl Proc_Goto
	b _08009B84
_08009B7E:
	movs r1, #1
	bl Proc_Goto
_08009B84:
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8009B64

	THUMB_FUNC_START GAMECTRL_MasterSwitch
GAMECTRL_MasterSwitch: @ 0x08009B88
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #0xc
	bhi _08009C16
	lsls r0, r0, #2
	ldr r1, _08009BA0  @ _08009BA4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08009BA0: .4byte _08009BA4
_08009BA4: @ jump table
	.4byte _08009BD8 @ case 0
	.4byte _08009BDC @ case 1
	.4byte _08009BDC @ case 2
	.4byte _08009BDC @ case 3
	.4byte _08009BE6 @ case 4
	.4byte _08009BF0 @ case 5
	.4byte _08009BFA @ case 6
	.4byte _08009C04 @ case 7
	.4byte _08009C16 @ case 8
	.4byte _08009C16 @ case 9
	.4byte _08009C16 @ case 10
	.4byte _08009C16 @ case 11
	.4byte _08009C0E @ case 12
_08009BD8:
	bl sub_80BC81C
_08009BDC:
	adds r0, r4, #0
	movs r1, #7
	bl Proc_Goto
	b _08009C16
_08009BE6:
	adds r0, r4, #0
	movs r1, #8
	bl Proc_Goto
	b _08009C16
_08009BF0:
	adds r0, r4, #0
	movs r1, #0x19
	bl Proc_Goto
	b _08009C16
_08009BFA:
	adds r0, r4, #0
	movs r1, #0xc
	bl Proc_Goto
	b _08009C16
_08009C04:
	adds r0, r4, #0
	movs r1, #0xe
	bl Proc_Goto
	b _08009C16
_08009C0E:
	adds r0, r4, #0
	movs r1, #0xf
	bl Proc_Goto
_08009C16:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END GAMECTRL_MasterSwitch

	THUMB_FUNC_START sub_8009C1C
sub_8009C1C: @ 0x08009C1C
	push {lr}
	adds r1, r0, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #5
	bne _08009C30
	adds r0, r1, #0
	movs r1, #4
	bl Proc_Goto
_08009C30:
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8009C1C

	THUMB_FUNC_START sub_8009C34
sub_8009C34: @ 0x08009C34
	push {lr}
	movs r1, #4
	bl Proc_Goto
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8009C34

	THUMB_FUNC_START sub_8009C40
sub_8009C40: @ 0x08009C40
	push {lr}
	adds r1, r0, #0
	adds r1, #0x29
	ldrb r1, [r1]
	cmp r1, #0
	beq _08009C56
	cmp r1, #1
	bne _08009C56
	movs r1, #0x13
	bl Proc_Goto
_08009C56:
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8009C40

	THUMB_FUNC_START sub_8009C5C
sub_8009C5C: @ 0x08009C5C
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #5
	bne _08009C72
	adds r0, r5, #0
	movs r1, #5
	bl Proc_Goto
	b _08009C98
_08009C72:
	movs r0, #0
	movs r1, #0
	bl InitPlaythroughState
	ldr r4, _08009CA0  @ gRAMChapterData
	ldrb r1, [r4, #0x14]
	movs r0, #8
	orrs r0, r1
	strb r0, [r4, #0x14]
	bl sub_8083D18
	bl ClearLocalEvents
	bl ClearUnits
	adds r0, r5, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	strb r0, [r4, #0xe]
_08009C98:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08009CA0: .4byte gRAMChapterData

	THUMB_FUNC_END sub_8009C5C

	THUMB_FUNC_START sub_8009CA4
sub_8009CA4: @ 0x08009CA4
	push {lr}
	bl sub_80A6D38
	bl sub_80A41C8
	bl ChapterChangeUnitCleanup
	ldr r1, _08009CBC  @ gRAMChapterData
	movs r0, #0x7f
	strb r0, [r1, #0xe]
	pop {r0}
	bx r0
	.align 2, 0
_08009CBC: .4byte gRAMChapterData

	THUMB_FUNC_END sub_8009CA4

	THUMB_FUNC_START sub_8009CC0
sub_8009CC0: @ 0x08009CC0
	push {lr}
	movs r0, #3
	bl sub_80A5A20
	ldr r0, _08009CDC  @ gRAMChapterData
	adds r0, #0x41
	ldrb r2, [r0]
	movs r1, #2
	negs r1, r1
	ands r1, r2
	strb r1, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_08009CDC: .4byte gRAMChapterData

	THUMB_FUNC_END sub_8009CC0

	THUMB_FUNC_START sub_8009CE0
sub_8009CE0: @ 0x08009CE0
	push {r4, lr}
	adds r4, r0, #0
	bl MU_EndAll
	adds r0, r4, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #2
	bgt _08009CFC
	cmp r0, #1
	bge _08009D14
	cmp r0, #0
	beq _08009D02
	b _08009D14
_08009CFC:
	cmp r0, #3
	beq _08009D0C
	b _08009D14
_08009D02:
	adds r0, r4, #0
	movs r1, #4
	bl Proc_Goto
	b _08009D14
_08009D0C:
	adds r0, r4, #0
	movs r1, #0x10
	bl Proc_Goto
_08009D14:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8009CE0

	THUMB_FUNC_START sub_8009D1C
sub_8009D1C: @ 0x08009D1C
	push {lr}
	adds r2, r0, #0
	ldr r0, _08009D40  @ gRAMChapterData
	adds r0, #0x4a
	ldrb r0, [r0]
	movs r1, #0xe
	ands r1, r0
	cmp r1, #4
	beq _08009D32
	cmp r1, #8
	bne _08009D3A
_08009D32:
	adds r0, r2, #0
	movs r1, #6
	bl Proc_Goto
_08009D3A:
	pop {r0}
	bx r0
	.align 2, 0
_08009D40: .4byte gRAMChapterData

	THUMB_FUNC_END sub_8009D1C

	THUMB_FUNC_START sub_8009D44
sub_8009D44: @ 0x08009D44
	push {lr}
	adds r2, r0, #0
	ldr r0, _08009D68  @ gRAMChapterData
	ldrb r1, [r0, #0x14]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	bne _08009D64
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _08009D64
	adds r0, r2, #0
	movs r1, #0x11
	bl Proc_Goto
_08009D64:
	pop {r0}
	bx r0
	.align 2, 0
_08009D68: .4byte gRAMChapterData

	THUMB_FUNC_END sub_8009D44

	THUMB_FUNC_START sub_8009D6C
sub_8009D6C: @ 0x08009D6C
	push {lr}
	adds r2, r0, #0
	ldr r0, _08009D88  @ gRAMChapterData
	ldrb r1, [r0, #0x14]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08009D8C
	adds r0, r2, #0
	movs r1, #0xa
	bl Proc_Goto
	b _08009D94
	.align 2, 0
_08009D88: .4byte gRAMChapterData
_08009D8C:
	adds r0, r2, #0
	movs r1, #9
	bl Proc_Goto
_08009D94:
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8009D6C

	THUMB_FUNC_START sub_8009D98
sub_8009D98: @ 0x08009D98
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r4, #2
_08009D9E:
	bl NextRN
	subs r4, #1
	cmp r4, #0
	bge _08009D9E
	ldr r0, _08009DD8  @ gUnknown_0300534E
	bl StoreRNState
	movs r0, #3
	bl CheckEventId
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08009DC0
	ldr r0, _08009DDC  @ gRAMChapterData
	bl RegisterChapterTimeAndTurnCount
_08009DC0:
	bl ComputeChapterRankings
	ldr r0, _08009DDC  @ gRAMChapterData
	adds r1, r5, #0
	adds r1, #0x2a
	ldrb r1, [r1]
	strb r1, [r0, #0xe]
	bl ChapterChangeUnitCleanup
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08009DD8: .4byte gUnknown_0300534E
_08009DDC: .4byte gRAMChapterData

	THUMB_FUNC_END sub_8009D98

	THUMB_FUNC_START CallActualSaveMenu
CallActualSaveMenu: @ 0x08009DE0
	push {lr}
	adds r1, r0, #0
	ldr r0, _08009DFC  @ gRAMChapterData
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x38
	beq _08009DF6
	adds r0, r1, #0
	bl Make6C_savemenu2
_08009DF6:
	pop {r0}
	bx r0
	.align 2, 0
_08009DFC: .4byte gRAMChapterData

	THUMB_FUNC_END CallActualSaveMenu

	THUMB_FUNC_START sub_8009E00
sub_8009E00: @ 0x08009E00
	push {lr}
	adds r3, r0, #0
	ldr r2, _08009E24  @ gRAMChapterData
	ldrb r1, [r2, #0x14]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	bne _08009E1E
	movs r0, #0xe
	ldrsb r0, [r2, r0]
	cmp r0, #0
	bne _08009E1E
	adds r0, r3, #0
	bl sub_80C541C
_08009E1E:
	pop {r0}
	bx r0
	.align 2, 0
_08009E24: .4byte gRAMChapterData

	THUMB_FUNC_END sub_8009E00

	THUMB_FUNC_START sub_8009E28
sub_8009E28: @ 0x08009E28
	push {lr}
	sub sp, #4
	movs r0, #3
	movs r1, #0
	movs r2, #0
	movs r3, #0x10
	bl SetSpecialColorEffectsParameters
	movs r0, #1
	str r0, [sp]
	movs r1, #1
	movs r2, #1
	movs r3, #1
	bl sub_8001ED0
	movs r0, #1
	bl sub_8001F48
	add sp, #4
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8009E28

	THUMB_FUNC_START sub_8009E54
sub_8009E54: @ 0x08009E54
	push {lr}
	movs r0, #0
	bl SetupBackgrounds
	ldr r0, _08009E6C  @ gRAMChapterData
	ldrb r0, [r0, #0x1b]
	cmp r0, #2
	beq _08009E70
	cmp r0, #3
	beq _08009E80
	b _08009E88
	.align 2, 0
_08009E6C: .4byte gRAMChapterData
_08009E70:
	ldr r0, _08009E7C  @ gUnknown_08A0035C
	movs r1, #1
	bl CallEvent
	b _08009E88
	.align 2, 0
_08009E7C: .4byte gUnknown_08A0035C
_08009E80:
	ldr r0, _08009E94  @ gUnknown_08A00364
	movs r1, #1
	bl CallEvent
_08009E88:
	movs r0, #0x84
	bl SetEventId
	pop {r0}
	bx r0
	.align 2, 0
_08009E94: .4byte gUnknown_08A00364

	THUMB_FUNC_END sub_8009E54

	THUMB_FUNC_START sub_8009E98
sub_8009E98: @ 0x08009E98
	push {lr}
	bl StartBattleMap
	bl sub_80141B0
	ldr r0, _08009EB0  @ gRAMChapterData
	ldrb r0, [r0, #0x1b]
	cmp r0, #2
	beq _08009EB4
	cmp r0, #3
	beq _08009EC4
	b _08009ECC
	.align 2, 0
_08009EB0: .4byte gRAMChapterData
_08009EB4:
	ldr r0, _08009EC0  @ gUnknown_08A0037C
	movs r1, #1
	bl CallEvent
	b _08009ECC
	.align 2, 0
_08009EC0: .4byte gUnknown_08A0037C
_08009EC4:
	ldr r0, _08009ED8  @ gUnknown_08A0048C
	movs r1, #1
	bl CallEvent
_08009ECC:
	movs r0, #0x84
	bl SetEventId
	pop {r0}
	bx r0
	.align 2, 0
_08009ED8: .4byte gUnknown_08A0048C

	THUMB_FUNC_END sub_8009E98

	THUMB_FUNC_START GetChapterIdTo6C
GetChapterIdTo6C: @ 0x08009EDC
	ldr r1, _08009EE8  @ gRAMChapterData
	ldrb r1, [r1, #0xe]
	adds r0, #0x30
	strb r1, [r0]
	bx lr
	.align 2, 0
_08009EE8: .4byte gRAMChapterData

	THUMB_FUNC_END GetChapterIdTo6C

	THUMB_FUNC_START SetChapterIdFrom6C
SetChapterIdFrom6C: @ 0x08009EEC
	ldr r1, _08009EF8  @ gRAMChapterData
	adds r0, #0x30
	ldrb r0, [r0]
	strb r0, [r1, #0xe]
	bx lr
	.align 2, 0
_08009EF8: .4byte gRAMChapterData

	THUMB_FUNC_END SetChapterIdFrom6C

	THUMB_FUNC_START sub_8009EFC
sub_8009EFC: @ 0x08009EFC
	push {lr}
	bl sub_80A4CD8
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8009EFC

	THUMB_FUNC_START NewGameControl
NewGameControl: @ 0x08009F08
	push {lr}
	ldr r0, _08009F34  @ SomeUpdateRoutine
	bl SetMainUpdateRoutine
	ldr r0, _08009F38  @ GeneralVBlankHandler
	bl SetInterrupt_LCDVBlank
	ldr r0, _08009F3C  @ gUnknown_085916D4
	movs r1, #3
	bl Proc_Start
	adds r2, r0, #0
	adds r2, #0x29
	movs r1, #0
	strb r1, [r2]
	adds r2, #1
	strb r1, [r2]
	adds r0, #0x2b
	strb r1, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_08009F34: .4byte SomeUpdateRoutine
_08009F38: .4byte GeneralVBlankHandler
_08009F3C: .4byte gUnknown_085916D4

	THUMB_FUNC_END NewGameControl

	THUMB_FUNC_START GetGameControl6C
GetGameControl6C: @ 0x08009F40
	push {lr}
	ldr r0, _08009F4C  @ gUnknown_085916D4
	bl Proc_Find
	pop {r1}
	bx r1
	.align 2, 0
_08009F4C: .4byte gUnknown_085916D4

	THUMB_FUNC_END GetGameControl6C

	THUMB_FUNC_START SetNextGameActionId
SetNextGameActionId: @ 0x08009F50
	push {r4, lr}
	adds r4, r0, #0
	bl GetGameControl6C
	adds r0, #0x29
	strb r4, [r0]
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END SetNextGameActionId

	THUMB_FUNC_START SetNextChapterId
SetNextChapterId: @ 0x08009F64
	push {r4, lr}
	adds r4, r0, #0
	bl GetGameControl6C
	adds r0, #0x2a
	strb r4, [r0]
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END SetNextChapterId

	THUMB_FUNC_START sub_8009F78
sub_8009F78: @ 0x08009F78
	push {lr}
	bl GetGameControl6C
	adds r0, #0x2a
	ldrb r1, [r0]
	negs r0, r1
	orrs r0, r1
	lsrs r0, r0, #0x1f
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8009F78

	THUMB_FUNC_START RestartGameAndGoto8
RestartGameAndGoto8: @ 0x08009F8C
	push {r4, lr}
	ldr r4, _08009FAC  @ gUnknown_085916D4
	adds r0, r4, #0
	bl Proc_EndEach
	adds r0, r4, #0
	movs r1, #3
	bl Proc_Start
	movs r1, #8
	bl Proc_Goto
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08009FAC: .4byte gUnknown_085916D4

	THUMB_FUNC_END RestartGameAndGoto8

	THUMB_FUNC_START RestartGameAndGoto12
RestartGameAndGoto12: @ 0x08009FB0
	push {r4, lr}
	ldr r4, _08009FD0  @ gUnknown_085916D4
	adds r0, r4, #0
	bl Proc_EndEach
	adds r0, r4, #0
	movs r1, #3
	bl Proc_Start
	movs r1, #0x12
	bl Proc_Goto
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08009FD0: .4byte gUnknown_085916D4

	THUMB_FUNC_END RestartGameAndGoto12

	THUMB_FUNC_START sub_8009FD4
sub_8009FD4: @ 0x08009FD4
	bx lr

	THUMB_FUNC_END sub_8009FD4

	THUMB_FUNC_START nullsub_9
nullsub_9: @ 0x08009FD8
	bx lr

	THUMB_FUNC_END nullsub_9

	THUMB_FUNC_START ForceEnableSoundEffects
ForceEnableSoundEffects: @ 0x08009FDC
	ldr r2, _08009FF4  @ gRAMChapterData
	adds r2, #0x41
	ldrb r1, [r2]
	movs r0, #2
	negs r0, r0
	ands r0, r1
	movs r1, #3
	negs r1, r1
	ands r0, r1
	strb r0, [r2]
	bx lr
	.align 2, 0
_08009FF4: .4byte gRAMChapterData

	THUMB_FUNC_END ForceEnableSoundEffects

	THUMB_FUNC_START sub_8009FF8
sub_8009FF8: @ 0x08009FF8
	push {r4, r5, lr}
	ldr r3, _0800A044  @ gRAMChapterData
	adds r2, r3, #0
	adds r2, #0x42
	ldrb r1, [r2]
	movs r0, #7
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	adds r5, r3, #0
	adds r5, #0x40
	ldrb r0, [r5]
	movs r2, #0x61
	negs r2, r2
	ands r2, r0
	movs r0, #0x20
	orrs r2, r0
	movs r0, #0x7f
	ands r2, r0
	adds r4, r3, #0
	adds r4, #0x41
	ldrb r1, [r4]
	movs r3, #2
	negs r3, r3
	adds r0, r3, #0
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	movs r1, #0xd
	negs r1, r1
	ands r0, r1
	strb r0, [r4]
	ands r2, r3
	strb r2, [r5]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0800A044: .4byte gRAMChapterData
	THUMB_FUNC_END sub_8009FF8
