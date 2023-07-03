	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	THUMB_FUNC_START sub_8077FC8
sub_8077FC8: @ 0x08077FC8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r2, #0
	movs r2, #0xf8
	lsls r2, r2, #2
	mov r8, r2
	movs r2, #0xf8
	lsls r2, r2, #7
	mov ip, r2
	adds r4, r1, #0
	adds r5, r0, #0
	movs r7, #0xf
_08077FE2:
	ldrh r3, [r5]
	adds r0, r3, #0
	cmp r0, #0
	beq _0807802C
	movs r2, #0x1f
	ands r2, r3
	mov r0, r8
	ands r0, r3
	lsrs r1, r0, #5
	mov r0, ip
	ands r0, r3
	lsrs r0, r0, #0xa
	adds r2, r2, r6
	adds r1, r1, r6
	adds r0, r0, r6
	cmp r2, #0
	bge _08078006
	movs r2, #0
_08078006:
	cmp r1, #0
	bge _0807800C
	movs r1, #0
_0807800C:
	cmp r0, #0
	bge _08078012
	movs r0, #0
_08078012:
	cmp r2, #0x1f
	ble _08078018
	movs r2, #0x1f
_08078018:
	cmp r1, #0x1f
	ble _0807801E
	movs r1, #0x1f
_0807801E:
	cmp r0, #0x1f
	ble _08078024
	movs r0, #0x1f
_08078024:
	lsls r0, r0, #0xa
	lsls r1, r1, #5
	adds r0, r0, r1
	adds r0, r0, r2
_0807802C:
	strh r0, [r4]
	adds r4, #2
	adds r5, #2
	subs r7, #1
	cmp r7, #0
	bge _08077FE2
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8077FC8

	THUMB_FUNC_START NewEkrSelfThunder
NewEkrSelfThunder: @ 0x08078044
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08078070  @ 0x0000037E
	movs r1, #0x80
	lsls r1, r1, #1
	movs r2, #0x78
	movs r3, #0
	bl EkrSoundSomeBark
	bl SpellFx_SpellFx_ClearBG1Position
	ldr r0, _08078074  @ ProcScr_ekrSelfThunder
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08078070: .4byte 0x0000037E
_08078074: .4byte ProcScr_ekrSelfThunder

	THUMB_FUNC_END NewEkrSelfThunder

	THUMB_FUNC_START sub_8078078
sub_8078078: @ 0x08078078
	push {lr}
	adds r1, r0, #0
	ldrh r0, [r1, #0x2c]
	adds r0, #1
	strh r0, [r1, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _08078092
	ldr r0, [r1, #0x5c]
	bl NewEkrSelfThunderBG
	b _080780A0
_08078092:
	cmp r0, #0x15
	beq _080780A0
	cmp r0, #0x46
	bne _080780A0
	adds r0, r1, #0
	bl Proc_Break
_080780A0:
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8078078

	THUMB_FUNC_START sub_80780A4
sub_80780A4: @ 0x080780A4
	push {r4, r5, lr}
	sub sp, #8
	adds r4, r0, #0
	adds r3, r1, #0
	ldr r0, _080780C0  @ gEkrDistanceType
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _080780C8
	ldr r1, _080780C4  @ gEkrTsaBuffer
	adds r0, r3, #0
	bl LZ77UnCompWram
	b _080780D0
	.align 2, 0
_080780C0: .4byte gEkrDistanceType
_080780C4: .4byte gEkrTsaBuffer
_080780C8:
	ldr r1, _080780F4  @ gEkrTsaBuffer
	adds r0, r2, #0
	bl LZ77UnCompWram
_080780D0:
	ldr r5, _080780F4  @ gEkrTsaBuffer
	adds r0, r4, #0
	bl GetAnimPosition
	cmp r0, #0
	bne _080780FC
	ldr r1, _080780F8  @ gBG1TilemapBuffer
	movs r0, #1
	str r0, [sp]
	adds r0, #0xff
	str r0, [sp, #4]
	adds r0, r5, #0
	movs r2, #0x20
	movs r3, #0x14
	bl sub_8070E94
	b _08078110
	.align 2, 0
_080780F4: .4byte gEkrTsaBuffer
_080780F8: .4byte gBG1TilemapBuffer
_080780FC:
	ldr r1, _08078120  @ gBG1TilemapBuffer
	movs r0, #1
	str r0, [sp]
	adds r0, #0xff
	str r0, [sp, #4]
	adds r0, r5, #0
	movs r2, #0x20
	movs r3, #0x14
	bl sub_8070EC4
_08078110:
	movs r0, #2
	bl BG_EnableSyncByMask
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08078120: .4byte gBG1TilemapBuffer

	THUMB_FUNC_END sub_80780A4

	THUMB_FUNC_START NewEkrSelfThunderBG
NewEkrSelfThunderBG: @ 0x08078124
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0807813C  @ ProcScr_ekrSelfThunderBG
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	bl SpellFx_SetSomeColorEffect
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807813C: .4byte ProcScr_ekrSelfThunderBG

	THUMB_FUNC_END NewEkrSelfThunderBG

	THUMB_FUNC_START sub_8078140
sub_8078140: @ 0x08078140
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r5, r0, #0
	adds r0, r1, #0
	adds r6, r2, #0
	mov r8, r3
	ldr r4, [sp, #0x14]
	movs r1, #0xc0
	lsls r1, r1, #4
	bl SpellFx_RegisterBgGfx
	adds r0, r4, #0
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	ldr r0, [r5, #0x5c]
	adds r1, r6, #0
	mov r2, r8
	bl sub_80780A4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8078140

	THUMB_FUNC_START sub_8078174
sub_8078174: @ 0x08078174
	push {r4, lr}
	sub sp, #4
	movs r1, #0
	str r1, [r0, #0x44]
	ldr r4, _08078198  @ gUnknown_088018A0
	ldr r1, [r4]
	strh r1, [r0, #0x2c]
	ldr r1, [r4, #4]
	ldr r2, [r4, #8]
	ldr r3, [r4, #0xc]
	ldr r4, [r4, #0x10]
	str r4, [sp]
	bl sub_8078140
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08078198: .4byte gUnknown_088018A0

	THUMB_FUNC_END sub_8078174

	THUMB_FUNC_START sub_807819C
sub_807819C: @ 0x0807819C
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r4, r0, #0
	movs r1, #0x2c
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _08078206
	ldr r1, [r4, #0x44]
	adds r1, #1
	str r1, [r4, #0x44]
	ldr r6, _080781DC  @ gUnknown_088018A0
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r5, r0, #2
	adds r0, r5, r6
	ldr r0, [r0]
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #1
	negs r1, r1
	cmp r0, r1
	bne _080781E0
	bl SpellFx_ClearBG1
	bl SetDefaultColorEffects_
	adds r0, r4, #0
	bl Proc_Break
	b _0807820C
	.align 2, 0
_080781DC: .4byte gUnknown_088018A0
_080781E0:
	adds r0, r6, #4
	adds r0, r5, r0
	ldr r1, [r0]
	adds r0, r6, #0
	adds r0, #8
	adds r0, r5, r0
	ldr r2, [r0]
	adds r0, r6, #0
	adds r0, #0xc
	adds r0, r5, r0
	ldr r3, [r0]
	adds r0, r6, #0
	adds r0, #0x10
	adds r0, r5, r0
	ldr r0, [r0]
	str r0, [sp]
	adds r0, r4, #0
	bl sub_8078140
_08078206:
	ldrh r0, [r4, #0x2c]
	subs r0, #1
	strh r0, [r4, #0x2c]
_0807820C:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_807819C
