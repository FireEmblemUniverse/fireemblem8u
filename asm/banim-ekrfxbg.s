	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	THUMB_FUNC_START StartSpellBG_FLASH
StartSpellBG_FLASH: @ 0x08053F10
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _08053F40  @ gProc_efxFlashBG
	movs r1, #0
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r5, [r0, #0x2e]
	movs r0, #1
	negs r0, r0
	str r0, [sp]
	ldr r1, _08053F44  @ gUnknown_020165C8
	ldr r2, _08053F48  @ 0x01000100
	mov r0, sp
	bl CpuFastSet
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08053F40: .4byte gProc_efxFlashBG
_08053F44: .4byte gUnknown_020165C8
_08053F48: .4byte 0x01000100

	THUMB_FUNC_END StartSpellBG_FLASH

	THUMB_FUNC_START sub_8053F4C
sub_8053F4C: @ 0x08053F4C
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _08053F7C  @ gProc_efxFlashBG
	movs r1, #0
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r5, [r0, #0x2e]
	ldr r0, _08053F80  @ 0x001F001F
	str r0, [sp]
	ldr r1, _08053F84  @ gUnknown_020165C8
	ldr r2, _08053F88  @ 0x01000100
	mov r0, sp
	bl CpuFastSet
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08053F7C: .4byte gProc_efxFlashBG
_08053F80: .4byte 0x001F001F
_08053F84: .4byte gUnknown_020165C8
_08053F88: .4byte 0x01000100

	THUMB_FUNC_END sub_8053F4C

	THUMB_FUNC_START sub_8053F8C
sub_8053F8C: @ 0x08053F8C
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _08053FB8  @ gProc_efxFlashBG
	movs r1, #0
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r5, [r0, #0x2e]
	str r1, [sp]
	ldr r1, _08053FBC  @ gUnknown_020165C8
	ldr r2, _08053FC0  @ 0x01000100
	mov r0, sp
	bl CpuFastSet
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08053FB8: .4byte gProc_efxFlashBG
_08053FBC: .4byte gUnknown_020165C8
_08053FC0: .4byte 0x01000100

	THUMB_FUNC_END sub_8053F8C

	THUMB_FUNC_START sub_8053FC4
sub_8053FC4: @ 0x08053FC4
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _08053FE0  @ gProc_efxFlashBG
	movs r1, #0
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r5, [r0, #0x2e]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08053FE0: .4byte gProc_efxFlashBG

	THUMB_FUNC_END sub_8053FC4

	THUMB_FUNC_START sub_8053FE4
sub_8053FE4: @ 0x08053FE4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08054018  @ gUnknown_020165C8
	movs r1, #0xa0
	lsls r1, r1, #0x13
	movs r2, #0x80
	lsls r2, r2, #1
	bl CpuFastSet
	bl DisablePaletteSync
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x2e
	ldrsh r1, [r4, r2]
	cmp r0, r1
	blt _08054012
	adds r0, r4, #0
	bl Proc_Break
_08054012:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08054018: .4byte gUnknown_020165C8

	THUMB_FUNC_END sub_8053FE4

	THUMB_FUNC_START sub_805401C
sub_805401C: @ 0x0805401C
	push {r4, lr}
	adds r4, r0, #0
	bl EnablePaletteSync
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_805401C

	THUMB_FUNC_START sub_8054030
sub_8054030: @ 0x08054030
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	ldr r0, _08054050  @ gProc_efxWhiteOUT
	movs r1, #0
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r5, [r0, #0x2e]
	strh r6, [r0, #0x30]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08054050: .4byte gProc_efxWhiteOUT

	THUMB_FUNC_END sub_8054030

	THUMB_FUNC_START sub_8054054
sub_8054054: @ 0x08054054
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r0, _080540A8  @ gPaletteBuffer
	ldr r4, _080540AC  @ gUnknown_020165C8
	movs r5, #0x80
	lsls r5, r5, #1
	adds r1, r4, #0
	adds r2, r5, #0
	bl CpuFastSet
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0x20
	movs r3, #0
	bl sub_807132C
	movs r1, #0xa0
	lsls r1, r1, #0x13
	adds r0, r4, #0
	adds r2, r5, #0
	bl CpuFastSet
	bl DisablePaletteSync
	ldrh r0, [r6, #0x2c]
	adds r0, #1
	strh r0, [r6, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x2e
	ldrsh r1, [r6, r2]
	cmp r0, r1
	ble _080540A0
	movs r0, #0
	strh r0, [r6, #0x2c]
	adds r0, r6, #0
	bl Proc_Break
_080540A0:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080540A8: .4byte gPaletteBuffer
_080540AC: .4byte gUnknown_020165C8

	THUMB_FUNC_END sub_8054054

	THUMB_FUNC_START sub_80540B0
sub_80540B0: @ 0x080540B0
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r7, r0, #0
	movs r0, #0x2c
	ldrsh r3, [r7, r0]
	movs r1, #0x30
	ldrsh r0, [r7, r1]
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0x10
	bl Interpolate
	adds r6, r0, #0
	ldr r0, _08054118  @ gPaletteBuffer
	ldr r4, _0805411C  @ gUnknown_020165C8
	movs r5, #0x80
	lsls r5, r5, #1
	adds r1, r4, #0
	adds r2, r5, #0
	bl CpuFastSet
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0x20
	adds r3, r6, #0
	bl sub_807132C
	movs r1, #0xa0
	lsls r1, r1, #0x13
	adds r0, r4, #0
	adds r2, r5, #0
	bl CpuFastSet
	bl DisablePaletteSync
	ldrh r0, [r7, #0x2c]
	adds r0, #1
	strh r0, [r7, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x30
	ldrsh r1, [r7, r2]
	cmp r0, r1
	ble _08054110
	adds r0, r7, #0
	bl Proc_Break
_08054110:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08054118: .4byte gPaletteBuffer
_0805411C: .4byte gUnknown_020165C8

	THUMB_FUNC_END sub_80540B0

	THUMB_FUNC_START sub_8054120
sub_8054120: @ 0x08054120
	push {r4, lr}
	adds r4, r0, #0
	bl EnablePaletteSync
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8054120

	THUMB_FUNC_START sub_8054134
sub_8054134: @ 0x08054134
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	ldr r0, _08054154  @ gProc_efxWhiteIN
	movs r1, #0
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r5, [r0, #0x2e]
	strh r6, [r0, #0x30]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08054154: .4byte gProc_efxWhiteIN

	THUMB_FUNC_END sub_8054134

	THUMB_FUNC_START sub_8054158
sub_8054158: @ 0x08054158
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r0, _080541AC  @ gPaletteBuffer
	ldr r4, _080541B0  @ gUnknown_020165C8
	movs r5, #0x80
	lsls r5, r5, #1
	adds r1, r4, #0
	adds r2, r5, #0
	bl CpuFastSet
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0x20
	movs r3, #0x10
	bl sub_807132C
	movs r1, #0xa0
	lsls r1, r1, #0x13
	adds r0, r4, #0
	adds r2, r5, #0
	bl CpuFastSet
	bl DisablePaletteSync
	ldrh r0, [r6, #0x2c]
	adds r0, #1
	strh r0, [r6, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x2e
	ldrsh r1, [r6, r2]
	cmp r0, r1
	ble _080541A4
	movs r0, #0
	strh r0, [r6, #0x2c]
	adds r0, r6, #0
	bl Proc_Break
_080541A4:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080541AC: .4byte gPaletteBuffer
_080541B0: .4byte gUnknown_020165C8

	THUMB_FUNC_END sub_8054158

	THUMB_FUNC_START sub_80541B4
sub_80541B4: @ 0x080541B4
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r7, r0, #0
	movs r0, #0x2c
	ldrsh r3, [r7, r0]
	movs r1, #0x30
	ldrsh r0, [r7, r1]
	str r0, [sp]
	movs r0, #0
	movs r1, #0x10
	movs r2, #0
	bl Interpolate
	adds r6, r0, #0
	ldr r0, _0805421C  @ gPaletteBuffer
	ldr r4, _08054220  @ gUnknown_020165C8
	movs r5, #0x80
	lsls r5, r5, #1
	adds r1, r4, #0
	adds r2, r5, #0
	bl CpuFastSet
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0x20
	adds r3, r6, #0
	bl sub_807132C
	movs r1, #0xa0
	lsls r1, r1, #0x13
	adds r0, r4, #0
	adds r2, r5, #0
	bl CpuFastSet
	bl DisablePaletteSync
	ldrh r0, [r7, #0x2c]
	adds r0, #1
	strh r0, [r7, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x30
	ldrsh r1, [r7, r2]
	cmp r0, r1
	ble _08054214
	adds r0, r7, #0
	bl Proc_Break
_08054214:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805421C: .4byte gPaletteBuffer
_08054220: .4byte gUnknown_020165C8

	THUMB_FUNC_END sub_80541B4

	THUMB_FUNC_START sub_8054224
sub_8054224: @ 0x08054224
	push {r4, lr}
	adds r4, r0, #0
	bl EnablePaletteSync
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8054224

	THUMB_FUNC_START sub_8054238
sub_8054238: @ 0x08054238
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	ldr r0, _08054258  @ gProc_efxBlackOUT
	movs r1, #0
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r5, [r0, #0x2e]
	strh r6, [r0, #0x30]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08054258: .4byte gProc_efxBlackOUT

	THUMB_FUNC_END sub_8054238

	THUMB_FUNC_START sub_805425C
sub_805425C: @ 0x0805425C
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r0, _080542B0  @ gPaletteBuffer
	ldr r4, _080542B4  @ gUnknown_020165C8
	movs r5, #0x80
	lsls r5, r5, #1
	adds r1, r4, #0
	adds r2, r5, #0
	bl CpuFastSet
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0x20
	movs r3, #0
	bl sub_80712B0
	movs r1, #0xa0
	lsls r1, r1, #0x13
	adds r0, r4, #0
	adds r2, r5, #0
	bl CpuFastSet
	bl DisablePaletteSync
	ldrh r0, [r6, #0x2c]
	adds r0, #1
	strh r0, [r6, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x2e
	ldrsh r1, [r6, r2]
	cmp r0, r1
	ble _080542A8
	movs r0, #0
	strh r0, [r6, #0x2c]
	adds r0, r6, #0
	bl Proc_Break
_080542A8:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080542B0: .4byte gPaletteBuffer
_080542B4: .4byte gUnknown_020165C8

	THUMB_FUNC_END sub_805425C

	THUMB_FUNC_START sub_80542B8
sub_80542B8: @ 0x080542B8
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r7, r0, #0
	movs r0, #0x2c
	ldrsh r3, [r7, r0]
	movs r1, #0x30
	ldrsh r0, [r7, r1]
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0x10
	bl Interpolate
	adds r6, r0, #0
	ldr r0, _08054320  @ gPaletteBuffer
	ldr r4, _08054324  @ gUnknown_020165C8
	movs r5, #0x80
	lsls r5, r5, #1
	adds r1, r4, #0
	adds r2, r5, #0
	bl CpuFastSet
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0x20
	adds r3, r6, #0
	bl sub_80712B0
	movs r1, #0xa0
	lsls r1, r1, #0x13
	adds r0, r4, #0
	adds r2, r5, #0
	bl CpuFastSet
	bl DisablePaletteSync
	ldrh r0, [r7, #0x2c]
	adds r0, #1
	strh r0, [r7, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x30
	ldrsh r1, [r7, r2]
	cmp r0, r1
	ble _08054318
	adds r0, r7, #0
	bl Proc_Break
_08054318:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08054320: .4byte gPaletteBuffer
_08054324: .4byte gUnknown_020165C8

	THUMB_FUNC_END sub_80542B8

	THUMB_FUNC_START sub_8054328
sub_8054328: @ 0x08054328
	push {r4, lr}
	adds r4, r0, #0
	bl EnablePaletteSync
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8054328

	THUMB_FUNC_START sub_805433C
sub_805433C: @ 0x0805433C
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	ldr r0, _0805435C  @ gProc_efxBlackIN
	movs r1, #0
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r5, [r0, #0x2e]
	strh r6, [r0, #0x30]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0805435C: .4byte gProc_efxBlackIN

	THUMB_FUNC_END sub_805433C

	THUMB_FUNC_START sub_8054360
sub_8054360: @ 0x08054360
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r0, _080543B4  @ gPaletteBuffer
	ldr r4, _080543B8  @ gUnknown_020165C8
	movs r5, #0x80
	lsls r5, r5, #1
	adds r1, r4, #0
	adds r2, r5, #0
	bl CpuFastSet
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0x20
	movs r3, #0x10
	bl sub_80712B0
	movs r1, #0xa0
	lsls r1, r1, #0x13
	adds r0, r4, #0
	adds r2, r5, #0
	bl CpuFastSet
	bl DisablePaletteSync
	ldrh r0, [r6, #0x2c]
	adds r0, #1
	strh r0, [r6, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x2e
	ldrsh r1, [r6, r2]
	cmp r0, r1
	ble _080543AC
	movs r0, #0
	strh r0, [r6, #0x2c]
	adds r0, r6, #0
	bl Proc_Break
_080543AC:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080543B4: .4byte gPaletteBuffer
_080543B8: .4byte gUnknown_020165C8

	THUMB_FUNC_END sub_8054360

	THUMB_FUNC_START sub_80543BC
sub_80543BC: @ 0x080543BC
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r7, r0, #0
	movs r0, #0x2c
	ldrsh r3, [r7, r0]
	movs r1, #0x30
	ldrsh r0, [r7, r1]
	str r0, [sp]
	movs r0, #0
	movs r1, #0x10
	movs r2, #0
	bl Interpolate
	adds r6, r0, #0
	ldr r0, _08054424  @ gPaletteBuffer
	ldr r4, _08054428  @ gUnknown_020165C8
	movs r5, #0x80
	lsls r5, r5, #1
	adds r1, r4, #0
	adds r2, r5, #0
	bl CpuFastSet
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0x20
	adds r3, r6, #0
	bl sub_80712B0
	movs r1, #0xa0
	lsls r1, r1, #0x13
	adds r0, r4, #0
	adds r2, r5, #0
	bl CpuFastSet
	bl DisablePaletteSync
	ldrh r0, [r7, #0x2c]
	adds r0, #1
	strh r0, [r7, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x30
	ldrsh r1, [r7, r2]
	cmp r0, r1
	ble _0805441C
	adds r0, r7, #0
	bl Proc_Break
_0805441C:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08054424: .4byte gPaletteBuffer
_08054428: .4byte gUnknown_020165C8

	THUMB_FUNC_END sub_80543BC

	THUMB_FUNC_START sub_805442C
sub_805442C: @ 0x0805442C
	push {r4, lr}
	adds r4, r0, #0
	bl EnablePaletteSync
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_805442C

	THUMB_FUNC_START sub_8054440
sub_8054440: @ 0x08054440
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	ldr r0, _08054474  @ gProc_efxFlashHPBar
	movs r1, #4
	bl Proc_Start
	adds r1, r0, #0
	str r6, [r1, #0x5c]
	movs r0, #0
	strh r0, [r1, #0x2c]
	strh r4, [r1, #0x2e]
	strh r5, [r1, #0x30]
	cmp r4, #0
	bne _0805446E
	adds r0, r1, #0
	bl Proc_Break
_0805446E:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08054474: .4byte gProc_efxFlashHPBar

	THUMB_FUNC_END sub_8054440

	THUMB_FUNC_START sub_8054478
sub_8054478: @ 0x08054478
	push {lr}
	adds r2, r0, #0
	ldrh r0, [r2, #0x2c]
	adds r0, #1
	strh r0, [r2, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r3, #0x2e
	ldrsh r1, [r2, r3]
	cmp r0, r1
	blt _08054494
	adds r0, r2, #0
	bl Proc_Break
_08054494:
	pop {r0}
	bx r0

	THUMB_FUNC_END sub_8054478

	THUMB_FUNC_START sub_8054498
sub_8054498: @ 0x08054498
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetAISSubjectId
	cmp r0, #0
	bne _080544D4
	ldr r0, _080544B8  @ gUnknown_0203E1AC
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0x50
	bgt _080544C4
	ldr r0, _080544BC  @ gUnknown_08802B84
	ldr r1, _080544C0  @ gUnknown_02022C08
	b _080544E2
	.align 2, 0
_080544B8: .4byte gUnknown_0203E1AC
_080544BC: .4byte gUnknown_08802B84
_080544C0: .4byte gUnknown_02022C08
_080544C4:
	ldr r0, _080544CC  @ gUnknown_08802C84
	ldr r1, _080544D0  @ gUnknown_02022C08
	b _080544E2
	.align 2, 0
_080544CC: .4byte gUnknown_08802C84
_080544D0: .4byte gUnknown_02022C08
_080544D4:
	ldr r0, _080544EC  @ gUnknown_0203E1AC
	movs r2, #2
	ldrsh r0, [r0, r2]
	cmp r0, #0x50
	bgt _080544F8
	ldr r0, _080544F0  @ gUnknown_08802B84
	ldr r1, _080544F4  @ gUnknown_02022C28
_080544E2:
	movs r2, #0x10
	bl CpuSet
	b _08054502
	.align 2, 0
_080544EC: .4byte gUnknown_0203E1AC
_080544F0: .4byte gUnknown_08802B84
_080544F4: .4byte gUnknown_02022C28
_080544F8:
	ldr r0, _08054524  @ gUnknown_08802C84
	ldr r1, _08054528  @ gUnknown_02022C28
	movs r2, #0x10
	bl CpuSet
_08054502:
	bl EnablePaletteSync
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x30
	ldrsh r1, [r4, r2]
	cmp r0, r1
	blt _0805451E
	adds r0, r4, #0
	bl Proc_Break
_0805451E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08054524: .4byte gUnknown_08802C84
_08054528: .4byte gUnknown_02022C28

	THUMB_FUNC_END sub_8054498

	THUMB_FUNC_START sub_805452C
sub_805452C: @ 0x0805452C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetAISSubjectId
	cmp r0, #0
	bne _0805456C
	ldr r0, _08054554  @ gUnknown_0203E1AC
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0x50
	bgt _08054564
	ldr r0, _08054558  @ gUnknown_0203E114
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r0, r0, #5
	ldr r1, _0805455C  @ gUnknown_08802B04
	adds r0, r0, r1
	ldr r1, _08054560  @ gUnknown_02022C08
	b _08054584
	.align 2, 0
_08054554: .4byte gUnknown_0203E1AC
_08054558: .4byte gUnknown_0203E114
_0805455C: .4byte gUnknown_08802B04
_08054560: .4byte gUnknown_02022C08
_08054564:
	ldr r0, _08054568  @ gUnknown_08802C84
	b _08054582
	.align 2, 0
_08054568: .4byte gUnknown_08802C84
_0805456C:
	ldr r0, _0805458C  @ gUnknown_0203E1AC
	movs r1, #2
	ldrsh r0, [r0, r1]
	cmp r0, #0x50
	bgt _0805459C
	ldr r0, _08054590  @ gUnknown_0203E114
	movs r1, #2
	ldrsh r0, [r0, r1]
	lsls r0, r0, #5
	ldr r1, _08054594  @ gUnknown_08802B04
	adds r0, r0, r1
_08054582:
	ldr r1, _08054598  @ gUnknown_02022C28
_08054584:
	movs r2, #0x10
	bl CpuSet
	b _080545A6
	.align 2, 0
_0805458C: .4byte gUnknown_0203E1AC
_08054590: .4byte gUnknown_0203E114
_08054594: .4byte gUnknown_08802B04
_08054598: .4byte gUnknown_02022C28
_0805459C:
	ldr r0, _080545B8  @ gUnknown_08802C84
	ldr r1, _080545BC  @ gUnknown_02022C28
	movs r2, #0x10
	bl CpuSet
_080545A6:
	bl EnablePaletteSync
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080545B8: .4byte gUnknown_08802C84
_080545BC: .4byte gUnknown_02022C28

	THUMB_FUNC_END sub_805452C

	THUMB_FUNC_START sub_80545C0
sub_80545C0: @ 0x080545C0
	push {r4, r5, r6, lr}
	mov r6, sl
	mov r5, r9
	mov r4, r8
	push {r4, r5, r6}
	sub sp, #4
	adds r5, r0, #0
	ldr r4, _0805467C  @ gUnknown_0201777C
	ldr r0, _08054680  @ gProc_efxHPBarColorChange
	movs r1, #3
	bl Proc_Start
	str r0, [r4]
	str r5, [r0, #0x5c]
	movs r3, #0
	movs r2, #0
	strh r2, [r0, #0x2c]
	str r2, [r0, #0x44]
	ldr r1, _08054684  @ gUnknown_080DAC58
	str r1, [r0, #0x48]
	str r2, [r0, #0x54]
	strh r2, [r0, #0x2e]
	str r2, [r0, #0x4c]
	ldr r1, _08054688  @ gUnknown_080DAC82
	str r1, [r0, #0x50]
	str r2, [r0, #0x58]
	adds r0, #0x29
	strb r3, [r0]
	ldr r5, _0805468C  @ gUnknown_0203E114
	movs r1, #0
	ldrsh r0, [r5, r1]
	lsls r0, r0, #5
	ldr r1, _08054690  @ gUnknown_08802B04
	mov sl, r1
	add r0, sl
	ldr r6, _08054694  @ gUnknown_0201F948
	adds r1, r6, #0
	movs r2, #0x10
	bl sub_80714DC
	movs r1, #0
	ldrsh r0, [r5, r1]
	lsls r0, r0, #5
	ldr r1, _08054698  @ gUnknown_08802BC4
	mov r9, r1
	add r0, r9
	ldr r4, _0805469C  @ gUnknown_0201F978
	adds r1, r4, #0
	movs r2, #0x10
	bl sub_80714DC
	ldr r2, _080546A0  @ gUnknown_0201F9A8
	movs r0, #5
	mov r8, r0
	str r0, [sp]
	adds r0, r6, #0
	adds r1, r4, #0
	movs r3, #0x10
	bl sub_8071574
	movs r1, #2
	ldrsh r0, [r5, r1]
	lsls r0, r0, #5
	add r0, sl
	ldr r6, _080546A4  @ gUnknown_0201FA08
	adds r1, r6, #0
	movs r2, #0x10
	bl sub_80714DC
	movs r1, #2
	ldrsh r0, [r5, r1]
	lsls r0, r0, #5
	add r0, r9
	ldr r4, _080546A8  @ gUnknown_0201FA38
	adds r1, r4, #0
	movs r2, #0x10
	bl sub_80714DC
	ldr r2, _080546AC  @ gUnknown_0201FA68
	mov r0, r8
	str r0, [sp]
	adds r0, r6, #0
	adds r1, r4, #0
	movs r3, #0x10
	bl sub_8071574
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0805467C: .4byte gUnknown_0201777C
_08054680: .4byte gProc_efxHPBarColorChange
_08054684: .4byte gUnknown_080DAC58
_08054688: .4byte gUnknown_080DAC82
_0805468C: .4byte gUnknown_0203E114
_08054690: .4byte gUnknown_08802B04
_08054694: .4byte gUnknown_0201F948
_08054698: .4byte gUnknown_08802BC4
_0805469C: .4byte gUnknown_0201F978
_080546A0: .4byte gUnknown_0201F9A8
_080546A4: .4byte gUnknown_0201FA08
_080546A8: .4byte gUnknown_0201FA38
_080546AC: .4byte gUnknown_0201FA68

	THUMB_FUNC_END sub_80545C0

	THUMB_FUNC_START sub_80546B0
sub_80546B0: @ 0x080546B0
	push {lr}
	ldr r0, _080546C0  @ gUnknown_0201777C
	ldr r0, [r0]
	bl Proc_End
	pop {r0}
	bx r0
	.align 2, 0
_080546C0: .4byte gUnknown_0201777C

	THUMB_FUNC_END sub_80546B0

	THUMB_FUNC_START sub_80546C4
sub_80546C4: @ 0x080546C4
	ldr r0, _080546D0  @ gUnknown_0201777C
	ldr r0, [r0]
	adds r0, #0x29
	movs r1, #1
	strb r1, [r0]
	bx lr
	.align 2, 0
_080546D0: .4byte gUnknown_0201777C

	THUMB_FUNC_END sub_80546C4

	THUMB_FUNC_START sub_80546D4
sub_80546D4: @ 0x080546D4
	ldr r0, _080546E0  @ gUnknown_0201777C
	ldr r0, [r0]
	adds r0, #0x29
	movs r1, #0
	strb r1, [r0]
	bx lr
	.align 2, 0
_080546E0: .4byte gUnknown_0201777C

	THUMB_FUNC_END sub_80546D4

	THUMB_FUNC_START sub_80546E4
sub_80546E4: @ 0x080546E4
	push {r4, r5, lr}
	sub sp, #0xc
	adds r4, r0, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #1
	beq _080547CC
	adds r0, r4, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl sub_80558F4
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0
	blt _0805470A
	str r0, [r4, #0x54]
_0805470A:
	adds r0, r4, #0
	adds r0, #0x2e
	adds r1, r4, #0
	adds r1, #0x4c
	ldr r2, [r4, #0x50]
	bl sub_80558F4
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0
	blt _08054722
	str r0, [r4, #0x58]
_08054722:
	ldr r0, _0805474C  @ gUnknown_0203E1AC
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0x50
	bgt _08054760
	ldr r2, _08054750  @ gUnknown_0201F948
	ldr r3, _08054754  @ gUnknown_0201F978
	ldr r5, _08054758  @ gUnknown_0201F9A8
	ldr r0, _0805475C  @ gUnknown_02022C08
	movs r1, #0x10
	str r1, [sp]
	ldr r1, [r4, #0x54]
	str r1, [sp, #4]
	movs r1, #5
	str r1, [sp, #8]
	adds r1, r2, #0
	adds r2, r3, #0
	adds r3, r5, #0
	bl sub_80715F4
	b _08054770
	.align 2, 0
_0805474C: .4byte gUnknown_0203E1AC
_08054750: .4byte gUnknown_0201F948
_08054754: .4byte gUnknown_0201F978
_08054758: .4byte gUnknown_0201F9A8
_0805475C: .4byte gUnknown_02022C08
_08054760:
	ldr r0, [r4, #0x58]
	lsls r0, r0, #5
	ldr r1, _0805479C  @ gUnknown_08802C84
	adds r0, r0, r1
	ldr r1, _080547A0  @ gUnknown_02022C08
	movs r2, #8
	bl CpuFastSet
_08054770:
	ldr r0, _080547A4  @ gUnknown_0203E1AC
	movs r1, #2
	ldrsh r0, [r0, r1]
	cmp r0, #0x50
	bgt _080547B8
	ldr r2, _080547A8  @ gUnknown_0201FA08
	ldr r3, _080547AC  @ gUnknown_0201FA38
	ldr r5, _080547B0  @ gUnknown_0201FA68
	ldr r0, _080547B4  @ gUnknown_02022C28
	movs r1, #0x10
	str r1, [sp]
	ldr r1, [r4, #0x54]
	str r1, [sp, #4]
	movs r1, #5
	str r1, [sp, #8]
	adds r1, r2, #0
	adds r2, r3, #0
	adds r3, r5, #0
	bl sub_80715F4
	b _080547C8
	.align 2, 0
_0805479C: .4byte gUnknown_08802C84
_080547A0: .4byte gUnknown_02022C08
_080547A4: .4byte gUnknown_0203E1AC
_080547A8: .4byte gUnknown_0201FA08
_080547AC: .4byte gUnknown_0201FA38
_080547B0: .4byte gUnknown_0201FA68
_080547B4: .4byte gUnknown_02022C28
_080547B8:
	ldr r0, [r4, #0x58]
	lsls r0, r0, #5
	ldr r1, _080547D4  @ gUnknown_08802C84
	adds r0, r0, r1
	ldr r1, _080547D8  @ gUnknown_02022C28
	movs r2, #8
	bl CpuFastSet
_080547C8:
	bl EnablePaletteSync
_080547CC:
	add sp, #0xc
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080547D4: .4byte gUnknown_08802C84
_080547D8: .4byte gUnknown_02022C28

	THUMB_FUNC_END sub_80546E4

	THUMB_FUNC_START sub_80547DC
sub_80547DC: @ 0x080547DC
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r6, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	mov r8, r3
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	ldr r0, _08054814  @ gProc_efxFlashUnit
	movs r1, #4
	bl Proc_Start
	str r6, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r4, [r0, #0x2e]
	strh r5, [r0, #0x30]
	adds r0, #0x29
	mov r1, r8
	strb r1, [r0]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08054814: .4byte gProc_efxFlashUnit

	THUMB_FUNC_END sub_80547DC

	THUMB_FUNC_START sub_8054818
sub_8054818: @ 0x08054818
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x2e
	ldrsh r1, [r4, r2]
	cmp r0, r1
	blt _0805487A
	ldr r0, [r4, #0x5c]
	bl GetAISSubjectId
	cmp r0, #0
	bne _08054854
	ldr r0, _0805484C  @ gUnknown_08802D24
	ldr r1, _08054850  @ gUnknown_02022B88
	movs r2, #8
	bl CpuFastSet
	ldr r0, [r4, #0x5c]
	bl sub_807027C
	b _08054864
	.align 2, 0
_0805484C: .4byte gUnknown_08802D24
_08054850: .4byte gUnknown_02022B88
_08054854:
	ldr r0, _08054880  @ gUnknown_08802D24
	ldr r1, _08054884  @ gUnknown_02022BC8
	movs r2, #8
	bl CpuFastSet
	ldr r0, [r4, #0x5c]
	bl sub_807027C
_08054864:
	bl EnablePaletteSync
	movs r0, #0x2c
	ldrsh r1, [r4, r0]
	movs r2, #0x30
	ldrsh r0, [r4, r2]
	cmp r1, r0
	blt _0805487A
	adds r0, r4, #0
	bl Proc_Break
_0805487A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08054880: .4byte gUnknown_08802D24
_08054884: .4byte gUnknown_02022BC8

	THUMB_FUNC_END sub_8054818

	THUMB_FUNC_START sub_8054888
sub_8054888: @ 0x08054888
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetAISSubjectId
	cmp r0, #0
	bne _080548B4
	ldr r0, _080548AC  @ gUnknown_02000054
	ldr r0, [r0]
	ldr r1, _080548B0  @ gUnknown_02022B88
	movs r2, #8
	bl CpuFastSet
	ldr r0, [r4, #0x5c]
	bl sub_807035C
	b _080548C6
	.align 2, 0
_080548AC: .4byte gUnknown_02000054
_080548B0: .4byte gUnknown_02022B88
_080548B4:
	ldr r0, _080548D8  @ gUnknown_02000054
	ldr r0, [r0, #4]
	ldr r1, _080548DC  @ gUnknown_02022BC8
	movs r2, #8
	bl CpuFastSet
	ldr r0, [r4, #0x5c]
	bl sub_807035C
_080548C6:
	bl EnablePaletteSync
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080548D8: .4byte gUnknown_02000054
_080548DC: .4byte gUnknown_02022BC8

	THUMB_FUNC_END sub_8054888

	THUMB_FUNC_START sub_80548E0
sub_80548E0: @ 0x080548E0
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r6, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	mov r8, r3
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	ldr r0, _0805492C  @ gProc_efxFlashUnitEffect
	movs r1, #4
	bl Proc_Start
	str r6, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r4, [r0, #0x2e]
	strh r5, [r0, #0x30]
	adds r0, #0x29
	mov r1, r8
	strb r1, [r0]
	ldrh r0, [r6, #0x10]
	movs r1, #0x20
	orrs r0, r1
	strh r0, [r6, #0x10]
	ldrh r1, [r6]
	movs r0, #8
	orrs r0, r1
	strh r0, [r6]
	movs r0, #2
	strh r0, [r6, #6]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0805492C: .4byte gProc_efxFlashUnitEffect

	THUMB_FUNC_END sub_80548E0

	THUMB_FUNC_START sub_8054930
sub_8054930: @ 0x08054930
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x2e
	ldrsh r1, [r4, r2]
	cmp r0, r1
	blt _080549A8
	ldr r0, [r4, #0x5c]
	bl GetAISSubjectId
	cmp r0, #0
	bne _0805496C
	ldr r0, _08054964  @ gUnknown_08802D24
	ldr r1, _08054968  @ gUnknown_02022B88
	movs r2, #8
	bl CpuFastSet
	ldr r0, [r4, #0x5c]
	bl sub_807027C
	b _0805497C
	.align 2, 0
_08054964: .4byte gUnknown_08802D24
_08054968: .4byte gUnknown_02022B88
_0805496C:
	ldr r0, _080549B0  @ gUnknown_08802D24
	ldr r1, _080549B4  @ gUnknown_02022BC8
	movs r2, #8
	bl CpuFastSet
	ldr r0, [r4, #0x5c]
	bl sub_807027C
_0805497C:
	bl EnablePaletteSync
	movs r0, #0x2c
	ldrsh r1, [r4, r0]
	movs r2, #0x30
	ldrsh r0, [r4, r2]
	cmp r1, r0
	blt _080549A8
	ldr r1, [r4, #0x5c]
	ldrh r2, [r1, #0x10]
	movs r0, #0x40
	movs r3, #0
	orrs r0, r2
	strh r0, [r1, #0x10]
	ldrh r2, [r1]
	ldr r0, _080549B8  @ 0x0000FFF7
	ands r0, r2
	strh r0, [r1]
	strh r3, [r1, #6]
	adds r0, r4, #0
	bl Proc_Break
_080549A8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080549B0: .4byte gUnknown_08802D24
_080549B4: .4byte gUnknown_02022BC8
_080549B8: .4byte 0x0000FFF7

	THUMB_FUNC_END sub_8054930

	THUMB_FUNC_START sub_80549BC
sub_80549BC: @ 0x080549BC
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetAISSubjectId
	cmp r0, #0
	bne _080549E8
	ldr r0, _080549E0  @ gUnknown_02000054
	ldr r0, [r0]
	ldr r1, _080549E4  @ gUnknown_02022B88
	movs r2, #8
	bl CpuFastSet
	ldr r0, [r4, #0x5c]
	bl sub_807035C
	b _080549FA
	.align 2, 0
_080549E0: .4byte gUnknown_02000054
_080549E4: .4byte gUnknown_02022B88
_080549E8:
	ldr r0, _08054A14  @ gUnknown_02000054
	ldr r0, [r0, #4]
	ldr r1, _08054A18  @ gUnknown_02022BC8
	movs r2, #8
	bl CpuFastSet
	ldr r0, [r4, #0x5c]
	bl sub_807035C
_080549FA:
	bl EnablePaletteSync
	adds r0, r4, #0
	bl Proc_Break
	ldr r2, [r4, #0x5c]
	ldrh r1, [r2, #0x10]
	movs r0, #0x40
	orrs r0, r1
	strh r0, [r2, #0x10]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08054A14: .4byte gUnknown_02000054
_08054A18: .4byte gUnknown_02022BC8

	THUMB_FUNC_END sub_80549BC

.align 2, 0
