	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	THUMB_FUNC_START sub_806E8F0
sub_806E8F0: @ 0x0806E8F0
	ldr r0, _0806E8FC  @ gpProcefxopCur
	movs r1, #0
	str r1, [r0]
	ldr r0, _0806E900  @ gUnknown_0203E1EC
	str r1, [r0]
	bx lr
	.align 2, 0
_0806E8FC: .4byte gpProcefxopCur
_0806E900: .4byte gUnknown_0203E1EC

	THUMB_FUNC_END sub_806E8F0

	THUMB_FUNC_START sub_806E904
sub_806E904: @ 0x0806E904
	push {r4, lr}
	ldr r4, _0806E91C  @ gpProcefxopCur
	ldr r0, [r4]
	cmp r0, #0
	beq _0806E916
	bl Proc_End
	movs r0, #0
	str r0, [r4]
_0806E916:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806E91C: .4byte gpProcefxopCur

	THUMB_FUNC_END sub_806E904

	THUMB_FUNC_START sub_806E920
sub_806E920: @ 0x0806E920
	push {r4, lr}
	ldr r4, _0806E938  @ gUnknown_0203E1EC
	ldr r0, [r4]
	cmp r0, #0
	beq _0806E932
	bl Proc_End
	movs r0, #0
	str r0, [r4]
_0806E932:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806E938: .4byte gUnknown_0203E1EC

	THUMB_FUNC_END sub_806E920

	THUMB_FUNC_START SetGlbProcefxopCur
SetGlbProcefxopCur: @ 0x0806E93C
	ldr r1, _0806E944  @ gpProcefxopCur
	str r0, [r1]
	bx lr
	.align 2, 0
_0806E944: .4byte gpProcefxopCur

	THUMB_FUNC_END SetGlbProcefxopCur

	THUMB_FUNC_START sub_806E948
sub_806E948: @ 0x0806E948
	ldr r1, _0806E950  @ gUnknown_0203E1EC
	str r0, [r1]
	bx lr
	.align 2, 0
_0806E950: .4byte gUnknown_0203E1EC

	THUMB_FUNC_END sub_806E948

	THUMB_FUNC_START sub_806E954
sub_806E954: @ 0x0806E954
	ldr r0, [r0, #0x44]
	ldr r0, [r0, #0x30]
	bx lr

	THUMB_FUNC_END sub_806E954

	THUMB_FUNC_START sub_806E95C
sub_806E95C: @ 0x0806E95C
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	bl GetAnimPosition
	cmp r0, #0
	bne _0806E978
	ldr r0, _0806E974  @ BanimTypesPosLeft
	ldrb r1, [r0]
	ldrh r0, [r4, #2]
	b _0806E97E
	.align 2, 0
_0806E974: .4byte BanimTypesPosLeft
_0806E978:
	ldr r0, _0806E9B0  @ BanimTypesPosRight
	ldrb r0, [r0]
	ldrh r1, [r4, #2]
_0806E97E:
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	ldrh r0, [r4, #4]
	movs r2, #0x58
	subs r2, r2, r0
	ldrh r0, [r5, #0x12]
	ldrh r3, [r5, #2]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	subs r1, r1, r3
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldrh r3, [r5, #4]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	subs r2, r2, r3
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	bl BG_SetPosition
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806E9B0: .4byte BanimTypesPosRight

	THUMB_FUNC_END sub_806E95C

	THUMB_FUNC_START sub_806E9B4
sub_806E9B4: @ 0x0806E9B4
	push {r4, lr}
	sub sp, #4
	bl sub_806E954
	adds r4, r0, #0
	movs r0, #0
	str r0, [sp]
	ldr r1, [r4, #0x14]
	ldr r2, _0806E9E0  @ 0x01000200
	mov r0, sp
	bl CpuFastSet
	movs r0, #1
	ldrh r4, [r4, #0x12]
	lsls r0, r4
	bl BG_EnableSyncByMask
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806E9E0: .4byte 0x01000200

	THUMB_FUNC_END sub_806E9B4

	THUMB_FUNC_START sub_806E9E4
sub_806E9E4: @ 0x0806E9E4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	adds r4, r1, #0
	adds r7, r2, #0
	adds r6, r3, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	bl sub_806E954
	mov r8, r0
	cmp r4, #0
	bne _0806EA04
	adds r0, r7, #0
	b _0806EA06
_0806EA04:
	adds r0, r6, #0
_0806EA06:
	movs r1, #0x78
	bl AnimCreate
	adds r2, r0, #0
	mov r1, r8
	ldrh r0, [r1, #0x10]
	lsls r0, r0, #0xc
	ldrh r1, [r1, #0xe]
	orrs r0, r1
	movs r3, #0x80
	lsls r3, r3, #4
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2, #8]
	ldrh r0, [r5, #2]
	strh r0, [r2, #2]
	ldrh r0, [r5, #4]
	strh r0, [r2, #4]
	adds r0, r2, #0
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_806E9E4

	THUMB_FUNC_START sub_806EA38
sub_806EA38: @ 0x0806EA38
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r6, r2, #0
	lsls r1, r1, #0x10
	lsrs r7, r1, #0x10
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	adds r5, r3, #0
	bl sub_806E954
	adds r4, r0, #0
	cmp r5, #1
	bne _0806EA5A
	ldr r1, [r4, #0x1c]
	adds r0, r6, #0
	bl LZ77UnCompWram
_0806EA5A:
	adds r2, r6, #0
	cmp r5, #1
	bne _0806EA62
	ldr r2, [r4, #0x1c]
_0806EA62:
	cmp r7, #0
	bne _0806EA7C
	ldr r1, [r4, #0x14]
	ldrh r0, [r4, #0xc]
	str r0, [sp]
	ldrh r0, [r4, #0xa]
	str r0, [sp, #4]
	adds r0, r2, #0
	movs r2, #0x1e
	movs r3, #0x14
	bl EfxTmCpyBgHFlip
	b _0806EA90
_0806EA7C:
	ldr r1, [r4, #0x14]
	ldrh r0, [r4, #0xc]
	str r0, [sp]
	ldrh r0, [r4, #0xa]
	str r0, [sp, #4]
	adds r0, r2, #0
	movs r2, #0x1e
	movs r3, #0x14
	bl EfxTmCpyBG
_0806EA90:
	movs r0, #1
	ldrh r4, [r4, #0x12]
	lsls r0, r4
	bl BG_EnableSyncByMask
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_806EA38

	THUMB_FUNC_START sub_806EAA4
sub_806EAA4: @ 0x0806EAA4
	push {r4, r5, r6, lr}
	adds r6, r1, #0
	bl sub_806E954
	adds r5, r0, #0
	ldrh r4, [r5, #0xa]
	lsls r4, r4, #5
	movs r0, #0xc0
	lsls r0, r0, #0x13
	adds r4, r4, r0
	ldr r1, [r5, #0x18]
	adds r0, r6, #0
	bl LZ77UnCompWram
	ldr r0, [r5, #0x18]
	movs r2, #0x80
	lsls r2, r2, #6
	adds r1, r4, #0
	bl RegisterDataMove
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_806EAA4

	THUMB_FUNC_START sub_806EAD4
sub_806EAD4: @ 0x0806EAD4
	push {r4, lr}
	adds r4, r1, #0
	bl sub_806E954
	ldrh r1, [r0, #0xc]
	lsls r1, r1, #5
	ldr r0, _0806EAF8  @ gPaletteBuffer
	adds r1, r1, r0
	adds r0, r4, #0
	movs r2, #8
	bl CpuFastSet
	bl EnablePaletteSync
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806EAF8: .4byte gPaletteBuffer

	THUMB_FUNC_END sub_806EAD4

	THUMB_FUNC_START sub_806EAFC
sub_806EAFC: @ 0x0806EAFC
	push {r4, r5, r6, lr}
	adds r6, r1, #0
	bl sub_806E954
	adds r5, r0, #0
	ldrh r4, [r5, #0xe]
	lsls r4, r4, #5
	ldr r0, _0806EB28  @ 0x06010000
	adds r4, r4, r0
	ldr r1, [r5, #0x20]
	adds r0, r6, #0
	bl LZ77UnCompWram
	ldr r0, [r5, #0x20]
	movs r2, #0x80
	lsls r2, r2, #5
	adds r1, r4, #0
	bl RegisterDataMove
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806EB28: .4byte 0x06010000

	THUMB_FUNC_END sub_806EAFC

	THUMB_FUNC_START sub_806EB2C
sub_806EB2C: @ 0x0806EB2C
	push {r4, lr}
	adds r4, r1, #0
	bl sub_806E954
	ldrh r1, [r0, #0x10]
	lsls r1, r1, #5
	ldr r0, _0806EB50  @ gPaletteBuffer+0x200
	adds r1, r1, r0
	adds r0, r4, #0
	movs r2, #8
	bl CpuFastSet
	bl EnablePaletteSync
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806EB50: .4byte gPaletteBuffer+0x200

	THUMB_FUNC_END sub_806EB2C

	THUMB_FUNC_START ExecEfxop
ExecEfxop: @ 0x0806EB54
	push {r4, lr}
	adds r4, r0, #0
	bl sub_806E954
	ldr r1, _0806EB74  @ gpEfxopFuncLut
	ldrh r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	adds r0, r4, #0
	bl _call_via_r1
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806EB74: .4byte gpEfxopFuncLut

	THUMB_FUNC_END ExecEfxop

	THUMB_FUNC_START nullsub_73
nullsub_73: @ 0x0806EB78
	bx lr

	THUMB_FUNC_END nullsub_73

	THUMB_FUNC_START NewEfxopFire
NewEfxopFire: @ 0x0806EB7C
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, _0806EB98  @ ProcScr_efxopFire
	movs r1, #3
	bl Proc_Start
	adds r5, r0, #0
	bl SetGlbProcefxopCur
	str r4, [r5, #0x5c]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806EB98: .4byte ProcScr_efxopFire

	THUMB_FUNC_END NewEfxopFire

	THUMB_FUNC_START sub_806EB9C
sub_806EB9C: @ 0x0806EB9C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	adds r1, r4, #0
	bl NewEfxopFireBG
	ldr r0, [r4, #0x5c]
	adds r1, r4, #0
	bl NewEfxopFireOBJ
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_806EB9C

	THUMB_FUNC_START NewEfxopFireBG
NewEfxopFireBG: @ 0x0806EBBC
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	bl sub_806E954
	adds r6, r0, #0
	ldr r0, _0806EC08  @ ProcScr_efxopFireBG
	adds r1, r4, #0
	bl Proc_Start
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	str r0, [r4, #0x44]
	ldr r0, _0806EC0C  @ gUnknown_080DF644
	str r0, [r4, #0x48]
	ldr r0, _0806EC10  @ gUnknown_085D9494
	str r0, [r4, #0x4c]
	ldr r1, _0806EC14  @ gUnknown_085F6230
	adds r0, r5, #0
	bl sub_806EAD4
	ldr r0, [r4, #0x5c]
	ldr r1, _0806EC18  @ gUnknown_085F5638
	bl sub_806EAA4
	ldr r0, [r6, #0x24]
	bl _call_via_r0
	ldr r0, [r4, #0x5c]
	adds r1, r6, #0
	bl sub_806E95C
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806EC08: .4byte ProcScr_efxopFireBG
_0806EC0C: .4byte gUnknown_080DF644
_0806EC10: .4byte gUnknown_085D9494
_0806EC14: .4byte gUnknown_085F6230
_0806EC18: .4byte gUnknown_085F5638

	THUMB_FUNC_END NewEfxopFireBG

	THUMB_FUNC_START sub_806EC1C
sub_806EC1C: @ 0x0806EC1C
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl EfxAdvanceFrameLut
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	cmp r1, #0
	blt _0806EC48
	ldr r2, [r4, #0x4c]
	ldr r0, [r4, #0x5c]
	lsls r1, r1, #2
	adds r1, r1, r2
	ldr r2, [r1]
	movs r1, #1
	movs r3, #1
	bl sub_806EA38
	b _0806EC60
_0806EC48:
	movs r0, #1
	negs r0, r0
	cmp r1, r0
	bne _0806EC60
	ldr r0, [r4, #0x5c]
	bl sub_806E9B4
	bl SetDefaultColorEffects_
	adds r0, r4, #0
	bl Proc_Break
_0806EC60:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_806EC1C

	THUMB_FUNC_START NewEfxopFireOBJ
NewEfxopFireOBJ: @ 0x0806EC68
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	bl sub_806E954
	adds r7, r0, #0
	ldr r0, _0806ECA4  @ ProcScr_efxopFireOBJ
	adds r1, r4, #0
	bl Proc_Start
	adds r6, r0, #0
	str r5, [r6, #0x5c]
	movs r0, #0
	strh r0, [r6, #0x2c]
	ldr r2, _0806ECA8  @ gUnknown_085F843C
	ldr r3, _0806ECAC  @ gUnknown_085F80B4
	adds r0, r5, #0
	movs r1, #1
	bl sub_806E9E4
	adds r4, r0, #0
	str r4, [r6, #0x60]
	adds r0, r5, #0
	bl GetAnimPosition
	cmp r0, #0
	bne _0806ECB0
	ldrh r0, [r5, #2]
	subs r0, #8
	b _0806ECB4
	.align 2, 0
_0806ECA4: .4byte ProcScr_efxopFireOBJ
_0806ECA8: .4byte gUnknown_085F843C
_0806ECAC: .4byte gUnknown_085F80B4
_0806ECB0:
	ldrh r0, [r5, #2]
	adds r0, #8
_0806ECB4:
	strh r0, [r4, #2]
	ldrh r1, [r5, #4]
	adds r1, #8
	strh r1, [r4, #4]
	ldrh r0, [r7, #6]
	ldrh r2, [r4, #2]
	adds r0, r0, r2
	strh r0, [r4, #2]
	ldrh r0, [r7, #8]
	adds r1, r1, r0
	strh r1, [r4, #4]
	ldr r0, [r6, #0x5c]
	ldr r1, _0806ECE0  @ gUnknown_085F7D64
	bl sub_806EB2C
	ldr r0, [r6, #0x5c]
	ldr r1, _0806ECE4  @ gUnknown_085F7768
	bl sub_806EAFC
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806ECE0: .4byte gUnknown_085F7D64
_0806ECE4: .4byte gUnknown_085F7768

	THUMB_FUNC_END NewEfxopFireOBJ

	THUMB_FUNC_START sub_806ECE8
sub_806ECE8: @ 0x0806ECE8
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x32
	ble _0806ED06
	ldr r0, [r4, #0x60]
	bl AnimDelete
	adds r0, r4, #0
	bl Proc_Break
_0806ED06:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_806ECE8

	THUMB_FUNC_START NewEfxopThunder
NewEfxopThunder: @ 0x0806ED0C
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, _0806ED28  @ ProcScr_efxopThunder
	movs r1, #3
	bl Proc_Start
	adds r5, r0, #0
	bl SetGlbProcefxopCur
	str r4, [r5, #0x5c]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806ED28: .4byte ProcScr_efxopThunder

	THUMB_FUNC_END NewEfxopThunder

	THUMB_FUNC_START sub_806ED2C
sub_806ED2C: @ 0x0806ED2C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	adds r1, r4, #0
	bl sub_806ED54
	ldr r0, [r4, #0x5c]
	adds r1, r4, #0
	bl sub_806EE34
	ldr r0, [r4, #0x5c]
	adds r1, r4, #0
	bl sub_806EEA8
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_806ED2C

	THUMB_FUNC_START sub_806ED54
sub_806ED54: @ 0x0806ED54
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	bl sub_806E954
	adds r6, r0, #0
	ldr r0, _0806ED9C  @ ProcScr_efxopThunderBG
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	str r0, [r4, #0x44]
	ldr r0, _0806EDA0  @ gUnknown_080DF6A8
	str r0, [r4, #0x48]
	ldr r0, _0806EDA4  @ gUnknown_085D951C
	str r0, [r4, #0x4c]
	ldr r1, _0806EDA8  @ gUnknown_085F367C
	adds r0, r5, #0
	bl sub_806EAD4
	ldr r0, [r4, #0x5c]
	ldr r1, _0806EDAC  @ gUnknown_085F2DC0
	bl sub_806EAA4
	ldr r0, [r6, #0x24]
	bl _call_via_r0
	ldr r0, [r4, #0x5c]
	adds r1, r6, #0
	bl sub_806E95C
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806ED9C: .4byte ProcScr_efxopThunderBG
_0806EDA0: .4byte gUnknown_080DF6A8
_0806EDA4: .4byte gUnknown_085D951C
_0806EDA8: .4byte gUnknown_085F367C
_0806EDAC: .4byte gUnknown_085F2DC0

	THUMB_FUNC_END sub_806ED54

	THUMB_FUNC_START sub_806EDB0
sub_806EDB0: @ 0x0806EDB0
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r4, r0, #0
	movs r7, #0
	ldr r0, [r4, #0x5c]
	bl sub_806E954
	adds r6, r0, #0
	adds r0, r4, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl EfxAdvanceFrameLut
	lsls r0, r0, #0x10
	asrs r5, r0, #0x10
	cmp r5, #0
	blt _0806EE12
	ldr r2, [r4, #0x4c]
	ldr r0, [r4, #0x5c]
	lsls r1, r5, #2
	adds r1, r1, r2
	ldr r2, [r1]
	movs r1, #0
	movs r3, #1
	bl sub_806EA38
	cmp r5, #0
	bne _0806EDF4
	ldrh r0, [r6, #0xa]
	adds r0, #0x1f
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
_0806EDF4:
	cmp r5, #1
	bne _0806EE00
	ldrh r0, [r6, #0xa]
	adds r0, #0x50
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
_0806EE00:
	ldr r0, [r6, #0x14]
	adds r0, #0x3c
	ldrh r3, [r6, #0xc]
	str r7, [sp]
	movs r1, #2
	movs r2, #0x14
	bl FillBGRect
	b _0806EE2A
_0806EE12:
	movs r0, #1
	negs r0, r0
	cmp r5, r0
	bne _0806EE2A
	ldr r0, [r4, #0x5c]
	bl sub_806E9B4
	bl SetDefaultColorEffects_
	adds r0, r4, #0
	bl Proc_Break
_0806EE2A:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_806EDB0

	THUMB_FUNC_START sub_806EE34
sub_806EE34: @ 0x0806EE34
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _0806EE5C  @ ProcScr_efxopThunderBGCOL
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	bl sub_806E948
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	str r0, [r4, #0x44]
	ldr r0, _0806EE60  @ gUnknown_080DF6C6
	str r0, [r4, #0x48]
	ldr r0, _0806EE64  @ gUnknown_085F367C
	str r0, [r4, #0x4c]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806EE5C: .4byte ProcScr_efxopThunderBGCOL
_0806EE60: .4byte gUnknown_080DF6C6
_0806EE64: .4byte gUnknown_085F367C

	THUMB_FUNC_END sub_806EE34

	THUMB_FUNC_START sub_806EE68
sub_806EE68: @ 0x0806EE68
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl EfxAdvanceFrameLut
	lsls r0, r0, #0x10
	asrs r2, r0, #0x10
	cmp r2, #0
	blt _0806EE8E
	ldr r1, [r4, #0x4c]
	ldr r0, [r4, #0x5c]
	lsls r2, r2, #5
	adds r1, r1, r2
	bl sub_806EAD4
	b _0806EEA0
_0806EE8E:
	movs r0, #1
	negs r0, r0
	cmp r2, r0
	bne _0806EEA0
	bl sub_806E920
	adds r0, r4, #0
	bl Proc_Break
_0806EEA0:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_806EE68

	THUMB_FUNC_START sub_806EEA8
sub_806EEA8: @ 0x0806EEA8
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	bl sub_806E954
	adds r7, r0, #0
	ldr r0, _0806EEE4  @ ProcScr_efxopThunderOBJ
	movs r1, #3
	bl Proc_Start
	adds r6, r0, #0
	str r5, [r6, #0x5c]
	movs r0, #0
	strh r0, [r6, #0x2c]
	ldr r2, _0806EEE8  @ gUnknown_085F5550
	ldr r3, _0806EEEC  @ gUnknown_085F4A24
	adds r0, r5, #0
	movs r1, #1
	bl sub_806E9E4
	adds r4, r0, #0
	str r4, [r6, #0x60]
	adds r0, r5, #0
	bl GetAnimPosition
	cmp r0, #0
	bne _0806EEF0
	ldrh r0, [r5, #2]
	adds r0, #0x38
	b _0806EEF4
	.align 2, 0
_0806EEE4: .4byte ProcScr_efxopThunderOBJ
_0806EEE8: .4byte gUnknown_085F5550
_0806EEEC: .4byte gUnknown_085F4A24
_0806EEF0:
	ldrh r0, [r5, #2]
	subs r0, #0x38
_0806EEF4:
	strh r0, [r4, #2]
	ldrh r0, [r7, #6]
	ldrh r1, [r4, #2]
	adds r0, r0, r1
	strh r0, [r4, #2]
	ldrh r0, [r7, #8]
	ldrh r1, [r4, #4]
	adds r0, r0, r1
	strh r0, [r4, #4]
	ldr r0, [r6, #0x5c]
	ldr r1, _0806EF1C  @ Pal_BoltingSprites
	bl sub_806EB2C
	ldr r0, [r6, #0x5c]
	ldr r1, _0806EF20  @ Img_BoltingSprites
	bl sub_806EAFC
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806EF1C: .4byte Pal_BoltingSprites
_0806EF20: .4byte Img_BoltingSprites

	THUMB_FUNC_END sub_806EEA8

	THUMB_FUNC_START sub_806EF24
sub_806EF24: @ 0x0806EF24
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x32
	ble _0806EF42
	ldr r0, [r4, #0x60]
	bl AnimDelete
	adds r0, r4, #0
	bl Proc_Break
_0806EF42:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_806EF24

	THUMB_FUNC_START NewEfxopLive
NewEfxopLive: @ 0x0806EF48
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0806EF60  @ ProcScr_efxopLive
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806EF60: .4byte ProcScr_efxopLive

	THUMB_FUNC_END NewEfxopLive

	THUMB_FUNC_START sub_806EF64
sub_806EF64: @ 0x0806EF64
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	adds r1, r4, #0
	bl sub_806F184
	ldr r0, [r4, #0x5c]
	adds r1, r4, #0
	bl sub_806EFB8
	ldr r0, [r4, #0x5c]
	adds r1, r4, #0
	bl sub_806F058
	movs r0, #1
	movs r1, #0
	movs r2, #0x10
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	ldr r0, [r4, #0x5c]
	str r4, [sp]
	movs r1, #1
	movs r2, #0xc
	movs r3, #0
	bl sub_806F0CC
	ldr r0, [r4, #0x5c]
	str r4, [sp]
	movs r1, #0x23
	movs r2, #0x19
	movs r3, #1
	bl sub_806F0CC
	adds r0, r4, #0
	bl Proc_Break
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_806EF64

	THUMB_FUNC_START sub_806EFB8
sub_806EFB8: @ 0x0806EFB8
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	bl sub_806E954
	adds r6, r0, #0
	ldr r0, _0806EFFC  @ ProcScr_efxopLiveBG
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	bl SetGlbProcefxopCur
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	str r0, [r4, #0x44]
	ldr r0, _0806F000  @ gUnknown_080DF730
	str r0, [r4, #0x48]
	ldr r0, _0806F004  @ gUnknown_085D959C
	str r0, [r4, #0x4c]
	ldr r1, _0806F008  @ gUnknown_0866F5E4
	adds r0, r5, #0
	bl sub_806EAA4
	ldr r0, [r6, #0x24]
	bl _call_via_r0
	ldr r0, [r4, #0x5c]
	adds r1, r6, #0
	bl sub_806E95C
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806EFFC: .4byte ProcScr_efxopLiveBG
_0806F000: .4byte gUnknown_080DF730
_0806F004: .4byte gUnknown_085D959C
_0806F008: .4byte gUnknown_0866F5E4

	THUMB_FUNC_END sub_806EFB8

	THUMB_FUNC_START sub_806F00C
sub_806F00C: @ 0x0806F00C
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl EfxAdvanceFrameLut
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	cmp r1, #0
	blt _0806F038
	ldr r2, [r4, #0x4c]
	ldr r0, [r4, #0x5c]
	lsls r1, r1, #2
	adds r1, r1, r2
	ldr r2, [r1]
	movs r1, #1
	movs r3, #0
	bl sub_806EA38
	b _0806F050
_0806F038:
	movs r0, #1
	negs r0, r0
	cmp r1, r0
	bne _0806F050
	ldr r0, [r4, #0x5c]
	bl sub_806E9B4
	bl SetDefaultColorEffects_
	adds r0, r4, #0
	bl Proc_Break
_0806F050:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_806F00C

	THUMB_FUNC_START sub_806F058
sub_806F058: @ 0x0806F058
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _0806F080  @ ProcScr_efxopLiveBGCOL
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	bl sub_806E948
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	str r0, [r4, #0x44]
	ldr r0, _0806F084  @ gUnknown_080DF748
	str r0, [r4, #0x48]
	ldr r0, _0806F088  @ gUnknown_086700D4
	str r0, [r4, #0x4c]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806F080: .4byte ProcScr_efxopLiveBGCOL
_0806F084: .4byte gUnknown_080DF748
_0806F088: .4byte gUnknown_086700D4

	THUMB_FUNC_END sub_806F058

	THUMB_FUNC_START sub_806F08C
sub_806F08C: @ 0x0806F08C
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl EfxAdvanceFrameLut
	lsls r0, r0, #0x10
	asrs r2, r0, #0x10
	cmp r2, #0
	blt _0806F0B2
	ldr r1, [r4, #0x4c]
	ldr r0, [r4, #0x5c]
	lsls r2, r2, #5
	adds r1, r1, r2
	bl sub_806EAD4
	b _0806F0C4
_0806F0B2:
	movs r0, #1
	negs r0, r0
	cmp r2, r0
	bne _0806F0C4
	bl sub_806E920
	adds r0, r4, #0
	bl Proc_Break
_0806F0C4:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_806F08C

	THUMB_FUNC_START sub_806F0CC
sub_806F0CC: @ 0x0806F0CC
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	mov r8, r3
	ldr r0, _0806F0F8  @ ProcScr_efxopLiveALPHA
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	strh r5, [r0, #0x2c]
	strh r6, [r0, #0x2e]
	adds r0, #0x29
	mov r1, r8
	strb r1, [r0]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806F0F8: .4byte ProcScr_efxopLiveALPHA

	THUMB_FUNC_END sub_806F0CC

	THUMB_FUNC_START sub_806F0FC
sub_806F0FC: @ 0x0806F0FC
	push {lr}
	adds r1, r0, #0
	ldrh r0, [r1, #0x2c]
	subs r0, #1
	strh r0, [r1, #0x2c]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _0806F112
	adds r0, r1, #0
	bl Proc_Break
_0806F112:
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_806F0FC

	THUMB_FUNC_START sub_806F118
sub_806F118: @ 0x0806F118
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	movs r0, #0x2c
	ldrsh r1, [r4, r0]
	movs r2, #0x2e
	ldrsh r0, [r4, r2]
	cmp r1, r0
	ble _0806F132
	adds r0, r4, #0
	bl Proc_Break
	b _0806F17A
_0806F132:
	adds r0, r4, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #0
	bne _0806F152
	movs r0, #0x2c
	ldrsh r3, [r4, r0]
	movs r1, #0x2e
	ldrsh r0, [r4, r1]
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0x10
	bl Interpolate
	b _0806F166
_0806F152:
	movs r2, #0x2c
	ldrsh r3, [r4, r2]
	movs r1, #0x2e
	ldrsh r0, [r4, r1]
	str r0, [sp]
	movs r0, #0
	movs r1, #0x10
	movs r2, #0
	bl Interpolate
_0806F166:
	lsls r1, r0, #0x18
	lsrs r1, r1, #0x18
	movs r0, #1
	movs r2, #0x10
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
_0806F17A:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_806F118

	THUMB_FUNC_START sub_806F184
sub_806F184: @ 0x0806F184
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	bl sub_806E954
	adds r6, r0, #0
	ldr r0, _0806F1D8  @ ProcScr_efxopLiveOBJ
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	movs r0, #0x33
	strh r0, [r4, #0x2e]
	ldr r3, _0806F1DC  @ gUnknown_08675114
	adds r0, r5, #0
	movs r1, #1
	adds r2, r3, #0
	bl sub_806E9E4
	str r0, [r4, #0x60]
	ldrh r1, [r6, #6]
	ldrh r2, [r0, #2]
	adds r1, r1, r2
	strh r1, [r0, #2]
	ldrh r1, [r6, #8]
	ldrh r2, [r0, #4]
	adds r1, r1, r2
	strh r1, [r0, #4]
	ldr r0, [r4, #0x5c]
	ldr r1, _0806F1E0  @ Pal_FimbulvetrSprites_Snow
	bl sub_806EB2C
	ldr r0, [r4, #0x5c]
	ldr r1, _0806F1E4  @ gUnknown_086702D4
	bl sub_806EAFC
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806F1D8: .4byte ProcScr_efxopLiveOBJ
_0806F1DC: .4byte gUnknown_08675114
_0806F1E0: .4byte Pal_FimbulvetrSprites_Snow
_0806F1E4: .4byte gUnknown_086702D4

	THUMB_FUNC_END sub_806F184

	THUMB_FUNC_START sub_806F1E8
sub_806F1E8: @ 0x0806F1E8
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
	bne _0806F20A
	ldr r0, [r4, #0x60]
	bl AnimDelete
	adds r0, r4, #0
	bl Proc_Break
_0806F20A:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_806F1E8

	THUMB_FUNC_START NewEfxopLightning
NewEfxopLightning: @ 0x0806F210
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, _0806F22C  @ ProcScr_efxopLightning
	movs r1, #3
	bl Proc_Start
	adds r5, r0, #0
	bl SetGlbProcefxopCur
	str r4, [r5, #0x5c]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806F22C: .4byte ProcScr_efxopLightning

	THUMB_FUNC_END NewEfxopLightning

	THUMB_FUNC_START sub_806F230
sub_806F230: @ 0x0806F230
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	adds r1, r4, #0
	bl sub_806F248
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_806F230

	THUMB_FUNC_START sub_806F248
sub_806F248: @ 0x0806F248
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	bl sub_806E954
	adds r6, r0, #0
	ldr r0, _0806F28C  @ ProcScr_efxopLightningBG
	adds r1, r4, #0
	bl Proc_Start
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	str r0, [r4, #0x44]
	ldr r0, _0806F290  @ gUnknown_080DF7CE
	str r0, [r4, #0x48]
	ldr r0, _0806F294  @ gUnknown_085D9740
	str r0, [r4, #0x4c]
	str r0, [r4, #0x50]
	ldr r0, _0806F298  @ gUnknown_085D9638
	str r0, [r4, #0x54]
	ldr r0, _0806F29C  @ gUnknown_085D96BC
	str r0, [r4, #0x58]
	ldr r0, [r6, #0x24]
	bl _call_via_r0
	ldr r0, [r4, #0x5c]
	adds r1, r6, #0
	bl sub_806E95C
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806F28C: .4byte ProcScr_efxopLightningBG
_0806F290: .4byte gUnknown_080DF7CE
_0806F294: .4byte gUnknown_085D9740
_0806F298: .4byte gUnknown_085D9638
_0806F29C: .4byte gUnknown_085D96BC

	THUMB_FUNC_END sub_806F248

	THUMB_FUNC_START sub_806F2A0
sub_806F2A0: @ 0x0806F2A0
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r0, #0x2c
	adds r1, r7, #0
	adds r1, #0x44
	ldr r2, [r7, #0x48]
	bl EfxAdvanceFrameLut
	lsls r0, r0, #0x10
	asrs r4, r0, #0x10
	cmp r4, #0
	blt _0806F2E4
	ldr r6, [r7, #0x4c]
	ldr r1, [r7, #0x54]
	ldr r5, [r7, #0x58]
	ldr r0, [r7, #0x5c]
	lsls r4, r4, #2
	adds r1, r4, r1
	ldr r1, [r1]
	bl sub_806EAA4
	ldr r0, [r7, #0x5c]
	adds r5, r4, r5
	ldr r1, [r5]
	bl sub_806EAD4
	ldr r0, [r7, #0x5c]
	adds r4, r4, r6
	ldr r2, [r4]
	movs r1, #0
	movs r3, #1
	bl sub_806EA38
	b _0806F2FC
_0806F2E4:
	movs r0, #1
	negs r0, r0
	cmp r4, r0
	bne _0806F2FC
	ldr r0, [r7, #0x5c]
	bl sub_806E9B4
	bl SetDefaultColorEffects_
	adds r0, r7, #0
	bl Proc_Break
_0806F2FC:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_806F2A0

	THUMB_FUNC_START sub_806F304
sub_806F304: @ 0x0806F304
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	bl sub_806E954
	adds r6, r0, #0
	ldr r0, _0806F34C  @ gUnknown_085D97C4
	adds r1, r5, #0
	bl Proc_Start
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	movs r1, #0
	strh r1, [r5, #0x2c]
	str r1, [r5, #0x44]
	ldr r0, _0806F350  @ gUnknown_080DF866
	str r0, [r5, #0x48]
	ldr r0, _0806F354  @ gUnknown_085D97DC
	str r0, [r5, #0x4c]
	str r0, [r5, #0x50]
	ldr r0, _0806F358  @ gUnknown_085D9880
	str r0, [r5, #0x54]
	strh r1, [r5, #0x2e]
	ldr r1, _0806F35C  @ gUnknown_0862A2D0
	adds r0, r4, #0
	bl sub_806EAD4
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _0806F364
	ldr r1, _0806F360  @ gLCDControlBuffer
	ldrh r0, [r1, #0x20]
	adds r0, #4
	b _0806F36A
	.align 2, 0
_0806F34C: .4byte gUnknown_085D97C4
_0806F350: .4byte gUnknown_080DF866
_0806F354: .4byte gUnknown_085D97DC
_0806F358: .4byte gUnknown_085D9880
_0806F35C: .4byte gUnknown_0862A2D0
_0806F360: .4byte gLCDControlBuffer
_0806F364:
	ldr r1, _0806F388  @ gLCDControlBuffer
	ldrh r0, [r1, #0x20]
	subs r0, #4
_0806F36A:
	strh r0, [r1, #0x20]
	ldrh r0, [r1, #0x22]
	adds r0, #8
	strh r0, [r1, #0x22]
	ldr r0, [r6, #0x24]
	bl _call_via_r0
	ldr r0, [r5, #0x5c]
	adds r1, r6, #0
	bl sub_806E95C
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806F388: .4byte gLCDControlBuffer

	THUMB_FUNC_END sub_806F304

	THUMB_FUNC_START sub_806F38C
sub_806F38C: @ 0x0806F38C
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	bl sub_806E954
	adds r6, r0, #0
	ldr r0, _0806F3E4  @ gUnknown_085D97C4
	adds r1, r4, #0
	bl Proc_Start
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	str r0, [r4, #0x44]
	ldr r0, _0806F3E8  @ gUnknown_080DF898
	str r0, [r4, #0x48]
	ldr r0, _0806F3EC  @ gUnknown_085D97DC
	str r0, [r4, #0x4c]
	str r0, [r4, #0x50]
	ldr r0, _0806F3F0  @ gUnknown_085D9880
	str r0, [r4, #0x54]
	movs r0, #1
	strh r0, [r4, #0x2e]
	ldr r1, _0806F3F4  @ gUnknown_0862A2F0
	adds r0, r5, #0
	bl sub_806EAD4
	ldr r0, [r6, #0x24]
	bl _call_via_r0
	ldr r0, [r4, #0x5c]
	adds r1, r6, #0
	bl sub_806E95C
	movs r0, #1
	movs r1, #0xa
	movs r2, #7
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806F3E4: .4byte gUnknown_085D97C4
_0806F3E8: .4byte gUnknown_080DF898
_0806F3EC: .4byte gUnknown_085D97DC
_0806F3F0: .4byte gUnknown_085D9880
_0806F3F4: .4byte gUnknown_0862A2F0

	THUMB_FUNC_END sub_806F38C

	THUMB_FUNC_START sub_806F3F8
sub_806F3F8: @ 0x0806F3F8
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r0, #0x2c
	adds r1, r6, #0
	adds r1, #0x44
	ldr r2, [r6, #0x48]
	bl EfxAdvanceFrameLut
	lsls r0, r0, #0x10
	asrs r4, r0, #0x10
	cmp r4, #0
	blt _0806F430
	ldr r5, [r6, #0x4c]
	ldr r1, [r6, #0x54]
	ldr r0, [r6, #0x5c]
	lsls r4, r4, #2
	adds r1, r4, r1
	ldr r1, [r1]
	bl sub_806EAA4
	ldr r0, [r6, #0x5c]
	ldrh r1, [r6, #0x2e]
	adds r4, r4, r5
	ldr r2, [r4]
	movs r3, #1
	bl sub_806EA38
	b _0806F448
_0806F430:
	movs r0, #1
	negs r0, r0
	cmp r4, r0
	bne _0806F448
	ldr r0, [r6, #0x5c]
	bl sub_806E9B4
	bl SetDefaultColorEffects_
	adds r0, r6, #0
	bl Proc_Break
_0806F448:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_806F3F8

	THUMB_FUNC_START sub_806F450
sub_806F450: @ 0x0806F450
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, _0806F474  @ gUnknown_085D9924
	bl Proc_Start
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	ldr r3, _0806F478  @ FramScr_Unk5D4F90
	adds r0, r4, #0
	movs r1, #1
	adds r2, r3, #0
	bl sub_806E9E4
	str r0, [r5, #0x60]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806F474: .4byte gUnknown_085D9924
_0806F478: .4byte FramScr_Unk5D4F90

	THUMB_FUNC_END sub_806F450

	THUMB_FUNC_START sub_806F47C
sub_806F47C: @ 0x0806F47C
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _0806F4AC  @ gUnknown_085D996C
	bl Proc_Start
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	ldr r3, _0806F4B0  @ FramScr_Unk5D4F90
	adds r0, r5, #0
	movs r1, #0
	adds r2, r3, #0
	bl sub_806E9E4
	str r0, [r4, #0x60]
	ldrh r1, [r0, #2]
	subs r1, #0x38
	strh r1, [r0, #2]
	ldrh r1, [r0, #4]
	subs r1, #4
	strh r1, [r0, #4]
	adds r0, r4, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0806F4AC: .4byte gUnknown_085D996C
_0806F4B0: .4byte FramScr_Unk5D4F90

	THUMB_FUNC_END sub_806F47C

	THUMB_FUNC_START sub_806F4B4
sub_806F4B4: @ 0x0806F4B4
	push {lr}
	ldr r0, [r0, #0x60]
	bl AnimDelete
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_806F4B4

	THUMB_FUNC_START sub_806F4C0
sub_806F4C0: @ 0x0806F4C0
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x60]
	ldr r0, _0806F4EC  @ gUnknown_0862D6A8
	str r0, [r1, #0x24]
	str r0, [r1, #0x20]
	movs r0, #0
	strh r0, [r1, #6]
	ldr r0, [r4, #0x5c]
	ldr r1, _0806F4F0  @ Pal_FluxAnimSprites
	bl sub_806EB2C
	ldr r0, [r4, #0x5c]
	ldr r1, _0806F4F4  @ Img_FluxAnimSprites_Orb
	bl sub_806EAFC
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806F4EC: .4byte gUnknown_0862D6A8
_0806F4F0: .4byte Pal_FluxAnimSprites
_0806F4F4: .4byte Img_FluxAnimSprites_Orb

	THUMB_FUNC_END sub_806F4C0

	THUMB_FUNC_START sub_806F4F8
sub_806F4F8: @ 0x0806F4F8
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x60]
	ldr r0, _0806F524  @ gUnknown_0862D82C
	str r0, [r1, #0x24]
	str r0, [r1, #0x20]
	movs r0, #0
	strh r0, [r1, #6]
	ldr r0, [r4, #0x5c]
	ldr r1, _0806F528  @ Pal_FluxAnimSprites
	bl sub_806EB2C
	ldr r0, [r4, #0x5c]
	ldr r1, _0806F52C  @ Img_FluxAnimSprites_Tendrils
	bl sub_806EAFC
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806F524: .4byte gUnknown_0862D82C
_0806F528: .4byte Pal_FluxAnimSprites
_0806F52C: .4byte Img_FluxAnimSprites_Tendrils

	THUMB_FUNC_END sub_806F4F8

	THUMB_FUNC_START sub_806F530
sub_806F530: @ 0x0806F530
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x60]
	ldr r0, _0806F55C  @ gUnknown_0862DCE0
	str r0, [r1, #0x24]
	str r0, [r1, #0x20]
	movs r0, #0
	strh r0, [r1, #6]
	ldr r0, [r4, #0x5c]
	ldr r1, _0806F560  @ Pal_FluxAnimSprites
	bl sub_806EB2C
	ldr r0, [r4, #0x5c]
	ldr r1, _0806F564  @ Img_FluxAnimSprites_SigilVoid
	bl sub_806EAFC
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806F55C: .4byte gUnknown_0862DCE0
_0806F560: .4byte Pal_FluxAnimSprites
_0806F564: .4byte Img_FluxAnimSprites_SigilVoid

	THUMB_FUNC_END sub_806F530

	THUMB_FUNC_START sub_806F568
sub_806F568: @ 0x0806F568
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x60]
	ldr r0, _0806F590  @ gUnknown_0862DC24
	str r0, [r1, #0x24]
	str r0, [r1, #0x20]
	movs r0, #0
	strh r0, [r1, #6]
	movs r0, #0x14
	strh r0, [r1, #0xa]
	bl AnimSort
	movs r0, #0x27
	strh r0, [r4, #0x2c]
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806F590: .4byte gUnknown_0862DC24

	THUMB_FUNC_END sub_806F568

	THUMB_FUNC_START sub_806F594
sub_806F594: @ 0x0806F594
	push {lr}
	adds r1, r0, #0
	ldr r2, [r1, #0x60]
	ldrh r0, [r1, #0x2c]
	adds r0, #1
	movs r3, #0
	strh r0, [r1, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x28
	bne _0806F5B4
	ldr r0, _0806F5B8  @ gUnknown_0862DC58
	str r0, [r2, #0x24]
	str r0, [r2, #0x20]
	strh r3, [r2, #6]
	strh r3, [r1, #0x2c]
_0806F5B4:
	pop {r0}
	bx r0
	.align 2, 0
_0806F5B8: .4byte gUnknown_0862DC58

	THUMB_FUNC_END sub_806F594

	THUMB_FUNC_START NewEfxopMistyrain
NewEfxopMistyrain: @ 0x0806F5BC
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _0806F5DC  @ ProcScr_efxopMistyrain
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	bl SetGlbProcefxopCur
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806F5DC: .4byte ProcScr_efxopMistyrain

	THUMB_FUNC_END NewEfxopMistyrain

	THUMB_FUNC_START sub_806F5E0
sub_806F5E0: @ 0x0806F5E0
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _0806F5FA
	ldr r0, [r4, #0x5c]
	adds r1, r4, #0
	bl sub_806F304
_0806F5FA:
	movs r1, #0x2c
	ldrsh r0, [r4, r1]
	cmp r0, #0x10
	bne _0806F60A
	ldr r0, [r4, #0x5c]
	adds r1, r4, #0
	bl sub_806F450
_0806F60A:
	movs r1, #0x2c
	ldrsh r0, [r4, r1]
	cmp r0, #0x4b
	bne _0806F61C
	ldr r0, [r4, #0x5c]
	adds r1, r4, #0
	bl sub_806F47C
	str r0, [r4, #0x64]
_0806F61C:
	movs r1, #0x2c
	ldrsh r0, [r4, r1]
	cmp r0, #0x5e
	bne _0806F62C
	ldr r0, [r4, #0x5c]
	adds r1, r4, #0
	bl sub_806F38C
_0806F62C:
	movs r1, #0x2c
	ldrsh r0, [r4, r1]
	cmp r0, #0x72
	bne _0806F640
	ldr r0, [r4, #0x64]
	bl Proc_End
	adds r0, r4, #0
	bl Proc_Break
_0806F640:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_806F5E0

	THUMB_FUNC_START NewEfxopMyrrh
NewEfxopMyrrh: @ 0x0806F648
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, _0806F664  @ ProcScr_efxopMyrrh
	movs r1, #3
	bl Proc_Start
	adds r5, r0, #0
	bl SetGlbProcefxopCur
	str r4, [r5, #0x5c]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806F664: .4byte ProcScr_efxopMyrrh

	THUMB_FUNC_END NewEfxopMyrrh

	THUMB_FUNC_START sub_806F668
sub_806F668: @ 0x0806F668
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r0, _0806F6A8  @ banim_data
	movs r1, #0xc4
	lsls r1, r1, #5
	adds r0, r0, r1
	ldr r0, [r0, #0x1c]
	ldr r5, _0806F6AC  @ gPalBackupEkrUnitMaybe
	adds r1, r5, #0
	bl LZ77UnCompWram
	adds r5, #0x20
	ldr r4, _0806F6B0  @ gPaletteBuffer + 0x240
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #8
	bl CpuFastSet
	adds r4, #0x20
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #8
	bl CpuFastSet
	bl EnablePaletteSync
	adds r0, r6, #0
	bl Proc_Break
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806F6A8: .4byte banim_data
_0806F6AC: .4byte gPalBackupEkrUnitMaybe
_0806F6B0: .4byte gPaletteBuffer + 0x240

	THUMB_FUNC_END sub_806F668

	THUMB_FUNC_START sub_806F6B4
sub_806F6B4: @ 0x0806F6B4
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, _0806F6D0  @ gUnknown_085D99EC
	movs r1, #3
	bl Proc_Start
	adds r5, r0, #0
	bl SetGlbProcefxopCur
	str r4, [r5, #0x5c]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806F6D0: .4byte gUnknown_085D99EC

	THUMB_FUNC_END sub_806F6B4

	THUMB_FUNC_START sub_806F6D4
sub_806F6D4: @ 0x0806F6D4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	adds r1, r4, #0
	bl sub_806F7C0
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_806F6D4

	THUMB_FUNC_START sub_806F6EC
sub_806F6EC: @ 0x0806F6EC
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	adds r1, r4, #0
	bl sub_806F704
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_806F6EC

	THUMB_FUNC_START sub_806F704
sub_806F704: @ 0x0806F704
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	bl sub_806E954
	adds r6, r0, #0
	ldr r0, _0806F748  @ gUnknown_085D9A1C
	adds r1, r4, #0
	bl Proc_Start
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	str r0, [r4, #0x44]
	ldr r0, _0806F74C  @ gUnknown_080DF954
	str r0, [r4, #0x48]
	ldr r0, _0806F750  @ gUnknown_085D9A94
	str r0, [r4, #0x4c]
	ldr r0, _0806F754  @ gUnknown_085D9A2C
	str r0, [r4, #0x54]
	ldr r0, _0806F758  @ gUnknown_085D9AFC
	str r0, [r4, #0x58]
	ldr r0, [r6, #0x24]
	bl _call_via_r0
	ldr r0, [r4, #0x5c]
	adds r1, r6, #0
	bl sub_806E95C
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806F748: .4byte gUnknown_085D9A1C
_0806F74C: .4byte gUnknown_080DF954
_0806F750: .4byte gUnknown_085D9A94
_0806F754: .4byte gUnknown_085D9A2C
_0806F758: .4byte gUnknown_085D9AFC

	THUMB_FUNC_END sub_806F704

	THUMB_FUNC_START sub_806F75C
sub_806F75C: @ 0x0806F75C
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r0, #0x2c
	adds r1, r7, #0
	adds r1, #0x44
	ldr r2, [r7, #0x48]
	bl EfxAdvanceFrameLut
	lsls r0, r0, #0x10
	asrs r4, r0, #0x10
	cmp r4, #0
	blt _0806F7A0
	ldr r1, [r7, #0x4c]
	ldr r5, [r7, #0x54]
	ldr r6, [r7, #0x58]
	ldr r0, [r7, #0x5c]
	lsls r4, r4, #2
	adds r1, r4, r1
	ldr r2, [r1]
	movs r1, #1
	movs r3, #1
	bl sub_806EA38
	ldr r0, [r7, #0x5c]
	adds r5, r4, r5
	ldr r1, [r5]
	bl sub_806EAA4
	ldr r0, [r7, #0x5c]
	adds r4, r4, r6
	ldr r1, [r4]
	bl sub_806EAD4
	b _0806F7B8
_0806F7A0:
	movs r0, #1
	negs r0, r0
	cmp r4, r0
	bne _0806F7B8
	ldr r0, [r7, #0x5c]
	bl sub_806E9B4
	bl SetDefaultColorEffects_
	adds r0, r7, #0
	bl Proc_Break
_0806F7B8:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_806F75C

	THUMB_FUNC_START sub_806F7C0
sub_806F7C0: @ 0x0806F7C0
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	bl sub_806E954
	ldr r0, _0806F80C  @ gUnknown_085D9B64
	adds r1, r5, #0
	bl Proc_Start
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	ldr r2, _0806F810  @ gUnknown_086C978C
	ldr r3, _0806F814  @ gUnknown_086C95C0
	adds r0, r4, #0
	movs r1, #1
	bl sub_806E9E4
	str r0, [r5, #0x60]
	ldrh r1, [r0, #2]
	subs r1, #0x38
	strh r1, [r0, #2]
	ldrh r1, [r0, #4]
	adds r1, #0x18
	strh r1, [r0, #4]
	ldr r0, [r5, #0x5c]
	ldr r1, _0806F818  @ gUnknown_086C93FC
	bl sub_806EB2C
	ldr r0, [r5, #0x5c]
	ldr r1, _0806F81C  @ gUnknown_086C90A4
	bl sub_806EAFC
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806F80C: .4byte gUnknown_085D9B64
_0806F810: .4byte gUnknown_086C978C
_0806F814: .4byte gUnknown_086C95C0
_0806F818: .4byte gUnknown_086C93FC
_0806F81C: .4byte gUnknown_086C90A4

	THUMB_FUNC_END sub_806F7C0

	THUMB_FUNC_START sub_806F820
sub_806F820: @ 0x0806F820
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x3c
	ble _0806F83E
	ldr r0, [r4, #0x60]
	bl AnimDelete
	adds r0, r4, #0
	bl Proc_Break
_0806F83E:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_806F820

	THUMB_FUNC_START sub_806F844
sub_806F844: @ 0x0806F844
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, _0806F860  @ gUnknown_085D9B74
	movs r1, #3
	bl Proc_Start
	adds r5, r0, #0
	bl SetGlbProcefxopCur
	str r4, [r5, #0x5c]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806F860: .4byte gUnknown_085D9B74

	THUMB_FUNC_END sub_806F844

	THUMB_FUNC_START sub_806F864
sub_806F864: @ 0x0806F864
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	adds r1, r4, #0
	bl sub_806F968
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_806F864

	THUMB_FUNC_START sub_806F87C
sub_806F87C: @ 0x0806F87C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	adds r1, r4, #0
	bl sub_806F894
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_806F87C

	THUMB_FUNC_START sub_806F894
sub_806F894: @ 0x0806F894
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	bl sub_806E954
	adds r6, r0, #0
	ldr r0, _0806F8DC  @ gUnknown_085D9BA4
	adds r1, r4, #0
	bl Proc_Start
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	str r0, [r4, #0x44]
	ldr r0, _0806F8E0  @ gUnknown_080DF9BE
	str r0, [r4, #0x48]
	ldr r0, _0806F8E4  @ gUnknown_085D9C00
	str r0, [r4, #0x4c]
	ldr r0, _0806F8E8  @ gUnknown_085D9BB4
	str r0, [r4, #0x54]
	ldr r1, _0806F8EC  @ gUnknown_086C790C
	adds r0, r5, #0
	bl sub_806EAD4
	ldr r0, [r6, #0x24]
	bl _call_via_r0
	ldr r0, [r4, #0x5c]
	adds r1, r6, #0
	bl sub_806E95C
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806F8DC: .4byte gUnknown_085D9BA4
_0806F8E0: .4byte gUnknown_080DF9BE
_0806F8E4: .4byte gUnknown_085D9C00
_0806F8E8: .4byte gUnknown_085D9BB4
_0806F8EC: .4byte gUnknown_086C790C

	THUMB_FUNC_END sub_806F894

	THUMB_FUNC_START sub_806F8F0
sub_806F8F0: @ 0x0806F8F0
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r0, #0x2c
	adds r1, r6, #0
	adds r1, #0x44
	ldr r2, [r6, #0x48]
	bl EfxAdvanceFrameLut
	lsls r0, r0, #0x10
	asrs r7, r0, #0x10
	cmp r7, #0
	blt _0806F948
	ldr r1, [r6, #0x4c]
	ldr r5, [r6, #0x54]
	ldr r0, [r6, #0x5c]
	lsls r4, r7, #2
	adds r1, r4, r1
	ldr r2, [r1]
	movs r1, #1
	movs r3, #1
	bl sub_806EA38
	ldr r0, [r6, #0x5c]
	adds r4, r4, r5
	ldr r1, [r4]
	bl sub_806EAA4
	cmp r7, #0x11
	bne _0806F932
	ldr r0, _0806F940  @ gUnknown_086C792C
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
_0806F932:
	cmp r7, #0x12
	bne _0806F960
	ldr r0, _0806F944  @ gUnknown_086C794C
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	b _0806F960
	.align 2, 0
_0806F940: .4byte gUnknown_086C792C
_0806F944: .4byte gUnknown_086C794C
_0806F948:
	movs r0, #1
	negs r0, r0
	cmp r7, r0
	bne _0806F960
	ldr r0, [r6, #0x5c]
	bl sub_806E9B4
	bl SetDefaultColorEffects_
	adds r0, r6, #0
	bl Proc_Break
_0806F960:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_806F8F0

	THUMB_FUNC_START sub_806F968
sub_806F968: @ 0x0806F968
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	bl sub_806E954
	ldr r0, _0806F9C8  @ gUnknown_085D9C4C
	adds r1, r5, #0
	bl Proc_Start
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	movs r6, #0
	strh r6, [r5, #0x2c]
	ldr r3, _0806F9CC  @ gUnknown_086BDA5C
	adds r0, r4, #0
	movs r1, #1
	adds r2, r3, #0
	bl sub_806E9E4
	str r0, [r5, #0x60]
	ldrh r1, [r0, #2]
	subs r1, #0x38
	strh r1, [r0, #2]
	ldrh r1, [r0, #4]
	adds r1, #0xc
	strh r1, [r0, #4]
	strh r6, [r0, #6]
	movs r1, #0x14
	strh r1, [r0, #0xa]
	ldrh r2, [r0, #8]
	movs r3, #0xc0
	lsls r3, r3, #4
	adds r1, r3, #0
	orrs r1, r2
	strh r1, [r0, #8]
	bl AnimSort
	ldr r0, [r5, #0x5c]
	ldr r1, _0806F9D0  @ gUnknown_086BD76C
	bl sub_806EB2C
	ldr r0, [r5, #0x5c]
	ldr r1, _0806F9D4  @ gUnknown_086BD260
	bl sub_806EAFC
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806F9C8: .4byte gUnknown_085D9C4C
_0806F9CC: .4byte gUnknown_086BDA5C
_0806F9D0: .4byte gUnknown_086BD76C
_0806F9D4: .4byte gUnknown_086BD260

	THUMB_FUNC_END sub_806F968

	THUMB_FUNC_START sub_806F9D8
sub_806F9D8: @ 0x0806F9D8
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xc8
	ble _0806F9F6
	ldr r0, [r4, #0x60]
	bl AnimDelete
	adds r0, r4, #0
	bl Proc_Break
_0806F9F6:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_806F9D8

.align 2, 0
