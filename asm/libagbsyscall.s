    .INCLUDE "macro.inc"
	.INCLUDE "gba.inc"

    .SYNTAX unified

	THUMB_FUNC_START ArcTan2
ArcTan2: @ 0x080D166C
	swi #0xa
	bx lr

	THUMB_FUNC_END ArcTan2

	THUMB_FUNC_START BgAffineSet
BgAffineSet: @ 0x080D1670
	swi #0xe
	bx lr

	THUMB_FUNC_END BgAffineSet

	THUMB_FUNC_START CpuFastSet
CpuFastSet: @ 0x080D1674
	swi #0xc
	bx lr

	THUMB_FUNC_END CpuFastSet

	THUMB_FUNC_START CpuSet
CpuSet: @ 0x080D1678
	swi #0xb
	bx lr

	THUMB_FUNC_END CpuSet

	THUMB_FUNC_START Div
Div: @ 0x080D167C
	swi #6
	bx lr

	THUMB_FUNC_END Div

	THUMB_FUNC_START DivArm
DivArm: @ 0x080D1680
	swi #7
	bx lr

	THUMB_FUNC_END DivArm

	THUMB_FUNC_START DivRem
DivRem: @ 0x080D1684
	swi #6
	adds r0, r1, #0
	bx lr

	THUMB_FUNC_END DivRem

	THUMB_FUNC_START HuffUnComp
HuffUnComp: @ 0x080D168C
	swi #0x13
	bx lr

	THUMB_FUNC_END HuffUnComp

	THUMB_FUNC_START LZ77UnCompVram
LZ77UnCompVram: @ 0x080D1690
	swi #0x12
	bx lr

	THUMB_FUNC_END LZ77UnCompVram

	THUMB_FUNC_START LZ77UnCompWram
LZ77UnCompWram: @ 0x080D1694
	swi #0x11
	bx lr

	THUMB_FUNC_END LZ77UnCompWram

	THUMB_FUNC_START MultiBoot
MultiBoot: @ 0x080D1698
	movs r1, #1
	swi #0x25
	bx lr

	THUMB_FUNC_END MultiBoot

	THUMB_FUNC_START ObjAffineSet
ObjAffineSet: @ 0x080D16A0
	swi #0xf
	bx lr

	THUMB_FUNC_END ObjAffineSet

	THUMB_FUNC_START RLUnCompVram
RLUnCompVram: @ 0x080D16A4
	swi #0x15
	bx lr

	THUMB_FUNC_END RLUnCompVram

	THUMB_FUNC_START RLUnCompWram
RLUnCompWram: @ 0x080D16A8
	swi #0x14
	bx lr

	THUMB_FUNC_END RLUnCompWram

	THUMB_FUNC_START RegisterRamReset
RegisterRamReset: @ 0x080D16AC
	swi #1
	bx lr

	THUMB_FUNC_END RegisterRamReset

	THUMB_FUNC_START SoftReset
SoftReset: @ 0x080D16B0
	ldr r3, =REG_IME
	movs r2, #0
	strb r2, [r3]
	ldr r1, =0x03007F00
	mov sp, r1
	swi #1
	swi #0
	.POOL

	THUMB_FUNC_END SoftReset

	THUMB_FUNC_START SoundBiasReset
SoundBiasReset: @ 0x080D16C8
	movs r0, #0
	swi #0x19
	bx lr

	THUMB_FUNC_END SoundBiasReset

	THUMB_FUNC_START SoundBiasSet
SoundBiasSet: @ 0x080D16D0
	movs r0, #1
	swi #0x19
	bx lr

	THUMB_FUNC_END SoundBiasSet

	THUMB_FUNC_START Sqrt
Sqrt: @ 0x080D16D8
	swi #8
	bx lr

	THUMB_FUNC_END Sqrt

	THUMB_FUNC_START VBlankIntrWait
VBlankIntrWait: @ 0x080D16DC
	movs r2, #0
	swi #5
	bx lr

	THUMB_FUNC_END VBlankIntrWait

	.align 2, 0
