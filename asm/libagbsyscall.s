    .INCLUDE "macro.inc"

    .SYNTAX unified

	THUMB_FUNC_START ArcTan2
ArcTan2: @ 0x080D166C
	swi #0xa
	bx lr

	THUMB_FUNC_START BgAffineSet
BgAffineSet: @ 0x080D1670
	swi #0xe
	bx lr

	THUMB_FUNC_START CpuFastSet
CpuFastSet: @ 0x080D1674
	swi #0xc
	bx lr

	THUMB_FUNC_START CpuSet
CpuSet: @ 0x080D1678
	swi #0xb
	bx lr

	THUMB_FUNC_START Div
Div: @ 0x080D167C
	swi #6
	bx lr

	THUMB_FUNC_START DivArm
DivArm: @ 0x080D1680
	swi #7
	bx lr

	THUMB_FUNC_START SVC_Modulo
SVC_Modulo: @ 0x080D1684
	swi #6
	adds r0, r1, #0
	bx lr
	.byte 0x00, 0x00

	THUMB_FUNC_START HuffUnComp
HuffUnComp: @ 0x080D168C
	swi #0x13
	bx lr

	THUMB_FUNC_START LZ77UnCompVram
LZ77UnCompVram: @ 0x080D1690
	swi #0x12
	bx lr

	THUMB_FUNC_START LZ77UnCompWram
LZ77UnCompWram: @ 0x080D1694
	swi #0x11
	bx lr

	THUMB_FUNC_START SVC_Multiboot
SVC_Multiboot: @ 0x080D1698
	movs r1, #1
	swi #0x25
	bx lr
	.byte 0x00, 0x00

	THUMB_FUNC_START ObjAffineSet
ObjAffineSet: @ 0x080D16A0
	swi #0xf
	bx lr

	THUMB_FUNC_START RLUnCompVram
RLUnCompVram: @ 0x080D16A4
	swi #0x15
	bx lr

	THUMB_FUNC_START RLUnCompWram
RLUnCompWram: @ 0x080D16A8
	swi #0x14
	bx lr

	THUMB_FUNC_START RegisterRamReset
RegisterRamReset: @ 0x080D16AC
	swi #1
	bx lr

	THUMB_FUNC_START sub_80D16B0
sub_80D16B0: @ 0x080D16B0
	ldr r3, _080D16C0 @ 0x04000208
	movs r2, #0
	strb r2, [r3]
	ldr r1, _080D16C4 @ 0x03007F00
	mov sp, r1
	swi #1
	swi #0
	movs r0, r0
	.align 2, 0
_080D16C0: .4byte 0x04000208
_080D16C4: .4byte gUnknown_03007F00

	THUMB_FUNC_START SoundBiasReset
SoundBiasReset: @ 0x080D16C8
	movs r0, #0
	swi #0x19
	bx lr
	.byte 0x00, 0x00

	THUMB_FUNC_START SoundBiasSet
SoundBiasSet: @ 0x080D16D0
	movs r0, #1
	swi #0x19
	bx lr
	.byte 0x00, 0x00

	THUMB_FUNC_START Sqrt
Sqrt: @ 0x080D16D8
	swi #8
	bx lr

	THUMB_FUNC_START SVC_VBlankIntrWait
SVC_VBlankIntrWait: @ 0x080D16DC
	movs r2, #0
	swi #5
	bx lr
	.byte 0x00, 0x00
