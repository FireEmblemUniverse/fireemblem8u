	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	THUMB_FUNC_START sub_806FC30
sub_806FC30: @ 0x0806FC30
	push {lr}
	lsls r0, r0, #0x10
	ldr r2, _0806FC4C  @ gEkrTsaBuffer
	lsrs r1, r0, #0x10
	orrs r1, r0
	movs r0, #0x80
	lsls r0, r0, #3
_0806FC3E:
	stm r2!, {r1}
	subs r0, #1
	cmp r0, #0
	bne _0806FC3E
	pop {r0}
	bx r0
	.align 2, 0
_0806FC4C: .4byte gEkrTsaBuffer

	THUMB_FUNC_END sub_806FC30

	THUMB_FUNC_START sub_806FC50
sub_806FC50: @ 0x0806FC50
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	movs r0, #0x2c
	ldrsh r3, [r4, r0]
	movs r0, #8
	str r0, [sp]
	movs r0, #1
	movs r1, #4
	movs r2, #0x10
	bl Interpolate
	bl EkrUpdateSomePalMaybe
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #9
	bne _0806FC84
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r4, #0
	bl Proc_Break
_0806FC84:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_806FC50

	THUMB_FUNC_START EfxDracoZombiePrepareTSA
EfxDracoZombiePrepareTSA: @ 0x0806FC8C
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	cmp r2, #1
	bne _0806FCAC
	ldr r0, _0806FCA4  @ gUnknown_0879115C
	ldr r1, _0806FCA8  @ gEkrTsaBuffer
	bl LZ77UnCompVram
	b _0806FCB4
	.align 2, 0
_0806FCA4: .4byte gUnknown_0879115C
_0806FCA8: .4byte gEkrTsaBuffer
_0806FCAC:
	ldr r0, _0806FCCC  @ gUnknown_08790F88
	ldr r1, _0806FCD0  @ gEkrTsaBuffer
	bl LZ77UnCompVram
_0806FCB4:
	bl sub_806FBB8
	ldr r0, _0806FCD4  @ gEkrBgXOffset
	ldr r0, [r0]
	adds r4, r4, r0
	adds r0, r4, #0
	adds r1, r5, #0
	bl EkrDragonBgSetPostion
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806FCCC: .4byte gUnknown_08790F88
_0806FCD0: .4byte gEkrTsaBuffer
_0806FCD4: .4byte gEkrBgXOffset

	THUMB_FUNC_END EfxDracoZombiePrepareTSA

	THUMB_FUNC_START EfxDracoZombiePrepareImg
EfxDracoZombiePrepareImg: @ 0x0806FCD8
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r0, #0
	bl sub_806FC30
	movs r0, #0
	bl sub_80559D0
	ldr r0, _0806FD58  @ gBG3TilemapBuffer
	movs r1, #0
	bl BG_Fill
	movs r0, #8
	bl BG_EnableSyncByMask
	ldr r0, _0806FD5C  @ Img_EfxDracoZombie
	ldr r1, _0806FD60  @ 0x06008000
	bl LZ77UnCompVram
	ldr r3, _0806FD64  @ gLCDControlBuffer
	ldrb r2, [r3, #0xc]
	movs r1, #4
	negs r1, r1
	adds r0, r1, #0
	ands r0, r2
	strb r0, [r3, #0xc]
	ldrb r2, [r3, #0x10]
	adds r0, r1, #0
	ands r0, r2
	movs r2, #1
	orrs r0, r2
	strb r0, [r3, #0x10]
	ldrb r0, [r3, #0x18]
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	strb r1, [r3, #0x18]
	ldrb r0, [r3, #0x14]
	movs r1, #3
	orrs r0, r1
	strb r0, [r3, #0x14]
	ldr r0, _0806FD68  @ Pal_EfxDracoZombie
	ldr r4, _0806FD6C  @ pPalette6Buffer
	adds r1, r4, #0
	movs r2, #8
	bl CpuFastSet
	bl EnablePaletteSync
	subs r4, #0x40
	ldr r1, _0806FD70  @ gUnknown_02020068
	adds r0, r4, #0
	movs r2, #0x10
	bl CpuFastSet
	movs r0, #1
	bl SetEkrDragonStatusUnk1
	movs r0, #0
	strh r0, [r5, #0x2e]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806FD58: .4byte gBG3TilemapBuffer
_0806FD5C: .4byte Img_EfxDracoZombie
_0806FD60: .4byte 0x06008000
_0806FD64: .4byte gLCDControlBuffer
_0806FD68: .4byte Pal_EfxDracoZombie
_0806FD6C: .4byte pPalette6Buffer
_0806FD70: .4byte gUnknown_02020068

	THUMB_FUNC_END EfxDracoZombiePrepareImg

	THUMB_FUNC_START sub_806FD74
sub_806FD74: @ 0x0806FD74
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r7, r0, #0
	ldr r0, _0806FD94  @ gEkrSomeType
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #2
	bne _0806FD98
	adds r0, r7, #0
	bl sub_806FEA4
	adds r0, r7, #0
	movs r1, #0
	bl Proc_Goto
	b _0806FE00
	.align 2, 0
_0806FD94: .4byte gEkrSomeType
_0806FD98:
	movs r2, #0x2c
	ldrsh r0, [r7, r2]
	cmp r0, #0
	bne _0806FE16
	ldr r1, _0806FDB8  @ gUnknown_087585F8
	movs r2, #0x2e
	ldrsh r0, [r7, r2]
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrb r0, [r0, #7]
	cmp r0, #1
	beq _0806FDBC
	cmp r0, #2
	beq _0806FDCC
	b _0806FDDC
	.align 2, 0
_0806FDB8: .4byte gUnknown_087585F8
_0806FDBC:
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #0xe6
	movs r2, #0x78
	movs r3, #0
	bl sub_80729A4
	b _0806FDDC
_0806FDCC:
	movs r0, #0xb8
	lsls r0, r0, #2
	movs r1, #0x80
	lsls r1, r1, #1
	movs r2, #0x78
	movs r3, #0
	bl sub_80729A4
_0806FDDC:
	ldr r1, _0806FE08  @ gUnknown_087585F8
	movs r2, #0x2e
	ldrsh r0, [r7, r2]
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r0, [r0]
	cmp r0, #0
	bne _0806FE0C
	strh r0, [r7, #0x2c]
	ldr r0, [r7, #0x5c]
	movs r1, #0x10
	bl StartSpellBG_FLASH
	movs r0, #0
	movs r1, #0x2d
	movs r2, #0xb
	bl sub_8070380
_0806FE00:
	adds r0, r7, #0
	bl Proc_Break
	b _0806FE8E
	.align 2, 0
_0806FE08: .4byte gUnknown_087585F8
_0806FE0C:
	ldr r1, _0806FE98  @ gEkrTsaBuffer
	bl LZ77UnCompVram
	bl sub_806FBB8
_0806FE16:
	ldr r6, _0806FE9C  @ gUnknown_087585F8
	movs r1, #0x2e
	ldrsh r0, [r7, r1]
	lsls r4, r0, #3
	adds r4, r4, r6
	movs r1, #5
	ldrsb r1, [r4, r1]
	adds r0, #1
	lsls r0, r0, #3
	adds r0, r0, r6
	movs r2, #5
	ldrsb r2, [r0, r2]
	movs r0, #0x2c
	ldrsh r3, [r7, r0]
	ldrb r0, [r4, #4]
	str r0, [sp]
	movs r0, #0
	bl Interpolate
	adds r5, r0, #0
	movs r1, #0x2e
	ldrsh r0, [r7, r1]
	lsls r4, r0, #3
	adds r4, r4, r6
	ldrb r1, [r4, #6]
	adds r0, #1
	lsls r0, r0, #3
	adds r0, r0, r6
	ldrb r2, [r0, #6]
	movs r0, #0x2c
	ldrsh r3, [r7, r0]
	ldrb r0, [r4, #4]
	str r0, [sp]
	movs r0, #0
	bl Interpolate
	adds r1, r0, #0
	ldr r0, _0806FEA0  @ gEkrBgXOffset
	ldr r0, [r0]
	adds r5, r5, r0
	adds r0, r5, #0
	bl EkrDragonBgSetPostion
	ldrh r0, [r7, #0x2c]
	adds r0, #1
	strh r0, [r7, #0x2c]
	movs r2, #0x2c
	ldrsh r1, [r7, r2]
	movs r2, #0x2e
	ldrsh r0, [r7, r2]
	lsls r0, r0, #3
	adds r0, r0, r6
	ldrb r0, [r0, #4]
	cmp r1, r0
	bne _0806FE8E
	movs r0, #0
	strh r0, [r7, #0x2c]
	ldrh r0, [r7, #0x2e]
	adds r0, #1
	strh r0, [r7, #0x2e]
_0806FE8E:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806FE98: .4byte gEkrTsaBuffer
_0806FE9C: .4byte gUnknown_087585F8
_0806FEA0: .4byte gEkrBgXOffset

	THUMB_FUNC_END sub_806FD74

	THUMB_FUNC_START sub_806FEA4
sub_806FEA4: @ 0x0806FEA4
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl EfxDracoZombiePrepareTSA
	ldr r0, [r4, #0x5c]
	movs r1, #0xc0
	bl EkrPrepareBanimfx
	ldr r0, [r4, #0x5c]
	bl GetAISSubjectId
	bl SetAnimStateUnHidden
	ldr r1, _0806FED0  @ gEkrSpellAnimIndexLutMaybe
	movs r0, #0x15
	strh r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806FED0: .4byte gEkrSpellAnimIndexLutMaybe

	THUMB_FUNC_END sub_806FEA4

	THUMB_FUNC_START sub_806FED4
sub_806FED4: @ 0x0806FED4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetCoreAIStruct
	bl GetEkrDragonStatusAttr
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	beq _0806FEF8
	ldr r0, [r4, #0x5c]
	movs r1, #2
	bl AddEkrDragonStatusAttr
	adds r0, r4, #0
	bl Proc_Break
_0806FEF8:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_806FED4

	THUMB_FUNC_START sub_806FF00
sub_806FF00: @ 0x0806FF00
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetEkrDragonStatusAttr
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	beq _0806FF40
	movs r0, #0
	strh r0, [r4, #0x2c]
	ldr r0, [r4, #0x5c]
	bl sub_8070234
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0806FF3A
	ldr r0, [r4, #0x5c]
	bl GetAISSubjectId
	bl SetAnimStateHidden
	movs r0, #0
	movs r1, #0
	movs r2, #1
	bl EfxDracoZombiePrepareTSA
_0806FF3A:
	adds r0, r4, #0
	bl Proc_Break
_0806FF40:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_806FF00

	THUMB_FUNC_START sub_806FF48
sub_806FF48: @ 0x0806FF48
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r6, r0, #0
	ldr r0, [r6, #0x5c]
	bl sub_8070234
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _0806FFC4
	ldr r0, _0806FFB8  @ gBG3TilemapBuffer
	movs r1, #0xc0
	lsls r1, r1, #7
	bl BG_Fill
	movs r0, #8
	bl BG_EnableSyncByMask
	ldr r0, _0806FFBC  @ gPaletteBuffer
	movs r1, #6
	movs r2, #1
	movs r3, #0x10
	bl sub_80712B0
	bl EnablePaletteSync
	movs r0, #0
	bl SetEkrDragonStatusUnk1
	ldr r3, _0806FFC0  @ gLCDControlBuffer
	ldrb r2, [r3, #0xc]
	movs r1, #4
	negs r1, r1
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
	adds r0, r6, #0
	bl Proc_Break
	b _080700B4
	.align 2, 0
_0806FFB8: .4byte gBG3TilemapBuffer
_0806FFBC: .4byte gPaletteBuffer
_0806FFC0: .4byte gLCDControlBuffer
_0806FFC4:
	movs r0, #0x2c
	ldrsh r3, [r6, r0]
	movs r0, #8
	str r0, [sp]
	movs r0, #4
	movs r1, #0
	movs r2, #0x10
	bl Interpolate
	adds r5, r0, #0
	ldr r0, _08070004  @ Pal_EfxDracoZombie
	ldr r4, _08070008  @ pPalette6Buffer
	adds r1, r4, #0
	movs r2, #8
	bl CpuFastSet
	adds r7, r4, #0
	subs r7, #0xc0
	adds r0, r7, #0
	movs r1, #6
	movs r2, #1
	adds r3, r5, #0
	bl sub_80712B0
	ldr r0, _0807000C  @ gEkrSomeType
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _08070010
	cmp r0, #1
	beq _08070030
	b _08070048
	.align 2, 0
_08070004: .4byte Pal_EfxDracoZombie
_08070008: .4byte pPalette6Buffer
_0807000C: .4byte gEkrSomeType
_08070010:
	ldr r0, _0807002C  @ gUnknown_02020068
	adds r1, r4, #0
	subs r1, #0x40
	movs r2, #0x10
	bl CpuFastSet
	adds r0, r7, #0
	movs r1, #4
	movs r2, #2
	adds r3, r5, #0
	bl sub_80712B0
	b _08070048
	.align 2, 0
_0807002C: .4byte gUnknown_02020068
_08070030:
	ldr r0, _080700BC  @ gUnknown_02020068
	adds r1, r4, #0
	subs r1, #0x40
	movs r2, #8
	bl CpuFastSet
	adds r0, r7, #0
	movs r1, #4
	movs r2, #1
	adds r3, r5, #0
	bl sub_80712B0
_08070048:
	bl EnablePaletteSync
	ldrh r0, [r6, #0x2c]
	adds r0, #1
	movs r4, #0
	strh r0, [r6, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #9
	bne _080700B4
	strh r4, [r6, #0x2c]
	ldr r0, [r6, #0x5c]
	bl GetAISSubjectId
	ldr r1, _080700C0  @ gBanimSideVaildFlagMaybe
	lsls r0, r0, #1
	adds r0, r0, r1
	strh r4, [r0]
	ldr r0, _080700C4  @ gBG3TilemapBuffer
	movs r1, #0xc0
	lsls r1, r1, #7
	bl BG_Fill
	movs r0, #8
	bl BG_EnableSyncByMask
	movs r0, #0
	bl SetEkrDragonStatusUnk1
	ldr r3, _080700C8  @ gLCDControlBuffer
	ldrb r2, [r3, #0xc]
	movs r1, #4
	negs r1, r1
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
	adds r0, r6, #0
	bl Proc_Break
_080700B4:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080700BC: .4byte gUnknown_02020068
_080700C0: .4byte gBanimSideVaildFlagMaybe
_080700C4: .4byte gBG3TilemapBuffer
_080700C8: .4byte gLCDControlBuffer

	THUMB_FUNC_END sub_806FF48

	THUMB_FUNC_START sub_80700CC
sub_80700CC: @ 0x080700CC
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	movs r1, #0x2c
	ldrsh r0, [r5, r1]
	cmp r0, #0
	bne _080700EA
	ldr r0, _08070130  @ gPlaySt
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl UnpackChapterMapGraphics
	bl RenderBmMap
_080700EA:
	movs r0, #0x2c
	ldrsh r3, [r5, r0]
	movs r4, #8
	str r4, [sp]
	movs r0, #4
	movs r1, #0x10
	movs r2, #4
	bl Interpolate
	adds r6, r0, #0
	bl EkrUpdateSomePalMaybe
	ldr r0, [r5, #0x5c]
	bl sub_8070234
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08070176
	movs r1, #0x2c
	ldrsh r3, [r5, r1]
	str r4, [sp]
	movs r0, #4
	movs r1, #0x10
	movs r2, #0
	bl Interpolate
	adds r6, r0, #0
	ldr r0, _08070134  @ gEkrSomeType
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _08070138
	cmp r0, #1
	beq _0807015C
	b _08070176
	.align 2, 0
_08070130: .4byte gPlaySt
_08070134: .4byte gEkrSomeType
_08070138:
	ldr r0, _08070154  @ gUnknown_02020068
	ldr r4, _08070158  @ pPalette4Buffer
	adds r1, r4, #0
	movs r2, #0x10
	bl CpuFastSet
	subs r4, #0x80
	adds r0, r4, #0
	movs r1, #4
	movs r2, #2
	adds r3, r6, #0
	bl sub_80712B0
	b _08070176
	.align 2, 0
_08070154: .4byte gUnknown_02020068
_08070158: .4byte pPalette4Buffer
_0807015C:
	ldr r0, _08070198  @ gUnknown_02020068
	ldr r4, _0807019C  @ pPalette4Buffer
	adds r1, r4, #0
	movs r2, #8
	bl CpuFastSet
	subs r4, #0x80
	adds r0, r4, #0
	movs r1, #4
	movs r2, #1
	adds r3, r6, #0
	bl sub_80712B0
_08070176:
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #9
	bne _0807018E
	movs r0, #0
	strh r0, [r5, #0x2c]
	adds r0, r5, #0
	bl Proc_Break
_0807018E:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08070198: .4byte gUnknown_02020068
_0807019C: .4byte pPalette4Buffer

	THUMB_FUNC_END sub_80700CC

	THUMB_FUNC_START sub_80701A0
sub_80701A0: @ 0x080701A0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	movs r1, #8
	bl AddEkrDragonStatusAttr
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80701A0

	THUMB_FUNC_START EfxDoDracoZombieIntroAnim
EfxDoDracoZombieIntroAnim: @ 0x080701B8
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	bl GetEkrDragonStatus
	adds r6, r0, #0
	ldr r0, _080701E4  @ gUnknown_08758670
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	str r4, [r6, #4]
	adds r0, r5, #0
	movs r1, #1
	bl AddEkrDragonStatusAttr
	str r5, [r6, #0xc]
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080701E4: .4byte gUnknown_08758670

	THUMB_FUNC_END EfxDoDracoZombieIntroAnim

	THUMB_FUNC_START SetEkrDragonStatusAttrFinished
SetEkrDragonStatusAttrFinished: @ 0x080701E8
	push {lr}
	movs r1, #4
	bl AddEkrDragonStatusAttr
	pop {r0}
	bx r0

	THUMB_FUNC_END SetEkrDragonStatusAttrFinished

	THUMB_FUNC_START sub_80701F4
sub_80701F4: @ 0x080701F4
	push {lr}
	movs r1, #0x80
	lsls r1, r1, #5
	bl AddEkrDragonStatusAttr
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80701F4

	THUMB_FUNC_START sub_8070204
sub_8070204: @ 0x08070204
	push {lr}
	movs r1, #0x80
	lsls r1, r1, #6
	bl AddEkrDragonStatusAttr
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8070204

	THUMB_FUNC_START CheckEkrDragonDeadEffectMaybe
CheckEkrDragonDeadEffectMaybe: @ 0x08070214
	push {lr}
	bl GetEkrDragonStatusAttr
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #0x80
	lsls r1, r1, #5
	ands r0, r1
	cmp r0, #0
	bne _0807022C
	movs r0, #0
	b _0807022E
_0807022C:
	movs r0, #1
_0807022E:
	pop {r1}
	bx r1

	THUMB_FUNC_END CheckEkrDragonDeadEffectMaybe

	THUMB_FUNC_START sub_8070234
sub_8070234: @ 0x08070234
	push {lr}
	bl GetEkrDragonStatusAttr
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #0x80
	lsls r1, r1, #6
	ands r0, r1
	cmp r0, #0
	bne _0807024C
	movs r0, #0
	b _0807024E
_0807024C:
	movs r0, #1
_0807024E:
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8070234

	THUMB_FUNC_START sub_8070254
sub_8070254: @ 0x08070254
	push {lr}
	bl GetBanimDragonStatusType
	cmp r0, #1
	beq _08070268
	cmp r0, #1
	bcc _08070276
	cmp r0, #2
	beq _08070270
	b _08070276
_08070268:
	movs r0, #0
	bl SetAnimStateHidden
	b _08070276
_08070270:
	movs r0, #0
	bl SetAnimStateHidden
_08070276:
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8070254

	THUMB_FUNC_START sub_807027C
sub_807027C: @ 0x0807027C
	push {r4, r5, lr}
	adds r4, r0, #0
	bl GetBanimDragonStatusType
	cmp r0, #1
	beq _08070296
	cmp r0, #1
	bcc _080702C6
	cmp r0, #2
	beq _08070296
	cmp r0, #3
	bne _08070298
	b _080702C6
_08070296:
	ldr r5, _080702B0  @ gUnknown_08802D24
_08070298:
	adds r0, r4, #0
	bl GetAISSubjectId
	cmp r0, #0
	bne _080702B8
	ldr r1, _080702B4  @ pPalette6Buffer
	adds r0, r5, #0
	movs r2, #8
	bl CpuFastSet
	b _080702C2
	.align 2, 0
_080702B0: .4byte gUnknown_08802D24
_080702B4: .4byte pPalette6Buffer
_080702B8:
	ldr r1, _080702CC  @ pPalette7Buffer
	adds r0, r5, #0
	movs r2, #8
	bl CpuFastSet
_080702C2:
	bl EnablePaletteSync
_080702C6:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080702CC: .4byte pPalette7Buffer

	THUMB_FUNC_END sub_807027C

	THUMB_FUNC_START sub_80702D0
sub_80702D0: @ 0x080702D0
	push {lr}
	bl GetBanimDragonStatusType
	adds r1, r0, #0
	cmp r1, #1
	beq _080702E6
	cmp r1, #1
	bcc _080702F2
	cmp r1, #2
	beq _080702F0
	b _080702F2
_080702E6:
	ldr r0, _080702EC  @ Pal_EfxDracoZombie
	b _080702F2
	.align 2, 0
_080702EC: .4byte Pal_EfxDracoZombie
_080702F0:
	ldr r0, _080702F8  @ Pal_DemonKingBG
_080702F2:
	pop {r1}
	bx r1
	.align 2, 0
_080702F8: .4byte Pal_DemonKingBG

	THUMB_FUNC_END sub_80702D0

	THUMB_FUNC_START sub_80702FC
sub_80702FC: @ 0x080702FC
	push {lr}
	cmp r0, #0
	bne _08070314
	bl sub_80702D0
	ldr r1, _08070310  @ gUnknown_02022B88
	movs r2, #8
	bl CpuFastSet
	b _08070320
	.align 2, 0
_08070310: .4byte gUnknown_02022B88
_08070314:
	bl sub_80702D0
	ldr r1, _08070328  @ gUnknown_02022BC8
	movs r2, #8
	bl CpuFastSet
_08070320:
	bl EnablePaletteSync
	pop {r0}
	bx r0
	.align 2, 0
_08070328: .4byte gUnknown_02022BC8

	THUMB_FUNC_END sub_80702FC

	THUMB_FUNC_START sub_807032C
sub_807032C: @ 0x0807032C
	push {lr}
	cmp r0, #0
	bne _08070344
	bl sub_80702D0
	ldr r1, _08070340  @ pPalette6Buffer
	movs r2, #8
	bl CpuFastSet
	b _08070350
	.align 2, 0
_08070340: .4byte pPalette6Buffer
_08070344:
	bl sub_80702D0
	ldr r1, _08070358  @ pPalette7Buffer
	movs r2, #8
	bl CpuFastSet
_08070350:
	bl EnablePaletteSync
	pop {r0}
	bx r0
	.align 2, 0
_08070358: .4byte pPalette7Buffer

	THUMB_FUNC_END sub_807032C

	THUMB_FUNC_START sub_807035C
sub_807035C: @ 0x0807035C
	push {r4, lr}
	adds r4, r0, #0
	bl GetBanimDragonStatusType
	cmp r0, #0
	beq _0807037A
	bl GetBanimDragonStatusType
	cmp r0, #3
	beq _0807037A
	adds r0, r4, #0
	bl GetAISSubjectId
	bl sub_807032C
_0807037A:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_807035C

	THUMB_FUNC_START sub_8070380
sub_8070380: @ 0x08070380
	push {lr}
	movs r3, #3
	bl sub_807038C
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8070380

	THUMB_FUNC_START sub_807038C
sub_807038C: @ 0x0807038C
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r6, r0, #0
	mov r8, r1
	adds r5, r2, #0
	adds r1, r3, #0
	ldr r0, _080703C0  @ gUnknown_087586D8
	bl Proc_Start
	adds r4, r0, #0
	str r6, [r4, #0x5c]
	adds r0, r5, #0
	movs r1, #0
	bl sub_8053678
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
_080703C0: .4byte gUnknown_087586D8

	THUMB_FUNC_END sub_807038C

	THUMB_FUNC_START sub_80703C4
sub_80703C4: @ 0x080703C4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	mov sl, r0
	ldr r0, [r0, #0x5c]
	mov r9, r0
	ldr r4, _08070554  @ gUnknown_02017760
	ldrh r1, [r4]
	ldrh r2, [r4, #2]
	movs r0, #2
	bl BG_SetPosition
	ldr r6, _08070558  @ gBanimBgPosMaybe
	ldrh r1, [r6]
	ldrh r2, [r4]
	adds r1, r1, r2
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldrh r2, [r6, #2]
	ldrh r3, [r4, #2]
	adds r2, r2, r3
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #0
	bl BG_SetPosition
	ldrh r0, [r6]
	ldrh r7, [r4]
	adds r0, r0, r7
	negs r0, r0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldrh r1, [r6, #2]
	ldrh r2, [r4, #2]
	adds r1, r1, r2
	negs r1, r1
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl EkrGauge_Setxy323A
	ldrh r0, [r6]
	ldrh r3, [r4]
	adds r0, r0, r3
	negs r0, r0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r1, [r6, #2]
	ldrh r7, [r4, #2]
	adds r1, r1, r7
	negs r1, r1
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	bl sub_8051B5C
	ldrh r1, [r4]
	ldrh r2, [r4, #2]
	movs r0, #3
	bl BG_SetPosition
	ldr r0, _0807055C  @ gEkrXPosBase
	ldrh r1, [r0]
	ldrh r0, [r4]
	subs r1, r1, r0
	ldr r2, _08070560  @ gEkrBgXOffset
	ldr r5, [r2]
	subs r1, r1, r5
	lsls r1, r1, #0x10
	ldr r3, _08070564  @ gEkrYPosBase
	ldrh r2, [r3]
	ldrh r3, [r4, #2]
	subs r2, r2, r3
	lsls r2, r2, #0x10
	ldr r4, _0807055C  @ gEkrXPosBase
	ldrh r4, [r4, #2]
	adds r0, r0, r4
	subs r0, r0, r5
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	ldr r7, _08070564  @ gEkrYPosBase
	ldrh r0, [r7, #2]
	subs r0, r0, r3
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	lsrs r0, r1, #0x10
	mov r8, r0
	asrs r1, r1, #0x10
	lsrs r7, r2, #0x10
	asrs r2, r2, #0x10
	movs r0, #0
	bl SetEkrFrontAnimPostion
	lsls r1, r5, #0x10
	asrs r1, r1, #0x10
	lsls r2, r4, #0x10
	asrs r2, r2, #0x10
	movs r0, #1
	bl SetEkrFrontAnimPostion
	mov r1, r9
	cmp r1, #0
	beq _08070498
	mov r2, r8
	strh r2, [r1, #0x32]
	strh r7, [r1, #0x3a]
_08070498:
	mov r3, sl
	ldrh r0, [r3, #0x2c]
	adds r0, #1
	strh r0, [r3, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r4, #0x2e
	ldrsh r1, [r3, r4]
	cmp r0, r1
	ble _08070544
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	ldrh r1, [r6]
	ldrh r2, [r6, #2]
	movs r0, #0
	bl BG_SetPosition
	ldrh r0, [r6]
	negs r0, r0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldrh r1, [r6, #2]
	negs r1, r1
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl EkrGauge_Setxy323A
	ldrh r0, [r6]
	negs r0, r0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r1, [r6, #2]
	negs r1, r1
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	bl sub_8051B5C
	movs r0, #3
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	ldr r7, _08070560  @ gEkrBgXOffset
	ldr r2, [r7]
	ldr r0, _0807055C  @ gEkrXPosBase
	ldrh r1, [r0]
	subs r1, r1, r2
	lsls r1, r1, #0x10
	ldrh r0, [r0, #2]
	subs r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	ldr r2, _08070564  @ gEkrYPosBase
	ldrh r4, [r2, #2]
	lsrs r3, r1, #0x10
	mov r8, r3
	asrs r1, r1, #0x10
	ldrh r7, [r2]
	movs r0, #0
	ldrsh r2, [r2, r0]
	movs r0, #0
	bl SetEkrFrontAnimPostion
	lsls r1, r5, #0x10
	asrs r1, r1, #0x10
	lsls r2, r4, #0x10
	asrs r2, r2, #0x10
	movs r0, #1
	bl SetEkrFrontAnimPostion
	mov r1, r9
	cmp r1, #0
	beq _08070536
	mov r2, r8
	strh r2, [r1, #0x32]
	strh r7, [r1, #0x3a]
_08070536:
	mov r3, sl
	ldr r0, [r3, #0x60]
	bl Proc_End
	mov r0, sl
	bl Proc_Break
_08070544:
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08070554: .4byte gUnknown_02017760
_08070558: .4byte gBanimBgPosMaybe
_0807055C: .4byte gEkrXPosBase
_08070560: .4byte gEkrBgXOffset
_08070564: .4byte gEkrYPosBase

	THUMB_FUNC_END sub_80703C4

	THUMB_FUNC_START sub_8070568
sub_8070568: @ 0x08070568
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	ldr r0, _080705A0  @ gUnknown_087586F0
	movs r1, #0
	bl Proc_Start
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r4, [r0, #0x44]
	str r5, [r0, #0x48]
	str r6, [r0, #0x4c]
	ldr r2, _080705A4  @ gLCDControlBuffer
	adds r4, r2, #0
	adds r4, #0x3c
	ldrb r3, [r4]
	subs r1, #0x21
	adds r0, r1, #0
	ands r0, r3
	strb r0, [r4]
	adds r2, #0x3d
	ldrb r0, [r2]
	ands r1, r0
	strb r1, [r2]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080705A0: .4byte gUnknown_087586F0
_080705A4: .4byte gLCDControlBuffer

	THUMB_FUNC_END sub_8070568

	THUMB_FUNC_START sub_80705A8
sub_80705A8: @ 0x080705A8
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r7, r0, #0
	movs r0, #0x2c
	ldrsh r3, [r7, r0]
	ldr r0, [r7, #0x44]
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0x10
	bl Interpolate
	adds r6, r0, #0
	ldr r0, _08070610  @ gPaletteBuffer
	ldr r4, _08070614  @ gUnknown_020165C8
	movs r5, #0x80
	lsls r5, r5, #1
	adds r1, r4, #0
	adds r2, r5, #0
	bl CpuFastSet
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0x20
	adds r3, r6, #0
	bl sub_807132C
	movs r1, #0xa0
	lsls r1, r1, #0x13
	adds r0, r4, #0
	adds r2, r5, #0
	bl CpuFastSet
	bl DisablePaletteSync
	ldrh r0, [r7, #0x2c]
	adds r0, #1
	strh r0, [r7, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r1, [r7, #0x44]
	cmp r0, r1
	ble _08070608
	movs r0, #0
	strh r0, [r7, #0x2c]
	adds r0, r7, #0
	bl Proc_Break
_08070608:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08070610: .4byte gPaletteBuffer
_08070614: .4byte gUnknown_020165C8

	THUMB_FUNC_END sub_80705A8

	THUMB_FUNC_START sub_8070618
sub_8070618: @ 0x08070618
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r0, _08070668  @ gPaletteBuffer
	ldr r4, _0807066C  @ gUnknown_020165C8
	movs r5, #0x80
	lsls r5, r5, #1
	adds r1, r4, #0
	adds r2, r5, #0
	bl CpuFastSet
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0x20
	movs r3, #0x10
	bl sub_807132C
	movs r1, #0xa0
	lsls r1, r1, #0x13
	adds r0, r4, #0
	adds r2, r5, #0
	bl CpuFastSet
	bl DisablePaletteSync
	ldrh r0, [r6, #0x2c]
	adds r0, #1
	strh r0, [r6, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r1, [r6, #0x48]
	cmp r0, r1
	ble _08070662
	movs r0, #0
	strh r0, [r6, #0x2c]
	adds r0, r6, #0
	bl Proc_Break
_08070662:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08070668: .4byte gPaletteBuffer
_0807066C: .4byte gUnknown_020165C8

	THUMB_FUNC_END sub_8070618

	THUMB_FUNC_START sub_8070670
sub_8070670: @ 0x08070670
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r7, r0, #0
	movs r0, #0x2c
	ldrsh r3, [r7, r0]
	ldr r0, [r7, #0x4c]
	str r0, [sp]
	movs r0, #0
	movs r1, #0x10
	movs r2, #0
	bl Interpolate
	adds r6, r0, #0
	ldr r0, _080706D8  @ gPaletteBuffer
	ldr r4, _080706DC  @ gUnknown_020165C8
	movs r5, #0x80
	lsls r5, r5, #1
	adds r1, r4, #0
	adds r2, r5, #0
	bl CpuFastSet
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0x20
	adds r3, r6, #0
	bl sub_807132C
	movs r1, #0xa0
	lsls r1, r1, #0x13
	adds r0, r4, #0
	adds r2, r5, #0
	bl CpuFastSet
	bl DisablePaletteSync
	ldrh r0, [r7, #0x2c]
	adds r0, #1
	strh r0, [r7, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r1, [r7, #0x4c]
	cmp r0, r1
	ble _080706D0
	movs r0, #0
	strh r0, [r7, #0x2c]
	adds r0, r7, #0
	bl Proc_Break
_080706D0:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080706D8: .4byte gPaletteBuffer
_080706DC: .4byte gUnknown_020165C8

	THUMB_FUNC_END sub_8070670

	THUMB_FUNC_START sub_80706E0
sub_80706E0: @ 0x080706E0
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _0807070C  @ gLCDControlBuffer
	adds r2, r1, #0
	adds r2, #0x3c
	ldrb r0, [r2]
	movs r3, #0x20
	orrs r0, r3
	strb r0, [r2]
	adds r1, #0x3d
	ldrb r0, [r1]
	orrs r0, r3
	strb r0, [r1]
	bl EnablePaletteSync
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807070C: .4byte gLCDControlBuffer

	THUMB_FUNC_END sub_80706E0

	THUMB_FUNC_START sub_8070710
sub_8070710: @ 0x08070710
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	str r0, [sp]
	adds r6, r1, #0
	ldr r0, [sp, #0x24]
	lsls r2, r2, #0x10
	lsrs r1, r2, #0x10
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	movs r4, #0x1f
	movs r0, #0x1f
	ands r1, r0
	adds r0, r1, #0
	muls r0, r3, r0
	mov sl, r0
	lsrs r0, r2, #0x15
	ands r0, r4
	adds r1, r0, #0
	muls r1, r3, r1
	mov r9, r1
	lsrs r2, r2, #0x1a
	ands r2, r4
	adds r4, r2, #0
	muls r4, r3, r4
	mov r8, r4
	movs r7, #0x1f
	mov ip, r7
	movs r2, #0xf
_08070754:
	ldr r0, [sp]
	ldrh r1, [r0]
	movs r0, #0x1f
	ands r0, r1
	adds r3, r0, #0
	muls r3, r5, r3
	lsls r1, r1, #0x10
	lsrs r0, r1, #0x15
	mov r4, ip
	ands r0, r4
	adds r4, r0, #0
	muls r4, r5, r4
	lsrs r1, r1, #0x1a
	mov r7, ip
	ands r1, r7
	muls r1, r5, r1
	mov r7, sl
	adds r0, r3, r7
	lsrs r3, r0, #4
	mov r7, r9
	adds r0, r4, r7
	lsrs r4, r0, #4
	mov r7, r8
	adds r0, r1, r7
	lsrs r1, r0, #4
	cmp r3, #0x1f
	bls _0807078C
	movs r3, #0x1f
_0807078C:
	cmp r4, #0x1f
	bls _08070792
	movs r4, #0x1f
_08070792:
	cmp r1, #0x1f
	bls _08070798
	movs r1, #0x1f
_08070798:
	lsls r0, r4, #5
	orrs r3, r0
	lsls r0, r1, #0xa
	orrs r3, r0
	strh r3, [r6]
	ldr r0, [sp]
	adds r0, #2
	str r0, [sp]
	adds r6, #2
	subs r2, #1
	cmp r2, #0
	bge _08070754
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8070710

	THUMB_FUNC_START sub_80707C0
sub_80707C0: @ 0x080707C0
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0
	str r0, [r4, #0x2c]
	str r0, [r4, #0x30]
	ldr r1, _080707F8  @ gLCDControlBuffer
	adds r0, r1, #0
	adds r0, #0x44
	ldrb r2, [r0]
	adds r0, r4, #0
	adds r0, #0x3c
	strb r2, [r0]
	adds r1, #0x45
	ldrb r0, [r1]
	adds r1, r4, #0
	adds r1, #0x3d
	strb r0, [r1]
	bl sub_80702D0
	str r0, [r4, #0x34]
	bl sub_805526C
	bl ClearBG1
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080707F8: .4byte gLCDControlBuffer

	THUMB_FUNC_END sub_80707C0

	THUMB_FUNC_START sub_80707FC
sub_80707FC: @ 0x080707FC
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r6, r0, #0
	ldr r0, [r6, #0x34]
	ldr r4, _08070870  @ pPalette6Buffer
	ldr r1, [r6, #0x30]
	ldr r2, [r6, #0x38]
	lsls r1, r1, #1
	adds r1, r1, r2
	ldrh r2, [r1]
	adds r5, r6, #0
	adds r5, #0x3c
	ldrb r3, [r5]
	adds r7, r6, #0
	adds r7, #0x3d
	ldrb r1, [r7]
	str r1, [sp]
	adds r1, r4, #0
	bl sub_8070710
	ldr r0, [r6, #0x34]
	movs r1, #0x88
	lsls r1, r1, #2
	adds r4, r4, r1
	ldr r1, [r6, #0x30]
	ldr r2, [r6, #0x38]
	lsls r1, r1, #1
	adds r1, r1, r2
	ldrh r2, [r1]
	ldrb r3, [r5]
	ldrb r1, [r7]
	str r1, [sp]
	adds r1, r4, #0
	bl sub_8070710
	bl EnablePaletteSync
	ldr r0, [r6, #0x2c]
	adds r0, #1
	str r0, [r6, #0x2c]
	ldr r0, [r6, #0x30]
	adds r0, #1
	str r0, [r6, #0x30]
	ldr r1, [r6, #0x38]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #8
	cmp r1, r0
	bne _08070866
	movs r0, #0
	str r0, [r6, #0x30]
_08070866:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08070870: .4byte pPalette6Buffer

	THUMB_FUNC_END sub_80707FC

	THUMB_FUNC_START sub_8070874
sub_8070874: @ 0x08070874
	push {lr}
	bl GetBanimDragonStatusType
	cmp r0, #0
	beq _08070898
	bl GetBanimDragonStatusType
	cmp r0, #3
	beq _08070898
	ldr r0, _0807089C  @ gUnknown_08758720
	bl Proc_EndEach
	movs r0, #0
	bl sub_807032C
	movs r0, #0
	bl sub_80702FC
_08070898:
	pop {r0}
	bx r0
	.align 2, 0
_0807089C: .4byte gUnknown_08758720

	THUMB_FUNC_END sub_8070874

	THUMB_FUNC_START sub_80708A0
sub_80708A0: @ 0x080708A0
	push {lr}
	bl GetBanimDragonStatusType
	cmp r0, #0
	beq _080708BE
	bl GetBanimDragonStatusType
	cmp r0, #3
	beq _080708BE
	ldr r0, _080708C4  @ gUnknown_08758720
	movs r1, #3
	bl Proc_Start
	ldr r1, _080708C8  @ gUnknown_08758740
	str r1, [r0, #0x38]
_080708BE:
	pop {r0}
	bx r0
	.align 2, 0
_080708C4: .4byte gUnknown_08758720
_080708C8: .4byte gUnknown_08758740

	THUMB_FUNC_END sub_80708A0

	THUMB_FUNC_START EfxDoMyrrhIntroAnim
EfxDoMyrrhIntroAnim: @ 0x080708CC
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	bl GetEkrDragonStatus
	adds r6, r0, #0
	ldr r0, _080708F8  @ gUnknown_08758754
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	str r4, [r6, #4]
	adds r0, r5, #0
	movs r1, #1
	bl AddEkrDragonStatusAttr
	str r5, [r6, #0xc]
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080708F8: .4byte gUnknown_08758754

	THUMB_FUNC_END EfxDoMyrrhIntroAnim

	THUMB_FUNC_START sub_80708FC
sub_80708FC: @ 0x080708FC
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r4, _08070940  @ banim_data
	ldr r5, [r6, #0x5c]
	movs r0, #0
	strh r0, [r6, #0x2c]
	adds r0, r5, #0
	movs r1, #0xc4
	bl EkrPrepareBanimfx
	adds r0, r5, #0
	movs r1, #0
	bl sub_805A07C
	movs r0, #0xc4
	lsls r0, r0, #5
	adds r4, r4, r0
	ldr r0, [r4, #0x1c]
	ldr r4, _08070944  @ gUnknown_0201C790
	adds r1, r4, #0
	bl LZ77UnCompWram
	adds r0, r5, #0
	bl GetAISSubjectId
	cmp r0, #0
	bne _0807094C
	ldr r1, _08070948  @ gUnknown_02022B88
	adds r0, r4, #0
	movs r2, #0x10
	bl CpuFastSet
	b _08070956
	.align 2, 0
_08070940: .4byte banim_data
_08070944: .4byte gUnknown_0201C790
_08070948: .4byte gUnknown_02022B88
_0807094C:
	ldr r1, _08070968  @ gUnknown_02022BC8
	adds r0, r4, #0
	movs r2, #0x10
	bl CpuFastSet
_08070956:
	bl EnablePaletteSync
	adds r0, r6, #0
	bl Proc_Break
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08070968: .4byte gUnknown_02022BC8

	THUMB_FUNC_END sub_80708FC

	THUMB_FUNC_START sub_807096C
sub_807096C: @ 0x0807096C
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, [r5, #0x5c]
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x1a
	bne _08070996
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #0xdc
	bl SomePlaySound_8071990
	movs r0, #2
	ldrsh r1, [r4, r0]
	movs r0, #0xdc
	movs r2, #1
	bl sub_8071AB0
_08070996:
	ldr r0, [r4, #0x20]
	ldrb r0, [r0, #3]
	movs r1, #0x3f
	ands r0, r1
	cmp r0, #0
	bne _080709C4
	adds r1, #0xc1
	movs r0, #0xde
	bl SomePlaySound_8071990
	movs r0, #2
	ldrsh r1, [r4, r0]
	movs r0, #0xde
	movs r2, #1
	bl sub_8071AB0
	adds r0, r4, #0
	movs r1, #0xc3
	bl EkrPrepareBanimfx
	adds r0, r5, #0
	bl Proc_Break
_080709C4:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_807096C

	THUMB_FUNC_START sub_80709CC
sub_80709CC: @ 0x080709CC
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetCoreAIStruct
	ldr r0, [r4, #0x5c]
	movs r1, #2
	bl AddEkrDragonStatusAttr
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80709CC

	THUMB_FUNC_START sub_80709EC
sub_80709EC: @ 0x080709EC
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetEkrDragonStatusAttr
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	beq _08070A0C
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r4, #0
	bl Proc_Break
_08070A0C:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80709EC

	THUMB_FUNC_START sub_8070A14
sub_8070A14: @ 0x08070A14
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	ldr r5, [r6, #0x5c]
	ldr r7, _08070A60  @ banim_data
	adds r0, r5, #0
	bl GetAISSubjectId
	adds r4, r0, #0
	adds r0, r5, #0
	bl GetAISSubjectId
	adds r1, r0, #0
	ldr r0, _08070A64  @ gUnknown_0203E152
	lsls r4, r4, #1
	adds r4, r4, r0
	movs r2, #0
	ldrsh r0, [r4, r2]
	lsls r0, r0, #1
	adds r0, r0, r1
	bl sub_8058A60
	lsls r0, r0, #0x10
	cmp r0, #0
	bgt _08070A70
	movs r0, #0
	strh r0, [r6, #0x2c]
	adds r0, r5, #0
	movs r1, #0xc6
	bl EkrPrepareBanimfx
	ldr r1, _08070A68  @ gEkrSpellAnimIndexLutMaybe
	ldr r0, _08070A6C  @ 0x0000FFFF
	strh r0, [r1]
	adds r0, r6, #0
	bl Proc_Break
	b _08070ADA
	.align 2, 0
_08070A60: .4byte banim_data
_08070A64: .4byte gUnknown_0203E152
_08070A68: .4byte gEkrSpellAnimIndexLutMaybe
_08070A6C: .4byte 0x0000FFFF
_08070A70:
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #0xdd
	bl SomePlaySound_8071990
	movs r0, #2
	ldrsh r1, [r5, r0]
	movs r0, #0xdd
	movs r2, #1
	bl sub_8071AB0
	adds r0, r5, #0
	movs r1, #0xc5
	bl EkrPrepareBanimfx
	adds r0, r5, #0
	movs r1, #0
	bl sub_805A07C
	adds r0, r6, #0
	bl Proc_Break
	movs r1, #0xc4
	lsls r1, r1, #5
	adds r0, r7, r1
	ldr r0, [r0, #0x1c]
	ldr r4, _08070AC4  @ gUnknown_0201C790
	adds r1, r4, #0
	bl LZ77UnCompWram
	adds r0, r5, #0
	bl GetAISSubjectId
	cmp r0, #0
	bne _08070ACC
	ldr r1, _08070AC8  @ gUnknown_02022B88
	adds r0, r4, #0
	movs r2, #0x10
	bl CpuFastSet
	b _08070AD6
	.align 2, 0
_08070AC4: .4byte gUnknown_0201C790
_08070AC8: .4byte gUnknown_02022B88
_08070ACC:
	ldr r1, _08070AE0  @ gUnknown_02022BC8
	adds r0, r4, #0
	movs r2, #0x10
	bl CpuFastSet
_08070AD6:
	bl EnablePaletteSync
_08070ADA:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08070AE0: .4byte gUnknown_02022BC8

	THUMB_FUNC_END sub_8070A14

	THUMB_FUNC_START sub_8070AE4
sub_8070AE4: @ 0x08070AE4
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, [r5, #0x5c]
	ldr r0, [r4, #0x20]
	ldrb r0, [r0, #3]
	movs r1, #0x3f
	ands r0, r1
	cmp r0, #0
	bne _08070B30
	adds r0, r4, #0
	movs r1, #0xc6
	bl EkrPrepareBanimfx
	ldr r0, [r5, #0x5c]
	movs r1, #8
	bl AddEkrDragonStatusAttr
	adds r0, r4, #0
	bl GetAISSubjectId
	cmp r0, #0
	bne _08070B20
	ldr r0, _08070B1C  @ gUnknown_02000000
	ldr r0, [r0]
	movs r1, #0
	bl SetEkrDragonStatusType
	b _08070B2A
	.align 2, 0
_08070B1C: .4byte gUnknown_02000000
_08070B20:
	ldr r0, _08070B38  @ gUnknown_02000000
	ldr r0, [r0, #8]
	movs r1, #0
	bl SetEkrDragonStatusType
_08070B2A:
	adds r0, r5, #0
	bl Proc_Break
_08070B30:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08070B38: .4byte gUnknown_02000000

	THUMB_FUNC_END sub_8070AE4

	THUMB_FUNC_START sub_8070B3C
sub_8070B3C: @ 0x08070B3C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	ldr r0, _08070B84  @ gpEkrBattleUnitLeft
	ldr r0, [r0]
	mov sl, r0
	ldr r0, _08070B88  @ gpEkrBattleUnitRight
	ldr r7, [r0]
	mov r6, sl
	mov r8, r7
	ldr r0, _08070B8C  @ gBanimSideVaildFlagMaybe
	ldrh r1, [r0]
	mov r9, r1
	ldrh r0, [r0, #2]
	str r0, [sp]
	ldr r0, _08070B90  @ gEkrSomeType
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bge _08070B6C
	b _08070CEE
_08070B6C:
	cmp r0, #2
	ble _08070B72
	b _08070CEE
_08070B72:
	ldr r0, [r6, #4]
	ldrb r0, [r0, #4]
	cmp r0, #0x65
	beq _08070C24
	cmp r0, #0x65
	bgt _08070B94
	cmp r0, #0x3c
	beq _08070B9A
	b _08070C44
	.align 2, 0
_08070B84: .4byte gpEkrBattleUnitLeft
_08070B88: .4byte gpEkrBattleUnitRight
_08070B8C: .4byte gBanimSideVaildFlagMaybe
_08070B90: .4byte gEkrSomeType
_08070B94:
	cmp r0, #0x66
	beq _08070C34
	b _08070C44
_08070B9A:
	adds r0, r6, #0
	adds r0, #0x30
	ldrb r0, [r0]
	movs r1, #0xf
	ands r1, r0
	cmp r1, #2
	beq _08070C4E
	cmp r1, #0xb
	beq _08070C4E
	cmp r1, #0xd
	beq _08070C4E
	adds r4, r7, #0
	adds r4, #0x4a
	ldrh r0, [r4]
	bl GetItemIndex
	cmp r0, #0x52
	beq _08070C4E
	ldrh r0, [r4]
	bl GetItemIndex
	cmp r0, #0x53
	beq _08070C4E
	ldrh r0, [r4]
	bl GetItemIndex
	cmp r0, #0x51
	beq _08070C4E
	ldrh r0, [r4]
	bl GetItemIndex
	cmp r0, #0xb5
	beq _08070C4E
	ldr r0, [r6]
	ldrb r0, [r0, #4]
	bl GetUnitFromCharId
	movs r5, #0xb
	ldrsb r5, [r0, r5]
	movs r4, #0xc0
	ands r5, r4
	ldr r0, [r7]
	ldrb r0, [r0, #4]
	bl GetUnitFromCharId
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ands r0, r4
	cmp r5, r0
	beq _08070C4E
	mov r0, r9
	cmp r0, #0
	beq _08070C4E
	adds r0, r6, #0
	adds r0, #0x4a
	ldrh r0, [r0]
	bl GetItemIndex
	cmp r0, #0xaa
	bne _08070C4E
	ldr r0, _08070C20  @ gUnknown_02000000
	ldr r0, [r0]
	movs r1, #3
	bl SetEkrDragonStatusType
	b _08070C4E
	.align 2, 0
_08070C20: .4byte gUnknown_02000000
_08070C24:
	ldr r0, _08070C30  @ gUnknown_02000000
	ldr r0, [r0]
	movs r1, #1
	bl SetEkrDragonStatusType
	b _08070C4E
	.align 2, 0
_08070C30: .4byte gUnknown_02000000
_08070C34:
	ldr r0, _08070C40  @ gUnknown_02000000
	ldr r0, [r0]
	movs r1, #2
	bl SetEkrDragonStatusType
	b _08070C4E
	.align 2, 0
_08070C40: .4byte gUnknown_02000000
_08070C44:
	ldr r0, _08070CE0  @ gUnknown_02000000
	ldr r0, [r0]
	movs r1, #0
	bl SetEkrDragonStatusType
_08070C4E:
	mov r1, r8
	ldr r0, [r1, #4]
	ldrb r0, [r0, #4]
	cmp r0, #0x3c
	bne _08070CE4
	mov r0, r8
	adds r0, #0x30
	ldrb r0, [r0]
	movs r1, #0xf
	ands r1, r0
	cmp r1, #2
	beq _08070CEE
	cmp r1, #0xb
	beq _08070CEE
	cmp r1, #0xd
	beq _08070CEE
	mov r4, sl
	adds r4, #0x4a
	ldrh r0, [r4]
	bl GetItemIndex
	cmp r0, #0x52
	beq _08070CEE
	ldrh r0, [r4]
	bl GetItemIndex
	cmp r0, #0x53
	beq _08070CEE
	ldrh r0, [r4]
	bl GetItemIndex
	cmp r0, #0x51
	beq _08070CEE
	ldrh r0, [r4]
	bl GetItemIndex
	cmp r0, #0xb5
	beq _08070CEE
	ldr r0, [r6]
	ldrb r0, [r0, #4]
	bl GetUnitFromCharId
	movs r5, #0xb
	ldrsb r5, [r0, r5]
	movs r4, #0xc0
	ands r5, r4
	mov r1, r8
	ldr r0, [r1]
	ldrb r0, [r0, #4]
	bl GetUnitFromCharId
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ands r0, r4
	cmp r5, r0
	beq _08070CEE
	ldr r0, [sp]
	cmp r0, #0
	beq _08070CEE
	adds r0, r7, #0
	adds r0, #0x4a
	ldrh r0, [r0]
	bl GetItemIndex
	cmp r0, #0xaa
	bne _08070CEE
	ldr r0, _08070CE0  @ gUnknown_02000000
	ldr r0, [r0, #8]
	movs r1, #3
	bl SetEkrDragonStatusType
	b _08070CEE
	.align 2, 0
_08070CE0: .4byte gUnknown_02000000
_08070CE4:
	ldr r0, _08070D00  @ gUnknown_02000000
	ldr r0, [r0, #8]
	movs r1, #0
	bl SetEkrDragonStatusType
_08070CEE:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08070D00: .4byte gUnknown_02000000

	THUMB_FUNC_END sub_8070B3C

	THUMB_FUNC_START sub_8070D04
sub_8070D04: @ 0x08070D04
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	adds r6, r3, #0
	ldr r3, [sp, #0x1c]
	mov r8, r3
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov ip, r1
	lsls r2, r2, #0x10
	adds r1, r0, #0
	lsrs r2, r2, #0x10
	cmp r2, #0
	beq _08070D6A
	movs r0, #0x20
	mov r3, ip
	subs r0, r0, r3
	lsls r0, r0, #0x10
	mov r9, r0
_08070D2C:
	mov r3, ip
	subs r5, r2, #1
	cmp r3, #0
	beq _08070D5E
	movs r2, #1
	negs r2, r2
	ldr r7, _08070D78  @ 0x00000FFF
	lsls r4, r6, #0xc
_08070D3C:
	ldrh r0, [r1]
	cmp r6, r2
	beq _08070D4A
	ands r0, r7
	adds r0, r0, r4
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
_08070D4A:
	cmp r8, r2
	beq _08070D54
	add r0, r8
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
_08070D54:
	strh r0, [r1]
	adds r1, #2
	subs r3, #1
	cmp r3, #0
	bne _08070D3C
_08070D5E:
	mov r2, r9
	lsrs r0, r2, #0xf
	adds r1, r1, r0
	adds r2, r5, #0
	cmp r2, #0
	bne _08070D2C
_08070D6A:
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08070D78: .4byte 0x00000FFF

	THUMB_FUNC_END sub_8070D04

	THUMB_FUNC_START FillBGRect
FillBGRect: @ 0x08070D7C
	push {r4, r5, r6, r7, lr}
	adds r5, r3, #0
	ldr r7, [sp, #0x14]
	lsls r1, r1, #0x10
	lsrs r4, r1, #0x10
	lsls r2, r2, #0x10
	adds r3, r0, #0
	lsrs r2, r2, #0x10
	cmp r2, #0
	beq _08070DB4
	movs r0, #0x20
	subs r0, r0, r4
	lsls r0, r0, #0x10
	lsrs r6, r0, #0xf
	lsls r5, r5, #0xc
_08070D9A:
	adds r0, r4, #0
	subs r2, #1
	cmp r0, #0
	beq _08070DAE
	adds r1, r7, r5
_08070DA4:
	strh r1, [r3]
	adds r3, #2
	subs r0, #1
	cmp r0, #0
	bne _08070DA4
_08070DAE:
	adds r3, r3, r6
	cmp r2, #0
	bne _08070D9A
_08070DB4:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END FillBGRect

	THUMB_FUNC_START sub_8070DBC
sub_8070DBC: @ 0x08070DBC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r3, #0
	ldr r3, [sp, #0x18]
	mov ip, r3
	lsls r1, r1, #0x10
	lsrs r7, r1, #0x10
	lsls r2, r2, #0x10
	adds r1, r0, #0
	lsrs r2, r2, #0x10
	cmp r2, #0
	beq _08070E18
	movs r0, #0x20
	subs r0, r0, r7
	lsls r0, r0, #0x10
	mov r8, r0
_08070DDE:
	adds r3, r7, #0
	subs r5, r2, #1
	cmp r3, #0
	beq _08070E0C
	movs r2, #1
	negs r2, r2
	lsls r4, r6, #0xc
_08070DEC:
	ldrh r0, [r1]
	cmp r6, r2
	beq _08070DF8
	adds r0, r0, r4
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
_08070DF8:
	cmp ip, r2
	beq _08070E02
	add r0, ip
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
_08070E02:
	strh r0, [r1]
	adds r1, #2
	subs r3, #1
	cmp r3, #0
	bne _08070DEC
_08070E0C:
	mov r2, r8
	lsrs r0, r2, #0xf
	adds r1, r1, r0
	adds r2, r5, #0
	cmp r2, #0
	bne _08070DDE
_08070E18:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8070DBC

	THUMB_FUNC_START sub_8070E24
sub_8070E24: @ 0x08070E24
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov ip, r1
	lsls r2, r2, #0x10
	adds r3, r0, #0
	lsrs r2, r2, #0x10
	cmp r2, #0
	beq _08070E80
	movs r0, #0x20
	subs r0, r0, r1
	lsls r0, r0, #0x10
	mov r8, r0
	ldr r0, _08070E8C  @ gUnknown_08758A1C
	mov r9, r0
_08070E48:
	mov r4, ip
	subs r2, #1
	cmp r4, #0
	beq _08070E76
	ldr r7, _08070E90  @ 0x00000FFF
	mov r6, r9
	movs r5, #0xf
_08070E56:
	ldrh r0, [r3]
	adds r1, r0, #0
	lsrs r0, r0, #0xc
	ands r0, r5
	subs r0, #6
	lsls r0, r0, #0x10
	lsrs r0, r0, #0xf
	adds r0, r0, r6
	ands r1, r7
	ldrh r0, [r0]
	adds r1, r1, r0
	strh r1, [r3]
	adds r3, #2
	subs r4, #1
	cmp r4, #0
	bne _08070E56
_08070E76:
	mov r1, r8
	lsrs r0, r1, #0xf
	adds r3, r3, r0
	cmp r2, #0
	bne _08070E48
_08070E80:
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08070E8C: .4byte gUnknown_08758A1C
_08070E90: .4byte 0x00000FFF

	THUMB_FUNC_END sub_8070E24

	THUMB_FUNC_START sub_8070E94
sub_8070E94: @ 0x08070E94
	push {r4, r5, r6, lr}
	sub sp, #0x10
	adds r6, r1, #0
	ldr r4, [sp, #0x20]
	ldr r5, [sp, #0x24]
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	movs r1, #1
	negs r1, r1
	str r2, [sp]
	str r3, [sp, #4]
	str r4, [sp, #8]
	str r5, [sp, #0xc]
	adds r2, r6, #0
	movs r3, #0x20
	bl sub_8070EF4
	add sp, #0x10
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8070E94

	THUMB_FUNC_START sub_8070EC4
sub_8070EC4: @ 0x08070EC4
	push {r4, r5, r6, lr}
	sub sp, #0x10
	adds r6, r1, #0
	ldr r4, [sp, #0x20]
	ldr r5, [sp, #0x24]
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	movs r1, #1
	negs r1, r1
	str r2, [sp]
	str r3, [sp, #4]
	str r4, [sp, #8]
	str r5, [sp, #0xc]
	adds r2, r6, #0
	movs r3, #0x20
	bl sub_8070FA4
	add sp, #0x10
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8070EC4

	THUMB_FUNC_START sub_8070EF4
sub_8070EF4: @ 0x08070EF4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r5, r0, #0
	adds r4, r2, #0
	ldr r0, [sp, #0x28]
	ldr r2, [sp, #0x2c]
	ldr r6, [sp, #0x30]
	mov r8, r6
	ldr r6, [sp, #0x34]
	mov ip, r6
	lsls r1, r1, #0x10
	lsrs r6, r1, #0x10
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	cmp r2, #0
	beq _08070F90
	lsls r0, r6, #0x10
	lsls r1, r3, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	asrs r1, r1, #0x10
	str r1, [sp, #4]
	subs r0, r6, r7
	lsls r0, r0, #0x10
	mov sl, r0
	subs r0, r3, r7
	lsls r0, r0, #0x10
	mov r9, r0
_08070F3C:
	adds r1, r7, #0
	subs r6, r2, #1
	cmp r1, #0
	beq _08070F6E
	movs r2, #1
	negs r2, r2
	mov r0, r8
	lsls r3, r0, #0xc
_08070F4C:
	ldrh r0, [r5]
	cmp r8, r2
	beq _08070F58
	adds r0, r0, r3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
_08070F58:
	cmp ip, r2
	beq _08070F62
	add r0, ip
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
_08070F62:
	strh r0, [r4]
	adds r5, #2
	adds r4, #2
	subs r1, #1
	cmp r1, #0
	bne _08070F4C
_08070F6E:
	ldr r2, _08070FA0  @ 0xFFFF0000
	asrs r1, r2, #0x10
	ldr r0, [sp]
	cmp r0, r1
	beq _08070F7E
	mov r2, sl
	lsrs r0, r2, #0xf
	adds r5, r5, r0
_08070F7E:
	ldr r0, [sp, #4]
	cmp r0, r1
	beq _08070F8A
	mov r1, r9
	lsrs r0, r1, #0xf
	adds r4, r4, r0
_08070F8A:
	adds r2, r6, #0
	cmp r2, #0
	bne _08070F3C
_08070F90:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08070FA0: .4byte 0xFFFF0000

	THUMB_FUNC_END sub_8070EF4

	THUMB_FUNC_START sub_8070FA4
sub_8070FA4: @ 0x08070FA4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	adds r5, r0, #0
	adds r4, r2, #0
	ldr r0, [sp, #0x2c]
	ldr r2, [sp, #0x30]
	ldr r6, [sp, #0x34]
	mov r9, r6
	ldr r6, [sp, #0x38]
	mov r8, r6
	lsls r1, r1, #0x10
	lsrs r6, r1, #0x10
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov ip, r0
	lsls r2, r2, #0x10
	lsls r0, r0, #1
	subs r0, #2
	adds r4, r4, r0
	lsrs r2, r2, #0x10
	cmp r2, #0
	beq _08071052
	lsls r0, r6, #0x10
	lsls r1, r3, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	asrs r1, r1, #0x10
	str r1, [sp, #8]
	mov r1, ip
	subs r0, r6, r1
	lsls r0, r0, #0x10
	str r0, [sp, #4]
	adds r0, r1, r3
	lsls r0, r0, #0x10
	mov sl, r0
_08070FF6:
	mov r1, ip
	subs r7, r2, #1
	cmp r1, #0
	beq _08071030
	movs r2, #1
	negs r2, r2
	mov r6, r9
	lsls r3, r6, #0xc
	movs r0, #0x80
	lsls r0, r0, #3
	adds r6, r0, #0
_0807100C:
	ldrh r0, [r5]
	cmp r9, r2
	beq _08071018
	adds r0, r0, r3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
_08071018:
	cmp r8, r2
	beq _08071022
	add r0, r8
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
_08071022:
	eors r0, r6
	strh r0, [r4]
	adds r5, #2
	subs r4, #2
	subs r1, #1
	cmp r1, #0
	bne _0807100C
_08071030:
	ldr r2, _08071064  @ 0xFFFF0000
	asrs r1, r2, #0x10
	ldr r6, [sp]
	cmp r6, r1
	beq _08071040
	ldr r2, [sp, #4]
	lsrs r0, r2, #0xf
	adds r5, r5, r0
_08071040:
	ldr r6, [sp, #8]
	cmp r6, r1
	beq _0807104C
	mov r1, sl
	lsrs r0, r1, #0xf
	adds r4, r4, r0
_0807104C:
	adds r2, r7, #0
	cmp r2, #0
	bne _08070FF6
_08071052:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08071064: .4byte 0xFFFF0000

	THUMB_FUNC_END sub_8070FA4

	THUMB_FUNC_START sub_8071068
sub_8071068: @ 0x08071068
	push {r4, r5, r6, r7, lr}
	adds r3, r0, #0
	adds r6, r1, #0
	adds r7, r2, #0
	movs r0, #0
	mov ip, r0
	cmp r7, #0
	beq _08071138
	movs r2, #0
_0807107A:
	cmp r7, r2
	bgt _08071090
	mov r1, ip
	cmp r1, #0
	bne _0807108C
	movs r0, #1
	mov ip, r0
	movs r0, #0xe
	b _080710F0
_0807108C:
	movs r0, #0xff
	b _080710F0
_08071090:
	adds r0, r2, #1
	cmp r7, r0
	bne _080710AC
	movs r1, #1
	mov ip, r1
	cmp r6, r2
	bgt _080710A2
	movs r0, #0xd
	b _080710F0
_080710A2:
	adds r1, r2, #4
	cmp r6, r0
	bne _08071132
	movs r0, #0xc
	b _0807112E
_080710AC:
	adds r4, r2, #2
	cmp r7, r4
	bne _080710D0
	movs r1, #1
	mov ip, r1
	cmp r6, r2
	bgt _080710BE
	movs r0, #0xb
	b _080710F0
_080710BE:
	cmp r6, r0
	bne _080710C6
	movs r0, #0xa
	b _080710F0
_080710C6:
	adds r1, r2, #4
	cmp r6, r4
	bne _08071132
	movs r0, #9
	b _0807112E
_080710D0:
	adds r5, r2, #3
	cmp r7, r5
	bne _08071102
	movs r1, #1
	mov ip, r1
	cmp r6, r2
	bgt _080710E2
	movs r0, #8
	b _080710F0
_080710E2:
	cmp r6, r0
	bne _080710EA
	movs r0, #7
	b _080710F0
_080710EA:
	cmp r6, r4
	bne _080710F8
	movs r0, #6
_080710F0:
	strh r0, [r3]
	adds r3, #2
	adds r1, r2, #4
	b _08071132
_080710F8:
	adds r1, r2, #4
	cmp r6, r5
	bne _08071132
	movs r0, #5
	b _0807112E
_08071102:
	adds r1, r2, #4
	cmp r7, r1
	blt _08071132
	cmp r6, r2
	bgt _08071110
	movs r0, #4
	b _0807112E
_08071110:
	cmp r6, r0
	bne _08071118
	movs r0, #3
	b _0807112E
_08071118:
	cmp r6, r4
	bne _08071120
	movs r0, #2
	b _0807112E
_08071120:
	cmp r6, r5
	bne _08071128
	movs r0, #1
	b _0807112E
_08071128:
	cmp r6, r1
	blt _08071132
	movs r0, #0
_0807112E:
	strh r0, [r3]
	adds r3, #2
_08071132:
	adds r2, r1, #0
	cmp r2, #0x28
	ble _0807107A
_08071138:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8071068

	THUMB_FUNC_START sub_8071140
sub_8071140: @ 0x08071140
	push {r4, r5, r6, r7, lr}
	adds r2, r0, #0
	adds r3, r1, #0
	cmp r3, #5
	ble _0807114E
	movs r0, #6
	b _08071156
_0807114E:
	ldr r0, _08071170  @ gUnknown_080E1394
	lsls r1, r3, #1
	adds r1, r1, r0
	ldrh r0, [r1]
_08071156:
	strh r0, [r2]
	adds r2, #2
	movs r1, #0
	movs r7, #0x10
	ldr r6, _08071174  @ gUnknown_080E13A2
	subs r4, r3, #6
	movs r5, #7
_08071164:
	adds r0, r1, #0
	adds r0, #0xe
	cmp r3, r0
	blt _08071178
	strh r7, [r2]
	b _0807118C
	.align 2, 0
_08071170: .4byte gUnknown_080E1394
_08071174: .4byte gUnknown_080E13A2
_08071178:
	adds r0, r1, #6
	cmp r3, r0
	blt _0807118A
	subs r0, r4, r1
	lsls r0, r0, #1
	adds r0, r0, r6
	ldrh r0, [r0]
	strh r0, [r2]
	b _0807118C
_0807118A:
	strh r5, [r2]
_0807118C:
	adds r2, #2
	adds r1, #8
	cmp r1, #0x57
	ble _08071164
	cmp r3, #0x62
	ble _0807119C
	movs r0, #0x17
	b _080711B6
_0807119C:
	cmp r3, #0x5d
	ble _080711B4
	ldr r0, _080711B0  @ gUnknown_080E13B4
	adds r1, r3, #0
	subs r1, #0x5e
	lsls r1, r1, #1
	adds r1, r1, r0
	ldrh r0, [r1]
	b _080711B6
	.align 2, 0
_080711B0: .4byte gUnknown_080E13B4
_080711B4:
	movs r0, #0x11
_080711B6:
	strh r0, [r2]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8071140

	THUMB_FUNC_START sub_80711C0
sub_80711C0: @ 0x080711C0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x1c
	str r0, [sp, #4]
	str r1, [sp, #8]
	str r2, [sp, #0xc]
	ldr r0, [sp, #0x3c]
	ldr r1, [sp, #0x40]
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x10]
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	str r1, [sp, #0x14]
	cmp r3, #0
	beq _08071290
	str r3, [sp, #0x18]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	mov sl, r0
	lsls r0, r1, #0x10
	asrs r7, r0, #0x10
_080711F6:
	ldr r1, [sp, #4]
	ldrh r0, [r1]
	movs r1, #0x1f
	ands r1, r0
	movs r6, #0xf8
	lsls r6, r6, #2
	ands r6, r0
	movs r2, #0xf8
	lsls r2, r2, #7
	mov r9, r2
	mov r3, r9
	ands r3, r0
	mov r9, r3
	ldr r2, [sp, #8]
	ldrh r0, [r2]
	movs r2, #0x1f
	ands r2, r0
	movs r4, #0xf8
	lsls r4, r4, #2
	ands r4, r0
	movs r3, #0xf8
	lsls r3, r3, #7
	mov r8, r3
	ands r3, r0
	mov r8, r3
	str r7, [sp]
	movs r0, #0
	mov r3, sl
	bl Interpolate
	adds r5, r0, #0
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	str r7, [sp]
	movs r0, #0
	adds r1, r6, #0
	adds r2, r4, #0
	mov r3, sl
	bl Interpolate
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	str r7, [sp]
	movs r0, #0
	mov r1, r9
	mov r2, r8
	mov r3, sl
	bl Interpolate
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #0xf8
	lsls r1, r1, #7
	ands r0, r1
	movs r2, #0xf8
	lsls r2, r2, #2
	ands r4, r2
	orrs r0, r4
	movs r3, #0x1f
	ands r5, r3
	orrs r0, r5
	ldr r1, [sp, #0xc]
	strh r0, [r1]
	ldr r2, [sp, #4]
	adds r2, #2
	str r2, [sp, #4]
	ldr r3, [sp, #8]
	adds r3, #2
	str r3, [sp, #8]
	adds r1, #2
	str r1, [sp, #0xc]
	ldr r0, [sp, #0x18]
	subs r0, #1
	str r0, [sp, #0x18]
	cmp r0, #0
	bne _080711F6
_08071290:
	ldr r1, [sp, #0x10]
	ldr r2, [sp, #0x14]
	cmp r1, r2
	beq _0807129C
	movs r0, #0
	b _0807129E
_0807129C:
	movs r0, #1
_0807129E:
	add sp, #0x1c
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80711C0

	THUMB_FUNC_START sub_80712B0
sub_80712B0: @ 0x080712B0
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	mov r9, r0
	adds r4, r1, #0
	adds r5, r2, #0
	lsls r0, r3, #5
	movs r1, #0x10
	bl Div
	adds r6, r0, #0
	adds r0, r4, r5
	cmp r4, r0
	bge _08071320
	mov r8, r0
	movs r0, #0x1f
	mov ip, r0
_080712D4:
	lsls r0, r4, #5
	adds r7, r4, #1
	mov r1, r9
	adds r5, r1, r0
	movs r4, #0xf
_080712DE:
	ldrh r1, [r5]
	movs r2, #0x1f
	ands r2, r1
	lsls r1, r1, #0x10
	lsrs r3, r1, #0x15
	mov r0, ip
	ands r3, r0
	lsrs r1, r1, #0x1a
	ands r1, r0
	adds r0, r2, #0
	muls r0, r6, r0
	asrs r0, r0, #5
	subs r2, r2, r0
	adds r0, r3, #0
	muls r0, r6, r0
	asrs r0, r0, #5
	subs r3, r3, r0
	adds r0, r1, #0
	muls r0, r6, r0
	asrs r0, r0, #5
	subs r1, r1, r0
	lsls r3, r3, #5
	orrs r2, r3
	lsls r1, r1, #0xa
	orrs r2, r1
	strh r2, [r5]
	adds r5, #2
	subs r4, #1
	cmp r4, #0
	bge _080712DE
	adds r4, r7, #0
	cmp r4, r8
	blt _080712D4
_08071320:
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80712B0

	THUMB_FUNC_START sub_807132C
sub_807132C: @ 0x0807132C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	mov sl, r0
	adds r4, r1, #0
	adds r5, r2, #0
	lsls r0, r3, #5
	movs r1, #0x10
	bl Div
	adds r6, r0, #0
	adds r0, r4, r5
	cmp r4, r0
	bge _080713A2
	mov r9, r0
	movs r0, #0x1f
	mov r8, r0
	movs r7, #0x1f
_08071354:
	lsls r0, r4, #5
	adds r4, #1
	mov ip, r4
	mov r1, sl
	adds r5, r1, r0
	movs r4, #0xf
_08071360:
	ldrh r1, [r5]
	adds r2, r7, #0
	ands r2, r1
	lsls r1, r1, #0x10
	lsrs r3, r1, #0x15
	mov r0, r8
	ands r3, r0
	lsrs r1, r1, #0x1a
	ands r1, r0
	subs r0, r7, r2
	muls r0, r6, r0
	asrs r0, r0, #5
	adds r2, r2, r0
	subs r0, r7, r3
	muls r0, r6, r0
	asrs r0, r0, #5
	adds r3, r3, r0
	subs r0, r7, r1
	muls r0, r6, r0
	asrs r0, r0, #5
	adds r1, r1, r0
	lsls r3, r3, #5
	orrs r2, r3
	lsls r1, r1, #0xa
	orrs r2, r1
	strh r2, [r5]
	adds r5, #2
	subs r4, #1
	cmp r4, #0
	bge _08071360
	mov r4, ip
	cmp r4, r9
	blt _08071354
_080713A2:
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_807132C

	THUMB_FUNC_START sub_80713B0
sub_80713B0: @ 0x080713B0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	str r0, [sp]
	adds r6, r1, #0
	mov r8, r2
	adds r0, r3, #0
	ldr r4, [sp, #0x2c]
	ldr r5, [sp, #0x30]
	lsls r0, r0, #5
	movs r1, #0x10
	bl Div
	mov sl, r0
	lsls r4, r4, #5
	adds r0, r4, #0
	movs r1, #0x10
	bl Div
	mov r9, r0
	lsls r5, r5, #5
	adds r0, r5, #0
	movs r1, #0x10
	bl Div
	mov ip, r0
	mov r1, r8
	adds r0, r6, r1
	cmp r6, r0
	bge _08071456
	str r0, [sp, #4]
	movs r0, #0x1f
	mov r8, r0
	movs r7, #0x1f
_080713FA:
	lsls r0, r6, #5
	adds r6, #1
	str r6, [sp, #8]
	ldr r1, [sp]
	adds r4, r1, r0
	movs r5, #0xf
_08071406:
	ldrh r1, [r4]
	adds r2, r7, #0
	ands r2, r1
	lsls r1, r1, #0x10
	lsrs r3, r1, #0x15
	mov r6, r8
	ands r3, r6
	lsrs r1, r1, #0x1a
	ands r1, r6
	subs r0, r7, r2
	mov r6, sl
	muls r6, r0, r6
	adds r0, r6, #0
	asrs r0, r0, #5
	adds r2, r2, r0
	subs r0, r7, r3
	mov r6, r9
	muls r6, r0, r6
	adds r0, r6, #0
	asrs r0, r0, #5
	adds r3, r3, r0
	subs r0, r7, r1
	mov r6, ip
	muls r6, r0, r6
	adds r0, r6, #0
	asrs r0, r0, #5
	adds r1, r1, r0
	lsls r3, r3, #5
	orrs r2, r3
	lsls r1, r1, #0xa
	orrs r2, r1
	strh r2, [r4]
	adds r4, #2
	subs r5, #1
	cmp r5, #0
	bge _08071406
	ldr r6, [sp, #8]
	ldr r0, [sp, #4]
	cmp r6, r0
	blt _080713FA
_08071456:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80713B0

	THUMB_FUNC_START sub_8071468
sub_8071468: @ 0x08071468
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	mov r9, r0
	adds r0, r1, r2
	cmp r1, r0
	bge _080714CE
	mov sl, r0
	movs r0, #0x1f
	mov r8, r0
_08071480:
	movs r5, #0
	lsls r6, r1, #5
	adds r7, r1, #1
_08071486:
	mov r1, r9
	adds r4, r1, r6
	lsls r0, r5, #1
	adds r4, r4, r0
	ldrh r2, [r4]
	movs r0, #0x1f
	ands r0, r2
	lsls r2, r2, #0x10
	lsrs r3, r2, #0x15
	mov r1, r8
	ands r3, r1
	lsrs r2, r2, #0x1a
	ands r2, r1
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r0, r3, #1
	adds r0, r0, r3
	lsls r0, r0, #1
	adds r1, r1, r0
	adds r1, r1, r2
	adds r0, r1, #0
	movs r1, #0xa
	bl Div
	adds r1, r0, #0
	lsls r0, r1, #5
	orrs r0, r1
	lsls r1, r1, #0xa
	orrs r0, r1
	strh r0, [r4]
	adds r5, #1
	cmp r5, #0xf
	ble _08071486
	adds r1, r7, #0
	cmp r1, sl
	blt _08071480
_080714CE:
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8071468

	THUMB_FUNC_START sub_80714DC
sub_80714DC: @ 0x080714DC
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r3, r1, #0
	adds r6, r2, #0
	movs r5, #0
	cmp r5, r6
	bcs _08071514
	movs r7, #0x1f
	movs r0, #0x1f
	mov ip, r0
_080714F0:
	ldrh r0, [r4]
	adds r4, #2
	adds r1, r0, #0
	mov r2, ip
	ands r1, r2
	lsrs r2, r0, #5
	ands r2, r7
	lsrs r0, r0, #0xa
	ands r0, r7
	strb r1, [r3]
	adds r3, #1
	strb r2, [r3]
	adds r3, #1
	strb r0, [r3]
	adds r3, #1
	adds r5, #1
	cmp r5, r6
	bcc _080714F0
_08071514:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80714DC

	THUMB_FUNC_START sub_807151C
sub_807151C: @ 0x0807151C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	adds r4, r1, #0
	adds r7, r2, #0
	movs r6, #0
	cmp r6, r7
	bcs _0807156A
	movs r0, #0x1f
	mov r8, r0
_08071532:
	ldrh r2, [r5]
	adds r5, #2
	movs r1, #0x1f
	ands r1, r2
	lsrs r3, r2, #5
	mov r0, r8
	ands r3, r0
	lsrs r2, r2, #0xa
	ands r2, r0
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r1, r3, #1
	adds r1, r1, r3
	lsls r1, r1, #1
	adds r0, r0, r1
	adds r0, r0, r2
	movs r1, #0xa
	bl Div
	strb r0, [r4]
	adds r4, #1
	strb r0, [r4]
	adds r4, #1
	strb r0, [r4]
	adds r4, #1
	adds r6, #1
	cmp r6, r7
	bcc _08071532
_0807156A:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_807151C

	THUMB_FUNC_START sub_8071574
sub_8071574: @ 0x08071574
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	adds r6, r0, #0
	adds r5, r1, #0
	adds r4, r2, #0
	mov r8, r3
	ldr r0, [sp, #0x1c]
	mov r9, r0
	movs r7, #0
	cmp r7, r8
	bcs _080715E8
_0807158E:
	movs r0, #0
	ldrsb r0, [r5, r0]
	movs r1, #0
	ldrsb r1, [r6, r1]
	adds r6, #1
	adds r5, #1
	subs r0, r0, r1
	lsls r0, r0, #0x18
	asrs r0, r0, #0x10
	mov r1, r9
	bl Div
	strh r0, [r4]
	adds r4, #2
	movs r0, #0
	ldrsb r0, [r5, r0]
	movs r1, #0
	ldrsb r1, [r6, r1]
	adds r6, #1
	adds r5, #1
	subs r0, r0, r1
	lsls r0, r0, #0x18
	asrs r0, r0, #0x10
	mov r1, r9
	bl Div
	strh r0, [r4]
	adds r4, #2
	movs r0, #0
	ldrsb r0, [r5, r0]
	movs r1, #0
	ldrsb r1, [r6, r1]
	adds r6, #1
	adds r5, #1
	subs r0, r0, r1
	lsls r0, r0, #0x18
	asrs r0, r0, #0x10
	mov r1, r9
	bl Div
	strh r0, [r4]
	adds r4, #2
	adds r7, #1
	cmp r7, r8
	bcc _0807158E
_080715E8:
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8071574

	THUMB_FUNC_START sub_80715F4
sub_80715F4: @ 0x080715F4
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	mov ip, r0
	adds r6, r1, #0
	adds r5, r2, #0
	adds r4, r3, #0
	ldr r0, [sp, #0x1c]
	mov r9, r0
	ldr r7, [sp, #0x20]
	movs r0, #0
	mov r8, r0
	cmp r8, r9
	bcs _08071680
_08071612:
	ldr r0, [sp, #0x24]
	cmp r7, r0
	beq _08071656
	movs r0, #0
	ldrsh r1, [r4, r0]
	adds r4, #2
	movs r0, #0
	ldrsh r3, [r4, r0]
	adds r4, #2
	movs r0, #0
	ldrsh r2, [r4, r0]
	adds r4, #2
	adds r0, r1, #0
	muls r0, r7, r0
	asrs r1, r0, #8
	adds r0, r3, #0
	muls r0, r7, r0
	asrs r3, r0, #8
	adds r0, r2, #0
	muls r0, r7, r0
	asrs r2, r0, #8
	movs r0, #0
	ldrsb r0, [r6, r0]
	adds r1, r1, r0
	adds r6, #1
	movs r0, #0
	ldrsb r0, [r6, r0]
	adds r3, r3, r0
	adds r6, #1
	movs r0, #0
	ldrsb r0, [r6, r0]
	adds r2, r2, r0
	adds r6, #1
	b _08071668
_08071656:
	movs r1, #0
	ldrsb r1, [r5, r1]
	adds r5, #1
	movs r3, #0
	ldrsb r3, [r5, r3]
	adds r5, #1
	movs r2, #0
	ldrsb r2, [r5, r2]
	adds r5, #1
_08071668:
	lsls r0, r3, #5
	orrs r1, r0
	lsls r0, r2, #0xa
	orrs r1, r0
	mov r0, ip
	strh r1, [r0]
	movs r0, #2
	add ip, r0
	movs r0, #1
	add r8, r0
	cmp r8, r9
	bcc _08071612
_08071680:
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80715F4

	THUMB_FUNC_START EkrUpdateSomePalMaybe
EkrUpdateSomePalMaybe: @ 0x0807168C
	push {r4, lr}
	adds r4, r0, #0
	bl UnpackChapterMapPalette
	ldr r0, _080716AC  @ gPaletteBuffer
	movs r1, #6
	movs r2, #0xa
	adds r3, r4, #0
	bl sub_80712B0
	bl EnablePaletteSync
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080716AC: .4byte gPaletteBuffer

	THUMB_FUNC_END EkrUpdateSomePalMaybe

	THUMB_FUNC_START sub_80716B0
sub_80716B0: @ 0x080716B0
	push {r4, lr}
	adds r4, r0, #0
	bl AdvanceGetLCGRNValue
	adds r4, #1
	adds r1, r4, #0
	bl DivRem
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80716B0

	THUMB_FUNC_START sub_80716C8
sub_80716C8: @ 0x080716C8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	adds r6, r1, #0
	mov r8, r2
	adds r4, r3, #0
	ldr r7, [sp, #0x18]
	ldr r1, [sp, #0x20]
	ldr r0, _08071710  @ gUnknown_08758A30
	bl Proc_Start
	movs r2, #0
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r1, [r0, #0x2e]
	adds r3, r0, #0
	adds r3, #0x29
	strb r4, [r3]
	adds r3, #1
	strb r2, [r3]
	strh r5, [r0, #0x32]
	strh r6, [r0, #0x3a]
	strh r1, [r0, #0x34]
	strh r1, [r0, #0x3c]
	mov r2, r8
	str r2, [r0, #0x44]
	str r1, [r0, #0x48]
	str r7, [r0, #0x4c]
	ldr r1, [sp, #0x1c]
	str r1, [r0, #0x50]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08071710: .4byte gUnknown_08758A30

	THUMB_FUNC_END sub_80716C8

	THUMB_FUNC_START sub_8071714
sub_8071714: @ 0x08071714
	push {r4, lr}
	sub sp, #0x48
	adds r2, r0, #0
	ldr r1, [r2, #0x44]
	movs r3, #0x2c
	ldrsh r0, [r2, r3]
	cmp r0, #0
	bne _0807178C
	movs r4, #0x2e
	ldrsh r0, [r2, r4]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r3, [r0]
	lsrs r1, r3, #0x18
	movs r0, #0x3f
	ands r1, r0
	cmp r1, #0
	bne _0807176A
	adds r0, r2, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #1
	beq _0807175A
	cmp r0, #1
	bgt _0807174C
	cmp r0, #0
	beq _08071752
	b _0807178C
_0807174C:
	cmp r0, #2
	beq _08071760
	b _0807178C
_08071752:
	adds r0, r2, #0
	bl Proc_Break
	b _080717C6
_0807175A:
	strh r0, [r2, #0x2c]
	strh r1, [r2, #0x2e]
	b _0807178C
_08071760:
	movs r0, #1
	strh r0, [r2, #0x2c]
	ldrh r0, [r2, #0x2e]
	subs r0, #1
	b _0807178A
_0807176A:
	cmp r1, #4
	bne _08071772
	strh r3, [r2, #0x2c]
	b _08071786
_08071772:
	ldr r0, _080717D0  @ 0x0FFFFFFC
	ands r0, r3
	str r0, [r2, #0x48]
	lsrs r0, r3, #0x1a
	movs r1, #0x1c
	ands r0, r1
	movs r1, #3
	ands r3, r1
	adds r0, r0, r3
	strh r0, [r2, #0x2c]
_08071786:
	ldrh r0, [r2, #0x2e]
	adds r0, #1
_0807178A:
	strh r0, [r2, #0x2e]
_0807178C:
	ldrh r0, [r2, #0x2c]
	subs r0, #1
	strh r0, [r2, #0x2c]
	adds r0, r2, #0
	adds r0, #0x2a
	ldrb r3, [r0]
	cmp r3, #0
	bne _080717C6
	ldr r0, [r2, #0x48]
	cmp r0, #0
	beq _080717C6
	str r0, [sp, #0x3c]
	mov r1, sp
	ldr r0, [r2, #0x4c]
	strh r0, [r1, #8]
	ldr r0, [r2, #0x50]
	str r0, [sp, #0x1c]
	ldrh r0, [r2, #0x34]
	ldrh r4, [r2, #0x32]
	adds r0, r0, r4
	strh r0, [r1, #2]
	ldrh r0, [r2, #0x3c]
	ldrh r2, [r2, #0x3a]
	adds r0, r0, r2
	strh r0, [r1, #4]
	mov r0, sp
	strh r3, [r0, #0xc]
	bl AnimDisplay
_080717C6:
	add sp, #0x48
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080717D0: .4byte 0x0FFFFFFC

	THUMB_FUNC_END sub_8071714

	THUMB_FUNC_START sub_80717D4
sub_80717D4: @ 0x080717D4
	lsrs r1, r0, #0x1e
	movs r2, #0xc0
	lsls r2, r2, #8
	ands r2, r0
	ldr r0, _080717EC  @ gUnknown_080E13D4
	lsls r1, r1, #1
	lsrs r2, r2, #0xb
	adds r1, r1, r2
	adds r1, r1, r0
	movs r2, #0
	ldrsh r0, [r1, r2]
	bx lr
	.align 2, 0
_080717EC: .4byte gUnknown_080E13D4

	THUMB_FUNC_END sub_80717D4

	THUMB_FUNC_START sub_80717F0
sub_80717F0: @ 0x080717F0
	lsrs r1, r0, #0x1e
	movs r2, #0xc0
	lsls r2, r2, #8
	ands r2, r0
	ldr r0, _08071808  @ gUnknown_080E13F4
	lsls r1, r1, #1
	lsrs r2, r2, #0xb
	adds r1, r1, r2
	adds r1, r1, r0
	movs r2, #0
	ldrsh r0, [r1, r2]
	bx lr
	.align 2, 0
_08071808: .4byte gUnknown_080E13F4

	THUMB_FUNC_END sub_80717F0

	THUMB_FUNC_START EkrEfxHandleUnitHittedEffect
EkrEfxHandleUnitHittedEffect: @ 0x0807180C
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	sub sp, #8
	adds r6, r1, #0
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	mov r8, r2
	adds r7, r0, #0
	ldr r1, _08071984  @ 0xFFFF0000
	ldr r0, [sp, #4]
	ands r0, r1
	str r0, [sp, #4]
	lsls r3, r3, #0x10
	mov r9, r3
	mov r0, r8
	orrs r0, r3
	str r0, [sp]
	ldr r4, _08071988  @ 0xFFFF0004
	adds r1, r6, #0
	stm r1!, {r4}
	mov r0, sp
	movs r2, #1
	movs r3, #2
	bl ObjAffineSet
	adds r5, r6, #0
	adds r5, #0xc
	str r4, [r6, #0xc]
	adds r1, r6, #0
	adds r1, #0x10
	mov r0, sp
	movs r2, #1
	movs r3, #2
	bl ObjAffineSet
	ldrh r0, [r5, #4]
	negs r0, r0
	strh r0, [r5, #4]
	ldrh r0, [r5, #6]
	negs r0, r0
	strh r0, [r5, #6]
	adds r5, #0xc
	str r4, [r6, #0x18]
	adds r1, r6, #0
	adds r1, #0x1c
	mov r0, sp
	movs r2, #1
	movs r3, #2
	bl ObjAffineSet
	ldrh r0, [r5, #8]
	negs r0, r0
	strh r0, [r5, #8]
	ldrh r0, [r5, #0xa]
	negs r0, r0
	strh r0, [r5, #0xa]
	adds r5, #0xc
	str r4, [r6, #0x24]
	adds r1, r6, #0
	adds r1, #0x28
	mov r0, sp
	movs r2, #1
	movs r3, #2
	bl ObjAffineSet
	ldrh r0, [r5, #4]
	negs r0, r0
	strh r0, [r5, #4]
	ldrh r0, [r5, #6]
	negs r0, r0
	strh r0, [r5, #6]
	ldrh r0, [r5, #8]
	negs r0, r0
	strh r0, [r5, #8]
	ldrh r0, [r5, #0xa]
	negs r0, r0
	strh r0, [r5, #0xa]
	adds r6, #0x30
	ldr r0, [r7]
	cmp r0, #1
	beq _08071964
	mov r1, r8
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	mov r8, r0
	mov r2, r9
	asrs r5, r2, #0x10
_080718BE:
	ldr r2, [r7]
	movs r0, #0x80
	lsls r0, r0, #0x15
	ands r0, r2
	negs r0, r0
	asrs r1, r0, #0x1f
	movs r0, #0x80
	lsls r0, r0, #0x12
	ands r1, r0
	movs r0, #0x80
	lsls r0, r0, #0x16
	ands r0, r2
	cmp r0, #0
	beq _080718E0
	movs r3, #0x80
	lsls r3, r3, #0x13
	adds r1, r1, r3
_080718E0:
	ldr r0, _0807198C  @ 0xC1FFFFFF
	ands r0, r2
	movs r3, #0x80
	lsls r3, r3, #1
	adds r1, r1, r3
	adds r0, r0, r1
	str r0, [r6]
	ldrh r0, [r7, #4]
	strh r0, [r6, #4]
	adds r0, r2, #0
	bl sub_80717D4
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x11
	lsls r1, r4, #8
	adds r0, r1, #0
	mov r1, r8
	bl Div
	subs r1, r4, r0
	movs r2, #6
	ldrsh r0, [r7, r2]
	subs r4, r0, r1
	lsls r1, r0, #8
	adds r0, r1, #0
	mov r1, r8
	bl Div
	adds r1, r0, #0
	movs r3, #6
	ldrsh r0, [r7, r3]
	subs r1, r0, r1
	subs r4, r4, r1
	strh r4, [r6, #6]
	ldr r0, [r7]
	bl sub_80717F0
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x11
	lsls r1, r4, #8
	adds r0, r1, #0
	adds r1, r5, #0
	bl Div
	subs r1, r4, r0
	movs r2, #8
	ldrsh r0, [r7, r2]
	subs r4, r0, r1
	lsls r1, r0, #8
	adds r0, r1, #0
	adds r1, r5, #0
	bl Div
	adds r1, r0, #0
	movs r3, #8
	ldrsh r0, [r7, r3]
	subs r1, r0, r1
	subs r4, r4, r1
	strh r4, [r6, #8]
	adds r6, #0xc
	adds r7, #0xc
	ldr r0, [r7]
	cmp r0, #1
	bne _080718BE
_08071964:
	ldr r0, [r7]
	str r0, [r6]
	ldrh r0, [r7, #4]
	strh r0, [r6, #4]
	ldrh r0, [r7, #6]
	strh r0, [r6, #6]
	ldrh r0, [r7, #8]
	strh r0, [r6, #8]
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08071984: .4byte 0xFFFF0000
_08071988: .4byte 0xFFFF0004
_0807198C: .4byte 0xC1FFFFFF

	THUMB_FUNC_END EkrEfxHandleUnitHittedEffect

	THUMB_FUNC_START SomePlaySound_8071990
SomePlaySound_8071990: @ 0x08071990
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r5, r1, #0
	ldr r0, _080719D0  @ gBmSt
	ldrb r1, [r0, #4]
	movs r0, #0x20
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0
	bne _080719E6
	bl sub_8071AA4
	cmp r0, #0
	bne _080719D8
	bl sub_8071A98
	adds r0, r5, #0
	bl Sound_SetBGMVolume
	ldr r0, _080719D4  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080719E6
	lsls r0, r6, #0x10
	lsrs r0, r0, #0x10
	bl m4aSongNumStart
	b _080719E6
	.align 2, 0
_080719D0: .4byte gBmSt
_080719D4: .4byte gPlaySt
_080719D8:
	ldr r0, _080719EC  @ gUnknown_08758A48
	movs r1, #3
	bl Proc_Start
	str r5, [r0, #0x44]
	str r6, [r0, #0x48]
	strh r4, [r0, #0x2c]
_080719E6:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080719EC: .4byte gUnknown_08758A48

	THUMB_FUNC_END SomePlaySound_8071990

	THUMB_FUNC_START Loop6C_efxSoundSE
Loop6C_efxSoundSE: @ 0x080719F0
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #5
	bne _08071A0A
	adds r0, r4, #0
	bl Proc_Break
	b _08071A38
_08071A0A:
	bl sub_8071AA4
	cmp r0, #0
	bne _08071A38
	bl sub_8071A98
	ldr r0, [r4, #0x44]
	bl Sound_SetBGMVolume
	ldr r0, _08071A40  @ gPlaySt
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08071A32
	ldr r0, [r4, #0x48]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl m4aSongNumStart
_08071A32:
	adds r0, r4, #0
	bl Proc_Break
_08071A38:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08071A40: .4byte gPlaySt

	THUMB_FUNC_END Loop6C_efxSoundSE

	THUMB_FUNC_START sub_8071A44
sub_8071A44: @ 0x08071A44
	push {lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl m4aSongNumStop
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8071A44

	THUMB_FUNC_START sub_8071A54
sub_8071A54: @ 0x08071A54
	push {r4, lr}
	adds r4, r0, #0
	adds r2, r1, #0
	ldr r0, _08071A78  @ gBmSt
	ldrb r1, [r0, #4]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	bne _08071A72
	adds r0, r2, #0
	bl Sound_SetSEVolume
	adds r0, r4, #0
	bl sub_8002620
_08071A72:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08071A78: .4byte gBmSt

	THUMB_FUNC_END sub_8071A54

	THUMB_FUNC_START StopBGM1
StopBGM1: @ 0x08071A7C
	push {lr}
	ldr r0, _08071A88  @ gMPlayInfo_BGM1
	bl m4aMPlayStop
	pop {r0}
	bx r0
	.align 2, 0
_08071A88: .4byte gMPlayInfo_BGM1

	THUMB_FUNC_END StopBGM1

	THUMB_FUNC_START sub_8071A8C
sub_8071A8C: @ 0x08071A8C
	ldr r1, _08071A94  @ gUnknown_020200AC
	movs r0, #0
	str r0, [r1]
	bx lr
	.align 2, 0
_08071A94: .4byte gUnknown_020200AC

	THUMB_FUNC_END sub_8071A8C

	THUMB_FUNC_START sub_8071A98
sub_8071A98: @ 0x08071A98
	ldr r1, _08071AA0  @ gUnknown_020200AC
	movs r0, #1
	str r0, [r1]
	bx lr
	.align 2, 0
_08071AA0: .4byte gUnknown_020200AC

	THUMB_FUNC_END sub_8071A98

	THUMB_FUNC_START sub_8071AA4
sub_8071AA4: @ 0x08071AA4
	ldr r0, _08071AAC  @ gUnknown_020200AC
	ldr r0, [r0]
	bx lr
	.align 2, 0
_08071AAC: .4byte gUnknown_020200AC

	THUMB_FUNC_END sub_8071AA4

	THUMB_FUNC_START sub_8071AB0
sub_8071AB0: @ 0x08071AB0
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r6, r1, #0
	ldr r0, _08071ADC  @ gBmSt
	ldrb r1, [r0, #4]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	bne _08071B58
	cmp r2, #0
	beq _08071B28
	cmp r6, #0x77
	bgt _08071AE0
	adds r0, r6, #0
	muls r0, r6, r0
	movs r1, #0x78
	bl Div
	adds r5, r0, #0
	subs r5, #0x78
	b _08071AF4
	.align 2, 0
_08071ADC: .4byte gBmSt
_08071AE0:
	movs r0, #0xf0
	subs r0, r0, r6
	adds r1, r0, #0
	muls r1, r0, r1
	adds r0, r1, #0
	movs r1, #0x78
	bl Div
	movs r1, #0x78
	subs r5, r1, r0
_08071AF4:
	ldr r2, _08071B1C  @ gMPlayTable
	ldr r1, _08071B20  @ gSongTable
	lsls r0, r4, #3
	adds r0, r0, r1
	ldrh r1, [r0, #4]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r4, [r0]
	adds r0, r4, #0
	bl m4aMPlayImmInit
	ldr r1, _08071B24  @ 0x0000FFFF
	lsls r2, r5, #0x18
	asrs r2, r2, #0x18
	adds r0, r4, #0
	bl m4aMPlayPanpotControl
	b _08071B58
	.align 2, 0
_08071B1C: .4byte gMPlayTable
_08071B20: .4byte gSongTable
_08071B24: .4byte 0x0000FFFF
_08071B28:
	ldr r2, _08071B60  @ gMPlayTable
	ldr r1, _08071B64  @ gSongTable
	lsls r0, r4, #3
	adds r0, r0, r1
	ldrh r1, [r0, #4]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r4, [r0]
	adds r0, r4, #0
	bl m4aMPlayImmInit
	ldr r5, _08071B68  @ 0x0000FFFF
	adds r0, r6, #0
	bl RerangeSomething
	adds r2, r0, #0
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	adds r0, r4, #0
	adds r1, r5, #0
	bl m4aMPlayPanpotControl
_08071B58:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08071B60: .4byte gMPlayTable
_08071B64: .4byte gSongTable
_08071B68: .4byte 0x0000FFFF

	THUMB_FUNC_END sub_8071AB0

	THUMB_FUNC_START sub_8071B6C
sub_8071B6C: @ 0x08071B6C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	mov r8, r0
	mov sl, r1
	bl GetCoreAIStruct
	mov r9, r0
	mov r0, r8
	bl sub_805A154
	cmp r0, #1
	bne _08071B8E
	b _08072246
_08071B8E:
	mov r0, r8
	bl GetAISSubjectId
	adds r6, r0, #0
	cmp r6, #0
	bne _08071BA8
	ldr r0, _08071BA4  @ gUnknown_0203E1CC
	movs r1, #0
	ldrsh r5, [r0, r1]
	b _08071BAE
	.align 2, 0
_08071BA4: .4byte gUnknown_0203E1CC
_08071BA8:
	ldr r0, _08071BD8  @ gUnknown_0203E1CC
	movs r2, #2
	ldrsh r5, [r0, r2]
_08071BAE:
	lsls r0, r5, #0x10
	lsrs r0, r0, #0x10
	bl sub_8072258
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r5, #0x14
	bne _08071BCA
	mov r0, r8
	bl sub_80723A4
	cmp r0, #0
	bne _08071BCA
	movs r4, #2
_08071BCA:
	cmp r6, #0
	bne _08071BE0
	ldr r0, _08071BDC  @ gUnknown_0203E1D0
	movs r1, #0
	ldrsh r0, [r0, r1]
	b _08071BE6
	.align 2, 0
_08071BD8: .4byte gUnknown_0203E1CC
_08071BDC: .4byte gUnknown_0203E1D0
_08071BE0:
	ldr r0, _08071C20  @ gUnknown_0203E1D0
	movs r2, #2
	ldrsh r0, [r0, r2]
_08071BE6:
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl sub_80723D4
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	ldr r5, _08071C24  @ 0x0000FFFF
	mov r0, r8
	bl sub_807290C
	mov r2, r8
	ldrh r1, [r2, #2]
	adds r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r2, r1, #0x10
	movs r0, #0x80
	lsls r0, r0, #1
	str r0, [sp]
	mov r0, sl
	subs r0, #0x19
	cmp r0, #0x62
	bls _08071C14
	b _08072220
_08071C14:
	lsls r0, r0, #2
	ldr r1, _08071C28  @ _08071C2C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08071C20: .4byte gUnknown_0203E1D0
_08071C24: .4byte 0x0000FFFF
_08071C28: .4byte _08071C2C
_08071C2C: @ jump table
	.4byte _08071DB8 @ case 0
	.4byte _08072220 @ case 1
	.4byte _08071DBC @ case 2
	.4byte _08071DD0 @ case 3
	.4byte _08071DE4 @ case 4
	.4byte _08071DF8 @ case 5
	.4byte _08071E0C @ case 6
	.4byte _08071E78 @ case 7
	.4byte _08071EE4 @ case 8
	.4byte _08071F78 @ case 9
	.4byte _08071F7C @ case 10
	.4byte _08071F80 @ case 11
	.4byte _08071F84 @ case 12
	.4byte _08072220 @ case 13
	.4byte _08072220 @ case 14
	.4byte _08071F8C @ case 15
	.4byte _08071F90 @ case 16
	.4byte _08071F98 @ case 17
	.4byte _08071F9E @ case 18
	.4byte _08072220 @ case 19
	.4byte _08072220 @ case 20
	.4byte _08072220 @ case 21
	.4byte _08071FA8 @ case 22
	.4byte _08072220 @ case 23
	.4byte _08072220 @ case 24
	.4byte _08072220 @ case 25
	.4byte _08071FAE @ case 26
	.4byte _08071FB2 @ case 27
	.4byte _08071FFC @ case 28
	.4byte _0807200C @ case 29
	.4byte _08072010 @ case 30
	.4byte _08072014 @ case 31
	.4byte _08072220 @ case 32
	.4byte _08072018 @ case 33
	.4byte _08072020 @ case 34
	.4byte _08072026 @ case 35
	.4byte _08072220 @ case 36
	.4byte _08072038 @ case 37
	.4byte _0807203C @ case 38
	.4byte _08072042 @ case 39
	.4byte _0807204C @ case 40
	.4byte _08072050 @ case 41
	.4byte _08072054 @ case 42
	.4byte _0807205C @ case 43
	.4byte _08072062 @ case 44
	.4byte _0807206C @ case 45
	.4byte _08072220 @ case 46
	.4byte _08072074 @ case 47
	.4byte _08072078 @ case 48
	.4byte _08072080 @ case 49
	.4byte _08072086 @ case 50
	.4byte _08072090 @ case 51
	.4byte _08072098 @ case 52
	.4byte _08072220 @ case 53
	.4byte _080720A0 @ case 54
	.4byte _080720A8 @ case 55
	.4byte _08072220 @ case 56
	.4byte _08072220 @ case 57
	.4byte _08072220 @ case 58
	.4byte _08072220 @ case 59
	.4byte _08072220 @ case 60
	.4byte _080720AE @ case 61
	.4byte _080720B8 @ case 62
	.4byte _080720C0 @ case 63
	.4byte _080720C8 @ case 64
	.4byte _080720DC @ case 65
	.4byte _080720E4 @ case 66
	.4byte _080720EC @ case 67
	.4byte _080720F2 @ case 68
	.4byte _08072108 @ case 69
	.4byte _08072110 @ case 70
	.4byte _08072118 @ case 71
	.4byte _08072120 @ case 72
	.4byte _08072128 @ case 73
	.4byte _0807212E @ case 74
	.4byte _08072138 @ case 75
	.4byte _0807213E @ case 76
	.4byte _08072148 @ case 77
	.4byte _0807215C @ case 78
	.4byte _08072170 @ case 79
	.4byte _08072220 @ case 80
	.4byte _08072176 @ case 81
	.4byte _08072180 @ case 82
	.4byte _08072188 @ case 83
	.4byte _0807218E @ case 84
	.4byte _080721A4 @ case 85
	.4byte _080721B8 @ case 86
	.4byte _080721CC @ case 87
	.4byte _08072220 @ case 88
	.4byte _08072220 @ case 89
	.4byte _080721E0 @ case 90
	.4byte _080721E8 @ case 91
	.4byte _080721F0 @ case 92
	.4byte _080721F8 @ case 93
	.4byte _08072200 @ case 94
	.4byte _08072208 @ case 95
	.4byte _0807220E @ case 96
	.4byte _08072214 @ case 97
	.4byte _0807221C @ case 98
_08071DB8:
	movs r5, #0xd1
	b _08072222
_08071DBC:
	ldr r1, _08071DCC  @ gUnknown_08758D20
	lsls r0, r4, #2
	adds r0, r0, r1
	ldr r1, [r0]
	lsls r0, r7, #1
	adds r0, r0, r6
	lsls r0, r0, #1
	b _08072198
	.align 2, 0
_08071DCC: .4byte gUnknown_08758D20
_08071DD0:
	ldr r1, _08071DE0  @ gUnknown_08758D3C
	lsls r0, r4, #2
	adds r0, r0, r1
	ldr r1, [r0]
	lsls r0, r7, #1
	adds r0, r0, r6
	lsls r0, r0, #1
	b _08072198
	.align 2, 0
_08071DE0: .4byte gUnknown_08758D3C
_08071DE4:
	ldr r1, _08071DF4  @ gUnknown_08758D58
	lsls r0, r4, #2
	adds r0, r0, r1
	ldr r1, [r0]
	lsls r0, r7, #1
	adds r0, r0, r6
	lsls r0, r0, #1
	b _08072198
	.align 2, 0
_08071DF4: .4byte gUnknown_08758D58
_08071DF8:
	ldr r1, _08071E08  @ gUnknown_08758D74
	lsls r0, r4, #2
	adds r0, r0, r1
	ldr r1, [r0]
	lsls r0, r7, #1
	adds r0, r0, r6
	lsls r0, r0, #1
	b _08072198
	.align 2, 0
_08071E08: .4byte gUnknown_08758D74
_08071E0C:
	mov r0, r9
	bl sub_8072504
	mov r0, r9
	bl sub_8072400
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #2
	beq _08071E5A
	mov r0, r8
	bl GetAISSubjectId
	adds r1, r0, #0
	mov r2, r8
	ldrh r0, [r2, #0xe]
	subs r0, #1
	lsls r0, r0, #1
	adds r0, r0, r1
	bl GetAnimRoundType
	movs r1, #0x80
	lsls r1, r1, #2
	ands r1, r0
	cmp r1, #0
	beq _08071E5A
	ldr r4, _08071E74  @ 0x000003CF
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r4, #0
	bl SomePlaySound_8071990
	mov r0, r8
	movs r2, #2
	ldrsh r1, [r0, r2]
	adds r0, r4, #0
	movs r2, #1
	bl sub_8071AB0
_08071E5A:
	mov r0, r9
	bl sub_8072400
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	beq _08071F5A
	cmp r0, #1
	bgt _08071F50
	cmp r0, #0
	bne _08071F60
	movs r5, #0xd2
	b _08071F60
	.align 2, 0
_08071E74: .4byte 0x000003CF
_08071E78:
	mov r0, r9
	bl sub_8072504
	mov r0, r9
	bl sub_8072400
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #2
	beq _08071EC6
	mov r0, r8
	bl GetAISSubjectId
	adds r1, r0, #0
	mov r2, r8
	ldrh r0, [r2, #0xe]
	subs r0, #1
	lsls r0, r0, #1
	adds r0, r0, r1
	bl GetAnimRoundType
	movs r1, #0x80
	lsls r1, r1, #2
	ands r1, r0
	cmp r1, #0
	beq _08071EC6
	ldr r4, _08071EE0  @ 0x000003CF
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r4, #0
	bl SomePlaySound_8071990
	mov r0, r8
	movs r2, #2
	ldrsh r1, [r0, r2]
	adds r0, r4, #0
	movs r2, #1
	bl sub_8071AB0
_08071EC6:
	mov r0, r9
	bl sub_8072400
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	beq _08071F5A
	cmp r0, #1
	bgt _08071F50
	cmp r0, #0
	bne _08071F60
	movs r5, #0xd3
	b _08071F60
	.align 2, 0
_08071EE0: .4byte 0x000003CF
_08071EE4:
	mov r0, r9
	bl sub_8072504
	mov r0, r9
	bl sub_8072400
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #2
	beq _08071F32
	mov r0, r8
	bl GetAISSubjectId
	adds r1, r0, #0
	mov r2, r8
	ldrh r0, [r2, #0xe]
	subs r0, #1
	lsls r0, r0, #1
	adds r0, r0, r1
	bl GetAnimRoundType
	movs r1, #0x80
	lsls r1, r1, #2
	ands r1, r0
	cmp r1, #0
	beq _08071F32
	ldr r4, _08071F4C  @ 0x000003CF
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r4, #0
	bl SomePlaySound_8071990
	mov r0, r8
	movs r2, #2
	ldrsh r1, [r0, r2]
	adds r0, r4, #0
	movs r2, #1
	bl sub_8071AB0
_08071F32:
	mov r0, r9
	bl sub_8072400
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	beq _08071F5A
	cmp r0, #1
	bgt _08071F50
	cmp r0, #0
	beq _08071F56
	b _08071F60
	.align 2, 0
_08071F4C: .4byte 0x000003CF
_08071F50:
	cmp r0, #2
	beq _08071F5E
	b _08071F60
_08071F56:
	movs r5, #0xd4
	b _08071F60
_08071F5A:
	movs r5, #0xd5
	b _08071F60
_08071F5E:
	ldr r5, _08071F74  @ 0x000002CE
_08071F60:
	mov r0, r9
	bl sub_807290C
	mov r2, r9
	ldrh r1, [r2, #2]
	adds r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r2, r1, #0x10
	b _08072222
	.align 2, 0
_08071F74: .4byte 0x000002CE
_08071F78:
	movs r5, #0xc9
	b _08072222
_08071F7C:
	movs r5, #0xc8
	b _08072222
_08071F80:
	movs r5, #0xca
	b _08072222
_08071F84:
	ldr r5, _08071F88  @ 0x00000263
	b _08071FFE
	.align 2, 0
_08071F88: .4byte 0x00000263
_08071F8C:
	movs r5, #0xf6
	b _08072222
_08071F90:
	ldr r5, _08071F94  @ 0x00000141
	b _08072222
	.align 2, 0
_08071F94: .4byte 0x00000141
_08071F98:
	movs r5, #0xa1
	lsls r5, r5, #1
	b _08072222
_08071F9E:
	ldr r5, _08071FA4  @ 0x00000267
	b _08071FFE
	.align 2, 0
_08071FA4: .4byte 0x00000267
_08071FA8:
	movs r5, #0xbe
	lsls r5, r5, #2
	b _08072222
_08071FAE:
	movs r5, #0xe7
	b _08072222
_08071FB2:
	cmp r6, #0
	beq _08071FC4
	ldr r0, _08071FC0  @ gUnknown_0203E182
	movs r1, #0
	ldrsh r0, [r0, r1]
	b _08071FCA
	.align 2, 0
_08071FC0: .4byte gUnknown_0203E182
_08071FC4:
	ldr r0, _08071FE0  @ gUnknown_0203E182
	movs r1, #2
	ldrsh r0, [r0, r1]
_08071FCA:
	cmp r0, #0xbf
	bgt _08071FE8
	cmp r0, #0xbc
	blt _08071FE8
	ldr r0, _08071FE4  @ gUnknown_08758D20
	lsls r1, r4, #2
	adds r1, r1, r0
	ldr r1, [r1]
	adds r0, r6, #4
	lsls r0, r0, #1
	b _08072198
	.align 2, 0
_08071FE0: .4byte gUnknown_0203E182
_08071FE4: .4byte gUnknown_08758D20
_08071FE8:
	ldr r1, _08071FF8  @ gUnknown_08758D20
	lsls r0, r4, #2
	adds r0, r0, r1
	ldr r1, [r0]
	lsls r0, r7, #1
	adds r0, r0, r6
	lsls r0, r0, #1
	b _08072198
	.align 2, 0
_08071FF8: .4byte gUnknown_08758D20
_08071FFC:
	ldr r5, _08072008  @ 0x00000265
_08071FFE:
	cmp r6, #0
	beq _08072004
	b _08072222
_08072004:
	subs r5, #1
	b _08072222
	.align 2, 0
_08072008: .4byte 0x00000265
_0807200C:
	movs r5, #0xce
	b _08072222
_08072010:
	movs r5, #0xcf
	b _08072222
_08072014:
	movs r5, #0xcb
	b _08072222
_08072018:
	ldr r5, _0807201C  @ 0x000002D3
	b _08072222
	.align 2, 0
_0807201C: .4byte 0x000002D3
_08072020:
	movs r5, #0xb5
	lsls r5, r5, #2
	b _08072222
_08072026:
	ldr r5, _08072034  @ 0x00000263
	cmp r6, #0
	bne _0807202E
	subs r5, #1
_0807202E:
	movs r0, #0x80
	str r0, [sp]
	b _08072222
	.align 2, 0
_08072034: .4byte 0x00000263
_08072038:
	movs r5, #0xf1
	b _08072222
_0807203C:
	movs r5, #0x9b
	lsls r5, r5, #1
	b _08072222
_08072042:
	ldr r5, _08072048  @ 0x00000117
	b _08072222
	.align 2, 0
_08072048: .4byte 0x00000117
_0807204C:
	movs r5, #0xeb
	b _08072222
_08072050:
	movs r5, #0xea
	b _08072222
_08072054:
	ldr r5, _08072058  @ 0x000002CF
	b _08072222
	.align 2, 0
_08072058: .4byte 0x000002CF
_0807205C:
	movs r5, #0xb4
	lsls r5, r5, #2
	b _08072222
_08072062:
	ldr r5, _08072068  @ 0x000002D1
	b _08072222
	.align 2, 0
_08072068: .4byte 0x000002D1
_0807206C:
	ldr r5, _08072070  @ 0x000002D2
	b _08072222
	.align 2, 0
_08072070: .4byte 0x000002D2
_08072074:
	movs r5, #0xed
	b _08072222
_08072078:
	ldr r5, _0807207C  @ 0x00000135
	b _08072222
	.align 2, 0
_0807207C: .4byte 0x00000135
_08072080:
	movs r5, #0x9a
	lsls r5, r5, #1
	b _08072222
_08072086:
	ldr r5, _0807208C  @ 0x000002DD
	b _08072222
	.align 2, 0
_0807208C: .4byte 0x000002DD
_08072090:
	ldr r5, _08072094  @ 0x000002DE
	b _08072222
	.align 2, 0
_08072094: .4byte 0x000002DE
_08072098:
	ldr r5, _0807209C  @ 0x000002DF
	b _08072222
	.align 2, 0
_0807209C: .4byte 0x000002DF
_080720A0:
	ldr r5, _080720A4  @ 0x000002F7
	b _08072222
	.align 2, 0
_080720A4: .4byte 0x000002F7
_080720A8:
	movs r5, #0xba
	lsls r5, r5, #2
	b _08072222
_080720AE:
	ldr r5, _080720B4  @ 0x00000325
	b _08072222
	.align 2, 0
_080720B4: .4byte 0x00000325
_080720B8:
	ldr r5, _080720BC  @ 0x00000326
	b _08072222
	.align 2, 0
_080720BC: .4byte 0x00000326
_080720C0:
	ldr r5, _080720C4  @ 0x00000327
	b _08072222
	.align 2, 0
_080720C4: .4byte 0x00000327
_080720C8:
	ldr r1, _080720D8  @ gUnknown_08758E00
	lsls r0, r4, #2
	adds r0, r0, r1
	ldr r1, [r0]
	lsls r0, r7, #1
	adds r0, r0, r6
	lsls r0, r0, #1
	b _08072198
	.align 2, 0
_080720D8: .4byte gUnknown_08758E00
_080720DC:
	ldr r5, _080720E0  @ 0x0000032A
	b _08072222
	.align 2, 0
_080720E0: .4byte 0x0000032A
_080720E4:
	ldr r5, _080720E8  @ 0x0000032B
	b _08072222
	.align 2, 0
_080720E8: .4byte 0x0000032B
_080720EC:
	movs r5, #0xcb
	lsls r5, r5, #2
	b _08072222
_080720F2:
	ldr r1, _08072104  @ gUnknown_08758E8C
	lsls r0, r4, #2
	adds r0, r0, r1
	ldr r1, [r0]
	lsls r0, r7, #1
	adds r0, r0, r6
	lsls r0, r0, #1
	b _08072198
	.align 2, 0
_08072104: .4byte gUnknown_08758E8C
_08072108:
	ldr r5, _0807210C  @ 0x0000032E
	b _08072222
	.align 2, 0
_0807210C: .4byte 0x0000032E
_08072110:
	ldr r5, _08072114  @ 0x00000332
	b _08072222
	.align 2, 0
_08072114: .4byte 0x00000332
_08072118:
	ldr r5, _0807211C  @ 0x000003B7
	b _08072222
	.align 2, 0
_0807211C: .4byte 0x000003B7
_08072120:
	ldr r5, _08072124  @ 0x0000032F
	b _08072222
	.align 2, 0
_08072124: .4byte 0x0000032F
_08072128:
	movs r5, #0xcc
	lsls r5, r5, #2
	b _08072222
_0807212E:
	ldr r5, _08072134  @ 0x00000331
	b _08072222
	.align 2, 0
_08072134: .4byte 0x00000331
_08072138:
	movs r5, #0xc8
	lsls r5, r5, #2
	b _08072222
_0807213E:
	ldr r5, _08072144  @ 0x00000321
	b _08072222
	.align 2, 0
_08072144: .4byte 0x00000321
_08072148:
	ldr r1, _08072158  @ gUnknown_08758F18
	lsls r0, r4, #2
	adds r0, r0, r1
	ldr r1, [r0]
	lsls r0, r7, #1
	adds r0, r0, r6
	lsls r0, r0, #1
	b _08072198
	.align 2, 0
_08072158: .4byte gUnknown_08758F18
_0807215C:
	ldr r1, _0807216C  @ gUnknown_08758FA4
	lsls r0, r4, #2
	adds r0, r0, r1
	ldr r1, [r0]
	lsls r0, r7, #1
	adds r0, r0, r6
	lsls r0, r0, #1
	b _08072198
	.align 2, 0
_0807216C: .4byte gUnknown_08758FA4
_08072170:
	movs r5, #0xf0
	lsls r5, r5, #2
	b _08072222
_08072176:
	ldr r5, _0807217C  @ 0x000003C2
	b _08072222
	.align 2, 0
_0807217C: .4byte 0x000003C2
_08072180:
	ldr r5, _08072184  @ 0x000003C3
	b _08072222
	.align 2, 0
_08072184: .4byte 0x000003C3
_08072188:
	movs r5, #0xf1
	lsls r5, r5, #2
	b _08072222
_0807218E:
	ldr r0, _080721A0  @ gUnknown_08758D20
	lsls r1, r4, #2
	adds r1, r1, r0
	ldr r1, [r1]
	lsls r0, r6, #1
_08072198:
	adds r0, r0, r1
	ldrh r5, [r0]
	b _08072222
	.align 2, 0
_080721A0: .4byte gUnknown_08758D20
_080721A4:
	ldr r0, _080721B4  @ gUnknown_08758D20
	lsls r1, r4, #2
	adds r1, r1, r0
	ldr r1, [r1]
	lsls r0, r6, #1
	adds r0, r0, r1
	ldrh r5, [r0, #4]
	b _08072222
	.align 2, 0
_080721B4: .4byte gUnknown_08758D20
_080721B8:
	ldr r0, _080721C8  @ gUnknown_08758D20
	lsls r1, r4, #2
	adds r1, r1, r0
	ldr r1, [r1]
	lsls r0, r6, #1
	adds r0, r0, r1
	ldrh r5, [r0, #8]
	b _08072222
	.align 2, 0
_080721C8: .4byte gUnknown_08758D20
_080721CC:
	ldr r0, _080721DC  @ gUnknown_08758D20
	lsls r1, r4, #2
	adds r1, r1, r0
	ldr r1, [r1]
	lsls r0, r6, #1
	adds r0, r0, r1
	ldrh r5, [r0, #0xc]
	b _08072222
	.align 2, 0
_080721DC: .4byte gUnknown_08758D20
_080721E0:
	ldr r5, _080721E4  @ 0x00000322
	b _08072222
	.align 2, 0
_080721E4: .4byte 0x00000322
_080721E8:
	ldr r5, _080721EC  @ 0x0000037D
	b _08072222
	.align 2, 0
_080721EC: .4byte 0x0000037D
_080721F0:
	ldr r5, _080721F4  @ 0x00000329
	b _08072222
	.align 2, 0
_080721F4: .4byte 0x00000329
_080721F8:
	ldr r5, _080721FC  @ 0x0000037A
	b _08072222
	.align 2, 0
_080721FC: .4byte 0x0000037A
_08072200:
	ldr r5, _08072204  @ 0x0000037B
	b _08072222
	.align 2, 0
_08072204: .4byte 0x0000037B
_08072208:
	movs r5, #0xb9
	lsls r5, r5, #2
	b _08072222
_0807220E:
	movs r5, #0xdf
	lsls r5, r5, #2
	b _08072222
_08072214:
	ldr r5, _08072218  @ 0x0000037F
	b _08072222
	.align 2, 0
_08072218: .4byte 0x0000037F
_0807221C:
	movs r5, #0xde
	b _08072222
_08072220:
	movs r5, #0
_08072222:
	lsls r0, r5, #0x10
	asrs r4, r0, #0x10
	movs r0, #1
	negs r0, r0
	cmp r4, r0
	beq _08072246
	ldr r1, [sp]
	adds r0, r4, #0
	str r2, [sp, #4]
	bl SomePlaySound_8071990
	ldr r2, [sp, #4]
	lsls r1, r2, #0x10
	asrs r1, r1, #0x10
	movs r2, #1
	adds r0, r4, #0
	bl sub_8071AB0
_08072246:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8071B6C

	THUMB_FUNC_START sub_8072258
sub_8072258: @ 0x08072258
	push {r4, lr}
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	bl GetBattleAnimArenaFlag
	cmp r0, #1
	bne _0807226A
_08072266:
	movs r0, #0
	b _0807239E
_0807226A:
	cmp r4, #0x40
	bls _08072270
	b _0807239C
_08072270:
	lsls r0, r4, #2
	ldr r1, _0807227C  @ _08072280
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0807227C: .4byte _08072280
_08072280: @ jump table
	.4byte _0807239C @ case 0
	.4byte _08072266 @ case 1
	.4byte _08072266 @ case 2
	.4byte _08072266 @ case 3
	.4byte _08072266 @ case 4
	.4byte _08072266 @ case 5
	.4byte _08072398 @ case 6
	.4byte _08072398 @ case 7
	.4byte _08072398 @ case 8
	.4byte _08072398 @ case 9
	.4byte _08072266 @ case 10
	.4byte _08072398 @ case 11
	.4byte _08072384 @ case 12
	.4byte _08072384 @ case 13
	.4byte _08072390 @ case 14
	.4byte _08072390 @ case 15
	.4byte _08072388 @ case 16
	.4byte _08072266 @ case 17
	.4byte _0807238C @ case 18
	.4byte _08072394 @ case 19
	.4byte _08072394 @ case 20
	.4byte _08072388 @ case 21
	.4byte _08072388 @ case 22
	.4byte _08072398 @ case 23
	.4byte _08072398 @ case 24
	.4byte _08072266 @ case 25
	.4byte _08072266 @ case 26
	.4byte _08072266 @ case 27
	.4byte _08072266 @ case 28
	.4byte _08072398 @ case 29
	.4byte _08072398 @ case 30
	.4byte _08072398 @ case 31
	.4byte _08072398 @ case 32
	.4byte _08072398 @ case 33
	.4byte _08072266 @ case 34
	.4byte _08072266 @ case 35
	.4byte _08072398 @ case 36
	.4byte _08072266 @ case 37
	.4byte _0807238C @ case 38
	.4byte _08072266 @ case 39
	.4byte _08072266 @ case 40
	.4byte _08072266 @ case 41
	.4byte _0807238C @ case 42
	.4byte _08072266 @ case 43
	.4byte _0807239C @ case 44
	.4byte _08072398 @ case 45
	.4byte _0807239C @ case 46
	.4byte _08072266 @ case 47
	.4byte _08072398 @ case 48
	.4byte _08072398 @ case 49
	.4byte _08072398 @ case 50
	.4byte _08072266 @ case 51
	.4byte _0807239C @ case 52
	.4byte _0807239C @ case 53
	.4byte _08072388 @ case 54
	.4byte _08072398 @ case 55
	.4byte _08072266 @ case 56
	.4byte _08072266 @ case 57
	.4byte _0807238C @ case 58
	.4byte _0807238C @ case 59
	.4byte _08072388 @ case 60
	.4byte _0807238C @ case 61
	.4byte _08072398 @ case 62
	.4byte _08072266 @ case 63
	.4byte _08072266 @ case 64
_08072384:
	movs r0, #1
	b _0807239E
_08072388:
	movs r0, #2
	b _0807239E
_0807238C:
	movs r0, #3
	b _0807239E
_08072390:
	movs r0, #4
	b _0807239E
_08072394:
	movs r0, #5
	b _0807239E
_08072398:
	movs r0, #6
	b _0807239E
_0807239C:
	movs r0, #0
_0807239E:
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8072258

	THUMB_FUNC_START sub_80723A4
sub_80723A4: @ 0x080723A4
	push {r4, r5, lr}
	adds r4, r0, #0
	bl sub_807290C
	movs r2, #2
	ldrsh r1, [r4, r2]
	adds r5, r0, r1
	adds r0, r4, #0
	bl GetAISSubjectId
	cmp r0, #0
	bne _080723C2
	cmp r5, #0x58
	bgt _080723CA
	b _080723C6
_080723C2:
	cmp r5, #0x97
	ble _080723CA
_080723C6:
	movs r0, #1
	b _080723CC
_080723CA:
	movs r0, #0
_080723CC:
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80723A4

	THUMB_FUNC_START sub_80723D4
sub_80723D4: @ 0x080723D4
	push {lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r2, r0, #0
	movs r1, #0
	cmp r0, #4
	bls _080723F8
	cmp r0, #8
	bhi _080723EA
	movs r1, #1
	b _080723F8
_080723EA:
	cmp r0, #0xb
	bhi _080723F2
	movs r1, #2
	b _080723F8
_080723F2:
	cmp r2, #0xf
	bhi _080723F8
	movs r1, #3
_080723F8:
	adds r0, r1, #0
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_80723D4

	THUMB_FUNC_START sub_8072400
sub_8072400: @ 0x08072400
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r4, _08072440  @ gUnknown_0203E152
	bl GetAISSubjectId
	lsls r0, r0, #1
	adds r0, r0, r4
	movs r1, #0
	ldrsh r6, [r0, r1]
	adds r0, r5, #0
	bl GetAISSubjectId
	lsls r1, r6, #1
	adds r6, r1, r0
	adds r0, r6, #0
	bl sub_8058A60
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	adds r0, r6, #2
	bl sub_8058A60
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r4, r0
	beq _08072448
	cmp r0, #0
	beq _08072444
	movs r0, #0
	b _0807244A
	.align 2, 0
_08072440: .4byte gUnknown_0203E152
_08072444:
	movs r0, #1
	b _0807244A
_08072448:
	movs r0, #2
_0807244A:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8072400

	THUMB_FUNC_START sub_8072450
sub_8072450: @ 0x08072450
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	bl GetCoreAIStruct
	adds r4, r0, #0
	ldr r6, _080724C0  @ 0x0000FFFF
	adds r0, r5, #0
	bl sub_8072504
	adds r0, r4, #0
	bl sub_8072400
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #2
	beq _080724A6
	adds r0, r5, #0
	bl GetAISSubjectId
	adds r1, r0, #0
	ldrh r0, [r5, #0xe]
	subs r0, #1
	lsls r0, r0, #1
	adds r0, r0, r1
	bl GetAnimRoundType
	movs r1, #0x80
	lsls r1, r1, #2
	ands r1, r0
	cmp r1, #0
	beq _080724A6
	ldr r4, _080724C4  @ 0x000003CF
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r4, #0
	bl SomePlaySound_8071990
	movs r0, #2
	ldrsh r1, [r5, r0]
	adds r0, r4, #0
	movs r2, #1
	bl sub_8071AB0
_080724A6:
	adds r0, r5, #0
	bl sub_8072400
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	beq _080724D2
	cmp r0, #1
	bgt _080724C8
	cmp r0, #0
	beq _080724CE
	b _080724D8
	.align 2, 0
_080724C0: .4byte 0x0000FFFF
_080724C4: .4byte 0x000003CF
_080724C8:
	cmp r0, #2
	beq _080724D6
	b _080724D8
_080724CE:
	movs r6, #0xd4
	b _080724D8
_080724D2:
	movs r6, #0xd5
	b _080724D8
_080724D6:
	ldr r6, _08072500  @ 0x000002CE
_080724D8:
	lsls r0, r6, #0x10
	asrs r4, r0, #0x10
	movs r0, #1
	negs r0, r0
	cmp r4, r0
	beq _080724FA
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r4, #0
	bl SomePlaySound_8071990
	movs r0, #2
	ldrsh r1, [r5, r0]
	adds r0, r4, #0
	movs r2, #1
	bl sub_8071AB0
_080724FA:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08072500: .4byte 0x000002CE

	THUMB_FUNC_END sub_8072450

	THUMB_FUNC_START sub_8072504
sub_8072504: @ 0x08072504
	push {r4, r5, lr}
	adds r4, r0, #0
	bl GetCoreAIStruct
	adds r5, r0, #0
	adds r0, r4, #0
	bl sub_8072400
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bgt _08072540
	cmp r0, #0
	blt _08072540
	adds r0, r5, #0
	bl sub_805A268
	cmp r0, #1
	bne _08072540
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #0xd8
	bl SomePlaySound_8071990
	movs r0, #2
	ldrsh r1, [r4, r0]
	movs r0, #0xd8
	movs r2, #1
	bl sub_8071AB0
_08072540:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8072504

	THUMB_FUNC_START sub_8072548
sub_8072548: @ 0x08072548
	push {lr}
	ldr r1, _08072564  @ gBattleHitArray
	ldr r1, [r1]
	lsls r1, r1, #8
	lsrs r1, r1, #0x1b
	movs r2, #8
	ands r1, r2
	negs r1, r1
	lsrs r1, r1, #0x1f
	cmp r0, r1
	beq _08072568
	movs r0, #0
	b _0807256A
	.align 2, 0
_08072564: .4byte gBattleHitArray
_08072568:
	movs r0, #1
_0807256A:
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8072548

	THUMB_FUNC_START sub_8072570
sub_8072570: @ 0x08072570
	push {lr}
	cmp r0, #0
	bne _08072578
	b _080726A4
_08072578:
	bl GetItemIndex
	subs r0, #0x4b
	cmp r0, #0x41
	bls _08072584
	b _080726A4
_08072584:
	lsls r0, r0, #2
	ldr r1, _08072590  @ _08072594
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08072590: .4byte _08072594
_08072594: @ jump table
	.4byte _0807269C @ case 0
	.4byte _0807269C @ case 1
	.4byte _0807269C @ case 2
	.4byte _0807269C @ case 3
	.4byte _0807269C @ case 4
	.4byte _0807269C @ case 5
	.4byte _080726A0 @ case 6
	.4byte _080726A0 @ case 7
	.4byte _080726A0 @ case 8
	.4byte _080726A4 @ case 9
	.4byte _080726A4 @ case 10
	.4byte _080726A4 @ case 11
	.4byte _0807269C @ case 12
	.4byte _080726A4 @ case 13
	.4byte _0807269C @ case 14
	.4byte _080726A4 @ case 15
	.4byte _080726A4 @ case 16
	.4byte _080726A4 @ case 17
	.4byte _080726A4 @ case 18
	.4byte _080726A4 @ case 19
	.4byte _080726A4 @ case 20
	.4byte _080726A4 @ case 21
	.4byte _080726A4 @ case 22
	.4byte _080726A4 @ case 23
	.4byte _080726A4 @ case 24
	.4byte _080726A4 @ case 25
	.4byte _080726A4 @ case 26
	.4byte _080726A4 @ case 27
	.4byte _080726A4 @ case 28
	.4byte _080726A4 @ case 29
	.4byte _080726A4 @ case 30
	.4byte _080726A4 @ case 31
	.4byte _080726A4 @ case 32
	.4byte _080726A4 @ case 33
	.4byte _080726A4 @ case 34
	.4byte _080726A4 @ case 35
	.4byte _080726A4 @ case 36
	.4byte _080726A4 @ case 37
	.4byte _080726A4 @ case 38
	.4byte _080726A4 @ case 39
	.4byte _080726A4 @ case 40
	.4byte _080726A4 @ case 41
	.4byte _080726A4 @ case 42
	.4byte _080726A4 @ case 43
	.4byte _080726A4 @ case 44
	.4byte _080726A4 @ case 45
	.4byte _080726A4 @ case 46
	.4byte _080726A4 @ case 47
	.4byte _080726A4 @ case 48
	.4byte _080726A4 @ case 49
	.4byte _080726A4 @ case 50
	.4byte _080726A4 @ case 51
	.4byte _080726A4 @ case 52
	.4byte _080726A4 @ case 53
	.4byte _080726A4 @ case 54
	.4byte _080726A4 @ case 55
	.4byte _080726A4 @ case 56
	.4byte _080726A4 @ case 57
	.4byte _080726A4 @ case 58
	.4byte _080726A4 @ case 59
	.4byte _080726A4 @ case 60
	.4byte _080726A4 @ case 61
	.4byte _080726A4 @ case 62
	.4byte _080726A4 @ case 63
	.4byte _080726A4 @ case 64
	.4byte _0807269C @ case 65
_0807269C:
	movs r0, #2
	b _080726A6
_080726A0:
	movs r0, #1
	b _080726A6
_080726A4:
	movs r0, #0
_080726A6:
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8072570

	THUMB_FUNC_START sub_80726AC
sub_80726AC: @ 0x080726AC
	push {r4, r5, r6, r7, lr}
	ldr r0, _080726F0  @ gpEkrBattleUnitLeft
	ldr r1, _080726F4  @ gpEkrBattleUnitRight
	ldr r5, [r0]
	ldr r7, [r1]
	ldr r0, _080726F8  @ gBmSt
	ldrb r1, [r0, #4]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _080726C4
	b _0807288C
_080726C4:
	ldr r1, _080726FC  @ gUnknown_020200A8
	movs r0, #1
	str r0, [r1]
	ldr r1, _08072700  @ gBanimSomeObjPalIndex
	ldr r0, _08072704  @ gEkrInitialHitSide
	movs r2, #0
	ldrsh r0, [r0, r2]
	lsls r0, r0, #1
	adds r0, r0, r1
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r6, #0x1a
	cmp r0, #1
	beq _080726E2
	movs r6, #0x19
_080726E2:
	bl GetBattleAnimArenaFlag
	cmp r0, #1
	bne _08072708
	bl Sound_SetDefaultMaxNumChannels
	b _08072710
	.align 2, 0
_080726F0: .4byte gpEkrBattleUnitLeft
_080726F4: .4byte gpEkrBattleUnitRight
_080726F8: .4byte gBmSt
_080726FC: .4byte gUnknown_020200A8
_08072700: .4byte gBanimSomeObjPalIndex
_08072704: .4byte gEkrInitialHitSide
_08072708:
	bl GetEkrEventFlagMaybe
	cmp r0, #1
	bne _0807271C
_08072710:
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #0x39
	bl sub_8071A54
	b _08072892
_0807271C:
	ldr r0, _08072734  @ gEkrSomeType
	movs r2, #0
	ldrsh r0, [r0, r2]
	cmp r0, #4
	bne _08072738
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #0x23
	bl sub_8071A54
	b _08072892
	.align 2, 0
_08072734: .4byte gEkrSomeType
_08072738:
	movs r4, #0
	adds r0, r7, #0
	adds r0, #0x4a
	ldrh r0, [r0]
	bl sub_8058B08
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _0807274E
	movs r4, #1
_0807274E:
	movs r0, #1
	bl sub_8058B24
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0807275C
	movs r4, #0
_0807275C:
	ldr r0, _08072790  @ gBanimSideVaildFlagMaybe
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _08072768
	movs r4, #0
_08072768:
	ldr r0, [r5]
	ldrb r0, [r0, #4]
	cmp r0, #0x40
	bne _08072772
	movs r4, #0
_08072772:
	cmp r0, #0x6c
	bne _08072778
	movs r4, #0
_08072778:
	cmp r0, #0xbe
	bne _0807277E
	movs r4, #0
_0807277E:
	cmp r4, #1
	bne _08072794
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #0x1f
	bl sub_8071A54
	b _08072892
	.align 2, 0
_08072790: .4byte gBanimSideVaildFlagMaybe
_08072794:
	cmp r0, #0xbe
	bne _080727B4
	bl sub_8084634
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _080727B0
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #0x55
	bl sub_8071A54
	b _08072892
_080727B0:
	bl sub_8084628
_080727B4:
	adds r0, r5, #0
	bl sub_80728D0
	adds r4, r0, #0
	ldr r0, [r5]
	ldrb r0, [r0, #4]
	bl GetUnitFromCharId
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #0xc0
	ands r0, r1
	cmp r0, #0
	bne _080727D6
	movs r4, #1
	negs r4, r4
_080727D6:
	ldr r0, _080727F8  @ gBanimSideVaildFlagMaybe
	movs r2, #0
	ldrsh r0, [r0, r2]
	cmp r0, #0
	bne _080727E4
	movs r4, #1
	negs r4, r4
_080727E4:
	movs r0, #1
	negs r0, r0
	cmp r4, r0
	beq _080727FC
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r4, #0
	bl sub_8071A54
	b _08072892
	.align 2, 0
_080727F8: .4byte gBanimSideVaildFlagMaybe
_080727FC:
	movs r4, #0
	ldr r0, [r7, #4]
	ldrb r0, [r0, #4]
	cmp r0, #0x4d
	bne _08072822
	ldr r0, _08072834  @ gBattleStats
	ldrh r1, [r0]
	movs r0, #0x40
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	negs r0, r0
	lsrs r4, r0, #0x1f
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08072822
	movs r4, #1
_08072822:
	cmp r4, #1
	bne _08072838
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #0x20
	bl sub_8071A54
	b _08072892
	.align 2, 0
_08072834: .4byte gBattleStats
_08072838:
	movs r0, #0
	bl sub_8072548
	cmp r0, #1
	bne _0807284C
	ldr r0, _08072848  @ gBattleActor
	b _08072858
	.align 2, 0
_08072848: .4byte gBattleActor
_0807284C:
	movs r0, #1
	bl sub_8072548
	cmp r0, #1
	bne _08072868
	ldr r0, _08072864  @ gBattleTarget
_08072858:
	adds r0, #0x4a
	ldrh r0, [r0]
	bl sub_8072570
	b _0807286A
	.align 2, 0
_08072864: .4byte gBattleTarget
_08072868:
	movs r0, #0
_0807286A:
	cmp r0, #1
	beq _08072876
	cmp r0, #2
	bne _08072878
	movs r6, #0x22
	b _08072878
_08072876:
	movs r6, #0x21
_08072878:
	movs r0, #1
	negs r0, r0
	cmp r6, r0
	beq _0807288C
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r6, #0
	bl sub_8071A54
	b _08072892
_0807288C:
	ldr r1, _08072898  @ gUnknown_020200A8
	movs r0, #0
	str r0, [r1]
_08072892:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08072898: .4byte gUnknown_020200A8

	THUMB_FUNC_END sub_80726AC

	THUMB_FUNC_START sub_807289C
sub_807289C: @ 0x0807289C
	push {lr}
	bl sub_8076310
	cmp r0, #1
	beq _080728BA
	ldr r0, _080728C0  @ gBmSt
	ldrb r1, [r0, #4]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	bne _080728BA
	ldr r0, _080728C4  @ gUnknown_020200A8
	ldr r0, [r0]
	cmp r0, #0
	bne _080728C8
_080728BA:
	bl sub_800270C
	b _080728CC
	.align 2, 0
_080728C0: .4byte gBmSt
_080728C4: .4byte gUnknown_020200A8
_080728C8:
	bl sub_8002670
_080728CC:
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_807289C

	THUMB_FUNC_START sub_80728D0
sub_80728D0: @ 0x080728D0
	push {r4, r5, lr}
	ldr r0, [r0]
	ldrb r2, [r0, #4]
	movs r3, #0
	ldr r0, _08072908  @ gUnknown_08758A60
	ldr r1, [r0]
	movs r4, #1
	negs r4, r4
	adds r5, r0, #0
	cmp r1, r4
	beq _080728FA
	cmp r2, r1
	beq _080728FA
	adds r1, r5, #0
_080728EC:
	adds r1, #8
	adds r3, #2
	ldr r0, [r1]
	cmp r0, r4
	beq _080728FA
	cmp r2, r0
	bne _080728EC
_080728FA:
	adds r0, r3, #1
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r0, [r0]
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08072908: .4byte gUnknown_08758A60

	THUMB_FUNC_END sub_80728D0

	THUMB_FUNC_START sub_807290C
sub_807290C: @ 0x0807290C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r2, [r0, #0x3c]
	ldr r3, [r2]
	ldr r1, _0807293C  @ 0xFFFF0000
	adds r0, r3, #0
	ands r0, r1
	cmp r0, r1
	bne _08072930
	ldr r7, _08072940  @ 0x0000FFFF
	ands r7, r3
	cmp r7, #0
	beq _08072930
_08072928:
	subs r7, #1
	adds r2, #0xc
	cmp r7, #0
	bne _08072928
_08072930:
	adds r6, r2, #0
	movs r7, #0
	movs r0, #0
	mov r8, r0
	b _08072978
	.align 2, 0
_0807293C: .4byte 0xFFFF0000
_08072940: .4byte 0x0000FFFF
_08072944:
	movs r0, #6
	ldrsh r5, [r6, r0]
	ldr r0, [r6]
	bl sub_80717D4
	lsls r0, r0, #0x10
	asrs r0, r0, #0x11
	adds r5, r5, r0
	ldr r0, [r6]
	bl sub_80717D4
	adds r4, r0, #0
	ldr r0, [r6]
	bl sub_80717F0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	adds r1, r4, #0
	muls r1, r0, r1
	adds r0, r1, #0
	muls r0, r5, r0
	add r8, r0
	adds r7, r7, r1
	adds r6, #0xc
_08072978:
	ldr r0, [r6]
	cmp r0, #1
	bne _08072944
	cmp r7, #0
	bne _0807298C
	ldr r0, _08072988  @ 0x7FFFFFFF
	b _08072994
	.align 2, 0
_08072988: .4byte 0x7FFFFFFF
_0807298C:
	mov r0, r8
	adds r1, r7, #0
	bl Div
_08072994:
	mov r8, r0
	mov r0, r8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_807290C

	THUMB_FUNC_START sub_80729A4
sub_80729A4: @ 0x080729A4
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r2, #0
	adds r6, r3, #0
	bl SomePlaySound_8071990
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r6, #0
	bl sub_8071AB0
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80729A4

	THUMB_FUNC_START sub_80729C0
sub_80729C0: @ 0x080729C0
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r2, #0
	bl SomePlaySound_8071990
	adds r0, r4, #0
	bl sub_807290C
	adds r1, r0, #0
	adds r0, r5, #0
	movs r2, #1
	bl sub_8071AB0
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80729C0

	THUMB_FUNC_START EkrClasschgFinished
EkrClasschgFinished: @ 0x080729E0
	push {lr}
	ldr r0, _080729F4  @ gUnknown_020200B0
	ldr r0, [r0]
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #1
	beq _080729F8
	movs r0, #0
	b _080729FA
	.align 2, 0
_080729F4: .4byte gUnknown_020200B0
_080729F8:
	movs r0, #1
_080729FA:
	pop {r1}
	bx r1

	THUMB_FUNC_END EkrClasschgFinished

	THUMB_FUNC_START EndEkrClasschg
EndEkrClasschg: @ 0x08072A00
	push {lr}
	ldr r0, _08072A10  @ gUnknown_020200B0
	ldr r0, [r0]
	bl Proc_End
	pop {r0}
	bx r0
	.align 2, 0
_08072A10: .4byte gUnknown_020200B0

	THUMB_FUNC_END EndEkrClasschg

	THUMB_FUNC_START NewEkrClassChg
NewEkrClassChg: @ 0x08072A14
	push {r4, r5, lr}
	adds r5, r0, #0
	bl NewEfxSpellCast
	ldr r4, _08072A3C  @ gUnknown_020200B0
	ldr r0, _08072A40  @ gUnknown_08758FC0
	movs r1, #3
	bl Proc_Start
	str r0, [r4]
	str r5, [r0, #0x5c]
	movs r2, #0
	movs r1, #0
	strh r1, [r0, #0x2c]
	adds r0, #0x29
	strb r2, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08072A3C: .4byte gUnknown_020200B0
_08072A40: .4byte gUnknown_08758FC0

	THUMB_FUNC_END NewEkrClassChg

	THUMB_FUNC_START sub_8072A44
sub_8072A44: @ 0x08072A44
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetCoreAIStruct
	adds r5, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	movs r7, #0
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _08072AC0
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
	movs r0, #3
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	ldr r0, [r4, #0x5c]
	bl sub_8054B64
	adds r0, r5, #0
	bl sub_8054B64
	ldr r2, _08072ABC  @ gLCDControlBuffer
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
	ldr r0, [r4, #0x5c]
	bl sub_8072F84
	adds r0, r5, #0
	bl sub_8072ED8
	b _08072C94
	.align 2, 0
_08072ABC: .4byte gLCDControlBuffer
_08072AC0:
	cmp r0, #0x28
	bne _08072ACC
	adds r0, r5, #0
	bl sub_8072DD8
	b _08072C94
_08072ACC:
	cmp r0, #0x87
	bne _08072AE2
	ldr r0, [r4, #0x5c]
	str r7, [sp]
	str r7, [sp, #4]
	movs r1, #0
	movs r2, #0x38
	movs r3, #0x10
	bl sub_805BA1C
	b _08072C94
_08072AE2:
	cmp r0, #0x88
	bne _08072AF2
	ldr r0, [r4, #0x5c]
	movs r1, #0xc
	movs r2, #0
	bl sub_8073388
	b _08072C94
_08072AF2:
	cmp r0, #0x94
	bne _08072AFE
	movs r0, #1
	bl SetAnimStateHidden
	b _08072C94
_08072AFE:
	cmp r0, #0x8c
	bne _08072B16
	ldr r0, [r4, #0x5c]
	movs r1, #0xa
	bl StartSpellBG_FLASH
	movs r0, #1
	movs r1, #0
	movs r2, #8
	bl BG_SetPosition
	b _08072C94
_08072B16:
	cmp r0, #0x92
	bne _08072B24
	ldr r0, [r4, #0x5c]
	movs r1, #0
	bl sub_807304C
	b _08072C94
_08072B24:
	cmp r0, #0xba
	bne _08072B48
	ldr r2, [r4, #0x5c]
	ldrh r1, [r2, #8]
	ldr r0, _08072B44  @ 0x0000F3FF
	ands r0, r1
	strh r0, [r2, #8]
	ldr r2, [r4, #0x5c]
	ldrh r0, [r2, #8]
	movs r3, #0x80
	lsls r3, r3, #3
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2, #8]
	b _08072C94
	.align 2, 0
_08072B44: .4byte 0x0000F3FF
_08072B48:
	cmp r0, #0xd8
	bne _08072B54
	adds r0, r5, #0
	bl sub_8072FE8
	b _08072C94
_08072B54:
	movs r6, #0x80
	lsls r6, r6, #1
	cmp r0, r6
	bne _08072BC4
	ldr r0, [r4, #0x5c]
	bl sub_8072E1C
	ldr r2, _08072BC0  @ gLCDControlBuffer
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
	movs r0, #1
	movs r1, #0
	movs r2, #0x10
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	ldr r0, [r4, #0x5c]
	movs r1, #0x10
	str r1, [sp]
	str r7, [sp, #4]
	movs r1, #0
	movs r2, #0x38
	movs r3, #0
	bl sub_805BA1C
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
	movs r0, #3
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	b _08072C94
	.align 2, 0
_08072BC0: .4byte gLCDControlBuffer
_08072BC4:
	movs r0, #0x2c
	ldrsh r1, [r4, r0]
	movs r0, #0x8f
	lsls r0, r0, #1
	cmp r1, r0
	bne _08072BEC
	movs r0, #0
	bl SetAnimStateUnHidden
	ldr r0, [r4, #0x5c]
	movs r1, #8
	bl StartSpellBG_FLASH
	adds r0, r5, #0
	movs r1, #0
	movs r2, #0x20
	movs r3, #0
	bl sub_80547DC
	b _08072C94
_08072BEC:
	movs r0, #0x9d
	lsls r0, r0, #1
	cmp r1, r0
	bne _08072C18
	ldrh r0, [r5, #8]
	ldr r1, _08072C14  @ 0x0000F3FF
	ands r1, r0
	movs r2, #0x80
	lsls r2, r2, #3
	adds r0, r2, #0
	orrs r1, r0
	strh r1, [r5, #8]
	bl sub_8055000
	adds r0, r5, #0
	movs r1, #0xa
	movs r2, #0x46
	bl sub_8054134
	b _08072C94
	.align 2, 0
_08072C14: .4byte 0x0000F3FF
_08072C18:
	movs r0, #0xa2
	lsls r0, r0, #1
	cmp r1, r0
	bne _08072C74
	adds r0, r5, #0
	movs r1, #0x82
	bl sub_80730C4
	adds r0, r5, #0
	movs r1, #0x82
	bl sub_8073220
	movs r0, #0
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	adds r0, r5, #0
	movs r1, #0x5a
	movs r2, #0x28
	movs r3, #0xe
	bl sub_805BA1C
	movs r0, #1
	str r0, [sp]
	adds r0, r5, #0
	movs r1, #0x82
	movs r2, #0xa
	adds r3, r6, #0
	bl sub_805B400
	adds r0, r5, #0
	movs r1, #0x82
	movs r2, #0
	bl sub_805B93C
	ldr r0, _08072C70  @ 0x0000013D
	movs r3, #2
	ldrsh r2, [r5, r3]
	adds r1, r6, #0
	movs r3, #1
	bl sub_80729A4
	b _08072C94
	.align 2, 0
_08072C70: .4byte 0x0000013D
_08072C74:
	movs r0, #0xa6
	lsls r0, r0, #1
	cmp r1, r0
	bne _08072C86
	ldr r0, [r4, #0x5c]
	movs r1, #1
	bl sub_807304C
	b _08072C94
_08072C86:
	movs r0, #0x8f
	lsls r0, r0, #2
	cmp r1, r0
	bne _08072C94
	adds r0, r4, #0
	bl Proc_Break
_08072C94:
	movs r0, #0x2c
	ldrsh r1, [r4, r0]
	ldrh r2, [r4, #0x2c]
	cmp r1, #0x28
	bne _08072CAE
	movs r0, #0x9f
	lsls r0, r0, #1
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r2, [r4, #0x5c]
	movs r3, #2
	ldrsh r2, [r2, r3]
	b _08072D94
_08072CAE:
	cmp r1, #0x52
	bne _08072CC2
	movs r0, #0x9f
	lsls r0, r0, #1
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r2, [r4, #0x5c]
	movs r4, #2
	ldrsh r2, [r2, r4]
	b _08072D94
_08072CC2:
	cmp r1, #0x68
	bne _08072CD6
	movs r0, #0x9f
	lsls r0, r0, #1
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r2, [r4, #0x5c]
	movs r3, #2
	ldrsh r2, [r2, r3]
	b _08072D94
_08072CD6:
	cmp r1, #0x72
	bne _08072CEA
	movs r0, #0x9f
	lsls r0, r0, #1
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r2, [r4, #0x5c]
	movs r4, #2
	ldrsh r2, [r2, r4]
	b _08072D94
_08072CEA:
	cmp r1, #0x74
	bne _08072CFE
	movs r0, #0x9f
	lsls r0, r0, #1
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r2, [r4, #0x5c]
	movs r3, #2
	ldrsh r2, [r2, r3]
	b _08072D94
_08072CFE:
	cmp r1, #0x76
	bne _08072D12
	movs r0, #0x9f
	lsls r0, r0, #1
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r2, [r4, #0x5c]
	movs r4, #2
	ldrsh r2, [r2, r4]
	b _08072D94
_08072D12:
	cmp r1, #0x78
	bne _08072D28
	ldr r0, _08072D24  @ 0x0000013B
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r2, [r4, #0x5c]
	movs r3, #2
	ldrsh r2, [r2, r3]
	b _08072D94
	.align 2, 0
_08072D24: .4byte 0x0000013B
_08072D28:
	movs r3, #0x80
	lsls r3, r3, #1
	cmp r1, r3
	bne _08072D38
	ldr r0, _08072D34  @ 0x000003E5
	b _08072D8C
	.align 2, 0
_08072D34: .4byte 0x000003E5
_08072D38:
	movs r0, #0x8f
	lsls r0, r0, #1
	cmp r1, r0
	beq _08072D88
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	bne _08072D4C
	adds r0, #0x1e
	b _08072D8C
_08072D4C:
	lsls r0, r2, #0x10
	asrs r1, r0, #0x10
	movs r0, #0x91
	lsls r0, r0, #1
	cmp r1, r0
	bne _08072D5C
	adds r0, #0x1c
	b _08072D8C
_08072D5C:
	movs r0, #0x93
	lsls r0, r0, #1
	cmp r1, r0
	bne _08072D68
	adds r0, #0x18
	b _08072D8C
_08072D68:
	movs r0, #0x95
	lsls r0, r0, #1
	cmp r1, r0
	bne _08072D74
	adds r0, #0x14
	b _08072D8C
_08072D74:
	movs r0, #0x97
	lsls r0, r0, #1
	cmp r1, r0
	bne _08072D80
	adds r0, #0x10
	b _08072D8C
_08072D80:
	movs r0, #0x99
	lsls r0, r0, #1
	cmp r1, r0
	bne _08072D9C
_08072D88:
	movs r0, #0x9f
	lsls r0, r0, #1
_08072D8C:
	ldr r1, [r4, #0x5c]
	movs r4, #2
	ldrsh r2, [r1, r4]
	adds r1, r3, #0
_08072D94:
	movs r3, #1
	bl sub_80729A4
	b _08072DB4
_08072D9C:
	movs r0, #0x9a
	lsls r0, r0, #1
	cmp r1, r0
	bne _08072DB4
	ldr r0, _08072DBC  @ 0x000003E6
	ldr r1, [r4, #0x5c]
	movs r4, #2
	ldrsh r2, [r1, r4]
	adds r1, r3, #0
	movs r3, #1
	bl sub_80729A4
_08072DB4:
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08072DBC: .4byte 0x000003E6

	THUMB_FUNC_END sub_8072A44

	THUMB_FUNC_START sub_8072DC0
sub_8072DC0: @ 0x08072DC0
	adds r0, #0x29
	movs r1, #1
	strb r1, [r0]
	bx lr

	THUMB_FUNC_END sub_8072DC0

	THUMB_FUNC_START EndEfxStatusUnit
EndEfxStatusUnit: @ 0x08072DC8
	push {lr}
	ldr r0, _08072DD4  @ gProc_efxStatusUnit
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
_08072DD4: .4byte gProc_efxStatusUnit

	THUMB_FUNC_END EndEfxStatusUnit

	THUMB_FUNC_START sub_8072DD8
sub_8072DD8: @ 0x08072DD8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08072E08  @ gUnknown_08758FE8
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r1, [r0, #0x44]
	ldr r1, _08072E0C  @ gUnknown_080E143A
	str r1, [r0, #0x48]
	ldr r1, _08072E10  @ gUnknown_08759000
	str r1, [r0, #0x4c]
	str r1, [r0, #0x50]
	ldr r1, _08072E14  @ gUnknown_08759094
	str r1, [r0, #0x54]
	ldr r1, _08072E18  @ gUnknown_08759128
	str r1, [r0, #0x58]
	bl sub_80551B0
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08072E08: .4byte gUnknown_08758FE8
_08072E0C: .4byte gUnknown_080E143A
_08072E10: .4byte gUnknown_08759000
_08072E14: .4byte gUnknown_08759094
_08072E18: .4byte gUnknown_08759128

	THUMB_FUNC_END sub_8072DD8

	THUMB_FUNC_START sub_8072E1C
sub_8072E1C: @ 0x08072E1C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08072E4C  @ gUnknown_08758FE8
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r1, [r0, #0x44]
	ldr r1, _08072E50  @ gUnknown_080E1488
	str r1, [r0, #0x48]
	ldr r1, _08072E54  @ gUnknown_08759000
	str r1, [r0, #0x4c]
	str r1, [r0, #0x50]
	ldr r1, _08072E58  @ gUnknown_08759094
	str r1, [r0, #0x54]
	ldr r1, _08072E5C  @ gUnknown_08759128
	str r1, [r0, #0x58]
	bl sub_80551B0
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08072E4C: .4byte gUnknown_08758FE8
_08072E50: .4byte gUnknown_080E1488
_08072E54: .4byte gUnknown_08759000
_08072E58: .4byte gUnknown_08759094
_08072E5C: .4byte gUnknown_08759128

	THUMB_FUNC_END sub_8072E1C

	THUMB_FUNC_START sub_8072E60
sub_8072E60: @ 0x08072E60
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	ldr r0, [r5, #0x5c]
	bl GetCoreAIStruct
	adds r7, r0, #0
	adds r0, r5, #0
	adds r0, #0x2c
	adds r1, r5, #0
	adds r1, #0x44
	ldr r2, [r5, #0x48]
	bl sub_80558F4
	lsls r0, r0, #0x10
	asrs r4, r0, #0x10
	cmp r4, #0
	blt _08072EB8
	ldr r6, [r5, #0x4c]
	ldr r0, [r5, #0x50]
	mov r8, r0
	ldr r0, [r5, #0x54]
	ldr r5, [r5, #0x58]
	lsls r4, r4, #2
	adds r0, r4, r0
	ldr r0, [r0]
	movs r1, #0x80
	lsls r1, r1, #6
	bl SomeImageStoringRoutine_SpellAnim2
	adds r5, r4, r5
	ldr r0, [r5]
	movs r1, #0x20
	bl SomePaletteStoringRoutine_SpellAnim2
	adds r6, r4, r6
	ldr r1, [r6]
	add r4, r8
	ldr r2, [r4]
	adds r0, r7, #0
	bl sub_8055670
	b _08072ECE
_08072EB8:
	movs r0, #1
	negs r0, r0
	cmp r4, r0
	bne _08072ECE
	bl ClearBG1
	bl sub_805526C
	adds r0, r5, #0
	bl Proc_End
_08072ECE:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8072E60

	THUMB_FUNC_START sub_8072ED8
sub_8072ED8: @ 0x08072ED8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08072EF0  @ gUnknown_087591BC
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08072EF0: .4byte gUnknown_087591BC

	THUMB_FUNC_END sub_8072ED8

	THUMB_FUNC_START sub_8072EF4
sub_8072EF4: @ 0x08072EF4
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x28
	beq _08072F1A
	cmp r0, #0x52
	beq _08072F1A
	cmp r0, #0x68
	beq _08072F1A
	cmp r0, #0x72
	beq _08072F1A
	cmp r0, #0x74
	beq _08072F1A
	cmp r0, #0x76
	bne _08072F30
_08072F1A:
	movs r0, #0x9f
	lsls r0, r0, #1
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r2, [r4, #0x5c]
	movs r3, #2
	ldrsh r2, [r2, r3]
	movs r3, #1
	bl sub_80729A4
	b _08072F46
_08072F30:
	cmp r0, #0x78
	bne _08072F46
	ldr r0, _08072F54  @ 0x0000013B
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r2, [r4, #0x5c]
	movs r3, #2
	ldrsh r2, [r2, r3]
	movs r3, #1
	bl sub_80729A4
_08072F46:
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08072F54: .4byte 0x0000013B

	THUMB_FUNC_END sub_8072EF4

	THUMB_FUNC_START sub_8072F58
sub_8072F58: @ 0x08072F58
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08072F70  @ gUnknown_087591D4
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08072F70: .4byte gUnknown_087591D4

	THUMB_FUNC_END sub_8072F58

	THUMB_FUNC_START sub_8072F74
sub_8072F74: @ 0x08072F74
	push {lr}
	ldrh r1, [r0, #0x2c]
	adds r1, #1
	strh r1, [r0, #0x2c]
	bl Proc_Break
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8072F74

	THUMB_FUNC_START sub_8072F84
sub_8072F84: @ 0x08072F84
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, _08072FC0  @ gUnknown_087591EC
	movs r1, #3
	bl Proc_Start
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	ldr r3, _08072FC4  @ gUnknown_08792928
	str r3, [sp]
	adds r0, r4, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl sub_8055554
	str r0, [r5, #0x60]
	ldr r0, _08072FC8  @ gUnknown_08792194
	movs r1, #0x20
	bl SomePaletteStoringRoutine_SpellAnim
	ldr r0, _08072FCC  @ gUnknown_08791D9C
	movs r1, #0x80
	lsls r1, r1, #5
	bl SomeImageStoringRoutine_SpellAnim
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08072FC0: .4byte gUnknown_087591EC
_08072FC4: .4byte gUnknown_08792928
_08072FC8: .4byte gUnknown_08792194
_08072FCC: .4byte gUnknown_08791D9C

	THUMB_FUNC_END sub_8072F84

	THUMB_FUNC_START sub_8072FD0
sub_8072FD0: @ 0x08072FD0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x60]
	bl AnimDelete
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8072FD0

	THUMB_FUNC_START sub_8072FE8
sub_8072FE8: @ 0x08072FE8
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, _08073024  @ gUnknown_0875920C
	movs r1, #3
	bl Proc_Start
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	ldr r3, _08073028  @ gUnknown_08792958
	str r3, [sp]
	adds r0, r4, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl sub_8055554
	str r0, [r5, #0x60]
	ldr r0, _0807302C  @ gUnknown_08792194
	movs r1, #0x20
	bl SomePaletteStoringRoutine_SpellAnim
	ldr r0, _08073030  @ gUnknown_08791D9C
	movs r1, #0x80
	lsls r1, r1, #5
	bl SomeImageStoringRoutine_SpellAnim
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08073024: .4byte gUnknown_0875920C
_08073028: .4byte gUnknown_08792958
_0807302C: .4byte gUnknown_08792194
_08073030: .4byte gUnknown_08791D9C

	THUMB_FUNC_END sub_8072FE8

	THUMB_FUNC_START sub_8073034
sub_8073034: @ 0x08073034
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x60]
	bl AnimDelete
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8073034

	THUMB_FUNC_START sub_807304C
sub_807304C: @ 0x0807304C
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	lsls r4, r1, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _08073068  @ gUnknown_0875922C
	movs r1, #3
	bl Proc_Start
	adds r5, r0, #0
	cmp r4, #0
	bne _0807306C
	str r6, [r5, #0x5c]
	b _08073074
	.align 2, 0
_08073068: .4byte gUnknown_0875922C
_0807306C:
	adds r0, r6, #0
	bl GetCoreAIStruct
	str r0, [r5, #0x5c]
_08073074:
	ldr r3, _080730A0  @ gUnknown_08792988
	ldr r0, [r5, #0x5c]
	str r3, [sp]
	adds r1, r3, #0
	adds r2, r3, #0
	bl sub_8055554
	str r0, [r5, #0x60]
	ldr r0, _080730A4  @ gUnknown_08792194
	movs r1, #0x20
	bl SomePaletteStoringRoutine_SpellAnim
	ldr r0, _080730A8  @ gUnknown_08791D9C
	movs r1, #0x80
	lsls r1, r1, #5
	bl SomeImageStoringRoutine_SpellAnim
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080730A0: .4byte gUnknown_08792988
_080730A4: .4byte gUnknown_08792194
_080730A8: .4byte gUnknown_08791D9C

	THUMB_FUNC_END sub_807304C

	THUMB_FUNC_START sub_80730AC
sub_80730AC: @ 0x080730AC
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x60]
	bl AnimDelete
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80730AC

	THUMB_FUNC_START sub_80730C4
sub_80730C4: @ 0x080730C4
	push {r4, r5, r6, lr}
	mov r6, r9
	mov r5, r8
	push {r5, r6}
	sub sp, #8
	adds r5, r0, #0
	adds r4, r1, #0
	ldr r0, _080731AC  @ gUnknown_0875924C
	movs r1, #3
	bl Proc_Start
	str r5, [r0, #0x5c]
	movs r1, #0
	mov r9, r1
	mov r2, r9
	strh r2, [r0, #0x2c]
	strh r4, [r0, #0x2e]
	ldr r0, _080731B0  @ gUnknown_08791D7C
	movs r1, #0x20
	bl SomePaletteStoringRoutine_SpellAnim2
	ldr r0, _080731B4  @ gUnknown_086849B8
	movs r1, #0x80
	lsls r1, r1, #6
	bl SomeImageStoringRoutine_SpellAnim2
	ldr r0, _080731B8  @ gUnknown_08684AB8
	ldr r1, _080731BC  @ gBG1TilemapBuffer
	movs r2, #1
	mov r8, r2
	str r2, [sp]
	adds r2, #0xff
	str r2, [sp, #4]
	movs r2, #0x20
	movs r3, #0x20
	bl sub_8070E94
	movs r0, #2
	bl BG_EnableSyncByMask
	bl sub_80551B0
	movs r0, #1
	movs r1, #0xe
	movs r2, #8
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	ldr r4, _080731C0  @ gLCDControlBuffer
	adds r3, r4, #0
	adds r3, #0x37
	ldrb r1, [r3]
	movs r6, #0x20
	orrs r1, r6
	ldrb r2, [r4, #1]
	movs r0, #0x21
	negs r0, r0
	ands r0, r2
	movs r2, #0x41
	negs r2, r2
	ands r0, r2
	movs r2, #0x80
	orrs r0, r2
	strb r0, [r4, #1]
	movs r0, #2
	negs r0, r0
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	movs r0, #4
	orrs r1, r0
	movs r0, #8
	orrs r1, r0
	movs r0, #0x10
	orrs r1, r0
	strb r1, [r3]
	mov r0, r9
	str r0, [sp]
	movs r0, #0
	movs r1, #1
	movs r2, #0
	movs r3, #0
	bl SetBlendTargetA
	mov r1, r8
	str r1, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #1
	movs r3, #1
	bl SetBlendTargetB
	adds r4, #0x3d
	ldrb r0, [r4]
	orrs r0, r6
	strb r0, [r4]
	ldr r0, [r5, #0x1c]
	movs r1, #0x80
	lsls r1, r1, #4
	orrs r0, r1
	str r0, [r5, #0x1c]
	ldrh r1, [r5, #8]
	ldr r0, _080731C4  @ 0x0000F3FF
	ands r0, r1
	movs r2, #0x80
	lsls r2, r2, #3
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r5, #8]
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080731AC: .4byte gUnknown_0875924C
_080731B0: .4byte gUnknown_08791D7C
_080731B4: .4byte gUnknown_086849B8
_080731B8: .4byte gUnknown_08684AB8
_080731BC: .4byte gBG1TilemapBuffer
_080731C0: .4byte gLCDControlBuffer
_080731C4: .4byte 0x0000F3FF

	THUMB_FUNC_END sub_80730C4

	THUMB_FUNC_START sub_80731C8
sub_80731C8: @ 0x080731C8
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r5, [r4, #0x5c]
	ldr r1, _08073214  @ gLCDControlBuffer
	ldrh r0, [r1, #0x22]
	subs r0, #1
	strh r0, [r1, #0x22]
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x2e
	ldrsh r1, [r4, r2]
	cmp r0, r1
	bne _0807320E
	bl ClearBG1
	bl sub_805526C
	ldr r0, [r5, #0x1c]
	ldr r1, _08073218  @ 0xFFFFF7FF
	ands r0, r1
	str r0, [r5, #0x1c]
	ldrh r1, [r5, #8]
	ldr r0, _0807321C  @ 0x0000F3FF
	ands r0, r1
	movs r2, #0x80
	lsls r2, r2, #4
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r5, #8]
	adds r0, r4, #0
	bl Proc_Break
_0807320E:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08073214: .4byte gLCDControlBuffer
_08073218: .4byte 0xFFFFF7FF
_0807321C: .4byte 0x0000F3FF

	THUMB_FUNC_END sub_80731C8

	THUMB_FUNC_START sub_8073220
sub_8073220: @ 0x08073220
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _0807323C  @ gUnknown_08759264
	movs r1, #4
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r5, [r0, #0x2e]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807323C: .4byte gUnknown_08759264

	THUMB_FUNC_END sub_8073220

	THUMB_FUNC_START sub_8073240
sub_8073240: @ 0x08073240
	push {r4, lr}
	sub sp, #0x48
	adds r4, r0, #0
	ldr r2, [r4, #0x5c]
	mov r1, sp
	ldrh r0, [r2, #2]
	strh r0, [r1, #2]
	ldrh r0, [r2, #4]
	strh r0, [r1, #4]
	ldr r0, [r2, #0x3c]
	str r0, [sp, #0x3c]
	ldr r0, [r2, #0x1c]
	ldr r1, _0807329C  @ 0xFFFFF7FF
	ands r0, r1
	str r0, [sp, #0x1c]
	mov r0, sp
	ldrh r1, [r2, #8]
	strh r1, [r0, #8]
	mov r2, sp
	ldr r0, _080732A0  @ 0x0000F3FF
	ands r0, r1
	strh r0, [r2, #8]
	movs r3, #0x80
	lsls r3, r3, #4
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2, #8]
	mov r0, sp
	bl AnimDisplay
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x2e
	ldrsh r1, [r4, r2]
	cmp r0, r1
	bne _08073294
	adds r0, r4, #0
	bl Proc_Break
_08073294:
	add sp, #0x48
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807329C: .4byte 0xFFFFF7FF
_080732A0: .4byte 0x0000F3FF

	THUMB_FUNC_END sub_8073240

	THUMB_FUNC_START sub_80732A4
sub_80732A4: @ 0x080732A4
	bx lr

	THUMB_FUNC_END sub_80732A4

	THUMB_FUNC_START sub_80732A8
sub_80732A8: @ 0x080732A8
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	ldr r0, _080732D0  @ gUnknown_08759284
	movs r1, #4
	bl Proc_Start
	adds r1, r0, #0
	str r4, [r1, #0x5c]
	movs r2, #0
	strh r2, [r1, #0x2c]
	strh r5, [r1, #0x2e]
	cmp r6, #0
	bne _080732D4
	strh r2, [r1, #0x32]
	movs r0, #0x10
	strh r0, [r1, #0x34]
	b _080732DA
	.align 2, 0
_080732D0: .4byte gUnknown_08759284
_080732D4:
	movs r0, #0x10
	strh r0, [r1, #0x32]
	strh r2, [r1, #0x34]
_080732DA:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80732A8

	THUMB_FUNC_START sub_80732E0
sub_80732E0: @ 0x080732E0
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	movs r0, #0x32
	ldrsh r1, [r5, r0]
	movs r4, #0x34
	ldrsh r2, [r5, r4]
	movs r0, #0x2c
	ldrsh r3, [r5, r0]
	movs r4, #0x2e
	ldrsh r0, [r5, r4]
	str r0, [sp]
	movs r0, #0
	bl Interpolate
	adds r6, r0, #0
	ldr r0, [r5, #0x5c]
	bl GetAISSubjectId
	cmp r0, #0
	bne _08073338
	ldr r0, _0807332C  @ gUnknown_02000054
	ldr r0, [r0]
	ldr r4, _08073330  @ gUnknown_02022B88
	adds r1, r4, #0
	movs r2, #8
	bl CpuFastSet
	ldr r0, _08073334  @ 0xFFFFFD20
	adds r4, r4, r0
	adds r0, r4, #0
	movs r1, #0x17
	movs r2, #1
	adds r3, r6, #0
	bl sub_80712B0
	b _08073356
	.align 2, 0
_0807332C: .4byte gUnknown_02000054
_08073330: .4byte gUnknown_02022B88
_08073334: .4byte 0xFFFFFD20
_08073338:
	ldr r0, _0807337C  @ gUnknown_02000054
	ldr r0, [r0, #4]
	ldr r4, _08073380  @ gUnknown_02022BC8
	adds r1, r4, #0
	movs r2, #8
	bl CpuFastSet
	ldr r2, _08073384  @ 0xFFFFFCE0
	adds r4, r4, r2
	adds r0, r4, #0
	movs r1, #0x19
	movs r2, #1
	adds r3, r6, #0
	bl sub_80712B0
_08073356:
	bl EnablePaletteSync
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r4, #0x2e
	ldrsh r1, [r5, r4]
	cmp r0, r1
	ble _08073372
	adds r0, r5, #0
	bl Proc_Break
_08073372:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807337C: .4byte gUnknown_02000054
_08073380: .4byte gUnknown_02022BC8
_08073384: .4byte 0xFFFFFCE0

	THUMB_FUNC_END sub_80732E0

	THUMB_FUNC_START sub_8073388
sub_8073388: @ 0x08073388
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	ldr r0, _080733B0  @ gUnknown_0875929C
	movs r1, #4
	bl Proc_Start
	adds r1, r0, #0
	str r4, [r1, #0x5c]
	movs r2, #0
	strh r2, [r1, #0x2c]
	strh r5, [r1, #0x2e]
	cmp r6, #0
	bne _080733B4
	strh r2, [r1, #0x32]
	movs r0, #0x10
	strh r0, [r1, #0x34]
	b _080733BA
	.align 2, 0
_080733B0: .4byte gUnknown_0875929C
_080733B4:
	movs r0, #0x10
	strh r0, [r1, #0x32]
	strh r2, [r1, #0x34]
_080733BA:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8073388

	THUMB_FUNC_START sub_80733C0
sub_80733C0: @ 0x080733C0
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	movs r0, #0x32
	ldrsh r1, [r5, r0]
	movs r4, #0x34
	ldrsh r2, [r5, r4]
	movs r0, #0x2c
	ldrsh r3, [r5, r0]
	movs r4, #0x2e
	ldrsh r0, [r5, r4]
	str r0, [sp]
	movs r0, #0
	bl Interpolate
	adds r6, r0, #0
	ldr r0, [r5, #0x5c]
	bl GetAISSubjectId
	cmp r0, #0
	bne _08073418
	ldr r0, _0807340C  @ gUnknown_02000054
	ldr r0, [r0]
	ldr r4, _08073410  @ gUnknown_02022B88
	adds r1, r4, #0
	movs r2, #8
	bl CpuFastSet
	ldr r0, _08073414  @ 0xFFFFFD20
	adds r4, r4, r0
	adds r0, r4, #0
	movs r1, #0x17
	movs r2, #1
	adds r3, r6, #0
	bl sub_807132C
	b _08073436
	.align 2, 0
_0807340C: .4byte gUnknown_02000054
_08073410: .4byte gUnknown_02022B88
_08073414: .4byte 0xFFFFFD20
_08073418:
	ldr r0, _0807345C  @ gUnknown_02000054
	ldr r0, [r0, #4]
	ldr r4, _08073460  @ gUnknown_02022BC8
	adds r1, r4, #0
	movs r2, #8
	bl CpuFastSet
	ldr r2, _08073464  @ 0xFFFFFCE0
	adds r4, r4, r2
	adds r0, r4, #0
	movs r1, #0x19
	movs r2, #1
	adds r3, r6, #0
	bl sub_807132C
_08073436:
	bl EnablePaletteSync
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r4, #0x2e
	ldrsh r1, [r5, r4]
	cmp r0, r1
	ble _08073452
	adds r0, r5, #0
	bl Proc_Break
_08073452:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807345C: .4byte gUnknown_02000054
_08073460: .4byte gUnknown_02022BC8
_08073464: .4byte 0xFFFFFCE0

	THUMB_FUNC_END sub_80733C0

	THUMB_FUNC_START sub_8073468
sub_8073468: @ 0x08073468
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	mov r8, r1
	adds r5, r2, #0
	adds r6, r3, #0
	ldr r7, [sp, #0x18]
	ldr r1, _080734A4  @ gUnknown_0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _080734A8  @ gUnknown_087592B4
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r5, [r0, #0x2e]
	str r6, [r0, #0x44]
	str r7, [r0, #0x48]
	mov r1, r8
	str r1, [r0, #0x64]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080734A4: .4byte gUnknown_0201774C
_080734A8: .4byte gUnknown_087592B4

	THUMB_FUNC_END sub_8073468

	THUMB_FUNC_START sub_80734AC
sub_80734AC: @ 0x080734AC
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r4, [r5, #0x64]
	ldr r1, [r5, #0x44]
	ldr r2, [r5, #0x48]
	movs r0, #0x2c
	ldrsh r3, [r5, r0]
	movs r6, #0x2e
	ldrsh r0, [r5, r6]
	str r0, [sp]
	movs r0, #4
	bl Interpolate
	str r0, [r4, #0x4c]
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x2e
	ldrsh r1, [r5, r2]
	cmp r0, r1
	ble _080734EA
	ldr r1, _080734F4  @ gUnknown_0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r5, #0
	bl Proc_Break
_080734EA:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080734F4: .4byte gUnknown_0201774C

	THUMB_FUNC_END sub_80734AC

.align 2, 0
