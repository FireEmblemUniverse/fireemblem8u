	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	THUMB_FUNC_START NewEfxDeadEvent
NewEfxDeadEvent: @ 0x08052DD4
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _08052DF4  @ gProc_efxDeadEvent
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	str r5, [r0, #0x60]
	ldr r1, _08052DF8  @ gUnknown_02017738
	movs r0, #1
	str r0, [r1]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08052DF4: .4byte gProc_efxDeadEvent
_08052DF8: .4byte gUnknown_02017738

	THUMB_FUNC_END NewEfxDeadEvent

	THUMB_FUNC_START sub_8052DFC
sub_8052DFC: @ 0x08052DFC
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x5c]
	bl GetCoreAIStruct
	adds r7, r0, #0
	movs r6, #0
	ldr r0, _08052E68  @ gUnknown_0201774C
	ldr r0, [r0]
	cmp r0, #0
	bne _08052E2E
	ldr r0, _08052E6C  @ gUnknown_0201772C
	ldr r0, [r0]
	cmp r0, #0
	bne _08052E2E
	ldr r4, _08052E70  @ gUnknown_0201FB04
	adds r0, r7, #0
	bl GetAISSubjectId
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r0, [r0]
	cmp r0, #1
	bne _08052E2E
	movs r6, #1
_08052E2E:
	cmp r6, #1
	bne _08052E62
	movs r0, #7
	strh r0, [r5, #0x2c]
	ldr r0, _08052E74  @ gEkrSomeType
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _08052E5C
	ldr r0, [r5, #0x5c]
	bl GetAISSubjectId
	ldr r1, _08052E78  @ gEkrPos2Maybe
	ldr r1, [r1]
	cmp r0, r1
	beq _08052E5C
	movs r1, #1
	negs r1, r1
	adds r0, r7, #0
	bl sub_80533D0
	movs r0, #0
	strh r0, [r5, #0x2c]
_08052E5C:
	adds r0, r5, #0
	bl Proc_Break
_08052E62:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08052E68: .4byte gUnknown_0201774C
_08052E6C: .4byte gUnknown_0201772C
_08052E70: .4byte gUnknown_0201FB04
_08052E74: .4byte gEkrSomeType
_08052E78: .4byte gEkrPos2Maybe

	THUMB_FUNC_END sub_8052DFC

	THUMB_FUNC_START sub_8052E7C
sub_8052E7C: @ 0x08052E7C
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #8
	bne _08052EA6
	movs r0, #1
	movs r1, #7
	bl NewEkrWindowAppear
	movs r0, #1
	movs r1, #7
	movs r2, #0
	bl NewEkrNamewinAppear
	adds r0, r4, #0
	bl Proc_Break
_08052EA6:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8052E7C

	THUMB_FUNC_START sub_8052EAC
sub_8052EAC: @ 0x08052EAC
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	bl DoesEkrWindowAppearExist
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _08052F0A
	bl EkrGauge_Set2A
	bl sub_8051B90
	movs r0, #0
	str r0, [sp]
	ldr r1, _08052F14  @ gBG0TilemapBuffer
	ldr r2, _08052F18  @ 0x01000200
	mov r0, sp
	bl CpuFastSet
	ldr r0, _08052F1C  @ gBanimBgPosMaybe
	ldrh r1, [r0]
	ldrh r2, [r0, #2]
	movs r0, #0
	bl BG_SetPosition
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	movs r0, #1
	bl BG_EnableSyncByMask
	bl EkrGauge_Set4C50
	ldr r4, _08052F20  @ gEkrPids
	ldr r0, [r5, #0x5c]
	bl GetAISSubjectId
	adds r0, r0, r4
	ldrb r0, [r0]
	bl sub_80835DC
	adds r0, r5, #0
	bl Proc_Break
_08052F0A:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08052F14: .4byte gBG0TilemapBuffer
_08052F18: .4byte 0x01000200
_08052F1C: .4byte gBanimBgPosMaybe
_08052F20: .4byte gEkrPids

	THUMB_FUNC_END sub_8052EAC

	THUMB_FUNC_START sub_8052F24
sub_8052F24: @ 0x08052F24
	push {r4, r5, lr}
	adds r4, r0, #0
	bl BattleEventEngineExists
	adds r5, r0, #0
	cmp r5, #0
	bne _08052F7A
	bl PlaySound8FForArenaMaybe
	ldr r0, [r4, #0x5c]
	ldr r1, [r4, #0x60]
	bl NewEfxDead
	bl EfxPrepareScreenFx
	ldr r0, [r4, #0x5c]
	bl GetAISSubjectId
	ldr r1, _08052F80  @ gBanimSideVaildFlagMaybe
	lsls r0, r0, #1
	adds r0, r0, r1
	strh r5, [r0]
	movs r0, #1
	bl BG_EnableSyncByMask
	movs r0, #0
	movs r1, #7
	bl NewEkrWindowAppear
	movs r0, #0
	movs r1, #7
	movs r2, #0
	bl NewEkrNamewinAppear
	bl EkrGauge_Clr2A
	bl sub_8051BA0
	bl EkrGauge_Clr4C50
	adds r0, r4, #0
	bl Proc_Break
_08052F7A:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08052F80: .4byte gBanimSideVaildFlagMaybe

	THUMB_FUNC_END sub_8052F24

	THUMB_FUNC_START sub_8052F84
sub_8052F84: @ 0x08052F84
	push {r4, lr}
	adds r4, r0, #0
	bl DoesEkrWindowAppearExist
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _08052FA0
	ldr r1, _08052FA8  @ gUnknown_02017738
	movs r0, #0
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
_08052FA0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08052FA8: .4byte gUnknown_02017738

	THUMB_FUNC_END sub_8052F84

	THUMB_FUNC_START NewEfxDead
NewEfxDead: @ 0x08052FAC
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, _08052FE0  @ gEkrHPBarCount
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r1, _08052FE4  @ gUnknown_02017734
	movs r0, #1
	str r0, [r1]
	ldr r0, _08052FE8  @ gProc_efxDead
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	str r5, [r0, #0x60]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r1, [r0, #0x2e]
	adds r0, r4, #0
	bl sub_8054B64
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08052FE0: .4byte gEkrHPBarCount
_08052FE4: .4byte gUnknown_02017734
_08052FE8: .4byte gProc_efxDead

	THUMB_FUNC_END NewEfxDead

	THUMB_FUNC_START sub_8052FEC
sub_8052FEC: @ 0x08052FEC
	push {r4, r5, lr}
	adds r5, r0, #0
	bl sub_806FAB0
	cmp r0, #1
	bne _08053030
	ldr r0, [r5, #0x5c]
	bl GetAISSubjectId
	cmp r0, #0
	bne _08053030
	ldr r0, [r5, #0x5c]
	bl GetAISSubjectId
	adds r4, r0, #0
	ldr r0, [r5, #0x5c]
	bl GetAISSubjectId
	adds r1, r0, #0
	ldr r0, _0805302C  @ gUnknown_0203E152
	lsls r4, r4, #1
	adds r4, r4, r0
	movs r2, #0
	ldrsh r0, [r4, r2]
	lsls r0, r0, #1
	adds r0, r0, r1
	bl sub_8058A60
	lsls r0, r0, #0x10
	asrs r4, r0, #0x10
	b _08053032
	.align 2, 0
_0805302C: .4byte gUnknown_0203E152
_08053030:
	movs r4, #1
_08053032:
	ldr r0, _08053054  @ gUnknown_0201774C
	ldr r0, [r0]
	cmp r0, #0
	bne _0805307A
	ldr r0, _08053058  @ gUnknown_0201772C
	ldr r0, [r0]
	cmp r0, #0
	bne _0805307A
	bl sub_806FAB0
	cmp r0, #2
	bne _0805305C
	ldr r0, [r5, #0x5c]
	bl sub_80701F4
	b _08053070
	.align 2, 0
_08053054: .4byte gUnknown_0201774C
_08053058: .4byte gUnknown_0201772C
_0805305C:
	cmp r4, #0
	bne _08053068
	ldr r0, [r5, #0x5c]
	bl sub_8070204
	b _08053070
_08053068:
	ldr r0, [r5, #0x5c]
	ldr r1, [r5, #0x60]
	bl sub_8053120
_08053070:
	movs r0, #0x32
	strh r0, [r5, #0x2e]
	adds r0, r5, #0
	bl Proc_Break
_0805307A:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8052FEC

	THUMB_FUNC_START sub_8053080
sub_8053080: @ 0x08053080
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r5, [r4, #0x5c]
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	cmp r1, #0x1e
	bne _080530F6
	adds r0, r5, #0
	bl sub_8070214
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq _08053112
	ldr r0, [r4, #0x5c]
	bl sub_8070234
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080530D2
	ldr r0, [r4, #0x5c]
	ldr r1, [r4, #0x60]
	bl sub_805328C
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #0xd6
	bl SomePlaySound_8071990
	movs r0, #2
	ldrsh r1, [r5, r0]
	movs r0, #0xd6
	movs r2, #1
	bl sub_8071AB0
	movs r0, #0x64
	strh r0, [r4, #0x2e]
	b _08053112
_080530D2:
	ldr r0, [r4, #0x5c]
	ldr r1, [r4, #0x60]
	bl sub_80531A4
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #0xd6
	bl SomePlaySound_8071990
	movs r2, #2
	ldrsh r1, [r5, r2]
	movs r0, #0xd6
	movs r2, #1
	bl sub_8071AB0
	movs r0, #0x32
	strh r0, [r4, #0x2e]
	b _08053112
_080530F6:
	movs r2, #0x2e
	ldrsh r0, [r4, r2]
	cmp r1, r0
	bne _08053112
	ldr r1, _08053118  @ gEkrHPBarCount
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	ldr r1, _0805311C  @ gUnknown_02017734
	movs r0, #0
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
_08053112:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08053118: .4byte gEkrHPBarCount
_0805311C: .4byte gUnknown_02017734

	THUMB_FUNC_END sub_8053080

	THUMB_FUNC_START sub_8053120
sub_8053120: @ 0x08053120
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _08053140  @ gProc_efxDeadPika
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	str r5, [r0, #0x60]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r1, [r0, #0x2e]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08053140: .4byte gProc_efxDeadPika

	THUMB_FUNC_END sub_8053120

	THUMB_FUNC_START sub_8053144
sub_8053144: @ 0x08053144
	push {r4, r5, lr}
	adds r3, r0, #0
	ldr r4, [r3, #0x5c]
	ldr r5, [r3, #0x60]
	ldrh r0, [r3, #0x2c]
	adds r0, #1
	strh r0, [r3, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #6
	ble _0805317C
	ldrh r2, [r4]
	ldr r1, _08053178  @ 0x0000FFFD
	adds r0, r1, #0
	ands r0, r2
	strh r0, [r4]
	ldrh r0, [r5]
	ands r1, r0
	strh r1, [r5]
	movs r0, #0
	strh r0, [r3, #0x2c]
	ldrh r0, [r3, #0x2e]
	adds r0, #1
	strh r0, [r3, #0x2e]
	b _0805318A
	.align 2, 0
_08053178: .4byte 0x0000FFFD
_0805317C:
	ldrh r0, [r4]
	movs r1, #2
	orrs r0, r1
	strh r0, [r4]
	ldrh r0, [r5]
	orrs r0, r1
	strh r0, [r5]
_0805318A:
	movs r1, #0x2e
	ldrsh r0, [r3, r1]
	cmp r0, #5
	ble _0805319E
	movs r0, #0
	strh r0, [r3, #0x2c]
	strh r0, [r3, #0x2e]
	adds r0, r3, #0
	bl Proc_Break
_0805319E:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8053144

	THUMB_FUNC_START sub_80531A4
sub_80531A4: @ 0x080531A4
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	adds r6, r1, #0
	ldr r0, _08053204  @ gProc_efxDeadAlpha
	movs r1, #3
	bl Proc_Start
	str r5, [r0, #0x5c]
	str r6, [r0, #0x60]
	movs r4, #0
	strh r4, [r0, #0x2c]
	strh r4, [r0, #0x2e]
	movs r0, #0xa
	strh r0, [r5, #0xa]
	strh r0, [r6, #0xa]
	bl AnimSort
	movs r0, #0
	movs r1, #0x10
	movs r2, #0x10
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	str r4, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl SetBlendTargetA
	str r4, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #1
	movs r3, #1
	bl SetBlendTargetB
	ldr r1, _08053208  @ gLCDControlBuffer
	adds r1, #0x3d
	ldrb r0, [r1]
	movs r2, #0x20
	orrs r0, r2
	strb r0, [r1]
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08053204: .4byte gProc_efxDeadAlpha
_08053208: .4byte gLCDControlBuffer

	THUMB_FUNC_END sub_80531A4

	THUMB_FUNC_START sub_805320C
sub_805320C: @ 0x0805320C
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r2, [r4, #0x5c]
	ldr r3, [r4, #0x60]
	ldr r0, [r2, #0x1c]
	movs r1, #0x80
	lsls r1, r1, #3
	orrs r0, r1
	str r0, [r2, #0x1c]
	ldr r0, [r3, #0x1c]
	orrs r0, r1
	str r0, [r3, #0x1c]
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x3c
	ble _08053260
	ldrh r0, [r2]
	movs r1, #2
	orrs r0, r1
	strh r0, [r2]
	ldrh r0, [r3]
	orrs r0, r1
	strh r0, [r3]
	ldr r0, [r2, #0x1c]
	ldr r1, _0805325C  @ 0xFFFFFBFF
	ands r0, r1
	str r0, [r2, #0x1c]
	ldr r0, [r3, #0x1c]
	ands r0, r1
	str r0, [r3, #0x1c]
	bl SetDefaultColorEffects
	adds r0, r4, #0
	bl Proc_Break
	b _08053282
	.align 2, 0
_0805325C: .4byte 0xFFFFFBFF
_08053260:
	movs r0, #0x2c
	ldrsh r3, [r4, r0]
	movs r0, #0x3c
	str r0, [sp]
	movs r0, #0
	movs r1, #0x10
	movs r2, #0
	bl Interpolate
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	movs r0, #0
	movs r2, #0x10
	movs r3, #0
	bl SetSpecialColorEffectsParameters
_08053282:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_805320C

	THUMB_FUNC_START sub_805328C
sub_805328C: @ 0x0805328C
	push {r4, r5, r6, lr}
	mov r6, r9
	mov r5, r8
	push {r5, r6}
	sub sp, #4
	adds r5, r0, #0
	adds r6, r1, #0
	ldr r0, _08053360  @ gProc_efxDeadDragonAlpha
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	str r6, [r4, #0x60]
	ldrh r0, [r5]
	movs r1, #2
	movs r2, #0
	mov r9, r2
	movs r2, #0
	mov r8, r2
	orrs r0, r1
	strh r0, [r5]
	ldrh r0, [r6]
	orrs r0, r1
	strh r0, [r6]
	movs r0, #0
	movs r1, #0
	movs r2, #1
	bl sub_806FC8C
	mov r0, r8
	strh r0, [r4, #0x2c]
	strh r0, [r4, #0x2e]
	movs r0, #1
	movs r1, #0x10
	movs r2, #0x10
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	mov r1, r8
	str r1, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #1
	bl SetBlendTargetA
	mov r2, r8
	str r2, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #1
	movs r3, #0
	bl SetBlendTargetB
	ldr r4, _08053364  @ gLCDControlBuffer
	ldrb r0, [r4, #1]
	movs r2, #0x20
	orrs r0, r2
	movs r1, #0x41
	negs r1, r1
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r4, #1]
	adds r0, r4, #0
	adds r0, #0x2d
	mov r1, r9
	strb r1, [r0]
	adds r0, #4
	strb r1, [r0]
	adds r1, r4, #0
	adds r1, #0x2c
	movs r0, #0xf0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0xa0
	strb r0, [r1]
	adds r3, r4, #0
	adds r3, #0x34
	ldrb r0, [r3]
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
	orrs r0, r2
	strb r0, [r3]
	adds r1, r4, #0
	adds r1, #0x3d
	ldrb r0, [r1]
	orrs r0, r2
	strb r0, [r1]
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08053360: .4byte gProc_efxDeadDragonAlpha
_08053364: .4byte gLCDControlBuffer

	THUMB_FUNC_END sub_805328C

	THUMB_FUNC_START sub_8053368
sub_8053368: @ 0x08053368
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x3c
	ble _080533A4
	movs r0, #0
	bl sub_80559D0
	ldr r0, _080533A0  @ gBG3TilemapBuffer
	movs r1, #0xf0
	lsls r1, r1, #8
	bl BG_Fill
	movs r0, #8
	bl BG_EnableSyncByMask
	bl SetDefaultColorEffects
	adds r0, r4, #0
	bl Proc_Break
	b _080533C6
	.align 2, 0
_080533A0: .4byte gBG3TilemapBuffer
_080533A4:
	movs r0, #0x2c
	ldrsh r3, [r4, r0]
	movs r0, #0x3c
	str r0, [sp]
	movs r0, #0
	movs r1, #0x10
	movs r2, #0
	bl Interpolate
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	movs r0, #1
	movs r2, #0x10
	movs r3, #0
	bl SetSpecialColorEffectsParameters
_080533C6:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8053368

	THUMB_FUNC_START sub_80533D0
sub_80533D0: @ 0x080533D0
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	lsls r1, r1, #0x10
	lsrs r6, r1, #0x10
	ldr r0, _080533EC  @ gEkrSomeType
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #4
	bhi _0805349E
	lsls r0, r0, #2
	ldr r1, _080533F0  @ _080533F4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080533EC: .4byte gEkrSomeType
_080533F0: .4byte _080533F4
_080533F4: @ jump table
	.4byte _0805349E @ case 0
	.4byte _08053408 @ case 1
	.4byte _08053408 @ case 2
	.4byte _0805349E @ case 3
	.4byte _0805349E @ case 4
_08053408:
	ldr r0, _0805343C  @ gProc_efxFarAttack
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	adds r0, r5, #0
	bl GetAISSubjectId
	adds r2, r4, #0
	adds r2, #0x29
	movs r1, #0
	strb r0, [r2]
	strh r1, [r4, #0x2c]
	lsls r1, r6, #0x10
	asrs r2, r1, #0x10
	movs r0, #1
	negs r0, r0
	cmp r2, r0
	beq _08053444
	asrs r0, r1, #0x11
	strh r0, [r4, #0x2e]
	subs r0, r2, r0
	strh r0, [r4, #0x30]
	ldr r2, _08053440  @ gEkrSomeType
	b _0805345E
	.align 2, 0
_0805343C: .4byte gProc_efxFarAttack
_08053440: .4byte gEkrSomeType
_08053444:
	ldr r0, _08053454  @ gEkrSomeType
	movs r2, #0
	ldrsh r1, [r0, r2]
	adds r2, r0, #0
	cmp r1, #1
	bne _08053458
	movs r0, #5
	b _0805345A
	.align 2, 0
_08053454: .4byte gEkrSomeType
_08053458:
	movs r0, #7
_0805345A:
	strh r0, [r4, #0x2e]
	strh r0, [r4, #0x30]
_0805345E:
	movs r1, #0
	ldrsh r0, [r2, r1]
	movs r1, #0xf0
	cmp r0, #1
	bne _0805346A
	movs r1, #0x20
_0805346A:
	adds r0, r4, #0
	adds r0, #0x29
	ldrb r2, [r0]
	cmp r2, #0
	bne _08053482
	negs r0, r1
	strh r0, [r4, #0x32]
	lsrs r0, r0, #1
	strh r0, [r4, #0x34]
	strh r0, [r4, #0x36]
	strh r2, [r4, #0x38]
	b _08053490
_08053482:
	movs r0, #0
	strh r0, [r4, #0x32]
	negs r1, r1
	lsrs r0, r1, #1
	strh r0, [r4, #0x34]
	strh r0, [r4, #0x36]
	strh r1, [r4, #0x38]
_08053490:
	ldr r1, _080534A4  @ gUnknown_0201FB0C
	movs r2, #0x32
	ldrsh r0, [r4, r2]
	str r0, [r1]
	ldr r1, _080534A8  @ gUnknown_02017748
	movs r0, #1
	str r0, [r1]
_0805349E:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080534A4: .4byte gUnknown_0201FB0C
_080534A8: .4byte gUnknown_02017748

	THUMB_FUNC_END sub_80533D0

	THUMB_FUNC_START sub_80534AC
sub_80534AC: @ 0x080534AC
	push {r4, lr}
	ldr r3, _080534DC  @ gUnknown_02000000
	ldr r4, [r3]
	negs r1, r1
	ldr r2, _080534E0  @ gUnknown_02000028
	ldrh r0, [r2]
	adds r0, r0, r1
	strh r0, [r4, #2]
	ldr r4, [r3, #4]
	ldrh r0, [r2]
	adds r0, r0, r1
	strh r0, [r4, #2]
	ldr r4, [r3, #8]
	ldrh r0, [r2, #2]
	adds r0, r0, r1
	strh r0, [r4, #2]
	ldr r4, [r3, #0xc]
	ldrh r0, [r2, #2]
	adds r0, r0, r1
	strh r0, [r4, #2]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080534DC: .4byte gUnknown_02000000
_080534E0: .4byte gUnknown_02000028

	THUMB_FUNC_END sub_80534AC

	THUMB_FUNC_START sub_80534E4
sub_80534E4: @ 0x080534E4
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x32
	ldrsh r1, [r4, r0]
	adds r0, r4, #0
	bl sub_80534AC
	movs r1, #0x32
	ldrsh r0, [r4, r1]
	movs r1, #0
	bl sub_806FB2C
	movs r1, #0x32
	ldrsh r0, [r4, r1]
	bl sub_8053618
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80534E4

	THUMB_FUNC_START sub_8053514
sub_8053514: @ 0x08053514
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
	adds r1, r0, #0
	ldr r5, _08053580  @ gUnknown_0201FB0C
	str r1, [r5]
	adds r0, r4, #0
	bl sub_80534AC
	ldr r0, [r5]
	movs r1, #0
	bl sub_806FB2C
	ldr r0, [r5]
	bl sub_8053618
	bl GetBattleAnimArenaFlag
	cmp r0, #0
	beq _0805355A
	ldr r0, [r5]
	bl sub_805B034
_0805355A:
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x2e
	ldrsh r1, [r4, r2]
	cmp r0, r1
	ble _08053576
	movs r0, #1
	strh r0, [r4, #0x2c]
	adds r0, r4, #0
	bl Proc_Break
_08053576:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08053580: .4byte gUnknown_0201FB0C

	THUMB_FUNC_END sub_8053514

	THUMB_FUNC_START sub_8053584
sub_8053584: @ 0x08053584
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	movs r0, #0x36
	ldrsh r1, [r4, r0]
	movs r5, #0x38
	ldrsh r2, [r4, r5]
	movs r0, #0x2c
	ldrsh r3, [r4, r0]
	movs r5, #0x30
	ldrsh r0, [r4, r5]
	str r0, [sp]
	movs r0, #4
	bl Interpolate
	adds r1, r0, #0
	ldr r5, _080535EC  @ gUnknown_0201FB0C
	str r1, [r5]
	adds r0, r4, #0
	bl sub_80534AC
	ldr r0, [r5]
	movs r1, #0
	bl sub_806FB2C
	ldr r0, [r5]
	bl sub_8053618
	bl GetBattleAnimArenaFlag
	cmp r0, #0
	beq _080535CA
	ldr r0, [r5]
	bl sub_805B034
_080535CA:
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x30
	ldrsh r1, [r4, r2]
	cmp r0, r1
	ble _08053606
	adds r0, r4, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #0
	bne _080535F4
	ldr r1, _080535F0  @ gEkrPos2Maybe
	movs r0, #1
	b _080535F8
	.align 2, 0
_080535EC: .4byte gUnknown_0201FB0C
_080535F0: .4byte gEkrPos2Maybe
_080535F4:
	ldr r1, _08053610  @ gEkrPos2Maybe
	movs r0, #0
_080535F8:
	str r0, [r1]
	ldr r1, _08053614  @ gUnknown_02017748
	movs r0, #0
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
_08053606:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08053610: .4byte gEkrPos2Maybe
_08053614: .4byte gUnknown_02017748

	THUMB_FUNC_END sub_8053584

	THUMB_FUNC_START sub_8053618
sub_8053618: @ 0x08053618
	push {r4, r5, lr}
	sub sp, #0x10
	adds r5, r0, #0
	bl sub_806FAB0
	cmp r0, #2
	beq _08053668
	bl GetBattleAnimArenaFlag
	cmp r0, #0
	bne _08053668
	asrs r4, r5, #3
	movs r1, #7
	ands r1, r5
	movs r0, #2
	movs r2, #0
	bl BG_SetPosition
	lsls r4, r4, #1
	ldr r0, _08053670  @ gUnknown_0201C912
	adds r4, r4, r0
	movs r0, #0x84
	lsls r0, r0, #1
	adds r4, r4, r0
	ldr r2, _08053674  @ gBG2TilemapBuffer
	movs r0, #0x20
	str r0, [sp]
	movs r0, #0x14
	str r0, [sp, #4]
	subs r0, #0x15
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	adds r0, r4, #0
	movs r1, #0x42
	movs r3, #0x20
	bl sub_8070EF4
	movs r0, #4
	bl BG_EnableSyncByMask
_08053668:
	add sp, #0x10
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08053670: .4byte gUnknown_0201C912
_08053674: .4byte gBG2TilemapBuffer

	THUMB_FUNC_END sub_8053618

	THUMB_FUNC_START sub_8053678
sub_8053678: @ 0x08053678
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _080536B0  @ gProc_efxQuakePure
	movs r1, #3
	bl Proc_Start
	ldr r2, _080536B4  @ gUnknown_085B9804
	lsls r1, r4, #3
	adds r1, r1, r2
	ldr r1, [r1]
	str r1, [r0, #0x44]
	lsls r4, r4, #1
	adds r4, #1
	lsls r4, r4, #2
	adds r4, r4, r2
	ldr r1, [r4]
	adds r3, r0, #0
	adds r3, #0x29
	movs r2, #0
	strb r1, [r3]
	adds r1, r0, #0
	adds r1, #0x2a
	strb r5, [r1]
	strh r2, [r0, #0x2c]
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080536B0: .4byte gProc_efxQuakePure
_080536B4: .4byte gUnknown_085B9804

	THUMB_FUNC_END sub_8053678

	THUMB_FUNC_START sub_80536B8
sub_80536B8: @ 0x080536B8
	push {r4, lr}
	adds r4, r0, #0
	ldr r3, [r4, #0x44]
	movs r1, #0x2c
	ldrsh r0, [r4, r1]
	lsls r0, r0, #2
	adds r2, r0, r3
	movs r0, #0
	ldrsh r1, [r2, r0]
	ldr r0, _080536E4  @ 0x00007FFF
	cmp r1, r0
	beq _080536E8
	adds r0, r1, #0
	movs r3, #2
	ldrsh r1, [r2, r3]
	bl sub_8052214
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	b _08053710
	.align 2, 0
_080536E4: .4byte 0x00007FFF
_080536E8:
	adds r0, r4, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	cmp r0, #0
	beq _080536F8
	cmp r0, #1
	beq _08053708
	b _08053710
_080536F8:
	strh r0, [r4, #0x2c]
	movs r1, #0
	ldrsh r0, [r3, r1]
	movs r2, #2
	ldrsh r1, [r3, r2]
	bl sub_8052214
	b _08053710
_08053708:
	movs r0, #0
	movs r1, #0
	bl sub_8052214
_08053710:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80536B8

	THUMB_FUNC_START sub_8053718
sub_8053718: @ 0x08053718
	push {lr}
	ldr r0, _08053728  @ gProc_efxHitQuakePure
	movs r1, #3
	bl Proc_Start
	pop {r1}
	bx r1
	.align 2, 0
_08053728: .4byte gProc_efxHitQuakePure

	THUMB_FUNC_END sub_8053718

	THUMB_FUNC_START nullsub_56
nullsub_56: @ 0x0805372C
	bx lr

	THUMB_FUNC_END nullsub_56

	THUMB_FUNC_START sub_8053730
sub_8053730: @ 0x08053730
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08053740  @ gUnknown_02017748
	ldr r0, [r0]
	cmp r0, #1
	bne _08053744
	movs r0, #0
	b _08053820
	.align 2, 0
_08053740: .4byte gUnknown_02017748
_08053744:
	ldr r1, _08053770  @ gUnknown_0201773C
	movs r0, #1
	str r0, [r1]
	ldr r0, _08053774  @ gProc_efxQuake
	movs r1, #3
	bl Proc_Start
	adds r2, r0, #0
	movs r0, #0
	strh r0, [r2, #0x2c]
	ldr r1, _08053778  @ gUnknown_02000000
	ldr r0, [r1]
	str r0, [r2, #0x5c]
	ldr r0, [r1, #8]
	str r0, [r2, #0x60]
	cmp r4, #6
	bhi _0805380C
	lsls r0, r4, #2
	ldr r1, _0805377C  @ _08053780
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08053770: .4byte gUnknown_0201773C
_08053774: .4byte gProc_efxQuake
_08053778: .4byte gUnknown_02000000
_0805377C: .4byte _08053780
_08053780: @ jump table
	.4byte _0805379C @ case 0
	.4byte _080537AC @ case 1
	.4byte _080537BC @ case 2
	.4byte _080537CC @ case 3
	.4byte _080537DC @ case 4
	.4byte _080537EC @ case 5
	.4byte _080537FC @ case 6
_0805379C:
	ldr r0, _080537A8  @ gUnknown_080DA4BA
	str r0, [r2, #0x44]
	adds r1, r2, #0
	adds r1, #0x29
	movs r0, #0
	b _08053816
	.align 2, 0
_080537A8: .4byte gUnknown_080DA4BA
_080537AC:
	ldr r0, _080537B8  @ gUnknown_080DA4DC
	str r0, [r2, #0x44]
	adds r1, r2, #0
	adds r1, #0x29
	movs r0, #0
	b _08053816
	.align 2, 0
_080537B8: .4byte gUnknown_080DA4DC
_080537BC:
	ldr r0, _080537C8  @ gUnknown_080DA526
	str r0, [r2, #0x44]
	adds r1, r2, #0
	adds r1, #0x29
	movs r0, #0
	b _08053816
	.align 2, 0
_080537C8: .4byte gUnknown_080DA526
_080537CC:
	ldr r0, _080537D8  @ gUnknown_080DA570
	str r0, [r2, #0x44]
	adds r1, r2, #0
	adds r1, #0x29
	movs r0, #0
	b _08053816
	.align 2, 0
_080537D8: .4byte gUnknown_080DA570
_080537DC:
	ldr r0, _080537E8  @ gUnknown_080DA5BA
	str r0, [r2, #0x44]
	adds r1, r2, #0
	adds r1, #0x29
	movs r0, #0
	b _08053816
	.align 2, 0
_080537E8: .4byte gUnknown_080DA5BA
_080537EC:
	ldr r0, _080537F8  @ gUnknown_080DA604
	str r0, [r2, #0x44]
	adds r1, r2, #0
	adds r1, #0x29
	movs r0, #1
	b _08053816
	.align 2, 0
_080537F8: .4byte gUnknown_080DA604
_080537FC:
	ldr r0, _08053808  @ gUnknown_080DA66E
	str r0, [r2, #0x44]
	adds r1, r2, #0
	adds r1, #0x29
	movs r0, #1
	b _08053816
	.align 2, 0
_08053808: .4byte gUnknown_080DA66E
_0805380C:
	ldr r0, _08053828  @ gUnknown_080DA4BA
	str r0, [r2, #0x44]
	adds r1, r2, #0
	adds r1, #0x29
	movs r0, #0
_08053816:
	strb r0, [r1]
	movs r0, #0
	strh r0, [r2, #0x34]
	strh r0, [r2, #0x3c]
	adds r0, r2, #0
_08053820:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08053828: .4byte gUnknown_080DA4BA

	THUMB_FUNC_END sub_8053730

	THUMB_FUNC_START sub_805382C
sub_805382C: @ 0x0805382C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r7, r0, #0
	ldr r1, [r7, #0x44]
	movs r2, #0x2c
	ldrsh r0, [r7, r2]
	lsls r0, r0, #2
	adds r2, r0, r1
	movs r3, #0
	ldrsh r1, [r2, r3]
	ldr r0, _080538AC  @ 0x00007FFF
	cmp r1, r0
	bne _080538C0
	ldr r3, _080538B0  @ gUnknown_02000028
	movs r4, #0
	ldrsh r2, [r3, r4]
	ldr r0, _080538B4  @ gUnknown_0201FB0C
	ldr r1, [r0]
	subs r6, r2, r1
	ldr r2, _080538B8  @ gUnknown_0200002C
	movs r4, #2
	ldrsh r0, [r3, r4]
	subs r4, r0, r1
	movs r0, #2
	ldrsh r5, [r2, r0]
	lsls r1, r6, #0x10
	asrs r1, r1, #0x10
	movs r3, #0
	ldrsh r2, [r2, r3]
	movs r0, #0
	bl sub_80559F0
	lsls r1, r4, #0x10
	asrs r1, r1, #0x10
	adds r2, r5, #0
	movs r0, #1
	bl sub_80559F0
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	bl sub_806FAB0
	cmp r0, #0
	beq _0805389E
	ldrh r1, [r7, #0x34]
	ldrh r2, [r7, #0x3c]
	movs r0, #3
	bl BG_SetPosition
	movs r0, #0
	movs r1, #0
	bl sub_8052214
_0805389E:
	ldr r1, _080538BC  @ gUnknown_0201773C
	movs r0, #0
	str r0, [r1]
	adds r0, r7, #0
	bl Proc_End
	b _080539D2
	.align 2, 0
_080538AC: .4byte 0x00007FFF
_080538B0: .4byte gUnknown_02000028
_080538B4: .4byte gUnknown_0201FB0C
_080538B8: .4byte gUnknown_0200002C
_080538BC: .4byte gUnknown_0201773C
_080538C0:
	movs r4, #0
	ldrsh r0, [r2, r4]
	movs r3, #2
	ldrsh r1, [r2, r3]
	bl sub_8052214
	ldrh r0, [r7, #0x2c]
	adds r0, #1
	strh r0, [r7, #0x2c]
	ldr r5, _08053918  @ gUnknown_02017760
	ldrh r1, [r5]
	ldrh r2, [r5, #2]
	movs r0, #2
	bl BG_SetPosition
	bl sub_806FAB0
	cmp r0, #0
	beq _08053900
	ldrh r1, [r5]
	ldrh r4, [r7, #0x34]
	adds r1, r1, r4
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldrh r2, [r5, #2]
	ldrh r0, [r7, #0x3c]
	adds r2, r2, r0
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #3
	bl BG_SetPosition
_08053900:
	bl sub_806FAB0
	cmp r0, #0
	beq _08053920
	ldr r4, _0805391C  @ gUnknown_02000028
	movs r2, #0
	ldrsh r1, [r4, r2]
	movs r3, #0
	ldrsh r0, [r5, r3]
	subs r1, r1, r0
	b _0805392C
	.align 2, 0
_08053918: .4byte gUnknown_02017760
_0805391C: .4byte gUnknown_02000028
_08053920:
	ldr r4, _0805398C  @ gUnknown_02000028
	movs r2, #0
	ldrsh r1, [r4, r2]
	movs r3, #0
	ldrsh r0, [r5, r3]
	adds r1, r1, r0
_0805392C:
	ldr r3, _08053990  @ gUnknown_0201FB0C
	ldr r0, [r3]
	subs r6, r1, r0
	ldr r2, _08053994  @ gUnknown_0200002C
	movs r1, #0
	ldrsh r0, [r2, r1]
	mov r8, r0
	movs r1, #2
	ldrsh r0, [r5, r1]
	mov r1, r8
	subs r1, r1, r0
	mov r8, r1
	adds r5, r2, #0
	movs r2, #2
	ldrsh r1, [r4, r2]
	ldr r2, _08053998  @ gUnknown_02017760
	movs r4, #0
	ldrsh r0, [r2, r4]
	adds r1, r1, r0
	ldr r0, [r3]
	subs r4, r1, r0
	movs r0, #2
	ldrsh r1, [r5, r0]
	movs r3, #2
	ldrsh r0, [r2, r3]
	subs r5, r1, r0
	ldr r0, _0805399C  @ gEkrSomeType
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _080539A0
	lsls r1, r6, #0x10
	asrs r1, r1, #0x10
	mov r3, r8
	lsls r2, r3, #0x10
	asrs r2, r2, #0x10
	movs r0, #0
	bl sub_80559F0
	lsls r1, r4, #0x10
	asrs r1, r1, #0x10
	lsls r2, r5, #0x10
	asrs r2, r2, #0x10
	movs r0, #1
	bl sub_80559F0
	b _080539D2
	.align 2, 0
_0805398C: .4byte gUnknown_02000028
_08053990: .4byte gUnknown_0201FB0C
_08053994: .4byte gUnknown_0200002C
_08053998: .4byte gUnknown_02017760
_0805399C: .4byte gEkrSomeType
_080539A0:
	cmp r0, #0
	blt _080539D2
	cmp r0, #2
	bgt _080539D2
	ldr r0, [r7, #0x5c]
	bl GetAISSubjectId
	cmp r0, #0
	bne _080539C4
	lsls r1, r6, #0x10
	asrs r1, r1, #0x10
	mov r4, r8
	lsls r2, r4, #0x10
	asrs r2, r2, #0x10
	movs r0, #0
	bl sub_80559F0
	b _080539D2
_080539C4:
	lsls r1, r4, #0x10
	asrs r1, r1, #0x10
	lsls r2, r5, #0x10
	asrs r2, r2, #0x10
	movs r0, #1
	bl sub_80559F0
_080539D2:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_805382C

	THUMB_FUNC_START sub_80539DC
sub_80539DC: @ 0x080539DC
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	mov r8, r0
	mov r9, r1
	adds r6, r2, #0
	ldr r0, _08053A20  @ gUnknown_02017740
	ldr r7, [r0]
	cmp r7, #0
	beq _080539F4
	b _08053B90
_080539F4:
	movs r4, #1
	str r4, [r0]
	ldr r0, _08053A24  @ gProc_efxHitQuake
	movs r1, #3
	bl Proc_Start
	adds r5, r0, #0
	mov r0, r8
	str r0, [r5, #0x5c]
	mov r1, r9
	str r1, [r5, #0x60]
	strh r7, [r5, #0x2c]
	adds r0, r5, #0
	adds r0, #0x29
	strb r4, [r0]
	cmp r6, #0
	beq _08053A5C
	cmp r6, #1
	bne _08053A2C
	ldr r0, _08053A28  @ gUnknown_080DA4DC
	b _08053A5E
	.align 2, 0
_08053A20: .4byte gUnknown_02017740
_08053A24: .4byte gProc_efxHitQuake
_08053A28: .4byte gUnknown_080DA4DC
_08053A2C:
	cmp r6, #2
	bne _08053A38
	ldr r0, _08053A34  @ gUnknown_080DA526
	b _08053A5E
	.align 2, 0
_08053A34: .4byte gUnknown_080DA526
_08053A38:
	cmp r6, #3
	bne _08053A44
	ldr r0, _08053A40  @ gUnknown_080DA570
	b _08053A5E
	.align 2, 0
_08053A40: .4byte gUnknown_080DA570
_08053A44:
	cmp r6, #4
	bne _08053A50
	ldr r0, _08053A4C  @ gUnknown_080DA9F8
	b _08053A5E
	.align 2, 0
_08053A4C: .4byte gUnknown_080DA9F8
_08053A50:
	cmp r6, #5
	bne _08053A5C
	ldr r0, _08053A58  @ gUnknown_080DAA8E
	b _08053A5E
	.align 2, 0
_08053A58: .4byte gUnknown_080DAA8E
_08053A5C:
	ldr r0, _08053A74  @ gUnknown_080DA4BA
_08053A5E:
	str r0, [r5, #0x44]
	movs r0, #1
	str r0, [r5, #0x48]
	bl sub_806FAB0
	adds r4, r0, #0
	cmp r4, #0
	beq _08053A78
	movs r0, #0
	str r0, [r5, #0x64]
	b _08053B90
	.align 2, 0
_08053A74: .4byte gUnknown_080DA4BA
_08053A78:
	bl GetBattleAnimArenaFlag
	cmp r0, #0
	beq _08053A84
	str r4, [r5, #0x64]
	b _08053B90
_08053A84:
	ldr r0, _08053A94  @ gEkrSomeType
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _08053A98
	str r0, [r5, #0x64]
	b _08053B90
	.align 2, 0
_08053A94: .4byte gEkrSomeType
_08053A98:
	ldr r0, [r5, #0x5c]
	bl GetAISSubjectId
	ldr r1, _08053AC8  @ gUnknown_0201FB0C
	ldr r1, [r1]
	ldr r2, _08053ACC  @ gUnknown_02000030
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	subs r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r4, r1, #0x10
	mov r0, r8
	bl GetAISSubjectId
	cmp r0, #0
	bne _08053AD4
	movs r0, #0x40
	strh r0, [r5, #0x36]
	movs r0, #0x68
	strh r0, [r5, #0x3e]
	ldr r0, _08053AD0  @ gUnknown_085C7338
	b _08053ADE
	.align 2, 0
_08053AC8: .4byte gUnknown_0201FB0C
_08053ACC: .4byte gUnknown_02000030
_08053AD0: .4byte gUnknown_085C7338
_08053AD4:
	movs r0, #0xb0
	strh r0, [r5, #0x36]
	movs r0, #0x68
	strh r0, [r5, #0x3e]
	ldr r0, _08053B04  @ gUnknown_085C72AC
_08053ADE:
	movs r1, #5
	bl AnimCreate
	adds r2, r0, #0
	ldrh r1, [r5, #0x36]
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	subs r1, r1, r0
	strh r1, [r2, #2]
	ldrh r0, [r5, #0x3e]
	strh r0, [r2, #4]
	ldr r0, _08053B08  @ gUnknown_0201775C
	ldr r0, [r0]
	cmp r0, #1
	bne _08053B0C
	movs r0, #0xd3
	lsls r0, r0, #6
	b _08053B10
	.align 2, 0
_08053B04: .4byte gUnknown_085C72AC
_08053B08: .4byte gUnknown_0201775C
_08053B0C:
	movs r0, #0xf3
	lsls r0, r0, #6
_08053B10:
	strh r0, [r2, #8]
	str r2, [r5, #0x64]
	ldr r4, _08053B9C  @ gUnknown_0200003C
	mov r0, r8
	bl GetAISSubjectId
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r0, [r0]
	ldr r1, _08053BA0  @ 0x06011800
	movs r2, #0x80
	lsls r2, r2, #4
	bl RegisterTileGraphics
	ldr r4, _08053BA4  @ gEkrSpellAnimIndexLutMaybe
	mov r0, r9
	bl GetAISSubjectId
	lsls r0, r0, #1
	adds r0, r0, r4
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0x39
	bne _08053B56
	ldr r4, _08053BA8  @ gBanimTerrainPaletteMaybe
	mov r0, r9
	bl GetAISSubjectId
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r0, [r0]
	ldr r1, _08053BAC  @ gUnknown_02016828
	movs r2, #8
	bl CpuFastSet
_08053B56:
	ldr r4, _08053BA8  @ gBanimTerrainPaletteMaybe
	mov r0, r8
	bl GetAISSubjectId
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r0, [r0]
	ldr r1, _08053BB0  @ gUnknown_02022B08
	movs r2, #8
	bl CpuFastSet
	bl EnablePaletteSync
	ldr r0, _08053BB4  @ gEkrSomeType
	movs r1, #0
	ldrsh r4, [r0, r1]
	mov r0, r8
	bl GetAISSubjectId
	adds r1, r0, #0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	adds r0, r4, #0
	bl sub_805AFA0
	ldr r0, _08053BB8  @ gUnknown_0201FB0C
	ldr r0, [r0]
	bl sub_8053618
_08053B90:
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08053B9C: .4byte gUnknown_0200003C
_08053BA0: .4byte 0x06011800
_08053BA4: .4byte gEkrSpellAnimIndexLutMaybe
_08053BA8: .4byte gBanimTerrainPaletteMaybe
_08053BAC: .4byte gUnknown_02016828
_08053BB0: .4byte gUnknown_02022B08
_08053BB4: .4byte gEkrSomeType
_08053BB8: .4byte gUnknown_0201FB0C

	THUMB_FUNC_END sub_80539DC

	THUMB_FUNC_START sub_8053BBC
sub_8053BBC: @ 0x08053BBC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r7, r0, #0
	ldr r5, [r7, #0x44]
	movs r1, #0x2c
	ldrsh r0, [r7, r1]
	lsls r0, r0, #2
	adds r0, r0, r5
	movs r2, #0
	ldrsh r1, [r0, r2]
	ldr r0, _08053C0C  @ 0x00007FFF
	cmp r1, r0
	beq _08053BDC
	b _08053CF0
_08053BDC:
	movs r0, #0
	movs r1, #0
	bl sub_8052214
	ldr r0, _08053C10  @ gEkrSomeType
	movs r3, #0
	ldrsh r0, [r0, r3]
	cmp r0, #0
	bne _08053C14
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	bl sub_806FAB0
	cmp r0, #0
	beq _08053C36
	movs r0, #3
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	b _08053C36
	.align 2, 0
_08053C0C: .4byte 0x00007FFF
_08053C10: .4byte gEkrSomeType
_08053C14:
	cmp r0, #0
	blt _08053C36
	cmp r0, #2
	bgt _08053C36
	bl sub_806FAB0
	cmp r0, #0
	beq _08053C2E
	movs r0, #3
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
_08053C2E:
	ldr r0, _08053CD8  @ gUnknown_0201FB0C
	ldr r0, [r0]
	bl sub_8053618
_08053C36:
	ldr r0, [r7, #0x64]
	cmp r0, #0
	beq _08053C46
	bl AnimDelete
	ldr r0, _08053CDC  @ gUnknown_0201FADC
	bl sub_805AE58
_08053C46:
	ldr r3, _08053CE0  @ gUnknown_02000028
	movs r4, #0
	ldrsh r2, [r3, r4]
	ldr r0, _08053CD8  @ gUnknown_0201FB0C
	ldr r1, [r0]
	subs r6, r2, r1
	ldr r2, _08053CE4  @ gUnknown_0200002C
	movs r5, #2
	ldrsh r0, [r3, r5]
	subs r4, r0, r1
	movs r0, #2
	ldrsh r5, [r2, r0]
	lsls r1, r6, #0x10
	asrs r1, r1, #0x10
	movs r3, #0
	ldrsh r2, [r2, r3]
	movs r0, #0
	bl sub_80559F0
	lsls r1, r4, #0x10
	asrs r1, r1, #0x10
	adds r2, r5, #0
	movs r0, #1
	bl sub_80559F0
	ldr r1, _08053CE8  @ gUnknown_02017740
	movs r0, #0
	str r0, [r1]
	adds r0, r7, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #1
	bne _08053CCE
	bl sub_806FAB0
	cmp r0, #0
	beq _08053C9A
	movs r0, #3
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
_08053C9A:
	ldr r4, _08053CEC  @ gBanimBgPosMaybe
	ldrh r1, [r4]
	ldrh r2, [r4, #2]
	movs r0, #0
	bl BG_SetPosition
	ldrh r0, [r4]
	negs r0, r0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldrh r1, [r4, #2]
	negs r1, r1
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl EkrGauge_Setxy323A
	ldrh r0, [r4]
	negs r0, r0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r1, [r4, #2]
	negs r1, r1
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	bl sub_8051B5C
_08053CCE:
	adds r0, r7, #0
	bl Proc_End
	b _08053F02
	.align 2, 0
_08053CD8: .4byte gUnknown_0201FB0C
_08053CDC: .4byte gUnknown_0201FADC
_08053CE0: .4byte gUnknown_02000028
_08053CE4: .4byte gUnknown_0200002C
_08053CE8: .4byte gUnknown_02017740
_08053CEC: .4byte gBanimBgPosMaybe
_08053CF0:
	movs r6, #0x2c
	ldrsh r4, [r7, r6]
	cmp r4, #0
	bne _08053D1C
	ldr r0, [r7, #0x64]
	cmp r0, #0
	beq _08053D1C
	ldr r0, [r7, #0x5c]
	bl GetAISSubjectId
	adds r1, r0, #0
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #1
	ldr r1, _08053D70  @ gUnknown_02023F68
	adds r0, r0, r1
	str r4, [sp]
	movs r1, #0xf
	movs r2, #5
	movs r3, #0
	bl FillBGRect
_08053D1C:
	movs r1, #0x2c
	ldrsh r0, [r7, r1]
	lsls r0, r0, #2
	adds r0, r0, r5
	movs r2, #0
	ldrsh r4, [r0, r2]
	movs r3, #2
	ldrsh r5, [r0, r3]
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_8052214
	ldrh r0, [r7, #0x2c]
	adds r0, #1
	strh r0, [r7, #0x2c]
	ldr r0, [r7, #0x64]
	cmp r0, #0
	beq _08053D80
	ldr r0, [r7, #0x5c]
	bl GetAISSubjectId
	ldr r1, _08053D74  @ gUnknown_0201FB0C
	ldr r1, [r1]
	ldr r2, _08053D78  @ gUnknown_02000030
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	subs r1, r1, r0
	ldr r3, [r7, #0x64]
	ldr r2, _08053D7C  @ gUnknown_02017760
	ldrh r0, [r2]
	ldrh r6, [r7, #0x36]
	adds r0, r0, r6
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	subs r0, r0, r1
	strh r0, [r3, #2]
	ldrh r0, [r7, #0x3e]
	ldrh r1, [r2, #2]
	subs r0, r0, r1
	strh r0, [r3, #4]
	b _08053D8C
	.align 2, 0
_08053D70: .4byte gUnknown_02023F68
_08053D74: .4byte gUnknown_0201FB0C
_08053D78: .4byte gUnknown_02000030
_08053D7C: .4byte gUnknown_02017760
_08053D80:
	ldr r0, _08053E40  @ gUnknown_02017760
	ldrh r1, [r0]
	ldrh r2, [r0, #2]
	movs r0, #2
	bl BG_SetPosition
_08053D8C:
	adds r0, r7, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #1
	bne _08053E04
	bl sub_806FAB0
	cmp r0, #0
	beq _08053DAE
	negs r1, r4
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r2, r5, #0x10
	lsrs r2, r2, #0x10
	movs r0, #3
	bl BG_SetPosition
_08053DAE:
	ldr r5, _08053E40  @ gUnknown_02017760
	ldr r4, _08053E44  @ gBanimBgPosMaybe
	ldrh r1, [r4]
	ldrh r0, [r5]
	adds r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldrh r2, [r4, #2]
	ldrh r3, [r5, #2]
	adds r2, r2, r3
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #0
	bl BG_SetPosition
	ldrh r0, [r4]
	ldrh r6, [r5]
	adds r0, r0, r6
	negs r0, r0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldrh r1, [r4, #2]
	ldrh r2, [r5, #2]
	adds r1, r1, r2
	negs r1, r1
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl EkrGauge_Setxy323A
	ldrh r0, [r4]
	ldrh r3, [r5]
	adds r0, r0, r3
	negs r0, r0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r1, [r4, #2]
	ldrh r5, [r5, #2]
	adds r1, r1, r5
	negs r1, r1
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	bl sub_8051B5C
_08053E04:
	bl sub_806FAB0
	cmp r0, #0
	beq _08053E18
	ldr r0, _08053E40  @ gUnknown_02017760
	ldrh r1, [r0]
	ldrh r2, [r0, #2]
	movs r0, #3
	bl BG_SetPosition
_08053E18:
	bl sub_806FAB0
	cmp r0, #0
	beq _08053E54
	ldr r4, _08053E48  @ gUnknown_02000028
	mov ip, r4
	movs r5, #0
	ldrsh r1, [r4, r5]
	ldr r2, _08053E40  @ gUnknown_02017760
	movs r6, #0
	ldrsh r0, [r2, r6]
	subs r1, r1, r0
	ldr r4, _08053E4C  @ gUnknown_0201FB0C
	ldr r0, [r4]
	subs r6, r1, r0
	ldr r3, _08053E50  @ gUnknown_0200002C
	movs r0, #0
	ldrsh r1, [r3, r0]
	b _08053E70
	.align 2, 0
_08053E40: .4byte gUnknown_02017760
_08053E44: .4byte gBanimBgPosMaybe
_08053E48: .4byte gUnknown_02000028
_08053E4C: .4byte gUnknown_0201FB0C
_08053E50: .4byte gUnknown_0200002C
_08053E54:
	ldr r6, _08053EBC  @ gUnknown_02000028
	mov ip, r6
	movs r0, #0
	ldrsh r1, [r6, r0]
	ldr r2, _08053EC0  @ gUnknown_02017760
	movs r3, #0
	ldrsh r0, [r2, r3]
	adds r1, r1, r0
	ldr r4, _08053EC4  @ gUnknown_0201FB0C
	ldr r0, [r4]
	subs r6, r1, r0
	ldr r3, _08053EC8  @ gUnknown_0200002C
	movs r5, #0
	ldrsh r1, [r3, r5]
_08053E70:
	movs r5, #2
	ldrsh r0, [r2, r5]
	subs r1, r1, r0
	mov r8, r1
	mov r5, ip
	movs r1, #2
	ldrsh r0, [r5, r1]
	movs r5, #0
	ldrsh r1, [r2, r5]
	adds r0, r0, r1
	ldr r1, [r4]
	subs r4, r0, r1
	movs r0, #2
	ldrsh r1, [r3, r0]
	movs r3, #2
	ldrsh r0, [r2, r3]
	subs r5, r1, r0
	ldr r0, _08053ECC  @ gEkrSomeType
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _08053ED0
	lsls r1, r6, #0x10
	asrs r1, r1, #0x10
	mov r3, r8
	lsls r2, r3, #0x10
	asrs r2, r2, #0x10
	movs r0, #0
	bl sub_80559F0
	lsls r1, r4, #0x10
	asrs r1, r1, #0x10
	lsls r2, r5, #0x10
	asrs r2, r2, #0x10
	movs r0, #1
	bl sub_80559F0
	b _08053F02
	.align 2, 0
_08053EBC: .4byte gUnknown_02000028
_08053EC0: .4byte gUnknown_02017760
_08053EC4: .4byte gUnknown_0201FB0C
_08053EC8: .4byte gUnknown_0200002C
_08053ECC: .4byte gEkrSomeType
_08053ED0:
	cmp r0, #0
	blt _08053F02
	cmp r0, #2
	bgt _08053F02
	ldr r0, [r7, #0x5c]
	bl GetAISSubjectId
	cmp r0, #0
	bne _08053EF4
	lsls r1, r6, #0x10
	asrs r1, r1, #0x10
	mov r4, r8
	lsls r2, r4, #0x10
	asrs r2, r2, #0x10
	movs r0, #0
	bl sub_80559F0
	b _08053F02
_08053EF4:
	lsls r1, r4, #0x10
	asrs r1, r1, #0x10
	lsls r2, r5, #0x10
	asrs r2, r2, #0x10
	movs r0, #1
	bl sub_80559F0
_08053F02:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8053BBC

.align 2, 0
