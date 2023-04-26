	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	THUMB_FUNC_START EkrDragonQuakeMain
EkrDragonQuakeMain: @ 0x080703C4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	mov sl, r0
	ldr r0, [r0, #0x5c]
	mov r9, r0
	ldr r4, _08070554  @ gEkrBg2QuakeVec
	ldrh r1, [r4]
	ldrh r2, [r4, #2]
	movs r0, #2
	bl BG_SetPosition
	ldr r6, _08070558  @ gEkrBg0QuakeVec
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
_08070554: .4byte gEkrBg2QuakeVec
_08070558: .4byte gEkrBg0QuakeVec
_0807055C: .4byte gEkrXPosBase
_08070560: .4byte gEkrBgXOffset
_08070564: .4byte gEkrYPosBase

	THUMB_FUNC_END EkrDragonQuakeMain

	THUMB_FUNC_START NewEkrWhiteINOUT
NewEkrWhiteINOUT: @ 0x08070568
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	ldr r0, _080705A0  @ ProcScr_ekrWhiteINOUT
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
_080705A0: .4byte ProcScr_ekrWhiteINOUT
_080705A4: .4byte gLCDControlBuffer

	THUMB_FUNC_END NewEkrWhiteINOUT

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

.align 2, 0
