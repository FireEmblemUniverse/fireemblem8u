	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	@ Tile Fading (for tile changes and such)

	THUMB_FUNC_START sub_801DD1C
sub_801DD1C: @ 0x0801DD1C
	push {r4, lr}
	sub sp, #4
	adds r0, #0x4c
	movs r4, #0
	movs r1, #0x10
	strh r1, [r0]
	bl SetupBackgroundForWeatherMaybe
	str r4, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #1
	movs r3, #0
	bl sub_8001ED0
	movs r0, #1
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #1
	bl sub_8001F0C
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_801DD1C

	THUMB_FUNC_START sub_801DD54
sub_801DD54: @ 0x0801DD54
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r5, #0
	adds r4, #0x4c
	ldrb r0, [r4]
	adds r1, r0, #0
	movs r2, #0x10
	subs r2, r2, r0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	movs r0, #1
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	ldrh r0, [r4]
	subs r0, #1
	strh r0, [r4]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _0801DD9C
	adds r0, r5, #0
	bl Proc_Break
	bl SetDefaultColorEffects
	movs r0, #2
	movs r1, #0
	bl SetBackgroundTileDataOffset
	ldr r0, _0801DDA4  @ gBG2TilemapBuffer
	movs r1, #0
	bl BG_Fill
	movs r0, #4
	bl BG_EnableSyncByMask
_0801DD9C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0801DDA4: .4byte gBG2TilemapBuffer

	THUMB_FUNC_END sub_801DD54

	THUMB_FUNC_START Destruct6CBMXFADE
Destruct6CBMXFADE: @ 0x0801DDA8
	push {r4, lr}
	adds r4, r0, #0
	bl SetAllUnitNotBackSprite
	adds r4, #0x4e
	movs r1, #0
	ldrsh r0, [r4, r1]
	cmp r0, #0
	beq _0801DDBE
	bl SubSkipThread2
_0801DDBE:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END Destruct6CBMXFADE

	THUMB_FUNC_START NewBMXFADE
NewBMXFADE: @ 0x0801DDC4
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _0801DDEC  @ gUnknown_0859ADC8
	movs r1, #3
	bl Proc_Start
	lsls r4, r4, #0x18
	asrs r4, r4, #0x18
	adds r0, #0x4e
	strh r4, [r0]
	cmp r4, #0
	beq _0801DDE4
	bl AddSkipThread2
_0801DDE4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0801DDEC: .4byte gUnknown_0859ADC8

	THUMB_FUNC_END NewBMXFADE

	THUMB_FUNC_START MakeNew6CBMXFADE2
MakeNew6CBMXFADE2: @ 0x0801DDF0
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _0801DE14  @ gUnknown_0859ADC8
	bl Proc_StartBlocking
	lsls r4, r4, #0x18
	asrs r4, r4, #0x18
	adds r0, #0x4e
	strh r4, [r0]
	cmp r4, #0
	beq _0801DE0E
	bl AddSkipThread2
_0801DE0E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0801DE14: .4byte gUnknown_0859ADC8

	THUMB_FUNC_END MakeNew6CBMXFADE2

	THUMB_FUNC_START DoesBMXFADEExist
DoesBMXFADEExist: @ 0x0801DE18
	push {lr}
	ldr r0, _0801DE2C  @ gUnknown_0859ADC8
	bl Proc_Find
	cmp r0, #0
	beq _0801DE26
	movs r0, #1
_0801DE26:
	pop {r1}
	bx r1
	.align 2, 0
_0801DE2C: .4byte gUnknown_0859ADC8

	THUMB_FUNC_END DoesBMXFADEExist

.align 2, 0 @ align with 0
