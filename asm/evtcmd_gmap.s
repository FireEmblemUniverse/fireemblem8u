	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	THUMB_FUNC_START sub_800B910
sub_800B910: @ 0x0800B910
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r6, r1, #0
	adds r4, r2, #0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	bl GetBackgroundTileDataOffset
	adds r5, r0, #0
	movs r0, #0xc0
	lsls r0, r0, #0x13
	mov r8, r0
	add r5, r8
	adds r0, r6, #0
	bl GetBackgroundTileDataOffset
	adds r1, r0, #0
	add r1, r8
	lsls r4, r4, #9
	adds r0, r5, #0
	adds r2, r4, #0
	bl CpuFastSet
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_800B910

	THUMB_FUNC_START sub_800B954
sub_800B954: @ 0x0800B954
	push {r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r4, r1, #0
	lsls r0, r0, #0x18
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r2, r2, #0x18
	mov r3, sp
	ldr r1, _0800B990  @ gUnknown_080D792C
	ldm r1!, {r5, r6, r7}
	stm r3!, {r5, r6, r7}
	ldr r1, [r1]
	str r1, [r3]
	lsrs r0, r0, #0x16
	add r0, sp
	ldr r0, [r0]
	lsls r1, r4, #2
	add r1, sp
	ldr r1, [r1]
	lsrs r2, r2, #0xf
	bl CpuFastSet
	movs r0, #1
	lsls r0, r4
	bl BG_EnableSyncByMask
	add sp, #0x10
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800B990: .4byte gUnknown_080D792C

	THUMB_FUNC_END sub_800B954

	THUMB_FUNC_START sub_800B994
sub_800B994: @ 0x0800B994
	push {lr}
	lsls r0, r0, #0x18
	lsls r1, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r0, r0, #0x13
	ldr r3, _0800B9B4  @ gPaletteBuffer
	adds r0, r0, r3
	lsrs r1, r1, #0x13
	adds r1, r1, r3
	lsrs r2, r2, #0x15
	bl CpuFastSet
	bl EnablePaletteSync
	pop {r0}
	bx r0
	.align 2, 0
_0800B9B4: .4byte gPaletteBuffer

	THUMB_FUNC_END sub_800B994

	THUMB_FUNC_START sub_800B9B8
sub_800B9B8: @ 0x0800B9B8
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r4, r1, #0x18
	adds r0, r5, #0
	bl BG_GetMapBuffer
	adds r2, r0, #0
	movs r3, #0
	ldr r7, _0800B9FC  @ 0x00000FFF
	ldr r6, _0800BA00  @ 0x000003FF
_0800B9D0:
	ldrh r0, [r2]
	lsrs r1, r0, #0xc
	adds r1, r1, r4
	lsls r1, r1, #0x18
	ands r0, r7
	lsrs r1, r1, #0xc
	orrs r0, r1
	strh r0, [r2]
	adds r2, #2
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, r6
	bls _0800B9D0
	movs r0, #1
	lsls r0, r5
	bl BG_EnableSyncByMask
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800B9FC: .4byte 0x00000FFF
_0800BA00: .4byte 0x000003FF

	THUMB_FUNC_END sub_800B9B8

	THUMB_FUNC_START sub_800BA04
sub_800BA04: @ 0x0800BA04
	push {lr}
	adds r2, r1, #0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	lsls r3, r0, #5
	ldr r1, _0800BA2C  @ gPaletteBuffer
	adds r3, r3, r1
	ldr r1, _0800BA30  @ end
	strh r0, [r1]
	adds r1, #2
	strh r2, [r1]
	adds r1, #2
	lsls r2, r2, #3
	adds r0, r3, #0
	bl CpuFastSet
	pop {r0}
	bx r0
	.align 2, 0
_0800BA2C: .4byte gPaletteBuffer
_0800BA30: .4byte end

	THUMB_FUNC_END sub_800BA04

	THUMB_FUNC_START sub_800BA34
sub_800BA34: @ 0x0800BA34
	push {lr}
	ldr r0, _0800BA54  @ end
	ldrh r1, [r0]
	adds r0, #2
	ldrh r2, [r0]
	adds r0, #2
	lsls r1, r1, #5
	ldr r3, _0800BA58  @ gPaletteBuffer
	adds r1, r1, r3
	lsls r2, r2, #3
	bl CpuFastSet
	bl EnablePaletteSync
	pop {r0}
	bx r0
	.align 2, 0
_0800BA54: .4byte end
_0800BA58: .4byte gPaletteBuffer

	THUMB_FUNC_END sub_800BA34

	THUMB_FUNC_START SetSomeRealCamPos
SetSomeRealCamPos: @ 0x0800BA5C
	push {r4, r5, lr}
	sub sp, #8
	adds r5, r1, #0
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	cmp r2, #1
	bne _0800BA88
	add r3, sp, #4
	mov r2, sp
	bl StoreAdjustedCameraPositions
	ldr r1, _0800BA84  @ gUnknown_0202BCB0
	ldr r0, [sp]
	lsls r0, r0, #4
	strh r0, [r1, #0xc]
	ldr r0, [sp, #4]
	lsls r0, r0, #4
	strh r0, [r1, #0xe]
	b _0800BA9A
	.align 2, 0
_0800BA84: .4byte gUnknown_0202BCB0
_0800BA88:
	lsls r0, r0, #4
	bl GetSomeAdjustedCameraX
	ldr r4, _0800BAA4  @ gUnknown_0202BCB0
	strh r0, [r4, #0xc]
	lsls r0, r5, #4
	bl GetSomeAdjustedCameraY
	strh r0, [r4, #0xe]
_0800BA9A:
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0800BAA4: .4byte gUnknown_0202BCB0

	THUMB_FUNC_END SetSomeRealCamPos

	THUMB_FUNC_START sub_800BAA8
sub_800BAA8: @ 0x0800BAA8
	push {r4, r5, r6, lr}
	adds r6, r2, #0
	lsls r0, r0, #0x10
	lsls r1, r1, #0x18
	lsrs r4, r1, #0x18
	lsrs r5, r0, #0x10
	cmp r0, #0
	bge _0800BAC6
	ldr r0, _0800BAF4  @ gRAMChapterData
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetROMChapterStruct
	ldrb r5, [r0, #0xc]
_0800BAC6:
	lsls r0, r4, #0x18
	asrs r4, r0, #0x18
	cmp r4, #1
	bne _0800BAD2
	bl RenderBmMapOnBg2
_0800BAD2:
	ldr r0, _0800BAF4  @ gRAMChapterData
	strb r5, [r0, #0xd]
	bl RefreshEntityBmMaps
	bl SMS_UpdateFromGameData
	bl RenderBmMap
	cmp r4, #1
	bne _0800BAEE
	movs r0, #1
	adds r1, r6, #0
	bl MakeNew6CBMXFADE2
_0800BAEE:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0800BAF4: .4byte gRAMChapterData

	THUMB_FUNC_END sub_800BAA8

	THUMB_FUNC_START TriggerMapChanges
TriggerMapChanges: @ 0x0800BAF8
	push {r4, r5, r6, lr}
	adds r6, r2, #0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r4, r0, #0
	lsls r1, r1, #0x18
	lsrs r5, r1, #0x18
	bl IsMapChangeEnabled
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0800BB40
	lsls r0, r5, #0x18
	asrs r5, r0, #0x18
	cmp r5, #1
	bne _0800BB1C
	bl RenderBmMapOnBg2
_0800BB1C:
	adds r0, r4, #0
	bl ApplyMapChangesById
	adds r0, r4, #0
	bl EnableMapChange
	bl RefreshTerrainBmMap
	bl UpdateRoofedUnits
	bl RenderBmMap
	cmp r5, #1
	bne _0800BB40
	movs r0, #1
	adds r1, r6, #0
	bl MakeNew6CBMXFADE2
_0800BB40:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END TriggerMapChanges

	THUMB_FUNC_START sub_800BB48
sub_800BB48: @ 0x0800BB48
	push {r4, r5, r6, lr}
	adds r6, r2, #0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r4, r0, #0
	lsls r1, r1, #0x18
	lsrs r5, r1, #0x18
	bl IsMapChangeEnabled
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _0800BB92
	lsls r0, r5, #0x18
	asrs r5, r0, #0x18
	cmp r5, #1
	bne _0800BB6E
	bl RenderBmMapOnBg2
_0800BB6E:
	adds r0, r4, #0
	bl RevertMapChange
	adds r0, r4, #0
	bl DisableMapChange
	bl RefreshTerrainBmMap
	bl UpdateRoofedUnits
	bl RenderBmMap
	cmp r5, #1
	bne _0800BB92
	movs r0, #1
	adds r1, r6, #0
	bl MakeNew6CBMXFADE2
_0800BB92:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_800BB48

	THUMB_FUNC_START sub_800BB98
sub_800BB98: @ 0x0800BB98
	push {lr}
	ldr r0, _0800BBB0  @ gUnknown_0859E520
	bl Proc_Find
	negs r1, r0
	orrs r1, r0
	cmp r1, #0
	bge _0800BBAC
	bl sub_8036D4C
_0800BBAC:
	pop {r0}
	bx r0
	.align 2, 0
_0800BBB0: .4byte gUnknown_0859E520

	THUMB_FUNC_END sub_800BB98

	THUMB_FUNC_START sub_800BBB4
sub_800BBB4: @ 0x0800BBB4
	push {r4, r5, lr}
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	movs r4, #1
_0800BBBC:
	adds r0, r4, #0
	bl GetUnit
	cmp r0, #0
	beq _0800BBD6
	ldr r0, [r0]
	cmp r0, #0
	beq _0800BBD6
	ldrb r0, [r0, #4]
	cmp r0, r5
	bne _0800BBD6
	movs r0, #1
	b _0800BBDE
_0800BBD6:
	adds r4, #1
	cmp r4, #0x3f
	ble _0800BBBC
	movs r0, #0
_0800BBDE:
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_800BBB4

	THUMB_FUNC_START sub_800BBE4
sub_800BBE4: @ 0x0800BBE4
	push {r4, r5, lr}
	movs r5, #0
	movs r4, #1
_0800BBEA:
	adds r0, r4, #0
	bl GetUnit
	adds r1, r0, #0
	cmp r1, #0
	beq _0800BC0C
	ldr r0, [r1]
	cmp r0, #0
	beq _0800BC0C
	ldr r0, [r1, #0xc]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	bne _0800BC0C
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
_0800BC0C:
	adds r4, #1
	cmp r4, #0x3f
	ble _0800BBEA
	adds r0, r5, #0
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_800BBE4

	THUMB_FUNC_START HideAllUnits
HideAllUnits: @ 0x0800BC1C
	push {r4, lr}
	movs r4, #1
_0800BC20:
	adds r0, r4, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq _0800BC42
	ldr r0, [r2]
	cmp r0, #0
	beq _0800BC42
	ldr r1, [r2, #0xc]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	bne _0800BC42
	movs r0, #1
	orrs r1, r0
	str r1, [r2, #0xc]
_0800BC42:
	adds r4, #1
	cmp r4, #0x3f
	ble _0800BC20
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END HideAllUnits

	THUMB_FUNC_START GetUnitStructFromEventParameter
GetUnitStructFromEventParameter: @ 0x0800BC50
	push {lr}
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	asrs r1, r0, #0x10
	movs r3, #3
	negs r3, r3
	cmp r1, r3
	bge _0800BC64
	movs r0, #0
	b _0800BCD8
_0800BC64:
	movs r0, #2
	negs r0, r0
	cmp r1, r0
	beq _0800BC90
	cmp r1, r0
	bgt _0800BC76
	cmp r1, r3
	beq _0800BC84
	b _0800BCD0
_0800BC76:
	movs r0, #1
	negs r0, r0
	cmp r1, r0
	beq _0800BCBC
	cmp r1, #0
	beq _0800BCC8
	b _0800BCD0
_0800BC84:
	ldr r0, _0800BC8C  @ gEventSlots
	ldrh r2, [r0, #8]
	b _0800BCD0
	.align 2, 0
_0800BC8C: .4byte gEventSlots
_0800BC90:
	ldr r2, _0800BCB0  @ gUnknown_030004E6
	ldrh r1, [r2]
	ldr r0, _0800BCB4  @ gBmMapUnit
	ldr r0, [r0]
	lsls r1, r1, #2
	adds r1, r1, r0
	subs r2, #2
	ldrh r2, [r2]
	ldr r0, [r1]
	adds r1, r0, r2
	ldrb r0, [r1]
	cmp r0, #0
	beq _0800BCB8
	bl GetUnit
	b _0800BCD8
	.align 2, 0
_0800BCB0: .4byte gUnknown_030004E6
_0800BCB4: .4byte gBmMapUnit
_0800BCB8:
	movs r0, #0
	b _0800BCD8
_0800BCBC:
	ldr r0, _0800BCC4  @ gActiveUnit
	ldr r0, [r0]
	b _0800BCD8
	.align 2, 0
_0800BCC4: .4byte gActiveUnit
_0800BCC8:
	bl GetPlayerLeaderUnitId
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
_0800BCD0:
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	bl GetUnitFromCharId
_0800BCD8:
	pop {r1}
	bx r1

	THUMB_FUNC_END GetUnitStructFromEventParameter

	THUMB_FUNC_START sub_800BCDC
sub_800BCDC: @ 0x0800BCDC
	push {r4, lr}
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	bl IsBattleDeamonActive
	cmp r0, #0
	bne _0800BDC0
	bl SetupMapSpritesPalettes
	movs r0, #0xf
	ands r0, r4
	cmp r0, #3
	beq _0800BD10
	cmp r0, #3
	bgt _0800BD00
	cmp r0, #2
	beq _0800BD06
	b _0800BD30
_0800BD00:
	cmp r0, #4
	beq _0800BD24
	b _0800BD30
_0800BD06:
	ldr r0, _0800BD0C  @ unit_icon_pal_enemy
	b _0800BD12
	.align 2, 0
_0800BD0C: .4byte unit_icon_pal_enemy
_0800BD10:
	ldr r0, _0800BD20  @ unit_icon_pal_npc
_0800BD12:
	movs r1, #0xe0
	lsls r1, r1, #2
	movs r2, #0x20
	bl CopyToPaletteBuffer
	b _0800BD30
	.align 2, 0
_0800BD20: .4byte unit_icon_pal_npc
_0800BD24:
	ldr r0, _0800BD44  @ gUnknown_0859EEE0
	movs r1, #0xe0
	lsls r1, r1, #2
	movs r2, #0x20
	bl CopyToPaletteBuffer
_0800BD30:
	lsrs r1, r4, #4
	movs r0, #0xf
	ands r1, r0
	cmp r1, #3
	beq _0800BD58
	cmp r1, #3
	bgt _0800BD48
	cmp r1, #1
	beq _0800BD4E
	b _0800BD78
	.align 2, 0
_0800BD44: .4byte gUnknown_0859EEE0
_0800BD48:
	cmp r1, #4
	beq _0800BD6C
	b _0800BD78
_0800BD4E:
	ldr r0, _0800BD54  @ unit_icon_pal_player
	b _0800BD5A
	.align 2, 0
_0800BD54: .4byte unit_icon_pal_player
_0800BD58:
	ldr r0, _0800BD68  @ unit_icon_pal_npc
_0800BD5A:
	movs r1, #0xe8
	lsls r1, r1, #2
	movs r2, #0x20
	bl CopyToPaletteBuffer
	b _0800BD78
	.align 2, 0
_0800BD68: .4byte unit_icon_pal_npc
_0800BD6C:
	ldr r0, _0800BD8C  @ gUnknown_0859EEE0
	movs r1, #0xe8
	lsls r1, r1, #2
	movs r2, #0x20
	bl CopyToPaletteBuffer
_0800BD78:
	lsrs r1, r4, #8
	movs r0, #0xf
	ands r1, r0
	cmp r1, #2
	beq _0800BDA0
	cmp r1, #2
	bgt _0800BD90
	cmp r1, #1
	beq _0800BD96
	b _0800BDC0
	.align 2, 0
_0800BD8C: .4byte gUnknown_0859EEE0
_0800BD90:
	cmp r1, #4
	beq _0800BDB4
	b _0800BDC0
_0800BD96:
	ldr r0, _0800BD9C  @ unit_icon_pal_player
	b _0800BDA2
	.align 2, 0
_0800BD9C: .4byte unit_icon_pal_player
_0800BDA0:
	ldr r0, _0800BDB0  @ unit_icon_pal_enemy
_0800BDA2:
	movs r1, #0xf0
	lsls r1, r1, #2
	movs r2, #0x20
	bl CopyToPaletteBuffer
	b _0800BDC0
	.align 2, 0
_0800BDB0: .4byte unit_icon_pal_enemy
_0800BDB4:
	ldr r0, _0800BDC8  @ gUnknown_0859EEE0
	movs r1, #0xf0
	lsls r1, r1, #2
	movs r2, #0x20
	bl CopyToPaletteBuffer
_0800BDC0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800BDC8: .4byte gUnknown_0859EEE0

	THUMB_FUNC_END sub_800BCDC

	THUMB_FUNC_START Event80_
Event80_: @ 0x0800BDCC
	push {r4, lr}
	ldr r0, [r0, #0x38]
	ldr r4, [r0, #4]
	adds r0, r4, #0
	bl sub_80BA008
	adds r0, r4, #0
	bl nullsub_5
	movs r0, #2
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END Event80_

	THUMB_FUNC_START Event81_
Event81_: @ 0x0800BDE8
	push {lr}
	adds r2, r0, #0
	ldrh r0, [r2, #0x3c]
	lsrs r0, r0, #2
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _0800BE02
	adds r0, r2, #0
	bl sub_8013DC0
	movs r0, #2
	b _0800BE22
_0800BE02:
	ldr r2, _0800BE28  @ gLCDControlBuffer
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
	movs r0, #0
_0800BE22:
	pop {r1}
	bx r1
	.align 2, 0
_0800BE28: .4byte gLCDControlBuffer

	THUMB_FUNC_END Event81_

	THUMB_FUNC_START Event82_EndWM
Event82_EndWM: @ 0x0800BE2C
	push {lr}
	bl EndWM
	movs r0, #0
	pop {r1}
	bx r1

	THUMB_FUNC_END Event82_EndWM

	THUMB_FUNC_START Event83_WM_SETCAM
Event83_WM_SETCAM: @ 0x0800BE38
	ldr r0, [r0, #0x38]
	ldrh r1, [r0, #4]
	ldrh r2, [r0, #6]
	ldr r0, _0800BE48  @ gUnknown_03005280
	strh r1, [r0, #2]
	strh r2, [r0, #4]
	movs r0, #0
	bx lr
	.align 2, 0
_0800BE48: .4byte gUnknown_03005280

	THUMB_FUNC_END Event83_WM_SETCAM

	THUMB_FUNC_START Event84_WM_SETCAMONLOC
Event84_WM_SETCAMONLOC: @ 0x0800BE4C
	push {r4, lr}
	sub sp, #4
	ldr r0, [r0, #0x38]
	ldr r1, [r0, #4]
	lsls r1, r1, #5
	ldr r0, _0800BE84  @ gUnknown_082060B0
	adds r1, r1, r0
	movs r2, #0x18
	ldrsh r0, [r1, r2]
	movs r2, #0x1a
	ldrsh r1, [r1, r2]
	mov r4, sp
	adds r4, #2
	mov r2, sp
	adds r3, r4, #0
	bl GetWMCenteredCameraPosition
	ldr r1, _0800BE88  @ gUnknown_03005280
	mov r0, sp
	ldrh r0, [r0]
	strh r0, [r1, #2]
	ldrh r0, [r4]
	strh r0, [r1, #4]
	movs r0, #0
	add sp, #4
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0800BE84: .4byte gUnknown_082060B0
_0800BE88: .4byte gUnknown_03005280

	THUMB_FUNC_END Event84_WM_SETCAMONLOC

	THUMB_FUNC_START Event85_WM_SETCAMONSPRITE
Event85_WM_SETCAMONSPRITE: @ 0x0800BE8C
	push {r4, r5, lr}
	sub sp, #4
	ldr r0, [r0, #0x38]
	ldr r0, [r0, #4]
	ldr r4, _0800BECC  @ gUnknown_03005280
	lsls r0, r0, #2
	adds r0, r0, r4
	ldrb r1, [r0, #0x11]
	lsls r1, r1, #5
	ldr r0, _0800BED0  @ gUnknown_082060B0
	adds r1, r1, r0
	movs r2, #0x18
	ldrsh r0, [r1, r2]
	movs r2, #0x1a
	ldrsh r1, [r1, r2]
	mov r5, sp
	adds r5, #2
	mov r2, sp
	adds r3, r5, #0
	bl GetWMCenteredCameraPosition
	mov r0, sp
	ldrh r0, [r0]
	strh r0, [r4, #2]
	ldrh r0, [r5]
	strh r0, [r4, #4]
	movs r0, #0
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0800BECC: .4byte gUnknown_03005280
_0800BED0: .4byte gUnknown_082060B0

	THUMB_FUNC_END Event85_WM_SETCAMONSPRITE

	THUMB_FUNC_START Event86_WM_MOVECAM
Event86_WM_MOVECAM: @ 0x0800BED4
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	ldr r1, [r0, #0x38]
	ldrh r7, [r1, #4]
	ldrh r2, [r1, #6]
	mov ip, r2
	ldrh r3, [r1, #8]
	ldrh r6, [r1, #0xa]
	ldrh r5, [r1, #0xc]
	ldrh r2, [r1, #0xe]
	ldrh r0, [r0, #0x3c]
	lsrs r0, r0, #2
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _0800BF02
	lsls r0, r5, #0x10
	adds r4, r0, #0
	lsls r5, r2, #0x10
	cmp r4, #0
	bne _0800BF10
	cmp r5, #0
	bne _0800BF10
_0800BF02:
	ldr r0, _0800BF0C  @ gUnknown_03005280
	strh r3, [r0, #2]
	strh r6, [r0, #4]
	movs r0, #0
	b _0800BF30
	.align 2, 0
_0800BF0C: .4byte gUnknown_03005280
_0800BF10:
	lsls r0, r7, #0x10
	asrs r0, r0, #0x10
	mov r2, ip
	lsls r1, r2, #0x10
	asrs r1, r1, #0x10
	lsls r2, r3, #0x10
	asrs r2, r2, #0x10
	lsls r3, r6, #0x10
	asrs r3, r3, #0x10
	asrs r4, r4, #0x10
	str r4, [sp]
	asrs r4, r5, #0x10
	str r4, [sp, #4]
	bl sub_80BF404
	movs r0, #2
_0800BF30:
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END Event86_WM_MOVECAM

	THUMB_FUNC_START Event87_
Event87_: @ 0x0800BF38
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	sub sp, #0xc
	adds r5, r0, #0
	ldr r0, [r5, #0x38]
	ldrh r1, [r0, #4]
	mov r8, r1
	ldrh r2, [r0, #6]
	mov r9, r2
	ldrh r1, [r0, #8]
	ldrh r6, [r0, #0xa]
	ldrh r7, [r0, #0xc]
	lsls r1, r1, #5
	ldr r0, _0800BF9C  @ gUnknown_082060B0
	adds r1, r1, r0
	movs r2, #0x18
	ldrsh r0, [r1, r2]
	movs r2, #0x1a
	ldrsh r1, [r1, r2]
	mov r4, sp
	adds r4, #0xa
	add r2, sp, #8
	adds r3, r4, #0
	bl GetWMCenteredCameraPosition
	ldrh r0, [r5, #0x3c]
	lsrs r0, r0, #2
	movs r1, #1
	ands r0, r1
	adds r3, r4, #0
	cmp r0, #0
	bne _0800BF8A
	lsls r0, r6, #0x10
	adds r4, r0, #0
	lsls r5, r7, #0x10
	cmp r4, #0
	bne _0800BFA4
	cmp r5, #0
	bne _0800BFA4
_0800BF8A:
	ldr r1, _0800BFA0  @ gUnknown_03005280
	add r0, sp, #8
	ldrh r0, [r0]
	strh r0, [r1, #2]
	ldrh r0, [r3]
	strh r0, [r1, #4]
	movs r0, #0
	b _0800BFC8
	.align 2, 0
_0800BF9C: .4byte gUnknown_082060B0
_0800BFA0: .4byte gUnknown_03005280
_0800BFA4:
	mov r6, r8
	lsls r0, r6, #0x10
	asrs r0, r0, #0x10
	mov r2, r9
	lsls r1, r2, #0x10
	asrs r1, r1, #0x10
	add r2, sp, #8
	movs r6, #0
	ldrsh r2, [r2, r6]
	movs r6, #0
	ldrsh r3, [r3, r6]
	asrs r4, r4, #0x10
	str r4, [sp]
	asrs r4, r5, #0x10
	str r4, [sp, #4]
	bl sub_80BF404
	movs r0, #2
_0800BFC8:
	add sp, #0xc
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END Event87_

	THUMB_FUNC_START Event88_
Event88_: @ 0x0800BFD8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	adds r5, r0, #0
	ldr r0, [r5, #0x38]
	ldrh r1, [r0, #4]
	mov r9, r1
	ldrh r2, [r0, #6]
	mov sl, r2
	ldrh r1, [r0, #8]
	ldrh r7, [r0, #0xa]
	ldrh r0, [r0, #0xc]
	mov r8, r0
	ldr r6, _0800C048  @ gUnknown_03005280
	lsls r1, r1, #2
	adds r1, r1, r6
	ldrb r1, [r1, #0x11]
	lsls r1, r1, #5
	ldr r0, _0800C04C  @ gUnknown_082060B0
	adds r1, r1, r0
	movs r2, #0x18
	ldrsh r0, [r1, r2]
	movs r2, #0x1a
	ldrsh r1, [r1, r2]
	mov r4, sp
	adds r4, #0xa
	add r2, sp, #8
	adds r3, r4, #0
	bl GetWMCenteredCameraPosition
	ldrh r0, [r5, #0x3c]
	lsrs r0, r0, #2
	movs r1, #1
	ands r0, r1
	adds r3, r4, #0
	cmp r0, #0
	bne _0800C038
	lsls r0, r7, #0x10
	adds r4, r0, #0
	mov r0, r8
	lsls r5, r0, #0x10
	cmp r4, #0
	bne _0800C050
	cmp r5, #0
	bne _0800C050
_0800C038:
	add r0, sp, #8
	ldrh r0, [r0]
	strh r0, [r6, #2]
	ldrh r0, [r3]
	strh r0, [r6, #4]
	movs r0, #0
	b _0800C074
	.align 2, 0
_0800C048: .4byte gUnknown_03005280
_0800C04C: .4byte gUnknown_082060B0
_0800C050:
	mov r1, r9
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	mov r2, sl
	lsls r1, r2, #0x10
	asrs r1, r1, #0x10
	add r2, sp, #8
	movs r6, #0
	ldrsh r2, [r2, r6]
	movs r6, #0
	ldrsh r3, [r3, r6]
	asrs r4, r4, #0x10
	str r4, [sp]
	asrs r4, r5, #0x10
	str r4, [sp, #4]
	bl sub_80BF404
	movs r0, #2
_0800C074:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END Event88_

	THUMB_FUNC_START Event89_
Event89_: @ 0x0800C084
	push {lr}
	ldrh r0, [r0, #0x3c]
	lsrs r0, r0, #2
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0800C0A4
	bl sub_80BF3F4
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0800C0A0
	bl sub_80BF4A8
_0800C0A0:
	movs r0, #0
	b _0800C0B4
_0800C0A4:
	bl sub_80BF3F4
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0800C0B2
	movs r0, #3
	b _0800C0B4
_0800C0B2:
	movs r0, #2
_0800C0B4:
	pop {r1}
	bx r1

	THUMB_FUNC_END Event89_

	THUMB_FUNC_START Event8A_
Event8A_: @ 0x0800C0B8
	ldr r1, _0800C0C4  @ gUnknown_03005280
	movs r0, #1
	strb r0, [r1, #1]
	movs r0, #0
	bx lr
	.align 2, 0
_0800C0C4: .4byte gUnknown_03005280

	THUMB_FUNC_END Event8A_

	THUMB_FUNC_START Event8B_
Event8B_: @ 0x0800C0C8
	ldr r1, _0800C0D0  @ gUnknown_03005280
	movs r0, #0
	strb r0, [r1, #1]
	bx lr
	.align 2, 0
_0800C0D0: .4byte gUnknown_03005280

	THUMB_FUNC_END Event8B_

	THUMB_FUNC_START Event8C_
Event8C_: @ 0x0800C0D4
	ldr r0, [r0, #0x38]
	ldrh r1, [r0, #6]
	ldr r2, _0800C0EC  @ gUnknown_03005280
	movs r3, #4
	ldrsh r0, [r0, r3]
	lsls r0, r0, #8
	str r0, [r2, #8]
	lsls r1, r1, #0x10
	asrs r1, r1, #8
	str r1, [r2, #0xc]
	movs r0, #0
	bx lr
	.align 2, 0
_0800C0EC: .4byte gUnknown_03005280

	THUMB_FUNC_END Event8C_

	THUMB_FUNC_START Event8D_
Event8D_: @ 0x0800C0F0
	push {lr}
	ldrh r0, [r0, #0x3c]
	lsrs r0, r0, #2
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _0800C102
	movs r0, #2
	b _0800C104
_0800C102:
	movs r0, #0
_0800C104:
	pop {r1}
	bx r1

	THUMB_FUNC_END Event8D_

	THUMB_FUNC_START Event8E_
Event8E_: @ 0x0800C108
	push {lr}
	ldrh r0, [r0, #0x3c]
	lsrs r0, r0, #2
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _0800C11A
	movs r0, #2
	b _0800C11C
_0800C11A:
	movs r0, #0
_0800C11C:
	pop {r1}
	bx r1

	THUMB_FUNC_END Event8E_

	THUMB_FUNC_START Event8F_
Event8F_: @ 0x0800C120
	push {lr}
	ldrh r0, [r0, #0x3c]
	lsrs r0, r0, #2
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _0800C132
	movs r0, #2
	b _0800C134
_0800C132:
	movs r0, #0
_0800C134:
	pop {r1}
	bx r1

	THUMB_FUNC_END Event8F_

	THUMB_FUNC_START Event90_WM_DRAWPATH
Event90_WM_DRAWPATH: @ 0x0800C138
	push {lr}
	ldr r1, [r0, #0x38]
	ldr r2, [r1, #4]
	ldrh r0, [r0, #0x3c]
	lsrs r0, r0, #2
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _0800C156
	adds r0, r2, #0
	movs r1, #0x1e
	bl WM_DrawPath
	movs r0, #2
	b _0800C160
_0800C156:
	adds r0, r2, #0
	movs r1, #0
	bl WM_DrawPath
	movs r0, #0
_0800C160:
	pop {r1}
	bx r1

	THUMB_FUNC_END Event90_WM_DRAWPATH

	THUMB_FUNC_START Event91_WM_DRAWPATH_Silent
Event91_WM_DRAWPATH_Silent: @ 0x0800C164
	push {lr}
	ldr r0, [r0, #0x38]
	ldr r2, [r0, #4]
	ldr r0, _0800C190  @ gUnknown_03005280
	adds r1, r0, #0
	adds r1, #0xa4
	bl SetupNewWMRoute
	ldr r0, _0800C194  @ gUnknown_08A3D748
	bl Proc_Find
	ldr r0, [r0, #0x44]
	ldr r1, [r0, #0x4c]
	adds r1, #0x31
	ldrb r2, [r1]
	movs r0, #3
	orrs r0, r2
	strb r0, [r1]
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0
_0800C190: .4byte gUnknown_03005280
_0800C194: .4byte gUnknown_08A3D748

	THUMB_FUNC_END Event91_WM_DRAWPATH_Silent

	THUMB_FUNC_START Event92_REMOVEPATH
Event92_REMOVEPATH: @ 0x0800C198
	push {lr}
	ldr r0, [r0, #0x38]
	ldr r2, [r0, #4]
	ldr r0, _0800C1C4  @ gUnknown_03005280
	adds r1, r0, #0
	adds r1, #0xa4
	bl WM_RemovePath
	ldr r0, _0800C1C8  @ gUnknown_08A3D748
	bl Proc_Find
	ldr r0, [r0, #0x44]
	ldr r1, [r0, #0x4c]
	adds r1, #0x31
	ldrb r2, [r1]
	movs r0, #3
	orrs r0, r2
	strb r0, [r1]
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0
_0800C1C4: .4byte gUnknown_03005280
_0800C1C8: .4byte gUnknown_08A3D748

	THUMB_FUNC_END Event92_REMOVEPATH

	THUMB_FUNC_START Event93_
Event93_: @ 0x0800C1CC
	ldr r0, [r0, #0x38]
	ldr r1, [r0, #4]
	ldr r0, _0800C1E4  @ gUnknown_03005280
	lsls r1, r1, #2
	adds r1, r1, r0
	adds r1, #0x30
	ldrb r2, [r1]
	movs r0, #1
	orrs r0, r2
	strb r0, [r1]
	movs r0, #0
	bx lr
	.align 2, 0
_0800C1E4: .4byte gUnknown_03005280

	THUMB_FUNC_END Event93_

	THUMB_FUNC_START Event94_
Event94_: @ 0x0800C1E8
	ldr r0, [r0, #0x38]
	ldr r1, [r0, #4]
	ldr r0, _0800C200  @ gUnknown_03005280
	lsls r1, r1, #2
	adds r1, r1, r0
	adds r1, #0x30
	ldrb r2, [r1]
	movs r0, #0xfe
	ands r0, r2
	strb r0, [r1]
	movs r0, #0
	bx lr
	.align 2, 0
_0800C200: .4byte gUnknown_03005280

	THUMB_FUNC_END Event94_

	THUMB_FUNC_START Event95_
Event95_: @ 0x0800C204
	push {lr}
	ldr r1, [r0, #0x38]
	ldr r2, [r1, #4]
	ldrh r0, [r0, #0x3c]
	lsrs r0, r0, #2
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0800C22C
	ldr r0, _0800C228  @ gUnknown_03005280
	lsls r1, r2, #2
	adds r1, r1, r0
	adds r1, #0x30
	ldrb r2, [r1]
	movs r0, #1
	orrs r0, r2
	strb r0, [r1]
	b _0800C248
	.align 2, 0
_0800C228: .4byte gUnknown_03005280
_0800C22C:
	ldr r1, _0800C250  @ gUnknown_03005280
	lsls r0, r2, #2
	adds r0, r0, r1
	adds r0, #0x30
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _0800C248
	adds r0, r2, #0
	movs r1, #0
	movs r2, #0
	bl sub_80BFAEC
_0800C248:
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0
_0800C250: .4byte gUnknown_03005280

	THUMB_FUNC_END Event95_

	THUMB_FUNC_START Event96_
Event96_: @ 0x0800C254
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	ldr r0, [r7, #0x38]
	ldr r1, [r0, #4]
	movs r4, #0
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _0800C2C0  @ gUnknown_08206674
	adds r5, r0, r1
	movs r3, #4
	ldrsb r3, [r5, r3]
	ldr r2, _0800C2C4  @ gUnknown_03005280
	lsls r0, r3, #2
	adds r0, r0, r2
	adds r0, #0x30
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	mov ip, r2
	cmp r0, #0
	beq _0800C2A0
	adds r5, #4
	movs r6, #1
_0800C284:
	adds r4, #1
	cmp r4, #1
	bgt _0800C2D2
	adds r0, r5, r4
	movs r3, #0
	ldrsb r3, [r0, r3]
	lsls r0, r3, #2
	adds r0, r0, r2
	adds r0, #0x30
	ldrb r1, [r0]
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	bne _0800C284
_0800C2A0:
	cmp r4, #1
	bgt _0800C2D2
	ldrh r0, [r7, #0x3c]
	lsrs r0, r0, #2
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0800C2C8
	lsls r0, r3, #2
	add r0, ip
	adds r0, #0x30
	ldrb r2, [r0]
	orrs r1, r2
	strb r1, [r0]
	b _0800C2D2
	.align 2, 0
_0800C2C0: .4byte gUnknown_08206674
_0800C2C4: .4byte gUnknown_03005280
_0800C2C8:
	adds r0, r3, #0
	movs r1, #0
	movs r2, #0
	bl sub_80BFAEC
_0800C2D2:
	movs r0, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END Event96_

	THUMB_FUNC_START Event97_
Event97_: @ 0x0800C2DC
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r5, _0800C334  @ gUnknown_03005280
	adds r0, r5, #0
	adds r0, #0xc8
	ldrb r0, [r0]
	bl WMLoc_GetNextLocId
	adds r6, r0, #0
	cmp r6, #0
	blt _0800C364
	ldrh r0, [r4, #0x3c]
	lsrs r0, r0, #2
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0800C33C
	bl sub_80BCFB4
	lsls r1, r6, #2
	adds r1, r1, r5
	adds r1, #0x30
	ldrb r2, [r1]
	movs r0, #1
	orrs r0, r2
	movs r5, #2
	orrs r0, r5
	strb r0, [r1]
	ldr r4, _0800C338  @ gUnknown_08A3D748
	adds r0, r4, #0
	bl Proc_Find
	ldr r0, [r0, #0x48]
	adds r0, #0x33
	strb r6, [r0]
	adds r0, r4, #0
	bl Proc_Find
	ldr r1, [r0, #0x48]
	adds r1, #0x32
	ldrb r0, [r1]
	orrs r0, r5
	strb r0, [r1]
	b _0800C364
	.align 2, 0
_0800C334: .4byte gUnknown_03005280
_0800C338: .4byte gUnknown_08A3D748
_0800C33C:
	lsls r0, r6, #2
	adds r0, r0, r5
	adds r4, r0, #0
	adds r4, #0x30
	ldrb r1, [r4]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _0800C364
	adds r0, r6, #0
	movs r1, #0
	movs r2, #0
	bl sub_80BFAEC
	bl sub_80BCFB4
	ldrb r1, [r4]
	movs r0, #2
	orrs r0, r1
	strb r0, [r4]
_0800C364:
	movs r0, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	THUMB_FUNC_END Event97_

	THUMB_FUNC_START Event98_
Event98_: @ 0x0800C36C
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	ldr r0, [r7, #0x38]
	ldr r1, [r0, #4]
	movs r3, #0
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _0800C3FC  @ gUnknown_08206674
	adds r4, r0, r1
	movs r6, #4
	ldrsb r6, [r4, r6]
	ldr r2, _0800C400  @ gUnknown_03005280
	lsls r0, r6, #2
	adds r0, r0, r2
	adds r0, #0x30
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	mov ip, r2
	cmp r0, #0
	beq _0800C3BA
	adds r4, #4
	mov r5, ip
	movs r2, #1
_0800C39E:
	adds r3, #1
	cmp r3, #1
	bgt _0800C426
	adds r0, r4, r3
	movs r6, #0
	ldrsb r6, [r0, r6]
	lsls r0, r6, #2
	adds r0, r0, r5
	adds r0, #0x30
	ldrb r1, [r0]
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	bne _0800C39E
_0800C3BA:
	cmp r3, #1
	bgt _0800C426
	ldrh r0, [r7, #0x3c]
	lsrs r0, r0, #2
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0800C408
	lsls r1, r6, #2
	add r1, ip
	adds r1, #0x30
	ldrb r2, [r1]
	movs r0, #1
	orrs r0, r2
	movs r5, #2
	orrs r0, r5
	strb r0, [r1]
	ldr r4, _0800C404  @ gUnknown_08A3D748
	adds r0, r4, #0
	bl Proc_Find
	ldr r0, [r0, #0x48]
	adds r0, #0x33
	strb r6, [r0]
	adds r0, r4, #0
	bl Proc_Find
	ldr r1, [r0, #0x48]
	adds r1, #0x32
	ldrb r0, [r1]
	orrs r0, r5
	b _0800C424
	.align 2, 0
_0800C3FC: .4byte gUnknown_08206674
_0800C400: .4byte gUnknown_03005280
_0800C404: .4byte gUnknown_08A3D748
_0800C408:
	adds r0, r6, #0
	movs r1, #0
	movs r2, #0
	bl sub_80BFAEC
	bl sub_80BCFB4
	ldr r0, _0800C430  @ gUnknown_03005280
	lsls r1, r6, #2
	adds r1, r1, r0
	adds r1, #0x30
	ldrb r2, [r1]
	movs r0, #2
	orrs r0, r2
_0800C424:
	strb r0, [r1]
_0800C426:
	movs r0, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0800C430: .4byte gUnknown_03005280

	THUMB_FUNC_END Event98_

	THUMB_FUNC_START Event99_
Event99_: @ 0x0800C434
	push {lr}
	ldrh r0, [r0, #0x3c]
	lsrs r0, r0, #2
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0800C454
	bl sub_80BFB34
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0800C450
	bl sub_80BFB24
_0800C450:
	movs r0, #0
	b _0800C464
_0800C454:
	bl sub_80BFB34
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0800C462
	movs r0, #3
	b _0800C464
_0800C462:
	movs r0, #2
_0800C464:
	pop {r1}
	bx r1

	THUMB_FUNC_END Event99_

	THUMB_FUNC_START Event9A_
Event9A_: @ 0x0800C468
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	mov r8, r0
	ldr r0, [r0, #0x38]
	ldr r5, [r0, #4]
	ldr r1, _0800C4B4  @ gUnknown_03005280
	lsls r0, r5, #2
	adds r0, r0, r1
	adds r0, #0x30
	ldrb r1, [r0]
	movs r6, #2
	orrs r1, r6
	strb r1, [r0]
	ldr r4, _0800C4B8  @ gUnknown_08A3D748
	adds r0, r4, #0
	bl Proc_Find
	ldr r0, [r0, #0x48]
	adds r0, #0x33
	strb r5, [r0]
	adds r0, r4, #0
	bl Proc_Find
	ldr r1, [r0, #0x48]
	adds r1, #0x32
	ldrb r0, [r1]
	orrs r0, r6
	strb r0, [r1]
	mov r1, r8
	ldrh r0, [r1, #0x3c]
	lsrs r0, r0, #2
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _0800C4BC
	movs r0, #2
	b _0800C4BE
	.align 2, 0
_0800C4B4: .4byte gUnknown_03005280
_0800C4B8: .4byte gUnknown_08A3D748
_0800C4BC:
	movs r0, #0
_0800C4BE:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	THUMB_FUNC_END Event9A_

	THUMB_FUNC_START Event9B_
Event9B_: @ 0x0800C4C8
	ldr r0, [r0, #0x38]
	ldr r1, [r0, #4]
	ldr r0, _0800C4E0  @ gUnknown_03005280
	lsls r1, r1, #2
	adds r1, r1, r0
	adds r1, #0x30
	ldrb r2, [r1]
	movs r0, #2
	orrs r0, r2
	strb r0, [r1]
	movs r0, #0
	bx lr
	.align 2, 0
_0800C4E0: .4byte gUnknown_03005280

	THUMB_FUNC_END Event9B_

	THUMB_FUNC_START Event9C_
Event9C_: @ 0x0800C4E4
	push {r4, r5, lr}
	ldr r5, _0800C520  @ gUnknown_03005280
	adds r0, r5, #0
	adds r0, #0xc8
	ldrb r0, [r0]
	bl WMLoc_GetNextLocId
	adds r4, r0, #0
	cmp r4, #0
	blt _0800C516
	bl sub_80BCFB4
	lsls r1, r4, #2
	adds r1, r1, r5
	adds r1, #0x30
	ldrb r2, [r1]
	movs r0, #2
	orrs r0, r2
	strb r0, [r1]
	ldr r0, _0800C524  @ gUnknown_08A3D748
	bl Proc_Find
	ldr r0, [r0, #0x48]
	adds r0, #0x33
	strb r4, [r0]
_0800C516:
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0800C520: .4byte gUnknown_03005280
_0800C524: .4byte gUnknown_08A3D748

	THUMB_FUNC_END Event9C_

	THUMB_FUNC_START Event9D_
Event9D_: @ 0x0800C528
	push {lr}
	ldr r1, [r0, #0x38]
	ldr r2, [r1, #4]
	ldr r1, _0800C550  @ gUnknown_03005280
	lsls r2, r2, #2
	adds r2, r2, r1
	adds r2, #0x30
	ldrb r3, [r2]
	movs r1, #0xfd
	ands r1, r3
	strb r1, [r2]
	ldrh r0, [r0, #0x3c]
	lsrs r0, r0, #2
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _0800C554
	movs r0, #2
	b _0800C556
	.align 2, 0
_0800C550: .4byte gUnknown_03005280
_0800C554:
	movs r0, #0
_0800C556:
	pop {r1}
	bx r1

	THUMB_FUNC_END Event9D_

	THUMB_FUNC_START Event9E_PUTSPRITE
Event9E_PUTSPRITE: @ 0x0800C55C
	push {lr}
	ldr r3, [r0, #0x38]
	ldrh r0, [r3, #4]
	ldrh r1, [r3, #6]
	ldrh r2, [r3, #8]
	ldrh r3, [r3, #0xa]
	bl WM_PutClassSprite
	movs r0, #0
	pop {r1}
	bx r1

	THUMB_FUNC_END Event9E_PUTSPRITE

	THUMB_FUNC_START Event9F_
Event9F_: @ 0x0800C574
	push {lr}
	ldr r3, [r0, #0x38]
	ldrh r0, [r3, #4]
	ldrh r1, [r3, #6]
	ldrh r2, [r3, #8]
	ldrh r3, [r3, #0xa]
	bl WM_PutCharSprite
	movs r0, #0
	pop {r1}
	bx r1

	THUMB_FUNC_END Event9F_

	THUMB_FUNC_START EventA0_REMSPRITE
EventA0_REMSPRITE: @ 0x0800C58C
	push {lr}
	ldr r0, [r0, #0x38]
	ldr r0, [r0, #4]
	bl WM_RemoveUnit
	movs r0, #0
	pop {r1}
	bx r1

	THUMB_FUNC_END EventA0_REMSPRITE

	THUMB_FUNC_START EventA1_
EventA1_: @ 0x0800C59C
	push {lr}
	ldr r0, [r0, #0x38]
	ldr r0, [r0, #4]
	bl sub_80BF554
	movs r0, #0
	pop {r1}
	bx r1

	THUMB_FUNC_END EventA1_

	THUMB_FUNC_START EventA2_
EventA2_: @ 0x0800C5AC
	push {lr}
	ldr r0, [r0, #0x38]
	ldr r0, [r0, #4]
	bl sub_80BF570
	movs r0, #0
	pop {r1}
	bx r1

	THUMB_FUNC_END EventA2_

	THUMB_FUNC_START EventA3_
EventA3_: @ 0x0800C5BC
	push {r4, r5, lr}
	ldr r1, [r0, #0x38]
	ldrh r4, [r1, #4]
	ldrh r5, [r1, #6]
	ldrh r0, [r0, #0x3c]
	lsrs r0, r0, #2
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _0800C5E8
	ldr r0, _0800C5E4  @ gUnknown_08A3D748
	bl Proc_Find
	ldr r0, [r0, #0x54]
	lsls r2, r5, #0x10
	asrs r2, r2, #0x10
	adds r1, r4, #0
	bl sub_80BE40C
	b _0800C5EE
	.align 2, 0
_0800C5E4: .4byte gUnknown_08A3D748
_0800C5E8:
	adds r0, r4, #0
	bl sub_80BF554
_0800C5EE:
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END EventA3_

	THUMB_FUNC_START EventA4_
EventA4_: @ 0x0800C5F8
	push {r4, r5, lr}
	ldr r1, [r0, #0x38]
	ldrh r4, [r1, #4]
	ldrh r5, [r1, #6]
	ldrh r0, [r0, #0x3c]
	lsrs r0, r0, #2
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _0800C624
	ldr r0, _0800C620  @ gUnknown_08A3D748
	bl Proc_Find
	ldr r0, [r0, #0x54]
	lsls r2, r5, #0x10
	asrs r2, r2, #0x10
	adds r1, r4, #0
	bl sub_80BE42C
	b _0800C62A
	.align 2, 0
_0800C620: .4byte gUnknown_08A3D748
_0800C624:
	adds r0, r4, #0
	bl sub_80BF570
_0800C62A:
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END EventA4_

	THUMB_FUNC_START EventA5_
EventA5_: @ 0x0800C634
	push {lr}
	ldrh r0, [r0, #0x3c]
	lsrs r0, r0, #2
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0800C646
	bl sub_80BB47C
_0800C646:
	bl sub_80BE44C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0800C654
	movs r0, #3
	b _0800C656
_0800C654:
	movs r0, #2
_0800C656:
	pop {r1}
	bx r1

	THUMB_FUNC_END EventA5_

	THUMB_FUNC_START EventA6_
EventA6_: @ 0x0800C65C
	push {r4, r5, lr}
	ldr r0, [r0, #0x38]
	ldrh r4, [r0, #4]
	ldrh r5, [r0, #6]
	ldr r1, _0800C684  @ gUnknown_03005280
	lsls r0, r4, #2
	adds r0, r0, r1
	strb r5, [r0, #0x11]
	ldr r0, _0800C688  @ gUnknown_08A3D748
	bl Proc_Find
	ldr r0, [r0, #0x54]
	adds r1, r4, #0
	adds r2, r5, #0
	bl sub_80BE3C8
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0800C684: .4byte gUnknown_03005280
_0800C688: .4byte gUnknown_08A3D748

	THUMB_FUNC_END EventA6_

	THUMB_FUNC_START EventA7_
EventA7_: @ 0x0800C68C
	push {r4, r5, r6, lr}
	ldr r0, [r0, #0x38]
	ldrh r4, [r0, #4]
	ldrh r5, [r0, #8]
	ldrh r6, [r0, #0xa]
	ldr r0, _0800C6BC  @ gUnknown_08A3D748
	bl Proc_Find
	ldr r0, [r0, #0x54]
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	adds r1, r4, #0
	adds r2, r5, #0
	adds r3, r6, #0
	bl sub_80BE35C
	movs r0, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0800C6BC: .4byte gUnknown_08A3D748

	THUMB_FUNC_END EventA7_

	THUMB_FUNC_START EventA8_
EventA8_: @ 0x0800C6C0
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	sub sp, #0x14
	ldr r1, [r0, #0x38]
	ldrh r5, [r1, #4]
	ldrh r2, [r1, #6]
	ldrh r3, [r1, #8]
	ldrh r4, [r1, #0xa]
	mov ip, r4
	ldrh r6, [r1, #0xc]
	ldrh r7, [r1, #0xe]
	ldrh r4, [r1, #0x10]
	mov r9, r4
	ldrh r4, [r1, #0x12]
	ldrh r1, [r1, #0x14]
	mov r8, r1
	ldrh r0, [r0, #0x3c]
	lsrs r1, r0, #2
	movs r0, #1
	ands r1, r0
	cmp r1, #0
	beq _0800C720
	ldr r0, _0800C71C  @ gUnknown_08A3D748
	bl Proc_Find
	ldr r0, [r0, #0x54]
	lsls r1, r5, #0x10
	asrs r5, r1, #0x10
	lsls r2, r6, #0x10
	asrs r2, r2, #0x10
	lsls r3, r7, #0x10
	asrs r3, r3, #0x10
	adds r1, r5, #0
	bl sub_80BE35C
	movs r0, #2
	ands r4, r0
	cmp r4, #0
	beq _0800C744
	adds r0, r5, #0
	bl sub_80BF570
	b _0800C744
	.align 2, 0
_0800C71C: .4byte gUnknown_08A3D748
_0800C720:
	mov r0, sp
	strb r5, [r0]
	strb r2, [r0, #1]
	strb r1, [r0, #2]
	strh r3, [r0, #6]
	mov r1, ip
	strh r1, [r0, #8]
	strh r6, [r0, #0xa]
	strh r7, [r0, #0xc]
	mov r0, r9
	str r0, [sp, #0x10]
	mov r0, sp
	mov r1, r8
	strh r1, [r0, #0xe]
	adds r1, r4, #0
	movs r2, #0
	bl sub_80C33D4
_0800C744:
	movs r0, #0
	add sp, #0x14
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END EventA8_

	THUMB_FUNC_START EventA9_
EventA9_: @ 0x0800C754
	push {r4, r5, r6, r7, lr}
	sub sp, #0x10
	ldr r1, [r0, #0x38]
	ldrh r3, [r1, #4]
	ldrh r2, [r1, #6]
	ldrh r5, [r1, #8]
	ldrh r4, [r1, #0xa]
	ldrh r6, [r1, #0xc]
	ldrh r7, [r1, #0xe]
	ldrh r0, [r0, #0x3c]
	lsrs r1, r0, #2
	movs r0, #1
	ands r1, r0
	cmp r1, #0
	beq _0800C794
	ldr r1, _0800C790  @ gUnknown_03005280
	lsls r0, r3, #0x10
	asrs r3, r0, #0x10
	lsls r0, r3, #2
	adds r0, r0, r1
	strb r4, [r0, #0x11]
	movs r0, #2
	ands r2, r0
	cmp r2, #0
	beq _0800C7AA
	adds r0, r3, #0
	bl sub_80BF570
	b _0800C7AA
	.align 2, 0
_0800C790: .4byte gUnknown_03005280
_0800C794:
	mov r0, sp
	strb r3, [r0]
	strb r1, [r0, #1]
	strh r5, [r0, #6]
	strh r4, [r0, #8]
	str r6, [sp, #0xc]
	strh r7, [r0, #0xa]
	adds r1, r2, #0
	movs r2, #0
	bl sub_80C3378
_0800C7AA:
	movs r0, #0
	add sp, #0x10
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END EventA9_

	THUMB_FUNC_START EventAA_
EventAA_: @ 0x0800C7B4
	push {r4, lr}
	ldr r1, [r0, #0x38]
	ldrh r4, [r1, #4]
	ldrh r0, [r0, #0x3c]
	lsrs r0, r0, #2
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _0800C7D6
	ldr r0, _0800C7E0  @ gUnknown_08A3D748
	bl Proc_Find
	ldr r0, [r0, #0x54]
	lsls r1, r4, #0x10
	asrs r1, r1, #0x10
	bl sub_80BE054
_0800C7D6:
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0800C7E0: .4byte gUnknown_08A3D748

	THUMB_FUNC_END EventAA_

	THUMB_FUNC_START EventAB_
EventAB_: @ 0x0800C7E4
	push {r4, lr}
	ldr r1, [r0, #0x38]
	ldrh r4, [r1, #4]
	ldrh r0, [r0, #0x3c]
	lsrs r0, r0, #2
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _0800C806
	ldr r0, _0800C810  @ gUnknown_08A3D748
	bl Proc_Find
	ldr r0, [r0, #0x54]
	lsls r1, r4, #0x10
	asrs r1, r1, #0x10
	bl sub_80BE068
_0800C806:
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0800C810: .4byte gUnknown_08A3D748

	THUMB_FUNC_END EventAB_

	THUMB_FUNC_START EventAC_
EventAC_: @ 0x0800C814
	push {r4, lr}
	ldr r1, [r0, #0x38]
	ldrh r2, [r1, #4]
	ldrh r0, [r0, #0x3c]
	lsrs r0, r0, #2
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0800C840
	lsls r0, r2, #0x10
	asrs r4, r0, #0x10
	adds r0, r4, #0
	bl sub_80C3484
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0800C83C
	adds r0, r4, #0
	bl sub_80C343C
_0800C83C:
	movs r0, #0
	b _0800C854
_0800C840:
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	bl sub_80C3484
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0800C852
	movs r0, #3
	b _0800C854
_0800C852:
	movs r0, #2
_0800C854:
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END EventAC_

	THUMB_FUNC_START EventAD_
EventAD_: @ 0x0800C85C
	push {lr}
	ldr r1, [r0, #0x38]
	ldr r2, [r1, #4]
	ldrh r0, [r0, #0x3c]
	lsrs r0, r0, #2
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _0800C874
	movs r0, #0
	adds r1, r2, #0
	b _0800C878
_0800C874:
	movs r0, #0
	movs r1, #0
_0800C878:
	bl sub_80BF788
	movs r0, #0
	pop {r1}
	bx r1

	THUMB_FUNC_END EventAD_

	THUMB_FUNC_START EventAE_
EventAE_: @ 0x0800C884
	push {lr}
	ldrh r0, [r0, #0x3c]
	lsrs r0, r0, #2
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0800C89A
	bl sub_80BF748
	movs r0, #0
	b _0800C8AA
_0800C89A:
	bl sub_80BF730
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0800C8A8
	movs r0, #3
	b _0800C8AA
_0800C8A8:
	movs r0, #2
_0800C8AA:
	pop {r1}
	bx r1

	THUMB_FUNC_END EventAE_

	THUMB_FUNC_START EventAF_
EventAF_: @ 0x0800C8B0
	push {lr}
	ldr r1, [r0, #0x38]
	ldrh r2, [r1, #4]
	ldrh r3, [r1, #6]
	ldrh r0, [r0, #0x3c]
	lsrs r0, r0, #2
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _0800C8CC
	adds r0, r2, #0
	adds r1, r3, #0
	bl sub_80C0240
_0800C8CC:
	movs r0, #0
	pop {r1}
	bx r1

	THUMB_FUNC_END EventAF_

	THUMB_FUNC_START EventB0_
EventB0_: @ 0x0800C8D4
	push {lr}
	ldr r1, [r0, #0x38]
	ldrh r2, [r1, #4]
	ldrh r3, [r1, #6]
	ldrh r0, [r0, #0x3c]
	lsrs r0, r0, #2
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _0800C8F0
	adds r0, r2, #0
	adds r1, r3, #0
	bl sub_80C02A4
_0800C8F0:
	movs r0, #0
	pop {r1}
	bx r1

	THUMB_FUNC_END EventB0_

	THUMB_FUNC_START EventB1_
EventB1_: @ 0x0800C8F8
	push {lr}
	ldrh r0, [r0, #0x3c]
	lsrs r0, r0, #2
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0800C90E
	bl sub_80C0200
	movs r0, #0
	b _0800C91E
_0800C90E:
	bl sub_80C0228
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0800C91C
	movs r0, #3
	b _0800C91E
_0800C91C:
	movs r0, #2
_0800C91E:
	pop {r1}
	bx r1

	THUMB_FUNC_END EventB1_

	THUMB_FUNC_START EventB2_
EventB2_: @ 0x0800C924
	push {lr}
	ldr r0, [r0, #0x38]
	ldr r0, [r0, #4]
	movs r1, #0
	bl sub_80C04F4
	movs r0, #2
	pop {r1}
	bx r1

	THUMB_FUNC_END EventB2_

	THUMB_FUNC_START EventB3_
EventB3_: @ 0x0800C938
	push {lr}
	bl sub_80C0530
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0800C948
	movs r0, #3
	b _0800C94A
_0800C948:
	movs r0, #2
_0800C94A:
	pop {r1}
	bx r1

	THUMB_FUNC_END EventB3_

	THUMB_FUNC_START EventB4_
EventB4_: @ 0x0800C950
	push {r4, lr}
	ldr r1, [r0, #0x38]
	ldrh r3, [r1, #4]
	ldrh r2, [r1, #6]
	ldr r4, [r1, #8]
	ldrh r0, [r0, #0x3c]
	lsrs r0, r0, #2
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _0800C976
	lsls r0, r3, #0x10
	asrs r0, r0, #0x10
	lsls r1, r2, #0x10
	asrs r1, r1, #0x10
	adds r2, r4, #0
	movs r3, #0
	bl Make6C_Gmap_RM
_0800C976:
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END EventB4_

	THUMB_FUNC_START EventB5_
EventB5_: @ 0x0800C980
	push {lr}
	ldrh r0, [r0, #0x3c]
	lsrs r0, r0, #2
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _0800C994
	bl sub_80C24D8
	b _0800C998
_0800C994:
	bl sub_80C24F8
_0800C998:
	movs r0, #0
	pop {r1}
	bx r1

	THUMB_FUNC_END EventB5_

	THUMB_FUNC_START EventB6_
EventB6_: @ 0x0800C9A0
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	ldr r1, [r0, #0x38]
	ldrh r2, [r1, #4]
	ldrh r3, [r1, #6]
	ldrh r4, [r1, #8]
	ldrh r6, [r1, #0xa]
	ldrh r7, [r1, #0xc]
	ldrh r1, [r1, #0xe]
	mov ip, r1
	ldrh r0, [r0, #0x3c]
	lsrs r5, r0, #2
	movs r0, #1
	ands r5, r0
	cmp r5, #0
	bne _0800C9E4
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	lsls r1, r3, #0x10
	asrs r1, r1, #0x10
	lsls r2, r4, #0x10
	asrs r2, r2, #0x10
	lsls r3, r6, #0x10
	asrs r3, r3, #0x10
	lsls r4, r7, #0x10
	asrs r4, r4, #0x10
	str r4, [sp]
	mov r6, ip
	lsls r4, r6, #0x10
	asrs r4, r4, #0x10
	str r4, [sp, #4]
	str r5, [sp, #8]
	bl sub_80C1F18
_0800C9E4:
	movs r0, #0
	add sp, #0xc
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END EventB6_

	THUMB_FUNC_START EventB7_
EventB7_: @ 0x0800C9F0
	push {lr}
	ldrh r0, [r0, #0x3c]
	lsrs r0, r0, #2
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0800CA06
	bl sub_80C24F8
	movs r0, #0
	b _0800CA14
_0800CA06:
	bl sub_80C2470
	cmp r0, #0
	bne _0800CA12
	movs r0, #0
	b _0800CA14
_0800CA12:
	movs r0, #3
_0800CA14:
	pop {r1}
	bx r1

	THUMB_FUNC_END EventB7_

	THUMB_FUNC_START EventB8_
EventB8_: @ 0x0800CA18
	push {lr}
	ldr r1, [r0, #0x38]
	ldr r2, [r1, #4]
	ldrh r0, [r0, #0x3c]
	lsrs r0, r0, #2
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _0800CA32
	adds r0, r2, #0
	movs r1, #0
	bl sub_80C2AD4
_0800CA32:
	movs r0, #0
	pop {r1}
	bx r1

	THUMB_FUNC_END EventB8_

	THUMB_FUNC_START EventB9_
EventB9_: @ 0x0800CA38
	push {lr}
	ldr r1, [r0, #0x38]
	ldr r2, [r1, #4]
	ldrh r0, [r0, #0x3c]
	lsrs r0, r0, #2
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _0800CA52
	adds r0, r2, #0
	bl sub_80C2C10
	b _0800CA5A
_0800CA52:
	movs r0, #1
	negs r0, r0
	bl sub_80C2B7C
_0800CA5A:
	movs r0, #0
	pop {r1}
	bx r1

	THUMB_FUNC_END EventB9_

	THUMB_FUNC_START EventBA_
EventBA_: @ 0x0800CA60
	push {r4, lr}
	ldr r1, [r0, #0x38]
	ldr r4, [r1, #4]
	ldrh r0, [r0, #0x3c]
	lsrs r0, r0, #2
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0800CA86
	adds r0, r4, #0
	bl sub_80C2BC4
	cmp r0, #0
	beq _0800CA82
	adds r0, r4, #0
	bl sub_80C2B7C
_0800CA82:
	movs r0, #0
	b _0800CA96
_0800CA86:
	adds r0, r4, #0
	bl sub_80C2BC4
	cmp r0, #0
	beq _0800CA94
	movs r0, #3
	b _0800CA96
_0800CA94:
	movs r0, #2
_0800CA96:
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END EventBA_

	THUMB_FUNC_START EventBB_
EventBB_: @ 0x0800CA9C
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	ldr r1, [r0, #0x38]
	ldrh r2, [r1, #4]
	ldrh r3, [r1, #6]
	ldrh r5, [r1, #8]
	ldrh r6, [r1, #0xa]
	ldr r7, [r1, #0xc]
	ldrh r0, [r0, #0x3c]
	lsrs r4, r0, #2
	movs r0, #1
	ands r4, r0
	cmp r4, #0
	bne _0800CAD0
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	lsls r1, r3, #0x10
	asrs r1, r1, #0x10
	lsls r2, r5, #0x10
	asrs r2, r2, #0x10
	lsls r3, r6, #0x10
	asrs r3, r3, #0x10
	str r7, [sp]
	str r4, [sp, #4]
	bl sub_80C2FC0
_0800CAD0:
	movs r0, #0
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END EventBB_

	THUMB_FUNC_START EventBC_
EventBC_: @ 0x0800CADC
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	ldr r1, [r0, #0x38]
	ldrh r6, [r1, #4]
	ldrh r7, [r1, #6]
	ldrh r3, [r1, #8]
	ldrh r1, [r1, #0xa]
	mov ip, r1
	ldrh r0, [r0, #0x3c]
	lsrs r5, r0, #2
	movs r0, #1
	ands r5, r0
	cmp r5, #0
	bne _0800CB38
	add r2, sp, #8
	lsls r0, r3, #0x10
	asrs r0, r0, #0xb
	ldr r1, _0800CB44  @ gUnknown_082060B0
	adds r0, r0, r1
	ldrh r1, [r0, #0x18]
	strh r1, [r2]
	mov r4, sp
	adds r4, #0xa
	ldrh r0, [r0, #0x1a]
	strh r0, [r4]
	lsls r0, r6, #0x10
	asrs r0, r0, #0x10
	lsls r1, r7, #0x10
	asrs r1, r1, #0x10
	movs r3, #0
	ldrsh r2, [r2, r3]
	lsrs r3, r2, #0x1f
	adds r2, r2, r3
	asrs r2, r2, #1
	movs r6, #0
	ldrsh r3, [r4, r6]
	lsrs r4, r3, #0x1f
	adds r3, r3, r4
	asrs r3, r3, #1
	mov r6, ip
	lsls r4, r6, #0x10
	asrs r4, r4, #0x10
	str r4, [sp]
	str r5, [sp, #4]
	bl sub_80C2FC0
_0800CB38:
	movs r0, #0
	add sp, #0xc
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0800CB44: .4byte gUnknown_082060B0

	THUMB_FUNC_END EventBC_

	THUMB_FUNC_START EventBD_
EventBD_: @ 0x0800CB48
	push {lr}
	ldr r1, [r0, #0x38]
	ldr r2, [r1, #4]
	ldrh r0, [r0, #0x3c]
	lsrs r0, r0, #2
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _0800CB62
	adds r0, r2, #0
	bl sub_80C30E0
	b _0800CB6A
_0800CB62:
	movs r0, #1
	negs r0, r0
	bl sub_80C304C
_0800CB6A:
	movs r0, #0
	pop {r1}
	bx r1

	THUMB_FUNC_END EventBD_

	THUMB_FUNC_START EventBE_
EventBE_: @ 0x0800CB70
	push {r4, lr}
	ldr r1, [r0, #0x38]
	ldr r4, [r1, #4]
	ldrh r0, [r0, #0x3c]
	lsrs r0, r0, #2
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0800CB96
	adds r0, r4, #0
	bl sub_80C3094
	cmp r0, #0
	beq _0800CB92
	adds r0, r4, #0
	bl sub_80C304C
_0800CB92:
	movs r0, #0
	b _0800CBA6
_0800CB96:
	adds r0, r4, #0
	bl sub_80C3094
	cmp r0, #0
	beq _0800CBA4
	movs r0, #3
	b _0800CBA6
_0800CBA4:
	movs r0, #2
_0800CBA6:
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END EventBE_

	THUMB_FUNC_START EventBF_
EventBF_: @ 0x0800CBAC
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _0800CBD4  @ gUnknown_08A3D748
	adds r0, r4, #0
	bl Proc_Find
	bl sub_80B9FD4
	adds r0, r4, #0
	bl Proc_Find
	bl sub_80B9810
	adds r0, r5, #0
	bl Make6C_savemenu2
	movs r0, #2
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0800CBD4: .4byte gUnknown_08A3D748

	THUMB_FUNC_END EventBF_

	THUMB_FUNC_START EventC0_
EventC0_: @ 0x0800CBD8
	push {lr}
	ldr r0, _0800CBEC  @ gUnknown_08A3D748
	bl Proc_Find
	bl sub_80B9154
	movs r0, #2
	pop {r1}
	bx r1
	.align 2, 0
_0800CBEC: .4byte gUnknown_08A3D748

	THUMB_FUNC_END EventC0_

	THUMB_FUNC_START EventC1_SKIPWM
EventC1_SKIPWM: @ 0x0800CBF0
	ldr r0, _0800CC00  @ gUnknown_03005280
	ldrb r1, [r0]
	movs r2, #0x40
	orrs r1, r2
	strb r1, [r0]
	movs r0, #0
	bx lr
	.align 2, 0
_0800CC00: .4byte gUnknown_03005280

	THUMB_FUNC_END EventC1_SKIPWM

	THUMB_FUNC_START EventC2_
EventC2_: @ 0x0800CC04
	ldr r0, _0800CC14  @ gUnknown_03005280
	ldrb r1, [r0]
	movs r2, #0x80
	orrs r1, r2
	strb r1, [r0]
	movs r0, #0
	bx lr
	.align 2, 0
_0800CC14: .4byte gUnknown_03005280

	THUMB_FUNC_END EventC2_

	THUMB_FUNC_START EventC3_
EventC3_: @ 0x0800CC18
	push {r4, r5, lr}
	ldr r0, [r0, #0x38]
	ldrh r4, [r0, #4]
	ldrh r3, [r0, #6]
	ldr r5, [r0, #8]
	ldr r1, _0800CC3C  @ gUnknown_03005280
	lsls r0, r4, #2
	adds r2, r0, r1
	ldrb r1, [r2, #0x10]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _0800CC40
	movs r1, #0x12
	ldrsh r0, [r2, r1]
	cmp r0, r3
	bne _0800CC44
	b _0800CC52
	.align 2, 0
_0800CC3C: .4byte gUnknown_03005280
_0800CC40:
	cmp r3, #0
	beq _0800CC52
_0800CC44:
	movs r2, #1
	negs r2, r2
	adds r0, r4, #0
	adds r1, r3, #0
	adds r3, r5, #0
	bl WM_PutCharSprite
_0800CC52:
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_END EventC3_

	THUMB_FUNC_START EventCE_
EventCE_: @ 0x0800CC5C
	push {lr}
	ldrh r0, [r0, #0x3c]
	lsrs r0, r0, #2
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _0800CC6E
	movs r0, #2
	b _0800CC70
_0800CC6E:
	movs r0, #0
_0800CC70:
	pop {r1}
	bx r1

	THUMB_FUNC_END EventCE_

	THUMB_FUNC_START EventCF_
EventCF_: @ 0x0800CC74
	push {lr}
	ldrh r0, [r0, #0x3c]
	lsrs r0, r0, #2
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _0800CC86
	movs r0, #2
	b _0800CC88
_0800CC86:
	movs r0, #0
_0800CC88:
	pop {r1}
	bx r1

	THUMB_FUNC_END EventCF_

	THUMB_FUNC_START EventC4_
EventC4_: @ 0x0800CC8C
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	ldr r1, [r0, #0x38]
	ldrh r2, [r1, #4]
	adds r6, r2, #0
	ldrh r3, [r1, #6]
	adds r7, r3, #0
	ldrh r5, [r1, #8]
	mov ip, r5
	ldrh r4, [r1, #0xa]
	ldrh r0, [r0, #0x3c]
	lsrs r1, r0, #2
	movs r0, #1
	ands r1, r0
	cmp r1, #0
	bne _0800CCDE
	lsls r0, r4, #0x10
	asrs r4, r0, #0x10
	cmp r4, #0
	beq _0800CCD0
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	str r1, [sp]
	str r1, [sp, #4]
	lsls r0, r5, #0x10
	asrs r0, r0, #0x10
	str r0, [sp, #8]
	adds r0, r4, #0
	movs r1, #6
	bl sub_80BA0B4
	b _0800CCDE
_0800CCD0:
	lsls r0, r6, #0x10
	asrs r0, r0, #0x10
	lsls r1, r7, #0x10
	asrs r1, r1, #0x10
	mov r2, ip
	bl sub_80B86CC
_0800CCDE:
	movs r0, #0
	add sp, #0xc
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_END EventC4_

	THUMB_FUNC_START sub_800CCE8
sub_800CCE8: @ 0x0800CCE8
	bx lr

	THUMB_FUNC_END sub_800CCE8

	THUMB_FUNC_START nullsub_32
nullsub_32: @ 0x0800CCEC
	bx lr

	THUMB_FUNC_END nullsub_32

	THUMB_FUNC_START EventC5_
EventC5_: @ 0x0800CCF0
	push {r4, lr}
	sub sp, #0xc
	ldr r1, [r0, #0x38]
	ldrh r2, [r1, #2]
	ldrh r4, [r1, #4]
	ldrh r3, [r1, #6]
	ldrh r0, [r0, #0x3c]
	lsrs r1, r0, #2
	movs r0, #1
	ands r1, r0
	cmp r1, #0
	beq _0800CD10
	adds r0, r2, #0
	bl DeleteFaceByIndex
	b _0800CD2E
_0800CD10:
	cmp r3, #0
	beq _0800CD26
	str r1, [sp]
	str r1, [sp, #4]
	str r4, [sp, #8]
	adds r0, r3, #0
	movs r1, #7
	movs r3, #0
	bl sub_80BA0B4
	b _0800CD2E
_0800CD26:
	adds r1, r4, #0
	adds r0, r2, #0
	bl sub_80B8844
_0800CD2E:
	movs r0, #0
	add sp, #0xc
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END EventC5_

	THUMB_FUNC_START sub_800CD38
sub_800CD38: @ 0x0800CD38
	bx lr

	THUMB_FUNC_END sub_800CD38

	THUMB_FUNC_START nullsub_34
nullsub_34: @ 0x0800CD3C
	bx lr

	THUMB_FUNC_END nullsub_34

	THUMB_FUNC_START sub_800CD40
sub_800CD40: @ 0x0800CD40
	push {lr}
	movs r1, #0x2a
	ldrsh r0, [r0, r1]
	bl DeleteFaceByIndex
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_800CD40

	THUMB_FUNC_START EventC6_
EventC6_: @ 0x0800CD50
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x3c]
	lsrs r0, r0, #2
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0800CD64
	movs r0, #0
	b _0800CD82
_0800CD64:
	ldr r1, [r4, #0x38]
	ldrh r0, [r1, #4]
	ldrh r1, [r1, #6]
	orrs r0, r1
	bl sub_80C36A0
	ldrh r1, [r4, #0x3c]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _0800CD80
	movs r0, #4
	bl sub_8006AA8
_0800CD80:
	movs r0, #2
_0800CD82:
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END EventC6_

	THUMB_FUNC_START EventC7_
EventC7_: @ 0x0800CD88
	push {lr}
	ldrh r0, [r0, #0x3c]
	lsrs r0, r0, #2
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _0800CDA0
	movs r0, #1
	bl sub_80C3624
	movs r0, #2
	b _0800CDA2
_0800CDA0:
	movs r0, #0
_0800CDA2:
	pop {r1}
	bx r1

	THUMB_FUNC_END EventC7_

	THUMB_FUNC_START EventC8_
EventC8_: @ 0x0800CDA8
	push {lr}
	ldrh r0, [r0, #0x3c]
	lsrs r0, r0, #2
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _0800CDC0
	movs r0, #0
	bl sub_80C3624
	movs r0, #2
	b _0800CDC2
_0800CDC0:
	movs r0, #0
_0800CDC2:
	pop {r1}
	bx r1

	THUMB_FUNC_END EventC8_

	THUMB_FUNC_START EventC9_
EventC9_: @ 0x0800CDC8
	push {lr}
	ldrh r0, [r0, #0x3c]
	lsrs r0, r0, #2
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _0800CDDE
	bl sub_80C3660
	movs r0, #2
	b _0800CDE4
_0800CDDE:
	bl sub_80C3660
	movs r0, #0
_0800CDE4:
	pop {r1}
	bx r1

	THUMB_FUNC_END EventC9_

	THUMB_FUNC_START sub_800CDE8
sub_800CDE8: @ 0x0800CDE8
	bx lr

	THUMB_FUNC_END sub_800CDE8

	THUMB_FUNC_START sub_800CDEC
sub_800CDEC: @ 0x0800CDEC
	bx lr

	THUMB_FUNC_END sub_800CDEC

	THUMB_FUNC_START EventCA_
EventCA_: @ 0x0800CDF0
	movs r0, #0
	bx lr

	THUMB_FUNC_END EventCA_

	THUMB_FUNC_START EventCB_
EventCB_: @ 0x0800CDF4
	movs r0, #0
	bx lr

	THUMB_FUNC_END EventCB_

	THUMB_FUNC_START EventCC_
EventCC_: @ 0x0800CDF8
	push {r4, lr}
	ldr r1, [r0, #0x38]
	ldrh r4, [r1, #2]
	ldrh r3, [r1, #4]
	ldrh r2, [r1, #6]
	ldrh r0, [r0, #0x3c]
	lsrs r0, r0, #2
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _0800CE1E
	lsls r0, r3, #0x10
	asrs r0, r0, #0x10
	lsls r1, r2, #0x10
	asrs r1, r1, #0x10
	lsls r2, r4, #0x10
	asrs r2, r2, #0x10
	bl sub_80B8188
_0800CE1E:
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END EventCC_

	THUMB_FUNC_START EventCD_
EventCD_: @ 0x0800CE28
	push {lr}
	ldrh r0, [r0, #0x3c]
	lsrs r0, r0, #2
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _0800CE3A
	bl nullsub_7
_0800CE3A:
	movs r0, #0
	pop {r1}
	bx r1
	THUMB_FUNC_END EventCD_
