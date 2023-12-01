	.section .data

	.global gUnknown_089A3AB8
gUnknown_089A3AB8:  @ 0x089A3AB8
@ replacing .incbin "baserom.gba", 0x009a3ab8, 0x84
.4byte Pal_089B4BFC + 0x20
.4byte Pal_089B4BFC + 0x84
.4byte Pal_089B4BFC + 0xec
.4byte Pal_089B4BFC + 0x168
.4byte Pal_089B4BFC + 0x1e0
.4byte Pal_089B4BFC + 0x250
.4byte Pal_089B4BFC + 0x2bc
.4byte Pal_089B4BFC + 0x330
.4byte Pal_089B4BFC + 0x3a8
.4byte Pal_089B4BFC + 0x420
.4byte Pal_089B4BFC + 0x498
.4byte Pal_089B4BFC + 0x51c
.4byte Pal_089B4BFC + 0x5a0
.4byte Pal_089B4BFC + 0x624
.4byte Pal_089B4BFC + 0x6a8
.4byte Pal_089B4BFC + 0x714
.4byte Pal_089B4BFC + 0x79c
.4byte Pal_089B4BFC + 0x838
.4byte Pal_089B4BFC + 0x8f4
.4byte Pal_089B4BFC + 0x9f0
.4byte Pal_089B4BFC + 0xb24
.4byte Pal_089B4BFC + 0xce0
.4byte Pal_089B4BFC + 0xf3c
.4byte Pal_089B4BFC + 0x1070
.4byte Pal_089B4BFC + 0x1210
.4byte Pal_089B4BFC + 0x1454
.4byte Pal_089B4BFC + 0x1578
.4byte Pal_089B4BFC + 0x1710
.4byte Pal_089B4BFC + 0x1914
.4byte Pal_089B4BFC + 0x19d8
.4byte Pal_089B4BFC + 0x1ac0
.4byte Pal_089B4BFC + 0x1c0c
.4byte Pal_089B4BFC + 0x1dc0

	.global gUnknown_089A3B3C
gUnknown_089A3B3C:  @ 0x089A3B3C
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_807D6D8
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_807D760
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word MapLatonafx_End
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_089A3B6C
gUnknown_089A3B6C:  @ 0x089A3B6C
	.incbin "baserom.gba", 0x9A3B6C, 0x18

	.global gUnknown_089A3B84
gUnknown_089A3B84:  @ 0x089A3B84
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_807D818
        @ PROC_SLEEP
        .short 0xe, 0x64
        .word 0x0
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_089A3BA4
gUnknown_089A3BA4:  @ 0x089A3BA4
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_807D860
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_807D944
        @ PROC_SLEEP
        .short 0xe, 0x1e
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_807D9B8
        @ PROC_CALL
        .short 0x2, 0x0
        .word MapLatonafx_End
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_089A3BDC
gUnknown_089A3BDC:  @ 0x089A3BDC
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_807DAE8
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_807DB30
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word MapLatonafx_End
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_089A3C0C
gUnknown_089A3C0C:  @ 0x089A3C0C
@ Replacing .incbin "baserom.gba", 0x9A3C0C, 0x18
    .4byte 0x03020100
    .4byte 0x03030303
    .4byte 0x03030303
    .4byte 0x04030303
    .4byte 0x08070605
    .4byte 0x0000ff09

	.global gUnknown_089A3C24
gUnknown_089A3C24:  @ 0x089A3C24
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_807DBE4
        @ PROC_SLEEP
        .short 0xe, 0x1e
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_807DCA8
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_807DD0C
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_807DD74
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_807DA68
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_089A3C6C
gUnknown_089A3C6C:  @ 0x089A3C6C
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_807DDC8
        @ PROC_SLEEP
        .short 0xe, 0x78
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word MapLatonafx_End
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_089A3C94
gUnknown_089A3C94:  @ 0x089A3C94
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_807DE80
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_807DE70
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_807DEDC
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_807DF5C
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_807DFAC
        @ PROC_CALL
        .short 0x2, 0x0
        .word MapLatonafx_End
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_089A3CD4
gUnknown_089A3CD4:  @ 0x089A3CD4
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_807DE80
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_807E038
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_807E054
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_807DF5C
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_807DFAC
        @ PROC_CALL
        .short 0x2, 0x0
        .word MapLatonafx_End
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_089A3D14
gUnknown_089A3D14:  @ 0x089A3D14
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_807E118
        @ PROC_SLEEP
        .short 0xe, 0x32
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_807E17C
        @ PROC_SLEEP
        .short 0xe, 0x32
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_807E1B0
        @ PROC_CALL
        .short 0x2, 0x0
        .word MapLatonafx_End
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_089A3D54
gUnknown_089A3D54:  @ 0x089A3D54
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_807E22C
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_807E28C
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_807E334
        @ PROC_SLEEP
        .short 0xe, 0x3c
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word MapLatonafx_End
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_089A3D8C
gUnknown_089A3D8C:  @ 0x089A3D8C
@ replacing .incbin "baserom.gba", 0x009a3d8c, 0x28
.4byte gUnknown_089B73D4 + 0x20
.4byte gUnknown_089B73D4 + 0x40
.4byte gUnknown_089B73D4 + 0x68
.4byte gUnknown_089B73D4 + 0x94
.4byte gUnknown_089B73D4 + 0xc8
.4byte gUnknown_089B73D4 + 0x100
.4byte gUnknown_089B73D4 + 0x140
.4byte gUnknown_089B73D4 + 0x180
.4byte gUnknown_089B73D4 + 0x1c8
.4byte gUnknown_089B73D4 + 0x204

	.global gUnknown_089A3DB4
gUnknown_089A3DB4:  @ 0x089A3DB4
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_807E390
        @ PROC_SLEEP
        .short 0xe, 0xa
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_807E404
        @ PROC_SLEEP
        .short 0xe, 0x3c
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_807E448
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_807DA68
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_089A3DFC
gUnknown_089A3DFC:  @ 0x089A3DFC
@ Replacing .incbin "baserom.gba", 0x9A3DFC, 0x8
    .4byte 0x08070604
    .4byte 0x00ff0908

	.global gUnknown_089A3E04
gUnknown_089A3E04:  @ 0x089A3E04
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_807E4D0
        @ PROC_SLEEP
        .short 0xe, 0x32
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_807E584
        @ PROC_SLEEP
        .short 0xe, 0x28
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_807E5F0
        @ PROC_CALL
        .short 0x2, 0x0
        .word MapLatonafx_End
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_089A3E44
gUnknown_089A3E44:  @ 0x089A3E44
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_807E67C
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_807E6E0
        @ PROC_CALL
        .short 0x2, 0x0
        .word MapLatonafx_End
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_089A3E6C
gUnknown_089A3E6C:  @ 0x089A3E6C
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_807E7E0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_807E8B0
        @ PROC_SLEEP
        .short 0xe, 0x50
        .word 0x0
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_807E934
        @ PROC_SLEEP
        .short 0xe, 0x1
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_807DA68
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_807E79C
        @ PROC_SLEEP
        .short 0xe, 0x4
        .word 0x0
        @ PROC_CALL
        .short 0x2, 0x0
        .word sub_807E7C4
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0


	.global gUnknown_089A3EC4
gUnknown_089A3EC4:  @ 0x089A3EC4
        @ PROC_REPEAT
        .short 0x3, 0x0
        .word sub_807EA60
        @ PROC_END
        .short 0x0, 0x0
        .word 0x0

