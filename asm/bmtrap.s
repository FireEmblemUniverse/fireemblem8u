	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	@ Trap effects and loading

	THUMB_FUNC_START LoadTrapData
LoadTrapData: @ 0x08037840
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	cmp r5, #0
	beq _08037908
	b _08037902
_0803784C:
	ldrb r0, [r5]
	subs r1, r0, #1
	adds r2, r0, #0
	cmp r1, #0xb
	bhi _08037900
	lsls r0, r1, #2
	ldr r1, _08037860  @ _08037864
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08037860: .4byte _08037864
_08037864: @ jump table
	.4byte _08037894 @ case 0
	.4byte _08037900 @ case 1
	.4byte _08037900 @ case 2
	.4byte _080378A0 @ case 3
	.4byte _080378AE @ case 4
	.4byte _08037900 @ case 5
	.4byte _080378E2 @ case 6
	.4byte _080378C0 @ case 7
	.4byte _080378CA @ case 8
	.4byte _08037900 @ case 9
	.4byte _080378D6 @ case 10
	.4byte _080378EC @ case 11
_08037894:
	ldrb r0, [r5, #1]
	ldrb r1, [r5, #2]
	ldrb r2, [r5, #3]
	bl AddBallista
	b _08037900
_080378A0:
	ldrb r0, [r5, #1]
	ldrb r1, [r5, #2]
	ldrb r2, [r5, #4]
	ldrb r3, [r5, #5]
	bl AddFireTile
	b _08037900
_080378AE:
	ldrb r0, [r5, #1]
	ldrb r1, [r5, #2]
	ldrb r2, [r5, #3]
	ldrb r3, [r5, #4]
	ldrb r4, [r5, #5]
	str r4, [sp]
	bl AddGasTrap
	b _08037900
_080378C0:
	ldrb r0, [r5, #1]
	ldrb r1, [r5, #2]
	bl AddTrap8
	b _08037900
_080378CA:
	ldrb r0, [r5, #1]
	ldrb r1, [r5, #2]
	ldrb r2, [r5, #3]
	bl AddTrap9
	b _08037900
_080378D6:
	ldrb r0, [r5, #1]
	ldrb r1, [r5, #2]
	movs r3, #0
	bl AddTrap
	b _08037900
_080378E2:
	ldrb r0, [r5, #1]
	ldrb r1, [r5, #4]
	ldrb r2, [r5, #5]
	bl AddArrowTrap
_080378EC:
	movs r0, #1
	ldrsb r0, [r5, r0]
	movs r1, #2
	ldrsb r1, [r5, r1]
	ldrb r2, [r5, #3]
	ldrb r3, [r5, #4]
	ldrb r4, [r5, #5]
	str r4, [sp]
	bl AddGorgonEggTrap
_08037900:
	adds r5, #6
_08037902:
	ldrb r0, [r5]
	cmp r0, #0
	bne _0803784C
_08037908:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END LoadTrapData

	THUMB_FUNC_START LoadChapterBallistae
LoadChapterBallistae: @ 0x08037910
	push {lr}
	bl GetCurrentChapterBallistaePtr
	bl LoadTrapData
	bl GetCurrentChapterBallistae2Ptr
	bl LoadTrapData
	pop {r0}
	bx r0

	THUMB_FUNC_END LoadChapterBallistae

	THUMB_FUNC_START AddGorgonEggTrap
AddGorgonEggTrap: @ 0x08037928
	push {r4, r5, lr}
	sub sp, #0xc
	adds r5, r2, #0
	ldr r4, [sp, #0x18]
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	str r3, [sp]
	movs r2, #1
	str r2, [sp, #4]
	str r4, [sp, #8]
	movs r2, #0xc
	adds r3, r5, #0
	bl AddDamagingTrap
	add sp, #0xc
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_END AddGorgonEggTrap

.align 2, 0
