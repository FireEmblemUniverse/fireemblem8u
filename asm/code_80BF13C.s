	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	THUMB_FUNC_START WM_PutClassSprite
WM_PutClassSprite: @ 0x080BF4D0
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #4
	adds r5, r0, #0
	adds r6, r1, #0
	mov r8, r2
	adds r4, r3, #0
	ldr r0, _080BF500  @ gProcScr_WorldMapMain
	bl Proc_Find
	ldr r0, [r0, #0x54]
	str r4, [sp]
	adds r1, r5, #0
	adds r2, r6, #0
	mov r3, r8
	bl MapMU_SetUnitClass
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080BF500: .4byte gProcScr_WorldMapMain

	THUMB_FUNC_END WM_PutClassSprite

	THUMB_FUNC_START WM_PutCharSprite
WM_PutCharSprite: @ 0x080BF504
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #4
	adds r5, r0, #0
	adds r6, r1, #0
	mov r8, r2
	adds r4, r3, #0
	ldr r0, _080BF534  @ gProcScr_WorldMapMain
	bl Proc_Find
	ldr r0, [r0, #0x54]
	str r4, [sp]
	adds r1, r5, #0
	adds r2, r6, #0
	mov r3, r8
	bl MapMU_SetUnitChar
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080BF534: .4byte gProcScr_WorldMapMain

	THUMB_FUNC_END WM_PutCharSprite

	THUMB_FUNC_START WM_RemoveUnit
WM_RemoveUnit: @ 0x080BF538
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080BF550  @ gProcScr_WorldMapMain
	bl Proc_Find
	ldr r0, [r0, #0x54]
	adds r1, r4, #0
	bl GmMu_RemoveUnit
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BF550: .4byte gProcScr_WorldMapMain

	THUMB_FUNC_END WM_RemoveUnit

	THUMB_FUNC_START sub_80BF554
sub_80BF554: @ 0x080BF554
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080BF56C  @ gProcScr_WorldMapMain
	bl Proc_Find
	ldr r0, [r0, #0x54]
	adds r1, r4, #0
	bl GmMu_ShowUnit
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BF56C: .4byte gProcScr_WorldMapMain

	THUMB_FUNC_END sub_80BF554

	THUMB_FUNC_START sub_80BF570
sub_80BF570: @ 0x080BF570
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080BF588  @ gProcScr_WorldMapMain
	bl Proc_Find
	ldr r0, [r0, #0x54]
	adds r1, r4, #0
	bl GmMu_HideUnit
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BF588: .4byte gProcScr_WorldMapMain

	THUMB_FUNC_END sub_80BF570

	THUMB_FUNC_START WM_DrawPath
WM_DrawPath: @ 0x080BF58C
	push {r4, lr}
	adds r2, r0, #0
	adds r4, r1, #0
	ldr r0, _080BF5B8  @ gGMData
	adds r1, r0, #0
	adds r1, #0xa4
	bl AddGmPath
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080BF5B2
	ldr r0, _080BF5BC  @ gProcScr_WorldMapMain
	bl Proc_Find
	ldr r0, [r0, #0x44]
	ldr r0, [r0, #0x4c]
	adds r1, r4, #0
	bl MapRoute_BeginRouteTransition
_080BF5B2:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BF5B8: .4byte gGMData
_080BF5BC: .4byte gProcScr_WorldMapMain

	THUMB_FUNC_END WM_DrawPath

	THUMB_FUNC_START nullsub_50
nullsub_50: @ 0x080BF5C0
	bx lr

	THUMB_FUNC_END nullsub_50

	THUMB_FUNC_START sub_80BF5C4
sub_80BF5C4: @ 0x080BF5C4
	movs r1, #0
	str r1, [r0, #0x30]
	adds r1, r0, #0
	adds r1, #0x35
	ldrb r1, [r1]
	lsls r1, r1, #1
	ldr r2, _080BF5D8  @ gPaletteBuffer
	adds r1, r1, r2
	str r1, [r0, #0x40]
	bx lr
	.align 2, 0
_080BF5D8: .4byte gPaletteBuffer

	THUMB_FUNC_END sub_80BF5C4

	THUMB_FUNC_START sub_80BF5DC
sub_80BF5DC: @ 0x080BF5DC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	adds r5, r0, #0
	ldr r0, [r5, #0x30]
	adds r0, #1
	str r0, [r5, #0x30]
	ldr r1, [r5, #0x2c]
	cmp r0, r1
	bge _080BF69A
	lsls r0, r0, #6
	bl __divsi3
	mov r9, r0
	movs r7, #0
	adds r0, r5, #0
	adds r0, #0x34
	mov sl, r0
	ldrb r0, [r0]
	cmp r7, r0
	bge _080BF6AE
	movs r1, #0x1f
	mov ip, r1
_080BF60E:
	ldr r0, [r5, #0x38]
	lsls r6, r7, #1
	adds r0, r6, r0
	ldrh r3, [r0]
	movs r2, #0x1f
	ands r2, r3
	ldr r0, [r5, #0x3c]
	adds r0, r6, r0
	ldrh r1, [r0]
	movs r0, #0x1f
	ands r0, r1
	subs r0, r0, r2
	mov r4, r9
	muls r4, r0, r4
	adds r0, r4, #0
	cmp r0, #0
	bge _080BF632
	adds r0, #0x3f
_080BF632:
	asrs r0, r0, #6
	adds r0, r2, r0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	lsls r4, r3, #0x10
	lsrs r2, r4, #0x15
	mov r0, ip
	ands r2, r0
	lsls r3, r1, #0x10
	lsrs r0, r3, #0x15
	mov r1, ip
	ands r0, r1
	subs r0, r0, r2
	mov r1, r9
	muls r1, r0, r1
	adds r0, r1, #0
	cmp r0, #0
	bge _080BF65A
	adds r0, #0x3f
_080BF65A:
	asrs r0, r0, #6
	adds r0, r2, r0
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	lsrs r2, r4, #0x1a
	mov r4, ip
	ands r2, r4
	lsrs r0, r3, #0x1a
	ands r0, r4
	subs r0, r0, r2
	mov r3, r9
	muls r3, r0, r3
	adds r0, r3, #0
	cmp r0, #0
	bge _080BF67A
	adds r0, #0x3f
_080BF67A:
	asrs r0, r0, #6
	adds r0, r2, r0
	lsls r0, r0, #0x10
	ldr r2, [r5, #0x40]
	adds r2, r6, r2
	lsrs r0, r0, #6
	lsls r1, r1, #5
	adds r0, r0, r1
	add r0, r8
	strh r0, [r2]
	adds r7, #1
	mov r4, sl
	ldrb r4, [r4]
	cmp r7, r4
	blt _080BF60E
	b _080BF6AE
_080BF69A:
	ldr r0, [r5, #0x3c]
	ldr r1, [r5, #0x40]
	adds r2, r5, #0
	adds r2, #0x34
	ldrb r2, [r2]
	bl CpuSet
	adds r0, r5, #0
	bl Proc_Break
_080BF6AE:
	bl EnablePaletteSync
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80BF5DC

	THUMB_FUNC_START sub_80BF6C0
sub_80BF6C0: @ 0x080BF6C0
	push {r4, lr}
	adds r2, r0, #0
	adds r4, r1, #0
	ldr r0, [r4, #0xc]
	cmp r0, #0
	ble _080BF710
	cmp r2, #0
	beq _080BF6E0
	ldr r0, _080BF6DC  @ gUnknown_08A3E55C
	adds r1, r2, #0
	bl Proc_StartBlocking
	b _080BF6E8
	.align 2, 0
_080BF6DC: .4byte gUnknown_08A3E55C
_080BF6E0:
	ldr r0, _080BF70C  @ gUnknown_08A3E55C
	movs r1, #3
	bl Proc_Start
_080BF6E8:
	adds r2, r0, #0
	ldr r0, [r4, #0xc]
	str r0, [r2, #0x2c]
	ldrb r1, [r4, #8]
	adds r0, r2, #0
	adds r0, #0x34
	strb r1, [r0]
	ldrb r0, [r4, #9]
	adds r1, r2, #0
	adds r1, #0x35
	strb r0, [r1]
	ldr r0, [r4]
	str r0, [r2, #0x38]
	ldr r0, [r4, #4]
	str r0, [r2, #0x3c]
	adds r0, r2, #0
	b _080BF726
	.align 2, 0
_080BF70C: .4byte gUnknown_08A3E55C
_080BF710:
	ldr r0, [r4, #4]
	ldrb r1, [r4, #9]
	lsls r1, r1, #1
	ldr r2, _080BF72C  @ gPaletteBuffer
	adds r1, r1, r2
	ldrb r2, [r4, #8]
	bl CpuSet
	bl EnablePaletteSync
	movs r0, #0
_080BF726:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080BF72C: .4byte gPaletteBuffer

	THUMB_FUNC_END sub_80BF6C0

	THUMB_FUNC_START sub_80BF730
sub_80BF730: @ 0x080BF730
	push {lr}
	ldr r0, _080BF744  @ gUnknown_08A3E55C
	bl Proc_Find
	cmp r0, #0
	beq _080BF73E
	movs r0, #1
_080BF73E:
	pop {r1}
	bx r1
	.align 2, 0
_080BF744: .4byte gUnknown_08A3E55C

	THUMB_FUNC_END sub_80BF730

	THUMB_FUNC_START sub_80BF748
sub_80BF748: @ 0x080BF748
	push {r4, lr}
	ldr r4, _080BF780  @ gUnknown_08A3E55C
	adds r0, r4, #0
	bl Proc_Find
	adds r3, r0, #0
	cmp r3, #0
	beq _080BF77A
	ldr r0, [r3, #0x3c]
	adds r1, r3, #0
	adds r1, #0x35
	ldrb r1, [r1]
	lsls r1, r1, #1
	ldr r2, _080BF784  @ gPaletteBuffer
	adds r1, r1, r2
	adds r2, r3, #0
	adds r2, #0x34
	ldrb r2, [r2]
	bl CpuSet
	bl EnablePaletteSync
	adds r0, r4, #0
	bl Proc_EndEach
_080BF77A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BF780: .4byte gUnknown_08A3E55C
_080BF784: .4byte gPaletteBuffer

	THUMB_FUNC_END sub_80BF748

	THUMB_FUNC_START sub_80BF788
sub_80BF788: @ 0x080BF788
	push {lr}
	sub sp, #0x10
	ldr r2, _080BF7AC  @ gUnknown_08A95FE4
	str r2, [sp]
	ldr r2, _080BF7B0  @ gUnknown_08A95F64
	str r2, [sp, #4]
	mov r3, sp
	movs r2, #0x90
	strb r2, [r3, #9]
	movs r2, #0x40
	strb r2, [r3, #8]
	str r1, [sp, #0xc]
	mov r1, sp
	bl sub_80BF6C0
	add sp, #0x10
	pop {r1}
	bx r1
	.align 2, 0
_080BF7AC: .4byte gUnknown_08A95FE4
_080BF7B0: .4byte gUnknown_08A95F64

	THUMB_FUNC_END sub_80BF788

	THUMB_FUNC_START sub_80BF7B4
sub_80BF7B4: @ 0x080BF7B4
	ldr r3, _080BF7D8  @ gLCDControlBuffer
	ldr r1, [r3, #0x3c]
	ldr r2, [r3, #0x40]
	str r1, [r0]
	str r2, [r0, #4]
	adds r1, r3, #0
	adds r1, #0x44
	ldrb r1, [r1]
	strb r1, [r0, #8]
	adds r1, r3, #0
	adds r1, #0x45
	ldrb r1, [r1]
	strb r1, [r0, #9]
	adds r1, r3, #0
	adds r1, #0x46
	ldrb r1, [r1]
	strb r1, [r0, #0xa]
	bx lr
	.align 2, 0
_080BF7D8: .4byte gLCDControlBuffer

	THUMB_FUNC_END sub_80BF7B4

	THUMB_FUNC_START sub_80BF7DC
sub_80BF7DC: @ 0x080BF7DC
	ldr r3, _080BF800  @ gLCDControlBuffer
	ldr r1, [r0]
	ldr r2, [r0, #4]
	str r1, [r3, #0x3c]
	str r2, [r3, #0x40]
	ldrb r2, [r0, #8]
	adds r1, r3, #0
	adds r1, #0x44
	strb r2, [r1]
	ldrb r1, [r0, #9]
	adds r2, r3, #0
	adds r2, #0x45
	strb r1, [r2]
	ldrb r1, [r0, #0xa]
	adds r0, r3, #0
	adds r0, #0x46
	strb r1, [r0]
	bx lr
	.align 2, 0
_080BF800: .4byte gLCDControlBuffer

	THUMB_FUNC_END sub_80BF7DC

	THUMB_FUNC_START sub_80BF804
sub_80BF804: @ 0x080BF804
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r5, _080BF888  @ gProcScr_WorldMapMain
	adds r0, r5, #0
	bl Proc_Find
	ldr r3, [r0, #0x48]
	adds r4, r6, #0
	adds r4, #0x29
	ldrb r2, [r4]
	lsrs r0, r2, #5
	lsls r0, r0, #2
	adds r3, #0x34
	adds r3, r3, r0
	movs r0, #0x1f
	ands r2, r0
	movs r1, #1
	lsls r1, r2
	ldr r0, [r3]
	bics r0, r1
	str r0, [r3]
	bl EnablePaletteSync
	ldr r3, _080BF88C  @ gGMData
	ldrb r1, [r4]
	lsls r1, r1, #2
	adds r1, r1, r3
	adds r1, #0x30
	ldrb r2, [r1]
	movs r0, #1
	orrs r0, r2
	strb r0, [r1]
	ldrb r0, [r4]
	lsls r0, r0, #2
	adds r0, r0, r3
	adds r0, #0x30
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080BF876
	adds r0, r5, #0
	bl Proc_Find
	ldr r0, [r0, #0x48]
	ldrb r1, [r4]
	adds r0, #0x33
	strb r1, [r0]
	adds r0, r5, #0
	bl Proc_Find
	ldr r1, [r0, #0x48]
	adds r1, #0x32
	ldrb r0, [r1]
	movs r2, #2
	orrs r0, r2
	strb r0, [r1]
_080BF876:
	bl sub_80C13D8
	adds r0, r6, #0
	adds r0, #0x30
	bl sub_80BF7DC
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080BF888: .4byte gProcScr_WorldMapMain
_080BF88C: .4byte gGMData

	THUMB_FUNC_END sub_80BF804

	THUMB_FUNC_START sub_80BF890
sub_80BF890: @ 0x080BF890
	push {r4, lr}
	sub sp, #4
	adds r0, #0x30
	bl sub_80BF7B4
	movs r4, #0
	str r4, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl SetBlendTargetA
	str r4, [sp]
	movs r0, #1
	movs r1, #1
	movs r2, #1
	movs r3, #1
	bl SetBlendTargetB
	movs r0, #0
	bl SetBlendBackdropA
	movs r0, #0
	bl SetBlendBackdropB
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80BF890

	THUMB_FUNC_START sub_80BF8CC
sub_80BF8CC: @ 0x080BF8CC
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r4, _080BF95C  @ gGMData
	adds r6, r5, #0
	adds r6, #0x29
	ldrb r1, [r6]
	lsls r1, r1, #2
	adds r1, r1, r4
	adds r1, #0x30
	ldrb r2, [r1]
	movs r0, #1
	orrs r0, r2
	strb r0, [r1]
	ldr r7, _080BF960  @ gProcScr_WorldMapMain
	adds r0, r7, #0
	bl Proc_Find
	ldr r3, [r0, #0x48]
	ldrb r2, [r6]
	lsrs r0, r2, #5
	lsls r0, r0, #2
	adds r3, #0x34
	adds r3, r3, r0
	movs r0, #0x1f
	ands r2, r0
	movs r1, #1
	lsls r1, r2
	ldr r0, [r3]
	orrs r0, r1
	str r0, [r3]
	ldrb r0, [r6]
	lsls r0, r0, #2
	adds r0, r0, r4
	adds r0, #0x30
	ldrb r1, [r0]
	movs r4, #2
	adds r0, r4, #0
	ands r0, r1
	cmp r0, #0
	beq _080BF93C
	adds r0, r7, #0
	bl Proc_Find
	ldr r0, [r0, #0x48]
	ldrb r1, [r6]
	adds r0, #0x33
	strb r1, [r0]
	adds r0, r7, #0
	bl Proc_Find
	ldr r1, [r0, #0x48]
	adds r1, #0x32
	ldrb r0, [r1]
	movs r2, #2
	orrs r0, r2
	strb r0, [r1]
_080BF93C:
	movs r0, #0
	movs r1, #0
	movs r2, #0x10
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	adds r0, r5, #0
	adds r0, #0x2a
	ldrb r2, [r0]
	cmp r2, #0
	beq _080BF964
	cmp r2, #1
	beq _080BF96C
	adds r0, #1
	b _080BF972
	.align 2, 0
_080BF95C: .4byte gGMData
_080BF960: .4byte gProcScr_WorldMapMain
_080BF964:
	adds r0, r5, #0
	adds r0, #0x2b
	strb r4, [r0]
	b _080BF972
_080BF96C:
	adds r0, r5, #0
	adds r0, #0x2b
	strb r2, [r0]
_080BF972:
	ldrb r1, [r0]
	adds r0, r5, #0
	adds r0, #0x2c
	movs r2, #0
	strb r1, [r0]
	adds r0, #1
	strb r2, [r0]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80BF8CC

	THUMB_FUNC_START sub_80BF988
sub_80BF988: @ 0x080BF988
	push {r4, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x2c
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	cmp r0, #0
	bgt _080BFA10
	adds r0, r4, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	cmp r0, #0
	beq _080BF9AE
	cmp r0, #1
	beq _080BF9B8
	adds r1, #1
	b _080BF9C2
_080BF9AE:
	adds r1, r4, #0
	adds r1, #0x2d
	ldrb r0, [r1]
	adds r0, #1
	b _080BF9C0
_080BF9B8:
	adds r1, r4, #0
	adds r1, #0x2d
	ldrb r0, [r1]
	adds r0, #2
_080BF9C0:
	strb r0, [r1]
_080BF9C2:
	ldrb r0, [r1]
	cmp r0, #0xf
	bhi _080BF9E6
	adds r1, r0, #0
	movs r2, #0x10
	subs r2, r2, r1
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	movs r0, #0
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	adds r0, r4, #0
	adds r0, #0x2b
	ldrb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	b _080BFA10
_080BF9E6:
	ldr r0, _080BFA18  @ gProcScr_WorldMapMain
	bl Proc_Find
	ldr r3, [r0, #0x48]
	adds r0, r4, #0
	adds r0, #0x29
	ldrb r2, [r0]
	lsrs r0, r2, #5
	lsls r0, r0, #2
	adds r3, #0x34
	adds r3, r3, r0
	movs r0, #0x1f
	ands r2, r0
	movs r1, #1
	lsls r1, r2
	ldr r0, [r3]
	bics r0, r1
	str r0, [r3]
	adds r0, r4, #0
	bl Proc_Break
_080BFA10:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BFA18: .4byte gProcScr_WorldMapMain

	THUMB_FUNC_END sub_80BF988

	THUMB_FUNC_START sub_80BFA1C
sub_80BFA1C: @ 0x080BFA1C
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r1, _080BFA40  @ gGMData
	adds r0, #0x29
	ldrb r2, [r0]
	lsls r0, r2, #2
	adds r0, r0, r1
	adds r0, #0x30
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080BFA48
	lsls r0, r2, #5
	ldr r1, _080BFA44  @ gWMNodeData
	adds r0, r0, r1
	ldrb r0, [r0, #2]
	b _080BFA50
	.align 2, 0
_080BFA40: .4byte gGMData
_080BFA44: .4byte gWMNodeData
_080BFA48:
	lsls r0, r2, #5
	ldr r1, _080BFA6C  @ gWMNodeData
	adds r0, r0, r1
	ldrb r0, [r0, #3]
_080BFA50:
	lsls r0, r0, #4
	ldr r1, _080BFA70  @ gWMNodeIconData
	adds r6, r0, r1
	movs r0, #0xa
	ldrsb r0, [r6, r0]
	cmp r0, #0x10
	beq _080BFA74
	cmp r0, #0x10
	ble _080BFA66
	cmp r0, #0x20
	beq _080BFA78
_080BFA66:
	movs r1, #0
	b _080BFA7A
	.align 2, 0
_080BFA6C: .4byte gWMNodeData
_080BFA70: .4byte gWMNodeIconData
_080BFA74:
	movs r1, #1
	b _080BFA7A
_080BFA78:
	movs r1, #2
_080BFA7A:
	adds r0, r5, #0
	bl sub_80C1370
	adds r3, r0, #0
	adds r3, #0x29
	ldrb r1, [r3]
	movs r2, #1
	orrs r1, r2
	strb r1, [r3]
	adds r5, #0x29
	ldrb r3, [r5]
	lsls r3, r3, #5
	ldr r4, _080BFAE0  @ gWMNodeData
	adds r3, r3, r4
	movs r1, #0xa
	ldrsb r1, [r6, r1]
	lsrs r2, r1, #0x1f
	adds r1, r1, r2
	asrs r1, r1, #1
	movs r2, #8
	ldrsb r2, [r6, r2]
	subs r1, r1, r2
	ldrh r3, [r3, #0x18]
	adds r1, r1, r3
	strh r1, [r0, #0x2c]
	ldrb r3, [r5]
	lsls r3, r3, #5
	adds r3, r3, r4
	movs r1, #0xb
	ldrsb r1, [r6, r1]
	lsrs r2, r1, #0x1f
	adds r1, r1, r2
	asrs r1, r1, #1
	movs r2, #9
	ldrsb r2, [r6, r2]
	subs r1, r1, r2
	ldrh r3, [r3, #0x1a]
	adds r1, r1, r3
	strh r1, [r0, #0x2e]
	ldr r0, _080BFAE4  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080BFADA
	ldr r0, _080BFAE8  @ 0x00000311
	bl m4aSongNumStart
_080BFADA:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080BFAE0: .4byte gWMNodeData
_080BFAE4: .4byte gPlaySt
_080BFAE8: .4byte 0x00000311

	THUMB_FUNC_END sub_80BFA1C

	THUMB_FUNC_START sub_80BFAEC
sub_80BFAEC: @ 0x080BFAEC
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r1, r2, #0
	cmp r1, #0
	beq _080BFB04
	ldr r0, _080BFB00  @ gUnknown_08A3E594
	bl Proc_StartBlocking
	b _080BFB0C
	.align 2, 0
_080BFB00: .4byte gUnknown_08A3E594
_080BFB04:
	ldr r0, _080BFB20  @ gUnknown_08A3E594
	movs r1, #3
	bl Proc_Start
_080BFB0C:
	adds r1, r0, #0
	adds r2, r1, #0
	adds r2, #0x29
	strb r4, [r2]
	adds r1, #0x2a
	strb r5, [r1]
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080BFB20: .4byte gUnknown_08A3E594

	THUMB_FUNC_END sub_80BFAEC

	THUMB_FUNC_START sub_80BFB24
sub_80BFB24: @ 0x080BFB24
	push {lr}
	ldr r0, _080BFB30  @ gUnknown_08A3E594
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
_080BFB30: .4byte gUnknown_08A3E594

	THUMB_FUNC_END sub_80BFB24

	THUMB_FUNC_START sub_80BFB34
sub_80BFB34: @ 0x080BFB34
	push {lr}
	ldr r0, _080BFB48  @ gUnknown_08A3E594
	bl Proc_Find
	cmp r0, #0
	beq _080BFB42
	movs r0, #1
_080BFB42:
	pop {r1}
	bx r1
	.align 2, 0
_080BFB48: .4byte gUnknown_08A3E594

	THUMB_FUNC_END sub_80BFB34

	THUMB_FUNC_START sub_80BFB4C
sub_80BFB4C: @ 0x080BFB4C
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, _080BFB88  @ gProcScr_WorldMapMain
	bl Proc_Find
	ldr r0, [r0, #0x54]
	adds r5, r4, #0
	adds r5, #0x29
	ldrb r1, [r5]
	movs r2, #0
	bl sub_80BE080
	ldr r0, _080BFB8C  @ gGMData
	ldrb r1, [r5]
	lsls r1, r1, #2
	adds r1, r1, r0
	ldrb r2, [r1, #0x10]
	movs r0, #1
	orrs r0, r2
	strb r0, [r1, #0x10]
	bl sub_80C13D8
	adds r4, #0x30
	adds r0, r4, #0
	bl sub_80BF7DC
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080BFB88: .4byte gProcScr_WorldMapMain
_080BFB8C: .4byte gGMData

	THUMB_FUNC_END sub_80BFB4C

	THUMB_FUNC_START sub_80BFB90
sub_80BFB90: @ 0x080BFB90
	push {r4, lr}
	sub sp, #4
	adds r0, #0x30
	bl sub_80BF7B4
	movs r4, #0
	str r4, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl SetBlendTargetA
	str r4, [sp]
	movs r0, #1
	movs r1, #1
	movs r2, #1
	movs r3, #1
	bl SetBlendTargetB
	movs r0, #0
	bl SetBlendBackdropA
	movs r0, #0
	bl SetBlendBackdropB
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80BFB90

	THUMB_FUNC_START sub_80BFBCC
sub_80BFBCC: @ 0x080BFBCC
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, _080BFC14  @ gGMData
	adds r5, r4, #0
	adds r5, #0x29
	ldrb r1, [r5]
	lsls r1, r1, #2
	adds r1, r1, r0
	ldrb r2, [r1, #0x10]
	movs r0, #1
	orrs r0, r2
	strb r0, [r1, #0x10]
	ldr r0, _080BFC18  @ gProcScr_WorldMapMain
	bl Proc_Find
	ldr r0, [r0, #0x54]
	ldrb r1, [r5]
	movs r2, #1
	bl sub_80BE080
	movs r0, #0
	movs r1, #0
	movs r2, #0x10
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	adds r0, r4, #0
	adds r0, #0x2a
	ldrb r2, [r0]
	cmp r2, #0
	beq _080BFC1C
	cmp r2, #1
	beq _080BFC28
	adds r0, #1
	b _080BFC2E
	.align 2, 0
_080BFC14: .4byte gGMData
_080BFC18: .4byte gProcScr_WorldMapMain
_080BFC1C:
	adds r1, r4, #0
	adds r1, #0x2b
	movs r0, #2
	strb r0, [r1]
	adds r0, r1, #0
	b _080BFC2E
_080BFC28:
	adds r0, r4, #0
	adds r0, #0x2b
	strb r2, [r0]
_080BFC2E:
	ldrb r1, [r0]
	adds r0, r4, #0
	adds r0, #0x2c
	movs r2, #0
	strb r1, [r0]
	adds r0, #1
	strb r2, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80BFBCC

	THUMB_FUNC_START sub_80BFC44
sub_80BFC44: @ 0x080BFC44
	push {r4, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x2c
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	cmp r0, #0
	bgt _080BFCBC
	adds r0, r4, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	cmp r0, #0
	beq _080BFC6A
	cmp r0, #1
	beq _080BFC74
	adds r1, #1
	b _080BFC7E
_080BFC6A:
	adds r1, r4, #0
	adds r1, #0x2d
	ldrb r0, [r1]
	adds r0, #1
	b _080BFC7C
_080BFC74:
	adds r1, r4, #0
	adds r1, #0x2d
	ldrb r0, [r1]
	adds r0, #2
_080BFC7C:
	strb r0, [r1]
_080BFC7E:
	ldrb r0, [r1]
	cmp r0, #0xf
	bhi _080BFCA2
	adds r1, r0, #0
	movs r2, #0x10
	subs r2, r2, r1
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	movs r0, #0
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	adds r0, r4, #0
	adds r0, #0x2b
	ldrb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	b _080BFCBC
_080BFCA2:
	ldr r0, _080BFCC4  @ gProcScr_WorldMapMain
	bl Proc_Find
	ldr r0, [r0, #0x54]
	adds r1, r4, #0
	adds r1, #0x29
	ldrb r1, [r1]
	movs r2, #0
	bl sub_80BE080
	adds r0, r4, #0
	bl Proc_Break
_080BFCBC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BFCC4: .4byte gProcScr_WorldMapMain

	THUMB_FUNC_END sub_80BFC44

	THUMB_FUNC_START sub_80BFCC8
sub_80BFCC8: @ 0x080BFCC8
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r1, r2, #0
	cmp r1, #0
	beq _080BFCE0
	ldr r0, _080BFCDC  @ gUnknown_08A3E5E4
	bl Proc_StartBlocking
	b _080BFCE8
	.align 2, 0
_080BFCDC: .4byte gUnknown_08A3E5E4
_080BFCE0:
	ldr r0, _080BFCFC  @ gUnknown_08A3E5E4
	movs r1, #3
	bl Proc_Start
_080BFCE8:
	adds r1, r0, #0
	adds r2, r1, #0
	adds r2, #0x29
	strb r4, [r2]
	adds r1, #0x2a
	strb r5, [r1]
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080BFCFC: .4byte gUnknown_08A3E5E4

	THUMB_FUNC_END sub_80BFCC8

	THUMB_FUNC_START sub_80BFD00
sub_80BFD00: @ 0x080BFD00
	push {lr}
	ldr r0, _080BFD0C  @ gUnknown_08A3E5E4
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
_080BFD0C: .4byte gUnknown_08A3E5E4

	THUMB_FUNC_END sub_80BFD00

	THUMB_FUNC_START sub_80BFD10
sub_80BFD10: @ 0x080BFD10
	push {lr}
	ldr r0, _080BFD24  @ gUnknown_08A3E5E4
	bl Proc_Find
	cmp r0, #0
	beq _080BFD1E
	movs r0, #1
_080BFD1E:
	pop {r1}
	bx r1
	.align 2, 0
_080BFD24: .4byte gUnknown_08A3E5E4

	THUMB_FUNC_END sub_80BFD10

	THUMB_FUNC_START sub_80BFD28
sub_80BFD28: @ 0x080BFD28
	push {r4, lr}
	ldr r0, _080BFD60  @ gUnknown_08A9E5BC
	movs r1, #0x40
	movs r2, #0x20
	bl CopyToPaletteBuffer
	bl EnablePaletteSync
	ldr r0, _080BFD64  @ gUnknown_08A9E544
	ldr r1, _080BFD68  @ 0x06004C00
	bl Decompress
	ldr r0, _080BFD6C  @ gUnknown_08A9E5DC
	ldr r4, _080BFD70  @ gGenericBuffer
	adds r1, r4, #0
	bl Decompress
	ldr r0, _080BFD74  @ gBG0TilemapBuffer
	ldr r2, _080BFD78  @ 0x00002260
	adds r1, r4, #0
	bl CallARM_FillTileRect
	movs r0, #1
	bl BG_EnableSyncByMask
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BFD60: .4byte gUnknown_08A9E5BC
_080BFD64: .4byte gUnknown_08A9E544
_080BFD68: .4byte 0x06004C00
_080BFD6C: .4byte gUnknown_08A9E5DC
_080BFD70: .4byte gGenericBuffer
_080BFD74: .4byte gBG0TilemapBuffer
_080BFD78: .4byte 0x00002260

	THUMB_FUNC_END sub_80BFD28

	THUMB_FUNC_START nullsub_48
nullsub_48: @ 0x080BFD7C
	bx lr

	THUMB_FUNC_END nullsub_48

	THUMB_FUNC_START sub_80BFD80
sub_80BFD80: @ 0x080BFD80
	adds r2, r0, #0
	adds r3, r2, #0
	adds r3, #0x29
	ldrb r1, [r3]
	movs r0, #2
	negs r0, r0
	ands r0, r1
	strb r0, [r3]
	adds r0, r2, #0
	adds r0, #0x2b
	movs r1, #0
	strb r1, [r0]
	subs r0, #1
	strb r1, [r0]
	bx lr

	THUMB_FUNC_END sub_80BFD80

	THUMB_FUNC_START sub_80BFDA0
sub_80BFDA0: @ 0x080BFDA0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x1c
	adds r6, r0, #0
	movs r0, #0
	movs r1, #1
	bl sub_80C1DA0
	str r0, [sp]
	movs r0, #1
	movs r1, #1
	bl sub_80C1DA0
	str r0, [sp, #4]
	movs r3, #0
	movs r7, #0x40
	ldr r0, _080BFEF4  @ 0x000001FF
	adds r5, r0, #0
	movs r4, #0
	ldr r2, [sp, #4]
	ldr r1, [sp]
_080BFDD0:
	subs r0, r7, r3
	ands r0, r5
	strh r0, [r1]
	strh r4, [r2]
	adds r2, #2
	adds r1, #2
	adds r3, #1
	cmp r3, #0x9f
	ble _080BFDD0
	movs r3, #0
	movs r1, #0x2a
	adds r1, r1, r6
	mov r8, r1
	adds r6, #0x2b
	str r6, [sp, #0xc]
	ldrb r2, [r1]
	cmp r3, r2
	bge _080BFE60
	ldr r0, [sp, #4]
	mov sl, r0
	ldr r1, [sp]
	mov r9, r1
_080BFDFC:
	mov r2, r8
	str r2, [sp, #8]
	ldrb r1, [r2]
	movs r0, #0x10
	subs r0, r0, r1
	mov r1, r9
	strh r0, [r1]
	ldrb r5, [r2]
	subs r4, r5, r3
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #1
	negs r0, r0
	adds r1, r5, #0
	str r3, [sp, #0x18]
	bl __divsi3
	adds r6, r0, #0
	adds r6, #0xd
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #1
	negs r0, r0
	adds r1, r5, #0
	bl __divsi3
	adds r7, r0, #0
	adds r7, #0x11
	lsls r0, r4, #3
	subs r4, r4, r0
	adds r0, r4, #0
	adds r1, r5, #0
	bl __divsi3
	adds r0, #0x17
	lsls r0, r0, #0xa
	lsls r1, r7, #5
	adds r0, r0, r1
	adds r0, r0, r6
	mov r2, sl
	strh r0, [r2]
	movs r0, #2
	add sl, r0
	add r9, r0
	ldr r3, [sp, #0x18]
	adds r3, #1
	ldr r1, [sp, #8]
	ldrb r1, [r1]
	cmp r3, r1
	blt _080BFDFC
_080BFE60:
	movs r3, #0
	ldr r2, [sp, #0xc]
	mov r8, r2
	ldrb r0, [r2]
	cmp r3, r0
	bge _080BFEE0
	movs r1, #0
	str r1, [sp, #0x10]
	movs r2, #0
	str r2, [sp, #0x14]
	mov sl, r2
_080BFE76:
	mov r9, r8
	mov r1, r8
	ldrb r0, [r1]
	subs r1, r0, r3
	movs r4, #0xa0
	subs r4, r4, r1
	lsls r4, r4, #1
	ldr r2, [sp]
	adds r1, r4, r2
	adds r0, #0xc8
	strh r0, [r1]
	mov r0, r8
	ldrb r5, [r0]
	mov r0, sl
	adds r1, r5, #0
	str r3, [sp, #0x18]
	bl __divsi3
	adds r6, r0, #0
	adds r6, #0xd
	ldr r0, [sp, #0x14]
	adds r1, r5, #0
	bl __divsi3
	adds r7, r0, #0
	adds r7, #0x11
	ldr r0, [sp, #0x10]
	adds r1, r5, #0
	bl __divsi3
	adds r0, #0x17
	ldr r1, [sp, #4]
	adds r4, r4, r1
	lsls r0, r0, #0xa
	lsls r1, r7, #5
	adds r0, r0, r1
	adds r0, r0, r6
	strh r0, [r4]
	ldr r2, [sp, #0x10]
	subs r2, #7
	str r2, [sp, #0x10]
	ldr r0, [sp, #0x14]
	subs r0, #0xa
	str r0, [sp, #0x14]
	movs r1, #6
	negs r1, r1
	add sl, r1
	ldr r3, [sp, #0x18]
	adds r3, #1
	mov r2, r9
	ldrb r2, [r2]
	cmp r3, r2
	blt _080BFE76
_080BFEE0:
	bl sub_80C1DC8
	add sp, #0x1c
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BFEF4: .4byte 0x000001FF

	THUMB_FUNC_END sub_80BFDA0

	THUMB_FUNC_START sub_80BFEF8
sub_80BFEF8: @ 0x080BFEF8
	push {r4, r5, lr}
	sub sp, #8
	adds r4, r0, #0
	bl sub_80BFD28
	movs r5, #0
	str r5, [r4, #0x38]
	adds r1, r4, #0
	adds r1, #0x2c
	ldrb r0, [r1]
	adds r2, r4, #0
	adds r2, #0x2a
	strb r0, [r2]
	adds r3, r4, #0
	adds r3, #0x2e
	ldrb r0, [r3]
	adds r2, #1
	strb r0, [r2]
	adds r0, r4, #0
	adds r0, #0x2d
	ldrb r0, [r0]
	ldrb r1, [r1]
	subs r0, r0, r1
	str r0, [r4, #0x3c]
	adds r0, r4, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	ldrb r1, [r3]
	subs r0, r0, r1
	str r0, [r4, #0x40]
	movs r0, #0
	movs r1, #1
	bl sub_80C1DA0
	adds r2, r0, #0
	add r1, sp, #4
	movs r0, #0x10
	strh r0, [r1]
	ldr r4, _080BFFC0  @ 0x010000A0
	adds r0, r1, #0
	adds r1, r2, #0
	adds r2, r4, #0
	bl CpuSet
	ldr r1, _080BFFC4  @ 0x04000012
	movs r0, #0
	bl sub_80C1DD8
	movs r0, #0
	bl sub_80C1DE8
	movs r0, #1
	movs r1, #1
	bl sub_80C1DA0
	adds r2, r0, #0
	mov r0, sp
	adds r0, #6
	strh r5, [r0]
	adds r1, r2, #0
	adds r2, r4, #0
	bl CpuSet
	ldr r1, _080BFFC8  @ 0x05000054
	movs r0, #1
	bl sub_80C1DD8
	movs r0, #1
	bl sub_80C1DE8
	ldr r2, _080BFFCC  @ gUnknown_0201BE30
	ldrb r0, [r2]
	movs r1, #4
	orrs r0, r1
	strb r0, [r2]
	str r5, [sp]
	movs r0, #1
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl SetBlendTargetA
	movs r0, #1
	str r0, [sp]
	movs r0, #0
	movs r1, #1
	movs r2, #1
	movs r3, #1
	bl SetBlendTargetB
	movs r0, #1
	movs r1, #0
	movs r2, #0x10
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080BFFC0: .4byte 0x010000A0
_080BFFC4: .4byte 0x04000012
_080BFFC8: .4byte 0x05000054
_080BFFCC: .4byte gUnknown_0201BE30

	THUMB_FUNC_END sub_80BFEF8

	THUMB_FUNC_START sub_80BFFD0
sub_80BFFD0: @ 0x080BFFD0
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	bl sub_80BFD28
	movs r5, #0
	str r5, [r4, #0x38]
	adds r1, r4, #0
	adds r1, #0x2c
	ldrb r0, [r1]
	adds r2, r4, #0
	adds r2, #0x2a
	strb r0, [r2]
	adds r3, r4, #0
	adds r3, #0x2e
	ldrb r0, [r3]
	adds r2, #1
	strb r0, [r2]
	adds r0, r4, #0
	adds r0, #0x2d
	ldrb r0, [r0]
	ldrb r1, [r1]
	subs r0, r0, r1
	str r0, [r4, #0x3c]
	adds r0, r4, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	ldrb r1, [r3]
	subs r0, r0, r1
	str r0, [r4, #0x40]
	movs r0, #0
	movs r1, #1
	bl sub_80C1DA0
	adds r2, r0, #0
	mov r1, sp
	movs r0, #0x10
	strh r0, [r1]
	ldr r4, _080C0070  @ 0x010000A0
	mov r0, sp
	adds r1, r2, #0
	adds r2, r4, #0
	bl CpuSet
	ldr r1, _080C0074  @ 0x04000012
	movs r0, #0
	bl sub_80C1DD8
	movs r0, #0
	bl sub_80C1DE8
	movs r0, #1
	movs r1, #1
	bl sub_80C1DA0
	adds r2, r0, #0
	mov r0, sp
	adds r0, #2
	strh r5, [r0]
	adds r1, r2, #0
	adds r2, r4, #0
	bl CpuSet
	ldr r1, _080C0078  @ 0x05000054
	movs r0, #1
	bl sub_80C1DD8
	movs r0, #1
	bl sub_80C1DE8
	ldr r2, _080C007C  @ gUnknown_0201BE30
	ldrb r0, [r2]
	movs r1, #4
	orrs r0, r1
	strb r0, [r2]
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C0070: .4byte 0x010000A0
_080C0074: .4byte 0x04000012
_080C0078: .4byte 0x05000054
_080C007C: .4byte gUnknown_0201BE30

	THUMB_FUNC_END sub_80BFFD0

	THUMB_FUNC_START sub_80C0080
sub_80C0080: @ 0x080C0080
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x38]
	movs r6, #0x80
	lsls r6, r6, #5
	adds r0, r0, r6
	str r0, [r4, #0x38]
	ldr r1, [r4, #0x34]
	cmp r0, r1
	bge _080C00F2
	movs r3, #0x30
	ldrsh r2, [r4, r3]
	bl sub_800B7E0
	adds r5, r0, #0
	ldr r0, [r4, #0x3c]
	adds r1, r0, #0
	muls r1, r5, r1
	adds r0, r6, #0
	bl DivArm
	adds r1, r4, #0
	adds r1, #0x2c
	ldrb r1, [r1]
	adds r1, r1, r0
	adds r0, r4, #0
	adds r0, #0x2a
	strb r1, [r0]
	ldr r0, [r4, #0x40]
	adds r1, r0, #0
	muls r1, r5, r1
	adds r0, r6, #0
	bl DivArm
	adds r1, r4, #0
	adds r1, #0x2e
	ldrb r1, [r1]
	adds r1, r1, r0
	adds r0, r4, #0
	adds r0, #0x2b
	strb r1, [r0]
	adds r0, r5, #0
	cmp r5, #0
	bge _080C00DA
	adds r0, #0xff
_080C00DA:
	asrs r0, r0, #8
	lsls r1, r0, #0x18
	lsrs r1, r1, #0x18
	movs r2, #0x10
	subs r2, r2, r0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	movs r0, #1
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	b _080C0134
_080C00F2:
	movs r0, #0
	movs r1, #0
	bl sub_80C1DD8
	adds r5, r6, #0
	movs r0, #0
	movs r1, #0
	movs r2, #0x10
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	adds r0, r4, #0
	adds r0, #0x2d
	ldrb r0, [r0]
	adds r1, r4, #0
	adds r1, #0x2a
	strb r0, [r1]
	adds r0, r4, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	adds r1, #1
	strb r0, [r1]
	adds r2, r4, #0
	adds r2, #0x29
	ldrb r1, [r2]
	movs r0, #2
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	adds r0, r4, #0
	movs r1, #0
	bl Proc_Goto
_080C0134:
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_80BFDA0
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80C0080

	THUMB_FUNC_START sub_80C0144
sub_80C0144: @ 0x080C0144
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x38]
	movs r6, #0x80
	lsls r6, r6, #5
	adds r0, r0, r6
	str r0, [r4, #0x38]
	ldr r1, [r4, #0x34]
	cmp r0, r1
	bge _080C0198
	movs r3, #0x30
	ldrsh r2, [r4, r3]
	bl sub_800B7E0
	adds r5, r0, #0
	ldr r0, [r4, #0x3c]
	adds r1, r0, #0
	muls r1, r5, r1
	adds r0, r6, #0
	bl DivArm
	adds r1, r4, #0
	adds r1, #0x2c
	ldrb r1, [r1]
	adds r1, r1, r0
	adds r0, r4, #0
	adds r0, #0x2a
	strb r1, [r0]
	ldr r0, [r4, #0x40]
	adds r1, r0, #0
	muls r1, r5, r1
	adds r0, r6, #0
	bl DivArm
	adds r1, r4, #0
	adds r1, #0x2e
	ldrb r1, [r1]
	adds r1, r1, r0
	adds r0, r4, #0
	adds r0, #0x2b
	strb r1, [r0]
	b _080C01CE
_080C0198:
	movs r0, #0
	movs r1, #0
	bl sub_80C1DD8
	adds r5, r6, #0
	adds r0, r4, #0
	adds r0, #0x2d
	ldrb r0, [r0]
	adds r1, r4, #0
	adds r1, #0x2a
	strb r0, [r1]
	adds r0, r4, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	adds r1, #1
	strb r0, [r1]
	adds r2, r4, #0
	adds r2, #0x29
	ldrb r1, [r2]
	movs r0, #2
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	adds r0, r4, #0
	movs r1, #0
	bl Proc_Goto
_080C01CE:
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_80BFDA0
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80C0144

	THUMB_FUNC_START NewMapMuEntry
NewMapMuEntry: @ 0x080C01DC
	push {lr}
	adds r1, r0, #0
	cmp r1, #0
	beq _080C01F0
	ldr r0, _080C01EC  @ gUnknown_08A3E624
	bl Proc_StartBlocking
	b _080C01F8
	.align 2, 0
_080C01EC: .4byte gUnknown_08A3E624
_080C01F0:
	ldr r0, _080C01FC  @ gUnknown_08A3E624
	movs r1, #3
	bl Proc_Start
_080C01F8:
	pop {r1}
	bx r1
	.align 2, 0
_080C01FC: .4byte gUnknown_08A3E624

	THUMB_FUNC_END NewMapMuEntry

	THUMB_FUNC_START sub_80C0200
sub_80C0200: @ 0x080C0200
	push {lr}
	ldr r0, _080C020C  @ gUnknown_08A3E624
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
_080C020C: .4byte gUnknown_08A3E624

	THUMB_FUNC_END sub_80C0200

	THUMB_FUNC_START sub_80C0210
sub_80C0210: @ 0x080C0210
	push {lr}
	ldr r0, _080C0224  @ gUnknown_08A3E624
	bl Proc_Find
	cmp r0, #0
	beq _080C021E
	movs r0, #1
_080C021E:
	pop {r1}
	bx r1
	.align 2, 0
_080C0224: .4byte gUnknown_08A3E624

	THUMB_FUNC_END sub_80C0210

	THUMB_FUNC_START sub_80C0228
sub_80C0228: @ 0x080C0228
	push {lr}
	ldr r0, _080C023C  @ gUnknown_08A3E624
	bl Proc_Find
	adds r0, #0x29
	ldrb r0, [r0]
	lsls r0, r0, #0x1f
	lsrs r0, r0, #0x1f
	pop {r1}
	bx r1
	.align 2, 0
_080C023C: .4byte gUnknown_08A3E624

	THUMB_FUNC_END sub_80C0228

	THUMB_FUNC_START sub_80C0240
sub_80C0240: @ 0x080C0240
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	ldr r0, _080C0298  @ gUnknown_08A3E624
	bl Proc_Find
	adds r2, r0, #0
	movs r0, #0x29
	adds r0, r0, r2
	mov ip, r0
	ldrb r0, [r0]
	movs r3, #1
	ands r3, r0
	cmp r3, #0
	bne _080C029C
	adds r0, r2, #0
	adds r0, #0x2c
	strb r3, [r0]
	adds r1, r2, #0
	adds r1, #0x2d
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x2e
	strb r3, [r0]
	adds r1, #2
	movs r0, #0x38
	strb r0, [r1]
	strh r4, [r2, #0x30]
	lsls r0, r5, #0xc
	str r0, [r2, #0x34]
	mov r1, ip
	ldrb r0, [r1]
	movs r1, #1
	orrs r0, r1
	mov r1, ip
	strb r0, [r1]
	adds r0, r2, #0
	movs r1, #1
	bl Proc_Goto
	movs r0, #0
	b _080C029E
	.align 2, 0
_080C0298: .4byte gUnknown_08A3E624
_080C029C:
	movs r0, #1
_080C029E:
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80C0240

	THUMB_FUNC_START sub_80C02A4
sub_80C02A4: @ 0x080C02A4
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	ldr r0, _080C02FC  @ gUnknown_08A3E624
	bl Proc_Find
	adds r2, r0, #0
	movs r0, #0x29
	adds r0, r0, r2
	mov ip, r0
	ldrb r0, [r0]
	movs r3, #1
	ands r3, r0
	cmp r3, #0
	bne _080C0300
	adds r1, r2, #0
	adds r1, #0x2c
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x2d
	strb r3, [r0]
	adds r1, #2
	movs r0, #0x38
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x2f
	strb r3, [r0]
	strh r4, [r2, #0x30]
	lsls r0, r5, #0xc
	str r0, [r2, #0x34]
	mov r1, ip
	ldrb r0, [r1]
	movs r1, #1
	orrs r0, r1
	mov r1, ip
	strb r0, [r1]
	adds r0, r2, #0
	movs r1, #2
	bl Proc_Goto
	movs r0, #0
	b _080C0302
	.align 2, 0
_080C02FC: .4byte gUnknown_08A3E624
_080C0300:
	movs r0, #1
_080C0302:
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80C02A4

	THUMB_FUNC_START sub_80C0308
sub_80C0308: @ 0x080C0308
	push {r4, lr}
	sub sp, #4
	ldr r2, _080C0354  @ gUnknown_0201BE30
	ldrb r1, [r2]
	movs r0, #0xfb
	ands r0, r1
	strb r0, [r2]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	movs r4, #0
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
	movs r3, #0
	bl SetBlendTargetB
	movs r0, #0
	bl SetBlendBackdropA
	movs r0, #0
	bl SetBlendBackdropB
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C0354: .4byte gUnknown_0201BE30

	THUMB_FUNC_END sub_80C0308

	THUMB_FUNC_START sub_80C0358
sub_80C0358: @ 0x080C0358
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	adds r4, r0, #0
	movs r0, #0
	movs r1, #1
	bl sub_80C1DA0
	mov r9, r0
	movs r1, #0x2a
	ldrsh r0, [r4, r1]
	movs r2, #0x2c
	ldrsh r1, [r4, r2]
	movs r2, #0
	bl sub_800B84C
	movs r6, #0x80
	lsls r6, r6, #5
	lsls r5, r0, #7
	negs r5, r5
	adds r0, r6, #0
	adds r1, r5, #0
	bl DivArm
	adds r4, r0, #0
	adds r4, #0x80
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	adds r0, r6, #0
	adds r1, r5, #0
	bl DivArm
	adds r0, #0x50
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	movs r7, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	mov r5, r9
_080C03AA:
	cmp r7, r4
	blt _080C03B2
	movs r0, #0
	b _080C03D8
_080C03B2:
	mov r1, r8
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	cmp r7, r0
	blt _080C03D6
	subs r0, r7, r0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #0x30
	movs r2, #0
	bl sub_800B84C
	subs r0, r6, r0
	lsls r1, r0, #4
	adds r0, r6, #0
	bl DivArm
	b _080C03D8
_080C03D6:
	movs r0, #0x10
_080C03D8:
	strh r0, [r5]
	adds r5, #2
	adds r7, #1
	cmp r7, #0x4f
	ble _080C03AA
	mov r1, r9
	movs r0, #0x9f
	lsls r0, r0, #1
	adds r2, r1, r0
	movs r7, #0x4f
_080C03EC:
	ldrh r0, [r1]
	strh r0, [r2]
	adds r1, #2
	subs r2, #2
	subs r7, #1
	cmp r7, #0
	bge _080C03EC
	bl sub_80C1DC8
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80C0358

	THUMB_FUNC_START sub_80C040C
sub_80C040C: @ 0x080C040C
	push {r4, r5, lr}
	sub sp, #8
	adds r4, r0, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #2
	bne _080C0426
	movs r0, #1
	movs r1, #0
	bl NewFadeIn
	movs r0, #0x64
	b _080C0430
_080C0426:
	movs r0, #2
	movs r1, #0
	bl NewFadeIn
	movs r0, #0x32
_080C0430:
	strh r0, [r4, #0x2c]
	movs r5, #0
	strh r5, [r4, #0x2a]
	add r1, sp, #4
	movs r0, #0x10
	strh r0, [r1]
	movs r0, #0
	movs r1, #0
	bl sub_80C1DA0
	adds r1, r0, #0
	add r0, sp, #4
	ldr r2, _080C04BC  @ 0x010000A0
	bl CpuSet
	ldr r1, _080C04C0  @ 0x04000054
	movs r0, #0
	bl sub_80C1DD8
	movs r0, #0
	bl sub_80C1DE8
	movs r0, #3
	movs r1, #0x10
	movs r2, #0x10
	movs r3, #0x10
	bl SetSpecialColorEffectsParameters
	ldr r2, _080C04C4  @ gLCDControlBuffer
	ldrb r1, [r2, #1]
	movs r0, #2
	negs r0, r0
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	movs r4, #4
	orrs r0, r4
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2, #1]
	movs r0, #1
	str r0, [sp]
	movs r1, #1
	movs r2, #1
	movs r3, #1
	bl SetBlendTargetA
	str r5, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl SetBlendTargetB
	movs r0, #0
	bl SetBlendBackdropA
	movs r0, #0
	bl SetBlendBackdropB
	ldr r1, _080C04C8  @ gUnknown_0201BE30
	ldrb r0, [r1]
	orrs r0, r4
	strb r0, [r1]
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C04BC: .4byte 0x010000A0
_080C04C0: .4byte 0x04000054
_080C04C4: .4byte gLCDControlBuffer
_080C04C8: .4byte gUnknown_0201BE30

	THUMB_FUNC_END sub_80C040C

	THUMB_FUNC_START sub_80C04CC
sub_80C04CC: @ 0x080C04CC
	push {lr}
	adds r2, r0, #0
	ldrh r0, [r2, #0x2a]
	adds r0, #1
	strh r0, [r2, #0x2a]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r3, #0x2c
	ldrsh r1, [r2, r3]
	cmp r0, r1
	bge _080C04EA
	adds r0, r2, #0
	bl sub_80C0358
	b _080C04F0
_080C04EA:
	adds r0, r2, #0
	bl Proc_Break
_080C04F0:
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80C04CC

	THUMB_FUNC_START sub_80C04F4
sub_80C04F4: @ 0x080C04F4
	push {r4, lr}
	adds r4, r0, #0
	cmp r1, #0
	beq _080C0508
	ldr r0, _080C0504  @ gUnknown_08A3E6AC
	bl Proc_StartBlocking
	b _080C0510
	.align 2, 0
_080C0504: .4byte gUnknown_08A3E6AC
_080C0508:
	ldr r0, _080C051C  @ gUnknown_08A3E6AC
	movs r1, #3
	bl Proc_Start
_080C0510:
	adds r1, r0, #0
	adds r1, #0x29
	strb r4, [r1]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080C051C: .4byte gUnknown_08A3E6AC

	THUMB_FUNC_END sub_80C04F4

	THUMB_FUNC_START sub_80C0520
sub_80C0520: @ 0x080C0520
	push {lr}
	ldr r0, _080C052C  @ gUnknown_08A3E6AC
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
_080C052C: .4byte gUnknown_08A3E6AC

	THUMB_FUNC_END sub_80C0520

	THUMB_FUNC_START sub_80C0530
sub_80C0530: @ 0x080C0530
	push {lr}
	ldr r0, _080C0544  @ gUnknown_08A3E6AC
	bl Proc_Find
	cmp r0, #0
	beq _080C053E
	movs r0, #1
_080C053E:
	pop {r1}
	bx r1
	.align 2, 0
_080C0544: .4byte gUnknown_08A3E6AC

	THUMB_FUNC_END sub_80C0530

	THUMB_FUNC_START nullsub_47
nullsub_47: @ 0x080C0548
	bx lr

	THUMB_FUNC_END nullsub_47

	THUMB_FUNC_START sub_80C054C
sub_80C054C: @ 0x080C054C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	movs r7, #0
	adds r5, r1, #0
	mov r6, r8
	adds r6, #0x32
	mov r4, r8
	adds r4, #0x30
_080C0560:
	ldr r0, _080C05A8  @ gProcScr_WorldMapMain
	bl Proc_Find
	ldr r0, [r0, #0x54]
	mov r1, r8
	adds r1, #0x2e
	adds r1, r1, r7
	ldrb r1, [r1]
	adds r2, r4, #0
	adds r3, r6, #0
	bl GmMu_GetPosition
	ldrh r0, [r5]
	strh r0, [r4, #0x10]
	ldrh r1, [r5, #2]
	strh r1, [r4, #0x12]
	ldrh r2, [r4]
	adds r0, r0, r2
	strh r0, [r4, #8]
	ldrh r0, [r4, #2]
	adds r1, r1, r0
	strh r1, [r4, #0xa]
	adds r5, #4
	adds r6, #4
	adds r4, #4
	adds r7, #1
	cmp r7, #1
	ble _080C0560
	movs r0, #0
	mov r1, r8
	strh r0, [r1, #0x2a]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C05A8: .4byte gProcScr_WorldMapMain

	THUMB_FUNC_END sub_80C054C

	THUMB_FUNC_START sub_80C05AC
sub_80C05AC: @ 0x080C05AC
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _080C05C0  @ gUnknown_082068F4
	bl sub_80C054C
	movs r0, #0x10
	strh r0, [r4, #0x2c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C05C0: .4byte gUnknown_082068F4

	THUMB_FUNC_END sub_80C05AC

	THUMB_FUNC_START sub_80C05C4
sub_80C05C4: @ 0x080C05C4
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _080C05EC  @ gUnknown_082068FC
	bl sub_80C054C
	movs r0, #5
	strh r0, [r4, #0x2c]
	ldr r0, _080C05F0  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080C05E4
	ldr r0, _080C05F4  @ 0x00000313
	bl m4aSongNumStart
_080C05E4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C05EC: .4byte gUnknown_082068FC
_080C05F0: .4byte gPlaySt
_080C05F4: .4byte 0x00000313

	THUMB_FUNC_END sub_80C05C4

	THUMB_FUNC_START sub_80C05F8
sub_80C05F8: @ 0x080C05F8
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _080C060C  @ gUnknown_08206904
	bl sub_80C054C
	movs r0, #5
	strh r0, [r4, #0x2c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C060C: .4byte gUnknown_08206904

	THUMB_FUNC_END sub_80C05F8

	THUMB_FUNC_START sub_80C0610
sub_80C0610: @ 0x080C0610
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	adds r5, r0, #0
	ldrh r0, [r5, #0x2a]
	adds r0, #1
	strh r0, [r5, #0x2a]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r1, [r5, #0x2c]
	cmp r0, r1
	bcs _080C06A4
	ldrh r0, [r5, #0x2a]
	ldrh r1, [r5, #0x2c]
	movs r2, #1
	bl sub_800B7E0
	mov r8, r0
	movs r7, #0
	movs r2, #0x2e
	adds r2, r2, r5
	mov r9, r2
	movs r3, #0x80
	lsls r3, r3, #5
	mov sl, r3
	adds r6, r5, #0
	adds r6, #0x30
_080C064A:
	movs r1, #0x10
	ldrsh r0, [r6, r1]
	mov r1, r8
	muls r1, r0, r1
	mov r0, sl
	bl DivArm
	ldrh r5, [r6]
	adds r5, r5, r0
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	movs r2, #0x12
	ldrsh r0, [r6, r2]
	mov r1, r8
	muls r1, r0, r1
	mov r0, sl
	bl DivArm
	ldrh r4, [r6, #2]
	adds r4, r4, r0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	ldr r0, _080C06A0  @ gProcScr_WorldMapMain
	bl Proc_Find
	ldr r0, [r0, #0x54]
	mov r3, r9
	adds r1, r3, r7
	ldrb r1, [r1]
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	adds r2, r5, #0
	adds r3, r4, #0
	bl GmMu_SetPosition
	adds r6, #4
	adds r7, #1
	cmp r7, #1
	ble _080C064A
	b _080C06DC
	.align 2, 0
_080C06A0: .4byte gProcScr_WorldMapMain
_080C06A4:
	movs r7, #0
	movs r6, #0x2e
	adds r6, r6, r5
	mov r9, r6
	adds r4, r5, #0
	adds r4, #0x38
_080C06B0:
	ldr r0, _080C06EC  @ gProcScr_WorldMapMain
	bl Proc_Find
	ldr r0, [r0, #0x54]
	mov r2, r9
	adds r1, r2, r7
	ldrb r1, [r1]
	movs r3, #0
	ldrsh r2, [r4, r3]
	movs r6, #2
	ldrsh r3, [r4, r6]
	bl GmMu_SetPosition
	adds r4, #4
	adds r7, #1
	cmp r7, #1
	ble _080C06B0
	movs r0, #0
	strh r0, [r5, #0x2a]
	adds r0, r5, #0
	bl Proc_Break
_080C06DC:
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C06EC: .4byte gProcScr_WorldMapMain

	THUMB_FUNC_END sub_80C0610

	THUMB_FUNC_START sub_80C06F0
sub_80C06F0: @ 0x080C06F0
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r7, r0, #0
	ldr r0, _080C07A0  @ gUnknown_08AA1970
	ldr r1, _080C07A4  @ 0x06013000
	bl Decompress
	movs r5, #0
	movs r4, #0
	mov r6, sp
	adds r6, #0xa
_080C0706:
	ldr r0, _080C07A8  @ gProcScr_WorldMapMain
	bl Proc_Find
	ldr r0, [r0, #0x54]
	adds r1, r7, #0
	adds r1, #0x2e
	adds r1, r1, r4
	ldrb r1, [r1]
	add r2, sp, #8
	adds r3, r6, #0
	bl GmMu_GetPosition
	add r1, sp, #8
	lsls r0, r5, #0x10
	asrs r0, r0, #0x10
	ldrh r1, [r1]
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	adds r4, #1
	cmp r4, #1
	ble _080C0706
	lsls r0, r5, #0x10
	asrs r1, r0, #0x10
	lsrs r0, r0, #0x1f
	adds r1, r1, r0
	add r2, sp, #8
	ldr r3, _080C07AC  @ gGMData
	ldrh r0, [r3, #2]
	asrs r1, r1, #1
	subs r1, r1, r0
	strh r1, [r2]
	adds r0, r2, #0
	subs r1, #0x14
	strh r1, [r0]
	ldrh r0, [r6]
	subs r0, #0xc
	ldrh r1, [r3, #4]
	subs r0, r0, r1
	strh r0, [r6]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x9f
	bhi _080C0784
	adds r0, r2, #0
	ldrh r0, [r0]
	cmp r0, #0xef
	bhi _080C0784
	ldr r0, _080C07B0  @ gUnknown_08AA1C70
	adds r1, r2, #0
	movs r2, #0
	ldrsh r1, [r1, r2]
	movs r3, #0
	ldrsh r2, [r6, r3]
	movs r3, #0xe6
	lsls r3, r3, #6
	movs r4, #0
	str r4, [sp]
	movs r4, #7
	str r4, [sp, #4]
	bl APProc_Create
	str r0, [r7, #0x48]
_080C0784:
	ldr r0, _080C07B4  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080C0798
	movs r0, #0xc5
	lsls r0, r0, #2
	bl m4aSongNumStart
_080C0798:
	add sp, #0xc
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C07A0: .4byte gUnknown_08AA1970
_080C07A4: .4byte 0x06013000
_080C07A8: .4byte gProcScr_WorldMapMain
_080C07AC: .4byte gGMData
_080C07B0: .4byte gUnknown_08AA1C70
_080C07B4: .4byte gPlaySt

	THUMB_FUNC_END sub_80C06F0

	THUMB_FUNC_START sub_80C07B8
sub_80C07B8: @ 0x080C07B8
	push {r4, lr}
	adds r4, r0, #0
	bl APProc_Exists
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080C07CC
	adds r0, r4, #0
	bl Proc_Break
_080C07CC:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80C07B8

	THUMB_FUNC_START sub_80C07D4
sub_80C07D4: @ 0x080C07D4
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r1, r2, #0
	cmp r1, #0
	beq _080C07EC
	ldr r0, _080C07E8  @ gUnknown_08A3E6E4
	bl Proc_StartBlocking
	b _080C07F4
	.align 2, 0
_080C07E8: .4byte gUnknown_08A3E6E4
_080C07EC:
	ldr r0, _080C0808  @ gUnknown_08A3E6E4
	movs r1, #3
	bl Proc_Start
_080C07F4:
	adds r1, r0, #0
	adds r2, r1, #0
	adds r2, #0x2f
	strb r4, [r2]
	adds r1, #0x2e
	strb r5, [r1]
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080C0808: .4byte gUnknown_08A3E6E4

	THUMB_FUNC_END sub_80C07D4

	THUMB_FUNC_START sub_80C080C
sub_80C080C: @ 0x080C080C
	push {lr}
	ldr r0, _080C0818  @ gUnknown_08A3E6E4
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
_080C0818: .4byte gUnknown_08A3E6E4

	THUMB_FUNC_END sub_80C080C

	THUMB_FUNC_START sub_80C081C
sub_80C081C: @ 0x080C081C
	push {lr}
	ldr r0, _080C0830  @ gUnknown_08A3E6E4
	bl Proc_Find
	cmp r0, #0
	beq _080C082A
	movs r0, #1
_080C082A:
	pop {r1}
	bx r1
	.align 2, 0
_080C0830: .4byte gUnknown_08A3E6E4

	THUMB_FUNC_END sub_80C081C

	THUMB_FUNC_START sub_80C0834
sub_80C0834: @ 0x080C0834
	push {r4, lr}
	ldr r4, [sp, #8]
	subs r2, r2, r0
	subs r3, r3, r1
	adds r0, r2, #0
	muls r0, r2, r0
	adds r1, r3, #0
	muls r1, r3, r1
	adds r0, r0, r1
	lsls r0, r4
	bl Sqrt
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80C0834

	THUMB_FUNC_START GetWMCenteredCameraPosition
GetWMCenteredCameraPosition: @ 0x080C0858
	push {lr}
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	subs r0, #0x78
	strh r0, [r2]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0
	bge _080C0872
	movs r0, #0
	b _080C0878
_080C0872:
	cmp r0, #0xf0
	ble _080C087A
	movs r0, #0xf0
_080C0878:
	strh r0, [r2]
_080C087A:
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	subs r0, #0x50
	strh r0, [r3]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0
	bge _080C088E
	movs r0, #0
	b _080C0894
_080C088E:
	cmp r0, #0xa0
	ble _080C0896
	movs r0, #0xa0
_080C0894:
	strh r0, [r3]
_080C0896:
	pop {r0}
	bx r0

	THUMB_FUNC_END GetWMCenteredCameraPosition

	THUMB_FUNC_START sub_80C089C
sub_80C089C: @ 0x080C089C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	mov ip, r0
	mov r8, r1
	adds r6, r2, #0
	adds r7, r3, #0
	mov r2, sp
	ldr r1, _080C0928  @ gGMData
	ldr r0, [r1, #8]
	asrs r0, r0, #8
	strh r0, [r2]
	adds r2, #2
	ldr r0, [r1, #0xc]
	asrs r0, r0, #8
	strh r0, [r2]
	add r3, sp, #4
	ldrh r0, [r1, #2]
	strh r0, [r3]
	mov r5, sp
	adds r5, #6
	ldrh r0, [r1, #4]
	strh r0, [r5]
	mov r4, sp
	mov r0, sp
	ldrh r1, [r3]
	subs r1, #8
	ldrh r0, [r0]
	subs r0, r0, r1
	strh r0, [r4]
	ldrh r1, [r5]
	subs r1, #8
	ldrh r0, [r2]
	subs r0, r0, r1
	strh r0, [r2]
	mov r0, ip
	cmp r0, #0
	bne _080C08F0
	mov r1, r8
	cmp r1, #0
	beq _080C0906
_080C08F0:
	mov r0, sp
	movs r3, #0
	ldrsh r1, [r0, r3]
	movs r0, #0x78
	subs r0, r0, r7
	cmp r1, r0
	blt _080C0906
	adds r0, r6, #0
	adds r0, #0x78
	cmp r1, r0
	blt _080C0924
_080C0906:
	cmp r6, #0
	bne _080C090E
	cmp r7, #0
	beq _080C092C
_080C090E:
	movs r0, #0
	ldrsh r1, [r2, r0]
	movs r0, #0x50
	mov r3, ip
	subs r0, r0, r3
	cmp r1, r0
	blt _080C092C
	mov r0, r8
	adds r0, #0x50
	cmp r1, r0
	bge _080C092C
_080C0924:
	movs r0, #4
	b _080C0954
	.align 2, 0
_080C0928: .4byte gGMData
_080C092C:
	mov r0, sp
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0x78
	bgt _080C0942
	movs r3, #0
	ldrsh r0, [r2, r3]
	cmp r0, #0x50
	bgt _080C094E
	movs r0, #0
	b _080C0954
_080C0942:
	movs r1, #0
	ldrsh r0, [r2, r1]
	cmp r0, #0x50
	bgt _080C0952
	movs r0, #1
	b _080C0954
_080C094E:
	movs r0, #2
	b _080C0954
_080C0952:
	movs r0, #3
_080C0954:
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80C089C

	THUMB_FUNC_START sub_80C0960
sub_80C0960: @ 0x080C0960
	push {r4, lr}
	bl sub_80BCFDC
	adds r4, r0, #0
	ldr r0, _080C0998  @ gPlaySt
	ldrb r1, [r0, #0x14]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	bne _080C097E
	ldr r0, _080C099C  @ gGMData
	bl sub_80BD014
	cmp r0, r4
	beq _080C09AE
_080C097E:
	movs r1, #0
	ldr r0, _080C09A0  @ gWMMonsterSpawnsSize
	ldrb r0, [r0]
	cmp r1, r0
	bge _080C09AE
	ldr r3, _080C09A4  @ gWMMonsterSpawnLocations
	adds r2, r0, #0
_080C098C:
	adds r0, r1, r3
	ldrb r0, [r0]
	cmp r4, r0
	bne _080C09A8
	movs r0, #1
	b _080C09B0
	.align 2, 0
_080C0998: .4byte gPlaySt
_080C099C: .4byte gGMData
_080C09A0: .4byte gWMMonsterSpawnsSize
_080C09A4: .4byte gWMMonsterSpawnLocations
_080C09A8:
	adds r1, #1
	cmp r1, r2
	blt _080C098C
_080C09AE:
	movs r0, #0
_080C09B0:
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80C0960

	THUMB_FUNC_START sub_80C09B8
sub_80C09B8: @ 0x080C09B8
	push {r4, r5, lr}
	sub sp, #8
	movs r4, #0
	str r4, [sp]
	ldr r1, _080C09E0  @ gUnknown_0201B430
	ldr r5, _080C09E4  @ 0x01000140
	mov r0, sp
	adds r2, r5, #0
	bl CpuFastSet
	str r4, [sp, #4]
	add r0, sp, #4
	ldr r1, _080C09E8  @ gUnknown_0201B930
	adds r2, r5, #0
	bl CpuFastSet
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C09E0: .4byte gUnknown_0201B430
_080C09E4: .4byte 0x01000140
_080C09E8: .4byte gUnknown_0201B930

	THUMB_FUNC_END sub_80C09B8

	THUMB_FUNC_START sub_80C09EC
sub_80C09EC: @ 0x080C09EC
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080C0A08  @ 0x06013000
	movs r1, #9
	bl LoadHelpBoxGfx
	ldr r0, _080C0A0C  @ gUnknown_08A3E78C
	adds r1, r4, #0
	bl StartMovingHelpBox
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C0A08: .4byte 0x06013000
_080C0A0C: .4byte gUnknown_08A3E78C

	THUMB_FUNC_END sub_80C09EC

	THUMB_FUNC_START sub_80C0A10
sub_80C0A10: @ 0x080C0A10
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080C0A2C  @ gUnknown_08A3E8B8
	bl Proc_Find
	ldr r0, [r0, #0x2c]
	ldr r0, [r0]
	ldrh r1, [r0, #2]
	cmp r1, #0
	beq _080C0A30
	adds r0, r4, #0
	adds r0, #0x4c
	strh r1, [r0]
	b _080C0A38
	.align 2, 0
_080C0A2C: .4byte gUnknown_08A3E8B8
_080C0A30:
	adds r1, r4, #0
	adds r1, #0x4c
	ldr r0, _080C0A40  @ 0x000006BE
	strh r0, [r1]
_080C0A38:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C0A40: .4byte 0x000006BE

	THUMB_FUNC_END sub_80C0A10

	THUMB_FUNC_START sub_80C0A44
sub_80C0A44: @ 0x080C0A44
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080C0A60  @ gUnknown_08A3E8B8
	bl Proc_Find
	ldr r0, [r0, #0x2c]
	ldr r0, [r0, #4]
	ldrh r0, [r0, #2]
	adds r4, #0x4c
	strh r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C0A60: .4byte gUnknown_08A3E8B8

	THUMB_FUNC_END sub_80C0A44

	THUMB_FUNC_START sub_80C0A64
sub_80C0A64: @ 0x080C0A64
	push {r4, r5, lr}
	movs r5, #0
	movs r4, #1
_080C0A6A:
	adds r0, r4, #0
	bl GetUnit
	adds r1, r0, #0
	cmp r1, #0
	beq _080C0A88
	ldr r0, [r1]
	cmp r0, #0
	beq _080C0A88
	ldr r0, [r1, #0xc]
	ldr r1, _080C0A98  @ 0x00010004
	ands r0, r1
	cmp r0, #0
	bne _080C0A88
	adds r5, #1
_080C0A88:
	adds r4, #1
	cmp r4, #0x3f
	ble _080C0A6A
	adds r0, r5, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080C0A98: .4byte 0x00010004

	THUMB_FUNC_END sub_80C0A64

	THUMB_FUNC_START sub_80C0A9C
sub_80C0A9C: @ 0x080C0A9C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	adds r7, r0, #0
	ldr r0, [r7, #0x2c]
	ldr r0, [r0]
	ldrh r0, [r0]
	bl GetStringFromIndex
	adds r5, r0, #0
	movs r0, #0x40
	adds r1, r5, #0
	bl GetStringTextCenteredPos
	mov r8, r0
	ldr r4, [r7, #0x2c]
	adds r0, r4, #0
	bl GetUnitEquippedWeaponSlot
	adds r1, r0, #0
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, r4, #0
	bl BattleGenerateUiStats
	adds r0, r7, #0
	adds r0, #0x34
	ldr r4, _080C0B80  @ gBG0TilemapBuffer+0x2A6
	movs r1, #0
	str r1, [sp]
	str r5, [sp, #4]
	adds r1, r4, #0
	movs r2, #0
	mov r3, r8
	bl PutDrawText
	ldr r0, [r7, #0x2c]
	ldr r0, [r0, #4]
	ldrh r0, [r0]
	bl GetStringFromIndex
	adds r1, r4, #0
	adds r1, #0xbc
	movs r2, #7
	str r2, [sp]
	str r0, [sp, #4]
	movs r0, #0
	movs r2, #0
	movs r3, #0
	bl PutDrawText
	movs r1, #0x9e
	lsls r1, r1, #1
	adds r0, r4, r1
	movs r1, #3
	movs r2, #0x24
	movs r3, #0x25
	bl PutTwoSpecialChar
	movs r1, #0xa2
	lsls r1, r1, #1
	adds r0, r4, r1
	movs r1, #3
	movs r2, #0x35
	bl PutSpecialChar
	movs r1, #0xde
	lsls r1, r1, #1
	adds r0, r4, r1
	movs r1, #3
	movs r2, #0x22
	movs r3, #0x23
	bl PutTwoSpecialChar
	movs r1, #0xe2
	lsls r1, r1, #1
	adds r0, r4, r1
	movs r1, #3
	movs r2, #0x16
	bl PutSpecialChar
	movs r1, #0xa1
	lsls r1, r1, #1
	adds r0, r4, r1
	ldr r1, [r7, #0x2c]
	movs r2, #8
	ldrsb r2, [r1, r2]
	movs r1, #2
	bl PutNumberOrBlank
	movs r1, #0xa4
	lsls r1, r1, #1
	adds r0, r4, r1
	ldr r1, [r7, #0x2c]
	ldrb r2, [r1, #9]
	movs r1, #2
	bl PutNumberOrBlank
	ldr r0, [r7, #0x2c]
	bl GetUnitCurrentHp
	cmp r0, #0x63
	ble _080C0B84
	movs r1, #0xe0
	lsls r1, r1, #1
	adds r0, r4, r1
	movs r1, #2
	movs r2, #0x14
	movs r3, #0x14
	bl PutTwoSpecialChar
	b _080C0B9A
	.align 2, 0
_080C0B80: .4byte gBG0TilemapBuffer+0x2A6
_080C0B84:
	movs r0, #0xe1
	lsls r0, r0, #1
	adds r4, r4, r0
	ldr r0, [r7, #0x2c]
	bl GetUnitCurrentHp
	adds r2, r0, #0
	adds r0, r4, #0
	movs r1, #2
	bl PutNumberOrBlank
_080C0B9A:
	ldr r0, [r7, #0x2c]
	bl GetUnitMaxHp
	cmp r0, #0x63
	ble _080C0BB8
	ldr r0, _080C0BB4  @ gBG0TilemapBuffer+0x46C
	movs r1, #2
	movs r2, #0x14
	movs r3, #0x14
	bl PutTwoSpecialChar
	b _080C0BCA
	.align 2, 0
_080C0BB4: .4byte gBG0TilemapBuffer+0x46C
_080C0BB8:
	ldr r4, _080C0C1C  @ gBG0TilemapBuffer+0x46E
	ldr r0, [r7, #0x2c]
	bl GetUnitMaxHp
	adds r2, r0, #0
	adds r0, r4, #0
	movs r1, #2
	bl PutNumberOrBlank
_080C0BCA:
	ldr r0, _080C0C20  @ gGMData
	bl sub_80BD014
	bl GetWorldMapNodeName
	adds r6, r0, #0
	movs r0, #0x48
	adds r1, r6, #0
	bl GetStringTextCenteredPos
	mov r8, r0
	adds r5, r7, #0
	adds r5, #0x3c
	adds r0, r5, #0
	movs r1, #5
	bl Text_Skip
	ldr r4, _080C0C24  @ gBG0TilemapBuffer+0x186
	movs r0, #0
	str r0, [sp]
	str r6, [sp, #4]
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #0
	mov r3, r8
	bl PutDrawText
	adds r4, #0xd2
	bl sub_80C0A64
	adds r2, r0, #0
	adds r0, r4, #0
	movs r1, #2
	bl PutNumber
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C0C1C: .4byte gBG0TilemapBuffer+0x46E
_080C0C20: .4byte gGMData
_080C0C24: .4byte gBG0TilemapBuffer+0x186

	THUMB_FUNC_END sub_80C0A9C

	THUMB_FUNC_START sub_80C0C28
sub_80C0C28: @ 0x080C0C28
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x34
	movs r1, #8
	bl InitText
	adds r4, #0x3c
	adds r0, r4, #0
	movs r1, #9
	bl InitText
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80C0C28

	THUMB_FUNC_START sub_80C0C44
sub_80C0C44: @ 0x080C0C44
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r2, _080C0CB4  @ gGMData
	ldrb r1, [r2, #0x10]
	movs r0, #2
	ands r0, r1
	movs r1, #0
	cmp r0, #0
	bne _080C0C5C
	movs r0, #0x12
	ldrsh r1, [r2, r0]
_080C0C5C:
	adds r0, r1, #0
	bl GetUnitFromCharId
	str r0, [r5, #0x2c]
	bl GetUnitPortraitId
	adds r4, r0, #0
	ldr r0, [r5, #0x2c]
	ldr r0, [r0, #0xc]
	movs r1, #0x80
	lsls r1, r1, #0x10
	ands r0, r1
	cmp r0, #0
	beq _080C0C7A
	adds r4, #1
_080C0C7A:
	bl ResetText
	bl ResetIconGraphics_
	adds r0, r5, #0
	bl sub_80C0C28
	ldr r1, _080C0CB8  @ gBG2TilemapBuffer+0x064
	movs r3, #0x80
	lsls r3, r3, #2
	movs r0, #0xd
	str r0, [sp]
	adds r0, r5, #0
	adds r2, r4, #0
	bl PutFace80x72
	adds r0, r4, #0
	bl GetPortraitData
	ldr r0, [r0]
	cmp r0, #0
	beq _080C0CC0
	ldr r0, _080C0CBC  @ gUnknown_08A01EE4
	movs r1, #0x40
	movs r2, #0x20
	bl CopyToPaletteBuffer
	b _080C0CCA
	.align 2, 0
_080C0CB4: .4byte gGMData
_080C0CB8: .4byte gBG2TilemapBuffer+0x064
_080C0CBC: .4byte gUnknown_08A01EE4
_080C0CC0:
	ldr r0, _080C0CF0  @ gUnknown_08A01F04
	movs r1, #0x40
	movs r2, #0x20
	bl CopyToPaletteBuffer
_080C0CCA:
	bl MU_EndAll
	ldr r0, [r5, #0x2c]
	movs r1, #0xd8
	movs r2, #0x87
	bl MU_CreateForUI
	str r0, [r5, #0x30]
	adds r0, r5, #0
	bl sub_80C0A9C
	movs r0, #7
	bl BG_EnableSyncByMask
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C0CF0: .4byte gUnknown_08A01F04

	THUMB_FUNC_END sub_80C0C44

	THUMB_FUNC_START sub_80C0CF4
sub_80C0CF4: @ 0x080C0CF4
	push {r4, r5, r6, r7, lr}
	ldr r0, _080C0DB0  @ gUnknown_08A3E888
	bl SetupBackgrounds
	ldr r7, _080C0DB4  @ gBG0TilemapBuffer
	adds r0, r7, #0
	movs r1, #0
	bl BG_Fill
	ldr r5, _080C0DB8  @ gBG1TilemapBuffer
	adds r0, r5, #0
	movs r1, #0
	bl BG_Fill
	ldr r6, _080C0DBC  @ gBG2TilemapBuffer
	adds r0, r6, #0
	movs r1, #0
	bl BG_Fill
	movs r0, #7
	bl BG_EnableSyncByMask
	bl ReadGameSaveCoreGfx
	bl SetupMapSpritesPalettes
	ldr r1, _080C0DC0  @ 0x0600B000
	movs r2, #1
	negs r2, r2
	movs r0, #0
	bl StartMuralBackground
	ldr r0, _080C0DC4  @ gUnknown_08A986C0
	ldr r1, _080C0DC8  @ 0x06003000
	bl Decompress
	ldr r0, _080C0DCC  @ gUnknown_08A98DCC
	movs r1, #0xc0
	movs r2, #0x60
	bl CopyToPaletteBuffer
	bl EnablePaletteSync
	ldr r0, _080C0DD0  @ gUnknown_08A98BF8
	ldr r4, _080C0DD4  @ gGenericBuffer
	adds r1, r4, #0
	bl Decompress
	movs r2, #0x80
	lsls r2, r2, #5
	adds r0, r5, #0
	adds r1, r4, #0
	bl CallARM_FillTileRect
	movs r0, #0xe1
	lsls r0, r0, #2
	adds r5, r5, r0
	ldr r1, _080C0DD8  @ gUnknown_08A98CFC
	movs r4, #0xc3
	lsls r4, r4, #7
	adds r0, r5, #0
	adds r2, r4, #0
	bl CallARM_FillTileRect
	adds r0, r7, #0
	adds r0, #0xc4
	ldr r1, _080C0DDC  @ gUnknown_08A98D58
	adds r2, r4, #0
	bl CallARM_FillTileRect
	movs r1, #0x91
	lsls r1, r1, #2
	adds r0, r7, r1
	ldr r1, _080C0DE0  @ gUnknown_08A98D88
	adds r2, r4, #0
	bl CallARM_FillTileRect
	movs r1, #0xb1
	lsls r1, r1, #2
	adds r0, r7, r1
	ldr r1, _080C0DE4  @ gUnknown_08A98DA0
	adds r2, r4, #0
	bl CallARM_FillTileRect
	ldr r0, _080C0DE8  @ 0x00000432
	adds r6, r6, r0
	ldr r1, _080C0DEC  @ gUnknown_08A98DB8
	adds r0, r6, #0
	adds r2, r4, #0
	bl CallARM_FillTileRect
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C0DB0: .4byte gUnknown_08A3E888
_080C0DB4: .4byte gBG0TilemapBuffer
_080C0DB8: .4byte gBG1TilemapBuffer
_080C0DBC: .4byte gBG2TilemapBuffer
_080C0DC0: .4byte 0x0600B000
_080C0DC4: .4byte gUnknown_08A986C0
_080C0DC8: .4byte 0x06003000
_080C0DCC: .4byte gUnknown_08A98DCC
_080C0DD0: .4byte gUnknown_08A98BF8
_080C0DD4: .4byte gGenericBuffer
_080C0DD8: .4byte gUnknown_08A98CFC
_080C0DDC: .4byte gUnknown_08A98D58
_080C0DE0: .4byte gUnknown_08A98D88
_080C0DE4: .4byte gUnknown_08A98DA0
_080C0DE8: .4byte 0x00000432
_080C0DEC: .4byte gUnknown_08A98DB8

	THUMB_FUNC_END sub_80C0CF4

	THUMB_FUNC_START sub_80C0DF0
sub_80C0DF0: @ 0x080C0DF0
	push {r4, lr}
	sub sp, #4
	ldr r2, _080C0E44  @ gLCDControlBuffer
	ldrb r1, [r2, #1]
	movs r0, #2
	negs r0, r0
	ands r0, r1
	movs r1, #3
	negs r1, r1
	ands r0, r1
	subs r1, #2
	ands r0, r1
	subs r1, #4
	ands r0, r1
	subs r1, #8
	ands r0, r1
	strb r0, [r2, #1]
	movs r0, #3
	movs r1, #0
	movs r2, #0
	movs r3, #0x10
	bl SetSpecialColorEffectsParameters
	movs r4, #0
	str r4, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl SetBlendTargetA
	movs r0, #1
	bl SetBlendBackdropA
	ldr r0, _080C0E48  @ gPaletteBuffer
	strh r4, [r0]
	bl EnablePaletteSync
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C0E44: .4byte gLCDControlBuffer
_080C0E48: .4byte gPaletteBuffer

	THUMB_FUNC_END sub_80C0DF0

	THUMB_FUNC_START sub_80C0E4C
sub_80C0E4C: @ 0x080C0E4C
	push {lr}
	bl EndMuralBackground
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80C0E4C

	THUMB_FUNC_START sub_80C0E58
sub_80C0E58: @ 0x080C0E58
	push {r4, lr}
	sub sp, #4
	ldr r3, _080C0EB8  @ gLCDControlBuffer
	ldrb r1, [r3, #0xc]
	movs r2, #4
	negs r2, r2
	adds r0, r2, #0
	ands r0, r1
	movs r1, #1
	orrs r0, r1
	strb r0, [r3, #0xc]
	ldrb r0, [r3, #0x10]
	movs r1, #3
	orrs r0, r1
	strb r0, [r3, #0x10]
	ldrb r0, [r3, #0x14]
	ands r2, r0
	movs r0, #2
	orrs r2, r0
	strb r2, [r3, #0x14]
	ldrb r0, [r3, #0x18]
	orrs r0, r1
	strb r0, [r3, #0x18]
	movs r4, #0
	str r4, [sp]
	movs r0, #0
	movs r1, #1
	movs r2, #0
	movs r3, #0
	bl SetBlendTargetA
	str r4, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #1
	bl SetBlendTargetB
	movs r0, #1
	movs r1, #0xd
	movs r2, #3
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C0EB8: .4byte gLCDControlBuffer

	THUMB_FUNC_END sub_80C0E58

	THUMB_FUNC_START sub_80C0EBC
sub_80C0EBC: @ 0x080C0EBC
	push {r4, r5, lr}
	ldr r4, _080C0EFC  @ gBG0TilemapBuffer+0x3C6
	bl GetGameClock
	adds r2, r0, #0
	adds r0, r4, #0
	movs r1, #2
	movs r3, #0
	bl PutTime
	adds r5, r4, #0
	subs r5, #0xf0
	bl GetPartyGoldAmount
	adds r2, r0, #0
	adds r0, r5, #0
	movs r1, #2
	bl PutNumber
	subs r4, #0xee
	adds r0, r4, #0
	movs r1, #3
	movs r2, #0x1e
	bl PutSpecialChar
	movs r0, #1
	bl BG_EnableSyncByMask
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C0EFC: .4byte gBG0TilemapBuffer+0x3C6

	THUMB_FUNC_END sub_80C0EBC

	THUMB_FUNC_START sub_80C0F00
sub_80C0F00: @ 0x080C0F00
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r0, _080C0F24  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0
	beq _080C0F28
	adds r0, r5, #0
	bl sub_80C09EC
	b _080C0F8E
	.align 2, 0
_080C0F24: .4byte gKeyStatusPtr
_080C0F28:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080C0F8E
	ldr r2, _080C0F98  @ gLCDControlBuffer
	ldrb r1, [r2, #1]
	movs r0, #2
	negs r0, r0
	ands r0, r1
	movs r1, #3
	negs r1, r1
	ands r0, r1
	subs r1, #2
	ands r0, r1
	subs r1, #4
	ands r0, r1
	subs r1, #8
	ands r0, r1
	strb r0, [r2, #1]
	movs r0, #3
	movs r1, #0
	movs r2, #0
	movs r3, #0x10
	bl SetSpecialColorEffectsParameters
	str r4, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl SetBlendTargetA
	movs r0, #1
	bl SetBlendBackdropA
	ldr r0, _080C0F9C  @ gPaletteBuffer
	strh r4, [r0]
	bl EnablePaletteSync
	adds r0, r5, #0
	bl Proc_Break
	ldr r0, _080C0FA0  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080C0F8E
	movs r0, #0x6b
	bl m4aSongNumStart
_080C0F8E:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C0F98: .4byte gLCDControlBuffer
_080C0F9C: .4byte gPaletteBuffer
_080C0FA0: .4byte gPlaySt

	THUMB_FUNC_END sub_80C0F00

	THUMB_FUNC_START sub_80C0FA4
sub_80C0FA4: @ 0x080C0FA4
	push {lr}
	movs r0, #0
	bl SetInterrupt_LCDVCountMatch
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80C0FA4

	THUMB_FUNC_START sub_80C0FB0
sub_80C0FB0: @ 0x080C0FB0
	adds r2, r0, #0
	ldr r3, _080C0FE4  @ gLCDControlBuffer
	ldr r0, [r2, #0x34]
	ldr r1, [r2, #0x38]
	str r0, [r3, #0x3c]
	str r1, [r3, #0x40]
	adds r0, r2, #0
	adds r0, #0x3c
	ldrb r1, [r0]
	adds r0, r3, #0
	adds r0, #0x44
	strb r1, [r0]
	adds r0, r2, #0
	adds r0, #0x3d
	ldrb r0, [r0]
	adds r1, r3, #0
	adds r1, #0x45
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x3e
	ldrb r1, [r0]
	adds r0, r3, #0
	adds r0, #0x46
	strb r1, [r0]
	bx lr
	.align 2, 0
_080C0FE4: .4byte gLCDControlBuffer

	THUMB_FUNC_END sub_80C0FB0

	THUMB_FUNC_START sub_80C0FE8
sub_80C0FE8: @ 0x080C0FE8
	push {r4, lr}
	sub sp, #4
	adds r3, r0, #0
	movs r0, #0
	strh r0, [r3, #0x30]
	movs r0, #4
	strh r0, [r3, #0x2e]
	strh r0, [r3, #0x2c]
	adds r2, r3, #0
	adds r2, #0x29
	ldrb r0, [r2]
	movs r4, #2
	negs r4, r4
	ands r4, r0
	strb r4, [r2]
	ldr r0, _080C1024  @ gGMData
	ldrb r1, [r0]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _080C1028
	movs r0, #2
	adds r1, r4, #0
	orrs r1, r0
	strb r1, [r2]
	adds r1, r3, #0
	adds r1, #0x2a
	movs r0, #0xff
	b _080C1036
	.align 2, 0
_080C1024: .4byte gGMData
_080C1028:
	movs r0, #3
	negs r0, r0
	ands r0, r4
	strb r0, [r2]
	adds r1, r3, #0
	adds r1, #0x2a
	movs r0, #0
_080C1036:
	strb r0, [r1]
	adds r2, r3, #0
	adds r2, #0x2b
	ldrb r1, [r2]
	movs r0, #2
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	ldr r2, _080C10B4  @ gLCDControlBuffer
	ldr r0, [r2, #0x3c]
	ldr r1, [r2, #0x40]
	str r0, [r3, #0x34]
	str r1, [r3, #0x38]
	adds r0, r2, #0
	adds r0, #0x44
	ldrb r1, [r0]
	adds r0, r3, #0
	adds r0, #0x3c
	movs r4, #0
	strb r1, [r0]
	adds r0, r2, #0
	adds r0, #0x45
	ldrb r0, [r0]
	adds r1, r3, #0
	adds r1, #0x3d
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x46
	ldrb r1, [r0]
	adds r0, r3, #0
	adds r0, #0x3e
	strb r1, [r0]
	str r4, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl SetBlendTargetA
	str r4, [sp]
	movs r0, #1
	movs r1, #1
	movs r2, #1
	movs r3, #1
	bl SetBlendTargetB
	movs r0, #0
	bl SetBlendBackdropA
	movs r0, #0
	bl SetBlendBackdropB
	movs r0, #0
	movs r1, #0x10
	movs r2, #0x10
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C10B4: .4byte gLCDControlBuffer

	THUMB_FUNC_END sub_80C0FE8

	THUMB_FUNC_START sub_80C10B8
sub_80C10B8: @ 0x080C10B8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	subs r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	cmp r0, #0
	bgt _080C1190
	movs r5, #0
	adds r7, r4, #0
	adds r7, #0x29
	movs r0, #0x1f
	mov r8, r0
	ldr r6, _080C10F0  @ gPaletteBuffer+0x2C0
_080C10D8:
	ldrb r1, [r7]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080C10F4
	movs r1, #0x30
	ldrsh r0, [r4, r1]
	adds r0, r0, r5
	mov r2, r8
	ands r0, r2
	b _080C1102
	.align 2, 0
_080C10F0: .4byte gPaletteBuffer+0x2C0
_080C10F4:
	adds r1, r5, #0
	adds r1, #0x20
	movs r2, #0x30
	ldrsh r0, [r4, r2]
	subs r0, r1, r0
	mov r1, r8
	ands r0, r1
_080C1102:
	lsls r0, r0, #1
	ldr r1, _080C1160  @ gUnknown_08A97E48
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r6]
	ldrh r0, [r4, #0x30]
	movs r1, #0xf
	subs r1, r1, r0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	movs r0, #0
	movs r2, #0x10
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	adds r6, #2
	adds r5, #1
	cmp r5, #0xf
	ble _080C10D8
	ldrh r0, [r4, #0x2e]
	movs r5, #0
	strh r0, [r4, #0x2c]
	bl EnablePaletteSync
	ldrh r0, [r4, #0x30]
	adds r0, #1
	strh r0, [r4, #0x30]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xf
	ble _080C1190
	ldrb r1, [r7]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _080C1164
	adds r2, r4, #0
	adds r2, #0x2b
	ldrb r0, [r2]
	movs r1, #1
	orrs r0, r1
	strb r0, [r2]
	adds r0, r4, #0
	bl Proc_Break
	b _080C1190
	.align 2, 0
_080C1160: .4byte gUnknown_08A97E48
_080C1164:
	adds r1, r4, #0
	adds r1, #0x2a
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bge _080C1174
	strh r5, [r4, #0x30]
	b _080C1190
_080C1174:
	cmp r0, #0
	ble _080C1190
	strh r5, [r4, #0x30]
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080C1190
	ldrb r1, [r7]
	movs r0, #3
	negs r0, r0
	ands r0, r1
	strb r0, [r7]
_080C1190:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80C10B8

	THUMB_FUNC_START sub_80C119C
sub_80C119C: @ 0x080C119C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	mov r8, r0
	ldr r2, _080C11C8  @ gGMData
	ldrb r1, [r2]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _080C11CC
	mov r4, sp
	adds r4, #6
	add r0, sp, #4
	adds r1, r4, #0
	bl GetWMDisplayPosition
	mov sl, r4
	b _080C11DA
	.align 2, 0
_080C11C8: .4byte gGMData
_080C11CC:
	add r1, sp, #4
	ldrh r0, [r2, #2]
	strh r0, [r1]
	adds r1, #2
	ldrh r0, [r2, #4]
	strh r0, [r1]
	mov sl, r1
_080C11DA:
	movs r7, #0
	movs r0, #0x2a
	add r0, r8
	mov r9, r0
_080C11E2:
	mov r1, r9
	ldrb r2, [r1]
	lsls r2, r2, #5
	lsls r0, r7, #3
	ldr r1, _080C124C  @ gUnknown_08A3E9A0
	adds r0, r0, r1
	adds r5, r2, r0
	movs r2, #5
	ldrsb r2, [r5, r2]
	mov r3, r8
	ldrh r3, [r3, #0x2c]
	adds r2, r2, r3
	add r0, sp, #4
	ldrh r0, [r0]
	subs r2, r2, r0
	lsls r2, r2, #0x10
	movs r0, #6
	ldrsb r0, [r5, r0]
	mov r1, r8
	ldrh r1, [r1, #0x2e]
	adds r0, r0, r1
	mov r3, sl
	ldrh r1, [r3]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsrs r3, r2, #0x10
	movs r1, #0x80
	lsls r1, r1, #0xe
	adds r2, r2, r1
	lsrs r2, r2, #0x10
	movs r1, #0x88
	lsls r1, r1, #1
	cmp r2, r1
	bhi _080C1274
	lsls r1, r0, #0x10
	movs r2, #0x80
	lsls r2, r2, #0xe
	adds r0, r1, r2
	lsrs r0, r0, #0x10
	adds r2, r1, #0
	cmp r0, #0xc0
	bhi _080C1274
	ldr r0, _080C1250  @ gGMData
	ldrb r1, [r0]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _080C1254
	movs r6, #0xc
	movs r4, #0xc0
	lsls r4, r4, #4
	b _080C125A
	.align 2, 0
_080C124C: .4byte gUnknown_08A3E9A0
_080C1250: .4byte gGMData
_080C1254:
	movs r6, #0xd
	movs r4, #0x80
	lsls r4, r4, #4
_080C125A:
	lsls r1, r3, #0x10
	asrs r1, r1, #0x10
	asrs r2, r2, #0x10
	ldr r3, [r5]
	ldrb r0, [r5, #4]
	movs r5, #0xc3
	lsls r5, r5, #7
	adds r4, r4, r5
	adds r0, r0, r4
	str r0, [sp]
	adds r0, r6, #0
	bl PutSprite
_080C1274:
	adds r7, #1
	cmp r7, #3
	ble _080C11E2
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80C119C

	THUMB_FUNC_START sub_80C128C
sub_80C128C: @ 0x080C128C
	push {lr}
	ldr r0, _080C12A4  @ gUnknown_08A3EA38
	bl sub_80034FC
	cmp r0, #1
	bgt _080C129E
	ldr r0, _080C12A8  @ gUnknown_08A3EA00
	bl Proc_EndEach
_080C129E:
	pop {r0}
	bx r0
	.align 2, 0
_080C12A4: .4byte gUnknown_08A3EA38
_080C12A8: .4byte gUnknown_08A3EA00

	THUMB_FUNC_END sub_80C128C

	THUMB_FUNC_START sub_80C12AC
sub_80C12AC: @ 0x080C12AC
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _080C130C  @ gUnknown_08A3EA38
	bl sub_80034FC
	cmp r0, #1
	bgt _080C12E0
	ldr r0, _080C1310  @ gUnknown_08A97E28
	movs r1, #0xb0
	lsls r1, r1, #2
	movs r2, #0x20
	bl CopyToPaletteBuffer
	bl EnablePaletteSync
	ldr r0, _080C1314  @ gUnknown_08A97C98
	ldr r4, _080C1318  @ gGenericBuffer
	adds r1, r4, #0
	bl Decompress
	ldr r1, _080C131C  @ 0x06013000
	adds r0, r4, #0
	movs r2, #6
	movs r3, #4
	bl Copy2dChr
_080C12E0:
	ldr r4, _080C1320  @ gUnknown_08A3EA00
	adds r0, r4, #0
	bl Proc_Find
	cmp r0, #0
	bne _080C12F4
	adds r0, r4, #0
	adds r1, r5, #0
	bl Proc_Start
_080C12F4:
	movs r0, #0
	strh r0, [r5, #0x2e]
	strh r0, [r5, #0x2c]
	adds r2, r5, #0
	adds r2, #0x29
	ldrb r1, [r2]
	subs r0, #2
	ands r0, r1
	strb r0, [r2]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C130C: .4byte gUnknown_08A3EA38
_080C1310: .4byte gUnknown_08A97E28
_080C1314: .4byte gUnknown_08A97C98
_080C1318: .4byte gGenericBuffer
_080C131C: .4byte 0x06013000
_080C1320: .4byte gUnknown_08A3EA00

	THUMB_FUNC_END sub_80C12AC

	THUMB_FUNC_START sub_80C1324
sub_80C1324: @ 0x080C1324
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _080C136C  @ gUnknown_08A3EA00
	bl Proc_Find
	adds r4, r0, #0
	cmp r4, #0
	bne _080C133A
	adds r0, r5, #0
	bl Proc_Break
_080C133A:
	adds r0, r4, #0
	adds r0, #0x2b
	ldrb r1, [r0]
	movs r4, #1
	adds r0, r4, #0
	ands r0, r1
	cmp r0, #0
	beq _080C1350
	adds r0, r5, #0
	bl Proc_Break
_080C1350:
	adds r0, r5, #0
	adds r0, #0x29
	ldrb r1, [r0]
	adds r0, r4, #0
	ands r0, r1
	cmp r0, #0
	beq _080C1364
	adds r0, r5, #0
	bl sub_80C119C
_080C1364:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C136C: .4byte gUnknown_08A3EA00

	THUMB_FUNC_END sub_80C1324

	THUMB_FUNC_START sub_80C1370
sub_80C1370: @ 0x080C1370
	push {r4, lr}
	adds r2, r0, #0
	adds r4, r1, #0
	cmp r2, #0
	beq _080C1394
	ldr r0, _080C138C  @ gGMData
	ldrb r1, [r0]
	movs r0, #8
	ands r0, r1
	ldr r0, _080C1390  @ gUnknown_08A3EA38
	adds r1, r2, #0
	bl Proc_StartBlocking
	b _080C13BC
	.align 2, 0
_080C138C: .4byte gGMData
_080C1390: .4byte gUnknown_08A3EA38
_080C1394:
	ldr r0, _080C13AC  @ gGMData
	ldrb r1, [r0]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _080C13B4
	ldr r0, _080C13B0  @ gUnknown_08A3EA38
	movs r1, #3
	bl Proc_Start
	b _080C13BC
	.align 2, 0
_080C13AC: .4byte gGMData
_080C13B0: .4byte gUnknown_08A3EA38
_080C13B4:
	ldr r0, _080C13C8  @ gUnknown_08A3EA38
	movs r1, #3
	bl Proc_StartBlocking
_080C13BC:
	adds r1, r0, #0
	adds r1, #0x2a
	strb r4, [r1]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080C13C8: .4byte gUnknown_08A3EA38

	THUMB_FUNC_END sub_80C1370

	THUMB_FUNC_START sub_80C13CC
sub_80C13CC: @ 0x080C13CC
	push {lr}
	bl Proc_End
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80C13CC

	THUMB_FUNC_START sub_80C13D8
sub_80C13D8: @ 0x080C13D8
	push {lr}
	ldr r0, _080C13E4  @ gUnknown_08A3EA38
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
_080C13E4: .4byte gUnknown_08A3EA38

	THUMB_FUNC_END sub_80C13D8

	THUMB_FUNC_START sub_80C13E8
sub_80C13E8: @ 0x080C13E8
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r5, r0, #0
	adds r4, r1, #0
	adds r7, r2, #0
	mov r9, r3
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	mov r8, sp
	ldr r6, _080C1458  @ gProcScr_WorldMapMain
	adds r0, r6, #0
	bl Proc_Find
	ldr r0, [r0, #0x44]
	ldrh r0, [r0, #0x34]
	mov r1, r8
	strh r0, [r1]
	movs r0, #2
	add r0, sp
	mov r8, r0
	adds r0, r6, #0
	bl Proc_Find
	ldr r0, [r0, #0x44]
	ldrh r1, [r0, #0x36]
	mov r0, r8
	strh r1, [r0]
	mov r0, sp
	ldrh r0, [r0]
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	subs r5, r5, r0
	strh r5, [r7]
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	subs r4, r4, r1
	mov r1, r9
	strh r4, [r1]
	adds r4, #0x20
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	cmp r4, #0xdf
	bhi _080C1460
	ldrh r0, [r7]
	adds r0, #0x20
	lsls r0, r0, #0x10
	ldr r1, _080C145C  @ 0x012F0000
	cmp r0, r1
	bhi _080C1460
	movs r0, #1
	b _080C1462
	.align 2, 0
_080C1458: .4byte gProcScr_WorldMapMain
_080C145C: .4byte 0x012F0000
_080C1460:
	movs r0, #0
_080C1462:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80C13E8

	THUMB_FUNC_START sub_80C1470
sub_80C1470: @ 0x080C1470
	push {lr}
	ldr r0, [r0, #0x50]
	cmp r0, #0
	beq _080C147C
	bl AP_Delete
_080C147C:
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80C1470

	THUMB_FUNC_START sub_80C1480
sub_80C1480: @ 0x080C1480
	push {r4, r5, r6, lr}
	mov r6, r9
	mov r5, r8
	push {r5, r6}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, _080C151C  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080C149E
	movs r0, #0x77
	bl m4aSongNumStart
_080C149E:
	movs r1, #0
	str r1, [r4, #0x50]
	adds r0, r4, #0
	adds r0, #0x64
	strh r1, [r0]
	ldr r4, _080C1520  @ gSinLookup
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
_080C151C: .4byte gPlaySt
_080C1520: .4byte gSinLookup

	THUMB_FUNC_END sub_80C1480

	THUMB_FUNC_START sub_80C1524
sub_80C1524: @ 0x080C1524
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r7, r0, #0
	adds r4, r7, #0
	adds r4, #0x64
	ldrh r0, [r4]
	adds r1, r0, #1
	strh r1, [r4]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #7
	ble _080C154A
	adds r0, r7, #0
	bl Proc_Break
_080C154A:
	movs r1, #0x80
	lsls r1, r1, #2
	movs r0, #0x80
	lsls r0, r0, #1
	mov sl, r0
	movs r2, #0
	ldrsh r3, [r4, r2]
	movs r0, #8
	str r0, [sp]
	movs r0, #5
	mov r2, sl
	bl Interpolate
	mov r8, r0
	ldr r4, _080C1604  @ gSinLookup
	movs r0, #0x80
	adds r0, r0, r4
	mov r9, r0
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r0, r0, #4
	mov r1, r8
	bl Div
	adds r6, r0, #0
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	movs r2, #0
	ldrsh r0, [r4, r2]
	negs r0, r0
	lsls r0, r0, #4
	mov r1, r8
	bl Div
	adds r5, r0, #0
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	movs r1, #0
	ldrsh r0, [r4, r1]
	lsls r0, r0, #4
	mov r1, r8
	bl Div
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	mov r2, r9
	movs r1, #0
	ldrsh r0, [r2, r1]
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
	ldr r0, [r7, #0x2c]
	subs r0, #8
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r1, [r7, #0x30]
	subs r1, #8
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	mov r4, sp
	adds r4, #6
	add r2, sp, #4
	adds r3, r4, #0
	bl sub_80C13E8
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080C1608
	ldr r0, [r7, #0x50]
	add r1, sp, #4
	movs r2, #0
	ldrsh r1, [r1, r2]
	ldrh r2, [r4]
	movs r4, #0xc0
	lsls r4, r4, #2
	adds r3, r4, #0
	orrs r2, r3
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	bl AP_Update
	b _080C1614
	.align 2, 0
_080C1604: .4byte gSinLookup
_080C1608:
	ldr r0, [r7, #0x50]
	movs r2, #0xec
	lsls r2, r2, #2
	mov r1, sl
	bl AP_Update
_080C1614:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80C1524

	THUMB_FUNC_START sub_80C1624
sub_80C1624: @ 0x080C1624
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r0, #0x64
	ldrh r1, [r0]
	adds r2, r1, #1
	strh r2, [r0]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	cmp r1, #0x27
	ble _080C1640
	adds r0, r4, #0
	bl Proc_Break
_080C1640:
	movs r1, #0x2c
	ldrsh r0, [r4, r1]
	movs r2, #0x30
	ldrsh r1, [r4, r2]
	mov r5, sp
	adds r5, #2
	mov r2, sp
	adds r3, r5, #0
	bl sub_80C13E8
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080C1676
	ldr r0, [r4, #0x50]
	mov r1, sp
	movs r4, #0
	ldrsh r1, [r1, r4]
	ldrh r2, [r5]
	movs r4, #0x80
	lsls r4, r4, #1
	adds r3, r4, #0
	orrs r2, r3
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	bl AP_Update
	b _080C1684
_080C1676:
	ldr r0, [r4, #0x50]
	movs r1, #0x80
	lsls r1, r1, #1
	movs r2, #0xec
	lsls r2, r2, #2
	bl AP_Update
_080C1684:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80C1624

	THUMB_FUNC_START sub_80C168C
sub_80C168C: @ 0x080C168C
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	ldr r0, _080C16CC  @ gUnknown_089ADD4C
	ldr r1, _080C16D0  @ 0x06013000
	bl Decompress
	ldr r0, _080C16D4  @ gUnknown_089A8EF8
	movs r1, #7
	bl AP_Create
	adds r4, r0, #0
	movs r0, #0x8c
	lsls r0, r0, #5
	strh r0, [r4, #0x22]
	adds r0, r4, #0
	movs r1, #0
	bl AP_SwitchAnimation
	ldr r0, _080C16D8  @ gUnknown_08A3EA70
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x50]
	adds r5, #8
	str r5, [r0, #0x2c]
	subs r6, #8
	str r6, [r0, #0x30]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080C16CC: .4byte gUnknown_089ADD4C
_080C16D0: .4byte 0x06013000
_080C16D4: .4byte gUnknown_089A8EF8
_080C16D8: .4byte gUnknown_08A3EA70

	THUMB_FUNC_END sub_80C168C

	THUMB_FUNC_START sub_80C16DC
sub_80C16DC: @ 0x080C16DC
	push {lr}
	ldr r0, _080C16F0  @ gUnknown_08A3EA70
	bl Proc_Find
	cmp r0, #0
	beq _080C16EA
	movs r0, #1
_080C16EA:
	pop {r1}
	bx r1
	.align 2, 0
_080C16F0: .4byte gUnknown_08A3EA70

	THUMB_FUNC_END sub_80C16DC

	THUMB_FUNC_START sub_80C16F4
sub_80C16F4: @ 0x080C16F4
	push {r4, r5, r6, lr}
	movs r6, #0
	ldr r2, _080C1720  @ gUnknown_08206954
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r4, r1, r2
	movs r5, #2
_080C1704:
	bl NextRN_100
	ldr r1, [r4]
	cmp r0, r1
	bge _080C1710
	adds r6, #1
_080C1710:
	adds r4, #4
	subs r5, #1
	cmp r5, #0
	bge _080C1704
	adds r0, r6, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_080C1720: .4byte gUnknown_08206954

	THUMB_FUNC_END sub_80C16F4

	THUMB_FUNC_START sub_80C1724
sub_80C1724: @ 0x080C1724
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	movs r2, #0
	movs r1, #0
	cmp r1, r4
	bge _080C173E
_080C1732:
	adds r0, r5, r1
	ldrb r0, [r0]
	adds r2, r2, r0
	adds r1, #1
	cmp r1, r4
	blt _080C1732
_080C173E:
	cmp r2, #0
	bne _080C1748
	movs r0, #1
	negs r0, r0
	b _080C176E
_080C1748:
	adds r0, r2, #0
	bl NextRN_N
	adds r3, r0, #0
	movs r1, #0
	cmp r1, r4
	bge _080C176C
	ldrb r2, [r5]
	cmp r3, r2
	blt _080C176C
_080C175C:
	adds r1, #1
	cmp r1, r4
	bge _080C176C
	adds r0, r5, r1
	ldrb r0, [r0]
	adds r2, r2, r0
	cmp r3, r2
	bge _080C175C
_080C176C:
	adds r0, r1, #0
_080C176E:
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80C1724

	THUMB_FUNC_START sub_80C1774
sub_80C1774: @ 0x080C1774
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x1c
	adds r3, r0, #0
	str r1, [sp, #0x18]
	cmp r3, #0
	blt _080C1800
	cmp r3, #9
	ble _080C17F4
	cmp r3, #0x38
	beq _080C17F4
	cmp r3, #0
	blt _080C1800
	ldr r0, _080C17BC  @ gPlaySt
	ldrb r0, [r0, #0x1b]
	cmp r0, #2
	beq _080C17A0
	cmp r0, #3
	beq _080C17C8
_080C17A0:
	movs r2, #0
	ldr r4, _080C17C0  @ gUnknown_082069D8
	ldrb r0, [r4]
	ldr r1, _080C17C4  @ gUnknown_082069EE
	cmp r0, r3
	beq _080C17E2
_080C17AC:
	adds r2, #1
	cmp r2, #0xa
	bhi _080C17E2
	adds r0, r2, r4
	ldrb r0, [r0]
	cmp r0, r3
	bne _080C17AC
	b _080C17E2
	.align 2, 0
_080C17BC: .4byte gPlaySt
_080C17C0: .4byte gUnknown_082069D8
_080C17C4: .4byte gUnknown_082069EE
_080C17C8:
	movs r2, #0
	ldr r4, _080C17F8  @ gUnknown_082069E3
	ldrb r0, [r4]
	ldr r1, _080C17FC  @ gUnknown_08206A51
	cmp r0, r3
	beq _080C17E2
_080C17D4:
	adds r2, #1
	cmp r2, #0xa
	bhi _080C17E2
	adds r0, r2, r4
	ldrb r0, [r0]
	cmp r0, r3
	bne _080C17D4
_080C17E2:
	lsls r0, r2, #3
	adds r0, r0, r2
	adds r4, r0, r1
	adds r0, r2, #0
	bl sub_80C16F4
	mov r8, r0
	cmp r0, #0
	bgt _080C1822
_080C17F4:
	movs r0, #0
	b _080C18C2
	.align 2, 0
_080C17F8: .4byte gUnknown_082069E3
_080C17FC: .4byte gUnknown_08206A51
_080C1800:
	ldr r0, _080C1810  @ gPlaySt
	ldrb r0, [r0, #0x1b]
	cmp r0, #2
	beq _080C180C
	cmp r0, #3
	beq _080C181C
_080C180C:
	ldr r4, _080C1814  @ gUnknown_08206A48
	b _080C181E
	.align 2, 0
_080C1810: .4byte gPlaySt
_080C1814: .4byte gUnknown_08206A48
_080C1818:
	adds r0, r6, #0
	b _080C18C2
_080C181C:
	ldr r4, _080C18D4  @ gUnknown_08206AAB
_080C181E:
	movs r0, #3
	mov r8, r0
_080C1822:
	mov r0, sp
	adds r1, r4, #0
	movs r2, #9
	bl memcpy
	movs r6, #0
	add r1, sp, #0x10
	mov sl, r1
	ldr r3, _080C18D8  @ gWMMonsterSpawnLocations
	ldr r0, _080C18DC  @ gGMData
	ldrb r1, [r0, #0x11]
	movs r2, #0
_080C183A:
	adds r0, r6, r3
	ldrb r0, [r0]
	cmp r0, r1
	bne _080C1848
	mov r4, sp
	adds r0, r4, r6
	strb r2, [r0]
_080C1848:
	adds r6, #1
	cmp r6, #8
	bls _080C183A
	mov r0, sl
	bl StoreRNState
	ldr r5, _080C18E0  @ gGmMonsterRnState
	adds r0, r5, #0
	bl LoadRNState
	movs r6, #0
	cmp r6, r8
	bge _080C18B4
	mov r9, r6
	add r7, sp, #0xc
	ldr r4, [sp, #0x18]
_080C1868:
	mov r0, sp
	movs r1, #9
	bl sub_80C1724
	adds r5, r0, #0
	cmp r5, #0
	blt _080C1818
	ldr r0, _080C18D8  @ gWMMonsterSpawnLocations
	adds r0, r5, r0
	ldrb r0, [r0]
	strb r0, [r4]
	ldrb r0, [r4]
	bl WMLoc_GetChapterId
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r1, r7, #0
	bl GetChapterSkirmishLeaderClasses
	movs r0, #3
	bl NextRN_N
	adds r1, r7, r0
	ldrb r1, [r1]
	strb r1, [r4, #1]
	mov r1, r9
	strb r1, [r4, #2]
	ldr r2, _080C18E4  @ gUnknown_03005349
	adds r1, r6, r2
	strb r0, [r1]
	mov r1, sp
	adds r0, r1, r5
	mov r2, r9
	strb r2, [r0]
	adds r4, #4
	adds r6, #1
	cmp r6, r8
	blt _080C1868
_080C18B4:
	ldr r0, _080C18E0  @ gGmMonsterRnState
	bl StoreRNState
	mov r0, sl
	bl LoadRNState
	mov r0, r8
_080C18C2:
	add sp, #0x1c
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080C18D4: .4byte gUnknown_08206AAB
_080C18D8: .4byte gWMMonsterSpawnLocations
_080C18DC: .4byte gGMData
_080C18E0: .4byte gGmMonsterRnState
_080C18E4: .4byte gUnknown_03005349

	THUMB_FUNC_END sub_80C1774

	THUMB_FUNC_START nullsub_72
nullsub_72: @ 0x080C18E8
	bx lr

	THUMB_FUNC_END nullsub_72

	THUMB_FUNC_START sub_80C18EC
sub_80C18EC: @ 0x080C18EC
	push {r4, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x29
	movs r0, #0
	strb r0, [r1]
	bl sub_80BD048
	adds r1, r4, #0
	adds r1, #0x2c
	bl sub_80C1774
	adds r1, r4, #0
	adds r1, #0x38
	strb r0, [r1]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080C1918
	adds r0, r4, #0
	movs r1, #0
	bl Proc_Goto
_080C1918:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80C18EC

	THUMB_FUNC_START sub_80C1920
sub_80C1920: @ 0x080C1920
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x18
	adds r7, r0, #0
	adds r0, #0x29
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _080C1A30
	ldr r0, _080C1A40  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080C194C
	ldr r0, _080C1A44  @ 0x00000312
	bl m4aSongNumStart
_080C194C:
	movs r6, #0
	adds r0, r7, #0
	adds r0, #0x38
	str r0, [sp, #0x10]
	ldrb r0, [r0]
	cmp r6, r0
	bge _080C1A2A
	add r1, sp, #8
	mov sl, r1
	movs r2, #0xa
	add r2, sp
	mov r9, r2
	add r3, sp, #0xc
	mov r8, r3
	adds r5, r7, #0
	adds r5, #0x2c
	movs r0, #0
	str r0, [sp, #0x14]
_080C1970:
	ldrb r0, [r5]
	lsls r0, r0, #5
	ldr r1, _080C1A48  @ gWMNodeData
	adds r0, r0, r1
	ldrh r0, [r0, #0x18]
	mov r2, sl
	strh r0, [r2]
	ldrb r0, [r5]
	lsls r0, r0, #5
	adds r0, r0, r1
	ldrh r0, [r0, #0x1a]
	mov r3, r9
	strh r0, [r3]
	ldr r0, _080C1A4C  @ gProcScr_WorldMapMain
	bl Proc_Find
	ldr r0, [r0, #0x44]
	ldrh r0, [r0, #0x34]
	mov r1, r8
	strh r0, [r1]
	mov r4, sp
	adds r4, #0xe
	ldr r0, _080C1A4C  @ gProcScr_WorldMapMain
	bl Proc_Find
	ldr r0, [r0, #0x44]
	ldrh r2, [r0, #0x36]
	strh r2, [r4]
	mov r3, sl
	ldrh r0, [r3]
	mov r3, r8
	ldrh r1, [r3]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	mov r3, r9
	ldrh r0, [r3]
	subs r0, r0, r2
	adds r0, #8
	lsls r2, r0, #0x10
	lsrs r0, r2, #0x10
	cmp r0, #0xaf
	bhi _080C19EE
	lsls r1, r1, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0xef
	bhi _080C19EE
	asrs r1, r1, #0x10
	asrs r2, r2, #0x10
	movs r0, #0
	str r0, [sp]
	movs r0, #7
	str r0, [sp, #4]
	ldr r0, _080C1A50  @ gUnknown_08A97AEC
	movs r3, #0xe2
	lsls r3, r3, #6
	bl APProc_Create
	adds r1, r7, #0
	adds r1, #0x3c
	ldr r2, [sp, #0x14]
	adds r1, r1, r2
	str r0, [r1]
_080C19EE:
	adds r4, r6, #4
	ldrb r1, [r5, #1]
	ldrb r3, [r5]
	adds r0, r4, #0
	movs r2, #1
	bl WM_PutClassSprite
	ldr r0, _080C1A54  @ gGMData
	lsls r1, r4, #2
	adds r1, r1, r0
	ldrb r2, [r1, #0x10]
	movs r0, #1
	orrs r0, r2
	strb r0, [r1, #0x10]
	ldr r0, _080C1A4C  @ gProcScr_WorldMapMain
	bl Proc_Find
	ldr r0, [r0, #0x54]
	adds r1, r4, #0
	bl GmMu_ShowUnit
	adds r5, #4
	ldr r3, [sp, #0x14]
	adds r3, #4
	str r3, [sp, #0x14]
	adds r6, #1
	ldr r0, [sp, #0x10]
	ldrb r0, [r0]
	cmp r6, r0
	blt _080C1970
_080C1A2A:
	adds r0, r7, #0
	bl Proc_Break
_080C1A30:
	add sp, #0x18
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C1A40: .4byte gPlaySt
_080C1A44: .4byte 0x00000312
_080C1A48: .4byte gWMNodeData
_080C1A4C: .4byte gProcScr_WorldMapMain
_080C1A50: .4byte gUnknown_08A97AEC
_080C1A54: .4byte gGMData

	THUMB_FUNC_END sub_80C1920

	THUMB_FUNC_START sub_80C1A58
sub_80C1A58: @ 0x080C1A58
	push {r4, lr}
	adds r4, r0, #0
	bl APProc_Exists
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080C1A6C
	adds r0, r4, #0
	bl Proc_Break
_080C1A6C:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80C1A58

	THUMB_FUNC_START sub_80C1A74
sub_80C1A74: @ 0x080C1A74
	push {r4, lr}
	adds r2, r0, #0
	adds r4, r1, #0
	cmp r2, #0
	bne _080C1A8C
	ldr r0, _080C1A88  @ gUnknown_08A3EAA8
	movs r1, #3
	bl Proc_Start
	b _080C1A94
	.align 2, 0
_080C1A88: .4byte gUnknown_08A3EAA8
_080C1A8C:
	ldr r0, _080C1AAC  @ gUnknown_08A3EAA8
	adds r1, r2, #0
	bl Proc_StartBlocking
_080C1A94:
	adds r1, r0, #0
	cmp r4, #0
	beq _080C1AA2
	adds r0, r1, #0
	adds r0, #0x38
	ldrb r0, [r0]
	str r0, [r4]
_080C1AA2:
	adds r0, r1, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080C1AAC: .4byte gUnknown_08A3EAA8

	THUMB_FUNC_END sub_80C1A74

	THUMB_FUNC_START sub_80C1AB0
sub_80C1AB0: @ 0x080C1AB0
	push {r4, lr}
	ldr r0, _080C1AD4  @ gUnknown_08A3EAA8
	bl Proc_EndEach
	movs r4, #0
_080C1ABA:
	ldr r0, _080C1AD8  @ gProcScr_WorldMapMain
	bl Proc_Find
	ldr r0, [r0, #0x54]
	adds r1, r4, #4
	bl GmMu_RemoveUnit
	adds r4, #1
	cmp r4, #2
	ble _080C1ABA
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C1AD4: .4byte gUnknown_08A3EAA8
_080C1AD8: .4byte gProcScr_WorldMapMain

	THUMB_FUNC_END sub_80C1AB0

	THUMB_FUNC_START sub_80C1ADC
sub_80C1ADC: @ 0x080C1ADC
	push {lr}
	ldr r0, _080C1AF4  @ gUnknown_08A3EAA8
	bl Proc_Find
	cmp r0, #0
	beq _080C1AF0
	adds r1, r0, #0
	adds r1, #0x29
	movs r0, #1
	strb r0, [r1]
_080C1AF0:
	pop {r0}
	bx r0
	.align 2, 0
_080C1AF4: .4byte gUnknown_08A3EAA8

	THUMB_FUNC_END sub_80C1ADC

	THUMB_FUNC_START sub_80C1AF8
sub_80C1AF8: @ 0x080C1AF8
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	sub sp, #8
	movs r6, #4
	ldr r0, _080C1B54  @ gGMData
	add r1, sp, #4
	mov r8, r1
	adds r5, r0, #0
	adds r5, #0x10
	ldr r3, _080C1B58  @ gWMNodeData
	mov r9, r3
	mov r7, sp
	adds r7, #6
_080C1B16:
	movs r1, #0x12
	ldrsh r0, [r5, r1]
	cmp r0, #0
	beq _080C1BC6
	ldrb r1, [r5, #0x10]
	movs r4, #2
	adds r0, r4, #0
	ands r0, r1
	cmp r0, #0
	beq _080C1B60
	ldr r0, _080C1B5C  @ gProcScr_WorldMapMain
	bl Proc_Find
	ldr r3, [r0, #0x54]
	ldrb r1, [r5, #0x10]
	adds r0, r4, #0
	ands r0, r1
	movs r2, #0
	cmp r0, #0
	beq _080C1B42
	movs r0, #0x12
	ldrsh r2, [r5, r0]
_080C1B42:
	ldrb r0, [r5, #0x11]
	str r0, [sp]
	adds r0, r3, #0
	adds r1, r6, #0
	movs r3, #1
	negs r3, r3
	bl MapMU_SetUnitClass
	b _080C1B88
	.align 2, 0
_080C1B54: .4byte gGMData
_080C1B58: .4byte gWMNodeData
_080C1B5C: .4byte gProcScr_WorldMapMain
_080C1B60:
	ldr r0, _080C1BDC  @ gProcScr_WorldMapMain
	bl Proc_Find
	ldr r3, [r0, #0x54]
	ldrb r1, [r5, #0x10]
	adds r0, r4, #0
	ands r0, r1
	movs r2, #0
	cmp r0, #0
	bne _080C1B78
	movs r1, #0x12
	ldrsh r2, [r5, r1]
_080C1B78:
	ldrb r0, [r5, #0x11]
	str r0, [sp]
	adds r0, r3, #0
	adds r1, r6, #0
	movs r3, #1
	negs r3, r3
	bl MapMU_SetUnitChar
_080C1B88:
	ldrb r0, [r5, #0x11]
	lsls r0, r0, #5
	add r0, r9
	ldrh r0, [r0, #0x18]
	mov r3, r8
	strh r0, [r3]
	ldrb r0, [r5, #0x11]
	lsls r0, r0, #5
	add r0, r9
	ldrh r0, [r0, #0x1a]
	strh r0, [r7]
	ldr r4, _080C1BDC  @ gProcScr_WorldMapMain
	adds r0, r4, #0
	bl Proc_Find
	ldr r0, [r0, #0x54]
	mov r1, r8
	movs r3, #0
	ldrsh r2, [r1, r3]
	movs r1, #0
	ldrsh r3, [r7, r1]
	adds r1, r6, #0
	bl GmMu_SetPosition
	adds r0, r4, #0
	bl Proc_Find
	ldr r0, [r0, #0x54]
	adds r1, r6, #0
	bl GmMu_ShowUnit
_080C1BC6:
	adds r5, #4
	adds r6, #1
	cmp r6, #6
	ble _080C1B16
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C1BDC: .4byte gProcScr_WorldMapMain

	THUMB_FUNC_END sub_80C1AF8

	THUMB_FUNC_START sub_80C1BE0
sub_80C1BE0: @ 0x080C1BE0
	push {lr}
	ldr r0, _080C1BF4  @ gUnknown_08A3EAA8
	bl Proc_Find
	cmp r0, #0
	beq _080C1BEE
	movs r0, #1
_080C1BEE:
	pop {r1}
	bx r1
	.align 2, 0
_080C1BF4: .4byte gUnknown_08A3EAA8

	THUMB_FUNC_END sub_80C1BE0

	THUMB_FUNC_START sub_80C1BF8
sub_80C1BF8: @ 0x080C1BF8
	push {r4, r5, r6, lr}
	ldr r0, _080C1C4C  @ 0x04000006
	ldrh r0, [r0]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	adds r6, r3, #0
	cmp r3, #0xe4
	bne _080C1C0C
	movs r3, #0
_080C1C0C:
	cmp r3, #0x9f
	bhi _080C1C60
	ldr r0, _080C1C50  @ gUnknown_0201C5D1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _080C1CB0
	ldr r0, _080C1C54  @ gUnknown_0201C5D0
	ldrb r1, [r0]
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #6
	ldr r1, _080C1C58  @ gUnknown_0201BE32
	adds r0, r0, r1
	lsls r1, r3, #1
	adds r1, r0, r1
	ldr r4, _080C1C5C  @ gUnknown_0201C5C0
	movs r5, #0xa0
	lsls r5, r5, #1
	movs r3, #2
_080C1C36:
	ldr r2, [r4]
	cmp r2, #0
	beq _080C1C40
	ldrh r0, [r1]
	strh r0, [r2]
_080C1C40:
	adds r1, r1, r5
	adds r4, #4
	subs r3, #1
	cmp r3, #0
	bge _080C1C36
	b _080C1CB0
	.align 2, 0
_080C1C4C: .4byte 0x04000006
_080C1C50: .4byte gUnknown_0201C5D1
_080C1C54: .4byte gUnknown_0201C5D0
_080C1C58: .4byte gUnknown_0201BE32
_080C1C5C: .4byte gUnknown_0201C5C0
_080C1C60:
	cmp r3, #0xa0
	bne _080C1CB0
	ldr r0, _080C1C94  @ gUnknown_0201BE30
	ldrb r1, [r0]
	movs r0, #4
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0
	beq _080C1CAC
	ldr r1, _080C1C98  @ gUnknown_0201C5D1
	movs r0, #1
	strb r0, [r1]
	ldr r1, _080C1C9C  @ gUnknown_0201C5D0
	ldr r0, _080C1CA0  @ gUnknown_0201C5CF
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r2, _080C1CA4  @ gUnknown_0201C5B4
	ldr r1, _080C1CA8  @ gUnknown_0201C5C0
	movs r3, #2
_080C1C88:
	ldm r2!, {r0}
	stm r1!, {r0}
	subs r3, #1
	cmp r3, #0
	bge _080C1C88
	b _080C1CB0
	.align 2, 0
_080C1C94: .4byte gUnknown_0201BE30
_080C1C98: .4byte gUnknown_0201C5D1
_080C1C9C: .4byte gUnknown_0201C5D0
_080C1CA0: .4byte gUnknown_0201C5CF
_080C1CA4: .4byte gUnknown_0201C5B4
_080C1CA8: .4byte gUnknown_0201C5C0
_080C1CAC:
	ldr r0, _080C1CEC  @ gUnknown_0201C5D1
	strb r1, [r0]
_080C1CB0:
	movs r3, #0
	cmp r6, #0x9f
	bhi _080C1CB8
	adds r3, r6, #0
_080C1CB8:
	movs r0, #1
	ands r0, r3
	cmp r0, #0
	bne _080C1CE4
	ldr r0, _080C1CF0  @ gUnknown_0201BE30
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080C1CE4
	ldr r1, _080C1CF4  @ gUnknown_0203E75C
	cmp r3, #0
	bne _080C1CD8
	ldr r0, _080C1CF8  @ gUnknown_0203E754
	ldr r0, [r0]
	str r0, [r1]
_080C1CD8:
	ldr r2, _080C1CFC  @ 0x04000040
	ldr r1, [r1]
	lsls r0, r3, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r2]
_080C1CE4:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080C1CEC: .4byte gUnknown_0201C5D1
_080C1CF0: .4byte gUnknown_0201BE30
_080C1CF4: .4byte gUnknown_0203E75C
_080C1CF8: .4byte gUnknown_0203E754
_080C1CFC: .4byte 0x04000040

	THUMB_FUNC_END sub_80C1BF8

	THUMB_FUNC_START sub_80C1D00
sub_80C1D00: @ 0x080C1D00
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	movs r1, #0
	ldr r0, _080C1D50  @ gUnknown_0201C5D0
	mov r8, r0
	ldr r6, _080C1D54  @ gUnknown_0201C5CF
	ldr r7, _080C1D58  @ gUnknown_0201C5D1
	ldr r0, _080C1D5C  @ gUnknown_0201BE30
	mov ip, r0
	ldr r5, _080C1D60  @ gUnknown_0201C5CC
	movs r2, #0
	ldr r4, _080C1D64  @ gUnknown_0201C5B4
	ldr r3, _080C1D68  @ gUnknown_0201C5C0
_080C1D1C:
	adds r0, r1, r5
	strb r2, [r0]
	stm r4!, {r2}
	stm r3!, {r2}
	adds r1, #1
	cmp r1, #2
	ble _080C1D1C
	movs r0, #0
	strb r0, [r6]
	mov r1, r8
	strb r0, [r1]
	strb r0, [r7]
	mov r1, ip
	strb r0, [r1]
	movs r0, #0
	bl SetPrimaryHBlankHandler
	ldr r0, _080C1D6C  @ sub_80C1BF8
	bl SetPrimaryHBlankHandler
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C1D50: .4byte gUnknown_0201C5D0
_080C1D54: .4byte gUnknown_0201C5CF
_080C1D58: .4byte gUnknown_0201C5D1
_080C1D5C: .4byte gUnknown_0201BE30
_080C1D60: .4byte gUnknown_0201C5CC
_080C1D64: .4byte gUnknown_0201C5B4
_080C1D68: .4byte gUnknown_0201C5C0
_080C1D6C: .4byte sub_80C1BF8

	THUMB_FUNC_END sub_80C1D00

	THUMB_FUNC_START sub_80C1D70
sub_80C1D70: @ 0x080C1D70
	push {r4, lr}
	sub sp, #4
	movs r0, #0
	bl SetPrimaryHBlankHandler
	mov r0, sp
	movs r4, #0
	strh r4, [r0]
	ldr r1, _080C1D94  @ gUnknown_0201BE32
	ldr r2, _080C1D98  @ 0x010003C0
	bl CpuSet
	ldr r0, _080C1D9C  @ gUnknown_0201BE30
	strb r4, [r0]
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C1D94: .4byte gUnknown_0201BE32
_080C1D98: .4byte 0x010003C0
_080C1D9C: .4byte gUnknown_0201BE30

	THUMB_FUNC_END sub_80C1D70

	THUMB_FUNC_START sub_80C1DA0
sub_80C1DA0: @ 0x080C1DA0
	adds r3, r0, #0
	ldr r0, _080C1DC0  @ gUnknown_0201C5CF
	ldrb r2, [r0]
	adds r2, r2, r1
	movs r0, #1
	ands r2, r0
	lsls r0, r2, #4
	subs r0, r0, r2
	lsls r0, r0, #6
	lsls r1, r3, #2
	adds r1, r1, r3
	lsls r1, r1, #6
	ldr r2, _080C1DC4  @ gUnknown_0201BE32
	adds r1, r1, r2
	adds r0, r0, r1
	bx lr
	.align 2, 0
_080C1DC0: .4byte gUnknown_0201C5CF
_080C1DC4: .4byte gUnknown_0201BE32

	THUMB_FUNC_END sub_80C1DA0

	THUMB_FUNC_START sub_80C1DC8
sub_80C1DC8: @ 0x080C1DC8
	ldr r0, _080C1DD4  @ gUnknown_0201C5CF
	ldrb r1, [r0]
	movs r2, #1
	eors r1, r2
	strb r1, [r0]
	bx lr
	.align 2, 0
_080C1DD4: .4byte gUnknown_0201C5CF

	THUMB_FUNC_END sub_80C1DC8

	THUMB_FUNC_START sub_80C1DD8
sub_80C1DD8: @ 0x080C1DD8
	ldr r2, _080C1DE4  @ gUnknown_0201C5B4
	lsls r0, r0, #2
	adds r0, r0, r2
	str r1, [r0]
	bx lr
	.align 2, 0
_080C1DE4: .4byte gUnknown_0201C5B4

	THUMB_FUNC_END sub_80C1DD8

	THUMB_FUNC_START sub_80C1DE8
sub_80C1DE8: @ 0x080C1DE8
	ldr r1, _080C1DF8  @ gUnknown_0201C5CC
	adds r0, r0, r1
	ldrb r2, [r0]
	movs r1, #3
	ands r1, r2
	strb r1, [r0]
	bx lr
	.align 2, 0
_080C1DF8: .4byte gUnknown_0201C5CC

	THUMB_FUNC_END sub_80C1DE8

	THUMB_FUNC_START sub_80C1DFC
sub_80C1DFC: @ 0x080C1DFC
	ldr r1, _080C1E10  @ gUnknown_0201C5CC
	adds r0, r0, r1
	ldrb r2, [r0]
	movs r1, #3
	ands r1, r2
	movs r2, #1
	orrs r1, r2
	strb r1, [r0]
	bx lr
	.align 2, 0
_080C1E10: .4byte gUnknown_0201C5CC

	THUMB_FUNC_END sub_80C1DFC

	THUMB_FUNC_START sub_80C1E14
sub_80C1E14: @ 0x080C1E14
	ldr r1, _080C1E28  @ gUnknown_0201C5CC
	adds r0, r0, r1
	ldrb r2, [r0]
	movs r1, #3
	ands r1, r2
	movs r2, #2
	orrs r1, r2
	strb r1, [r0]
	bx lr
	.align 2, 0
_080C1E28: .4byte gUnknown_0201C5CC

	THUMB_FUNC_END sub_80C1E14

	THUMB_FUNC_START sub_80C1E2C
sub_80C1E2C: @ 0x080C1E2C
	push {lr}
	ldr r0, [r0, #0x14]
	ldrh r1, [r0, #0x2e]
	ldrh r2, [r0, #0x30]
	movs r0, #1
	bl BG_SetPosition
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80C1E2C

	THUMB_FUNC_START sub_80C1E40
sub_80C1E40: @ 0x080C1E40
	push {lr}
	movs r1, #0x2e
	ldrsh r2, [r0, r1]
	movs r3, #0x30
	ldrsh r1, [r0, r3]
	adds r0, r2, #0
	bl sub_80C2488
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80C1E40

	THUMB_FUNC_START sub_80C1E54
sub_80C1E54: @ 0x080C1E54
	push {lr}
	adds r1, r0, #0
	ldrh r0, [r1, #0x32]
	subs r0, #1
	strh r0, [r1, #0x32]
	lsls r0, r0, #0x10
	cmp r0, #0
	bgt _080C1E6A
	adds r0, r1, #0
	bl Proc_Break
_080C1E6A:
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80C1E54

	THUMB_FUNC_START sub_80C1E70
sub_80C1E70: @ 0x080C1E70
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0x2a
	ldrsh r0, [r4, r1]
	movs r2, #0x2c
	ldrsh r1, [r4, r2]
	bl sub_80C2488
	movs r0, #0
	strh r0, [r4, #0x34]
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80C1E70

	THUMB_FUNC_START sub_80C1E8C
sub_80C1E8C: @ 0x080C1E8C
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	ldrh r0, [r7, #0x34]
	adds r0, #1
	strh r0, [r7, #0x34]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x36
	ldrsh r1, [r7, r2]
	cmp r0, r1
	bge _080C1EFE
	movs r1, #0x34
	ldrsh r0, [r7, r1]
	movs r2, #0x36
	ldrsh r1, [r7, r2]
	movs r3, #0x80
	lsls r3, r3, #4
	adds r2, r3, #0
	bl sub_8014CA4
	adds r5, r0, #0
	movs r6, #0x80
	lsls r6, r6, #5
	movs r1, #0x2e
	ldrsh r0, [r7, r1]
	movs r2, #0x2a
	ldrsh r1, [r7, r2]
	subs r0, r0, r1
	adds r1, r0, #0
	muls r1, r5, r1
	adds r0, r6, #0
	bl DivArm
	ldrh r4, [r7, #0x2a]
	adds r4, r4, r0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	movs r1, #0x30
	ldrsh r0, [r7, r1]
	movs r2, #0x2c
	ldrsh r1, [r7, r2]
	subs r0, r0, r1
	adds r1, r0, #0
	muls r1, r5, r1
	adds r0, r6, #0
	bl DivArm
	ldrh r1, [r7, #0x2c]
	adds r1, r1, r0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	adds r0, r4, #0
	bl sub_80C2488
	b _080C1F10
_080C1EFE:
	movs r1, #0x2e
	ldrsh r0, [r7, r1]
	movs r2, #0x30
	ldrsh r1, [r7, r2]
	bl sub_80C2488
	adds r0, r7, #0
	bl Proc_Break
_080C1F10:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80C1E8C

	THUMB_FUNC_START sub_80C1F18
sub_80C1F18: @ 0x080C1F18
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	adds r7, r3, #0
	ldr r1, [sp, #0x1c]
	cmp r1, #0
	beq _080C1F34
	ldr r0, _080C1F30  @ gUnknown_08A3EB10
	bl Proc_StartBlocking
	b _080C1F3C
	.align 2, 0
_080C1F30: .4byte gUnknown_08A3EB10
_080C1F34:
	ldr r0, _080C1F58  @ gUnknown_08A3EB10
	movs r1, #3
	bl Proc_Start
_080C1F3C:
	adds r1, r0, #0
	strh r4, [r1, #0x2a]
	strh r5, [r1, #0x2c]
	strh r6, [r1, #0x2e]
	strh r7, [r1, #0x30]
	ldr r0, [sp, #0x14]
	strh r0, [r1, #0x36]
	ldr r0, [sp, #0x18]
	strh r0, [r1, #0x32]
	adds r0, r1, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080C1F58: .4byte gUnknown_08A3EB10

	THUMB_FUNC_END sub_80C1F18

	THUMB_FUNC_START sub_80C1F5C
sub_80C1F5C: @ 0x080C1F5C
	push {lr}
	ldr r0, _080C1F68  @ gUnknown_08A3EB10
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
_080C1F68: .4byte gUnknown_08A3EB10

	THUMB_FUNC_END sub_80C1F5C

	THUMB_FUNC_START sub_80C1F6C
sub_80C1F6C: @ 0x080C1F6C
	push {r4, lr}
	ldr r4, _080C1FD0  @ gProcScr_WorldMapMain
	adds r0, r4, #0
	bl Proc_Find
	ldr r0, [r0, #0x44]
	ldr r1, [r0, #0x4c]
	adds r1, #0x31
	ldrb r2, [r1]
	movs r0, #4
	orrs r0, r2
	strb r0, [r1]
	adds r0, r4, #0
	bl Proc_Find
	ldr r0, [r0, #0x44]
	ldr r1, [r0, #0x4c]
	adds r1, #0x31
	ldrb r2, [r1]
	movs r0, #3
	orrs r0, r2
	strb r0, [r1]
	adds r0, r4, #0
	bl Proc_Find
	ldr r0, [r0, #0x48]
	bl sub_80BB6FC
	bl sub_80B8E14
	bl LoadObjUIGfx
	ldr r0, _080C1FD4  @ gBG1TilemapBuffer
	movs r1, #0
	bl BG_Fill
	movs r0, #2
	bl BG_EnableSyncByMask
	bl LoadLegacyUiFrameGraphics
	ldr r2, _080C1FD8  @ gGMData
	ldrb r1, [r2]
	movs r0, #9
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C1FD0: .4byte gProcScr_WorldMapMain
_080C1FD4: .4byte gBG1TilemapBuffer
_080C1FD8: .4byte gGMData

	THUMB_FUNC_END sub_80C1F6C

	THUMB_FUNC_START sub_80C1FDC
sub_80C1FDC: @ 0x080C1FDC
	bx lr

	THUMB_FUNC_END sub_80C1FDC

	THUMB_FUNC_START sub_80C1FE0
sub_80C1FE0: @ 0x080C1FE0
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _080C2040  @ gProcScr_WorldMapMain
	bl Proc_Find
	ldr r0, [r0, #0x44]
	ldr r1, [r0, #0x4c]
	adds r1, #0x31
	ldrb r2, [r1]
	movs r0, #0xfb
	ands r0, r2
	strb r0, [r1]
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	ldr r0, _080C2044  @ gUnknown_08A99140
	movs r1, #0xc0
	lsls r1, r1, #0x13
	bl Decompress
	ldr r0, _080C2048  @ gUnknown_08A9E4C4
	movs r1, #0xa0
	movs r2, #0x80
	bl CopyToPaletteBuffer
	ldr r0, _080C204C  @ gUnknown_08A9DF74
	ldr r4, _080C2050  @ gGenericBuffer
	adds r1, r4, #0
	bl Decompress
	ldr r0, _080C2054  @ gBG1TilemapBuffer
	movs r2, #0xa0
	lsls r2, r2, #7
	adds r1, r4, #0
	bl CallARM_FillTileRect
	movs r0, #2
	bl BG_EnableSyncByMask
	ldr r0, _080C2058  @ gUnknown_08A3EAF0
	adds r1, r5, #0
	bl Proc_Start
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C2040: .4byte gProcScr_WorldMapMain
_080C2044: .4byte gUnknown_08A99140
_080C2048: .4byte gUnknown_08A9E4C4
_080C204C: .4byte gUnknown_08A9DF74
_080C2050: .4byte gGenericBuffer
_080C2054: .4byte gBG1TilemapBuffer
_080C2058: .4byte gUnknown_08A3EAF0

	THUMB_FUNC_END sub_80C1FE0

	THUMB_FUNC_START sub_80C205C
sub_80C205C: @ 0x080C205C
	push {lr}
	adds r2, r0, #0
	adds r0, #0x29
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _080C2074
	adds r0, r2, #0
	movs r1, #0
	bl Proc_Goto
_080C2074:
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80C205C

	THUMB_FUNC_START sub_80C2078
sub_80C2078: @ 0x080C2078
	push {lr}
	adds r2, r0, #0
	adds r0, #0x29
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _080C2090
	adds r0, r2, #0
	movs r1, #1
	bl Proc_Goto
_080C2090:
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80C2078

	THUMB_FUNC_START sub_80C2094
sub_80C2094: @ 0x080C2094
	push {lr}
	adds r2, r0, #0
	adds r0, #0x29
	ldrb r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _080C20AA
	adds r0, r2, #0
	bl Proc_Break
_080C20AA:
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80C2094

	THUMB_FUNC_START sub_80C20B0
sub_80C20B0: @ 0x080C20B0
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	movs r4, #0
	str r4, [sp]
	movs r0, #0
	movs r1, #1
	movs r2, #0
	movs r3, #0
	bl SetBlendTargetA
	movs r0, #1
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #1
	movs r3, #1
	bl SetBlendTargetB
	movs r0, #1
	movs r1, #0x10
	movs r2, #0
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	ldr r2, _080C2108  @ gLCDControlBuffer
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
	strh r4, [r5, #0x2a]
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C2108: .4byte gLCDControlBuffer

	THUMB_FUNC_END sub_80C20B0

	THUMB_FUNC_START sub_80C210C
sub_80C210C: @ 0x080C210C
	push {lr}
	adds r1, r0, #0
	ldrh r0, [r1, #0x2a]
	adds r0, #1
	strh r0, [r1, #0x2a]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x4a
	bhi _080C2142
	ldrh r0, [r1, #0x2a]
	lsls r0, r0, #4
	movs r1, #0x4b
	bl __divsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r1, r0, #0x18
	lsrs r1, r1, #0x18
	movs r2, #0x10
	subs r2, r2, r0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	movs r0, #1
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	b _080C2148
_080C2142:
	adds r0, r1, #0
	bl Proc_Break
_080C2148:
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80C210C

	THUMB_FUNC_START sub_80C214C
sub_80C214C: @ 0x080C214C
	push {r4, r5, r6, lr}
	mov r6, sl
	mov r5, r9
	mov r4, r8
	push {r4, r5, r6}
	sub sp, #4
	mov sl, r0
	ldr r0, _080C2238  @ gUnknown_08A97ED8
	ldr r1, _080C223C  @ 0x06005000
	bl Decompress
	ldr r4, _080C2240  @ gProcScr_WorldMapMain
	adds r0, r4, #0
	bl Proc_Find
	ldr r0, [r0, #0x44]
	ldr r1, [r0, #0x4c]
	adds r1, #0x31
	ldrb r0, [r1]
	movs r2, #4
	mov r8, r2
	movs r2, #0
	mov r9, r2
	mov r2, r8
	orrs r0, r2
	strb r0, [r1]
	adds r0, r4, #0
	bl Proc_Find
	ldr r0, [r0, #0x44]
	ldr r0, [r0, #0x4c]
	adds r0, #0x31
	ldrb r1, [r0]
	movs r5, #3
	orrs r1, r5
	strb r1, [r0]
	adds r0, r4, #0
	bl Proc_Find
	ldr r0, [r0, #0x48]
	bl sub_80BB6FC
	movs r0, #1
	movs r1, #0x10
	movs r2, #0
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	mov r0, sl
	bl sub_80C22FC
	ldr r4, _080C2244  @ gLCDControlBuffer
	ldrb r2, [r4, #0xc]
	movs r1, #4
	negs r1, r1
	adds r0, r1, #0
	ands r0, r2
	strb r0, [r4, #0xc]
	ldrb r0, [r4, #0x10]
	ands r1, r0
	movs r6, #1
	orrs r1, r6
	strb r1, [r4, #0x10]
	ldrb r0, [r4, #0x14]
	orrs r0, r5
	strb r0, [r4, #0x14]
	ldrb r0, [r4, #0x18]
	orrs r0, r5
	strb r0, [r4, #0x18]
	mov r0, r9
	str r0, [sp]
	movs r0, #0
	movs r1, #1
	movs r2, #0
	movs r3, #0
	bl SetBlendTargetA
	movs r0, #1
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #1
	movs r3, #1
	bl SetBlendTargetB
	ldrb r0, [r4, #1]
	orrs r0, r6
	movs r1, #2
	orrs r0, r1
	mov r1, r8
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r4, #1]
	ldr r2, _080C2248  @ gGMData
	ldrb r1, [r2]
	movs r0, #9
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	bl sub_80B8E14
	bl LoadObjUIGfx
	mov r0, r9
	mov r2, sl
	strh r0, [r2, #0x2a]
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080C2238: .4byte gUnknown_08A97ED8
_080C223C: .4byte 0x06005000
_080C2240: .4byte gProcScr_WorldMapMain
_080C2244: .4byte gLCDControlBuffer
_080C2248: .4byte gGMData

	THUMB_FUNC_END sub_80C214C

	THUMB_FUNC_START sub_80C224C
sub_80C224C: @ 0x080C224C
	push {lr}
	adds r1, r0, #0
	ldrh r0, [r1, #0x2a]
	adds r0, #1
	strh r0, [r1, #0x2a]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x4a
	bhi _080C2284
	ldrh r0, [r1, #0x2a]
	lsls r0, r0, #4
	movs r1, #0x4b
	bl __divsi3
	adds r2, r0, #0
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r1, #0x10
	subs r1, r1, r2
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	movs r0, #1
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	b _080C228A
_080C2284:
	adds r0, r1, #0
	bl Proc_Break
_080C228A:
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80C224C

	THUMB_FUNC_START sub_80C2290
sub_80C2290: @ 0x080C2290
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	movs r5, #2
	ldr r7, _080C22D4  @ gGMData
	adds r4, r7, #0
	adds r4, #8
_080C229C:
	movs r1, #0x12
	ldrsh r0, [r4, r1]
	cmp r0, #0
	beq _080C22B4
	ldrb r0, [r7, #0x11]
	ldrb r1, [r4, #0x11]
	cmp r0, r1
	bne _080C22B4
	ldr r0, [r6, #0x54]
	adds r1, r5, #0
	bl GmMu_RemoveUnit
_080C22B4:
	adds r4, #4
	adds r5, #1
	cmp r5, #6
	ble _080C229C
	ldr r0, _080C22D4  @ gGMData
	ldrb r1, [r0, #0x10]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080C22D8
	adds r2, r6, #0
	adds r2, #0x29
	ldrb r1, [r2]
	movs r0, #8
	orrs r0, r1
	b _080C22E2
	.align 2, 0
_080C22D4: .4byte gGMData
_080C22D8:
	adds r2, r6, #0
	adds r2, #0x29
	ldrb r1, [r2]
	movs r0, #0xf7
	ands r0, r1
_080C22E2:
	strb r0, [r2]
	ldr r0, _080C22F8  @ gProcScr_WorldMapMain
	bl Proc_Find
	ldr r0, [r0, #0x54]
	movs r1, #0
	bl GmMu_HideUnit
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C22F8: .4byte gProcScr_WorldMapMain

	THUMB_FUNC_END sub_80C2290

	THUMB_FUNC_START sub_80C22FC
sub_80C22FC: @ 0x080C22FC
	push {lr}
	adds r0, #0x29
	ldrb r1, [r0]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _080C2318
	ldr r0, _080C231C  @ gProcScr_WorldMapMain
	bl Proc_Find
	ldr r0, [r0, #0x54]
	movs r1, #0
	bl GmMu_ShowUnit
_080C2318:
	pop {r0}
	bx r0
	.align 2, 0
_080C231C: .4byte gProcScr_WorldMapMain

	THUMB_FUNC_END sub_80C22FC

	THUMB_FUNC_START sub_80C2320
sub_80C2320: @ 0x080C2320
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080C238C  @ gProcScr_WorldMapMain
	bl Proc_Find
	ldr r0, [r0, #0x48]
	bl sub_80BB708
	movs r0, #0
	movs r1, #0x10
	movs r2, #0x10
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	adds r0, r4, #0
	bl sub_80C2290
	ldr r2, _080C2390  @ gLCDControlBuffer
	ldrb r3, [r2, #0xc]
	movs r1, #4
	negs r1, r1
	adds r0, r1, #0
	ands r0, r3
	strb r0, [r2, #0xc]
	ldrb r0, [r2, #0x10]
	movs r3, #3
	orrs r0, r3
	strb r0, [r2, #0x10]
	ldrb r0, [r2, #0x14]
	ands r1, r0
	movs r0, #1
	orrs r1, r0
	strb r1, [r2, #0x14]
	ldrb r0, [r2, #0x18]
	orrs r0, r3
	strb r0, [r2, #0x18]
	movs r0, #2
	bl BG_GetMapBuffer
	movs r1, #0
	bl BG_Fill
	movs r0, #4
	bl BG_EnableSyncByMask
	ldr r2, _080C2394  @ gGMData
	ldrb r0, [r2]
	movs r1, #8
	orrs r0, r1
	strb r0, [r2]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C238C: .4byte gProcScr_WorldMapMain
_080C2390: .4byte gLCDControlBuffer
_080C2394: .4byte gGMData

	THUMB_FUNC_END sub_80C2320

	THUMB_FUNC_START sub_80C2398
sub_80C2398: @ 0x080C2398
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080C2410  @ gProcScr_WorldMapMain
	bl Proc_Find
	ldr r0, [r0, #0x48]
	bl sub_80BB6FC
	movs r0, #0
	movs r1, #0x10
	movs r2, #0x10
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	adds r0, r4, #0
	bl sub_80C22FC
	ldr r2, _080C2414  @ gLCDControlBuffer
	ldrb r3, [r2, #0xc]
	movs r1, #4
	negs r1, r1
	adds r0, r1, #0
	ands r0, r3
	strb r0, [r2, #0xc]
	ldrb r0, [r2, #0x10]
	ands r1, r0
	movs r3, #1
	orrs r1, r3
	strb r1, [r2, #0x10]
	ldrb r0, [r2, #0x14]
	movs r1, #3
	orrs r0, r1
	strb r0, [r2, #0x14]
	ldrb r0, [r2, #0x18]
	orrs r0, r1
	strb r0, [r2, #0x18]
	ldrb r0, [r2, #1]
	orrs r0, r3
	movs r1, #2
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2, #1]
	ldr r2, _080C2418  @ gGMData
	ldrb r1, [r2]
	movs r0, #9
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	ldr r0, _080C241C  @ gUnknown_08A3EAF0
	bl Proc_EndEach
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C2410: .4byte gProcScr_WorldMapMain
_080C2414: .4byte gLCDControlBuffer
_080C2418: .4byte gGMData
_080C241C: .4byte gUnknown_08A3EAF0

	THUMB_FUNC_END sub_80C2398

	THUMB_FUNC_START Make6C_Gmap_RM
Make6C_Gmap_RM: @ 0x080C2420
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	adds r4, r2, #0
	adds r1, r3, #0
	cmp r1, #0
	beq _080C243C
	ldr r0, _080C2438  @ gUnknown_08A3EB50
	bl Proc_StartBlocking
	b _080C2444
	.align 2, 0
_080C2438: .4byte gUnknown_08A3EB50
_080C243C:
	ldr r0, _080C245C  @ gUnknown_08A3EB50
	movs r1, #3
	bl Proc_Start
_080C2444:
	adds r1, r0, #0
	adds r2, r1, #0
	adds r2, #0x29
	movs r0, #0xfb
	ands r0, r4
	strb r0, [r2]
	strh r5, [r1, #0x2e]
	strh r6, [r1, #0x30]
	adds r0, r1, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_080C245C: .4byte gUnknown_08A3EB50

	THUMB_FUNC_END Make6C_Gmap_RM

	THUMB_FUNC_START sub_80C2460
sub_80C2460: @ 0x080C2460
	push {lr}
	ldr r0, _080C246C  @ gUnknown_08A3EB50
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
_080C246C: .4byte gUnknown_08A3EB50

	THUMB_FUNC_END sub_80C2460

	THUMB_FUNC_START sub_80C2470
sub_80C2470: @ 0x080C2470
	push {lr}
	ldr r0, _080C2484  @ gUnknown_08A3EB50
	bl Proc_Find
	cmp r0, #0
	beq _080C247E
	movs r0, #1
_080C247E:
	pop {r1}
	bx r1
	.align 2, 0
_080C2484: .4byte gUnknown_08A3EB50

	THUMB_FUNC_END sub_80C2470

	THUMB_FUNC_START sub_80C2488
sub_80C2488: @ 0x080C2488
	push {r4, r5, lr}
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r4, r1, #0x10
	ldr r0, _080C24A8  @ gUnknown_08A3EB50
	bl Proc_Find
	cmp r0, #0
	beq _080C24A0
	strh r5, [r0, #0x2e]
	strh r4, [r0, #0x30]
_080C24A0:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C24A8: .4byte gUnknown_08A3EB50

	THUMB_FUNC_END sub_80C2488

	THUMB_FUNC_START GetWMDisplayPosition
GetWMDisplayPosition: @ 0x080C24AC
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _080C24C4  @ gUnknown_08A3EB50
	bl Proc_Find
	adds r1, r0, #0
	cmp r1, #0
	bne _080C24C8
	movs r0, #0
	b _080C24D2
	.align 2, 0
_080C24C4: .4byte gUnknown_08A3EB50
_080C24C8:
	ldrh r0, [r1, #0x2e]
	strh r0, [r4]
	ldrh r0, [r1, #0x30]
	strh r0, [r5]
	movs r0, #1
_080C24D2:
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END GetWMDisplayPosition

	THUMB_FUNC_START sub_80C24D8
sub_80C24D8: @ 0x080C24D8
	push {lr}
	ldr r0, _080C24F4  @ gUnknown_08A3EB50
	bl Proc_Find
	cmp r0, #0
	beq _080C24F0
	adds r2, r0, #0
	adds r2, #0x29
	ldrb r1, [r2]
	movs r0, #4
	orrs r0, r1
	strb r0, [r2]
_080C24F0:
	pop {r0}
	bx r0
	.align 2, 0
_080C24F4: .4byte gUnknown_08A3EB50

	THUMB_FUNC_END sub_80C24D8

	THUMB_FUNC_START sub_80C24F8
sub_80C24F8: @ 0x080C24F8
	push {r4, r5, lr}
	ldr r0, _080C2584  @ gUnknown_08A3EB50
	bl Proc_Find
	adds r5, r0, #0
	cmp r5, #0
	beq _080C257E
	ldr r0, _080C2588  @ gProcScr_WorldMapMain
	bl Proc_Find
	ldr r0, [r0, #0x48]
	bl sub_80BB6FC
	movs r0, #0
	movs r1, #0x10
	movs r2, #0x10
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	adds r0, r5, #0
	bl sub_80C22FC
	ldr r2, _080C258C  @ gLCDControlBuffer
	ldrb r3, [r2, #0xc]
	movs r1, #4
	negs r1, r1
	adds r0, r1, #0
	ands r0, r3
	strb r0, [r2, #0xc]
	ldrb r0, [r2, #0x10]
	ands r1, r0
	movs r0, #1
	orrs r1, r0
	strb r1, [r2, #0x10]
	ldrb r0, [r2, #0x14]
	movs r1, #3
	orrs r0, r1
	strb r0, [r2, #0x14]
	ldrb r0, [r2, #0x18]
	orrs r0, r1
	strb r0, [r2, #0x18]
	ldr r3, _080C2590  @ gGMData
	ldrb r1, [r3]
	movs r4, #9
	negs r4, r4
	adds r0, r4, #0
	ands r0, r1
	strb r0, [r3]
	ldrb r1, [r2, #1]
	movs r0, #2
	negs r0, r0
	ands r0, r1
	movs r1, #3
	negs r1, r1
	ands r0, r1
	subs r1, #2
	ands r0, r1
	ands r0, r4
	subs r1, #0xc
	ands r0, r1
	strb r0, [r2, #1]
	ldr r0, _080C2594  @ gUnknown_08A3EAF0
	bl Proc_EndEach
	adds r0, r5, #0
	bl Proc_End
_080C257E:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C2584: .4byte gUnknown_08A3EB50
_080C2588: .4byte gProcScr_WorldMapMain
_080C258C: .4byte gLCDControlBuffer
_080C2590: .4byte gGMData
_080C2594: .4byte gUnknown_08A3EAF0

	THUMB_FUNC_END sub_80C24F8

	THUMB_FUNC_START sub_80C2598
sub_80C2598: @ 0x080C2598
	push {lr}
	bl GetWMFaceBlendAmt
	lsls r1, r0, #0x18
	lsrs r1, r1, #0x18
	movs r2, #0x10
	subs r2, r2, r0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	movs r0, #0
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80C2598

	THUMB_FUNC_START sub_80C25B8
sub_80C25B8: @ 0x080C25B8
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	movs r5, #0
	str r5, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl SetBlendTargetA
	str r5, [sp]
	movs r0, #0
	movs r1, #1
	movs r2, #0
	movs r3, #0
	bl SetBlendTargetB
	movs r0, #0
	movs r1, #0
	movs r2, #0x10
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	strh r5, [r4, #0x2a]
	adds r4, #0x29
	movs r0, #1
	strb r0, [r4]
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80C25B8

	THUMB_FUNC_START sub_80C25F8
sub_80C25F8: @ 0x080C25F8
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2a]
	adds r0, #1
	strh r0, [r4, #0x2a]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x2c
	bgt _080C263C
	movs r1, #0x2a
	ldrsh r0, [r4, r1]
	movs r1, #0x2d
	movs r2, #0
	bl sub_800B84C
	adds r1, r0, #0
	movs r0, #0x80
	lsls r0, r0, #5
	lsls r1, r1, #4
	bl DivArm
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	movs r0, #0
	movs r2, #0x10
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	adds r1, r4, #0
	adds r1, #0x29
	movs r0, #0
	strb r0, [r1]
	b _080C2652
_080C263C:
	movs r0, #0
	movs r1, #0x10
	movs r2, #0x10
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	movs r0, #0
	strh r0, [r4, #0x2a]
	adds r0, r4, #0
	bl Proc_Break
_080C2652:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80C25F8

	THUMB_FUNC_START sub_80C2658
sub_80C2658: @ 0x080C2658
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2a]
	adds r0, #1
	strh r0, [r4, #0x2a]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x2c
	bgt _080C2696
	movs r1, #0x2a
	ldrsh r0, [r4, r1]
	movs r1, #0x2d
	movs r2, #0
	bl sub_800B84C
	adds r1, r0, #0
	movs r0, #0x80
	lsls r0, r0, #5
	lsls r1, r1, #4
	bl DivArm
	movs r1, #0x10
	subs r1, r1, r0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	movs r0, #0
	movs r2, #0x10
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	b _080C26B4
_080C2696:
	movs r0, #0
	movs r1, #0
	movs r2, #0x10
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	movs r0, #0
	strh r0, [r4, #0x2a]
	adds r1, r4, #0
	adds r1, #0x29
	movs r0, #1
	strb r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
_080C26B4:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80C2658

	THUMB_FUNC_START sub_80C26BC
sub_80C26BC: @ 0x080C26BC
	push {lr}
	adds r1, r0, #0
	cmp r1, #0
	beq _080C26D0
	ldr r0, _080C26CC  @ gUnknown_08A3EBE8
	bl Proc_StartBlocking
	b _080C26D8
	.align 2, 0
_080C26CC: .4byte gUnknown_08A3EBE8
_080C26D0:
	ldr r0, _080C26DC  @ gUnknown_08A3EBE8
	movs r1, #3
	bl Proc_Start
_080C26D8:
	pop {r1}
	bx r1
	.align 2, 0
_080C26DC: .4byte gUnknown_08A3EBE8

	THUMB_FUNC_END sub_80C26BC

	THUMB_FUNC_START sub_80C26E0
sub_80C26E0: @ 0x080C26E0
	push {lr}
	ldr r0, _080C26EC  @ gUnknown_08A3EBE8
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
_080C26EC: .4byte gUnknown_08A3EBE8

	THUMB_FUNC_END sub_80C26E0

	THUMB_FUNC_START sub_80C26F0
sub_80C26F0: @ 0x080C26F0
	push {lr}
	ldr r0, _080C2704  @ gUnknown_08A3EBE8
	bl Proc_Find
	cmp r0, #0
	beq _080C26FE
	movs r0, #1
_080C26FE:
	pop {r1}
	bx r1
	.align 2, 0
_080C2704: .4byte gUnknown_08A3EBE8

	THUMB_FUNC_END sub_80C26F0

	THUMB_FUNC_START sub_80C2708
sub_80C2708: @ 0x080C2708
	push {lr}
	ldr r0, _080C2718  @ gUnknown_08A3EBE8
	bl Proc_Find
	cmp r0, #0
	bne _080C271C
	movs r0, #0
	b _080C2724
	.align 2, 0
_080C2718: .4byte gUnknown_08A3EBE8
_080C271C:
	adds r0, #0x29
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
_080C2724:
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80C2708

	THUMB_FUNC_START sub_80C2728
sub_80C2728: @ 0x080C2728
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x34]
	bl AP_Delete
	ldr r0, [r4, #0x2c]
	bl AP_Delete
	ldr r0, _080C274C  @ gUnknown_08A3EC48
	bl sub_80034FC
	cmp r0, #1
	bne _080C2746
	bl sub_80C26E0
_080C2746:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C274C: .4byte gUnknown_08A3EC48

	THUMB_FUNC_END sub_80C2728

	THUMB_FUNC_START sub_80C2750
sub_80C2750: @ 0x080C2750
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	movs r4, #0
	str r4, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl SetBlendTargetA
	str r4, [sp]
	movs r0, #0
	movs r1, #1
	movs r2, #0
	movs r3, #0
	bl SetBlendTargetB
	movs r0, #0
	movs r1, #0
	movs r2, #0x10
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	strh r4, [r5, #0x30]
	ldr r0, _080C27A0  @ gUnknown_08A3EC48
	bl sub_80034FC
	cmp r0, #1
	bgt _080C2798
	ldr r0, _080C27A4  @ gUnknown_08A9E688
	movs r1, #0xc8
	lsls r1, r1, #2
	movs r2, #0x20
	bl CopyToPaletteBuffer
_080C2798:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C27A0: .4byte gUnknown_08A3EC48
_080C27A4: .4byte gUnknown_08A9E688

	THUMB_FUNC_END sub_80C2750

	THUMB_FUNC_START sub_80C27A8
sub_80C27A8: @ 0x080C27A8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	mov r8, r0
	adds r7, r1, #0
	adds r6, r2, #0
	lsls r4, r3, #0x18
	lsrs r4, r4, #0x18
	mov r5, sp
	adds r5, #2
	mov r0, sp
	adds r1, r5, #0
	bl GetWMDisplayPosition
	mov r0, sp
	movs r1, #0
	ldrsh r0, [r0, r1]
	subs r7, r7, r0
	movs r1, #0
	ldrsh r0, [r5, r1]
	subs r6, r6, r0
	cmp r4, #0
	beq _080C27EA
	mov r1, r8
	ldr r0, [r1, #0x34]
	movs r2, #0x80
	lsls r2, r2, #3
	orrs r2, r6
	adds r1, r7, #0
	bl AP_Update
	b _080C27F6
_080C27EA:
	mov r1, r8
	ldr r0, [r1, #0x34]
	adds r1, r7, #0
	adds r2, r6, #0
	bl AP_Update
_080C27F6:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80C27A8

	THUMB_FUNC_START sub_80C2804
sub_80C2804: @ 0x080C2804
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldrh r0, [r6, #0x30]
	adds r0, #1
	strh r0, [r6, #0x30]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x15
	bgt _080C2880
	movs r1, #0x30
	ldrsh r0, [r6, r1]
	movs r1, #0x16
	movs r2, #2
	bl sub_800B7E0
	adds r4, r0, #0
	movs r5, #0x80
	lsls r5, r5, #5
	lsls r1, r4, #4
	adds r0, r5, #0
	bl DivArm
	lsls r1, r0, #0x18
	lsrs r1, r1, #0x18
	movs r2, #0x10
	subs r2, r2, r0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	movs r0, #0
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	subs r4, r5, r4
	lsls r1, r4, #3
	adds r1, r1, r4
	lsls r1, r1, #1
	adds r0, r5, #0
	bl DivArm
	ldr r3, _080C287C  @ gUnknown_08206AF0
	adds r1, r6, #0
	adds r1, #0x2a
	ldrb r2, [r1]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #2
	adds r1, r1, r3
	movs r3, #8
	ldrsh r2, [r1, r3]
	adds r2, r2, r0
	movs r0, #0xa
	ldrsh r3, [r1, r0]
	adds r0, r6, #0
	adds r1, r2, #0
	adds r2, r3, #0
	movs r3, #1
	bl sub_80C27A8
	b _080C28BA
	.align 2, 0
_080C287C: .4byte gUnknown_08206AF0
_080C2880:
	movs r0, #0
	movs r1, #0x10
	movs r2, #0x10
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	movs r0, #0
	strh r0, [r6, #0x30]
	ldr r2, _080C28C0  @ gUnknown_08206AF0
	adds r0, r6, #0
	adds r0, #0x2a
	ldrb r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	movs r1, #8
	ldrsh r2, [r0, r1]
	movs r1, #0xa
	ldrsh r3, [r0, r1]
	adds r0, r6, #0
	adds r1, r2, #0
	adds r2, r3, #0
	movs r3, #0
	bl sub_80C27A8
	adds r0, r6, #0
	bl Proc_Break
_080C28BA:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080C28C0: .4byte gUnknown_08206AF0

	THUMB_FUNC_END sub_80C2804

	THUMB_FUNC_START sub_80C28C4
sub_80C28C4: @ 0x080C28C4
	push {lr}
	ldr r0, _080C28D8  @ gUnknown_08A3EC48
	bl sub_80034FC
	cmp r0, #1
	bne _080C28D4
	bl sub_80C26E0
_080C28D4:
	pop {r0}
	bx r0
	.align 2, 0
_080C28D8: .4byte gUnknown_08A3EC48

	THUMB_FUNC_END sub_80C28C4

	THUMB_FUNC_START sub_80C28DC
sub_80C28DC: @ 0x080C28DC
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldrh r0, [r6, #0x30]
	adds r0, #1
	strh r0, [r6, #0x30]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x15
	bgt _080C2954
	movs r1, #0x30
	ldrsh r0, [r6, r1]
	movs r1, #0x16
	movs r2, #2
	bl sub_800B7E0
	adds r4, r0, #0
	movs r5, #0x80
	lsls r5, r5, #5
	lsls r1, r4, #4
	adds r0, r5, #0
	bl DivArm
	adds r2, r0, #0
	movs r1, #0x10
	subs r1, r1, r2
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	movs r0, #0
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	lsls r1, r4, #3
	adds r1, r1, r4
	lsls r1, r1, #1
	adds r0, r5, #0
	bl DivArm
	ldr r3, _080C2950  @ gUnknown_08206AF0
	adds r1, r6, #0
	adds r1, #0x2a
	ldrb r1, [r1]
	lsls r2, r1, #1
	adds r2, r2, r1
	lsls r2, r2, #2
	adds r2, r2, r3
	movs r3, #8
	ldrsh r1, [r2, r3]
	subs r1, r1, r0
	movs r0, #0xa
	ldrsh r2, [r2, r0]
	adds r0, r6, #0
	movs r3, #1
	bl sub_80C27A8
	b _080C295E
	.align 2, 0
_080C2950: .4byte gUnknown_08206AF0
_080C2954:
	bl SetDefaultColorEffects
	adds r0, r6, #0
	bl Proc_Break
_080C295E:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80C28DC

	THUMB_FUNC_START sub_80C2964
sub_80C2964: @ 0x080C2964
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080C2988  @ gUnknown_08A3EC48
	bl sub_80034FC
	cmp r0, #1
	bgt _080C2980
	movs r0, #0
	bl sub_80C26BC
	adds r0, r4, #0
	movs r1, #1
	bl Proc_Goto
_080C2980:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C2988: .4byte gUnknown_08A3EC48

	THUMB_FUNC_END sub_80C2964

	THUMB_FUNC_START sub_80C298C
sub_80C298C: @ 0x080C298C
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r4, r0, #0
	mov r5, sp
	adds r5, #2
	mov r0, sp
	adds r1, r5, #0
	bl GetWMDisplayPosition
	ldr r6, _080C29F4  @ gUnknown_08206AF0
	adds r7, r4, #0
	adds r7, #0x2a
	ldrb r1, [r7]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r6
	mov r2, sp
	ldrh r1, [r0, #8]
	ldrh r2, [r2]
	subs r1, r1, r2
	ldrh r2, [r0, #0xa]
	ldrh r0, [r5]
	subs r2, r2, r0
	ldr r0, [r4, #0x2c]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r5, #0x80
	lsls r5, r5, #3
	adds r3, r5, #0
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	orrs r2, r3
	bl AP_Update
	ldrb r1, [r7]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r6
	movs r2, #8
	ldrsh r1, [r0, r2]
	movs r3, #0xa
	ldrsh r2, [r0, r3]
	adds r0, r4, #0
	movs r3, #0
	bl sub_80C27A8
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C29F4: .4byte gUnknown_08206AF0

	THUMB_FUNC_END sub_80C298C

	THUMB_FUNC_START sub_80C29F8
sub_80C29F8: @ 0x080C29F8
	push {r4, lr}
	adds r4, r0, #0
	bl sub_80C298C
	bl sub_80C2708
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080C2A14
	movs r0, #0
	strh r0, [r4, #0x30]
	adds r0, r4, #0
	bl Proc_Break
_080C2A14:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80C29F8

	THUMB_FUNC_START sub_80C2A1C
sub_80C2A1C: @ 0x080C2A1C
	push {r4, lr}
	adds r4, r0, #0
	bl sub_80C298C
	adds r0, r4, #0
	adds r0, #0x29
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _080C2A38
	adds r0, r4, #0
	bl Proc_Break
_080C2A38:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80C2A1C

	THUMB_FUNC_START sub_80C2A40
sub_80C2A40: @ 0x080C2A40
	push {r4, r5, lr}
	sub sp, #0x18
	movs r4, #0
	ldr r1, _080C2A68  @ gUnknown_08A3EC48
	mov r0, sp
	bl Proc_FindBegin
	add r5, sp, #0xc
_080C2A50:
	mov r0, sp
	bl Proc_FindNext
	cmp r0, #0
	beq _080C2A6C
	adds r0, #0x2b
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	stm r5!, {r0}
	adds r4, #1
	b _080C2A50
	.align 2, 0
_080C2A68: .4byte gUnknown_08A3EC48
_080C2A6C:
	cmp r4, #0
	bne _080C2A78
	movs r0, #0
	b _080C2AA4
_080C2A74:
	adds r0, r3, #0
	b _080C2AA4
_080C2A78:
	movs r3, #0
	ldr r5, [sp, #0xc]
_080C2A7C:
	movs r2, #0
	cmp r2, r4
	bge _080C2A96
	cmp r3, r5
	beq _080C2A96
	add r1, sp, #0xc
_080C2A88:
	adds r1, #4
	adds r2, #1
	cmp r2, r4
	bge _080C2A96
	ldr r0, [r1]
	cmp r3, r0
	bne _080C2A88
_080C2A96:
	cmp r2, r4
	beq _080C2A74
	adds r3, #1
	cmp r3, #2
	ble _080C2A7C
	movs r0, #1
	negs r0, r0
_080C2AA4:
	add sp, #0x18
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80C2A40

	THUMB_FUNC_START sub_80C2AAC
sub_80C2AAC: @ 0x080C2AAC
	push {lr}
	adds r2, r0, #0
	lsls r2, r2, #0xc
	ldr r0, _080C2ACC  @ 0x06010000
	adds r2, r2, r0
	ldr r3, _080C2AD0  @ gUnknown_08206AF0
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	ldr r0, [r0]
	adds r1, r2, #0
	bl Decompress
	pop {r0}
	bx r0
	.align 2, 0
_080C2ACC: .4byte 0x06010000
_080C2AD0: .4byte gUnknown_08206AF0

	THUMB_FUNC_END sub_80C2AAC

	THUMB_FUNC_START sub_80C2AD4
sub_80C2AD4: @ 0x080C2AD4
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	adds r6, r0, #0
	adds r4, r1, #0
	bl sub_80C2A40
	mov r8, r0
	cmp r4, #0
	beq _080C2AF8
	ldr r0, _080C2AF4  @ gUnknown_08A3EC48
	adds r1, r4, #0
	bl Proc_StartBlocking
	b _080C2B00
	.align 2, 0
_080C2AF4: .4byte gUnknown_08A3EC48
_080C2AF8:
	ldr r0, _080C2B70  @ gUnknown_08A3EC48
	movs r1, #3
	bl Proc_Start
_080C2B00:
	adds r7, r0, #0
	mov r0, r8
	adds r1, r6, #0
	bl sub_80C2AAC
	ldr r1, _080C2B74  @ gUnknown_08206AF0
	lsls r0, r6, #1
	adds r0, r0, r6
	lsls r0, r0, #2
	adds r1, #4
	adds r0, r0, r1
	ldr r5, [r0]
	adds r0, r5, #0
	movs r1, #0xd
	bl AP_Create
	str r0, [r7, #0x2c]
	mov r1, r8
	lsls r4, r1, #0xc
	asrs r4, r4, #5
	ldr r2, _080C2B78  @ 0xFFFF9C00
	adds r1, r2, #0
	movs r2, #0
	mov r9, r2
	orrs r4, r1
	strh r4, [r0, #0x22]
	ldr r0, [r7, #0x2c]
	movs r1, #0
	bl AP_SwitchAnimation
	adds r0, r5, #0
	movs r1, #0xd
	bl AP_Create
	str r0, [r7, #0x34]
	strh r4, [r0, #0x22]
	ldr r0, [r7, #0x34]
	movs r1, #1
	bl AP_SwitchAnimation
	adds r0, r7, #0
	adds r0, #0x2a
	strb r6, [r0]
	adds r0, #1
	mov r1, r8
	strb r1, [r0]
	subs r0, #2
	mov r2, r9
	strb r2, [r0]
	adds r0, r7, #0
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080C2B70: .4byte gUnknown_08A3EC48
_080C2B74: .4byte gUnknown_08206AF0
_080C2B78: .4byte 0xFFFF9C00

	THUMB_FUNC_END sub_80C2AD4

	THUMB_FUNC_START sub_80C2B7C
sub_80C2B7C: @ 0x080C2B7C
	push {r4, lr}
	sub sp, #0xc
	adds r4, r0, #0
	cmp r4, #0
	bge _080C2B9C
	ldr r0, _080C2B90  @ gUnknown_08A3EC48
	bl Proc_EndEach
	b _080C2BB8
	.align 2, 0
_080C2B90: .4byte gUnknown_08A3EC48
_080C2B94:
	adds r0, r1, #0
	bl Proc_End
	b _080C2BB8
_080C2B9C:
	ldr r1, _080C2BC0  @ gUnknown_08A3EC48
	mov r0, sp
	bl Proc_FindBegin
_080C2BA4:
	mov r0, sp
	bl Proc_FindNext
	adds r1, r0, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	cmp r0, r4
	beq _080C2B94
	cmp r1, #0
	bne _080C2BA4
_080C2BB8:
	add sp, #0xc
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C2BC0: .4byte gUnknown_08A3EC48

	THUMB_FUNC_END sub_80C2B7C

	THUMB_FUNC_START sub_80C2BC4
sub_80C2BC4: @ 0x080C2BC4
	push {r4, lr}
	sub sp, #0xc
	adds r4, r0, #0
	cmp r4, #0
	bge _080C2BE0
	ldr r0, _080C2BDC  @ gUnknown_08A3EC48
	bl Proc_Find
	cmp r0, #0
	beq _080C2C06
	movs r0, #1
	b _080C2C06
	.align 2, 0
_080C2BDC: .4byte gUnknown_08A3EC48
_080C2BE0:
	ldr r1, _080C2C00  @ gUnknown_08A3EC48
	mov r0, sp
	bl Proc_FindBegin
_080C2BE8:
	mov r0, sp
	bl Proc_FindNext
	adds r1, r0, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	cmp r0, r4
	beq _080C2C04
	cmp r1, #0
	bne _080C2BE8
	movs r0, #0
	b _080C2C06
	.align 2, 0
_080C2C00: .4byte gUnknown_08A3EC48
_080C2C04:
	movs r0, #1
_080C2C06:
	add sp, #0xc
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80C2BC4

	THUMB_FUNC_START sub_80C2C10
sub_80C2C10: @ 0x080C2C10
	push {r4, r5, lr}
	sub sp, #0xc
	adds r4, r0, #0
	ldr r1, _080C2C3C  @ gUnknown_08A3EC48
	mov r0, sp
	bl Proc_FindBegin
	movs r5, #1
_080C2C20:
	mov r0, sp
	bl Proc_FindNext
	adds r1, r0, #0
	cmp r4, #0
	blt _080C2C40
	adds r0, #0x2a
	ldrb r0, [r0]
	cmp r0, r4
	bne _080C2C46
	adds r0, r1, #0
	adds r0, #0x29
	strb r5, [r0]
	b _080C2C4A
	.align 2, 0
_080C2C3C: .4byte gUnknown_08A3EC48
_080C2C40:
	adds r0, r1, #0
	adds r0, #0x29
	strb r5, [r0]
_080C2C46:
	cmp r1, #0
	bne _080C2C20
_080C2C4A:
	add sp, #0xc
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80C2C10

	THUMB_FUNC_START sub_80C2C54
sub_80C2C54: @ 0x080C2C54
	bx lr

	THUMB_FUNC_END sub_80C2C54

	THUMB_FUNC_START sub_80C2C58
sub_80C2C58: @ 0x080C2C58
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080C2C7C  @ gUnknown_08AA11B0
	movs r1, #0xa8
	lsls r1, r1, #2
	movs r2, #0x20
	bl CopyToPaletteBuffer
	bl EnablePaletteSync
	movs r0, #0
	strh r0, [r4, #0x2a]
	adds r4, #0x29
	movs r0, #1
	strb r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C2C7C: .4byte gUnknown_08AA11B0

	THUMB_FUNC_END sub_80C2C58

	THUMB_FUNC_START sub_80C2C80
sub_80C2C80: @ 0x080C2C80
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	str r2, [sp]
	str r3, [sp, #4]
	ldr r4, [sp, #0x2c]
	movs r2, #0
	bl sub_800B7E0
	mov r8, r0
	movs r0, #0
	mov r9, r0
	adds r7, r4, #0
	movs r1, #0x80
	lsls r1, r1, #5
	mov sl, r1
_080C2CA6:
	mov r2, r9
	lsls r1, r2, #1
	ldr r2, [sp]
	adds r0, r1, r2
	ldrh r4, [r0]
	adds r2, r4, #0
	movs r0, #0x1f
	ands r2, r0
	adds r6, r4, #0
	movs r0, #0xf8
	lsls r0, r0, #2
	ands r6, r0
	lsrs r6, r6, #5
	movs r0, #0xf8
	lsls r0, r0, #7
	ands r4, r0
	lsrs r4, r4, #0xa
	ldr r0, [sp, #4]
	adds r1, r1, r0
	ldrh r5, [r1]
	adds r0, r5, #0
	movs r1, #0x1f
	ands r0, r1
	subs r0, r0, r2
	mov r1, r8
	muls r1, r0, r1
	mov r0, sl
	str r2, [sp, #8]
	bl DivArm
	ldr r2, [sp, #8]
	adds r2, r2, r0
	adds r0, r5, #0
	movs r1, #0xf8
	lsls r1, r1, #2
	ands r0, r1
	lsrs r0, r0, #5
	subs r0, r0, r6
	mov r1, r8
	muls r1, r0, r1
	mov r0, sl
	str r2, [sp, #8]
	bl DivArm
	adds r6, r6, r0
	movs r0, #0xf8
	lsls r0, r0, #7
	ands r5, r0
	lsrs r5, r5, #0xa
	subs r5, r5, r4
	mov r1, r8
	muls r1, r5, r1
	mov r0, sl
	bl DivArm
	adds r4, r4, r0
	lsls r4, r4, #0xa
	lsls r6, r6, #5
	adds r4, r4, r6
	ldr r2, [sp, #8]
	adds r4, r4, r2
	strh r4, [r7]
	adds r7, #2
	movs r1, #1
	add r9, r1
	mov r2, r9
	cmp r2, #0xf
	ble _080C2CA6
	bl EnablePaletteSync
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80C2C80

	THUMB_FUNC_START sub_80C2D44
sub_80C2D44: @ 0x080C2D44
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldrh r0, [r4, #0x2a]
	adds r0, #1
	strh r0, [r4, #0x2a]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x1d
	bgt _080C2D80
	movs r1, #0x2a
	ldrsh r0, [r4, r1]
	ldr r2, _080C2D78  @ gUnknown_08AA11B0
	adds r3, r2, #0
	subs r3, #0x20
	ldr r1, _080C2D7C  @ gPaletteBuffer + 0x2A0
	str r1, [sp]
	movs r1, #0x1e
	bl sub_80C2C80
	adds r1, r4, #0
	adds r1, #0x29
	movs r0, #0
	strb r0, [r1]
	b _080C2D94
	.align 2, 0
_080C2D78: .4byte gUnknown_08AA11B0
_080C2D7C: .4byte gPaletteBuffer + 0x2A0
_080C2D80:
	ldr r0, _080C2D9C  @ gUnknown_08AA1190
	ldr r1, _080C2DA0  @ gPaletteBuffer + 0x2A0
	movs r2, #0x10
	bl CpuSet
	movs r0, #0
	strh r0, [r4, #0x2a]
	adds r0, r4, #0
	bl Proc_Break
_080C2D94:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C2D9C: .4byte gUnknown_08AA1190
_080C2DA0: .4byte gPaletteBuffer + 0x2A0

	THUMB_FUNC_END sub_80C2D44

	THUMB_FUNC_START sub_80C2DA4
sub_80C2DA4: @ 0x080C2DA4
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldrh r0, [r4, #0x2a]
	adds r0, #1
	strh r0, [r4, #0x2a]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x1d
	bgt _080C2DD8
	movs r1, #0x2a
	ldrsh r0, [r4, r1]
	ldr r2, _080C2DD0  @ gUnknown_08AA1190
	adds r3, r2, #0
	adds r3, #0x20
	ldr r1, _080C2DD4  @ gPaletteBuffer + 0x2A0
	str r1, [sp]
	movs r1, #0x1e
	bl sub_80C2C80
	b _080C2DF4
	.align 2, 0
_080C2DD0: .4byte gUnknown_08AA1190
_080C2DD4: .4byte gPaletteBuffer + 0x2A0
_080C2DD8:
	ldr r0, _080C2DFC  @ gUnknown_08AA11B0
	ldr r1, _080C2E00  @ gPaletteBuffer + 0x2A0
	movs r2, #0x10
	bl CpuSet
	movs r0, #0
	strh r0, [r4, #0x2a]
	adds r1, r4, #0
	adds r1, #0x29
	movs r0, #1
	strb r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
_080C2DF4:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C2DFC: .4byte gUnknown_08AA11B0
_080C2E00: .4byte gPaletteBuffer + 0x2A0

	THUMB_FUNC_END sub_80C2DA4

	THUMB_FUNC_START sub_80C2E04
sub_80C2E04: @ 0x080C2E04
	push {lr}
	adds r1, r0, #0
	cmp r1, #0
	beq _080C2E18
	ldr r0, _080C2E14  @ gUnknown_08A3ECB0
	bl Proc_StartBlocking
	b _080C2E20
	.align 2, 0
_080C2E14: .4byte gUnknown_08A3ECB0
_080C2E18:
	ldr r0, _080C2E24  @ gUnknown_08A3ECB0
	movs r1, #3
	bl Proc_Start
_080C2E20:
	pop {r1}
	bx r1
	.align 2, 0
_080C2E24: .4byte gUnknown_08A3ECB0

	THUMB_FUNC_END sub_80C2E04

	THUMB_FUNC_START sub_80C2E28
sub_80C2E28: @ 0x080C2E28
	push {lr}
	ldr r0, _080C2E34  @ gUnknown_08A3ECB0
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
_080C2E34: .4byte gUnknown_08A3ECB0

	THUMB_FUNC_END sub_80C2E28

	THUMB_FUNC_START sub_80C2E38
sub_80C2E38: @ 0x080C2E38
	push {lr}
	ldr r0, _080C2E4C  @ gUnknown_08A3ECB0
	bl Proc_Find
	cmp r0, #0
	beq _080C2E46
	movs r0, #1
_080C2E46:
	pop {r1}
	bx r1
	.align 2, 0
_080C2E4C: .4byte gUnknown_08A3ECB0

	THUMB_FUNC_END sub_80C2E38

	THUMB_FUNC_START sub_80C2E50
sub_80C2E50: @ 0x080C2E50
	push {lr}
	ldr r0, _080C2E60  @ gUnknown_08A3ECB0
	bl Proc_Find
	cmp r0, #0
	bne _080C2E64
	movs r0, #0
	b _080C2E6C
	.align 2, 0
_080C2E60: .4byte gUnknown_08A3ECB0
_080C2E64:
	adds r0, #0x29
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
_080C2E6C:
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80C2E50

	THUMB_FUNC_START sub_80C2E70
sub_80C2E70: @ 0x080C2E70
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080C2EA0  @ gUnknown_08A3ED18
	bl sub_80034FC
	cmp r0, #1
	bne _080C2E82
	bl sub_80C2E28
_080C2E82:
	adds r0, r4, #0
	adds r0, #0x2a
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080C2E9A
	ldr r0, [r4, #0x34]
	cmp r0, #0
	beq _080C2E9A
	bl sub_80C13CC
_080C2E9A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C2EA0: .4byte gUnknown_08A3ED18

	THUMB_FUNC_END sub_80C2E70

	THUMB_FUNC_START sub_80C2EA4
sub_80C2EA4: @ 0x080C2EA4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080C2EE0  @ gUnknown_08A3ED18
	bl sub_80034FC
	cmp r0, #1
	bgt _080C2ED8
	movs r0, #0
	bl sub_80C2E04
	ldr r0, _080C2EE4  @ gUnknown_08AA114C
	ldr r1, _080C2EE8  @ 0x060133C0
	bl Decompress
	ldr r0, _080C2EEC  @ gUnknown_08AA11B0
	movs r1, #0xa0
	lsls r1, r1, #2
	movs r2, #0x20
	bl CopyToPaletteBuffer
	bl EnablePaletteSync
	adds r0, r4, #0
	movs r1, #1
	bl Proc_Goto
_080C2ED8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C2EE0: .4byte gUnknown_08A3ED18
_080C2EE4: .4byte gUnknown_08AA114C
_080C2EE8: .4byte 0x060133C0
_080C2EEC: .4byte gUnknown_08AA11B0

	THUMB_FUNC_END sub_80C2EA4

	THUMB_FUNC_START sub_80C2EF0
sub_80C2EF0: @ 0x080C2EF0
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r5, r0, #0
	mov r4, sp
	adds r4, #6
	add r0, sp, #4
	adds r1, r4, #0
	bl GetWMDisplayPosition
	add r0, sp, #4
	ldrh r0, [r0]
	adds r0, #4
	ldrh r2, [r5, #0x2e]
	subs r2, r2, r0
	ldrh r1, [r4]
	adds r1, #4
	ldrh r0, [r5, #0x30]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	lsls r2, r2, #0x10
	asrs r6, r2, #0x10
	movs r0, #0x80
	lsls r0, r0, #0xe
	adds r2, r2, r0
	movs r0, #0x88
	lsls r0, r0, #0x11
	cmp r2, r0
	bhi _080C2F70
	lsls r0, r1, #0x10
	asrs r4, r0, #0x10
	movs r1, #0x80
	lsls r1, r1, #0xe
	adds r0, r0, r1
	lsrs r0, r0, #0x10
	cmp r0, #0xc0
	bhi _080C2F70
	adds r0, r5, #0
	adds r0, #0x2a
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	movs r1, #4
	cmp r0, #0
	beq _080C2F4C
	movs r1, #5
_080C2F4C:
	ldr r3, _080C2F78  @ gUnknown_08A3ED10
	adds r2, r5, #0
	adds r2, #0x2c
	lsls r0, r1, #0xc
	movs r1, #0xcf
	lsls r1, r1, #1
	orrs r0, r1
	ldrb r2, [r2]
	adds r0, r0, r2
	movs r1, #0xc0
	lsls r1, r1, #4
	adds r0, r0, r1
	str r0, [sp]
	movs r0, #0xb
	adds r1, r6, #0
	adds r2, r4, #0
	bl PutSprite
_080C2F70:
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080C2F78: .4byte gUnknown_08A3ED10

	THUMB_FUNC_END sub_80C2EF0

	THUMB_FUNC_START sub_80C2F7C
sub_80C2F7C: @ 0x080C2F7C
	push {r4, lr}
	adds r4, r0, #0
	bl sub_80C2EF0
	bl sub_80C2E50
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080C2F94
	adds r0, r4, #0
	bl Proc_Break
_080C2F94:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80C2F7C

	THUMB_FUNC_START sub_80C2F9C
sub_80C2F9C: @ 0x080C2F9C
	push {r4, lr}
	adds r4, r0, #0
	bl sub_80C2EF0
	adds r0, r4, #0
	adds r0, #0x29
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _080C2FB8
	adds r0, r4, #0
	bl Proc_Break
_080C2FB8:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80C2F9C

	THUMB_FUNC_START sub_80C2FC0
sub_80C2FC0: @ 0x080C2FC0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	adds r6, r1, #0
	adds r7, r2, #0
	mov r8, r3
	ldr r1, [sp, #0x1c]
	cmp r1, #0
	beq _080C2FE0
	ldr r0, _080C2FDC  @ gUnknown_08A3ED18
	bl Proc_StartBlocking
	b _080C2FE8
	.align 2, 0
_080C2FDC: .4byte gUnknown_08A3ED18
_080C2FE0:
	ldr r0, _080C3030  @ gUnknown_08A3ED18
	movs r1, #3
	bl Proc_Start
_080C2FE8:
	adds r4, r0, #0
	adds r0, r4, #0
	adds r0, #0x2b
	strb r5, [r0]
	adds r0, #1
	strb r6, [r0]
	strh r7, [r4, #0x2e]
	mov r0, r8
	strh r0, [r4, #0x30]
	adds r0, r4, #0
	adds r0, #0x2a
	mov r1, sp
	ldrb r1, [r1, #0x18]
	strb r1, [r0]
	movs r0, #2
	ldr r2, [sp, #0x18]
	ands r0, r2
	cmp r0, #0
	beq _080C3034
	movs r0, #0
	movs r1, #1
	bl sub_80C1370
	str r0, [r4, #0x34]
	adds r0, #0x29
	ldrb r1, [r0]
	movs r2, #1
	orrs r1, r2
	strb r1, [r0]
	ldr r0, [r4, #0x34]
	strh r7, [r0, #0x2c]
	ldr r0, [r4, #0x34]
	mov r1, r8
	strh r1, [r0, #0x2e]
	b _080C3036
	.align 2, 0
_080C3030: .4byte gUnknown_08A3ED18
_080C3034:
	str r0, [r4, #0x34]
_080C3036:
	adds r1, r4, #0
	adds r1, #0x29
	movs r0, #0
	strb r0, [r1]
	adds r0, r4, #0
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80C2FC0

	THUMB_FUNC_START sub_80C304C
sub_80C304C: @ 0x080C304C
	push {r4, lr}
	sub sp, #0xc
	adds r4, r0, #0
	cmp r4, #0
	bge _080C306C
	ldr r0, _080C3060  @ gUnknown_08A3ED18
	bl Proc_EndEach
	b _080C3088
	.align 2, 0
_080C3060: .4byte gUnknown_08A3ED18
_080C3064:
	adds r0, r1, #0
	bl Proc_End
	b _080C3088
_080C306C:
	ldr r1, _080C3090  @ gUnknown_08A3ED18
	mov r0, sp
	bl Proc_FindBegin
_080C3074:
	mov r0, sp
	bl Proc_FindNext
	adds r1, r0, #0
	adds r0, #0x2b
	ldrb r0, [r0]
	cmp r0, r4
	beq _080C3064
	cmp r1, #0
	bne _080C3074
_080C3088:
	add sp, #0xc
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C3090: .4byte gUnknown_08A3ED18

	THUMB_FUNC_END sub_80C304C

	THUMB_FUNC_START sub_80C3094
sub_80C3094: @ 0x080C3094
	push {r4, lr}
	sub sp, #0xc
	adds r4, r0, #0
	cmp r4, #0
	bge _080C30B0
	ldr r0, _080C30AC  @ gUnknown_08A3ED18
	bl Proc_Find
	cmp r0, #0
	beq _080C30D6
	movs r0, #1
	b _080C30D6
	.align 2, 0
_080C30AC: .4byte gUnknown_08A3ED18
_080C30B0:
	ldr r1, _080C30D0  @ gUnknown_08A3ED18
	mov r0, sp
	bl Proc_FindBegin
_080C30B8:
	mov r0, sp
	bl Proc_FindNext
	adds r1, r0, #0
	adds r0, #0x2b
	ldrb r0, [r0]
	cmp r0, r4
	beq _080C30D4
	cmp r1, #0
	bne _080C30B8
	movs r0, #0
	b _080C30D6
	.align 2, 0
_080C30D0: .4byte gUnknown_08A3ED18
_080C30D4:
	movs r0, #1
_080C30D6:
	add sp, #0xc
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80C3094

	THUMB_FUNC_START sub_80C30E0
sub_80C30E0: @ 0x080C30E0
	push {r4, r5, lr}
	sub sp, #0xc
	adds r4, r0, #0
	ldr r1, _080C310C  @ gUnknown_08A3ED18
	mov r0, sp
	bl Proc_FindBegin
	movs r5, #1
_080C30F0:
	mov r0, sp
	bl Proc_FindNext
	adds r1, r0, #0
	cmp r4, #0
	blt _080C3110
	adds r0, #0x2b
	ldrb r0, [r0]
	cmp r0, r4
	bne _080C3116
	adds r0, r1, #0
	adds r0, #0x29
	strb r5, [r0]
	b _080C311A
	.align 2, 0
_080C310C: .4byte gUnknown_08A3ED18
_080C3110:
	adds r0, r1, #0
	adds r0, #0x29
	strb r5, [r0]
_080C3116:
	cmp r1, #0
	bne _080C30F0
_080C311A:
	add sp, #0xc
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80C30E0

	THUMB_FUNC_START sub_80C3124
sub_80C3124: @ 0x080C3124
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r5, _080C3170  @ gProcScr_WorldMapMain
	adds r0, r5, #0
	bl Proc_Find
	ldr r0, [r0, #0x54]
	ldrh r1, [r4, #0x2c]
	bl sub_80BE12C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080C314C
	adds r0, r5, #0
	bl Proc_Find
	ldr r0, [r0, #0x54]
	ldrh r1, [r4, #0x2c]
	bl sub_80BE330
_080C314C:
	bl EndGmapUnitFade
	adds r0, r4, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #0
	beq _080C315E
	cmp r0, #1
	beq _080C3178
_080C315E:
	ldr r1, _080C3174  @ gGMData
	ldrh r0, [r4, #0x2c]
	lsls r0, r0, #2
	adds r0, r0, r1
	adds r1, r4, #0
	adds r1, #0x34
	ldrb r1, [r1]
	strb r1, [r0, #0x11]
	b _080C318E
	.align 2, 0
_080C3170: .4byte gProcScr_WorldMapMain
_080C3174: .4byte gGMData
_080C3178:
	adds r0, r5, #0
	bl Proc_Find
	ldr r0, [r0, #0x54]
	ldrh r1, [r4, #0x2c]
	movs r3, #0x34
	ldrsh r2, [r4, r3]
	movs r5, #0x36
	ldrsh r3, [r4, r5]
	bl GmMu_SetPosition
_080C318E:
	adds r0, r4, #0
	adds r0, #0x2a
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080C31A2
	ldrh r0, [r4, #0x2c]
	bl sub_80BF570
_080C31A2:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80C3124

	THUMB_FUNC_START sub_80C31A8
sub_80C31A8: @ 0x080C31A8
	push {lr}
	adds r1, r0, #0
	ldrh r0, [r1, #0x3c]
	subs r0, #1
	strh r0, [r1, #0x3c]
	lsls r0, r0, #0x10
	cmp r0, #0
	bgt _080C31BE
	adds r0, r1, #0
	bl Proc_Break
_080C31BE:
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80C31A8

	THUMB_FUNC_START sub_80C31C4
sub_80C31C4: @ 0x080C31C4
	push {lr}
	adds r2, r0, #0
	adds r0, #0x2a
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080C31DC
	adds r0, r2, #0
	movs r1, #0
	bl Proc_Goto
_080C31DC:
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80C31C4

	THUMB_FUNC_START sub_80C31E0
sub_80C31E0: @ 0x080C31E0
	push {lr}
	adds r2, r0, #0
	adds r0, #0x2a
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080C31F8
	adds r0, r2, #0
	movs r1, #4
	bl Proc_Goto
_080C31F8:
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80C31E0

	THUMB_FUNC_START sub_80C31FC
sub_80C31FC: @ 0x080C31FC
	push {lr}
	adds r1, r0, #0
	adds r1, #0x29
	ldrb r1, [r1]
	cmp r1, #0
	beq _080C320C
	cmp r1, #1
	beq _080C3214
_080C320C:
	movs r1, #1
	bl Proc_Goto
	b _080C321A
_080C3214:
	movs r1, #2
	bl Proc_Goto
_080C321A:
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80C31FC

	THUMB_FUNC_START sub_80C3220
sub_80C3220: @ 0x080C3220
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080C3240  @ gProcScr_WorldMapMain
	bl Proc_Find
	ldr r0, [r0, #0x54]
	ldrh r1, [r4, #0x2c]
	movs r2, #0x1e
	bl GmMu_StartFadeIn
	ldrh r0, [r4, #0x2c]
	bl sub_80BF554
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C3240: .4byte gProcScr_WorldMapMain

	THUMB_FUNC_END sub_80C3220

	THUMB_FUNC_START sub_80C3244
sub_80C3244: @ 0x080C3244
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080C3260  @ gProcScr_WorldMapMain
	bl Proc_Find
	ldr r0, [r0, #0x54]
	ldrh r1, [r4, #0x2c]
	movs r2, #0x1e
	bl GmMu_StartFadeOut
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C3260: .4byte gProcScr_WorldMapMain

	THUMB_FUNC_END sub_80C3244

	THUMB_FUNC_START sub_80C3264
sub_80C3264: @ 0x080C3264
	push {r4, lr}
	adds r4, r0, #0
	bl GmUnitFadeExists
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080C3278
	adds r0, r4, #0
	bl Proc_Break
_080C3278:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80C3264

	THUMB_FUNC_START sub_80C3280
sub_80C3280: @ 0x080C3280
	push {lr}
	sub sp, #0x10
	adds r3, r0, #0
	mov r1, sp
	ldrh r0, [r3, #0x2c]
	movs r2, #0
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x38
	ldrb r0, [r0]
	strb r0, [r1, #1]
	adds r0, r3, #0
	adds r0, #0x30
	ldrb r0, [r0]
	strh r0, [r1, #6]
	adds r0, r3, #0
	adds r0, #0x34
	ldrb r0, [r0]
	strh r0, [r1, #8]
	movs r1, #0x3a
	ldrsh r0, [r3, r1]
	str r0, [sp, #0xc]
	mov r0, sp
	strh r2, [r0, #0xa]
	mov r2, sp
	adds r0, r3, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	lsrs r0, r0, #2
	movs r1, #1
	ands r0, r1
	strb r0, [r2, #2]
	mov r1, sp
	movs r0, #0xff
	strb r0, [r1, #3]
	movs r0, #4
	strb r0, [r1, #4]
	ldr r0, _080C32E0  @ gProcScr_WorldMapMain
	bl Proc_Find
	ldr r0, [r0, #0x54]
	mov r1, sp
	bl sub_80BDEB4
	add sp, #0x10
	pop {r0}
	bx r0
	.align 2, 0
_080C32E0: .4byte gProcScr_WorldMapMain

	THUMB_FUNC_END sub_80C3280

	THUMB_FUNC_START sub_80C32E4
sub_80C32E4: @ 0x080C32E4
	push {lr}
	sub sp, #0x14
	adds r3, r0, #0
	mov r1, sp
	ldrh r0, [r3, #0x2c]
	movs r2, #0
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x39
	ldrb r0, [r0]
	strb r0, [r1, #1]
	adds r0, r3, #0
	adds r0, #0x38
	ldrb r0, [r0]
	strb r0, [r1, #2]
	ldrh r0, [r3, #0x30]
	strh r0, [r1, #6]
	ldrh r0, [r3, #0x32]
	strh r0, [r1, #8]
	ldrh r0, [r3, #0x34]
	strh r0, [r1, #0xa]
	ldrh r0, [r3, #0x36]
	strh r0, [r1, #0xc]
	movs r1, #0x3a
	ldrsh r0, [r3, r1]
	str r0, [sp, #0x10]
	mov r0, sp
	strh r2, [r0, #0xe]
	mov r2, sp
	adds r0, r3, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	lsrs r0, r0, #2
	movs r1, #1
	ands r0, r1
	strb r0, [r2, #3]
	mov r1, sp
	movs r0, #0xff
	strb r0, [r1, #4]
	movs r0, #4
	strb r0, [r1, #5]
	ldr r0, _080C334C  @ gProcScr_WorldMapMain
	bl Proc_Find
	ldr r0, [r0, #0x54]
	mov r1, sp
	bl sub_80BDFA4
	add sp, #0x14
	pop {r0}
	bx r0
	.align 2, 0
_080C334C: .4byte gProcScr_WorldMapMain

	THUMB_FUNC_END sub_80C32E4

	THUMB_FUNC_START sub_80C3350
sub_80C3350: @ 0x080C3350
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080C3374  @ gProcScr_WorldMapMain
	bl Proc_Find
	ldr r0, [r0, #0x54]
	ldrh r1, [r4, #0x2c]
	bl sub_80BE12C
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080C336E
	adds r0, r4, #0
	bl Proc_Break
_080C336E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C3374: .4byte gProcScr_WorldMapMain

	THUMB_FUNC_END sub_80C3350

	THUMB_FUNC_START sub_80C3378
sub_80C3378: @ 0x080C3378
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r1, r2, #0
	cmp r1, #0
	beq _080C3390
	ldr r0, _080C338C  @ gUnknown_08A3ED60
	bl Proc_StartBlocking
	b _080C3398
	.align 2, 0
_080C338C: .4byte gUnknown_08A3ED60
_080C3390:
	ldr r0, _080C33D0  @ gUnknown_08A3ED60
	movs r1, #3
	bl Proc_Start
_080C3398:
	adds r2, r0, #0
	adds r1, r2, #0
	adds r1, #0x29
	movs r0, #0
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x2a
	strb r5, [r0]
	ldrb r0, [r4]
	strh r0, [r2, #0x2c]
	ldrb r1, [r4, #1]
	adds r0, r2, #0
	adds r0, #0x38
	strb r1, [r0]
	ldrh r1, [r4, #6]
	subs r0, #8
	strb r1, [r0]
	ldrh r1, [r4, #8]
	adds r0, #4
	strb r1, [r0]
	ldrh r0, [r4, #0xa]
	strh r0, [r2, #0x3c]
	ldr r0, [r4, #0xc]
	strh r0, [r2, #0x3a]
	adds r0, r2, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080C33D0: .4byte gUnknown_08A3ED60

	THUMB_FUNC_END sub_80C3378

	THUMB_FUNC_START sub_80C33D4
sub_80C33D4: @ 0x080C33D4
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r1, r2, #0
	cmp r1, #0
	beq _080C33EC
	ldr r0, _080C33E8  @ gUnknown_08A3ED60
	bl Proc_StartBlocking
	b _080C33F4
	.align 2, 0
_080C33E8: .4byte gUnknown_08A3ED60
_080C33EC:
	ldr r0, _080C3438  @ gUnknown_08A3ED60
	movs r1, #3
	bl Proc_Start
_080C33F4:
	adds r2, r0, #0
	adds r1, r2, #0
	adds r1, #0x29
	movs r0, #1
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x2a
	strb r5, [r0]
	ldrb r0, [r4]
	strh r0, [r2, #0x2c]
	ldrb r0, [r4, #1]
	adds r1, #0x10
	strb r0, [r1]
	ldrb r1, [r4, #2]
	adds r0, r2, #0
	adds r0, #0x38
	strb r1, [r0]
	ldrh r0, [r4, #6]
	strh r0, [r2, #0x30]
	ldrh r0, [r4, #8]
	strh r0, [r2, #0x32]
	ldrh r0, [r4, #0xa]
	strh r0, [r2, #0x34]
	ldrh r0, [r4, #0xc]
	strh r0, [r2, #0x36]
	ldrh r0, [r4, #0xe]
	strh r0, [r2, #0x3c]
	ldr r0, [r4, #0x10]
	strh r0, [r2, #0x3a]
	adds r0, r2, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080C3438: .4byte gUnknown_08A3ED60

	THUMB_FUNC_END sub_80C33D4

	THUMB_FUNC_START sub_80C343C
sub_80C343C: @ 0x080C343C
	push {r4, lr}
	sub sp, #0xc
	adds r4, r0, #0
	cmp r4, #0
	bge _080C345C
	ldr r0, _080C3450  @ gUnknown_08A3ED60
	bl Proc_EndEach
	b _080C3476
	.align 2, 0
_080C3450: .4byte gUnknown_08A3ED60
_080C3454:
	adds r0, r1, #0
	bl Proc_End
	b _080C3476
_080C345C:
	ldr r1, _080C3480  @ gUnknown_08A3ED60
	mov r0, sp
	bl Proc_FindBegin
_080C3464:
	mov r0, sp
	bl Proc_FindNext
	adds r1, r0, #0
	ldrh r0, [r1, #0x2c]
	cmp r0, r4
	beq _080C3454
	cmp r1, #0
	bne _080C3464
_080C3476:
	add sp, #0xc
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C3480: .4byte gUnknown_08A3ED60

	THUMB_FUNC_END sub_80C343C

	THUMB_FUNC_START sub_80C3484
sub_80C3484: @ 0x080C3484
	push {r4, lr}
	sub sp, #0xc
	adds r4, r0, #0
	cmp r4, #0
	bge _080C34A0
	ldr r0, _080C349C  @ gUnknown_08A3ED60
	bl Proc_Find
	cmp r0, #0
	beq _080C34C6
	movs r0, #1
	b _080C34C6
	.align 2, 0
_080C349C: .4byte gUnknown_08A3ED60
_080C34A0:
	ldr r1, _080C34C0  @ gUnknown_08A3ED60
	mov r0, sp
	bl Proc_FindBegin
_080C34A8:
	mov r0, sp
	bl Proc_FindNext
	adds r1, r0, #0
	ldrh r0, [r1, #0x2c]
	cmp r0, r4
	beq _080C34C4
	cmp r1, #0
	bne _080C34A8
	movs r0, #0
	b _080C34C6
	.align 2, 0
_080C34C0: .4byte gUnknown_08A3ED60
_080C34C4:
	movs r0, #1
_080C34C6:
	add sp, #0xc
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80C3484

	THUMB_FUNC_START sub_80C34D0
sub_80C34D0: @ 0x080C34D0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	adds r4, r0, #0
	adds r7, r1, #0
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	str r2, [sp]
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	mov sl, r3
	movs r2, #0
	cmp r2, r7
	bge _080C357E
	movs r0, #0x1f
	mov r1, sl
	ands r1, r0
	str r1, [sp, #4]
	movs r3, #0
	str r3, [sp, #8]
	mov r8, r4
	ldr r1, [sp]
	mov r9, r1
	mov r3, r9
	ands r3, r0
	mov r9, r3
_080C350A:
	subs r6, r7, r2
	mov r0, r9
	muls r0, r6, r0
	ldr r1, [sp, #8]
	adds r0, r0, r1
	adds r1, r7, #0
	str r2, [sp, #0xc]
	bl __divsi3
	adds r4, r0, #0
	movs r3, #0x1f
	ands r4, r3
	ldr r0, [sp]
	movs r1, #0xf8
	lsls r1, r1, #2
	ands r0, r1
	muls r0, r6, r0
	mov r1, sl
	movs r3, #0xf8
	lsls r3, r3, #2
	ands r1, r3
	ldr r2, [sp, #0xc]
	muls r1, r2, r1
	adds r0, r0, r1
	adds r1, r7, #0
	bl __divsi3
	movs r1, #0xf8
	lsls r1, r1, #2
	ands r0, r1
	adds r4, r4, r0
	movs r5, #0xf8
	lsls r5, r5, #7
	ldr r0, [sp]
	ands r0, r5
	muls r0, r6, r0
	mov r1, sl
	ands r1, r5
	ldr r2, [sp, #0xc]
	muls r1, r2, r1
	adds r0, r0, r1
	adds r1, r7, #0
	bl __divsi3
	ands r0, r5
	adds r4, r4, r0
	mov r3, r8
	strh r4, [r3]
	ldr r0, [sp, #8]
	ldr r1, [sp, #4]
	adds r0, r0, r1
	str r0, [sp, #8]
	movs r3, #2
	add r8, r3
	ldr r2, [sp, #0xc]
	adds r2, #1
	cmp r2, r7
	blt _080C350A
_080C357E:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80C34D0

	THUMB_FUNC_START sub_80C3590
sub_80C3590: @ 0x080C3590
	push {r4, r5, r6, lr}
	sub sp, #4
	movs r6, #0
	ldr r5, _080C35BC  @ 0x06014000
	movs r4, #3
_080C359A:
	str r6, [sp]
	mov r0, sp
	adds r1, r5, #0
	ldr r2, _080C35C0  @ 0x010000E0
	bl CpuFastSet
	movs r0, #0x80
	lsls r0, r0, #3
	adds r5, r5, r0
	subs r4, #1
	cmp r4, #0
	bge _080C359A
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080C35BC: .4byte 0x06014000
_080C35C0: .4byte 0x010000E0

	THUMB_FUNC_END sub_80C3590

	THUMB_FUNC_START sub_80C35C4
sub_80C35C4: @ 0x080C35C4
	push {lr}
	adds r3, r0, #0
	adds r3, #0x29
	movs r2, #0
	movs r1, #1
	strb r1, [r3]
	adds r0, #0x2a
	strb r2, [r0]
	bl sub_80C3590
	ldr r2, _080C35E8  @ gUnknown_0201BE30
	ldrb r1, [r2]
	movs r0, #0xfe
	ands r0, r1
	strb r0, [r2]
	pop {r0}
	bx r0
	.align 2, 0
_080C35E8: .4byte gUnknown_0201BE30

	THUMB_FUNC_END sub_80C35C4

	THUMB_FUNC_START sub_80C35EC
sub_80C35EC: @ 0x080C35EC
	push {lr}
	sub sp, #4
	adds r1, r0, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	cmp r0, #0
	beq _080C3618
	movs r2, #0
	adds r0, r1, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #1
	bne _080C3608
	movs r2, #0x6f
_080C3608:
	ldr r3, _080C3620  @ gUnknown_08A3EE28
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [sp]
	movs r0, #1
	movs r1, #0
	bl PutSpriteExt
_080C3618:
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_080C3620: .4byte gUnknown_08A3EE28

	THUMB_FUNC_END sub_80C35EC

	THUMB_FUNC_START sub_80C3624
sub_80C3624: @ 0x080C3624
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _080C3658  @ gUnknown_08A3EE44
	bl Proc_Find
	adds r4, r0, #0
	cmp r4, #0
	beq _080C3652
	bl sub_80C3590
	ldr r2, _080C365C  @ gUnknown_0201BE30
	ldrb r1, [r2]
	movs r0, #0xfe
	ands r0, r1
	strb r0, [r2]
	adds r0, r4, #0
	adds r0, #0x29
	strb r5, [r0]
	adds r1, r4, #0
	adds r1, #0x2a
	movs r0, #1
	strb r0, [r1]
_080C3652:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C3658: .4byte gUnknown_08A3EE44
_080C365C: .4byte gUnknown_0201BE30

	THUMB_FUNC_END sub_80C3624

	THUMB_FUNC_START sub_80C3660
sub_80C3660: @ 0x080C3660
	push {lr}
	ldr r0, _080C3684  @ gUnknown_08A3EE44
	bl Proc_Find
	adds r3, r0, #0
	cmp r3, #0
	beq _080C3680
	ldr r2, _080C3688  @ gUnknown_0201BE30
	ldrb r1, [r2]
	movs r0, #0xfe
	ands r0, r1
	strb r0, [r2]
	adds r1, r3, #0
	adds r1, #0x2a
	movs r0, #0
	strb r0, [r1]
_080C3680:
	pop {r0}
	bx r0
	.align 2, 0
_080C3684: .4byte gUnknown_08A3EE44
_080C3688: .4byte gUnknown_0201BE30

	THUMB_FUNC_END sub_80C3660

	THUMB_FUNC_START sub_80C368C
sub_80C368C: @ 0x080C368C
	push {lr}
	adds r1, r0, #0
	ldr r0, _080C369C  @ gUnknown_08A3EE44
	bl Proc_Start
	pop {r1}
	bx r1
	.align 2, 0
_080C369C: .4byte gUnknown_08A3EE44

	THUMB_FUNC_END sub_80C368C

	THUMB_FUNC_START sub_80C36A0
sub_80C36A0: @ 0x080C36A0
	push {r4, lr}
	adds r4, r0, #0
	bl EndTalk
	movs r0, #0x80
	lsls r0, r0, #2
	movs r1, #2
	movs r2, #2
	bl InitSpriteTalk
	bl EnablePaletteSync
	movs r0, #1
	movs r1, #0xf
	adds r2, r4, #0
	bl StartTalkMsg
	movs r0, #4
	bl SetTalkPrintDelay
	movs r0, #0x20
	bl SetTalkFlag
	movs r0, #0x80
	bl SetTalkFlag
	movs r0, #4
	bl SetTalkFlag
	movs r0, #1
	bl SetTalkFlag
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80C36A0

	THUMB_FUNC_START sub_80C36E8
sub_80C36E8: @ 0x080C36E8
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, _080C375C  @ gGMData
	ldr r1, [r0, #8]
	asrs r1, r1, #8
	ldr r6, [r0, #0xc]
	asrs r6, r6, #8
	adds r0, r4, #0
	adds r0, #0x2f
	movs r5, #0
	ldrsb r5, [r0, r5]
	lsls r5, r5, #3
	lsls r0, r1, #6
	subs r0, r0, r1
	movs r1, #0xf0
	lsls r1, r1, #1
	bl __divsi3
	adds r5, r5, r0
	adds r4, #0x30
	ldrb r4, [r4]
	lsls r4, r4, #0x18
	asrs r4, r4, #0x18
	lsls r4, r4, #3
	movs r0, #0x2b
	muls r0, r6, r0
	movs r1, #0xa0
	lsls r1, r1, #1
	bl __divsi3
	adds r4, r4, r0
	subs r1, r5, #1
	adds r2, r4, #7
	adds r5, #0x1f
	ldr r0, _080C3760  @ 0x0000012F
	cmp r5, r0
	bhi _080C3754
	movs r0, #0x20
	negs r0, r0
	cmp r2, r0
	blt _080C3754
	cmp r2, #0xbf
	bgt _080C3754
	ldr r0, _080C3764  @ 0x000001FF
	ands r1, r0
	movs r0, #0xff
	ands r2, r0
	ldr r3, _080C3768  @ gObject_8x8
	ldr r0, _080C376C  @ 0x000040F6
	str r0, [sp]
	movs r0, #0
	bl PutSpriteExt
_080C3754:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080C375C: .4byte gGMData
_080C3760: .4byte 0x0000012F
_080C3764: .4byte 0x000001FF
_080C3768: .4byte gObject_8x8
_080C376C: .4byte 0x000040F6

	THUMB_FUNC_END sub_80C36E8

	THUMB_FUNC_START sub_80C3770
sub_80C3770: @ 0x080C3770
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, _080C37F4  @ gGMData
	bl sub_80BD014
	cmp r0, #0
	blt _080C37EA
	lsls r0, r0, #5
	ldr r1, _080C37F8  @ gWMNodeData
	adds r0, r0, r1
	movs r2, #0x18
	ldrsh r1, [r0, r2]
	movs r2, #0x1a
	ldrsh r6, [r0, r2]
	adds r0, r4, #0
	adds r0, #0x2f
	movs r5, #0
	ldrsb r5, [r0, r5]
	lsls r5, r5, #3
	lsls r0, r1, #6
	subs r0, r0, r1
	movs r1, #0xf0
	lsls r1, r1, #1
	bl __divsi3
	adds r5, r5, r0
	adds r0, r4, #0
	adds r0, #0x30
	movs r4, #0
	ldrsb r4, [r0, r4]
	lsls r4, r4, #3
	movs r0, #0x2b
	muls r0, r6, r0
	movs r1, #0xa0
	lsls r1, r1, #1
	bl __divsi3
	adds r4, r4, r0
	subs r1, r5, #1
	adds r2, r4, #7
	adds r5, #0x1f
	ldr r0, _080C37FC  @ 0x0000012F
	cmp r5, r0
	bhi _080C37EA
	movs r0, #0x20
	negs r0, r0
	cmp r2, r0
	blt _080C37EA
	cmp r2, #0xbf
	bgt _080C37EA
	ldr r0, _080C3800  @ 0x000001FF
	ands r1, r0
	movs r0, #0xff
	ands r2, r0
	ldr r3, _080C3804  @ gObject_8x8
	ldr r0, _080C3808  @ 0x000040F7
	str r0, [sp]
	movs r0, #0
	bl PutSpriteExt
_080C37EA:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080C37F4: .4byte gGMData
_080C37F8: .4byte gWMNodeData
_080C37FC: .4byte 0x0000012F
_080C3800: .4byte 0x000001FF
_080C3804: .4byte gObject_8x8
_080C3808: .4byte 0x000040F7

	THUMB_FUNC_END sub_80C3770

	THUMB_FUNC_START sub_80C380C
sub_80C380C: @ 0x080C380C
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r7, r0, #0
	ldr r0, _080C38A4  @ gGMData
	ldrb r1, [r0, #0x10]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080C389A
	ldr r0, _080C38A8  @ gProcScr_WorldMapMain
	bl Proc_Find
	ldr r0, [r0, #0x54]
	mov r4, sp
	adds r4, #6
	movs r1, #0
	add r2, sp, #4
	adds r3, r4, #0
	bl GmMu_GetPosition
	add r0, sp, #4
	movs r2, #0
	ldrsh r1, [r0, r2]
	movs r0, #0
	ldrsh r6, [r4, r0]
	adds r0, r7, #0
	adds r0, #0x2f
	movs r5, #0
	ldrsb r5, [r0, r5]
	lsls r5, r5, #3
	lsls r0, r1, #6
	subs r0, r0, r1
	movs r1, #0xf0
	lsls r1, r1, #1
	bl __divsi3
	adds r5, r5, r0
	adds r0, r7, #0
	adds r0, #0x30
	movs r4, #0
	ldrsb r4, [r0, r4]
	lsls r4, r4, #3
	movs r0, #0x2b
	muls r0, r6, r0
	movs r1, #0xa0
	lsls r1, r1, #1
	bl __divsi3
	adds r4, r4, r0
	subs r1, r5, #3
	adds r2, r4, #7
	adds r5, #0x1d
	ldr r0, _080C38AC  @ 0x0000012F
	cmp r5, r0
	bhi _080C389A
	movs r0, #0x20
	negs r0, r0
	cmp r2, r0
	blt _080C389A
	cmp r2, #0xbf
	bgt _080C389A
	ldr r0, _080C38B0  @ 0x000001FF
	ands r1, r0
	movs r0, #0xff
	ands r2, r0
	ldr r3, _080C38B4  @ gObject_8x8
	ldr r0, _080C38B8  @ 0x000090F4
	str r0, [sp]
	movs r0, #0
	bl PutSpriteExt
_080C389A:
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C38A4: .4byte gGMData
_080C38A8: .4byte gProcScr_WorldMapMain
_080C38AC: .4byte 0x0000012F
_080C38B0: .4byte 0x000001FF
_080C38B4: .4byte gObject_8x8
_080C38B8: .4byte 0x000090F4

	THUMB_FUNC_END sub_80C380C

	THUMB_FUNC_START sub_80C38BC
sub_80C38BC: @ 0x080C38BC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x20
	str r0, [sp, #0x14]
	movs r0, #0
	str r0, [sp, #0x18]
	movs r1, #4
	mov r9, r1
	mov r2, sp
	adds r2, #0x10
	str r2, [sp, #0x1c]
	movs r3, #0x12
	add r3, sp
	mov sl, r3
	add r0, sp, #4
	mov r8, r0
_080C38E2:
	ldr r1, _080C3A10  @ gGMData
	mov r2, r9
	lsls r0, r2, #2
	adds r0, r0, r1
	ldrb r1, [r0, #0x10]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080C3956
	ldr r0, _080C3A14  @ gProcScr_WorldMapMain
	bl Proc_Find
	ldr r0, [r0, #0x54]
	mov r1, r9
	ldr r2, [sp, #0x1c]
	mov r3, sl
	bl GmMu_GetPosition
	ldr r3, [sp, #0x1c]
	movs r0, #0
	ldrsh r1, [r3, r0]
	mov r2, sl
	movs r3, #0
	ldrsh r6, [r2, r3]
	ldr r0, [sp, #0x14]
	adds r0, #0x2f
	movs r5, #0
	ldrsb r5, [r0, r5]
	lsls r5, r5, #3
	lsls r0, r1, #6
	subs r0, r0, r1
	movs r1, #0xf0
	lsls r1, r1, #1
	bl __divsi3
	adds r5, r5, r0
	ldr r0, [sp, #0x14]
	adds r0, #0x30
	movs r4, #0
	ldrsb r4, [r0, r4]
	lsls r4, r4, #3
	movs r0, #0x2b
	muls r0, r6, r0
	movs r1, #0xa0
	lsls r1, r1, #1
	bl __divsi3
	adds r4, r4, r0
	subs r5, #3
	mov r0, r8
	strh r5, [r0]
	adds r4, #7
	strh r4, [r0, #2]
	movs r1, #4
	add r8, r1
	ldr r2, [sp, #0x18]
	adds r2, #1
	str r2, [sp, #0x18]
_080C3956:
	movs r3, #1
	add r9, r3
	mov r0, r9
	cmp r0, #6
	ble _080C38E2
	movs r5, #0
	ldr r1, [sp, #0x18]
	subs r1, #1
	mov r8, r1
	cmp r5, r8
	bge _080C39B6
_080C396C:
	adds r6, r5, #1
	ldr r2, [sp, #0x18]
	cmp r6, r2
	bge _080C39B0
	lsls r0, r5, #2
	mov r4, sp
	adds r4, r4, r0
	adds r4, #4
	lsls r0, r6, #2
	adds r2, r0, #0
	add r2, sp
	adds r2, #4
	ldr r3, [sp, #0x18]
	subs r5, r3, r6
_080C3988:
	ldrh r0, [r4, #2]
	movs r3, #2
	ldrsh r1, [r2, r3]
	lsls r3, r0, #0x10
	asrs r0, r3, #0x10
	cmp r1, r0
	bge _080C39A8
	ldrh r7, [r4]
	orrs r7, r3
	ldrh r0, [r2]
	strh r0, [r4]
	ldrh r0, [r2, #2]
	strh r0, [r4, #2]
	strh r7, [r2]
	asrs r0, r7, #0x10
	strh r0, [r2, #2]
_080C39A8:
	adds r2, #4
	subs r5, #1
	cmp r5, #0
	bne _080C3988
_080C39B0:
	adds r5, r6, #0
	cmp r5, r8
	blt _080C396C
_080C39B6:
	ldr r0, [sp, #0x18]
	cmp r0, #0
	ble _080C3A00
	ldr r7, _080C3A18  @ 0x0000012F
	add r4, sp, #4
	movs r6, #0x20
	negs r6, r6
	adds r5, r0, #0
_080C39C6:
	ldrh r2, [r4]
	adds r0, r2, #0
	adds r0, #0x20
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, r7
	bhi _080C39F8
	ldrh r3, [r4, #2]
	movs r1, #2
	ldrsh r0, [r4, r1]
	cmp r0, r6
	blt _080C39F8
	cmp r0, #0xbf
	bgt _080C39F8
	ldr r0, _080C3A1C  @ 0x000001FF
	adds r1, r0, #0
	ands r1, r2
	movs r2, #0xff
	ands r2, r3
	ldr r0, _080C3A20  @ 0x000090F5
	str r0, [sp]
	movs r0, #0
	ldr r3, _080C3A24  @ gObject_8x8
	bl PutSpriteExt
_080C39F8:
	adds r4, #4
	subs r5, #1
	cmp r5, #0
	bne _080C39C6
_080C3A00:
	add sp, #0x20
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C3A10: .4byte gGMData
_080C3A14: .4byte gProcScr_WorldMapMain
_080C3A18: .4byte 0x0000012F
_080C3A1C: .4byte 0x000001FF
_080C3A20: .4byte 0x000090F5
_080C3A24: .4byte gObject_8x8

	THUMB_FUNC_END sub_80C38BC

	THUMB_FUNC_START sub_80C3A28
sub_80C3A28: @ 0x080C3A28
	push {lr}
	ldr r0, _080C3A54  @ gProcScr_WorldMapMain
	bl Proc_Find
	ldr r0, [r0, #0x50]
	adds r0, #0x34
	ldrb r1, [r0]
	ldr r2, _080C3A58  @ gPaletteBuffer+0x320
	lsls r1, r1, #1
	ldr r0, _080C3A5C  @ gUnknown_08AA1930
	adds r0, r1, r0
	ldrh r0, [r0]
	strh r0, [r2, #0x12]
	ldr r0, _080C3A60  @ gUnknown_08AA1950
	adds r1, r1, r0
	ldrh r0, [r1]
	strh r0, [r2, #0xe]
	bl EnablePaletteSync
	pop {r0}
	bx r0
	.align 2, 0
_080C3A54: .4byte gProcScr_WorldMapMain
_080C3A58: .4byte gPaletteBuffer+0x320
_080C3A5C: .4byte gUnknown_08AA1930
_080C3A60: .4byte gUnknown_08AA1950

	THUMB_FUNC_END sub_80C3A28

	THUMB_FUNC_START sub_80C3A64
sub_80C3A64: @ 0x080C3A64
	push {r4, lr}
	adds r4, r0, #0
	bl sub_80C3770
	adds r0, r4, #0
	bl sub_80C38BC
	adds r0, r4, #0
	bl sub_80C380C
	adds r0, r4, #0
	bl sub_80C36E8
	adds r0, r4, #0
	bl sub_80C3A28
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80C3A64

	THUMB_FUNC_START sub_80C3A8C
sub_80C3A8C: @ 0x080C3A8C
	push {r4, lr}
	ldr r4, _080C3AAC  @ gUnknown_0201B458
	adds r0, r4, #0
	movs r1, #8
	movs r2, #8
	movs r3, #0
	bl TileMap_FillRect
	ldr r1, _080C3AB0  @ gUnknown_08AA18AC
	ldr r2, _080C3AB4  @ 0x000071E0
	adds r0, r4, #0
	bl CallARM_FillTileRect
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C3AAC: .4byte gUnknown_0201B458
_080C3AB0: .4byte gUnknown_08AA18AC
_080C3AB4: .4byte 0x000071E0

	THUMB_FUNC_END sub_80C3A8C

	THUMB_FUNC_START sub_80C3AB8
sub_80C3AB8: @ 0x080C3AB8
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r6, _080C3B38  @ gGMData
	ldrb r1, [r6]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _080C3B32
	movs r0, #0
	str r0, [r5, #0x34]
	movs r0, #0x20
	movs r1, #0x20
	movs r2, #0x30
	movs r3, #0x30
	bl sub_80C089C
	adds r1, r5, #0
	adds r1, #0x2a
	strb r0, [r1]
	ldr r3, _080C3B3C  @ gUnknown_08206B70
	movs r2, #0
	ldrsb r2, [r1, r2]
	ldrb r4, [r6]
	lsls r1, r4, #0x1a
	lsrs r1, r1, #0x1e
	lsls r0, r1, #2
	adds r0, r0, r1
	adds r2, r2, r0
	adds r2, r2, r3
	ldrb r0, [r2]
	movs r1, #3
	ands r1, r0
	lsls r1, r1, #4
	movs r0, #0x31
	negs r0, r0
	ands r0, r4
	orrs r0, r1
	strb r0, [r6]
	adds r0, r5, #0
	bl sub_80C3A8C
	adds r1, r5, #0
	adds r1, #0x2d
	ldr r0, [r6, #8]
	asrs r0, r0, #8
	strb r0, [r1]
	adds r2, r5, #0
	adds r2, #0x2e
	ldr r0, [r6, #0xc]
	asrs r0, r0, #8
	strb r0, [r2]
	ldrb r0, [r1]
	subs r1, #2
	strb r0, [r1]
	ldrb r1, [r2]
	adds r0, r5, #0
	adds r0, #0x2c
	strb r1, [r0]
	adds r0, r5, #0
	bl Proc_Break
_080C3B32:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080C3B38: .4byte gGMData
_080C3B3C: .4byte gUnknown_08206B70

	THUMB_FUNC_END sub_80C3AB8

	THUMB_FUNC_START sub_80C3B40
sub_80C3B40: @ 0x080C3B40
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	bl sub_80C3A64
	adds r2, r4, #0
	adds r2, #0x2d
	ldrb r0, [r2]
	adds r5, r4, #0
	adds r5, #0x2b
	strb r0, [r5]
	adds r1, r4, #0
	adds r1, #0x2e
	ldrb r0, [r1]
	adds r7, r4, #0
	adds r7, #0x2c
	strb r0, [r7]
	ldr r6, _080C3BDC  @ gGMData
	ldr r0, [r6, #8]
	asrs r0, r0, #8
	strb r0, [r2]
	ldr r0, [r6, #0xc]
	asrs r3, r0, #8
	strb r3, [r1]
	ldrb r1, [r6]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _080C3BC6
	movs r0, #1
	ldrsb r0, [r6, r0]
	cmp r0, #0
	ble _080C3BD4
	ldrb r0, [r2]
	ldrb r5, [r5]
	cmp r0, r5
	bne _080C3B92
	lsls r0, r3, #0x18
	lsrs r0, r0, #0x18
	ldrb r7, [r7]
	cmp r0, r7
	beq _080C3BD4
_080C3B92:
	movs r0, #0x20
	movs r1, #0x20
	movs r2, #0x30
	movs r3, #0x30
	bl sub_80C089C
	adds r5, r0, #0
	adds r0, r4, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r5, r0
	beq _080C3BD4
	ldrb r1, [r6]
	lsls r1, r1, #0x1a
	ldr r3, _080C3BE0  @ gUnknown_08206B70
	lsrs r2, r1, #0x1e
	lsls r0, r2, #2
	adds r0, r0, r2
	adds r0, r5, r0
	adds r0, r0, r3
	adds r1, r2, #0
	ldrb r0, [r0]
	cmp r1, r0
	beq _080C3BD4
_080C3BC6:
	adds r1, r4, #0
	adds r1, #0x29
	movs r0, #1
	strb r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
_080C3BD4:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C3BDC: .4byte gGMData
_080C3BE0: .4byte gUnknown_08206B70

	THUMB_FUNC_END sub_80C3B40

	THUMB_FUNC_START sub_80C3BE4
sub_80C3BE4: @ 0x080C3BE4
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r6, r1, #0
	ldr r3, _080C3C14  @ gUnknown_08206B70
	adds r0, #0x2a
	movs r2, #0
	ldrsb r2, [r0, r2]
	ldr r0, _080C3C18  @ gGMData
	ldrb r1, [r0]
	lsls r1, r1, #0x1a
	lsrs r1, r1, #0x1e
	lsls r0, r1, #2
	adds r0, r0, r1
	adds r2, r2, r0
	adds r2, r2, r3
	ldrb r5, [r2]
	cmp r5, #1
	beq _080C3C64
	cmp r5, #1
	bgt _080C3C1C
	cmp r5, #0
	beq _080C3C26
	b _080C3D0C
	.align 2, 0
_080C3C14: .4byte gUnknown_08206B70
_080C3C18: .4byte gGMData
_080C3C1C:
	cmp r5, #2
	beq _080C3CA4
	cmp r5, #3
	beq _080C3CD4
	b _080C3D0C
_080C3C26:
	ldr r4, _080C3C5C  @ gBG0TilemapBuffer
	adds r0, r4, #0
	movs r1, #8
	movs r2, #8
	movs r3, #0
	bl TileMap_FillRect
	movs r0, #0x1c
	subs r0, r0, r6
	lsls r0, r0, #1
	ldr r1, _080C3C60  @ gUnknown_0201B430
	adds r0, r0, r1
	adds r1, r4, #0
	adds r2, r6, #0
	movs r3, #8
	bl TileMap_CopyRect
	adds r0, r6, #0
	subs r0, #8
	adds r3, r7, #0
	adds r3, #0x2f
	strb r0, [r3]
	adds r0, r7, #0
	adds r0, #0x30
	strb r5, [r0]
	b _080C3D0C
	.align 2, 0
_080C3C5C: .4byte gBG0TilemapBuffer
_080C3C60: .4byte gUnknown_0201B430
_080C3C64:
	ldr r4, _080C3C9C  @ gBG0TilemapBuffer+0x02C
	adds r0, r4, #0
	movs r1, #8
	movs r2, #8
	movs r3, #0
	bl TileMap_FillRect
	ldr r0, _080C3CA0  @ gUnknown_0201B458
	movs r1, #0x1e
	subs r1, r1, r6
	lsls r1, r1, #1
	subs r4, #0x2c
	adds r1, r1, r4
	adds r2, r6, #0
	movs r3, #8
	bl TileMap_CopyRect
	movs r0, #0x1e
	subs r0, r0, r6
	adds r3, r7, #0
	adds r3, #0x2f
	movs r1, #0
	strb r0, [r3]
	adds r0, r7, #0
	adds r0, #0x30
	strb r1, [r0]
	b _080C3D0C
	.align 2, 0
_080C3C9C: .4byte gBG0TilemapBuffer+0x02C
_080C3CA0: .4byte gUnknown_0201B458
_080C3CA4:
	ldr r4, _080C3CCC  @ gBG0TilemapBuffer+0x300
	adds r0, r4, #0
	movs r1, #8
	movs r2, #8
	movs r3, #0
	bl TileMap_FillRect
	movs r0, #0x1c
	subs r0, r0, r6
	lsls r0, r0, #1
	ldr r1, _080C3CD0  @ gUnknown_0201B430
	adds r0, r0, r1
	adds r1, r4, #0
	adds r2, r6, #0
	movs r3, #8
	bl TileMap_CopyRect
	adds r0, r6, #0
	subs r0, #8
	b _080C3CFE
	.align 2, 0
_080C3CCC: .4byte gBG0TilemapBuffer+0x300
_080C3CD0: .4byte gUnknown_0201B430
_080C3CD4:
	ldr r4, _080C3D18  @ gBG0TilemapBuffer+0x32C
	adds r0, r4, #0
	movs r1, #8
	movs r2, #8
	movs r3, #0
	bl TileMap_FillRect
	ldr r0, _080C3D1C  @ gUnknown_0201B458
	movs r1, #0xcf
	lsls r1, r1, #1
	subs r1, r1, r6
	lsls r1, r1, #1
	ldr r2, _080C3D20  @ 0xFFFFFCD4
	adds r4, r4, r2
	adds r1, r1, r4
	adds r2, r6, #0
	movs r3, #0xc
	bl TileMap_CopyRect
	movs r0, #0x1e
	subs r0, r0, r6
_080C3CFE:
	adds r3, r7, #0
	adds r3, #0x2f
	strb r0, [r3]
	adds r1, r7, #0
	adds r1, #0x30
	movs r0, #0xc
	strb r0, [r1]
_080C3D0C:
	movs r0, #1
	bl BG_EnableSyncByMask
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C3D18: .4byte gBG0TilemapBuffer+0x32C
_080C3D1C: .4byte gUnknown_0201B458
_080C3D20: .4byte 0xFFFFFCD4

	THUMB_FUNC_END sub_80C3BE4

	THUMB_FUNC_START sub_80C3D24
sub_80C3D24: @ 0x080C3D24
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _080C3D58  @ gUnknown_08A3EE6C
	ldr r0, [r4, #0x34]
	adds r0, r0, r1
	movs r1, #0
	ldrsb r1, [r0, r1]
	adds r0, r4, #0
	bl sub_80C3BE4
	adds r0, r4, #0
	bl sub_80C3A64
	ldr r0, [r4, #0x34]
	adds r0, #1
	str r0, [r4, #0x34]
	cmp r0, #4
	bne _080C3D52
	movs r0, #0
	str r0, [r4, #0x34]
	adds r0, r4, #0
	bl Proc_Break
_080C3D52:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C3D58: .4byte gUnknown_08A3EE6C

	THUMB_FUNC_END sub_80C3D24

	THUMB_FUNC_START sub_80C3D5C
sub_80C3D5C: @ 0x080C3D5C
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _080C3D98  @ gUnknown_08A3EE70
	ldr r0, [r4, #0x34]
	adds r0, r0, r1
	movs r1, #0
	ldrsb r1, [r0, r1]
	adds r0, r4, #0
	bl sub_80C3BE4
	adds r0, r4, #0
	bl sub_80C3A64
	ldr r0, [r4, #0x34]
	adds r0, #1
	str r0, [r4, #0x34]
	cmp r0, #4
	bne _080C3D90
	movs r0, #0
	str r0, [r4, #0x34]
	adds r1, r4, #0
	adds r1, #0x29
	strb r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
_080C3D90:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C3D98: .4byte gUnknown_08A3EE70

	THUMB_FUNC_END sub_80C3D5C

	THUMB_FUNC_START sub_80C3D9C
sub_80C3D9C: @ 0x080C3D9C
	movs r1, #0
	str r1, [r0, #0x34]
	adds r2, r0, #0
	adds r2, #0x29
	strb r1, [r2]
	adds r0, #0x2a
	strb r1, [r0]
	bx lr

	THUMB_FUNC_END sub_80C3D9C

	THUMB_FUNC_START sub_80C3DAC
sub_80C3DAC: @ 0x080C3DAC
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r2, _080C3E68  @ gLCDControlBuffer
	ldrb r1, [r2, #1]
	movs r0, #0x21
	negs r0, r0
	ands r0, r1
	movs r1, #0x41
	negs r1, r1
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r2, #1]
	adds r2, #0x36
	ldrb r0, [r2]
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
	movs r1, #0x20
	orrs r0, r1
	strb r0, [r2]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	movs r0, #1
	movs r1, #0xe
	movs r2, #3
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	movs r0, #0
	str r0, [sp]
	movs r1, #1
	movs r2, #0
	movs r3, #0
	bl SetBlendTargetA
	movs r0, #1
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #1
	movs r3, #1
	bl SetBlendTargetB
	movs r0, #0
	bl SetBlendBackdropA
	ldr r0, _080C3E6C  @ gUnknown_08AA1280
	ldr r1, _080C3E70  @ 0x06003C00
	bl Decompress
	ldr r0, _080C3E74  @ gUnknown_08AA188C
	movs r1, #0xe0
	movs r2, #0x20
	bl CopyToPaletteBuffer
	ldr r0, _080C3E78  @ gPal_GMapPI_ShopIcons
	movs r1, #0xc8
	lsls r1, r1, #2
	movs r2, #0x20
	bl CopyToPaletteBuffer
	bl EnablePaletteSync
	ldr r0, _080C3E7C  @ gUnknown_08A3EE74
	ldr r1, [r4, #0x14]
	bl Proc_Start
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C3E68: .4byte gLCDControlBuffer
_080C3E6C: .4byte gUnknown_08AA1280
_080C3E70: .4byte 0x06003C00
_080C3E74: .4byte gUnknown_08AA188C
_080C3E78: .4byte gPal_GMapPI_ShopIcons
_080C3E7C: .4byte gUnknown_08A3EE74

	THUMB_FUNC_END sub_80C3DAC

	THUMB_FUNC_START sub_80C3E80
sub_80C3E80: @ 0x080C3E80
	push {lr}
	adds r1, r0, #0
	ldr r0, _080C3E90  @ gUnknown_08A3EED4
	bl Proc_Start
	pop {r1}
	bx r1
	.align 2, 0
_080C3E90: .4byte gUnknown_08A3EED4

	THUMB_FUNC_END sub_80C3E80

	THUMB_FUNC_START sub_80C3E94
sub_80C3E94: @ 0x080C3E94
	push {lr}
	ldr r0, _080C3EB8  @ gUnknown_08A3EE74
	bl Proc_EndEach
	ldr r0, _080C3EBC  @ gUnknown_08A3EED4
	bl Proc_EndEach
	bl SetDefaultColorEffects
	ldr r0, _080C3EC0  @ gBG1TilemapBuffer
	movs r1, #0
	bl BG_Fill
	movs r0, #2
	bl BG_EnableSyncByMask
	pop {r0}
	bx r0
	.align 2, 0
_080C3EB8: .4byte gUnknown_08A3EE74
_080C3EBC: .4byte gUnknown_08A3EED4
_080C3EC0: .4byte gBG1TilemapBuffer

	THUMB_FUNC_END sub_80C3E94

	THUMB_FUNC_START nullsub_71
nullsub_71: @ 0x080C3EC4
	bx lr

	THUMB_FUNC_END nullsub_71

	THUMB_FUNC_START sub_80C3EC8
sub_80C3EC8: @ 0x080C3EC8
	adds r1, r0, #0
	adds r2, r1, #0
	adds r2, #0x2a
	movs r0, #0
	strb r0, [r2]
	adds r2, #1
	strb r0, [r2]
	subs r0, #1
	str r0, [r1, #0x2c]
	bx lr

	THUMB_FUNC_END sub_80C3EC8

	THUMB_FUNC_START sub_80C3EDC
sub_80C3EDC: @ 0x080C3EDC
	push {r4, lr}
	adds r4, r0, #0
	bl sub_8002264
	adds r1, r4, #0
	adds r1, #0x30
	strb r0, [r1]
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080C3EF6
	bl Sound_GetCurrentSong
	str r0, [r4, #0x34]
_080C3EF6:
	adds r0, r4, #0
	bl StartPrepItemScreen
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80C3EDC

	THUMB_FUNC_START sub_80C3F04
sub_80C3F04: @ 0x080C3F04
	push {lr}
	adds r1, r0, #0
	adds r0, #0x30
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _080C3F1E
	ldr r0, [r1, #0x34]
	movs r1, #1
	movs r2, #0
	bl StartBgmFadeIn
_080C3F1E:
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80C3F04

	THUMB_FUNC_START sub_80C3F24
sub_80C3F24: @ 0x080C3F24
	push {lr}
	adds r1, r0, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #1
	beq _080C3F50
	cmp r0, #1
	bgt _080C3F3A
	cmp r0, #0
	beq _080C3F40
	b _080C3F7A
_080C3F3A:
	cmp r0, #2
	beq _080C3F60
	b _080C3F7A
_080C3F40:
	ldr r0, [r1, #0x2c]
	cmp r0, #0
	beq _080C3F70
	adds r0, r1, #0
	movs r1, #1
	bl Proc_Goto
	b _080C3F82
_080C3F50:
	ldr r0, [r1, #0x2c]
	cmp r0, #0
	beq _080C3F70
	adds r0, r1, #0
	movs r1, #2
	bl Proc_Goto
	b _080C3F82
_080C3F60:
	ldr r0, [r1, #0x2c]
	cmp r0, #0
	beq _080C3F70
	adds r0, r1, #0
	movs r1, #3
	bl Proc_Goto
	b _080C3F82
_080C3F70:
	adds r0, r1, #0
	movs r1, #5
	bl Proc_Goto
	b _080C3F82
_080C3F7A:
	adds r0, r1, #0
	movs r1, #5
	bl Proc_Goto
_080C3F82:
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80C3F24

	THUMB_FUNC_START sub_80C3F88
sub_80C3F88: @ 0x080C3F88
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x2c]
	bl GetUnitFromCharId
	ldr r1, _080C3FAC  @ gGMData
	ldrb r1, [r1, #0x11]
	lsls r1, r1, #5
	ldr r2, _080C3FB0  @ gWMNodeData
	adds r1, r1, r2
	ldr r1, [r1, #0xc]
	adds r2, r4, #0
	bl StartArmoryScreen
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C3FAC: .4byte gGMData
_080C3FB0: .4byte gWMNodeData

	THUMB_FUNC_END sub_80C3F88

	THUMB_FUNC_START sub_80C3FB4
sub_80C3FB4: @ 0x080C3FB4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x2c]
	bl GetUnitFromCharId
	ldr r1, _080C3FD8  @ gGMData
	ldrb r1, [r1, #0x11]
	lsls r1, r1, #5
	ldr r2, _080C3FDC  @ gWMNodeData
	adds r1, r1, r2
	ldr r1, [r1, #0x10]
	adds r2, r4, #0
	bl StartVendorScreen
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C3FD8: .4byte gGMData
_080C3FDC: .4byte gWMNodeData

	THUMB_FUNC_END sub_80C3FB4

	THUMB_FUNC_START sub_80C3FE0
sub_80C3FE0: @ 0x080C3FE0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x2c]
	bl GetUnitFromCharId
	ldr r1, _080C4004  @ gGMData
	ldrb r1, [r1, #0x11]
	lsls r1, r1, #5
	ldr r2, _080C4008  @ gWMNodeData
	adds r1, r1, r2
	ldr r1, [r1, #0x14]
	adds r2, r4, #0
	bl StartSecretShopScreen
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C4004: .4byte gGMData
_080C4008: .4byte gWMNodeData

	THUMB_FUNC_END sub_80C3FE0

	THUMB_FUNC_START sub_80C400C
sub_80C400C: @ 0x080C400C
	push {r4, lr}
	adds r4, r0, #0
	cmp r1, #0
	beq _080C4020
	ldr r0, _080C401C  @ gUnknown_08A3EEEC
	bl Proc_StartBlocking
	b _080C4028
	.align 2, 0
_080C401C: .4byte gUnknown_08A3EEEC
_080C4020:
	ldr r0, _080C4034  @ gUnknown_08A3EEEC
	movs r1, #3
	bl Proc_Start
_080C4028:
	adds r1, r0, #0
	adds r1, #0x29
	strb r4, [r1]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080C4034: .4byte gUnknown_08A3EEEC

	THUMB_FUNC_END sub_80C400C

	THUMB_FUNC_START sub_80C4038
sub_80C4038: @ 0x080C4038
	push {lr}
	ldr r0, _080C4044  @ gUnknown_08A3EEEC
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
_080C4044: .4byte gUnknown_08A3EEEC

	THUMB_FUNC_END sub_80C4038

	THUMB_FUNC_START sub_80C4048
sub_80C4048: @ 0x080C4048
	push {lr}
	ldr r0, _080C4054  @ gUnknown_08A3EEEC
	bl Proc_Find
	pop {r1}
	bx r1
	.align 2, 0
_080C4054: .4byte gUnknown_08A3EEEC

	THUMB_FUNC_END sub_80C4048

	THUMB_FUNC_START sub_80C4058
sub_80C4058: @ 0x080C4058
	push {lr}
	ldr r0, _080C406C  @ gUnknown_08A3EEEC
	bl Proc_Find
	cmp r0, #0
	beq _080C4066
	movs r0, #1
_080C4066:
	pop {r1}
	bx r1
	.align 2, 0
_080C406C: .4byte gUnknown_08A3EEEC

	THUMB_FUNC_END sub_80C4058

	THUMB_FUNC_START sub_80C4070
sub_80C4070: @ 0x080C4070
	push {lr}
	bl sub_80C4048
	cmp r0, #0
	bne _080C407E
	movs r0, #0
	b _080C4082
_080C407E:
	adds r0, #0x29
	ldrb r0, [r0]
_080C4082:
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80C4070

	THUMB_FUNC_START sub_80C4088
sub_80C4088: @ 0x080C4088
	push {lr}
	bl sub_80C4048
	cmp r0, #0
	bne _080C4096
	movs r0, #0
	b _080C4098
_080C4096:
	ldr r0, [r0, #0x2c]
_080C4098:
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80C4088

	THUMB_FUNC_START sub_80C409C
sub_80C409C: @ 0x080C409C
	push {r4, lr}
	adds r4, r0, #0
	bl sub_80C4048
	cmp r0, #0
	beq _080C40AA
	str r4, [r0, #0x2c]
_080C40AA:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80C409C

	THUMB_FUNC_START sub_80C40B0
sub_80C40B0: @ 0x080C40B0
	movs r1, #0
	strh r1, [r0, #0x30]
	strh r1, [r0, #0x34]
	bx lr

	THUMB_FUNC_END sub_80C40B0

	THUMB_FUNC_START sub_80C40B8
sub_80C40B8: @ 0x080C40B8
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x30]
	adds r0, #1
	strh r0, [r4, #0x30]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x77
	bgt _080C4100
	movs r0, #0x30
	ldrsh r1, [r4, r0]
	movs r0, #0x77
	subs r0, r0, r1
	movs r1, #0x78
	movs r2, #1
	bl sub_800B84C
	adds r1, r0, #0
	movs r0, #0x80
	lsls r0, r0, #5
	subs r1, r0, r1
	lsls r1, r1, #4
	bl DivArm
	adds r2, r0, #0
	movs r1, #0x10
	subs r1, r1, r2
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	movs r0, #1
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	b _080C4124
_080C4100:
	movs r0, #1
	movs r1, #0
	movs r2, #0x10
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	ldr r0, [r4, #0x2c]
	ldrh r0, [r0, #0x30]
	strh r0, [r4, #0x34]
	ldr r1, [r4, #0x14]
	adds r1, #0x29
	ldrb r0, [r1]
	movs r2, #1
	orrs r0, r2
	strb r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
_080C4124:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80C40B8

	THUMB_FUNC_START sub_80C412C
sub_80C412C: @ 0x080C412C
	push {lr}
	adds r2, r0, #0
	ldrh r0, [r2, #0x34]
	subs r0, #1
	strh r0, [r2, #0x34]
	ldr r1, [r2, #0x14]
	ldr r0, [r1, #0x30]
	movs r3, #0x80
	lsls r3, r3, #4
	adds r0, r0, r3
	ldr r3, [r1, #0x40]
	cmp r0, r3
	blt _080C4150
	str r3, [r1, #0x30]
	adds r0, r2, #0
	bl Proc_Break
	b _080C4152
_080C4150:
	str r0, [r1, #0x30]
_080C4152:
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80C412C

	THUMB_FUNC_START sub_80C4158
sub_80C4158: @ 0x080C4158
	push {lr}
	adds r3, r0, #0
	ldrh r0, [r3, #0x34]
	subs r0, #1
	strh r0, [r3, #0x34]
	lsls r0, r0, #0x10
	cmp r0, #0
	bgt _080C417E
	movs r0, #0
	strh r0, [r3, #0x30]
	ldr r1, [r3, #0x14]
	adds r1, #0x29
	ldrb r2, [r1]
	subs r0, #2
	ands r0, r2
	strb r0, [r1]
	adds r0, r3, #0
	bl Proc_Break
_080C417E:
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80C4158

	THUMB_FUNC_START sub_80C4184
sub_80C4184: @ 0x080C4184
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x30]
	adds r0, #1
	strh r0, [r4, #0x30]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x77
	bgt _080C41CA
	movs r0, #0x30
	ldrsh r1, [r4, r0]
	movs r0, #0x77
	subs r0, r0, r1
	movs r1, #0x78
	movs r2, #1
	bl sub_800B84C
	adds r1, r0, #0
	movs r0, #0x80
	lsls r0, r0, #5
	subs r1, r0, r1
	lsls r1, r1, #4
	bl DivArm
	lsls r1, r0, #0x18
	lsrs r1, r1, #0x18
	movs r2, #0x10
	subs r2, r2, r0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	movs r0, #1
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	b _080C41DC
_080C41CA:
	movs r0, #1
	movs r1, #0x10
	movs r2, #0
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	adds r0, r4, #0
	bl Proc_Break
_080C41DC:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80C4184

	THUMB_FUNC_START sub_80C41E4
sub_80C41E4: @ 0x080C41E4
	ldr r1, [r0, #0x14]
	adds r1, #0x29
	ldrb r2, [r1]
	movs r0, #5
	negs r0, r0
	ands r0, r2
	strb r0, [r1]
	bx lr

	THUMB_FUNC_END sub_80C41E4

	THUMB_FUNC_START sub_80C41F4
sub_80C41F4: @ 0x080C41F4
	push {r4, lr}
	adds r2, r0, #0
	adds r4, r1, #0
	ldr r0, _080C420C  @ gUnknown_08AA2044
	adds r1, r2, #0
	bl Proc_Start
	str r4, [r0, #0x2c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C420C: .4byte gUnknown_08AA2044

	THUMB_FUNC_END sub_80C41F4

	THUMB_FUNC_START sub_80C4210
sub_80C4210: @ 0x080C4210
	push {lr}
	ldr r0, _080C4224  @ gUnknown_08AA2044
	bl Proc_Find
	cmp r0, #0
	beq _080C421E
	movs r0, #1
_080C421E:
	pop {r1}
	bx r1
	.align 2, 0
_080C4224: .4byte gUnknown_08AA2044

	THUMB_FUNC_END sub_80C4210

	THUMB_FUNC_START sub_80C4228
sub_80C4228: @ 0x080C4228
	push {lr}
	ldr r0, _080C4234  @ gUnknown_08AA2044
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
_080C4234: .4byte gUnknown_08AA2044

	THUMB_FUNC_END sub_80C4228

	THUMB_FUNC_START sub_80C4238
sub_80C4238: @ 0x080C4238
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r3, r0, #0
	ldr r0, [r3, #0x30]
	asrs r0, r0, #8
	cmp r0, #0
	bge _080C4250
	adds r0, #0xff
_080C4250:
	asrs r4, r0, #8
	adds r1, r3, #0
	adds r1, #0x35
	strb r4, [r1]
	ldr r0, [r3, #0x30]
	asrs r2, r0, #8
	adds r0, r2, #0
	mov r8, r1
	cmp r2, #0
	bge _080C4266
	adds r0, #0xff
_080C4266:
	asrs r0, r0, #8
	lsls r0, r0, #8
	subs r0, r2, r0
	cmp r0, #0xf
	bgt _080C4272
	b _080C4398
_080C4272:
	adds r0, r3, #0
	adds r0, #0x34
	lsls r1, r4, #0x18
	asrs r1, r1, #0x18
	movs r2, #0
	ldrsb r2, [r0, r2]
	str r0, [sp, #4]
	cmp r1, r2
	bne _080C4286
	b _080C4398
_080C4286:
	adds r4, r3, #0
	adds r4, #0x29
	ldrb r1, [r4]
	movs r0, #4
	ands r0, r1
	ldr r1, _080C42D4  @ gUnknown_08206E24
	mov r9, r1
	ldr r2, _080C42D8  @ gUnknown_08206FDC
	mov sl, r2
	cmp r0, #0
	bne _080C4302
	mov r1, r8
	movs r0, #0
	ldrsb r0, [r1, r0]
	adds r2, r0, #1
	cmp r2, #0x16
	bhi _080C4302
	adds r6, r3, #0
	adds r6, #0x48
	mov r7, r9
	subs r7, #0x14
	ldr r0, _080C42DC  @ gPlaySt
	mov ip, r0
	lsls r0, r2, #2
	adds r0, r0, r2
	lsls r1, r0, #2
_080C42BA:
	adds r5, r1, r7
	ldr r0, [r5, #4]
	cmp r0, #0
	beq _080C42FA
	movs r0, #0
	strb r0, [r6]
	mov r1, ip
	ldrb r0, [r1, #0x1b]
	cmp r0, #2
	bne _080C42E0
	ldr r0, [r5, #4]
	b _080C42E2
	.align 2, 0
_080C42D4: .4byte gUnknown_08206E24
_080C42D8: .4byte gUnknown_08206FDC
_080C42DC: .4byte gPlaySt
_080C42E0:
	ldr r0, [r5, #8]
_080C42E2:
	str r0, [r3, #0x44]
	ldr r0, [r5, #0xc]
	str r0, [r3, #0x3c]
	ldr r0, [r5, #0x10]
	str r0, [r3, #0x40]
	ldrb r1, [r4]
	movs r0, #4
	orrs r1, r0
	movs r0, #2
	orrs r1, r0
	strb r1, [r4]
	b _080C4302
_080C42FA:
	adds r1, #0x14
	adds r2, #1
	cmp r2, #0x16
	bls _080C42BA
_080C4302:
	mov r2, r8
	movs r0, #0
	ldrsb r0, [r2, r0]
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #2
	mov r2, r9
	adds r5, r1, r2
	adds r2, r0, #1
	movs r0, #1
	ands r2, r0
	ldr r0, [r5]
	cmp r0, #0
	beq _080C435C
	ldr r0, [r0]
	lsls r1, r2, #2
	add r1, sl
	ldr r4, [r1]
	movs r2, #0xc0
	lsls r2, r2, #0x13
	adds r1, r4, r2
	bl Decompress
	ldr r0, [r5]
	ldr r0, [r0, #4]
	ldr r5, _080C4354  @ gGenericBuffer
	adds r1, r5, #0
	bl Decompress
	ldr r0, _080C4358  @ gUnknown_0201C5D4
	lsrs r4, r4, #5
	movs r1, #0xe0
	lsls r1, r1, #7
	adds r4, r4, r1
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	adds r1, r5, #0
	adds r2, r4, #0
	bl CallARM_FillTileRect
	b _080C4390
	.align 2, 0
_080C4354: .4byte gGenericBuffer
_080C4358: .4byte gUnknown_0201C5D4
_080C435C:
	movs r0, #1
	negs r0, r0
	str r0, [sp]
	ldr r1, _080C43A8  @ gUnknown_08206FDC
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r4, [r0]
	movs r2, #0xc0
	lsls r2, r2, #0x13
	adds r1, r4, r2
	ldr r2, _080C43AC  @ 0x01000008
	mov r0, sp
	bl CpuFastSet
	lsrs r4, r4, #5
	movs r1, #0xe0
	lsls r1, r1, #7
	adds r0, r4, r1
	ldr r3, _080C43B0  @ gUnknown_0201C5D4
	movs r2, #0x80
	lsls r2, r2, #3
_080C4386:
	strh r0, [r3]
	adds r3, #2
	subs r2, #1
	cmp r2, #0
	bne _080C4386
_080C4390:
	mov r2, r8
	ldrb r0, [r2]
	ldr r1, [sp, #4]
	strb r0, [r1]
_080C4398:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C43A8: .4byte gUnknown_08206FDC
_080C43AC: .4byte 0x01000008
_080C43B0: .4byte gUnknown_0201C5D4

	THUMB_FUNC_END sub_80C4238

	THUMB_FUNC_START sub_80C43B4
sub_80C43B4: @ 0x080C43B4
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x30]
	asrs r5, r0, #8
	adds r0, r5, #0
	cmp r5, #0
	bge _080C43C4
	adds r0, #0xf
_080C43C4:
	asrs r0, r0, #4
	strh r0, [r4, #0x38]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x36
	ldrsh r1, [r4, r2]
	cmp r0, r1
	beq _080C440C
	adds r1, r5, #0
	adds r1, #0xf0
	adds r0, r1, #0
	cmp r1, #0
	bge _080C43E2
	ldr r2, _080C4454  @ 0x000001EF
	adds r0, r5, r2
_080C43E2:
	asrs r0, r0, #8
	lsls r0, r0, #8
	subs r0, r1, r0
	adds r1, r0, #0
	cmp r0, #0
	bge _080C43F0
	adds r1, r0, #7
_080C43F0:
	asrs r1, r1, #3
	lsls r1, r1, #6
	ldr r0, _080C4458  @ gUnknown_0201C5D4
	adds r0, r1, r0
	ldr r2, _080C445C  @ gBG0TilemapBuffer
	adds r1, r1, r2
	movs r2, #0x20
	bl CpuFastSet
	movs r0, #1
	bl BG_EnableSyncByMask
	ldrh r0, [r4, #0x38]
	strh r0, [r4, #0x36]
_080C440C:
	bl sub_80C4210
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080C443A
	ldr r0, [r4, #0x2c]
	ldr r2, [r4, #0x30]
	cmp r0, r2
	beq _080C443A
	adds r0, r4, #0
	adds r0, #0x29
	ldrb r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _080C443A
	ldr r0, [r4, #0x3c]
	cmp r2, r0
	blt _080C443A
	ldr r1, [r4, #0x44]
	adds r0, r4, #0
	bl sub_80C41F4
_080C443A:
	movs r0, #0xff
	ands r5, r0
	movs r0, #0
	movs r1, #0
	adds r2, r5, #0
	bl BG_SetPosition
	ldr r0, [r4, #0x30]
	str r0, [r4, #0x2c]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C4454: .4byte 0x000001EF
_080C4458: .4byte gUnknown_0201C5D4
_080C445C: .4byte gBG0TilemapBuffer

	THUMB_FUNC_END sub_80C43B4

	THUMB_FUNC_START sub_80C4460
sub_80C4460: @ 0x080C4460
	push {r4, r5, r6, lr}
	sub sp, #0xc
	adds r6, r0, #0
	movs r0, #0
	bl SetPrimaryHBlankHandler
	movs r0, #0
	bl SetupBackgrounds
	ldr r3, _080C45B8  @ gLCDControlBuffer
	ldrb r1, [r3, #1]
	movs r0, #2
	negs r0, r0
	ands r0, r1
	movs r1, #3
	negs r1, r1
	ands r0, r1
	subs r1, #2
	ands r0, r1
	subs r1, #4
	ands r0, r1
	subs r1, #8
	ands r0, r1
	strb r0, [r3, #1]
	ldrb r2, [r3, #0xc]
	adds r1, #0xd
	adds r0, r1, #0
	ands r0, r2
	strb r0, [r3, #0xc]
	ldrb r2, [r3, #0x10]
	adds r0, r1, #0
	ands r0, r2
	movs r2, #1
	orrs r0, r2
	strb r0, [r3, #0x10]
	ldrb r0, [r3, #0x14]
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	strb r1, [r3, #0x14]
	ldrb r0, [r3, #0x18]
	movs r1, #3
	orrs r0, r1
	strb r0, [r3, #0x18]
	movs r0, #1
	movs r1, #0x10
	movs r2, #0
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	movs r4, #0
	str r4, [sp]
	movs r0, #1
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl SetBlendTargetA
	str r4, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #1
	bl SetBlendTargetB
	movs r0, #0
	bl SetBlendBackdropA
	movs r0, #0
	bl SetBlendBackdropB
	str r4, [sp, #4]
	ldr r1, _080C45BC  @ gPaletteBuffer
	ldr r2, _080C45C0  @ 0x01000100
	add r0, sp, #4
	bl CpuFastSet
	ldr r0, _080C45C4  @ gUnknown_08A40FC8
	movs r1, #0xe0
	movs r2, #0x20
	bl CopyToPaletteBuffer
	movs r0, #1
	negs r0, r0
	str r0, [sp, #8]
	add r0, sp, #8
	ldr r1, _080C45C8  @ gUnknown_08206FDC
	ldr r4, [r1]
	movs r2, #0xc0
	lsls r2, r2, #0x13
	adds r1, r4, r2
	ldr r2, _080C45CC  @ 0x01000008
	bl CpuFastSet
	lsrs r4, r4, #5
	movs r0, #0xe0
	lsls r0, r0, #7
	adds r4, r4, r0
	ldr r0, _080C45D0  @ gBG0TilemapBuffer
	movs r5, #0x80
	lsls r5, r5, #3
_080C452A:
	strh r4, [r0]
	adds r0, #2
	subs r5, #1
	cmp r5, #0
	bne _080C452A
	ldr r0, _080C45D4  @ gBG1TilemapBuffer
	movs r1, #0
	bl BG_Fill
	ldr r0, _080C45D8  @ gBG2TilemapBuffer
	movs r1, #0
	bl BG_Fill
	ldr r0, _080C45DC  @ gBG3TilemapBuffer
	movs r1, #0
	bl BG_Fill
	movs r0, #0xf
	bl BG_EnableSyncByMask
	bl EnablePaletteSync
	ldr r2, _080C45B8  @ gLCDControlBuffer
	ldrb r0, [r2, #1]
	movs r1, #1
	orrs r0, r1
	movs r4, #3
	negs r4, r4
	ands r0, r4
	movs r1, #5
	negs r1, r1
	ands r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x11
	negs r1, r1
	ands r0, r1
	strb r0, [r2, #1]
	bl SetDefaultColorEffects
	movs r0, #3
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	adds r2, r6, #0
	adds r2, #0x29
	ldrb r1, [r2]
	movs r0, #2
	negs r0, r0
	ands r0, r1
	ands r0, r4
	strb r0, [r2]
	str r5, [r6, #0x2c]
	str r5, [r6, #0x30]
	adds r1, r6, #0
	adds r1, #0x34
	movs r0, #0xff
	strb r0, [r1]
	adds r0, r6, #0
	adds r0, #0x35
	strb r5, [r0]
	strh r5, [r6, #0x36]
	strh r5, [r6, #0x38]
	adds r0, #0x15
	strh r5, [r0]
	add sp, #0xc
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080C45B8: .4byte gLCDControlBuffer
_080C45BC: .4byte gPaletteBuffer
_080C45C0: .4byte 0x01000100
_080C45C4: .4byte gUnknown_08A40FC8
_080C45C8: .4byte gUnknown_08206FDC
_080C45CC: .4byte 0x01000008
_080C45D0: .4byte gBG0TilemapBuffer
_080C45D4: .4byte gBG1TilemapBuffer
_080C45D8: .4byte gBG2TilemapBuffer
_080C45DC: .4byte gBG3TilemapBuffer

	THUMB_FUNC_END sub_80C4460

	THUMB_FUNC_START sub_80C45E0
sub_80C45E0: @ 0x080C45E0
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r0, #0x29
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080C465A
	adds r0, r4, #0
	adds r0, #0x48
	movs r1, #0
	ldrsb r1, [r0, r1]
	adds r5, r0, #0
	cmp r1, #9
	bgt _080C461C
	ldr r0, [r4, #0x44]
	movs r1, #0
	ldrsb r1, [r5, r1]
	lsls r2, r1, #2
	adds r0, r0, r2
	ldr r0, [r0]
	lsls r1, r1, #0xb
	ldr r2, _080C4618  @ 0x06008000
	adds r1, r1, r2
	bl Decompress
	b _080C463E
	.align 2, 0
_080C4618: .4byte 0x06008000
_080C461C:
	ldr r0, _080C4660  @ gBG3TilemapBuffer
	ldr r1, [r4, #0x44]
	ldr r1, [r1, #0x28]
	movs r2, #0
	bl CallARM_FillTileRect
	movs r0, #8
	bl BG_EnableSyncByMask
	ldr r0, [r4, #0x44]
	ldr r0, [r0, #0x2c]
	movs r1, #0
	movs r2, #0xc0
	bl CopyToPaletteBuffer
	bl EnablePaletteSync
_080C463E:
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0xa
	ble _080C465A
	adds r2, r4, #0
	adds r2, #0x29
	ldrb r1, [r2]
	movs r0, #3
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
_080C465A:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C4660: .4byte gBG3TilemapBuffer

	THUMB_FUNC_END sub_80C45E0

	THUMB_FUNC_START sub_80C4664
sub_80C4664: @ 0x080C4664
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080C4688  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _080C468C
	bl CheckGameEndFlag
	cmp r0, #0
	beq _080C468C
	adds r0, r4, #0
	movs r1, #0
	bl Proc_Goto
	b _080C46DA
	.align 2, 0
_080C4688: .4byte gKeyStatusPtr
_080C468C:
	ldr r1, [r4, #0x30]
	ldr r0, _080C46E0  @ 0x000037FF
	cmp r1, r0
	bgt _080C469C
	movs r2, #0xf0
	lsls r2, r2, #3
	adds r0, r1, r2
	str r0, [r4, #0x30]
_080C469C:
	adds r0, r4, #0
	adds r0, #0x29
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _080C46B0
	ldr r0, [r4, #0x30]
	adds r0, #0x80
	str r0, [r4, #0x30]
_080C46B0:
	adds r0, r4, #0
	bl sub_80C4238
	adds r0, r4, #0
	bl sub_80C43B4
	adds r0, r4, #0
	bl sub_80C45E0
	adds r0, r4, #0
	adds r0, #0x35
	ldrb r0, [r0]
	cmp r0, #0x14
	bls _080C46DA
	adds r1, r4, #0
	adds r1, #0x4a
	movs r0, #0xf0
	strh r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
_080C46DA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C46E0: .4byte 0x000037FF

	THUMB_FUNC_END sub_80C4664

	THUMB_FUNC_START sub_80C46E4
sub_80C46E4: @ 0x080C46E4
	push {lr}
	bl sub_80C4228
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80C46E4

	THUMB_FUNC_START sub_80C46F0
sub_80C46F0: @ 0x080C46F0
	push {lr}
	ldr r2, _080C4730  @ gLCDControlBuffer
	ldrb r1, [r2, #1]
	movs r0, #2
	negs r0, r0
	ands r0, r1
	movs r1, #3
	negs r1, r1
	ands r0, r1
	subs r1, #2
	ands r0, r1
	subs r1, #4
	ands r0, r1
	subs r1, #8
	ands r0, r1
	strb r0, [r2, #1]
	bl SetDefaultColorEffects
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	ldr r0, _080C4734  @ gBG3TilemapBuffer
	movs r1, #0
	bl BG_Fill
	movs r0, #8
	bl BG_EnableSyncByMask
	pop {r0}
	bx r0
	.align 2, 0
_080C4730: .4byte gLCDControlBuffer
_080C4734: .4byte gBG3TilemapBuffer

	THUMB_FUNC_END sub_80C46F0

	THUMB_FUNC_START sub_80C4738
sub_80C4738: @ 0x080C4738
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r0, _080C4798  @ gUnknown_08206FB4
	ldr r5, [r0]
	ldr r0, [r5]
	ldr r1, _080C479C  @ gUnknown_08206FDC
	ldr r4, [r1]
	movs r2, #0xc0
	lsls r2, r2, #0x13
	adds r1, r4, r2
	bl Decompress
	ldr r0, [r5, #4]
	ldr r5, _080C47A0  @ gGenericBuffer
	adds r1, r5, #0
	bl Decompress
	ldr r0, _080C47A4  @ gBG0TilemapBuffer
	lsrs r4, r4, #5
	movs r1, #0xe0
	lsls r1, r1, #7
	adds r4, r4, r1
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	adds r1, r5, #0
	adds r2, r4, #0
	bl CallARM_FillTileRect
	movs r0, #1
	bl BG_EnableSyncByMask
	ldr r1, _080C47A8  @ gPaletteBuffer
	movs r0, #0
	strh r0, [r1]
	ldr r0, _080C47AC  @ gUnknown_08A40FC8
	movs r1, #0xe0
	movs r2, #0x20
	bl CopyToPaletteBuffer
	bl EnablePaletteSync
	adds r6, #0x4a
	movs r0, #0xf0
	strh r0, [r6]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080C4798: .4byte gUnknown_08206FB4
_080C479C: .4byte gUnknown_08206FDC
_080C47A0: .4byte gGenericBuffer
_080C47A4: .4byte gBG0TilemapBuffer
_080C47A8: .4byte gPaletteBuffer
_080C47AC: .4byte gUnknown_08A40FC8

	THUMB_FUNC_END sub_80C4738

	THUMB_FUNC_START sub_80C47B0
sub_80C47B0: @ 0x080C47B0
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r5, #0
	adds r4, #0x4a
	ldrh r0, [r4]
	subs r0, #1
	strh r0, [r4]
	ldr r0, _080C47F0  @ gKeyStatusPtr
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _080C47D8
	bl CheckGameEndFlag
	cmp r0, #0
	beq _080C47D8
	movs r0, #0
	strh r0, [r4]
_080C47D8:
	adds r0, r5, #0
	adds r0, #0x4a
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bgt _080C47EA
	adds r0, r5, #0
	bl Proc_Break
_080C47EA:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C47F0: .4byte gKeyStatusPtr

	THUMB_FUNC_END sub_80C47B0

	THUMB_FUNC_START sub_80C47F4
sub_80C47F4: @ 0x080C47F4
	push {lr}
	sub sp, #4
	ldr r0, _080C4860  @ gBG0TilemapBuffer
	movs r1, #0
	bl BG_Fill
	ldr r0, _080C4864  @ gBG1TilemapBuffer
	movs r1, #0
	bl BG_Fill
	ldr r0, _080C4868  @ gBG2TilemapBuffer
	movs r1, #0
	bl BG_Fill
	movs r0, #0
	str r0, [sp]
	movs r1, #0xc0
	lsls r1, r1, #0x13
	ldr r2, _080C486C  @ 0x01006000
	mov r0, sp
	bl CpuFastSet
	ldr r2, _080C4870  @ gLCDControlBuffer
	ldrb r1, [r2, #1]
	movs r0, #2
	negs r0, r0
	ands r0, r1
	movs r1, #3
	negs r1, r1
	ands r0, r1
	subs r1, #2
	ands r0, r1
	subs r1, #4
	ands r0, r1
	subs r1, #8
	ands r0, r1
	strb r0, [r2, #1]
	movs r0, #1
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	ldr r0, _080C4874  @ gBG3TilemapBuffer
	movs r1, #1
	negs r1, r1
	bl BG_Fill
	movs r0, #8
	bl BG_EnableSyncByMask
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_080C4860: .4byte gBG0TilemapBuffer
_080C4864: .4byte gBG1TilemapBuffer
_080C4868: .4byte gBG2TilemapBuffer
_080C486C: .4byte 0x01006000
_080C4870: .4byte gLCDControlBuffer
_080C4874: .4byte gBG3TilemapBuffer

	THUMB_FUNC_END sub_80C47F4

	THUMB_FUNC_START sub_80C4878
sub_80C4878: @ 0x080C4878
	push {lr}
	adds r1, r0, #0
	ldr r0, _080C4888  @ gUnknown_08AA2084
	bl Proc_StartBlocking
	pop {r0}
	bx r0
	.align 2, 0
_080C4888: .4byte gUnknown_08AA2084

	THUMB_FUNC_END sub_80C4878

.align 2, 0
