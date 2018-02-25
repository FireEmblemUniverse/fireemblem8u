	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	THUMB_FUNC_START ResetIconGraphics_
ResetIconGraphics_: @ 0x08003578
	push {lr}
	bl ResetIconGraphics
	pop {r0}
	bx r0

	THUMB_FUNC_START ResetIconGraphics
ResetIconGraphics: @ 0x08003584
	push {r4, lr}
	sub sp, #4
	mov r0, sp
	movs r4, #0
	strh r4, [r0]
	ldr r1, _080035AC  @ gUnknown_02026A90
	ldr r2, _080035B0  @ 0x010001C0
	bl CpuSet
	mov r0, sp
	adds r0, #2
	strh r4, [r0]
	ldr r1, _080035B4  @ gUnknown_02026E10
	ldr r2, _080035B8  @ 0x01000010
	bl CpuSet
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080035AC: .4byte gUnknown_02026A90
_080035B0: .4byte 0x010001C0
_080035B4: .4byte gUnknown_02026E10
_080035B8: .4byte 0x01000010

	THUMB_FUNC_START LoadIconPalettes
LoadIconPalettes: @ 0x080035BC
	push {lr}
	adds r1, r0, #0
	ldr r0, _080035D0  @ gUnknown_085996F4
	lsls r1, r1, #5
	movs r2, #0x40
	bl CopyToPaletteBuffer
	pop {r0}
	bx r0
	.align 2, 0
_080035D0: .4byte gUnknown_085996F4

	THUMB_FUNC_START LoadIconPalette
LoadIconPalette: @ 0x080035D4
	push {lr}
	lsls r0, r0, #5
	ldr r2, _080035E8  @ gUnknown_085996F4
	adds r0, r0, r2
	lsls r1, r1, #5
	movs r2, #0x20
	bl CopyToPaletteBuffer
	pop {r0}
	bx r0
	.align 2, 0
_080035E8: .4byte gUnknown_085996F4

	THUMB_FUNC_START sub_80035EC
sub_80035EC: @ 0x080035EC
	push {lr}
	movs r2, #0
	movs r1, #0x1f
	ldr r3, _0800360C  @ gUnknown_02026E10
_080035F4:
	adds r0, r1, r3
	ldrb r0, [r0]
	cmp r0, #0
	beq _080035FE
	adds r2, #1
_080035FE:
	subs r1, #1
	cmp r1, #0
	bge _080035F4
	adds r0, r2, #0
	pop {r1}
	bx r1
	.align 2, 0
_0800360C: .4byte gUnknown_02026E10

	THUMB_FUNC_START GetIconGfxTileIndex
GetIconGfxTileIndex: @ 0x08003610
	adds r1, r0, #0
	lsls r1, r1, #2
	movs r2, #0xc0
	lsls r2, r2, #2
	adds r0, r2, #0
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bx lr

	THUMB_FUNC_START GetIconGfxIndex
GetIconGfxIndex: @ 0x08003624
	push {r4, lr}
	movs r2, #0
	ldr r4, _0800363C  @ gUnknown_02026E10
	adds r3, r0, #1
_0800362C:
	adds r1, r2, r4
	ldrb r0, [r1]
	cmp r0, #0
	bne _08003640
	strb r3, [r1]
	adds r0, r2, #0
	b _0800364A
	.align 2, 0
_0800363C: .4byte gUnknown_02026E10
_08003640:
	adds r2, #1
	cmp r2, #0x1f
	ble _0800362C
	movs r0, #1
	negs r0, r0
_0800364A:
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_START GetIconTileIndex
GetIconTileIndex: @ 0x08003650
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, _0800366C  @ gUnknown_02026A90
	lsls r1, r4, #2
	adds r5, r1, r0
	ldrb r0, [r5, #1]
	cmp r0, #0
	beq _08003670
	ldrb r0, [r5]
	cmp r0, #0xfe
	bhi _080036A4
	adds r0, #1
	strb r0, [r5]
	b _080036A4
	.align 2, 0
_0800366C: .4byte gUnknown_02026A90
_08003670:
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
	adds r0, r4, #0
	bl GetIconGfxIndex
	adds r0, #1
	strb r0, [r5, #1]
	lsls r4, r4, #7
	ldr r0, _080036B4  @ gUnknown_085926F4
	adds r4, r4, r0
	ldrb r0, [r5, #1]
	bl GetIconGfxTileIndex
	adds r1, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0xb
	movs r2, #0xc0
	lsls r2, r2, #0x13
	ldr r0, _080036B8  @ 0x0001FFE0
	ands r1, r0
	adds r1, r1, r2
	adds r0, r4, #0
	movs r2, #0x80
	bl RegisterTileGraphics
_080036A4:
	ldrb r0, [r5, #1]
	bl GetIconGfxTileIndex
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080036B4: .4byte gUnknown_085926F4
_080036B8: .4byte 0x0001FFE0

	THUMB_FUNC_START DrawIcon
DrawIcon: @ 0x080036BC
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r0, r1, #0
	adds r5, r2, #0
	cmp r0, #0
	bge _080036D8
	movs r0, #0
	strh r0, [r4]
	strh r0, [r4, #2]
	adds r1, r4, #0
	adds r1, #0x40
	strh r0, [r1]
	adds r1, #2
	b _08003704
_080036D8:
	bl GetIconTileIndex
	adds r0, r0, r5
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	movs r2, #0x80
	lsls r2, r2, #9
	adds r0, r0, r2
	strh r1, [r4]
	lsrs r1, r0, #0x10
	adds r0, r0, r2
	strh r1, [r4, #2]
	adds r2, r4, #0
	adds r2, #0x40
	lsrs r1, r0, #0x10
	movs r3, #0x80
	lsls r3, r3, #9
	adds r0, r0, r3
	lsrs r0, r0, #0x10
	strh r1, [r2]
	adds r1, r4, #0
	adds r1, #0x42
_08003704:
	strh r0, [r1]
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_START ClearIconGfx
ClearIconGfx: @ 0x0800370C
	ldr r2, _08003724  @ gUnknown_02026E10
	ldr r1, _08003728  @ gUnknown_02026A90
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r1, [r0, #1]
	subs r1, #1
	adds r1, r1, r2
	movs r2, #0
	strb r2, [r1]
	strb r2, [r0, #1]
	bx lr
	.align 2, 0
_08003724: .4byte gUnknown_02026E10
_08003728: .4byte gUnknown_02026A90

	THUMB_FUNC_START LoadIconObjectGraphics
LoadIconObjectGraphics: @ 0x0800372C
	push {r4, r5, lr}
	adds r2, r0, #0
	ldr r5, _08003758  @ 0x06010000
	ldr r0, _0800375C  @ 0x000003FF
	ands r0, r1
	lsls r0, r0, #5
	adds r5, r0, r5
	cmp r2, #0
	bge _08003760
	movs r0, #0
	adds r1, r5, #0
	movs r2, #0x40
	bl RegisterFillTile
	movs r0, #0x80
	lsls r0, r0, #3
	adds r1, r5, r0
	movs r0, #0
	movs r2, #0x40
	bl RegisterFillTile
	b _08003780
	.align 2, 0
_08003758: .4byte 0x06010000
_0800375C: .4byte 0x000003FF
_08003760:
	ldr r4, _08003788  @ gUnknown_085926F4
	lsls r0, r2, #7
	adds r4, r0, r4
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0x40
	bl RegisterTileGraphics
	adds r4, #0x40
	movs r0, #0x80
	lsls r0, r0, #3
	adds r1, r5, r0
	adds r0, r4, #0
	movs r2, #0x40
	bl RegisterTileGraphics
_08003780:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08003788: .4byte gUnknown_085926F4
