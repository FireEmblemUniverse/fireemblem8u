	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	THUMB_FUNC_START EfxALPHAMain
EfxALPHAMain: @ 0x0805BA64
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x2e
	ldrsh r1, [r5, r2]
	cmp r0, r1
	blt _0805BB18
	ldr r1, [r5, #0x44]
	ldr r2, [r5, #0x48]
	movs r6, #0x2c
	ldrsh r3, [r5, r6]
	movs r0, #0x2e
	ldrsh r4, [r5, r0]
	subs r3, r3, r4
	movs r6, #0x30
	ldrsh r0, [r5, r6]
	subs r0, r0, r4
	str r0, [sp]
	movs r0, #0
	bl Interpolate
	adds r4, r0, #0
	ldr r0, [r5, #0x4c]
	cmp r0, #1
	beq _0805BAC0
	cmp r0, #1
	bgt _0805BAAA
	cmp r0, #0
	beq _0805BAB0
	b _0805BAFE
_0805BAAA:
	cmp r0, #2
	beq _0805BAD0
	b _0805BAFE
_0805BAB0:
	lsls r1, r4, #0x18
	lsrs r1, r1, #0x18
	movs r0, #1
	movs r2, #0x10
	movs r3, #0
	bl SetBlendConfig
	b _0805BAFE
_0805BAC0:
	lsls r3, r4, #0x18
	lsrs r3, r3, #0x18
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl SetBlendConfig
	b _0805BAFE
_0805BAD0:
	movs r0, #0x2c
	ldrsh r3, [r5, r0]
	movs r2, #0x2e
	ldrsh r1, [r5, r2]
	subs r3, r3, r1
	movs r6, #0x30
	ldrsh r0, [r5, r6]
	subs r0, r0, r1
	str r0, [sp]
	movs r0, #0
	movs r1, #8
	movs r2, #0x10
	bl Interpolate
	adds r2, r0, #0
	lsls r1, r4, #0x18
	lsrs r1, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	movs r0, #1
	movs r3, #0
	bl SetBlendConfig
_0805BAFE:
	movs r0, #0x2c
	ldrsh r1, [r5, r0]
	movs r2, #0x30
	ldrsh r0, [r5, r2]
	cmp r1, r0
	blt _0805BB18
	ldr r1, _0805BB20  @ gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r5, #0
	bl Proc_Break
_0805BB18:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0805BB20: .4byte gEfxBgSemaphore

	THUMB_FUNC_END EfxALPHAMain

	THUMB_FUNC_START sub_805BB24
sub_805BB24: @ 0x0805BB24
	push {r4, r5, r6, lr}
	mov r6, sl
	mov r5, r9
	mov r4, r8
	push {r4, r5, r6}
	mov r8, r0
	mov r9, r1
	mov sl, r2
	adds r5, r3, #0
	ldr r6, [sp, #0x1c]
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	lsls r6, r6, #0x10
	lsrs r6, r6, #0x10
	ldr r1, _0805BB7C  @ gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805BB80  @ ProcScr_efxCircleWIN
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	mov r0, r8
	str r0, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	strh r0, [r4, #0x2e]
	mov r0, r9
	str r0, [r4, #0x44]
	mov r0, sl
	str r0, [r4, #0x54]
	mov r0, r8
	bl GetAnimAnotherSide
	strh r5, [r4, #0x32]
	strh r6, [r4, #0x3a]
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0805BB7C: .4byte gEfxBgSemaphore
_0805BB80: .4byte ProcScr_efxCircleWIN

	THUMB_FUNC_END sub_805BB24

	THUMB_FUNC_START EfxCircleWINMain
EfxCircleWINMain: @ 0x0805BB84
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	adds r5, r0, #0
	ldr r0, _0805BC04  @ gEkrBg2ScrollFlip
	ldr r0, [r0]
	ldr r1, _0805BC08  @ gpBg2ScrollOffsetTable1
	mov r8, r1
	cmp r0, #0
	bne _0805BB9E
	ldr r2, _0805BC0C  @ gpBg2ScrollOffsetTable2
	mov r8, r2
_0805BB9E:
	ldr r4, [r5, #0x54]
	movs r7, #0x2e
	ldrsh r0, [r5, r7]
	lsls r0, r0, #1
	adds r0, r0, r4
	ldrh r7, [r0]
	adds r0, r7, #0
	bl sub_8013278
	adds r6, r0, #0
	movs r1, #0x2e
	ldrsh r0, [r5, r1]
	lsls r0, r0, #1
	adds r0, r0, r4
	ldrh r1, [r0, #2]
	ldr r0, _0805BC10  @ 0x0000FFFF
	cmp r1, r0
	beq _0805BBC8
	ldrh r0, [r5, #0x2e]
	adds r0, #1
	strh r0, [r5, #0x2e]
_0805BBC8:
	ldrh r1, [r5, #0x3a]
	subs r0, r1, r7
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r0, #0
	bge _0805BBD6
	movs r2, #0
_0805BBD6:
	adds r0, r7, r1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xa0
	ble _0805BBE4
	movs r1, #0xa0
_0805BBE4:
	movs r3, #0
	lsls r0, r2, #0x10
	ldr r2, [r5, #0x44]
	mov ip, r2
	asrs r0, r0, #0x10
	mov r9, r0
	lsls r0, r1, #0x10
	asrs r4, r0, #0x10
_0805BBF4:
	cmp r9, r3
	bhi _0805BBFC
	cmp r4, r3
	bcs _0805BC14
_0805BBFC:
	movs r0, #0
	mov r7, r8
	strh r0, [r7]
	b _0805BC44
	.align 2, 0
_0805BC04: .4byte gEkrBg2ScrollFlip
_0805BC08: .4byte gpBg2ScrollOffsetTable1
_0805BC0C: .4byte gpBg2ScrollOffsetTable2
_0805BC10: .4byte 0x0000FFFF
_0805BC14:
	ldrh r2, [r5, #0x32]
	ldrh r1, [r6]
	adds r0, r2, r1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r0, #0
	bge _0805BC24
	movs r1, #0
_0805BC24:
	ldrh r7, [r6, #2]
	adds r0, r2, r7
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xf0
	ble _0805BC34
	movs r2, #0xf0
_0805BC34:
	lsls r1, r1, #0x10
	asrs r1, r1, #8
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	orrs r0, r1
	mov r1, r8
	strh r0, [r1]
	adds r6, #4
_0805BC44:
	movs r2, #2
	add r8, r2
	adds r3, #1
	cmp r3, #0x9f
	bls _0805BBF4
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	strh r0, [r5, #0x2c]
	movs r7, #0x2c
	ldrsh r0, [r5, r7]
	cmp r0, ip
	bne _0805BC6E
	ldr r1, _0805BC7C  @ gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SetDefaultColorEffects
	adds r0, r5, #0
	bl Proc_Break
_0805BC6E:
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805BC7C: .4byte gEfxBgSemaphore

	THUMB_FUNC_END EfxCircleWINMain

	THUMB_FUNC_START StartSpellThing_MagicQuake
StartSpellThing_MagicQuake: @ 0x0805BC80
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r6, r0, #0
	mov r8, r1
	adds r5, r2, #0
	ldr r1, _0805BCBC  @ gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805BCC0  @ ProcScr_efxMagicQUAKE
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	str r6, [r4, #0x5c]
	adds r0, r5, #0
	movs r1, #0
	bl NewEfxQuakePure
	str r0, [r4, #0x60]
	movs r0, #0
	strh r0, [r4, #0x2c]
	mov r0, r8
	strh r0, [r4, #0x2e]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0805BCBC: .4byte gEfxBgSemaphore
_0805BCC0: .4byte ProcScr_efxMagicQUAKE

	THUMB_FUNC_END StartSpellThing_MagicQuake

	THUMB_FUNC_START Loop6C_efxMagicQUAKE
Loop6C_efxMagicQUAKE: @ 0x0805BCC4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	mov r8, r0
	ldr r5, _0805BD54  @ gEkrBg2QuakeVec
	ldrh r1, [r5]
	ldrh r2, [r5, #2]
	movs r0, #2
	bl BG_SetPosition
	ldr r4, _0805BD58  @ gEkrBg0QuakeVec
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
	ldrh r1, [r5]
	adds r0, r0, r1
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
	ldrh r2, [r5, #2]
	adds r1, r1, r2
	negs r1, r1
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	bl EkrDispUP_SetPositionSync
	bl GetBanimDragonStatusType
	cmp r0, #0
	beq _0805BD42
	ldrh r1, [r5]
	ldrh r2, [r5, #2]
	movs r0, #3
	bl BG_SetPosition
_0805BD42:
	bl GetBanimDragonStatusType
	cmp r0, #0
	beq _0805BD60
	ldr r4, _0805BD5C  @ gEkrXPosReal
	ldrh r0, [r4]
	ldrh r1, [r5]
	subs r0, r0, r1
	b _0805BD68
	.align 2, 0
_0805BD54: .4byte gEkrBg2QuakeVec
_0805BD58: .4byte gEkrBg0QuakeVec
_0805BD5C: .4byte gEkrXPosReal
_0805BD60:
	ldr r4, _0805BE78  @ gEkrXPosReal
	ldrh r0, [r5]
	ldrh r3, [r4]
	adds r0, r0, r3
_0805BD68:
	ldr r3, _0805BE7C  @ gEkrBgPosition
	ldr r1, [r3]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	ldr r2, _0805BE80  @ gEkrYPosReal
	ldrh r0, [r2]
	ldrh r1, [r5, #2]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	mov r9, r4
	mov sl, r2
	ldr r2, _0805BE84  @ gEkrBg2QuakeVec
	ldrh r0, [r2]
	mov r1, r9
	ldrh r1, [r1, #2]
	adds r0, r0, r1
	ldr r3, _0805BE7C  @ gEkrBgPosition
	ldr r1, [r3]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	mov r1, sl
	ldrh r0, [r1, #2]
	ldrh r1, [r2, #2]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	lsls r1, r7, #0x10
	asrs r1, r1, #0x10
	lsls r2, r6, #0x10
	asrs r2, r2, #0x10
	movs r0, #0
	bl SetEkrFrontAnimPostion
	lsls r1, r5, #0x10
	asrs r1, r1, #0x10
	lsls r2, r4, #0x10
	asrs r2, r2, #0x10
	movs r0, #1
	bl SetEkrFrontAnimPostion
	mov r2, r8
	ldrh r0, [r2, #0x2c]
	adds r0, #1
	strh r0, [r2, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r3, #0x2e
	ldrsh r1, [r2, r3]
	cmp r0, r1
	ble _0805BE6A
	ldr r1, _0805BE88  @ gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	ldr r4, _0805BE8C  @ gEkrBg0QuakeVec
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
	bl EkrDispUP_SetPositionSync
	bl GetBanimDragonStatusType
	cmp r0, #0
	beq _0805BE2A
	movs r0, #3
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
_0805BE2A:
	ldr r0, _0805BE7C  @ gEkrBgPosition
	ldr r2, [r0]
	mov r3, r9
	ldrh r1, [r3]
	subs r1, r1, r2
	ldrh r0, [r3, #2]
	subs r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	mov r0, sl
	ldrh r4, [r0, #2]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r3, #0
	ldrsh r2, [r0, r3]
	movs r0, #0
	bl SetEkrFrontAnimPostion
	lsls r1, r5, #0x10
	asrs r1, r1, #0x10
	lsls r2, r4, #0x10
	asrs r2, r2, #0x10
	movs r0, #1
	bl SetEkrFrontAnimPostion
	mov r1, r8
	ldr r0, [r1, #0x60]
	bl Proc_End
	mov r0, r8
	bl Proc_Break
_0805BE6A:
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805BE78: .4byte gEkrXPosReal
_0805BE7C: .4byte gEkrBgPosition
_0805BE80: .4byte gEkrYPosReal
_0805BE84: .4byte gEkrBg2QuakeVec
_0805BE88: .4byte gEfxBgSemaphore
_0805BE8C: .4byte gEkrBg0QuakeVec

	THUMB_FUNC_END Loop6C_efxMagicQUAKE
