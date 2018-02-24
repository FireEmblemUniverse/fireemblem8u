	.include "macro.inc"
	.include "gba.inc"
	.include "m4a.inc"

	.syntax unified

	.bss

@	.global gUnknown_030007B8
@gUnknown_030007B8:
@	.space 0x770

	.text

	thumb_func_start umul3232H32
umul3232H32:
	adr r2, __umul3232H32
	bx r2
	.arm
__umul3232H32:
	umull r2, r3, r0, r1
	add r0, r3, 0
	bx lr
	thumb_func_end umul3232H32

	THUMB_FUNC_START SoundMain
SoundMain: @ 0x080CF4C8
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

	THUMB_FUNC_START SoundMainRAM
SoundMainRAM: @ 0x080CF54C
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

	THUMB_FUNC_START MPlayJumpTableCopy
MPlayJumpTableCopy: @ 0x080CF958
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

	THUMB_FUNC_START MPlayMain
MPlayMain:
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

	THUMB_FUNC_START TrackStop
TrackStop: @ 0x080CFDD0
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

	THUMB_FUNC_START ply_note
ply_note: @ 0x080CFE44
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
	bl ClearChain
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
	bl TrkVolPitSet
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
	bl MidiKeyToFreq
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

	THUMB_FUNC_START ply_endtie
ply_endtie: @ 0x080D0044
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

	THUMB_FUNC_START ply_lfos
ply_lfos: @ 0x080D00AC
	mov ip, lr
	bl sub_80D00A0
	strb r3, [r1, #0x19]
	cmp r3, #0
	bne _080D00BC
	bl sub_80D0084
_080D00BC:
	bx ip
	.byte 0x00, 0x00

	THUMB_FUNC_START ply_mod
ply_mod: @ 0x080D00C0
	mov ip, lr
	bl sub_80D00A0
	strb r3, [r1, #0x17]
	cmp r3, #0
	bne _080D00D0
	bl sub_80D0084
_080D00D0:
	bx ip
	.byte 0x00, 0x00
