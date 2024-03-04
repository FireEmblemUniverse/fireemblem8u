	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	THUMB_FUNC_START sub_8080288
sub_8080288: @ 0x08080288
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r5, r0, #0
	adds r1, r5, #0
	adds r1, #0x42
	ldrh r0, [r1]
	adds r6, r0, #0
	cmp r6, #0
	bne _08080378
	adds r4, r5, #0
	adds r4, #0x40
	ldrh r1, [r4]
	lsls r0, r1, #0x12
	lsrs r7, r0, #0x10
	mov r9, r4
	cmp r1, #7
	bhi _08080330
	movs r6, #1
	adds r5, #0x44
	mov r8, r5
	ldr r0, _08080328  @ gUnknown_082058B0
	mov sl, r0
	movs r1, #0x1f
	mov ip, r1
_080802C0:
	mov r1, r8
	ldrh r0, [r1]
	add r0, sl
	ldrb r0, [r0]
	lsls r0, r0, #4
	adds r0, r0, r6
	lsls r0, r0, #1
	ldr r1, _0808032C  @ gPaletteBuffer
	adds r5, r0, r1
	ldrh r1, [r5]
	adds r4, r1, #0
	movs r0, #0x1f
	ands r0, r1
	adds r0, r7, r0
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0x1f
	bls _080802E6
	movs r2, #0x1f
_080802E6:
	lsrs r0, r1, #5
	mov r1, ip
	ands r0, r1
	adds r0, r7, r0
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #0x1f
	bls _080802F8
	movs r3, #0x1f
_080802F8:
	lsrs r0, r4, #0xa
	mov r1, ip
	ands r0, r1
	adds r0, r7, r0
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #0x1f
	bls _0808030A
	movs r1, #0x1f
_0808030A:
	lsls r0, r3, #5
	orrs r2, r0
	lsls r0, r1, #0xa
	orrs r2, r0
	strh r2, [r5]
	adds r6, #1
	cmp r6, #0xf
	ble _080802C0
	bl EnablePaletteSync
	mov r1, r9
	ldrh r0, [r1]
	adds r0, #1
	b _0808037A
	.align 2, 0
_08080328: .4byte gUnknown_082058B0
_0808032C: .4byte gPaletteBuffer
_08080330:
	movs r0, #1
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #1
	bl SetBlendTargetA
	movs r0, #2
	movs r1, #0x10
	movs r2, #0x10
	movs r3, #0x10
	bl SetBlendConfig
	ldr r2, _08080374  @ gLCDControlBuffer
	ldrb r1, [r2, #1]
	movs r0, #2
	negs r0, r0
	ands r0, r1
	movs r1, #3
	negs r1, r1
	ands r0, r1
	subs r1, #2
	ands r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2, #1]
	strh r6, [r4]
	adds r0, r5, #0
	bl Proc_Break
	b _0808037C
	.align 2, 0
_08080374: .4byte gLCDControlBuffer
_08080378:
	subs r0, #1
_0808037A:
	strh r0, [r1]
_0808037C:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8080288

	THUMB_FUNC_START sub_808038C
sub_808038C: @ 0x0808038C
	push {r4, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x40
	ldrh r0, [r1]
	cmp r0, #0x81
	bhi _080803B6
	lsls r0, r0, #4
	movs r1, #0x82
	bl __divsi3
	movs r3, #0x10
	subs r3, r3, r0
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	movs r0, #2
	movs r1, #0x10
	movs r2, #0x10
	bl SetBlendConfig
	b _080803C8
_080803B6:
	movs r0, #2
	movs r1, #0x10
	movs r2, #0x10
	movs r3, #0
	bl SetBlendConfig
	adds r0, r4, #0
	bl Proc_Break
_080803C8:
	adds r1, r4, #0
	adds r1, #0x40
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_808038C

	THUMB_FUNC_START sub_80803D8
sub_80803D8: @ 0x080803D8
	push {lr}
	ldr r0, _080803FC  @ gBG0TilemapBuffer
	movs r1, #0
	bl BG_Fill
	ldr r0, _08080400  @ gBG1TilemapBuffer
	movs r1, #0
	bl BG_Fill
	ldr r0, _08080404  @ gBG2TilemapBuffer
	movs r1, #0
	bl BG_Fill
	movs r0, #7
	bl BG_EnableSyncByMask
	pop {r0}
	bx r0
	.align 2, 0
_080803FC: .4byte gBG0TilemapBuffer
_08080400: .4byte gBG1TilemapBuffer
_08080404: .4byte gBG2TilemapBuffer

	THUMB_FUNC_END sub_80803D8

	THUMB_FUNC_START sub_8080408
sub_8080408: @ 0x08080408
	push {lr}
	ldr r0, _0808043C  @ gUnknown_03001C7C
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _08080438
	ldr r0, _08080440  @ 0x04000006
	ldrh r0, [r0]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0xe4
	bne _08080426
	movs r2, #0
_08080426:
	cmp r2, #0x9f
	bhi _08080438
	ldr r0, _08080444  @ 0x0400001A
	lsrs r1, r2, #1
	subs r1, r1, r2
	ldr r3, _08080448  @ 0x000001FF
	adds r2, r3, #0
	ands r1, r2
	strh r1, [r0]
_08080438:
	pop {r0}
	bx r0
	.align 2, 0
_0808043C: .4byte gUnknown_03001C7C
_08080440: .4byte 0x04000006
_08080444: .4byte 0x0400001A
_08080448: .4byte 0x000001FF

	THUMB_FUNC_END sub_8080408

	THUMB_FUNC_START sub_808044C
sub_808044C: @ 0x0808044C
	push {lr}
	adds r2, r0, #0
	adds r3, r2, #0
	adds r3, #0x29
	movs r0, #0
	ldrsb r0, [r3, r0]
	cmp r0, #0
	beq _0808046A
	ldr r1, _08080470  @ gUnknown_03001C7C
	adds r0, r2, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	strb r0, [r1]
	movs r0, #0
	strb r0, [r3]
_0808046A:
	pop {r0}
	bx r0
	.align 2, 0
_08080470: .4byte gUnknown_03001C7C

	THUMB_FUNC_END sub_808044C

	THUMB_FUNC_START sub_8080474
sub_8080474: @ 0x08080474
	push {lr}
	adds r1, r0, #0
	cmp r1, #0
	beq _08080488
	ldr r0, _08080484  @ gUnknown_089A45DC
	bl Proc_StartBlocking
	b _08080490
	.align 2, 0
_08080484: .4byte gUnknown_089A45DC
_08080488:
	ldr r0, _08080494  @ gUnknown_089A45DC
	movs r1, #3
	bl Proc_Start
_08080490:
	pop {r0}
	bx r0
	.align 2, 0
_08080494: .4byte gUnknown_089A45DC

	THUMB_FUNC_END sub_8080474

	THUMB_FUNC_START sub_8080498
sub_8080498: @ 0x08080498
	push {r4, r5, r6, lr}
	mov r6, r9
	mov r5, r8
	push {r5, r6}
	sub sp, #4
	adds r6, r1, #0
	ldr r1, _0808051C  @ gUnknown_089A44A4
	mov r8, r1
	lsls r5, r0, #1
	adds r5, r5, r0
	lsls r5, r5, #2
	adds r0, r5, r1
	ldr r0, [r0]
	ldr r2, _08080520  @ gUnknown_082058D4
	lsls r1, r6, #2
	adds r1, r1, r2
	ldr r4, [r1]
	lsls r1, r4, #5
	movs r2, #0xc0
	lsls r2, r2, #0x13
	adds r1, r1, r2
	bl Decompress
	mov r0, r8
	adds r0, #8
	adds r0, r5, r0
	ldr r0, [r0]
	ldr r1, _08080524  @ gGenericBuffer
	mov r9, r1
	bl Decompress
	ldr r0, _08080528  @ gBG2TilemapBuffer
	ldr r1, _0808052C  @ gUnknown_082058DC
	adds r6, r6, r1
	ldrb r6, [r6]
	lsls r1, r6, #0xc
	orrs r4, r1
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	str r4, [sp]
	mov r1, r9
	movs r2, #0
	movs r3, #0
	bl AddAttr2dBitMap
	movs r0, #4
	bl BG_EnableSyncByMask
	movs r2, #4
	add r8, r2
	add r5, r8
	ldr r0, [r5]
	lsls r6, r6, #5
	adds r1, r6, #0
	movs r2, #0x20
	bl CopyToPaletteBuffer
	bl EnablePaletteSync
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0808051C: .4byte gUnknown_089A44A4
_08080520: .4byte gUnknown_082058D4
_08080524: .4byte gGenericBuffer
_08080528: .4byte gBG2TilemapBuffer
_0808052C: .4byte gUnknown_082058DC

	THUMB_FUNC_END sub_8080498

	THUMB_FUNC_START sub_8080530
sub_8080530: @ 0x08080530
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #4
	mov r8, r1
	ldr r6, _08080598  @ gUnknown_089A44A4
	lsls r4, r0, #1
	adds r4, r4, r0
	lsls r4, r4, #2
	adds r0, r4, r6
	ldr r0, [r0]
	ldr r2, _0808059C  @ gUnknown_082058D4
	lsls r1, r1, #2
	adds r1, r1, r2
	ldr r5, [r1]
	lsls r1, r5, #5
	movs r2, #0xc0
	lsls r2, r2, #0x13
	adds r1, r1, r2
	bl Decompress
	adds r6, #8
	adds r4, r4, r6
	ldr r0, [r4]
	ldr r4, _080805A0  @ gGenericBuffer
	adds r1, r4, #0
	bl Decompress
	ldr r0, _080805A4  @ gBG2TilemapBuffer
	ldr r1, _080805A8  @ gUnknown_082058DC
	add r8, r1
	mov r3, r8
	ldrb r1, [r3]
	lsls r1, r1, #0xc
	orrs r5, r1
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	str r5, [sp]
	adds r1, r4, #0
	movs r2, #0
	movs r3, #0
	bl AddAttr2dBitMap
	movs r0, #4
	bl BG_EnableSyncByMask
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08080598: .4byte gUnknown_089A44A4
_0808059C: .4byte gUnknown_082058D4
_080805A0: .4byte gGenericBuffer
_080805A4: .4byte gBG2TilemapBuffer
_080805A8: .4byte gUnknown_082058DC

	THUMB_FUNC_END sub_8080530

	THUMB_FUNC_START sub_80805AC
sub_80805AC: @ 0x080805AC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r7, r2, #0
	ldr r3, _08080648  @ gUnknown_089A44A4
	lsls r2, r0, #1
	adds r2, r2, r0
	lsls r2, r2, #2
	adds r3, #4
	adds r2, r2, r3
	ldr r0, _0808064C  @ gUnknown_082058DC
	adds r1, r1, r0
	ldrb r0, [r1]
	lsls r0, r0, #5
	ldr r1, _08080650  @ gPaletteBuffer
	movs r3, #0x1f
	mov r8, r3
	movs r6, #0x1f
	adds r5, r0, r1
	ldr r4, [r2]
	movs r0, #0xf
	mov ip, r0
_080805D8:
	ldrh r1, [r4]
	adds r3, r1, #0
	adds r2, r1, #0
	ands r2, r6
	subs r0, r6, r2
	muls r0, r7, r0
	cmp r0, #0
	bge _080805EA
	adds r0, #0x1f
_080805EA:
	asrs r0, r0, #5
	adds r0, r2, r0
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	lsrs r1, r1, #5
	mov r0, r8
	ands r1, r0
	subs r0, r6, r1
	muls r0, r7, r0
	cmp r0, #0
	bge _08080602
	adds r0, #0x1f
_08080602:
	asrs r0, r0, #5
	adds r0, r1, r0
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	lsrs r3, r3, #0xa
	mov r0, r8
	ands r3, r0
	subs r0, r6, r3
	muls r0, r7, r0
	cmp r0, #0
	bge _0808061A
	adds r0, #0x1f
_0808061A:
	asrs r0, r0, #5
	adds r0, r3, r0
	lsls r0, r0, #0x10
	lsls r1, r1, #5
	orrs r2, r1
	lsrs r0, r0, #6
	orrs r2, r0
	strh r2, [r5]
	adds r5, #2
	adds r4, #2
	movs r3, #1
	negs r3, r3
	add ip, r3
	mov r0, ip
	cmp r0, #0
	bge _080805D8
	bl EnablePaletteSync
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08080648: .4byte gUnknown_089A44A4
_0808064C: .4byte gUnknown_082058DC
_08080650: .4byte gPaletteBuffer

	THUMB_FUNC_END sub_80805AC

	THUMB_FUNC_START sub_8080654
sub_8080654: @ 0x08080654
	push {lr}
	ldr r0, [r0, #0x50]
	bl Proc_End
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8080654

	THUMB_FUNC_START sub_8080660
sub_8080660: @ 0x08080660
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r2, _08080728  @ gLCDControlBuffer
	ldrb r3, [r2, #0xc]
	movs r1, #4
	negs r1, r1
	adds r0, r1, #0
	ands r0, r3
	strb r0, [r2, #0xc]
	ldrb r3, [r2, #0x10]
	adds r0, r1, #0
	ands r0, r3
	strb r0, [r2, #0x10]
	ldrb r3, [r2, #0x14]
	adds r0, r1, #0
	ands r0, r3
	strb r0, [r2, #0x14]
	ldrb r0, [r2, #0x18]
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	strb r1, [r2, #0x18]
	ldrb r1, [r2, #1]
	movs r0, #2
	negs r0, r0
	ands r0, r1
	movs r1, #3
	negs r1, r1
	ands r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2, #1]
	adds r4, r2, #0
	adds r4, #0x34
	ldrb r3, [r4]
	movs r1, #0x21
	negs r1, r1
	adds r0, r1, #0
	ands r0, r3
	strb r0, [r4]
	adds r2, #0x35
	ldrb r0, [r2]
	ands r1, r0
	strb r1, [r2]
	movs r4, #0
	str r4, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #1
	movs r3, #0
	bl SetBlendTargetA
	movs r0, #0
	bl SetBlendBackdropA
	movs r0, #1
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #1
	bl SetBlendTargetB
	movs r0, #1
	bl SetBlendBackdropB
	movs r0, #1
	movs r1, #0x10
	movs r2, #0x10
	movs r3, #0
	bl SetBlendConfig
	movs r0, #2
	movs r1, #8
	movs r2, #8
	bl BG_SetPosition
	ldr r0, _0808072C  @ gUnknown_089A4644
	adds r1, r5, #0
	bl Proc_Start
	str r0, [r5, #0x50]
	adds r0, r5, #0
	adds r0, #0x40
	strh r4, [r0]
	adds r0, #2
	strh r4, [r0]
	adds r0, #2
	strh r4, [r0]
	adds r0, #2
	strh r4, [r0]
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08080728: .4byte gLCDControlBuffer
_0808072C: .4byte gUnknown_089A4644

	THUMB_FUNC_END sub_8080660

	THUMB_FUNC_START sub_8080730
sub_8080730: @ 0x08080730
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	movs r0, #0x42
	adds r0, r0, r4
	mov r8, r0
	ldrh r6, [r0]
	cmp r6, #0
	bne _080807A6
	ldr r1, _080807BC  @ gUnknown_082058DE
	adds r5, r4, #0
	adds r5, #0x40
	ldrh r0, [r5]
	adds r0, r0, r1
	ldrb r0, [r0]
	adds r7, r4, #0
	adds r7, #0x44
	ldrh r1, [r7]
	bl sub_8080498
	ldrh r0, [r5]
	cmp r0, #0
	bne _08080768
	ldr r0, _080807C0  @ 0x00000141
	ldr r1, [r4, #0x30]
	bl PlaySeSpacial
_08080768:
	ldrh r0, [r5]
	adds r0, #1
	strh r0, [r5]
	movs r0, #5
	mov r1, r8
	strh r0, [r1]
	ldrh r0, [r5]
	cmp r0, #3
	bls _0808079E
	strh r6, [r5]
	adds r0, r4, #0
	adds r0, #0x46
	strh r6, [r0]
	adds r0, #2
	strh r6, [r0]
	adds r0, #2
	strh r6, [r0]
	ldr r1, _080807C4  @ gBmSt
	movs r2, #0xc
	ldrsh r0, [r1, r2]
	str r0, [r4, #0x30]
	movs r2, #0xe
	ldrsh r0, [r1, r2]
	str r0, [r4, #0x34]
	adds r0, r4, #0
	bl Proc_Break
_0808079E:
	ldrh r0, [r7]
	movs r1, #1
	eors r0, r1
	strh r0, [r7]
_080807A6:
	adds r1, r4, #0
	adds r1, #0x42
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080807BC: .4byte gUnknown_082058DE
_080807C0: .4byte 0x00000141
_080807C4: .4byte gBmSt

	THUMB_FUNC_END sub_8080730

	THUMB_FUNC_START sub_80807C8
sub_80807C8: @ 0x080807C8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	adds r0, #0x46
	ldrh r0, [r0]
	cmp r0, #5
	bne _080807EC
	ldr r0, [r5, #0x50]
	adds r0, #0x29
	movs r2, #0
	movs r1, #1
	strb r1, [r0]
	ldr r0, [r5, #0x50]
	strh r2, [r0, #0x2a]
	ldr r1, [r5, #0x50]
	movs r0, #2
	b _08080818
_080807EC:
	cmp r0, #8
	bne _08080802
	ldr r0, [r5, #0x50]
	adds r0, #0x29
	movs r1, #1
	strb r1, [r0]
	ldr r0, [r5, #0x50]
	strh r1, [r0, #0x2a]
	ldr r1, [r5, #0x50]
	movs r0, #3
	b _08080818
_08080802:
	cmp r0, #0xb
	bne _0808081A
	ldr r0, [r5, #0x50]
	adds r0, #0x29
	movs r1, #1
	strb r1, [r0]
	ldr r1, [r5, #0x50]
	movs r0, #2
	strh r0, [r1, #0x2a]
	ldr r1, [r5, #0x50]
	movs r0, #4
_08080818:
	strh r0, [r1, #0x34]
_0808081A:
	adds r0, r5, #0
	adds r0, #0x42
	ldrh r7, [r0]
	mov r8, r0
	cmp r7, #0
	bne _0808087E
	ldr r1, _08080864  @ gUnknown_082058E2
	adds r6, r5, #0
	adds r6, #0x40
	ldrh r0, [r6]
	adds r0, r0, r1
	ldrb r0, [r0]
	adds r4, r5, #0
	adds r4, #0x44
	ldrh r1, [r4]
	bl sub_8080498
	ldrh r0, [r6]
	adds r0, #1
	strh r0, [r6]
	movs r0, #4
	mov r1, r8
	strh r0, [r1]
	adds r1, r5, #0
	adds r1, #0x46
	ldrh r0, [r1]
	cmp r0, #0x15
	bls _08080868
	ldrh r0, [r6]
	cmp r0, #1
	bls _08080876
	strh r7, [r6]
	strh r7, [r1]
	adds r0, r5, #0
	bl Proc_Break
	b _08080876
	.align 2, 0
_08080864: .4byte gUnknown_082058E2
_08080868:
	ldrh r0, [r6]
	cmp r0, #1
	bls _08080876
	strh r7, [r6]
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
_08080876:
	ldrh r0, [r4]
	movs r1, #1
	eors r0, r1
	strh r0, [r4]
_0808087E:
	mov r1, r8
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80807C8

	THUMB_FUNC_START sub_8080890
sub_8080890: @ 0x08080890
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	movs r0, #0x42
	adds r0, r0, r6
	mov r8, r0
	ldrh r7, [r0]
	cmp r7, #0
	bne _080808EC
	ldr r1, _080808DC  @ gUnknown_082058E4
	adds r4, r6, #0
	adds r4, #0x40
	ldrh r0, [r4]
	adds r0, r0, r1
	ldrb r0, [r0]
	adds r5, r6, #0
	adds r5, #0x44
	ldrh r1, [r5]
	bl sub_8080498
	movs r0, #3
	mov r1, r8
	strh r0, [r1]
	ldrh r0, [r4]
	cmp r0, #0xa
	bls _080808E0
	strh r7, [r4]
	adds r0, r6, #0
	adds r0, #0x46
	strh r7, [r0]
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
	adds r0, r6, #0
	bl Proc_Break
	b _080808F6
	.align 2, 0
_080808DC: .4byte gUnknown_082058E4
_080808E0:
	adds r0, #1
	strh r0, [r4]
	ldrh r0, [r5]
	movs r1, #1
	eors r0, r1
	strh r0, [r5]
_080808EC:
	adds r1, r6, #0
	adds r1, #0x42
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
_080808F6:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8080890

	THUMB_FUNC_START sub_8080900
sub_8080900: @ 0x08080900
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	adds r2, r0, #0
	adds r1, r2, #0
	adds r1, #0x42
	ldrh r0, [r1]
	adds r4, r0, #0
	cmp r4, #0
	bne _080809C4
	adds r3, r2, #0
	adds r3, #0x40
	ldrh r1, [r3]
	lsls r0, r1, #0x12
	lsrs r7, r0, #0x10
	mov r9, r3
	cmp r1, #7
	bhi _080809A4
	movs r6, #1
	adds r2, #0x44
	mov r8, r2
	ldr r0, _0808099C  @ gUnknown_082058DC
	mov sl, r0
	movs r1, #0x1f
	mov ip, r1
_08080936:
	mov r1, r8
	ldrh r0, [r1]
	add r0, sl
	ldrb r0, [r0]
	lsls r0, r0, #4
	adds r0, r0, r6
	lsls r0, r0, #1
	ldr r1, _080809A0  @ gPaletteBuffer
	adds r5, r0, r1
	ldrh r1, [r5]
	adds r4, r1, #0
	movs r0, #0x1f
	ands r0, r1
	adds r0, r7, r0
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0x1f
	bls _0808095C
	movs r2, #0x1f
_0808095C:
	lsrs r0, r1, #5
	mov r1, ip
	ands r0, r1
	adds r0, r7, r0
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #0x1f
	bls _0808096E
	movs r3, #0x1f
_0808096E:
	lsrs r0, r4, #0xa
	mov r1, ip
	ands r0, r1
	adds r0, r7, r0
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #0x1f
	bls _08080980
	movs r1, #0x1f
_08080980:
	lsls r0, r3, #5
	orrs r2, r0
	lsls r0, r1, #0xa
	orrs r2, r0
	strh r2, [r5]
	adds r6, #1
	cmp r6, #0xf
	ble _08080936
	bl EnablePaletteSync
	mov r1, r9
	ldrh r0, [r1]
	adds r0, #1
	b _080809C6
	.align 2, 0
_0808099C: .4byte gUnknown_082058DC
_080809A0: .4byte gPaletteBuffer
_080809A4:
	strh r4, [r3]
	adds r0, r2, #0
	adds r0, #0x46
	strh r4, [r0]
	adds r0, #2
	strh r4, [r0]
	adds r1, r2, #0
	adds r1, #0x4a
	ldr r0, _080809C0  @ 0x0000FFFF
	strh r0, [r1]
	adds r0, r2, #0
	bl Proc_Break
	b _080809C8
	.align 2, 0
_080809C0: .4byte 0x0000FFFF
_080809C4:
	subs r0, #1
_080809C6:
	strh r0, [r1]
_080809C8:
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8080900

	THUMB_FUNC_START sub_80809D8
sub_80809D8: @ 0x080809D8
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	adds r6, r0, #0
	adds r0, #0x46
	ldrh r0, [r0]
	cmp r0, #2
	bne _080809F8
	ldr r0, [r6, #0x50]
	adds r0, #0x29
	movs r1, #1
	strb r1, [r0]
	ldr r0, [r6, #0x50]
	strh r1, [r0, #0x2a]
	b _08080A1C
_080809F8:
	cmp r0, #3
	bne _08080A0A
	ldr r0, [r6, #0x50]
	adds r0, #0x29
	movs r1, #1
	strb r1, [r0]
	ldr r0, [r6, #0x50]
	strh r1, [r0, #0x2a]
	b _08080A36
_08080A0A:
	cmp r0, #4
	bne _08080A24
	ldr r0, [r6, #0x50]
	adds r0, #0x29
	movs r2, #0
	movs r1, #1
	strb r1, [r0]
	ldr r0, [r6, #0x50]
	strh r2, [r0, #0x2a]
_08080A1C:
	ldr r1, [r6, #0x50]
	movs r0, #3
	strh r0, [r1, #0x34]
	b _08080A4E
_08080A24:
	cmp r0, #5
	bne _08080A3E
	ldr r0, [r6, #0x50]
	adds r0, #0x29
	movs r2, #0
	movs r1, #1
	strb r1, [r0]
	ldr r0, [r6, #0x50]
	strh r2, [r0, #0x2a]
_08080A36:
	ldr r1, [r6, #0x50]
	movs r0, #4
	strh r0, [r1, #0x34]
	b _08080A4E
_08080A3E:
	cmp r0, #6
	bne _08080A4E
	ldr r0, [r6, #0x50]
	adds r0, #0x29
	movs r1, #0
	strb r1, [r0]
	ldr r0, [r6, #0x50]
	strh r1, [r0, #0x2a]
_08080A4E:
	adds r0, r6, #0
	adds r0, #0x42
	ldrh r7, [r0]
	mov r8, r0
	movs r0, #0x4a
	adds r0, r0, r6
	mov r9, r0
	cmp r7, #0
	bne _08080ABE
	ldr r1, _08080AA4  @ gUnknown_082058F0
	adds r5, r6, #0
	adds r5, #0x40
	ldrh r0, [r5]
	adds r0, r0, r1
	ldrb r0, [r0]
	adds r4, r6, #0
	adds r4, #0x44
	ldrh r1, [r4]
	bl sub_8080530
	ldrh r0, [r5]
	mov r1, r9
	strh r0, [r1]
	ldrh r0, [r5]
	adds r0, #1
	strh r0, [r5]
	movs r0, #4
	mov r3, r8
	strh r0, [r3]
	adds r1, r6, #0
	adds r1, #0x46
	ldrh r0, [r1]
	cmp r0, #0xa
	bls _08080AA8
	ldrh r0, [r5]
	cmp r0, #3
	bls _08080AB6
	strh r7, [r5]
	strh r7, [r1]
	adds r0, r6, #0
	bl Proc_Break
	b _08080AB6
	.align 2, 0
_08080AA4: .4byte gUnknown_082058F0
_08080AA8:
	ldrh r0, [r5]
	cmp r0, #3
	bls _08080AB6
	strh r7, [r5]
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
_08080AB6:
	ldrh r0, [r4]
	movs r1, #1
	eors r0, r1
	strh r0, [r4]
_08080ABE:
	mov r4, r8
	ldrh r0, [r4]
	subs r0, #1
	strh r0, [r4]
	adds r2, r6, #0
	adds r2, #0x48
	ldrh r1, [r2]
	movs r3, #0
	ldrsh r0, [r2, r3]
	cmp r0, #0x95
	bgt _08080AD8
	adds r0, r1, #1
	strh r0, [r2]
_08080AD8:
	mov r4, r9
	movs r1, #0
	ldrsh r0, [r4, r1]
	cmp r0, #0
	blt _08080B06
	ldr r1, _08080B14  @ gUnknown_082058F0
	adds r0, r0, r1
	ldrb r5, [r0]
	adds r0, r6, #0
	adds r0, #0x44
	ldrh r4, [r0]
	movs r1, #0
	ldrsh r0, [r2, r1]
	lsls r0, r0, #5
	movs r1, #0x96
	bl __divsi3
	movs r2, #0x20
	subs r2, r2, r0
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_80805AC
_08080B06:
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08080B14: .4byte gUnknown_082058F0

	THUMB_FUNC_END sub_80809D8

	THUMB_FUNC_START sub_8080B18
sub_8080B18: @ 0x08080B18
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	movs r0, #0x42
	adds r0, r0, r5
	mov r8, r0
	ldrh r7, [r0]
	cmp r7, #0
	bne _08080B6A
	ldr r1, _08080B80  @ gUnknown_082058F4
	adds r4, r5, #0
	adds r4, #0x40
	ldrh r0, [r4]
	adds r0, r0, r1
	ldrb r0, [r0]
	adds r6, r5, #0
	adds r6, #0x44
	ldrh r1, [r6]
	bl sub_8080498
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
	movs r0, #5
	mov r1, r8
	strh r0, [r1]
	ldrh r0, [r4]
	cmp r0, #3
	bls _08080B62
	strh r7, [r4]
	adds r0, r5, #0
	adds r0, #0x46
	strh r7, [r0]
	adds r0, r5, #0
	bl Proc_Break
_08080B62:
	ldrh r0, [r6]
	movs r1, #1
	eors r0, r1
	strh r0, [r6]
_08080B6A:
	adds r1, r5, #0
	adds r1, #0x42
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08080B80: .4byte gUnknown_082058F4

	THUMB_FUNC_END sub_8080B18

	THUMB_FUNC_START sub_8080B84
sub_8080B84: @ 0x08080B84
	push {lr}
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	ldr r0, _08080BA4  @ gBG2TilemapBuffer
	movs r1, #0
	bl BG_Fill
	movs r0, #7
	bl BG_EnableSyncByMask
	pop {r0}
	bx r0
	.align 2, 0
_08080BA4: .4byte gBG2TilemapBuffer

	THUMB_FUNC_END sub_8080B84

	THUMB_FUNC_START sub_8080BA8
sub_8080BA8: @ 0x08080BA8
	push {r4, lr}
	adds r1, r0, #0
	adds r1, #0x29
	movs r3, #0
	strb r3, [r1]
	movs r4, #0
	strh r3, [r0, #0x2a]
	ldr r2, _08080BD4  @ gBmSt
	ldrh r1, [r2, #0xc]
	strh r1, [r0, #0x2c]
	ldrh r1, [r2, #0xe]
	strh r1, [r0, #0x2e]
	strh r3, [r0, #0x30]
	strh r3, [r0, #0x32]
	movs r1, #4
	strh r1, [r0, #0x34]
	strh r3, [r0, #0x36]
	adds r0, #0x38
	strb r4, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08080BD4: .4byte gBmSt

	THUMB_FUNC_END sub_8080BA8

	THUMB_FUNC_START sub_8080BD8
sub_8080BD8: @ 0x08080BD8
	push {r4, r5, r6, lr}
	mov ip, r0
	adds r0, #0x29
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _08080C04
	ldr r0, _08080C00  @ gBmSt
	mov r2, ip
	ldrh r1, [r2, #0x2c]
	strh r1, [r0, #0xc]
	ldrh r1, [r2, #0x2e]
	strh r1, [r0, #0xe]
	movs r0, #2
	movs r1, #8
	movs r2, #8
	bl BG_SetPosition
	b _08080D1C
	.align 2, 0
_08080C00: .4byte gBmSt
_08080C04:
	mov r3, ip
	ldrh r1, [r3, #0x36]
	movs r4, #0x36
	ldrsh r0, [r3, r4]
	cmp r0, #0
	ble _08080C16
	subs r0, r1, #1
	strh r0, [r3, #0x36]
	b _08080D1C
_08080C16:
	mov r5, ip
	ldrh r0, [r5, #0x34]
	strh r0, [r5, #0x36]
	movs r6, #0x2a
	ldrsh r0, [r5, r6]
	cmp r0, #1
	beq _08080C60
	cmp r0, #1
	bgt _08080C2E
	cmp r0, #0
	beq _08080C34
	b _08080CB8
_08080C2E:
	cmp r0, #2
	beq _08080C8C
	b _08080CB8
_08080C34:
	ldr r2, _08080C5C  @ gUnknown_082058F8
	mov r1, ip
	adds r1, #0x38
	ldrb r0, [r1]
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	mov r3, ip
	strh r0, [r3, #0x30]
	ldrb r0, [r1]
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r0, [r0, #1]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	strh r0, [r3, #0x32]
	b _08080CE2
	.align 2, 0
_08080C5C: .4byte gUnknown_082058F8
_08080C60:
	ldr r2, _08080C88  @ gUnknown_08205918
	mov r1, ip
	adds r1, #0x38
	ldrb r0, [r1]
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	mov r4, ip
	strh r0, [r4, #0x30]
	ldrb r0, [r1]
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r0, [r0, #1]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	strh r0, [r4, #0x32]
	b _08080CE2
	.align 2, 0
_08080C88: .4byte gUnknown_08205918
_08080C8C:
	ldr r2, _08080CB4  @ gUnknown_08205938
	mov r1, ip
	adds r1, #0x38
	ldrb r0, [r1]
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	mov r5, ip
	strh r0, [r5, #0x30]
	ldrb r0, [r1]
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r0, [r0, #1]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	strh r0, [r5, #0x32]
	b _08080CE2
	.align 2, 0
_08080CB4: .4byte gUnknown_08205938
_08080CB8:
	ldr r3, _08080D24  @ gUnknown_08205918
	mov r1, ip
	adds r1, #0x38
	ldrb r0, [r1]
	lsls r0, r0, #2
	adds r0, r0, r3
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	mov r6, ip
	ldrh r2, [r6, #0x2a]
	muls r0, r2, r0
	strh r0, [r6, #0x30]
	ldrb r0, [r1]
	lsls r0, r0, #2
	adds r0, r0, r3
	ldrb r0, [r0, #1]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	muls r0, r2, r0
	strh r0, [r6, #0x32]
_08080CE2:
	adds r4, r1, #0
	ldr r3, _08080D28  @ gBmSt
	mov r0, ip
	ldrh r1, [r0, #0x30]
	ldrh r2, [r0, #0x2c]
	adds r0, r1, r2
	strh r0, [r3, #0xc]
	mov r5, ip
	ldrh r2, [r5, #0x32]
	ldrh r6, [r5, #0x2e]
	adds r0, r2, r6
	strh r0, [r3, #0xe]
	adds r1, #8
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	adds r2, #8
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #2
	bl BG_SetPosition
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	ldrb r0, [r4]
	cmp r0, #8
	blt _08080D1C
	movs r0, #0
	strb r0, [r4]
_08080D1C:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08080D24: .4byte gUnknown_08205918
_08080D28: .4byte gBmSt

	THUMB_FUNC_END sub_8080BD8

	THUMB_FUNC_START New6C_SummonGfx
New6C_SummonGfx: @ 0x08080D2C
	push {r4, r5, lr}
	adds r3, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	ldr r0, _08080D64  @ gUnknown_089A46AC
	adds r1, r3, #0
	bl Proc_StartBlocking
	ldr r2, _08080D68  @ gBmSt
	ldrh r1, [r2, #0xc]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x14
	subs r4, r4, r1
	lsls r4, r4, #1
	adds r4, #1
	lsls r4, r4, #3
	str r4, [r0, #0x30]
	ldrh r1, [r2, #0xe]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x14
	subs r5, r5, r1
	lsls r5, r5, #1
	adds r5, #1
	lsls r5, r5, #3
	str r5, [r0, #0x34]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08080D64: .4byte gUnknown_089A46AC
_08080D68: .4byte gBmSt

	THUMB_FUNC_END New6C_SummonGfx

	THUMB_FUNC_START sub_8080D6C
sub_8080D6C: @ 0x08080D6C
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SetDefaultMapAnimScreenConf
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	ldr r4, _08080DC0  @ gUnknown_089E714C
	movs r0, #2
	bl GetBackgroundTileDataOffset
	adds r1, r0, #0
	ldr r0, _08080DC4  @ 0x06002C00
	adds r1, r1, r0
	adds r0, r4, #0
	bl Decompress
	ldr r0, _08080DC8  @ gUnknown_089E7DEC
	movs r1, #0x80
	movs r2, #0x20
	bl CopyToPaletteBuffer
	movs r0, #1
	movs r1, #0x10
	movs r2, #0x10
	movs r3, #0
	bl SetBlendConfig
	adds r0, r5, #0
	adds r0, #0x40
	movs r1, #0
	strh r1, [r0]
	adds r5, #0x42
	strh r1, [r5]
	bl EnablePaletteSync
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08080DC0: .4byte gUnknown_089E714C
_08080DC4: .4byte 0x06002C00
_08080DC8: .4byte gUnknown_089E7DEC

	THUMB_FUNC_END sub_8080D6C

	THUMB_FUNC_START sub_8080DCC
sub_8080DCC: @ 0x08080DCC
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r0, #0x42
	ldrh r0, [r0]
	cmp r0, #0
	bne _08080E62
	adds r0, r4, #0
	adds r0, #0x40
	ldrh r1, [r0]
	adds r5, r0, #0
	cmp r1, #0
	bne _08080DF4
	ldr r0, _08080DF0  @ 0x000003BF
	ldr r1, [r4, #0x30]
	bl PlaySeSpacial
	b _08080E0E
	.align 2, 0
_08080DF0: .4byte 0x000003BF
_08080DF4:
	cmp r1, #0xc
	bne _08080E02
	bl RefreshEntityBmMaps
	bl RefreshUnitSprites
	b _08080E0E
_08080E02:
	cmp r1, #0x11
	bls _08080E0E
	adds r0, r4, #0
	bl Proc_Break
	b _08080E6C
_08080E0E:
	ldr r0, _08080E74  @ gUnknown_089A4664
	ldrh r1, [r5]
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r0, [r1]
	ldr r6, _08080E78  @ gGenericBuffer
	adds r1, r6, #0
	bl Decompress
	ldr r1, _08080E7C  @ gBG2TilemapBuffer
	ldr r0, [r4, #0x30]
	cmp r0, #0
	bge _08080E2A
	adds r0, #7
_08080E2A:
	asrs r0, r0, #3
	subs r0, #4
	lsls r0, r0, #0x10
	asrs r2, r0, #0x10
	ldr r3, [r4, #0x34]
	cmp r3, #0
	bge _08080E3A
	adds r3, #7
_08080E3A:
	asrs r3, r3, #3
	subs r3, #6
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	ldr r0, _08080E80  @ 0x00004160
	str r0, [sp]
	adds r0, r1, #0
	adds r1, r6, #0
	bl AddAttr2dBitMap
	movs r0, #4
	bl BG_EnableSyncByMask
	ldrh r0, [r5]
	adds r0, #1
	strh r0, [r5]
	adds r1, r4, #0
	adds r1, #0x42
	movs r0, #4
	strh r0, [r1]
_08080E62:
	adds r1, r4, #0
	adds r1, #0x42
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
_08080E6C:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08080E74: .4byte gUnknown_089A4664
_08080E78: .4byte gGenericBuffer
_08080E7C: .4byte gBG2TilemapBuffer
_08080E80: .4byte 0x00004160

	THUMB_FUNC_END sub_8080DCC

	THUMB_FUNC_START sub_8080E84
sub_8080E84: @ 0x08080E84
	push {lr}
	ldr r0, _08080E98  @ gBG2TilemapBuffer
	movs r1, #0
	bl BG_Fill
	movs r0, #4
	bl BG_EnableSyncByMask
	pop {r0}
	bx r0
	.align 2, 0
_08080E98: .4byte gBG2TilemapBuffer

	THUMB_FUNC_END sub_8080E84

	THUMB_FUNC_START sub_8080E9C
sub_8080E9C: @ 0x08080E9C
	push {r4, lr}
	adds r2, r0, #0
	adds r4, r1, #0
	ldr r0, _08080EDC  @ gUnknown_089A46DC
	adds r1, r2, #0
	bl Proc_StartBlocking
	str r4, [r0, #0x2c]
	movs r2, #0x10
	ldrsb r2, [r4, r2]
	ldr r3, _08080EE0  @ gBmSt
	ldrh r1, [r3, #0xc]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x14
	subs r2, r2, r1
	lsls r2, r2, #1
	adds r2, #1
	lsls r2, r2, #3
	str r2, [r0, #0x30]
	movs r2, #0x11
	ldrsb r2, [r4, r2]
	ldrh r1, [r3, #0xe]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x14
	subs r2, r2, r1
	lsls r2, r2, #1
	adds r2, #1
	lsls r2, r2, #3
	str r2, [r0, #0x34]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08080EDC: .4byte gUnknown_089A46DC
_08080EE0: .4byte gBmSt

	THUMB_FUNC_END sub_8080E9C

	THUMB_FUNC_START sub_8080EE4
sub_8080EE4: @ 0x08080EE4
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SetDefaultMapAnimScreenConf
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	ldr r4, _08080F38  @ gUnknown_089E714C
	movs r0, #2
	bl GetBackgroundTileDataOffset
	adds r1, r0, #0
	ldr r0, _08080F3C  @ 0x06002C00
	adds r1, r1, r0
	adds r0, r4, #0
	bl Decompress
	ldr r0, _08080F40  @ gUnknown_089E7DEC
	movs r1, #0x80
	movs r2, #0x20
	bl CopyToPaletteBuffer
	movs r0, #1
	movs r1, #0x10
	movs r2, #0x10
	movs r3, #0
	bl SetBlendConfig
	adds r0, r5, #0
	adds r0, #0x40
	movs r1, #0
	strh r1, [r0]
	adds r5, #0x42
	strh r1, [r5]
	bl EnablePaletteSync
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08080F38: .4byte gUnknown_089E714C
_08080F3C: .4byte 0x06002C00
_08080F40: .4byte gUnknown_089E7DEC

	THUMB_FUNC_END sub_8080EE4

	THUMB_FUNC_START sub_8080F44
sub_8080F44: @ 0x08080F44
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r0, #0x42
	ldrh r0, [r0]
	cmp r0, #0
	bne _08080FE6
	adds r0, r4, #0
	adds r0, #0x40
	ldrh r1, [r0]
	adds r5, r0, #0
	cmp r1, #0
	bne _08080F6C
	ldr r0, _08080F68  @ 0x000003BF
	ldr r1, [r4, #0x30]
	bl PlaySeSpacial
	b _08080F92
	.align 2, 0
_08080F68: .4byte 0x000003BF
_08080F6C:
	cmp r1, #0xc
	bne _08080F86
	ldr r0, [r4, #0x2c]
	ldr r1, [r0, #0xc]
	movs r2, #2
	negs r2, r2
	ands r1, r2
	str r1, [r0, #0xc]
	bl RefreshEntityBmMaps
	bl RefreshUnitSprites
	b _08080F92
_08080F86:
	cmp r1, #0x11
	bls _08080F92
	adds r0, r4, #0
	bl Proc_Break
	b _08080FF0
_08080F92:
	ldr r0, _08080FF8  @ gUnknown_089A4664
	ldrh r1, [r5]
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r0, [r1]
	ldr r6, _08080FFC  @ gGenericBuffer
	adds r1, r6, #0
	bl Decompress
	ldr r1, _08081000  @ gBG2TilemapBuffer
	ldr r0, [r4, #0x30]
	cmp r0, #0
	bge _08080FAE
	adds r0, #7
_08080FAE:
	asrs r0, r0, #3
	subs r0, #4
	lsls r0, r0, #0x10
	asrs r2, r0, #0x10
	ldr r3, [r4, #0x34]
	cmp r3, #0
	bge _08080FBE
	adds r3, #7
_08080FBE:
	asrs r3, r3, #3
	subs r3, #6
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	ldr r0, _08081004  @ 0x00004160
	str r0, [sp]
	adds r0, r1, #0
	adds r1, r6, #0
	bl AddAttr2dBitMap
	movs r0, #4
	bl BG_EnableSyncByMask
	ldrh r0, [r5]
	adds r0, #1
	strh r0, [r5]
	adds r1, r4, #0
	adds r1, #0x42
	movs r0, #4
	strh r0, [r1]
_08080FE6:
	adds r1, r4, #0
	adds r1, #0x42
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
_08080FF0:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08080FF8: .4byte gUnknown_089A4664
_08080FFC: .4byte gGenericBuffer
_08081000: .4byte gBG2TilemapBuffer
_08081004: .4byte 0x00004160

	THUMB_FUNC_END sub_8080F44

	THUMB_FUNC_START sub_8081008
sub_8081008: @ 0x08081008
	push {lr}
	ldr r0, _0808101C  @ gBG2TilemapBuffer
	movs r1, #0
	bl BG_Fill
	movs r0, #4
	bl BG_EnableSyncByMask
	pop {r0}
	bx r0
	.align 2, 0
_0808101C: .4byte gBG2TilemapBuffer

	THUMB_FUNC_END sub_8081008

	THUMB_FUNC_START StartGlowingCross
StartGlowingCross: @ 0x08081020
	push {r4, lr}
	adds r2, r0, #0
	adds r4, r1, #0
	ldr r0, _08081060  @ ProcScr_GlowingCross
	adds r1, r2, #0
	bl Proc_Start
	str r4, [r0, #0x2c]
	movs r2, #0x10
	ldrsb r2, [r4, r2]
	ldr r3, _08081064  @ gBmSt
	ldrh r1, [r3, #0xc]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x14
	subs r2, r2, r1
	lsls r2, r2, #1
	adds r2, #1
	lsls r2, r2, #3
	str r2, [r0, #0x30]
	movs r2, #0x11
	ldrsb r2, [r4, r2]
	ldrh r1, [r3, #0xe]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x14
	subs r2, r2, r1
	lsls r2, r2, #1
	adds r2, #1
	lsls r2, r2, #3
	str r2, [r0, #0x34]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08081060: .4byte ProcScr_GlowingCross
_08081064: .4byte gBmSt

	THUMB_FUNC_END StartGlowingCross

	THUMB_FUNC_START RemoveGlowingCrossDirectly
RemoveGlowingCrossDirectly: @ 0x08081068
	push {lr}
	ldr r0, _08081074  @ ProcScr_GlowingCross
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
_08081074: .4byte ProcScr_GlowingCross

	THUMB_FUNC_END RemoveGlowingCrossDirectly

	THUMB_FUNC_START sub_8081078
sub_8081078: @ 0x08081078
	push {r4, r5, lr}
	adds r5, r0, #0
	bl SetDefaultMapAnimScreenConf
	ldr r2, _080810F0  @ gLCDControlBuffer
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
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	ldr r4, _080810F4  @ gUnknown_089E714C
	movs r0, #2
	bl GetBackgroundTileDataOffset
	adds r1, r0, #0
	ldr r0, _080810F8  @ 0x06002C00
	adds r1, r1, r0
	adds r0, r4, #0
	bl Decompress
	ldr r0, _080810FC  @ gUnknown_089E7DEC
	movs r1, #0x80
	movs r2, #0x20
	bl CopyToPaletteBuffer
	movs r0, #1
	movs r1, #0x10
	movs r2, #0x10
	movs r3, #0
	bl SetBlendConfig
	adds r0, r5, #0
	adds r0, #0x40
	movs r1, #0
	strh r1, [r0]
	adds r5, #0x42
	strh r1, [r5]
	bl EnablePaletteSync
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080810F0: .4byte gLCDControlBuffer
_080810F4: .4byte gUnknown_089E714C
_080810F8: .4byte 0x06002C00
_080810FC: .4byte gUnknown_089E7DEC

	THUMB_FUNC_END sub_8081078

	THUMB_FUNC_START sub_8081100
sub_8081100: @ 0x08081100
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r0, #0x42
	ldrh r0, [r0]
	cmp r0, #0
	bne _08081188
	adds r0, r4, #0
	adds r0, #0x40
	ldrh r1, [r0]
	adds r5, r0, #0
	cmp r1, #0
	bne _08081128
	ldr r0, _08081124  @ 0x000003BF
	ldr r1, [r4, #0x30]
	bl PlaySeSpacial
	b _08081134
	.align 2, 0
_08081124: .4byte 0x000003BF
_08081128:
	cmp r1, #9
	bls _08081134
	adds r0, r4, #0
	bl Proc_Break
	b _08081192
_08081134:
	ldr r0, _0808119C  @ gUnknown_089A4664
	ldrh r1, [r5]
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r0, [r1]
	ldr r6, _080811A0  @ gGenericBuffer
	adds r1, r6, #0
	bl Decompress
	ldr r1, _080811A4  @ gBG2TilemapBuffer
	ldr r0, [r4, #0x30]
	cmp r0, #0
	bge _08081150
	adds r0, #7
_08081150:
	asrs r0, r0, #3
	subs r0, #4
	lsls r0, r0, #0x10
	asrs r2, r0, #0x10
	ldr r3, [r4, #0x34]
	cmp r3, #0
	bge _08081160
	adds r3, #7
_08081160:
	asrs r3, r3, #3
	subs r3, #6
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	ldr r0, _080811A8  @ 0x00004160
	str r0, [sp]
	adds r0, r1, #0
	adds r1, r6, #0
	bl AddAttr2dBitMap
	movs r0, #4
	bl BG_EnableSyncByMask
	ldrh r0, [r5]
	adds r0, #1
	strh r0, [r5]
	adds r1, r4, #0
	adds r1, #0x42
	movs r0, #4
	strh r0, [r1]
_08081188:
	adds r1, r4, #0
	adds r1, #0x42
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
_08081192:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0808119C: .4byte gUnknown_089A4664
_080811A0: .4byte gGenericBuffer
_080811A4: .4byte gBG2TilemapBuffer
_080811A8: .4byte 0x00004160

	THUMB_FUNC_END sub_8081100

	THUMB_FUNC_START sub_80811AC
sub_80811AC: @ 0x080811AC
	push {lr}
	bl DeleteAllPaletteAnimator
	ldr r2, _080811CC  @ gLCDControlBuffer
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
	pop {r0}
	bx r0
	.align 2, 0
_080811CC: .4byte gLCDControlBuffer

	THUMB_FUNC_END sub_80811AC

	THUMB_FUNC_START RemoveGlowingCrossDirectlyWithAnim
RemoveGlowingCrossDirectlyWithAnim: @ 0x080811D0
	push {r4, lr}
	adds r2, r0, #0
	adds r4, r1, #0
	ldr r0, _080811E8  @ ProcScr_GlowCrossExit
	adds r1, r2, #0
	bl Proc_StartBlocking
	adds r0, #0x42
	strh r4, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080811E8: .4byte ProcScr_GlowCrossExit

	THUMB_FUNC_END RemoveGlowingCrossDirectlyWithAnim

	THUMB_FUNC_START sub_80811EC
sub_80811EC: @ 0x080811EC
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #1
	movs r1, #0x10
	movs r2, #0x10
	movs r3, #0
	bl SetBlendConfig
	adds r4, #0x40
	movs r0, #0
	strh r0, [r4]
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80811EC

	THUMB_FUNC_START sub_8081208
sub_8081208: @ 0x08081208
	push {r4, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x40
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	adds r2, r4, #0
	adds r2, #0x42
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r3, [r2]
	cmp r0, r3
	bcs _08081242
	ldrh r0, [r1]
	lsls r0, r0, #4
	ldrh r1, [r2]
	bl __divsi3
	movs r1, #0x10
	subs r1, r1, r0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	movs r0, #1
	movs r2, #0x10
	movs r3, #0
	bl SetBlendConfig
	b _08081254
_08081242:
	movs r0, #1
	movs r1, #0
	movs r2, #0x10
	movs r3, #0
	bl SetBlendConfig
	adds r0, r4, #0
	bl Proc_Break
_08081254:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8081208

	THUMB_FUNC_START nullsub_58
nullsub_58: @ 0x0808125C
	bx lr

	THUMB_FUNC_END nullsub_58

.align 2, 0
