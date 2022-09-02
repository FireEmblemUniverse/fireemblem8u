	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	THUMB_FUNC_START MinimalVBlankHandler
MinimalVBlankHandler: @ 0x0808DAE4
	push {lr}
	ldr r1, _0808DB04  @ gUnknown_03007FF8
	movs r0, #1
	strh r0, [r1]
	bl FlushLCDControl
	bl FlushBackgrounds
	bl FlushTiles
	bl m4aSoundVSync
	bl m4aSoundMain
	pop {r0}
	bx r0
	.align 2, 0
_0808DB04: .4byte gUnknown_03007FF8

	THUMB_FUNC_END MinimalVBlankHandler

	THUMB_FUNC_START sub_808DB08
sub_808DB08: @ 0x0808DB08
	push {r4, lr}
	ldr r4, _0808DB30  @ gKeyStatusPtr
	ldr r0, [r4]
	bl UpdateKeyStatus
	ldr r0, [r4]
	ldrh r1, [r0, #8]
	movs r0, #9
	ands r0, r1
	cmp r0, #0
	beq _0808DB24
	movs r0, #0xff
	bl SoftReset
_0808DB24:
	bl VBlankIntrWait
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808DB30: .4byte gKeyStatusPtr

	THUMB_FUNC_END sub_808DB08

	THUMB_FUNC_START sub_808DB34
sub_808DB34: @ 0x0808DB34
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x7c
	add r5, sp, #0x18
	bl Font_InitForUIDefault
	bl Font_LoadForDialogue
	add r7, sp, #8
	add r0, sp, #0x10
	mov r8, r0
	mov r4, sp
	movs r6, #2
_0808DB50:
	adds r0, r4, #0
	movs r1, #0x16
	bl Text_Init
	adds r0, r4, #0
	movs r1, #0
	bl Text_SetColorId
	adds r4, #8
	subs r6, #1
	cmp r6, #0
	bge _0808DB50
	movs r1, #0
	str r1, [r5, #0x30]
	mov r0, sp
	str r0, [r5, #0x34]
	str r7, [r5, #0x38]
	mov r0, r8
	str r0, [r5, #0x3c]
	adds r0, r5, #0
	adds r0, #0x5c
	strh r1, [r0]
	ldr r0, _0808DBC0  @ 0x0000088E
	bl GetStringFromIndex
	str r0, [r5, #0x2c]
	adds r0, r5, #0
	bl sub_8089EEC
	ldr r4, _0808DBC4  @ gUnknown_02022E30
	mov r0, sp
	adds r1, r4, #0
	bl Text_Draw
	adds r1, r4, #0
	adds r1, #0xc0
	adds r0, r7, #0
	bl Text_Draw
	movs r0, #0xa0
	lsls r0, r0, #1
	adds r4, r4, r0
	mov r0, r8
	adds r1, r4, #0
	bl Text_Draw
	movs r0, #1
	bl BG_EnableSyncByMask
	add sp, #0x7c
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808DBC0: .4byte 0x0000088E
_0808DBC4: .4byte gUnknown_02022E30

	THUMB_FUNC_END sub_808DB34

	THUMB_FUNC_START sub_808DBC8
sub_808DBC8: @ 0x0808DBC8
	push {r4, r5, lr}
	sub sp, #8
	movs r0, #0
	bl SetupBackgrounds
	bl m4aSoundInit
	bl Proc_Init
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	ldr r4, _0808DC60  @ gLCDControlBuffer
	ldrb r0, [r4, #1]
	movs r1, #1
	orrs r0, r1
	movs r1, #3
	negs r1, r1
	ands r0, r1
	subs r1, #2
	ands r0, r1
	subs r1, #4
	ands r0, r1
	subs r1, #8
	ands r0, r1
	subs r1, #0x10
	ands r0, r1
	subs r1, #0x20
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r4, #1]
	bl SetDefaultColorEffects
	movs r0, #0
	bl SetPrimaryHBlankHandler
	movs r0, #0
	strh r0, [r4, #0x38]
	bl FlushLCDControl
	movs r4, #0
	str r4, [sp]
	movs r1, #0xc0
	lsls r1, r1, #0x13
	ldr r5, _0808DC64  @ 0x01000008
	mov r0, sp
	adds r2, r5, #0
	bl CpuFastSet
	str r4, [sp, #4]
	add r0, sp, #4
	ldr r1, _0808DC68  @ 0x06008000
	adds r2, r5, #0
	bl CpuFastSet
	bl sub_808DB34
	ldr r0, _0808DC6C  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0808DC52
	movs r0, #0x7b
	bl m4aSongNumStart
_0808DC52:
	ldr r0, _0808DC70  @ sub_808DB08
	bl SetMainUpdateRoutine
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0808DC60: .4byte gLCDControlBuffer
_0808DC64: .4byte 0x01000008
_0808DC68: .4byte 0x06008000
_0808DC6C: .4byte gRAMChapterData
_0808DC70: .4byte sub_808DB08

	THUMB_FUNC_END sub_808DBC8

	THUMB_FUNC_START sub_808DC74
sub_808DC74: @ 0x0808DC74
	push {lr}
	ldr r1, _0808DC9C  @ 0x04000004
	movs r0, #8
	strh r0, [r1]
	ldr r1, _0808DCA0  @ 0x04000208
	movs r0, #1
	strh r0, [r1]
	movs r1, #0x80
	lsls r1, r1, #0x13
	movs r0, #0
	strh r0, [r1]
	ldr r0, _0808DCA4  @ MinimalVBlankHandler
	bl SetInterrupt_LCDVBlank
	ldr r0, _0808DCA8  @ sub_808DBC8
	bl SetMainUpdateRoutine
	pop {r0}
	bx r0
	.align 2, 0
_0808DC9C: .4byte 0x04000004
_0808DCA0: .4byte 0x04000208
_0808DCA4: .4byte MinimalVBlankHandler
_0808DCA8: .4byte sub_808DBC8

	THUMB_FUNC_END sub_808DC74

	THUMB_FUNC_START sub_808DCAC
sub_808DCAC: @ 0x0808DCAC
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0808DCC8  @ 0x06015000
	movs r1, #6
	bl LoadDialogueBoxGfx
	ldr r0, _0808DCCC  @ gUnknown_08A01D18
	adds r1, r4, #0
	bl StartMovingHelpBox
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808DCC8: .4byte 0x06015000
_0808DCCC: .4byte gUnknown_08A01D18

	THUMB_FUNC_END sub_808DCAC

	THUMB_FUNC_START sub_808DCD0
sub_808DCD0: @ 0x0808DCD0
	push {r4, lr}
	movs r4, #1
_0808DCD4:
	adds r0, r4, #0
	bl GetUnit
	adds r1, r0, #0
	cmp r1, #0
	beq _0808DCEA
	ldr r0, [r1]
	cmp r0, #0
	beq _0808DCEA
	adds r0, r1, #0
	b _0808DCF2
_0808DCEA:
	adds r4, #1
	cmp r4, #0x3f
	ble _0808DCD4
	movs r0, #0
_0808DCF2:
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_808DCD0

.align 2, 0
