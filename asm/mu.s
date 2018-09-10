	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	@ "MOVEUNIT" proc and related functions
	@ Handles managing and displaying moving map sprites

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
