    .section .rodata

	.global gUnknown_08205E18
gUnknown_08205E18:  @ 0x08205E18
@ replacing .incbin "baserom.gba", 0x00205e18, 0x10
.4byte ProcScr_UntransparentWindow + 0x18
.4byte ProcScr_UntransparentWindow + 0x50
.4byte ProcScr_UntransparentWindow + 0x88
.4byte ProcScr_UntransparentWindow + 0xc0

	.global gUnknown_08205E28
gUnknown_08205E28:  @ 0x08205E28
@ Replacing .incbin "baserom.gba", 0x205E28, 0x10
    .4byte ProcScr_UntransparentWindow + 0xf8
    .4byte ProcScr_UntransparentWindow + 0xf8
    .4byte ProcScr_UntransparentWindow + 0x10c
    .4byte ProcScr_UntransparentWindow + 0x10c
