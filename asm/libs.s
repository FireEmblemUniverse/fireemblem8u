    .INCLUDE "macro.inc"

    .SYNTAX unified

	THUMB_FUNC_START umul3232H32
umul3232H32: @ 0x080CF4B8
	add r2, pc, #0x0
	bx r2
    .ARM
__umul3232H32: @ 0x080CF4BC
	umull r2, r3, r0, r1
	add r0, r3, #0
	bx lr

	THUMB_FUNC_START sub_80CF4C8
sub_80CF4C8: @ 0x080CF4C8
	ldr r0, _080CF534 @ 0x03007FF0
	ldr r0, [r0]
	ldr r2, _080CF538 @ 0x68736D53
	ldr r3, [r0]
	cmp r2, r3
	beq _080CF4D6
	bx lr
_080CF4D6:
	adds r3, #1
	str r3, [r0]
	push {r4, r5, r6, r7, lr}
	mov r1, r8
	mov r2, sb
	mov r3, sl
	mov r4, fp
	push {r0, r1, r2, r3, r4}
	sub sp, #0x18
	ldrb r1, [r0, #0xc]
	cmp r1, #0
	beq _080CF4FA
	ldr r2, _080CF540 @ 0x04000006
	ldrb r2, [r2]
	cmp r2, #0xa0
	bhs _080CF4F8
	adds r2, #0xe4
_080CF4F8:
	adds r1, r1, r2
_080CF4FA:
	str r1, [sp, #0x14]
	ldr r3, [r0, #0x20]
	cmp r3, #0
	beq _080CF50A
	ldr r0, [r0, #0x24]
	bl sub_080CF8EA
	ldr r0, [sp, #0x18]
_080CF50A:
	ldr r3, [r0, #0x28]
	bl sub_080CF8EA
	ldr r0, [sp, #0x18]
	ldr r3, [r0, #0x10]
	mov r8, r3
	ldr r5, _080CF544 @ 0x00000350
	adds r5, r5, r0
	ldrb r4, [r0, #4]
	subs r7, r4, #1
	bls _080CF52A
	ldrb r1, [r0, #0xb]
	subs r1, r1, r7
	mov r2, r8
	muls r2, r1, r2
	adds r5, r5, r2
_080CF52A:
	str r5, [sp, #8]
	ldr r6, _080CF548 @ 0x00000630
	ldr r3, _080CF53C @ 0x03002C61
	bx r3
	.align 2, 0
_080CF534: .4byte 0x03007FF0
_080CF538: .4byte 0x68736D53
_080CF53C: .4byte 0x03002C61
_080CF540: .4byte 0x04000006
_080CF544: .4byte 0x00000350
_080CF548: .4byte 0x00000630

	THUMB_FUNC_START sub_80CF54C
sub_80CF54C: @ 0x080CF54C
	ldrb r3, [r0, #5]
	cmp r3, #0
	beq SoundMainRAM_NoReverb
	add r1, pc, #0x4
	bx r1
	.ARM
SoundMainRAM_Reverb:
	cmp r4, #2
	addeq r7, r0, #0x350
	addne r7, r5, r8
	mov r4, r8
_080CF568:
	ldrsb r0, [r5, r6]
	ldrsb r1, [r5]
	add r0, r0, r1
	ldrsb r1, [r7, r6]
	add r0, r0, r1
	ldrsb r1, [r7], #1
	add r0, r0, r1
	mul r1, r0, r3
	asr r0, r1, #9
	tst r0, #0x80
	addne r0, r0, #1
	strb r0, [r5, r6]
	strb r0, [r5], #1
	subs r4, r4, #1
	bgt _080CF568
	add r0, pc, #0x2f
	bx r0
    .THUMB
SoundMainRAM_NoReverb:
	movs r0, #0
	mov r1, r8
	adds r6, r6, r5
	lsrs r1, r1, #3
	blo _080CF5BA
	stm r5!, {r0}
	stm r6!, {r0}
_080CF5BA:
	lsrs r1, r1, #1
	blo _080CF5C6
	stm r5!, {r0}
	stm r6!, {r0}
	stm r5!, {r0}
	stm r6!, {r0}
_080CF5C6:
	stm r5!, {r0}
	stm r6!, {r0}
	stm r5!, {r0}
	stm r6!, {r0}
	stm r5!, {r0}
	stm r6!, {r0}
	stm r5!, {r0}
	stm r6!, {r0}
	subs r1, #1
	bgt _080CF5C6
	ldr r4, [sp, #0x18]
	ldr r0, [r4, #0x18]
	mov ip, r0
	ldrb r0, [r4, #6]
	adds r4, #0x50
_080CF5E4:
	str r0, [sp, #4]
	ldr r3, [r4, #0x24]
	ldr r0, [sp, #0x14]
	cmp r0, #0
	beq _080CF604
	ldr r1, _080CF600 @ 0x04000006
	ldrb r1, [r1]
	cmp r1, #0xa0
	bhs _080CF5F8
	adds r1, #0xe4
_080CF5F8:
	cmp r1, r0
	blo _080CF604
	b _080CF8D6
	.align 2, 0
_080CF600: .4byte 0x04000006
_080CF604:
	ldrb r6, [r4]
	movs r0, #0xc7
	tst r0, r6
	bne _080CF60E
	b _080CF8CC
_080CF60E:
	movs r0, #0x80
	tst r0, r6
	beq _080CF63E
	movs r0, #0x40
	tst r0, r6
	bne _080CF64E
	movs r6, #3
	strb r6, [r4]
	adds r0, r3, #0
	adds r0, #0x10
	str r0, [r4, #0x28]
	ldr r0, [r3, #0xc]
	str r0, [r4, #0x18]
	movs r5, #0
	strb r5, [r4, #9]
	str r5, [r4, #0x1c]
	ldrb r2, [r3, #3]
	movs r0, #0xc0
	tst r0, r2
	beq _080CF696
	movs r0, #0x10
	orrs r6, r0
	strb r6, [r4]
	b _080CF696
_080CF63E:
	ldrb r5, [r4, #9]
	movs r0, #4
	tst r0, r6
	beq _080CF654
	ldrb r0, [r4, #0xd]
	subs r0, #1
	strb r0, [r4, #0xd]
	bhi _080CF6A4
_080CF64E:
	movs r0, #0
	strb r0, [r4]
	b _080CF8CC
_080CF654:
	movs r0, #0x40
	tst r0, r6
	beq _080CF674
	ldrb r0, [r4, #7]
	muls r5, r0, r5
	lsrs r5, r5, #8
	ldrb r0, [r4, #0xc]
	cmp r5, r0
	bhi _080CF6A4
_080CF666:
	ldrb r5, [r4, #0xc]
	cmp r5, #0
	beq _080CF64E
	movs r0, #4
	orrs r6, r0
	strb r6, [r4]
	b _080CF6A4
_080CF674:
	movs r2, #3
	ands r2, r6
	cmp r2, #2
	bne _080CF692
	ldrb r0, [r4, #5]
	muls r5, r0, r5
	lsrs r5, r5, #8
	ldrb r0, [r4, #6]
	cmp r5, r0
	bhi _080CF6A4
	adds r5, r0, #0
	beq _080CF666
	subs r6, #1
	strb r6, [r4]
	b _080CF6A4
_080CF692:
	cmp r2, #3
	bne _080CF6A4
_080CF696:
	ldrb r0, [r4, #4]
	adds r5, r5, r0
	cmp r5, #0xff
	blo _080CF6A4
	movs r5, #0xff
	subs r6, #1
	strb r6, [r4]
_080CF6A4:
	strb r5, [r4, #9]
	ldr r0, [sp, #0x18]
	ldrb r0, [r0, #7]
	adds r0, #1
	muls r0, r5, r0
	lsrs r5, r0, #4
	ldrb r0, [r4, #2]
	muls r0, r5, r0
	lsrs r0, r0, #8
	strb r0, [r4, #0xa]
	ldrb r0, [r4, #3]
	muls r0, r5, r0
	lsrs r0, r0, #8
	strb r0, [r4, #0xb]
	movs r0, #0x10
	ands r0, r6
	str r0, [sp, #0x10]
	beq _080CF6D8
	adds r0, r3, #0
	adds r0, #0x10
	ldr r1, [r3, #8]
	adds r0, r0, r1
	str r0, [sp, #0xc]
	ldr r0, [r3, #0xc]
	subs r0, r0, r1
	str r0, [sp, #0x10]
_080CF6D8:
	ldr r5, [sp, #8]
	ldr r2, [r4, #0x18]
	ldr r3, [r4, #0x28]
	add r0, pc, #0x4
	bx r0

	ARM_FUNC_START sub_080CF6E4
sub_080CF6E4: @ 0x080CF6E4
	str r8, [sp]
	ldrb sl, [r4, #0xa]
	ldrb fp, [r4, #0xb]
	lsl sl, sl, #0x10
	lsl fp, fp, #0x10
	ldrb r0, [r4, #1]
	tst r0, #8
	beq _080CF824
_080CF704:
	cmp r2, #4
	ble _080CF774
	subs r2, r2, r8
	movgt lr, #0
	bgt _080CF730
	mov lr, r8
	add r2, r2, r8
	sub r8, r2, #4
	sub lr, lr, r8
	ands r2, r2, #3
	moveq r2, #4
_080CF730:
	ldr r6, [r5]
	ldr r7, [r5, #0x630]
_080CF738:
	ldrsb r0, [r3], #1
	mul r1, sl, r0
	bic r1, r1, #0xff0000
	add r6, r1, r6, ror #8
	mul r1, fp, r0
	bic r1, r1, #0xff0000
	add r7, r1, r7, ror #8
	adds r5, r5, #0x40000000
	blo _080CF738
	str r7, [r5, #0x630]
	str r6, [r5], #4
	subs r8, r8, #4
	bgt _080CF730
	adds r8, r8, lr
	beq _080CF8B8
_080CF774:
	ldr r6, [r5]
	ldr r7, [r5, #0x630]
_080CF77C:
	ldrsb r0, [r3], #1
	mul r1, sl, r0
	bic r1, r1, #0xff0000
	add r6, r1, r6, ror #8
	mul r1, fp, r0
	bic r1, r1, #0xff0000
	add r7, r1, r7, ror #8
	subs r2, r2, #1
	beq _080CF7EC
_080CF7A0:
	adds r5, r5, #0x40000000
	blo _080CF77C
	str r7, [r5, #0x630]
	str r6, [r5], #4
	subs r8, r8, #4
	bgt _080CF704
	b _080CF8B8
_080CF7BC:
	ldr r0, [sp, #0x18]
	cmp r0, #0
	beq _080CF7E0
	ldr r3, [sp, #0x14]
	rsb sb, r2, #0
_080CF7D0:
	adds r2, r0, r2
	bgt _080CF888
	sub sb, sb, r0
	b _080CF7D0
_080CF7E0:
	pop {r4, ip}
	mov r2, #0
	b _080CF7FC
_080CF7EC:
	ldr r2, [sp, #0x10]
	cmp r2, #0
	ldrne r3, [sp, #0xc]
	bne _080CF7A0
_080CF7FC:
	strb r2, [r4]
	lsr r0, r5, #0x1e
	bic r5, r5, #0xc0000000
	rsb r0, r0, #3
	lsl r0, r0, #3
	ror r6, r6, r0
	ror r7, r7, r0
	str r7, [r5, #0x630]
	str r6, [r5], #4
	b _080CF8C0
_080CF824:
	push {r4, ip}
	ldr lr, [r4, #0x1c]
	ldr r1, [r4, #0x20]
	mul r4, ip, r1
	ldrsb r0, [r3]
	ldrsb r1, [r3, #1]!
	sub r1, r1, r0
_080CF840:
	ldr r6, [r5]
	ldr r7, [r5, #0x630]
_080CF848:
	mul sb, lr, r1
	add sb, r0, sb, asr #23
	mul ip, sl, sb
	bic ip, ip, #0xff0000
	add r6, ip, r6, ror #8
	mul ip, fp, sb
	bic ip, ip, #0xff0000
	add r7, ip, r7, ror #8
	add lr, lr, r4
	lsrs sb, lr, #0x17
	beq _080CF894
	bic lr, lr, #0x3f800000
	subs r2, r2, sb
	ble _080CF7BC
	subs sb, sb, #1
	addeq r0, r0, r1
_080CF888:
	ldrsbne r0, [r3, sb]!
	ldrsb r1, [r3, #1]!
	sub r1, r1, r0
_080CF894:
	adds r5, r5, #0x40000000
	blo _080CF848
	str r7, [r5, #0x630]
	str r6, [r5], #4
	subs r8, r8, #4
	bgt _080CF840
	sub r3, r3, #1
	pop {r4, ip}
_080CF8B4:
	str lr, [r4, #0x1c]
_080CF8B8:
	str r2, [r4, #0x18]
	str r3, [r4, #0x28]
_080CF8C0:
	ldr r8, [sp]
	add r0, pc, #1
	bx r0
    .THUMB
_080CF8CC:
	ldr r0, [sp, #4]
	subs r0, #1
	ble _080CF8D6
	adds r4, #0x40
	b _080CF5E4
_080CF8D6:
	ldr r0, [sp, #0x18]
	ldr r3, _080CF8EC @ 0x68736D53
	str r3, [r0]
	add sp, #0x1c
	pop {r0, r1, r2, r3, r4, r5, r6, r7}
	mov r8, r0
	mov sb, r1
	mov sl, r2
	mov fp, r3
	pop {r3}
sub_080CF8EA: @ 0x080CF8EA
	bx r3
	.align 2, 0
_080CF8EC: .4byte 0x68736D53
	.byte 0xA4, 0x46, 0x00, 0x21, 0x00, 0x22, 0x00, 0x23, 0x00, 0x24, 0x1E, 0xC0, 0x1E, 0xC0, 0x1E, 0xC0
	.byte 0x1E, 0xC0, 0x64, 0x46, 0x70, 0x47, 0x00, 0x00

	THUMB_FUNC_START sub_80CF908
sub_80CF908: @ 0x080CF908
	ldr r3, [r0, #0x2c]
	cmp r3, #0
	beq _080CF926
	ldr r1, [r0, #0x34]
	ldr r2, [r0, #0x30]
	cmp r2, #0
	beq _080CF91A
	str r1, [r2, #0x34]
	b _080CF91C
_080CF91A:
	str r1, [r3, #0x20]
_080CF91C:
	cmp r1, #0
	beq _080CF922
	str r2, [r1, #0x30]
_080CF922:
	movs r1, #0
	str r1, [r0, #0x2c]
_080CF926:
	bx lr

    THUMB_FUNC_START sub_80CF928
sub_80CF928:
	push {r4, r5, lr}
	adds r5, r1, #0
	ldr r4, [r5, #0x20]
	cmp r4, #0
	beq _080CF94C
_080CF932:
	ldrb r1, [r4]
	movs r0, #0xc7
	tst r0, r1
	beq _080CF940
	movs r0, #0x40
	orrs r1, r0
	strb r1, [r4]
_080CF940:
	adds r0, r4, #0
	bl sub_80CF908
	ldr r4, [r4, #0x34]
	cmp r4, #0
	bne _080CF932
_080CF94C:
	movs r0, #0
	strb r0, [r5]
	pop {r4, r5}
	pop {r0}
	bx r0
	.byte 0x00, 0x00

	THUMB_FUNC_START sub_80CF958
sub_80CF958: @ 0x080CF958
	mov ip, lr
	movs r1, #0x24
	ldr r2, _080CF988 @ 0x08207190
_080CF95E:
	ldr r3, [r2]
	bl sub_80CF972
	stm r0!, {r3}
	adds r2, #4
	subs r1, #1
	bgt _080CF95E
	bx ip
	.byte 0x00, 0x00

	THUMB_FUNC_START sub_80CF970
sub_80CF970: @ 0x080CF970
	ldrb r3, [r2]
sub_80CF972:
	push {r0}
	lsrs r0, r2, #0x19
	bne _080CF984
	ldr r0, _080CF988 @ 0x08207190
	cmp r2, r0
	blo _080CF982
	lsrs r0, r2, #0xe
	beq _080CF984
_080CF982:
	movs r3, #0
_080CF984:
	pop {r0}
	bx lr
	.align 2, 0
_080CF988: .4byte 0x08207190

	THUMB_FUNC_START sub_80CF98C
sub_80CF98C: @ 0x080CF98C
	ldr r2, [r1, #0x40]
sub_080CF98E: @ 0x080CF98E
	adds r3, r2, #1
	str r3, [r1, #0x40]
	ldrb r3, [r2]
	b sub_80CF972
	.byte 0x00, 0x00
sub_80CF998:
	push {lr}
_080CF99A:
	ldr r2, [r1, #0x40]
	ldrb r0, [r2, #3]
	lsls r0, r0, #8
	ldrb r3, [r2, #2]
	orrs r0, r3
	lsls r0, r0, #8
	ldrb r3, [r2, #1]
	orrs r0, r3
	lsls r0, r0, #8
	bl sub_80CF970
	orrs r0, r3
	str r0, [r1, #0x40]
	pop {r0}
	bx r0

	THUMB_FUNC_START sub_80CF9B8
sub_80CF9B8: @ 0x080CF9B8
	ldrb r2, [r1, #2]
	cmp r2, #3
	bhs _080CF9D0
	lsls r2, r2, #2
	adds r3, r1, r2
	ldr r2, [r1, #0x40]
	adds r2, #4
	str r2, [r3, #0x44]
	ldrb r2, [r1, #2]
	adds r2, #1
	strb r2, [r1, #2]
	b sub_80CF998
_080CF9D0:
	b sub_80CF928
	.byte 0x00, 0x00

	THUMB_FUNC_START sub_80CF9D4
sub_80CF9D4: @ 0x080CF9D4
	ldrb r2, [r1, #2]
	cmp r2, #0
	beq _080CF9E6
	subs r2, #1
	strb r2, [r1, #2]
	lsls r2, r2, #2
	adds r3, r1, r2
	ldr r2, [r3, #0x44]
	str r2, [r1, #0x40]
_080CF9E6:
	bx lr

	THUMB_FUNC_START sub_80CF9E8
sub_80CF9E8: @ 0x080CF9E8
	push {lr}
	ldr r2, [r1, #0x40]
	ldrb r3, [r2]
	cmp r3, #0
	bne _080CF9F8
	adds r2, #1
	str r2, [r1, #0x40]
	b _080CF99A
_080CF9F8:
	ldrb r3, [r1, #3]
	adds r3, #1
	strb r3, [r1, #3]
	mov ip, r3
	bl sub_80CF98C
	cmp ip, r3
	bhs _080CFA0A
	b _080CF99A
_080CFA0A:
	movs r3, #0
	strb r3, [r1, #3]
	adds r2, #5
	str r2, [r1, #0x40]
	pop {r0}
	bx r0
	.byte 0x00, 0x00

	THUMB_FUNC_START sub_80CFA18
sub_80CFA18: @ 0x080CFA18
	mov ip, lr
	bl sub_80CF98C
	strb r3, [r1, #0x1d]
	bx ip
	.byte 0x00, 0x00

	THUMB_FUNC_START sub_80CFA24
sub_80CFA24: @ 0x080CFA24
	mov ip, lr
	bl sub_80CF98C
	lsls r3, r3, #1
	strh r3, [r0, #0x1c]
	ldrh r2, [r0, #0x1e]
	muls r3, r2, r3
	lsrs r3, r3, #8
	strh r3, [r0, #0x20]
	bx ip

	THUMB_FUNC_START sub_80CFA38
sub_80CFA38: @ 0x080CFA38
	mov ip, lr
	bl sub_80CF98C
	strb r3, [r1, #0xa]
	ldrb r3, [r1]
	movs r2, #0xc
	orrs r3, r2
	strb r3, [r1]
	bx ip
	.byte 0x00, 0x00

	THUMB_FUNC_START sub_80CFA4C
sub_80CFA4C: @ 0x080CFA4C
	mov ip, lr
	ldr r2, [r1, #0x40]
	ldrb r3, [r2]
	adds r2, #1
	str r2, [r1, #0x40]
	lsls r2, r3, #1
	adds r2, r2, r3
	lsls r2, r2, #2
	ldr r3, [r0, #0x30]
	adds r2, r2, r3
	ldr r3, [r2]
	bl sub_80CF972
	str r3, [r1, #0x24]
	ldr r3, [r2, #4]
	bl sub_80CF972
	str r3, [r1, #0x28]
	ldr r3, [r2, #8]
	bl sub_80CF972
	str r3, [r1, #0x2c]
	bx ip
	.byte 0x00, 0x00

	THUMB_FUNC_START sub_80CFA7C
sub_80CFA7C: @ 0x080CFA7C
	mov ip, lr
	bl sub_80CF98C
	strb r3, [r1, #0x12]
	ldrb r3, [r1]
	movs r2, #3
	orrs r3, r2
	strb r3, [r1]
	bx ip
	.byte 0x00, 0x00

	THUMB_FUNC_START sub_80CFA90
sub_80CFA90: @ 0x080CFA90
	mov ip, lr
	bl sub_80CF98C
	subs r3, #0x40
	strb r3, [r1, #0x14]
	ldrb r3, [r1]
	movs r2, #3
	orrs r3, r2
	strb r3, [r1]
	bx ip

	THUMB_FUNC_START sub_80CFAA4
sub_80CFAA4: @ 0x080CFAA4
	mov ip, lr
	bl sub_80CF98C
	subs r3, #0x40
	strb r3, [r1, #0xe]
	ldrb r3, [r1]
	movs r2, #0xc
	orrs r3, r2
	strb r3, [r1]
	bx ip

	THUMB_FUNC_START sub_80CFAB8
sub_80CFAB8: @ 0x080CFAB8
	mov ip, lr
	bl sub_80CF98C
	strb r3, [r1, #0xf]
	ldrb r3, [r1]
	movs r2, #0xc
	orrs r3, r2
	strb r3, [r1]
	bx ip
	.byte 0x00, 0x00

	THUMB_FUNC_START sub_80CFACC
sub_80CFACC: @ 0x080CFACC
	mov ip, lr
	bl sub_80CF98C
	strb r3, [r1, #0x1b]
	bx ip
	.byte 0x00, 0x00

	THUMB_FUNC_START sub_80CFAD8
sub_80CFAD8: @ 0x080CFAD8
	mov ip, lr
	bl sub_80CF98C
	ldrb r0, [r1, #0x18]
	cmp r0, r3
	beq _080CFAEE
	strb r3, [r1, #0x18]
	ldrb r3, [r1]
	movs r2, #0xf
	orrs r3, r2
	strb r3, [r1]
_080CFAEE:
	bx ip

	THUMB_FUNC_START sub_80CFAF0
sub_80CFAF0: @ 0x080CFAF0
	mov ip, lr
	bl sub_80CF98C
	subs r3, #0x40
	strb r3, [r1, #0xc]
	ldrb r3, [r1]
	movs r2, #0xc
	orrs r3, r2
	strb r3, [r1]
	bx ip

	THUMB_FUNC_START sub_80CFB04
sub_80CFB04: @ 0x080CFB04
	mov ip, lr
	ldr r2, [r1, #0x40]
	ldrb r3, [r2]
	adds r2, #1
	ldr r0, _080CFB18 @ 0x04000060
	adds r0, r0, r3
	bl sub_080CF98E
	strb r3, [r0]
	bx ip
	.align 2, 0
_080CFB18: .4byte 0x04000060

	THUMB_FUNC_START FlushSound_Maybe
FlushSound_Maybe: @ 0x080CFB1C
	ldr r0, _080CFDC8 @ 0x03007FF0
	ldr r0, [r0]
	ldr r2, _080CFDCC @ 0x68736D53
	ldr r3, [r0]
	subs r3, r3, r2
	cmp r3, #1
	bhi _080CFB5C
	ldrb r1, [r0, #4]
	subs r1, #1
	strb r1, [r0, #4]
	bgt _080CFB5C
	ldrb r1, [r0, #0xb]
	strb r1, [r0, #4]
	ldr r2, _080CFB60 @ 0x040000BC
	ldr r1, [r2, #8]
	lsls r1, r1, #7
	blo _080CFB42
	ldr r1, _080CFB64 @ 0x84400004
	str r1, [r2, #8]
_080CFB42:
	ldr r1, [r2, #0x14]
	lsls r1, r1, #7
	blo _080CFB4C
	ldr r1, _080CFB64 @ 0x84400004
	str r1, [r2, #0x14]
_080CFB4C:
	movs r1, #4
	lsls r1, r1, #8
	strh r1, [r2, #0xa]
	strh r1, [r2, #0x16]
	movs r1, #0xb6
	lsls r1, r1, #8
	strh r1, [r2, #0xa]
	strh r1, [r2, #0x16]
_080CFB5C:
	bx lr
	.align 2, 0
_080CFB60: .4byte 0x040000BC
_080CFB64: .4byte 0x84400004
	.byte 0x98, 0x4A, 0x43, 0x6B, 0x9A, 0x42, 0x00, 0xD0
	.byte 0x70, 0x47, 0x01, 0x33, 0x43, 0x63, 0x01, 0xB5, 0x83, 0x6B, 0x00, 0x2B, 0x02, 0xD0, 0xC0, 0x6B
	.byte 0x00, 0xF0, 0x1E, 0xF9, 0x01, 0xBC, 0xF0, 0xB4, 0x44, 0x46, 0x4D, 0x46, 0x56, 0x46, 0x5F, 0x46
	.byte 0xF0, 0xB4, 0x07, 0x1C, 0x78, 0x68, 0x00, 0x28, 0x00, 0xDA, 0x09, 0xE1, 0x8A, 0x48, 0x00, 0x68
	.byte 0x80, 0x46, 0x38, 0x1C, 0x00, 0xF0, 0x56, 0xFF, 0x78, 0x68, 0x00, 0x28, 0x00, 0xDA, 0xFF, 0xE0
	.byte 0x78, 0x8C, 0x39, 0x8C, 0x40, 0x18, 0xA3, 0xE0, 0x3E, 0x7A, 0xFD, 0x6A, 0x01, 0x23, 0x00, 0x24
	.byte 0x28, 0x78, 0x80, 0x21, 0x01, 0x42, 0x00, 0xD1, 0x88, 0xE0, 0x9A, 0x46, 0x1C, 0x43, 0xA3, 0x46
	.byte 0x2C, 0x6A, 0x00, 0x2C, 0x13, 0xD0, 0x21, 0x78, 0xC7, 0x20, 0x08, 0x42, 0x09, 0xD0, 0x20, 0x7C
	.byte 0x00, 0x28, 0x09, 0xD0, 0x01, 0x38, 0x20, 0x74, 0x06, 0xD1, 0x40, 0x20, 0x01, 0x43, 0x21, 0x70
	.byte 0x02, 0xE0, 0x20, 0x1C, 0x00, 0xF0, 0xAC, 0xFC, 0x64, 0x6B, 0x00, 0x2C, 0xEB, 0xD1, 0x2B, 0x78
	.byte 0x40, 0x20, 0x18, 0x42, 0x3A, 0xD0, 0x28, 0x1C, 0x00, 0xF0, 0xAC, 0xFC, 0x80, 0x20, 0x28, 0x70
	.byte 0x02, 0x20, 0xE8, 0x73, 0x40, 0x20, 0xE8, 0x74, 0x16, 0x20, 0x68, 0x76, 0x01, 0x20, 0xA9, 0x1D
	.byte 0x88, 0x77, 0x2B, 0xE0, 0x2A, 0x6C, 0x11, 0x78, 0x80, 0x29, 0x01, 0xD2, 0xE9, 0x79, 0x04, 0xE0
	.byte 0x01, 0x32, 0x2A, 0x64, 0xBD, 0x29, 0x00, 0xD3, 0xE9, 0x71, 0xCF, 0x29, 0x08, 0xD3, 0x40, 0x46
	.byte 0x83, 0x6B, 0x08, 0x1C, 0xCF, 0x38, 0x39, 0x1C, 0x2A, 0x1C, 0x00, 0xF0, 0xB9, 0xF8, 0x15, 0xE0
	.byte 0xB0, 0x29, 0x0E, 0xD9, 0x08, 0x1C, 0xB1, 0x38, 0xB8, 0x72, 0x43, 0x46, 0x5B, 0x6B, 0x80, 0x00
	.byte 0x1B, 0x58, 0x38, 0x1C, 0x29, 0x1C, 0x00, 0xF0, 0xAB, 0xF8, 0x28, 0x78, 0x00, 0x28, 0x33, 0xD0
	.byte 0x04, 0xE0, 0x54, 0x48, 0x80, 0x39, 0x09, 0x18, 0x08, 0x78, 0x68, 0x70, 0x68, 0x78, 0x00, 0x28
	.byte 0xD0, 0xD0, 0x01, 0x38, 0x68, 0x70, 0x69, 0x7E, 0x00, 0x29, 0x25, 0xD0, 0xE8, 0x7D, 0x00, 0x28
	.byte 0x22, 0xD0, 0x28, 0x7F, 0x00, 0x28, 0x02, 0xD0, 0x01, 0x38, 0x28, 0x77, 0x1C, 0xE0, 0xA8, 0x7E
	.byte 0x40, 0x18, 0xA8, 0x76, 0x01, 0x1C, 0x40, 0x38, 0x00, 0x06, 0x02, 0xD5, 0x0A, 0x06, 0x12, 0x16
	.byte 0x01, 0xE0, 0x80, 0x20, 0x42, 0x1A, 0xE8, 0x7D, 0x50, 0x43, 0x82, 0x11, 0xA8, 0x7D, 0x50, 0x40
	.byte 0x00, 0x06, 0x09, 0xD0, 0xAA, 0x75, 0x28, 0x78, 0x29, 0x7E, 0x00, 0x29, 0x01, 0xD1, 0x0C, 0x21
	.byte 0x00, 0xE0, 0x03, 0x21, 0x08, 0x43, 0x28, 0x70, 0x53, 0x46, 0x5C, 0x46, 0x01, 0x3E, 0x03, 0xDD
	.byte 0x50, 0x20, 0x2D, 0x18, 0x5B, 0x00, 0x6B, 0xE7, 0xF8, 0x68, 0x01, 0x30, 0xF8, 0x60, 0x00, 0x2C
	.byte 0x03, 0xD1, 0x80, 0x20, 0x00, 0x06, 0x78, 0x60, 0x5A, 0xE0, 0x7C, 0x60, 0x78, 0x8C, 0x96, 0x38
	.byte 0x78, 0x84, 0x96, 0x28, 0x00, 0xD3, 0x57, 0xE7, 0x3A, 0x7A, 0xFD, 0x6A, 0x28, 0x78, 0x80, 0x21
	.byte 0x01, 0x42, 0x48, 0xD0, 0x0F, 0x21, 0x01, 0x42, 0x45, 0xD0, 0x91, 0x46, 0x38, 0x1C, 0x29, 0x1C
	.byte 0x00, 0xF0, 0xFC, 0xFE, 0x2C, 0x6A, 0x00, 0x2C, 0x38, 0xD0, 0x21, 0x78, 0xC7, 0x20, 0x08, 0x42
	.byte 0x03, 0xD1, 0x20, 0x1C, 0x00, 0xF0, 0x0C, 0xFC, 0x2D, 0xE0, 0x60, 0x78, 0x07, 0x26, 0x06, 0x40
	.byte 0x2B, 0x78, 0x03, 0x20, 0x18, 0x42, 0x07, 0xD0, 0x00, 0xF0, 0x64, 0xF8, 0x00, 0x2E, 0x03, 0xD0
	.byte 0x60, 0x7F, 0x01, 0x21, 0x08, 0x43, 0x60, 0x77, 0x2B, 0x78, 0x0C, 0x20, 0x18, 0x42, 0x1A, 0xD0
	.byte 0x21, 0x7A, 0x08, 0x20, 0x28, 0x56, 0x0A, 0x18, 0x00, 0xD5, 0x00, 0x22, 0x00, 0x2E, 0x0C, 0xD0
	.byte 0x40, 0x46, 0x03, 0x6B, 0x11, 0x1C, 0x6A, 0x7A, 0x30, 0x1C, 0x00, 0xF0, 0x21, 0xF8, 0x20, 0x62
	.byte 0x60, 0x7F, 0x02, 0x21, 0x08, 0x43, 0x60, 0x77, 0x05, 0xE0, 0x11, 0x1C, 0x6A, 0x7A, 0x60, 0x6A
	.byte 0x00, 0xF0, 0xA0, 0xF9, 0x20, 0x62, 0x64, 0x6B, 0x00, 0x2C, 0xC6, 0xD1, 0x28, 0x78, 0xF0, 0x21
	.byte 0x08, 0x40, 0x28, 0x70, 0x4A, 0x46, 0x01, 0x3A, 0x02, 0xDD, 0x50, 0x20, 0x2D, 0x18, 0xAD, 0xDC
	.byte 0x06, 0x48, 0x78, 0x63, 0xFF, 0xBC, 0x80, 0x46, 0x89, 0x46, 0x92, 0x46, 0x9B, 0x46, 0x08, 0xBC

	THUMB_FUNC_START sub_080CFDC0
sub_080CFDC0: @ 0x080CFDC0
	bx r3
	.byte 0x00, 0x00, 0x04, 0x74, 0x20, 0x08
_080CFDC8: .4byte 0x03007FF0
_080CFDCC: .4byte 0x68736D53

	THUMB_FUNC_START sub_80CFDD0
sub_80CFDD0: @ 0x080CFDD0
	push {r4, r5, r6, lr}
	adds r5, r1, #0
	ldrb r1, [r5]
	movs r0, #0x80
	tst r0, r1
	beq _080CFE08
	ldr r4, [r5, #0x20]
	cmp r4, #0
	beq _080CFE06
	movs r6, #0
_080CFDE4:
	ldrb r0, [r4]
	cmp r0, #0
	beq _080CFDFE
	ldrb r0, [r4, #1]
	movs r3, #7
	ands r0, r3
	beq _080CFDFC
	ldr r3, _080CFE10 @ 0x03007FF0
	ldr r3, [r3]
	ldr r3, [r3, #0x2c]
	bl sub_080CFDC0
_080CFDFC:
	strb r6, [r4]
_080CFDFE:
	str r6, [r4, #0x2c]
	ldr r4, [r4, #0x34]
	cmp r4, #0
	bne _080CFDE4
_080CFE06:
	str r4, [r5, #0x20]
_080CFE08:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080CFE10: .4byte 0x03007FF0

	THUMB_FUNC_START sub_80CFE14
sub_80CFE14: @ 0x080CFE14
	ldrb r1, [r4, #0x12]
	movs r0, #0x14
	ldrsb r2, [r4, r0]
	movs r3, #0x80
	adds r3, r3, r2
	muls r3, r1, r3
	ldrb r0, [r5, #0x10]
	muls r0, r3, r0
	asrs r0, r0, #0xe
	cmp r0, #0xff
	bls _080CFE2C
	movs r0, #0xff
_080CFE2C:
	strb r0, [r4, #2]
	movs r3, #0x7f
	subs r3, r3, r2
	muls r3, r1, r3
	ldrb r0, [r5, #0x11]
	muls r0, r3, r0
	asrs r0, r0, #0xe
	cmp r0, #0xff
	bls _080CFE40
	movs r0, #0xff
_080CFE40:
	strb r0, [r4, #3]
	bx lr

	THUMB_FUNC_START sub_80CFE44
sub_80CFE44: @ 0x080CFE44
	push {r4, r5, r6, r7, lr}
	mov r4, r8
	mov r5, sb
	mov r6, sl
	mov r7, fp
	push {r4, r5, r6, r7}
	sub sp, #0x18
	str r1, [sp]
	adds r5, r2, #0
	ldr r1, _080D003C @ 0x03007FF0
	ldr r1, [r1]
	str r1, [sp, #4]
	ldr r1, _080D0040 @ 0x08207404
	adds r0, r0, r1
	ldrb r0, [r0]
	strb r0, [r5, #4]
	ldr r3, [r5, #0x40]
	ldrb r0, [r3]
	cmp r0, #0x80
	bhs _080CFE8A
	strb r0, [r5, #5]
	adds r3, #1
	ldrb r0, [r3]
	cmp r0, #0x80
	bhs _080CFE88
	strb r0, [r5, #6]
	adds r3, #1
	ldrb r0, [r3]
	cmp r0, #0x80
	bhs _080CFE88
	ldrb r1, [r5, #4]
	adds r1, r1, r0
	strb r1, [r5, #4]
	adds r3, #1
_080CFE88:
	str r3, [r5, #0x40]
_080CFE8A:
	movs r0, #0
	str r0, [sp, #0x14]
	adds r4, r5, #0
	adds r4, #0x24
	ldrb r2, [r4]
	movs r0, #0xc0
	tst r0, r2
	beq _080CFEDC
	ldrb r3, [r5, #5]
	movs r0, #0x40
	tst r0, r2
	beq _080CFEAA
	ldr r1, [r5, #0x2c]
	adds r1, r1, r3
	ldrb r0, [r1]
	b _080CFEAC
_080CFEAA:
	adds r0, r3, #0
_080CFEAC:
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, [r5, #0x28]
	adds r1, r1, r0
	mov sb, r1
	mov r6, sb
	ldrb r1, [r6]
	movs r0, #0xc0
	tst r0, r1
	beq _080CFEC4
	b _080D002A
_080CFEC4:
	movs r0, #0x80
	tst r0, r2
	beq _080CFEE0
	ldrb r1, [r6, #3]
	movs r0, #0x80
	tst r0, r1
	beq _080CFED8
	subs r1, #0xc0
	lsls r1, r1, #1
	str r1, [sp, #0x14]
_080CFED8:
	ldrb r3, [r6, #1]
	b _080CFEE0
_080CFEDC:
	mov sb, r4
	ldrb r3, [r5, #5]
_080CFEE0:
	str r3, [sp, #8]
	ldr r6, [sp]
	ldrb r1, [r6, #9]
	ldrb r0, [r5, #0x1d]
	adds r0, r0, r1
	cmp r0, #0xff
	bls _080CFEF0
	movs r0, #0xff
_080CFEF0:
	str r0, [sp, #0x10]
	mov r6, sb
	ldrb r0, [r6]
	movs r6, #7
	ands r6, r0
	str r6, [sp, #0xc]
	beq _080CFF30
	ldr r0, [sp, #4]
	ldr r4, [r0, #0x1c]
	cmp r4, #0
	bne _080CFF08
	b _080D002A
_080CFF08:
	subs r6, #1
	lsls r0, r6, #6
	adds r4, r4, r0
	ldrb r1, [r4]
	movs r0, #0xc7
	tst r0, r1
	beq _080CFF84
	movs r0, #0x40
	tst r0, r1
	bne _080CFF84
	ldrb r1, [r4, #0x13]
	ldr r0, [sp, #0x10]
	cmp r1, r0
	blo _080CFF84
	beq _080CFF28
	b _080D002A
_080CFF28:
	ldr r0, [r4, #0x2c]
	cmp r0, r5
	bhs _080CFF84
	b _080D002A
_080CFF30:
	ldr r6, [sp, #0x10]
	adds r7, r5, #0
	movs r2, #0
	mov r8, r2
	ldr r4, [sp, #4]
	ldrb r3, [r4, #6]
	adds r4, #0x50
_080CFF3E:
	ldrb r1, [r4]
	movs r0, #0xc7
	tst r0, r1
	beq _080CFF84
	movs r0, #0x40
	tst r0, r1
	beq _080CFF58
	cmp r2, #0
	bne _080CFF5C
	adds r2, #1
	ldrb r6, [r4, #0x13]
	ldr r7, [r4, #0x2c]
	b _080CFF76
_080CFF58:
	cmp r2, #0
	bne _080CFF78
_080CFF5C:
	ldrb r0, [r4, #0x13]
	cmp r0, r6
	bhs _080CFF68
	adds r6, r0, #0
	ldr r7, [r4, #0x2c]
	b _080CFF76
_080CFF68:
	bhi _080CFF78
	ldr r0, [r4, #0x2c]
	cmp r0, r7
	bls _080CFF74
	adds r7, r0, #0
	b _080CFF76
_080CFF74:
	blo _080CFF78
_080CFF76:
	mov r8, r4
_080CFF78:
	adds r4, #0x40
	subs r3, #1
	bgt _080CFF3E
	mov r4, r8
	cmp r4, #0
	beq _080D002A
_080CFF84:
	adds r0, r4, #0
	bl sub_80D0550
	movs r1, #0
	str r1, [r4, #0x30]
	ldr r3, [r5, #0x20]
	str r3, [r4, #0x34]
	cmp r3, #0
	beq _080CFF98
	str r4, [r3, #0x30]
_080CFF98:
	str r4, [r5, #0x20]
	str r5, [r4, #0x2c]
	ldrb r0, [r5, #0x1b]
	strb r0, [r5, #0x1c]
	cmp r0, r1
	beq _080CFFAA
	adds r1, r5, #0
	bl sub_80D0084
_080CFFAA:
	ldr r0, [sp]
	adds r1, r5, #0
	bl sub_80D0B1C
	ldr r0, [r5, #4]
	str r0, [r4, #0x10]
	ldr r0, [sp, #0x10]
	strb r0, [r4, #0x13]
	ldr r0, [sp, #8]
	strb r0, [r4, #8]
	ldr r0, [sp, #0x14]
	strb r0, [r4, #0x14]
	mov r6, sb
	ldrb r0, [r6]
	strb r0, [r4, #1]
	ldr r7, [r6, #4]
	str r7, [r4, #0x24]
	ldr r0, [r6, #8]
	str r0, [r4, #4]
	ldrh r0, [r5, #0x1e]
	strh r0, [r4, #0xc]
	bl sub_80CFE14
	ldrb r1, [r4, #8]
	movs r0, #8
	ldrsb r0, [r5, r0]
	adds r3, r1, r0
	bpl _080CFFE4
	movs r3, #0
_080CFFE4:
	ldr r6, [sp, #0xc]
	cmp r6, #0
	beq _080D0012
	mov r6, sb
	ldrb r0, [r6, #2]
	strb r0, [r4, #0x1e]
	ldrb r1, [r6, #3]
	movs r0, #0x80
	tst r0, r1
	bne _080CFFFE
	movs r0, #0x70
	tst r0, r1
	bne _080D0000
_080CFFFE:
	movs r1, #8
_080D0000:
	strb r1, [r4, #0x1f]
	ldrb r2, [r5, #9]
	adds r1, r3, #0
	ldr r0, [sp, #0xc]
	ldr r3, [sp, #4]
	ldr r3, [r3, #0x30]
	bl sub_080CFDC0
	b _080D001C
_080D0012:
	ldrb r2, [r5, #9]
	adds r1, r3, #0
	adds r0, r7, #0
	bl sub_80D00D4
_080D001C:
	str r0, [r4, #0x20]
	movs r0, #0x80
	strb r0, [r4]
	ldrb r1, [r5]
	movs r0, #0xf0
	ands r0, r1
	strb r0, [r5]
_080D002A:
	add sp, #0x18
	pop {r0, r1, r2, r3, r4, r5, r6, r7}
	mov r8, r0
	mov sb, r1
	mov sl, r2
	mov fp, r3
	pop {r0}
	bx r0
	.align 2, 0
_080D003C: .4byte 0x03007FF0
_080D0040: .4byte 0x08207404

	THUMB_FUNC_START sub_80D0044
sub_80D0044: @ 0x080D0044
	push {r4, r5}
	ldr r2, [r1, #0x40]
	ldrb r3, [r2]
	cmp r3, #0x80
	bhs _080D0056
	strb r3, [r1, #5]
	adds r2, #1
	str r2, [r1, #0x40]
	b _080D0058
_080D0056:
	ldrb r3, [r1, #5]
_080D0058:
	ldr r1, [r1, #0x20]
	cmp r1, #0
	beq _080D0080
	movs r4, #0x83
	movs r5, #0x40
_080D0062:
	ldrb r2, [r1]
	tst r2, r4
	beq _080D007A
	tst r2, r5
	bne _080D007A
	ldrb r0, [r1, #0x11]
	cmp r0, r3
	bne _080D007A
	movs r0, #0x40
	orrs r2, r0
	strb r2, [r1]
	b _080D0080
_080D007A:
	ldr r1, [r1, #0x34]
	cmp r1, #0
	bne _080D0062
_080D0080:
	pop {r4, r5}
	bx lr

	THUMB_FUNC_START sub_80D0084
sub_80D0084: @ 0x080D0084
	movs r2, #0
	strb r2, [r1, #0x16]
	strb r2, [r1, #0x1a]
	ldrb r2, [r1, #0x18]
	cmp r2, #0
	bne _080D0094
	movs r2, #0xc
	b _080D0096
_080D0094:
	movs r2, #3
_080D0096:
	ldrb r3, [r1]
	orrs r3, r2
	strb r3, [r1]
	bx lr
	.byte 0x00, 0x00

	THUMB_FUNC_START sub_80D00A0
sub_80D00A0: @ 0x080D00A0
	ldr r2, [r1, #0x40]
	adds r3, r2, #1
	str r3, [r1, #0x40]
	ldrb r3, [r2]
	bx lr
	.byte 0x00, 0x00

	THUMB_FUNC_START sub_80D00AC
sub_80D00AC: @ 0x080D00AC
	mov ip, lr
	bl sub_80D00A0
	strb r3, [r1, #0x19]
	cmp r3, #0
	bne _080D00BC
	bl sub_80D0084
_080D00BC:
	bx ip
	.byte 0x00, 0x00

	THUMB_FUNC_START sub_80D00C0
sub_80D00C0: @ 0x080D00C0
	mov ip, lr
	bl sub_80D00A0
	strb r3, [r1, #0x17]
	cmp r3, #0
	bne _080D00D0
	bl sub_80D0084
_080D00D0:
	bx ip
	.byte 0x00, 0x00

	THUMB_FUNC_START sub_80D00D4
sub_80D00D4: @ 0x080D00D4
	push {r4, r5, r6, r7, lr}
	mov ip, r0
	lsls r1, r1, #0x18
	lsrs r6, r1, #0x18
	lsls r7, r2, #0x18
	cmp r6, #0xb2
	bls _080D00E8
	movs r6, #0xb2
	movs r7, #0xff
	lsls r7, r7, #0x18
_080D00E8:
	ldr r3, _080D0130 @ 0x08207220
	adds r0, r6, r3
	ldrb r5, [r0]
	ldr r4, _080D0134 @ 0x082072D4
	movs r2, #0xf
	adds r0, r5, #0
	ands r0, r2
	lsls r0, r0, #2
	adds r0, r0, r4
	lsrs r1, r5, #4
	ldr r5, [r0]
	lsrs r5, r1
	adds r0, r6, #1
	adds r0, r0, r3
	ldrb r1, [r0]
	adds r0, r1, #0
	ands r0, r2
	lsls r0, r0, #2
	adds r0, r0, r4
	lsrs r1, r1, #4
	ldr r0, [r0]
	lsrs r0, r1
	mov r1, ip
	ldr r4, [r1, #4]
	subs r0, r0, r5
	adds r1, r7, #0
	bl umul3232H32
	adds r1, r0, #0
	adds r1, r5, r1
	adds r0, r4, #0
	bl umul3232H32
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080D0130: .4byte 0x08207220
_080D0134: .4byte 0x082072D4
	.byte 0x70, 0x47, 0x00, 0x00

	THUMB_FUNC_START sub_80D013C
sub_80D013C: @ 0x080D013C
	adds r2, r0, #0
	ldr r3, [r2, #0x34]
	ldr r0, _080D0150 @ 0x68736D53
	cmp r3, r0
	bne _080D014E
	ldr r0, [r2, #4]
	ldr r1, _080D0154 @ 0x7FFFFFFF
	ands r0, r1
	str r0, [r2, #4]
_080D014E:
	bx lr
	.align 2, 0
_080D0150: .4byte 0x68736D53
_080D0154: .4byte 0x7FFFFFFF

	THUMB_FUNC_START SoundStuff_80D0158
SoundStuff_80D0158: @ 0x080D0158
	adds r2, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldr r3, [r2, #0x34]
	ldr r0, _080D0174 @ 0x68736D53
	cmp r3, r0
	bne _080D0170
	strh r1, [r2, #0x26]
	strh r1, [r2, #0x24]
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r2, #0x28]
_080D0170:
	bx lr
	.align 2, 0
_080D0174: .4byte 0x68736D53

	THUMB_FUNC_START sub_80D0178
sub_80D0178: @ 0x080D0178
	push {r4, r5, r6, lr}
	ldr r0, _080D01CC @ 0x080CF54D
	movs r1, #2
	rsbs r1, r1, #0
	ands r0, r1
	ldr r1, _080D01D0 @ 0x03002C60
	ldr r2, _080D01D4 @ 0x04000100
	bl CpuSet
	ldr r0, _080D01D8 @ 0x03005410
	bl sub_80D0578
	ldr r0, _080D01DC @ 0x03006510
	bl sub_80D0434
	ldr r0, _080D01E0 @ 0x0094D700
	bl sub_80D0714
	ldr r0, _080D01E4 @ 0x00000009
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0
	beq _080D01C6
	ldr r5, _080D01E8 @ 0x08224404
	adds r6, r0, #0
_080D01AA:
	ldr r4, [r5]
	ldr r1, [r5, #4]
	ldrb r2, [r5, #8]
	adds r0, r4, #0
	bl sub_80D08B8
	ldrh r0, [r5, #0xa]
	strb r0, [r4, #0xb]
	ldr r0, _080D01EC @ 0x03006710
	str r0, [r4, #0x18]
	adds r5, #0xc
	subs r6, #1
	cmp r6, #0
	bne _080D01AA
_080D01C6:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080D01CC: .4byte 0x080CF54D
_080D01D0: .4byte 0x03002C60
_080D01D4: .4byte 0x04000100
_080D01D8: .4byte 0x03005410
_080D01DC: .4byte 0x03006510
_080D01E0: .4byte 0x0094D700
_080D01E4: .4byte 0x00000009
_080D01E8: .4byte 0x08224404
_080D01EC: .4byte 0x03006710

	THUMB_FUNC_START sub_80D01F0
sub_80D01F0: @ 0x080D01F0
	push {lr}
	bl sub_80CF4C8
	pop {r0}
	bx r0
	.byte 0x00, 0x00

	THUMB_FUNC_START PlaySound
PlaySound: @ 0x080D01FC
	push {lr}
	lsls r0, r0, #0x10
	ldr r2, _080D0220 @ 0x08224404
	ldr r1, _080D0224 @ 0x08224470
	lsrs r0, r0, #0xd
	adds r0, r0, r1
	ldrh r3, [r0, #4]
	lsls r1, r3, #1
	adds r1, r1, r3
	lsls r1, r1, #2
	adds r1, r1, r2
	ldr r2, [r1]
	ldr r1, [r0]
	adds r0, r2, #0
	bl sub_80D0930
	pop {r0}
	bx r0
	.align 2, 0
_080D0220: .4byte 0x08224404
_080D0224: .4byte 0x08224470
	.byte 0x00, 0xB5, 0x00, 0x04, 0x09, 0x4A, 0x0A, 0x49
	.byte 0x40, 0x0B, 0x40, 0x18, 0x83, 0x88, 0x59, 0x00, 0xC9, 0x18, 0x89, 0x00, 0x89, 0x18, 0x09, 0x68
	.byte 0x0B, 0x68, 0x02, 0x68, 0x93, 0x42, 0x09, 0xD0, 0x08, 0x1C, 0x11, 0x1C, 0x00, 0xF0, 0x70, 0xFB
	.byte 0x0E, 0xE0, 0x00, 0x00, 0x04, 0x44, 0x22, 0x08, 0x70, 0x44, 0x22, 0x08, 0x4A, 0x68, 0x88, 0x88
	.byte 0x00, 0x28, 0x01, 0xD0, 0x00, 0x2A, 0x03, 0xDA, 0x08, 0x1C, 0x19, 0x1C, 0x00, 0xF0, 0x60, 0xFB
	.byte 0x01, 0xBC, 0x00, 0x47, 0x00, 0xB5, 0x00, 0x04, 0x09, 0x4A, 0x0A, 0x49, 0x40, 0x0B, 0x40, 0x18
	.byte 0x83, 0x88, 0x59, 0x00, 0xC9, 0x18, 0x89, 0x00, 0x89, 0x18, 0x09, 0x68, 0x0B, 0x68, 0x02, 0x68
	.byte 0x93, 0x42, 0x09, 0xD0, 0x08, 0x1C, 0x11, 0x1C, 0x00, 0xF0, 0x4A, 0xFB, 0x12, 0xE0, 0x00, 0x00
	.byte 0x04, 0x44, 0x22, 0x08, 0x70, 0x44, 0x22, 0x08, 0x4A, 0x68, 0x88, 0x88, 0x00, 0x28, 0x04, 0xD1
	.byte 0x08, 0x1C, 0x19, 0x1C, 0x00, 0xF0, 0x3C, 0xFB, 0x04, 0xE0, 0x00, 0x2A, 0x02, 0xDA, 0x08, 0x1C
	.byte 0xFF, 0xF7, 0x3C, 0xFF, 0x01, 0xBC, 0x00, 0x47

	THUMB_FUNC_START sub_80D02C8
sub_80D02C8: @ 0x080D02C8
	push {lr}
	lsls r0, r0, #0x10
	ldr r2, _080D02F4 @ 0x08224404
	ldr r1, _080D02F8 @ 0x08224470
	lsrs r0, r0, #0xd
	adds r0, r0, r1
	ldrh r3, [r0, #4]
	lsls r1, r3, #1
	adds r1, r1, r3
	lsls r1, r1, #2
	adds r1, r1, r2
	ldr r2, [r1]
	ldr r1, [r2]
	ldr r0, [r0]
	cmp r1, r0
	bne _080D02EE
	adds r0, r2, #0
	bl sub_80D0A14
_080D02EE:
	pop {r0}
	bx r0
	.align 2, 0
_080D02F4: .4byte 0x08224404
_080D02F8: .4byte 0x08224470
	.byte 0x00, 0xB5, 0x00, 0x04
	.byte 0x09, 0x4A, 0x0A, 0x49, 0x40, 0x0B, 0x40, 0x18, 0x83, 0x88, 0x59, 0x00, 0xC9, 0x18, 0x89, 0x00
	.byte 0x89, 0x18, 0x0A, 0x68, 0x11, 0x68, 0x00, 0x68, 0x81, 0x42, 0x02, 0xD1, 0x10, 0x1C, 0xFF, 0xF7
	.byte 0x0D, 0xFF, 0x01, 0xBC, 0x00, 0x47, 0x00, 0x00, 0x04, 0x44, 0x22, 0x08, 0x70, 0x44, 0x22, 0x08
	.byte 0x30, 0xB5, 0x08, 0x48, 0x00, 0x04, 0x00, 0x0C, 0x00, 0x28, 0x08, 0xD0, 0x06, 0x4D, 0x04, 0x1C
	.byte 0x28, 0x68, 0x00, 0xF0, 0x67, 0xFB, 0x0C, 0x35, 0x01, 0x3C, 0x00, 0x2C, 0xF8, 0xD1, 0x30, 0xBC
	.byte 0x01, 0xBC, 0x00, 0x47, 0x09, 0x00, 0x00, 0x00, 0x04, 0x44, 0x22, 0x08, 0x00, 0xB5, 0xFF, 0xF7
	.byte 0xED, 0xFE, 0x01, 0xBC, 0x00, 0x47, 0x00, 0x00, 0x30, 0xB5, 0x08, 0x48, 0x00, 0x04, 0x00, 0x0C
	.byte 0x00, 0x28, 0x08, 0xD0, 0x06, 0x4D, 0x04, 0x1C, 0x28, 0x68, 0xFF, 0xF7, 0xDF, 0xFE, 0x0C, 0x35
	.byte 0x01, 0x3C, 0x00, 0x2C, 0xF8, 0xD1, 0x30, 0xBC, 0x01, 0xBC, 0x00, 0x47, 0x09, 0x00, 0x00, 0x00
	.byte 0x04, 0x44, 0x22, 0x08

	THUMB_FUNC_START SoundStuff_80D0394
SoundStuff_80D0394: @ 0x080D0394
	push {lr}
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	bl SoundStuff_80D0158
	pop {r0}
	bx r0
	.byte 0x00, 0x00

	THUMB_FUNC_START sub_80D03A4
sub_80D03A4: @ 0x080D03A4
	adds r2, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldr r3, [r2, #0x34]
	ldr r0, _080D03BC @ 0x68736D53
	cmp r3, r0
	bne _080D03BA
	strh r1, [r2, #0x26]
	strh r1, [r2, #0x24]
	ldr r0, _080D03C0 @ 0x00000101
	strh r0, [r2, #0x28]
_080D03BA:
	bx lr
	.align 2, 0
_080D03BC: .4byte 0x68736D53
_080D03C0: .4byte 0x00000101

	THUMB_FUNC_START sub_80D03C4
sub_80D03C4: @ 0x080D03C4
	adds r2, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldr r3, [r2, #0x34]
	ldr r0, _080D03E4 @ 0x68736D53
	cmp r3, r0
	bne _080D03E2
	strh r1, [r2, #0x26]
	strh r1, [r2, #0x24]
	movs r0, #2
	strh r0, [r2, #0x28]
	ldr r0, [r2, #4]
	ldr r1, _080D03E8 @ 0x7FFFFFFF
	ands r0, r1
	str r0, [r2, #4]
_080D03E2:
	bx lr
	.align 2, 0
_080D03E4: .4byte 0x68736D53
_080D03E8: .4byte 0x7FFFFFFF

	THUMB_FUNC_START sub_80D03EC
sub_80D03EC: @ 0x080D03EC
	push {r4, r5, r6, r7, lr}
	ldrb r5, [r0, #8]
	ldr r4, [r0, #0x2c]
	cmp r5, #0
	ble _080D042E
	movs r7, #0x80
_080D03F8:
	ldrb r1, [r4]
	adds r0, r7, #0
	ands r0, r1
	cmp r0, #0
	beq _080D0426
	movs r6, #0x40
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	beq _080D0426
	adds r0, r4, #0
	bl sub_80D0564
	strb r7, [r4]
	movs r0, #2
	strb r0, [r4, #0xf]
	strb r6, [r4, #0x13]
	movs r0, #0x16
	strb r0, [r4, #0x19]
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #1
	strb r0, [r1]
_080D0426:
	subs r5, #1
	adds r4, #0x50
	cmp r5, #0
	bgt _080D03F8
_080D042E:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_START sub_80D0434
sub_80D0434: @ 0x080D0434
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r1, _080D04FC @ 0x04000084
	movs r0, #0x8f
	strh r0, [r1]
	ldr r3, _080D0500 @ 0x04000080
	movs r2, #0
	strh r2, [r3]
	ldr r0, _080D0504 @ 0x04000063
	movs r1, #8
	strb r1, [r0]
	adds r0, #6
	strb r1, [r0]
	adds r0, #0x10
	strb r1, [r0]
	subs r0, #0x14
	movs r1, #0x80
	strb r1, [r0]
	adds r0, #8
	strb r1, [r0]
	adds r0, #0x10
	strb r1, [r0]
	subs r0, #0xd
	strb r2, [r0]
	movs r0, #0x77
	strb r0, [r3]
	ldr r0, _080D0508 @ 0x03007FF0
	ldr r4, [r0]
	ldr r6, [r4]
	ldr r0, _080D050C @ 0x68736D53
	cmp r6, r0
	bne _080D04F4
	adds r0, r6, #1
	str r0, [r4]
	ldr r1, _080D0510 @ 0x03006480
	ldr r0, _080D0514 @ 0x080D13F1
	str r0, [r1, #0x20]
	ldr r0, _080D0518 @ 0x080D00AD
	str r0, [r1, #0x44]
	ldr r0, _080D051C @ 0x080D00C1
	str r0, [r1, #0x4c]
	ldr r0, _080D0520 @ 0x080D1549
	str r0, [r1, #0x70]
	ldr r0, _080D0524 @ 0x080D0045
	str r0, [r1, #0x74]
	ldr r0, _080D0528 @ 0x080D0671
	str r0, [r1, #0x78]
	ldr r0, _080D052C @ 0x080CFDD1
	str r0, [r1, #0x7c]
	adds r2, r1, #0
	adds r2, #0x80
	ldr r0, _080D0530 @ 0x080D0A55
	str r0, [r2]
	adds r1, #0x84
	ldr r0, _080D0534 @ 0x080D0B1D
	str r0, [r1]
	str r5, [r4, #0x1c]
	ldr r0, _080D0538 @ 0x080D0D31
	str r0, [r4, #0x28]
	ldr r0, _080D053C @ 0x080D0C79
	str r0, [r4, #0x2c]
	ldr r0, _080D0540 @ 0x080D0BD1
	str r0, [r4, #0x30]
	ldr r0, _080D0544 @ 0x00000000
	movs r1, #0
	strb r0, [r4, #0xc]
	str r1, [sp]
	ldr r2, _080D0548 @ 0x05000040
	mov r0, sp
	adds r1, r5, #0
	bl CpuSet
	movs r0, #1
	strb r0, [r5, #1]
	movs r0, #0x11
	strb r0, [r5, #0x1c]
	adds r1, r5, #0
	adds r1, #0x41
	movs r0, #2
	strb r0, [r1]
	adds r1, #0x1b
	movs r0, #0x22
	strb r0, [r1]
	adds r1, #0x25
	movs r0, #3
	strb r0, [r1]
	adds r1, #0x1b
	movs r0, #0x44
	strb r0, [r1]
	adds r1, #0x24
	movs r0, #4
	strb r0, [r1, #1]
	movs r0, #0x88
	strb r0, [r1, #0x1c]
	str r6, [r4]
_080D04F4:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080D04FC: .4byte 0x04000084
_080D0500: .4byte 0x04000080
_080D0504: .4byte 0x04000063
_080D0508: .4byte 0x03007FF0
_080D050C: .4byte 0x68736D53
_080D0510: .4byte 0x03006480
_080D0514: .4byte 0x080D13F1
_080D0518: .4byte 0x080D00AD
_080D051C: .4byte 0x080D00C1
_080D0520: .4byte 0x080D1549
_080D0524: .4byte 0x080D0045
_080D0528: .4byte 0x080D0671
_080D052C: .4byte 0x080CFDD1
_080D0530: .4byte 0x080D0A55
_080D0534: .4byte 0x080D0B1D
_080D0538: .4byte 0x080D0D31
_080D053C: .4byte 0x080D0C79
_080D0540: .4byte 0x080D0BD1
_080D0544: .4byte 0x00000000
_080D0548: .4byte 0x05000040
	.byte 0x2A, 0xDF, 0x70, 0x47

	THUMB_FUNC_START sub_80D0550
sub_80D0550: @ 0x080D0550
	push {lr}
	ldr r1, _080D0560 @ 0x03006508
	ldr r1, [r1]
	bl BXR1
	pop {r0}
	bx r0
	.align 2, 0
_080D0560: .4byte 0x03006508

	THUMB_FUNC_START sub_80D0564
sub_80D0564: @ 0x080D0564
	push {lr}
	ldr r1, _080D0574 @ 0x0300650C
	ldr r1, [r1]
	bl BXR1
	pop {r0}
	bx r0
	.align 2, 0
_080D0574: .4byte 0x0300650C

	THUMB_FUNC_START sub_80D0578
sub_80D0578: @ 0x080D0578
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	movs r3, #0
	str r3, [r5]
	ldr r1, _080D0630 @ 0x040000C4
	ldr r0, [r1]
	movs r2, #0x80
	lsls r2, r2, #0x12
	ands r0, r2
	cmp r0, #0
	beq _080D0594
	ldr r0, _080D0634 @ 0x84400004
	str r0, [r1]
_080D0594:
	ldr r1, _080D0638 @ 0x040000D0
	ldr r0, [r1]
	ands r0, r2
	cmp r0, #0
	beq _080D05A2
	ldr r0, _080D0634 @ 0x84400004
	str r0, [r1]
_080D05A2:
	ldr r0, _080D063C @ 0x040000C6
	movs r2, #0x80
	lsls r2, r2, #3
	adds r1, r2, #0
	strh r1, [r0]
	adds r0, #0xc
	strh r1, [r0]
	ldr r1, _080D0640 @ 0x04000084
	movs r0, #0x8f
	strh r0, [r1]
	subs r1, #2
	ldr r2, _080D0644 @ 0x0000A90E
	adds r0, r2, #0
	strh r0, [r1]
	ldr r2, _080D0648 @ 0x04000089
	ldrb r1, [r2]
	movs r0, #0x3f
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	ldr r1, _080D064C @ 0x040000BC
	movs r2, #0xd4
	lsls r2, r2, #2
	adds r0, r5, r2
	str r0, [r1]
	adds r1, #4
	ldr r0, _080D0650 @ 0x040000A0
	str r0, [r1]
	adds r1, #8
	movs r2, #0x98
	lsls r2, r2, #4
	adds r0, r5, r2
	str r0, [r1]
	adds r1, #4
	ldr r0, _080D0654 @ 0x040000A4
	str r0, [r1]
	ldr r0, _080D0658 @ 0x03007FF0
	str r5, [r0]
	str r3, [sp]
	ldr r2, _080D065C @ 0x050003EC
	mov r0, sp
	adds r1, r5, #0
	bl CpuSet
	movs r0, #8
	strb r0, [r5, #6]
	movs r0, #0xf
	strb r0, [r5, #7]
	ldr r0, _080D0660 @ 0x080CFE45
	str r0, [r5, #0x38]
	ldr r0, _080D0664 @ 0x080D1669
	str r0, [r5, #0x28]
	str r0, [r5, #0x2c]
	str r0, [r5, #0x30]
	str r0, [r5, #0x3c]
	ldr r4, _080D0668 @ 0x03006480
	adds r0, r4, #0
	bl sub_80CF958
	str r4, [r5, #0x34]
	movs r0, #0x80
	lsls r0, r0, #0xb
	bl sub_80D0670
	ldr r0, _080D066C @ 0x68736D53
	str r0, [r5]
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080D0630: .4byte 0x040000C4
_080D0634: .4byte 0x84400004
_080D0638: .4byte 0x040000D0
_080D063C: .4byte 0x040000C6
_080D0640: .4byte 0x04000084
_080D0644: .4byte 0x0000A90E
_080D0648: .4byte 0x04000089
_080D064C: .4byte 0x040000BC
_080D0650: .4byte 0x040000A0
_080D0654: .4byte 0x040000A4
_080D0658: .4byte 0x03007FF0
_080D065C: .4byte 0x050003EC
_080D0660: .4byte 0x080CFE45
_080D0664: .4byte 0x080D1669
_080D0668: .4byte 0x03006480
_080D066C: .4byte 0x68736D53

	THUMB_FUNC_START sub_80D0670
sub_80D0670: @ 0x080D0670
	push {r4, r5, r6, lr}
	adds r2, r0, #0
	ldr r0, _080D06F0 @ 0x03007FF0
	ldr r4, [r0]
	movs r0, #0xf0
	lsls r0, r0, #0xc
	ands r0, r2
	lsrs r2, r0, #0x10
	movs r6, #0
	strb r2, [r4, #8]
	ldr r1, _080D06F4 @ 0x08207304
	subs r0, r2, #1
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r5, [r0]
	str r5, [r4, #0x10]
	movs r0, #0xc6
	lsls r0, r0, #3
	adds r1, r5, #0
	bl ThumbDivide
	strb r0, [r4, #0xb]
	ldr r0, _080D06F8 @ 0x00091D1B
	muls r0, r5, r0
	ldr r1, _080D06FC @ 0x00001388
	adds r0, r0, r1
	ldr r1, _080D0700 @ 0x00002710
	bl ThumbDivide
	adds r1, r0, #0
	str r1, [r4, #0x14]
	movs r0, #0x80
	lsls r0, r0, #0x11
	bl ThumbDivide
	adds r0, #1
	asrs r0, r0, #1
	str r0, [r4, #0x18]
	ldr r0, _080D0704 @ 0x04000102
	strh r6, [r0]
	ldr r4, _080D0708 @ 0x04000100
	ldr r0, _080D070C @ 0x00044940
	adds r1, r5, #0
	bl ThumbDivide
	rsbs r0, r0, #0
	strh r0, [r4]
	bl sub_80D087C
	ldr r1, _080D0710 @ 0x04000006
_080D06D4:
	ldrb r0, [r1]
	cmp r0, #0x9f
	beq _080D06D4
	ldr r1, _080D0710 @ 0x04000006
_080D06DC:
	ldrb r0, [r1]
	cmp r0, #0x9f
	bne _080D06DC
	ldr r1, _080D0704 @ 0x04000102
	movs r0, #0x80
	strh r0, [r1]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080D06F0: .4byte 0x03007FF0
_080D06F4: .4byte 0x08207304
_080D06F8: .4byte 0x00091D1B
_080D06FC: .4byte 0x00001388
_080D0700: .4byte 0x00002710
_080D0704: .4byte 0x04000102
_080D0708: .4byte 0x04000100
_080D070C: .4byte 0x00044940
_080D0710: .4byte 0x04000006

	THUMB_FUNC_START sub_80D0714
sub_80D0714: @ 0x080D0714
	push {r4, r5, lr}
	adds r3, r0, #0
	ldr r0, _080D07A0 @ 0x03007FF0
	ldr r5, [r0]
	ldr r1, [r5]
	ldr r0, _080D07A4 @ 0x68736D53
	cmp r1, r0
	bne _080D079A
	adds r0, r1, #1
	str r0, [r5]
	movs r4, #0xff
	ands r4, r3
	cmp r4, #0
	beq _080D0736
	movs r0, #0x7f
	ands r4, r0
	strb r4, [r5, #5]
_080D0736:
	movs r4, #0xf0
	lsls r4, r4, #4
	ands r4, r3
	cmp r4, #0
	beq _080D0756
	lsrs r0, r4, #8
	strb r0, [r5, #6]
	movs r4, #0xc
	adds r0, r5, #0
	adds r0, #0x50
	movs r1, #0
_080D074C:
	strb r1, [r0]
	subs r4, #1
	adds r0, #0x40
	cmp r4, #0
	bne _080D074C
_080D0756:
	movs r4, #0xf0
	lsls r4, r4, #8
	ands r4, r3
	cmp r4, #0
	beq _080D0764
	lsrs r0, r4, #0xc
	strb r0, [r5, #7]
_080D0764:
	movs r4, #0xb0
	lsls r4, r4, #0x10
	ands r4, r3
	cmp r4, #0
	beq _080D0782
	movs r0, #0xc0
	lsls r0, r0, #0xe
	ands r0, r4
	lsrs r4, r0, #0xe
	ldr r2, _080D07A8 @ 0x04000089
	ldrb r1, [r2]
	movs r0, #0x3f
	ands r0, r1
	orrs r0, r4
	strb r0, [r2]
_080D0782:
	movs r4, #0xf0
	lsls r4, r4, #0xc
	ands r4, r3
	cmp r4, #0
	beq _080D0796
	bl sub_80D0800
	adds r0, r4, #0
	bl sub_80D0670
_080D0796:
	ldr r0, _080D07A4 @ 0x68736D53
	str r0, [r5]
_080D079A:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080D07A0: .4byte 0x03007FF0
_080D07A4: .4byte 0x68736D53
_080D07A8: .4byte 0x04000089
	.byte 0xF0, 0xB5, 0x12, 0x48
	.byte 0x06, 0x68, 0x31, 0x68, 0x11, 0x48, 0x81, 0x42, 0x1B, 0xD1, 0x48, 0x1C, 0x30, 0x60, 0x0C, 0x25
	.byte 0x34, 0x1C, 0x50, 0x34, 0x00, 0x20, 0x20, 0x70, 0x01, 0x3D, 0x40, 0x34, 0x00, 0x2D, 0xFA, 0xDC
	.byte 0xF4, 0x69, 0x00, 0x2C, 0x0B, 0xD0, 0x01, 0x25, 0x00, 0x27, 0x28, 0x06, 0x00, 0x0E, 0xF1, 0x6A
	.byte 0x01, 0xF0, 0x70, 0xF8, 0x27, 0x70, 0x01, 0x35, 0x40, 0x34, 0x04, 0x2D, 0xF5, 0xDD, 0x03, 0x48
	.byte 0x30, 0x60, 0xF0, 0xBC, 0x01, 0xBC, 0x00, 0x47, 0xF0, 0x7F, 0x00, 0x03, 0x53, 0x6D, 0x73, 0x68

	THUMB_FUNC_START sub_80D0800
sub_80D0800: @ 0x080D0800
	push {lr}
	sub sp, #4
	ldr r0, _080D0860 @ 0x03007FF0
	ldr r2, [r0]
	ldr r1, [r2]
	ldr r3, _080D0864 @ 0x978C92AD
	adds r0, r1, r3
	cmp r0, #1
	bhi _080D0858
	adds r0, r1, #0
	adds r0, #0xa
	str r0, [r2]
	ldr r1, _080D0868 @ 0x040000C4
	ldr r0, [r1]
	movs r3, #0x80
	lsls r3, r3, #0x12
	ands r0, r3
	cmp r0, #0
	beq _080D082A
	ldr r0, _080D086C @ 0x84400004
	str r0, [r1]
_080D082A:
	ldr r1, _080D0870 @ 0x040000D0
	ldr r0, [r1]
	ands r0, r3
	cmp r0, #0
	beq _080D0838
	ldr r0, _080D086C @ 0x84400004
	str r0, [r1]
_080D0838:
	ldr r0, _080D0874 @ 0x040000C6
	movs r3, #0x80
	lsls r3, r3, #3
	adds r1, r3, #0
	strh r1, [r0]
	adds r0, #0xc
	strh r1, [r0]
	movs r0, #0
	str r0, [sp]
	movs r0, #0xd4
	lsls r0, r0, #2
	adds r1, r2, r0
	ldr r2, _080D0878 @ 0x05000318
	mov r0, sp
	bl CpuSet
_080D0858:
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_080D0860: .4byte 0x03007FF0
_080D0864: .4byte 0x978C92AD
_080D0868: .4byte 0x040000C4
_080D086C: .4byte 0x84400004
_080D0870: .4byte 0x040000D0
_080D0874: .4byte 0x040000C6
_080D0878: .4byte 0x05000318

	THUMB_FUNC_START sub_80D087C
sub_80D087C: @ 0x080D087C
	push {r4, lr}
	ldr r0, _080D08AC @ 0x03007FF0
	ldr r2, [r0]
	ldr r3, [r2]
	ldr r0, _080D08B0 @ 0x68736D53
	cmp r3, r0
	beq _080D08A4
	ldr r0, _080D08B4 @ 0x040000C6
	movs r4, #0xb6
	lsls r4, r4, #8
	adds r1, r4, #0
	strh r1, [r0]
	adds r0, #0xc
	strh r1, [r0]
	ldrb r0, [r2, #4]
	movs r0, #0
	strb r0, [r2, #4]
	adds r0, r3, #0
	subs r0, #0xa
	str r0, [r2]
_080D08A4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080D08AC: .4byte 0x03007FF0
_080D08B0: .4byte 0x68736D53
_080D08B4: .4byte 0x040000C6

	THUMB_FUNC_START sub_80D08B8
sub_80D08B8: @ 0x080D08B8
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r6, r1, #0
	lsls r2, r2, #0x18
	lsrs r4, r2, #0x18
	cmp r4, #0
	beq _080D091C
	cmp r4, #0x10
	bls _080D08CC
	movs r4, #0x10
_080D08CC:
	ldr r0, _080D0924 @ 0x03007FF0
	ldr r5, [r0]
	ldr r1, [r5]
	ldr r0, _080D0928 @ 0x68736D53
	cmp r1, r0
	bne _080D091C
	adds r0, r1, #1
	str r0, [r5]
	adds r0, r7, #0
	bl sub_80D0564
	str r6, [r7, #0x2c]
	strb r4, [r7, #8]
	movs r0, #0x80
	lsls r0, r0, #0x18
	str r0, [r7, #4]
	cmp r4, #0
	beq _080D0900
	movs r1, #0
_080D08F2:
	strb r1, [r6]
	subs r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r6, #0x50
	cmp r4, #0
	bne _080D08F2
_080D0900:
	ldr r0, [r5, #0x20]
	cmp r0, #0
	beq _080D0910
	str r0, [r7, #0x38]
	ldr r0, [r5, #0x24]
	str r0, [r7, #0x3c]
	movs r0, #0
	str r0, [r5, #0x20]
_080D0910:
	str r7, [r5, #0x24]
	ldr r0, _080D092C @ 0x080CFB69
	str r0, [r5, #0x20]
	ldr r0, _080D0928 @ 0x68736D53
	str r0, [r5]
	str r0, [r7, #0x34]
_080D091C:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080D0924: .4byte 0x03007FF0
_080D0928: .4byte 0x68736D53
_080D092C: .4byte 0x080CFB69

	THUMB_FUNC_START sub_80D0930
sub_80D0930: @ 0x080D0930
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	adds r7, r1, #0
	ldr r1, [r5, #0x34]
	ldr r0, _080D0A10 @ 0x68736D53
	cmp r1, r0
	bne _080D0A06
	ldrb r0, [r5, #0xb]
	ldrb r2, [r7, #2]
	cmp r0, #0
	beq _080D0972
	ldr r0, [r5]
	cmp r0, #0
	beq _080D095C
	ldr r1, [r5, #0x2c]
	movs r0, #0x40
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _080D0968
_080D095C:
	ldr r1, [r5, #4]
	ldrh r0, [r5, #4]
	cmp r0, #0
	beq _080D0972
	cmp r1, #0
	blt _080D0972
_080D0968:
	ldrb r0, [r7, #2]
	adds r2, r0, #0
	ldrb r0, [r5, #9]
	cmp r0, r2
	bhi _080D0A06
_080D0972:
	ldr r0, [r5, #0x34]
	adds r0, #1
	str r0, [r5, #0x34]
	movs r1, #0
	str r1, [r5, #4]
	str r7, [r5]
	ldr r0, [r7, #4]
	str r0, [r5, #0x30]
	strb r2, [r5, #9]
	str r1, [r5, #0xc]
	movs r0, #0x96
	strh r0, [r5, #0x1c]
	strh r0, [r5, #0x20]
	adds r0, #0x6a
	strh r0, [r5, #0x1e]
	strh r1, [r5, #0x22]
	strh r1, [r5, #0x24]
	movs r6, #0
	ldr r4, [r5, #0x2c]
	ldrb r1, [r7]
	cmp r6, r1
	bge _080D09D2
	ldrb r0, [r5, #8]
	cmp r6, r0
	bge _080D09F2
	mov r8, r6
_080D09A6:
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_80CFDD0
	movs r0, #0xc0
	strb r0, [r4]
	mov r1, r8
	str r1, [r4, #0x20]
	lsls r1, r6, #2
	adds r0, r7, #0
	adds r0, #8
	adds r0, r0, r1
	ldr r0, [r0]
	str r0, [r4, #0x40]
	adds r6, #1
	adds r4, #0x50
	ldrb r0, [r7]
	cmp r6, r0
	bge _080D09D2
	ldrb r1, [r5, #8]
	cmp r6, r1
	blt _080D09A6
_080D09D2:
	ldrb r0, [r5, #8]
	cmp r6, r0
	bge _080D09F2
	movs r1, #0
	mov r8, r1
_080D09DC:
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_80CFDD0
	mov r0, r8
	strb r0, [r4]
	adds r6, #1
	adds r4, #0x50
	ldrb r1, [r5, #8]
	cmp r6, r1
	blt _080D09DC
_080D09F2:
	movs r0, #0x80
	ldrb r1, [r7, #3]
	ands r0, r1
	cmp r0, #0
	beq _080D0A02
	ldrb r0, [r7, #3]
	bl sub_80D0714
_080D0A02:
	ldr r0, _080D0A10 @ 0x68736D53
	str r0, [r5, #0x34]
_080D0A06:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080D0A10: .4byte 0x68736D53

	THUMB_FUNC_START sub_80D0A14
sub_80D0A14: @ 0x080D0A14
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r1, [r6, #0x34]
	ldr r0, _080D0A50 @ 0x68736D53
	cmp r1, r0
	bne _080D0A4A
	adds r0, r1, #1
	str r0, [r6, #0x34]
	ldr r0, [r6, #4]
	movs r1, #0x80
	lsls r1, r1, #0x18
	orrs r0, r1
	str r0, [r6, #4]
	ldrb r4, [r6, #8]
	ldr r5, [r6, #0x2c]
	cmp r4, #0
	ble _080D0A46
_080D0A36:
	adds r0, r6, #0
	adds r1, r5, #0
	bl sub_80CFDD0
	subs r4, #1
	adds r5, #0x50
	cmp r4, #0
	bgt _080D0A36
_080D0A46:
	ldr r0, _080D0A50 @ 0x68736D53
	str r0, [r6, #0x34]
_080D0A4A:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080D0A50: .4byte 0x68736D53

	THUMB_FUNC_START sub_80D0A54
sub_80D0A54: @ 0x080D0A54
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	ldrh r1, [r6, #0x24]
	cmp r1, #0
	beq _080D0B16
	ldrh r0, [r6, #0x26]
	subs r0, #1
	strh r0, [r6, #0x26]
	ldr r3, _080D0A94 @ 0x0000FFFF
	adds r2, r3, #0
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #0
	bne _080D0B16
	strh r1, [r6, #0x26]
	ldrh r1, [r6, #0x28]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080D0A98
	adds r0, r1, #0
	adds r0, #0x10
	strh r0, [r6, #0x28]
	ands r0, r2
	cmp r0, #0xff
	bls _080D0AEA
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r6, #0x28]
	strh r3, [r6, #0x24]
	b _080D0AEA
	.align 2, 0
_080D0A94: .4byte 0x0000FFFF
_080D0A98:
	adds r0, r1, #0
	subs r0, #0x10
	strh r0, [r6, #0x28]
	ands r0, r2
	lsls r0, r0, #0x10
	cmp r0, #0
	bgt _080D0AEA
	ldrb r5, [r6, #8]
	ldr r4, [r6, #0x2c]
	cmp r5, #0
	ble _080D0ACA
_080D0AAE:
	adds r0, r6, #0
	adds r1, r4, #0
	bl sub_80CFDD0
	movs r0, #1
	ldrh r7, [r6, #0x28]
	ands r0, r7
	cmp r0, #0
	bne _080D0AC2
	strb r0, [r4]
_080D0AC2:
	subs r5, #1
	adds r4, #0x50
	cmp r5, #0
	bgt _080D0AAE
_080D0ACA:
	movs r0, #1
	ldrh r1, [r6, #0x28]
	ands r0, r1
	cmp r0, #0
	beq _080D0ADE
	ldr r0, [r6, #4]
	movs r1, #0x80
	lsls r1, r1, #0x18
	orrs r0, r1
	b _080D0AE2
_080D0ADE:
	movs r0, #0x80
	lsls r0, r0, #0x18
_080D0AE2:
	str r0, [r6, #4]
	movs r0, #0
	strh r0, [r6, #0x24]
	b _080D0B16
_080D0AEA:
	ldrb r5, [r6, #8]
	ldr r4, [r6, #0x2c]
	cmp r5, #0
	ble _080D0B16
	movs r3, #0x80
	movs r7, #0
	movs r2, #3
_080D0AF8:
	ldrb r1, [r4]
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	beq _080D0B0E
	ldrh r7, [r6, #0x28]
	lsrs r0, r7, #2
	strb r0, [r4, #0x13]
	adds r0, r1, #0
	orrs r0, r2
	strb r0, [r4]
_080D0B0E:
	subs r5, #1
	adds r4, #0x50
	cmp r5, #0
	bgt _080D0AF8
_080D0B16:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_START sub_80D0B1C
sub_80D0B1C: @ 0x080D0B1C
	push {r4, lr}
	adds r2, r1, #0
	movs r0, #1
	ldrb r1, [r2]
	ands r0, r1
	cmp r0, #0
	beq _080D0B80
	ldrb r3, [r2, #0x13]
	ldrb r1, [r2, #0x12]
	adds r0, r3, #0
	muls r0, r1, r0
	lsrs r3, r0, #5
	ldrb r4, [r2, #0x18]
	cmp r4, #1
	bne _080D0B44
	movs r0, #0x16
	ldrsb r0, [r2, r0]
	adds r0, #0x80
	muls r0, r3, r0
	lsrs r3, r0, #7
_080D0B44:
	movs r0, #0x14
	ldrsb r0, [r2, r0]
	lsls r0, r0, #1
	movs r1, #0x15
	ldrsb r1, [r2, r1]
	adds r1, r0, r1
	cmp r4, #2
	bne _080D0B5A
	movs r0, #0x16
	ldrsb r0, [r2, r0]
	adds r1, r1, r0
_080D0B5A:
	movs r0, #0x80
	rsbs r0, r0, #0
	cmp r1, r0
	bge _080D0B66
	adds r1, r0, #0
	b _080D0B6C
_080D0B66:
	cmp r1, #0x7f
	ble _080D0B6C
	movs r1, #0x7f
_080D0B6C:
	adds r0, r1, #0
	adds r0, #0x80
	muls r0, r3, r0
	lsrs r0, r0, #8
	strb r0, [r2, #0x10]
	movs r0, #0x7f
	subs r0, r0, r1
	muls r0, r3, r0
	lsrs r0, r0, #8
	strb r0, [r2, #0x11]
_080D0B80:
	ldrb r1, [r2]
	movs r0, #4
	ands r0, r1
	adds r3, r1, #0
	cmp r0, #0
	beq _080D0BC4
	movs r0, #0xe
	ldrsb r0, [r2, r0]
	ldrb r1, [r2, #0xf]
	muls r0, r1, r0
	movs r1, #0xc
	ldrsb r1, [r2, r1]
	adds r1, r1, r0
	lsls r1, r1, #2
	movs r0, #0xa
	ldrsb r0, [r2, r0]
	lsls r0, r0, #8
	adds r1, r1, r0
	movs r0, #0xb
	ldrsb r0, [r2, r0]
	lsls r0, r0, #8
	adds r1, r1, r0
	ldrb r0, [r2, #0xd]
	adds r1, r0, r1
	ldrb r0, [r2, #0x18]
	cmp r0, #0
	bne _080D0BBE
	movs r0, #0x16
	ldrsb r0, [r2, r0]
	lsls r0, r0, #4
	adds r1, r1, r0
_080D0BBE:
	asrs r0, r1, #8
	strb r0, [r2, #8]
	strb r1, [r2, #9]
_080D0BC4:
	movs r0, #0xfa
	ands r0, r3
	strb r0, [r2]
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_START sub_80D0BD0
sub_80D0BD0: @ 0x080D0BD0
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r5, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	mov ip, r2
	cmp r0, #4
	bne _080D0C08
	cmp r5, #0x14
	bhi _080D0BEC
	movs r5, #0
	b _080D0BFA
_080D0BEC:
	adds r0, r5, #0
	subs r0, #0x15
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #0x3b
	bls _080D0BFA
	movs r5, #0x3b
_080D0BFA:
	ldr r0, _080D0C04 @ 0x082073B8
	adds r0, r5, r0
	ldrb r0, [r0]
	b _080D0C6A
	.align 2, 0
_080D0C04: .4byte 0x082073B8
_080D0C08:
	cmp r5, #0x23
	bhi _080D0C14
	movs r0, #0
	mov ip, r0
	movs r5, #0
	b _080D0C26
_080D0C14:
	adds r0, r5, #0
	subs r0, #0x24
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #0x82
	bls _080D0C26
	movs r5, #0x82
	movs r1, #0xff
	mov ip, r1
_080D0C26:
	ldr r3, _080D0C70 @ 0x0820731C
	adds r0, r5, r3
	ldrb r6, [r0]
	ldr r4, _080D0C74 @ 0x082073A0
	movs r2, #0xf
	adds r0, r6, #0
	ands r0, r2
	lsls r0, r0, #1
	adds r0, r0, r4
	movs r7, #0
	ldrsh r1, [r0, r7]
	asrs r0, r6, #4
	adds r6, r1, #0
	asrs r6, r0
	adds r0, r5, #1
	adds r0, r0, r3
	ldrb r1, [r0]
	adds r0, r1, #0
	ands r0, r2
	lsls r0, r0, #1
	adds r0, r0, r4
	movs r2, #0
	ldrsh r0, [r0, r2]
	asrs r1, r1, #4
	asrs r0, r1
	subs r0, r0, r6
	mov r7, ip
	muls r7, r0, r7
	adds r0, r7, #0
	asrs r0, r0, #8
	adds r0, r6, r0
	movs r1, #0x80
	lsls r1, r1, #4
	adds r0, r0, r1
_080D0C6A:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080D0C70: .4byte 0x0820731C
_080D0C74: .4byte 0x082073A0

	THUMB_FUNC_START sub_80D0C78
sub_80D0C78: @ 0x080D0C78
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r1, r0, #0
	cmp r0, #2
	beq _080D0CA0
	cmp r0, #2
	bgt _080D0C8C
	cmp r0, #1
	beq _080D0C92
	b _080D0CB4
_080D0C8C:
	cmp r1, #3
	beq _080D0CA8
	b _080D0CB4
_080D0C92:
	ldr r1, _080D0C9C @ 0x04000063
	movs r0, #8
	strb r0, [r1]
	adds r1, #2
	b _080D0CBC
	.align 2, 0
_080D0C9C: .4byte 0x04000063
_080D0CA0:
	ldr r1, _080D0CA4 @ 0x04000069
	b _080D0CB6
	.align 2, 0
_080D0CA4: .4byte 0x04000069
_080D0CA8:
	ldr r1, _080D0CB0 @ 0x04000070
	movs r0, #0
	b _080D0CBE
	.align 2, 0
_080D0CB0: .4byte 0x04000070
_080D0CB4:
	ldr r1, _080D0CC4 @ 0x04000079
_080D0CB6:
	movs r0, #8
	strb r0, [r1]
	adds r1, #4
_080D0CBC:
	movs r0, #0x80
_080D0CBE:
	strb r0, [r1]
	bx lr
	.align 2, 0
_080D0CC4: .4byte 0x04000079

	THUMB_FUNC_START sub_80D0CC8
sub_80D0CC8: @ 0x080D0CC8
	push {r4, lr}
	adds r1, r0, #0
	ldrb r0, [r1, #2]
	lsls r2, r0, #0x18
	lsrs r4, r2, #0x18
	ldrb r3, [r1, #3]
	lsls r0, r3, #0x18
	lsrs r3, r0, #0x18
	cmp r4, r3
	blo _080D0CE8
	lsrs r0, r2, #0x19
	cmp r0, r3
	blo _080D0CF4
	movs r0, #0xf
	strb r0, [r1, #0x1b]
	b _080D0D02
_080D0CE8:
	lsrs r0, r0, #0x19
	cmp r0, r4
	blo _080D0CF4
	movs r0, #0xf0
	strb r0, [r1, #0x1b]
	b _080D0D02
_080D0CF4:
	movs r0, #0xff
	strb r0, [r1, #0x1b]
	ldrb r2, [r1, #3]
	ldrb r3, [r1, #2]
	adds r0, r2, r3
	lsrs r0, r0, #4
	b _080D0D12
_080D0D02:
	ldrb r2, [r1, #3]
	ldrb r3, [r1, #2]
	adds r0, r2, r3
	lsrs r0, r0, #4
	strb r0, [r1, #0xa]
	cmp r0, #0xf
	bls _080D0D14
	movs r0, #0xf
_080D0D12:
	strb r0, [r1, #0xa]
_080D0D14:
	ldrb r2, [r1, #6]
	ldrb r3, [r1, #0xa]
	adds r0, r2, #0
	muls r0, r3, r0
	adds r0, #0xf
	asrs r0, r0, #4
	strb r0, [r1, #0x19]
	ldrb r0, [r1, #0x1c]
	ldrb r2, [r1, #0x1b]
	ands r0, r2
	strb r0, [r1, #0x1b]
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_START sub_80D0D30
sub_80D0D30: @ 0x080D0D30
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x1c
	ldr r0, _080D0D50 @ 0x03007FF0
	ldr r0, [r0]
	str r0, [sp, #4]
	ldrb r0, [r0, #0xa]
	cmp r0, #0
	beq _080D0D54
	subs r0, #1
	ldr r1, [sp, #4]
	strb r0, [r1, #0xa]
	b _080D0D5A
	.align 2, 0
_080D0D50: .4byte 0x03007FF0
_080D0D54:
	movs r0, #0xe
	ldr r2, [sp, #4]
	strb r0, [r2, #0xa]
_080D0D5A:
	movs r6, #1
	ldr r0, [sp, #4]
	ldr r4, [r0, #0x1c]
_080D0D60:
	ldrb r1, [r4]
	movs r0, #0xc7
	ands r0, r1
	adds r2, r6, #1
	mov sl, r2
	movs r2, #0x40
	adds r2, r2, r4
	mov sb, r2
	cmp r0, #0
	bne _080D0D76
	b _080D1160
_080D0D76:
	cmp r6, #2
	beq _080D0DA8
	cmp r6, #2
	bgt _080D0D84
	cmp r6, #1
	beq _080D0D8A
	b _080D0DE0
_080D0D84:
	cmp r6, #3
	beq _080D0DC0
	b _080D0DE0
_080D0D8A:
	ldr r0, _080D0D9C @ 0x04000060
	str r0, [sp, #8]
	ldr r7, _080D0DA0 @ 0x04000062
	ldr r2, _080D0DA4 @ 0x04000063
	str r2, [sp, #0xc]
	adds r0, #4
	str r0, [sp, #0x10]
	adds r2, #2
	b _080D0DF0
	.align 2, 0
_080D0D9C: .4byte 0x04000060
_080D0DA0: .4byte 0x04000062
_080D0DA4: .4byte 0x04000063
_080D0DA8:
	ldr r0, _080D0DB4 @ 0x04000061
	str r0, [sp, #8]
	ldr r7, _080D0DB8 @ 0x04000068
	ldr r2, _080D0DBC @ 0x04000069
	b _080D0DE8
	.align 2, 0
_080D0DB4: .4byte 0x04000061
_080D0DB8: .4byte 0x04000068
_080D0DBC: .4byte 0x04000069
_080D0DC0:
	ldr r0, _080D0DD4 @ 0x04000070
	str r0, [sp, #8]
	ldr r7, _080D0DD8 @ 0x04000072
	ldr r2, _080D0DDC @ 0x04000073
	str r2, [sp, #0xc]
	adds r0, #4
	str r0, [sp, #0x10]
	adds r2, #2
	b _080D0DF0
	.align 2, 0
_080D0DD4: .4byte 0x04000070
_080D0DD8: .4byte 0x04000072
_080D0DDC: .4byte 0x04000073
_080D0DE0:
	ldr r0, _080D0E40 @ 0x04000071
	str r0, [sp, #8]
	ldr r7, _080D0E44 @ 0x04000078
	ldr r2, _080D0E48 @ 0x04000079
_080D0DE8:
	str r2, [sp, #0xc]
	adds r0, #0xb
	str r0, [sp, #0x10]
	adds r2, #4
_080D0DF0:
	str r2, [sp, #0x14]
	ldr r0, [sp, #4]
	ldrb r0, [r0, #0xa]
	str r0, [sp]
	ldr r2, [sp, #0xc]
	ldrb r0, [r2]
	mov r8, r0
	adds r2, r1, #0
	movs r0, #0x80
	ands r0, r2
	cmp r0, #0
	beq _080D0EE6
	movs r3, #0x40
	adds r0, r3, #0
	ands r0, r2
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	adds r0, r6, #1
	mov sl, r0
	movs r1, #0x40
	adds r1, r1, r4
	mov sb, r1
	cmp r5, #0
	bne _080D0F0A
	movs r0, #3
	strb r0, [r4]
	strb r0, [r4, #0x1d]
	adds r0, r4, #0
	str r3, [sp, #0x18]
	bl sub_80D0CC8
	ldr r3, [sp, #0x18]
	cmp r6, #2
	beq _080D0E58
	cmp r6, #2
	bgt _080D0E4C
	cmp r6, #1
	beq _080D0E52
	b _080D0EAC
	.align 2, 0
_080D0E40: .4byte 0x04000071
_080D0E44: .4byte 0x04000078
_080D0E48: .4byte 0x04000079
_080D0E4C:
	cmp r6, #3
	beq _080D0E64
	b _080D0EAC
_080D0E52:
	ldrb r0, [r4, #0x1f]
	ldr r2, [sp, #8]
	strb r0, [r2]
_080D0E58:
	ldr r0, [r4, #0x24]
	lsls r0, r0, #6
	ldrb r1, [r4, #0x1e]
	adds r0, r1, r0
	strb r0, [r7]
	b _080D0EB8
_080D0E64:
	ldr r1, [r4, #0x24]
	ldr r0, [r4, #0x28]
	cmp r1, r0
	beq _080D0E8C
	ldr r2, [sp, #8]
	strb r3, [r2]
	ldr r1, _080D0EA0 @ 0x04000090
	ldr r2, [r4, #0x24]
	ldr r0, [r2]
	str r0, [r1]
	adds r1, #4
	ldr r0, [r2, #4]
	str r0, [r1]
	adds r1, #4
	ldr r0, [r2, #8]
	str r0, [r1]
	adds r1, #4
	ldr r0, [r2, #0xc]
	str r0, [r1]
	str r2, [r4, #0x28]
_080D0E8C:
	ldr r0, [sp, #8]
	strb r5, [r0]
	ldrb r0, [r4, #0x1e]
	strb r0, [r7]
	ldrb r0, [r4, #0x1e]
	cmp r0, #0
	beq _080D0EA4
	movs r0, #0xc0
	b _080D0EC6
	.align 2, 0
_080D0EA0: .4byte 0x04000090
_080D0EA4:
	movs r1, #0x80
	rsbs r1, r1, #0
	strb r1, [r4, #0x1a]
	b _080D0EC8
_080D0EAC:
	ldrb r0, [r4, #0x1e]
	strb r0, [r7]
	ldr r0, [r4, #0x24]
	lsls r0, r0, #3
	ldr r2, [sp, #0x10]
	strb r0, [r2]
_080D0EB8:
	ldrb r0, [r4, #4]
	adds r0, #8
	mov r8, r0
	ldrb r0, [r4, #0x1e]
	cmp r0, #0
	beq _080D0EC6
	movs r0, #0x40
_080D0EC6:
	strb r0, [r4, #0x1a]
_080D0EC8:
	ldrb r1, [r4, #4]
	movs r2, #0
	strb r1, [r4, #0xb]
	movs r0, #0xff
	ands r0, r1
	adds r1, r6, #1
	mov sl, r1
	movs r1, #0x40
	adds r1, r1, r4
	mov sb, r1
	cmp r0, #0
	bne _080D0EE2
	b _080D101E
_080D0EE2:
	strb r2, [r4, #9]
	b _080D104C
_080D0EE6:
	movs r0, #4
	ands r0, r2
	cmp r0, #0
	beq _080D0F18
	ldrb r0, [r4, #0xd]
	subs r0, #1
	strb r0, [r4, #0xd]
	movs r2, #0xff
	ands r0, r2
	lsls r0, r0, #0x18
	adds r1, r6, #1
	mov sl, r1
	movs r2, #0x40
	adds r2, r2, r4
	mov sb, r2
	cmp r0, #0
	ble _080D0F0A
	b _080D105E
_080D0F0A:
	lsls r0, r6, #0x18
	lsrs r0, r0, #0x18
	bl sub_80D0C78
	movs r0, #0
	strb r0, [r4]
	b _080D115C
_080D0F18:
	movs r0, #0x40
	ands r0, r1
	adds r2, r6, #1
	mov sl, r2
	movs r2, #0x40
	adds r2, r2, r4
	mov sb, r2
	cmp r0, #0
	beq _080D0F58
	movs r0, #3
	ands r0, r1
	cmp r0, #0
	beq _080D0F58
	movs r0, #0xfc
	ands r0, r1
	movs r2, #0
	strb r0, [r4]
	ldrb r1, [r4, #7]
	strb r1, [r4, #0xb]
	movs r0, #0xff
	ands r0, r1
	cmp r0, #0
	beq _080D0F8A
	movs r0, #1
	ldrb r1, [r4, #0x1d]
	orrs r0, r1
	strb r0, [r4, #0x1d]
	cmp r6, #3
	beq _080D104C
	ldrb r2, [r4, #7]
	mov r8, r2
	b _080D104C
_080D0F58:
	ldrb r0, [r4, #0xb]
	cmp r0, #0
	bne _080D104C
	cmp r6, #3
	bne _080D0F6A
	movs r0, #1
	ldrb r1, [r4, #0x1d]
	orrs r0, r1
	strb r0, [r4, #0x1d]
_080D0F6A:
	adds r0, r4, #0
	bl sub_80D0CC8
	movs r0, #3
	ldrb r2, [r4]
	ands r0, r2
	cmp r0, #0
	bne _080D0FBE
	ldrb r0, [r4, #9]
	subs r0, #1
	strb r0, [r4, #9]
	movs r1, #0xff
	ands r0, r1
	lsls r0, r0, #0x18
	cmp r0, #0
	bgt _080D0FBA
_080D0F8A:
	ldrb r2, [r4, #0xc]
	ldrb r1, [r4, #0xa]
	adds r0, r2, #0
	muls r0, r1, r0
	adds r0, #0xff
	asrs r0, r0, #8
	movs r1, #0
	strb r0, [r4, #9]
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080D0F0A
	movs r0, #4
	ldrb r2, [r4]
	orrs r0, r2
	strb r0, [r4]
	movs r0, #1
	ldrb r1, [r4, #0x1d]
	orrs r0, r1
	strb r0, [r4, #0x1d]
	cmp r6, #3
	beq _080D105E
	movs r2, #8
	mov r8, r2
	b _080D105E
_080D0FBA:
	ldrb r0, [r4, #7]
	b _080D104A
_080D0FBE:
	cmp r0, #1
	bne _080D0FCA
_080D0FC2:
	ldrb r0, [r4, #0x19]
	strb r0, [r4, #9]
	movs r0, #7
	b _080D104A
_080D0FCA:
	cmp r0, #2
	bne _080D100E
	ldrb r0, [r4, #9]
	subs r0, #1
	strb r0, [r4, #9]
	movs r1, #0xff
	ands r0, r1
	lsls r0, r0, #0x18
	ldrb r2, [r4, #0x19]
	lsls r1, r2, #0x18
	cmp r0, r1
	bgt _080D100A
_080D0FE2:
	ldrb r0, [r4, #6]
	cmp r0, #0
	bne _080D0FF2
	movs r0, #0xfc
	ldrb r1, [r4]
	ands r0, r1
	strb r0, [r4]
	b _080D0F8A
_080D0FF2:
	ldrb r0, [r4]
	subs r0, #1
	strb r0, [r4]
	movs r0, #1
	ldrb r2, [r4, #0x1d]
	orrs r0, r2
	strb r0, [r4, #0x1d]
	cmp r6, #3
	beq _080D0FC2
	movs r0, #8
	mov r8, r0
	b _080D0FC2
_080D100A:
	ldrb r0, [r4, #5]
	b _080D104A
_080D100E:
	ldrb r0, [r4, #9]
	adds r0, #1
	strb r0, [r4, #9]
	movs r1, #0xff
	ands r0, r1
	ldrb r2, [r4, #0xa]
	cmp r0, r2
	blo _080D1048
_080D101E:
	ldrb r0, [r4]
	subs r0, #1
	movs r2, #0
	strb r0, [r4]
	ldrb r1, [r4, #5]
	strb r1, [r4, #0xb]
	movs r0, #0xff
	ands r0, r1
	cmp r0, #0
	beq _080D0FE2
	movs r0, #1
	ldrb r1, [r4, #0x1d]
	orrs r0, r1
	strb r0, [r4, #0x1d]
	ldrb r0, [r4, #0xa]
	strb r0, [r4, #9]
	cmp r6, #3
	beq _080D104C
	ldrb r2, [r4, #5]
	mov r8, r2
	b _080D104C
_080D1048:
	ldrb r0, [r4, #4]
_080D104A:
	strb r0, [r4, #0xb]
_080D104C:
	ldrb r0, [r4, #0xb]
	subs r0, #1
	strb r0, [r4, #0xb]
	ldr r0, [sp]
	cmp r0, #0
	bne _080D105E
	subs r0, #1
	str r0, [sp]
	b _080D0F58
_080D105E:
	movs r0, #2
	ldrb r1, [r4, #0x1d]
	ands r0, r1
	cmp r0, #0
	beq _080D10D6
	cmp r6, #3
	bgt _080D109E
	movs r0, #8
	ldrb r2, [r4, #1]
	ands r0, r2
	cmp r0, #0
	beq _080D109E
	ldr r0, _080D1088 @ 0x04000089
	ldrb r0, [r0]
	cmp r0, #0x3f
	bgt _080D1090
	ldr r0, [r4, #0x20]
	adds r0, #2
	ldr r1, _080D108C @ 0x000007FC
	b _080D109A
	.align 2, 0
_080D1088: .4byte 0x04000089
_080D108C: .4byte 0x000007FC
_080D1090:
	cmp r0, #0x7f
	bgt _080D109E
	ldr r0, [r4, #0x20]
	adds r0, #1
	ldr r1, _080D10AC @ 0x000007FE
_080D109A:
	ands r0, r1
	str r0, [r4, #0x20]
_080D109E:
	cmp r6, #4
	beq _080D10B0
	ldr r0, [r4, #0x20]
	ldr r1, [sp, #0x10]
	strb r0, [r1]
	b _080D10BE
	.align 2, 0
_080D10AC: .4byte 0x000007FE
_080D10B0:
	ldr r2, [sp, #0x10]
	ldrb r0, [r2]
	movs r1, #8
	ands r1, r0
	ldr r0, [r4, #0x20]
	orrs r0, r1
	strb r0, [r2]
_080D10BE:
	movs r0, #0xc0
	ldrb r1, [r4, #0x1a]
	ands r0, r1
	adds r1, r4, #0
	adds r1, #0x21
	ldrb r1, [r1]
	adds r0, r1, r0
	strb r0, [r4, #0x1a]
	movs r2, #0xff
	ands r0, r2
	ldr r1, [sp, #0x14]
	strb r0, [r1]
_080D10D6:
	movs r0, #1
	ldrb r2, [r4, #0x1d]
	ands r0, r2
	cmp r0, #0
	beq _080D115C
	ldr r1, _080D1120 @ 0x04000081
	ldrb r0, [r1]
	ldrb r2, [r4, #0x1c]
	bics r0, r2
	ldrb r2, [r4, #0x1b]
	orrs r0, r2
	strb r0, [r1]
	cmp r6, #3
	bne _080D1128
	ldr r0, _080D1124 @ 0x082073F4
	ldrb r1, [r4, #9]
	adds r0, r1, r0
	ldrb r0, [r0]
	ldr r2, [sp, #0xc]
	strb r0, [r2]
	movs r1, #0x80
	adds r0, r1, #0
	ldrb r2, [r4, #0x1a]
	ands r0, r2
	cmp r0, #0
	beq _080D115C
	ldr r0, [sp, #8]
	strb r1, [r0]
	ldrb r0, [r4, #0x1a]
	ldr r1, [sp, #0x14]
	strb r0, [r1]
	movs r0, #0x7f
	ldrb r2, [r4, #0x1a]
	ands r0, r2
	strb r0, [r4, #0x1a]
	b _080D115C
	.align 2, 0
_080D1120: .4byte 0x04000081
_080D1124: .4byte 0x082073F4
_080D1128:
	movs r0, #0xf
	mov r1, r8
	ands r1, r0
	mov r8, r1
	ldrb r2, [r4, #9]
	lsls r0, r2, #4
	add r0, r8
	ldr r1, [sp, #0xc]
	strb r0, [r1]
	movs r2, #0x80
	ldrb r0, [r4, #0x1a]
	orrs r0, r2
	ldr r1, [sp, #0x14]
	strb r0, [r1]
	cmp r6, #1
	bne _080D115C
	ldr r0, [sp, #8]
	ldrb r1, [r0]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	bne _080D115C
	ldrb r0, [r4, #0x1a]
	orrs r0, r2
	ldr r1, [sp, #0x14]
	strb r0, [r1]
_080D115C:
	movs r0, #0
	strb r0, [r4, #0x1d]
_080D1160:
	mov r6, sl
	mov r4, sb
	cmp r6, #4
	bgt _080D116A
	b _080D0D60
_080D116A:
	add sp, #0x1c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.byte 0x00, 0x00, 0x10, 0xB5, 0x02, 0x1C
	.byte 0x09, 0x04, 0x09, 0x0C, 0x53, 0x6B, 0x06, 0x48, 0x83, 0x42, 0x05, 0xD1, 0xD1, 0x83, 0x94, 0x8B
	.byte 0x08, 0x1C, 0x60, 0x43, 0x00, 0x12, 0x10, 0x84, 0x10, 0xBC, 0x01, 0xBC, 0x00, 0x47, 0x00, 0x00
	.byte 0x53, 0x6D, 0x73, 0x68

	THUMB_FUNC_START SomethingSoundRelated_80D11A4
SomethingSoundRelated_80D11A4: @ 0x080D11A4
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r4, r0, #0
	lsls r1, r1, #0x10
	lsrs r7, r1, #0x10
	lsls r6, r2, #0x10
	ldr r3, [r4, #0x34]
	ldr r0, _080D1208 @ 0x68736D53
	cmp r3, r0
	bne _080D11FC
	adds r0, r3, #1
	str r0, [r4, #0x34]
	ldrb r2, [r4, #8]
	ldr r1, [r4, #0x2c]
	movs r5, #1
	cmp r2, #0
	ble _080D11F8
	movs r0, #0x80
	mov r8, r0
	lsrs r6, r6, #0x12
	movs r0, #3
	mov ip, r0
_080D11D4:
	adds r0, r7, #0
	ands r0, r5
	cmp r0, #0
	beq _080D11EE
	ldrb r3, [r1]
	mov r0, r8
	ands r0, r3
	cmp r0, #0
	beq _080D11EE
	strb r6, [r1, #0x13]
	mov r0, ip
	orrs r0, r3
	strb r0, [r1]
_080D11EE:
	subs r2, #1
	adds r1, #0x50
	lsls r5, r5, #1
	cmp r2, #0
	bgt _080D11D4
_080D11F8:
	ldr r0, _080D1208 @ 0x68736D53
	str r0, [r4, #0x34]
_080D11FC:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080D1208: .4byte 0x68736D53
	.byte 0xF0, 0xB5, 0x57, 0x46
	.byte 0x4E, 0x46, 0x45, 0x46, 0xE0, 0xB4, 0x04, 0x1C, 0x09, 0x04, 0x09, 0x0C, 0x8C, 0x46, 0x12, 0x04
	.byte 0x16, 0x0C, 0x63, 0x6B, 0x15, 0x48, 0x83, 0x42, 0x21, 0xD1, 0x58, 0x1C, 0x60, 0x63, 0x22, 0x7A
	.byte 0xE3, 0x6A, 0x01, 0x25, 0x00, 0x2A, 0x18, 0xDD, 0x80, 0x20, 0x81, 0x46, 0x30, 0x04, 0x07, 0x16
	.byte 0x0C, 0x20, 0x80, 0x46, 0x60, 0x46, 0x28, 0x40, 0x00, 0x28, 0x09, 0xD0, 0x19, 0x78, 0x48, 0x46
	.byte 0x08, 0x40, 0x00, 0x28, 0x04, 0xD0, 0xDF, 0x72, 0x5E, 0x73, 0x40, 0x46, 0x08, 0x43, 0x18, 0x70
	.byte 0x01, 0x3A, 0x50, 0x33, 0x6D, 0x00, 0x00, 0x2A, 0xEC, 0xDC, 0x04, 0x48, 0x60, 0x63, 0x38, 0xBC
	.byte 0x98, 0x46, 0xA1, 0x46, 0xAA, 0x46, 0xF0, 0xBC, 0x01, 0xBC, 0x00, 0x47, 0x53, 0x6D, 0x73, 0x68

	THUMB_FUNC_START sub_80D1280
sub_80D1280: @ 0x080D1280
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r4, r0, #0
	lsls r1, r1, #0x10
	lsrs r7, r1, #0x10
	lsls r2, r2, #0x18
	lsrs r6, r2, #0x18
	ldr r3, [r4, #0x34]
	ldr r0, _080D12E4 @ 0x68736D53
	cmp r3, r0
	bne _080D12D8
	adds r0, r3, #1
	str r0, [r4, #0x34]
	ldrb r2, [r4, #8]
	ldr r1, [r4, #0x2c]
	movs r5, #1
	cmp r2, #0
	ble _080D12D4
	movs r0, #0x80
	mov r8, r0
	movs r0, #3
	mov ip, r0
_080D12B0:
	adds r0, r7, #0
	ands r0, r5
	cmp r0, #0
	beq _080D12CA
	ldrb r3, [r1]
	mov r0, r8
	ands r0, r3
	cmp r0, #0
	beq _080D12CA
	strb r6, [r1, #0x15]
	mov r0, ip
	orrs r0, r3
	strb r0, [r1]
_080D12CA:
	subs r2, #1
	adds r1, #0x50
	lsls r5, r5, #1
	cmp r2, #0
	bgt _080D12B0
_080D12D4:
	ldr r0, _080D12E4 @ 0x68736D53
	str r0, [r4, #0x34]
_080D12D8:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080D12E4: .4byte 0x68736D53

	THUMB_FUNC_START sub_80D12E8
sub_80D12E8: @ 0x080D12E8
	adds r1, r0, #0
	movs r2, #0
	movs r0, #0
	strb r0, [r1, #0x1a]
	strb r0, [r1, #0x16]
	ldrb r0, [r1, #0x18]
	cmp r0, #0
	bne _080D12FC
	movs r0, #0xc
	b _080D12FE
_080D12FC:
	movs r0, #3
_080D12FE:
	ldrb r2, [r1]
	orrs r0, r2
	strb r0, [r1]
	bx lr
	.byte 0x00, 0x00, 0xF0, 0xB5, 0x57, 0x46, 0x4E, 0x46, 0x45, 0x46
	.byte 0xE0, 0xB4, 0x06, 0x1C, 0x09, 0x04, 0x09, 0x0C, 0x8A, 0x46, 0x12, 0x06, 0x12, 0x0E, 0x90, 0x46
	.byte 0x71, 0x6B, 0x15, 0x48, 0x81, 0x42, 0x1F, 0xD1, 0x48, 0x1C, 0x70, 0x63, 0x35, 0x7A, 0xF4, 0x6A
	.byte 0x01, 0x27, 0x00, 0x2D, 0x16, 0xDD, 0xC1, 0x46, 0x50, 0x46, 0x38, 0x40, 0x00, 0x28, 0x0C, 0xD0
	.byte 0x80, 0x20, 0x21, 0x78, 0x08, 0x40, 0x00, 0x28, 0x07, 0xD0, 0x40, 0x46, 0xE0, 0x75, 0x49, 0x46
	.byte 0x00, 0x29, 0x02, 0xD1, 0x20, 0x1C, 0xFF, 0xF7, 0xC7, 0xFF, 0x01, 0x3D, 0x50, 0x34, 0x7F, 0x00
	.byte 0x00, 0x2D, 0xE9, 0xDC, 0x04, 0x48, 0x70, 0x63, 0x38, 0xBC, 0x98, 0x46, 0xA1, 0x46, 0xAA, 0x46
	.byte 0xF0, 0xBC, 0x01, 0xBC, 0x00, 0x47, 0x00, 0x00, 0x53, 0x6D, 0x73, 0x68, 0xF0, 0xB5, 0x57, 0x46
	.byte 0x4E, 0x46, 0x45, 0x46, 0xE0, 0xB4, 0x06, 0x1C, 0x09, 0x04, 0x09, 0x0C, 0x8A, 0x46, 0x12, 0x06
	.byte 0x12, 0x0E, 0x90, 0x46, 0x71, 0x6B, 0x15, 0x48, 0x81, 0x42, 0x1F, 0xD1, 0x48, 0x1C, 0x70, 0x63
	.byte 0x35, 0x7A, 0xF4, 0x6A, 0x01, 0x27, 0x00, 0x2D, 0x16, 0xDD, 0xC1, 0x46, 0x50, 0x46, 0x38, 0x40
	.byte 0x00, 0x28, 0x0C, 0xD0, 0x80, 0x20, 0x21, 0x78, 0x08, 0x40, 0x00, 0x28, 0x07, 0xD0, 0x40, 0x46
	.byte 0x60, 0x76, 0x49, 0x46, 0x00, 0x29, 0x02, 0xD1, 0x20, 0x1C, 0xFF, 0xF7, 0x8D, 0xFF, 0x01, 0x3D
	.byte 0x50, 0x34, 0x7F, 0x00, 0x00, 0x2D, 0xE9, 0xDC, 0x04, 0x48, 0x70, 0x63, 0x38, 0xBC, 0x98, 0x46
	.byte 0xA1, 0x46, 0xAA, 0x46, 0xF0, 0xBC, 0x01, 0xBC, 0x00, 0x47, 0x00, 0x00, 0x53, 0x6D, 0x73, 0x68

	THUMB_FUNC_START sub_80D13F0
sub_80D13F0: @ 0x080D13F0
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r6, r1, #0
	ldr r1, [r6, #0x40]
	ldrb r5, [r1]
	adds r2, r1, #1
	str r2, [r6, #0x40]
	ldr r0, [r4, #0x18]
	ldrb r1, [r1, #1]
	adds r3, r1, r0
	adds r0, r2, #1
	str r0, [r6, #0x40]
	ldrb r2, [r2, #1]
	adds r0, #1
	str r0, [r6, #0x40]
	cmp r5, #0x11
	bls _080D1414
	b _080D1542
_080D1414:
	lsls r0, r5, #2
	ldr r1, _080D1420 @ 0x080D1424
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080D1420: .4byte 0x080D1424
_080D1424: @ jump table
	.4byte _080D146C @ case 0
	.4byte _080D1470 @ case 1
	.4byte _080D1478 @ case 2
	.4byte _080D1480 @ case 3
	.4byte _080D148A @ case 4
	.4byte _080D1498 @ case 5
	.4byte _080D14A6 @ case 6
	.4byte _080D14AE @ case 7
	.4byte _080D14B6 @ case 8
	.4byte _080D14BE @ case 9
	.4byte _080D14C6 @ case 10
	.4byte _080D14CE @ case 11
	.4byte _080D14D6 @ case 12
	.4byte _080D14E4 @ case 13
	.4byte _080D14F2 @ case 14
	.4byte _080D1500 @ case 15
	.4byte _080D150E @ case 16
	.4byte _080D151C @ case 17
_080D146C:
	strb r2, [r3]
	b _080D1542
_080D1470:
	ldrb r1, [r3]
	adds r0, r1, r2
	strb r0, [r3]
	b _080D1542
_080D1478:
	ldrb r1, [r3]
	subs r0, r1, r2
	strb r0, [r3]
	b _080D1542
_080D1480:
	ldr r0, [r4, #0x18]
	adds r0, r0, r2
	ldrb r0, [r0]
	strb r0, [r3]
	b _080D1542
_080D148A:
	ldr r0, [r4, #0x18]
	adds r0, r0, r2
	ldrb r1, [r3]
	ldrb r0, [r0]
	adds r0, r1, r0
	strb r0, [r3]
	b _080D1542
_080D1498:
	ldr r0, [r4, #0x18]
	adds r0, r0, r2
	ldrb r1, [r3]
	ldrb r0, [r0]
	subs r0, r1, r0
	strb r0, [r3]
	b _080D1542
_080D14A6:
	ldrb r3, [r3]
	cmp r3, r2
	beq _080D1528
	b _080D153C
_080D14AE:
	ldrb r3, [r3]
	cmp r3, r2
	bne _080D1528
	b _080D153C
_080D14B6:
	ldrb r3, [r3]
	cmp r3, r2
	bhi _080D1528
	b _080D153C
_080D14BE:
	ldrb r3, [r3]
	cmp r3, r2
	bhs _080D1528
	b _080D153C
_080D14C6:
	ldrb r3, [r3]
	cmp r3, r2
	bls _080D1528
	b _080D153C
_080D14CE:
	ldrb r3, [r3]
	cmp r3, r2
	blo _080D1528
	b _080D153C
_080D14D6:
	ldr r0, [r4, #0x18]
	adds r0, r0, r2
	ldrb r3, [r3]
	ldrb r0, [r0]
	cmp r3, r0
	beq _080D1528
	b _080D153C
_080D14E4:
	ldr r0, [r4, #0x18]
	adds r0, r0, r2
	ldrb r3, [r3]
	ldrb r0, [r0]
	cmp r3, r0
	bne _080D1528
	b _080D153C
_080D14F2:
	ldr r0, [r4, #0x18]
	adds r0, r0, r2
	ldrb r3, [r3]
	ldrb r0, [r0]
	cmp r3, r0
	bhi _080D1528
	b _080D153C
_080D1500:
	ldr r0, [r4, #0x18]
	adds r0, r0, r2
	ldrb r3, [r3]
	ldrb r0, [r0]
	cmp r3, r0
	bhs _080D1528
	b _080D153C
_080D150E:
	ldr r0, [r4, #0x18]
	adds r0, r0, r2
	ldrb r3, [r3]
	ldrb r0, [r0]
	cmp r3, r0
	bls _080D1528
	b _080D153C
_080D151C:
	ldr r0, [r4, #0x18]
	adds r0, r0, r2
	ldrb r3, [r3]
	ldrb r0, [r0]
	cmp r3, r0
	bhs _080D153C
_080D1528:
	ldr r0, _080D1538 @ 0x03006484
	ldr r2, [r0]
	adds r0, r4, #0
	adds r1, r6, #0
	bl BXR2
	b _080D1542
	.align 2, 0
_080D1538: .4byte 0x03006484
_080D153C:
	ldr r0, [r6, #0x40]
	adds r0, #4
	str r0, [r6, #0x40]
_080D1542:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_START sub_80D1548
sub_80D1548: @ 0x080D1548
	push {lr}
	ldr r2, [r1, #0x40]
	ldrb r3, [r2]
	adds r2, #1
	str r2, [r1, #0x40]
	ldr r2, _080D1564 @ 0x08207438
	lsls r3, r3, #2
	adds r3, r3, r2
	ldr r2, [r3]
	bl BXR2
	pop {r0}
	bx r0
	.align 2, 0
_080D1564: .4byte 0x08207438

	THUMB_FUNC_START sub_80D1568
sub_80D1568: @ 0x080D1568
	push {lr}
	ldr r2, _080D1578 @ 0x03006480
	ldr r2, [r2]
	bl BXR2
	pop {r0}
	bx r0
	.align 2, 0
_080D1578: .4byte 0x03006480

	THUMB_FUNC_START sub_80D157C
sub_80D157C: @ 0x080D157C
	push {r4, lr}
	ldr r2, [r1, #0x40]
	ldr r0, _080D15B4 @ 0xFFFFFF00
	ands r4, r0
	ldrb r0, [r2]
	orrs r4, r0
	ldrb r0, [r2, #1]
	lsls r3, r0, #8
	ldr r0, _080D15B8 @ 0xFFFF00FF
	ands r4, r0
	orrs r4, r3
	ldrb r0, [r2, #2]
	lsls r3, r0, #0x10
	ldr r0, _080D15BC @ 0xFF00FFFF
	ands r4, r0
	orrs r4, r3
	ldrb r0, [r2, #3]
	lsls r3, r0, #0x18
	ldr r0, _080D15C0 @ 0x00FFFFFF
	ands r4, r0
	orrs r4, r3
	str r4, [r1, #0x28]
	adds r2, #4
	str r2, [r1, #0x40]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080D15B4: .4byte 0xFFFFFF00
_080D15B8: .4byte 0xFFFF00FF
_080D15BC: .4byte 0xFF00FFFF
_080D15C0: .4byte 0x00FFFFFF

	THUMB_FUNC_START sub_80D15C4
sub_80D15C4: @ 0x080D15C4
	ldr r0, [r1, #0x40]
	ldrb r2, [r0]
	adds r0, r1, #0
	adds r0, #0x24
	strb r2, [r0]
	ldr r0, [r1, #0x40]
	adds r0, #1
	str r0, [r1, #0x40]
	bx lr
	.byte 0x00, 0x00

	THUMB_FUNC_START sub_80D15D8
sub_80D15D8: @ 0x080D15D8
	ldr r0, [r1, #0x40]
	ldrb r2, [r0]
	adds r0, r1, #0
	adds r0, #0x2c
	strb r2, [r0]
	ldr r0, [r1, #0x40]
	adds r0, #1
	str r0, [r1, #0x40]
	bx lr
	.byte 0x00, 0x00

	THUMB_FUNC_START sub_80D15EC
sub_80D15EC: @ 0x080D15EC
	ldr r0, [r1, #0x40]
	ldrb r0, [r0]
	adds r2, r1, #0
	adds r2, #0x2d
	strb r0, [r2]
	ldr r0, [r1, #0x40]
	adds r0, #1
	str r0, [r1, #0x40]
	bx lr
	.byte 0x00, 0x00

	THUMB_FUNC_START sub_80D1600
sub_80D1600: @ 0x080D1600
	ldr r0, [r1, #0x40]
	ldrb r0, [r0]
	adds r2, r1, #0
	adds r2, #0x2e
	strb r0, [r2]
	ldr r0, [r1, #0x40]
	adds r0, #1
	str r0, [r1, #0x40]
	bx lr
	.byte 0x00, 0x00

	THUMB_FUNC_START sub_80D1614
sub_80D1614: @ 0x080D1614
	ldr r0, [r1, #0x40]
	ldrb r0, [r0]
	adds r2, r1, #0
	adds r2, #0x2f
	strb r0, [r2]
	ldr r0, [r1, #0x40]
	adds r0, #1
	str r0, [r1, #0x40]
	bx lr
	.byte 0x00, 0x00

	THUMB_FUNC_START sub_80D1628
sub_80D1628: @ 0x080D1628
	ldr r0, [r1, #0x40]
	ldrb r2, [r0]
	strb r2, [r1, #0x1e]
	adds r0, #1
	str r0, [r1, #0x40]
	bx lr

	THUMB_FUNC_START sub_80D1634
sub_80D1634: @ 0x080D1634
	ldr r0, [r1, #0x40]
	ldrb r2, [r0]
	strb r2, [r1, #0x1f]
	adds r0, #1
	str r0, [r1, #0x40]
	bx lr

	THUMB_FUNC_START sub_80D1640
sub_80D1640: @ 0x080D1640
	ldr r0, [r1, #0x40]
	ldrb r0, [r0]
	adds r2, r1, #0
	adds r2, #0x26
	strb r0, [r2]
	ldr r0, [r1, #0x40]
	adds r0, #1
	str r0, [r1, #0x40]
	bx lr
	.byte 0x00, 0x00

	THUMB_FUNC_START sub_80D1654
sub_80D1654: @ 0x080D1654
	ldr r0, [r1, #0x40]
	ldrb r0, [r0]
	adds r2, r1, #0
	adds r2, #0x27
	strb r0, [r2]
	ldr r0, [r1, #0x40]
	adds r0, #1
	str r0, [r1, #0x40]
	bx lr
	.byte 0x00, 0x00

	THUMB_FUNC_START nullsub_46
nullsub_46: @ 0x080D1668
	bx lr
	.byte 0x00, 0x00

	THUMB_FUNC_START ArcTan2
ArcTan2: @ 0x080D166C
	svc #0xa
	bx lr

	THUMB_FUNC_START BgAffineSet
BgAffineSet: @ 0x080D1670
	svc #0xe
	bx lr

	THUMB_FUNC_START CpuFastSet
CpuFastSet: @ 0x080D1674
	svc #0xc
	bx lr

	THUMB_FUNC_START CpuSet
CpuSet: @ 0x080D1678
	svc #0xb
	bx lr

	THUMB_FUNC_START Div
Div: @ 0x080D167C
	svc #6
	bx lr

	THUMB_FUNC_START DivArm
DivArm: @ 0x080D1680
	svc #7
	bx lr

	THUMB_FUNC_START SVC_Modulo
SVC_Modulo: @ 0x080D1684
	svc #6
	adds r0, r1, #0
	bx lr
	.byte 0x00, 0x00

	THUMB_FUNC_START HuffUnComp
HuffUnComp: @ 0x080D168C
	svc #0x13
	bx lr

	THUMB_FUNC_START LZ77UnCompVram
LZ77UnCompVram: @ 0x080D1690
	svc #0x12
	bx lr

	THUMB_FUNC_START LZ77UnCompWram
LZ77UnCompWram: @ 0x080D1694
	svc #0x11
	bx lr

	THUMB_FUNC_START SVC_Multiboot
SVC_Multiboot: @ 0x080D1698
	movs r1, #1
	svc #0x25
	bx lr
	.byte 0x00, 0x00

	THUMB_FUNC_START ObjAffineSet
ObjAffineSet: @ 0x080D16A0
	svc #0xf
	bx lr

	THUMB_FUNC_START RLUnCompVram
RLUnCompVram: @ 0x080D16A4
	svc #0x15
	bx lr

	THUMB_FUNC_START RLUnCompWram
RLUnCompWram: @ 0x080D16A8
	svc #0x14
	bx lr

	THUMB_FUNC_START RegisterRamReset
RegisterRamReset: @ 0x080D16AC
	svc #1
	bx lr

	THUMB_FUNC_START sub_080D16B0
sub_080D16B0: @ 0x080D16B0
	ldr r3, _080D16C0 @ 0x04000208
	movs r2, #0
	strb r2, [r3]
	ldr r1, _080D16C4 @ 0x03007F00
	mov sp, r1
	svc #1
	svc #0
	movs r0, r0
	.align 2, 0
_080D16C0: .4byte 0x04000208
_080D16C4: .4byte 0x03007F00

	THUMB_FUNC_START SoundBiasReset
SoundBiasReset: @ 0x080D16C8
	movs r0, #0
	svc #0x19
	bx lr
	.byte 0x00, 0x00

	THUMB_FUNC_START SoundBiasSet
SoundBiasSet: @ 0x080D16D0
	movs r0, #1
	svc #0x19
	bx lr
	.byte 0x00, 0x00

	THUMB_FUNC_START Sqrt
Sqrt: @ 0x080D16D8
	svc #8
	bx lr

	THUMB_FUNC_START SVC_VBlankIntrWait
SVC_VBlankIntrWait: @ 0x080D16DC
	movs r2, #0
	svc #5
	bx lr
	.byte 0x00, 0x00

	THUMB_FUNC_START SRAMLoader
SRAMLoader: @ 0x080D16E4
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	adds r3, r2, #0
	ldr r2, _080D171C @ 0x04000204
	ldrh r0, [r2]
	ldr r1, _080D1720 @ 0x0000FFFC
	ands r0, r1
	movs r1, #3
	orrs r0, r1
	strh r0, [r2]
	subs r3, #1
	movs r0, #1
	rsbs r0, r0, #0
	cmp r3, r0
	beq _080D1714
	adds r1, r0, #0
_080D1706:
	ldrb r0, [r5]
	strb r0, [r4]
	adds r5, #1
	adds r4, #1
	subs r3, #1
	cmp r3, r1
	bne _080D1706
_080D1714:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080D171C: .4byte 0x04000204
_080D1720: .4byte 0x0000FFFC

	THUMB_FUNC_START SRAMTransfer
SRAMTransfer: @ 0x080D1724
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	adds r3, r2, #0
	ldr r2, _080D175C @ 0x04000204
	ldrh r0, [r2]
	ldr r1, _080D1760 @ 0x0000FFFC
	ands r0, r1
	movs r1, #3
	orrs r0, r1
	strh r0, [r2]
	subs r3, #1
	movs r0, #1
	rsbs r0, r0, #0
	cmp r3, r0
	beq _080D1754
	adds r1, r0, #0
_080D1746:
	ldrb r0, [r5]
	strb r0, [r4]
	adds r5, #1
	adds r4, #1
	subs r3, #1
	cmp r3, r1
	bne _080D1746
_080D1754:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080D175C: .4byte 0x04000204
_080D1760: .4byte 0x0000FFFC

	THUMB_FUNC_START SaveChecker
SaveChecker: @ 0x080D1764
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	adds r3, r2, #0
	ldr r2, _080D1798 @ 0x04000204
	ldrh r0, [r2]
	ldr r1, _080D179C @ 0x0000FFFC
	ands r0, r1
	movs r1, #3
	orrs r0, r1
	strh r0, [r2]
	subs r3, #1
	movs r0, #1
	rsbs r0, r0, #0
	cmp r3, r0
	beq _080D17A6
	adds r2, r0, #0
_080D1786:
	ldrb r1, [r4]
	ldrb r0, [r5]
	adds r5, #1
	adds r4, #1
	cmp r1, r0
	beq _080D17A0
	subs r0, r4, #1
	b _080D17A8
	.align 2, 0
_080D1798: .4byte 0x04000204
_080D179C: .4byte 0x0000FFFC
_080D17A0:
	subs r3, #1
	cmp r3, r2
	bne _080D1786
_080D17A6:
	movs r0, #0
_080D17A8:
	pop {r4, r5}
	pop {r1}
	bx r1
	.byte 0x00, 0x00

	THUMB_FUNC_START StoreLoadRoutinesToRAM
StoreLoadRoutinesToRAM: @ 0x080D17B0
	push {lr}
	ldr r2, _080D17C4 @ 0x080D16E5
	movs r0, #1
	bics r2, r0
	ldr r3, _080D17C8 @ 0x03002B08
	ldr r0, _080D17CC @ 0x080D1725
	ldr r1, _080D17C4 @ 0x080D16E5
	subs r0, r0, r1
	lsls r0, r0, #0xf
	b _080D17DC
	.align 2, 0
_080D17C4: .4byte 0x080D16E5
_080D17C8: .4byte 0x03002B08
_080D17CC: .4byte 0x080D1725
_080D17D0:
	ldrh r0, [r2]
	strh r0, [r3]
	adds r2, #2
	adds r3, #2
	subs r0, r1, #1
	lsls r0, r0, #0x10
_080D17DC:
	lsrs r1, r0, #0x10
	cmp r1, #0
	bne _080D17D0
	ldr r1, _080D17FC @ 0x030067A0
	ldr r0, _080D1800 @ 0x03002B09
	str r0, [r1]
	ldr r2, _080D1804 @ 0x080D1765
	movs r0, #1
	bics r2, r0
	ldr r3, _080D1808 @ 0x03002A68
	ldr r0, _080D180C @ 0x080D17B1
	ldr r1, _080D1804 @ 0x080D1765
	subs r0, r0, r1
	lsls r0, r0, #0xf
	b _080D181C
	.align 2, 0
_080D17FC: .4byte 0x030067A0
_080D1800: .4byte 0x03002B09
_080D1804: .4byte 0x080D1765
_080D1808: .4byte 0x03002A68
_080D180C: .4byte 0x080D17B1
_080D1810:
	ldrh r0, [r2]
	strh r0, [r3]
	adds r2, #2
	adds r3, #2
	subs r0, r1, #1
	lsls r0, r0, #0x10
_080D181C:
	lsrs r1, r0, #0x10
	cmp r1, #0
	bne _080D1810
	ldr r1, _080D183C @ 0x030067A4
	ldr r0, _080D1840 @ 0x03002A69
	str r0, [r1]
	ldr r2, _080D1844 @ 0x04000204
	ldrh r0, [r2]
	ldr r1, _080D1848 @ 0x0000FFFC
	ands r0, r1
	movs r1, #3
	orrs r0, r1
	strh r0, [r2]
	pop {r0}
	bx r0
	.align 2, 0
_080D183C: .4byte 0x030067A4
_080D1840: .4byte 0x03002A69
_080D1844: .4byte 0x04000204
_080D1848: .4byte 0x0000FFFC

	THUMB_FUNC_START SRAMTransfer_WithCheck
SRAMTransfer_WithCheck: @ 0x080D184C
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r5, r1, #0
	adds r4, r2, #0
	movs r7, #0
	b _080D185E
_080D1858:
	adds r0, r7, #1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
_080D185E:
	cmp r7, #2
	bhi _080D1880
	adds r0, r6, #0
	adds r1, r5, #0
	adds r2, r4, #0
	bl SRAMTransfer
	ldr r0, _080D1888 @ 0x030067A4
	ldr r3, [r0]
	adds r0, r6, #0
	adds r1, r5, #0
	adds r2, r4, #0
	bl BXR3
	adds r3, r0, #0
	cmp r3, #0
	bne _080D1858
_080D1880:
	adds r0, r3, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080D1888: .4byte 0x030067A4

	THUMB_FUNC_START sub_080D188C
sub_080D188C: @ 0x080D188C
	push {r4, r5, r6, lr}
	adds r6, r1, #0
	adds r5, r0, #0
	cmp r2, #0
	beq _080D18BC
	movs r0, #0x20
	subs r0, r0, r2
	cmp r0, #0
	bgt _080D18A8
	movs r3, #0
	rsbs r0, r0, #0
	adds r4, r5, #0
	lsls r4, r0
	b _080D18B8
_080D18A8:
	adds r1, r5, #0
	lsrs r1, r0
	adds r3, r5, #0
	lsls r3, r2
	adds r0, r6, #0
	lsls r0, r2
	adds r4, r0, #0
	orrs r4, r1
_080D18B8:
	adds r1, r4, #0
	adds r0, r3, #0
_080D18BC:
	pop {r4, r5, r6, pc}
	.byte 0x00, 0x00

	THUMB_FUNC_START sub_080D18C0
sub_080D18C0: @ 0x080D18C0
	bx r0
	.byte 0xC0, 0x46

	THUMB_FUNC_START BXR1
BXR1: @ 0x080D18C4
	bx r1
	.byte 0xC0, 0x46

	THUMB_FUNC_START BXR2
BXR2: @ 0x080D18C8
	bx r2
	.byte 0xC0, 0x46

	THUMB_FUNC_START BXR3
BXR3: @ 0x080D18CC
	bx r3
	.byte 0xC0, 0x46

	THUMB_FUNC_START BXR4
BXR4: @ 0x080D18D0
	bx r4
	.byte 0xC0, 0x46

	THUMB_FUNC_START BXR5
BXR5: @ 0x080D18D4
	bx r5
	.byte 0xC0, 0x46

	THUMB_FUNC_START BXR6
BXR6: @ 0x080D18D8
	bx r6
	.byte 0xC0, 0x46

	THUMB_FUNC_START BXR7
BXR7: @ 0x080D18DC
	bx r7
	.byte 0xC0, 0x46

	THUMB_FUNC_START BXR8
BXR8: @ 0x080D18E0
	bx r8
	.byte 0xC0, 0x46

	THUMB_FUNC_START BXR9
BXR9: @ 0x080D18E4
	bx sb
	.byte 0xC0, 0x46

	THUMB_FUNC_START BXR10
BXR10: @ 0x080D18E8
	bx sl
	.byte 0xC0, 0x46

	THUMB_FUNC_START BXR11
BXR11: @ 0x080D18EC
	bx fp
	.byte 0xC0, 0x46

	THUMB_FUNC_START BXR12
BXR12: @ 0x080D18F0
	bx ip
	.byte 0xC0, 0x46

	THUMB_FUNC_START BXSP
BXSP: @ 0x080D18F4
	bx sp
	.byte 0xC0, 0x46

	THUMB_FUNC_START BXLR
BXLR: @ 0x080D18F8
	bx lr
	.byte 0xC0, 0x46

	THUMB_FUNC_START ThumbDivide
ThumbDivide: @ 0x080D18FC
	cmp r1, #0
	beq _080D1984
	push {r4}
	adds r4, r0, #0
	eors r4, r1
	mov ip, r4
	movs r3, #1
	movs r2, #0
	cmp r1, #0
	bpl _080D1912
	rsbs r1, r1, #0
_080D1912:
	cmp r0, #0
	bpl _080D1918
	rsbs r0, r0, #0
_080D1918:
	cmp r0, r1
	blo _080D1976
	movs r4, #1
	lsls r4, r4, #0x1c
_080D1920:
	cmp r1, r4
	bhs _080D192E
	cmp r1, r0
	bhs _080D192E
	lsls r1, r1, #4
	lsls r3, r3, #4
	b _080D1920
_080D192E:
	lsls r4, r4, #3
_080D1930:
	cmp r1, r4
	bhs _080D193E
	cmp r1, r0
	bhs _080D193E
	lsls r1, r1, #1
	lsls r3, r3, #1
	b _080D1930
_080D193E:
	cmp r0, r1
	blo _080D1946
	subs r0, r0, r1
	orrs r2, r3
_080D1946:
	lsrs r4, r1, #1
	cmp r0, r4
	blo _080D1952
	subs r0, r0, r4
	lsrs r4, r3, #1
	orrs r2, r4
_080D1952:
	lsrs r4, r1, #2
	cmp r0, r4
	blo _080D195E
	subs r0, r0, r4
	lsrs r4, r3, #2
	orrs r2, r4
_080D195E:
	lsrs r4, r1, #3
	cmp r0, r4
	blo _080D196A
	subs r0, r0, r4
	lsrs r4, r3, #3
	orrs r2, r4
_080D196A:
	cmp r0, #0
	beq _080D1976
	lsrs r3, r3, #4
	beq _080D1976
	lsrs r1, r1, #4
	b _080D193E
_080D1976:
	adds r0, r2, #0
	mov r4, ip
	cmp r4, #0
	bpl _080D1980
	rsbs r0, r0, #0
_080D1980:
	pop {r4}
	mov pc, lr
_080D1984:
	push {lr}
	bl nullsub_1
	movs r0, #0
	pop {pc}
	.byte 0x00, 0x00

	THUMB_FUNC_START nullsub_1
nullsub_1: @ 0x080D1990
	mov pc, lr
	.byte 0x00, 0x00

	THUMB_FUNC_START ThumbModulo
ThumbModulo: @ 0x080D1994
	movs r3, #1
	cmp r1, #0
	beq _080D1A58
	bpl _080D199E
	rsbs r1, r1, #0
_080D199E:
	push {r4}
	push {r0}
	cmp r0, #0
	bpl _080D19A8
	rsbs r0, r0, #0
_080D19A8:
	cmp r0, r1
	blo _080D1A4C
	movs r4, #1
	lsls r4, r4, #0x1c
_080D19B0:
	cmp r1, r4
	bhs _080D19BE
	cmp r1, r0
	bhs _080D19BE
	lsls r1, r1, #4
	lsls r3, r3, #4
	b _080D19B0
_080D19BE:
	lsls r4, r4, #3
_080D19C0:
	cmp r1, r4
	bhs _080D19CE
	cmp r1, r0
	bhs _080D19CE
	lsls r1, r1, #1
	lsls r3, r3, #1
	b _080D19C0
_080D19CE:
	movs r2, #0
	cmp r0, r1
	blo _080D19D6
	subs r0, r0, r1
_080D19D6:
	lsrs r4, r1, #1
	cmp r0, r4
	blo _080D19E8
	subs r0, r0, r4
	mov ip, r3
	movs r4, #1
	rors r3, r4
	orrs r2, r3
	mov r3, ip
_080D19E8:
	lsrs r4, r1, #2
	cmp r0, r4
	blo _080D19FA
	subs r0, r0, r4
	mov ip, r3
	movs r4, #2
	rors r3, r4
	orrs r2, r3
	mov r3, ip
_080D19FA:
	lsrs r4, r1, #3
	cmp r0, r4
	blo _080D1A0C
	subs r0, r0, r4
	mov ip, r3
	movs r4, #3
	rors r3, r4
	orrs r2, r3
	mov r3, ip
_080D1A0C:
	mov ip, r3
	cmp r0, #0
	beq _080D1A1A
	lsrs r3, r3, #4
	beq _080D1A1A
	lsrs r1, r1, #4
	b _080D19CE
_080D1A1A:
	movs r4, #0xe
	lsls r4, r4, #0x1c
	ands r2, r4
	beq _080D1A4C
	mov r3, ip
	movs r4, #3
	rors r3, r4
	tst r2, r3
	beq _080D1A30
	lsrs r4, r1, #3
	adds r0, r0, r4
_080D1A30:
	mov r3, ip
	movs r4, #2
	rors r3, r4
	tst r2, r3
	beq _080D1A3E
	lsrs r4, r1, #2
	adds r0, r0, r4
_080D1A3E:
	mov r3, ip
	movs r4, #1
	rors r3, r4
	tst r2, r3
	beq _080D1A4C
	lsrs r4, r1, #1
	adds r0, r0, r4
_080D1A4C:
	pop {r4}
	cmp r4, #0
	bpl _080D1A54
	rsbs r0, r0, #0
_080D1A54:
	pop {r4}
	mov pc, lr
_080D1A58:
	push {lr}
	bl nullsub_1
	movs r0, #0
	pop {pc}
	.byte 0x00, 0x00

	THUMB_FUNC_START .gcc2_compiled._46
.gcc2_compiled._46: @ 0x080D1A64
	push {r4, r5, r6, r7, lr}
	sub sp, #0x10
	str r0, [sp]
	str r1, [sp, #4]
	str r2, [sp, #8]
	str r3, [sp, #0xc]
	ldr r3, [sp]
	ldr r0, _080D1AD0 @ 0x0000FFFF
	mov ip, r0
	adds r2, r3, #0
	ands r2, r0
	lsrs r3, r3, #0x10
	ldr r1, [sp, #8]
	adds r0, r1, #0
	mov r4, ip
	ands r0, r4
	lsrs r1, r1, #0x10
	adds r5, r2, #0
	muls r5, r0, r5
	adds r4, r2, #0
	muls r4, r1, r4
	adds r2, r3, #0
	muls r2, r0, r2
	muls r3, r1, r3
	lsrs r0, r5, #0x10
	adds r4, r4, r0
	adds r4, r4, r2
	cmp r4, r2
	bhs _080D1AA4
	movs r0, #0x80
	lsls r0, r0, #9
	adds r3, r3, r0
_080D1AA4:
	lsrs r0, r4, #0x10
	adds r7, r3, r0
	mov r1, ip
	ands r4, r1
	lsls r0, r4, #0x10
	ands r5, r1
	adds r6, r0, #0
	orrs r6, r5
	adds r1, r7, #0
	adds r0, r6, #0
	ldr r3, [sp]
	ldr r4, [sp, #0xc]
	adds r2, r3, #0
	muls r2, r4, r2
	ldr r5, [sp, #4]
	ldr r4, [sp, #8]
	adds r3, r5, #0
	muls r3, r4, r3
	adds r2, r2, r3
	adds r1, r7, r2
	add sp, #0x10
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_080D1AD0: .4byte 0x0000FFFF

	THUMB_FUNC_START StandardDIV
StandardDIV: @ 0x080D1AD4
	cmp r1, #0
	beq _080D1B42
	movs r3, #1
	movs r2, #0
	push {r4}
	cmp r0, r1
	blo _080D1B3C
	movs r4, #1
	lsls r4, r4, #0x1c
_080D1AE6:
	cmp r1, r4
	bhs _080D1AF4
	cmp r1, r0
	bhs _080D1AF4
	lsls r1, r1, #4
	lsls r3, r3, #4
	b _080D1AE6
_080D1AF4:
	lsls r4, r4, #3
_080D1AF6:
	cmp r1, r4
	bhs _080D1B04
	cmp r1, r0
	bhs _080D1B04
	lsls r1, r1, #1
	lsls r3, r3, #1
	b _080D1AF6
_080D1B04:
	cmp r0, r1
	blo _080D1B0C
	subs r0, r0, r1
	orrs r2, r3
_080D1B0C:
	lsrs r4, r1, #1
	cmp r0, r4
	blo _080D1B18
	subs r0, r0, r4
	lsrs r4, r3, #1
	orrs r2, r4
_080D1B18:
	lsrs r4, r1, #2
	cmp r0, r4
	blo _080D1B24
	subs r0, r0, r4
	lsrs r4, r3, #2
	orrs r2, r4
_080D1B24:
	lsrs r4, r1, #3
	cmp r0, r4
	blo _080D1B30
	subs r0, r0, r4
	lsrs r4, r3, #3
	orrs r2, r4
_080D1B30:
	cmp r0, #0
	beq _080D1B3C
	lsrs r3, r3, #4
	beq _080D1B3C
	lsrs r1, r1, #4
	b _080D1B04
_080D1B3C:
	adds r0, r2, #0
	pop {r4}
	mov pc, lr
_080D1B42:
	push {lr}
	bl nullsub_1
	movs r0, #0
	pop {pc}

	THUMB_FUNC_START StandardMOD
StandardMOD: @ 0x080D1B4C
	cmp r1, #0
	beq _080D1C02
	movs r3, #1
	cmp r0, r1
	bhs _080D1B58
	mov pc, lr
_080D1B58:
	push {r4}
	movs r4, #1
	lsls r4, r4, #0x1c
_080D1B5E:
	cmp r1, r4
	bhs _080D1B6C
	cmp r1, r0
	bhs _080D1B6C
	lsls r1, r1, #4
	lsls r3, r3, #4
	b _080D1B5E
_080D1B6C:
	lsls r4, r4, #3
_080D1B6E:
	cmp r1, r4
	bhs _080D1B7C
	cmp r1, r0
	bhs _080D1B7C
	lsls r1, r1, #1
	lsls r3, r3, #1
	b _080D1B6E
_080D1B7C:
	movs r2, #0
	cmp r0, r1
	blo _080D1B84
	subs r0, r0, r1
_080D1B84:
	lsrs r4, r1, #1
	cmp r0, r4
	blo _080D1B96
	subs r0, r0, r4
	mov ip, r3
	movs r4, #1
	rors r3, r4
	orrs r2, r3
	mov r3, ip
_080D1B96:
	lsrs r4, r1, #2
	cmp r0, r4
	blo _080D1BA8
	subs r0, r0, r4
	mov ip, r3
	movs r4, #2
	rors r3, r4
	orrs r2, r3
	mov r3, ip
_080D1BA8:
	lsrs r4, r1, #3
	cmp r0, r4
	blo _080D1BBA
	subs r0, r0, r4
	mov ip, r3
	movs r4, #3
	rors r3, r4
	orrs r2, r3
	mov r3, ip
_080D1BBA:
	mov ip, r3
	cmp r0, #0
	beq _080D1BC8
	lsrs r3, r3, #4
	beq _080D1BC8
	lsrs r1, r1, #4
	b _080D1B7C
_080D1BC8:
	movs r4, #0xe
	lsls r4, r4, #0x1c
	ands r2, r4
	bne _080D1BD4
	pop {r4}
	mov pc, lr
_080D1BD4:
	mov r3, ip
	movs r4, #3
	rors r3, r4
	tst r2, r3
	beq _080D1BE2
	lsrs r4, r1, #3
	adds r0, r0, r4
_080D1BE2:
	mov r3, ip
	movs r4, #2
	rors r3, r4
	tst r2, r3
	beq _080D1BF0
	lsrs r4, r1, #2
	adds r0, r0, r4
_080D1BF0:
	mov r3, ip
	movs r4, #1
	rors r3, r4
	tst r2, r3
	beq _080D1BFE
	lsrs r4, r1, #1
	adds r0, r0, r4
_080D1BFE:
	pop {r4}
	mov pc, lr
_080D1C02:
	push {lr}
	bl nullsub_1
	movs r0, #0
	pop {pc}

	THUMB_FUNC_START sub_080D1C0C
sub_080D1C0C: @ 0x080D1C0C
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r5, #0
	adds r3, r1, #0
	cmp r2, #0xf
	bls _080D1C4C
	adds r0, r3, #0
	orrs r0, r5
	movs r1, #3
	ands r0, r1
	cmp r0, #0
	bne _080D1C4C
	adds r1, r5, #0
_080D1C26:
	ldm r3!, {r0}
	stm r1!, {r0}
	ldm r3!, {r0}
	stm r1!, {r0}
	ldm r3!, {r0}
	stm r1!, {r0}
	ldm r3!, {r0}
	stm r1!, {r0}
	subs r2, #0x10
	cmp r2, #0xf
	bhi _080D1C26
	cmp r2, #3
	bls _080D1C4A
_080D1C40:
	ldm r3!, {r0}
	stm r1!, {r0}
	subs r2, #4
	cmp r2, #3
	bhi _080D1C40
_080D1C4A:
	adds r4, r1, #0
_080D1C4C:
	subs r2, #1
	movs r0, #1
	rsbs r0, r0, #0
	cmp r2, r0
	beq _080D1C66
	adds r1, r0, #0
_080D1C58:
	ldrb r0, [r3]
	strb r0, [r4]
	adds r3, #1
	adds r4, #1
	subs r2, #1
	cmp r2, r1
	bne _080D1C58
_080D1C66:
	adds r0, r5, #0
	pop {r4, r5, pc}
	.byte 0x00, 0x00

	THUMB_FUNC_START .gcc2_compiled._10
.gcc2_compiled._10: @ 0x080D1C6C
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	adds r3, r5, #0
	cmp r2, #3
	bls _080D1CB2
	movs r0, #3
	ands r0, r5
	cmp r0, #0
	bne _080D1CB2
	adds r1, r5, #0
	movs r0, #0xff
	ands r4, r0
	lsls r3, r4, #8
	orrs r3, r4
	lsls r0, r3, #0x10
	orrs r3, r0
	cmp r2, #0xf
	bls _080D1CA6
_080D1C92:
	stm r1!, {r3}
	stm r1!, {r3}
	stm r1!, {r3}
	stm r1!, {r3}
	subs r2, #0x10
	cmp r2, #0xf
	bhi _080D1C92
	b _080D1CA6
_080D1CA2:
	stm r1!, {r3}
	subs r2, #4
_080D1CA6:
	cmp r2, #3
	bhi _080D1CA2
	adds r3, r1, #0
	b _080D1CB2
_080D1CAE:
	strb r4, [r3]
	adds r3, #1
_080D1CB2:
	adds r0, r2, #0
	subs r2, #1
	cmp r0, #0
	bne _080D1CAE
	adds r0, r5, #0
	pop {r4, r5, pc}
	.byte 0x00, 0x00
	.byte 0x0C, 0xB4, 0x30, 0xB5, 0x96, 0xB0, 0x19, 0x9C, 0x6B, 0x46, 0x00, 0x25, 0x82, 0x22, 0x92, 0x00
	.byte 0x9A, 0x81, 0x00, 0x91, 0x04, 0x91, 0x08, 0x49, 0x02, 0x91, 0x05, 0x91, 0x15, 0x90, 0x1A, 0xAA
	.byte 0x68, 0x46, 0x21, 0x1C, 0x00, 0xF0, 0xDE, 0xF8, 0x00, 0x99, 0x0D, 0x70, 0x16, 0xB0, 0x30, 0xBC
	.byte 0x08, 0xBC, 0x02, 0xB0, 0x18, 0x47, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0x7F

	THUMB_FUNC_START sprintf
sprintf: @ 0x080D1CFC
	push {r1, r2, r3}
	push {r4, lr}
	sub sp, #0x58
	ldr r1, [sp, #0x60]
	mov r3, sp
	movs r4, #0
	movs r2, #0x82
	lsls r2, r2, #2
	strh r2, [r3, #0xc]
	str r0, [sp]
	str r0, [sp, #0x10]
	ldr r0, _080D1D34 @ 0x7FFFFFFF
	str r0, [sp, #8]
	str r0, [sp, #0x14]
	ldr r0, _080D1D38 @ 0x08B1FA20
	ldr r0, [r0]
	str r0, [sp, #0x54]
	add r2, sp, #0x64
	mov r0, sp
	bl vfprintf
	ldr r1, [sp]
	strb r4, [r1]
	add sp, #0x58
	pop {r4}
	pop {r3}
	add sp, #0xc
	bx r3
	.align 2, 0
_080D1D34: .4byte 0x7FFFFFFF
_080D1D38: .4byte 0x08B1FA20

	THUMB_FUNC_START sub_080D1D3C
sub_080D1D3C: @ 0x080D1D3C
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r3, r6, #0
	adds r2, r1, #0
	adds r0, r2, #0
	orrs r0, r6
	movs r1, #3
	ands r0, r1
	cmp r0, #0
	bne _080D1D74
	ldr r1, [r2]
	ldr r5, _080D1D5C @ 0xFEFEFEFF
	adds r0, r1, r5
	bics r0, r1
	ldr r4, _080D1D60 @ 0x80808080
	b _080D1D6E
	.align 2, 0
_080D1D5C: .4byte 0xFEFEFEFF
_080D1D60: .4byte 0x80808080
_080D1D64:
	ldm r2!, {r0}
	stm r3!, {r0}
	ldr r1, [r2]
	adds r0, r1, r5
	bics r0, r1
_080D1D6E:
	ands r0, r4
	cmp r0, #0
	beq _080D1D64
_080D1D74:
	ldrb r0, [r2]
	strb r0, [r3]
	lsls r0, r0, #0x18
	adds r2, #1
	adds r3, #1
	cmp r0, #0
	bne _080D1D74
	adds r0, r6, #0
	pop {r4, r5, r6, pc}
	.byte 0x00, 0x00

	THUMB_FUNC_START sub_080D1D88
sub_080D1D88: @ 0x080D1D88
	push {r4, r5, lr}
	adds r1, r0, #0
	adds r5, r1, #0
	movs r0, #3
	ands r0, r1
	cmp r0, #0
	bne _080D1DC0
	adds r2, r1, #0
	ldr r1, [r2]
	ldr r4, _080D1DA4 @ 0xFEFEFEFF
	adds r0, r1, r4
	bics r0, r1
	ldr r3, _080D1DA8 @ 0x80808080
	b _080D1DB4
	.align 2, 0
_080D1DA4: .4byte 0xFEFEFEFF
_080D1DA8: .4byte 0x80808080
_080D1DAC:
	adds r2, #4
	ldr r1, [r2]
	adds r0, r1, r4
	bics r0, r1
_080D1DB4:
	ands r0, r3
	cmp r0, #0
	beq _080D1DAC
	adds r1, r2, #0
	b _080D1DC0
_080D1DBE:
	adds r1, #1
_080D1DC0:
	ldrb r0, [r1]
	cmp r0, #0
	bne _080D1DBE
	subs r0, r1, r5
	pop {r4, r5, pc}
	.byte 0x00, 0x00

	THUMB_FUNC_START sub_080D1DCC
sub_080D1DCC: @ 0x080D1DCC
	push {r4, lr}
	adds r3, r0, #0
	adds r4, r1, #0
	ldrb r0, [r3]
	cmp r0, #0
	bne _080D1DE2
	ldrb r0, [r4]
	cmp r0, #0
	bne _080D1E0A
_080D1DDE:
	adds r0, r3, #0
	b _080D1E0C
_080D1DE2:
	movs r1, #0
	ldrb r0, [r4]
	cmp r0, #0
	beq _080D1DDE
	ldrb r2, [r3]
	cmp r0, r2
	bne _080D1E02
_080D1DF0:
	adds r1, #1
	adds r0, r4, r1
	ldrb r2, [r0]
	cmp r2, #0
	beq _080D1DDE
	adds r0, r3, r1
	ldrb r0, [r0]
	cmp r2, r0
	beq _080D1DF0
_080D1E02:
	adds r3, #1
	ldrb r0, [r3]
	cmp r0, #0
	bne _080D1DE2
_080D1E0A:
	movs r0, #0
_080D1E0C:
	pop {r4, pc}
	.byte 0x00, 0x00

	THUMB_FUNC_START sub_080D1E10
sub_080D1E10: @ 0x080D1E10
	push {r4, lr}
	adds r4, r1, #0
	ldr r1, [r4, #8]
	cmp r1, #0
	beq _080D1E28
	adds r1, r4, #0
	bl .gcc2_compiled._22
	movs r1, #0
	str r1, [r4, #8]
	str r1, [r4, #4]
	b _080D1E2C
_080D1E28:
	str r1, [r4, #4]
	movs r0, #0
_080D1E2C:
	pop {r4, pc}
	.byte 0x00, 0x00

	THUMB_FUNC_START __sbprintf
__sbprintf: @ 0x080D1E30
	push {r4, r5, lr}
	ldr r4, _080D1EA0 @ 0xFFFFFBA8
	add sp, r4
	adds r5, r0, #0
	ldr r0, [r5, #0x54]
	str r0, [sp, #0x54]
	mov r3, sp
	movs r0, #3
	rsbs r0, r0, #0
	ldrh r4, [r5, #0xc]
	ands r0, r4
	movs r4, #0
	strh r0, [r3, #0xc]
	ldrh r0, [r5, #0xe]
	strh r0, [r3, #0xe]
	ldr r0, [r5, #0x1c]
	str r0, [sp, #0x1c]
	ldr r0, [r5, #0x24]
	str r0, [sp, #0x24]
	add r0, sp, #0x58
	str r0, [sp]
	str r0, [sp, #0x10]
	movs r0, #0x80
	lsls r0, r0, #3
	str r0, [sp, #8]
	str r0, [sp, #0x14]
	str r4, [sp, #0x18]
	mov r0, sp
	bl vfprintf
	adds r4, r0, #0
	cmp r4, #0
	blt _080D1E80
	mov r0, sp
	bl .gcc2_compiled._19
	cmp r0, #0
	beq _080D1E80
	movs r4, #1
	rsbs r4, r4, #0
_080D1E80:
	mov r1, sp
	movs r0, #0x40
	ldrh r1, [r1, #0xc]
	ands r0, r1
	cmp r0, #0
	beq _080D1E94
	movs r0, #0x40
	ldrh r1, [r5, #0xc]
	orrs r0, r1
	strh r0, [r5, #0xc]
_080D1E94:
	adds r0, r4, #0
	movs r3, #0x8b
	lsls r3, r3, #3
	add sp, r3
	pop {r4, r5, pc}
	.align 2, 0
_080D1EA0: .4byte 0xFFFFFBA8

	THUMB_FUNC_START vfprintf
vfprintf: @ 0x080D1EA4
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r3, r2, #0
	ldr r0, [r4, #0x54]
	adds r1, r4, #0
	adds r2, r5, #0
	bl _vfprintf_r
	pop {r4, r5, pc}

	THUMB_FUNC_START _vfprintf_r
_vfprintf_r: @ 0x080D1EB8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r4, _080D1F20 @ 0xFFFFFDE0
	add sp, r4
	str r0, [sp, #0x1dc]
	str r1, [sp, #0x1e0]
	adds r4, r2, #0
	mov sl, r3
	bl localeconv
	ldr r0, [r0]
	str r0, [sp, #0x1f8]
	movs r1, #0
	add r0, sp, #0x1d0
	str r1, [r0]
	ldr r1, [sp, #0x1e0]
	ldr r0, [r1, #0x54]
	cmp r0, #0
	bne _080D1EEA
	ldr r0, _080D1F24 @ 0x08B1FA20
	ldr r0, [r0]
	str r0, [r1, #0x54]
_080D1EEA:
	ldr r2, [sp, #0x1e0]
	ldr r1, [r2, #0x54]
	ldr r0, [r1, #0x38]
	cmp r0, #0
	bne _080D1EFA
	adds r0, r1, #0
	bl __sinit
_080D1EFA:
	movs r0, #8
	ldr r1, [sp, #0x1e0]
	ldrh r1, [r1, #0xc]
	ands r0, r1
	cmp r0, #0
	beq _080D1F0E
	ldr r2, [sp, #0x1e0]
	ldr r0, [r2, #0x10]
	cmp r0, #0
	bne _080D1F28
_080D1F0E:
	ldr r0, [sp, #0x1e0]
	bl .gcc2_compiled._17
	cmp r0, #0
	beq _080D1F28
	movs r0, #1
	rsbs r0, r0, #0
	bl _080D2E08
	.align 2, 0
_080D1F20: .4byte 0xFFFFFDE0
_080D1F24: .4byte 0x08B1FA20
_080D1F28:
	movs r0, #0x1a
	ldr r1, [sp, #0x1e0]
	ldrh r1, [r1, #0xc]
	ands r0, r1
	cmp r0, #0xa
	bne _080D1F4C
	ldr r2, [sp, #0x1e0]
	movs r1, #0xe
	ldrsh r0, [r2, r1]
	cmp r0, #0
	blt _080D1F4C
	adds r0, r2, #0
	adds r1, r4, #0
	mov r2, sl
	bl __sbprintf
	bl _080D2E08
_080D1F4C:
	str r4, [sp, #0x1e4]
	add r1, sp, #0x1c
	add r5, sp, #0x28
	str r5, [sp, #0x1c]
	movs r0, #0
	str r0, [r1, #8]
	str r0, [r1, #4]
	movs r2, #0
	str r2, [sp, #0x1f0]
	mov sb, r1
	movs r4, #0xe6
	lsls r4, r4, #1
	add r4, sp
	str r4, [sp, #0x214]
	movs r0, #0xe8
	lsls r0, r0, #1
	add r0, sp
	str r0, [sp, #0x218]
_080D1F70:
	ldr r1, [sp, #0x1e4]
	mov r8, r1
_080D1F74:
	ldr r0, _080D2020 @ 0x08B1FA20
	ldr r0, [r0]
	ldr r1, _080D2024 @ 0x08B1FA24
	ldr r3, [r1]
	ldr r2, [sp, #0x218]
	str r2, [sp]
	ldr r1, [sp, #0x214]
	ldr r2, [sp, #0x1e4]
	bl sub_080D4BF0
	adds r4, r0, #0
	cmp r4, #0
	ble _080D1FA2
	ldr r0, [sp, #0x1e4]
	adds r0, r0, r4
	str r0, [sp, #0x1e4]
	add r0, sp, #0x1cc
	ldr r0, [r0]
	cmp r0, #0x25
	bne _080D1F74
	ldr r1, [sp, #0x1e4]
	subs r1, #1
	str r1, [sp, #0x1e4]
_080D1FA2:
	ldr r2, [sp, #0x1e4]
	mov r0, r8
	subs r6, r2, r0
	cmp r6, #0
	beq _080D1FDA
	str r0, [r5]
	str r6, [r5, #4]
	mov r1, sb
	ldr r0, [r1, #8]
	adds r0, r0, r6
	str r0, [r1, #8]
	adds r5, #8
	ldr r0, [r1, #4]
	adds r0, #1
	str r0, [r1, #4]
	cmp r0, #7
	ble _080D1FD4
	ldr r0, [sp, #0x1e0]
	bl sub_080D1E10
	cmp r0, #0
	beq _080D1FD2
	bl _080D2DF4
_080D1FD2:
	add r5, sp, #0x28
_080D1FD4:
	ldr r2, [sp, #0x1f0]
	adds r2, r2, r6
	str r2, [sp, #0x1f0]
_080D1FDA:
	cmp r4, #0
	bgt _080D1FE2
	bl _080D2DDC
_080D1FE2:
	ldr r4, [sp, #0x1e4]
	adds r4, #1
	str r4, [sp, #0x1e4]
	movs r0, #0
	str r0, [sp, #0x1ec]
	movs r1, #0
	str r1, [sp, #0x208]
	movs r2, #0
	str r2, [sp, #0x1f4]
	movs r6, #1
	rsbs r6, r6, #0
	ldr r0, _080D2028 @ 0x000001C9
	add r0, sp
	strb r2, [r0]
_080D1FFE:
	ldr r0, [sp, #0x1e4]
	ldrb r0, [r0]
	str r0, [sp, #0x1e8]
	ldr r1, [sp, #0x1e4]
	adds r1, #1
	str r1, [sp, #0x1e4]
_080D200A:
	ldr r0, [sp, #0x1e8]
	subs r0, #0x20
	cmp r0, #0x58
	bls _080D2014
	b _080D26C6
_080D2014:
	lsls r0, r0, #2
	ldr r1, _080D202C @ 0x080D2030
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080D2020: .4byte 0x08B1FA20
_080D2024: .4byte 0x08B1FA24
_080D2028: .4byte 0x000001C9
_080D202C: .4byte 0x080D2030
_080D2030: @ jump table
	.4byte _080D2194 @ case 0
	.4byte _080D26C6 @ case 1
	.4byte _080D26C6 @ case 2
	.4byte _080D21AC @ case 3
	.4byte _080D26C6 @ case 4
	.4byte _080D26C6 @ case 5
	.4byte _080D26C6 @ case 6
	.4byte _080D26C6 @ case 7
	.4byte _080D26C6 @ case 8
	.4byte _080D26C6 @ case 9
	.4byte _080D21B0 @ case 10
	.4byte _080D21CA @ case 11
	.4byte _080D26C6 @ case 12
	.4byte _080D21C6 @ case 13
	.4byte _080D21D8 @ case 14
	.4byte _080D26C6 @ case 15
	.4byte _080D2238 @ case 16
	.4byte _080D223C @ case 17
	.4byte _080D223C @ case 18
	.4byte _080D223C @ case 19
	.4byte _080D223C @ case 20
	.4byte _080D223C @ case 21
	.4byte _080D223C @ case 22
	.4byte _080D223C @ case 23
	.4byte _080D223C @ case 24
	.4byte _080D223C @ case 25
	.4byte _080D26C6 @ case 26
	.4byte _080D26C6 @ case 27
	.4byte _080D26C6 @ case 28
	.4byte _080D26C6 @ case 29
	.4byte _080D26C6 @ case 30
	.4byte _080D26C6 @ case 31
	.4byte _080D26C6 @ case 32
	.4byte _080D26C6 @ case 33
	.4byte _080D26C6 @ case 34
	.4byte _080D26C6 @ case 35
	.4byte _080D22A6 @ case 36
	.4byte _080D22F8 @ case 37
	.4byte _080D26C6 @ case 38
	.4byte _080D22F8 @ case 39
	.4byte _080D26C6 @ case 40
	.4byte _080D26C6 @ case 41
	.4byte _080D26C6 @ case 42
	.4byte _080D26C6 @ case 43
	.4byte _080D2260 @ case 44
	.4byte _080D26C6 @ case 45
	.4byte _080D26C6 @ case 46
	.4byte _080D24AE @ case 47
	.4byte _080D26C6 @ case 48
	.4byte _080D26C6 @ case 49
	.4byte _080D26C6 @ case 50
	.4byte _080D26C6 @ case 51
	.4byte _080D26C6 @ case 52
	.4byte _080D2546 @ case 53
	.4byte _080D26C6 @ case 54
	.4byte _080D26C6 @ case 55
	.4byte _080D2582 @ case 56
	.4byte _080D26C6 @ case 57
	.4byte _080D26C6 @ case 58
	.4byte _080D26C6 @ case 59
	.4byte _080D26C6 @ case 60
	.4byte _080D26C6 @ case 61
	.4byte _080D26C6 @ case 62
	.4byte _080D26C6 @ case 63
	.4byte _080D26C6 @ case 64
	.4byte _080D26C6 @ case 65
	.4byte _080D26C6 @ case 66
	.4byte _080D2294 @ case 67
	.4byte _080D22AE @ case 68
	.4byte _080D22F8 @ case 69
	.4byte _080D22F8 @ case 70
	.4byte _080D22F8 @ case 71
	.4byte _080D2264 @ case 72
	.4byte _080D22AE @ case 73
	.4byte _080D26C6 @ case 74
	.4byte _080D26C6 @ case 75
	.4byte _080D2268 @ case 76
	.4byte _080D26C6 @ case 77
	.4byte _080D2468 @ case 78
	.4byte _080D24B6 @ case 79
	.4byte _080D24E4 @ case 80
	.4byte _080D228A @ case 81
	.4byte _080D26C6 @ case 82
	.4byte _080D2504 @ case 83
	.4byte _080D26C6 @ case 84
	.4byte _080D254E @ case 85
	.4byte _080D26C6 @ case 86
	.4byte _080D26C6 @ case 87
	.4byte _080D258C @ case 88
_080D2194:
	ldr r1, _080D21A8 @ 0x000001C9
	add r1, sp
	ldrb r0, [r1]
	cmp r0, #0
	beq _080D21A0
	b _080D1FFE
_080D21A0:
	movs r0, #0x20
	strb r0, [r1]
	b _080D1FFE
	.align 2, 0
_080D21A8: .4byte 0x000001C9
_080D21AC:
	movs r0, #1
	b _080D2278
_080D21B0:
	movs r4, #4
	add sl, r4
	mov r0, sl
	subs r0, #4
	ldr r0, [r0]
	str r0, [sp, #0x1f4]
	cmp r0, #0
	blt _080D21C2
	b _080D1FFE
_080D21C2:
	rsbs r0, r0, #0
	str r0, [sp, #0x1f4]
_080D21C6:
	movs r0, #4
	b _080D228C
_080D21CA:
	ldr r1, _080D21D4 @ 0x000001C9
	add r1, sp
	movs r0, #0x2b
	strb r0, [r1]
	b _080D1FFE
	.align 2, 0
_080D21D4: .4byte 0x000001C9
_080D21D8:
	ldr r2, [sp, #0x1e4]
	ldrb r2, [r2]
	str r2, [sp, #0x1e8]
	ldr r4, [sp, #0x1e4]
	adds r4, #1
	str r4, [sp, #0x1e4]
	cmp r2, #0x2a
	bne _080D2202
	movs r0, #4
	add sl, r0
	mov r0, sl
	subs r0, #4
	ldr r4, [r0]
	adds r6, r4, #0
	movs r0, #1
	rsbs r0, r0, #0
	cmp r6, r0
	blt _080D21FE
	b _080D1FFE
_080D21FE:
	adds r6, r0, #0
	b _080D1FFE
_080D2202:
	movs r4, #0
	ldr r0, [sp, #0x1e8]
	b _080D2222
_080D2208:
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #1
	subs r0, #0x30
	ldr r1, [sp, #0x1e8]
	adds r4, r0, r1
	ldr r2, [sp, #0x1e4]
	ldrb r2, [r2]
	str r2, [sp, #0x1e8]
	ldr r0, [sp, #0x1e4]
	adds r0, #1
	str r0, [sp, #0x1e4]
	adds r0, r2, #0
_080D2222:
	subs r0, #0x30
	cmp r0, #9
	bls _080D2208
	adds r6, r4, #0
	movs r0, #1
	rsbs r0, r0, #0
	cmp r6, r0
	blt _080D2234
	b _080D200A
_080D2234:
	adds r6, r0, #0
	b _080D200A
_080D2238:
	movs r0, #0x80
	b _080D228C
_080D223C:
	movs r4, #0
_080D223E:
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #1
	subs r0, #0x30
	ldr r2, [sp, #0x1e8]
	adds r4, r0, r2
	ldr r0, [sp, #0x1e4]
	ldrb r0, [r0]
	str r0, [sp, #0x1e8]
	ldr r1, [sp, #0x1e4]
	adds r1, #1
	str r1, [sp, #0x1e4]
	subs r0, #0x30
	cmp r0, #9
	bls _080D223E
	str r4, [sp, #0x1f4]
	b _080D200A
_080D2260:
	movs r0, #8
	b _080D2278
_080D2264:
	movs r0, #0x40
	b _080D2282
_080D2268:
	ldr r0, [sp, #0x1e4]
	ldrb r0, [r0]
	cmp r0, #0x6c
	bne _080D2280
	ldr r1, [sp, #0x1e4]
	adds r1, #1
	str r1, [sp, #0x1e4]
	movs r0, #0x20
_080D2278:
	ldr r2, [sp, #0x1ec]
	orrs r2, r0
	str r2, [sp, #0x1ec]
	b _080D1FFE
_080D2280:
	movs r0, #0x10
_080D2282:
	ldr r4, [sp, #0x1ec]
	orrs r4, r0
	str r4, [sp, #0x1ec]
	b _080D1FFE
_080D228A:
	movs r0, #0x20
_080D228C:
	ldr r1, [sp, #0x1ec]
	orrs r1, r0
	str r1, [sp, #0x1ec]
	b _080D1FFE
_080D2294:
	add r2, sp, #0x68
	mov r8, r2
	movs r4, #4
	add sl, r4
	mov r0, sl
	subs r0, #4
	ldr r0, [r0]
	strb r0, [r2]
	b _080D26D4
_080D22A6:
	movs r0, #0x10
	ldr r1, [sp, #0x1ec]
	orrs r1, r0
	str r1, [sp, #0x1ec]
_080D22AE:
	movs r0, #0x10
	ldr r2, [sp, #0x1ec]
	ands r0, r2
	cmp r0, #0
	beq _080D22BE
	movs r4, #4
	add sl, r4
	b _080D22DA
_080D22BE:
	movs r0, #0x40
	ldr r1, [sp, #0x1ec]
	ands r0, r1
	cmp r0, #0
	beq _080D22D6
	movs r2, #4
	add sl, r2
	mov r0, sl
	subs r0, #4
	movs r1, #0
	ldrsh r4, [r0, r1]
	b _080D22E0
_080D22D6:
	movs r2, #4
	add sl, r2
_080D22DA:
	mov r0, sl
	subs r0, #4
	ldr r4, [r0]
_080D22E0:
	cmp r4, #0
	bge _080D22EE
	rsbs r4, r4, #0
	ldr r1, _080D22F4 @ 0x000001C9
	add r1, sp
	movs r0, #0x2d
	strb r0, [r1]
_080D22EE:
	movs r2, #1
	b _080D25DA
	.align 2, 0
_080D22F4: .4byte 0x000001C9
_080D22F8:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r6, r0
	bne _080D2304
	movs r6, #6
	b _080D2314
_080D2304:
	ldr r4, [sp, #0x1e8]
	cmp r4, #0x67
	beq _080D230E
	cmp r4, #0x47
	bne _080D2314
_080D230E:
	cmp r6, #0
	bne _080D2314
	movs r6, #1
_080D2314:
	movs r0, #8
	ldr r1, [sp, #0x1ec]
	ands r0, r1
	movs r2, #8
	add sl, r2
	mov r0, sl
	subs r0, #8
	ldr r1, [r0]
	ldr r2, [r0, #4]
	str r1, [sp, #0x1fc]
	str r2, [sp, #0x200]
	ldr r0, [sp, #0x1fc]
	ldr r1, [sp, #0x200]
	bl sub_080D55FC
	cmp r0, #0
	beq _080D2368
	ldr r3, _080D235C @ 0x00000000
	ldr r2, _080D2358 @ 0x00000000
	ldr r0, [sp, #0x1fc]
	ldr r1, [sp, #0x200]
	bl __ltdf2
	cmp r0, #0
	bge _080D234E
	ldr r1, _080D2360 @ 0x000001C9
	add r1, sp
	movs r0, #0x2d
	strb r0, [r1]
_080D234E:
	ldr r2, _080D2364 @ 0x08587720
	mov r8, r2
	movs r3, #3
	b _080D26DE
	.align 2, 0
_080D2358: .4byte 0x00000000
_080D235C: .4byte 0x00000000
_080D2360: .4byte 0x000001C9
_080D2364: .4byte 0x08587720
_080D2368:
	ldr r0, [sp, #0x1fc]
	ldr r1, [sp, #0x200]
	bl sub_080D5620
	cmp r0, #0
	beq _080D2380
	ldr r4, _080D237C @ 0x08587724
	mov r8, r4
	movs r3, #3
	b _080D26DE
	.align 2, 0
_080D237C: .4byte 0x08587724
_080D2380:
	movs r0, #0x80
	lsls r0, r0, #1
	ldr r1, [sp, #0x1ec]
	orrs r1, r0
	str r1, [sp, #0x1ec]
	str r1, [sp]
	add r0, sp, #0x1c8
	str r0, [sp, #4]
	add r0, sp, #0x1d4
	str r0, [sp, #8]
	ldr r2, [sp, #0x1e8]
	str r2, [sp, #0xc]
	add r0, sp, #0x1d8
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x1dc]
	ldr r1, [sp, #0x1fc]
	ldr r2, [sp, #0x200]
	adds r3, r6, #0
	bl cvt
	mov r8, r0
	ldr r4, [sp, #0x1e8]
	cmp r4, #0x67
	beq _080D23B4
	cmp r4, #0x47
	bne _080D23D6
_080D23B4:
	add r0, sp, #0x1d4
	ldr r1, [r0]
	movs r0, #4
	rsbs r0, r0, #0
	cmp r1, r0
	ble _080D23C4
	cmp r1, r6
	ble _080D23D2
_080D23C4:
	movs r0, #0x45
	ldr r1, [sp, #0x1e8]
	cmp r1, #0x67
	bne _080D23CE
	movs r0, #0x65
_080D23CE:
	str r0, [sp, #0x1e8]
	b _080D23D6
_080D23D2:
	movs r2, #0x67
	str r2, [sp, #0x1e8]
_080D23D6:
	ldr r4, [sp, #0x1e8]
	cmp r4, #0x65
	bgt _080D23FC
	add r0, sp, #0x1d4
	ldr r1, [r0]
	subs r1, #1
	str r1, [r0]
	add r0, sp, #0x14
	ldr r2, [sp, #0x1e8]
	bl exponent
	str r0, [sp, #0x204]
	add r0, sp, #0x1d8
	ldr r0, [r0]
	ldr r1, [sp, #0x204]
	adds r3, r1, r0
	cmp r0, #1
	bgt _080D243C
	b _080D2432
_080D23FC:
	ldr r4, [sp, #0x1e8]
	cmp r4, #0x66
	bne _080D2424
	add r0, sp, #0x1d4
	ldr r0, [r0]
	cmp r0, #0
	ble _080D2420
	adds r3, r0, #0
	cmp r6, #0
	bne _080D241A
	movs r0, #1
	ldr r1, [sp, #0x1ec]
	ands r0, r1
	cmp r0, #0
	beq _080D244C
_080D241A:
	adds r0, r3, #1
	adds r3, r0, r6
	b _080D244C
_080D2420:
	adds r3, r6, #2
	b _080D244C
_080D2424:
	add r0, sp, #0x1d4
	ldr r1, [r0]
	add r0, sp, #0x1d8
	ldr r0, [r0]
	cmp r1, r0
	blt _080D2440
	adds r3, r1, #0
_080D2432:
	movs r0, #1
	ldr r2, [sp, #0x1ec]
	ands r0, r2
	cmp r0, #0
	beq _080D244C
_080D243C:
	adds r3, #1
	b _080D244C
_080D2440:
	cmp r1, #0
	bgt _080D244A
	adds r0, #2
	subs r3, r0, r1
	b _080D244C
_080D244A:
	adds r3, r0, #1
_080D244C:
	add r0, sp, #0x1c8
	ldrb r0, [r0]
	adds r7, r5, #0
	adds r7, #8
	cmp r0, #0
	bne _080D245A
	b _080D26E2
_080D245A:
	ldr r1, _080D2464 @ 0x000001C9
	add r1, sp
	movs r0, #0x2d
	strb r0, [r1]
	b _080D26E2
	.align 2, 0
_080D2464: .4byte 0x000001C9
_080D2468:
	movs r0, #0x10
	ldr r4, [sp, #0x1ec]
	ands r0, r4
	cmp r0, #0
	beq _080D2482
	movs r0, #4
	add sl, r0
	mov r0, sl
	subs r0, #4
	ldr r0, [r0]
	ldr r1, [sp, #0x1f0]
	str r1, [r0]
	b _080D1F70
_080D2482:
	movs r0, #0x40
	ldr r2, [sp, #0x1ec]
	ands r2, r0
	cmp r2, #0
	beq _080D249E
	movs r4, #4
	add sl, r4
	mov r0, sl
	subs r0, #4
	ldr r0, [r0]
	add r1, sp, #0x1f0
	ldrh r1, [r1]
	strh r1, [r0]
	b _080D1F70
_080D249E:
	movs r2, #4
	add sl, r2
	mov r0, sl
	subs r0, #4
	ldr r0, [r0]
	ldr r4, [sp, #0x1f0]
	str r4, [r0]
	b _080D1F70
_080D24AE:
	movs r0, #0x10
	ldr r1, [sp, #0x1ec]
	orrs r1, r0
	str r1, [sp, #0x1ec]
_080D24B6:
	movs r0, #0x10
	ldr r2, [sp, #0x1ec]
	ands r0, r2
	cmp r0, #0
	bne _080D24D6
	movs r0, #0x40
	ldr r1, [sp, #0x1ec]
	ands r0, r1
	cmp r0, #0
	beq _080D24D6
	movs r2, #4
	add sl, r2
	mov r0, sl
	subs r0, #4
	ldrh r4, [r0]
	b _080D24E0
_080D24D6:
	movs r4, #4
	add sl, r4
	mov r0, sl
	subs r0, #4
	ldr r4, [r0]
_080D24E0:
	movs r2, #0
	b _080D25D2
_080D24E4:
	movs r0, #4
	add sl, r0
	mov r0, sl
	subs r0, #4
	ldr r4, [r0]
	movs r2, #2
	ldr r1, _080D2500 @ 0x08587728
	str r1, [sp, #0x210]
	ldr r0, [sp, #0x1ec]
	orrs r0, r2
	str r0, [sp, #0x1ec]
	movs r1, #0x78
	str r1, [sp, #0x1e8]
	b _080D25D2
	.align 2, 0
_080D2500: .4byte 0x08587728
_080D2504:
	movs r2, #4
	add sl, r2
	mov r0, sl
	subs r0, #4
	ldr r0, [r0]
	mov r8, r0
	cmp r0, #0
	bne _080D2518
	ldr r4, _080D2538 @ 0x0858773C
	mov r8, r4
_080D2518:
	cmp r6, #0
	blt _080D253C
	mov r0, r8
	movs r1, #0
	adds r2, r6, #0
	bl .gcc2_compiled._28
	cmp r0, #0
	beq _080D2534
	mov r1, r8
	subs r3, r0, r1
	cmp r3, r6
	bgt _080D2534
	b _080D26D6
_080D2534:
	adds r3, r6, #0
	b _080D26D6
	.align 2, 0
_080D2538: .4byte 0x0858773C
_080D253C:
	mov r0, r8
	bl sub_080D1D88
	adds r3, r0, #0
	b _080D26D6
_080D2546:
	movs r0, #0x10
	ldr r2, [sp, #0x1ec]
	orrs r2, r0
	str r2, [sp, #0x1ec]
_080D254E:
	movs r0, #0x10
	ldr r4, [sp, #0x1ec]
	ands r0, r4
	cmp r0, #0
	beq _080D255E
	movs r0, #4
	add sl, r0
	b _080D2578
_080D255E:
	movs r0, #0x40
	ldr r1, [sp, #0x1ec]
	ands r0, r1
	cmp r0, #0
	beq _080D2574
	movs r2, #4
	add sl, r2
	mov r0, sl
	subs r0, #4
	ldrh r4, [r0]
	b _080D257E
_080D2574:
	movs r4, #4
	add sl, r4
_080D2578:
	mov r0, sl
	subs r0, #4
	ldr r4, [r0]
_080D257E:
	movs r2, #1
	b _080D25D2
_080D2582:
	ldr r0, _080D2588 @ 0x08587744
	str r0, [sp, #0x210]
	b _080D2590
	.align 2, 0
_080D2588: .4byte 0x08587744
_080D258C:
	ldr r1, _080D25B0 @ 0x08587728
	str r1, [sp, #0x210]
_080D2590:
	movs r0, #0x10
	ldr r2, [sp, #0x1ec]
	ands r0, r2
	cmp r0, #0
	bne _080D25B4
	movs r0, #0x40
	ldr r1, [sp, #0x1ec]
	ands r0, r1
	cmp r0, #0
	beq _080D25B4
	movs r2, #4
	add sl, r2
	mov r0, sl
	subs r0, #4
	ldrh r4, [r0]
	b _080D25BE
	.align 2, 0
_080D25B0: .4byte 0x08587728
_080D25B4:
	movs r4, #4
	add sl, r4
	mov r0, sl
	subs r0, #4
	ldr r4, [r0]
_080D25BE:
	movs r2, #2
	movs r0, #1
	ldr r1, [sp, #0x1ec]
	ands r0, r1
	cmp r0, #0
	beq _080D25D2
	cmp r4, #0
	beq _080D25D2
	orrs r1, r2
	str r1, [sp, #0x1ec]
_080D25D2:
	ldr r1, _080D261C @ 0x000001C9
	add r1, sp
	movs r0, #0
	strb r0, [r1]
_080D25DA:
	str r6, [sp, #0x208]
	cmp r6, #0
	blt _080D25EA
	movs r0, #0x81
	rsbs r0, r0, #0
	ldr r1, [sp, #0x1ec]
	ands r1, r0
	str r1, [sp, #0x1ec]
_080D25EA:
	movs r0, #0xe2
	lsls r0, r0, #1
	add r0, sp
	mov r8, r0
	cmp r4, #0
	bne _080D2600
	adds r7, r5, #0
	adds r7, #8
	ldr r1, [sp, #0x208]
	cmp r1, #0
	beq _080D26B8
_080D2600:
	cmp r2, #1
	beq _080D265E
	cmp r2, #1
	blo _080D2624
	cmp r2, #2
	beq _080D2698
	ldr r2, _080D2620 @ 0x08587758
	mov r8, r2
	mov r0, r8
	bl sub_080D1D88
	adds r3, r0, #0
	b _080D26DE
	.align 2, 0
_080D261C: .4byte 0x000001C9
_080D2620: .4byte 0x08587758
_080D2624:
	adds r7, r5, #0
	adds r7, #8
	movs r2, #7
_080D262A:
	movs r0, #1
	rsbs r0, r0, #0
	add r8, r0
	adds r0, r4, #0
	ands r0, r2
	adds r1, r0, #0
	adds r1, #0x30
	mov r0, r8
	strb r1, [r0]
	lsrs r4, r4, #3
	cmp r4, #0
	bne _080D262A
	movs r0, #1
	ldr r2, [sp, #0x1ec]
	ands r0, r2
	cmp r0, #0
	beq _080D26B8
	cmp r1, #0x30
	beq _080D26B8
	movs r4, #1
	rsbs r4, r4, #0
	add r8, r4
	movs r0, #0x30
	mov r1, r8
	strb r0, [r1]
	b _080D26B8
_080D265E:
	adds r7, r5, #0
	adds r7, #8
	cmp r4, #9
	bls _080D2688
_080D2666:
	movs r2, #1
	rsbs r2, r2, #0
	add r8, r2
	adds r0, r4, #0
	movs r1, #0xa
	bl StandardMOD
	adds r0, #0x30
	mov r1, r8
	strb r0, [r1]
	adds r0, r4, #0
	movs r1, #0xa
	bl StandardDIV
	adds r4, r0, #0
	cmp r4, #9
	bhi _080D2666
_080D2688:
	movs r2, #1
	rsbs r2, r2, #0
	add r8, r2
	adds r0, r4, #0
	adds r0, #0x30
	mov r4, r8
	strb r0, [r4]
	b _080D26B8
_080D2698:
	adds r7, r5, #0
	adds r7, #8
	movs r1, #0xf
_080D269E:
	movs r0, #1
	rsbs r0, r0, #0
	add r8, r0
	adds r0, r4, #0
	ands r0, r1
	ldr r2, [sp, #0x210]
	adds r0, r2, r0
	ldrb r0, [r0]
	mov r2, r8
	strb r0, [r2]
	lsrs r4, r4, #4
	cmp r4, #0
	bne _080D269E
_080D26B8:
	add r4, sp, #0x14
	mov r1, r8
	subs r0, r4, r1
	movs r2, #0xd8
	lsls r2, r2, #1
	adds r3, r0, r2
	b _080D26E2
_080D26C6:
	ldr r4, [sp, #0x1e8]
	cmp r4, #0
	bne _080D26CE
	b _080D2DDC
_080D26CE:
	add r0, sp, #0x68
	mov r8, r0
	strb r4, [r0]
_080D26D4:
	movs r3, #1
_080D26D6:
	ldr r1, _080D2700 @ 0x000001C9
	add r1, sp
	movs r0, #0
	strb r0, [r1]
_080D26DE:
	adds r7, r5, #0
	adds r7, #8
_080D26E2:
	str r3, [sp, #0x20c]
	ldr r2, [sp, #0x208]
	cmp r3, r2
	bge _080D26EC
	str r2, [sp, #0x20c]
_080D26EC:
	ldr r0, _080D2700 @ 0x000001C9
	add r0, sp
	ldrb r0, [r0]
	cmp r0, #0
	beq _080D2704
	ldr r4, [sp, #0x20c]
	adds r4, #1
	str r4, [sp, #0x20c]
	b _080D2714
	.align 2, 0
_080D2700: .4byte 0x000001C9
_080D2704:
	movs r0, #2
	ldr r1, [sp, #0x1ec]
	ands r0, r1
	cmp r0, #0
	beq _080D2714
	ldr r2, [sp, #0x20c]
	adds r2, #2
	str r2, [sp, #0x20c]
_080D2714:
	movs r0, #0x84
	ldr r4, [sp, #0x1ec]
	ands r0, r4
	cmp r0, #0
	bne _080D2794
	ldr r0, [sp, #0x1f4]
	ldr r1, [sp, #0x20c]
	subs r4, r0, r1
	cmp r4, #0
	ble _080D2794
	ldr r1, _080D27C0 @ 0x08587700
	cmp r4, #0x10
	ble _080D2768
	mov r6, sb
_080D2730:
	str r1, [r5]
	movs r0, #0x10
	str r0, [r5, #4]
	ldr r0, [r6, #8]
	adds r0, #0x10
	str r0, [r6, #8]
	adds r5, r7, #0
	ldr r0, [r6, #4]
	adds r0, #1
	str r0, [r6, #4]
	cmp r0, #7
	ble _080D275E
	ldr r0, [sp, #0x1e0]
	mov r1, sb
	str r3, [sp, #0x21c]
	bl sub_080D1E10
	ldr r3, [sp, #0x21c]
	cmp r0, #0
	beq _080D275A
	b _080D2DF4
_080D275A:
	add r5, sp, #0x28
	ldr r1, _080D27C0 @ 0x08587700
_080D275E:
	subs r4, #0x10
	adds r7, r5, #0
	adds r7, #8
	cmp r4, #0x10
	bgt _080D2730
_080D2768:
	str r1, [r5]
	str r4, [r5, #4]
	mov r2, sb
	ldr r0, [r2, #8]
	adds r0, r0, r4
	str r0, [r2, #8]
	adds r5, r7, #0
	ldr r0, [r2, #4]
	adds r0, #1
	str r0, [r2, #4]
	cmp r0, #7
	ble _080D2794
	ldr r0, [sp, #0x1e0]
	mov r1, sb
	str r3, [sp, #0x21c]
	bl sub_080D1E10
	ldr r3, [sp, #0x21c]
	cmp r0, #0
	beq _080D2792
	b _080D2DF4
_080D2792:
	add r5, sp, #0x28
_080D2794:
	ldr r1, _080D27C4 @ 0x000001C9
	add r1, sp
	ldrb r0, [r1]
	cmp r0, #0
	beq _080D27C8
	str r1, [r5]
	movs r0, #1
	str r0, [r5, #4]
	mov r4, sb
	ldr r0, [r4, #8]
	adds r0, #1
	str r0, [r4, #8]
	adds r5, #8
	ldr r0, [r4, #4]
	adds r0, #1
	str r0, [r4, #4]
	cmp r0, #7
	ble _080D2808
	ldr r0, [sp, #0x1e0]
	mov r1, sb
	b _080D27F8
	.align 2, 0
_080D27C0: .4byte 0x08587700
_080D27C4: .4byte 0x000001C9
_080D27C8:
	movs r2, #2
	ldr r0, [sp, #0x1ec]
	ands r0, r2
	cmp r0, #0
	beq _080D2808
	add r1, sp, #0x1c4
	movs r0, #0x30
	strb r0, [r1]
	add r0, sp, #0x1e8
	ldrb r0, [r0]
	strb r0, [r1, #1]
	str r1, [r5]
	str r2, [r5, #4]
	mov r1, sb
	ldr r0, [r1, #8]
	adds r0, #2
	str r0, [r1, #8]
	adds r5, #8
	ldr r0, [r1, #4]
	adds r0, #1
	str r0, [r1, #4]
	cmp r0, #7
	ble _080D2808
	ldr r0, [sp, #0x1e0]
_080D27F8:
	str r3, [sp, #0x21c]
	bl sub_080D1E10
	ldr r3, [sp, #0x21c]
	cmp r0, #0
	beq _080D2806
	b _080D2DF4
_080D2806:
	add r5, sp, #0x28
_080D2808:
	movs r0, #0x84
	ldr r2, [sp, #0x1ec]
	ands r0, r2
	cmp r0, #0x80
	bne _080D2884
	ldr r0, [sp, #0x1f4]
	ldr r1, [sp, #0x20c]
	subs r4, r0, r1
	cmp r4, #0
	ble _080D2884
	ldr r1, _080D2920 @ 0x08587710
	cmp r4, #0x10
	ble _080D2858
	mov r6, sb
_080D2824:
	str r1, [r5]
	movs r0, #0x10
	str r0, [r5, #4]
	ldr r0, [r6, #8]
	adds r0, #0x10
	str r0, [r6, #8]
	adds r5, #8
	ldr r0, [r6, #4]
	adds r0, #1
	str r0, [r6, #4]
	cmp r0, #7
	ble _080D2852
	ldr r0, [sp, #0x1e0]
	mov r1, sb
	str r3, [sp, #0x21c]
	bl sub_080D1E10
	ldr r3, [sp, #0x21c]
	cmp r0, #0
	beq _080D284E
	b _080D2DF4
_080D284E:
	add r5, sp, #0x28
	ldr r1, _080D2920 @ 0x08587710
_080D2852:
	subs r4, #0x10
	cmp r4, #0x10
	bgt _080D2824
_080D2858:
	str r1, [r5]
	str r4, [r5, #4]
	mov r2, sb
	ldr r0, [r2, #8]
	adds r0, r0, r4
	str r0, [r2, #8]
	adds r5, #8
	ldr r0, [r2, #4]
	adds r0, #1
	str r0, [r2, #4]
	cmp r0, #7
	ble _080D2884
	ldr r0, [sp, #0x1e0]
	mov r1, sb
	str r3, [sp, #0x21c]
	bl sub_080D1E10
	ldr r3, [sp, #0x21c]
	cmp r0, #0
	beq _080D2882
	b _080D2DF4
_080D2882:
	add r5, sp, #0x28
_080D2884:
	ldr r0, [sp, #0x208]
	subs r4, r0, r3
	cmp r4, #0
	ble _080D28F2
	ldr r1, _080D2920 @ 0x08587710
	cmp r4, #0x10
	ble _080D28C8
	mov r6, sb
_080D2894:
	str r1, [r5]
	movs r0, #0x10
	str r0, [r5, #4]
	ldr r0, [r6, #8]
	adds r0, #0x10
	str r0, [r6, #8]
	adds r5, #8
	ldr r0, [r6, #4]
	adds r0, #1
	str r0, [r6, #4]
	cmp r0, #7
	ble _080D28C2
	ldr r0, [sp, #0x1e0]
	mov r1, sb
	str r3, [sp, #0x21c]
	bl sub_080D1E10
	ldr r3, [sp, #0x21c]
	cmp r0, #0
	beq _080D28BE
	b _080D2DF4
_080D28BE:
	add r5, sp, #0x28
	ldr r1, _080D2920 @ 0x08587710
_080D28C2:
	subs r4, #0x10
	cmp r4, #0x10
	bgt _080D2894
_080D28C8:
	str r1, [r5]
	str r4, [r5, #4]
	mov r1, sb
	ldr r0, [r1, #8]
	adds r0, r0, r4
	str r0, [r1, #8]
	adds r5, #8
	ldr r0, [r1, #4]
	adds r0, #1
	str r0, [r1, #4]
	cmp r0, #7
	ble _080D28F2
	ldr r0, [sp, #0x1e0]
	str r3, [sp, #0x21c]
	bl sub_080D1E10
	ldr r3, [sp, #0x21c]
	cmp r0, #0
	beq _080D28F0
	b _080D2DF4
_080D28F0:
	add r5, sp, #0x28
_080D28F2:
	movs r0, #0x80
	lsls r0, r0, #1
	ldr r2, [sp, #0x1ec]
	ands r0, r2
	cmp r0, #0
	bne _080D2924
	mov r4, r8
	str r4, [r5]
	str r3, [r5, #4]
	mov r1, sb
	ldr r0, [r1, #8]
	adds r0, r0, r3
	str r0, [r1, #8]
	adds r5, #8
	ldr r0, [r1, #4]
	adds r0, #1
	str r0, [r1, #4]
	cmp r0, #7
	bgt _080D291A
	b _080D2D3A
_080D291A:
	ldr r0, [sp, #0x1e0]
	b _080D2D30
	.align 2, 0
_080D2920: .4byte 0x08587710
_080D2924:
	ldr r2, [sp, #0x1e8]
	cmp r2, #0x65
	bgt _080D292C
	b _080D2C10
_080D292C:
	ldr r3, _080D29F8 @ 0x00000000
	ldr r2, _080D29F4 @ 0x00000000
	ldr r0, [sp, #0x1fc]
	ldr r1, [sp, #0x200]
	bl __eqdf2
	cmp r0, #0
	bne _080D2A04
	ldr r0, _080D29FC @ 0x08587774
	str r0, [r5]
	movs r6, #1
	str r6, [r5, #4]
	mov r4, sb
	ldr r0, [r4, #8]
	adds r0, #1
	str r0, [r4, #8]
	adds r5, #8
	ldr r0, [r4, #4]
	adds r0, #1
	str r0, [r4, #4]
	cmp r0, #7
	ble _080D2968
	ldr r0, [sp, #0x1e0]
	mov r1, sb
	bl sub_080D1E10
	cmp r0, #0
	beq _080D2966
	b _080D2DF4
_080D2966:
	add r5, sp, #0x28
_080D2968:
	add r0, sp, #0x1d4
	ldr r1, [r0]
	add r4, sp, #0x1d8
	ldr r0, [r4]
	cmp r1, r0
	blt _080D297E
	ldr r0, [sp, #0x1ec]
	ands r0, r6
	cmp r0, #0
	bne _080D297E
	b _080D2D3A
_080D297E:
	ldr r0, [sp, #0x1f8]
	str r0, [r5]
	str r6, [r5, #4]
	mov r1, sb
	ldr r0, [r1, #8]
	adds r0, #1
	str r0, [r1, #8]
	adds r5, #8
	ldr r0, [r1, #4]
	adds r0, #1
	str r0, [r1, #4]
	cmp r0, #7
	ble _080D29A6
	ldr r0, [sp, #0x1e0]
	bl sub_080D1E10
	cmp r0, #0
	beq _080D29A4
	b _080D2DF4
_080D29A4:
	add r5, sp, #0x28
_080D29A6:
	ldr r0, [r4]
	subs r4, r0, #1
	cmp r4, #0
	bgt _080D29B0
	b _080D2D3A
_080D29B0:
	ldr r1, _080D2A00 @ 0x08587710
	cmp r4, #0x10
	ble _080D29E8
	mov r6, sb
_080D29B8:
	str r1, [r5]
	movs r0, #0x10
	str r0, [r5, #4]
	ldr r0, [r6, #8]
	adds r0, #0x10
	str r0, [r6, #8]
	adds r5, #8
	ldr r0, [r6, #4]
	adds r0, #1
	str r0, [r6, #4]
	cmp r0, #7
	ble _080D29E2
	ldr r0, [sp, #0x1e0]
	mov r1, sb
	bl sub_080D1E10
	cmp r0, #0
	beq _080D29DE
	b _080D2DF4
_080D29DE:
	add r5, sp, #0x28
	ldr r1, _080D2A00 @ 0x08587710
_080D29E2:
	subs r4, #0x10
	cmp r4, #0x10
	bgt _080D29B8
_080D29E8:
	str r1, [r5]
	str r4, [r5, #4]
	mov r2, sb
	ldr r0, [r2, #8]
	adds r0, r0, r4
	b _080D2D1E
	.align 2, 0
_080D29F4: .4byte 0x00000000
_080D29F8: .4byte 0x00000000
_080D29FC: .4byte 0x08587774
_080D2A00: .4byte 0x08587710
_080D2A04:
	add r6, sp, #0x1d4
	ldr r2, [r6]
	cmp r2, #0
	bgt _080D2AEC
	ldr r0, _080D2AE4 @ 0x08587774
	str r0, [r5]
	movs r4, #1
	str r4, [r5, #4]
	mov r1, sb
	ldr r0, [r1, #8]
	adds r0, #1
	str r0, [r1, #8]
	adds r5, #8
	ldr r0, [r1, #4]
	adds r0, #1
	str r0, [r1, #4]
	cmp r0, #7
	ble _080D2A36
	ldr r0, [sp, #0x1e0]
	bl sub_080D1E10
	cmp r0, #0
	beq _080D2A34
	b _080D2DF4
_080D2A34:
	add r5, sp, #0x28
_080D2A36:
	ldr r2, [sp, #0x1f8]
	str r2, [r5]
	str r4, [r5, #4]
	mov r4, sb
	ldr r0, [r4, #8]
	adds r0, #1
	str r0, [r4, #8]
	adds r5, #8
	ldr r0, [r4, #4]
	adds r0, #1
	str r0, [r4, #4]
	cmp r0, #7
	ble _080D2A60
	ldr r0, [sp, #0x1e0]
	mov r1, sb
	bl sub_080D1E10
	cmp r0, #0
	beq _080D2A5E
	b _080D2DF4
_080D2A5E:
	add r5, sp, #0x28
_080D2A60:
	ldr r0, [r6]
	rsbs r4, r0, #0
	cmp r4, #0
	ble _080D2AC6
	ldr r1, _080D2AE8 @ 0x08587710
	cmp r4, #0x10
	ble _080D2AA0
	mov r6, sb
_080D2A70:
	str r1, [r5]
	movs r0, #0x10
	str r0, [r5, #4]
	ldr r0, [r6, #8]
	adds r0, #0x10
	str r0, [r6, #8]
	adds r5, #8
	ldr r0, [r6, #4]
	adds r0, #1
	str r0, [r6, #4]
	cmp r0, #7
	ble _080D2A9A
	ldr r0, [sp, #0x1e0]
	mov r1, sb
	bl sub_080D1E10
	cmp r0, #0
	beq _080D2A96
	b _080D2DF4
_080D2A96:
	add r5, sp, #0x28
	ldr r1, _080D2AE8 @ 0x08587710
_080D2A9A:
	subs r4, #0x10
	cmp r4, #0x10
	bgt _080D2A70
_080D2AA0:
	str r1, [r5]
	str r4, [r5, #4]
	mov r1, sb
	ldr r0, [r1, #8]
	adds r0, r0, r4
	str r0, [r1, #8]
	adds r5, #8
	ldr r0, [r1, #4]
	adds r0, #1
	str r0, [r1, #4]
	cmp r0, #7
	ble _080D2AC6
	ldr r0, [sp, #0x1e0]
	bl sub_080D1E10
	cmp r0, #0
	beq _080D2AC4
	b _080D2DF4
_080D2AC4:
	add r5, sp, #0x28
_080D2AC6:
	mov r2, r8
	str r2, [r5]
	add r0, sp, #0x1d8
	ldr r1, [r0]
	str r1, [r5, #4]
	mov r4, sb
	ldr r0, [r4, #8]
	adds r0, r0, r1
	str r0, [r4, #8]
	adds r5, #8
	ldr r0, [r4, #4]
	adds r0, #1
	str r0, [r4, #4]
	b _080D2D28
	.align 2, 0
_080D2AE4: .4byte 0x08587774
_080D2AE8: .4byte 0x08587710
_080D2AEC:
	add r4, sp, #0x1d8
	ldr r1, [r4]
	cmp r2, r1
	blt _080D2BA8
	mov r0, r8
	str r0, [r5]
	str r1, [r5, #4]
	mov r2, sb
	ldr r0, [r2, #8]
	adds r0, r0, r1
	str r0, [r2, #8]
	adds r5, #8
	ldr r0, [r2, #4]
	adds r0, #1
	str r0, [r2, #4]
	cmp r0, #7
	ble _080D2B1E
	ldr r0, [sp, #0x1e0]
	mov r1, sb
	bl sub_080D1E10
	cmp r0, #0
	beq _080D2B1C
	b _080D2DF4
_080D2B1C:
	add r5, sp, #0x28
_080D2B1E:
	ldr r1, [r6]
	ldr r0, [r4]
	subs r4, r1, r0
	cmp r4, #0
	ble _080D2B86
	ldr r1, _080D2BA0 @ 0x08587710
	cmp r4, #0x10
	ble _080D2B60
	mov r6, sb
_080D2B30:
	str r1, [r5]
	movs r0, #0x10
	str r0, [r5, #4]
	ldr r0, [r6, #8]
	adds r0, #0x10
	str r0, [r6, #8]
	adds r5, #8
	ldr r0, [r6, #4]
	adds r0, #1
	str r0, [r6, #4]
	cmp r0, #7
	ble _080D2B5A
	ldr r0, [sp, #0x1e0]
	mov r1, sb
	bl sub_080D1E10
	cmp r0, #0
	beq _080D2B56
	b _080D2DF4
_080D2B56:
	add r5, sp, #0x28
	ldr r1, _080D2BA0 @ 0x08587710
_080D2B5A:
	subs r4, #0x10
	cmp r4, #0x10
	bgt _080D2B30
_080D2B60:
	str r1, [r5]
	str r4, [r5, #4]
	mov r1, sb
	ldr r0, [r1, #8]
	adds r0, r0, r4
	str r0, [r1, #8]
	adds r5, #8
	ldr r0, [r1, #4]
	adds r0, #1
	str r0, [r1, #4]
	cmp r0, #7
	ble _080D2B86
	ldr r0, [sp, #0x1e0]
	bl sub_080D1E10
	cmp r0, #0
	beq _080D2B84
	b _080D2DF4
_080D2B84:
	add r5, sp, #0x28
_080D2B86:
	movs r1, #1
	ldr r0, [sp, #0x1ec]
	ands r0, r1
	cmp r0, #0
	bne _080D2B92
	b _080D2D3A
_080D2B92:
	ldr r0, _080D2BA4 @ 0x08587778
	str r0, [r5]
	str r1, [r5, #4]
	mov r2, sb
	ldr r0, [r2, #8]
	adds r0, #1
	b _080D2D1E
	.align 2, 0
_080D2BA0: .4byte 0x08587710
_080D2BA4: .4byte 0x08587778
_080D2BA8:
	mov r0, r8
	str r0, [r5]
	str r2, [r5, #4]
	mov r1, sb
	ldr r0, [r1, #8]
	adds r0, r0, r2
	str r0, [r1, #8]
	adds r5, #8
	ldr r0, [r1, #4]
	adds r0, #1
	str r0, [r1, #4]
	cmp r0, #7
	ble _080D2BD0
	ldr r0, [sp, #0x1e0]
	bl sub_080D1E10
	cmp r0, #0
	beq _080D2BCE
	b _080D2DF4
_080D2BCE:
	add r5, sp, #0x28
_080D2BD0:
	ldr r0, [r6]
	add r8, r0
	ldr r0, _080D2C0C @ 0x08587778
	str r0, [r5]
	movs r0, #1
	str r0, [r5, #4]
	mov r2, sb
	ldr r0, [r2, #8]
	adds r0, #1
	str r0, [r2, #8]
	adds r5, #8
	ldr r0, [r2, #4]
	adds r0, #1
	str r0, [r2, #4]
	cmp r0, #7
	ble _080D2C00
	ldr r0, [sp, #0x1e0]
	mov r1, sb
	bl sub_080D1E10
	cmp r0, #0
	beq _080D2BFE
	b _080D2DF4
_080D2BFE:
	add r5, sp, #0x28
_080D2C00:
	mov r0, r8
	str r0, [r5]
	ldr r1, [r4]
	ldr r0, [r6]
	subs r1, r1, r0
	b _080D2D16
	.align 2, 0
_080D2C0C: .4byte 0x08587778
_080D2C10:
	add r4, sp, #0x1d8
	ldr r0, [r4]
	cmp r0, #1
	bgt _080D2C22
	movs r1, #1
	ldr r0, [sp, #0x1ec]
	ands r0, r1
	cmp r0, #0
	beq _080D2CE8
_080D2C22:
	add r1, sp, #0x1c4
	mov r2, r8
	ldrb r0, [r2]
	strb r0, [r1]
	movs r0, #1
	add r8, r0
	movs r0, #0x2e
	strb r0, [r1, #1]
	str r1, [r5]
	movs r0, #2
	str r0, [r5, #4]
	mov r1, sb
	ldr r0, [r1, #8]
	adds r0, #2
	str r0, [r1, #8]
	adds r5, #8
	ldr r0, [r1, #4]
	adds r0, #1
	str r0, [r1, #4]
	cmp r0, #7
	ble _080D2C5A
	ldr r0, [sp, #0x1e0]
	bl sub_080D1E10
	cmp r0, #0
	beq _080D2C58
	b _080D2DF4
_080D2C58:
	add r5, sp, #0x28
_080D2C5A:
	ldr r3, _080D2C84 @ 0x00000000
	ldr r2, _080D2C80 @ 0x00000000
	ldr r0, [sp, #0x1fc]
	ldr r1, [sp, #0x200]
	bl __nedf2
	cmp r0, #0
	beq _080D2C88
	mov r2, r8
	str r2, [r5]
	ldr r1, [r4]
	subs r0, r1, #1
	str r0, [r5, #4]
	mov r4, sb
	ldr r0, [r4, #8]
	subs r0, #1
	adds r0, r0, r1
	b _080D2CF4
	.align 2, 0
_080D2C80: .4byte 0x00000000
_080D2C84: .4byte 0x00000000
_080D2C88:
	ldr r0, [r4]
	subs r4, r0, #1
	cmp r4, #0
	ble _080D2D10
	ldr r1, _080D2CE4 @ 0x08587710
	cmp r4, #0x10
	ble _080D2CC8
	mov r6, sb
_080D2C98:
	str r1, [r5]
	movs r0, #0x10
	str r0, [r5, #4]
	ldr r0, [r6, #8]
	adds r0, #0x10
	str r0, [r6, #8]
	adds r5, #8
	ldr r0, [r6, #4]
	adds r0, #1
	str r0, [r6, #4]
	cmp r0, #7
	ble _080D2CC2
	ldr r0, [sp, #0x1e0]
	mov r1, sb
	bl sub_080D1E10
	cmp r0, #0
	beq _080D2CBE
	b _080D2DF4
_080D2CBE:
	add r5, sp, #0x28
	ldr r1, _080D2CE4 @ 0x08587710
_080D2CC2:
	subs r4, #0x10
	cmp r4, #0x10
	bgt _080D2C98
_080D2CC8:
	str r1, [r5]
	str r4, [r5, #4]
	mov r1, sb
	ldr r0, [r1, #8]
	adds r0, r0, r4
	str r0, [r1, #8]
	adds r5, #8
	ldr r0, [r1, #4]
	adds r0, #1
	str r0, [r1, #4]
	cmp r0, #7
	ble _080D2D10
	ldr r0, [sp, #0x1e0]
	b _080D2D06
	.align 2, 0
_080D2CE4: .4byte 0x08587710
_080D2CE8:
	mov r2, r8
	str r2, [r5]
	str r1, [r5, #4]
	mov r4, sb
	ldr r0, [r4, #8]
	adds r0, #1
_080D2CF4:
	str r0, [r4, #8]
	adds r5, #8
	ldr r0, [r4, #4]
	adds r0, #1
	str r0, [r4, #4]
	cmp r0, #7
	ble _080D2D10
	ldr r0, [sp, #0x1e0]
	mov r1, sb
_080D2D06:
	bl sub_080D1E10
	cmp r0, #0
	bne _080D2DF4
	add r5, sp, #0x28
_080D2D10:
	add r0, sp, #0x14
	str r0, [r5]
	ldr r1, [sp, #0x204]
_080D2D16:
	str r1, [r5, #4]
	mov r2, sb
	ldr r0, [r2, #8]
	adds r0, r0, r1
_080D2D1E:
	str r0, [r2, #8]
	adds r5, #8
	ldr r0, [r2, #4]
	adds r0, #1
	str r0, [r2, #4]
_080D2D28:
	cmp r0, #7
	ble _080D2D3A
	ldr r0, [sp, #0x1e0]
	mov r1, sb
_080D2D30:
	bl sub_080D1E10
	cmp r0, #0
	bne _080D2DF4
	add r5, sp, #0x28
_080D2D3A:
	movs r0, #4
	ldr r4, [sp, #0x1ec]
	ands r4, r0
	cmp r4, #0
	beq _080D2DA6
	ldr r0, [sp, #0x1f4]
	ldr r1, [sp, #0x20c]
	subs r4, r0, r1
	cmp r4, #0
	ble _080D2DA6
	ldr r1, _080D2DD8 @ 0x08587700
	cmp r4, #0x10
	ble _080D2D84
	mov r6, sb
_080D2D56:
	str r1, [r5]
	movs r0, #0x10
	str r0, [r5, #4]
	ldr r0, [r6, #8]
	adds r0, #0x10
	str r0, [r6, #8]
	adds r5, #8
	ldr r0, [r6, #4]
	adds r0, #1
	str r0, [r6, #4]
	cmp r0, #7
	ble _080D2D7E
	ldr r0, [sp, #0x1e0]
	mov r1, sb
	bl sub_080D1E10
	cmp r0, #0
	bne _080D2DF4
	add r5, sp, #0x28
	ldr r1, _080D2DD8 @ 0x08587700
_080D2D7E:
	subs r4, #0x10
	cmp r4, #0x10
	bgt _080D2D56
_080D2D84:
	str r1, [r5]
	str r4, [r5, #4]
	mov r2, sb
	ldr r0, [r2, #8]
	adds r0, r0, r4
	str r0, [r2, #8]
	ldr r0, [r2, #4]
	adds r0, #1
	str r0, [r2, #4]
	cmp r0, #7
	ble _080D2DA6
	ldr r0, [sp, #0x1e0]
	mov r1, sb
	bl sub_080D1E10
	cmp r0, #0
	bne _080D2DF4
_080D2DA6:
	ldr r0, [sp, #0x20c]
	ldr r4, [sp, #0x1f4]
	cmp r0, r4
	bge _080D2DB0
	adds r0, r4, #0
_080D2DB0:
	ldr r1, [sp, #0x1f0]
	adds r1, r1, r0
	str r1, [sp, #0x1f0]
	mov r2, sb
	ldr r0, [r2, #8]
	cmp r0, #0
	beq _080D2DCA
	ldr r0, [sp, #0x1e0]
	mov r1, sb
	bl sub_080D1E10
	cmp r0, #0
	bne _080D2DF4
_080D2DCA:
	movs r0, #0
	mov r4, sb
	str r0, [r4, #4]
	add r5, sp, #0x28
	bl _080D1F70
	.align 2, 0
_080D2DD8: .4byte 0x08587700
_080D2DDC:
	mov r1, sb
	ldr r0, [r1, #8]
	cmp r0, #0
	beq _080D2DEE
	ldr r0, [sp, #0x1e0]
	bl sub_080D1E10
	cmp r0, #0
	bne _080D2DF4
_080D2DEE:
	movs r0, #0
	mov r1, sb
	str r0, [r1, #4]
_080D2DF4:
	movs r0, #0x40
	ldr r2, [sp, #0x1e0]
	ldrh r2, [r2, #0xc]
	ands r0, r2
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, #0
	bne _080D2E06
	ldr r1, [sp, #0x1f0]
_080D2E06:
	adds r0, r1, #0
_080D2E08:
	movs r3, #0x88
	lsls r3, r3, #2
	add sp, r3
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7, pc}

	THUMB_FUNC_START cvt
cvt: @ 0x080D2E18
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x1c
	str r0, [sp, #0x18]
	adds r5, r2, #0
	adds r4, r1, #0
	mov r8, r3
	ldr r6, [sp, #0x3c]
	ldr r0, [sp, #0x44]
	mov sl, r0
	ldr r1, [sp, #0x48]
	mov sb, r1
	cmp r1, #0x66
	bne _080D2E3E
	movs r7, #3
	b _080D2E4E
_080D2E3E:
	mov r0, sb
	cmp r0, #0x65
	beq _080D2E48
	cmp r0, #0x45
	bne _080D2E4C
_080D2E48:
	movs r1, #1
	add r8, r1
_080D2E4C:
	movs r7, #2
_080D2E4E:
	lsls r0, r4, #0x1f
	lsrs r0, r0, #0x1f
	cmp r0, #0
	beq _080D2E64
	adds r1, r5, #0
	adds r0, r4, #0
	bl __negdf2
	adds r5, r1, #0
	adds r4, r0, #0
	movs r0, #0x2d
_080D2E64:
	ldr r1, [sp, #0x40]
	strb r0, [r1]
	mov r0, r8
	str r0, [sp]
	mov r1, sl
	str r1, [sp, #4]
	add r0, sp, #0x10
	str r0, [sp, #8]
	add r0, sp, #0x14
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x18]
	adds r2, r5, #0
	adds r1, r4, #0
	adds r3, r7, #0
	bl _dtoa_r
	adds r7, r0, #0
	mov r1, sb
	cmp r1, #0x67
	beq _080D2E90
	cmp r1, #0x47
	bne _080D2E98
_080D2E90:
	movs r0, #1
	ands r6, r0
	cmp r6, #0
	beq _080D2EEC
_080D2E98:
	mov r0, r8
	adds r6, r7, r0
	mov r1, sb
	cmp r1, #0x66
	bne _080D2EC8
	ldrb r0, [r7]
	cmp r0, #0x30
	bne _080D2EC2
	ldr r3, _080D2F08 @ 0x00000000
	ldr r2, _080D2F04 @ 0x00000000
	adds r1, r5, #0
	adds r0, r4, #0
	bl __nedf2
	cmp r0, #0
	beq _080D2EC2
	mov r1, r8
	rsbs r0, r1, #0
	adds r0, #1
	mov r1, sl
	str r0, [r1]
_080D2EC2:
	mov r1, sl
	ldr r0, [r1]
	adds r6, r6, r0
_080D2EC8:
	ldr r3, _080D2F08 @ 0x00000000
	ldr r2, _080D2F04 @ 0x00000000
	adds r1, r5, #0
	adds r0, r4, #0
	bl __eqdf2
	cmp r0, #0
	bne _080D2EDA
	str r6, [sp, #0x14]
_080D2EDA:
	ldr r0, [sp, #0x14]
	cmp r0, r6
	bhs _080D2EEC
	movs r1, #0x30
_080D2EE2:
	strb r1, [r0]
	adds r0, #1
	str r0, [sp, #0x14]
	cmp r0, r6
	blo _080D2EE2
_080D2EEC:
	ldr r0, [sp, #0x14]
	subs r0, r0, r7
	ldr r1, [sp, #0x4c]
	str r0, [r1]
	adds r0, r7, #0
	add sp, #0x1c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_080D2F04: .4byte 0x00000000
_080D2F08: .4byte 0x00000000

	THUMB_FUNC_START exponent
exponent: @ 0x080D2F0C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x134
	adds r7, r0, #0
	adds r6, r1, #0
	strb r2, [r7]
	adds r5, r7, #1
	cmp r6, #0
	bge _080D2F22
	rsbs r6, r6, #0
	movs r0, #0x2d
	b _080D2F24
_080D2F22:
	movs r0, #0x2b
_080D2F24:
	strb r0, [r7, #1]
	adds r5, #1
	add r4, sp, #0x134
	cmp r6, #9
	ble _080D2F66
_080D2F2E:
	subs r4, #1
	adds r0, r6, #0
	movs r1, #0xa
	bl ThumbModulo
	adds r0, #0x30
	strb r0, [r4]
	adds r0, r6, #0
	movs r1, #0xa
	bl ThumbDivide
	adds r6, r0, #0
	cmp r6, #9
	bgt _080D2F2E
	subs r4, #1
	adds r0, #0x30
	strb r0, [r4]
	add r0, sp, #0x134
	cmp r4, r0
	bhs _080D2F74
	adds r1, r0, #0
_080D2F58:
	ldrb r0, [r4]
	strb r0, [r5]
	adds r4, #1
	adds r5, #1
	cmp r4, r1
	blo _080D2F58
	b _080D2F74
_080D2F66:
	movs r0, #0x30
	strb r0, [r5]
	adds r5, #1
	adds r0, r6, #0
	adds r0, #0x30
	strb r0, [r5]
	adds r5, #1
_080D2F74:
	subs r0, r5, r7
	add sp, #0x134
	pop {r4, r5, r6, r7, pc}
	.byte 0x00, 0x00

	THUMB_FUNC_START sub_080D2F7C
sub_080D2F7C: @ 0x080D2F7C
	push {r4, r5, lr}
	sub sp, #0x58
	mov r4, sp
	movs r5, #0
	movs r3, #0x82
	lsls r3, r3, #2
	strh r3, [r4, #0xc]
	str r0, [sp]
	str r0, [sp, #0x10]
	ldr r0, _080D2FA8 @ 0x7FFFFFFF
	str r0, [sp, #8]
	str r0, [sp, #0x14]
	ldr r0, _080D2FAC @ 0x08B1FA20
	ldr r0, [r0]
	str r0, [sp, #0x54]
	mov r0, sp
	bl vfprintf
	ldr r1, [sp]
	strb r5, [r1]
	add sp, #0x58
	pop {r4, r5, pc}
	.align 2, 0
_080D2FA8: .4byte 0x7FFFFFFF
_080D2FAC: .4byte 0x08B1FA20

	THUMB_FUNC_START .gcc2_compiled._17
.gcc2_compiled._17: @ 0x080D2FB0
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x54]
	cmp r0, #0
	bne _080D2FC0
	ldr r0, _080D2FEC @ 0x08B1FA20
	ldr r0, [r0]
	str r0, [r4, #0x54]
_080D2FC0:
	ldr r1, [r4, #0x54]
	ldr r0, [r1, #0x38]
	cmp r0, #0
	bne _080D2FCE
	adds r0, r1, #0
	bl __sinit
_080D2FCE:
	ldrh r1, [r4, #0xc]
	movs r0, #8
	ands r0, r1
	lsls r0, r0, #0x10
	asrs r5, r0, #0x10
	cmp r5, #0
	bne _080D3028
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	bne _080D2FF0
	movs r0, #1
	rsbs r0, r0, #0
	b _080D305A
	.align 2, 0
_080D2FEC: .4byte 0x08B1FA20
_080D2FF0:
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _080D3020
	ldr r1, [r4, #0x30]
	cmp r1, #0
	beq _080D300E
	adds r0, r4, #0
	adds r0, #0x40
	cmp r1, r0
	beq _080D300C
	ldr r0, [r4, #0x54]
	bl .gcc2_compiled._21
_080D300C:
	str r5, [r4, #0x30]
_080D300E:
	movs r0, #0x25
	rsbs r0, r0, #0
	ldrh r1, [r4, #0xc]
	ands r0, r1
	movs r1, #0
	strh r0, [r4, #0xc]
	str r1, [r4, #4]
	ldr r0, [r4, #0x10]
	str r0, [r4]
_080D3020:
	movs r0, #8
	ldrh r1, [r4, #0xc]
	orrs r0, r1
	strh r0, [r4, #0xc]
_080D3028:
	ldr r0, [r4, #0x10]
	cmp r0, #0
	bne _080D3034
	adds r0, r4, #0
	bl .gcc2_compiled._25
_080D3034:
	ldrh r1, [r4, #0xc]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080D304A
	movs r0, #0
	str r0, [r4, #8]
	ldr r0, [r4, #0x14]
	rsbs r0, r0, #0
	str r0, [r4, #0x18]
	b _080D3058
_080D304A:
	movs r0, #2
	ands r0, r1
	movs r1, #0
	cmp r0, #0
	bne _080D3056
	ldr r1, [r4, #0x14]
_080D3056:
	str r1, [r4, #8]
_080D3058:
	movs r0, #0
_080D305A:
	pop {r4, r5, pc}

	THUMB_FUNC_START sub_080D305C
sub_080D305C: @ 0x080D305C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x18
	str r0, [sp]
	str r1, [sp, #4]
	ldr r7, [r1, #0x10]
	ldr r0, [r0, #0x10]
	cmp r0, r7
	bge _080D3078
	movs r0, #0
	b _080D31AC
_080D3078:
	ldr r0, [sp, #4]
	adds r0, #0x14
	mov r8, r0
	subs r7, #1
	lsls r0, r7, #2
	mov r1, r8
	adds r1, r1, r0
	str r1, [sp, #0xc]
	ldr r4, [sp]
	adds r4, #0x14
	adds r5, r4, r0
	ldr r1, [r1]
	adds r1, #1
	ldr r2, [r5]
	mov sl, r2
	mov r0, sl
	bl StandardDIV
	str r0, [sp, #8]
	mov r3, r8
	str r3, [sp, #0x14]
	str r4, [sp, #0x10]
	cmp r0, #0
	beq _080D3122
	movs r6, #0
	mov sb, r6
	ldr r0, _080D310C @ 0x0000FFFF
	mov ip, r0
_080D30B0:
	mov r2, r8
	adds r2, #4
	mov r8, r2
	subs r2, #4
	ldm r2!, {r1}
	adds r0, r1, #0
	mov r3, ip
	ands r0, r3
	ldr r2, [sp, #8]
	muls r0, r2, r0
	mov r3, sb
	adds r2, r0, r3
	lsrs r0, r1, #0x10
	ldr r3, [sp, #8]
	adds r1, r0, #0
	muls r1, r3, r1
	lsrs r0, r2, #0x10
	adds r3, r1, r0
	lsrs r0, r3, #0x10
	mov sb, r0
	ldr r0, [r4]
	mov r1, ip
	ands r0, r1
	ands r2, r1
	subs r0, r0, r2
	adds r2, r0, r6
	asrs r6, r2, #0x10
	ldr r0, [r4]
	lsrs r1, r0, #0x10
	mov r0, ip
	ands r3, r0
	subs r1, r1, r3
	adds r0, r1, r6
	asrs r6, r0, #0x10
	strh r0, [r4]
	strh r2, [r4, #2]
	adds r4, #4
	ldr r1, [sp, #0xc]
	cmp r8, r1
	bls _080D30B0
	mov r2, sl
	cmp r2, #0
	bne _080D3122
	ldr r4, [sp, #0x10]
	b _080D3112
	.align 2, 0
_080D310C: .4byte 0x0000FFFF
_080D3110:
	subs r7, #1
_080D3112:
	subs r5, #4
	cmp r5, r4
	bls _080D311E
	ldr r0, [r5]
	cmp r0, #0
	beq _080D3110
_080D311E:
	ldr r3, [sp]
	str r7, [r3, #0x10]
_080D3122:
	ldr r0, [sp]
	ldr r1, [sp, #4]
	bl __mcmp
	cmp r0, #0
	blt _080D31AA
	ldr r0, [sp, #8]
	adds r0, #1
	str r0, [sp, #8]
	movs r6, #0
	mov sb, r6
	ldr r4, [sp, #0x10]
	ldr r1, [sp, #0x14]
	mov r8, r1
	lsls r2, r7, #2
	mov sl, r2
	ldr r5, _080D3194 @ 0x0000FFFF
_080D3144:
	mov r3, r8
	adds r3, #4
	mov r8, r3
	subs r3, #4
	ldm r3!, {r1}
	adds r0, r1, #0
	ands r0, r5
	mov r3, sb
	adds r2, r0, r3
	lsrs r1, r1, #0x10
	lsrs r0, r2, #0x10
	adds r3, r1, r0
	lsrs r0, r3, #0x10
	mov sb, r0
	ldr r1, [r4]
	adds r0, r1, #0
	ands r0, r5
	ands r2, r5
	subs r0, r0, r2
	adds r2, r0, r6
	asrs r6, r2, #0x10
	lsrs r1, r1, #0x10
	ands r3, r5
	subs r1, r1, r3
	adds r0, r1, r6
	asrs r6, r0, #0x10
	strh r0, [r4]
	strh r2, [r4, #2]
	adds r4, #4
	ldr r1, [sp, #0xc]
	cmp r8, r1
	bls _080D3144
	ldr r4, [sp, #0x10]
	mov r2, sl
	adds r5, r4, r2
	ldr r0, [r5]
	cmp r0, #0
	bne _080D31AA
	b _080D319A
	.align 2, 0
_080D3194: .4byte 0x0000FFFF
_080D3198:
	subs r7, #1
_080D319A:
	subs r5, #4
	cmp r5, r4
	bls _080D31A6
	ldr r0, [r5]
	cmp r0, #0
	beq _080D3198
_080D31A6:
	ldr r3, [sp]
	str r7, [r3, #0x10]
_080D31AA:
	ldr r0, [sp, #8]
_080D31AC:
	add sp, #0x18
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7, pc}

	THUMB_FUNC_START _dtoa_r
_dtoa_r: @ 0x080D31B8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x84
	mov sl, r0
	str r3, [sp, #0xc]
	ldr r4, [sp, #0xac]
	str r1, [sp, #0x40]
	str r2, [sp, #0x44]
	ldr r2, [r0, #0x40]
	cmp r2, #0
	beq _080D31F0
	ldr r0, [r0, #0x44]
	str r0, [r2, #4]
	mov r0, sl
	ldr r1, [r0, #0x44]
	movs r0, #1
	lsls r0, r1
	str r0, [r2, #8]
	mov r0, sl
	adds r1, r2, #0
	bl _Bfree
	movs r0, #0
	mov r1, sl
	str r0, [r1, #0x40]
_080D31F0:
	movs r0, #0x80
	lsls r0, r0, #0x18
	ldr r1, [sp, #0x40]
	ands r0, r1
	cmp r0, #0
	beq _080D320C
	movs r0, #1
	str r0, [r4]
	ldr r0, _080D3208 @ 0x7FFFFFFF
	ands r1, r0
	str r1, [sp, #0x40]
	b _080D320E
	.align 2, 0
_080D3208: .4byte 0x7FFFFFFF
_080D320C:
	str r0, [r4]
_080D320E:
	ldr r1, _080D3250 @ 0x7FF00000
	ldr r2, [sp, #0x40]
	adds r0, r2, #0
	ands r0, r1
	cmp r0, r1
	bne _080D3264
	ldr r0, _080D3254 @ 0x0000270F
	ldr r3, [sp, #0xa8]
	str r0, [r3]
	ldr r0, _080D3258 @ 0x08587788
	mov sb, r0
	ldr r1, [sp, #0x44]
	cmp r1, #0
	bne _080D3236
	ldr r0, _080D325C @ 0x000FFFFF
	ands r2, r0
	cmp r2, #0
	bne _080D3236
	ldr r2, _080D3260 @ 0x0858777C
	mov sb, r2
_080D3236:
	ldr r3, [sp, #0xb0]
	cmp r3, #0
	beq _080D3288
	mov r1, sb
	ldrb r0, [r1, #3]
	adds r1, #3
	cmp r0, #0
	beq _080D3248
	adds r1, #5
_080D3248:
	ldr r2, [sp, #0xb0]
	str r1, [r2]
	b _080D3288
	.align 2, 0
_080D3250: .4byte 0x7FF00000
_080D3254: .4byte 0x0000270F
_080D3258: .4byte 0x08587788
_080D325C: .4byte 0x000FFFFF
_080D3260: .4byte 0x0858777C
_080D3264:
	ldr r3, _080D3294 @ 0x00000000
	ldr r2, _080D3290 @ 0x00000000
	ldr r0, [sp, #0x40]
	ldr r1, [sp, #0x44]
	bl __eqdf2
	cmp r0, #0
	bne _080D329C
	movs r0, #1
	ldr r3, [sp, #0xa8]
	str r0, [r3]
	ldr r0, _080D3298 @ 0x0858778C
	mov sb, r0
	ldr r1, [sp, #0xb0]
	cmp r1, #0
	beq _080D3288
	adds r0, #1
	str r0, [r1]
_080D3288:
	mov r0, sb
	bl _080D3EA2
	.align 2, 0
_080D3290: .4byte 0x00000000
_080D3294: .4byte 0x00000000
_080D3298: .4byte 0x0858778C
_080D329C:
	add r0, sp, #8
	str r0, [sp]
	mov r0, sl
	ldr r1, [sp, #0x40]
	ldr r2, [sp, #0x44]
	add r3, sp, #4
	bl _d2b
	str r0, [sp, #0x5c]
	ldr r2, [sp, #0x40]
	lsls r0, r2, #1
	lsrs r0, r0, #0x15
	mov r8, r0
	cmp r0, #0
	beq _080D32EC
	ldr r0, [sp, #0x40]
	ldr r1, [sp, #0x44]
	str r0, [sp, #0x48]
	str r1, [sp, #0x4c]
	ldr r0, _080D32E0 @ 0x000FFFFF
	ldr r1, [sp, #0x48]
	ands r1, r0
	str r1, [sp, #0x48]
	ldr r0, _080D32E4 @ 0x3FF00000
	adds r2, r1, #0
	orrs r2, r0
	str r2, [sp, #0x48]
	ldr r3, _080D32E8 @ 0xFFFFFC01
	add r8, r3
	movs r0, #0
	str r0, [sp, #0x58]
	ldr r6, [sp, #8]
	b _080D334C
	.align 2, 0
_080D32E0: .4byte 0x000FFFFF
_080D32E4: .4byte 0x3FF00000
_080D32E8: .4byte 0xFFFFFC01
_080D32EC:
	ldr r1, [sp, #8]
	ldr r0, [sp, #4]
	adds r2, r1, r0
	ldr r3, _080D3314 @ 0x00000432
	adds r3, r3, r2
	mov r8, r3
	adds r6, r1, #0
	cmp r3, #0x20
	ble _080D331C
	movs r0, #0x40
	subs r0, r0, r3
	ldr r4, [sp, #0x40]
	lsls r4, r0
	ldr r1, _080D3318 @ 0x00000412
	adds r0, r2, r1
	ldr r2, [sp, #0x44]
	lsrs r2, r0
	adds r0, r2, #0
	orrs r4, r0
	b _080D3326
	.align 2, 0
_080D3314: .4byte 0x00000432
_080D3318: .4byte 0x00000412
_080D331C:
	movs r0, #0x20
	mov r3, r8
	subs r0, r0, r3
	ldr r4, [sp, #0x44]
	lsls r4, r0
_080D3326:
	adds r0, r4, #0
	bl __floatsidf
	cmp r4, #0
	bge _080D3338
	ldr r3, _080D33FC @ 0x00000000
	ldr r2, _080D33F8 @ 0x41F00000
	bl __adddf3
_080D3338:
	str r0, [sp, #0x48]
	str r1, [sp, #0x4c]
	ldr r1, _080D3400 @ 0xFE100000
	ldr r0, [sp, #0x48]
	adds r1, r0, r1
	str r1, [sp, #0x48]
	ldr r2, _080D3404 @ 0xFFFFFBCD
	add r8, r2
	movs r3, #1
	str r3, [sp, #0x58]
_080D334C:
	ldr r2, _080D3408 @ 0x3FF80000
	ldr r3, _080D340C @ 0x00000000
	ldr r0, [sp, #0x48]
	ldr r1, [sp, #0x4c]
	bl __subdf3
	ldr r2, _080D3410 @ 0x3FD287A7
	ldr r3, _080D3414 @ 0x636F4361
	bl __muldf3
	ldr r2, _080D3418 @ 0x3FC68A28
	ldr r3, _080D341C @ 0x8B60C8B3
	bl __adddf3
	adds r5, r1, #0
	adds r4, r0, #0
	mov r0, r8
	bl __floatsidf
	ldr r2, _080D3420 @ 0x3FD34413
	ldr r3, _080D3424 @ 0x509F79FB
	bl __muldf3
	adds r3, r1, #0
	adds r2, r0, #0
	adds r1, r5, #0
	adds r0, r4, #0
	bl __adddf3
	str r0, [sp, #0x6c]
	str r1, [sp, #0x70]
	bl __fixdfsi
	str r0, [sp, #0x24]
	ldr r2, _080D3428 @ 0x00000000
	ldr r3, _080D342C @ 0x00000000
	ldr r0, [sp, #0x6c]
	ldr r1, [sp, #0x70]
	bl __ltdf2
	cmp r0, #0
	bge _080D33BC
	ldr r0, [sp, #0x24]
	bl __floatsidf
	adds r3, r1, #0
	adds r2, r0, #0
	ldr r0, [sp, #0x6c]
	ldr r1, [sp, #0x70]
	bl __nedf2
	cmp r0, #0
	beq _080D33BC
	ldr r0, [sp, #0x24]
	subs r0, #1
	str r0, [sp, #0x24]
_080D33BC:
	movs r1, #1
	str r1, [sp, #0x2c]
	ldr r2, [sp, #0x24]
	cmp r2, #0x16
	bhi _080D33E6
	ldr r1, _080D3430 @ 0x085877DC
	lsls r0, r2, #3
	adds r0, r0, r1
	ldr r2, [r0]
	ldr r3, [r0, #4]
	ldr r0, [sp, #0x40]
	ldr r1, [sp, #0x44]
	bl __ltdf2
	cmp r0, #0
	bge _080D33E2
	ldr r3, [sp, #0x24]
	subs r3, #1
	str r3, [sp, #0x24]
_080D33E2:
	movs r0, #0
	str r0, [sp, #0x2c]
_080D33E6:
	mov r1, r8
	subs r0, r6, r1
	subs r4, r0, #1
	cmp r4, #0
	blt _080D3434
	movs r2, #0
	str r2, [sp, #0x10]
	str r4, [sp, #0x34]
	b _080D343C
	.align 2, 0
_080D33F8: .4byte 0x41F00000
_080D33FC: .4byte 0x00000000
_080D3400: .4byte 0xFE100000
_080D3404: .4byte 0xFFFFFBCD
_080D3408: .4byte 0x3FF80000
_080D340C: .4byte 0x00000000
_080D3410: .4byte 0x3FD287A7
_080D3414: .4byte 0x636F4361
_080D3418: .4byte 0x3FC68A28
_080D341C: .4byte 0x8B60C8B3
_080D3420: .4byte 0x3FD34413
_080D3424: .4byte 0x509F79FB
_080D3428: .4byte 0x00000000
_080D342C: .4byte 0x00000000
_080D3430: .4byte 0x085877DC
_080D3434:
	rsbs r4, r4, #0
	str r4, [sp, #0x10]
	movs r3, #0
	str r3, [sp, #0x34]
_080D343C:
	ldr r0, [sp, #0x24]
	cmp r0, #0
	blt _080D3450
	movs r1, #0
	str r1, [sp, #0x14]
	str r0, [sp, #0x38]
	ldr r2, [sp, #0x34]
	adds r2, r2, r0
	str r2, [sp, #0x34]
	b _080D3460
_080D3450:
	ldr r3, [sp, #0x10]
	ldr r0, [sp, #0x24]
	subs r3, r3, r0
	str r3, [sp, #0x10]
	rsbs r1, r0, #0
	str r1, [sp, #0x14]
	movs r2, #0
	str r2, [sp, #0x38]
_080D3460:
	ldr r3, [sp, #0xc]
	cmp r3, #9
	bls _080D346A
	movs r0, #0
	str r0, [sp, #0xc]
_080D346A:
	movs r5, #1
	ldr r1, [sp, #0xc]
	cmp r1, #5
	ble _080D3478
	subs r1, #4
	str r1, [sp, #0xc]
	movs r5, #0
_080D3478:
	movs r2, #1
	str r2, [sp, #0x30]
	ldr r3, [sp, #0xc]
	cmp r3, #5
	bhi _080D34F2
	lsls r0, r3, #2
	ldr r1, _080D348C @ 0x080D3490
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080D348C: .4byte 0x080D3490
_080D3490: @ jump table
	.4byte _080D34A8 @ case 0
	.4byte _080D34A8 @ case 1
	.4byte _080D34BA @ case 2
	.4byte _080D34D6 @ case 3
	.4byte _080D34BE @ case 4
	.4byte _080D34DA @ case 5
_080D34A8:
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [sp, #0x18]
	str r0, [sp, #0x20]
	movs r1, #0x12
	mov r8, r1
	movs r2, #0
	str r2, [sp, #0xa4]
	b _080D34F2
_080D34BA:
	movs r3, #0
	str r3, [sp, #0x30]
_080D34BE:
	ldr r0, [sp, #0xa4]
	cmp r0, #0
	bgt _080D34C8
	movs r1, #1
	str r1, [sp, #0xa4]
_080D34C8:
	ldr r2, [sp, #0xa4]
	mov r8, r2
	mov r3, r8
	str r3, [sp, #0x20]
	mov r0, r8
	str r0, [sp, #0x18]
	b _080D34F2
_080D34D6:
	movs r1, #0
	str r1, [sp, #0x30]
_080D34DA:
	ldr r2, [sp, #0xa4]
	ldr r3, [sp, #0x24]
	adds r0, r2, r3
	adds r1, r0, #1
	mov r8, r1
	mov r2, r8
	str r2, [sp, #0x18]
	str r0, [sp, #0x20]
	cmp r1, #0
	bgt _080D34F2
	movs r3, #1
	mov r8, r3
_080D34F2:
	movs r4, #4
	movs r0, #0
	mov r1, sl
	str r0, [r1, #0x44]
	mov r2, r8
	cmp r2, #0x17
	bls _080D3512
	movs r1, #0
_080D3502:
	adds r1, #1
	lsls r4, r4, #1
	adds r0, r4, #0
	adds r0, #0x14
	cmp r0, r8
	bls _080D3502
	mov r3, sl
	str r1, [r3, #0x44]
_080D3512:
	mov r0, sl
	ldr r1, [r0, #0x44]
	bl .gcc2_compiled._30
	mov r1, sl
	str r0, [r1, #0x40]
	str r0, [sp, #0x74]
	mov sb, r0
	ldr r2, [sp, #0x18]
	cmp r2, #0xe
	bls _080D352A
	b _080D389C
_080D352A:
	cmp r5, #0
	bne _080D3530
	b _080D389C
_080D3530:
	ldr r0, [sp, #0x40]
	ldr r1, [sp, #0x44]
	str r0, [sp, #0x78]
	str r1, [sp, #0x7c]
	str r0, [sp, #0x48]
	str r1, [sp, #0x4c]
	ldr r1, [sp, #0x24]
	str r1, [sp, #0x28]
	str r2, [sp, #0x1c]
	movs r7, #2
	cmp r1, #0
	ble _080D35C0
	ldr r0, _080D35B8 @ 0x085877DC
	movs r2, #0xf
	ands r1, r2
	lsls r1, r1, #3
	adds r3, r1, r0
	ldr r0, [r3]
	ldr r1, [r3, #4]
	str r0, [sp, #0x6c]
	str r1, [sp, #0x70]
	ldr r1, [sp, #0x24]
	asrs r4, r1, #4
	movs r0, #0x10
	ands r0, r4
	cmp r0, #0
	beq _080D357C
	ands r4, r2
	ldr r0, _080D35BC @ 0x085878A4
	ldr r2, [r0, #0x20]
	ldr r3, [r0, #0x24]
	ldr r0, [sp, #0x78]
	ldr r1, [sp, #0x7c]
	bl __divdf3
	str r0, [sp, #0x40]
	str r1, [sp, #0x44]
	movs r7, #3
_080D357C:
	cmp r4, #0
	beq _080D35A4
	ldr r5, _080D35BC @ 0x085878A4
_080D3582:
	movs r0, #1
	ands r0, r4
	cmp r0, #0
	beq _080D359C
	adds r7, #1
	ldr r2, [r5]
	ldr r3, [r5, #4]
	ldr r0, [sp, #0x6c]
	ldr r1, [sp, #0x70]
	bl __muldf3
	str r0, [sp, #0x6c]
	str r1, [sp, #0x70]
_080D359C:
	asrs r4, r4, #1
	adds r5, #8
	cmp r4, #0
	bne _080D3582
_080D35A4:
	ldr r0, [sp, #0x40]
	ldr r1, [sp, #0x44]
	ldr r2, [sp, #0x6c]
	ldr r3, [sp, #0x70]
	bl __divdf3
	str r0, [sp, #0x40]
	str r1, [sp, #0x44]
	b _080D360C
	.align 2, 0
_080D35B8: .4byte 0x085877DC
_080D35BC: .4byte 0x085878A4
_080D35C0:
	ldr r2, [sp, #0x24]
	rsbs r6, r2, #0
	cmp r6, #0
	beq _080D360C
	ldr r1, _080D36B4 @ 0x085877DC
	movs r0, #0xf
	ands r0, r6
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, [r0, #4]
	ldr r0, [r0]
	ldr r2, [sp, #0x78]
	ldr r3, [sp, #0x7c]
	bl __muldf3
	str r0, [sp, #0x40]
	str r1, [sp, #0x44]
	asrs r4, r6, #4
	cmp r4, #0
	beq _080D360C
	ldr r5, _080D36B8 @ 0x085878A4
_080D35EA:
	movs r0, #1
	ands r0, r4
	cmp r0, #0
	beq _080D3604
	adds r7, #1
	ldr r0, [r5]
	ldr r1, [r5, #4]
	ldr r2, [sp, #0x40]
	ldr r3, [sp, #0x44]
	bl __muldf3
	str r0, [sp, #0x40]
	str r1, [sp, #0x44]
_080D3604:
	asrs r4, r4, #1
	adds r5, #8
	cmp r4, #0
	bne _080D35EA
_080D360C:
	ldr r3, [sp, #0x2c]
	cmp r3, #0
	beq _080D364A
	ldr r2, _080D36BC @ 0x3FF00000
	ldr r3, _080D36C0 @ 0x00000000
	ldr r0, [sp, #0x40]
	ldr r1, [sp, #0x44]
	bl __ltdf2
	cmp r0, #0
	bge _080D364A
	ldr r0, [sp, #0x18]
	cmp r0, #0
	ble _080D364A
	ldr r1, [sp, #0x20]
	cmp r1, #0
	bgt _080D3630
	b _080D3888
_080D3630:
	str r1, [sp, #0x18]
	ldr r2, [sp, #0x24]
	subs r2, #1
	str r2, [sp, #0x24]
	ldr r0, _080D36C4 @ 0x40240000
	ldr r1, _080D36C8 @ 0x00000000
	ldr r2, [sp, #0x40]
	ldr r3, [sp, #0x44]
	bl __muldf3
	str r0, [sp, #0x40]
	str r1, [sp, #0x44]
	adds r7, #1
_080D364A:
	adds r0, r7, #0
	bl __floatsidf
	ldr r2, [sp, #0x40]
	ldr r3, [sp, #0x44]
	bl __muldf3
	ldr r2, _080D36CC @ 0x401C0000
	ldr r3, _080D36D0 @ 0x00000000
	bl __adddf3
	str r0, [sp, #0x50]
	str r1, [sp, #0x54]
	ldr r0, _080D36D4 @ 0xFCC00000
	ldr r3, [sp, #0x50]
	adds r0, r3, r0
	str r0, [sp, #0x50]
	ldr r1, [sp, #0x18]
	cmp r1, #0
	bne _080D36E0
	movs r2, #0
	str r2, [sp, #0x64]
	movs r3, #0
	str r3, [sp, #0x68]
	ldr r2, _080D36D8 @ 0x40140000
	ldr r3, _080D36DC @ 0x00000000
	ldr r0, [sp, #0x40]
	ldr r1, [sp, #0x44]
	bl __subdf3
	adds r5, r1, #0
	adds r4, r0, #0
	ldr r2, [sp, #0x50]
	ldr r3, [sp, #0x54]
	bl __gtdf2
	cmp r0, #0
	ble _080D3698
	b _080D3C12
_080D3698:
	ldr r0, [sp, #0x50]
	ldr r1, [sp, #0x54]
	bl __negdf2
	adds r3, r1, #0
	adds r2, r0, #0
	adds r1, r5, #0
	adds r0, r4, #0
	bl __ltdf2
	cmp r0, #0
	bge _080D36B2
	b _080D3C0A
_080D36B2:
	b _080D3888
	.align 2, 0
_080D36B4: .4byte 0x085877DC
_080D36B8: .4byte 0x085878A4
_080D36BC: .4byte 0x3FF00000
_080D36C0: .4byte 0x00000000
_080D36C4: .4byte 0x40240000
_080D36C8: .4byte 0x00000000
_080D36CC: .4byte 0x401C0000
_080D36D0: .4byte 0x00000000
_080D36D4: .4byte 0xFCC00000
_080D36D8: .4byte 0x40140000
_080D36DC: .4byte 0x00000000
_080D36E0:
	ldr r0, [sp, #0x30]
	cmp r0, #0
	beq _080D37B0
	ldr r1, _080D3710 @ 0x085877DC
	ldr r0, [sp, #0x18]
	subs r0, #1
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r2, [r0]
	ldr r3, [r0, #4]
	ldr r0, _080D3714 @ 0x3FE00000
	ldr r1, _080D3718 @ 0x00000000
	bl __divdf3
	ldr r2, [sp, #0x50]
	ldr r3, [sp, #0x54]
	bl __subdf3
	str r0, [sp, #0x50]
	str r1, [sp, #0x54]
	movs r1, #0
	mov r8, r1
	b _080D373C
	.align 2, 0
_080D3710: .4byte 0x085877DC
_080D3714: .4byte 0x3FE00000
_080D3718: .4byte 0x00000000
_080D371C:
	ldr r1, _080D37A4 @ 0x00000000
	ldr r0, _080D37A0 @ 0x40240000
	ldr r2, [sp, #0x50]
	ldr r3, [sp, #0x54]
	bl __muldf3
	str r0, [sp, #0x50]
	str r1, [sp, #0x54]
	ldr r1, _080D37A4 @ 0x00000000
	ldr r0, _080D37A0 @ 0x40240000
	adds r3, r5, #0
	adds r2, r4, #0
	bl __muldf3
	str r0, [sp, #0x40]
	str r1, [sp, #0x44]
_080D373C:
	ldr r0, [sp, #0x40]
	ldr r1, [sp, #0x44]
	bl __fixdfsi
	adds r6, r0, #0
	bl __floatsidf
	adds r3, r1, #0
	adds r2, r0, #0
	ldr r0, [sp, #0x40]
	ldr r1, [sp, #0x44]
	bl __subdf3
	adds r5, r1, #0
	adds r4, r0, #0
	adds r0, r6, #0
	adds r0, #0x30
	mov r2, sb
	strb r0, [r2]
	movs r3, #1
	add sb, r3
	adds r1, r5, #0
	adds r0, r4, #0
	ldr r2, [sp, #0x50]
	ldr r3, [sp, #0x54]
	bl __ltdf2
	cmp r0, #0
	bge _080D3778
	b _080D3E82
_080D3778:
	ldr r0, _080D37A8 @ 0x3FF00000
	ldr r1, _080D37AC @ 0x00000000
	adds r3, r5, #0
	adds r2, r4, #0
	bl __subdf3
	ldr r2, [sp, #0x50]
	ldr r3, [sp, #0x54]
	bl __ltdf2
	cmp r0, #0
	bge _080D3792
	b _080D399C
_080D3792:
	movs r0, #1
	add r8, r0
	ldr r1, [sp, #0x18]
	cmp r8, r1
	blt _080D371C
	b _080D3888
	.align 2, 0
_080D37A0: .4byte 0x40240000
_080D37A4: .4byte 0x00000000
_080D37A8: .4byte 0x3FF00000
_080D37AC: .4byte 0x00000000
_080D37B0:
	ldr r1, _080D37D0 @ 0x085877DC
	ldr r0, [sp, #0x18]
	subs r0, #1
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, [r0, #4]
	ldr r0, [r0]
	ldr r2, [sp, #0x50]
	ldr r3, [sp, #0x54]
	bl __muldf3
	str r0, [sp, #0x50]
	str r1, [sp, #0x54]
	movs r2, #1
	mov r8, r2
	b _080D37E8
	.align 2, 0
_080D37D0: .4byte 0x085877DC
_080D37D4:
	movs r3, #1
	add r8, r3
	ldr r1, _080D387C @ 0x00000000
	ldr r0, _080D3878 @ 0x40240000
	adds r3, r5, #0
	adds r2, r4, #0
	bl __muldf3
	str r0, [sp, #0x40]
	str r1, [sp, #0x44]
_080D37E8:
	ldr r0, [sp, #0x40]
	ldr r1, [sp, #0x44]
	bl __fixdfsi
	adds r6, r0, #0
	bl __floatsidf
	adds r3, r1, #0
	adds r2, r0, #0
	ldr r0, [sp, #0x40]
	ldr r1, [sp, #0x44]
	bl __subdf3
	adds r5, r1, #0
	adds r4, r0, #0
	adds r0, r6, #0
	adds r0, #0x30
	mov r1, sb
	strb r0, [r1]
	movs r2, #1
	add sb, r2
	ldr r3, [sp, #0x18]
	cmp r8, r3
	bne _080D37D4
	ldr r6, _080D3880 @ 0x3FE00000
	ldr r7, _080D3884 @ 0x00000000
	adds r1, r7, #0
	adds r0, r6, #0
	ldr r2, [sp, #0x50]
	ldr r3, [sp, #0x54]
	bl __adddf3
	adds r3, r1, #0
	adds r2, r0, #0
	adds r1, r5, #0
	adds r0, r4, #0
	bl __gtdf2
	cmp r0, #0
	ble _080D383A
	b _080D399C
_080D383A:
	adds r1, r7, #0
	adds r0, r6, #0
	ldr r2, [sp, #0x50]
	ldr r3, [sp, #0x54]
	bl __subdf3
	adds r3, r1, #0
	adds r2, r0, #0
	adds r1, r5, #0
	adds r0, r4, #0
	bl __ltdf2
	cmp r0, #0
	bge _080D3888
	movs r0, #1
	rsbs r0, r0, #0
	add sb, r0
	mov r1, sb
	ldrb r1, [r1]
	cmp r1, #0x30
	beq _080D3866
	b _080D39C2
_080D3866:
	movs r2, #1
	rsbs r2, r2, #0
	add sb, r2
	mov r3, sb
	ldrb r3, [r3]
	cmp r3, #0x30
	beq _080D3866
	b _080D39C2
	.align 2, 0
_080D3878: .4byte 0x40240000
_080D387C: .4byte 0x00000000
_080D3880: .4byte 0x3FE00000
_080D3884: .4byte 0x00000000
_080D3888:
	ldr r1, [sp, #0x74]
	mov sb, r1
	ldr r2, [sp, #0x48]
	ldr r3, [sp, #0x4c]
	str r2, [sp, #0x40]
	str r3, [sp, #0x44]
	ldr r3, [sp, #0x28]
	str r3, [sp, #0x24]
	ldr r0, [sp, #0x1c]
	str r0, [sp, #0x18]
_080D389C:
	ldr r0, [sp, #4]
	cmp r0, #0
	bge _080D38A4
	b _080D39D8
_080D38A4:
	ldr r1, [sp, #0x24]
	cmp r1, #0xe
	ble _080D38AC
	b _080D39D8
_080D38AC:
	ldr r1, _080D38F8 @ 0x085877DC
	ldr r2, [sp, #0x24]
	lsls r0, r2, #3
	adds r0, r0, r1
	ldr r1, [r0]
	ldr r2, [r0, #4]
	str r1, [sp, #0x6c]
	str r2, [sp, #0x70]
	ldr r2, [sp, #0xa4]
	cmp r2, #0
	bge _080D3904
	ldr r3, [sp, #0x18]
	cmp r3, #0
	bgt _080D3904
	movs r0, #0
	str r0, [sp, #0x64]
	movs r1, #0
	str r1, [sp, #0x68]
	cmp r3, #0
	bge _080D38D6
	b _080D3C0A
_080D38D6:
	ldr r2, _080D38FC @ 0x40140000
	ldr r3, _080D3900 @ 0x00000000
	ldr r0, [sp, #0x6c]
	ldr r1, [sp, #0x70]
	bl __muldf3
	adds r3, r1, #0
	adds r2, r0, #0
	ldr r0, [sp, #0x40]
	ldr r1, [sp, #0x44]
	bl __ledf2
	cmp r0, #0
	bgt _080D38F4
	b _080D3C0A
_080D38F4:
	b _080D3C12
	.align 2, 0
_080D38F8: .4byte 0x085877DC
_080D38FC: .4byte 0x40140000
_080D3900: .4byte 0x00000000
_080D3904:
	movs r2, #1
	mov r8, r2
	b _080D3928
_080D390A:
	ldr r1, _080D39CC @ 0x00000000
	ldr r0, _080D39C8 @ 0x40240000
	bl __muldf3
	str r0, [sp, #0x40]
	str r1, [sp, #0x44]
	ldr r2, _080D39D0 @ 0x00000000
	ldr r3, _080D39D4 @ 0x00000000
	bl __eqdf2
	cmp r0, #0
	bne _080D3924
	b _080D3E82
_080D3924:
	movs r3, #1
	add r8, r3
_080D3928:
	ldr r0, [sp, #0x40]
	ldr r1, [sp, #0x44]
	ldr r2, [sp, #0x6c]
	ldr r3, [sp, #0x70]
	bl __divdf3
	bl __fixdfsi
	adds r6, r0, #0
	bl __floatsidf
	ldr r2, [sp, #0x6c]
	ldr r3, [sp, #0x70]
	bl __muldf3
	adds r3, r1, #0
	adds r2, r0, #0
	ldr r0, [sp, #0x40]
	ldr r1, [sp, #0x44]
	bl __subdf3
	adds r3, r1, #0
	adds r2, r0, #0
	adds r0, r6, #0
	adds r0, #0x30
	mov r1, sb
	strb r0, [r1]
	movs r0, #1
	add sb, r0
	ldr r1, [sp, #0x18]
	cmp r8, r1
	bne _080D390A
	adds r1, r3, #0
	adds r0, r2, #0
	bl __adddf3
	adds r5, r1, #0
	adds r4, r0, #0
	ldr r2, [sp, #0x6c]
	ldr r3, [sp, #0x70]
	bl __gtdf2
	cmp r0, #0
	bgt _080D399C
	adds r1, r5, #0
	adds r0, r4, #0
	ldr r2, [sp, #0x6c]
	ldr r3, [sp, #0x70]
	bl __eqdf2
	cmp r0, #0
	beq _080D3992
	b _080D3E82
_080D3992:
	movs r0, #1
	ands r0, r6
	cmp r0, #0
	bne _080D399C
	b _080D3E82
_080D399C:
	movs r0, #0x30
_080D399E:
	movs r2, #1
	rsbs r2, r2, #0
	add sb, r2
	mov r3, sb
	ldrb r3, [r3]
	cmp r3, #0x39
	bne _080D39BA
	ldr r1, [sp, #0x74]
	cmp sb, r1
	bne _080D399E
	ldr r2, [sp, #0x24]
	adds r2, #1
	str r2, [sp, #0x24]
	strb r0, [r1]
_080D39BA:
	mov r3, sb
	ldrb r0, [r3]
	adds r0, #1
	strb r0, [r3]
_080D39C2:
	movs r0, #1
	add sb, r0
	b _080D3E82
	.align 2, 0
_080D39C8: .4byte 0x40240000
_080D39CC: .4byte 0x00000000
_080D39D0: .4byte 0x00000000
_080D39D4: .4byte 0x00000000
_080D39D8:
	ldr r5, [sp, #0x10]
	ldr r6, [sp, #0x14]
	movs r1, #0
	str r1, [sp, #0x60]
	movs r2, #0
	str r2, [sp, #0x64]
	ldr r3, [sp, #0x30]
	cmp r3, #0
	beq _080D3A4E
	ldr r1, [sp, #0xc]
	cmp r1, #1
	bgt _080D3A0C
	ldr r2, [sp, #0x58]
	cmp r2, #0
	beq _080D3A04
	ldr r3, _080D3A00 @ 0x00000433
	adds r3, r3, r0
	mov r8, r3
	b _080D3A38
	.align 2, 0
_080D3A00: .4byte 0x00000433
_080D3A04:
	ldr r1, [sp, #8]
	movs r0, #0x36
	subs r0, r0, r1
	b _080D3A36
_080D3A0C:
	ldr r4, [sp, #0x18]
	subs r4, #1
	ldr r0, [sp, #0x14]
	cmp r0, r4
	blt _080D3A1A
	subs r6, r0, r4
	b _080D3A2A
_080D3A1A:
	ldr r1, [sp, #0x14]
	subs r4, r4, r1
	ldr r2, [sp, #0x38]
	adds r2, r2, r4
	str r2, [sp, #0x38]
	adds r1, r1, r4
	str r1, [sp, #0x14]
	movs r6, #0
_080D3A2A:
	ldr r3, [sp, #0x18]
	mov r8, r3
	cmp r3, #0
	bge _080D3A38
	subs r5, r5, r3
	movs r0, #0
_080D3A36:
	mov r8, r0
_080D3A38:
	ldr r1, [sp, #0x10]
	add r1, r8
	str r1, [sp, #0x10]
	ldr r2, [sp, #0x34]
	add r2, r8
	str r2, [sp, #0x34]
	mov r0, sl
	movs r1, #1
	bl _i2b
	str r0, [sp, #0x64]
_080D3A4E:
	cmp r5, #0
	ble _080D3A70
	ldr r3, [sp, #0x34]
	cmp r3, #0
	ble _080D3A70
	mov r8, r3
	cmp r8, r5
	ble _080D3A60
	mov r8, r5
_080D3A60:
	ldr r0, [sp, #0x10]
	mov r1, r8
	subs r0, r0, r1
	str r0, [sp, #0x10]
	subs r5, r5, r1
	ldr r2, [sp, #0x34]
	subs r2, r2, r1
	str r2, [sp, #0x34]
_080D3A70:
	ldr r3, [sp, #0x14]
	cmp r3, #0
	ble _080D3ABE
	ldr r0, [sp, #0x30]
	cmp r0, #0
	beq _080D3AB2
	cmp r6, #0
	ble _080D3AA2
	mov r0, sl
	ldr r1, [sp, #0x64]
	adds r2, r6, #0
	bl _pow5mult
	str r0, [sp, #0x64]
	mov r0, sl
	ldr r1, [sp, #0x64]
	ldr r2, [sp, #0x5c]
	bl _multiply
	adds r4, r0, #0
	mov r0, sl
	ldr r1, [sp, #0x5c]
	bl _Bfree
	str r4, [sp, #0x5c]
_080D3AA2:
	ldr r1, [sp, #0x14]
	subs r4, r1, r6
	cmp r4, #0
	beq _080D3ABE
	mov r0, sl
	ldr r1, [sp, #0x5c]
	adds r2, r4, #0
	b _080D3AB8
_080D3AB2:
	mov r0, sl
	ldr r1, [sp, #0x5c]
	ldr r2, [sp, #0x14]
_080D3AB8:
	bl _pow5mult
	str r0, [sp, #0x5c]
_080D3ABE:
	mov r0, sl
	movs r1, #1
	bl _i2b
	str r0, [sp, #0x68]
	ldr r2, [sp, #0x38]
	cmp r2, #0
	ble _080D3AD8
	mov r0, sl
	ldr r1, [sp, #0x68]
	bl _pow5mult
	str r0, [sp, #0x68]
_080D3AD8:
	ldr r3, [sp, #0xc]
	cmp r3, #1
	bgt _080D3B14
	ldr r0, [sp, #0x44]
	cmp r0, #0
	bne _080D3B10
	ldr r0, _080D3B08 @ 0x000FFFFF
	ldr r1, [sp, #0x40]
	ands r0, r1
	cmp r0, #0
	bne _080D3B10
	ldr r0, _080D3B0C @ 0x7FF00000
	ands r1, r0
	cmp r1, #0
	beq _080D3B10
	ldr r1, [sp, #0x10]
	adds r1, #1
	str r1, [sp, #0x10]
	ldr r2, [sp, #0x34]
	adds r2, #1
	str r2, [sp, #0x34]
	movs r3, #1
	str r3, [sp, #0x3c]
	b _080D3B14
	.align 2, 0
_080D3B08: .4byte 0x000FFFFF
_080D3B0C: .4byte 0x7FF00000
_080D3B10:
	movs r0, #0
	str r0, [sp, #0x3c]
_080D3B14:
	ldr r1, [sp, #0x38]
	cmp r1, #0
	beq _080D3B40
	ldr r2, [sp, #0x68]
	ldr r1, [r2, #0x10]
	subs r1, #1
	lsls r1, r1, #2
	adds r0, r2, #0
	adds r0, #0x14
	adds r0, r0, r1
	ldr r0, [r0]
	bl _hi0bits
	ldr r1, [sp, #0x34]
	adds r1, #0x20
	subs r1, r1, r0
	mov r8, r1
	movs r0, #0x1f
	mov r3, r8
	ands r3, r0
	mov r8, r3
	b _080D3B4E
_080D3B40:
	ldr r0, [sp, #0x34]
	adds r0, #1
	mov r8, r0
	movs r0, #0x1f
	mov r1, r8
	ands r1, r0
	mov r8, r1
_080D3B4E:
	mov r2, r8
	cmp r2, #0
	beq _080D3B5A
	movs r0, #0x20
	subs r2, r0, r2
	mov r8, r2
_080D3B5A:
	mov r3, r8
	cmp r3, #4
	ble _080D3B66
	movs r0, #4
	rsbs r0, r0, #0
	b _080D3B6E
_080D3B66:
	mov r3, r8
	cmp r3, #3
	bgt _080D3B7E
	movs r0, #0x1c
_080D3B6E:
	add r8, r0
	ldr r1, [sp, #0x10]
	add r1, r8
	str r1, [sp, #0x10]
	add r5, r8
	ldr r2, [sp, #0x34]
	add r2, r8
	str r2, [sp, #0x34]
_080D3B7E:
	ldr r3, [sp, #0x10]
	cmp r3, #0
	ble _080D3B90
	mov r0, sl
	ldr r1, [sp, #0x5c]
	adds r2, r3, #0
	bl _lshift
	str r0, [sp, #0x5c]
_080D3B90:
	ldr r0, [sp, #0x34]
	cmp r0, #0
	ble _080D3BA2
	mov r0, sl
	ldr r1, [sp, #0x68]
	ldr r2, [sp, #0x34]
	bl _lshift
	str r0, [sp, #0x68]
_080D3BA2:
	ldr r1, [sp, #0x2c]
	cmp r1, #0
	beq _080D3BE0
	ldr r0, [sp, #0x5c]
	ldr r1, [sp, #0x68]
	bl __mcmp
	cmp r0, #0
	bge _080D3BE0
	ldr r2, [sp, #0x24]
	subs r2, #1
	str r2, [sp, #0x24]
	mov r0, sl
	ldr r1, [sp, #0x5c]
	movs r2, #0xa
	movs r3, #0
	bl _multadd
	str r0, [sp, #0x5c]
	ldr r3, [sp, #0x30]
	cmp r3, #0
	beq _080D3BDC
	mov r0, sl
	ldr r1, [sp, #0x64]
	movs r2, #0xa
	movs r3, #0
	bl _multadd
	str r0, [sp, #0x64]
_080D3BDC:
	ldr r0, [sp, #0x20]
	str r0, [sp, #0x18]
_080D3BE0:
	ldr r1, [sp, #0x18]
	cmp r1, #0
	bgt _080D3C24
	ldr r2, [sp, #0xc]
	cmp r2, #2
	ble _080D3C24
	cmp r1, #0
	blt _080D3C0A
	mov r0, sl
	ldr r1, [sp, #0x68]
	movs r2, #5
	movs r3, #0
	bl _multadd
	str r0, [sp, #0x68]
	ldr r0, [sp, #0x5c]
	ldr r1, [sp, #0x68]
	bl __mcmp
	cmp r0, #0
	bgt _080D3C12
_080D3C0A:
	ldr r3, [sp, #0xa4]
	mvns r3, r3
	str r3, [sp, #0x24]
	b _080D3E5A
_080D3C12:
	movs r0, #0x31
	mov r1, sb
	strb r0, [r1]
	movs r2, #1
	add sb, r2
	ldr r3, [sp, #0x24]
	adds r3, #1
	str r3, [sp, #0x24]
	b _080D3E5A
_080D3C24:
	ldr r0, [sp, #0x30]
	cmp r0, #0
	bne _080D3C2C
	b _080D3DA2
_080D3C2C:
	cmp r5, #0
	ble _080D3C3C
	mov r0, sl
	ldr r1, [sp, #0x64]
	adds r2, r5, #0
	bl _lshift
	str r0, [sp, #0x64]
_080D3C3C:
	ldr r1, [sp, #0x64]
	str r1, [sp, #0x60]
	ldr r2, [sp, #0x3c]
	cmp r2, #0
	beq _080D3C6E
	ldr r1, [r1, #4]
	mov r0, sl
	bl .gcc2_compiled._30
	str r0, [sp, #0x64]
	adds r0, #0xc
	ldr r1, [sp, #0x60]
	adds r1, #0xc
	ldr r3, [sp, #0x60]
	ldr r2, [r3, #0x10]
	lsls r2, r2, #2
	adds r2, #8
	bl sub_080D1C0C
	mov r0, sl
	ldr r1, [sp, #0x64]
	movs r2, #1
	bl _lshift
	str r0, [sp, #0x64]
_080D3C6E:
	movs r0, #1
	mov r8, r0
	mov r1, r8
	ldr r2, [sp, #0x44]
	ands r2, r1
	str r2, [sp, #0x80]
	b _080D3CC4
_080D3C7C:
	mov r0, sl
	ldr r1, [sp, #0x5c]
	movs r2, #0xa
	movs r3, #0
	bl _multadd
	str r0, [sp, #0x5c]
	ldr r3, [sp, #0x60]
	ldr r0, [sp, #0x64]
	cmp r3, r0
	bne _080D3CA4
	mov r0, sl
	ldr r1, [sp, #0x64]
	movs r2, #0xa
	movs r3, #0
	bl _multadd
	str r0, [sp, #0x64]
	str r0, [sp, #0x60]
	b _080D3CC0
_080D3CA4:
	mov r0, sl
	ldr r1, [sp, #0x60]
	movs r2, #0xa
	movs r3, #0
	bl _multadd
	str r0, [sp, #0x60]
	mov r0, sl
	ldr r1, [sp, #0x64]
	movs r2, #0xa
	movs r3, #0
	bl _multadd
	str r0, [sp, #0x64]
_080D3CC0:
	movs r1, #1
	add r8, r1
_080D3CC4:
	ldr r0, [sp, #0x5c]
	ldr r1, [sp, #0x68]
	bl sub_080D305C
	adds r7, r0, #0
	adds r7, #0x30
	ldr r0, [sp, #0x5c]
	ldr r1, [sp, #0x60]
	bl __mcmp
	adds r4, r0, #0
	mov r0, sl
	ldr r1, [sp, #0x68]
	ldr r2, [sp, #0x64]
	bl __mdiff
	adds r5, r0, #0
	ldr r0, [r5, #0xc]
	cmp r0, #0
	bne _080D3CF8
	ldr r0, [sp, #0x5c]
	adds r1, r5, #0
	bl __mcmp
	adds r6, r0, #0
	b _080D3CFA
_080D3CF8:
	movs r6, #1
_080D3CFA:
	mov r0, sl
	adds r1, r5, #0
	bl _Bfree
	cmp r6, #0
	bne _080D3D26
	ldr r2, [sp, #0xc]
	cmp r2, #0
	bne _080D3D26
	ldr r3, [sp, #0x80]
	cmp r3, #0
	bne _080D3D26
	cmp r7, #0x39
	beq _080D3D78
	cmp r4, #0
	ble _080D3D1C
	adds r7, #1
_080D3D1C:
	mov r0, sb
	strb r7, [r0]
	movs r1, #1
	add sb, r1
	b _080D3E5A
_080D3D26:
	cmp r4, #0
	blt _080D3D3A
	cmp r4, #0
	bne _080D3D70
	ldr r2, [sp, #0xc]
	cmp r2, #0
	bne _080D3D70
	ldr r3, [sp, #0x80]
	cmp r3, #0
	bne _080D3D70
_080D3D3A:
	cmp r6, #0
	ble _080D3D6A
	mov r0, sl
	ldr r1, [sp, #0x5c]
	movs r2, #1
	bl _lshift
	str r0, [sp, #0x5c]
	ldr r1, [sp, #0x68]
	bl __mcmp
	adds r6, r0, #0
	cmp r6, #0
	bgt _080D3D64
	cmp r6, #0
	bne _080D3D6A
	adds r0, r7, #0
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _080D3D6A
_080D3D64:
	adds r7, #1
	cmp r7, #0x3a
	beq _080D3D78
_080D3D6A:
	mov r2, sb
	strb r7, [r2]
	b _080D3E22
_080D3D70:
	cmp r6, #0
	ble _080D3D90
	cmp r7, #0x39
	bne _080D3D84
_080D3D78:
	movs r0, #0x39
	mov r1, sb
	strb r0, [r1]
	movs r2, #1
	add sb, r2
	b _080D3DF8
_080D3D84:
	adds r0, r7, #1
	mov r3, sb
	strb r0, [r3]
	movs r0, #1
	add sb, r0
	b _080D3E5A
_080D3D90:
	mov r1, sb
	strb r7, [r1]
	movs r2, #1
	add sb, r2
	ldr r3, [sp, #0x18]
	cmp r8, r3
	beq _080D3DA0
	b _080D3C7C
_080D3DA0:
	b _080D3DD4
_080D3DA2:
	movs r0, #1
	mov r8, r0
	b _080D3DBA
_080D3DA8:
	mov r0, sl
	ldr r1, [sp, #0x5c]
	movs r2, #0xa
	movs r3, #0
	bl _multadd
	str r0, [sp, #0x5c]
	movs r1, #1
	add r8, r1
_080D3DBA:
	ldr r0, [sp, #0x5c]
	ldr r1, [sp, #0x68]
	bl sub_080D305C
	adds r7, r0, #0
	adds r7, #0x30
	mov r2, sb
	strb r7, [r2]
	movs r3, #1
	add sb, r3
	ldr r0, [sp, #0x18]
	cmp r8, r0
	blt _080D3DA8
_080D3DD4:
	mov r0, sl
	ldr r1, [sp, #0x5c]
	movs r2, #1
	bl _lshift
	str r0, [sp, #0x5c]
	ldr r1, [sp, #0x68]
	bl __mcmp
	adds r4, r0, #0
	cmp r4, #0
	bgt _080D3DF8
	cmp r4, #0
	bne _080D3E3A
	movs r0, #1
	ands r7, r0
	cmp r7, #0
	beq _080D3E3A
_080D3DF8:
	movs r1, #1
	rsbs r1, r1, #0
	add sb, r1
	mov r2, sb
	ldrb r2, [r2]
	cmp r2, #0x39
	bne _080D3E1A
_080D3E06:
	ldr r3, [sp, #0x74]
	cmp sb, r3
	beq _080D3E28
	movs r0, #1
	rsbs r0, r0, #0
	add sb, r0
	mov r1, sb
	ldrb r1, [r1]
	cmp r1, #0x39
	beq _080D3E06
_080D3E1A:
	mov r2, sb
	ldrb r0, [r2]
	adds r0, #1
	strb r0, [r2]
_080D3E22:
	movs r3, #1
	add sb, r3
	b _080D3E5A
_080D3E28:
	ldr r0, [sp, #0x24]
	adds r0, #1
	str r0, [sp, #0x24]
	movs r0, #0x31
	ldr r1, [sp, #0x74]
	strb r0, [r1]
	adds r1, #1
	mov sb, r1
	b _080D3E5A
_080D3E3A:
	movs r2, #1
	rsbs r2, r2, #0
	add sb, r2
	mov r3, sb
	ldrb r3, [r3]
	cmp r3, #0x30
	bne _080D3E56
_080D3E48:
	movs r0, #1
	rsbs r0, r0, #0
	add sb, r0
	mov r1, sb
	ldrb r1, [r1]
	cmp r1, #0x30
	beq _080D3E48
_080D3E56:
	movs r2, #1
	add sb, r2
_080D3E5A:
	mov r0, sl
	ldr r1, [sp, #0x68]
	bl _Bfree
	ldr r3, [sp, #0x64]
	cmp r3, #0
	beq _080D3E82
	ldr r0, [sp, #0x60]
	cmp r0, #0
	beq _080D3E7A
	cmp r0, r3
	beq _080D3E7A
	mov r0, sl
	ldr r1, [sp, #0x60]
	bl _Bfree
_080D3E7A:
	mov r0, sl
	ldr r1, [sp, #0x64]
	bl _Bfree
_080D3E82:
	mov r0, sl
	ldr r1, [sp, #0x5c]
	bl _Bfree
	movs r0, #0
	mov r1, sb
	strb r0, [r1]
	ldr r0, [sp, #0x24]
	adds r0, #1
	ldr r2, [sp, #0xa8]
	str r0, [r2]
	ldr r3, [sp, #0xb0]
	cmp r3, #0
	beq _080D3EA0
	str r1, [r3]
_080D3EA0:
	ldr r0, [sp, #0x74]
_080D3EA2:
	add sp, #0x84
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7, pc}
	.byte 0x00, 0x00

	THUMB_FUNC_START .gcc2_compiled._19
.gcc2_compiled._19: @ 0x080D3EB0
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	cmp r4, #0
	bne _080D3ECC
	ldr r0, _080D3EC4 @ 0x08B1FA20
	ldr r0, [r0]
	ldr r1, _080D3EC8 @ 0x080D3EB1
	bl sub_080D454C
	b _080D3F42
	.align 2, 0
_080D3EC4: .4byte 0x08B1FA20
_080D3EC8: .4byte 0x080D3EB1
_080D3ECC:
	ldr r0, [r4, #0x54]
	cmp r0, #0
	bne _080D3ED8
	ldr r0, _080D3F0C @ 0x08B1FA20
	ldr r0, [r0]
	str r0, [r4, #0x54]
_080D3ED8:
	ldr r1, [r4, #0x54]
	ldr r0, [r1, #0x38]
	cmp r0, #0
	bne _080D3EE6
	adds r0, r1, #0
	bl __sinit
_080D3EE6:
	movs r0, #0xc
	ldrsh r1, [r4, r0]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _080D3F40
	ldr r6, [r4, #0x10]
	cmp r6, #0
	beq _080D3F40
	ldr r0, [r4]
	subs r5, r0, r6
	str r6, [r4]
	movs r0, #3
	ands r0, r1
	cmp r0, #0
	bne _080D3F1E
	ldr r0, [r4, #0x14]
	b _080D3F20
	.align 2, 0
_080D3F0C: .4byte 0x08B1FA20
_080D3F10:
	movs r0, #0x40
	ldrh r1, [r4, #0xc]
	orrs r0, r1
	strh r0, [r4, #0xc]
	movs r0, #1
	rsbs r0, r0, #0
	b _080D3F42
_080D3F1E:
	movs r0, #0
_080D3F20:
	str r0, [r4, #8]
	cmp r5, #0
	ble _080D3F40
_080D3F26:
	ldr r0, [r4, #0x1c]
	ldr r3, [r4, #0x24]
	adds r1, r6, #0
	adds r2, r5, #0
	bl BXR3
	adds r1, r0, #0
	cmp r1, #0
	ble _080D3F10
	adds r6, r6, r1
	subs r5, r5, r1
	cmp r5, #0
	bgt _080D3F26
_080D3F40:
	movs r0, #0
_080D3F42:
	pop {r4, r5, r6, pc}

	THUMB_FUNC_START sub_080D3F44
sub_080D3F44: @ 0x080D3F44
	push {r4, lr}
	movs r4, #0
	str r4, [r0]
	str r4, [r0, #4]
	str r4, [r0, #8]
	strh r1, [r0, #0xc]
	strh r2, [r0, #0xe]
	str r4, [r0, #0x10]
	str r4, [r0, #0x18]
	str r0, [r0, #0x1c]
	ldr r1, _080D3F6C @ 0x080D566D
	str r1, [r0, #0x20]
	ldr r1, _080D3F70 @ 0x080D56A1
	str r1, [r0, #0x24]
	ldr r1, _080D3F74 @ 0x080D56E1
	str r1, [r0, #0x28]
	ldr r1, _080D3F78 @ 0x080D5721
	str r1, [r0, #0x2c]
	str r3, [r0, #0x54]
	pop {r4, pc}
	.align 2, 0
_080D3F6C: .4byte 0x080D566D
_080D3F70: .4byte 0x080D56A1
_080D3F74: .4byte 0x080D56E1
_080D3F78: .4byte 0x080D5721

	THUMB_FUNC_START __sfmoreglue
__sfmoreglue: @ 0x080D3F7C
	push {r4, r5, r6, lr}
	adds r5, r1, #0
	movs r1, #0x58
	adds r6, r5, #0
	muls r6, r1, r6
	adds r1, r6, #0
	adds r1, #0xc
	bl _malloc_r
	adds r4, r0, #0
	cmp r4, #0
	beq _080D3FA8
	adds r0, #0xc
	movs r1, #0
	str r1, [r4]
	str r5, [r4, #4]
	str r0, [r4, #8]
	adds r2, r6, #0
	bl .gcc2_compiled._10
	adds r0, r4, #0
	b _080D3FAA
_080D3FA8:
	movs r0, #0
_080D3FAA:
	pop {r4, r5, r6, pc}

	THUMB_FUNC_START __sfp
__sfp: @ 0x080D3FAC
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x38]
	cmp r0, #0
	bne _080D3FBC
	adds r0, r5, #0
	bl __sinit
_080D3FBC:
	movs r0, #0xec
	lsls r0, r0, #1
	adds r4, r5, r0
	b _080D3FC6
_080D3FC4:
	ldr r4, [r4]
_080D3FC6:
	ldr r2, [r4, #8]
	ldr r0, [r4, #4]
	b _080D3FD6
_080D3FCC:
	movs r3, #0xc
	ldrsh r1, [r2, r3]
	cmp r1, #0
	beq _080D3FF8
	adds r2, #0x58
_080D3FD6:
	subs r0, #1
	cmp r0, #0
	bge _080D3FCC
	ldr r0, [r4]
	cmp r0, #0
	bne _080D3FC4
	adds r0, r5, #0
	movs r1, #4
	bl __sfmoreglue
	str r0, [r4]
	cmp r0, #0
	bne _080D3FC4
	movs r0, #0xc
	str r0, [r5]
	movs r0, #0
	b _080D4018
_080D3FF8:
	movs r0, #1
	strh r0, [r2, #0xc]
	str r1, [r2]
	str r1, [r2, #8]
	str r1, [r2, #4]
	str r1, [r2, #0x10]
	str r1, [r2, #0x14]
	str r1, [r2, #0x18]
	ldr r0, _080D401C @ 0x0000FFFF
	strh r0, [r2, #0xe]
	str r1, [r2, #0x30]
	str r1, [r2, #0x34]
	str r1, [r2, #0x44]
	str r1, [r2, #0x48]
	str r5, [r2, #0x54]
	adds r0, r2, #0
_080D4018:
	pop {r4, r5, pc}
	.align 2, 0
_080D401C: .4byte 0x0000FFFF

	THUMB_FUNC_START _cleanup_r
_cleanup_r: @ 0x080D4020
	push {lr}
	ldr r1, _080D402C @ 0x080D3EB1
	bl sub_080D454C
	pop {pc}
	.align 2, 0
_080D402C: .4byte 0x080D3EB1

	THUMB_FUNC_START _cleanup
_cleanup: @ 0x080D4030
	push {lr}
	ldr r0, _080D403C @ 0x08B1FA20
	ldr r0, [r0]
	bl _cleanup_r
	pop {pc}
	.align 2, 0
_080D403C: .4byte 0x08B1FA20

	THUMB_FUNC_START __sinit
__sinit: @ 0x080D4040
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _080D409C @ 0x080D4021
	str r0, [r5, #0x3c]
	movs r0, #1
	str r0, [r5, #0x38]
	movs r0, #0xf2
	lsls r0, r0, #1
	adds r4, r5, r0
	adds r0, r4, #0
	movs r1, #4
	movs r2, #0
	adds r3, r5, #0
	bl sub_080D3F44
	movs r1, #0x8f
	lsls r1, r1, #2
	adds r0, r5, r1
	movs r1, #9
	movs r2, #1
	adds r3, r5, #0
	bl sub_080D3F44
	movs r1, #0xa5
	lsls r1, r1, #2
	adds r0, r5, r1
	movs r1, #0xa
	movs r2, #2
	adds r3, r5, #0
	bl sub_080D3F44
	movs r0, #0xec
	lsls r0, r0, #1
	adds r1, r5, r0
	movs r0, #0
	str r0, [r1]
	movs r0, #0xee
	lsls r0, r0, #1
	adds r1, r5, r0
	movs r0, #3
	str r0, [r1]
	movs r1, #0xf0
	lsls r1, r1, #1
	adds r0, r5, r1
	str r4, [r0]
	pop {r4, r5, pc}
	.align 2, 0
_080D409C: .4byte 0x080D4021

	THUMB_FUNC_START .gcc2_compiled._21
.gcc2_compiled._21: @ 0x080D40A0
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	mov sb, r0
	adds r4, r1, #0
	cmp r4, #0
	bne _080D40B2
	b _080D4256
_080D40B2:
	bl nullsub_3
	adds r5, r4, #0
	subs r5, #8
	ldr r1, [r5, #4]
	movs r6, #2
	rsbs r6, r6, #0
	ands r6, r1
	adds r7, r5, r6
	ldr r4, [r7, #4]
	movs r0, #4
	rsbs r0, r0, #0
	ands r4, r0
	ldr r0, _080D4114 @ 0x08B1FA38
	mov ip, r0
	ldr r0, [r0, #8]
	cmp r7, r0
	bne _080D4120
	adds r6, r6, r4
	movs r4, #1
	ands r1, r4
	cmp r1, #0
	bne _080D40EE
	ldr r0, [r5]
	subs r5, r5, r0
	adds r6, r6, r0
	ldr r3, [r5, #0xc]
	ldr r2, [r5, #8]
	str r3, [r2, #0xc]
	str r2, [r3, #8]
_080D40EE:
	adds r0, r6, #0
	orrs r0, r4
	str r0, [r5, #4]
	mov r2, ip
	str r5, [r2, #8]
	ldr r0, _080D4118 @ 0x08B1FE40
	ldr r0, [r0]
	cmp r6, r0
	blo _080D410A
	ldr r0, _080D411C @ 0x08B1FE44
	ldr r1, [r0]
	mov r0, sb
	bl _malloc_trim_r
_080D410A:
	mov r0, sb
	bl nullsub_4
	b _080D4256
	.align 2, 0
_080D4114: .4byte 0x08B1FA38
_080D4118: .4byte 0x08B1FE40
_080D411C: .4byte 0x08B1FE44
_080D4120:
	str r4, [r7, #4]
	movs r0, #0
	mov r8, r0
	movs r0, #1
	ands r1, r0
	cmp r1, #0
	bne _080D414C
	ldr r0, [r5]
	subs r5, r5, r0
	adds r6, r6, r0
	ldr r1, [r5, #8]
	mov r0, ip
	adds r0, #8
	cmp r1, r0
	bne _080D4144
	movs r2, #1
	mov r8, r2
	b _080D414C
_080D4144:
	ldr r3, [r5, #0xc]
	adds r2, r1, #0
	str r3, [r2, #0xc]
	str r2, [r3, #8]
_080D414C:
	adds r0, r7, r4
	ldr r0, [r0, #4]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _080D4184
	adds r6, r6, r4
	ldr r1, [r7, #8]
	mov r0, r8
	cmp r0, #0
	bne _080D417C
	ldr r0, _080D4178 @ 0x08B1FA40
	cmp r1, r0
	bne _080D417C
	movs r2, #1
	mov r8, r2
	str r5, [r1, #0xc]
	str r5, [r1, #8]
	str r1, [r5, #0xc]
	str r1, [r5, #8]
	b _080D4184
	.align 2, 0
_080D4178: .4byte 0x08B1FA40
_080D417C:
	ldr r3, [r7, #0xc]
	adds r2, r1, #0
	str r3, [r2, #0xc]
	str r2, [r3, #8]
_080D4184:
	movs r1, #1
	adds r0, r6, #0
	orrs r0, r1
	str r0, [r5, #4]
	adds r0, r5, r6
	str r6, [r0]
	mov r0, r8
	cmp r0, #0
	bne _080D4250
	ldr r0, _080D41B4 @ 0x000001FF
	cmp r6, r0
	bhi _080D41BC
	lsrs r4, r6, #3
	ldr r2, _080D41B8 @ 0x08B1FA38
	adds r0, r4, #0
	asrs r0, r0, #2
	lsls r1, r0
	ldr r0, [r2, #4]
	orrs r0, r1
	str r0, [r2, #4]
	lsls r0, r4, #3
	adds r3, r0, r2
	ldr r2, [r3, #8]
	b _080D4248
	.align 2, 0
_080D41B4: .4byte 0x000001FF
_080D41B8: .4byte 0x08B1FA38
_080D41BC:
	lsrs r1, r6, #9
	cmp r1, #0
	bne _080D41C6
	lsrs r4, r6, #3
	b _080D420E
_080D41C6:
	cmp r1, #4
	bhi _080D41D2
	lsrs r0, r6, #6
	adds r4, r0, #0
	adds r4, #0x38
	b _080D420E
_080D41D2:
	cmp r1, #0x14
	bhi _080D41DC
	adds r4, r1, #0
	adds r4, #0x5b
	b _080D420E
_080D41DC:
	cmp r1, #0x54
	bhi _080D41E8
	lsrs r0, r6, #0xc
	adds r4, r0, #0
	adds r4, #0x6e
	b _080D420E
_080D41E8:
	movs r0, #0xaa
	lsls r0, r0, #1
	cmp r1, r0
	bhi _080D41F8
	lsrs r0, r6, #0xf
	adds r4, r0, #0
	adds r4, #0x77
	b _080D420E
_080D41F8:
	ldr r0, _080D4208 @ 0x00000554
	cmp r1, r0
	bhi _080D420C
	lsrs r0, r6, #0x12
	adds r4, r0, #0
	adds r4, #0x7c
	b _080D420E
	.align 2, 0
_080D4208: .4byte 0x00000554
_080D420C:
	movs r4, #0x7e
_080D420E:
	lsls r0, r4, #3
	ldr r7, _080D422C @ 0x08B1FA38
	adds r3, r0, r7
	ldr r2, [r3, #8]
	cmp r2, r3
	bne _080D4230
	adds r0, r4, #0
	asrs r0, r0, #2
	movs r1, #1
	lsls r1, r0
	ldr r0, [r7, #4]
	orrs r0, r1
	str r0, [r7, #4]
	b _080D4248
	.align 2, 0
_080D422C: .4byte 0x08B1FA38
_080D4230:
	ldr r0, [r2, #4]
	movs r1, #4
	rsbs r1, r1, #0
	b _080D4240
_080D4238:
	ldr r2, [r2, #8]
	cmp r2, r3
	beq _080D4246
	ldr r0, [r2, #4]
_080D4240:
	ands r0, r1
	cmp r6, r0
	blo _080D4238
_080D4246:
	ldr r3, [r2, #0xc]
_080D4248:
	str r3, [r5, #0xc]
	str r2, [r5, #8]
	str r5, [r3, #8]
	str r5, [r2, #0xc]
_080D4250:
	mov r0, sb
	bl nullsub_4
_080D4256:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7, pc}
	.byte 0x00, 0x00

	THUMB_FUNC_START _malloc_trim_r
_malloc_trim_r: @ 0x080D4260
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r7, r0, #0
	adds r4, r1, #0
	bl nullsub_3
	ldr r0, _080D42E8 @ 0x08B1FA38
	mov r8, r0
	ldr r0, [r0, #8]
	ldr r6, [r0, #4]
	movs r0, #4
	rsbs r0, r0, #0
	ands r6, r0
	subs r4, r6, r4
	movs r5, #0x80
	lsls r5, r5, #5
	ldr r1, _080D42EC @ 0x00000FEF
	adds r4, r4, r1
	adds r0, r4, #0
	adds r1, r5, #0
	bl StandardDIV
	subs r0, #1
	lsls r4, r0, #0xc
	cmp r4, r5
	blt _080D42DE
	adds r0, r7, #0
	movs r1, #0
	bl .gcc2_compiled._44
	adds r2, r0, #0
	mov r1, r8
	ldr r0, [r1, #8]
	adds r0, r0, r6
	cmp r2, r0
	bne _080D42DE
	rsbs r1, r4, #0
	adds r0, r7, #0
	bl .gcc2_compiled._44
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	bne _080D42F8
	adds r0, r7, #0
	movs r1, #0
	bl .gcc2_compiled._44
	adds r2, r0, #0
	mov r0, r8
	ldr r3, [r0, #8]
	subs r6, r2, r3
	cmp r6, #0xf
	ble _080D42DE
	ldr r1, _080D42F0 @ 0x08B1FE54
	ldr r0, _080D42F4 @ 0x08B1FE48
	ldr r0, [r0]
	subs r0, r2, r0
	str r0, [r1]
	movs r0, #1
	orrs r6, r0
	str r6, [r3, #4]
_080D42DE:
	adds r0, r7, #0
	bl nullsub_4
	movs r0, #0
	b _080D4314
	.align 2, 0
_080D42E8: .4byte 0x08B1FA38
_080D42EC: .4byte 0x00000FEF
_080D42F0: .4byte 0x08B1FE54
_080D42F4: .4byte 0x08B1FE48
_080D42F8:
	mov r1, r8
	ldr r2, [r1, #8]
	subs r0, r6, r4
	movs r1, #1
	orrs r0, r1
	str r0, [r2, #4]
	ldr r1, _080D431C @ 0x08B1FE54
	ldr r0, [r1]
	subs r0, r0, r4
	str r0, [r1]
	adds r0, r7, #0
	bl nullsub_4
	movs r0, #1
_080D4314:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_080D431C: .4byte 0x08B1FE54

	THUMB_FUNC_START .gcc2_compiled._22
.gcc2_compiled._22: @ 0x080D4320
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r5, r0, #0
	mov sl, r1
	ldr r6, [r1, #8]
	cmp r6, #0
	bne _080D4338
	b _080D452E
_080D4338:
	movs r0, #8
	ldrh r1, [r5, #0xc]
	ands r0, r1
	cmp r0, #0
	beq _080D4348
	ldr r0, [r5, #0x10]
	cmp r0, #0
	bne _080D4354
_080D4348:
	adds r0, r5, #0
	bl .gcc2_compiled._17
	cmp r0, #0
	beq _080D4354
	b _080D453A
_080D4354:
	mov r2, sl
	ldr r2, [r2]
	mov r8, r2
	movs r6, #0
	ldrh r1, [r5, #0xc]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080D43A8
_080D4366:
	ldr r0, [r5, #0x1c]
	ldr r3, [r5, #0x24]
	cmp r6, #0
	bne _080D437C
_080D436E:
	mov r1, r8
	ldr r7, [r1]
	ldr r6, [r1, #4]
	movs r2, #8
	add r8, r2
	cmp r6, #0
	beq _080D436E
_080D437C:
	adds r2, r6, #0
	movs r1, #0x80
	lsls r1, r1, #3
	cmp r6, r1
	bls _080D4388
	adds r2, r1, #0
_080D4388:
	adds r1, r7, #0
	bl BXR3
	adds r4, r0, #0
	cmp r4, #0
	bgt _080D4396
	b _080D4532
_080D4396:
	adds r7, r7, r4
	subs r6, r6, r4
	mov r1, sl
	ldr r0, [r1, #8]
	subs r0, r0, r4
	str r0, [r1, #8]
	cmp r0, #0
	bne _080D4366
	b _080D452E
_080D43A8:
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _080D4462
_080D43B0:
	ldrh r1, [r5, #0xc]
	ldr r0, [r5, #8]
	ldr r3, [r5]
	cmp r6, #0
	bne _080D43C8
_080D43BA:
	mov r2, r8
	ldr r7, [r2]
	ldr r6, [r2, #4]
	movs r2, #8
	add r8, r2
	cmp r6, #0
	beq _080D43BA
_080D43C8:
	adds r4, r0, #0
	movs r2, #0x80
	lsls r2, r2, #2
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	beq _080D43F6
	cmp r6, r4
	bhs _080D43DC
	adds r4, r6, #0
_080D43DC:
	adds r0, r3, #0
	adds r1, r7, #0
	adds r2, r4, #0
	bl .gcc2_compiled._29
	ldr r0, [r5, #8]
	subs r0, r0, r4
	str r0, [r5, #8]
	ldr r0, [r5]
	adds r0, r0, r4
	str r0, [r5]
	adds r4, r6, #0
	b _080D4450
_080D43F6:
	ldr r0, [r5, #0x10]
	cmp r3, r0
	bls _080D441E
	cmp r6, r4
	bls _080D441E
	adds r0, r3, #0
	adds r1, r7, #0
	adds r2, r4, #0
	bl .gcc2_compiled._29
	ldr r0, [r5]
	adds r0, r0, r4
	str r0, [r5]
	adds r0, r5, #0
	bl .gcc2_compiled._19
	cmp r0, #0
	beq _080D441C
	b _080D4532
_080D441C:
	b _080D4450
_080D441E:
	ldr r4, [r5, #0x14]
	cmp r6, r4
	blo _080D4438
	ldr r0, [r5, #0x1c]
	ldr r3, [r5, #0x24]
	adds r1, r7, #0
	adds r2, r4, #0
	bl BXR3
	adds r4, r0, #0
	cmp r4, #0
	ble _080D4532
	b _080D4450
_080D4438:
	adds r4, r6, #0
	adds r0, r3, #0
	adds r1, r7, #0
	adds r2, r4, #0
	bl .gcc2_compiled._29
	ldr r0, [r5, #8]
	subs r0, r0, r4
	str r0, [r5, #8]
	ldr r0, [r5]
	adds r0, r0, r4
	str r0, [r5]
_080D4450:
	adds r7, r7, r4
	subs r6, r6, r4
	mov r1, sl
	ldr r0, [r1, #8]
	subs r0, r0, r4
	str r0, [r1, #8]
	cmp r0, #0
	bne _080D43B0
	b _080D452E
_080D4462:
	movs r2, #0
	str r2, [sp]
_080D4466:
	cmp r6, #0
	bne _080D447C
	movs r0, #0
	str r0, [sp]
_080D446E:
	mov r1, r8
	ldr r7, [r1]
	ldr r6, [r1, #4]
	movs r2, #8
	add r8, r2
	cmp r6, #0
	beq _080D446E
_080D447C:
	ldr r0, [sp]
	cmp r0, #0
	bne _080D44A0
	adds r0, r7, #0
	movs r1, #0xa
	adds r2, r6, #0
	bl .gcc2_compiled._28
	adds r1, r0, #0
	cmp r1, #0
	beq _080D4498
	subs r0, r7, #1
	subs r1, r1, r0
	b _080D449A
_080D4498:
	adds r1, r6, #1
_080D449A:
	mov sb, r1
	movs r2, #1
	str r2, [sp]
_080D44A0:
	mov r2, sb
	cmp sb, r6
	bls _080D44A8
	adds r2, r6, #0
_080D44A8:
	ldr r0, [r5, #8]
	ldr r1, [r5, #0x14]
	adds r4, r0, r1
	ldr r0, [r5, #0x10]
	ldr r3, [r5]
	cmp r3, r0
	bls _080D44D6
	cmp r2, r4
	ble _080D44D6
	adds r0, r3, #0
	adds r1, r7, #0
	adds r2, r4, #0
	bl .gcc2_compiled._29
	ldr r0, [r5]
	adds r0, r0, r4
	str r0, [r5]
	adds r0, r5, #0
	bl .gcc2_compiled._19
	cmp r0, #0
	bne _080D4532
	b _080D4506
_080D44D6:
	adds r4, r1, #0
	cmp r2, r4
	blt _080D44F0
	ldr r0, [r5, #0x1c]
	ldr r3, [r5, #0x24]
	adds r1, r7, #0
	adds r2, r4, #0
	bl BXR3
	adds r4, r0, #0
	cmp r4, #0
	ble _080D4532
	b _080D4506
_080D44F0:
	adds r4, r2, #0
	adds r0, r3, #0
	adds r1, r7, #0
	bl .gcc2_compiled._29
	ldr r0, [r5, #8]
	subs r0, r0, r4
	str r0, [r5, #8]
	ldr r0, [r5]
	adds r0, r0, r4
	str r0, [r5]
_080D4506:
	mov r0, sb
	subs r0, r0, r4
	mov sb, r0
	cmp r0, #0
	bne _080D451E
	adds r0, r5, #0
	bl .gcc2_compiled._19
	cmp r0, #0
	bne _080D4532
	movs r1, #0
	str r1, [sp]
_080D451E:
	adds r7, r7, r4
	subs r6, r6, r4
	mov r2, sl
	ldr r0, [r2, #8]
	subs r0, r0, r4
	str r0, [r2, #8]
	cmp r0, #0
	bne _080D4466
_080D452E:
	movs r0, #0
	b _080D453E
_080D4532:
	movs r0, #0x40
	ldrh r1, [r5, #0xc]
	orrs r0, r1
	strh r0, [r5, #0xc]
_080D453A:
	movs r0, #1
	rsbs r0, r0, #0
_080D453E:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7, pc}
	.byte 0x00, 0x00

	THUMB_FUNC_START sub_080D454C
sub_080D454C: @ 0x080D454C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r1
	movs r7, #0
	movs r1, #0xec
	lsls r1, r1, #1
	adds r6, r0, r1
	cmp r6, #0
	beq _080D4584
_080D4560:
	ldr r5, [r6, #8]
	ldr r4, [r6, #4]
	b _080D4578
_080D4566:
	movs r1, #0xc
	ldrsh r0, [r5, r1]
	cmp r0, #0
	beq _080D4576
	adds r0, r5, #0
	bl BXR8
	orrs r7, r0
_080D4576:
	adds r5, #0x58
_080D4578:
	subs r4, #1
	cmp r4, #0
	bge _080D4566
	ldr r6, [r6]
	cmp r6, #0
	bne _080D4560
_080D4584:
	adds r0, r7, #0
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7, pc}

	THUMB_FUNC_START .gcc2_compiled._24
.gcc2_compiled._24: @ 0x080D458C
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	adds r4, r2, #0
	cmp r4, #0
	beq _080D45C0
	ldr r1, _080D45B4 @ 0x085877CC
	adds r0, r4, #0
	bl sub_080D5730
	cmp r0, #0
	beq _080D45BC
	ldr r1, _080D45B8 @ 0x085877C4
	adds r0, r4, #0
	bl sub_080D5730
	cmp r0, #0
	beq _080D45BC
	movs r0, #0
	b _080D45C2
	.align 2, 0
_080D45B4: .4byte 0x085877CC
_080D45B8: .4byte 0x085877C4
_080D45BC:
	str r6, [r5, #0x30]
	str r4, [r5, #0x34]
_080D45C0:
	ldr r0, _080D45C4 @ 0x085877CC
_080D45C2:
	pop {r4, r5, r6, pc}
	.align 2, 0
_080D45C4: .4byte 0x085877CC

	THUMB_FUNC_START _localeconv_r
_localeconv_r: @ 0x080D45C8
	ldr r0, _080D45CC @ 0x08587794
	bx lr
	.align 2, 0
_080D45CC: .4byte 0x08587794

	THUMB_FUNC_START setlocale
setlocale: @ 0x080D45D0
	push {lr}
	adds r3, r0, #0
	adds r2, r1, #0
	ldr r0, _080D45E4 @ 0x08B1FA20
	ldr r0, [r0]
	adds r1, r3, #0
	bl .gcc2_compiled._24
	pop {pc}
	.align 2, 0
_080D45E4: .4byte 0x08B1FA20

	THUMB_FUNC_START localeconv
localeconv: @ 0x080D45E8
	push {lr}
	ldr r0, _080D45F4 @ 0x08B1FA20
	ldr r0, [r0]
	bl _localeconv_r
	pop {pc}
	.align 2, 0
_080D45F4: .4byte 0x08B1FA20

	THUMB_FUNC_START .gcc2_compiled._25
.gcc2_compiled._25: @ 0x080D45F8
	push {r4, r5, r6, r7, lr}
	sub sp, #0x3c
	adds r4, r0, #0
	movs r0, #2
	ldrh r1, [r4, #0xc]
	ands r0, r1
	cmp r0, #0
	bne _080D468E
	movs r2, #0xe
	ldrsh r0, [r4, r2]
	cmp r0, #0
	blt _080D4620
	ldr r0, [r4, #0x54]
	movs r2, #0xe
	ldrsh r1, [r4, r2]
	mov r2, sp
	bl .gcc2_compiled._40
	cmp r0, #0
	bge _080D4632
_080D4620:
	movs r7, #0
	movs r6, #0x80
	lsls r6, r6, #3
	movs r1, #0x80
	lsls r1, r1, #4
	adds r0, r1, #0
	ldrh r2, [r4, #0xc]
	orrs r0, r2
	b _080D4676
_080D4632:
	movs r7, #0
	ldr r1, [sp, #4]
	movs r0, #0xf0
	lsls r0, r0, #8
	ands r1, r0
	movs r0, #0x80
	lsls r0, r0, #6
	cmp r1, r0
	bne _080D4646
	movs r7, #1
_080D4646:
	movs r6, #0x80
	lsls r6, r6, #3
	movs r0, #0x80
	lsls r0, r0, #8
	cmp r1, r0
	bne _080D466C
	ldr r1, [r4, #0x28]
	ldr r0, _080D4668 @ 0x080D56E1
	cmp r1, r0
	bne _080D466C
	adds r0, r6, #0
	ldrh r1, [r4, #0xc]
	orrs r0, r1
	strh r0, [r4, #0xc]
	str r6, [r4, #0x4c]
	b _080D4678
	.align 2, 0
_080D4668: .4byte 0x080D56E1
_080D466C:
	movs r2, #0x80
	lsls r2, r2, #4
	adds r0, r2, #0
	ldrh r1, [r4, #0xc]
	orrs r0, r1
_080D4676:
	strh r0, [r4, #0xc]
_080D4678:
	ldr r0, [r4, #0x54]
	adds r1, r6, #0
	bl _malloc_r
	adds r2, r0, #0
	cmp r2, #0
	bne _080D469C
	movs r0, #2
	ldrh r2, [r4, #0xc]
	orrs r0, r2
	strh r0, [r4, #0xc]
_080D468E:
	adds r0, r4, #0
	adds r0, #0x43
	str r0, [r4]
	str r0, [r4, #0x10]
	movs r0, #1
	str r0, [r4, #0x14]
	b _080D46CA
_080D469C:
	ldr r1, [r4, #0x54]
	ldr r0, _080D46D0 @ 0x080D4021
	str r0, [r1, #0x3c]
	movs r0, #0x80
	movs r5, #0
	ldrh r1, [r4, #0xc]
	orrs r0, r1
	strh r0, [r4, #0xc]
	str r2, [r4]
	str r2, [r4, #0x10]
	str r6, [r4, #0x14]
	cmp r7, #0
	beq _080D46CA
	movs r2, #0xe
	ldrsh r0, [r4, r2]
	bl isatty
	cmp r0, #0
	beq _080D46CA
	movs r0, #1
	ldrh r1, [r4, #0xc]
	orrs r0, r1
	strh r0, [r4, #0xc]
_080D46CA:
	add sp, #0x3c
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_080D46D0: .4byte 0x080D4021

	THUMB_FUNC_START sub_080D46D4
sub_080D46D4: @ 0x080D46D4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	str r0, [sp]
	ldr r0, _080D4748 @ 0x08B1FA38
	ldr r0, [r0, #8]
	mov r8, r0
	ldr r7, [r0, #4]
	movs r0, #4
	rsbs r0, r0, #0
	ands r7, r0
	mov r2, r8
	adds r4, r2, r7
	ldr r0, _080D474C @ 0x08B1FE44
	ldr r0, [r0]
	adds r1, r1, r0
	adds r6, r1, #0
	adds r6, #0x10
	ldr r3, _080D4750 @ 0x08B1FE48
	mov sl, r3
	ldr r0, [r3]
	movs r2, #1
	rsbs r2, r2, #0
	mov sb, r2
	cmp r0, sb
	beq _080D4716
	ldr r3, _080D4754 @ 0x0000100F
	adds r6, r1, r3
	ldr r0, _080D4758 @ 0xFFFFF000
	ands r6, r0
_080D4716:
	ldr r0, [sp]
	adds r1, r6, #0
	bl .gcc2_compiled._44
	adds r5, r0, #0
	cmp r5, sb
	beq _080D4818
	cmp r5, r4
	bhs _080D472E
	ldr r0, _080D4748 @ 0x08B1FA38
	cmp r8, r0
	bne _080D4818
_080D472E:
	ldr r1, _080D475C @ 0x08B1FE54
	ldr r0, [r1]
	adds r2, r0, r6
	str r2, [r1]
	cmp r5, r4
	bne _080D4760
	adds r2, r6, r7
	ldr r3, _080D4748 @ 0x08B1FA38
	ldr r1, [r3, #8]
	movs r0, #1
	orrs r2, r0
	str r2, [r1, #4]
	b _080D4800
	.align 2, 0
_080D4748: .4byte 0x08B1FA38
_080D474C: .4byte 0x08B1FE44
_080D4750: .4byte 0x08B1FE48
_080D4754: .4byte 0x0000100F
_080D4758: .4byte 0xFFFFF000
_080D475C: .4byte 0x08B1FE54
_080D4760:
	mov r3, sl
	ldr r0, [r3]
	cmp r0, sb
	bne _080D476C
	str r5, [r3]
	b _080D4772
_080D476C:
	subs r0, r5, r4
	adds r0, r2, r0
	str r0, [r1]
_080D4772:
	adds r1, r5, #0
	adds r1, #8
	movs r0, #7
	ands r1, r0
	cmp r1, #0
	beq _080D4786
	movs r0, #8
	subs r4, r0, r1
	adds r5, r5, r4
	b _080D4788
_080D4786:
	movs r4, #0
_080D4788:
	adds r0, r5, r6
	movs r1, #0x80
	lsls r1, r1, #5
	subs r1, #1
	ands r0, r1
	movs r1, #0x80
	lsls r1, r1, #5
	subs r0, r1, r0
	adds r4, r4, r0
	ldr r0, [sp]
	adds r1, r4, #0
	bl .gcc2_compiled._44
	adds r2, r0, #0
	movs r0, #1
	rsbs r0, r0, #0
	cmp r2, r0
	beq _080D4818
	ldr r1, _080D47D0 @ 0x08B1FE54
	ldr r0, [r1]
	adds r0, r0, r4
	str r0, [r1]
	ldr r1, _080D47D4 @ 0x08B1FA38
	str r5, [r1, #8]
	subs r0, r2, r5
	adds r2, r0, r4
	movs r3, #1
	orrs r2, r3
	str r2, [r5, #4]
	cmp r8, r1
	beq _080D4800
	cmp r7, #0xf
	bhi _080D47D8
	str r3, [r5, #4]
	b _080D4818
	.align 2, 0
_080D47D0: .4byte 0x08B1FE54
_080D47D4: .4byte 0x08B1FA38
_080D47D8:
	subs r7, #0xc
	movs r0, #8
	rsbs r0, r0, #0
	ands r7, r0
	mov r2, r8
	ldr r0, [r2, #4]
	ands r0, r3
	orrs r0, r7
	str r0, [r2, #4]
	adds r1, r2, r7
	movs r0, #5
	str r0, [r1, #4]
	str r0, [r1, #8]
	cmp r7, #0xf
	bls _080D4800
	mov r1, r8
	adds r1, #8
	ldr r0, [sp]
	bl .gcc2_compiled._21
_080D4800:
	ldr r0, _080D4824 @ 0x08B1FE54
	ldr r2, _080D4828 @ 0x08B1FE4C
	ldr r1, [r0]
	ldr r0, [r2]
	cmp r1, r0
	bls _080D480E
	str r1, [r2]
_080D480E:
	ldr r2, _080D482C @ 0x08B1FE50
	ldr r0, [r2]
	cmp r1, r0
	bls _080D4818
	str r1, [r2]
_080D4818:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_080D4824: .4byte 0x08B1FE54
_080D4828: .4byte 0x08B1FE4C
_080D482C: .4byte 0x08B1FE50

	THUMB_FUNC_START _malloc_r
_malloc_r: @ 0x080D4830
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	str r0, [sp]
	adds r1, #0xb
	cmp r1, #0x16
	ble _080D4852
	movs r0, #8
	rsbs r0, r0, #0
	mov r8, r0
	mov r2, r8
	ands r2, r1
	mov r8, r2
	b _080D4856
_080D4852:
	movs r3, #0x10
	mov r8, r3
_080D4856:
	ldr r0, [sp]
	bl nullsub_3
	ldr r0, _080D489C @ 0x000001F7
	cmp r8, r0
	bhi _080D48AA
	mov r4, r8
	lsrs r4, r4, #3
	mov ip, r4
	ldr r0, _080D48A0 @ 0x08B1FA38
	mov r7, r8
	adds r2, r7, r0
	ldr r5, [r2, #0xc]
	cmp r5, r2
	bne _080D487E
	adds r2, r5, #0
	adds r2, #8
	ldr r5, [r2, #0xc]
	cmp r5, r2
	beq _080D48A4
_080D487E:
	ldr r2, [r5, #4]
	movs r0, #4
	rsbs r0, r0, #0
	ands r2, r0
	ldr r6, [r5, #0xc]
	ldr r4, [r5, #8]
	str r6, [r4, #0xc]
	str r4, [r6, #8]
	adds r2, r5, r2
	ldr r0, [r2, #4]
	movs r1, #1
	orrs r0, r1
	str r0, [r2, #4]
	b _080D4BD6
	.align 2, 0
_080D489C: .4byte 0x000001F7
_080D48A0: .4byte 0x08B1FA38
_080D48A4:
	movs r0, #2
	add ip, r0
	b _080D4956
_080D48AA:
	mov r2, r8
	lsrs r1, r2, #9
	cmp r1, #0
	bne _080D48B6
	lsrs r2, r2, #3
	b _080D4906
_080D48B6:
	cmp r1, #4
	bhi _080D48C4
	mov r3, r8
	lsrs r0, r3, #6
	adds r0, #0x38
	mov ip, r0
	b _080D4908
_080D48C4:
	cmp r1, #0x14
	bhi _080D48CE
	adds r1, #0x5b
	mov ip, r1
	b _080D4908
_080D48CE:
	cmp r1, #0x54
	bhi _080D48DC
	mov r4, r8
	lsrs r0, r4, #0xc
	adds r0, #0x6e
	mov ip, r0
	b _080D4908
_080D48DC:
	movs r0, #0xaa
	lsls r0, r0, #1
	cmp r1, r0
	bhi _080D48EE
	mov r7, r8
	lsrs r0, r7, #0xf
	adds r0, #0x77
	mov ip, r0
	b _080D4908
_080D48EE:
	ldr r0, _080D4900 @ 0x00000554
	cmp r1, r0
	bhi _080D4904
	mov r1, r8
	lsrs r0, r1, #0x12
	adds r0, #0x7c
	mov ip, r0
	b _080D4908
	.align 2, 0
_080D4900: .4byte 0x00000554
_080D4904:
	movs r2, #0x7e
_080D4906:
	mov ip, r2
_080D4908:
	mov r3, ip
	lsls r0, r3, #3
	ldr r1, _080D492C @ 0x08B1FA38
	adds r4, r0, r1
	ldr r5, [r4, #0xc]
	cmp r5, r4
	beq _080D4952
	ldr r1, [r5, #4]
	movs r0, #4
	rsbs r0, r0, #0
	ands r1, r0
	mov r7, r8
	subs r3, r1, r7
	cmp r3, #0xf
	ble _080D4930
	adds r0, #3
	add ip, r0
	b _080D4952
	.align 2, 0
_080D492C: .4byte 0x08B1FA38
_080D4930:
	cmp r3, #0
	blt _080D4936
	b _080D4B70
_080D4936:
	ldr r5, [r5, #0xc]
	cmp r5, r4
	beq _080D4952
	ldr r1, [r5, #4]
	movs r0, #4
	rsbs r0, r0, #0
	ands r1, r0
	mov r2, r8
	subs r3, r1, r2
	cmp r3, #0xf
	ble _080D4930
	movs r3, #1
	rsbs r3, r3, #0
	add ip, r3
_080D4952:
	movs r4, #1
	add ip, r4
_080D4956:
	ldr r0, _080D4994 @ 0x08B1FA40
	ldr r5, [r0, #8]
	mov sl, r0
	cmp r5, sl
	bne _080D4962
	b _080D4A64
_080D4962:
	ldr r1, [r5, #4]
	movs r0, #4
	rsbs r0, r0, #0
	ands r1, r0
	mov r7, r8
	subs r3, r1, r7
	cmp r3, #0xf
	ble _080D4998
	adds r2, r5, r7
	movs r1, #1
	adds r0, r7, #0
	orrs r0, r1
	str r0, [r5, #4]
	mov r4, sl
	str r2, [r4, #0xc]
	str r2, [r4, #8]
	str r4, [r2, #0xc]
	str r4, [r2, #8]
	adds r0, r3, #0
	orrs r0, r1
	str r0, [r2, #4]
	adds r0, r2, r3
	str r3, [r0]
	b _080D4BD6
	.align 2, 0
_080D4994: .4byte 0x08B1FA40
_080D4998:
	mov r7, sl
	str r7, [r7, #0xc]
	str r7, [r7, #8]
	cmp r3, #0
	blt _080D49AE
	adds r2, r5, r1
	ldr r0, [r2, #4]
	movs r1, #1
	orrs r0, r1
	str r0, [r2, #4]
	b _080D4BD6
_080D49AE:
	ldr r0, _080D49D0 @ 0x000001FF
	cmp r1, r0
	bhi _080D49D4
	lsrs r2, r1, #3
	mov r3, sl
	subs r3, #8
	adds r0, r2, #0
	asrs r0, r0, #2
	movs r1, #1
	lsls r1, r0
	ldr r0, [r3, #4]
	orrs r0, r1
	str r0, [r3, #4]
	lsls r0, r2, #3
	adds r6, r0, r3
	ldr r4, [r6, #8]
	b _080D4A5C
	.align 2, 0
_080D49D0: .4byte 0x000001FF
_080D49D4:
	lsrs r2, r1, #9
	cmp r2, #0
	bne _080D49DE
	lsrs r2, r1, #3
	b _080D4A22
_080D49DE:
	cmp r2, #4
	bhi _080D49EA
	lsrs r0, r1, #6
	adds r2, r0, #0
	adds r2, #0x38
	b _080D4A22
_080D49EA:
	cmp r2, #0x14
	bhi _080D49F2
	adds r2, #0x5b
	b _080D4A22
_080D49F2:
	cmp r2, #0x54
	bhi _080D49FE
	lsrs r0, r1, #0xc
	adds r2, r0, #0
	adds r2, #0x6e
	b _080D4A22
_080D49FE:
	movs r0, #0xaa
	lsls r0, r0, #1
	cmp r2, r0
	bhi _080D4A0E
	lsrs r0, r1, #0xf
	adds r2, r0, #0
	adds r2, #0x77
	b _080D4A22
_080D4A0E:
	ldr r0, _080D4A1C @ 0x00000554
	cmp r2, r0
	bhi _080D4A20
	lsrs r0, r1, #0x12
	adds r2, r0, #0
	adds r2, #0x7c
	b _080D4A22
	.align 2, 0
_080D4A1C: .4byte 0x00000554
_080D4A20:
	movs r2, #0x7e
_080D4A22:
	lsls r0, r2, #3
	ldr r3, _080D4A40 @ 0x08B1FA38
	adds r6, r0, r3
	ldr r4, [r6, #8]
	cmp r4, r6
	bne _080D4A44
	adds r0, r2, #0
	asrs r0, r0, #2
	movs r1, #1
	lsls r1, r0
	ldr r7, _080D4A40 @ 0x08B1FA38
	ldr r0, [r7, #4]
	orrs r0, r1
	str r0, [r7, #4]
	b _080D4A5C
	.align 2, 0
_080D4A40: .4byte 0x08B1FA38
_080D4A44:
	ldr r0, [r4, #4]
	movs r2, #4
	rsbs r2, r2, #0
	b _080D4A54
_080D4A4C:
	ldr r4, [r4, #8]
	cmp r4, r6
	beq _080D4A5A
	ldr r0, [r4, #4]
_080D4A54:
	ands r0, r2
	cmp r1, r0
	blo _080D4A4C
_080D4A5A:
	ldr r6, [r4, #0xc]
_080D4A5C:
	str r6, [r5, #0xc]
	str r4, [r5, #8]
	str r5, [r6, #8]
	str r5, [r4, #0xc]
_080D4A64:
	mov r0, ip
	cmp r0, #0
	bge _080D4A6C
	adds r0, #3
_080D4A6C:
	asrs r0, r0, #2
	movs r6, #1
	lsls r6, r0
	ldr r0, _080D4A90 @ 0x08B1FA38
	ldr r1, [r0, #4]
	cmp r6, r1
	bhi _080D4B2E
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	bne _080D4AA2
	movs r0, #4
	rsbs r0, r0, #0
	mov r2, ip
	ands r0, r2
	adds r0, #4
	mov ip, r0
	b _080D4A98
	.align 2, 0
_080D4A90: .4byte 0x08B1FA38
_080D4A94:
	movs r3, #4
	add ip, r3
_080D4A98:
	lsls r6, r6, #1
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	beq _080D4A94
_080D4AA2:
	ldr r4, _080D4B20 @ 0x08B1FA38
	mov sb, r4
_080D4AA6:
	mov r7, ip
	str r7, [sp, #4]
	mov r1, ip
	lsls r0, r1, #3
	mov r3, sb
	adds r2, r0, r3
	adds r4, r2, #0
_080D4AB4:
	ldr r5, [r4, #0xc]
	cmp r5, r4
	beq _080D4AD4
	movs r0, #4
	rsbs r0, r0, #0
_080D4ABE:
	ldr r1, [r5, #4]
	ands r1, r0
	mov r7, r8
	subs r3, r1, r7
	cmp r3, #0xf
	bgt _080D4B84
	cmp r3, #0
	bge _080D4BAC
	ldr r5, [r5, #0xc]
	cmp r5, r4
	bne _080D4ABE
_080D4AD4:
	adds r4, #8
	movs r0, #1
	add ip, r0
	mov r0, ip
	movs r1, #3
	ands r0, r1
	cmp r0, #0
	bne _080D4AB4
_080D4AE4:
	ldr r0, [sp, #4]
	ands r0, r1
	cmp r0, #0
	beq _080D4B24
	ldr r3, [sp, #4]
	subs r3, #1
	str r3, [sp, #4]
	subs r2, #8
	ldr r0, [r2, #8]
	cmp r0, r2
	beq _080D4AE4
_080D4AFA:
	lsls r6, r6, #1
	mov r4, sb
	ldr r1, [r4, #4]
	cmp r6, r1
	bhi _080D4B2E
	cmp r6, #0
	beq _080D4B2E
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	bne _080D4AA6
_080D4B10:
	movs r7, #4
	add ip, r7
	lsls r6, r6, #1
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	beq _080D4B10
	b _080D4AA6
	.align 2, 0
_080D4B20: .4byte 0x08B1FA38
_080D4B24:
	mov r1, sb
	ldr r0, [r1, #4]
	bics r0, r6
	str r0, [r1, #4]
	b _080D4AFA
_080D4B2E:
	ldr r2, _080D4B6C @ 0x08B1FA38
	ldr r0, [r2, #8]
	ldr r0, [r0, #4]
	movs r4, #4
	rsbs r4, r4, #0
	ands r0, r4
	mov r7, r8
	subs r3, r0, r7
	cmp r0, r8
	blo _080D4B46
	cmp r3, #0xf
	bgt _080D4BC0
_080D4B46:
	ldr r0, [sp]
	mov r1, r8
	bl sub_080D46D4
	ldr r1, _080D4B6C @ 0x08B1FA38
	ldr r0, [r1, #8]
	ldr r0, [r0, #4]
	ands r0, r4
	mov r2, r8
	subs r3, r0, r2
	cmp r0, r8
	blo _080D4B62
	cmp r3, #0xf
	bgt _080D4BC0
_080D4B62:
	ldr r0, [sp]
	bl nullsub_4
	movs r0, #0
	b _080D4BE0
	.align 2, 0
_080D4B6C: .4byte 0x08B1FA38
_080D4B70:
	ldr r6, [r5, #0xc]
	ldr r4, [r5, #8]
	str r6, [r4, #0xc]
	str r4, [r6, #8]
	adds r2, r5, r1
	ldr r0, [r2, #4]
	movs r1, #1
	orrs r0, r1
	str r0, [r2, #4]
	b _080D4BD6
_080D4B84:
	mov r4, r8
	adds r2, r5, r4
	movs r1, #1
	orrs r4, r1
	str r4, [r5, #4]
	ldr r6, [r5, #0xc]
	ldr r4, [r5, #8]
	str r6, [r4, #0xc]
	str r4, [r6, #8]
	mov r7, sl
	str r2, [r7, #0xc]
	str r2, [r7, #8]
	str r7, [r2, #0xc]
	str r7, [r2, #8]
	adds r0, r3, #0
	orrs r0, r1
	str r0, [r2, #4]
	adds r0, r2, r3
	str r3, [r0]
	b _080D4BD6
_080D4BAC:
	adds r2, r5, r1
	ldr r0, [r2, #4]
	movs r1, #1
	orrs r0, r1
	str r0, [r2, #4]
	ldr r6, [r5, #0xc]
	ldr r4, [r5, #8]
	str r6, [r4, #0xc]
	str r4, [r6, #8]
	b _080D4BD6
_080D4BC0:
	ldr r2, _080D4BEC @ 0x08B1FA38
	ldr r5, [r2, #8]
	movs r1, #1
	mov r0, r8
	orrs r0, r1
	str r0, [r5, #4]
	mov r4, r8
	adds r0, r5, r4
	str r0, [r2, #8]
	orrs r3, r1
	str r3, [r0, #4]
_080D4BD6:
	ldr r0, [sp]
	bl nullsub_4
	adds r0, r5, #0
	adds r0, #8
_080D4BE0:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_080D4BEC: .4byte 0x08B1FA38

	THUMB_FUNC_START sub_080D4BF0
sub_080D4BF0: @ 0x080D4BF0
	sub sp, #4
	cmp r1, #0
	bne _080D4BF8
	mov r1, sp
_080D4BF8:
	cmp r2, #0
	beq _080D4C14
	cmp r3, #0
	bne _080D4C06
	movs r0, #1
	rsbs r0, r0, #0
	b _080D4C16
_080D4C06:
	ldrb r0, [r2]
	str r0, [r1]
	ldrb r0, [r2]
	cmp r0, #0
	beq _080D4C14
	movs r0, #1
	b _080D4C16
_080D4C14:
	movs r0, #0
_080D4C16:
	add sp, #4
	bx lr
	.byte 0x00, 0x00

	THUMB_FUNC_START .gcc2_compiled._28
.gcc2_compiled._28: @ 0x080D4C1C
	push {r4, r5, r6, r7, lr}
	adds r5, r1, #0
	adds r1, r0, #0
	movs r0, #0xff
	ands r5, r0
	cmp r2, #3
	bls _080D4C90
	movs r0, #3
	ands r0, r1
	cmp r0, #0
	bne _080D4C90
	adds r4, r1, #0
	movs r6, #0
	movs r1, #0
_080D4C38:
	lsls r0, r6, #8
	adds r6, r0, r5
	adds r1, #1
	cmp r1, #3
	bls _080D4C38
	cmp r2, #3
	bls _080D4C76
	ldr r0, _080D4C7C @ 0xFEFEFEFF
	mov ip, r0
	ldr r7, _080D4C80 @ 0x80808080
_080D4C4C:
	ldr r1, [r4]
	eors r1, r6
	mov r3, ip
	adds r0, r1, r3
	bics r0, r1
	ands r0, r7
	cmp r0, #0
	beq _080D4C6E
	adds r1, r4, #0
	movs r3, #0
_080D4C60:
	ldrb r0, [r1]
	cmp r0, r5
	beq _080D4C8A
	adds r1, #1
	adds r3, #1
	cmp r3, #3
	bls _080D4C60
_080D4C6E:
	subs r2, #4
	adds r4, #4
	cmp r2, #3
	bhi _080D4C4C
_080D4C76:
	adds r1, r4, #0
	b _080D4C90
	.align 2, 0
_080D4C7C: .4byte 0xFEFEFEFF
_080D4C80: .4byte 0x80808080
_080D4C84:
	ldrb r0, [r1]
	cmp r0, r5
	bne _080D4C8E
_080D4C8A:
	adds r0, r1, #0
	b _080D4C9A
_080D4C8E:
	adds r1, #1
_080D4C90:
	adds r0, r2, #0
	subs r2, #1
	cmp r0, #0
	bne _080D4C84
	movs r0, #0
_080D4C9A:
	pop {r4, r5, r6, r7, pc}

	THUMB_FUNC_START .gcc2_compiled._29
.gcc2_compiled._29: @ 0x080D4C9C
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r5, #0
	adds r3, r1, #0
	cmp r3, r5
	bhs _080D4CCE
	adds r0, r3, r2
	cmp r5, r0
	bhs _080D4CCE
	adds r3, r0, #0
	adds r4, r5, r2
	subs r2, #1
	movs r0, #1
	rsbs r0, r0, #0
	cmp r2, r0
	beq _080D4D20
	adds r1, r0, #0
_080D4CBE:
	subs r4, #1
	subs r3, #1
	ldrb r0, [r3]
	strb r0, [r4]
	subs r2, #1
	cmp r2, r1
	bne _080D4CBE
	b _080D4D20
_080D4CCE:
	cmp r2, #0xf
	bls _080D4D06
	adds r0, r3, #0
	orrs r0, r4
	movs r1, #3
	ands r0, r1
	cmp r0, #0
	bne _080D4D06
	adds r1, r3, #0
_080D4CE0:
	ldm r1!, {r0}
	stm r4!, {r0}
	ldm r1!, {r0}
	stm r4!, {r0}
	ldm r1!, {r0}
	stm r4!, {r0}
	ldm r1!, {r0}
	stm r4!, {r0}
	subs r2, #0x10
	cmp r2, #0xf
	bhi _080D4CE0
	cmp r2, #3
	bls _080D4D04
_080D4CFA:
	ldm r1!, {r0}
	stm r4!, {r0}
	subs r2, #4
	cmp r2, #3
	bhi _080D4CFA
_080D4D04:
	adds r3, r1, #0
_080D4D06:
	subs r2, #1
	movs r0, #1
	rsbs r0, r0, #0
	cmp r2, r0
	beq _080D4D20
	adds r1, r0, #0
_080D4D12:
	ldrb r0, [r3]
	strb r0, [r4]
	adds r3, #1
	adds r4, #1
	subs r2, #1
	cmp r2, r1
	bne _080D4D12
_080D4D20:
	adds r0, r5, #0
	pop {r4, r5, pc}

	THUMB_FUNC_START nullsub_3
nullsub_3: @ 0x080D4D24
	bx lr
	.byte 0x00, 0x00

	THUMB_FUNC_START nullsub_4
nullsub_4: @ 0x080D4D28
	bx lr
	.byte 0x00, 0x00

	THUMB_FUNC_START .gcc2_compiled._30
.gcc2_compiled._30: @ 0x080D4D2C
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r6, r1, #0
	ldr r0, [r4, #0x4c]
	cmp r0, #0
	bne _080D4D48
	adds r0, r4, #0
	movs r1, #4
	movs r2, #0x10
	bl sub_080D5C20
	str r0, [r4, #0x4c]
	cmp r0, #0
	beq _080D4D70
_080D4D48:
	ldr r1, [r4, #0x4c]
	lsls r0, r6, #2
	adds r2, r0, r1
	ldr r1, [r2]
	cmp r1, #0
	beq _080D4D5A
	ldr r0, [r1]
	str r0, [r2]
	b _080D4D78
_080D4D5A:
	movs r5, #1
	lsls r5, r6
	lsls r2, r5, #2
	adds r2, #0x14
	adds r0, r4, #0
	movs r1, #1
	bl sub_080D5C20
	adds r1, r0, #0
	cmp r1, #0
	bne _080D4D74
_080D4D70:
	movs r0, #0
	b _080D4D80
_080D4D74:
	str r6, [r1, #4]
	str r5, [r1, #8]
_080D4D78:
	movs r0, #0
	str r0, [r1, #0x10]
	str r0, [r1, #0xc]
	adds r0, r1, #0
_080D4D80:
	pop {r4, r5, r6, pc}
	.byte 0x00, 0x00

	THUMB_FUNC_START _Bfree
_Bfree: @ 0x080D4D84
	adds r3, r0, #0
	adds r2, r1, #0
	cmp r2, #0
	beq _080D4D9A
	ldr r0, [r2, #4]
	ldr r1, [r3, #0x4c]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	str r1, [r2]
	str r2, [r0]
_080D4D9A:
	bx lr

	THUMB_FUNC_START _multadd
_multadd: @ 0x080D4D9C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	mov sb, r0
	adds r5, r1, #0
	adds r4, r2, #0
	mov r8, r3
	ldr r6, [r5, #0x10]
	adds r3, r5, #0
	adds r3, #0x14
	movs r7, #0
	ldr r0, _080D4E30 @ 0x0000FFFF
	mov ip, r0
_080D4DB8:
	ldr r1, [r3]
	adds r0, r1, #0
	mov r2, ip
	ands r0, r2
	adds r2, r0, #0
	muls r2, r4, r2
	add r2, r8
	lsrs r1, r1, #0x10
	adds r0, r1, #0
	muls r0, r4, r0
	lsrs r1, r2, #0x10
	adds r0, r0, r1
	lsrs r1, r0, #0x10
	mov r8, r1
	lsls r0, r0, #0x10
	mov r1, ip
	ands r2, r1
	adds r0, r0, r2
	stm r3!, {r0}
	adds r7, #1
	cmp r7, r6
	blt _080D4DB8
	mov r2, r8
	cmp r2, #0
	beq _080D4E26
	ldr r0, [r5, #8]
	cmp r6, r0
	blt _080D4E16
	ldr r1, [r5, #4]
	adds r1, #1
	mov r0, sb
	bl .gcc2_compiled._30
	adds r4, r0, #0
	adds r0, #0xc
	adds r1, r5, #0
	adds r1, #0xc
	ldr r2, [r5, #0x10]
	lsls r2, r2, #2
	adds r2, #8
	bl sub_080D1C0C
	mov r0, sb
	adds r1, r5, #0
	bl _Bfree
	adds r5, r4, #0
_080D4E16:
	lsls r1, r6, #2
	adds r0, r5, #0
	adds r0, #0x14
	adds r0, r0, r1
	mov r1, r8
	str r1, [r0]
	adds r6, #1
	str r6, [r5, #0x10]
_080D4E26:
	adds r0, r5, #0
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_080D4E30: .4byte 0x0000FFFF

	THUMB_FUNC_START _s2b
_s2b: @ 0x080D4E34
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r7, r0, #0
	adds r4, r1, #0
	adds r6, r2, #0
	mov r8, r3
	mov r0, r8
	adds r0, #8
	movs r1, #9
	bl ThumbDivide
	movs r1, #0
	movs r2, #1
	cmp r0, #1
	ble _080D4E5C
_080D4E54:
	lsls r2, r2, #1
	adds r1, #1
	cmp r0, r2
	bgt _080D4E54
_080D4E5C:
	adds r0, r7, #0
	bl .gcc2_compiled._30
	adds r1, r0, #0
	ldr r0, [sp, #0x18]
	str r0, [r1, #0x14]
	movs r0, #1
	str r0, [r1, #0x10]
	movs r5, #9
	cmp r6, #9
	ble _080D4E8E
	adds r4, #9
_080D4E74:
	ldrb r3, [r4]
	subs r3, #0x30
	adds r4, #1
	adds r0, r7, #0
	movs r2, #0xa
	bl _multadd
	adds r1, r0, #0
	adds r5, #1
	cmp r5, r6
	blt _080D4E74
	adds r4, #1
	b _080D4E90
_080D4E8E:
	adds r4, #0xa
_080D4E90:
	cmp r5, r8
	bge _080D4EAE
	mov r0, r8
	subs r5, r0, r5
_080D4E98:
	ldrb r3, [r4]
	subs r3, #0x30
	adds r4, #1
	adds r0, r7, #0
	movs r2, #0xa
	bl _multadd
	adds r1, r0, #0
	subs r5, #1
	cmp r5, #0
	bne _080D4E98
_080D4EAE:
	adds r0, r1, #0
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7, pc}
	.byte 0x00, 0x00

	THUMB_FUNC_START _hi0bits
_hi0bits: @ 0x080D4EB8
	adds r1, r0, #0
	movs r2, #0
	ldr r0, _080D4F08 @ 0xFFFF0000
	ands r0, r1
	cmp r0, #0
	bne _080D4EC8
	movs r2, #0x10
	lsls r1, r1, #0x10
_080D4EC8:
	movs r0, #0xff
	lsls r0, r0, #0x18
	ands r0, r1
	cmp r0, #0
	bne _080D4ED6
	adds r2, #8
	lsls r1, r1, #8
_080D4ED6:
	movs r0, #0xf0
	lsls r0, r0, #0x18
	ands r0, r1
	cmp r0, #0
	bne _080D4EE4
	adds r2, #4
	lsls r1, r1, #4
_080D4EE4:
	movs r0, #0xc0
	lsls r0, r0, #0x18
	ands r0, r1
	cmp r0, #0
	bne _080D4EF2
	adds r2, #2
	lsls r1, r1, #2
_080D4EF2:
	cmp r1, #0
	blt _080D4F0C
	adds r2, #1
	movs r0, #0x80
	lsls r0, r0, #0x17
	ands r0, r1
	cmp r0, #0
	bne _080D4F0C
	movs r0, #0x20
	b _080D4F0E
	.align 2, 0
_080D4F08: .4byte 0xFFFF0000
_080D4F0C:
	adds r0, r2, #0
_080D4F0E:
	bx lr

	THUMB_FUNC_START _lo0bits
_lo0bits: @ 0x080D4F10
	adds r3, r0, #0
	ldr r1, [r3]
	movs r0, #7
	ands r0, r1
	cmp r0, #0
	beq _080D4F40
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080D4F28
	movs r0, #0
	b _080D4F90
_080D4F28:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080D4F38
	lsrs r0, r1, #1
	str r0, [r3]
	movs r0, #1
	b _080D4F90
_080D4F38:
	lsrs r0, r1, #2
	str r0, [r3]
	movs r0, #2
	b _080D4F90
_080D4F40:
	movs r2, #0
	ldr r0, _080D4F88 @ 0x0000FFFF
	ands r0, r1
	cmp r0, #0
	bne _080D4F4E
	movs r2, #0x10
	lsrs r1, r1, #0x10
_080D4F4E:
	movs r0, #0xff
	ands r0, r1
	cmp r0, #0
	bne _080D4F5A
	adds r2, #8
	lsrs r1, r1, #8
_080D4F5A:
	movs r0, #0xf
	ands r0, r1
	cmp r0, #0
	bne _080D4F66
	adds r2, #4
	lsrs r1, r1, #4
_080D4F66:
	movs r0, #3
	ands r0, r1
	cmp r0, #0
	bne _080D4F72
	adds r2, #2
	lsrs r1, r1, #2
_080D4F72:
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _080D4F8C
	adds r2, #1
	lsrs r1, r1, #1
	cmp r1, #0
	bne _080D4F8C
	movs r0, #0x20
	b _080D4F90
	.align 2, 0
_080D4F88: .4byte 0x0000FFFF
_080D4F8C:
	str r1, [r3]
	adds r0, r2, #0
_080D4F90:
	bx lr
	.byte 0x00, 0x00

	THUMB_FUNC_START _i2b
_i2b: @ 0x080D4F94
	push {r4, lr}
	adds r4, r1, #0
	movs r1, #1
	bl .gcc2_compiled._30
	str r4, [r0, #0x14]
	movs r1, #1
	str r1, [r0, #0x10]
	pop {r4, pc}
	.byte 0x00, 0x00

	THUMB_FUNC_START _multiply
_multiply: @ 0x080D4FA8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x24
	adds r3, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	ldr r1, [r4, #0x10]
	ldr r0, [r5, #0x10]
	cmp r1, r0
	bge _080D4FC8
	str r4, [sp]
	adds r4, r5, #0
	ldr r5, [sp]
_080D4FC8:
	ldr r1, [r4, #4]
	ldr r6, [r4, #0x10]
	ldr r0, [r5, #0x10]
	mov r8, r0
	mov r2, r8
	adds r2, r6, r2
	str r2, [sp, #4]
	ldr r0, [r4, #8]
	cmp r2, r0
	ble _080D4FDE
	adds r1, #1
_080D4FDE:
	adds r0, r3, #0
	bl .gcc2_compiled._30
	str r0, [sp]
	adds r7, r0, #0
	adds r7, #0x14
	ldr r1, [sp, #4]
	lsls r0, r1, #2
	adds r2, r7, r0
	str r2, [sp, #8]
	str r0, [sp, #0x18]
	adds r1, r4, #0
	adds r1, #0x14
	lsls r3, r6, #2
	adds r2, r5, #0
	adds r2, #0x14
	mov r5, r8
	lsls r4, r5, #2
	ldr r0, [sp, #8]
	cmp r7, r0
	bhs _080D5012
	movs r0, #0
_080D500A:
	stm r7!, {r0}
	ldr r5, [sp, #8]
	cmp r7, r5
	blo _080D500A
_080D5012:
	str r1, [sp, #8]
	adds r3, r1, r3
	str r3, [sp, #0xc]
	mov r8, r2
	add r4, r8
	str r4, [sp, #0x10]
	ldr r0, [sp]
	adds r0, #0x14
	mov sb, r0
	mov r1, sb
	str r1, [sp, #0x20]
	cmp r8, r4
	bhs _080D50DA
_080D502C:
	mov r2, r8
	ldm r2!, {r6}
	str r2, [sp, #0x14]
	ldr r0, _080D50E8 @ 0x0000FFFF
	ands r6, r0
	mov r4, sb
	adds r4, #4
	str r4, [sp, #0x1c]
	cmp r6, #0
	beq _080D5084
	ldr r7, [sp, #8]
	mov r5, sb
	movs r1, #0
	mov ip, r1
	mov sl, r0
_080D504A:
	ldm r7!, {r3}
	adds r0, r3, #0
	mov r2, sl
	ands r0, r2
	adds r1, r0, #0
	muls r1, r6, r1
	ldr r2, [r5]
	adds r0, r2, #0
	mov r4, sl
	ands r0, r4
	adds r1, r1, r0
	mov r0, ip
	adds r4, r1, r0
	lsrs r1, r4, #0x10
	lsrs r3, r3, #0x10
	adds r0, r3, #0
	muls r0, r6, r0
	lsrs r2, r2, #0x10
	adds r0, r0, r2
	adds r2, r0, r1
	lsrs r0, r2, #0x10
	mov ip, r0
	strh r2, [r5]
	strh r4, [r5, #2]
	adds r5, #4
	ldr r1, [sp, #0xc]
	cmp r7, r1
	blo _080D504A
	str r0, [r5]
_080D5084:
	mov r2, r8
	ldrh r6, [r2, #2]
	cmp r6, #0
	beq _080D50CC
	ldr r7, [sp, #8]
	mov r5, sb
	movs r4, #0
	mov ip, r4
	ldr r2, [r5]
	ldr r3, _080D50E8 @ 0x0000FFFF
_080D5098:
	ldm r7!, {r1}
	adds r0, r1, #0
	ands r0, r3
	muls r0, r6, r0
	ldrh r4, [r5, #2]
	adds r4, r4, r0
	mov r8, r4
	add r4, ip
	lsrs r0, r4, #0x10
	mov ip, r0
	strh r4, [r5]
	strh r2, [r5, #2]
	adds r5, #4
	lsrs r1, r1, #0x10
	muls r1, r6, r1
	ldr r0, [r5]
	ands r0, r3
	adds r1, r1, r0
	mov r4, ip
	adds r2, r1, r4
	lsrs r0, r2, #0x10
	mov ip, r0
	ldr r1, [sp, #0xc]
	cmp r7, r1
	blo _080D5098
	str r2, [r5]
_080D50CC:
	ldr r2, [sp, #0x14]
	mov r8, r2
	ldr r4, [sp, #0x1c]
	mov sb, r4
	ldr r5, [sp, #0x10]
	cmp r8, r5
	blo _080D502C
_080D50DA:
	ldr r0, [sp, #0x20]
	ldr r1, [sp, #0x18]
	adds r5, r0, r1
	ldr r2, [sp, #4]
	cmp r2, #0
	ble _080D50FE
	b _080D50F6
	.align 2, 0
_080D50E8: .4byte 0x0000FFFF
_080D50EC:
	ldr r4, [sp, #4]
	subs r4, #1
	str r4, [sp, #4]
	cmp r4, #0
	ble _080D50FE
_080D50F6:
	subs r5, #4
	ldr r0, [r5]
	cmp r0, #0
	beq _080D50EC
_080D50FE:
	ldr r5, [sp, #4]
	ldr r0, [sp]
	str r5, [r0, #0x10]
	ldr r0, [sp]
	add sp, #0x24
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7, pc}
	.byte 0x00, 0x00

	THUMB_FUNC_START _pow5mult
_pow5mult: @ 0x080D5114
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	adds r7, r1, #0
	adds r6, r2, #0
	movs r1, #3
	ands r1, r6
	cmp r1, #0
	beq _080D513E
	ldr r0, _080D5160 @ 0x085877D0
	subs r1, #1
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r2, [r1]
	mov r0, r8
	adds r1, r7, #0
	movs r3, #0
	bl _multadd
	adds r7, r0, #0
_080D513E:
	asrs r6, r6, #2
	cmp r6, #0
	beq _080D51A4
	mov r0, r8
	ldr r5, [r0, #0x48]
	adds r4, r5, #0
	cmp r5, #0
	bne _080D5180
	ldr r1, _080D5164 @ 0x00000271
	bl _i2b
	mov r1, r8
	str r0, [r1, #0x48]
	adds r5, r0, #0
	str r4, [r5]
	b _080D5180
	.align 2, 0
_080D5160: .4byte 0x085877D0
_080D5164: .4byte 0x00000271
_080D5168:
	ldr r0, [r5]
	adds r4, r0, #0
	cmp r0, #0
	bne _080D517E
	mov r0, r8
	adds r1, r5, #0
	adds r2, r5, #0
	bl _multiply
	str r0, [r5]
	str r4, [r0]
_080D517E:
	adds r5, r0, #0
_080D5180:
	movs r0, #1
	ands r0, r6
	cmp r0, #0
	beq _080D519E
	mov r0, r8
	adds r1, r7, #0
	adds r2, r5, #0
	bl _multiply
	adds r4, r0, #0
	mov r0, r8
	adds r1, r7, #0
	bl _Bfree
	adds r7, r4, #0
_080D519E:
	asrs r6, r6, #1
	cmp r6, #0
	bne _080D5168
_080D51A4:
	adds r0, r7, #0
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7, pc}

	THUMB_FUNC_START _lshift
_lshift: @ 0x080D51AC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	mov sl, r0
	mov r8, r1
	adds r5, r2, #0
	asrs r6, r5, #5
	ldr r1, [r1, #4]
	mov r2, r8
	ldr r0, [r2, #0x10]
	adds r0, r6, r0
	adds r7, r0, #1
	ldr r2, [r2, #8]
	cmp r7, r2
	ble _080D51D6
_080D51CE:
	adds r1, #1
	lsls r2, r2, #1
	cmp r7, r2
	bgt _080D51CE
_080D51D6:
	mov r0, sl
	bl .gcc2_compiled._30
	mov sb, r0
	mov r4, sb
	adds r4, #0x14
	mov r0, r8
	adds r0, #0x14
	cmp r6, #0
	ble _080D51F6
	movs r1, #0
	adds r2, r6, #0
_080D51EE:
	stm r4!, {r1}
	subs r2, #1
	cmp r2, #0
	bne _080D51EE
_080D51F6:
	adds r3, r0, #0
	mov r1, r8
	ldr r0, [r1, #0x10]
	lsls r0, r0, #2
	adds r6, r3, r0
	movs r0, #0x1f
	ands r5, r0
	cmp r5, #0
	beq _080D5228
	movs r0, #0x20
	subs r1, r0, r5
	movs r2, #0
_080D520E:
	ldr r0, [r3]
	lsls r0, r5
	orrs r0, r2
	stm r4!, {r0}
	ldm r3!, {r2}
	lsrs r2, r1
	cmp r3, r6
	blo _080D520E
	str r2, [r4]
	cmp r2, #0
	beq _080D5230
	adds r7, #1
	b _080D5230
_080D5228:
	ldm r3!, {r0}
	stm r4!, {r0}
	cmp r3, r6
	blo _080D5228
_080D5230:
	subs r0, r7, #1
	mov r2, sb
	str r0, [r2, #0x10]
	mov r0, sl
	mov r1, r8
	bl _Bfree
	mov r0, sb
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7, pc}
	.byte 0x00, 0x00

	THUMB_FUNC_START __mcmp
__mcmp: @ 0x080D524C
	push {r4, r5, lr}
	adds r2, r0, #0
	adds r5, r1, #0
	ldr r0, [r2, #0x10]
	ldr r1, [r5, #0x10]
	subs r0, r0, r1
	cmp r0, #0
	bne _080D5288
	adds r4, r2, #0
	adds r4, #0x14
	lsls r1, r1, #2
	adds r3, r4, r1
	adds r0, r5, #0
	adds r0, #0x14
	adds r1, r0, r1
_080D526A:
	subs r3, #4
	subs r1, #4
	ldr r0, [r3]
	ldr r2, [r1]
	cmp r0, r2
	beq _080D5282
	movs r1, #1
	cmp r0, r2
	bhs _080D527E
	subs r1, #2
_080D527E:
	adds r0, r1, #0
	b _080D5288
_080D5282:
	cmp r3, r4
	bhi _080D526A
	movs r0, #0
_080D5288:
	pop {r4, r5, pc}
	.byte 0x00, 0x00

	THUMB_FUNC_START __mdiff
__mdiff: @ 0x080D528C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r6, r0, #0
	adds r5, r1, #0
	mov r8, r2
	adds r0, r5, #0
	mov r1, r8
	bl __mcmp
	adds r4, r0, #0
	cmp r4, #0
	bne _080D52BE
	adds r0, r6, #0
	movs r1, #0
	bl .gcc2_compiled._30
	adds r7, r0, #0
	movs r0, #1
	str r0, [r7, #0x10]
	str r4, [r7, #0x14]
	b _080D536E
_080D52BE:
	cmp r4, #0
	bge _080D52CC
	adds r7, r5, #0
	mov r5, r8
	mov r8, r7
	movs r4, #1
	b _080D52CE
_080D52CC:
	movs r4, #0
_080D52CE:
	ldr r1, [r5, #4]
	adds r0, r6, #0
	bl .gcc2_compiled._30
	adds r7, r0, #0
	str r4, [r7, #0xc]
	ldr r0, [r5, #0x10]
	mov sb, r0
	adds r6, r5, #0
	adds r6, #0x14
	lsls r0, r0, #2
	adds r0, r0, r6
	mov sl, r0
	mov r1, r8
	ldr r0, [r1, #0x10]
	movs r3, #0x14
	add r3, r8
	mov ip, r3
	lsls r0, r0, #2
	add r0, ip
	str r0, [sp]
	adds r4, r7, #0
	adds r4, #0x14
	movs r5, #0
	ldr r0, _080D5358 @ 0x0000FFFF
	mov r8, r0
_080D5302:
	ldm r6!, {r1}
	str r1, [sp, #4]
	mov r3, r8
	ands r1, r3
	mov r0, ip
	adds r0, #4
	mov ip, r0
	subs r0, #4
	ldm r0!, {r2}
	adds r0, r2, #0
	ands r0, r3
	subs r1, r1, r0
	adds r0, r1, r5
	asrs r5, r0, #0x10
	ldr r1, [sp, #4]
	lsrs r3, r1, #0x10
	lsrs r2, r2, #0x10
	subs r3, r3, r2
	adds r1, r3, r5
	asrs r5, r1, #0x10
	strh r1, [r4]
	strh r0, [r4, #2]
	adds r4, #4
	ldr r3, [sp]
	cmp ip, r3
	blo _080D5302
	cmp r6, sl
	bhs _080D5362
	ldr r2, _080D5358 @ 0x0000FFFF
_080D533C:
	ldm r6!, {r1}
	adds r0, r1, #0
	ands r0, r2
	adds r0, r0, r5
	asrs r5, r0, #0x10
	lsrs r1, r1, #0x10
	adds r1, r1, r5
	asrs r5, r1, #0x10
	strh r1, [r4]
	strh r0, [r4, #2]
	adds r4, #4
	cmp r6, sl
	blo _080D533C
	b _080D5362
	.align 2, 0
_080D5358: .4byte 0x0000FFFF
_080D535C:
	movs r0, #1
	rsbs r0, r0, #0
	add sb, r0
_080D5362:
	subs r4, #4
	ldr r0, [r4]
	cmp r0, #0
	beq _080D535C
	mov r1, sb
	str r1, [r7, #0x10]
_080D536E:
	adds r0, r7, #0
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7, pc}

	THUMB_FUNC_START _ulp
_ulp: @ 0x080D537C
	push {r4, lr}
	ldr r2, _080D5390 @ 0x7FF00000
	ands r2, r0
	ldr r0, _080D5394 @ 0xFCC00000
	adds r2, r2, r0
	cmp r2, #0
	ble _080D5398
	adds r3, r2, #0
	movs r4, #0
	b _080D53C2
	.align 2, 0
_080D5390: .4byte 0x7FF00000
_080D5394: .4byte 0xFCC00000
_080D5398:
	rsbs r0, r2, #0
	asrs r2, r0, #0x14
	cmp r2, #0x13
	bgt _080D53AC
	movs r0, #0x80
	lsls r0, r0, #0xc
	adds r3, r0, #0
	asrs r3, r2
	movs r4, #0
	b _080D53C2
_080D53AC:
	movs r3, #0
	subs r2, #0x14
	cmp r2, #0x1e
	bgt _080D53BE
	movs r0, #0x1f
	subs r0, r0, r2
	movs r1, #1
	lsls r1, r0
	b _080D53C0
_080D53BE:
	movs r1, #1
_080D53C0:
	adds r4, r1, #0
_080D53C2:
	adds r1, r4, #0
	adds r0, r3, #0
	pop {r4, pc}

	THUMB_FUNC_START _b2d
_b2d: @ 0x080D53C8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r4, r1, #0
	movs r1, #0x14
	adds r1, r1, r0
	mov r8, r1
	ldr r0, [r0, #0x10]
	lsls r0, r0, #2
	adds r5, r1, r0
	subs r5, #4
	ldr r2, [r5]
	adds r0, r2, #0
	str r2, [sp]
	bl _hi0bits
	adds r3, r0, #0
	movs r0, #0x20
	subs r0, r0, r3
	str r0, [r4]
	ldr r2, [sp]
	cmp r3, #0xa
	bgt _080D5428
	movs r0, #0xb
	subs r0, r0, r3
	adds r1, r2, #0
	lsrs r1, r0
	ldr r0, _080D5410 @ 0x3FF00000
	adds r6, r1, #0
	orrs r6, r0
	cmp r5, r8
	bls _080D5414
	subs r5, #4
	ldr r1, [r5]
	b _080D5416
	.align 2, 0
_080D5410: .4byte 0x3FF00000
_080D5414:
	movs r1, #0
_080D5416:
	adds r0, r3, #0
	adds r0, #0x15
	lsls r2, r0
	movs r0, #0xb
	subs r0, r0, r3
	lsrs r1, r0
	adds r7, r2, #0
	orrs r7, r1
	b _080D5474
_080D5428:
	cmp r5, r8
	bls _080D5432
	subs r5, #4
	ldr r4, [r5]
	b _080D5434
_080D5432:
	movs r4, #0
_080D5434:
	subs r3, #0xb
	cmp r3, #0
	beq _080D546C
	lsls r2, r3
	movs r0, #0x20
	subs r0, r0, r3
	adds r1, r4, #0
	lsrs r1, r0
	ldr r0, _080D5458 @ 0x3FF00000
	orrs r1, r0
	adds r6, r2, #0
	orrs r6, r1
	cmp r5, r8
	bls _080D545C
	subs r5, #4
	ldr r2, [r5]
	b _080D545E
	.align 2, 0
_080D5458: .4byte 0x3FF00000
_080D545C:
	movs r2, #0
_080D545E:
	lsls r4, r3
	movs r0, #0x20
	subs r0, r0, r3
	lsrs r2, r0
	adds r7, r4, #0
	orrs r7, r2
	b _080D5474
_080D546C:
	ldr r0, _080D5480 @ 0x3FF00000
	adds r6, r2, #0
	orrs r6, r0
	adds r7, r4, #0
_080D5474:
	adds r1, r7, #0
	adds r0, r6, #0
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_080D5480: .4byte 0x3FF00000

	THUMB_FUNC_START _d2b
_d2b: @ 0x080D5484
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	mov sb, r3
	ldr r3, [sp, #0x28]
	mov sl, r3
	adds r5, r2, #0
	adds r4, r1, #0
	movs r1, #1
	bl .gcc2_compiled._30
	adds r6, r0, #0
	movs r0, #0x14
	adds r0, r0, r6
	mov r8, r0
	ldr r2, _080D54EC @ 0x000FFFFF
	adds r1, r4, #0
	ands r2, r1
	str r2, [sp, #4]
	ldr r0, _080D54F0 @ 0x7FFFFFFF
	ands r4, r0
	lsrs r7, r4, #0x14
	cmp r7, #0
	beq _080D54C2
	movs r0, #0x80
	lsls r0, r0, #0xd
	orrs r0, r2
	str r0, [sp, #4]
_080D54C2:
	str r5, [sp]
	cmp r5, #0
	beq _080D550C
	mov r0, sp
	bl _lo0bits
	adds r2, r0, #0
	cmp r2, #0
	beq _080D54F4
	movs r0, #0x20
	subs r0, r0, r2
	ldr r1, [sp, #4]
	lsls r1, r0
	ldr r0, [sp]
	orrs r0, r1
	str r0, [r6, #0x14]
	ldr r0, [sp, #4]
	lsrs r0, r2
	str r0, [sp, #4]
	b _080D54F8
	.align 2, 0
_080D54EC: .4byte 0x000FFFFF
_080D54F0: .4byte 0x7FFFFFFF
_080D54F4:
	ldr r0, [sp]
	str r0, [r6, #0x14]
_080D54F8:
	ldr r0, [sp, #4]
	mov r1, r8
	str r0, [r1, #4]
	movs r1, #1
	cmp r0, #0
	beq _080D5506
	movs r1, #2
_080D5506:
	str r1, [r6, #0x10]
	adds r4, r1, #0
	b _080D5520
_080D550C:
	add r0, sp, #4
	bl _lo0bits
	adds r2, r0, #0
	ldr r0, [sp, #4]
	str r0, [r6, #0x14]
	movs r0, #1
	str r0, [r6, #0x10]
	movs r4, #1
	adds r2, #0x20
_080D5520:
	cmp r7, #0
	beq _080D553C
	ldr r3, _080D5538 @ 0xFFFFFBCD
	adds r0, r2, r3
	adds r0, r7, r0
	mov r1, sb
	str r0, [r1]
	movs r0, #0x35
	subs r0, r0, r2
	mov r3, sl
	str r0, [r3]
	b _080D5558
	.align 2, 0
_080D5538: .4byte 0xFFFFFBCD
_080D553C:
	ldr r1, _080D5568 @ 0xFFFFFBCE
	adds r0, r2, r1
	mov r3, sb
	str r0, [r3]
	lsls r0, r4, #2
	add r0, r8
	subs r0, #4
	ldr r0, [r0]
	bl _hi0bits
	lsls r1, r4, #5
	subs r1, r1, r0
	mov r0, sl
	str r1, [r0]
_080D5558:
	adds r0, r6, #0
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_080D5568: .4byte 0xFFFFFBCE

	THUMB_FUNC_START _ratio
_ratio: @ 0x080D556C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r4, r0, #0
	adds r5, r1, #0
	mov r1, sp
	bl _b2d
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	add r1, sp, #4
	adds r0, r5, #0
	bl _b2d
	adds r7, r1, #0
	adds r6, r0, #0
	ldr r2, [sp]
	ldr r0, [sp, #4]
	subs r2, r2, r0
	ldr r0, [r4, #0x10]
	ldr r1, [r5, #0x10]
	subs r0, r0, r1
	lsls r0, r0, #5
	adds r0, r2, r0
	cmp r0, #0
	ble _080D55A8
	lsls r0, r0, #0x14
	ldr r1, [sp, #8]
	adds r0, r1, r0
	str r0, [sp, #8]
	b _080D55AC
_080D55A8:
	lsls r0, r0, #0x14
	subs r6, r6, r0
_080D55AC:
	ldr r0, [sp, #8]
	ldr r1, [sp, #0xc]
	adds r3, r7, #0
	adds r2, r6, #0
	bl __divdf3
	add sp, #0x10
	pop {r4, r5, r6, r7, pc}

	THUMB_FUNC_START _mprec_log10
_mprec_log10: @ 0x080D55BC
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _080D55D8 @ 0x00000000
	ldr r0, _080D55D4 @ 0x3FF00000
	cmp r4, #0x17
	bgt _080D55E0
	ldr r0, _080D55DC @ 0x085877DC
	lsls r1, r4, #3
	adds r1, r1, r0
	ldr r0, [r1]
	ldr r1, [r1, #4]
	b _080D55F2
	.align 2, 0
_080D55D4: .4byte 0x3FF00000
_080D55D8: .4byte 0x00000000
_080D55DC: .4byte 0x085877DC
_080D55E0:
	cmp r4, #0
	ble _080D55F2
_080D55E4:
	ldr r3, _080D55F8 @ 0x00000000
	ldr r2, _080D55F4 @ 0x40240000
	bl __muldf3
	subs r4, #1
	cmp r4, #0
	bgt _080D55E4
_080D55F2:
	pop {r4, pc}
	.align 2, 0
_080D55F4: .4byte 0x40240000
_080D55F8: .4byte 0x00000000

	THUMB_FUNC_START sub_080D55FC
sub_080D55FC: @ 0x080D55FC
	ldr r3, _080D5618 @ 0x7FFFFFFF
	ands r3, r0
	rsbs r2, r1, #0
	orrs r2, r1
	lsrs r2, r2, #0x1f
	orrs r3, r2
	ldr r0, _080D561C @ 0x7FF00000
	subs r3, r0, r3
	rsbs r0, r3, #0
	orrs r3, r0
	lsrs r3, r3, #0x1f
	movs r0, #1
	subs r0, r0, r3
	bx lr
	.align 2, 0
_080D5618: .4byte 0x7FFFFFFF
_080D561C: .4byte 0x7FF00000

	THUMB_FUNC_START sub_080D5620
sub_080D5620: @ 0x080D5620
	ldr r3, _080D5638 @ 0x7FFFFFFF
	ands r3, r0
	rsbs r2, r1, #0
	orrs r2, r1
	lsrs r2, r2, #0x1f
	orrs r3, r2
	ldr r0, _080D563C @ 0x7FF00000
	subs r3, r0, r3
	lsrs r3, r3, #0x1f
	adds r0, r3, #0
	bx lr
	.align 2, 0
_080D5638: .4byte 0x7FFFFFFF
_080D563C: .4byte 0x7FF00000

	THUMB_FUNC_START .gcc2_compiled._44
.gcc2_compiled._44: @ 0x080D5640
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r0, r1, #0
	ldr r4, _080D5668 @ 0x030067A8
	movs r1, #0
	str r1, [r4]
	bl _sbrk
	adds r1, r0, #0
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _080D5662
	ldr r0, [r4]
	cmp r0, #0
	beq _080D5662
	str r0, [r5]
_080D5662:
	adds r0, r1, #0
	pop {r4, r5, pc}
	.align 2, 0
_080D5668: .4byte 0x030067A8

	THUMB_FUNC_START .gcc2_compiled._33
.gcc2_compiled._33: @ 0x080D566C
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	adds r3, r2, #0
	ldr r0, [r5, #0x54]
	movs r2, #0xe
	ldrsh r1, [r5, r2]
	adds r2, r4, #0
	bl .gcc2_compiled._43
	adds r1, r0, #0
	cmp r1, #0
	blt _080D568E
	ldr r0, [r5, #0x50]
	adds r0, r0, r1
	str r0, [r5, #0x50]
	b _080D5696
_080D568E:
	ldr r0, _080D569C @ 0xFFFFEFFF
	ldrh r2, [r5, #0xc]
	ands r0, r2
	strh r0, [r5, #0xc]
_080D5696:
	adds r0, r1, #0
	pop {r4, r5, pc}
	.align 2, 0
_080D569C: .4byte 0xFFFFEFFF

	THUMB_FUNC_START __swrite
__swrite: @ 0x080D56A0
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	movs r0, #0x80
	lsls r0, r0, #1
	ldrh r1, [r4, #0xc]
	ands r0, r1
	cmp r0, #0
	beq _080D56C2
	ldr r0, [r4, #0x54]
	movs r2, #0xe
	ldrsh r1, [r4, r2]
	movs r2, #0
	movs r3, #2
	bl sub_080D5D04
_080D56C2:
	ldr r0, _080D56DC @ 0xFFFFEFFF
	ldrh r1, [r4, #0xc]
	ands r0, r1
	strh r0, [r4, #0xc]
	ldr r0, [r4, #0x54]
	movs r2, #0xe
	ldrsh r1, [r4, r2]
	adds r2, r5, #0
	adds r3, r6, #0
	bl sub_080D5BF0
	pop {r4, r5, r6, pc}
	.align 2, 0
_080D56DC: .4byte 0xFFFFEFFF

	THUMB_FUNC_START __sseek
__sseek: @ 0x080D56E0
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	adds r3, r2, #0
	ldr r0, [r5, #0x54]
	movs r2, #0xe
	ldrsh r1, [r5, r2]
	adds r2, r4, #0
	bl sub_080D5D04
	adds r1, r0, #0
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _080D570C
	ldr r0, _080D5708 @ 0xFFFFEFFF
	ldrh r2, [r5, #0xc]
	ands r0, r2
	strh r0, [r5, #0xc]
	b _080D571A
	.align 2, 0
_080D5708: .4byte 0xFFFFEFFF
_080D570C:
	movs r2, #0x80
	lsls r2, r2, #5
	adds r0, r2, #0
	ldrh r2, [r5, #0xc]
	orrs r0, r2
	strh r0, [r5, #0xc]
	str r1, [r5, #0x50]
_080D571A:
	adds r0, r1, #0
	pop {r4, r5, pc}
	.byte 0x00, 0x00

	THUMB_FUNC_START __sclose
__sclose: @ 0x080D5720
	push {lr}
	ldr r2, [r0, #0x54]
	movs r3, #0xe
	ldrsh r1, [r0, r3]
	adds r0, r2, #0
	bl sub_080D5C78
	pop {pc}

	THUMB_FUNC_START sub_080D5730
sub_080D5730: @ 0x080D5730
	push {r4, r5, lr}
	adds r2, r0, #0
	adds r3, r1, #0
	orrs r0, r3
	movs r1, #3
	ands r0, r1
	cmp r0, #0
	bne _080D5776
	ldr r1, [r2]
	ldr r0, [r3]
	cmp r1, r0
	bne _080D5776
	ldr r5, _080D575C @ 0xFEFEFEFF
	ldr r4, _080D5760 @ 0x80808080
_080D574C:
	ldr r1, [r2]
	adds r0, r1, r5
	bics r0, r1
	ands r0, r4
	cmp r0, #0
	beq _080D5764
	movs r0, #0
	b _080D5788
	.align 2, 0
_080D575C: .4byte 0xFEFEFEFF
_080D5760: .4byte 0x80808080
_080D5764:
	adds r2, #4
	adds r3, #4
	ldr r1, [r2]
	ldr r0, [r3]
	cmp r1, r0
	beq _080D574C
	b _080D5776
_080D5772:
	adds r2, #1
	adds r3, #1
_080D5776:
	ldrb r0, [r2]
	cmp r0, #0
	beq _080D5782
	ldrb r1, [r3]
	cmp r0, r1
	beq _080D5772
_080D5782:
	ldrb r2, [r2]
	ldrb r3, [r3]
	subs r0, r2, r3
_080D5788:
	pop {r4, r5, pc}
	.byte 0x00, 0x00

	THUMB_FUNC_START sub_080D578C
sub_080D578C: @ 0x080D578C
	adds r3, r0, #0
	movs r1, #0
	ldr r2, _080D5794 @ 0x03002B98
	b _080D57A0
	.align 2, 0
_080D5794: .4byte 0x03002B98
_080D5798:
	adds r2, #8
	adds r1, #1
	cmp r1, #0x13
	bgt _080D57A6
_080D57A0:
	ldr r0, [r2]
	cmp r0, r3
	bne _080D5798
_080D57A6:
	adds r0, r1, #0
	bx lr
	.byte 0x00, 0x00

	THUMB_FUNC_START remap_handle
remap_handle: @ 0x080D57AC
	adds r2, r0, #0
	ldr r0, _080D57C0 @ 0x08B1FA20
	ldr r1, [r0]
	ldr r0, [r1, #4]
	movs r3, #0xe
	ldrsh r0, [r0, r3]
	cmp r2, r0
	bne _080D57C8
	ldr r0, _080D57C4 @ 0x03002B8C
	b _080D57EE
	.align 2, 0
_080D57C0: .4byte 0x08B1FA20
_080D57C4: .4byte 0x03002B8C
_080D57C8:
	ldr r0, [r1, #8]
	movs r3, #0xe
	ldrsh r0, [r0, r3]
	cmp r2, r0
	bne _080D57DC
	ldr r0, _080D57D8 @ 0x03002B90
	b _080D57EE
	.align 2, 0
_080D57D8: .4byte 0x03002B90
_080D57DC:
	ldr r0, [r1, #0xc]
	movs r1, #0xe
	ldrsh r0, [r0, r1]
	cmp r2, r0
	beq _080D57EC
	adds r0, r2, #0
	subs r0, #0x20
	b _080D57F0
_080D57EC:
	ldr r0, _080D57F4 @ 0x03002B94
_080D57EE:
	ldr r0, [r0]
_080D57F0:
	bx lr
	.align 2, 0
_080D57F4: .4byte 0x03002B94

	THUMB_FUNC_START initialise_monitor_handles
initialise_monitor_handles: @ 0x080D57F8
	push {r4, r5, lr}
	sub sp, #0xc
	ldr r4, _080D5854 @ 0x085878F4
	str r4, [sp]
	movs r3, #3
	str r3, [sp, #8]
	movs r0, #0
	str r0, [sp, #4]
	movs r5, #1
	adds r0, r5, #0
	mov r1, sp
	svc #0xab
	adds r2, r0, #0
	ldr r5, _080D5858 @ 0x03002B8C
	str r2, [r5]
	str r4, [sp]
	str r3, [sp, #8]
	movs r0, #4
	str r0, [sp, #4]
	ldr r3, _080D585C @ 0x03002B90
	movs r4, #1
	adds r0, r4, #0
	mov r1, sp
	svc #0xab
	adds r2, r0, #0
	ldr r0, _080D5860 @ 0x03002B94
	str r2, [r0]
	str r2, [r3]
	ldr r2, _080D5864 @ 0x03002B98
	adds r1, r2, #0
	subs r4, #2
	adds r0, r2, #0
	adds r0, #0x98
_080D583A:
	str r4, [r0]
	subs r0, #8
	cmp r0, r1
	bge _080D583A
	movs r0, #0
	ldr r1, [r5]
	str r1, [r2]
	str r0, [r2, #4]
	ldr r1, [r3]
	str r1, [r2, #8]
	str r0, [r2, #0xc]
	add sp, #0xc
	pop {r4, r5, pc}
	.align 2, 0
_080D5854: .4byte 0x085878F4
_080D5858: .4byte 0x03002B8C
_080D585C: .4byte 0x03002B90
_080D5860: .4byte 0x03002B94
_080D5864: .4byte 0x03002B98

	THUMB_FUNC_START get_errno
get_errno: @ 0x080D5868
	push {r4, lr}
	movs r3, #0x13
	movs r4, #0
	adds r0, r3, #0
	adds r1, r4, #0
	svc #0xab
	adds r2, r0, #0
	adds r0, r2, #0
	pop {r4, pc}
	.byte 0x00, 0x00

	THUMB_FUNC_START error
error: @ 0x080D587C
	push {r4, r5, lr}
	adds r5, r0, #0
	bl sub_080D5CA4
	adds r4, r0, #0
	bl get_errno
	str r0, [r4]
	adds r0, r5, #0
	pop {r4, r5, pc}

	THUMB_FUNC_START wrap
wrap: @ 0x080D5890
	push {lr}
	adds r1, r0, #0
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _080D58A0
	adds r0, r1, #0
	b _080D58A6
_080D58A0:
	adds r0, r1, #0
	bl error
_080D58A6:
	pop {pc}

	THUMB_FUNC_START _swiread
_swiread: @ 0x080D58A8
	push {r4, r5, lr}
	sub sp, #0xc
	adds r4, r1, #0
	adds r5, r2, #0
	bl remap_handle
	str r0, [sp]
	str r4, [sp, #4]
	str r5, [sp, #8]
	movs r3, #6
	adds r0, r3, #0
	mov r1, sp
	svc #0xab
	adds r2, r0, #0
	adds r0, r2, #0
	add sp, #0xc
	pop {r4, r5, pc}
	.byte 0x00, 0x00

	THUMB_FUNC_START _read
_read: @ 0x080D58CC
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r7, r2, #0
	bl remap_handle
	bl sub_080D578C
	adds r6, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r7, #0
	bl _swiread
	cmp r0, #0
	bge _080D58F6
	movs r0, #1
	rsbs r0, r0, #0
	bl error
	b _080D590C
_080D58F6:
	subs r2, r7, r0
	cmp r6, #0x14
	beq _080D590A
	ldr r0, _080D5910 @ 0x03002B98
	lsls r1, r6, #3
	adds r0, #4
	adds r1, r1, r0
	ldr r0, [r1]
	adds r0, r0, r2
	str r0, [r1]
_080D590A:
	adds r0, r2, #0
_080D590C:
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_080D5910: .4byte 0x03002B98

	THUMB_FUNC_START _swilseek
_swilseek: @ 0x080D5914
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	mov r8, r0
	adds r5, r1, #0
	adds r4, r2, #0
	bl remap_handle
	adds r7, r0, #0
	bl sub_080D578C
	adds r6, r0, #0
	cmp r4, #1
	bne _080D594A
	cmp r6, #0x14
	bne _080D593C
	movs r0, #1
	rsbs r0, r0, #0
	b _080D598C
_080D593C:
	ldr r0, _080D5994 @ 0x03002B98
	lsls r1, r6, #3
	adds r0, #4
	adds r1, r1, r0
	ldr r0, [r1]
	adds r5, r5, r0
	movs r4, #0
_080D594A:
	cmp r4, #2
	bne _080D595C
	str r7, [sp]
	movs r3, #0xc
	adds r0, r3, #0
	mov r1, sp
	svc #0xab
	adds r2, r0, #0
	adds r5, r5, r2
_080D595C:
	mov r0, r8
	bl remap_handle
	str r0, [sp]
	str r5, [sp, #4]
	movs r3, #0xa
	adds r0, r3, #0
	mov r1, sp
	svc #0xab
	adds r2, r0, #0
	cmp r6, #0x14
	beq _080D5982
	cmp r2, #0
	bne _080D5982
	ldr r0, _080D5994 @ 0x03002B98
	lsls r1, r6, #3
	adds r0, #4
	adds r1, r1, r0
	str r5, [r1]
_080D5982:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r2, #0
	bne _080D598C
	adds r0, r5, #0
_080D598C:
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_080D5994: .4byte 0x03002B98

	THUMB_FUNC_START _lseek
_lseek: @ 0x080D5998
	push {lr}
	bl _swilseek
	bl wrap
	pop {pc}

	THUMB_FUNC_START _swiwrite
_swiwrite: @ 0x080D59A4
	push {r4, r5, lr}
	sub sp, #0xc
	adds r4, r1, #0
	adds r5, r2, #0
	bl remap_handle
	str r0, [sp]
	str r4, [sp, #4]
	str r5, [sp, #8]
	movs r3, #5
	adds r0, r3, #0
	mov r1, sp
	svc #0xab
	adds r2, r0, #0
	adds r0, r2, #0
	add sp, #0xc
	pop {r4, r5, pc}
	.byte 0x00, 0x00

	THUMB_FUNC_START _write
_write: @ 0x080D59C8
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	bl remap_handle
	bl sub_080D578C
	adds r7, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r6, #0
	bl _swiwrite
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	beq _080D59F0
	cmp r0, r6
	bne _080D59F8
_080D59F0:
	adds r0, r1, #0
	bl error
	b _080D5A0E
_080D59F8:
	subs r2, r6, r0
	cmp r7, #0x14
	beq _080D5A0C
	ldr r0, _080D5A10 @ 0x03002B98
	lsls r1, r7, #3
	adds r0, #4
	adds r1, r1, r0
	ldr r0, [r1]
	adds r0, r0, r2
	str r0, [r1]
_080D5A0C:
	adds r0, r2, #0
_080D5A0E:
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_080D5A10: .4byte 0x03002B98

	THUMB_FUNC_START _swiopen
_swiopen: @ 0x080D5A14
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0xc
	adds r7, r0, #0
	adds r4, r1, #0
	movs r5, #0
	movs r6, #1
	rsbs r6, r6, #0
	adds r0, r6, #0
	bl sub_080D578C
	mov r8, r0
	cmp r0, #0x14
	bne _080D5A36
	adds r0, r6, #0
	b _080D5AAA
_080D5A36:
	movs r0, #2
	ands r0, r4
	cmp r0, #0
	beq _080D5A40
	movs r5, #2
_080D5A40:
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r4
	cmp r0, #0
	beq _080D5A4E
	movs r0, #4
	orrs r5, r0
_080D5A4E:
	movs r0, #0x80
	lsls r0, r0, #3
	ands r0, r4
	cmp r0, #0
	beq _080D5A5C
	movs r0, #4
	orrs r5, r0
_080D5A5C:
	movs r1, #8
	ands r4, r1
	cmp r4, #0
	beq _080D5A6C
	movs r0, #5
	rsbs r0, r0, #0
	ands r5, r0
	orrs r5, r1
_080D5A6C:
	str r7, [sp]
	adds r0, r7, #0
	bl sub_080D1D88
	str r0, [sp, #8]
	str r5, [sp, #4]
	movs r2, #1
	adds r0, r2, #0
	mov r1, sp
	svc #0xab
	adds r3, r0, #0
	cmp r3, #0
	blt _080D5AA4
	ldr r0, _080D5AA0 @ 0x03002B98
	mov r1, r8
	lsls r2, r1, #3
	adds r1, r2, r0
	str r3, [r1]
	adds r0, #4
	adds r2, r2, r0
	movs r0, #0
	str r0, [r2]
	adds r0, r3, #0
	adds r0, #0x20
	b _080D5AAA
	.align 2, 0
_080D5AA0: .4byte 0x03002B98
_080D5AA4:
	adds r0, r3, #0
	bl error
_080D5AAA:
	add sp, #0xc
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7, pc}
	.byte 0x00, 0x00

	THUMB_FUNC_START _open
_open: @ 0x080D5AB4
	push {r1, r2, r3}
	push {lr}
	ldr r1, [sp, #4]
	bl _swiopen
	bl wrap
	pop {r3}
	add sp, #0xc
	bx r3

	THUMB_FUNC_START _swiclose
_swiclose: @ 0x080D5AC8
	push {lr}
	sub sp, #4
	bl remap_handle
	str r0, [sp]
	bl sub_080D578C
	adds r1, r0, #0
	cmp r1, #0x14
	beq _080D5AE8
	ldr r0, _080D5AF8 @ 0x03002B98
	lsls r1, r1, #3
	adds r1, r1, r0
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r1]
_080D5AE8:
	movs r3, #2
	adds r0, r3, #0
	mov r1, sp
	svc #0xab
	adds r2, r0, #0
	adds r0, r2, #0
	add sp, #4
	pop {pc}
	.align 2, 0
_080D5AF8: .4byte 0x03002B98

	THUMB_FUNC_START _close
_close: @ 0x080D5AFC
	push {lr}
	bl _swiclose
	bl wrap
	pop {pc}

	THUMB_FUNC_START _exit
_exit: @ 0x080D5B08
	mov ip, r3
	mov r3, r8
	push {r3}
	mov r3, ip
	movs r2, #0x18
	ldr r3, _080D5B24 @ 0x00020026
	adds r0, r2, #0
	adds r1, r3, #0
	svc #0xab
	mov r8, r0
	pop {r3}
	mov r8, r3
	bx lr
	.align 2, 0
_080D5B24: .4byte 0x00020026

	THUMB_FUNC_START _kill
_kill: @ 0x080D5B28
	mov ip, r3
	mov r3, r8
	push {r3}
	mov r3, ip
	movs r2, #0x18
	ldr r3, _080D5B44 @ 0x00020026
	adds r0, r2, #0
	adds r1, r3, #0
	svc #0xab
	mov r8, r0
	pop {r3}
	mov r8, r3
	bx lr
	.align 2, 0
_080D5B44: .4byte 0x00020026

	THUMB_FUNC_START _getpid
_getpid: @ 0x080D5B48
	movs r0, #1
	bx lr

	THUMB_FUNC_START _sbrk
_sbrk: @ 0x080D5B4C
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r4, _080D5B7C @ 0x03002B88
	ldr r0, [r4]
	cmp r0, #0
	bne _080D5B5C
	ldr r0, _080D5B80 @ 0x0203EFB8
	str r0, [r4]
_080D5B5C:
	ldr r5, [r4]
	adds r0, r5, r6
	cmp r0, sp
	bls _080D5B72
	ldr r1, _080D5B84 @ 0x085878F8
	movs r0, #1
	movs r2, #0x20
	bl _write
	bl sub_080D5CDC
_080D5B72:
	ldr r0, [r4]
	adds r0, r0, r6
	str r0, [r4]
	adds r0, r5, #0
	pop {r4, r5, r6, pc}
	.align 2, 0
_080D5B7C: .4byte 0x03002B88
_080D5B80: .4byte 0x0203EFB8
_080D5B84: .4byte 0x085878F8

	THUMB_FUNC_START _fstat
_fstat: @ 0x080D5B88
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [r1, #4]
	movs r0, #0
	bx lr
	.byte 0x00, 0x00

	THUMB_FUNC_START _unlink
_unlink: @ 0x080D5B94
	movs r0, #1
	rsbs r0, r0, #0
	bx lr
	.byte 0x00, 0x00

	THUMB_FUNC_START _raise
_raise: @ 0x080D5B9C
	bx lr
	.byte 0x00, 0x00

	THUMB_FUNC_START _gettimeofday
_gettimeofday: @ 0x080D5BA0
	push {r4, r5, lr}
	adds r2, r0, #0
	adds r3, r1, #0
	cmp r2, #0
	beq _080D5BBE
	movs r4, #0x11
	movs r5, #0
	adds r0, r4, #0
	adds r1, r5, #0
	svc #0xab
	adds r5, r0, #0
	adds r4, r5, #0
	str r4, [r2]
	movs r0, #0
	str r0, [r2, #4]
_080D5BBE:
	cmp r3, #0
	beq _080D5BC8
	movs r0, #0
	str r0, [r3]
	str r0, [r3, #4]
_080D5BC8:
	movs r0, #0
	pop {r4, r5, pc}

	THUMB_FUNC_START _times
_times: @ 0x080D5BCC
	push {r4, r5, lr}
	adds r2, r0, #0
	movs r4, #0x10
	movs r5, #0
	adds r0, r4, #0
	adds r1, r5, #0
	svc #0xab
	adds r3, r0, #0
	cmp r2, #0
	beq _080D5BEA
	str r3, [r2]
	movs r0, #0
	str r0, [r2, #4]
	str r0, [r2, #8]
	str r0, [r2, #0xc]
_080D5BEA:
	adds r0, r3, #0
	pop {r4, r5, pc}
	.byte 0x00, 0x00

	THUMB_FUNC_START sub_080D5BF0
sub_080D5BF0: @ 0x080D5BF0
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r0, r1, #0
	adds r1, r2, #0
	adds r2, r3, #0
	ldr r4, _080D5C1C @ 0x030067A8
	movs r3, #0
	str r3, [r4]
	bl _write
	adds r1, r0, #0
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _080D5C16
	ldr r0, [r4]
	cmp r0, #0
	beq _080D5C16
	str r0, [r5]
_080D5C16:
	adds r0, r1, #0
	pop {r4, r5, pc}
	.align 2, 0
_080D5C1C: .4byte 0x030067A8

	THUMB_FUNC_START sub_080D5C20
sub_080D5C20: @ 0x080D5C20
	push {r4, lr}
	muls r1, r2, r1
	bl _malloc_r
	adds r4, r0, #0
	cmp r4, #0
	bne _080D5C32
	movs r0, #0
	b _080D5C76
_080D5C32:
	adds r0, r4, #0
	subs r0, #8
	ldr r0, [r0, #4]
	movs r1, #4
	rsbs r1, r1, #0
	ands r0, r1
	subs r2, r0, #4
	cmp r2, #0x24
	bhi _080D5C6C
	adds r1, r4, #0
	cmp r2, #0x13
	bls _080D5C62
	movs r0, #0
	stm r1!, {r0}
	str r0, [r4, #4]
	adds r1, #4
	cmp r2, #0x1b
	bls _080D5C62
	stm r1!, {r0}
	stm r1!, {r0}
	cmp r2, #0x23
	bls _080D5C62
	stm r1!, {r0}
	stm r1!, {r0}
_080D5C62:
	movs r0, #0
	stm r1!, {r0}
	stm r1!, {r0}
	str r0, [r1]
	b _080D5C74
_080D5C6C:
	adds r0, r4, #0
	movs r1, #0
	bl .gcc2_compiled._10
_080D5C74:
	adds r0, r4, #0
_080D5C76:
	pop {r4, pc}

	THUMB_FUNC_START sub_080D5C78
sub_080D5C78: @ 0x080D5C78
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r0, r1, #0
	ldr r4, _080D5CA0 @ 0x030067A8
	movs r1, #0
	str r1, [r4]
	bl _close
	adds r1, r0, #0
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _080D5C9A
	ldr r0, [r4]
	cmp r0, #0
	beq _080D5C9A
	str r0, [r5]
_080D5C9A:
	adds r0, r1, #0
	pop {r4, r5, pc}
	.align 2, 0
_080D5CA0: .4byte 0x030067A8

	THUMB_FUNC_START sub_080D5CA4
sub_080D5CA4: @ 0x080D5CA4
	ldr r0, _080D5CAC @ 0x08B1FA20
	ldr r0, [r0]
	bx lr
	.align 2, 0
_080D5CAC: .4byte 0x08B1FA20

	THUMB_FUNC_START .gcc2_compiled._40
.gcc2_compiled._40: @ 0x080D5CB0
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r0, r1, #0
	adds r1, r2, #0
	ldr r4, _080D5CD8 @ 0x030067A8
	movs r2, #0
	str r2, [r4]
	bl _fstat
	adds r1, r0, #0
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _080D5CD4
	ldr r0, [r4]
	cmp r0, #0
	beq _080D5CD4
	str r0, [r5]
_080D5CD4:
	adds r0, r1, #0
	pop {r4, r5, pc}
	.align 2, 0
_080D5CD8: .4byte 0x030067A8

	THUMB_FUNC_START sub_080D5CDC
sub_080D5CDC: @ 0x080D5CDC
	mov ip, r3
	mov r3, r8
	push {r3}
	mov r3, ip
	movs r2, #0x18
	ldr r3, _080D5CF8 @ 0x00020022
	adds r0, r2, #0
	adds r1, r3, #0
	svc #0xab
	mov r8, r0
	pop {r3}
	mov r8, r3
	bx lr
	.align 2, 0
_080D5CF8: .4byte 0x00020022

	THUMB_FUNC_START isatty
isatty: @ 0x080D5CFC
	movs r0, #1
	bx lr

	THUMB_FUNC_START alarm
alarm: @ 0x080D5D00
	bx lr
	.byte 0x00, 0x00

	THUMB_FUNC_START sub_080D5D04
sub_080D5D04: @ 0x080D5D04
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r0, r1, #0
	adds r1, r2, #0
	adds r2, r3, #0
	ldr r4, _080D5D30 @ 0x030067A8
	movs r3, #0
	str r3, [r4]
	bl _lseek
	adds r1, r0, #0
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _080D5D2A
	ldr r0, [r4]
	cmp r0, #0
	beq _080D5D2A
	str r0, [r5]
_080D5D2A:
	adds r0, r1, #0
	pop {r4, r5, pc}
	.align 2, 0
_080D5D30: .4byte 0x030067A8

	THUMB_FUNC_START .gcc2_compiled._43
.gcc2_compiled._43: @ 0x080D5D34
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r0, r1, #0
	adds r1, r2, #0
	adds r2, r3, #0
	ldr r4, _080D5D60 @ 0x030067A8
	movs r3, #0
	str r3, [r4]
	bl _read
	adds r1, r0, #0
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _080D5D5A
	ldr r0, [r4]
	cmp r0, #0
	beq _080D5D5A
	str r0, [r5]
_080D5D5A:
	adds r0, r1, #0
	pop {r4, r5, pc}
	.align 2, 0
_080D5D60: .4byte 0x030067A8

	THUMB_FUNC_START sub_080D5D64
sub_080D5D64: @ 0x080D5D64
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r1, r0, #0
	ldr r4, [r1, #0xc]
	ldr r5, [r1, #0x10]
	ldr r7, [r1, #4]
	movs r6, #0
	movs r2, #0
	ldr r0, [r1]
	cmp r0, #1
	bhi _080D5D7C
	movs r2, #1
_080D5D7C:
	cmp r2, #0
	beq _080D5D9C
	ldr r6, _080D5D90 @ 0x000007FF
	ldr r2, _080D5D94 @ 0x00000000
	ldr r3, _080D5D98 @ 0x00080000
	adds r0, r4, #0
	adds r1, r5, #0
	orrs r1, r3
	b _080D5E54
	.align 2, 0
_080D5D90: .4byte 0x000007FF
_080D5D94: .4byte 0x00000000
_080D5D98: .4byte 0x00080000
_080D5D9C:
	movs r2, #0
	cmp r0, #4
	bne _080D5DA4
	movs r2, #1
_080D5DA4:
	cmp r2, #0
	bne _080D5DF0
	movs r2, #0
	cmp r0, #2
	bne _080D5DB0
	movs r2, #1
_080D5DB0:
	cmp r2, #0
	beq _080D5DBA
	movs r4, #0
	movs r5, #0
	b _080D5E58
_080D5DBA:
	adds r0, r5, #0
	orrs r0, r4
	cmp r0, #0
	beq _080D5E58
	ldr r2, [r1, #8]
	ldr r0, _080D5DD8 @ 0xFFFFFC02
	cmp r2, r0
	bge _080D5DEA
	subs r2, r0, r2
	cmp r2, #0x38
	ble _080D5DDC
	movs r4, #0
	movs r5, #0
	b _080D5E4A
	.align 2, 0
_080D5DD8: .4byte 0xFFFFFC02
_080D5DDC:
	adds r1, r5, #0
	adds r0, r4, #0
	bl .gcc2_compiled._49
	adds r5, r1, #0
	adds r4, r0, #0
	b _080D5E4A
_080D5DEA:
	ldr r0, _080D5DF8 @ 0x000003FF
	cmp r2, r0
	ble _080D5E00
_080D5DF0:
	ldr r6, _080D5DFC @ 0x000007FF
	movs r4, #0
	movs r5, #0
	b _080D5E58
	.align 2, 0
_080D5DF8: .4byte 0x000003FF
_080D5DFC: .4byte 0x000007FF
_080D5E00:
	ldr r0, _080D5E28 @ 0x000003FF
	adds r6, r2, r0
	movs r0, #0xff
	adds r1, r4, #0
	ands r1, r0
	movs r2, #0
	cmp r1, #0x80
	bne _080D5E2C
	cmp r2, #0
	bne _080D5E2C
	adds r0, #1
	adds r1, r4, #0
	ands r1, r0
	adds r0, r2, #0
	orrs r0, r1
	cmp r0, #0
	beq _080D5E34
	movs r0, #0x80
	movs r1, #0
	b _080D5E30
	.align 2, 0
_080D5E28: .4byte 0x000003FF
_080D5E2C:
	movs r0, #0x7f
	movs r1, #0
_080D5E30:
	adds r4, r4, r0
	adcs r5, r1
_080D5E34:
	ldr r0, _080D5E98 @ 0x1FFFFFFF
	cmp r5, r0
	bls _080D5E4A
	lsls r3, r5, #0x1f
	lsrs r2, r4, #1
	adds r0, r3, #0
	orrs r0, r2
	lsrs r1, r5, #1
	adds r5, r1, #0
	adds r4, r0, #0
	adds r6, #1
_080D5E4A:
	lsls r3, r5, #0x18
	lsrs r2, r4, #8
	adds r0, r3, #0
	orrs r0, r2
	lsrs r1, r5, #8
_080D5E54:
	adds r5, r1, #0
	adds r4, r0, #0
_080D5E58:
	str r4, [sp]
	ldr r2, _080D5E9C @ 0x000FFFFF
	ands r2, r5
	ldr r0, [sp, #4]
	ldr r1, _080D5EA0 @ 0xFFF00000
	ands r0, r1
	orrs r0, r2
	str r0, [sp, #4]
	mov r2, sp
	ldr r1, _080D5EA4 @ 0x000007FF
	adds r0, r1, #0
	ands r6, r0
	lsls r1, r6, #4
	ldr r0, _080D5EA8 @ 0xFFFF800F
	ldrh r3, [r2, #6]
	ands r0, r3
	orrs r0, r1
	strh r0, [r2, #6]
	lsls r1, r7, #7
	movs r0, #0x7f
	ldrb r3, [r2, #7]
	ands r0, r3
	orrs r0, r1
	strb r0, [r2, #7]
	ldr r1, [sp]
	ldr r0, [sp, #4]
	str r0, [sp]
	str r1, [sp, #4]
	ldr r0, [sp]
	ldr r1, [sp, #4]
	add sp, #8
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_080D5E98: .4byte 0x1FFFFFFF
_080D5E9C: .4byte 0x000FFFFF
_080D5EA0: .4byte 0xFFF00000
_080D5EA4: .4byte 0x000007FF
_080D5EA8: .4byte 0xFFFF800F

	THUMB_FUNC_START __unpack_d
__unpack_d: @ 0x080D5EAC
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r2, r0, #0
	adds r6, r1, #0
	ldr r1, [r2, #4]
	str r1, [sp]
	ldr r0, [r2]
	str r0, [sp, #4]
	mov r2, sp
	adds r4, r1, #0
	lsls r0, r0, #0xc
	lsrs r5, r0, #0xc
	ldrh r3, [r2, #6]
	lsls r0, r3, #0x11
	lsrs r3, r0, #0x15
	ldrb r2, [r2, #7]
	lsrs r0, r2, #7
	str r0, [r6, #4]
	cmp r3, #0
	bne _080D5F20
	orrs r1, r5
	cmp r1, #0
	bne _080D5EE0
	movs r0, #2
	str r0, [r6]
	b _080D5F74
_080D5EE0:
	ldr r0, _080D5F18 @ 0xFFFFFC02
	str r0, [r6, #8]
	lsrs r3, r4, #0x18
	lsls r2, r5, #8
	adds r1, r3, #0
	orrs r1, r2
	lsls r0, r4, #8
	adds r5, r1, #0
	adds r4, r0, #0
	movs r0, #3
	str r0, [r6]
	ldr r0, _080D5F1C @ 0x0FFFFFFF
	cmp r5, r0
	bhi _080D5F50
	adds r7, r0, #0
_080D5EFE:
	lsrs r3, r4, #0x1f
	lsls r2, r5, #1
	adds r1, r3, #0
	orrs r1, r2
	lsls r0, r4, #1
	adds r5, r1, #0
	adds r4, r0, #0
	ldr r0, [r6, #8]
	subs r0, #1
	str r0, [r6, #8]
	cmp r5, r7
	bls _080D5EFE
	b _080D5F50
	.align 2, 0
_080D5F18: .4byte 0xFFFFFC02
_080D5F1C: .4byte 0x0FFFFFFF
_080D5F20:
	ldr r0, _080D5F34 @ 0x000007FF
	cmp r3, r0
	bne _080D5F56
	orrs r1, r5
	cmp r1, #0
	bne _080D5F38
	movs r0, #4
	str r0, [r6]
	b _080D5F74
	.align 2, 0
_080D5F34: .4byte 0x000007FF
_080D5F38:
	movs r2, #0x80
	lsls r2, r2, #0xc
	movs r0, #0
	adds r1, r5, #0
	ands r1, r2
	orrs r1, r0
	cmp r1, #0
	beq _080D5F4E
	movs r0, #1
	str r0, [r6]
	b _080D5F50
_080D5F4E:
	str r1, [r6]
_080D5F50:
	str r4, [r6, #0xc]
	str r5, [r6, #0x10]
	b _080D5F74
_080D5F56:
	ldr r1, _080D5F78 @ 0xFFFFFC01
	adds r0, r3, r1
	str r0, [r6, #8]
	movs r0, #3
	str r0, [r6]
	lsrs r3, r4, #0x18
	lsls r2, r5, #8
	adds r1, r3, #0
	orrs r1, r2
	lsls r0, r4, #8
	ldr r2, _080D5F7C @ 0x00000000
	ldr r3, _080D5F80 @ 0x10000000
	orrs r1, r3
	str r0, [r6, #0xc]
	str r1, [r6, #0x10]
_080D5F74:
	add sp, #8
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_080D5F78: .4byte 0xFFFFFC01
_080D5F7C: .4byte 0x00000000
_080D5F80: .4byte 0x10000000

	THUMB_FUNC_START _fpadd_parts
_fpadd_parts: @ 0x080D5F84
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	adds r3, r0, #0
	adds r4, r1, #0
	mov sl, r2
	movs r0, #0
	ldr r2, [r3]
	cmp r2, #1
	bhi _080D5FA0
	movs r0, #1
_080D5FA0:
	cmp r0, #0
	beq _080D5FA8
_080D5FA4:
	adds r0, r3, #0
	b _080D61E0
_080D5FA8:
	movs r1, #0
	ldr r0, [r4]
	cmp r0, #1
	bhi _080D5FB2
	movs r1, #1
_080D5FB2:
	cmp r1, #0
	bne _080D602A
	movs r1, #0
	cmp r2, #4
	bne _080D5FBE
	movs r1, #1
_080D5FBE:
	cmp r1, #0
	beq _080D5FE0
	movs r1, #0
	cmp r0, #4
	bne _080D5FCA
	movs r1, #1
_080D5FCA:
	cmp r1, #0
	beq _080D5FA4
	ldr r1, [r3, #4]
	ldr r0, [r4, #4]
	cmp r1, r0
	beq _080D5FA4
	ldr r0, _080D5FDC @ 0x03002C38
	b _080D61E0
	.align 2, 0
_080D5FDC: .4byte 0x03002C38
_080D5FE0:
	movs r1, #0
	cmp r0, #4
	bne _080D5FE8
	movs r1, #1
_080D5FE8:
	cmp r1, #0
	bne _080D602A
	movs r1, #0
	cmp r0, #2
	bne _080D5FF4
	movs r1, #1
_080D5FF4:
	cmp r1, #0
	beq _080D601C
	movs r0, #0
	cmp r2, #2
	bne _080D6000
	movs r0, #1
_080D6000:
	cmp r0, #0
	beq _080D5FA4
	mov r1, sl
	adds r0, r3, #0
	ldm r0!, {r2, r5, r6}
	stm r1!, {r2, r5, r6}
	ldm r0!, {r2, r5}
	stm r1!, {r2, r5}
	ldr r0, [r3, #4]
	ldr r1, [r4, #4]
	ands r0, r1
	mov r6, sl
	str r0, [r6, #4]
	b _080D61DE
_080D601C:
	movs r1, #0
	ldr r0, [r3]
	cmp r0, #2
	bne _080D6026
	movs r1, #1
_080D6026:
	cmp r1, #0
	beq _080D602E
_080D602A:
	adds r0, r4, #0
	b _080D61E0
_080D602E:
	ldr r0, [r3, #8]
	mov sb, r0
	ldr r1, [r4, #8]
	mov r8, r1
	ldr r6, [r3, #0xc]
	ldr r7, [r3, #0x10]
	ldr r0, [r4, #0xc]
	ldr r1, [r4, #0x10]
	str r0, [sp]
	str r1, [sp, #4]
	mov r1, sb
	mov r2, r8
	subs r0, r1, r2
	cmp r0, #0
	bge _080D604E
	rsbs r0, r0, #0
_080D604E:
	cmp r0, #0x3f
	bgt _080D60CC
	ldr r3, [r3, #4]
	mov ip, r3
	ldr r4, [r4, #4]
	str r4, [sp, #8]
	cmp sb, r8
	ble _080D6098
	mov r3, sb
	mov r4, r8
	subs r3, r3, r4
	mov r8, r3
_080D6066:
	movs r5, #1
	rsbs r5, r5, #0
	add r8, r5
	ldr r2, [sp]
	movs r0, #1
	ands r2, r0
	movs r3, #0
	ldr r1, [sp, #4]
	lsls r5, r1, #0x1f
	ldr r0, [sp]
	lsrs r4, r0, #1
	adds r0, r5, #0
	orrs r0, r4
	adds r4, r1, #0
	lsrs r1, r4, #1
	adds r5, r2, #0
	orrs r5, r0
	str r5, [sp]
	adds r4, r3, #0
	orrs r4, r1
	str r4, [sp, #4]
	mov r5, r8
	cmp r5, #0
	bne _080D6066
	mov r8, sb
_080D6098:
	cmp r8, sb
	ble _080D60E8
	mov r0, r8
	mov r1, sb
	subs r0, r0, r1
	mov sb, r0
_080D60A4:
	movs r2, #1
	rsbs r2, r2, #0
	add sb, r2
	movs r2, #1
	ands r2, r6
	movs r3, #0
	lsls r5, r7, #0x1f
	lsrs r4, r6, #1
	adds r0, r5, #0
	orrs r0, r4
	lsrs r1, r7, #1
	adds r6, r2, #0
	orrs r6, r0
	adds r7, r3, #0
	orrs r7, r1
	mov r3, sb
	cmp r3, #0
	bne _080D60A4
	mov sb, r8
	b _080D60E8
_080D60CC:
	cmp sb, r8
	ble _080D60DA
	movs r0, #0
	movs r1, #0
	str r0, [sp]
	str r1, [sp, #4]
	b _080D60E0
_080D60DA:
	mov sb, r8
	movs r6, #0
	movs r7, #0
_080D60E0:
	ldr r3, [r3, #4]
	mov ip, r3
	ldr r4, [r4, #4]
	str r4, [sp, #8]
_080D60E8:
	ldr r1, [sp, #8]
	cmp ip, r1
	beq _080D6190
	mov r2, ip
	cmp r2, #0
	beq _080D610A
	adds r1, r7, #0
	adds r0, r6, #0
	bl sub_080D7480
	adds r3, r1, #0
	adds r2, r0, #0
	ldr r4, [sp]
	ldr r5, [sp, #4]
	adds r2, r2, r4
	adcs r3, r5
	b _080D6116
_080D610A:
	adds r3, r7, #0
	adds r2, r6, #0
	ldr r0, [sp]
	ldr r1, [sp, #4]
	subs r2, r2, r0
	sbcs r3, r1
_080D6116:
	cmp r3, #0
	blt _080D612C
	movs r0, #0
	mov r1, sl
	str r0, [r1, #4]
	mov r4, sb
	str r4, [r1, #8]
	mov r5, sl
	str r2, [r5, #0xc]
	str r3, [r5, #0x10]
	b _080D6144
_080D612C:
	movs r0, #1
	mov r6, sl
	str r0, [r6, #4]
	mov r0, sb
	str r0, [r6, #8]
	adds r1, r3, #0
	adds r0, r2, #0
	bl sub_080D7480
	mov r2, sl
	str r0, [r2, #0xc]
	str r1, [r2, #0x10]
_080D6144:
	mov r4, sl
	ldr r2, [r4, #0xc]
	ldr r3, [r4, #0x10]
	movs r0, #1
	rsbs r0, r0, #0
	asrs r1, r0, #0x1f
_080D6150:
	adds r2, r2, r0
	adcs r3, r1
	ldr r0, _080D618C @ 0x0FFFFFFF
	cmp r3, r0
	bhi _080D61A8
	cmp r3, r0
	bne _080D6166
	movs r0, #2
	rsbs r0, r0, #0
	cmp r2, r0
	bhi _080D61A8
_080D6166:
	mov r5, sl
	ldr r0, [r5, #0xc]
	ldr r1, [r5, #0x10]
	lsrs r3, r0, #0x1f
	lsls r2, r1, #1
	adds r1, r3, #0
	orrs r1, r2
	lsls r0, r0, #1
	mov r6, sl
	str r0, [r6, #0xc]
	str r1, [r6, #0x10]
	ldr r2, [r6, #8]
	subs r2, #1
	str r2, [r6, #8]
	movs r2, #1
	rsbs r2, r2, #0
	asrs r3, r2, #0x1f
	b _080D6150
	.align 2, 0
_080D618C: .4byte 0x0FFFFFFF
_080D6190:
	mov r0, ip
	mov r1, sl
	str r0, [r1, #4]
	mov r2, sb
	str r2, [r1, #8]
	ldr r3, [sp]
	ldr r4, [sp, #4]
	adds r6, r6, r3
	adcs r7, r4
	mov r4, sl
	str r6, [r4, #0xc]
	str r7, [r4, #0x10]
_080D61A8:
	movs r0, #3
	mov r5, sl
	str r0, [r5]
	ldr r1, [r5, #0x10]
	ldr r0, _080D61EC @ 0x1FFFFFFF
	cmp r1, r0
	bls _080D61DE
	ldr r4, [r5, #0xc]
	ldr r5, [r5, #0x10]
	movs r2, #1
	adds r0, r4, #0
	ands r0, r2
	movs r1, #0
	lsls r6, r5, #0x1f
	mov r8, r6
	lsrs r6, r4, #1
	mov r2, r8
	orrs r2, r6
	lsrs r3, r5, #1
	orrs r0, r2
	orrs r1, r3
	mov r2, sl
	str r0, [r2, #0xc]
	str r1, [r2, #0x10]
	ldr r0, [r2, #8]
	adds r0, #1
	str r0, [r2, #8]
_080D61DE:
	mov r0, sl
_080D61E0:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_080D61EC: .4byte 0x1FFFFFFF

	THUMB_FUNC_START __adddf3
__adddf3: @ 0x080D61F0
	push {r4, lr}
	sub sp, #0x4c
	str r0, [sp, #0x3c]
	str r1, [sp, #0x40]
	str r2, [sp, #0x44]
	str r3, [sp, #0x48]
	add r0, sp, #0x3c
	mov r1, sp
	bl __unpack_d
	add r0, sp, #0x44
	add r4, sp, #0x14
	adds r1, r4, #0
	bl __unpack_d
	add r2, sp, #0x28
	mov r0, sp
	adds r1, r4, #0
	bl _fpadd_parts
	bl sub_080D5D64
	add sp, #0x4c
	pop {r4, pc}

	THUMB_FUNC_START __subdf3
__subdf3: @ 0x080D6220
	push {r4, lr}
	sub sp, #0x4c
	str r0, [sp, #0x3c]
	str r1, [sp, #0x40]
	str r2, [sp, #0x44]
	str r3, [sp, #0x48]
	add r0, sp, #0x3c
	mov r1, sp
	bl __unpack_d
	add r0, sp, #0x44
	add r4, sp, #0x14
	adds r1, r4, #0
	bl __unpack_d
	ldr r0, [r4, #4]
	movs r1, #1
	eors r0, r1
	str r0, [r4, #4]
	add r2, sp, #0x28
	mov r0, sp
	adds r1, r4, #0
	bl _fpadd_parts
	bl sub_080D5D64
	add sp, #0x4c
	pop {r4, pc}

	THUMB_FUNC_START __muldf3
__muldf3: @ 0x080D6258
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x74
	str r0, [sp, #0x3c]
	str r1, [sp, #0x40]
	str r2, [sp, #0x44]
	str r3, [sp, #0x48]
	add r0, sp, #0x3c
	mov r1, sp
	bl __unpack_d
	add r0, sp, #0x44
	add r4, sp, #0x14
	adds r1, r4, #0
	bl __unpack_d
	mov r8, sp
	add r0, sp, #0x28
	mov sl, r0
	movs r0, #0
	ldr r1, [sp]
	cmp r1, #1
	bhi _080D628E
	movs r0, #1
_080D628E:
	cmp r0, #0
	bne _080D62F2
	movs r2, #0
	ldr r0, [sp, #0x14]
	cmp r0, #1
	bhi _080D629C
	movs r2, #1
_080D629C:
	cmp r2, #0
	beq _080D62A4
	ldr r0, [sp, #4]
	b _080D6314
_080D62A4:
	movs r2, #0
	cmp r1, #4
	bne _080D62AC
	movs r2, #1
_080D62AC:
	cmp r2, #0
	beq _080D62BE
	movs r1, #0
	cmp r0, #2
	bne _080D62B8
	movs r1, #1
_080D62B8:
	cmp r1, #0
	bne _080D62D6
	b _080D62F2
_080D62BE:
	movs r2, #0
	cmp r0, #4
	bne _080D62C6
	movs r2, #1
_080D62C6:
	cmp r2, #0
	beq _080D62E6
	movs r0, #0
	cmp r1, #2
	bne _080D62D2
	movs r0, #1
_080D62D2:
	cmp r0, #0
	beq _080D62E0
_080D62D6:
	ldr r0, _080D62DC @ 0x03002C38
	b _080D64DE
	.align 2, 0
_080D62DC: .4byte 0x03002C38
_080D62E0:
	mov r1, r8
	ldr r0, [r1, #4]
	b _080D6314
_080D62E6:
	movs r2, #0
	cmp r1, #2
	bne _080D62EE
	movs r2, #1
_080D62EE:
	cmp r2, #0
	beq _080D6304
_080D62F2:
	ldr r0, [sp, #4]
	ldr r1, [sp, #0x18]
	eors r0, r1
	rsbs r1, r0, #0
	orrs r1, r0
	lsrs r1, r1, #0x1f
	str r1, [sp, #4]
	mov r0, sp
	b _080D64DE
_080D6304:
	movs r1, #0
	cmp r0, #2
	bne _080D630C
	movs r1, #1
_080D630C:
	cmp r1, #0
	beq _080D6324
	mov r2, r8
	ldr r0, [r2, #4]
_080D6314:
	ldr r1, [sp, #0x18]
	eors r0, r1
	rsbs r1, r0, #0
	orrs r1, r0
	lsrs r1, r1, #0x1f
	str r1, [sp, #0x18]
	adds r0, r4, #0
	b _080D64DE
_080D6324:
	mov r4, r8
	ldr r0, [r4, #0xc]
	ldr r1, [r4, #0x10]
	adds r6, r0, #0
	movs r7, #0
	str r1, [sp, #0x4c]
	movs r5, #0
	str r5, [sp, #0x50]
	ldr r0, [sp, #0x20]
	ldr r1, [sp, #0x24]
	adds r4, r0, #0
	str r1, [sp, #0x54]
	movs r0, #0
	str r0, [sp, #0x58]
	adds r1, r5, #0
	adds r0, r4, #0
	adds r3, r7, #0
	adds r2, r6, #0
	bl .gcc2_compiled._46
	str r0, [sp, #0x5c]
	str r1, [sp, #0x60]
	ldr r0, [sp, #0x54]
	ldr r1, [sp, #0x58]
	adds r3, r7, #0
	adds r2, r6, #0
	bl .gcc2_compiled._46
	adds r7, r1, #0
	adds r6, r0, #0
	adds r1, r5, #0
	adds r0, r4, #0
	ldr r2, [sp, #0x4c]
	ldr r3, [sp, #0x50]
	bl .gcc2_compiled._46
	adds r5, r1, #0
	adds r4, r0, #0
	ldr r0, [sp, #0x54]
	ldr r1, [sp, #0x58]
	ldr r2, [sp, #0x4c]
	ldr r3, [sp, #0x50]
	bl .gcc2_compiled._46
	str r0, [sp, #0x64]
	str r1, [sp, #0x68]
	movs r1, #0
	movs r2, #0
	str r1, [sp, #0x6c]
	str r2, [sp, #0x70]
	adds r3, r7, #0
	adds r2, r6, #0
	adds r2, r2, r4
	adcs r3, r5
	cmp r7, r3
	bhi _080D639C
	cmp r7, r3
	bne _080D63A4
	cmp r6, r2
	bls _080D63A4
_080D639C:
	ldr r5, _080D64F4 @ 0x00000001
	ldr r4, _080D64F0 @ 0x00000000
	str r4, [sp, #0x6c]
	str r5, [sp, #0x70]
_080D63A4:
	adds r1, r2, #0
	movs r6, #0
	adds r7, r1, #0
	ldr r0, [sp, #0x5c]
	ldr r1, [sp, #0x60]
	adds r6, r6, r0
	adcs r7, r1
	cmp r1, r7
	bhi _080D63C0
	ldr r1, [sp, #0x60]
	cmp r1, r7
	bne _080D63D0
	cmp r0, r6
	bls _080D63D0
_080D63C0:
	movs r0, #1
	movs r1, #0
	ldr r4, [sp, #0x6c]
	ldr r5, [sp, #0x70]
	adds r4, r4, r0
	adcs r5, r1
	str r4, [sp, #0x6c]
	str r5, [sp, #0x70]
_080D63D0:
	adds r0, r3, #0
	adds r2, r0, #0
	movs r3, #0
	adds r5, r3, #0
	adds r4, r2, #0
	ldr r0, [sp, #0x64]
	ldr r1, [sp, #0x68]
	adds r4, r4, r0
	adcs r5, r1
	ldr r1, [sp, #0x6c]
	ldr r2, [sp, #0x70]
	adds r4, r4, r1
	adcs r5, r2
	mov r0, r8
	ldr r2, [r0, #8]
	ldr r0, [sp, #0x1c]
	adds r2, r2, r0
	str r2, [sp, #0x30]
	mov r0, r8
	ldr r1, [r0, #4]
	ldr r0, [sp, #0x18]
	eors r1, r0
	rsbs r0, r1, #0
	orrs r0, r1
	lsrs r0, r0, #0x1f
	str r0, [sp, #0x2c]
	adds r2, #4
	str r2, [sp, #0x30]
	ldr r0, _080D64F8 @ 0x1FFFFFFF
	cmp r5, r0
	bls _080D6452
	movs r1, #1
	mov sb, r1
	mov r8, r0
	mov ip, r2
_080D6416:
	movs r2, #1
	add ip, r2
	mov r0, sb
	ands r0, r4
	cmp r0, #0
	beq _080D643C
	lsls r3, r7, #0x1f
	lsrs r2, r6, #1
	adds r0, r3, #0
	orrs r0, r2
	lsrs r1, r7, #1
	adds r7, r1, #0
	adds r6, r0, #0
	adds r0, r6, #0
	movs r1, #0x80
	lsls r1, r1, #0x18
	orrs r1, r7
	adds r7, r1, #0
	adds r6, r0, #0
_080D643C:
	lsls r3, r5, #0x1f
	lsrs r2, r4, #1
	adds r0, r3, #0
	orrs r0, r2
	lsrs r1, r5, #1
	adds r5, r1, #0
	adds r4, r0, #0
	cmp r5, r8
	bhi _080D6416
	mov r0, ip
	str r0, [sp, #0x30]
_080D6452:
	ldr r0, _080D64FC @ 0x0FFFFFFF
	cmp r5, r0
	bhi _080D64A4
	movs r1, #0x80
	lsls r1, r1, #0x18
	mov sb, r1
	mov r8, r0
	ldr r2, [sp, #0x30]
	mov ip, r2
_080D6464:
	movs r0, #1
	rsbs r0, r0, #0
	add ip, r0
	lsrs r3, r4, #0x1f
	lsls r2, r5, #1
	adds r1, r3, #0
	orrs r1, r2
	lsls r0, r4, #1
	adds r5, r1, #0
	adds r4, r0, #0
	movs r0, #0
	mov r1, sb
	ands r1, r7
	orrs r0, r1
	cmp r0, #0
	beq _080D648E
	movs r0, #1
	orrs r0, r4
	adds r1, r5, #0
	adds r5, r1, #0
	adds r4, r0, #0
_080D648E:
	lsrs r3, r6, #0x1f
	lsls r2, r7, #1
	adds r1, r3, #0
	orrs r1, r2
	lsls r0, r6, #1
	adds r7, r1, #0
	adds r6, r0, #0
	cmp r5, r8
	bls _080D6464
	mov r1, ip
	str r1, [sp, #0x30]
_080D64A4:
	movs r0, #0xff
	adds r1, r4, #0
	ands r1, r0
	movs r2, #0
	cmp r1, #0x80
	bne _080D64D2
	cmp r2, #0
	bne _080D64D2
	adds r0, #1
	adds r1, r4, #0
	ands r1, r0
	adds r0, r2, #0
	orrs r0, r1
	cmp r0, #0
	bne _080D64CA
	adds r0, r7, #0
	orrs r0, r6
	cmp r0, #0
	beq _080D64D2
_080D64CA:
	movs r0, #0x80
	movs r1, #0
	adds r4, r4, r0
	adcs r5, r1
_080D64D2:
	str r4, [sp, #0x34]
	str r5, [sp, #0x38]
	movs r0, #3
	mov r2, sl
	str r0, [r2]
	add r0, sp, #0x28
_080D64DE:
	bl sub_080D5D64
	add sp, #0x74
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_080D64F0: .4byte 0x00000000
_080D64F4: .4byte 0x00000001
_080D64F8: .4byte 0x1FFFFFFF
_080D64FC: .4byte 0x0FFFFFFF

	THUMB_FUNC_START __divdf3
__divdf3: @ 0x080D6500
	push {r4, r5, r6, r7, lr}
	sub sp, #0x48
	str r0, [sp, #0x28]
	str r1, [sp, #0x2c]
	str r2, [sp, #0x30]
	str r3, [sp, #0x34]
	add r0, sp, #0x28
	mov r1, sp
	bl __unpack_d
	add r0, sp, #0x30
	add r4, sp, #0x14
	adds r1, r4, #0
	bl __unpack_d
	mov ip, sp
	movs r0, #0
	ldr r3, [sp]
	cmp r3, #1
	bhi _080D652A
	movs r0, #1
_080D652A:
	cmp r0, #0
	beq _080D6532
	mov r1, sp
	b _080D6674
_080D6532:
	movs r0, #0
	ldr r2, [sp, #0x14]
	adds r5, r2, #0
	cmp r2, #1
	bhi _080D653E
	movs r0, #1
_080D653E:
	cmp r0, #0
	beq _080D6546
	adds r1, r4, #0
	b _080D6674
_080D6546:
	ldr r0, [sp, #4]
	ldr r1, [sp, #0x18]
	eors r0, r1
	str r0, [sp, #4]
	movs r0, #0
	cmp r3, #4
	bne _080D6556
	movs r0, #1
_080D6556:
	cmp r0, #0
	bne _080D6566
	movs r4, #0
	cmp r3, #2
	bne _080D6562
	movs r4, #1
_080D6562:
	cmp r4, #0
	beq _080D6578
_080D6566:
	mov r1, ip
	ldr r0, [r1]
	cmp r0, r5
	beq _080D6570
	b _080D6674
_080D6570:
	ldr r1, _080D6574 @ 0x03002C38
	b _080D6674
	.align 2, 0
_080D6574: .4byte 0x03002C38
_080D6578:
	movs r0, #0
	cmp r2, #4
	bne _080D6580
	movs r0, #1
_080D6580:
	cmp r0, #0
	beq _080D6592
	movs r0, #0
	movs r1, #0
	str r0, [sp, #0xc]
	str r1, [sp, #0x10]
	str r4, [sp, #8]
	mov r1, sp
	b _080D6674
_080D6592:
	movs r0, #0
	cmp r2, #2
	bne _080D659A
	movs r0, #1
_080D659A:
	cmp r0, #0
	beq _080D65A6
	movs r0, #4
	mov r2, ip
	str r0, [r2]
	b _080D6672
_080D65A6:
	mov r3, ip
	ldr r1, [r3, #8]
	ldr r0, [sp, #0x1c]
	subs r6, r1, r0
	str r6, [r3, #8]
	ldr r4, [r3, #0xc]
	ldr r5, [r3, #0x10]
	ldr r0, [sp, #0x20]
	ldr r1, [sp, #0x24]
	str r0, [sp, #0x38]
	str r1, [sp, #0x3c]
	cmp r1, r5
	bhi _080D65CA
	ldr r1, [sp, #0x3c]
	cmp r1, r5
	bne _080D65DE
	cmp r0, r4
	bls _080D65DE
_080D65CA:
	lsrs r3, r4, #0x1f
	lsls r2, r5, #1
	adds r1, r3, #0
	orrs r1, r2
	lsls r0, r4, #1
	adds r5, r1, #0
	adds r4, r0, #0
	subs r0, r6, #1
	mov r2, ip
	str r0, [r2, #8]
_080D65DE:
	ldr r7, _080D6684 @ 0x10000000
	ldr r6, _080D6680 @ 0x00000000
	movs r0, #0
	movs r1, #0
	str r0, [sp, #0x40]
	str r1, [sp, #0x44]
_080D65EA:
	ldr r1, [sp, #0x3c]
	cmp r1, r5
	bhi _080D660E
	cmp r1, r5
	bne _080D65FA
	ldr r2, [sp, #0x38]
	cmp r2, r4
	bhi _080D660E
_080D65FA:
	ldr r0, [sp, #0x40]
	orrs r0, r6
	ldr r1, [sp, #0x44]
	orrs r1, r7
	str r0, [sp, #0x40]
	str r1, [sp, #0x44]
	ldr r0, [sp, #0x38]
	ldr r1, [sp, #0x3c]
	subs r4, r4, r0
	sbcs r5, r1
_080D660E:
	lsls r3, r7, #0x1f
	lsrs r2, r6, #1
	adds r0, r3, #0
	orrs r0, r2
	lsrs r1, r7, #1
	adds r7, r1, #0
	adds r6, r0, #0
	lsrs r3, r4, #0x1f
	lsls r2, r5, #1
	adds r1, r3, #0
	orrs r1, r2
	lsls r0, r4, #1
	adds r5, r1, #0
	adds r4, r0, #0
	adds r0, r7, #0
	orrs r0, r6
	cmp r0, #0
	bne _080D65EA
	movs r0, #0xff
	ldr r1, [sp, #0x40]
	ands r1, r0
	movs r2, #0
	cmp r1, #0x80
	bne _080D6668
	cmp r2, #0
	bne _080D6668
	adds r0, #1
	ldr r1, [sp, #0x40]
	ands r1, r0
	adds r0, r2, #0
	orrs r0, r1
	cmp r0, #0
	bne _080D6658
	adds r0, r5, #0
	orrs r0, r4
	cmp r0, #0
	beq _080D6668
_080D6658:
	movs r0, #0x80
	movs r1, #0
	ldr r2, [sp, #0x40]
	ldr r3, [sp, #0x44]
	adds r2, r2, r0
	adcs r3, r1
	str r2, [sp, #0x40]
	str r3, [sp, #0x44]
_080D6668:
	ldr r0, [sp, #0x40]
	ldr r1, [sp, #0x44]
	mov r2, ip
	str r0, [r2, #0xc]
	str r1, [r2, #0x10]
_080D6672:
	mov r1, ip
_080D6674:
	adds r0, r1, #0
	bl sub_080D5D64
	add sp, #0x48
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_080D6680: .4byte 0x00000000
_080D6684: .4byte 0x10000000

	THUMB_FUNC_START __fpcmp_parts_d
__fpcmp_parts_d: @ 0x080D6688
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	movs r0, #0
	ldr r1, [r5]
	cmp r1, #1
	bhi _080D6698
	movs r0, #1
_080D6698:
	cmp r0, #0
	bne _080D66AA
	movs r0, #0
	ldr r2, [r6]
	cmp r2, #1
	bhi _080D66A6
	movs r0, #1
_080D66A6:
	cmp r0, #0
	beq _080D66AE
_080D66AA:
	movs r0, #1
	b _080D6784
_080D66AE:
	movs r0, #0
	cmp r1, #4
	bne _080D66B6
	movs r0, #1
_080D66B6:
	cmp r0, #0
	beq _080D66CE
	movs r0, #0
	cmp r2, #4
	bne _080D66C2
	movs r0, #1
_080D66C2:
	cmp r0, #0
	beq _080D66CE
	ldr r0, [r6, #4]
	ldr r1, [r5, #4]
	subs r0, r0, r1
	b _080D6784
_080D66CE:
	movs r1, #0
	ldr r0, [r5]
	cmp r0, #4
	bne _080D66D8
	movs r1, #1
_080D66D8:
	cmp r1, #0
	bne _080D6726
	movs r1, #0
	cmp r2, #4
	bne _080D66E4
	movs r1, #1
_080D66E4:
	cmp r1, #0
	beq _080D66F6
_080D66E8:
	ldr r0, [r6, #4]
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, #0
	beq _080D6730
	movs r1, #1
	b _080D6730
_080D66F6:
	movs r1, #0
	cmp r0, #2
	bne _080D66FE
	movs r1, #1
_080D66FE:
	cmp r1, #0
	beq _080D670E
	movs r1, #0
	cmp r2, #2
	bne _080D670A
	movs r1, #1
_080D670A:
	cmp r1, #0
	bne _080D6782
_080D670E:
	movs r1, #0
	cmp r0, #2
	bne _080D6716
	movs r1, #1
_080D6716:
	cmp r1, #0
	bne _080D66E8
	movs r0, #0
	cmp r2, #2
	bne _080D6722
	movs r0, #1
_080D6722:
	cmp r0, #0
	beq _080D6734
_080D6726:
	ldr r0, [r5, #4]
	movs r1, #1
	cmp r0, #0
	beq _080D6730
	subs r1, #2
_080D6730:
	adds r0, r1, #0
	b _080D6784
_080D6734:
	ldr r0, [r6, #4]
	ldr r4, [r5, #4]
	cmp r4, r0
	beq _080D6746
_080D673C:
	movs r0, #1
	cmp r4, #0
	beq _080D6784
	subs r0, #2
	b _080D6784
_080D6746:
	ldr r1, [r5, #8]
	ldr r0, [r6, #8]
	cmp r1, r0
	bgt _080D673C
	cmp r1, r0
	bge _080D675E
_080D6752:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r4, #0
	beq _080D6784
	movs r0, #1
	b _080D6784
_080D675E:
	ldr r3, [r5, #0x10]
	ldr r2, [r6, #0x10]
	cmp r3, r2
	bhi _080D673C
	cmp r3, r2
	bne _080D6772
	ldr r1, [r5, #0xc]
	ldr r0, [r6, #0xc]
	cmp r1, r0
	bhi _080D673C
_080D6772:
	cmp r2, r3
	bhi _080D6752
	cmp r2, r3
	bne _080D6782
	ldr r1, [r6, #0xc]
	ldr r0, [r5, #0xc]
	cmp r1, r0
	bhi _080D6752
_080D6782:
	movs r0, #0
_080D6784:
	pop {r4, r5, r6, pc}
	.byte 0x00, 0x00

	THUMB_FUNC_START __cmpdf2
__cmpdf2: @ 0x080D6788
	push {r4, lr}
	sub sp, #0x38
	str r0, [sp, #0x28]
	str r1, [sp, #0x2c]
	str r2, [sp, #0x30]
	str r3, [sp, #0x34]
	add r0, sp, #0x28
	mov r1, sp
	bl __unpack_d
	add r0, sp, #0x30
	add r4, sp, #0x14
	adds r1, r4, #0
	bl __unpack_d
	mov r0, sp
	adds r1, r4, #0
	bl __fpcmp_parts_d
	add sp, #0x38
	pop {r4, pc}
	.byte 0x00, 0x00

	THUMB_FUNC_START __eqdf2
__eqdf2: @ 0x080D67B4
	push {r4, lr}
	sub sp, #0x38
	str r0, [sp, #0x28]
	str r1, [sp, #0x2c]
	str r2, [sp, #0x30]
	str r3, [sp, #0x34]
	add r0, sp, #0x28
	mov r1, sp
	bl __unpack_d
	add r0, sp, #0x30
	add r4, sp, #0x14
	adds r1, r4, #0
	bl __unpack_d
	movs r1, #0
	ldr r0, [sp]
	cmp r0, #1
	bhi _080D67DC
	movs r1, #1
_080D67DC:
	cmp r1, #0
	bne _080D67EE
	movs r1, #0
	ldr r0, [sp, #0x14]
	cmp r0, #1
	bhi _080D67EA
	movs r1, #1
_080D67EA:
	cmp r1, #0
	beq _080D67F2
_080D67EE:
	movs r0, #1
	b _080D67FA
_080D67F2:
	mov r0, sp
	adds r1, r4, #0
	bl __fpcmp_parts_d
_080D67FA:
	add sp, #0x38
	pop {r4, pc}
	.byte 0x00, 0x00

	THUMB_FUNC_START __nedf2
__nedf2: @ 0x080D6800
	push {r4, lr}
	sub sp, #0x38
	str r0, [sp, #0x28]
	str r1, [sp, #0x2c]
	str r2, [sp, #0x30]
	str r3, [sp, #0x34]
	add r0, sp, #0x28
	mov r1, sp
	bl __unpack_d
	add r0, sp, #0x30
	add r4, sp, #0x14
	adds r1, r4, #0
	bl __unpack_d
	movs r1, #0
	ldr r0, [sp]
	cmp r0, #1
	bhi _080D6828
	movs r1, #1
_080D6828:
	cmp r1, #0
	bne _080D683A
	movs r1, #0
	ldr r0, [sp, #0x14]
	cmp r0, #1
	bhi _080D6836
	movs r1, #1
_080D6836:
	cmp r1, #0
	beq _080D683E
_080D683A:
	movs r0, #1
	b _080D6846
_080D683E:
	mov r0, sp
	adds r1, r4, #0
	bl __fpcmp_parts_d
_080D6846:
	add sp, #0x38
	pop {r4, pc}
	.byte 0x00, 0x00

	THUMB_FUNC_START __gtdf2
__gtdf2: @ 0x080D684C
	push {r4, lr}
	sub sp, #0x38
	str r0, [sp, #0x28]
	str r1, [sp, #0x2c]
	str r2, [sp, #0x30]
	str r3, [sp, #0x34]
	add r0, sp, #0x28
	mov r1, sp
	bl __unpack_d
	add r0, sp, #0x30
	add r4, sp, #0x14
	adds r1, r4, #0
	bl __unpack_d
	movs r1, #0
	ldr r0, [sp]
	cmp r0, #1
	bhi _080D6874
	movs r1, #1
_080D6874:
	cmp r1, #0
	bne _080D6886
	movs r1, #0
	ldr r0, [sp, #0x14]
	cmp r0, #1
	bhi _080D6882
	movs r1, #1
_080D6882:
	cmp r1, #0
	beq _080D688C
_080D6886:
	movs r0, #1
	rsbs r0, r0, #0
	b _080D6894
_080D688C:
	mov r0, sp
	adds r1, r4, #0
	bl __fpcmp_parts_d
_080D6894:
	add sp, #0x38
	pop {r4, pc}

	THUMB_FUNC_START __gedf2
__gedf2: @ 0x080D6898
	push {r4, lr}
	sub sp, #0x38
	str r0, [sp, #0x28]
	str r1, [sp, #0x2c]
	str r2, [sp, #0x30]
	str r3, [sp, #0x34]
	add r0, sp, #0x28
	mov r1, sp
	bl __unpack_d
	add r0, sp, #0x30
	add r4, sp, #0x14
	adds r1, r4, #0
	bl __unpack_d
	movs r1, #0
	ldr r0, [sp]
	cmp r0, #1
	bhi _080D68C0
	movs r1, #1
_080D68C0:
	cmp r1, #0
	bne _080D68D2
	movs r1, #0
	ldr r0, [sp, #0x14]
	cmp r0, #1
	bhi _080D68CE
	movs r1, #1
_080D68CE:
	cmp r1, #0
	beq _080D68D8
_080D68D2:
	movs r0, #1
	rsbs r0, r0, #0
	b _080D68E0
_080D68D8:
	mov r0, sp
	adds r1, r4, #0
	bl __fpcmp_parts_d
_080D68E0:
	add sp, #0x38
	pop {r4, pc}

	THUMB_FUNC_START __ltdf2
__ltdf2: @ 0x080D68E4
	push {r4, lr}
	sub sp, #0x38
	str r0, [sp, #0x28]
	str r1, [sp, #0x2c]
	str r2, [sp, #0x30]
	str r3, [sp, #0x34]
	add r0, sp, #0x28
	mov r1, sp
	bl __unpack_d
	add r0, sp, #0x30
	add r4, sp, #0x14
	adds r1, r4, #0
	bl __unpack_d
	movs r1, #0
	ldr r0, [sp]
	cmp r0, #1
	bhi _080D690C
	movs r1, #1
_080D690C:
	cmp r1, #0
	bne _080D691E
	movs r1, #0
	ldr r0, [sp, #0x14]
	cmp r0, #1
	bhi _080D691A
	movs r1, #1
_080D691A:
	cmp r1, #0
	beq _080D6922
_080D691E:
	movs r0, #1
	b _080D692A
_080D6922:
	mov r0, sp
	adds r1, r4, #0
	bl __fpcmp_parts_d
_080D692A:
	add sp, #0x38
	pop {r4, pc}
	.byte 0x00, 0x00

	THUMB_FUNC_START __ledf2
__ledf2: @ 0x080D6930
	push {r4, lr}
	sub sp, #0x38
	str r0, [sp, #0x28]
	str r1, [sp, #0x2c]
	str r2, [sp, #0x30]
	str r3, [sp, #0x34]
	add r0, sp, #0x28
	mov r1, sp
	bl __unpack_d
	add r0, sp, #0x30
	add r4, sp, #0x14
	adds r1, r4, #0
	bl __unpack_d
	movs r1, #0
	ldr r0, [sp]
	cmp r0, #1
	bhi _080D6958
	movs r1, #1
_080D6958:
	cmp r1, #0
	bne _080D696A
	movs r1, #0
	ldr r0, [sp, #0x14]
	cmp r0, #1
	bhi _080D6966
	movs r1, #1
_080D6966:
	cmp r1, #0
	beq _080D696E
_080D696A:
	movs r0, #1
	b _080D6976
_080D696E:
	mov r0, sp
	adds r1, r4, #0
	bl __fpcmp_parts_d
_080D6976:
	add sp, #0x38
	pop {r4, pc}
	.byte 0x00, 0x00

	THUMB_FUNC_START __floatsidf
__floatsidf: @ 0x080D697C
	push {r4, r5, lr}
	sub sp, #0x14
	adds r2, r0, #0
	movs r0, #3
	str r0, [sp]
	lsrs r1, r2, #0x1f
	str r1, [sp, #4]
	cmp r2, #0
	bne _080D6994
	movs r0, #2
	str r0, [sp]
	b _080D69EA
_080D6994:
	movs r0, #0x3c
	str r0, [sp, #8]
	cmp r1, #0
	beq _080D69BA
	movs r0, #0x80
	lsls r0, r0, #0x18
	cmp r2, r0
	bne _080D69B4
	ldr r1, _080D69B0 @ 0x00000000
	ldr r0, _080D69AC @ 0xC1E00000
	b _080D69F0
	.align 2, 0
_080D69AC: .4byte 0xC1E00000
_080D69B0: .4byte 0x00000000
_080D69B4:
	rsbs r0, r2, #0
	asrs r1, r0, #0x1f
	b _080D69BE
_080D69BA:
	adds r0, r2, #0
	asrs r1, r2, #0x1f
_080D69BE:
	str r0, [sp, #0xc]
	str r1, [sp, #0x10]
	ldr r0, [sp, #0x10]
	ldr r1, _080D69F4 @ 0x0FFFFFFF
	cmp r0, r1
	bhi _080D69EA
	adds r5, r1, #0
	ldr r4, [sp, #8]
_080D69CE:
	ldr r0, [sp, #0xc]
	ldr r1, [sp, #0x10]
	lsrs r3, r0, #0x1f
	lsls r2, r1, #1
	adds r1, r3, #0
	orrs r1, r2
	lsls r0, r0, #1
	str r0, [sp, #0xc]
	str r1, [sp, #0x10]
	subs r4, #1
	ldr r0, [sp, #0x10]
	cmp r0, r5
	bls _080D69CE
	str r4, [sp, #8]
_080D69EA:
	mov r0, sp
	bl sub_080D5D64
_080D69F0:
	add sp, #0x14
	pop {r4, r5, pc}
	.align 2, 0
_080D69F4: .4byte 0x0FFFFFFF

	THUMB_FUNC_START __fixdfsi
__fixdfsi: @ 0x080D69F8
	push {lr}
	sub sp, #0x1c
	str r0, [sp, #0x14]
	str r1, [sp, #0x18]
	add r0, sp, #0x14
	mov r1, sp
	bl __unpack_d
	movs r1, #0
	ldr r0, [sp]
	cmp r0, #2
	bne _080D6A12
	movs r1, #1
_080D6A12:
	cmp r1, #0
	bne _080D6A46
	movs r1, #0
	cmp r0, #1
	bhi _080D6A1E
	movs r1, #1
_080D6A1E:
	cmp r1, #0
	bne _080D6A46
	movs r1, #0
	cmp r0, #4
	bne _080D6A2A
	movs r1, #1
_080D6A2A:
	cmp r1, #0
	beq _080D6A40
_080D6A2E:
	ldr r0, [sp, #4]
	ldr r1, _080D6A3C @ 0x7FFFFFFF
	cmp r0, #0
	beq _080D6A64
	adds r1, #1
	b _080D6A64
	.align 2, 0
_080D6A3C: .4byte 0x7FFFFFFF
_080D6A40:
	ldr r0, [sp, #8]
	cmp r0, #0
	bge _080D6A4A
_080D6A46:
	movs r0, #0
	b _080D6A66
_080D6A4A:
	cmp r0, #0x1e
	bgt _080D6A2E
	movs r2, #0x3c
	subs r2, r2, r0
	ldr r0, [sp, #0xc]
	ldr r1, [sp, #0x10]
	bl .gcc2_compiled._49
	adds r1, r0, #0
	ldr r0, [sp, #4]
	cmp r0, #0
	beq _080D6A64
	rsbs r1, r1, #0
_080D6A64:
	adds r0, r1, #0
_080D6A66:
	add sp, #0x1c
	pop {pc}
	.byte 0x00, 0x00

	THUMB_FUNC_START __negdf2
__negdf2: @ 0x080D6A6C
	push {lr}
	sub sp, #0x1c
	str r0, [sp, #0x14]
	str r1, [sp, #0x18]
	add r0, sp, #0x14
	mov r1, sp
	bl __unpack_d
	movs r1, #0
	ldr r0, [sp, #4]
	cmp r0, #0
	bne _080D6A86
	movs r1, #1
_080D6A86:
	str r1, [sp, #4]
	mov r0, sp
	bl sub_080D5D64
	add sp, #0x1c
	pop {pc}
	.byte 0x00, 0x00

	THUMB_FUNC_START __make_dp
__make_dp: @ 0x080D6A94
	sub sp, #4
	push {r4, lr}
	sub sp, #0x14
	str r3, [sp, #0x1c]
	ldr r3, [sp, #0x1c]
	ldr r4, [sp, #0x20]
	str r0, [sp]
	str r1, [sp, #4]
	str r2, [sp, #8]
	str r3, [sp, #0xc]
	str r4, [sp, #0x10]
	mov r0, sp
	bl sub_080D5D64
	add sp, #0x14
	pop {r4}
	pop {r3}
	add sp, #4
	bx r3
	.byte 0x00, 0x00

	THUMB_FUNC_START __truncdfsf2
__truncdfsf2: @ 0x080D6ABC
	push {r4, r5, lr}
	sub sp, #0x1c
	str r0, [sp, #0x14]
	str r1, [sp, #0x18]
	add r0, sp, #0x14
	mov r1, sp
	bl __unpack_d
	ldr r2, [sp, #0xc]
	ldr r3, [sp, #0x10]
	lsls r5, r3, #2
	lsrs r4, r2, #0x1e
	adds r0, r5, #0
	orrs r0, r4
	adds r5, r0, #0
	ldr r4, _080D6AFC @ 0x3FFFFFFF
	adds r0, r2, #0
	ands r0, r4
	movs r1, #0
	orrs r0, r1
	cmp r0, #0
	beq _080D6AEC
	movs r0, #1
	orrs r5, r0
_080D6AEC:
	ldr r0, [sp]
	ldr r1, [sp, #4]
	ldr r2, [sp, #8]
	adds r3, r5, #0
	bl __make_fp
	add sp, #0x1c
	pop {r4, r5, pc}
	.align 2, 0
_080D6AFC: .4byte 0x3FFFFFFF

	THUMB_FUNC_START .gcc2_compiled._48
.gcc2_compiled._48: @ 0x080D6B00
	push {r4, r5, r6, lr}
	ldr r2, [r0, #0xc]
	ldr r6, [r0, #4]
	movs r5, #0
	movs r1, #0
	ldr r3, [r0]
	cmp r3, #1
	bhi _080D6B12
	movs r1, #1
_080D6B12:
	cmp r1, #0
	beq _080D6B20
	movs r5, #0xff
	movs r0, #0x80
	lsls r0, r0, #0xd
	orrs r2, r0
	b _080D6B86
_080D6B20:
	movs r1, #0
	cmp r3, #4
	bne _080D6B28
	movs r1, #1
_080D6B28:
	cmp r1, #0
	bne _080D6B5C
	movs r1, #0
	cmp r3, #2
	bne _080D6B34
	movs r1, #1
_080D6B34:
	cmp r1, #0
	beq _080D6B3C
	movs r2, #0
	b _080D6B86
_080D6B3C:
	cmp r2, #0
	beq _080D6B86
	ldr r0, [r0, #8]
	movs r3, #0x7e
	rsbs r3, r3, #0
	cmp r0, r3
	bge _080D6B58
	subs r0, r3, r0
	cmp r0, #0x19
	ble _080D6B54
	movs r2, #0
	b _080D6B84
_080D6B54:
	lsrs r2, r0
	b _080D6B84
_080D6B58:
	cmp r0, #0x7f
	ble _080D6B62
_080D6B5C:
	movs r5, #0xff
	movs r2, #0
	b _080D6B86
_080D6B62:
	adds r5, r0, #0
	adds r5, #0x7f
	movs r0, #0x7f
	ands r0, r2
	cmp r0, #0x40
	bne _080D6B7A
	movs r0, #0x80
	ands r0, r2
	cmp r0, #0
	beq _080D6B7C
	adds r2, #0x40
	b _080D6B7C
_080D6B7A:
	adds r2, #0x3f
_080D6B7C:
	cmp r2, #0
	bge _080D6B84
	lsrs r2, r2, #1
	adds r5, #1
_080D6B84:
	lsrs r2, r2, #7
_080D6B86:
	ldr r0, _080D6BA8 @ 0x007FFFFF
	ands r2, r0
	ldr r0, _080D6BAC @ 0xFF800000
	ands r4, r0
	orrs r4, r2
	movs r0, #0xff
	ands r5, r0
	lsls r1, r5, #0x17
	ldr r0, _080D6BB0 @ 0x807FFFFF
	ands r4, r0
	orrs r4, r1
	lsls r1, r6, #0x1f
	ldr r0, _080D6BB4 @ 0x7FFFFFFF
	ands r4, r0
	orrs r4, r1
	adds r0, r4, #0
	pop {r4, r5, r6, pc}
	.align 2, 0
_080D6BA8: .4byte 0x007FFFFF
_080D6BAC: .4byte 0xFF800000
_080D6BB0: .4byte 0x807FFFFF
_080D6BB4: .4byte 0x7FFFFFFF

	THUMB_FUNC_START __unpack_f
__unpack_f: @ 0x080D6BB8
	push {r4, lr}
	adds r3, r1, #0
	ldr r0, [r0]
	lsls r1, r0, #9
	lsrs r2, r1, #9
	lsls r1, r0, #1
	lsrs r1, r1, #0x18
	lsrs r0, r0, #0x1f
	str r0, [r3, #4]
	cmp r1, #0
	bne _080D6BFC
	cmp r2, #0
	bne _080D6BD8
	movs r0, #2
	str r0, [r3]
	b _080D6C30
_080D6BD8:
	adds r4, r1, #0
	subs r4, #0x7e
	str r4, [r3, #8]
	lsls r2, r2, #7
	movs r0, #3
	str r0, [r3]
	ldr r1, _080D6BF8 @ 0x3FFFFFFF
	cmp r2, r1
	bhi _080D6C18
	adds r0, r4, #0
_080D6BEC:
	lsls r2, r2, #1
	subs r0, #1
	cmp r2, r1
	bls _080D6BEC
	str r0, [r3, #8]
	b _080D6C18
	.align 2, 0
_080D6BF8: .4byte 0x3FFFFFFF
_080D6BFC:
	cmp r1, #0xff
	bne _080D6C1C
	cmp r2, #0
	bne _080D6C0A
	movs r0, #4
	str r0, [r3]
	b _080D6C30
_080D6C0A:
	movs r0, #0x80
	lsls r0, r0, #0xd
	ands r0, r2
	cmp r0, #0
	beq _080D6C16
	movs r0, #1
_080D6C16:
	str r0, [r3]
_080D6C18:
	str r2, [r3, #0xc]
	b _080D6C30
_080D6C1C:
	adds r0, r1, #0
	subs r0, #0x7f
	str r0, [r3, #8]
	movs r0, #3
	str r0, [r3]
	lsls r0, r2, #7
	movs r1, #0x80
	lsls r1, r1, #0x17
	orrs r0, r1
	str r0, [r3, #0xc]
_080D6C30:
	pop {r4, pc}
	.byte 0x00, 0x00

	THUMB_FUNC_START _fpadd_parts_0
_fpadd_parts_0: @ 0x080D6C34
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	adds r7, r1, #0
	adds r5, r2, #0
	movs r0, #0
	ldr r2, [r6]
	cmp r2, #1
	bhi _080D6C4A
	movs r0, #1
_080D6C4A:
	cmp r0, #0
	beq _080D6C52
_080D6C4E:
	adds r0, r6, #0
	b _080D6DA8
_080D6C52:
	movs r1, #0
	ldr r0, [r7]
	cmp r0, #1
	bhi _080D6C5C
	movs r1, #1
_080D6C5C:
	cmp r1, #0
	bne _080D6CD0
	movs r1, #0
	cmp r2, #4
	bne _080D6C68
	movs r1, #1
_080D6C68:
	cmp r1, #0
	beq _080D6C88
	movs r1, #0
	cmp r0, #4
	bne _080D6C74
	movs r1, #1
_080D6C74:
	cmp r1, #0
	beq _080D6C4E
	ldr r1, [r6, #4]
	ldr r0, [r7, #4]
	cmp r1, r0
	beq _080D6C4E
	ldr r0, _080D6C84 @ 0x03002C50
	b _080D6DA8
	.align 2, 0
_080D6C84: .4byte 0x03002C50
_080D6C88:
	movs r1, #0
	cmp r0, #4
	bne _080D6C90
	movs r1, #1
_080D6C90:
	cmp r1, #0
	bne _080D6CD0
	movs r1, #0
	cmp r0, #2
	bne _080D6C9C
	movs r1, #1
_080D6C9C:
	cmp r1, #0
	beq _080D6CC2
	movs r0, #0
	cmp r2, #2
	bne _080D6CA8
	movs r0, #1
_080D6CA8:
	cmp r0, #0
	beq _080D6C4E
	adds r1, r5, #0
	adds r0, r6, #0
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldr r0, [r0]
	str r0, [r1]
	ldr r0, [r6, #4]
	ldr r1, [r7, #4]
	ands r0, r1
	str r0, [r5, #4]
	b _080D6DA6
_080D6CC2:
	movs r1, #0
	ldr r0, [r6]
	cmp r0, #2
	bne _080D6CCC
	movs r1, #1
_080D6CCC:
	cmp r1, #0
	beq _080D6CD4
_080D6CD0:
	adds r0, r7, #0
	b _080D6DA8
_080D6CD4:
	ldr r1, [r6, #8]
	ldr r3, [r7, #8]
	ldr r2, [r6, #0xc]
	ldr r4, [r7, #0xc]
	subs r0, r1, r3
	cmp r0, #0
	bge _080D6CE4
	rsbs r0, r0, #0
_080D6CE4:
	cmp r0, #0x1f
	bgt _080D6D28
	ldr r6, [r6, #4]
	ldr r7, [r7, #4]
	mov r8, r7
	cmp r1, r3
	ble _080D6D0A
	movs r7, #1
	mov ip, r7
	subs r3, r1, r3
_080D6CF8:
	subs r3, #1
	adds r0, r4, #0
	mov r7, ip
	ands r0, r7
	lsrs r4, r4, #1
	orrs r4, r0
	cmp r3, #0
	bne _080D6CF8
	adds r3, r1, #0
_080D6D0A:
	cmp r3, r1
	ble _080D6D3A
	movs r0, #1
	mov ip, r0
	subs r1, r3, r1
_080D6D14:
	subs r1, #1
	adds r0, r2, #0
	mov r7, ip
	ands r0, r7
	lsrs r2, r2, #1
	orrs r2, r0
	cmp r1, #0
	bne _080D6D14
	adds r1, r3, #0
	b _080D6D3A
_080D6D28:
	cmp r1, r3
	ble _080D6D30
	movs r4, #0
	b _080D6D34
_080D6D30:
	adds r1, r3, #0
	movs r2, #0
_080D6D34:
	ldr r6, [r6, #4]
	ldr r7, [r7, #4]
	mov r8, r7
_080D6D3A:
	cmp r6, r8
	beq _080D6D84
	cmp r6, #0
	beq _080D6D46
	subs r3, r4, r2
	b _080D6D48
_080D6D46:
	subs r3, r2, r4
_080D6D48:
	cmp r3, #0
	blt _080D6D56
	movs r0, #0
	str r0, [r5, #4]
	str r1, [r5, #8]
	str r3, [r5, #0xc]
	b _080D6D60
_080D6D56:
	movs r0, #1
	str r0, [r5, #4]
	str r1, [r5, #8]
	rsbs r0, r3, #0
	str r0, [r5, #0xc]
_080D6D60:
	ldr r1, [r5, #0xc]
	subs r0, r1, #1
	ldr r2, _080D6D80 @ 0x3FFFFFFE
	cmp r0, r2
	bhi _080D6D8C
_080D6D6A:
	lsls r0, r1, #1
	str r0, [r5, #0xc]
	ldr r1, [r5, #8]
	subs r1, #1
	str r1, [r5, #8]
	adds r1, r0, #0
	subs r0, r1, #1
	cmp r0, r2
	bls _080D6D6A
	b _080D6D8C
	.align 2, 0
_080D6D80: .4byte 0x3FFFFFFE
_080D6D84:
	str r6, [r5, #4]
	str r1, [r5, #8]
	adds r0, r2, r4
	str r0, [r5, #0xc]
_080D6D8C:
	movs r0, #3
	str r0, [r5]
	ldr r1, [r5, #0xc]
	cmp r1, #0
	bge _080D6DA6
	movs r0, #1
	ands r0, r1
	lsrs r1, r1, #1
	orrs r0, r1
	str r0, [r5, #0xc]
	ldr r0, [r5, #8]
	adds r0, #1
	str r0, [r5, #8]
_080D6DA6:
	adds r0, r5, #0
_080D6DA8:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7, pc}
	.byte 0x00, 0x00

	THUMB_FUNC_START __addsf3
__addsf3: @ 0x080D6DB0
	push {r4, lr}
	sub sp, #0x38
	str r0, [sp, #0x30]
	str r1, [sp, #0x34]
	add r0, sp, #0x30
	mov r1, sp
	bl __unpack_f
	add r0, sp, #0x34
	add r4, sp, #0x10
	adds r1, r4, #0
	bl __unpack_f
	add r2, sp, #0x20
	mov r0, sp
	adds r1, r4, #0
	bl _fpadd_parts_0
	bl .gcc2_compiled._48
	add sp, #0x38
	pop {r4, pc}

	THUMB_FUNC_START __subsf3
__subsf3: @ 0x080D6DDC
	push {r4, lr}
	sub sp, #0x38
	str r0, [sp, #0x30]
	str r1, [sp, #0x34]
	add r0, sp, #0x30
	mov r1, sp
	bl __unpack_f
	add r0, sp, #0x34
	add r4, sp, #0x10
	adds r1, r4, #0
	bl __unpack_f
	ldr r0, [r4, #4]
	movs r1, #1
	eors r0, r1
	str r0, [r4, #4]
	add r2, sp, #0x20
	mov r0, sp
	adds r1, r4, #0
	bl _fpadd_parts_0
	bl .gcc2_compiled._48
	add sp, #0x38
	pop {r4, pc}

	THUMB_FUNC_START __mulsf3
__mulsf3: @ 0x080D6E10
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0x38
	str r0, [sp, #0x30]
	str r1, [sp, #0x34]
	add r0, sp, #0x30
	mov r1, sp
	bl __unpack_f
	add r0, sp, #0x34
	add r4, sp, #0x10
	adds r1, r4, #0
	bl __unpack_f
	mov r7, sp
	add r0, sp, #0x20
	mov r8, r0
	movs r0, #0
	ldr r1, [sp]
	mov sb, r8
	cmp r1, #1
	bhi _080D6E42
	movs r0, #1
_080D6E42:
	cmp r0, #0
	bne _080D6EA0
	movs r2, #0
	ldr r0, [sp, #0x10]
	cmp r0, #1
	bhi _080D6E50
	movs r2, #1
_080D6E50:
	cmp r2, #0
	beq _080D6E58
	ldr r0, [sp, #4]
	b _080D6EC0
_080D6E58:
	movs r2, #0
	cmp r1, #4
	bne _080D6E60
	movs r2, #1
_080D6E60:
	cmp r2, #0
	beq _080D6E72
	movs r1, #0
	cmp r0, #2
	bne _080D6E6C
	movs r1, #1
_080D6E6C:
	cmp r1, #0
	bne _080D6E8A
	b _080D6EA0
_080D6E72:
	movs r2, #0
	cmp r0, #4
	bne _080D6E7A
	movs r2, #1
_080D6E7A:
	cmp r2, #0
	beq _080D6E94
	movs r0, #0
	cmp r1, #2
	bne _080D6E86
	movs r0, #1
_080D6E86:
	cmp r0, #0
	beq _080D6EBE
_080D6E8A:
	ldr r0, _080D6E90 @ 0x03002C50
	b _080D6F62
	.align 2, 0
_080D6E90: .4byte 0x03002C50
_080D6E94:
	movs r2, #0
	cmp r1, #2
	bne _080D6E9C
	movs r2, #1
_080D6E9C:
	cmp r2, #0
	beq _080D6EB2
_080D6EA0:
	ldr r0, [sp, #4]
	ldr r1, [sp, #0x14]
	eors r0, r1
	rsbs r1, r0, #0
	orrs r1, r0
	lsrs r1, r1, #0x1f
	str r1, [sp, #4]
	mov r0, sp
	b _080D6F62
_080D6EB2:
	movs r1, #0
	cmp r0, #2
	bne _080D6EBA
	movs r1, #1
_080D6EBA:
	cmp r1, #0
	beq _080D6ED0
_080D6EBE:
	ldr r0, [r7, #4]
_080D6EC0:
	ldr r1, [sp, #0x14]
	eors r0, r1
	rsbs r1, r0, #0
	orrs r1, r0
	lsrs r1, r1, #0x1f
	str r1, [sp, #0x14]
	adds r0, r4, #0
	b _080D6F62
_080D6ED0:
	ldr r0, [r7, #0xc]
	movs r1, #0
	ldr r2, [sp, #0x1c]
	movs r3, #0
	bl .gcc2_compiled._46
	adds r2, r1, #0
	adds r5, r2, #0
	adds r6, r0, #0
	ldr r4, [r7, #8]
	ldr r0, [sp, #0x18]
	adds r4, r4, r0
	str r4, [sp, #0x28]
	ldr r1, [r7, #4]
	ldr r0, [sp, #0x14]
	eors r1, r0
	rsbs r0, r1, #0
	orrs r0, r1
	lsrs r0, r0, #0x1f
	str r0, [sp, #0x24]
	adds r4, #2
	str r4, [sp, #0x28]
	cmp r2, #0
	bge _080D6F1C
	movs r2, #1
	movs r1, #0x80
	lsls r1, r1, #0x18
_080D6F06:
	adds r4, #1
	adds r0, r5, #0
	ands r0, r2
	cmp r0, #0
	beq _080D6F14
	lsrs r6, r6, #1
	orrs r6, r1
_080D6F14:
	lsrs r5, r5, #1
	cmp r5, #0
	blt _080D6F06
	str r4, [sp, #0x28]
_080D6F1C:
	ldr r0, _080D6F70 @ 0x3FFFFFFF
	cmp r5, r0
	bhi _080D6F42
	movs r4, #0x80
	lsls r4, r4, #0x18
	movs r3, #1
	adds r2, r0, #0
	ldr r1, [sp, #0x28]
_080D6F2C:
	subs r1, #1
	lsls r5, r5, #1
	adds r0, r6, #0
	ands r0, r4
	cmp r0, #0
	beq _080D6F3A
	orrs r5, r3
_080D6F3A:
	lsls r6, r6, #1
	cmp r5, r2
	bls _080D6F2C
	str r1, [sp, #0x28]
_080D6F42:
	movs r0, #0x7f
	ands r0, r5
	cmp r0, #0x40
	bne _080D6F58
	movs r0, #0x80
	ands r0, r5
	cmp r0, #0
	bne _080D6F56
	cmp r6, #0
	beq _080D6F58
_080D6F56:
	adds r5, #0x40
_080D6F58:
	str r5, [sp, #0x2c]
	movs r0, #3
	mov r1, r8
	str r0, [r1]
	mov r0, sb
_080D6F62:
	bl .gcc2_compiled._48
	add sp, #0x38
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_080D6F70: .4byte 0x3FFFFFFF

	THUMB_FUNC_START __divsf3
__divsf3: @ 0x080D6F74
	push {r4, r5, r6, lr}
	sub sp, #0x28
	str r0, [sp, #0x20]
	str r1, [sp, #0x24]
	add r0, sp, #0x20
	mov r1, sp
	bl __unpack_f
	add r0, sp, #0x24
	add r5, sp, #0x10
	adds r1, r5, #0
	bl __unpack_f
	mov r4, sp
	movs r0, #0
	ldr r3, [sp]
	cmp r3, #1
	bhi _080D6F9A
	movs r0, #1
_080D6F9A:
	cmp r0, #0
	beq _080D6FA2
	mov r1, sp
	b _080D7054
_080D6FA2:
	movs r0, #0
	ldr r2, [sp, #0x10]
	adds r6, r2, #0
	cmp r2, #1
	bhi _080D6FAE
	movs r0, #1
_080D6FAE:
	cmp r0, #0
	beq _080D6FB6
	adds r1, r5, #0
	b _080D7054
_080D6FB6:
	ldr r0, [sp, #4]
	ldr r1, [sp, #0x14]
	eors r0, r1
	str r0, [sp, #4]
	movs r0, #0
	cmp r3, #4
	bne _080D6FC6
	movs r0, #1
_080D6FC6:
	cmp r0, #0
	bne _080D6FD6
	movs r0, #0
	cmp r3, #2
	bne _080D6FD2
	movs r0, #1
_080D6FD2:
	cmp r0, #0
	beq _080D6FE8
_080D6FD6:
	ldr r0, [r4]
	adds r1, r4, #0
	cmp r0, r6
	bne _080D7054
	ldr r1, _080D6FE4 @ 0x03002C50
	b _080D7054
	.align 2, 0
_080D6FE4: .4byte 0x03002C50
_080D6FE8:
	movs r1, #0
	cmp r2, #4
	bne _080D6FF0
	movs r1, #1
_080D6FF0:
	cmp r1, #0
	beq _080D6FFC
	str r0, [sp, #0xc]
	str r0, [sp, #8]
	mov r1, sp
	b _080D7054
_080D6FFC:
	movs r0, #0
	cmp r2, #2
	bne _080D7004
	movs r0, #1
_080D7004:
	cmp r0, #0
	beq _080D700E
	movs r0, #4
	str r0, [r4]
	b _080D7052
_080D700E:
	ldr r1, [r4, #8]
	ldr r0, [sp, #0x18]
	subs r0, r1, r0
	str r0, [r4, #8]
	ldr r2, [r4, #0xc]
	ldr r3, [sp, #0x1c]
	cmp r2, r3
	bhs _080D7024
	lsls r2, r2, #1
	subs r0, #1
	str r0, [r4, #8]
_080D7024:
	movs r0, #0x80
	lsls r0, r0, #0x17
	movs r1, #0
_080D702A:
	cmp r2, r3
	blo _080D7032
	orrs r1, r0
	subs r2, r2, r3
_080D7032:
	lsrs r0, r0, #1
	lsls r2, r2, #1
	cmp r0, #0
	bne _080D702A
	movs r0, #0x7f
	ands r0, r1
	cmp r0, #0x40
	bne _080D7050
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _080D704E
	cmp r2, #0
	beq _080D7050
_080D704E:
	adds r1, #0x40
_080D7050:
	str r1, [r4, #0xc]
_080D7052:
	adds r1, r4, #0
_080D7054:
	adds r0, r1, #0
	bl .gcc2_compiled._48
	add sp, #0x28
	pop {r4, r5, r6, pc}
	.byte 0x00, 0x00

	THUMB_FUNC_START __fpcmp_parts_f
__fpcmp_parts_f: @ 0x080D7060
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0
	ldr r2, [r4]
	cmp r2, #1
	bhi _080D706E
	movs r0, #1
_080D706E:
	cmp r0, #0
	bne _080D7080
	movs r0, #0
	ldr r3, [r1]
	cmp r3, #1
	bhi _080D707C
	movs r0, #1
_080D707C:
	cmp r0, #0
	beq _080D7084
_080D7080:
	movs r0, #1
	b _080D7142
_080D7084:
	movs r0, #0
	cmp r2, #4
	bne _080D708C
	movs r0, #1
_080D708C:
	cmp r0, #0
	beq _080D70A4
	movs r0, #0
	cmp r3, #4
	bne _080D7098
	movs r0, #1
_080D7098:
	cmp r0, #0
	beq _080D70A4
	ldr r0, [r1, #4]
	ldr r1, [r4, #4]
	subs r0, r0, r1
	b _080D7142
_080D70A4:
	movs r2, #0
	ldr r0, [r4]
	cmp r0, #4
	bne _080D70AE
	movs r2, #1
_080D70AE:
	cmp r2, #0
	bne _080D70FC
	movs r2, #0
	cmp r3, #4
	bne _080D70BA
	movs r2, #1
_080D70BA:
	cmp r2, #0
	beq _080D70CC
_080D70BE:
	ldr r0, [r1, #4]
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, #0
	beq _080D7106
	movs r1, #1
	b _080D7106
_080D70CC:
	movs r2, #0
	cmp r0, #2
	bne _080D70D4
	movs r2, #1
_080D70D4:
	cmp r2, #0
	beq _080D70E4
	movs r2, #0
	cmp r3, #2
	bne _080D70E0
	movs r2, #1
_080D70E0:
	cmp r2, #0
	bne _080D7140
_080D70E4:
	movs r2, #0
	cmp r0, #2
	bne _080D70EC
	movs r2, #1
_080D70EC:
	cmp r2, #0
	bne _080D70BE
	movs r0, #0
	cmp r3, #2
	bne _080D70F8
	movs r0, #1
_080D70F8:
	cmp r0, #0
	beq _080D710A
_080D70FC:
	ldr r0, [r4, #4]
	movs r1, #1
	cmp r0, #0
	beq _080D7106
	subs r1, #2
_080D7106:
	adds r0, r1, #0
	b _080D7142
_080D710A:
	ldr r3, [r4, #4]
	ldr r0, [r1, #4]
	cmp r3, r0
	beq _080D711C
_080D7112:
	movs r0, #1
	cmp r3, #0
	beq _080D7142
	subs r0, #2
	b _080D7142
_080D711C:
	ldr r2, [r4, #8]
	ldr r0, [r1, #8]
	cmp r2, r0
	bgt _080D7112
	cmp r2, r0
	bge _080D7134
_080D7128:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r3, #0
	beq _080D7142
	movs r0, #1
	b _080D7142
_080D7134:
	ldr r0, [r4, #0xc]
	ldr r1, [r1, #0xc]
	cmp r0, r1
	bhi _080D7112
	cmp r0, r1
	blo _080D7128
_080D7140:
	movs r0, #0
_080D7142:
	pop {r4, pc}

	THUMB_FUNC_START __cmpsf2
__cmpsf2: @ 0x080D7144
	push {r4, lr}
	sub sp, #0x28
	str r0, [sp, #0x20]
	str r1, [sp, #0x24]
	add r0, sp, #0x20
	mov r1, sp
	bl __unpack_f
	add r0, sp, #0x24
	add r4, sp, #0x10
	adds r1, r4, #0
	bl __unpack_f
	mov r0, sp
	adds r1, r4, #0
	bl __fpcmp_parts_f
	add sp, #0x28
	pop {r4, pc}
	.byte 0x00, 0x00

	THUMB_FUNC_START __eqsf2
__eqsf2: @ 0x080D716C
	push {r4, lr}
	sub sp, #0x28
	str r0, [sp, #0x20]
	str r1, [sp, #0x24]
	add r0, sp, #0x20
	mov r1, sp
	bl __unpack_f
	add r0, sp, #0x24
	add r4, sp, #0x10
	adds r1, r4, #0
	bl __unpack_f
	movs r1, #0
	ldr r0, [sp]
	cmp r0, #1
	bhi _080D7190
	movs r1, #1
_080D7190:
	cmp r1, #0
	bne _080D71A2
	movs r1, #0
	ldr r0, [sp, #0x10]
	cmp r0, #1
	bhi _080D719E
	movs r1, #1
_080D719E:
	cmp r1, #0
	beq _080D71A6
_080D71A2:
	movs r0, #1
	b _080D71AE
_080D71A6:
	mov r0, sp
	adds r1, r4, #0
	bl __fpcmp_parts_f
_080D71AE:
	add sp, #0x28
	pop {r4, pc}
	.byte 0x00, 0x00

	THUMB_FUNC_START __nesf2
__nesf2: @ 0x080D71B4
	push {r4, lr}
	sub sp, #0x28
	str r0, [sp, #0x20]
	str r1, [sp, #0x24]
	add r0, sp, #0x20
	mov r1, sp
	bl __unpack_f
	add r0, sp, #0x24
	add r4, sp, #0x10
	adds r1, r4, #0
	bl __unpack_f
	movs r1, #0
	ldr r0, [sp]
	cmp r0, #1
	bhi _080D71D8
	movs r1, #1
_080D71D8:
	cmp r1, #0
	bne _080D71EA
	movs r1, #0
	ldr r0, [sp, #0x10]
	cmp r0, #1
	bhi _080D71E6
	movs r1, #1
_080D71E6:
	cmp r1, #0
	beq _080D71EE
_080D71EA:
	movs r0, #1
	b _080D71F6
_080D71EE:
	mov r0, sp
	adds r1, r4, #0
	bl __fpcmp_parts_f
_080D71F6:
	add sp, #0x28
	pop {r4, pc}
	.byte 0x00, 0x00

	THUMB_FUNC_START __gtsf2
__gtsf2: @ 0x080D71FC
	push {r4, lr}
	sub sp, #0x28
	str r0, [sp, #0x20]
	str r1, [sp, #0x24]
	add r0, sp, #0x20
	mov r1, sp
	bl __unpack_f
	add r0, sp, #0x24
	add r4, sp, #0x10
	adds r1, r4, #0
	bl __unpack_f
	movs r1, #0
	ldr r0, [sp]
	cmp r0, #1
	bhi _080D7220
	movs r1, #1
_080D7220:
	cmp r1, #0
	bne _080D7232
	movs r1, #0
	ldr r0, [sp, #0x10]
	cmp r0, #1
	bhi _080D722E
	movs r1, #1
_080D722E:
	cmp r1, #0
	beq _080D7238
_080D7232:
	movs r0, #1
	rsbs r0, r0, #0
	b _080D7240
_080D7238:
	mov r0, sp
	adds r1, r4, #0
	bl __fpcmp_parts_f
_080D7240:
	add sp, #0x28
	pop {r4, pc}

	THUMB_FUNC_START __gesf2
__gesf2: @ 0x080D7244
	push {r4, lr}
	sub sp, #0x28
	str r0, [sp, #0x20]
	str r1, [sp, #0x24]
	add r0, sp, #0x20
	mov r1, sp
	bl __unpack_f
	add r0, sp, #0x24
	add r4, sp, #0x10
	adds r1, r4, #0
	bl __unpack_f
	movs r1, #0
	ldr r0, [sp]
	cmp r0, #1
	bhi _080D7268
	movs r1, #1
_080D7268:
	cmp r1, #0
	bne _080D727A
	movs r1, #0
	ldr r0, [sp, #0x10]
	cmp r0, #1
	bhi _080D7276
	movs r1, #1
_080D7276:
	cmp r1, #0
	beq _080D7280
_080D727A:
	movs r0, #1
	rsbs r0, r0, #0
	b _080D7288
_080D7280:
	mov r0, sp
	adds r1, r4, #0
	bl __fpcmp_parts_f
_080D7288:
	add sp, #0x28
	pop {r4, pc}

	THUMB_FUNC_START __ltsf2
__ltsf2: @ 0x080D728C
	push {r4, lr}
	sub sp, #0x28
	str r0, [sp, #0x20]
	str r1, [sp, #0x24]
	add r0, sp, #0x20
	mov r1, sp
	bl __unpack_f
	add r0, sp, #0x24
	add r4, sp, #0x10
	adds r1, r4, #0
	bl __unpack_f
	movs r1, #0
	ldr r0, [sp]
	cmp r0, #1
	bhi _080D72B0
	movs r1, #1
_080D72B0:
	cmp r1, #0
	bne _080D72C2
	movs r1, #0
	ldr r0, [sp, #0x10]
	cmp r0, #1
	bhi _080D72BE
	movs r1, #1
_080D72BE:
	cmp r1, #0
	beq _080D72C6
_080D72C2:
	movs r0, #1
	b _080D72CE
_080D72C6:
	mov r0, sp
	adds r1, r4, #0
	bl __fpcmp_parts_f
_080D72CE:
	add sp, #0x28
	pop {r4, pc}
	.byte 0x00, 0x00

	THUMB_FUNC_START __lesf2
__lesf2: @ 0x080D72D4
	push {r4, lr}
	sub sp, #0x28
	str r0, [sp, #0x20]
	str r1, [sp, #0x24]
	add r0, sp, #0x20
	mov r1, sp
	bl __unpack_f
	add r0, sp, #0x24
	add r4, sp, #0x10
	adds r1, r4, #0
	bl __unpack_f
	movs r1, #0
	ldr r0, [sp]
	cmp r0, #1
	bhi _080D72F8
	movs r1, #1
_080D72F8:
	cmp r1, #0
	bne _080D730A
	movs r1, #0
	ldr r0, [sp, #0x10]
	cmp r0, #1
	bhi _080D7306
	movs r1, #1
_080D7306:
	cmp r1, #0
	beq _080D730E
_080D730A:
	movs r0, #1
	b _080D7316
_080D730E:
	mov r0, sp
	adds r1, r4, #0
	bl __fpcmp_parts_f
_080D7316:
	add sp, #0x28
	pop {r4, pc}
	.byte 0x00, 0x00

	THUMB_FUNC_START __floatsisf
__floatsisf: @ 0x080D731C
	push {lr}
	sub sp, #0x10
	adds r1, r0, #0
	movs r0, #3
	str r0, [sp]
	lsrs r2, r1, #0x1f
	str r2, [sp, #4]
	cmp r1, #0
	bne _080D7334
	movs r0, #2
	str r0, [sp]
	b _080D736C
_080D7334:
	movs r0, #0x1e
	str r0, [sp, #8]
	cmp r2, #0
	beq _080D7352
	movs r0, #0x80
	lsls r0, r0, #0x18
	cmp r1, r0
	bne _080D734C
	ldr r0, _080D7348 @ 0xCF000000
	b _080D7372
	.align 2, 0
_080D7348: .4byte 0xCF000000
_080D734C:
	rsbs r0, r1, #0
	str r0, [sp, #0xc]
	b _080D7354
_080D7352:
	str r1, [sp, #0xc]
_080D7354:
	ldr r2, [sp, #0xc]
	ldr r3, _080D7378 @ 0x3FFFFFFF
	cmp r2, r3
	bhi _080D736C
	ldr r1, [sp, #8]
_080D735E:
	lsls r0, r2, #1
	subs r1, #1
	adds r2, r0, #0
	cmp r0, r3
	bls _080D735E
	str r1, [sp, #8]
	str r0, [sp, #0xc]
_080D736C:
	mov r0, sp
	bl .gcc2_compiled._48
_080D7372:
	add sp, #0x10
	pop {pc}
	.align 2, 0
_080D7378: .4byte 0x3FFFFFFF

	THUMB_FUNC_START __fixsfsi
__fixsfsi: @ 0x080D737C
	push {lr}
	sub sp, #0x14
	str r0, [sp, #0x10]
	add r0, sp, #0x10
	mov r1, sp
	bl __unpack_f
	movs r1, #0
	ldr r0, [sp]
	cmp r0, #2
	bne _080D7394
	movs r1, #1
_080D7394:
	cmp r1, #0
	bne _080D73C6
	movs r1, #0
	cmp r0, #1
	bhi _080D73A0
	movs r1, #1
_080D73A0:
	cmp r1, #0
	bne _080D73C6
	movs r1, #0
	cmp r0, #4
	bne _080D73AC
	movs r1, #1
_080D73AC:
	cmp r1, #0
	beq _080D73C0
_080D73B0:
	ldr r0, [sp, #4]
	ldr r1, _080D73BC @ 0x7FFFFFFF
	cmp r0, #0
	beq _080D73DE
	adds r1, #1
	b _080D73DE
	.align 2, 0
_080D73BC: .4byte 0x7FFFFFFF
_080D73C0:
	ldr r1, [sp, #8]
	cmp r1, #0
	bge _080D73CA
_080D73C6:
	movs r0, #0
	b _080D73E0
_080D73CA:
	cmp r1, #0x1e
	bgt _080D73B0
	movs r0, #0x1e
	subs r0, r0, r1
	ldr r1, [sp, #0xc]
	lsrs r1, r0
	ldr r0, [sp, #4]
	cmp r0, #0
	beq _080D73DE
	rsbs r1, r1, #0
_080D73DE:
	adds r0, r1, #0
_080D73E0:
	add sp, #0x14
	pop {pc}

	THUMB_FUNC_START __negsf2
__negsf2: @ 0x080D73E4
	push {lr}
	sub sp, #0x14
	str r0, [sp, #0x10]
	add r0, sp, #0x10
	mov r1, sp
	bl __unpack_f
	movs r1, #0
	ldr r0, [sp, #4]
	cmp r0, #0
	bne _080D73FC
	movs r1, #1
_080D73FC:
	str r1, [sp, #4]
	mov r0, sp
	bl .gcc2_compiled._48
	add sp, #0x14
	pop {pc}

	THUMB_FUNC_START __make_fp
__make_fp: @ 0x080D7408
	push {lr}
	sub sp, #0x10
	str r0, [sp]
	str r1, [sp, #4]
	str r2, [sp, #8]
	str r3, [sp, #0xc]
	mov r0, sp
	bl .gcc2_compiled._48
	add sp, #0x10
	pop {pc}
	.byte 0x00, 0x00

	THUMB_FUNC_START __extendsfdf2
__extendsfdf2: @ 0x080D7420
	push {r4, r5, r6, lr}
	sub sp, #0x18
	str r0, [sp, #0x14]
	add r0, sp, #0x14
	add r1, sp, #4
	bl __unpack_f
	ldr r0, [sp, #4]
	ldr r1, [sp, #8]
	ldr r2, [sp, #0xc]
	ldr r3, [sp, #0x10]
	movs r4, #0
	lsrs r6, r3, #2
	lsls r5, r4, #0x1e
	adds r4, r6, #0
	orrs r4, r5
	lsls r3, r3, #0x1e
	str r4, [sp]
	bl __make_dp
	add sp, #0x18
	pop {r4, r5, r6, pc}

	THUMB_FUNC_START .gcc2_compiled._49
.gcc2_compiled._49: @ 0x080D744C
	push {r4, r5, r6, lr}
	adds r6, r1, #0
	adds r5, r0, #0
	cmp r2, #0
	beq _080D747C
	movs r0, #0x20
	subs r0, r0, r2
	cmp r0, #0
	bgt _080D7468
	movs r4, #0
	rsbs r0, r0, #0
	adds r3, r6, #0
	lsrs r3, r0
	b _080D7478
_080D7468:
	adds r1, r6, #0
	lsls r1, r0
	adds r4, r6, #0
	lsrs r4, r2
	adds r0, r5, #0
	lsrs r0, r2
	adds r3, r0, #0
	orrs r3, r1
_080D7478:
	adds r1, r4, #0
	adds r0, r3, #0
_080D747C:
	pop {r4, r5, r6, pc}
	.byte 0x00, 0x00

	THUMB_FUNC_START sub_080D7480
sub_080D7480: @ 0x080D7480
	push {r4, lr}
	rsbs r2, r0, #0
	adds r3, r2, #0
	rsbs r1, r1, #0
	cmp r2, #0
	beq _080D748E
	subs r1, #1
_080D748E:
	adds r4, r1, #0
	adds r1, r4, #0
	adds r0, r3, #0
	pop {r4, pc}
	.byte 0x00, 0x00

	THUMB_FUNC_START ClearOAMBuffer
ClearOAMBuffer: @ 0x080D7498
	bx pc
	.byte 0xC0, 0x46, 0x98, 0xA3, 0xFC, 0xEA

	THUMB_FUNC_START CallARM_FillTileRect
CallARM_FillTileRect: @ 0x080D74A0
	bx pc
	.byte 0xC0, 0x46, 0xE4, 0xA3, 0xFC, 0xEA

	THUMB_FUNC_START TileMap_FillRect
TileMap_FillRect: @ 0x080D74A8
	bx pc
	.byte 0xC0, 0x46, 0xBD, 0xA3, 0xFC, 0xEA

	THUMB_FUNC_START sub_80D74B0
sub_80D74B0: @ 0x080D74B0
	bx pc
	.byte 0xC0, 0x46, 0x5E, 0xA3, 0xFC, 0xEA

	THUMB_FUNC_START TileMap_CopyRect
TileMap_CopyRect: @ 0x080D74B8
	bx pc
	.byte 0xC0, 0x46, 0xC7, 0xA3, 0xFC, 0xEA

	THUMB_FUNC_START sub_80D74C0
sub_80D74C0: @ 0x080D74C0
	bx pc
    .byte 0xC0, 0x46, 0xA5, 0xA3, 0xFC, 0xEA
