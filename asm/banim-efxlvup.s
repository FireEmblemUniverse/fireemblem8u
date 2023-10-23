	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	THUMB_FUNC_START NewEkrLvupApfx
NewEkrLvupApfx: @ 0x08074B90
	push {r4, r5, lr}
	adds r5, r1, #0
	ldr r2, _08074BDC  @ Img_ManimLevelUpStatGain
	ldr r1, _08074BE0  @ 0x000003FF
	ands r1, r0
	lsls r1, r1, #5
	ldr r0, _08074BE4  @ 0x06010000
	adds r1, r1, r0
	adds r0, r2, #0
	bl Decompress
	ldr r4, _08074BE8  @ Pal_ManimLevelUp
	adds r1, r5, #0
	adds r1, #0x10
	lsls r1, r1, #5
	adds r0, r4, #0
	movs r2, #0x20
	bl CopyToPaletteBuffer
	adds r1, r5, #0
	adds r1, #0x11
	lsls r1, r1, #5
	adds r0, r4, #0
	movs r2, #0x20
	bl CopyToPaletteBuffer
	ldr r0, _08074BEC  @ ProcScr_EkrLvupApfx
	movs r1, #3
	bl Proc_Start
	movs r1, #0
	strh r5, [r0, #0x2c]
	ldr r0, _08074BF0  @ gpProcEkrLvupApfx
	str r1, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08074BDC: .4byte Img_ManimLevelUpStatGain
_08074BE0: .4byte 0x000003FF
_08074BE4: .4byte 0x06010000
_08074BE8: .4byte Pal_ManimLevelUp
_08074BEC: .4byte ProcScr_EkrLvupApfx
_08074BF0: .4byte gpProcEkrLvupApfx

	THUMB_FUNC_END NewEkrLvupApfx

	THUMB_FUNC_START EkrLvupApfxEndEach
EkrLvupApfxEndEach: @ 0x08074BF4
	push {lr}
	ldr r0, _08074C08  @ ProcScr_EkrLvupApfx
	bl Proc_EndEach
	ldr r1, _08074C0C  @ gpProcEkrLvupApfx
	movs r0, #1
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_08074C08: .4byte ProcScr_EkrLvupApfx
_08074C0C: .4byte gpProcEkrLvupApfx

	THUMB_FUNC_END EkrLvupApfxEndEach

	THUMB_FUNC_START sub_8074C10
sub_8074C10: @ 0x08074C10
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r1, #0
	ldr r1, _08074C6C  @ gUnknown_085C8278
	mov r8, r1
	subs r0, #1
	lsls r4, r0, #1
	adds r0, r4, #0
	cmp r4, #0
	bge _08074C28
	negs r0, r4
_08074C28:
	ldr r5, _08074C70  @ 0x000003FF
	ands r0, r5
	lsls r0, r0, #5
	add r0, r8
	adds r1, r6, #0
	adds r1, #0x2c
	ands r1, r5
	lsls r1, r1, #5
	ldr r7, _08074C74  @ 0x06010000
	adds r1, r1, r7
	movs r2, #0x40
	bl VramCopy
	adds r0, r4, #0
	cmp r0, #0
	bge _08074C4A
	negs r0, r0
_08074C4A:
	adds r0, #0x20
	ands r0, r5
	lsls r0, r0, #5
	add r0, r8
	adds r1, r6, #0
	adds r1, #0x4c
	ands r1, r5
	lsls r1, r1, #5
	adds r1, r1, r7
	movs r2, #0x40
	bl VramCopy
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08074C6C: .4byte gUnknown_085C8278
_08074C70: .4byte 0x000003FF
_08074C74: .4byte 0x06010000

	THUMB_FUNC_END sub_8074C10

	THUMB_FUNC_START sub_8074C78
sub_8074C78: @ 0x08074C78
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	adds r7, r0, #0
	adds r6, r1, #0
	ldr r0, _08074CC0  @ Img_ManimLevelUpStatGainDigits
	mov r9, r0
	ldr r0, _08074CC4  @ gUnknown_085C8278
	mov r8, r0
	cmp r7, #0
	blt _08074CD0
	movs r0, #0xc0
	lsls r0, r0, #2
	add r0, r8
	adds r1, #0x2c
	ldr r5, _08074CC8  @ 0x000003FF
	ands r1, r5
	lsls r1, r1, #5
	ldr r4, _08074CCC  @ 0x06010000
	adds r1, r1, r4
	movs r2, #0x40
	bl VramCopy
	movs r0, #0xe0
	lsls r0, r0, #3
	add r0, r8
	adds r1, r6, #0
	adds r1, #0x4c
	ands r1, r5
	lsls r1, r1, #5
	adds r1, r1, r4
	movs r2, #0x40
	bl VramCopy
	b _08074D00
	.align 2, 0
_08074CC0: .4byte Img_ManimLevelUpStatGainDigits
_08074CC4: .4byte gUnknown_085C8278
_08074CC8: .4byte 0x000003FF
_08074CCC: .4byte 0x06010000
_08074CD0:
	movs r0, #0xd0
	lsls r0, r0, #2
	add r0, r8
	adds r1, r6, #0
	adds r1, #0x2c
	ldr r5, _08074D50  @ 0x000003FF
	ands r1, r5
	lsls r1, r1, #5
	ldr r4, _08074D54  @ 0x06010000
	adds r1, r1, r4
	movs r2, #0x40
	bl VramCopy
	movs r0, #0xe8
	lsls r0, r0, #3
	add r0, r8
	adds r1, r6, #0
	adds r1, #0x4c
	ands r1, r5
	lsls r1, r1, #5
	adds r1, r1, r4
	movs r2, #0x40
	bl VramCopy
_08074D00:
	adds r0, r7, #0
	cmp r7, #0
	bge _08074D08
	negs r0, r7
_08074D08:
	ldr r4, _08074D50  @ 0x000003FF
	ands r0, r4
	lsls r0, r0, #5
	add r0, r9
	adds r1, r6, #0
	adds r1, #0x2d
	ands r1, r4
	lsls r1, r1, #5
	ldr r5, _08074D54  @ 0x06010000
	adds r1, r1, r5
	movs r2, #0x20
	bl VramCopy
	adds r0, r7, #0
	cmp r0, #0
	bge _08074D2A
	negs r0, r0
_08074D2A:
	adds r0, #0x20
	ands r0, r4
	lsls r0, r0, #5
	add r0, r9
	adds r1, r6, #0
	adds r1, #0x4d
	ands r1, r4
	lsls r1, r1, #5
	adds r1, r1, r5
	movs r2, #0x20
	bl VramCopy
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08074D50: .4byte 0x000003FF
_08074D54: .4byte 0x06010000

	THUMB_FUNC_END sub_8074C78

	THUMB_FUNC_START BanimDrawStatupAp
BanimDrawStatupAp: @ 0x08074D58
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x1c
	str r0, [sp, #0xc]
	str r1, [sp, #0x10]
	mov r8, r2
	mov r9, r3
	str r0, [sp, #0x14]
	ldr r0, [sp, #0x3c]
	subs r0, #1
	lsls r0, r0, #1
	ldr r1, [sp, #0xc]
	adds r0, r1, r0
	str r0, [sp, #0x18]
	ldr r3, [sp, #0x10]
	lsls r6, r3, #0xc
	adds r7, r1, #0
	movs r0, #0x80
	lsls r0, r0, #3
	orrs r7, r0
	adds r5, r6, #0
	orrs r5, r7
	mov r0, r8
	subs r0, #0x12
	mov r1, r9
	subs r1, #4
	ldr r2, _08074DD8  @ gUnknown_085C9270
	str r5, [sp]
	movs r3, #0
	mov sl, r3
	str r3, [sp, #4]
	movs r3, #5
	str r3, [sp, #8]
	movs r3, #0
	bl NewEkrsubAnimeEmulator
	ldr r0, [sp, #0x3c]
	cmp r0, #0
	beq _08074E52
	ldr r0, _08074DDC  @ ProcScr_eobjLvup
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	ldr r1, [sp, #0x40]
	cmp r1, #0
	blt _08074DE4
	ldr r2, _08074DE0  @ gUnknown_085C92A0
	str r5, [sp]
	mov r3, sl
	str r3, [sp, #4]
	movs r0, #5
	str r0, [sp, #8]
	mov r0, r8
	mov r1, r9
	movs r3, #2
	bl NewEkrsubAnimeEmulator
	str r0, [r4, #0x64]
	b _08074E2A
	.align 2, 0
_08074DD8: .4byte gUnknown_085C9270
_08074DDC: .4byte ProcScr_eobjLvup
_08074DE0: .4byte gUnknown_085C92A0
_08074DE4:
	ldr r1, [sp, #0x18]
	movs r3, #0x80
	lsls r3, r3, #3
	orrs r1, r3
	orrs r1, r6
	mov r0, r8
	subs r0, #3
	ldr r2, _08074E64  @ gUnknown_085C92EC
	str r1, [sp]
	mov r1, sl
	str r1, [sp, #4]
	movs r3, #5
	str r3, [sp, #8]
	mov r1, r9
	movs r3, #2
	bl NewEkrsubAnimeEmulator
	str r0, [r4, #0x60]
	orrs r6, r7
	ldr r2, _08074E68  @ gUnknown_085C92D0
	str r6, [sp]
	mov r0, sl
	str r0, [sp, #4]
	movs r1, #5
	str r1, [sp, #8]
	mov r0, r8
	mov r1, r9
	movs r3, #2
	bl NewEkrsubAnimeEmulator
	str r0, [r4, #0x64]
	ldr r0, [sp, #0x40]
	ldr r1, [sp, #0x18]
	bl sub_8074C78
_08074E2A:
	movs r0, #0
	mov r3, r8
	strh r3, [r4, #0x32]
	mov r1, r9
	strh r1, [r4, #0x3a]
	strh r0, [r4, #0x2c]
	mov r3, sp
	ldrh r3, [r3, #0x14]
	strh r3, [r4, #0x2e]
	mov r0, sp
	ldrh r0, [r0, #0x18]
	strh r0, [r4, #0x30]
	ldr r1, [sp, #0xc]
	str r1, [r4, #0x44]
	ldr r3, [sp, #0x10]
	str r3, [r4, #0x48]
	ldr r0, [sp, #0x3c]
	str r0, [r4, #0x4c]
	ldr r1, [sp, #0x40]
	str r1, [r4, #0x50]
_08074E52:
	add sp, #0x1c
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08074E64: .4byte gUnknown_085C92EC
_08074E68: .4byte gUnknown_085C92D0

	THUMB_FUNC_END BanimDrawStatupAp

	THUMB_FUNC_START sub_8074E6C
sub_8074E6C: @ 0x08074E6C
	push {r4, r5, lr}
	sub sp, #0xc
	adds r4, r0, #0
	ldr r0, [r4, #0x50]
	cmp r0, #0
	bge _08074E80
	adds r0, r4, #0
	bl Proc_Break
	b _08074ECE
_08074E80:
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	movs r5, #0
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xf
	bne _08074ECE
	strh r5, [r4, #0x2c]
	ldr r3, [r4, #0x48]
	lsls r3, r3, #0xc
	movs r1, #0x30
	ldrsh r0, [r4, r1]
	movs r1, #0x80
	lsls r1, r1, #3
	orrs r0, r1
	orrs r3, r0
	movs r2, #0x32
	ldrsh r0, [r4, r2]
	subs r0, #3
	movs r2, #0x3a
	ldrsh r1, [r4, r2]
	ldr r2, _08074ED8  @ gUnknown_085C9328
	str r3, [sp]
	str r5, [sp, #4]
	movs r3, #3
	str r3, [sp, #8]
	movs r3, #2
	bl NewEkrsubAnimeEmulator
	str r0, [r4, #0x60]
	ldr r0, [r4, #0x50]
	movs r2, #0x30
	ldrsh r1, [r4, r2]
	bl sub_8074C10
	adds r0, r4, #0
	bl Proc_Break
_08074ECE:
	add sp, #0xc
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08074ED8: .4byte gUnknown_085C9328

	THUMB_FUNC_END sub_8074E6C

	THUMB_FUNC_START sub_8074EDC
sub_8074EDC: @ 0x08074EDC
	push {r4, lr}
	adds r4, r0, #0
	ldr r2, [r4, #0x50]
	cmp r2, #0
	bge _08074EEC
	bl Proc_Break
	b _08074F0E
_08074EEC:
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xf
	bne _08074F0E
	movs r0, #0
	strh r0, [r4, #0x2c]
	movs r0, #0x30
	ldrsh r1, [r4, r0]
	adds r0, r2, #0
	bl sub_8074C78
	adds r0, r4, #0
	bl Proc_Break
_08074F0E:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8074EDC

	THUMB_FUNC_START sub_8074F14
sub_8074F14: @ 0x08074F14
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08074F38  @ gpProcEkrLvupApfx
	ldr r0, [r0]
	cmp r0, #1
	bne _08074F32
	ldr r0, [r4, #0x60]
	bl Proc_End
	ldr r0, [r4, #0x64]
	bl Proc_End
	adds r0, r4, #0
	bl Proc_Break
_08074F32:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08074F38: .4byte gpProcEkrLvupApfx

	THUMB_FUNC_END sub_8074F14

.align 2, 0
