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
	bl sub_80CF8EA
	ldr r0, [sp, #0x18]
_080CF50A:
	ldr r3, [r0, #0x28]
	bl sub_80CF8EA
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
_080CF534: .4byte gUnknown_03007FF0
_080CF538: .4byte 0x68736D53
_080CF53C: .4byte gUnknown_03002C61
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

	ARM_FUNC_START sub_80CF6E4
sub_80CF6E4: @ 0x080CF6E4
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
sub_80CF8EA: @ 0x080CF8EA
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
_080CF988: .4byte gUnknown_08207190

	THUMB_FUNC_START sub_80CF98C
sub_80CF98C: @ 0x080CF98C
	ldr r2, [r1, #0x40]
sub_80CF98E: @ 0x080CF98E
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
	bl sub_80CF98E
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

	THUMB_FUNC_START sub_80CFDC0
sub_80CFDC0: @ 0x080CFDC0
	bx r3
	.byte 0x00, 0x00, 0x04, 0x74, 0x20, 0x08
_080CFDC8: .4byte gUnknown_03007FF0
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
	bl sub_80CFDC0
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
_080CFE10: .4byte gUnknown_03007FF0

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
	bl sub_80CFDC0
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
_080D003C: .4byte gUnknown_03007FF0
_080D0040: .4byte gUnknown_08207404

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
_080D0130: .4byte gUnknown_08207220
_080D0134: .4byte gUnknown_082072D4
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
_080D01CC: .4byte sub_80CF54C
_080D01D0: .4byte gUnknown_03002C60
_080D01D4: .4byte 0x04000100
_080D01D8: .4byte gUnknown_03005410
_080D01DC: .4byte gUnknown_03006510
_080D01E0: .4byte 0x0094D700
_080D01E4: .4byte 0x00000009
_080D01E8: .4byte gUnknown_08224404
_080D01EC: .4byte gUnknown_03006710

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
_080D0220: .4byte gUnknown_08224404
_080D0224: .4byte gUnknown_08224470
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
_080D02F4: .4byte gUnknown_08224404
_080D02F8: .4byte gUnknown_08224470
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
_080D0508: .4byte gUnknown_03007FF0
_080D050C: .4byte 0x68736D53
_080D0510: .4byte gUnknown_03006480
_080D0514: .4byte ply_memacc
_080D0518: .4byte sub_80D00AC
_080D051C: .4byte sub_80D00C0
_080D0520: .4byte ply_xcmd
_080D0524: .4byte sub_80D0044
_080D0528: .4byte sub_80D0670
_080D052C: .4byte sub_80CFDD0
_080D0530: .4byte sub_80D0A54
_080D0534: .4byte sub_80D0B1C
_080D0538: .4byte sub_80D0D30
_080D053C: .4byte sub_80D0C78
_080D0540: .4byte sub_80D0BD0
_080D0544: .4byte 0x00000000
_080D0548: .4byte 0x05000040
	.byte 0x2A, 0xDF, 0x70, 0x47

	THUMB_FUNC_START sub_80D0550
sub_80D0550: @ 0x080D0550
	push {lr}
	ldr r1, _080D0560 @ 0x03006508
	ldr r1, [r1]
	bl _call_via_r1
	pop {r0}
	bx r0
	.align 2, 0
_080D0560: .4byte gUnknown_03006508

	THUMB_FUNC_START sub_80D0564
sub_80D0564: @ 0x080D0564
	push {lr}
	ldr r1, _080D0574 @ 0x0300650C
	ldr r1, [r1]
	bl _call_via_r1
	pop {r0}
	bx r0
	.align 2, 0
_080D0574: .4byte gUnknown_0300650C

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
_080D0658: .4byte gUnknown_03007FF0
_080D065C: .4byte 0x050003EC
_080D0660: .4byte sub_80CFE44
_080D0664: .4byte DummyFunc
_080D0668: .4byte gUnknown_03006480
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
	bl __divsi3
	strb r0, [r4, #0xb]
	ldr r0, _080D06F8 @ 0x00091D1B
	muls r0, r5, r0
	ldr r1, _080D06FC @ 0x00001388
	adds r0, r0, r1
	ldr r1, _080D0700 @ 0x00002710
	bl __divsi3
	adds r1, r0, #0
	str r1, [r4, #0x14]
	movs r0, #0x80
	lsls r0, r0, #0x11
	bl __divsi3
	adds r0, #1
	asrs r0, r0, #1
	str r0, [r4, #0x18]
	ldr r0, _080D0704 @ 0x04000102
	strh r6, [r0]
	ldr r4, _080D0708 @ 0x04000100
	ldr r0, _080D070C @ 0x00044940
	adds r1, r5, #0
	bl __divsi3
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
_080D06F0: .4byte gUnknown_03007FF0
_080D06F4: .4byte gUnknown_08207304
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
_080D07A0: .4byte gUnknown_03007FF0
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
_080D0860: .4byte gUnknown_03007FF0
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
_080D08AC: .4byte gUnknown_03007FF0
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
_080D0924: .4byte gUnknown_03007FF0
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
_080D0C04: .4byte gUnknown_082073B8
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
_080D0C70: .4byte gUnknown_0820731C
_080D0C74: .4byte gUnknown_082073A0

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
_080D0D50: .4byte gUnknown_03007FF0
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
_080D1124: .4byte gUnknown_082073F4
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

	THUMB_FUNC_START ply_memacc
ply_memacc: @ 0x080D13F0
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
	ldr r1, _080D1420 @ _080D1424
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080D1420: .4byte _080D1424
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
	bl _call_via_r2
	b _080D1542
	.align 2, 0
_080D1538: .4byte gUnknown_03006484
_080D153C:
	ldr r0, [r6, #0x40]
	adds r0, #4
	str r0, [r6, #0x40]
_080D1542:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_START ply_xcmd
ply_xcmd: @ 0x080D1548
	push {lr}
	ldr r2, [r1, #0x40]
	ldrb r3, [r2]
	adds r2, #1
	str r2, [r1, #0x40]
	ldr r2, _080D1564 @ 0x08207438
	lsls r3, r3, #2
	adds r3, r3, r2
	ldr r2, [r3]
	bl _call_via_r2
	pop {r0}
	bx r0
	.align 2, 0
_080D1564: .4byte gUnknown_08207438

	THUMB_FUNC_START ply_xxx
ply_xxx: @ 0x080D1568
	push {lr}
	ldr r2, _080D1578 @ 0x03006480
	ldr r2, [r2]
	bl _call_via_r2
	pop {r0}
	bx r0
	.align 2, 0
_080D1578: .4byte gUnknown_03006480

	THUMB_FUNC_START ply_xwave
ply_xwave: @ 0x080D157C
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

	THUMB_FUNC_START ply_xtype
ply_xtype: @ 0x080D15C4
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

	THUMB_FUNC_START ply_xatta
ply_xatta: @ 0x080D15D8
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

	THUMB_FUNC_START ply_xdeca
ply_xdeca: @ 0x080D15EC
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

	THUMB_FUNC_START ply_xsust
ply_xsust: @ 0x080D1600
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

	THUMB_FUNC_START ply_xrele
ply_xrele: @ 0x080D1614
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

	THUMB_FUNC_START ply_xiecv
ply_xiecv: @ 0x080D1628
	ldr r0, [r1, #0x40]
	ldrb r2, [r0]
	strb r2, [r1, #0x1e]
	adds r0, #1
	str r0, [r1, #0x40]
	bx lr

	THUMB_FUNC_START ply_xiecl
ply_xiecl: @ 0x080D1634
	ldr r0, [r1, #0x40]
	ldrb r2, [r0]
	strb r2, [r1, #0x1f]
	adds r0, #1
	str r0, [r1, #0x40]
	bx lr

	THUMB_FUNC_START ply_xleng
ply_xleng: @ 0x080D1640
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

	THUMB_FUNC_START ply_xswee
ply_xswee: @ 0x080D1654
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

	THUMB_FUNC_START DummyFunc
DummyFunc: @ 0x080D1668
	bx lr
	.byte 0x00, 0x00
