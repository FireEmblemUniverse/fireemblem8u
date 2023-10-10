asm("\
	.syntax unified\n\
	push {r4, r5, r6, r7, lr}\n\
	mov r7, r9\n\
	mov r6, r8\n\
	push {r6, r7}\n\
	sub sp, #4\n\
	adds r7, r0, #0\n\
	ldr r0, [r7, #0x38]\n\
	subs r0, #1\n\
	str r0, [r7, #0x38]\n\
	cmp r0, #0\n\
	ble _080CC044\n\
	movs r6, #0\n\
	ldr r0, _080CC038  @ gPaletteBuffer\n\
	mov r9, r0\n\
	movs r3, #0x1f\n\
	mov r8, r3\n\
	ldr r4, _080CC03C  @ __ewram_start\n\
	mov ip, r4\n\
_080CBFE4:\n\
	lsls r2, r6, #1\n\
	mov r0, ip\n\
	ldrh r3, [r0]\n\
	movs r0, #0x1f\n\
	ands r0, r3\n\
	ldr r1, [r7, #0x38]\n\
	muls r0, r1, r0\n\
	cmp r0, #0\n\
	bge _080CBFF8\n\
	adds r0, #3\n\
_080CBFF8:\n\
	asrs r5, r0, #2\n\
	lsls r3, r3, #0x10\n\
	lsrs r0, r3, #0x15\n\
	mov r4, r8\n\
	ands r0, r4\n\
	muls r0, r1, r0\n\
	cmp r0, #0\n\
	bge _080CC00A\n\
	adds r0, #3\n\
_080CC00A:\n\
	asrs r4, r0, #2\n\
	lsrs r0, r3, #0x1a\n\
	mov r3, r8\n\
	ands r0, r3\n\
	muls r0, r1, r0\n\
	cmp r0, #0\n\
	bge _080CC01A\n\
	adds r0, #3\n\
_080CC01A:\n\
	asrs r1, r0, #2\n\
	add r2, r9\n\
	lsls r0, r4, #5\n\
	orrs r0, r5\n\
	lsls r1, r1, #0xa\n\
	orrs r0, r1\n\
	strh r0, [r2]\n\
	movs r4, #2\n\
	add ip, r4\n\
	adds r6, #1\n\
	ldr r0, _080CC040  @ 0x000001FF\n\
	cmp r6, r0\n\
	ble _080CBFE4\n\
	b _080CC058\n\
	.align 2, 0\n\
_080CC038: .4byte gPaletteBuffer\n\
_080CC03C: .4byte __ewram_start\n\
_080CC040: .4byte 0x000001FF\n\
_080CC044:\n\
	movs r0, #0\n\
	str r0, [sp]\n\
	ldr r1, _080CC06C  @ gPaletteBuffer\n\
	ldr r2, _080CC070  @ 0x01000100\n\
	mov r0, sp\n\
	bl CpuFastSet\n\
	adds r0, r7, #0\n\
	bl Proc_Break\n\
_080CC058:\n\
	bl EnablePaletteSync\n\
	add sp, #4\n\
	pop {r3, r4}\n\
	mov r8, r3\n\
	mov r9, r4\n\
	pop {r4, r5, r6, r7}\n\
	pop {r0}\n\
	bx r0\n\
	.align 2, 0\n\
_080CC06C: .4byte gPaletteBuffer\n\
_080CC070: .4byte 0x01000100\n\
	.syntax divided\n\
");
