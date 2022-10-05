	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	THUMB_FUNC_START ProcUnkMapAnim_Init
ProcUnkMapAnim_Init: @ 0x080216D0
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	ldr r0, _08021768  @ Img_LightRune
	ldr r1, _0802176C  @ 0x06002000
	bl CopyDataWithPossibleUncomp
	ldr r0, _08021770  @ Pal_LightRune
	movs r1, #0x40
	movs r2, #0x20
	bl CopyToPaletteBuffer
	ldr r0, _08021774  @ Tsa_LightRune
	ldr r4, _08021778  @ gBmFrameTmap0
	adds r1, r4, #0
	bl CopyDataWithPossibleUncomp
	movs r0, #0x84
	lsls r0, r0, #6
	adds r1, r0, #0
	movs r5, #0xd8
	lsls r5, r5, #2
_080216FC:
	ldrh r2, [r4]
	adds r0, r1, r2
	strh r0, [r4]
	adds r4, #2
	subs r5, #1
	cmp r5, #0
	bne _080216FC
	ldr r0, _0802177C  @ gBG0TilemapBuffer
	movs r1, #0x80
	lsls r1, r1, #1
	bl BG_Fill
	movs r0, #1
	bl BG_EnableSyncByMask
	ldr r0, _08021780  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0802172E
	movs r0, #0xb6
	lsls r0, r0, #2
	bl m4aSongNumStart
_0802172E:
	movs r0, #1
	movs r1, #0x10
	movs r2, #0x10
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	str r5, [sp]
	movs r0, #1
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl SetBlendTargetA
	movs r0, #1
	str r0, [sp]
	movs r0, #0
	movs r1, #1
	movs r2, #1
	movs r3, #1
	bl SetBlendTargetB
	adds r0, r6, #0
	adds r0, #0x4c
	strh r5, [r0]
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08021768: .4byte Img_LightRune
_0802176C: .4byte 0x06002000
_08021770: .4byte Pal_LightRune
_08021774: .4byte Tsa_LightRune
_08021778: .4byte gBmFrameTmap0
_0802177C: .4byte gBG0TilemapBuffer
_08021780: .4byte gRAMChapterData

	THUMB_FUNC_END ProcUnkMapAnim_Init

	THUMB_FUNC_START ProcUnkMapAnim_Loop
ProcUnkMapAnim_Loop: @ 0x08021784
	push {r4, r5, r6, lr}
	sub sp, #0x34
	adds r6, r0, #0
	ldr r1, _080217C0  @ gUnknown_080D7B64
	mov r0, sp
	movs r2, #0x34
	bl memcpy
	adds r1, r6, #0
	adds r1, #0x4c
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	movs r2, #0
	ldrsh r0, [r1, r2]
	movs r1, #3
	bl __divsi3
	lsls r0, r0, #0x10
	asrs r0, r0, #0xe
	add r0, sp
	ldrb r4, [r0]
	ldrb r5, [r0, #1]
	cmp r4, #0xff
	bne _080217C4
	adds r0, r6, #0
	bl Proc_Break
	b _080217EA
	.align 2, 0
_080217C0: .4byte gUnknown_080D7B64
_080217C4:
	cmp r4, #0x18
	bne _080217D0
	cmp r5, #9
	bne _080217D0
	bl SMS_UpdateFromGameData
_080217D0:
	lsls r0, r5, #5
	adds r0, r0, r4
	lsls r0, r0, #1
	ldr r1, _080217F4  @ gBmFrameTmap0
	adds r0, r0, r1
	ldr r1, _080217F8  @ gBG0TilemapBuffer
	movs r2, #8
	movs r3, #9
	bl TileMap_CopyRect
	movs r0, #1
	bl BG_EnableSyncByMask
_080217EA:
	add sp, #0x34
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080217F4: .4byte gBmFrameTmap0
_080217F8: .4byte gBG0TilemapBuffer

	THUMB_FUNC_END ProcUnkMapAnim_Loop

	THUMB_FUNC_START ProcUnkMapAnim_End
ProcUnkMapAnim_End: @ 0x080217FC
	push {lr}
	bl SetDefaultColorEffects
	ldr r0, _08021814  @ gBG0TilemapBuffer
	movs r1, #0
	bl BG_Fill
	movs r0, #1
	bl BG_EnableSyncByMask
	pop {r0}
	bx r0
	.align 2, 0
_08021814: .4byte gBG0TilemapBuffer

	THUMB_FUNC_END ProcUnkMapAnim_End

	THUMB_FUNC_START sub_8021818
sub_8021818: @ 0x08021818
	push {r4, r5, lr}
	adds r3, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	ldr r0, _0802185C  @ ProcScr_UnkMapAnim
	adds r1, r3, #0
	bl Proc_StartBlocking
	lsls r0, r4, #4
	ldr r2, _08021860  @ gGameState
	movs r3, #0xc
	ldrsh r1, [r2, r3]
	subs r0, r0, r1
	adds r4, r0, #0
	subs r4, #0x18
	lsls r0, r5, #4
	movs r3, #0xe
	ldrsh r1, [r2, r3]
	subs r0, r0, r1
	adds r5, r0, #0
	subs r5, #0x28
	negs r1, r4
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	negs r2, r5
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #0
	bl BG_SetPosition
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802185C: .4byte ProcScr_UnkMapAnim
_08021860: .4byte gGameState

	THUMB_FUNC_END sub_8021818

	THUMB_FUNC_START sub_8021864
sub_8021864: @ 0x08021864
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	ldr r0, _080218FC  @ Img_LightRune
	ldr r1, _08021900  @ 0x06002000
	bl CopyDataWithPossibleUncomp
	ldr r0, _08021904  @ Pal_LightRune
	movs r1, #0x40
	movs r2, #0x20
	bl CopyToPaletteBuffer
	ldr r0, _08021908  @ Tsa_LightRune
	ldr r4, _0802190C  @ gBmFrameTmap0
	adds r1, r4, #0
	bl CopyDataWithPossibleUncomp
	movs r0, #0x84
	lsls r0, r0, #6
	adds r1, r0, #0
	movs r5, #0xd8
	lsls r5, r5, #2
_08021890:
	ldrh r2, [r4]
	adds r0, r1, r2
	strh r0, [r4]
	adds r4, #2
	subs r5, #1
	cmp r5, #0
	bne _08021890
	ldr r0, _08021910  @ gBG0TilemapBuffer
	movs r1, #0x80
	lsls r1, r1, #1
	bl BG_Fill
	movs r0, #1
	bl BG_EnableSyncByMask
	ldr r0, _08021914  @ gRAMChapterData
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080218C2
	movs r0, #0xb6
	lsls r0, r0, #2
	bl m4aSongNumStart
_080218C2:
	movs r0, #1
	movs r1, #0x10
	movs r2, #0x10
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	str r5, [sp]
	movs r0, #1
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl SetBlendTargetA
	movs r0, #1
	str r0, [sp]
	movs r0, #0
	movs r1, #1
	movs r2, #1
	movs r3, #1
	bl SetBlendTargetB
	adds r0, r6, #0
	adds r0, #0x4c
	strh r5, [r0]
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080218FC: .4byte Img_LightRune
_08021900: .4byte 0x06002000
_08021904: .4byte Pal_LightRune
_08021908: .4byte Tsa_LightRune
_0802190C: .4byte gBmFrameTmap0
_08021910: .4byte gBG0TilemapBuffer
_08021914: .4byte gRAMChapterData

	THUMB_FUNC_END sub_8021864

	THUMB_FUNC_START sub_8021918
sub_8021918: @ 0x08021918
	push {r4, r5, r6, lr}
	sub sp, #0x34
	adds r6, r0, #0
	ldr r1, _08021954  @ gUnknown_080D7B98
	mov r0, sp
	movs r2, #0x34
	bl memcpy
	adds r1, r6, #0
	adds r1, #0x4c
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	movs r2, #0
	ldrsh r0, [r1, r2]
	movs r1, #3
	bl __divsi3
	lsls r0, r0, #0x10
	asrs r0, r0, #0xe
	add r0, sp
	ldrb r4, [r0]
	ldrb r5, [r0, #1]
	cmp r4, #0xff
	bne _08021958
	adds r0, r6, #0
	bl Proc_Break
	b _0802197E
	.align 2, 0
_08021954: .4byte gUnknown_080D7B98
_08021958:
	cmp r4, #0x18
	bne _08021964
	cmp r5, #9
	bne _08021964
	bl SMS_UpdateFromGameData
_08021964:
	lsls r0, r5, #5
	adds r0, r0, r4
	lsls r0, r0, #1
	ldr r1, _08021988  @ gBmFrameTmap0
	adds r0, r0, r1
	ldr r1, _0802198C  @ gBG0TilemapBuffer
	movs r2, #8
	movs r3, #9
	bl TileMap_CopyRect
	movs r0, #1
	bl BG_EnableSyncByMask
_0802197E:
	add sp, #0x34
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08021988: .4byte gBmFrameTmap0
_0802198C: .4byte gBG0TilemapBuffer

	THUMB_FUNC_END sub_8021918

	THUMB_FUNC_START sub_8021990
sub_8021990: @ 0x08021990
	push {lr}
	bl SetDefaultColorEffects
	ldr r0, _080219A8  @ gBG0TilemapBuffer
	movs r1, #0
	bl BG_Fill
	movs r0, #1
	bl BG_EnableSyncByMask
	pop {r0}
	bx r0
	.align 2, 0
_080219A8: .4byte gBG0TilemapBuffer

	THUMB_FUNC_END sub_8021990

	THUMB_FUNC_START sub_80219AC
sub_80219AC: @ 0x080219AC
	push {r4, r5, lr}
	adds r3, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	ldr r0, _080219F0  @ gUnknown_0859B3F0
	adds r1, r3, #0
	bl Proc_StartBlocking
	lsls r0, r4, #4
	ldr r2, _080219F4  @ gGameState
	movs r3, #0xc
	ldrsh r1, [r2, r3]
	subs r0, r0, r1
	adds r4, r0, #0
	subs r4, #0x18
	lsls r0, r5, #4
	movs r3, #0xe
	ldrsh r1, [r2, r3]
	subs r0, r0, r1
	adds r5, r0, #0
	subs r5, #0x28
	negs r1, r4
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	negs r2, r5
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #0
	bl BG_SetPosition
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080219F0: .4byte gUnknown_0859B3F0
_080219F4: .4byte gGameState

	THUMB_FUNC_END sub_80219AC

.align 2, 0 @ align with 0
