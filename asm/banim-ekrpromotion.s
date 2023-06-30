	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

/* Promotion related EKR anim effect */

	THUMB_FUNC_START EkrClasschgFinished
EkrClasschgFinished: @ 0x080729E0
	push {lr}
	ldr r0, _080729F4  @ gpProcEkrClasshg
	ldr r0, [r0]
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #1
	beq _080729F8
	movs r0, #0
	b _080729FA
	.align 2, 0
_080729F4: .4byte gpProcEkrClasshg
_080729F8:
	movs r0, #1
_080729FA:
	pop {r1}
	bx r1

	THUMB_FUNC_END EkrClasschgFinished

	THUMB_FUNC_START EndEkrClasschg
EndEkrClasschg: @ 0x08072A00
	push {lr}
	ldr r0, _08072A10  @ gpProcEkrClasshg
	ldr r0, [r0]
	bl Proc_End
	pop {r0}
	bx r0
	.align 2, 0
_08072A10: .4byte gpProcEkrClasshg

	THUMB_FUNC_END EndEkrClasschg

	THUMB_FUNC_START NewEkrClassChg
NewEkrClassChg: @ 0x08072A14
	push {r4, r5, lr}
	adds r5, r0, #0
	bl NewEfxSpellCast
	ldr r4, _08072A3C  @ gpProcEkrClasshg
	ldr r0, _08072A40  @ ProcScr_efxClasschg
	movs r1, #3
	bl Proc_Start
	str r0, [r4]
	str r5, [r0, #0x5c]
	movs r2, #0
	movs r1, #0
	strh r1, [r0, #0x2c]
	adds r0, #0x29
	strb r2, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08072A3C: .4byte gpProcEkrClasshg
_08072A40: .4byte ProcScr_efxClasschg

	THUMB_FUNC_END NewEkrClassChg

	THUMB_FUNC_START sub_8072A44
sub_8072A44: @ 0x08072A44
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetCoreAIStruct
	adds r5, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	movs r7, #0
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _08072AC0
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
	movs r0, #3
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	ldr r0, [r4, #0x5c]
	bl DisableEfxStatusUnits
	adds r0, r5, #0
	bl DisableEfxStatusUnits
	ldr r2, _08072ABC  @ gLCDControlBuffer
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
	ldr r0, [r4, #0x5c]
	bl NewEfxClasschgOBJGain
	adds r0, r5, #0
	bl NewEfxClasschgBGSE00
	b _08072C94
	.align 2, 0
_08072ABC: .4byte gLCDControlBuffer
_08072AC0:
	cmp r0, #0x28
	bne _08072ACC
	adds r0, r5, #0
	bl sub_8072DD8
	b _08072C94
_08072ACC:
	cmp r0, #0x87
	bne _08072AE2
	ldr r0, [r4, #0x5c]
	str r7, [sp]
	str r7, [sp, #4]
	movs r1, #0
	movs r2, #0x38
	movs r3, #0x10
	bl NewEfxALPHA
	b _08072C94
_08072AE2:
	cmp r0, #0x88
	bne _08072AF2
	ldr r0, [r4, #0x5c]
	movs r1, #0xc
	movs r2, #0
	bl NewEfxWhiteInOutUnit
	b _08072C94
_08072AF2:
	cmp r0, #0x94
	bne _08072AFE
	movs r0, #1
	bl SetAnimStateHidden
	b _08072C94
_08072AFE:
	cmp r0, #0x8c
	bne _08072B16
	ldr r0, [r4, #0x5c]
	movs r1, #0xa
	bl StartSpellBG_FLASH
	movs r0, #1
	movs r1, #0
	movs r2, #8
	bl BG_SetPosition
	b _08072C94
_08072B16:
	cmp r0, #0x92
	bne _08072B24
	ldr r0, [r4, #0x5c]
	movs r1, #0
	bl NewEfxClasschgOBJDiffusion
	b _08072C94
_08072B24:
	cmp r0, #0xba
	bne _08072B48
	ldr r2, [r4, #0x5c]
	ldrh r1, [r2, #8]
	ldr r0, _08072B44  @ 0x0000F3FF
	ands r0, r1
	strh r0, [r2, #8]
	ldr r2, [r4, #0x5c]
	ldrh r0, [r2, #8]
	movs r3, #0x80
	lsls r3, r3, #3
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2, #8]
	b _08072C94
	.align 2, 0
_08072B44: .4byte 0x0000F3FF
_08072B48:
	cmp r0, #0xd8
	bne _08072B54
	adds r0, r5, #0
	bl NewEfxClasschgOBJDrop
	b _08072C94
_08072B54:
	movs r6, #0x80
	lsls r6, r6, #1
	cmp r0, r6
	bne _08072BC4
	ldr r0, [r4, #0x5c]
	bl sub_8072E1C
	ldr r2, _08072BC0  @ gLCDControlBuffer
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
	movs r0, #1
	movs r1, #0
	movs r2, #0x10
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	ldr r0, [r4, #0x5c]
	movs r1, #0x10
	str r1, [sp]
	str r7, [sp, #4]
	movs r1, #0
	movs r2, #0x38
	movs r3, #0
	bl NewEfxALPHA
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
	movs r0, #3
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	b _08072C94
	.align 2, 0
_08072BC0: .4byte gLCDControlBuffer
_08072BC4:
	movs r0, #0x2c
	ldrsh r1, [r4, r0]
	movs r0, #0x8f
	lsls r0, r0, #1
	cmp r1, r0
	bne _08072BEC
	movs r0, #0
	bl SetAnimStateUnHidden
	ldr r0, [r4, #0x5c]
	movs r1, #8
	bl StartSpellBG_FLASH
	adds r0, r5, #0
	movs r1, #0
	movs r2, #0x20
	movs r3, #0
	bl NewEfxFlashUnit
	b _08072C94
_08072BEC:
	movs r0, #0x9d
	lsls r0, r0, #1
	cmp r1, r0
	bne _08072C18
	ldrh r0, [r5, #8]
	ldr r1, _08072C14  @ 0x0000F3FF
	ands r1, r0
	movs r2, #0x80
	lsls r2, r2, #3
	adds r0, r2, #0
	orrs r1, r0
	strh r1, [r5, #8]
	bl EfxSpellCastSet29
	adds r0, r5, #0
	movs r1, #0xa
	movs r2, #0x46
	bl sub_8054134
	b _08072C94
	.align 2, 0
_08072C14: .4byte 0x0000F3FF
_08072C18:
	movs r0, #0xa2
	lsls r0, r0, #1
	cmp r1, r0
	bne _08072C74
	adds r0, r5, #0
	movs r1, #0x82
	bl NewEfxClasschgFIN
	adds r0, r5, #0
	movs r1, #0x82
	bl NewEfxClasschgCLONE
	movs r0, #0
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	adds r0, r5, #0
	movs r1, #0x5a
	movs r2, #0x28
	movs r3, #0xe
	bl NewEfxALPHA
	movs r0, #1
	str r0, [sp]
	adds r0, r5, #0
	movs r1, #0x82
	movs r2, #0xa
	adds r3, r6, #0
	bl NewefxRestRST
	adds r0, r5, #0
	movs r1, #0x82
	movs r2, #0
	bl NewEfxRestWINH_
	ldr r0, _08072C70  @ 0x0000013D
	movs r3, #2
	ldrsh r2, [r5, r3]
	adds r1, r6, #0
	movs r3, #1
	bl EkrSoundSomeBark
	b _08072C94
	.align 2, 0
_08072C70: .4byte 0x0000013D
_08072C74:
	movs r0, #0xa6
	lsls r0, r0, #1
	cmp r1, r0
	bne _08072C86
	ldr r0, [r4, #0x5c]
	movs r1, #1
	bl NewEfxClasschgOBJDiffusion
	b _08072C94
_08072C86:
	movs r0, #0x8f
	lsls r0, r0, #2
	cmp r1, r0
	bne _08072C94
	adds r0, r4, #0
	bl Proc_Break
_08072C94:
	movs r0, #0x2c
	ldrsh r1, [r4, r0]
	ldrh r2, [r4, #0x2c]
	cmp r1, #0x28
	bne _08072CAE
	movs r0, #0x9f
	lsls r0, r0, #1
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r2, [r4, #0x5c]
	movs r3, #2
	ldrsh r2, [r2, r3]
	b _08072D94
_08072CAE:
	cmp r1, #0x52
	bne _08072CC2
	movs r0, #0x9f
	lsls r0, r0, #1
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r2, [r4, #0x5c]
	movs r4, #2
	ldrsh r2, [r2, r4]
	b _08072D94
_08072CC2:
	cmp r1, #0x68
	bne _08072CD6
	movs r0, #0x9f
	lsls r0, r0, #1
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r2, [r4, #0x5c]
	movs r3, #2
	ldrsh r2, [r2, r3]
	b _08072D94
_08072CD6:
	cmp r1, #0x72
	bne _08072CEA
	movs r0, #0x9f
	lsls r0, r0, #1
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r2, [r4, #0x5c]
	movs r4, #2
	ldrsh r2, [r2, r4]
	b _08072D94
_08072CEA:
	cmp r1, #0x74
	bne _08072CFE
	movs r0, #0x9f
	lsls r0, r0, #1
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r2, [r4, #0x5c]
	movs r3, #2
	ldrsh r2, [r2, r3]
	b _08072D94
_08072CFE:
	cmp r1, #0x76
	bne _08072D12
	movs r0, #0x9f
	lsls r0, r0, #1
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r2, [r4, #0x5c]
	movs r4, #2
	ldrsh r2, [r2, r4]
	b _08072D94
_08072D12:
	cmp r1, #0x78
	bne _08072D28
	ldr r0, _08072D24  @ 0x0000013B
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r2, [r4, #0x5c]
	movs r3, #2
	ldrsh r2, [r2, r3]
	b _08072D94
	.align 2, 0
_08072D24: .4byte 0x0000013B
_08072D28:
	movs r3, #0x80
	lsls r3, r3, #1
	cmp r1, r3
	bne _08072D38
	ldr r0, _08072D34  @ 0x000003E5
	b _08072D8C
	.align 2, 0
_08072D34: .4byte 0x000003E5
_08072D38:
	movs r0, #0x8f
	lsls r0, r0, #1
	cmp r1, r0
	beq _08072D88
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	bne _08072D4C
	adds r0, #0x1e
	b _08072D8C
_08072D4C:
	lsls r0, r2, #0x10
	asrs r1, r0, #0x10
	movs r0, #0x91
	lsls r0, r0, #1
	cmp r1, r0
	bne _08072D5C
	adds r0, #0x1c
	b _08072D8C
_08072D5C:
	movs r0, #0x93
	lsls r0, r0, #1
	cmp r1, r0
	bne _08072D68
	adds r0, #0x18
	b _08072D8C
_08072D68:
	movs r0, #0x95
	lsls r0, r0, #1
	cmp r1, r0
	bne _08072D74
	adds r0, #0x14
	b _08072D8C
_08072D74:
	movs r0, #0x97
	lsls r0, r0, #1
	cmp r1, r0
	bne _08072D80
	adds r0, #0x10
	b _08072D8C
_08072D80:
	movs r0, #0x99
	lsls r0, r0, #1
	cmp r1, r0
	bne _08072D9C
_08072D88:
	movs r0, #0x9f
	lsls r0, r0, #1
_08072D8C:
	ldr r1, [r4, #0x5c]
	movs r4, #2
	ldrsh r2, [r1, r4]
	adds r1, r3, #0
_08072D94:
	movs r3, #1
	bl EkrSoundSomeBark
	b _08072DB4
_08072D9C:
	movs r0, #0x9a
	lsls r0, r0, #1
	cmp r1, r0
	bne _08072DB4
	ldr r0, _08072DBC  @ 0x000003E6
	ldr r1, [r4, #0x5c]
	movs r4, #2
	ldrsh r2, [r1, r4]
	adds r1, r3, #0
	movs r3, #1
	bl EkrSoundSomeBark
_08072DB4:
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08072DBC: .4byte 0x000003E6

	THUMB_FUNC_END sub_8072A44

	THUMB_FUNC_START sub_8072DC0
sub_8072DC0: @ 0x08072DC0
	adds r0, #0x29
	movs r1, #1
	strb r1, [r0]
	bx lr

	THUMB_FUNC_END sub_8072DC0

	THUMB_FUNC_START EndEfxStatusUnit
EndEfxStatusUnit: @ 0x08072DC8
	push {lr}
	ldr r0, _08072DD4  @ ProcScr_efxStatusUnit
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
_08072DD4: .4byte ProcScr_efxStatusUnit

	THUMB_FUNC_END EndEfxStatusUnit

	THUMB_FUNC_START sub_8072DD8
sub_8072DD8: @ 0x08072DD8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08072E08  @ ProcScr_efxClasschgBG
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r1, [r0, #0x44]
	ldr r1, _08072E0C  @ gUnknown_080E143A
	str r1, [r0, #0x48]
	ldr r1, _08072E10  @ gUnknown_08759000
	str r1, [r0, #0x4c]
	str r1, [r0, #0x50]
	ldr r1, _08072E14  @ gUnknown_08759094
	str r1, [r0, #0x54]
	ldr r1, _08072E18  @ gUnknown_08759128
	str r1, [r0, #0x58]
	bl SpellFx_SetSomeColorEffect
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08072E08: .4byte ProcScr_efxClasschgBG
_08072E0C: .4byte gUnknown_080E143A
_08072E10: .4byte gUnknown_08759000
_08072E14: .4byte gUnknown_08759094
_08072E18: .4byte gUnknown_08759128

	THUMB_FUNC_END sub_8072DD8

	THUMB_FUNC_START sub_8072E1C
sub_8072E1C: @ 0x08072E1C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08072E4C  @ ProcScr_efxClasschgBG
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r1, [r0, #0x44]
	ldr r1, _08072E50  @ gUnknown_080E1488
	str r1, [r0, #0x48]
	ldr r1, _08072E54  @ gUnknown_08759000
	str r1, [r0, #0x4c]
	str r1, [r0, #0x50]
	ldr r1, _08072E58  @ gUnknown_08759094
	str r1, [r0, #0x54]
	ldr r1, _08072E5C  @ gUnknown_08759128
	str r1, [r0, #0x58]
	bl SpellFx_SetSomeColorEffect
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08072E4C: .4byte ProcScr_efxClasschgBG
_08072E50: .4byte gUnknown_080E1488
_08072E54: .4byte gUnknown_08759000
_08072E58: .4byte gUnknown_08759094
_08072E5C: .4byte gUnknown_08759128

	THUMB_FUNC_END sub_8072E1C

	THUMB_FUNC_START sub_8072E60
sub_8072E60: @ 0x08072E60
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	ldr r0, [r5, #0x5c]
	bl GetCoreAIStruct
	adds r7, r0, #0
	adds r0, r5, #0
	adds r0, #0x2c
	adds r1, r5, #0
	adds r1, #0x44
	ldr r2, [r5, #0x48]
	bl SpellFx_InterpretBgAnimScript
	lsls r0, r0, #0x10
	asrs r4, r0, #0x10
	cmp r4, #0
	blt _08072EB8
	ldr r6, [r5, #0x4c]
	ldr r0, [r5, #0x50]
	mov r8, r0
	ldr r0, [r5, #0x54]
	ldr r5, [r5, #0x58]
	lsls r4, r4, #2
	adds r0, r4, r0
	ldr r0, [r0]
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	adds r5, r4, r5
	ldr r0, [r5]
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	adds r6, r4, r6
	ldr r1, [r6]
	add r4, r8
	ldr r2, [r4]
	adds r0, r7, #0
	bl SpellFx_WriteBgMap
	b _08072ECE
_08072EB8:
	movs r0, #1
	negs r0, r0
	cmp r4, r0
	bne _08072ECE
	bl SpellFx_ClearBG1
	bl SetDefaultColorEffects_
	adds r0, r5, #0
	bl Proc_End
_08072ECE:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8072E60

	THUMB_FUNC_START NewEfxClasschgBGSE00
NewEfxClasschgBGSE00: @ 0x08072ED8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08072EF0  @ ProcScr_efxClasschgBGSE00
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08072EF0: .4byte ProcScr_efxClasschgBGSE00

	THUMB_FUNC_END NewEfxClasschgBGSE00

	THUMB_FUNC_START sub_8072EF4
sub_8072EF4: @ 0x08072EF4
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x28
	beq _08072F1A
	cmp r0, #0x52
	beq _08072F1A
	cmp r0, #0x68
	beq _08072F1A
	cmp r0, #0x72
	beq _08072F1A
	cmp r0, #0x74
	beq _08072F1A
	cmp r0, #0x76
	bne _08072F30
_08072F1A:
	movs r0, #0x9f
	lsls r0, r0, #1
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r2, [r4, #0x5c]
	movs r3, #2
	ldrsh r2, [r2, r3]
	movs r3, #1
	bl EkrSoundSomeBark
	b _08072F46
_08072F30:
	cmp r0, #0x78
	bne _08072F46
	ldr r0, _08072F54  @ 0x0000013B
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r2, [r4, #0x5c]
	movs r3, #2
	ldrsh r2, [r2, r3]
	movs r3, #1
	bl EkrSoundSomeBark
_08072F46:
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08072F54: .4byte 0x0000013B

	THUMB_FUNC_END sub_8072EF4

	THUMB_FUNC_START NewEfxClasschgBGSE01
NewEfxClasschgBGSE01: @ 0x08072F58
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08072F70  @ ProcScr_efxClasschgBGSE01
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08072F70: .4byte ProcScr_efxClasschgBGSE01

	THUMB_FUNC_END NewEfxClasschgBGSE01

	THUMB_FUNC_START sub_8072F74
sub_8072F74: @ 0x08072F74
	push {lr}
	ldrh r1, [r0, #0x2c]
	adds r1, #1
	strh r1, [r0, #0x2c]
	bl Proc_Break
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8072F74

	THUMB_FUNC_START NewEfxClasschgOBJGain
NewEfxClasschgOBJGain: @ 0x08072F84
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, _08072FC0  @ ProcScr_efxClasschgOBJGain
	movs r1, #3
	bl Proc_Start
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	ldr r3, _08072FC4  @ gUnknown_08792928
	str r3, [sp]
	adds r0, r4, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl EfxAnimCreate1
	str r0, [r5, #0x60]
	ldr r0, _08072FC8  @ gUnknown_08792194
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _08072FCC  @ gUnknown_08791D9C
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08072FC0: .4byte ProcScr_efxClasschgOBJGain
_08072FC4: .4byte gUnknown_08792928
_08072FC8: .4byte gUnknown_08792194
_08072FCC: .4byte gUnknown_08791D9C

	THUMB_FUNC_END NewEfxClasschgOBJGain

	THUMB_FUNC_START sub_8072FD0
sub_8072FD0: @ 0x08072FD0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x60]
	bl AnimDelete
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8072FD0

	THUMB_FUNC_START NewEfxClasschgOBJDrop
NewEfxClasschgOBJDrop: @ 0x08072FE8
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, _08073024  @ ProcScr_efxClasschgOBJDrop
	movs r1, #3
	bl Proc_Start
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	ldr r3, _08073028  @ gUnknown_08792958
	str r3, [sp]
	adds r0, r4, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl EfxAnimCreate1
	str r0, [r5, #0x60]
	ldr r0, _0807302C  @ gUnknown_08792194
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _08073030  @ gUnknown_08791D9C
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08073024: .4byte ProcScr_efxClasschgOBJDrop
_08073028: .4byte gUnknown_08792958
_0807302C: .4byte gUnknown_08792194
_08073030: .4byte gUnknown_08791D9C

	THUMB_FUNC_END NewEfxClasschgOBJDrop

	THUMB_FUNC_START sub_8073034
sub_8073034: @ 0x08073034
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x60]
	bl AnimDelete
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8073034

	THUMB_FUNC_START NewEfxClasschgOBJDiffusion
NewEfxClasschgOBJDiffusion: @ 0x0807304C
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	lsls r4, r1, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _08073068  @ ProcScr_efxClasschgOBJDiffusion
	movs r1, #3
	bl Proc_Start
	adds r5, r0, #0
	cmp r4, #0
	bne _0807306C
	str r6, [r5, #0x5c]
	b _08073074
	.align 2, 0
_08073068: .4byte ProcScr_efxClasschgOBJDiffusion
_0807306C:
	adds r0, r6, #0
	bl GetCoreAIStruct
	str r0, [r5, #0x5c]
_08073074:
	ldr r3, _080730A0  @ gUnknown_08792988
	ldr r0, [r5, #0x5c]
	str r3, [sp]
	adds r1, r3, #0
	adds r2, r3, #0
	bl EfxAnimCreate1
	str r0, [r5, #0x60]
	ldr r0, _080730A4  @ gUnknown_08792194
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _080730A8  @ gUnknown_08791D9C
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080730A0: .4byte gUnknown_08792988
_080730A4: .4byte gUnknown_08792194
_080730A8: .4byte gUnknown_08791D9C

	THUMB_FUNC_END NewEfxClasschgOBJDiffusion

	THUMB_FUNC_START sub_80730AC
sub_80730AC: @ 0x080730AC
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x60]
	bl AnimDelete
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_80730AC

	THUMB_FUNC_START NewEfxClasschgFIN
NewEfxClasschgFIN: @ 0x080730C4
	push {r4, r5, r6, lr}
	mov r6, r9
	mov r5, r8
	push {r5, r6}
	sub sp, #8
	adds r5, r0, #0
	adds r4, r1, #0
	ldr r0, _080731AC  @ ProcScr_efxClasschgFIN
	movs r1, #3
	bl Proc_Start
	str r5, [r0, #0x5c]
	movs r1, #0
	mov r9, r1
	mov r2, r9
	strh r2, [r0, #0x2c]
	strh r4, [r0, #0x2e]
	ldr r0, _080731B0  @ gUnknown_08791D7C
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	ldr r0, _080731B4  @ gUnknown_086849B8
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	ldr r0, _080731B8  @ gUnknown_08684AB8
	ldr r1, _080731BC  @ gBG1TilemapBuffer
	movs r2, #1
	mov r8, r2
	str r2, [sp]
	adds r2, #0xff
	str r2, [sp, #4]
	movs r2, #0x20
	movs r3, #0x20
	bl sub_8070E94
	movs r0, #2
	bl BG_EnableSyncByMask
	bl SpellFx_SetSomeColorEffect
	movs r0, #1
	movs r1, #0xe
	movs r2, #8
	movs r3, #0
	bl SetSpecialColorEffectsParameters
	ldr r4, _080731C0  @ gLCDControlBuffer
	adds r3, r4, #0
	adds r3, #0x37
	ldrb r1, [r3]
	movs r6, #0x20
	orrs r1, r6
	ldrb r2, [r4, #1]
	movs r0, #0x21
	negs r0, r0
	ands r0, r2
	movs r2, #0x41
	negs r2, r2
	ands r0, r2
	movs r2, #0x80
	orrs r0, r2
	strb r0, [r4, #1]
	movs r0, #2
	negs r0, r0
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	movs r0, #4
	orrs r1, r0
	movs r0, #8
	orrs r1, r0
	movs r0, #0x10
	orrs r1, r0
	strb r1, [r3]
	mov r0, r9
	str r0, [sp]
	movs r0, #0
	movs r1, #1
	movs r2, #0
	movs r3, #0
	bl SetBlendTargetA
	mov r1, r8
	str r1, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #1
	movs r3, #1
	bl SetBlendTargetB
	adds r4, #0x3d
	ldrb r0, [r4]
	orrs r0, r6
	strb r0, [r4]
	ldr r0, [r5, #0x1c]
	movs r1, #0x80
	lsls r1, r1, #4
	orrs r0, r1
	str r0, [r5, #0x1c]
	ldrh r1, [r5, #8]
	ldr r0, _080731C4  @ 0x0000F3FF
	ands r0, r1
	movs r2, #0x80
	lsls r2, r2, #3
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r5, #8]
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080731AC: .4byte ProcScr_efxClasschgFIN
_080731B0: .4byte gUnknown_08791D7C
_080731B4: .4byte gUnknown_086849B8
_080731B8: .4byte gUnknown_08684AB8
_080731BC: .4byte gBG1TilemapBuffer
_080731C0: .4byte gLCDControlBuffer
_080731C4: .4byte 0x0000F3FF

	THUMB_FUNC_END NewEfxClasschgFIN

	THUMB_FUNC_START sub_80731C8
sub_80731C8: @ 0x080731C8
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r5, [r4, #0x5c]
	ldr r1, _08073214  @ gLCDControlBuffer
	ldrh r0, [r1, #0x22]
	subs r0, #1
	strh r0, [r1, #0x22]
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x2e
	ldrsh r1, [r4, r2]
	cmp r0, r1
	bne _0807320E
	bl SpellFx_ClearBG1
	bl SetDefaultColorEffects_
	ldr r0, [r5, #0x1c]
	ldr r1, _08073218  @ 0xFFFFF7FF
	ands r0, r1
	str r0, [r5, #0x1c]
	ldrh r1, [r5, #8]
	ldr r0, _0807321C  @ 0x0000F3FF
	ands r0, r1
	movs r2, #0x80
	lsls r2, r2, #4
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r5, #8]
	adds r0, r4, #0
	bl Proc_Break
_0807320E:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08073214: .4byte gLCDControlBuffer
_08073218: .4byte 0xFFFFF7FF
_0807321C: .4byte 0x0000F3FF

	THUMB_FUNC_END sub_80731C8

	THUMB_FUNC_START NewEfxClasschgCLONE
NewEfxClasschgCLONE: @ 0x08073220
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _0807323C  @ ProcScr_efxClasschgCLONE
	movs r1, #4
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r5, [r0, #0x2e]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807323C: .4byte ProcScr_efxClasschgCLONE

	THUMB_FUNC_END NewEfxClasschgCLONE

	THUMB_FUNC_START sub_8073240
sub_8073240: @ 0x08073240
	push {r4, lr}
	sub sp, #0x48
	adds r4, r0, #0
	ldr r2, [r4, #0x5c]
	mov r1, sp
	ldrh r0, [r2, #2]
	strh r0, [r1, #2]
	ldrh r0, [r2, #4]
	strh r0, [r1, #4]
	ldr r0, [r2, #0x3c]
	str r0, [sp, #0x3c]
	ldr r0, [r2, #0x1c]
	ldr r1, _0807329C  @ 0xFFFFF7FF
	ands r0, r1
	str r0, [sp, #0x1c]
	mov r0, sp
	ldrh r1, [r2, #8]
	strh r1, [r0, #8]
	mov r2, sp
	ldr r0, _080732A0  @ 0x0000F3FF
	ands r0, r1
	strh r0, [r2, #8]
	movs r3, #0x80
	lsls r3, r3, #4
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2, #8]
	mov r0, sp
	bl AnimDisplay
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x2e
	ldrsh r1, [r4, r2]
	cmp r0, r1
	bne _08073294
	adds r0, r4, #0
	bl Proc_Break
_08073294:
	add sp, #0x48
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807329C: .4byte 0xFFFFF7FF
_080732A0: .4byte 0x0000F3FF

	THUMB_FUNC_END sub_8073240

	THUMB_FUNC_START sub_80732A4
sub_80732A4: @ 0x080732A4
	bx lr

	THUMB_FUNC_END sub_80732A4

	THUMB_FUNC_START NewEfxBlackInOutUnit
NewEfxBlackInOutUnit: @ 0x080732A8
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	ldr r0, _080732D0  @ ProcScr_efxBlackInOutUnit
	movs r1, #4
	bl Proc_Start
	adds r1, r0, #0
	str r4, [r1, #0x5c]
	movs r2, #0
	strh r2, [r1, #0x2c]
	strh r5, [r1, #0x2e]
	cmp r6, #0
	bne _080732D4
	strh r2, [r1, #0x32]
	movs r0, #0x10
	strh r0, [r1, #0x34]
	b _080732DA
	.align 2, 0
_080732D0: .4byte ProcScr_efxBlackInOutUnit
_080732D4:
	movs r0, #0x10
	strh r0, [r1, #0x32]
	strh r2, [r1, #0x34]
_080732DA:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END NewEfxBlackInOutUnit

	THUMB_FUNC_START sub_80732E0
sub_80732E0: @ 0x080732E0
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	movs r0, #0x32
	ldrsh r1, [r5, r0]
	movs r4, #0x34
	ldrsh r2, [r5, r4]
	movs r0, #0x2c
	ldrsh r3, [r5, r0]
	movs r4, #0x2e
	ldrsh r0, [r5, r4]
	str r0, [sp]
	movs r0, #0
	bl Interpolate
	adds r6, r0, #0
	ldr r0, [r5, #0x5c]
	bl GetAISSubjectId
	cmp r0, #0
	bne _08073338
	ldr r0, _0807332C  @ gpEfxUnitPaletteBackup
	ldr r0, [r0]
	ldr r4, _08073330  @ gUnknown_02022B88
	adds r1, r4, #0
	movs r2, #8
	bl CpuFastSet
	ldr r0, _08073334  @ 0xFFFFFD20
	adds r4, r4, r0
	adds r0, r4, #0
	movs r1, #0x17
	movs r2, #1
	adds r3, r6, #0
	bl EkrMaybePalFadeWithVal
	b _08073356
	.align 2, 0
_0807332C: .4byte gpEfxUnitPaletteBackup
_08073330: .4byte gUnknown_02022B88
_08073334: .4byte 0xFFFFFD20
_08073338:
	ldr r0, _0807337C  @ gpEfxUnitPaletteBackup
	ldr r0, [r0, #4]
	ldr r4, _08073380  @ gUnknown_02022BC8
	adds r1, r4, #0
	movs r2, #8
	bl CpuFastSet
	ldr r2, _08073384  @ 0xFFFFFCE0
	adds r4, r4, r2
	adds r0, r4, #0
	movs r1, #0x19
	movs r2, #1
	adds r3, r6, #0
	bl EkrMaybePalFadeWithVal
_08073356:
	bl EnablePaletteSync
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r4, #0x2e
	ldrsh r1, [r5, r4]
	cmp r0, r1
	ble _08073372
	adds r0, r5, #0
	bl Proc_Break
_08073372:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807337C: .4byte gpEfxUnitPaletteBackup
_08073380: .4byte gUnknown_02022BC8
_08073384: .4byte 0xFFFFFCE0

	THUMB_FUNC_END sub_80732E0

	THUMB_FUNC_START NewEfxWhiteInOutUnit
NewEfxWhiteInOutUnit: @ 0x08073388
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	ldr r0, _080733B0  @ ProcScr_efxWhiteInOutUnit
	movs r1, #4
	bl Proc_Start
	adds r1, r0, #0
	str r4, [r1, #0x5c]
	movs r2, #0
	strh r2, [r1, #0x2c]
	strh r5, [r1, #0x2e]
	cmp r6, #0
	bne _080733B4
	strh r2, [r1, #0x32]
	movs r0, #0x10
	strh r0, [r1, #0x34]
	b _080733BA
	.align 2, 0
_080733B0: .4byte ProcScr_efxWhiteInOutUnit
_080733B4:
	movs r0, #0x10
	strh r0, [r1, #0x32]
	strh r2, [r1, #0x34]
_080733BA:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_END NewEfxWhiteInOutUnit

	THUMB_FUNC_START sub_80733C0
sub_80733C0: @ 0x080733C0
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	movs r0, #0x32
	ldrsh r1, [r5, r0]
	movs r4, #0x34
	ldrsh r2, [r5, r4]
	movs r0, #0x2c
	ldrsh r3, [r5, r0]
	movs r4, #0x2e
	ldrsh r0, [r5, r4]
	str r0, [sp]
	movs r0, #0
	bl Interpolate
	adds r6, r0, #0
	ldr r0, [r5, #0x5c]
	bl GetAISSubjectId
	cmp r0, #0
	bne _08073418
	ldr r0, _0807340C  @ gpEfxUnitPaletteBackup
	ldr r0, [r0]
	ldr r4, _08073410  @ gUnknown_02022B88
	adds r1, r4, #0
	movs r2, #8
	bl CpuFastSet
	ldr r0, _08073414  @ 0xFFFFFD20
	adds r4, r4, r0
	adds r0, r4, #0
	movs r1, #0x17
	movs r2, #1
	adds r3, r6, #0
	bl sub_807132C
	b _08073436
	.align 2, 0
_0807340C: .4byte gpEfxUnitPaletteBackup
_08073410: .4byte gUnknown_02022B88
_08073414: .4byte 0xFFFFFD20
_08073418:
	ldr r0, _0807345C  @ gpEfxUnitPaletteBackup
	ldr r0, [r0, #4]
	ldr r4, _08073460  @ gUnknown_02022BC8
	adds r1, r4, #0
	movs r2, #8
	bl CpuFastSet
	ldr r2, _08073464  @ 0xFFFFFCE0
	adds r4, r4, r2
	adds r0, r4, #0
	movs r1, #0x19
	movs r2, #1
	adds r3, r6, #0
	bl sub_807132C
_08073436:
	bl EnablePaletteSync
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r4, #0x2e
	ldrsh r1, [r5, r4]
	cmp r0, r1
	ble _08073452
	adds r0, r5, #0
	bl Proc_Break
_08073452:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807345C: .4byte gpEfxUnitPaletteBackup
_08073460: .4byte gUnknown_02022BC8
_08073464: .4byte 0xFFFFFCE0

	THUMB_FUNC_END sub_80733C0

	THUMB_FUNC_START NewEfxClasschgRST
NewEfxClasschgRST: @ 0x08073468
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	mov r8, r1
	adds r5, r2, #0
	adds r6, r3, #0
	ldr r7, [sp, #0x18]
	ldr r1, _080734A4  @ gEfxBgSemaphore
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _080734A8  @ ProcScr_efxClasschgRST
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r5, [r0, #0x2e]
	str r6, [r0, #0x44]
	str r7, [r0, #0x48]
	mov r1, r8
	str r1, [r0, #0x64]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080734A4: .4byte gEfxBgSemaphore
_080734A8: .4byte ProcScr_efxClasschgRST

	THUMB_FUNC_END NewEfxClasschgRST

	THUMB_FUNC_START sub_80734AC
sub_80734AC: @ 0x080734AC
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r4, [r5, #0x64]
	ldr r1, [r5, #0x44]
	ldr r2, [r5, #0x48]
	movs r0, #0x2c
	ldrsh r3, [r5, r0]
	movs r6, #0x2e
	ldrsh r0, [r5, r6]
	str r0, [sp]
	movs r0, #4
	bl Interpolate
	str r0, [r4, #0x4c]
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x2e
	ldrsh r1, [r5, r2]
	cmp r0, r1
	ble _080734EA
	ldr r1, _080734F4  @ gEfxBgSemaphore
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r5, #0
	bl Proc_Break
_080734EA:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080734F4: .4byte gEfxBgSemaphore

	THUMB_FUNC_END sub_80734AC

.align 2, 0
