	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r7, r0, #0
	ldr r0, [r7, #0x38]
	subs r0, #1
	str r0, [r7, #0x38]
	cmp r0, #0
	ble _080CC044
	movs r6, #0
	ldr r0, _080CC038  @ gPaletteBuffer
	mov r9, r0
	movs r3, #0x1f
	mov r8, r3
	ldr r4, _080CC03C  @ __ewram_start
	mov ip, r4
_080CBFE4:
	lsls r2, r6, #1
	mov r0, ip
	ldrh r3, [r0]
	movs r0, #0x1f
	ands r0, r3
	ldr r1, [r7, #0x38]
	muls r0, r1, r0
	cmp r0, #0
	bge _080CBFF8
	adds r0, #3
_080CBFF8:
	asrs r5, r0, #2
	lsls r3, r3, #0x10
	lsrs r0, r3, #0x15
	mov r4, r8
	ands r0, r4
	muls r0, r1, r0
	cmp r0, #0
	bge _080CC00A
	adds r0, #3
_080CC00A:
	asrs r4, r0, #2
	lsrs r0, r3, #0x1a
	mov r3, r8
	ands r0, r3
	muls r0, r1, r0
	cmp r0, #0
	bge _080CC01A
	adds r0, #3
_080CC01A:
	asrs r1, r0, #2
	add r2, r9
	lsls r0, r4, #5
	orrs r0, r5
	lsls r1, r1, #0xa
	orrs r0, r1
	strh r0, [r2]
	movs r4, #2
	add ip, r4
	adds r6, #1
	ldr r0, _080CC040  @ 0x000001FF
	cmp r6, r0
	ble _080CBFE4
	b _080CC058
	.align 2, 0
_080CC038: .4byte gPaletteBuffer
_080CC03C: .4byte __ewram_start
_080CC040: .4byte 0x000001FF
_080CC044:
	movs r0, #0
	str r0, [sp]
	ldr r1, _080CC06C  @ gPaletteBuffer
	ldr r2, _080CC070  @ 0x01000100
	mov r0, sp
	bl CpuFastSet
	adds r0, r7, #0
	bl Proc_Break
_080CC058:
	bl EnablePaletteSync
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080CC06C: .4byte gPaletteBuffer
_080CC070: .4byte 0x01000100