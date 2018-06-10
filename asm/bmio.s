	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	@ General Battle Map System Stuff, mostly low level hardware stuff but also more

	THUMB_FUNC_START sub_803005C
sub_803005C: @ 0x0803005C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x2c]
	cmp r0, #0
	beq _0803009A
	ldrh r1, [r4, #0x34]
	movs r2, #0x34
	ldrsh r0, [r4, r2]
	cmp r0, #0
	beq _08030076
	subs r0, r1, #1
	strh r0, [r4, #0x34]
	b _0803009A
_08030076:
	ldr r2, [r4, #0x30]
	ldrh r0, [r2]
	strh r0, [r4, #0x34]
	ldr r0, [r2, #4]
	ldr r1, _080300A0  @ 0x0600A000
	ldrh r2, [r2, #2]
	lsrs r2, r2, #2
	bl CpuFastSet
	ldr r1, [r4, #0x30]
	adds r0, r1, #0
	adds r0, #8
	str r0, [r4, #0x30]
	ldrh r0, [r1, #8]
	cmp r0, #0
	bne _0803009A
	ldr r0, [r4, #0x2c]
	str r0, [r4, #0x30]
_0803009A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080300A0: .4byte 0x0600A000

	THUMB_FUNC_START sub_80300A4
sub_80300A4: @ 0x080300A4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x38]
	cmp r0, #0
	beq _080300E8
	ldrh r1, [r4, #0x36]
	movs r2, #0x36
	ldrsh r0, [r4, r2]
	cmp r0, #0
	beq _080300BE
	subs r0, r1, #1
	strh r0, [r4, #0x36]
	b _080300E8
_080300BE:
	ldr r3, [r4, #0x3c]
	ldrb r0, [r3, #4]
	strh r0, [r4, #0x36]
	ldr r0, [r3]
	ldrb r1, [r3, #6]
	lsls r1, r1, #1
	ldr r2, _080300F0  @ gUnknown_02022968
	adds r1, r1, r2
	ldrb r2, [r3, #5]
	bl CpuSet
	bl EnablePaletteSync
	ldr r0, [r4, #0x3c]
	adds r0, #8
	str r0, [r4, #0x3c]
	ldrb r0, [r0, #4]
	cmp r0, #0
	bne _080300E8
	ldr r0, [r4, #0x38]
	str r0, [r4, #0x3c]
_080300E8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080300F0: .4byte gUnknown_02022968

	THUMB_FUNC_START SetupGameVBlank6C_TileAnimations
SetupGameVBlank6C_TileAnimations: @ 0x080300F4
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	movs r0, #0
	strh r0, [r4, #0x34]
	strh r0, [r4, #0x36]
	ldr r5, _08030130  @ gUnknown_0202BCF0
	movs r0, #0xe
	ldrsb r0, [r5, r0]
	bl GetROMChapterStruct
	ldr r6, _08030134  @ gChapterDataAssetTable
	ldrb r0, [r0, #9]
	lsls r0, r0, #2
	adds r0, r0, r6
	ldr r0, [r0]
	str r0, [r4, #0x30]
	str r0, [r4, #0x2c]
	movs r0, #0xe
	ldrsb r0, [r5, r0]
	bl GetROMChapterStruct
	ldrb r0, [r0, #0xa]
	lsls r0, r0, #2
	adds r0, r0, r6
	ldr r0, [r0]
	str r0, [r4, #0x3c]
	str r0, [r4, #0x38]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08030130: .4byte gUnknown_0202BCF0
_08030134: .4byte gChapterDataAssetTable

	THUMB_FUNC_START GameVBlank6C_Destructor
GameVBlank6C_Destructor: @ 0x08030138
	push {lr}
	movs r0, #0
	bl SetSecondaryHBlankHandler
	pop {r0}
	bx r0

	THUMB_FUNC_START GameVBlank6C_Loop
GameVBlank6C_Loop: @ 0x08030144
	push {lr}
	movs r1, #0
	bl Proc_GotoLabel
	pop {r0}
	bx r0

	THUMB_FUNC_START SetupGameVBlank6C
SetupGameVBlank6C: @ 0x08030150
	push {lr}
	ldr r0, _0803016C  @ gUnknown_0859D8B8
	movs r1, #0
	bl Proc_Create
	bl SetupGameVBlank6C_TileAnimations
	bl SetupWeatherGraphics_Maybe
	ldr r1, _08030170  @ gUnknown_0202BCB0
	movs r0, #0
	strb r0, [r1, #2]
	pop {r0}
	bx r0
	.align 2, 0
_0803016C: .4byte gUnknown_0859D8B8
_08030170: .4byte gUnknown_0202BCB0

	THUMB_FUNC_START sub_8030174
sub_8030174: @ 0x08030174
	push {lr}
	ldr r0, _08030180  @ gUnknown_0859D8B8
	bl Proc_DeleteAllWithScript
	pop {r0}
	bx r0
	.align 2, 0
_08030180: .4byte gUnknown_0859D8B8

	THUMB_FUNC_START BlockGameGraphicsLogic
BlockGameGraphicsLogic: @ 0x08030184
	push {lr}
	ldr r1, _080301B0  @ gUnknown_0202BCB0
	ldrb r0, [r1, #2]
	adds r0, #1
	strb r0, [r1, #2]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bgt _080301AC
	movs r0, #0
	bl SetSecondaryHBlankHandler
	ldr r1, _080301B4  @ gPaletteBuffer
	movs r0, #0
	strh r0, [r1]
	bl EnablePaletteSync
	movs r0, #1
	bl Proc_BlockEachWithMark
_080301AC:
	pop {r0}
	bx r0
	.align 2, 0
_080301B0: .4byte gUnknown_0202BCB0
_080301B4: .4byte gPaletteBuffer

	THUMB_FUNC_START UnblockGameGraphicsLogic
UnblockGameGraphicsLogic: @ 0x080301B8
	push {lr}
	ldr r1, _080301EC  @ gUnknown_0202BCB0
	ldrb r2, [r1, #2]
	movs r0, #2
	ldrsb r0, [r1, r0]
	cmp r0, #0
	beq _080301E8
	subs r0, r2, #1
	strb r0, [r1, #2]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080301E8
	movs r0, #1
	bl Proc_UnblockEachWithMark
	ldr r0, _080301F0  @ gUnknown_0859D8B8
	bl Proc_Find
	cmp r0, #0
	beq _080301E8
	bl Proc_Delete
	bl SetupGameVBlank6C
_080301E8:
	pop {r0}
	bx r0
	.align 2, 0
_080301EC: .4byte gUnknown_0202BCB0
_080301F0: .4byte gUnknown_0859D8B8

	THUMB_FUNC_START SetupOAMSpliceForWeather
SetupOAMSpliceForWeather: @ 0x080301F4
	push {lr}
	subs r0, #1
	cmp r0, #5
	bhi _08030234
	lsls r0, r0, #2
	ldr r1, _08030208  @ _0803020C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08030208: .4byte _0803020C
_0803020C: @ jump table
	.4byte _08030224 @ case 0
	.4byte _08030224 @ case 1
	.4byte _08030234 @ case 2
	.4byte _08030224 @ case 3
	.4byte _0803022C @ case 4
	.4byte _08030224 @ case 5
_08030224:
	movs r0, #0x20
	bl SetupOAMBufferSplice
	b _0803023A
_0803022C:
	movs r0, #0x10
	bl SetupOAMBufferSplice
	b _0803023A
_08030234:
	movs r0, #0
	bl SetupOAMBufferSplice
_0803023A:
	pop {r0}
	bx r0

	THUMB_FUNC_START sub_8030240
sub_8030240: @ 0x08030240
	push {lr}
	ldr r0, _08030254  @ gUnknown_0202BCF0
	ldrb r0, [r0, #0x15]
	bl SetupOAMSpliceForWeather
	movs r0, #0
	bl SetSecondaryHBlankHandler
	pop {r0}
	bx r0
	.align 2, 0
_08030254: .4byte gUnknown_0202BCF0

	THUMB_FUNC_START sub_8030258
sub_8030258: @ 0x08030258
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	mov r1, sp
	ldr r0, _080302C0  @ gUnknown_080D7F4C
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldr r0, _080302C4  @ gUnknown_0202BCF0
	ldrb r0, [r0, #0x15]
	bl SetupOAMSpliceForWeather
	movs r6, #0
	ldr r7, _080302C8  @ gUnknown_080D7EEC
	ldr r5, _080302CC  @ gUnknown_020027DC
_08030272:
	movs r0, #0xf
	ands r0, r6
	lsls r4, r0, #1
	adds r4, r4, r0
	bl AdvanceGetLCGRNValue
	strh r0, [r5]
	bl AdvanceGetLCGRNValue
	strh r0, [r5, #2]
	lsls r0, r4, #1
	adds r0, r0, r7
	ldrh r0, [r0]
	lsls r0, r0, #1
	strh r0, [r5, #4]
	adds r0, r4, #1
	lsls r0, r0, #1
	adds r0, r0, r7
	ldrh r0, [r0]
	lsls r0, r0, #1
	strh r0, [r5, #6]
	adds r4, #2
	lsls r4, r4, #1
	adds r4, r4, r7
	ldrh r0, [r4]
	strb r0, [r5, #9]
	ldrh r0, [r4]
	lsls r0, r0, #2
	add r0, sp
	ldr r0, [r0]
	strb r0, [r5, #8]
	adds r5, #0xc
	adds r6, #1
	cmp r6, #0x3f
	ble _08030272
	add sp, #0xc
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080302C0: .4byte gUnknown_080D7F4C
_080302C4: .4byte gUnknown_0202BCF0
_080302C8: .4byte gUnknown_080D7EEC
_080302CC: .4byte gUnknown_020027DC

	THUMB_FUNC_START sub_80302D0
sub_80302D0: @ 0x080302D0
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	bl GetPrimaryOAMSize
	cmp r0, #0
	beq _0803037A
	bl GetGameClock
	movs r1, #1
	ands r0, r1
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #7
	ldr r0, _08030384  @ gUnknown_020027DC
	adds r4, r1, r0
	mov r2, sp
	ldr r3, _08030388  @ gUnknown_0202BCB0
	movs r0, #0xc
	ldrsh r1, [r3, r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	cmp r0, #0
	bge _08030302
	adds r0, #0xf
_08030302:
	asrs r0, r0, #4
	strh r0, [r2]
	mov r0, sp
	ldrh r2, [r3, #0xe]
	strh r2, [r0, #2]
	mov r1, sp
	ldrh r0, [r3, #0xc]
	strh r0, [r1, #4]
	mov r0, sp
	strh r2, [r0, #6]
	mov r5, sp
	movs r7, #0xc
	ldrsh r1, [r3, r7]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	cmp r0, #0
	bge _08030328
	adds r0, #0xf
_08030328:
	asrs r0, r0, #4
	strh r0, [r5, #8]
	mov r0, sp
	strh r2, [r0, #0xa]
	movs r6, #0xff
	movs r5, #0x1f
_08030334:
	ldrh r0, [r4, #4]
	ldrh r1, [r4]
	adds r0, r0, r1
	strh r0, [r4]
	ldrh r1, [r4, #6]
	ldrh r2, [r4, #2]
	adds r1, r1, r2
	strh r1, [r4, #2]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	ldrb r2, [r4, #9]
	lsls r2, r2, #2
	mov r7, sp
	adds r3, r7, r2
	movs r7, #0
	ldrsh r2, [r3, r7]
	subs r0, r0, r2
	ands r0, r6
	lsls r1, r1, #0x10
	asrs r1, r1, #0x18
	movs r7, #2
	ldrsh r2, [r3, r7]
	subs r1, r1, r2
	ands r1, r6
	ldrb r3, [r4, #8]
	movs r2, #0x80
	lsls r2, r2, #5
	adds r3, r3, r2
	ldr r2, _0803038C  @ gUnknown_08590F44
	bl CallARM_PushToPrimaryOAM
	adds r4, #0xc
	subs r5, #1
	cmp r5, #0
	bge _08030334
_0803037A:
	add sp, #0xc
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08030384: .4byte gUnknown_020027DC
_08030388: .4byte gUnknown_0202BCB0
_0803038C: .4byte gUnknown_08590F44

	THUMB_FUNC_START sub_8030390
sub_8030390: @ 0x08030390
	push {r4, r5, r6, r7, lr}
	ldr r0, _080303E8  @ gUnknown_0202BCF0
	ldrb r0, [r0, #0x15]
	bl SetupOAMSpliceForWeather
	movs r6, #0
	ldr r7, _080303EC  @ gUnknown_080D7EEC
	ldr r5, _080303F0  @ gUnknown_020027DC
_080303A0:
	movs r0, #0xf
	ands r0, r6
	lsls r4, r0, #1
	adds r4, r4, r0
	bl AdvanceGetLCGRNValue
	strh r0, [r5]
	bl AdvanceGetLCGRNValue
	strh r0, [r5, #2]
	lsls r0, r4, #1
	adds r0, r0, r7
	ldrh r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	strh r0, [r5, #4]
	adds r0, r4, #1
	lsls r0, r0, #1
	adds r0, r0, r7
	ldrh r0, [r0]
	lsls r0, r0, #4
	strh r0, [r5, #6]
	adds r4, #2
	lsls r4, r4, #1
	adds r4, r4, r7
	ldrh r0, [r4]
	strb r0, [r5, #8]
	adds r5, #0xc
	adds r6, #1
	cmp r6, #0x3f
	ble _080303A0
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080303E8: .4byte gUnknown_0202BCF0
_080303EC: .4byte gUnknown_080D7EEC
_080303F0: .4byte gUnknown_020027DC

	THUMB_FUNC_START sub_80303F4
sub_80303F4: @ 0x080303F4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	bl GetPrimaryOAMSize
	cmp r0, #0
	beq _0803045C
	bl GetGameClock
	movs r1, #1
	ands r0, r1
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #7
	ldr r0, _08030468  @ gUnknown_020027DC
	adds r4, r1, r0
	ldr r7, _0803046C  @ gUnknown_0202BCB0
	movs r6, #0xff
	movs r5, #0x1f
	ldr r0, _08030470  @ gUnknown_0859D968
	mov r8, r0
_0803041E:
	ldrh r0, [r4, #4]
	ldrh r1, [r4]
	adds r0, r0, r1
	strh r0, [r4]
	ldrh r1, [r4, #6]
	ldrh r2, [r4, #2]
	adds r1, r1, r2
	strh r1, [r4, #2]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	movs r3, #0xc
	ldrsh r2, [r7, r3]
	subs r0, r0, r2
	ands r0, r6
	lsls r1, r1, #0x10
	asrs r1, r1, #0x18
	movs r3, #0xe
	ldrsh r2, [r7, r3]
	subs r1, r1, r2
	ands r1, r6
	ldrb r2, [r4, #8]
	lsls r2, r2, #2
	add r2, r8
	ldr r2, [r2]
	movs r3, #0
	bl CallARM_PushToPrimaryOAM
	adds r4, #0xc
	subs r5, #1
	cmp r5, #0
	bge _0803041E
_0803045C:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08030468: .4byte gUnknown_020027DC
_0803046C: .4byte gUnknown_0202BCB0
_08030470: .4byte gUnknown_0859D968

	THUMB_FUNC_START sub_8030474
sub_8030474: @ 0x08030474
	push {r4, r5, r6, lr}
	ldr r0, _080304D0  @ gUnknown_0202BCF0
	ldrb r0, [r0, #0x15]
	bl SetupOAMSpliceForWeather
	ldr r0, _080304D4  @ gUnknown_085A3964
	ldr r4, _080304D8  @ gUnknown_02020188
	adds r1, r4, #0
	bl CopyDataWithPossibleUncomp
	ldr r1, _080304DC  @ 0x06010380
	adds r0, r4, #0
	movs r2, #4
	movs r3, #4
	bl CopyTileGfxForObj
	movs r6, #0
	ldr r4, _080304E0  @ gUnknown_020027DC
	movs r5, #0x3f
_0803049A:
	bl AdvanceGetLCGRNValue
	strh r0, [r4]
	bl AdvanceGetLCGRNValue
	movs r1, #0xa0
	bl __umodsi3
	adds r0, #0xf0
	movs r1, #0xff
	ands r0, r1
	strh r0, [r4, #2]
	bl AdvanceGetLCGRNValue
	movs r1, #7
	ands r0, r1
	subs r0, #0x20
	strh r0, [r4, #4]
	strh r6, [r4, #6]
	adds r4, #0xc
	subs r5, #1
	cmp r5, #0
	bge _0803049A
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080304D0: .4byte gUnknown_0202BCF0
_080304D4: .4byte gUnknown_085A3964
_080304D8: .4byte gUnknown_02020188
_080304DC: .4byte 0x06010380
_080304E0: .4byte gUnknown_020027DC

	THUMB_FUNC_START sub_80304E4
sub_80304E4: @ 0x080304E4
	push {r4, r5, lr}
	bl GetPrimaryOAMSize
	cmp r0, #0
	beq _08030528
	bl GetGameClock
	movs r1, #1
	ands r0, r1
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #7
	ldr r0, _08030530  @ gUnknown_020027DC
	adds r4, r1, r0
	movs r5, #0x1f
_08030502:
	ldrh r0, [r4, #4]
	ldrh r1, [r4]
	adds r0, r0, r1
	strh r0, [r4]
	movs r1, #0xff
	ands r0, r1
	subs r0, #0x10
	ldr r1, _08030534  @ 0x000001FF
	ands r0, r1
	movs r2, #2
	ldrsh r1, [r4, r2]
	ldr r2, _08030538  @ gUnknown_08590F54
	ldr r3, _0803053C  @ 0x0000101C
	bl CallARM_PushToPrimaryOAM
	adds r4, #0xc
	subs r5, #1
	cmp r5, #0
	bge _08030502
_08030528:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08030530: .4byte gUnknown_020027DC
_08030534: .4byte 0x000001FF
_08030538: .4byte gUnknown_08590F54
_0803053C: .4byte 0x0000101C

	THUMB_FUNC_START sub_8030540
sub_8030540: @ 0x08030540
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	mov r4, sp
	mov r0, sp
	movs r1, #0
	movs r2, #8
	bl memset
	movs r0, #1
	strb r0, [r4, #6]
	strb r0, [r4, #7]
	ldr r0, _080305AC  @ gUnknown_0202BCF0
	ldrb r0, [r0, #0x15]
	bl SetupOAMSpliceForWeather
	ldr r0, _080305B0  @ gUnknown_085A39EC
	ldr r4, _080305B4  @ gUnknown_02020188
	adds r1, r4, #0
	bl CopyDataWithPossibleUncomp
	ldr r1, _080305B8  @ 0x06010300
	adds r0, r4, #0
	movs r2, #8
	movs r3, #4
	bl CopyTileGfxForObj
	movs r6, #0
	ldr r5, _080305BC  @ gUnknown_020027DC
	ldr r0, _080305C0  @ 0x000001FF
	adds r7, r0, #0
_0803057C:
	movs r0, #7
	ands r0, r6
	add r0, sp
	ldrb r4, [r0]
	bl AdvanceGetLCGRNValue
	strh r0, [r5]
	bl AdvanceGetLCGRNValue
	strh r0, [r5, #2]
	bl AdvanceGetLCGRNValue
	ldr r2, _080305C4  @ 0x000003FF
	adds r1, r2, #0
	ands r0, r1
	ldr r1, _080305C8  @ 0xFFFFFF00
	adds r0, r0, r1
	strh r0, [r5, #6]
	strb r4, [r5, #8]
	cmp r4, #0
	beq _080305CC
	cmp r4, #1
	beq _080305DA
	b _080305EA
	.align 2, 0
_080305AC: .4byte gUnknown_0202BCF0
_080305B0: .4byte gUnknown_085A39EC
_080305B4: .4byte gUnknown_02020188
_080305B8: .4byte 0x06010300
_080305BC: .4byte gUnknown_020027DC
_080305C0: .4byte 0x000001FF
_080305C4: .4byte 0x000003FF
_080305C8: .4byte 0xFFFFFF00
_080305CC:
	bl AdvanceGetLCGRNValue
	ands r0, r7
	movs r2, #0xe0
	lsls r2, r2, #3
	adds r0, r0, r2
	b _080305E8
_080305DA:
	bl AdvanceGetLCGRNValue
	ands r0, r7
	movs r2, #0xa0
	lsls r2, r2, #4
	adds r1, r2, #0
	adds r0, r0, r1
_080305E8:
	strh r0, [r5, #4]
_080305EA:
	adds r5, #0xc
	adds r6, #1
	cmp r6, #0x3f
	ble _0803057C
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_START sub_80305FC
sub_80305FC: @ 0x080305FC
	push {r4, r5, r6, r7, lr}
	bl GetPrimaryOAMSize
	cmp r0, #0
	beq _0803065C
	bl GetGameClock
	movs r1, #1
	ands r0, r1
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #7
	ldr r0, _08030664  @ gUnknown_020027DC
	adds r4, r1, r0
	ldr r7, _08030668  @ gUnknown_0202BCB0
	movs r6, #0xff
	movs r5, #0x1f
_0803061E:
	ldrh r0, [r4, #4]
	ldrh r1, [r4]
	adds r0, r0, r1
	strh r0, [r4]
	ldrh r1, [r4, #6]
	ldrh r2, [r4, #2]
	adds r1, r1, r2
	strh r1, [r4, #2]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	movs r3, #0xc
	ldrsh r2, [r7, r3]
	subs r0, r0, r2
	ands r0, r6
	lsls r1, r1, #0x10
	asrs r1, r1, #0x18
	movs r3, #0xe
	ldrsh r2, [r7, r3]
	subs r1, r1, r2
	ands r1, r6
	ldrb r3, [r4, #8]
	lsls r3, r3, #2
	ldr r2, _0803066C  @ 0x00001018
	adds r3, r3, r2
	ldr r2, _08030670  @ gUnknown_08590F54
	bl CallARM_PushToPrimaryOAM
	adds r4, #0xc
	subs r5, #1
	cmp r5, #0
	bge _0803061E
_0803065C:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08030664: .4byte gUnknown_020027DC
_08030668: .4byte gUnknown_0202BCB0
_0803066C: .4byte 0x00001018
_08030670: .4byte gUnknown_08590F54

	THUMB_FUNC_START sub_8030674
sub_8030674: @ 0x08030674
	push {lr}
	ldr r0, _080306A8  @ 0x04000006
	ldrh r0, [r0]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #0xa0
	bls _08030686
	movs r3, #0
_08030686:
	ldr r0, _080306AC  @ gUnknown_0202BCB0
	movs r1, #0xe
	ldrsh r0, [r0, r1]
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	adds r0, r3, r0
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	ldr r0, _080306B0  @ 0x0000013F
	cmp r3, r0
	bls _080306B4
	movs r1, #0xa0
	lsls r1, r1, #0x13
	movs r0, #0
	strh r0, [r1]
	b _080306C2
	.align 2, 0
_080306A8: .4byte 0x04000006
_080306AC: .4byte gUnknown_0202BCB0
_080306B0: .4byte 0x0000013F
_080306B4:
	movs r2, #0xa0
	lsls r2, r2, #0x13
	lsls r0, r3, #1
	ldr r1, _080306C8  @ gUnknown_02002ADC
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r2]
_080306C2:
	pop {r0}
	bx r0
	.align 2, 0
_080306C8: .4byte gUnknown_02002ADC

	THUMB_FUNC_START sub_80306CC
sub_80306CC: @ 0x080306CC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r5, _08030704  @ gUnknown_02002ADC
	movs r4, #0
	ldr r0, _08030708  @ sub_8030674
	mov r8, r0
	movs r7, #0x1f
	ldr r6, _0803070C  @ 0x0000013F
_080306DE:
	adds r0, r4, #0
	movs r1, #0xa
	bl __divsi3
	subs r0, r7, r0
	lsls r0, r0, #0xa
	strh r0, [r5]
	adds r5, #2
	adds r4, #1
	cmp r4, r6
	ble _080306DE
	mov r0, r8
	bl SetSecondaryHBlankHandler
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08030704: .4byte gUnknown_02002ADC
_08030708: .4byte sub_8030674
_0803070C: .4byte 0x0000013F

	THUMB_FUNC_START nullsub_12
nullsub_12: @ 0x08030710
	bx lr

	THUMB_FUNC_START sub_8030714
sub_8030714: @ 0x08030714
	push {lr}
	ldr r0, _0803074C  @ 0x04000006
	ldrh r0, [r0]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x5f
	bls _08030746
	cmp r0, #0x9f
	bhi _08030746
	adds r2, r0, #0
	subs r2, #0x60
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	ldr r0, _08030750  @ gUnknown_02002ADC
	lsls r1, r2, #4
	adds r0, r1, r0
	movs r1, #7
	ands r1, r2
	lsls r1, r1, #4
	ldr r2, _08030754  @ 0x050000E0
	adds r1, r1, r2
	movs r2, #2
	bl CpuFastSet
_08030746:
	pop {r0}
	bx r0
	.align 2, 0
_0803074C: .4byte 0x04000006
_08030750: .4byte gUnknown_02002ADC
_08030754: .4byte 0x050000E0

	THUMB_FUNC_START sub_8030758
sub_8030758: @ 0x08030758
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	movs r1, #0
	ldr r0, _080307D0  @ gPaletteBuffer
	mov sl, r0
	movs r6, #0x1f
	ldr r3, _080307D4  @ gUnknown_02002ADC
	mov r9, r3
_0803076E:
	movs r2, #0
	adds r0, r1, #7
	adds r3, r1, #1
	mov r8, r3
	lsls r0, r0, #4
	mov ip, r0
	lsls r7, r1, #4
_0803077C:
	mov r1, ip
	adds r0, r1, r2
	lsls r0, r0, #1
	add r0, sl
	ldrh r0, [r0]
	adds r3, r0, #0
	ands r3, r6
	asrs r1, r0, #5
	ands r1, r6
	asrs r0, r0, #0xa
	ands r0, r6
	adds r5, r2, #1
	adds r2, r7, r2
	lsls r2, r2, #1
	lsls r0, r0, #0xa
	lsls r1, r1, #5
	adds r4, r0, r1
	add r2, r9
	movs r1, #7
_080307A2:
	adds r3, #2
	cmp r3, #0x1f
	ble _080307AA
	movs r3, #0x1f
_080307AA:
	adds r0, r4, r3
	strh r0, [r2]
	adds r2, #0x80
	subs r1, #1
	cmp r1, #0
	bge _080307A2
	adds r2, r5, #0
	cmp r2, #0xf
	ble _0803077C
	mov r1, r8
	cmp r1, #3
	ble _0803076E
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080307D0: .4byte gPaletteBuffer
_080307D4: .4byte gUnknown_02002ADC

	THUMB_FUNC_START sub_80307D8
sub_80307D8: @ 0x080307D8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	bl sub_8019974
	movs r1, #0
	ldr r0, _0803085C  @ gPaletteBuffer
	mov sl, r0
	movs r6, #0x1f
	ldr r3, _08030860  @ gUnknown_02002ADC
	mov r9, r3
_080307F2:
	movs r2, #0
	adds r0, r1, #7
	adds r3, r1, #1
	mov r8, r3
	lsls r0, r0, #4
	mov ip, r0
	lsls r7, r1, #4
_08030800:
	mov r1, ip
	adds r0, r1, r2
	lsls r0, r0, #1
	add r0, sl
	ldrh r0, [r0]
	adds r3, r0, #0
	ands r3, r6
	asrs r1, r0, #5
	ands r1, r6
	asrs r0, r0, #0xa
	ands r0, r6
	adds r5, r2, #1
	adds r2, r7, r2
	lsls r2, r2, #1
	lsls r0, r0, #0xa
	lsls r1, r1, #5
	adds r4, r0, r1
	add r2, r9
	movs r1, #7
_08030826:
	adds r3, #2
	cmp r3, #0x1f
	ble _0803082E
	movs r3, #0x1f
_0803082E:
	adds r0, r4, r3
	strh r0, [r2]
	adds r2, #0x80
	subs r1, #1
	cmp r1, #0
	bge _08030826
	adds r2, r5, #0
	cmp r2, #0xf
	ble _08030800
	mov r1, r8
	cmp r1, #3
	ble _080307F2
	ldr r0, _08030864  @ sub_8030714
	bl SetSecondaryHBlankHandler
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803085C: .4byte gPaletteBuffer
_08030860: .4byte gUnknown_02002ADC
_08030864: .4byte sub_8030714

	THUMB_FUNC_START sub_8030868
sub_8030868: @ 0x08030868
	push {r4, r5, r6, lr}
	ldr r0, _080308B4  @ gUnknown_0202BCF0
	ldrb r0, [r0, #0x15]
	bl SetupOAMSpliceForWeather
	ldr r0, _080308B8  @ gUnknown_085A3A84
	ldr r1, _080308BC  @ 0x06010300
	bl CopyDataWithPossibleUncomp
	ldr r0, _080308C0  @ gUnknown_085A3AC0
	movs r1, #0xd0
	lsls r1, r1, #2
	movs r2, #0x20
	bl CopyToPaletteBuffer
	ldr r5, _080308C4  @ gUnknown_080D7EEC
	ldr r4, _080308C8  @ gUnknown_020027DC
	movs r6, #0xf
_0803088C:
	bl AdvanceGetLCGRNValue
	strh r0, [r4]
	bl AdvanceGetLCGRNValue
	strh r0, [r4, #2]
	ldrh r0, [r5]
	negs r0, r0
	strh r0, [r4, #4]
	ldrh r0, [r5, #2]
	negs r0, r0
	strh r0, [r4, #6]
	adds r5, #6
	adds r4, #0xc
	subs r6, #1
	cmp r6, #0
	bge _0803088C
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080308B4: .4byte gUnknown_0202BCF0
_080308B8: .4byte gUnknown_085A3A84
_080308BC: .4byte 0x06010300
_080308C0: .4byte gUnknown_085A3AC0
_080308C4: .4byte gUnknown_080D7EEC
_080308C8: .4byte gUnknown_020027DC

	THUMB_FUNC_START sub_80308CC
sub_80308CC: @ 0x080308CC
	push {lr}
	bl sub_80307D8
	bl sub_8030868
	pop {r0}
	bx r0

	THUMB_FUNC_START sub_80308DC
sub_80308DC: @ 0x080308DC
	push {r4, r5, r6, r7, lr}
	ldr r4, _0803093C  @ gUnknown_02022988
	ldr r1, _08030940  @ 0x050000E0
	adds r0, r4, #0
	movs r2, #0x20
	bl CpuFastSet
	movs r5, #0xc
	subs r4, #0xe0
	mov ip, r4
	movs r6, #0x1f
	ldr r7, _08030944  @ gUnknown_02002ADC
_080308F4:
	adds r0, r5, #0
	adds r0, #0x90
	lsls r0, r0, #1
	add r0, ip
	ldrh r0, [r0]
	adds r3, r0, #0
	ands r3, r6
	asrs r1, r0, #5
	ands r1, r6
	asrs r0, r0, #0xa
	ands r0, r6
	adds r2, r5, #0
	adds r2, #0x20
	adds r4, r5, #1
	lsls r0, r0, #0xa
	lsls r1, r1, #5
	adds r5, r0, r1
	lsls r2, r2, #1
	adds r2, r2, r7
	movs r1, #7
_0803091C:
	adds r3, #2
	cmp r3, #0x1f
	ble _08030924
	movs r3, #0x1f
_08030924:
	adds r0, r5, r3
	strh r0, [r2]
	adds r2, #0x80
	subs r1, #1
	cmp r1, #0
	bge _0803091C
	adds r5, r4, #0
	cmp r5, #0xf
	ble _080308F4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803093C: .4byte gUnknown_02022988
_08030940: .4byte 0x050000E0
_08030944: .4byte gUnknown_02002ADC

	THUMB_FUNC_START sub_8030948
sub_8030948: @ 0x08030948
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	ldr r4, _080309D4  @ gUnknown_020027DC
	bl GetPrimaryOAMSize
	cmp r0, #0
	beq _080309C8
	ldr r0, _080309D8  @ gUnknown_0202BCB0
	mov r8, r0
	movs r1, #0xff
	mov r9, r1
	movs r6, #0xf
_08030964:
	ldrh r0, [r4, #4]
	ldrh r2, [r4]
	adds r5, r0, r2
	strh r5, [r4]
	ldrh r0, [r4, #6]
	ldrh r3, [r4, #2]
	adds r0, r0, r3
	strh r0, [r4, #2]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	mov r7, r8
	movs r2, #0xe
	ldrsh r1, [r7, r2]
	subs r2, r0, r1
	mov r3, r9
	ands r2, r3
	cmp r2, #0x3f
	ble _080309C0
	cmp r2, #0xa0
	bgt _080309C0
	adds r1, r2, #0
	subs r1, #0x40
	cmp r1, #0
	bge _08030996
	adds r1, #7
_08030996:
	asrs r1, r1, #3
	movs r0, #0x1f
	subs r3, r0, r1
	cmp r3, #0x17
	bgt _080309A2
	movs r3, #0x18
_080309A2:
	lsls r0, r5, #0x10
	asrs r0, r0, #0x18
	mov r5, r8
	movs r7, #0xc
	ldrsh r1, [r5, r7]
	subs r0, r0, r1
	mov r1, r9
	ands r0, r1
	movs r5, #0xa0
	lsls r5, r5, #8
	adds r3, r3, r5
	adds r1, r2, #0
	ldr r2, _080309DC  @ gUnknown_08590F44
	bl CallARM_PushToPrimaryOAM
_080309C0:
	subs r6, #1
	adds r4, #0xc
	cmp r6, #0
	bge _08030964
_080309C8:
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080309D4: .4byte gUnknown_020027DC
_080309D8: .4byte gUnknown_0202BCB0
_080309DC: .4byte gUnknown_08590F44

	THUMB_FUNC_START sub_80309E0
sub_80309E0: @ 0x080309E0
	push {lr}
	bl sub_80308DC
	bl sub_8030948
	pop {r0}
	bx r0

	THUMB_FUNC_START sub_80309F0
sub_80309F0: @ 0x080309F0
	push {r4, r5, r6, lr}
	sub sp, #0x20
	adds r5, r0, #0
	movs r0, #0xd0
	lsls r0, r0, #1
	adds r2, r5, r0
	mov r1, sp
	movs r3, #7
_08030A00:
	ldm r2!, {r0}
	stm r1!, {r0}
	subs r3, #1
	cmp r3, #0
	bge _08030A00
	movs r0, #0xd
	adds r6, r5, #0
	subs r6, #0x20
_08030A10:
	subs r4, r0, #1
	lsls r0, r0, #5
	adds r2, r0, r6
	movs r3, #7
_08030A18:
	ldr r1, [r2, #0x20]
	lsls r1, r1, #4
	ldr r0, [r2]
	lsrs r0, r0, #0x1c
	orrs r1, r0
	str r1, [r2, #0x20]
	adds r2, #4
	subs r3, #1
	cmp r3, #0
	bge _08030A18
	adds r0, r4, #0
	cmp r0, #0
	bge _08030A10
	movs r6, #0x10
	negs r6, r6
	adds r2, r5, #0
	mov r4, sp
	movs r3, #7
_08030A3C:
	ldr r1, [r2]
	ands r1, r6
	str r1, [r2]
	ldm r4!, {r0}
	lsrs r0, r0, #0x1c
	orrs r1, r0
	stm r2!, {r1}
	subs r3, #1
	cmp r3, #0
	bge _08030A3C
	add sp, #0x20
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_START sub_8030A58
sub_8030A58: @ 0x08030A58
	push {lr}
	movs r0, #0
	bl SetupOAMSpliceForWeather
	ldr r0, _08030A78  @ gUnknown_085A3B00
	ldr r1, _08030A7C  @ gUnknown_020027DC
	bl CopyDataWithPossibleUncomp
	ldr r0, _08030A80  @ gUnknown_085A401C
	movs r1, #0xd0
	lsls r1, r1, #2
	movs r2, #0x20
	bl CopyToPaletteBuffer
	pop {r0}
	bx r0
	.align 2, 0
_08030A78: .4byte gUnknown_085A3B00
_08030A7C: .4byte gUnknown_020027DC
_08030A80: .4byte gUnknown_085A401C

	THUMB_FUNC_START sub_8030A84
sub_8030A84: @ 0x08030A84
	push {r4, lr}
	ldr r4, _08030AA0  @ gUnknown_020027DC
	bl GetGameClock
	adds r1, r0, #0
	movs r0, #7
	ands r1, r0
	cmp r1, #7
	bhi _08030AF4
	lsls r0, r1, #2
	ldr r1, _08030AA4  @ _08030AA8
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08030AA0: .4byte gUnknown_020027DC
_08030AA4: .4byte _08030AA8
_08030AA8: @ jump table
	.4byte _08030AC8 @ case 0
	.4byte _08030AF4 @ case 1
	.4byte _08030AD0 @ case 2
	.4byte _08030AF4 @ case 3
	.4byte _08030AD6 @ case 4
	.4byte _08030AF4 @ case 5
	.4byte _08030ADC @ case 6
	.4byte _08030AE8 @ case 7
_08030AC8:
	adds r0, r4, #0
	bl sub_80309F0
	b _08030AF4
_08030AD0:
	movs r1, #0xe0
	lsls r1, r1, #1
	b _08030AE0
_08030AD6:
	movs r1, #0xe0
	lsls r1, r1, #2
	b _08030AE0
_08030ADC:
	movs r1, #0xa8
	lsls r1, r1, #3
_08030AE0:
	adds r0, r4, r1
	bl sub_80309F0
	b _08030AF4
_08030AE8:
	ldr r1, _08030AFC  @ 0x06010240
	adds r0, r4, #0
	movs r2, #0xe
	movs r3, #4
	bl CopyTileGfxForObj
_08030AF4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08030AFC: .4byte 0x06010240

	THUMB_FUNC_START sub_8030B00
sub_8030B00: @ 0x08030B00
	push {lr}
	sub sp, #4
	ldr r0, _08030B28  @ gUnknown_0202BCB0
	movs r1, #0xe
	ldrsh r0, [r0, r1]
	movs r1, #5
	bl __divsi3
	adds r2, r0, #0
	negs r2, r2
	ldr r3, _08030B2C  @ gUnknown_0859D974
	ldr r0, _08030B30  @ 0x0000AC12
	str r0, [sp]
	movs r0, #0xe
	movs r1, #0
	bl RegisterObjectAttributes_SafeMaybe
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_08030B28: .4byte gUnknown_0202BCB0
_08030B2C: .4byte gUnknown_0859D974
_08030B30: .4byte 0x0000AC12

	THUMB_FUNC_START SetupWeatherGraphics_Maybe
SetupWeatherGraphics_Maybe: @ 0x08030B34
	push {lr}
	ldr r0, _08030B48  @ gUnknown_0202BCF0
	ldrb r0, [r0, #0x15]
	cmp r0, #7
	bhi _08030B9E
	lsls r0, r0, #2
	ldr r1, _08030B4C  @ _08030B50
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08030B48: .4byte gUnknown_0202BCF0
_08030B4C: .4byte _08030B50
_08030B50: @ jump table
	.4byte _08030B70 @ case 0
	.4byte _08030B76 @ case 1
	.4byte _08030B82 @ case 2
	.4byte _08030B8E @ case 3
	.4byte _08030B88 @ case 4
	.4byte _08030B94 @ case 5
	.4byte _08030B7C @ case 6
	.4byte _08030B9A @ case 7
_08030B70:
	bl sub_8030240
	b _08030B9E
_08030B76:
	bl sub_8030258
	b _08030B9E
_08030B7C:
	bl sub_8030474
	b _08030B9E
_08030B82:
	bl sub_8030540
	b _08030B9E
_08030B88:
	bl sub_8030390
	b _08030B9E
_08030B8E:
	bl sub_80306CC
	b _08030B9E
_08030B94:
	bl sub_80308CC
	b _08030B9E
_08030B9A:
	bl sub_8030A58
_08030B9E:
	pop {r0}
	bx r0

	THUMB_FUNC_START UpdateWeatherGraphics
UpdateWeatherGraphics: @ 0x08030BA4
	push {lr}
	ldr r0, _08030BBC  @ gUnknown_0202BCF0
	ldrb r0, [r0, #0x15]
	subs r0, #1
	cmp r0, #6
	bhi _08030C08
	lsls r0, r0, #2
	ldr r1, _08030BC0  @ _08030BC4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08030BBC: .4byte gUnknown_0202BCF0
_08030BC0: .4byte _08030BC4
_08030BC4: @ jump table
	.4byte _08030BE0 @ case 0
	.4byte _08030BEC @ case 1
	.4byte _08030BF8 @ case 2
	.4byte _08030BF2 @ case 3
	.4byte _08030BFE @ case 4
	.4byte _08030BE6 @ case 5
	.4byte _08030C04 @ case 6
_08030BE0:
	bl sub_80302D0
	b _08030C08
_08030BE6:
	bl sub_80304E4
	b _08030C08
_08030BEC:
	bl sub_80305FC
	b _08030C08
_08030BF2:
	bl sub_80303F4
	b _08030C08
_08030BF8:
	bl nullsub_12
	b _08030C08
_08030BFE:
	bl sub_80309E0
	b _08030C08
_08030C04:
	bl sub_8030A84
_08030C08:
	pop {r0}
	bx r0

	THUMB_FUNC_START sub_8030C0C
sub_8030C0C: @ 0x08030C0C
	push {lr}
	ldr r0, _08030C20  @ gUnknown_0202BCF0
	ldrb r0, [r0, #0x15]
	cmp r0, #7
	bne _08030C1A
	bl sub_8030B00
_08030C1A:
	pop {r0}
	bx r0
	.align 2, 0
_08030C20: .4byte gUnknown_0202BCF0

	THUMB_FUNC_START sub_8030C24
sub_8030C24: @ 0x08030C24
	push {lr}
	ldr r0, _08030C3C  @ gUnknown_0859D8B8
	bl Proc_Find
	adds r1, r0, #0
	cmp r1, #0
	beq _08030C36
	movs r0, #0
	str r0, [r1, #0x38]
_08030C36:
	pop {r0}
	bx r0
	.align 2, 0
_08030C3C: .4byte gUnknown_0859D8B8

	THUMB_FUNC_START sub_8030C40
sub_8030C40: @ 0x08030C40
	push {r4, lr}
	ldr r0, _08030C70  @ gUnknown_0859D8B8
	bl Proc_Find
	adds r4, r0, #0
	cmp r4, #0
	beq _08030C68
	ldr r0, _08030C74  @ gUnknown_0202BCF0
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetROMChapterStruct
	ldr r1, _08030C78  @ gChapterDataAssetTable
	ldrb r0, [r0, #0xa]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	str r0, [r4, #0x3c]
	str r0, [r4, #0x38]
_08030C68:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08030C70: .4byte gUnknown_0859D8B8
_08030C74: .4byte gUnknown_0202BCF0
_08030C78: .4byte gChapterDataAssetTable

	THUMB_FUNC_START SetupWeather
SetupWeather: @ 0x08030C7C
	push {lr}
	ldr r1, _08030C90  @ gUnknown_0202BCF0
	strb r0, [r1, #0x15]
	bl SetupOAMSpliceForWeather
	bl SetupWeatherGraphics_Maybe
	pop {r0}
	bx r0
	.align 2, 0
_08030C90: .4byte gUnknown_0202BCF0

	THUMB_FUNC_START GetTextSpeed
GetTextSpeed: @ 0x08030C94
	push {lr}
	sub sp, #4
	ldr r1, _08030CB8  @ gUnknown_080D7F58
	mov r0, sp
	movs r2, #4
	bl memcpy
	ldr r0, _08030CBC  @ gUnknown_0202BCF0
	adds r0, #0x40
	ldrb r0, [r0]
	lsls r0, r0, #0x19
	lsrs r0, r0, #0x1e
	add r0, sp
	ldrb r0, [r0]
	add sp, #4
	pop {r1}
	bx r1
	.align 2, 0
_08030CB8: .4byte gUnknown_080D7F58
_08030CBC: .4byte gUnknown_0202BCF0

	THUMB_FUNC_START sub_8030CC0
sub_8030CC0: @ 0x08030CC0
	push {lr}
	bl sub_80A3870
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08030CD0
	movs r0, #1
	b _08030CEE
_08030CD0:
	ldr r2, _08030CE8  @ gUnknown_0202BCF0
	ldrb r1, [r2, #0x14]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _08030CEC
	adds r0, r2, #0
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1b
	lsrs r0, r0, #0x1f
	b _08030CEE
	.align 2, 0
_08030CE8: .4byte gUnknown_0202BCF0
_08030CEC:
	movs r0, #0
_08030CEE:
	pop {r1}
	bx r1

	THUMB_FUNC_START sub_8030CF4
sub_8030CF4: @ 0x08030CF4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r5, r0, #0
	lsls r1, r1, #0x18
	lsrs r6, r1, #0x18
	mov r0, sp
	movs r4, #0
	strh r4, [r0]
	ldr r7, _08030DC8  @ gUnknown_0202BCF0
	ldr r2, _08030DCC  @ 0x01000026
	adds r1, r7, #0
	bl CpuSet
	strb r4, [r7, #0xe]
	cmp r5, #0
	beq _08030D24
	ldrb r0, [r7, #0x14]
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r7, #0x14]
_08030D24:
	lsls r0, r6, #0x18
	asrs r0, r0, #0x18
	movs r1, #0x42
	adds r1, r1, r7
	mov ip, r1
	movs r1, #1
	ands r0, r1
	lsls r0, r0, #5
	mov r2, ip
	ldrb r1, [r2]
	movs r3, #0x21
	negs r3, r3
	ands r3, r1
	orrs r3, r0
	movs r4, #7
	negs r4, r4
	ands r3, r4
	ldr r1, _08030DD0  @ gUnknown_0202BD30
	ldrb r0, [r1]
	movs r2, #3
	negs r2, r2
	mov r8, r2
	ands r2, r0
	movs r6, #0xd
	negs r6, r6
	ands r2, r6
	movs r0, #0x11
	negs r0, r0
	ands r2, r0
	subs r0, #0x50
	ands r2, r0
	movs r0, #0x20
	orrs r2, r0
	movs r5, #0x7f
	ands r2, r5
	movs r1, #0x41
	adds r1, r1, r7
	mov sl, r1
	ldrb r0, [r1]
	movs r1, #2
	negs r1, r1
	mov r9, r1
	ands r1, r0
	mov r0, r8
	ands r1, r0
	ands r1, r6
	movs r0, #0x41
	negs r0, r0
	ands r1, r0
	ands r1, r5
	adds r0, #0x28
	ands r3, r0
	mov r0, ip
	strb r3, [r0]
	ldrh r3, [r0]
	ldr r0, _08030DD4  @ 0xFFFFFE7F
	ands r0, r3
	mov r3, ip
	strh r0, [r3]
	adds r3, r7, #0
	adds r3, #0x43
	ldrb r0, [r3]
	ands r4, r0
	strb r4, [r3]
	mov r0, r9
	ands r2, r0
	ldr r3, _08030DD0  @ gUnknown_0202BD30
	strb r2, [r3]
	movs r0, #0x11
	negs r0, r0
	ands r1, r0
	mov r2, sl
	strb r1, [r2]
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08030DC8: .4byte gUnknown_0202BCF0
_08030DCC: .4byte 0x01000026
_08030DD0: .4byte gUnknown_0202BD30
_08030DD4: .4byte 0xFFFFFE7F

	THUMB_FUNC_START ResetGameState
ResetGameState: @ 0x08030DD8
	push {r4, r5, lr}
	sub sp, #4
	ldr r4, _08030DFC  @ gUnknown_0202BCB0
	movs r5, #1
	ldrsb r5, [r4, r5]
	mov r1, sp
	movs r0, #0
	strh r0, [r1]
	ldr r2, _08030E00  @ 0x01000020
	mov r0, sp
	adds r1, r4, #0
	bl CpuSet
	strb r5, [r4, #1]
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08030DFC: .4byte gUnknown_0202BCB0
_08030E00: .4byte 0x01000020

	THUMB_FUNC_START SetupChapter
SetupChapter: @ 0x08030E04
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	movs r0, #0
	bl SetupBackgrounds
	ldr r0, _08030E64  @ SomeUpdateRoutine
	bl SetMainUpdateRoutine
	ldr r0, _08030E68  @ GeneralVBlankHandler
	bl SetInterrupt_LCDVBlank
	bl ResetGameState
	bl sub_80156D4
	bl SetupMapSpritesPalettes
	bl ClearLocalEvents
	bl SMS_ClearUsageTable
	bl ClearMenuRelatedList
	bl ResetTraps
	ldr r4, _08030E6C  @ gUnknown_0202BCF0
	movs r1, #0
	movs r0, #0x40
	strb r0, [r4, #0xf]
	strh r1, [r4, #0x10]
	bl GetChapterThing
	cmp r0, #2
	bne _08030E70
	ldrb r1, [r4, #0x14]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	bne _08030E7C
	bl NextRN_100
	movs r1, #1
	ands r0, r1
	lsls r1, r0, #1
	adds r1, r1, r0
	strb r1, [r4, #0xd]
	b _08030E7C
	.align 2, 0
_08030E64: .4byte SomeUpdateRoutine
_08030E68: .4byte GeneralVBlankHandler
_08030E6C: .4byte gUnknown_0202BCF0
_08030E70:
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	bl GetROMChapterStruct
	ldrb r0, [r0, #0xc]
	strb r0, [r4, #0xd]
_08030E7C:
	ldr r5, _08030EEC  @ gUnknown_0202BCF0
	movs r0, #0xe
	ldrsb r0, [r5, r0]
	bl GetROMChapterStruct
	ldrb r0, [r0, #0x12]
	movs r4, #0
	strb r0, [r5, #0x15]
	bl SetupBackgroundForWeatherMaybe
	movs r0, #0xe
	ldrsb r0, [r5, r0]
	bl InitChapterMap
	bl AddSnagsAndWalls
	bl GetGameClock
	str r0, [r5, #4]
	movs r2, #0
	strh r4, [r5, #0x16]
	adds r0, r5, #0
	adds r0, #0x48
	strh r4, [r0]
	adds r3, r5, #0
	adds r3, #0x4a
	ldrb r1, [r3]
	movs r0, #2
	negs r0, r0
	ands r0, r1
	adds r1, r5, #0
	adds r1, #0x4b
	strb r2, [r1]
	movs r1, #0xf
	ands r0, r1
	strb r0, [r3]
	movs r4, #1
_08030EC6:
	adds r0, r4, #0
	bl GetUnitStruct
	adds r2, r0, #0
	cmp r2, #0
	beq _08030EF8
	ldr r0, [r2]
	cmp r0, #0
	beq _08030EF8
	ldr r1, [r2, #0xc]
	movs r0, #0x80
	lsls r0, r0, #0xe
	ands r0, r1
	cmp r0, #0
	beq _08030EF0
	movs r0, #8
	orrs r1, r0
	b _08030EF6
	.align 2, 0
_08030EEC: .4byte gUnknown_0202BCF0
_08030EF0:
	movs r0, #9
	negs r0, r0
	ands r1, r0
_08030EF6:
	str r1, [r2, #0xc]
_08030EF8:
	adds r4, #1
	cmp r4, #0x3f
	ble _08030EC6
	bl sub_8018EB8
	bl LoadChapterBallistae
	cmp r6, #0
	beq _08030F10
	adds r0, r6, #0
	bl MakeBMAPMAIN
_08030F10:
	ldr r0, _08030F44  @ gPaletteBuffer
	movs r1, #0
	strh r1, [r0]
	bl EnablePaletteSync
	movs r0, #1
	str r0, [sp]
	movs r1, #1
	movs r2, #1
	movs r3, #1
	bl sub_8001ED0
	movs r0, #1
	bl sub_8001F48
	movs r0, #3
	movs r1, #0
	movs r2, #0
	movs r3, #0x10
	bl SetSpecialColorEffectsParameters
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08030F44: .4byte gPaletteBuffer

	THUMB_FUNC_START sub_8030F48
sub_8030F48: @ 0x08030F48
	push {r4, r5, lr}
	movs r0, #0
	bl SetupBackgrounds
	ldr r0, _08030FCC  @ SomeUpdateRoutine
	bl SetMainUpdateRoutine
	ldr r0, _08030FD0  @ GeneralVBlankHandler
	bl SetInterrupt_LCDVBlank
	bl sub_80156D4
	bl SetupMapSpritesPalettes
	bl SMS_ClearUsageTable
	bl ResetTraps
	ldr r4, _08030FD4  @ gUnknown_0202BCF0
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	bl GetROMChapterStruct
	ldrb r0, [r0, #0x12]
	movs r5, #0
	strb r0, [r4, #0x15]
	bl SetupBackgroundForWeatherMaybe
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	bl InitChapterMap
	bl AddSnagsAndWalls
	bl LoadChapterBallistae
	bl sub_8030174
	bl SetupGameVBlank6C
	ldr r0, _08030FD8  @ gUnknown_0859D908
	movs r1, #4
	bl Proc_Create
	ldr r0, _08030FDC  @ gPaletteBuffer
	strh r5, [r0]
	bl EnablePaletteSync
	ldr r2, _08030FE0  @ gLCDControlBuffer
	ldrb r0, [r2, #1]
	movs r1, #1
	orrs r0, r1
	movs r1, #2
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #9
	negs r1, r1
	ands r0, r1
	subs r1, #8
	ands r0, r1
	strb r0, [r2, #1]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08030FCC: .4byte SomeUpdateRoutine
_08030FD0: .4byte GeneralVBlankHandler
_08030FD4: .4byte gUnknown_0202BCF0
_08030FD8: .4byte gUnknown_0859D908
_08030FDC: .4byte gPaletteBuffer
_08030FE0: .4byte gLCDControlBuffer

	THUMB_FUNC_START sub_8030FE4
sub_8030FE4: @ 0x08030FE4
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r4, _08031068  @ gUnknown_0202BCF0
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	cmp r0, #0x7f
	bne _08030FF8
	bl sub_80A6C8C
_08030FF8:
	movs r0, #0
	bl SetupBackgrounds
	ldr r0, _0803106C  @ SomeUpdateRoutine
	bl SetMainUpdateRoutine
	ldr r0, _08031070  @ GeneralVBlankHandler
	bl SetInterrupt_LCDVBlank
	bl ResetGameState
	ldrb r0, [r4, #0x12]
	ldrb r1, [r4, #0x13]
	bl SetCursorMapPosition
	bl LoadGameCoreGfx
	bl SetupMapSpritesPalettes
	bl SMS_ClearUsageTable
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	bl InitChapterMap
	ldr r4, _08031074  @ gUnknown_0202BCB0
	adds r1, r4, #0
	adds r1, #0x3c
	movs r0, #1
	strb r0, [r1]
	adds r0, r5, #0
	bl MakeBMAPMAIN
	adds r5, r0, #0
	movs r1, #0x14
	ldrsh r0, [r4, r1]
	lsls r0, r0, #4
	bl sub_8015A40
	strh r0, [r4, #0xc]
	movs r1, #0x16
	ldrsh r0, [r4, r1]
	lsls r0, r0, #4
	bl sub_8015A6C
	strh r0, [r4, #0xe]
	ldr r0, _08031078  @ gUnknown_0203A958
	ldrb r0, [r0, #0x16]
	cmp r0, #9
	bhi _080310CE
	lsls r0, r0, #2
	ldr r1, _0803107C  @ _08031080
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08031068: .4byte gUnknown_0202BCF0
_0803106C: .4byte SomeUpdateRoutine
_08031070: .4byte GeneralVBlankHandler
_08031074: .4byte gUnknown_0202BCB0
_08031078: .4byte gUnknown_0203A958
_0803107C: .4byte _08031080
_08031080: @ jump table
	.4byte _080310B0 @ case 0
	.4byte _080310A8 @ case 1
	.4byte _080310B0 @ case 2
	.4byte _080310B8 @ case 3
	.4byte _080310C0 @ case 4
	.4byte _080310CE @ case 5
	.4byte _080310CE @ case 6
	.4byte _080310CE @ case 7
	.4byte _080310CE @ case 8
	.4byte _080310C8 @ case 9
_080310A8:
	adds r0, r5, #0
	bl sub_803133C
	b _080310CE
_080310B0:
	adds r0, r5, #0
	bl sub_8031300
	b _080310CE
_080310B8:
	adds r0, r5, #0
	bl sub_80313BC
	b _080310CE
_080310C0:
	adds r0, r5, #0
	bl sub_80313F8
	b _080310CE
_080310C8:
	adds r0, r5, #0
	bl sub_8031474
_080310CE:
	movs r0, #1
	str r0, [sp]
	movs r1, #1
	movs r2, #1
	movs r3, #1
	bl sub_8001ED0
	movs r0, #1
	bl sub_8001F48
	movs r0, #3
	movs r1, #0
	movs r2, #0
	movs r3, #0x10
	bl SetSpecialColorEffectsParameters
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_START sub_80310F8
sub_80310F8: @ 0x080310F8
	push {lr}
	ldr r0, _08031144  @ SomeUpdateRoutine
	bl SetMainUpdateRoutine
	ldr r0, _08031148  @ GeneralVBlankHandler
	bl SetInterrupt_LCDVBlank
	bl LoadGameCoreGfx
	bl SetupMapSpritesPalettes
	bl ClearBG0BG1
	ldr r2, _0803114C  @ gLCDControlBuffer
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
	bl SetDefaultColorEffects
	movs r0, #0
	bl RegisterBlankTile
	ldr r0, _08031150  @ gBG2TilemapBuffer
	movs r1, #0
	bl BG_Fill
	movs r0, #4
	bl BG_EnableSyncByMask
	pop {r0}
	bx r0
	.align 2, 0
_08031144: .4byte SomeUpdateRoutine
_08031148: .4byte GeneralVBlankHandler
_0803114C: .4byte gLCDControlBuffer
_08031150: .4byte gBG2TilemapBuffer

	THUMB_FUNC_START sub_8031154
sub_8031154: @ 0x08031154
	push {lr}
	bl LoadObjUIGfx
	ldr r0, _08031170  @ gUnknown_0203A4EC
	bl MakeMOVEUNITForMapUnit
	bl _MOVEUNIT6C_SetDefaultFacingDirection
	ldr r0, _08031174  @ gUnknown_0859D9E4
	movs r1, #3
	bl Proc_Create
	pop {r0}
	bx r0
	.align 2, 0
_08031170: .4byte gUnknown_0203A4EC
_08031174: .4byte gUnknown_0859D9E4

	THUMB_FUNC_START LoadGameCoreGfx2
LoadGameCoreGfx2: @ 0x08031178
	push {r4, lr}
	ldr r4, _080311A4  @ gUnknown_0202BCF0
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	bl LoadChapterMapGfx
	ldrb r0, [r4, #0x15]
	bl SetupOAMSpliceForWeather
	bl UpdateGameTilesGraphics
	bl SMS_UpdateFromGameData
	bl SetupMapSpritesPalettes
	bl SMS_FlushIndirect
	bl Font_LoadForUI
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080311A4: .4byte gUnknown_0202BCF0

	THUMB_FUNC_START sub_80311A8
sub_80311A8: @ 0x080311A8
	push {lr}
	movs r0, #0
	bl SetupBackgrounds
	bl LoadGameCoreGfx
	bl LoadGameCoreGfx2
	pop {r0}
	bx r0

	THUMB_FUNC_START MakeBMAPMAIN
MakeBMAPMAIN: @ 0x080311BC
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, _080311E8  @ gUnknown_0859A1F0
	movs r1, #2
	bl Proc_Create
	adds r5, r0, #0
	str r4, [r5, #0x54]
	adds r4, #0x28
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	bl SetupGameVBlank6C
	ldr r0, _080311EC  @ gUnknown_0859D908
	movs r1, #4
	bl Proc_Create
	adds r0, r5, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080311E8: .4byte gUnknown_0859A1F0
_080311EC: .4byte gUnknown_0859D908

	THUMB_FUNC_START sub_80311F0
sub_80311F0: @ 0x080311F0
	push {lr}
	movs r0, #1
	bl Proc_DeleteEachWithMark
	ldr r0, _08031210  @ gUnknown_0859A1F0
	bl Proc_Find
	ldr r2, [r0, #0x54]
	adds r2, #0x28
	ldrb r1, [r2]
	subs r1, #1
	strb r1, [r2]
	bl Proc_Delete
	pop {r0}
	bx r0
	.align 2, 0
_08031210: .4byte gUnknown_0859A1F0

	THUMB_FUNC_START sub_8031214
sub_8031214: @ 0x08031214
	push {r4, r5, r6, lr}
	movs r4, #1
_08031218:
	adds r0, r4, #0
	bl GetUnitStruct
	adds r1, r0, #0
	cmp r1, #0
	beq _08031238
	ldr r0, [r1]
	cmp r0, #0
	beq _08031238
	ldr r0, [r1, #4]
	ldrb r0, [r0, #4]
	cmp r0, #0x51
	bne _08031238
	adds r0, r1, #0
	bl ClearUnitStruct
_08031238:
	adds r4, #1
	cmp r4, #0x3f
	ble _08031218
	movs r4, #0x41
_08031240:
	adds r0, r4, #0
	bl GetUnitStruct
	adds r1, r0, #0
	cmp r1, #0
	beq _08031258
	ldr r0, [r1]
	cmp r0, #0
	beq _08031258
	adds r0, r1, #0
	bl ClearUnitStruct
_08031258:
	adds r4, #1
	cmp r4, #0xbf
	ble _08031240
	movs r5, #1
	movs r6, #0
_08031262:
	adds r0, r5, #0
	bl GetUnitStruct
	adds r4, r0, #0
	cmp r4, #0
	beq _080312DC
	ldr r0, [r4]
	cmp r0, #0
	beq _080312DC
	adds r0, r4, #0
	bl GetUnitMaxHP
	adds r1, r0, #0
	adds r0, r4, #0
	bl SetUnitHP
	adds r0, r4, #0
	movs r1, #0
	bl SetUnitNewStatus
	adds r0, r4, #0
	adds r0, #0x31
	strb r6, [r0]
	ldr r1, [r4, #0xc]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _080312A2
	movs r0, #0x80
	lsls r0, r0, #0xe
	orrs r1, r0
	b _080312A6
_080312A2:
	ldr r0, _080312F4  @ 0xFFDFFFFF
	ands r1, r0
_080312A6:
	str r1, [r4, #0xc]
	ldr r3, [r4, #0xc]
	ldr r0, _080312F8  @ 0x0631E004
	ands r3, r0
	str r3, [r4, #0xc]
	ldr r0, [r4]
	ldr r2, [r4, #4]
	ldr r1, [r0, #0x28]
	ldr r0, [r2, #0x28]
	orrs r1, r0
	movs r0, #0x80
	lsls r0, r0, #2
	ands r1, r0
	cmp r1, #0
	beq _080312CC
	movs r0, #5
	negs r0, r0
	ands r3, r0
	str r3, [r4, #0xc]
_080312CC:
	ldr r0, [r4, #0xc]
	movs r1, #9
	orrs r0, r1
	str r0, [r4, #0xc]
	strb r6, [r4, #0x1b]
	adds r0, r4, #0
	adds r0, #0x39
	strb r6, [r0]
_080312DC:
	adds r5, #1
	cmp r5, #0x3f
	ble _08031262
	ldr r2, _080312FC  @ gUnknown_0202BCF0
	ldrb r1, [r2, #0x14]
	movs r0, #0xef
	ands r0, r1
	strb r0, [r2, #0x14]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080312F4: .4byte 0xFFDFFFFF
_080312F8: .4byte 0x0631E004
_080312FC: .4byte gUnknown_0202BCF0

	THUMB_FUNC_START sub_8031300
sub_8031300: @ 0x08031300
	push {r4, lr}
	adds r4, r0, #0
	bl RefreshFogAndUnitMaps
	bl SMS_UpdateFromGameData
	ldr r2, _08031338  @ gLCDControlBuffer
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
	adds r0, r4, #0
	movs r1, #4
	bl Proc_GotoLabel
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08031338: .4byte gLCDControlBuffer

	THUMB_FUNC_START sub_803133C
sub_803133C: @ 0x0803133C
	push {r4, r5, lr}
	adds r4, r0, #0
	bl RefreshFogAndUnitMaps
	bl SMS_UpdateFromGameData
	ldr r2, _080313AC  @ gLCDControlBuffer
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
	adds r0, r4, #0
	movs r1, #6
	bl Proc_GotoLabel
	ldr r4, _080313B0  @ gUnknown_0203A958
	ldrb r0, [r4, #0xc]
	bl GetUnitStruct
	ldr r5, _080313B4  @ gUnknown_03004E50
	str r0, [r5]
	movs r1, #0x11
	ldrsb r1, [r0, r1]
	ldr r2, _080313B8  @ gUnknown_0202E4D8
	ldr r2, [r2]
	lsls r1, r1, #2
	adds r1, r1, r2
	movs r2, #0x10
	ldrsb r2, [r0, r2]
	ldr r0, [r1]
	adds r0, r0, r2
	movs r1, #0
	strb r1, [r0]
	ldrb r0, [r4, #0xc]
	bl GetUnitStruct
	bl HideUnitSMS
	ldr r0, [r5]
	bl MakeMOVEUNITForMapUnit
	bl _MOVEUNIT6C_SetDefaultFacingDirection
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080313AC: .4byte gLCDControlBuffer
_080313B0: .4byte gUnknown_0203A958
_080313B4: .4byte gUnknown_03004E50
_080313B8: .4byte gUnknown_0202E4D8

	THUMB_FUNC_START sub_80313BC
sub_80313BC: @ 0x080313BC
	push {r4, lr}
	adds r4, r0, #0
	bl RefreshFogAndUnitMaps
	bl SMS_UpdateFromGameData
	ldr r2, _080313F4  @ gLCDControlBuffer
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
	adds r0, r4, #0
	movs r1, #7
	bl Proc_GotoLabel
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080313F4: .4byte gLCDControlBuffer

	THUMB_FUNC_START sub_80313F8
sub_80313F8: @ 0x080313F8
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r5, _08031464  @ gUnknown_0203A958
	ldrb r0, [r5, #0xc]
	bl GetUnitStruct
	ldr r4, _08031468  @ gUnknown_03004E50
	str r0, [r4]
	bl PrepareArena2
	ldr r0, [r4]
	bl sub_802CD64
	bl BeginBattleAnimations
	ldr r2, _0803146C  @ gLCDControlBuffer
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
	bl RefreshFogAndUnitMaps
	ldrb r0, [r5, #0xf]
	ldr r1, _08031470  @ gUnknown_0202E4D8
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r1, [r5, #0xe]
	ldr r0, [r0]
	adds r0, r0, r1
	movs r1, #0
	strb r1, [r0]
	bl SMS_UpdateFromGameData
	adds r0, r6, #0
	movs r1, #0xa
	bl Proc_GotoLabel
	bl sub_80B578C
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08031464: .4byte gUnknown_0203A958
_08031468: .4byte gUnknown_03004E50
_0803146C: .4byte gLCDControlBuffer
_08031470: .4byte gUnknown_0202E4D8

	THUMB_FUNC_START sub_8031474
sub_8031474: @ 0x08031474
	push {r4, lr}
	adds r4, r0, #0
	bl RefreshFogAndUnitMaps
	bl SMS_UpdateFromGameData
	ldr r2, _080314AC  @ gLCDControlBuffer
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
	adds r0, r4, #0
	movs r1, #8
	bl Proc_GotoLabel
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080314AC: .4byte gLCDControlBuffer

	THUMB_FUNC_START sub_80314B0
sub_80314B0: @ 0x080314B0
	push {r4, lr}
	ldr r4, _080314D0  @ gUnknown_0202BCF0
	adds r0, r4, #0
	bl RegisterChapterTimeAndTurnCount
	bl sub_80B6504
	bl sub_80A3DD8
	ldrb r1, [r4, #0x14]
	movs r0, #0x20
	orrs r0, r1
	strb r0, [r4, #0x14]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080314D0: .4byte gUnknown_0202BCF0

	THUMB_FUNC_START sub_80314D4
sub_80314D4: @ 0x080314D4
	push {lr}
	movs r0, #3
	bl SetNextGameActionId
	bl sub_80A4C14
	pop {r0}
	bx r0

	THUMB_FUNC_START GetTacticianNameStringPtr
GetTacticianNameStringPtr: @ 0x080314E4
	ldr r0, _080314E8  @ gUnknown_0202BD10
	bx lr
	.align 2, 0
_080314E8: .4byte gUnknown_0202BD10

	THUMB_FUNC_START sub_80314EC
sub_80314EC: @ 0x080314EC
	push {lr}
	adds r1, r0, #0
	ldr r0, _080314FC  @ gUnknown_0202BD10
	bl strcpy
	pop {r0}
	bx r0
	.align 2, 0
_080314FC: .4byte gUnknown_0202BD10

.align 2, 0
