	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	THUMB_FUNC_START PrepScreenMenu_OnPickUnits
PrepScreenMenu_OnPickUnits: @ 0x080951B8
	push {lr}
	adds r2, r0, #0
	adds r2, #0x33
	movs r1, #1
	strb r1, [r2]
	movs r1, #0xa
	bl Proc_Goto
	pop {r0}
	bx r0

	THUMB_FUNC_END PrepScreenMenu_OnPickUnits

	THUMB_FUNC_START PrepScreenMenu_OnItems
PrepScreenMenu_OnItems: @ 0x080951CC
	push {lr}
	adds r2, r0, #0
	adds r2, #0x33
	movs r1, #2
	strb r1, [r2]
	movs r1, #0xa
	bl Proc_Goto
	pop {r0}
	bx r0

	THUMB_FUNC_END PrepScreenMenu_OnItems

	THUMB_FUNC_START PrepScreenMenu_OnSupport
PrepScreenMenu_OnSupport: @ 0x080951E0
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r2, r4, #0
	adds r2, #0x33
	movs r1, #0
	movs r0, #4
	strb r0, [r2]
	movs r2, #0x80
	lsls r2, r2, #1
	str r1, [sp]
	movs r0, #0x37
	adds r1, r2, #0
	movs r3, #0x20
	bl sub_80029E8
	adds r0, r4, #0
	movs r1, #0xa
	bl Proc_Goto
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END PrepScreenMenu_OnSupport

	THUMB_FUNC_START PrepScreenMenu_OnSave
PrepScreenMenu_OnSave: @ 0x08095210
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0809523C  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08095226
	movs r0, #0x6a
	bl m4aSongNumStart
_08095226:
	adds r1, r4, #0
	adds r1, #0x33
	movs r0, #3
	strb r0, [r1]
	adds r0, r4, #0
	movs r1, #8
	bl Proc_Goto
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809523C: .4byte gRAMChapterData

	THUMB_FUNC_END PrepScreenMenu_OnSave

	THUMB_FUNC_START PrepScreenMenu_OnStartPress
PrepScreenMenu_OnStartPress: @ 0x08095240
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2b
	ldrb r0, [r0]
	cmp r0, #0
	beq _0809525C
	bl sub_8096BC4
	adds r0, r4, #0
	movs r1, #0xb
	bl Proc_Goto
	movs r0, #1
	b _0809525E
_0809525C:
	movs r0, #0
_0809525E:
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END PrepScreenMenu_OnStartPress

	THUMB_FUNC_START sub_8095264
sub_8095264: @ 0x08095264
	push {lr}
	ldr r0, _08095278  @ gUnknown_08A1829C
	bl Proc_Find
	adds r0, #0x2b
	ldrb r0, [r0]
	cmp r0, #0
	beq _0809527C
	movs r0, #1
	b _0809527E
	.align 2, 0
_08095278: .4byte gUnknown_08A1829C
_0809527C:
	movs r0, #0
_0809527E:
	pop {r1}
	bx r1

	THUMB_FUNC_END sub_8095264

	THUMB_FUNC_START sub_8095284
sub_8095284: @ 0x08095284
	push {lr}
	movs r1, #5
	bl Proc_Goto
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8095284

	THUMB_FUNC_START PrepScreenMenu_OnBPress
PrepScreenMenu_OnBPress: @ 0x08095290
	push {r4, lr}
	adds r4, r0, #0
	bl CheckSomethingSomewhere
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080952AC
	bl sub_8095504
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080952B8
	bl sub_8096BE0
_080952AC:
	adds r0, r4, #0
	movs r1, #5
	bl Proc_Goto
	movs r0, #1
	b _080952BA
_080952B8:
	movs r0, #0
_080952BA:
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_END PrepScreenMenu_OnBPress

	THUMB_FUNC_START PrepScreenMenu_OnCheckMap
PrepScreenMenu_OnCheckMap: @ 0x080952C0
	push {lr}
	movs r1, #5
	bl Proc_Goto
	pop {r0}
	bx r0

	THUMB_FUNC_END PrepScreenMenu_OnCheckMap

.align 2, 0
