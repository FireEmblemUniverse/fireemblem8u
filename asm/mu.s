	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	@ "MOVEUNIT" proc and related functions
	@ Handles managing and displaying moving map sprites

	THUMB_FUNC_START Moveunit_ExecMoveCommand
Moveunit_ExecMoveCommand: @ 0x08078898
	push {r4, r5, lr}
	adds r4, r0, #0
_0807889C:
	ldr r0, [r4, #0x34]
	ldrb r2, [r0, #4]
	adds r1, r2, #1
	strb r1, [r0, #4]
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	adds r0, #5
	adds r0, r0, r2
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	movs r1, #0x80
	lsls r1, r1, #9
	adds r0, r0, r1
	asrs r0, r0, #0x10
	cmp r0, #0xf
	bhi _0807889C
	lsls r0, r0, #2
	ldr r1, _080788CC  @ _080788D0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080788CC: .4byte _080788D0
_080788D0: @ jump table
	.4byte _08078978 @ case 0
	.4byte _08078986 @ case 1
	.4byte _08078986 @ case 2
	.4byte _08078986 @ case 3
	.4byte _08078986 @ case 4
	.4byte _08078970 @ case 5
	.4byte _080789B2 @ case 6
	.4byte _080789B2 @ case 7
	.4byte _080789B2 @ case 8
	.4byte _080789B2 @ case 9
	.4byte _08078910 @ case 10
	.4byte _08078934 @ case 11
	.4byte _0807889C @ case 12
	.4byte _080789E0 @ case 13
	.4byte _080789FE @ case 14
	.4byte _08078A06 @ case 15
_08078910:
	ldr r0, [r4, #0x34]
	ldrb r2, [r0, #4]
	adds r1, r2, #1
	strb r1, [r0, #4]
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	adds r0, #5
	adds r0, r0, r2
	movs r1, #0
	ldrsb r1, [r0, r1]
	adds r0, r4, #0
	adds r0, #0x48
	strh r1, [r0]
	adds r1, r4, #0
	adds r1, #0x3f
	movs r0, #3
	strb r0, [r1]
	b _08078A0E
_08078934:
	adds r0, r4, #0
	bl nullsub_19
	adds r1, r4, #0
	adds r1, #0x3f
	movs r0, #5
	strb r0, [r1]
	adds r0, r4, #0
	adds r0, #0x4c
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x14
	ldr r2, _0807896C  @ gUnknown_0202BCB0
	movs r3, #0xc
	ldrsh r1, [r2, r3]
	subs r0, r0, r1
	adds r1, r4, #0
	adds r1, #0x4e
	ldrh r1, [r1]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x14
	movs r3, #0xe
	ldrsh r2, [r2, r3]
	subs r1, r1, r2
	bl DisplayFogThingMaybe
	b _08078A0E
	.align 2, 0
_0807896C: .4byte gUnknown_0202BCB0
_08078970:
	adds r0, r4, #0
	bl sub_80790CC
	b _08078A0E
_08078978:
	adds r0, r4, #0
	bl nullsub_19
	adds r0, r4, #0
	bl EndMoveunitMaybe
	b _08078A0E
_08078986:
	adds r2, r4, #0
	adds r2, #0x42
	lsls r0, r3, #0x10
	asrs r5, r0, #0x10
	movs r0, #0
	ldrsb r0, [r2, r0]
	cmp r5, r0
	beq _08078A0E
	adds r0, r4, #0
	adds r0, #0x41
	ldrb r0, [r0]
	bl MMS_GetROMTCS
	adds r0, r4, #0
	adds r1, r5, #0
	bl MOVEUNIT6C_SetSpriteDirection
	adds r1, r4, #0
	adds r1, #0x3f
	movs r0, #2
	strb r0, [r1]
	b _08078A0E
_080789B2:
	lsls r0, r3, #0x10
	adds r2, r4, #0
	adds r2, #0x42
	ldr r1, _080789DC  @ 0xFFFB0000
	adds r0, r0, r1
	asrs r5, r0, #0x10
	movs r0, #0
	ldrsb r0, [r2, r0]
	cmp r5, r0
	bne _080789C8
	b _0807889C
_080789C8:
	adds r0, r4, #0
	adds r0, #0x41
	ldrb r0, [r0]
	bl MMS_GetROMTCS
	adds r0, r4, #0
	adds r1, r5, #0
	bl MOVEUNIT6C_SetSpriteDirection
	b _0807889C
	.align 2, 0
_080789DC: .4byte 0xFFFB0000
_080789E0:
	ldr r0, [r4, #0x34]
	ldrb r2, [r0, #4]
	adds r1, r2, #1
	strb r1, [r0, #4]
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	adds r0, #5
	adds r0, r0, r2
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r1, r4, #0
	adds r1, #0x4a
	strh r0, [r1]
	b _0807889C
_080789FE:
	adds r0, r4, #0
	bl MOVEUNIT6C_SetCameraFollow
	b _0807889C
_08078A06:
	adds r0, r4, #0
	bl MOVEUNIT6C_UnsetCameraFollow
	b _0807889C
_08078A0E:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_START DisplayFogThingMaybe
DisplayFogThingMaybe: @ 0x08078A14
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	ldr r0, _08078A54  @ gUnknown_089ADD4C
	ldr r1, _08078A58  @ 0x06013000
	bl CopyDataWithPossibleUncomp
	ldr r0, _08078A5C  @ gUnknown_089A8EF8
	movs r1, #2
	bl AP_Create
	adds r4, r0, #0
	movs r0, #0x8c
	lsls r0, r0, #5
	strh r0, [r4, #0x22]
	adds r0, r4, #0
	movs r1, #0
	bl AP_SwitchAnimation
	ldr r0, _08078A60  @ gUnknown_089A2968
	movs r1, #3
	bl Proc_Create
	str r4, [r0, #0x50]
	adds r5, #8
	str r5, [r0, #0x2c]
	subs r6, #4
	str r6, [r0, #0x30]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08078A54: .4byte gUnknown_089ADD4C
_08078A58: .4byte 0x06013000
_08078A5C: .4byte gUnknown_089A8EF8
_08078A60: .4byte gUnknown_089A2968

	THUMB_FUNC_START Call6C_89A2968
Call6C_89A2968: @ 0x08078A64
	push {r4, r5, r6, lr}
	mov r6, r9
	mov r5, r8
	push {r5, r6}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, _08078B00  @ gUnknown_0202BCF0
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08078A82
	movs r0, #0x77
	bl m4aSongNumStart
_08078A82:
	adds r1, r4, #0
	adds r1, #0x64
	movs r0, #0
	strh r0, [r1]
	ldr r4, _08078B04  @ gSinLookup
	movs r0, #0x80
	adds r0, r0, r4
	mov r9, r0
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r0, r0, #4
	movs r2, #0x80
	lsls r2, r2, #2
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
	mov r1, r8
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
	mov r1, r8
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	movs r0, #0
	adds r1, r6, #0
	adds r2, r5, #0
	adds r3, r4, #0
	bl WriteOAMRotScaleData
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08078B00: .4byte gUnknown_0202BCF0
_08078B04: .4byte gSinLookup

	THUMB_FUNC_START Loop6C_89A2968_1
Loop6C_89A2968_1: @ 0x08078B08
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r7, r0, #0
	adds r4, r7, #0
	adds r4, #0x64
	ldrh r0, [r4]
	adds r1, r0, #1
	strh r1, [r4]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #7
	ble _08078B2C
	adds r0, r7, #0
	bl Proc_ClearNativeCallback
_08078B2C:
	movs r1, #0x80
	lsls r1, r1, #2
	movs r2, #0x80
	lsls r2, r2, #1
	movs r0, #0
	ldrsh r3, [r4, r0]
	movs r0, #8
	str r0, [sp]
	movs r0, #5
	bl sub_8012DCC
	mov r8, r0
	ldr r4, _08078BC8  @ gSinLookup
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
	mov r1, r8
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
	mov r1, r8
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	movs r0, #0
	adds r1, r6, #0
	adds r2, r5, #0
	adds r3, r4, #0
	bl WriteOAMRotScaleData
	ldr r0, [r7, #0x50]
	ldr r1, [r7, #0x2c]
	subs r1, #8
	ldr r2, [r7, #0x30]
	subs r2, #8
	movs r3, #0xc0
	lsls r3, r3, #2
	orrs r2, r3
	bl AP_Update
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08078BC8: .4byte gSinLookup

	THUMB_FUNC_START Loop6C_89A2968_2
Loop6C_89A2968_2: @ 0x08078BCC
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x64
	ldrh r1, [r0]
	adds r2, r1, #1
	strh r2, [r0]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	cmp r1, #0x27
	ble _08078BE6
	adds r0, r4, #0
	bl Proc_ClearNativeCallback
_08078BE6:
	ldr r0, [r4, #0x50]
	ldr r1, [r4, #0x2c]
	ldr r2, [r4, #0x30]
	movs r3, #0x80
	lsls r3, r3, #1
	orrs r2, r3
	bl AP_Update
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_START Does6C_89A2968Exist
Does6C_89A2968Exist: @ 0x08078BFC
	push {lr}
	ldr r0, _08078C10  @ gUnknown_089A2968
	bl Proc_Find
	cmp r0, #0
	beq _08078C0A
	movs r0, #1
_08078C0A:
	pop {r1}
	bx r1
	.align 2, 0
_08078C10: .4byte gUnknown_089A2968

	THUMB_FUNC_START MOVU_Call5_WaitForSomething
MOVU_Call5_WaitForSomething: @ 0x08078C14
	push {r4, lr}
	adds r4, r0, #0
	bl Does6C_89A2968Exist
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08078C2A
	adds r1, r4, #0
	adds r1, #0x3f
	movs r0, #3
	strb r0, [r1]
_08078C2A:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_START MOVU_Call4_SetState2
MOVU_Call4_SetState2: @ 0x08078C30
	adds r0, #0x3f
	movs r1, #2
	strb r1, [r0]
	bx lr

	THUMB_FUNC_START MOVU_Call3_Wait
MOVU_Call3_Wait: @ 0x08078C38
	push {lr}
	adds r1, r0, #0
	adds r2, r1, #0
	adds r2, #0x48
	ldrh r0, [r2]
	cmp r0, #0
	bne _08078C4E
	adds r1, #0x3f
	movs r0, #2
	strb r0, [r1]
	b _08078C52
_08078C4E:
	subs r0, #1
	strh r0, [r2]
_08078C52:
	pop {r0}
	bx r0

	THUMB_FUNC_START sub_8078C58
sub_8078C58: @ 0x08078C58
	bx lr

	THUMB_FUNC_START nullsub_54
nullsub_54: @ 0x08078C5C
	bx lr

	THUMB_FUNC_START MOVU_Call2_Moving
MOVU_Call2_Moving: @ 0x08078C60
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	bl MOVEUNIT6C_GetMovementSpeed
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r2, r6, #0
	adds r2, #0x48
	ldrh r1, [r2]
	adds r1, r1, r0
	strh r1, [r2]
	adds r4, r6, #0
	adds r4, #0x4c
	ldr r1, _08078D5C  @ gUnknown_089A2988
	mov ip, r1
	adds r3, r6, #0
	adds r3, #0x42
	movs r1, #0
	ldrsb r1, [r3, r1]
	lsls r1, r1, #2
	add r1, ip
	movs r5, #0
	ldrsh r1, [r1, r5]
	muls r1, r0, r1
	ldrh r7, [r4]
	adds r1, r1, r7
	strh r1, [r4]
	adds r5, r6, #0
	adds r5, #0x4e
	movs r1, #0
	ldrsb r1, [r3, r1]
	lsls r1, r1, #1
	adds r1, #1
	lsls r1, r1, #1
	add r1, ip
	movs r7, #0
	ldrsh r1, [r1, r7]
	muls r0, r1, r0
	ldrh r1, [r5]
	adds r0, r0, r1
	strh r0, [r5]
	ldrh r1, [r2]
	lsrs r0, r1, #4
	cmp r0, #0xf
	bls _08078D0E
	ldr r7, _08078D60  @ 0xFFFFFF00
	adds r1, r1, r7
	strh r1, [r2]
	ldrh r0, [r2]
	mov r8, r0
	movs r0, #0
	ldrsb r0, [r3, r0]
	lsls r0, r0, #2
	add r0, ip
	movs r1, #0
	ldrsh r0, [r0, r1]
	mov r1, r8
	muls r1, r0, r1
	ldrh r0, [r4]
	subs r0, r0, r1
	strh r0, [r4]
	ldrh r1, [r2]
	movs r0, #0
	ldrsb r0, [r3, r0]
	lsls r0, r0, #1
	adds r0, #1
	lsls r0, r0, #1
	add r0, ip
	movs r3, #0
	ldrsh r0, [r0, r3]
	muls r1, r0, r1
	ldrh r0, [r5]
	subs r0, r0, r1
	strh r0, [r5]
	movs r0, #0
	strh r0, [r2]
	ldrh r2, [r4]
	movs r1, #0x10
	negs r1, r1
	adds r0, r1, #0
	ands r0, r2
	strh r0, [r4]
	ldrh r0, [r5]
	ands r1, r0
	strh r1, [r5]
_08078D0E:
	adds r0, r6, #0
	adds r0, #0x3e
	ldrb r0, [r0]
	cmp r0, #0
	beq _08078D3C
	ldr r0, _08078D64  @ gUnknown_0859A548
	bl Proc_Find
	cmp r0, #0
	bne _08078D3C
	ldrh r0, [r4]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x14
	bl GetSomeAdjustedCameraX
	ldr r4, _08078D68  @ gUnknown_0202BCB0
	strh r0, [r4, #0xc]
	ldrh r0, [r5]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x14
	bl GetSomeAdjustedCameraY
	strh r0, [r4, #0xe]
_08078D3C:
	adds r0, r6, #0
	adds r0, #0x4a
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _08078D50
	adds r0, r6, #0
	bl MOVEUNIT6C_PlaySoundStepByClass
_08078D50:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08078D5C: .4byte gUnknown_089A2988
_08078D60: .4byte 0xFFFFFF00
_08078D64: .4byte gUnknown_0859A548
_08078D68: .4byte gUnknown_0202BCB0

	THUMB_FUNC_START MOVEUNIT6C_PlaySoundStepByClass
MOVEUNIT6C_PlaySoundStepByClass: @ 0x08078D6C
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	adds r4, r6, #0
	adds r4, #0x41
	ldrb r0, [r4]
	bl GetROMClassStruct
	ldr r0, [r0, #0x28]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _08078DC0
	ldrb r0, [r4]
	cmp r0, #0x49
	bgt _08078DA4
	cmp r0, #0x48
	bge _08078DB8
	cmp r0, #0x24
	ble _08078D96
	b _08078FC4
_08078D96:
	cmp r0, #0x1f
	bge _08078D9C
	b _08078FC4
_08078D9C:
	ldr r5, _08078DA0  @ gUnknown_089A2A2E
	b _08078FEE
	.align 2, 0
_08078DA0: .4byte gUnknown_089A2A2E
_08078DA4:
	cmp r0, #0x60
	ble _08078DAA
	b _08078FC4
_08078DAA:
	cmp r0, #0x5f
	bge _08078DB0
	b _08078FC4
_08078DB0:
	ldr r5, _08078DB4  @ gUnknown_089A2AF6
	b _08078FEE
	.align 2, 0
_08078DB4: .4byte gUnknown_089A2AF6
_08078DB8:
	ldr r5, _08078DBC  @ gUnknown_089A2A5A
	b _08078FEE
	.align 2, 0
_08078DBC: .4byte gUnknown_089A2A5A
_08078DC0:
	ldrb r0, [r4]
	subs r0, #9
	cmp r0, #0x72
	bls _08078DCA
	b _08078FEC
_08078DCA:
	lsls r0, r0, #2
	ldr r1, _08078DD4  @ _08078DD8
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08078DD4: .4byte _08078DD8
_08078DD8: @ jump table
	.4byte _08078FD4 @ case 0
	.4byte _08078FD4 @ case 1
	.4byte _08078FD4 @ case 2
	.4byte _08078FD4 @ case 3
	.4byte _08078FEC @ case 4
	.4byte _08078FEC @ case 5
	.4byte _08078FEC @ case 6
	.4byte _08078FEC @ case 7
	.4byte _08078FEC @ case 8
	.4byte _08078FEC @ case 9
	.4byte _08078FEC @ case 10
	.4byte _08078FEC @ case 11
	.4byte _08078FEC @ case 12
	.4byte _08078FEC @ case 13
	.4byte _08078FEC @ case 14
	.4byte _08078FEC @ case 15
	.4byte _08078FEC @ case 16
	.4byte _08078FEC @ case 17
	.4byte _08078FEC @ case 18
	.4byte _08078FEC @ case 19
	.4byte _08078FEC @ case 20
	.4byte _08078FEC @ case 21
	.4byte _08078FEC @ case 22
	.4byte _08078FEC @ case 23
	.4byte _08078FEC @ case 24
	.4byte _08078FEC @ case 25
	.4byte _08078FEC @ case 26
	.4byte _08078FEC @ case 27
	.4byte _08078FEC @ case 28
	.4byte _08078FEC @ case 29
	.4byte _08078FEC @ case 30
	.4byte _08078FEC @ case 31
	.4byte _08078FEC @ case 32
	.4byte _08078FEC @ case 33
	.4byte _08078FEC @ case 34
	.4byte _08078FEC @ case 35
	.4byte _08078FEC @ case 36
	.4byte _08078FEC @ case 37
	.4byte _08078FEC @ case 38
	.4byte _08078FEC @ case 39
	.4byte _08078FEC @ case 40
	.4byte _08078FEC @ case 41
	.4byte _08078FEC @ case 42
	.4byte _08078FEC @ case 43
	.4byte _08078FEC @ case 44
	.4byte _08078FEC @ case 45
	.4byte _08078FEC @ case 46
	.4byte _08078FEC @ case 47
	.4byte _08078FEC @ case 48
	.4byte _08078FEC @ case 49
	.4byte _08078FD4 @ case 50
	.4byte _08078FE4 @ case 51
	.4byte _08078FEC @ case 52
	.4byte _08078FEC @ case 53
	.4byte _08078FEC @ case 54
	.4byte _08078FEC @ case 55
	.4byte _08078FEC @ case 56
	.4byte _08078FEC @ case 57
	.4byte _08078FEC @ case 58
	.4byte _08078FEC @ case 59
	.4byte _08078FEC @ case 60
	.4byte _08078FEC @ case 61
	.4byte _08078FEC @ case 62
	.4byte _08078FEC @ case 63
	.4byte _08078FEC @ case 64
	.4byte _08078FEC @ case 65
	.4byte _08078FEC @ case 66
	.4byte _08078FEC @ case 67
	.4byte _08078FEC @ case 68
	.4byte _08078FEC @ case 69
	.4byte _08078FEC @ case 70
	.4byte _08078FDC @ case 71
	.4byte _08078FEC @ case 72
	.4byte _08078FA4 @ case 73
	.4byte _08078FA4 @ case 74
	.4byte _08078FAC @ case 75
	.4byte _08078FAC @ case 76
	.4byte _08078FAC @ case 77
	.4byte _08078FAC @ case 78
	.4byte _08078FB4 @ case 79
	.4byte _08078FB4 @ case 80
	.4byte _08078FD4 @ case 81
	.4byte _08078FBC @ case 82
	.4byte _08078FBC @ case 83
	.4byte _08078FC4 @ case 84
	.4byte _08078FC4 @ case 85
	.4byte _08078DB0 @ case 86
	.4byte _08078DB0 @ case 87
	.4byte _08078FCC @ case 88
	.4byte _08078FEC @ case 89
	.4byte _08078D9C @ case 90
	.4byte _08078D9C @ case 91
	.4byte _08078FD4 @ case 92
	.4byte _08078FD4 @ case 93
	.4byte _08078FD4 @ case 94
	.4byte _08078FD4 @ case 95
	.4byte _08078FD4 @ case 96
	.4byte _08078FEC @ case 97
	.4byte _08078FEC @ case 98
	.4byte _08078FEC @ case 99
	.4byte _08078FEC @ case 100
	.4byte _08078FEC @ case 101
	.4byte _08078FEC @ case 102
	.4byte _08078FEC @ case 103
	.4byte _08078FEC @ case 104
	.4byte _08078FEC @ case 105
	.4byte _08078FEC @ case 106
	.4byte _08078FEC @ case 107
	.4byte _08078FEC @ case 108
	.4byte _08078FEC @ case 109
	.4byte _08078FEC @ case 110
	.4byte _08079022 @ case 111
	.4byte _08078FEC @ case 112
	.4byte _08078FEC @ case 113
	.4byte _08079022 @ case 114
_08078FA4:
	ldr r5, _08078FA8  @ gUnknown_089A2AB2
	b _08078FEE
	.align 2, 0
_08078FA8: .4byte gUnknown_089A2AB2
_08078FAC:
	ldr r5, _08078FB0  @ gUnknown_089A2AD4
	b _08078FEE
	.align 2, 0
_08078FB0: .4byte gUnknown_089A2AD4
_08078FB4:
	ldr r5, _08078FB8  @ gUnknown_089A2B22
	b _08078FEE
	.align 2, 0
_08078FB8: .4byte gUnknown_089A2B22
_08078FBC:
	ldr r5, _08078FC0  @ gUnknown_089A2B3A
	b _08078FEE
	.align 2, 0
_08078FC0: .4byte gUnknown_089A2B3A
_08078FC4:
	ldr r5, _08078FC8  @ gUnknown_089A2A00
	b _08078FEE
	.align 2, 0
_08078FC8: .4byte gUnknown_089A2A00
_08078FCC:
	ldr r5, _08078FD0  @ gUnknown_089A2B68
	b _08078FEE
	.align 2, 0
_08078FD0: .4byte gUnknown_089A2B68
_08078FD4:
	ldr r5, _08078FD8  @ gUnknown_089A29BC
	b _08078FEE
	.align 2, 0
_08078FD8: .4byte gUnknown_089A29BC
_08078FDC:
	ldr r5, _08078FE0  @ gUnknown_089A2BCE
	b _08078FEE
	.align 2, 0
_08078FE0: .4byte gUnknown_089A2BCE
_08078FE4:
	ldr r5, _08078FE8  @ gUnknown_089A2C02
	b _08078FEE
	.align 2, 0
_08078FE8: .4byte gUnknown_089A2C02
_08078FEC:
	ldr r5, _0807902C  @ gUnknown_089A2998
_08078FEE:
	adds r2, r6, #0
	adds r2, #0x43
	ldrb r0, [r2]
	adds r1, r0, #1
	strb r1, [r2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrh r1, [r5]
	bl DivRem
	adds r4, r0, #0
	adds r0, r6, #0
	mov r1, sp
	bl GetMOVEUNITDisplayPosition
	lsls r4, r4, #1
	adds r4, r4, r5
	ldrh r0, [r4, #4]
	cmp r0, #0
	beq _08079022
	ldrh r1, [r5, #2]
	mov r2, sp
	movs r3, #0
	ldrsh r2, [r2, r3]
	bl NewSoundStepPlay6C
_08079022:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807902C: .4byte gUnknown_089A2998

	THUMB_FUNC_START _6CMOVEUNIT_Loop
_6CMOVEUNIT_Loop: @ 0x08079030
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x3f
	ldrb r1, [r0]
	cmp r1, #0
	beq _08079068
	adds r0, #9
	ldrh r0, [r0]
	cmp r0, #0
	bne _08079054
	subs r0, r1, #2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bhi _08079054
	adds r0, r4, #0
	bl Moveunit_ExecMoveCommand
_08079054:
	ldr r0, _08079080  @ gUnknown_089A2C28
	adds r1, r4, #0
	adds r1, #0x3f
	ldrb r1, [r1]
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r1, [r1]
	adds r0, r4, #0
	bl _call_via_r1
_08079068:
	adds r0, r4, #0
	adds r0, #0x42
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0xf
	bne _08079084
	adds r0, r4, #0
	bl UpdateMOVEUNITGfx_Idle
	b _0807908A
	.align 2, 0
_08079080: .4byte gUnknown_089A2C28
_08079084:
	adds r0, r4, #0
	bl UpdateMOVEUNITGfx_Movement
_0807908A:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_START _6CMOVEUNIT_Destructor
_6CMOVEUNIT_Destructor: @ 0x08079090
	push {lr}
	ldr r2, [r0, #0x34]
	movs r1, #0
	strb r1, [r2]
	ldr r0, [r0, #0x30]
	bl AP_Delete
	pop {r0}
	bx r0

	THUMB_FUNC_START ClearMOVEUNITs
ClearMOVEUNITs: @ 0x080790A4
	push {lr}
	ldr r0, _080790B0  @ gUnknown_089A2C48
	bl Proc_DeleteAllWithScript
	pop {r0}
	bx r0
	.align 2, 0
_080790B0: .4byte gUnknown_089A2C48

	THUMB_FUNC_START EndMoveunitMaybe
EndMoveunitMaybe: @ 0x080790B4
	push {lr}
	bl Delete6C__
	pop {r0}
	bx r0

	THUMB_FUNC_START Delete6C__
Delete6C__: @ 0x080790C0
	push {lr}
	bl Proc_Delete
	pop {r0}
	bx r0

	THUMB_FUNC_START sub_80790CC
sub_80790CC: @ 0x080790CC
	push {r4, lr}
	adds r4, r0, #0
	bl nullsub_19
	adds r4, #0x3f
	movs r0, #1
	strb r0, [r4]
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_START BlockAll6CMarked4
BlockAll6CMarked4: @ 0x080790E0
	push {lr}
	movs r0, #4
	bl Proc_BlockEachWithMark
	pop {r0}
	bx r0

	THUMB_FUNC_START UnblockAll6CMarked4
UnblockAll6CMarked4: @ 0x080790EC
	push {lr}
	movs r0, #4
	bl Proc_UnblockEachWithMark
	pop {r0}
	bx r0

	THUMB_FUNC_START sub_80790F8
sub_80790F8: @ 0x080790F8
	push {r4, lr}
	adds r3, r0, #0
	ldr r4, _08079110  @ _08079114
_080790FE:
	ldrb r0, [r2]
	adds r0, #1
	adds r2, #1
	cmp r0, #0xa
	bhi _080790FE
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08079110: .4byte _08079114
_08079114:
	.4byte _08079164
	.4byte _08079140
	.4byte _08079148
	.4byte _08079158
	.4byte _08079150
	.4byte _08079164
	.4byte _080790FE
	.4byte _080790FE
	.4byte _080790FE
	.4byte _080790FE
	.4byte _08079160
_08079140:
	ldr r0, [r3]
	subs r0, #1
	str r0, [r3]
	b _080790FE
_08079148:
	ldr r0, [r3]
	adds r0, #1
	str r0, [r3]
	b _080790FE
_08079150:
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	b _080790FE
_08079158:
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	b _080790FE
_08079160:
	adds r2, #1
	b _080790FE
_08079164:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_START IsSomeMOVEUNITRelatedStructAvailable
IsSomeMOVEUNITRelatedStructAvailable: @ 0x0807916C
	push {lr}
	ldr r1, _08079180  @ gUnknown_03001900
	adds r2, r1, #0
	adds r2, #0xe4
_08079174:
	ldrb r0, [r1]
	cmp r0, #0
	bne _08079184
	movs r0, #1
	b _0807918C
	.align 2, 0
_08079180: .4byte gUnknown_03001900
_08079184:
	adds r1, #0x4c
	cmp r1, r2
	ble _08079174
	movs r0, #0
_0807918C:
	pop {r1}
	bx r1

	THUMB_FUNC_START ResetAllMoveunitAnims
ResetAllMoveunitAnims: @ 0x08079190
	push {r4, r5, r6, r7, lr}
	ldr r2, _080791C8  @ gUnknown_03001900
	movs r3, #0
	adds r7, r2, #0
	adds r7, #0xe4
	adds r6, r2, #0
	adds r6, #0x48
	movs r5, #0
	movs r4, #0x80
	lsls r4, r4, #1
_080791A4:
	ldrb r0, [r2]
	cmp r0, #0
	beq _080791B8
	adds r1, r3, r6
	ldr r0, [r1]
	ldr r0, [r0, #0x30]
	strh r5, [r0, #0x18]
	ldr r0, [r1]
	ldr r0, [r0, #0x30]
	strh r4, [r0, #0x1a]
_080791B8:
	adds r2, #0x4c
	adds r3, #0x4c
	cmp r2, r7
	ble _080791A4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080791C8: .4byte gUnknown_03001900

	THUMB_FUNC_START GetNextMoveunitEntryStruct
GetNextMoveunitEntryStruct: @ 0x080791CC
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	movs r3, #0
	ldr r4, _080791F0  @ gUnknown_089A2C68
	ldr r1, _080791F4  @ gUnknown_03001900
	adds r2, r1, #0
_080791DA:
	ldrb r0, [r2]
	cmp r0, #0
	bne _080791F8
	adds r0, r3, #1
	strb r0, [r2]
	ldrh r0, [r4]
	adds r0, r0, r5
	strh r0, [r2, #2]
	strb r3, [r6]
	adds r0, r1, #0
	b _08079206
	.align 2, 0
_080791F0: .4byte gUnknown_089A2C68
_080791F4: .4byte gUnknown_03001900
_080791F8:
	adds r4, #2
	adds r2, #0x4c
	adds r1, #0x4c
	adds r3, #1
	cmp r3, #3
	ble _080791DA
	movs r0, #0
_08079206:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	THUMB_FUNC_START sub_807920C
sub_807920C: @ 0x0807920C
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	movs r3, #0
	ldr r4, _08079230  @ gUnknown_089A2C70
	ldr r1, _08079234  @ gUnknown_03001900
	adds r2, r1, #0
_0807921A:
	ldrb r0, [r2]
	cmp r0, #0
	bne _08079238
	adds r0, r3, #1
	strb r0, [r2]
	ldrh r0, [r4]
	adds r0, r0, r5
	strh r0, [r2, #2]
	strb r3, [r6]
	adds r0, r1, #0
	b _08079246
	.align 2, 0
_08079230: .4byte gUnknown_089A2C70
_08079234: .4byte gUnknown_03001900
_08079238:
	adds r4, #2
	adds r2, #0x4c
	adds r1, #0x4c
	adds r3, #1
	cmp r3, #3
	ble _0807921A
	movs r0, #0
_08079246:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	THUMB_FUNC_START GetMOVEUNITDisplayPosition
GetMOVEUNITDisplayPosition: @ 0x0807924C
	push {r4, r5, lr}
	adds r2, r0, #0
	adds r4, r1, #0
	adds r0, #0x3f
	ldrb r0, [r0]
	cmp r0, #6
	bne _08079288
	adds r0, r2, #0
	adds r0, #0x4c
	movs r1, #0
	ldrsh r0, [r0, r1]
	adds r1, r2, #0
	adds r1, #0x50
	movs r3, #0
	ldrsh r1, [r1, r3]
	adds r0, r0, r1
	asrs r0, r0, #4
	strh r0, [r4]
	adds r0, r2, #0
	adds r0, #0x4e
	movs r5, #0
	ldrsh r0, [r0, r5]
	adds r1, r2, #0
	adds r1, #0x52
	movs r2, #0
	ldrsh r1, [r1, r2]
	adds r0, r0, r1
	asrs r0, r0, #4
	strh r0, [r4, #2]
	b _080792F0
_08079288:
	adds r0, r2, #0
	adds r0, #0x4c
	movs r3, #0
	ldrsh r1, [r0, r3]
	adds r0, #4
	movs r5, #0
	ldrsh r0, [r0, r5]
	adds r1, r1, r0
	asrs r1, r1, #4
	ldr r3, _080792EC  @ gUnknown_0202BCB0
	ldrh r0, [r3, #0xc]
	subs r1, r1, r0
	adds r1, #8
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	adds r0, r2, #0
	adds r0, #0x4e
	movs r5, #0
	ldrsh r0, [r0, r5]
	adds r2, #0x52
	movs r5, #0
	ldrsh r2, [r2, r5]
	adds r0, r0, r2
	asrs r0, r0, #4
	ldrh r2, [r3, #0xe]
	subs r0, r0, r2
	adds r0, #8
	strh r1, [r4]
	lsls r0, r0, #0x10
	asrs r2, r0, #0x10
	adds r0, r2, #0
	adds r0, #8
	strh r0, [r4, #2]
	lsls r1, r1, #0x10
	movs r0, #0x80
	lsls r0, r0, #0xd
	adds r1, r1, r0
	movs r0, #0x88
	lsls r0, r0, #0x11
	cmp r1, r0
	bhi _080792E6
	movs r0, #0x10
	negs r0, r0
	cmp r2, r0
	blt _080792E6
	cmp r2, #0xb0
	ble _080792F0
_080792E6:
	movs r0, #0
	b _080792F2
	.align 2, 0
_080792EC: .4byte gUnknown_0202BCB0
_080792F0:
	movs r0, #1
_080792F2:
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_START UpdateMOVEUNITGfx_Idle
UpdateMOVEUNITGfx_Idle: @ 0x080792F8
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r7, r0, #0
	adds r0, #0x40
	ldrb r0, [r0]
	cmp r0, #0
	bne _08079392
	add r4, sp, #8
	adds r0, r7, #0
	adds r1, r4, #0
	bl GetMOVEUNITDisplayPosition
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08079392
	add r0, sp, #8
	ldrh r1, [r0]
	ldr r0, _0807939C  @ 0x000001FF
	ands r0, r1
	add r1, sp, #8
	strh r0, [r1]
	ldrh r0, [r4, #2]
	movs r1, #0xff
	ands r1, r0
	strh r1, [r4, #2]
	adds r0, r7, #0
	adds r0, #0x3f
	ldrb r0, [r0]
	cmp r0, #7
	bne _08079342
	movs r2, #0x80
	lsls r2, r2, #3
	adds r0, r2, #0
	orrs r1, r0
	movs r0, #0
	orrs r1, r0
	strh r1, [r4, #2]
_08079342:
	adds r6, r7, #0
	adds r6, #0x3c
	ldrb r0, [r6]
	ldr r1, [r7, #0x38]
	bl sub_8026FF4
	ldr r0, [r7, #0x30]
	ldrh r0, [r0, #0x1e]
	add r1, sp, #8
	movs r3, #0
	ldrsh r1, [r1, r3]
	subs r1, #8
	movs r3, #2
	ldrsh r2, [r4, r3]
	subs r2, #0x10
	ldr r3, [r7, #0x38]
	ldr r4, _080793A0  @ 0xF9FF0000
	adds r3, r3, r4
	lsls r3, r3, #0xf
	lsrs r3, r3, #0x14
	ldr r4, [r7, #0x34]
	ldrb r5, [r4, #1]
	movs r4, #0xf
	ands r4, r5
	lsls r4, r4, #0xc
	adds r5, r7, #0
	adds r5, #0x46
	orrs r3, r4
	ldrh r5, [r5]
	adds r3, r3, r5
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	adds r4, r7, #0
	adds r4, #0x41
	ldrb r4, [r4]
	str r4, [sp]
	ldrb r4, [r6]
	str r4, [sp, #4]
	bl sub_8027DB4
_08079392:
	add sp, #0xc
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807939C: .4byte 0x000001FF
_080793A0: .4byte 0xF9FF0000

	THUMB_FUNC_START UpdateMOVEUNITGfx_Movement
UpdateMOVEUNITGfx_Movement: @ 0x080793A4
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r0, #0x40
	ldrb r0, [r0]
	cmp r0, #0
	bne _08079466
	mov r5, sp
	adds r0, r4, #0
	mov r1, sp
	bl GetMOVEUNITDisplayPosition
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08079466
	mov r0, sp
	ldrh r1, [r0]
	ldr r0, _08079470  @ 0x000001FF
	ands r0, r1
	mov r1, sp
	strh r0, [r1]
	ldrh r1, [r5, #2]
	movs r0, #0xff
	ands r0, r1
	strh r0, [r5, #2]
	adds r0, r4, #0
	adds r0, #0x3f
	ldrb r1, [r0]
	adds r3, r0, #0
	cmp r1, #6
	beq _08079440
	ldr r0, [r4, #0x2c]
	cmp r0, #0
	beq _08079440
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #0xc0
	ands r0, r1
	cmp r0, #0x80
	bne _08079440
	ldr r0, _08079474  @ gUnknown_0202BCF0
	ldrb r0, [r0, #0xd]
	cmp r0, #0
	beq _08079440
	adds r0, r4, #0
	adds r0, #0x4e
	movs r1, #0
	ldrsh r0, [r0, r1]
	adds r1, r4, #0
	adds r1, #0x52
	movs r2, #0
	ldrsh r1, [r1, r2]
	adds r0, r0, r1
	asrs r0, r0, #4
	adds r0, #8
	asrs r0, r0, #4
	ldr r1, _08079478  @ gUnknown_0202E4E8
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	adds r1, r4, #0
	adds r1, #0x4c
	movs r5, #0
	ldrsh r1, [r1, r5]
	adds r2, r4, #0
	adds r2, #0x50
	movs r5, #0
	ldrsh r2, [r2, r5]
	adds r1, r1, r2
	asrs r1, r1, #4
	adds r1, #8
	asrs r1, r1, #4
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _08079466
_08079440:
	ldrb r0, [r3]
	cmp r0, #7
	bne _08079454
	mov r2, sp
	ldrh r1, [r2, #2]
	movs r3, #0x80
	lsls r3, r3, #3
	adds r0, r3, #0
	orrs r0, r1
	strh r0, [r2, #2]
_08079454:
	ldr r0, [r4, #0x30]
	mov r1, sp
	movs r5, #0
	ldrsh r1, [r1, r5]
	mov r2, sp
	movs r3, #2
	ldrsh r2, [r2, r3]
	bl AP_Update
_08079466:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08079470: .4byte 0x000001FF
_08079474: .4byte gUnknown_0202BCF0
_08079478: .4byte gUnknown_0202E4E8

	THUMB_FUNC_START MOVEUNIT6C_GetMovementSpeed
MOVEUNIT6C_GetMovementSpeed: @ 0x0807947C
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x4a
	movs r2, #0
	ldrsh r1, [r0, r2]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08079490
	adds r1, #0x80
_08079490:
	adds r0, r4, #0
	adds r0, #0x44
	ldrb r0, [r0]
	cmp r0, #0
	beq _080794A0
	movs r0, #0x80
	lsls r0, r0, #1
	b _08079530
_080794A0:
	cmp r1, #0x40
	beq _0807951C
	cmp r1, #0
	beq _080794E8
	adds r2, r1, #0
	movs r1, #0x40
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	beq _080794B8
	eors r2, r1
	b _080794D4
_080794B8:
	ldr r0, _080794E0  @ gUnknown_0202BCF0
	adds r0, #0x40
	ldrb r0, [r0]
	lsrs r0, r0, #7
	cmp r0, #0
	bne _080794D2
	ldr r0, _080794E4  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #4]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080794D4
_080794D2:
	lsls r2, r2, #2
_080794D4:
	cmp r2, #0x80
	ble _080794DA
	movs r2, #0x80
_080794DA:
	lsls r0, r2, #0x10
	lsrs r0, r0, #0x10
	b _08079530
	.align 2, 0
_080794E0: .4byte gUnknown_0202BCF0
_080794E4: .4byte gKeyStatusPtr
_080794E8:
	bl sub_8030CC0
	cmp r0, #0
	bne _08079508
	ldr r0, _08079504  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #4]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08079508
	movs r0, #0x80
	b _08079530
	.align 2, 0
_08079504: .4byte gKeyStatusPtr
_08079508:
	ldr r0, _08079518  @ gUnknown_0202BCF0
	adds r0, #0x40
	ldrb r0, [r0]
	lsrs r0, r0, #7
	cmp r0, #0
	beq _0807951C
	movs r0, #0x40
	b _08079530
	.align 2, 0
_08079518: .4byte gUnknown_0202BCF0
_0807951C:
	adds r0, r4, #0
	adds r0, #0x41
	ldrb r0, [r0]
	bl GetROMClassStruct
	ldr r1, _08079538  @ gUnknown_089A2C78
	ldrb r0, [r0, #7]
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #4
_08079530:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08079538: .4byte gUnknown_089A2C78

	THUMB_FUNC_START sub_807953C
sub_807953C: @ 0x0807953C
	push {lr}
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r2, #0x80
	lsls r2, r2, #1
	cmp r1, r2
	bls _08079550
	adds r0, #0x4a
	strh r2, [r0]
	b _08079554
_08079550:
	adds r0, #0x4a
	strh r1, [r0]
_08079554:
	pop {r0}
	bx r0

	THUMB_FUNC_START GetMOVEUNITGraphicsBuffer
GetMOVEUNITGraphicsBuffer: @ 0x08079558
	ldr r1, _0807956C  @ gUnknown_089A2C7A
	adds r0, r0, r1
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #9
	ldr r1, _08079570  @ gUnknown_02004BE0
	adds r0, r0, r1
	bx lr
	.align 2, 0
_0807956C: .4byte gUnknown_089A2C7A
_08079570: .4byte gUnknown_02004BE0

	THUMB_FUNC_START GetMovingMapSpriteGfxPtrFromMOVEUNIT
GetMovingMapSpriteGfxPtrFromMOVEUNIT: @ 0x08079574
	ldr r1, _08079584  @ gUnknown_089A2E00
	adds r0, #0x41
	ldrb r0, [r0]
	subs r0, #1
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r0, [r0]
	bx lr
	.align 2, 0
_08079584: .4byte gUnknown_089A2E00

	THUMB_FUNC_START MMS_GetROMTCS
MMS_GetROMTCS: @ 0x08079588
	lsls r0, r0, #0x10
	ldr r1, _08079598  @ gUnknown_089A2E00
	lsrs r0, r0, #0xd
	adds r1, r1, r0
	subs r1, #4
	ldr r0, [r1]
	bx lr
	.align 2, 0
_08079598: .4byte gUnknown_089A2E00

	THUMB_FUNC_START MOVEUNIT6C_807959C
MOVEUNIT6C_807959C: @ 0x0807959C
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r1, r5, #0
	adds r1, #0x3f
	movs r4, #0
	movs r0, #7
	strb r0, [r1]
	ldr r0, _08079610  @ gUnknown_089A2C80
	adds r1, r5, #0
	bl Proc_Create
	str r5, [r0, #0x54]
	adds r0, #0x64
	movs r1, #0x20
	strh r1, [r0]
	movs r0, #0
	movs r1, #0x10
	movs r2, #0x10
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	ldr r0, [r5, #0x30]
	strh r4, [r0, #0x18]
	ldr r0, [r5, #0x30]
	strh r4, [r0, #0x1a]
	adds r0, r5, #0
	movs r1, #0
	bl sub_8079A74
	ldr r1, [r5, #0x30]
	movs r0, #0xd
	strh r0, [r1, #0x1e]
	ldr r0, _08079614  @ gUnknown_0202BCF0
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080795EE
	movs r0, #0xd6
	bl m4aSongNumStart
_080795EE:
	ldr r2, [r5, #0x2c]
	ldr r0, [r2, #0xc]
	movs r1, #0x80
	lsls r1, r1, #4
	ands r0, r1
	cmp r0, #0
	beq _08079608
	adds r0, r2, #0
	bl TryRemoveUnitFromBallista
	ldr r0, [r5, #0x2c]
	bl HideUnitSMS
_08079608:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08079610: .4byte gUnknown_089A2C80
_08079614: .4byte gUnknown_0202BCF0

	THUMB_FUNC_START BlendTimer6C_MainLoop
BlendTimer6C_MainLoop: @ 0x08079618
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r5, #0
	adds r4, #0x64
	ldrh r1, [r4]
	subs r0, r1, #1
	strh r0, [r4]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x11
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	movs r0, #0
	movs r2, #0x10
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	movs r1, #0
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _0807964C
	ldr r0, [r5, #0x54]
	bl EndMoveunitMaybe
	adds r0, r5, #0
	bl Proc_ClearNativeCallback
_0807964C:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_START sub_8079654
sub_8079654: @ 0x08079654
	push {r4, r5, lr}
	adds r3, r0, #0
	ldr r4, [r3, #0x14]
	movs r5, #0
	adds r2, r3, #0
	adds r2, #0x64
	ldrh r1, [r2]
	movs r0, #7
	ands r0, r1
	cmp r0, #3
	bgt _0807966C
	movs r5, #1
_0807966C:
	adds r4, #0x40
	strb r5, [r4]
	ldrh r0, [r2]
	subs r0, #1
	strh r0, [r2]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _08079686
	adds r0, r3, #0
	bl Proc_ClearNativeCallback
	movs r0, #1
	strb r0, [r4]
_08079686:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_START sub_807968C
sub_807968C: @ 0x0807968C
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x3f
	movs r5, #0
	movs r0, #7
	strb r0, [r1]
	ldr r0, _080796CC  @ gUnknown_089A2C98
	adds r1, r4, #0
	bl Proc_Create
	str r4, [r0, #0x54]
	adds r0, #0x64
	movs r1, #0x40
	strh r1, [r0]
	ldr r0, [r4, #0x30]
	strh r5, [r0, #0x18]
	ldr r0, [r4, #0x30]
	strh r5, [r0, #0x1a]
	ldr r0, _080796D0  @ gUnknown_0202BCF0
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080796C4
	movs r0, #0xd6
	bl m4aSongNumStart
_080796C4:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080796CC: .4byte gUnknown_089A2C98
_080796D0: .4byte gUnknown_0202BCF0

	THUMB_FUNC_START sub_80796D4
sub_80796D4: @ 0x080796D4
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r0, _08079724  @ gUnknown_089A2CA8
	adds r1, r1, r0
	ldrb r0, [r1]
	movs r2, #7
	ands r2, r0
	ldrb r1, [r1]
	lsrs r1, r1, #3
	ldr r4, _08079728  @ gUnknown_030018F8
	ldr r3, _0807972C  @ gUnknown_030018FC
	lsls r2, r2, #2
	movs r0, #0xf
	lsls r0, r2
	str r0, [r3]
	mvns r0, r0
	str r0, [r4]
	movs r2, #0
	lsls r6, r1, #2
	adds r4, r0, #0
	movs r7, #0xe0
	lsls r7, r7, #2
_08079700:
	adds r3, r2, #1
	movs r2, #3
_08079704:
	adds r1, r6, r5
	ldr r0, [r1]
	ands r0, r4
	str r0, [r1]
	adds r5, #0x20
	subs r2, #1
	cmp r2, #0
	bge _08079704
	adds r5, r5, r7
	adds r2, r3, #0
	cmp r2, #3
	ble _08079700
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08079724: .4byte gUnknown_089A2CA8
_08079728: .4byte gUnknown_030018F8
_0807972C: .4byte gUnknown_030018FC

	THUMB_FUNC_START sub_8079730
sub_8079730: @ 0x08079730
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x14]
	adds r0, #0x3c
	ldrb r0, [r0]
	bl GetMOVEUNITGraphicsBuffer
	adds r4, r5, #0
	adds r4, #0x66
	movs r2, #0
	ldrsh r1, [r4, r2]
	bl sub_80796D4
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
	ldr r0, _08079780  @ gUnknown_02004BE0
	ldr r1, _08079784  @ 0x06017000
	movs r2, #0x80
	lsls r2, r2, #5
	bl RegisterTileGraphics
	adds r1, r5, #0
	adds r1, #0x64
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _08079778
	ldr r0, [r5, #0x54]
	bl EndMoveunitMaybe
	adds r0, r5, #0
	bl Proc_ClearNativeCallback
_08079778:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08079780: .4byte gUnknown_02004BE0
_08079784: .4byte 0x06017000

	THUMB_FUNC_START sub_8079788
sub_8079788: @ 0x08079788
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x3f
	movs r5, #0
	movs r0, #7
	strb r0, [r1]
	ldr r0, _080797CC  @ gUnknown_089A2CE8
	adds r1, r4, #0
	bl Proc_Create
	str r4, [r0, #0x54]
	adds r2, r0, #0
	adds r2, #0x64
	movs r1, #0x40
	strh r1, [r2]
	adds r0, #0x66
	strh r5, [r0]
	ldr r0, [r4, #0x30]
	strh r5, [r0, #0x18]
	ldr r0, [r4, #0x30]
	strh r5, [r0, #0x1a]
	ldr r0, _080797D0  @ gUnknown_0202BCF0
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080797C6
	movs r0, #0xd6
	bl m4aSongNumStart
_080797C6:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080797CC: .4byte gUnknown_089A2CE8
_080797D0: .4byte gUnknown_0202BCF0

	THUMB_FUNC_START SetMOVEUNITField40To1
SetMOVEUNITField40To1: @ 0x080797D4
	adds r0, #0x40
	movs r1, #1
	strb r1, [r0]
	bx lr

	THUMB_FUNC_START sub_80797DC
sub_80797DC: @ 0x080797DC
	adds r0, #0x40
	movs r1, #0
	strb r1, [r0]
	bx lr

	THUMB_FUNC_START MOVEUNIT6C_SetDisplayPos
MOVEUNIT6C_SetDisplayPos: @ 0x080797E4
	lsls r1, r1, #4
	adds r3, r0, #0
	adds r3, #0x4c
	strh r1, [r3]
	lsls r2, r2, #4
	adds r0, #0x4e
	strh r2, [r0]
	bx lr

	THUMB_FUNC_START sub_80797F4
sub_80797F4: @ 0x080797F4
	lsls r1, r1, #4
	adds r3, r0, #0
	adds r3, #0x50
	strh r1, [r3]
	lsls r2, r2, #4
	adds r0, #0x52
	strh r2, [r0]
	bx lr

	THUMB_FUNC_START sub_8079804
sub_8079804: @ 0x08079804
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	ldr r2, [r5, #0x30]
	ldr r0, [r5, #0x34]
	adds r3, r5, #0
	adds r3, #0x46
	movs r6, #0xa0
	lsls r6, r6, #7
	adds r1, r6, #0
	ldrh r3, [r3]
	adds r1, r1, r3
	ldrh r0, [r0, #2]
	adds r0, r0, r1
	strh r0, [r2, #0x22]
	ldr r0, [r5, #0x34]
	ldrb r0, [r0, #1]
	adds r0, #0x10
	lsls r0, r0, #5
	ldr r1, _08079850  @ gPaletteBuffer
	adds r0, r0, r1
	movs r1, #0xa8
	lsls r1, r1, #2
	movs r2, #0x20
	bl CopyToPaletteBuffer
	ldr r0, _08079854  @ gUnknown_089A2920
	lsls r4, r4, #2
	adds r4, r4, r0
	ldr r0, [r4]
	movs r1, #0x15
	movs r2, #8
	adds r3, r5, #0
	bl sub_8013928
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08079850: .4byte gPaletteBuffer
_08079854: .4byte gUnknown_089A2920

	THUMB_FUNC_START sub_8079858
sub_8079858: @ 0x08079858
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x34]
	ldrb r0, [r0, #1]
	adds r0, #0x10
	lsls r0, r0, #5
	ldr r1, _08079884  @ gPaletteBuffer
	adds r0, r0, r1
	movs r1, #0x15
	movs r2, #8
	adds r3, r4, #0
	bl sub_8013928
	ldr r0, _08079888  @ gUnknown_089A2CF8
	movs r1, #3
	bl Proc_Create
	str r4, [r0, #0x54]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08079884: .4byte gPaletteBuffer
_08079888: .4byte gUnknown_089A2CF8

	THUMB_FUNC_START sub_807988C
sub_807988C: @ 0x0807988C
	push {r4, lr}
	ldr r1, [r0, #0x54]
	ldr r4, [r1, #0x30]
	ldr r3, [r1, #0x34]
	ldrb r2, [r3, #1]
	movs r0, #0xf
	ands r0, r2
	lsls r0, r0, #0xc
	ldrh r3, [r3, #2]
	adds r0, r0, r3
	adds r1, #0x46
	ldrh r1, [r1]
	adds r1, r1, r0
	strh r1, [r4, #0x22]
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_START SetupSomeMoveunitAnim
SetupSomeMoveunitAnim: @ 0x080798B0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x30]
	movs r1, #4
	bl AP_SwitchAnimation
	ldr r1, [r4, #0x30]
	movs r0, #0
	strh r0, [r1, #0x18]
	ldr r1, [r4, #0x30]
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r1, #0x1a]
	ldr r0, _080798DC  @ TCS_HaltAnim2
	ldr r1, [r4, #0x30]
	movs r2, #0x1e
	bl SetupFutureCall
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080798DC: .4byte TCS_HaltAnim2

	THUMB_FUNC_START TCS_HaltAnim2
TCS_HaltAnim2: @ 0x080798E0
	movs r1, #0
	strh r1, [r0, #0x18]
	strh r1, [r0, #0x1a]
	bx lr

	THUMB_FUNC_START sub_80798E8
sub_80798E8: @ 0x080798E8
	push {lr}
	ldr r2, [r0, #0x30]
	movs r1, #0
	strh r1, [r2, #0x18]
	ldr r2, [r0, #0x30]
	movs r1, #0x80
	lsls r1, r1, #1
	strh r1, [r2, #0x1a]
	ldr r2, _08079908  @ sub_807990C
	ldr r1, [r0, #0x30]
	adds r0, r2, #0
	movs r2, #0x1e
	bl SetupFutureCall
	pop {r0}
	bx r0
	.align 2, 0
_08079908: .4byte sub_807990C

	THUMB_FUNC_START sub_807990C
sub_807990C: @ 0x0807990C
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r1, _08079940  @ gUnknown_0203E1F0
	adds r0, r1, #0
	adds r0, #0x58
	ldrb r5, [r0]
	movs r4, #1
	subs r4, r4, r5
	ldr r0, [r1, #4]
	adds r0, #0x4a
	ldrh r0, [r0]
	bl GetSpellAssocFacing
	adds r2, r0, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	adds r0, r5, #0
	adds r1, r4, #0
	bl SetBattleAnimFacing
	movs r0, #0
	strh r0, [r6, #0x18]
	strh r0, [r6, #0x1a]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08079940: .4byte gUnknown_0203E1F0

	THUMB_FUNC_START MOVEUNIT_Begin20FramesFastAnim
MOVEUNIT_Begin20FramesFastAnim: @ 0x08079944
	push {lr}
	ldr r2, [r0, #0x30]
	movs r1, #0
	strh r1, [r2, #0x18]
	ldr r2, [r0, #0x30]
	movs r1, #0x40
	strh r1, [r2, #0x1a]
	ldr r2, _08079964  @ TCS_HaltAnim
	ldr r1, [r0, #0x30]
	adds r0, r2, #0
	movs r2, #0x14
	bl SetupFutureCall
	pop {r0}
	bx r0
	.align 2, 0
_08079964: .4byte TCS_HaltAnim

	THUMB_FUNC_START TCS_HaltAnim
TCS_HaltAnim: @ 0x08079968
	movs r1, #0
	strh r1, [r0, #0x18]
	strh r1, [r0, #0x1a]
	bx lr

	THUMB_FUNC_START sub_8079970
sub_8079970: @ 0x08079970
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08079998  @ gUnknown_089A2920
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r0, [r1]
	movs r1, #0xa8
	lsls r1, r1, #2
	movs r2, #0x20
	bl CopyToPaletteBuffer
	ldr r0, _0807999C  @ gUnknown_089A2D10
	adds r1, r4, #0
	bl Proc_Create
	str r4, [r0, #0x2c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08079998: .4byte gUnknown_089A2920
_0807999C: .4byte gUnknown_089A2D10

	THUMB_FUNC_START sub_80799A0
sub_80799A0: @ 0x080799A0
	adds r0, #0x30
	movs r1, #0
	strb r1, [r0]
	bx lr

	THUMB_FUNC_START sub_80799A8
sub_80799A8: @ 0x080799A8
	push {r4, lr}
	ldr r0, [r0, #0x2c]
	ldr r3, [r0, #0x30]
	ldr r2, [r0, #0x34]
	adds r0, #0x46
	movs r4, #0xa0
	lsls r4, r4, #7
	adds r1, r4, #0
	ldrh r0, [r0]
	adds r1, r1, r0
	ldrh r0, [r2, #2]
	adds r0, r0, r1
	strh r0, [r3, #0x22]
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_START sub_80799C8
sub_80799C8: @ 0x080799C8
	push {r4, lr}
	ldr r1, [r0, #0x2c]
	ldr r4, [r1, #0x30]
	ldr r3, [r1, #0x34]
	ldrb r2, [r3, #1]
	movs r0, #0xf
	ands r0, r2
	lsls r0, r0, #0xc
	ldrh r3, [r3, #2]
	adds r0, r0, r3
	adds r1, #0x46
	ldrh r1, [r1]
	adds r1, r1, r0
	strh r1, [r4, #0x22]
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_START sub_80799EC
sub_80799EC: @ 0x080799EC
	push {lr}
	adds r3, r0, #0
	ldr r0, [r3, #0x2c]
	ldr r0, [r0, #0x34]
	ldrb r0, [r0, #1]
	adds r0, #0x10
	lsls r0, r0, #5
	ldr r1, _08079A0C  @ gPaletteBuffer
	adds r0, r0, r1
	movs r1, #0x15
	movs r2, #0x14
	bl sub_8013928
	pop {r0}
	bx r0
	.align 2, 0
_08079A0C: .4byte gPaletteBuffer

	THUMB_FUNC_START sub_8079A10
sub_8079A10: @ 0x08079A10
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r5, #0
	adds r4, #0x30
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	ldr r2, [r5, #0x2c]
	movs r1, #1
	ands r0, r1
	subs r1, #3
	cmp r0, #0
	beq _08079A2C
	movs r1, #2
_08079A2C:
	adds r0, r2, #0
	movs r2, #0
	bl sub_80797F4
	ldrb r0, [r4]
	cmp r0, #0xb
	bls _08079A4A
	ldr r0, [r5, #0x2c]
	movs r1, #0
	movs r2, #0
	bl sub_80797F4
	adds r0, r5, #0
	bl Proc_ClearNativeCallback
_08079A4A:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_START sub_8079A50
sub_8079A50: @ 0x08079A50
	push {r4, lr}
	ldr r1, [r0, #0x2c]
	ldr r4, [r1, #0x30]
	ldr r3, [r1, #0x34]
	ldrb r2, [r3, #1]
	movs r0, #0xf
	ands r0, r2
	lsls r0, r0, #0xc
	ldrh r3, [r3, #2]
	adds r0, r0, r3
	adds r1, #0x46
	ldrh r1, [r1]
	adds r1, r1, r0
	strh r1, [r4, #0x22]
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_START sub_8079A74
sub_8079A74: @ 0x08079A74
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, _08079AC8  @ gUnknown_089A2920
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r0, [r1]
	movs r1, #0xa8
	lsls r1, r1, #2
	movs r2, #0x20
	bl CopyToPaletteBuffer
	ldr r2, [r4, #0x30]
	ldr r0, [r4, #0x34]
	adds r3, r4, #0
	adds r3, #0x46
	movs r5, #0xa0
	lsls r5, r5, #7
	adds r1, r5, #0
	ldrh r3, [r3]
	adds r1, r1, r3
	ldrh r0, [r0, #2]
	adds r0, r0, r1
	strh r0, [r2, #0x22]
	ldr r0, [r4, #0x34]
	ldrb r0, [r0, #1]
	adds r0, #0x10
	lsls r0, r0, #5
	ldr r1, _08079ACC  @ gPaletteBuffer
	adds r0, r0, r1
	movs r1, #0x15
	movs r2, #0x14
	adds r3, r4, #0
	bl sub_8013928
	ldr r0, _08079AD0  @ gUnknown_089A2D98
	adds r1, r4, #0
	bl Proc_Create
	str r4, [r0, #0x2c]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08079AC8: .4byte gUnknown_089A2920
_08079ACC: .4byte gPaletteBuffer
_08079AD0: .4byte gUnknown_089A2D98

	THUMB_FUNC_START sub_8079AD4
sub_8079AD4: @ 0x08079AD4
	push {r4, lr}
	ldr r1, [r0, #0x2c]
	ldr r4, [r1, #0x30]
	ldr r3, [r1, #0x34]
	ldrb r2, [r3, #1]
	movs r0, #0xf
	ands r0, r2
	lsls r0, r0, #0xc
	ldrh r3, [r3, #2]
	adds r0, r0, r3
	adds r1, #0x46
	ldrh r1, [r1]
	adds r1, r1, r0
	strh r1, [r4, #0x22]
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_START SetAllMOVEUNITField44To1
SetAllMOVEUNITField44To1: @ 0x08079AF8
	push {lr}
	ldr r0, _08079B08  @ gUnknown_089A2C48
	ldr r1, _08079B0C  @ SetMOVEUNITField44To1
	bl Proc_ForEachWithScript
	pop {r0}
	bx r0
	.align 2, 0
_08079B08: .4byte gUnknown_089A2C48
_08079B0C: .4byte SetMOVEUNITField44To1

	THUMB_FUNC_START SetMOVEUNITField44To1
SetMOVEUNITField44To1: @ 0x08079B10
	adds r0, #0x44
	movs r1, #1
	strb r1, [r0]
	bx lr

	THUMB_FUNC_START ChangeMOVEUNITDataMaybe
ChangeMOVEUNITDataMaybe: @ 0x08079B18
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r6, r2, #0
	ldr r0, [r4, #0x30]
	movs r2, #0
	strh r2, [r0, #0x18]
	ldr r0, [r4, #0x30]
	strh r2, [r0, #0x1a]
	adds r0, r4, #0
	adds r0, #0x41
	strb r1, [r0]
	ldr r5, [r4, #0x30]
	ldrb r0, [r0]
	bl MMS_GetROMTCS
	adds r1, r0, #0
	adds r0, r5, #0
	bl AP_SetDefinition
	adds r0, r4, #0
	bl GetMovingMapSpriteGfxPtrFromMOVEUNIT
	adds r5, r0, #0
	ldr r0, [r4, #0x34]
	ldrb r0, [r0]
	bl GetMOVEUNITGraphicsBuffer
	adds r1, r0, #0
	adds r0, r5, #0
	bl CopyDataWithPossibleUncomp
	ldr r0, [r4, #0x34]
	ldrb r1, [r0, #1]
	adds r1, #0x10
	lsls r1, r1, #5
	adds r0, r6, #0
	movs r2, #0x20
	bl CopyToPaletteBuffer
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_START sub_8079B6C
sub_8079B6C: @ 0x08079B6C
	push {r4, lr}
	ldr r2, [r0, #0x34]
	strb r1, [r2, #1]
	ldr r4, [r0, #0x30]
	ldr r3, [r0, #0x34]
	movs r2, #0xf
	ands r2, r1
	lsls r2, r2, #0xc
	ldrh r3, [r3, #2]
	adds r2, r2, r3
	adds r0, #0x46
	ldrh r0, [r0]
	adds r0, r0, r2
	strh r0, [r4, #0x22]
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_START GetMoveunitByIndex
GetMoveunitByIndex: @ 0x08079B90
	push {lr}
	ldr r2, _08079BAC  @ gUnknown_03001900
	movs r1, #0x4c
	muls r1, r0, r1
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, #0
	beq _08079BB0
	adds r0, r2, #0
	adds r0, #0x48
	adds r0, r1, r0
	ldr r0, [r0]
	b _08079BB2
	.align 2, 0
_08079BAC: .4byte gUnknown_03001900
_08079BB0:
	movs r0, #0
_08079BB2:
	pop {r1}
	bx r1

	THUMB_FUNC_START GetExistingMoveunitForUnit
GetExistingMoveunitForUnit: @ 0x08079BB8
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r4, #0
_08079BBE:
	adds r0, r4, #0
	bl GetMoveunitByIndex
	adds r1, r0, #0
	ldr r0, [r1, #0x2c]
	cmp r0, r5
	bne _08079BD0
	adds r0, r1, #0
	b _08079BD8
_08079BD0:
	adds r4, #1
	cmp r4, #3
	ble _08079BBE
	movs r0, #0
_08079BD8:
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_START sub_8079BE0
sub_8079BE0: @ 0x08079BE0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x18
	movs r0, #0
	str r0, [sp, #0x10]
	add r0, sp, #0x10
	ldr r2, _08079CD4  @ 0x05000004
	mov r1, sp
	bl CpuSet
	movs r5, #0
	movs r1, #0
_08079BFE:
	lsls r0, r1, #0x18
	asrs r4, r0, #0x18
	adds r0, r4, #0
	bl GetMoveunitByIndex
	adds r2, r0, #0
	cmp r2, #0
	beq _08079C1E
	lsls r0, r5, #0x18
	asrs r0, r0, #0x18
	lsls r1, r0, #2
	add r1, sp
	str r2, [r1]
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
_08079C1E:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #3
	ble _08079BFE
	movs r1, #0
	lsls r0, r5, #0x18
	asrs r2, r0, #0x18
	subs r3, r2, #1
	mov r8, r0
	cmp r1, r3
	bge _08079C98
	mov sl, r2
	mov r9, r3
_08079C3C:
	lsls r0, r1, #0x18
	asrs r3, r0, #0x18
	movs r1, #0x80
	lsls r1, r1, #0x11
	adds r2, r0, r1
	asrs r1, r2, #0x18
	mov ip, r0
	cmp r1, sl
	bge _08079C8A
	lsls r0, r3, #2
	mov r7, sp
	adds r6, r7, r0
	mov r0, r8
	asrs r0, r0, #0x18
	str r0, [sp, #0x14]
_08079C5A:
	asrs r5, r2, #0x18
	lsls r0, r5, #2
	mov r1, sp
	adds r4, r1, r0
	ldr r3, [r4]
	adds r1, r3, #0
	adds r1, #0x4e
	ldr r2, [r6]
	adds r0, r2, #0
	adds r0, #0x4e
	movs r7, #0
	ldrsh r1, [r1, r7]
	movs r7, #0
	ldrsh r0, [r0, r7]
	cmp r1, r0
	bge _08079C7E
	str r3, [r6]
	str r2, [r4]
_08079C7E:
	adds r0, r5, #1
	lsls r2, r0, #0x18
	asrs r0, r2, #0x18
	ldr r1, [sp, #0x14]
	cmp r0, r1
	blt _08079C5A
_08079C8A:
	movs r0, #0x80
	lsls r0, r0, #0x11
	add r0, ip
	lsrs r1, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, r9
	blt _08079C3C
_08079C98:
	movs r1, #0
	mov r2, r8
	asrs r0, r2, #0x18
	cmp r1, r0
	bge _08079CC2
	movs r4, #0xa
	adds r3, r0, #0
_08079CA6:
	lsls r0, r1, #0x18
	asrs r0, r0, #0x18
	lsls r1, r0, #2
	add r1, sp
	ldr r1, [r1]
	ldr r2, [r1, #0x30]
	subs r1, r4, r0
	strh r1, [r2, #0x1e]
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, r3
	blt _08079CA6
_08079CC2:
	add sp, #0x18
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08079CD4: .4byte 0x05000004

.align 2, 0
