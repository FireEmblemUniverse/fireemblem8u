	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	THUMB_FUNC_START sub_807CDD0
sub_807CDD0: @ 0x0807CDD0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0807CE10  @ gUnknown_089A398C
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x2c]
	movs r2, #0x10
	ldrsb r2, [r4, r2]
	ldr r3, _0807CE14  @ gBmSt
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
_0807CE10: .4byte gUnknown_089A398C
_0807CE14: .4byte gBmSt

	THUMB_FUNC_END sub_807CDD0

	THUMB_FUNC_START sub_807CE18
sub_807CE18: @ 0x0807CE18
	push {r4, r5, lr}
	adds r5, r0, #0
	bl sub_807E978
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	ldr r4, _0807CE6C  @ gUnknown_089B7610
	movs r0, #2
	bl GetBackgroundTileDataOffset
	adds r1, r0, #0
	ldr r0, _0807CE70  @ 0x06002C00
	adds r1, r1, r0
	adds r0, r4, #0
	bl Decompress
	ldr r0, _0807CE74  @ gUnknown_089B80C4
	movs r1, #0x80
	movs r2, #0x20
	bl CopyToPaletteBuffer
	movs r0, #1
	movs r1, #0x10
	movs r2, #0x10
	movs r3, #0
	bl SetSpecialColorEffectsParameters
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
_0807CE6C: .4byte gUnknown_089B7610
_0807CE70: .4byte 0x06002C00
_0807CE74: .4byte gUnknown_089B80C4

	THUMB_FUNC_END sub_807CE18

	THUMB_FUNC_START sub_807CE78
sub_807CE78: @ 0x0807CE78
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r0, #0x42
	ldrh r0, [r0]
	cmp r0, #0
	bne _0807CF0C
	adds r0, r4, #0
	adds r0, #0x40
	ldrh r1, [r0]
	adds r5, r0, #0
	cmp r1, #0
	bne _0807CEA0
	ldr r0, _0807CE9C  @ 0x000003CA
	ldr r1, [r4, #0x30]
	bl PlaySeSpacial
	b _0807CEB8
	.align 2, 0
_0807CE9C: .4byte 0x000003CA
_0807CEA0:
	cmp r1, #1
	bne _0807CEAC
	adds r0, r4, #0
	bl sub_807CF30
	b _0807CEB8
_0807CEAC:
	cmp r1, #6
	bls _0807CEB8
	adds r0, r4, #0
	bl Proc_Break
	b _0807CF16
_0807CEB8:
	ldr r0, _0807CF20  @ gUnknown_089A39C4
	ldrh r1, [r5]
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r0, [r1]
	ldr r6, _0807CF24  @ gGenericBuffer
	adds r1, r6, #0
	bl Decompress
	ldr r1, _0807CF28  @ gBG2TilemapBuffer
	ldr r0, [r4, #0x30]
	cmp r0, #0
	bge _0807CED4
	adds r0, #7
_0807CED4:
	asrs r0, r0, #3
	subs r0, #8
	lsls r0, r0, #0x10
	asrs r2, r0, #0x10
	ldr r3, [r4, #0x34]
	cmp r3, #0
	bge _0807CEE4
	adds r3, #7
_0807CEE4:
	asrs r3, r3, #3
	subs r3, #7
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	ldr r0, _0807CF2C  @ 0x00004160
	str r0, [sp]
	adds r0, r1, #0
	adds r1, r6, #0
	bl sub_800159C
	movs r0, #4
	bl BG_EnableSyncByMask
	ldrh r0, [r5]
	adds r0, #1
	strh r0, [r5]
	adds r1, r4, #0
	adds r1, #0x42
	movs r0, #5
	strh r0, [r1]
_0807CF0C:
	adds r1, r4, #0
	adds r1, #0x42
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
_0807CF16:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807CF20: .4byte gUnknown_089A39C4
_0807CF24: .4byte gGenericBuffer
_0807CF28: .4byte gBG2TilemapBuffer
_0807CF2C: .4byte 0x00004160

	THUMB_FUNC_END sub_807CE78

	THUMB_FUNC_START sub_807CF30
sub_807CF30: @ 0x0807CF30
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	bl AdvanceGetLCGRNValue
	movs r1, #0x65
	bl DivRem
	ldr r1, [r7, #0x2c]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	ldrb r1, [r1, #0x11]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl GetTrapAt
	movs r1, #1
	mov ip, r1
	cmp r0, #0
	beq _0807CF5A
	ldrb r0, [r0, #7]
	mov ip, r0
_0807CF5A:
	ldr r2, _0807CF8C  @ gUnknown_03001C68
	movs r1, #0
	movs r0, #0xba
	strb r0, [r2]
	movs r0, #0x61
	strb r0, [r2, #1]
	strb r1, [r2, #2]
	ldrb r1, [r2, #3]
	movs r0, #1
	adds r3, r1, #0
	orrs r3, r0
	strb r3, [r2, #3]
	ldr r1, [r7, #0x2c]
	movs r4, #0xb
	ldrsb r4, [r1, r4]
	movs r0, #0xc0
	ands r4, r0
	adds r6, r1, #0
	adds r5, r2, #0
	cmp r4, #0
	bne _0807CF90
	subs r0, #0xc7
	ands r3, r0
	b _0807CFAC
	.align 2, 0
_0807CF8C: .4byte gUnknown_03001C68
_0807CF90:
	cmp r4, #0x80
	bne _0807CF9E
	movs r0, #7
	negs r0, r0
	ands r3, r0
	movs r0, #4
	b _0807CFAA
_0807CF9E:
	cmp r4, #0x40
	bne _0807CFAE
	movs r0, #7
	negs r0, r0
	ands r3, r0
	movs r0, #2
_0807CFAA:
	orrs r3, r0
_0807CFAC:
	strb r3, [r5, #3]
_0807CFAE:
	mov r0, ip
	lsls r2, r0, #3
	ldrb r1, [r5, #3]
	movs r0, #7
	ands r0, r1
	orrs r0, r2
	strb r0, [r5, #3]
	movs r0, #0x3f
	ldrb r1, [r6, #0x10]
	ands r1, r0
	ldrb r2, [r5, #4]
	movs r0, #0x40
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r5, #4]
	movs r1, #0x11
	ldrsb r1, [r6, r1]
	movs r0, #0x3f
	ands r1, r0
	lsls r1, r1, #6
	ldrh r2, [r5, #4]
	ldr r0, _0807D094  @ 0xFFFFF03F
	ands r0, r2
	orrs r0, r1
	strh r0, [r5, #4]
	movs r0, #0
	strb r0, [r5, #7]
	str r0, [r5, #8]
	ldrb r1, [r5, #5]
	subs r0, #0x11
	ands r0, r1
	movs r1, #0x21
	negs r1, r1
	ands r0, r1
	strb r0, [r5, #5]
	movs r2, #0
	adds r3, r5, #0
	adds r3, #0xc
	movs r1, #0
_0807CFFE:
	adds r0, r2, r3
	strb r1, [r0]
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #3
	bls _0807CFFE
	movs r2, #0
	ldr r4, _0807D098  @ gUnknown_03001C74
_0807D010:
	ldr r0, [r7, #0x2c]
	adds r3, r2, #1
	lsls r1, r3, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r1, [r0]
	cmp r1, #0
	beq _0807D024
	adds r0, r2, r4
	strb r1, [r0]
_0807D024:
	lsls r0, r3, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #3
	bls _0807D010
	ldr r0, [r7, #0x2c]
	ldr r1, [r0, #0xc]
	movs r2, #0x80
	lsls r2, r2, #5
	ands r1, r2
	adds r6, r0, #0
	cmp r1, #0
	beq _0807D044
	ldrb r0, [r5, #5]
	movs r1, #0x20
	orrs r0, r1
	strb r0, [r5, #5]
_0807D044:
	adds r0, r6, #0
	adds r0, #0x42
	ldrb r0, [r0]
	strb r0, [r5, #0x10]
	adds r0, r6, #0
	adds r0, #0x44
	ldrb r0, [r0]
	strb r0, [r5, #0x11]
	adds r0, r6, #0
	adds r0, #0x43
	ldrb r0, [r0]
	strb r0, [r5, #0x12]
	movs r0, #0
	strb r0, [r5, #0x13]
	adds r0, r5, #0
	bl LoadUnits
	movs r0, #0xba
	bl GetUnitFromCharId
	ldr r0, [r7, #0x2c]
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetUnit
	bl ClearUnit
	bl RefreshEntityBmMaps
	bl RenderBmMap
	bl RefreshUnitSprites
	bl MU_EndAll
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807D094: .4byte 0xFFFFF03F
_0807D098: .4byte gUnknown_03001C74

	THUMB_FUNC_END sub_807CF30

	THUMB_FUNC_START sub_807D09C
sub_807D09C: @ 0x0807D09C
	push {lr}
	ldr r0, _0807D0B0  @ gBG2TilemapBuffer
	movs r1, #0
	bl BG_Fill
	movs r0, #4
	bl BG_EnableSyncByMask
	pop {r0}
	bx r0
	.align 2, 0
_0807D0B0: .4byte gBG2TilemapBuffer

	THUMB_FUNC_END sub_807D09C

	THUMB_FUNC_START sub_807D0B4
sub_807D0B4: @ 0x0807D0B4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0807D0F4  @ gUnknown_089A39E0
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x2c]
	movs r2, #0x10
	ldrsb r2, [r4, r2]
	ldr r3, _0807D0F8  @ gBmSt
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
_0807D0F4: .4byte gUnknown_089A39E0
_0807D0F8: .4byte gBmSt

	THUMB_FUNC_END sub_807D0B4

	THUMB_FUNC_START sub_807D0FC
sub_807D0FC: @ 0x0807D0FC
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	bl sub_807E978
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	ldr r4, _0807D188  @ gUnknown_089AF950
	movs r0, #2
	bl GetBackgroundTileDataOffset
	adds r1, r0, #0
	ldr r0, _0807D18C  @ 0x06002C00
	adds r1, r1, r0
	adds r0, r4, #0
	bl Decompress
	movs r0, #1
	movs r1, #0x10
	movs r2, #0x10
	movs r3, #0
	bl SetSpecialColorEffectsParameters
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
	bl sub_8001F64
	adds r0, r5, #0
	adds r0, #0x40
	strh r4, [r0]
	adds r0, #2
	strh r4, [r0]
	ldr r0, _0807D190  @ gManimSt
	ldr r0, [r0, #4]
	adds r0, #0x4a
	ldrh r0, [r0]
	bl GetItemIndex
	cmp r0, #0x8c
	bne _0807D198
	ldr r0, _0807D194  @ gUnknown_089AFFB8
	str r5, [sp]
	movs r1, #0x80
	movs r2, #0x20
	movs r3, #2
	bl sub_80144CC
	b _0807D1A6
	.align 2, 0
_0807D188: .4byte gUnknown_089AF950
_0807D18C: .4byte 0x06002C00
_0807D190: .4byte gManimSt
_0807D194: .4byte gUnknown_089AFFB8
_0807D198:
	ldr r0, _0807D1B0  @ gUnknown_089AFF78
	str r5, [sp]
	movs r1, #0x80
	movs r2, #0x20
	movs r3, #2
	bl sub_80144CC
_0807D1A6:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807D1B0: .4byte gUnknown_089AFF78

	THUMB_FUNC_END sub_807D0FC

	THUMB_FUNC_START sub_807D1B4
sub_807D1B4: @ 0x0807D1B4
	push {r4, r5, lr}
	sub sp, #8
	adds r5, r0, #0
	adds r4, r5, #0
	adds r4, #0x42
	ldrh r0, [r4]
	cmp r0, #2
	bls _0807D268
	bl DeleteAllPaletteAnimator
	ldr r4, _0807D1F8  @ gUnknown_089AFF78
	str r5, [sp]
	adds r0, r4, #0
	movs r1, #0x80
	movs r2, #0x20
	movs r3, #4
	bl NewPaletteAnimator_
	ldr r0, _0807D1FC  @ gManimSt
	ldr r0, [r0, #4]
	adds r0, #0x4a
	ldrh r0, [r0]
	bl GetItemIndex
	cmp r0, #0x8c
	bne _0807D204
	ldr r0, _0807D200  @ gUnknown_089AFFB8
	str r5, [sp]
	movs r1, #0x80
	movs r2, #0x20
	movs r3, #4
	bl NewPaletteAnimator_
	b _0807D212
	.align 2, 0
_0807D1F8: .4byte gUnknown_089AFF78
_0807D1FC: .4byte gManimSt
_0807D200: .4byte gUnknown_089AFFB8
_0807D204:
	str r5, [sp]
	adds r0, r4, #0
	movs r1, #0x80
	movs r2, #0x20
	movs r3, #4
	bl NewPaletteAnimator_
_0807D212:
	ldr r4, _0807D260  @ gUnknown_089AFFF8
	movs r0, #2
	bl GetBackgroundTileDataOffset
	adds r1, r0, #0
	ldr r0, _0807D264  @ 0x06002C00
	adds r1, r1, r0
	adds r0, r4, #0
	bl Decompress
	ldr r0, [r5, #0x30]
	cmp r0, #0
	bge _0807D22E
	adds r0, #7
_0807D22E:
	asrs r0, r0, #3
	subs r2, r0, #4
	ldr r1, [r5, #0x34]
	cmp r1, #0
	bge _0807D23A
	adds r1, #7
_0807D23A:
	asrs r1, r1, #3
	subs r1, #4
	movs r0, #0
	str r0, [sp]
	str r5, [sp, #4]
	adds r0, r2, #0
	movs r2, #8
	movs r3, #0x3c
	bl sub_807D360
	adds r0, r5, #0
	bl Proc_Break
	ldr r1, [r5, #0x30]
	movs r0, #0x8c
	bl PlaySeSpacial
	b _0807D2BA
	.align 2, 0
_0807D260: .4byte gUnknown_089AFFF8
_0807D264: .4byte 0x06002C00
_0807D268:
	ldr r0, _0807D2C4  @ gUnknown_089A3A18
	ldrh r1, [r4]
	lsls r2, r1, #2
	adds r2, r2, r0
	movs r3, #0
	ldrsh r2, [r2, r3]
	lsls r1, r1, #1
	adds r1, #1
	lsls r1, r1, #1
	adds r1, r1, r0
	movs r0, #0
	ldrsh r3, [r1, r0]
	ldr r0, [r5, #0x30]
	cmp r0, #0
	bge _0807D288
	adds r0, #7
_0807D288:
	asrs r0, r0, #3
	adds r0, r0, r2
	subs r2, r0, #3
	ldr r1, [r5, #0x34]
	cmp r1, #0
	bge _0807D296
	adds r1, #7
_0807D296:
	asrs r1, r1, #3
	adds r1, r1, r3
	subs r1, #3
	movs r0, #8
	str r0, [sp]
	str r5, [sp, #4]
	adds r0, r2, #0
	movs r2, #6
	movs r3, #0xa
	bl sub_807D360
	ldr r1, [r5, #0x30]
	movs r0, #0x89
	bl PlaySeSpacial
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
_0807D2BA:
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807D2C4: .4byte gUnknown_089A3A18

	THUMB_FUNC_END sub_807D1B4

	THUMB_FUNC_START sub_807D2C8
sub_807D2C8: @ 0x0807D2C8
	push {lr}
	ldr r0, _0807D2DC  @ gBG2TilemapBuffer
	movs r1, #0
	bl BG_Fill
	movs r0, #4
	bl BG_EnableSyncByMask
	pop {r0}
	bx r0
	.align 2, 0
_0807D2DC: .4byte gBG2TilemapBuffer

	THUMB_FUNC_END sub_807D2C8

	THUMB_FUNC_START sub_807D2E0
sub_807D2E0: @ 0x0807D2E0
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	bl DeleteAllPaletteAnimator
	ldr r0, _0807D324  @ gBG2TilemapBuffer
	movs r1, #0
	bl BG_Fill
	movs r0, #4
	bl BG_EnableSyncByMask
	movs r0, #1
	str r0, [sp]
	movs r1, #1
	movs r2, #1
	movs r3, #1
	bl SetBlendTargetA
	movs r0, #1
	bl SetBlendBackdropA
	adds r1, r4, #0
	adds r1, #0x64
	movs r0, #0x40
	strh r0, [r1]
	adds r0, r4, #0
	bl sub_807D328
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807D324: .4byte gBG2TilemapBuffer

	THUMB_FUNC_END sub_807D2E0

	THUMB_FUNC_START sub_807D328
sub_807D328: @ 0x0807D328
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r5, #0
	adds r4, #0x64
	ldrh r3, [r4]
	subs r0, r3, #1
	strh r0, [r4]
	lsls r3, r3, #0x10
	asrs r3, r3, #0x12
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl SetSpecialColorEffectsParameters
	movs r1, #0
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _0807D35A
	bl SetDefaultColorEffects
	adds r0, r5, #0
	bl Proc_Break
_0807D35A:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_807D328

	THUMB_FUNC_START sub_807D360
sub_807D360: @ 0x0807D360
	push {r4, r5, r6, lr}
	mov r6, r9
	mov r5, r8
	push {r5, r6}
	adds r5, r0, #0
	adds r6, r1, #0
	mov r8, r2
	mov r9, r3
	ldr r4, [sp, #0x18]
	ldr r1, [sp, #0x1c]
	ldr r0, _0807D398  @ gUnknown_089A3A40
	bl Proc_StartBlocking
	str r5, [r0, #0x2c]
	str r6, [r0, #0x30]
	mov r1, r8
	str r1, [r0, #0x54]
	str r4, [r0, #0x58]
	adds r0, #0x44
	mov r1, r9
	strh r1, [r0]
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807D398: .4byte gUnknown_089A3A40

	THUMB_FUNC_END sub_807D360

	THUMB_FUNC_START sub_807D39C
sub_807D39C: @ 0x0807D39C
	push {lr}
	ldr r0, _0807D3B0  @ gBG2TilemapBuffer
	movs r1, #0
	bl BG_Fill
	movs r0, #4
	bl BG_EnableSyncByMask
	pop {r0}
	bx r0
	.align 2, 0
_0807D3B0: .4byte gBG2TilemapBuffer

	THUMB_FUNC_END sub_807D39C

	THUMB_FUNC_START sub_807D3B4
sub_807D3B4: @ 0x0807D3B4
	push {lr}
	ldr r0, _0807D3C8  @ gBG2TilemapBuffer
	movs r1, #0
	bl BG_Fill
	movs r0, #4
	bl BG_EnableSyncByMask
	pop {r0}
	bx r0
	.align 2, 0
_0807D3C8: .4byte gBG2TilemapBuffer

	THUMB_FUNC_END sub_807D3B4

	THUMB_FUNC_START sub_807D3CC
sub_807D3CC: @ 0x0807D3CC
	push {r4, r5, lr}
	sub sp, #8
	adds r5, r0, #0
	ldr r0, _0807D404  @ gBG2TilemapBuffer
	ldr r1, [r5, #0x2c]
	ldr r2, [r5, #0x30]
	ldr r3, _0807D408  @ 0x00004160
	ldr r4, [r5, #0x54]
	str r4, [sp]
	str r4, [sp, #4]
	bl sub_8014560
	movs r0, #4
	bl BG_EnableSyncByMask
	movs r0, #1
	movs r1, #0
	movs r2, #0x10
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	adds r5, #0x64
	movs r0, #0
	strh r0, [r5]
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807D404: .4byte gBG2TilemapBuffer
_0807D408: .4byte 0x00004160

	THUMB_FUNC_END sub_807D3CC

	THUMB_FUNC_START sub_807D40C
sub_807D40C: @ 0x0807D40C
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r5, #0
	adds r4, #0x64
	ldrh r1, [r4]
	adds r1, #2
	strh r1, [r4]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	movs r0, #1
	movs r2, #0x10
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	movs r1, #0
	ldrsh r0, [r4, r1]
	cmp r0, #7
	ble _0807D43A
	movs r0, #0
	strh r0, [r4]
	adds r0, r5, #0
	bl Proc_Break
_0807D43A:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_807D40C

	THUMB_FUNC_START sub_807D440
sub_807D440: @ 0x0807D440
	push {lr}
	adds r2, r0, #0
	adds r0, #0x44
	ldrh r1, [r0]
	subs r1, #1
	strh r1, [r0]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r0, #1
	negs r0, r0
	cmp r1, r0
	bne _0807D45E
	adds r0, r2, #0
	bl Proc_Break
_0807D45E:
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_807D440

	THUMB_FUNC_START sub_807D464
sub_807D464: @ 0x0807D464
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r0, [r5, #0x58]
	cmp r0, #0
	bne _0807D478
	adds r0, r5, #0
	bl Proc_Break
	b _0807D4C6
_0807D478:
	adds r4, r5, #0
	adds r4, #0x64
	ldrh r3, [r4]
	adds r0, r3, #1
	strh r0, [r4]
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	ldr r0, [r5, #0x58]
	str r0, [sp]
	movs r0, #0
	movs r1, #8
	movs r2, #0
	bl Interpolate
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	movs r0, #1
	movs r2, #0x10
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	movs r0, #0
	ldrsh r1, [r4, r0]
	ldr r0, [r5, #0x58]
	cmp r1, r0
	blt _0807D4C6
	movs r0, #0
	strh r0, [r4]
	ldr r0, _0807D4D0  @ gBG2TilemapBuffer
	movs r1, #0
	bl BG_Fill
	movs r0, #4
	bl BG_EnableSyncByMask
	adds r0, r5, #0
	bl Proc_Break
_0807D4C6:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807D4D0: .4byte gBG2TilemapBuffer

	THUMB_FUNC_END sub_807D464

	THUMB_FUNC_START sub_807D4D4
sub_807D4D4: @ 0x0807D4D4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0807D514  @ gUnknown_089A3A80
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x2c]
	movs r2, #0x10
	ldrsb r2, [r4, r2]
	ldr r3, _0807D518  @ gBmSt
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
_0807D514: .4byte gUnknown_089A3A80
_0807D518: .4byte gBmSt

	THUMB_FUNC_END sub_807D4D4

	THUMB_FUNC_START sub_807D51C
sub_807D51C: @ 0x0807D51C
	push {r4, r5, lr}
	adds r5, r0, #0
	bl sub_807E978
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	ldr r4, _0807D570  @ gUnknown_089B35D0
	movs r0, #2
	bl GetBackgroundTileDataOffset
	adds r1, r0, #0
	ldr r0, _0807D574  @ 0x06002C00
	adds r1, r1, r0
	adds r0, r4, #0
	bl Decompress
	ldr r0, _0807D578  @ gUnknown_089B4BFC
	movs r1, #0x80
	movs r2, #0x20
	bl CopyToPaletteBuffer
	movs r0, #1
	movs r1, #0x10
	movs r2, #0x10
	movs r3, #0
	bl SetSpecialColorEffectsParameters
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
_0807D570: .4byte gUnknown_089B35D0
_0807D574: .4byte 0x06002C00
_0807D578: .4byte gUnknown_089B4BFC

	THUMB_FUNC_END sub_807D51C

	THUMB_FUNC_START sub_807D57C
sub_807D57C: @ 0x0807D57C
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	adds r0, #0x42
	ldrh r0, [r0]
	cmp r0, #0
	bne _0807D64A
	adds r0, r5, #0
	adds r0, #0x40
	ldrh r1, [r0]
	adds r6, r0, #0
	cmp r1, #0
	bne _0807D5A2
	movs r0, #0xe1
	lsls r0, r0, #2
	ldr r1, [r5, #0x30]
	bl PlaySeSpacial
	b _0807D5AE
_0807D5A2:
	cmp r1, #0x21
	bls _0807D5AE
	adds r0, r5, #0
	bl Proc_Break
	b _0807D654
_0807D5AE:
	ldr r0, _0807D5D0  @ gUnknown_0820579C
	ldrh r1, [r6]
	lsls r1, r1, #2
	adds r1, r1, r0
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bge _0807D5D8
	ldr r0, _0807D5D4  @ gBG2TilemapBuffer
	movs r1, #0
	bl BG_Fill
	movs r0, #4
	bl BG_EnableSyncByMask
	b _0807D622
	.align 2, 0
_0807D5D0: .4byte gUnknown_0820579C
_0807D5D4: .4byte gBG2TilemapBuffer
_0807D5D8:
	ldr r0, _0807D65C  @ gUnknown_089A3AB8
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r0, [r1]
	ldr r4, _0807D660  @ gGenericBuffer
	adds r1, r4, #0
	bl Decompress
	ldr r1, _0807D664  @ gBG2TilemapBuffer
	ldr r0, [r5, #0x30]
	cmp r0, #0
	bge _0807D5F8
	adds r0, #7
_0807D5F8:
	asrs r0, r0, #3
	subs r0, #9
	lsls r0, r0, #0x10
	asrs r2, r0, #0x10
	ldr r3, [r5, #0x34]
	cmp r3, #0
	bge _0807D608
	adds r3, #7
_0807D608:
	asrs r3, r3, #3
	subs r3, #9
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	ldr r0, _0807D668  @ 0x00004160
	str r0, [sp]
	adds r0, r1, #0
	adds r1, r4, #0
	bl sub_800159C
	movs r0, #4
	bl BG_EnableSyncByMask
_0807D622:
	ldr r4, _0807D66C  @ gUnknown_0820579C
	ldrh r0, [r6]
	lsls r0, r0, #2
	adds r0, r0, r4
	ldrb r1, [r0, #2]
	movs r0, #1
	movs r2, #0x10
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	ldrh r0, [r6]
	lsls r0, r0, #2
	adds r0, r0, r4
	ldrb r0, [r0, #1]
	adds r1, r5, #0
	adds r1, #0x42
	strh r0, [r1]
	ldrh r0, [r6]
	adds r0, #1
	strh r0, [r6]
_0807D64A:
	adds r1, r5, #0
	adds r1, #0x42
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
_0807D654:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807D65C: .4byte gUnknown_089A3AB8
_0807D660: .4byte gGenericBuffer
_0807D664: .4byte gBG2TilemapBuffer
_0807D668: .4byte 0x00004160
_0807D66C: .4byte gUnknown_0820579C

	THUMB_FUNC_END sub_807D57C

	THUMB_FUNC_START sub_807D670
sub_807D670: @ 0x0807D670
	push {lr}
	ldr r0, _0807D684  @ gBG2TilemapBuffer
	movs r1, #0
	bl BG_Fill
	movs r0, #4
	bl BG_EnableSyncByMask
	pop {r0}
	bx r0
	.align 2, 0
_0807D684: .4byte gBG2TilemapBuffer

	THUMB_FUNC_END sub_807D670

	THUMB_FUNC_START sub_807D688
sub_807D688: @ 0x0807D688
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	ldr r0, _0807D6D0  @ gUnknown_089A3B3C
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x2c]
	movs r2, #0x10
	ldrsb r2, [r4, r2]
	ldr r3, _0807D6D4  @ gBmSt
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
	str r5, [r0, #0x50]
	str r6, [r0, #0x54]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807D6D0: .4byte gUnknown_089A3B3C
_0807D6D4: .4byte gBmSt

	THUMB_FUNC_END sub_807D688

	THUMB_FUNC_START sub_807D6D8
sub_807D6D8: @ 0x0807D6D8
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r1, [r5, #0x30]
	movs r0, #0xb6
	bl PlaySeSpacial
	ldr r2, _0807D758  @ gLCDControlBuffer
	ldrb r3, [r2, #0xc]
	movs r1, #4
	negs r1, r1
	adds r0, r1, #0
	ands r0, r3
	strb r0, [r2, #0xc]
	ldrb r3, [r2, #0x10]
	adds r0, r1, #0
	ands r0, r3
	movs r4, #1
	orrs r0, r4
	strb r0, [r2, #0x10]
	ldrb r3, [r2, #0x14]
	adds r0, r1, #0
	ands r0, r3
	orrs r0, r4
	strb r0, [r2, #0x14]
	ldrb r0, [r2, #0x18]
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	strb r1, [r2, #0x18]
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	ldr r4, [r5, #0x50]
	movs r0, #2
	bl GetBackgroundTileDataOffset
	adds r1, r0, #0
	ldr r0, _0807D75C  @ 0x06002C00
	adds r1, r1, r0
	adds r0, r4, #0
	bl Decompress
	ldr r0, [r5, #0x54]
	movs r1, #0x80
	movs r2, #0x20
	bl CopyToPaletteBuffer
	bl sub_807E978
	movs r0, #1
	movs r1, #0x10
	movs r2, #0x10
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	adds r5, #0x40
	movs r0, #0
	strh r0, [r5]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807D758: .4byte gLCDControlBuffer
_0807D75C: .4byte 0x06002C00

	THUMB_FUNC_END sub_807D6D8

	THUMB_FUNC_START sub_807D760
sub_807D760: @ 0x0807D760
	push {r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r6, r0, #0
	ldr r7, _0807D7C8  @ gBG2TilemapBuffer
	ldr r0, [r6, #0x30]
	cmp r0, #0
	bge _0807D770
	adds r0, #7
_0807D770:
	asrs r0, r0, #3
	subs r1, r0, #3
	ldr r2, [r6, #0x34]
	cmp r2, #0
	bge _0807D77C
	adds r2, #7
_0807D77C:
	asrs r2, r2, #3
	subs r2, #3
	ldr r3, _0807D7CC  @ 0x00004160
	movs r0, #6
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _0807D7D0  @ gUnknown_089AF310
	str r0, [sp, #8]
	ldr r5, _0807D7D4  @ gUnknown_089A3B6C
	adds r4, r6, #0
	adds r4, #0x40
	ldrh r0, [r4]
	lsrs r0, r0, #1
	adds r0, r0, r5
	ldrb r0, [r0]
	str r0, [sp, #0xc]
	adds r0, r7, #0
	bl sub_80146A0
	movs r0, #4
	bl BG_EnableSyncByMask
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
	ldrh r0, [r4]
	lsrs r0, r0, #1
	adds r0, r0, r5
	ldrb r0, [r0]
	cmp r0, #0xff
	bne _0807D7C0
	adds r0, r6, #0
	bl Proc_Break
_0807D7C0:
	add sp, #0x10
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807D7C8: .4byte gBG2TilemapBuffer
_0807D7CC: .4byte 0x00004160
_0807D7D0: .4byte gUnknown_089AF310
_0807D7D4: .4byte gUnknown_089A3B6C

	THUMB_FUNC_END sub_807D760

	THUMB_FUNC_START sub_807D7D8
sub_807D7D8: @ 0x0807D7D8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0807D810  @ gUnknown_089A3B84
	movs r1, #3
	bl Proc_Start
	movs r2, #0x10
	ldrsb r2, [r4, r2]
	ldr r3, _0807D814  @ gBmSt
	ldrh r1, [r3, #0xc]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x14
	subs r2, r2, r1
	lsls r2, r2, #4
	adds r2, #8
	str r2, [r0, #0x30]
	movs r2, #0x11
	ldrsb r2, [r4, r2]
	ldrh r1, [r3, #0xe]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x14
	subs r2, r2, r1
	lsls r2, r2, #4
	adds r2, #8
	str r2, [r0, #0x34]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807D810: .4byte gUnknown_089A3B84
_0807D814: .4byte gBmSt

	THUMB_FUNC_END sub_807D7D8

	THUMB_FUNC_START sub_807D818
sub_807D818: @ 0x0807D818
	push {lr}
	ldr r2, _0807D828  @ 0x0000010F
	ldr r1, [r0, #0x30]
	adds r0, r2, #0
	bl PlaySeSpacial
	pop {r0}
	bx r0
	.align 2, 0
_0807D828: .4byte 0x0000010F

	THUMB_FUNC_END sub_807D818

	THUMB_FUNC_START NewMapAnimEffectAnimator
NewMapAnimEffectAnimator: @ 0x0807D82C
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r5, r0, #0
	adds r6, r1, #0
	mov r8, r2
	lsls r4, r3, #0x10
	lsrs r4, r4, #0x10
	ldr r0, _0807D85C  @ gUnknown_089A3BA4
	movs r1, #3
	bl Proc_Start
	str r5, [r0, #0x2c]
	str r6, [r0, #0x50]
	mov r1, r8
	str r1, [r0, #0x54]
	adds r0, #0x58
	strh r4, [r0]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807D85C: .4byte gUnknown_089A3BA4

	THUMB_FUNC_END NewMapAnimEffectAnimator

	THUMB_FUNC_START sub_807D860
sub_807D860: @ 0x0807D860
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r6, r0, #0
	ldr r2, _0807D930  @ gLCDControlBuffer
	ldrb r3, [r2, #0xc]
	movs r1, #4
	negs r1, r1
	adds r0, r1, #0
	ands r0, r3
	strb r0, [r2, #0xc]
	ldrb r3, [r2, #0x10]
	adds r0, r1, #0
	ands r0, r3
	movs r4, #1
	orrs r0, r4
	strb r0, [r2, #0x10]
	ldrb r3, [r2, #0x14]
	adds r0, r1, #0
	ands r0, r3
	orrs r0, r4
	strb r0, [r2, #0x14]
	ldrb r0, [r2, #0x18]
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	strb r1, [r2, #0x18]
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	ldr r4, [r6, #0x50]
	movs r0, #2
	bl GetBackgroundTileDataOffset
	adds r1, r0, #0
	ldr r0, _0807D934  @ 0x06002C00
	adds r1, r1, r0
	adds r0, r4, #0
	bl Decompress
	ldr r0, _0807D938  @ gBG2TilemapBuffer
	ldr r3, [r6, #0x2c]
	movs r1, #0x10
	ldrsb r1, [r3, r1]
	ldr r5, _0807D93C  @ gBmSt
	ldrh r2, [r5, #0xc]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x14
	subs r1, r1, r2
	lsls r1, r1, #1
	subs r1, #2
	movs r2, #0x11
	ldrsb r2, [r3, r2]
	ldrh r3, [r5, #0xe]
	lsls r3, r3, #0x10
	asrs r3, r3, #0x14
	subs r2, r2, r3
	lsls r2, r2, #1
	subs r2, #2
	ldr r3, _0807D940  @ 0x00004160
	movs r4, #6
	str r4, [sp]
	str r4, [sp, #4]
	bl sub_8014560
	movs r0, #4
	bl BG_EnableSyncByMask
	ldr r0, [r6, #0x54]
	str r6, [sp]
	movs r1, #0x80
	movs r2, #0x20
	movs r3, #4
	bl NewPaletteAnimator_
	adds r1, r6, #0
	adds r1, #0x40
	movs r0, #0
	strh r0, [r1]
	adds r1, #2
	movs r0, #0x10
	strh r0, [r1]
	adds r0, r6, #0
	adds r0, #0x58
	ldrh r0, [r0]
	ldr r1, [r6, #0x2c]
	ldrb r1, [r1, #0x10]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	ldrh r2, [r5, #0xc]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x14
	subs r1, r1, r2
	lsls r1, r1, #1
	adds r1, #1
	lsls r1, r1, #3
	bl PlaySeSpacial
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807D930: .4byte gLCDControlBuffer
_0807D934: .4byte 0x06002C00
_0807D938: .4byte gBG2TilemapBuffer
_0807D93C: .4byte gBmSt
_0807D940: .4byte 0x00004160

	THUMB_FUNC_END sub_807D860

	THUMB_FUNC_START sub_807D944
sub_807D944: @ 0x0807D944
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r4, #0
	adds r5, #0x40
	ldrh r0, [r5]
	adds r0, #1
	strh r0, [r5]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x10
	bne _0807D962
	adds r0, r4, #0
	bl Proc_Break
_0807D962:
	ldrh r1, [r5]
	movs r0, #0x16
	subs r0, r0, r1
	adds r2, r4, #0
	adds r2, #0x42
	strh r0, [r2]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x10
	bls _0807D97A
	movs r0, #0x10
	strh r0, [r2]
_0807D97A:
	ldrb r1, [r5]
	ldrb r2, [r2]
	movs r0, #1
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	movs r0, #0
	str r0, [sp]
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
	bl sub_8001F64
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_807D944

	THUMB_FUNC_START sub_807D9B8
sub_807D9B8: @ 0x0807D9B8
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r4, #0
	adds r5, #0x40
	ldrh r0, [r5]
	subs r0, #1
	strh r0, [r5]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _0807D9D4
	adds r0, r4, #0
	bl Proc_Break
_0807D9D4:
	ldrh r1, [r5]
	movs r0, #0x16
	subs r0, r0, r1
	adds r2, r4, #0
	adds r2, #0x42
	strh r0, [r2]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x10
	bls _0807D9EC
	movs r0, #0x10
	strh r0, [r2]
_0807D9EC:
	ldrb r1, [r5]
	ldrb r2, [r2]
	movs r0, #1
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	movs r0, #0
	str r0, [sp]
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
	bl sub_8001F64
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_807D9B8

	THUMB_FUNC_START sub_807DA2C
sub_807DA2C: @ 0x0807DA2C
	push {lr}
	bl DeleteAllPaletteAnimator
	ldr r0, _0807DA60  @ gBG2TilemapBuffer
	movs r1, #0
	bl BG_Fill
	movs r0, #4
	bl BG_EnableSyncByMask
	bl SetDefaultColorEffects
	ldr r2, _0807DA64  @ gLCDControlBuffer
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
_0807DA60: .4byte gBG2TilemapBuffer
_0807DA64: .4byte gLCDControlBuffer

	THUMB_FUNC_END sub_807DA2C

	THUMB_FUNC_START sub_807DA68
sub_807DA68: @ 0x0807DA68
	push {lr}
	movs r0, #0
	bl SetPrimaryHBlankHandler
	bl DeleteAllPaletteAnimator
	ldr r0, _0807DAA0  @ gBG2TilemapBuffer
	movs r1, #0
	bl BG_Fill
	movs r0, #4
	bl BG_EnableSyncByMask
	bl SetDefaultColorEffects
	ldr r2, _0807DAA4  @ gLCDControlBuffer
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
_0807DAA0: .4byte gBG2TilemapBuffer
_0807DAA4: .4byte gLCDControlBuffer

	THUMB_FUNC_END sub_807DA68

	THUMB_FUNC_START New6C_SomethingFlashy
New6C_SomethingFlashy: @ 0x0807DAA8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0807DAE0  @ gUnknown_089A3BDC
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x2c]
	movs r2, #0x10
	ldrsb r2, [r4, r2]
	ldr r3, _0807DAE4  @ gBmSt
	ldrh r1, [r3, #0xc]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x14
	subs r2, r2, r1
	lsls r2, r2, #1
	str r2, [r0, #0x30]
	movs r2, #0x11
	ldrsb r2, [r4, r2]
	ldrh r1, [r3, #0xe]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x14
	subs r2, r2, r1
	lsls r2, r2, #1
	str r2, [r0, #0x34]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807DAE0: .4byte gUnknown_089A3BDC
_0807DAE4: .4byte gBmSt

	THUMB_FUNC_END New6C_SomethingFlashy

	THUMB_FUNC_START sub_807DAE8
sub_807DAE8: @ 0x0807DAE8
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	ldr r4, _0807DB24  @ gUnknown_089AE224
	movs r0, #2
	bl GetBackgroundTileDataOffset
	adds r1, r0, #0
	ldr r0, _0807DB28  @ 0x06002C00
	adds r1, r1, r0
	adds r0, r4, #0
	bl Decompress
	ldr r0, _0807DB2C  @ gUnknown_089AE484
	movs r1, #0x80
	movs r2, #0x20
	bl CopyToPaletteBuffer
	bl LoadSparkGfx
	adds r5, #0x40
	movs r0, #0
	strh r0, [r5]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807DB24: .4byte gUnknown_089AE224
_0807DB28: .4byte 0x06002C00
_0807DB2C: .4byte gUnknown_089AE484

	THUMB_FUNC_END sub_807DAE8

	THUMB_FUNC_START sub_807DB30
sub_807DB30: @ 0x0807DB30
	push {r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r7, r0, #0
	ldr r0, _0807DB98  @ gBG2TilemapBuffer
	ldr r1, [r7, #0x30]
	subs r1, #1
	ldr r2, [r7, #0x34]
	subs r2, #3
	ldr r3, _0807DB9C  @ 0x00004160
	movs r4, #4
	str r4, [sp]
	movs r4, #6
	str r4, [sp, #4]
	ldr r4, _0807DBA0  @ gUnknown_089AE4A4
	str r4, [sp, #8]
	ldr r6, _0807DBA4  @ gUnknown_089A3C0C
	adds r5, r7, #0
	adds r5, #0x40
	ldrh r4, [r5]
	lsrs r4, r4, #1
	adds r4, r4, r6
	ldrb r4, [r4]
	str r4, [sp, #0xc]
	bl sub_80146A0
	movs r0, #4
	bl BG_EnableSyncByMask
	ldrh r0, [r5]
	adds r0, #1
	strh r0, [r5]
	ldrh r0, [r5]
	lsrs r0, r0, #1
	adds r0, r0, r6
	ldrb r0, [r0]
	cmp r0, #0xff
	bne _0807DB80
	adds r0, r7, #0
	bl Proc_Break
_0807DB80:
	bl sub_807E978
	movs r0, #1
	movs r1, #0xc
	movs r2, #0xc
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	add sp, #0x10
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807DB98: .4byte gBG2TilemapBuffer
_0807DB9C: .4byte 0x00004160
_0807DBA0: .4byte gUnknown_089AE4A4
_0807DBA4: .4byte gUnknown_089A3C0C

	THUMB_FUNC_END sub_807DB30

	THUMB_FUNC_START sub_807DBA8
sub_807DBA8: @ 0x0807DBA8
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, _0807DBD8  @ gUnknown_089A3C24
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x2c]
	ldr r4, _0807DBDC  @ gActionData
	ldrb r1, [r4, #0x13]
	lsls r1, r1, #4
	ldr r3, _0807DBE0  @ gBmSt
	movs r5, #0xc
	ldrsh r2, [r3, r5]
	subs r1, r1, r2
	str r1, [r0, #0x30]
	ldrb r1, [r4, #0x14]
	lsls r1, r1, #4
	movs r4, #0xe
	ldrsh r2, [r3, r4]
	subs r1, r1, r2
	str r1, [r0, #0x34]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807DBD8: .4byte gUnknown_089A3C24
_0807DBDC: .4byte gActionData
_0807DBE0: .4byte gBmSt

	THUMB_FUNC_END sub_807DBA8

	THUMB_FUNC_START sub_807DBE4
sub_807DBE4: @ 0x0807DBE4
	push {r4, r5, lr}
	sub sp, #8
	adds r5, r0, #0
	ldr r0, _0807DC80  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0807DBFC
	movs r0, #0xb3
	bl m4aSongNumStart
_0807DBFC:
	ldr r0, _0807DC84  @ gUnknown_089B03D4
	ldr r1, _0807DC88  @ 0x06013800
	bl Decompress
	ldr r0, _0807DC8C  @ gUnknown_089B068C
	movs r1, #0xa0
	lsls r1, r1, #2
	movs r2, #0x20
	bl CopyToPaletteBuffer
	movs r0, #4
	bl SetWhitePal
	movs r0, #2
	bl GetBackgroundTileDataOffset
	ldr r1, _0807DC90  @ 0x06002C00
	adds r0, r0, r1
	ldr r2, _0807DC94  @ 0x0000FFFF
	movs r1, #0x10
	bl sub_8014930
	ldr r0, _0807DC98  @ gBG2TilemapBuffer
	movs r1, #0x80
	lsls r1, r1, #3
	ldr r2, _0807DC9C  @ 0x00004160
	bl sub_8014930
	movs r0, #4
	bl BG_EnableSyncByMask
	adds r0, r5, #0
	adds r0, #0x40
	movs r1, #0
	strh r1, [r0]
	adds r0, #2
	strh r1, [r0]
	ldr r0, [r5, #0x30]
	adds r4, r0, #4
	cmp r4, #0
	blt _0807DC60
	ldr r0, _0807DCA0  @ gUnknown_089A61F8
	ldr r2, [r5, #0x34]
	ldr r3, _0807DCA4  @ 0x000041C0
	str r1, [sp]
	movs r1, #2
	str r1, [sp, #4]
	adds r1, r4, #0
	bl APProc_Create
_0807DC60:
	bl sub_8081E78
	bl sub_8081EAC
	bl sub_807E978
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
_0807DC80: .4byte gPlaySt
_0807DC84: .4byte gUnknown_089B03D4
_0807DC88: .4byte 0x06013800
_0807DC8C: .4byte gUnknown_089B068C
_0807DC90: .4byte 0x06002C00
_0807DC94: .4byte 0x0000FFFF
_0807DC98: .4byte gBG2TilemapBuffer
_0807DC9C: .4byte 0x00004160
_0807DCA0: .4byte gUnknown_089A61F8
_0807DCA4: .4byte 0x000041C0

	THUMB_FUNC_END sub_807DBE4

	THUMB_FUNC_START sub_807DCA8
sub_807DCA8: @ 0x0807DCA8
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	adds r4, r5, #0
	adds r4, #0x40
	ldrh r3, [r4]
	movs r0, #0x50
	str r0, [sp]
	movs r0, #5
	movs r1, #1
	movs r2, #0xa0
	bl Interpolate
	adds r2, r0, #0
	ldr r0, [r5, #0x30]
	adds r0, #8
	ldr r1, [r5, #0x34]
	adds r1, #8
	bl sub_8081F24
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
	ldrh r0, [r4]
	lsls r0, r0, #4
	movs r1, #0x28
	bl __divsi3
	cmp r0, #0xf
	ble _0807DCE6
	movs r0, #0x10
_0807DCE6:
	lsls r1, r0, #0x18
	lsrs r1, r1, #0x18
	movs r0, #1
	movs r2, #0x10
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	ldrh r0, [r4]
	cmp r0, #0x27
	bls _0807DD04
	adds r0, r5, #0
	bl Proc_Break
	bl APProc_DeleteAll
_0807DD04:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_807DCA8

	THUMB_FUNC_START sub_807DD0C
sub_807DD0C: @ 0x0807DD0C
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	adds r4, r5, #0
	adds r4, #0x40
	ldrh r3, [r4]
	movs r0, #0x50
	str r0, [sp]
	movs r0, #5
	movs r1, #1
	movs r2, #0xa0
	bl Interpolate
	adds r2, r0, #0
	ldr r0, [r5, #0x30]
	adds r0, #8
	ldr r1, [r5, #0x34]
	adds r1, #8
	bl sub_8081F24
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
	ldrh r0, [r4]
	subs r0, #0x28
	lsls r0, r0, #4
	movs r1, #0x1e
	bl __divsi3
	movs r1, #0x10
	subs r1, r1, r0
	cmp r1, #0
	bgt _0807DD50
	movs r1, #0
_0807DD50:
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	movs r0, #1
	movs r2, #0x10
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	ldrh r0, [r4]
	cmp r0, #0x45
	bls _0807DD6A
	adds r0, r5, #0
	bl Proc_Break
_0807DD6A:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_807DD0C

	THUMB_FUNC_START sub_807DD74
sub_807DD74: @ 0x0807DD74
	push {lr}
	bl sub_8081F58
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_807DD74

	THUMB_FUNC_START sub_807DD80
sub_807DD80: @ 0x0807DD80
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0807DDC0  @ gUnknown_089A3C6C
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x2c]
	movs r2, #0x10
	ldrsb r2, [r4, r2]
	ldr r3, _0807DDC4  @ gBmSt
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
_0807DDC0: .4byte gUnknown_089A3C6C
_0807DDC4: .4byte gBmSt

	THUMB_FUNC_END sub_807DD80

	THUMB_FUNC_START sub_807DDC8
sub_807DDC8: @ 0x0807DDC8
	push {r4, r5, lr}
	sub sp, #8
	adds r5, r0, #0
	ldr r1, [r5, #0x30]
	movs r0, #0x87
	bl PlaySeSpacial
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	bl sub_807E978
	ldr r0, _0807DE1C  @ gUnknown_089B1E10
	ldr r1, _0807DE20  @ 0x06013800
	bl Decompress
	ldr r0, _0807DE24  @ gUnknown_089B20E8
	movs r1, #0xa0
	lsls r1, r1, #2
	movs r2, #0x20
	bl CopyToPaletteBuffer
	ldr r0, _0807DE28  @ gUnknown_089B2108
	ldr r1, [r5, #0x30]
	ldr r2, [r5, #0x34]
	ldr r3, _0807DE2C  @ 0x000041C0
	movs r4, #0
	str r4, [sp]
	movs r4, #2
	str r4, [sp, #4]
	bl APProc_Create
	adds r5, #0x48
	movs r0, #1
	strh r0, [r5]
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807DE1C: .4byte gUnknown_089B1E10
_0807DE20: .4byte 0x06013800
_0807DE24: .4byte gUnknown_089B20E8
_0807DE28: .4byte gUnknown_089B2108
_0807DE2C: .4byte 0x000041C0

	THUMB_FUNC_END sub_807DDC8

	THUMB_FUNC_START sub_807DE30
sub_807DE30: @ 0x0807DE30
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0807DE68  @ gUnknown_089A3C94
	movs r1, #3
	bl Proc_Start
	movs r2, #0x10
	ldrsb r2, [r4, r2]
	ldr r3, _0807DE6C  @ gBmSt
	ldrh r1, [r3, #0xc]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x14
	subs r2, r2, r1
	lsls r2, r2, #4
	adds r2, #8
	str r2, [r0, #0x30]
	movs r2, #0x11
	ldrsb r2, [r4, r2]
	ldrh r1, [r3, #0xe]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x14
	subs r2, r2, r1
	lsls r2, r2, #4
	adds r2, #8
	str r2, [r0, #0x34]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807DE68: .4byte gUnknown_089A3C94
_0807DE6C: .4byte gBmSt

	THUMB_FUNC_END sub_807DE30

	THUMB_FUNC_START sub_807DE70
sub_807DE70: @ 0x0807DE70
	push {lr}
	ldr r1, [r0, #0x30]
	movs r0, #0x86
	bl PlaySeSpacial
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_807DE70

	THUMB_FUNC_START sub_807DE80
sub_807DE80: @ 0x0807DE80
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	bl sub_807E978
	movs r0, #1
	movs r1, #0x10
	movs r2, #0x10
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	ldr r4, _0807DED0  @ gUnknown_089B0AD0
	movs r0, #2
	bl GetBackgroundTileDataOffset
	adds r1, r0, #0
	ldr r0, _0807DED4  @ 0x06002C00
	adds r1, r1, r0
	adds r0, r4, #0
	bl Decompress
	ldr r0, _0807DED8  @ gUnknown_086810B8
	movs r1, #0x80
	movs r2, #0x20
	bl CopyToPaletteBuffer
	adds r0, r5, #0
	adds r0, #0x48
	movs r1, #0
	strh r1, [r0]
	adds r5, #0x4a
	strh r1, [r5]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807DED0: .4byte gUnknown_089B0AD0
_0807DED4: .4byte 0x06002C00
_0807DED8: .4byte gUnknown_086810B8

	THUMB_FUNC_END sub_807DE80

	THUMB_FUNC_START sub_807DEDC
sub_807DEDC: @ 0x0807DEDC
	push {r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r6, r0, #0
	ldr r0, _0807DF4C  @ gBG2TilemapBuffer
	mov ip, r0
	ldr r0, [r6, #0x30]
	cmp r0, #0
	bge _0807DEEE
	adds r0, #7
_0807DEEE:
	asrs r0, r0, #3
	subs r7, r0, #2
	ldr r2, [r6, #0x34]
	cmp r2, #0
	bge _0807DEFA
	adds r2, #7
_0807DEFA:
	asrs r2, r2, #3
	subs r2, #9
	ldr r3, _0807DF50  @ 0x00004160
	movs r0, #4
	str r0, [sp]
	movs r0, #0xb
	str r0, [sp, #4]
	ldr r0, _0807DF54  @ gUnknown_089B17A4
	str r0, [sp, #8]
	ldr r5, _0807DF58  @ gUnknown_08205824
	adds r4, r6, #0
	adds r4, #0x48
	ldrh r0, [r4]
	adds r1, r0, #1
	strh r1, [r4]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	adds r0, r0, r5
	ldrb r0, [r0]
	str r0, [sp, #0xc]
	mov r0, ip
	adds r1, r7, #0
	bl sub_801474C
	movs r0, #4
	bl BG_EnableSyncByMask
	movs r1, #0
	ldrsh r0, [r4, r1]
	adds r0, r0, r5
	ldrb r0, [r0]
	cmp r0, #0xff
	bne _0807DF42
	adds r0, r6, #0
	bl Proc_Break
_0807DF42:
	add sp, #0x10
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807DF4C: .4byte gBG2TilemapBuffer
_0807DF50: .4byte 0x00004160
_0807DF54: .4byte gUnknown_089B17A4
_0807DF58: .4byte gUnknown_08205824

	THUMB_FUNC_END sub_807DEDC

	THUMB_FUNC_START sub_807DF5C
sub_807DF5C: @ 0x0807DF5C
	push {r4, r5, lr}
	sub sp, #0x14
	adds r5, r0, #0
	ldr r1, _0807DFA8  @ gUnknown_08205833
	mov r0, sp
	movs r2, #0x13
	bl memcpy
	adds r4, r5, #0
	adds r4, #0x4a
	ldrh r0, [r4]
	adds r1, r0, #1
	strh r1, [r4]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add r0, sp
	ldrb r1, [r0]
	movs r0, #1
	movs r2, #0x10
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	movs r1, #0
	ldrsh r0, [r4, r1]
	add r0, sp
	ldrb r0, [r0]
	cmp r0, #0xff
	bne _0807DF9E
	movs r0, #0
	strh r0, [r4]
	adds r0, r5, #0
	bl Proc_Break
_0807DF9E:
	add sp, #0x14
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807DFA8: .4byte gUnknown_08205833

	THUMB_FUNC_END sub_807DF5C

	THUMB_FUNC_START sub_807DFAC
sub_807DFAC: @ 0x0807DFAC
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	adds r4, r5, #0
	adds r4, #0x4a
	ldrh r3, [r4]
	adds r0, r3, #1
	strh r0, [r4]
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	movs r0, #0x1e
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
	movs r1, #0
	ldrsh r0, [r4, r1]
	cmp r0, #0x1e
	ble _0807DFEC
	adds r0, r5, #0
	bl Proc_Break
_0807DFEC:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_807DFAC

	THUMB_FUNC_START sub_807DFF4
sub_807DFF4: @ 0x0807DFF4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0807E030  @ gUnknown_089A3CD4
	movs r1, #3
	bl Proc_Start
	movs r2, #0x10
	ldrsb r2, [r4, r2]
	ldr r3, _0807E034  @ gBmSt
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
_0807E030: .4byte gUnknown_089A3CD4
_0807E034: .4byte gBmSt

	THUMB_FUNC_END sub_807DFF4

	THUMB_FUNC_START sub_807E038
sub_807E038: @ 0x0807E038
	push {lr}
	ldr r1, [r0, #0x30]
	movs r0, #0x82
	bl PlaySeSpacial
	ldr r0, _0807E050  @ gUnknown_0867B5A4
	movs r1, #0x80
	movs r2, #0x20
	bl CopyToPaletteBuffer
	pop {r0}
	bx r0
	.align 2, 0
_0807E050: .4byte gUnknown_0867B5A4

	THUMB_FUNC_END sub_807E038

	THUMB_FUNC_START sub_807E054
sub_807E054: @ 0x0807E054
	push {r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r6, r0, #0
	ldr r0, _0807E0C4  @ gBG2TilemapBuffer
	mov ip, r0
	ldr r0, [r6, #0x30]
	cmp r0, #0
	bge _0807E066
	adds r0, #7
_0807E066:
	asrs r0, r0, #3
	subs r7, r0, #2
	ldr r2, [r6, #0x34]
	cmp r2, #0
	bge _0807E072
	adds r2, #7
_0807E072:
	asrs r2, r2, #3
	subs r2, #9
	ldr r3, _0807E0C8  @ 0x00004160
	movs r0, #4
	str r0, [sp]
	movs r0, #0xb
	str r0, [sp, #4]
	ldr r0, _0807E0CC  @ gUnknown_089B0864
	str r0, [sp, #8]
	ldr r5, _0807E0D0  @ gUnknown_08205846
	adds r4, r6, #0
	adds r4, #0x48
	ldrh r0, [r4]
	adds r1, r0, #1
	strh r1, [r4]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	adds r0, r0, r5
	ldrb r0, [r0]
	str r0, [sp, #0xc]
	mov r0, ip
	adds r1, r7, #0
	bl sub_801474C
	movs r0, #4
	bl BG_EnableSyncByMask
	movs r1, #0
	ldrsh r0, [r4, r1]
	adds r0, r0, r5
	ldrb r0, [r0]
	cmp r0, #0xff
	bne _0807E0BA
	adds r0, r6, #0
	bl Proc_Break
_0807E0BA:
	add sp, #0x10
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807E0C4: .4byte gBG2TilemapBuffer
_0807E0C8: .4byte 0x00004160
_0807E0CC: .4byte gUnknown_089B0864
_0807E0D0: .4byte gUnknown_08205846

	THUMB_FUNC_END sub_807E054

	THUMB_FUNC_START sub_807E0D4
sub_807E0D4: @ 0x0807E0D4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0807E110  @ gUnknown_089A3D14
	movs r1, #3
	bl Proc_Start
	movs r2, #0x10
	ldrsb r2, [r4, r2]
	ldr r3, _0807E114  @ gBmSt
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
_0807E110: .4byte gUnknown_089A3D14
_0807E114: .4byte gBmSt

	THUMB_FUNC_END sub_807E0D4

	THUMB_FUNC_START sub_807E118
sub_807E118: @ 0x0807E118
	push {r4, lr}
	sub sp, #8
	adds r4, r0, #0
	ldr r1, [r4, #0x30]
	movs r0, #0x85
	bl PlaySeSpacial
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	bl sub_807E978
	ldr r0, _0807E168  @ gUnknown_08686F84
	ldr r1, _0807E16C  @ 0x06013800
	bl Decompress
	ldr r0, _0807E170  @ gUnknown_0868716C
	movs r1, #0xa0
	lsls r1, r1, #2
	movs r2, #0x20
	bl CopyToPaletteBuffer
	ldr r0, _0807E174  @ gUnknown_089B1A10
	ldr r1, [r4, #0x30]
	ldr r2, [r4, #0x34]
	subs r2, #0x10
	ldr r3, _0807E178  @ 0x000041C0
	movs r4, #0
	str r4, [sp]
	movs r4, #2
	str r4, [sp, #4]
	bl APProc_Create
	add sp, #8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807E168: .4byte gUnknown_08686F84
_0807E16C: .4byte 0x06013800
_0807E170: .4byte gUnknown_0868716C
_0807E174: .4byte gUnknown_089B1A10
_0807E178: .4byte 0x000041C0

	THUMB_FUNC_END sub_807E118

	THUMB_FUNC_START sub_807E17C
sub_807E17C: @ 0x0807E17C
	push {r4, lr}
	sub sp, #8
	adds r4, r0, #0
	ldr r1, [r4, #0x30]
	movs r0, #0x85
	bl PlaySeSpacial
	ldr r0, _0807E1A8  @ gUnknown_089B1A10
	ldr r1, [r4, #0x30]
	ldr r2, [r4, #0x34]
	subs r2, #8
	ldr r3, _0807E1AC  @ 0x000041C0
	movs r4, #0
	str r4, [sp]
	movs r4, #2
	str r4, [sp, #4]
	bl APProc_Create
	add sp, #8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807E1A8: .4byte gUnknown_089B1A10
_0807E1AC: .4byte 0x000041C0

	THUMB_FUNC_END sub_807E17C

	THUMB_FUNC_START sub_807E1B0
sub_807E1B0: @ 0x0807E1B0
	push {r4, lr}
	sub sp, #8
	adds r4, r0, #0
	ldr r1, [r4, #0x30]
	movs r0, #0x85
	bl PlaySeSpacial
	ldr r0, _0807E1DC  @ gUnknown_089B1A10
	ldr r1, [r4, #0x30]
	ldr r2, [r4, #0x34]
	ldr r3, _0807E1E0  @ 0x000041C0
	movs r4, #0
	str r4, [sp]
	movs r4, #2
	str r4, [sp, #4]
	bl APProc_Create
	add sp, #8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807E1DC: .4byte gUnknown_089B1A10
_0807E1E0: .4byte 0x000041C0

	THUMB_FUNC_END sub_807E1B0

	THUMB_FUNC_START sub_807E1E4
sub_807E1E4: @ 0x0807E1E4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0807E224  @ gUnknown_089A3D54
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x2c]
	movs r2, #0x10
	ldrsb r2, [r4, r2]
	ldr r3, _0807E228  @ gBmSt
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
_0807E224: .4byte gUnknown_089A3D54
_0807E228: .4byte gBmSt

	THUMB_FUNC_END sub_807E1E4

	THUMB_FUNC_START sub_807E22C
sub_807E22C: @ 0x0807E22C
	push {r4, r5, lr}
	adds r5, r0, #0
	bl sub_807E978
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	ldr r4, _0807E280  @ gUnknown_089B6AA0
	movs r0, #2
	bl GetBackgroundTileDataOffset
	adds r1, r0, #0
	ldr r0, _0807E284  @ 0x06002C00
	adds r1, r1, r0
	adds r0, r4, #0
	bl Decompress
	ldr r0, _0807E288  @ gUnknown_089B73D4
	movs r1, #0x80
	movs r2, #0x20
	bl CopyToPaletteBuffer
	movs r0, #1
	movs r1, #0x10
	movs r2, #0x10
	movs r3, #0
	bl SetSpecialColorEffectsParameters
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
_0807E280: .4byte gUnknown_089B6AA0
_0807E284: .4byte 0x06002C00
_0807E288: .4byte gUnknown_089B73D4

	THUMB_FUNC_END sub_807E22C

	THUMB_FUNC_START sub_807E28C
sub_807E28C: @ 0x0807E28C
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r0, #0x42
	ldrh r0, [r0]
	cmp r0, #0
	bne _0807E312
	adds r0, r4, #0
	adds r0, #0x40
	ldrh r1, [r0]
	adds r5, r0, #0
	cmp r1, #0
	bne _0807E2B4
	ldr r0, _0807E2B0  @ 0x000003BA
	ldr r1, [r4, #0x30]
	bl PlaySeSpacial
	b _0807E2BE
	.align 2, 0
_0807E2B0: .4byte 0x000003BA
_0807E2B4:
	cmp r1, #9
	bls _0807E2BE
	adds r0, r4, #0
	bl Proc_Break
_0807E2BE:
	ldr r0, _0807E324  @ gUnknown_089A3D8C
	ldrh r1, [r5]
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r0, [r1]
	ldr r6, _0807E328  @ gGenericBuffer
	adds r1, r6, #0
	bl Decompress
	ldr r1, _0807E32C  @ gBG2TilemapBuffer
	ldr r0, [r4, #0x30]
	cmp r0, #0
	bge _0807E2DA
	adds r0, #7
_0807E2DA:
	asrs r0, r0, #3
	subs r0, #4
	lsls r0, r0, #0x10
	asrs r2, r0, #0x10
	ldr r3, [r4, #0x34]
	cmp r3, #0
	bge _0807E2EA
	adds r3, #7
_0807E2EA:
	asrs r3, r3, #3
	subs r3, #4
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	ldr r0, _0807E330  @ 0x00004160
	str r0, [sp]
	adds r0, r1, #0
	adds r1, r6, #0
	bl sub_800159C
	movs r0, #4
	bl BG_EnableSyncByMask
	ldrh r0, [r5]
	adds r0, #1
	strh r0, [r5]
	adds r1, r4, #0
	adds r1, #0x42
	movs r0, #4
	strh r0, [r1]
_0807E312:
	adds r1, r4, #0
	adds r1, #0x42
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807E324: .4byte gUnknown_089A3D8C
_0807E328: .4byte gGenericBuffer
_0807E32C: .4byte gBG2TilemapBuffer
_0807E330: .4byte 0x00004160

	THUMB_FUNC_END sub_807E28C

	THUMB_FUNC_START sub_807E334
sub_807E334: @ 0x0807E334
	push {lr}
	ldr r0, _0807E348  @ gBG2TilemapBuffer
	movs r1, #0
	bl BG_Fill
	movs r0, #4
	bl BG_EnableSyncByMask
	pop {r0}
	bx r0
	.align 2, 0
_0807E348: .4byte gBG2TilemapBuffer

	THUMB_FUNC_END sub_807E334

	THUMB_FUNC_START sub_807E34C
sub_807E34C: @ 0x0807E34C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0807E388  @ gUnknown_089A3DB4
	movs r1, #3
	bl Proc_Start
	movs r2, #0x10
	ldrsb r2, [r4, r2]
	ldr r3, _0807E38C  @ gBmSt
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
	lsls r2, r2, #4
	adds r2, #0x12
	str r2, [r0, #0x34]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807E388: .4byte gUnknown_089A3DB4
_0807E38C: .4byte gBmSt

	THUMB_FUNC_END sub_807E34C

	THUMB_FUNC_START sub_807E390
sub_807E390: @ 0x0807E390
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x30]
	movs r0, #0xfd
	bl PlaySeSpacial
	bl sub_8081E78
	bl sub_8081EAC
	ldr r0, _0807E3F0  @ sub_8081FA8
	bl SetPrimaryHBlankHandler
	bl sub_807E978
	movs r0, #1
	movs r1, #0x10
	movs r2, #0x10
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	ldr r0, _0807E3F4  @ gBG2TilemapBuffer
	ldr r1, _0807E3F8  @ gGenericBuffer
	ldr r2, _0807E3FC  @ 0x00004160
	bl CallARM_FillTileRect
	movs r0, #4
	bl BG_EnableSyncByMask
	movs r0, #2
	movs r1, #0
	movs r2, #1
	adds r3, r4, #0
	bl sub_807EA20
	ldr r0, _0807E400  @ gUnknown_089A52FC
	adds r1, r4, #0
	bl Proc_Start
	adds r0, r4, #0
	adds r0, #0x48
	movs r1, #0
	strh r1, [r0]
	adds r4, #0x4a
	strh r1, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807E3F0: .4byte sub_8081FA8
_0807E3F4: .4byte gBG2TilemapBuffer
_0807E3F8: .4byte gGenericBuffer
_0807E3FC: .4byte 0x00004160
_0807E400: .4byte gUnknown_089A52FC

	THUMB_FUNC_END sub_807E390

	THUMB_FUNC_START sub_807E404
sub_807E404: @ 0x0807E404
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	adds r4, r5, #0
	adds r4, #0x48
	ldrh r1, [r4]
	movs r2, #0
	ldrsh r0, [r4, r2]
	cmp r0, #0xb
	ble _0807E422
	subs r0, r1, #1
	strh r0, [r4]
	adds r0, r5, #0
	bl Proc_Break
_0807E422:
	ldr r0, [r5, #0x30]
	ldr r1, [r5, #0x34]
	ldrh r2, [r4]
	adds r2, #1
	strh r2, [r4]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	ldr r3, _0807E444  @ gUnknown_089A3DFC
	str r3, [sp]
	movs r3, #0xc
	bl sub_808218C
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807E444: .4byte gUnknown_089A3DFC

	THUMB_FUNC_END sub_807E404

	THUMB_FUNC_START sub_807E448
sub_807E448: @ 0x0807E448
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	adds r4, r5, #0
	adds r4, #0x48
	ldrh r1, [r4]
	movs r2, #0
	ldrsh r0, [r4, r2]
	cmp r0, #0
	bgt _0807E466
	adds r0, r1, #1
	strh r0, [r4]
	adds r0, r5, #0
	bl Proc_Break
_0807E466:
	ldr r0, [r5, #0x30]
	ldr r1, [r5, #0x34]
	ldrh r2, [r4]
	subs r2, #1
	strh r2, [r4]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	ldr r3, _0807E488  @ gUnknown_089A3DFC
	str r3, [sp]
	movs r3, #0xc
	bl sub_808218C
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807E488: .4byte gUnknown_089A3DFC

	THUMB_FUNC_END sub_807E448

	THUMB_FUNC_START sub_807E48C
sub_807E48C: @ 0x0807E48C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0807E4C8  @ gUnknown_089A3E04
	movs r1, #3
	bl Proc_Start
	movs r2, #0x10
	ldrsb r2, [r4, r2]
	ldr r3, _0807E4CC  @ gBmSt
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
_0807E4C8: .4byte gUnknown_089A3E04
_0807E4CC: .4byte gBmSt

	THUMB_FUNC_END sub_807E48C

	THUMB_FUNC_START sub_807E4D0
sub_807E4D0: @ 0x0807E4D0
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r6, r0, #0
	ldr r1, [r6, #0x30]
	movs r0, #0x83
	bl PlaySeSpacial
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	bl sub_807E978
	ldr r4, _0807E568  @ gUnknown_089B2618
	movs r0, #2
	bl GetBackgroundTileDataOffset
	adds r1, r0, #0
	ldr r0, _0807E56C  @ 0x06002C00
	adds r1, r1, r0
	adds r0, r4, #0
	bl Decompress
	ldr r0, _0807E570  @ gUnknown_089B21D8
	ldr r1, _0807E574  @ 0x06013800
	bl Decompress
	ldr r4, _0807E578  @ gUnknown_089B2728
	adds r0, r4, #0
	movs r1, #0x80
	movs r2, #0x20
	bl CopyToPaletteBuffer
	movs r1, #0xa0
	lsls r1, r1, #2
	adds r0, r4, #0
	movs r2, #0x20
	bl CopyToPaletteBuffer
	ldr r0, _0807E57C  @ gUnknown_089B2748
	ldr r1, [r6, #0x30]
	ldr r2, [r6, #0x34]
	movs r3, #0x80
	lsls r3, r3, #3
	orrs r2, r3
	ldr r3, _0807E580  @ 0x000041C0
	movs r5, #0
	str r5, [sp]
	movs r4, #2
	str r4, [sp, #4]
	bl APProc_Create
	adds r6, #0x48
	strh r5, [r6]
	movs r0, #1
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl SetBlendTargetA
	movs r0, #0
	bl SetBlendBackdropA
	movs r0, #0
	movs r1, #0x10
	movs r2, #0x10
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807E568: .4byte gUnknown_089B2618
_0807E56C: .4byte 0x06002C00
_0807E570: .4byte gUnknown_089B21D8
_0807E574: .4byte 0x06013800
_0807E578: .4byte gUnknown_089B2728
_0807E57C: .4byte gUnknown_089B2748
_0807E580: .4byte 0x000041C0

	THUMB_FUNC_END sub_807E4D0

	THUMB_FUNC_START sub_807E584
sub_807E584: @ 0x0807E584
	push {r4, r5, lr}
	sub sp, #8
	adds r4, r0, #0
	ldr r1, [r4, #0x30]
	movs r0, #0x84
	bl PlaySeSpacial
	ldr r5, _0807E5E8  @ gBG2TilemapBuffer
	ldr r0, [r4, #0x30]
	cmp r0, #0
	bge _0807E59C
	adds r0, #7
_0807E59C:
	asrs r0, r0, #3
	subs r1, r0, #2
	ldr r0, [r4, #0x34]
	cmp r0, #0
	bge _0807E5A8
	adds r0, #7
_0807E5A8:
	asrs r2, r0, #3
	subs r2, #2
	ldr r3, _0807E5EC  @ 0x00004160
	movs r0, #4
	str r0, [sp]
	str r0, [sp, #4]
	adds r0, r5, #0
	bl sub_8014560
	movs r0, #4
	bl BG_EnableSyncByMask
	movs r0, #0
	str r0, [sp]
	movs r1, #0
	movs r2, #1
	movs r3, #0
	bl SetBlendTargetA
	movs r0, #0
	bl SetBlendBackdropA
	movs r0, #1
	movs r1, #0x10
	movs r2, #0x10
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807E5E8: .4byte gBG2TilemapBuffer
_0807E5EC: .4byte 0x00004160

	THUMB_FUNC_END sub_807E584

	THUMB_FUNC_START sub_807E5F0
sub_807E5F0: @ 0x0807E5F0
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	adds r4, r5, #0
	adds r4, #0x48
	ldrh r3, [r4]
	adds r0, r3, #1
	strh r0, [r4]
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	movs r0, #0x1e
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
	movs r1, #0
	ldrsh r0, [r4, r1]
	cmp r0, #0x1d
	ble _0807E630
	adds r0, r5, #0
	bl Proc_Break
_0807E630:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_807E5F0

	THUMB_FUNC_START sub_807E638
sub_807E638: @ 0x0807E638
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0807E674  @ gUnknown_089A3E44
	movs r1, #3
	bl Proc_Start
	movs r2, #0x10
	ldrsb r2, [r4, r2]
	ldr r3, _0807E678  @ gBmSt
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
_0807E674: .4byte gUnknown_089A3E44
_0807E678: .4byte gBmSt

	THUMB_FUNC_END sub_807E638

	THUMB_FUNC_START sub_807E67C
sub_807E67C: @ 0x0807E67C
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r1, [r5, #0x30]
	movs r0, #0x88
	bl PlaySeSpacial
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	bl sub_807E978
	movs r0, #1
	movs r1, #0x10
	movs r2, #0x10
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	ldr r4, _0807E6D4  @ gUnknown_089B2880
	movs r0, #2
	bl GetBackgroundTileDataOffset
	adds r1, r0, #0
	ldr r0, _0807E6D8  @ 0x06002C00
	adds r1, r1, r0
	adds r0, r4, #0
	bl Decompress
	ldr r0, _0807E6DC  @ gUnknown_0868DF5C
	movs r1, #0x80
	movs r2, #0x20
	bl CopyToPaletteBuffer
	adds r0, r5, #0
	adds r0, #0x48
	movs r1, #0
	strh r1, [r0]
	adds r5, #0x4a
	strh r1, [r5]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807E6D4: .4byte gUnknown_089B2880
_0807E6D8: .4byte 0x06002C00
_0807E6DC: .4byte gUnknown_0868DF5C

	THUMB_FUNC_END sub_807E67C

	THUMB_FUNC_START sub_807E6E0
sub_807E6E0: @ 0x0807E6E0
	push {r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r6, r0, #0
	ldr r0, _0807E750  @ gBG2TilemapBuffer
	mov ip, r0
	ldr r0, [r6, #0x30]
	cmp r0, #0
	bge _0807E6F2
	adds r0, #7
_0807E6F2:
	asrs r0, r0, #3
	subs r7, r0, #2
	ldr r2, [r6, #0x34]
	cmp r2, #0
	bge _0807E6FE
	adds r2, #7
_0807E6FE:
	asrs r2, r2, #3
	subs r2, #8
	ldr r3, _0807E754  @ 0x00004160
	movs r0, #4
	str r0, [sp]
	movs r0, #0xa
	str r0, [sp, #4]
	ldr r0, _0807E758  @ gUnknown_089B343C
	str r0, [sp, #8]
	ldr r5, _0807E75C  @ gUnknown_08205855
	adds r4, r6, #0
	adds r4, #0x48
	ldrh r0, [r4]
	adds r1, r0, #1
	strh r1, [r4]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	adds r0, r0, r5
	ldrb r0, [r0]
	str r0, [sp, #0xc]
	mov r0, ip
	adds r1, r7, #0
	bl sub_801474C
	movs r0, #4
	bl BG_EnableSyncByMask
	movs r1, #0
	ldrsh r0, [r4, r1]
	adds r0, r0, r5
	ldrb r0, [r0]
	cmp r0, #0xff
	bne _0807E746
	adds r0, r6, #0
	bl Proc_Break
_0807E746:
	add sp, #0x10
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807E750: .4byte gBG2TilemapBuffer
_0807E754: .4byte 0x00004160
_0807E758: .4byte gUnknown_089B343C
_0807E75C: .4byte gUnknown_08205855

	THUMB_FUNC_END sub_807E6E0

	THUMB_FUNC_START sub_807E760
sub_807E760: @ 0x0807E760
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _0807E794  @ gUnknown_089A3E6C
	movs r1, #3
	bl Proc_Start
	ldr r2, _0807E798  @ gBmSt
	ldrh r1, [r2, #0xc]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x14
	subs r4, r4, r1
	lsls r4, r4, #4
	adds r4, #8
	str r4, [r0, #0x30]
	ldrh r1, [r2, #0xe]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x14
	subs r5, r5, r1
	lsls r5, r5, #4
	adds r5, #8
	str r5, [r0, #0x34]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807E794: .4byte gUnknown_089A3E6C
_0807E798: .4byte gBmSt

	THUMB_FUNC_END sub_807E760

	THUMB_FUNC_START sub_807E79C
sub_807E79C: @ 0x0807E79C
	push {r4, lr}
	ldr r4, _0807E7C0  @ gActionData
	ldrb r0, [r4, #0xc]
	bl GetUnit
	ldr r1, [r0, #0xc]
	movs r2, #1
	orrs r1, r2
	str r1, [r0, #0xc]
	movs r0, #0x13
	ldrsb r0, [r4, r0]
	movs r1, #0x14
	ldrsb r1, [r4, r1]
	bl sub_808320C
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807E7C0: .4byte gActionData

	THUMB_FUNC_END sub_807E79C

	THUMB_FUNC_START sub_807E7C4
sub_807E7C4: @ 0x0807E7C4
	push {lr}
	ldr r0, _0807E7DC  @ gActionData
	ldrb r0, [r0, #0xc]
	bl GetUnit
	ldr r1, [r0, #0xc]
	movs r2, #2
	negs r2, r2
	ands r1, r2
	str r1, [r0, #0xc]
	pop {r0}
	bx r0
	.align 2, 0
_0807E7DC: .4byte gActionData

	THUMB_FUNC_END sub_807E7C4

	THUMB_FUNC_START sub_807E7E0
sub_807E7E0: @ 0x0807E7E0
	push {r4, r5, lr}
	sub sp, #0x10
	adds r5, r0, #0
	ldr r1, [r5, #0x30]
	movs r0, #0x8d
	bl PlaySeSpacial
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	ldr r4, _0807E88C  @ gUnknown_089B0720
	movs r0, #2
	bl GetBackgroundTileDataOffset
	adds r1, r0, #0
	ldr r0, _0807E890  @ 0x06002C00
	adds r1, r1, r0
	adds r0, r4, #0
	bl Decompress
	ldr r4, _0807E894  @ gBG2TilemapBuffer
	ldr r0, [r5, #0x30]
	cmp r0, #0
	bge _0807E816
	adds r0, #7
_0807E816:
	asrs r0, r0, #3
	subs r1, r0, #2
	ldr r2, [r5, #0x34]
	cmp r2, #0
	bge _0807E822
	adds r2, #7
_0807E822:
	asrs r2, r2, #3
	subs r2, #2
	ldr r3, _0807E898  @ 0x00004160
	movs r0, #4
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _0807E89C  @ gUnknown_089B0840
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	adds r0, r4, #0
	bl sub_801474C
	movs r0, #4
	bl BG_EnableSyncByMask
	ldr r0, _0807E8A0  @ gUnknown_089B06AC
	ldr r1, _0807E8A4  @ 0x06013800
	bl Decompress
	ldr r0, _0807E8A8  @ gUnknown_089B0700
	movs r1, #0xa0
	lsls r1, r1, #2
	movs r2, #0x20
	bl CopyToPaletteBuffer
	ldr r0, _0807E8AC  @ gUnknown_089B0820
	str r5, [sp]
	movs r1, #0x80
	movs r2, #0x20
	movs r3, #4
	bl sub_80144CC
	bl sub_8081E78
	bl sub_8081EAC
	bl sub_807E978
	movs r0, #1
	movs r1, #0x10
	movs r2, #0x10
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	adds r1, r5, #0
	adds r1, #0x48
	movs r0, #1
	strh r0, [r1]
	add sp, #0x10
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807E88C: .4byte gUnknown_089B0720
_0807E890: .4byte 0x06002C00
_0807E894: .4byte gBG2TilemapBuffer
_0807E898: .4byte 0x00004160
_0807E89C: .4byte gUnknown_089B0840
_0807E8A0: .4byte gUnknown_089B06AC
_0807E8A4: .4byte 0x06013800
_0807E8A8: .4byte gUnknown_089B0700
_0807E8AC: .4byte gUnknown_089B0820

	THUMB_FUNC_END sub_807E7E0

	THUMB_FUNC_START sub_807E8B0
sub_807E8B0: @ 0x0807E8B0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	adds r7, r0, #0
	adds r4, r7, #0
	adds r4, #0x48
	movs r0, #0
	ldrsh r3, [r4, r0]
	movs r0, #0x1e
	str r0, [sp]
	movs r0, #5
	movs r1, #1
	movs r2, #0x10
	bl Interpolate
	adds r2, r0, #0
	ldrh r0, [r4]
	adds r0, #1
	movs r1, #0
	mov r8, r1
	strh r0, [r4]
	ldr r0, [r7, #0x30]
	ldr r1, [r7, #0x34]
	bl sub_8081F24
	movs r1, #0
	ldrsh r0, [r4, r1]
	cmp r0, #0x1d
	ble _0807E920
	mov r0, r8
	strh r0, [r4]
	adds r0, r7, #0
	bl Proc_Break
	ldr r5, _0807E92C  @ gUnknown_089A6254
	ldr r1, [r7, #0x30]
	ldr r2, [r7, #0x34]
	ldr r6, _0807E930  @ 0x000041C0
	mov r0, r8
	str r0, [sp]
	movs r4, #2
	str r4, [sp, #4]
	adds r0, r5, #0
	adds r3, r6, #0
	bl APProc_Create
	ldr r1, [r7, #0x30]
	ldr r2, [r7, #0x34]
	movs r0, #1
	str r0, [sp]
	str r4, [sp, #4]
	adds r0, r5, #0
	adds r3, r6, #0
	bl APProc_Create
_0807E920:
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807E92C: .4byte gUnknown_089A6254
_0807E930: .4byte 0x000041C0

	THUMB_FUNC_END sub_807E8B0

	THUMB_FUNC_START sub_807E934
sub_807E934: @ 0x0807E934
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	adds r4, r5, #0
	adds r4, #0x48
	movs r0, #0
	ldrsh r3, [r4, r0]
	movs r0, #0x1e
	str r0, [sp]
	movs r0, #5
	movs r1, #0x10
	movs r2, #0
	bl Interpolate
	adds r2, r0, #0
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
	ldr r0, [r5, #0x30]
	ldr r1, [r5, #0x34]
	bl sub_8081F24
	movs r1, #0
	ldrsh r0, [r4, r1]
	cmp r0, #0x1d
	ble _0807E96E
	adds r0, r5, #0
	bl Proc_Break
_0807E96E:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_807E934

	THUMB_FUNC_START sub_807E978
sub_807E978: @ 0x0807E978
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	ldr r4, _0807EA1C  @ gLCDControlBuffer
	ldrb r2, [r4, #0xc]
	movs r1, #4
	negs r1, r1
	adds r0, r1, #0
	ands r0, r2
	strb r0, [r4, #0xc]
	ldrb r2, [r4, #0x10]
	adds r0, r1, #0
	ands r0, r2
	strb r0, [r4, #0x10]
	ldrb r2, [r4, #0x14]
	adds r0, r1, #0
	ands r0, r2
	strb r0, [r4, #0x14]
	ldrb r0, [r4, #0x18]
	ands r1, r0
	movs r6, #2
	orrs r1, r6
	strb r1, [r4, #0x18]
	movs r0, #0
	str r0, [sp]
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
	bl sub_8001F64
	movs r0, #0x34
	adds r0, r0, r4
	mov r8, r0
	ldrb r0, [r0]
	movs r1, #0x20
	orrs r0, r1
	adds r4, #0x36
	ldrb r2, [r4]
	movs r1, #0x21
	negs r1, r1
	ands r1, r2
	movs r5, #1
	orrs r0, r5
	orrs r0, r6
	movs r2, #4
	orrs r0, r2
	movs r3, #8
	orrs r0, r3
	movs r2, #0x10
	orrs r0, r2
	mov r7, r8
	strb r0, [r7]
	orrs r1, r5
	orrs r1, r6
	movs r0, #5
	negs r0, r0
	ands r1, r0
	orrs r1, r3
	orrs r1, r2
	strb r1, [r4]
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807EA1C: .4byte gLCDControlBuffer

	THUMB_FUNC_END sub_807E978

	THUMB_FUNC_START sub_807EA20
sub_807EA20: @ 0x0807EA20
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	adds r1, r3, #0
	ldr r0, _0807EA4C  @ gUnknown_089A3EC4
	bl Proc_Start
	adds r2, r0, #0
	str r4, [r2, #0x58]
	adds r0, #0x64
	movs r1, #0
	strh r1, [r0]
	adds r0, #2
	strh r5, [r0]
	adds r0, #2
	strh r1, [r0]
	adds r0, #2
	strh r6, [r0]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807EA4C: .4byte gUnknown_089A3EC4

	THUMB_FUNC_END sub_807EA20

	THUMB_FUNC_START sub_807EA50
sub_807EA50: @ 0x0807EA50
	push {lr}
	ldr r0, _0807EA5C  @ gUnknown_089A3EC4
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
_0807EA5C: .4byte gUnknown_089A3EC4

	THUMB_FUNC_END sub_807EA50

	THUMB_FUNC_START sub_807EA60
sub_807EA60: @ 0x0807EA60
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r0, [r6, #0x58]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r4, r6, #0
	adds r4, #0x64
	ldrh r1, [r4]
	adds r5, r6, #0
	adds r5, #0x68
	ldrh r2, [r5]
	bl BG_SetPosition
	adds r0, r6, #0
	adds r0, #0x66
	ldrh r0, [r0]
	ldrh r1, [r4]
	adds r0, r0, r1
	strh r0, [r4]
	adds r0, r6, #0
	adds r0, #0x6a
	ldrh r0, [r0]
	ldrh r1, [r5]
	adds r0, r0, r1
	strh r0, [r5]
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_807EA60

.align 2, 0
