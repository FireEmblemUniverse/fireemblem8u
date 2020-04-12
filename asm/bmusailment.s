	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	@ unit status effects update (poison & such)

	THUMB_FUNC_START sub_8035AA4
sub_8035AA4: @ 0x08035AA4
	push {r4, r5, r6, lr}
	bl ClearBg0Bg1
	ldr r0, _08035AF8  @ gUnknown_08A032AC
	ldr r1, _08035AFC  @ 0x06005000
	bl CopyDataWithPossibleUncomp
	ldr r0, _08035B00  @ gUnknown_08A03334
	movs r1, #0x60
	movs r2, #0x20
	bl CopyToPaletteBuffer
	ldr r4, _08035B04  @ gBG0TilemapBuffer
	ldr r1, _08035B08  @ gUnknown_08A03354
	movs r2, #0xca
	lsls r2, r2, #6
	adds r0, r4, #0
	bl CallARM_FillTileRect
	adds r6, r4, #0
	movs r0, #0x80
	lsls r0, r0, #1
	adds r5, r6, r0
	movs r4, #6
_08035AD4:
	adds r0, r6, #0
	adds r1, r5, #0
	movs r2, #2
	movs r3, #4
	bl TileMap_CopyRect
	movs r0, #0x80
	lsls r0, r0, #1
	adds r5, r5, r0
	subs r4, #1
	cmp r4, #0
	bge _08035AD4
	movs r0, #1
	bl BG_EnableSyncByMask
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08035AF8: .4byte gUnknown_08A032AC
_08035AFC: .4byte 0x06005000
_08035B00: .4byte gUnknown_08A03334
_08035B04: .4byte gBG0TilemapBuffer
_08035B08: .4byte gUnknown_08A03354

	THUMB_FUNC_END sub_8035AA4

	THUMB_FUNC_START sub_8035B0C
sub_8035B0C: @ 0x08035B0C
	push {r4, lr}
	ldr r1, _08035B3C  @ gUnknown_0202BCB0
	ldr r0, _08035B40  @ gActiveUnit
	ldr r0, [r0]
	ldrb r0, [r0, #0x10]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #4
	ldrh r4, [r1, #0xc]
	subs r4, r4, r0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	bl GetGameClock
	adds r2, r0, #0
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #0
	adds r1, r4, #0
	bl BG_SetPosition
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08035B3C: .4byte gUnknown_0202BCB0
_08035B40: .4byte gActiveUnit

	THUMB_FUNC_END sub_8035B0C

	THUMB_FUNC_START sub_8035B44
sub_8035B44: @ 0x08035B44
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	mov r8, r0
	ldr r0, _08035BE4  @ gActiveUnit
	ldr r0, [r0]
	bl HideUnitSMS
	ldr r3, _08035BE8  @ gLCDControlBuffer
	ldrb r2, [r3, #1]
	movs r1, #0x21
	negs r1, r1
	adds r0, r1, #0
	ands r0, r2
	movs r2, #0x41
	negs r2, r2
	ands r0, r2
	movs r2, #0x80
	orrs r0, r2
	strb r0, [r3, #1]
	movs r0, #0x36
	adds r0, r0, r3
	mov ip, r0
	ldrb r0, [r0]
	ands r1, r0
	adds r3, #0x37
	ldrb r0, [r3]
	movs r2, #0x20
	orrs r0, r2
	movs r2, #2
	negs r2, r2
	ands r1, r2
	movs r6, #3
	negs r6, r6
	ands r1, r6
	movs r5, #5
	negs r5, r5
	ands r1, r5
	movs r4, #8
	orrs r1, r4
	movs r2, #0x10
	orrs r1, r2
	mov r7, ip
	strb r1, [r7]
	movs r1, #1
	orrs r0, r1
	ands r0, r6
	ands r0, r5
	orrs r0, r4
	orrs r0, r2
	strb r0, [r3]
	movs r0, #0
	str r0, [sp]
	movs r0, #1
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl sub_8001ED0
	movs r0, #1
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl sub_8001F0C
	movs r0, #0x4c
	add r8, r0
	movs r0, #0x40
	mov r1, r8
	strh r0, [r1]
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08035BE4: .4byte gActiveUnit
_08035BE8: .4byte gLCDControlBuffer

	THUMB_FUNC_END sub_8035B44

	THUMB_FUNC_START sub_8035BEC
sub_8035BEC: @ 0x08035BEC
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r0, _08035C3C  @ gActiveUnit
	ldr r4, [r0]
	movs r1, #0x10
	ldrsb r1, [r4, r1]
	lsls r1, r1, #4
	ldr r3, _08035C40  @ gUnknown_0202BCB0
	movs r2, #0xc
	ldrsh r0, [r3, r2]
	subs r1, r1, r0
	movs r2, #0x11
	ldrsb r2, [r4, r2]
	lsls r2, r2, #4
	movs r6, #0xe
	ldrsh r0, [r3, r6]
	subs r2, r2, r0
	movs r3, #0xa0
	lsls r3, r3, #6
	str r4, [sp]
	movs r0, #4
	bl sub_8028014
	adds r1, r5, #0
	adds r1, #0x4c
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _08035C32
	adds r0, r5, #0
	bl Proc_Break
_08035C32:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08035C3C: .4byte gActiveUnit
_08035C40: .4byte gUnknown_0202BCB0

	THUMB_FUNC_END sub_8035BEC

	THUMB_FUNC_START sub_8035C44
sub_8035C44: @ 0x08035C44
	push {lr}
	ldr r0, _08035C54  @ gActiveUnit
	ldr r0, [r0]
	bl ShowUnitSMS
	pop {r0}
	bx r0
	.align 2, 0
_08035C54: .4byte gActiveUnit

	THUMB_FUNC_END sub_8035C44

	THUMB_FUNC_START sub_8035C58
sub_8035C58: @ 0x08035C58
	adds r2, r0, #0
	adds r2, #0x4c
	movs r3, #0
	movs r1, #0xf
	strh r1, [r2]
	str r3, [r0, #0x2c]
	movs r1, #1
	str r1, [r0, #0x34]
	bx lr

	THUMB_FUNC_END sub_8035C58

	THUMB_FUNC_START sub_8035C6C
sub_8035C6C: @ 0x08035C6C
	adds r2, r0, #0
	adds r2, #0x4c
	movs r1, #0xf
	strh r1, [r2]
	movs r1, #0x10
	str r1, [r0, #0x2c]
	subs r1, #0x11
	str r1, [r0, #0x34]
	bx lr

	THUMB_FUNC_END sub_8035C6C

	THUMB_FUNC_START sub_8035C80
sub_8035C80: @ 0x08035C80
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x2c]
	ldr r0, [r4, #0x34]
	adds r1, r1, r0
	str r1, [r4, #0x2c]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	movs r0, #1
	movs r2, #0x10
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	adds r1, r4, #0
	adds r1, #0x4c
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _08035CB0
	adds r0, r4, #0
	bl Proc_Break
_08035CB0:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8035C80

	THUMB_FUNC_START sub_8035CB8
sub_8035CB8: @ 0x08035CB8
	push {r4, lr}
	adds r4, r0, #0
	movs r2, #0
	ldr r0, _08035CD8  @ gActiveUnit
	ldr r0, [r0]
	movs r1, #0xb
	ldrsb r1, [r0, r1]
	movs r0, #0xc0
	ands r1, r0
	cmp r1, #0x40
	beq _08035CF4
	cmp r1, #0x40
	bgt _08035CDC
	cmp r1, #0
	beq _08035CE2
	b _08035CF6
	.align 2, 0
_08035CD8: .4byte gActiveUnit
_08035CDC:
	cmp r1, #0x80
	beq _08035CEC
	b _08035CF6
_08035CE2:
	ldr r2, _08035CE8  @ gUnknown_02022C28
	b _08035CF6
	.align 2, 0
_08035CE8: .4byte gUnknown_02022C28
_08035CEC:
	ldr r2, _08035CF0  @ gUnknown_02022C48
	b _08035CF6
	.align 2, 0
_08035CF0: .4byte gUnknown_02022C48
_08035CF4:
	ldr r2, _08035D10  @ gUnknown_02022C68
_08035CF6:
	movs r1, #0x90
	lsls r1, r1, #2
	adds r0, r2, #0
	movs r2, #0x20
	bl CopyToPaletteBuffer
	adds r1, r4, #0
	adds r1, #0x4c
	movs r0, #0
	strh r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08035D10: .4byte gUnknown_02022C68

	THUMB_FUNC_END sub_8035CB8

	THUMB_FUNC_START sub_8035D14
sub_8035D14: @ 0x08035D14
	push {lr}
	adds r3, r1, #0
	cmp r3, #0x1f
	ble _08035D1E
	movs r3, #0x1f
_08035D1E:
	cmp r3, #0
	bge _08035D24
	movs r3, #0
_08035D24:
	ldr r0, _08035D3C  @ gPaletteBuffer
	lsls r1, r3, #0xa
	lsls r2, r3, #5
	adds r1, r1, r2
	adds r1, r1, r3
	ldr r2, _08035D40  @ 0x0000025E
	adds r0, r0, r2
	strh r1, [r0]
	bl EnablePaletteSync
	pop {r0}
	bx r0
	.align 2, 0
_08035D3C: .4byte gPaletteBuffer
_08035D40: .4byte 0x0000025E

	THUMB_FUNC_END sub_8035D14

	THUMB_FUNC_START sub_8035D44
sub_8035D44: @ 0x08035D44
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r5, #0
	adds r4, #0x4c
	movs r0, #0
	ldrsh r1, [r4, r0]
	adds r0, r5, #0
	bl sub_8035D14
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x20
	bne _08035D6A
	adds r0, r5, #0
	bl Proc_Break
_08035D6A:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8035D44

	THUMB_FUNC_START sub_8035D70
sub_8035D70: @ 0x08035D70
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r5, #0
	adds r4, #0x4c
	movs r0, #0
	ldrsh r1, [r4, r0]
	adds r0, r5, #0
	bl sub_8035D14
	ldrh r0, [r4]
	subs r0, #1
	strh r0, [r4]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _08035D94
	adds r0, r5, #0
	bl Proc_Break
_08035D94:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8035D70

	THUMB_FUNC_START sub_8035D9C
sub_8035D9C: @ 0x08035D9C
	push {r4, lr}
	bl ClearBg0Bg1
	ldr r4, _08035DD8  @ gLCDControlBuffer
	ldrb r1, [r4, #1]
	movs r0, #0x21
	negs r0, r0
	ands r0, r1
	movs r1, #0x41
	negs r1, r1
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r4, #1]
	bl SetDefaultColorEffects
	adds r2, r4, #0
	adds r2, #0x36
	ldrb r0, [r2]
	movs r1, #0x20
	orrs r0, r1
	strb r0, [r2]
	adds r4, #0x37
	ldrb r0, [r4]
	orrs r0, r1
	strb r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08035DD8: .4byte gLCDControlBuffer

	THUMB_FUNC_END sub_8035D9C

	THUMB_FUNC_START sub_8035DDC
sub_8035DDC: @ 0x08035DDC
	push {lr}
	adds r2, r1, #0
	ldr r1, _08035E04  @ gActiveUnit
	str r0, [r1]
	cmp r2, #0
	beq _08035E10
	ldr r0, _08035E08  @ gUnknown_0859E2D0
	adds r1, r2, #0
	bl Proc_StartBlocking
	ldr r0, _08035E0C  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08035E18
	movs r0, #0xaa
	bl m4aSongNumStart
	b _08035E18
	.align 2, 0
_08035E04: .4byte gActiveUnit
_08035E08: .4byte gUnknown_0859E2D0
_08035E0C: .4byte gRAMChapterData
_08035E10:
	ldr r0, _08035E1C  @ gUnknown_0859E2D0
	movs r1, #3
	bl Proc_StartBlocking
_08035E18:
	pop {r0}
	bx r0
	.align 2, 0
_08035E1C: .4byte gUnknown_0859E2D0

	THUMB_FUNC_END sub_8035DDC

	THUMB_FUNC_START sub_8035E20
sub_8035E20: @ 0x08035E20
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08035E3C  @ gRAMChapterData
	ldrb r0, [r0, #0xf]
	bl sub_8025904
	bl sub_804FD28
	cmp r0, #0
	bne _08035E40
	adds r0, r4, #0
	bl Proc_End
	b _08035E48
	.align 2, 0
_08035E3C: .4byte gRAMChapterData
_08035E40:
	adds r1, r4, #0
	adds r1, #0x4c
	movs r0, #0
	strh r0, [r1]
_08035E48:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8035E20

	THUMB_FUNC_START sub_8035E50
sub_8035E50: @ 0x08035E50
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r5, r7, #0
	adds r5, #0x4c
	movs r1, #0
	ldrsh r0, [r5, r1]
	bl GetTarget
	adds r4, r0, #0
	movs r0, #2
	ldrsb r0, [r4, r0]
	bl GetUnit
	adds r6, r0, #0
	ldr r1, _08035E88  @ gActionData
	ldrb r0, [r4, #2]
	strb r0, [r1, #0xc]
	movs r0, #0
	ldrsh r4, [r5, r0]
	bl sub_804FD28
	cmp r4, r0
	bne _08035E8C
	adds r0, r7, #0
	bl Proc_End
	b _08035ED2
	.align 2, 0
_08035E88: .4byte gActionData
_08035E8C:
	ldr r0, _08035EB8  @ gRAMChapterData
	ldrb r0, [r0, #0xd]
	cmp r0, #0
	beq _08035EC0
	movs r0, #0x11
	ldrsb r0, [r6, r0]
	ldr r1, _08035EBC  @ gBmMapFog
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r1, #0x10
	ldrsb r1, [r6, r1]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0
	bne _08035EC0
	adds r0, r7, #0
	movs r1, #1
	bl Proc_Goto
	b _08035ED2
	.align 2, 0
_08035EB8: .4byte gRAMChapterData
_08035EBC: .4byte gBmMapFog
_08035EC0:
	adds r0, r6, #0
	bl GetUnitCurrentHp
	cmp r0, #0
	bne _08035ED2
	adds r0, r7, #0
	movs r1, #1
	bl Proc_Goto
_08035ED2:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8035E50

	THUMB_FUNC_START sub_8035ED8
sub_8035ED8: @ 0x08035ED8
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x4c
	movs r1, #0
	ldrsh r0, [r0, r1]
	bl GetTarget
	movs r1, #0
	ldrsb r1, [r0, r1]
	movs r2, #1
	ldrsb r2, [r0, r2]
	adds r0, r4, #0
	bl EnsureCameraOntoPosition
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8035ED8

	THUMB_FUNC_START sub_8035EFC
sub_8035EFC: @ 0x08035EFC
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r0, #0x4c
	movs r1, #0
	ldrsh r0, [r0, r1]
	bl GetTarget
	adds r5, r0, #0
	movs r0, #2
	ldrsb r0, [r5, r0]
	bl GetUnit
	adds r4, r0, #0
	movs r0, #3
	ldrsb r0, [r5, r0]
	cmp r0, #0
	bge _08035F28
	adds r0, r4, #0
	adds r1, r6, #0
	bl sub_8035DDC
	b _08035F38
_08035F28:
	adds r0, r4, #0
	bl HideUnitSMS
	movs r1, #3
	ldrsb r1, [r5, r1]
	adds r0, r4, #0
	bl sub_8035804
_08035F38:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8035EFC

	THUMB_FUNC_START sub_8035F40
sub_8035F40: @ 0x08035F40
	push {lr}
	bl MU_EndAll
	ldr r0, _08035F64  @ gBattleActor
	ldrb r0, [r0, #0x13]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _08035F5E
	ldr r0, _08035F68  @ gActionData
	ldrb r0, [r0, #0xc]
	bl GetUnit
	bl ShowUnitSMS
_08035F5E:
	pop {r0}
	bx r0
	.align 2, 0
_08035F64: .4byte gBattleActor
_08035F68: .4byte gActionData

	THUMB_FUNC_END sub_8035F40

	THUMB_FUNC_START sub_8035F6C
sub_8035F6C: @ 0x08035F6C
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r0, #0x4c
	movs r1, #0
	ldrsh r0, [r0, r1]
	bl GetTarget
	adds r4, r0, #0
	movs r0, #2
	ldrsb r0, [r4, r0]
	bl GetUnit
	adds r1, r0, #0
	movs r0, #3
	ldrsb r0, [r4, r0]
	cmp r0, #0
	bge _08035F9A
	adds r0, r5, #0
	movs r2, #0
	movs r3, #0
	bl sub_80357A8
	b _08035FA8
_08035F9A:
	movs r2, #3
	ldrsb r2, [r4, r2]
	movs r3, #1
	negs r3, r3
	adds r0, r5, #0
	bl sub_80357A8
_08035FA8:
	adds r1, r5, #0
	adds r1, #0x4c
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8035F6C

	THUMB_FUNC_START sub_8035FB8
sub_8035FB8: @ 0x08035FB8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08035FDC  @ gRAMChapterData
	ldrb r0, [r0, #0xf]
	bl sub_80259EC
	movs r0, #4
	bl sub_8026414
	bl sub_804FD28
	cmp r0, #0
	bne _08035FE0
	adds r0, r4, #0
	bl Proc_End
	b _08035FE8
	.align 2, 0
_08035FDC: .4byte gRAMChapterData
_08035FE0:
	adds r1, r4, #0
	adds r1, #0x4c
	movs r0, #0
	strh r0, [r1]
_08035FE8:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8035FB8

	THUMB_FUNC_START sub_8035FF0
sub_8035FF0: @ 0x08035FF0
	push {r4, r5, lr}
	adds r0, #0x4c
	movs r1, #0
	ldrsh r0, [r0, r1]
	bl GetTarget
	adds r5, r0, #0
	movs r0, #2
	ldrsb r0, [r5, r0]
	bl GetUnit
	adds r4, r0, #0
	bl HideUnitSMS
	movs r1, #3
	ldrsb r1, [r5, r1]
	adds r0, r4, #0
	bl sub_803584C
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8035FF0

	THUMB_FUNC_START sub_803601C
sub_803601C: @ 0x0803601C
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r5, r6, #0
	adds r5, #0x4c
	movs r1, #0
	ldrsh r0, [r5, r1]
	bl GetTarget
	adds r4, r0, #0
	movs r0, #2
	ldrsb r0, [r4, r0]
	bl GetUnit
	adds r1, r0, #0
	movs r2, #3
	ldrsb r2, [r4, r2]
	negs r2, r2
	movs r3, #1
	negs r3, r3
	adds r0, r6, #0
	bl sub_80357A8
	ldrh r0, [r5]
	adds r0, #1
	strh r0, [r5]
	ldr r0, _08036088  @ gActionData
	ldrb r0, [r0, #0xc]
	bl GetUnit
	bl GetUnitCurrentHp
	cmp r0, #0
	bne _0803606C
	bl CheckForWaitEvents
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803606C
	bl RunWaitEvents
_0803606C:
	ldr r0, _08036088  @ gActionData
	ldrb r0, [r0, #0xc]
	bl GetUnit
	bl GetUnitCurrentHp
	cmp r0, #0
	bgt _08036080
	bl SMS_UpdateFromGameData
_08036080:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08036088: .4byte gActionData

	THUMB_FUNC_END sub_803601C

	THUMB_FUNC_START sub_803608C
sub_803608C: @ 0x0803608C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #4]
	ldrb r0, [r0, #4]
	cmp r0, #0x34
	beq _080360B0
	movs r0, #0x34
	bl GetClassData
	str r0, [r4, #4]
	bl RefreshEntityBmMaps
	bl RenderBmMap
	bl SMS_UpdateFromGameData
	bl MU_EndAll
_080360B0:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_803608C

	THUMB_FUNC_START sub_80360B8
sub_80360B8: @ 0x080360B8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080360D4  @ gRAMChapterData
	ldrb r0, [r0, #0xf]
	bl sub_8025A64
	bl sub_804FD28
	cmp r0, #0
	bne _080360D8
	adds r0, r4, #0
	bl Proc_End
	b _080360E0
	.align 2, 0
_080360D4: .4byte gRAMChapterData
_080360D8:
	adds r1, r4, #0
	adds r1, #0x4c
	movs r0, #0
	strh r0, [r1]
_080360E0:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80360B8

	THUMB_FUNC_START sub_80360E8
sub_80360E8: @ 0x080360E8
	push {r4, r5, lr}
	adds r0, #0x4c
	movs r1, #0
	ldrsh r0, [r0, r1]
	bl GetTarget
	adds r5, r0, #0
	movs r0, #2
	ldrsb r0, [r5, r0]
	bl GetUnit
	adds r4, r0, #0
	bl HideUnitSMS
	adds r0, r4, #0
	bl sub_803608C
	movs r1, #3
	ldrsb r1, [r5, r1]
	adds r0, r4, #0
	bl sub_80358C0
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80360E8

	THUMB_FUNC_START sub_803611C
sub_803611C: @ 0x0803611C
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r5, r6, #0
	adds r5, #0x4c
	movs r1, #0
	ldrsh r0, [r5, r1]
	bl GetTarget
	adds r4, r0, #0
	movs r0, #2
	ldrsb r0, [r4, r0]
	bl GetUnit
	adds r1, r0, #0
	movs r2, #3
	ldrsb r2, [r4, r2]
	movs r3, #1
	negs r3, r3
	adds r0, r6, #0
	bl sub_80357A8
	ldrh r0, [r5]
	adds r0, #1
	strh r0, [r5]
	ldr r0, _08036184  @ gActionData
	ldrb r0, [r0, #0xc]
	bl GetUnit
	bl GetUnitCurrentHp
	cmp r0, #0
	bne _0803616A
	bl CheckForWaitEvents
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803616A
	bl RunWaitEvents
_0803616A:
	ldr r0, _08036184  @ gActionData
	ldrb r0, [r0, #0xc]
	bl GetUnit
	bl GetUnitCurrentHp
	cmp r0, #0
	bgt _0803617E
	bl SMS_UpdateFromGameData
_0803617E:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08036184: .4byte gActionData

	THUMB_FUNC_END sub_803611C

	THUMB_FUNC_START sub_8036188
sub_8036188: @ 0x08036188
	push {r4, lr}
	adds r4, r0, #0
	bl sub_804FD28
	cmp r0, #0
	bne _0803619C
	adds r0, r4, #0
	bl Proc_End
	b _080361A6
_0803619C:
	adds r1, r4, #0
	adds r1, #0x4c
	movs r0, #0
	strh r0, [r1]
	str r0, [r4, #0x58]
_080361A6:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8036188

	THUMB_FUNC_START sub_80361AC
sub_80361AC: @ 0x080361AC
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r0, #0x4c
	movs r1, #0
	ldrsh r0, [r0, r1]
	bl GetTarget
	adds r7, r0, #0
	ldr r5, _080361EC  @ gActionData
	ldrb r0, [r5, #0xc]
	bl GetUnit
	adds r0, #0x30
	ldrb r4, [r0]
	lsls r4, r4, #0x1c
	lsrs r4, r4, #0x1c
	str r4, [r6, #0x58]
	ldrb r0, [r5, #0xc]
	bl GetUnit
	movs r1, #0
	bl SetUnitStatus
	subs r0, r4, #1
	cmp r0, #0xc
	bhi _08036236
	lsls r0, r0, #2
	ldr r1, _080361F0  @ _080361F4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080361EC: .4byte gActionData
_080361F0: .4byte _080361F4
_080361F4: @ jump table
	.4byte _08036228 @ case 0
	.4byte _08036228 @ case 1
	.4byte _08036228 @ case 2
	.4byte _08036228 @ case 3
	.4byte _08036236 @ case 4
	.4byte _08036236 @ case 5
	.4byte _08036236 @ case 6
	.4byte _08036236 @ case 7
	.4byte _08036236 @ case 8
	.4byte _08036228 @ case 9
	.4byte _08036228 @ case 10
	.4byte _08036236 @ case 11
	.4byte _08036228 @ case 12
_08036228:
	movs r0, #2
	ldrsb r0, [r7, r0]
	bl GetUnit
	adds r1, r6, #0
	bl sub_8035DDC
_08036236:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80361AC

	THUMB_FUNC_START sub_803623C
sub_803623C: @ 0x0803623C
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x58]
	cmp r0, #0xb
	beq _0803624A
	cmp r0, #0xd
	bne _08036276
_0803624A:
	ldr r4, _08036294  @ gActionData
	ldrb r0, [r4, #0xc]
	bl GetUnit
	movs r1, #0
	bl SetUnitStatus
	ldrb r0, [r4, #0xc]
	bl GetUnit
	ldr r1, [r0, #0xc]
	ldr r2, _08036298  @ 0xFFFFFBBD
	ands r1, r2
	str r1, [r0, #0xc]
	bl RefreshEntityBmMaps
	bl RenderBmMap
	bl SMS_UpdateFromGameData
	bl MU_EndAll
_08036276:
	ldr r0, _08036294  @ gActionData
	ldrb r0, [r0, #0xc]
	bl GetUnit
	movs r1, #0
	bl SetUnitStatus
	adds r1, r5, #0
	adds r1, #0x4c
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08036294: .4byte gActionData
_08036298: .4byte 0xFFFFFBBD

	THUMB_FUNC_END sub_803623C

	THUMB_FUNC_START sub_803629C
sub_803629C: @ 0x0803629C
	adds r0, #0x4c
	movs r1, #0
	strh r1, [r0]
	bx lr

	THUMB_FUNC_END sub_803629C

	THUMB_FUNC_START sub_80362A4
sub_80362A4: @ 0x080362A4
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r4, r7, #0
	adds r4, #0x4c
	movs r1, #0
	ldrsh r0, [r4, r1]
	bl GetTarget
	adds r5, r0, #0
	movs r0, #2
	ldrsb r0, [r5, r0]
	bl GetUnit
	adds r6, r0, #0
	ldr r1, _080362DC  @ gActionData
	ldrb r0, [r5, #2]
	strb r0, [r1, #0xc]
	movs r0, #0
	ldrsh r4, [r4, r0]
	bl sub_804FD28
	cmp r4, r0
	bne _080362E0
	adds r0, r7, #0
	bl Proc_End
	b _0803632E
	.align 2, 0
_080362DC: .4byte gActionData
_080362E0:
	movs r0, #2
	ldrsb r0, [r5, r0]
	cmp r0, #0
	beq _0803632E
	ldr r0, _08036314  @ gRAMChapterData
	ldrb r0, [r0, #0xd]
	cmp r0, #0
	beq _0803631C
	movs r0, #0x11
	ldrsb r0, [r6, r0]
	ldr r1, _08036318  @ gBmMapFog
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r1, #0x10
	ldrsb r1, [r6, r1]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0
	bne _0803631C
	adds r0, r7, #0
	movs r1, #1
	bl Proc_Goto
	b _0803632E
	.align 2, 0
_08036314: .4byte gRAMChapterData
_08036318: .4byte gBmMapFog
_0803631C:
	adds r0, r6, #0
	bl GetUnitCurrentHp
	cmp r0, #0
	bne _0803632E
	adds r0, r7, #0
	movs r1, #1
	bl Proc_Goto
_0803632E:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80362A4

	THUMB_FUNC_START sub_8036334
sub_8036334: @ 0x08036334
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x4c
	movs r1, #0
	ldrsh r0, [r0, r1]
	bl GetTarget
	adds r2, r0, #0
	ldrh r1, [r2, #2]
	movs r0, #0xc0
	lsls r0, r0, #3
	cmp r1, r0
	beq _0803635E
	movs r1, #0
	ldrsb r1, [r2, r1]
	ldrb r2, [r2, #1]
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	adds r0, r4, #0
	bl EnsureCameraOntoPosition
_0803635E:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8036334

	THUMB_FUNC_START sub_8036364
sub_8036364: @ 0x08036364
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r0, #0x4c
	movs r1, #0
	ldrsh r0, [r0, r1]
	bl GetTarget
	adds r4, r0, #0
	ldrb r1, [r4, #2]
	movs r0, #2
	ldrsb r0, [r4, r0]
	cmp r0, #0
	bne _08036432
	movs r0, #3
	ldrsb r0, [r4, r0]
	cmp r0, #0x64
	beq _080363BC
	cmp r0, #0x64
	bgt _0803639E
	cmp r0, #6
	beq _08036410
	cmp r0, #6
	bgt _08036398
	cmp r0, #4
	beq _080363AC
	b _0803641E
_08036398:
	cmp r0, #7
	beq _08036404
	b _0803641E
_0803639E:
	cmp r0, #0x66
	beq _080363E0
	cmp r0, #0x66
	blt _080363CE
	cmp r0, #0x67
	beq _080363F2
	b _0803641E
_080363AC:
	movs r1, #0
	ldrsb r1, [r4, r1]
	movs r2, #1
	ldrsb r2, [r4, r2]
	adds r0, r5, #0
	bl sub_801F68C
	b _0803641E
_080363BC:
	movs r1, #0
	ldrsb r1, [r4, r1]
	movs r2, #1
	ldrsb r2, [r4, r2]
	adds r0, r5, #0
	movs r3, #3
	bl sub_801F600
	b _0803641E
_080363CE:
	movs r1, #0
	ldrsb r1, [r4, r1]
	movs r2, #1
	ldrsb r2, [r4, r2]
	adds r0, r5, #0
	movs r3, #2
	bl sub_801F600
	b _0803641E
_080363E0:
	movs r1, #0
	ldrsb r1, [r4, r1]
	movs r2, #1
	ldrsb r2, [r4, r2]
	adds r0, r5, #0
	movs r3, #0
	bl sub_801F600
	b _0803641E
_080363F2:
	movs r1, #0
	ldrsb r1, [r4, r1]
	movs r2, #1
	ldrsb r2, [r4, r2]
	adds r0, r5, #0
	movs r3, #1
	bl sub_801F600
	b _0803641E
_08036404:
	movs r1, #0
	ldrsb r1, [r4, r1]
	adds r0, r5, #0
	bl sub_801F844
	b _0803641E
_08036410:
	movs r1, #0
	ldrsb r1, [r4, r1]
	movs r2, #1
	ldrsb r2, [r4, r2]
	adds r0, r5, #0
	bl sub_801F8C8
_0803641E:
	adds r1, r5, #0
	adds r1, #0x4c
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	adds r0, r5, #0
	movs r1, #0
	bl Proc_Goto
	b _0803646E
_08036432:
	ldr r5, _0803645C  @ gActionData
	strb r1, [r5, #0xc]
	ldrb r0, [r4, #3]
	strb r0, [r5, #0x15]
	ldrb r0, [r5, #0xc]
	bl GetUnit
	bl HideUnitSMS
	ldrb r0, [r5, #0x15]
	cmp r0, #5
	bhi _08036460
	ldrb r0, [r5, #0xc]
	bl GetUnit
	movs r1, #3
	ldrsb r1, [r4, r1]
	bl sub_803584C
	b _0803646E
	.align 2, 0
_0803645C: .4byte gActionData
_08036460:
	ldrb r0, [r5, #0xc]
	bl GetUnit
	movs r1, #3
	ldrsb r1, [r4, r1]
	bl sub_803592C
_0803646E:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8036364

	THUMB_FUNC_START sub_8036474
sub_8036474: @ 0x08036474
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r0, #0x4c
	movs r1, #0
	ldrsh r0, [r0, r1]
	bl GetTarget
	adds r4, r0, #0
	movs r0, #2
	ldrsb r0, [r4, r0]
	bl GetUnit
	adds r5, r0, #0
	movs r0, #3
	ldrsb r0, [r4, r0]
	cmp r0, #5
	bgt _080364A6
	adds r2, r0, #0
	negs r2, r2
	adds r0, r6, #0
	adds r1, r5, #0
	movs r3, #1
	bl sub_80357A8
	b _080364B8
_080364A6:
	movs r2, #3
	ldrsb r2, [r4, r2]
	negs r2, r2
	movs r3, #1
	negs r3, r3
	adds r0, r6, #0
	adds r1, r5, #0
	bl sub_80357A8
_080364B8:
	adds r0, r5, #0
	bl GetUnitCurrentHp
	cmp r0, #0
	bgt _080364C6
	bl SMS_UpdateFromGameData
_080364C6:
	adds r1, r6, #0
	adds r1, #0x4c
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8036474

.align 2, 0
