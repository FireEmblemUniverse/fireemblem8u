	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	THUMB_FUNC_START sub_808BBAC
sub_808BBAC: @ 0x0808BBAC
	push {lr}
	cmp r0, #0
	bge _0808BBBE
	cmp r1, #0
	bge _0808BBBA
	movs r0, #0
	b _0808BBC8
_0808BBBA:
	movs r0, #1
	b _0808BBC8
_0808BBBE:
	cmp r1, #0
	blt _0808BBC6
	movs r0, #3
	b _0808BBC8
_0808BBC6:
	movs r0, #2
_0808BBC8:
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_808BBAC

	THUMB_FUNC_START GetCameraMovementSpeedMaybe
GetCameraMovementSpeedMaybe: @ 0x0808BBCC
	push {r4, lr}
	ldr r2, _0808BBF8  @ gUnknown_0202BCB0
	movs r0, #0x14
	ldrsh r3, [r2, r0]
	lsls r3, r3, #4
	movs r1, #0xc
	ldrsh r0, [r2, r1]
	subs r0, #8
	subs r3, r3, r0
	movs r4, #0x16
	ldrsh r1, [r2, r4]
	lsls r1, r1, #4
	movs r4, #0xe
	ldrsh r0, [r2, r4]
	subs r0, #8
	subs r1, r1, r0
	cmp r3, #0x78
	bgt _0808BBFC
	cmp r1, #0x50
	bgt _0808BC04
	movs r0, #0
	b _0808BC0A
	.align 2, 0
_0808BBF8: .4byte gUnknown_0202BCB0
_0808BBFC:
	cmp r1, #0x50
	bgt _0808BC08
	movs r0, #1
	b _0808BC0A
_0808BC04:
	movs r0, #2
	b _0808BC0A
_0808BC08:
	movs r0, #3
_0808BC0A:
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END GetCameraMovementSpeedMaybe

	THUMB_FUNC_START sub_808BC10
sub_808BC10: @ 0x0808BC10
	push {lr}
	adds r3, r0, #0
	lsls r1, r1, #0x10
	lsrs r0, r1, #0x10
	asrs r1, r1, #0x10
	cmp r1, #5
	ble _0808BC20
	movs r0, #5
_0808BC20:
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	adds r0, r0, r2
	strh r0, [r3]
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_808BC10

	THUMB_FUNC_START sub_808BC2C
sub_808BC2C: @ 0x0808BC2C
	push {r4, r5, lr}
	adds r3, r0, #0
	lsls r1, r1, #0x10
	asrs r4, r1, #0x13
	movs r0, #0xe0
	lsls r0, r0, #0xb
	ands r0, r1
	asrs r0, r0, #0x10
	movs r1, #0
	adds r5, r2, #0
	adds r5, #0xe
	adds r2, #6
	adds r0, r2, r0
_0808BC46:
	cmp r1, r4
	bge _0808BC4E
	strh r5, [r3]
	b _0808BC58
_0808BC4E:
	cmp r1, r4
	bne _0808BC56
	strh r0, [r3]
	b _0808BC58
_0808BC56:
	strh r2, [r3]
_0808BC58:
	adds r3, #2
	adds r1, #1
	cmp r1, #4
	ble _0808BC46
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_808BC2C

	THUMB_FUNC_START sub_808BC68
sub_808BC68: @ 0x0808BC68
	push {r4, lr}
	adds r4, r0, #0
	lsls r1, r1, #0x10
	lsrs r3, r1, #0x10
	asrs r1, r1, #0x10
	cmp r1, #4
	ble _0808BC78
	movs r3, #5
_0808BC78:
	lsls r0, r3, #0x10
	cmp r0, #0
	bge _0808BC80
	movs r3, #0
_0808BC80:
	adds r1, r2, #0
	adds r1, #0xf
	lsls r0, r3, #0x10
	asrs r0, r0, #0x10
	adds r0, r0, r1
	strh r0, [r4]
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_808BC68

	THUMB_FUNC_START sub_808BC94
sub_808BC94: @ 0x0808BC94
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r5, r0, #0
	adds r6, r1, #0
	mov r8, r2
	adds r0, r6, #0
	bl GetUnitCurrentHp
	movs r1, #0x32
	adds r4, r0, #0
	muls r4, r1, r4
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	adds r0, r6, #0
	bl GetUnitMaxHp
	adds r1, r0, #0
	adds r0, r4, #0
	bl Div
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	adds r0, r5, #0
	adds r1, r4, #0
	mov r2, r8
	bl sub_808BC10
	adds r0, r5, #2
	subs r1, r4, #5
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	mov r2, r8
	bl sub_808BC2C
	adds r5, #0xc
	subs r4, #0x2d
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	adds r0, r5, #0
	adds r1, r4, #0
	mov r2, r8
	bl sub_808BC68
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_808BC94

	THUMB_FUNC_START Loop6CUI1_DisplayTransition
Loop6CUI1_DisplayTransition: @ 0x0808BCF8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r7, r0, #0
	ldr r1, _0808BD44  @ gUnknown_08A01828
	adds r0, #0x50
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #3
	adds r1, r0, r1
	movs r0, #3
	ldrsb r0, [r1, r0]
	movs r4, #0
	cmp r0, #0
	blt _0808BD1A
	movs r4, #0xe
_0808BD1A:
	movs r0, #2
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bge _0808BD50
	lsls r5, r4, #5
	lsls r4, r4, #6
	ldr r0, _0808BD48  @ gBG0TilemapBuffer
	adds r0, r4, r0
	movs r1, #0xd
	movs r2, #6
	movs r3, #0
	bl TileMap_FillRect
	ldr r0, _0808BD4C  @ gBG1TilemapBuffer
	adds r0, r4, r0
	movs r1, #0xd
	movs r2, #6
	movs r3, #0
	bl TileMap_FillRect
	b _0808BD70
	.align 2, 0
_0808BD44: .4byte gUnknown_08A01828
_0808BD48: .4byte gBG0TilemapBuffer
_0808BD4C: .4byte gBG1TilemapBuffer
_0808BD50:
	lsls r5, r4, #5
	lsls r4, r4, #6
	ldr r0, _0808BDC8  @ gUnknown_02022CCA
	adds r0, r4, r0
	movs r1, #0xd
	movs r2, #6
	movs r3, #0
	bl TileMap_FillRect
	ldr r0, _0808BDCC  @ gUnknown_020234CA
	adds r0, r4, r0
	movs r1, #0xd
	movs r2, #6
	movs r3, #0
	bl TileMap_FillRect
_0808BD70:
	mov r8, r5
	adds r6, r4, #0
	movs r0, #3
	bl BG_EnableSyncByMask
	ldr r1, _0808BDD0  @ gUnknown_08A0189C
	ldr r0, [r7, #0x58]
	adds r0, r0, r1
	movs r5, #0
	ldrsb r5, [r0, r5]
	ldr r1, _0808BDD4  @ gUnknown_08A01828
	adds r0, r7, #0
	adds r0, #0x50
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrb r0, [r0, #2]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bge _0808BDE8
	movs r4, #0xd
	subs r4, r4, r5
	lsls r4, r4, #1
	ldr r0, _0808BDD8  @ gBmFrameTmap0
	adds r0, r4, r0
	ldr r1, _0808BDDC  @ gBG0TilemapBuffer
	adds r1, r6, r1
	adds r2, r5, #0
	movs r3, #6
	bl TileMap_CopyRect
	ldr r0, _0808BDE0  @ gUnknown_0200422C
	adds r4, r4, r0
	ldr r1, _0808BDE4  @ gBG1TilemapBuffer
	adds r1, r6, r1
	adds r0, r4, #0
	adds r2, r5, #0
	movs r3, #6
	bl TileMap_CopyRect
	b _0808BE0E
	.align 2, 0
_0808BDC8: .4byte gUnknown_02022CCA
_0808BDCC: .4byte gUnknown_020234CA
_0808BDD0: .4byte gUnknown_08A0189C
_0808BDD4: .4byte gUnknown_08A01828
_0808BDD8: .4byte gBmFrameTmap0
_0808BDDC: .4byte gBG0TilemapBuffer
_0808BDE0: .4byte gUnknown_0200422C
_0808BDE4: .4byte gBG1TilemapBuffer
_0808BDE8:
	ldr r0, _0808BE58  @ gBmFrameTmap0
	mov r4, r8
	adds r4, #0x1e
	subs r4, r4, r5
	lsls r4, r4, #1
	ldr r1, _0808BE5C  @ gBG0TilemapBuffer
	adds r1, r4, r1
	adds r2, r5, #0
	movs r3, #6
	bl TileMap_CopyRect
	ldr r0, _0808BE60  @ gUnknown_0200422C
	ldr r1, _0808BE64  @ gBG1TilemapBuffer
	adds r4, r4, r1
	adds r1, r4, #0
	adds r2, r5, #0
	movs r3, #6
	bl TileMap_CopyRect
_0808BE0E:
	ldr r0, [r7, #0x58]
	adds r0, #1
	str r0, [r7, #0x58]
	cmp r0, #4
	bne _0808BE4C
	adds r1, r7, #0
	adds r1, #0x55
	movs r0, #0
	strb r0, [r1]
	str r0, [r7, #0x58]
	adds r0, r7, #0
	bl Proc_Break
	ldr r2, _0808BE68  @ gUnknown_0202BCB0
	movs r1, #0x16
	ldrsh r0, [r2, r1]
	ldr r1, _0808BE6C  @ gBmMapUnit
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r3, #0x14
	ldrsh r1, [r2, r3]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	bl GetUnit
	adds r1, r0, #0
	adds r0, r7, #0
	bl DrawMinimugBoxMaybe
_0808BE4C:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808BE58: .4byte gBmFrameTmap0
_0808BE5C: .4byte gBG0TilemapBuffer
_0808BE60: .4byte gUnknown_0200422C
_0808BE64: .4byte gBG1TilemapBuffer
_0808BE68: .4byte gUnknown_0202BCB0
_0808BE6C: .4byte gBmMapUnit

	THUMB_FUNC_END Loop6CUI1_DisplayTransition

	THUMB_FUNC_START Loop6CUI1_HideTransition
Loop6CUI1_HideTransition: @ 0x0808BE70
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	ldr r3, _0808BED0  @ gUnknown_08A01828
	adds r2, r6, #0
	adds r2, #0x50
	movs r0, #0
	ldrsb r0, [r2, r0]
	lsls r0, r0, #3
	adds r0, r0, r3
	ldrb r0, [r0, #3]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r4, #0
	cmp r0, #0
	blt _0808BE94
	movs r4, #0xe
_0808BE94:
	adds r1, r6, #0
	adds r1, #0x55
	movs r0, #1
	strb r0, [r1]
	movs r0, #0
	ldrsb r0, [r2, r0]
	lsls r0, r0, #3
	adds r0, r0, r3
	ldrb r0, [r0, #2]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bge _0808BEDC
	lsls r5, r4, #5
	lsls r4, r4, #6
	ldr r0, _0808BED4  @ gBG0TilemapBuffer
	adds r0, r4, r0
	movs r1, #0xd
	movs r2, #6
	movs r3, #0
	bl TileMap_FillRect
	ldr r0, _0808BED8  @ gBG1TilemapBuffer
	adds r0, r4, r0
	movs r1, #0xd
	movs r2, #6
	movs r3, #0
	bl TileMap_FillRect
	b _0808BEFC
	.align 2, 0
_0808BED0: .4byte gUnknown_08A01828
_0808BED4: .4byte gBG0TilemapBuffer
_0808BED8: .4byte gBG1TilemapBuffer
_0808BEDC:
	lsls r5, r4, #5
	lsls r4, r4, #6
	ldr r0, _0808BF54  @ gUnknown_02022CCA
	adds r0, r4, r0
	movs r1, #0xd
	movs r2, #6
	movs r3, #0
	bl TileMap_FillRect
	ldr r0, _0808BF58  @ gUnknown_020234CA
	adds r0, r4, r0
	movs r1, #0xd
	movs r2, #6
	movs r3, #0
	bl TileMap_FillRect
_0808BEFC:
	mov r8, r5
	adds r7, r4, #0
	movs r0, #3
	bl BG_EnableSyncByMask
	ldr r1, _0808BF5C  @ gUnknown_08A018A0
	ldr r0, [r6, #0x58]
	adds r0, r0, r1
	movs r5, #0
	ldrsb r5, [r0, r5]
	ldr r1, _0808BF60  @ gUnknown_08A01828
	adds r0, r6, #0
	adds r0, #0x50
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrb r0, [r0, #2]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bge _0808BF74
	movs r4, #0xd
	subs r4, r4, r5
	lsls r4, r4, #1
	ldr r0, _0808BF64  @ gBmFrameTmap0
	adds r0, r4, r0
	ldr r1, _0808BF68  @ gBG0TilemapBuffer
	adds r1, r7, r1
	adds r2, r5, #0
	movs r3, #6
	bl TileMap_CopyRect
	ldr r0, _0808BF6C  @ gUnknown_0200422C
	adds r4, r4, r0
	ldr r1, _0808BF70  @ gBG1TilemapBuffer
	adds r1, r7, r1
	adds r0, r4, #0
	adds r2, r5, #0
	movs r3, #6
	bl TileMap_CopyRect
	b _0808BF9A
	.align 2, 0
_0808BF54: .4byte gUnknown_02022CCA
_0808BF58: .4byte gUnknown_020234CA
_0808BF5C: .4byte gUnknown_08A018A0
_0808BF60: .4byte gUnknown_08A01828
_0808BF64: .4byte gBmFrameTmap0
_0808BF68: .4byte gBG0TilemapBuffer
_0808BF6C: .4byte gUnknown_0200422C
_0808BF70: .4byte gBG1TilemapBuffer
_0808BF74:
	ldr r0, _0808BFC4  @ gBmFrameTmap0
	mov r4, r8
	adds r4, #0x1e
	subs r4, r4, r5
	lsls r4, r4, #1
	ldr r1, _0808BFC8  @ gBG0TilemapBuffer
	adds r1, r4, r1
	adds r2, r5, #0
	movs r3, #6
	bl TileMap_CopyRect
	ldr r0, _0808BFCC  @ gUnknown_0200422C
	ldr r1, _0808BFD0  @ gBG1TilemapBuffer
	adds r4, r4, r1
	adds r1, r4, #0
	adds r2, r5, #0
	movs r3, #6
	bl TileMap_CopyRect
_0808BF9A:
	ldr r0, [r6, #0x58]
	adds r0, #1
	str r0, [r6, #0x58]
	cmp r0, #3
	bne _0808BFBA
	adds r1, r6, #0
	adds r1, #0x56
	movs r0, #0
	strb r0, [r1]
	str r0, [r6, #0x58]
	adds r1, #1
	movs r0, #0xff
	strb r0, [r1]
	adds r0, r6, #0
	bl Proc_Break
_0808BFBA:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808BFC4: .4byte gBmFrameTmap0
_0808BFC8: .4byte gBG0TilemapBuffer
_0808BFCC: .4byte gUnknown_0200422C
_0808BFD0: .4byte gBG1TilemapBuffer

	THUMB_FUNC_END Loop6CUI1_HideTransition

	THUMB_FUNC_START sub_808BFD4
sub_808BFD4: @ 0x0808BFD4
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r1, _0808C00C  @ gUnknown_08A01828
	adds r0, #0x50
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bge _0808C018
	ldr r0, _0808C010  @ gUnknown_02022FE8
	movs r1, #7
	movs r2, #7
	movs r3, #0
	bl TileMap_FillRect
	ldr r0, _0808C014  @ gUnknown_020237E8
	movs r1, #7
	movs r2, #7
	movs r3, #0
	bl TileMap_FillRect
	b _0808C030
	.align 2, 0
_0808C00C: .4byte gUnknown_08A01828
_0808C010: .4byte gUnknown_02022FE8
_0808C014: .4byte gUnknown_020237E8
_0808C018:
	ldr r0, _0808C084  @ gUnknown_02023016
	movs r1, #7
	movs r2, #7
	movs r3, #0
	bl TileMap_FillRect
	ldr r0, _0808C088  @ gUnknown_02023816
	movs r1, #7
	movs r2, #7
	movs r3, #0
	bl TileMap_FillRect
_0808C030:
	movs r0, #3
	bl BG_EnableSyncByMask
	ldr r1, _0808C08C  @ gUnknown_08A018A3
	ldr r0, [r6, #0x58]
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r5, r0, #1
	ldr r1, _0808C090  @ gUnknown_08A01828
	adds r0, r6, #0
	adds r0, #0x50
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bge _0808C0A8
	ldr r4, _0808C094  @ 0x00000147
	subs r4, r4, r5
	lsls r4, r4, #1
	ldr r0, _0808C098  @ gBmFrameTmap0
	adds r0, r4, r0
	ldr r1, _0808C09C  @ gUnknown_02022FE8
	adds r2, r5, #0
	movs r3, #7
	bl TileMap_CopyRect
	ldr r0, _0808C0A0  @ gUnknown_0200422C
	adds r4, r4, r0
	ldr r1, _0808C0A4  @ gUnknown_020237E8
	adds r0, r4, #0
	adds r2, r5, #0
	movs r3, #7
	bl TileMap_CopyRect
	b _0808C0CE
	.align 2, 0
_0808C084: .4byte gUnknown_02023016
_0808C088: .4byte gUnknown_02023816
_0808C08C: .4byte gUnknown_08A018A3
_0808C090: .4byte gUnknown_08A01828
_0808C094: .4byte 0x00000147
_0808C098: .4byte gBmFrameTmap0
_0808C09C: .4byte gUnknown_02022FE8
_0808C0A0: .4byte gUnknown_0200422C
_0808C0A4: .4byte gUnknown_020237E8
_0808C0A8:
	ldr r0, _0808C0F0  @ gUnknown_02003FAC
	movs r4, #0xdf
	lsls r4, r4, #1
	subs r4, r4, r5
	lsls r4, r4, #1
	ldr r1, _0808C0F4  @ gBG0TilemapBuffer
	adds r1, r4, r1
	adds r2, r5, #0
	movs r3, #7
	bl TileMap_CopyRect
	ldr r0, _0808C0F8  @ gUnknown_020044AC
	ldr r1, _0808C0FC  @ gBG1TilemapBuffer
	adds r4, r4, r1
	adds r1, r4, #0
	adds r2, r5, #0
	movs r3, #7
	bl TileMap_CopyRect
_0808C0CE:
	ldr r0, [r6, #0x58]
	adds r0, #1
	str r0, [r6, #0x58]
	cmp r0, #3
	bne _0808C0E8
	movs r0, #0
	str r0, [r6, #0x58]
	adds r1, r6, #0
	adds r1, #0x55
	strb r0, [r1]
	adds r0, r6, #0
	bl Proc_Break
_0808C0E8:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0808C0F0: .4byte gUnknown_02003FAC
_0808C0F4: .4byte gBG0TilemapBuffer
_0808C0F8: .4byte gUnknown_020044AC
_0808C0FC: .4byte gBG1TilemapBuffer

	THUMB_FUNC_END sub_808BFD4

	THUMB_FUNC_START sub_808C100
sub_808C100: @ 0x0808C100
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r1, r6, #0
	adds r1, #0x55
	movs r0, #1
	strb r0, [r1]
	ldr r1, _0808C140  @ gUnknown_08A01828
	adds r0, r6, #0
	adds r0, #0x50
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bge _0808C14C
	ldr r0, _0808C144  @ gUnknown_02022FE8
	movs r1, #7
	movs r2, #7
	movs r3, #0
	bl TileMap_FillRect
	ldr r0, _0808C148  @ gUnknown_020237E8
	movs r1, #7
	movs r2, #7
	movs r3, #0
	bl TileMap_FillRect
	b _0808C164
	.align 2, 0
_0808C140: .4byte gUnknown_08A01828
_0808C144: .4byte gUnknown_02022FE8
_0808C148: .4byte gUnknown_020237E8
_0808C14C:
	ldr r0, _0808C1B8  @ gUnknown_02023016
	movs r1, #7
	movs r2, #7
	movs r3, #0
	bl TileMap_FillRect
	ldr r0, _0808C1BC  @ gUnknown_02023816
	movs r1, #7
	movs r2, #7
	movs r3, #0
	bl TileMap_FillRect
_0808C164:
	movs r0, #3
	bl BG_EnableSyncByMask
	ldr r1, _0808C1C0  @ gUnknown_08A018A6
	ldr r0, [r6, #0x58]
	adds r0, r0, r1
	movs r5, #0
	ldrsb r5, [r0, r5]
	ldr r1, _0808C1C4  @ gUnknown_08A01828
	adds r0, r6, #0
	adds r0, #0x50
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bge _0808C1D8
	movs r4, #0xa3
	lsls r4, r4, #1
	subs r4, r4, r5
	lsls r4, r4, #1
	ldr r0, _0808C1C8  @ gBmFrameTmap0
	adds r0, r4, r0
	ldr r1, _0808C1CC  @ gUnknown_02022FE8
	adds r2, r5, #0
	movs r3, #7
	bl TileMap_CopyRect
	ldr r0, _0808C1D0  @ gUnknown_0200422C
	adds r4, r4, r0
	ldr r1, _0808C1D4  @ gUnknown_020237E8
	adds r0, r4, #0
	adds r2, r5, #0
	movs r3, #7
	bl TileMap_CopyRect
	b _0808C1FE
	.align 2, 0
_0808C1B8: .4byte gUnknown_02023016
_0808C1BC: .4byte gUnknown_02023816
_0808C1C0: .4byte gUnknown_08A018A6
_0808C1C4: .4byte gUnknown_08A01828
_0808C1C8: .4byte gBmFrameTmap0
_0808C1CC: .4byte gUnknown_02022FE8
_0808C1D0: .4byte gUnknown_0200422C
_0808C1D4: .4byte gUnknown_020237E8
_0808C1D8:
	ldr r0, _0808C224  @ gUnknown_02003FAC
	movs r4, #0xdf
	lsls r4, r4, #1
	subs r4, r4, r5
	lsls r4, r4, #1
	ldr r1, _0808C228  @ gBG0TilemapBuffer
	adds r1, r4, r1
	adds r2, r5, #0
	movs r3, #7
	bl TileMap_CopyRect
	ldr r0, _0808C22C  @ gUnknown_020044AC
	ldr r1, _0808C230  @ gBG1TilemapBuffer
	adds r4, r4, r1
	adds r1, r4, #0
	adds r2, r5, #0
	movs r3, #7
	bl TileMap_CopyRect
_0808C1FE:
	ldr r0, [r6, #0x58]
	adds r0, #1
	str r0, [r6, #0x58]
	cmp r0, #3
	bne _0808C21C
	movs r0, #0
	str r0, [r6, #0x58]
	adds r1, r6, #0
	adds r1, #0x55
	strb r0, [r1]
	adds r1, #1
	strb r0, [r1]
	adds r0, r6, #0
	bl Proc_Break
_0808C21C:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0808C224: .4byte gUnknown_02003FAC
_0808C228: .4byte gBG0TilemapBuffer
_0808C22C: .4byte gUnknown_020044AC
_0808C230: .4byte gBG1TilemapBuffer

	THUMB_FUNC_END sub_808C100

	THUMB_FUNC_START sub_808C234
sub_808C234: @ 0x0808C234
	push {lr}
	ldr r1, _0808C27C  @ gUnknown_08A01828
	adds r0, #0x50
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #3
	adds r1, r0, r1
	movs r0, #2
	ldrsb r0, [r1, r0]
	movs r2, #0x12
	cmp r0, #0
	bge _0808C250
	movs r2, #0
_0808C250:
	movs r0, #3
	ldrsb r0, [r1, r0]
	movs r1, #0xe
	cmp r0, #0
	bge _0808C25C
	movs r1, #0
_0808C25C:
	ldr r0, _0808C280  @ gBmFrameTmap0
	lsls r1, r1, #5
	adds r1, r1, r2
	lsls r1, r1, #1
	ldr r2, _0808C284  @ gBG0TilemapBuffer
	adds r1, r1, r2
	movs r2, #0xd
	movs r3, #6
	bl TileMap_CopyRect
	movs r0, #3
	bl BG_EnableSyncByMask
	pop {r0}
	bx r0
	.align 2, 0
_0808C27C: .4byte gUnknown_08A01828
_0808C280: .4byte gBmFrameTmap0
_0808C284: .4byte gBG0TilemapBuffer

	THUMB_FUNC_END sub_808C234

	THUMB_FUNC_START sub_808C288
sub_808C288: @ 0x0808C288
	push {lr}
	ldr r1, _0808C2C0  @ gUnknown_08A01828
	adds r0, #0x50
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #0x17
	cmp r0, #0
	bge _0808C2A6
	movs r1, #0
_0808C2A6:
	ldr r0, _0808C2C4  @ gUnknown_02003FAC
	lsls r1, r1, #1
	ldr r2, _0808C2C8  @ gUnknown_02022FE8
	adds r1, r1, r2
	movs r2, #7
	movs r3, #7
	bl TileMap_CopyRect
	movs r0, #3
	bl BG_EnableSyncByMask
	pop {r0}
	bx r0
	.align 2, 0
_0808C2C0: .4byte gUnknown_08A01828
_0808C2C4: .4byte gUnknown_02003FAC
_0808C2C8: .4byte gUnknown_02022FE8

	THUMB_FUNC_END sub_808C288

	THUMB_FUNC_START sub_808C2CC
sub_808C2CC: @ 0x0808C2CC
	push {r4, r5, lr}
	adds r5, r1, #0
	movs r4, #0
	cmp r0, #0x40
	beq _0808C2F8
	cmp r0, #0x40
	bgt _0808C2E0
	cmp r0, #0
	beq _0808C2E6
	b _0808C300
_0808C2E0:
	cmp r0, #0x80
	beq _0808C2F0
	b _0808C300
_0808C2E6:
	ldr r4, _0808C2EC  @ gUnknown_08A1738C
	b _0808C304
	.align 2, 0
_0808C2EC: .4byte gUnknown_08A1738C
_0808C2F0:
	ldr r4, _0808C2F4  @ gUnknown_08A173AC
	b _0808C304
	.align 2, 0
_0808C2F4: .4byte gUnknown_08A173AC
_0808C2F8:
	ldr r4, _0808C2FC  @ gUnknown_08A173CC
	b _0808C304
	.align 2, 0
_0808C2FC: .4byte gUnknown_08A173CC
_0808C300:
	bl nullsub_8
_0808C304:
	lsls r1, r5, #5
	adds r0, r4, #0
	movs r2, #0x20
	bl CopyToPaletteBuffer
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_808C2CC

	THUMB_FUNC_START sub_808C314
sub_808C314: @ 0x0808C314
	push {lr}
	ldr r0, _0808C330  @ gUnknown_0202BCB0
	movs r2, #0x14
	ldrsh r1, [r0, r2]
	lsls r1, r1, #4
	movs r2, #0xc
	ldrsh r0, [r0, r2]
	subs r1, r1, r0
	cmp r1, #0x6f
	ble _0808C334
	movs r0, #1
	negs r0, r0
	b _0808C336
	.align 2, 0
_0808C330: .4byte gUnknown_0202BCB0
_0808C334:
	movs r0, #1
_0808C336:
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_808C314

	THUMB_FUNC_START sub_808C33C
sub_808C33C: @ 0x0808C33C
	push {lr}
	ldr r0, _0808C354  @ gUnknown_0202BCB0
	movs r2, #0x14
	ldrsh r1, [r0, r2]
	lsls r1, r1, #4
	movs r2, #0xc
	ldrsh r0, [r0, r2]
	subs r1, r1, r0
	cmp r1, #0x70
	bgt _0808C358
	movs r0, #1
	b _0808C35C
	.align 2, 0
_0808C354: .4byte gUnknown_0202BCB0
_0808C358:
	movs r0, #1
	negs r0, r0
_0808C35C:
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_808C33C

	THUMB_FUNC_START sub_808C360
sub_808C360: @ 0x0808C360
	ldr r2, _0808C380  @ 0x00002120
	adds r0, r2, #0
	strh r0, [r1]
	ldr r3, _0808C384  @ 0x00002121
	adds r0, r3, #0
	strh r0, [r1, #2]
	movs r2, #0
	strh r2, [r1, #4]
	strh r2, [r1, #6]
	adds r3, #0x1d
	adds r0, r3, #0
	strh r0, [r1, #8]
	strh r2, [r1, #0xa]
	strh r2, [r1, #0xc]
	bx lr
	.align 2, 0
_0808C380: .4byte 0x00002120
_0808C384: .4byte 0x00002121

	THUMB_FUNC_END sub_808C360

	THUMB_FUNC_START sub_808C388
sub_808C388: @ 0x0808C388
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r4, _0808C3AC  @ 0x0000016F
	cmp r1, #0
	beq _0808C448
	adds r1, #0x30
	ldrb r0, [r1]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1c
	adds r6, r1, #0
	cmp r0, #0xd
	bhi _0808C41C
	lsls r0, r0, #2
	ldr r1, _0808C3B0  @ _0808C3B4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0808C3AC: .4byte 0x0000016F
_0808C3B0: .4byte _0808C3B4
_0808C3B4: @ jump table
	.4byte _0808C448 @ case 0
	.4byte _0808C3EC @ case 1
	.4byte _0808C3F0 @ case 2
	.4byte _0808C3F4 @ case 3
	.4byte _0808C3FA @ case 4
	.4byte _0808C400 @ case 5
	.4byte _0808C406 @ case 6
	.4byte _0808C40C @ case 7
	.4byte _0808C412 @ case 8
	.4byte _0808C448 @ case 9
	.4byte _0808C448 @ case 10
	.4byte _0808C418 @ case 11
	.4byte _0808C41C @ case 12
	.4byte _0808C418 @ case 13
_0808C3EC:
	movs r2, #0
	b _0808C41C
_0808C3F0:
	movs r2, #0xa0
	b _0808C41C
_0808C3F4:
	movs r2, #0xa0
	lsls r2, r2, #1
	b _0808C41C
_0808C3FA:
	movs r2, #0xf0
	lsls r2, r2, #1
	b _0808C41C
_0808C400:
	movs r2, #0xa0
	lsls r2, r2, #2
	b _0808C41C
_0808C406:
	movs r2, #0xc8
	lsls r2, r2, #2
	b _0808C41C
_0808C40C:
	movs r2, #0xf0
	lsls r2, r2, #2
	b _0808C41C
_0808C412:
	movs r2, #0x8c
	lsls r2, r2, #3
	b _0808C41C
_0808C418:
	movs r2, #0xa0
	lsls r2, r2, #3
_0808C41C:
	ldr r0, _0808C450  @ gUnknown_08A16DEC
	adds r0, r2, r0
	ldr r1, _0808C454  @ 0x06002DE0
	movs r2, #0x28
	bl CpuFastSet
	strh r4, [r5]
	adds r4, #1
	strh r4, [r5, #2]
	adds r4, #1
	strh r4, [r5, #4]
	adds r4, #1
	strh r4, [r5, #6]
	adds r4, #1
	strh r4, [r5, #8]
	movs r0, #0
	strh r0, [r5, #0xa]
	ldrb r0, [r6]
	lsrs r0, r0, #4
	ldr r1, _0808C458  @ 0x00001128
	adds r0, r0, r1
	strh r0, [r5, #0xc]
_0808C448:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0808C450: .4byte gUnknown_08A16DEC
_0808C454: .4byte 0x06002DE0
_0808C458: .4byte 0x00001128

	THUMB_FUNC_END sub_808C388

	THUMB_FUNC_START DrawMinimugBoxMaybe
DrawMinimugBoxMaybe: @ 0x0808C45C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r0, #0x44
	ldrh r2, [r0]
	adds r0, r5, #0
	adds r0, #0x30
	ldrb r1, [r0]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #0xa
	bne _0808C47A
	movs r2, #0
_0808C47A:
	lsls r1, r2, #0x10
	asrs r2, r1, #0x10
	movs r0, #0x3f
	ands r0, r2
	adds r6, r1, #0
	cmp r0, #0
	bne _0808C518
	movs r0, #0x40
	ands r0, r2
	cmp r0, #0
	beq _0808C4A0
	ldr r0, [r4, #0x40]
	adds r1, r5, #0
	bl sub_808C388
	movs r0, #1
	bl BG_EnableSyncByMask
	b _0808C518
_0808C4A0:
	adds r0, r5, #0
	bl GetUnitCurrentHp
	cmp r0, #0x63
	ble _0808C4B2
	movs r0, #0xff
	bl StoreNumberStringOrDashesToSmallBuffer
	b _0808C4BC
_0808C4B2:
	adds r0, r5, #0
	bl GetUnitCurrentHp
	bl StoreNumberStringOrDashesToSmallBuffer
_0808C4BC:
	ldr r1, _0808C4E4  @ gUnknown_02028E44
	ldrb r0, [r1, #6]
	subs r0, #0x30
	adds r2, r4, #0
	adds r2, #0x51
	strb r0, [r2]
	ldrb r0, [r1, #7]
	subs r0, #0x30
	adds r1, r4, #0
	adds r1, #0x52
	strb r0, [r1]
	adds r0, r5, #0
	bl GetUnitMaxHp
	cmp r0, #0x63
	ble _0808C4E8
	movs r0, #0xff
	bl StoreNumberStringOrDashesToSmallBuffer
	b _0808C4F2
	.align 2, 0
_0808C4E4: .4byte gUnknown_02028E44
_0808C4E8:
	adds r0, r5, #0
	bl GetUnitMaxHp
	bl StoreNumberStringOrDashesToSmallBuffer
_0808C4F2:
	ldr r1, _0808C5C4  @ gUnknown_02028E44
	ldrb r0, [r1, #6]
	subs r0, #0x30
	adds r2, r4, #0
	adds r2, #0x53
	strb r0, [r2]
	ldrb r0, [r1, #7]
	subs r0, #0x30
	adds r1, r4, #0
	adds r1, #0x54
	strb r0, [r1]
	ldr r1, [r4, #0x40]
	adds r0, r4, #0
	adds r2, r5, #0
	bl sub_808C360
	movs r0, #1
	bl BG_EnableSyncByMask
_0808C518:
	adds r0, r4, #0
	adds r0, #0x55
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _0808C5BA
	asrs r0, r6, #0x10
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0808C53E
	adds r0, r5, #0
	adds r0, #0x30
	ldrb r1, [r0]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #0
	bne _0808C5BA
_0808C53E:
	adds r0, r4, #0
	adds r0, #0x46
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r5, r0, #3
	adds r7, r5, #0
	adds r7, #0x11
	adds r0, r4, #0
	adds r0, #0x48
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r6, r0, #3
	adds r1, r4, #0
	adds r1, #0x51
	ldrb r0, [r1]
	cmp r0, #0xf0
	beq _0808C570
	ldr r2, _0808C5C8  @ gObject_8x8
	adds r3, r0, #0
	ldr r0, _0808C5CC  @ 0x000082E0
	adds r3, r3, r0
	adds r0, r7, #0
	adds r1, r6, #0
	bl CallARM_PushToSecondaryOAM
_0808C570:
	adds r0, r5, #0
	adds r0, #0x18
	ldr r7, _0808C5C8  @ gObject_8x8
	adds r1, r4, #0
	adds r1, #0x52
	ldrb r3, [r1]
	ldr r1, _0808C5CC  @ 0x000082E0
	mov r8, r1
	add r3, r8
	adds r1, r6, #0
	adds r2, r7, #0
	bl CallARM_PushToSecondaryOAM
	adds r1, r4, #0
	adds r1, #0x53
	ldrb r0, [r1]
	cmp r0, #0xf0
	beq _0808C5A6
	adds r0, r5, #0
	adds r0, #0x29
	ldrb r3, [r1]
	ldr r1, _0808C5CC  @ 0x000082E0
	adds r3, r3, r1
	adds r1, r6, #0
	adds r2, r7, #0
	bl CallARM_PushToSecondaryOAM
_0808C5A6:
	adds r0, r5, #0
	adds r0, #0x30
	adds r1, r4, #0
	adds r1, #0x54
	ldrb r3, [r1]
	add r3, r8
	adds r1, r6, #0
	adds r2, r7, #0
	bl CallARM_PushToSecondaryOAM
_0808C5BA:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808C5C4: .4byte gUnknown_02028E44
_0808C5C8: .4byte gObject_8x8
_0808C5CC: .4byte 0x000082E0

	THUMB_FUNC_END DrawMinimugBoxMaybe

	THUMB_FUNC_START InitMinimugBoxMaybe
InitMinimugBoxMaybe: @ 0x0808C5D0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r7, r0, #0
	mov r8, r1
	movs r0, #0
	mov sl, r0
	str r0, [sp, #4]
	ldr r1, _0808C688  @ gBmFrameTmap0
	mov r9, r1
	ldr r2, _0808C68C  @ 0x01000060
	add r0, sp, #4
	bl CpuFastSet
	mov r1, r8
	ldr r0, [r1]
	ldrh r0, [r0]
	bl GetStringFromIndex
	adds r6, r0, #0
	movs r0, #0x38
	adds r1, r6, #0
	bl GetStringTextCenteredPos
	adds r5, r0, #0
	adds r4, r7, #0
	adds r4, #0x2c
	adds r0, r4, #0
	bl Text_Clear
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #5
	bl Text_SetParameters
	adds r0, r4, #0
	adds r1, r6, #0
	bl Text_AppendString
	mov r1, r9
	adds r1, #0x4a
	adds r0, r4, #0
	bl Text_Draw
	mov r0, r8
	bl GetUnitMiniPortraitId
	adds r2, r0, #0
	mov r1, r8
	ldr r0, [r1, #0xc]
	movs r1, #0x80
	lsls r1, r1, #0x10
	ands r0, r1
	cmp r0, #0
	beq _0808C646
	adds r2, #1
_0808C646:
	mov r1, r9
	adds r1, #0x42
	mov r0, sl
	str r0, [sp]
	adds r0, r2, #0
	movs r2, #0xf0
	movs r3, #4
	bl sub_8005988
	mov r0, r9
	adds r0, #0xca
	str r0, [r7, #0x40]
	adds r0, r7, #0
	adds r0, #0x44
	mov r1, sl
	strh r1, [r0]
	ldr r2, _0808C690  @ gUnknown_08A01828
	adds r1, r7, #0
	adds r1, #0x50
	movs r0, #0
	ldrsb r0, [r1, r0]
	lsls r0, r0, #3
	adds r0, r0, r2
	ldrb r0, [r0, #2]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bge _0808C694
	adds r2, r7, #0
	adds r2, #0x46
	movs r0, #5
	b _0808C69A
	.align 2, 0
_0808C688: .4byte gBmFrameTmap0
_0808C68C: .4byte 0x01000060
_0808C690: .4byte gUnknown_08A01828
_0808C694:
	adds r2, r7, #0
	adds r2, #0x46
	movs r0, #0x17
_0808C69A:
	strh r0, [r2]
	ldr r0, _0808C6B8  @ gUnknown_08A01828
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	lsls r1, r1, #3
	adds r1, r1, r0
	movs r0, #3
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bge _0808C6BC
	adds r1, r7, #0
	adds r1, #0x48
	movs r0, #3
	b _0808C6C2
	.align 2, 0
_0808C6B8: .4byte gUnknown_08A01828
_0808C6BC:
	adds r1, r7, #0
	adds r1, #0x48
	movs r0, #0x11
_0808C6C2:
	strh r0, [r1]
	adds r0, r7, #0
	mov r1, r8
	bl DrawMinimugBoxMaybe
	ldr r0, _0808C704  @ gUnknown_02003E36
	movs r2, #0x8a
	lsls r2, r2, #5
	mov r1, r8
	bl sub_808BC94
	ldr r0, _0808C708  @ gUnknown_0200422C
	ldr r1, _0808C70C  @ gUnknown_08A17484
	movs r2, #0xc0
	lsls r2, r2, #6
	bl CallARM_FillTileRect
	mov r1, r8
	movs r0, #0xb
	ldrsb r0, [r1, r0]
	movs r1, #0xc0
	ands r0, r1
	movs r1, #3
	bl sub_808C2CC
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808C704: .4byte gUnknown_02003E36
_0808C708: .4byte gUnknown_0200422C
_0808C70C: .4byte gUnknown_08A17484

	THUMB_FUNC_END InitMinimugBoxMaybe

	THUMB_FUNC_START sub_808C710
sub_808C710: @ 0x0808C710
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	bl GetCameraMovementSpeedMaybe
	adds r1, r0, #0
	movs r2, #1
	cmp r4, #5
	ble _0808C734
	cmp r4, #0xb
	bgt _0808C736
	ldr r0, _0808C74C  @ gUnknown_08A01828
	lsls r1, r1, #3
	adds r1, r1, r0
	movs r0, #5
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bge _0808C736
_0808C734:
	movs r2, #4
_0808C736:
	cmp r5, #1
	bgt _0808C73C
	subs r2, #1
_0808C73C:
	cmp r5, #0x16
	ble _0808C742
	adds r2, #1
_0808C742:
	adds r0, r2, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0808C74C: .4byte gUnknown_08A01828

	THUMB_FUNC_END sub_808C710

	THUMB_FUNC_START sub_808C750
sub_808C750: @ 0x0808C750
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r7, r0, #0
	str r1, [sp]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	lsls r0, r0, #4
	ldr r2, _0808C8C4  @ gUnknown_0202BCB0
	movs r3, #0xc
	ldrsh r1, [r2, r3]
	subs r0, r0, r1
	cmp r0, #0
	bge _0808C774
	adds r0, #7
_0808C774:
	asrs r0, r0, #3
	mov sl, r0
	ldr r1, [sp]
	movs r0, #0x11
	ldrsb r0, [r1, r0]
	lsls r0, r0, #4
	movs r3, #0xe
	ldrsh r1, [r2, r3]
	subs r0, r0, r1
	cmp r0, #0
	bge _0808C78C
	adds r0, #7
_0808C78C:
	asrs r4, r0, #3
	mov r0, sl
	adds r1, r4, #0
	bl sub_808C710
	mov r8, r0
	ldr r0, _0808C8C8  @ gUnknown_08A01860
	add r0, r8
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	add sl, r0
	ldr r0, _0808C8CC  @ gUnknown_08A01866
	add r0, r8
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r4, r4, r0
	adds r0, r7, #0
	adds r0, #0x3c
	mov r1, sl
	strb r1, [r0]
	adds r0, #1
	strb r4, [r0]
	adds r1, r7, #0
	adds r1, #0x3e
	movs r0, #8
	strb r0, [r1]
	adds r1, #1
	movs r0, #5
	strb r0, [r1]
	ldr r2, [sp]
	ldr r0, [r2]
	ldrh r0, [r0]
	bl GetStringFromIndex
	mov r9, r0
	movs r0, #0x38
	mov r1, r9
	bl GetStringTextCenteredPos
	adds r6, r0, #0
	adds r5, r7, #0
	adds r5, #0x2c
	adds r0, r5, #0
	bl Text_Clear
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #5
	bl Text_SetParameters
	adds r0, r5, #0
	mov r1, r9
	bl Text_AppendString
	ldr r0, _0808C8D0  @ gUnknown_08A0184E
	add r0, r8
	movs r1, #0
	ldrsb r1, [r0, r1]
	adds r1, r4, r1
	lsls r1, r1, #5
	ldr r0, _0808C8D4  @ gUnknown_08A01848
	add r0, r8
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	add r0, sl
	adds r1, r1, r0
	lsls r1, r1, #1
	ldr r6, _0808C8D8  @ gBG0TilemapBuffer
	adds r1, r1, r6
	adds r0, r5, #0
	bl Text_Draw
	adds r1, r4, #3
	lsls r0, r1, #5
	adds r0, #1
	add r0, sl
	lsls r0, r0, #1
	adds r0, r0, r6
	str r0, [r7, #0x40]
	adds r0, r7, #0
	adds r0, #0x44
	movs r3, #0
	strh r3, [r0]
	mov r0, sl
	adds r0, #1
	adds r2, r7, #0
	adds r2, #0x46
	strh r0, [r2]
	adds r0, r7, #0
	adds r0, #0x48
	strh r1, [r0]
	adds r0, r7, #0
	ldr r1, [sp]
	bl DrawMinimugBoxMaybe
	lsls r0, r4, #5
	add r0, sl
	lsls r0, r0, #1
	ldr r5, _0808C8DC  @ gBG1TilemapBuffer
	adds r0, r0, r5
	ldr r1, _0808C8E0  @ gUnknown_08A0186C
	mov r2, r8
	lsls r2, r2, #2
	mov r8, r2
	add r1, r8
	ldr r1, [r1]
	movs r6, #0xc4
	lsls r6, r6, #6
	adds r2, r6, #0
	bl CallARM_FillTileRect
	adds r0, r4, #1
	lsls r0, r0, #5
	add r0, sl
	lsls r0, r0, #1
	adds r0, r0, r5
	ldr r1, _0808C8E4  @ gUnknown_08A17604
	adds r2, r6, #0
	bl CallARM_FillTileRect
	adds r4, #4
	lsls r4, r4, #5
	add r4, sl
	lsls r4, r4, #1
	adds r4, r4, r5
	ldr r0, _0808C8E8  @ gUnknown_08A01884
	add r8, r0
	mov r3, r8
	ldr r1, [r3]
	adds r0, r4, #0
	adds r2, r6, #0
	bl CallARM_FillTileRect
	movs r0, #3
	bl BG_EnableSyncByMask
	ldr r1, [sp]
	movs r0, #0xb
	ldrsb r0, [r1, r0]
	movs r1, #0xc0
	ands r0, r1
	movs r1, #3
	bl sub_808C2CC
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808C8C4: .4byte gUnknown_0202BCB0
_0808C8C8: .4byte gUnknown_08A01860
_0808C8CC: .4byte gUnknown_08A01866
_0808C8D0: .4byte gUnknown_08A0184E
_0808C8D4: .4byte gUnknown_08A01848
_0808C8D8: .4byte gBG0TilemapBuffer
_0808C8DC: .4byte gBG1TilemapBuffer
_0808C8E0: .4byte gUnknown_08A0186C
_0808C8E4: .4byte gUnknown_08A17604
_0808C8E8: .4byte gUnknown_08A01884

	THUMB_FUNC_END sub_808C750

	THUMB_FUNC_START sub_808C8EC
sub_808C8EC: @ 0x0808C8EC
	push {r4, r5, r6, r7, lr}
	adds r2, r0, #0
	ldrh r1, [r2, #0x3e]
	movs r0, #0xa1
	lsls r0, r0, #3
	cmp r1, r0
	bne _0808C956
	adds r7, r2, #0
	adds r7, #0x3d
	movs r0, #0
	ldrsb r0, [r7, r0]
	lsls r0, r0, #5
	adds r5, r2, #0
	adds r5, #0x3c
	movs r1, #0
	ldrsb r1, [r5, r1]
	adds r0, r0, r1
	lsls r0, r0, #1
	ldr r1, _0808C95C  @ gBG0TilemapBuffer
	adds r0, r0, r1
	adds r6, r2, #0
	adds r6, #0x3e
	movs r1, #0
	ldrsb r1, [r6, r1]
	adds r4, r2, #0
	adds r4, #0x3f
	movs r2, #0
	ldrsb r2, [r4, r2]
	movs r3, #0
	bl TileMap_FillRect
	movs r0, #0
	ldrsb r0, [r7, r0]
	lsls r0, r0, #5
	movs r1, #0
	ldrsb r1, [r5, r1]
	adds r0, r0, r1
	lsls r0, r0, #1
	ldr r1, _0808C960  @ gBG1TilemapBuffer
	adds r0, r0, r1
	movs r1, #0
	ldrsb r1, [r6, r1]
	movs r2, #0
	ldrsb r2, [r4, r2]
	movs r3, #0
	bl TileMap_FillRect
	movs r0, #3
	bl BG_EnableSyncByMask
	movs r0, #0
	strb r0, [r6]
	strb r0, [r4]
_0808C956:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808C95C: .4byte gBG0TilemapBuffer
_0808C960: .4byte gBG1TilemapBuffer

	THUMB_FUNC_END sub_808C8EC

	THUMB_FUNC_START sub_808C964
sub_808C964: @ 0x0808C964
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	adds r4, r0, #0
	ldr r0, _0808CA48  @ gUnknown_0202BCB0
	mov r9, r0
	movs r1, #0x16
	ldrsh r0, [r0, r1]
	ldr r1, _0808CA4C  @ gBmMapTerrain
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	mov r2, r9
	movs r3, #0x14
	ldrsh r1, [r2, r3]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r7, [r0]
	ldr r0, _0808CA50  @ gUnknown_02003FAC
	mov r8, r0
	movs r1, #0xe
	movs r2, #7
	movs r3, #0
	bl TileMap_FillRect
	ldr r0, _0808CA54  @ gUnknown_020044AC
	movs r1, #0xe
	movs r2, #7
	movs r3, #0
	bl TileMap_FillRect
	adds r0, r7, #0
	bl GetTerrainName
	adds r5, r0, #0
	movs r0, #0x28
	adds r1, r5, #0
	bl GetStringTextCenteredPos
	adds r6, r0, #0
	adds r4, #0x2c
	adds r0, r4, #0
	bl Text_Clear
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #0
	bl Text_SetParameters
	adds r0, r4, #0
	adds r1, r5, #0
	bl Text_AppendString
	mov r1, r8
	adds r1, #0x82
	adds r0, r4, #0
	bl Text_Draw
	movs r6, #0x81
	lsls r6, r6, #1
	add r6, r8
	ldr r1, _0808CA58  @ gUnknown_08A1768C
	movs r2, #0x84
	lsls r2, r2, #6
	adds r0, r6, #0
	bl CallARM_FillTileRect
	ldr r0, _0808CA5C  @ gUnknown_0880B90C
	adds r0, r7, r0
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	ble _0808CA3A
	ldr r0, _0808CA60  @ gUnknown_0880C4BA
	adds r0, r7, r0
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl StoreNumberStringToSmallBuffer
	movs r0, #0x85
	lsls r0, r0, #1
	add r0, r8
	ldr r4, _0808CA64  @ gUnknown_02028E44+7
	ldr r5, _0808CA68  @ 0x00002128
	adds r1, r4, #0
	adds r2, r5, #0
	movs r3, #2
	bl sub_8013138
	ldr r0, _0808CA6C  @ gUnknown_0880C479
	adds r0, r7, r0
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl StoreNumberStringToSmallBuffer
	movs r0, #0xa5
	lsls r0, r0, #1
	add r0, r8
	adds r1, r4, #0
	adds r2, r5, #0
	movs r3, #2
	bl sub_8013138
_0808CA3A:
	cmp r7, #0x29
	bgt _0808CA70
	cmp r7, #0x27
	bge _0808CAD8
	cmp r7, #0x1b
	beq _0808CA74
	b _0808CB06
	.align 2, 0
_0808CA48: .4byte gUnknown_0202BCB0
_0808CA4C: .4byte gBmMapTerrain
_0808CA50: .4byte gUnknown_02003FAC
_0808CA54: .4byte gUnknown_020044AC
_0808CA58: .4byte gUnknown_08A1768C
_0808CA5C: .4byte gUnknown_0880B90C
_0808CA60: .4byte gUnknown_0880C4BA
_0808CA64: .4byte gUnknown_02028E44+7
_0808CA68: .4byte 0x00002128
_0808CA6C: .4byte gUnknown_0880C479
_0808CA70:
	cmp r7, #0x33
	bne _0808CB06
_0808CA74:
	ldr r4, _0808CAA8  @ gUnknown_020040AE
	ldr r1, _0808CAAC  @ gUnknown_08A176A4
	movs r2, #0x84
	lsls r2, r2, #6
	adds r0, r4, #0
	bl CallARM_FillTileRect
	ldr r1, _0808CAB0  @ gUnknown_0202BCB0
	movs r2, #0x14
	ldrsh r0, [r1, r2]
	movs r3, #0x16
	ldrsh r1, [r1, r3]
	bl GetObstacleHpAt
	adds r6, r0, #0
	cmp r6, #0x64
	bne _0808CAB8
	adds r0, r4, #0
	adds r0, #0x46
	ldr r1, _0808CAB4  @ gUnknown_08A176B4
	movs r2, #0x80
	lsls r2, r2, #1
	bl CallARM_FillTileRect
	b _0808CB06
	.align 2, 0
_0808CAA8: .4byte gUnknown_020040AE
_0808CAAC: .4byte gUnknown_08A176A4
_0808CAB0: .4byte gUnknown_0202BCB0
_0808CAB4: .4byte gUnknown_08A176B4
_0808CAB8:
	adds r0, r6, #0
	bl StoreNumberStringToSmallBuffer
	adds r0, r4, #0
	adds r0, #0x48
	ldr r1, _0808CAD0  @ gUnknown_02028E44+7
	ldr r2, _0808CAD4  @ 0x00002128
	movs r3, #2
	bl sub_8013138
	b _0808CB06
	.align 2, 0
_0808CAD0: .4byte gUnknown_02028E44+7
_0808CAD4: .4byte 0x00002128
_0808CAD8:
	ldr r1, _0808CB20  @ gUnknown_08A1769C
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r6, #0
	bl CallARM_FillTileRect
	mov r1, r9
	movs r2, #0x14
	ldrsh r0, [r1, r2]
	movs r3, #0x16
	ldrsh r1, [r1, r3]
	bl GetObstacleHpAt
	bl StoreNumberStringToSmallBuffer
	movs r0, #0x85
	lsls r0, r0, #1
	add r0, r8
	ldr r1, _0808CB24  @ gUnknown_02028E44+7
	ldr r2, _0808CB28  @ 0x00002128
	movs r3, #2
	bl sub_8013138
_0808CB06:
	ldr r0, _0808CB2C  @ gUnknown_020044EC
	ldr r1, _0808CB30  @ gUnknown_08A1742C
	movs r2, #0x80
	lsls r2, r2, #5
	bl CallARM_FillTileRect
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808CB20: .4byte gUnknown_08A1769C
_0808CB24: .4byte gUnknown_02028E44+7
_0808CB28: .4byte 0x00002128
_0808CB2C: .4byte gUnknown_020044EC
_0808CB30: .4byte gUnknown_08A1742C

	THUMB_FUNC_END sub_808C964

	THUMB_FUNC_START sub_808CB34
sub_808CB34: @ 0x0808CB34
	push {lr}
	adds r2, r0, #0
	adds r1, r2, #0
	adds r1, #0x57
	movs r0, #0xff
	strb r0, [r1]
	subs r1, #1
	movs r0, #0
	strb r0, [r1]
	str r0, [r2, #0x58]
	subs r1, #6
	movs r0, #1
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x2c
	movs r1, #5
	bl Text_Allocate
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_808CB34

	THUMB_FUNC_START sub_808CB5C
sub_808CB5C: @ 0x0808CB5C
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r1, r5, #0
	adds r1, #0x55
	movs r0, #1
	strb r0, [r1]
	bl GetCameraMovementSpeedMaybe
	adds r1, r5, #0
	adds r1, #0x50
	strb r0, [r1]
	ldr r0, _0808CBF0  @ gUnknown_08A01828
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	lsls r1, r1, #3
	adds r1, r1, r0
	movs r0, #0
	ldrsb r0, [r1, r0]
	ldrb r1, [r1, #1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl sub_808BBAC
	adds r6, r0, #0
	ldr r0, _0808CBF4  @ gUnknown_08A0190C
	bl Proc_Find
	adds r4, r0, #0
	cmp r4, #0
	beq _0808CBAA
	adds r1, r4, #0
	adds r1, #0x57
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	blt _0808CBAA
	cmp r0, r6
	beq _0808CBE8
_0808CBAA:
	ldr r0, _0808CBF8  @ gUnknown_08A019E4
	bl Proc_Find
	cmp r4, #0
	beq _0808CBC4
	adds r1, r0, #0
	adds r1, #0x57
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	blt _0808CBC4
	cmp r0, r6
	beq _0808CBE8
_0808CBC4:
	adds r0, r5, #0
	adds r0, #0x57
	strb r6, [r0]
	adds r0, r5, #0
	bl sub_808C964
	ldr r0, _0808CBFC  @ gUnknown_0202BCB0
	ldrh r1, [r0, #0x14]
	adds r2, r5, #0
	adds r2, #0x4e
	strb r1, [r2]
	ldrh r0, [r0, #0x16]
	adds r1, r5, #0
	adds r1, #0x4f
	strb r0, [r1]
	adds r0, r5, #0
	bl Proc_Break
_0808CBE8:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0808CBF0: .4byte gUnknown_08A01828
_0808CBF4: .4byte gUnknown_08A0190C
_0808CBF8: .4byte gUnknown_08A019E4
_0808CBFC: .4byte gUnknown_0202BCB0

	THUMB_FUNC_END sub_808CB5C

	THUMB_FUNC_START sub_808CC00
sub_808CC00: @ 0x0808CC00
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r3, r4, #0
	adds r3, #0x4e
	ldrb r0, [r3]
	adds r2, r4, #0
	adds r2, #0x4c
	strb r0, [r2]
	movs r0, #0x4f
	adds r0, r0, r4
	mov ip, r0
	ldrb r0, [r0]
	adds r1, r4, #0
	adds r1, #0x4d
	strb r0, [r1]
	ldr r1, _0808CC80  @ gUnknown_0202BCB0
	ldrh r0, [r1, #0x14]
	strb r0, [r3]
	ldrh r0, [r1, #0x16]
	mov r1, ip
	strb r0, [r1]
	ldrh r0, [r3]
	ldrh r2, [r2]
	cmp r0, r2
	beq _0808CC9A
	ldr r0, _0808CC84  @ gUnknown_0859A548
	bl Proc_Find
	cmp r0, #0
	bne _0808CC8C
	bl GetCameraMovementSpeedMaybe
	adds r2, r0, #0
	adds r0, r4, #0
	adds r0, #0x50
	movs r3, #0
	ldrsb r3, [r0, r3]
	cmp r2, r3
	beq _0808CC70
	ldr r1, _0808CC88  @ gUnknown_08A01828
	lsls r0, r2, #3
	adds r5, r0, r1
	lsls r0, r3, #3
	adds r2, r0, r1
	movs r1, #0
	ldrsb r1, [r5, r1]
	movs r0, #0
	ldrsb r0, [r2, r0]
	cmp r1, r0
	bne _0808CC8C
	movs r1, #1
	ldrsb r1, [r5, r1]
	movs r0, #1
	ldrsb r0, [r2, r0]
	cmp r1, r0
	bne _0808CC8C
_0808CC70:
	adds r0, r4, #0
	bl sub_808C964
	adds r0, r4, #0
	bl sub_808C288
	b _0808CC9A
	.align 2, 0
_0808CC80: .4byte gUnknown_0202BCB0
_0808CC84: .4byte gUnknown_0859A548
_0808CC88: .4byte gUnknown_08A01828
_0808CC8C:
	adds r1, r4, #0
	adds r1, #0x56
	movs r0, #1
	strb r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
_0808CC9A:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_808CC00

	THUMB_FUNC_START sub_808CCA0
sub_808CCA0: @ 0x0808CCA0
	push {r4, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x57
	movs r0, #0xff
	strb r0, [r1]
	adds r0, r4, #0
	adds r0, #0x2c
	movs r1, #7
	bl Text_Allocate
	movs r1, #0
	str r1, [r4, #0x58]
	adds r0, r4, #0
	adds r0, #0x56
	strb r1, [r0]
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_808CCA0

	THUMB_FUNC_START Loop6CUI1_Hidden
Loop6CUI1_Hidden: @ 0x0808CCC8
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r2, _0808CD64  @ gUnknown_0202BCB0
	movs r1, #0x16
	ldrsh r0, [r2, r1]
	ldr r1, _0808CD68  @ gBmMapUnit
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r3, #0x14
	ldrsh r1, [r2, r3]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	bl GetUnit
	adds r6, r0, #0
	cmp r6, #0
	beq _0808CD5C
	adds r1, r4, #0
	adds r1, #0x55
	movs r0, #1
	strb r0, [r1]
	bl GetCameraMovementSpeedMaybe
	adds r1, r4, #0
	adds r1, #0x50
	strb r0, [r1]
	ldr r0, _0808CD6C  @ gUnknown_08A01828
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	lsls r1, r1, #3
	adds r1, r1, r0
	movs r0, #2
	ldrsb r0, [r1, r0]
	ldrb r1, [r1, #3]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl sub_808BBAC
	adds r5, r0, #0
	ldr r0, _0808CD70  @ gUnknown_08A018AC
	bl Proc_Find
	cmp r0, #0
	beq _0808CD36
	adds r1, r0, #0
	adds r1, #0x57
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	blt _0808CD36
	cmp r0, r5
	beq _0808CD5C
_0808CD36:
	adds r0, r4, #0
	adds r0, #0x57
	strb r5, [r0]
	ldr r0, _0808CD64  @ gUnknown_0202BCB0
	ldrh r1, [r0, #0x14]
	adds r2, r4, #0
	adds r2, #0x4e
	strb r1, [r2]
	ldrh r0, [r0, #0x16]
	adds r1, r4, #0
	adds r1, #0x4f
	strb r0, [r1]
	adds r0, r4, #0
	adds r1, r6, #0
	bl InitMinimugBoxMaybe
	adds r0, r4, #0
	bl Proc_Break
_0808CD5C:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0808CD64: .4byte gUnknown_0202BCB0
_0808CD68: .4byte gBmMapUnit
_0808CD6C: .4byte gUnknown_08A01828
_0808CD70: .4byte gUnknown_08A018AC

	THUMB_FUNC_END Loop6CUI1_Hidden

	THUMB_FUNC_START Loop6CUI1_Displayed
Loop6CUI1_Displayed: @ 0x0808CD74
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r6, _0808CE2C  @ gUnknown_0202BCB0
	movs r1, #0x16
	ldrsh r0, [r6, r1]
	ldr r1, _0808CE30  @ gBmMapUnit
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r2, #0x14
	ldrsh r1, [r6, r2]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	bl GetUnit
	adds r7, r0, #0
	adds r4, r5, #0
	adds r4, #0x44
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
	adds r0, r5, #0
	adds r1, r7, #0
	bl DrawMinimugBoxMaybe
	ldrh r1, [r4]
	movs r0, #0x3f
	ands r0, r1
	cmp r0, #0
	bne _0808CDB8
	adds r0, r5, #0
	bl sub_808C234
_0808CDB8:
	adds r3, r5, #0
	adds r3, #0x4e
	ldrb r0, [r3]
	adds r1, r5, #0
	adds r1, #0x4c
	strb r0, [r1]
	adds r4, r5, #0
	adds r4, #0x4f
	ldrb r0, [r4]
	adds r2, r5, #0
	adds r2, #0x4d
	strb r0, [r2]
	ldrh r0, [r6, #0x14]
	strb r0, [r3]
	ldrh r0, [r6, #0x16]
	strb r0, [r4]
	ldrh r0, [r3]
	ldrh r1, [r1]
	cmp r0, r1
	beq _0808CE4A
	cmp r7, #0
	beq _0808CE3C
	ldr r0, _0808CE34  @ gUnknown_0859A548
	bl Proc_Find
	cmp r0, #0
	bne _0808CE3C
	bl GetCameraMovementSpeedMaybe
	adds r2, r0, #0
	adds r0, r5, #0
	adds r0, #0x50
	movs r3, #0
	ldrsb r3, [r0, r3]
	cmp r2, r3
	beq _0808CE22
	ldr r1, _0808CE38  @ gUnknown_08A01828
	lsls r0, r2, #3
	adds r4, r0, r1
	lsls r0, r3, #3
	adds r2, r0, r1
	movs r1, #2
	ldrsb r1, [r4, r1]
	movs r0, #2
	ldrsb r0, [r2, r0]
	cmp r1, r0
	bne _0808CE3C
	movs r1, #3
	ldrsb r1, [r4, r1]
	movs r0, #3
	ldrsb r0, [r2, r0]
	cmp r1, r0
	bne _0808CE3C
_0808CE22:
	adds r0, r5, #0
	movs r1, #1
	bl Proc_Goto
	b _0808CE4A
	.align 2, 0
_0808CE2C: .4byte gUnknown_0202BCB0
_0808CE30: .4byte gBmMapUnit
_0808CE34: .4byte gUnknown_0859A548
_0808CE38: .4byte gUnknown_08A01828
_0808CE3C:
	adds r1, r5, #0
	adds r1, #0x56
	movs r0, #1
	strb r0, [r1]
	adds r0, r5, #0
	bl Proc_Break
_0808CE4A:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END Loop6CUI1_Displayed

	THUMB_FUNC_START sub_808CE50
sub_808CE50: @ 0x0808CE50
	push {r4, lr}
	adds r4, r0, #0
	ldr r2, _0808CE80  @ gUnknown_0202BCB0
	movs r1, #0x16
	ldrsh r0, [r2, r1]
	ldr r1, _0808CE84  @ gBmMapUnit
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r3, #0x14
	ldrsh r1, [r2, r3]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	bl GetUnit
	adds r1, r0, #0
	cmp r1, #0
	bne _0808CE88
	adds r0, r4, #0
	movs r1, #3
	bl Proc_Goto
	b _0808CE94
	.align 2, 0
_0808CE80: .4byte gUnknown_0202BCB0
_0808CE84: .4byte gBmMapUnit
_0808CE88:
	adds r0, r4, #0
	bl InitMinimugBoxMaybe
	adds r0, r4, #0
	bl sub_808C234
_0808CE94:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_808CE50

	THUMB_FUNC_START Init6CUI2
Init6CUI2: @ 0x0808CE9C
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	movs r1, #7
	bl Text_Allocate
	adds r0, r4, #0
	adds r0, #0x4b
	movs r1, #0
	strb r1, [r0]
	adds r0, #0xa
	strb r1, [r0]
	str r1, [r4, #0x58]
	subs r0, #0x17
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #0x17
	strb r1, [r0]
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END Init6CUI2

	THUMB_FUNC_START Loop6CUI2
Loop6CUI2: @ 0x0808CEC8
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r4, #0
	adds r5, #0x4b
	ldrb r0, [r5]
	adds r3, r4, #0
	adds r3, #0x4a
	strb r0, [r3]
	ldr r2, _0808CF0C  @ gUnknown_0202BCB0
	movs r1, #0x16
	ldrsh r0, [r2, r1]
	ldr r1, _0808CF10  @ gBmMapUnit
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r6, #0x14
	ldrsh r1, [r2, r6]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	strb r0, [r5]
	ldrb r1, [r3]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r1, r0
	beq _0808CF14
	cmp r1, #0
	beq _0808CF14
	adds r0, r4, #0
	bl sub_808C8EC
	movs r0, #0
	str r0, [r4, #0x58]
	b _0808CFBC
	.align 2, 0
_0808CF0C: .4byte gUnknown_0202BCB0
_0808CF10: .4byte gBmMapUnit
_0808CF14:
	adds r0, r4, #0
	adds r0, #0x4b
	ldrb r1, [r0]
	adds r6, r0, #0
	cmp r1, #0
	beq _0808CFBC
	ldr r0, _0808CF64  @ gUnknown_0859A548
	bl Proc_Find
	cmp r0, #0
	bne _0808CFBC
	ldr r0, _0808CF68  @ gUnknown_08A018AC
	bl Proc_Find
	adds r5, r0, #0
	cmp r5, #0
	beq _0808CF42
	adds r0, #0x55
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _0808CF58
_0808CF42:
	ldr r0, _0808CF6C  @ gUnknown_08A019E4
	bl Proc_Find
	cmp r0, #0
	beq _0808CF70
	adds r0, #0x55
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0808CF70
_0808CF58:
	ldr r0, [r4, #0x58]
	cmp r0, #3
	bgt _0808CFBC
	adds r0, #1
	str r0, [r4, #0x58]
	b _0808CFBC
	.align 2, 0
_0808CF64: .4byte gUnknown_0859A548
_0808CF68: .4byte gUnknown_08A018AC
_0808CF6C: .4byte gUnknown_08A019E4
_0808CF70:
	ldr r0, [r4, #0x58]
	adds r0, #1
	str r0, [r4, #0x58]
	cmp r0, #7
	ble _0808CFBC
	cmp r0, #8
	bne _0808CF8E
	ldrb r0, [r6]
	bl GetUnit
	adds r1, r0, #0
	adds r0, r4, #0
	bl sub_808C750
	b _0808CFBC
_0808CF8E:
	adds r1, r4, #0
	adds r1, #0x44
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	cmp r5, #0
	beq _0808CFA6
	adds r0, r5, #0
	adds r0, #0x55
	ldrb r0, [r0]
	adds r1, #0x11
	b _0808CFAC
_0808CFA6:
	adds r1, r4, #0
	adds r1, #0x55
	movs r0, #0
_0808CFAC:
	strb r0, [r1]
	ldrb r0, [r6]
	bl GetUnit
	adds r1, r0, #0
	adds r0, r4, #0
	bl DrawMinimugBoxMaybe
_0808CFBC:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END Loop6CUI2

	THUMB_FUNC_START InitPlayerPhaseInterfaceMaybe
InitPlayerPhaseInterfaceMaybe: @ 0x0808CFC4
	push {r4, lr}
	sub sp, #4
	ldr r2, _0808D0A8  @ gLCDControlBuffer
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
	movs r1, #0xd
	movs r2, #3
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	movs r0, #0
	str r0, [sp]
	movs r1, #1
	movs r2, #0
	movs r3, #0
	bl sub_8001ED0
	movs r0, #0
	bl sub_8001F48
	movs r0, #1
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #1
	movs r3, #1
	bl sub_8001F0C
	ldr r0, _0808D0AC  @ gUnknown_08A167C8
	ldr r1, _0808D0B0  @ 0x06002000
	bl CopyDataWithPossibleUncomp
	ldr r0, _0808D0B4  @ gUnknown_08A16D6C
	ldr r1, _0808D0B8  @ 0x06015C00
	bl CopyDataWithPossibleUncomp
	ldr r0, _0808D0BC  @ 0x06002EA0
	ldr r1, _0808D0C0  @ 0x06015D40
	movs r2, #8
	bl CpuFastSet
	ldr r0, _0808D0C4  @ gPaletteBuffer
	movs r1, #0xc0
	lsls r1, r1, #2
	movs r2, #0x20
	bl CopyToPaletteBuffer
	movs r0, #1
	movs r1, #2
	bl LoadIconPalette
	bl sub_8003D20
	ldr r4, _0808D0C8  @ gRAMChapterData
	adds r0, r4, #0
	adds r0, #0x40
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0808D092
	ldr r0, _0808D0CC  @ gUnknown_08A018AC
	movs r1, #3
	bl Proc_Start
_0808D092:
	ldr r0, _0808D0D0  @ gUnknown_0202BCB0
	ldrb r1, [r0, #4]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _0808D0D8
	ldr r0, _0808D0D4  @ gUnknown_08A01A44
	movs r1, #3
	bl Proc_Start
	b _0808D0F8
	.align 2, 0
_0808D0A8: .4byte gLCDControlBuffer
_0808D0AC: .4byte gUnknown_08A167C8
_0808D0B0: .4byte 0x06002000
_0808D0B4: .4byte gUnknown_08A16D6C
_0808D0B8: .4byte 0x06015C00
_0808D0BC: .4byte 0x06002EA0
_0808D0C0: .4byte 0x06015D40
_0808D0C4: .4byte gPaletteBuffer
_0808D0C8: .4byte gRAMChapterData
_0808D0CC: .4byte gUnknown_08A018AC
_0808D0D0: .4byte gUnknown_0202BCB0
_0808D0D4: .4byte gUnknown_08A01A44
_0808D0D8:
	adds r0, r4, #0
	adds r0, #0x42
	ldrb r0, [r0]
	lsls r0, r0, #0x1f
	cmp r0, #0
	bne _0808D0F8
	movs r0, #0x66
	bl CheckEventId
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0808D0F8
	ldr r0, _0808D12C  @ gUnknown_08A019E4
	movs r1, #3
	bl Proc_Start
_0808D0F8:
	ldr r0, _0808D130  @ gRAMChapterData
	adds r4, r0, #0
	adds r4, #0x40
	ldrb r0, [r4]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1e
	cmp r0, #0
	bne _0808D110
	ldr r0, _0808D134  @ gUnknown_08A0190C
	movs r1, #3
	bl Proc_Start
_0808D110:
	ldrb r0, [r4]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1e
	cmp r0, #1
	bne _0808D122
	ldr r0, _0808D138  @ gUnknown_08A01994
	movs r1, #3
	bl Proc_Start
_0808D122:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808D12C: .4byte gUnknown_08A019E4
_0808D130: .4byte gRAMChapterData
_0808D134: .4byte gUnknown_08A0190C
_0808D138: .4byte gUnknown_08A01994

	THUMB_FUNC_END InitPlayerPhaseInterfaceMaybe

	THUMB_FUNC_START New6CPPInterfaceConstructor
New6CPPInterfaceConstructor: @ 0x0808D13C
	push {lr}
	ldr r0, _0808D14C  @ gUnknown_08A019C4
	movs r1, #3
	bl Proc_Start
	pop {r0}
	bx r0
	.align 2, 0
_0808D14C: .4byte gUnknown_08A019C4

	THUMB_FUNC_END New6CPPInterfaceConstructor

	THUMB_FUNC_START DeletePlayerPhaseInterface6Cs
DeletePlayerPhaseInterface6Cs: @ 0x0808D150
	push {lr}
	ldr r0, _0808D17C  @ gUnknown_08A0190C
	bl Proc_EndEach
	ldr r0, _0808D180  @ gUnknown_08A01994
	bl Proc_EndEach
	ldr r0, _0808D184  @ gUnknown_08A018AC
	bl Proc_EndEach
	ldr r0, _0808D188  @ gUnknown_08A019E4
	bl Proc_EndEach
	ldr r0, _0808D18C  @ gUnknown_08A01A44
	bl Proc_EndEach
	bl SetDefaultColorEffects
	bl ClearBg0Bg1
	pop {r0}
	bx r0
	.align 2, 0
_0808D17C: .4byte gUnknown_08A0190C
_0808D180: .4byte gUnknown_08A01994
_0808D184: .4byte gUnknown_08A018AC
_0808D188: .4byte gUnknown_08A019E4
_0808D18C: .4byte gUnknown_08A01A44

	THUMB_FUNC_END DeletePlayerPhaseInterface6Cs

	THUMB_FUNC_START sub_808D190
sub_808D190: @ 0x0808D190
	push {lr}
	ldr r0, _0808D1A8  @ gUnknown_0202BCB0
	movs r2, #0x16
	ldrsh r1, [r0, r2]
	lsls r1, r1, #4
	movs r2, #0xe
	ldrsh r0, [r0, r2]
	subs r1, r1, r0
	cmp r1, #0x40
	bgt _0808D1AC
	movs r0, #0
	b _0808D1AE
	.align 2, 0
_0808D1A8: .4byte gUnknown_0202BCB0
_0808D1AC:
	movs r0, #1
_0808D1AE:
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_808D190

	THUMB_FUNC_START sub_808D1B4
sub_808D1B4: @ 0x0808D1B4
	push {lr}
	bl sub_808D190
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0808D1DC
	bl sub_808C314
	movs r1, #1
	negs r1, r1
	cmp r0, r1
	bne _0808D1D0
	movs r0, #2
	b _0808D1FA
_0808D1D0:
	bl sub_808C314
	cmp r0, #1
	bne _0808D1F8
	movs r0, #1
	b _0808D1FA
_0808D1DC:
	bl sub_808C33C
	movs r1, #1
	negs r1, r1
	cmp r0, r1
	bne _0808D1EC
	movs r0, #4
	b _0808D1FA
_0808D1EC:
	bl sub_808C33C
	cmp r0, #1
	bne _0808D1F8
	movs r0, #3
	b _0808D1FA
_0808D1F8:
	movs r0, #0
_0808D1FA:
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_808D1B4

	THUMB_FUNC_START sub_808D200
sub_808D200: @ 0x0808D200
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	ldr r7, _0808D278  @ gUnknown_020044D4
	adds r0, r7, #0
	movs r1, #0xb
	movs r2, #9
	movs r3, #0
	bl TileMap_FillRect
	ldr r6, _0808D27C  @ gUnknown_02004054
	adds r0, r6, #0
	movs r1, #0xb
	movs r2, #9
	movs r3, #0
	bl TileMap_FillRect
	adds r5, r4, #0
	adds r5, #0x44
	movs r1, #0
	ldrsh r0, [r5, r1]
	cmp r0, #0
	bne _0808D244
	ldr r1, _0808D280  @ gUnknown_08A17744
	movs r2, #0x80
	lsls r2, r2, #5
	adds r0, r7, #0
	bl CallARM_FillTileRect
	adds r0, r4, #0
	adds r0, #0x2c
	adds r1, r6, #0
	adds r1, #0x42
	bl Text_Draw
_0808D244:
	movs r1, #0
	ldrsh r0, [r5, r1]
	cmp r0, #1
	bne _0808D270
	ldr r1, _0808D284  @ gUnknown_08A176BC
	movs r2, #0x80
	lsls r2, r2, #5
	adds r0, r7, #0
	bl CallARM_FillTileRect
	adds r0, r4, #0
	adds r0, #0x2c
	adds r1, r6, #0
	adds r1, #0x42
	bl Text_Draw
	adds r0, r4, #0
	adds r0, #0x34
	adds r1, r6, #0
	adds r1, #0xc2
	bl Text_Draw
_0808D270:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808D278: .4byte gUnknown_020044D4
_0808D27C: .4byte gUnknown_02004054
_0808D280: .4byte gUnknown_08A17744
_0808D284: .4byte gUnknown_08A176BC

	THUMB_FUNC_END sub_808D200

	THUMB_FUNC_START Init6CPI
Init6CPI: @ 0x0808D288
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	movs r1, #0
	str r1, [r6, #0x58]
	adds r0, #0x56
	strb r1, [r0]
	subs r0, #6
	strb r1, [r0]
	adds r1, r6, #0
	adds r1, #0x57
	movs r0, #0xff
	strb r0, [r1]
	adds r5, r6, #0
	adds r5, #0x2c
	adds r0, r5, #0
	movs r1, #8
	bl Text_Init
	adds r4, r6, #0
	adds r4, #0x34
	adds r0, r4, #0
	movs r1, #8
	bl Text_Init
	adds r0, r6, #0
	bl NewGreenTextColorManager
	adds r0, r5, #0
	bl Text_Clear
	adds r0, r4, #0
	bl Text_Clear
	bl GetChapterThing
	cmp r0, #2
	beq _0808D2E8
	ldr r0, _0808D2E4  @ gRAMChapterData
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetROMChapterStruct
	adds r0, #0x8a
	ldrh r0, [r0]
	b _0808D2EC
	.align 2, 0
_0808D2E4: .4byte gRAMChapterData
_0808D2E8:
	movs r0, #0xcf
	lsls r0, r0, #1
_0808D2EC:
	bl GetStringFromIndex
	adds r5, r0, #0
	adds r4, r6, #0
	adds r4, #0x2c
	movs r0, #0x40
	adds r1, r5, #0
	bl GetStringTextCenteredPos
	adds r1, r0, #0
	adds r0, r4, #0
	movs r2, #0
	adds r3, r5, #0
	bl Text_InsertString
	bl GetChapterThing
	cmp r0, #2
	beq _0808D328
	ldr r0, _0808D324  @ gRAMChapterData
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetROMChapterStruct
	adds r0, #0x8c
	ldrb r0, [r0]
	b _0808D32A
	.align 2, 0
_0808D324: .4byte gRAMChapterData
_0808D328:
	movs r0, #1
_0808D32A:
	cmp r0, #4
	bls _0808D330
	b _0808D476
_0808D330:
	lsls r0, r0, #2
	ldr r1, _0808D33C  @ _0808D340
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0808D33C: .4byte _0808D340
_0808D340: @ jump table
	.4byte _0808D354 @ case 0
	.4byte _0808D35C @ case 1
	.4byte _0808D3B0 @ case 2
	.4byte _0808D354 @ case 3
	.4byte _0808D354 @ case 4
_0808D354:
	adds r1, r6, #0
	adds r1, #0x44
	movs r0, #0
	b _0808D474
_0808D35C:
	adds r4, r6, #0
	adds r4, #0x34
	ldr r0, _0808D390  @ 0x000001C1
	bl GetStringFromIndex
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x10
	movs r2, #0
	bl Text_InsertString
	ldr r0, _0808D394  @ gRAMChapterData
	ldrb r0, [r0, #0xd]
	cmp r0, #0
	beq _0808D39C
	ldr r0, _0808D398  @ 0x00000535
	bl GetStringFromIndex
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x28
	movs r2, #1
	bl Text_InsertString
	b _0808D46E
	.align 2, 0
_0808D390: .4byte 0x000001C1
_0808D394: .4byte gRAMChapterData
_0808D398: .4byte 0x00000535
_0808D39C:
	movs r0, #0x80
	bl CountUnitsByFaction
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x30
	movs r2, #2
	bl Text_InsertNumberOr2Dashes
	b _0808D46E
_0808D3B0:
	ldr r4, _0808D3D0  @ gRAMChapterData
	ldrh r5, [r4, #0x10]
	bl GetChapterThing
	cmp r0, #2
	beq _0808D3D4
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	bl GetROMChapterStruct
	adds r0, #0x8d
	ldrb r0, [r0]
	subs r0, #1
	cmp r5, r0
	bge _0808D3DC
	b _0808D404
	.align 2, 0
_0808D3D0: .4byte gRAMChapterData
_0808D3D4:
	movs r0, #1
	negs r0, r0
	cmp r5, r0
	blt _0808D404
_0808D3DC:
	ldr r0, _0808D400  @ 0x000001C3
	bl GetStringFromIndex
	adds r5, r0, #0
	adds r4, r6, #0
	adds r4, #0x34
	movs r0, #0x40
	adds r1, r5, #0
	bl GetStringTextCenteredPos
	adds r1, r0, #0
	adds r0, r4, #0
	movs r2, #4
	adds r3, r5, #0
	bl Text_InsertString
	b _0808D46E
	.align 2, 0
_0808D400: .4byte 0x000001C3
_0808D404:
	adds r4, r6, #0
	adds r4, #0x34
	ldr r7, _0808D444  @ gRAMChapterData
	ldrh r3, [r7, #0x10]
	adds r0, r4, #0
	movs r1, #0xa
	movs r2, #2
	bl Text_InsertNumberOr2Dashes
	ldr r0, _0808D448  @ 0x00000539
	bl GetStringFromIndex
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x12
	movs r2, #0
	bl Text_InsertString
	bl GetChapterThing
	adds r5, r4, #0
	cmp r0, #2
	beq _0808D44C
	movs r0, #0xe
	ldrsb r0, [r7, r0]
	bl GetROMChapterStruct
	adds r0, #0x8d
	ldrb r0, [r0]
	subs r3, r0, #1
	b _0808D450
	.align 2, 0
_0808D444: .4byte gRAMChapterData
_0808D448: .4byte 0x00000539
_0808D44C:
	movs r3, #1
	negs r3, r3
_0808D450:
	adds r0, r4, #0
	movs r1, #0x22
	movs r2, #2
	bl Text_InsertNumberOr2Dashes
	movs r0, #0xe1
	lsls r0, r0, #1
	bl GetStringFromIndex
	adds r3, r0, #0
	adds r0, r5, #0
	movs r1, #0x2a
	movs r2, #0
	bl Text_InsertString
_0808D46E:
	adds r1, r6, #0
	adds r1, #0x44
	movs r0, #1
_0808D474:
	strh r0, [r1]
_0808D476:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END Init6CPI

	THUMB_FUNC_START Loop16CPI
Loop16CPI: @ 0x0808D47C
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r0, #0
	str r0, [r4, #0x58]
	adds r1, r4, #0
	adds r1, #0x55
	movs r0, #1
	strb r0, [r1]
	bl GetCameraMovementSpeedMaybe
	adds r1, r4, #0
	adds r1, #0x50
	strb r0, [r1]
	ldr r0, _0808D508  @ gUnknown_08A01828
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	lsls r1, r1, #3
	adds r1, r1, r0
	movs r0, #4
	ldrsb r0, [r1, r0]
	ldrb r1, [r1, #5]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl sub_808BBAC
	adds r5, r0, #0
	ldr r0, _0808D50C  @ gUnknown_08A018AC
	bl Proc_Find
	cmp r0, #0
	beq _0808D4CC
	adds r1, r0, #0
	adds r1, #0x57
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	blt _0808D4CC
	cmp r0, r5
	beq _0808D500
_0808D4CC:
	adds r0, r4, #0
	adds r0, #0x57
	strb r5, [r0]
	adds r0, r4, #0
	bl sub_808D200
	ldr r1, _0808D510  @ gUnknown_0202BCB0
	ldrh r0, [r1, #0x14]
	adds r2, r4, #0
	adds r2, #0x4e
	strb r0, [r2]
	ldrh r0, [r1, #0x16]
	adds r3, r4, #0
	adds r3, #0x4f
	strb r0, [r3]
	ldrb r1, [r2]
	adds r0, r4, #0
	adds r0, #0x4c
	strb r1, [r0]
	ldrb r0, [r3]
	adds r1, r4, #0
	adds r1, #0x4d
	strb r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
_0808D500:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0808D508: .4byte gUnknown_08A01828
_0808D50C: .4byte gUnknown_08A018AC
_0808D510: .4byte gUnknown_0202BCB0

	THUMB_FUNC_END Loop16CPI

	THUMB_FUNC_START sub_808D514
sub_808D514: @ 0x0808D514
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	adds r7, r1, #0
	mov sl, r2
	ldr r1, _0808D69C  @ gUnknown_08A01828
	lsls r0, r0, #3
	adds r0, r0, r1
	movs r1, #4
	ldrsb r1, [r0, r1]
	mov r8, r1
	ldrb r0, [r0, #5]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	mov r9, r0
	cmp r1, #0
	bge _0808D582
	cmp r0, #0
	bge _0808D582
	ldr r4, _0808D6A0  @ gBG1TilemapBuffer
	adds r0, r4, #0
	movs r1, #0xc
	movs r2, #6
	movs r3, #0
	bl TileMap_FillRect
	ldr r5, _0808D6A4  @ gBG0TilemapBuffer
	adds r0, r5, #0
	movs r1, #0xc
	movs r2, #6
	movs r3, #0
	bl TileMap_FillRect
	movs r0, #0x10
	subs r0, r0, r7
	lsls r0, r0, #6
	ldr r1, _0808D6A8  @ gUnknown_02004254
	adds r0, r0, r1
	adds r1, r4, #0
	movs r2, #0xc
	adds r3, r7, #0
	bl TileMap_CopyRect
	movs r0, #0x12
	subs r0, r0, r7
	lsls r0, r0, #6
	ldr r1, _0808D6AC  @ gUnknown_02003D54
	adds r0, r0, r1
	adds r1, r5, #0
	movs r2, #0xc
	adds r3, r7, #0
	bl TileMap_CopyRect
_0808D582:
	mov r0, r8
	cmp r0, #0
	ble _0808D5D2
	mov r1, r9
	cmp r1, #0
	bge _0808D5D2
	ldr r4, _0808D6B0  @ gUnknown_020234CE
	adds r0, r4, #0
	movs r1, #0xc
	movs r2, #6
	movs r3, #0
	bl TileMap_FillRect
	ldr r5, _0808D6B4  @ gUnknown_02022CCE
	adds r0, r5, #0
	movs r1, #0xc
	movs r2, #6
	movs r3, #0
	bl TileMap_FillRect
	movs r0, #0x10
	subs r0, r0, r7
	lsls r0, r0, #6
	ldr r1, _0808D6A8  @ gUnknown_02004254
	adds r0, r0, r1
	adds r1, r4, #0
	movs r2, #0xc
	adds r3, r7, #0
	bl TileMap_CopyRect
	movs r0, #0x12
	subs r0, r0, r7
	lsls r0, r0, #6
	ldr r1, _0808D6AC  @ gUnknown_02003D54
	adds r0, r0, r1
	adds r1, r5, #0
	movs r2, #0xc
	adds r3, r7, #0
	bl TileMap_CopyRect
_0808D5D2:
	mov r0, r8
	cmp r0, #0
	bge _0808D62C
	mov r1, r9
	cmp r1, #0
	ble _0808D62C
	ldr r5, _0808D6B8  @ gUnknown_02023828
	adds r0, r5, #0
	movs r1, #0xc
	movs r2, #6
	movs r3, #0
	bl TileMap_FillRect
	ldr r6, _0808D6BC  @ gUnknown_02023028
	adds r0, r6, #0
	movs r1, #0xc
	movs r2, #6
	movs r3, #0
	bl TileMap_FillRect
	ldr r0, _0808D6C0  @ gUnknown_020044D4
	movs r4, #1
	mov r1, sl
	subs r4, r4, r1
	lsls r4, r4, #1
	adds r4, #0x14
	subs r4, r4, r7
	lsls r4, r4, #6
	ldr r1, _0808D6C4  @ 0xFFFFFC80
	adds r5, r5, r1
	adds r5, r4, r5
	adds r1, r5, #0
	movs r2, #0xc
	adds r3, r7, #0
	bl TileMap_CopyRect
	ldr r0, _0808D6C8  @ gUnknown_02004054
	ldr r1, _0808D6C4  @ 0xFFFFFC80
	adds r6, r6, r1
	adds r4, r4, r6
	adds r1, r4, #0
	movs r2, #0xc
	adds r3, r7, #0
	bl TileMap_CopyRect
_0808D62C:
	mov r0, r8
	cmp r0, #0
	ble _0808D686
	mov r1, r9
	cmp r1, #0
	ble _0808D686
	ldr r5, _0808D6CC  @ gUnknown_0202384E
	adds r0, r5, #0
	movs r1, #0xc
	movs r2, #6
	movs r3, #0
	bl TileMap_FillRect
	ldr r6, _0808D6D0  @ gUnknown_0202304E
	adds r0, r6, #0
	movs r1, #0xc
	movs r2, #6
	movs r3, #0
	bl TileMap_FillRect
	ldr r0, _0808D6C0  @ gUnknown_020044D4
	movs r4, #1
	mov r1, sl
	subs r4, r4, r1
	lsls r4, r4, #1
	adds r4, #0x14
	subs r4, r4, r7
	lsls r4, r4, #6
	ldr r1, _0808D6C4  @ 0xFFFFFC80
	adds r5, r5, r1
	adds r5, r4, r5
	adds r1, r5, #0
	movs r2, #0xc
	adds r3, r7, #0
	bl TileMap_CopyRect
	ldr r0, _0808D6C8  @ gUnknown_02004054
	ldr r1, _0808D6C4  @ 0xFFFFFC80
	adds r6, r6, r1
	adds r4, r4, r6
	adds r1, r4, #0
	movs r2, #0xc
	adds r3, r7, #0
	bl TileMap_CopyRect
_0808D686:
	movs r0, #3
	bl BG_EnableSyncByMask
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808D69C: .4byte gUnknown_08A01828
_0808D6A0: .4byte gBG1TilemapBuffer
_0808D6A4: .4byte gBG0TilemapBuffer
_0808D6A8: .4byte gUnknown_02004254
_0808D6AC: .4byte gUnknown_02003D54
_0808D6B0: .4byte gUnknown_020234CE
_0808D6B4: .4byte gUnknown_02022CCE
_0808D6B8: .4byte gUnknown_02023828
_0808D6BC: .4byte gUnknown_02023028
_0808D6C0: .4byte gUnknown_020044D4
_0808D6C4: .4byte 0xFFFFFC80
_0808D6C8: .4byte gUnknown_02004054
_0808D6CC: .4byte gUnknown_0202384E
_0808D6D0: .4byte gUnknown_0202304E

	THUMB_FUNC_END sub_808D514

	THUMB_FUNC_START Loop26CPI
Loop26CPI: @ 0x0808D6D4
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _0808D718  @ gUnknown_08A019DC
	ldr r0, [r4, #0x58]
	adds r0, r0, r1
	movs r1, #0
	ldrsb r1, [r0, r1]
	adds r0, r4, #0
	adds r0, #0x50
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r2, r4, #0
	adds r2, #0x44
	movs r3, #0
	ldrsh r2, [r2, r3]
	bl sub_808D514
	ldr r0, [r4, #0x58]
	adds r0, #1
	str r0, [r4, #0x58]
	cmp r0, #5
	bne _0808D712
	movs r0, #0
	str r0, [r4, #0x58]
	adds r1, r4, #0
	adds r1, #0x55
	strb r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
_0808D712:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808D718: .4byte gUnknown_08A019DC

	THUMB_FUNC_END Loop26CPI

	THUMB_FUNC_START Loop46CPI
Loop46CPI: @ 0x0808D71C
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r6, r4, #0
	adds r6, #0x55
	movs r5, #0
	movs r0, #1
	strb r0, [r6]
	ldr r1, _0808D774  @ gUnknown_08A019E1
	ldr r0, [r4, #0x58]
	adds r0, r0, r1
	movs r1, #0
	ldrsb r1, [r0, r1]
	adds r0, r4, #0
	adds r0, #0x50
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r2, r4, #0
	adds r2, #0x44
	movs r3, #0
	ldrsh r2, [r2, r3]
	bl sub_808D514
	ldr r0, [r4, #0x58]
	adds r0, #1
	str r0, [r4, #0x58]
	cmp r0, #3
	bne _0808D76C
	str r5, [r4, #0x58]
	strb r5, [r6]
	adds r0, r4, #0
	adds r0, #0x56
	strb r5, [r0]
	adds r1, r4, #0
	adds r1, #0x57
	movs r0, #0xff
	strb r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
_0808D76C:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0808D774: .4byte gUnknown_08A019E1

	THUMB_FUNC_END Loop46CPI

	THUMB_FUNC_START sub_808D778
sub_808D778: @ 0x0808D778
	bx lr

	THUMB_FUNC_END sub_808D778

	THUMB_FUNC_START __malloc_unlock_0
__malloc_unlock_0: @ 0x0808D77C
	bx lr

	THUMB_FUNC_END __malloc_unlock_0

	THUMB_FUNC_START sub_808D780
sub_808D780: @ 0x0808D780
	bx lr

	THUMB_FUNC_END sub_808D780

	THUMB_FUNC_START Loop36CPI
Loop36CPI: @ 0x0808D784
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r3, r4, #0
	adds r3, #0x4e
	ldrb r0, [r3]
	adds r2, r4, #0
	adds r2, #0x4c
	strb r0, [r2]
	movs r0, #0x4f
	adds r0, r0, r4
	mov ip, r0
	ldrb r0, [r0]
	adds r1, r4, #0
	adds r1, #0x4d
	strb r0, [r1]
	ldr r1, _0808D808  @ gUnknown_0202BCB0
	ldrh r0, [r1, #0x14]
	strb r0, [r3]
	ldrh r0, [r1, #0x16]
	mov r1, ip
	strb r0, [r1]
	ldrh r0, [r3]
	ldrh r2, [r2]
	cmp r0, r2
	beq _0808D802
	ldr r0, _0808D80C  @ gUnknown_0859A548
	bl Proc_Find
	cmp r0, #0
	bne _0808D7F4
	bl GetCameraMovementSpeedMaybe
	adds r2, r0, #0
	adds r0, r4, #0
	adds r0, #0x50
	movs r3, #0
	ldrsb r3, [r0, r3]
	cmp r2, r3
	beq _0808D802
	ldr r1, _0808D810  @ gUnknown_08A01828
	lsls r0, r2, #3
	adds r5, r0, r1
	lsls r0, r3, #3
	adds r2, r0, r1
	movs r1, #4
	ldrsb r1, [r5, r1]
	movs r0, #4
	ldrsb r0, [r2, r0]
	cmp r1, r0
	bne _0808D7F4
	movs r1, #5
	ldrsb r1, [r5, r1]
	movs r0, #5
	ldrsb r0, [r2, r0]
	cmp r1, r0
	beq _0808D802
_0808D7F4:
	adds r1, r4, #0
	adds r1, #0x56
	movs r0, #1
	strb r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
_0808D802:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0808D808: .4byte gUnknown_0202BCB0
_0808D80C: .4byte gUnknown_0859A548
_0808D810: .4byte gUnknown_08A01828

	THUMB_FUNC_END Loop36CPI

	THUMB_FUNC_START sub_808D814
sub_808D814: @ 0x0808D814
	push {lr}
	ldr r0, _0808D85C  @ gUnknown_08A0190C
	bl Proc_Find
	cmp r0, #0
	beq _0808D82C
	adds r0, #0x56
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _0808D858
_0808D82C:
	ldr r0, _0808D860  @ gUnknown_08A018AC
	bl Proc_Find
	cmp r0, #0
	beq _0808D842
	adds r0, #0x56
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _0808D858
_0808D842:
	ldr r0, _0808D864  @ gUnknown_08A019E4
	bl Proc_Find
	cmp r0, #0
	beq _0808D868
	adds r0, #0x56
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0808D868
_0808D858:
	movs r0, #1
	b _0808D86A
	.align 2, 0
_0808D85C: .4byte gUnknown_08A0190C
_0808D860: .4byte gUnknown_08A018AC
_0808D864: .4byte gUnknown_08A019E4
_0808D868:
	movs r0, #0
_0808D86A:
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_808D814

	THUMB_FUNC_START sub_808D870
sub_808D870: @ 0x0808D870
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0808D898  @ gUnknown_08A199C8
	ldr r1, _0808D89C  @ 0x06015000
	bl CopyDataWithPossibleUncomp
	adds r1, r4, #0
	adds r1, #0x46
	movs r2, #0
	movs r0, #0x88
	strh r0, [r1]
	adds r1, #2
	movs r0, #0x8c
	strh r0, [r1]
	adds r0, r4, #0
	adds r0, #0x56
	strb r2, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808D898: .4byte gUnknown_08A199C8
_0808D89C: .4byte 0x06015000

	THUMB_FUNC_END sub_808D870

	THUMB_FUNC_START sub_808D8A0
sub_808D8A0: @ 0x0808D8A0
	push {r4, r5, lr}
	adds r3, r0, #0
	adds r5, r2, #0
	ldr r0, _0808D920  @ gUnknown_08A01828
	lsls r1, r1, #3
	adds r1, r1, r0
	movs r2, #4
	ldrsb r2, [r1, r2]
	movs r4, #5
	ldrsb r4, [r1, r4]
	cmp r2, #0
	bge _0808D8CE
	cmp r4, #0
	bge _0808D8CE
	adds r1, r3, #0
	adds r1, #0x46
	movs r0, #8
	strh r0, [r1]
	adds r1, r5, #0
	subs r1, #0x14
	adds r0, r3, #0
	adds r0, #0x48
	strh r1, [r0]
_0808D8CE:
	cmp r2, #0
	ble _0808D8E8
	cmp r4, #0
	bge _0808D8E8
	adds r1, r3, #0
	adds r1, #0x46
	movs r0, #0xac
	strh r0, [r1]
	adds r1, r5, #0
	subs r1, #0x14
	adds r0, r3, #0
	adds r0, #0x48
	strh r1, [r0]
_0808D8E8:
	cmp r2, #0
	bge _0808D900
	cmp r4, #0
	ble _0808D900
	adds r1, r3, #0
	adds r1, #0x46
	movs r0, #8
	strh r0, [r1]
	movs r0, #0xa4
	subs r0, r0, r5
	adds r1, #2
	strh r0, [r1]
_0808D900:
	cmp r2, #0
	ble _0808D918
	cmp r4, #0
	ble _0808D918
	adds r1, r3, #0
	adds r1, #0x46
	movs r0, #0xac
	strh r0, [r1]
	movs r0, #0xa4
	subs r0, r0, r5
	adds r1, #2
	strh r0, [r1]
_0808D918:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0808D920: .4byte gUnknown_08A01828

	THUMB_FUNC_END sub_808D8A0

	THUMB_FUNC_START sub_808D924
sub_808D924: @ 0x0808D924
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r6, _0808D970  @ 0x000001FF
	adds r1, r4, #0
	ands r1, r6
	movs r0, #0xff
	ands r5, r0
	ldr r0, _0808D974  @ gObject_32x16
	mov r8, r0
	movs r0, #0x8a
	lsls r0, r0, #6
	str r0, [sp]
	movs r0, #4
	adds r2, r5, #0
	mov r3, r8
	bl PutSprite
	adds r4, #0x20
	ands r4, r6
	ldr r0, _0808D978  @ 0x00002284
	str r0, [sp]
	movs r0, #4
	adds r1, r4, #0
	adds r2, r5, #0
	mov r3, r8
	bl PutSprite
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0808D970: .4byte 0x000001FF
_0808D974: .4byte gObject_32x16
_0808D978: .4byte 0x00002284

	THUMB_FUNC_END sub_808D924

	THUMB_FUNC_START sub_808D97C
sub_808D97C: @ 0x0808D97C
	push {r4, r5, lr}
	adds r4, r0, #0
	bl GetCameraMovementSpeedMaybe
	adds r1, r4, #0
	adds r1, #0x50
	movs r5, #0
	strb r0, [r1]
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	ldr r2, [r4, #0x58]
	adds r0, r4, #0
	bl sub_808D8A0
	str r5, [r4, #0x58]
	ldr r1, _0808D9B4  @ gUnknown_0202BCB0
	ldrh r0, [r1, #0x14]
	adds r2, r4, #0
	adds r2, #0x4e
	strb r0, [r2]
	ldrh r0, [r1, #0x16]
	adds r4, #0x4f
	strb r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0808D9B4: .4byte gUnknown_0202BCB0

	THUMB_FUNC_END sub_808D97C

	THUMB_FUNC_START sub_808D9B8
sub_808D9B8: @ 0x0808D9B8
	push {r4, lr}
	adds r4, r0, #0
	ldr r2, [r4, #0x58]
	adds r2, #4
	str r2, [r4, #0x58]
	adds r0, #0x50
	movs r1, #0
	ldrsb r1, [r0, r1]
	adds r0, r4, #0
	bl sub_808D8A0
	adds r0, r4, #0
	adds r0, #0x46
	movs r1, #0
	ldrsh r0, [r0, r1]
	adds r1, r4, #0
	adds r1, #0x48
	movs r2, #0
	ldrsh r1, [r1, r2]
	bl sub_808D924
	ldr r0, [r4, #0x58]
	cmp r0, #0x18
	bne _0808D9F6
	adds r0, r4, #0
	bl Proc_Break
	adds r1, r4, #0
	adds r1, #0x56
	movs r0, #0
	strb r0, [r1]
_0808D9F6:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_808D9B8

	THUMB_FUNC_START sub_808D9FC
sub_808D9FC: @ 0x0808D9FC
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r0, #0x46
	movs r1, #0
	ldrsh r0, [r0, r1]
	adds r1, r4, #0
	adds r1, #0x48
	movs r2, #0
	ldrsh r1, [r1, r2]
	bl sub_808D924
	adds r3, r4, #0
	adds r3, #0x4e
	ldrb r0, [r3]
	adds r2, r4, #0
	adds r2, #0x4c
	strb r0, [r2]
	movs r0, #0x4f
	adds r0, r0, r4
	mov ip, r0
	ldrb r0, [r0]
	adds r1, r4, #0
	adds r1, #0x4d
	strb r0, [r1]
	ldr r1, _0808DA94  @ gUnknown_0202BCB0
	ldrh r0, [r1, #0x14]
	strb r0, [r3]
	ldrh r0, [r1, #0x16]
	mov r1, ip
	strb r0, [r1]
	ldrh r0, [r3]
	ldrh r2, [r2]
	cmp r0, r2
	beq _0808DA8C
	ldr r0, _0808DA98  @ gUnknown_0859A548
	bl Proc_Find
	cmp r0, #0
	bne _0808DA7E
	bl GetCameraMovementSpeedMaybe
	adds r2, r0, #0
	adds r0, r4, #0
	adds r0, #0x50
	movs r3, #0
	ldrsb r3, [r0, r3]
	cmp r2, r3
	beq _0808DA8C
	ldr r1, _0808DA9C  @ gUnknown_08A01828
	lsls r0, r2, #3
	adds r5, r0, r1
	lsls r0, r3, #3
	adds r2, r0, r1
	movs r1, #4
	ldrsb r1, [r5, r1]
	movs r0, #4
	ldrsb r0, [r2, r0]
	cmp r1, r0
	bne _0808DA7E
	movs r1, #5
	ldrsb r1, [r5, r1]
	movs r0, #5
	ldrsb r0, [r2, r0]
	cmp r1, r0
	beq _0808DA8C
_0808DA7E:
	adds r1, r4, #0
	adds r1, #0x56
	movs r0, #1
	strb r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
_0808DA8C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0808DA94: .4byte gUnknown_0202BCB0
_0808DA98: .4byte gUnknown_0859A548
_0808DA9C: .4byte gUnknown_08A01828

	THUMB_FUNC_END sub_808D9FC

	THUMB_FUNC_START sub_808DAA0
sub_808DAA0: @ 0x0808DAA0
	push {r4, lr}
	adds r4, r0, #0
	ldr r2, [r4, #0x58]
	subs r2, #4
	str r2, [r4, #0x58]
	adds r0, #0x50
	movs r1, #0
	ldrsb r1, [r0, r1]
	adds r0, r4, #0
	bl sub_808D8A0
	adds r0, r4, #0
	adds r0, #0x46
	movs r1, #0
	ldrsh r0, [r0, r1]
	adds r1, r4, #0
	adds r1, #0x48
	movs r2, #0
	ldrsh r1, [r1, r2]
	bl sub_808D924
	ldr r1, [r4, #0x58]
	cmp r1, #0
	bne _0808DADC
	adds r0, r4, #0
	adds r0, #0x56
	strb r1, [r0]
	adds r0, r4, #0
	bl Proc_Break
_0808DADC:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_808DAA0

.align 2, 0
