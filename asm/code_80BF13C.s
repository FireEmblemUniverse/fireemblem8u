	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	THUMB_FUNC_START StartGmapRmBorder1
StartGmapRmBorder1: @ 0x080C2A40
	push {r4, r5, lr}
	sub sp, #0x18
	movs r4, #0
	ldr r1, _080C2A68  @ ProcScr_GmapRmBorder1
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
_080C2A68: .4byte ProcScr_GmapRmBorder1
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

	THUMB_FUNC_END StartGmapRmBorder1

	THUMB_FUNC_START DrawWmNationHighLightMapGfx
DrawWmNationHighLightMapGfx: @ 0x080C2AAC
	push {lr}
	adds r2, r0, #0
	lsls r2, r2, #0xc
	ldr r0, _080C2ACC  @ 0x06010000
	adds r2, r2, r0
	ldr r3, _080C2AD0  @ GfxSet_WmNationMap
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
_080C2AD0: .4byte GfxSet_WmNationMap

	THUMB_FUNC_END DrawWmNationHighLightMapGfx

	THUMB_FUNC_START WmShowNationHighlightedMap
WmShowNationHighlightedMap: @ 0x080C2AD4
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	adds r6, r0, #0
	adds r4, r1, #0
	bl StartGmapRmBorder1
	mov r8, r0
	cmp r4, #0
	beq _080C2AF8
	ldr r0, _080C2AF4  @ ProcScr_GmapRmBorder1
	adds r1, r4, #0
	bl Proc_StartBlocking
	b _080C2B00
	.align 2, 0
_080C2AF4: .4byte ProcScr_GmapRmBorder1
_080C2AF8:
	ldr r0, _080C2B70  @ ProcScr_GmapRmBorder1
	movs r1, #3
	bl Proc_Start
_080C2B00:
	adds r7, r0, #0
	mov r0, r8
	adds r1, r6, #0
	bl DrawWmNationHighLightMapGfx
	ldr r1, _080C2B74  @ GfxSet_WmNationMap
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
_080C2B70: .4byte ProcScr_GmapRmBorder1
_080C2B74: .4byte GfxSet_WmNationMap
_080C2B78: .4byte 0xFFFF9C00

	THUMB_FUNC_END WmShowNationHighlightedMap

	THUMB_FUNC_START EndGmapRmBorder1
EndGmapRmBorder1: @ 0x080C2B7C
	push {r4, lr}
	sub sp, #0xc
	adds r4, r0, #0
	cmp r4, #0
	bge _080C2B9C
	ldr r0, _080C2B90  @ ProcScr_GmapRmBorder1
	bl Proc_EndEach
	b _080C2BB8
	.align 2, 0
_080C2B90: .4byte ProcScr_GmapRmBorder1
_080C2B94:
	adds r0, r1, #0
	bl Proc_End
	b _080C2BB8
_080C2B9C:
	ldr r1, _080C2BC0  @ ProcScr_GmapRmBorder1
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
_080C2BC0: .4byte ProcScr_GmapRmBorder1

	THUMB_FUNC_END EndGmapRmBorder1

	THUMB_FUNC_START sub_80C2BC4
sub_80C2BC4: @ 0x080C2BC4
	push {r4, lr}
	sub sp, #0xc
	adds r4, r0, #0
	cmp r4, #0
	bge _080C2BE0
	ldr r0, _080C2BDC  @ ProcScr_GmapRmBorder1
	bl Proc_Find
	cmp r0, #0
	beq _080C2C06
	movs r0, #1
	b _080C2C06
	.align 2, 0
_080C2BDC: .4byte ProcScr_GmapRmBorder1
_080C2BE0:
	ldr r1, _080C2C00  @ ProcScr_GmapRmBorder1
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
_080C2C00: .4byte ProcScr_GmapRmBorder1
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
	ldr r1, _080C2C3C  @ ProcScr_GmapRmBorder1
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
_080C2C3C: .4byte ProcScr_GmapRmBorder1
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

	THUMB_FUNC_START GmapRmBaPalAnim2_End
GmapRmBaPalAnim2_End: @ 0x080C2C54
	bx lr

	THUMB_FUNC_END GmapRmBaPalAnim2_End

	THUMB_FUNC_START GmapRmBaPalAnim2_Init
GmapRmBaPalAnim2_Init: @ 0x080C2C58
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

	THUMB_FUNC_END GmapRmBaPalAnim2_Init

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

	THUMB_FUNC_START GmapRmBaPalAnim2_Loop1
GmapRmBaPalAnim2_Loop1: @ 0x080C2D44
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

	THUMB_FUNC_END GmapRmBaPalAnim2_Loop1

	THUMB_FUNC_START GmapRmBaPalAnim2_Loop2
GmapRmBaPalAnim2_Loop2: @ 0x080C2DA4
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

	THUMB_FUNC_END GmapRmBaPalAnim2_Loop2

	THUMB_FUNC_START sub_80C2E04
sub_80C2E04: @ 0x080C2E04
	push {lr}
	adds r1, r0, #0
	cmp r1, #0
	beq _080C2E18
	ldr r0, _080C2E14  @ ProcScr_GmapRmBaPalAnim2
	bl Proc_StartBlocking
	b _080C2E20
	.align 2, 0
_080C2E14: .4byte ProcScr_GmapRmBaPalAnim2
_080C2E18:
	ldr r0, _080C2E24  @ ProcScr_GmapRmBaPalAnim2
	movs r1, #3
	bl Proc_Start
_080C2E20:
	pop {r1}
	bx r1
	.align 2, 0
_080C2E24: .4byte ProcScr_GmapRmBaPalAnim2

	THUMB_FUNC_END sub_80C2E04

	THUMB_FUNC_START sub_80C2E28
sub_80C2E28: @ 0x080C2E28
	push {lr}
	ldr r0, _080C2E34  @ ProcScr_GmapRmBaPalAnim2
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
_080C2E34: .4byte ProcScr_GmapRmBaPalAnim2

	THUMB_FUNC_END sub_80C2E28

	THUMB_FUNC_START sub_80C2E38
sub_80C2E38: @ 0x080C2E38
	push {lr}
	ldr r0, _080C2E4C  @ ProcScr_GmapRmBaPalAnim2
	bl Proc_Find
	cmp r0, #0
	beq _080C2E46
	movs r0, #1
_080C2E46:
	pop {r1}
	bx r1
	.align 2, 0
_080C2E4C: .4byte ProcScr_GmapRmBaPalAnim2

	THUMB_FUNC_END sub_80C2E38

	THUMB_FUNC_START sub_80C2E50
sub_80C2E50: @ 0x080C2E50
	push {lr}
	ldr r0, _080C2E60  @ ProcScr_GmapRmBaPalAnim2
	bl Proc_Find
	cmp r0, #0
	bne _080C2E64
	movs r0, #0
	b _080C2E6C
	.align 2, 0
_080C2E60: .4byte ProcScr_GmapRmBaPalAnim2
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
	ldr r0, _080C2EA0  @ ProcScr_GmapRmBorder2
	bl CountProcs
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
_080C2EA0: .4byte ProcScr_GmapRmBorder2

	THUMB_FUNC_END sub_80C2E70

	THUMB_FUNC_START sub_80C2EA4
sub_80C2EA4: @ 0x080C2EA4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080C2EE0  @ ProcScr_GmapRmBorder2
	bl CountProcs
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
_080C2EE0: .4byte ProcScr_GmapRmBorder2
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
	bl GmapRm_GetPosition
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
	ldr r0, _080C2FDC  @ ProcScr_GmapRmBorder2
	bl Proc_StartBlocking
	b _080C2FE8
	.align 2, 0
_080C2FDC: .4byte ProcScr_GmapRmBorder2
_080C2FE0:
	ldr r0, _080C3030  @ ProcScr_GmapRmBorder2
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
	bl StartGmapEffect
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
_080C3030: .4byte ProcScr_GmapRmBorder2
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
	ldr r0, _080C3060  @ ProcScr_GmapRmBorder2
	bl Proc_EndEach
	b _080C3088
	.align 2, 0
_080C3060: .4byte ProcScr_GmapRmBorder2
_080C3064:
	adds r0, r1, #0
	bl Proc_End
	b _080C3088
_080C306C:
	ldr r1, _080C3090  @ ProcScr_GmapRmBorder2
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
_080C3090: .4byte ProcScr_GmapRmBorder2

	THUMB_FUNC_END sub_80C304C

	THUMB_FUNC_START sub_80C3094
sub_80C3094: @ 0x080C3094
	push {r4, lr}
	sub sp, #0xc
	adds r4, r0, #0
	cmp r4, #0
	bge _080C30B0
	ldr r0, _080C30AC  @ ProcScr_GmapRmBorder2
	bl Proc_Find
	cmp r0, #0
	beq _080C30D6
	movs r0, #1
	b _080C30D6
	.align 2, 0
_080C30AC: .4byte ProcScr_GmapRmBorder2
_080C30B0:
	ldr r1, _080C30D0  @ ProcScr_GmapRmBorder2
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
_080C30D0: .4byte ProcScr_GmapRmBorder2
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
	ldr r1, _080C310C  @ ProcScr_GmapRmBorder2
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
_080C310C: .4byte ProcScr_GmapRmBorder2
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
	ldr r5, _080C3170  @ ProcScr_WorldMapMain
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
_080C3170: .4byte ProcScr_WorldMapMain
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
	bl HideGmUnit
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
	ldr r0, _080C3240  @ ProcScr_WorldMapMain
	bl Proc_Find
	ldr r0, [r0, #0x54]
	ldrh r1, [r4, #0x2c]
	movs r2, #0x1e
	bl GmMu_StartFadeIn
	ldrh r0, [r4, #0x2c]
	bl ShowGmUnit
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C3240: .4byte ProcScr_WorldMapMain

	THUMB_FUNC_END sub_80C3220

	THUMB_FUNC_START sub_80C3244
sub_80C3244: @ 0x080C3244
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080C3260  @ ProcScr_WorldMapMain
	bl Proc_Find
	ldr r0, [r0, #0x54]
	ldrh r1, [r4, #0x2c]
	movs r2, #0x1e
	bl GmMu_StartFadeOut
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C3260: .4byte ProcScr_WorldMapMain

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
	ldr r0, _080C32E0  @ ProcScr_WorldMapMain
	bl Proc_Find
	ldr r0, [r0, #0x54]
	mov r1, sp
	bl sub_80BDEB4
	add sp, #0x10
	pop {r0}
	bx r0
	.align 2, 0
_080C32E0: .4byte ProcScr_WorldMapMain

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
	ldr r0, _080C334C  @ ProcScr_WorldMapMain
	bl Proc_Find
	ldr r0, [r0, #0x54]
	mov r1, sp
	bl sub_80BDFA4
	add sp, #0x14
	pop {r0}
	bx r0
	.align 2, 0
_080C334C: .4byte ProcScr_WorldMapMain

	THUMB_FUNC_END sub_80C32E4

	THUMB_FUNC_START sub_80C3350
sub_80C3350: @ 0x080C3350
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080C3374  @ ProcScr_WorldMapMain
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
_080C3374: .4byte ProcScr_WorldMapMain

	THUMB_FUNC_END sub_80C3350

	THUMB_FUNC_START sub_80C3378
sub_80C3378: @ 0x080C3378
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r1, r2, #0
	cmp r1, #0
	beq _080C3390
	ldr r0, _080C338C  @ ProcScr_GmapAutoMu
	bl Proc_StartBlocking
	b _080C3398
	.align 2, 0
_080C338C: .4byte ProcScr_GmapAutoMu
_080C3390:
	ldr r0, _080C33D0  @ ProcScr_GmapAutoMu
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
_080C33D0: .4byte ProcScr_GmapAutoMu

	THUMB_FUNC_END sub_80C3378

	THUMB_FUNC_START sub_80C33D4
sub_80C33D4: @ 0x080C33D4
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r1, r2, #0
	cmp r1, #0
	beq _080C33EC
	ldr r0, _080C33E8  @ ProcScr_GmapAutoMu
	bl Proc_StartBlocking
	b _080C33F4
	.align 2, 0
_080C33E8: .4byte ProcScr_GmapAutoMu
_080C33EC:
	ldr r0, _080C3438  @ ProcScr_GmapAutoMu
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
_080C3438: .4byte ProcScr_GmapAutoMu

	THUMB_FUNC_END sub_80C33D4

	THUMB_FUNC_START sub_80C343C
sub_80C343C: @ 0x080C343C
	push {r4, lr}
	sub sp, #0xc
	adds r4, r0, #0
	cmp r4, #0
	bge _080C345C
	ldr r0, _080C3450  @ ProcScr_GmapAutoMu
	bl Proc_EndEach
	b _080C3476
	.align 2, 0
_080C3450: .4byte ProcScr_GmapAutoMu
_080C3454:
	adds r0, r1, #0
	bl Proc_End
	b _080C3476
_080C345C:
	ldr r1, _080C3480  @ ProcScr_GmapAutoMu
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
_080C3480: .4byte ProcScr_GmapAutoMu

	THUMB_FUNC_END sub_80C343C

	THUMB_FUNC_START sub_80C3484
sub_80C3484: @ 0x080C3484
	push {r4, lr}
	sub sp, #0xc
	adds r4, r0, #0
	cmp r4, #0
	bge _080C34A0
	ldr r0, _080C349C  @ ProcScr_GmapAutoMu
	bl Proc_Find
	cmp r0, #0
	beq _080C34C6
	movs r0, #1
	b _080C34C6
	.align 2, 0
_080C349C: .4byte ProcScr_GmapAutoMu
_080C34A0:
	ldr r1, _080C34C0  @ ProcScr_GmapAutoMu
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
_080C34C0: .4byte ProcScr_GmapAutoMu
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
	ldr r2, _080C35E8  @ gWmHblankStatus
	ldrb r1, [r2]
	movs r0, #0xfe
	ands r0, r1
	strb r0, [r2]
	pop {r0}
	bx r0
	.align 2, 0
_080C35E8: .4byte gWmHblankStatus

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

	THUMB_FUNC_START StartWmText
StartWmText: @ 0x080C3624
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _080C3658  @ gUnknown_08A3EE44
	bl Proc_Find
	adds r4, r0, #0
	cmp r4, #0
	beq _080C3652
	bl sub_80C3590
	ldr r2, _080C365C  @ gWmHblankStatus
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
_080C365C: .4byte gWmHblankStatus

	THUMB_FUNC_END StartWmText

	THUMB_FUNC_START RemoveWmText
RemoveWmText: @ 0x080C3660
	push {lr}
	ldr r0, _080C3684  @ gUnknown_08A3EE44
	bl Proc_Find
	adds r3, r0, #0
	cmp r3, #0
	beq _080C3680
	ldr r2, _080C3688  @ gWmHblankStatus
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
_080C3688: .4byte gWmHblankStatus

	THUMB_FUNC_END RemoveWmText

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
	bl GetNextUnclearedNode
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
	ldr r0, _080C38A8  @ ProcScr_WorldMapMain
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
_080C38A8: .4byte ProcScr_WorldMapMain
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
	ldr r0, _080C3A14  @ ProcScr_WorldMapMain
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
_080C3A14: .4byte ProcScr_WorldMapMain
_080C3A18: .4byte 0x0000012F
_080C3A1C: .4byte 0x000001FF
_080C3A20: .4byte 0x000090F5
_080C3A24: .4byte gObject_8x8

	THUMB_FUNC_END sub_80C38BC

	THUMB_FUNC_START sub_80C3A28
sub_80C3A28: @ 0x080C3A28
	push {lr}
	ldr r0, _080C3A54  @ ProcScr_WorldMapMain
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
_080C3A54: .4byte ProcScr_WorldMapMain
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
	bl SetBlendConfig
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
	ldr r0, _080C3E7C  @ ProcScr_GmapRader
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
_080C3E7C: .4byte ProcScr_GmapRader

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
	ldr r0, _080C3EB8  @ ProcScr_GmapRader
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
_080C3EB8: .4byte ProcScr_GmapRader
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
	bl IsBgmPlaying
	adds r1, r4, #0
	adds r1, #0x30
	strb r0, [r1]
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080C3EF6
	bl GetCurrentBgmSong
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
	ldr r0, _080C401C  @ ProcScr_GmapBaseMenu
	bl Proc_StartBlocking
	b _080C4028
	.align 2, 0
_080C401C: .4byte ProcScr_GmapBaseMenu
_080C4020:
	ldr r0, _080C4034  @ ProcScr_GmapBaseMenu
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
_080C4034: .4byte ProcScr_GmapBaseMenu

	THUMB_FUNC_END sub_80C400C

	THUMB_FUNC_START sub_80C4038
sub_80C4038: @ 0x080C4038
	push {lr}
	ldr r0, _080C4044  @ ProcScr_GmapBaseMenu
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
_080C4044: .4byte ProcScr_GmapBaseMenu

	THUMB_FUNC_END sub_80C4038

	THUMB_FUNC_START sub_80C4048
sub_80C4048: @ 0x080C4048
	push {lr}
	ldr r0, _080C4054  @ ProcScr_GmapBaseMenu
	bl Proc_Find
	pop {r1}
	bx r1
	.align 2, 0
_080C4054: .4byte ProcScr_GmapBaseMenu

	THUMB_FUNC_END sub_80C4048

	THUMB_FUNC_START sub_80C4058
sub_80C4058: @ 0x080C4058
	push {lr}
	ldr r0, _080C406C  @ ProcScr_GmapBaseMenu
	bl Proc_Find
	cmp r0, #0
	beq _080C4066
	movs r0, #1
_080C4066:
	pop {r1}
	bx r1
	.align 2, 0
_080C406C: .4byte ProcScr_GmapBaseMenu

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
	bl SetBlendConfig
	b _080C4124
_080C4100:
	movs r0, #1
	movs r1, #0
	movs r2, #0x10
	movs r3, #0
	bl SetBlendConfig
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
	bl SetBlendConfig
	b _080C41DC
_080C41CA:
	movs r0, #1
	movs r1, #0x10
	movs r2, #0
	movs r3, #0
	bl SetBlendConfig
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
	bl SetBlendConfig
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
	bl SetBlendConfig
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
